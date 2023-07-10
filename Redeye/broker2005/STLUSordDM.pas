unit STLUSordDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDmLookupSOrd = class(TDataModule)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
    NullSRC: TDataSource;
    SelectedSQL: TQuery;
    oldDummySQL: TQuery;
    GetContactSQL: TQuery;
    GetDespDetsSQL: TQuery;
    qryNewSOs: TQuery;
    GetPickRefSQL: TQuery;
    qryperiodEnd: TQuery;
    qrySalesHistory: TQuery;
    qrySalesHistorySales_Order: TIntegerField;
    qrySalesHistorySales_Order_line_no: TIntegerField;
    qrySalesHistoryPart: TStringField;
    qrySalesHistoryPart_Cost: TCurrencyField;
    qrySalesHistoryPurch_Pack_Quantity: TIntegerField;
    qrySalesHistoryPart_Sales_Price: TCurrencyField;
    qrySalesHistorySell_Pack_Quantity: TIntegerField;
    qrySalesHistoryQuantity_Ordered: TIntegerField;
    qrySalesHistoryQuantity_Allocated: TIntegerField;
    qrySalesHistoryQuantity_Delivered: TIntegerField;
    qrySalesHistoryContract: TIntegerField;
    qrySalesHistoryContract_Line_no: TIntegerField;
    qrySalesHistorySales_order_Line_Status: TIntegerField;
    qrySalesHistoryQuantity_Invoiced: TIntegerField;
    qrySalesHistoryLine_Complete: TStringField;
    qrySalesHistoryvat_code: TIntegerField;
    qrySalesHistoryDiscount_Type: TStringField;
    qrySalesHistoryDiscount_value: TCurrencyField;
    qrySalesHistoryReplacement_For_Line: TIntegerField;
    qrySalesHistoryOriginal_Sell_Price: TCurrencyField;
    qrySalesHistorydescription: TStringField;
    qrySalesHistorydate_ordered: TDateTimeField;
    qrySalesHistorypart_description: TStringField;
    qryProductSalesbyCust: TQuery;
    qryProductSalesbyCustsales_order: TIntegerField;
    qryProductSalesbyCustpart: TStringField;
    qryProductSalesbyCustpart_sales_price: TCurrencyField;
    qryProductSalesbyCustsell_pack_quantity: TIntegerField;
    qryProductSalesbyCustcust_order_no: TStringField;
    qryProductSalesbyCustpart_description: TStringField;
    qryProductSalesbyCustSalesValue: TFloatField;
    qryProductSalesbyCustProduct: TStringField;
    qryProductSalesbyCustquantity_delivered: TIntegerField;
    qryProductSalesbyCustquantity_ordered: TIntegerField;
    qryProductSalesbyCustdate_required: TDateTimeField;
    qryProductSalesbyCustdate_ordered: TDateTimeField;
    qryInvoice: TQuery;
    GetDetsSQLDescription: TStringField;
    GetDetsSQLCust_Name: TStringField;
    GetDetsSQLBranch_Name: TStringField;
    GetDetsSQLDate_Required: TDateTimeField;
    GetDetsSQLSales_Order: TIntegerField;
    GetDetsSQLDate_Ordered: TDateTimeField;
    GetDetsSQLCust_Order_No: TStringField;
    GetDetsSQLPart_Store: TIntegerField;
    GetDetsSQLSales_Order_Head_Status: TIntegerField;
    GetDetsSQLReplenish_Source: TIntegerField;
    GetDetsSQLSupplier: TIntegerField;
    GetDetsSQLPurch_Ord_no: TStringField;
    GetDetsSQLStatus_Description: TStringField;
    qryProductSalesbyCustDelivery_Date: TDateTimeField;
    OldqryProductSalesbyCust: TQuery;
    qryAdhoc: TQuery;
    qryCust: TQuery;
    qryProductSalesbyCustdelivery_customer: TIntegerField;
    qryProductSalesbyCustdelivery_branch: TIntegerField;
    qryProductSalesbyCustad_hoc_address: TIntegerField;
    qrySalesSerialNos: TQuery;
    qryProductSalesbyCustsales_order_line_no: TIntegerField;
    dtsDetails: TDataSource;
    qryProductSalesbyCustDeliveryLocation: TStringField;
    qryProductSalesbyCustDeliveryCustName: TStringField;
    qryProductSalesbyCustDeliveryBranchName: TStringField;
    qryProductSalesbyCustOrderedBy: TStringField;
    GetDetsSQLAd_Hoc_Address: TIntegerField;
    GetDetsSQLDelivery_Customer: TIntegerField;
    GetDetsSQLDel_name: TStringField;
    GetDetsSQLDel_To_Add: TStringField;
    DummySQL: TQuery;
    dummySalesbyCust: TQuery;
    qryProdSalesbyCust: TQuery;
    qryProdSalesbyCustsales_order: TIntegerField;
    qryProdSalesbyCustpart: TStringField;
    qryProdSalesbyCustpart_sales_price: TCurrencyField;
    qryProdSalesbyCustsell_pack_quantity: TIntegerField;
    qryProdSalesbyCustcust_order_no: TStringField;
    qryProdSalesbyCustpart_description: TStringField;
    qryProdSalesbyCustSalesValue: TFloatField;
    qryProdSalesbyCustProduct: TStringField;
    qryProdSalesbyCustquantity_delivered: TIntegerField;
    qryProdSalesbyCustquantity_ordered: TIntegerField;
    qryProdSalesbyCustdate_required: TDateTimeField;
    qryProdSalesbyCustdate_ordered: TDateTimeField;
    qryProdSalesbyCustDelivery_Date: TDateTimeField;
    qryProdSalesbyCustdelivery_customer: TIntegerField;
    qryProdSalesbyCustdelivery_branch: TIntegerField;
    qryProdSalesbyCustad_hoc_address: TIntegerField;
    qryProdSalesbyCustsales_order_line_no: TIntegerField;
    qryProdSalesbyCustDeliveryLocation: TStringField;
    qryProdSalesbyCustDeliveryCustName: TStringField;
    qryProdSalesbyCustDeliveryBranchName: TStringField;
    qryProdSalesbyCustOrderedBy: TStringField;
    qryProdSalesbyCustrep: TIntegerField;
    qryProdSalesbyCustrepName: TStringField;
    qryProdSalesbyCustcustomer: TIntegerField;
    qrySalesHistoryDeliveryBranchName: TStringField;
    qrySalesHistoryAd_Hoc_Address: TIntegerField;
    qrySalesHistorycust_order_no: TStringField;
    qrySalesHistorySales_Value: TFloatField;
    qrySalesHistoryDelivery_Location: TStringField;
    qryProdSalesbyCustCost_Centre: TStringField;
    qryProdSalesbyCustCustomer_Name: TStringField;
    qryProdSalesbyCustBranch_name: TStringField;
    qryProdSalesbyCustShort_Code: TStringField;
    qryGetCustomerDetails: TQuery;
    qryProdSalesbyCustPart_Cost: TFloatField;
    qryProdSalesbyCustPurch_Pack_Quantity: TIntegerField;
    qryProdSalesbyCustVat_Rate: TFloatField;
    qryProdSalesbyCustPart_Cost_Cat: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryProductSalesbyCustCalcFields(DataSet: TDataSet);
    procedure GetDetsSQLDescriptionGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure GetDetsSQLDel_To_AddGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryProdSalesbyCustCalcFields(DataSet: TDataSet);
    procedure qrySalesHistoryCalcFields(DataSet: TDataSet);
  private
    fShowCustBranch: Boolean;
    fShowCustName: Boolean;
    fSeqByCustBranch: Boolean;
    FJustMine: Boolean;
    fSeqBuCustOrdNo: Boolean;
    fShowCustOrdNo: Boolean;
    fSeqByCustName: Boolean;
    fCustomerBranch: Integer;
    fCustomerNo: Integer;
    fCustOrdNo: String;
    fCustName: String;
    fCustBranch: String;
    FSONumber: string;
    fSOStatus: integer;
    fDateReq: TDateTime;
    fByException: Boolean;
    fTransType: integer;
    fInt_selcode: integer;
    fSeqByDelTo: Boolean;
    fShowDelTo: Boolean;
    fDelTo: string;
    procedure AddWithAnd(const Value : string);
    function GetRecordCount: Integer;
    procedure setCustBranch(const Value: String);
    procedure setCustName(const Value: String);
    procedure setCustomerBranch(const Value: Integer);
    procedure setCustomerNo(const Value: Integer);
    procedure setCustOrdNo(const Value: String);
    procedure SetJustMine(const Value: Boolean);
    procedure SetSeqByCustBranch(const Value: Boolean);
    procedure setSeqByCustName(const Value: Boolean);
    procedure setSeqByCustOrdNo(const Value: Boolean);
    procedure setShowCustBranch(const Value: Boolean);
    procedure setShowCustName(const Value: Boolean);
    procedure setShowCustOrdNo(const Value: Boolean);
    procedure SetSONumber(const Value: string);
    procedure SetSOStatus(const Value: integer);
    procedure SetDateReq(const Value: TDateTime);
    procedure setByException(const Value: Boolean);
    procedure SetInt_selCode(const Value: integer);
    procedure SetTransType(const Value: integer);
    procedure setseqByDelTo(const Value: Boolean);
    procedure setShowDelTo(const Value: Boolean);
    procedure setDelTo(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    function GetPickingRef(TempSO: integer): string;
    function PeriodEndRun(TempCode: integer): boolean;
    procedure RefreshData;
    property JustMine: Boolean read FJustMine write SetJustMine;
    property SeqByCustBranch: Boolean read fSeqByCustBranch write SetSeqByCustBranch;
    property SeqByCustName: Boolean read fSeqByCustName write setSeqByCustName;
    property SeqByCustOrdNo: Boolean read fSeqBuCustOrdNo write setSeqByCustOrdNo;
    property SeqByDelTo: Boolean read fSeqByDelTo write setseqByDelTo;
    property ShowCustOrdNo: Boolean read fShowCustOrdNo write setShowCustOrdNo;
    property ShowCustName: Boolean read fShowCustName write setShowCustName;
    property ShowCustBranch: Boolean read fShowCustBranch write setShowCustBranch;
    property ShowDelTo: Boolean read fShowDelTo Write setShowDelTo;
    property CustName: String read fCustName write setCustName;
    property CustBranch: String read fCustBranch write setCustBranch;
    property CustOrdNo: String read fCustOrdNo write setCustOrdNo;
    property CustomerNo: Integer read fCustomerNo write setCustomerNo;
    property DelTo: string read fDelTo write setDelTo;
    property CustomerBranch: Integer read fCustomerBranch write setCustomerBranch;
    property RecordCount: Integer read GetRecordCount;
    property SONumber: string read FSONumber write SetSONumber;
    property SOStatus: integer read fSOStatus write SetSOStatus;
    property DateReq: TDateTime read fDateReq write SetDateReq;
    property iTransType: integer read fTransType write SetTransType;
    property int_selcode: integer read fInt_selcode write SetInt_selCode;
    property ByException: Boolean read fByException write setByException;

    end;

var
  DmLookupSOrd: TDmLookupSOrd;

implementation

uses pbMainMenu;

{$R *.DFM}

{ TDmLookupSOrd }

procedure TDmLookupSOrd.AddWithAnd(const Value: string);
begin
 GetDetsSQL.SQL.Add(' AND ' + Value);
end;

function TDmLookupSOrd.GetRecordCount: Integer;
begin
  Result := DetsSRC.Dataset.RecordCount;
end;

procedure TDmLookupSOrd.RefreshData;
var
  i: integer;
  function qDate(const aDate : TDateTime) : string;
  begin
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
  end;
begin
  GetDetsSQL.Close;
  with GetDetsSQL.SQL do
  begin
    Clear;
    {Start with the basic code from the DummySQL Query component}
    for i := 0 to DummySQl.SQl.count - 1 do
    begin
      Add(DummySQL.SQL[i]);
    end;
    {Add the Sales Order selection}
    if SONumber <> '' then
      Add(' Sales_Order.Sales_Order <= '+trim(SONumber))
    else
      Add(' Sales_Order.Sales_Order >= 0');

    Add(' AND (1 = 1) ');

 {   if DelTo <> '' then
      GetDetsSql.parambyName('Del_To').AsString := '%'+DelTo+'%'
    else
      GetDetsSql.ParamByName('Del_To').AsString := '';  }
    if CustName <> '' then
      AddWithAND('(Customer.Name Like ''%' + CustName + '%'')');

      AddWithAND('(Sales_Order.Sales_Order_Head_Status = Sales_Order_Head_Status.Sales_Order_Head_Status)');

    if DelTo <> '' then
      AddWithAND('(cust2.name Like ''%' + DelTo + '%'')');


    if SOStatus <> 0 then
      AddWithAND('(Sales_Order.Sales_Order_Head_Status = '+ intToStr(SOStatus) + ')');

    if CustBranch <> '' then
      AddWithAND('(Customer_Branch.Name Like ''%' + CustBranch
        + '%'')');
    if CustOrdNo <> '' then
      AddWithAND('(Sales_order.Cust_Order_No Like ''%' + CustOrdNo
        + '%'')');
    if JustMine then
      AddWithAND('(Sales_Order.Operator = ' +
        IntToStr(frmpbMainMenu.iOperator) + ')');
    if DateReq <> 0 then
      AddWithAND('(Sales_Order.Date_Required < = '+ qdate(DateReq) +')');
   if iTranstype = 3 then
      AddWithAnd('Sales_Order.Replenish_Source = 2');
    {Build the SQL ORDER BY clause}
    Add(' ORDER BY ');
    if SeqByCustName then
      Add('Customer.Name, Sales_Order.Sales_Order')
    else
    if SeqByDelTo then
      Add('Del_Name, Sales_Order.Sales_Order')
    else
    if SeqByCustBranch then
      Add('Customer_Branch.Name, Sales_Order.Sales_Order')
    else
    if SeqByCustOrdNo then
      Add('Sales_Order.Cust_Order_no, Sales_Order.Sales_Order')
    else  { Default is by sONumber }
      Add('Sales_Order.Sales_Order Desc');
  end;
  GetDetsSQL.Open;
end;

function TDmLookupSOrd.GetPickingRef(TempSO: integer): string;
begin
  with GetPickRefSQL do
    begin
      close;
      parambyname('Sales_Order').asinteger := TempSO;
      open;
      result := fieldbyname('Picking_List_Ref').asstring;
    end;
end;

procedure TDmLookupSOrd.setCustBranch(const Value: String);
begin
  fCustBranch := Value;
end;

procedure TDmLookupSOrd.setCustName(const Value: String);
begin
  fCustName := Value;
end;

procedure TDmLookupSOrd.setCustomerBranch(const Value: Integer);
begin
  fCustomerBranch := Value;
end;

procedure TDmLookupSOrd.setCustomerNo(const Value: Integer);
begin
  fCustomerNo := Value;
end;

procedure TDmLookupSOrd.setCustOrdNo(const Value: String);
begin
  fCustOrdNo := Value;
end;

procedure TDmLookupSOrd.SetJustMine(const Value: Boolean);
begin
  FJustMine := Value;
end;

procedure TDmLookupSOrd.SetSeqByCustBranch(const Value: Boolean);
begin
  fSeqByCustBranch := Value;
end;

procedure TDmLookupSOrd.setSeqByCustName(const Value: Boolean);
begin
  fSeqByCustName := Value;
end;

procedure TDmLookupSOrd.setSeqByCustOrdNo(const Value: Boolean);
begin
  fSeqBuCustOrdNo := Value;
end;

procedure TDmLookupSOrd.setShowCustBranch(const Value: Boolean);
begin
  fShowCustBranch := Value;
end;

procedure TDmLookupSOrd.setShowCustName(const Value: Boolean);
begin
  fShowCustName := Value;
end;

procedure TDmLookupSOrd.setShowCustOrdNo(const Value: Boolean);
begin
  fShowCustOrdNo := Value;
end;

procedure TDmLookupSOrd.DataModuleCreate(Sender: TObject);
begin
 { The DummySQL query is set to be the dataset of DetsSRC for
    use at design time but at runtime we want to use GetDetsSQL. }
  DetsSRC.DataSet := GetDetsSQL;
  { Set default values for properties }
 // SeqBySONumber := true;
  ShowCustName := true;
  ShowCustBranch := true;
  ShowCustordNo := true;
  ShowDelTo := true;
end;

procedure TDmLookupSOrd.SetSONumber(const Value: string);
begin
  FSONumber := Value;
end;

procedure TDmLookupSOrd.SetSOStatus(const Value: integer);
begin
  fSOStatus := Value;
end;

procedure TDmLookupSOrd.SetDateReq(const Value: TDateTime);
begin
  fDateReq := Value;
end;

procedure TDmLookupSOrd.setByException(const Value: Boolean);
begin
  fByException := Value;
end;

procedure TDmLookupSOrd.SetInt_selCode(const Value: integer);
begin
  fInt_selcode := Value;
end;

procedure TDmLookupSOrd.SetTransType(const Value: integer);
begin
  fTransType := Value;
end;

function TdmLookUpSOrd.PeriodEndRun(TempCode: integer): boolean;
begin
  Result := false;
  with qryPeriodEnd do
  begin
    close;
    ParamByName('Sales_Order').Asinteger := TempCode;
    open;
    if recordcount > 0 then
    begin
      Result := true;
    end;
    close;
  end;
end;

procedure TDmLookupSOrd.qryProductSalesbyCustCalcFields(DataSet: TDataSet);
begin
  if qryProductSalesbyCustDeliveryBranchName.asstring <> '' then
    begin
      qryProductSalesbyCustDeliveryLocation.text := qryProductSalesbyCustDeliveryBranchName.asstring;
(*      with qryCust do
        begin
          close;
          parambyname('Customer').asinteger := qryProductSalesbyCustDelivery_Customer.asinteger;
          parambyname('Branch_no').asinteger := qryProductSalesbyCustDelivery_Branch.asinteger;
          open;
          qryProductSalesbyCustDeliveryLocation.text := fieldbyname('Customer_Name').asstring + '/' +
                                                        fieldbyname('Branch_Name').asstring;
        end;
*)
    end
  else
    begin
      with qryAdhoc do
        begin
          close;
          parambyname('Ad_hoc_address').asinteger := qryProductSalesbyCustAd_hoc_Address.asinteger;
          open;
          qryProductSalesbyCustDeliveryLocation.text := fieldbyname('Name').asstring;
        end;
    end;

  qryProductSalesbyCustSalesValue.value :=
    (qryProductSalesbyCustquantity_ordered.value / qryProductSalesbyCustsell_pack_quantity.value) *
     qryProductSalesbyCustpart_sales_price.value;

  qryProductSalesbyCustProduct.text :=
     qryProductSalesbyCustpart.text + ' - ' +
     qryProductSalesbyCustpart_description.text;
end;

procedure TDmLookupSOrd.GetDetsSQLDescriptionGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if  (DetsSRC.Dataset.fieldbyname('Sales_Order_Head_status').asinteger > 150) then
    begin
      qryInvoice.close;
      qryInvoice.parambyname('Sales_Order').asInteger := DetsSRC.Dataset.fieldbyname('Sales_Order').asinteger;
      qryInvoice.open;

      if qryInvoice.recordcount > 0 then
        if (qryInvoice.FieldByName('Sales_invoice_no').asstring <> '') then
          begin
            text := qryInvoice.fieldbyname('Sales_invoice_no').asstring;
            exit;
          end;
      text := DetsSRC.Dataset.fieldbyname('status_description').asstring;
    end
  else
    text := DetsSRC.Dataset.fieldbyname('status_description').asstring;
end;

procedure TDmLookupSOrd.setseqByDelTo(const Value: Boolean);
begin
  fSeqByDelTo := Value;
end;

procedure TDmLookupSOrd.setShowDelTo(const Value: Boolean);
begin
  fShowDelTo := Value;
end;

procedure TDmLookupSOrd.setDelTo(const Value: string);
begin
  fDelTo := Value;
end;

procedure TDmLookupSOrd.GetDetsSQLDel_To_AddGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
Text := '';
if GetDetsSQLDelivery_Customer.asInteger <> 0 then
    begin
      text := GetDetsSQLDel_name.asstring;
    end
  else
    begin
      if GetDetsSQLAd_Hoc_Address.asInteger <> 0 then
      begin
        qryAdhoc.close;
        qryAdhoc.parambyname('Ad_hoc_address').asinteger := GetDetsSQLAd_hoc_Address.asinteger;
        qryAdhoc.open;
        text := qryAdhoc.fieldbyname('Name').asstring;
      end;
    end;

end;

procedure TDmLookupSOrd.qryProdSalesbyCustCalcFields(DataSet: TDataSet);
begin
  if qryProdSalesbyCustDeliveryBranchName.asstring <> '' then
    begin
      qryProdSalesbyCustDeliveryLocation.text := qryProdSalesbyCustDeliveryBranchName.asstring;
    end
  else
    begin
      with qryAdhoc do
        begin
          close;
          parambyname('Ad_hoc_address').asinteger := qryProdSalesbyCustAd_hoc_Address.asinteger;
          open;
          qryProdSalesbyCustDeliveryLocation.text := fieldbyname('Name').asstring;
        end;
    end;

  qryProdSalesbyCustSalesValue.value :=
    (qryProdSalesbyCustquantity_ordered.value / qryProdSalesbyCustsell_pack_quantity.value) *
     qryProdSalesbyCustpart_sales_price.value;

  qryProdSalesbyCustProduct.text :=
     qryProdSalesbyCustpart.text + ' - ' +
     qryProdSalesbyCustpart_description.text;

end;

procedure TDmLookupSOrd.qrySalesHistoryCalcFields(DataSet: TDataSet);
begin
  if qrySalesHistoryDeliveryBranchName.asstring <> '' then
    begin
      qrySalesHistoryDelivery_Location.text := qrySalesHistoryDeliveryBranchName.asstring;
    end
  else
    begin
      with qryAdhoc do
        begin
          close;
          parambyname('Ad_hoc_address').asinteger := qrySalesHistoryAd_hoc_Address.asinteger;
          open;
          qrySalesHistoryDelivery_Location.text := fieldbyname('Name').asstring;
        end;
    end;
end;

end.
