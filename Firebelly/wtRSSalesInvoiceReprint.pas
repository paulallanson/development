unit wtRSSalesInvoiceReprint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, Buttons, Printers, ExtCtrls, QrCtrls, IniFiles,
  wtRPSalesInvoice, QrExport, AllCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSSalesInvoiceReprint = class(TForm)
    btnClose: TBitBtn;
    selectionGrp: TGroupBox;
    memSelection: TMemo;
    SelectLst: TListBox;
    btnPrint: TBitBtn;
    btnPreview: TBitBtn;
    btnEmail: TBitBtn;
    rdgrpType: TRadioGroup;
    Label1: TLabel;
    InvRPrintSQL: TFDQuery;
    qryInvPrint: TFDQuery;
    qryCreditPrint: TFDQuery;
    qryGetCustomers: TFDQuery;
    GetInvCustSQL: TFDQuery;
    GetCreditCustSQL: TFDQuery;
    qryInvEmail: TFDQuery;
    qryCreditEmail: TFDQuery;
    qryAddress: TFDQuery;
    procedure EnablePrint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure PreviewBtnClick(Sender: TObject);
    procedure GetSelection;
    procedure BuildRange(sFirst: string; sLast: string);
    Function IncrementNo(StartStr: String): String ;
    procedure memSelectionKeyPress(Sender: TObject; var Key: Char);
    procedure BuildSelection;
    procedure FormDeactivate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FInvoicePrint: boolean;
    procedure SetInvoicePrint(const Value: boolean);
    procedure RunReport(const bPreview: Boolean);
    procedure EmailReport;
    function BuildQueryString: string;
    procedure ClearEmailArray(Sender: TObject);
    procedure BuildEmailDetails;
    { Private declarations }
  public
    { Public declarations }
    iIntSelCode: Integer;
    iCode: integer;
    property InvoicePrint: boolean read FInvoicePrint write SetInvoicePrint;
  private
    FEmailAttachment : TstringList;
    sAttachmentType: string;
    // GDK ToDo: Remove after testings
    // procedure PrintToAttachment(frmWTRPSalesInvoice: TfrmWTRPSalesInvoice; tempCode: string);
  end;

var
  frmWTRSSalesInvoiceReprint: TfrmWTRSSalesInvoiceReprint;
  EmailArray: array[1..100, 1..11] of string;

implementation

uses
  wtDataModule, AllEmailHandler, wtEmailList, wtMain, Printer.Tools;

const
  SQLCore =
  'SELECT DISTINCT Sales_invoice.invoice_no, '+
  'Customer.Email_Address as Email, '+
  'Customer.Email_Address as Contact_Email, '+
  'Sales_invoice.Customer_Name as Name, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email ' +
  'FROM (Customer '+
  'INNER JOIN Sales_invoice ON '+
  'Customer.Customer = Sales_invoice.Customer) '+
  'WHERE 1=1 AND ';

{$R *.DFM}

procedure TfrmWTRSSalesInvoiceReprint.FormShow(Sender: TObject);
begin
  memSelection.SetFocus;
end;

procedure TfrmWTRSSalesInvoiceReprint.RunReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  frmWTRPSalesInvoice := TfrmWTRPSalesInvoice.Create(Self);

  try
    PrinterSettings := TPrinterSettings.Create;
    try
      frmWTRPSalesInvoice.bInvoice := InvoicePrint;
      frmWTRPSalesInvoice.bReprint := true;
      {Extract the relevant data}

      frmWTRPSalesInvoice.bUpdate := False;

      frmWTRPSalesInvoice.bAll := False;

      if rdgrpType.itemindex = 0 then
        frmWTRPSalesInvoice.bDetailed := False
      else
        frmWTRPSalesInvoice.bDetailed := True;

      frmWTRPSalesInvoice.SelCode := iCode;

      GetSelection;

      InvRPrintSQL.Close;
      if InvoicePrint then
        InvRPrintSQL.SQL := qryInvPrint.SQL
      else
        InvRPrintSQL.SQL := qryCreditPrint.SQL;

      InvRPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
      InvRPrintSQL.Open;
      if InvRPrintSQL.recordCount = 0 then
  	    begin
          MessageDlg('No valid invoices in this selection',mterror,[mbOK],0);
          exit;
    	  end;

//    frmWTRPSalesInvoice.GetInvoiceData;

      frmWTRPSalesInvoice.InvoiceReport.Dataset := InvRPrintSQL;
      frmWTRPSalesInvoice.InvoiceGroupHeader.Expression := 'Sales_invoice';
      frmWTRPSalesInvoice.InvHeadSRC.dataset := InvRPrintSQL;

      if bPreview then
        frmWTRPSalesInvoice.InvoiceReport.Preview
      else
        begin
(*        frmWTRPSalesInvoice.InvoiceReport.PrinterSetup;
        if frmWTRPSalesInvoice.InvoiceReport.tag = 0 then
          frmWTRPSalesInvoice.InvoiceReport.Print;
*)
          if SetUpPrinter(PrinterSettings) then
            frmWTRPSalesInvoice.InvoiceReport.Print;
        end;
    finally
      PrinterSettings.free;
    end;
  finally
    frmWTRPSalesInvoice.Free;
  end;

  if bPreview = false then close;
end;

procedure TfrmWTRSSalesInvoiceReprint.PrintBtnClick(Sender: TObject);
begin
//  CallReport(false);
(*  PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesInvfrm.PrinterSettings := PrinterSettings;
      PBRPSalesInvfrm.bReprint := True;
      GetSelection;
      InvRPrintSQL.Close;
      InvRPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
      InvRPrintSQL.Open;
      if InvRPrintSQL.recordCount = 0 then
  		    begin
          MessageDlg('No valid invoices in this selection',mterror,[mbOK],0);
          exit;
    	end;
      PBRPSalesInvFrm.InvoiceReport.Dataset := InvRPrintSQL;
      PBRPSalesInvFrm.InvoiceGroupHeader.Expression := 'Sales_invoice';
      PBRPSalesInvFrm.InvHeadSRC.dataset := InvRPrintSQL;
      if SetUpPrinter(PrinterSettings) then
        PBRPSalesInvfrm.InvoiceReport.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    PBRPSalesInvfrm.Free;
  end;
*)
end;

procedure TfrmWTRSSalesInvoiceReprint.PreviewBtnClick(Sender: TObject);
begin
//  CallReport(true);
(*  PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesInvfrm.PrinterSettings := PrinterSettings;
      PBRPSalesInvfrm.bReprint := True;
      GetSelection;
    InvRPrintSQL.Close;
    InvRPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
    InvRPrintSQL.Open;
    if InvRPrintSQL.recordCount = 0 then
  		    begin
          MessageDlg('No valid invoices in this selection',mterror,[mbOK],0);
          exit;
    	end;
    PBRPSalesInvFrm.InvoiceReport.Dataset := InvRPrintSQL;
    PBRPSalesInvFrm.InvoiceGroupHeader.Expression := 'InvRPrintSQL.Sales_invoice';
    PBRPSalesInvFrm.InvHeadSRC.dataset := InvRPrintSQL;
    PBRPSalesInvfrm.InvoiceReport.Preview;
    finally
      PrinterSettings.Free;
    end;
  finally
    PBRPSalesInvfrm.Free;
  end;
*)
end;

procedure TfrmWTRSSalesInvoiceReprint.BuildSelection;
var
	ilength, irange, iNewLength, istart, ifinish: integer;
  stext, sEvaluate, sFirst, sLast: string;
begin
	selectLst.Clear;

	ilength := length(memSelection.text);

 	stext := memSelection.text;
  if copy(stext,ilength,1) <> ',' then
  	stext := stext + ',';

  stext := trim(stext);

  ifinish := 0;
  while pos(',',stext) > 0 do
  	begin
  		istart := ifinish + 1;
  		ifinish := pos(',',stext);
        ilength := ifinish - istart;

        {Chop out the string which is to be evaluated}
        sEvaluate := copy(stext,istart,ilength);
        sEvaluate := trim(sEvaluate);

        {Check to see if the string has a range selection}
        irange := pos('-',sEvaluate);
        inewLength := length(sEvaluate);

        if irange > 0 then
        	begin
           	{Build the list of possible values in between the range}
              sFirst := copy(sEvaluate,1,irange-1);
              sLast := copy(sEvaluate,irange+1,(iNewLength-irange));

              BuildRange(sFirst,sLast);
        		stext[ifinish] := ':';
              continue;
           end;

        {Check that the item does not already exist}
        if SelectLst.Items.IndexOf(sEvaluate) < 0 then
        	SelectLst.Items.Add(sEvaluate);

        stext[ifinish] := ':';
     end;
end;

procedure TfrmWTRSSalesInvoiceReprint.GetSelection;
var
	icount: integer;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	dtmdlWorktops.DelIntSelCode(iIntSelCode, True);

  BuildSelection;

  if SelectLst.Items.Count > 100 then
    begin
      MessageDlg(' This selection will result in more than 100 documents being produced. Please redefine the range', mterror,
      [mbOk], 0);
      SelectLst.Clear;
      memSelection.Clear;
      memSelection.SetFocus;
      exit;
    end;

   for icount := 0 to SelectLst.Items.count -1 do
    	begin
       	{Get the relevant quote number}
        if SelectLst.Items[icount] = '' then continue;

       	with dtmdlWorktops.qryAddIntSel do
          begin
          Close;
          ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          ParamByName('Sel1').AsFloat := strtoFloat(SelectLst.Items[icount]);
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

procedure TfrmWTRSSalesInvoiceReprint.BuildRange(sFirst: string; sLast: string);
var
  sinvoiceNo: string;
begin
	if sFirst > sLast then exit;

  sInvoiceNo := sFirst;

  {Continue adding invoice lines until the last in the range is reached}
	repeat
      if SelectLst.Items.IndexOf(sInvoiceNo) < 0 then
        	SelectLst.Items.Add(sInvoiceNo);
     sInvoiceNo := incrementno(sInvoiceNo);
  until sInvoiceNo > sLast;

end;

Function TfrmWTRSSalesInvoiceReprint.IncrementNo(StartStr: String): String ;
Var StrLength, Count, Id: Integer ;
    Alphas: String[27] ;
    Numbers: String[11] ;
    CurrChar: String[1] ;
begin
Alphas := 'ABCEDFGHIJKLMNOPQRSTUVWXYZA' ;
Numbers := '01234567890' ;
{Increment a string value by 1}
StrLength := Length(StartStr) ;
For Count := StrLength downto 1 do
    begin
    CurrChar := Copy(StartStr,Count,1) ;
    Id := Pos(CurrChar,Numbers) ;
    if Id > 0 then
       begin
       StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Numbers, (Id + 1), 1) +
                   Copy(StartStr,(Count + 1), (StrLength - Count));
       IncrementNo := StartStr ;
       if Id < 10 then exit ;
       end
    else
        begin
        Id := Pos(CurrChar,Alphas) ;
        if Id > 0 then
               begin
               StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Alphas, (Id + 1), 1) +
                   Copy(StartStr,(Count + 1), (StrLength - Count));
        IncrementNo := StartStr ;
        if Id < 27 then exit ;
               end ;
        end ;
       end ;
end ;

procedure TfrmWTRSSalesInvoiceReprint.memSelectionKeyPress(Sender: TObject;
  var Key: Char);
begin
	case Ord(key) of
  	$30..$39:;
  	Ord(','):;
  	Ord('-'):;
  	vk_back:;
  	vk_return:;
  	vk_tab:;
  else
  	MessageBeep(0);
  	key := #0;
  end;

end;

procedure TfrmWTRSSalesInvoiceReprint.EnablePrint(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.enabled;
  btnEmail.enabled := btnPrint.enabled;

end;

procedure TfrmWTRSSalesInvoiceReprint.FormDeactivate(Sender: TObject);
begin
  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
end;

procedure TfrmWTRSSalesInvoiceReprint.SetInvoicePrint(const Value: boolean);
begin
  FInvoicePrint := Value;
  if InvoicePrint then
    begin
      caption := 'Invoice Re-print selection';
      selectionGrp.caption := 'Invoice Number Selection';
    end
  else
    begin
      caption := 'Credit Note Re-print selection';
      selectionGrp.caption := 'Credit Note Number Selection';
    end;
end;

procedure TfrmWTRSSalesInvoiceReprint.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSSalesInvoiceReprint.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSalesInvoiceReprint.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSSalesInvoiceReprint.btnEmailClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  try
    ClearEmailArray(Self);
    EmailReport;
  finally
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
  end;
end;

procedure TfrmWTRSSalesInvoiceReprint.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TfrmWTRSSalesInvoiceReprint.BuildEmailDetails;
var
  irow: Integer;
  bRetail: boolean;
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
      bRetail := false;

      if (FieldByName('Is_Retail_Customer').AsString = 'Y') OR (FieldByName('Customer_is_Speculative').AsString = 'Y') then
        begin
          bRetail := true;

          {Find the email details from the address table}
          qryAddress.close;
          qryAddress.parambyname('Address').AsInteger := fieldbyname('Invoice_Address').asinteger;
          qryAddress.open;
        end;

      EmailArray[irow, 1] := FieldByName('Invoice_no').AsString;
      EmailArray[irow, 2] := '';
      EmailArray[irow, 3] := FieldByName('Customer').AsString;
      EmailArray[irow, 4] := '';

      if bRetail then
        begin
          EmailArray[irow, 5] := Trim(FieldByName('Customer_Name').AsString);
          EmailArray[irow, 6] := qryAddress.FieldByName('Email_Address').AsString;
        end
      else
        begin
          EmailArray[irow, 5] := Trim(FieldByName('Customer_Name').AsString);
          EmailArray[irow, 6] := FieldByName('Email').AsString;
        end;

      EmailArray[irow, 7] := FieldByName('export_filter_desc').AsString;
      EmailArray[irow, 8] := FieldByName('exportfilter').AsString;
      EmailArray[irow, 9] := '';
      inc(irow);
      Next;
    end;
  end;
end;

procedure TfrmWTRSSalesInvoiceReprint.EmailReport;
var
  sEmail, sTemp, sSubject, sTo, sBodyText: string;
  i, icount, irow, iInvoiceCount: integer;
  sFilename: array[0..255] of Char;
  printFileName: string;
begin
  GetSelection;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the customer invocies send an email}
  frmWTEmailList := TfrmWTEmailList.Create(Self);
  try
    frmWTEmailList.CodeType := 'I';

    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 3] = '' then Break;
//      frmWTEmailList.EmailListGrid.ColWidths[0] := 0;
      frmWTEmailList.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      frmWTEmailList.EmailListGrid.Cells[1, icount] := EmailArray[icount, 5];
      frmWTEmailList.EmailListGrid.Cells[2, icount] := EmailArray[icount, 9];
      frmWTEmailList.EmailListGrid.Cells[3, icount] := EmailArray[icount, 6];
      frmWTEmailList.EmailListGrid.Cells[4, icount] := EmailArray[icount, 7];
      frmWTEmailList.EmailListGrid.Cells[5, icount] := EmailArray[icount, 8];


      {Set up the Email Array with the Customer/Branch/Contact}
      frmWTEmailList.EmailContactArray[icount,1] := EmailArray[icount, 3];
      frmWTEmailList.EmailContactArray[icount,2] := EmailArray[icount, 4];
      frmWTEmailList.EmailContactArray[icount,3] := EmailArray[icount, 2];
    end;
    if icount = 1 then
      frmWTEmailList.EmailListGrid.RowCount := 2
    else
      frmWTEmailList.EmailListGrid.RowCount := icount;

    frmWTEmailList.Caption := 'Sales Invoice Customer List';
    frmWTEmailList.EmailListGrid.Cells[0, 0] := 'Invoice';
    frmWTEmailList.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    frmWTEmailList.EmailListGrid.Cells[2, 0] := 'Contact';

    frmWTEmailList.ShowModal;

    sEmail := '';
    iInvoiceCount := 0;

    {If OK to do the emailing then send all the emails}
    if frmWTEmailList.ModalResult = idok then
    begin
      for irow := 1 to frmWTEmailList.EmailListGrid.Rowcount -1 do
      begin
        if Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) = '' then continue;  {Drop out if no email address}

        if (Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) <> sEmail) and (Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) <> '') then
          begin
            if sEmail <> '' then
              begin
                EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

                for i := pred(FEmailAttachment.count) downto 0 do
                  begin
                    StrPCopy(sFilename, FEmailAttachment.strings[i]);
                    deletefile(sFilename);
                  end;
              end;
            FEmailAttachment.clear;
            iInvoiceCount := 1;

            sEmail := Trim(frmWTEmailList.EmailListGrid.cells[3, irow]);

            frmWTRPSalesInvoice := TfrmWTRPSalesInvoice.Create(Self);
            try
              frmWTRPSalesInvoice.bInvoice := InvoicePrint;
              frmWTRPSalesInvoice.bUpdate := False;
              frmWTRPSalesInvoice.bReprint := true;
//              frmWTRPSalesInvoice.bAll := False;
//              frmWTRPSalesInvoice.selcode := iCode;

              if rdgrpType.itemindex = 0 then
                frmWTRPSalesInvoice.bDetailed := False
              else
                frmWTRPSalesInvoice.bDetailed := True;

              frmWTRPSalesInvoice.InvoiceReport.ShowProgress := false;

              InvRPrintSQL.Close;
              if InvoicePrint then
                InvRPrintSQL.SQL := qryInvEmail.SQL
              else
                InvRPrintSQL.SQL := qryCreditEmail.SQL;

              InvRPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
              InvRPrintSQL.ParamBYName('Customer').AsInteger := StrToInt(EmailArray[irow,3]);
              InvRPrintSQL.ParamBYName('Invoice_no').Asstring := EmailArray[irow,1];
              InvRPrintSQL.Open;

              if InvRPrintSQL.recordcount > 0 then
                begin
                  frmWTRPSalesInvoice.InvoiceReport.Dataset := InvRPrintSQL;
                  frmWTRPSalesInvoice.InvoiceGroupHeader.Expression := 'Sales_invoice';
                  frmWTRPSalesInvoice.InvHeadSRC.dataset := InvRPrintSQL;

                  sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
                  printFileName := 'SI' + sAttachmentType;
                  PrinterTools.New.Printtoattachment(frmWTRPSalesInvoice.InvoiceReport, FEmailAttachment, printFileName, EmailArray[irow,1]);

                  if iInvoiceCount = 1 then
                    begin
                      sTo := Trim(frmWTEmailList.EmailListGrid.Cells[3, irow]);

                      if InvoicePrint then
                        sSubject := 'Invoice: ' + EmailArray[irow,1]
                      else
                        sSubject := 'Credit Note:' + EmailArray[irow,1];

                      sBodyText := dtmdlWorktops.GetEmailInvoiceDetails;
                      if trim(sBodytext) = '' then
                        sBodytext := 'Please find attached your ' + sSubject + '.'#13#10#13#10
                              +  'If you have any queries please contact me immediately'#13#10#13#10;

                      {Replace the invoice number}
                      if pos('<Number>', sBodytext) > 0 then
                        begin
                          sBodytext := stringreplace(sBodytext, '<Number>', frmWTRPSalesInvoice.InvoiceReport.Dataset.fieldbyname('Invoice_No').asstring, [rfIgnoreCase])
                        end;
                    end;
                end;
            finally
              frmWTRPSalesInvoice.free;
//              emailHandler.Free;
            end;
          end
        else
          begin
            iInvoiceCount := iInvoiceCount + 1;

            sEmail := Trim(frmWTEmailList.EmailListGrid.cells[3, irow]);

            frmWTRPSalesInvoice := TfrmWTRPSalesInvoice.Create(Self);
            try
              frmWTRPSalesInvoice.bInvoice := InvoicePrint;
              frmWTRPSalesInvoice.bUpdate := False;
              frmWTRPSalesInvoice.bReprint := true;
//              frmWTRPSalesInvoice.bAll := False;
//              frmWTRPSalesInvoice.selcode := iCode;

              if rdgrpType.itemindex = 0 then
                frmWTRPSalesInvoice.bDetailed := False
              else
                frmWTRPSalesInvoice.bDetailed := True;

              frmWTRPSalesInvoice.InvoiceReport.ShowProgress := false;

              InvRPrintSQL.Close;
              if InvoicePrint then
                InvRPrintSQL.SQL := qryInvEmail.SQL
              else
                InvRPrintSQL.SQL := qryCreditEmail.SQL;

              InvRPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
              InvRPrintSQL.ParamBYName('Customer').AsInteger := StrToInt(EmailArray[irow,3]);
              InvRPrintSQL.ParamBYName('Invoice_no').Asstring := EmailArray[irow,1];
              InvRPrintSQL.Open;

              if InvRPrintSQL.recordcount > 0 then
                begin
                  frmWTRPSalesInvoice.InvoiceReport.Dataset := InvRPrintSQL;
                  frmWTRPSalesInvoice.InvoiceGroupHeader.Expression := 'Sales_invoice';
                  frmWTRPSalesInvoice.InvHeadSRC.dataset := InvRPrintSQL;

                  sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
                  printFileName := 'SI' + sAttachmentType;
                  PrinterTools.New.Printtoattachment(frmWTRPSalesInvoice.InvoiceReport, FEmailAttachment, printFileName, EmailArray[irow,1]);

                  sSubject := sSubject + ', ' + EmailArray[irow,1];

                  if InvoicePrint then
                    sBodytext := 'Please find attached your invoices.'#13#10#13#10
                              +  'If you have any queries please do not hesitate to contact us.'#13#10#13#10
                              +  'Kind Regards,'#13#10#13#10
                  else
                    sBodytext := 'Please find attached your credit notes.'#13#10#13#10
                              +  'If you have any queries please do not hesitate to contact us.'#13#10#13#10
                              +  'Kind Regards,'#13#10#13#10
                end;
            finally
              frmWTRPSalesInvoice.free;
//              emailHandler.Free;
            end;
          end;
      end;
      if (FEmailAttachment.Count > 0) then
        begin
          EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

          for i := pred(FEmailAttachment.count) downto 0 do
            begin
              StrPCopy(sFilename, FEmailAttachment.strings[i]);
              deletefile(sFilename);
            end;
        end;
    end;
  finally
    frmWTEmailList.free;
  end;
  close;
end;

function TfrmWTRSSalesInvoiceReprint.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'Sales_invoice.invoice_no = ''' + memSelection.text + '''';
  Result := sTemp
end;

procedure TfrmWTRSSalesInvoiceReprint.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  var fileName := ExtractFilePath(Application.ExeName) + myWorktops_INIFILE;
  IniFile := TIniFile.Create(fileName);

  try
    with IniFile do
    begin
      if rdgrpType.itemindex = 1 then
        WriteString('Sales Invoice', 'Detailed Print', 'Y')
      else
        WriteString('Sales Invoice', 'Detailed Print', 'N');
    end;
  finally
    IniFile.Free;
  end;

  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
  FEmailAttachment.Free;
end;

procedure TfrmWTRSSalesInvoiceReprint.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  var fileName := ExtractFilePath(Application.ExeName) + myWorktops_INIFILE;
  IniFile := TIniFile.Create(fileName);

  try
  with IniFile do
    begin
      if ReadString('Sales Invoice', 'Detailed Print', 'N') = 'Y' then
        rdgrpType.itemindex := 1
      else
        rdgrpType.itemindex := 0
    end;
  finally
    IniFile.Free;
  end;
  iIntSelCode := dtmdlWorktops.GetNextIntSelCode(Self) ;
  FEmailAttachment := TStringList.create;
  TEdit(memselection).charcase := ecUpperCase;
end;

(*
procedure TfrmWTRSSalesInvoiceReprint.PrintToAttachment(
  frmWTRPSalesInvoice: TfrmWTRPSalesInvoice; tempCode: string);
var
  i: integer;
  sLocation, sFileName: string;
  AFilters: TgtQRFilters;
  RTFFilter: TgtQRRTFFilter;
  HTMLFilter: TgtQRHTMLFilter;
  PDFFilter: TgtQRPDFFilter;
  BMPFilter: TgtQRBMPFilter;
  GIFFilter: TgtQRGIFFilter;
  JPEGFilter: TgtQRJPEGFilter;
begin
//  FEmailAttachment.clear;

  sLocation := GetWinTempDir;

  sFileName := 'SI'+tempCode;

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSalesInvoice.InvoiceReport.Prepare;
        frmWTRPSalesInvoice.InvoiceReport.ExportToFilter(RTFFilter);
      finally
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter.Free;
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSalesInvoice.InvoiceReport.Prepare;
        frmWTRPSalesInvoice.InvoiceReport.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter.Free;
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSalesInvoice.InvoiceReport.Prepare;
        frmWTRPSalesInvoice.InvoiceReport.ExportToFilter(PDFFilter);
      finally
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter.Free;
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSalesInvoice.InvoiceReport.Prepare;
        frmWTRPSalesInvoice.InvoiceReport.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter.Free;
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSalesInvoice.InvoiceReport.Prepare;
        frmWTRPSalesInvoice.InvoiceReport.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter.Free;
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSalesInvoice.InvoiceReport.Prepare;
 //       ExportToRTF(frmWTRPSalesInvoice.InvoiceReport, sLocation + sFilename + '.bmp');
      frmWTRPSalesInvoice.InvoiceReport.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter.Free;
        frmWTRPSalesInvoice.InvoiceReport.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;
*)

end.
