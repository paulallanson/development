unit STMaintSOrdLinePrices;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, STSOObjects, STSODataMod, DBCtrls;

type
  TSTMaintSOrdLinePricesFrm = class(TForm)
    pnlproduct: TPanel;
    Label1: TLabel;
    PartEdit: TEdit;
    DescriptionEdit: TEdit;
    pnlFunctions: TPanel;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    SellPriceMemo: TMemo;
    PurchPricememo: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    PackSizeMemo: TMemo;
    PurchPackMemo: TMemo;
    Label4: TLabel;
    dblkpVat: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    memOrderQuantity: TEdit;
    Label9: TLabel;
    memInvoiceQuantity: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    memDeliveryQuantity: TEdit;
    Label13: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure QtyEditChange(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure memOrderQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure memInvoiceQuantityKeyPress(Sender: TObject; var Key: Char);
  private
    FOrderLine: TOrderLine;
    FFuncMode: Char;
    FSalesOrder: TSalesOrder;
    FSONumber: Integer;
    FOriginalCost: real;
    FOriginalPrice: real;
    FCostPackSize: integer;
    FCostPrice: real;
    FVatRateCode: integer;
    FSellPackSize: integer;
    fPrice: Real;
    procedure SetOrderLine(const Value: TOrderLine);
    procedure SetSalesOrder(const Value: TSalesOrder);
    function GetPartDetails: boolean;
    procedure CheckOK(Sender: TObject);
    procedure SetOriginalCost(const Value: real);
    procedure SetOriginalPrice(const Value: real);
    procedure SetCostPackSize(const Value: integer);
    procedure SetCostPrice(const Value: real);
    procedure SetSellPackSize(const Value: integer);
    procedure SetVatRateCode(const Value: integer);
    procedure LoadOrderLine;
    procedure NewOrderLine;
    procedure setPrice(const Value: Real);
    function PartExists(TempPart: string): boolean;
    procedure UpdateOrderLine;
    procedure ClearOrderLine;
    { Private declarations }
  public
    bOK: Boolean;
    property CostPackSize: integer read FCostPackSize write SetCostPackSize;
    property CostPrice: real read FCostPrice write SetCostPrice;
    property FuncMode: Char read FFuncMode write FFuncMode;
    property OrderLine: TOrderLine read FOrderLine write SetOrderLine;
    property OriginalCost: real read FOriginalCost write SetOriginalCost;
    property OriginalPrice: real read FOriginalPrice write SetOriginalPrice;
    property Price: Real read fPrice write setPrice;
    property SalesOrder: TSalesOrder read FSalesOrder write SetSalesOrder;
    property SellPackSize: integer read FSellPackSize write SetSellPackSize;
    property SONumber: Integer read FSONumber write FSONumber;
    property VatRateCode: integer read FVatRateCode write SetVatRateCode;
  end;

var
  STMaintSOrdLinePricesFrm: TSTMaintSOrdLinePricesFrm;

implementation

uses CCSCommon;

{$R *.DFM}

procedure TSTMaintSOrdLinePricesFrm.SetOrderLine(const Value: TOrderLine);
begin
  FOrderLine := Value;
end;

procedure TSTMaintSOrdLinePricesFrm.SetSalesOrder(const Value: TSalesOrder);
begin
  FSalesOrder := Value;
end;

function TSTMaintSOrdLinePricesFrm.GetPartDetails: boolean;
var
  rPurchDisc: real;
begin
  With StSalesOrdDM.GetPartDetsSQL do
    begin
      Close;
      ParamByName('Part').AsString := PartEdit.text ;
      Open;

      if recordcount = 0 then
        begin
          MessageDlg('Product does not exist.', mterror,[mbOk], 0);
          Result := false;
          exit;
        end;
    end;

  With StSalesOrdDM.GetPartDetsSQL do
    begin
      OriginalCost := fieldbyname('Part_Purchase_Price').asfloat;
      OriginalPrice := (fieldbyname('Part_Cost_Cat').asfloat);
    end;

  DescriptionEdit.text := StSalesOrdDM.GetPartDetsSQL.fieldbyname('Part_Description').asstring;
  CostPackSize := StSalesOrdDM.GetPartDetsSQL.fieldbyname('Purch_Pack_quantity').asinteger;
  SellPackSize := StSalesOrdDM.GetPartDetsSQL.fieldByName('Sell_Pack_quantity').AsInteger;
  PackSizeMemo.text := StSalesOrdDM.GetPartDetsSQL.fieldbyname('Sell_Pack_quantity').asstring;
  PurchPackMemo.text := inttostr(CostPackSize);
  PurchPriceMemo.text := formatfloat('0.000',OriginalCost);
  VatRateCode := StSalesOrdDM.GetPartDetsSQL.fieldbyname('Vat_Code').asinteger;
  SellPriceMemo.text := formatfloat('0.000',OriginalPrice);
  dblkpVat.KeyValue := VatRateCode;

  CostPrice := OriginalCost;

  CheckOK(self);
  result := true
end;

procedure TSTMaintSOrdLinePricesFrm.CheckOK(Sender: TObject);
begin
 {Enable/disable OK button}
  OKBtn.Enabled := ((PartEdit.Text <> '') and
    (DescriptionEdit.Text <> '') and
    (SellPriceMemo.Text <> '')) or
    (FFuncMode = soDelete);
end;
procedure TSTMaintSOrdLinePricesFrm.SetOriginalCost(const Value: real);
begin
  FOriginalCost := Value;
end;

procedure TSTMaintSOrdLinePricesFrm.SetOriginalPrice(const Value: real);
begin
  FOriginalPrice := Value;
end;

procedure TSTMaintSOrdLinePricesFrm.SetCostPackSize(const Value: integer);
begin
  FCostPackSize := Value;
end;

procedure TSTMaintSOrdLinePricesFrm.SetCostPrice(const Value: real);
begin
  FCostPrice := Value;
end;

procedure TSTMaintSOrdLinePricesFrm.SetSellPackSize(const Value: integer);
begin
  FSellPackSize := Value;
end;

procedure TSTMaintSOrdLinePricesFrm.SetVatRateCode(const Value: integer);
begin
  FVatRateCode := Value;
end;

procedure TSTMaintSOrdLinePricesFrm.FormActivate(Sender: TObject);
begin
  bOK := False;

  STSalesOrdDM.MarkupSQL.active := false;
  STSalesOrdDM.MarkupSQL.active := true;

  STSalesOrdDM.qryVat.active := false;
  STSalesOrdDM.qryVat.active := true;

  LoadOrderLine;

  purchpricememo.setfocus;
  OKBtn.Visible := (FFuncMode <> soView);
  CheckOK(Self);
end;

procedure TSTMaintSOrdLinePricesFrm.LoadOrderLine;
var
  rDisc: real;
begin
  with OrderLine do
  begin
    PartEdit.text := Part;
    DescriptionEdit.Text := STSalesOrdDM.GetPartDescr(Part);
    Sellpricememo.Text := FormatMoneyTo3DP(sell_price);
    PurchPriceMemo.text := FormatMoneyTo3DP(part_cost);
    PackSizeMemo.text := inttostr(SellPackQuantity);
    PurchPackMemo.text := inttostr(PurchPackQuantity);
    dblkpVat.KeyValue := VatCode;

    SellPackSize := SellPackQuantity;
    CostPackSize := PurchPackQuantity;

    Price := Sell_Price;
    CostPrice := Part_Cost;
    OriginalPrice := OriginalSellPrice;
    VatCode := VatRateCode;

    memOrderQuantity.Text := inttostr(OrdQty);
    memDeliveryQuantity.Text := inttostr(DelQty);

    memInvoiceQuantity.Text := inttostr(InvQty);

//    SellPriceMemo.text := formatmoney(OriginalSellPrice);
  end;
end;

procedure TSTMaintSOrdLinePricesFrm.NewOrderLine;
begin
 PartEdit.Text := '';
 DescriptionEdit.Text := '';
 Sellpricememo.Text := '';
 OrderLine.ActnTkn := 'A';
end;

procedure TSTMaintSOrdLinePricesFrm.setPrice(const Value: Real);
begin
  fPrice := Value;
end;

procedure TSTMaintSOrdLinePricesFrm.QtyEditChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TSTMaintSOrdLinePricesFrm.OKBtnClick(Sender: TObject);
begin
  if FFuncMode = soAdd then
  begin
    if Partexists(PartEdit.text) then
      begin
        MessageDlg('This part already exist on the order, try another!', mtInformation,
      [mbOk], 0);
        exit;
      end;
  end;

  if FFuncMode = soAdd then
  begin
    UpdateOrderLine;
  end
  else
    if FFuncMode = soChange then
      UpdateOrderLine
    else
      if FFuncMode = soDelete then
      begin
        if MessageDlg('Really delete these details ?', mtConfirmation,
          [mbNo, mbYes], 0) <> mrYes then
        begin
          Exit;
        end;
      ClearOrderLine;
      end;
  bOK := True;
  Close;
end;

function TSTMaintSOrdLinePricesFrm.PartExists(TempPart: string):boolean;
var
  i: integer;
begin
  result := false;
  for i := 0 to pred(SalesOrder.Orderlines.count) do
    begin
      if SalesOrder.Orderlines[i].Part = TempPart then
        begin
          result := true;
          exit;
        end;
    end;
end;

procedure TSTMaintSOrdLinePricesFrm.UpdateOrderLine;
begin
 with OrderLine do
  begin
    part := partedit.text;
    PurchPackQuantity := CostPackSize;
    SellPackQuantity := SellPackSize;
    Sell_Price := strtofloat(SellPriceMemo.text);
    Part_Cost := strtofloat(PurchPriceMemo.text);
    VatCode := dblkpVat.KeyValue;

    PurchPackQuantity := strtoint(purchPackmemo.text);
    SellPackQuantity := strtoint(PackSizeMemo.text);

    PartClass := STSalesOrdDM.GetPartClass(Part);

    OriginalSellPrice := strtofloat(SellPriceMemo.text);

    OrdQty := strtoint(memOrderQuantity.text);
    DelQty := strtoint(memDeliveryQuantity.text);
    InvQty := strtoint(memInvoiceQuantity.text);

    if ActnTkn <> 'A' then
      ActnTkn := 'C';
  end;
end;

procedure TSTMaintSOrdLinePricesFrm.ClearOrderLine;
begin
with OrderLine do
  begin
    ActnTkn := 'D';
    end;
end;

procedure TSTMaintSOrdLinePricesFrm.memOrderQuantityKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;

end;

procedure TSTMaintSOrdLinePricesFrm.memInvoiceQuantityKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

end.
