unit PBRSQuoN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBTables, CCSDataBroker, PBDBQuoLtr,
  gtQrExport, CCSCommon, CCSPress, Inifiles, ComCtrls, DateUtils, PBActivityDM, Math;

type
  TQuoLetterClass = class of TdbQuoLtr;

  TPBRSQuoNFrm = class(TForm)
    GetEnqSQL: TQuery;
    pnlButtons: TPanel;
    cbPrintLogo: TCheckBox;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    TypeRadioGroup: TRadioGroup;
    EmailBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    EstNumLabel: TLabel;
    EnquiryMemo: TMemo;
    pnlReminder: TPanel;
    pnlTop: TPanel;
    gbLayouts: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbPageLayout: TComboBox;
    cmbLetterLayout: TComboBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    dtReminderDate: TDateTimePicker;
    StatusBar1: TStatusBar;
    chkbxAttachPriceList: TCheckBox;
    procedure CanPrint(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure EmailReport(Sender: TObject);
    procedure BuildFaxDetails;
    procedure BuildEmailDetails;
    procedure ClearFaxArray(Sender: TObject);
    procedure ClearEmailArray(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EnquiryMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EnquiryMemoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cbPrintLogoClick(Sender: TObject);
    procedure TypeRadioGroupClick(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    procedure AddActivity;
  private
    DataBroker : TdbQuoLtr;
    dtmdlActivities : TdtmdlActivity;
    LetterType : integer;
    Preview: ByteBool;
    sStudioPriceListFile: string;
    FPrinted: Boolean;
    FActDone : Boolean;
    FCustomerName: string;
    FFaxing : Boolean;
    FEmail : Boolean;
    FEmailAttachment : TstringList;
    FEmailApplication : string;
    FEmailLocation : string;
    FEnquiry : integer;
    procedure CreateDataBroker;
    function  DBFactory(aClass : TQuoLetterClass) : Pointer;
    procedure LoadCombos;
    procedure GetEmailApp;
    procedure RollThePresses(aBroker : TDataBroker);
    procedure PrintToAttachment(PrintingPress: TfrmPrintingPress; EnqNumber: integer);
    function GetBinSelection: integer;
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    procedure SetPrinterBin(BinCode: integer);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  public
    bOK: boolean;
  end;

var
  PBRSQuoNFrm : TPBRSQuoNFrm;
  FaxArray: array[1..100, 1..5] of string;
  EMailArray: array[1..100, 1..11] of string;

implementation

uses PBFaxList, PBEmailList, PBSendFax, LetterDM, printers, CCSPrint, PDLetter,
     PBDBQuoSumLtr, pbMainMenu, pbDatabase;

var
  sAttachmentType: string;

{$R *.DFM}

procedure TPBRSQuoNFrm.CanPrint(Sender: TObject);
var
  Printable : Boolean;
begin
  Printable := ((cmbPageLayout.Text <> '') and (cmbLetterLayout.Text <> '')) and
    ((EnquiryMemo.Text <> ''));
  {Check if can print}
  PrintBitBtn.Enabled := Printable;
  PreviewBitBtn.Enabled := Printable;
  EmailBitBtn.Enabled := Printable and (FEmailApplication <> '');
end;

procedure TPBRSQuoNFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
end;

procedure TPBRSQuoNFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintReport(Self);
  if dmBroker.UseCRM and FPrinted and frmPBMainMenu.mnuActivities.enabled and frmPBMainMenu.QuoteReminder  then
    AddActivity;
  bOK := true;
end;

procedure TPBRSQuoNFrm.PrintReport(Sender: TObject);
begin
  {Setup and print the report}
  CreateDataBroker;
  try
    DataBroker.Preview := Preview;
    DataBroker.LayoutName := cmbPageLayout.Text;
    DataBroker.LetterName := cmbLetterLayout.Text;
    DataBroker.EnquiryNo := StrToInt(EnquiryMemo.Text);
    DataBroker.OnlyMine := false;
    DataBroker.ByCustomer := 'N';
    DataBroker.ByBranch := 'N';
    if DataBroker.GetDetails = 0 then
      MessageDlg('There is nothing to print', mtError, [mbAbort], 0)
    else
      RollThePresses(DataBroker);
  finally
    DataBroker.Free;
  end;
end;

procedure TPBRSQuoNFrm.FaxBitBtnClick(Sender: TObject);
begin
  FFaxing := True;
  try
    Preview := False;
    ClearFaxArray(Self);
    FaxReport(Self);
  finally
    FFaxing := False;
    Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
end;

procedure TPBRSQuoNFrm.FaxReport(Sender: TObject);
var
  faxfound: boolean;
  icount, irow: Integer;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  with GetEnqSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := StrToInt(EnquiryMemo.Text);

    ParamByName('Operator').AsInteger := 0;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print}
      MessageDlg('There are no quotes to fax', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildFaxDetails;

  {For each of the Enquiry/Customer details print a fax}
  PBFaxListFrm := TPBFaxListFrm.Create(Self);
  try
    for icount := 1 to 100 do
    begin
      if FaxArray[icount, 1] = '' then Break;
      PBFaxListFrm.FaxListGrid.Cells[0, icount] := FaxArray[icount, 1];
      PBFaxListFrm.FaxListGrid.Cells[1, icount] := FaxArray[icount, 4];
      PBFaxListFrm.FaxListGrid.Cells[2, icount] := FaxArray[icount, 5];
    end;
    PBFaxListFrm.FaxListGrid.RowCount := icount;
    PBFaxListFrm.Caption := 'Enquiry Fax List';
    PBFaxListFrm.FaxListgrid.Cells[0, 0] := 'Enquiry';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer / Branch';
    PBFaxListFrm.ShowModal;

    {If OK to the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
    begin
      CreateDataBroker;
      try
        for irow := 1 to PBFaxListFrm.FaxListGrid.RowCount - 1 do
        begin
          if Trim(PBFaxListFrm.FaxListgrid.Cells[2, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          DataBroker.EnquiryNo := StrToInt(FaxArray[irow, 1]);
          DataBroker.ByCustomer := 'Y';
          DataBroker.Customer := StrToInt(FaxArray[irow, 2]);
          DataBroker.ByBranch := 'Y';
          DataBroker.Branch := StrToInt(FaxArray[irow, 3]);
          DataBroker.GetDetails;
          FaxFound := PBSendFaxfrm.OutToFax(PBFaxListFrm.FaxListgrid.Cells[2, irow],
            'Qte: ' + IntToStr(DataBroker.EnquiryNo) + ' to ' + FaxArray[irow, 4], '');

          DataBroker.LetterName := cmbLetterLayout.Text;
          DataBroker.LayoutName := dmLetter.FaxDefaultLayout;
          if (not FaxFound) then
            Exit;
          RollThePresses(DataBroker);
        end;
      finally
        DataBroker.Free;
      end;
    end;
  finally
    PBFaxListFrm.Free;
  end;
end;

procedure TPBRSQuoNFrm.EmailReport(Sender: TObject);
var
  icount, irow: Integer;
  sTo, sSubject, sBody, sSalutation, sBodyText: string;
  sSenderName, sSenderEmail, sRecipientName: string;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  with GetEnqSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := StrToInt(EnquiryMemo.Text);

    ParamByName('Operator').AsInteger := 0;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print}
      MessageDlg('There are no quotes to email', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the Enquiry/Customer details print a fax}
  PBEmailListFrm := TPBEmailListFrm.Create(Self);
  try
    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 1] = '' then Break;
      PBEmailListFrm.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 4];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := EmailArray[icount, 5];
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 6];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := EmailArray[icount, 9];
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := EmailArray[icount, 8];

      {Set up the Email Array with the Supplier/Branch/Contact}
      PBEmailListFrm.EmailContactArray[icount,1] := EmailArray[icount, 2];
      PBEmailListFrm.EmailContactArray[icount,2] := EmailArray[icount, 3];
      PBEmailListFrm.EmailContactArray[icount,3] := EmailArray[icount, 10];

    end;
    PBEmailListFrm.EmailListGrid.RowCount := icount;
    PBEmailListFrm.Caption := 'Quotation Email List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'Enquiry';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Customer / Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';
    PBEmailListFrm.CodeType := 'C';
    PBEmailListFrm.ShowModal;

    {If OK to do the email then send all the emails}
    if PBEmailListFrm.ModalResult = idok then
    begin
      CreateDataBroker;
      try
        for irow := 1 to PBEmailListFrm.EmailListGrid.RowCount - 1 do
        begin
          if Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]) = '' then Continue;

          {Now email the individual enquiries to the individual suppliers}
          DataBroker.EnquiryNo := StrToInt(EmailArray[irow, 1]);
          DataBroker.ByCustomer := 'Y';
          DataBroker.Customer := StrToInt(EmailArray[irow, 2]);
          DataBroker.ByBranch := 'Y';
          DataBroker.Branch := StrToInt(EmailArray[irow, 3]);
          DataBroker.GetDetails;

          DataBroker.LetterName := cmbLetterLayout.Text;
          DataBroker.LayoutName := dmLetter.FaxDefaultLayout;
          if DataBroker.LayoutName = 'Blank' then
            DataBroker.LayoutName := cmbPageLayout.text;

          {$IFDEF BROADSWORD}
          DataBroker.LayoutName := cmbPageLayout.text;
          {$ENDIF}

          FCustomerName := PBEmailListFrm.EmailListGrid.Cells[1, irow];
          FEnquiry := DataBroker.EnquiryNo;
          sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
          RollThePresses(DataBroker);

          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
          sSubject := 'Quotation Number: '+EmailArray[irow,1]+', '+trim(EmailArray[irow, 11]);
          {$IFDEF PMS}
          sSubject := 'Estimate Number: '+EmailArray[irow,1]+', '+trim(EmailArray[irow, 11]);
          {$ENDIF}
          sSalutation := EmailArray[irow,7];
          sSenderName := frmPBMainMenu.sOperator_Name;
          sSenderEmail := frmPBMainMenu.sOperator_Email;

          sRecipientName := EmailArray[irow,5];

          sBodyText := dmBroker.GetEmailQuotationText;
          if trim(sBodyText) = '' then
                sBodyText := 'Please find attached, quotation ' + EmailArray[irow,1] + '.' + #13#10#13#10
                          +  'If you have any queries please contact me immediately' + #13#10#13#10;

          {Replace the PO number}
          if pos('<Number>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Number>', EmailArray[irow,1], [rfIgnoreCase])
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
              if trim(EmailArray[irow,5]) <> '' then
                sBodyText := stringreplace(sBodyText, '<Contact Name>', EmailArray[irow,5], [rfIgnoreCase]);
            end;

          {Replace the description}
          if pos('<Description>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Description>', trim(EmailArray[irow, 11]), [rfIgnoreCase])
            end;

          if chkbxAttachPriceList.Checked and (sStudioPriceListFile <> '') then
            FEmailAttachment.Add(sStudioPriceListFile);

          if frmPBMainMenu.EmailApplication = 'GENERIC' then
            {Send to Email database}
            dmBroker.EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, sTo,sSubject,sBodyText,FEmailAttachment,
                                      frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount, frmPBMainMenu.sOperator_Name, frmPBMainMenu.sCompName)
          else
            {Send using Outlook}
            EmailViaOutlook(sTo,sSubject,sBodyText,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);
        end;
      finally
        DataBroker.Free;
      end;
    end;
  finally
    PBEmailListFrm.Free;
  end;
end;

procedure TPBRSQuoNFrm.BuildFaxDetails;
var
  irow: Integer;
begin
  with GetEnqSQL do
  begin
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Enquiry').AsString;
      FaxArray[irow, 2] := FieldByName('Customer').AsString;
      FaxArray[irow, 3] := FieldByName('Branch_no').AsString;
      FaxArray[irow, 4] := Trim(FieldByName('Cust_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      if trim(FieldByName('Contact_Fax').AsString) = '' then
        FaxArray[irow, 5] := FieldByName('Fax_Number').AsString
      else
        FaxArray[irow, 5] := FieldByName('Contact_Fax').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

procedure TPBRSQuoNFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with GetEnqSQL do
  begin
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Enquiry').AsString;
      EmailArray[irow, 2] := FieldByName('Customer').AsString;
      EmailArray[irow, 3] := FieldByName('Branch_no').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Cust_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      EmailArray[irow, 5] := FieldByName('Contact_Name').AsString;
      EmailArray[irow, 6] := FieldByName('Email').AsString;
      EmailArray[irow, 7] := FieldByName('Salutation').AsString;
      EmailArray[irow, 8] := FieldByName('ExportFilter').AsString;
      EmailArray[irow, 9] := FieldByName('ExportFilter_Descr').AsString;
      EmailArray[irow, 10] := FieldByName('Contact_no').AsString;
      EmailArray[irow, 11] := FieldByName('Description').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

procedure TPBRSQuoNFrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 5 do
      FaxArray[icount, icount1] := '';
end;

procedure TPBRSQuoNFrm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 11 do
      EmailArray[icount, icount1] := '';
end;

procedure TPBRSQuoNFrm.FormActivate(Sender: TObject);
begin
  if not FActDone then
  begin
    GetEmailApp;
    CanPrint(Self);
    EnquiryMemo.SetFocus;
    FActDone := true;
  end;
end;

procedure TPBRSQuoNFrm.GetEmailApp;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      FEmailApplication := ReadString('Email', 'Application', 'None');
      FEmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
      Free;
    end;
end;

procedure TPBRSQuoNFrm.EnquiryMemoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CanPrint(Self);
end;

procedure TPBRSQuoNFrm.EnquiryMemoKeyPress(Sender: TObject; var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBRSQuoNFrm.RollThePresses(aBroker: TDataBroker);
var
  PrintingPress : TfrmPrintingPress;
  icount: integer;
begin
  PrintingPress := TfrmPrintingPress.Create(Self);
  try
    PrintingPress.DataBroker := aBroker;
    FPrinted := false;
    if Preview then
      PrintingPress.QuickR.Preview
    else
    begin
      if FFaxing then
        begin
        PrintingPress.QuickR.Print
        {New fax driver - wait for the fax to finish - ACH 14/01/03} ;
        PBSendFaxFrm.WaitForFaxFinish(Self) ;
        end
      else
      if FEmail then
        begin
          PrintToAttachment(PrintingPress,DataBroker.EnquiryNo);
        end
      else
        begin
          GetDefaultPrinter;
          {Find the default printer in the list of printers }
          Printer.PrinterIndex := -1;
          for icount := 0 to pred(Printer.Printers.count) do
            begin
              if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
                Printer.PrinterIndex := icount;
            end;
          if DefaultPrinter <> '' then
            begin
              SetPrinterBin(DefaultBin);
            end;
          if SetupPrinter(aBroker.PrinterSettings) then
            begin
              PrintingPress.QuickR.Print;
              DefaultPrinter := printer.Printers[printer.printerindex];
              DefaultBin := GetBinSelection;
              SaveDefaultPrinter;
              FPrinted := true;
            end;
        end
    end;
  finally
    Application.ProcessMessages;
    printer.printerindex := -1;
    PrintingPress.Free;
  end;
end;

procedure TPBRSQuoNFrm.PrintToAttachment(PrintingPress: TfrmPrintingPress; EnqNumber: integer);
var
  i: integer;
  sLocation, sFileName: string;
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

(*  sFileName := 'QTE' + inttostr(EnqNumber);
{$IFDEF PMS}
  sFileName := 'EST' + inttostr(EnqNumber);
{$ENDIF}
*)

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

{$IFDEF PMS}
  {Format is 'EST'  + Enquiry Number + Random Number}
  sFileName := 'EST' + inttostr(FEnquiry) + '-' + sFilename;
{$ELSE}
  {Format is 'QTE'  + Enquiry Number + Random Number}
  sFileName := 'QTE' + inttostr(FEnquiry) + '-' + sFilename;
{$ENDIF}

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(RTFFilter);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(PDFFilter);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;

  FPrinted := true;
  AFilters.free;
end;

procedure TPBRSQuoNFrm.LoadCombos;
begin
  cmbPageLayout.Items.Clear;
  cmbLetterLayout.Items.Clear;
  if dmLetter.OldDatabase then
  begin
    TypeRadioGroup.Hide;
    cmbPageLayout.Items.Add('Blank');
    cmbPageLayout.Items.Add('Preprinted');
    if TypeRadioGroup.ItemIndex = 0 then
      cmbLetterLayout.Items.Add('Quotation')
    else
      cmbLetterLayout.Items.Add('Quotation Summary');
    if cmbPageLayout.Items.Count > 0 then
      cmbPageLayout.ItemIndex := 0;
    if cmbLetterLayout.Items.Count > 0 then
      cmbLetterLayout.ItemIndex := 0;
  end
  else
  begin
    cmbPageLayout.Items.Assign(dmLetter.GetPageLayoutList);
    cmbLetterLayout.Items.Assign(dmLetter.GetLetterLayoutList(LetterType));
    cmbPageLayout.ItemIndex :=
      cmbPageLayout.Items.IndexOf(dmLetter.PrintDefaultLayout);
    cmbLetterLayout.ItemIndex :=
      cmbLetterLayout.Items.IndexOf(dmLetter.GetLetterDefault(LetterType));    
  end;
end;

procedure TPBRSQuoNFrm.FormCreate(Sender: TObject);
var
  Year, Month, Day, DOW: Word;
  tmpDate: TDate;
  IniFile : TIniFile;
  sPageLayout, sLetterLayout: string;
begin
  if dmBroker.UseCRM and frmPBMainMenu.mnuActivities.Enabled then
    begin
//      self.height := 263;
      DecodeDateFully(now,Year, Month, Day,DOW);

      case DOW of
        1..4: dtReminderDate.Date := incday(now,2);
        5..6: dtReminderDate.Date := incday(now,4);
        7: dtReminderDate.Date := incday(now,3);
      end;

      dtReminderDate.Time := Time;
    end
  else
    begin
      pnlReminder.Visible := false;
//      self.height := 205;
    end;

  FEmailAttachment := TStringList.create;
  LetterType := ltQuotation;
  LoadCombos;
  { Check to see if we have an old or new database and adjust the
    form accordingly }
  if dmLetter.OldDatabase then
  begin
    gbLayouts.Hide;
    cbPrintLogo.Show;
    cbPrintLogo.Checked := true;
    cbPrintLogo.Checked := false;
    ClientHeight := ClientHeight - gbLayouts.Height;
  end;

  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  try
  with IniFile do
    begin
      sPageLayout := ReadString('Quotes', 'Page Layout', '');
      sLetterLayout := ReadString('Quotes', 'Letter Layout', '');

      try
        if sPageLayout <> '' then
          cmbPageLayout.itemindex := cmbPageLayout.Items.IndexOf(sPageLayout);
      except
        cmbPagelayout.ItemIndex := 0;
      end;

      try
        if sLetterLayout <> '' then
          cmbLetterLayout.itemindex := cmbLetterLayout.items.IndexOf(sLetterLayout);
      except
        cmbLetterLayout.itemindex := 0;
      end;
    end;
  finally
    IniFile.Free;
  end;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBRSQuoNFrm.cbPrintLogoClick(Sender: TObject);
begin
  if cbPrintLogo.Checked then
    cmbPageLayout.ItemIndex := 0
  else
    cmbPageLayout.ItemIndex := 1;
end;

procedure TPBRSQuoNFrm.TypeRadioGroupClick(Sender: TObject);
begin
  if TypeRadioGroup.ItemIndex = 0 then
    LetterType := ltQuotation
  else
    LetterType := ltQuotationSummary;
  cmbLetterLayout.Items.Clear;
  if dmLetter.OldDatabase then
  begin
    if TypeRadioGroup.ItemIndex = 0 then
      cmbLetterLayout.Items.Add('Quotation')
    else
      cmbLetterLayout.Items.Add('Quotation Summary');
    if cmbLetterLayout.Items.Count > 0 then
      cmbLetterLayout.ItemIndex := 0;
  end
  else
  begin
    cmbLetterLayout.Items.Assign(dmLetter.GetLetterLayoutList(LetterType));
    cmbLetterLayout.ItemIndex :=
        cmbLetterLayout.Items.IndexOf(dmLetter.GetLetterDefault(LetterType));    
  end;
end;

function TPBRSQuoNFrm.DBFactory(aClass: TQuoLetterClass): Pointer;
begin
  Result := aClass.Create(Self);
end;

procedure TPBRSQuoNFrm.CreateDataBroker;
begin
  if LetterType = ltQuotation then
    DataBroker := TdbQuoLtr(DBFactory(TdbQuoLtr))
  else
    DataBroker := TdbQuoSumLtr(DBFactory(TdbQuoSumLtr));
end;

procedure TPBRSQuoNFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
  iPDFResult: integer;
begin
(*  Math.SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide,
                         exOverflow, exUnderflow, exPrecision]);

  iPDFResult := 0;
  iPDFResult := MergePDFs('D:\tmp\Quotation.pdf', 'D:\tmp\Price Guide.pdf', 'D:\tmp\Calderstone.pdf', 'Paul Allanson', '18/04/2019', '860025', 'Leeds United Fixture List');

  if iPDFResult = -99 then
    messagedlg('An exception error -99 occurred', mtError, [mbOk], 0)
  else
  if iPDFResult = -2 then
    messagedlg('Exception -2 - PDF not found', mtError, [mbOk], 0)
  else
  if iPDFResult = -1 then
    messagedlg('An exception error -1 occurred', mtError, [mbOk], 0)
  else
  if iPDFResult = 0 then
    messagedlg('Unknown', mtError, [mbOk], 0)
  else
    messagedlg('Merge Completed', mtConfirmation, [mbOk], 0);

  Math.SetExceptionMask([exDenormalized, exOverflow, exUnderflow, exPrecision]);
  exit;
*)
  dmBroker.bEmailSent := false;
  FEmail := True;
  try
    Preview := False;
    ClearEmailArray(Self);

    sStudioPriceListFile := dmBroker.GetStudioPriceListFile;

    EmailReport(Self);
    if dmBroker.UseCRM and FPrinted and frmPBMainMenu.mnuActivities.enabled and frmPBMainMenu.QuoteReminder then
      AddActivity;
    bOK := true;
  finally
    FEmail := False;
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);

        if sFilename <> sStudioPriceListFile then
          deletefile(sFilename);
      end;
    Printer.PrinterIndex := -1;  { Set printer back to default }
//    if (FEmailSent) and (frmPBMainMenu.EmailApplication = 'GENERIC') and (FCustomerName <> '') then
    if (frmPBMainMenu.EmailApplication = 'GENERIC') and dmBroker.bEmailSent then
      begin
        messagedlg('Emails have been added to your Email Server and will be sent shortly.', mtInformation, [mbOk], 0);
        close;
      end;
  end;
end;

procedure TPBRSQuoNFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Quotes', 'Page Layout', cmbPageLayout.text);
      WriteString('Quotes', 'Letter Layout', cmbLetterLayout.text);
    end;

  FEmailAttachment.free;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBRSQuoNFrm.GetDefaultPrinter;
var
  sBin: string;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Quotation Printer', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

  GetPrivateProfileString('Centrereed Broker', 'Quotation Bin', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;
end;

procedure TPBRSQuoNFrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Quotation Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Quotation Bin',inttostr(DefaultBin));
      Free;
    end;

  printer.printerindex := -1;
end;

procedure TPBRSQuoNFrm.SetPrinterBin(BinCode : integer );
var
  DevMode : PDeviceMode;
  hDevMode: THandle;
  Device,Driver,Port: array [0..1024] of Char;
begin
  Printer.GetPrinter (Device,Driver,Port,hDevMode);
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        DevMode^.DMDEFAULTSOURCE := BinCode;
        GlobalUnlock (hDevMode);
  end;
end;

function TPBRSQuoNFrm.GetBinSelection: integer;
var
     hDevMode: THandle;
     Device,Driver,Port: array [0..1024] of Char;
     bin: integer;
     DevMode : PDevMode;
begin
  Printer.GetPrinter (Device,Driver,Port,hDevMode);
  bin := -1;
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        bin := DevMode^.DMDEFAULTSOURCE;
        GlobalUnlock (hDevMode);
  end;
  result := bin;
end;

procedure TPBRSQuoNFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBRSQuoNFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TPBRSQuoNFrm.AddActivity;
var
  key: integer;
  iActivityType: integer;
  iOriginalActivity: integer;
  aActivity : TActivity;
begin
  {Get the Enquiry details}
  with GetEnqSQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := StrToInt(EnquiryMemo.Text);
      ParamByName('Operator').AsInteger := 0;
      Open;
    end;


  {Check if Previous Enquiry Activity type already exists}
  iOriginalActivity := 0;
  iActivityType := dmBroker.GetDefaultEnquiryActivityType;

  with dmBroker.qryCheckActivity do
    begin
      close;
      ParamByName('Entity_Reference').AsString := trim(EnquiryMemo.Text);
      ParamByName('Activity_Type').AsInteger := iActivityType;
      ParamByName('Activity_Module').AsInteger := 20;
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      open;

      if recordcount > 0 then
        iOriginalActivity := fieldbyname('Activity').asinteger;
    end;

  {Check if Quote Activity type already exists}
  iActivityType := dmBroker.GetDefaultQuoteActivityType;

  with dmBroker.qryCheckActivity do
    begin
      close;
      ParamByName('Entity_Reference').AsString := trim(EnquiryMemo.Text);
      ParamByName('Activity_Type').AsInteger := iActivityType;
      ParamByName('Activity_Module').AsInteger := 20;
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      open;

      if recordcount > 0 then exit;
    end;

  dtmdlActivities := TdtmdlActivity.create(self);
  try
    aActivity := TActivity.Create(dtmdlActivities);
    try
      aActivity.DbKey := 0;

      if iActivityType = 0 then
        aActivity.ActivityType := 1
      else
        aActivity.ActivityType := iActivityType;

      aActivity.AssignedTo := GetEnqSQL.fieldbyname('Office_Contact').asinteger;
      aActivity.Customer := GetEnqSQL.fieldbyname('Customer').asinteger;
      aActivity.Branch := GetEnqSQL.fieldbyname('Branch_no').asinteger;
      aActivity.Contact := GetEnqSQL.fieldbyname('Contact_no').asinteger;
      aActivity.DateTimeEntered := now;
      aActivity.DueDateTime := dtReminderDate.DateTime;
      aActivity.EntityReference := EnquiryMemo.Text;
      aActivity.EntityReferenceDescription := GetEnqSQL.fieldbyname('Description').asstring;
      aActivity.Module := 20;
      aActivity.Operator := frmPBMainMenu.iOperator;
      aActivity.Priority := 20;
      aActivity.Reminder := false;
      aActivity.StartDateTime := 0;
      aActivity.Status := 20;
      aActivity.OriginalActivity := iOriginalActivity;
      aActivity.Subject := 'Follow Up Quotation ' + EnquiryMemo.Text;
      aActivity.SaveToDB(true);
    finally
      aActivity.free;
    end;
  finally
    dtmdlActivities.free;
  end;

  if iOriginalActivity > 0 then
    begin
      dtmdlActivities := TdtmdlActivity.create(self);
      try
        aActivity := TActivity.Create(dtmdlActivities);
        try
          aActivity.DbKey := iOriginalActivity;
          aActivity.LoadFromDB;

          aActivity.Status := 30;
          aActivity.SaveToDB(true);
        finally
          aActivity.free;
        end;
      finally
        dtmdlActivities.free;
      end;
    end;
end;

end.
