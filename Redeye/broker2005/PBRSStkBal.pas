unit PBRSStkBal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables, CCSCommon, PBRPStkBal,
  gtQrExport, CCSPress, IniFiles;

type
  TPBRSStkBalFrm = class(TForm)
    QryReport: TQuery;
    dsReport: TDataSource;
    CustomerSQL: TQuery;
    IncRadioGroup: TRadioGroup;
    rgCustomer: TRadioGroup;
    CustomerPanel: TPanel;
    lblCustomer: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    chkIncludeNonStock: TCheckBox;
    FaxBitBtn: TBitBtn;
    EmailBitBtn: TBitBtn;
    GetPartsSQL: TQuery;
    Dummy2SQL: TQuery;
    DummySQL: TQuery;
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure IncRadioGroupClick(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure BuildFaxDetails;
    procedure ClearFaxArray(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure EmailReport(Sender:TObject);
    procedure BuildEmailDetails;
    procedure ClearEMailArray(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FActivated: boolean;
    SelCustCode, SelCustBranch: integer;
    SelCustText: string;
    bFaxing: ByteBool;
    Preview: ByteBool;
    FEMail : Boolean;
    FEmailAttachment : TstringList;
    FEmailApplication : string;
    fEMailAttachType : string;
    FEmailLocation : string;
    DisplayPrintDialog : Boolean;
    procedure SomethingChanged;
    procedure FixQuery;
    procedure DispSelection;
    procedure CanPrint;
    function BuildQueryString : string;
    function BuildContactDetails : string;
    procedure CallReport(const bPreview : Boolean);
    procedure GetEmailApp;
    procedure PrintToAttachment(PBRPStkBalfrm: TPBRPStkBalfrm);
    function Ordering(aBox : TRadioGroup) : string;
  public
    { Public declarations }
  end;

var
  PBRSStkBalFrm: TPBRSStkBalFrm;
  FaxArray: array[1..100, 1..5] of string;
  EMailArray: array[1..100, 1..11] of string;
  sAttachmentType: string;

implementation

uses PBLUCust, PBDatabase, CCSPrint, Printers, PBEmailList, PBFaxList,
  PBSendFax, pbMainMenu;

{$R *.DFM}

procedure TPBRSStkBalFrm.rgCustomerClick(Sender: TObject);
begin
  CustomerPanel.Visible := rgCustomer.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TPBRSStkBalFrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := SelCustCode;
    PBLUCustFrm.SelBranch := SelCustBranch;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      SelCustCode := PBLUCustFrm.SelCode;
      SelCustBranch := PBLUCustFrm.SelBranch;
      SelCustText := PBLUCustFrm.SelName + ' / ' + PBLUCustFrm.SelBranchName;
      SomethingChanged;
    end;
  finally
    PBLUCustFrm.Free;
  end;

end;

procedure TPBRSStkBalFrm.SomethingChanged;
begin
//  FixQuery;
  DispSelection;
  CanPrint;
end;

procedure TPBRSStkBalFrm.FixQuery;
begin
  QryReport.DisableControls;
  try
    QryReport.Close;
    QryReport.SQL.Clear;
    QryReport.SQL.Text := BuildQueryString;
    QryReport.Open;
  finally
    QryReport.EnableControls;
  end;
end;

procedure TPBRSStkBalFrm.DispSelection;
begin
  {Display selection}
  if SelCustCode <> 0 then
    edtCustomer.Text := SelCustText
  else
    edtCustomer.Text := '';
  {Display selection}
end;

procedure TPBRSStkBalFrm.Canprint;
begin
  {Check if can print}
  PrintBitBtn.Enabled :=
    ((rgCustomer.ItemIndex = 0) or
    ((rgCustomer.ItemIndex = 1) and (edtCustomer.Text <> ''))
    );
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
end;

function TPBRSStkBalFrm.BuildQueryString: string;
{ Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
  function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
//  Result := DummySQL.SQL.text;
  Result := DummySQL.SQL.text;


  if chkIncludeNonStock.checked then
    Result := Result + 'HAVING ((Form_Reference.Stocked_Item =''Y'') OR (Form_Reference.Stocked_Item = ''N''))'
  else
    Result := Result + 'HAVING (Form_Reference.Stocked_Item =''Y'')';

  if (rgCustomer.ItemIndex = 1) and (SelCustCode <> 0) then
  begin
    Result := Result + ' AND Customer_Branch.Customer = ' +
      IntToStr(SelCustCode) + ' AND Customer_Branch.Branch_No = ' +
      IntToStr(SelCustBranch);
  end;
    Result := Result + Ordering(IncRadioGroup);
//    Result := Result + ' Group by Customer.Name, Form_Reference.Form_reference_ID, Form_reference_Descr, Form_Reference.Reorder_Level, Purchase_OrderLine.Order_Unit, Purchase_OrderLine.Order_Price';
    Result := Result + ' Order By Customer.Name, Form_Reference.Stock_Reference';
end;

function TPBRSStkBalFrm.Ordering(aBox: TRadioGroup): string;
begin
 case aBox.ItemIndex of
  1:   Result := ' and ((sum(Purchase_Orderline.Qty_in_stock) = 0) or (sum(Purchase_Orderline.Qty_in_stock) is null)) ';
  2:   Result := ' and ((sum(Purchase_Orderline.Qty_in_stock) <> 0) and (sum(Purchase_Orderline.Qty_in_stock) is not null))';
  3:   Result := ' and ((sum(Purchase_Orderline.Qty_in_stock) <= Form_Reference.Reorder_Level))';
  else Result := '';
  end;
end;

procedure TPBRSStkBalFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    rgCustomer.ItemIndex := 0;
    rgCustomerClick(nil);
//    SomethingChanged;
    FActivated := true;
  end;
FEmailAttachment := TStringList.create;
GetEmailApp;
end;

procedure TPBRSStkBalFrm.CallReport(const bPreview: Boolean);
var
  PBRPStkBalfrm: TPBRPStkBalfrm;
  PrinterSettings: TPrinterSettings;
begin
  FixQuery;
  QryReport.Close;
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      begin
        PBRPStkBalFrm := TPBRPStkBalFrm.Create(Self);
        try
          PBRPStkBalFrm.PrinterSettings := PrinterSettings;
          PBRPStkBalFrm.QryReport.SQL.Clear;
          PBRPStkBalFrm.QryReport.SQL.Text := QryReport.SQL.Text;
          PBRPStkBalFrm.qrlblTitle.Caption := PBRPStkBalFrm.qrlblTitle.Caption + DateToStr(Now);
          case IncRadioGroup.ItemIndex of
            1:   PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'Zero Stock Items';
            2:   PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'Non Zero Stock Items';
            3:   PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'Items less than Re-Order Level'
          else PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'All Items';
          end;
          if bPreview then
            PBRPStkBalFrm.QuickReport.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPStkBalFrm.QuickReport.Print;
        finally
          PBRPStkBalFrm.Free;
          Application.ProcessMessages;
        end;
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
    QryReport.Open;
  end;
end;

procedure TPBRSStkBalFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSStkBalFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSStkBalFrm.IncRadioGroupClick(Sender: TObject);
begin
//  Somethingchanged;
end;

procedure TPBRSStkBalFrm.FaxBitBtnClick(Sender: TObject);
begin
 try
    bFaxing := True;
    clearfaxarray(self);
    FaxReport(Self);
  finally
    Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
 end;

procedure TPBRSStkBalFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  FEMail := True;
  try
    Preview := False;
    ClearEMailArray(Self);
    EmailReport(Self);
  finally
    FEMail := False;
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
  end;
end;

procedure TPBRSStkBalFrm.FormDestroy(Sender: TObject);
begin
 FEmailAttachment.free;
end;

procedure TPBRSStkBalFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with GetPartsSQL do
  begin
    Close;
    SQL.Clear;
    SQL.Text := BuildContactDetails;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Customer').AsString;
      EmailArray[irow, 2] := FieldByName('Branch_no').AsString;
      EmailArray[irow, 3] := Trim(FieldByName('Cust_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      EmailArray[irow, 4] := FieldByName('Email').AsString;
      inc(irow);
      Next;
    end;
  end;

end;


procedure TPBRSStkBalFrm.BuildFaxDetails;
var
  irow: Integer;
begin
  with GetPartsSQL do
  begin
    Close;
    SQL.Clear;
    SQL.Text := BuildContactDetails;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Customer').AsString;
      FaxArray[irow, 2] := FieldByName('Branch_no').AsString;
      FaxArray[irow, 3] := Trim(FieldByName('Cust_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      FaxArray[irow, 4] := FieldByName('Fax_Number').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TPBRSStkBalFrm.ClearEMailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EMailArray[icount, icount1] := '';

end;

procedure TPBRSStkBalFrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 5 do
      FaxArray[icount, icount1] := '';
end;

procedure TPBRSStkBalFrm.EmailReport(Sender: TObject);
var
  icount, irow: Integer;
  sTo, sSubject, sBody, sSalutation: string;
  PBRPStkBalFrm : TPBRPStkBalFrm;
  PrinterSettings: TPrinterSettings;
begin
 {Build the Enquiry and Supplier details}
 BuildEmailDetails;
 if emailArray[1,1] = '' then
 begin
  MessageDlg('Nothing to Email for this Customer ', mtError, [mbOK], 0);
  exit;
 end;
 PrinterSettings := TPrinterSettings.Create;
 try
  PBEmailListFrm:= TPBEmailListFrm.Create(Self);
  try
    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 1] = '' then Break;
      PBEmailListFrm.EmailListGrid.Cells[0, icount] := EmailArray[icount, 3];
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 3];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := '';
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 4];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := '';
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := '';
    end;
    PBEmailListFrm.EmailListGrid.RowCount := icount;
    PBEmailListFrm.Caption := 'Email List';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    PBEmailListFrm.EmailListGrid.Cells[3, 0] := 'Email Address';
    PBEmailListFrm.EmailListGrid.colwidths[0] := -1;
    PBEmailListFrm.EmailListGrid.Colwidths[2] := -1;
    PBEmailListFrm.ShowModal;

    {If OK to send the email then send them}
    if PBEmailListFrm.ModalResult = idok then
    begin
      PBRPStkBalFrm := TPBRPStkBalFrm.Create(Self);
      try
        for irow := 1 to PBEmailListFrm.EmailListGrid.RowCount - 1 do
        begin
          SelCustCode := strtoint(emailarray[irow, 1]);
          SelCustBranch := strtoint(emailarray[irow,2]);
          fixquery;
          PBRPStkBalFrm.PrinterSettings := PrinterSettings;
          PBRPStkBalFrm.QryReport.SQL.Clear;
          PBRPStkBalFrm.QryReport.SQL.Text := QryReport.SQL.Text;
          PBRPStkBalFrm.qryReport.open;
          PBRPStkBalFrm.qrlblTitle.Caption := PBRPStkBalFrm.qrlblTitle.Caption + DateToStr(Now);
          case IncRadioGroup.ItemIndex of
            1:   PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'Zero Stock Items';
            2:   PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'Non Zero Stock Items';
            3:   PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'Items less than Re-Order Level'
          else PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'All Items';
          end;
          sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
          PBRPStkBalFrm.quickreport.Showprogress := False;
          Printtoattachment(PBRPStkBalFrm);
          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
          sSubject := 'Stock Balance Report';
          sSalutation := '';
          sBody := sSalutation+#13#10#13#10'Please find attached, ' + sSubject + '.'#13#10#13#10;

          EmailViaOutlook(sTo,sSubject,sBody,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);
        end;
        finally
        PBRPStkBalFrm.Free;
        end;
      end;
    finally
    PrinterSettings.Free;
    end;
  finally
  PBEmailListFrm.Free;
  end;
end;


procedure TPBRSStkBalFrm.FaxReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  icount, irow: integer;
  faxfound: boolean;
begin
  {Build the Enquiry and Supplier details}
  BuildFaxDetails;
  if FaxArray[1,1] = '' then
  begin
    MessageDlg('Nothing to Fax for this Customer ', mtError, [mbOK], 0);
    exit;
  end;
  {For each of the Enquiry/Supplier details print a fax}
  PrinterSettings := TPrinterSettings.Create;
  try
    PBFaxListFrm := TPBFaxListFrm.Create(Self);
    try
    for icount := 1 to 100 do
    begin
      if FaxArray[icount, 1] = '' then Break;
      PBFaxListFrm.FaxListGrid.ColWidths[0] := 0;
      PBFaxListFrm.FaxListGrid.Cells[1, icount] := FaxArray[icount, 3];
      PBFaxListFrm.FaxListGrid.Cells[2, icount] := FaxArray[icount, 4];
    end;
    PBFaxListFrm.FaxListGrid.RowCount := icount;
    PBFaxListFrm.Caption := 'Stock Balance Report';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer/Branch';
    PBFaxListFrm.ShowModal;

      {If OK to do the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
      begin
      for irow := 1 to PBFaxListFrm.FaxlistGrid.Rowcount -1 do
      begin
      if Trim(PBFaxListFrm.FaxListGrid.cells[2, irow]) = '' then continue;
      PBRPStkBalFrm := TPBRPStkBalFrm.Create(Self);
      try
        SelCustCode := strtoint(faxarray[irow, 1]);
        SelCustBranch := strtoint(faxarray[irow,2]);
          fixquery;
          PBRPStkBalFrm.PrinterSettings := PrinterSettings;
          PBRPStkBalFrm.QryReport.SQL.Clear;
          PBRPStkBalFrm.QryReport.SQL.Text := QryReport.SQL.Text;
          PBRPStkBalFrm.qryReport.open;
          PBRPStkBalFrm.qrlblTitle.Caption := PBRPStkBalFrm.qrlblTitle.Caption + DateToStr(Now);
          case IncRadioGroup.ItemIndex of
            1:   PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'Zero Stock Items';
            2:   PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'Non Zero Stock Items';
            3:   PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'Items less than Re-Order Level'
          else PBRPStkBalFrm.RepTypeQRLabel.Caption  := 'All Items';
          end;
        DisplayPrintDialog := False;
        PBRPStkBalFrm.QuickReport.Showprogress := False;
        PBRPStkBalFrm.QuickReport.Page.Orientation := polandscape;
        FaxFound := PBSendFaxFrm.OutToFax(PBFaxListFrm.FaxListGrid.cells[2,irow],
              'Stk Balance to '+ FaxArray[irow,3], '');
        if not FaxFound then
          MessageDlg('The fax driver is not installed', mtError, [mbok], 0)
        else
          begin
 //         PBRPStkBalFrm.QuickReport.PrinterSettings.PrinterIndex := Faxfound;
          PBRPStkBalFrm.QuickReport.Print;
          {New fax driver - wait for the fax to finish - ACH 14/01/03} ;
//          STSendFaxFrm.WaitForFaxFinish(Self) ;
          end;
      finally
      end;
      PBRPStkBalFrm.Free;
    end;
  end;
  finally;
  PBFaxListFrm.Free;
    end;
  finally
  PrinterSettings.Free;
  Application.ProcessMessages;
  end;
end;

procedure TPBRSStkBalFrm.GetEmailApp;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      FEmailApplication := ReadString('Email', 'Application', 'None');
      FEmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
      fEmailAttachType := ReadString('Email', 'Def Attach Type', 'None');
      Free;
    end;
end;

procedure TPBRSStkBalFrm.PrintToAttachment(
  PBRPStkBalfrm: TPBRPStkBalfrm);
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
  FEmailAttachment.clear;

  sLocation := GetWinTempDir;
(*  if FEmailLocation = '' then
    sLocation := 'C:\Windows\temp\'
  else
    sLocation := FEmailLocation;
*)
  sFileName := 'StkBal';

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);
      try
        PBRPStkBalFrm.QuickReport.Prepare;
        PBRPStkBalFrm.QuickReport.ExportToFilter(RTFFilter);
      finally
        PBRPStkBalFrm.QuickReport.QRPrinter.Free;
        PBRPStkBalFrm.QuickReport.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);
      try
        PBRPStkBalFrm.QuickReport.Prepare;
        PBRPStkBalFrm.QuickReport.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPStkBalFrm.QuickReport.QRPrinter.Free;
        PBRPStkBalFrm.QuickReport.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);
      try
        PBRPStkBalFrm.QuickReport.Prepare;
        PBRPStkBalFrm.QuickReport.ExportToFilter(PDFFilter);
      finally
        PBRPStkBalFrm.QuickReport.QRPrinter.Free;
        PBRPStkBalFrm.QuickReport.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);
      try
        PBRPStkBalFrm.QuickReport.Prepare;
        PBRPStkBalFrm.QuickReport.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPStkBalFrm.QuickReport.QRPrinter.Free;
        PBRPStkBalFrm.QuickReport.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);
      try
        PBRPStkBalFrm.QuickReport.Prepare;
        PBRPStkBalFrm.QuickReport.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPStkBalFrm.QuickReport.QRPrinter.Free;
        PBRPStkBalFrm.QuickReport.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);
      try
        PBRPStkBalFrm.QuickReport.Prepare;
 //       ExportToRTF(PBRPStkBalRepFrm.QuickReport, sLocation + sFilename + '.bmp');
      PBRPStkBalFrm.QuickReport.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPStkBalFrm.QuickReport.QRPrinter.Free;
        PBRPStkBalFrm.QuickReport.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;


function TPBRSStkBalFrm.BuildContactDetails: string;
{ Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
  function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
//  Result := DummySQL.SQL.text;
  Result := Dummy2SQL.SQL.text;


{ if chkIncludeNonStock.checked then
    Result := Result + ' where ((Form_Reference.Stocked_Item =''Y'') OR (Form_Reference.Stocked_Item = ''N''))'
  else
    Result := Result + ' where (Form_Reference.Stocked_Item =''Y'')';  }

  if (rgCustomer.ItemIndex = 1) and (SelCustCode <> 0) then
  begin
    Result := Result + ' Having Customer_Branch.Customer = ' +
      IntToStr(SelCustCode) + ' AND Customer_Branch.Branch_No = ' +
      IntToStr(SelCustBranch);
  end;
 //   Result := Result + Ordering(IncRadioGroup);
//    Result := Result + ' Group by Customer.Name, Form_Reference.Form_reference_ID, Form_reference_Descr, Form_Reference.Reorder_Level, Purchase_OrderLine.Order_Unit, Purchase_OrderLine.Order_Price';
    Result := Result + ' Order By Customer.Name';
end;
end.
