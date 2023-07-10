unit STMaintSOrdLineServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, STSOObjects, DBCtrls;

type
  TSTMaintSOrdLineServFrm = class(TForm)
    pnlproduct: TPanel;
    Label1: TLabel;
    PartEdit: TEdit;
    PartBitBtn: TBitBtn;
    DescriptionEdit: TEdit;
    pnlFunctions: TPanel;
    DelLabel: TLabel;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Panel1: TPanel;
    QtyEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SellPriceMemo: TMemo;
    PurchPricememo: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    PackSizeMemo: TMemo;
    PurchPackMemo: TMemo;
    dblkpMarkupType: TDBLookupComboBox;
    MarkupValueMemo: TMemo;
    procedure PartBitBtnClick(Sender: TObject);
    procedure PartEditChange(Sender: TObject);
    procedure PartEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure QtyEditChange(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
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
  STMaintSOrdLineServFrm: TSTMaintSOrdLineServFrm;

implementation

uses STPrtMnt, STSODataMod, STPacks;

{$R *.DFM}

procedure TSTMaintSOrdLineServFrm.PartBitBtnClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.bService := True;
    STPrtMntFrm.sCode := PartEdit.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
      begin
        PartEdit.text := STPrtMntFrm.sCode;
        if GetPartDetails then
          QtyEdit.setfocus
        else
          PartEdit.setfocus;
      end;
  finally
    STPrtMntFrm.Free ;
  end;
end;

procedure TSTMaintSOrdLineServFrm.SetOrderLine(const Value: TOrderLine);
begin
  FOrderLine := Value;
end;

procedure TSTMaintSOrdLineServFrm.SetSalesOrder(const Value: TSalesOrder);
begin
  FSalesOrder := Value;
end;

function TSTMaintSOrdLineServFrm.GetPartDetails: boolean;
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
  PurchPriceMemo.text := formatfloat('0.00',OriginalCost);
  VatRateCode := StSalesOrdDM.GetPartDetsSQL.fieldbyname('Vat_Code').asinteger;
  SellPriceMemo.text := formatfloat('0.00',OriginalPrice);

  dblkpMarkupType.KeyValue := StSalesOrdDM.GetPartDetsSQL.fieldByName('Markup_Type').Asstring;
  MarkupValueMemo.Text := formatfloat('0.00',StSalesOrdDM.GetPartDetsSQL.fieldByName('Markup_Value').Asfloat);

  CostPrice := OriginalCost;

  CheckOK(self);
  result := true
end;

procedure TSTMaintSOrdLineServFrm.CheckOK(Sender: TObject);
begin
 {Enable/disable OK button}
  OKBtn.Enabled := ((PartEdit.Text <> '') and
    (DescriptionEdit.Text <> '') and
    (SellPriceMemo.Text <> '') and
    (QtyEdit.text <> '')) or
    (FFuncMode = soDelete);
end;
procedure TSTMaintSOrdLineServFrm.PartEditChange(Sender: TObject);
begin
  DescriptionEdit.clear;
  SellPriceMemo.clear;
  checkOK(self);
end;

procedure TSTMaintSOrdLineServFrm.PartEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if GetPartDetails then
        QtyEdit.setfocus
      else
        PartEdit.setfocus;
    end;
end;

procedure TSTMaintSOrdLineServFrm.SetOriginalCost(const Value: real);
begin
  FOriginalCost := Value;
end;

procedure TSTMaintSOrdLineServFrm.SetOriginalPrice(const Value: real);
begin
  FOriginalPrice := Value;
end;

procedure TSTMaintSOrdLineServFrm.SetCostPackSize(const Value: integer);
begin
  FCostPackSize := Value;
end;

procedure TSTMaintSOrdLineServFrm.SetCostPrice(const Value: real);
begin
  FCostPrice := Value;
end;

procedure TSTMaintSOrdLineServFrm.SetSellPackSize(const Value: integer);
begin
  FSellPackSize := Value;
end;

procedure TSTMaintSOrdLineServFrm.SetVatRateCode(const Value: integer);
begin
  FVatRateCode := Value;
end;

procedure TSTMaintSOrdLineServFrm.FormActivate(Sender: TObject);
begin
  bOK := False;

  STSalesOrdDM.MarkupSQL.active := false;
  STSalesOrdDM.MarkupSQL.active := true;

  if FFuncMode = soAdd then
    begin
      NewOrderLine;

      PartEdit.setfocus;
      partbitbtn.enabled := true;
      Caption := 'Add a new order service line'
    end
  else
    begin
      LoadOrderLine;

      if FFuncMode = soChange then
      begin
        Caption := 'Change an order service line';
        Qtyedit.setfocus;
      end
      else
      if FFuncMode = soDelete then
      begin
        partbitbtn.enabled := False;
        PartEdit.readonly := true;
        PartEdit.color := DescriptionEdit.color;
        Caption := 'Delete an order service line';
        SellPricememo.readonly := True;
        QtyEdit.ReadOnly := True;
      end
      else
      if FFuncMode = soView then
      begin
        Caption := 'View sales order line';
        pnlProduct.enabled := false;
      end;
    end;

  DelLabel.Visible := (FFuncMode = soDelete);
  OKBtn.Visible := (FFuncMode <> soView);
  CheckOK(Self);
end;

procedure TSTMaintSOrdLineServFrm.LoadOrderLine;
var
  rDisc: real;
begin
  with OrderLine do
  begin
    PartEdit.text := Part;
    DescriptionEdit.Text := STSalesOrdDM.GetPartDescr(Part);
    Sellpricememo.Text := formatmoney(sell_price);
//    PurchPriceMemo.text := formatfloat('0.00',STSalesOrdDM.GetPartCost(Part));
    PurchPriceMemo.text := formatmoney(part_cost);
    QtyEdit.text := showinPacks(OrdQty,SellPackQuantity);
    PackSizeMemo.text := inttostr(SellPackQuantity);
    PurchPackMemo.text := inttostr(PurchPackQuantity);
    SellPackSize := SellPackQuantity;
    CostPackSize := PurchPackQuantity;

    dblkpMarkupType.keyvalue := MarkupType;
    MarkupValueMemo.text := formatmoney(MarkupValue);
    Price := Sell_Price;
    CostPrice := Part_Cost;
    OriginalPrice := OriginalSellPrice;
    VatCode := VatRateCode;

//    SellPriceMemo.text := formatmoney(OriginalSellPrice);
  end;
end;

procedure TSTMaintSOrdLineServFrm.NewOrderLine;
begin
 PartEdit.Text := '';
 DescriptionEdit.Text := '';
 Sellpricememo.Text := '';
 QtyEdit.text := '';
 OrderLine.ActnTkn := 'A';
end;

procedure TSTMaintSOrdLineServFrm.setPrice(const Value: Real);
begin
  fPrice := Value;
end;

procedure TSTMaintSOrdLineServFrm.QtyEditChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TSTMaintSOrdLineServFrm.OKBtnClick(Sender: TObject);
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

function TSTMaintSOrdLineServFrm.PartExists(TempPart: string):boolean;
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

procedure TSTMaintSOrdLineServFrm.UpdateOrderLine;
begin
 with OrderLine do
  begin
    part := partedit.text;
    PurchPackQuantity := CostPackSize;
    SellPackQuantity := SellPackSize;
    OrdQty := inptosing(QtyEdit.Text,SellPackQuantity);
    Sell_Price := strtofloat(SellPriceMemo.text);
    Part_Cost := strtofloat(PurchPriceMemo.text);
    VatCode := VatRateCode;

    PartClass := STSalesOrdDM.GetPartClass(Part);

    MarkupType := dblkpMarkupType.keyvalue;
    MarkupValue := strtofloat(MarkupValueMemo.text);

    OriginalSellPrice := strtofloat(SellPriceMemo.text);
    DelQty := OrdQty;
    OrdQtyinPacks := ShowinPacks(OrdQty,SellPackSize);
    if ActnTkn <> 'A' then
      ActnTkn := 'C';
  end;
end;

procedure TSTMaintSOrdLineServFrm.ClearOrderLine;
begin
with OrderLine do
  begin
    ActnTkn := 'D';
    end;
end;

end.
