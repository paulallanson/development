unit WTSalesOrderDM;

interface

uses
  SysUtils, Classes, DB, wtNotesDM, wtQuotesDM, AllCommon, ShellAPI,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TsopMode   = (sopAdd, sopChange, sopDelete, sopCopy, sopView, sopConvert, sopRemedial);
  TsolMode   = (solAdd, solChange, solDelete, solCopy, solRequote, solView);
  TsoevMode   = (soevAdd, soevChange, soevDelete, soevView);

  TdtmdlSalesOrder = class(TDataModule)
    qryAllSales: TFDQuery;
    dtsAllSales: TDataSource;
    qrydummy: TFDQuery;
    qryZero: TFDQuery;
    qrySOGetLast: TFDQuery;
    qrySOHeader: TFDQuery;
    qrySOAllLines: TFDQuery;
    qryOperator: TFDQuery;
    dtsOperator: TDataSource;
    qryUpCompany: TFDQuery;
    qrySOAddHeader: TFDQuery;
    qrySOUpHeader: TFDQuery;
    qrySOLine: TFDQuery;
    qrySOAddLine: TFDQuery;
    qryRep: TFDQuery;
    dtsRep: TDataSource;
    qryGetCustomer: TFDQuery;
    qrygetRep: TFDQuery;
    qryGetAddress: TFDQuery;
    qryGetNextAdd: TFDQuery;
    qryAddAddress: TFDQuery;
    qryUpAddress: TFDQuery;
    qryDelAddress: TFDQuery;
    qryVAT: TFDQuery;
    qryVATVat: TIntegerField;
    qryVATVat_Rate: TCurrencyField;
    qryVATDescription: TWideStringField;
    qryVATVat_Code: TWideStringField;
    dtsVAT: TDataSource;
    qryjobHeader: TFDQuery;
    qryGetVat: TFDQuery;
    qryQHeader: TFDQuery;
    qryAllSalesSales_Order: TIntegerField;
    qryAllSalesDate_Raised: TDateTimeField;
    qryAllSalesDate_Required: TDateTimeField;
    qryAllSalesCustomer: TIntegerField;
    qryAllSalesReference: TWideStringField;
    qryAllSalesExtra_Notes: TIntegerField;
    qryAllSalesOperator: TIntegerField;
    qryAllSalesContact_Name: TWideStringField;
    qryAllSalesOrder_ref_no: TWideStringField;
    qryAllSalesSales_Order_Status: TIntegerField;
    qryAllSalesDeposit_amount: TCurrencyField;
    qryAllSalesDeposit_Terms: TCurrencyField;
    qryAllSalesGoods_Value: TCurrencyField;
    qryAllSalesVAT_Value: TCurrencyField;
    qryAllSalesRep: TIntegerField;
    qryAllSalesInstall_Address: TIntegerField;
    qryAllSalesInactive: TWideStringField;
    qryAllSalesCustomer_Name: TWideStringField;
    qryAllSalesInactive_Reason: TIntegerField;
    qryAllSalesAddress: TIntegerField;
    qryAllSalesTemplate_Date: TDateTimeField;
    qryAllSalesoriginal_customer_name: TWideStringField;
    qryAllSalesOperator_name: TWideStringField;
    qryAllSalesTotal_Value: TCurrencyField;
    qryAllSalessales_order_status_desc: TWideStringField;
    qryCustQuotes: TFDQuery;    
    dsCustQuotes: TDataSource;
    dsDummy: TDataSource;
    qryGetQuoteJob: TFDQuery;
    qryGetSOLines: TFDQuery;
    qrySOUpStatus: TFDQuery;    
    qryAllSalesOn_Hold: TWideStringField;
    qryAllSalesStatus_Text: TWideStringField;
    qrySOUpdLine: TFDQuery;
    qryGetSOrderInvoices: TFDQuery;
    qrySetSOrderInactive: TFDQuery;
    qryUpCustomer: TFDQuery;
    qryUpQuote: TFDQuery;    
    qryAllSalesDescriptive_Reference: TWideStringField;
    qryAllSalesTemplate_Date_New: TWideStringField;
    qryAllSalesFitting_Date_New: TWideStringField;
    qrySOUpSalesInvoice: TFDQuery;
    qryAllSalesOffice_Contact_Name: TWideStringField;
    qryAllSalesIs_Retail_Customer: TWideStringField;   
    qryGetLinkedQuotes: TFDQuery;
    dtsGetLinkedQuotes: TDataSource;
    qryGetLinkedQuotesSales_Order: TIntegerField;
    qryGetLinkedQuotesSales_order_Line_no: TIntegerField;
    qryGetLinkedQuotesQuote_Number: TCurrencyField;
    qryGetLinkedQuotesQuote: TIntegerField;
    qryGetLinkedQuotesDate_Raised: TDateTimeField;
    qryGetLinkedQuotesDate_Required: TDateTimeField;
    qryGetLinkedQuotesDescription: TWideStringField;
    qryGetLinkedQuotesOriginal_Quote: TIntegerField;
    qryGetLinkedQuotesOperator_Name: TWideStringField;
    qryGetLinkedQuotesInstallation_price: TCurrencyField;
    qryGetLinkedQuotesDelivery_Price: TCurrencyField;
    qryGetLinkedQuotesSurvey_price: TCurrencyField;
    qryGetLinkedQuotesComplete_Price: TCurrencyField;
    qryGetLinkedQuotesTotal_Price: TCurrencyField;
    qryGetLinkedQuotesQuote_status_description: TWideStringField;
    qryGetLinkedQuotesMaterial_Type_Description: TWideStringField;
    qryGetSOHead: TFDQuery;
    qryFitter: TFDQuery;
    qryTemplater: TFDQuery;
    dtsFitter: TDataSource;
    dtsTemplater: TDataSource;
    qrySOEvent: TFDQuery;
    qrySOAddEvent: TFDQuery;
    qrySOAllEvents: TFDQuery;
    qryQAllEvents: TFDQuery;
    qryAllSalesProject_Reference: TWideStringField;
    qryAllSalesCustomer_is_Speculative: TWideStringField;
    qryUpQuoteVersions: TFDQuery;
    qryGetQuote: TFDQuery;
    qryQuoteSlabs: TFDQuery;
    qrySOPurchases: TFDQuery;
    dtsSOPurchases: TDataSource;
    qrySOPurchasesPurchase_Order: TIntegerField;
    qrySOPurchasesLine_no: TIntegerField;
    qrySOPurchasesPO_Line_Description: TWideStringField;
    qrySOPurchasesUnit_cost: TCurrencyField;
    qrySOPurchasesSlab_Unit_Cost: TCurrencyField;
    qrySOPurchasesDate_Raised: TDateTimeField;
    qrySOPurchasesDate_Required: TDateTimeField;
    qrySOPurchasesOperator: TIntegerField;
    qrySOPurchasesOperator_Name: TWideStringField;
    qrySOPurchasesOffice_Contact: TIntegerField;
    qrySOPurchasesOffice_Contact_Name: TWideStringField;
    qrySOPurchasesInactive: TWideStringField;
    qrySOPurchasesOn_Hold: TWideStringField;
    qrySOPurchasesSupplier: TIntegerField;
    qrySOPurchasesSupplier_name: TWideStringField;
    qrySOPurchasesContact_no: TIntegerField;
    qrySOPurchasesContact_name: TWideStringField;
    qrySOPurchasesGRN_Number: TWideStringField;
    qrySOPurchasesSales_Order: TIntegerField;
    qrySOPurchasesSales_Order_Line_No: TIntegerField;
    qrySOPurchasesSlab_Depth: TIntegerField;
    qrySOPurchasesSlab_Length: TIntegerField;
    qrySOPurchasesSlab_Description: TWideStringField;
    qrySOPurchasesSlab_Size_Description: TWideStringField;
    qrySOPurchasesPurchase_Order_Status: TIntegerField;
    qrySOPurchasesStatus_Description: TWideStringField;
    qrySOPurchasesTotal_Cost: TCurrencyField;
    qryRemovePO: TFDQuery;
    qryDeletePO: TFDQuery;
    qryAllSalesDeposit_Required: TCurrencyField;
    qryGetCustomerContact: TFDQuery;
    qryGetSOSlabs: TFDQuery;
    qryGetPurchases: TFDQuery;
    qryAllSalesDate_Type: TWideStringField;
    qryGetSOrderEmail: TFDQuery;
    qryGetQuoteSlabs: TFDQuery;
    dtsGetQuoteSlabs: TDataSource;
    qrySOPurchasesQuantity: TCurrencyField;
    qryAllSalesQuote: TIntegerField;
    qryAllSalesTemplater_Name: TWideStringField;
    qryAllSalesFitter_Name: TWideStringField;
    qrySalesInvoices: TFDQuery;
    dtsSalesInvoices: TDataSource;
    qryUpQuoteCustomer: TFDQuery;
    qryUpJobCustomer: TFDQuery;
    qryAllSalesAccount_Code: TWideStringField;
    qryGetSOLQuoteNo: TFDQuery;
    qryJobs: TFDQuery;
    dtsJobs: TDataSource;
    qryRemedials: TFDQuery;
    dtsRemedials: TDataSource;
    qryJobsDummy: TFDQuery;
    qryAllSalesTemplate_Docs_Returned: TWideStringField;
    qryAllSalesFitting_Docs_Returned: TWideStringField;
    qrySOUpTemplate: TFDQuery;
    qryAllSalesJob: TCurrencyField;
    qrySOUpFitting: TFDQuery;
    qryAllSalesJob_Status: TIntegerField;
    qryAllSalesWorktop_Weight: TCurrencyField;
    qryRevenueCentre: TFDQuery;
    dtsRevenueCentre: TDataSource;
    qryAllSalesRemedial_Production: TWideStringField;
    qryAllSalesRemedial_No_Production: TWideStringField;
    qryRemedialCount: TFDQuery;
    qryAllSalesSales_Order_Number: TWideStringField;
    qryRemedialReport: TFDQuery;
    qrySOUpRemedial: TFDQuery;
    qryJobsDummyOlder: TFDQuery;
    qrySOUpRemedial_Access: TFDQuery;
    qryDummyOld: TFDQuery;
    qryAllSalesBranch_Name: TWideStringField;
    qryJobsDummyOld: TFDQuery;
    procedure qryAllSalesStatus_TextGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryAllSalesTemplate_Date_NewGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryAllSalesFitting_Date_NewGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    function GetCurrentSOrder: integer;
    function GetHeaderCountAll: integer;
    function GetNextSONumber: integer;
  public
    ActionEnd, ActionStart: TDateTime;
    ShowOnSchedule: boolean;
    ShowInactive : boolean;
    SortType: string;
    SortOrder: string;
    ShowLive: boolean;
    ShowRecords: integer;
    Customer: integer;
    CustomerName: string;
    CustomerOrder: string;
    Description: string;
    FitterName: string;
    JobNo: integer;
    OfficeContact: string;
    OperatorName: string;
    OrderStatus: integer;
    QuoteNo: integer;
    ProjectReference: string;
    QuoteReference: string;
    Reference: string;
    SiteName: string;
    Status: string;
    TemplateName: string;
    TradeRetail: integer;
    property CurrentSOrder : integer read GetCurrentSOrder;
    property HeaderCountAll: integer read GetHeaderCountAll;
    function GetCustomerAddress(tempcust: integer): string;
    function GetCustomerRep(tempcode: integer): string;
    function UsingSearch: boolean;
    procedure RefreshAlldata;
    procedure Refreshdata;
    procedure RefreshFittingdata;
    procedure RefreshQuoteData;
    function GetAddressCounty(tempCode: integer): string;
    function GetAddressEmail(tempCode: integer): string;
    function GetAddressFax(tempCode: integer): string;
    function GetAddressLocale(tempCode: integer): string;
    function GetAddressName(tempCode: integer): string;
    function GetAddressPostcode(tempCode: integer): string;
    function GetAddressStreet(tempCode: integer): string;
    function GetAddressTelephone(tempCode: integer): string;
    function GetAddressTown(tempCode: integer): string;
    function GetAddressWebsite(tempCode: integer): string;
    function GetCustomerContactNo(tempCode: integer; tempName: string): integer;
    function GetCustomerCounty(tempCust: integer): string;
    function GetCustomerEmail(tempCust: integer): string;
    function GetCustomerFax(tempCust: integer): string;
    function GetCustomerLocale(tempCust: integer): string;
    function GetCustomerPostcode(tempCust: integer): string;
    function GetCustomerStreet(tempCust: integer): string;
    function GetCustomerTelephone(tempCust: integer): string;
    function GetCustomerTown(tempCust: integer): string;
    function GetCustomerWebsite(tempCust: integer): string;
    function GetFittingDate(tempCode: integer): TDateTime;
    function GetNarrative(const iNarrative: integer): string;
    function GetQuoteJob(tempQuote: real): integer;
    function GetQuoteSlabSupplierCount(tempQuote: real): integer;
    function GetSOrderDetails(tempCode: integer): boolean;
    function GetSOrderQuoteNo(tempCode: integer): integer;
    function GetSalesOrderContactEmail(tempCode: integer): string;
    function GetTemplateDate(tempCode: integer): TDateTime;
    function getVatDescription(tempCode: integer): string;
    function getVatRate(tempCode: integer):double;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    procedure SetSOrderInactive(tempCode: integer);
    procedure SetCustomerProspect(tempCode: integer);
    function SetAddress(iAddress: integer;
                        AddName, Street, AddLocale: string;
                        Town, postcode, County, email, phone, AddType: string): integer;
    procedure SetFittingDocsReceived(tempCode: integer; TempStatus: string);
    procedure SetRemedialCompleted(tempCode: integer; TempStatus: string);
    procedure SetTemplatingDocsReceived(tempCode: integer; TempStatus: string);
    function SalesOrderRequiresPurchasing(tempCode: integer): boolean;
    function OutstandingPurchases(tempCode: integer): boolean;
  end;

  TSOrder = class;

  TSOEvent   = class
  private
    FEventNumber: integer;
    FOperator: integer;
    FOperatorName: string;
    FDateEntered: TDateTime;
    FNarrative: TNotes;
    FParent: TSOrder;
    procedure SetDateEntered(const Value: TDateTime);
    procedure SetEventNumber(const Value: integer);
    procedure SetNarrative(const Value: TNotes);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetParent(const Value: TSOrder);
  public
    constructor Create(SOrder : TSOrder);
    destructor Destroy; override;
    function Clone : TSOEvent;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DateEntered: TDateTime read FDateEntered write SetDateEntered;
    property EventNumber: integer read FEventNumber write SetEventNumber;
    property Narrative: TNotes read FNarrative write SetNarrative;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName:string read FOperatorName write SetOperatorName;
    property Parent: TSOrder read FParent write SetParent;
  end;

  TSOEvents = class;

  TSOPurchase = class
  private
    FPOLNumber: integer;
    FParent: TSOrder;
    FOnHold: boolean;
    Finactive: boolean;
    FQuantity: double;
    FPONumber: integer;
    FSupplier: integer;
    FSupplierContact: integer;
    FOperator: integer;
    FPOLineNumber: integer;
    FOfficeContact: integer;
    FSupplierName: string;
    FSupplierContactName: string;
    FOfficeContactName: string;
    FLineDescription: string;
    FOperatorName: string;
    FDateRequired: TdateTime;
    FDateRaised: TDateTime;
    FUnitCost: currency;
    FStatus: integer;
    FSlabDescription: string;
    FGRNNumber: string;
    FStatusDescription: string;
    FSlabLength: integer;
    FSlabDepth: integer;
    procedure SetPOLNumber(const Value: integer);
    procedure SetParent(const Value: TSOrder);
    procedure SetDateRaised(const Value: TDateTime);
    procedure SetDateRequired(const Value: TdateTime);
    procedure Setinactive(const Value: boolean);
    procedure SetLineDescription(const Value: string);
    procedure SetOfficeContact(const Value: integer);
    procedure SetOfficeContactName(const Value: string);
    procedure SetOnHold(const Value: boolean);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetPOLineNumber(const Value: integer);
    procedure SetPONumber(const Value: integer);
    procedure SetQuantity(const Value: double);
    procedure SetSupplier(const Value: integer);
    procedure SetSupplierContact(const Value: integer);
    procedure SetSupplierContactName(const Value: string);
    procedure SetSupplierName(const Value: string);
    function GetTotalCost: currency;
    procedure SetUnitCost(const Value: currency);
    procedure SetGRNNumber(const Value: string);
    procedure SetSlabDescription(const Value: string);
    procedure SetStatus(const Value: integer);
    procedure SetStatusDescription(const Value: string);
    procedure SetSlabDepth(const Value: integer);
    procedure SetSlabLength(const Value: integer);
  public
    constructor Create(SOrder : TSOrder);
    destructor Destroy; override;
    function Clone : TSOPurchase;
    procedure LoadFromDB;
    procedure DeleteFromDB;
    property DateRaised: TDateTime read FDateRaised write SetDateRaised;
    property DateRequired: TdateTime read FDateRequired write SetDateRequired;
    property GRNNumber: string read FGRNNumber write SetGRNNumber;
    property inactive: boolean read Finactive write Setinactive;
    property LineDescription: string read FLineDescription write SetLineDescription;
    property OfficeContact: integer read FOfficeContact write SetOfficeContact;
    property OfficeContactName: string read FOfficeContactName write SetOfficeContactName;
    property OnHold: boolean read FOnHold write SetOnHold;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property Parent: TSOrder read FParent write SetParent;
    property POLineNumber: integer read FPOLineNumber write SetPOLineNumber;
    property PONumber: integer read FPONumber write SetPONumber;
    property POLNumber: integer read FPOLNumber write SetPOLNumber;
    property Quantity: double read FQuantity write SetQuantity;
    property SlabDescription: string read FSlabDescription write SetSlabDescription;
    property SlabDepth: integer read FSlabDepth write SetSlabDepth;
    property SlabLength: integer read FSlabLength write SetSlabLength;
    property Status: integer read FStatus write SetStatus;
    property StatusDescription: string read FStatusDescription write SetStatusDescription;
    property Supplier: integer read FSupplier write SetSupplier;
    property SupplierContact: integer read FSupplierContact write SetSupplierContact;
    property SupplierContactName: string read FSupplierContactName write SetSupplierContactName;
    property SupplierName: string read FSupplierName write SetSupplierName;
    property UnitCost: currency read FUnitCost write SetUnitCost;
    property TotalCost: currency read GetTotalCost;
  end;

  TSOPurchases = class;

  TSOLine = class
  private
    FSOLNumber: integer;
    FQuantity: double;
    FParent: TSOrder;
    FSurveyPrice: currency;
    FUnitPrice: currency;
    FDiscountValue: currency;
    FDeliveryPrice: currency;
    FInstallPrice: currency;
    FNettPrice: currency;
    FUnitCost: currency;
    FQtyInvoiced: double;
    FQtyAllocated: double;
    FQtyDelivered: double;
    FJob: double;
    FVat: integer;
    FCostUnit: integer;
    FSellUnit: integer;
    FStockItem: integer;
    FVatRate: real;
    FStockCode: string;
    FDescription: string;
    FStockDescription: string;
    FProduct: integer;
    FQuote: integer;
    FMode: string;
    FMarkupValue: currency;
    FWasteValue: currency;
    FPONumber: integer;
    FSINumber: string;
    FVatDescription: string;
    FStockAllocationEndDate: TDateTime;
    FStockAllocationStartDate: TDateTime;
    procedure SetSOLNumber(const Value: integer);
    procedure SetQuantity(const Value: double);
    procedure SetParent(const Value: TSOrder);
    procedure SetCostUnit(const Value: integer);
    procedure SetDeliveryPrice(const Value: currency);
    procedure SetDescription(const Value: string);
    procedure SetDiscountValue(const Value: currency);
    procedure SetInstallPrice(const Value: currency);
    procedure SetJob(const Value: double);
    procedure SetNettPrice(const Value: currency);
    procedure SetQtyAllocated(const Value: double);
    procedure SetQtyDelivered(const Value: double);
    procedure SetQtyInvoiced(const Value: double);
    procedure SetSellUnit(const Value: integer);
    procedure SetStockCode(const Value: string);
    procedure SetStockDescription(const Value: string);
    procedure SetStockItem(const Value: integer);
    procedure SetSurveyPrice(const Value: currency);
    procedure SetUnitCost(const Value: currency);
    procedure SetUnitPrice(const Value: currency);
    procedure SetVat(const Value: integer);
    procedure SetVatRate(const Value: real);
    procedure SetProduct(const Value: integer);
    function GetTotalGoods: currency;
    procedure SetQuote(const Value: integer);
    procedure SetMode(const Value: string);
    procedure SetMarkupValue(const Value: currency);
    procedure SetWasteValue(const Value: currency);
    procedure SetPONumber(const Value: integer);
    procedure SetSINumber(const Value: string);
    procedure SetVatDescription(const Value: string);
    procedure SetStockAllocationEndDate(const Value: TDateTime);
    procedure SetStockAllocationStartDate(const Value: TDateTime);
  public
    constructor Create(SOrder : TSOrder);
    destructor Destroy; override;
    function Clone : TSOLine;
    procedure LoadFromDB;
    procedure CopyQuote;
    procedure SaveToDB;
    procedure UpdateDB;
    procedure UpdateJobCustomer(tmpCode: double; tmpCustomer, tmpContact: integer; tmpName: string);
    procedure UpdateQuote(tmpCode, tmpStatus: integer);
    procedure UpdateQuoteCustomer(tmpCode, tmpCustomer, tmpContact: integer; tmpName: string);
    procedure UpdateQuoteVersions(tmpCode, tmpStatus: integer);
    procedure DeleteFromDB;
    property CostUnit: integer read FCostUnit write SetCostUnit;
    property DeliveryPrice: currency read FDeliveryPrice write SetDeliveryPrice;
    property Description: string read FDescription write SetDescription;
    property DiscountValue: currency read FDiscountValue write SetDiscountValue;
    property InstallPrice: currency read FInstallPrice write SetInstallPrice;
    property Job: double read FJob write SetJob;
    property MarkupValue: currency read FMarkupValue write SetMarkupValue;
    property Mode: string read FMode write SetMode;
    property NettPrice: currency read FNettPrice write SetNettPrice;
    property Parent: TSOrder read FParent write SetParent;
    property PONumber: integer read FPONumber write SetPONumber;
    property Product: integer read FProduct write SetProduct;
    property Quantity: double read FQuantity write SetQuantity;
    property Quote: integer read FQuote write SetQuote;
    property QtyAllocated: double read FQtyAllocated write SetQtyAllocated;
    property QtyDelivered: double read FQtyDelivered write SetQtyDelivered;
    property QtyInvoiced: double read FQtyInvoiced write SetQtyInvoiced;
    property SellUnit: integer read FSellUnit write SetSellUnit;
    property SINumber: string read FSINumber write SetSINumber;
    property SOLNumber: integer read FSOLNumber write SetSOLNumber;
    property StockAllocationEndDate: TDateTime read FStockAllocationEndDate write SetStockAllocationEndDate;
    property StockAllocationStartDate: TDateTime read FStockAllocationStartDate write SetStockAllocationStartDate;
    property StockCode: string read FStockCode write SetStockCode;
    property StockDescription: string read FStockDescription write SetStockDescription;
    property StockItem: integer read FStockItem write SetStockItem;
    property SurveyPrice: currency read FSurveyPrice write SetSurveyPrice;
    property TotalGoods: currency read GetTotalGoods;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
    property UnitCost: currency read FUnitCost write SetUnitCost;
    property Vat: integer read FVat write SetVat;
    property VatDescription: string read FVatDescription write SetVatDescription;
    property VatRate: real read FVatRate write SetVatRate;
    property WasteValue: currency read FWasteValue write SetWasteValue;
  end;

  TSOLines = class;

  TSOEvents    = class
  private
    FParent: TSOrder;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TSOEvent;
    procedure SetItems(Index: integer; const Value: TSOEvent);
  public
    constructor Create(SOrder : TSOrder);
    destructor Destroy; override;
    procedure Add(aEvent: TSOEvent);
    procedure Clear;
    function  Clone : TSOEvents;
    procedure Delete(const Index : integer);
    function  IndexOf(const EventNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TSOEvent read GetItems write SetItems;
      default;
    property Parent : TSOrder read FParent;
  end;

  TSOPurchases  = class
  private
    FParent: TSOrder;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TSOPurchase;
    procedure SetItems(Index: integer; const Value: TSOPurchase);
    function GetMaxLineNo: integer;
  public
    constructor Create(SOrder : TSOrder);
    destructor Destroy; override;
    procedure Add(aLine : TSOPurchase);
    procedure Clear;
    function  Clone : TSOPurchases;
    procedure Delete(const Index : integer);
    function  IndexOf(const LineNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TSOPurchase read GetItems write SetItems;
      default;
    property MaxLineNo: integer read GetMaxLineNo;
    property Parent : TSOrder read FParent;
  end;

  TSOLines  = class
  private
    FParent: TSOrder;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TSOLine;
    procedure SetItems(Index: integer; const Value: TSOLine);
    function GetMaxLineNo: integer;
  public
    constructor Create(SOrder : TSOrder);
    destructor Destroy; override;
    procedure Add(aLine : TSOLine);
    procedure Clear;
    function  Clone : TSOLines;
    procedure Delete(const Index : integer);
    function  IndexOf(const LineNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TSOLine read GetItems write SetItems;
      default;
    property MaxLineNo: integer read GetMaxLineNo;
    property Parent : TSOrder read FParent;
  end;

  TSOrder = class
  private
    FdbKey: integer;
    FDepositAmount: currency;
    FExtraNotes: integer;
    FOperator: integer;
    FCustomer: integer;
    FStatus: integer;
    FContactName: string;
    FOperatorName: string;
    FReference: string;
    FCustomerName: string;
    FOrderReference: string;
    FStatusDescr: string;
    FDateRequired: TDateTime;
    FSODate: TDateTime;
    FDataModule: TdtmdlSalesOrder;
    FDepositTerms: double;
    FInactive: string;
    FReason: integer;
    FInstallAddress: integer;
    FSOLines: TSOLines;
    FAddress: integer;
    FRep: integer;
    FRepName: string;
    FRetail: bytebool;
    FNarrativeText: string;
    FTemplateDate: TDateTime;
    FDateType: string;
    FMaterialRequired: boolean;
    FMaterialRecdDate: TDateTime;
    FMaterialReqdDate: TDateTime;
    FInstallName: string;
    FInstallPhone: string;
    FOnHold: boolean;
    FEmailAddress: string;
    FTelephone: string;
    FAccountManager: integer;
    FDescription: string;
    FTemplateInSchedule: boolean;
    FFittingInSchedule: boolean;
    FTemplater: integer;
    FFitter: integer;
    FSupplyOnly: string;
    FOrderMode: TsopMode;
    FSOEvents: TSOEvents;
    FSOMode: TSOPMode;
    FProjectReference: string;
    FSpeculative: boolean;
    FSOPurchases: TSOPurchases;
    FTemplateDuration: integer;
    FFittingDuration: integer;
    FContactNo: integer;
    FApplianceDetails: string;
    FLocationPlanDocument: string;
    FCollectionOnly: string;
    FInstallEmail: string;
    FInstallationAddress: integer;
    FFittingDocsReturned: boolean;
    FTemplateDocsReturned: boolean;
    FRevenueCentre: integer;
    FRemedialNoProduction: string;
    FRemedialProduction: string;
    FRemedialID: integer;
    FSalesOrderNumber: double;
    FOriginalSalesOrder: integer;
    FDoNotInvoice: boolean;
    FInvoiceCustomer: integer;
    FInvoiceCustomerName: string;
    FCustomerBranch: integer;
    FBranchExist: boolean;
    FCustomerBranchName: string;
    FStockAllocationEndDate: TDateTime;
    FStockAllocationStartDate: TDateTime;
    procedure SetdbKey(const Value: integer);
    procedure SetContactName(const Value: string);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetDateRequired(const Value: TDateTime);
    procedure SetDepositAmount(const Value: currency);
    procedure SetExtraNotes(const Value: integer);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetOrderReference(const Value: string);
    procedure SetReference(const Value: string);
    procedure SetSODate(const Value: TDateTime);
    procedure SetStatus(const Value: integer);
    procedure SetStatusDescr(const Value: string);
    procedure SetDepositTerms(const Value: double);
    procedure SetInactive(const Value: string);
    procedure SetReason(const Value: integer);
    procedure SetInstallAddress(const Value: integer);
    function GetCurrentStatus: integer;
    procedure SetAddress(const Value: integer);
    procedure SetRep(const Value: integer);
    procedure SetRepName(const Value: string);
    function GetNextRemedialNumber: real;
    function GetTotalGoods: currency;
    function GetTotalVat: currency;
    procedure SetRetail(const Value: bytebool);
    procedure SetNarrativeText(const Value: string);
    procedure SetTemplateDate(const Value: TDateTime);
    procedure SetDateType(const Value: string);
    procedure SetMaterialRecdDate(const Value: TDateTime);
    procedure SetMaterialReqdDate(const Value: TDateTime);
    procedure SetMaterialRequired(const Value: boolean);
    procedure SetInstallName(const Value: string);
    procedure SetInstallPhone(const Value: string);
    procedure SetOnHold(const Value: boolean);
    procedure SetEmailAddress(const Value: string);
    procedure SetTelephone(const Value: string);
    procedure SetAccountManager(const Value: integer);
    procedure SetDescription(const Value: string);
    procedure SetFittingInSchedule(const Value: boolean);
    procedure SetTemplateInSchedule(const Value: boolean);
    procedure SetFitter(const Value: integer);
    procedure SetTemplater(const Value: integer);
    procedure SetSupplyOnly(const Value: string);
    procedure SetOrderMode(const Value: TsopMode);
    procedure SetSOMode(const Value: TSOPMode);
    procedure SetProjectReference(const Value: string);
    procedure SetSpeculative(const Value: boolean);
    procedure SetTemplateDuration(const Value: integer);
    procedure SetFittingDuration(const Value: integer);
    procedure SetContactNo(const Value: integer);
    procedure SetApplianceDetails(const Value: string);
    procedure SetLocationPlanDocument(const Value: string);
    procedure SetCollectionOnly(const Value: string);
    procedure SetInstallEmail(const Value: string);
    procedure SetInstallationAddress(const Value: integer);
    procedure SetFittingDocsReturned(const Value: boolean);
    procedure SetTemplateDocsReturned(const Value: boolean);
    procedure SetRevenueCentre(const Value: integer);
    procedure SetRemedialNoProduction(const Value: string);
    procedure SetRemedialProduction(const Value: string);
    procedure SetRemedialID(const Value: integer);
    procedure SetOriginalSalesOrder(const Value: integer);
    procedure SetSalesOrderNumber(const Value: double);
    procedure SetDoNotInvoice(const Value: boolean);
    procedure SetInvoiceCustomer(const Value: integer);
    procedure SetInvoiceCustomerName(const Value: string);
    procedure SetCustomerBranch(const Value: integer);
    procedure SetBranchExist(const Value: boolean);
    procedure SetCustomerBranchName(const Value: string);
    procedure SetStockAllocationEndDate(const Value: TDateTime);
    procedure SetStockAllocationStartDate(const Value: TDateTime);
  public
    constructor Create(DataModule : TdtmdlSalesOrder);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TSOrder;
    procedure AddQuoteLine;
    procedure DeleteFromDB;
    procedure DeleteEvents;
    procedure DeleteLines;
    procedure LoadEvents;
    procedure LoadFromDB;
    procedure LoadFromJob;
    procedure LoadFromQuote;
    procedure LoadJobLines;
    procedure LoadLines;
    procedure LoadPurchaseOrders;
    procedure LoadQuoteEvents;
    procedure LoadQuoteLines;
    procedure MoveQuoteDocuments;
    procedure SaveToDB(TempAll: boolean);
    procedure SaveEvents;
    procedure SaveLines;
    procedure SaveSONumber;
    property Address: integer read FAddress write SetAddress;
    property AccountManager: integer read FAccountManager write SetAccountManager;
    property ApplianceDetails: string read FApplianceDetails write SetApplianceDetails;
    property BranchExist: boolean read FBranchExist write SetBranchExist;
    property CollectionOnly: string read FCollectionOnly write SetCollectionOnly;
    property ContactName: string read FContactName write SetContactName;
    property ContactNo: integer read FContactNo write SetContactNo;
    property CurrentStatus: integer read GetCurrentStatus;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerBranch: integer read FCustomerBranch write SetCustomerBranch;
    property CustomerBranchName: string read FCustomerBranchName write SetCustomerBranchName;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property DataModule: TdtmdlSalesOrder read FDataModule;
    property DateType: string read FDateType write SetDateType;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property dbKey: integer read FdbKey write SetdbKey;
    property Description: string read FDescription write SetDescription;
    property DoNotInvoice: boolean read FDoNotInvoice write SetDoNotInvoice;
    property Events: TSOEvents read FSOEvents;
    property Fitter: integer read FFitter write SetFitter;
    property FittingInSchedule: boolean read FFittingInSchedule write SetFittingInSchedule;
    property FittingDocsReturned: boolean read FFittingDocsReturned write SetFittingDocsReturned;
    property FittingDuration: integer read FFittingDuration write SetFittingDuration;
    property InstallationAddress: integer read FInstallationAddress write SetInstallationAddress;
    property InstallAddress: integer read FInstallAddress write SetInstallAddress;
    property InstallEmail: string read FInstallEmail write SetInstallEmail;
    property InstallName: string read FInstallName write SetInstallName;
    property InstallPhone: string read FInstallPhone write SetInstallPhone;
    property InvoiceCustomer: integer read FInvoiceCustomer write SetInvoiceCustomer;
    property InvoiceCustomerName: string read FInvoiceCustomerName write SetInvoiceCustomerName;
    property DepositAmount: currency read FDepositAmount write SetDepositAmount;
    property DepositTerms: double read FDepositTerms write SetDepositTerms;
    property ExtraNotes: integer read FExtraNotes write SetExtraNotes;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property OnHold: boolean read FOnHold write SetOnHold;
    property Inactive: string read FInactive write SetInactive;
    property Reason: integer read FReason write SetReason;
    property LocationPlanDocument: string read FLocationPlanDocument write SetLocationPlanDocument;
    property MaterialRequired: boolean read FMaterialRequired write SetMaterialRequired;
    property MaterialReqdDate: TDateTime read FMaterialReqdDate write SetMaterialReqdDate;
    property MaterialRecdDate: TDateTime read FMaterialRecdDate write SetMaterialRecdDate;
    property Lines: TSOLines read FSOLines;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property OrderMode: TsopMode read FOrderMode write SetOrderMode;
    property OrderReference: string read FOrderReference write SetOrderReference;
    property OriginalSalesOrder: integer read FOriginalSalesOrder write SetOriginalSalesOrder;
    property ProjectReference: string read FProjectReference write SetProjectReference;
    property Purchases: TSOPurchases read FSOPurchases;
    property Retail: bytebool read FRetail write SetRetail;
    property Reference: string read FReference write SetReference;
    property RemedialID: integer read FRemedialID write SetRemedialID;
    property RemedialNoProduction: string read FRemedialNoProduction write SetRemedialNoProduction;
    property RemedialProduction: string read FRemedialProduction write SetRemedialProduction;
    property Rep: integer read FRep write SetRep;
    property RepName: string read FRepName write SetRepName;
    property RevenueCentre: integer read FRevenueCentre write SetRevenueCentre;
    property SalesOrderNumber: double read FSalesOrderNumber write SetSalesOrderNumber;
    property SODate: TDateTime read FSODate write SetSODate;
    property SOMode: TSOPMode read FSOMode write SetSOMode;
    property Speculative: boolean read FSpeculative write SetSpeculative;
    property Status: integer read FStatus write SetStatus;
    property StatusDescr: string read FStatusDescr write SetStatusDescr;
    property StockAllocationStartDate: TDateTime read FStockAllocationStartDate write SetStockAllocationStartDate;
    property StockAllocationEndDate: TDateTime read FStockAllocationEndDate write SetStockAllocationEndDate;
    property SupplyOnly: string read FSupplyOnly write SetSupplyOnly;
    property Templater: integer read FTemplater write SetTemplater;
    property TemplateInSchedule: boolean read FTemplateInSchedule write SetTemplateInSchedule;
    property TemplateDate: TDateTime read FTemplateDate write SetTemplateDate;
    property TemplateDocsReturned: boolean read FTemplateDocsReturned write SetTemplateDocsReturned;
    property TemplateDuration: integer read FTemplateDuration write SetTemplateDuration;
    property TotalGoods: currency read GetTotalGoods;
    property TotalVat: currency read GetTotalVat;
  end;

var
  dtmdlSalesOrder: TdtmdlSalesOrder;
  dtmdlCopyQuote: TdtmdlQuote;

implementation

uses wtDataModule;

{$R *.dfm}

{ TdtmdlSale }

function TdtmdlSalesOrder.GetCurrentSOrder: integer;
begin
  if dtsAllSales.dataset.RecordCount > 0 then
    Result := dtsAllSales.dataset.FieldByName('Sales_Order').AsInteger
  else
    Result := 0;
end;

function TdtmdlSalesOrder.GetCustomerAddress(tempcust: integer): string;
var
  i: integer;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      for i := 0 to 4 do
        begin
          if trim(fields[i].asstring) = '' then continue;
          result := result + trim(fields[i].asstring) + #13#10;
        end;
    end;
end;

function TdtmdlSalesOrder.GetCustomerStreet(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Street').asstring;
    end;
end;

function TdtmdlSalesOrder.GetCustomerLocale(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Locale').asstring;
    end;
end;

function TdtmdlSalesOrder.GetCustomerTown(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Town_City').asstring;
    end;
end;

function TdtmdlSalesOrder.GetCustomerPostcode(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Postcode').asstring;
    end;
end;

function TdtmdlSalesOrder.GetCustomerCounty(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('County_State').asstring;
    end;
end;

function TdtmdlSalesOrder.GetCustomerTelephone(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Telephone_number').asstring;
    end;
end;

function TdtmdlSalesOrder.GetCustomerFax(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Fax_Number').asstring;
    end;
end;

function TdtmdlSalesOrder.GetCustomerWebsite(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Web_Address').asstring;
    end;
end;

function TdtmdlSalesOrder.GetCustomerEmail(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Email_Address').asstring;
    end;
end;

function TdtmdlSalesOrder.GetAddressName(tempCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := fieldbyname('Address_Name').asstring;
    end;
end;

function TdtmdlSalesOrder.GetAddressStreet(tempCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := fieldbyname('Street').asstring;
    end;
end;

function TdtmdlSalesOrder.GetAddressLocale(tempCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := fieldbyname('Locale').asstring;
    end;
end;

function TdtmdlSalesOrder.GetAddressTown(tempCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := fieldbyname('Town_City').asstring;
    end;
end;

function TdtmdlSalesOrder.GetAddressPostcode(tempCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := fieldbyname('Postcode').asstring;
    end;
end;

function TdtmdlSalesOrder.GetAddressCounty(tempCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := fieldbyname('County_State').asstring;
    end;
end;

function TdtmdlSalesOrder.GetAddressTelephone(tempCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := fieldbyname('Telephone_number').asstring;
    end;
end;

function TdtmdlSalesOrder.GetAddressFax(tempCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := fieldbyname('Fax_Number').asstring;
    end;
end;

function TdtmdlSalesOrder.GetAddressWebsite(tempCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := fieldbyname('Web_Address').asstring;
    end;
end;

function TdtmdlSalesOrder.GetAddressEmail(tempCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := fieldbyname('Email_Address').asstring;
    end;
end;

function TdtmdlSalesOrder.GetCustomerRep(tempcode: integer): string;
begin
  result := '';
  with qryGetRep do
    begin
      close;
      parambyname('Rep').asinteger := tempCode;
      open;
      result := fieldbyname('Rep_Name').asstring
    end;
end;

function TdtmdlSalesOrder.GetHeaderCountAll: integer;
begin
  result := qryAllSales.RecordCount;
end;

function TdtmdlSalesOrder.GetNextSONumber: integer;
begin
  with qrySOGetLast do
    begin
      close;
      open;
      result := fieldbyname('Last_Sales_Order_number').asinteger + 1;
    end;
end;

procedure TdtmdlSalesOrder.RefreshAlldata;
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
  sTemp := '';

  dtStart := date;

  with qryAllSales do
    begin
      sql.Clear;
      if ShowRecords = 0 then
        stemp := 'SELECT DISTINCT TOP ' + inttostr(3000)
      else
        stemp := 'SELECT DISTINCT TOP ' + inttostr(ShowRecords);

      sTemp := sTemp + qryDummy.sql.text;

      if Description <> '' then
        sTemp := sTemp + ' AND Sales_order.Descriptive_Reference LIKE ''%' + Description + '%''';
      if CustomerName <> '' then
        sTemp := sTemp + ' AND Sales_order.Customer_name LIKE ''%' + CustomerName + '%''';
      if CustomerOrder <> '' then
        sTemp := sTemp + ' AND Sales_Order.Order_ref_no LIKE ''%' + CustomerOrder + '%''';
      if SiteName <> '' then
        sTemp := sTemp + ' AND Customer_Branch.Branch_Name LIKE ''%' + SiteName + '%''';
      if ProjectReference <> '' then
        sTemp := sTemp + ' AND Sales_order.Project_Reference LIKE ''%' + ProjectReference + '%''';
      if QuoteReference <> '' then
        sTemp := sTemp + ' AND (Select TOP 1 Sales_Order_Line.Quote '
                       +       ' FROM Sales_Order_Line '
                       +       ' WHERE Sales_Order_Line.Sales_Order = Sales_Order.Sales_Order) LIKE ''%' + QuoteReference + '%''';
      if Reference <> '' then
        sTemp := sTemp + ' AND Sales_order.Reference LIKE ''%' + Reference + '%''';
      if OfficeContact <> '' then
        sTemp := sTemp + ' AND Office_Contact.Operator_Name LIKE ''%' + OfficeContact + '%''';
      if OperatorName <> '' then
        sTemp := sTemp + ' AND Operator.Operator_Name LIKE ''%' + OperatorName + '%''';
      if TemplateName <> '' then
        sTemp := sTemp + ' AND ((Templater.Fitter_Name LIKE ''%' + TemplateName + '%'') OR (Sales_order.Customer_name LIKE ''%' + TemplateName + '%''))';
      if FitterName <> '' then
        sTemp := sTemp + ' AND Fitter.Fitter_Name LIKE ''%' + FitterName + '%''';
      if Status <> '' then
        sTemp := sTemp + ' AND Sales_order_Status.Sales_order_Status_Desc LIKE ''%' + status + '%''';

      if ShowLive then
//        sTemp := sTemp + ' AND (Sales_order.Sales_order_Status < 100) ';
        sTemp := sTemp + ' AND (Sales_order.Sales_order_Status < 100) AND ((Sales_order.Do_not_Invoice is NULL) OR (Sales_Order.Do_not_Invoice = ''N'')) ';

      if ShowOnSchedule then
        sTemp := sTemp + ' AND (Sales_order.IsTemplateInOutlook = ''Y'') ';

      case OrderStatus of
        50: begin
              sTemp := sTemp + ' AND (Sales_order.Sales_order_Status <= 100) ';
              if ActionStart <> 0 then
                sTemp := sTemp + ' AND ((Sales_order.Template_Date >= ' + qdate(ActionStart) + ') AND (Sales_order.Template_Date < ' + qDate(ActionEnd) + '))';
            end;
        60: begin
              sTemp := sTemp + ' AND ((Sales_order.Sales_order_Status >= 50) AND (Sales_order.Sales_order_Status <= 100)) ';
              if ActionStart <> 0 then
                sTemp := sTemp + ' AND ((Sales_order.Date_Required >= ' + qdate(ActionStart) + ') AND (Sales_order.Date_Required < ' + qdate(ActionEnd) + '))';
            end;
      end;

      if ShowInactive then
        sTemp := sTemp + ' AND ((Sales_order.inactive is NULL) OR (Sales_Order.inactive = ''N'')'
                    + ' OR (Sales_Order.inactive = ''Y'')) '
      else
        sTemp := sTemp + ' AND ((Sales_Order.inactive is NULL) OR (Sales_Order.inactive = ''N''))';

      if TradeRetail = 1 then
        sTemp := sTemp + ' AND (((Customer.Is_Retail_Customer <> ''Y'') AND ((Customer.Is_Commercial_Customer <> ''Y'') OR (Customer.Is_Commercial_Customer IS NULL))))'
      else
      if TradeRetail = 2 then
        sTemp := sTemp + ' AND (Customer.Is_Retail_Customer = ''Y'')'
      else
      if TradeRetail = 3 then
        sTemp := sTemp + ' AND (Customer.Is_Commercial_Customer = ''Y'')' ;

      if SortOrder = '' then
        sTemp := sTemp + ' ORDER BY Sales_order.Sales_order desc'
      else
        sTemp := sTemp + ' ORDER BY ' + SortOrder;

(*      case OrderStatus of
        50: sTemp := sTemp + ' ORDER BY Sales_order.Template_Date desc';
        60: sTemp := sTemp + ' ORDER BY Sales_order.Date_Required desc';
      else
        sTemp := sTemp + ' ORDER BY Sales_order.Sales_order desc';
      end;
*)

      sql.text := sTemp;
      open;
    end;
end;

procedure TdtmdlSalesOrder.RefreshFittingdata;
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
  sTemp := '';

  dtStart := date;

  with qryAllSales do
    begin
      sql.Clear;
      if ShowRecords = 0 then
        stemp := 'SELECT DISTINCT TOP ' + inttostr(3000)
      else
        stemp := 'SELECT DISTINCT TOP ' + inttostr(ShowRecords);

      sTemp := sTemp + qryJobsDummy.sql.text;

      if Description <> '' then
        sTemp := sTemp + ' AND Sales_order.Descriptive_Reference LIKE ''%' + Description + '%''';
      if CustomerName <> '' then
        sTemp := sTemp + ' AND Sales_order.Customer_name LIKE ''%' + CustomerName + '%''';
      if CustomerOrder <> '' then
        sTemp := sTemp + ' AND Sales_Order.Order_ref_no LIKE ''%' + CustomerOrder + '%''';
      if ProjectReference <> '' then
        sTemp := sTemp + ' AND Sales_order.Project_Reference LIKE ''%' + ProjectReference + '%''';
      if QuoteReference <> '' then
        sTemp := sTemp + ' AND (Select TOP 1 Sales_Order_Line.Quote '
                       +       ' FROM Sales_Order_Line '
                       +       ' WHERE Sales_Order_Line.Sales_Order = Sales_Order.Sales_Order) LIKE ''%' + QuoteReference + '%''';
      if Reference <> '' then
        sTemp := sTemp + ' AND Sales_order.Reference LIKE ''%' + Reference + '%''';
      if OfficeContact <> '' then
        sTemp := sTemp + ' AND Office_Contact.Operator_Name LIKE ''%' + OfficeContact + '%''';
      if OperatorName <> '' then
        sTemp := sTemp + ' AND Operator.Operator_Name LIKE ''%' + OperatorName + '%''';
      if TemplateName <> '' then
        begin
//          sTemp := sTemp + ' AND Templater.Fitter_Name LIKE ''%' + TemplateName + '%''';
          sTemp := sTemp + ' AND ((Templater.Fitter_Name LIKE ''%' + TemplateName + '%'') OR (Sales_order.Customer_name LIKE ''%' + TemplateName + '%''))';
        end;
      if FitterName <> '' then
        sTemp := sTemp + ' AND ((Fitter.Fitter_Name LIKE ''%' + FitterName + '%'') OR (Sales_order.Customer_name LIKE ''%' + FitterName + '%''))';
      if Status <> '' then
        sTemp := sTemp + ' AND Sales_order_Status.Sales_order_Status_Desc LIKE ''%' + status + '%''';

      if ShowLive then
        sTemp := sTemp + ' AND (Sales_order.Sales_order_Status < 100) ';

      if ShowOnSchedule then
        sTemp := sTemp + ' AND (Sales_order.IsFittingInOutlook = ''Y'') ';

      case OrderStatus of
        50: begin
              sTemp := sTemp + ' AND (Sales_order.Sales_order_Status <= 100) ';
              if ActionStart <> 0 then
                sTemp := sTemp + ' AND ((Sales_order.Template_Date >= ' + qdate(ActionStart) + ') AND (Sales_order.Template_Date < ' + qDate(ActionEnd) + '))';
            end;
        60: begin
              sTemp := sTemp + ' AND ((Sales_order.Sales_order_Status >= 50) AND (Sales_order.Sales_order_Status <= 100)) ';
              if ActionStart <> 0 then
                sTemp := sTemp + ' AND ((Sales_order.Date_Required >= ' + qdate(ActionStart) + ') AND (Sales_order.Date_Required < ' + qdate(ActionEnd) + '))';
            end;
      end;

      if ShowInactive then
        sTemp := sTemp + ' AND ((Sales_order.inactive is NULL) OR (Sales_Order.inactive = ''N'')'
                    + ' OR (Sales_Order.inactive = ''Y'')) '
      else
        sTemp := sTemp + ' AND ((Sales_Order.inactive is NULL) OR (Sales_Order.inactive = ''N''))';

      if TradeRetail = 1 then
        sTemp := sTemp + ' AND (((Customer.Is_Retail_Customer <> ''Y'') AND ((Customer.Is_Commercial_Customer <> ''Y'') OR (Customer.Is_Commercial_Customer IS NULL))))'
      else
      if TradeRetail = 2 then
        sTemp := sTemp + ' AND (Customer.Is_Retail_Customer = ''Y'')'
      else
      if TradeRetail = 3 then
        sTemp := sTemp + ' AND (Customer.Is_Commercial_Customer = ''Y'')' ;

      if SortOrder = '' then
        sTemp := sTemp + ' ORDER BY Sales_order.Sales_order desc'
      else
        sTemp := sTemp + ' ORDER BY ' + SortOrder;

(*      case OrderStatus of
        50: sTemp := sTemp + ' ORDER BY Sales_order.Template_Date desc';
        60: sTemp := sTemp + ' ORDER BY Sales_order.Date_Required desc';
      else
        sTemp := sTemp + ' ORDER BY Sales_order.Sales_order desc';
      end;
*)

      sql.text := sTemp;
      open;
    end;
end;

procedure TdtmdlSalesOrder.Refreshdata;
begin

end;

function TdtmdlSalesOrder.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (CustomerOrder <> '') or
            (ProjectReference <> '') or
            (SiteName <> '') or
            (Reference <> '') or
            (QuoteReference <> '') or
            (JobNo <> 0) or
            (QuoteNo <> 0) or
            (Description <> '') or
            (OfficeContact <> '') or
            (OperatorName <> '') or
            (Reference <> '') or
            (Status <> '') or
            (ShowLive) then
    result := true
  else
    result := false;
end;

{ TSOrder }

procedure TSOrder.Clear;
begin
  Customer :=       0;
  CustomerName :=   '';
  SODate :=           0;
  InstallAddress :=  0;
  InstallationAddress := 0;
  FSOEvents.Clear;
  FSOLines.Clear;
  FSOPurchases.Clear;
end;

function TSOrder.Clone: TSOrder;
begin
  Result := TSOrder.Create(FDataModule);
  Result.Address :=       self.Address;
  Result.AccountManager := self.AccountManager;
  Result.ApplianceDetails := self.ApplianceDetails;
  Result.BranchExist :=  self.BranchExist;
  Result.CollectionOnly :=  self.CollectionOnly;
  Result.ContactNo      :=  self.ContactNo;
  Result.Customer:=       self.Customer;
  Result.CustomerBranch := self.CustomerBranch;
  Result.CustomerBranchName := self.CustomerBranchName;
  Result.CustomerName:=   self.CustomerName;
  Result.DateRequired :=  self.DateRequired;
  Result.DateType :=      self.DateType;
  Result.Description  :=  self.Description;
  Result.DoNotInvoice :=  self.DoNotInvoice;
  Result.ExtraNotes :=    self.ExtraNotes;
  Result.Fitter :=        self.Fitter;
  Result.FittingDocsReturned := self.FittingDocsReturned;
  Result.FittingDuration := self.FittingDuration;
  Result.FittingInSchedule := self.FittingInSchedule;
  Result.InstallationAddress := self.InstallationAddress;
  Result.InstallAddress := self.InstallAddress;
  Result.InstallEmail :=   self.InstallEmail;
  Result.InstallName :=   self.InstallName;
  Result.InstallPhone :=  self.InstallPhone;
  Result.InvoiceCustomer := self.InvoiceCustomer;
  Result.InvoiceCustomerName := self.InvoiceCustomerName;
  Result.Status :=        self.Status;
  Result.StatusDescr :=   self.StatusDescr;
  Result.Inactive :=      self.Inactive;
  Result.Reason :=        self.reason;
  Result.DepositTerms :=  self.DepositTerms;
  Result.DepositAmount := self.DepositAmount;
  Result.ProjectReference := self.ProjectReference;
  Result.Reference:=      self.Reference;
  Result.Retail    :=     self.Retail;
  Result.RemedialID :=    self.RemedialID;
  Result.RemedialNoProduction := self.RemedialNoProduction;
  Result.RemedialProduction := self.RemedialProduction;
  Result.Rep :=           self.Rep;
  Result.RepName   :=     self.RepName;
  Result.SupplyOnly :=    self.SupplyOnly;
  Result.ContactName:=    self.ContactName;
  Result.SODate:=         self.SODate;
  Result.LocationPlanDocument := self.LocationPlanDocument;
  Result.MaterialRequired := self.MaterialRequired;
  Result.MaterialReqdDate := self.MaterialReqdDate;
  Result.MaterialRecdDate := self.MaterialRecdDate;
  Result.OnHold :=        self.OnHold;
  Result.Operator :=      self.Operator;
  Result.OperatorName :=  self.OperatorName;
  Result.OrderMode :=     self.OrderMode;
  Result.OriginalSalesOrder := self.OriginalSalesOrder;
  Result.RevenueCentre :=   self.RevenueCentre;
  Result.SalesOrderNumber :=  self.SalesOrderNumber;
  Result.StockAllocationStartDate := self.StockAllocationStartDate;
  Result.StockAllocationEndDate := self.StockAllocationEndDate;
  Result.Speculative :=   self.Speculative;
  Result.Templater :=     self.Templater;
  Result.TemplateDate :=  self.TemplateDate;
  Result.TemplateDocsReturned := self.TemplateDocsReturned;
  Result.TemplateDuration := self.TemplateDuration;
  Result.TemplateInSchedule := self.TemplateInSchedule;
  Result.FSOEvents.Free;
  Result.FSOEvents :=  Self.FSOEvents.Clone;
  Result.FSOLines.Free;
  Result.FSOLines :=  Self.FSOLines.Clone;
  Result.FSOPurchases.Free;
  Result.FSOPurchases :=  Self.FSOPurchases.Clone;
end;

constructor TSOrder.Create(DataModule: TdtmdlSalesOrder);
begin
  FDataModule := DataModule;
  FSOEvents := TSOEvents.Create(Self);
  FSOLines := TSOLines.Create(Self);
  FSOPurchases := TSOPurchases.Create(Self);
end;

procedure TSOrder.DeleteFromDB;
begin
  DeleteLines;
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Order WHERE Sales_Order =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSOrder.DeleteLines;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Order_Line WHERE Sales_Order = ' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSOrder.DeleteEvents;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Order_internal_Note WHERE Sales_Order =' + IntToStr(DbKey));
    ExecSQL;
  end;

end;

destructor TSOrder.Destroy;
begin
  FSOEvents.Free;
  FSOLines.Free;
  FSOPurchases.Free;
  inherited;
end;

function TSOrder.GetCurrentStatus: integer;
var
  tempStatus, iOrigStatus: integer;
begin
  Result := self.Status;

  with datamodule.qryGetSOLines do
    begin
      close;
      parambyname('sales_order').asinteger := dbKey;
      open;

      if (fieldbyname('total_invoiced').asinteger >= fieldbyname('total_SO_Invoiced').asinteger) and
         (fieldbyname('total_invoiced').asinteger >= fieldbyname('total_Qty_To_Invoice').asinteger) and
         (fieldbyname('total_invoiced').asinteger > 0) then
        tempStatus := 100
      else
      if fieldbyname('total_invoiced').asinteger > 0 then
        tempStatus := 90
      else
      if fieldbyname('total_complete').asinteger >= fieldbyname('total_lines').asinteger then
        tempStatus := 60
      else
      if fieldbyname('total_complete').asinteger > 0 then
        tempStatus := 55
      else
      if fieldbyname('total_waiting_fitting').asinteger  = fieldbyname('total_lines').asinteger then
        tempStatus := 53
      else
      if fieldbyname('total_in_production').asinteger  > 0 then
        tempStatus := 50
      else
      if (fieldbyname('total_Purchased').asinteger >= fieldbyname('total_Qty_To_Purchase').asinteger)  and
         (fieldbyname('total_Purchased').asinteger > 0) then
        tempStatus := 18
      else
      if fieldbyname('total_Purchased').asinteger > 0 then
        tempStatus := 16
      else
      if fieldbyname('total_job_lines').asinteger = 0 then
        tempStatus := 60
      else
      if fieldbyname('Total_Paid').asfloat > 0 then
        tempStatus := 14
      else
        tempStatus := 10;
    end;

//  if (tempstatus > self.Status) and (tempstatus <> 10) then
    result := tempStatus;
end;

function TSOrder.GetTotalGoods: currency;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to pred(FSOLines.count) do
    result := result + FSOLines[i].TotalGoods;
end;

function TSOrder.GetTotalVat: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FSOLines.Count) do
    result := result + (FSOLines[i].TotalGoods * (FSOLines[i].VatRate/100));
end;

procedure TSOrder.LoadFromDB;
begin
  { Load the header record then all lines belonging to the sales order }
  Clear;
  with FDataModule.qrySOHeader do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := DbKey;
    Open;
    Address :=  fieldbyname('Address').asinteger;

    if fieldbyname('Account_Manager').asinteger = 0 then
      AccountManager := fieldbyname('Operator').asinteger
    else
      AccountManager := fieldbyname('Account_Manager').asinteger;

    ApplianceDetails := fieldbyname('Appliance_Details').asstring;
    ContactNo := fieldbyname('Contact_no').asinteger;
    InstallationAddress := fieldbyname('Installation_Address').asinteger;
    InstallAddress :=  fieldbyname('Install_Address').asinteger;
    InstallEmail :=    fieldbyname('Email_Address').asstring;
    InstallName :=    fieldbyname('Install_Name').asstring;
    InstallPhone := fieldbyname('Install_Phone').asstring;
    InvoiceCustomer := fieldbyname('Inv_Customer').asinteger;
    InvoiceCustomerName := dtmdlWorktops.GetCustomerName(InvoiceCustomer);

    DateRequired :=    fieldbyname('Date_Required').asdatetime;
    FittingDocsReturned := (fieldbyname('Fitting_Docs_Returned').asstring = 'Y');
    FittingDuration := fieldbyname('Fitting_Duration').asinteger;
    DateType :=       fieldbyname('Date_Type').asstring;
    ExtraNotes :=     fieldbyname('Extra_Notes').asinteger;
    NarrativeText :=    datamodule.GetNarrative(ExtraNotes);
    DepositTerms :=  fieldbyname('Deposit_Terms_SO').asfloat;
    DoNotInvoice := (fieldbyname('Do_Not_Invoice').asstring = 'Y');

    if soMode = sopCopy then
      DepositAmount := 0.00
    else
      DepositAmount := fieldbyname('Deposit_Amount').asfloat;

    Description := fieldbyname('Descriptive_Reference').asstring;
    MaterialRequired := (fieldbyname('Materials_Required').asstring = 'Y');
    MaterialReqdDate := fieldbyname('Materials_Reqd_Date').asdatetime;
    MaterialRecdDate := fieldbyname('Materials_Recd_Date').asdatetime;
    Operator :=       fieldbyname('operator').asinteger;
    OperatorName :=   fieldbyname('Operator_Name').asstring;
    OnHold :=         (fieldbyname('On_Hold').asstring = 'Y');
    Customer:=       fieldbyname('Customer').asinteger;
    CustomerBranch := fieldbyname('Branch_No').asinteger;
    CustomerBranchName :=   dtmdlWorktops.GetCustomerBranchName(Customer, CustomerBranch);

    CustomerName:=   fieldbyname('Customer_Name_SO').asstring;

    BranchExist := dtmdlWorktops.DoesCustomerBranchExist(Customer);

    ProjectReference :=
                     fieldbyname('Project_Reference').asstring;
    Reference:=      fieldbyname('Reference').asstring;
    Rep  :=           fieldbyname('Rep').AsInteger;
    RepName  :=      fieldbyname('Rep_Name').asstring;

    RemedialID :=   fieldbyname('Remedial_ID').asinteger;
    RevenueCentre := fieldbyname('Revenue_Centre').asinteger;
    ContactName:=    fieldbyname('Contact_Name').asstring;

    if ContactNo = 0 then
      ContactNo := DataModule.GetCustomerContactNo(Customer,ContactName);

    SODate:=          fieldbyname('Date_Raised').asdatetime;
    Speculative :=   (fieldbyname('Customer_is_Speculative').asstring = 'Y');
    Status :=        fieldbyname('Sales_Order_Status').asinteger;
    StatusDescr :=   fieldbyname('Status_Description').asstring;
    RemedialNoProduction := fieldbyname('Remedial_No_Production').asstring;
    RemedialProduction := fieldbyname('Remedial_Production').asstring;
    CollectionOnly :=     fieldbyname('Collection_Only').asstring;
    SupplyOnly :=     fieldbyname('Supply_Only').asstring;
    Inactive :=      fieldbyname('Inactive').asstring;
    Reason :=        fieldbyname('Inactive_Reason').asinteger;
    OrderReference := fieldbyname('Order_ref_no').asstring;
    TemplateDate :=  fieldbyname('Template_Date').asdatetime;
    TemplateDocsReturned := (fieldbyname('Template_Docs_Returned').asstring = 'Y');
    TemplateDuration := fieldbyname('Template_Duration').asinteger;

    LocationPlanDocument := fieldbyname('Location_Plan_Document').asstring;
    {Scheduling}
    if soMode = sopCopy then
      begin
        Fitter :=        0;
        Templater :=     0;

        TemplateInSchedule := false;
        FittingInSchedule := false;

        InvoiceCustomer := 0;
        InvoiceCustomerName := '';
      end
    else
      begin
        Fitter :=        fieldbyname('Fitter').asInteger;
        Templater :=     fieldbyname('Templater').asinteger;

        TemplateInSchedule := (fieldbyname('IsTemplateInOutlook').asstring = 'Y');
        FittingInSchedule := (fieldbyname('IsFittingInOutlook').asstring = 'Y');
      end;

    if soMode = sopRemedial then
      begin
        if (fieldbyname('Original_Sales_Order').AsInteger <> 0) and
           (fieldbyname('Sales_Order').AsInteger <> fieldbyname('Original_Sales_Order').AsInteger) then
          OriginalSalesOrder := fieldbyname('Original_Sales_Order').AsInteger
        else
          OriginalSalesOrder := fieldbyname('Sales_Order').AsInteger;
      end
    else
      begin
        if fieldbyname('Original_Sales_order').AsInteger = 0 then
          OriginalSalesOrder := dbKey
        else
          OriginalSalesOrder := fieldbyname('Original_Sales_Order').AsInteger;
      end;
    StockAllocationStartDate := fieldbyname('Stock_Allocation_Start_Date').AsDateTime;
    StockAllocationEndDate := fieldbyname('Stock_Allocation_End_Date').AsDateTime;
    Close;
  end;
  LoadLines;
  LoadPurchaseOrders;
  if (soMode <> sopCopy) then
    LoadEvents;
end;

procedure TSOrder.LoadFromJob;
begin
  { Load the header record then all lines belonging to the sales order }
  Clear;
  with FDataModule.qryJobHeader do
  begin
    Close;
    ParamByName('Job').AsInteger := Datamodule.JobNo;
    Open;
    Address :=  fieldbyname('Address').asinteger;

    ApplianceDetails := '';
    InstallAddress :=  fieldbyname('Install_Address').asinteger;
    DateRequired :=    fieldbyname('Date_Required').asdatetime;
    ExtraNotes :=     fieldbyname('Extra_Notes').asinteger;
    NarrativeText :=    datamodule.GetNarrative(ExtraNotes);
    DepositTerms :=  fieldbyname('Deposit_Terms').asinteger;
    DepositAmount := fieldbyname('Deposit_Amount').asfloat;
    DoNotInvoice := false;
    Operator :=       fieldbyname('operator').asinteger;
    OperatorName :=   fieldbyname('Operator_Name').asstring;
    Customer:=       fieldbyname('Customer').asinteger;
    CustomerName:=   fieldbyname('Customer_Name').asstring;

    BranchExist := dtmdlWorktops.DoesCustomerBranchExist(Customer);

    ProjectReference:=      fieldbyname('Project_Reference').asstring;
    Reference:=      fieldbyname('Reference').asstring;
    Rep  :=           fieldbyname('Rep').AsInteger;
    if Rep <> 0 then
      RepName  :=      datamodule.GetCustomerRep(Rep)
    else
      RepName := '';
    ContactName:=    fieldbyname('Contact_Name').asstring;

    ContactNo := DataModule.GetCustomerContactNo(Customer,ContactName);

    SODate:=          fieldbyname('Date_Raised').asdatetime;
    Speculative :=   (fieldbyname('Customer_is_Speculative').asstring = 'Y');
    Status :=        10;
    StatusDescr :=   '';
    Inactive :=      'N';
    Reason :=        0;
    OrderReference := fieldbyname('Order_ref_no').asstring;
    Close;
  end;
  LoadJobLines;
end;

procedure TSOrder.LoadFromQuote;
begin
  { Load the header record then all lines belonging to the sales order }
  Clear;
  with FDataModule.qryQHeader do
  begin
    Close;
    ParamByName('Quote').AsInteger := Datamodule.QuoteNo;
    Open;
    Address :=  fieldbyname('Address').asinteger;

    ApplianceDetails := '';
    if fieldbyname('Account_Manager').asinteger = 0 then
      AccountManager := fieldbyname('Operator').asinteger
    else
      AccountManager := fieldbyname('Account_Manager').asinteger;

    InstallAddress :=  fieldbyname('Install_Address').asinteger;
    if fieldbyname('Is_Retail_Customer').asstring = 'Y' then
      begin
        InstallEmail :=   fieldbyname('Retail_Email_Address').asstring;
        InstallName :=    fieldbyname('Contact_Name').asstring;
        InstallPhone :=   dtmdlWorktops.GetAddressTelephone(fieldbyname('Address').asinteger);
//        InstallAddress :=  fieldbyname('Address').asinteger;
        Retail := true;
      end;
    DateRequired :=    fieldbyname('Date_Required').asdatetime;
    Description := trim(fieldbyname('Description').asstring);
    ExtraNotes :=     fieldbyname('Extra_Notes').asinteger;
    NarrativeText :=    datamodule.GetNarrative(ExtraNotes);
    ExtraNotes :=     0;
    DepositTerms :=  fieldbyname('Deposit_Terms').asinteger;
    DepositAmount := fieldbyname('Deposit_Amount').asfloat;

    DoNotInvoice := false;

    Operator :=       fieldbyname('operator').asinteger;
    OperatorName :=   fieldbyname('Operator_Name').asstring;
    Customer:=       fieldbyname('Customer').asinteger;
    CustomerName:=   fieldbyname('Customer_Name').asstring;

    BranchExist := dtmdlWorktops.DoesCustomerBranchExist(Customer);

    ProjectReference :=
                     fieldbyname('Project_Reference').asstring;
    Reference:=      fieldbyname('Reference').asstring;
    Rep  :=          fieldbyname('Rep').asinteger;
    if Rep <> 0 then
      RepName  :=      datamodule.GetCustomerRep(Rep)
    else
      RepName := '';

    RevenueCentre := fieldbyname('Revenue_Centre').asinteger;

    ContactName:=    fieldbyname('Contact_Name').asstring;
    ContactNo := DataModule.GetCustomerContactNo(Customer,ContactName);

    SODate:=          fieldbyname('Date_Raised').asdatetime;
    Speculative :=   (fieldbyname('Customer_is_Speculative').asstring = 'Y');
    Status :=        10;
    StatusDescr :=   '';
    Inactive :=      'N';
    Reason :=        0;
    OrderReference := '';
    TemplateDate := date;

    {Scheduling}
    TemplateInSchedule := false;
    FittingInSchedule := false;
    Close;
  end;
  LoadQuoteLines;
  LoadQuoteEvents;
end;

procedure TSOrder.LoadLines;
var
  aLine : TSOLine;
begin
  FSOLines.Clear;
  with FDataModule.qrySOAllLines do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aLine := TSOLine.Create(Self);
      aLine.SOLNumber := FieldByName('Sales_Order_Line_No').AsInteger;
      aLine.Quantity := FieldByName('Quantity').asfloat;
      aLine.CostUnit := FieldByName('Cost_unit').asinteger;
      aLine.DeliveryPrice := FieldByName('Delivery_Price').asfloat;
      aLine.Description := FieldByName('Description').asstring;
      aLine.DiscountValue := FieldByName('Discount_Value').asfloat;
      aLine.InstallPrice := FieldByName('Installation_Price').asfloat;
      aLine.MarkupValue := FieldByName('Markup_Value').asfloat;
      aLine.WasteValue := FieldByName('Waste_Value').asfloat;
      aLine.Mode := 'C';
      if soMode = sopCopy then
        aLine.Job := 0
      else
        aLine.Job := FieldByName('Job').asfloat;
      aLine.NettPrice := FieldByName('Nett_Price').asfloat;
      aLine.Quote := FieldByName('Quote').asinteger;
      aLine.QtyAllocated := FieldByName('Quantity_Allocated').asfloat;
      aLine.QtyDelivered := FieldByName('Quantity_Delivered').asfloat;
      aLine.QtyInvoiced := FieldByName('Quantity_Invoiced').asfloat;
      aLine.SellUnit := FieldByName('Sell_Unit').asinteger;
      if soMode = sopCopy then
        aLine.SINumber := ''
      else
        aLine.SINumber := FieldByName('Sales_Invoice_Number').asstring;
      aLine.SOLNumber := FieldByName('Sales_Order_Line_no').asinteger;

      if soMode = sopCopy then
        aline.PONumber := 0
      else
        aline.PONumber := FieldByName('Purchase_Order').asinteger;

      aline.Product := FieldByName('Product').asinteger;
      aline.StockAllocationEndDate := FieldByName('Stock_Allocation_End_Date').asdatetime;
      aline.StockAllocationStartDate := FieldByName('Stock_Allocation_Start_Date').asdatetime;
      aLine.StockDescription := FieldByName('Product_Description').asstring;
      aLine.StockCode := FieldByName('Product_Code').asstring;
      aLine.SurveyPrice := FieldByName('Survey_Price').asfloat;
      aLine.UnitPrice := FieldByName('Unit_Price').asfloat;
      aLine.UnitCost := FieldByName('Unit_Cost').asfloat;
      aLine.Vat := FieldByName('Vat').asinteger;
      aLine.VatDescription := FieldByName('Vat_Description').asstring;
      aLine.VatRate := FieldByName('Vat_Rate').asfloat;
      FSOLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSOrder.LoadEvents;
var
  aEvent : TSOEvent;
begin
  FSOEvents.Clear;
  with FDataModule.qrySOAllEvents do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aEvent := TSOEvent.Create(Self);
      aEvent.EventNumber := FieldByName('Internal_Note').AsInteger;
      aEvent.DateEntered := FieldByName('Date_Time_Entered').Asdatetime;
      aEvent.Operator := FieldByName('Operator').Asinteger;
      aEvent.OperatorName := FieldByName('Operator_Name').asstring;
      aEvent.Narrative.dbKey := FieldByName('Narrative').asinteger;
      aEvent.Narrative.LoadFromDB;

      FSOEvents.Add(aEvent);
      Next;
    end;
    Close;
  end;
end;

procedure TSOrder.SaveEvents;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteEvents;  { Get rid of any already in database }
  FSOEvents.Renumber;
  for i := 0 to Pred(FSOEvents.Count) do
    begin
      FSOEvents[i].SaveToDB;
    end;
end;

procedure TSOrder.LoadJobLines;
var
  aLine : TSOLine;
begin
  FSOLines.Clear;
  with FDataModule.qryJobHeader do
  begin
    Close;
    ParamByName('Job').AsInteger := Datamodule.JobNo;
    Open;
    while not(EOF) do
    begin
      aLine := TSOLine.Create(Self);
      aLine.SOLNumber := 1;
      aLine.Quantity := 1;
      aLine.CostUnit := 1;
      aLine.DeliveryPrice := FieldByName('Delivery_Price').asfloat;
      aLine.Description := FieldByName('Description').asstring;
      aLine.DiscountValue := FieldByName('Discount_Value').asfloat;
      aLine.InstallPrice := FieldByName('Installation_Price').asfloat;
      aLine.Job := FieldByName('Job').asfloat;
      aLine.MarkupValue := FieldByName('Markup_Value').asfloat;
      aLine.WasteValue := FieldByName('Waste_Value').asfloat;
      aLine.NettPrice := fieldbyname('Quote_Nett_Price').asfloat;
      aLine.QtyAllocated := 0;
      aLine.QtyDelivered := 0;
      aLine.QtyInvoiced := 0;
      aLine.SellUnit := 1;
      aline.Product := 0;
      aLine.StockDescription := '';
      aLine.StockCode := '';
      aLine.SurveyPrice := FieldByName('Survey_Price').asfloat;
      aLine.UnitPrice := aLine.NettPrice + aLine.DeliveryPrice + aLine.InstallPrice + aLine.SurveyPrice - aLine.DiscountValue + aLine.MarkupValue
                      + aLine.WasteValue;
      aLine.UnitCost := 0;
      aLine.Vat := FieldByName('Vat').asinteger;
      aLine.VatDescription := '';
      aLine.VatRate := datamodule.getVatRate(aLine.Vat);
      FSOLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSOrder.LoadQuoteLines;
var
  aLine : TSOLine;
begin
  FSOLines.Clear;
  with FDataModule.qryQHeader do
  begin
    Close;
    ParamByName('Quote').AsInteger := Datamodule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      aLine := TSOLine.Create(Self);
      aLine.SOLNumber := 1;
      aLine.Quantity := 1;
      aLine.CostUnit := 1;
      aLine.MarkupValue := FieldByName('Markup_Value').asfloat;
      aLine.DeliveryPrice := FieldByName('Delivery_Price').asfloat;
      aLine.Description := FieldByName('Description').asstring;
      aLine.DiscountValue := FieldByName('Discount_Value').asfloat;
      aLine.InstallPrice := FieldByName('Installation_Price').asfloat;
      aLine.WasteValue := FieldByName('Waste_Value').asfloat;
      aLine.Job := 0;
      aLine.Quote := Datamodule.QuoteNo;
      aLine.NettPrice := fieldbyname('Nett_Price').asfloat;
      aLine.QtyAllocated := 0;
      aLine.QtyDelivered := 0;
      aLine.QtyInvoiced := 0;
      aLine.SellUnit := 1;
      aline.Product := 0;
      aLine.StockDescription := '';
      aLine.StockCode := '';
      aLine.SurveyPrice := FieldByName('Survey_Price').asfloat;
      aLine.UnitPrice := aLine.NettPrice + aLine.DeliveryPrice + aLine.InstallPrice + aLine.SurveyPrice - aLine.DiscountValue + aLine.MarkupValue
                          + aLine.WasteValue;
      aLine.UnitCost := 0;
      aLine.Vat := FieldByName('Vat').asinteger;
      aLine.VatDescription := FieldByName('Vat_Description').asstring;
      aLine.VatRate := datamodule.getVatRate(aLine.Vat);
      FSOLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSOrder.LoadQuoteEvents;
var
  aEvent : TSOEvent;
begin
  FSOEvents.Clear;
  with FDataModule.qryQAllEvents do
  begin
    Close;
    ParamByName('Quote').AsInteger := Datamodule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      aEvent := TSOEvent.Create(Self);
      aEvent.EventNumber := FieldByName('Internal_Note').AsInteger;
      aEvent.DateEntered := FieldByName('Date_Time_Entered').Asdatetime;
      aEvent.Operator := FieldByName('Operator').Asinteger;
      aEvent.OperatorName := FieldByName('Operator_Name').asstring;
      aEvent.Narrative.dbKey := FieldByName('Narrative').asinteger;
      aEvent.Narrative.LoadFromDB;

      aEvent.Narrative.DBKey := 0;
      FSOEvents.Add(aEvent);
      Next;
    end;
    Close;
  end;
end;

procedure TSOrder.SaveLines;
var
  i : integer;
begin
  { When saving, we have to delete all line records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  if (Status > 10) or (FSOPurchases.count > 0) then
    begin
      for i := 0 to Pred(FSOLines.Count) do
        begin
          if FSOLines[i].Mode = 'C' then
            FSOLines[i].UpdateDB
          else
            FSOLines[i].SaveToDB;
        end;
    end
  else
    begin
      DeleteLines;  { Get rid of any already in database }
      FSOLines.Renumber;
      for i := 0 to Pred(FSOLines.Count) do
        begin
          if (OrderMode = sopCopy) and (FSOLines[i].Quote <> 0) then
            FSOLines[i].CopyQuote;

          FSOLines[i].SaveToDB;
        end;
    end;
end;

procedure TSOrder.SaveSONumber;
begin
  with datamodule.qryUpCompany do
    begin
      close;
      parambyname('Last_Sales_Order_number').asinteger := dbKey;
      execsql;
    end;

end;

procedure TSOrder.SaveToDB(TempAll: boolean);
var
  iNotes: integer;
begin
  if DbKey = 0 then
    begin
      DbKey := FDataModule.GetNextSONumber;
      with FDataModule.qrySOAddHeader do
        begin
          ParamByName('Sales_Order').AsInteger := DbKey;
          if (Retail) or (Speculative) then
            ParamByName('Address').asinteger := Address
          else
            {clear the old address}
            ParamByName('Address').clear;

          ParambyName('Appliance_Details').asstring := self.ApplianceDetails;

          ParambyName('Account_Manager').asinteger := self.AccountManager;
          ParambyName('Date_Required').asdatetime := self.DateRequired;
          ParamByName('Date_Raised').asdatetime := self.SODate;
          Parambyname('Date_Type').AsString := DateType;
          ParambyName('Descriptive_Reference').asstring := Description;

          if DoNotInvoice then
            Parambyname('Do_Not_Invoice').asstring := 'Y'
          else
            Parambyname('Do_Not_Invoice').asstring := 'N';

          if MaterialRequired then
            Parambyname('Materials_Required').AsString := 'Y'
          else
            Parambyname('Materials_Required').AsString := 'N';

          Parambyname('Materials_Reqd_Date').Asdatetime := MaterialReqdDate;
          Parambyname('Materials_Recd_Date').Asdatetime := MaterialRecdDate;
          ParamByName('Customer').AsInteger := Customer;

          if CustomerBranch = 0 then
            ParamByName('Branch_no').clear
          else
            ParamByName('Branch_no').AsInteger := CustomerBranch;

          ParamByName('Rep').AsInteger := Rep;
          Parambyname('Contact_Name').asstring := ContactName;
          Parambyname('Contact_No').asinteger := ContactNo;

          Parambyname('Customer_Name').asstring := CustomerName;
          ParamByName('Operator').AsInteger := Operator;
          if OnHold then
            Parambyname('On_Hold').asstring := 'Y'
          else
            Parambyname('On_Hold').asstring := 'N';
          if ExtraNotes = 0 then
            ParamByName('Extra_Notes').clear
          else
            ParamByName('Extra_Notes').Asinteger := ExtraNotes;
          ParambyName('Project_Reference').asstring := ProjectReference;
          ParambyName('Reference').asstring := Reference;
          ParambyName('Order_Ref_no').asstring := OrderReference;
          ParamByName('Sales_Order_Status').Asinteger := 10;
          Parambyname('Inactive').asstring := 'N';
          Parambyname('inactive_reason').clear;
          Parambyname('Deposit_Terms').Asfloat := DepositTerms;
          Parambyname('Deposit_Amount').Asfloat := DepositAmount;
          Parambyname('Goods_Value').Asfloat := TotalGoods;
          Parambyname('Template_Date').Asdatetime := TemplateDate;
          Parambyname('Vat_Value').Asfloat := TotalVat;

          {This is the new itemised installation address, street, locale, city, postcode, county}
          ParamByName('Installation_Address').Asinteger := InstallationAddress;

          {This is the old installation address block}
          if InstallAddress = 0 then
            ParamByName('Install_Address').clear
          else
            ParamByName('Install_Address').Asinteger := InstallAddress;

          ParamByName('Email_Address').Asstring := InstallEmail;
          ParamByName('Install_Name').Asstring := InstallName;
          ParamByName('Install_Phone').Asstring := InstallPhone;

          if InvoiceCustomer = 0 then
            ParamByName('Inv_Customer').clear
          else
            ParamByName('Inv_Customer').Asinteger := InvoiceCustomer;

          if Fitter = 0 then
            ParamByName('Fitter').clear
          else
            ParamByName('Fitter').AsInteger := Fitter;

          if Templater = 0 then
            ParamByName('Templater').clear
          else
            ParamByName('Templater').AsInteger := Templater;

          Parambyname('Remedial_No_Production').asstring := RemedialNoProduction;
          Parambyname('Remedial_Production').asstring := RemedialProduction;

          Parambyname('Collection_Only').asstring := CollectionOnly;
          Parambyname('Supply_Only').asstring := SupplyOnly;
          {Scheduling}
          if TemplateInSchedule then
            Parambyname('IsTemplateInOutlook').asstring :=  'Y'
          else
            Parambyname('IsTemplateInOutlook').asstring :=  'N';

          if FittingInSchedule then
            Parambyname('IsFittingInOutlook').asstring :=  'Y'
          else
            Parambyname('IsFittingInOutlook').asstring :=  'N';

          parambyname('Template_Duration').asinteger := 60;
          parambyname('Fitting_Duration').asinteger := 60;

          parambyname('Fitting_Docs_Returned').asstring := 'N';
          parambyname('Template_Docs_Returned').asstring := 'N';

          parambyname('Location_Plan_Document').asstring := LocationPlanDocument;

          if RevenueCentre = 0 then
            parambyname('Revenue_Centre').clear
          else
            parambyname('Revenue_Centre').asinteger := RevenueCentre;

          parambyname('Remedial_ID').asinteger := RemedialID;

          if (soMode = sopRemedial) then
            begin
              Parambyname('Sales_Order_Number').asfloat   := GetNextRemedialNumber;
              Parambyname('Original_Sales_Order').asinteger := OriginalSalesOrder;
            end
          else
            begin
              Parambyname('Sales_Order_Number').asfloat := dbKey;
              Parambyname('Original_Sales_Order').asinteger := dbKey;
            end;

          ExecSQL;
        end;
      SaveSONumber;
      dtmdlWorktops.CreateSalesDocDirectory(inttostr(dbKey));
    end
  else
  if TempAll then
    begin
      with FDataModule.qrySOUpHeader do
        begin
          ParamByName('Sales_Order').AsInteger := DbKey;
          if (Retail) or (Speculative) then
            ParamByName('Address').asinteger := Address
          else
            {clear the old address}
            ParamByName('Address').clear;

          ParambyName('Appliance_Details').asstring := self.ApplianceDetails;

          ParambyName('Account_Manager').asinteger := self.AccountManager;
          ParambyName('Date_Required').asdatetime := self.DateRequired;
          ParamByName('Date_Raised').asdatetime := self.SODate;
          Parambyname('Date_Type').AsString := DateType;
          ParambyName('Descriptive_Reference').asstring := Description;

          if DoNotInvoice then
            Parambyname('Do_Not_Invoice').asstring := 'Y'
          else
            Parambyname('Do_Not_Invoice').asstring := 'N';

          if MaterialRequired then
            Parambyname('Materials_Required').AsString := 'Y'
          else
            Parambyname('Materials_Required').AsString := 'N';

          Parambyname('Materials_Reqd_Date').Asdatetime := MaterialReqdDate;
          Parambyname('Materials_Recd_Date').Asdatetime := MaterialRecdDate;
          ParamByName('Customer').AsInteger := Customer;

          if CustomerBranch = 0 then
            ParamByName('Branch_no').clear
          else
            ParamByName('Branch_no').AsInteger := CustomerBranch;

          ParamByName('Rep').AsInteger := Rep;
          Parambyname('Contact_Name').asstring := ContactName;
          Parambyname('Contact_No').asinteger := ContactNo;
          Parambyname('Customer_Name').asstring := CustomerName;
//          ParamByName('Operator').AsInteger := Operator;
          if OnHold then
            Parambyname('On_Hold').asstring := 'Y'
          else
            Parambyname('On_Hold').asstring := 'N';

          if ExtraNotes = 0 then
            ParamByName('Extra_Notes').clear
          else
            ParamByName('Extra_Notes').Asinteger := ExtraNotes;

          ParambyName('Project_Reference').asstring := ProjectReference;
          ParambyName('Reference').asstring := Reference;
          ParambyName('Order_Ref_no').asstring := OrderReference;
          ParamByName('Sales_Order_Status').Asinteger := GetCurrentStatus;
          Status := ParamByName('Sales_Order_Status').Asinteger;
          Parambyname('Inactive').asstring := inactive;
          Parambyname('inactive_reason').clear;
          Parambyname('Deposit_Terms').Asfloat := DepositTerms;
          Parambyname('Deposit_Amount').Asfloat := DepositAmount;
          Parambyname('Goods_Value').Asfloat := TotalGoods;
          Parambyname('Template_Date').Asdatetime := TemplateDate;
          Parambyname('Vat_Value').Asfloat := TotalVat;

          {This is the new itemised installation address, street, locale, city, postcode, county}
          ParamByName('Installation_Address').Asinteger := InstallationAddress;

          {This is the old installation address block}
          if InstallAddress = 0 then
            ParamByName('Install_Address').clear
          else
            ParamByName('Install_Address').Asinteger := InstallAddress;

          if InvoiceCustomer = 0 then
            ParamByName('Inv_Customer').clear
          else
            ParamByName('Inv_Customer').Asinteger := InvoiceCustomer;

          ParamByName('Email_Address').Asstring := InstallEmail;
          ParamByName('Install_Name').Asstring := InstallName;
          ParamByName('Install_Phone').Asstring := InstallPhone;

          if Fitter = 0 then
            ParamByName('Fitter').clear
          else
            ParamByName('Fitter').AsInteger := Fitter;

          if Templater = 0 then
            ParamByName('Templater').clear
          else
            ParamByName('Templater').AsInteger := Templater;

          Parambyname('Remedial_No_Production').asstring := RemedialNoProduction;
          Parambyname('Remedial_Production').asstring := RemedialProduction;

          Parambyname('Collection_Only').asstring := CollectionOnly;
          Parambyname('Supply_Only').asstring := SupplyOnly;

          {Scheduling}
          if TemplateInSchedule then
            Parambyname('IsTemplateInOutlook').asstring :=  'Y'
          else
            Parambyname('IsTemplateInOutlook').asstring :=  'N';

          if FittingInSchedule then
            Parambyname('IsFittingInOutlook').asstring :=  'Y'
          else
            Parambyname('IsFittingInOutlook').asstring :=  'N';

          parambyname('Template_Duration').asinteger := TemplateDuration;
          parambyname('Fitting_Duration').asinteger := FittingDuration;

          if FittingDocsReturned then
            parambyname('Fitting_Docs_Returned').asstring := 'Y'
          else
            parambyname('Fitting_Docs_Returned').asstring := 'N';
          if TemplateDocsReturned then
            parambyname('Template_Docs_Returned').asstring := 'Y'
          else
            parambyname('Template_Docs_Returned').asstring := 'N';

          parambyname('Location_Plan_Document').asstring := LocationPlanDocument;

          if RevenueCentre = 0 then
            parambyname('Revenue_Centre').clear
          else
            parambyname('Revenue_Centre').asinteger := RevenueCentre;

          parambyname('Remedial_ID').asinteger := RemedialID;
          ExecSQL;
        end
    end;
  SaveLines;
  SaveEvents;

  //Update any Remedials associated with this order
  if FittingDocsReturned then
    self.DataModule.SetRemedialCompleted(dbKey, 'Y')
  else
    self.DataModule.SetRemedialCompleted(dbKey, 'N');

  // Update the status now all the lines have been added
  with FDataModule.qrySOUpStatus do
    begin
      ParamByName('Sales_Order').AsInteger := DbKey;
      ParamByName('Sales_order_Status').asinteger := GetCurrentStatus;
      ExecSQL;
    end;

  // Update the customer name on the invoice if Retail customer
  if Retail then
    begin
      with FDataModule.qrySOUpSalesInvoice do
        begin
          ParamByName('Reference').AsString := inttostr(DbKey);
          ParamByName('Customer_Name').asstring := self.CustomerName;
          ExecSQL;
        end;
    end;

  self.FDataModule.SetCustomerProspect(Customer);
end;

procedure TSOrder.SetAddress(const Value: integer);
begin
  FAddress := Value;
end;

procedure TSOrder.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TSOrder.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TSOrder.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TSOrder.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TSOrder.SetdbKey(const Value: integer);
begin
  FdbKey := Value;
end;

procedure TSOrder.SetDepositAmount(const Value: currency);
begin
  FDepositAmount := Value;
end;

procedure TSOrder.SetDepositTerms(const Value: double);
begin
  FDepositTerms := Value;
end;

procedure TSOrder.SetExtraNotes(const Value: integer);
begin
  FExtraNotes := Value;
end;

procedure TSOrder.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TSOrder.SetInstallAddress(const Value: integer);
begin
  FInstallAddress := Value;
end;

procedure TSOrder.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TSOrder.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TSOrder.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TSOrder.SetOrderReference(const Value: string);
begin
  FOrderReference := Value;
end;

procedure TSOrder.SetReason(const Value: integer);
begin
  FReason := Value;
end;

procedure TSOrder.SetReference(const Value: string);
begin
  FReference := Value;
end;

procedure TSOrder.SetRep(const Value: integer);
begin
  FRep := Value;
end;

procedure TSOrder.SetRepName(const Value: string);
begin
  FRepName := Value;
end;

procedure TSOrder.SetRetail(const Value: bytebool);
begin
  FRetail := Value;
end;

procedure TSOrder.SetSODate(const Value: TDateTime);
begin
  FSODate := Value;
end;

procedure TSOrder.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TSOrder.SetStatusDescr(const Value: string);
begin
  FStatusDescr := Value;
end;

procedure TSOrder.SetTemplateDate(const Value: TDateTime);
begin
  FTemplateDate := Value;
end;

procedure TSOrder.SetDateType(const Value: string);
begin
  FDateType := Value;
end;

procedure TSOrder.SetMaterialRecdDate(const Value: TDateTime);
begin
  FMaterialRecdDate := Value;
end;

procedure TSOrder.SetMaterialReqdDate(const Value: TDateTime);
begin
  FMaterialReqdDate := Value;
end;

procedure TSOrder.SetMaterialRequired(const Value: boolean);
begin
  FMaterialRequired := Value;
end;

procedure TSOrder.SetInstallName(const Value: string);
begin
  FInstallName := Value;
end;

procedure TSOrder.SetInstallPhone(const Value: string);
begin
  FInstallPhone := Value;
end;

procedure TSOrder.SetOnHold(const Value: boolean);
begin
  FOnHold := Value;
end;

procedure TSOrder.SetEmailAddress(const Value: string);
begin
  FEmailAddress := Value;
end;

procedure TSOrder.SetTelephone(const Value: string);
begin
  FTelephone := Value;
end;

procedure TSOrder.SetAccountManager(const Value: integer);
begin
  FAccountManager := Value;
end;

procedure TSOrder.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TSOrder.SetFittingInSchedule(const Value: boolean);
begin
  FFittingInSchedule := Value;
end;

procedure TSOrder.SetTemplateInSchedule(const Value: boolean);
begin
  FTemplateInSchedule := Value;
end;

procedure TSOrder.SetFitter(const Value: integer);
begin
  FFitter := Value;
end;

procedure TSOrder.SetTemplater(const Value: integer);
begin
  FTemplater := Value;
end;

procedure TSOrder.SetSupplyOnly(const Value: string);
begin
  FSupplyOnly := Value;
end;

procedure TSOrder.SetOrderMode(const Value: TsopMode);
begin
  FOrderMode := Value;
end;

procedure TSOrder.AddQuoteLine;
var
  aLine : TSOLine;
begin
  with FDataModule.qryQHeader do
  begin
    Close;
    ParamByName('Quote').AsInteger := Datamodule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      aLine := TSOLine.Create(Self);
      aLine.SOLNumber := self.Lines.GetMaxLineNo + 1;
      aLine.Quantity := 1;
      aLine.CostUnit := 1;
      aLine.MarkupValue := FieldByName('Markup_Value').asfloat;
      aLine.DeliveryPrice := FieldByName('Delivery_Price').asfloat;
      aLine.Description := FieldByName('Description').asstring;
      aLine.DiscountValue := FieldByName('Discount_Value').asfloat;
      aLine.InstallPrice := FieldByName('Installation_Price').asfloat;
      aLine.WasteValue := FieldByName('Waste_Value').asfloat;
      aLine.Job := 0;
      aLine.Quote := Datamodule.QuoteNo;
      aLine.NettPrice := fieldbyname('Nett_Price').asfloat;
      aLine.QtyAllocated := 0;
      aLine.QtyDelivered := 0;
      aLine.QtyInvoiced := 0;
      aLine.SellUnit := 1;
      aline.Product := 0;
      aLine.StockDescription := '';
      aLine.StockCode := '';
      aLine.SurveyPrice := FieldByName('Survey_Price').asfloat;
      aLine.UnitPrice := aLine.NettPrice + aLine.DeliveryPrice + aLine.InstallPrice + aLine.SurveyPrice - aLine.DiscountValue + aLine.MarkupValue
                          + aLine.WasteValue;
      aLine.UnitCost := 0;
      aLine.Vat := FieldByName('Vat').asinteger;
      aLine.VatDescription := FieldByName('Vat_Description').asstring;
      aLine.VatRate := datamodule.getVatRate(aLine.Vat);
      FSOLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSOrder.MoveQuoteDocuments;
var
  sSource, sDest: string;
  SearchRec: TSearchRec;
  irow: integer;
  sFilename: string;
  FileInfo: SHFILEINFO;
  sFolderName: string;
begin
  sFolderName := dtmdlWorktops.GetContractDrawingFolderName;

  if trim(sFolderName) <> '' then
    sSource := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(self.datamodule.QuoteNo) + '\' + sFolderName + '\'
  else
    sSource := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(self.datamodule.QuoteNo) + '\' ;

  if trim(sFolderName) <> '' then
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(self.dbkey) + '\' + sFolderName + '\'
  else
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(self.dbkey) + '\' ;

  try
    CreateDir(sDest);
  except
  end;


  irow := FindFirst(sSource + '*.*', faArchive, SearchRec);
  while irow = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          //Get The DisplayName
          SHGetFileInfo(PChar(sSource + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_DISPLAYNAME);
          sFilename := SearchRec.Name;

          //copy the file
          try
            filecopy(sSource+sFilename, sDest+sFilename);
          except
          end;
        end;
      iRow := FindNext(SearchRec);
    end;
end;

procedure TSOrder.SetSOMode(const Value: TSOPMode);
begin
  FSOMode := Value;
end;

procedure TSOrder.SetProjectReference(const Value: string);
begin
  FProjectReference := Value;
end;

procedure TSOrder.SetSpeculative(const Value: boolean);
begin
  FSpeculative := Value;
end;

procedure TSOrder.LoadPurchaseOrders;
var
  aLine : TSOPurchase;
  iCount: integer;
  sText: string;
begin
  with FDataModule.qrySOPurchases do
  begin
    Close;
    if dtmdlWorktops.IsSQL then
      begin
        sText := stringreplace(SQL.Text, 'CSTR(', 'CONVERT(nvarchar(10), ', [rfReplaceAll]);
        SQL.Text := sText;
      end;
      
    ParamByName('Sales_Order').AsInteger := DbKey;
    ParamByName('inactive').AsString := 'N';
    Open;
    iCount := 1;
    while not(EOF) do
    begin
      aLine := TSOPurchase.Create(Self);
      aLine.DateRaised := FieldByName('Date_Raised').Asdatetime;
      aLine.DateREquired := FieldByName('Date_Required'). asdatetime;
      aLine.GRNNumber := FieldByName('GRN_Number').asstring;
      aLine.inactive := (FieldByName('inactive').asstring = 'Y');
      aLine.LineDescription := FieldByName('PO_Line_Description').asstring;
      aLine.OfficeContact := FieldByName('Office_Contact').asinteger;
      aLine.OfficeContactName := FieldByName('Office_Contact_Name').asstring;
      aLine.Operator := FieldByName('Operator').asinteger;
      aLine.OperatorName := FieldByName('Operator_Name').asstring;
      aLine.OnHold := (FieldByName('On_Hold').asstring = 'Y');
      aLine.PONumber := FieldByName('Purchase_Order').asinteger;
      aLine.POLineNumber := FieldByName('Line_No').asinteger;
      aLine.POLNumber := iCount;
      aLine.Quantity := FieldByName('Quantity').asfloat;
      aLine.SlabDescription := fieldbyname('Slab_Description').asstring;
      aLine.SlabDepth := fieldbyname('Slab_Depth').asinteger;
      aLine.SlabLength := fieldbyname('Slab_Length').asinteger;
      aLine.Status := fieldbyname('Purchase_Order_Status').asinteger;
      aLine.StatusDescription := fieldbyname('Status_Description').asstring;
      aLine.Supplier := FieldByName('Supplier').asinteger;
      aLine.SupplierName := FieldByName('Supplier_Name').asstring;
      aLine.SupplierContact := FieldByName('Supplier').asinteger;
      aLine.SupplierContactName := FieldByName('Contact_Name').asstring;
      aLine.UnitCost := FieldByName('Unit_Cost').asfloat;
      FSOPurchases.Add(aLine);

      iCount := iCount + 1;
      
      Next;
    end;
  end;
end;

procedure TSOrder.SetTemplateDuration(const Value: integer);
begin
  FTemplateDuration := Value;
end;

procedure TSOrder.SetFittingDuration(const Value: integer);
begin
  FFittingDuration := Value;
end;

procedure TSOrder.SetContactNo(const Value: integer);
begin
  FContactNo := Value;
end;

procedure TSOrder.SetApplianceDetails(const Value: string);
begin
  FApplianceDetails := Value;
end;

procedure TSOrder.SetLocationPlanDocument(const Value: string);
begin
  FLocationPlanDocument := Value;
end;

procedure TSOrder.SetCollectionOnly(const Value: string);
begin
  FCollectionOnly := Value;
end;

procedure TSOrder.SetInstallEmail(const Value: string);
begin
  FInstallEmail := Value;
end;

procedure TSOrder.SetInstallationAddress(const Value: integer);
begin
  FInstallationAddress := Value;
end;

procedure TSOrder.SetFittingDocsReturned(const Value: boolean);
begin
  FFittingDocsReturned := Value;
end;

procedure TSOrder.SetTemplateDocsReturned(const Value: boolean);
begin
  FTemplateDocsReturned := Value;
end;

procedure TSOrder.SetRevenueCentre(const Value: integer);
begin
  FRevenueCentre := Value;
end;

procedure TSOrder.SetRemedialNoProduction(const Value: string);
begin
  FRemedialNoProduction := Value;
end;

procedure TSOrder.SetRemedialProduction(const Value: string);
begin
  FRemedialProduction := Value;
end;

procedure TSOrder.SetRemedialID(const Value: integer);
begin
  FRemedialID := Value;
end;

function TSOrder.GetNextRemedialNumber: real;
begin
  if OriginalSalesOrder = 0 then
    OriginalSalesOrder := dbkey;
    
  try
    with FDataModule.qryRemedialCount do
      begin
        Close;
        parambyname('Original_Sales_Order').asfloat := OriginalSalesOrder;
        Open;
        Result := (FieldByName('Last_Remedial').Asfloat) + 0.01;
        Close;
      end;
  except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Remedial number:' + #13 + E.Message);
    end;
  end;
end;

procedure TSOrder.SetOriginalSalesOrder(const Value: integer);
begin
  FOriginalSalesOrder := Value;
end;

procedure TSOrder.SetSalesOrderNumber(const Value: double);
begin
  FSalesOrderNumber := Value;
end;

procedure TSOrder.SetDoNotInvoice(const Value: boolean);
begin
  FDoNotInvoice := Value;
end;

procedure TSOrder.SetInvoiceCustomer(const Value: integer);
begin
  FInvoiceCustomer := Value;
end;

procedure TSOrder.SetInvoiceCustomerName(const Value: string);
begin
  FInvoiceCustomerName := Value;
end;

procedure TSOrder.SetCustomerBranch(const Value: integer);
begin
  FCustomerBranch := Value;
end;

procedure TSOrder.SetBranchExist(const Value: boolean);
begin
  FBranchExist := Value;
end;

procedure TSOrder.SetCustomerBranchName(const Value: string);
begin
  FCustomerBranchName := Value;
end;

procedure TSOrder.SetStockAllocationEndDate(const Value: TDateTime);
begin
  FStockAllocationEndDate := Value;
end;

procedure TSOrder.SetStockAllocationStartDate(const Value: TDateTime);
begin
  FStockAllocationStartDate := Value;
end;

{ TSOLines }

procedure TSOLines.Add(aLine: TSOLine);
begin
  FItems.Add(aLine);
end;

procedure TSOLines.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSOLine(FItems[i]).Free;
end;

function TSOLines.Clone: TSOLines;
var
  i : integer;
begin
  Result := TSOLines.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TSOLine(FItems[i]).Clone);
end;

constructor TSOLines.Create(SOrder: TSOrder);
begin
  FParent := SOrder;
  FItems := TList.Create;

end;

procedure TSOLines.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TSOLines.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSOLine(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TSOLines.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TSOLines.GetItems(Index: integer): TSOLine;
begin
  Result := TSOLine(FItems[Index]);
end;

function TSOLines.GetMaxLineNo: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].SOLNumber > Result then
      Result := Items[i].SOLNumber;
end;

function TSOLines.IndexOf(const LineNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TSOLine(FItems[i]).SOLNumber = LineNo then
      Result := i;
end;

procedure TSOLines.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSOLine(FItems[i]).SOLNumber:= (i+1);
end;

procedure TSOLines.SetItems(Index: integer; const Value: TSOLine);
begin
  FItems[Index] := Value;
end;

{ TSOLine }

function TSOLine.Clone: TSOLine;
begin
  Result := TSOLine.Create(FParent);
  Result.CostUnit             := self.CostUnit;
  Result.DeliveryPrice        := self.DeliveryPrice;
  Result.Description          := self.Description;
  Result.DiscountValue        := self.DiscountValue;
  Result.InstallPrice         := self.InstallPrice;
  Result.Job                  := self.Job;
  Result.MarkupValue          := self.MarkupValue;
  Result.Mode                 := self.Mode;
  Result.NettPrice            := self.NettPrice;
  Result.PONumber             := self.PONumber;
  Result.Product              := self.Product;
  Result.Quantity             := self.Quantity;
  Result.Quote                := self.Quote;
  Result.QtyAllocated         := self.QtyAllocated;
  Result.QtyDelivered         := self.QtyDelivered;
  Result.QtyInvoiced          := self.QtyInvoiced;
  Result.SellUnit             := self.SellUnit;
  Result.SINumber             := self.SINumber;
  Result.SOLNumber            := self.SOLNumber;
  Result.StockAllocationEndDate
                              := self.StockAllocationEndDate;
  Result.StockAllocationStartDate
                              := self.StockAllocationStartDate;
  Result.StockCode            := self.StockCode;
  Result.StockDescription     := self.StockDescription;
  Result.StockItem            := self.StockItem;
  Result.SurveyPrice          := self.SurveyPrice;
  Result.UnitPrice            := self.UnitPrice;
  Result.UnitCost             := self.UnitCost;
  Result.Vat                  := self.Vat;
  Result.VatDescription       := self.VatDescription;
  Result.VatRate              := self.VatRate;
  Result.WasteValue           := self.WasteValue;
end;

constructor TSOLine.Create(SOrder: TSOrder);
begin
  FParent := SOrder;
end;

destructor TSOLine.Destroy;
begin

  inherited;
end;

function TSOLine.GetTotalGoods: currency;
begin
//  if (self.Quote <> 0) or (self.Job <> 0) then
  if (self.Quote <> 0) then
    result := self.InstallPrice + self.DeliveryPrice + self.SurveyPrice +
              self.NettPrice - self.DiscountValue + self.MarkupValue + self.WasteValue
  else
    result := (UnitPrice * (Quantity/SellUnit));
end;

procedure TSOLine.UpdateJobCustomer(tmpCode: double; tmpCustomer, tmpContact: integer; tmpName: string);
begin
  with FParent.FDataModule.qryUpJobCustomer do
    begin
      close;
      parambyname('Job').asfloat := tmpCode;
      parambyname('Customer').asinteger := tmpCustomer;
      parambyname('Customer_Name').asstring := tmpName;
//      parambyname('Contact_no').asinteger := tmpContact;
      execsql;
    end;
end;

procedure TSOLine.UpdateQuoteCustomer(tmpCode, tmpCustomer, tmpContact: integer; tmpName: string);
begin
  with FParent.FDataModule.qryUpQuoteCustomer do
    begin
      close;
      parambyname('Quote').asinteger := tmpCode;
      parambyname('Customer').asinteger := tmpCustomer;
      parambyname('Customer_Name').asstring := tmpName;
//      parambyname('Contact_no').asinteger := tmpContact;
      execsql;
    end;
end;

procedure TSOLine.UpdateQuote(tmpCode, tmpStatus: integer);
begin
  with FParent.FDataModule.qryUpQuote do
    begin
      close;
      parambyname('Quote').asinteger := tmpCode;
      parambyname('Quote_Status').asinteger := tmpStatus;
      execsql;
    end;
end;

procedure TSOLine.UpdateQuoteVersions(tmpCode, tmpStatus: integer);
var
  rOriginalQuote: real;
begin
  {get original quote number}
  with FParent.FDataModule.qryGetQuote do
    begin
      close;
      parambyname('Quote').asinteger := tmpCode;
      open;
      if recordcount > 0 then
        rOriginalQuote := fieldbyname('Original_Quote').asinteger
      else
        exit;
    end;

  {Update associated quotes}
  with FParent.FDataModule.qryUpQuoteVersions do
    begin
      close;
      parambyname('Quote').asinteger := tmpCode;
      parambyname('Original_Quote').asfloat := rOriginalQuote;
      parambyname('Quote_Status').asinteger := 23;
      execsql;
    end;
end;

procedure TSOLine.LoadFromDB;
begin
  with FParent.FDataModule.qrySOLine do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := FParent.DbKey;
    ParamByName('Sales_Order_Line_no').AsInteger := SOLNumber;
    Open;

    Quantity := FieldByName('Quantity').asfloat;
    CostUnit := FieldByName('Cost_unit').asinteger;
    DeliveryPrice := FieldByName('Delivery_Price').asfloat;
    Description := FieldByName('Description').asstring;
    DiscountValue := FieldByName('Discount_Value').asfloat;
    InstallPrice := FieldByName('Installation_Price').asfloat;
    Job := FieldByName('Job').asfloat;
    MarkupValue := FieldByName('Markup_Value').asfloat;
    WasteValue := FieldByName('Waste_Value').asfloat;
    NettPrice := FieldByName('Nett_Price').asfloat;
    Quantity := FieldByName('Quantity').asfloat;
    Quote := fieldbyname('Quote').asinteger;
    QtyAllocated := FieldByName('Quantity_Allocated').asfloat;
    QtyDelivered := FieldByName('Quantity_Delivered').asfloat;
    QtyInvoiced := FieldByName('Quantity_Invoiced').asfloat;
    SellUnit := FieldByName('Sell_Unit').asinteger;
    SINumber := FieldByName('Sales_Invoice_Number').asstring;
    SOLNumber := FieldByName('Sales_Order_Line_no').asinteger;
    StockAllocationEndDate := FieldByName('Stock_Allocation_End_Date').asdatetime;
    StockAllocationStartDate := FieldByName('Stock_Allocation_Start_Date').asdatetime;
    StockCode := FieldByName('Stock_Code').asstring;
    StockDescription := FieldByName('Stock_Description').asstring;
    StockItem := FieldByName('Stock_Item').asinteger;
    SurveyPrice := FieldByName('Survey_Price').asfloat;
    UnitPrice := FieldByName('Unit_Price').asfloat;
    UnitCost := FieldByName('Unit_Cost').asfloat;
    Vat := FieldByName('Vat').asinteger;
    VatRate := FieldByName('Vat_Rate').asfloat;
    Close;
  end;
end;

procedure TSOLine.SaveToDB;
begin
  with FParent.FDataModule.qrySOAddLine do
  begin
    ParamByName('Sales_Order').AsInteger := FParent.DbKey;
    ParamByName('Sales_Order_Line_no').AsInteger := SOLNumber;

    Parambyname('Quantity').asfloat := Quantity;
    Parambyname('Cost_unit').asinteger := CostUnit;
    ParambyName('Delivery_Price').asfloat := DeliveryPrice;
    ParambyName('Description').asstring := Description;
    ParambyName('Discount_Value').asfloat := DiscountValue;
    ParambyName('Installation_Price').asfloat := InstallPrice;
    if Job = 0 then
      ParambyName('Job').clear
    else
      ParambyName('Job').asfloat := Job;
    if Quote = 0 then
      ParambyName('Quote').clear
    else
      ParambyName('Quote').asfloat := Quote;
    ParambyName('Markup_Value').asfloat := MarkupValue;
    ParambyName('Waste_Value').asfloat := WasteValue;
    ParambyName('Nett_Price').asfloat := NettPrice;
    ParambyName('Quantity_Allocated').asfloat := QtyAllocated;
    ParambyName('Quantity_Delivered').asfloat := QtyDelivered;
    ParambyName('Quantity_Invoiced').asfloat := QtyInvoiced;
    ParambyName('Sell_Unit').asinteger := SellUnit;
    if product = 0 then
      ParambyName('Product').clear
    else
      ParambyName('Product').asinteger := Product;
    ParambyName('Survey_Price').asfloat := SurveyPrice;
    ParambyName('Unit_Price').asfloat := UnitPrice;
    ParambyName('Unit_Cost').asfloat := UnitCost;
    if vat = 0 then
      ParambyName('Vat').asinteger := 1
    else
      ParambyName('Vat').asinteger := Vat;
    ExecSQL;
  end;
  if Quote <> 0 then
    begin
      UpdateQuoteCustomer(Quote, parent.customer, parent.ContactNo, parent.customerName);          {change customer on quote}
      UpdateQuote(Quote, 24);          {status is confirmed order}
      UpdateQuoteVersions(Quote, 23);  {status is inactive but order raised}
    end;
end;

procedure TSOLine.UpdateDB;
begin
  with FParent.FDataModule.qrySOUpdLine do
  begin
    ParamByName('Sales_Order').AsInteger := FParent.DbKey;
    ParamByName('Sales_Order_Line_no').AsInteger := SOLNumber;

    Parambyname('Quantity').asfloat := Quantity;
    Parambyname('Cost_unit').asinteger := CostUnit;
    ParambyName('Delivery_Price').asfloat := DeliveryPrice;
    ParambyName('Description').asstring := Description;
    ParambyName('Discount_Value').asfloat := DiscountValue;
    ParambyName('Installation_Price').asfloat := InstallPrice;
    if Job = 0 then
      ParambyName('Job').clear
    else
      ParambyName('Job').asfloat := Job;
    if Quote = 0 then
      ParambyName('Quote').clear
    else
      ParambyName('Quote').asfloat := Quote;
    ParambyName('Markup_Value').asfloat := MarkupValue;
    ParambyName('Waste_Value').asfloat := WasteValue;

    ParambyName('Nett_Price').asfloat := NettPrice;
    ParambyName('Quantity_Allocated').asfloat := QtyAllocated;
    ParambyName('Quantity_Delivered').asfloat := QtyDelivered;
    ParambyName('Quantity_Invoiced').asfloat := QtyInvoiced;
    ParambyName('Sell_Unit').asinteger := SellUnit;
    if product = 0 then
      ParambyName('Product').clear
    else
      ParambyName('Product').asinteger := Product;
    ParambyName('Survey_Price').asfloat := SurveyPrice;
    ParambyName('Unit_Price').asfloat := UnitPrice;
    ParambyName('Unit_Cost').asfloat := UnitCost;
    if vat = 0 then
      ParambyName('Vat').asinteger := 1
    else
      ParambyName('Vat').asinteger := Vat;
    ExecSQL;
  end;
  if Quote <> 0 then
    begin
      UpdateQuoteCustomer(Quote, parent.customer, parent.ContactNo, parent.customerName);          {match customer and contact on quote}
    end;
  if Job <> 0 then
    begin
      UpdateJobCustomer(Job, parent.customer, parent.ContactNo, parent.customerName);          {match customer and contact on job}
    end;
end;

procedure TSOLine.SetCostUnit(const Value: integer);
begin
  FCostUnit := Value;
end;

procedure TSOLine.SetDeliveryPrice(const Value: currency);
begin
  FDeliveryPrice := Value;
end;

procedure TSOLine.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TSOLine.SetDiscountValue(const Value: currency);
begin
  FDiscountValue := Value;
end;

procedure TSOLine.SetInstallPrice(const Value: currency);
begin
  FInstallPrice := Value;
end;

procedure TSOLine.SetJob(const Value: double);
begin
  FJob := Value;
end;

procedure TSOLine.SetMode(const Value: string);
begin
  FMode := Value;
end;

procedure TSOLine.SetNettPrice(const Value: currency);
begin
  FNettPrice := Value;
end;

procedure TSOLine.SetParent(const Value: TSOrder);
begin
  FParent := Value;
end;

procedure TSOLine.SetProduct(const Value: integer);
begin
  FProduct := Value;
end;

procedure TSOLine.SetQtyAllocated(const Value: double);
begin
  FQtyAllocated := Value;
end;

procedure TSOLine.SetQtyDelivered(const Value: double);
begin
  FQtyDelivered := Value;
end;

procedure TSOLine.SetQtyInvoiced(const Value: double);
begin
  FQtyInvoiced := Value;
end;

procedure TSOLine.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TSOLine.SetQuote(const Value: integer);
begin
  FQuote := Value;
end;

procedure TSOLine.SetSellUnit(const Value: integer);
begin
  FSellUnit := Value;
end;

procedure TSOLine.SetSOLNumber(const Value: integer);
begin
  FSOLNumber := Value;
end;

procedure TSOLine.SetStockCode(const Value: string);
begin
  FStockCode := Value;
end;

procedure TSOLine.SetStockDescription(const Value: string);
begin
  FStockDescription := Value;
end;

procedure TSOLine.SetStockItem(const Value: integer);
begin
  FStockItem := Value;
end;

procedure TSOLine.SetSurveyPrice(const Value: currency);
begin
  FSurveyPrice := Value;
end;

procedure TSOLine.SetUnitCost(const Value: currency);
begin
  FUnitCost := Value;
end;

procedure TSOLine.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

procedure TSOLine.SetVat(const Value: integer);
begin
  FVat := Value;
end;

procedure TSOLine.SetVatRate(const Value: real);
begin
  FVatRate := Value;
end;

function TdtmdlSalesOrder.SetAddress(iAddress: integer; AddName, Street,
  AddLocale, Town, postcode, County, email, phone, AddType: string): integer;
begin
  if iAddress = 0 then
    begin
      with qryGetNextAdd do
        begin
          close;
          open;
          iAddress := fieldbyname('Last_Address').asinteger + 1;
        end;
      with qryAddAddress do
        begin
          close;
          parambyname('Address').asinteger := iAddress;
          parambyname('Address_Name').asstring := AddName + ' ';
          parambyname('Street').asstring := Street;
          parambyname('Locale').asstring := addlocale;
          parambyname('Town_City').asstring := Town;
          parambyname('Postcode').asstring := Postcode;
          parambyname('County_State').asstring := County;
          parambyname('Email_address').asstring := Email;
          parambyname('Telephone_number').asstring:= Phone;
          if AddType = 'I' then
            parambyname('Installation_Address').asstring := 'Y'
          else
            parambyname('Installation_Address').clear;
          execsql;
        end;
    end
  else
    begin
      with qryUpAddress do
        begin
          close;
          parambyname('Address').asinteger := iAddress;
          parambyname('Address_Name').asstring := AddName;
          parambyname('Street').asstring := Street;
          parambyname('Locale').asstring := addlocale;
          parambyname('Town_City').asstring := Town;
          parambyname('Postcode').asstring := Postcode;
          parambyname('County_State').asstring := County;
          parambyname('Email_address').asstring := Email;
          parambyname('Telephone_number').asstring := Phone;
          execsql;
        end;
    end;
  result := iAddress;
end;

procedure TdtmdlSalesOrder.SaveNarrative(var iNarrative: Integer;
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

function TdtmdlSalesOrder.GetNarrative(const iNarrative: integer): string;
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

function TdtmdlSalesOrder.getVatRate(tempCode: integer): double;
begin
  result := 0;
  with qryGetVat do
    begin
      close;
      parambyname('Vat').asinteger := tempCode;
      open;
      result := fieldbyname('Vat_Rate').asfloat;
    end;
end;

function TdtmdlSalesOrder.getVatDescription(tempCode: integer): string;
begin
  result := '';
  with qryGetVat do
    begin
      close;
      parambyname('Vat').asinteger := tempCode;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

procedure TdtmdlSalesOrder.RefreshQuoteData;
var
  icount: integer;
begin
  with qryCustQuotes do
    begin
      Close;
      parambyname('Customer').asinteger := customer;
      parambyname('Reference').asstring := '%' + Reference + '%';
      open;

      icount := recordcount;
    end;
end;

function TdtmdlSalesOrder.GetQuoteJob(tempQuote: real): integer;
begin
  with qryGetQuoteJob do
    begin
      close;
      parambyname('Quote').asfloat := tempQuote;
      open;

      result := fieldbyname('Job').asinteger;
    end;
end;

procedure TdtmdlSalesOrder.qryAllSalesStatus_TextGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (dtsAllSales.Dataset.fieldbyname('On_Hold').asstring = 'Y') then
    text := 'ON HOLD'
  else
    text := dtsAllSales.Dataset.fieldbyname('Sales_Order_Status_Desc').asstring;

end;

procedure TSOLine.DeleteFromDB;
begin
  with parent.FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Order_Line WHERE Sales_Order = ' + IntToStr(parent.DbKey) + ' AND Sales_Order_line_no = ' + inttostr(self.SOLNumber));
    ExecSQL;
  end;
end;

procedure TdtmdlSalesOrder.SetSOrderInactive(tempCode: integer);
begin
  with qrySetSOrderInactive do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      execsql;
    end;
end;

function TdtmdlSalesOrder.GetSOrderDetails(tempCode: integer): boolean;
begin
  result := false;
  with qryGetSOrderInvoices do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;
      result := (recordcount > 0);
    end;
end;

procedure TdtmdlSalesOrder.SetCustomerProspect(tempCode: integer);
begin
  with qryUpCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCode;
      execsql;
    end;
end;

procedure TSOLine.SetMarkupValue(const Value: currency);
begin
  FMarkupValue := Value;
end;

procedure TdtmdlSalesOrder.qryAllSalesTemplate_Date_NewGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qryAllSalesTemplate_Date.asdatetime = 0 then
    text := ''
  else
    text := padatestr(qryAllSalesTemplate_Date.asdatetime);

end;

procedure TdtmdlSalesOrder.qryAllSalesFitting_Date_NewGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qryAllSalesDate_Required.asdatetime = 0 then
    text := ''
  else
    text := padatestr(qryAllSalesDate_Required.asdatetime);

end;

function TdtmdlSalesOrder.GetFittingDate(tempCode: integer): TDateTime;
begin
  with qryGetSOHead do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;
      result := fieldbyname('Date_Required').asDateTime;
    end;
end;

function TdtmdlSalesOrder.GetTemplateDate(tempCode: integer): TDateTime;
begin
  with qryGetSOHead do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;
      result := fieldbyname('Template_Date').asDateTime;
    end;
end;

procedure TSOLine.SetWasteValue(const Value: currency);
begin
  FWasteValue := Value;
end;

procedure TSOLine.CopyQuote;
var
  aQuote: TQuote;
begin
  dtmdlCopyQuote := TdtmdlQuote.create(parent.FDataModule);

  try
    aQuote := TQuote.Create(dtmdlCopyQuote);
    try
      aQuote.DbKey := self.Quote;
      aQuote.qMode := qChange;
      aQuote.LoadFromDB;
      aQuote.QMode := qAdd;
      aQuote.dbkey := 0;
      aQuote.QDate := date;
      aQuote.DateRequired := date;
      aQuote.Operator := parent.Operator;
      aQuote.Status := 24; {Confirmed Sales Order}
      aQuote.SaveToDB(true);
      self.Quote := aQuote.dbKey;
    finally
      aQuote.free;
    end;
  finally
    dtmdlCopyQuote.Free;
  end;
end;

procedure TSOLine.SetPONumber(const Value: integer);
begin
  FPONumber := Value;
end;

procedure TSOLine.SetSINumber(const Value: string);
begin
  FSINumber := Value;
end;

procedure TSOLine.SetVatDescription(const Value: string);
begin
  FVatDescription := Value;
end;

procedure TSOLine.SetStockAllocationEndDate(const Value: TDateTime);
begin
  FStockAllocationEndDate := Value;
end;

procedure TSOLine.SetStockAllocationStartDate(const Value: TDateTime);
begin
  FStockAllocationStartDate := Value;
end;

{ TSOEvent }

function TSOEvent.Clone: TSOEvent;
begin
  Result := TSOEvent.Create(FParent);
  Result.EventNumber    :=           self.EventNumber;
  Result.DateEntered    :=           self.DateEntered;
  Result.operator       :=           Self.Operator;
  Result.OperatorName   :=           self.OperatorName;
  Result.Narrative      :=           Self.Narrative;
end;

constructor TSOEvent.Create(SOrder: TSOrder);
begin
  FParent := SOrder;
  FNarrative := TNotes.Create;
end;

destructor TSOEvent.Destroy;
begin
  FNarrative.Free;
  inherited;
end;

procedure TSOEvent.LoadFromDB;
begin
  with FParent.FDataModule.qrySOEvent do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := FParent.DbKey;
    ParamByName('Internal_Note').AsInteger := EventNumber;
    Open;
    DateEntered := FieldbyName('Date_Time_Entered').asdatetime;
    Narrative.dbkey := FieldbyName('Narrative').AsInteger;
    Operator := FieldbyName('Operator').asinteger;
    OperatorName := FieldbyName('Operator_Name').asstring;
    Close;
  end;
end;

procedure TSOEvent.SaveToDB;
begin
  Narrative.SavetoDB;
  with FParent.FDataModule.qrySOAddEvent do
  begin
    ParamByName('Sales_Order').AsInteger := FParent.DbKey;
    ParamByName('Internal_Note').AsInteger := EventNumber;
    ParamByName('Operator').asinteger := Operator;
    Parambyname('Date_Time_Entered').Asdatetime := DateEntered;
    Parambyname('Narrative').asinteger := Narrative.dbKey;
    ExecSQL;
  end;
end;

procedure TSOEvent.SetDateEntered(const Value: TDateTime);
begin
  FDateEntered := Value;
end;

procedure TSOEvent.SetEventNumber(const Value: integer);
begin
  FEventNumber := Value;
end;

procedure TSOEvent.SetNarrative(const Value: TNotes);
begin
  FNarrative := Value;
end;

procedure TSOEvent.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TSOEvent.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TSOEvent.SetParent(const Value: TSOrder);
begin
  FParent := Value;
end;

{ TSOEvents }

procedure TSOEvents.Add(aEvent: TSOEvent);
begin
  FItems.Add(aEvent);
end;

procedure TSOEvents.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSOEvent(FItems[i]).Free;
end;

function TSOEvents.Clone: TSOEvents;
var
  i : integer;
begin
  Result := TSOEvents.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TSOEvent(FItems[i]).Clone);
end;

constructor TSOEvents.Create(SOrder: TSOrder);
begin
  FParent := SOrder;
  FItems := TList.Create;
end;

procedure TSOEvents.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TSOEvents.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSOEvent(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TSOEvents.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TSOEvents.GetItems(Index: integer): TSOEvent;
begin
  Result := TSOEvent(FItems[Index]);
end;

function TSOEvents.IndexOf(const EventNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TSOEvent(FItems[i]).EventNumber = EventNo then
      Result := i;
end;

procedure TSOEvents.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSOEvent(FItems[i]).EventNumber:= (i+1);
end;

procedure TSOEvents.SetItems(Index: integer; const Value: TSOEvent);
begin
  FItems[Index] := Value;
end;

function TdtmdlSalesOrder.GetQuoteSlabSupplierCount(
  tempQuote: real): integer;
begin
  with qryQuoteSlabs do
    begin
      close;
      parambyname('Quote').asfloat := tempQuote;
      open;
      if recordcount = 1 then
        result := fieldbyname('Supplier').asinteger
      else
        result := 0;
    end;
end;

{ TSOPurchases }

procedure TSOPurchases.Add(aLine: TSOPurchase);
begin
  FItems.Add(aLine);
end;

procedure TSOPurchases.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSOPurchase(FItems[i]).Free;
end;

function TSOPurchases.Clone: TSOPurchases;
var
  i : integer;
begin
  Result := TSOPurchases.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TSOPurchase(FItems[i]).Clone);
end;

constructor TSOPurchases.Create(SOrder: TSOrder);
begin
  FParent := SOrder;
  FItems := TList.Create;

end;

procedure TSOPurchases.Delete(const Index: integer);
begin
  FItems.Delete(Index);

end;

destructor TSOPurchases.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSOPurchase(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TSOPurchases.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TSOPurchases.GetItems(Index: integer): TSOPurchase;
begin
  Result := TSOPurchase(FItems[Index]);
end;

function TSOPurchases.GetMaxLineNo: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].POLNumber > Result then
      Result := Items[i].POLNumber;
end;

function TSOPurchases.IndexOf(const LineNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TSOPurchase(FItems[i]).POLNumber = LineNo then
      Result := i;
end;

procedure TSOPurchases.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSOPurchase(FItems[i]).POLNumber:= (i+1);
end;

procedure TSOPurchases.SetItems(Index: integer; const Value: TSOPurchase);
begin
  FItems[Index] := Value;
end;

{ TSOPurchase }

function TSOPurchase.Clone: TSOPurchase;
begin
  Result := TSOPurchase.Create(FParent);
  Result.POLNumber      :=           self.POLNumber;
  Result.DateRaised     := self.DateRaised;
  Result.DateRequired   := self.DateRequired;
  Result.GRNNumber      := self.GRNNumber;
  Result.inactive       := self.inactive;
  Result.LineDescription:= self.LineDescription;
  Result.OfficeContact  := self.OfficeContact;
  Result.OfficeContactName := self.OfficeContactName;
  Result.OnHold         := self.OnHold;
  Result.Operator       := self.Operator;
  Result.OperatorName   := self.OperatorName;
  Result.POLineNumber   := self.POLineNumber;
  Result.PONumber       := self.PONumber;
  Result.POLNumber      := self.POLNumber;
  Result.Quantity       := self.Quantity;
  Result.SlabDescription   := self.SlabDescription;
  Result.SlabDepth      := self.SlabDepth;
  Result.SlabLength     := self.SlabLength;
  Result.Status         := self.Status;
  Result.StatusDescription := self.StatusDescription;
  Result.Supplier       := self.Supplier;
  Result.SupplierContact:= self.SupplierContact;
  Result.SupplierContactName:= self.SupplierContactName;
  Result.SupplierName   := self.SupplierName;
  Result.UnitCost       :=  self.UnitCost;
end;

constructor TSOPurchase.Create(SOrder: TSOrder);
begin
  FParent := SOrder;
end;

procedure TSOPurchase.DeleteFromDB;
begin

end;

destructor TSOPurchase.Destroy;
begin

  inherited;
end;

function TSOPurchase.GetTotalCost: currency;
begin
  result := UnitCost * Quantity;
end;

procedure TSOPurchase.LoadFromDB;
begin
end;

procedure TSOPurchase.SetDateRaised(const Value: TDateTime);
begin
  FDateRaised := Value;
end;

procedure TSOPurchase.SetDateRequired(const Value: TdateTime);
begin
  FDateRequired := Value;
end;

procedure TSOPurchase.SetGRNNumber(const Value: string);
begin
  FGRNNumber := Value;
end;

procedure TSOPurchase.Setinactive(const Value: boolean);
begin
  Finactive := Value;
end;

procedure TSOPurchase.SetLineDescription(const Value: string);
begin
  FLineDescription := Value;
end;

procedure TSOPurchase.SetOfficeContact(const Value: integer);
begin
  FOfficeContact := Value;
end;

procedure TSOPurchase.SetOfficeContactName(const Value: string);
begin
  FOfficeContactName := Value;
end;

procedure TSOPurchase.SetOnHold(const Value: boolean);
begin
  FOnHold := Value;
end;

procedure TSOPurchase.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TSOPurchase.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TSOPurchase.SetParent(const Value: TSOrder);
begin
  FParent := Value;
end;

procedure TSOPurchase.SetPOLineNumber(const Value: integer);
begin
  FPOLineNumber := Value;
end;

procedure TSOPurchase.SetPOLNumber(const Value: integer);
begin
  FPOLNumber := Value;
end;

procedure TSOPurchase.SetPONumber(const Value: integer);
begin
  FPONumber := Value;
end;

procedure TSOPurchase.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TSOPurchase.SetSlabDepth(const Value: integer);
begin
  FSlabDepth := Value;
end;

procedure TSOPurchase.SetSlabDescription(const Value: string);
begin
  FSlabDescription := Value;
end;

procedure TSOPurchase.SetSlabLength(const Value: integer);
begin
  FSlabLength := Value;
end;

procedure TSOPurchase.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TSOPurchase.SetStatusDescription(const Value: string);
begin
  FStatusDescription := Value;
end;

procedure TSOPurchase.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TSOPurchase.SetSupplierContact(const Value: integer);
begin
  FSupplierContact := Value;
end;

procedure TSOPurchase.SetSupplierContactName(const Value: string);
begin
  FSupplierContactName := Value;
end;

procedure TSOPurchase.SetSupplierName(const Value: string);
begin
  FSupplierName := Value;
end;

procedure TSOPurchase.SetUnitCost(const Value: currency);
begin
  FUnitCost := Value;
end;

function TdtmdlSalesOrder.GetCustomerContactNo(tempCode: integer; tempName: string): integer;
begin
  result := 0;
  with qryGetCustomerContact do
    begin
      close;
      parambyname('Customer').asinteger := tempCode;
      parambyname('Contact_Name').asstring := tempName;
      open;
      result := fieldbyname('Contact_no').asinteger;
    end;
end;

function TdtmdlSalesOrder.SalesOrderRequiresPurchasing(
  tempCode: integer): boolean;
begin
  result := false;
  with qryGetSOSlabs do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;
      result := (recordcount > 0);
    end;
end;

function TdtmdlSalesOrder.OutstandingPurchases(tempCode: integer): boolean;
begin
  result := false;
  with qryGetPurchases do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;
      result := (recordcount > 0);
    end;
end;

function TdtmdlSalesOrder.GetSalesOrderContactEmail(
  tempCode: integer): string;
begin
  result := '';
  with qryGetSOrderEmail do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;
      if fieldbyname('Contact_Email').asstring <> '' then
        result := fieldbyname('Contact_Email').asstring
      else
        result := fieldbyname('Email').asstring;
    end;
end;

function TdtmdlSalesOrder.GetSOrderQuoteNo(tempCode: integer): integer;
begin
  with qryGetSOLQuoteNo do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;
      result := fieldbyname('Quote').asinteger;
    end;
end;

procedure TdtmdlSalesOrder.SetTemplatingDocsReceived(tempCode: integer; TempStatus: string);
begin
  with qrySOUpTemplate do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Template_Docs_Returned').asstring := tempStatus;
      execsql;
    end;
end;

procedure TdtmdlSalesOrder.SetFittingDocsReceived(tempCode: integer; TempStatus: string);
begin
  with qrySOUpFitting do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Fitting_Docs_Returned').asstring := tempStatus;
      execsql;
    end;

  {Update any Remedial settings}
  with qrySOUpRemedial do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Completed').asstring := tempStatus;
      execsql;
    end;
end;

procedure TdtmdlSalesOrder.SetRemedialCompleted(tempCode: integer; TempStatus: string);
begin
  {Update any Remedial settings}
  with qrySOUpRemedial do
    begin
      close;

      if not dtmdlWorktops.IsSQL then
        begin
          SQL.Text := qrySOUpRemedial_Access.sql.text;
        end;

      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Completed').asstring := tempStatus;
      execsql;
    end;
end;

end.
