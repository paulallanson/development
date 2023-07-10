unit WTRSSOCostAnalysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, gtQrCtrls, ComCtrls, OleCtnrs, DB,
  DBTables, Menus, IniFiles;

type
  TfrmWTRSSOCostAnalysis = class(TForm)
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
    rdgrpSortBy: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    btnPreview: TButton;
    btnExcel: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpCategory: TRadioGroup;
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
    rdgrpSelectBy: TRadioGroup;
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
    procedure rdgrpSelectByClick(Sender: TObject);
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
  frmWTRSSOCostAnalysis: TfrmWTRSSOCostAnalysis;

implementation

uses allCommon, WTSrchCustomer, DateSelV5, WTRPSOCostAnalysis;

{$R *.dfm}

procedure TfrmWTRSSOCostAnalysis.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSOCostAnalysis.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSSOCostAnalysis.RunReport(const bPreview: boolean);
var
  iCount: integer;
  sSelectby: string;
begin
  frmWTRPSOCostAnalysis := TfrmWTRPSOCostAnalysis.create(self);
  try

//  Check if any records
    frmWTRPSOCostAnalysis.customer := customer;
    frmWTRPSOCostAnalysis.customerList.Clear;
    for iCount := 0 to pred(lstbxCustomersCode.Items.count) do
      begin
        frmWTRPSOCostAnalysis.customerList.Add(lstbxCustomersCode.Items[icount]);
      end;
    if lstbxCustomersCode.Items.count > 0 then
      frmWTRPSOCostAnalysis.customer := -1;

    frmWTRPSOCostAnalysis.Rep := Rep;
    frmWTRPSOCostAnalysis.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPSOCostAnalysis.dateto := padatestr(edtDateTo.Text) + 1;
    frmWTRPSOCostAnalysis.Sortby := rdgrpSortBy.itemindex;
    frmWTRPSOCostAnalysis.SelectBy := rdgrpSelectBy.itemindex;

    frmWTRPSOCostAnalysis.CustomerCategory := rdgrpCategory.itemindex;

    if frmWTRPSOCostAnalysis.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmWTRPSOCostAnalysis.qrlblCaption.Caption := frmWTRPSOCostAnalysis.qrlblCaption.Caption;

    case rdgrpSelectBy.itemindex of
      0: sSelectBy := 'Order Dates';
      1: sSelectBy := 'Fitting Dates';
      2: sSelectBy := 'Template Dates';
      3: sSelectBy := 'Order Dates/TBC';
    end;

    frmWTRPSOCostAnalysis.qrlblDateRange.Caption := sSelectBy + ' from ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmWTRPSOCostAnalysis.qrlblSelection.Caption := 'Reps: ' + cmbReps.Text + ' Customers: ' + lstbxCustomers.Items[0];
    frmWTRPSOCostAnalysis.qrbGroupHeader.ForceNewPage := chkbxPageBreak.Checked;
    if bPreview then
      begin
          frmWTRPSOCostAnalysis.qrpDetails.Preview;
      end
    else
      begin
          frmWTRPSOCostAnalysis.qrpDetails.PrinterSetup;
          if frmWTRPSOCostAnalysis.qrpDetails.tag = 0 then
            frmWTRPSOCostAnalysis.qrpDetails.Print;
      end;
  finally
    frmWTRPSOCostAnalysis.free;
  end;
end;

procedure TfrmWTRSSOCostAnalysis.btnCustomerClick(Sender: TObject);
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

procedure TfrmWTRSSOCostAnalysis.rdgrpCustomerClick(Sender: TObject);
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

procedure TfrmWTRSSOCostAnalysis.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (cmbReps.text <> '') and
                    (lstbxCustomers.count > 0) and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.Enabled;
  btnExcel.enabled := btnpreview.enabled;
end;

procedure TfrmWTRSSOCostAnalysis.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOCostAnalysis.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSSOCostAnalysis.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSSOCostAnalysis.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOCostAnalysis.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  try
  with IniFile do
    begin
      if (ReadString('Sales Order Cost Analysis Report', 'Select By', '0') = '0') then
        rdgrpSelectBy.itemindex := 0
      else
      if (ReadString('Sales Order Cost Analysis Report', 'Select By', '1') = '1') then
        rdgrpSelectBy.itemindex := 1
      else
      if (ReadString('Sales Order Cost Analysis Report', 'Select By', '2') = '2') then
        rdgrpSelectBy.itemindex := 2
      else
      if (ReadString('Sales Order Cost Analysis Report', 'Select By', '3') = '3') then
        rdgrpSelectBy.itemindex := 3;
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

procedure TfrmWTRSSOCostAnalysis.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSSOCostAnalysis.btnExcelClick(Sender: TObject);
var
  iCount: integer;
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPSOCostAnalysis := TfrmWTRPSOCostAnalysis.create(self);
  try

//  Check if any records
//  Check if any records
    frmWTRPSOCostAnalysis.customer := customer;
    frmWTRPSOCostAnalysis.customerList.Clear;
    for iCount := 0 to pred(lstbxCustomersCode.Items.count) do
      begin
        frmWTRPSOCostAnalysis.customerList.Add(lstbxCustomersCode.Items[icount]);
      end;
    if lstbxCustomersCode.Items.count > 0 then
      frmWTRPSOCostAnalysis.customer := -1;

    frmWTRPSOCostAnalysis.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPSOCostAnalysis.dateto := padatestr(edtDateTo.Text) + 1;
    frmWTRPSOCostAnalysis.Sortby := rdgrpSortBy.itemindex;
    frmWTRPSOCostAnalysis.SelectBy := rdgrpSelectBy.itemindex;

    frmWTRPSOCostAnalysis.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmWTRPSOCostAnalysis.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPSOCostAnalysis.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPSOCostAnalysis.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmWTRSSOCostAnalysis.rdgrpRepsClick(Sender: TObject);
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

procedure TfrmWTRSSOCostAnalysis.cmbRepsClick(Sender: TObject);
begin
  qryReps.First;
  qryReps.MoveBy(cmbReps.itemindex);
  Rep := qryReps.fieldbyname('Rep').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSSOCostAnalysis.LoadReps;
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

procedure TfrmWTRSSOCostAnalysis.Delete1Click(Sender: TObject);
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

procedure TfrmWTRSSOCostAnalysis.pmnCustomersPopup(Sender: TObject);
begin
  if lstbxCustomers.items.count < 1 then
    exit;
end;

procedure TfrmWTRSSOCostAnalysis.rdgrpSelectByClick(Sender: TObject);
begin
  grpbxDateSelect.Caption := (Sender as TRadioGroup).items[(Sender as TRadioGroup).itemindex];
  if (Sender as TRadioGroup).itemindex = 3 then
    grpbxDateSelect.Caption := (Sender as TRadioGroup).items[0];
end;

procedure TfrmWTRSSOCostAnalysis.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      WriteString('Sales Order Cost Analysis Report', 'Select By', inttostr(rdgrpSelectBy.itemindex));
      Free;
    end;
end;

end.
