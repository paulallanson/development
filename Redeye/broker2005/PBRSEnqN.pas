unit PBRSEnqN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, CCSDataBroker, CCSPress, QrExport,
  CCSCommon, Inifiles, Menus, ComCtrls, DateUtils, PBActivityDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSEnqNFrm = class(TForm)
    GetEnqSQL: TFDQuery;
    GetEnqSuppSQL: TFDQuery;
    pnlButtons: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    EmailBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    EstNumLabel: TLabel;
    EnquiryMemo: TMemo;
    CBFileCpy: TCheckBox;
    pnlTop: TPanel;
    gbLayouts: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbPageLayout: TComboBox;
    cmbLetterLayout: TComboBox;
    pnlReminder: TPanel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    dtReminderDate: TDateTimePicker;
    StatusBar1: TStatusBar;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure EnquiryMemoExit(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure EmailReport(Sender: TObject);
    procedure BuildFaxDetails;
    procedure BuildEmailDetails;
    procedure ClearFaxArray(Sender: TObject);
    procedure ClearEmailArray(Sender: TObject);
    procedure EnquiryMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EnquiryMemoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CBFileCpyClick(Sender: TObject);
  private
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    procedure AddActivity;
  private
    FPrinted : Boolean;
    FEmail : Boolean;
    FFaxing : Boolean;
    FEmailAttachment : TstringList;
    FEmailApplication : string;
    FEmailLocation : string;
    FEnquiry : integer;
    FActDone : Boolean;
    bFileCopy: boolean;
    FSupplierName: string;
    Preview: ByteBool;
    DisplayPrintDialog : Boolean;
    dtmdlActivities : TdtmdlActivity;
    procedure LoadCombos;
    procedure GetEmailApp;
    procedure RollThePresses(aBroker : TDataBroker);
    procedure PrintToAttachment(PrintingPress: TfrmPrintingPress);
    function GetBinSelection: integer;
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    procedure SetPrinterBin(BinCode: integer);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  public
    bOK: boolean;
    sDescription: string;
  end;

var
  PBRSEnqNFrm: TPBRSEnqNFrm;
  FaxArray: array[1..100, 1..5] of string;
  EmailArray: array[1..100, 1..11] of string;

implementation

uses
  PBFaxList, LetterDM, PBEmailList, PBSendFax, PBDBEnqLtr, pbMainMenu, printers,
  CCSPrint, PDLetter, pbDatabase, Printer.Tools;

var
  sAttachmentType: string;

{$R *.DFM}

procedure TPBRSEnqNFrm.CanPrint(Sender: TObject);
var
  Printable : Boolean;
begin
  Printable := ((cmbPageLayout.Text <> '') and (cmbLetterLayout.Text <> '')) and
    (EnquiryMemo.Text <> '');
  {Check if can print}
  PrintBitBtn.Enabled := Printable;
  PreviewBitBtn.Enabled := Printable;
  EmailBitBtn.Enabled := Printable and (FEMailApplication <> '');
end;

procedure TPBRSEnqNFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  begin
    EstNumLabel.Enabled := True;
    EnquiryMemo.Enabled := True;
  end;
  CanPrint(Self);
end;

procedure TPBRSEnqNFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  FFaxing := false;
  DisplayPrintDialog := false;
  PrintReport(Self);
end;

procedure TPBRSEnqNFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  FFaxing := false;
  DisplayPrintDialog := True;
  PrintReport(Self);
  if dmBroker.UseCRM and FPrinted and frmPBMainMenu.mnuActivities.enabled and frmPBMainMenu.EnquiryReminder then
    AddActivity;
  bOK := true;
end;

procedure TPBRSEnqNFrm.PrintReport(Sender: TObject);
var
  dbEnqLtr : TdbEnqLtr;
begin
  {Setup and print the report}
  dbEnqLtr := TdbEnqLtr.Create(Self);
  try
    dbEnqLtr.Operator := frmPBMainMenu.iOperator;
    dbEnqLtr.Preview := Preview;
    dbEnqLtr.LayoutName := cmbPageLayout.Text;
    dbEnqLtr.LetterName := cmbLetterLayout.Text;
    dbEnqLtr.EnquiryNo := StrToInt(EnquiryMemo.Text);
    dbEnqLtr.OnlyMine := false;

    dbEnqLtr.Operator := 0;

    dbEnqLtr.BySupplier := 'N';
    dbEnqLtr.ByBranch := 'N';
    if Preview then
      dbEnqLtr.FileCopy := false
    else
      dbEnqLtr.FileCopy := true;

    if dbEnqLtr.GetDetails = 0 then
      MessageDlg('There is nothing to print', mtError, [mbAbort], 0)
    else
      RollThePresses(dbEnqLtr);
  finally
    dbEnqLtr.Free;
  end;
end;

procedure TPBRSEnqNFrm.FaxReport(Sender: TObject);
var
  dbEnqLtr : TdbEnqLtr;
  faxfound: boolean;
  icount, irow: Integer;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  with GetEnqSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := StrToInt(EnquiryMemo.Text);

    ParamByName('Operator').AsInteger := 0;
    ParamByName('Supplier').AsInteger := 0;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print}
      MessageDlg('There is nothing to fax', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildFaxDetails;

  {For each of the Enquiry/Supplier details print a fax}
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
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Supplier/Branch';
    PBFaxListFrm.ShowModal;

    {If OK to do the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
    begin
      dbEnqLtr := TdbEnqLtr.Create(Self);
      try
//        dbEnqLtr.Operator := PBMenuMainFrm.iOperator;
        dbEnqLtr.BySupplier := 'Y';
        dbEnqLtr.ByBranch := 'Y';
        dbEnqLtr.LetterName := cmbLetterLayout.Text;
        dbEnqLtr.LayoutName := dmLetter.FaxDefaultLayout;
        for irow := 1 to PBFaxListFrm.FaxListGrid.RowCount - 1 do
        begin
          if Trim(PBFaxListFrm.FaxListgrid.Cells[2, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          dbEnqLtr.EnquiryNo := StrToInt(FaxArray[irow, 1]);
          dbEnqLtr.Supplier := StrToInt(FaxArray[irow, 2]);
          dbEnqLtr.Branch := StrToInt(FaxArray[irow, 3]);
          DisplayPrintDialog := false;
          FaxFound := PBSendFaxfrm.OutToFax(PBFaxListFrm.FaxListgrid.Cells[2, irow],
            'Enq: ' + IntToStr(dbEnqLtr.EnquiryNo) + ' to ' + FaxArray[irow, 4], '');
          if (not FaxFound) then
            MessageDlg('The fax driver is not installed', mtError, [mbOK], 0)
          else
            RollThePresses(dbEnqLtr);
        end;
      finally
        dbEnqLtr.Free;
      end;
    end;
  finally
    PBFaxListFrm.Free;
  end;
end;

procedure TPBRSEnqNFrm.EmailReport(Sender: TObject);
var
  dbEnqLtr : TdbEnqLtr;
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
    ParamByName('Supplier').AsInteger := 0;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print}
      MessageDlg('There is nothing to email', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the Enquiry/Supplier details print a fax}
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
      PBEmailListFrm.UseBranchAddr[icount] := (EmailArray[icount, 11] = 'Y');
    end;
    PBEmailListFrm.EmailListGrid.RowCount := icount;
    PBEmailListFrm.Caption := 'Enquiry Email List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'Enquiry';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Supplier/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';

    PBEmailListFrm.CodeType := 'S';
    PBEmailListFrm.ShowModal;

    {If OK to send the email then send them}
    if PBEmailListFrm.ModalResult = idok then
    begin
      dbEnqLtr := TdbEnqLtr.Create(Self);
      try
//        dbEnqLtr.Operator := frmPBMainMenu.iOperator;

        dbEnqLtr.BySupplier := 'Y';
        dbEnqLtr.ByBranch := 'Y';
        dbEnqLtr.LetterName := cmbLetterLayout.Text;
        dbEnqLtr.LayoutName := dmLetter.FaxDefaultLayout;
        if dbEnqLtr.LayoutName = 'Blank' then
          dbEnqLtr.LayoutName := cmbPageLayout.text;

        for irow := 1 to PBEmailListFrm.EmailListGrid.RowCount - 1 do
        begin
          if Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]) = '' then Continue;

          {Now email the individual enquiries to the individual suppliers}
          dbEnqLtr.EnquiryNo := StrToInt(EmailArray[irow, 1]);
          dbEnqLtr.Supplier := StrToInt(EmailArray[irow, 2]);
          dbEnqLtr.Branch := StrToInt(EmailArray[irow, 3]);
          FSupplierName := PBEmailListFrm.EmailListGrid.Cells[1, irow];
          DisplayPrintDialog := false;
          FEnquiry := dbEnqLtr.EnquiryNo;

          sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
          RollThePresses(dbEnqLtr);

          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
          sSubject := 'Enquiry Number: '+EmailArray[irow, 1] + ', ' + sDescription;
          sSalutation := EmailArray[irow,7];
          sSenderName := frmPBMainMenu.sOperator_Name;
          sSenderEmail := frmPBMainMenu.sOperator_Email;

          sRecipientName := EmailArray[irow,5];

          sBodyText := dmBroker.GetEmailEnquiryText;

          if trim(sBodyText) = '' then
                sBodyText := 'Please find attached, enquiry ' + EmailArray[irow,1] + '.' + #13#10#13#10
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
              sBodyText := stringreplace(sBodyText, '<Description>', sDescription, [rfIgnoreCase])
            end;

          if frmPBMainMenu.EmailApplication = 'GENERIC' then
            {Send to Email database}
            dmBroker.EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, sTo,sSubject,sBodyText,FEmailAttachment,
                                      frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount, frmPBMainMenu.sOperator_Name, frmPBMainMenu.sCompName)
          else
            {Send using Outlook}
            EmailViaOutlook(sTo,sSubject,sBodyText,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);
        end;
      finally
        dbEnqLtr.Free;
      end;
    end;
  finally
    PBEmailListFrm.Free;
  end;
end;

procedure TPBRSEnqNFrm.BuildFaxDetails;
var
  irow: Integer;
begin
  with GetEnqSuppSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := StrToInt(EnquiryMemo.Text);
    ParamByName('Operator').AsInteger := 0;
    Open;

    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Enquiry').AsString;
      FaxArray[irow, 2] := FieldByName('Supplier').AsString;
      FaxArray[irow, 3] := FieldByName('Branch_no').AsString;
      FaxArray[irow, 4] := Trim(FieldByName('Supp_Name').AsString) + ', ' +
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

procedure TPBRSEnqNFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with GetEnqSuppSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := StrToInt(EnquiryMemo.Text);

    ParamByName('Operator').AsInteger := 0;
    Open;

    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Enquiry').AsString;
      EmailArray[irow, 2] := FieldByName('Supplier').AsString;
      EmailArray[irow, 3] := FieldByName('Branch_no').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Supp_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      EmailArray[irow, 5] := FieldByName('Contact_Name').AsString;

      if FieldByName('Email').AsString <> '' then
      begin
        EmailArray[irow, 6] := FieldByName('Email').AsString;
        EmailArray[irow, 11] := 'N';
      end
      else
      begin
        EmailArray[irow, 6] := FieldByName('branchEmail').AsString;
        EmailArray[irow, 11] := 'Y';
      end;

      EmailArray[irow, 7] := FieldByName('Salutation').AsString;
      EmailArray[irow, 8] := FieldByName('ExportFilter').AsString;
      EmailArray[irow, 9] := FieldByName('ExportFilter_Descr').AsString;
      EmailArray[irow, 10] := FieldByName('Contact_no').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

procedure TPBRSEnqNFrm.FaxBitBtnClick(Sender: TObject);
begin
  FFaxing := True;
  try
    Preview := False;
    DisplayPrintDialog := false;
    ClearFaxArray(Self);
    FaxReport(Self);
    bOK := true;
  finally
    FFaxing := False;
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
end;

procedure TPBRSEnqNFrm.FormActivate(Sender: TObject);
begin
  FEmailAttachment := TStringList.create;
  if not FActDone then
  begin
    GetEmailApp;
    DisplayPrintDialog := true;
    CanPrint(Self);
    EnquiryMemo.SetFocus;
    FActDone := true;
  end;
end;

procedure TPBRSEnqNFrm.GetEmailApp;
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

procedure TPBRSEnqNFrm.CancelBitBtnClick(Sender: TObject);
begin
  ModalResult := mrcancel;
end;

procedure TPBRSEnqNFrm.EnquiryMemoExit(Sender: TObject);
begin
  {Validate that enquiry number is numeric}
  if EnquiryMemo.Text = '' then Exit;
  try
    StrToInt(EnquiryMemo.Text);
  except
    MessageDlg('The enquiry number is invalid', mtError, [mbOK], 0);
    EnquiryMemo.SetFocus;
    Exit;
  end;
  CanPrint(Self);
end;

procedure TPBRSEnqNFrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 5 do
      FaxArray[icount, icount1] := '';
end;

procedure TPBRSEnqNFrm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TPBRSEnqNFrm.EnquiryMemoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CanPrint(Self);
end;

procedure TPBRSEnqNFrm.FormShow(Sender: TObject);
begin
  EnquiryMemo.SetFocus;
end;

procedure TPBRSEnqNFrm.EnquiryMemoKeyPress(Sender: TObject; var Key: Char);
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

procedure TPBRSEnqNFrm.RollThePresses(aBroker: TDataBroker);
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
      if DisplayPrintDialog then
        begin
        GetDefaultPrinter;
        {Find the default printer in the list of printers }
        Printers.Printer.PrinterIndex := -1;
        for icount := 0 to pred(Printers.Printer.Printers.count) do
          begin
            if pos(DefaultPrinter,Printers.Printer.Printers[icount]) > 0 then
              Printers.Printer.PrinterIndex := icount;
          end;
        if DefaultPrinter <> '' then
          begin
            SetPrinterBin(DefaultBin);
          end;
        if SetupPrinter(aBroker.PrinterSettings) then
          begin
            PrintingPress.QuickR.Print;
            DefaultPrinter := Printers.Printer.Printers[printers.Printer.printerindex];
            DefaultBin := GetBinSelection;
            SaveDefaultPrinter;
            FPrinted := true;
          end;
        end
      else
        if FEmail then
          begin
          PrintToAttachment(PrintingPress);
          end
        else
          begin
          PrintingPress.QuickR.Print;
          {New fax driver - wait for the fax to finish - ACH 14/01/03} ;
          If FFaxing then
                PBSendFaxFrm.WaitForFaxFinish(Self) ;
          end;
    end;
  finally
    Application.ProcessMessages;
    Printers.Printer.PrinterIndex := -1;
    PrintingPress.Free;
  end;
end;

procedure TPBRSEnqNFrm.PrintToAttachment(PrintingPress: TfrmPrintingPress);
begin
  var fileName := 'ENQ' + FEnquiry.ToString;
  PrinterTools.New.PrintToAttachment(PrintingPress.QuickR, FEmailAttachment, fileName, sAttachmentType);
end;

(* GDK ToDo: remove after tests
procedure TPBRSEnqNFrm.PrintToAttachment(PrintingPress: TfrmPrintingPress);
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

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);
  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

  {Format is 'ENQ' + Enquiry Number + Random Number}
  sFileName := 'ENQ' + inttostr(FEnquiry) + '-' + sFilename;

  {Filename based on Enquiry number and supplier name}
//  sFileName := 'ENQ' + inttostr(FEnquiry);

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
*)

procedure TPBRSEnqNFrm.LoadCombos;
begin
  cmbPageLayout.Items.Clear;
  cmbLetterLayout.Items.Clear;
  if dmLetter.OldDatabase then
  begin
    cmbPageLayout.Items.Add('Blank');
    cmbPageLayout.Items.Add('Preprinted');
    cmbLetterLayout.Items.Add('Enquiry');
    if cmbPageLayout.Items.Count > 0 then
      cmbPageLayout.ItemIndex := 0;
    if cmbLetterLayout.Items.Count > 0 then
      cmbLetterLayout.ItemIndex := 0;
  end
  else
  begin
    cmbPageLayout.Items.Assign(dmLetter.GetPageLayoutList);
    cmbLetterLayout.Items.Assign(dmLetter.GetLetterLayoutList(ltEnquiry));
    cmbPageLayout.ItemIndex :=
      cmbPageLayout.Items.IndexOf(dmLetter.PrintDefaultLayout);
    cmbLetterLayout.ItemIndex :=
      cmbLetterLayout.Items.IndexOf(dmLetter.GetLetterDefault(ltEnquiry));
  end;
end;

procedure TPBRSEnqNFrm.FormCreate(Sender: TObject);
var
  Year, Month, Day, DOW: Word;
  tmpDate: TDate;
  IniFile : TIniFile;
  sPageLayout, sLetterLayout: string;
begin
  if dmBroker.UseCRM and frmPBMainMenu.mnuActivities.Enabled then
    begin
      pnlReminder.Visible := true;
//      self.height := 248;
      DecodeDateFully(now,Year, Month, Day,DOW);

      case DOW of
        1..5: dtReminderDate.Date := incday(now,1);
        6: dtReminderDate.Date := incday(now,3);
        7: dtReminderDate.Date := incday(now,2);
      end;

      dtReminderDate.Time := Time;
    end
  else
    begin
      pnlReminder.Visible := false;
//      self.height := 192;
    end;

  LoadCombos;

  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  try
  with IniFile do
    begin
      sPageLayout := ReadString('Enquiries', 'Page Layout', '');
      sLetterLayout := ReadString('Enquiries', 'Letter Layout', '');

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

procedure TPBRSEnqNFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  dmBroker.bEmailSent := false;
  FEmail := True;
  try
    Preview := False;
    DisplayPrintDialog := false;
    ClearEmailArray(Self);
    EmailReport(Self);
    if dmBroker.UseCRM and FPrinted and frmPBMainMenu.mnuActivities.enabled and frmPBMainMenu.EnquiryReminder then
      AddActivity;
  finally
    FEmail := False;
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
//    if (frmPBMainMenu.EmailApplication = 'GENERIC') and (FSupplierName <> '') then
    if (frmPBMainMenu.EmailApplication = 'GENERIC') and dmBroker.bEmailSent then
      begin
        messagedlg('Emails have been added to your Email Server and will be sent shortly.', mtInformation, [mbOk], 0);
        close;
      end;
  end;
end;

procedure TPBRSEnqNFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Enquiries', 'Page Layout', cmbPageLayout.text);
      WriteString('Enquiries', 'Letter Layout', cmbLetterLayout.text);
    end;

  FEmailAttachment.free;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBRSEnqNFrm.CBFileCpyClick(Sender: TObject);
begin
  EmailBitBtn.Enabled := (CBFileCpy.Checked = False);
end;

procedure TPBRSEnqNFrm.GetDefaultPrinter;
var
  sBin: string;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Enquiry Printer', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

  GetPrivateProfileString('Centrereed Broker', 'Enquiry Bin', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;
end;

procedure TPBRSEnqNFrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Enquiry Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Enquiry Bin',inttostr(DefaultBin));
      Free;
    end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TPBRSEnqNFrm.SetPrinterBin(BinCode : integer );
var
  DevMode : PDeviceMode;
  hDevMode: THandle;
  Device,Driver,Port: array [0..1024] of Char;
begin
  Printers.Printer.GetPrinter (Device,Driver,Port,hDevMode);
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        DevMode^.DMDEFAULTSOURCE := BinCode;
        GlobalUnlock (hDevMode);
  end;
end;

function TPBRSEnqNFrm.GetBinSelection: integer;
var
     hDevMode: THandle;
     Device,Driver,Port: array [0..1024] of Char;
     bin: integer;
     DevMode : PDevMode;
begin
  Printers.Printer.GetPrinter (Device,Driver,Port,hDevMode);
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

procedure TPBRSEnqNFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBRSEnqNFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TPBRSEnqNFrm.AddActivity;
var
  key: integer;
  iActivityType: integer;
  aActivity : TActivity;
begin
  {Get the Enquiry details}
  with GetEnqSQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := StrToInt(EnquiryMemo.Text);
      ParamByName('Supplier').AsInteger := 0;
      ParamByName('Operator').AsInteger := 0;
      Open;
    end;

  iActivityType := dmBroker.GetDefaultEnquiryActivityType;

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
      aActivity.Subject := 'Chase Enquiry from Supplier ' + EnquiryMemo.Text;
      aActivity.SaveToDB(true);
    finally
      aActivity.free;
    end;
  finally
    dtmdlActivities.free;
  end;
end;

end.
