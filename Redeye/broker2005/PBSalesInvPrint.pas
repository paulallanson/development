unit PBSalesInvPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, PBPOObjects, DB, PBRPSalesInv, QrExport,
  IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBSalesInvPrintFrm = class(TForm)
    Label1: TLabel;
    InvoiceDateEdit: TEdit;
    SpeedButton1: TSpeedButton;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    SelectionGroup: TRadioGroup;
    CloseBitBtn: TBitBtn;
    Updatechk: TCheckBox;
    EmailBitBtn: TBitBtn;
    qryGetCustomers: TFDQuery;
    GetInvCustSQL: TFDQuery;
    GetCreditCustSQL: TFDQuery;
    SelectLst: TListBox;
    InvHeadSQL: TFDQuery;
    CreditHeadSQL: TFDQuery;
    qryInvEmail: TFDQuery;
    qryCreditEmail: TFDQuery;
    InvPrintSQL: TFDQuery;
    qryCheckInvoice: TFDQuery;
    chkbxPrintLogo: TCheckBox;
    chkbxShowZeroValues: TCheckBox;
    InvLineSQL: TFDQuery;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure InvoiceDateEditExit(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    bEmailSent: boolean;
    bTooManyRecs: boolean;
    FActivated: boolean;
    FCustomerName: string;
    FEmailAttachment : TstringList;
    FLineUp: Boolean;
    FInvoicePrint: boolean;
    sAttachmentType: string;
    FCreditNotePrint: boolean;
    procedure SetLineUp(const Value: Boolean);
    procedure CallReport(const bPreview: Boolean);
    procedure SetInvoicePrint(const Value: boolean);
    procedure EmailReport(const bPreview: boolean);
    procedure ClearEmailArray(Sender: TObject);
    procedure BuildEmailDetails;
    procedure GetSelection;
    procedure BuildSelection;
    procedure PrintToAttachment(PBRPSalesInvFrm: TPBRPSalesInvFrm;
      tempCode: string);
    function HasInvoiceBeenPrinted(tmpInvoice: integer): string;
    procedure SetCreditNotePrint(const Value: boolean);
    procedure ExportInvoice(PBRPSalesInvFrm: TPBRPSalesInvFrm;
      tempCode: string);
  public
    iCode: integer;
    iIntSelCode: Integer;
    property CreditNotePrint: boolean read FCreditNotePrint write SetCreditNotePrint;
    property LineUp : Boolean read FLineUp write SetLineUp;
    property InvoicePrint: boolean read FInvoicePrint write SetInvoicePrint;
  end;

var
  PBSalesInvPrintFrm: TPBSalesInvPrintFrm;
  EmailArray: array[1..100, 1..11] of string;
  iInvdate: TDateTime;

implementation

uses
  DateSelV5, CCSPrint, CCSemailHandler, PBEmailList, pbDatabase, pbMainMenu,
  ccsCommon, Printer.Tools;

{$R *.DFM}

procedure TPBSalesInvPrintFrm.SpeedButton1Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := iInvDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      iInvDate := DateSelV5Form.Date;
      InvoiceDateEdit.Text := PBDatestr(iInvDate);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBSalesInvPrintFrm.FormShow(Sender: TObject);
begin
(*  {Set the Invoice Date}
  if PBMaintSalesInvFrm.InvoiceSQL.FieldByName('Sales_Invoice_status').AsInteger
    <> 10 then
  begin
    selectiongroup.itemindex := 1;
    selectiongroup.Enabled := False;
  end;
*)
  InvoiceDateEdit.Text := PBDatestr(Date);
  iInvDate := Now;
  PrintBitBtn.SetFocus;
end;

procedure TPBSalesInvPrintFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

function TPBSalesInvPrintFrm.HasInvoiceBeenPrinted(tmpInvoice: integer): string;
begin
  with qryCheckInvoice do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tmpInvoice;
      open;

      result := fieldbyname('Sales_Invoice_no').asstring;
    end;
end;

procedure TPBSalesInvPrintFrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
  sInvoiceNo: string;
begin
  PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      if chkbxShowZeroValues.checked then
        PBRPSalesInvFrm.ShowZeroValues := 'Y'
      else
        PBRPSalesInvFrm.ShowZeroValues := 'N';

      {Print all lines of credit note}
      if self.CreditNotePrint then
        PBRPSalesInvFrm.ShowZeroValues := 'Y';

      PBRPSalesInvFrm.bPreview := bPreview;
      PBRPSalesInvFrm.bInvoice := InvoicePrint;
      PBRPSalesInvFrm.bPrintLogo := chkbxPrintLogo.Checked;
//      PBRPSalesInvfrm.PrinterSettings := PrinterSettings;
      PBRPSalesInvfrm.InvoiceDateLbl.Caption := InvoiceDateEdit.Text;
      {Extract the relevant data}
      if bPreview then
        PBRPSalesInvfrm.bUpdate := False
      else
        PBRPSalesInvfrm.bUpdate := Updatechk.Checked;

      if selectiongroup.itemindex = 0 then
        begin
          PBRPSalesInvfrm.bAll := False;
          sInvoiceNo := HasInvoiceBeenPrinted(iCode);
          if (sInvoiceNo <> '') then
            begin
              messagedlg('This invoice has already been printed, the invoice number is ' + sInvoiceNo + '. Refresh the screen to update the current list of invoices', mtError, [mbOK], 0);
              Exit;
            end;
        end
      else
        PBRPSalesInvfrm.bAll := True;

      PBRPSalesInvFrm.bLineUp := LineUp;
      PBRPSalesInvfrm.SelCode := iCode;


      PBRPSalesInvfrm.GetInvoiceData;
      if bPreview then
        PBRPSalesInvfrm.InvoiceReport.Preview
      else
        if SetupPrinter(PrinterSettings) then
          PBRPSalesInvfrm.InvoiceReport.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    PBRPSalesInvfrm.Free;
  end;
  close;
end;

procedure TPBSalesInvPrintFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBSalesInvPrintFrm.SetLineUp(const Value: Boolean);
begin
  FLineUp := Value;
end;

procedure TPBSalesInvPrintFrm.InvoiceDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(InvoiceDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      InvoiceDateEdit.SetFocus;
      Exit;
    end;
  end;

  InvoiceDateEdit.Text := PBDatestr(NewDate);
  iInvDate := NewDate;
end;

procedure TPBSalesInvPrintFrm.SetInvoicePrint(const Value: boolean);
begin
  FInvoicePrint := Value;
  if FInvoicePrint then
    begin
      Caption := 'Print Sales Invoices';
      SelectionGroup.caption := 'Invoice Selection';
      UpdateChk.Caption := 'Update invoice files'
    end
  else
    begin
      Caption := 'Print Credit Notes';
      SelectionGroup.caption := 'Credit Note Selection';
      UpdateChk.Caption := 'Update Credit Note files'
    end
end;

procedure TPBSalesInvPrintFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  dmBroker.bEmailSent := false;
  try
    ClearEmailArray(Self);
    EmailReport(false);
  finally
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
    if (frmPBMainMenu.EmailApplication = 'GENERIC') and dmBroker.bEmailSent then
      begin
        messagedlg('Emails have been added to your Email Server and will be sent shortly.', mtInformation, [mbOk], 0);
        close;
      end;
  end;
  if bEmailSent then
    close;
end;

procedure TPBSalesInvPrintFrm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TPBSalesInvPrintFrm.EmailReport(const bPreview: boolean);
var
  icount: integer;
  irow: integer;
  sTo, sSubject, sBodyText, sDescription, sSalutation: string;
  sSenderName, sSenderEmail, sRecipientName: string;
  SInvoiceNo: string;
begin
  bEmailSent := false;
  GetSelection;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the customer invocies send an email}
  PBEmailListFrm := TPBEmailListFrm.Create(Self);
  try
    PBEmailListFrm.CodeType := 'I';

    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 3] = '' then Break;
      PBEmailListFrm.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 5];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := EmailArray[icount, 9];
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 6];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := EmailArray[icount, 7];
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := EmailArray[icount, 8];


      {Set up the Email Array with the Customer/Branch/Contact}
      PBEmailListFrm.EmailContactArray[icount,1] := EmailArray[icount, 3];
      PBEmailListFrm.EmailContactArray[icount,2] := EmailArray[icount, 4];
      PBEmailListFrm.EmailContactArray[icount,3] := EmailArray[icount, 2];
      PBEmailListFrm.EmailListGrid.Cells[6, icount] := EmailArray[icount, 2];
    end;
    if icount = 1 then
      PBEmailListFrm.EmailListGrid.RowCount := 2
    else
      PBEmailListFrm.EmailListGrid.RowCount := icount;

    PBEmailListFrm.Caption := 'Sales Invoice Customer List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'ID';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';

    PBEmailListFrm.ShowModal;

    {If OK to do the emailing then send all the emails}
    if PBEmailListFrm.ModalResult = idok then
    begin
      for irow := 1 to PBEmailListFrm.EmailListGrid.Rowcount -1 do
      begin
        if Trim(PBEmailListFrm.EmailListGrid.cells[3, irow]) = '' then continue;

        PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);
        try
          if chkbxShowZeroValues.checked then
            PBRPSalesInvFrm.ShowZeroValues := 'Y'
          else
            PBRPSalesInvFrm.ShowZeroValues := 'N';

          {Print all lines of credit note}
          if self.CreditNotePrint then
            PBRPSalesInvFrm.ShowZeroValues := 'Y';

          PBRPSalesInvFrm.bInvoice := InvoicePrint;
          PBRPSalesInvfrm.bPreview := bPreview;
          PBRPSalesInvfrm.bReprint := false;
          PBRPSalesInvfrm.bUpdate := false;
          PBRPSalesInvfrm.bPrintLogo := true;

          InvPrintSQL.Close;
          if InvoicePrint then
            InvPrintSQL.SQL := qryInvEmail.SQL
          else
            InvPrintSQL.SQL := qryCreditEmail.SQL;

          InvPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
          InvPrintSQL.ParamBYName('Inv_To_Customer').AsInteger := StrToInt(EmailArray[irow,3]);
          InvPrintSQL.ParamBYName('Inv_To_Branch').AsInteger := StrToInt(EmailArray[irow,4]);
          InvPrintSQL.ParamBYName('Sales_Invoice').Asinteger := strtoint(EmailArray[irow,1]);
          InvPrintSQL.Open;

          if InvPrintSQL.recordcount > 0 then
            begin
              PBRPSalesInvFrm.InvoiceReport.Dataset := InvPrintSQL;
              PBRPSalesInvFrm.InvoiceGroupHeader.Expression := 'Sales_invoice';
              PBRPSalesInvFrm.InvHeadSRC.dataset := InvPrintSQL;

              FCustomerName := PBEmailListFrm.EmailListGrid.Cells[1, irow];

              sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
              Printtoattachment(PBRPSalesInvFrm, EmailArray[irow,1]);

              sInvoiceNo := PBRPSalesInvFrm.InvoiceNumberlbl.caption;

              if PBRPSalesInvFrm.bCustomerisReseller then
                ExportInvoice(PBRPSalesInvFrm, sInvoiceNo);

              sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
              sDescription := InvPrintSQL.fieldBYName('Invoice_Description').Asstring;
              sSalutation := EmailArray[irow,10];

              sSenderName := frmPBMainMenu.sOperator_Name;
              sSenderEmail := frmPBMainMenu.sOperator_Email;

              sRecipientName := EmailArray[irow,5];

              if InvoicePrint then
                sSubject := 'Invoice: ' + sInvoiceNo
              else
                sSubject := 'Credit Note:' + sInvoiceNo;

              sBodyText := dmBroker.GetEmailInvoiceText;
              if trim(sBodytext) = '' then
                sBodytext := 'Please find attached your ' + sSubject + '.'#13#10#13#10
                          +  'If you have any queries please contact me immediately'#13#10#13#10;

              {Replace the invoice number}
              if pos('<Number>', sBodytext) > 0 then
                begin
                  sBodytext := stringreplace(sBodytext, '<Number>', SInvoiceNo, [rfIgnoreCase])
                end;

              {Replace the Salutation}
              if pos('<Salutation>', sBodyText) > 0 then
                begin
                  if trim(sSalutation) <> '' then
                    sBodyText := stringreplace(sBodyText, '<Salutation>', sSalutation, [rfIgnoreCase])
                  else
                    sBodyText := stringreplace(sBodyText, '<Salutation>', '', [rfIgnoreCase]);
                end;

              {Replace the contact name}
              if pos('<Contact Name>', sBodyText) > 0 then
                begin
                  if trim(EmailArray[irow,9]) <> '' then
                    sBodyText := stringreplace(sBodyText, '<Contact Name>', EmailArray[irow,9], [rfIgnoreCase]);
                end;

              {Replace the description}
              if pos('<Description>', sBodyText) > 0 then
                  begin
                    sBodyText := stringreplace(sBodyText, '<Description>', sDescription, [rfIgnoreCase])
                  end;

              if frmPBMainMenu.EmailApplication = 'GENERIC' then
                {Send to Email database}
                dmBroker.EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, sTo,sSubject,sBodyText,FEmailAttachment,
                                      frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount, frmPBMainMenu.sOperator_Name, frmPBMainMenu.sCompName)
              else
                EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.InvoiceEmailAccount);
              bEmailSent := true;
            end;
        finally
          PBRPSalesInvfrm.Free;
        end;
      end;
    end;
  finally
    PBEmailListFrm.free;
  end;
end;

procedure TPBSalesInvPrintFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with qryGetCustomers do
  begin
    Close;
    if InvoicePrint then
      SQL := GetInvCustSQL.SQL
    else
      SQL := GetCreditCustSQL.SQL;

    ParamBYName('Int_sel').AsInteger := iIntselcode;
    Open;

    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Sales_Invoice').AsString;
      EmailArray[irow, 2] := FieldByName('Contact_no').AsString;
      EmailArray[irow, 3] := FieldByName('Customer').AsString;
      EmailArray[irow, 4] := FieldByName('Branch_no').AsString;
      EmailArray[irow, 5] := Trim(FieldByName('Customer_Name').AsString)+' '+Trim(FieldByName('Branch_name').AsString);
      EmailArray[irow, 6] := FieldByName('Email').AsString;
      EmailArray[irow, 7] := FieldByName('exportfilter_descr').AsString;
      EmailArray[irow, 8] := FieldByName('exportfilter').AsString;
      EmailArray[irow, 9] := FieldByName('Contact_Name').AsString;
      EmailArray[irow, 10] := FieldByName('Salutation').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TPBSalesInvPrintFrm.GetSelection;
var
	icount: integer;
begin
  {Delete selection}
  dmBroker.DelIntSelCode(iIntSelCode, True);
	{When the constructing of the list is complete, write to the Report Selection file}
	buildselection;

  if bTooManyRecs then
    exit;

  for icount := 0 to SelectLst.Items.count -1 do
    	begin
       	{Get the relevant Invoice number}
        if SelectLst.Items[icount] = '' then continue;
        dmBroker.AddIntSelCode(iIntSelCode, iCount, SelectLst.Items[icount]);
      end;
end;

procedure TPBSalesInvPrintFrm.BuildSelection;
var
	ilength, irange, iNewLength, istart, ifinish: integer;
  stext, sEvaluate, sFirst, sLast: string;
begin
	selectLst.Clear;

  if selectionGroup.itemindex = 0 then
    selectLst.Items.add(inttostr(iCode))
  else
    begin
      with InvHeadSQL do
        begin
          close;
          open;

          while eof <> true do
            begin
              SelectLst.Items.Add(fieldbyname('Sales_Invoice').asstring);
              next;
            end;
        end;
    end;
end;

procedure TPBSalesInvPrintFrm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  try
  with IniFile do
    begin
      chkbxPrintLogo.Checked := (ReadString('Redeye', 'Invoice Print - Print Logo', 'N') = 'Y');
      chkbxShowZeroValues.Checked := (ReadString('Redeye', 'Invoice Print - Show Zero Values', 'N') = 'Y');
    end;
  finally
    IniFile.Free;
  end;
  FEmailAttachment := TStringList.create;
end;

procedure TPBSalesInvPrintFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      if chkbxPrintLogo.checked then
        WriteString('Redeye', 'Invoice Print - Print Logo', 'Y')
      else
        WriteString('Redeye', 'Invoice Print - Print Logo', 'N');

      if chkbxShowZeroValues.checked then
        WriteString('Redeye', 'Invoice Print - Show Zero Values', 'Y')
      else
        WriteString('Redeye', 'Invoice Print - Show Zero Values', 'N');

      Free;
    end;

  dmBroker.DelIntSelCode(iIntSelCode, True);
  FEmailAttachment.Free;
end;

procedure TPBSalesInvPrintFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      iIntSelCode := dmBroker.GetNextIntSelCode(Self) ;
      FActivated := true;
    end;
end;

procedure TPBSalesInvPrintFrm.PrintToAttachment(PBRPSalesInvFrm: TPBRPSalesInvFrm; tempCode: string);
var
  fileName,
  sPrefix: string;
begin
  if Self.CreditNotePrint then
    sPrefix := 'SC' else
    sPrefix := 'SI';
  fileName := sPrefix + PBRPSalesInvFrm.InvoiceNumberlbl.Caption;
  PrinterTools.New.PrintToAttachment(PBRPSalesInvFrm.InvoiceReport, FEmailAttachment, fileName, tempCode);
end;

(*
procedure TPBSalesInvPrintFrm.PrintToAttachment(PBRPSalesInvFrm: TPBRPSalesInvFrm; tempCode: string);
var
  i: integer;
  sLocation, sFileName, sPrefix: string;
  zLocation, zFileName: array[0..255] of char;
  AFilters: TgtQRFilters;
  RTFFilter: TgtQRRTFFilter;
  HTMLFilter: TgtQRHTMLFilter;
  PDFFilter: TgtQRPDFFilter;
  BMPFilter: TgtQRBMPFilter;
  GIFFilter: TgtQRGIFFilter;
  JPEGFilter: TgtQRJPEGFilter;
begin
  FEmailAttachment.clear;

  sLocation := GetWinTempDir;

//  sFileName := 'SI'+tempCode;

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

//  {Format is 'Si' + Enquiry Number + Random Number}
//  if self.CreditNotePrint then
//    sFileName := 'SC' + tempcode + '-' + sFilename
//  else
//    sFileName := 'SI' + tempcode + '-' + sFilename;

  if self.CreditNotePrint then
    sPrefix := 'SC'
  else
    sPrefix := 'SI';

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;

        sFileName := sPrefix + PBRPSalesInvFrm.InvoiceNumberlbl.caption + '-' + sFilename;
        FEmailAttachment.add(sLocation + sFilename + '.rtf');
        RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);

        PBRPSalesInvfrm.bUpdate := Updatechk.Checked;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(RTFFilter);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;

        sFileName := sPrefix + PBRPSalesInvFrm.InvoiceNumberlbl.caption + '-' + sFilename;
        FEmailAttachment.add(sLocation + sFilename + '.htm');
        HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);

        PBRPSalesInvfrm.bUpdate := Updatechk.Checked;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;

        sFileName := sPrefix + PBRPSalesInvFrm.InvoiceNumberlbl.caption + '-' + sFilename;
        FEmailAttachment.add(sLocation + sFilename + '.pdf');
        PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);

        PBRPSalesInvfrm.bUpdate := Updatechk.Checked;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(PDFFilter);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;

        sFileName := sPrefix + PBRPSalesInvFrm.InvoiceNumberlbl.caption + '-' + sFilename;
        FEmailAttachment.add(sLocation + sFilename + '.gif');
        GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);

        PBRPSalesInvfrm.bUpdate := Updatechk.Checked;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;

        sFileName := sPrefix + PBRPSalesInvFrm.InvoiceNumberlbl.caption + '-' + sFilename;
        FEmailAttachment.add(sLocation + sFilename + '.jpg');
        JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);

        PBRPSalesInvfrm.bUpdate := Updatechk.Checked;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;

        sFileName := sPrefix + PBRPSalesInvFrm.InvoiceNumberlbl.caption + '-' + sFilename;
        FEmailAttachment.add(sLocation + sFilename + '.bmp');
        BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);

        PBRPSalesInvfrm.bUpdate := Updatechk.Checked;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;
  AFilters.free;
end;
*)

procedure TPBSalesInvPrintFrm.SetCreditNotePrint(const Value: boolean);
begin
  FCreditNotePrint := Value;
  self.chkbxShowZeroValues.Visible := not Value;
end;

procedure TPBSalesInvPrintFrm.ExportInvoice(PBRPSalesInvFrm: TPBRPSalesInvFrm; tempCode: string);
var
  sLocation, sFileName: string;
  zLocation, zFileName: array[0..255] of char;
  sDescription, tempStr: string;
  CSVFile: TextFile;
  rLineTotal, rResellerLineTotal, rLineMargin, rLineMarginPerc: real;
  rTotal, rResellerTotal, rMargin, rMarginPerc: real;
  iCount: integer;
begin
  sLocation := GetWinTempDir;

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

  {Format is 'Si' + Enquiry Number + Random Number}
  if self.CreditNotePrint then
    sFileName := 'SC' + tempcode + '-' + sFilename
  else
    sFileName := 'SI' + tempcode + '-' + sFilename;

  assignFile(CSVFile, sLocation + sFilename + '.csv');
  rewrite(CSVFile);

  tempstr := '';

  {write away the column headings}
  tempstr     := '"Account Number"'
              + ',"Invoice Date"'
              + ',"Invoice Number"'
              + ',"Line"'
              + ',"Description"'
              + ',"Quantity"'
              + ',"Invoice Price"'
              + ',"Reseller Price"'
              + ',"Price Unit"'
              + ',"Vat Rate"'
              + ',"Line Total"'
              + ',"Reseller Total"'
              + ',"Margin Value"'
              + ',"Margin %"';

  WriteLn(CSVFile, tempStr);

  with InvLineSQL do
    begin
      close;
      if chkbxShowZeroValues.checked then
        parambyname('Show_Zero_Values').asstring := 'Y'
      else
        parambyname('Show_Zero_Values').asstring := 'N';

      {Print all lines of credit note}
      if self.CreditNotePrint then
        parambyname('Show_Zero_Values').asstring := 'Y';

      parambyname('Sales_invoice_No').asstring := tempCode;
      open;

      rTotal := 0;
      rResellerTotal := 0;
      iCount := 0;

      while eof <> true do
      begin
        if fieldbyname('Price_Unit_Factor').asinteger = 0 then
          begin
            rLineTotal := fieldbyname('Goods_Value').asfloat;
            rResellerLineTotal := fieldbyname('Reseller_Price').asfloat;
          end
        else
          begin
            rLineTotal := (fieldbyname('Qty_Invoiced').asinteger/fieldbyname('Price_Unit_Factor').asinteger) * fieldbyname('Goods_Value').asfloat;
            rResellerLineTotal := (fieldbyname('Qty_Invoiced').asinteger/fieldbyname('Price_Unit_Factor').asinteger) * fieldbyname('Reseller_Price').asfloat;
          end;

        if fieldbyname('Purchase_Order').asfloat <> 0 then
          begin
            sDescription := PBRPSalesInvFrm.GetPOLineDesc(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
          end
        else
        if fieldbyname('Sales_Order').asinteger <> 0 then
          begin
            sDescription := PBRPSalesInvFrm.GetSOLineDesc(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_order_Line_no').asinteger);
          end
        else
          begin
            sDescription := PBRPSalesInvFrm.GetJBLineDesc(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
          end;

        rLineMargin := rResellerLineTotal - rLineTotal;
        try
          rLineMarginPerc := ((rLineMargin/rLineTotal)*100);
        except
          rLineMarginPerc := 999.99;
        end;

        iCount := iCount + 1;
        tempStr := fieldbyname('End_User_Account_Code').asstring;
        tempStr := tempstr + ',' + fieldbyname('Invoice_Date').asstring;
        tempStr := tempstr + ',' + fieldbyname('Sales_invoice_no').asstring;
        tempStr := tempstr + ',' + inttostr(icount);
        tempStr := tempstr + ',' + stringreplace(sDescription,',','',[rfReplaceAll]);
        tempStr := tempStr + ',' + fieldbyname('Qty_Invoiced').asstring;
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.0000',fieldbyname('Goods_Value').asfloat) + '"';
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.0000',fieldbyname('Reseller_Price').asfloat)+ '"';
        tempStr := tempStr + ',' + fieldbyname('Sales_Unit_Desc').asstring;
        tempStr := tempStr + ',' + formatfloat('0.00%',fieldbyname('Vat_Rate').asfloat);
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rLineTotal)+ '"';
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rResellerLineTotal)+ '"';
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rLineMargin)+ '"';
        tempStr := tempStr + ',' + formatfloat('0.00%',rLineMarginPerc);

        WriteLn(CSVFile, tempStr);

        {Recalculate line totals to add to invoice totals}
        rResellerLineTotal := strtofloat(formatfloat('##0.00',rResellerLineTotal));
        rLineTotal := strtofloat(formatfloat('##0.00',rLineTotal));

        rTotal := rTotal + rLineTotal;
        rResellerTotal := rResellerTotal + rResellerLineTotal;

        next;
      end;
    end;

  rMargin := rResellerTotal - rTotal;
  try
    rMarginPerc := ((rMargin/rTotal)*100);
  except
    rMarginPerc := 999.99;
  end;

  {write away blank line}
  tempstr     := '""';
  WriteLn(CSVFile, tempStr);

  {write away the Company Totals}
  tempstr     := '"' + '","' + '","' + '","' + '","' + '","'+ '","'+ 'Totals' + '","' + '","' + formatfloat('£#,##0.00',rTotal) + '","' + formatfloat('£#,##0.00',rResellerTotal)
              + '","' + formatfloat('£#,##0.00',rMargin) + '","' + formatfloat('#,##0.00%',rMarginPerc) + '"';
  WriteLn(CSVFile, tempStr);

  FEmailAttachment.add(sLocation + sFilename + '.csv');
  CloseFile(CSVFile);
end;

end.

