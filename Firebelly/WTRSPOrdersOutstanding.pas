unit WTRSPOrdersOutstanding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, gtQrCtrls, ComCtrls, OleCtnrs, DB,
  DBTables, Menus;

type
  TfrmWTRSPOrdersOutstanding = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpSupplier: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxSupplier: TGroupBox;
    Label4: TLabel;
    btnSupplier: TButton;
    rdgrpSortBy: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    btnPreview: TButton;
    btnExcel: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpOperators: TRadioGroup;
    grpbxOperators: TGroupBox;
    Label3: TLabel;
    cmbOperators: TComboBox;
    qryOperators: TQuery;
    dtsOperators: TDataSource;
    lstbxSuppliersCode: TListBox;
    lstbxSuppliers: TListBox;
    pmnSuppliers: TPopupMenu;
    Delete1: TMenuItem;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure rdgrpOperatorsClick(Sender: TObject);
    procedure cmbOperatorsClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure pmnSuppliersPopup(Sender: TObject);
    procedure rdgrpSupplierClick(Sender: TObject);
  private
    Operator, Supplier: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadOperators;
  public
    { Public declarations }
  end;

var
  frmWTRSPOrdersOutstanding: TfrmWTRSPOrdersOutstanding;

implementation

uses allCommon, DateSelV5, WTSrchSupplier, WTRPPOrdersOutstanding;

{$R *.dfm}

procedure TfrmWTRSPOrdersOutstanding.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSPOrdersOutstanding.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSPOrdersOutstanding.RunReport(const bPreview: boolean);
var
  iCount: integer;
begin
  frmWTRPPOrdersOutstanding := TfrmWTRPPOrdersOutstanding.create(self);
  try

//  Check if any records
    frmWTRPPOrdersOutstanding.Supplier := Supplier;
    frmWTRPPOrdersOutstanding.SupplierList.Clear;
    for iCount := 0 to pred(lstbxSuppliersCode.Items.count) do
      begin
        frmWTRPPOrdersOutstanding.SupplierList.Add(lstbxSuppliersCode.Items[icount]);
      end;
    if lstbxSuppliersCode.Items.count > 0 then
      frmWTRPPOrdersOutstanding.Supplier := -1;

    frmWTRPPOrdersOutstanding.Operator := Operator;
    frmWTRPPOrdersOutstanding.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPPOrdersOutstanding.dateto := padatestr(edtDateTo.Text);
    frmWTRPPOrdersOutstanding.Sortby := rdgrpSortBy.itemindex;

    if frmWTRPPOrdersOutstanding.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmWTRPPOrdersOutstanding.qrlblCaption.Caption := frmWTRPPOrdersOutstanding.qrlblCaption.Caption;
    frmWTRPPOrdersOutstanding.qrlblDateRange.Caption := 'Purchase Orders from ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmWTRPPOrdersOutstanding.qrlblSelection.Caption := 'Operators: ' + cmbOperators.Text + ' Suppliers: ' + lstbxSuppliers.Items[0];
    frmWTRPPOrdersOutstanding.qrbGroupHeader.ForceNewPage := chkbxPageBreak.Checked;
    if bPreview then
      begin
          frmWTRPPOrdersOutstanding.qrpDetails.Preview;
      end
    else
      begin
          frmWTRPPOrdersOutstanding.qrpDetails.PrinterSetup;
          if frmWTRPPOrdersOutstanding.qrpDetails.tag = 0 then
            frmWTRPPOrdersOutstanding.qrpDetails.Print;
      end;
  finally
    frmWTRPPOrdersOutstanding.free;
  end;
end;

procedure TfrmWTRSPOrdersOutstanding.btnSupplierClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtSrchSupplier := TfrmwtSrchSupplier.create(self);
  try
    frmwtSrchSupplier.CodeSelected := Supplier;
    frmwtSrchSupplier.showmodal;
    if frmwtSrchSupplier.modalresult = idOK then
      begin
        for iCount := (frmwtSrchSupplier.dbgDetails.SelectedRows.Count - 1) downto 0 do
          begin
            frmwtSrchSupplier.dbgDetails.datasource.DataSet.GotoBookmark(Pointer(frmwtSrchSupplier.dbgDetails.SelectedRows[iCount])) ;
            lstbxSuppliersCode.Items.Add(frmwtSrchSupplier.dbgDetails.datasource.DataSet.fieldbyname('Supplier').asstring);
            lstbxSuppliers.Items.Add(frmwtSrchSupplier.dbgDetails.datasource.DataSet.fieldbyname('Supplier_Name').asstring);
          end;
      end;
  finally
    frmwtSrchSupplier.free;
  end;
  enableOK(self);
end;

procedure TfrmWTRSPOrdersOutstanding.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (cmbOperators.text <> '') and
                    (lstbxSuppliers.count > 0) and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.Enabled;
  btnExcel.enabled := btnpreview.enabled;
end;

procedure TfrmWTRSPOrdersOutstanding.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSPOrdersOutstanding.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSPOrdersOutstanding.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSPOrdersOutstanding.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSPOrdersOutstanding.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
begin
  Supplier := 0;
  Operator := 0;
  DateFrom := Date - 30;
  DateTo := Date;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateTo);
end;

procedure TfrmWTRSPOrdersOutstanding.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSPOrdersOutstanding.btnExcelClick(Sender: TObject);
var
  iCount: integer;
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPPOrdersOutstanding := TfrmWTRPPOrdersOutstanding.create(self);
  try

//  Check if any records
    frmWTRPPOrdersOutstanding.Supplier := Supplier;
    frmWTRPPOrdersOutstanding.SupplierList.Clear;
    for iCount := 0 to pred(lstbxSuppliersCode.Items.count) do
      begin
        frmWTRPPOrdersOutstanding.SupplierList.Add(lstbxSuppliersCode.Items[icount]);
      end;
    if lstbxSuppliersCode.Items.count > 0 then
      frmWTRPPOrdersOutstanding.Supplier := -1;

    frmWTRPPOrdersOutstanding.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPPOrdersOutstanding.dateto := padatestr(edtDateTo.Text);
    frmWTRPPOrdersOutstanding.Sortby := rdgrpSortBy.itemindex;

    //  Check if any records exist
    reccount := frmWTRPPOrdersOutstanding.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPPOrdersOutstanding.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPPOrdersOutstanding.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmWTRSPOrdersOutstanding.rdgrpOperatorsClick(Sender: TObject);
begin
  case rdgrpOperators.itemindex of
  0:  begin
        Operator := 0;
        cmbOperators.clear;
        cmbOperators.items.add('All Operators');
        cmbOperators.itemindex := 0;
        cmbOperators.enabled := false;
        cmbOperators.color := clbtnFace;
        grpbxOperators.enabled := false;
      end;
  1:  begin
        loadOperators;
        cmbOperators.Text := '';
        cmbOperators.color := clWindow;
        cmbOperators.enabled := true;
        grpbxOperators.enabled := true;
      end;
  end;
  enableok(self);

end;

procedure TfrmWTRSPOrdersOutstanding.cmbOperatorsClick(Sender: TObject);
begin
  qryOperators.First;
  qryOperators.MoveBy(cmbOperators.itemindex);
  Operator := qryOperators.fieldbyname('Operator').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSPOrdersOutstanding.LoadOperators;
begin
  cmbOperators.clear;
  with qryOperators do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbOperators.Items.Add(fieldbyname('Operator_Name').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSPOrdersOutstanding.Delete1Click(Sender: TObject);
var
  iCount: integer;
begin
  for iCount := pred(lstbxSuppliers.items.count) downto 0 do
    begin
      if lstbxSuppliers.Selected[iCount] then
        begin
          lstbxSuppliers.Items.Delete(iCount);
          lstbxSuppliersCode.Items.Delete(iCount);
        end;
    end;
end;

procedure TfrmWTRSPOrdersOutstanding.pmnSuppliersPopup(Sender: TObject);
begin
  if lstbxSuppliers.items.count < 1 then
    exit;
end;

procedure TfrmWTRSPOrdersOutstanding.rdgrpSupplierClick(Sender: TObject);
begin
  case rdgrpSupplier.itemindex of
  0:  begin
        Supplier := 0;
        lstbxSuppliers.clear;
        lstbxSuppliers.items.Add('All Suppliers');
        lstbxSuppliersCode.Clear;
        grpbxSupplier.enabled := false;
      end;
  1:  begin
        lstbxSuppliers.clear;
        grpbxSupplier.enabled := true;
      end;
  end;
  enableok(self);
end;

end.
