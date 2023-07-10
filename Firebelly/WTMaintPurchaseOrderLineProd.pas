unit WTMaintPurchaseOrderLineProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, wtPurchasesDM, CRControls,
  Grids, DBGrids, DBTables, DB;

type
  TfrmWTMaintPurchaseOrderLineProd = class(TForm)
    pnlFunctions: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pnlDetails: TPanel;
    pnlTop: TPanel;
    pnlNotes: TPanel;
    Label7: TLabel;
    memNotes: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    btnLUProducts: TSpeedButton;
    OrdqtyLbl: TLabel;
    lblQtyDelivered: TLabel;
    lblQtyInvoiced: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    edtOrderQty: TMemo;
    edtDeliveredQty: TMemo;
    edtInvoicedQty: TMemo;
    edtUnitCost: TCREditMoney;
    edtCostUnit: TMemo;
    edtDiscount: TCREditMoney;
    cmbProducts: TComboBox;
    edtDescription: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure btnLUProductsClick(Sender: TObject);
    procedure cmbProductsKeyPress(Sender: TObject; var Key: Char);
    procedure cmbProductsExit(Sender: TObject);
    procedure cmbProductsEnter(Sender: TObject);
    procedure edtDescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure edtOrderQtyEnter(Sender: TObject);
    procedure edtOrderQtyExit(Sender: TObject);
  private
    sOldValue: string;
    bCodeChecked: boolean;
    FPOLine: TPOLine;
    FMode: TpolMode;
    FActivated: boolean;
    procedure SetPOLine(const Value: TPOLine);
    procedure SetMode(const Value: TpolMode);
    procedure ShowDetails;
    procedure SetActivated(const Value: boolean);
    procedure LoadProducts;
    function GetProduct: boolean;
    { Private declarations }
  public
    property Activated: boolean read FActivated write SetActivated;
    property Mode: TpolMode read FMode write SetMode;
    property POLine: TPOLine read FPOLine write SetPOLine;
  end;

var
  frmWTMaintPurchaseOrderLineProd: TfrmWTMaintPurchaseOrderLineProd;

implementation

uses wtLUMatType, WTLUSupplierProduct, AllCommon, wtDataModule;

{$R *.dfm}

{ TfrmWTMaintPurchaseOrderLine }

procedure TfrmWTMaintPurchaseOrderLineProd.SetMode(const Value: TpolMode);
begin
  FMode := Value;
  lblDelete.visible := (FMode = polDelete);
  pnlDetails.enabled := not (FMode = polDelete);
  pnlNotes.enabled := not (FMode = polDelete);
end;

procedure TfrmWTMaintPurchaseOrderLineProd.SetPOLine(const Value: TPOLine);
begin
  FPOLine := Value;
end;

procedure TfrmWTMaintPurchaseOrderLineProd.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin

    case Mode of
    polAdd     : Caption := 'Add a Purchase Order Product Line';
    polChange  : Caption := 'Change a Purchase Order Product Line';
    polDelete  : Caption := 'Delete a Purchase Order Product Line';
    end;  { case }

    if Mode = polAdd then
      sTemp := ' New Purchase Order Product Line '
    else
      sTemp := ' Purchase Order Product Line ' + IntToStr(POLine.Parent.DbKey) + ' ';

    LoadProducts;

    ShowDetails;
    pnlDetails.enabled := (Mode <> polView);
    btnOk.visible := (Mode <> polView);

    CheckOK(Self);
    FActivated := true;
  end;

end;

procedure TfrmWTMaintPurchaseOrderLineProd.LoadProducts;
begin
  cmbProducts.clear;

  with POLine.Parent.DataModule.qryGetProducts do
    begin
      close;
      parambyname('Supplier').asinteger := POLine.Parent.supplier;
      open;

      while eof <> true do
        begin
          cmbProducts.items.add(fieldbyname('Supplier_Product_Code').asstring);
          next;
        end;
    end;
end;

function TfrmWTMaintPurchaseOrderLineProd.GetProduct: boolean;
var
  sText: string;
begin
  result := false;
  bCodeChecked := false;

  {Don't check if product code is empty}
  
  if trim(cmbProducts.text) = '' then
    exit;

  with POLine.Parent.DataModule.qryGetProduct do
    begin
      close;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Supplier').asinteger := POLine.Parent.supplier;
      parambyname('Supplier_Product_Code').asstring := cmbProducts.text;
      open;

      if recordcount > 0 then
        begin
          edtDescription.Text := fieldbyname('Description').asstring;
          edtUnitCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);
          edtCostUnit.Text := inttostr(fieldbyname('Cost_Pack_quantity').asinteger);
          edtOrderQty.setfocus;
          result := true;
        end
      else
        begin
          if MessageDlg('The product entered doesn''t exist, Do you want to add this product?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              edtDescription.enabled := true;
              result := true;
            end
          else
            result := false;
        end;
    end;
  bCodeChecked := true;
end;

procedure TfrmWTMaintPurchaseOrderLineProd.ShowDetails;
begin
  if Mode <> polAdd then
  begin
    cmbProducts.Text := POLine.SupplierStockCode;
//    edtProductCode.Text := POLine.SupplierStockCode;
    edtDescription.Text := POLine.Description;
    edtOrderQty.text := floattostr(POLine.Quantity);
    edtDeliveredQty.text := floattostr(POLine.QtyDelivered);
    edtInvoicedQty.text := floattostr(POLine.QtyInvoiced);
    edtCostUnit.text := floattostr(POLine.CostUnit);
    edtDiscount.Text := formatfloat('0.00',POLine.DiscountPercentage);
    edtUnitCost.Text := formatfloat('0.00',POLine.UnitCost);
    memNotes.Text := POLine.Notes;

    edtUnitCost.Setfocus;
  end
  else
  begin
    cmbProducts.Text := '';
//    edtProductCode.Text := '';
    edtDescription.Text := '';
    edtOrderQty.text := '1';
    edtDeliveredQty.text := '0';
    edtInvoicedQty.text := '0';
    edtCostUnit.text := '1';
    edtDiscount.Text := formatfloat('0.00',0.00);
    edtUnitCost.Text := formatfloat('0.00',0.00);
    memNotes.Text := '';
  end;
end;

procedure TfrmWTMaintPurchaseOrderLineProd.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  POLine.UnitCost := strtofloat(edtUnitCost.text);
  POLine.SlabUnitCost := 0;
  POLine.CostUnit := strtoint(edtCostUnit.text);
  POLine.DiscountPercentage := strtofloat(edtDiscount.text);
  POLine.Quantity := strtoint(edtOrderQty.text);
  POLine.QtyDelivered := strtoint(edtDeliveredQty.text) * POLine.CostUnit;
  POLine.QtyInvoiced := strtoint(edtInvoicedQty.text) * POLine.CostUnit;
  POLine.Notes := memNotes.Text;

//  POLine.SupplierStockCode := edtProductCode.Text;
  POLine.SupplierStockCode := cmbProducts.Text;
  POLine.Description := edtDescription.Text;
  POLine.SlabDescription := '';
  POLine.SalesOrder := POLine.Parent.DataModule.SalesOrder;

  POLine.Worktop := 0;
  POLine.Thickness := 0;

  POLine.SlabDepth := 0;
  POLine.SlabLength := 0;

  if Mode = polAdd then
  begin
    POLine.POLNumber := POLine.Parent.Lines.MaxLineNo + 1;
    POLine.Mode := 'A';
    POLine.Parent.Lines.Add(POLine);
  end
  else
  if Mode = polDelete then
  begin
    inx := POLine.Parent.Lines.IndexOf(POLine.POLNumber);
    POLine.DeletefromDB;
    POLine.Parent.Lines.Delete(inx);
  end;

  ModalResult := mrOK;
end;

procedure TfrmWTMaintPurchaseOrderLineProd.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=
                    (edtDescription.text <> '') and
                    (edtUnitCost.text <> '') and
                    (edtCostUnit.text <> '') and
                    (edtOrderQty.text <> '') and
                    (edtDeliveredQty.text <> '') and
                    (edtInvoicedQty.text <> '');
end;

procedure TfrmWTMaintPurchaseOrderLineProd.SetActivated(const Value: boolean);
begin
  FActivated := Value;
end;

procedure TfrmWTMaintPurchaseOrderLineProd.btnLUProductsClick(
  Sender: TObject);
begin
  frmWTLUSupplierProduct := TfrmWTLUSupplierProduct.create(self);

  try
    frmWTLUSupplierProduct.supplier := POLine.Parent.supplier;
    frmWTLUSupplierProduct.CodeSelected := POLine.SupplierStockCode;
    frmWTLUSupplierProduct.showmodal;
    if frmWTLUSupplierProduct.ModalResult = mrOK then
      begin
//        edtProductCode.Text := frmWTLUSupplierProduct.CodeSelected;
        cmbProducts.Text := frmWTLUSupplierProduct.CodeSelected;
        edtDescription.Text := frmWTLUSupplierProduct.DescriptionSelected;
        edtUnitCost.Text := formatfloat('0.00',frmWTLUSupplierProduct.UnitCost);
        edtCostUnit.Text := inttostr(frmWTLUSupplierProduct.CostPackQuantity);
      end;
  finally
    frmWTLUSupplierProduct.free;
  end;

end;

procedure TfrmWTMaintPurchaseOrderLineProd.cmbProductsKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = #13) then { if it's an enter key }
    begin
      if GetProduct then
        edtDescription.SetFocus
      else
        cmbProducts.setfocus;
    end;
end;

procedure TfrmWTMaintPurchaseOrderLineProd.cmbProductsExit(
  Sender: TObject);
begin
  if not FActivated or bCodeChecked or (cmbProducts.text = '') then exit;

  if GetProduct then
    edtDescription.SetFocus
  else
    cmbProducts.setfocus;
end;

procedure TfrmWTMaintPurchaseOrderLineProd.cmbProductsEnter(
  Sender: TObject);
begin
  bCodeChecked := false;
end;

procedure TfrmWTMaintPurchaseOrderLineProd.edtDescriptionKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = #13) then { if it's an enter key }
    begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
    end
end;

procedure TfrmWTMaintPurchaseOrderLineProd.edtOrderQtyEnter(
  Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmWTMaintPurchaseOrderLineProd.edtOrderQtyExit(
  Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

end.
