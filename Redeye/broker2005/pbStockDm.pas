unit pbStockDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdtmdlStock = class(TDataModule)
    qryCustStock: TQuery;
    dtsStock: TDataSource;
    qryPartMvmnts: TQuery;
    qryPartMvmntsDate_received: TDateTimeField;
    qryPartMvmntsPart_Store_Name: TStringField;
    qryPartMvmntsPart_Movement_Bin: TStringField;
    qryPartMvmntsPart_Store_Lot: TStringField;
    qryPartMvmntsPart_Move_Type_Descr: TStringField;
    qryPartMvmntsPart_Movement_Reference: TStringField;
    qryPartMvmntsStock_Pack_Quantity: TIntegerField;
    qryPartMvmntsStore_Quantity: TIntegerField;
    qryPartMvmntsStore_cost: TCurrencyField;
    dtsrcPartMvmnts: TDataSource;
    qryPartStoreBins: TQuery;
    dtsrcPartStoreBins: TDataSource;
    qryStoreStockNumberedItems: TQuery;
    dtsrcStoreStockNumberedItems: TDataSource;
    qryPartSales: TQuery;
    qryPartSalespart: TStringField;
    qryPartSalespart_description: TStringField;
    qryPartSalessales_order: TIntegerField;
    qryPartSalesCustomer: TStringField;
    qryPartSalesdate_ordered: TDateTimeField;
    qryPartSalesquantity_ordered: TIntegerField;
    qryPartSalessell_pack_quantity: TIntegerField;
    qryPartSalesPart_Sales_Price: TCurrencyField;
    qryPartSalesPart_Cost: TCurrencyField;
    qryPartSalesSellValue: TFloatField;
    qryPartSalesCost: TFloatField;
    qryPartSalesQuantity: TFloatField;
    dtsrcPartSales: TDataSource;
    qryPartProduction: TQuery;
    qryPartProductionForm_Reference: TIntegerField;
    qryPartProductionPart: TStringField;
    qryPartProductionDescription: TStringField;
    qryPartProductionPurchase_Order: TFloatField;
    qryPartProductionSupplier: TStringField;
    qryPartProductionOrder_Date: TDateTimeField;
    qryPartProductionOrder_Status: TStringField;
    qryPartProductionQuantity_Ordered: TFloatField;
    qryPartProductionDelivered_to_Stock: TFloatField;
    qryPartProductionDelivered: TFloatField;
    qryPartProductionAwaiting_Delivery: TFloatField;
    qryPartProductionPack_Size: TStringField;
    qryPartProductionSelling_Price: TCurrencyField;
    qryPartProductionOrder_price: TCurrencyField;
    qryPartProductionsell_unit_factor: TFloatField;
    qryPartProductionord_unit_factor: TFloatField;
    qryPartProductionQuantity: TFloatField;
    qryPartProductiontot_sell_price: TCurrencyField;
    qryPartProductiontot_ord_price: TFloatField;
    qryPartPOs: TQuery;
    qryPartPOspart: TStringField;
    qryPartPOsDescription: TStringField;
    qryPartPOsPurchaseOrder: TIntegerField;
    qryPartPOsSupplier: TStringField;
    qryPartPOsOrderDate: TDateTimeField;
    qryPartPOsOrderStatus: TStringField;
    qryPartPOsQuantityOrdered: TIntegerField;
    qryPartPOsPackSize: TIntegerField;
    qryPartPOsCost: TCurrencyField;
    dtsrcPartProduction: TDataSource;
    dtsrcPartPOs: TDataSource;
    qryCustStockPart: TStringField;
    qryCustStockCustomer: TIntegerField;
    qryCustStockdescription: TStringField;
    qryCustStockstore_qty: TIntegerField;
    qryCustStockqty_alloc: TIntegerField;
    qryCustStockqty_free: TIntegerField;
    qryCustStockpurch_ord_qty: TIntegerField;
    qryCustStockprod_ord_qty: TFloatField;
    qryCustStockpaid_for: TIntegerField;
    qryCustStocknot_paid_for: TIntegerField;
    qryStckDetsbyFormRef: TQuery;
    qryCustStockform_reference_id: TStringField;
    qryPartNumbers: TQuery;
    dtsrcPartNumbers: TDataSource;
    qryCustStockform_reference: TIntegerField;
    qryStock: TQuery;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    FloatField1: TFloatField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    StringField3: TStringField;
    IntegerField8: TIntegerField;
    qryPartDeliveries: TQuery;
    dtsPartDeliveries: TDataSource;
    qryShowPartDeliveries: TQuery;
    qryStockLocations: TQuery;
    dtsStockLocations: TDataSource;
    qryPartStore: TQuery;
    dtsPartStore: TDataSource;
    qryMoves: TQuery;
    qryPartMvmntsPart_Store_Total_Quantity: TFloatField;
    qryPartMvmntsAudit_User: TStringField;
    qryPartSalesJob_Bag: TIntegerField;
    qryPartSalesJob_Bag_Req: TIntegerField;
    qryPartSalesJob_Bag_No: TIntegerField;
    qryShowCustDeliveries: TQuery;
    dtsCustDeliveries: TDataSource;
    qryCustStockCustomer_Name: TStringField;
    qryCustDeliveries: TQuery;
    qryPartSalesSales_Order_Status: TStringField;
    qryGetUsedForJob: TQuery;
    qryPartSalesQuantity_Delivered: TIntegerField;
    qryPartSalesQuantity_Invoiced: TIntegerField;
    qryPartMvmntsAudit_Workstation: TStringField;
    qryStockUsage: TQuery;
    dtsStockUsage: TDataSource;
    qryProductionLocation: TQuery;
    dtsProductionLocation: TDataSource;
    qryGetProductionLocation: TQuery;
    qryGetStoreStock: TQuery;
    qryGetPartAllocation: TQuery;
    qryGetJobNumber: TQuery;
    qryStockCustomer_Name: TStringField;
    qryStockNot_in_Use: TStringField;
    qryStockProduct_Class: TStringField;
    qryStockMinimum_Stock: TIntegerField;
    qryStockMaximum_Stock: TIntegerField;
    qryStockReorder_Level: TIntegerField;
    qryStockForward_qty: TIntegerField;
    qryCustStockMinimum_Stock: TIntegerField;
    qryCustStockMaximum_Stock: TIntegerField;
    qryCustStockReorder_Level: TIntegerField;
    qryCustStockForward_Qty: TIntegerField;
    qryPallets: TQuery;
    qryDummyPallets: TQuery;
    dtsPallets: TDataSource;
    qryCustStockNot_In_Use: TStringField;
    qryGetPart: TQuery;
    qryGetCustName: TQuery;
    qryUpdMulti: TQuery;
    qryUpdMultiPartInactive: TQuery;
    qryStockSO_Unallocated: TIntegerField;
    qryCustStockSO_unallocated: TIntegerField;
    qryCustStockFuture_Stock: TIntegerField;
    qryCustStockProduct_Class_Description: TStringField;
    qryStockProduct_Class_Description: TStringField;
    qryCustStockProduct_Class: TStringField;
    procedure qryCustStockstore_qtyGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPartSalesquantity_orderedGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPartPOsQuantityOrderedGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPartMvmntsStore_QuantityGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPartSalesSellValueGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPartSalesCostGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryPartSalesQuantityGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryPartProductiontot_ord_priceGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPartProductiontot_sell_priceGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPartProductionQuantityGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPartSalesJob_Bag_NoGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryCustStockFuture_StockGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    function GetHeaderCount: integer;
    function GetProductDeliveryCount: integer;
    function GetBinCount: integer;
    function GetOrderDeliveryCount: integer;
    function GetPartCount: integer;
    function GetPalletCount: integer;
    { Private declarations }
  public
    Warehouse: integer;
    BinLocation: string;
    ProductCode: string;
    ShowPositiveStock: boolean;
    ShowOnlyStock: boolean;
    ShowUnassigned: boolean;
    Customer: integer;
    Description: string;
    NotInUse: string;
    function CanDeleteProduct(tempPart: string): boolean;
    function OversCanExist(tempPart: string): boolean;
    function GetCustomerDeliveries(tempCust: integer): integer;
    function GetPartDeliveries(tempPart: string): integer;
    procedure RefreshData;
    procedure RefreshPallets;
    procedure RefreshCustDeliveries(tempCust: integer);
    procedure RefreshPartDeliveries(tempPart: string);
    procedure RefreshStockLocations;
    procedure RefreshStockUsage;
    property HeaderCount: integer read GetHeaderCount;
    property PalletCount: integer read GetPalletCount;
    property BinCount: integer read GetBinCount;
    property PartCount: integer read GetPartCount;
    property ProductDeliveryCount: integer read GetProductDeliveryCount;
    property OrderDeliveryCount: integer read GetOrderDeliveryCount;
  end;

var
  dtmdlStock: TdtmdlStock;

implementation

uses CCSCommon;

{$R *.DFM}

{ TdtmdlStock }

function TdtmdlStock.GetHeaderCount: integer;
begin
  Result := qryCustStock.RecordCount;
end;

procedure TdtmdlStock.RefreshData;
var
  sTemp: string;
  suffix, maintext: string;
  iStart, iSublength: integer;
begin
  qryCustStock.close;
  qryCustStock.SQL.Clear;

  {Add the Purchase Order query details}
  sTemp := '';
  qryCustStock.SQL.text := qryStock.SQL.text;

  if ShowOnlyStock then
    sTemp := sTemp + ' AND ((Product_Class = ''STK'') or (Product_Class is NULL) or (Product_Class = ''POD'')) ';

  if ShowPositiveStock then
    sTemp := sTemp + ' AND SUM(Store_Quantity) > 0 ';

  sTemp := sTemp + ' ORDER BY Part.Part';

  qryCustStock.SQL.text := qryCustStock.SQL.text + sTemp;

  iStart := pos('>',Description);
  iSublength := length(Description) - (iStart);

  suffix := '';
  maintext := description;

  if iStart > 0 then
    begin
      suffix := copy(description,iStart+1,iSublength);
      maintext := copy(description,1,(iStart-1));
    end;

  with qryCustStock do
  begin
    Close;
    parambyname('Customer').asinteger := Customer;
    parambyname('Description').asstring := '%' + maintext + '%' + trim(suffix);
    parambyname('Not_in_Use').asstring := NotInUse;
    Open;
  end;
end;

procedure TdtmdlStock.qryCustStockstore_qtyGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.IsNull then
    Text := '0'
  else
    text := sender.asstring;
end;

procedure TdtmdlStock.qryPartSalesquantity_orderedGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.IsNull then
    Text := '0'
  else
    text := sender.asstring;
end;

procedure TdtmdlStock.qryPartPOsQuantityOrderedGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.IsNull then
    Text := '0'
  else
    text := sender.asstring;
end;

procedure TdtmdlStock.qryPartMvmntsStore_QuantityGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.IsNull then
    Text := '0'
  else
    text := sender.asstring;
end;

procedure TdtmdlStock.qryPartSalesSellValueGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPartSales.FieldByName('sell_pack_quantity').AsFloat <> 0 then
    Text := '£'+FloatToStr(( (qryPartSales.FieldByName('Quantity_Ordered').asFloat) /
                             (qryPartSales.FieldByName('sell_pack_quantity').AsFloat)) *
                            qryPartSalesPart_Sales_Price.AsFloat)
  else
    Text := '';
end;

procedure TdtmdlStock.qryPartSalesCostGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPartSales.FieldByName('sell_pack_quantity').AsFloat <> 0 then
    Text := '£'+FloatToStr(((qryPartSales.FieldByName('Quantity_Ordered').asFloat) / (qryPartSales.FieldByName('sell_pack_quantity').AsFloat)) * qryPartSalesPart_Cost.AsFloat)
  else
    Text := '';
end;

procedure TdtmdlStock.qryPartSalesQuantityGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPartSalesPart.value <> '' then
    Text := ShowInPacks(qryPartSales.FieldByName('Quantity_Ordered').AsInteger, qryPartSales.FieldByName('sell_pack_quantity').AsInteger);
end;

procedure TdtmdlStock.qryPartProductiontot_ord_priceGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  tempFlt: double;
begin
  if qryPartProductionord_unit_factor.AsFloat = 0.0 then
  begin
    Text := FloatToStrF((qryPartProductionOrder_price.AsFloat/1.00), ffCurrency, 15, 2);
  end
  else
  begin
    tempFlt := (qryPartProductionOrder_price.AsFloat *
             (qryPartProductionQuantity_Ordered.AsFloat/qryPartProductionord_unit_factor.AsFloat));
    Text := FloatToStrF(tempFlt, ffCurrency, 15, 2);
  end;
end;

procedure TdtmdlStock.qryPartProductiontot_sell_priceGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
var
  tempFlt: double;
begin
  if qryPartProductionsell_unit_factor.AsFloat = 0.0 then
  begin
    Text := FloatToStrF((qryPartProductionSelling_Price.AsFloat/1.00), ffCurrency, 15, 2);
  end
  else
  begin
    tempFlt := (qryPartProductionSelling_Price.AsFloat *
             (qryPartProductionQuantity_Ordered.AsFloat/qryPartProductionsell_unit_factor.AsFloat));
    Text := FloatToStrF(tempFlt, ffCurrency, 15, 2);
  end;
end;

procedure TdtmdlStock.qryPartProductionQuantityGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  try
    Text := ShowInPacks(qryPartProduction.FieldByName('Quantity_Ordered').AsInteger, qryPartProduction.FieldByName('Pack Size').AsInteger);
  except
    Text := 'Box quantity not specified.';
  end;
end;

function TdtmdlStock.GetPartDeliveries(tempPart: string): integer;
begin
  with qryPartDeliveries do
    begin
      close;
      parambyname('Stock_Reference').asstring := tempPart;
      open;
      result := recordcount;
    end;
end;

function TdtmdlStock.GetCustomerDeliveries(tempCust: integer): integer;
begin
  if tempCust = 0 then
    begin
      result := 0;
      exit;
    end;

  with qryCustDeliveries do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := recordcount;
    end;
end;

procedure TdtmdlStock.RefreshPartDeliveries(tempPart: string);
begin
  with qryShowPartDeliveries do
    begin
      close;
      parambyname('Stock_Reference').asstring := tempPart;
      open;
    end;
end;

procedure TdtmdlStock.RefreshCustDeliveries(tempCust: integer);
begin
  with qryShowCustDeliveries do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      parambyname('Description').asstring := '%' + description + '%';
      open;
    end;
end;

function TdtmdlStock.GetProductDeliveryCount: integer;
begin
  Result := qryShowPartDeliveries.RecordCount;
end;

function TdtmdlStock.GetOrderDeliveryCount: integer;
begin
  Result := qryShowCustDeliveries.RecordCount;
end;

procedure TdtmdlStock.RefreshStockLocations;
begin
  with qryStockLocations do
    begin
      close;
      parambyname('Part_Store').AsInteger := Warehouse;
      paramByName('Part_Bin').asstring := BinLocation;
      open;
    end;
end;

procedure TdtmdlStock.RefreshStockUsage;
begin
  with qryStockUsage do
    begin
      close;
      parambyname('Part_Store').AsInteger := Warehouse;
      parambyname('Part_Bin').AsString := BinLocation;
      paramByName('Part').asstring := ProductCode;
      open;
    end;
end;

function TdtmdlStock.CanDeleteProduct(tempPart: string): boolean;
begin
  result := true;
  with qryMoves do
    begin
      close;
      parambyname('Part').asstring := tempPart;
      open;

      result := not (recordcount > 0);
    end;
end;

function TdtmdlStock.GetBinCount: integer;
begin
  Result := qryStockLocations.RecordCount;
end;

procedure TdtmdlStock.qryPartSalesJob_Bag_NoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPartSales.FieldByName('Job_Bag_Req').AsInteger <> 0 then
    text := qryPartSales.FieldByName('Job_Bag_Req').AsString
  else
    text := qryPartSales.FieldByName('Job_Bag').AsString;
end;

function TdtmdlStock.OversCanExist(tempPart: string): boolean;
begin
  with qryGetUsedForJob do
    begin
      close;
      parambyname('Part').asstring := tempPart;
      open;
      result := (recordcount > 0);
    end;
end;

function TdtmdlStock.GetPartCount: integer;
begin
  Result := qryStockUsage.RecordCount;
end;

procedure TdtmdlStock.RefreshPallets;
var
  sTemp: string;
  suffix, maintext: string;
  iStart, iSublength: integer;
begin
  qryPallets.close;
  qryPallets.SQL.Clear;

  sTemp := '';
  qryPallets.SQL.text := qryDummyPallets.SQL.text;

  if ShowUnassigned then
    sTemp := sTemp + ' AND Store_Stock.Part = ''FMM/UNASSIGNED'' ';

  sTemp := sTemp + 'ORDER BY Store_Stock.Pallet_id DESC';

  qryPallets.SQL.text := qryPallets.SQL.text + sTemp;

  maintext := description;

  with qryPallets do
  begin
    Close;
    parambyname('Description').asstring := '%' + maintext + '%';
    Open;
  end;
end;

function TdtmdlStock.GetPalletCount: integer;
begin
  result := qryPallets.recordcount;
end;

procedure TdtmdlStock.qryCustStockFuture_StockGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := inttostr(qryCustStock.fieldbyname('Qty_Free').asinteger - qryCustStock.fieldbyname('SO_Unallocated').asinteger);
end;

end.
