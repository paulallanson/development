unit WTRSContractOrders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, gtQrCtrls, ComCtrls, OleCtnrs, DB,
  DBTables, Menus, IniFiles;

type
  TfrmWTRSContractOrders = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpCustomer: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxCustomer: TGroupBox;
    Label4: TLabel;
    btnCustomer: TButton;
    rdgrpSortBy: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    btnPreview: TButton;
    btnExcel: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpReps: TRadioGroup;
    grpbxReps: TGroupBox;
    Label3: TLabel;
    cmbReps: TComboBox;
    qryReps: TQuery;
    dtsReps: TDataSource;
    lstbxCustomersCode: TListBox;
    lstbxCustomers: TListBox;
    pmnCustomers: TPopupMenu;
    Delete1: TMenuItem;
    chkbxShowOnlyScheduled: TCheckBox;
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
    procedure rdgrpRepsClick(Sender: TObject);
    procedure cmbRepsClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure pmnCustomersPopup(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    rep, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadReps;
  public
    { Public declarations }
  end;

var
  frmWTRSContractOrders: TfrmWTRSContractOrders;

implementation

uses allCommon, WTSrchCustomer, DateSelV5, WTRPContractDetails,
  WTRPContractOrders;

{$R *.dfm}

procedure TfrmWTRSContractOrders.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSContractOrders.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSContractOrders.RunReport(const bPreview: boolean);
var
  iCount: integer;
begin
  frmwtRPContractOrders := TfrmwtRPContractOrders.create(self);
  try

//  Check if any records
    frmwtRPContractOrders.customer := customer;
    frmwtRPContractOrders.customerList.Clear;
    for iCount := 0 to pred(lstbxCustomersCode.Items.count) do
      begin
        frmwtRPContractOrders.customerList.Add(lstbxCustomersCode.Items[icount]);
      end;
    if lstbxCustomersCode.Items.count > 0 then
      frmwtRPContractOrders.customer := -1;

    frmwtRPContractOrders.Rep := Rep;
    frmwtRPContractOrders.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPContractOrders.dateto := padatestr(edtDateTo.Text);
    frmwtRPContractOrders.Sortby := rdgrpSortBy.itemindex;

    frmwtRPContractOrders.bShowOnlyScheduled := chkbxShowOnlyScheduled.checked;

    if frmwtRPContractOrders.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmwtRPContractOrders.qrlblCaption.Caption := frmwtRPContractOrders.qrlblCaption.Caption;
    frmwtRPContractOrders.qrlblDateRange.Caption := 'Contract Quotes from ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmwtRPContractOrders.qrlblSelection.Caption := 'Reps: ' + cmbReps.Text + ' Customers: ' + lstbxCustomers.Items[0];
    frmwtRPContractOrders.qrbGroupHeader.ForceNewPage := chkbxPageBreak.Checked;
    if bPreview then
      begin
          frmwtRPContractOrders.qrpDetails.Preview;
      end
    else
      begin
          frmwtRPContractOrders.qrpDetails.PrinterSetup;
          if frmwtRPContractOrders.qrpDetails.tag = 0 then
            frmwtRPContractOrders.qrpDetails.Print;
      end;
  finally
    frmwtRPContractOrders.free;
  end;
end;

procedure TfrmWTRSContractOrders.btnCustomerClick(Sender: TObject);
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
            frmwtSrchCustomer.dbgDetails.datasource.DataSet.GotoBookmark(Pointer(frmwtSrchCustomer.dbgDetails.SelectedRows[iCount])) ;
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

procedure TfrmWTRSContractOrders.rdgrpCustomerClick(Sender: TObject);
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

procedure TfrmWTRSContractOrders.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (cmbReps.text <> '') and
                    (lstbxCustomers.count > 0) and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.Enabled;
  btnExcel.enabled := btnpreview.enabled;
end;

procedure TfrmWTRSContractOrders.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSContractOrders.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSContractOrders.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSContractOrders.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSContractOrders.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  try
  with IniFile do
    begin
      chkbxShowOnlyScheduled.Checked := (ReadString('Contract Orders Report', 'Only Show Scheduled', 'N') = 'Y');
    end;
  finally
    IniFile.Free;
  end;

  customer := 0;
  rep := 0;
  DateFrom := Date - 30;
  DateTo := Date;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateTo);
end;

procedure TfrmWTRSContractOrders.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSContractOrders.btnExcelClick(Sender: TObject);
var
  iCount: integer;
  reccount: integer;
  tmpFileName: string;
begin
  frmwtRPContractOrders := TfrmwtRPContractOrders.create(self);
  try

    frmwtRPContractOrders.customer := customer;
    frmwtRPContractOrders.customerList.Clear;
    for iCount := 0 to pred(lstbxCustomersCode.Items.count) do
      begin
        frmwtRPContractOrders.customerList.Add(lstbxCustomersCode.Items[icount]);
      end;
    if lstbxCustomersCode.Items.count > 0 then
      frmwtRPContractOrders.customer := -1;

    frmwtRPContractOrders.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPContractOrders.dateto := padatestr(edtDateTo.Text);
    frmwtRPContractOrders.Sortby := rdgrpSortBy.itemindex;

    frmwtRPContractOrders.bShowOnlyScheduled := chkbxShowOnlyScheduled.checked;

//    frmwtRPContractOrders.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmwtRPContractOrders.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmwtRPContractOrders.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmwtRPContractOrders.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmWTRSContractOrders.rdgrpRepsClick(Sender: TObject);
begin
  case rdgrpReps.itemindex of
  0:  begin
        Rep := 0;
        cmbReps.clear;
        cmbReps.items.add('All Reps');
        cmbReps.itemindex := 0;
        cmbReps.enabled := false;
        cmbReps.color := clbtnFace;
        grpbxReps.enabled := false;
      end;
  1:  begin
        loadReps;
        cmbReps.Text := '';
        cmbReps.color := clWindow;
        cmbReps.enabled := true;
        grpbxReps.enabled := true;
      end;
  end;
  enableok(self);

end;

procedure TfrmWTRSContractOrders.cmbRepsClick(Sender: TObject);
begin
  qryReps.First;
  qryReps.MoveBy(cmbReps.itemindex);
  Rep := qryReps.fieldbyname('Rep').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSContractOrders.LoadReps;
begin
  cmbReps.clear;
  with qryReps do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbReps.Items.Add(fieldbyname('Rep_Name').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSContractOrders.Delete1Click(Sender: TObject);
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

procedure TfrmWTRSContractOrders.pmnCustomersPopup(Sender: TObject);
begin
  if lstbxCustomers.items.count < 1 then
    exit;
end;

procedure TfrmWTRSContractOrders.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      if chkbxShowOnlyScheduled.checked then
        WriteString('Contract Order Report', 'Only Show Scheduled', 'Y')
      else
        WriteString('Contract Order Report', 'Only Show Scheduled', 'N');
    end;
end;

end.
