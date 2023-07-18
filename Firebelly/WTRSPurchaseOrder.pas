unit WTRSPurchaseOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, QrCtrls, ComCtrls, OleCtnrs, DB,
  DBTables, Menus;

type
  TfrmWTRSPurchaseOrder = class(TForm)
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
  frmWTRSPurchaseOrder: TfrmWTRSPurchaseOrder;

implementation

uses allCommon, DateSelV5, WTSrchSupplier, WTRPPurchaseOrder;

{$R *.dfm}

procedure TfrmWTRSPurchaseOrder.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSPurchaseOrder.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSPurchaseOrder.RunReport(const bPreview: boolean);
var
  iCount: integer;
begin
  frmwtRPPurchaseOrder := TfrmwtRPPurchaseOrder.create(self);
  try

//  Check if any records
    frmwtRPPurchaseOrder.Supplier := Supplier;
    frmwtRPPurchaseOrder.SupplierList.Clear;
    for iCount := 0 to pred(lstbxSuppliersCode.Items.count) do
      begin
        frmwtRPPurchaseOrder.SupplierList.Add(lstbxSuppliersCode.Items[icount]);
      end;
    if lstbxSuppliersCode.Items.count > 0 then
      frmwtRPPurchaseOrder.Supplier := -1;

    frmwtRPPurchaseOrder.Operator := Operator;
    frmwtRPPurchaseOrder.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPPurchaseOrder.dateto := padatestr(edtDateTo.Text);
    frmwtRPPurchaseOrder.Sortby := rdgrpSortBy.itemindex;

    if frmwtRPPurchaseOrder.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmwtRPPurchaseOrder.qrlblCaption.Caption := frmwtRPPurchaseOrder.qrlblCaption.Caption;
    frmwtRPPurchaseOrder.qrlblDateRange.Caption := 'Purchase Orders from ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmwtRPPurchaseOrder.qrlblSelection.Caption := 'Operators: ' + cmbOperators.Text + ' Suppliers: ' + lstbxSuppliers.Items[0];
    frmwtRPPurchaseOrder.qrbGroupHeader.ForceNewPage := chkbxPageBreak.Checked;
    if bPreview then
      begin
          frmwtRPPurchaseOrder.qrpDetails.Preview;
      end
    else
      begin
          frmwtRPPurchaseOrder.qrpDetails.PrinterSetup;
          if frmwtRPPurchaseOrder.qrpDetails.tag = 0 then
            frmwtRPPurchaseOrder.qrpDetails.Print;
      end;
  finally
    frmwtRPPurchaseOrder.free;
  end;
end;

procedure TfrmWTRSPurchaseOrder.btnSupplierClick(Sender: TObject);
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
            frmwtSrchSupplier.dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(frmwtSrchSupplier.dbgDetails.SelectedRows[iCount])) ;
            lstbxSuppliersCode.Items.Add(frmwtSrchSupplier.dbgDetails.datasource.DataSet.fieldbyname('Supplier').asstring);
            lstbxSuppliers.Items.Add(frmwtSrchSupplier.dbgDetails.datasource.DataSet.fieldbyname('Supplier_Name').asstring);
          end;
      end;
  finally
    frmwtSrchSupplier.free;
  end;
  enableOK(self);
end;

procedure TfrmWTRSPurchaseOrder.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (cmbOperators.text <> '') and
                    (lstbxSuppliers.count > 0) and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.Enabled;
  btnExcel.enabled := btnpreview.enabled;
end;

procedure TfrmWTRSPurchaseOrder.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSPurchaseOrder.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSPurchaseOrder.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSPurchaseOrder.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSPurchaseOrder.FormCreate(Sender: TObject);
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

procedure TfrmWTRSPurchaseOrder.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSPurchaseOrder.btnExcelClick(Sender: TObject);
var
  iCount: integer;
  reccount: integer;
  tmpFileName: string;
begin
  frmwtRPPurchaseOrder := TfrmwtRPPurchaseOrder.create(self);
  try

//  Check if any records
    frmwtRPPurchaseOrder.Supplier := Supplier;
    frmwtRPPurchaseOrder.SupplierList.Clear;
    for iCount := 0 to pred(lstbxSuppliersCode.Items.count) do
      begin
        frmwtRPPurchaseOrder.SupplierList.Add(lstbxSuppliersCode.Items[icount]);
      end;
    if lstbxSuppliersCode.Items.count > 0 then
      frmwtRPPurchaseOrder.Supplier := -1;

    frmwtRPPurchaseOrder.datefrom := padatestr(edtDateFrom.Text);
    frmwtRPPurchaseOrder.dateto := padatestr(edtDateTo.Text);
    frmwtRPPurchaseOrder.Sortby := rdgrpSortBy.itemindex;

    //  Check if any records exist
    reccount := frmwtRPPurchaseOrder.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmwtRPPurchaseOrder.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmwtRPPurchaseOrder.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmWTRSPurchaseOrder.rdgrpOperatorsClick(Sender: TObject);
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

procedure TfrmWTRSPurchaseOrder.cmbOperatorsClick(Sender: TObject);
begin
  qryOperators.First;
  qryOperators.MoveBy(cmbOperators.itemindex);
  Operator := qryOperators.fieldbyname('Operator').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSPurchaseOrder.LoadOperators;
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

procedure TfrmWTRSPurchaseOrder.Delete1Click(Sender: TObject);
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

procedure TfrmWTRSPurchaseOrder.pmnSuppliersPopup(Sender: TObject);
begin
  if lstbxSuppliers.items.count < 1 then
    exit;
end;

procedure TfrmWTRSPurchaseOrder.rdgrpSupplierClick(Sender: TObject);
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
