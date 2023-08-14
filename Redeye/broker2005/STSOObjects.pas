unit STSOObjects;

interface

uses
  Classes, Forms, Variants;

type

TPartDetail = class
 private
    FPart: string;
    fNotInUse: Boolean;
    fPartUpd: Boolean;
    fAutoUpdate: Boolean;
    fTrackSerialNo: Boolean;
    fPartPurchPrice: Currency;
    fPartMUCatPrice: Currency;
    fReadPartCostList: Currency;
    fReadPartCostCat: Currency;
    fPartMUListPrice: Currency;
    fReadVatCode: Integer;
    fPartGroup: Integer;
    fPartPackQty: Integer;
    fLastStoreLot: string;
    fPartDesc: string;
    fPartLastMovDate: TDateTime;
    FLine: Integer;
    procedure setPart(const Value: string);
    procedure setAutoUpdate(const Value: Boolean);
    procedure setLastStoreLot(const Value: string);
    procedure setNotInUse(const Value: Boolean);
    procedure setPartCostCat(const Value: Currency);
    procedure setPartCostList(const Value: Currency);
    procedure setPartDesc(const Value: string);
    procedure setPartGroup(const Value: Integer);
    procedure setPartLastMovDate(const Value: TDateTime);
    procedure setPartMUCatPrice(const Value: Currency);
    procedure setPartMUListPrice(const Value: Currency);
    procedure setPartPackQty(const Value: Integer);
    procedure setPartPurchPrice(const Value: Currency);
    procedure setPartUpd(const Value: Boolean);
    procedure setTrackSerialNo(const Value: Boolean);
    procedure setVatCode(const Value: Integer);
    procedure SetLine(const Value: Integer);
public
  procedure Assign(APart: tPartDetail);
  function Clone: TPartDetail;
  property part: string read FPart write setPart;
  property PartDesc: string read fPartDesc write setPartDesc;
  property PartUpd: Boolean read fPartUpd write setPartUpd;
  property PartCostList: Currency read fReadPartCostList write setPartCostList;
  property PartCostCat: Currency read fReadPartCostCat write setPartCostCat;
  property VatCode: Integer read fReadVatCode write setVatCode;
  property PartGroup: Integer read fPartGroup write setPartGroup;
  property PartPackQty: Integer read fPartPackQty write setPartPackQty;
  property PartPurchPrice: Currency read fPartPurchPrice write setPartPurchPrice;
  property PartMUListPrice: Currency read fPartMUListPrice write setPartMUListPrice;
  property PartMUCatPrice: Currency read fPartMUCatPrice write setPartMUCatPrice;
  property PartLastMovDate: TDateTime read fPartLastMovDate write setPartLastMovDate;
  property LastStoreLot: string read fLastStoreLot write setLastStoreLot;
  property NotInUse: Boolean  read fNotInUse write setNotInUse;
  property TrackSerialNo: Boolean read fTrackSerialNo write setTrackSerialNo;
  property AutoUpdate: Boolean read fAutoUpdate write setAutoUpdate;
  property Line: Integer read FLine write SetLine;
  end;

 TPartDetails = class;

  TExtraCharge = class
  private
    FAmount: Double;
    FAdditionalCharge: Integer;
    FDetails: string;
    fNominalCode: string;
    fChgVatCode: Integer;
    fVat: Double;
    fCost: Double;
    procedure SetAdditionalCharge(const Value: Integer);
    procedure SetAmount(const Value: Double);
    procedure SetDetails(const Value: string);
    procedure SetNominalCode(const Value: string);
    procedure setChgVatCode(const Value: Integer);
    procedure SetVat(const Value: Double);
    procedure setCost(const Value: Double);
  public
    procedure Assign(anExtra: TExtraCharge);
    function Clone: TExtraCharge;
    property AdditionalCharge: Integer read FAdditionalCharge write
      SetAdditionalCharge;
    property Amount: Double read FAmount write SetAmount;
    property Cost: Double read fCost write setCost;
    property Details: string read FDetails write SetDetails;
    property Vat: Double read fVat write SetVat;
    property NominalCode: string read fNominalCode write SetNominalCode;
    property ChgVatCode: Integer read fChgVatCode write setChgVatCode;
  end;

  TExtraCharges = class;

  TRepLine = class
  private
    fPercentage: double;
    fLine: integer;
    fRep: integer;
    fActntkn: string;
    fRepName: string;
    procedure SetLine(const Value: integer);
    procedure setPercentage(const Value: double);
    procedure setRep(const Value: integer);
    procedure setActntkn(const Value: string);
    procedure setRepName(const Value: string);
  public
  procedure Assign(aRepLine: tRepLine);
  function clone: tRepLine;
  property Rep: integer read fRep write setRep;
  property line: integer read fLine Write SetLine;
  property Percentage: double read fPercentage write setPercentage;
  property ActnTkn: string read fActntkn write setActntkn;
  property RepName: string read fRepName write setRepName;
  end;

  tRepLines = class;

  TSerialNumber = class
  private
    FSerialNo: Integer;
    FLine: Integer;
    FSerialItemFrom: string;
    FSerialItemTo: string;
    FSetsPerPad: integer;
    procedure SetLine(const Value: Integer);
    procedure SetSerialItemFrom(const Value: string);
    procedure SetSerialItemTo(const Value: string);
    procedure SetSerialNo(const Value: Integer);
    function GetSerialRange: string;
    function GetRangeCount: real;
    procedure SetSetsPerPad(const Value: integer);
  public
    procedure Assign(aSerial: TSerialNumber);
    function Clone: TSerialNumber;
    property SerialNo: Integer read FSerialNo write SetSerialNo;
    property Line: Integer read FLine write SetLine;
    property RangeCount: real read GetRangeCount;
    property SerialRange: string read GetSerialRange;
    property SerialItemFrom: string read FSerialItemFrom write SetSerialItemFrom;
    property SerialItemTo: string read FSerialItemTo write SetSerialItemTo;
    property SetsPerPad: integer read FSetsPerPad write SetSetsPerPad;
  end;

  TSerialNumbers = class;

  TStockSerialNo = class
  private
    FLine: Integer;
    FSerialNo: Integer;
    FSerialItemTo: string;
    FSerialItemFrom: string;
    FStoreStock: integer;
    FSalesOrder: integer;
    FSalesOrderLine: integer;
    FSerialItemNo: integer;
    FSetsPerPad: integer;
    function GetSerialRange: string;
    procedure SetLine(const Value: Integer);
    procedure SetSerialItemFrom(const Value: string);
    procedure SetSerialItemTo(const Value: string);
    procedure SetSerialNo(const Value: Integer);
    procedure SetStoreStock(const Value: integer);
    function GetRangeCount: real;
    procedure SetSalesOrder(const Value: integer);
    procedure SetSalesOrderLine(const Value: integer);
    procedure SetSerialItemNo(const Value: integer);
    procedure SetSetsPerPad(const Value: integer);
  public
    procedure Assign(aSerial: TStockSerialNo);
    function Clone: TStockSerialNo;
    property SerialNo: Integer read FSerialNo write SetSerialNo;
    property Line: Integer read FLine write SetLine;
    property RangeCount: real read GetRangeCount;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
    property SalesOrderLine: integer read FSalesOrderLine write SetSalesOrderLine;
    property SetsPerPad: integer read FSetsPerPad write SetSetsPerPad;
    property SerialItemFrom: string read FSerialItemFrom write SetSerialItemFrom;
    property SerialItemTo: string read FSerialItemTo write SetSerialItemTo;
    property SerialItemNo: integer read FSerialItemNo write SetSerialItemNo;
    property SerialRange: string read GetSerialRange;
    property StoreStock: integer read FStoreStock write SetStoreStock;
  end;

  TStockSerialNos = class;

  TOrderLine = class
  Private
    fLineZero: Integer;
    fLine: Integer;
    fOrderNo: Integer;
    fSOLineStatus: Integer;
    fPartDetails: tPartDetails;
    fOrdQty: Integer;
    fDelQty: Integer;
    fSell_Price: Currency;
    fInvQty: Integer;
    fAllocQty: Integer;
    fContractLineNo: Integer;
    fContract: Integer;
    fpart_Cost: real;
    fPart: string;
    fActntkn: string;
    fDisc_Val: real;
    fDisc_Type: String;
    FVatCode: integer;
    FPurchPackQuantity: integer;
    FSellPackQuantity: integer;
    FDelQtyinPacks: string;
    FAllocQtyinPacks: string;
    FInvQtyinPacks: string;
    FOrdQtyinPacks: string;
    FOriginalSellPrice: Currency;
    fCredQty: Integer;
    fCredQtyinPacks: string;
    fCred_Price: Currency;
    fInv_Price: Currency;
    FSerialNumbers: TSerialNumbers;
    FStockSerialNos: TStockSerialNos;
    FMarkupValue: Currency;
    FMarkupType: string;
    FPartClass: string;
    FJobBagLine: integer;
    FJobBag: integer;
    FOversQty: integer;
    FReturnsQty: integer;
    FWasteQty: integer;
    FProducedQty: integer;
    FJobBagRequest: integer;
    FLineIsSample: boolean;
    procedure setLine(const Value: Integer);
    procedure setLineZero(const Value: Integer);
    procedure setOrderNo(const Value: Integer);
    procedure setSOLineStatus(const Value: Integer);
    procedure setDelQty(const Value: Integer);
    procedure setOrdQty(const Value: Integer);
    procedure setSell_Price(const Value: Currency);
    procedure setAllocQty(const Value: Integer);
    procedure setContract(const Value: Integer);
    procedure setContractLineNo(const Value: Integer);
    procedure setInvQty(const Value: Integer);
    procedure setpart(const Value: string);
    procedure setPart_Cost(const Value: real);
    procedure setActntkn(const Value: string);
    procedure setDisc_Type(const Value: String);
    procedure setDisc_Val(const Value: real);
    procedure SetVatCode(const Value: integer);
    procedure SetPurchPackQuantity(const Value: integer);
    procedure SetSellPackQuantity(const Value: integer);
    procedure SetAllocQtyinPacks(const Value: string);
    procedure SetDelQtyinPacks(const Value: string);
    procedure SetInvQtyinPacks(const Value: string);
    procedure SetOrdQtyinPacks(const Value: string);
    procedure SetOriginalSellPrice(const Value: Currency);
    procedure setCredQty(const Value: Integer);
    procedure setCredQtyinPacks(const Value: string);
    procedure setCredPrice(const Value: Currency);
    procedure setInvPrice(const Value: Currency);
    function GetTotalSerialNos: real;
    procedure SetMarkupType(const Value: string);
    procedure SetMarkupValue(const Value: Currency);
    procedure SetPartClass(const Value: string);
    procedure SetJobBag(const Value: integer);
    procedure SetJobBagLine(const Value: integer);
    procedure SetOversQty(const Value: integer);
    procedure SetReturnsQty(const Value: integer);
    procedure SetWasteQty(const Value: integer);
    procedure SetProducedQty(const Value: integer);
    procedure SetJobBagRequest(const Value: integer);
    procedure SetLineIsSample(const Value: boolean);
  Public
    constructor Create;
    destructor destroy; override;
    procedure Assign(aLine: TOrderLine);
    function Clone: TOrderLine;
    property ActnTkn: string read fActntkn write setActntkn;
    property AllocQty: Integer read fAllocQty write setAllocQty;
    property AllocQtyinPacks: string read FAllocQtyinPacks write SetAllocQtyinPacks;
    property Contract: Integer read fContract write setContract;
    property ContractLineNo: Integer read fContractLineNo write setContractLineNo;
    property Cred_Price: Currency read fCred_Price write setCredPrice;
    property CredQty: Integer read fCredQty write setCredQty;
    property CredQtyinPacks: string read fCredQtyinPacks write setCredQtyinPacks;
    property DelQty: Integer read fDelQty write setDelQty;
    property DelQtyinPacks: string read FDelQtyinPacks write SetDelQtyinPacks;
    property Disc_Type: String read fDisc_Type write setDisc_Type;
    property Disc_Val: real read fDisc_Val write setDisc_Val;
    property Inv_Price: Currency read fInv_Price write setInvPrice;
    property InvQty: Integer read fInvQty write setInvQty;
    property InvQtyinPacks: string read FInvQtyinPacks write SetInvQtyinPacks;
    property JobBag: integer read FJobBag write SetJobBag;
    property JobBagLine: integer read FJobBagLine write SetJobBagLine;
    property JobBagRequest: integer read FJobBagRequest write SetJobBagRequest;
    property Line: Integer read fLine write setLine;
    property LineIsSample: boolean read FLineIsSample write SetLineIsSample;
    property LineZero: Integer read fLineZero write setLineZero;
    property MarkupType: string read FMarkupType write SetMarkupType;
    property MarkupValue: Currency read FMarkupValue write SetMarkupValue;
    property OrderNo: Integer read fOrderNo write setOrderNo;
    property OrdQty: Integer read fOrdQty write setOrdQty;
    property OrdQtyinPacks: string read FOrdQtyinPacks write SetOrdQtyinPacks;
    property OriginalSellPrice: Currency read FOriginalSellPrice write SetOriginalSellPrice;
    property OversQty: integer read FOversQty write SetOversQty;
    property Part: string read fPart write setpart;
    property Part_Cost: real read fpart_Cost write setPart_Cost;
    property PartClass: string read FPartClass write SetPartClass;
    property PartDetails: tPartDetails read fPartDetails;
    property ProducedQty: integer read FProducedQty write SetProducedQty;
    property PurchPackQuantity: integer read FPurchPackQuantity write SetPurchPackQuantity;
    property ReturnsQty: integer read FReturnsQty write SetReturnsQty;
    property Sell_Price: Currency read fSell_Price write setSell_Price;
    property SellPackQuantity: integer read FSellPackQuantity write SetSellPackQuantity;
    property SerialNumbers: TSerialNumbers read FSerialNumbers;
    property StockSerialNos: TStockSerialNos read FStockSerialNos;
    property SOLineStatus: Integer read fSOLineStatus write setSOLineStatus;
    property TotalSerialNos: real read GetTotalSerialNos;
    property WasteQty: integer read FWasteQty write SetWasteQty;
    property VatCode: integer read FVatCode write SetVatCode;
  end;

TPartDetails = class
  private
    FParts: TList;
    FMaxParts: Integer;
    function GetCount: Integer;
    function GetParts(Index: Integer): TPartDetail;
    procedure SetParts(Index: Integer; const Value: TPartDetail);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aPart: TPartDetail);
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TPartDetails;
    property Count: Integer read GetCount;
    property Parts[Index: Integer]: TPartDetail read GetParts write SetParts;
    default;
    property MaxParts: Integer read FMaxParts;
  end;

TExtraCharges = class
  private
    FCharges: TList;
    FMaxCharges: Integer;
    function GetCount: Integer;
    function GetCharges(Index: Integer): TExtraCharge;
    function GetNextChargeNumber: Integer;
    function GetTotal: Double;
    procedure SetCharges(Index: Integer; const Value: TExtraCharge);
    function GetTotalVat: Double;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aCharge: TExtraCharge);
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TExtraCharges;
    function IndexFromChargeNo(const ChargeNo: Integer): Integer;
    property Count: Integer read GetCount;
    property Charges[Index: Integer]: TExtraCharge read GetCharges write
      SetCharges; default;
    property MaxCharges: Integer read FMaxCharges;
    property NextChargeNumber: Integer read GetNextChargeNumber;
    property Total: Double read GetTotal;
    property TotalVat: Double read GetTotalVat;
  end;

 TRepLines = class
 private
    FRepLines: TList;
    function GetRepLines(Index: Integer): TRepLine;
    procedure setRepLines(Index: Integer; const Value: TRepLine);
    function GetCount: integer;
 public
 constructor create;
 destructor destroy; override;
 procedure Add(aRepLine: tRepLine);
 procedure Clear;
 procedure Delete(const Index: Integer);
 function clone: TRepLines;
 property count: integer read GetCount ;
 property RepLines[Index:Integer]: TRepLine
  read GetRepLines write setRepLines; default;
 end;

  TStockSerialNos = class
  private
    FSerials: TList;
    FMaxSerials: Integer;
    function GetCount: Integer;
    function GetNextSerialNumber: Integer;
    function GetSerials(Index: Integer): TStockSerialNo;
    procedure SetSerials(Index: Integer; const Value: TStockSerialNo);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aSerial: TStockSerialNo);
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TStockSerialNos;
    function IndexFromSerialNo(const SerialNo: Integer): Integer;
    property Count: Integer read GetCount;
    property Serials[Index: Integer]: TStockSerialNo
      read GetSerials write SetSerials; default;
    property MaxSerials: Integer read FMaxSerials;
    property NextSerialNumber: Integer read GetNextSerialNumber;
  end;

  TSerialNumbers = class
  private
    FSerials: TList;
    FMaxSerials: Integer;
    function GetCount: Integer;
    function GetNextSerialNumber: Integer;
    function GetSerials(Index: Integer): TSerialNumber;
    procedure SetSerials(Index: Integer; const Value: TSerialNumber);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aSerial: TSerialNumber);
    procedure Clear;
    procedure Delete(const Index: Integer);
    procedure Renumber;
    function Clone: TSerialNumbers;
    function IndexFromSerialNo(const SerialNo: Integer): Integer;
    property Count: Integer read GetCount;
    property Serials[Index: Integer]: TSerialNumber
      read GetSerials write SetSerials; default;
    property MaxSerials: Integer read FMaxSerials;
    property NextSerialNumber: Integer read GetNextSerialNumber;
  end;

  TOrderLines = class
  Private
    fMaxLines: Integer;
    fLines: TList;
    Procedure SetLines(Index: Integer; const Value: TOrderLine);
    function GetCount: Integer;
    function GetLines(Index: Integer): TOrderLine;
    function GetNextLineNumber: Integer;
  Public
    Constructor Create;
    destructor Destroy; override;
    procedure Add(aLine: tOrderLine);overload;
    procedure Add(aPart: string; anIdxNo, anOrderQty, aPackSize, aSellPackQty: integer; aPackCost, aSellPackPrice: double);overload;
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TOrderLines;
    function IndexFromLineNo(const LineNo: Integer): Integer;
    function IndexFromPartCode(const PartCode: string): integer;
    property Count:Integer read GetCount;
    property Lines[Index: Integer]: TOrderLine read GetLines write SetLines;
      default;
    property MaxLines: Integer read fMaxLines;
    Property NextLineNumber: Integer read GetNextLineNumber;
  end;


TSalesOrder = class
private
    fFuncMode: char;
    fCustomer: Integer;
    fCostCentre: string;
    FBranchNo: Integer;
    fOfficeContact: Integer;
    fSONumber: Integer;
    fRep: Integer;
    fSOHeadStatus: Integer;
    fSOType: string;
    fCustOrderNo: string;
    fCustomerName: String;
    fBranchName: string;
    fDatePoint: TDateTime;
    fOrderLines: TOrderLines;
    fOperator: Integer;
    fDateReq: TDateTime;
    fNarrative: String;
    fCustomerContactNo: Integer;
    fPartStore: Integer;
    fRepLines: TRepLines;
    FDeliveryNotes: string;
    FDeliveryCustomer: integer;
    FDeliveryBranch: integer;
    FReplenishSource: integer;
    FSupplier: integer;
    FBranchNo0: integer;
    FSupplierOrderType: string;
    fInvNumber: integer;
    FExtraCharges: TExtraCharges;
    fAdHocAddress: integer;
    FSONarrative: integer;
    FContactName: string;
    FProductionLocation: integer;
    FAccountTeam: integer;
    FAccountManagerName: string;
    FOperatorName: string;
    FFAO: string;
    FCashSale: string;
    FInactive: string;
    procedure setBranchName(const Value: string);
    procedure setBranchNo(const Value: Integer);
    procedure setCostCentre(const Value: string);
    procedure setCustomer(const Value: Integer);
    procedure setCustomerName(const Value: String);
    procedure setCustOrderNo(const Value: string);
    procedure setDatePoint(const Value: TDateTime);
    procedure setOfficeContact(const Value: Integer);
    procedure setRep(const Value: Integer);
    procedure setSOType(const Value: string);
    procedure setOperator(const Value: Integer);
    procedure setDateReq(const Value: TDateTime);
    procedure setNarrative(const Value: String);
    procedure setCustomerContactNo(const Value: Integer);
    procedure setPartStore(const Value: Integer);
    procedure SetDeliveryNotes(const Value: string);
    procedure SetDeliveryBranch(const Value: integer);
    procedure SetDeliveryCustomer(const Value: integer);
    procedure SetReplenishSource(const Value: integer);
    procedure SetSupplier(const Value: integer);
    procedure SetBranchNo0(const Value: integer);
    procedure SetSupplierOrderType(const Value: string);
    procedure setAdHocAddress(const Value: integer);
    procedure SetSONarrative(const Value: integer);
    procedure SetContactName(const Value: string);
    function GetOrderStatus: integer;
    procedure SetProductionLocation(const Value: integer);
    procedure SetAccountTeam(const Value: integer);
    procedure SetAccountManagerName(const Value: string);
    procedure SetOperatorName(const Value: string);
    procedure SetFAO(const Value: string);
    procedure SetCashSale(const Value: string);
    procedure SetInactive(const Value: string);
public
  constructor create(DataMod : TDataModule);
  destructor Destroy; override;
  procedure Clear;
  function Clone: TSalesOrder;
  property AccountManagerName: string read FAccountManagerName write SetAccountManagerName;
  property AccountTeam: integer read FAccountTeam write SetAccountTeam;
  property BranchNo: Integer read FBranchNo write setBranchNo;
  property BranchName: string read fBranchName write setBranchName;
  property CashSale: string read FCashSale write SetCashSale;
  property DatePoint: TDateTime read fDatePoint write setDatePoint;
  property DateReq: TDateTime read fDateReq write setDateReq;
  property FuncMode: char read fFuncMode write fFuncMode;
  property OrderLines: TOrderLines read fOrderLines write fOrderLines;
  property OrderStatus: integer read GetOrderStatus;
  property ExtraCharges: TExtraCharges read FExtraCharges write fExtraCharges;
  property RepLines: TRepLines read fRepLines write fRepLines;
  property SOHeadStatus: Integer read fSOHeadStatus write fSOHeadStatus;
  property SONumber: Integer read fSONumber write fSONumber;
  property InvNumber: integer read fInvNumber write fInvNumber;
  property Inactive: string read FInactive write SetInactive;
  property Customer: Integer read fCustomer write setCustomer;
  property CustomerName: String read fCustomerName write setCustomerName;
  property OfficeContact: Integer read fOfficeContact write setOfficeContact;
  property Operator: Integer read fOperator write setOperator;
  property FAO: string read FFAO write SetFAO;
  property OperatorName: string read FOperatorName write SetOperatorName;
  property CustOrderNo: string read fCustOrderNo write setCustOrderNo;
  property Rep: Integer read fRep write setRep;
  property SONarrative: integer read FSONarrative write SetSONarrative;
  property SOType: string read fSOType write setSOType;
  property CostCentre: string read fCostCentre write setCostCentre;
  property Narrative: String read fNarrative write setNarrative;
  property CustomerContactNo: Integer read fCustomerContactNo write setCustomerContactNo;
  property PartStore: Integer read fPartStore write setPartStore;
  property DeliveryNotes: string read FDeliveryNotes write SetDeliveryNotes;
  property DeliveryCustomer: integer read FDeliveryCustomer write SetDeliveryCustomer;
  property DeliveryBranch: integer read FDeliveryBranch write SetDeliveryBranch;
  property ReplenishSource: integer read FReplenishSource write SetReplenishSource;
  property Supplier: integer read FSupplier write SetSupplier;
  property BranchNo0: integer read FBranchNo0 write SetBranchNo0;
  property SupplierOrderType: string read FSupplierOrderType write SetSupplierOrderType;
  property AdhocAddress: integer read fAdHocAddress write setAdHocAddress;
  property ProductionLocation: integer read FProductionLocation write SetProductionLocation;
  property ContactName: string read FContactName write SetContactName;
  end;


  {commonly used constants}

  const
    {Sales Order Maintenance Function Modes}
    soAdd                   ='A';
    soChange                ='C';
    soChangeHead            ='H';
    soDelete                ='D';
    soView                  ='S';
    soAddToExisting         ='E';
    soCopy                  ='P';

    {Sales Order Header Status Values}
    soCreated               =10;
    soSomeSentToCustomer    =15;
    soAllSentToCustomer     =20;

    {Sales Order Limits}
  cMaxPartDetails             = 50;
  cMaxExtraCharges            = 10;
  cMaxOrderLines              = 250;
  cMaxSerialNumbers           = 100;

  { Sales Order Header Status values }
  shCreated                   = 10;
  shPOCreated                 = 30;
  shAllocated                 = 50;
  shPODelivered               = 60;
  shDespNotePrinted           = 100;
  shPartConfirmed             = 140;
  shDespConfirmed             = 150;
  shPartlyInvoiced            = 200;
  shFullyInvoiced             = 250;

  {Sales Order Line Status values }
  slNotYetSent                = 10;
  slSentToCustomer            = 20;
  slSalesInvoiceRaised        = 30;
  slGoodsInvoicedByCustomer   = 40;

   { Utility functions }

  { If passed an integer, PBIntStr will return a string;  if passed a
    string, it will return an integer. }
function PBIntStr(const vIn: variant): variant;
{ If passed a date, PBDateStr will return a string;  if passed a
  string, it will return a date. }
function PBDateStr(const vIn: variant): variant;
{ If passed a float, PBFloatStr will return a string;  if passed a
  string, it will return a float. }
function PBFloatStr(const vIn: variant): variant;
{ If passed a string or a float, FormatQty will return a string.  An
  error message will be displayed if the value is invalid or -ve. }
function FormatQty(const Qty: variant): string;
{ If passed a string or a float, FormatMoney will return a string.  An
  error message will be displayed if the value is invalid or -ve. }
function FormatMoney(const Money: variant): string;
{ BoolToChar will return Y if param is true, false otherwise }
function BoolToChar(const Bool: Boolean): Char;
{ If passed a string or a float, PostoNegQty will return a string.  An
  error message will be displayed if the value is invalid. }
function PostoNegQty(const Qty: variant): integer;
{ If passed a string or a float, PostoNegFormatMoney will return a string.  An
  error message will be displayed if the value is invalid. }
function PostoNegMoney(const Money: variant): double;


var
  SalesOrder                  :TSalesOrder;

  implementation

uses
Dialogs, SysUtils, STSODataMod;

function PBIntStr(const vIn: variant): variant;
begin
  if VarType(vIn) = VarInteger then
    Result := IntToStr(vIn)
  else
    if VarType(vIn) = VarString then
  begin
    if Trim(vIn) = '' then
      Result := 0
    else
      Result := StrToInt(vIn);
  end
  else
    Result := Unassigned;
end;

function PBDateStr(const vIn: variant): variant;
begin
  if VarType(vIn) = VarDate then
  begin
    if vIn = 0 then
      Result := ''
    else
      Result := DateToStr(vIn);
  end
  else
    if VarType(vIn) = VarString then
  begin
    if Trim(vIn) = '' then
      Result := 0
    else
      Result := StrToDate(vIn);
  end
  else
    Result := Unassigned;
end;

function PBFloatStr(const vIn: variant): variant;
begin
  if VarType(vIn) = VarDouble then
    Result := FloatToStr(vIn)
  else
    if VarType(vIn) = VarString then
  begin
    if Trim(vIn) = '' then
      Result := 0
    else
      Result := StrToFloatDef(vIn, 0, FormatSettings);
  end
  else
    Result := Unassigned;
end;

function FormatQty(const Qty: variant): string;
begin
  if VarType(Qty) = VarString then
  begin
    if Trim(Qty) = '' then
    begin
      Result := '';
      Exit;
    end;
  end;
  try
    begin
      if VarType(Qty) = VarString then
        Result := FormatFloat('######0', StrToFloatDef(Qty, 0, FormatSettings))
      else
        Result := FormatFloat('######0', Qty);
      if StrToFloatDef(Result, 0, FormatSettings) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except
    if VarType(Qty) = VarString then
      MessageDlg('Invalid quantity - ' + Qty, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid quantity', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function FormatMoney(const Money: variant): string;
begin
  if VarType(Money) = VarString then
  begin
    if Trim(Money) = '' then
    begin
      Result := '0.00';
      Exit;
    end;
  end;
  try
    begin
      if VarType(Money) = VarString then
        Result := FormatFloat('######0.00', StrToFloatDef(Money, 0, FormatSettings))
      else
        Result := FormatFloat('######0.00', Money);
      if StrToFloatDef(Result, 0, FormatSettings) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except
    if VarType(Money) = VarString then
      MessageDlg('Invalid financial value - ' + Money, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid financial value', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function BoolToChar(const Bool: Boolean): Char;
begin
  if Bool then
    Result := 'Y'
  else
    Result := 'N';
end;

{ TOrderLines }
function CompareLineNo(Item1, Item2: Pointer): Integer;
begin
  { Compare returns < 0 if Item1 is less and Item2, 0 if they are equal
    and > 0 if Item1 is greater than Item2.}
  if (Item1 = nil) and (Item2 = nil) then
    Result := 0
  else
  if (Item1 = nil) then
    Result := -1
  else
  if (Item2 = nil) then
    Result := 1
  else
  if TOrderLine(Item1).Line = TOrderLine(Item2).Line then
    Result := 0
  else
    if TOrderLine(Item1).Line < TOrderLine(Item2).Line then
    Result := -1
  else
    Result := 1;
end;

procedure TOrderLines.Add(aLine: tOrderLine);
begin
 if FLines.Count = MaxLines then
    raise Exception.Create('Maximum number of order lines exceeded');
  FLines.Add(aLine);
  FLines.Sort(CompareLineNo);
end;

procedure TOrderLines.Add(aPart: string; anIdxNo, anOrderQty, aPackSize, aSellPackQty: integer; aPackCost, aSellPackPrice: double);
var
  aLine : TOrderLine;
begin
  aLine := TOrderLine.Create;
  aLine.Part := aPart;
  aLine.Line := anIdxNo+1;
  aLine.OrdQty := anOrderQty;
  aLine.PurchPackQuantity := aPackSize;
  aLine.Part_Cost := aPackCost;
  aLine.fSOLineStatus := slNotYetSent;
  aLine.Sell_Price := aSellPackPrice;
  aLine.Cred_Price := aSellPackPrice;
  aLine.Inv_Price := aSellPackPrice;
  aLine.SellPackQuantity := aSellPackQty;
  aLine.ActnTkn := 'A';

  if FLines.Count = MaxLines then
    begin
      aLine.Free;
      raise Exception.Create('Maximum number of order lines exceeded');
    end;
  FLines.Add(aLine);
  FLines.Sort(CompareLineNo);
end;

procedure TOrderLines.Clear;
var
  i                           : Integer;
begin
  for i := 0 to Pred(FLines.Count) do
  begin
    TOrderLine(FLines[i]).Free;
    FLines[i] := nil;
  end;
  FLines.Clear;
end;

function TOrderLines.Clone: TOrderLines;
var
  i                           : Integer;
begin
  Result := TOrderLines.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Lines[i].Clone);
end;


constructor TOrderLines.Create;
begin
 FLines := TList.Create;
 FMaxLines := cMaxOrderLines;
end;

procedure TOrderLines.Delete(const Index: Integer);
begin
 FLines.Delete(Index);
end;

destructor TOrderLines.Destroy;
begin
    Clear;
  FLines.Free;
  FLines := nil;
  inherited;

end;

function TOrderLines.GetCount: Integer;
begin
 Result := FLines.Count;
end;

function TOrderLines.GetLines(Index: Integer): TOrderLine;
begin
  Result := FLines[Index];
end;

function TOrderLines.GetNextLineNumber: Integer;
var
  i, Candidate                : Integer;
  used                        : Boolean;
begin
  Result := -1; { Worst case scenario }
  if Count = 0 then
    Result := 1
  else
    for Candidate := 1 to MaxLines do
    begin
      used := False;
      for i := 0 to Pred(Count) do
        if Lines[i].Line = Candidate then
          used := True;
      if not used then
      begin
        Result := Candidate;
        Exit;
      end;
    end;
end;
function TOrderLines.IndexFromLineNo(const LineNo: Integer): Integer;
var
  i                           : Integer;
begin
  Result := -1;
  for i := 0 to Pred(Count) do
    if Lines[i].Line = LineNo then
    begin
      Result := i;
      Break;
    end;
end;

function TOrderLines.IndexFromPartCode(const PartCode: string): integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Pred(Count) do
  begin
    if Lines[i].Part = PartCode then
    begin
      Result := i;
      Break;
    end;
  end;
end;

procedure TOrderLines.SetLines(Index: Integer; const Value: TOrderLine);
begin
 FLines[Index] := Value;
  FLines.Sort(CompareLineNo);
end;

{ TSalesOrder }

procedure TSalesOrder.Clear;
begin
  FOrderLines.Clear;
  fExtraCharges.Clear;
  FDatePoint := 0;
  fDateReq := 0;
  FCustomer := 0;
  FSONumber := 0;
  FBranchNo := 0;
  FSOHeadStatus := 0;
  FOfficeContact := 0;
  fOperator := 0;
  fCostCentre := '';
  fCustomerContactNo := 0;
  fCustOrderNo := '';
  FInvNumber := 0;
  
  

end;

function TSalesOrder.Clone: TSalesOrder;
begin
 Result := TSalesOrder.Create(nil);
  Result.OrderLines.Free;
  Result.Replines.Free;
  Result.ExtraCharges.Free;
  Result.OrderLines := Self.OrderLines.Clone;
  Result.RepLines := Self.Replines.Clone;
  Result.ExtraCharges := Self.ExtraCharges.Clone;
  Result.AccountManagerName := Self.AccountManagerName;
  Result.FAO := self.FAO;
  Result.CashSale := Self.CashSale;
  Result.AccountTeam := Self.AccountTeam;
  Result.BranchNo := Self.BranchNo;
  Result.BranchName := Self.BranchName;
  Result.DatePoint := Self.DatePoint;
  Result.DateReq := Self.DateReq;
  Result.FuncMode := Self.FuncMode;
  Result.OfficeContact := Self.OfficeContact;
  Result.SOHeadStatus := Self.SOHeadStatus;
  Result.SONumber := Self.SONumber;
  Result.InvNumber := Self.InvNumber;
  Result.Inactive := self.Inactive;
  Result.Customer := Self.Customer;
  Result.CustomerName := Self.CustomerName;
  Result.OfficeContact := Self.OfficeContact;
  Result.Operator := Self.Operator;
  Result.OperatorName := Self.OperatorName;
  Result.CustOrderNo := Self.CustOrderNo;
  Result.Rep := Self.Rep;
  Result.SOType := Self.SOType;
  Result.CostCentre := Self.CostCentre;
  Result.CustomerContactNo := Self.CustomerContactNo;
  Result.PartStore := PartStore;
  Result.DeliveryNOtes := DeliveryNotes;
  Result.DeliveryCustomer := DeliveryCustomer;
  Result.DeliveryBranch := DeliveryBranch;
  Result.ProductionLocation := ProductionLocation;
  Result.AdHocAddress := AdHocAddress;
  Result.ContactName := ContactName;
  Result.SONarrative := SONarrative;
end;

constructor TSalesOrder.create(DataMod: TDataModule);
begin
  FOrderLines := TOrderLines.Create;
  FRepLines := TRepLines.Create;
  fExtraCharges := tExtraCharges.Create;
  fSOType := 'S';
end;

destructor TSalesOrder.Destroy;
begin
  FOrderLines.Free;
  FOrderLines := nil;
  FRepLines.Free;
  FRepLines := nil;
  fExtraCharges.Free;
  fExtraCharges:= nil;
  inherited;

end;

function TSalesOrder.GetOrderStatus: integer;
var
  i: integer;
  istock, iservice: integer;
begin
  iservice := 0;
  istock := 0;
  for i := 0 to pred(OrderLines.count) do
    begin
      if OrderLines[i].PartClass = 'SERV' then
        iservice := iservice + 1
      else
        istock := istock + 1;
    end;
    
  if iservice = OrderLines.count then
    result := 150
  else
    result := 10
end;

procedure TSalesOrder.SetAccountManagerName(const Value: string);
begin
  FAccountManagerName := Value;
end;

procedure TSalesOrder.SetAccountTeam(const Value: integer);
begin
  FAccountTeam := Value;
end;

procedure TSalesOrder.setAdHocAddress(const Value: integer);
begin
  fAdHocAddress := Value;
end;

procedure TSalesOrder.setBranchName(const Value: string);
begin
  fBranchName := Value;
end;

procedure TSalesOrder.setBranchNo(const Value: Integer);
begin
  FBranchNo := Value;
end;

procedure TSalesOrder.SetBranchNo0(const Value: integer);
begin
  FBranchNo0 := Value;
end;

procedure TSalesOrder.SetCashSale(const Value: string);
begin
  FCashSale := Value;
end;

procedure TSalesOrder.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TSalesOrder.setCostCentre(const Value: string);
begin
  fCostCentre := Value;
end;

procedure TSalesOrder.setCustomer(const Value: Integer);
begin
  fCustomer := Value;
end;

procedure TSalesOrder.setCustomerContactNo(const Value: Integer);
begin
  fCustomerContactNo := Value;
end;

procedure TSalesOrder.setCustomerName(const Value: String);
begin
  fCustomerName := Value;
end;

procedure TSalesOrder.setCustOrderNo(const Value: string);
begin
  fCustOrderNo := Value;
end;

procedure TSalesOrder.setDatePoint(const Value: TDateTime);
begin
  fDatePoint := Value;
end;

procedure TSalesOrder.setDateReq(const Value: TDateTime);
begin
  fDateReq := Value;
end;

procedure TSalesOrder.SetDeliveryBranch(const Value: integer);
begin
  FDeliveryBranch := Value;
end;

procedure TSalesOrder.SetDeliveryCustomer(const Value: integer);
begin
  FDeliveryCustomer := Value;
end;

procedure TSalesOrder.SetDeliveryNotes(const Value: string);
begin
  FDeliveryNotes := Value;
end;

procedure TSalesOrder.SetFAO(const Value: string);
begin
  FFAO := Value;
end;

procedure TSalesOrder.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TSalesOrder.setNarrative(const Value: String);
begin
  fNarrative := Value;
end;

procedure TSalesOrder.setOfficeContact(const Value: Integer);
begin
  fOfficeContact := Value;
end;

procedure TSalesOrder.setOperator(const Value: Integer);
begin
  fOperator := Value;
end;

procedure TSalesOrder.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TSalesOrder.setPartStore(const Value: Integer);
begin
  fPartStore := Value;
end;

procedure TSalesOrder.SetProductionLocation(const Value: integer);
begin
  FProductionLocation := Value;
end;

procedure TSalesOrder.setRep(const Value: Integer);
begin
  fRep := Value;
end;

procedure TSalesOrder.SetReplenishSource(const Value: integer);
begin
  FReplenishSource := Value;
end;

procedure TSalesOrder.SetSONarrative(const Value: integer);
begin
  FSONarrative := Value;
end;

procedure TSalesOrder.setSOType(const Value: string);
begin
  fSOType := Value;
end;

procedure TSalesOrder.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TSalesOrder.SetSupplierOrderType(const Value: string);
begin
  FSupplierOrderType := Value;
end;

{ TOrderLine }

procedure TOrderLine.Assign(aLine: TOrderLine);
begin
  FStockSerialNos.Free;
  FSerialNumbers.Free;
  FPartDetails.Free;
  FStockSerialNos := aLine.StockSerialNos.Clone;
  FSerialNumbers := aLine.SerialNumbers.Clone;
  FPartDetails := aLine.PartDetails.Clone;
  ActnTkn := aLine.ActnTkn;
  AllocQty := aLine.AllocQty;
  AllocQtyinPacks := aLine.AllocQtyinPacks;
  Contract := aLine.Contract;
  ContractLineNo := aLine.ContractLineNo;
  DelQty := aLine.DelQty;
  DelQtyinPacks := aLine.DelQtyinPacks;
  Disc_Type := aLine.Disc_Type;
  Disc_Val := aLine.Disc_Val;
  InvQty := aLine.InvQty;
  InvQtyinPacks := aLine.InvQtyinPacks;
  JobBag := aLine.JobBag;
  JobBagLine := aLine.JobBagLine;
  JobBagRequest := aLine.JobBagRequest;
  CredQty := aLine.CredQty;
  CredQtyinPacks := aLine.CredQtyinPacks;
  Line := aLine.Line;
  LineIsSample := aLine.LineIsSample;
  LineZero := aLine.LineZero;
  MarkupType := aLine.MarkupType;
  MarkupValue := aLine.MarkupValue;
  OrderNo := aLine.OrderNo;
  OrdQty := aLine.OrdQty;
  OrdQtyinPacks := aLine.OrdQtyinPacks;
  OriginalSellPrice := aLine.OriginalSellPrice;
  OversQty := aLine.OversQty;
  part := aLine.Part;
  PartClass := aLine.PartClass;
  Part_Cost := aLine.Part_Cost;
  ProducedQty := aLine.ProducedQty;
  PurchPackQuantity := aLine.PurchPackQuantity;
  ReturnsQty := aLine.ReturnsQty;
  Sell_Price := aLine.Sell_Price;
  Cred_Price := aLine.Cred_Price;
  Inv_Price := aLine.Inv_Price;
  SellPackQuantity := aLine.SellPackQuantity;
  SOLineStatus := aLine.SOLineStatus;
  VatCode := aLine.VatCode;
  WasteQty := aLine.WasteQty;
end;

function TOrderLine.Clone: TOrderLine;
begin
  Result := TOrderLine.Create;
  Result.Assign(Self);
end;

constructor TOrderLine.Create;
begin
  FPartDetails := TPartDetails.Create;
  FSerialNumbers := TSerialNumbers.Create;
  FStockSerialNos := TStockSerialNos.Create;
end;

destructor TOrderLine.destroy;
begin
  FPartDetails.Free;
  FStockSerialNos.Free;
  FSerialNumbers.Free;
  FPartDetails := nil;
  FSerialNumbers := nil;
  FStockSerialNos := nil;
  inherited;
end;

function TOrderLine.GetTotalSerialNos: real;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to pred(SerialNumbers.count) do
    Result := Result + SerialNumbers[i].RangeCount;
end;

procedure TOrderLine.setActntkn(const Value: string);
begin
  fActntkn := Value;
end;

procedure TOrderLine.setAllocQty(const Value: Integer);
begin
  fAllocQty := Value;
end;

procedure TOrderLine.SetAllocQtyinPacks(const Value: string);
begin
  FAllocQtyinPacks := Value;
end;

procedure TOrderLine.setContract(const Value: Integer);
begin
  fContract := Value;
end;

procedure TOrderLine.setContractLineNo(const Value: Integer);
begin
  fContractLineNo := Value;
end;

procedure TOrderLine.setCredPrice(const Value: Currency);
begin
  fCred_Price := Value;
end;

procedure TOrderLine.setCredQty(const Value: Integer);
begin
  fCredQty := Value;
end;

procedure TOrderLine.setCredQtyinPacks(const Value: string);
begin
  fCredQtyinPacks := Value;
end;

procedure TOrderLine.setDelQty(const Value: Integer);
begin
  fDelQty := Value;
end;

procedure TOrderLine.SetDelQtyinPacks(const Value: string);
begin
  FDelQtyinPacks := Value;
end;

procedure TOrderLine.setDisc_Type(const Value: String);
begin
  fDisc_Type := Value;
end;

procedure TOrderLine.setDisc_Val(const Value: real);
begin
  fDisc_Val := Value;
end;

procedure TOrderLine.setInvPrice(const Value: Currency);
begin
  fInv_Price := Value;
end;

procedure TOrderLine.setInvQty(const Value: Integer);
begin
  fInvQty := Value;
end;

procedure TOrderLine.SetInvQtyinPacks(const Value: string);
begin
  FInvQtyinPacks := Value;
end;

procedure TOrderLine.SetJobBag(const Value: integer);
begin
  FJobBag := Value;
end;

procedure TOrderLine.SetJobBagLine(const Value: integer);
begin
  FJobBagLine := Value;
end;

procedure TOrderLine.SetJobBagRequest(const Value: integer);
begin
  FJobBagRequest := Value;
end;

procedure TOrderLine.setLine(const Value: Integer);
begin
  fLine := Value;
end;

procedure TOrderLine.SetLineIsSample(const Value: boolean);
begin
  FLineIsSample := Value;
end;

procedure TOrderLine.setLineZero(const Value: Integer);
begin
  fLineZero := Value;
end;

procedure TOrderLine.SetMarkupType(const Value: string);
begin
  FMarkupType := Value;
end;

procedure TOrderLine.SetMarkupValue(const Value: Currency);
begin
  FMarkupValue := Value;
end;

procedure TOrderLine.setOrderNo(const Value: Integer);
begin
  fOrderNo := Value;
end;

procedure TOrderLine.setOrdQty(const Value: Integer);
begin
  fOrdQty := Value;
end;

procedure TOrderLine.SetOrdQtyinPacks(const Value: string);
begin
  FOrdQtyinPacks := Value;
end;

procedure TOrderLine.SetOriginalSellPrice(const Value: Currency);
begin
  FOriginalSellPrice := Value;
end;

procedure TOrderLine.SetOversQty(const Value: integer);
begin
  FOversQty := Value;
end;

procedure TOrderLine.setpart(const Value: string);
begin
  fPart := Value;
end;

procedure TOrderLine.SetPartClass(const Value: string);
begin
  FPartClass := Value;
end;

procedure TOrderLine.setPart_Cost(const Value: real);
begin
  fpart_Cost := Value;
end;

procedure TOrderLine.SetProducedQty(const Value: integer);
begin
  FProducedQty := Value;
end;

procedure TOrderLine.SetPurchPackQuantity(const Value: integer);
begin
  FPurchPackQuantity := Value;
end;

procedure TOrderLine.SetReturnsQty(const Value: integer);
begin
  FReturnsQty := Value;
end;

procedure TOrderLine.SetSellPackQuantity(const Value: integer);
begin
  FSellPackQuantity := Value;
end;

procedure TOrderLine.setSell_Price(const Value: Currency);
begin
  fSell_Price := Value;
end;

procedure TOrderLine.setSOLineStatus(const Value: Integer);
begin
  fSOLineStatus := Value;
end;

procedure TOrderLine.SetVatCode(const Value: integer);
begin
  FVatCode := Value;
end;

procedure TOrderLine.SetWasteQty(const Value: integer);
begin
  FWasteQty := Value;
end;

{ TPartDetail }

procedure TPartDetail.Assign(APart: tPartDetail);
begin
part := aPart.Part;
PartDesc := aPart.PartDesc;
PartUpd := aPart.PartUpd;
PartCostList := aPart.PartCostList;
PartCostCat := aPart.PartCostCat;
VatCode := aPart.VatCode;
PartGroup := aPart.PartGroup;
PartPackQty := aPart.PartPackQty;
PartPurchPrice := aPart.PartPurchPrice;
PartMUListPrice := aPart.PartMuListPrice;
PartMUCatPrice := aPart.PartMUCatPrice;
PartLastMovDate := aPart.PartLastMovDate;
LastStoreLot := aPart.LastStoreLot;
NotInUse := aPart.NotInUse;
TrackSerialNo := aPart.TrackSerialNo;
AutoUpdate := aPart.AutoUpdate;
end;

function TPartDetail.Clone: TPartDetail;
begin
  Result := TPartDetail.Create;
  Result.Assign(Self);
end;

procedure TPartDetail.setAutoUpdate(const Value: Boolean);
begin
  fAutoUpdate := Value;
end;

procedure TPartDetail.setLastStoreLot(const Value: string);
begin
  fLastStoreLot := Value;
end;

procedure TPartDetail.SetLine(const Value: Integer);
begin
  FLine := Value;
end;

procedure TPartDetail.setNotInUse(const Value: Boolean);
begin
  fNotInUse := Value;
end;

procedure TPartDetail.setPart(const Value: string);
begin
  FPart := Value;
end;

procedure TPartDetail.setPartCostCat(const Value: Currency);
begin
  fReadPartCostCat := Value;
end;

procedure TPartDetail.setPartCostList(const Value: Currency);
begin
  fReadPartCostList := Value;
end;

procedure TPartDetail.setPartDesc(const Value: string);
begin
  fPartDesc := Value;
end;

procedure TPartDetail.setPartGroup(const Value: Integer);
begin
  fPartGroup := Value;
end;

procedure TPartDetail.setPartLastMovDate(const Value: TDateTime);
begin
  fPartLastMovDate := Value;
end;

procedure TPartDetail.setPartMUCatPrice(const Value: Currency);
begin
  fPartMUCatPrice := Value;
end;

procedure TPartDetail.setPartMUListPrice(const Value: Currency);
begin
  fPartMUListPrice := Value;
end;

procedure TPartDetail.setPartPackQty(const Value: Integer);
begin
  fPartPackQty := Value;
end;

procedure TPartDetail.setPartPurchPrice(const Value: Currency);
begin
  fPartPurchPrice := Value;
end;

procedure TPartDetail.setPartUpd(const Value: Boolean);
begin
  fPartUpd := Value;
end;

procedure TPartDetail.setTrackSerialNo(const Value: Boolean);
begin
  fTrackSerialNo := Value;
end;

procedure TPartDetail.setVatCode(const Value: Integer);
begin
  fReadVatCode := Value;
end;

{ TPartDetails }

function ComparePart(Item1, Item2: Pointer): Integer;
begin
  { Compare returns < 0 if Item1 is less and Item2, 0 if they are equal
    and > 0 if Item1 is greater than Item2.}
  if TPartDetail(Item1).Part = TPartDetail(Item2).Part then
    Result := 0
  else
    if TPartDetail(Item1).Part < TPartDetail(Item2).Part then
    Result := -1
  else
    Result := 1;
end;

procedure TPartDetails.Add(aPart: TPartDetail);
begin
 if FParts.Count = MaxParts then
    raise Exception.Create('Maximum number of parts exceeded');
  FParts.Add(aPart);
  FParts.Sort(ComparePart);
end;

procedure TPartDetails.Clear;
var
  i                           : Integer;
begin
  for i := 0 to Pred(FParts.Count) do
  begin
    TPartDetail(FParts[i]).Free;
    FParts[i] := nil;
  end;
  FParts.Clear;
end;

function TPartDetails.Clone: TPartDetails;
var
  i                           : Integer;
begin
  Result := TPartDetails.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Parts[i].Clone);
end;

constructor TPartDetails.Create;
begin
  FParts := TList.Create;
  FMaxParts := cMaxPartDetails;
end;

procedure TPartDetails.Delete(const Index: Integer);
begin
  FParts.Delete(Index);
end;

destructor TPartDetails.Destroy;
begin
  Clear;
  FParts.Free;
  FParts := nil;
  inherited;

end;

function TPartDetails.GetCount: Integer;
begin
  Result := FParts.Count;
end;

function TPartDetails.GetParts(Index: Integer): TPartDetail;
begin
  Result := TPartDetail(FParts[Index]);
end;

procedure TPartDetails.SetParts(Index: Integer; const Value: TPartDetail);
begin
  FParts[Index] := Value;
  FParts.Sort(ComparePart);
end;

{ TRepLines }

procedure TRepLines.Add(aRepLine: tRepLine);
begin
  fRepLines.add(aRepLine);
end;

procedure TRepLines.Clear;
var
i: integer;
begin
  for i:= 0 to pred(fRepLines.Count) do
  begin
    tRepLine(fRepLines[i]).Free;
    fRepLines[i] := nil;
  end;
  fRepLines.Clear;
end;

function TRepLines.clone: TRepLines;
var
i: Integer;
begin
  Result := tRepLines.Create;
  for i := 0 to pred(Count) do
    Result.Add(RepLines[i].Clone);
end;

constructor TRepLines.create;
begin
  FRepLines := TList.Create;
end;

procedure TRepLines.Delete(const Index: Integer);
begin
  FRepLines.Delete(Index);
end;

destructor TRepLines.destroy;
begin
  clear;
  fRepLines.Free;
  fReplines := nil;
  inherited;

end;

function TRepLines.GetCount: integer;
begin
Result := fRepLines.Count;
end;

function TRepLines.GetRepLines(Index: Integer): TRepLine;
begin
  Result := TRepLine(fRepLines[Index]);
end;

procedure TRepLines.setRepLines(Index: Integer; const Value: TRepLine);
begin
  FRepLines[Index] := Value;
end;

{ TRepLine }


procedure TRepLine.Assign(aRepLine: tRepLine);
begin
  aRepLine.Rep := Self.Rep;
  aRepLine.Percentage := Self.Percentage;
  aRepLine.line := Self.Line;
  aRepLine.RepName := Self.RepName;
  end;

function TRepLine.clone: tRepLine;
begin
  Result := TRepline.Create;
  Assign(Result);
end;


procedure TRepLine.setActntkn(const Value: string);
begin
  fActntkn := Value;
end;

procedure TRepLine.SetLine(const Value: integer);
begin
  fLine := Value;
end;

procedure TRepLine.setPercentage(const Value: double);
begin
  fPercentage := Value;
end;

procedure TRepLine.setRep(const Value: integer);
begin
  fRep := Value;
end;

procedure TRepLine.setRepName(const Value: string);
begin
  fRepName := Value;
end;

{ TExtraCharges }

function CompareChargeNo(Item1, Item2: Pointer): Integer;
begin
  { Compare returns < 0 if Item1 is less and Item2, 0 if they are equal
    and > 0 if Item1 is greater than Item2.}
  if TExtraCharge(Item1).AdditionalCharge = TExtraCharge(Item2).AdditionalCharge
    then
    Result := 0
  else
    if TExtraCharge(Item1).AdditionalCharge <
    TExtraCharge(Item2).AdditionalCharge then
    Result := -1
  else
    Result := 1;
end;

procedure TExtraCharges.Add(aCharge: TExtraCharge);
begin
  if FCharges.Count = MaxCharges then
    raise Exception.Create('Maximum number of extra charges exceeded');
  FCharges.Add(aCharge);
  FCharges.Sort(CompareChargeNo);
end;

procedure TExtraCharges.Clear;
var
  i                           : Integer;
begin
  for i := 0 to Pred(FCharges.Count) do
  begin
    TExtraCharge(FCharges[i]).Free;
    FCharges[i] := nil;
  end;
  FCharges.Clear;
end;

function TExtraCharges.Clone: TExtraCharges;
var
  i                           : Integer;
begin
  Result := TExtraCharges.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Charges[i].Clone);
end;

constructor TExtraCharges.Create;
begin
 FCharges := TList.Create;
 FMaxCharges := cMaxExtraCharges;
end;

procedure TExtraCharges.Delete(const Index: Integer);
begin
 FCharges.Delete(Index);
end;

destructor TExtraCharges.Destroy;
begin
  Clear;
  FCharges.Free;
  FCharges := nil;
  inherited;
end;

function TExtraCharges.GetCharges(Index: Integer): TExtraCharge;
begin
  Result := FCharges[Index];
end;

function TExtraCharges.GetCount: Integer;
begin
  Result := FCharges.Count;
end;

function TExtraCharges.GetNextChargeNumber: Integer;
var
  i, Candidate                : Integer;
  used                        : Boolean;
begin
  Result := -1; { Worst case scenario }
  if Count = 0 then
    Result := 1
  else
    for Candidate := 1 to MaxCharges do
    begin
      used := False;
      for i := 0 to Pred(Count) do
        if Charges[i].AdditionalCharge = Candidate then
          used := True;
      if not used then
      begin
        Result := Candidate;
        Exit;
      end;
    end;
end;

function TExtraCharges.GetTotal: Double;
var
  i                           : Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    Result := Result + Charges[i].Amount;
end;

function TExtraCharges.GetTotalVat: Double;
var
  i                           : Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    Result := Result + Charges[i].Vat;
end;

function TExtraCharges.IndexFromChargeNo(const ChargeNo: Integer): Integer;
var
  i                           : Integer;
begin
  Result := -1;
  for i := 0 to Pred(Count) do
    if Charges[i].AdditionalCharge = ChargeNo then
    begin
      Result := i;
      Break;
    end;
end;

procedure TExtraCharges.SetCharges(Index: Integer;
  const Value: TExtraCharge);
begin
  FCharges[Index] := Value;
  FCharges.Sort(CompareChargeNo);
end;

{ TExtraCharge }

procedure TExtraCharge.Assign(anExtra: TExtraCharge);
begin
  AdditionalCharge := anExtra.AdditionalCharge;
  Amount := anExtra.Amount;
  Details := anExtra.Details;
  NominalCode := anExtra.NominalCode;
  ChgVatCode := anExtra.ChgVatCode;
  Cost := anExtra.Cost;
  Vat := anExtra.Vat;
end;

function TExtraCharge.Clone: TExtraCharge;
begin
  Result := TExtraCharge.Create;
  Result.Assign(Self);
end;

procedure TExtraCharge.SetAdditionalCharge(const Value: Integer);
begin
  FAdditionalCharge := Value;
end;

procedure TExtraCharge.SetAmount(const Value: Double);
begin
  FAmount := Value;
end;

procedure TExtraCharge.setChgVatCode(const Value: Integer);
begin
  fChgVatCode := Value;
end;

procedure TExtraCharge.setCost(const Value: Double);
begin
  fCost := Value;
end;

procedure TExtraCharge.SetDetails(const Value: string);
begin
  FDetails := Value;
end;

procedure TExtraCharge.SetNominalCode(const Value: string);
begin
  fNominalCode := Value;
end;

procedure TExtraCharge.SetVat(const Value: Double);
begin
  fVat := Value;
end;

function PosToNegQty(const Qty: variant): integer;
begin
  try
    begin
      if VarType(Qty) = VarString then
        Result := (StrToInt(Qty)*-1)
      else
        Result := (Qty*-1);
    end;
  except
    if VarType(Qty) = VarString then
      MessageDlg('Invalid quantity - ' + Qty, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid quantity', mtError, [mbOK], 0);
    Result := 0;
  end;
end;

function PosToNegMoney(const Money: variant): double;
begin
  try
    begin
      if VarType(Money) = VarString then
        Result := (StrToFloatDef(Money, 0, FormatSettings) * -1)
      else
        Result := (Money*-1);
    end;
  except
    if VarType(Money) = VarString then
      MessageDlg('Invalid financial value - ' + Money, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid financial value', mtError, [mbOK], 0);
    Result := 0.00;
  end;
end;

{ TSerialNumbers }

procedure TSerialNumbers.Add(aSerial: TSerialNumber);
begin
  if FSerials.Count = MaxSerials then
    raise Exception.Create('Maximum number of serial numbers exceeded');
  FSerials.Add(aSerial);
end;

procedure TSerialNumbers.Clear;
var
  i                           : Integer;
begin
  for i := 0 to Pred(FSerials.Count) do
  begin
    TSerialNumber(FSerials[i]).Free;
    FSerials[i] := nil;
  end;
  FSerials.Clear;
end;

function TSerialNumbers.Clone: TSerialNumbers;
var
  i                           : Integer;
begin
  Result := TSerialNumbers.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Serials[i].Clone);
end;

constructor TSerialNumbers.Create;
begin
  FSerials := TList.Create;
  FMaxSerials := cMaxSerialNumbers;
end;

procedure TSerialNumbers.Delete(const Index: Integer);
begin
  FSerials.Delete(Index);
end;

destructor TSerialNumbers.Destroy;
begin
  Clear;
  FSerials.Free;
  FSerials := nil;
  inherited;
end;

function TSerialNumbers.GetCount: Integer;
begin
  Result := FSerials.Count;
end;

function TSerialNumbers.GetNextSerialNumber: Integer;
var
  i, Candidate                : Integer;
  used                        : Boolean;
begin
  Result := -1; { Worst case scenario }
  if Count = 0 then
    Result := 1
  else
    for Candidate := 1 to MaxSerials do
    begin
      used := False;
      for i := 0 to Pred(Count) do
        if Serials[i].SerialNo = Candidate then
          used := True;
      if not used then
      begin
        Result := Candidate;
        Exit;
      end;
    end;
end;

function TSerialNumbers.GetSerials(Index: Integer): TSerialNumber;
begin
  Result := TSerialNumber(FSerials[Index]);
end;

function TSerialNumbers.IndexFromSerialNo(
  const SerialNo: Integer): Integer;
var
  i                           : Integer;
begin
  Result := -1;
  for i := 0 to Pred(Count) do
    if Serials[i].SerialNo = SerialNo then
    begin
      Result := i;
      Break;
    end;
end;

procedure TSerialNumbers.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FSerials.Count) do
    TSerialNumber(FSerials[i]).SerialNo := (i+1);
end;

procedure TSerialNumbers.SetSerials(Index: Integer;
  const Value: TSerialNumber);
begin
  FSerials[Index] := Value;
end;

{ TSerialNumber }

procedure TSerialNumber.Assign(aSerial: TSerialNumber);
begin
  {Assign the individual fields here}
  SerialNo := aSerial.SerialNo;
  Line := aSerial.Line;
  SerialItemFrom := aSerial.SerialItemFrom;
  SerialItemTo := aSerial.SerialItemTo;
  SetsPerPad := aSerial.SetsPerPad;
end;

function TSerialNumber.Clone: TSerialNumber;
begin
  Result := TSerialNumber.Create;
  Result.Assign(Self);
end;

function TSerialNumber.GetRangeCount: real;
var
  rCount: real;
begin
  if (trim(SerialItemTo) = '') or
     (trim(SerialItemFrom) = '') then
    begin
      rCount := 0;
    end
  else
    begin
      rCount := (strtoint64(SerialItemTo)-strtoint64(SerialItemFrom)+1)/SetsPerPad;
      if rCount < 0 then
        rCount := 0;
    end;
  result := rcount;
end;

function TSerialNumber.GetSerialRange: string;
begin
  Result := SerialItemFrom + ' to ' + SerialItemTo;
end;

procedure TSerialNumber.SetLine(const Value: Integer);
begin
  FLine := Value;
end;

procedure TSerialNumber.SetSerialItemFrom(const Value: string);
begin
  FSerialItemFrom := Value;
end;

procedure TSerialNumber.SetSerialItemTo(const Value: string);
begin
  FSerialItemTo := Value;
end;

procedure TSerialNumber.SetSerialNo(const Value: Integer);
begin
  FSerialNo := Value;
end;

procedure TSerialNumber.SetSetsPerPad(const Value: integer);
begin
  FSetsPerPad := Value;
end;

{ TStockSerialNos }

procedure TStockSerialNos.Add(aSerial: TStockSerialNo);
begin
  if FSerials.Count = MaxSerials then
    raise Exception.Create('Maximum number of serial numbers exceeded');
  FSerials.Add(aSerial);
end;

procedure TStockSerialNos.Clear;
var
  i                           : Integer;
begin
  for i := 0 to Pred(FSerials.Count) do
  begin
    TStockSerialNo(FSerials[i]).Free;
    FSerials[i] := nil;
  end;
  FSerials.Clear;
end;

function TStockSerialNos.Clone: TStockSerialNos;
var
  i                           : Integer;
begin
  Result := TStockSerialNos.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Serials[i].Clone);
end;

constructor TStockSerialNos.Create;
begin
  FSerials := TList.Create;
  FMaxSerials := cMaxSerialNumbers;
end;

procedure TStockSerialNos.Delete(const Index: Integer);
begin
  FSerials.Delete(Index);
end;

destructor TStockSerialNos.Destroy;
begin
  Clear;
  FSerials.Free;
  FSerials := nil;
  inherited;
end;

function TStockSerialNos.GetCount: Integer;
begin
  Result := FSerials.Count;
end;

function TStockSerialNos.GetNextSerialNumber: Integer;
var
  i, Candidate                : Integer;
  used                        : Boolean;
begin
  Result := -1; { Worst case scenario }
  if Count = 0 then
    Result := 1
  else
    for Candidate := 1 to MaxSerials do
    begin
      used := False;
      for i := 0 to Pred(Count) do
        if Serials[i].SerialNo = Candidate then
          used := True;
      if not used then
      begin
        Result := Candidate;
        Exit;
      end;
    end;
end;

function TStockSerialNos.GetSerials(Index: Integer): TStockSerialNo;
begin
  Result := TStockSerialNo(FSerials[Index]);
end;

function TStockSerialNos.IndexFromSerialNo(
  const SerialNo: Integer): Integer;
var
  i                           : Integer;
begin
  Result := -1;
  for i := 0 to Pred(Count) do
    if Serials[i].SerialNo = SerialNo then
    begin
      Result := i;
      Break;
    end;
end;

procedure TStockSerialNos.SetSerials(Index: Integer;
  const Value: TStockSerialNo);
begin
  FSerials[Index] := Value;
end;


{ TStockSerialNo }

procedure TStockSerialNo.Assign(aSerial: TStockSerialNo);
begin
  {Assign the individual fields here}
  SerialNo := aSerial.SerialNo;
  Line := aSerial.Line;
  SalesOrder := aSerial.SalesOrder;
  SalesOrderLine := aSerial.SalesOrderLine;
  SetsPerPad := aSerial.SetsPerPad;
  SerialItemFrom := aSerial.SerialItemFrom;
  SerialItemTo := aSerial.SerialItemTo;
  SerialItemNo := aSerial.SerialItemNo;
  StoreStock := aSerial.StoreStock;
end;

function TStockSerialNo.Clone: TStockSerialNo;
begin
  Result := TStockSerialNo.Create;
  Result.Assign(Self);

end;

function TStockSerialNo.GetRangeCount: real;
var
  rCount: real;
begin
  if (trim(SerialItemTo) = '') or
     (trim(SerialItemFrom) = '') then
    begin
      rCount := 0;
    end
  else
    begin
      rCount := (strtoint64(SerialItemTo)-strtoint64(SerialItemFrom)+1)/SetsPerPad;
      if rCount < 0 then
        rCount := 0;
    end;
  result := rcount;
end;

function TStockSerialNo.GetSerialRange: string;
begin
  Result := SerialItemFrom + ' to ' + SerialItemTo;
end;

procedure TStockSerialNo.SetLine(const Value: Integer);
begin
  FLine := Value;
end;

procedure TStockSerialNo.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
end;

procedure TStockSerialNo.SetSalesOrderLine(const Value: integer);
begin
  FSalesOrderLine := Value;
end;

procedure TStockSerialNo.SetSerialItemFrom(const Value: string);
begin
  FSerialItemFrom := Value;
end;

procedure TStockSerialNo.SetSerialItemNo(const Value: integer);
begin
  FSerialItemNo := Value;
end;

procedure TStockSerialNo.SetSerialItemTo(const Value: string);
begin
  FSerialItemTo := Value;
end;

procedure TStockSerialNo.SetSerialNo(const Value: Integer);
begin
  FSerialNo := Value;
end;

procedure TStockSerialNo.SetSetsPerPad(const Value: integer);
begin
  FSetsPerPad := Value;
end;

procedure TStockSerialNo.SetStoreStock(const Value: integer);
begin
  FStoreStock := Value;
end;

end.
