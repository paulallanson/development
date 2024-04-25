unit PBSupplierInvoiceDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPIMode   = (piAdd, piChange, piDelete, piRaise, piView);
  TPILMode   = (pilAdd, pilChange, pilDelete, pilView);
  TPICMode   = (picAdd, picChange, picDelete, picView);

  TdmSupplierInvoice = class(TDataModule)
    qrySIHeaderGrid: TFDQuery;
    qrySIHeaderGridSupplier_Invoice: TIntegerField;
    qrySIHeaderGridSupplier: TIntegerField;
    qrySIHeaderGridBranch_no: TIntegerField;
    qrySIHeaderGridVat_Value: TFloatField;
    qrySIHeaderGridGoods_Value: TFloatField;
    qrySIHeaderGridInvoice_Date: TDateTimeField;
    qrySIHeaderGridSupplier_Invoice_no: TWideStringField;
    qrySIHeaderGridSupp_Invoice_Status: TIntegerField;
    qrySIHeaderGridCurrency_Code: TIntegerField;
    qrySIHeaderGridSupp_Inv_Alt_Ref: TWideStringField;
    qrySIHeaderGridSupplier_Name: TWideStringField;
    qrySIHeaderGridBranch_Name: TWideStringField;
    qrySIHeaderGridStatus_Desc: TWideStringField;
    dsSIHeaderGrid: TDataSource;
    qryCompany: TFDQuery;
    qrySIAllCharges: TFDQuery;
    qrySIHeader: TFDQuery;
    qryOperator: TFDQuery;
    dsOperator: TDataSource;
    qryGetSuppBranch: TFDQuery;
    qryGetPurchOrd: TFDQuery;
    qryPOAllLines: TFDQuery;
    qryPOAllLinesPurchase_Order: TFloatField;
    qryPOAllLinesLine: TIntegerField;
    qryPOAllLinesSuppliers_Desc: TWideStringField;
    qryPOAllLinesInvoice_Quantity: TFloatField;
    qryPOAllLinesOrder_Price: TFloatField;
    qryPOAllLinesProduct_Type: TIntegerField;
    qryPOAllLinesOrder_Unit: TIntegerField;
    qryPOAllLinesSupp_Inv_Recd: TWideStringField;
    qryPOAllLinesSupplier_Name: TWideStringField;
    qryPOAllLinesBranch_Name: TWideStringField;
    qryPOAllLinesStatus_Description: TWideStringField;
    qryPOAllLinesVat_Rate: TFloatField;
    qryPOAllLinesSupplier_Vat_Code: TIntegerField;
    qryPOAllLinesCurrency_Code: TIntegerField;
    qryPOAllLinesPrice_Unit_Factor: TFloatField;
    qryPOAllLinesDate_Point: TDateTimeField;
    qryPOAllLinesCustomer_Name: TWideStringField;
    qryPOAllLinesPOLine: TWideStringField;
    dsPOLine: TDataSource;
    dsDummy: TDataSource;
    qrySILine: TFDQuery;
    qryGetPO: TFDQuery;
    qryGetPurchOrdL: TFDQuery;
    qryGetJB: TFDQuery;
    qrySIAllLines: TFDQuery;
    qrySIAddHeader: TFDQuery;
    qrySIUpHeader: TFDQuery;
    qryZero: TFDQuery;
    qrySIGetLast: TFDQuery;
    qrySIAddCharge: TFDQuery;
    qrySIAddLine: TFDQuery;
    qryGetVat: TFDQuery;
    qryGetPriceUnit: TFDQuery;
    qryPOLine: TFDQuery;
    qryGetInvStatus: TFDQuery;
    qryPOLineChgs: TFDQuery;
    qryJBAllLines: TFDQuery;
    dsJBLine: TDataSource;
    qryJBLine: TFDQuery;
    qryCheckPIN: TFDQuery;
    qryPOUpLine: TFDQuery;
    qryJBUpLine: TFDQuery;
    qrySIUpStatus: TFDQuery;
    qrySIUpLineStatus: TFDQuery;
    qryPOUpLineStatus: TFDQuery;
    qrySIGetAllStatus: TFDQuery;
    qryPOAllLinesQuantity: TFloatField;
    qryPOAllLinesPrice_Unit_Description: TWideStringField;
    qryPurchAll: TFDQuery;
    dsPurchOrd: TDataSource;
    qryPurchHead: TFDQuery;
    qryPurchLines: TFDQuery;
    qryPurchChgs: TFDQuery;
    qryPurchUpLine: TFDQuery;
    qryPurchChkStatus: TFDQuery;
    qryPurchUpStatus: TFDQuery;
    qryPCHeaderGrid: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField1: TWideStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField2: TWideStringField;
    StringField3: TWideStringField;
    StringField4: TWideStringField;
    StringField5: TWideStringField;
    dsPCHeaderGrid: TDataSource;
    qryPCHeaderGridInvoice_or_Credit: TWideStringField;
    qryPCHeaderGridGoods_Value_Diff: TCurrencyField;
    qryPCHeaderGridVAT_Value_Diff: TCurrencyField;
    qryPCHeaderGridGoods_Credit: TCurrencyField;
    qryPCHeaderGridVAT_Credit: TCurrencyField;
    qryPOLinePInvs: TFDQuery;
    qryJBLinePInvs: TFDQuery;
    qryProdType: TFDQuery;
    qryPOsSalesInvd: TFDQuery;
    qryPOsSalesInvdPurchase_Order: TFloatField;
    qryPOsSalesInvdLine: TIntegerField;
    qryPOsSalesInvdDate_Point: TDateTimeField;
    qryPOsSalesInvdSuppliers_Desc: TWideStringField;
    qryPOsSalesInvdInvoice_Quantity: TFloatField;
    qryPOsSalesInvdQuantity: TFloatField;
    qryPOsSalesInvdOrder_Price: TCurrencyField;
    qryPOsSalesInvdProduct_Type: TIntegerField;
    qryPOsSalesInvdOrder_Unit: TIntegerField;
    qryPOsSalesInvdSupp_Inv_Recd: TWideStringField;
    qryPOsSalesInvdSupplier_Name: TWideStringField;
    qryPOsSalesInvdBranch_Name: TWideStringField;
    qryPOsSalesInvdStatus_Description: TWideStringField;
    qryPOsSalesInvdVat_Rate: TFloatField;
    qryPOsSalesInvdSupplier_Vat_Code: TIntegerField;
    qryPOsSalesInvdCurrency_Code: TIntegerField;
    qryPOsSalesInvdPrice_Unit_Description: TWideStringField;
    qryPOsSalesInvdPrice_Unit_Factor: TFloatField;
    qryPOsSalesInvdCustomer_Name: TWideStringField;
    qryPOsSalesInvdPOLine: TWideStringField;
    qrySIHeaderGridPONum: TWideStringField;
    qrySelInvPOs: TFDQuery;
    qrySIPurchOrdLines: TFDQuery;
    qrySIHeaderGridtot_val: TFloatField;
    qrySIHeaderGridtot_invoices: TFloatField;
    qryGetPOInvs: TFDQuery;
    qryGetJBInvs: TFDQuery;
    qryGetPurchLineInvs: TFDQuery;
    qryPOsDeliv: TFDQuery;
    qryPOsDelivPurchase_Order: TFloatField;
    qryPOsDelivLine: TIntegerField;
    qryPOsDelivDate_Point: TDateTimeField;
    qryPOsDelivSuppliers_Desc: TWideStringField;
    qryPOsDelivInvoice_Quantity: TFloatField;
    qryPOsDelivQuantity: TFloatField;
    qryPOsDelivOrder_Price: TCurrencyField;
    qryPOsDelivProduct_Type: TIntegerField;
    qryPOsDelivOrder_Unit: TIntegerField;
    qryPOsDelivSupp_Inv_Recd: TWideStringField;
    qryPOsDelivSupplier_Name: TWideStringField;
    qryPOsDelivBranch_Name: TWideStringField;
    qryPOsDelivStatus_Description: TWideStringField;
    qryPOsDelivVat_Rate: TFloatField;
    qryPOsDelivSupplier_Vat_Code: TIntegerField;
    qryPOsDelivCurrency_Code: TIntegerField;
    qryPOsDelivPrice_Unit_Description: TWideStringField;
    qryPOsDelivPrice_Unit_Factor: TFloatField;
    qryPOsDelivCustomer_Name: TWideStringField;
    qryPOsDelivPOLine: TWideStringField;
    qryPOsDelivNeeds_Authorising: TWideStringField;
    qryPOsSalesInvdNeeds_Authorising: TWideStringField;
    qryPOAllLinesNeeds_Authorising: TWideStringField;
    qryGetOperator: TFDQuery;
    qryPOsSalesInvdOn_Hold: TWideStringField;
    qryPOsSalesInvdAuthorised_By: TIntegerField;
    qryPOsDelivOn_Hold: TWideStringField;
    qryPOsDelivAuthorised_By: TIntegerField;
    qryPOAllLinesOn_Hold: TWideStringField;
    qryPOAllLinesAuthorised_By: TIntegerField;
    qryPCHeaderGridOrig_Supplier_Invoice_no: TWideStringField;
    qryCheckSInvoice: TFDQuery;
    qryPassSInvoice: TFDQuery;
    qryUpPOPIStatus: TFDQuery;
    qryPCHeaderGridAccount_Code: TWideStringField;
    qrySIHeaderGridAccount_Code: TWideStringField;
    qryGetSupplier: TFDQuery;
    qryPOsDelivJob_Bag: TIntegerField;
    qryPOAllLinesJob_Bag: TIntegerField;
    qryPOsSalesInvdJob_Bag: TIntegerField;
    qryPOAllLinesSales_Invoice_no: TWideStringField;
    qryPOAllLinesInvoice_Date: TDateTimeField;
    qryPOsSalesInvdSales_Invoice_No: TWideStringField;
    qryPOsSalesInvdInvoice_Date: TDateTimeField;
    qryPOsDelivSales_Invoice_no: TWideStringField;
    qryPOsDelivInvoice_Date: TDateTimeField;
    qrySIHeaderGridSales_Invoice_No: TWideStringField;
    qryGetPOInvoice: TFDQuery;
    qryPOsDelivPurch_Ord_Line_Status: TIntegerField;
    qryPOsSalesInvdPurch_Ord_Line_Status: TIntegerField;
    qryPOAllLinesPurch_Ord_Line_Status: TIntegerField;
    qrySIHeaderGridDate_Created: TDateTimeField;
    qrySIHeaderGridNew_Date: TWideStringField;
    qryPCHeaderGridDate_Created: TDateTimeField;
    qryPCHeaderGridNew_Date: TWideStringField;
    qryPOAllLinesCust_Order_No: TWideStringField;
    qryPOsSalesInvdCust_Order_No: TWideStringField;
    qryPOsDelivCust_Order_No: TWideStringField;
    procedure qryPOAllLinesPOLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryPOsSalesInvdPOLineGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySIHeaderGridPONumGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dsSIHeaderGridDataChange(Sender: TObject; Field: TField);
    procedure qrySIHeaderGridCalcFields(DataSet: TDataSet);
    procedure qryPOsDelivPOLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qrySIHeaderGridSales_Invoice_NoGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPCHeaderGridCalcFields(DataSet: TDataSet);
  private
    tempOrderType: string;
    tempPONum: string;
    function GetCurrentSInvoice: integer;
    function GetHeaderCount: integer;
    function GetNextSINumber: integer;
    function GetCreditHeaderCount: integer;
    function GetCurrentCreditNote: integer;
    function GetPONumList: String;
    procedure CalcTotalGoodsVal(InvNo: integer; var goodsVal,
      vatVal: double);
    procedure GetPurchOrdExtChrgValue(purchOrd: integer; var ChrgVal,
      VatVal: currency);
    procedure GetTotalPurchOrdLineValue(purchOrd, line: integer;
      var OrderVal, VatVal: currency);
    procedure CalcTotalInvoiceValue(InvNo: integer; var InvoiceVal, InvoiceVAT: double);
    procedure GetTotalPOInvoiceValue(tempcode: real; templine: integer;
      var OrderVal, VatVal: currency);
    procedure GetTotalJBLineInvoiceValue(tempcode: integer; templine: integer;
      var OrderVal, VatVal: currency);
    procedure GetTotalPurchOrdLineInvoiceValue(tempcode: integer; templine: integer;
      var OrderVal, VatVal: currency);
  public
    IncludeZeroValuePO: bytebool;
    DisplayArchived: bytebool;
    Supplier: string;
    SupplierName: string;
    JBNumber: integer;
    PONumber: real;
    PurchNumber: integer;
    Line: integer;
    InvoiceQty: integer;
    PINumber: integer;
    SortType: string;
    SortOrder: string;
    property PONumList: String read GetPONumList;
    property CurrentSInvoice : integer read GetCurrentSInvoice;
    property CurrentCreditNote : integer read GetCurrentCreditNote;
    function CanPassInvoices: boolean;
    function GetDefPriceUnit: integer;
    function GetDefCurrency: integer;
    function GetPUnitDescription(tempCode: integer): string;
    function GetPUnitFactor(tempCode: integer): integer;
    function GetDefPurchNominal: string;
    function GetDefNominalLevel: string;
    function GetDefProdTypNom(TempCode: integer): string;
    function GetVATRate(tempCode: integer): real;
    function GetAccountCode(tempCode, tempBranch: integer): string;
    function GetPurchOrdNumber(tempcode: integer): string;
    function GetPurchPart(tempCode, tempLine: integer): string;
    function GetSupplierAddress(tempSupp, tempBranch: integer): string;
    function GetSupplierVatCode(tempCode: integer): integer;
    function GetInvoiceStatus(tempcode: integer): string;
    function GetTotalJBLineValue(tempcode: integer; templine:integer): currency; overload;
    procedure GetTotalJBLineValue(tempcode, templine: integer; var OrderVal, VatVal: currency); overload;
    function GetTotalPurchLineValue(tempcode: real;
      templine: integer): currency;
    function GetTotalOrderValue(tempcode: real; templine: integer): currency; overload;
    procedure GetTotalOrderValue(tempcode: real; templine: integer; var OrderVal, VatVal: currency); overload;
    function GetTotalPInvoiceValue(tempcode: real; templine, tempInvoice:integer): currency;
    function GetTotalPInvoiceJBValue(tempcode: integer; templine, tempInvoice:integer): currency;
    property HeaderCount: integer read GetHeaderCount;
    property CreditHeaderCount: integer read GetCreditHeaderCount;
    procedure RefreshData;
    procedure RefreshPOData;
    procedure RefreshJBData;
    procedure RefreshPurchData;
    procedure RefreshCreditData;
    procedure SaveStatusAll(Tempold, TempNew: integer; InvType: string);
  end;

  TSuppInvoice  = class;

  TSuppInvoiceLine = class
  private
    FVatCode: integer;
    FPriceUnitFactor: integer;
    FSILine: integer;
    FPOLine: integer;
    FPriceUnit: integer;
    FVATRate: real;
    FQuantity: real;
    FPONumber: real;
    FNominal: string;
    FDeliveryNote: string;
    FPriceUnitDescr: string;
    FDeliveryDate: TDateTime;
    FParent: TSuppInvoice;
    FGoodsValue: currency;
    FDescription: string;
    FJBNumber: integer;
    FPurchLine: integer;
    FJBLine: integer;
    FPurchNumber: integer;
    FOriginalQty: real;
    FPackQty: integer;
    FOriginalSI: integer;
    FOriginalSILine: integer;
    FTotalOrderValue: currency;
    FTotalPInvoiceValue: currency;
    FCreditType: string;
    FVatValue: real;
    function GetTotalGoods: currency;
    function GetPackQty(tempCode, tempLine: integer): integer;
    function GetJBDescription(tempCode: integer; tempLine: integer): string;
    function GetPODescription(tempCode: real; tempLine: integer): string;
    function GetPurchDescription(tempCode: integer; tempLine: integer): string;
    procedure SetDeliveryDate(const Value: TDateTime);
    procedure SetDeliveryNote(const Value: string);
    procedure SetNominal(const Value: string);
    procedure SetParent(const Value: TSuppInvoice);
    procedure SetPOLine(const Value: integer);
    procedure SetPONumber(const Value: real);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDescr(const Value: string);
    procedure SetPriceUnitFactor(const Value: integer);
    procedure SetQuantity(const Value: real);
    procedure SetSILine(const Value: integer);
    procedure SetVatCode(const Value: integer);
    procedure SetVATRate(const Value: real);
    procedure SetGoodsValue(const Value: currency);
    procedure SetDescription(const Value: string);
    procedure SetJBLine(const Value: integer);
    procedure SetJBNumber(const Value: integer);
    procedure SetPurchLine(const Value: integer);
    procedure SetPurchNumber(const Value: integer);
    procedure SetOriginalQty(const Value: real);
    procedure SetPackQty(const Value: integer);
    procedure SetOriginalSI(const Value: integer);
    procedure SetOriginalSILine(const Value: integer);
    procedure SetTotalOrderValue(const Value: currency);
    procedure SetTotalPInvoiceValue(const Value: currency);
    procedure SetCreditType(const Value: string);
    procedure SetVatValue(const Value: real);
  public
    constructor Create(SuppInvoice : TSuppInvoice);
    destructor Destroy; override;
    function Clone : TSuppInvoiceLine;
    procedure LoadFromDB;
    procedure SaveStatus(TempCode: integer);
    procedure SaveToDB;
    procedure SavetoPO;
    procedure SavetoJB;
    procedure SavetoPurch;
    property DeliveryNote: string read FDeliveryNote write SetDeliveryNote;
    property DeliveryDate: TDateTime read FDeliveryDate write SetDeliveryDate;
    property Description: string read FDescription write SetDescription;
    property GoodsValue: currency read FGoodsValue write SetGoodsValue;
    property CreditType: string read FCreditType write SetCreditType;
    property JBNumber: integer read FJBNumber write SetJBNumber;
    property JBLine: integer read FJBLine write SetJBLine;
    property Nominal: string read FNominal write SetNominal;
    property OriginalSI: integer read FOriginalSI write SetOriginalSI;
    property OriginalSILine: integer read FOriginalSILine write SetOriginalSILine;
    property PackQty: integer read FPackQty write SetPackQty;
    property Parent: TSuppInvoice read FParent write SetParent;
    property PONumber: real read FPONumber write SetPONumber;
    property POLine: integer read FPOLine write SetPOLine;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDescr: string read FPriceUnitDescr write SetPriceUnitDescr;
    property PriceUnitFactor: integer read FPriceUnitFactor write SetPriceUnitFactor;
    property PurchNumber: integer read FPurchNumber write SetPurchNumber;
    property PurchLine: integer read FPurchLine write SetPurchLine;
    property Quantity: real read FQuantity write SetQuantity;
    property OriginalQty: real read FOriginalQty write SetOriginalQty;
    property SILine: integer read FSILine write SetSILine;
    property TotalGoods: currency read GetTotalGoods;
    property TotalOrderValue: currency read FTotalOrderValue write SetTotalOrderValue;
    property TotalPInvoiceValue: currency read FTotalPInvoiceValue write SetTotalPInvoiceValue;
    property VatCode: integer read FVatCode write SetVatCode;
    property VATRate: real read FVATRate write SetVATRate;
    property VatValue: real read FVatValue write SetVatValue;
  end;

  TSuppInvoiceLines  = class;

  TSuppInvoiceChg = class
  private
    FAmount: currency;
    FVATCode: integer;
    FSICharge: integer;
    FVATRate: real;
    FDetails: string;
    FNominal: string;
    FParent: TSuppInvoice;
    FPOLine: integer;
    FPONumber: real;
    procedure SetAmount(const Value: currency);
    procedure SetDetails(const Value: string);
    procedure SetNominal(const Value: string);
    procedure SetParent(const Value: TSuppInvoice);
    procedure SetSICharge(const Value: integer);
    procedure SetVATCode(const Value: integer);
    procedure SetVATRate(const Value: real);
    procedure SetPOLine(const Value: integer);
    procedure SetPONumber(const Value: real);
  public
    constructor Create(SuppInvoice : TSuppInvoice);
    destructor Destroy; override;
    function Clone : TSuppInvoiceChg;
    procedure LoadFromDB;
    procedure SaveToDB;
    property Amount: currency read FAmount write SetAmount;
    property Details: string read FDetails write SetDetails;
    property Nominal: string read FNominal write SetNominal;
    property Parent: TSuppInvoice read FParent write SetParent;
    property SICharge: integer read FSICharge write SetSICharge;
    property VATCode: integer read FVATCode write SetVATCode;
    property VATRate: real read FVATRate write SetVATRate;
    property PONumber: real read FPONumber write SetPONumber;
    property POLine: integer read FPOLine write SetPOLine;
  end;

  TSuppInvoiceChgs   = class
  private
    FParent: TSuppInvoice;
    FItems : TList;
    function GetCount: integer;
    function GetItems(Index: integer): TSuppInvoiceChg;
    procedure SetItems(Index: integer; const Value: TSuppInvoiceChg);
  public
    constructor Create(SuppInvoice : TSuppInvoice);
    destructor Destroy; override;
    procedure Add(aLine : TSuppInvoiceChg);
    procedure Clear;
    function  Clone : TSuppInvoiceChgs;
    procedure Delete(const Index : integer);
    function  IndexOf(const LineNumber: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TSuppInvoiceChg read GetItems write SetItems;
      default;
    property Parent : TSuppInvoice read FParent;
  end;

  TSuppInvoiceLines = class
  private
    FParent: TSuppInvoice;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TSuppInvoiceLine;
    procedure SetItems(Index: integer; const Value: TSuppInvoiceLine);
  public
    constructor Create(SuppInvoice : TSuppInvoice);
    destructor Destroy; override;
    procedure Add(aLine : TSuppInvoiceLine);
    procedure Clear;
    function  Clone : TSuppInvoiceLines;
    procedure Delete(const Index : integer);
    function  IndexOf(const LineNumber: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TSuppInvoiceLine read GetItems write SetItems;
      default;
    property Parent : TSuppInvoice read FParent;
  end;

  TSuppInvoice = class
  private
    FSupplier: integer;
    FCurrencyCode: integer;
    FdbKey: integer;
    FSIStatus: integer;
    FBranch: integer;
    FBranchName: string;
    FSINumber: string;
    FSIStatusDesc: string;
    FPIReference: string;
    FSupplierName: string;
    FSIDate: TDateTime;
    FDataModule: TdmSupplierInvoice;
    FSuppInvoiceLines: TSuppInvoiceLines;
    FSuppInvoiceChgs: TSuppInvoiceChgs;
    FInvoiceorCredit: string;
    FOperator: integer;
    FAccountCode: string;
    FInactive: string;
    FVATValue: currency;
    FGoodsValue: currency;
    FOriginalSINumber: string;
    FQueryThisInvoice: boolean;
    FDateCreated: TDateTime;
    procedure DeleteLineCharges;
    procedure DeleteCharges;
    procedure DeleteLines;
    function GetDiffGoods: currency;
    function GetDiffVAT: currency;
    function GetMultiplier: integer;
    function GetTotalGoods: currency;
    function GetTotalVAT: currency;
    procedure SaveCharges;
    procedure SaveCreditLines;
    procedure SaveLines;
    procedure SaveLineStatus(TempCode: integer);
    procedure SetBranch(const Value: integer);
    procedure SetBranchName(const Value: string);
    procedure SetCurrencyCode(const Value: integer);
    procedure SetdbKey(const Value: integer);
    procedure SetPIReference(const Value: string);
    procedure SetSIDate(const Value: TDateTime);
    procedure SetSINumber(const Value: string);
    procedure SetSIStatus(const Value: integer);
    procedure SetSIStatusDesc(const Value: string);
    procedure SetSupplier(const Value: integer);
    procedure SetSupplierName(const Value: string);
    procedure SetInvoiceorCredit(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetAccountCode(const Value: string);
    procedure SetInactive(const Value: string);
    procedure SetGoodsValue(const Value: currency);
    procedure SetVATValue(const Value: currency);
    procedure SetOriginalSINumber(const Value: string);
    procedure SetQueryThisInvoice(const Value: boolean);
    procedure SetDateCreated(const Value: TDateTime);
  public
    constructor Create(DataModule : TdmSupplierInvoice);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TSuppInvoice;
    function CheckPIN(TempCode: integer; TempRef: string): string;
    function CheckSInvoice(TempCode, TempBranch: integer; TempRef: string): string;
    function PassSInvoice(TempCode, TempBranch: integer; TempRef: string): string;
    function POExtraCharges(tempPO: real): currency;
    procedure DeleteFromDB;
    procedure LoadCreditFromPI;
    procedure LoadCreditLinesFromPI;
    procedure LoadCreditChargesFromPI;
    procedure LoadFromDB;
    procedure LoadFromPO;
    procedure LoadFromJB;
    procedure LoadFromPurch;
    procedure LoadCharges;
    procedure LoadLines;
    procedure LoadJBLines;
    procedure LoadPOLines;
    procedure LoadPOLineCharges;
    procedure LoadJBLineCharges;
    procedure LoadPurchLines;
    procedure LoadPurchCharges;
    procedure AddPOLineCharges(PONum: double; line: integer);
    procedure SaveToDB(TempAll: boolean);
    procedure SaveCreditToDB(TempAll: boolean);
    procedure SaveStatus(TempCode: integer);
    property AccountCode: string read FAccountCode write SetAccountCode;
    property Branch: integer read FBranch write SetBranch;
    property BranchName: string read FBranchName write SetBranchName;
    property Charges : TSuppInvoiceChgs read FSuppInvoiceChgs;
    property CurrencyCode: integer read FCurrencyCode write SetCurrencyCode;
    property DataModule: TdmSupplierInvoice read FDataModule;
    property DateCreated: TDateTime read FDateCreated write SetDateCreated;
    property dbKey: integer read FdbKey write SetdbKey;
    property GoodsValue: currency read FGoodsValue write SetGoodsValue;
    property VATValue: currency read FVATValue write SetVATValue;
    property Inactive: string read FInactive write SetInactive;
    property InvoiceorCredit: string read FInvoiceorCredit write SetInvoiceorCredit;
    property Lines : TSuppInvoiceLines read FSuppInvoiceLines;
    property Multiplier: integer read GetMultiplier;
    property Operator: integer read FOperator write SetOperator;
    property OriginalSINumber: string read FOriginalSINumber write SetOriginalSINumber;
    property PIReference: string read FPIReference write SetPIReference;
    property QueryThisInvoice: boolean read FQueryThisInvoice write SetQueryThisInvoice;
    property SIDate: TDateTime read FSIDate write SetSIDate;
    property SINumber: string read FSINumber write SetSINumber;
    property SIStatus: integer read FSIStatus write SetSIStatus;
    property SIStatusDesc: string read FSIStatusDesc write SetSIStatusDesc;
    property Supplier: integer read FSupplier write SetSupplier;
    property SupplierName: string read FSupplierName write SetSupplierName;
    property DiffGoods: currency read GetDiffGoods;
    property DiffVAT: currency read GetDiffVAT;
    property TotalGoods: currency read GetTotalGoods;
    property TotalVAT: currency read GetTotalVAT;
  end;

var
  dmSupplierInvoice: TdmSupplierInvoice;

implementation

uses pbMainMenu;

const

UpdatePOSQL =
  'UPDATE Purchase_Orderline '+
  'SET Supp_inv_recd = ''N'', '+
  '    Qty_Supp_inv_pend = Qty_supp_inv_pend - supplier_invoice_line.Qty_Invoiced '+
  'FROM Supplier_Invoice_Line '+
  'WHERE Supplier_Invoice_Line.Supplier_Invoice = :Supplier_Invoice and '+
	'((supplier_invoice_line.Purchase_order = purchase_orderline.purchase_order) and '+
	'(supplier_invoice_line.line = purchase_orderline.line)) and '+
	'((supplier_invoice_line.credit_type = ''Q'') or (supplier_invoice_line.credit_type = '''')) and '+
  ' supplier_invoice_line.purchase_order is not NULL ';

UpdatePurchOrdSQL =
  'UPDATE Purch_Ord_line '+
  'SET Supp_inv_recd = ''N'', '+
  '    Qty_Supp_Inv = 0, '+
  '    Qty_Supp_Inv_Pend = 0 '+
  'FROM Supplier_Invoice_Line '+
  'WHERE Supplier_Invoice_Line.Supplier_Invoice = :Supplier_Invoice and '+
  ' supplier_invoice_line.purchase_order is not NULL ';

StockSQL =  'select supplier_invoice_line.purchase_order, '+
            'purch_ord.purch_ord_no as purch_ord, '+
            'supplier_invoice_line.Job_Bag '+
            'from supplier_invoice_line left join purch_ord '+
            'on supplier_invoice_line.purch_ord = purch_ord.purch_ord '+
            'where supplier_invoice_line.supplier_invoice = :SInv '+
            'order by supplier_invoice_line.Invoice_Line_No ';

NonStockSQL =
            'select supplier_invoice_line.purchase_order, '+
            'supplier_invoice_line.Job_Bag '+
            'from supplier_invoice_line '+
            'where supplier_invoice_line.supplier_invoice = :SInv '+
            'order by supplier_invoice_line.Invoice_Line_No ';

{$R *.DFM}

{ TSuppInvoice }

procedure TSuppInvoice.AddPOLineCharges(PONum: double; line: integer);
var
  aLine : TsuppInvoiceChg;
begin
  with FDataModule.qryPOLineChgs do
  begin
    Close;
    ParamByName('Purchase_Order').Asfloat := PONum;
    ParamByName('Line').Asinteger := line;
    Open;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceChg.Create(Self);
      aLine.SICharge := aLine.Parent.Charges.Count + 1;
      aLine.Details := fieldbyname('Details').asstring;
      aLine.Amount := fieldbyname('Amount').asfloat;
      aLine.Nominal := dmSupplierInvoice.GetDefPurchNominal;
      aLine.VATCode := fieldbyname('Vat_Code').asinteger;
      aLine.VATRate := fieldbyname('Vat_Rate').asfloat;
      FSuppInvoiceChgs.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

function TSuppInvoice.CheckPIN(TempCode: integer; TempRef: string): string;
begin
  result := '';
  with FDataModule.qryCheckPIN do
    begin
      close;
      parambyname('Supplier_Invoice').asinteger := TempCode;
      parambyname('Supp_inv_alt_ref').asstring := TempRef;
      open;
      if recordcount > 0 then
        begin
          result := 'The PIN Number entered has been used on supplier invoice '+
                    fieldbyname('Supplier_invoice_no').asstring + ' for supplier ' +
                    fieldbyname('Name').asstring;
        end;
    end;
end;

function TSuppInvoice.CheckSInvoice(TempCode, TempBranch: integer; TempRef: string): string;
begin
  result := '';
  with FDataModule.qryCheckSInvoice do
    begin
      close;
      parambyname('Supplier').asinteger := TempCode;
      parambyname('Branch_no').asinteger := TempBranch;
      parambyname('Supplier_invoice_no').asstring := TempRef;
      open;
      if (recordcount > 0) and (fieldbyname('supp_invoice_status').asinteger = 15) then
        begin
          result := 'The supplier invoice associated with this credit note is flagged as a query, do you want to pass the invoice?';
        end;
    end;
end;

function TSuppInvoice.PassSInvoice(TempCode, TempBranch: integer; TempRef: string): string;
begin
  result := '';
  with FDataModule.qryPassSInvoice do
    begin
      close;
      parambyname('Supplier').asinteger := TempCode;
      parambyname('Branch_no').asinteger := TempBranch;
      parambyname('Supplier_invoice_no').asstring := TempRef;
      execsql;
    end;
end;

procedure TSuppInvoice.Clear;
begin
  Supplier :=       0;
  SupplierName :=   '';
  SIDate :=           0;
  FSuppInvoiceLines.Clear;
  FSuppInvoiceChgs.Clear;
end;

function TSuppInvoice.Clone: TSuppInvoice;
begin
  Result := TSuppInvoice.Create(FDataModule);
  Result.AccountCode :=         Self.AccountCode;
  Result.Branch :=              Self.Branch;
  Result.BranchName :=          Self.BranchName;
  Result.CurrencyCode :=        Self.CurrencyCode;
  Result.DateCreated  :=        self.DateCreated;
  Result.Supplier :=            Self.Supplier;
  Result.SupplierName :=        Self.SupplierName;
  Result.dbKey :=               Self.dbKey;
  Result.GoodsValue :=          Self.GoodsValue;
  Result.VATValue :=            Self.VATValue;
  Result.Inactive :=            Self.Inactive;
  Result.InvoiceOrCredit :=     Self.InvoiceOrCredit;
  Result.Operator :=            Self.Operator;
  Result.OriginalSINumber :=    Self.OriginalSINumber;
  Result.QueryThisInvoice :=    Self.QueryThisInvoice;
  Result.SIDate :=              Self.SIDate;
  Result.SINumber :=            Self.SINumber;
  Result.SIStatus :=            Self.SIStatus;
  Result.SIStatusDesc :=        Self.SIStatusDesc;
  Result.FSuppInvoiceLines.Free;
  Result.FSuppInvoiceLines :=  Self.FSuppInvoiceLines.Clone;
  Result.FSuppInvoiceChgs.Free;
  Result.FSuppInvoiceChgs :=   Self.FSuppInvoiceChgs.Clone;
end;

constructor TSuppInvoice.Create(DataModule: TdmSupplierInvoice);
begin
  FDataModule := DataModule;
  FSuppInvoiceLines := TSuppInvoiceLines.Create(Self);
  FSuppInvoiceChgs := TSuppInvoiceChgs.Create(Self);
end;

procedure TSuppInvoice.DeleteCharges;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Supplier_Invoice_Charge WHERE Supplier_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSuppInvoice.DeleteFromDB;
var
  i: integer;
begin
  DeleteCharges;
  DeleteLineCharges;
  DeleteLines;
  for i := 0 to Pred(FSuppInvoiceLines.Count) do
    begin
      if FSuppInvoiceLines[i].JBNumber <> 0 then
        FSuppInvoiceLines[i].SaveToJB
      else
      if FSuppInvoiceLines[i].PONumber <> 0 then
        FSuppInvoiceLines[i].SaveToPO
      else
      if FSuppInvoiceLines[i].PurchNumber <> 0 then
        FSuppInvoiceLines[i].SaveToPurch;
    end;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Supplier_Invoice WHERE Supplier_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSuppInvoice.DeleteLineCharges;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Supp_Inv_Line_Add_Chg WHERE Supplier_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TSuppInvoice.DeleteLines;
begin
  DeleteLineCharges;
  {Reset purchase_orderline details}
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.text := UpdatePOSQL;
    Parambyname('Supplier_Invoice').asinteger := dbKey;
    ExecSQL;
  end;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Supplier_Invoice_Line WHERE Supplier_Invoice =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

destructor TSuppInvoice.Destroy;
begin
  FSuppInvoiceLines.Free;
  FSuppInvoiceChgs.Free;
  inherited;
end;

function TSuppInvoice.GetDiffGoods: currency;
begin
  result := GoodsValue - TotalGoods;
end;

function TSuppInvoice.GetDiffVAT: currency;
begin
  result := VatValue - TotalVAT;
end;

function TSuppInvoice.GetMultiplier: integer;
begin
  if InvoiceorCredit = 'C' then
    result := -1
  else
    result := 1;
end;

function TSuppInvoice.GetTotalGoods: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FSuppInvoiceLines.Count) do
    begin
      if FSuppInvoiceLines[i].PriceUnitFactor = 0 then
        Result := Result + FSuppInvoiceLines[i].GoodsValue
      else
        Result := Result + ((FSuppInvoiceLines[i].Quantity / FSuppInvoiceLines[i].PriceUnitFactor)
                           * FSuppInvoiceLines[i].GoodsValue)
    end;

  for i := 0 to Pred(FSuppInvoiceChgs.Count) do
    begin
      Result := Result + FSuppInvoiceChgs[i].Amount;
    end;
end;

function TSuppInvoice.GetTotalVAT: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FSuppInvoiceLines.Count) do
    begin
      if FSuppInvoiceLines[i].VATValue <> 0.00 then
        Result := Result + (FSuppInvoiceLines[i].VatValue)
      else
        Result := Result + (FSuppInvoiceLines[i].TotalGoods * (FSuppInvoiceLines[i].VATRate / 100.00))
    end;

  for i := 0 to Pred(FSuppInvoiceChgs.Count) do
    begin
      Result := Result + (FSuppInvoiceChgs[i].Amount * (FSuppInvoiceChgs[i].VATRate / 100.00))
    end;
end;

procedure TSuppInvoice.LoadCharges;
var
  aLine : TsuppInvoiceChg;
begin
  FSuppInvoiceChgs.Clear;
  with FDataModule.qrySIAllCharges do
  begin
    Close;
    ParamByName('Supplier_Invoice').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceChg.Create(Self);
      aLine.SICharge := fieldbyname('Additional_Charge').asinteger;
      aLine.Details := fieldbyname('Details').asstring;
      aLine.Amount := fieldbyname('Amount').asfloat * Multiplier;
      aLine.Nominal := FieldByName('Nominal').AsString;
      aLine.VATCode := fieldbyname('Vat_Code').asinteger;
      aLine.VATRate := fieldbyname('Vat_Rate').asfloat;
      aLine.PONumber := fieldbyname('Purchase_Order').asfloat;
      aLine.POLine := fieldbyname('Line').asinteger;
      FSuppInvoiceChgs.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSuppInvoice.LoadCreditChargesFromPI;
var
  aLine : TsuppInvoiceChg;
begin
  FSuppInvoiceChgs.Clear;
  with FDataModule.qrySIAllCharges do
  begin
    Close;
    ParamByName('Supplier_Invoice').AsInteger := dmSupplierInvoice.PINumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceChg.Create(Self);
      aLine.SICharge := fieldbyname('Additional_Charge').asinteger;
      aLine.Details := fieldbyname('Details').asstring;
      aLine.Amount := fieldbyname('Amount').asfloat;
      aLine.Nominal := FieldByName('Nominal').AsString;
      aLine.VATCode := fieldbyname('Vat_Code').asinteger;
      aLine.VATRate := fieldbyname('Vat_Rate').asfloat;
      aLine.PONumber := fieldbyname('Purchase_Order').asfloat;
      aLine.POLine := fieldbyname('Line').asinteger;
      FSuppInvoiceChgs.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSuppInvoice.LoadCreditFromPI;
begin
  { Load the header record then all lines belonging to this supplier invoice }
  Clear;
  with FDataModule.qrySIHeader do
  begin
    Close;
    ParamByName('Supplier_Invoice').AsInteger := dmSupplierInvoice.PINumber;
    Open;
    AccountCode :=         FieldbyName('Account_Code').asstring;
    Branch :=              FieldByName('Branch_No').AsInteger;
    BranchName :=          FieldByName('Branch_Name').Asstring;
    CurrencyCode :=        FieldByName('Currency_Code').AsInteger;
    GoodsValue :=          FieldByName('Goods_Value').asfloat;
    VATValue :=            FieldByName('VAT_Value').asfloat;
    Supplier :=            FieldByName('Supplier').AsInteger;
    SupplierName :=        FieldByName('Supplier_Name').AsString;
    SIDate :=              date;
    SINumber :=            '';
    SIStatus :=            10;
    SIStatusDesc :=        dmSupplierInvoice.GetInvoiceStatus(10);
    PIReference :=         '';
    InvoiceorCredit :=     'C';
    OriginalSINumber :=    FieldByName('Supplier_invoice_no').Asstring;
    Close;
  end;
  LoadCreditLinesFromPI;
  LoadCreditChargesFromPI;
end;

procedure TSuppInvoice.LoadCreditLinesFromPI;
var
  aLine : TsuppInvoiceLine;
begin
  FsuppInvoiceLines.Clear;
  with FDataModule.qrySIAllLines do
  begin
    Close;
    ParamByName('Supplier_Invoice').AsInteger := dmSupplierInvoice.PINumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceLine.Create(Self);
      aLine.SILine := FieldByName('Invoice_Line_no').AsInteger;
      aLine.PONumber := FieldByName('Purchase_order').Asfloat;
      aLine.POLine := FieldByName('Line').Asinteger;
      aLine.Quantity := FieldByName('Qty_Invoiced').Asinteger;
      aLine.OriginalSI := FieldByName('Supplier_invoice').Asinteger;
      aLine.OriginalSILine := FieldByName('Invoice_Line_no').Asinteger;
      aLine.OriginalQty := FieldByName('Qty_Invoiced').Asinteger;
      aLine.GoodsValue := FieldByName('Goods_Value').Asfloat;
      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatValue := 0.00;
      aLine.PriceUnit := FieldByName('Price_Unit').Asinteger;
      aLine.PriceUnitDescr := FieldByName('Price_Unit_Description').AsString;
      aLine.PriceUnitFactor := FieldByName('Price_Unit_Factor').Asinteger;
      aLine.DeliveryNote := FieldByName('Delivery_Note_no').AsString;
      aLine.DeliveryDate := FieldByName('Delivery_Date').Asdatetime;
      aLine.Nominal := FieldByName('Nominal').AsString;
      aLine.JBNumber := FieldByName('Job_Bag').Asinteger;
      aLine.JBLine := FieldByName('Job_Bag_Line').Asinteger;
      aLine.PurchNumber := FieldByName('Purch_ord').Asinteger;
      aLine.PurchLine := FieldByName('Purch_Ord_Line_no').Asinteger;
      aLine.creditType := 'P';
      if aLine.JBNumber <> 0 then
        begin
        aLine.Description := aLine.GetJBDescription(aLine.JBNumber, aLine.JBLine);
        aLine.PackQty := 1;
        end
      else
      if aLine.PONumber <> 0 then
        begin
        aLine.Description := aLine.GetPODescription(aLine.PONumber, aLine.POLine);
        aLine.PackQty := 1;
        end
      else
        begin
        aLine.Description := aLine.GetPurchDescription(aLine.PurchNumber, aLine.PurchLine);
        aLine.PackQty := aLine.GetPackQty(aLine.PurchNumber, aLine.PurchLine);
        end;
      FSuppInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSuppInvoice.LoadFromDB;
begin
  { Load the header record then all lines belonging to this supplier invoice }
  Clear;
  with FDataModule.qrySIHeader do
  begin
    Close;
    ParamByName('Supplier_Invoice').AsInteger := DbKey;
    Open;
    AccountCode :=         FieldbyName('Account_Code').asstring;
    Branch :=              FieldByName('Branch_No').AsInteger;
    BranchName :=          FieldByName('Branch_Name').Asstring;
    CurrencyCode :=        FieldByName('Currency_Code').AsInteger;
(*    GoodsValue :=          FieldByName('Goods_Value').asfloat;
    VATValue :=            FieldByName('VAT_Value').asfloat;
*)
    DateCreated :=         fieldbyname('Date_Created').asdatetime;
    Supplier :=            FieldByName('Supplier').AsInteger;
    SupplierName :=        FieldByName('Supplier_Name').AsString;
    SIDate :=              FieldByName('Invoice_Date').Asdatetime;
    SINumber :=            FieldByName('Supplier_invoice_no').Asstring;
    SIStatus :=            FieldByName('Supp_invoice_Status').AsInteger;
    SIStatusDesc :=        FieldByName('Status_Description').Asstring;
    QueryThisInvoice :=    false;
    PIReference :=         FieldByName('Supp_inv_Alt_Ref').Asstring;
    InvoiceorCredit :=     FieldByName('Invoice_or_credit').asstring;
    if InvoiceorCredit = '' then
      InvoiceorCredit := 'I';

    GoodsValue :=          FieldByName('Goods_Value').asfloat * Multiplier;
    VATValue :=            FieldByName('VAT_Value').asfloat * Multiplier;
    OriginalSINumber :=    FieldByName('Orig_Supplier_invoice_no').asstring;
    Operator :=            FieldByName('Operator').asinteger;
    Close;
  end;
  LoadLines;
  LoadCharges;
end;

procedure TSuppInvoice.LoadFromJB;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qryJBLine do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger := dmSupplierInvoice.JBNumber;
    ParamByName('Job_Bag_Line').Asinteger := dmSupplierInvoice.Line;
    Open;
//    dbKey :=               0;
    AccountCode :=         FieldByName('Account_code').asstring;
    Branch :=              FieldByName('Branch_No').AsInteger;
    BranchName :=          FieldByName('Branch_Name').Asstring;
    CurrencyCode :=        FieldByName('Currency_Code').AsInteger;
    Supplier :=            FieldByName('Supplier').AsInteger;
    SupplierName :=        FieldByName('Supplier_Name').AsString;
    InvoiceOrCredit :=     'I';
//    InvoiceDescription :=  FieldByName('Customers_Desc').Asstring;
//    Operator :=            PBMenuMainFrm.iOperator;
    SIDate :=              date;
    SIStatus :=            10;
    SIStatusDesc :=        dmSupplierInvoice.GetInvoiceStatus(10);
    QueryThisInvoice :=    false;
    Close;
  end;
  LoadJBLines;
  GoodsValue := TotalGoods;
  VATValue := TotalVAT;
end;

procedure TSuppInvoice.LoadFromPO;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qryPOLine do
  begin
    Close;
    ParamByName('Purchase_Order').Asfloat := dmSupplierInvoice.PONumber;
    ParamByName('Line').Asinteger := dmSupplierInvoice.Line;
    Open;
//    dbKey :=               0;
    AccountCode :=         FieldByName('Account_code').asstring;
    Branch :=              FieldByName('Branch_No').AsInteger;
    BranchName :=          FieldByName('Branch_Name').Asstring;
    CurrencyCode :=        FieldByName('Currency_Code_Def').AsInteger;
    if CurrencyCode = 0 then
      CurrencyCode := dmSupplierInvoice.GetDefCurrency;

    Supplier :=            FieldByName('Supplier').AsInteger;
    SupplierName :=        FieldByName('Supplier_Name').AsString;
    InvoiceOrCredit :=     'I';
//    InvoiceDescription :=  FieldByName('Customers_Desc').Asstring;
//    Operator :=            PBMenuMainFrm.iOperator;
    SIDate :=              date;
    SIStatus :=            10;
    SIStatusDesc :=        dmSupplierInvoice.GetInvoiceStatus(10);
    QueryThisInvoice :=    false;
    Close;
  end;
  LoadPOLines;
  LoadPOLineCharges;

  GoodsValue := TotalGoods;
  VATValue := TotalVAT;
end;

procedure TSuppInvoice.LoadFromPurch;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qryPurchHead do
  begin
    Close;
    ParamByName('Purch_Ord').Asinteger := dmSupplierInvoice.PurchNumber;
    Open;
//    dbKey :=               0;
    AccountCode :=         FieldByName('Account_code').asstring;
    Branch :=              FieldByName('Branch_No').AsInteger;
    BranchName :=          FieldByName('Branch_Name').Asstring;
    CurrencyCode :=        FieldByName('Currency_Code').AsInteger;
    Supplier :=            FieldByName('Supplier').AsInteger;
    SupplierName :=        FieldByName('Supplier_Name').AsString;
    InvoiceOrCredit :=     'I';
//    Operator :=            PBMenuMainFrm.iOperator;
    SIDate :=              date;
    SIStatus :=            10;
    SIStatusDesc :=        dmSupplierInvoice.GetInvoiceStatus(10);
    QueryThisInvoice :=    false;
    Close;
  end;
  LoadPurchLines;
  LoadPurchCharges;
  GoodsValue := TotalGoods;
  VATValue := TotalVAT;
end;

procedure TSuppInvoice.LoadJBLineCharges;
begin

end;

procedure TSuppInvoice.LoadJBLines;
var
  aLine : TsuppInvoiceLine;
begin
  FsuppInvoiceLines.Clear;
  with FDataModule.qryJBLine do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger := dmSupplierInvoice.JBNumber;
    ParamByName('Job_bag_Line').Asinteger := dmSupplierInvoice.Line;
    Open;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceLine.Create(Self);
      aLine.SILine := aLine.Parent.Lines.Count + 1;
      aLine.Description := fieldbyname('Job_Bag_Line_Descr').asstring;
      aLine.PONumber := 0;
      aLine.POLine := 0;
      aLine.Quantity := fieldbyname('Job_Bag_Quantity').asinteger;
      aLine.OriginalQty := 0;
      aLine.PackQty := 1;
      aLine.GoodsValue := FieldByName('Job_Bag_Line_Cost').Asfloat;
      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatValue := 0.00;
      aLine.PriceUnit := dmSupplierInvoice.GetDefPriceUnit;
      aLine.PriceUnitDescr := dmSupplierInvoice.GetPUnitDescription(aLine.PriceUnit);
      aLine.PriceUnitFactor := dmSupplierInvoice.GetPUnitFactor(aLine.PriceUnit);
      aLine.Nominal := dmSupplierInvoice.GetDefPurchNominal;
      aLine.JBNumber := FieldByName('Job_Bag').Asinteger;
      aLine.JBLine := Fieldbyname('Job_Bag_Line').asinteger;
      aLine.TotalOrderValue := aLine.parent.datamodule.GetTotalJBLineValue(FieldByName('Job_Bag').Asinteger,
                                                        FieldByName('Job_Bag_Line').asinteger);
      aLine.TotalPInvoiceValue := aLine.Parent.datamodule.GetTotalPinvoiceJBValue(FieldByName('Job_Bag').Asinteger,
                                                        FieldByName('Job_Bag_Line').asinteger, dbKey);
      aLine.PurchNumber := 0;
      aLine.PurchLine := 0;
      aLine.CreditType := '';
      FSuppInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSuppInvoice.LoadLines;
var
  aLine : TsuppInvoiceLine;
begin
  FsuppInvoiceLines.Clear;
  with FDataModule.qrySIAllLines do
  begin
    Close;
    ParamByName('Supplier_Invoice').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceLine.Create(Self);
      aLine.SILine := FieldByName('Invoice_Line_no').AsInteger;
      aLine.PONumber := FieldByName('Purchase_order').Asfloat;
      aLine.POLine := FieldByName('Line').Asinteger;
      aLine.CreditType := FieldByName('Credit_Type').Asstring;
      aLine.Quantity := FieldByName('Qty_Invoiced').Asinteger * Multiplier;
      aLine.OriginalQty := FieldByName('Qty_Invoiced').Asinteger * Multiplier;
      aLine.OriginalSI := fieldbyname('Original_Supplier_invoice').asinteger;
      aLine.OriginalSILine := fieldbyname('Original_invoice_line').asinteger;
      aLine.GoodsValue := FieldByName('Goods_Value').Asfloat * Multiplier;
      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatValue := FieldByName('VAT_Value').asfloat * Multiplier;
      aLine.PriceUnit := FieldByName('Price_Unit').Asinteger;
      aLine.PriceUnitDescr := FieldByName('Price_Unit_Description').AsString;
      aLine.PriceUnitFactor := FieldByName('Price_Unit_Factor').Asinteger;
      aLine.DeliveryNote := FieldByName('Delivery_Note_no').AsString;
      aLine.DeliveryDate := FieldByName('Delivery_Date').Asdatetime;
      aLine.Nominal := FieldByName('Nominal').AsString;
      aLine.JBNumber := FieldByName('Job_Bag').Asinteger;
      aLine.JBLine := FieldByName('Job_Bag_Line').Asinteger;
      aLine.PurchNumber := FieldByName('Purch_ord').Asinteger;
      aLine.PurchLine := FieldByName('Purch_Ord_Line_no').Asinteger;
      aLine.TotalOrderValue := 0.00;
      if aLine.JBNumber <> 0 then
        begin
        aLine.Description := aLine.GetJBDescription(aLine.JBNumber, aLine.JBLine);
        aLine.PackQty := 1;
        aLine.TotalOrderValue := aLine.Parent.datamodule.GetTotalJBLineValue(aLine.JBNumber, aLine.JBLine);
        aLine.TotalPInvoiceValue := aLine.Parent.datamodule.GetTotalPinvoiceJBValue(aLine.JBNumber, aLine.JBLine, dbKey);
        end
      else
      if aLine.PONumber <> 0 then
        begin
        aLine.Description := aLine.GetPODescription(aLine.PONumber, aLine.POLine);
        aLine.PackQty := 1;
        aLine.TotalOrderValue := aLine.Parent.datamodule.GetTotalOrderValue(aLine.PONumber, aLine.POLine);
        aLine.TotalPInvoiceValue := aLine.Parent.datamodule.GetTotalPinvoiceValue(aLine.PONumber, aLine.POLine, dbKey);
        end
      else
        begin
        aLine.Description := aLine.GetPurchDescription(aLine.PurchNumber, aLine.PurchLine);
        aLine.PackQty := aLine.GetPackQty(aLine.PurchNumber, aLine.PurchLine);
        end;
      FSuppInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSuppInvoice.LoadPOLineCharges;
var
  aLine : TsuppInvoiceChg;
begin
  FSuppInvoiceChgs.Clear;
  with FDataModule.qryPOLineChgs do
  begin
    Close;
    ParamByName('Purchase_Order').Asfloat := dmSupplierInvoice.PONumber;
    ParamByName('Line').Asinteger := dmSupplierInvoice.Line;
    Open;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceChg.Create(Self);
      aLine.SICharge := aLine.Parent.Charges.Count + 1;
      aLine.Details := fieldbyname('Details').asstring;
      aLine.Amount := fieldbyname('Amount').asfloat;
      aLine.Nominal := dmSupplierInvoice.GetDefPurchNominal;
      aLine.VATCode := fieldbyname('Vat_Code').asinteger;
      aLine.VATRate := fieldbyname('Vat_Rate').asfloat;
      aLine.PONumber := fieldbyname('Purchase_Order').asfloat;
      aLine.POLine := fieldbyname('Line').asinteger;
      FSuppInvoiceChgs.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSuppInvoice.LoadPOLines;
var
  aLine : TsuppInvoiceLine;
  defnom : String;
begin
  FsuppInvoiceLines.Clear;
  with FDataModule.qryPOLine do
  begin
    Close;
    ParamByName('Purchase_Order').Asfloat := dmSupplierInvoice.PONumber;
    ParamByName('Line').Asinteger := dmSupplierInvoice.Line;
    Open;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceLine.Create(Self);
      aLine.SILine := aLine.Parent.Lines.Count + 1;
      aLine.Description := fieldbyname('Suppliers_Desc').asstring;
      aLine.PONumber := FieldByName('Purchase_order').Asfloat;
      aLine.POLine := FieldByName('Line').Asinteger;
      aLine.Quantity := dmSupplierInvoice.InvoiceQty;
      aLine.OriginalQty := 0;
      aLine.PackQty := 1;
      aLine.GoodsValue := FieldByName('Order_Price').Asfloat;
      aLine.PriceUnit := FieldByName('Order_Unit').Asinteger;
      aLine.PriceUnitDescr := FieldByName('Price_Unit_Description').AsString;
      aLine.PriceUnitFactor := FieldByName('Price_Unit_Factor').Asinteger;
      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatValue := 0.00;
      DefNom := dmSupplierInvoice.GetDefNominalLevel;
      If DefNom = 'PRODTYPE' then
          aLine.Nominal := dmSupplierInvoice.GetDefProdTypNom(FieldByName('Product_Type').AsInteger)
      else
        aLine.Nominal := dmSupplierInvoice.GetDefPurchNominal;
      aLine.JBNumber := 0;
      aLine.JBLine := 0;
      aLine.PurchNumber := 0;
      aLine.PurchLine := 0;
      aLine.CreditType := '';
      aLine.TotalOrderValue := aLine.parent.datamodule.GetTotalOrderValue(FieldByName('Purchase_Order').Asfloat,
                                                        FieldByName('Line').asinteger);
      aLine.TotalPInvoiceValue := aLine.Parent.datamodule.GetTotalPinvoiceValue(FieldByName('Purchase_Order').Asfloat,
                                                        FieldByName('Line').asinteger, dbKey);
      FSuppInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSuppInvoice.LoadPurchCharges;
var
  aLine : TsuppInvoiceChg;
begin
  FSuppInvoiceChgs.Clear;
  with FDataModule.qryPurchChgs do
  begin
    Close;
    ParamByName('Purch_Ord').Asinteger := dmSupplierInvoice.PurchNumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceChg.Create(Self);
      aLine.SICharge := aLine.Parent.Charges.Count + 1;
      aLine.Details := fieldbyname('Details').asstring;
      aLine.Amount := fieldbyname('Amount').asfloat;
      aLine.Nominal := dmSupplierInvoice.GetDefPurchNominal;
      aLine.VATCode := fieldbyname('Vat_Code').asinteger;
      aLine.VATRate := fieldbyname('Vat_Rate').asfloat;
      aLine.PONumber := 0;
      aLine.POLine := 0;
      FSuppInvoiceChgs.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSuppInvoice.LoadPurchLines;
var
  aLine : TsuppInvoiceLine;
begin
  FsuppInvoiceLines.Clear;
  with FDataModule.qryPurchLines do
  begin
    Close;
    ParamByName('Purch_Ord').Asinteger := dmSupplierInvoice.PurchNumber;
    Open;
    while not(EOF) do
    begin
      aLine := TSuppInvoiceLine.Create(Self);
      aLine.SILine := aLine.Parent.Lines.Count + 1;
      aLine.Description := fieldbyname('Part').asstring + ' - ' + fieldbyname('Part_Description').asstring;
      aLine.PONumber := 0;
      aLine.POLine := 0;
      aLine.Quantity := fieldbyname('Qty_To_Invoice').asinteger;
      aLine.OriginalQty := 0;
      aLine.PackQty := fieldbyname('Purch_Pack_Quantity').asinteger;
      aLine.GoodsValue := (FieldByName('Purchase_Price').Asfloat/aLine.PackQty);
//      aLine.VatCode := FieldByName('VAT_Code').Asinteger;
//      aLine.VatRate := FieldByName('VAT_Rate').Asfloat;
      aLine.VatCode := dmSupplierInvoice.GetSupplierVatCode(self.Supplier);
      aLine.VatRate := dmSupplierInvoice.GetVATRate(aLine.VatCode);
      aLine.VatValue := 0.00;
      aLine.PriceUnit := dmSupplierInvoice.GetDefPriceUnit;
      aLine.PriceUnitDescr := dmSupplierInvoice.GetPUnitDescription(aLine.PriceUnit);
      aLine.PriceUnitFactor := dmSupplierInvoice.GetPUnitFactor(aLine.PriceUnit);
      If fieldByName('Purchase_Nominal').AsString = '' then
        aLine.Nominal := dmSupplierInvoice.GetDefPurchNominal
      else
        aLine.Nominal := FieldByName('Purchase_Nominal').AsString;
      aLine.JBNumber := 0;
      aLine.JBLine := 0;
      aLine.CreditType := '';
      aLine.PurchNumber := dmSupplierInvoice.PurchNumber;
      aLine.PurchLine := fieldbyname('Purch_Ord_line_no').asinteger;
      FSuppInvoiceLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSuppInvoice.SaveCharges;
var
  i : integer;
begin
  { When saving, we have to delete all Additional charge records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteCharges;  { Get rid of any already in database }
  FSuppInvoiceChgs.Renumber;
  for i := 0 to Pred(FSuppInvoiceChgs.Count) do
    FSuppInvoiceChgs[i].SaveToDB;
end;

procedure TSuppInvoice.SaveCreditLines;
var
  i : integer;
begin
  { When saving, we have to delete all line records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteLines;  { Get rid of any already in database }
  FSuppInvoiceLines.Renumber;
  for i := 0 to Pred(FSuppInvoiceLines.Count) do
    begin
      FSuppInvoiceLines[i].SaveToDB;
      if FSuppInvoiceLines[i].CreditType <> 'Q' then
        continue;
      if FSuppInvoiceLines[i].JBNumber <> 0 then
        FSuppInvoiceLines[i].SaveToJB
      else
      if FSuppInvoiceLines[i].PONumber <> 0 then
        FSuppInvoiceLines[i].SaveToPO
      else
      if FSuppInvoiceLines[i].PurchNumber <> 0 then
        FSuppInvoiceLines[i].SaveToPurch;
    end;
end;

procedure TSuppInvoice.SaveCreditToDB(TempAll: boolean);
begin
  if DbKey = 0 then
    begin
      DbKey := FDataModule.GetNextSINumber;
      with FDataModule.qrySIAddHeader do
        begin
          ParamByName('Supplier_Invoice').AsInteger := DbKey;
          ParambyName('Invoice_Date').asdatetime := SIDate;
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Supplier').AsInteger := Supplier;
          ParamByName('Goods_Value').Asfloat := GoodsValue * -1;
          ParamByName('Vat_Value').Asfloat := VATValue * -1;
          ParambyName('Supplier_Invoice_no').asstring := SINumber;
          ParamByName('Supp_invoice_Status').AsInteger := SIStatus;
          if CurrencyCode = 0 then
            ParamByName('Currency_Code').clear
          else
            ParamByName('Currency_Code').AsInteger := CurrencyCode;
          ParamByName('Invoice_or_Credit').Asstring := InvoiceOrCredit;
          Parambyname('Supp_inv_Alt_ref').asstring := PIReference;
          Parambyname('Goods_Value_Diff').asfloat := DiffGoods * -1;
          Parambyname('VAT_Value_Diff').asfloat := DiffVAT * -1;
          Parambyname('Orig_Supplier_invoice_no').asstring := OriginalSINumber;
          if Operator = 0 then
            Parambyname('Operator').clear
          else
            Parambyname('Operator').asinteger := Operator;
          Parambyname('Date_Created').asdatetime := now;

          ExecSQL;
        end;
    end
  else
  if TempAll then
    begin
      with FDataModule.qrySIUpHeader do
        begin
          ParamByName('Supplier_Invoice').AsInteger := DbKey;
          ParambyName('Invoice_Date').asdatetime := SIDate;
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Supplier').AsInteger := Supplier;
          ParamByName('Goods_Value').Asfloat := GoodsValue * -1;
          ParamByName('Vat_Value').Asfloat := VatValue * -1;
          ParambyName('Supplier_Invoice_no').asstring := SINumber;
          ParamByName('Supp_invoice_Status').AsInteger := SIStatus;
          if CurrencyCode = 0 then
            ParamByName('Currency_Code').clear
          else
            ParamByName('Currency_Code').AsInteger := CurrencyCode;

          ParamByName('Invoice_or_Credit').Asstring := InvoiceOrCredit;
          Parambyname('Supp_inv_Alt_ref').asstring := PIReference;
          Parambyname('Goods_Value_Diff').asfloat := DiffGoods * -1;
          Parambyname('VAT_Value_Diff').asfloat := DiffVAT * -1;
          Parambyname('Orig_Supplier_invoice_no').asstring := OriginalSINumber;
          if Operator = 0 then
            Parambyname('Operator').clear
          else
            Parambyname('Operator').asinteger := Operator;
          ExecSQL;
        end
    end;
  SaveCreditLines;
  SaveCharges;
end;

procedure TSuppInvoice.SaveLines;
var
  i : integer;
begin
  { When saving, we have to delete all line records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteLines;  { Get rid of any already in database }
  FSuppInvoiceLines.Renumber;
  for i := 0 to Pred(FSuppInvoiceLines.Count) do
    begin
      FSuppInvoiceLines[i].SaveToDB;
      if FSuppInvoiceLines[i].JBNumber <> 0 then
        FSuppInvoiceLines[i].SaveToJB
      else
      if FSuppInvoiceLines[i].PONumber <> 0 then
        FSuppInvoiceLines[i].SaveToPO
      else
      if FSuppInvoiceLines[i].PurchNumber <> 0 then
        FSuppInvoiceLines[i].SaveToPurch;
    end;

end;

procedure TSuppInvoice.SaveLineStatus(TempCode: integer);
var
  i: integer;
begin
  for i := 0 to Pred(FSuppInvoiceLines.Count) do
    FSuppInvoiceLines[i].SaveStatus(TempCode);

end;

procedure TSuppInvoice.SaveStatus(TempCode: integer);
begin
  with FDataModule.qrySIUpStatus do
  begin
    Close;
    ParamByName('Supplier_Invoice').AsInteger := dbKey;
    ParamByName('Supp_invoice_Status').AsInteger := TempCode;
    ExecSQL;
  end;
  SaveLineStatus(TempCode);
end;

procedure TSuppInvoice.SaveToDB(TempAll: boolean);
begin
  if DbKey = 0 then
    begin
      DbKey := FDataModule.GetNextSINumber;
      with FDataModule.qrySIAddHeader do
        begin
          ParamByName('Supplier_Invoice').AsInteger := DbKey;
          ParambyName('Invoice_Date').asdatetime := SIDate;
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Supplier').AsInteger := Supplier;
          ParamByName('Goods_Value').Asfloat := GoodsValue;
          ParamByName('Vat_Value').Asfloat := VATValue;
          ParambyName('Supplier_Invoice_no').asstring := SINumber;
          ParamByName('Supp_invoice_Status').AsInteger := SIStatus;
          if CurrencyCode = 0 then
            ParamByName('Currency_Code').clear
          else
            ParamByName('Currency_Code').AsInteger := CurrencyCode;
          ParamByName('Invoice_or_Credit').Asstring := InvoiceOrCredit;
          Parambyname('Supp_inv_Alt_ref').asstring := PIReference;
          Parambyname('Goods_Value_Diff').asfloat := DiffGoods;
          Parambyname('VAT_Value_Diff').asfloat := DiffVAT;
          Parambyname('Orig_Supplier_invoice_no').asstring := OriginalSINumber;
          Parambyname('Date_Created').asdatetime := now;

          if Operator = 0 then
            Parambyname('Operator').clear
          else
            Parambyname('Operator').asinteger := Operator;
          ExecSQL;
        end;
    end
  else
  if TempAll then
    begin
      with FDataModule.qrySIUpHeader do
        begin
          ParamByName('Supplier_Invoice').AsInteger := DbKey;
          ParambyName('Invoice_Date').asdatetime := SIDate;
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Supplier').AsInteger := Supplier;
          ParamByName('Goods_Value').Asfloat := GoodsValue;
          ParamByName('Vat_Value').Asfloat := VatValue;
          ParambyName('Supplier_Invoice_no').asstring := SINumber;
          ParamByName('Supp_invoice_Status').AsInteger := SIStatus;
          if CurrencyCode = 0 then
            ParamByName('Currency_Code').clear
          else
            ParamByName('Currency_Code').AsInteger := CurrencyCode;

          ParamByName('Invoice_or_Credit').Asstring := InvoiceOrCredit;
          Parambyname('Supp_inv_Alt_ref').asstring := PIReference;
          Parambyname('Goods_Value_Diff').asfloat := DiffGoods;
          Parambyname('VAT_Value_Diff').asfloat := DiffVAT;
          Parambyname('Orig_Supplier_invoice_no').asstring := OriginalSINumber;
          if Operator = 0 then
            Parambyname('Operator').clear
          else
            Parambyname('Operator').asinteger := Operator;
          ExecSQL;
        end
    end;
  SaveLines;
  SaveCharges;
end;

procedure TSuppInvoice.SetAccountCode(const Value: string);
begin
  FAccountCode := Value;
end;

procedure TSuppInvoice.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TSuppInvoice.SetBranchName(const Value: string);
begin
  FBranchName := Value;
end;

procedure TSuppInvoice.SetCurrencyCode(const Value: integer);
begin
  FCurrencyCode := Value;
end;

procedure TSuppInvoice.SetdbKey(const Value: integer);
begin
  FdbKey := Value;
end;

procedure TSuppInvoice.SetGoodsValue(const Value: currency);
begin
  FGoodsValue := Value;
end;

procedure TSuppInvoice.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TSuppInvoice.SetInvoiceorCredit(const Value: string);
begin
  FInvoiceorCredit := Value;
end;

procedure TSuppInvoice.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TSuppInvoice.SetOriginalSINumber(const Value: string);
begin
  FOriginalSINumber := Value;
end;

procedure TSuppInvoice.SetPIReference(const Value: string);
begin
  FPIReference := Value;
end;

procedure TSuppInvoice.SetQueryThisInvoice(const Value: boolean);
begin
  FQueryThisInvoice := Value;
end;

procedure TSuppInvoice.SetSIDate(const Value: TDateTime);
begin
  FSIDate := Value;
end;

procedure TSuppInvoice.SetSINumber(const Value: string);
begin
  FSINumber := Value;
end;

procedure TSuppInvoice.SetSIStatus(const Value: integer);
begin
  FSIStatus := Value;
end;

procedure TSuppInvoice.SetSIStatusDesc(const Value: string);
begin
  FSIStatusDesc := Value;
end;

procedure TSuppInvoice.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TSuppInvoice.SetSupplierName(const Value: string);
begin
  FSupplierName := Value;
end;

procedure TSuppInvoice.SetVATValue(const Value: currency);
begin
  FVATValue := Value;
end;

function TSuppInvoice.POExtraCharges(tempPO: real): currency;
var
  i: integer;
begin
  result := 0;
  for i := 0 to Pred(FSuppInvoiceChgs.Count) do
    begin
      if tempPO = FSuppInvoiceChgs[i].PONumber then
        result := result + FSuppInvoiceChgs[i].Amount;
    end;
end;

procedure TSuppInvoice.SetDateCreated(const Value: TDateTime);
begin
  FDateCreated := Value;
end;

{ TSuppInvoiceLines }

procedure TSuppInvoiceLines.Add(aLine: TSuppInvoiceLine);
begin
  FItems.Add(aLine);
end;

procedure TSuppInvoiceLines.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSuppInvoiceLine(FItems[i]).Free;
end;

function TSuppInvoiceLines.Clone: TSuppInvoiceLines;
var
  i : integer;
begin
  Result := TSuppInvoiceLines.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TSuppInvoiceLine(FItems[i]).Clone);
end;

constructor TSuppInvoiceLines.Create(SuppInvoice: TSuppInvoice);
begin
  FParent := SuppInvoice;
  FItems := TList.Create;
end;

procedure TSuppInvoiceLines.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TSuppInvoiceLines.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSuppInvoiceLine(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TSuppInvoiceLines.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TSuppInvoiceLines.GetItems(Index: integer): TSuppInvoiceLine;
begin
  Result := TSuppInvoiceLine(FItems[Index]);
end;

function TSuppInvoiceLines.IndexOf(const LineNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TSuppInvoiceLine(FItems[i]).SILine = LineNumber then
      Result := i;
end;

procedure TSuppInvoiceLines.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSuppInvoiceLine(FItems[i]).SILine:= (i+1);
end;

procedure TSuppInvoiceLines.SetItems(Index: integer;
  const Value: TSuppInvoiceLine);
begin

end;

{ TSuppInvoiceLine }

function TSuppInvoiceLine.Clone: TSuppInvoiceLine;
begin
  Result := TSuppInvoiceLine.Create(FParent);
  Result.CreditType :=        Self.CreditType;
  Result.DeliveryNote :=     Self.DeliveryNote;
  Result.DeliveryDate :=      Self.DeliveryDate;
  Result.JBNumber :=          Self.JBNumber;
  Result.JBLine :=            Self.JBLine;
  Result.Nominal  :=          Self.Nominal;
  Result.PackQty :=           Self.PackQty;
  Result.PONumber  :=         Self.PONumber;
  Result.POLine  :=           Self.POLine;
  Result.PriceUnit  :=        Self.PriceUnit;
  Result.PriceUnitDescr  :=   Self.PriceUnitDescr;
  Result.PriceUnitFactor  :=  Self.PriceUnitFactor;
  Result.PurchNumber :=       Self.PurchNumber;
  Result.PurchLine :=         Self.PurchLine;
  Result.Quantity  :=         Self.Quantity;
  Result.OriginalQty :=       Self.OriginalQty;
  Result.OriginalSI  :=       Self.OriginalSI;
  Result.OriginalSILine  :=   Self.OriginalSILine;
  Result.SILine  :=           Self.SILine;
  Result.SILine  :=           Self.SILine;
  Result.TotalOrderValue :=   Self.TotalOrderValue;
  Result.TotalPInvoiceValue :=   Self.TotalPInvoiceValue;
  Result.VatCode  :=          Self.VatCode;
  Result.VatRate  :=          Self.VatRate;
  Result.VatValue :=          Self.VatValue;
  Result.GoodsValue  :=       Self.GoodsValue;
end;

constructor TSuppInvoiceLine.Create(SuppInvoice: TSuppInvoice);
begin
  FParent := SuppInvoice;
end;

destructor TSuppInvoiceLine.Destroy;
begin
  inherited;

end;

function TSuppInvoiceLine.GetJBDescription(tempCode,
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

function TSuppInvoiceLine.GetPODescription(tempCode: real;
  tempLine: integer): string;
begin
  result := '';
  with FParent.Datamodule.qryGetPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;
      result := fieldbyname('Suppliers_desc').asstring;
    end;
end;

function TSuppInvoiceLine.GetPackQty(tempCode,
  tempLine: integer): integer;
begin
  with FParent.Datamodule.qryGetPurchOrdL do
    begin
      close;
      parambyname('Purch_Ord').asinteger := tempCode;
      parambyname('Purch_Ord_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Purch_Pack_Quantity').asinteger;
    end;
end;

function TSuppInvoiceLine.GetPurchDescription(tempCode,
  tempLine: integer): string;
begin
  result := '';
  with FParent.Datamodule.qryGetPurchOrdL do
    begin
      close;
      parambyname('Purch_Ord').asinteger := tempCode;
      parambyname('Purch_Ord_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part').asstring + ' - ' + fieldbyname('Part_description').asstring;
    end;
end;

function TSuppInvoiceLine.GetTotalGoods: currency;
begin
  if FPriceUnitFactor = 0 then
    Result := FGoodsValue
  else
    Result := ((FQuantity / FPriceUnitFactor) * FGoodsValue);
end;

procedure TSuppInvoiceLine.LoadFromDB;
begin
  with FParent.FDataModule.qrySILine do
  begin
    Close;
    ParamByName('Supplier_Invoice').AsInteger := FParent.DbKey;
    ParamByName('Invoice_Line_No').AsInteger := SILine;
    Open;
    CreditType := FieldByName('Credit_Type').asstring;
    PONumber := FieldByName('Purchase_order').Asfloat;
    POLine := FieldByName('Line').Asinteger;
    JBNumber := FieldByName('Job_Bag').Asinteger;
    JBLine := FieldByName('Job_Bag_Line').Asinteger;
    PurchNumber := FieldByName('Purch_Order').Asinteger;
    PurchLine := FieldByName('Purch_ord_Line_no').Asinteger;
    Quantity := FieldByName('Qty_Invoiced').Asfloat;
    OriginalQty := FieldByName('Qty_Invoiced').Asfloat;
    if JBNumber <> 0 then
      begin
      Description := GetJBDescription(JBNumber, JBLine);
      PackQty := 1;
      TotalOrderValue := parent.datamodule.GetTotalJBLineValue(JBNumber, JBLine);
      TotalPInvoiceValue := parent.datamodule.GetTotalPInvoiceJBValue(JBNumber, JBLine, parent.dbKey);
      end
    else
    if PONumber <> 0 then
      begin
      Description := GetPODescription(PONumber, POLine);
      PackQty := 1;
      TotalOrderValue := parent.datamodule.GetTotalOrderValue(PONumber, POLine);
      TotalPInvoiceValue := parent.datamodule.GetTotalPInvoiceValue(PONumber, POLine, parent.dbKey);
      end
    else
      begin
      Description := GetPurchDescription(PurchNumber, PurchLine);
      PackQty := GetPackQty(PurchNumber, PurchLine);
      TotalOrderValue := 0.00;
      end;
    GoodsValue := FieldByName('Goods_Value').Asfloat;
    VatCode := FieldByName('VAT_Code').Asinteger;
    VatRate := FieldByName('VAT_Rate').Asfloat;
    PriceUnit := FieldByName('Price_Unit').Asinteger;
    PriceUnitDescr := FieldByName('Price_Unit_Description').Asstring;
    PriceUnitFactor := FieldByName('Price_Unit_Factor').Asinteger;
    Nominal := FieldByName('Nominal').AsString;
    OriginalSI := fieldbyname('Original_Supplier_invoice').asinteger;
    OriginalSILine := fieldbyname('Original_invoice_line').asinteger;
    Close;
  end;
end;

procedure TSuppInvoiceLine.SaveStatus(TempCode: integer);
var
  iMultiplier: integer;
begin
  with FParent.FDataModule.qrySIUpLineStatus do
  begin
    Close;
    ParamByName('Supplier_Invoice').AsInteger := FParent.dbKey;
    ParamByName('Invoice_Line_no').AsInteger := SILine;
    ParamByName('Supp_Invoice_Status').AsInteger := TempCode;
    ExecSQL;
  end;

  if FParent.InvoiceorCredit = 'C' then
    iMultiplier := -1
  else
    iMultiplier := 1;

  if PONumber <> 0 then
    begin
      if (FParent.InvoiceorCredit = 'C') and (self.CreditType = 'P') then exit;

      with FParent.FDataModule.qryPOUpLineStatus do
        begin
          close;
          parambyname('Purchase_order').asfloat := PONumber;
          parambyname('Line').asinteger := POLine;
          if tempcode = 20 then
            parambyname('Qty_Supp_Inv').asfloat := Quantity * iMultiplier
          else
          if tempcode = 10 then
            parambyname('Qty_Supp_Inv').asfloat := (Quantity * -1) * iMultiplier
          else
            parambyname('Qty_Supp_Inv').asfloat := 0;
          execsql;
        end;
    end;
end;

procedure TSuppInvoiceLine.SaveToDB;
begin
  with FParent.FDataModule.qrySIAddLine do
  begin
    ParamByName('Supplier_invoice').AsInteger := FParent.DbKey;
    ParamByName('Invoice_Line_no').AsInteger := SILine;
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
    ParambyName('Credit_Type').asstring := CreditType;
    ParamByName('Qty_Invoiced').Asfloat := Quantity * FParent.Multiplier;
    ParamByName('Goods_Value').Asfloat := GoodsValue * FParent.Multiplier;
    ParamByName('Vat_Code').asinteger := VatCode;
    if CreditType <> 'V' then
        ParamByName('Vat_Value').asfloat := 0.00
    else
        ParamByName('Vat_Value').asFloat := VatValue * fParent.Multiplier;
    ParamByName('Price_Unit').AsInteger := PriceUnit;
    ParamByName('Nominal').AsString := Nominal;
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
    if PurchNumber = 0 then
      begin
        ParamByName('Purch_ord').clear;
        ParamByName('Purch_ord_Line_no').clear;
      end
    else
      begin
        ParamByName('Purch_ord').asinteger := PurchNumber;
        ParamByName('Purch_ord_Line_no').asinteger := PurchLine;
      end;
    ParamByName('Supp_Invoice_Status').asinteger := 10;
    ParamByName('Original_Supplier_Invoice').asinteger := OriginalSI;
    ParamByName('Original_Invoice_Line').asinteger := OriginalSILine;
    ExecSQL;
  end;
end;

procedure TSuppInvoiceLine.SavetoJB;
var
  sTemp: string;
begin
  if FParent.Inactive = 'Y' then
    begin
      if fParent.FInvoiceorCredit = 'C' then
        sTemp := 'Y'
       else
        sTemp := 'N';
    end
  else
    begin
    if fparent.FinvoiceorCredit = 'C' then
      sTemp := 'N'
    else
      sTemp := 'Y';
    end;

  with FParent.FDataModule.qryJBUpLine do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger := JBNumber;
    ParamByName('Job_Bag_Line').AsInteger := JBLine;
    ParamByName('Supp_inv_recd').asstring := sTemp;
    ExecSQL;
  end;
end;

procedure TSuppInvoiceLine.SavetoPO;
begin
  if FParent.Inactive = 'Y' then
    begin
      Quantity := 0;
    end;

  if FParent.InvoiceorCredit = 'C' then
    begin
    if self.CreditType = 'Q' then
      begin
        with FParent.FDataModule.qryPOUpLine do
        begin
          close;
          ParamByName('Purchase_Order').Asfloat := PONumber;
          ParamByName('Line').AsInteger := POLine;
//    ParamByName('Qty_Supp_Inv_Pend').asfloat := ((Quantity - OriginalQty) * fParent.Multiplier);
          ParamByName('Qty_Supp_Inv_Pend').asfloat := (Quantity * fParent.Multiplier);
          ExecSQL;
        end;
      end;
    end
  else
    begin
    if Quantity <> 0 then
      begin
        with FParent.FDataModule.qryPOUpLine do
        begin
          close;
          ParamByName('Purchase_Order').Asfloat := PONumber;
          ParamByName('Line').AsInteger := POLine;
//    ParamByName('Qty_Supp_Inv_Pend').asfloat := ((Quantity - OriginalQty) * fParent.Multiplier);
          ParamByName('Qty_Supp_Inv_Pend').asfloat := (Quantity * fParent.Multiplier);
          ExecSQL;
        end;
      end;
    end;

  with FParent.FDataModule.qryUpPOPIStatus do
  begin
    close;
    ParamByName('Purchase_Order').Asfloat := PONumber;
    ParamByName('Line').AsInteger := POLine;
    execsql;
  end;
end;

procedure TSuppInvoiceLine.SavetoPurch;
var
  iInvoiced, iOrdered, iReceived: integer;
begin
  if FParent.Inactive = 'Y' then
    begin
      Quantity := 0;
    end;

  with FParent.FDataModule.qryPurchUpLine do
  begin
    close;
    ParamByName('Purch_Ord').Asinteger := PurchNumber;
    ParamByName('Purch_ord_Line_no').AsInteger := PurchLine;
    ParamByName('Qty_Invoiced').asfloat := ((Quantity - OriginalQty) * fParent.Multiplier);
//    (Quantity - OriginalQty);
    ExecSQL;
  end;

  with FParent.FDataModule.qryPurchChkStatus do
  begin
    close;
    ParamByName('Purch_Ord').Asinteger := PurchNumber;
    open;
    iInvoiced := fieldbyname('Qty_Invoiced').asinteger;
    iReceived := fieldbyname('Qty_Received').asinteger;
    iOrdered := fieldbyname('Qty_Ordered').asinteger;
  end;

  with FParent.FDataModule.qryPurchUpStatus do
  begin
    close;
    ParamByName('Purch_Ord').Asinteger := PurchNumber;
    if iInvoiced = 0 then
      begin
        if iReceived = iOrdered then
          Parambyname('Purch_Ord_Status').asstring := 'N'  {Fully received}
        else
          Parambyname('Purch_Ord_Status').asstring := 'K'  {Part received}
      end
    else
    if iInvoiced > 0 then
      begin
        if iInvoiced = ireceived then
          Parambyname('Purch_Ord_Status').asstring := 'W'  {Fully invoiced}
        else
          Parambyname('Purch_Ord_Status').asstring := 'U'  {Part Invoiced}
      end
    else
      Parambyname('Purch_Ord_Status').asstring := 'N';  {Fully received}
    execsql;
  end;
end;

procedure TSuppInvoiceLine.SetDeliveryDate(const Value: TDateTime);
begin
  FDeliveryDate := Value;
end;

procedure TSuppInvoiceLine.SetDeliveryNote(const Value: string);
begin
  FDeliveryNote := Value;
end;

procedure TSuppInvoiceLine.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TSuppInvoiceLine.SetGoodsValue(const Value: currency);
begin
  FGoodsValue := Value;
end;

procedure TSuppInvoiceLine.SetJBLine(const Value: integer);
begin
  FJBLine := Value;
end;

procedure TSuppInvoiceLine.SetJBNumber(const Value: integer);
begin
  FJBNumber := Value;
end;

procedure TSuppInvoiceLine.SetNominal(const Value: string);
begin
  FNominal := Value;
end;

procedure TSuppInvoiceLine.SetOriginalQty(const Value: real);
begin
  FOriginalQty := Value;
end;

procedure TSuppInvoiceLine.SetPackQty(const Value: integer);
begin
  FPackQty := Value;
end;

procedure TSuppInvoiceLine.SetParent(const Value: TSuppInvoice);
begin
  FParent := Value;
end;

procedure TSuppInvoiceLine.SetPOLine(const Value: integer);
begin
  FPOLine := Value;
end;

procedure TSuppInvoiceLine.SetPONumber(const Value: real);
begin
  FPONumber := Value;
end;

procedure TSuppInvoiceLine.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TSuppInvoiceLine.SetPriceUnitDescr(const Value: string);
begin
  FPriceUnitDescr := Value;
end;

procedure TSuppInvoiceLine.SetPriceUnitFactor(const Value: integer);
begin
  FPriceUnitFactor := Value;
end;

procedure TSuppInvoiceLine.SetPurchLine(const Value: integer);
begin
  FPurchLine := Value;
end;

procedure TSuppInvoiceLine.SetPurchNumber(const Value: integer);
begin
  FPurchNumber := Value;
end;

procedure TSuppInvoiceLine.SetQuantity(const Value: real);
begin
  FQuantity := Value;
end;

procedure TSuppInvoiceLine.SetSILine(const Value: integer);
begin
  FSILine := Value;
end;

procedure TSuppInvoiceLine.SetVatCode(const Value: integer);
begin
  FVatCode := Value;
end;

procedure TSuppInvoiceLine.SetVATRate(const Value: real);
begin
  FVATRate := Value;
end;

procedure TSuppInvoiceLine.SetOriginalSI(const Value: integer);
begin
  FOriginalSI := Value;
end;

procedure TSuppInvoiceLine.SetOriginalSILine(const Value: integer);
begin
  FOriginalSILine := Value;
end;

procedure TSuppInvoiceLine.SetTotalOrderValue(const Value: currency);
begin
  FTotalOrderValue := Value;
end;

procedure TSuppInvoiceLine.SetTotalPInvoiceValue(const Value: currency);
begin
  FTotalPInvoiceValue := Value;
end;

procedure TSuppInvoiceLine.SetCreditType(const Value: string);
begin
  FCreditType := Value;
end;

procedure TSuppInvoiceLine.SetVatValue(const Value: real);
begin
  FVatValue := Value;
end;

{ TSuppInvoiceChg }

function TSuppInvoiceChg.Clone: TSuppInvoiceChg;
begin
  Result := TSuppInvoiceChg.Create(FParent);
  Result.SICharge :=          Self.SICharge;
  Result.Details :=           Self.Details;
  Result.Amount :=            Self.Amount;
  Result.Nominal :=           Self.Nominal;
  Result.VatCode :=           Self.VatCode;
  Result.VatRate :=           Self.VatRate;
  Result.PONumber :=          Self.PONumber;
  Result.POLine :=            Self.POLine;
end;

constructor TSuppInvoiceChg.Create(SuppInvoice: TSuppInvoice);
begin
  FParent := SuppInvoice;
end;

destructor TSuppInvoiceChg.Destroy;
begin
  inherited;

end;

procedure TSuppInvoiceChg.LoadFromDB;
begin

end;

procedure TSuppInvoiceChg.SaveToDB;
begin
  with FParent.FDataModule.qrySIAddCharge do
  begin
    ParamByName('Supplier_invoice').AsInteger := FParent.DbKey;
    ParamByName('Additional_Charge').AsInteger := SICharge;
    ParamByName('Details').Asstring := Details;
    ParamByName('Amount').Asfloat := Amount * FParent.Multiplier;
    ParamByName('Nominal').Asstring := Nominal;
    ParamByName('Vat_Code').Asinteger := VatCode;
    ParambyName('Purchase_Order').asfloat := PONumber;
    ParambyName('Line').asinteger := POLine;
    ExecSQL;
  end;

end;

procedure TSuppInvoiceChg.SetAmount(const Value: currency);
begin
  FAmount := Value;
end;

procedure TSuppInvoiceChg.SetDetails(const Value: string);
begin
  FDetails := Value;
end;

procedure TSuppInvoiceChg.SetNominal(const Value: string);
begin
  FNominal := Value;
end;

procedure TSuppInvoiceChg.SetParent(const Value: TSuppInvoice);
begin
  FParent := Value;
end;

procedure TSuppInvoiceChg.SetPOLine(const Value: integer);
begin
  FPOLine := Value;
end;

procedure TSuppInvoiceChg.SetPONumber(const Value: real);
begin
  FPONumber := Value;
end;

procedure TSuppInvoiceChg.SetSICharge(const Value: integer);
begin
  FSICharge := Value;
end;

procedure TSuppInvoiceChg.SetVATCode(const Value: integer);
begin
  FVATCode := Value;
end;

procedure TSuppInvoiceChg.SetVATRate(const Value: real);
begin
  FVATRate := Value;
end;

{ TSuppInvoiceChgs }

procedure TSuppInvoiceChgs.Add(aLine: TSuppInvoiceChg);
begin
  FItems.Add(aLine);
end;

procedure TSuppInvoiceChgs.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSuppInvoiceLine(FItems[i]).Free;
end;

function TSuppInvoiceChgs.Clone: TSuppInvoiceChgs;
var
  i : integer;
begin
  Result := TSuppInvoiceChgs.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TSuppInvoiceChg(FItems[i]).Clone);
end;

constructor TSuppInvoiceChgs.Create(SuppInvoice: TSuppInvoice);
begin
  FParent := SuppInvoice;
  FItems := TList.Create;
end;

procedure TSuppInvoiceChgs.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TSuppInvoiceChgs.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSuppInvoiceChg(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TSuppInvoiceChgs.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TSuppInvoiceChgs.GetItems(Index: integer): TSuppInvoiceChg;
begin
  Result := TSuppInvoiceChg(FItems[Index]);
end;

function TSuppInvoiceChgs.IndexOf(const LineNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TSuppInvoiceChg(FItems[i]).SICharge = LineNumber then
      Result := i;
end;

procedure TSuppInvoiceChgs.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TSuppInvoiceChg(FItems[i]).SICharge:= (i+1);
end;

procedure TSuppInvoiceChgs.SetItems(Index: integer;
  const Value: TSuppInvoiceChg);
begin

end;

{ TdmSupplierInvoice }

function TdmSupplierInvoice.GetCurrentSInvoice: integer;
begin
  if qrySIHeaderGrid.RecordCount > 0 then
    Result := qrySIHeaderGrid.FieldByName('Supplier_invoice').AsInteger
  else
    Result := 0;
end;

function TdmSupplierInvoice.GetPurchPart(tempCode: integer; tempLine: integer): string;
begin
  result := '';
  with qryGetPurchOrdL do
    begin
      close;
      parambyname('Purch_Ord').asinteger := tempCode;
      parambyname('Purch_Ord_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part').asstring;
    end;
end;

function TdmSupplierInvoice.GetSupplierAddress(tempSupp: integer; tempBranch: integer): string;
var
  i: integer;
begin
  result := '';
  with qryGetSuppBranch do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      parambyname('Branch_no').asinteger := tempBranch;
      open;
      for i := 1 to 5 do
        begin
          if trim(fields[i].asstring) = '' then continue;
          result := result + trim(fields[i].asstring) + #13#10;
        end;
    end;
end;

function TdmSupplierInvoice.GetAccountCode(tempCode: integer; tempBranch: integer): string;
begin
  result := '';
  with qryGetSuppBranch do
    begin
      close;
      parambyname('Supplier').asinteger := tempCode;
      parambyname('Branch_no').asinteger := tempBranch;
      open;
      result := fieldbyname('Account_code').asstring;
    end;
end;

function TdmSupplierInvoice.GetHeaderCount: integer;
begin
  Result := qrySIHeaderGrid.RecordCount;
end;

function TdmSupplierInvoice.GetCreditHeaderCount: integer;
begin
  Result := qryPCHeaderGrid.RecordCount;
end;

procedure TdmSupplierInvoice.RefreshData;
begin
  with qrySIHeaderGrid do
  begin
    Close;
    ParamByName('Code_From').Asstring := Supplier + '%';
    if DisplayArchived then
      parambyname('Supp_Invoice_Status').asinteger := 30
    else
      parambyname('Supp_Invoice_Status').asinteger := 25;
    paramByName('Match_Status').asinteger := 0 ;

    SQL.Delete(pred(SQL.count));

    if SortOrder = '' then
      SQL.Add('ORDER BY Supplier_Invoice DESC')
    else
      SQL.Add('ORDER BY ' + SortOrder);
    open;
  end;

end;

procedure TdmSupplierInvoice.RefreshPOData;
var
  tempQry: TFDQuery;
begin
  //the datasource has one of two queries as its dataset
  //one shows all purchase orders, the other just shows purchase orders that
  //have at least been part sales invoices raised
  tempQry := dsPOline.dataset as TFDQuery;
  //with tempQry do
  begin
    tempQry.Close;
    if self.IncludeZeroValuePO then
      tempQry.ParamByName('Include_Value').asfloat := 0
    else
      tempQry.ParamByName('Include_Value').asfloat := 0.001;
    tempQry.ParamByName('Code_From').Asstring := '%' + SupplierName + '%';
    tempQry.Open;
    tempQry.First;
  end;
end;

procedure TdmSupplierInvoice.qryPOAllLinesPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPOAllLinesPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryPOAllLinesPurchase_Order.AsFloat,qryPOAllLinesLine.AsInteger);
end;

function TdmSupplierInvoice.GetNextSINumber: integer;
begin
  with qrySIGetLast do
    begin
      close;
      open;
      result := fieldbyname('Last_Supplier_invoice').asinteger + 1;
    end;
end;

function TdmSupplierInvoice.GetPUnitDescription(tempCode: integer): string;
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

function TdmSupplierInvoice.GetPUnitFactor(tempCode: integer): integer;
begin
  with qryGetPriceUnit do
    begin
      close;
      parambyname('Price_UNit').asinteger := tempCode;
      open;
      result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

function TdmSupplierInvoice.GetVATRate(tempCode: integer): real;
begin
  with qryGetVAT do
    begin
      close;
      parambyname('VAT_Code').asinteger := tempCode;
      open;
      result := fieldbyname('VAT_Rate').asfloat;
    end;
end;

function TdmSupplierInvoice.GetInvoiceStatus(tempcode: integer): string;
begin
  result := '';
  with qryGetInvStatus do
    begin
      close;
      parambyname('Supp_invoice_Status').asinteger := tempCode;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

function TdmSupplierInvoice.GetDefPurchNominal: string;
begin
  result := '';
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Purch_nom_Def').asstring;
    end;
end;

procedure TdmSupplierInvoice.RefreshJBData;
begin
  with qryJBAllLines do
  begin
    Close;
    ParamByName('Code_From').Asstring := '%' + SupplierName + '%';
    Open;
    First;
  end;
end;

function TdmSupplierInvoice.GetDefPriceUnit: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Price_unit').asinteger;
    end;
end;

procedure TdmSupplierInvoice.SaveStatusAll(TempOld, TempNew: integer; InvType: string);
var
  key: integer;
  aInvoice: TSuppInvoice;
begin
  with qrySIGetAllStatus do
    begin
      close;
      parambyname('Supp_Invoice_Status').asinteger := TempOld;
      parambyname('Invoice_or_credit').asstring := InvType;
      open;

      first;
      while eof <> true do
        begin
          Key := fieldbyname('Supplier_invoice').asinteger;
          aInvoice := TSuppInvoice.Create(dmSupplierInvoice);
          try
            aInvoice.DbKey := key;
            aInvoice.LoadFromDB;
            aInvoice.SaveStatus(TempNew);
          finally
            aInvoice.free;
          end;
          next;
        end;
    end;

end;

function TdmSupplierInvoice.GetDefCurrency: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Currency_Code_Def').asinteger;
    end;
end;

procedure TdmSupplierInvoice.RefreshPurchData;
begin
  with qryPurchAll do
  begin
    Close;
    ParamByName('Code_From').Asstring := '%' + SupplierName + '%';
    Open;
    First;
  end;
end;

function TdmSupplierInvoice.GetPurchOrdNumber(tempcode: integer): string;
begin
  result := '';
  with qryGetPurchOrd do
    begin
      close;
      parambyname('Purch_Ord').asinteger := tempCode;
      open;
      result := fieldbyname('Purch_ord_no').asstring;
    end;

end;

procedure TdmSupplierInvoice.RefreshCreditData;
begin
  with qryPCHeaderGrid do
  begin
    Close;
    ParamByName('Code_From').Asstring := Supplier + '%';
    if DisplayArchived then
      parambyname('Supp_Invoice_Status').asinteger := 30
    else
      parambyname('Supp_Invoice_Status').asinteger := 25;
    paramByName('Match_Status').asinteger := 0 ;
    open;
  end;

end;

function TdmSupplierInvoice.GetCurrentCreditNote: integer;
begin
  if qryPCHeaderGrid.RecordCount > 0 then
    Result := qryPCHeaderGrid.FieldByName('Supplier_invoice').AsInteger
  else
    Result := 0;
end;

function TdmSupplierInvoice.GetTotalOrderValue(tempcode: real;
  templine: integer): currency;
var
  GoodsValue: real;
begin
  with qryGetPO do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;
      first;
      if fieldbyname('Price_unit_Factor').asinteger = 0 then
        GoodsValue := fieldbyname('Order_price').asfloat
      else
        GoodsValue := ((fieldbyname('Quantity').asinteger / fieldbyname('Price_unit_Factor').asinteger) * fieldbyname('Order_Price').asfloat);
      Result := GoodsValue + fieldbyname('Additional_Charge').asfloat
    end;
end;

function TdmSupplierInvoice.GetTotalPurchLineValue(tempcode: real;
  templine: integer): currency;
begin
  Result := 0.00;
(*  with qryGetPO do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;
      first;
      if fieldbyname('Price_unit_Factor').asinteger = 0 then
        Result := fieldbyname('Order_price').asfloat
      else
        Result := ((fieldbyname('Quantity').asinteger / fieldbyname('Price_unit_Factor').asinteger) * fieldbyname('Order_Price').asfloat);
    end;
*)
end;

function TdmSupplierInvoice.GetTotalPInvoiceValue(tempcode: real; templine,
  tempInvoice: integer): currency;
var
  rTotal: real;
  iMultiplier: integer;
begin
  with qryPOLinePInvs do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      parambyname('Supplier_invoice').asinteger := tempInvoice;
      open;
      first;
      rTotal := 0.00;
      while EOF <> true do
        begin
          if fieldbyname('Price_unit_Factor').asinteger = 0 then
            rTotal := rTotal + fieldbyname('Goods_Value').asfloat
          else
            begin
              if fieldbyname('Qty_Invoiced').asinteger >= 0 then
                iMultiplier := 1
              else
                iMultiplier := -1;

              rTotal := rTotal + ((fieldbyname('Qty_Invoiced').asinteger / (fieldbyname('Price_unit_Factor').asinteger*iMultiplier)) * fieldbyname('Goods_Value').asfloat);
            end;
          rTotal := rTotal + fieldbyname('Total_Charges').asfloat;
          next;
        end;
      result := rTotal;
    end;
end;

function TdmSupplierInvoice.GetTotalJBLineValue(tempcode,
  templine: integer): currency;
begin
  with qryGetJB do
    begin
      close;
      parambyname('Job_bag').asinteger := tempCode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      open;
      first;
      Result := fieldbyname('Job_Bag_Line_Cost').asfloat
    end;
end;

function TdmSupplierInvoice.GetTotalPInvoiceJBValue(tempcode, templine,
  tempInvoice: integer): currency;
var
  rTotal: real;
begin
  with qryJBLinePInvs do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      parambyname('Supplier_invoice').asinteger := tempInvoice;
      open;
      first;
      rTotal := 0.00;
      while EOF <> true do
        begin
          if fieldbyname('Price_unit_Factor').asinteger = 0 then
            rTotal := rTotal + fieldbyname('Goods_Value').asfloat
          else
            rTotal := rTotal + ((fieldbyname('Qty_Invoiced').asinteger / fieldbyname('Price_unit_Factor').asinteger) * fieldbyname('Goods_Value').asfloat);
          next;
        end;
      result := rTotal;
    end;
end;

function TdmSupplierInvoice.GetDefNominalLevel: string;
begin
  result := '';
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Nominal_Level').asstring;
    end;
end;

function TdmSupplierInvoice.GetDefProdTypNom(TempCode: integer): string;
begin
  result := '';
  with qryProdType do
    begin
      close;
      ParamByName('Product_Type').AsInteger := TempCode;
      open;
      result := fieldbyname('Purchase_Nominal').asstring;
      if result = '' then
        result := GetDefPurchNominal;
    end;
end;

procedure TdmSupplierInvoice.qryPOsSalesInvdPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPOsSalesInvdPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryPOsSalesInvdPurchase_Order.AsFloat,qryPOsSalesInvdLine.AsInteger);

end;

procedure TdmSupplierInvoice.qrySIHeaderGridPONumGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  tempStr: string;
  theField: TField;
begin

  if frmpbMainMenu.UseStockSystem then
    begin
      self.qrySelInvPOs.Close;
      self.qrySelInvPOs.sql.clear;
      self.qrySelInvPOs.sql.text := StockSQL;

      self.qrySelInvPOs.ParamByName('SInv').asInteger :=
          self.qrySIHeaderGrid.FieldByName('Supplier_Invoice').asInteger;
      self.qrySelInvPOs.Open;
    end
  else
    begin
      self.qrySelInvPOs.Close;
      self.qrySelInvPOs.sql.clear;
      self.qrySelInvPOs.sql.text := NonStockSQL;
      self.qrySelInvPOs.ParamByName('SInv').asInteger :=
          self.qrySIHeaderGrid.FieldByName('Supplier_Invoice').asInteger;
      self.qrySelInvPOs.Open;
    end;

  tempOrderType := '';
  tempPONum := '';

  if self.qrySelInvPOs.RecordCount = 0 then
  begin
    tempStr := ''
  end
  else
  begin
    if self.qrySelInvPOs.FieldByName('Purchase_Order').asString <> '' then
    begin
      tempStr := self.qrySelInvPOs.FieldByName('Purchase_Order').asString;
      tempOrderType := 'P'
    end
    else if self.qrySelInvPOs.FieldByName('Job_Bag').asString <> '' then
    begin
      tempStr := 'JB' + self.qrySelInvPOs.FieldByName('Job_Bag').asString;
      tempOrderType := 'J'
    end
    else if frmpbMainMenu.UseStockSystem then
      if (self.qrySelInvPOs.FieldByName('Purch_Ord').asString <> '') then
        begin
          tempStr := self.qrySelInvPOs.FieldByName('Purch_Ord').asString;
        end
    else
      tempStr := '';

    tempPONum := tempStr;
    if self.qrySelInvPOs.RecordCount > 1 then
      tempStr := tempStr + '....';
  end;
  Text := tempStr;

  self.qrySelInvPOs.Close;
end;

function TdmSupplierInvoice.GetPONumList: String;
var
  tempStr: string;
  theField: TField;
  JobBagField: boolean;
begin
  self.qrySelInvPOs.Close;
  self.qrySelInvPOs.ParamByName('SInv').asInteger :=
    self.qrySIHeaderGrid.FieldByName('Supplier_Invoice').asInteger;
  self.qrySelInvPOs.Open;

  if self.qrySelInvPOs.FieldByName('Purchase_Order').asString <> '' then
  begin
    theField := self.qrySelInvPOs.FieldByName('Purchase_Order');
    tempStr := 'Production Order(s) ' + theField.AsString;;

  end
  else if self.qrySelInvPOs.FieldByName('Purch_Ord').asString <> '' then
  begin
    theField := self.qrySelInvPOs.FieldByName('Purch_Ord');
    tempStr := 'Purchase Order(s) ' + theField.AsString;;
  end
  else if self.qrySelInvPOs.FieldByName('Job_Bag').asString <> '' then
  begin
    theField := self.qrySelInvPOs.FieldByName('Job_Bag');
    tempStr := 'Job Bag(s) ' + theField.AsString;;
  end
  else
  begin
    tempStr := '';
  end;

  self.qrySelInvPOs.Next;

  while not self.qrySelInvPOs.Eof do
  begin
    tempStr := tempStr + ', ' + theField.AsString;
    self.qrySelInvPOs.Next;
  end;

  self.qrySelInvPOs.Close;
  Result := tempStr;
end;

procedure TdmSupplierInvoice.dsSIHeaderGridDataChange(Sender: TObject;
  Field: TField);
begin
//  PBLUSupplierInvoiceFrm.stsBrInvoices.Panels[1].Text := self.PONumList;
end;

procedure TdmSupplierInvoice.qrySIHeaderGridCalcFields(DataSet: TDataSet);
var
  invNo: integer;
  goodsVal, vatVal: double;
  InvoiceVal, InvoiceVAT: double;
begin
  invNo := DataSet.FieldByName('Supplier_Invoice').asInteger;

  CalcTotalGoodsVal(invNo, goodsVal, vatVal);

  DataSet.FieldByName('tot_val').asFloat := goodsVal;
  
  CalcTotalInvoiceValue(invNo, InvoiceVal, InvoiceVat );

  DataSet.FieldByName('tot_invoices').asFloat := InvoiceVal;

  DataSet.fieldbyname('New_Date').AsString := PBDateStr(DataSet.fieldbyname('Date_Created').AsDateTime);
end;

procedure TdmSupplierInvoice.CalcTotalInvoiceValue(InvNo: integer;
  var InvoiceVal, InvoiceVAT: double);
var
  purchaseOrder: double;
  purchOrd, jobBag, line: integer;
  tempInvoiceVal, tempInvoiceVat: currency;
begin
  InvoiceVal := 0.00;
  InvoiceVAT := 0.00;

  qrySIAllLines.close;
  qrySIAllLines.ParamByName('Supplier_Invoice').asInteger := InvNo;
  qrySIAllLines.open;

  while not qrySIAllLines.Eof do
    begin
      if self.qrySIAllLines.FieldByName('purchase_order').asString <> '' then
      begin
        purchaseOrder := self.qrySIAllLines.FieldByName('purchase_order').asFloat;
        line := self.qrySIAllLines.FieldByName('line').asInteger;
        self.GetTotalPOInvoiceValue(purchaseOrder, line, tempInvoiceVal, tempInvoiceVat);
        InvoiceVal := InvoiceVal + tempInvoiceVal;
        InvoiceVAT := InvoiceVAT + tempInvoiceVat;
      end
      else if self.qrySIAllLines.FieldByName('job_bag').asString <> '' then
      begin
        jobBag := self.qrySIAllLines.FieldByName('job_bag').asInteger;
        line := self.qrySIAllLines.FieldByName('Job_Bag_Line').asInteger;
        self.GetTotalJBLineInvoiceValue(jobBag, line, tempInvoiceVal, tempInvoiceVat);
        InvoiceVal := InvoiceVal + tempInvoiceVal;
        InvoiceVAT := InvoiceVAT + tempInvoiceVat;
      end
      else
      if self.qrySIAllLines.FieldByName('purch_ord').asString <> '' then
      begin
        purchOrd := self.qrySIAllLines.FieldByName('purch_ord').asInteger;
        line := self.qrySIAllLines.FieldByName('Purch_Ord_Line_no').asInteger;
        self.GetTotalPurchOrdLineInvoiceValue(purchOrd, line, tempInvoiceVal, tempInvoiceVat);
        InvoiceVal := InvoiceVal + tempInvoiceVal;
        InvoiceVAT := InvoiceVAT + tempInvoiceVat;
      end;

      qrySIAllLines.next
    end;
end;

procedure TdmSupplierInvoice.CalcTotalGoodsVal(InvNo: integer;
  var goodsVal, vatVal: double);
var
  purchaseOrder: double;
  purchOrd, jobBag, line: integer;
  tempGoodsVal, tempVatVal: currency;
begin
  //calculate the total goods value based on the production orders / job bag lines /
  //purchase orders and extra charges included in the invoice
  goodsVal := 0.00;
  vatVal := 0.00;

  qrySIAllLines.close;
  qrySIAllLines.ParamByName('Supplier_Invoice').asInteger := InvNo;
  qrySIAllLines.open;

  while not qrySIAllLines.Eof do
  begin
    if self.qrySIAllLines.FieldByName('purchase_order').asString <> '' then
    begin
      purchaseOrder := self.qrySIAllLines.FieldByName('purchase_order').asFloat;
      line := self.qrySIAllLines.FieldByName('line').asInteger;
      self.GetTotalOrderValue(purchaseOrder, line, tempGoodsVal, tempVatVal);
      goodsVal := goodsVal + tempGoodsVal;
      vatVal := vatVal + tempVatVal;
    end
    else if self.qrySIAllLines.FieldByName('job_bag').asString <> '' then
    begin
      jobBag := self.qrySIAllLines.FieldByName('job_bag').asInteger;
      line := self.qrySIAllLines.FieldByName('Job_Bag_Line').asInteger;
      self.GetTotalJBLineValue(jobBag, line, tempGoodsVal, tempVatVal);
      goodsVal := goodsVal + tempGoodsVal;
      vatVal := vatVal + tempVatVal;
    end
    else
    if self.qrySIAllLines.FieldByName('purch_ord').asString <> '' then
    begin
      purchOrd := self.qrySIAllLines.FieldByName('purch_ord').asInteger;
      line := self.qrySIAllLines.FieldByName('Purch_Ord_Line_no').asInteger;
      self.GetTotalPurchOrdLineValue(purchOrd, line, tempGoodsVal, tempVatVal);
      goodsVal := goodsVal + tempGoodsVal;
      vatVal := vatVal + tempVatVal;
    end;
    self.qrySIAllLines.next;
  end;
  self.qrySIAllLines.close;

  self.qrySIPurchOrdLines.close;
  self.qrySIPurchOrdLines.ParamByName('Supplier_Invoice').asInteger := InvNo;
  self.qrySIPurchOrdLines.open;

  while not self.qrySIPurchOrdLines.Eof do
  begin
    purchOrd := self.qrySIPurchOrdLines.FieldByName('purch_ord').asInteger;
    self.GetPurchOrdExtChrgValue(purchOrd, tempGoodsVal, tempVatVal);
    goodsVal := goodsVal + tempGoodsVal;
    vatVal := vatVal + tempVatVal;

    self.qrySIPurchOrdLines.Next;
  end;
  self.qrySIPurchOrdLines.close;
end;

procedure TdmSupplierInvoice.GetTotalOrderValue(tempcode: real;
  templine: integer; var OrderVal, VatVal: currency);
var
  tempOrdVal: double;
begin
  OrderVal := 0.00;
  VatVal := 0.00;

  with qryGetPO do
  begin
    close;
    parambyname('Purchase_order').asfloat := tempCode;
    parambyname('Line').asinteger := tempLine;
    open;
    first;
    if fieldbyname('Price_unit_Factor').asinteger = 0 then
      OrderVal := fieldbyname('Order_price').asfloat
    else
      OrderVal := ((fieldbyname('Quantity').asinteger / fieldbyname('Price_unit_Factor').asinteger) * fieldbyname('Order_Price').asfloat);

    VatVal := OrderVal * fieldByName('vat_rate').asFloat / 100;

    close;
  end;

  qryPOLineChgs.close;
  qryPOLineChgs.ParamByName('purchase_order').asFloat := tempCode;
  qryPOLineChgs.ParamByName('line').asInteger := tempLine;
  qryPOLineChgs.open;

  while not qryPOLineChgs.Eof do
  begin
    tempOrdVal := qryPOLineChgs.FieldByName('Amount').asFloat;
    orderVal := orderVal + tempOrdVal;
    vatVal := vatVal + (tempOrdVal * (qryPOLineChgs.FieldByName('vat_rate').asFloat)/100);

    qryPOLineChgs.Next;
  end;
  qryPOLineChgs.close;
end;

procedure TdmSupplierInvoice.GetTotalJBLineValue(tempcode,
  templine: integer; var OrderVal, VatVal: currency);
begin
  OrderVal := 0.00;
  VatVal := 0.00;

  with qryGetJB do
  begin
    close;
    parambyname('Job_bag').asinteger := tempCode;
    parambyname('Job_Bag_Line').asinteger := tempLine;
    open;
    first;
    OrderVal := fieldbyname('Job_Bag_Line_Cost').asFloat;
    VatVal := OrderVal * fieldByName('vat_rate').asFloat / 100;

    close;
  end;
end;

procedure TdmSupplierInvoice.GetTotalPurchOrdLineValue(purchOrd,
  line: integer; var OrderVal, VatVal: currency);
begin
  OrderVal := 0.00;
  VatVal := 0.00;

  with qryGetPurchOrdL do
  begin
    close;
    parambyname('Purch_ord').asfloat := purchOrd;
    parambyname('Purch_Ord_Line_no').asinteger := line;
    open;
    first;

    orderVal := (fieldByName('Quantity_Received').asInteger / fieldByName('Purch_Pack_Quantity').asInteger) * fieldByName('Purchase_Price').asFloat;
    vatVal := orderVal * fieldByName('vat_rate').asFloat / 100;

    close;
  end;
end;

procedure TdmSupplierInvoice.GetPurchOrdExtChrgValue(purchOrd: integer;
  var ChrgVal, VatVal: currency);
var
  tempOrdVal: double;
begin
  chrgVal := 0.00;
  vatVal := 0.00;

  try
    qryPurchChgs.close;
    qryPurchChgs.ParamByName('purch_ord').asFloat := purchOrd;
    qryPurchChgs.open;

    while not qryPurchChgs.Eof do
    begin
      tempOrdVal := qryPurchChgs.FieldByName('Amount').asFloat;
      ChrgVal := ChrgVal + tempOrdVal;
      vatVal := vatVal + (tempOrdVal * (qryPurchChgs.FieldByName('vat_rate').asFloat)/100);

      qryPurchChgs.Next;
    end;
    qryPurchChgs.close;
  except
    //fail without making a fuss
  end;
end;

procedure TdmSupplierInvoice.GetTotalPOInvoiceValue(tempcode: real;
  templine: integer; var OrderVal, VatVal: currency);
var
  tempOrdVal: double;
  icount: integer;
  iMultiplier: integer;
begin
  OrderVal := 0.00;
  VatVal := 0.00;

  with qryGetPOInvs do
  begin
    close;
    parambyname('Purchase_order').asfloat := tempCode;
    parambyname('Line').asinteger := tempLine;
    open;
    first;
    icount := 1;
    while eof <> true do
      begin
        if fieldbyname('Price_unit_Factor').asinteger = 0 then
          OrderVal := OrderVal + fieldbyname('Goods_Value').asfloat
        else
          begin
            if fieldbyname('Qty_Invoiced').asinteger >= 0 then
              iMultiplier := 1
            else
              iMultiplier := -1;
            OrderVal := OrderVal + ((fieldbyname('Qty_Invoiced').asinteger / (fieldbyname('Price_unit_Factor').asinteger*iMultiplier)) * fieldbyname('Goods_Value').asfloat);
          end;
        VatVal := VatVal + (OrderVal * fieldByName('vat_rate').asFloat / 100);

(*        if icount = 1 then
          begin
            OrderVal := OrderVal + fieldbyname('Total_Charges').asfloat;
          end;
*)
        OrderVal := OrderVal + fieldbyname('Total_Charges').asfloat;
        inc(icount);
        next;
      end;
    close;
  end;
end;

procedure TdmSupplierInvoice.GetTotalJBLineInvoiceValue(tempcode: integer;
  templine: integer; var OrderVal, VatVal: currency);
var
  tempOrdVal: double;
begin
  OrderVal := 0.00;
  VatVal := 0.00;

  with qryGetJBInvs do
  begin
    close;
    parambyname('Job_Bag').asinteger := tempCode;
    parambyname('Job_Bag_Line').asinteger := tempLine;
    open;
    first;

    while eof <> true do
      begin
        if fieldbyname('Price_unit_Factor').asinteger = 0 then
          OrderVal := OrderVal + fieldbyname('Goods_Value').asfloat
        else
          OrderVal := OrderVal + ((fieldbyname('Qty_Invoiced').asinteger / fieldbyname('Price_unit_Factor').asinteger) * fieldbyname('Goods_Value').asfloat);

        VatVal := VatVal + (OrderVal * fieldByName('vat_rate').asFloat / 100);
        next;
      end;
    close;
  end;
end;

procedure TdmSupplierInvoice.GetTotalPurchOrdLineInvoiceValue(tempcode: integer;
  templine: integer; var OrderVal, VatVal: currency);
var
  tempOrdVal: double;
begin
  OrderVal := 0.00;
  VatVal := 0.00;

  with qryGetPurchLineInvs do
  begin
    close;
    parambyname('Purch_ord').asinteger := tempCode;
    parambyname('Purch_ord_line_no').asinteger := tempLine;
    open;
    first;

    while eof <> true do
      begin
        if fieldbyname('Price_unit_Factor').asinteger = 0 then
          OrderVal := OrderVal + fieldbyname('Goods_Value').asfloat
        else
          OrderVal := OrderVal + ((fieldbyname('Qty_Invoiced').asinteger / fieldbyname('Price_unit_Factor').asinteger) * fieldbyname('Goods_Value').asfloat);

        VatVal := VatVal + (OrderVal * fieldByName('vat_rate').asFloat / 100);
        next;
      end;
    close;
  end;
end;

procedure TdmSupplierInvoice.qryPOsDelivPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPOsDelivPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryPOsDelivPurchase_Order.AsFloat,qryPOsDelivLine.AsInteger);
end;

function TdmSupplierInvoice.CanPassInvoices: boolean;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := frmPBMainMenu.iOperator;
      open;
      result := (fieldbyname('Can_Pass_Purchase_Invoices').asstring = 'Y')
    end;
end;

function TdmSupplierInvoice.GetSupplierVatCode(tempCode: integer): integer;
begin
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempCode;
      open;
      result := fieldbyname('Vat_Code_Def').asinteger
    end;
end;

procedure TdmSupplierInvoice.qrySIHeaderGridSales_Invoice_NoGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
var
  tempInvoiceNo: string;
begin
  tempInvoiceNo := '';

  if (tempOrderType = 'P') AND (tempPONum <> '') then
    begin
      with qryGetPOInvoice do
        begin
          close;
          parambyname('Purchase_order').asfloat := StrToFloatDef(tempPONum, 0, FormatSettings);
          open;
          tempInvoiceNo := fieldbyname('Sales_Invoice_no').asstring;
          if recordcount > 1 then
            tempInvoiceNo := tempInvoiceNo + '...';
        end;
    end;
  text := tempInvoiceNo;
end;

procedure TdmSupplierInvoice.qryPCHeaderGridCalcFields(DataSet: TDataSet);
begin
  DataSet.fieldbyname('New_Date').AsString := PBDateStr(DataSet.fieldbyname('Date_Created').AsDateTime);
end;

end.
