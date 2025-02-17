unit wtRSSOAllocated;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, QrCtrls, ComCtrls, OleCtnrs, DB, Menus, Dateutils, IniFiles;

type
  TfrmWTRSSOAllocated = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpCustomer: TRadioGroup;
    grpbxDateSelect: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxCustomer: TGroupBox;
    Label4: TLabel;
    btnCustomer: TButton;
    btnPreview: TButton;
    btnExcel: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpCategory: TRadioGroup;
    lstbxCustomersCode: TListBox;
    lstbxCustomers: TListBox;
    pmnCustomers: TPopupMenu;
    Delete1: TMenuItem;
    rdgrpSelectBy: TRadioGroup;
    rdgrpSortBy: TRadioGroup;
    chkbxShowOnlyScheduled: TCheckBox;
    chkbxIncludeInvoiced: TCheckBox;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure pmnCustomersPopup(Sender: TObject);
    procedure rdgrpSelectByClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    rep, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  frmWTRSSOAllocated: TfrmWTRSSOAllocated;

implementation

uses
  System.UITypes,
  allCommon, WTSrchCustomer, DateSelV5, WTRPSOAllocated, WTMain;

{$R *.dfm}

procedure TfrmWTRSSOAllocated.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSOAllocated.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSSOAllocated.RunReport(const bPreview: boolean);
var
  iCount: integer;
begin
  frmWTRPSOAllocated := TfrmWTRPSOAllocated.create(self);
  try

//  Check if any records
    frmWTRPSOAllocated.customer := customer;
    frmWTRPSOAllocated.customerList.Clear;
    for iCount := 0 to pred(lstbxCustomersCode.Items.count) do
      begin
        frmWTRPSOAllocated.customerList.Add(lstbxCustomersCode.Items[icount]);
      end;
    if lstbxCustomersCode.Items.count > 0 then
      frmWTRPSOAllocated.customer := -1;

    frmWTRPSOAllocated.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPSOAllocated.dateto := padatestr(edtDateTo.Text);

    frmWTRPSOAllocated.SelectBy := rdgrpSelectBy.itemindex;
    frmWTRPSOAllocated.Sortby := rdgrpSortBy.itemindex;

    frmWTRPSOAllocated.bShowOnlyScheduled := chkbxShowOnlyScheduled.checked;
    frmWTRPSOAllocated.bIncludeInvoiced := chkbxIncludeInvoiced.Checked;

    frmWTRPSOAllocated.CustomerCategory := rdgrpCategory.itemindex;

    if frmWTRPSOAllocated.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmWTRPSOAllocated.qrlblCaption.Caption := frmWTRPSOAllocated.qrlblCaption.Caption;
    frmWTRPSOAllocated.qrlblDateRange.Caption := 'Orders due for fitting from ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmWTRPSOAllocated.qrlblSelection.Caption := 'Customers: ' + lstbxCustomers.Items[0];
    if chkbxShowOnlyScheduled.checked then
      frmWTRPSOAllocated.qrlblSelection.Caption := frmWTRPSOAllocated.qrlblSelection.Caption + ' Only Scheduled Orders';

    if bPreview then
      begin
          frmWTRPSOAllocated.qrpDetails.Preview;
      end
    else
      begin
          frmWTRPSOAllocated.qrpDetails.PrinterSetup;
          if frmWTRPSOAllocated.qrpDetails.tag = 0 then
            frmWTRPSOAllocated.qrpDetails.Print;
      end;
  finally
    frmWTRPSOAllocated.free;
  end;
end;

procedure TfrmWTRSSOAllocated.btnCustomerClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
//        lstbxSelectedCustomers.Clear;
//        edtCustomer.Clear;
        for iCount := (frmwtSrchCustomer.dbgDetails.SelectedRows.Count - 1) downto 0 do
          begin
            frmwtSrchCustomer.dbgDetails.datasource.DataSet.GotoBookmark(Tbookmark(frmwtSrchCustomer.dbgDetails.SelectedRows[iCount])) ;
            lstbxCustomersCode.Items.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer').asstring);
            lstbxCustomers.Items.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer_Name').asstring);
//            edtCustomer.Lines.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer_Name').asstring);
          end;
      end;
  finally
    frmwtSrchCustomer.free;
  end;
  enableOK(self);
end;

procedure TfrmWTRSSOAllocated.rdgrpCustomerClick(Sender: TObject);
begin
  case rdgrpCustomer.itemindex of
  0:  begin
        Customer := 0;
        lstbxCustomers.clear;
        lstbxCustomers.items.Add('All Customers');
        lstbxCustomersCode.Clear;
        grpbxCustomer.enabled := false;
      end;
  1:  begin
        lstbxCustomers.clear;
        grpbxCustomer.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSSOAllocated.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (lstbxCustomers.count > 0) and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.Enabled;
  btnExcel.enabled := btnpreview.enabled;
end;

procedure TfrmWTRSSOAllocated.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOAllocated.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
end;

function TfrmWTRSSOAllocated.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmWTRSSOAllocated.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOAllocated.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
  with IniFile do
    begin
      chkbxShowOnlyScheduled.Checked := (ReadString('Sales Order Allocated Report', 'Only Show Scheduled', 'N') = 'Y');
      chkbxIncludeInvoiced.Checked := (ReadString('Sales Order Allocated Report', 'Include Invoiced Orders', 'N') = 'Y');
    end;
  finally
    IniFile.Free;
  end;

  customer := 0;
  rep := 0;
  DateFrom := Date ;
  DateTo := Date + 7;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateTo);
end;

procedure TfrmWTRSSOAllocated.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSSOAllocated.btnExcelClick(Sender: TObject);
var
  iCount: integer;
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPSOAllocated := TfrmWTRPSOAllocated.create(self);
  try

//  Check if any records
    frmWTRPSOAllocated.customer := customer;
    frmWTRPSOAllocated.customerList.Clear;
    for iCount := 0 to pred(lstbxCustomersCode.Items.count) do
      begin
        frmWTRPSOAllocated.customerList.Add(lstbxCustomersCode.Items[icount]);
      end;
    if lstbxCustomersCode.Items.count > 0 then
      frmWTRPSOAllocated.customer := -1;

    frmWTRPSOAllocated.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPSOAllocated.dateto := padatestr(edtDateTo.Text);
    frmWTRPSOAllocated.SelectBy := rdgrpSelectBy.itemindex;
    frmWTRPSOAllocated.Sortby := rdgrpSortBy.itemindex;
    frmWTRPSOAllocated.bShowOnlyScheduled := chkbxShowOnlyScheduled.checked;
    frmWTRPSOAllocated.bIncludeInvoiced := chkbxIncludeInvoiced.Checked;

    frmWTRPSOAllocated.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmWTRPSOAllocated.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPSOAllocated.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPSOAllocated.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmWTRSSOAllocated.Delete1Click(Sender: TObject);
var
  iCount: integer;
begin
  for iCount := pred(lstbxCustomers.items.count) downto 0 do
    begin
      if lstbxCustomers.Selected[iCount] then
        begin
          lstbxCustomers.Items.Delete(iCount);
          lstbxCustomersCode.Items.Delete(iCount);
        end;
    end;
end;

procedure TfrmWTRSSOAllocated.pmnCustomersPopup(Sender: TObject);
begin
  if lstbxCustomers.items.count < 1 then
    exit;
end;

procedure TfrmWTRSSOAllocated.rdgrpSelectByClick(Sender: TObject);
begin
  grpbxDateSelect.Caption := (Sender as TRadioGroup).items[(Sender as TRadioGroup).itemindex];
end;

procedure TfrmWTRSSOAllocated.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  with IniFile do
    begin
      if chkbxShowOnlyScheduled.checked then
        WriteString('Sales Order Allocated Report', 'Only Show Scheduled', 'Y')
      else
        WriteString('Sales Order Allocated Report', 'Only Show Scheduled', 'N');

      if chkbxIncludeInvoiced.Checked then
        WriteString('Sales Order Allocated Report', 'Include Invoiced Orders', 'Y')
      else
        WriteString('Sales Order Allocated Report', 'Include Invoiced Orders', 'N');

    end;
end;

end.
