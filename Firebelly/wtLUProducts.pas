unit wtLUProducts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUProducts = class(TForm)
    dbgDetails: TDBGrid;
    lkpProducts: TFDQuery;
    srcLkpProducts: TDataSource;
    qryDelProduct: TFDQuery;
    lkpProductsProduct: TIntegerField;
    lkpProductsProduct_Description: TStringField;
    lkpProductsProduct_code: TStringField;
    lkpProductsPrice_pointer: TIntegerField;
    lkpProductsDefault_sales_nominal: TStringField;
    lkpProductsDefault_purchase_nominal: TStringField;
    lkpProductsVat: TIntegerField;
    lkpProductsProduct_Group: TIntegerField;
    lkpProductsUnit_Price: TFloatField;
    lkpProductsUnit_Cost: TFloatField;
    lkpProductsPrice_Unit_Description: TStringField;
    tmrSearch: TTimer;
    lkpProductsinactive: TStringField;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    chkbxShowInactive: TCheckBox;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnSelect: TBitBtn;
    btnDelete: TBitBtn;
    btnExcel: TBitBtn;
    BitBtn2: TBitBtn;
    lkpProductsVat_Rate: TFloatField;
    lkpProductsVat_Description: TStringField;
    lkpProductsProduct_Group_Description: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure tblProductBeforePost(DataSet: TDataSet);
    procedure btnSelectClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    FisLookup: boolean;
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure DeleteProduct(TempCode: integer);
    procedure SetisLookup(const Value: boolean);
    { Private declarations }
  public
    Product: integer;
    ProductCode: string;
    property isLookup: boolean read FisLookup write SetisLookup;
  end;

var
  frmWTLUProducts: TfrmWTLUProducts;

implementation

uses UITypes, wtMaintProduct, wtDataModule, wtMain, AllCommon;

{$R *.dfm}

procedure TfrmWTLUProducts.Refresh;
var
  sText: string;
begin
  with lkpProducts do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Description').asstring :=  '%' + edtSearch.Text + '%';
      if not chkbxShowInactive.Checked then
        parambyname('inactive').asstring := 'N'
      else
        parambyname('inactive').asstring := 'Y';
      open;
      stsbrDetails.Panels[0].Text := inttostr(recordcount) + ' records displayed';
    end;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUProducts.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUProducts.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUProducts.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintProduct := TfrmWTMaintProduct.create(Application);
    if FuncMode <> 'A' then
    begin
      icode := srclkpProducts.dataset.fieldbyname('Product').asinteger;
      frmWTMaintProduct.PricePointer := srclkpProducts.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintProduct.SellPrice := srclkpProducts.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintProduct.CostPrice := srclkpProducts.dataset.fieldbyname('Unit_Cost').asfloat;
    end
    else
    begin
      icode := 0;
      frmWTMaintProduct.PricePointer := 0;
      frmWTMaintProduct.SellPrice := 0.00;
      frmWTMaintProduct.CostPrice := 0.00;
    end;

    frmWTMaintProduct.FunctionMode := FuncMode;
    frmWTMaintProduct.showmodal;
    icode := frmWTMaintProduct.PricePointer;
    Refresh;
    dbgdetails.DataSource.dataset.Locate('Price_pointer', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintProduct.free;
  end;
end;

procedure TfrmWTLUProducts.btnDeleteClick(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      try
        DeleteProduct(PPointer);
        dtmdlWorktops.DeletePrices(PPointer);
        dtmdlWorktops.DeletePointer(PPointer);
      except messagedlg('Product ' + dbgDetails.DataSource.DataSet.fieldbyname('Product_Code').asstring + ' has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
      end;
      Refresh;
    end;
end;

procedure TfrmWTLUProducts.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUProducts.SetButtons(Sender: TObject; Field: TField);
begin
  with srclkpProducts.dataset do
  begin
    btnEdit.Enabled := recordCount > 0;
    btnDelete.Enabled := recordCount > 0;
    btnExcel.Enabled := recordCount > 0;
    btnSelect.Enabled := recordCount > 0;
  end;
end;

procedure TfrmWTLUProducts.tblProductBeforePost(DataSet: TDataSet);
begin
(*	dtmdlWorktops.qryNewPrice.Close;
  dtmdlWorktops.qryNewPrice.Open;
  tblProduct.FieldbyName('Price_Pointer').asinteger := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

  dtmdlWorktops.qryAddPointer.Close;
  dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := tblProduct.FieldbyName('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'E';
	dtmdlWorktops.qryAddPointer.ExecSQl;

	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := tblProduct.Fieldbyname('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
  dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 3;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := 1;
*)
end;

procedure TfrmWTLUProducts.DeleteProduct(TempCode: integer);
begin
  with qryDelProduct do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWTLUProducts.SetisLookup(const Value: boolean);
begin
  FisLookup := Value;
  btnSelect.visible := Fislookup;
end;

procedure TfrmWTLUProducts.btnSelectClick(Sender: TObject);
begin
  Product := lkpProducts.fieldbyname('Product').asinteger;
  ProductCode := lkpProducts.fieldbyname('Product_Code').asstring;
end;

procedure TfrmWTLUProducts.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUProducts.FormActivate(Sender: TObject);
begin
  Refresh;
  edtSearch.setfocus;
end;

procedure TfrmWTLUProducts.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;
  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWTLUProducts.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUProducts.edtSearchChange(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUProducts.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUProducts);
end;

procedure TfrmWTLUProducts.FormCreate(Sender: TObject);
begin
  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
  AllCommon.SetDBGridCols('', 'ProductsLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUProducts.FormDestroy(Sender: TObject);
begin
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTLUProducts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'ProductsLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUProducts.BitBtn2Click(Sender: TObject);
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

end.
