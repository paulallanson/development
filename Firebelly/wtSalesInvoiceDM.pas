unit wtSalesInvoiceDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, allCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSIMode   = (siAdd, siChange, siDelete, siRaise, siView);
  TSILMode   = (silAdd, silChange, silDelete, silView);
  TSICMode   = (sicAdd, sicChange, sicDelete, sicView);

  TdtmdlSalesInvoice = class(TDataModule)
    dsDummy: TDataSource;
    qryPEnd: TFDQuery;
    qryPOUpLine: TFDQuery;
    qrySIHeader: TFDQuery;
    qrySIAllLines: TFDQuery;
    qrySILine: TFDQuery;
    qrySIAddLine: TFDQuery;
    qrySIGetLast: TFDQuery;
    qrySIAddHeader: TFDQuery;
    qryZero: TFDQuery;
    qrySICharges: TFDQuery;
    qrySIAddCharge: TFDQuery;
    qrySILineChgs: TFDQuery;
    qrySIAddLineChg: TFDQuery;
    qrySIAllCharges: TFDQuery;
    dsSIHeaderGrid: TDataSource;
    qrySIHeaderGrid: TFDQuery;
    qryOperator: TFDQuery;
    dsOperator: TDataSource;
    qryGetCustomer: TFDQuery;
    qryGetPO: TFDQuery;
    qryGetSO: TFDQuery;
    qryGetJB: TFDQuery;
    qrySIUpHeader: TFDQuery;
    qryCustReps: TFDQuery;
    qrySIAllLineChgs: TFDQuery;
    qryGetVat: TFDQuery;
    qryGetPriceUnit: TFDQuery;
    qryCompany: TFDQuery;
    qryPOAllLines: TFDQuery;
    dsPOLine: TDataSource;
    qryPOAll: TFDQuery;
    qryPODeliv: TFDQuery;
    oldqryPOLine: TFDQuery;
    qryGetInvStatus: TFDQuery;
    dsSOAll: TDataSource;
    qryJBAll: TFDQuery;
    dsJBAll: TDataSource;
    qrySOHeader: TFDQuery;
    qrySOLines: TFDQuery;
    qryJBHeader: TFDQuery;
    qryJBLines: TFDQuery;
    qryGetPType: TFDQuery;
    qryPOChkStatus: TFDQuery;
    qryPOUpHead: TFDQuery;
    qrySOUpLine: TFDQuery;
    qrySOChkStatus: TFDQuery;
    qrySOUpHead: TFDQuery;
    qryJBUpLine: TFDQuery;
    qryRep: TFDQuery;
    dsRep: TDataSource;
    qryJBChkStatus: TFDQuery;
    qryJBUpHead: TFDQuery;
    qrySOLine: TFDQuery;
    qryJBLine: TFDQuery;
    qryPOLineChgs: TFDQuery;
    qryCustInvTo: TFDQuery;
    qryPOLine: TFDQuery;
    qryGetRep: TFDQuery;
    qryJBLineChgs: TFDQuery;
    dsJBLines: TDataSource;
    qrySCHeaderGrid: TFDQuery;
    dsSCHeaderGrid: TDataSource;
    qrySOChgs: TFDQuery;
    qrySOHead: TFDQuery;
    qryPO2bInvoiced: TFDQuery;
    qryPeriodEnd: TFDQuery;
    qrySOAll: TFDQuery;
    qryGetAddress: TFDQuery;
    qrySIHeaderGridInvoice_Date: TDateTimeField;
    qrySIHeaderGridCustomer: TIntegerField;
    qrySIHeaderGridInactive: TWideStringField;
    qrySIHeaderGridInvoice_or_Credit: TWideStringField;
    qrySIHeaderGridCustomer_Name: TWideStringField;
    qrySIHeaderGridStatus_Description: TWideStringField;
    qrySIHeaderGridGoods_Value: TFloatField;
    qrySIHeaderGridVat_Value: TFloatField;
    qrySIHeaderGridTotal_Value: TFloatField;
    qrySIHeaderGridInvoice_no: TWideStringField;
    qrySIHeaderGridSales_invoice_status: TIntegerField;
    qrySIHeaderGridSales_Invoice: TIntegerField;
    qrySIHeaderGridReference: TWideStringField;
    qrySIHeaderGridDescription: TWideStringField;
    qrySCHeaderGridInvoice_Date: TDateTimeField;
    qrySCHeaderGridCustomer: TIntegerField;
    qrySCHeaderGridInactive: TWideStringField;
    qrySCHeaderGridInvoice_or_Credit: TWideStringField;
    qrySCHeaderGridOriginal_Name: TWideStringField;
    qrySCHeaderGridStatus_Description: TWideStringField;
    qrySCHeaderGridGoods_Value: TFloatField;
    qrySCHeaderGridVat_Value: TFloatField;
    qrySCHeaderGridGoods_Credit: TFloatField;
    qrySCHeaderGridVAT_Credit: TFloatField;
    qrySCHeaderGridInvoice_no: TWideStringField;
    qrySCHeaderGridSales_invoice_status: TIntegerField;
    qrySCHeaderGridSales_Invoice: TIntegerField;
    qrySCHeaderGridReference: TWideStringField;
    qrySCHeaderGridDescription: TWideStringField;
    qrySCHeaderGridCustomer_Name: TWideStringField;
    qrySCHeaderGridTotal_Credit: TFloatField;
    qryGetSOQuote: TFDQuery;
    qryPaymentTerms: TFDQuery;
    dsPaymentTerms: TDataSource;
    qryGetCustTypeNominal: TFDQuery;
    qryCheckInvoice: TFDQuery;
    qrySIHeaderGridIs_Retail_Customer: TWideStringField;
    qrySCHeaderGridIs_Retail_Customer: TWideStringField;
    qrySIHeaderGridPaid_Amount: TFloatField;
    qrySIHeaderGridPaid_Status: TWideStringField;
    qrySIHeaderGridDeposit_Amount: TFloatField;
    qryGetSOLines: TFDQuery;
    qryGetCustomerVat: TFDQuery;
    qrySIHeaderBase: TFDQuery;
    qrySIHeaderGridRep_Name: TWideStringField;
    qrySIHeaderGridOperator_Name: TWideStringField;
    qrySIHeaderGridAccount_Manager_Name: TWideStringField;
    qrySCHeaderBase: TFDQuery;
    qrySCHeaderGridRep_Name: TWideStringField;
    qrySCHeaderGridOperator_Name: TWideStringField;
    qrySCHeaderGridAccount_Manager_Name: TWideStringField;
    qrySIHeaderGridOrder_Reference: TWideStringField;
    qrySCHeaderGridOrder_Reference: TWideStringField;
    qrySIHeaderGridAccount_Code: TWideStringField;
    qryRevenueCentre: TFDQuery;
    dtsRevenueCentre: TDataSource;
    qrySIHeaderBaseOlder: TFDQuery;
    qrySIHeaderGridBranch_Name: TWideStringField;
    qrySIHeaderGridDate_Required: TDateTimeField;
    qrySCHeaderBaseOlderStill: TFDQuery;
    qrySCHeaderGridBranch_Name: TWideStringField;
    qrySIHeaderBaseOld: TFDQuery;
    qrySIHeaderGridRevenue_Centre_Descr: TWideStringField;
    qrySCHeaderBaseOlder: TFDQuery;
    qrySCHeaderGridRevenue_Centre_Descr: TWideStringField;
    qrySCHeaderOld: TFDQuery;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    StringField1: TWideStringField;
    StringField2: TWideStringField;
    StringField3: TWideStringField;
    StringField4: TWideStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField5: TWideStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField6: TWideStringField;
    StringField7: TWideStringField;
    StringField8: TWideStringField;
    FloatField5: TFloatField;
    StringField9: TWideStringField;
    StringField10: TWideStringField;
    StringField11: TWideStringField;
    StringField12: TWideStringField;
    StringField13: TWideStringField;
    StringField14: TWideStringField;
    StringField15: TWideStringField;
    qrySIHeaderGridOriginal_Name: TWideStringField;
    procedure qrySIHeaderGridCalcFields(DataSet: TDataSet);
  private
    function GetCreditHeaderCount: integer;
    function GetCurrentCreditNote: integer;
    function GetCurrentSInvoice: integer;
    function GetHeaderCount: integer;
    function GetInvoiceStatus(tempcode: integer): string;
    function GetNextSINumber: integer;
  public
    Customer: string;
    CustomerOrder: string;
    Description: string;
    DefaultNominal: string;
    DisplayAllOrders: bytebool;
    DisplayArchived: bytebool;
    DisplayFuture: bytebool;
    DisplayInactive: bytebool;
    DisplaySuppInvoiced: bytebool;
    DisplayUnFitted: bytebool;
    CustomerName: string;
    JBNumber: integer;
    InvoiceDate: TDateTime;
    InvoiceQty: integer;
    Line: integer;
    OfficeContact: string;
    OperatorName: string;
    OrderStatus: integer;
    ProjectReference: string;
    PONumber: real;
    SONumber: integer;
    SInvoiceNumber: integer;
    SiteName: string;
    ShowInactive: boolean;
    SortType: string;
    SortOrder: string;
    Status: string;
    RevenueCentre: integer;
    Reference: string;
    RepName: string;
    TradeRetail: integer;
    function CheckInvoiceUnique(tempInvoiceNo: string; tempInvoiceID: integer): boolean;
    function GetAccountCode(tempCust: integer): string;
    function GetCustomerAddress(tempCust: integer): string;
    function GetInvoiceAddress(tempAddr: integer): string;
    function GetNarrative(const iNarrative: integer): string;
    function GetNominaltype: string;
    function GetPTypeNominal(tempCode: integer): string;
    function GetPTypeDesc(tempCode: integer): string;
    function GetPUnitDescription(tempCode: integer): string;
    function GetPUnitFactor(tempCode: integer): integer;
    function GetDefPriceUnit: integer;
    function GetDefSalesNominal: string;
    function GetLastPeriodEndDate: TDateTime;
    function GetCustomerTypeNominal(tempCode: integer): string;
    function GetProductNominal(tempCode: integer; tempLine: integer): string;
    function GetMaterialNominal(tempCode: integer; tempLine: integer): string;
    function GetWorkTopTypeRetailNominal(tempCode, tempLine: integer): string;
    function GetWorkTopTypeTradeNominal(tempCode, tempLine: integer): string;
    function GetSOPart(tempCode: integer; tempLine: integer): string;
    function GetVATRate(tempCode: integer): real;
    function GetVATReverseCharge(tempCode: integer): boolean;
    function SetReverseCharge(tempCust: integer): boolean;
    property CurrentCreditNote : integer read GetCurrentCreditNote;
    property CurrentSInvoice : integer read GetCurrentSInvoice;
    procedure ListAllLines(const aKey : integer);
    procedure RefreshData;
    procedure RefreshCreditData;
    procedure RefreshJBData;
    procedure RefreshJBLData;
    procedure RefreshPOData;
    procedure RefreshSOData;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    function UsingSearch: boolean;
    property CreditHeaderCount: integer read GetCreditHeaderCount;
    property HeaderCount: integer read GetHeaderCount;
  end;

  TSalesInvoice     = class;

  TSalesInvoiceLine = class
  private
    FGoodsValue: currency;
    FIntNarr: integer;
    FProductType: integer;
    FPriceUnit: integer;
    FPOLine: integer;
    FSONumber: integer;
    FJBNumber: integer;
    FNarrative: integer;
    FJBLine: integer;
    FVatCode: integer;
    FPONumber: real;
    FQuantity: real;
    FNominal: string;
    FNarrativeText: string;
    FIntNarrText: string;
    FReference: string;
    FParent: TSalesInvoice;
    FSOLine: integer;
    FSILine: integer;
    FPriceUnitDescr: string;
    FVATRate: real;
    FOriginalQty: real;
    FQtyOutstanding: real;
    FDescription: string;
    FCreditType: string;
    FPackQty: integer;
    FVatValue: real;
    FNotPrinted: string;
    FCostPrice: currency;
    FProductTypeDesc: string;
    FUnitPrice: currency;
    FSellUnit: integer;
    FJob: integer;
    FVATDescription: string;
    FVATReverseCharge: boolean;
    function GetTotalGoods: currency;
    function GetJBDescription(tempCode: integer): string;
    function GetPODescription(tempCode: real; tempLine: integer): string;
    function GetSODescription(tempCode: integer; tempLine: integer): string;
    function GetPOLineOutQty(tempCode: real; tempLine: integer): integer;
    function GetSOLineOutQty(tempCode: integer; tempLine: integer): integer;
    function GetJBLineOutQty(tempCode: integer): integer;
    function GetPackQty(tempCode, tempLine: integer): integer;
    procedure SetGoodsValue(const Value: currency);
    procedure SetIntNarr(const Value: integer);
    procedure SetIntNarrText(const Value: string);
    procedure SetJBLine(const Value: integer);
    procedure SetJBNumber(const Value: integer);
    procedure SetNarrative(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetNominal(const Value: string);
    procedure SetParent(const Value: TSalesInvoice);
    procedure SetPOLine(const Value: integer);
    procedure SetPONumber(const Value: real);
    procedure SetPriceUnit(const Value: integer);
    procedure SetProductType(const Value: integer);
    procedure SetQuantity(const Value: real);
    procedure SetReference(const Value: string);
    procedure SetSONumber(const Value: integer);
    procedure SetVatCode(const Value: integer);
    procedure SetSOLine(const Value: integer);
    procedure SetSILine(const Value: integer);
    procedure SetPriceUnitDescr(const Value: string);
    procedure SetVATRate(const Value: real);
    procedure SetOriginalQty(const Value: real);
    procedure SetQtyOutstanding(const Value: real);
    procedure SetDescription(const Value: string);
    procedure SetCreditType(const Value: string);
    procedure SetPackQty(const Value: integer);
    procedure SetVatValue(const Value: real);
    procedure SetNotPrinted(const Value: string);
    procedure SetCostPrice(const Value: currency);
    procedure SetProductTypeDesc(const Value: string);
    procedure SetJob(const Value: integer);
    procedure SetSellUnit(const Value: integer);
    procedure SetUnitPrice(const Value: currency);
    procedure SetVATDescription(const Value: string);
    procedure SetVATReverseCharge(const Value: boolean);
  public
    constructor Create(SalesInvoice : TSalesInvoice);
    destructor Destroy; override;
    function Clone : TSalesInvoiceLine;
    procedure LoadFromDB;
    procedure SaveToDB;
    procedure SaveToPO;
    procedure SaveToSO;
    procedure SaveToJB;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property CreditType: string read FCreditType write SetCreditType;
    property Description: string read FDescription write SetDescription;
    property GoodsValue: currency read FGoodsValue write SetGoodsValue;
    property Job: integer read FJob write SetJob;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property NotPrinted: string read FNotPrinted write SetNotPrinted;
    property Nominal: string read FNominal write SetNominal;
    property Parent: TSalesInvoice read FParent write SetParent;
    property PackQty: integer read FPackQty write SetPackQty;
    property Quantity: real read FQuantity write SetQuantity;
    property QtyOutstanding: real read FQtyOutstanding write SetQtyOutstanding;
    property OriginalQty: real read FOriginalQty write SetOriginalQty;
    property SellUnit: integer read FSellUnit write SetSellUnit;
    property SILine: integer read FSILine write SetSILine;
    property SOLine: integer read FSOLine write SetSOLine;
    property SONumber: integer read FSONumber write SetSONumber;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
    property VatCode: integer read FVatCode write SetVatCode;
    property VATDescription: string read FVATDescription write SetVATDescription;
    property VATRate: real read FVATRate write SetVATRate;
    property VATReverseCharge: boolean read FVATReverseCharge write SetVATReverseCharge;
    property VatValue: real read FVatValue write SetVatValue;
    property TotalGoods: currency read GetTotalGoods;
  end;

  TSalesInvoiceLines = class;

  TSalesInvoiceLines  = class
  private
    FParent: TSalesInvoice;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TSalesInvoiceLine;
    procedure SetItems(Index: integer; const Value: TSalesInvoiceLine);
  public
    constructor Create(SalesInvoice : TSalesInvoice);
    destructor Destroy; override;
    procedure Add(aLine : TSalesInvoiceLine);
    procedure Clear;
    function  Clone : TSalesInvoiceLines;
    procedure Delete(const Index : integer);
    function  IndexOf(const LineNumber: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TSalesInvoiceLine read GetItems write SetItems;
      default;
    property Parent : TSalesInvoice read FParent;
  end;

  TSalesInvoice = class
  private
    FPaidAmount: currency;
    FOperator: integer;
    FNarrative: integer;
    FCustomer: integer;
    FSalesInvoiceLines : TSalesInvoiceLines;
    FSIStatus: integer;
    FdbKey: integer;
    FNarrativeText: string;
    FSIStatusDesc: string;
    FSINumber: string;
    FCustomerName: string;
    FPaidStatus: string;
    FSIDate: TDateTime;
    FPaidDate: TDateTime;
    FInactive: string;
    FInvoiceOrCredit: string;
    FSIType: string;
    FAccountCode: string;
    FRep: integer;
    FReference: string;
    FInvoiceDescription: string;
    FIntNarrative: integer;
    FIntNarrativeText: string;
    FDataModule: TdtmdlSalesInvoice;
    FInvoiceAddress: integer;
    FRetailCustomer: string;
    FDepositAmount: currency;
    FAccountManager: integer;
    FOperatorName: string;
    FPaymentTerms: integer;
    FSpeculative: boolean;
    FRevenueCentre: integer;
    FCustomerBranch: integer;
    FCustomerBranchName: string;
    FBranchExist: boolean;
    procedure DeleteLines;
    procedure SaveCreditLines;
    procedure SaveLines;
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetdbKey(const Value: integer);
    procedure SetNarrative(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetPaidAmount(const Value: currency);
    procedure SetPaidDate(const Value: TDateTime);
    procedure SetPaidStatus(const Value: string);
    procedure SetSIDate(const Value: TDateTime);
    procedure SetSINumber(const Value: string);
    procedure SetSIStatus(const Value: integer);
    procedure SetSIStatusDesc(const Value: string);
    procedure SetInactive(const Value: string);
    procedure SetInvoiceOrCredit(const Value: string);
    procedure SetSIType(const Value: string);
    function GetTotalGoods: currency;
    function GetTotalVAT: currency;
    procedure SetAccountCode(const Value: string);
    procedure SetRep(const Value: integer);
    procedure SetReference(const Value: string);
    procedure SetInvoiceDescription(const Value: string);
    function GetMultiplier: integer;
    procedure SetIntNarrative(const Value: integer);
    procedure SetIntNarrativeText(const Value: string);
    procedure SetInvoiceAddress(const Value: integer);
    procedure SetRetailCustomer(const Value: string);
    procedure SetDepositAmount(const Value: currency);
    procedure SetAccountManager(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetPaymentTerms(const Value: integer);
    procedure SetSpeculative(const Value: boolean);
    procedure SetRevenueCentre(const Value: integer);
    procedure SetCustomerBranch(const Value: integer);
    procedure SetCustomerBranchName(const Value: string);
    procedure SetBranchExist(const Value: boolean);
  public
    constructor Create(DataModule : TdtmdlSalesInvoice);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TSalesInvoice;
    procedure DeleteCreditFromDB;
    procedure DeleteFromDB;
    procedure LoadFromDB;
    procedure LoadCreditFromSI;
    procedure LoadCreditLinesFromSI;
    procedure LoadFromPO;
    procedure LoadFromJB;
    procedure LoadFromSO;
    procedure LoadLines;
    procedure LoadJBLines;
    procedure LoadPOLines;
    procedure LoadSOLines;
    procedure SaveCredittoDB(TempAll: boolean);
    procedure SaveToDB(TempAll: boolean);
    property AccountCode: string read FAccountCode write SetAccountCode;
    property AccountManager: integer read FAccountManager write SetAccountManager;
    property BranchExist: boolean read FBranchExist write SetBranchExist;
    property InvoiceAddress: integer read FInvoiceAddress write SetInvoiceAddress;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerBranch: integer read FCustomerBranch write SetCustomerBranch;
    property CustomerBranchName: string read FCustomerBranchName write SetCustomerBranchName;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property DataModule: TdtmdlSalesInvoice read FDataModule;
    property dbKey: integer read FdbKey write SetdbKey;
    property DepositAmount: currency read FDepositAmount write SetDepositAmount;
    property Inactive: string read FInactive write SetInactive;
    property IntNarrative: integer read FIntNarrative write SetIntNarrative;
    property IntNarrativeText: string read FIntNarrativeText write SetIntNarrativeText;
    property InvoiceOrCredit: string read FInvoiceOrCredit write SetInvoiceOrCredit;
    property InvoiceDescription: string read FInvoiceDescription write SetInvoiceDescription;
    property Lines : TSalesInvoiceLines read FSalesInvoiceLines;
    property Multiplier: integer read GetMultiplier;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property PaidStatus: string read FPaidStatus write SetPaidStatus;
    property PaidAmount: currency read FPaidAmount write SetPaidAmount;
    property PaidDate: TDateTime read FPaidDate write SetPaidDate;
    property PaymentTerms: integer read FPaymentTerms write SetPaymentTerms;
    property Reference: string read FReference write SetReference;
    property Rep: integer read FRep write SetRep;
    property RetailCustomer: string read FRetailCustomer write SetRetailCustomer;
    property RevenueCentre: integer read FRevenueCentre write SetRevenueCentre;
    property SIDate: TDateTime read FSIDate write SetSIDate;
    property SINumber: string read FSINumber write SetSINumber;
    property SIStatus: integer read FSIStatus write SetSIStatus;
    property SIStatusDesc: string read FSIStatusDesc write SetSIStatusDesc;
    property SIType: string read FSIType write SetSIType;
    property Speculative: boolean read FSpeculative write SetSpeculative;
    property TotalGoods: currency read GetTotalGoods;
    property TotalVAT: currency read GetTotalVAT;

  end;
var
  dtmdlSalesInvoice: TdtmdlSalesInvoice;

implementation

uses
  ComObj, ActiveX, wtMain, wtNotesDM, wtDatabase, wtDataModule;

const
  UpdateJBSQL =
  'UPDATE Job_Bag_Line_dets '+
  '      SET Job_Bag_Line_Invoiced = ''N'' '+
  'WHERE '+
  '(Select distinct Sales_invoice_Line.Job_Bag '+
  ' from Sales_Invoice_Line '+
  ' WHERE Sales_Invoice_Line.Sales_Invoice = :Sales_Invoice) = Job_Bag_Line_dets.Job_Bag ';

  NonStockSQL =
  ' AND ' +
  '((select sum(Qty_Delivered) ' +
  ' from Delivery_Detail ' +
  ' where Delivery_Detail.Purchase_Order = Purchase_OrderLine.Purchase_Order and '+
  ' Delivery_Detail.Line = Purchase_OrderLine.Line and '+
  ' ( ' +
  ' (Delivery_Detail.delivery_to_Stock is null) or ' +
  ' (Delivery_Detail.delivery_to_Stock = ''N''))) > 0) and '+
  '((select sum(Qty_Delivered) ' +
  ' from Delivery_Detail ' +
  ' where Delivery_Detail.Purchase_Order = Purchase_OrderLine.Purchase_Order and '+
  ' Delivery_Detail.Line = Purchase_OrderLine.Line and '+
  ' ( ' +
  ' (Delivery_Detail.delivery_to_Stock is null) or ' +
  ' (Delivery_Detail.delivery_to_Stock = ''N''))) > Purchase_OrderLine.Qty_Invoiced) ' +
  ' ORDER BY Purchase_OrderLine.Purchase_Order DESC, Purchase_OrderLine.Line ';

  StockSQL =
  ' ORDER BY Purchase_OrderLine.Purchase_Order DESC, Purchase_OrderLine.Line ';

  InvoiceSQL =
  ' ORDER BY Purchase_OrderLine.Purchase_Order DESC, Purchase_OrderLine.Line ';

{$R *.DFM}

{ TSalesInvoice }

procedure TSalesInvoice.Clear;
begin
  Customer :=       0;
  CustomerName :=   '';
  SIDate :=           0;
  FSalesInvoiceLines.Clear;
end;

function TSalesInvoice.Clone: TSalesInvoice;
begin
  Result := TSalesInvoice.Create(FDataModule);
  Result.AccountCode :=         Self.AccountCode;
  Result.AccountManager :=      Self.AccountManager;
  Result.BranchExist :=         self.BranchExist;
  Result.Customer :=            Self.Customer;
  Result.CustomerBranch :=      self.CustomerBranch;
  Result.CustomerBranchName :=      self.CustomerBranchName;
  Result.CustomerName :=        Self.CustomerName;
  Result.dbKey :=               Self.dbKey;
  Result.DepositAmount :=       self.DepositAmount;
  Result.Inactive :=            Self.Inactive;
  Result.IntNarrative :=        Self.IntNarrative;
  Result.IntNarrativeText :=    Self.IntNarrativeText;
  Result.InvoiceAddress :=      Self.InvoiceAddress;
  Result.InvoiceOrCredit :=     Self.InvoiceOrCredit;
  Result.InvoiceDescription :=  Self.InvoiceDescription;
  Result.Narrative :=           Self.Narrative;
  Result.NarrativeText :=       Self.NarrativeText;
  Result.Operator :=            Self.Operator;
  result.OperatorName :=        Self.OperatorName;
  Result.PaidStatus :=          Self.PaidStatus;
  Result.PaidAmount :=          Self.PaidAmount;
  Result.PaidDate :=            Self.PaidDate;
  Result.PaymentTerms :=        self.PaymentTerms;
  Result.Reference :=           Self.Reference;
  Result.Rep :=                 Self.Rep;
  Result.RetailCustomer :=      Self.RetailCustomer;
  REsult.RevenueCentre :=       self.RevenueCentre;
  Result.SIDate :=              Self.SIDate;
  Result.SINumber :=            Self.SINumber;
  Result.SIStatus :=            Self.SIStatus;
  Result.SIStatusDesc :=        Self.SIStatusDesc;
  Result.SIType :=              Self.SIType;
  Result.Speculative :=         self.Speculative;
  Result.FSalesInvoiceLines.Free;
  Result.FSalesInvoiceLines :=  Self.FSalesInvoiceLines.Clone;
end;

constructor TSalesInvoice.Create(DataModule : TdtmdlSalesInvoice);
begin
  FDataModule := DataModule;
  FSalesInvoiceLines := TSalesInvoiceLines.Create(Self);
end;

procedure TSalesInvoice.DeleteFromDB;
var
  i: integer;
begin
  DeleteLines;
  for i := 0 to Pred(FSalesInvoiceLines.Count) do
    begin
      FSalesInvoiceLines[i].SaveToSO;
(*      if FSalesInvoiceLines[i].Job <> 0 then
        FSalesInvoiceLines[i].SaveToJB
      else
      if FSalesInvoiceLines[i].SONumber <> 0 then
        FSalesInvoiceLines[i].SaveToSO;
*)
    end;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Invoice WHERE Sales_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSalesInvoice.DeleteCreditFromDB;
var
  i: integer;
begin
  DeleteLines;
  for i := 0 to Pred(FSalesInvoiceLines.Count) do
    begin
      if fSalesInvoiceLines[i].CreditType <> 'Q' then
        continue;
      FSalesInvoiceLines[i].SaveToSO;
(*      if FSalesInvoiceLines[i].Job <> 0 then
        FSalesInvoiceLines[i].SaveToJB
      else
      if FSalesInvoiceLines[i].SONumber <> 0 then
        FSalesInvoiceLines[i].SaveToSO;
*)
    end;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Invoice WHERE Sales_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSalesInvoice.DeleteLines;
begin
(*  {Reset Job Bag Invoiced flag}
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.text := UpdateJBSQL;
    Parambyname('Sales_Invoice').asinteger := dbKey;
    ExecSQL;
  end;
*)

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Invoice_Line WHERE Sales_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

destructor TSalesInvoice.Destroy;
begin
  FSalesInvoiceLines.Free;
  inherited;
end;

procedure TSalesInvoice.LoadFromDB;
begin
  { Load the header record then all lines belonging to the sales invoice }
  Clear;
  with FDataModule.qrySIHeader do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := DbKey;
    Open;
    AccountCode :=         FieldByName('Account_code').asstring;
    if fieldbyname('Account_Manager').asinteger = 0 then
      AccountManager := fieldbyname('Operator').asinteger
    else
      AccountManager := fieldbyname('Account_Manager').asinteger;
    Customer :=            FieldByName('Customer').AsInteger;
    CustomerBranch  :=     FieldByName('Branch_No').AsInteger;
    CustomerBranchName :=   dtmdlWorktops.GetCustomerBranchName(Customer, CustomerBranch);
    CustomerName :=        FieldByName('Customer_Name').AsString;

    BranchExist := dtmdlWorktops.DoesCustomerBranchExist(Customer);

    DepositAmount :=       Fieldbyname('Deposit_Amount').asfloat;
    Inactive :=            FieldByName('Inactive').Asstring;
    IntNarrative :=        FieldByName('Internal_Notes').AsInteger;
    IntNarrativeText :=    dtmdlSalesInvoice.GetNarrative(IntNarrative);
    InvoiceOrCredit :=     FieldByName('Invoice_or_Credit').Asstring;
    InvoiceDescription :=  FieldByName('Description').Asstring;
    InvoiceAddress :=      FieldByName('Invoice_Address').asinteger;
    Narrative :=           FieldByName('Notes').AsInteger;
    NarrativeText :=       dtmdlSalesInvoice.GetNarrative(Narrative);
    Operator :=            FieldByName('Operator').AsInteger;
    OperatorName :=        Fieldbyname('Operator_Name').asstring;
    PaidStatus :=          FieldByName('Paid_Status').Asstring;
    PaidAmount :=          FieldByName('Paid_Amount').Asfloat;
    PaidDate :=            FieldByName('Paid_Date').AsdateTime;
    PaymentTerms :=        Fieldbyname('Payment_Terms').asinteger;
    Reference :=           FieldByName('Reference').asstring;
    Rep :=                 FieldByName('Rep').Asinteger;
    RetailCustomer :=      FieldByName('Is_Retail_Customer').Asstring;
    RevenueCentre :=       fieldbyname('Revenue_Centre').asinteger;
    SIDate :=              FieldByName('Invoice_Date').Asdatetime;
    SINumber :=            FieldByName('invoice_no').Asstring;
    SIStatus :=            FieldByName('Sales_invoice_Status').AsInteger;
    SIStatusDesc :=        FieldByName('Sales_inv_Status_Desc').Asstring;
    SIType :=              'SO';
    Speculative :=         (Fieldbyname('Customer_is_Speculative').asstring = 'Y');
    Close;
  end;
  LoadLines;
end;

procedure TSalesInvoice.LoadFromPO;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qryPOLine do
  begin
    Close;
    ParamByName('Purchase_Order').Asfloat := dtmdlSalesInvoice.PONumber;
    ParamByName('Line').Asinteger := dtmdlSalesInvoice.Line;
    Open;
//    dbKey :=               0;
    AccountCode :=         FieldByName('Account_code').asstring;
    if fieldbyname('Account_Manager').asinteger = 0 then
      AccountManager := fieldbyname('Operator').asinteger
    else
      AccountManager := fieldbyname('Account_Manager').asinteger;
    Customer :=            FieldByName('Customer').AsInteger;
    CustomerName :=        FieldByName('Customer_Name').AsString;
    Inactive :=            '';
    IntNarrative :=        0;
    IntNarrativeText :=    '';
    InvoiceOrCredit :=     'I';
    InvoiceDescription :=  FieldByName('Customers_Desc').Asstring;
    Narrative :=           0;
    NarrativeText :=       '';
    Operator :=            frmwtMain.Operator;
    OperatorName :=        frmwtMain.OperatorName;
    PaidStatus :=          '';
    PaidAmount :=          0.00;
    PaidDate :=            paDateStr('');
    Reference :=           floattostr(dtmdlSalesInvoice.PONumber);
    Rep :=                 FieldByName('Rep').Asinteger;
    RevenueCentre :=       FieldByName('Revenue_Centre').Asinteger;
    SIDate :=              dtmdlSalesInvoice.InvoiceDate;
    SINumber :=            '<New Invoice>';
    SIStatus :=            10;
    SIStatusDesc :=        dtmdlSalesInvoice.GetInvoiceStatus(10);
    SIType :=              '';
    Speculative :=         (Fieldbyname('Customer_is_Speculative').asstring = 'Y');
    Close;
  end;
  LoadPOLines;
end;

procedure TSalesInvoice.LoadFromSO;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qrySOHeader do
  begin
    Close;
    ParamByName('Sales_Order').Asinteger := dtmdlSalesInvoice.SONumber;
    Open;
    dbKey :=               0;
    if fieldbyname('Account_Manager').asinteger = 0 then
      AccountManager := fieldbyname('Operator').asinteger
    else
      AccountManager := fieldbyname('Account_Manager').asinteger;

    if FieldByName('Inv_Customer').AsInteger <> 0 then
      begin
        Customer :=            FieldByName('Inv_Customer').AsInteger;
        CustomerName :=        dtmdlWorktops.GetCustomerName(FieldByName('Inv_Customer').AsInteger);
        AccountCode :=         dtmdlWorktops.GetCustomerAccountCode(FieldByName('Inv_Customer').AsInteger);

        CustomerBranch :=      0;
        CustomerBranchName :=   '';
      end
    else
      begin
        Customer :=            FieldByName('Customer').AsInteger;
        CustomerName :=        FieldByName('Customer_Name').AsString;
        AccountCode :=         FieldByName('Account_code').asstring;

        CustomerBranch :=      Fieldbyname('Branch_No').asinteger;
        CustomerBranchName :=   dtmdlWorktops.GetCustomerBranchName(Customer, CustomerBranch);

      end;

    BranchExist := dtmdlWorktops.DoesCustomerBranchExist(Customer);

    DepositAmount :=       Fieldbyname('Deposit_Amount').asfloat;
    Inactive :=            '';
    IntNarrative :=        0;
    IntNarrativeText :=    '';
    InvoiceOrCredit :=     'I';
    InvoiceDescription :=  fieldbyname('Descriptive_Reference').asstring;
    Narrative :=           0;
    NarrativeText :=       '';
    Operator :=            frmwtMain.Operator;
    OperatorName :=        frmwtMain.OperatorName;
    if (Fieldbyname('Deposit_Amount').asfloat > 0.00) then
      begin
        if (Fieldbyname('Deposit_Amount').asfloat >= Fieldbyname('Total_Value').asfloat) then
          PaidStatus :=    'Y'
        else
          PaidStatus :=    'P';
      end
    else
      PaidStatus :=        'N';

    PaidAmount :=          Fieldbyname('Deposit_Amount').asfloat;
    PaidDate :=            paDateStr('');
    PaymentTerms :=        fieldbyname('Payment_Terms').asinteger;
    Reference :=           inttostr(dtmdlSalesInvoice.SONumber);
    Rep :=                 FieldByName('Rep').Asinteger;
    RetailCustomer :=      FieldByName('Is_Retail_Customer').Asstring;
    RevenueCentre :=       FieldByName('Revenue_Centre').Asinteger;
    SIDate :=              dtmdlSalesInvoice.InvoiceDate;
    SINumber :=            '<New Invoice>';
    SIStatus :=            10;
    SIStatusDesc :=        dtmdlSalesInvoice.GetInvoiceStatus(10);
    SIType :=              'S';
    Speculative :=         (Fieldbyname('Customer_is_Speculative').asstring = 'Y');

    if (RetailCustomer = 'Y') OR Speculative then
      InvoiceAddress :=     FieldByName('Address').asinteger;
(*    else
    if FieldByName('Invoice_Address').asinteger = 0 then
      InvoiceAddress :=     FieldByName('customer').asinteger
    else
      InvoiceAddress :=     FieldByName('Invoice_Address').asinteger;
*)
    Close;
  end;
  LoadSOLines;
end;

procedure TSalesInvoice.LoadFromJB;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qryJBHeader do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger := dtmdlSalesInvoice.JBNumber;
    Open;
    dbKey :=               0;
    AccountCode :=         FieldByName('Account_code').asstring;
    if fieldbyname('Account_Manager').asinteger = 0 then
      AccountManager := fieldbyname('Operator').asinteger
    else
      AccountManager := fieldbyname('Account_Manager').asinteger;
    Customer :=            FieldByName('Customer').AsInteger;
    CustomerName :=        FieldByName('Customer_Name').AsString;
    Inactive :=            '';
    IntNarrative :=        0;
    IntNarrativeText :=    '';
    InvoiceOrCredit :=     'I';
    InvoiceDescription :=  FieldByName('Job_Bag_Descr').Asstring;
    Narrative :=           0;
    NarrativeText :=       '';
    Operator :=            frmwtMain.Operator;
    OperatorName :=        frmwtMain.OperatorName;
    PaidStatus :=          '';
    PaidAmount :=          0.00;
    PaidDate :=            paDateStr('');
    Reference :=           inttostr(dtmdlSalesInvoice.JBNumber);
    Rep :=                 FieldByName('Rep').Asinteger;
    SIDate :=              dtmdlSalesInvoice.InvoiceDate;
    SINumber :=            '<New Invoice>';
    SIStatus :=            10;
    SIStatusDesc :=        dtmdlSalesInvoice.GetInvoiceStatus(10);
    SIType :=              'J';
    Speculative :=         (Fieldbyname('Customer_is_Speculative').asstring = 'Y');
    Close;
  end;
  LoadJBLines;
end;

procedure TSalesInvoice.LoadJBLines;
var
  aLine : TsalesInvoiceLine;
begin
  FsalesInvoiceLines.Clear;
  with FDataModule.qryJBLines do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger := dtmdlSalesInvoice.JBNumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceLine.Create(Self);
      aLine.SILine := aLine.Parent.Lines.Count + 1;
      aLine.CreditType := ' ';
      aLine.Description := fieldbyname('Job_Bag_Line_Descr').asstring;
      aLine.VatCode := FieldByName('VAT').Asinteger;
      aLine.VatDescription := FieldByName('VAT_Description').AsString;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VATReverseCharge := (FieldByName('Reverse_Charge').Asstring = 'Y');
      aLine.VatValue := 0.00;
      aLine.PackQty := 0;
      if fieldbyname('sell_unit').asstring = '' then
        begin
        aLine.Quantity := Fieldbyname('Job_Bag_Quantity').asinteger;
        aLine.OriginalQty := 0;
        aLine.QtyOutstanding := Fieldbyname('Job_Bag_Quantity').asinteger;
        end
      else
        begin
        aLine.Quantity := Fieldbyname('Invoice_Qty').asinteger;
        aLine.OriginalQty := 0;
        aLine.QtyOutstanding := Fieldbyname('Invoice_Qty').asinteger;
        end;
      if fieldbyname('Selling_Price').asstring = '' then
        aLine.GoodsValue := (fieldbyname('Job_Bag_line_Sell').asfloat)
      else
        begin
          aLine.GoodsValue := FieldByName('Selling_Price').Asfloat
        end;

      aLine.Nominal := '';

      aLine.Job := FieldByName('Job').Asinteger;
      aLine.Narrative := 0;
      aLine.NarrativeText := '';
      aLine.NotPrinted := 'N';
      aLine.SONumber := 0;
      aLine.SOLine := 0;
      FSalesInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoice.LoadPOLines;
var
  aLine : TsalesInvoiceLine;
begin
  FsalesInvoiceLines.Clear;
  with FDataModule.qryPOLine do
  begin
    Close;
    ParamByName('Purchase_Order').Asfloat := dtmdlSalesInvoice.PONumber;
    ParamByName('Line').Asinteger := dtmdlSalesInvoice.Line;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceLine.Create(Self);
      aLine.SILine := aLine.Parent.Lines.Count + 1;
      aLine.CreditType := ' ';
      aLine.Description := fieldbyname('Customers_Desc').asstring;
      aLine.Quantity := dtmdlSalesInvoice.InvoiceQty;
      aLine.OriginalQty := 0;
      aLine.QtyOutstanding := FieldByName('Qty_Outstanding').Asinteger;
      aLine.GoodsValue := FieldByName('Selling_Price').Asfloat;
      aLine.VatCode := FieldByName('VAT').Asinteger;
      aLine.VatDescription := FieldByName('VAT_Description').AsString;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VATReverseCharge := (FieldByName('Reverse_Charge').Asstring = 'Y');
      aLine.VatValue := 0.00;
      aLine.PackQty := 0;
      aLine.Nominal := '';

      if trim(aLine.Nominal) = '' then
        aLine.Nominal := dtmdlSalesInvoice.GetDefSalesNominal;

      aLine.Job := FieldByName('Job').asInteger;
      aLine.Narrative := 0;
      aLine.NarrativeText := '';
      aLine.NotPrinted := 'N';
      aLine.SONumber := 0;
      aLine.SOLine := 0;
      FSalesInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoice.LoadSOLines;
var
  aLine : TsalesInvoiceLine;
begin
  FsalesInvoiceLines.Clear;
  with FDataModule.qrySOLines do
  begin
    Close;
    ParamByName('Sales_Order').Asfloat := dtmdlSalesInvoice.SONumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceLine.Create(Self);
      aLine.SILine := aLine.Parent.Lines.Count + 1;
      aLine.CreditType := ' ';
      aLine.Description := fieldbyname('Description').asstring;
      aLine.Quantity := Fieldbyname('Invoice_qty').asinteger;
      aLine.OriginalQty := 0;
      aLine.QtyOutstanding := Fieldbyname('Invoice_qty').asinteger;
      aLine.VatCode := FieldByName('VAT').Asinteger;
      aLine.VatDescription := FieldByName('VAT_Description').AsString;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VATReverseCharge := (FieldByName('Reverse_Charge').Asstring = 'Y');
      aLine.VatValue := 0.00;

      aLine.UnitPrice := (FieldByName('Unit_Price').Asfloat);
      aLine.SONumber := fieldbyname('Sales_order').asinteger;
      aLine.SOLine := fieldbyname('Sales_order_line_no').asinteger;
      if dtmdlWorktops.GetNominalLevel = 'COMPANY' then
        aLine.Nominal := aline.parent.datamodule.GetDefSalesNominal
      else
      if dtmdlWorktops.GetNominalLevel = 'CUST TYPE' then
        aLine.Nominal := aline.parent.datamodule.GetCustomerTypeNominal(aLine.parent.customer)
      else
      if dtmdlWorktops.GetNominalLevel = 'MAT TYPE' then
        begin
          if (aLine.Parent.RetailCustomer = 'Y') then
            aLine.Nominal := aline.parent.datamodule.GetWorktopTypeRetailNominal(aLine.SONumber,aLine.SOLine)
          else
            aLine.Nominal := aline.parent.datamodule.GetWorktopTypeTradeNominal(aLine.SONumber,aLine.SOLine);
        end
      else
        begin
          if fieldbyname('Product').asstring <> '' then
            aLine.Nominal := fieldbyname('Default_Sales_Nominal').asstring
          else
          if dtmdlWorktops.GetNominalLevel = 'MATERIAL' then
            aLine.Nominal := aline.parent.datamodule.GetMaterialNominal(aLine.SONumber,aLine.SOLine)
          else
            aLine.Nominal := aline.parent.datamodule.GetDefSalesNominal;
        end;

      if aLine.Nominal = '' then
        aLine.Nominal := aline.parent.datamodule.GetDefSalesNominal;
      aLine.Job := fieldbyname('Job').asinteger;
      aLine.Narrative := 0;
      aLine.NarrativeText := '';
      aLine.NotPrinted := 'N';
      aLine.SellUnit := fieldbyname('Sell_unit').asinteger;

(*      if aLine.SILine = 1 then
        aline.parent.InvoiceDescription := aLine.Description;
*)
      FSalesInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoice.LoadLines;
var
  aLine : TsalesInvoiceLine;
begin
  FsalesInvoiceLines.Clear;
  with FDataModule.qrySIAllLines do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceLine.Create(Self);
      aLine.SILine := FieldByName('Invoice_Line_no').AsInteger;
      aLine.Job := FieldByName('Job').Asinteger;
      aLine.SONumber := FieldByName('Sales_Order').Asinteger;
      aLine.SOLine := FieldByName('Sales_Order_Line_no').Asinteger;
      aLine.CreditType := FieldByName('Credit_Type').Asstring;
      aLine.Quantity := FieldByName('Quantity_Invoiced').Asfloat * Multiplier;
      aLine.OriginalQty := FieldByName('Quantity_Invoiced').Asfloat * Multiplier;
      aLine.QtyOutstanding := aLine.GetSOLineOutQty(aLine.SONumber, aLine.SOLine);
//      aLine.Description := aLine.GetSODescription(aLine.SONumber, aLine.SOLine);
      aLine.Description := FieldByName('Description').Asstring;
      aLine.SellUnit := FieldByName('Sell_unit').Asinteger;

      aLine.CostPrice := FieldbyName('Cost_Price').Asfloat * Multiplier;
      aLine.UnitPrice := FieldByName('Unit_Price').Asfloat * Multiplier;
      aLine.VatCode := FieldByName('VAT').Asinteger;
      aLine.VatDescription := FieldByName('VAT_Description').AsString;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VATReverseCharge := (FieldByName('Reverse_Charge').Asstring = 'Y');
      aLine.VatValue := FieldByName('VAT_Value').asfloat * Multiplier;
      aLine.Nominal := FieldByName('Nominal').AsString;
      aLine.NotPrinted := FieldByName('Not_printed').AsString;
      aLine.Narrative := FieldByName('Notes').Asinteger;
      aLine.NarrativeText := dtmdlSalesInvoice.GetNarrative(aLine.Narrative);
      FSalesInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoice.SaveToDB(TempAll: boolean);
var
  iTempNarr: integer;
begin
  if DbKey = 0 then
    begin
      DbKey := FDataModule.GetNextSINumber;
      with FDataModule.qrySIAddHeader do
        begin
          ParamByName('Sales_Invoice').AsInteger := DbKey;
          ParambyName('Invoice_Date').asdatetime := SIDate;
          ParamByName('Customer').AsInteger := Customer;

          if CustomerBranch = 0 then
            ParamByName('Branch_No').clear
          else
            ParamByName('Branch_No').AsInteger := CustomerBranch;

          ParamByName('Goods_Value').Asfloat := TotalGoods;
          ParamByName('Vat_Value').Asfloat := TotalVat;
          ParamByName('Operator').AsInteger := Operator;
          ParambyName('Invoice_no').asstring := ' ';
          ParambyName('Account_Code').asstring := AccountCode;
          Parambyname('Account_Manager').asinteger := AccountManager;
          ParamByName('Sales_invoice_Status').AsInteger := 10;
          ParamByName('Invoice_or_Credit').Asstring := InvoiceOrCredit;
          ParambyName('Paid_Status').asstring := PaidStatus;
          ParamByName('Paid_Amount').Asfloat := PaidAmount;
          ParamByName('Paid_Date').Asdatetime := PaidDate;

          if PaymentTerms = 0 then
            ParambyName('Payment_Terms').clear
          else
            ParambyName('Payment_Terms').asinteger := PaymentTerms;

          iTempNarr := Narrative;
          dtmdlSalesInvoice.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Notes').clear
          else
            ParamByName('Notes').Asinteger := Narrative;

          Parambyname('Deposit_Amount').asfloat := DepositAmount;
          {Save the Internal narrative}
          iTempNarr := IntNarrative;
          dtmdlSalesInvoice.SaveNarrative(iTempNarr,IntNarrativeText);
          IntNarrative := iTempNarr;
          if IntNarrative = 0 then
            ParamByName('Internal_Notes').clear
          else
            ParamByName('Internal_Notes').Asinteger := IntNarrative;

(*          if SIType = '' then
            ParamByName('Sales_invoice_type').clear
          else
            ParamByName('Sales_invoice_type').Asstring := SIType;
*)          if Inactive = '' then
            ParamByName('Inactive').clear
          else
            ParamByName('Inactive').Asstring := Inactive;
          Parambyname('Reference').asstring := Reference;
          Parambyname('Rep').asinteger := Rep;

          if RevenueCentre = 0 then
            parambyname('Revenue_Centre').clear
          else
            parambyname('Revenue_Centre').asinteger := RevenueCentre;

          Parambyname('Description').asstring := InvoiceDescription;
          Parambyname('Customer_Name').asstring := CustomerName;
          if InvoiceAddress = 0 then
            ParamByName('Invoice_address').clear
          else
            Parambyname('Invoice_address').asinteger := InvoiceAddress;
          ExecSQL;
        end;
    end
  else
  if TempAll then
    begin
      with FDataModule.qrySIUpHeader do
        begin
          ParamByName('Sales_Invoice').AsInteger := DbKey;
          ParambyName('Invoice_Date').asdatetime := SIDate;
          ParamByName('Customer').AsInteger := Customer;

          if CustomerBranch = 0 then
            ParamByName('Branch_No').clear
          else
            ParamByName('Branch_No').AsInteger := CustomerBranch;

          ParamByName('Goods_Value').Asfloat := TotalGoods;
          ParamByName('Vat_Value').Asfloat := TotalVat;
          ParamByName('Operator').AsInteger := Operator;
          ParambyName('Invoice_no').asstring := Self.SINumber;
          ParambyName('Account_Code').asstring := AccountCode;
          Parambyname('Account_Manager').asinteger := AccountManager;
          ParamByName('Sales_invoice_Status').AsInteger := SIStatus;
          ParamByName('Invoice_or_Credit').Asstring := InvoiceOrCredit;
          ParambyName('Paid_Status').asstring := PaidStatus;
          ParamByName('Paid_Amount').Asfloat := PaidAmount;
          ParamByName('Paid_Date').Asdatetime := PaidDate;

          if PaymentTerms = 0 then
            ParambyName('Payment_Terms').clear
          else
            ParambyName('Payment_Terms').asinteger := PaymentTerms;

          iTempNarr := Narrative;
          dtmdlSalesInvoice.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Notes').clear
          else
            ParamByName('Notes').Asinteger := Narrative;

          Parambyname('Deposit_Amount').asfloat := DepositAmount;
          {Save the Internal narrative}
          iTempNarr := IntNarrative;
          dtmdlSalesInvoice.SaveNarrative(iTempNarr,IntNarrativeText);
          IntNarrative := iTempNarr;
          if IntNarrative = 0 then
            ParamByName('Internal_Notes').clear
          else
            ParamByName('Internal_Notes').Asinteger := IntNarrative;

(*          if SIType = '' then
            ParamByName('Sales_invoice_type').clear
          else
            ParamByName('Sales_invoice_type').Asstring := SIType;
*)          if Inactive = '' then
            ParamByName('Inactive').clear
          else
            ParamByName('Inactive').Asstring := Inactive;
          Parambyname('Reference').asstring := Reference;
          Parambyname('Rep').asinteger := Rep;

          if RevenueCentre = 0 then
            parambyname('Revenue_Centre').clear
          else
            parambyname('Revenue_Centre').asinteger := RevenueCentre;

          Parambyname('Description').asstring := InvoiceDescription;
          Parambyname('Customer_Name').asstring := CustomerName;
          if InvoiceAddress = 0 then
            ParamByName('Invoice_address').clear
          else
            Parambyname('Invoice_address').asinteger := InvoiceAddress;
          ExecSQL;
        end
    end;
  SaveLines;
end;

procedure TSalesInvoice.SaveLines;
var
  i : integer;
begin
  { When saving, we have to delete all line records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteLines;  { Get rid of any already in database }
  FSalesInvoiceLines.Renumber;
  for i := 0 to Pred(FSalesInvoiceLines.Count) do
    begin
      FSalesInvoiceLines[i].SaveToDB;
      FSalesInvoiceLines[i].SaveToSO;
(*      if FSalesInvoiceLines[i].Job <> 0 then
        FSalesInvoiceLines[i].SaveToJB
      else
      if FSalesInvoiceLines[i].SONumber <> 0 then
        FSalesInvoiceLines[i].SaveToSO;
*)    end;
end;

procedure TSalesInvoice.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TSalesInvoice.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TSalesInvoice.SetdbKey(const Value: integer);
begin
  FdbKey := Value;
end;

procedure TSalesInvoice.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TSalesInvoice.SetInvoiceOrCredit(const Value: string);
begin
  FInvoiceOrCredit := Value;
end;

procedure TSalesInvoice.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TSalesInvoice.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TSalesInvoice.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TSalesInvoice.SetPaidAmount(const Value: currency);
begin
  FPaidAmount := Value;
end;

procedure TSalesInvoice.SetPaidDate(const Value: TDateTime);
begin
  FPaidDate := Value;
end;

procedure TSalesInvoice.SetPaidStatus(const Value: string);
begin
  FPaidStatus := Value;
end;

procedure TSalesInvoice.SetSIDate(const Value: TDateTime);
begin
  FSIDate := Value;
end;

procedure TSalesInvoice.SetSINumber(const Value: string);
begin
  FSINumber := Value;
end;

procedure TSalesInvoice.SetSIStatus(const Value: integer);
begin
  FSIStatus := Value;
end;

procedure TSalesInvoice.SetSIStatusDesc(const Value: string);
begin
  FSIStatusDesc := Value;
end;

procedure TSalesInvoice.SetSIType(const Value: string);
begin
  FSIType := Value;
end;

function TSalesInvoice.GetTotalGoods: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FSalesInvoiceLines.Count) do
    begin
      Result := Result + FSalesInvoiceLines[i].TotalGoods;
    end;
end;

function TSalesInvoice.GetTotalVAT: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FSalesInvoiceLines.Count) do
    begin
      if FSalesInvoiceLines[i].VATValue <> 0.00 then
        Result := Result + (FSalesInvoiceLines[i].VatValue)
      else
        Result := Result + (FSalesInvoiceLines[i].TotalGoods * (FSalesInvoiceLines[i].VATRate / 100.00))
    end;
end;

procedure TSalesInvoice.SetAccountCode(const Value: string);
begin
  FAccountCode := Value;
end;

procedure TSalesInvoice.SetRep(const Value: integer);
begin
  FRep := Value;
end;

procedure TSalesInvoice.SetReference(const Value: string);
begin
  FReference := Value;
end;

procedure TSalesInvoice.SetInvoiceDescription(const Value: string);
begin
  FInvoiceDescription := Value;
end;

procedure TSalesInvoice.LoadCreditFromSI;
begin
  { Load the header record then all lines belonging to the sales invoice }
  Clear;
  with FDataModule.qrySIHeader do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := FDataModule.SInvoiceNumber;
    Open;
    AccountCode :=         FieldByName('Account_code').asstring;
    if fieldbyname('Account_Manager').asinteger = 0 then
      AccountManager := fieldbyname('Operator').asinteger
    else
      AccountManager := fieldbyname('Account_Manager').asinteger;
    Customer :=            FieldByName('Customer').AsInteger;
    CustomerName :=        FieldByName('Customer_Name').AsString;
    CustomerBranch :=        FieldByName('Branch_No').AsInteger;
    CustomerBranchName :=   dtmdlWorktops.GetCustomerBranchName(Customer, CustomerBranch);

    BranchExist := dtmdlWorktops.DoesCustomerBranchExist(Customer);

    Inactive :=            '';
    InvoiceOrCredit :=     'C';
    InvoiceDescription :=  FieldByName('Description').Asstring;
    InvoiceAddress :=      FieldByName('Invoice_Address').asinteger;
    IntNarrative :=        0;
    IntNarrativeText :=    dtmdlSalesInvoice.GetNarrative(Narrative);
    Narrative :=           0;
    NarrativeText :=       dtmdlSalesInvoice.GetNarrative(Narrative);
    Operator :=            frmwtMain.Operator;
    OperatorName :=        frmwtMain.OperatorName;
    PaidStatus :=          '';
    PaidAmount :=          0.00;
    PaidDate :=            paDateStr('');
    PaymentTerms :=        FieldbyName('Payment_Terms').asinteger;
    Reference :=           FieldByName('Invoice_no').Asstring;
    Rep :=                 FieldByName('Rep').Asinteger;
    RetailCustomer :=      FieldByName('Is_Retail_Customer').Asstring;
    RevenueCentre :=       FieldByName('Revenue_Centre').Asinteger;
    SIDate :=              FDataModule.InvoiceDate;
    SINumber :=            '<New Credit>';
    SIStatus :=            10;
    SIStatusDesc :=        FDataModule.GetInvoiceStatus(10);
    SIType :=              '';
    Speculative :=         (Fieldbyname('Customer_is_Speculative').asstring = 'Y');
    Close;
  end;
  LoadCreditLinesFromSI;
end;

procedure TSalesInvoice.LoadCreditLinesFromSI;
var
  aLine : TsalesInvoiceLine;
begin
  FsalesInvoiceLines.Clear;
  with FDataModule.qrySIAllLines do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := FDataModule.SInvoiceNumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceLine.Create(Self);
      aLine.SILine := FieldByName('Invoice_Line_no').AsInteger;
      aLine.Job := FieldByName('Job').Asinteger;
      aLine.SONumber := FieldByName('Sales_Order').Asinteger;
      aLine.SOLine := FieldByName('Sales_Order_Line_no').Asinteger;
      aLine.creditType := 'P';
      aLine.CostPrice := 0.00;
      aLine.Quantity := FieldByName('Quantity_Invoiced').Asfloat;
      aLine.OriginalQty := 0.0;
      aLine.QtyOutstanding := aLine.GetSOLineOutQty(aLine.SONumber, aLine.SOLine);
      aLine.Description := aLine.GetSODescription(aLine.SONumber, aLine.SOLine);
      aLine.SellUnit := FieldByName('Sell_unit').Asinteger;

      aLine.CostPrice := FieldbyName('Cost_Price').Asfloat * Multiplier;
      aLine.UnitPrice := FieldByName('unit_price').Asfloat;
      aLine.VatCode := FieldByName('VAT').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatValue := 0.00;
      aLine.NotPrinted := FieldByName('Not_printed').AsString;
      aLine.Nominal := FieldByName('Nominal').AsString;
      aLine.Narrative := FieldByName('Notes').Asinteger;
      aLine.NarrativeText := FDataModule.GetNarrative(aLine.Narrative);
      FSalesInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoice.SaveCredittoDB(TempAll: boolean);
var
  iTempNarr: integer;
begin
  if DbKey = 0 then
    begin
      DbKey := FDataModule.GetNextSINumber;
      with FDataModule.qrySIAddHeader do
        begin
          ParamByName('Sales_Invoice').AsInteger := DbKey;
          ParambyName('Invoice_Date').asdatetime := SIDate;
          ParamByName('Customer').AsInteger := Customer;

          if CustomerBranch = 0 then
            ParamByName('Branch_No').clear
          else
            ParamByName('Branch_No').AsInteger := CustomerBranch;

          ParamByName('Goods_Value').Asfloat := TotalGoods * -1;
          ParamByName('Vat_Value').Asfloat := TotalVat * -1;
          ParamByName('Operator').AsInteger := Operator;
          ParambyName('Account_Code').asstring := AccountCode;
          Parambyname('Account_Manager').asinteger := AccountManager;
          ParambyName('Invoice_no').asstring := ' ';
          ParamByName('Sales_invoice_Status').AsInteger := 10;
          ParamByName('Invoice_or_Credit').Asstring := 'C';
          ParambyName('Paid_Status').asstring := PaidStatus;
          ParamByName('Paid_Amount').Asfloat := PaidAmount;
          ParamByName('Paid_Date').Asdatetime := PaidDate;

          if PaymentTerms = 0 then
            ParambyName('Payment_Terms').clear
          else
            ParambyName('Payment_Terms').asinteger := PaymentTerms;

          iTempNarr := Narrative;
          dtmdlSalesInvoice.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Notes').clear
          else
            ParamByName('Notes').Asinteger := Narrative;

          Parambyname('Deposit_Amount').asfloat := DepositAmount;
          {Save the Internal narrative}
          iTempNarr := IntNarrative;
          dtmdlSalesInvoice.SaveNarrative(iTempNarr,IntNarrativeText);
          IntNarrative := iTempNarr;
          if IntNarrative = 0 then
            ParamByName('Internal_Notes').clear
          else
            ParamByName('Internal_Notes').Asinteger := IntNarrative;

          if Inactive = '' then
            ParamByName('Inactive').clear
          else
            ParamByName('Inactive').Asstring := Inactive;
          Parambyname('Reference').asstring := Reference;
          Parambyname('Rep').asinteger := Rep;

          if RevenueCentre = 0 then
            parambyname('Revenue_Centre').clear
          else
            parambyname('Revenue_Centre').asinteger := RevenueCentre;

          Parambyname('Description').asstring := InvoiceDescription;
          Parambyname('Customer_Name').asstring := CustomerName;
          if InvoiceAddress = 0 then
            ParamByName('Invoice_address').clear
          else
            Parambyname('Invoice_address').asinteger := InvoiceAddress;
          ExecSQL;
        end;
    end
  else
  if TempAll then
    begin
      with FDataModule.qrySIUpHeader do
        begin
          ParamByName('Sales_Invoice').AsInteger := DbKey;
          ParambyName('Invoice_Date').asdatetime := SIDate;
          ParamByName('Customer').AsInteger := Customer;

          if CustomerBranch = 0 then
            ParamByName('Branch_No').clear
          else
            ParamByName('Branch_No').AsInteger := CustomerBranch;

          ParamByName('Goods_Value').Asfloat := TotalGoods * -1;
          ParamByName('Vat_Value').Asfloat := TotalVat * -1;
          ParamByName('Operator').AsInteger := Operator;
          ParambyName('Invoice_no').asstring := SINumber;
          ParambyName('Account_Code').asstring := AccountCode;
          Parambyname('Account_Manager').asinteger := AccountManager;
          ParamByName('Sales_invoice_Status').AsInteger := SIStatus;
          ParamByName('Invoice_or_Credit').Asstring := 'C';
          ParambyName('Paid_Status').asstring := PaidStatus;
          ParamByName('Paid_Amount').Asfloat := PaidAmount;
          ParamByName('Paid_Date').Asdatetime := PaidDate;

          if PaymentTerms = 0 then
            ParambyName('Payment_Terms').clear
          else
            ParambyName('Payment_Terms').asinteger := PaymentTerms;

          iTempNarr := Narrative;
          dtmdlSalesInvoice.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Notes').clear
          else
            ParamByName('Notes').Asinteger := Narrative;

          Parambyname('Deposit_Amount').asfloat := DepositAmount;
          {Save the Internal narrative}
          iTempNarr := IntNarrative;
          dtmdlSalesInvoice.SaveNarrative(iTempNarr,IntNarrativeText);
          IntNarrative := iTempNarr;
          if IntNarrative = 0 then
            ParamByName('Internal_Notes').clear
          else
            ParamByName('Internal_Notes').Asinteger := IntNarrative;

          if Inactive = '' then
            ParamByName('Inactive').clear
          else
            ParamByName('Inactive').Asstring := Inactive;
          Parambyname('Reference').asstring := Reference;
          Parambyname('Rep').asinteger := Rep;

          if RevenueCentre = 0 then
            parambyname('Revenue_Centre').clear
          else
            parambyname('Revenue_Centre').asinteger := RevenueCentre;

          Parambyname('Description').asstring := InvoiceDescription;
          Parambyname('Customer_Name').asstring := CustomerName;
          if InvoiceAddress = 0 then
            ParamByName('Invoice_address').clear
          else
            Parambyname('Invoice_address').asinteger := InvoiceAddress;
          ExecSQL;
        end
    end;
  SaveCreditLines;
end;

function TSalesInvoice.GetMultiplier: integer;
begin
  if InvoiceorCredit = 'C' then
    result := -1
  else
    result := 1;
end;

procedure TSalesInvoice.SaveCreditLines;
var
  i : integer;
begin
  { When saving, we have to delete all line records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteLines;  { Get rid of any already in database }
  FSalesInvoiceLines.Renumber;
  for i := 0 to Pred(FSalesInvoiceLines.Count) do
    begin
      FSalesInvoiceLines[i].SaveToDB;
      if fSalesInvoiceLines[i].CreditType <> 'Q' then
        continue;
      FSalesInvoiceLines[i].SaveToSO;
    end;
end;

procedure TSalesInvoice.SetIntNarrative(const Value: integer);
begin
  FIntNarrative := Value;
end;

procedure TSalesInvoice.SetIntNarrativeText(const Value: string);
begin
  FIntNarrativeText := Value;
end;

procedure TSalesInvoice.SetInvoiceAddress(const Value: integer);
begin
  FInvoiceAddress := Value;
end;

procedure TSalesInvoice.SetRetailCustomer(const Value: string);
begin
  FRetailCustomer := Value;
end;

procedure TSalesInvoice.SetDepositAmount(const Value: currency);
begin
  FDepositAmount := Value;
end;

procedure TSalesInvoice.SetAccountManager(const Value: integer);
begin
  FAccountManager := Value;
end;

procedure TSalesInvoice.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TSalesInvoice.SetPaymentTerms(const Value: integer);
begin
  FPaymentTerms := Value;
end;

procedure TSalesInvoice.SetSpeculative(const Value: boolean);
begin
  FSpeculative := Value;
end;

procedure TSalesInvoice.SetRevenueCentre(const Value: integer);
begin
  FRevenueCentre := Value;
end;

procedure TSalesInvoice.SetCustomerBranch(const Value: integer);
begin
  FCustomerBranch := Value;
end;

procedure TSalesInvoice.SetCustomerBranchName(const Value: string);
begin
  FCustomerBranchName := Value;
end;

procedure TSalesInvoice.SetBranchExist(const Value: boolean);
begin
  FBranchExist := Value;
end;

{ TSalesInvoiceLine }

function TSalesInvoiceLine.Clone: TSalesInvoiceLine;
begin
  Result := TSalesInvoiceLine.Create(FParent);
  Result.CostPrice :=         Self.CostPrice;
  Result.CreditType :=        Self.CreditType;
  Result.Description :=       Self.Description;
  Result.UnitPrice  :=        Self.UnitPrice;
  Result.Job  :=              Self.Job;
  Result.Narrative  :=        Self.Narrative;
  Result.NarrativeText  :=    Self.NarrativeText;
  Result.Nominal  :=          Self.Nominal;
  Result.NotPrinted  :=       Self.NotPrinted;
  Result.SellUnit :=          Self.SellUnit;
  Result.Quantity  :=         Self.Quantity;
  Result.OriginalQty  :=      Self.OriginalQty;
  Result.QtyOutstanding  :=   Self.QtyOutstanding;
  Result.SILine  :=           Self.SILine;
  Result.SOLine  :=           Self.SOLine;
  Result.SONumber  :=         Self.SONumber;
  Result.VatCode  :=          Self.VatCode;
  Result.VatDescription  :=   Self.VatDescription;
  Result.VatRate  :=          Self.VatRate;
  Result.VatReverseCharge :=  Self.VATReverseCharge;
  Result.VatValue :=          Self.VatValue;
end;

constructor TSalesInvoiceLine.Create(SalesInvoice: TSalesInvoice);
begin
  FParent := SalesInvoice;
end;

destructor TSalesInvoiceLine.Destroy;
begin
  inherited;
end;

function TSalesInvoiceLine.GetTotalGoods: currency;
begin
  Result := ((FQuantity / FSellUnit) * FUnitPrice);
end;

procedure TSalesInvoiceLine.LoadFromDB;
begin
  with FParent.FDataModule.qrySILine do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := FParent.DbKey;
    ParamByName('Invoice_Line_No').AsInteger := SILine;
    Open;
    CostPrice := fieldbyname('Cost_Price').asfloat;
    CreditType := FieldByName('Credit_Type').asstring;
    Job := FieldByName('Job').Asinteger;
    SONumber := FieldByName('Sales_Order').Asinteger;
    SOLine := FieldByName('Sales_Order_Line_no').Asinteger;
    Quantity := FieldByName('Qty_Invoiced').Asfloat;
    OriginalQty := FieldByName('Qty_Invoiced').Asfloat;
    QtyOutstanding := GetSOLineOutQty(SONumber, SOLine);
//    Description := GetSODescription(SONumber, SOLine);
    Description := fieldbyname('Description').asstring;
    SellUnit := fieldbyname('Sell_unit').asinteger;
    UnitPrice := FieldByName('unit_price').Asfloat;
    VatCode := FieldByName('VAT_Code').Asinteger;
    VatDescription := FieldByName('VAT_Description').Asstring;
    VatRate := FieldByName('VAT_Rate').Asfloat;
    VatValue := FieldByName('Vat_Value').asfloat;
    Nominal := FieldByName('Nominal').AsString;
    NotPrinted := FieldByName('Not_printed').asstring;
    Narrative := FieldByName('Narrative').Asinteger;
    Close;
  end;
end;

procedure TSalesInvoiceLine.SaveToDB;
begin
  with FParent.FDataModule.qrySIAddLine do
  begin
    ParamByName('Sales_invoice').AsInteger := FParent.DbKey;
    ParamByName('Invoice_Line_no').AsInteger := SILine;
    ParambyName('Cost_Price').asfloat := CostPrice * FParent.Multiplier;
    ParambyName('Credit_Type').asstring := CreditType;
    ParamByName('Quantity_Invoiced').Asfloat := Quantity * FParent.Multiplier;
    ParamByName('unit_price').Asfloat := UnitPrice * FParent.Multiplier;
    ParamByName('Vat').asinteger := VatCode;
    if CreditType <> 'V' then
      ParamByName('Vat_Value').asfloat := 0.00
    else
      ParamByName('Vat_Value').asfloat := VatValue * FParent.Multiplier;

    ParamByName('Nominal').AsString := Nominal;
    ParamByName('Not_Printed').asstring := NotPrinted;
    if Job = 0 then
      begin
        ParamByName('Job').clear;
      end
    else
      begin
        ParamByName('Job').asfloat := Job;
      end;
    if Narrative = 0 then
      ParamByName('Notes').clear
    else
      ParamByName('Notes').Asinteger := Narrative;
    if SONumber = 0 then
      begin
        ParamByName('Sales_order').clear;
        ParamByName('Sales_order_Line_no').clear;
      end
    else
      begin
        ParamByName('Sales_order').asfloat := SONumber;
        ParamByName('Sales_Order_Line_no').asinteger := SOLine;
      end;
    ParamByName('Sell_unit').asinteger := SellUnit;
    ParamByName('Description').asstring := Description;
    ExecSQL;
  end;
end;

procedure TSalesInvoiceLine.SaveToJB;
var
  orderStatus: integer;
begin
(*  if FParent.Inactive = 'Y' then
    Quantity := 0;

    {Not related to a PO so just update the job bag line}
    begin
      with FParent.FDataModule.qryJBUpLine do
        begin
          ParamByName('Job').Asinteger := Job;
          if FParent.Inactive = 'Y' then
            ParamByName('Job_bag_Line_Invoiced').Asstring := 'N'
          else
            ParamByName('Job_bag_Line_Invoiced').Asstring := 'Y';
          execsql;
        end;
    end;
  {Update the Job Bag header}
  with FParent.FDataModule.qryJBChkStatus do
  begin
    close;
    parambyname('Job_Bag').asinteger := JBNumber;
    open;
    if FieldByName('Lines_not_Invoiced').AsInteger = Fieldbyname('Total_lines').asinteger then
      orderstatus := 10
    else
    if FieldByName('Lines_not_Invoiced').AsInteger = 0 then
      orderstatus := 30
    else
      orderstatus := 25;
  end;

  {Update the SO Status}
  with FParent.FDataModule.qryJBUpHead do
  begin
    close;
    parambyname('Job_Bag').asinteger := JBNumber;
    parambyname('Job_Bag_status').asinteger := orderstatus;
    execsql;
  end;
*)
end;

procedure TSalesInvoiceLine.SaveToPO;
begin
end;

procedure TSalesInvoiceLine.SaveToSO;
var
  orderStatus: integer;
begin
  if FParent.Inactive = 'Y' then
    Quantity := 0;
  with FParent.FDataModule.qrySOUpLine do
  begin
    ParamByName('Sales_Order').Asinteger := SONumber;
    ParamByName('Sales_Order_Line').AsInteger := SOLine;
    ParamByName('Quantity_Invoiced').Asfloat := ((Quantity - OriginalQty)* fParent.Multiplier);
    ExecSQL;
  end;

  {Check the status of SO Lines}
(*  with FParent.FDataModule.qrySOChkStatus do
  begin
    close;
    parambyname('Sales_Order').asinteger := SONumber;
    open;

    if FieldByName('Qty_Inv').AsInteger = 0 then
      orderstatus := 40
    else
    if FieldByName('Qty_Not_Inv').AsInteger > 0 then
      orderstatus := 90
    else
      orderstatus := 100;
  end;
*)

  with FParent.FDataModule.qryGetSOLines do
    begin
      close;
      parambyname('sales_order').asinteger := SONumber;
      open;

      if (fieldbyname('total_invoiced').asinteger >= fieldbyname('total_SO_Invoiced').asinteger) and
         (fieldbyname('total_invoiced').asinteger >= fieldbyname('total_Qty_To_Invoice').asinteger) and
         (fieldbyname('total_invoiced').asinteger > 0) then
        orderstatus := 100
      else
      if fieldbyname('total_invoiced').asinteger > 0 then
        orderstatus := 90
      else
      if fieldbyname('total_complete').asinteger >= fieldbyname('total_lines').asinteger then
        orderstatus := 60
      else
      if fieldbyname('total_complete').asinteger > 0 then
        orderstatus := 55
      else
      if fieldbyname('total_waiting_fitting').asinteger  = fieldbyname('total_lines').asinteger then
        orderstatus := 53
      else
      if fieldbyname('total_in_production').asinteger  > 0 then
        orderstatus := 50
      else
      if (fieldbyname('total_Purchased').asinteger >= fieldbyname('total_Qty_To_Purchase').asinteger)  and
         (fieldbyname('total_Purchased').asinteger > 0) then
        orderstatus := 18
      else
      if fieldbyname('total_Purchased').asinteger > 0 then
        orderstatus := 16
      else
      if fieldbyname('total_job_lines').asinteger = 0 then
        orderstatus := 60
      else
      if fieldbyname('Total_Paid').asfloat > 0 then
        orderstatus := 14
      else
        orderstatus := 10;
    end;

  {Update the SO Status}
  with FParent.FDataModule.qrySOUpHead do
  begin
    close;
    parambyname('Sales_Order').asinteger := SONumber;
    ParamByName('Sales_Order_Status').AsInteger := orderstatus;
    execsql;
  end;
end;

function TSalesInvoiceLine.GetPOLineOutQty(tempCode: real; tempLine: integer): integer;
begin
  with FParent.FDataModule.qryPOLine do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempcode;
      parambyname('Line').asinteger := tempLine;
      open;
      result := fieldbyname('Qty_Outstanding').asinteger;
    end;
end;

function TSalesInvoiceLine.GetSOLineOutQty(tempCode: integer; tempLine: integer): integer;
begin
  with FParent.FDataModule.qrySOLine do
    begin
      close;
      parambyname('Sales_order').asfloat := tempcode;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Qty_Outstanding').asinteger;
    end;
end;

function TSalesInvoiceLine.GetJBLineOutQty(tempCode: integer): integer;
begin
  with FParent.FDataModule.qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempcode;
      open;
      if fieldbyname('Job_Bag_Line_Invoiced').asstring = 'Y' then
        result := 0
      else
        result := fieldbyname('Qty_Outstanding').asinteger;
    end;
end;

procedure TSalesInvoiceLine.SetGoodsValue(const Value: currency);
begin
  FGoodsValue := Value;
end;

procedure TSalesInvoiceLine.SetIntNarr(const Value: integer);
begin
  FIntNarr := Value;
end;

procedure TSalesInvoiceLine.SetIntNarrText(const Value: string);
begin
  FIntNarrText := Value;
end;

procedure TSalesInvoiceLine.SetJBLine(const Value: integer);
begin
  FJBLine := Value;
end;

procedure TSalesInvoiceLine.SetJBNumber(const Value: integer);
begin
  FJBNumber := Value;
end;

procedure TSalesInvoiceLine.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TSalesInvoiceLine.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TSalesInvoiceLine.SetNominal(const Value: string);
begin
  FNominal := Value;
end;

procedure TSalesInvoiceLine.SetOriginalQty(const Value: real);
begin
  FOriginalQty := Value;
end;

procedure TSalesInvoiceLine.SetParent(const Value: TSalesInvoice);
begin
  FParent := Value;
end;

procedure TSalesInvoiceLine.SetPOLine(const Value: integer);
begin
  FPOLine := Value;
end;

procedure TSalesInvoiceLine.SetPONumber(const Value: real);
begin
  FPONumber := Value;
end;

procedure TSalesInvoiceLine.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TSalesInvoiceLine.SetPriceUnitDescr(const Value: string);
begin
  FPriceUnitDescr := Value;
end;

procedure TSalesInvoiceLine.SetProductType(const Value: integer);
begin
  FProductType := Value;
end;

procedure TSalesInvoiceLine.SetQtyOutstanding(const Value: real);
begin
  FQtyOutstanding := Value;
end;

procedure TSalesInvoiceLine.SetQuantity(const Value: real);
begin
  FQuantity := Value;
end;

procedure TSalesInvoiceLine.SetReference(const Value: string);
begin
  FReference := Value;
end;

procedure TSalesInvoiceLine.SetSILine(const Value: integer);
begin
  FSILine := Value;
end;

procedure TSalesInvoiceLine.SetSOLine(const Value: integer);
begin
  FSOLine := Value;
end;

procedure TSalesInvoiceLine.SetSONumber(const Value: integer);
begin
  FSONumber := Value;
end;

procedure TSalesInvoiceLine.SetVatCode(const Value: integer);
begin
  FVatCode := Value;
end;

procedure TSalesInvoiceLine.SetVATRate(const Value: real);
begin
  FVATRate := Value;
end;

procedure TSalesInvoiceLine.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

function TSalesInvoiceLine.GetJBDescription(tempCode: integer): string;
begin
  result := '';
  with FParent.Datamodule.qryGetJB do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      open;
      result := fieldbyname('Job_Bag_Line_descr').asstring;
    end;
end;

function TSalesInvoiceLine.GetPODescription(tempCode: real;
  tempLine: integer): string;
begin
  result := '';
  with FParent.Datamodule.qryGetPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;
      result := fieldbyname('Customers_desc').asstring;
    end;
end;

function TSalesInvoiceLine.GetSODescription(tempCode,
  tempLine: integer): string;
begin
  result := '';
  with FParent.Datamodule.qrySOLine do
    begin
      close;
      parambyname('Sales_Order').asfloat := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('description').asstring;
    end;
end;

procedure TSalesInvoiceLine.SetCreditType(const Value: string);
begin
  FCreditType := Value;
end;

procedure TSalesInvoiceLine.SetPackQty(const Value: integer);
begin
  FPackQty := Value;
end;

function TSalesInvoiceLine.GetPackQty(tempCode,
  tempLine: integer): integer;
begin
  with FParent.Datamodule.qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      open;
      {if replenish from warehouse then PackQty set to 0}
      if fieldbyname('Replenish_source').asinteger = 2 then
        begin
          result := 0;
          exit;
        end;
    end;

  with FParent.Datamodule.qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Sell_Pack_Quantity').asinteger;
    end;
end;

procedure TSalesInvoiceLine.SetVatValue(const Value: real);
begin
  FVatValue := Value;
end;

procedure TSalesInvoiceLine.SetNotPrinted(const Value: string);
begin
  FNotPrinted := Value;
end;

procedure TSalesInvoiceLine.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
end;

procedure TSalesInvoiceLine.SetProductTypeDesc(const Value: string);
begin
  FProductTypeDesc := Value;
end;

procedure TSalesInvoiceLine.SetJob(const Value: integer);
begin
  FJob := Value;
end;

procedure TSalesInvoiceLine.SetSellUnit(const Value: integer);
begin
  FSellUnit := Value;
end;

procedure TSalesInvoiceLine.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

procedure TSalesInvoiceLine.SetVATDescription(const Value: string);
begin
  FVATDescription := Value;
end;

procedure TSalesInvoiceLine.SetVATReverseCharge(const Value: boolean);
begin
  FVATReverseCharge := Value;
end;

{ TSalesInvoiceLines }

procedure TSalesInvoiceLines.Add(aLine: TSalesInvoiceLine);
begin
  FItems.Add(aLine);
end;

procedure TSalesInvoiceLines.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSalesInvoiceLine(FItems[i]).Free;
end;

function TSalesInvoiceLines.Clone: TSalesInvoiceLines;
var
  i : integer;
begin
  Result := TSalesInvoiceLines.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TSalesInvoiceLine(FItems[i]).Clone);
end;

constructor TSalesInvoiceLines.Create(SalesInvoice : TSalesInvoice);
begin
  FParent := SalesInvoice;
  FItems := TList.Create;
end;

procedure TSalesInvoiceLines.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TSalesInvoiceLines.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSalesInvoiceLine(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TSalesInvoiceLines.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TSalesInvoiceLines.GetItems(Index: integer): TSalesInvoiceLine;
begin
  Result := TSalesInvoiceLine(FItems[Index]);
end;

procedure TSalesInvoiceLines.SetItems(Index: integer;
  const Value: TSalesInvoiceLine);
begin
  FItems[Index] := Value;
end;

function TSalesInvoiceLines.IndexOf(const LineNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TSalesInvoiceLine(FItems[i]).SILine = LineNumber then
      Result := i;
end;

procedure TSalesInvoiceLines.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSalesInvoiceLine(FItems[i]).SILine:= (i+1);
end;

{dtmdlSalesInvoice}

function TdtmdlSalesInvoice.CheckInvoiceUnique(tempInvoiceNo: string; tempInvoiceID: integer): boolean;
begin
  result := false;

  with qryCheckInvoice do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tempInvoiceID;
      parambyname('Invoice_no').asstring := tempInvoiceNo;
      open;
      result := recordcount = 0;
    end;
end;

function TdtmdlSalesInvoice.GetHeaderCount: integer;
begin
  Result := qrySIHeaderGrid.RecordCount;
end;

function TdtmdlSalesInvoice.GetNextSINumber: integer;
begin
  with qrySIGetLast do
    begin
      close;
      open;
      result := fieldbyname('Last_Sales_invoice').asinteger + 1;
    end;
end;

procedure TdtmdlSalesInvoice.RefreshData;
var
  sTemp: string;
  dtStart: TDateTime;
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  with qrySIHeaderGrid do
  begin
    sTemp := '';

    Close;
(*
    ParamByName('Code_From').Asstring := '%'+ Customer + '%';
    if DisplayArchived then
      ParamByName('status').asinteger := 0
    else
      ParamByName('status').asinteger := 30;

    {Determine whether to display deleted invoices}
    if DisplayInactive then
      ParamByName('Inactive').asString := 'Y'
    else
      ParamByName('Inactive').asString := 'N';

*)
    sTemp := sTemp + qrySIHeaderBase.sql.text;

    if Description <> '' then
      sTemp := sTemp + ' AND Sales_Invoice.Description LIKE ''%' + Description + '%''';
    if SiteName <> '' then
      sTemp := sTemp + ' AND Customer_Branch.Branch_Name LIKE ''%' + SiteName + '%''';
    if Customer <> '' then
      sTemp := sTemp + ' AND Sales_Invoice.Customer_name LIKE ''%' + Customer + '%''';
    if OfficeContact <> '' then
      sTemp := sTemp + ' AND Account_Manager.Operator_Name LIKE ''%' + OfficeContact + '%''';
    if OperatorName <> '' then
      sTemp := sTemp + ' AND Operator.Operator_Name LIKE ''%' + OperatorName + '%''';
    if RepName <> '' then
      sTemp := sTemp + ' AND Rep.Rep_Name LIKE ''%' + RepName + '%''';
    if CustomerOrder <> '' then
      sTemp := sTemp + ' AND Sales_Invoice.Reference LIKE ''%' + CustomerOrder + '%''';
    if DisplayArchived then
      sTemp := sTemp + ' AND Sales_Invoice.Sales_invoice_status > 0 '
    else
      sTemp := sTemp + ' AND Sales_Invoice.Sales_invoice_status < 30 ';
    if ShowInactive then
      sTemp := sTemp + ' AND ((Sales_Invoice.inactive is NULL) OR (Sales_Invoice.inactive = ''N'')'
                    + ' OR (Sales_Invoice.inactive = ''Y'')) '
    else
        sTemp := sTemp + ' AND ((Sales_Invoice.inactive is NULL) OR (Sales_Invoice.inactive = ''N''))';
    if Status <> '' then
      sTemp := sTemp + ' AND Sales_Invoice_Status.Invoice_Status_Description LIKE ''%' + status + '%''';
    if Reference <> '' then
      sTemp := sTemp + ' AND (SELECT TOP 1 Sales_Order.Reference ' +
                       '      FROM Sales_Order, sales_Invoice_line '+
                       '      WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.sales_invoice AND '+
                       '        sales_order.sales_order = sales_invoice_line.Sales_order) LIKE ''%' + Reference + '%''';

    case TradeRetail of
      0:  begin
            Parambyname('Is_Retail_Customer').asstring := 'A';
            Parambyname('Is_Commercial_Customer').asstring := 'A';
          end;
      1:  begin
            ParambyName('Is_Retail_Customer').asstring := 'N';
            Parambyname('Is_Commercial_Customer').asstring := 'N';
          end;
      2:  begin
            Parambyname('Is_Retail_Customer').asstring := 'Y';
            Parambyname('Is_Commercial_Customer').asstring := 'Z';
          end;
      3:  begin
            Parambyname('Is_Retail_Customer').asstring := 'Z';
            Parambyname('Is_Commercial_Customer').asstring := 'Y';
          end;
    end;
    
    case Revenuecentre of
       -1: sTemp := sTemp + ' AND (Sales_Invoice.Revenue_Centre IS NULL)';
    else
      begin
       sTemp := sTemp + ' AND ((Sales_Invoice.Revenue_Centre = ' + inttostr(RevenueCentre) + ') OR (0 = ' + inttostr(RevenueCentre) + '))' ;
      end;
    end;

    if SortOrder = '' then
      sTemp := sTemp + ' ORDER BY Sales_Invoice.Sales_Invoice desc'
    else
      sTemp := sTemp + ' ORDER BY ' + SortOrder;

    sql.text := sTemp;
    Open;
  end;
end;

procedure TdtmdlSalesInvoice.RefreshPOData;
var
  temp: String;
begin
  with qryPOAllLines do
  begin
    SQL.Clear;
    Close;
    if DisplayAllOrders then
      begin
        temp := qryPOAll.SQL.text;
        temp := temp + '(Purchase_OrderLine.Purch_Ord_Line_Status >= 20) AND ';
        temp := temp + '(Purchase_OrderLine.Purch_Ord_Line_Status < 30) AND ';
      end
    else
      begin
(*        temp := qryPODeliv.SQL.text;
        temp := temp + '(Purchase_OrderLine.Purch_Ord_Line_Status >= 21) AND ';
        temp := temp + '(Purchase_OrderLine.Purch_Ord_Line_Status < 30) AND ';
*)
        temp := qryPO2bInvoiced.SQL.text;
      end;

    temp := temp + ' (Customer.Name Like ''%' + CustomerName + '%'') AND ';

    if DisplaySuppInvoiced then
      temp := temp + '((Purchase_OrderLine.Supp_Inv_Recd = ''Y'') OR (Purchase_OrderLine.Supp_Inv_Recd = ''Y'')) '
    else
      temp := temp + '((Purchase_OrderLine.Supp_Inv_Recd = ''Y'') OR (Purchase_OrderLine.Supp_Inv_Recd = ''N'')) ';

(*    if DisplayAllOrders then
      temp := temp + StockSQL
    else
      temp := temp + NonStockSQL;
*)
   if DisplayAllOrders then
      temp := temp + StockSQL
    else
      temp := temp + InvoiceSQL;

    SQL.text := temp;
    Open;
    First;
  end;
end;

procedure TdtmdlSalesInvoice.RefreshSOData;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
begin
  if dtmdlWorktops.IsSQL then
    Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
  else
    Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
end;
var
  endDate: TDateTime;
begin
  qrySOAll.Close;
  qrySOAll.ParamByName('Code_From').Asstring := CustomerName + '%';

  if DisplayUnfitted then
    qrySOAll.ParamByName('Status').Asinteger := 10
  else
    qrySOAll.ParamByName('Status').Asinteger := 55;

  if DisplayFuture then
  begin
    endDate := date + 365;
    qrySOAll.Parambyname('Date_Required').asdatetime := endDate;
  end
  else
  begin
    endDate := date;
    qrySOAll.Parambyname('Date_Required').asdatetime := endDate;
  end;

  case Revenuecentre of
    -1: qrySOAll.parambyname('Revenue_Centre').clear;
    else
      qrySOAll.parambyname('Revenue_Centre').asinteger := RevenueCentre;
  end;

  qrySOAll.Open;
end;

procedure TdtmdlSalesInvoice.RefreshJBData;
begin
  with qryJBAll do
  begin
    Close;
    ParamByName('Code_From').Asstring := CustomerName + '%';
    Open;
    First;
  end;
end;

procedure TdtmdlSalesInvoice.qrySIHeaderGridCalcFields(DataSet: TDataSet);
begin
  DataSet['Total_Value'] := StrToFloatDef(formatfloat('0.00', Dataset['Goods_Value']), 0, FormatSettings) +
                            StrToFloatDef(formatfloat('0.00', Dataset['VAT_Value']), 0, FormatSettings);

  if Dataset.fieldbyname('Inactive').asstring = 'Y' then
    Dataset.FieldByName('Invoice_Status').asstring := 'Deleted'
  else
    Dataset.FieldByName('Invoice_Status').asstring := Dataset.fieldbyname('Status_Description').asstring;
end;

function TdtmdlSalesInvoice.GetCurrentSInvoice: integer;
begin
  Result := 0;
  if not qrySIHeaderGrid.IsEmpty then
    Result := qrySIHeaderGrid.FieldByName('Sales_invoice').AsInteger;
end;

procedure TdtmdlSalesInvoice.ListAllLines(const aKey: integer);
begin
  with qrySIAllLines do
  begin
    Close;
    ParamByname('Sales_Invoice').AsInteger := aKey;
    Open;
  end;
end;

function TdtmdlSalesInvoice.GetCustomerAddress(tempCust: integer): string;
var
  i: integer;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      for i := 1 to 5 do
        begin
          if trim(fields[i].asstring) = '' then continue;
          result := result + trim(fields[i].asstring) + #13#10;
        end;
    end;
end;

function TdtmdlSalesInvoice.GetInvoiceAddress(tempAddr: integer): string;
var
  i: integer;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempAddr;
      open;
      for i := 1 to 5 do
        begin
          if trim(fields[i].asstring) = '' then continue;
          result := result + trim(fields[i].asstring) + #13#10;
        end;
    end;
end;

function TdtmdlSalesInvoice.GetAccountCode(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Account_code').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetSOPart(tempCode: integer; tempLine: integer): string;
begin
  result := '';
  with qryGetSO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Product_Code').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetInvoiceStatus(tempcode: integer): string;
begin
  result := '';
  with qryGetInvStatus do
    begin
      close;
      parambyname('Sales_invoice_Status').asinteger := tempCode;
      open;
      result := fieldbyname('Invoice_Status_Description').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetDefPriceUnit: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Price_unit').asinteger;
    end;
end;

function TdtmdlSalesInvoice.GetNominaltype: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Nominal_level').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetDefSalesNominal: string;
begin
  result := '';
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Default_sales_Nominal').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetVATRate(tempCode: integer): real;
begin
  with qryGetVAT do
    begin
      close;
      parambyname('VAT').asinteger := tempCode;
      open;
      result := fieldbyname('VAT_Rate').asfloat;
    end;
end;

function TdtmdlSalesInvoice.GetVATReverseCharge(tempCode: integer): boolean;
begin
  Result := false;
  with qryGetVAT do
    begin
      close;
      parambyname('VAT').asinteger := tempCode;
      open;
      result := (fieldbyname('Reverse_Charge').asstring = 'Y');
    end;
end;

function TdtmdlSalesInvoice.GetPUnitDescription(tempCode: integer): string;
begin
  result := '';
  with qryGetPriceUnit do
    begin
      close;
      parambyname('Price_Unit').asinteger := tempCode;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetPUnitFactor(tempCode: integer): integer;
begin
  with qryGetPriceUnit do
    begin
      close;
      parambyname('Price_UNit').asinteger := tempCode;
      open;
      result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

function TdtmdlSalesInvoice.GetPTypeNominal(tempCode: integer): string;
begin
  result := '';
  with qryGetPType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := fieldbyname('Nominal').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetPTypeDesc(tempCode: integer): string;
begin
  result := '';
  with qryGetPType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetNarrative(const iNarrative: integer): string;
var
  Narrative : TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

procedure TdtmdlSalesInvoice.SaveNarrative(var iNarrative: Integer;
  const Data: string);
var
  Narrative: TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.DataInfo := Data;
    Narrative.SaveToDB;
    iNarrative := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

function TdtmdlSalesInvoice.GetProductNominal(tempCode: integer; templine: integer): string;
begin
  result := '';
  with qryGetSO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Default_Sales_Nominal').asstring;
    end;
end;

procedure TdtmdlSalesInvoice.RefreshJBLData;
begin
  with qryJBLines do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger := JBNumber;
    Open;
    First;
  end;

end;

procedure TdtmdlSalesInvoice.RefreshCreditData;
var
  sTemp: string;
  dtStart: TDateTime;
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  with qrySCHeaderGrid do
  begin
    sTemp := '';

    Close;
(*    ParamByName('Code_From').Asstring := Customer + '%';
    if DisplayArchived then
      ParamByName('status').asinteger := 0
    else
      ParamByName('status').asinteger := 30;

    {Determine whether to display deleted invoices}
    if DisplayInactive then
      ParamByName('Inactive').asString := 'Y'
    else
      ParamByName('Inactive').asString := 'N';

*)
    sTemp := sTemp + qrySCHeaderBase.sql.text;

    if SiteName <> '' then
      sTemp := sTemp + ' AND Customer_Branch.Branch_Name LIKE ''%' + SiteName + '%''';
    if Description <> '' then
      sTemp := sTemp + ' AND Sales_Invoice.Description LIKE ''%' + Description + '%''';
    if Customer <> '' then
      sTemp := sTemp + ' AND Sales_Invoice.Customer_name LIKE ''%' + Customer + '%''';
    if OfficeContact <> '' then
      sTemp := sTemp + ' AND Account_Manager.Operator_Name LIKE ''%' + OfficeContact + '%''';
    if OperatorName <> '' then
      sTemp := sTemp + ' AND Operator.Operator_Name LIKE ''%' + OperatorName + '%''';
    if RepName <> '' then
      sTemp := sTemp + ' AND Rep.Rep_Name LIKE ''%' + RepName + '%''';
    if CustomerOrder <> '' then
      sTemp := sTemp + ' AND Sales_Invoice.Reference LIKE ''%' + CustomerOrder + '%''';
    if DisplayArchived then
      sTemp := sTemp + ' AND Sales_Invoice.Sales_invoice_status > 0 '
    else
      sTemp := sTemp + ' AND Sales_Invoice.Sales_invoice_status < 30 ';
    if ShowInactive then
      sTemp := sTemp + ' AND ((Sales_Invoice.inactive is NULL) OR (Sales_Invoice.inactive = ''N'')'
                    + ' OR (Sales_Invoice.inactive = ''Y'')) '
    else
        sTemp := sTemp + ' AND ((Sales_Invoice.inactive is NULL) OR (Sales_Invoice.inactive = ''N''))';
    if Status <> '' then
      sTemp := sTemp + ' AND Sales_Invoice_Status.Invoice_Status_Description LIKE ''%' + status + '%''';
    if Reference <> '' then
      sTemp := sTemp + ' AND (SELECT TOP 1 Sales_Order.Reference ' +
                       '      FROM Sales_Order, sales_Invoice_line '+
                       '      WHERE sales_Invoice_line.sales_invoice = Sales_Invoice.sales_invoice AND '+
                       '        sales_order.sales_order = sales_invoice_line.Sales_order) LIKE ''%' + Reference + '%''';

    case TradeRetail of
      0:  begin
            Parambyname('Is_Retail_Customer').asstring := 'A';
            Parambyname('Is_Commercial_Customer').asstring := 'A';
          end;
      1:  begin
            ParambyName('Is_Retail_Customer').asstring := 'N';
            Parambyname('Is_Commercial_Customer').asstring := 'N';
          end;
      2:  begin
            Parambyname('Is_Retail_Customer').asstring := 'Y';
            Parambyname('Is_Commercial_Customer').asstring := 'Z';
          end;
      3:  begin
            Parambyname('Is_Retail_Customer').asstring := 'Z';
            Parambyname('Is_Commercial_Customer').asstring := 'Y';
          end;
    end;

    case Revenuecentre of
       -1: sTemp := sTemp + ' AND (Sales_Invoice.Revenue_Centre IS NULL)';
    else
      begin
       sTemp := sTemp + ' AND ((Sales_Invoice.Revenue_Centre = ' + inttostr(RevenueCentre) + ') OR (0 = ' + inttostr(RevenueCentre) + '))' ;
      end;
    end;

    if SortOrder = '' then
      sTemp := sTemp + ' ORDER BY Sales_Invoice.Sales_Invoice desc'
    else
      sTemp := sTemp + ' ORDER BY ' + SortOrder;

    sql.text := sTemp;
    Open;
  end;
end;

function TdtmdlSalesInvoice.GetCreditHeaderCount: integer;
begin
  Result := qrySCHeaderGrid.RecordCount;
end;

function TdtmdlSalesInvoice.GetCurrentCreditNote: integer;
begin
  if qrySCHeaderGrid.RecordCount > 0 then
    Result := qrySCHeaderGrid.FieldByName('Sales_invoice').AsInteger
  else
    Result := 0;
end;

function TdtmdlSalesInvoice.GetLastPeriodEndDate: TDateTime;
begin
  with qryPeriodEnd do
    begin
      close;
      open;
      result := fieldbyname('Last_period_end_Date').asdatetime;
    end;
end;

function TdtmdlSalesInvoice.GetMaterialNominal(tempCode,
  tempLine: integer): string;
begin
  result := '';
  with qryGetSOQuote do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Sales_Nominal').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetWorkTopTypeTradeNominal(tempCode,
  tempLine: integer): string;
begin
  result := '';
  with qryGetSOQuote do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Worktop_Type_Nominal').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetWorkTopTypeRetailNominal(tempCode,
  tempLine: integer): string;
begin
  result := '';
  with qryGetSOQuote do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Worktop_Type_Nominal_Retail').asstring;
    end;
end;

function TdtmdlSalesInvoice.GetCustomerTypeNominal(
  tempCode: integer): string;
begin
  result := '';

  with qryGetCustTypeNominal do
    begin
      close;
      parambyname('Customer').asinteger := tempCode;
      open;
      result := fieldbyname('Sales_Nominal').asstring;
    end;
end;

function TdtmdlSalesInvoice.SetReverseCharge(tempCust: integer): boolean;
begin
  result := false;
  with qryGetCustomerVat do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := (fieldbyname('Reverse_Charge').asstring = 'Y');
    end;
end;

function TdtmdlSalesInvoice.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (CustomerOrder <> '') or
            (ProjectReference <> '') or
            (SiteName <> '') or
            (Reference <> '') or
            (Description <> '') or
            (OfficeContact <> '') or
            (OperatorName <> '') or
            (RepName <> '') or
            (Reference <> '') or
            (Status <> '') then
    result := true
  else
    result := false;
end;

end.
