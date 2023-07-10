unit WTLUSupplierProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBTables, ComCtrls, StdCtrls, Grids, DBGrids,
  Buttons, WTSupplierDM;

type
  TfrmWTLUSupplierProduct = class(TForm)
    pnlFunctions: TPanel;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    dbgDetails: TDBGrid;
    pnlBottom: TPanel;
    Label1: TLabel;
    chkbxShowInactive: TCheckBox;
    edtSearch: TEdit;
    btnSelect: TBitBtn;
    BitBtn2: TBitBtn;
    stbrDetails: TStatusBar;
    qryDetails: TQuery;
    dtsDetails: TDataSource;
    tmrSearch: TTimer;
    qryDelete: TQuery;
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    procedure Refreshdata;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(Mode: string);
    procedure DeleteFromDB(CodeID: integer);
    { Private declarations }
  public
    { Public declarations }
    CodeSelected, DescriptionSelected: string;
    Supplier: integer;
    CostUnit: integer;
    CostPackQuantity: integer;
    UnitCost: real;
  end;

var
  frmWTLUSupplierProduct: TfrmWTLUSupplierProduct;

implementation

uses WTMaintSupplierProduct, wtDataModule;

{$R *.dfm}

procedure TfrmWTLUSupplierProduct.SetButtons(Sender: TObject; Field: TField);
begin
  with dtsDetails.dataset do
  begin
    btnChange.Enabled := recordcount > 0;
    btnDelete.Enabled := recordcount > 0;
    btnSelect.Enabled := recordcount > 0;
  end;
end;

procedure TfrmWTLUSupplierProduct.Refreshdata;
var
  sText: string;
begin
  with qrydetails do
    begin
      close;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Supplier').asinteger := Supplier;
      parambyname('Supplier_Product_Code').asstring := '%' + edtSearch.text + '%';
      if chkbxShowInactive.checked then
        parambyname('InActive').asstring := 'Y'
      else
        parambyname('InActive').asstring := 'N';
      open;
    end;

end;

procedure TfrmWTLUSupplierProduct.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUSupplierProduct.FormActivate(Sender: TObject);
begin
  refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
  edtSearch.setfocus;
end;

procedure TfrmWTLUSupplierProduct.chkbxShowInactiveClick(Sender: TObject);
begin
  RefreshData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUSupplierProduct.FormCreate(Sender: TObject);
begin
  dtsDetails.OnDataChange := SetButtons;
end;

procedure TfrmWTLUSupplierProduct.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSupplierProduct.btnSelectClick(Sender: TObject);
begin
  CodeSelected := qryDetails.fieldbyname('Supplier_Product_Code').asstring;
  DescriptionSelected := qryDetails.fieldbyname('Description').asstring;
  UnitCost := qryDetails.fieldbyname('Unit_Cost').asfloat;
  CostPackQuantity := qryDetails.fieldbyname('Cost_Pack_Quantity').asinteger;
  ModalResult:= mrOK;
end;

procedure TfrmWTLUSupplierProduct.FormShow(Sender: TObject);
begin
  refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
  edtSearch.setfocus;
end;

procedure TfrmWTLUSupplierProduct.edtSearchChange(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUSupplierProduct.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUSupplierProduct.CallMaintScreen(Mode: string);
var
  key: integer;
begin
  frmWTMaintSupplierProduct := TfrmWTMaintSupplierProduct.create(self);
  try
    frmWTMaintSupplierProduct.Supplier := Supplier;
    frmWTMaintSupplierProduct.dtmdlOneSupplier := TdtmdlSuppliers.create(self);
    if Mode = 'A' then
      begin
        frmWTMaintSupplierProduct.CodeID := 0;
      end
    else
      begin
        frmWTMaintSupplierProduct.CodeID := dbgDetails.datasource.dataset.fieldbyname('Supplier_Product').asinteger;
      end;
    frmWTMaintSupplierProduct.Mode := Mode;
    frmWTMaintSupplierProduct.showmodal;
    if frmWTMaintSupplierProduct.bOK then
      begin
        key := frmWTMaintSupplierProduct.PricePointer;
        RefreshData;
        dbgDetails.datasource.DataSet.locate('Price_Pointer', Variant(inttostr(key)),[lopartialKey]) ;
      end;
  finally
    frmWTMaintSupplierProduct.free;
  end;
end;

procedure TfrmWTLUSupplierProduct.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUSupplierProduct.btnDeleteClick(Sender: TObject);
var
  iCode: integer;
begin
  iCode := dbgDetails.datasource.DataSet.fieldbyname('Supplier_Product').asinteger;
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        DeleteFromDB(iCode);
        RefreshData;
      except
        messagedlg('This product' + ' has related data, therefore cannot be deleted. Make the product inactive', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUSupplierProduct.DeleteFromDB(CodeID: integer);
begin
  with qryDelete do
    begin
      sql.text := 'DELETE FROM Supplier_Product WHERE Supplier_Product = ' + inttostr(CodeID);
      close;
      execsql;
    end;

  with dtmdlWorktops.qryDelPrice do
    begin
      close;
      parambyname('Price_Pointer').asinteger := dbgDetails.datasource.DataSet.fieldbyname('Price_Pointer').asinteger;
      execsql;
    end;

  with dtmdlWorktops.qryDelPricePointer do
    begin
      close;
      parambyname('Price_Pointer').asinteger := dbgDetails.datasource.DataSet.fieldbyname('Price_Pointer').asinteger;
      execsql;
    end;
end;

end.
