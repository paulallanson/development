unit PBRSPOrdN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, CCSDataBroker, QrExport,
  OleServer, CCSCommon, CCSPress, IniFiles, ComCtrls, PBActivityDM, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSPOrdNFrm = class(TForm)
    GetPOsSQL: TFDQuery;
    GetAcksSQL: TFDQuery;
    qryGetPODelivs: TFDQuery;
    pnlBottom: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    EmailBitBtn: TBitBtn;
    Panel1: TPanel;
    gbLayouts: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cmbPageLayout: TComboBox;
    cmbLetterLayout: TComboBox;
    pnlButtons: TPanel;
    cbPrintLogo: TCheckBox;
    SelOneGrpBox: TGroupBox;
    EstNumLabel: TLabel;
    EnquiryMemo: TMemo;
    TypeRadioGroup: TRadioGroup;
    chkbxAttachDelNote: TCheckBox;
    chkbxAttachLabels: TCheckBox;
    pnlLabels: TPanel;
    grpbxLabels: TGroupBox;
    chkAddressOnly: TCheckBox;
    rdbtnCustAddr: TRadioButton;
    rdbtnDelAddr: TRadioButton;
    StatusBar1: TStatusBar;
    qryGetPO: TFDQuery;
    Label12: TLabel;
    dblkpLogos: TDBLookupComboBox;
    FormRefClrBitBtn: TBitBtn;
    qryLogos: TFDQuery;
    dtsLogos: TDataSource;
    procedure CanPrint(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure FaxPOReport(Sender: TObject);
    procedure FaxAckReport(Sender: TObject);
    procedure EmailReport(Sender: TObject);
    procedure EmailPOReport(Sender: TObject);
    procedure EmailAckReport(Sender: TObject);
    procedure BuildPOFaxDetails;
    procedure BuildAckFaxDetails;
    procedure BuildPOEmailDetails;
    procedure BuildAckEmailDetails;
    procedure ClearFaxArray(Sender: TObject);
    procedure ClearEMailArray(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EnquiryMemoKeyPress(Sender: TObject; var Key: Char);
    procedure EnquiryMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TypeRadioGroupClick(Sender: TObject);
    procedure cbPrintLogoClick(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkbxAttachDelNoteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkbxAttachLabelsClick(Sender: TObject);
    procedure cmbPageLayoutChange(Sender: TObject);
    procedure cmbLetterLayoutChange(Sender: TObject);
    procedure FormRefClrBitBtnClick(Sender: TObject);
  private
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    procedure AddActivity;
  private
    dtmdlActivities : TdtmdlActivity;
    FPrinted: boolean;
    FActivated : Boolean;
    FCustSupplierName: string;
    FFaxing : Boolean;
    FEMail : Boolean;
    FEmailAttachment : TstringList;
    FEmailApplication : string;
    FEmailLocation : string;
    FPOrder: real;
    LetterType : integer;
    Preview: Boolean;
    DisplayPrintDialog : Boolean;
    sSalesTermsFile, sPurchaseTermsFile: string;
    sAckPageLayout, sAckLetterLayout: string;
    sPOPageLayout, sPOLetterLayout: string;
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
    bAuthorised: boolean;
  end;

var
  PBRSPOrdNFrm: TPBRSPOrdNFrm;
  FaxArray: array[1..100, 1..6] of string;
  EMailArray: array[1..100, 1..11] of string;

implementation

uses
  PBFaxList, PBDBPOrdLtr, LetterDM, PBSendFax, PBEmailList, printers,
  pbMainMenu, PDLetter, CCSPrint, PBRPDeliv, PBRPLabels, pbDatabase,
  PBRPLabelsReels, Printer.Tools;

var
  sAttachmentType: string;

{$R *.DFM}

procedure TPBRSPOrdNFrm.CanPrint(Sender: TObject);
var
  Printable : Boolean;
begin
  Printable := ((cmbPageLayout.Text <> '') and (cmbLetterLayout.Text <> '')) and
    ((EnquiryMemo.Text <> ''));
  {Check if can print}
  PrintBitBtn.Enabled := Printable;
  PreviewBitBtn.Enabled := Printable;
  EmailBitBtn.Enabled := Printable and (FEmailApplication <> '') and bAuthorised;
  typeRadioGroup.Enabled := bAuthorised;
  chkbxAttachDelNote.Enabled := bAuthorised;
  chkbxAttachLabels.Enabled := chkbxAttachDelNote.enabled;
end;

procedure TPBRSPOrdNFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  DisplayPrintDialog := false;
  PrintReport(Self);
end;

procedure TPBRSPOrdNFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  DisplayPrintDialog := true;
  PrintReport(Self);
  if dmBroker.UseCRM and FPrinted and frmPBMainMenu.mnuActivities.enabled then
    AddActivity;
  bOK := true;
end;

procedure TPBRSPOrdNFrm.PrintReport(Sender: TObject);
var
  dbPOrdLtr : TdbPOrdLtr;
begin
  {Setup and print the report}
  dbPOrdLtr := TdbPOrdLtr.Create(Self);
  try
    dbPOrdLtr.bAuthorised := bAuthorised;
    dbPOrdLtr.Preview := Preview;
    dbPOrdLtr.LayoutName := cmbPageLayout.Text;
    dbPOrdLtr.LetterName := cmbLetterLayout.Text;
    if TypeRadioGroup.itemindex = 1 then
      dbPOrdLtr.Acknowledgement := True;

    dbPOrdLtr.PONumber := StrTofloat(EnquiryMemo.Text);
    dbPOrdLtr.OnlyMine := false;
    dbPOrdLtr.ByAccount := 'N';
    dbPOrdLtr.ByBranch := 'N';
    if (dbPOrdLtr.GetDetails = 0) then
      MessageDlg('There are no purchase orders to print', mtError, [mbAbort], 0)
    else
      RollThePresses(dbPOrdLtr);
  finally
    dbPOrdLtr.Free;
  end;
end;

procedure TPBRSPOrdNFrm.FaxBitBtnClick(Sender: TObject);
begin
  FFaxing := True;
  try
    Preview := False;
    DisplayPrintDialog := false;
    ClearFaxArray(Self);
    FaxReport(Self);
  finally
    FFaxing := False;
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
end;

procedure TPBRSPOrdNFrm.FaxReport(Sender: TObject);
begin
  if TypeRadioGroup.ItemIndex = 0 then
    FaxPOReport(Self)
  else
    FaxAckReport(Self);
end;

procedure TPBRSPOrdNFrm.FaxPOReport(Sender: TObject);
var
  faxfound: boolean;
  icount, irow: Integer;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  with GetPOsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := StrToFloat(EnquiryMemo.Text);
    ParamByName('Operator').AsInteger := 0;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print};
      MessageDlg('There are no purchase orders to fax', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildPOFaxDetails;
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
    PBFaxListFrm.Caption := 'Purchase Order Fax List';
    PBFaxListFrm.FaxListgrid.Cells[0, 0] := 'Order No.';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Supplier/Branch';
    PBFaxListFrm.ShowModal;

    {If OK to the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
    begin
      dbPOrdLtr := TdbPOrdLtr.Create(Self);
      try
        dbPOrdLtr.bAuthorised := bAuthorised;
        dbPOrdLtr.Acknowledgement := False;
        dbPOrdLtr.Operator := frmPBMainMenu.iOperator;
        dbPOrdLtr.ByAccount := 'Y';
        dbPOrdLtr.ByBranch := 'Y';
        for irow := 1 to PBFaxListFrm.FaxListGrid.RowCount - 1 do
        begin
          if Trim(PBFaxListFrm.FaxListgrid.Cells[2, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          dbPOrdLtr.PONumber := StrToFloat(FaxArray[irow, 1]);
          dbPOrdLtr.Account := StrToInt(FaxArray[irow, 2]);
          dbPOrdLtr.Branch := StrToInt(FaxArray[irow, 3]);
          DisplayPrintDialog := false;
          FaxFound := PBSendFaxfrm.OutToFax(PBFaxListFrm.FaxListgrid.Cells[2, irow],
            'PO: ' + floatToStr(dbPOrdLtr.PONumber) + ' to ' +  FaxArray[irow, 4], '');
          if (not FaxFound) then
            Exit;
          dbPOrdLtr.LetterName := cmbLetterLayout.Text;
          dbPOrdLtr.LayoutName := dmLetter.FaxDefaultLayout;
          RollThePresses(dbPOrdLtr);
          bOK := true;
        end;
      finally
        dbPOrdLtr.Free;
      end;
    end;
  finally
    PBFaxListFrm.Free;
  end;
end;

procedure TPBRSPOrdNFrm.FaxAckReport(Sender: TObject);
var
  faxfound: boolean;
  icount, irow: Integer;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  with GetAcksSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := StrToInt(EnquiryMemo.Text);
    ParamByName('Operator').AsInteger := 0;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print};
      MessageDlg('There are no acknowledgements to fax', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildAckFaxDetails;
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
    PBFaxListFrm.Caption := 'Acknowledgement Fax List';
    PBFaxListFrm.FaxListgrid.Cells[0, 0] := 'Order No.';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer/Branch';
    PBFaxListFrm.ShowModal;

    {If OK to the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
    begin
      dbPOrdLtr := TdbPOrdLtr.Create(Self);
      try
        dbPOrdLtr.Acknowledgement := True;
        dbPOrdLtr.Operator := frmPBMainMenu.iOperator;
        dbPOrdLtr.ByAccount := 'N';
        dbPOrdLtr.ByBranch := 'N';
        for irow := 1 to PBFaxListFrm.FaxListGrid.RowCount - 1 do
        begin
          if Trim(PBFaxListFrm.FaxListgrid.Cells[2, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          dbPOrdLtr.PONumber := StrToInt(FaxArray[irow, 1]);
//          dbPOrdLtr.Account := StrToInt(FaxArray[irow, 2]);
//          dbPOrdLtr.Branch := StrToInt(FaxArray[irow, 3]);
          DisplayPrintDialog := false;
          FaxFound := PBSendFaxfrm.OutToFax(PBFaxListFrm.FaxListgrid.Cells[2, irow],
            'Ack: ' + floatToStr(dbPOrdLtr.PONumber) + ' to ' + FaxArray[irow, 4], '');
          if (not FaxFound) then
            Exit;
          dbPOrdLtr.LetterName := cmbLetterLayout.Text;
          dbPOrdLtr.LayoutName := dmLetter.FaxDefaultLayout;
          RollThePresses(dbPOrdLtr);
        end;
      finally
        dbPOrdLtr.Free;
      end;
    end;
  finally
    PBFaxListFrm.Free;
  end;
end;

procedure TPBRSPOrdNFrm.EmailReport(Sender: TObject);
begin
  if TypeRadioGroup.ItemIndex = 0 then
    EmailPOReport(Self)
  else
    EmailAckReport(Self);
end;

procedure TPBRSPOrdNFrm.EmailPOReport(Sender: TObject);
var
  icount, irow, inx: Integer;
  sTo, sSubject, sBody, sSalutation, sBodyText: string;
  sSenderName, sSenderEmail, sRecipientName: string;
  PrinterSettings: TPrinterSettings;
  fileList: TStringList;
begin
  {Set up the Query to determine whether there are any Purchase Orders to print}
  with GetPOsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := StrTofloat(EnquiryMemo.Text);
    ParamByName('Operator').AsInteger := 0;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print};
      MessageDlg('There are no purchase orders to Email', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildPOEmailDetails;

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
    PBEmailListFrm.Caption := 'Purchase Order Email List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'Enquiry';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Supplier/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';

    PBEmailListFrm.CodeType := 'S';
    PBEmailListFrm.ShowModal;

    {If OK to send the email then send them}
    if PBEmailListFrm.ModalResult = idok then
    begin
      dbPOrdLtr := TdbPOrdLtr.Create(Self);
      try
        dbPOrdLtr.bAuthorised := bAuthorised;
        dbPOrdLtr.Acknowledgement := False;
        dbPOrdLtr.Operator := frmPBMainMenu.iOperator;
        dbPOrdLtr.ByAccount := 'Y';
        dbPOrdLtr.ByBranch := 'Y';
        for irow := 1 to PBEmailListFrm.EmailListGrid.RowCount - 1 do
        begin
          if Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          dbPOrdLtr.PONumber := StrTofloat(EMailArray[irow, 1]);
          dbPOrdLtr.Account := StrToInt(EmailArray[irow, 2]);
          dbPOrdLtr.Branch := StrToInt(EmailArray[irow, 3]);
          FCustSupplierName := PBEmailListFrm.EmailListGrid.Cells[1, irow];
          DisplayPrintDialog := false;
          dbPOrdLtr.LetterName := cmbLetterLayout.Text;
          dbPOrdLtr.LayoutName := dmLetter.FaxDefaultLayout;

          FPOrder := dbPOrdLtr.PONumber;
          sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
          RollThePresses(dbPOrdLtr);
          bOK := true;

          {If a Purchase terms file exists then add as attachment}
          if sPurchaseTermsFile <> '' then
            begin
              try
                FEmailAttachment.append(sPurchaseTermsFile);
              except
              end;
            end;

          if self.chkbxAttachDelNote.Checked then
          begin
            PBRPDelivFrm := TPBRPDelivFrm.create(self);
            PrinterSettings := TPrinterSettings.Create;
            try
              PBRPDelivFrm.PrinterSettings := PrinterSettings;
              PBRPDelivFrm.bPrintLogo := true;

              with qryGetPODelivs do
              begin
                close;
                ParamByName('PONum').asFloat := dbPOrdLtr.PONumber;
                ParamByName('line').asInteger := 1;
                open;
                while not EOF do
                begin
                  fileList := PBRPDelivFrm.PrintToFile(dbPOrdLtr.PONumber, 1,
                     FieldByName('Delivery_No').asInteger, sAttachmentType);
                  if fileList.count <> 0 then
                  begin
                    for inx := 0 to pred(fileList.count) do
                      FEmailAttachment.Add(fileList[inx]);
                  end;
                  next;
                end;
                close;
              end;
            finally
              PBRPDelivFrm.free;
              PrinterSettings.Free;
            end;
          end;

          if self.chkbxAttachLabels.Checked then
          begin
            {Setup and print the report}
            PBRPLabelsFrm := TPBRPLabelsFrm.Create(Self);
            PBRPLabelsFrm.bAddressOnly := chkAddressOnly.checked;
            PBRPLabelsFrm.useCustAddress := (rdbtnCustAddr.checked);
            PBRPLabelsFrm.bStocked := 'Y';
            
            {See which logo has been selected}
            if dblkpLogos.KeyValue >= 0 then
              PBRPLabelsFrm.logoPath := qryLogos.fieldbyname('Logo_Path').asstring
            else
              PBRPLabelsFrm.logoPath := '';

            PrinterSettings := TPrinterSettings.Create;
            try
              with qryGetPODelivs do
              begin
                close;
                ParamByName('PONum').asFloat := dbPOrdLtr.PONumber;
                ParamByName('line').asInteger := 1;
                open;
                while not EOF do
                begin
                  fileList := PBRPLabelsFrm.PrintToFile(dbPOrdLtr.PONumber, 1,
                    FieldByName('Delivery_No').asInteger, sAttachmentType);
                  if fileList.count <> 0 then
                  begin
                    for inx := 0 to pred(fileList.count) do
                      FEmailAttachment.Add(fileList[inx]);
                  end;
                  next;
                end;
                close;
              end;
            finally
              PBRPLabelsFrm.free;
              PrinterSettings.Free;
            end;
          end;

          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
          sSubject := 'Purchase Order Number: '+EmailArray[irow, 1] + ', ' + trim(EmailArray[irow, 11]);
          sSalutation := EmailArray[irow,7];
          sSenderName := frmPBMainMenu.sOperator_Name;
          sSenderEmail := frmPBMainMenu.sOperator_Email;

          sRecipientName := EmailArray[irow,5];

          sBodyText := dmBroker.GetEmailPurchaseOrderText;
          if trim(sBodyText) = '' then
                sBodyText := 'Please find attached, purchase order ' + EmailArray[irow,1] + '.' + #13#10#13#10
                          +  'If you have any queries please contact me immediately' + #13#10#13#10;

          {Replace the PO number}
          if pos('<Number>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Number>', EmailArray[irow, 1], [rfIgnoreCase])
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
              if trim(EmailArray[irow, 5]) <> '' then
                sBodyText := stringreplace(sBodyText, '<Contact Name>', EmailArray[irow, 5], [rfIgnoreCase]);
            end;

          {Replace the description}
          if pos('<Description>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Description>', trim(EmailArray[irow, 11]), [rfIgnoreCase])
            end;

          if frmPBMainMenu.EmailApplication = 'GENERIC' then
            {Send to Email database}
            dmBroker.EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, sTo,sSubject,sBodyText,FEmailAttachment,
                                      frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount, frmPBMainMenu.sOperator_Name, frmPBMainMenu.sCompName)
          else
          { Send using Outlook}
            EmailViaOutlook(sTo,sSubject,sBodyText,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);
        end;
      finally
        if assigned(dbPOrdLtr) then
          dbPOrdLtr.Free;
      end;
    end;
  finally
    PBEmailListFrm.Free;
    if assigned(FileList) then
    begin
      fileList.Free;
      fileList := nil;
    end;
  end;
end;

procedure TPBRSPOrdNFrm.EmailAckReport(Sender: TObject);
var
  icount, irow: Integer;
  sTo, sSubject, sBody, sSalutation, sBodyText: string;
  sSenderName, sSenderEmail, sRecipientName: string;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  with GetAcksSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := StrToFloat(EnquiryMemo.Text);
    ParamByName('Operator').AsInteger := 0;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print};
      MessageDlg('There are no acknowledgements to email', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildAckEmailDetails;


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
    PBEmailListFrm.Caption := 'Acknowledgement Email List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'Enquiry';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';
    PBEmailListFrm.CodeType := 'C';
    PBEmailListFrm.ShowModal;

    {If OK to send the email then send them}
    if PBEmailListFrm.ModalResult = idok then
    begin
      dbPOrdLtr := TdbPOrdLtr.Create(Self);
      try
        dbPOrdLtr.Acknowledgement := True;
        dbPOrdLtr.Operator := frmPBMainMenu.iOperator;
        dbPOrdLtr.ByAccount := 'N';
        dbPOrdLtr.ByBranch := 'N';
        for irow := 1 to PBEmailListFrm.EmailListGrid.RowCount - 1 do
        begin
          if Trim(PBEmailListFrm.EmailListgrid.Cells[3, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          dbPOrdLtr.PONumber := StrToFloat(EmailArray[irow, 1]);
//          dbPOrdLtr.Account := StrToInt(EmailArray[irow, 2]);
//          dbPOrdLtr.Branch := StrToInt(EmailArray[irow, 3]);
          FCustSupplierName := PBEmailListFrm.EmailListGrid.Cells[1, irow];
          DisplayPrintDialog := false;

          dbPOrdLtr.LetterName := cmbLetterLayout.Text;
          dbPOrdLtr.LayoutName := dmLetter.FaxDefaultLayout;

          sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
          RollThePresses(dbPOrdLtr);

          {If a Sales terms file exists then add as attachment}
          if sSalesTermsFile <> '' then
            begin
              try
                FEmailAttachment.append(sSalesTermsFile);
              except
              end;
            end;

          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
          sSubject := 'Acknowledgement Number: '+EmailArray[irow,1] + ', ' + trim(EmailArray[irow, 11]);
          sSalutation := EmailArray[irow,7];
          sSenderName := frmPBMainMenu.sOperator_Name;
          sSenderEmail := frmPBMainMenu.sOperator_Email;

          sRecipientName := EmailArray[irow,5];

          sBodyText := dmBroker.GetEmailAcknowledgementText;

          if trim(sBodyText) = '' then
                sBodyText := 'Please find attached, acknowledgement ' + EmailArray[irow,1] + '.' + #13#10#13#10
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
          if pos('<Customer Contact>', sBodyText) > 0 then
            begin
              if trim(EmailArray[irow,5]) <> '' then
                sBodyText := stringreplace(sBodyText, '<Customer Contact>', EmailArray[irow,5], [rfIgnoreCase]);
            end;

          {Replace the description}
          if pos('<Description>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Description>', EmailArray[irow,11], [rfIgnoreCase])
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
        dbPOrdLtr.Free;
      end;
    end;
  finally
    PBEmailListFrm.Free;
  end;
end;

procedure TPBRSPOrdNFrm.BuildPOFaxDetails;
var
  irow: Integer;
begin
  with GetPOsSQL do
  begin
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Purchase_Order').AsString;
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

procedure TPBRSPOrdNFrm.BuildAckFaxDetails;
var
  irow: Integer;
begin
  with GetAcksSQL do
  begin
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Purchase_Order').AsString;
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

procedure TPBRSPOrdNFrm.BuildPOEmailDetails;
var
  irow: Integer;
begin
  with GetPOsSQL do
  begin
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Purchase_Order').AsString;
      EmailArray[irow, 2] := FieldByName('Supplier').AsString;
      EmailArray[irow, 3] := FieldByName('Branch_no').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Supp_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      EmailArray[irow, 5] := FieldByName('Contact_Name').AsString;
      EmailArray[irow, 6] := FieldByName('Email').AsString;
      EmailArray[irow, 7] := FieldByName('Salutation').AsString;
      EmailArray[irow, 8] := FieldByName('ExportFilter').AsString;
      EmailArray[irow, 9] := FieldByName('ExportFilter_Descr').AsString;
      EmailArray[irow, 10] := FieldByName('Contact_no').AsString;
      EMailArray[irow, 11] := FieldByName('Suppliers_desc').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TPBRSPOrdNFrm.BuildAckEmailDetails;
var
  irow: Integer;
begin
  with GetAcksSQL do
  begin
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Purchase_Order').AsString;
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
      EMailArray[irow, 11] := FieldByName('Customers_desc').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

procedure TPBRSPOrdNFrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      FaxArray[icount, icount1] := '';
end;

procedure TPBRSPOrdNFrm.ClearEMailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EMailArray[icount, icount1] := '';
end;

procedure TPBRSPOrdNFrm.GetEmailApp;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  with IniFile do
  try
    FEmailApplication := ReadString('Email', 'Application', 'None');
    FEmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
  finally
    IniFile.Free;
  end;
end;

procedure TPBRSPOrdNFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    TypeRadioGroup.ItemIndex := 0;
    GetEmailApp;
    DisplayPrintDialog := true;
    SelOneGrpBox.visible := bAuthorised;
    CanPrint(Self);
//    enquiryMemo.SetFocus;
    printBitBtn.SetFocus;

    sPOPageLayout := cmbPageLayout.text;
    sPOLetterLayout := cmbLetterLayout.text;

    with qryLogos do
      begin
        close;
        open;
      end;
      
    FActivated := true;
  end;
end;

procedure TPBRSPOrdNFrm.EnquiryMemoKeyPress(Sender: TObject; var Key: Char);
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

procedure TPBRSPOrdNFrm.EnquiryMemoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CanPrint(Self);
end;

procedure TPBRSPOrdNFrm.RollThePresses(aBroker: TDataBroker);
var
  PrintingPress : TfrmPrintingPress;
  icount: integer;
begin
  PrintingPress := TfrmPrintingPress.Create(Self);
  try
    PrintingPress.Authorised := bAuthorised;
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
          PrintingPress.QuickR.Print;
    end;
  finally
    Application.ProcessMessages;
    Printers.Printer.PrinterIndex := -1;
    PrintingPress.Free;
  end;
end;

procedure TPBRSPOrdNFrm.PrintToAttachment(PrintingPress: TfrmPrintingPress);
var
  fileName: string;
begin
  if TypeRadioGroup.ItemIndex = 0 then
    fileName := 'PO' + FloatToStr(dbPOrdLtr.PONumber) else
    fileName := 'ACK' + FloatToStr(dbPOrdLtr.PONumber);
  PrinterTools.New.PrintToAttachment(PrintingPress.QuickR, FEmailAttachment, fileName, sAttachmentType);
end;

(* GDK ToDo: remove after tests
procedure TPBRSPOrdNFrm.PrintToAttachment(PrintingPress: TfrmPrintingPress);
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

//  sLocation := GetWinTempDir;
//  if FEmailLocation = '' then
//    sLocation := 'C:\Windows\temp\'
//  else
//    sLocation := FEmailLocation;
//
//  if TypeRadioGroup.ItemIndex = 0 then
//    sFileName := 'PO' + floattostr(dbPOrdLtr.PONumber)
//  else
//    sFileName := 'Ack' + floattostr(dbPOrdLtr.PONumber) ;

  sLocation := GetWinTempDir;

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

  {Format is 'PO' + PO Number + Random Number}
  if TypeRadioGroup.ItemIndex = 0 then
    sFileName := 'PO' + floattostr(dbPOrdLtr.PONumber) + '-' + sFilename
  else
    sFileName := 'ACK' + floattostr(dbPOrdLtr.PONumber) + '-' + sFilename;

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

procedure TPBRSPOrdNFrm.LoadCombos;
begin
  cmbPageLayout.Items.Clear;
  cmbLetterLayout.Items.Clear;
  if dmLetter.OldDatabase then
  begin
    cmbPageLayout.Items.Add('Blank');
    cmbPageLayout.Items.Add('Preprinted');
    if TypeRadioGroup.ItemIndex = 0 then
      cmbLetterLayout.Items.Add('Purchase Order')
    else
      cmbLetterLayout.Items.Add('Acknowledgement');
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

procedure TPBRSPOrdNFrm.TypeRadioGroupClick(Sender: TObject);
begin
  if TypeRadioGroup.ItemIndex = 0 then
    LetterType := ltPurchaseOrder
  else
    LetterType := ltAcknowledgement;

  cmbLetterLayout.Items.Clear;
  if dmLetter.OldDatabase then
    begin
      if TypeRadioGroup.ItemIndex = 0 then
        cmbLetterLayout.Items.Add('Purchase Order')
      else
        cmbLetterLayout.Items.Add('Acknowledgement');
      if cmbLetterLayout.Items.Count > 0 then
        cmbLetterLayout.ItemIndex := 0;
    end
  else
    begin
      cmbLetterLayout.Items.Assign(dmLetter.GetLetterLayoutList(LetterType));
      cmbLetterLayout.ItemIndex :=
        cmbLetterLayout.Items.IndexOf(dmLetter.GetLetterDefault(LetterType));

      if sAckPageLayout = '' then
        begin
          sAckPageLayout := cmbPageLayout.Text;
          sAckLetterLayout := cmbLetterLayout.Text;
        end;
        
      {$IFNDEF BROADSWORD}
      if TypeRadioGroup.ItemIndex = 0 then
        begin
          try
            if sPOPageLayout <> '' then
              cmbPageLayout.itemindex := cmbPageLayout.Items.IndexOf(sPOPageLayout);
          except
            cmbPagelayout.ItemIndex := 0;
          end;

          try
            if sPOLetterLayout <> '' then
              cmbLetterLayout.itemindex := cmbLetterLayout.items.IndexOf(sPOLetterLayout);
          except
            cmbLetterLayout.itemindex := 0;
          end;
        end
      else
        begin
          try
            if sAckPageLayout <> '' then
              cmbPageLayout.itemindex := cmbPageLayout.Items.IndexOf(sAckPageLayout);
          except
            cmbPagelayout.ItemIndex := 0;
          end;

          try
            if sAckLetterLayout <> '' then
              cmbLetterLayout.itemindex := cmbLetterLayout.items.IndexOf(sAckLetterLayout);
          except
            cmbLetterLayout.itemindex := 0;
          end;
        end;

      {$ENDIF}
    end;

  self.chkbxAttachDelNote.enabled := (self.TypeRadioGroup.ItemIndex = 0);
  self.chkbxAttachLabels.enabled := (self.TypeRadioGroup.ItemIndex = 0);

  if self.TypeRadioGroup.ItemIndex = 1 then
    begin
      self.chkbxAttachDelNote.Checked := false;
      self.chkbxAttachLabels.Checked := false;
    end;
  self.CanPrint(self);
end;

procedure TPBRSPOrdNFrm.cbPrintLogoClick(Sender: TObject);
begin
  if cbPrintLogo.Checked then
    cmbPageLayout.ItemIndex := 0
  else
    cmbPageLayout.ItemIndex := 1;
end;

procedure TPBRSPOrdNFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  FEMail := True;
  dmBroker.bEmailSent := false;
  try
    Preview := False;
    DisplayPrintDialog := false;
    ClearEMailArray(Self);

    {Check to see if there is a Purchase Terms file, if there is then attach to email}
    sPurchaseTermsFile := dmBroker.GetPurchaseTermsFile;
    sSalesTermsFile := dmBroker.GetSalesTermsFile;

    EmailReport(Self);
    if dmBroker.UseCRM and FPrinted and frmPBMainMenu.mnuActivities.enabled then
      AddActivity;
  finally
    FEMail := False;
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        if (FEmailAttachment.strings[i] = sPurchaseTermsFile) or
           (FEmailAttachment.strings[i] = sSalesTermsFile) then continue;
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
//    if (FEmailSent) and (frmPBMainMenu.EmailApplication = 'GENERIC') and (FCustSupplierName <> '') then
//      messagedlg('Emails have been added to your Email Server and will be sent shortly.', mtInformation, [mbOk], 0);
    if (frmPBMainMenu.EmailApplication = 'GENERIC') and dmBroker.bEmailSent then
      begin
        messagedlg('Emails have been added to your Email Server and will be sent shortly.', mtInformation, [mbOk], 0);
        close;
      end;
  end;

end;

procedure TPBRSPOrdNFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sAttach: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  with IniFile do
  try
    WriteString('Purchase Orders', 'Page Layout', sPOPageLayout);
    WriteString('Purchase Orders', 'Letter Layout', sPOLetterLayout);

    WriteString('Acknowledgement', 'Page Layout', sAckPageLayout);
    WriteString('Acknowledgement', 'Letter Layout', sAckLetterLayout);

    if chkbxAttachDelNote.checked then
      WriteString('Redeye', 'Attach Delivery Note', 'Y')
    else
      WriteString('Redeye', 'Attach Delivery Note', 'N');

    if chkbxAttachLabels.checked then
      WriteString('Redeye', 'Attach Delivery Labels', 'Y')
    else
      WriteString('Redeye', 'Attach Delivery Labels', 'N');
  finally
    IniFile.Free;
  end;

  FEmailAttachment.free;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBRSPOrdNFrm.GetDefaultPrinter;
var
  sBin: string;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  if TypeRadioGroup.itemindex = 0 then
    begin
      GetPrivateProfileString('Centrereed Broker', 'Purchase Order Printer', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

      DefaultPrinter := TempArray;

      GetPrivateProfileString('Centrereed Broker', 'Purchase Order Bin', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

      sBin := TempArray;
      try
        DefaultBin := strtoint(sBin);
      except
        DefaultBin := 15;
      end;
    end
  else
    begin
      GetPrivateProfileString('Centrereed Broker', 'Acknowledgement Printer', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

      DefaultPrinter := TempArray;

      GetPrivateProfileString('Centrereed Broker', 'Acknowledgement Bin', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

      sBin := TempArray;
      try
        DefaultBin := strtoint(sBin);
      except
        DefaultBin := 15;
      end;
    end
end;

procedure TPBRSPOrdNFrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  if TypeRadioGroup.itemindex = 0 then
    begin
      with IniFile do
      try
        WriteString('Centrereed Broker', 'Purchase Order Printer',DefaultPrinter);
        WriteString('Centrereed Broker', 'Purchase Order Bin',inttostr(DefaultBin));
      finally
        IniFile.Free;
      end
    end
  else
    begin
      with IniFile do
      try
        WriteString('Centrereed Broker', 'Acknowledgement Printer',DefaultPrinter);
        WriteString('Centrereed Broker', 'Acknowledgement Bin',inttostr(DefaultBin));
      finally
        IniFile.Free;
      end
    end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TPBRSPOrdNFrm.SetPrinterBin(BinCode : integer );
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

function TPBRSPOrdNFrm.GetBinSelection: integer;
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

procedure TPBRSPOrdNFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBRSPOrdNFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TPBRSPOrdNFrm.chkbxAttachDelNoteClick(Sender: TObject);
begin
  chkbxAttachLabels.Checked := (sender as TCheckbox).checked;
end;

procedure TPBRSPOrdNFrm.FormCreate(Sender: TObject);
var
  TempArray: array[0..255] of Char;
  IniFile : TIniFile;
  sFormat: string;
  sAttachDelNote: string;
  iDefaultPageLayout: integer;
begin
  FEmailAttachment := TStringList.create;
  LetterType := ltPurchaseOrder;

  GetPrivateProfileString('Centrereed Broker', 'Label Printer Format', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);
  sFormat := TempArray;

  LoadCombos;

  iDefaultPageLayout := cmbPageLayout.itemindex;

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      sPOPageLayout := ReadString('Purchase Orders', 'Page Layout', '');
      sPOLetterLayout := ReadString('Purchase Orders', 'Letter Layout', '');

      sAckPageLayout := ReadString('Acknowledgement', 'Page Layout', '');
      sAckLetterLayout := ReadString('Acknowledgement', 'Letter Layout', '');

      {$IFNDEF BROADSWORD}
      try
        if sPOPageLayout <> '' then
          cmbPageLayout.itemindex := cmbPageLayout.Items.IndexOf(sPOPageLayout)
        else
          cmbPageLayout.itemindex := iDefaultPageLayout;

      except
        cmbPagelayout.ItemIndex := 0;
      end;

      try
        if sPOLetterLayout <> '' then
          cmbLetterLayout.itemindex := cmbLetterLayout.items.IndexOf(sPOLetterLayout);
      except
        cmbLetterLayout.itemindex := 0;
      end;
      {$ENDIF}

      chkbxAttachDelNote.Checked := (ReadString('Redeye', 'Attach Delivery Note', 'N') = 'Y');
      chkbxAttachLabels.Checked := (ReadString('Redeye', 'Attach Delivery Labels', 'N') = 'Y');
    end;
  finally
    IniFile.Free;
  end;

  chkbxAttachLabelsClick(chkbxAttachLabels);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBRSPOrdNFrm.chkbxAttachLabelsClick(Sender: TObject);
begin
  if (sender as Tcheckbox).Checked then
    begin
//      pnlLabels.Height := 94;
//      self.Height := 345;
//      pnlLabels.visible := true;
      grpbxLabels.Enabled := true;
    end
  else
    begin
//      pnlLabels.Height := 0;
//      self.Height := 252;
//      pnlLabels.visible := false;
      grpbxLabels.Enabled := false;
    end;
end;

procedure TPBRSPOrdNFrm.cmbPageLayoutChange(Sender: TObject);
begin
  if TypeRadioGroup.itemindex = 0 then
    sPOPageLayout := cmbPageLayout.text
  else
    sAckPageLayout := cmbPageLayout.text;

  CanPrint(self);
end;

procedure TPBRSPOrdNFrm.cmbLetterLayoutChange(Sender: TObject);
begin
  if TypeRadioGroup.itemindex = 0 then
    sPOLetterLayout := cmbLetterLayout.text
  else
    sAckLetterLayout := cmbLetterLayout.text;

  CanPrint(self);
end;

procedure TPBRSPOrdNFrm.AddActivity;
var
  key: integer;
  iActivityType: integer;
  iOriginalActivity: integer;
  aActivity : TActivity;
begin
  {Get the PO}
  with qryGetPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := strtofloat(trim(EnquiryMemo.Text));
      open;
    end;

  {Check for the Acknowledgement Activity type already exists}
  iOriginalActivity := 0;
  if (TypeRadioGroup.itemindex = 1) then
    iActivityType := dmBroker.GetDefaultOrderAckActivityType
  else
    exit;

  with dmBroker.qryCheckActivity do
    begin
      close;
      ParamByName('Entity_Reference').AsString := trim(EnquiryMemo.Text);
      ParamByName('Activity_Type').AsInteger := iActivityType;
      ParamByName('Activity_Module').AsInteger := 30;
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      open;

      if recordcount > 0 then
        begin
          iOriginalActivity := dmBroker.qryCheckActivity.fieldbyname('Activity').asinteger;

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
    end;
end;

procedure TPBRSPOrdNFrm.FormRefClrBitBtnClick(Sender: TObject);
begin
  dblkpLogos.KeyValue := -1;
end;

end.
