unit PBSalesInvoiceDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, CCSCommon, Math;

type
  TSIMode   = (siAdd, siChange, siDelete, siRaise, siView, siHeader);
  TSILMode   = (silAdd, silChange, silDelete, silView);
  TSICMode   = (sicAdd, sicChange, sicDelete, sicView);

  TdmSalesInvoice = class(TDataModule)
    dsDummy: TDataSource;
    qryPEnd: TQuery;
    qryPOUpLine: TQuery;
    qrySIHeader: TQuery;
    qrySIAllLines: TQuery;
    qrySILine: TQuery;
    qrySIAddLine: TQuery;
    qrySIGetLast: TQuery;
    qrySIAddHeader: TQuery;
    qryZero: TQuery;
    qrySICharges: TQuery;
    qrySIAddCharge: TQuery;
    qrySILineChgs: TQuery;
    qrySIAddLineChg: TQuery;
    qrySIAllCharges: TQuery;
    dsSIHeaderGrid: TDataSource;
    qrySIHeaderGrid: TQuery;
    qrySIHeaderGridInvoice_Date: TDateTimeField;
    qrySIHeaderGridCustomer: TIntegerField;
    qrySIHeaderGridBranch_no: TIntegerField;
    qrySIHeaderGridInactive: TStringField;
    qrySIHeaderGridInvoice_or_Credit: TStringField;
    qrySIHeaderGridCustomer_Name: TStringField;
    qrySIHeaderGridBranch_Name: TStringField;
    qrySIHeaderGridStatus_Description: TStringField;
    qrySIHeaderGridInv_to_Customer: TIntegerField;
    qrySIHeaderGridInv_to_Branch: TIntegerField;
    qrySIHeaderGridGoods_Value: TCurrencyField;
    qrySIHeaderGridVat_Value: TCurrencyField;
    qrySIHeaderGridSales_Invoice_no: TStringField;
    qrySIHeaderGridSales_invoice_status: TIntegerField;
    qrySIHeaderGridSales_Invoice: TIntegerField;
    qrySIHeaderGridInvoice_Status: TStringField;
    qrySIHeaderGridTotal_Value: TCurrencyField;
    qryOperator: TQuery;
    dsOperator: TDataSource;
    qryGetCustBranch: TQuery;
    qryGetPO: TQuery;
    qryGetSO: TQuery;
    qryGetJB: TQuery;
    qrySIUpHeader: TQuery;
    qryCustReps: TQuery;
    qrySIAllLineChgs: TQuery;
    qryGetVat: TQuery;
    qryGetPriceUnit: TQuery;
    qryCompany: TQuery;
    qryPOAllLines: TQuery;
    dsPOLine: TDataSource;
    qryPOAll: TQuery;
    qryPODeliv: TQuery;
    oldqryPOLine: TQuery;
    qryGetInvStatus: TQuery;
    qrySOAll: TQuery;
    dsSOAll: TDataSource;
    qryJBAll: TQuery;
    dsJBAll: TDataSource;
    qrySOHeader: TQuery;
    qrySOLines: TQuery;
    qryJBHeader: TQuery;
    qryJBLines: TQuery;
    qryGetPType: TQuery;
    qryPOChkStatus: TQuery;
    qryPOUpHead: TQuery;
    qrySOUpLine: TQuery;
    qrySOChkStatus: TQuery;
    qrySOUpHead: TQuery;
    qrySIHeaderGridSales_invoice_type: TStringField;
    qryJBUpLine: TQuery;
    qryRep: TQuery;
    dsRep: TDataSource;
    qryJBChkStatus: TQuery;
    qryJBUpHead: TQuery;
    qrySOLine: TQuery;
    qryJBLine: TQuery;
    qryPOLineChgs: TQuery;
    qryCustInvTo: TQuery;
    qrySIHeaderGridReference: TStringField;
    qryPOLine: TQuery;
    qryGetRep: TQuery;
    qrySIHeaderGridInvoice_Description: TStringField;
    qryJBLineChgs: TQuery;
    dsJBLines: TDataSource;
    qrySCHeaderGrid: TQuery;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    StringField6: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField7: TStringField;
    CurrencyField3: TCurrencyField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    dsSCHeaderGrid: TDataSource;
    qrySCHeaderGridGoods_Credit: TCurrencyField;
    qrySCHeaderGridVAT_Credit: TCurrencyField;
    qrySOChgs: TQuery;
    qrySOHead: TQuery;
    qryPO2bInvoiced: TQuery;
    qrySOAllSales_Order: TIntegerField;
    qrySOAllOffice_Contact: TIntegerField;
    qrySOAllOperator: TIntegerField;
    qrySOAllDate_Required: TDateTimeField;
    qrySOAllDate_Ordered: TDateTimeField;
    qrySOAllCust_Order_No: TStringField;
    qrySOAllCustomer: TIntegerField;
    qrySOAllBranch_no: TIntegerField;
    qrySOAllContact_no: TIntegerField;
    qrySOAllCost_Centre: TStringField;
    qrySOAllCustomer0: TIntegerField;
    qrySOAllOrder_Type: TStringField;
    qrySOAllSales_order_Head_Status: TIntegerField;
    qrySOAllNarrative: TIntegerField;
    qrySOAllPart_Store: TIntegerField;
    qrySOAllDelivery_Customer: TIntegerField;
    qrySOAllDelivery_Branch: TIntegerField;
    qrySOAllDiscount: TFloatField;
    qrySOAllAd_hoc_Address: TIntegerField;
    qrySOAllDelivery_Notes: TStringField;
    qrySOAllReplenish_Source: TIntegerField;
    qrySOAllSupplier: TIntegerField;
    qrySOAllBranch_no0: TIntegerField;
    qrySOAllSupp_order_type: TStringField;
    qrySOAllCustomer_Name: TStringField;
    qrySOAllBranch_Name: TStringField;
    qrySOAllPick_date: TDateTimeField;
    qrySOAllDelivery_date: TDateTimeField;
    qrySOAllActual_Delivery_Date: TDateField;
    qrySIHeaderGridfactoring_filename: TStringField;
    qrySIHeaderGridfactoring_date: TDateTimeField;
    qryPeriodEnd: TQuery;
    qrySOAll_Access: TQuery;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    StringField11: TStringField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    StringField12: TStringField;
    IntegerField13: TIntegerField;
    StringField13: TStringField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    FloatField1: TFloatField;
    IntegerField19: TIntegerField;
    StringField14: TStringField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    DateField1: TDateField;
    qrySCHeaderGridTotal_Credit: TCurrencyField;
    qryGetCustContact: TQuery;
    qryGetOperator: TQuery;
    qrySIHeaderGridpaid_status: TStringField;
    qrySIHeaderGridcash_sales: TStringField;
    qrySIHeaderGridPaid_status_Description: TStringField;
    qrySOLinePart: TQuery;
    qrySCHeaderGridpaid_status: TStringField;
    qrySCHeaderGridcash_sales: TStringField;
    qrySCHeaderGridPaid_Status_Description: TStringField;
    qrySIHeaderGridrep: TIntegerField;
    qrySIHeaderGridRep_Name: TStringField;
    qrySCHeaderGridrep: TIntegerField;
    qrySCHeaderGridRep_Name: TStringField;
    qrySpare: TQuery;
    qryCheckJB: TQuery;
    qryGetPOLine: TQuery;
    qryPOUpLineStatus: TQuery;
    qryGetJBLine: TQuery;
    qryJBUpLineStatus: TQuery;
    oldqryJBAll: TQuery;
    qryGetCust: TQuery;
    qrySOCheckJB: TQuery;
    qryInvoiceLoc: TQuery;
    dsInvoiceLoc: TDataSource;
    qryCheckJBPO: TQuery;
    qryGetInvoiceLoc: TQuery;
    qryGetDefaultInvLoc: TQuery;
    qryCustJBL: TQuery;
    dsCustJBL: TDataSource;
    qryGetCat: TQuery;
    qryGetJBInvLoc: TQuery;
    qryCreditReason: TQuery;
    dtsCreditReason: TDataSource;
    qrySIGetLastLine: TQuery;
    qryJBChkStockReq: TQuery;
    qrySIHeaderGridInvoice_Format: TStringField;
    qrySIHeaderGridElectronic_Invoice: TStringField;
    qryUpEInvoice: TQuery;
    qryJBHead: TQuery;
    qrySIUpStatus: TQuery;
    qrySCHeaderGridElectronic_Invoice: TStringField;
    qrySCHeaderGridInvoice_Format: TStringField;
    qrySIHeaderGridAccount_Code: TStringField;
    qrySCHeaderGridAccount_Code: TStringField;
    qryPOUpRep: TQuery;
    qryJBUpRep: TQuery;
    qrySODelRep: TQuery;
    qrySOUpRep: TQuery;
    qrySIAddDetail: TQuery;
    qrySIGetLastDetail: TQuery;
    qrySIAllDetails: TQuery;
    qrySOAllUninvoiced: TQuery;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    IntegerField25: TIntegerField;
    DateTimeField6: TDateTimeField;
    DateTimeField7: TDateTimeField;
    StringField18: TStringField;
    IntegerField26: TIntegerField;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    StringField19: TStringField;
    IntegerField29: TIntegerField;
    StringField20: TStringField;
    IntegerField30: TIntegerField;
    IntegerField31: TIntegerField;
    IntegerField32: TIntegerField;
    IntegerField33: TIntegerField;
    IntegerField34: TIntegerField;
    FloatField2: TFloatField;
    IntegerField35: TIntegerField;
    StringField21: TStringField;
    IntegerField36: TIntegerField;
    IntegerField37: TIntegerField;
    IntegerField38: TIntegerField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    DateTimeField8: TDateTimeField;
    DateTimeField9: TDateTimeField;
    DateField2: TDateField;
    qryPriceUnits: TQuery;
    dtsPriceUnits: TDataSource;
    qrySOUpdDelQty: TQuery;
    qrySOUnDoLines: TQuery;
    qryUpPaidStatus: TQuery;
    qrySCHeaderGridFactoring_Filename: TStringField;
    qrySCHeaderGridFactoring_Date: TDateTimeField;
    qrySubRep: TQuery;
    dsSubRep: TDataSource;
    qrySIHeaderGridSub_Rep_Name: TStringField;
    OldqrySIHeaderGrid: TQuery;
    DateTimeField10: TDateTimeField;
    IntegerField39: TIntegerField;
    IntegerField40: TIntegerField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    IntegerField41: TIntegerField;
    IntegerField42: TIntegerField;
    CurrencyField4: TCurrencyField;
    CurrencyField5: TCurrencyField;
    StringField30: TStringField;
    IntegerField43: TIntegerField;
    IntegerField44: TIntegerField;
    StringField31: TStringField;
    CurrencyField6: TCurrencyField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    DateTimeField11: TDateTimeField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    IntegerField45: TIntegerField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    qrySIHeaderGridEnd_User_Name: TStringField;
    qryCheckInvoice: TQuery;
    qrySIHeaderGridAlt_Sales_Invoice_no: TStringField;
    qrySCHeaderGridAlt_Sales_Invoice_no: TStringField;
    qrySIHeaderGridPack_Format_Description: TStringField;
    qrySIHeaderGridEnclosing_Type: TStringField;
    procedure qrySIHeaderGridCalcFields(DataSet: TDataSet);
    procedure qrySOAllCalcFields(DataSet: TDataSet);
    procedure qrySCHeaderGridCalcFields(DataSet: TDataSet);
  private
    FCustomerCode: integer;
    function GetCreditHeaderCount: integer;
    function GetCurrentCreditNote: integer;
    function GetCurrentSInvoice: integer;
    function GetHeaderCount: integer;
    function GetInvoiceLocation(sType: string): integer;
    function GetInvoiceStatus(tempcode: integer): string;
    procedure SetCustomerCode(const Value: integer);
  public
    bShowUninvoicedSO: boolean;
    iCustomer: integer;
    Operator: integer;
    Rep: integer;
    RepIsSubRep: boolean;
    Customer: string;
    CustomerName: string;
    Description: string;
    DisplayAllOrders: bytebool;
    DisplayArchived: bytebool;
    DisplayInactive: bytebool;
    DisplaySuppInvoiced: bytebool;
    DisplayUnFactored: bytebool;
    InvoiceDate: TDateTime;
    InvoiceQty: integer;
    JBNumber: integer;
    Line: integer;
    OrderNo: string;
    PaidStatus: string;
    PONumber: real;
    RepName: string;
    SubRepName: string;
    SONumber: integer;
    SortType: string;
    SortOrder: string;
    SInvoiceNumber: integer;
    Status: string;
    function CheckInvoiceUnique(tempInvoiceNo: string; tempInvoiceID: integer): boolean;
    function GetAccountCode(tempCust: integer; tempBranch: integer): string;
    function GetAccountCodeInactive(tempCust: integer): boolean;
    function GetCustomerAddress(tempCust: integer; tempBranch: integer): string;
    function GetCustomerTerms(tempCust: integer): string;
    function GetCustomerEInvoice(tempCust: integer): boolean;
    function GetCustomerOrderNo(SIType, SIReference: string): string;
    function GetNarrative(const iNarrative: integer): string;
    function GetNextSINumber: integer;
    function GetNextSILNumber(tempCode: integer): integer;
    function GetNextSIDNumber(tempCode: integer): integer;
    function GetNominaltype: string;
    function GetPTypeNominal(tempCode: integer): string;
    function GetPTypeCat(tempCode: integer): integer;
    function GetPTypeCatDesc(tempCode: integer): string;
    function GetPTypeCatNotes(tempCode: integer): integer;
    function GetPTypeDesc(tempCode: integer): string;
    function GetPTypeInvSep(tempCode: integer): boolean;
    function GetPTypeNotes(tempCode: integer): integer;
    function GetPUnitDescription(tempCode: integer): string;
    function GetPUnitFactor(tempCode: integer): integer;
    function GetDefPriceUnit: integer;
    function GetDefProductType: integer;
    function GetDefSalesNominal: string;
    function GetLastPeriodEndDate: TDateTime;
    function GetRepNominal(tempCode: integer): string;
    function GetSOLineOutQty(tempCode, tempLine: integer): integer;
    function GetSOLineSellPrice(tempcode, templine: integer): real;
    function GetSOPackQty(tempCode, tempLine: integer): integer;
    function GetSOPart(tempCode: integer; tempLine: integer): string;
    function GetPackQty(tempCode, tempLine: integer): integer;
    function GetPartPriceUnit(tempCode, tempLine: integer): integer;
    function GetPartProductType(tempCode, tempLine: integer): integer;
    function GetVATRate(tempCode: integer): real;
    function GetOperatorName(tempCode: integer): string;
    function IsSecurityUser: Boolean;
    property CurrentCreditNote : integer read GetCurrentCreditNote;
    property CurrentSInvoice : integer read GetCurrentSInvoice;
    procedure ListAllLines(const aKey : integer);
    procedure FreeCompanyRecord;
    function LockCompanyRecord: string;
    procedure RefreshCustomerData;
    procedure RefreshData;
    procedure RefreshCreditData;
    procedure RefreshCustJBData;
    procedure RefreshJBData;
    procedure RefreshJBLData;
    procedure RefreshPOData;
    procedure RefreshSOData;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    procedure UpDatePaidStatus(tmpInvoice: integer; tmpStatus: string; tmpAmount: real);
    property CreditHeaderCount: integer read GetCreditHeaderCount;
    property CustomerCode: integer read FCustomerCode write SetCustomerCode;
    property HeaderCount: integer read GetHeaderCount;
    function UsingSearch: boolean;
  end;

  TSalesInvoice     = class;

  TSalesInvoiceLineChgs  = class;

  TSalesInvoiceChg  = class
  private
    FAmount: currency;
    FSICharge: integer;
    FVATCode: integer;
    FNominal: string;
    FDetails: string;
    FParent: TSalesInvoice;
    FVATRate: real;
    FCost: currency;
    FSILine: integer;
    FAddChargeNo: integer;
    FPONumber: real;
    procedure SetAmount(const Value: currency);
    procedure SetNominal(const Value: string);
    procedure SetSICharge(const Value: integer);
    procedure SetVATCode(const Value: integer);
    procedure SetDetails(const Value: string);
    procedure SetParent(const Value: TSalesInvoice);
    procedure SetVATRate(const Value: real);
    procedure SetCost(const Value: currency);
    procedure SetSILine(const Value: integer);
    function GetVATAmount: currency;
    procedure SetAddChargeNo(const Value: integer);
    procedure SetPONumber(const Value: real);
  public
    constructor Create(SalesInvoice : TSalesInvoice);
    destructor Destroy; override;
    function Clone : TSalesInvoiceChg;
    procedure LoadFromDB;
    procedure SaveToDB;
    property AddChargeNo: integer read FAddChargeNo write SetAddChargeNo;
    property Amount: currency read FAmount write SetAmount;
    property Details: string read FDetails write SetDetails;
    property SILine: integer read FSILine write SetSILine;
    property Nominal: string read FNominal write SetNominal;
    property Parent: TSalesInvoice read FParent write SetParent;
    property PONumber: real read FPONumber write SetPONumber;
    property SICharge: integer read FSICharge write SetSICharge;
    property VATCode: integer read FVATCode write SetVATCode;
    property VATRate: real read FVATRate write SetVATRate;
    property VATAmount: currency read GetVATAmount;
    property Cost: currency read FCost write SetCost;
  end;

  TSalesInvoiceChgs  = class;

  TSalesInvoiceLine = class
  private
    FGoodsValue: double;
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
    FSalesInvoiceLineChgs: TSalesInvoiceLineChgs;
    FPriceUnitDescr: string;
    FPriceUnitFactor: integer;
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
    FDeleted: boolean;
    FCheckLine: boolean;
    FLineChecked: boolean;
    FInvoiceSeparately: boolean;
    FProductTypeCat: integer;
    FInactive: string;
    FOldSILine: integer;
    FIsChecked: boolean;
    FResellerPrice: currency;
    function GetTotalChargesGoods: currency;
    function GetTotalChargesVAT: currency;
    function GetTotalGoods: currency;
    function GetTotalReseller: currency;
    function GetJBDescription(tempCode: integer; tempLine: integer): string;
    function GetPartDescription(tempCode, tempLine: integer): string;
    function GetPartPriceUnit(tempCode, tempLine: integer): integer;
    function GetPODescription(tempCode: real; tempLine: integer): string;
    function GetPOLineOutQty(tempCode: real; tempLine: integer): integer;
    function GetSODescription(tempCode: integer; tempLine: integer): string;
    function GetSOLineDelQty(tempCode, tempLine: integer): integer;
    function GetSOLineOrdQty(tempCode, tempLine: integer): integer;
    function GetSOLineOutQty(tempCode: integer; tempLine: integer): integer;
    function GetSOLineSellPrice(tempCode, tempLine: integer): real;
    function GetSOPackQty(tempCode, tempLine: integer): integer;
    function GetJBLineOutQty(tempCode: integer; tempLine: integer): integer;
    function GetPackQty(tempCode, tempLine: integer): integer;
    procedure SetGoodsValue(const Value: double);
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
    procedure SetPriceUnitFactor(const Value: integer);
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
    function GetPartProductType(tempCode, tempLine: integer): integer;
    procedure SetDeleted(const Value: boolean);
    procedure SetLineChecked(const Value: boolean);
    procedure SetInvoiceSeparately(const Value: boolean);
    procedure SetProductTypeCat(const Value: integer);
    procedure SetInactive(const Value: string);
    procedure SetOldSILine(const Value: integer);
    procedure SetIsChecked(const Value: boolean);
    procedure SetResellerPrice(const Value: currency);
  public
    constructor Create(SalesInvoice : TSalesInvoice);
    destructor Destroy; override;
    function Clone : TSalesInvoiceLine;
    procedure LoadFromDB;
    procedure LoadLineCharges;
    procedure SaveToDB;
    procedure SaveToPO;
    procedure SaveToSO;
    procedure SaveToJB;
    procedure SaveJBRep;
    procedure SavePORep;
    procedure SaveSORep;
    procedure SaveDeletedQty;
    property Charges : TSalesInvoiceLineChgs read FSalesInvoiceLineChgs;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property CreditType: string read FCreditType write SetCreditType;
    property Deleted: boolean read FDeleted write SetDeleted;
    property Description: string read FDescription write SetDescription;
    property GoodsValue: double read FGoodsValue write SetGoodsValue;
    property Inactive: string read FInactive write SetInactive;
    property IntNarr: integer read FIntNarr write SetIntNarr;
    property IntNarrText: string read FIntNarrText write SetIntNarrText;
    property InvoiceSeparately: boolean read FInvoiceSeparately write SetInvoiceSeparately;
    property IsChecked: boolean read FIsChecked write SetIsChecked;
    property JBNumber: integer read FJBNumber write SetJBNumber;
    property JBLine: integer read FJBLine write SetJBLine;
    property LineChecked: boolean read FLineChecked write SetLineChecked;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property NotPrinted: string read FNotPrinted write SetNotPrinted;
    property Nominal: string read FNominal write SetNominal;
    property Parent: TSalesInvoice read FParent write SetParent;
    property PackQty: integer read FPackQty write SetPackQty;
    property PONumber: real read FPONumber write SetPONumber;
    property POLine: integer read FPOLine write SetPOLine;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDescr: string read FPriceUnitDescr write SetPriceUnitDescr;
    property PriceUnitFactor: integer read FPriceUnitFactor write SetPriceUnitFactor;
    property ProductType: integer read FProductType write SetProductType;
    property ProductTypeCat: integer read FProductTypeCat write SetProductTypeCat;
    property ProductTypeDesc: string read FProductTypeDesc write SetProductTypeDesc;
    property Quantity: real read FQuantity write SetQuantity;
    property QtyOutstanding: real read FQtyOutstanding write SetQtyOutstanding;
    property OriginalQty: real read FOriginalQty write SetOriginalQty;
    property OldSILine: integer read FOldSILine write SetOldSILine;
    property Reference: string read FReference write SetReference;
    property ResellerPrice: currency read FResellerPrice write SetResellerPrice;     {Unit Reseller Price}
    property SILine: integer read FSILine write SetSILine;
    property SOLine: integer read FSOLine write SetSOLine;
    property SONumber: integer read FSONumber write SetSONumber;
    property VatCode: integer read FVatCode write SetVatCode;
    property VATRate: real read FVATRate write SetVATRate;
    property VatValue: real read FVatValue write SetVatValue;
    property TotalChargesGoods: currency read GetTotalChargesGoods;
    property TotalChargesVAT: currency read GetTotalChargesVAT;
    property TotalGoods: currency read GetTotalGoods;
    property TotalReseller: currency read GetTotalReseller;
  end;

  TSalesInvoiceLines = class;

  TSalesInvoiceLineChg  = class
  private
    FParent: TSalesInvoiceLine;
    FAmount: currency;
    FSICharge: integer;
    FVAtCode: integer;
    FDetails: string;
    FNominal: string;
    FVATRate: real;
    procedure SetAmount(const Value: currency);
    procedure SetDetails(const Value: string);
    procedure SetNominal(const Value: string);
    procedure SetSICharge(const Value: integer);
    procedure SetVAtCode(const Value: integer);
    procedure SetVATRate(const Value: real);
  public
    constructor Create(SalesInvoiceLine: TSalesInvoiceLine);
    destructor Destroy; override;
    function Clone : TSalesInvoiceLineChg;
    procedure LoadFromDB;
    procedure SaveToDB;
    property Amount: currency read FAmount write SetAmount;
    property Details: string read FDetails write SetDetails;
    property Nominal: string read FNominal write SetNominal;
    property Parent: TSalesInvoiceLine read FParent;
    property SICharge: integer read FSICharge write SetSICharge;
    property VAtCode: integer read FVAtCode write SetVAtCode;
    property VATRate: real read FVATRate write SetVATRate;
  end;

  TSalesInvoiceLineChgs = class
  private
    FParent: TSalesInvoiceLine;
    FItems : TList;
    function GetCount: integer;
    function GetItems(Index: integer): TSalesInvoiceLineChg;
    procedure SetItems(Index: integer; const Value: TSalesInvoiceLineChg);
  public
    constructor Create(SalesInvoiceLine : TSalesInvoiceLine);
    destructor Destroy; override;
    procedure Add(aLine : TSalesInvoiceLineChg);
    procedure Clear;
    function  Clone : TSalesInvoiceLineChgs;
    procedure Delete(const Index : integer);
    function  IndexOf(const LineNumber: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TSalesInvoiceLineChg read GetItems write SetItems;
      default;
    property Parent : TSalesInvoiceLine read FParent;
  end;

  TSalesInvoiceChgs   = class
  private
    FParent: TSalesInvoice;
    FItems : TList;
    function GetCount: integer;
    function GetItems(Index: integer): TSalesInvoiceChg;
    procedure SetItems(Index: integer; const Value: TSalesInvoiceChg);
  public
    constructor Create(SalesInvoice : TSalesInvoice);
    destructor Destroy; override;
    procedure Add(aLine : TSalesInvoiceChg);
    procedure Clear;
    function  Clone : TSalesInvoiceChgs;
    procedure Delete(const Index : integer);
    function  IndexOf(const LineNumber: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TSalesInvoiceChg read GetItems write SetItems;
      default;
    property Parent : TSalesInvoice read FParent;
  end;

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

  TSalesInvoice       = class
  private
    FDataModule: TdmSalesInvoice;
    FPaidAmount: currency;
    FOperator: integer;
    FNarrative: integer;
    FInvToCustomer: integer;
    FCustomer: integer;
    FSalesInvoiceLines : TSalesInvoiceLines;
    FSIStatus: integer;
    FInvToBranch: integer;
    FCurrencyCode: integer;
    FBranch: integer;
    FdbKey: integer;
    FNarrativeText: string;
    FSIStatusDesc: string;
    FBranchName: string;
    FInvToBranchName: string;
    FSINumber: string;
    FCustomerName: string;
    FInvToCustomerName: string;
    FPaidStatus: string;
    FSIDate: TDateTime;
    FPaidDate: TDateTime;
    FInactive: string;
    FInvoiceOrCredit: string;
    FSIType: string;
    FPeriodEndRun: string;
    FSalesInvoiceChgs: TSalesInvoiceChgs;
    FAccountCode: string;
    FRep: integer;
    FReference: string;
    FInvoiceDescription: string;
    FIntNarrative: integer;
    FIntNarrativeText: string;
    FCashSale: boolean;
    FContact_no: integer;
    FContact_Name: string;
    FAccount_Number: string;
    FAccount_Year: string;
    FAccount_Month: string;
    FInvoiceLocation: integer;
    FCategory: integer;
    FCategoryDesc: string;
    FCreditReason: integer;
    FMode: TSIMode;
    FeInvoice: boolean;
    FClientAccountCode: string;
    FCustOrderNo: string;
    FDeliveryNote: boolean;
    FPriceUnit: integer;
    FPriceUnitFactor: integer;
    FQuantity: integer;
    FDateCreated: TDateTime;
    FSubRep: integer;
    FEndUserBranch: integer;
    FEndUserCustomer: integer;
    FEndUserCustomerName: string;
    FAcquiredCustomer: boolean;
    FAltInvoiceNumber: string;
    procedure DeleteCharges;
    procedure DeleteDetails;
    procedure DeleteLines;
    procedure DeleteLineCharges;
    procedure SaveCharges;
    procedure SaveCreditLines;
    procedure SaveLines;
    procedure SaveLineReps;
    procedure SetBranch(const Value: integer);
    procedure SetBranchName(const Value: string);
    procedure SetCurrencyCode(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetdbKey(const Value: integer);
    procedure SetInvToBranch(const Value: integer);
    procedure SetInvToBranchName(const Value: string);
    procedure SetInvToCustomer(const Value: integer);
    procedure SetInvToCustomerName(const Value: string);
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
    procedure SetPeriodEndRun(const Value: string);
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
    procedure SetAccount_Month(const Value: string);
    procedure SetAccount_Number(const Value: string);
    procedure SetAccount_Year(const Value: string);
    procedure SetCashSale(const Value: boolean);
    procedure SetContact_Name(const Value: string);
    procedure SetContact_no(const Value: integer);
    procedure SetInvoiceLocation(const Value: integer);
    procedure SetCategory(const Value: integer);
    procedure SetCategoryDesc(const Value: string);
    procedure SetCreditReason(const Value: integer);
    procedure SetMode(const Value: TSIMode);
    procedure SeteInvoice(const Value: boolean);
    procedure SetClientAccountCode(const Value: string);
    function GetOrderNumber: string;
    procedure SetCustOrderNo(const Value: string);
    procedure SetDeliveryNote(const Value: boolean);
    procedure SetPriceUnit(const Value: integer);
    function GetUnitSell: currency;
    procedure SetPriceUnitFactor(const Value: integer);
    procedure SetQuantity(const Value: integer);
    procedure SetDateCreated(const Value: TDateTime);
    procedure SetSubRep(const Value: integer);
    procedure SetEndUserBranch(const Value: integer);
    procedure SetEndUserCustomer(const Value: integer);
    procedure SetEndUserCustomerName(const Value: string);
    procedure SetAcquiredCustomer(const Value: boolean);
    procedure SetAltInvoiceNumber(const Value: string);
  public
    constructor Create(DataModule : TdmSalesInvoice);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TSalesInvoice;
    function InvoiceDetailsExist: boolean;
    procedure DeleteCreditFromDB;
    procedure DeleteFromDB;
    procedure LoadFromDB;
    procedure LoadCreditFromSI;
    procedure LoadCreditLinesFromSI;
    procedure LoadCreditChargesFromSI;
    procedure LoadFromPO;
    procedure LoadFromJB;
    procedure LoadFromSO;
    procedure LoadCharges;
    procedure LoadLines;
    procedure LoadJBLines;
    procedure LoadPOLines;
    procedure LoadPOLineCharges;
    procedure LoadJBLineCharges;
    procedure LoadSOLines;
    procedure LoadSOCharges;
    procedure SaveCredittoDB(TempAll: boolean);
    procedure SaveToDB(TempAll: boolean);
    procedure SaveEInvoice;
    procedure SaveEInvoiceStatus(const value: integer);
    procedure UndoDeletedLines;
    property AccountCode: string read FAccountCode write SetAccountCode;
    property AcquiredCustomer: boolean read FAcquiredCustomer write SetAcquiredCustomer;
    property AltInvoiceNumber: string read FAltInvoiceNumber write SetAltInvoiceNumber;
    property Branch: integer read FBranch write SetBranch;
    property BranchName: string read FBranchName write SetBranchName;
    property Category: integer read FCategory write SetCategory;
    property CategoryDesc: string read FCategoryDesc write SetCategoryDesc;
    property Charges : TSalesInvoiceChgs read FSalesInvoiceChgs;
    property ClientAccountCode: string read FClientAccountCode write SetClientAccountCode;
    property CreditReason: integer read FCreditReason write SetCreditReason;
    property CurrencyCode: integer read FCurrencyCode write SetCurrencyCode;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property CustOrderNo: string read FCustOrderNo write SetCustOrderNo;
    property DataModule: TdmSalesInvoice read FDataModule;
    property DateCreated: TDateTime read FDateCreated write SetDateCreated;
    property dbKey: integer read FdbKey write SetdbKey;
    property DeliveryNote: boolean read FDeliveryNote write SetDeliveryNote;
    property eInvoice: boolean read FeInvoice write SeteInvoice;
    property EndUserBranch: integer read FEndUserBranch write SetEndUserBranch;
    property EndUserCustomer: integer read FEndUserCustomer write SetEndUserCustomer;
    property EndUserCustomerName: string read FEndUserCustomerName write SetEndUserCustomerName;
    property Inactive: string read FInactive write SetInactive;
    property IntNarrative: integer read FIntNarrative write SetIntNarrative;
    property IntNarrativeText: string read FIntNarrativeText write SetIntNarrativeText;
    property InvoiceOrCredit: string read FInvoiceOrCredit write SetInvoiceOrCredit;
    property InvoiceLocation: integer read FInvoiceLocation write SetInvoiceLocation;
    property InvoiceDescription: string read FInvoiceDescription write SetInvoiceDescription;
    property InvToBranch: integer read FInvToBranch write SetInvToBranch;
    property InvToBranchName: string read FInvToBranchName write SetInvToBranchName;
    property InvToCustomer: integer read FInvToCustomer write SetInvToCustomer;
    property InvToCustomerName: string read FInvToCustomerName write SetInvToCustomerName;
    property Lines : TSalesInvoiceLines read FSalesInvoiceLines;
    property Mode: TSIMode read FMode write SetMode;
    property Multiplier: integer read GetMultiplier;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property OrderNumber: string read GetOrderNumber;
    property Operator: integer read FOperator write SetOperator;
    property PaidStatus: string read FPaidStatus write SetPaidStatus;
    property PaidAmount: currency read FPaidAmount write SetPaidAmount;
    property PaidDate: TDateTime read FPaidDate write SetPaidDate;
    property PeriodEndRun: string read FPeriodEndRun write SetPeriodEndRun;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitFactor : integer read FPriceUnitFactor write SetPriceUnitFactor;
    property Quantity: integer read FQuantity write SetQuantity;
    property Reference: string read FReference write SetReference;
    property Rep: integer read FRep write SetRep;
    property SIDate: TDateTime read FSIDate write SetSIDate;
    property SINumber: string read FSINumber write SetSINumber;
    property SIStatus: integer read FSIStatus write SetSIStatus;
    property SIStatusDesc: string read FSIStatusDesc write SetSIStatusDesc;
    property SIType: string read FSIType write SetSIType;
    property SubRep: integer read FSubRep write SetSubRep;
    property TotalGoods: currency read GetTotalGoods;
    property TotalVAT: currency read GetTotalVAT;
    property UnitSell : currency read GetUnitSell;
    property CashSale: boolean read FCashSale write SetCashSale;
    property Account_Number: string read FAccount_Number write SetAccount_Number;
    property Account_Month: string read FAccount_Month write SetAccount_Month;
    property Account_Year: string read FAccount_Year write SetAccount_Year;
    property Contact_no: integer read FContact_no write SetContact_no;
    property Contact_Name: string read FContact_Name write SetContact_Name;
  end;
var
  dmSalesInvoice: TdmSalesInvoice;

implementation

uses
  ComObj, ActiveX, pbMainMenu, PBAuditDM, PBNarrativeDM, PBDatabase;

const

  SOAllUninvoiced =
  'select Sales_Order.*, '+
  '        Customer.Name as Customer_Name, '+
  '        Customer_Branch.Name as Branch_Name, '+
	'(select TOP 1 Sales_order_delivery.Delivery_Date '+
	'from Sales_order_delivery '+
	'where Sales_order_delivery.Sales_Order = Sales_order.Sales_Order) as Pick_date, '+
	'(select distinct top 1 purch_ord_line.date_Deliv_actual '+
	'from purch_ord, purch_ord_line '+
	'where Purch_ord.Sales_order = Sales_Order.Sales_order and '+
	'(Purch_Ord.Purch_Ord = Purch_Ord_line.purch_ord)) as Delivery_date '+
  'from  Customer, Customer_Branch, '+
  '    Sales_Order '+
  'where '+
  '(Sales_Order.Order_Type <> ''J'') and  '+
  '(Customer.Name Like :Code_From) AND '+
  '(Sales_Order.Sales_Order_Head_Status >= 140) AND  '+
  '(Sales_Order.Sales_Order_Head_Status < 250) AND '+
  '(Sales_Order.Customer = Customer.Customer) And  '+
  '(  '+
  '(Sales_Order.Customer = Customer_Branch.Customer) AND '+
  '(Sales_Order.Branch_no = Customer_Branch.Branch_no) '+
  ') AND '+
  '((Sales_Order.inactive = ''N'') or (Sales_Order.inactive = '' '') or (Sales_Order.inactive = NULL)) '+
  'ORDER BY Sales_Order.Sales_Order desc ';

  SOAll =
  'select Sales_Order.*, '+
  '        Customer.Name as Customer_Name, '+
  '        Customer_Branch.Name as Branch_Name, '+
	'(select TOP 1 Sales_order_delivery.Delivery_Date '+
	'from Sales_order_delivery '+
	'where Sales_order_delivery.Sales_Order = Sales_order.Sales_Order) as Pick_date, '+
	'(select distinct top 1 purch_ord_line.date_Deliv_actual '+
	'from purch_ord, purch_ord_line '+
	'where Purch_ord.Sales_order = Sales_Order.Sales_order and '+
	'(Purch_Ord.Purch_Ord = Purch_Ord_line.purch_ord)) as Delivery_date '+
  'from  Customer, Customer_Branch, '+
  '    Sales_Order '+
  'where '+
  '(Sales_Order.Order_Type <> ''J'') and  '+
  '(Customer.Name Like :Code_From) AND '+
  '(Sales_Order.Sales_Order_Head_Status >= 140) AND  '+
  '(Sales_Order.Sales_Order_Head_Status < 250) AND '+
  '(Sales_Order.Customer = Customer.Customer) And  '+
  '(  '+
  '(Sales_Order.Customer = Customer_Branch.Customer) AND '+
  '(Sales_Order.Branch_no = Customer_Branch.Branch_no) '+
  ') AND '+
  '((Sales_Order.inactive = ''N'') or (Sales_Order.inactive = '' '') or (Sales_Order.inactive = NULL)) AND '+
  '(select SUM(Quantity_delivered - Quantity_invoiced) '+
  'from Sales_order_line '+
  'where sales_order_line.sales_order = Sales_order.sales_order) > 0 '+
  'ORDER BY Sales_Order.Sales_Order desc ';

  UpdateJBPOSQL =
  'UPDATE Job_Bag_Line_dets '+
  '      SET Job_Bag_Line_Invoiced = ''N'' '+
  'FROM Sales_Invoice_Line '+
  'WHERE Sales_Invoice_Line.Sales_Invoice = :Sales_Invoice and '+
  ' sales_invoice_line.job_bag = job_bag_line_dets.Job_Bag and '+
  ' sales_invoice_line.job_Bag_line = job_bag_line_dets.job_bag_line and '+
  ' sales_invoice_line.purchase_order is not NULL ';

  UpdateJBLinesSQL =
  'UPDATE Job_Bag_Line_dets '+
  '      SET Job_Bag_Line_Invoiced = ''N'' , Job_Bag_Line_dets.Qty_Invoiced = (Job_Bag_Line_dets.Qty_Invoiced - Sales_invoice_line.Qty_Invoiced) '+
  'FROM Sales_Invoice_Line '+
  'WHERE Sales_Invoice_Line.Sales_Invoice = :Sales_Invoice and '+
  ' sales_invoice_line.job_bag = job_bag_line_dets.Job_Bag and '+
  ' sales_invoice_line.job_Bag_line = job_bag_line_dets.job_bag_line and '+
  ' Job_bag_line_dets.Job_Bag_Line_type = ''A'' and '+
  ' sales_invoice_line.Job_Bag is not NULL ';

  UpdateSOLinesSQL =
  'UPDATE Sales_Order_Line '+
  'SET Quantity_Invoiced = (Quantity_Invoiced - ISNULL(Quantity_Deleted,0)), Quantity_Deleted = 0 '+
  'FROM Sales_Invoice_Line '+
  'WHERE Sales_Invoice_Line.Sales_Invoice = :Sales_Invoice AND '+
	'  ( '+
	'  (sales_invoice_line.Sales_Order = Sales_Order_line.Sales_Order) AND '+
	'  (sales_invoice_line.Sales_order_line_no = Sales_Order_line.Sales_Order_line_no) '+
	'  ) ';

  UpdateJBCreditLinesSQL =
  'UPDATE Job_Bag_Line_dets '+
  '      SET Job_Bag_Line_Invoiced = ''Y'' , Job_Bag_Line_dets.Qty_Invoiced = (Job_Bag_Line_dets.Qty_Invoiced - Sales_invoice_line.Qty_Invoiced) '+
  'FROM Sales_Invoice_Line '+
  'WHERE Sales_Invoice_Line.Sales_Invoice = :Sales_Invoice and '+
  ' sales_invoice_line.job_bag = job_bag_line_dets.Job_Bag and '+
  ' sales_invoice_line.job_Bag_line = job_bag_line_dets.job_bag_line and '+
  ' Job_bag_line_dets.Job_Bag_Line_type = ''A'' and '+
  ' sales_invoice_line.Job_Bag is not NULL ';

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
  FSalesInvoiceChgs.Clear;
end;

function TSalesInvoice.Clone: TSalesInvoice;
begin
  Result := TSalesInvoice.Create(FDataModule);
  Result.AccountCode :=         Self.AccountCode;
  Result.AcquiredCustomer :=    Self.AcquiredCustomer;
  Result.AltInvoiceNumber :=    self.AltInvoiceNumber;
  Result.Branch :=              Self.Branch;
  Result.BranchName :=          Self.BranchName;
  Result.Category :=            Self.Category;
  Result.CategoryDesc :=        Self.CategoryDesc;
  Result.ClientAccountCode :=   Self.ClientAccountCode;
  Result.CreditReason :=        Self.CreditReason;
  Result.CurrencyCode :=        Self.CurrencyCode;
  Result.Customer :=            Self.Customer;
  Result.CustomerName :=        Self.CustomerName;
  Result.CustOrderNo  :=        Self.CustOrderNo;
  Result.dbKey :=               Self.dbKey;
  Result.eInvoice :=            Self.eInvoice;
  Result.EndUserBranch  :=      self.EndUserBranch;
  Result.EndUserCustomer  :=    self.EndUserCustomer;
  Result.EndUserCustomerName := self.EndUserCustomerName;
  Result.DeliveryNote :=        Self.DeliveryNote;
  Result.Inactive :=            Self.Inactive;
  Result.IntNarrative :=        Self.IntNarrative;
  Result.IntNarrativeText :=    Self.IntNarrativeText;
  Result.InvoiceOrCredit :=     Self.InvoiceOrCredit;
  Result.InvoiceLocation :=     Self.InvoiceLocation;
  Result.InvoiceDescription :=  Self.InvoiceDescription;
  Result.InvToBranch :=         Self.InvToBranch;
  Result.InvToBranchName :=     Self.InvToBranchName;
  Result.InvToCustomer :=       Self.InvToCustomer;
  Result.InvToCustomerName :=   Self.InvToCustomerName;
  Result.Mode  :=               Self.Mode;
  Result.Narrative :=           Self.Narrative;
  Result.NarrativeText :=       Self.NarrativeText;
  Result.Operator :=            Self.Operator;
  Result.PaidStatus :=          Self.PaidStatus;
  Result.PaidAmount :=          Self.PaidAmount;
  Result.PaidDate :=            Self.PaidDate;
  Result.PeriodEndRun :=        Self.PeriodEndRun;
  Result.PriceUnit :=           Self.PriceUnit;
  Result.PriceUnitFactor :=     Self.PriceUnitFactor;
  Result.Quantity :=            Self.Quantity;
  Result.Reference :=           Self.Reference;
  Result.Rep :=                 Self.Rep;
  Result.SIDate :=              Self.SIDate;
  Result.SINumber :=            Self.SINumber;
  Result.SIStatus :=            Self.SIStatus;
  Result.SIStatusDesc :=        Self.SIStatusDesc;
  Result.SIType :=              Self.SIType;
  Result.SubRep :=              Self.SubRep;
  Result.FSalesInvoiceLines.Free;
  Result.FSalesInvoiceLines :=  Self.FSalesInvoiceLines.Clone;
  Result.FSalesInvoiceChgs.Free;
  Result.FSalesInvoiceChgs :=   Self.FSalesInvoiceChgs.Clone;
end;

constructor TSalesInvoice.Create(DataModule : TdmSalesInvoice);
begin
  FDataModule := DataModule;
  FSalesInvoiceLines := TSalesInvoiceLines.Create(Self);
  FSalesInvoiceChgs := TSalesInvoiceChgs.Create(Self);
end;

procedure TSalesInvoice.DeleteFromDB;
var
  i: integer;
begin
  DeleteDetails;
  DeleteCharges;
  DeleteLineCharges;
  DeleteLines;
  for i := 0 to Pred(FSalesInvoiceLines.Count) do
    begin
      if FSalesInvoiceLines[i].JBNumber <> 0 then
        FSalesInvoiceLines[i].SaveToJB
      else
      if FSalesInvoiceLines[i].PONumber <> 0 then
        FSalesInvoiceLines[i].SaveToPO
      else
      if FSalesInvoiceLines[i].SONumber <> 0 then
        FSalesInvoiceLines[i].SaveToSO;
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
  DeleteCharges;
  DeleteLineCharges;
  DeleteLines;
  for i := 0 to Pred(FSalesInvoiceLines.Count) do
    begin
      if fSalesInvoiceLines[i].CreditType <> 'Q' then
        continue;
      if FSalesInvoiceLines[i].JBNumber <> 0 then
        FSalesInvoiceLines[i].SaveToJB
      else
      if FSalesInvoiceLines[i].PONumber <> 0 then
        FSalesInvoiceLines[i].SaveToPO
      else
      if FSalesInvoiceLines[i].SONumber <> 0 then
        FSalesInvoiceLines[i].SaveToSO;
    end;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Invoice WHERE Sales_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSalesInvoice.DeleteCharges;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Invoice_Add_Charge WHERE Sales_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSalesInvoice.DeleteDetails;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Invoice_Detail WHERE Sales_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSalesInvoice.DeleteLines;
begin
  DeleteLineCharges;
  {Reset Job Bag Invoiced flag}
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.text := UpdateJBPOSQL;
    Parambyname('Sales_Invoice').asinteger := dbKey;
    ExecSQL;
  end;

  if self.InvoiceOrCredit = 'C' then
  begin
    with FDataModule.qryZero do
    begin
      SQL.Clear;
      SQL.text := UpdateJBCreditLinesSQL;
      Parambyname('Sales_Invoice').asinteger := dbKey;
      ExecSQL;
    end;
  end
  else
  begin
    {Reset Job Bag Invoiced flag}
    with FDataModule.qryZero do
    begin
      SQL.Clear;
      SQL.text := UpdateJBLinesSQL;
      Parambyname('Sales_Invoice').asinteger := dbKey;
      ExecSQL;
    end;
  end;

  {Update any sales_order which have been deleted}
  with FDataModule.qryZero do
    begin
      SQL.Clear;
      SQL.text := UpdateSOLinesSQL;
      Parambyname('Sales_Invoice').asinteger := dbKey;
      ExecSQL;
    end;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Invoice_Line WHERE Sales_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSalesInvoice.DeleteLineCharges;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Sales_Inv_Line_Add_Chg WHERE Sales_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

destructor TSalesInvoice.Destroy;
begin
  FSalesInvoiceLines.Free;
  FSalesInvoiceChgs.Free;
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
    AcquiredCustomer :=     (Fieldbyname('Customer_is_Acquired').asstring = 'Y');
    AltInvoiceNumber :=    FieldByName('Alt_Sales_Invoice_no').Asstring;
    Branch :=              FieldByName('Branch_No').AsInteger;
    BranchName :=          FieldByName('Branch_Name').Asstring;
    Category :=            FieldbyName('Category').asinteger;
    CategoryDesc :=        FieldbyName('Category_Description').asstring;
    ClientAccountCode :=   Fieldbyname('Client_Account_Code').asstring;
    CreditReason :=        FieldbyName('Credit_Note_Reason').asinteger;
    CurrencyCode :=        FieldByName('Currency_Code').AsInteger;
    Customer :=            FieldByName('Customer').AsInteger;
    CustomerName :=        FieldByName('Customer_Name').AsString;
    CustOrderNo  :=        FieldByName('Cust_Order_No').AsString;
    DateCreated :=         FieldByName('Date_Created').AsDateTime;

    EndUserCustomer :=      FieldByName('End_User_Customer').AsInteger;
    EndUserCustomerName := FieldByName('End_User_Customer_Name').Asstring;
    EndUserBranch :=        FieldByName('End_User_Branch_No').AsInteger;

    eInvoice :=            (Fieldbyname('Electronic_Invoice').AsString = 'Y');
    DeliveryNote :=        (Fieldbyname('Print_as_Delivery_Note').asstring = 'Y');
    Inactive :=            FieldByName('Inactive').Asstring;
    IntNarrative :=        FieldByName('Internal_Narrative').AsInteger;
    IntNarrativeText :=    dmSalesInvoice.GetNarrative(IntNarrative);
    InvoiceOrCredit :=     FieldByName('Invoice_or_Credit').Asstring;
    InvoiceLocation :=     FieldbyName('Invoice_Location').asinteger;
    InvoiceDescription :=  FieldByName('Invoice_Description').Asstring;
    InvToBranch :=         FieldByName('Inv_to_Branch').AsInteger;
    InvToBranchName :=     FieldByName('InvBranch_Name').Asstring;
    InvToCustomer :=       FieldByName('Inv_to_Customer').AsInteger;
    InvToCustomerName :=   FieldByName('InvCust_Name').Asstring;
    Narrative :=           FieldByName('Narrative').AsInteger;
    NarrativeText :=       dmSalesInvoice.GetNarrative(Narrative);
    Operator :=            FieldByName('Operator').AsInteger;
    PaidStatus :=          FieldByName('Paid_Status').Asstring;
    PaidAmount :=          FieldByName('Paid_Amount').Asfloat;
    PaidDate :=            FieldByName('Paid_Date').AsdateTime;
    PeriodEndRun :=        FieldByName('Period_end_run').Asstring;
    PriceUnit :=           Fieldbyname('Price_Unit').asinteger;
    Quantity :=            FieldbyName('Quantity').asinteger;
    Reference :=           FieldByName('Reference').asstring;
    Rep :=                 FieldByName('Rep').Asinteger;
    SIDate :=              FieldByName('Invoice_Date').Asdatetime;
    SINumber :=            FieldByName('Sales_invoice_no').Asstring;
    SIStatus :=            FieldByName('Sales_invoice_Status').AsInteger;
    SIStatusDesc :=        FieldByName('Sales_inv_Status_Desc').Asstring;
    SIType :=              FieldByName('Sales_invoice_type').Asstring;

    SubRep :=                 FieldByName('Sub_Rep').Asinteger;
    CashSale :=            FieldByName('Cash_Sales').AsBoolean;

    if CashSale then
    begin
      Account_Number := FieldByName('Account_Number').Asstring;
      Account_Month  := FieldByName('Account_Month').Asstring;
      Account_Year   := FieldByName('Account_Year').Asstring;
      Contact_No     := FieldByName('Contact_no').AsInteger;
      Contact_Name   := FieldByName('Contact_Name').Asstring;
    end;

    Close;
  end;
  LoadLines;
  LoadCharges;
end;

procedure TSalesInvoice.LoadFromPO;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qryPOLine do
  begin
    Close;
    ParamByName('Purchase_Order').Asfloat := dmSalesInvoice.PONumber;
    ParamByName('Line').Asinteger := dmSalesInvoice.Line;
    Open;
//    dbKey :=               0;
    AccountCode :=         FieldByName('Account_code').asstring;
    Branch :=              FieldByName('Branch_No').AsInteger;
    BranchName :=          FieldByName('Branch_Name').Asstring;
    CurrencyCode :=        FieldByName('Currency_Code_Def').AsInteger;
    Customer :=            FieldByName('Customer').AsInteger;
    CustomerName :=        FieldByName('Customer_Name').AsString;
    CustOrderNo :=         FieldByName('Cust_Order_No').asstring;
    eInvoice :=            (Fieldbyname('Electronic_Invoice_Required').AsString = 'Y');
    Inactive :=            '';
    IntNarrative :=        0;
    IntNarrativeText :=    '';
    InvoiceOrCredit :=     'I';
    InvoiceDescription :=  FieldByName('Customers_Desc').Asstring;
    InvToBranch :=         FieldByName('Inv_to_Branch').AsInteger;
    InvToBranchName :=     FieldByName('InvBranch_Name').Asstring;
    InvToCustomer :=       FieldByName('Inv_to_Customer').AsInteger;
    InvToCustomerName :=   FieldByName('InvCust_Name').Asstring;
    Narrative :=           0;
    NarrativeText :=       '';
(*    if dmBroker.UseNotesForTerms then
      begin
        NarrativeText :=       dmSalesInvoice.GetNarrative(dmBroker.GetCompanyPaymentNotes);

        if dmSalesInvoice.GetCustomerTerms(Customer) <> '' then
          NarrativeText :=       dmSalesInvoice.GetCustomerTerms(Customer);
      end;
*)
    Operator :=            frmPBMainMenu.iOperator;
    PaidStatus :=          '';
    PaidAmount :=          0.00;
    PaidDate :=            PBDateStr('');
    PeriodEndRun :=        '';
    Reference :=           floattostr(dmSalesInvoice.PONumber);
    Rep :=                 FieldByName('Rep').Asinteger;

    if dmBroker.UseSubReps then
      SubRep :=              dmBroker.GetCustomerSubRep(self.Customer, Self.Rep)
    else
      SubRep := 0;

    SIDate :=              dmSalesInvoice.InvoiceDate;
    SINumber :=            '<New Invoice>';
    SIStatus :=            10;
    SIStatusDesc :=        dmSalesInvoice.GetInvoiceStatus(10);
    SIType :=              '';
    InvoiceLocation :=     dmSalesInvoice.GetInvoiceLocation(SIType);
    CashSale :=            (FieldbyName('Cash_Sale').AsString = 'Y');
    if CashSale then
    begin
      //need to fetch the contact info account details
      Contact_No := FieldByName('Contact_No').asInteger;

      FDataModule.qryGetCustContact.close;
      FDataModule.qryGetCustContact.ParamByName('customer').asInteger := Customer;
      FDataModule.qryGetCustContact.ParamByName('branch_no').asInteger := Branch;
      FDataModule.qryGetCustContact.ParamByName('contact_no').asInteger := Contact_No;
      FDataModule.qryGetCustContact.open;

      if FDataModule.qryGetCustContact.RecordCount > 0 then
      begin
        Contact_Name := FDataModule.qryGetCustContact.FieldByName('contact_name').asString;
        Account_Number := FDataModule.qryGetCustContact.FieldByName('Account_Number').asString;
        Account_Month := FDataModule.qryGetCustContact.FieldByName('Account_Month').asString;
        Account_Year := FDataModule.qryGetCustContact.FieldByName('Account_Year').asString;

        if FDataModule.qryGetCustContact.FieldByName('Pays_Online').asString = 'Y' then
          begin
            PaidStatus :=          'Y';
            PaidAmount :=          0.00;
            PaidDate :=            date;
          end;
      end;
    end;
    Close;
  end;
  LoadPOLines;
  LoadPOLineCharges;

  {If no payment terms then get them from customer}
  if NarrativeText = '' then
    begin
      if dmBroker.UseNotesForTerms then
        begin
          NarrativeText :=       dmSalesInvoice.GetNarrative(dmBroker.GetCompanyPaymentNotes);

          if dmSalesInvoice.GetCustomerTerms(Customer) <> '' then
            NarrativeText :=       dmSalesInvoice.GetCustomerTerms(Customer);
        end;
    end;

end;

procedure TSalesInvoice.LoadFromSO;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qrySOHeader do
  begin
    Close;
    ParamByName('Sales_Order').Asinteger := dmSalesInvoice.SONumber;
    Open;
    dbKey :=               0;
    AccountCode :=         FieldByName('Account_code').asstring;
    Branch :=              FieldByName('Branch_No').AsInteger;
    BranchName :=          FieldByName('Branch_Name').Asstring;
    CurrencyCode :=        FieldByName('Currency_Code_Def').AsInteger;
    Customer :=            FieldByName('Customer').AsInteger;
    CustomerName :=        FieldByName('Customer_Name').AsString;
    CustOrderNo :=         FieldByName('Cust_Order_No').asstring;
    eInvoice :=            (Fieldbyname('Electronic_Invoice_Required').AsString = 'Y');
    Inactive :=            '';
    IntNarrative :=        0;
    IntNarrativeText :=    '';
    InvoiceOrCredit :=     'I';
    if Fieldbyname('Replenish_Source').asinteger = 1 then
      InvoiceDescription :=  'Stationery Sales Order'
    else
      InvoiceDescription :=  'Print Call Off';

    InvToBranch :=         FieldByName('Inv_to_Branch').AsInteger;
    InvToBranchName :=     FieldByName('InvBranch_Name').Asstring;
    InvToCustomer :=       FieldByName('Inv_to_Customer').AsInteger;
    InvToCustomerName :=   FieldByName('InvCust_Name').Asstring;
    Narrative :=           0;
    NarrativeText :=       '';
(*    if dmBroker.UseNotesForTerms then
      begin
        NarrativeText :=       dmSalesInvoice.GetNarrative(dmBroker.GetCompanyPaymentNotes);

        if dmSalesInvoice.GetCustomerTerms(Customer) <> '' then
          NarrativeText :=       dmSalesInvoice.GetCustomerTerms(Customer);
      end;
*)

    Operator :=            frmPBMainMenu.iOperator;
    PaidStatus :=          '';
    PaidAmount :=          0.00;
    PaidDate :=            PBDateStr('');
    PeriodEndRun :=        '';
    Reference :=           inttostr(dmSalesInvoice.SONumber);
    Rep :=                 FieldByName('Rep').Asinteger;

    if dmBroker.UseSubReps then
      SubRep :=              dmBroker.GetCustomerSubRep(self.Customer, Self.Rep)
    else
      SubRep := 0;

    SIDate :=              dmSalesInvoice.InvoiceDate;
    SINumber :=            '<New Invoice>';
    SIStatus :=            10;
    SIStatusDesc :=        dmSalesInvoice.GetInvoiceStatus(10);
    SIType :=              'S';
    InvoiceLocation :=     dmSalesInvoice.GetInvoiceLocation(SIType);
    CashSale :=            (FieldByName('Order_Type').asString = 'C') or (FieldbyName('Cash_Sales').AsString = 'Y');
    if CashSale then
    begin
      //need to fetch the contact info account details
      Contact_No := FieldByName('Contact_No').asInteger;

      FDataModule.qryGetCustContact.close;
      FDataModule.qryGetCustContact.ParamByName('customer').asInteger := Customer;
      FDataModule.qryGetCustContact.ParamByName('branch_no').asInteger := Branch;
      FDataModule.qryGetCustContact.ParamByName('contact_no').asInteger := Contact_No;
      FDataModule.qryGetCustContact.open;

      if FDataModule.qryGetCustContact.RecordCount > 0 then
      begin
        Contact_Name := FDataModule.qryGetCustContact.FieldByName('contact_name').asString;
        Account_Number := FDataModule.qryGetCustContact.FieldByName('Account_Number').asString;
        Account_Month := FDataModule.qryGetCustContact.FieldByName('Account_Month').asString;
        Account_Year := FDataModule.qryGetCustContact.FieldByName('Account_Year').asString;

        if FDataModule.qryGetCustContact.FieldByName('Pays_Online').asString = 'Y' then
          begin
            PaidStatus :=          'Y';
            PaidAmount :=          0.00;
            PaidDate :=            date;
          end;
      end;
    end;
    Close;
  end;
  LoadSOLines;
  LoadSOCharges;

  {If no payment terms then get them from customer}
  if NarrativeText = '' then
    begin
      if dmBroker.UseNotesForTerms then
        begin
          NarrativeText :=       dmSalesInvoice.GetNarrative(dmBroker.GetCompanyPaymentNotes);

          if dmSalesInvoice.GetCustomerTerms(Customer) <> '' then
            NarrativeText :=       dmSalesInvoice.GetCustomerTerms(Customer);
        end;
    end;

end;

procedure TSalesInvoice.LoadFromJB;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qryJBHeader do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger := dmSalesInvoice.JBNumber;
    Open;
    dbKey :=               0;
    AccountCode :=         FieldByName('Account_code').asstring;
    AcquiredCustomer :=     (Fieldbyname('Customer_is_Acquired').asstring = 'Y');
    Branch :=              FieldByName('Branch_No').AsInteger;
    BranchName :=          FieldByName('Branch_Name').Asstring;
    CurrencyCode :=        FieldByName('Currency_Code_Def').AsInteger;
    Customer :=            FieldByName('Customer').AsInteger;
    CustomerName :=        FieldByName('Customer_Name').AsString;
    CustOrderNo :=         FieldByName('Cust_Order_No').asstring;

    EndUserCustomer :=      FieldByName('End_User_Customer').AsInteger;
    EndUserCustomerName := FieldByName('End_User_Customer_Name').Asstring;
    EndUserBranch :=        FieldByName('End_User_Branch_No').AsInteger;

    eInvoice :=            (Fieldbyname('Electronic_Invoice_Required').AsString = 'Y');
    Inactive :=            '';
    IntNarrative :=        0;
    IntNarrativeText :=    '';
    InvoiceOrCredit :=     'I';
    InvoiceDescription :=  FieldByName('Job_Bag_Descr').Asstring;
    InvToBranch :=         FieldByName('Inv_to_Branch').AsInteger;
    InvToBranchName :=     FieldByName('InvBranch_Name').Asstring;
    InvToCustomer :=       FieldByName('Inv_to_Customer').AsInteger;
    InvToCustomerName :=   FieldByName('InvCust_Name').Asstring;
    Narrative :=           0;
    NarrativeText :=       '';
(*    if dmBroker.UseNotesForTerms then
      begin
        NarrativeText :=       dmSalesInvoice.GetNarrative(dmBroker.GetCompanyPaymentNotes);

        if dmSalesInvoice.GetCustomerTerms(Customer) <> '' then
          NarrativeText :=       dmSalesInvoice.GetCustomerTerms(Customer);
      end;
*)
    Operator :=            frmPBMainMenu.iOperator;
    PaidStatus :=          '';
    PaidAmount :=          0.00;
    PaidDate :=            PBDateStr('');
    PeriodEndRun :=        '';
    PriceUnit :=           fieldbyname('Price_Unit').asinteger;
    Quantity :=            fieldbyname('Quantity').asinteger;
    Reference :=           inttostr(dmSalesInvoice.JBNumber);
    Rep :=                 FieldByName('Rep').Asinteger;
    SubRep :=              FieldByName('Sub_Rep').Asinteger;

    if (SubRep = 0) then
      begin
        if dmBroker.UseSubReps then
          SubRep :=              dmBroker.GetCustomerSubRep(self.Customer, Self.Rep)
        else
          SubRep := 0;
      end;

    SIDate :=              dmSalesInvoice.InvoiceDate;
    SINumber :=            '<New Invoice>';
    SIStatus :=            10;
    SIStatusDesc :=        dmSalesInvoice.GetInvoiceStatus(10);
    SIType :=              'J';
    InvoiceLocation :=     FieldByName('Invoice_Location').AsInteger;
    CashSale :=            (FieldbyName('Cash_Sales').AsString = 'Y');
    if CashSale then
    begin
      //need to fetch the contact info account details
      Contact_No := FieldByName('Contact_No').asInteger;

      FDataModule.qryGetCustContact.close;
      FDataModule.qryGetCustContact.ParamByName('customer').asInteger := Customer;
      FDataModule.qryGetCustContact.ParamByName('branch_no').asInteger := Branch;
      FDataModule.qryGetCustContact.ParamByName('contact_no').asInteger := Contact_No;
      FDataModule.qryGetCustContact.open;

      if FDataModule.qryGetCustContact.RecordCount > 0 then
      begin
        Contact_Name := FDataModule.qryGetCustContact.FieldByName('contact_name').asString;
        Account_Number := FDataModule.qryGetCustContact.FieldByName('Account_Number').asString;
        Account_Month := FDataModule.qryGetCustContact.FieldByName('Account_Month').asString;
        Account_Year := FDataModule.qryGetCustContact.FieldByName('Account_Year').asString;

        if FDataModule.qryGetCustContact.FieldByName('Pays_Online').asString = 'Y' then
          begin
            PaidStatus :=          'Y';
            PaidAmount :=          0.00;
            PaidDate :=            date;
          end;
      end;
    end;
    Close;
  end;
  LoadJBLines;
  LoadJBLineCharges;

  {If no payment terms then get them from customer}
  if NarrativeText = '' then
    begin
      if dmBroker.UseNotesForTerms then
        begin
          NarrativeText :=       dmSalesInvoice.GetNarrative(dmBroker.GetCompanyPaymentNotes);

          if dmSalesInvoice.GetCustomerTerms(Customer) <> '' then
            NarrativeText :=       dmSalesInvoice.GetCustomerTerms(Customer);
        end;
    end;

end;

procedure TSalesInvoice.LoadJBLines;
var
  aLine : TsalesInvoiceLine;
  sellPrice: real;
  PackSize: integer;
begin
  FsalesInvoiceLines.Clear;
  with FDataModule.qryJBLines do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger := dmSalesInvoice.JBNumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceLine.Create(Self);
      aLine.SILine := aLine.Parent.Lines.Count + 1;
      aLine.OldSILine := aLine.SILine;
      aLine.CreditType := '';
      aLine.Description := fieldbyname('Job_Bag_Line_Descr').asstring;
      aLine.PONumber := FieldByName('Purchase_Order').Asfloat;
      aLine.POLine := FieldByName('Line').Asinteger;
      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatValue := 0.00;
      if fieldbyname('Ready_to_invoice').asstring = 'Y' then
        aLine.Inactive := 'N'
      else
        aLine.Inactive := 'Y';

      aLine.ProductType := FieldByName('Product_Type').Asinteger;
      if aLine.ProductType = 0 then
        aLine.ProductType := Fieldbyname('JB_Product_Type').AsInteger;
      aLine.SONumber := FieldByName('Sales_Order').Asinteger;
      aLine.SOLine := FieldByName('Sales_Order_line_no').Asinteger;
      aLine.PackQty := aLine.GetPackQty(aLine.SONumber, aLine.SOLine);

      if (fieldbyname('sell_unit').asstring = '') and (aLine.SONumber <> 0) then    {this line must be a sales order call off line}
        begin
        aLine.PriceUnit := aLine.GetPartPriceUnit(aLine.SONumber, aLine.SOLine);
        if aLine.PriceUnit = 0 then
          aLine.PriceUnit := 1;       {If no price unit exists then set to default of 'per 1000'}
        aLine.PriceUnitDescr := dmSalesInvoice.GetPUnitDescription(aLine.PriceUnit);
        aLine.PriceUnitFactor := dmSalesInvoice.GetPUnitFactor(aLine.PriceUnit);
        aLine.Quantity := aLine.GetSOLineOutQty(aLine.SONumber,aLine.SOLine);
        aLine.OriginalQty := 0;
        aLine.QtyOutstanding := aLine.GetSOLineOutQty(aLine.SONumber,aLine.SOLine);
        SellPrice := aLine.GetSOLineSellPrice(aLine.SONumber,aLine.SOLine);
        PackSize  := aLine.GetSOPackQty(aLine.SONumber, aLine.SOLine);
        if aLine.PriceUnitFactor = 0 then
          aLine.GoodsValue := SellPrice
        else
          aLine.GoodsValue := (SellPrice/PackSize) * aLine.PriceUnitFactor;
//        aLine.Description := aLine.GetPartDescription(aLine.SONumber,aLine.SOLine);
        aLine.ResellerPrice := aLine.GoodsValue;
        aLine.ProductType := aLine.GetPartProductType(aLine.SONumber,aLine.SOLine);
        end
      else
      if (fieldbyname('price_unit').asinteger <> 0) then
        begin
        aLine.PriceUnit := fieldbyname('price_unit').asinteger;
        aLine.PriceUnitDescr := dmSalesInvoice.GetPUnitDescription(aLine.PriceUnit);
        aLine.PriceUnitFactor := dmSalesInvoice.GetPUnitFactor(aLine.PriceUnit);
        aLine.Quantity := Fieldbyname('JB_Qty_To_Invoice').asinteger;
        aLine.OriginalQty := 0;
        aLine.QtyOutstanding := Fieldbyname('JB_Qty_To_Invoice').asinteger;
        aLine.GoodsValue := (fieldbyname('unit_price').asfloat) ;
        aLine.ResellerPrice := (fieldbyname('Reseller_price').asfloat)
        end
      else
      if (fieldbyname('sell_unit').asstring = '') then
        begin
        aLine.PriceUnit := dmSalesInvoice.GetDefPriceUnit;
        aLine.PriceUnitDescr := dmSalesInvoice.GetPUnitDescription(aLine.PriceUnit);
        aLine.PriceUnitFactor := dmSalesInvoice.GetPUnitFactor(aLine.PriceUnit);
        aLine.Quantity := Fieldbyname('Job_Bag_Quantity').asinteger;
        aLine.OriginalQty := 0;
        aLine.QtyOutstanding := Fieldbyname('Job_Bag_Quantity').asinteger;
        aLine.GoodsValue := (fieldbyname('Job_Bag_line_Sell').asfloat);
        aLine.ResellerPrice := (fieldbyname('Job_Bag_line_Reseller').asfloat)
        end
      else
        begin
        aLine.PriceUnit := FieldByName('Sell_Unit').Asinteger;
        aLine.PriceUnitDescr := dmSalesInvoice.GetPUnitDescription(aLine.PriceUnit);
        aLine.PriceUnitFactor := dmSalesInvoice.GetPUnitFactor(aLine.PriceUnit);

        aLine.Quantity := Fieldbyname('Invoice_Qty').asinteger;
        aLine.QtyOutstanding := Fieldbyname('Invoice_Qty').asinteger;

(*
        if fieldbyname('Qty_Delivered').asinteger = 0 then
          begin
            aLine.Quantity := Fieldbyname('Invoice_Qty').asinteger;
            aLine.QtyOutstanding := Fieldbyname('Invoice_Qty').asinteger;
          end
        else
          begin
            aLine.Quantity := (Fieldbyname('Qty_Delivered').asinteger - fieldbyname('Qty_Invoiced').asinteger);
            aLine.QtyOutstanding := (Fieldbyname('Qty_Delivered').asinteger - fieldbyname('Qty_Invoiced').asinteger);
          end;
*)
        aLine.OriginalQty := 0;
        aLine.GoodsValue := FieldByName('Selling_Price').Asfloat;
        aLine.ResellerPrice := FieldByName('Reseller_Price').Asfloat ;
        end;

      if aLine.ProductType = 0 then
        aLine.ProductType := dmSalesInvoice.GetDefProductType;

      aLine.ProductTypeDesc := aLine.parent.datamodule.GetPTypeDesc(aLine.ProductType);

      if aLine.ProductType = 0 then
        aLine.Nominal := dmSalesInvoice.GetDefSalesNominal
      else
        begin
          if dmSalesInvoice.GetNominalType = 'COMPANY' then
            aLine.Nominal := dmSalesInvoice.GetDefSalesNominal
          else
          if dmSalesInvoice.GetNominalType = 'REP' then
            aLine.Nominal := dmSalesInvoice.GetRepNominal(FieldByName('Rep').Asinteger)
          else
            aLine.Nominal := dmSalesInvoice.GetPTypeNominal(aLine.ProductType);
        end;

      aLine.JBNumber := FieldByName('Job_Bag').Asinteger;
      aLine.JBLine := FieldByName('Job_Bag_Line').Asinteger;
      aLine.Narrative := 0;
      aLine.NarrativeText := '';
      aLine.NotPrinted := 'N';
      aLine.Reference := '';
      aLine.IntNarr := 0;
      aLine.IntNarrText := '';
      aLine.ProductTypeCat := aLine.parent.datamodule.GetPTypeCat(aLine.ProductType);
      aLine.InvoiceSeparately := aLine.parent.datamodule.GetPTypeInvSep(aLine.ProductType);

      // If invoicing separately then set the category
      if (aLine.InvoiceSeparately) and (aLine.parent.Category = 0) then
        begin
          aLine.parent.Category := aLine.ProductTypeCat;
          aLine.parent.CategoryDesc := aLine.parent.datamodule.GetPTypeCatDesc(aLine.ProductType);
//          aLine.parent.CashSale := true;
          aLine.parent.NarrativeText := dmSalesInvoice.GetNarrative(aLine.parent.datamodule.GetPTypeCatNotes(aLine.parent.Category));
        end;

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
    ParamByName('Purchase_Order').Asfloat := dmSalesInvoice.PONumber;
    ParamByName('Line').Asinteger := dmSalesInvoice.Line;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceLine.Create(Self);
      aLine.SILine := aLine.Parent.Lines.Count + 1;
      aLine.OldSILine := aLine.SILine;
      aLine.CreditType := '';
      aLine.Description := fieldbyname('Customers_Desc').asstring;
      aLine.PONumber := FieldByName('Purchase_order').Asfloat;
      aLine.POLine := FieldByName('Line').Asinteger;
      aLine.Inactive := 'N';
      aLine.Quantity := dmSalesInvoice.InvoiceQty;
      aLine.OriginalQty := 0;
      aLine.QtyOutstanding := FieldByName('Qty_Outstanding').Asinteger;
      aLine.GoodsValue := FieldByName('Selling_Price').Asfloat;
      aLine.ResellerPrice := aLine.GoodsValue;
      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatValue := 0.00;
      aLine.PackQty := 0;
      aLine.ProductType := FieldByName('Product_Type').Asinteger;
      aLine.ProductTypeDesc := aLine.parent.datamodule.GetPTypeDesc(aLine.ProductType);
      aLine.PriceUnit := FieldByName('Sell_Unit').Asinteger;
      aLine.PriceUnitDescr := FieldByName('Price_Unit_Description').AsString;
      aLine.PriceUnitFactor := FieldByName('Price_Unit_Factor').Asinteger;
      if dmSalesInvoice.GetNominalType = 'COMPANY' then
        aLine.Nominal := dmSalesInvoice.GetDefSalesNominal
      else
      if dmSalesInvoice.GetNominalType = 'REP' then
        aLine.Nominal := dmSalesInvoice.GetRepNominal(FieldByName('Rep').Asinteger)
      else
        aLine.Nominal := FieldByName('Nominal').AsString;

      if trim(aLine.Nominal) = '' then
        aLine.Nominal := dmSalesInvoice.GetDefSalesNominal;

      aLine.JBNumber := FieldByName('job_bag').asInteger;
      aLine.JBLine := FieldByName('Job_Bag_Line').asInteger;
      aLine.Narrative := 0;
      aLine.NarrativeText := '';
      aLine.NotPrinted := 'N';
      aLine.Reference := '';
      aLine.IntNarr := 0;
      aLine.IntNarrText := '';
      aLine.SONumber := 0;
      aLine.SOLine := 0;

      aLine.InvoiceSeparately := aLine.parent.datamodule.GetPTypeInvSep(aLine.ProductType);
      aLine.ProductTypeCat := aLine.parent.datamodule.GetPTypeCat(aLine.ProductType);

      // If invoicing separately then set the category
      if (aLine.InvoiceSeparately) and (aLine.parent.Category = 0) then
        begin
          aLine.parent.Category := aLine.ProductTypeCat;
          aLine.parent.CategoryDesc := aLine.parent.datamodule.GetPTypeCatDesc(aLine.ProductType);
//          aLine.parent.CashSale := true;
          aLine.parent.NarrativeText := dmSalesInvoice.GetNarrative(aLine.parent.datamodule.GetPTypeCatNotes(aLine.parent.Category));
        end;

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
    ParamByName('Sales_Order').Asfloat := dmSalesInvoice.SONumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceLine.Create(Self);
      aLine.SILine := aLine.Parent.Lines.Count + 1;
      aLine.OldSILine := aLine.SILine;
      aLine.CreditType := '';
      aLine.Description := fieldbyname('Part').asstring + ' - ' + fieldbyname('Part_Description').asstring;
      aLine.PONumber := 0;
      aLine.POLine := 0;
      aLine.Inactive := 'N';
      aLine.Quantity := Fieldbyname('Invoice_qty').asinteger;
      aLine.OriginalQty := 0;
      aLine.QtyOutstanding := Fieldbyname('Invoice_qty').asinteger;
      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatValue := 0.00;
      aLine.ProductType := FieldByName('Product_Type').asinteger;
      if aLine.ProductType = 0 then
        aLine.ProductType := dmSalesInvoice.GetDefProductType;
      aLine.ProductTypeDesc := aLine.parent.datamodule.GetPTypeDesc(aLine.ProductType);
      if fieldbyname('Price_unit').asstring = '' then
        begin
        aLine.PriceUnit := dmSalesInvoice.GetDefPriceUnit;
        aLine.PriceUnitDescr := dmSalesInvoice.GetPUnitDescription(aLine.PriceUnit);
        aLine.PriceUnitFactor := dmSalesInvoice.GetPUnitFactor(aLine.PriceUnit);
        end
      else
        begin
        aLine.PriceUnit := FieldByName('Price_Unit').Asinteger;
        aLine.PriceUnitDescr := FieldByName('Price_Unit_Description').AsString;
        aLine.PriceUnitFactor := FieldByName('Price_Unit_Factor').Asinteger;
        end;

      if aLine.PriceUnitFactor = 0 then
        aLine.GoodsValue := FieldByName('Part_Sales_Price').Asfloat
      else

        aLine.GoodsValue := (FieldByName('Part_Sales_Price').Asfloat/fieldbyname('Sell_pack_Quantity').asinteger)
                            * aLine.PriceUnitFactor;
      aLine.ResellerPrice := aLine.GoodsValue;
      if fieldbyname('Sales_Nominal').asstring = '' then
        aLine.Nominal := dmSalesInvoice.GetDefSalesNominal
      else
        aLine.Nominal := fieldbyname('Sales_Nominal').asstring;

      aLine.JBNumber := 0;
      aLine.JBLine := 0;
      aLine.Narrative := 0;
      aLine.NarrativeText := '';
      aLine.NotPrinted := 'N';
      aLine.Reference := '';
      aLine.IntNarr := 0;
      aLine.IntNarrText := '';
      aLine.SONumber := fieldbyname('Sales_order').asinteger;
      aLine.SOLine := fieldbyname('Sales_order_line_no').asinteger;
      aLine.PackQty := aLine.GetPackQty(aLine.SONumber,aLine.SOLine);

      aLine.InvoiceSeparately := aLine.parent.datamodule.GetPTypeInvSep(aLine.ProductType);
      aLine.ProductTypeCat := aLine.parent.datamodule.GetPTypeCat(aLine.ProductType);

      // If invoicing separately then set the category
      if (aLine.InvoiceSeparately) and (aLine.parent.Category = 0) then
        begin
          aLine.parent.Category := aLine.ProductTypeCat;
          aLine.parent.CategoryDesc := aLine.parent.datamodule.GetPTypeCatDesc(aLine.ProductType);
//          aLine.parent.CashSale := true;
          aLine.parent.NarrativeText := dmSalesInvoice.GetNarrative(aLine.parent.datamodule.GetPTypeCatNotes(aLine.parent.Category));
        end;

      FSalesInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoice.LoadCharges;
var
  aLine : TsalesInvoiceChg;
begin
  FSalesInvoiceChgs.Clear;
  with FDataModule.qrySIAllCharges do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceChg.Create(Self);
      aLine.SICharge := fieldbyname('Additional_Charge').asinteger;
      aLine.Details := fieldbyname('Details').asstring;
      aLine.Amount := fieldbyname('Amount').asfloat * Multiplier;
      aLine.Nominal := FieldByName('Nominal').AsString;
      aLine.VATCode := fieldbyname('Vat_Code').asinteger;
      aLine.VATRate := fieldbyname('Vat_Rate').asfloat;
      aLine.SILine := FieldbyName('Invoice_Line_no').asinteger;
      aLine.Cost := fieldByName('cost_price').asFloat * Multiplier;
      aLine.PONumber := fieldbyname('Purchase_Order').asfloat;
      aLine.AddChargeNo := fieldbyname('Additional_Charge').asinteger;
      FSalesInvoiceChgs.Add(aLine);
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
      aLine.OldSILine := aLine.SILine;
      aLine.PONumber := FieldByName('Purchase_order').Asfloat;
      aLine.POLine := FieldByName('Line').Asinteger;
      aLine.Inactive := 'N';
      aLine.JBNumber := FieldByName('Job_Bag').Asinteger;
      aLine.JBLine := FieldByName('Job_Bag_Line').Asinteger;
      aLine.SONumber := FieldByName('Sales_Order').Asinteger;
      aLine.SOLine := FieldByName('Sales_Order_Line_no').Asinteger;
      aLine.CreditType := FieldByName('Credit_Type').Asstring;
      aLine.Quantity := FieldByName('Qty_Invoiced').Asfloat * Multiplier;
      aLine.OriginalQty := FieldByName('Qty_Invoiced').Asfloat * Multiplier;
      if aLine.JBNumber <> 0 then
        begin
        aLine.QtyOutstanding := aLine.GetJBLineOutQty(aLine.JBNumber, aLine.JBLine);
        aLine.Description := aLine.GetJBDescription(aLine.JBNumber, aLine.JBLine);
        aLine.PackQty := 0;
//        aLine.parent.Reference := inttostr(aLine.JBNumber);
        end
      else
      if aLine.PONumber <> 0 then
        begin
        aLine.QtyOutstanding := aLine.GetPOLineOutQty(aLine.PONumber, aLine.POLine);
        aLine.Description := aLine.GetPODescription(aLine.PONumber, aLine.POLine);
        aLine.PackQty := 0;
//        aLine.parent.Reference := floattostr(aLine.PONumber);
        end
      else
        begin
        aLine.QtyOutstanding := aLine.GetSOLineOutQty(aLine.SONumber, aLine.SOLine);
        aLine.Description := aLine.GetSODescription(aLine.SONumber, aLine.SOLine);
        aLine.PackQty := aLine.GetPackQty(aLine.SONumber, aLine.SOLine);
//        aLine.parent.Reference := inttostr(aLine.SONumber);
        end;

      aLine.ResellerPrice := fieldbyname('Reseller_Price').asfloat;
      aLine.CostPrice := FieldbyName('Cost_Price').Asfloat * Multiplier;
      aLine.GoodsValue := FieldByName('Goods_Value').Asfloat * Multiplier;
      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatValue := FieldByName('VAT_Value').asfloat * Multiplier;
      aLine.ProductType := FieldByName('Product_Type').Asinteger;
      aLine.ProductTypeCat := aLine.parent.dataModule.GetPTypeCat(aLine.ProductType);
      aLine.ProductTypeDesc := aLine.parent.datamodule.GetPTypeDesc(aLine.ProductType);
      aLine.PriceUnit := FieldByName('Price_Unit').Asinteger;
      aLine.PriceUnitDescr := FieldByName('Price_Unit_Description').AsString;
      aLine.PriceUnitFactor := FieldByName('Price_Unit_Factor').Asinteger;
      aLine.Nominal := FieldByName('Nominal').AsString;
      aLine.NotPrinted := FieldByName('Not_printed').AsString;
      aLine.Narrative := FieldByName('Narrative').Asinteger;
      aLine.NarrativeText := dmSalesInvoice.GetNarrative(aLine.Narrative);
      aLine.Reference := FieldByName('Reference').Asstring;
      aLine.IntNarr := FieldByName('Internal_Narrative').Asinteger;
      aLine.IntNarrText := dmSalesInvoice.GetNarrative(aLine.IntNarr);
      aLine.InvoiceSeparately := aLine.parent.datamodule.GetPTypeInvSep(aLine.ProductType);

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
          Parambyname('Date_Created').asDateTime := now;
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Customer').AsInteger := Customer;
          Parambyname('Cust_Order_No').AsString := CustOrderNo;

          Parambyname('Alt_Sales_Invoice_no').AsString := AltInvoiceNumber;

          ParamByName('Goods_Value').Asfloat := TotalGoods;
          ParamByName('Vat_Value').Asfloat := TotalVat;
          ParamByName('Operator').AsInteger := Operator;
          ParambyName('Sales_Invoice_no').asstring := '';
          ParamByName('Sales_invoice_Status').AsInteger := SIStatus;
          if CurrencyCode = 0 then
            ParamByName('Currency_Code').clear
          else
            ParamByName('Currency_Code').AsInteger := CurrencyCode;
          ParamByName('Inv_to_Customer').Asinteger := InvToCustomer;
          ParamByName('Inv_to_Branch').Asinteger := InvToBranch;

          ParamByName('Invoice_or_Credit').Asstring := InvoiceOrCredit;

          if EndUserCustomer = 0 then
            begin
              ParamByName('End_User_Branch_no').clear;
              ParamByName('End_User_Customer').clear;
            end
          else
            begin
              ParamByName('End_User_Branch_no').AsInteger := EndUserBranch;
              ParamByName('End_User_Customer').AsInteger := EndUserCustomer;
            end;

          ParambyName('Paid_Status').asstring := PaidStatus;
          if PaidStatus = 'Y' then
            ParamByName('Paid_Amount').Asfloat := TotalGoods+TotalVAT
          else
            ParamByName('Paid_Amount').Asfloat := PaidAmount;
          ParamByName('Paid_Date').Asdatetime := PaidDate;
          iTempNarr := Narrative;
          dmSalesInvoice.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Narrative').clear
          else
            ParamByName('Narrative').Asinteger := Narrative;

          {Save the Internal narrative}
          iTempNarr := IntNarrative;
          dmSalesInvoice.SaveNarrative(iTempNarr,IntNarrativeText);
          IntNarrative := iTempNarr;
          if IntNarrative = 0 then
            ParamByName('Internal_Narrative').clear
          else
            ParamByName('Internal_Narrative').Asinteger := IntNarrative;

          if SIType = '' then
            ParamByName('Sales_invoice_type').clear
          else
            ParamByName('Sales_invoice_type').Asstring := SIType;
          if Inactive = '' then
            ParamByName('Inactive').clear
          else
            ParamByName('Inactive').Asstring := Inactive;
          if PeriodEndRun = '' then
            ParambyName('Period_End_run').clear
          else
            ParambyName('Period_End_run').asstring := PeriodEndRun;
          if InvoiceLocation = 0 then
            Parambyname('Invoice_Location').clear
          else
            Parambyname('Invoice_Location').AsInteger := InvoiceLocation;
          Parambyname('Reference').asstring := Reference;
          Parambyname('Rep').asinteger := Rep;
          Parambyname('Invoice_Description').asstring := InvoiceDescription;

          if SubRep = 0 then
            Parambyname('Sub_Rep').clear
          else
            Parambyname('Sub_Rep').asinteger := SubRep;

          if eInvoice then
            Parambyname('Electronic_Invoice').asstring := 'Y'
          else
            Parambyname('Electronic_Invoice').asstring := 'N';

          if DeliveryNote then
            Parambyname('Print_as_Delivery_Note').asstring := 'Y'
          else
            Parambyname('Print_as_Delivery_Note').asstring := 'N';

          //save contact info if neccessary
          if CashSale then
          begin
            ParamByName('Cash_Sales').asString := 'Y';
            ParamByName('Account_Number').asString := Account_Number;
            ParamByName('Account_Month').asString := Account_Month;
            ParamByName('Account_Year').asString := Account_Year;
            ParamByName('Contact_no').asInteger := Contact_no;
            ParamByName('Contact_Name').asString := Contact_Name;
          end
          else
          begin
            ParamByName('Cash_Sales').asString := 'N';
            ParamByName('Account_Number').Clear;
            ParamByName('Account_Month').Clear;
            ParamByName('Account_Year').Clear;
            ParamByName('Contact_no').Clear;
            ParamByName('Contact_Name').Clear;
          end;

          if Category = 0 then
            ParambyName('Category').clear
          else
            ParambyName('Category').AsInteger := Category;
          ParambyName('Credit_Note_Reason').clear;

          if PriceUnit = 0 then
            ParambyName('Price_Unit').clear
          else
            ParambyName('Price_Unit').asinteger := PriceUnit;
          Parambyname('Quantity').asfloat := Quantity;
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
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Customer').AsInteger := Customer;
          Parambyname('Cust_Order_No').AsString := CustOrderNo;

          Parambyname('Alt_Sales_Invoice_no').AsString := AltInvoiceNumber;

          ParamByName('Goods_Value').Asfloat := TotalGoods;
          ParamByName('Vat_Value').Asfloat := TotalVat;
          ParamByName('Operator').AsInteger := Operator;
          ParambyName('Sales_Invoice_no').asstring := SINumber;
          ParamByName('Sales_invoice_Status').AsInteger := SIStatus;
          if CurrencyCode = 0 then
            ParamByName('Currency_Code').clear
          else
            ParamByName('Currency_Code').AsInteger := CurrencyCode;
          ParamByName('Inv_to_Customer').Asinteger := InvToCustomer;
          ParamByName('Inv_to_Branch').Asinteger := InvToBranch;
          ParamByName('Invoice_or_Credit').Asstring := InvoiceOrCredit;

          if EndUserCustomer = 0 then
            begin
              ParamByName('End_User_Branch_no').clear;
              ParamByName('End_User_Customer').clear;
            end
          else
            begin
              ParamByName('End_User_Branch_no').AsInteger := EndUserBranch;
              ParamByName('End_User_Customer').AsInteger := EndUserCustomer;
            end;

          ParambyName('Paid_Status').asstring := PaidStatus;
          ParamByName('Paid_Amount').Asfloat := PaidAmount;
          ParamByName('Paid_Date').Asdatetime := PaidDate;
          iTempNarr := Narrative;
          dmSalesInvoice.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Narrative').clear
          else
            ParamByName('Narrative').Asinteger := Narrative;

          {Save the Internal narrative}
          iTempNarr := IntNarrative;
          dmSalesInvoice.SaveNarrative(iTempNarr,IntNarrativeText);
          IntNarrative := iTempNarr;
          if IntNarrative = 0 then
            ParamByName('Internal_Narrative').clear
          else
            ParamByName('Internal_Narrative').Asinteger := IntNarrative;

          if SIType = '' then
            ParamByName('Sales_invoice_type').clear
          else
            ParamByName('Sales_invoice_type').Asstring := SIType;
          if Inactive = '' then
            ParamByName('Inactive').clear
          else
            ParamByName('Inactive').Asstring := Inactive;
          if PeriodEndRun = '' then
            ParambyName('Period_End_run').clear
          else
            ParambyName('Period_End_run').asstring := PeriodEndRun;

          if InvoiceLocation = 0 then
            Parambyname('Invoice_Location').clear
          else
            Parambyname('Invoice_Location').AsInteger := InvoiceLocation;

          Parambyname('Reference').asstring := Reference;
          Parambyname('Rep').asinteger := Rep;
          Parambyname('Invoice_Description').asstring := InvoiceDescription;

          if SubRep = 0 then
            Parambyname('Sub_Rep').clear
          else
            Parambyname('Sub_Rep').asinteger := SubRep;

          if eInvoice then
            Parambyname('Electronic_Invoice').asstring := 'Y'
          else
            Parambyname('Electronic_Invoice').asstring := 'N';

          if DeliveryNote then
            Parambyname('Print_as_Delivery_Note').asstring := 'Y'
          else
            Parambyname('Print_as_Delivery_Note').asstring := 'N';

          //save contact info if neccessary
          if CashSale then
          begin
            ParamByName('Cash_Sales').asString := 'Y';
            ParamByName('Account_Number').asString := Account_Number;
            ParamByName('Account_Month').asString := Account_Month;
            ParamByName('Account_Year').asString := Account_Year;
            ParamByName('Contact_no').asInteger := Contact_no;
            ParamByName('Contact_Name').asString := Contact_Name;
          end
          else
          begin
            ParamByName('Cash_Sales').asString := 'N';
            ParamByName('Account_Number').Clear;
            ParamByName('Account_Month').Clear;
            ParamByName('Account_Year').Clear;
            ParamByName('Contact_no').Clear;
            ParamByName('Contact_Name').Clear;
          end;
          if Category = 0 then
            ParambyName('Category').clear
          else
            ParambyName('Category').AsInteger := Category;
          ParambyName('Credit_Note_Reason').clear;

          if PriceUnit = 0 then
            ParambyName('Price_Unit').clear
          else
            ParambyName('Price_Unit').asinteger := PriceUnit;
          Parambyname('Quantity').asfloat := Quantity;
          ExecSQL;
        end
    end;
  {Save the rep details which might have changed}
  SaveLineReps;
  if (Mode = siHeader) then exit;
  SaveLines;
  SaveCharges;
end;

procedure TSalesInvoice.SaveLineReps;
var
  i : integer;
begin
  for i := 0 to Pred(FSalesInvoiceLines.Count) do
    begin
      if FSalesInvoiceLines[i].JBNumber <> 0 then
        FSalesInvoiceLines[i].SaveJBRep
      else
      if FSalesInvoiceLines[i].PONumber <> 0 then
        FSalesInvoiceLines[i].SavePORep
      else
      if FSalesInvoiceLines[i].SONumber <> 0 then
        FSalesInvoiceLines[i].SaveSORep;
    end;
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
      if FSalesInvoiceLines[i].Inactive = 'Y' then
        continue;
      FSalesInvoiceLines[i].SaveToDB;
      if FSalesInvoiceLines[i].JBNumber <> 0 then
        FSalesInvoiceLines[i].SaveToJB
      else
      if FSalesInvoiceLines[i].PONumber <> 0 then
        FSalesInvoiceLines[i].SaveToPO
      else
      if FSalesInvoiceLines[i].SONumber <> 0 then
        FSalesInvoiceLines[i].SaveToSO;
    end;
end;

procedure TSalesInvoice.SaveCharges;
var
  i : integer;
begin
  { When saving, we have to delete all Additional charge records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteCharges;  { Get rid of any already in database }
  FSalesInvoiceChgs.Renumber;
  for i := 0 to Pred(FSalesInvoiceChgs.Count) do
    FSalesInvoiceChgs[i].SaveToDB;
end;

procedure TSalesInvoice.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TSalesInvoice.SetBranchName(const Value: string);
begin
  FBranchName := Value;
end;

procedure TSalesInvoice.SetCurrencyCode(const Value: integer);
begin
  FCurrencyCode := Value;
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

procedure TSalesInvoice.SetInvToBranch(const Value: integer);
begin
  FInvToBranch := Value;
end;

procedure TSalesInvoice.SetInvToBranchName(const Value: string);
begin
  FInvToBranchName := Value;
end;

procedure TSalesInvoice.SetInvToCustomer(const Value: integer);
begin
  FInvToCustomer := Value;
end;

procedure TSalesInvoice.SetInvToCustomerName(const Value: string);
begin
  FInvToCustomerName := Value;
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

procedure TSalesInvoice.SetPeriodEndRun(const Value: string);
begin
  FPeriodEndRun := Value;
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
      if FSalesInvoiceLines[i].Inactive = 'Y' then
        continue;
      if FSalesInvoiceLines[i].PriceUnitFactor = 0 then
        Result := Result + roundfloat(FSalesInvoiceLines[i].GoodsValue,2)
      else
        Result := Result + roundfloat(((FSalesInvoiceLines[i].Quantity / FSalesInvoiceLines[i].PriceUnitFactor)
                           * FSalesInvoiceLines[i].GoodsValue),2)
    end;

  for i := 0 to Pred(FSalesInvoiceChgs.Count) do
    begin
      Result := Result + roundfloat(FSalesInvoiceChgs[i].Amount,2);
    end;
end;

function TSalesInvoice.GetTotalVAT: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FSalesInvoiceLines.Count) do
    begin
      if FSalesInvoiceLines[i].Inactive = 'Y' then
        continue;
      if FSalesInvoiceLines[i].VATValue <> 0.00 then
        Result := Result + roundfloat((FSalesInvoiceLines[i].VatValue),2)
      else
        Result := Result + roundfloat((FSalesInvoiceLines[i].TotalGoods * (FSalesInvoiceLines[i].VATRate / 100.00)),2)
    end;
  for i := 0 to Pred(FSalesInvoiceChgs.Count) do
    begin
      Result := Result + roundfloat((FSalesInvoiceChgs[i].Amount * (FSalesInvoiceChgs[i].VATRate / 100.00)),2)
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

procedure TSalesInvoice.LoadPOLineCharges;
var
  aLine : TsalesInvoiceChg;
begin
  FSalesInvoiceChgs.Clear;
  with FDataModule.qryPOLineChgs do
  begin
    Close;
    ParamByName('Purchase_Order').Asfloat := dmSalesInvoice.PONumber;
    ParamByName('Line').Asinteger := dmSalesInvoice.Line;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceChg.Create(Self);
      aLine.SICharge := aLine.Parent.Charges.Count + 1;
      aLine.Details := fieldbyname('Details').asstring;
      aLine.Amount := fieldbyname('Quotation_Price').asfloat;
      if dmSalesInvoice.GetNominalType = 'COMPANY' then
        aLine.Nominal := dmSalesInvoice.GetDefSalesNominal
      else
        aLine.Nominal := FieldByName('Nominal').AsString;

      if trim(aLine.Nominal) = '' then
        aLine.Nominal := dmSalesInvoice.GetDefSalesNominal;

      if fieldbyname('Vat_Code').asstring = '' then
        begin
          aLine.VATCode := fieldbyname('Def_Vat_Code').asinteger;
          aLine.VATRate := fieldbyname('Def_Vat_Rate').asfloat;
        end
      else
        begin
          aLine.VATCode := fieldbyname('Vat_Code').asinteger;
          aLine.VATRate := fieldbyname('Vat_Rate').asfloat;
        end;

      aLine.PONumber := fieldbyname('Purchase_Order').asfloat;
      aLine.AddChargeNo := fieldbyname('Additional_Charge').asinteger;

      aLine.SILine := aLine.Parent.Lines.Count;
      FSalesInvoiceChgs.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoice.SetReference(const Value: string);
begin
  FReference := Value;
end;

procedure TSalesInvoice.SetInvoiceDescription(const Value: string);
begin
  FInvoiceDescription := Value;
end;

procedure TSalesInvoice.LoadJBLineCharges;
var
  aLine : TsalesInvoiceChg;
  PONumber: real;
  iLine: integer;
begin
  FSalesInvoiceChgs.Clear;
  with FDataModule.qryJBLineChgs do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger := dmSalesInvoice.JBNumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceChg.Create(Self);
      aLine.SICharge := aLine.Parent.Charges.Count + 1;
      aLine.Details := fieldbyname('Details').asstring;
      aLine.Amount := fieldbyname('Quotation_Price').asfloat;
      if dmSalesInvoice.GetNominalType = 'COMPANY' then
        aLine.Nominal := dmSalesInvoice.GetDefSalesNominal
      else
        aLine.Nominal := FieldByName('Nominal').AsString;

      if trim(aLine.Nominal) = '' then
        aLine.Nominal := dmSalesInvoice.GetDefSalesNominal;

      aLine.VATCode := fieldbyname('Vat_Code').asinteger;
      aLine.VATRate := fieldbyname('Vat_Rate').asfloat;

      PONumber := fieldbyname('Purchase_Order').AsFloat;
      for iLine := 0 to pred(self.lines.count) do
        begin
          aLine.SILine := 0;
          if (self.lines[iLine].PONumber <> 0) and (self.lines[iLine].PONumber = PONumber) then
            begin
              aLine.SILine := self.lines[iLine].SILine;
              break;
            end;
        end;

      aLine.PONumber := fieldbyname('Purchase_Order').asfloat;
      aLine.AddChargeNo := fieldbyname('Additional_Charge').asinteger;

      FSalesInvoiceChgs.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoice.LoadCreditFromSI;
begin
  { Load the header record then all lines belonging to the sales invoice }
  Clear;
  with FDataModule.qrySIHeader do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := dmSalesInvoice.SInvoiceNumber;
    Open;
    AccountCode :=         FieldByName('Account_code').asstring;
    AcquiredCustomer :=     (Fieldbyname('Customer_is_Acquired').asstring = 'Y');
    Branch :=              FieldByName('Branch_No').AsInteger;
    BranchName :=          FieldByName('Branch_Name').Asstring;
    Category :=            FieldbyName('Category').asinteger;
    CategoryDesc :=        FieldbyName('Category_Description').asstring;
    CurrencyCode :=        FieldByName('Currency_Code').AsInteger;
    Customer :=            FieldByName('Customer').AsInteger;
    CustomerName :=        FieldByName('Customer_Name').AsString;
    CustOrderNo :=         FieldByName('Cust_Order_No').Asstring;

    EndUserCustomer :=      FieldByName('End_User_Customer').AsInteger;
    EndUserCustomerName := FieldByName('End_User_Customer_Name').Asstring;
    EndUserBranch :=        FieldByName('End_User_Branch_No').AsInteger;

    eInvoice :=            (Fieldbyname('Electronic_Invoice').AsString = 'Y');
    Inactive :=            '';
    InvoiceOrCredit :=     'C';
    InvoiceLocation :=     FieldbyName('Invoice_Location').asinteger;
    InvoiceDescription :=  FieldByName('Invoice_Description').Asstring;
    InvToBranch :=         FieldByName('Inv_to_Branch').AsInteger;
    InvToBranchName :=     FieldByName('InvBranch_Name').Asstring;
    InvToCustomer :=       FieldByName('Inv_to_Customer').AsInteger;
    InvToCustomerName :=   FieldByName('InvCust_Name').Asstring;
    Narrative :=           0;
    NarrativeText :=       dmSalesInvoice.GetNarrative(Narrative);
    Operator :=            frmPBMainMenu.iOperator;
    PaidStatus :=          FieldByName('Paid_Status').Asstring;
    PaidAmount :=          (FieldByName('Paid_Amount').Asfloat * -1);
    PaidDate :=            FieldByName('Paid_Date').AsDateTime;
    PeriodEndRun :=        'N';
    Reference :=           FieldByName('Sales_invoice_no').Asstring;
    Rep :=                 FieldByName('Rep').Asinteger;
    SubRep :=              FieldByName('Sub_Rep').Asinteger;
    SIDate :=              dmSalesInvoice.InvoiceDate;
    SINumber :=            '<New Credit>';
    SIStatus :=            10;
    SIStatusDesc :=        dmSalesInvoice.GetInvoiceStatus(10);
    SIType :=              FieldByName('Sales_invoice_type').Asstring;
    CashSale :=            FieldByName('Cash_Sales').AsBoolean;
    Account_Number :=      FieldByName('Account_Number').Asstring;
    Account_Month  :=      FieldByName('Account_Month').Asstring;
    Account_Year   :=      FieldByName('Account_Year').Asstring;
    Contact_No     :=      FieldByName('Contact_no').AsInteger;
    Contact_Name   :=      FieldByName('Contact_Name').Asstring;
    Close;
  end;
  LoadCreditLinesFromSI;
  LoadCreditChargesFromSI;
end;

procedure TSalesInvoice.LoadCreditChargesFromSI;
var
  aLine : TsalesInvoiceChg;
begin
  FSalesInvoiceChgs.Clear;
  with FDataModule.qrySIAllCharges do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := dmSalesInvoice.SInvoiceNumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceChg.Create(Self);
      aLine.SICharge := fieldbyname('Additional_Charge').asinteger;
      aLine.Details := fieldbyname('Details').asstring;
      aLine.Amount := fieldbyname('Amount').asfloat;
      aLine.Nominal := FieldByName('Nominal').AsString;
      aLine.VATCode := fieldbyname('Vat_Code').asinteger;
      aLine.VATRate := fieldbyname('Vat_Rate').asfloat;
      aLine.SILine := FieldByName('Invoice_Line_no').AsInteger;
      FSalesInvoiceChgs.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoice.LoadCreditLinesFromSI;
var
  aLine : TsalesInvoiceLine;
begin
  FsalesInvoiceLines.Clear;
  with FDataModule.qrySIAllLines do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := dmSalesInvoice.SInvoiceNumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceLine.Create(Self);
      aLine.SILine := FieldByName('Invoice_Line_no').AsInteger;
      aLine.OldSILine := aLine.SILine;
      aLine.PONumber := FieldByName('Purchase_order').Asfloat;
      aLine.POLine := FieldByName('Line').Asinteger;
      aLine.JBNumber := FieldByName('Job_Bag').Asinteger;
      aLine.JBLine := FieldByName('Job_Bag_Line').Asinteger;
      aLine.SONumber := FieldByName('Sales_Order').Asinteger;
      aLine.SOLine := FieldByName('Sales_Order_Line_no').Asinteger;
      aLine.Inactive := 'N';
      aLine.creditType := 'P';
      aLine.CostPrice := 0.00;
      aLine.Quantity := FieldByName('Qty_Invoiced').Asfloat;
      aLine.OriginalQty := 0.0;
      if aLine.JBNumber <> 0 then
        begin
        //aLine.QtyOutStanding := 0;
        aLine.QtyOutStanding := aLine.GetJBLineOutQty(aLine.JBNumber, aLine.JBLine);
        aLine.Description := aLine.GetJBDescription(aLine.JBNumber, aLine.JBLine);
        aLine.PackQty := 0;
        end
      else
      if aLine.PONumber <> 0 then
        begin
        //aLine.QtyOutstanding := 0;
        aLine.QtyOutstanding := aLine.GetPOLineOutQty(aLine.PONumber, aLine.POLine);
        aLine.Description := aLine.GetPODescription(aLine.PONumber, aLine.POLine);
        aLine.PackQty := 0;
        end
      else
        begin
        //aLine.QtyOutstanding := 0;
        aLine.QtyOutstanding := aLine.GetSOLineOutQty(aLine.SONumber, aLine.SOLine);
        aLine.Description := aLine.GetSODescription(aLine.SONumber, aLine.SOLine);
        aLine.PackQty := aLine.GetPackQty(aLine.SONumber, aLine.SOLine);
        end;

      aLine.GoodsValue := FieldByName('Goods_Value').Asfloat;
      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatValue := 0.00;
      aLine.ProductType := FieldByName('Product_Type').Asinteger;
      aLine.ProductTypeCat := aLine.parent.dataModule.GetPTypeCat(aLine.ProductType);
      aLine.ProductTypeDesc := aLine.parent.datamodule.GetPTypeDesc(aLine.ProductType);
      aLine.PriceUnit := FieldByName('Price_Unit').Asinteger;
      aLine.PriceUnitDescr := FieldByName('Price_Unit_Description').AsString;
      aLine.PriceUnitFactor := FieldByName('Price_Unit_Factor').Asinteger;
      aLine.Nominal := FieldByName('Nominal').AsString;
      aLine.Narrative := FieldByName('Narrative').Asinteger;
      aLine.NarrativeText := dmSalesInvoice.GetNarrative(aLine.Narrative);
      aLine.Reference := FieldByName('Reference').Asstring;
      aLine.IntNarr := FieldByName('Internal_Narrative').Asinteger;
      aLine.IntNarrText := dmSalesInvoice.GetNarrative(aLine.IntNarr);
      aLine.InvoiceSeparately := aLine.parent.datamodule.GetPTypeInvSep(aLine.ProductType);
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
          Parambyname('Date_Created').asDateTime := now;
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Customer').AsInteger := Customer;
          ParamByName('Cust_Order_No').Asstring := CustOrderNo;

          Parambyname('Alt_Sales_Invoice_no').AsString := AltInvoiceNumber;

          ParamByName('Goods_Value').Asfloat := TotalGoods * -1;
          ParamByName('Vat_Value').Asfloat := TotalVat * -1;
          ParamByName('Operator').AsInteger := Operator;
          ParambyName('Sales_Invoice_no').asstring := '';
          ParamByName('Sales_invoice_Status').AsInteger := SIStatus;
          if CurrencyCode = 0 then
            ParamByName('Currency_Code').clear
          else
            ParamByName('Currency_Code').AsInteger := CurrencyCode;
          ParamByName('Inv_to_Customer').Asinteger := InvToCustomer;
          ParamByName('Inv_to_Branch').Asinteger := InvToBranch;

          if EndUserCustomer = 0 then
            begin
              ParamByName('End_User_Branch_no').clear;
              ParamByName('End_User_Customer').clear;
            end
          else
            begin
              ParamByName('End_User_Branch_no').AsInteger := EndUserBranch;
              ParamByName('End_User_Customer').AsInteger := EndUserCustomer;
            end;

          ParamByName('Invoice_or_Credit').Asstring := 'C';
          ParambyName('Paid_Status').asstring := PaidStatus;

          if PaidStatus = '' then
            ParamByName('Paid_Amount').Asfloat := PaidAmount
          else
            ParamByName('Paid_Amount').Asfloat := (TotalGoods + TotalVat) * -1;

          ParamByName('Paid_Date').Asdatetime := PaidDate;
          iTempNarr := Narrative;
          dmSalesInvoice.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Narrative').clear
          else
            ParamByName('Narrative').Asinteger := Narrative;

          {Save the Internal narrative}
          iTempNarr := IntNarrative;
          dmSalesInvoice.SaveNarrative(iTempNarr,IntNarrativeText);
          IntNarrative := iTempNarr;
          if IntNarrative = 0 then
            ParamByName('Internal_Narrative').clear
          else
            ParamByName('Internal_Narrative').Asinteger := IntNarrative;

          if SIType = '' then
            ParamByName('Sales_invoice_type').clear
          else
            ParamByName('Sales_invoice_type').Asstring := SIType;
          if Inactive = '' then
            ParamByName('Inactive').clear
          else
            ParamByName('Inactive').Asstring := Inactive;
          if PeriodEndRun = '' then
            ParambyName('Period_End_run').clear
          else
            ParambyName('Period_End_run').asstring := PeriodEndRun;
          Parambyname('Reference').asstring := Reference;
          Parambyname('Rep').asinteger := Rep;
          Parambyname('Invoice_Description').asstring := InvoiceDescription;
          if InvoiceLocation = 0 then
            Parambyname('Invoice_Location').clear
          else
            Parambyname('Invoice_Location').AsInteger := InvoiceLocation;

          if SubRep = 0 then
            Parambyname('Sub_Rep').clear
          else
            Parambyname('Sub_Rep').asinteger := SubRep;

          if eInvoice then
            Parambyname('Electronic_Invoice').asstring := 'Y'
          else
            Parambyname('Electronic_Invoice').asstring := 'N';

          Parambyname('Print_as_Delivery_Note').asstring := 'N';

          //save contact info if neccessary
          if CashSale then
          begin
            ParamByName('Cash_Sales').asString := 'Y';
            ParamByName('Account_Number').asString := Account_Number;
            ParamByName('Account_Month').asString := Account_Month;
            ParamByName('Account_Year').asString := Account_Year;
            ParamByName('Contact_no').asInteger := Contact_no;
            ParamByName('Contact_Name').asString := Contact_Name;
          end
          else
          begin
            ParamByName('Cash_Sales').asString := 'N';
            ParamByName('Account_Number').Clear;
            ParamByName('Account_Month').Clear;
            ParamByName('Account_Year').Clear;
            ParamByName('Contact_no').Clear;
            ParamByName('Contact_Name').Clear;
          end;

          if Category = 0 then
            ParambyName('Category').clear
          else
            ParambyName('Category').AsInteger := Category;

          if CreditReason = 0 then
            ParambyName('Credit_Note_Reason').clear
          else
            ParambyName('Credit_Note_Reason').AsInteger := CreditReason;
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
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Customer').AsInteger := Customer;
          ParamByName('Cust_Order_No').Asstring := CustOrderNo;

          Parambyname('Alt_Sales_Invoice_no').AsString := AltInvoiceNumber;

          ParamByName('Goods_Value').Asfloat := TotalGoods * -1;
          ParamByName('Vat_Value').Asfloat := TotalVat * -1;
          ParamByName('Operator').AsInteger := Operator;
          ParambyName('Sales_Invoice_no').asstring := SINumber;
          ParamByName('Sales_invoice_Status').AsInteger := SIStatus;
          if CurrencyCode = 0 then
            ParamByName('Currency_Code').clear
          else
            ParamByName('Currency_Code').AsInteger := CurrencyCode;
          ParamByName('Inv_to_Customer').Asinteger := InvToCustomer;
          ParamByName('Inv_to_Branch').Asinteger := InvToBranch;

          if EndUserCustomer = 0 then
            begin
              ParamByName('End_User_Branch_no').clear;
              ParamByName('End_User_Customer').clear;
            end
          else
            begin
              ParamByName('End_User_Branch_no').AsInteger := EndUserBranch;
              ParamByName('End_User_Customer').AsInteger := EndUserCustomer;
            end;

          ParamByName('Invoice_or_Credit').Asstring := 'C';
          ParambyName('Paid_Status').asstring := PaidStatus;
          ParamByName('Paid_Amount').Asfloat := PaidAmount;
          ParamByName('Paid_Date').Asdatetime := PaidDate;
          iTempNarr := Narrative;
          dmSalesInvoice.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Narrative').clear
          else
            ParamByName('Narrative').Asinteger := Narrative;

          {Save the Internal narrative}
          iTempNarr := IntNarrative;
          dmSalesInvoice.SaveNarrative(iTempNarr,IntNarrativeText);
          IntNarrative := iTempNarr;
          if IntNarrative = 0 then
            ParamByName('Internal_Narrative').clear
          else
            ParamByName('Internal_Narrative').Asinteger := IntNarrative;

          if SIType = '' then
            ParamByName('Sales_invoice_type').clear
          else
            ParamByName('Sales_invoice_type').Asstring := SIType;
          if Inactive = '' then
            ParamByName('Inactive').clear
          else
            ParamByName('Inactive').Asstring := Inactive;
          if PeriodEndRun = '' then
            ParambyName('Period_End_run').clear
          else
            ParambyName('Period_End_run').asstring := PeriodEndRun;
          Parambyname('Reference').asstring := Reference;
          Parambyname('Rep').asinteger := Rep;
          Parambyname('Invoice_Description').asstring := InvoiceDescription;
          if InvoiceLocation = 0 then
            Parambyname('Invoice_Location').clear
          else
            Parambyname('Invoice_Location').AsInteger := InvoiceLocation;

          if SubRep = 0 then
            Parambyname('Sub_Rep').clear
          else
            Parambyname('Sub_Rep').asinteger := SubRep;

          if eInvoice then
            Parambyname('Electronic_Invoice').asstring := 'Y'
          else
            Parambyname('Electronic_Invoice').asstring := 'N';

          Parambyname('Print_as_Delivery_Note').asstring := 'N';

          //save contact info if neccessary
          if CashSale then
          begin
            ParamByName('Cash_Sales').asString := 'Y';
            ParamByName('Account_Number').asString := Account_Number;
            ParamByName('Account_Month').asString := Account_Month;
            ParamByName('Account_Year').asString := Account_Year;
            ParamByName('Contact_no').asInteger := Contact_no;
            ParamByName('Contact_Name').asString := Contact_Name;
          end
          else
          begin
            ParamByName('Cash_Sales').asString := 'N';
            ParamByName('Account_Number').Clear;
            ParamByName('Account_Month').Clear;
            ParamByName('Account_Year').Clear;
            ParamByName('Contact_no').Clear;
            ParamByName('Contact_Name').Clear;
          end;
          if Category = 0 then
            ParambyName('Category').clear
          else
            ParambyName('Category').AsInteger := Category;

          if CreditReason = 0 then
            ParambyName('Credit_Note_Reason').clear
          else
            ParambyName('Credit_Note_Reason').AsInteger := CreditReason;
          ExecSQL;
        end
    end;
  if (Mode = siHeader) then exit;
  SaveCreditLines;
  SaveCharges;
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
      if FSalesInvoiceLines[i].JBNumber <> 0 then
        FSalesInvoiceLines[i].SaveToJB
      else
      if FSalesInvoiceLines[i].PONumber <> 0 then
        FSalesInvoiceLines[i].SaveToPO
      else
      if FSalesInvoiceLines[i].SONumber <> 0 then
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

procedure TSalesInvoice.LoadSOCharges;
var
  aLine : TsalesInvoiceChg;
begin
  FSalesInvoiceChgs.Clear;
  with FDataModule.qrySOChgs do
  begin
    Close;
    ParamByName('Sales_Order').Asinteger := dmSalesInvoice.SONumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSalesInvoiceChg.Create(Self);
      aLine.SICharge := aLine.Parent.Charges.Count + 1;
      aLine.Details := fieldbyname('Details').asstring;
      aLine.Amount := fieldbyname('Amount').asfloat;
      aLine.Nominal := fieldbyname('Nominal').asstring;

      if trim(aLine.Nominal) = '' then
        aLine.Nominal := dmSalesInvoice.GetDefSalesNominal;

      aLine.VATCode := fieldbyname('Vat_Code').asinteger;
      aLine.VATRate := fieldbyname('Vat_Rate').asfloat;
      aLine.SILine := aLine.Parent.Lines.count;

      aLine.PONumber := 0;
      aLine.AddChargeNo := 0;

      FSalesInvoiceChgs.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoice.SetAccount_Month(const Value: string);
begin
  FAccount_Month := Value;
end;

procedure TSalesInvoice.SetAccount_Number(const Value: string);
begin
  FAccount_Number := Value;
end;

procedure TSalesInvoice.SetAccount_Year(const Value: string);
begin
  FAccount_Year := Value;
end;

procedure TSalesInvoice.SetCashSale(const Value: boolean);
begin
  FCashSale := Value;
end;

procedure TSalesInvoice.SetContact_Name(const Value: string);
begin
  FContact_Name := Value;
end;

procedure TSalesInvoice.SetContact_no(const Value: integer);
begin
  FContact_no := Value;
end;

procedure TSalesInvoice.SetInvoiceLocation(const Value: integer);
begin
  FInvoiceLocation := Value;
end;

procedure TSalesInvoice.SetCategory(const Value: integer);
begin
  FCategory := Value;
end;

procedure TSalesInvoice.SetCategoryDesc(const Value: string);
begin
  FCategoryDesc := Value;
end;

procedure TSalesInvoice.SetCreditReason(const Value: integer);
begin
  FCreditReason := Value;
end;

procedure TSalesInvoice.SetMode(const Value: TSIMode);
begin
  FMode := Value;
end;

procedure TSalesInvoice.SeteInvoice(const Value: boolean);
begin
  FeInvoice := Value;
end;

procedure TSalesInvoice.SaveEInvoiceStatus(const value: integer);
begin
  with self.DataModule.qrySIUpStatus do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := self.dbKey;
      parambyname('Sales_Invoice_Status').asinteger := value;
      execsql;
    end;
end;

procedure TSalesInvoice.SetClientAccountCode(const Value: string);
begin
  FClientAccountCode := Value;
end;

function TSalesInvoice.GetOrderNumber: string;
begin
  result := '';
  if self.CustOrderNo <> '' then
    begin
      result := self.CustOrderNo;
      exit;
    end;

  if SIType = 'S' then
    begin
    with self.datamodule.qrySOHead do
      begin
        close;
        parambyname('Sales_order').asinteger := strtoint(trim(reference));
        open;
        result := fieldbyname('Cust_Order_no').asstring;
      end;
    end
  else
  if SIType = 'J' then
    begin
    with self.datamodule.qryJBHead do
      begin
        close;
        parambyname('Job_Bag').asinteger := strtoint(trim(reference));
        open;
        result := fieldbyname('Cust_Order_no').asstring;
      end;
    end
  else
    begin
    with self.datamodule.qryGetPO do
      begin
        close;
        parambyname('Purchase_order').asfloat := strtofloat(trim(reference));
        parambyname('Line').asinteger := 1;
        open;
        result := fieldbyname('Cust_Order_no').asstring;
      end;
    end;
end;

procedure TSalesInvoice.SaveEInvoice;
begin
  with self.DataModule.qryUpEInvoice do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := self.dbKey;
      if self.eInvoice then
        parambyname('Electronic_Invoice').AsString := 'Y'
      else
        parambyname('Electronic_Invoice').AsString := 'N';
      parambyname('Invoice_Description').AsString := self.InvoiceDescription;
      parambyname('Cust_Order_No').AsString := self.CustOrderNo;
      if DeliveryNote then
        parambyname('Print_as_Delivery_note').AsString := 'Y'
      else
        parambyname('Print_as_Delivery_note').AsString := 'N';
      execsql;
    end;
end;

procedure TSalesInvoice.SetCustOrderNo(const Value: string);
begin
  FCustOrderNo := Value;
end;

function TSalesInvoice.InvoiceDetailsExist: boolean;
begin
  with self.DataModule.qrySIAllDetails do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := self.dbKey;
      open;
      result := (recordcount > 0);
    end;
end;

procedure TSalesInvoice.SetDeliveryNote(const Value: boolean);
begin
  FDeliveryNote := Value;
end;

procedure TSalesInvoice.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

function TSalesInvoice.GetUnitSell: currency;
begin
  if PriceUnitFactor = 0 then
    result := TotalGoods
  else
    begin
      if quantity = 0 then
        result := 0
      else
        result := TotalGoods/(quantity/PriceUnitFactor);
    end;
end;

procedure TSalesInvoice.SetPriceUnitFactor(const Value: integer);
begin
  FPriceUnitFactor := Value;
end;

procedure TSalesInvoice.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TSalesInvoice.SetDateCreated(const Value: TDateTime);
begin
  FDateCreated := Value;
end;

procedure TSalesInvoice.UndoDeletedLines;
begin
  with self.DataModule.qrySOUnDoLines do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := self.dbKey;
      execsql;
    end;
end;

procedure TSalesInvoice.SetSubRep(const Value: integer);
begin
  FSubRep := Value;
end;

procedure TSalesInvoice.SetEndUserBranch(const Value: integer);
begin
  FEndUserBranch := Value;
end;

procedure TSalesInvoice.SetEndUserCustomer(const Value: integer);
begin
  FEndUserCustomer := Value;
end;

procedure TSalesInvoice.SetEndUserCustomerName(const Value: string);
begin
  FEndUserCustomerName := Value;
end;

procedure TSalesInvoice.SetAcquiredCustomer(const Value: boolean);
begin
  FAcquiredCustomer := Value;
end;

procedure TSalesInvoice.SetAltInvoiceNumber(const Value: string);
begin
  FAltInvoiceNumber := Value;
end;

{ TSalesInvoiceLine }

function TSalesInvoiceLine.Clone: TSalesInvoiceLine;
begin
  Result := TSalesInvoiceLine.Create(FParent);
  Result.CostPrice :=         Self.CostPrice;
  Result.CreditType :=        Self.CreditType;
  Result.Deleted :=           Self.Deleted;
  Result.Description :=       Self.Description;
  Result.GoodsValue  :=       Self.GoodsValue;
  Result.Inactive :=          Self.Inactive;
  Result.IntNarr  :=          Self.IntNarr;
  Result.IntNarrText  :=      Self.IntNarrText;
  Result.InvoiceSeparately := Self.InvoiceSeparately;
  Result.IsChecked  :=        self.IsChecked;
  Result.JBNumber  :=         Self.JBNumber;
  Result.JBLine  :=           Self.JBLine;
  Result.LineChecked :=       Self.LineChecked;
  Result.Narrative  :=        Self.Narrative;
  Result.NarrativeText  :=    Self.NarrativeText;
  Result.Nominal  :=          Self.Nominal;
  Result.NotPrinted  :=       Self.NotPrinted;
  Result.PackQty :=           Self.PackQty;
  Result.PONumber  :=         Self.PONumber;
  Result.POLine  :=           Self.POLine;
  Result.PriceUnit  :=        Self.PriceUnit;
  Result.PriceUnitDescr  :=   Self.PriceUnitDescr;
  Result.PriceUnitFactor  :=  Self.PriceUnitFactor;
  Result.ProductType  :=      Self.ProductType;
  Result.ProductTypeCat :=    Self.ProductTypeCat;
  Result.ProductTypeDesc  :=  Self.ProductTypeDesc;
  Result.Quantity  :=         Self.Quantity;
  Result.OriginalQty  :=      Self.OriginalQty;
  Result.OldSILine :=         Self.oldSILine;
  Result.QtyOutstanding  :=   Self.QtyOutstanding;
  Result.Reference  :=        Self.Reference;
  Result.ResellerPrice :=     self.ResellerPrice;
  Result.SILine  :=           Self.SILine;
  Result.SOLine  :=           Self.SOLine;
  Result.SONumber  :=         Self.SONumber;
  Result.VatCode  :=          Self.VatCode;
  Result.VatRate  :=          Self.VatRate;
  Result.VatValue :=          Self.VatValue;
  Result.FSalesInvoiceLineChgs.Free;
  Result.FSalesInvoiceLineChgs :=  Self.FSalesInvoiceLineChgs.Clone;
end;

constructor TSalesInvoiceLine.Create(SalesInvoice: TSalesInvoice);
begin
  FParent := SalesInvoice;
end;

destructor TSalesInvoiceLine.Destroy;
begin
  inherited;
end;

function TSalesInvoiceLine.GetTotalChargesGoods: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FSalesInvoiceLineChgs.Count) do
    Result := Result + FSalesInvoiceLineChgs[i].Amount;
end;

function TSalesInvoiceLine.GetTotalChargesVAT: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FSalesInvoiceLineChgs.Count) do
    Result := Result + FSalesInvoiceLineChgs[i].Amount;
end;

function TSalesInvoiceLine.GetTotalGoods: currency;
begin
  if FPriceUnitFactor = 0 then
    Result := FGoodsValue
  else
    Result := ((FQuantity / FPriceUnitFactor) * FGoodsValue);
end;

procedure TSalesInvoiceLine.LoadFromDB;
begin
  with FParent.FDataModule.qrySILine do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := FParent.DbKey;
    ParamByName('Invoice_Line_No').AsInteger := SILine;
    Open;
    inactive := 'N';
    CostPrice := fieldbyname('Cost_Price').asfloat;
    CreditType := FieldByName('Credit_Type').asstring;
    PONumber := FieldByName('Purchase_order').Asfloat;
    POLine := FieldByName('Line').Asinteger;
    JBNumber := FieldByName('Job_Bag').Asinteger;
    JBLine := FieldByName('Job_Bag_Line').Asinteger;
    SONumber := FieldByName('Sales_Order').Asinteger;
    SOLine := FieldByName('Sales_Order_Line_no').Asinteger;
    Quantity := FieldByName('Qty_Invoiced').Asfloat;
    OriginalQty := FieldByName('Qty_Invoiced').Asfloat;
    if PONumber <> 0 then
      begin
      QtyOutstanding := GetPOLineOutQty(PONumber, POLine);
      Description := GetPODescription(PONumber, POLine);
      PackQty := 0;
      end
    else
    if SONumber <> 0 then
      begin
      QtyOutstanding := GetSOLineOutQty(SONumber, SOLine);
      Description := GetSODescription(SONumber, SOLine);
      PackQty := GetPackQty(SONumber, SOLine);
      end
    else
      begin
      QtyOutStanding := GetJBLineOutQty(JBNumber, JBLine);
      Description := GetJBDescription(JBNumber, JBLine);
      PackQty := 0;
      end;
    ResellerPrice := fieldbyname('Reseller_Price').asfloat;
    GoodsValue := FieldByName('Goods_Value').Asfloat;
    VatCode := FieldByName('VAT_Code').Asinteger;
    VatRate := FieldByName('VAT_Rate').Asfloat;
    VatValue := FieldByName('Vat_Value').asfloat;
    ProductType := FieldByName('Product_Type').Asinteger;
    ProductTypeCat := FParent.FDataModule.GetPTypeCat(ProductType);
    ProductTypeDesc := FParent.FDataModule.GetPTypeDesc(ProductType);
    PriceUnit := FieldByName('Price_Unit').Asinteger;
    PriceUnitDescr := FieldByName('Price_Unit_Description').Asstring;
    PriceUnitFactor := FieldByName('Price_Unit_Factor').Asinteger;
    Nominal := FieldByName('Nominal').AsString;
    NotPrinted := FieldByName('Not_printed').asstring;
    Narrative := FieldByName('Narrative').Asinteger;
    LineChecked := false;
    Reference := FieldByName('Reference').Asstring;
    IntNarr := FieldByName('Internal_Narrative').Asinteger;
    InvoiceSeparately := FParent.FDataModule.GetPTypeInvSep(ProductType);
    Close;
  end;
  LoadLineCharges;
end;

procedure TSalesInvoiceLine.LoadLineCharges;
var
  aCharge : TsalesInvoiceLineChg;
begin
  FsalesInvoiceLineChgs.Clear;
  with parent.FDataModule.qrySIAllLineChgs do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := parent.DbKey;
    ParamByName('Invoice_Line_no').AsInteger := SILine;
    Open;
    while not(EOF) do
    begin
      aCharge := TSalesInvoiceLineChg.Create(Self);
      aCharge.SICharge := FieldByName('Additional_Charge').AsInteger;
      aCharge.Details := FieldByName('Details').Asstring;
      aCharge.Amount := FieldByName('Amount').Asfloat;
      aCharge.Nominal := FieldByName('Nominal').Asstring;
      aCharge.VATCode := FieldByName('VAT_Code').Asinteger;
      aCharge.VATRate := FieldByName('VAT_Rate').Asfloat;
      FSalesInvoiceLineChgs.Add(aCharge);
      Next;
    end;
    Close;
  end;
end;

procedure TSalesInvoiceLine.SaveToDB;
var
  NewSILine: integer;
  iCharges: integer;
begin
  with FParent.FDataModule.qrySIAddLine do
  begin
    ParamByName('Sales_invoice').AsInteger := FParent.DbKey;
//    ParamByName('Invoice_Line_no').AsInteger := SILine;
    NewSILine := parent.DataModule.GetNextSILNumber(FParent.DbKey);
    ParamByName('Invoice_Line_no').AsInteger := NewSILine;
    if PONumber = 0 then
      begin
        ParamByName('Purchase_order').clear;
        ParamByName('Line').clear;
      end
    else
      begin
        ParamByName('Purchase_order').asfloat := PONumber;
        ParamByName('Line').asinteger := POLine;
      end;
    ParambyName('Cost_Price').asfloat := CostPrice * FParent.Multiplier;
    ParambyName('Credit_Type').asstring := CreditType;
    ParamByName('Qty_Invoiced').Asfloat := Quantity * FParent.Multiplier;
    ParamByName('Goods_Value').Asfloat := GoodsValue * FParent.Multiplier;
    ParamByName('Reseller_Price').Asfloat := ResellerPrice * FParent.Multiplier;
    ParamByName('Vat_Code').asinteger := VatCode;
    if CreditType <> 'V' then
      ParamByName('Vat_Value').asfloat := 0.00
    else
      ParamByName('Vat_Value').asfloat := VatValue * FParent.Multiplier;

    if ProductType = 0 then
      ParamByName('Product_Type').clear
    else
      ParamByName('Product_Type').AsInteger := ProductType;
    ParamByName('Price_Unit').AsInteger := PriceUnit;
    ParamByName('Nominal').AsString := Nominal;
    ParamByName('Not_Printed').asstring := NotPrinted;
    if JBNumber = 0 then
      begin
        ParamByName('Job_Bag').clear;
        ParamByName('Job_Bag_Line').clear;
      end
    else
      begin
        ParamByName('Job_Bag').asfloat := JBNumber;
        ParamByName('Job_Bag_Line').asinteger := JBLine;
      end;
    if Narrative = 0 then
      ParamByName('Narrative').clear
    else
      ParamByName('Narrative').Asinteger := Narrative;
    ParamByName('Reference').asstring := Reference;
    if IntNarr = 0 then
      ParamByName('Internal_Narrative').clear
    else
      ParamByName('Internal_Narrative').asinteger := IntNarr;
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
    ParamByName('Sales_Invoice_Status').asinteger := 10;
    ExecSQL;
  end;

  for iCharges := 0 to pred(Self.parent.Charges.count) do
    begin
      if self.parent.Charges[iCharges].SILine = self.OldSILine then
        self.parent.Charges[iCharges].SILine := NewSILine;
    end;
end;

procedure TSalesInvoiceLine.SaveToJB;
var
  JBStatus: string;
  bReconcile: boolean;
  orderStatus: integer;
  iStkReqLines, poQty, poQtyInvoiced, poQtyDelivered: integer;
begin
  if FParent.Inactive = 'Y' then
    Quantity := 0;

  {If the Job bag line was related to a PO then update the PO}
  if PONumber <> 0 then
    begin
      with FParent.FDataModule.qryPOUpLine do
        begin
          close;
          ParamByName('Purchase_Order').Asfloat := PONumber;
          ParamByName('Line').AsInteger := POLine;
          ParamByName('Qty_Invoiced').Asfloat := ((Quantity - OriginalQty) * fParent.Multiplier);
          if ((QtyOutstanding + OriginalQty)-(Quantity * FParent.Multiplier)) <= 0 then
            orderStatus := 30
          else
            orderstatus := 25;
          ParamByName('Purch_Ord_line_Status').asinteger := orderstatus;
          Parambyname('Rep').asinteger := parent.Rep;
          ExecSQL;
        end;

      {Get the PO and the Delivery details to determine the correct status}
      with FParent.FDataModule.qryGetPOLine do
        begin
          close;
          ParamByName('Purchase_Order').Asfloat := PONumber;
          ParamByName('Line').AsInteger := POLine;
          open;

          poQty := fieldbyname('Quantity').asinteger;
          poQtyInvoiced := fieldbyname('Qty_Invoiced').asinteger;
          poQtyDelivered := fieldbyname('Qty_Delivered').asinteger;

          if poQtyInvoiced >= poQty then
            orderStatus := 30
          else
          if (poQtyInvoiced <> 0) and (poQtyInvoiced < poQty) then
            orderStatus := 25
          else
          if (poQtyDelivered >= poQty) then
            orderStatus := 22
          else
          if (poQtyDelivered <> 0) and (poQtyDelivered < poQty) then
            orderStatus := 21
          else
            orderStatus := 20

        end;
      {Update the PO line once again to set the correct status}
      with FParent.FDataModule.qryPOUpLineStatus do
        begin
          close;
          ParamByName('Purchase_Order').Asfloat := PONumber;
          ParamByName('Line').AsInteger := POLine;
          ParamByName('Purch_Ord_line_Status').asinteger := orderstatus;
          ExecSQL;
        end;

      {Update the PO Status}
      with FParent.FDataModule.qryPOUpHead do
        begin
          close;
          parambyname('Purchase_Order').asfloat := PONumber;
          ParamByName('Purch_Ord_Head_Status').AsInteger := orderstatus;
          execsql;
        end;

      {Update the Job Bag Line with the correct status}
      with FParent.FDataModule.qryJBUpLine do
        begin
          close;
          ParamByName('Job_bag').Asinteger := JBNumber;
          ParamByName('Job_bag_Line').AsInteger := JBLine;
          Parambyname('Qty_Invoiced').asfloat := ((Quantity - OriginalQty)* fParent.Multiplier);
          if orderstatus = 25 then
            ParamByName('Job_bag_Line_Invoiced').Asstring := 'P'
          else
          if orderstatus = 30 then
            ParamByName('Job_bag_Line_Invoiced').Asstring := 'Y'
          else
            ParamByName('Job_bag_Line_Invoiced').Asstring := 'N';
          execsql;
        end;
    end
  else
  if SONumber <> 0 then
    begin
      if FParent.Inactive = 'Y' then
        Quantity := 0;

      with FParent.FDataModule.qrySOUpLine do
        begin
          close;
          ParamByName('Sales_Order').Asinteger := SONumber;
          ParamByName('Sales_Order_Line').AsInteger := SOLine;
          ParamByName('Quantity_Invoiced').Asfloat := ((Quantity - OriginalQty)* fParent.Multiplier);
          ExecSQL;
        end;

      {Check the status of SO Lines}
      with FParent.FDataModule.qrySOChkStatus do
        begin
          close;
          parambyname('Sales_Order').asinteger := SONumber;
          open;

          if FieldByName('Qty_Inv').AsInteger = 0 then
            orderstatus := 150
          else
          if FieldByName('Qty_Not_Inv').AsInteger > 0 then
            orderstatus := 200
          else
            orderstatus := 250;
        end;

      {Update the SO Status}
      with FParent.FDataModule.qrySOUpHead do
        begin
          close;
          parambyname('Sales_Order').asinteger := SONumber;
          ParamByName('Sales_Order_Head_Status').AsInteger := orderstatus;
          execsql;
        end;

      {Update the Job Bag Line with the correct status}
      with FParent.FDataModule.qryJBUpLine do
        begin
          close;
          ParamByName('Job_bag').Asinteger := JBNumber;
          ParamByName('Job_bag_Line').AsInteger := JBLine;
          Parambyname('Qty_Invoiced').asfloat := ((Quantity - OriginalQty)* fParent.Multiplier);
          if orderstatus = 200 then
            ParamByName('Job_bag_Line_Invoiced').Asstring := 'P'
          else
          if orderstatus = 250 then
            ParamByName('Job_bag_Line_Invoiced').Asstring := 'Y'
          else
            ParamByName('Job_bag_Line_Invoiced').Asstring := 'N';
          execsql;
        end;
    end
  else
    {Not related to a PO or a SO so just update the job bag line}
    begin
      if FParent.Inactive = 'Y' then
        Quantity := 0;

      with FParent.FDataModule.qryJBUpLine do
        begin
          close;
          ParamByName('Job_bag').Asinteger := JBNumber;
          ParamByName('Job_bag_Line').AsInteger := JBLine;
//          Parambyname('Qty_Invoiced').asfloat := ((Quantity - OriginalQty)* fParent.Multiplier);
          Parambyname('Qty_Invoiced').asfloat := ((Quantity)* fParent.Multiplier);
          if FParent.Inactive = 'Y' then
            ParamByName('Job_bag_Line_Invoiced').Asstring := 'N'
          else
            ParamByName('Job_bag_Line_Invoiced').Asstring := 'Y';
          execsql;
        end;

      with FParent.FDataModule.qryGetJBLine do
        begin
          close;
          ParamByName('Job_bag').Asinteger := JBNumber;
          ParamByName('Job_bag_Line').AsInteger := JBLine;
          open;

          if fieldbyname('Qty_Invoiced').asinteger = 0 then
            JBStatus := 'N'
          else
          if  (fieldbyname('Qty_Invoiced').asinteger <> 0) and
              (fieldbyname('Qty_Invoiced').asinteger < fieldbyname('Job_Bag_Quantity').asinteger) then
            JBStatus := 'P'
          else
            JBStatus := 'Y';
        end;

      with FParent.FDataModule.qryJBUpLineStatus do
        begin
          close;
          ParamByName('Job_bag').Asinteger := JBNumber;
          ParamByName('Job_bag_Line').AsInteger := JBLine;
          ParamByName('Job_bag_Line_Invoiced').Asstring := JBStatus;
          execsql;
        end;
    end;

  with FParent.FDataModule.qryJBChkStockReq do
  begin
    close;
    parambyname('Job_Bag').asinteger := JBNumber;
    open;
//    bReconcile := (FieldByName('Invoiced_Lines').AsInteger <> Fieldbyname('Total_lines').asinteger);
    bReconcile := (FieldByName('Unreconciled_Lines').AsInteger <> 0);
    iStkReqLines := Fieldbyname('Total_lines').asinteger;
  end;

  {Update the Job Bag header}
  with FParent.FDataModule.qryJBChkStatus do
  begin
    close;
    parambyname('Job_Bag').asinteger := JBNumber;
    open;
    orderstatus := 30;
    if FieldByName('Lines_not_Invoiced').AsInteger = Fieldbyname('Total_lines').asinteger then
      begin
        if (FieldByName('Total_SOs').AsInteger > 0) or (iStkReqLines > 0) then
          orderstatus := 20
        else
        if FieldByName('Total_POs').AsInteger > 0 then
          orderstatus := 12
        else
        if FieldByName('Total_Sundries').AsInteger > 0 then
          orderstatus := 11
        else
          orderstatus := 10
      end
    else
    if FieldByName('Lines_not_Invoiced').AsInteger <> 0 then
      begin
        if (FieldByName('Total_SOs').AsInteger > 0) or (iStkReqLines > 0) then
          orderstatus := 24
        else
        if FieldByName('Total_POs').AsInteger > 0 then
          orderstatus := 23
        else
          orderstatus := 25
      end
    else
    if (FieldByName('Lines_not_Invoiced').AsInteger = 0) and bReconcile then
      orderstatus := 24
    else
      orderstatus := 30;
  end;

  {Update the JB Status}
  with FParent.FDataModule.qryJBUpHead do
  begin
    close;
    parambyname('Job_Bag').asinteger := JBNumber;
    parambyname('Job_Bag_status').asinteger := orderstatus;
    execsql;
  end;
end;

procedure TSalesInvoiceLine.SaveToPO;
var
  orderStatus: integer;
  JB, JBL: integer;
  poQty, poQtyInvoiced, poQtyDelivered: integer;
begin
  if FParent.Inactive = 'Y' then
    Quantity := 0;

  with FParent.FDataModule.qryPOUpLine do
  begin
    close;
    ParamByName('Purchase_Order').Asfloat := PONumber;
    ParamByName('Line').AsInteger := POLine;
    ParamByName('Qty_Invoiced').Asfloat := ((Quantity - OriginalQty) * fParent.Multiplier);
    if ((QtyOutstanding + OriginalQty)-(Quantity * FParent.Multiplier)) = 0 then
      orderStatus := 30
    else
      orderstatus := 25;
    ParamByName('Purch_Ord_line_Status').asinteger := orderstatus;
    ParamByName('Rep').asinteger := parent.rep;
    ExecSQL;
  end;

  {Get the PO and the Delivery details to determine the correct status}
  with FParent.FDataModule.qryGetPOLine do
    begin
      close;
      ParamByName('Purchase_Order').Asfloat := PONumber;
      ParamByName('Line').AsInteger := POLine;
      open;

      poQty := fieldbyname('Quantity').asinteger;
      poQtyInvoiced := fieldbyname('Qty_Invoiced').asinteger;
      poQtyDelivered := fieldbyname('Qty_Delivered').asinteger;

      if poQtyInvoiced >= poQty then
        orderStatus := 30
      else
      if (poQtyInvoiced <> 0) and (poQtyInvoiced < poQty) then
        orderStatus := 25
      else
      if (poQtyDelivered >= poQty) then
        orderStatus := 22
      else
      if (poQtyDelivered <> 0) and (poQtyDelivered < poQty) then
        orderStatus := 21
      else
        orderStatus := 20
    end;

  {Update the PO line once again to set the correct status}
  with FParent.FDataModule.qryPOUpLineStatus do
    begin
      close;
      ParamByName('Purchase_Order').Asfloat := PONumber;
      ParamByName('Line').AsInteger := POLine;
      ParamByName('Purch_Ord_line_Status').asinteger := orderstatus;
      ExecSQL;
    end;

  {Update the PO Status}
  with FParent.FDataModule.qryPOUpHead do
  begin
    close;
    parambyname('Purchase_Order').asfloat := PONumber;
    ParamByName('Purch_Ord_Head_Status').AsInteger := orderstatus;
    execsql;
  end;

  {Is this order in a job bag?????????}
  JB := 0;
  JBL := 0;
  with FParent.FDataModule.qryCheckJB do
    begin
      close;
      parambyname('Purchase_Order').asfloat := PONumber;
      parambyname('Line').asinteger := POLine;
      open;

      JB := fieldbyname('Job_Bag').asinteger;
      JBL := fieldbyname('Job_Bag_line').asinteger;
    end;

  {If order is in a job bag then update the status}
  if JB <> 0 then
    begin
      {Update the Job Bag header}
      with FParent.FDataModule.qryJBChkStatus do
      begin
        close;
        parambyname('Job_Bag').asinteger := JBNumber;
        open;
        if FieldByName('Lines_not_Invoiced').AsInteger = Fieldbyname('Total_lines').asinteger then
          begin
            if FieldByName('Total_SOs').AsInteger > 0 then
              orderstatus := 20
            else
            if FieldByName('Total_POs').AsInteger > 0 then
              orderstatus := 12
            else
            if FieldByName('Total_Sundries').AsInteger > 0 then
              orderstatus := 11
            else
              orderstatus := 10
          end
        else
        if FieldByName('Lines_not_Invoiced').AsInteger <> 0 then
          begin
            if FieldByName('Total_SOs').AsInteger > 0 then
              orderstatus := 24
            else
            if FieldByName('Total_POs').AsInteger > 0 then
              orderstatus := 23
            else
              orderstatus := 25
          end
        else
          orderstatus := 30;
      end;

      {Update the JB Status}
      with FParent.FDataModule.qryJBUpHead do
      begin
        close;
        parambyname('Job_Bag').asinteger := JBNumber;
        parambyname('Job_Bag_status').asinteger := orderstatus;
        execsql;
      end;
    end;
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
  with FParent.FDataModule.qrySOChkStatus do
  begin
    close;
    parambyname('Sales_Order').asinteger := SONumber;
    open;
    if FieldByName('Qty_Inv').AsInteger = 0 then
      orderstatus := 150
    else
    if FieldByName('Qty_Not_Inv').AsInteger > 0 then
      orderstatus := 200
    else
      orderstatus := 250;
  end;

  {Update the SO Status}
  with FParent.FDataModule.qrySOUpHead do
  begin
    close;
    parambyname('Sales_Order').asinteger := SONumber;
    ParamByName('Sales_Order_Head_Status').AsInteger := orderstatus;
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

function TSalesInvoiceLine.GetSOLineSellPrice(tempCode: integer; tempLine: integer): real;
begin
  with FParent.FDataModule.qrySOLine do
    begin
      close;
      parambyname('Sales_order').asfloat := tempcode;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_Sales_Price').asfloat;
    end;
end;

function TSalesInvoiceLine.GetSOLineOrdQty(tempCode: integer; tempLine: integer): integer;
begin
  with FParent.FDataModule.qrySOLine do
    begin
      close;
      parambyname('Sales_order').asfloat := tempcode;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Quantity_Ordered').asinteger;
    end;
end;

function TSalesInvoiceLine.GetSOLineDelQty(tempCode: integer; tempLine: integer): integer;
begin
  with FParent.FDataModule.qrySOLine do
    begin
      close;
      parambyname('Sales_order').asfloat := tempcode;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Quantity_Delivered').asinteger;
    end;
end;

function TSalesInvoiceLine.GetJBLineOutQty(tempCode: integer; tempLine: integer): integer;
begin
  with FParent.FDataModule.qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempcode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      open;
      if fieldbyname('Job_Bag_Line_Invoiced').asstring = 'Y' then
        result := 0
      else
        result := fieldbyname('Qty_Outstanding').asinteger;
    end;
end;

procedure TSalesInvoiceLine.SetGoodsValue(const Value: double);
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

procedure TSalesInvoiceLine.SetPriceUnitFactor(const Value: integer);
begin
  FPriceUnitFactor := Value;
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

function TSalesInvoiceLine.GetJBDescription(tempCode,
  tempLine: integer): string;
begin
  result := '';
  with FParent.Datamodule.qryGetJB do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
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
  with FParent.Datamodule.qryGetSO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_description').asstring;
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

function TSalesInvoiceLine.GetPartDescription(tempCode,
  tempLine: integer): string;
begin
  with FParent.Datamodule.qrySOLinePart do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_Description').asstring;
    end;
end;

function TSalesInvoiceLine.GetPartPriceUnit(tempCode,
  tempLine: integer): integer;
begin
  with FParent.Datamodule.qrySOLinePart do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Price_Unit').asinteger;
    end;
end;

function TSalesInvoiceLine.GetPartProductType(tempCode,
  tempLine: integer): integer;
begin
  with FParent.Datamodule.qrySOLinePart do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Product_Type').asinteger;
    end;
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

function TSalesInvoiceLine.GetSOPackQty(tempCode,
  tempLine: integer): integer;
begin
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

procedure TSalesInvoiceLine.SetDeleted(const Value: boolean);
begin
  FDeleted := Value;
end;

procedure TSalesInvoiceLine.SetLineChecked(const Value: boolean);
begin
  FLineChecked := Value;
end;

procedure TSalesInvoiceLine.SetInvoiceSeparately(const Value: boolean);
begin
  FInvoiceSeparately := Value;
end;

procedure TSalesInvoiceLine.SetProductTypeCat(const Value: integer);
begin
  FProductTypeCat := Value;
end;

procedure TSalesInvoiceLine.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TSalesInvoiceLine.SetOldSILine(const Value: integer);
begin
  FOldSILine := Value;
end;

procedure TSalesInvoiceLine.SaveJBRep;
begin
  if PONumber <> 0 then
    begin
      with FParent.FDataModule.qryPOUpRep do
        begin
          close;
          ParamByName('Purchase_Order').Asfloat := PONumber;
          ParamByName('Line').AsInteger := POLine;
          Parambyname('Rep').asinteger := parent.Rep;
          ExecSQL;
        end;
    end;

  {Update the JB Rep}
  with FParent.FDataModule.qryJBUpRep do
  begin
    close;
    parambyname('Job_Bag').asinteger := JBNumber;
    parambyname('Rep').asinteger := parent.rep;
    execsql;
  end;

end;

procedure TSalesInvoiceLine.SavePORep;
begin
  with FParent.FDataModule.qryPOUpRep do
    begin
      close;
      ParamByName('Purchase_Order').Asfloat := PONumber;
      ParamByName('Line').AsInteger := POLine;
      Parambyname('Rep').asinteger := parent.Rep;
      ExecSQL;
    end;
end;

procedure TSalesInvoiceLine.SaveSORep;
begin
  with FParent.FDataModule.qrySODelRep do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      execsql;
    end;

    with FParent.FDataModule.qrySOUpRep do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      parambyname('Rep').asinteger := parent.Rep;
      execsql;
    end;
end;

procedure TSalesInvoiceLine.SetIsChecked(const Value: boolean);
begin
  FIsChecked := Value;
end;

procedure TSalesInvoiceLine.SaveDeletedQty;
begin
  with FParent.FDataModule.qrySOUpdDelQty do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      parambyname('Sales_Order_Line_no').asinteger := SOLine;
      parambyname('Quantity_Deleted').asfloat := Quantity;
      execsql;
    end;
end;

procedure TSalesInvoiceLine.SetResellerPrice(const Value: currency);
begin
  FResellerPrice := Value;
end;

function TSalesInvoiceLine.GetTotalReseller: currency;
begin
  if FPriceUnitFactor = 0 then
    Result := FGoodsValue
  else
    Result := ((FQuantity / FPriceUnitFactor) * FResellerPrice);
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

{dmSalesInvoice}

function TdmSalesInvoice.CheckInvoiceUnique(tempInvoiceNo: string; tempInvoiceID: integer): boolean;
begin
  result := false;

  with qryCheckInvoice do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tempInvoiceID;
      parambyname('Sales_Invoice_no').asstring := tempInvoiceNo;
      open;
      result := recordcount = 0;
    end;
end;

function TdmSalesInvoice.GetHeaderCount: integer;
begin
  Result := qrySIHeaderGrid.RecordCount;
end;

function TdmSalesInvoice.GetNextSINumber: integer;
begin
  with qrySIGetLast do
    begin
      close;
      open;
      result := fieldbyname('Last_Sales_invoice').asinteger + 1;
    end;
end;

procedure TdmSalesInvoice.RefreshData;
begin
  with qrySIHeaderGrid do
  begin
    Close;
    ParamByName('Code_From').Asstring := '%' + Customer + '%';
    ParamByName('Invoice_or_Credit').Asstring := 'C';

    ParamByName('UnFactored').asstring := 'N';
    if DisplayUnFactored then
      begin
        ParamByName('UnFactored').asstring := 'Y';
        ParamByName('status').asinteger := 0;
      end
    else
      begin
        if DisplayArchived then
          ParamByName('status').asinteger := 0
        else
          ParamByName('status').asinteger := 30;
      end;

    {Determine whether to display deleted invoices}
    if DisplayInactive then
      ParamByName('Inactive').asString := 'Y'
    else
      ParamByName('Inactive').asString := 'N';

    if PaidStatus = 'A' then
      Parambyname('Paid_Status').asstring := 'A'
    else
    if PaidStatus = 'F' then
      Parambyname('Paid_Status').asstring := 'Y'
    else
    if PaidStatus = 'P' then
      Parambyname('Paid_Status').asstring := 'p'
    else
    if PaidStatus = 'U' then
      Parambyname('Paid_Status').asstring := ''
    else
      Parambyname('Paid_Status').asstring := 'A';

    Parambyname('Invoice_Description').asstring := '%'+trim(Description)+'%';
    Parambyname('Rep_Name').asstring := '%'+trim(RepName)+'%';
    Parambyname('Sub_Rep_Name').asstring := '%'+trim(SubRepName)+'%';
    Parambyname('Status_Name').asstring := '%'+trim(Status)+'%';
//    Parambyname('Invoice_Date').asdatetime := InvoiceDate;

    Parambyname('Customer').asinteger := CustomerCode;

    if RepIsSubRep then
      begin
        Parambyname('Rep').asinteger := 0;
        Parambyname('Sub_Rep').asinteger := Rep;
      end
    else
      begin
        Parambyname('Rep').asinteger := Rep;
        Parambyname('Sub_Rep').asinteger := 0;
      end;

    Parambyname('Operator').asinteger := Operator;

    SQL.Delete(pred(SQL.count));

    if SortOrder = '' then
      SQL.Add(' ORDER BY Sales_Invoice.Sales_Invoice DESC')
    else
      SQL.Add(' ORDER BY ' + SortOrder);
    open;
  end;
end;

procedure TdmSalesInvoice.RefreshCustomerData;
begin
  with qrySIHeaderGrid do
  begin
    Close;
    ParamByName('Code_From').Asstring := Customer + '%';
    ParamByName('Invoice_or_Credit').Asstring := 'X';

    ParamByName('UnFactored').asstring := 'N';

(*    if DisplayUnFactored then
      begin
        ParamByName('UnFactored').asstring := 'Y';
        ParamByName('status').asinteger := 0;
      end
    else
      begin
        if DisplayArchived then
          ParamByName('status').asinteger := 0
        else
          ParamByName('status').asinteger := 30;
      end;
*)
    ParamByName('status').asinteger := 0;

(*    {Determine whether to display deleted invoices}
    if DisplayInactive then
      ParamByName('Inactive').asString := 'Y'
    else
      ParamByName('Inactive').asString := 'N';
*)
    ParamByName('Inactive').asString := 'Y';

(*    if PaidStatus = 'A' then
      Parambyname('Paid_Status').asstring := 'A'
    else
    if PaidStatus = 'F' then
      Parambyname('Paid_Status').asstring := 'Y'
    else
    if PaidStatus = 'P' then
      Parambyname('Paid_Status').asstring := 'p'
    else
    if PaidStatus = 'U' then
      Parambyname('Paid_Status').asstring := ''
    else
*)
    Parambyname('Paid_Status').asstring := 'A';

    Parambyname('Invoice_Description').asstring := '%'+trim(Description)+'%';
    Parambyname('Rep_Name').asstring := '%'+trim(RepName)+'%';
    Parambyname('Sub_Rep_Name').asstring := '%'+trim(SubRepName)+'%';
    Parambyname('Status_Name').asstring := '%'+trim(Status)+'%';

    Parambyname('Customer').asinteger := CustomerCode;
    Parambyname('Rep').asinteger := Rep;
    Parambyname('Sub_Rep').asinteger := 0;
    Parambyname('Operator').asinteger := Operator;

    SQL.Delete(pred(SQL.count));

    if SortOrder = '' then
      SQL.Add(' ORDER BY Sales_Invoice.Sales_Invoice DESC')
    else
      SQL.Add(' ORDER BY ' + SortOrder);
    open;
  end;
end;

procedure TdmSalesInvoice.RefreshPOData;
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

procedure TdmSalesInvoice.RefreshSOData;
var
  stemp: string;
begin
  if not dmBroker.isSQL then
    qrySOAll.SQL.text := qrySOAll_access.sql.text
  else
    begin
      if bShowUninvoicedSO then
        qrySOAll.SQL.text := SOAllUninvoiced
      else
        qrySOAll.SQL.text := SOAll;
    end;

  with qrySOAll do
    begin
      Close;
      ParamByName('Code_From').Asstring := CustomerName + '%';
      Open;
      First;
    end;
end;

procedure TdmSalesInvoice.RefreshJBData;
begin
  with qryJBAll do
  begin
    Close;
    ParamByName('Code_From').Asstring := CustomerName + '%';
    Open;
    First;
  end;
end;

procedure TdmSalesInvoice.qrySIHeaderGridCalcFields(DataSet: TDataSet);
begin
(*  DataSet['Total_Value'] := StrToFloat(formatfloat('0.00',
      Dataset['Goods_Value'])) + StrToFloat(formatfloat('0.00',
      Dataset['VAT_Value']));
*)
  DataSet['Total_Value'] := roundfloat(Dataset['Goods_Value'],2) + roundfloat(Dataset['VAT_Value'],2);

  if Dataset.fieldbyname('Inactive').asstring = 'Y' then
    Dataset.FieldByName('Invoice_Status').asstring := 'Deleted'
  else
    Dataset.FieldByName('Invoice_Status').asstring := Dataset.fieldbyname('Status_Description').asstring;

  {Invoice Format}
  if Dataset.fieldbyname('Electronic_Invoice').asstring = 'Y' then
    Dataset.Fieldbyname('Invoice_Format').asstring := 'Electronic'
  else
    Dataset.Fieldbyname('Invoice_Format').asstring := 'Standard';

  if Dataset.fieldbyname('Paid_Status').asstring = 'Y' then
    Dataset.Fieldbyname('Paid_Status_Description').asstring := 'Fully Paid'
  else
  if Dataset.fieldbyname('Paid_Status').asstring = 'p' then
    Dataset.Fieldbyname('Paid_Status_Description').asstring := 'Part Paid'
  else
    Dataset.Fieldbyname('Paid_Status_Description').asstring := 'Unpaid';
end;

function TdmSalesInvoice.GetCurrentSInvoice: integer;
begin
  if qrySIHeaderGrid.RecordCount > 0 then
    Result := qrySIHeaderGrid.FieldByName('Sales_invoice').AsInteger
  else
    Result := 0;
end;

procedure TdmSalesInvoice.ListAllLines(const aKey: integer);
begin
  with qrySIAllLines do
  begin
    Close;
    ParamByname('Sales_Invoice').AsInteger := aKey;
    Open;
  end;
end;

function TdmSalesInvoice.GetCustomerAddress(tempCust: integer; tempBranch: integer): string;
var
  i: integer;
begin
  result := '';
  with qryGetCustBranch do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      parambyname('Branch_no').asinteger := tempBranch;
      open;
      for i := 1 to 5 do
        begin
          if trim(fields[i].asstring) = '' then continue;
          result := result + trim(fields[i].asstring) + #13#10;
        end;
    end;
end;

function TdmSalesInvoice.GetAccountCode(tempCust: integer; tempBranch: integer): string;
begin
  result := '';
  with qryGetCustBranch do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      parambyname('Branch_no').asinteger := tempBranch;
      open;
      result := fieldbyname('Account_code').asstring;
    end;
end;

function TdmSalesInvoice.GetAccountCodeInactive(tempCust: integer): boolean;
begin
  result := false;
  with qryGetCust do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Acc_Active').asstring = 'N';
    end;
end;

function TdmSalesInvoice.GetSOPart(tempCode: integer; tempLine: integer): string;
begin
  result := '';
  with qryGetSO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part').asstring;
    end;
end;

function TdmSalesInvoice.GetInvoiceStatus(tempcode: integer): string;
begin
  result := '';
  with qryGetInvStatus do
    begin
      close;
      parambyname('Sales_invoice_Status').asinteger := tempCode;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

function TdmSalesInvoice.GetDefPriceUnit: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Price_unit').asinteger;
    end;
end;

function TdmSalesInvoice.GetDefProductType: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Product_type').asinteger;
    end;
end;

function TdmSalesInvoice.GetNominaltype: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Nominal_level').asstring;
    end;
end;

function TdmSalesInvoice.GetDefSalesNominal: string;
begin
  result := '';
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Sales_nom_Def').asstring;
    end;
end;

function TdmSalesInvoice.GetVATRate(tempCode: integer): real;
begin
  with qryGetVAT do
    begin
      close;
      parambyname('VAT_Code').asinteger := tempCode;
      open;
      result := fieldbyname('VAT_Rate').asfloat;
    end;
end;

function TdmSalesInvoice.GetPUnitDescription(tempCode: integer): string;
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

function TdmSalesInvoice.GetPUnitFactor(tempCode: integer): integer;
begin
  with qryGetPriceUnit do
    begin
      close;
      parambyname('Price_UNit').asinteger := tempCode;
      open;
      result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

function TdmSalesInvoice.GetPTypeNominal(tempCode: integer): string;
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

function TdmSalesInvoice.GetPTypeDesc(tempCode: integer): string;
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

function TdmSalesInvoice.GetPTypeCat(tempCode: integer): integer;
begin
  result := 0;
  with qryGetPType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := fieldbyname('Category').asinteger;
    end;
end;

function TdmSalesInvoice.GetPTypeCatDesc(tempCode: integer): string;
begin
  result := '';
  with qryGetPType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := fieldbyname('Category_Description').asstring;
    end;
end;

function TdmSalesInvoice.GetPTypeInvSep(tempCode: integer): boolean;
begin
  result := false;
  with qryGetPType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := (fieldbyname('Use_Separate_Invoice_Seq').asstring = 'Y');
    end;
end;

{ TSalesInvoiceChg }

function TSalesInvoiceChg.Clone: TSalesInvoiceChg;
begin
  Result := TSalesInvoiceChg.Create(FParent);
  Result.AddChargeNo :=       self.AddChargeNo;
  Result.SILine :=            Self.SILine;
  Result.SICharge :=          Self.SICharge;
  Result.Details :=           Self.Details;
  Result.Amount :=            Self.Amount;
  Result.Nominal :=           Self.Nominal;
  Result.PONumber :=          Self.PONumber;
  Result.VatCode :=           Self.VatCode;
  Result.VatRate :=           Self.VatRate;
end;

constructor TSalesInvoiceChg.Create(SalesInvoice: TSalesInvoice);
begin
  FParent := SalesInvoice;
end;

destructor TSalesInvoiceChg.Destroy;
begin
  inherited;
end;

function TSalesInvoiceChg.GetVATAmount: currency;
begin
  result := Amount * (VATRate/100);
end;

procedure TSalesInvoiceChg.LoadFromDB;
begin
  with FParent.FDataModule.qrySICharges do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := FParent.DbKey;
    ParamByName('Additional_Charge').AsInteger := SICharge;
    Open;
    Details := FieldByName('Details').AsString;
    AddChargeNo := fieldbyname('Additional_Charge').asinteger;
    Amount := FieldByName('Amount').Asfloat;
    VatCode := FieldByName('Vat_Code').Asinteger;
    VatRate := FieldByName('Vat_Rate').Asfloat;
    Nominal := FieldByName('Nominal').AsString;
    SILine := FieldbyName('Invoice_Line_no').asinteger;
    Cost := FieldByName('cost_price').asFloat;
    PONumber := fieldbyname('Purchase_Order').asfloat;
    Close;
  end;
end;

procedure TSalesInvoiceChg.SaveToDB;
begin
  with FParent.FDataModule.qrySIAddCharge do
  begin
    ParamByName('Sales_invoice').AsInteger := FParent.DbKey;
    ParamByName('Additional_Charge').AsInteger := SICharge;
    ParamByName('Details').Asstring := Details;
    ParamByName('Amount').Asfloat := Amount * FParent.Multiplier;
    ParamByName('Nominal').Asstring := Nominal;
    ParamByName('Vat_Code').Asinteger := VatCode;
    ParamByName('Invoice_Line_no').asinteger := SILine;
    ParamByName('cost_price').asFloat := cost * FParent.Multiplier;
    if AddChargeNo = 0 then
      Parambyname('poAddChrg').clear
    else
      Parambyname('poAddChrg').AsInteger := AddChargeNo;

    if PONumber = 0 then
      ParambyName('Purchase_Order').clear
    else
      ParambyName('Purchase_Order').asfloat := PONumber;
    ExecSQL;
  end;
end;

procedure TSalesInvoiceChg.SetAddChargeNo(const Value: integer);
begin
  FAddChargeNo := Value;
end;

procedure TSalesInvoiceChg.SetAmount(const Value: currency);
begin
  FAmount := Value;
end;

procedure TSalesInvoiceChg.SetCost(const Value: currency);
begin
  FCost := Value;
end;

procedure TSalesInvoiceChg.SetDetails(const Value: string);
begin
  FDetails := Value;
end;

procedure TSalesInvoiceChg.SetNominal(const Value: string);
begin
  FNominal := Value;
end;

procedure TSalesInvoiceChg.SetParent(const Value: TSalesInvoice);
begin
  FParent := Value;
end;

procedure TSalesInvoiceChg.SetPONumber(const Value: real);
begin
  FPONumber := Value;
end;

procedure TSalesInvoiceChg.SetSICharge(const Value: integer);
begin
  FSICharge := Value;
end;

procedure TSalesInvoiceChg.SetSILine(const Value: integer);
begin
  FSILine := Value;
end;

procedure TSalesInvoiceChg.SetVATCode(const Value: integer);
begin
  FVATCode := Value;
end;

procedure TSalesInvoiceChg.SetVATRate(const Value: real);
begin
  FVATRate := Value;
end;

{ TSalesInvoiceLineChg }

function TSalesInvoiceLineChg.Clone: TSalesInvoiceLineChg;
begin
  Result := TSalesInvoiceLineChg.Create(FParent);
  Result.SICharge :=        self.SICharge;
  Result.Details  :=        self.Details;
  Result.Amount   :=        self.Amount;
  Result.Nominal :=         Self.Nominal;
  Result.VATCode :=         Self.VATCode;
  Result.VATRate :=         Self.VATRate;
end;

constructor TSalesInvoiceLineChg.Create(
  SalesInvoiceLine: TSalesInvoiceLine);
begin
  FParent := SalesInvoiceLine;
end;

destructor TSalesInvoiceLineChg.Destroy;
begin
  inherited;
end;

procedure TSalesInvoiceLineChg.LoadFromDB;
begin
  with FParent.FParent.FDataModule.qrySILineChgs do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger := FParent.FParent.DbKey;
    ParamByName('Invoice_line_no').AsInteger := FParent.SILine;
    ParamByName('Additional_Charge').AsInteger := SICharge;
    Open;
    Details := FieldByName('Details').Asstring;
    Amount := FieldByName('Amount').Asfloat;
    Nominal := FieldByName('Nominal').Asstring;
    VATCode := FieldByName('VAT_Code').Asinteger;
    VATRate := FieldByName('VAT_Rate').Asfloat;
    Close;
  end;

end;

procedure TSalesInvoiceLineChg.SaveToDB;
begin
  with FParent.FParent.FDataModule.qrySIAddLineChg do
  begin
    ParamByName('Sales_Invoice').AsInteger := FParent.FParent.DbKey;
    ParamByName('Invoice_Line_no').AsInteger := FParent.SILine;
    ParamByName('Additional_Charge').AsInteger := SICharge;
    ParamByName('Details').Asstring := Details;
    ParamByName('Amount').Asfloat := Amount * FParent.Fparent.Multiplier;
    ParamByName('Nominal').Asstring := Nominal;
    ParamByName('VAT_Code').Asinteger := VATCode;
    ExecSQL;
  end;

end;

procedure TSalesInvoiceLineChg.SetAmount(const Value: currency);
begin
  FAmount := Value;
end;

procedure TSalesInvoiceLineChg.SetDetails(const Value: string);
begin
  FDetails := Value;
end;

procedure TSalesInvoiceLineChg.SetNominal(const Value: string);
begin
  FNominal := Value;
end;

procedure TSalesInvoiceLineChg.SetSICharge(const Value: integer);
begin
  FSICharge := Value;
end;

procedure TSalesInvoiceLineChg.SetVAtCode(const Value: integer);
begin
  FVAtCode := Value;
end;

procedure TSalesInvoiceLineChg.SetVATRate(const Value: real);
begin
  FVATRate := Value;
end;

{ TSalesInvoiceChgs }

procedure TSalesInvoiceChgs.Add(aLine: TSalesInvoiceChg);
begin
  FItems.Add(aLine);
end;

procedure TSalesInvoiceChgs.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSalesInvoiceLine(FItems[i]).Free;
end;

function TSalesInvoiceChgs.Clone: TSalesInvoiceChgs;
var
  i : integer;
begin
  Result := TSalesInvoiceChgs.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TSalesInvoiceChg(FItems[i]).Clone);
end;

constructor TSalesInvoiceChgs.Create(SalesInvoice: TSalesInvoice);
begin
  FParent := SalesInvoice;
  FItems := TList.Create;
end;

procedure TSalesInvoiceChgs.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TSalesInvoiceChgs.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSalesInvoiceChg(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TSalesInvoiceChgs.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TSalesInvoiceChgs.GetItems(Index: integer): TSalesInvoiceChg;
begin
  Result := TSalesInvoiceChg(FItems[Index]);
end;

function TSalesInvoiceChgs.IndexOf(const LineNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TSalesInvoiceChg(FItems[i]).SICharge = LineNumber then
      Result := i;
end;

procedure TSalesInvoiceChgs.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSalesInvoiceChg(FItems[i]).SICharge:= (i+1);
end;

procedure TSalesInvoiceChgs.SetItems(Index: integer;
  const Value: TSalesInvoiceChg);
begin
  FItems[Index] := Value;
end;

{ TSalesInvoiceLineChgs }

procedure TSalesInvoiceLineChgs.Add(aLine: TSalesInvoiceLineChg);
begin
  FItems.Add(aLine);
end;

procedure TSalesInvoiceLineChgs.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSalesInvoiceLineChg(FItems[i]).Free;
end;

function TSalesInvoiceLineChgs.Clone: TSalesInvoiceLineChgs;
var
  i : integer;
begin
  Result := TSalesInvoiceLineChgs.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TSalesInvoiceLineChg(FItems[i]).Clone);
end;

constructor TSalesInvoiceLineChgs.Create(
  SalesInvoiceLine: TSalesInvoiceLine);
begin
  FParent := SalesInvoiceLine;
  FItems := TList.Create;
end;

procedure TSalesInvoiceLineChgs.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TSalesInvoiceLineChgs.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSalesInvoiceLineChg(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TSalesInvoiceLineChgs.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TSalesInvoiceLineChgs.GetItems(
  Index: integer): TSalesInvoiceLineChg;
begin
  Result := TSalesInvoiceLineChg(FItems[Index]);
end;

function TSalesInvoiceLineChgs.IndexOf(const LineNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TSalesInvoiceLineChg(FItems[i]).SICharge = LineNumber then
      Result := i;
end;

procedure TSalesInvoiceLineChgs.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSalesInvoiceLineChg(FItems[i]).SICharge := (i+1);
end;

procedure TSalesInvoiceLineChgs.SetItems(Index: integer;
  const Value: TSalesInvoiceLineChg);
begin
  FItems[Index] := Value;
end;

function TdmSalesInvoice.GetNarrative(const iNarrative: integer): string;
var
  Narrative : TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.Data;
  finally
    Narrative.Free;
  end;
end;

procedure TdmSalesInvoice.SaveNarrative(var iNarrative: Integer;
  const Data: string);
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.Data := Data;
    Narrative.SaveToDB;
    iNarrative := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

function TdmSalesInvoice.GetRepNominal(tempCode: integer): string;
begin
  result := '';
  with qryGetRep do
    begin
      close;
      parambyname('Rep').asinteger := tempCode;
      open;
      result := fieldbyname('Product_Nominal_def').asstring;
    end;
end;

procedure TdmSalesInvoice.RefreshJBLData;
begin
  with qryJBLines do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger := JBNumber;
    Open;
    First;
  end;

end;

procedure TdmSalesInvoice.RefreshCustJBData;
begin
  with qryCustJBL do
  begin
    Close;
    ParamByName('Customer').Asinteger := iCustomer;
    Open;
    First;
  end;

end;

procedure TdmSalesInvoice.RefreshCreditData;
begin
  with qrySCHeaderGrid do
  begin
    Close;
    ParamByName('Credit').Asstring := 'C';
    ParamByName('Code_From').Asstring := Customer + '%';

    ParamByName('UnFactored').asstring := 'N';
    if DisplayUnFactored then
      begin
        ParamByName('UnFactored').asstring := 'Y';
        ParamByName('status').asinteger := 0;
      end
    else
      begin
        if DisplayArchived then
          ParamByName('status').asinteger := 0
        else
          ParamByName('status').asinteger := 30;
      end;

    {Determine whether to display deleted invoices}
    if DisplayInactive then
      ParamByName('Inactive').asString := 'Y'
    else
      ParamByName('Inactive').asString := 'N';
    Parambyname('Invoice_Description').asstring := '%'+trim(Description)+'%';

    Parambyname('Customer').asinteger := CustomerCode;

    if RepIsSubRep then
      begin
        Parambyname('Rep').asinteger := 0;
        Parambyname('Sub_Rep').asinteger := Rep;
      end
    else
      begin
        Parambyname('Rep').asinteger := Rep;
        Parambyname('Sub_Rep').asinteger := 0;
      end;

    Parambyname('Operator').asinteger := Operator;

    SQL.Delete(pred(SQL.count));

    if SortOrder = '' then
      SQL.Add(' ORDER BY Sales_Invoice.Sales_Invoice DESC')
    else
      SQL.Add(' ORDER BY ' + SortOrder);
    Open;
  end;
end;

function TdmSalesInvoice.GetCreditHeaderCount: integer;
begin
  Result := qrySCHeaderGrid.RecordCount;
end;

function TdmSalesInvoice.GetCurrentCreditNote: integer;
begin
  if qrySCHeaderGrid.RecordCount > 0 then
    Result := qrySCHeaderGrid.FieldByName('Sales_invoice').AsInteger
  else
    Result := 0;
end;

procedure TdmSalesInvoice.qrySOAllCalcFields(DataSet: TDataSet);
begin
  if qrySOAllPick_Date.asstring = '' then
    qrySOALLActual_Delivery_Date.asdatetime := qrySOAllDelivery_Date.asdatetime
  else
    qrySOALLActual_Delivery_Date.asdatetime := qrySOAllPick_Date.asdatetime;
end;

function TdmSalesInvoice.GetLastPeriodEndDate: TDateTime;
begin
  with qryCompany do
    begin
      close;
      open;
    end;

  with qryPeriodEnd do
    begin
      close;
      parambyname('period').asinteger := qryCompany.fieldbyname('Period').asinteger;
      open;
      result := fieldbyname('Last_period_end_Date').asdatetime;
    end;
end;

function TdmSalesInvoice.IsSecurityUser: Boolean;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := frmPBMainMenu.iOperator;
      open;
      result := (fieldbyname('Security_User').asstring = 'Y')
    end;
end;

procedure TdmSalesInvoice.qrySCHeaderGridCalcFields(DataSet: TDataSet);
begin
  DataSet['Total_Value'] := StrToFloat(formatfloat('0.00',
      Dataset['Goods_Value'])) + StrToFloat(formatfloat('0.00',
      Dataset['VAT_Value']));

  DataSet['Total_Credit'] := StrToFloat(formatfloat('0.00',
      Dataset['Goods_Credit'])) + StrToFloat(formatfloat('0.00',
      Dataset['VAT_Credit']));

  {Invoice Format}
  if Dataset.fieldbyname('Electronic_Invoice').asstring = 'Y' then
    Dataset.Fieldbyname('Invoice_Format').asstring := 'Electronic'
  else
    Dataset.Fieldbyname('Invoice_Format').asstring := 'Standard';

  if Dataset.fieldbyname('Inactive').asstring = 'Y' then
    Dataset.FieldByName('Invoice_Status').asstring := 'Deleted'
  else
    Dataset.FieldByName('Invoice_Status').asstring := Dataset.fieldbyname('Status_Description').asstring;

  if Dataset.fieldbyname('Paid_Status').asstring = 'Y' then
    Dataset.Fieldbyname('Paid_Status_Description').asstring := 'Taken'
  else
  if Dataset.fieldbyname('Paid_Status').asstring = 'p' then
    Dataset.Fieldbyname('Paid_Status_Description').asstring := 'Part Taken'
  else
    Dataset.Fieldbyname('Paid_Status_Description').asstring := 'Not Taken';
end;

procedure TdmSalesInvoice.SetCustomerCode(const Value: integer);
begin
  FCustomerCode := Value;
end;

procedure TdmSalesInvoice.FreeCompanyRecord;
begin
  with qrySpare do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set SI_Print_In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

function TdmSalesInvoice.LockCompanyRecord: string;
var
  StartTime : TDateTime;
  EndTime : TDateTime;
  InUseBy : integer;
  Myself : integer;
const
  LockTime = ((1/24) * (5/3600));  { Allow 5 seconds for lock attempts }
begin
  result := '';
  StartTime := Time;
  EndTime := StartTime + LockTime;
  InUseBy := 0;
  MySelf := frmPBMainMenu.iOperator;
//  while (InUseBy <> MySelf) and (Time < EndTime) do
  with qrySpare do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Company Set SI_Print_In_Use_By = ' + IntToStr(MySelf) + ' ' +
              'Where Company=1 and SI_Print_In_Use_By is null');
      ExecSQL;
      SQL.Clear;
      SQL.Add('Select SI_Print_In_Use_By From Company Where Company = 1');
      Open;
      InUseBy := FieldByName('SI_Print_In_Use_By').AsInteger;
      Close;
//      if (InUseBy <> MySelf) and (Time > EndTime) then
      if (InUseBy <> MySelf) then
      begin
        result := GetOperatorName(InUseBy);
(*        { Assume the other locker has died and grab record unconditionally }
        SQL.Clear;
        SQL.Add('Update Company Set SI_Print_In_Use_By = ' + IntToStr(MySelf) + ' ' +
                'Where Company=1');
        ExecSQL;
*)
      end;
    end;
end;


function TdmSalesInvoice.GetOperatorName(tempCode: integer): string;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempcode;
      open;
      result := fieldbyname('Name').asstring;
    end;
end;

function TdmSalesInvoice.GetInvoiceLocation(sType: string): integer;
begin
  result := 0;

  if not dmBroker.UseRevenueCentres then
    begin
      result := 0;
      exit;
    end;

  with qryGetInvoiceLoc do
    begin
      close;
      open;
      if recordcount = 1 then
        result := fieldbyname('Invoice_Location').asinteger
    end;

  {Check if PO or SO is part of a job bag}
  if sType <> 'J' then
    begin
      with qryCheckJBPO do
        begin
          close;
          parambyname('Purchase_Order').asfloat := self.PONumber;
          parambyname('Sales_Order').asinteger := self.SONumber;
          open;
          if recordcount > 0 then
            begin
              qryGetJBInvLoc.close;
              qryGetJBInvLoc.parambyname('Job_Bag').asinteger := qryCheckJBPO.fieldbyname('Job_Bag').asinteger;
              qryGetJBInvLoc.open;

              result := qryGetJBInvLoc.fieldbyname('Invoice_Location').asinteger;
              exit;
            end;
        end;

      with qryGetDefaultInvLoc do
        begin
          close;
          open;
          result := fieldbyname('Invoice_Location').asinteger;
        end;
    end;
end;

function TdmSalesInvoice.GetPackQty(tempCode, tempLine: integer): integer;
begin
  with qrySOHead do
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

  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Sell_Pack_Quantity').asinteger;
    end;
end;

function TdmSalesInvoice.GetPartPriceUnit(tempCode,
  tempLine: integer): integer;
begin
  with qrySOLinePart do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Price_Unit').asinteger;
    end;

end;

function TdmSalesInvoice.GetSOLineOutQty(tempCode,
  tempLine: integer): integer;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asfloat := tempcode;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Qty_Outstanding').asinteger;
    end;

end;

function TdmSalesInvoice.GetSOLineSellPrice(tempcode,
  templine: integer): real;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asfloat := tempcode;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_Sales_Price').asfloat;
    end;
end;

function TdmSalesInvoice.GetSOPackQty(tempCode,
  tempLine: integer): integer;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Sell_Pack_Quantity').asinteger;
    end;
end;

function TdmSalesInvoice.GetPartProductType(tempCode, tempLine: integer): integer;
begin
  with qrySOLinePart do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Product_Type').asinteger;
    end;

end;

function TdmSalesInvoice.GetPTypeNotes(tempCode: integer): integer;
begin
  result := 0;
  with qryGetPType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := fieldbyname('Narrative').asinteger;
    end;
end;

function TdmSalesInvoice.GetPTypeCatNotes(tempCode: integer): integer;
begin
  result := 0;
  with qryGetCat do
    begin
      close;
      parambyname('Category').asinteger := tempCode;
      open;
      result := fieldbyname('Inv_Narrative').asinteger;
    end;
end;

function TdmSalesInvoice.GetNextSILNumber(tempCode: integer): integer;
begin
  with qrySIGetLastLine do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tempCode;
      open;
      result := fieldbyname('Last_Sales_invoice_line').asinteger + 1;
    end;
end;

function TdmSalesInvoice.GetCustomerEInvoice(tempCust: integer): boolean;
begin
  result := false;
  with qryGetCust do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := (fieldbyname('Electronic_Invoice_required').asstring = 'Y');
    end;
end;

function TdmSalesInvoice.GetNextSIDNumber(tempCode: integer): integer;
begin
  with qrySIGetLastDetail do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tempCode;
      open;
      result := fieldbyname('Last_Sales_invoice_Detail').asinteger + 1;
    end;
end;

function TdmSalesInvoice.GetCustomerTerms(tempCust: integer): string;
begin
  result := '';
  with qryGetCust do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := trim(fieldbyname('Payment_Terms_Description').asstring);
    end;
end;

function TdmSalesInvoice.GetCustomerOrderNo(SIType, SIReference: string): string;
begin
  result := '';

  if SIType = 'S' then
    begin
    with qrySOHead do
      begin
        close;
        parambyname('Sales_order').asinteger := strtoint(trim(SIreference));
        open;
        result := fieldbyname('Cust_Order_no').asstring;
      end;
    end
  else
  if SIType = 'J' then
    begin
    with qryJBHead do
      begin
        close;
        parambyname('Job_Bag').asinteger := strtoint(trim(SIreference));
        open;
        result := fieldbyname('Cust_Order_no').asstring;
      end;
    end
  else
    begin
    with qryGetPO do
      begin
        close;
        parambyname('Purchase_order').asfloat := strtofloat(trim(SIreference));
        parambyname('Line').asinteger := 1;
        open;
        result := fieldbyname('Cust_Order_no').asstring;
      end;
    end;
end;

procedure TdmSalesInvoice.UpDatePaidStatus(tmpInvoice: integer;
  tmpStatus: string; tmpAmount: real);
begin
  with qryUpPaidStatus do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tmpInvoice;
      parambyname('Paid_Status').asstring := tmpStatus;
      parambyname('Paid_Amount').asfloat := tmpAmount;

      if tmpStatus = 'Y' then
        begin
          parambyname('Paid_Date').asdatetime := date;
        end
      else
        begin
          parambyname('Paid_Date').asdatetime := 0;
        end;
      execsql;
    end;
end;

function TdmSalesInvoice.UsingSearch: boolean;
begin
  if (Status <> '') or
            (RepName <> '') or
            (SubRepName <> '') or
            (Description <> '') or
            (DisplayArchived) or
            (DisplayInactive) then
    result := true
  else
    result := false;
end;

end.
