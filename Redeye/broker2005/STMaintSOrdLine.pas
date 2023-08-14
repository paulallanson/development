unit STMaintSOrdLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, STSOObjects, DBCtrls, ExtCtrls;

type
  TSTMaintSOrdLineFrm = class(TForm)
    pnlFunctions: TPanel;
    DelLabel: TLabel;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    pnlproduct: TPanel;
    Label1: TLabel;
    PartEdit: TEdit;
    PartBitBtn: TBitBtn;
    DescriptionEdit: TEdit;
    pnlSales: TPanel;
    pnlcosts: TPanel;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    PurchPackMemo: TMemo;
    PurchPriceMemo: TMemo;
    Label6: TLabel;
    Label3: TLabel;
    PurchDiscMemo: TMemo;
    DiscCostMemo: TMemo;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    PackSizeMemo: TMemo;
    SellPriceMemo: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    dbLkpDiscountType: TDBLookupComboBox;
    btnClear: TSpeedButton;
    DiscountMemo: TMemo;
    lblDiscount: TLabel;
    PBinLbl: TLabel;
    DiscPriceMemo: TMemo;
    QtySinglesMemo: TEdit;
    Label9: TLabel;
    OrdqtyLbl: TLabel;
    QtyEdit: TEdit;
    meminWhouse: TMemo;
    memAllocated: TMemo;
    memFree: TMemo;
    memPaid: TMemo;
    memUnpaid: TMemo;
    lblSource: TLabel;
    lblReplenishName: TLabel;
    lblOvers: TLabel;
    QtyOversMemo: TEdit;
    chkbxSample: TCheckBox;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    memTotalStock: TMemo;
    memMin: TMemo;
    memMax: TMemo;
    memReorder: TMemo;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    procedure ValidateMoney(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure PartBitBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure QtySpinEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure PartEditKeyPress(Sender: TObject; var Key: Char);
    procedure PartEditChange(Sender: TObject);
    procedure QtyEditKeyPress(Sender: TObject; var Key: Char);
    procedure dbLkpDiscountTypeClick(Sender: TObject);
    procedure DiscountMemoChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure QtyEditChange(Sender: TObject);
    procedure QtySinglesMemoChange(Sender: TObject);
    procedure QtyEditEnter(Sender: TObject);
    procedure QtyEditExit(Sender: TObject);
    procedure QtySinglesMemoExit(Sender: TObject);
    procedure QtySinglesMemoEnter(Sender: TObject);
    procedure PackSizeMemoChange(Sender: TObject);
    procedure QtyOversMemoChange(Sender: TObject);
    procedure chkbxSampleClick(Sender: TObject);
  private
    bNumbered: boolean;
    FFreeStock: integer;
    FReorderLevel: integer;
    FPacks: bytebool;
    FSingles: bytebool;
    fPrice: Real;
    fPart: string;
    fPartDesc: String;
    FFuncMode: Char;
    FSONumber: Integer;
    FOrderLine: TOrderLine;
    fPart_Cost: real;
    sOldValue: string;
    FSalesOrder: TSalesOrder;
    FBranchNo: integer;
    FSupplier: integer;
    FReplenishSource: integer;
    FPartStore: integer;
    FCostPackSize: integer;
    FCostPrice: real;
    FVatRateCode: integer;
    FSellPackSize: integer;
    FDiscountValue: real;
    FDiscountType: string;
    FOriginalPrice: real;
    FOriginalCost: real;
    fPartClass: string;
    FLineIsSample: boolean;
    procedure GetStockLevels;
    procedure DisplaySingles;
    procedure DisplayPacks;
    procedure NewOrderLine;
    procedure UpdateOrderLine;
    function PartExists(TempPart: string):boolean;
    procedure ClearOrderLine;
    procedure LoadOrderLine;
    procedure setpart(const Value: string);
    procedure setPartDesc(const Value: String);
    procedure setPrice(const Value: Real);
    procedure setPart_Cost(const Value: real);
    function GetPartDetails: boolean;
    procedure SetSalesOrder(const Value: TSalesOrder);
    procedure SetBranchNo(const Value: integer);
    procedure SetSupplier(const Value: integer);
    procedure SetReplenishSource(const Value: integer);
    procedure SetPartStore(const Value: integer);
    procedure SetCostPackSize(const Value: integer);
    procedure SetCostPrice(const Value: real);
    procedure SetVatRateCode(const Value: integer);
    procedure SetSellPackSize(const Value: integer);
    procedure SetDiscountType(const Value: string);
    procedure SetDiscountValue(const Value: real);
    function GetDiscountedPrice: real;
    procedure SetOriginalPrice(const Value: real);
    procedure SetOriginalCost(const Value: real);
    procedure setPartClass(const Value: string);
    procedure SetLineIsSample(const Value: boolean);
  public
    { Public declarations }
  bOK: Boolean;
  property BranchNo: integer read FBranchNo write SetBranchNo;
  property CostPackSize: integer read FCostPackSize write SetCostPackSize;
  property CostPrice: real read FCostPrice write SetCostPrice;
  property DiscountValue: real read FDiscountValue write SetDiscountValue;
  property DiscountType: string read FDiscountType write SetDiscountType;
  property FuncMode: Char read FFuncMode write FFuncMode;
  property LineIsSample: boolean read FLineIsSample write SetLineIsSample;
  property OrderLine: TOrderLine read FOrderLine write FOrderLIne;
  property OriginalCost: real read FOriginalCost write SetOriginalCost;
  property OriginalPrice: real read FOriginalPrice write SetOriginalPrice;
  Property Part : string read fPart write setpart;
  property PartStore: integer read FPartStore write SetPartStore;
  property Part_Cost: real read fPart_Cost write setPart_Cost;
  Property PartDesc: String read fPartDesc write setPartDesc;
  property Price: Real read fPrice write setPrice;
  property ReplenishSource: integer read FReplenishSource write SetReplenishSource;
  property SalesOrder: TSalesOrder read FSalesOrder write SetSalesOrder;
  property SONumber: Integer read FSONumber write FSONumber;
  property Supplier: integer read FSupplier write SetSupplier;
  property SellPackSize: integer read FSellPackSize write SetSellPackSize;
  property VatRateCode: integer read FVatRateCode write SetVatRateCode;
  property PartClass: string read fPartClass write setPartClass;
  end;

var
  STMaintSOrdLineFrm: TSTMaintSOrdLineFrm;

implementation

uses STSODataMod, STPacks, STMaintSOrdSerialNos, CCSCommon, STLUPartStock,
  STPrtMnt;

{$R *.DFM}


procedure TSTMaintSOrdLineFrm.PartBitBtnClick(Sender: TObject);
begin
  if ReplenishSource = 2 then
  begin
    STLUPartStockFrm := TSTLUPartStockFrm.Create(Self) ;
    try
      STLUPartStockFrm.store := PartStore ;

      if PartEdit.Text = '' then
        STLUPartStockFrm.edtSearch.text := STSalesOrdDM.GetCustomerPrefix(SalesOrder.Customer)
      else
        STLUPartStockFrm.edtSearch.text := PartEdit.Text ;

      STLUPartStockFrm.ShowModal ;
      if STLUPartStockFrm.bOK = True then
        begin
          PartEdit.text := STLUPartStockFrm.sCode;
          if GetPartDetails then
            QtySinglesMemo.setfocus
          else
            PartEdit.setfocus;
        end;
    finally
      STLUPartStockFrm.Free ;
    end
  end
  else
  begin
    STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
    try
      STPrtMntFrm.bIs_LookUp := True ;
      STPrtMntFrm.sCode := PartEdit.Text ;
      STPrtMntFrm.bShowAll := false;
      STPrtMntFrm.bStocked := true;
      STPrtMntFrm.CodeEdit.Text := STSalesOrdDM.GetCustomerPrefix(SalesOrder.Customer);
      STPrtMntFrm.ShowModal ;
      if STPrtMntFrm.bOK = True then
        begin
          PartEdit.text := STPrtMntFrm.sCode;
          if GetPartDetails then
            QtySinglesMemo.setfocus
          else
            PartEdit.setfocus;
        end;
    finally
      STPrtMntFrm.Free ;
    end;
  end;
end;

procedure TSTMaintSOrdLineFrm.OKBtnClick(Sender: TObject);
begin
  if FFuncMode <> soDelete then
  begin
    if (Replenishsource <> 1) and (PartClass = 'STK') then
      begin
        {Check that the stock entered is more than what is available in the warehouse}
        if (strtoint(QtySinglesMemo.text) + strtoint(QtyOversMemo.text)) > FFreeStock then
          if MessageDlg('The Total Quantity entered is greater than the free stock at this warehouse, would you like to continue?', mtWarning,
            [mbNo, mbYes], 0) <> mrYes then
            begin
              Exit;
            end;
        {Check whether the quantity entered take the stock level below the Reorder level}
        if (FReorderlevel > 0) and ((FFreeStock - strtoint(QtySinglesMemo.text) - strtoint(QtyOversMemo.text)) <= FReorderLevel) then
          MessageDlg('The order quantity for this product will take the free stock below the reorder level, please ensure provisions are made to replenish the stock', mtWarning,
            [mbOk], 0)
      end;

    if pos(':',QtyEdit.text) > 0 then
      if MessageDlg('The Quantity entered is not for complete packs, would you like to continue?', mtWarning,
        [mbNo, mbYes], 0) <> mrYes then
          begin
            Exit;
          end;

    if StrToFloatDef(DiscPriceMemo.text, 0, FormatSettings) < StrToFloatDef(DiscCostMemo.text, 0, FormatSettings) then
      if MessageDlg('The Selling Price is less than the Purchase Price, would you like to continue?', mtWarning,
        [mbNo, mbYes], 0) <> mrYes then
          begin
            Exit;
          end;
  end;

  if FFuncMode = soAdd then
  begin
    if Partexists(PartEdit.text) then
      begin
        MessageDlg('This part already exist on the order, try another!', mtInformation,
      [mbOk], 0);
        exit;
      end;
  end;
  if (OrderLine.ActnTkn = 'A') and bNumbered then
    begin
      STMaintSOrdSerialNosFrm := TSTMaintSOrdSerialNosFrm.create(self);
      try
        STMaintSOrdSerialNosFrm.OrderLine := OrderLine;
        STMaintSOrdSerialNosfrm.SONumber := SalesOrder.SONumber;
        STMaintSOrdSerialNosFrm.Product := trim(PartEdit.text);
        STMaintSOrdSerialNosFrm.lblProductCode.caption := trim(PartEdit.text) + ' - ' + (DescriptionEdit.text);
        STMaintSOrdSerialNosFrm.Quantity := StrToFloatDef(QtySinglesMemo.text, 0, FormatSettings);
        STMaintSOrdSerialNosFrm.showmodal;
        if STMaintSOrdSerialNosFrm.modalresult <> idOK then
          exit;
      finally
        STMaintSOrdSerialNosFrm.free;
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

procedure TSTMaintSOrdLineFrm.setpart(const Value: string);
begin
  fPart := Value;
end;

procedure TSTMaintSOrdLineFrm.setPartDesc(const Value: String);
begin
  fPartDesc := Value;
end;

procedure TSTMaintSOrdLineFrm.setPrice(const Value: Real);
begin
  fPrice := Value;
end;

procedure TSTMaintSOrdLineFrm.QtySpinEditChange(Sender: TObject);
begin
CheckOk(Self);
okbtn.setfocus;
end;

procedure TSTMaintSOrdLineFrm.FormActivate(Sender: TObject);
begin
  bOK := False;

//  lblOvers.Visible := (SalesOrder.SOType = 'J');
//  QtyOversMemo.visible := (SalesOrder.SOType = 'J');

  {Initialise the Stock level labels}
  meminWhouse.text := '0';
  memAllocated.text := '0';
  memFree.text := '0';
  memPaid.text := '0';
  memUnpaid.text := '0';

  memTotalStock.text := '0';

  FFreeSTock := 0;
  FReorderLevel := 0;

  Fpacks := true;
  Fsingles := true;

  STSalesOrdDM.GetDiscTypeSQl.Close;
  STSalesOrdDM.GetDiscTypeSQl.open;

  if FFuncMode = soAdd then
    begin
    NewOrderLine;
    Fpacks := false;
    Fsingles := false;

    PartEdit.setfocus;
    partbitbtn.enabled := true;
    Caption := 'Add a new order line'
    end
  else
    begin
      LoadOrderLine;
      Fpacks := false;
      Fsingles := false;

      if FFuncMode = soChange then
        begin
//      PartEdit.readonly := true;
//      PartEdit.color := DescriptionEdit.color;
        Caption := 'Change an order line';
        QtySinglesMemo.setfocus;
        end
      else
        if FFuncMode = soDelete then
          begin
          partbitbtn.enabled := False;
          PartEdit.readonly := true;
          PartEdit.color := DescriptionEdit.color;
          Caption := 'Delete an order line';
          SellPricememo.readonly := True;
          QtyEdit.ReadOnly := True;
          end
        else
          if FFuncMode = soView then
            begin
              Caption := 'View sales order line';
              pnlProduct.enabled := false;
              pnlsales.enabled := false;
              pnlcosts.enabled := false;
            end;
    end;

  DelLabel.Visible := (FFuncMode = soDelete);
  OKBtn.Visible := (FFuncMode <> soView);
  CheckOK(Self);
end;

procedure TSTMaintSOrdLineFrm.LoadOrderLine;
var
  rDisc: real;
begin
  PartClass := OrderLine.PartClass;
  VatRateCode := OrderLine.VatCode;

  with OrderLine do
  begin
    PartEdit.text := Part;
    DescriptionEdit.Text := STSalesOrdDM.GetPartDescr(Part);
    Sellpricememo.Text := formatmoney(sell_price);
    DiscCostMemo.text := formatmoney(Part_Cost);
    PurchPriceMemo.text := formatfloat('0.00',STSalesOrdDM.GetPartCost(Part));
    if ReplenishSource = 1 then
      begin
      rDisc := ((STSalesOrdDM.GetPartCost(Part) - Part_Cost)/STSalesOrdDM.GetPartCost(Part))*100.;
      PurchDiscMemo.text := formatfloat('0.00',rDisc);
      end
    else
      PurchDiscMemo.text := '0.00';

    QtyEdit.text := showinPacks(OrdQty,SellPackQuantity);
    QtySinglesMemo.text := inttostr(OrdQty);
    QtyOversMemo.Text := inttostr(OversQty);
    PackSizeMemo.text := inttostr(SellPackQuantity);
    PurchPackMemo.text := inttostr(PurchPackQuantity);
    SellPackSize := SellPackQuantity;
    CostPackSize := PurchPackQuantity;

    Price := Sell_Price;
    CostPrice := Part_Cost;
    OriginalPrice := OriginalSellPrice;
    VatCode := VatRateCode;

    dbLkpDiscountType.keyvalue := Disc_Type;
    DiscountType := Disc_Type;

    DiscountMemo.text := formatfloat('0.00', Disc_Val);
    DiscountValue := Disc_Val;
    DiscPriceMemo.text := formatmoneyto3DP(Sell_Price);
    SellPriceMemo.text := formatmoneyto3DP(OriginalSellPrice);

    chkbxSample.Checked := LineIsSample;
    bNumbered := STSalesOrdDM.GetPartNumbered(Part);
    GetStockLevels;
  end;

end;

procedure TSTMaintSOrdLineFrm.NewOrderLine;
begin
 PartEdit.Text := '';
 DescriptionEdit.Text := '';
 Sellpricememo.Text := '';
 QtyEdit.text := '';
 QtyOversMemo.Text := '0';
 OrderLine.ActnTkn := 'A';
end;

procedure TSTMaintSOrdLineFrm.UpdateOrderLine;
begin
 with OrderLine do
  begin
    part := partedit.text;
    PurchPackQuantity := CostPackSize;
    SellPackQuantity := StrToInt(PackSizeMemo.text);
    //SellPackSize;
    OrdQty := inptosing(QtyEdit.Text,SellPackQuantity);
    OversQty := strtoint(QtyOversMemo.text);
    Sell_Price := StrToFloatDef(DiscPriceMemo.text, 0, FormatSettings);
    Part_Cost := CostPrice;
    VatCode := VatRateCode;

    OriginalSellPrice := StrToFloatDef(SellPriceMemo.text, 0, FormatSettings);
    Disc_val := DiscountValue;
    Disc_Type := DiscountType;

    OrdQtyinPacks := ShowinPacks(OrdQty,SellPackQuantity);

    LineisSample := chkbxSample.checked;
    PartClass := self.PartClass;
    
    if ActnTkn <> 'A' then
      ActnTkn := 'C';
  end;
end;

function TSTMaintSOrdLineFrm.PartExists(TempPart: string):boolean;
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

procedure TSTMaintSOrdLineFrm.CheckOK(Sender: TObject);
begin
 {Enable/disable OK button}
  OKBtn.Enabled := ((PartEdit.Text <> '') and
    (DescriptionEdit.Text <> '') and
    (SellPriceMemo.Text <> '') and
    (QtyEdit.text <> '') and
    (QtyOversMemo.Text <> '')) or
    (FFuncMode = soDelete);
end;

procedure TSTMaintSOrdLineFrm.setPart_Cost(const Value: real);
begin
  fPart_Cost := Value;
end;

procedure TSTMaintSOrdLineFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TSTMaintSOrdLineFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyto3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TSTMaintSOrdLineFrm.CheckKeyIsNumber(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TSTMaintSOrdLineFrm.ClearOrderLine;
begin
with OrderLine do
  begin
    ActnTkn := 'D';
    end;
end;
procedure TSTMaintSOrdLineFrm.PartEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if GetPartDetails then
        QtySinglesMemo.setfocus
      else
        PartEdit.setfocus;
    end;
end;

function TSTMaintSOrdLineFrm.GetPartDetails: boolean;
var
  rPurchDisc: real;
begin
  rPurchDisc := 0.00;
  DiscountType := '';
  DiscountValue := 0.00;

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
      bNumbered := (fieldbyname('Numbered').asstring = 'Y');
      partclass := fieldByName('Product_Class').AsString;
    end;

  if ReplenishSource = 1 then {Check that the part is supplied by the supplier}
  begin
  with stSalesOrdDm.GetPartSuppSQL do
    begin
      close;
      parambyname('Part').asstring := PartEdit.text;
      parambyname('Supplier').asinteger := Supplier;
      parambyname('Branch_no').asinteger := BranchNo;
      open;

      if recordcount = 0 then
        begin
          MessageDlg('Product is not supplied by the specified Supplier', mterror,[mbOk], 0);
          Result := false;
          exit;
        end;
      if fieldbyname('Discount').asfloat > 0 then
        rPurchDisc := fieldbyname('Discount').asfloat
      else
      if fieldbyname('Discount_this_Part').asstring = 'Y' then
        rPurchDisc := stSalesOrdDm.GetSuppDiscount(Supplier);
    end;
  end
  else
    begin
      {Get current stock levels}
      GetStockLevels;
    end;

  With StSalesOrdDM.GetPartDetsSQL do
    begin
      OriginalCost := fieldbyname('Part_Purchase_Price').asfloat;
      OriginalPrice := (fieldbyname('Part_Cost_Cat').asfloat);
    end;

  With STSalesOrdDM.getPartDiscSQL do
    begin
      Close;
      ParamByName('Part').AsString := PartEdit.text ;
      ParamBYName('Customer').AsInteger := Salesorder.Customer;
      ParamBYName('Orderdate').Asdatetime := Salesorder.DatePoint;
      Open;
      First;
      if recordcount > 0 then
        begin
          DiscountValue := fieldByName('Discount_Value').AsFloat;
          DiscountType := fieldByName('Discount_Type').Asstring;
        end
      else
        begin
          with STSalesOrdDM.getGroupDiscSQL do
            begin
              close;
              ParamByName('Customer').asInteger := SalesOrder.Customer;
              ParamByName('Part_Group').AsInteger := STSalesOrdDM.GetPartDetsSQL.fieldByName('Part_Group').AsInteger;
              ParamByName('Orderdate').Asdatetime := Salesorder.DatePoint;
              Open;
              first;
              if recordcount > 0 then
                begin
                DiscountValue := FieldByName('Discount_Value').AsFloat;
                DiscountType := fieldByName('Discount_Type').AsString;
                end;
            end;
        end;
        Price := GetDiscountedPrice
    end;
  DescriptionEdit.text := StSalesOrdDM.GetPartDetsSQL.fieldbyname('Part_Description').asstring;
  SellPriceMemo.text := formatfloat('0.00',StSalesOrdDM.GetPartDetsSQL.fieldbyname('Part_Cost_Cat').asfloat);
  CostPackSize := StSalesOrdDM.GetPartDetsSQL.fieldbyname('Purch_Pack_quantity').asinteger;
  SellPackSize := StSalesOrdDM.GetPartDetsSQL.fieldByName('Sell_Pack_quantity').AsInteger;
  PackSizeMemo.text := StSalesOrdDM.GetPartDetsSQL.fieldbyname('Sell_Pack_quantity').asstring;
  PurchPackMemo.text := inttostr(CostPackSize);
  PurchPriceMemo.text := formatfloat('0.00',OriginalCost);
  VatRateCode := StSalesOrdDM.GetPartDetsSQL.fieldbyname('Vat_Code').asinteger;
  SellPriceMemo.text := formatfloat('0.00',OriginalPrice);
  dbLkpDiscountType.keyvalue := DiscountType;
  DiscountMemo.text := formatmoney(DiscountValue);
  DiscPriceMemo.text := formatmoneyto3DP(price);

  {Show Purchase Discounts}
  PurchDiscMemo.text := formatmoney(rPurchDisc);
  CostPrice := ((OriginalCost ) - ((OriginalCost * rPurchDisc)/100. ));
  DiscCostMemo.Text :=  formatmoneyto3dp(CostPrice);
  CheckOK(self);
  result := true
end;

procedure TSTMaintSOrdLineFrm.PartEditChange(Sender: TObject);
begin
  DescriptionEdit.clear;
  PackSizeMemo.clear;
  SellPriceMemo.clear;
  checkOK(self);
end;

procedure TSTMaintSOrdLineFrm.SetSalesOrder(const Value: TSalesOrder);
begin
  FSalesOrder := Value;
end;

procedure TSTMaintSOrdLineFrm.SetBranchNo(const Value: integer);
begin
  FBranchNo := Value;
end;

procedure TSTMaintSOrdLineFrm.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TSTMaintSOrdLineFrm.SetReplenishSource(const Value: integer);
begin
  FReplenishSource := Value;
end;

procedure TSTMaintSOrdLineFrm.SetPartStore(const Value: integer);
begin
  FPartStore := Value;
end;

procedure TSTMaintSOrdLineFrm.SetCostPackSize(const Value: integer);
begin
  FCostPackSize := Value;
end;

procedure TSTMaintSOrdLineFrm.SetCostPrice(const Value: real);
begin
  FCostPrice := Value;
end;

procedure TSTMaintSOrdLineFrm.SetVatRateCode(const Value: integer);
begin
  FVatRateCode := Value;
end;

procedure TSTMaintSOrdLineFrm.SetSellPackSize(const Value: integer);
begin
  FSellPackSize := Value;
end;

procedure TSTMaintSOrdLineFrm.QtyEditKeyPress(Sender: TObject;
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

procedure TSTMaintSOrdLineFrm.SetDiscountType(const Value: string);
begin
  FDiscountType := Value;
end;

procedure TSTMaintSOrdLineFrm.SetDiscountValue(const Value: real);
begin
  FDiscountValue := Value;
end;

procedure TSTMaintSOrdLineFrm.dbLkpDiscountTypeClick(Sender: TObject);
begin
  DiscountType := dbLkpDiscountType.KeyValue;
  Price := GetDiscountedPrice;
  DiscPriceMemo.text := formatmoneyto3dp(price);
end;

function TSTMaintSOrdLineFrm.GetDiscountedPrice: real;
begin
  lblDiscount.caption := 'Discount %';
  Result := 0.00;
  if (DiscountType = '') then
    begin
    Result := Originalprice;
    DiscountMemo.text := '0.00';
    DiscountMemo.Enabled := false;
    exit;
    end
  else
  if (DiscountType = 'P') then
    begin
      lblDiscount.caption := 'Customer Price';
      Result := DiscountValue;
    end
  else
  If DiscountType = 'C' then
    Result := ((CostPrice) + ((CostPrice * DiscountValue )/100. ))
  else
  if DiscountType = 'S' then
    Result := ((Originalprice ) - ((Originalprice * DiscountValue)/100. ));
  DiscountMemo.enabled := true;
end;

procedure TSTMaintSOrdLineFrm.SetOriginalPrice(const Value: real);
begin
  FOriginalPrice := Value;
end;

procedure TSTMaintSOrdLineFrm.DiscountMemoChange(Sender: TObject);
begin
  if (trim((Sender as TMemo).text) = '') then
    DiscountValue := 0.00
  else
    DiscountValue := StrToFloatDef((Sender as TMemo).text, 0, FormatSettings);

  Price := GetDiscountedPrice;
  DiscPriceMemo.text := formatmoneyto3dp(price);
end;

procedure TSTMaintSOrdLineFrm.btnClearClick(Sender: TObject);
begin
  dbLkpDiscountType.keyvalue := '';
  dbLkpDiscountTypeClick(self);
end;

procedure TSTMaintSOrdLineFrm.SetOriginalCost(const Value: real);
begin
  FOriginalCost := Value;
end;

procedure TSTMaintSOrdLineFrm.QtyEditChange(Sender: TObject);
begin
  if FSingles then exit;
  DisplaySingles;
  CheckOK(self);
end;

procedure TSTMaintSOrdLineFrm.DisplaySingles;
var
  isingles: integer;
begin
  if (PackSizeMemo.text = '') or
     (trim(QtyEdit.text) = '') then
    QtySinglesMemo.text := ''
  else
    begin
      iSingles := InpToSing(trim(QtyEdit.text) , strtoint(PackSizeMemo.text));
      QtySinglesMemo.text := formatfloat('0',iSingles);
    end;
end;

procedure TSTMaintSOrdLineFrm.DisplayPacks;
begin
  if (PackSizeMemo.text = '') or
     (trim(QtySinglesMemo.text) = '') then
    Qtyedit.text := ''
  else
    begin
//      rpacks := strtoint(trim(QtySinglesMemo.text)) / strtoint(PackSizeMemo.text);
      Qtyedit.text := showinPacks(strtoint(trim(QtySinglesMemo.text)),strtoint(trim(PackSizeMemo.text)));
    end;
end;

procedure TSTMaintSOrdLineFrm.QtySinglesMemoChange(Sender: TObject);
begin
  if FPacks then exit;
  DisplayPacks;
  CheckOK(self);
end;

procedure TSTMaintSOrdLineFrm.QtyEditEnter(Sender: TObject);
begin
  FPacks:=true;
end;

procedure TSTMaintSOrdLineFrm.QtyEditExit(Sender: TObject);
begin
  FPacks := False;
end;

procedure TSTMaintSOrdLineFrm.QtySinglesMemoExit(Sender: TObject);
begin
  FSingles := False;
end;

procedure TSTMaintSOrdLineFrm.QtySinglesMemoEnter(Sender: TObject);
begin
  FSingles := True;
end;

procedure TSTMaintSOrdLineFrm.GetStockLevels;
begin
  with stSalesOrdDm.GetStockSQL do
    begin
      close;
      parambyname('Part').asstring := PartEdit.text;
      parambyname('Part_Store').asinteger := PartStore;
      open;
      first;

      FFreeStock := fieldbyname('Free_Stock').asinteger;
      FReorderLevel := fieldbyname('Reorder_Level').asinteger;

      meminWhouse.text := format('%9.0n',[fieldbyname('Total_Stock').asfloat]);
      memAllocated.text := format('%9.0n',[fieldbyname('Total_Allocated').asfloat]);
      memFree.text := format('%9.0n',[fieldbyname('Free_Stock').asfloat]);
      memPaid.text := format('%9.0n',[fieldbyname('Total_Paid').asfloat]);
      memunPaid.text := format('%9.0n',[fieldbyname('Free_Stock').asfloat-fieldbyname('Total_Paid').asfloat]);
      memMin.text := format('%9.0n',[fieldbyname('Minimum_Stock').asfloat]);
      memMax.text := format('%9.0n',[fieldbyname('Maximum_Stock').asfloat]);
      memReorder.text := format('%9.0n',[fieldbyname('Reorder_Level').asfloat]);

      memTotalStock.text := format('%9.0n',[fieldbyname('Total_in_Company').asfloat]);
    end;
end;

procedure TSTMaintSOrdLineFrm.PackSizeMemoChange(Sender: TObject);
begin
 if (QtySinglesMemo.Text = '') or (PackSizeMemo.Text = '') then exit;

 Qtyedit.text := showinPacks(strtoint(trim(QtySinglesMemo.text)),strtoint(trim(PackSizeMemo.text)));
  CheckOK(self);
end;

procedure TSTMaintSOrdLineFrm.setPartClass(const Value: string);
begin
  fPartClass := Value;
end;

procedure TSTMaintSOrdLineFrm.QtyOversMemoChange(Sender: TObject);
begin
  checkok(self);
end;

procedure TSTMaintSOrdLineFrm.chkbxSampleClick(Sender: TObject);
begin
  LineIsSample := chkbxSample.checked;
end;

procedure TSTMaintSOrdLineFrm.SetLineIsSample(const Value: boolean);
begin
  FLineIsSample := Value;
end;

end.
