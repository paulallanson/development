unit STSODataMod;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, STSOObjects, STPacks;

type
  TSTSalesOrdDM = class(TDataModule)
    GetSOLineSql: TQuery;
    GetLastSQL: TQuery;
    UpdLastSQL: TQuery;
    UpdSQL: TQuery;
    qryCompany: TQuery;
    OperatorSQL: TQuery;
    OperatorSRC: TDataSource;
    DelSOLineSQL: TQuery;
    AddSOLineSQL: TQuery;
    UpdSOLineSQL: TQuery;
    GetStatusSQL: TQuery;
    GetCustContSQL: TQuery;
    GetSOSQL: TQuery;
    AddSQL: TQuery;
    GetLineDetsSQL: TQuery;
    GetDelSOLinesSQL: TQuery;
    DelSQL: TQuery;
    GetPartDescSQL: TQuery;
    GetPartDetsSQL: TQuery;
    StoreSRC: TDataSource;
    StoreSQL: TQuery;
    GetCustCstCntrSQL: TQuery;
    GetPartDiscSQL: TQuery;
    GetGroupDiscSQL: TQuery;
    DefWHouseSQL: TQuery;
    UpdSOLineRepPercSQL: TQuery;
    AddSOLineRepPercSQL: TQuery;
    DelSOLineRepPercSQL: TQuery;
    GetRepDetsSQL: TQuery;
    GetCustomerSQL: TQuery;
    GetPartSRC: TDataSource;
    GetPartSQL: TQuery;
    RepSQL: TQuery;
    RepSRC: TDataSource;
    GetCustRepsSQL: TQuery;
    GetCustSQL: TQuery;
    GetCustBrSQL: TQuery;
    DelAllRepPercSQL: TQuery;
    GetCustAddrSQL: TQuery;
    GetOSSObySuppSQL: TQuery;
    qryCompanyDtls: TQuery;
    qryGetContactName: TQuery;
    qryUpdSOStatus: TQuery;
    GetVatRateSQL: TQuery;
    UpdLastInvSQL: TQuery;
    AddInvSQL: TQuery;
    UpdInvHeadSQL: TQuery;
    AddInvLineSQL: TQuery;
    AddInvHeadSQL: TQuery;
    GetInvoiceNoSQL: TQuery;
    UpdInvLineSQL: TQuery;
    GetInvoiceSQL: TQuery;
    GetExtChgsSQL: TQuery;
    GetExtChgSQL: TQuery;
    AddExtChgSQL: TQuery;
    UpdExtChgSQL: TQuery;
    GetExtChgsInvSQL: TQuery;
    GetSuppOTypeSQL: TQuery;
    GetSuppOTypeSRC: TDataSource;
    RepSourceSQL: TQuery;
    RepSourceSRC: TDataSource;
    GetSuppSQL: TQuery;
    GetSuppBrSQL: TQuery;
    GetPartVatRateSQL: TQuery;
    GetRateSQL: TQuery;
    GetPartSuppSQL: TQuery;
    DelExtChgSQL: TQuery;
    AddOrdExtChgSQL: TQuery;
    DelOrdExtChgSQL: TQuery;
    qryListSOwithoutPO: TQuery;
    dtsrcGeneral: TDataSource;
    GetDiscTypeSQL: TQuery;
    GetDiscTypeSRC: TDataSource;
    GetInvLineSQL: TQuery;
    qryGetCallOffDtls: TQuery;
    qryCallOffList: TQuery;
    qryGetFormRefDtls: TQuery;
    qryReport: TQuery;
    qryReportdescription: TStringField;
    qryReportquantity: TIntegerField;
    qryReportquantity_allocated: TIntegerField;
    qryReportdelivery_to_Stock: TStringField;
    qryReportForm_reference: TIntegerField;
    qryReportform_reference_id: TStringField;
    qryReportform_reference_descr: TStringField;
    qryReportPurchase_order: TFloatField;
    qryReportstock_location_desc: TStringField;
    qryReportForms_per_Box: TStringField;
    qryReportCust_Order_no: TStringField;
    qryReportcustomer: TIntegerField;
    qryReportbranch_no: TIntegerField;
    qryReportQty_in_stock: TIntegerField;
    qryReportOrder_Price: TCurrencyField;
    qryReportSelling_Price: TCurrencyField;
    qryReportOrder_Unit: TIntegerField;
    qryReportSell_Unit: TIntegerField;
    qryReportVat_Code: TIntegerField;
    PriceUnitSQL: TQuery;
    CheckPartExistsQuery: TQuery;
    UpdPartQuery: TQuery;
    AddPartQuery: TQuery;
    qryGetDelivDtls: TQuery;
    qryGetPOAddChgs: TQuery;
    qryGetCustVat: TQuery;
    GetDelInvLinesSQL: TQuery;
    DelInvLineSQL: TQuery;
    DelInvSQL: TQuery;
    GetInvDetsSQL: TQuery;
    QryGetAdHoc: TQuery;
    GetStockSQL: TQuery;
    GetSOSerialNosSQL: TQuery;
    DelSOSerialNosSQL: TQuery;
    AddSerialNosSQL: TQuery;
    AddStStkSerialNosSQL: TQuery;
    DelStStkSerialNosSQL: TQuery;
    GetNextStStkSerialNoSQL: TQuery;
    GetStockSerialNosSQL: TQuery;
    MarkupSQL: TQuery;
    srcMarkup: TDataSource;
    qryDelSOSerialNos: TQuery;
    qryDelSOSundry: TQuery;
    qryDelSORep: TQuery;
    qryDelSONarrative: TQuery;
    qryDelSOPORef: TQuery;
    qrySOLineInvdQty: TQuery;
    qrySOLineDelivQty: TQuery;
    qryPObySO: TQuery;
    qryDelStoreStockSISOAlloc: TQuery;
    qrySelContractbySO: TQuery;
    qryGetBranchRep: TQuery;
    qryDelStrStckSOLineAlloc: TQuery;
    AddJobBagSQL: TQuery;
    GetLastJBLineSQL: TQuery;
    DelJobBagSQL: TQuery;
    UpdJobBagSQL: TQuery;
    qryGetJBLine: TQuery;
    qryGetProdLoc: TQuery;
    qryGetAccountMgr: TQuery;
    qryGetAccountTeam: TQuery;
    UpdSOHeadStatusSQL: TQuery;
    GetPartTransferSQL: TQuery;
    GetPartAllocationSQL: TQuery;
    qrySOAddCharge: TQuery;
    CheckSOStatusSQL: TQuery;
    UpdOrderStatusSQL: TQuery;
    UpdSalesOrderLineSQL: TQuery;
    qryGetPartAllocbySOL: TQuery;
    qryUpdPartAlloc: TQuery;
    qryUpdJobBagLine: TQuery;
    qryJBUpHead: TQuery;
    qrySalesOrderJB: TQuery;
    qryJBChkStatus: TQuery;
    GetStoreStockSQL: TQuery;
    DeletePartTransferSQL: TQuery;
    UpdatePartTransferSQL: TQuery;
    updSOLValuesSQL: TQuery;
    qryGetJBRequest: TQuery;
    GetLastJBRequestSQL: TQuery;
    AddJobBagReqSQL: TQuery;
    DelJobBagReqSQL: TQuery;
    qryGetSODelivAdd: TQuery;
    qryGetCustCC: TQuery;
    qryGetBranchCC: TQuery;
    qryGetCustBranch: TQuery;
    qryGetSOLastDelivery: TQuery;
    qryVat: TQuery;
    dtsVat: TDataSource;
    qryUpdateContactStatus: TQuery;
    AddDelivLineDetSQL: TQuery;
    AddDelivDetSQL: TQuery;
    DelDelivDetsSQL: TQuery;
    DelDelivLineDetsSQL: TQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    private
    fGetInvToCust: Integer;
    fGetInvToBranch: Integer;
    fGetInvToAccount: String;
    procedure LoadLineDets(var SalesOrder : TSalesOrder);
    procedure LockCompanyRecord;
    procedure FreeCompanyRecord;
    procedure setInvToBranch(const Value: Integer);
    procedure SetInvToCust(const Value: Integer);
    procedure UpdateSOLines(SO: TSalesOrder);
    procedure HandleSOLine(Query: TQuery; const inx: Integer; SO: TSalesOrder);
    procedure setInvToAccount(const Value: String);
    procedure UpdateRepPerc(SO: TSalesOrder);
    procedure HandleSORepPerc(Query: TQuery; const inx: integer; SO: TSalesOrder);
    procedure CreateExtraChargeLine(SO: TSalesOrder);
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshData;
    procedure LoadStockSerialNoDets(var SalesOrder : TSalesOrder);
    procedure LoadSerialNoDets(var SalesOrder : TSalesOrder);
    procedure LoadRepLineDets(var SalesOrder : TSalesOrder);
    procedure LoadSalesOrder(var SalesOrder : TSalesOrder);
    procedure LoadInvLineDets(var SalesOrder: TSalesOrder; iInvoiceNo:integer);
    procedure LoadExtChgOrd(var SalesOrder : TSalesOrder);
    procedure LoadExtChgInv(var SalesOrder: TSalesOrder; iInvoiceNo: integer);
    procedure DeleteSOLines(TempSO: Integer);
    procedure DeleteInvLines(TempInv: Integer);
    procedure DeleteStoreStockSerialItems(TempCode: Integer; TempLine: integer);
    procedure LoadSOFromDatabase(var SalesOrder : TSalesOrder);
    procedure DeleteSalesOrder(SONumber: Integer);
    procedure DeleteSalesInvoice(TempInv: Integer);
    procedure DeleteCharges(SONumber: Integer);
    procedure DeleteSOSerialNos(SONumber, SOLine: integer); overload;
    function GetAccountTeamName(tempCode: integer): string;
    function GetCompanyName: string;
    function GetCompanySupplier: integer;
    function GetCompanySupplierBranch: integer;
    function GetJobBagNumber(tempNo, templine: integer): integer;
    function GetJobBagLine(tempNo, templine: integer): integer;
    function GetJobBagRequest(tempNo, templine: integer): integer;
    function GetNextJobBagLineNumber(tempNo: integer): integer;
    function GetNextJobBagRequest(tempNo: integer): integer;
    function GetNextSONumber: Integer;
    function GetNextInvNumber: Integer;
    function GetNextStoreStockSerialNo(TempCode: integer): integer;
    function GetStatusDescr(TempStat: Integer): string;
    function GetPartClass(TempPart: String): string;
    function GetPartDescr(TempPart: String): string;
    function GetPartProductType(tempPart: String): integer;
    function GetPartVatRate(TempPart: String): string;
    function GetPartVatCode(TempPart: String): Integer;
    function GetPartNumbered(TempPart: String): boolean;
    function GetVatCodeVatRate(TempVatCode: integer): string;
    function GetSuppDiscount(iTempCode: integer): double;
    function GetSuppName(iTempCode: integer): string;
    function GetSuppBranchName(iTempCode, iTempBrCode: integer): string;
    function GetCustName(iTempCode: integer): string;
    function GetCustomerPrefix(iTempCode: integer): string;
    function GetCostCentre(tempCust, tempBranch: integer; tempCC, tempCCLevel: string): string;
    function IsCustomerOnStop(iTempCode: integer): boolean;
    function GetCustBranchName(iTempCode, iTempBrCode: integer): string;
    function GetDeliveryAddress(iTempCode, iTempBrCode: integer): string;
    function GetInvoiceAddress(iTempCode, iTempBrCode: integer): string;
    function GetAdHocAddress(iTempCode: integer): string;
    function GetProductionName(iTempCode: integer): string;
    function GetAdHocName(iTempCode: integer): string;
    function GetSellUnit(TempPart: String): string;
    function GetInvSellPrice(SoNumber, SOLine: integer; InvType: string): real;
    function GetCredqty(soNumber, SOLine: Integer): integer;
    function GetPurchUnit(TempPart: String): string;
    function GetCustomer(TempCode: String): integer;
    function DefaultRep(iTempCust, iTempBranch: Integer): Integer;
    function GetDelAddr(SONum: integer; var CustName, CustAddr: string): boolean;
    function GetCustContact(custno, brnchno, contactno: integer;
      var contname: string): boolean;
    function GetVatRate(CustNo: integer): string;
    function GetDefPriceUnit: Integer;
    function GetDefSalesNominal: string;
      property InvToCust: Integer read fGetInvToCust write SetInvToCust;
    property InvToBranch: Integer read fGetInvToBranch write setInvToBranch;
    property InvToAccount: String read fGetInvToAccount write setInvToAccount;
    function UpdateDBRecords(SO: TSalesOrder): boolean;
    function GetFormRefID(formRef: integer): string;
    function ConvertPartPrices(aLine: TOrderLine; ordUnit, sellUnit: integer;
                   ordPrice, sellPrice: double): boolean;
    function SaveToDB(SO: TSalesOrder): boolean;
    function GetCustDefVat(cust: integer; vat_code: integer; vat: double): boolean;
    function GetSalesNominal: String;
    function ConvertCallOff(Cust, CustBr: integer; CustOrdNo: string;
      DateReq: TDateTime; SO: TSalesOrder): Boolean;
    function PartExists(part: String): boolean;
    function GetPartCost(part: String): double;
    procedure DeleteSOSerialNos(SOnum: integer); overload;
    procedure DeleteSOSundry(SONum: integer);
    procedure DeleteSORep(SONum: integer);
    procedure DeleteSONarrative(narrative: integer);
    procedure DeleteSOPORef(SONum: integer);
    function ConfirmSOStatus(SalesOrder: TSalesOrder): integer;
    function CheckContractLink(SONum, lineNo: integer; var contractNo: integer): boolean;
    procedure UpdateSalesOrderStatus(iSorder: integer);
  end;

var
  STSalesOrdDM: TSTSalesOrdDM;

const
  cLFCR            = #13#10;  { Line feed carriage return }

implementation

uses PBIntSelDM, pbMainMenu;

{$R *.DFM}

{ TSTSalesOrdDM }

procedure TSTSalesOrdDM.DataModuleCreate(Sender: TObject);
begin
dmIntSel := TdmIntSel.Create(Self);
end;

procedure TSTSalesOrdDM.DeleteSOLines(TempSO: Integer);
var
  iLine: Integer;
begin
  with GetDelSOLinesSQL do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := TempSO;
    Open;
    while not EOF do
    begin
      iLine := FieldByName('Sales_Order_Line_No').AsInteger;
      with DelSOLineSQL do
      begin
        ParamByName('Sales_Order').AsInteger := TempSO;
        ParamByName('Line').AsInteger := iLine;
        ExecSQL;
      end;
      Next;
    end;
    Close;
  end;
end;

procedure TSTSalesOrdDM.FreeCompanyRecord;
begin
  with qryCompany do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

function TSTSalesOrdDM.GetNextSONumber: Integer;
begin
  LockCompanyRecord;
  try
    try
      with GetLastSQL do
      begin
        Close;
        Open;
        Result := FieldByName('Last_SO_Number').AsInteger + 1;
        Close;
      end;
      with UpdLastSQL do
      begin
        ParamByName('Last_SO_Number').AsInteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next SO number:' + #13 + E.Message);
    end;
    end;
  finally
    FreeCompanyRecord;
  end;
end;

function TSTSalesOrdDM.GetStatusDescr(TempStat: Integer): string;
begin
 with GetStatusSQL do
  begin
    Close;
    ParamByName('Sales_Order_Line_Status').AsInteger := TempStat;
    Open;
    Result := FieldByName('Description').AsString;
    Close;
  end;
end;

procedure TSTSalesOrdDM.LoadSOFromDatabase(var SalesOrder: TSalesOrder);
begin
  LoadSalesOrder(SalesOrder);
  LoadLineDets(SalesOrder);
  LoadRepLineDets(SalesOrder);
  if salesOrder.FuncMode = 'P' then
  begin
    //if the order is begin loaded so that it can be copied
    //then check if serial numbers where on the origianl order
    //if so warn the user to set new numbers

  end
  else
  begin
    //otherwise just load the numbers for the order
    LoadSerialNoDets(SalesOrder);
    LoadStockSerialNoDets(SalesOrder);
  end;
end;

procedure TSTSalesOrdDM.LockCompanyRecord;
var
  StartTime : TDateTime;
  EndTime : TDateTime;
  InUseBy : integer;
  Myself : integer;
const
  LockTime = ((1/24) * (5/3600));  { Allow 5 seconds for lock attempts }
begin
  StartTime := Time;
  EndTime := StartTime + LockTime;
  InUseBy := 0;
  MySelf := frmPBMainMenu.iOperator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qryCompany do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
              'Where Company=1 and In_Use_By is null');
      ExecSQL;
      SQL.Clear;
      SQL.Add('Select In_Use_By From Company Where Company = 1');
      Open;
      InUseBy := FieldByName('In_Use_By').AsInteger;
      Close;
      if (InUseBy <> MySelf) and (Time > EndTime) then
      begin { Assume the other locker has died and grab record unconditionally }
        SQL.Clear;
        SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
                'Where Company=1');
        ExecSQL;
      end;
    end;
end;

procedure TSTSalesOrdDM.RefreshData;
begin
end;

procedure TSTSalesOrdDM.DataModuleDestroy(Sender: TObject);
begin
dmIntSel.Free;
end;

procedure TSTSalesOrdDM.LoadLineDets(var SalesOrder: TSalesOrder);
var
  aLine: TOrderLine;
begin
  SalesOrder.OrderLines.Clear;
  {Load the line details for order number TempOrd}
  with GetLineDetsSQL do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
    Open;
    while not EOF do
    begin
      aLine := TOrderLine.Create;
      with aLine do
      begin
        Line := FieldByName('Sales_Order_Line_No').AsInteger;
        OrderNo := FieldByName('Sales_Order').AsInteger;
        SOLineStatus := FieldByName('Sales_Order_Line_Status').AsInteger;
        PurchPackQuantity := fieldbyname('Purch_Pack_Quantity').asinteger;
        SellPackQuantity := fieldbyname('Sell_Pack_Quantity').asinteger;
        OrdQty := FieldByName('Quantity_Ordered').AsInteger;
        OrdQtyinPacks := ShowinPacks(FieldByName('Quantity_Ordered').AsInteger,SellPackQuantity);
        OversQty := FieldByName('Quantity_Overs').AsInteger;
        LineIsSample := (Fieldbyname('Line_is_Sample').asstring = 'Y');
        DelQty := FieldByName('Quantity_Delivered').AsInteger;
        DelQtyinPacks := ShowinPacks(FieldByName('Quantity_Delivered').AsInteger,SellPackQuantity);
        AllocQty := FieldByName('Quantity_Allocated').AsInteger;
        AllocQtyinPacks := ShowinPacks(FieldByName('Quantity_Allocated').AsInteger,SellPackQuantity);
        InvQty := FieldByName('Quantity_Invoiced').AsInteger;
        InvQtyinPacks := ShowinPacks(FieldByName('Quantity_Invoiced').AsInteger,SellPackQuantity);
        part := FieldByName('part').AsString;
        Inv_price := GetInvSellPrice(OrderNo,Line,'I') * SellPackQuantity;
        sell_price := fieldByName('Part_Sales_Price').asFloat;
        Credqty := GetCredqty(OrderNo, Line);
        CredQtyinPacks := ShowinPacks(credqty, SellPackQuantity);
        if credqty > 0 then
        begin
          cred_price := GetInvSellPrice(OrderNo,Line,'C') * (SellPackQuantity * -1);
        end
        else
          cred_price := sell_price;

        disc_Type := fieldByName('Discount_Type').AsString;
        Disc_Val := fieldByName('Discount_Value').AsFloat;
        Part_cost := fieldByName('part_Cost').AsFloat;
        PartClass := GetPartClass(Part);
        VatCode := fieldbyname('Vat_code').asinteger;
        OriginalSellPrice := fieldbyname('Original_Sell_Price').asfloat;
        MarkupType := fieldbyname('Markup_Type').asstring;
        MarkupValue := fieldbyname('Markup_Value').asfloat;
        JobBag := GetJobBagNumber(OrderNo, Line);
        JobBagLine := GetJobBagLine(OrderNo, Line);
        JobBagRequest := GetJobBagRequest(OrderNo, Line);
        if salesorder.FuncMode = 'P' then
        begin
          //the order is being copied, so set the line has been 'added' to the order
          if PartClass = 'SERV' then
            DelQty := OrdQty
          else
            DelQty := 0;
          DelQtyinPacks := ShowinPacks(DelQty,SellPackQuantity);
          AllocQty := 0;
          AllocQtyinPacks := ShowinPacks(0,SellPackQuantity);
          InvQty := 0;
          InvQtyinPacks := ShowinPacks(0,SellPackQuantity);
          ActnTkn := 'A';
        end;
      end;
      SalesOrder.OrderLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSTSalesOrdDM.LoadSalesOrder(var SalesOrder: TSalesOrder);
begin
  with GetSOSQL do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
    Open;
    SalesOrder.AccountManagerName := Fieldbyname('Account_Manager').AsString;
    SalesOrder.AccountTeam := Fieldbyname('Account_Team').Asinteger;
    SalesOrder.Customer := FieldByName('Customer').AsInteger;
    SalesOrder.BranchNo := FieldByName('Branch_No').AsInteger;
    SalesOrder.CashSale := FieldbyName('Cash_Sales').AsString;
    SalesOrder.DatePoint := FieldByName('Date_Ordered').AsDateTime;
    SalesOrder.CustomerContactNo := FieldByName('Contact_No').AsInteger;
    SalesOrder.ContactName := FieldByName('Contact_Name').AsString;
    SalesOrder.CostCentre := FieldByName('Cost_Centre').AsString;
    SalesOrder.OfficeContact := FieldByName('Office_Contact').AsInteger;
    SalesOrder.SOHeadStatus := FieldByName('Sales_Order_Head_Status').AsInteger;
    SalesOrder.CustomerName := FieldByName('CustomerName').AsString;
    SalesOrder.BranchName := FieldByName('BranchName').AsString;
    SalesOrder.PartStore := FieldByName('Part_Store').AsInteger;
    SalesOrder.CustOrderNo := FieldByName('Cust_Order_No').AsString;
    SalesOrder.FAO := fieldbyname('Delivery_Contact_Name').asstring;
    SalesOrder.DeliveryNotes := FieldByName('Delivery_Notes').AsString;
    SalesOrder.DeliveryCustomer := FieldByName('Delivery_Customer').Asinteger;
    SalesOrder.DeliveryBranch := FieldByName('Delivery_Branch').Asinteger;
    SalesOrder.ReplenishSource := FieldByName('Replenish_Source').AsInteger;
    SalesOrder.Supplier := FieldByName('Supplier').AsInteger;
    SalesOrder.BranchNo0 := FieldByName('Branch_No0').AsInteger;
    SalesOrder.SupplierOrderType := FieldByName('Supp_Order_type').AsString;
    SalesOrder.DateReq := FieldByName('Date_Required').AsDateTime;
    SalesOrder.Operator := FieldByName('Operator').AsInteger;
    SalesOrder.OperatorName := Fieldbyname('Operator_Name').asstring;
    SalesOrder.AdHocAddress := FieldByName('Ad_Hoc_Address').AsInteger;
    SalesOrder.ProductionLocation := FieldByName('Production_Location').AsInteger;
    SalesOrder.SONarrative := Fieldbyname('Narrative').asinteger;
    SalesOrder.SOType := FieldByName('Order_Type').asString;
    SalesOrder.inactive := FieldByName('inactive').asString;
  end;
end;

procedure TSTSalesOrdDM.DeleteSalesOrder(SONumber: Integer);
begin
  with DelSQL do
  begin
    ParamByName('Sales_Order').AsInteger := SONumber;
    ExecSQL;
  end;
end;

function TSTSalesOrdDM.GetPartDescr(TempPart: String): string;
begin
 with GetPartDescSQL do
  begin
    Close;
    ParamByName('Part').AsString := TempPart;
    Open;
    Result := FieldByName('Part_Description').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetPartProductType(tempPart: String): integer;
begin
 with GetPartDescSQL do
  begin
    Close;
    ParamByName('Part').AsString := TempPart;
    Open;
    Result := FieldByName('Product_Type').Asinteger;
    Close;
  end;
end;

function TSTSalesOrdDM.GetPartClass(TempPart: String): string;
begin
 with GetPartDetsSQL do
  begin
    Close;
    ParamByName('Part').AsString := TempPart;
    Open;
    Result := FieldByName('Product_class').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetPartNumbered(TempPart: String): boolean;
begin
 with GetPartDescSQL do
  begin
    Close;
    ParamByName('Part').AsString := TempPart;
    Open;
    Result := (fieldbyname('Numbered').asstring = 'Y');
    Close;
  end;
end;

function TSTSalesOrdDM.GetCustomer(TempCode: String): integer;
begin
 with GetCustomerSQL do
  begin
    Close;
    ParamByName('Account_Code').AsString := TempCode;
    Open;
    Result := FieldByName('Customer').Asinteger;
    Close;
  end;
end;

function TSTSalesOrdDM.GetCustName(iTempCode: integer): string;
begin
 with GetCustSQL do
  begin
    Close;
    ParamByName('Customer').Asinteger := iTempCode;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetCustomerPrefix(iTempCode: integer): string;
begin
 with GetCustSQL do
  begin
    Close;
    ParamByName('Customer').Asinteger := iTempCode;
    Open;
    Result := FieldByName('Product_Code_Prefix').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetCostCentre(tempCust, tempBranch: integer; tempCC, tempCCLevel: string): string;
begin
  if tempCCLevel = 'C' then
    begin
      with qryGetCustCC do
        begin
          Close;
          ParamByName('Customer').AsInteger := TempCust;
          ParamByName('Cost_Centre').Asstring := tempCC;
          Open;
          Result := FieldByName('Description').AsString;
        end;
    end
  else
  if tempCCLevel = 'B' then
    begin
      with qryGetBranchCC do
        begin
          Close;
          ParamByName('Customer').AsInteger := TempCust;
          ParamByName('Branch_no').AsInteger := TempBranch;
          ParamByName('Cost_Centre').Asstring := tempCC;
          Open;
          Result := FieldByName('Description').AsString;
        end;
    end
  else
    Result := '';
end;

function TSTSalesOrdDM.GetCompanyName: string;
begin
 with qryCompanyDtls do
  begin
    Close;
    ParamByName('Company').AsInteger := 1;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetCompanySupplier: integer;
begin
 with qryCompanyDtls do
  begin
    Close;
    ParamByName('Company').AsInteger := 1;
    Open;
    Result := FieldByName('Supplier').Asinteger;
    Close;
  end;
end;

function TSTSalesOrdDM.GetCompanySupplierBranch: integer;
begin
 with qryCompanyDtls do
  begin
    Close;
    ParamByName('Company').AsInteger := 1;
    Open;
    Result := FieldByName('Branch_no').AsInteger;
    Close;
  end;
end;

function TSTSalesOrdDM.IsCustomerOnStop(iTempCode: integer): boolean;
begin
 with GetCustSQL do
  begin
    Close;
    ParamByName('Customer').Asinteger := iTempCode;
    Open;
    Result := (FieldByName('Credit_Status').AsString = 'S');
    Close;
  end;
end;

function TSTSalesOrdDM.GetCustBranchName(iTempCode, iTempBrCode: integer): string;
begin
 with GetCustBrSQL do
  begin
    Close;
    ParamByName('Customer').Asinteger := iTempCode;
    ParamByName('Branch_no').Asinteger := iTempBrCode;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetDeliveryAddress(iTempCode, iTempBrCode: integer): string;
var
  i: integer;
begin
 with GetCustAddrSQL do
  begin
    Close;
    ParamByName('Customer').Asinteger := iTempCode;
    ParamByName('Branch_no').Asinteger := iTempBrCode;
    Open;
    Result := '';
    Result := fieldbyname('Customer_Name').asstring;
    for i := 3 to 8 do
      begin
        if fields[i].asstring = '' then
          begin
            next;
            continue;
          end;
        Result := Result + cLFCR + Fields[i].AsString;
        next
      end;
    InvToAccount := fieldByName('Account_Code').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetSuppName(iTempCode: integer): string;
begin
 with GetSuppSQL do
  begin
    Close;
    ParamByName('Supplier').Asinteger := iTempCode;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetSuppDiscount(iTempCode: integer): double;
begin
 with GetSuppSQL do
  begin
    Close;
    ParamByName('Supplier').Asinteger := iTempCode;
    Open;
    Result := FieldByName('Discount').Asfloat;
    Close;
  end;
end;

function TSTSalesOrdDM.GetSuppBranchName(iTempCode, iTempBrCode: integer): string;
begin
 with GetSuppBrSQL do
  begin
    Close;
    ParamByName('Supplier').Asinteger := iTempCode;
    ParamByName('Branch_no').Asinteger := iTempBrCode;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

procedure TSTSalesOrdDM.LoadRepLineDets(var SalesOrder: TSalesOrder);
var
  aLine: TRepLine;
begin
  SalesOrder.RepLines.Clear;
  {Load the line details for order number TempOrd}
  with GetRepDetsSQL do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
    Open;
    while not EOF do
    begin
      aLine := TRepLine.Create;
      with aLine do
      begin
        Rep := FieldByName('Rep').AsInteger;
        Percentage := FieldByName('Rep_Percentage').AsFloat;
        RepName := FieldByName('Name').AsString;
        if SalesOrder.FuncMode = 'P' then
        begin
          ActnTkn := 'A';
        end;
      end;

      SalesOrder.RepLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

function TSTSalesOrdDM.DefaultRep(iTempCust, iTempBranch: Integer): Integer;
begin
  {Work out what the default rep should be, either the ONLY rep or the MAIN rep}
  {or nothing}
  with GetCustRepsSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := iTempCust;
    ParamByName('Branch_No').AsInteger := iTempBranch;
    Open;
    if (RecordCount = 1) or
      ((FieldByName('Is_Main_Rep').AsString = 'Y') and (not EOF)) then
      Result := FieldByName('Rep').AsInteger
    else
      Result := 0;
  end;
end;

function TSTSalesOrdDM.GetPurchUnit(TempPart: String): string;
begin
  with GetPartDescSQL do
  begin
    Close;
    ParamByName('Part').AsString := TempPart;
    Open;
    Result := FieldByName('Purch_Pack_Quantity').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetSellUnit(TempPart: String): string;
begin
 with GetPartDescSQL do
  begin
    Close;
    ParamByName('Part').AsString := TempPart;
    Open;
    Result := FieldByName('Sell_Pack_Quantity').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetDelAddr(SONum: integer; var CustName,
  CustAddr: string): boolean;
var
  CustNo, CustBrnch : integer;
begin
//if SO num is 0 return company address because there is not related customer sales order
//if there is a SO number look up the customer address details pack them into CNAM and
//CADD and return them
  if SONum = 0 then
  begin
    with qryCompanyDtls do
    begin
      ParamByName('Company').AsInteger := 1;
      open;
      if FieldByName('Postcode').AsString = '' then
      begin
        MessageDlg('There is no Post Code on the Company file'+#13#10+
                    'Please enter a Post Code for the main company record', mtWarning, [mbOK], 0);
        Result := false;
        exit;
      end;
      CustName := FieldByName('Name').AsString;
      CustAddr := FieldByName('Building_No_Name').AsString;
      CustAddr := CustAddr + ':' + FieldByName('Street').AsString;
      CustAddr := CustAddr + ':' + FieldByName('Locale').AsString;
      CustAddr := CustAddr + ':' + FieldByName('Town').AsString;
      CustAddr := CustAddr + ':' + FieldByName('Postcode').AsString;
    end;
  end
  else
  begin
    with GetSOSQL do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := SONum;
      open;
      CustName := FieldByName('CustomerName').AsString;
      CustNo := FieldByName('Customer').AsInteger;
      CustBrnch := FieldByName('Branch_No').AsInteger;
      close;
    end;
    with GetCustBrSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := CustNo;
      ParamByName('Branch_No').AsInteger := CustBrnch;
      open;
      if FieldByName('Postcode').AsString = '' then
      begin
        MessageDlg('There is no Post Code on the Customer Branch file'+#13#10+
                    'Please enter a Post Code for Customer: '+CustName+ ', Branch: '+CustAddr, mtWarning, [mbOK], 0);
        Result := false;
        exit;
      end;
      CustAddr := FieldByName('Building_No_Name').AsString;
      CustAddr := CustAddr + ':' + FieldByName('Street').AsString;
      CustAddr := CustAddr + ':' + FieldByName('Locale').AsString;
      CustAddr := CustAddr + ':' + FieldByName('Town').AsString;
      CustAddr := CustAddr + ':' + FieldByName('Postcode').AsString;
    end;
  end;
  Result := true;
end;

function TSTSalesOrdDM.GetCustContact(custno, brnchno, contactno: integer;
  var contname: string): boolean;
begin
  with qryGetContactName do
  begin
    Close;
    ParamByName('Customer').AsInteger := custno;
    ParamByName('Branch_No').AsInteger := brnchno;
    ParamByName('Contact_No').AsInteger := contactno;
    open;
    contname := FieldbyName('Name').AsString;
    close;
    Result := true;
  end;
end;

function TSTSalesOrdDM.GetVatRate(CustNo: integer): string;
begin
  with GetVatRateSQL do
  begin
    Close;
    parambyName('Customer').AsInteger := custno;
    open;
    Result := FormatFloat('###0.00',FieldbyName('Vat_Rate').AsFloat);
    end;
  end;

function TSTSalesOrdDM.GetInvoiceAddress(iTempCode,
  iTempBrCode: integer): string;
begin
 with GetCustBrSQL do
  begin
    Close;
    ParamByName('Customer').Asinteger := iTempCode;
    ParamByName('Branch_no').Asinteger := iTempBrCode;
    Open;

    if FieldByName('Inv_To_Customer').AsInteger = 0 then
      begin
        InvtoCust := iTempCode;
        InvToBranch := iTempBrCode;
      end
    else
      begin
        InvtoCust := FieldByName('Inv_To_Customer').AsInteger;
        InvToBranch := fieldBYName('Inv_To_Branch').AsInteger;
      end;
    Result:= GetDeliveryAddress(InvToCust, InvToBranch);
    Close;
  end;
 end;

procedure TSTSalesOrdDM.setInvToBranch(const Value: Integer);
begin
  fGetInvToBranch := Value;
end;

procedure TSTSalesOrdDM.SetInvToCust(const Value: Integer);
begin
  fGetInvToCust := Value;
end;

function TSTSalesOrdDM.GetNextInvNumber: Integer;
  begin
  LockCompanyRecord;
  try
    try
      with GetLastSQL do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Invoice_No').AsInteger + 1;
        Close;
      end;
      with UpdLastInvSQL do
      begin
        ParamByName('Last_Invoice_No').AsInteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next SO number:' + #13 + E.Message);
    end;
    end;
  finally
    FreeCompanyRecord;
  end;
  end;
  
function TSTSalesOrdDM.GetDefPriceUnit: Integer;
begin
 with qryCompanyDtls do
    begin
      Close;
      ParamByName('Company').AsInteger := 1;
      open;
      result  := FieldByName('Price_Unit').AsInteger;
    end;
end;

procedure TSTSalesOrdDM.LoadExtChgOrd(var SalesOrder: TSalesOrder);
var
  aCharge: TExtraCharge;
begin
  {Load the extra charges}
  SalesOrder.ExtraCharges.clear;
  with GetExtChgsSQL do
  begin
    Close;
    ParamByName('Sales_Order').asInteger := SalesOrder.SoNumber;
    Open;
    while not EOF do
    begin
      aCharge := TExtraCharge.Create;
      with aCharge do
      begin
        NominalCode := FieldByName('Nominal').AsString;
        AdditionalCharge := FieldByName('Additional_Charge').AsInteger;
        Details := FieldByName('Details').AsString;
        Amount := FieldByName('Amount').AsFloat;
        ChgVatCode := FieldByName('Vat_Code').AsInteger;
        Vat := Amount * (StrToFloat(getVatCodeVatRate(ChgVatCode))/100);
        Cost := FieldByName('Cost').AsFloat;
        end;
      SalesOrder.ExtraCharges.Add(aCharge);
      Next;
    end;
    Close;
  end;

end;


procedure TSTSalesOrdDM.DeleteCharges(SONumber: Integer);
begin
  self.DelOrdExtChgSQL.ParamByName('sales_order').asInteger := SONumber;
  self.DelOrdExtChgSQL.ExecSQL;
end;

procedure TSTSalesOrdDM.LoadExtChgInv(var SalesOrder: TSalesOrder; iInvoiceNo: integer);
var
  aCharge: TExtraCharge;
begin
  {Load the extra charges}
  SalesOrder.ExtraCharges.clear;
  with GetExtChgsInvSQL do
  begin
    Close;
    ParamByName('Sales_Order').asInteger := iInvoiceNo;
    Open;
    while not EOF do
    begin
      aCharge := TExtraCharge.Create;
      with aCharge do
      begin
        NominalCode := FieldByName('Nominal').AsString;
        AdditionalCharge := FieldByName('Additional_Charge').AsInteger;
        Details := FieldByName('Details').AsString;
        Amount := FieldByName('Amount').AsFloat;
        ChgVatCode := FieldByName('Vat_Code').AsInteger;
        Vat := Amount * (StrToFloat(getVatCodeVatRate(ChgVatCode))/100);
      end;
      SalesOrder.ExtraCharges.Add(aCharge);
      Next;
    end;
    Close;
  end;
end;


function TSTSalesOrdDM.GetDefSalesNominal: string;
begin
 with qryCompanyDtls do
    begin
      Close;
      ParamByName('Company').AsInteger := 1;
      open;
      result  := FieldByName('Sales_nom_Def').AsString;
    end;
end;

function TSTSalesOrdDM.GetPartVatRate(TempPart: String): string;
begin
 with GetPartVatRateSQL do
  begin
    Close;
    ParamByName('Part').AsString := TempPart;
    Open;
    Result := FieldbyName('Vat_Rate').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetVatCodeVatRate(TempVatCode: integer): string;
begin
 with GetRateSQL do
  begin
    Close;
    ParamByName('Vat_Code').AsInteger := TempVatCode;
    Open;
    Result := FieldbyName('Vat_Rate').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.GetPartVatCode(TempPart: String): Integer;
begin
 with GetPartVatRateSQL do
  begin
    Close;
    ParamByName('Part').AsString := TempPart;
    Open;
    Result := FieldbyName('Vat_Code').AsInteger;
    Close;
  end;
end;

function TSTSalesOrdDM.UpdateDBRecords(SO: TSalesOrder): boolean;
begin
Result := True;
   try
    {Update an existing code}
    //the following block is commented out because the only thing that calls this method
    //at this time only ever changes the line items so the SO header details
    //will not have changed and this bit can be skipped for now
    {*with StSalesOrdDM.UpdSQL, SalesOrder do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := SONumber;
       if OfficeComboBox.KeyValue = null then
        ParamByName('Contact_No').AsInteger := STMenuMainFrm.iOperator
      else
        ParamByName('Contact_No').AsInteger := OfficeComboBox.KeyValue;
      ParamByName('Part_Store').AsInteger := StoreComboBox.KeyValue;
      ParamByName('Operator').AsInteger := STMenuMainFrm.iOperator;
      ParamByName('Date_Ordrd').AsDateTime := StrToDate(DateEdit.Text);
      ParamByName('Date_Reqd').AsDateTime := StrToDate(DtReqEdit.Text);
      ParamByName('Cust_order_No').AsString := CustOrderNo;
      ParamByName('Customer').AsInteger := Customer;
      ParamByName('Branch_No').AsInteger := BranchNo;
      if CostCentre = '' then
        begin
          ParamByName('Cost_Centre').clear;
          ParamByName('Customer0').clear;
        end
      else
        begin
          ParamByName('Cost_Centre').Asstring := CostCentre;
          ParamByName('Customer0').AsInteger := Customer;
        end;

      ParamByName('Sales_Order_Head_Status').AsInteger := CalcSOHeadStatus(Self);
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      ParamByName('Delivery_Notes').Asstring := DeliveryNotes;
      ParamByName('Delivery_Customer').Asinteger := DeliveryCustomer;
      ParamByName('Delivery_Branch').Asinteger := DeliveryBranch;
      Parambyname('Replenish_source').asinteger := ReplenishSource;
      if ReplenishSource = 1 then   {Supplier}
      {*  begin
          Parambyname('Supplier').asinteger := Supplier;
          Parambyname('Branch_no0').asinteger := BranchNo0;
          Parambyname('Supp_Order_type').asstring := trim(SupplierOrderType);
          parambyname('Part_Store').asinteger := PartStore;
        end
      else                          {Warehouse}
      {*  begin
          parambyname('Part_Store').asinteger := PartStore;
          Parambyname('Supplier').clear;
          Parambyname('Branch_no0').clear;
          Parambyname('Supp_Order_type').clear;
        end;
      ExecSQL;
    end;      *}
    Self.UpdateSOLines(SO);
    //UpdateRepPerc;
    //UpdateExtraCharges;
    except on E: Exception do
    begin
      Result := False;
      MessageDlg('Error during update: ' + E.Message, mtError, [mbAbort], 0);
    end;
  end;
end;

procedure TSTSalesOrdDM.UpdateSOLines(SO: TSalesOrder);
var
  icount: Integer;
begin {Update the sales order lines}
  for icount := 0 to Pred(SO.OrderLines.Count) do
  begin
    if SO.OrderLines[icount].ActnTkn = 'A' then
        HandleSOLine(AddSOLineSQL, icount, SO)
      else
      if SO.OrderLines[icount].ActnTkn = 'C' then
          HandleSOLine(UpdSOLineSQL, icount, SO)
        else
          if SO.OrderLines[icount].ActnTkn = 'D' then
          HandleSOLine(DelSOLineSQL, icount, SO);
  end;
end;

procedure TSTSalesOrdDM.HandleSOLine(Query: TQuery; const inx: Integer; SO: TSalesOrder);
var
  i: Integer;
begin
  with Query, SO.OrderLines[inx] do
  begin
    for i := 0 to (Params.Count - 1) do
      Params[i].Clear;
    if query.name = 'UpdSOLineSQL' then
    begin
      ParamByName('Sales_Order').AsInteger := SO.SONumber;
      ParamByName('Line').AsInteger := Line;
      ParamByName('Part').AsString := Part;
      ParamByName('Part_Sales_Price').AsFloat := Sell_Price;
      ParamByName('Sell_Pack_Quantity').asInteger := SellPackQuantity;
      ParamByName('Quantity_Ordered').AsInteger := OrdQty;
      ParamByName('Sales_Order_Line_Status').AsInteger := SOLineStatus;
      ParamByName('Vat_Code').asinteger := VatCode;
      ParamByName('Part_Cost').AsFloat := Part_Cost;
      ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;
      ParamByName('Discount_Value').AsCurrency := Disc_Val;
      ParamByName('Discount_Type').AsString := Disc_Type;
      ParamByName('Quantity_Delivered').AsInteger := DelQty;
      if LineIsSample then
        ParamByName('Line_Is_Sample').Asstring := 'Y'
      else
        ParamByName('Line_Is_Sample').Asstring := 'N';
      if MarkUpType = '' then
        ParamByName('Markup_Type').clear
      else
        ParamByName('Markup_Type').asString := MarkUpType;

      ParamByName('Markup_Value').asCurrency := MarkupValue;
    end ;
    if query.name= 'AddSOLineSQL' then
    begin
    ParamByName('Sales_Order').AsInteger := SO.SONumber;
    ParamByName('Line').AsInteger := Line;
    ParamByName('Part').AsString := Part;
    ParamByName('Part_Cost').AsFloat := Part_Cost;
    ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;
    ParamByName('Part_Sales_Price').AsFloat := Sell_Price;
    ParamByName('Sell_Pack_Quantity').AsInteger := SellPackQuantity;
    ParamByName('Quantity_Ordered').AsInteger := OrdQty;
    ParamByName('Quantity_Allocated').AsInteger := AllocQty;
    ParamByName('Quantity_Delivered').AsInteger := DelQty;
//    ParamByName('Quantity_Delivered').AsInteger := OrdQty;
    ParamByName('Contract').Clear;
    ParamByName('Contract_Line_No').Clear;
    ParamByName('Sales_Order_Line_Status').AsInteger := SOLineStatus;
    ParamByName('Quantity_Invoiced').AsInteger := InvQty;
    ParamByName('Discount_Type').asString := Disc_Type;
    ParamByName('Discount_Value').asFloat := Disc_Val;
    ParamByName('Vat_Code').asinteger := VatCode;
    ParamByName('Original_Sell_Price').AsCurrency;
    if LineIsSample then
      ParamByName('Line_Is_Sample').Asstring := 'Y'
    else
      ParamByName('Line_Is_Sample').Asstring := 'N';
    end;
    if query.name = 'DelSOLineSQL' then
    begin
     ParamByName('Sales_Order').AsInteger := SO.SONumber;
      ParamByName('Line').AsInteger := Line;
    end;
    ExecSQL;
  end;
end;

function TSTSalesOrdDM.GetInvSellPrice(SoNumber, SOLine: integer; InvType: string): real;
begin
 with GetInvLineSQL do
  begin
    Close;
    ParamByName('OrderNo').AsInteger := SONumber;
    ParamByName('LineNo').AsInteger := SOLine;
    ParamByName('InvorCred').AsString := Invtype;
    Open;
    Result := FieldbyName('Goods_Value').AsFloat;
    Close;
  end;
end;

procedure TSTSalesOrdDM.setInvToAccount(const Value: String);
begin
  fGetInvToAccount := Value;
end;

function TSTSalesOrdDM.GetFormRefID(formRef: integer): string;
begin
  with qryGetFormRefDtls do
  begin
    Close;
    ParamByName('Form_Reference').AsInteger := formRef;
    Open;
    if recordcount < 1 then
      Result := 'Failed'
    else
      Result := FieldByName('Form_Reference_ID').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.ConvertPartPrices(aLine: TOrderLine; ordUnit, sellUnit: integer;
                   ordPrice, sellPrice: double): boolean;
var
  iFactor, iBoxQty: integer;
begin
//used when converting call offs to sales orders.
  iBoxQty := aLine.SellPackQuantity;

  with PriceUnitSQL do
  begin
    close;
    parambyname('Price_Unit').asinteger := ordunit;
    open;
    iFactor := fieldbyname('Price_unit_Factor').asinteger;
  end;

  aLine.SellPackQuantity := iFactor;
  aLine.PurchPackQuantity :=iFactor;

  if iFactor = 0 then
  begin
    if iBoxQty > 0 then
      aLine.Part_Cost := OrdPrice / iBoxQty
    else
      aLine.Part_Cost := OrdPrice;
  end
  else
  begin
    if iBoxQty > 0 then
      aLine.Part_Cost := (iBoxQty/ifactor)*OrdPrice
    else
      aLine.Part_Cost := ifactor * OrdPrice;
  end;

  with PriceUnitSQL do
  begin
    close;
    parambyname('Price_Unit').asinteger := sellUnit;
    open;
    iFactor := fieldbyname('Price_unit_Factor').asinteger;
  end;

  if iFactor = 0 then
  begin
    if iBoxQty > 0 then
      aLine.Sell_Price := SellPrice / iBoxQty
    else
      aLine.Sell_Price := SellPrice;
  end
  else
  begin
    if iBoxQty > 0 then
      aLine.Sell_Price := (iBoxQty/ifactor)*SellPrice
    else
      aLine.Sell_Price := ifactor * SellPrice;
  end;
end;

procedure TSTSalesOrdDM.UpdateRepPerc(SO: TSalesOrder);
var
  icount: Integer;
begin {Update the sales order lines}
  for icount := 0 to Pred(SO.RepLines.Count) do
  begin
    if SO.RepLines[icount].ActnTkn = 'A' then
        HandleSORepPerc(AddSOLineRepPercSQL, icount, SO)
      else
      if SO.RepLines[icount].ActnTkn = 'C' then
          HandleSORepPerc(UpdSOLineRepPercSQL, icount, SO)
        else
          if SO.RepLines[icount].ActnTkn = 'D' then
          HandleSORepPerc(DelSOLineRepPercSQL, icount, SO);
  end;
end;

procedure TSTSalesOrdDM.HandleSORepPerc(Query: TQuery; const inx: integer; SO:TSalesOrder);
var
  i: Integer;
begin
  with DelAllRepPercSQL do
    begin
      close;
      ParamByName('Sales_Order').AsInteger := SO.SONumber;
      execsql;
    end;

  with Query, SO.RepLines[inx] do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].Clear;
    if query.name = 'UpdSOLineRepPercSQL' then
    begin
    ParamByName('Sales_Order').AsInteger := SO.SONumber;
    ParamByName('Rep').AsInteger := Rep;
    ParamByName('Rep_Percentage').AsFloat := Percentage;
    end ;
    if query.name= 'AddSOLineRepPercSQL' then
    begin
    ParamByName('Sales_Order').AsInteger := SO.SONumber;
    ParamByName('Rep').AsInteger := Rep;
    ParamByName('Rep_Percentage').AsFloat := Percentage;
    end;
    if query.name = 'DelSOLineRepPercSQL' then
    begin
     ParamByName('Sales_Order').AsInteger := SO.SONumber;
      ParamByName('Rep').AsInteger := Rep;
    end;
    ExecSQL;
  end;
end;

function TSTSalesOrdDM.SaveToDB(SO: TSalesOrder): boolean;
begin
    Result := False;
    if SO.OrderLines.Count = 0 then
    begin
      MessageDlg('You must add some lines to the order first', mtError,
        [mbOK], 0);
      Exit;
    end;

    SO.SoNumber := GetNextSONumber;
    with AddSQL, SO do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Office_Contact').AsInteger := SO.OfficeContact;
      ParamByName('Operator').AsInteger := SO.Operator;
      ParamByName('Date_Reqd').AsDateTime := SO.DateReq;
      ParamByName('Date_Ordrd').AsDateTime := SO.DatePoint;
      ParamByName('Cust_Order_No').AsString := SO.CustOrderNo;
      ParamByName('Customer').AsInteger := SO.Customer;
      ParamByName('Branch_No').AsInteger := SO.BranchNo;
      if CostCentre = '' then
        begin
          ParamByName('Cost_Centre').clear;
          ParamByName('Customer0').clear;
        end
      else
        begin
          ParamByName('Cost_Centre').Asstring := SO.CostCentre;
          ParamByName('Customer0').AsInteger := SO.Customer;
        end;

      ParamByName('Order_Type').AsString := SO.SOType;
      ParamByName('Sales_Order_Head_Status').AsInteger := SO.SOHeadStatus;
      ParamByName('Narrative').Clear;
      ParamByName('Contact_No').AsInteger := SO.CustomerContactNo;
      ParamByName('Delivery_Notes').Asstring := SO.DeliveryNotes;
      ParamByName('Delivery_Customer').Asinteger := SO.DeliveryCustomer;
      ParamByName('Delivery_Branch').Asinteger := SO.DeliveryBranch;
      Parambyname('Replenish_source').asinteger := SO.ReplenishSource;
      if ReplenishSource = 1 then   {Supplier}
        begin
          Parambyname('Supplier').asinteger := SO.Supplier;
          Parambyname('Branch_no0').asinteger := SO.BranchNo0;
          Parambyname('Supp_Order_type').asstring := So.SupplierOrderType;
          parambyname('Part_Store').asinteger := SO.PartStore;
        end
      else                          {Warehouse}
        begin
          parambyname('Part_Store').asinteger := SO.PartStore;
          Parambyname('Supplier').clear;
          Parambyname('Branch_no0').clear;
          Parambyname('Supp_Order_type').clear;
        end;
      if AdHocAddress = 0 then
        ParamByName('Ad_Hoc_Address').clear
      else
        ParamByName('Ad_Hoc_Address').AsInteger := SO.AdHocAddress;

      if ProductionLocation = 0 then
        ParamByName('Production_Location').clear
      else
        ParamByName('Production_Location').AsInteger := SO.ProductionLocation;
      ExecSQL;
    end;
    UpdateSOLines(SO);
    UpdateRepPerc(SO);
    CreateExtraChargeLine(SO);
    //MessageDlg('The sales order number is : ' +
    //  IntToStr(SO.SONumber), mtInformation, [mbOK], 0);
    Result := True;
end;

function TSTSalesOrdDM.GetCustDefVat(cust: integer; vat_code: integer; vat: double): boolean;
begin
  with qryGetCustVat do
  begin
    Close;
    ParamByName('Customer').AsInteger := cust;
    Open;
    vat := FieldByName('Vat_Rate').AsFloat;
    vat_code := FieldByName('Vat_code').AsInteger;
    Result := true;
    Close;
  end;
end;

function TSTSalesOrdDM.GetSalesNominal: String;
begin
  with qryCompanyDtls do
  begin
    Close;
    ParamByName('Company').AsInteger := 1;
    Open;
    Result := FieldByName('Sales_Nom_Def').AsString;
    Close;
  end;
end;

function TSTSalesOrdDM.ConvertCallOff(Cust, CustBr: integer;
  CustOrdNo: string; DateReq: TDateTime; SO: TSalesOrder): Boolean;
var
  rLine : TRepLine;
  aLine : TOrderLine;
  anExCharge : TExtraCharge;
  LineNo : integer;
  ChargeNo : integer;
  SalesNominal : string;
begin
  LineNo := 0;
  ChargeNo := 0;
  SalesNominal := 'unknown';

  with qryGetCallOffDtls do
  begin
    Close;
    ParamByName('Customer').AsInteger := Cust;
    ParamByName('Branch_No').AsInteger := CustBr;
    ParamByName('Cust_order_No').AsString := CustOrdNo;
    ParamByName('Goods_required').AsDate := DateReq;
    Open;
    First;
    //copy common details to sales order header
    SO.OfficeContact := FieldByName('Office_Contact').AsInteger;
    SO.Operator := FieldByName('Operator').AsInteger;
    SO.DateReq := DateReq;
    SO.DatePoint := FieldByName('Date_Point').AsDateTime;
    SO.CustOrderNo := CustOrdNo;
    SO.Customer := Cust;
    SO.BranchNo := CustBr;
    SO.CustomerContactNo := FieldByName('Contact_No').AsInteger;
    SO.SOType := 'S';
    SO.SOHeadStatus := 10;
    SO.PartStore := 1;
    SO.ReplenishSource := 2;

    //add delivery details
    with qryGetDelivDtls do
    begin
      Close;
      ParamByName('purchase_order').AsFloat := qryGetCallOffDtls.FieldByName('purchase_order').AsFloat;
      Open;
      SO.DeliveryCustomer := FieldByName('Customer').AsInteger;
      SO.DeliveryBranch := FieldByName('Branch_No0').AsInteger;
      SO.DeliveryNotes := FieldByName('Delivery_Instructions').AsString;
      Close;
    end;

    //add rep line details
    rLine := TRepLine.Create;
    rLine.Rep := FieldByName('Rep').AsInteger;
    rline.Percentage := 0;
    rLine.ActnTkn := 'A';
    SO.RepLines.Add(rLine);

    //loop thru record set, create line on sales order for each call off
    while not EOF do
    begin
      LineNo := LineNo + 1;
      aLine := TOrderLine.Create;
      aLine.Line := LineNo;
      aLine.Part := GetFormRefID(FieldByName('Form_Reference').AsInteger);

      if (PartExists(aLine.Part) <> true) then
      begin
        LineNo := LineNo - 1;
        aLine.Free;
        MessageDlg('Part: '+ aLine.Part + ' does not exist.'+#13#10+
               'Cannot create Sales Order Line for call off.', mtWarning, [mbOk], 0);
        continue;
      end;

      ConvertPartPrices(aLine, FieldByName('Order_Unit').AsInteger, FieldByName('Sell_Unit').AsInteger,
                   FieldByName('Order_Price').AsFloat, FieldByName('Selling_price').AsFloat);
      try
        aLine.SellPackQuantity := StrToInt(FieldByName('Forms_Per_Box').AsString);
        aLine.PurchPackQuantity := StrToInt(FieldByName('Forms_Per_Box').AsString);
      except
      end;
      aLine.OrdQty := Round(FieldByName('Quantity').AsFloat / aLine.SellPackQuantity);
      aLine.AllocQty := 0;
      aLine.DelQty := 0;
      aLine.SOLineStatus := 10;
      aLine.InvQty := 0;
      aLine.VatCode := FieldByName('Vat_Code').AsInteger;
      aLine.Disc_Type := '';
      aLine.Disc_Val := 0;
      aLine.OriginalSellPrice := aLine.Sell_Price;
      aLine.ActnTkn := 'A';
      SO.OrderLines.Add(aLine);
      //check for extra charges
      with qryGetPOAddChgs do
      begin
        Close;
        ParamByName('Purchase_Order').AsFloat := qryGetCallOffDtls.FieldByName('purchase_order').AsFloat;
        ParamByName('Line').AsInteger := qryGetCallOffDtls.FieldByName('line').AsInteger;
        Open;
        First;
        while not EOF do
        begin
          if FieldByName('Quotation_Price').AsFloat <> 0 then
          begin
            ChargeNo := ChargeNo + 1;
            anExCharge := TExtraCharge.Create();
            anExCharge.AdditionalCharge := ChargeNo;
            anExCharge.Amount := FieldByName('Quotation_Price').AsFloat;
            anExCharge.Details := FieldByName('Details').AsString;
            GetCustDefVat(qryGetCallOffDtls.FieldByName('Customer').AsInteger, anExCharge.ChgVatCode, anExCharge.Vat);
            if SalesNominal = 'unknown' then
              SalesNominal := GetSalesNominal;
            anExCharge.NominalCode := SalesNominal;
            SO.ExtraCharges.Add(anExCharge);
          end;
          next;
        end;
      end;
      next;
    end;
  end;
end;

procedure TSTSalesOrdDM.CreateExtraChargeLine(SO: TSalesOrder);
var
icount: integer;
begin
 {Insert a new Invoice Line record}
  for icount := 0 to pred(SO.ExtraCharges.Count) do
    with SO.ExtraCharges[iCount] do
    begin
      with STSalesOrdDM.AddOrdExtChgSQL do
      begin
        Close;
        ParamByName('Sales_Order').AsInteger := SO.SONumber;
        ParamByName('Additional_Charge').AsInteger := AdditionalCharge;
        ParamByName('Details').Asstring := Details;
        ParamByName('Nominal').AsString := NominalCode;
        ParamByName('Amount').AsFloat := Amount;
        ParambyName('Vat_Code').asinteger := ChgVatCode;
        ParamByName('Cost').AsFloat := Cost;
        ExecSQL;
      end;
    end;
end;

function TSTSalesOrdDM.PartExists(part: String): boolean;
begin
  with GetPartDetsSQL do
  begin
    close;
    paramByName('Part').AsString := part;
    open;
    if recordcount < 1 then
      Result := false
    else
      Result := true;
  end;
end;

function TSTSalesOrdDM.GetPartCost(part: String): double;
begin
  with GetPartDetsSQL do
  begin
    close;
    paramByName('Part').AsString := part;
    open;
    result := fieldbyname('Part_Purchase_Price').asfloat;
  end;
end;

function TSTSalesOrdDM.GetCredqty(soNumber, SOLine: Integer): integer;
begin
 with GetInvLineSQL do
  begin
    Result := 0;
    Close;
    ParamByName('OrderNo').AsInteger := SONumber;
    ParamByName('LineNo').AsInteger := SOLine;
    ParamByName('InvorCred').AsString := 'C';
    Open;
    if not eof then
      Result := FieldbyName('Qty_Invoiced').AsInteger * -1;
    Close;
  end;
end;

procedure TSTSalesOrdDM.DeleteInvLines(TempInv: Integer);
var
  iLine: Integer;
begin
  with GetDelInvLinesSQL do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := TempInv;
    Open;
    while not EOF do
    begin
      iLine := FieldByName('Invoice_Line_No').AsInteger;
      with DelInvLineSQL do
      begin
        ParamByName('Sales_Invoice').AsInteger := TempInv;
        ParamByName('Line').AsInteger := iLine;
        ExecSQL;
      end;
      Next;
    end;
    Close;
  end;
end;

procedure TSTSalesOrdDM.DeleteSalesInvoice(TempInv: Integer);
begin
  with DelInvSQL do
  begin
    ParamByName('Sales_Invoice').AsInteger := TempInv;
    ExecSQL;
  end;
end;

procedure TSTSalesOrdDM.LoadInvLineDets(var SalesOrder: TSalesOrder;
  iInvoiceNo: integer);
var
  aLine: TOrderLine;
begin
  SalesOrder.OrderLines.Clear;
  {Load the line details for order number TempOrd}
  with GetInvDetsSQL do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := iInvoiceNo;
    Open;
    while not EOF do
    begin
      aLine := TOrderLine.Create;
      with aLine do
      begin
        Line := FieldByName('Invoice_Line_No').AsInteger;
        OrderNo := FieldByName('Sales_Order').AsInteger;
        SOLineStatus := FieldByName('Sales_Order_Line_Status').AsInteger;
        PurchPackQuantity := fieldbyname('Purch_Pack_Quantity').asinteger;
        SellPackQuantity := fieldbyname('Sell_Pack_Quantity').asinteger;
        OrdQty := FieldByName('Quantity_Ordered').AsInteger;
        OrdQtyinPacks := ShowinPacks(FieldByName('Quantity_Ordered').AsInteger,SellPackQuantity);
        DelQty := FieldByName('Quantity_Delivered').AsInteger;
        DelQtyinPacks := ShowinPacks(FieldByName('Quantity_Delivered').AsInteger,SellPackQuantity);
        AllocQty := FieldByName('Quantity_Allocated').AsInteger;
        AllocQtyinPacks := ShowinPacks(FieldByName('Quantity_Allocated').AsInteger,SellPackQuantity);
        InvQty := FieldByName('Qty_Invoiced').AsInteger;
        InvQtyinPacks := ShowinPacks(FieldByName('Qty_Invoiced').AsInteger,SellPackQuantity);
        part := FieldByName('part').AsString;
        if invQty > 0 then
          sell_price := GetInvSellPrice(OrderNo,Line,'I') * SellPackQuantity
        else
          sell_price := fieldByName('Part_Sales_Price').asFloat;
        Credqty := fieldByName('Qty_Invoiced').AsInteger* -1;
        CredQtyinPacks := ShowinPacks(credqty, SellPackQuantity);
        if credqty > 0 then
          begin
            cred_price := fieldByName('Goods_Value').AsFloat * (SellPackQuantity * -1);
          end
        else
          cred_price := sell_price;
        disc_Type := fieldByName('Discount_Type').AsString;
        Disc_Val := fieldByName('Discount_Value').AsFloat;
        Part_cost := fieldByName('part_Cost').AsFloat;
        VatCode := fieldbyname('Vat_code').asinteger;
        OriginalSellPrice := fieldbyname('Original_Sell_Price').asfloat;
        end;
      SalesOrder.OrderLines.Add(aLine);
      Next;
    end;
    Close;
  end;

end;

function TSTSalesOrdDM.GetAdHocAddress(iTempCode: integer): string;
var
i: integer;
begin
 with QryGetAdHoc do
  begin
    Close;
    ParamByName('AdHoc').Asinteger := iTempCode;
    Open;
    Result := '';
    Result := fieldbyname('Name').asstring;
    for i := 2 to 6 do
      begin
        if fields[i].asstring = '' then
          begin
            next;
            continue;
          end;
        Result := Result + cLFCR + Fields[i].AsString;
        next
      end;
    Close;
  end;
end;

function TSTSalesOrdDM.GetAdHocName(iTempCode: integer): string;
begin
 with QryGetAdHoc do
  begin
    Close;
    ParamByName('AdHoc').Asinteger := iTempCode;
    Open;
    Result := '';
    Result := fieldbyname('Name').asstring;
  end;
end;

function TSTSalesOrdDM.GetProductionName(iTempCode: integer): string;
begin
 with QryGetProdLoc do
  begin
    Close;
    ParamByName('Production_Location').Asinteger := iTempCode;
    Open;
    Result := '';
    Result := fieldbyname('Production_Location_Name').asstring;
  end;
end;

procedure TSTSalesOrdDM.LoadSerialNoDets(var SalesOrder: TSalesOrder);
var
  aSerial: TSerialNumber;
  OrdInx: Integer;
begin
  {Load the additional details}
  with GetSOSerialNosSQL do
  begin
    Close;
    ParamByName('Sales_Order').asinteger := SalesOrder.SONumber;
    Open;
    while not EOF do
    begin
      aSerial := TSerialNumber.Create;
      with aSerial do
      begin
        Line := FieldByName('Sales_order_Line_no').AsInteger;
        SerialNo := FieldByName('Serial_Item_no').AsInteger;
        SerialItemFrom := fieldbyname('Serial_item_From').asstring;
        SerialItemTo := fieldbyname('Serial_item_to').asstring;
        if fieldbyname('Sets_per_pad').asinteger = 0 then
          SetsPerPad := 1
        else
          SetsPerPad := fieldbyname('Sets_per_pad').asinteger;
      end;
      { Fit the serial number into the correct order line }
      OrdInx := SalesOrder.OrderLines.IndexFromLineNo(aSerial.Line);
      SalesOrder.OrderLines[OrdInx].SerialNumbers.Add(aSerial);
      Next;
    end;
    Close;
  end;
end;

procedure TSTSalesOrdDM.DeleteSOSerialNos(SONumber, SOLine: integer);
begin
  with DelSOSerialNosSQL do
  begin
    ParamByName('Sales_order').Asfloat := SONumber;
    ParamByName('Sales_order_line_no').AsInteger := SOLine;
    ExecSQL;
  end;

  //remove the reference to this sales order line from any store_stock_serial_item
  //records
  with qryDelStrStckSOLineAlloc do
  begin
    ParamByName('Sales_order').Asfloat := SONumber;
    ParamByName('Sales_order_line_no').AsInteger := SOLine;
    ExecSQL;
  end;
end;

procedure TSTSalesOrdDM.DeleteStoreStockSerialItems(TempCode,
  TempLine: integer);
begin
  with DelStSTkSerialNosSQL do
    begin
      close;
      parambyname('Store_Stock').asinteger := TempCode;
      parambyname('Serial_item_no').asinteger := TempLine;
      execsql;
    end;
end;

function TSTSalesOrdDM.GetNextStoreStockSerialNo(TempCode: integer): integer;
begin
  with GetNextStStkSerialNoSQL do
    begin
      close;
      parambyname('Store_Stock').asinteger := TempCode;
      open;
      result := fieldbyname('Last_Serial_no').asinteger + 1;
    end;
end;

procedure TSTSalesOrdDM.LoadStockSerialNoDets(var SalesOrder: TSalesOrder);
var
  aSerial: TStockSerialNo;
  OrdInx: Integer;
  i, inx: integer;
  iLine: integer;
begin
  for inx := 0 to pred(Salesorder.OrderLines.count) do
    begin
      iLine := SalesOrder.OrderLines[inx].Line;

      {Load the store stock serial details}
      with GetStockSerialNosSQL do
      begin
        Close;
        ParamByName('Part').asstring := Salesorder.OrderLines[inx].Part;
        Open;
        i := 0;

        while not EOF do
        begin
          if (fieldbyname('Sales_order').asinteger = 0) or
             (fieldbyname('Sales_order').asinteger = SalesOrder.SONumber) then
            begin
              aSerial := TStockSerialNo.Create;
              with aSerial do
              begin
                Line := iLine;
                SerialNo := i+1;
                SerialItemFrom := fieldbyname('Serial_item_From').asstring;
                SerialItemTo := fieldbyname('Serial_item_to').asstring;
                SerialItemNo := fieldbyname('Serial_item_no').asinteger;
                SalesOrder := fieldbyname('Sales_Order').asinteger;
                SalesOrderLine := fieldbyname('Sales_Order_line_no').asinteger;
                StoreStock := fieldbyname('Store_Stock').asinteger;
                if fieldbyname('Sets_per_pad').asinteger = 0 then
                  SetsPerPad := 1
                else
                  SetsperPad := fieldbyname('Sets_per_pad').asinteger;
              end;
              { Fit the serial number into the correct order line }
              OrdInx := SalesOrder.OrderLines.IndexFromLineNo(aSerial.Line);
              SalesOrder.OrderLines[OrdInx].StockSerialNos.Add(aSerial);
            end;
          Next;
        end;
        Close;
      end;
    end;
end;

procedure TSTSalesOrdDM.DeleteSOSerialNos(SOnum: integer);
begin
  self.qryDelSOSerialNos.ParamByName('sales_order').asInteger := SONum;
  self.qryDelSOSerialNos.ExecSQL;

  self.qryDelStoreStockSISOAlloc.ParamByName('Sales_order').Asfloat := SONum;
  self.qryDelStoreStockSISOAlloc.ExecSQL;
end;

procedure TSTSalesOrdDM.DeleteSOSundry(SONum: integer);
begin
  self.qryDelSOSundry.ParamByName('sales_order').asInteger := SONum;
  self.qryDelSOSundry.ExecSQL;
end;

procedure TSTSalesOrdDM.DeleteSORep(SONum: integer);
begin
  self.qryDelSORep.ParamByName('sales_order').asInteger := SONum;
  self.qryDelSORep.ExecSQL;
end;

procedure TSTSalesOrdDM.DeleteSONarrative(narrative: integer);
begin
  self.qryDelSONarrative.ParamByName('narrative').asInteger := narrative;
  self.qryDelSONarrative.ExecSQL;
end;

procedure TSTSalesOrdDM.DeleteSOPORef(SONum: integer);
begin
  self.qryDelSOPORef.ParamByName('sales_order').asInteger := SONum;
  self.qryDelSOPORef.ExecSQL;
end;

procedure TSTSalesOrdDM.UpdateSalesOrderStatus(iSorder: integer);
var
  AddChargeLines: integer;
begin
// new routine to update order status will eventually replace update sales order
  qrySOAddCharge.ParamByName('sales_order').asInteger := iSorder;
  qrySOAddCharge.open;

  AddChargeLines := qrySOAddCharge.fieldByName('LineCount').asInteger;
  qrySOAddCharge.close;

  With CheckSOStatusSQL do
  begin
    Close ;
    ParamByName('Sales_Order').AsInteger := iSorder;
    Open ;
    First ;
    with UpdOrderStatusSQL do
    begin
      Close;
      ParamByName('OrderNo').AsFloat := isorder;
      if CheckSOStatusSQL.FieldByName('Qty_Deliv').AsInteger = 0 then
        ParamByName('Status').AsInteger := shFullyInvoiced
      else
        begin
          If CheckSOStatusSQL.FieldByName('Qty_Inv').AsInteger = 0 then
           ParamByName('Status').AsInteger := shDespConfirmed
          else
            If CheckSOStatusSQL.FieldByName('Qty_Not_Inv').AsInteger > 0 then
              ParamByName('Status').AsInteger := shPartlyInvoiced
            else
            ParamByName('Status').AsInteger := ShFullyInvoiced;
        end;

      if (ParamByName('Status').AsInteger = shFullyInvoiced)
      and (AddChargeLines > 0 ) then
        ParamByName('Status').AsInteger := shPartlyInvoiced;

      ExecSql;
    end;
  end;
end;

function TSTSalesOrdDM.ConfirmSOStatus(SalesOrder: TSalesOrder): integer;
var
  lineNo: integer;
  noneInvoiced, allInvoiced, allDelivered, noneDelivered, nonePicked: boolean;
  stockAllocated: boolean;
begin
  noneInvoiced := true;
  allInvoiced := true;
  for lineNo := 0 to salesOrder.OrderLines.Count - 1 do
  begin
    qrySOLineInvdQty.close;
    qrySOLineInvdQty.ParamByName('SONum').asInteger := SalesOrder.SONumber;
    qrySOLineInvdQty.ParamByName('line').asInteger :=
      SalesOrder.OrderLines.Lines[lineNo].Line;
    qrySOLineInvdQty.open;

    if (noneInvoiced = true) then
    begin
      if (qrySOLineInvdQty.recordCount > 0)
      and (qrySOLineInvdQty.FieldByName('tot_invoiced').asInteger > 0) then
      begin
        noneInvoiced := false;
      end;
    end;


    if (allInvoiced = true) then
    begin
      if ((qrySOLineInvdQty.recordCount = 0)
      or ((qrySOLineInvdQty.recordCount > 0)
        and (qrySOLineInvdQty.FieldByName('tot_invoiced').asInteger <
             SalesOrder.OrderLines.Lines[lineNo].DelQty))) then
      begin
        allInvoiced := false;
      end;
    end;

    qrySOLineInvdQty.close;

    if (allInvoiced = false) and (noneInvoiced = false) then
    begin
      //part invoiced
      break;
    end;
  end;

  if allInvoiced then
  begin
    result := 250;
    exit;
  end;

  if not noneInvoiced then
  begin
    result := 200;
    exit;
  end;

  //otherwise no invoicing done and we have to calculate the
  //status based on deliveries
  allDelivered := true;
  noneDelivered := true;
  nonePicked := true;
  for lineNo := 0 to salesOrder.OrderLines.Count - 1 do
  begin
    qrySOLineDelivQty.close;
    qrySOLineDelivQty.ParamByName('SONum').asInteger := SalesOrder.SONumber;
    qrySOLineDelivQty.ParamByName('line').asInteger :=
      SalesOrder.OrderLines.Lines[lineNo].Line;
    qrySOLineDelivQty.open;

    if (nonePicked = true) then
    begin
      if (qrySOLineDelivQty.recordCount > 0)
      and (qrySOLineDelivQty.FieldByName('tot_picked').asInteger <> 0) then
      begin
        nonePicked := false;
      end;
    end;

    if (noneDelivered = true) then
    begin
      if (qrySOLineDelivQty.recordCount > 0)
      and (qrySOLineDelivQty.FieldByName('tot_delivered').asInteger > 0) then
      begin
        noneDelivered := false;
      end;
    end;

    if (allDelivered = true) then
    begin
      if ((qrySOLineDelivQty.recordCount = 0)
      or ((qrySOLineDelivQty.recordCount > 0)
        and (qrySOLineDelivQty.FieldByName('tot_delivered').asInteger <
             SalesOrder.OrderLines.Lines[lineNo].DelQty))) then
      begin
        allDelivered := false;
      end;
    end;

    qrySOLineDelivQty.close;

    if (allDelivered = false) and (noneDelivered = false) then
    begin
      //part delivered
      break;
    end;
  end;

  if allDelivered then
  begin
    result := 150;
    exit;
  end;

  if not noneDelivered then
  begin
    result := 100;
    exit;
  end;

  if not nonePicked then
  begin
    result := 50;
    exit;
  end;

  qryPObySO.close;
  qryPObySO.ParamByName('SONum').asInteger := SalesOrder.SONumber;
  qryPObySO.open;
  if qryPObySO.RecordCount > 0 then
  begin
    Result := 30;
  end
  else
  begin
    Result := 10;
  end;
  qryPObySO.close;
end;

function TSTSalesOrdDM.CheckContractLink(SONum, lineNo: integer;
  var contractNo: integer): boolean;
begin
  //checks if a sales order line is referenced in a contract and if so
  //returns the contract number
  qrySelContractbySO.Close;
  qrySelContractbySO.ParamByName('Sales_Order').asInteger := SONum;
  qrySelContractbySO.ParamByName('Sales_Order_Line_No').asInteger := lineNo;
  qrySelContractbySO.Open;

  if qrySelContractbySO.RecordCount > 0 then
    contractNo := qrySelContractbySO.FieldByName('Contract').asInteger;

  Result := (qrySelContractbySO.RecordCount > 0);

  qrySelContractbySO.Close;
end;

function TSTSalesOrdDM.GetNextJobBagLineNumber(tempNo: integer): integer;
begin
  with GetLastJBLineSQL do
    begin
      Close;
      parambyname('Job_Bag').asinteger := tempNo;
      Open;
      Result := FieldByName('Last_JB_Line_Number').AsInteger + 1;
      Close;
    end;
end;

function TSTSalesOrdDM.GetJobBagLine(tempNo, templine: integer): integer;
begin
  result := 0;
  with qryGetJBLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempNo;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Job_Bag_line').asinteger;
    end;
end;

function TSTSalesOrdDM.GetJobBagRequest(tempNo, templine: integer): integer;
begin
  result := 0;
  with qryGetJBRequest do
    begin
      close;
      parambyname('Sales_order').asinteger := tempNo;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Request_no').asinteger;
    end;
end;

function TSTSalesOrdDM.GetJobBagNumber(tempNo, templine: integer): integer;
begin
  result := 0;
  with qryGetJBLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempNo;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Job_Bag').asinteger;
    end;
end;

function TSTSalesOrdDM.GetAccountTeamName(tempCode: integer): string;
begin
  with qryGetAccountTeam do
    begin
      close;
      parambyname('Account_Team').asinteger := tempCode;
      open;
      result := fieldbyname('Account_Team_Name').asstring;
    end;
end;

function TSTSalesOrdDM.GetNextJobBagRequest(tempNo: integer): integer;
begin
  with GetLastJBRequestSQL do
    begin
      Close;
      parambyname('Job_Bag').asinteger := tempNo;
      Open;
      Result := FieldByName('Last_JB_Request_Number').AsInteger + 1;
      Close;
    end;
end;

end.
