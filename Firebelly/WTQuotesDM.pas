unit WTQuotesDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, wtNotesDM, AllCommon, wtSupplierDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
                 
type
  TqMode   = (qAdd, qChange, qDelete, qCopy, qView, qRestrict, qRequote);
  TqelMode   = (qelAdd, qelChange, qelDelete, qelView);
  TqcoMode   = (qcoAdd, qcoChange, qcoDelete, qcoView);
  TqedgMode   = (qedgAdd, qedgChange, qedgDelete, qedgView);
  TqexMode   = (qexAdd, qexChange, qexDelete, qexView);
  TqevMode   = (qevAdd, qevChange, qevDelete, qevView);
  TqslMode   = (qslAdd, qslChange, qslDelete, qslView);

  TdtmdlQuote = class(TDataModule)
    qryAllQuotes: TFDQuery;
    qryZero: TFDQuery;
    qryQHeader: TFDQuery;
    qryQGetLast: TFDQuery;
    qryQAddHeader: TFDQuery;
    qryQUpHeader: TFDQuery;
    qryCustQuotes: TFDQuery;
    qrydummy: TFDQuery;
    dtsQuotes: TDataSource;
    dtsAllQuotes: TDataSource;
    qryQElement: TFDQuery;
    qryQAddElement: TFDQuery;
    qryQAllElements: TFDQuery;
    qryQExtra: TFDQuery;
    qryQCutOut: TFDQuery;
    qryQEdge: TFDQuery;
    qryQAddExtra: TFDQuery;
    qryQAddCutOut: TFDQuery;
    qryQAddEdge: TFDQuery;
    qryQAllCutOuts: TFDQuery;
    qryQAllEdges: TFDQuery;
    qryQAllExtras: TFDQuery;
    qryQUpElement: TFDQuery;
    qryQUpCutOuts: TFDQuery;
    qryGetAddress: TFDQuery;
    qryGetCustomer: TFDQuery;
    qryMaterial: TFDQuery;
    dtsMaterial: TDataSource;
    qryOperator: TFDQuery;
    dtsOperator: TDataSource;
    qryGetNextAdd: TFDQuery;
    qryAddAddress: TFDQuery;
    qryUpAddress: TFDQuery;
    qryDelAddress: TFDQuery;
    qryQUpstand: TFDQuery;
    qryQAllUpstands: TFDQuery;
    qryUpCompany: TFDQuery;
    qryGetVat: TFDQuery;
    qryQEvent: TFDQuery;
    qryQAllEvents: TFDQuery;
    qryQAddEvent: TFDQuery;
    qryUpQuote: TFDQuery;
    qryWTGroup: TFDQuery;
    qryGetSOLine: TFDQuery;
    qryUpSOStatus: TFDQuery;
    qryUpQuoteSO: TFDQuery;
    qryUpSOLine: TFDQuery;
    qryGetJob: TFDQuery;
    qryDesigner: TFDQuery;
    dtsDesigner: TDataSource;
    qryLeadSource: TFDQuery;
    dtsLeadSource: TDataSource;
    qryBranch: TFDQuery;
    dtsBranch: TDataSource;
    qryOneWTThickness: TFDQuery;
    qryVat: TFDQuery;
    dtsVat: TDataSource;
    qryUpSOLineValues: TFDQuery;
    qryUpSOHead: TFDQuery;
    qryGetContacts: TFDQuery;
    qryQReason: TFDQuery;
    dtsQReason: TDataSource;
    qryReQuoteCount: TFDQuery;
    qryGetLinkedQuotes: TFDQuery;
    dtsGetLinkedQuotes: TDataSource;
    qryGetSalesOrder: TFDQuery;
    qryUpQuoteAddress: TFDQuery;
    qryGetSpeculativeQuotes: TFDQuery;
    qryDeclineQuotes: TFDQuery;
    qryDummyOld: TFDQuery;
    qryOldDummy: TFDQuery;
    qryQAddSlab: TFDQuery;
    qryQAllSlabs: TFDQuery;
    qryGetProduct: TFDQuery;
    qryGetProducts: TFDQuery;
    dtsGetProducts: TDataSource;
    qryRevenueCentre: TFDQuery;
    dtsRevenueCentre: TDataSource;
    qryAllQuotesQuote: TIntegerField;
    qryAllQuotesDate_Required: TDateTimeField;
    qryAllQuotesDate_Raised: TDateTimeField;
    qryAllQuotesCustomer: TIntegerField;
    qryAllQuotesDescription: TWideStringField;
    qryAllQuotesOperator: TIntegerField;
    qryAllQuotesInstallation_price: TFloatField;
    qryAllQuotesDelivery_Price: TFloatField;
    qryAllQuotesSurvey_price: TFloatField;
    qryAllQuotesProject_Reference: TWideStringField;
    qryAllQuotesReference: TWideStringField;
    qryAllQuotesQuote_Status: TIntegerField;
    qryAllQuotesNett_Price: TFloatField;
    qryAllQuotesInactive: TWideStringField;
    qryAllQuotesCustomer_name: TWideStringField;
    qryAllQuotesContact_Name: TWideStringField;
    qryAllQuotesMaterial_Type: TIntegerField;
    qryAllQuotesImportance: TWideStringField;
    qryAllQuotesGross_Price: TFloatField;
    qryAllQuotesQuote_Number: TFloatField;
    qryAllQuotesOriginal_Quote: TIntegerField;
    qryAllQuotesExpiry_Date: TDateTimeField;
    qryAllQuotesExpiry_Date_New: TDateTimeField;
    qryGetLinkedQuotesOperator_Name: TWideStringField;
    qryGetLinkedQuotesAccount_Manager_Name: TWideStringField;
    qryGetLinkedQuotesQuote: TIntegerField;
    qryGetLinkedQuotesDate_Raised: TDateTimeField;
    qryGetLinkedQuotesDescription: TWideStringField;
    qryGetLinkedQuotesMaterial_Type_Description: TWideStringField;
    qryGetLinkedQuotesQuote_Number: TFloatField;
    qryGetLinkedQuotesOriginal_Quote: TIntegerField;
    qryGetLinkedQuotesInstallation_price: TCurrencyField;
    qryGetLinkedQuotesDelivery_Price: TCurrencyField;
    qryGetLinkedQuotesSurvey_price: TCurrencyField;
    qryGetLinkedQuotesComplete_Price: TCurrencyField;
    qryGetLinkedQuotesTotal_Price: TCurrencyField;
    qryGetLinkedQuotesQuote_status_description: TWideStringField;
    qryAllQuotesOperator_Name: TWideStringField;
    qryAllQuotesStatus_Text: TWideStringField;
    qryAllQuotesMaterial_Description: TWideStringField;
    qryAllQuotesIs_Retail_Customer: TWideStringField;
    qryAllQuotesCustomer_is_Speculative: TWideStringField;
    qryAllQuotesAddress: TIntegerField;
    qryAllQuotesStatus_Description: TWideStringField;
    procedure qryAllQuotesStatus_TextGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryAllQuotesExpiry_Date_NewGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    function GetHeaderCount: integer;
    function GetHeaderCountAll: integer;
    function GetNextQNumber: integer;
    function GetCurrentQuote: integer;
    function GetCurrentCQuote: integer;
    { Private declarations }
  public
    Customer: integer;
    CustomerName: string;
    Description: string;
    QuoteDate: TDateTime;
    ExpiryDate: TDateTime;
    HighImportance: boolean;
    Material: string;
    ProjectReference: string;
    Reference: string;
    ShowLive: boolean;
    ShowInactive: string;
    ShowMonths: integer;
    ShowRecords: integer;
    SortType: string;
    SortOrder: string;
    QuoteReference: string;
    Status: string;
    TradeRetail: integer;
    procedure DeleteAddress(iAddress: integer);
    function GetAddress(tempCode: integer): string;
    function GetAddressName(tempCode: integer): string;
    function GetAddressCounty(tempCode: integer): string;
    function GetAddressEmail(tempCode: integer): string;
    function GetAddressFax(tempCode: integer): string;
    function GetAddressLocale(tempCode: integer): string;
    function GetAddressPostcode(tempCode: integer): string;
    function GetAddressStreet(tempCode: integer): string;
    function GetAddressTelephone(tempCode: integer): string;
    function GetAddressTown(tempCode: integer): string;
    function GetAddressWebsite(tempCode: integer): string;
    function GetAddressOnMailingList(tempCode: integer): boolean;
    function GetContractCutOutDiscount(tmpCode: integer): real;
    function GetContractEdgeDiscount(tmpCode: integer): real;
    function GetContractDeliveryPrice(tmpCode: integer): real;
    function GetContractInstallPrice(tmpCode: integer): real;
    function GetContractSurveyPrice(tmpCode: integer): real;
    function GetCustomerName(tempCust: integer): string;
    function GetCustomerAddress(tempcust: integer): string;
    function GetCustomerDiscount(tempCust: integer): double;
    function GetCustomerStreet(tempCust: integer): string;
    function GetCustomerCounty(tempCust: integer): string;
    function GetCustomerEmail(tempCust: integer): string;
    function GetCustomerFax(tempCust: integer): string;
    function GetCustomerLocale(tempCust: integer): string;
    function GetCustomerPostcode(tempCust: integer): string;
    function GetCustomerTelephone(tempCust: integer): string;
    function GetCustomerTown(tempCust: integer): string;
    function GetCustomerVat(tempCust: integer): integer;
    function GetCustomerWebsite(tempCust: integer): string;
    function GetVatRate(tempVat: integer): real;
    function GetWorktopGroup(tempCode: integer): integer;
    function GetWorktopUnitPrice(tempCode, tempSize: integer): real;
    function SetAddress(iAddress: integer;
                        AddName, Street, AddLocale: string;
                        Town, postcode, County, phone, email: string): integer;
    property CurrentQuote : integer read GetCurrentQuote;
    property CurrentCQuote: integer read GetCurrentCQuote;
    property HeaderCount: integer read GetHeaderCount;
    property HeaderCountAll: integer read GetHeaderCountAll;
    function UsingSearch: boolean;
    procedure RefreshAlldata;
    procedure Refreshdata;
    procedure UpdateAllQAddress(tempName: string; tempCustomer: integer);
    procedure UpdateQAddress(tempQuote, tempCustomer, tempAddress: integer; tempName: string);
    procedure UpdateQStatus(tempQuote: integer; tempStatus: integer);
    procedure UpdateQStatusSO(tempQuote, tempStatus: integer);
    procedure UpdateSOStatus(tempJob, tempQuote, tempStatus: integer);
  end;

  TQuote = class;

  TQExtra  = class
  private
    FParent: TQuote;
    FQExNumber: integer;
    FUnitPrice: currency;
    FQuantity: double;
    FExtra: integer;
    FPriceUnit: integer;
    FExtraDesc: string;
    FPriceUnitDesc: string;
    FUnitCost: currency;
    FDoNotDiscount: boolean;
    function GetTotalPrice: currency;
    procedure SetParent(const Value: TQuote);
    procedure SetQExNumber(const Value: integer);
    procedure SetExtra(const Value: integer);
    procedure SetExtraDesc(const Value: string);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetQuantity(const Value: double);
    procedure SetUnitPrice(const Value: currency);
    procedure SetUnitCost(const Value: currency);
    function GetTotalCost: currency;
    procedure SetDoNotDiscount(const Value: boolean);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQExtra;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DoNotDiscount: boolean read FDoNotDiscount write SetDoNotDiscount;
    property Extra: integer read FExtra write SetExtra;
    property ExtraDesc: string read FExtraDesc write SetExtraDesc;
    property Parent: TQuote read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property QExNumber: integer read FQExNumber write SetQExNumber;
    property Quantity: double read FQuantity write SetQuantity;
    property TotalCost: currency read GetTotalCost;
    property TotalPrice: currency read GetTotalPrice;
    property UnitCost: currency read FUnitCost write SetUnitCost;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
  end;

  TQExtras = class;

  TQEdge  = class
  private
    FParent: TQuote;
    FQEdgNumber: integer;
    FUnitPrice: currency;
    FLength: double;
    FPriceUnit: integer;
    FEdge: integer;
    FMaterial: integer;
    FEdgeDesc: string;
    FMaterialDescr: string;
    FPriceUnitDesc: string;
    FEdgeType: integer;
    FEdgeTypeDesc: string;
    FUnitCost: currency;
    FDiscount: double;
    function GetTotalCost: currency;
    function GetTotalPrice: currency;
    procedure SetParent(const Value: TQuote);
    procedure SetQEdgNumber(const Value: integer);
    procedure SetEdge(const Value: integer);
    procedure SetEdgeDesc(const Value: string);
    procedure SetLength(const Value: double);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialDescr(const Value: string);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetUnitPrice(const Value: currency);
    procedure SetEdgeType(const Value: integer);
    procedure SetEdgeTypeDesc(const Value: string);
    procedure SetUnitCost(const Value: currency);
    procedure SetDiscount(const Value: double);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQEdge;
    procedure LoadFromDB;
    procedure SaveToDB;
    property Discount: double read FDiscount write SetDiscount;
    property Edge: integer read FEdge write SetEdge;
    property EdgeDesc: string read FEdgeDesc write SetEdgeDesc;
    property EdgeType: integer read FEdgeType write SetEdgeType;
    property EdgeTypeDesc: string read FEdgeTypeDesc write SetEdgeTypeDesc;
    property Length: double read FLength write SetLength;
    property Material: integer read FMaterial write SetMaterial;
    Property MaterialDescr: string read FMaterialDescr write SetMaterialDescr;
    property Parent: TQuote read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property QEdgNumber: integer read FQEdgNumber write SetQEdgNumber;
    property TotalCost: currency read GetTotalCost;
    property TotalPrice: currency read GetTotalPrice;
    property UnitCost: currency read FUnitCost write SetUnitCost;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
  end;

  TQEdges = class;

  TQEvent   = class
  private
    FEventNumber: integer;
    FOperator: integer;
    FDateEntered: TDateTime;
    FParent: TQuote;
    FOperatorName: string;
    FNarrative: TNotes;
    procedure SetDateEntered(const Value: TDateTime);
    procedure SetEventNumber(const Value: integer);
    procedure SetOperator(const Value: integer);
    procedure SetParent(const Value: TQuote);
    procedure SetOperatorName(const Value: string);
    procedure SetNarrative(const Value: TNotes);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQEvent;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DateEntered: TDateTime read FDateEntered write SetDateEntered;
    property EventNumber: integer read FEventNumber write SetEventNumber;
    property Narrative: TNotes read FNarrative write SetNarrative;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName:string read FOperatorName write SetOperatorName;
    property Parent: TQuote read FParent write SetParent;
  end;

  TQCutOut  = class
  private
    FParent: TQuote;
    FQCONumber: integer;
    FUnitPrice: currency;
    FQuantity: double;
    FCutOut: integer;
    FMaterial: integer;
    FPriceUnit: integer;
    FCutOutDesc: string;
    FMaterialDescr: string;
    FPriceUnitDesc: string;
    FEdgeType: integer;
    FEdgeTypeDesc: string;
    FUnitCost: currency;
    FDiscount: double;
    function GetTotalCost: currency;
    function GetTotalPrice: currency;
    procedure SetParent(const Value: TQuote);
    procedure SetQCONumber(const Value: integer);
    procedure SetCutOut(const Value: integer);
    procedure SetCutOutDesc(const Value: string);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialDescr(const Value: string);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetQuantity(const Value: double);
    procedure SetUnitPrice(const Value: currency);
    procedure SetEdgeType(const Value: integer);
    procedure SetEdgeTypeDesc(const Value: string);
    procedure SetUnitCost(const Value: currency);
    procedure SetDiscount(const Value: double);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQCutOut;
    procedure LoadFromDB;
    procedure SaveToDB;
    property CutOut: integer read FCutOut write SetCutOut;
    property CutOutDesc: string read FCutOutDesc write SetCutOutDesc;
    property Discount: double read FDiscount write SetDiscount;
    property EdgeType: integer read FEdgeType write SetEdgeType;
    property EdgeTypeDesc: string read FEdgeTypeDesc write SetEdgeTypeDesc;
    property Material: integer read FMaterial write SetMaterial;
    Property MaterialDescr: string read FMaterialDescr write SetMaterialDescr;
    property Parent: TQuote read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property QCONumber: integer read FQCONumber write SetQCONumber;
    property Quantity: double read FQuantity write SetQuantity;
    property TotalCost: currency read GetTotalCost;
    property TotalPrice: currency read GetTotalPrice;
    property UnitCost: currency read FUnitCost write SetUnitCost;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
  end;

  TQCutOuts = class;

  TQElement = class
  private
    FParent: TQuote;
    FPieceGrossCost: currency;
    FUnitCost: currency;
    FUnitPrice: currency;
    FPieceUnitCost: currency;
    FGrossPrice: currency;
    Fwidth: double;
    FDepth: double;
    FQuantity: double;
    FPieceQuantity: double;
    FSalesUnit: integer;
    Fthickness: integer;
    Fworktop: integer;
    FSalesUnitDesc: string;
    FworktopDesc: string;
    FthicknessDesc: string;
    FGrossCost: currency;
    FPriceUnit: integer;
    FMaterial: integer;
    FLength: integer;
    FPriceUnitDesc: string;
    FMaterialDescr: string;
    FQENumber: integer;
    FElementType: string;
    FworktopGroup: integer;
    FMaterialUse: integer;
    FMaterialUseDescr: string;
    FOriginalUnitPrice: currency;
    FElementDescription: string;
    function GetTotalPrice: currency;
    procedure SetParent(const Value: TQuote);
    procedure SetDepth(const Value: double);
    procedure SetPieceGrossCost(const Value: currency);
    procedure SetPieceQuantity(const Value: double);
    procedure SetPieceUnitCost(const Value: currency);
    procedure SetQuantity(const Value: double);
    procedure SetSalesUnit(const Value: integer);
    procedure SetSalesUnitDesc(const Value: string);
    procedure Setthickness(const Value: integer);
    procedure SetthicknessDesc(const Value: string);
    procedure SetUnitCost(const Value: currency);
    procedure SetUnitPrice(const Value: currency);
    procedure Setwidth(const Value: double);
    procedure Setworktop(const Value: integer);
    procedure SetworktopDesc(const Value: string);
    procedure SetGrossCost(const Value: currency);
    procedure SetLength(const Value: integer);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialDescr(const Value: string);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetQENumber(const Value: integer);
    procedure SetElementType(const Value: string);
    procedure SetworktopGroup(const Value: integer);
    procedure SetMaterialUse(const Value: integer);
    procedure SetMaterialUseDescr(const Value: string);
    function GetTotalArea: currency;
    procedure SetOriginalUnitPrice(const Value: currency);
    procedure SetElementDescription(const Value: string);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQElement;
    procedure LoadFromDB;
    procedure SaveToDB;
    property ElementDescription: string read FElementDescription write SetElementDescription;
    property ElementType: string read FElementType write SetElementType;
    property Depth: double read FDepth write SetDepth;
    property OriginalUnitPrice: currency read FOriginalUnitPrice write SetOriginalUnitPrice;
    property Length: integer read FLength write SetLength;
    property Material: integer read FMaterial write SetMaterial;
    property MaterialDescr: string read FMaterialDescr write SetMaterialDescr;
    property MaterialUse: integer read FMaterialUse write SetMaterialUse;
    property MaterialUseDescr: string read FMaterialUseDescr write SetMaterialUseDescr;
    property Parent: TQuote read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property QENumber: integer read FQENumber write SetQENumber;
    property Quantity: double read FQuantity write SetQuantity;
    property TotalArea: currency read GetTotalArea;
    property TotalPrice: currency read GetTotalPrice;
    property thickness: integer read Fthickness write Setthickness;
    property thicknessDesc: string read FthicknessDesc write SetthicknessDesc;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
    property worktop: integer read Fworktop write Setworktop;
    property worktopDesc: string read FworktopDesc write SetworktopDesc;
    property worktopGroup: integer read FworktopGroup write SetworktopGroup;
  end;

  TQElements = class;

  TQUpstand = class
  private
    FUnitPrice: currency;
    FQuantity: double;
    FDepth: double;
    FMaterial: integer;
    FQENumber: integer;
    Fworktop: integer;
    FLength: integer;
    FPriceUnit: integer;
    Fthickness: integer;
    FworktopDesc: string;
    FElementType: string;
    FMaterialDescr: string;
    FPriceUnitDesc: string;
    FthicknessDesc: string;
    FParent: TQuote;
    FPolishPrice: currency;
    FMaterialUse: integer;
    FMaterialUseDescr: string;
    FPolishCost: currency;
    FOriginalUnitPrice: currency;
    FNoOfLengths: integer;
    FNoOfDepths: integer;
    FTotalUpstandPieces: integer;
    function GetTotalArea: currency;
    function GetTotalPolishCost: currency;
    function GetTotalPolishPrice: currency;
    function GetTotalPrice: currency;
    procedure SetDepth(const Value: double);
    procedure SetElementType(const Value: string);
    procedure SetLength(const Value: integer);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialDescr(const Value: string);
    procedure SetParent(const Value: TQuote);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetQENumber(const Value: integer);
    procedure SetQuantity(const Value: double);
    procedure Setthickness(const Value: integer);
    procedure SetthicknessDesc(const Value: string);
    procedure SetUnitPrice(const Value: currency);
    procedure Setworktop(const Value: integer);
    procedure SetworktopDesc(const Value: string);
    procedure SetPolishPrice(const Value: currency);
    procedure SetMaterialUse(const Value: integer);
    procedure SetMaterialUseDescr(const Value: string);
    procedure SetPolishCost(const Value: currency);
    procedure SetOriginalUnitPrice(const Value: currency);
    procedure SetNoOfDepths(const Value: integer);
    procedure SetNoOfLengths(const Value: integer);
    procedure SetTotalUpstandPieces(const Value: integer);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQUpstand;
    procedure LoadFromDB;
    procedure SaveToDB;
    property ElementType: string read FElementType write SetElementType;
    property Depth: double read FDepth write SetDepth;
    property Material: integer read FMaterial write SetMaterial;
    property MaterialDescr: string read FMaterialDescr write SetMaterialDescr;
    property MaterialUse: integer read FMaterialUse write SetMaterialUse;
    property MaterialUseDescr: string read FMaterialUseDescr write SetMaterialUseDescr;
    property NoOfDepths: integer read FNoOfDepths write SetNoOfDepths;
    property NoOfLengths: integer read FNoOfLengths write SetNoOfLengths;
    property OriginalUnitPrice: currency read FOriginalUnitPrice write SetOriginalUnitPrice;
    property Parent: TQuote read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property QENumber: integer read FQENumber write SetQENumber;
    property Quantity: double read FQuantity write SetQuantity;
    property TotalArea: currency read GetTotalArea;
    property TotalPrice: currency read GetTotalPrice;
    property TotalPolishCost: currency read GetTotalPolishCost;
    property TotalPolishPrice: currency read GetTotalPolishPrice;
    property TotalUpstandPieces: integer read FTotalUpstandPieces write SetTotalUpstandPieces;
    property thickness: integer read Fthickness write Setthickness;
    property thicknessDesc: string read FthicknessDesc write SetthicknessDesc;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
    property PolishCost: currency read FPolishCost write SetPolishCost;
    property PolishPrice: currency read FPolishPrice write SetPolishPrice;
    property Length: integer read FLength write SetLength;
    property worktop: integer read Fworktop write Setworktop;
    property worktopDesc: string read FworktopDesc write SetworktopDesc;
  end;

  TQUpstands = class;

  TQSlab  = class
  private
    FParent: TQuote;
    FUnitCost: currency;
    FPriceUnit: integer;
    FSupplier: integer;
    Fworktop: integer;
    FDepth: integer;
    Fthickness: integer;
    FLength: integer;
    FthicknessDesc: string;
    FSupplierName: string;
    Fworktopdesc: string;
    FQSlabNo: integer;
    FMaterial: integer;
    FWasteValue: double;
    FWastePercentage: integer;
    FWasteMultiplier: integer;
    FQuantity: double;
    FUnitPrice: currency;
    FMarkupPercentage: double;
    FSlabSize: integer;
    FAdhesiveUnitCost: currency;
    FAdhesiveQuantity: integer;
    FAdhesiveProductCode: string;
    FAdhesiveDescription: string;
    FAdhesiveCostPackQuantity: integer;
    function GetTotalArea: double;
    function GetTotalCost: double;
    function GetTotalPrice: double;
    function GetTotalWasteCost: double;
    procedure SetParent(const Value: TQuote);
    procedure SetDepth(const Value: integer);
    procedure SetLength(const Value: integer);
    procedure SetPriceUnit(const Value: integer);
    procedure SetSupplier(const Value: integer);
    procedure SetSupplierName(const Value: string);
    procedure Setthickness(const Value: integer);
    procedure SetthicknessDesc(const Value: string);
    procedure SetUnitCost(const Value: currency);
    procedure Setworktop(const Value: integer);
    procedure Setworktopdesc(const Value: string);
    procedure SetQSlabNo(const Value: integer);
    procedure SetMaterial(const Value: integer);
    procedure SetWastePercentage(const Value: integer);
    procedure SetWasteValue(const Value: double);
    procedure SetWasteMultiplier(const Value: integer);
    procedure SetQuantity(const Value: double);
    procedure SetMarkupPercentage(const Value: double);
    procedure SetSlabSize(const Value: integer);
    procedure SetUnitPrice(const Value: currency);
    procedure SetAdhesiveProductCode(const Value: string);
    procedure SetAdhesiveQuantity(const Value: integer);
    procedure SetAdhesiveUnitCost(const Value: currency);
    procedure SetAdhesiveDescription(const Value: string);
    procedure SetAdhesiveCostPackQuantity(const Value: integer);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQSlab;
    procedure SaveToDB;
    property AdhesiveProductCode: string read FAdhesiveProductCode write SetAdhesiveProductCode;
    property AdhesiveDescription: string read FAdhesiveDescription write SetAdhesiveDescription;
    property AdhesiveQuantity: integer read FAdhesiveQuantity write SetAdhesiveQuantity;
    property AdhesiveCostPackQuantity: integer read FAdhesiveCostPackQuantity write SetAdhesiveCostPackQuantity;
    property AdhesiveUnitCost: currency read FAdhesiveUnitCost write SetAdhesiveUnitCost;
    property Depth: integer read FDepth write SetDepth;
    property MarkupPercentage: double read FMarkupPercentage write SetMarkupPercentage;
    property Material: integer read FMaterial write SetMaterial;
    property Length: integer read FLength write SetLength;
    property Parent: TQuote read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property QSlabNo: integer read FQSlabNo write SetQSlabNo;
    property Quantity: double read FQuantity write SetQuantity;
    property SlabSize: integer read FSlabSize write SetSlabSize;
    property Supplier: integer read FSupplier write SetSupplier;
    property SupplierName: string read FSupplierName write SetSupplierName;
    property thickness: integer read Fthickness write Setthickness;
    property thicknessDesc: string read FthicknessDesc write SetthicknessDesc;
    property UnitCost: currency read FUnitCost write SetUnitCost;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
    property worktop: integer read Fworktop write Setworktop;
    property worktopdesc: string read Fworktopdesc write Setworktopdesc;
    property TotalArea: double read GetTotalArea;
    property TotalCost: double read GetTotalCost;
    property TotalPrice: double read GetTotalPrice;
    property TotalWasteCost: double read GetTotalWasteCost;
    property WasteMultiplier: integer read FWasteMultiplier write SetWasteMultiplier;
    property WastePercentage: integer read FWastePercentage write SetWastePercentage;
    property WasteValue: double read FWasteValue write SetWasteValue;
  end;

  TQSlabs = class;

  TQEvents    = class
  private
    FParent: TQuote;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TQEvent;
    procedure SetItems(Index: integer; const Value: TQEvent);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aEvent: TQEvent);
    procedure Clear;
    function  Clone : TQEvents;
    procedure Delete(const Index : integer);
    function  IndexOf(const EventNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQEvent read GetItems write SetItems;
      default;
    property Parent : TQuote read FParent;
  end;

  TQExtras   = class
  private
    FParent: TQuote;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TQExtra;
    procedure SetItems(Index: integer; const Value: TQExtra);
    function GetTotalCosts: double;
    function GetTotalSales: double;
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aExtra: TQExtra);
    procedure Clear;
    function  Clone : TQExtras;
    procedure Delete(const Index : integer);
    function  IndexOf(const ExtraNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQExtra read GetItems write SetItems;
      default;
    property Parent : TQuote read FParent;
    property TotalCosts: double read GetTotalCosts;
    property TotalSales: double read GetTotalSales;
  end;

  TQEdges    = class
  private
    FParent: TQuote;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TQEdge;
    procedure SetItems(Index: integer; const Value: TQEdge);
    function GetTotalCosts: double;
    function GetTotalSales: double;
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aEdge : TQEdge);
    procedure Clear;
    function  Clone : TQEdges;
    procedure Delete(const Index : integer);
    function  IndexOf(const EdgeNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQEdge read GetItems write SetItems;
      default;
    property Parent : TQuote read FParent;
    property TotalCosts: double read GetTotalCosts;
    property TotalSales: double read GetTotalSales;
  end;

  TQCutOuts  = class
  private
    FParent: TQuote;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TQCutOut;
    procedure SetItems(Index: integer; const Value: TQCutOut);
    function GetTotalCosts: double;
    function GetTotalSales: double;
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aCutOut : TQCutOut);
    procedure Clear;
    function  Clone : TQCutOuts;
    procedure Delete(const Index : integer);
    function  IndexOf(const CutOutNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQCutOut read GetItems write SetItems;
      default;
    property Parent : TQuote read FParent;
    property TotalCosts: double read GetTotalCosts;
    property TotalSales: double read GetTotalSales;
  end;

  TQElements  = class
  private
    FParent: TQuote;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TQElement;
    procedure SetItems(Index: integer; const Value: TQElement);
    function GetTotalArea: double;
    function GetTotalSales: double;
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aElement : TQElement);
    procedure Clear;
    function  Clone : TQElements;
    procedure Delete(const Index : integer);
    function  IndexOf(const ElementNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQElement read GetItems write SetItems;
      default;
    property Parent : TQuote read FParent;
    property TotalArea: double read GetTotalArea;
    property TotalSales: double read GetTotalSales;
  end;

  TQUpstands  = class
  private
    FParent: TQuote;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TQUpstand;
    procedure SetItems(Index: integer; const Value: TQUpstand);
    function GetTotalArea: double;
    function GetTotalSales: double;
    function GetTotalCosts: double;
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aUpstand : TQUpstand);
    procedure Clear;
    function  Clone : TQUpstands;
    procedure Delete(const Index : integer);
    function  IndexOf(const UpstandNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQUpstand read GetItems write SetItems;
      default;
    property Parent : TQuote read FParent;
    property TotalArea: double read GetTotalArea;
    property TotalCosts: double read GetTotalCosts;
    property TotalSales: double read GetTotalSales;
  end;

  TQSlabs  = class
  private
    FParent: TQuote;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TQSlab;
    procedure SetItems(Index: integer; const Value: TQSlab);
    function GetTotalArea: double;
    function GetTotalCosts: double;
    function GetTotalWasteCosts: double;
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aSlab : TQSlab);
    procedure Clear;
    function  Clone : TQSlabs;
    procedure Delete(const Index : integer);
    function  IndexOf(const SlabNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQSlab read GetItems write SetItems;
      default;
    property Parent : TQuote read FParent;
    property TotalArea: double read GetTotalArea;
    property TotalCosts: double read GetTotalCosts;
    property TotalWasteCosts: double read GetTotalWasteCosts;
  end;

  TQuote = class
  private
    FVatValue: currency;
    FSurveyPrice: currency;
    FDeliveryPrice: currency;
    FDiscValue: currency;
    FMarkupValue: currency;
    FGrossPrice: currency;
    FInstallPrice: currency;
    FNettPrice: currency;
    FEstimator: integer;
    FVatCode: string;
    FCustomer: integer;
    FMaterialType: integer;
    FdbKey: integer;
    FNoOfElements: integer;
    FDiscRate: real;
    FOrderedFlag: string;
    FMaterialName: string;
    FCustomerName: string;
    FDescription: string;
    FEstimatorName: string;
    FReference: string;
    FContactName: string;
    FQDate: TDateTime;
    FQElements: TQElements;
    FQCutOuts: TQCutOuts;
    FQEdges: TQEdges;
    FQExtras: TQExtras;
    FDataModule: TdtmdlQuote;
    FExtraNotes: integer;
    FAvailability: integer;
    FReason: integer;
    FContact: integer;
    FStatus: integer;
    FTerms: integer;
    FStatusDescr: string;
    FInactive: string;
    FDateRequired: TDateTime;
    FAddress: integer;
    FMaterial: integer;
    FMaterialDesc: string;
    FOperator: integer;
    FOperatorName: string;
    FRetail: bytebool;
    FQUpstands: TQUpstands;
    FVat: integer;
    FVatRate: real;
    FDiscountRate: double;
    FDiscountValue: currency;
    FQEvents: TQEvents;
    FInstallAddress: integer;
    FTemplateDate: TDateTime;
    FDepositAmount: currency;
    FDepositTerms: double;
    FAcceptedDate: TDateTime;
    FLeadSource: integer;
    FDesignerID: integer;
    FBranch: integer;
    FInstallPhone: string;
    FInstallName: string;
    FOrderRefNo: string;
    FAccountManager: integer;
    FFittingLabourHours: double;
    FFittingLabourRate: double;
    FTemplateLabourHours: double;
    FTemplateLabourRate: double;
    FFittingMileageRate: integer;
    FFittingMileage: integer;
    FTemplateMileageRate: integer;
    FTemplateMileage: integer;
    FQSlabs: TQSlabs;
    FHandlingRate: double;
    FDeliveryLabourHours: double;
    FDeliveryLabourRate: double;
    FDeliveryMileage: integer;
    FDeliveryMileageRate: integer;
    FMileageRate: integer;
    FMileage: integer;
    FMarkupRate: double;
    FImportance: string;
    FFittingLabourMen: integer;
    FDeliveryLabourMen: integer;
    FOriginalQuote: integer;
    FQMode: TQMode;
    FContractQuote: boolean;
    FContractOption: integer;
    FContractLine: integer;
    FContractQuoteNumber: integer;
    FContractGroup: integer;
    FCutOutDiscount: double;
    FEdgeDiscount: double;
    FQuoteNumber: double;
    FThickness: integer;
    FTimescale: string;
    FCallBackDay: string;
    FCallBackTime: string;
    FOnMailingList: string;
    FProjectReference: string;
    FSpeculative: boolean;
    FExpiryDate: TDateTime;
    FRevenueCentre: integer;
    function GetTotalDeliveryCost: currency;
    function GetTotalDiscount: currency;
    function GetTotalDiscountablePrice: currency;
    function GetTotalDiscounted: currency;
    function GetTotalPrice: currency;
    function GetTotalVat: currency;
    function GetTotalGross: currency;
    function GetTotalSupplyCost: currency;
    function GetTotalFittingCost: currency;
    function GetTotalTemplateCost: currency;
    function GetTotalWasteCost: currency;
    procedure SetContactName(const Value: string);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetdbKey(const Value: integer);
    procedure SetDeliveryPrice(const Value: currency);
    procedure SetDescription(const Value: string);
    procedure SetDiscRate(const Value: real);
    procedure SetDiscValue(const Value: currency);
    procedure SetEstimator(const Value: integer);
    procedure SetEstimatorName(const Value: string);
    procedure SetGrossPrice(const Value: currency);
    procedure SetInstallPrice(const Value: currency);
    procedure SetMarkupValue(const Value: currency);
    procedure SetMaterialName(const Value: string);
    procedure SetMaterialType(const Value: integer);
    procedure SetNettPrice(const Value: currency);
    procedure SetNoOfElements(const Value: integer);
    procedure SetOrderedFlag(const Value: string);
    procedure SetQDate(const Value: TDateTime);
    procedure SetReference(const Value: string);
    procedure SetSurveyPrice(const Value: currency);
    procedure SetVatCode(const Value: string);
    procedure SetAvailability(const Value: integer);
    procedure SetContact(const Value: integer);
    procedure SetDateRequired(const Value: TDateTime);
    procedure SetExtraNotes(const Value: integer);
    procedure SetInactive(const Value: string);
    procedure SetReason(const Value: integer);
    procedure SetStatus(const Value: integer);
    procedure SetStatusDescr(const Value: string);
    procedure SetTerms(const Value: integer);
    procedure SetAddress(const Value: integer);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialDesc(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetRetail(const Value: bytebool);
    procedure SetVat(const Value: integer);
    procedure SetVatRate(const Value: real);
    procedure SetDiscountRate(const Value: double);
    procedure SetDiscountValue(const Value: currency);
    procedure SetInstallAddress(const Value: integer);
    procedure SetTemplateDate(const Value: TDateTime);
    procedure SetDepositAmount(const Value: currency);
    procedure SetDepositTerms(const Value: double);
    procedure SetAcceptedDate(const Value: TDateTime);
    function GetCurrentStatus: integer;
    function GetNextReQuoteNumber: real;
    procedure SetLeadSource(const Value: integer);
    procedure SetDesignerID(const Value: integer);
    procedure SetBranch(const Value: integer);
    procedure SetInstallName(const Value: string);
    procedure SetInstallPhone(const Value: string);
    procedure SetOrderRefNo(const Value: string);
    procedure SetAccountManager(const Value: integer);
    procedure SetFittingLabourHours(const Value: double);
    procedure SetFittingLabourRate(const Value: double);
    procedure SetFittingMileage(const Value: integer);
    procedure SetFittingMileageRate(const Value: integer);
    procedure SetTemplateLabourHours(const Value: double);
    procedure SetTemplateLabourRate(const Value: double);
    procedure SetTemplateMileage(const Value: integer);
    procedure SetTemplateMileageRate(const Value: integer);
    procedure SetHandlingRate(const Value: double);
    procedure SetDeliveryLabourHours(const Value: double);
    procedure SetDeliveryLabourRate(const Value: double);
    procedure SetDeliveryMileage(const Value: integer);
    procedure SetDeliveryMileageRate(const Value: integer);
    procedure SetMileageRate(const Value: integer);
    procedure SetMileage(const Value: integer);
    procedure SetMarkupRate(const Value: double);
    procedure SetImportance(const Value: string);
    procedure SetFittingLabourMen(const Value: integer);
    procedure SetDeliveryLabourMen(const Value: integer);
    procedure SetOriginalQuote(const Value: integer);
    procedure SetQMode(const Value: TQMode);
    procedure SetContractQuote(const Value: boolean);
    procedure SetContractLine(const Value: integer);
    procedure SetContractOption(const Value: integer);
    procedure SetContractQuoteNumber(const Value: integer);
    procedure SetContractGroup(const Value: integer);
    procedure SetCutOutDiscount(const Value: double);
    procedure SetEdgeDiscount(const Value: double);
    procedure SetQuoteNumber(const Value: double);
    procedure SetThickness(const Value: integer);
    procedure SetTimescale(const Value: string);
    procedure SetCallBackDay(const Value: string);
    procedure SetCallBackTime(const Value: string);
    procedure SetOnMailingList(const Value: string);
    procedure SetProjectReference(const Value: string);
    procedure SetSpeculative(const Value: boolean);
    procedure SetExpiryDate(const Value: TDateTime);
    procedure SetRevenueCentre(const Value: integer);
  public
    constructor Create(DataModule : TdtmdlQuote);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TQuote;
    procedure DeclineAllQuotes;
    procedure DeleteAddress;
    procedure DeleteFromDB;
    procedure DeleteElements;
    procedure DeleteUpstands;
    procedure DeleteCutOuts;
    procedure DeleteEdges;
    procedure DeleteExtraNotes;
    procedure DeleteExtras;
    procedure DeleteEvents;
    procedure DeleteInstallAddress;
    procedure DeleteSlabs;
    function GetNextContractQuoteNumber: real;
    procedure LoadFromDB;
    procedure LoadElements;
    procedure LoadCutOuts;
    procedure LoadEdges;
    procedure LoadExtras;
    procedure LoadUpstands;
    procedure LoadEvents;
    procedure LoadSlabs;
    procedure SaveToDB(TempAll: boolean);
    procedure SaveCutOuts;
    procedure SaveEdges;
    procedure SaveExtras;
    procedure SaveElements;
    procedure SaveUpstands;
    procedure SaveEvents;
    procedure SaveSlabs;
    procedure SaveQuoteNumber;
    procedure SaveSalesOrder;
    property AcceptedDate: TDateTime read FAcceptedDate write SetAcceptedDate;
    property AccountManager: integer read FAccountManager write SetAccountManager;
    property Address: integer read FAddress write SetAddress;
    property Availability: integer read FAvailability write SetAvailability;
    property Branch: integer read FBranch write SetBranch;
    property CallBackDay: string read FCallBackDay write SetCallBackDay;
    property CallBackTime: string read FCallBackTime write SetCallBackTime;
    property ContactName: string read FContactName write SetContactName;
    property ContractGroup: integer read FContractGroup write SetContractGroup;
    property ContractLine: integer read FContractLine write SetContractLine;
    property ContractOption: integer read FContractOption write SetContractOption;
    property ContractQuote: boolean read FContractQuote write SetContractQuote;
    property ContractQuoteNumber: integer read FContractQuoteNumber write SetContractQuoteNumber;
    property CurrentStatus: integer read GetCurrentStatus;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property CutOuts: TQCutOuts read FQCutOuts;
    property CutOutDiscount: double read FCutOutDiscount write SetCutOutDiscount;
    property DataModule: TdtmdlQuote read FDataModule;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property dbKey: integer read FdbKey write SetdbKey;
    property DeliveryPrice: currency read FDeliveryPrice write SetDeliveryPrice;
    property DeliveryLabourHours: double read FDeliveryLabourHours write SetDeliveryLabourHours;
    property DeliveryLabourRate: double read FDeliveryLabourRate write SetDeliveryLabourRate;
    property DeliveryLabourMen: integer read FDeliveryLabourMen write SetDeliveryLabourMen;
    property DeliveryMileage: integer read FDeliveryMileage write SetDeliveryMileage;
    property DeliveryMileageRate: integer read FDeliveryMileageRate write SetDeliveryMileageRate;
    property Description: string read FDescription write SetDescription;
    property DepositTerms: double read FDepositTerms write SetDepositTerms;
    property DepositAmount: currency read FDepositAmount write SetDepositAmount;
    property DesignerID: integer read FDesignerID write SetDesignerID;
    property DiscountRate: double read FDiscountRate write SetDiscountRate;
    property DiscountValue: currency read FDiscountValue write SetDiscountValue;
    property EdgeDiscount: double read FEdgeDiscount write SetEdgeDiscount;
    property Edges: TQEdges read FQEdges;
    property Elements: TQElements read FQElements;
    property Estimator: integer read FEstimator write SetEstimator;
    property EstimatorName: string read FEstimatorName write SetEstimatorName;
    property Events: TQEvents read FQEvents;
    property ExpiryDate: TDateTime read FExpiryDate write SetExpiryDate;
    property ExtraNotes: integer read FExtraNotes write SetExtraNotes;
    property Extras: TQExtras read FQExtras;
    property FittingLabourHours: double read FFittingLabourHours write SetFittingLabourHours;
    property FittingLabourMen: integer read FFittingLabourMen write SetFittingLabourMen;
    property FittingLabourRate: double read FFittingLabourRate write SetFittingLabourRate;
    property FittingMileage: integer read FFittingMileage write SetFittingMileage;
    property FittingMileageRate: integer read FFittingMileageRate write SetFittingMileageRate;
    property HandlingRate: double read FHandlingRate write SetHandlingRate;
    property Importance: string read FImportance write SetImportance;
    property Inactive: string read FInactive write SetInactive;
    property InstallAddress: integer read FInstallAddress write SetInstallAddress;
    property InstallName: string read FInstallName write SetInstallName;
    property InstallPhone: string read FInstallPhone write SetInstallPhone;
    property InstallPrice: currency read FInstallPrice write SetInstallPrice;
    property LeadSource: integer read FLeadSource write SetLeadSource;
    property MarkupRate: double read FMarkupRate write SetMarkupRate;
    property MarkupValue: currency read FMarkupValue write SetMarkupValue;
    property Material:integer read FMaterial write SetMaterial;
    property MaterialDesc: string read FMaterialDesc write SetMaterialDesc;
    property Mileage: integer read FMileage write SetMileage;
    property MileageRate: integer read FMileageRate write SetMileageRate;
    property NettPrice: currency read FNettPrice write SetNettPrice;
    property OnMailingList: string read FOnMailingList write SetOnMailingList;
    property OrderRefNo: string read FOrderRefNo write SetOrderRefNo;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property OriginalQuote: integer read FOriginalQuote write SetOriginalQuote;
    property ProjectReference: string read FProjectReference write SetProjectReference;
    property QDate: TDateTime read FQDate write SetQDate;
    property QMode: TQMode read FQMode write SetQMode;
    property QuoteNumber: double read FQuoteNumber write SetQuoteNumber;
    property Reason: integer read FReason write SetReason;
    property RevenueCentre: integer read FRevenueCentre write SetRevenueCentre;
    property Retail: bytebool read FRetail write SetRetail;
    property Reference: string read FReference write SetReference;
    property Slabs: TQSlabs read FQSlabs;
    property Speculative: boolean read FSpeculative write SetSpeculative;
    property Status: integer read FStatus write SetStatus;
    property StatusDescr: string read FStatusDescr write SetStatusDescr;
    property SurveyPrice: currency read FSurveyPrice write SetSurveyPrice;
    property TemplateDate: TDateTime read FTemplateDate write SetTemplateDate;
    property TemplateLabourHours: double read FTemplateLabourHours write SetTemplateLabourHours;
    property TemplateLabourRate: double read FTemplateLabourRate write SetTemplateLabourRate;
    property TemplateMileage: integer read FTemplateMileage write SetTemplateMileage;
    property TemplateMileageRate: integer read FTemplateMileageRate write SetTemplateMileageRate;
    property Terms: integer read FTerms write SetTerms;
    property Thickness: integer read FThickness write SetThickness;
    property Timescale: string read FTimescale write SetTimescale;
    property TotalDeliveryCost: currency read GetTotalDeliveryCost;
    property TotalDiscountablePrice: currency read GetTotalDiscountablePrice;
    property TotalSupplyCost: currency read GetTotalSupplyCost;
    property TotalPrice: currency read GetTotalPrice;
    property TotalVat: currency read GetTotalVat;
    property TotalGross: currency read GetTotalGross;
    property TotalDiscount: currency read GetTotalDiscount;
    property TotalDiscounted: currency read GetTotalDiscounted;
    property TotalTemplateCost: currency read GetTotalTemplateCost;
    property TotalFittingCost: currency read GetTotalFittingCost;
    property TotalWasteCost: currency read GetTotalWasteCost;
    property Upstands: TQUpstands read FQUpstands;
    property Vat: integer read FVat write SetVat;
    property VatRate: real read FVatRate write SetVatRate;
  end;

var
  dtmdlQuote: TdtmdlQuote;

implementation

uses
  wtDataModule, wtMain;

{$R *.DFM}

function TdtmdlQuote.GetCurrentQuote: integer;
begin
  if dtsAllQuotes.dataset.RecordCount > 0 then
    Result := dtsAllQuotes.dataset.FieldByName('Quote').AsInteger
  else
    Result := 0;
end;

function TdtmdlQuote.GetHeaderCount: integer;
begin
  Result := qryCustQuotes.recordcount;
end;

function TdtmdlQuote.GetNextQNumber: integer;
begin
  with qryQGetLast do
    begin
      close;
      open;
      result := fieldbyname('Last_Quote_number').asinteger + 1;
    end;
end;

procedure TdtmdlQuote.Refreshdata;
begin
  with qryCustQuotes do
    begin
      close;
      parambyname('Description').asstring := '%' + Description + '%';
      parambyname('Customer').asinteger := Customer;
      open;
    end;
end;

procedure TdtmdlQuote.RefreshAlldata;
var
  tempDate: TDateTime;
  sTemp : string;
  sTempCount: string;
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
{ Local function }
begin
  sTemp := '';
  with qryAllQuotes do
    begin
      sql.Clear;

      if ShowRecords = 0 then
        stemp := 'SELECT TOP ' + inttostr(3000)
      else
        stemp := 'SELECT TOP ' + inttostr(ShowRecords);

//      stemp := 'SELECT DISTINCT TOP ';
      sTemp := stemp + qryDummy.sql.text;

      if QuoteDate > 0 then
        sTemp := sTemp + ' AND Quote.Date_Raised >= ' + qDate(QuoteDate)
      else
      if ShowMonths > 0 then
        begin
          tempDate := incmonth(date,(ShowMonths*-1));
          sTemp := sTemp + ' AND Quote.Date_Raised >= ' + qDate(tempDate);
        end;

      if CustomerName <> '' then
        sTemp := sTemp + ' AND Quote.Customer_name LIKE ''%' + CustomerName + '%''';
      if Description <> '' then
        sTemp := sTemp + ' AND Quote.Description LIKE ''%' + Description + '%''';
      if QuoteReference <> '' then
        sTemp := sTemp + ' AND Quote.Quote_Number LIKE ''' + QuoteReference + '%''';
      if ProjectReference <> '' then
        sTemp := sTemp + ' AND Quote.Project_Reference LIKE ''%' + ProjectReference + '%''';
      if Reference <> '' then
        sTemp := sTemp + ' AND Quote.Reference LIKE ''%' + Reference + '%''';
      if Material <> '' then
        sTemp := sTemp + ' AND Material_Type.Description LIKE ''%' + Material + '%''';
      if Status <> '' then
        sTemp := sTemp + ' AND Quote_Status.Quote_status_description LIKE ''%' + Status + '%''';
      if ShowLive then
        sTemp := sTemp + ' AND Quote_Status.Quote_status < 23'
      else
        sTemp := sTemp + ' AND Quote_Status.Quote_status > 1';

      if ExpiryDate > 0 then
        sTemp := sTemp + ' AND Quote.Expiry_Date <= ' + qDate(ExpiryDate);

      sTemp := sTemp + ' AND ((Quote.inactive is NULL) or (Quote.inactive = ''N'') or '
                         + '(Quote.inactive = ''' + ShowInactive + '''))';
      if HighImportance then
        sTemp := sTemp + ' AND (Quote.Importance = ''H'') AND (Quote.Quote_Status < 23)';

      if TradeRetail = 1 then
        sTemp := sTemp + ' AND (((Customer.Is_Retail_Customer <> ''Y'') AND ((Customer.Is_Commercial_Customer <> ''Y'') OR (Customer.Is_Commercial_Customer IS NULL))))'
      else
      if TradeRetail = 2 then
        sTemp := sTemp + ' AND (Customer.Is_Retail_Customer = ''Y'')'
      else
      if TradeRetail = 3 then
        sTemp := sTemp + ' AND (Customer.Is_Commercial_Customer = ''Y'')' ;

      if SortOrder = '' then
        sTemp := sTemp + ' ORDER BY Quote.Quote desc'
      else
        sTemp := sTemp + ' ORDER BY ' + SortOrder;

      sql.text := sTemp;
    end;

  with qryAllQuotes do
    begin
      close;
      open;
    end;
end;

{ TQuote }

procedure TQuote.Clear;
begin
  Customer :=       0;
  CustomerName :=   '';
  QDate :=           0;
  ExpiryDate :=      0;
  Address :=        0;
  FQElements.Clear;
  FQCutOuts.Clear;
  FQEdges.Clear;
  FQExtras.Clear;
  FQUpstands.Clear;
  FQEvents.Clear;
  FQSlabs.Clear;
end;

function TQuote.Clone: TQuote;
begin
  Result := TQuote.Create(FDataModule);
  Result.AcceptedDate :=  self.AcceptedDate;
  Result.Address  :=      self.Address;
  Result.AccountManager := self.AccountManager;
  Result.Availability :=  self.Availability;
  Result.Branch :=        self.Branch;
  Result.CallBackDay :=   self.CallBackDay;
  Result.CallBackTime :=  self.CallBackTime;
  Result.ContractLine :=  self.ContractLine;
  Result.ContractGroup := self.ContractGroup;
  Result.ContractOption := self.ContractOption;
  Result.ContractQuote := self.ContractQuote;
  Result.ContractQuoteNumber := self.ContractQuoteNumber;
  Result.Customer:=       self.Customer;
  Result.CustomerName:=   self.CustomerName;
  Result.CutOutDiscount :=  self.CutOutDiscount;
  Result.DateRequired :=  self.DateRequired;
  Result.DesignerID :=    self.DesignerID;
  Result.DeliveryPrice:=  self.DeliveryPrice;
  Result.DeliveryLabourHours  :=  self.DeliveryLabourHours;
  Result.DeliveryLabourRate :=    self.DeliveryLabourRate;
  Result.DeliveryLabourMen  :=    self.DeliveryLabourMen;
  Result.DeliveryMileage  :=      self.DeliveryMileage;
  Result.DeliveryMileageRate  :=  self.DeliveryMileageRate;
  Result.DepositTerms :=  self.DepositTerms;
  Result.DepositAmount := self.DepositAmount;
  Result.Description:=    self.Description;
  Result.DiscountRate :=  self.DiscountRate;
  Result.DiscountValue := self.DiscountValue;
  Result.Estimator:=      self.Estimator;
  Result.ExpiryDate :=    self.ExpiryDate;
  Result.ExtraNotes :=    self.ExtraNotes;
  Result.EdgeDiscount :=  self.EdgeDiscount;
  Result.FittingLabourHours  :=  self.FittingLabourHours;
  Result.FittingLabourMen :=     self.FittingLabourMen;
  Result.FittingLabourRate :=    self.FittingLabourRate;
  Result.FittingMileage  :=      self.FittingMileage;
  Result.FittingMileageRate  :=  self.FittingMileageRate;
  Result.HandlingRate  := self.HandlingRate;
  Result.Importance :=    self.Importance;
  Result.Inactive :=      self.Inactive;
  Result.InstallAddress:= self.InstallAddress;
  Result.InstallName := self.InstallName;
  Result.InstallPhone :=  self.InstallPhone;
  Result.InstallPrice:=   self.InstallPrice;
  Result.LeadSource :=    self.LeadSource;
  Result.MarkupRate :=    self.MarkupRate;
  Result.MarkupValue :=   self.MarkupValue;
  Result.Material :=      self.Material;
  Result.MaterialDesc :=  self.MaterialDesc;
  Result.Mileage  :=      self.Mileage;
  Result.MileageRate  :=  self.MileageRate;
  Result.NettPrice:=      self.NettPrice;
  Result.OnMailingList := self.OnMailingList;
  Result.OrderRefNo :=    self.OrderRefNo;
  Result.Operator :=      self.Operator;
  Result.OperatorName :=  self.OperatorName;
  Result.OriginalQuote := self.OriginalQuote;
  Result.EstimatorName:=  self.EstimatorName;
  Result.ProjectReference  :=      self.ProjectReference;
  Result.Reference:=      self.Reference;
  Result.Reason :=        self.reason;
  REsult.RevenueCentre  := self.RevenueCentre;
  Result.retail :=        self.Retail;
  Result.Status :=        self.Status;
  Result.StatusDescr :=   self.StatusDescr;
  Result.Speculative :=   self.Speculative;
  Result.SurveyPrice:=    self.SurveyPrice;
  Result.Terms :=         self.Terms;
  Result.TemplateDate :=  self.TemplateDate;
  Result.Thickness :=     self.Thickness;
  Result.Timescale :=     self.Timescale;
  Result.ContactName:=    self.ContactName;
  Result.QDate:=          self.QDate;
  Result.QMode :=         self.QMode;
  Result.QuoteNumber :=   self.QuoteNumber;
  Result.TemplateLabourHours  :=  self.TemplateLabourHours;
  Result.TemplateLabourRate :=    self.TemplateLabourRate;
  Result.TemplateMileage  :=      self.TemplateMileage;
  Result.TemplateMileageRate  :=  self.TemplateMileageRate;
  Result.Vat  :=          self.Vat;
  Result.VatRate  :=      self.VatRate;
  Result.FQElements.Free;
  Result.FQElements :=  Self.FQElements.Clone;
  Result.FQUpstands.Free;
  Result.FQUpstands :=  Self.FQUpstands.Clone;
  Result.FQCutOuts.Free;
  Result.FQCutOuts :=  Self.FQCutOuts.Clone;
  Result.FQEdges.Free;
  Result.FQEdges :=  Self.FQEdges.Clone;
  Result.FQExtras.Free;
  Result.FQExtras :=  Self.FQExtras.Clone;
  Result.FQEvents.Free;
  Result.FQEvents :=  Self.FQEvents.Clone;
  Result.FQSlabs.Free;
  Result.FQSlabs :=  Self.FQSlabs.Clone;
end;

constructor TQuote.Create(DataModule: TdtmdlQuote);
begin
  FDataModule := DataModule;
  FQElements := TQElements.Create(Self);
  FQUpstands := TQUpstands.Create(Self);
  FQCutOuts := TQCutOuts.Create(Self);
  FQEdges := TQEdges.Create(Self);
  FQExtras := TQExtras.Create(Self);
  FQEvents := TQEvents.Create(Self);
  FQSlabs := TQSlabs.Create(Self);
end;

procedure TQuote.DeleteFromDB;
begin
  DeleteElements;
  DeleteCutOuts;
  DeleteEdges;
  DeleteExtras;
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote WHERE Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;
  DeleteExtraNotes;
  DeleteInstallAddress;
  DeleteAddress;
end;

destructor TQuote.Destroy;
begin
  FQElements.Free;
  FQCutOuts.Free;
  FQEdges.Free;
  FQExtras.Free;
  FQUpstands.Free;
  FQEvents.Free;
  FQSlabs.Free;
  inherited;
end;

procedure TQuote.LoadFromDB;
begin
  { Load the header record then all lines belonging to the quote }
  Clear;
  with FDataModule.qryQHeader do
  begin
    Close;
    ParamByName('Quote').AsInteger := DbKey;
    Open;
    AcceptedDate  :=  fieldbyname('Date_Accepted').asdatetime;
    Address :=      fieldbyname('Address').asinteger;
    Material :=       fieldbyname('Material_type').asinteger;
    MaterialDesc :=   fieldbyname('Material_Description').asstring;
    Availability :=    fieldbyname('Availability').asinteger;
    if fieldbyname('Account_Manager').asinteger = 0 then
      AccountManager := fieldbyname('Operator').asinteger
    else
      AccountManager := fieldbyname('Account_Manager').asinteger;
    Branch :=         fieldbyname('Branch_no').AsInteger;
    CallBackDay :=    fieldbyname('Call_Day').Asstring;
    CallBackTime :=    fieldbyname('Call_Time').Asstring;
    Timescale :=    fieldbyname('Timescale').Asstring;
    ContractQuote := (fieldbyname('Contract_Quote').AsString = 'Y');
    ContractQuoteNumber := fieldbyname('Contract_Quote_id').Asinteger;
    DateRequired :=    fieldbyname('Date_Required').asdatetime;
    DesignerID :=       fieldbyname('Designer').asinteger;
    if fieldbyname('Discount_Rate').Asstring = '' then
      DiscountRate  :=  0.00
    else
      DiscountRate  :=  fieldbyname('Discount_Rate').AsFloat;
    DiscountValue := fieldbyname('Discount_Value').asfloat;
    ExpiryDate := fieldbyname('Expiry_Date').asdatetime;
    ExtraNotes :=     fieldbyname('Extra_Notes').asinteger;
    Terms :=          fieldbyname('Payment_Terms').asinteger;
    SurveyPrice:=    fieldbyname('Survey_Price').asfloat;
    DeliveryPrice:=  fieldbyname('Delivery_Price').asfloat;

    DeliveryMileage := fieldbyname('Delivery_Mileage').asinteger;
    DeliveryMileageRate := fieldbyname('Delivery_Mileage_Rate').asinteger;
    DeliveryLabourHours := fieldbyname('Delivery_Labour').asfloat;
    DeliveryLabourRate := fieldbyname('Delivery_Labour_Rate').asfloat;
    if fieldbyname('Delivery_Labour_Men').asinteger = 0 then
      DeliveryLabourMen  := 1
    else
      DeliveryLabourMen  := fieldbyname('Delivery_Labour_Men').asinteger;

    DepositTerms :=  fieldbyname('Deposit_Terms').asinteger;
    DepositAmount := fieldbyname('Deposit_Amount').asfloat;

    HandlingRate := fieldbyname('Worktop_Handling_Rate').asfloat;

    FittingMileage := fieldbyname('Fitting_Mileage').asinteger;
    FittingMileageRate := fieldbyname('Fitting_Mileage_Rate').asinteger;
    FittingLabourHours := fieldbyname('Fitting_Labour').asfloat;
    FittingLabourRate := fieldbyname('Fitting_Labour_Rate').asfloat;
    if fieldbyname('Fitting_Labour_Men').asinteger = 0 then
      FittingLabourMen  := 1
    else
      FittingLabourMen  := fieldbyname('Fitting_Labour_Men').asinteger;

    Importance := fieldbyname('Importance').asstring;

    LeadSource :=     fieldbyname('Sales_Lead_Source').asinteger;

    if fieldbyname('MArkup_Rate').Asstring = '' then
      MarkupRate  :=  0.00
    else
      MarkupRate  :=  fieldbyname('Markup_Rate').AsFloat;
    MarkupValue := fieldbyname('Markup_Value').asfloat;

    InstallAddress := fieldbyname('Install_Address').asinteger;
    InstallName := fieldbyname('Install_Name').asstring;
    InstallPhone := fieldbyname('Install_Phone').asstring;
    TemplateDate :=   fieldbyname('Template_Date').asdatetime;
    InstallPrice:=   fieldbyname('Installation_Price').asfloat;
    NettPrice:=      fieldbyname('Nett_Price').asfloat;
    OrderRefNo :=     fieldbyname('Order_Ref_No').asstring;
    Operator :=       fieldbyname('operator').asinteger;
    OperatorName :=   fieldbyname('Operator_Name').asstring;

    if qMode = qRequote then
      begin
        if (fieldbyname('Original_Quote').AsInteger <> 0) and
           (fieldbyname('Quote').AsInteger <> fieldbyname('Original_Quote').AsInteger) then
          OriginalQuote := fieldbyname('Original_Quote').AsInteger
        else
          OriginalQuote := fieldbyname('Quote').AsInteger;
      end
    else
      begin
        if fieldbyname('Original_Quote').AsInteger = 0 then
          OriginalQuote := dbKey
        else
          OriginalQuote := fieldbyname('Original_Quote').AsInteger;
      end;

    Estimator:=      fieldbyname('Operator').asinteger;
    Customer:=       fieldbyname('Customer').asinteger;
    CustomerName:=   fieldbyname('Customer_Name').asstring;
    Description:=    fieldbyname('Description').asstring;
    EstimatorName:=  fieldbyname('Operator_Name').asstring;
    ProjectReference  :=
                     fieldbyname('Project_Reference').asstring;
    Reference:=      fieldbyname('Reference').asstring;
    ContactName:=    fieldbyname('Contact_Name').asstring;
    QDate:=          fieldbyname('Date_Raised').asdatetime;
    Status :=        fieldbyname('Quote_Status').asinteger;
    StatusDescr :=   fieldbyname('Status_Description').asstring;
    Inactive :=      fieldbyname('Inactive').asstring;
    Reason :=        fieldbyname('Inactive_Reason').asinteger;

    QuoteNumber :=   fieldbyname('Quote_Number').asfloat;
    TemplateMileage := fieldbyname('Template_Mileage').asinteger;
    TemplateMileageRate := fieldbyname('Template_Mileage_Rate').asinteger;
    TemplateLabourHours := fieldbyname('Template_Labour').asfloat;
    TemplateLabourRate := fieldbyname('Template_Labour_Rate').asfloat;

    Mileage := 0;
    if DeliveryMileage <> 0 then
      Mileage := DeliveryMileage
    else
    if FittingMileage <> 0 then
      Mileage := FittingMileage
    else
    if TemplateMileage <> 0 then
      Mileage := TemplateMileage;

    MileageRate := 0;
    if DeliveryMileageRate <> 0 then
      MileageRate := DeliveryMileageRate
    else
    if FittingMileageRate <> 0 then
      MileageRate := FittingMileageRate
    else
    if TemplateMileageRate <> 0 then
      MileageRate := TemplateMileageRate;

    if (qMode = qCopy) then
      begin
        Vat :=           dtmdlWorktops.GetCustomerVAT(Customer);
        VatRate :=       dtmdlWorktops.GetCustomerVATRate(Customer);
      end
    else
      begin
        Vat :=           fieldbyname('vat').asinteger;
        VatRate :=       fieldbyname('vat_rate').asfloat;
      end;

    RevenueCentre := fieldbyname('Revenue_Centre').asinteger;
    Speculative := fieldbyname('Customer_is_Speculative').asstring = 'Y';
    Close;
  end;
  LoadElements;
  LoadUpstands;
  LoadCutOuts;
  LoadEdges;
  LoadExtras;
  if (qMode <> qRequote) and (qMode <> qCopy) then
    LoadEvents;
  LoadSlabs;
end;

procedure TQuote.LoadElements;
var
  aElement : TQElement;
  sText: string;
begin
  FQElements.Clear;
  with FDataModule.qryQAllElements do
  begin
    Close;

    if dtmdlWorktops.IsSQL then
      begin
        sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
        SQL.Text := sText;
      end;

    ParamByName('Quote').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aElement := TQElement.Create(Self);
      aElement.QENumber := FieldByName('Element_Number').AsInteger;
      aElement.Material := FieldByName('Material_Type').AsInteger;
      aElement.MaterialDescr := FieldByName('Material_Description').Asstring;
      aElement.ElementDescription := FieldByName('Element_Description').Asstring;
      aElement.ElementType := FieldByName('Element_Type').Asstring;
      aElement.Depth := FieldByName('Depth').asfloat;
      aElement.Length := FieldByName('Length').asinteger;
      aElement.Quantity := FieldByName('Quantity').asfloat;
      aElement.thickness := FieldByName('thickness').asinteger;
      aElement.thicknessDesc := FieldByName('thickness_mm').asstring;
      aElement.UnitPrice := FieldByName('Unit_Price').asfloat;
      aElement.PriceUnit := FieldByName('Price_unit').asinteger;
      aElement.Worktop := FieldByName('worktop').asinteger;
      aElement.worktopDesc := FieldByName('worktop_Description').asstring;
      aElement.worktopGroup := FieldByName('worktop_group').asinteger;
      aElement.MaterialUse := FieldByName('Material_Use').AsInteger;
      aElement.MaterialUseDescr := FieldByName('Use_Description').Asstring;
      aElement.OriginalUnitPrice := FieldByName('Original_Unit_Price').asfloat;

      FQElements.Add(aElement);
      Next;
    end;
    Close;
  end;
end;

procedure TQuote.LoadUpstands;
var
  aUpstand : TQUpstand;
  sText : string;
begin
  FQUpstands.Clear;
  with FDataModule.qryQAllUpstands do
  begin
    Close;

    if dtmdlWorktops.IsSQL then
      begin
        sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
        SQL.Text := sText;
      end;

    ParamByName('Quote').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aUpstand := TQUpstand.Create(Self);
      aUpstand.QENumber := FieldByName('Element_Number').AsInteger;
      aUpstand.Material := FieldByName('Material_Type').AsInteger;
      aUpstand.MaterialDescr := FieldByName('Material_Description').Asstring;
      aUpstand.ElementType := FieldByName('Element_Type').Asstring;
      aUpstand.Depth := FieldByName('Depth').asfloat;
      aUpstand.Length := FieldByName('Length').asinteger;
      aUpstand.Quantity := FieldByName('Quantity').asfloat;
      aUpstand.thickness := FieldByName('thickness').asinteger;
      aUpstand.thicknessDesc := FieldByName('thickness_mm').asstring;
      aUpstand.UnitPrice := FieldByName('Unit_Price').asfloat;
      aUpstand.PolishCost := FieldByName('Upstand_Polish_Cost').asfloat;
      aUpstand.PolishPrice := FieldByName('Upstand_Polish_Price').asfloat;
      aUpstand.PriceUnit := FieldByName('Price_unit').asinteger;
      aUpstand.Worktop := FieldByName('worktop').asinteger;
      aUpstand.worktopDesc := FieldByName('worktop_Description').asstring;
      aUpstand.MaterialUse := FieldByName('Material_Use').AsInteger;
      aUpstand.MaterialUseDescr := FieldByName('Use_Description').Asstring;
      aUpstand.OriginalUnitPrice := FieldByName('Original_Unit_Price').asfloat;
      aUpstand.NoOfDepths := FieldByName('No_of_Polished_Depths').asinteger;
      aUpstand.NoOfLengths := FieldByName('No_of_Polished_Lengths').asinteger;

      if fieldbyname('Total_Upstand_Pieces').Asinteger = 0 then
        aUpstand.TotalUpstandPieces := 1
      else
        aUpstand.TotalUpstandPieces := fieldbyname('Total_Upstand_Pieces').Asinteger;
      FQUpstands.Add(aUpstand);
      Next;
    end;
    Close;
  end;
end;

procedure TQuote.LoadCutOuts;
var
  aCutOut : TQCutOut;
  sText : string;
begin
  FQCutOuts.Clear;
  with FDataModule.qryQAllCutOuts do
  begin
    Close;

    if dtmdlWorktops.IsSQL then
      begin
        sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
        SQL.Text := sText;
      end;

    ParamByName('Quote').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aCutOut := TQCutOut.Create(Self);
      aCutOut.QCONumber := FieldByName('Cutout_Number').AsInteger;
      aCutOut.CutOut := FieldByName('Cutout').AsInteger;
      aCutOut.CutoutDesc := FieldByName('CutOut_Description').Asstring;
      aCutOut.Discount := FieldByName('Cutout_discount').Asfloat;
      aCutOut.Material := FieldByName('Material_Type').AsInteger;
      aCutOut.MaterialDescr := FieldByName('Material_Description').Asstring;
      aCutOut.Quantity := FieldByName('Quantity').asfloat;
      aCutOut.EdgeType := FieldByName('Edge_Type').asinteger;
      aCutOut.EdgeTypeDesc := FieldByName('Edge_Type_Description').asstring;
      aCutOut.UnitCost := FieldByName('Unit_Cost').asfloat;
      aCutOut.UnitPrice := FieldByName('Unit_Price').asfloat;
      aCutOut.PriceUnit := FieldByName('Price_unit').asinteger;
      aCutOut.PriceUnitDesc := '';
      FQCutOuts.Add(aCutOut);
      Next;
    end;
    Close;
  end;
end;

procedure TQuote.LoadEdges;
var
  aEdge : TQEdge;
  sText : string;
begin
  FQEdges.Clear;
  with FDataModule.qryQAllEdges do
  begin
    Close;

    if dtmdlWorktops.IsSQL then
      begin
        sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
        SQL.Text := sText;
      end;

    ParamByName('Quote').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aEdge := TQEdge.Create(Self);

      aEdge.QEdgNumber := FieldByName('Edge_Number').AsInteger;
      aEdge.Discount := FieldbyName('Edge_Discount').asfloat;
      aEdge.Edge := FieldByName('Edge_Profile').Asinteger;
      aEdge.EdgeDesc := FieldByName('Edge_Description').Asstring;
      aEdge.Material := FieldByName('Material_Type').AsInteger;
      aEdge.MaterialDescr := FieldByName('Material_Description').Asstring;
      aEdge.Length := FieldByName('Length').asinteger;
      aEdge.EdgeType := FieldByName('Edge_Type').asinteger;
      aEdge.EdgeTypeDesc := FieldByName('Edge_Type_Description').asstring;
      aEdge.UnitCost := FieldByName('Unit_Cost').asfloat;
      aEdge.UnitPrice := FieldByName('Unit_Price').asfloat;
      aEdge.PriceUnit := FieldByName('Price_unit').asinteger;
      aEdge.PriceUnitDesc := '';

      FQEdges.Add(aEdge);
      Next;
    end;
    Close;
  end;
end;

procedure TQuote.LoadExtras;
var
  aExtra : TQExtra;
  sText : string;
begin
  FQExtras.Clear;
  with FDataModule.qryQAllExtras do
  begin
    Close;

    if dtmdlWorktops.IsSQL then
      begin
        sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
        SQL.Text := sText;
      end;

    ParamByName('Quote').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aExtra := TQExtra.Create(Self);
      aExtra.QExNumber := FieldByName('Extra_No').AsInteger;
      aExtra.DoNotDiscount := (FieldByName('Do_Not_Discount').asstring = 'Y');
      aExtra.Extra := FieldByName('Extra_Charge').AsInteger;
      aExtra.ExtraDesc := FieldByName('Description').Asstring;
      aExtra.Quantity := FieldByName('Quantity').asfloat;
      aExtra.UnitCost := FieldByName('Unit_Cost').asfloat;
      aExtra.UnitPrice := FieldByName('Unit_Price').asfloat;
      aExtra.PriceUnit := FieldByName('Price_unit').asinteger;
      aExtra.PriceUnitDesc := '';

      FQExtras.Add(aExtra);
      Next;
    end;
    Close;
  end;
end;

procedure TQuote.LoadSlabs;
var
  aSlab : TQSlab;
  sText : string;
begin
  FQSlabs.Clear;
  with FDataModule.qryQAllSlabs do
  begin
    Close;

    if dtmdlWorktops.IsSQL then
      begin
        sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
        SQL.Text := sText;
      end;

    ParamByName('Quote').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aSlab := TQSlab.Create(Self);
      aSlab.QSlabNo := FieldByName('Slab_Number').AsInteger;
      aSlab.Material := fieldbyname('Material_Type').asinteger;
      aSlab.Worktop := FieldByName('Worktop').AsInteger;
      aSlab.WorktopDesc := FieldByName('Worktop_Description').Asstring;
      aSlab.Thickness := FieldByName('Thickness').asinteger;
      aSlab.ThicknessDesc := FieldByName('Thickness_Description').Asstring;
      aSlab.Supplier := fieldbyname('Supplier').asinteger;
      aSlab.SupplierName := fieldbyname('Supplier_Name').asstring;
      aSlab.length := fieldbyname('Length').asinteger;
      aSlab.Depth := fieldbyname('Depth').asinteger;
      if fieldbyname('Quantity').asfloat = 0 then
        aSlab.Quantity := 1
      else
        aSlab.Quantity := fieldbyname('Quantity').asfloat;
      aSlab.UnitCost := FieldByName('Unit_Cost').asfloat;
      aSlab.PriceUnit := FieldByName('Price_unit').asinteger;
      aSlab.WasteMultiplier := FieldByName('Waste_Cost_Multiplier').asinteger;
      aSlab.WastePercentage := FieldByName('Waste_Percentage').asinteger;
      aSlab.WasteValue := FieldByName('Waste_Value').asfloat;

      aSlab.MarkupPercentage := fieldbyname('Markup_Percentage').asfloat;
      aSlab.UnitPrice := fieldbyname('Unit_Price').asfloat;
      aSlab.SlabSize := fieldbyname('Slab_Size').asinteger;

      aSlab.AdhesiveProductCode := fieldbyname('Adhesive_Product_Code').asstring;
      aSlab.AdhesiveDescription := fieldbyname('Adhesive_Description').asstring;
      aSlab.AdhesiveQuantity := fieldbyname('Adhesive_Quantity').asinteger;
      aSlab.AdhesiveCostPackQuantity := fieldbyname('Adhesive_Cost_Pack_Quantity').asinteger;
      if aSlab.AdhesiveCostPackQuantity = 0 then
        aSlab.AdhesiveCostPackQuantity := 1;
      aSlab.AdhesiveUnitCost := fieldbyname('Adhesive_Unit_Cost').asfloat;

      FQSlabs.Add(aSlab);
      Next;
    end;
    Close;
  end;
end;

procedure TQuote.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TQuote.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TQuote.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TQuote.SetdbKey(const Value: integer);
begin
  FdbKey := Value;
end;

procedure TQuote.SetDeliveryPrice(const Value: currency);
begin
  FDeliveryPrice := Value;
end;

procedure TQuote.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TQuote.SetDiscRate(const Value: real);
begin
  FDiscRate := Value;
end;

procedure TQuote.SetDiscValue(const Value: currency);
begin
  FDiscValue := Value;
end;

procedure TQuote.SetEstimator(const Value: integer);
begin
  FEstimator := Value;
end;

procedure TQuote.SetEstimatorName(const Value: string);
begin
  FEstimatorName := Value;
end;

procedure TQuote.SetGrossPrice(const Value: currency);
begin
  FGrossPrice := Value;
end;

procedure TQuote.SetInstallPrice(const Value: currency);
begin
  FInstallPrice := Value;
end;

procedure TQuote.SetMarkupValue(const Value: currency);
begin
  FMarkupValue := Value;
end;

procedure TQuote.SetMaterialName(const Value: string);
begin
  FMaterialName := Value;
end;

procedure TQuote.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TQuote.SetNettPrice(const Value: currency);
begin
  FNettPrice := Value;
end;

procedure TQuote.SetNoOfElements(const Value: integer);
begin
  FNoOfElements := Value;
end;

procedure TQuote.SetOrderedFlag(const Value: string);
begin
  FOrderedFlag := Value;
end;

procedure TQuote.SetQDate(const Value: TDateTime);
begin
  FQDate := Value;
end;

procedure TQuote.SetReference(const Value: string);
begin
  FReference := Value;
end;

procedure TQuote.SetSurveyPrice(const Value: currency);
begin
  FSurveyPrice := Value;
end;

procedure TQuote.SetVatCode(const Value: string);
begin
  FVatCode := Value;
end;

procedure TQuote.SaveToDB(TempAll: boolean);
begin
  if DbKey = 0 then
    begin
      DbKey := FDataModule.GetNextQNumber;
      with FDataModule.qryQAddHeader do
        begin
          ParamByName('Quote').AsInteger := DbKey;
          if (Retail) or (Speculative) then
            ParamByName('Address').asinteger := Address
          else
            {clear the old address}
            ParamByName('Address').clear;

          ParambyName('Account_Manager').asinteger := self.AccountManager;
          ParambyName('Date_Accepted').asdatetime := self.AcceptedDate;
          ParambyName('Date_Required').asdatetime := self.DateRequired;
          ParamByName('Date_Raised').asdatetime := self.QDate;
          Parambyname('Discount_Rate').asfloat := DiscountRate;
          Parambyname('Discount_Value').AsFloat := DiscountValue;
          ParamByName('Customer').AsInteger := Customer;
          if ContractQuote then
            ParamByName('Contract_Quote').asstring := 'Y'
          else
            ParamByName('Contract_Quote').asstring := 'N';

          ParamByName('Material_type').Asinteger := Material;
          Parambyname('Contact_Name').asstring := ContactName;
          Parambyname('Customer_Name').asstring := CustomerName;
          ParamByName('Description').Asstring := Description;
          ParamByName('Operator').AsInteger := Operator;
          if LeadSource = 0 then
            ParamByName('Sales_Lead_Source').clear
          else
            ParamByName('Sales_Lead_Source').AsInteger := LeadSource;

          if DesignerID = 0 then
            ParamByName('Designer').clear
          else
            ParamByName('Designer').AsInteger := DesignerID;

          if Branch = 0 then
            ParamByName('Branch_no').clear
          else
            ParamByName('Branch_no').AsInteger := Branch;

          ParambyName('Installation_Price').asfloat := self.InstallPrice;
          ParamByName('Delivery_Price').Asfloat := self.DeliveryPrice;

          parambyname('Delivery_Mileage').asinteger :=  DeliveryMileage;
          parambyname('Delivery_Mileage_Rate').asinteger :=  DeliveryMileageRate;
          parambyname('Delivery_Labour').asfloat := DeliveryLabourHours;
          parambyname('Delivery_Labour_Rate').asfloat := DeliveryLabourRate;
          parambyname('Delivery_Labour_Men').asinteger := DeliveryLabourMen;

          Parambyname('Markup_Rate').asfloat := MarkupRate;
          Parambyname('Markup_Value').AsFloat := MarkupValue;

          ParamByName('Survey_Price').Asfloat := self.SurveyPrice;
          ParamByName('Expiry_Date').Asdatetime := self.ExpiryDate;

          if ExtraNotes = 0 then
            ParamByName('Extra_Notes').clear
          else
            ParamByName('Extra_Notes').Asinteger := ExtraNotes;
          if Availability = 0 then
            ParamByName('Availability').clear
          else
            ParamByName('Availability').Asinteger := Availability;
          if Terms = 0 then
            ParamByName('Payment_Terms').clear
          else
            ParamByName('Payment_Terms').Asinteger := Terms;
          ParambyName('Project_Reference').asstring := ProjectReference;
          ParambyName('Reference').asstring := Reference;
          ParamByName('Quote_Status').Asinteger := 10;
          ParamByName('Nett_Price').Asfloat := TotalPrice;
          Parambyname('Waste_Value').asfloat := TotalWasteCost;
          Parambyname('Inactive').asstring := self.inactive;

          if Reason = 0 then
            Parambyname('inactive_reason').clear
          else
            Parambyname('inactive_reason').asinteger := Reason;

          Parambyname('vat').asinteger := vat;

          Parambyname('Worktop_Handling_Rate').AsFloat := HandlingRate;

          Parambyname('Template_Date').AsDateTime := TemplateDate;

          parambyname('Template_Mileage').asinteger :=  TemplateMileage;
          parambyname('Template_Mileage_Rate').asinteger :=  TemplateMileageRate;
          parambyname('Template_Labour').asfloat := TemplateLabourHours;
          parambyname('Template_Labour_Rate').asfloat := TemplateLabourRate;

          parambyname('Fitting_Mileage').asinteger :=  FittingMileage;
          parambyname('Fitting_Mileage_Rate').asinteger :=  FittingMileageRate;
          parambyname('Fitting_Labour').asfloat := FittingLabourHours;
          parambyname('Fitting_Labour_Rate').asfloat := FittingLabourRate;
          parambyname('Fitting_Labour_Men').asinteger := FittingLabourMen;

          parambyname('Importance').asstring := Importance;

          parambyname('Timescale').asstring := Timescale;
          parambyname('Call_Day').asstring := CallBackDay;
          parambyname('Call_Time').asstring := CallBackTime;

          Parambyname('Deposit_Terms').Asfloat := DepositTerms;
          Parambyname('Deposit_Amount').Asfloat := DepositAmount;
          if InstallAddress = 0 then
            ParamByName('Install_Address').clear
          else
            ParamByName('Install_Address').Asinteger := InstallAddress;
          Parambyname('Install_Name').asstring := InstallName;
          Parambyname('Install_Phone').asstring := InstallPhone;
          Parambyname('Order_Ref_No').asstring := OrderRefNo;
          if (qMode = qReQuote) then
            begin
              Parambyname('Quote_Number').asfloat   := GetNextReQuoteNumber;
              Parambyname('Original_Quote').asinteger := OriginalQuote;
            end
          else
            begin
              if ContractQuote then
                begin
                  Parambyname('Quote_Number').asfloat := GetNextContractQuoteNumber;
                  Parambyname('Original_Quote').asinteger := dbKey;
                end
              else
                begin
                  Parambyname('Quote_Number').asfloat := dbKey;
                  Parambyname('Original_Quote').asinteger := dbKey;
                end;
            end;

          if self.ContractQuoteNumber = 0 then
            begin
              Parambyname('Contract_Quote_ID').clear;
              Parambyname('Line_Number').clear;
              Parambyname('Option_Number').clear;
            end
          else
            begin
              Parambyname('Contract_Quote_ID').asinteger := ContractQuoteNumber;
              Parambyname('Line_Number').asinteger := ContractLine;
              Parambyname('Option_Number').asinteger := ContractOption;
            end;

          if RevenueCentre = 0 then
            ParamByName('Revenue_Centre').clear
          else
            ParamByName('Revenue_Centre').Asinteger := RevenueCentre;

          ExecSQL;
        end;
      SaveQuoteNumber;
      dtmdlWorktops.CreateQuoteDirectory(inttostr(dbKey));
    end
  else
  if TempAll then
    begin
      with FDataModule.qryQUpHeader do
        begin
          ParamByName('Quote').AsInteger := DbKey;
          if (Retail) or (Speculative) then
            ParamByName('Address').asinteger := Address
          else
            {clear the old address}
            ParamByName('Address').clear;
          ParambyName('Account_Manager').asinteger := self.AccountManager;
          ParambyName('Date_Accepted').asdatetime := self.AcceptedDate;
          ParambyName('Date_Required').asdatetime := self.DateRequired;
          ParamByName('Date_Raised').asdatetime := self.QDate;
          Parambyname('Discount_Rate').asfloat := DiscountRate;
          Parambyname('Discount_Value').AsFloat := DiscountValue;
          ParamByName('Customer').AsInteger := Customer;
          ParamByName('Material_type').Asinteger := Material;
          Parambyname('Contact_Name').asstring := ContactName;
          Parambyname('Customer_Name').asstring := CustomerName;

          if ContractQuote then
            ParamByName('Contract_Quote').Asstring := 'Y'
          else
            ParamByName('Contract_Quote').AsString := 'N';

          ParamByName('Description').Asstring := Description;
//          ParamByName('Operator').AsInteger := Operator;
          if LeadSource = 0 then
            ParamByName('Sales_Lead_Source').clear
          else
            ParamByName('Sales_Lead_Source').AsInteger := LeadSource;

          if DesignerID = 0 then
            ParamByName('Designer').clear
          else
            ParamByName('Designer').AsInteger := DesignerID;

          if Branch = 0 then
            ParamByName('Branch_no').clear
          else
            ParamByName('Branch_no').AsInteger := Branch;

          ParambyName('Installation_Price').asfloat := self.InstallPrice;
          ParamByName('Delivery_Price').Asfloat := self.DeliveryPrice;

          parambyname('Delivery_Mileage').asinteger :=  DeliveryMileage;
          parambyname('Delivery_Mileage_Rate').asinteger :=  DeliveryMileageRate;
          parambyname('Delivery_Labour').asfloat := DeliveryLabourHours;
          parambyname('Delivery_Labour_Rate').asfloat := DeliveryLabourRate;
          parambyname('Delivery_Labour_Men').asinteger := DeliveryLabourMen;

          Parambyname('Markup_Rate').asfloat := MarkupRate;
          Parambyname('Markup_Value').AsFloat := MarkupValue;

          ParamByName('Survey_Price').Asfloat := self.SurveyPrice;
          ParamByName('Expiry_Date').Asdatetime := self.ExpiryDate;

          if ExtraNotes = 0 then
            ParamByName('Extra_Notes').clear
          else
            ParamByName('Extra_Notes').Asinteger := ExtraNotes;
          if Availability = 0 then
            ParamByName('Availability').clear
          else
            ParamByName('Availability').Asinteger := Availability;
          if Terms = 0 then
            ParamByName('Payment_Terms').clear
          else
            ParamByName('Payment_Terms').Asinteger := Terms;
          ParambyName('Project_Reference').asstring := ProjectReference;
          ParambyName('Reference').asstring := Reference;
          ParamByName('Quote_Status').Asinteger := Status;
          ParamByName('Nett_Price').Asfloat := TotalPrice;
          Parambyname('Waste_Value').asfloat := TotalWasteCost;

          Parambyname('Inactive').asstring := inactive;
          if reason = 0 then
            Parambyname('inactive_reason').clear
          else
            Parambyname('inactive_reason').asinteger := self.Reason;

          Parambyname('vat').asinteger := vat;

          Parambyname('Worktop_Handling_Rate').AsFloat := HandlingRate;

          Parambyname('Template_Date').AsDateTime := TemplateDate;

          parambyname('Template_Mileage').asinteger :=  TemplateMileage;
          parambyname('Template_Mileage_Rate').asinteger :=  TemplateMileageRate;
          parambyname('Template_Labour').asfloat := TemplateLabourHours;
          parambyname('Template_Labour_Rate').asfloat := TemplateLabourRate;

          parambyname('Fitting_Mileage').asinteger :=  FittingMileage;
          parambyname('Fitting_Mileage_Rate').asinteger :=  FittingMileageRate;
          parambyname('Fitting_Labour').asfloat := FittingLabourHours;
          parambyname('Fitting_Labour_Rate').asfloat := FittingLabourRate;
          parambyname('Fitting_Labour_Men').asinteger := FittingLabourMen;

          parambyname('Importance').asstring := Importance;

          parambyname('Timescale').asstring := Timescale;
          parambyname('Call_Day').asstring := CallBackDay;
          parambyname('Call_Time').asstring := CallBackTime;

          Parambyname('Deposit_Terms').Asfloat := DepositTerms;
          Parambyname('Deposit_Amount').Asfloat := DepositAmount;
          if InstallAddress = 0 then
            ParamByName('Install_Address').clear
          else
            ParamByName('Install_Address').Asinteger := InstallAddress;
          Parambyname('Install_Name').asstring := InstallName;
          Parambyname('Install_Phone').asstring := InstallPhone;
          Parambyname('Order_Ref_No').asstring := OrderRefNo;

          Parambyname('Quote_Number').asfloat   := QuoteNumber;

          if RevenueCentre = 0 then
            ParamByName('Revenue_Centre').clear
          else
            ParamByName('Revenue_Centre').Asinteger := RevenueCentre;

          ExecSQL;
        end
    end;
  if not Retail and not Speculative and (address <> 0) then
    datamodule.DeleteAddress(Address);

  {Only save the line details if we're changing}
  if QMode <> qRestrict then
    begin
      SaveElements;
      SaveUpstands;
      SaveCutOuts;
      SaveEdges;
      SaveExtras;
      SaveEvents;
      SaveSlabs;
    end;
  SaveSalesOrder;
  if (self.Inactive = 'Y') and (not self.ContractQuote) then
    DeclineAllQuotes;
end;

function TdtmdlQuote.GetHeaderCountAll: integer;
begin
  Result := qryAllQuotes.recordcount;
end;

function TdtmdlQuote.GetCurrentCQuote: integer;
begin
  if dtsQuotes.dataset.RecordCount > 0 then
    Result := dtsQuotes.dataset.FieldByName('Quote').AsInteger
  else
    Result := 0;
end;

procedure TQuote.SetAvailability(const Value: integer);
begin
  FAvailability := Value;
end;

procedure TQuote.SetContact(const Value: integer);
begin
  FContact := Value;
end;

procedure TQuote.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TQuote.SetExtraNotes(const Value: integer);
begin
  FExtraNotes := Value;
end;

procedure TQuote.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TQuote.SetReason(const Value: integer);
begin
  FReason := Value;
end;

procedure TQuote.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TQuote.SetStatusDescr(const Value: string);
begin
  FStatusDescr := Value;
end;

procedure TQuote.SetTerms(const Value: integer);
begin
  FTerms := Value;
end;

procedure TQuote.SaveElements;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteElements;  { Get rid of any already in database }
  FQElements.Renumber;
  for i := 0 to Pred(FQElements.Count) do
    begin
      FQElements[i].SaveToDB;
    end;
end;

procedure TQuote.SaveUpstands;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteUpstands;  { Get rid of any already in database }
  FQUpstands.Renumber;
  for i := 0 to Pred(FQUpstands.Count) do
    begin
      FQUpstands[i].SaveToDB;
    end;
end;

procedure TQuote.SaveCutOuts;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteCutOuts;  { Get rid of any already in database }
  FQCutOuts.Renumber;
  for i := 0 to Pred(FQCutOuts.Count) do
    begin
      FQCutOuts[i].SaveToDB;
    end;
end;

procedure TQuote.SaveEdges;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteEdges;  { Get rid of any already in database }
  FQEdges.Renumber;
  for i := 0 to Pred(FQEdges.Count) do
    begin
      FQEdges[i].SaveToDB;
    end;
end;

procedure TQuote.SaveExtras;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteExtras;  { Get rid of any already in database }
  FQExtras.Renumber;
  for i := 0 to Pred(FQExtras.Count) do
    begin
      FQExtras[i].SaveToDB;
    end;
end;

procedure TQuote.DeleteElements;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_Element WHERE Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TQuote.DeleteUpstands;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_Element WHERE Element_Type = ''U'' and Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TQuote.DeleteCutOuts;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_cutout WHERE Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TQuote.DeleteEdges;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_Edge WHERE Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TQuote.DeleteExtras;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_Extra WHERE Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TQuote.DeleteAddress;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Address WHERE Address =' + IntToStr(self.Address));
    ExecSQL;
  end;
end;

procedure TQuote.DeleteInstallAddress;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Notes WHERE Notes_Code =' + IntToStr(self.InstallAddress));
    ExecSQL;
  end;
end;

procedure TQuote.DeleteExtraNotes;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Notes WHERE Notes_Code =' + IntToStr(self.ExtraNotes));
    ExecSQL;
  end;
end;

procedure TQuote.SetAddress(const Value: integer);
begin
  FAddress := Value;
end;

procedure TQuote.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TQuote.SetMaterialDesc(const Value: string);
begin
  FMaterialDesc := Value;
end;

procedure TQuote.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TQuote.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

function TQuote.GetTotalPrice: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FQElements.Count) do
    begin
      result := result + FQElements[i].TotalPrice;
    end;

  for i := 0 to Pred(FQUpstands.Count) do
    begin
      result := result + FQUpstands[i].TotalPrice;
    end;

  for i := 0 to Pred(FQCutOuts.Count) do
    begin
      result := result + FQCutOuts[i].TotalPrice;
    end;

  for i := 0 to Pred(FQEdges.Count) do
    begin
      result := result + FQEdges[i].TotalPrice;
    end;

  for i := 0 to Pred(FQExtras.Count) do
    begin
      result := result + FQExtras[i].TotalPrice;
    end ;

  for i := 0 to Pred(FQSlabs.Count) do
    begin
      result := result + FQSlabs[i].TotalPrice;
    end ;
end;

procedure TQuote.SetRetail(const Value: bytebool);
begin
  FRetail := Value;
end;

procedure TQuote.SaveQuoteNumber;
begin
  with datamodule.qryUpCompany do
    begin
      close;
      parambyname('Last_Quote_number').asinteger := dbKey;
      execsql;
    end;
end;

procedure TQuote.SetVat(const Value: integer);
begin
  FVat := Value;
end;

procedure TQuote.SetVatRate(const Value: real);
begin
  FVatRate := Value;
end;

function TQuote.GetTotalVat: currency;
begin
  Result := TotalGross * (FVatRate/100);
end;

function TQuote.GetTotalGross: currency;
begin
  Result := TotalPrice + InstallPrice + SurveyPrice + DeliveryPrice - DiscountValue + MarkupValue + TotalWasteCost;
end;

procedure TQuote.SetDiscountRate(const Value: double);
begin
  FDiscountRate := Value;
end;

procedure TQuote.SetDiscountValue(const Value: currency);
begin
  FDiscountValue := Value;
end;

function TQuote.GetTotalDiscounted: currency;
begin
  Result := TotalPrice - FDiscountValue + FMarkupValue;
end;

function TQuote.GetTotalDiscount: currency;
begin
//  Result := TotalPrice * self.DiscountRate/100.00;
  Result := TotalDiscountablePrice * self.DiscountRate/100.00;
end;

procedure TQuote.DeleteEvents;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_internal_Note WHERE Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;

end;

procedure TQuote.DeleteSlabs;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_Slab WHERE Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;

end;

procedure TQuote.LoadEvents;
var
  aEvent : TQEvent;
  sText : string;
begin
  FQEvents.Clear;
  with FDataModule.qryQAllEvents do
  begin
    Close;

    if dtmdlWorktops.IsSQL then
      begin
        sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
        SQL.Text := sText;
      end;

    ParamByName('Quote').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aEvent := TQEvent.Create(Self);
      aEvent.EventNumber := FieldByName('Internal_Note').AsInteger;
      aEvent.DateEntered := FieldByName('Date_Time_Entered').Asdatetime;
      aEvent.Operator := FieldByName('Operator').Asinteger;
      aEvent.OperatorName := FieldByName('Operator_Name').asstring;
      aEvent.Narrative.dbKey := FieldByName('Narrative').asinteger;
      aEvent.Narrative.LoadFromDB;

      FQEvents.Add(aEvent);
      Next;
    end;
    Close;
  end;
end;

procedure TQuote.SaveEvents;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteEvents;  { Get rid of any already in database }
  FQEvents.Renumber;
  for i := 0 to Pred(FQEvents.Count) do
    begin
      FQEvents[i].SaveToDB;
    end;
end;

procedure TQuote.SaveSlabs;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteSlabs;  { Get rid of any already in database }
  FQSlabs.Renumber;
  for i := 0 to Pred(FQSlabs.Count) do
    begin
      FQSlabs[i].SaveToDB;
    end;
end;

procedure TQuote.SetInstallAddress(const Value: integer);
begin
  FInstallAddress := Value;
end;

procedure TQuote.SetTemplateDate(const Value: TDateTime);
begin
  FTemplateDate := Value;
end;

procedure TQuote.SetDepositAmount(const Value: currency);
begin
  FDepositAmount := Value;
end;

procedure TQuote.SetDepositTerms(const Value: double);
begin
  FDepositTerms := Value;
end;

procedure TQuote.SetAcceptedDate(const Value: TDateTime);
begin
  FAcceptedDate := Value;
end;

function TQuote.GetCurrentStatus: integer;
begin
  if FStatus = 30 then
    Result := 30
  else
  if FAcceptedDate <> 0 then
    Result := 24
  else
  if FStatus = 20 then
    Result := 20
  else
    Result := 10
end;

procedure TQuote.SetLeadSource(const Value: integer);
begin
  FLeadSource := Value;
end;

procedure TQuote.SetDesignerID(const Value: integer);
begin
  FDesignerID := Value;
end;

procedure TQuote.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TQuote.SetInstallName(const Value: string);
begin
  FInstallName := Value;
end;

procedure TQuote.SetInstallPhone(const Value: string);
begin
  FInstallPhone := Value;
end;

procedure TQuote.SetOrderRefNo(const Value: string);
begin
  FOrderRefNo := Value;
end;

procedure TQuote.SaveSalesOrder;
var
  SOrder, SOLine: integer;
  rUnitPrice: real;
begin
  with self.DataModule.qryGetSOLine do
    begin
      close;
      parambyname('Quote').asinteger := dbkey;
      open;

      if recordcount = 0 then exit;
      
      SOrder := fieldbyname('Sales_order').asinteger;
      SOLine := fieldbyname('Sales_order_line_no').asinteger;
    end;

  rUnitPrice := TotalPrice - DiscountValue + InstallPrice + SurveyPrice + DeliveryPrice + MarkupValue + TotalWasteCost;

  with self.DataModule.qryUpSOLineValues do
    begin
      close;
      parambyname('Sales_Order').asinteger := SOrder;
      parambyname('Sales_Order_Line_no').asinteger := SOLine;
      parambyname('Unit_Price').asfloat := rUnitPrice;
      parambyname('Quantity').asinteger := 1;
      parambyname('Nett_Price').asfloat := TotalPrice;
      parambyname('Discount_Value').asfloat := DiscountValue;
      parambyname('Markup_Value').asfloat := MarkupValue;
      parambyname('Installation_Price').asfloat := InstallPrice;
      parambyname('Survey_Price').asfloat := SurveyPrice;
      parambyname('Delivery_Price').asfloat := DeliveryPrice;
      parambyname('Vat').asinteger := self.vat;
      parambyname('Waste_Value').asfloat := TotalWasteCost;
      execsql;
    end;

  with self.DataModule.qryUpSOHead do
    begin
      close;
      parambyname('Sales_Order').asinteger := SOrder;
      parambyname('Goods_Value').asfloat := rUnitPrice;
      parambyname('Vat_Value').asfloat := (rUnitPrice * (self.VatRate/100.00));
      execsql
    end;
end;

procedure TQuote.SetAccountManager(const Value: integer);
begin
  FAccountManager := Value;
end;

function TQuote.GetTotalSupplyCost: currency;
var
  i : integer;
begin
  Result := 0;

  {Slab Costs}
  for i := 0 to Pred(FQSlabs.Count) do
    begin
      result := result + FQSlabs[i].TotalCost;
    end;

  {Cut Outs}
  for i := 0 to Pred(FQCutOuts.Count) do
    begin
      result := result + FQCutOuts[i].TotalCost;
    end;

  {Edges}
  for i := 0 to Pred(FQEdges.Count) do
    begin
      result := result + FQEdges[i].TotalCost;
    end;

  {Extra}
  for i := 0 to Pred(FQExtras.Count) do
    begin
      result := result + FQExtras[i].TotalCost;
    end ;

  result := result + (FHandlingRate * (FQElements.TotalArea + FQUpstands.TotalArea));
end;

procedure TQuote.SetFittingLabourHours(const Value: double);
begin
  FFittingLabourHours := Value;
end;

procedure TQuote.SetFittingLabourRate(const Value: double);
begin
  FFittingLabourRate := Value;
end;

procedure TQuote.SetFittingMileage(const Value: integer);
begin
  FFittingMileage := Value;
end;

procedure TQuote.SetFittingMileageRate(const Value: integer);
begin
  FFittingMileageRate := Value;
end;

procedure TQuote.SetTemplateLabourHours(const Value: double);
begin
  FTemplateLabourHours := Value;
end;

procedure TQuote.SetTemplateLabourRate(const Value: double);
begin
  FTemplateLabourRate := Value;
end;

procedure TQuote.SetTemplateMileage(const Value: integer);
begin
  FTemplateMileage := Value;
end;

procedure TQuote.SetTemplateMileageRate(const Value: integer);
begin
  FTemplateMileageRate := Value;
end;

function TQuote.GetTotalFittingCost: currency;
begin
  Result := ((self.FittingLabourHours * self.FittingLabourRate) * self.FittingLabourMen) + (self.FittingMileage * (self.FittingMileageRate/100));
end;

function TQuote.GetTotalTemplateCost: currency;
begin
  Result := (self.TemplateLabourHours * self.TemplateLabourRate) + (self.TemplateMileage * (self.TemplateMileageRate/100));
end;

procedure TQuote.SetHandlingRate(const Value: double);
begin
  FHandlingRate := Value;
end;

procedure TQuote.SetDeliveryLabourHours(const Value: double);
begin
  FDeliveryLabourHours := Value;
end;

procedure TQuote.SetDeliveryLabourRate(const Value: double);
begin
  FDeliveryLabourRate := Value;
end;

procedure TQuote.SetDeliveryMileage(const Value: integer);
begin
  FDeliveryMileage := Value;
end;

procedure TQuote.SetDeliveryMileageRate(const Value: integer);
begin
  FDeliveryMileageRate := Value;
end;

procedure TQuote.SetMileageRate(const Value: integer);
begin
  FMileageRate := Value;
end;

procedure TQuote.SetMileage(const Value: integer);
begin
  FMileage := Value;
end;

procedure TQuote.SetMarkupRate(const Value: double);
begin
  FMarkupRate := Value;
end;

procedure TQuote.SetImportance(const Value: string);
begin
  FImportance := Value;
end;

procedure TQuote.SetFittingLabourMen(const Value: integer);
begin
  FFittingLabourMen := Value;
end;

procedure TQuote.SetDeliveryLabourMen(const Value: integer);
begin
  FDeliveryLabourMen := Value;
end;

procedure TQuote.SetOriginalQuote(const Value: integer);
begin
  FOriginalQuote := Value;
end;

function TQuote.GetNextReQuoteNumber: real;
begin
  try
    with FDataModule.qryReQuoteCount do
      begin
        Close;
        parambyname('Original_Quote').asfloat := OriginalQuote;
        Open;
        Result := (FieldByName('Last_ReQuote').Asfloat) + 0.01;
        Close;
      end;
  except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Quote number:' + #13 + E.Message);
    end;
  end;
end;

function TQuote.GetNextContractQuoteNumber: real;
var
  rSubNumber: real;
begin
  try
    rSubNumber := ((ContractLine * 100) + (ContractOption) + (ContractQuoteNumber * 10000));
    result := (rSubNumber/10000.000000);
  except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to allocate next Contract Quote number:' + #13 + E.Message);
    end;
  end;
end;

procedure TQuote.SetQMode(const Value: TQMode);
begin
  FQMode := Value;
end;

procedure TQuote.SetContractQuote(const Value: boolean);
begin
  FContractQuote := Value;
end;

procedure TQuote.SetContractLine(const Value: integer);
begin
  FContractLine := Value;
end;

procedure TQuote.SetContractOption(const Value: integer);
begin
  FContractOption := Value;
end;

procedure TQuote.SetContractQuoteNumber(const Value: integer);
begin
  FContractQuoteNumber := Value;
end;

procedure TQuote.SetContractGroup(const Value: integer);
begin
  FContractGroup := Value;
end;

procedure TQuote.SetCutOutDiscount(const Value: double);
begin
  FCutOutDiscount := Value;
end;

procedure TQuote.SetEdgeDiscount(const Value: double);
begin
  FEdgeDiscount := Value;
end;

function TQuote.GetTotalDeliveryCost: currency;
begin
  Result := ((self.DeliveryLabourHours * self.deliveryLabourRate) * self.DeliveryLabourMen) + (self.DeliveryMileage * (self.DeliveryMileageRate/100));
end;

function TQuote.GetTotalWasteCost: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FQSlabs.Count) do
    begin
      result := result + FQSlabs[i].TotalWasteCost;
    end;
end;

procedure TQuote.SetQuoteNumber(const Value: double);
begin
  FQuoteNumber := Value;
end;

procedure TQuote.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TQuote.SetTimescale(const Value: string);
begin
  FTimescale := Value;
end;

procedure TQuote.SetCallBackDay(const Value: string);
begin
  FCallBackDay := Value;
end;

procedure TQuote.SetCallBackTime(const Value: string);
begin
  FCallBackTime := Value;
end;

procedure TQuote.SetOnMailingList(const Value: string);
begin
  FOnMailingList := Value;
end;

procedure TQuote.SetProjectReference(const Value: string);
begin
  FProjectReference := Value;
end;

procedure TQuote.SetSpeculative(const Value: boolean);
begin
  FSpeculative := Value;
end;

procedure TQuote.SetExpiryDate(const Value: TDateTime);
begin
  FExpiryDate := Value;
end;

procedure TQuote.DeclineAllQuotes;
begin
  with self.DataModule.qryDeclineQuotes do
    begin
      close;
      parambyname('Original_Quote').asinteger := dbkey;
      parambyname('Inactive_reason').asinteger := self.Reason;
      execSQL;
    end;
end;

function TQuote.GetTotalDiscountablePrice: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FQElements.Count) do
    begin
      result := result + FQElements[i].TotalPrice;
    end;

  for i := 0 to Pred(FQUpstands.Count) do
    begin
      result := result + FQUpstands[i].TotalPrice;
    end;

  for i := 0 to Pred(FQCutOuts.Count) do
    begin
      result := result + FQCutOuts[i].TotalPrice;
    end;

  for i := 0 to Pred(FQEdges.Count) do
    begin
      result := result + FQEdges[i].TotalPrice;
    end;

  for i := 0 to Pred(FQExtras.Count) do
    begin
      if not FQExtras[i].DoNotDiscount then
        result := result + FQExtras[i].TotalPrice;
    end ;

  for i := 0 to Pred(FQSlabs.Count) do
    begin
      result := result + FQSlabs[i].TotalPrice;
    end;
end;

procedure TQuote.SetRevenueCentre(const Value: integer);
begin
  FRevenueCentre := Value;
end;

{ TQElements }

procedure TQElements.Add(aElement: TQElement);
begin
  FItems.Add(aElement);
end;

procedure TQElements.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQElement(FItems[i]).Free;
end;

function TQElements.Clone: TQElements;
var
  i : integer;
begin
  Result := TQElements.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQElement(FItems[i]).Clone);
end;

constructor TQElements.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQElements.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQElements.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQElement(FItems[i]).Free;
  FItems.Free;
  inherited;

end;

function TQElements.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQElements.GetItems(Index: integer): TQElement;
begin
  Result := TQElement(FItems[Index]);
end;

function TQElements.GetTotalArea: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQElement(FItems[i]).TotalArea;

end;

function TQElements.GetTotalSales: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQElement(FItems[i]).TotalPrice;

end;

function TQElements.IndexOf(const ElementNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQElement(FItems[i]).QENumber = ElementNo then
      Result := i;
end;

procedure TQElements.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQElement(FItems[i]).QENumber:= (i+1);
end;

procedure TQElements.SetItems(Index: integer; const Value: TQElement);
begin
  FItems[Index] := Value;
end;

{ TQElement }

function TQElement.Clone: TQElement;
begin
  Result := TQElement.Create(FParent);
  Result.Depth          :=           Self.Depth;
  Result.ElementDescription
                        :=           self.ElementDescription;
  Result.ElementType    :=           Self.ElementType;
  Result.Length         :=           Self.Length;
  Result.Material       :=           Self.Material;
  Result.MaterialDescr  :=           Self.MaterialDescr;
  Result.MaterialUse    :=           self.MaterialUse;
  Result.MaterialUseDescr :=         self.MaterialUseDescr;
  Result.OriginalUnitPrice
                        :=           self.OriginalUnitPrice;
  Result.QENumber       :=           Self.QENumber;
  Result.Quantity       :=           Self.Quantity;
  Result.thickness      :=           Self.thickness;
  Result.thicknessDesc  :=           Self.thicknessDesc;
  Result.UnitPrice      :=           Self.UnitPrice;
  Result.PriceUnit      :=           Self.PriceUnit;
  Result.PriceUnitDesc  :=           Self.PriceUnitDesc;
  Result.worktop        :=           Self.worktop;
  Result.worktopDesc    :=           Self.worktopDesc;
  Result.worktopgroup   :=           Self.worktopgroup;
end;

constructor TQElement.Create(Quote: TQuote);
begin
  FParent := Quote;
end;

destructor TQElement.Destroy;
begin
  inherited;
end;

function TQElement.GetTotalArea: currency;
begin
  Result := ((fDepth * FLength)/1000000) * FQuantity;
end;

function TQElement.GetTotalPrice: currency;
begin
  Result := ((fDepth * FLength)/1000000) * FQuantity * FUnitPrice;
end;

procedure TQElement.LoadFromDB;
begin
  with FParent.FDataModule.qryQElement do
  begin
    Close;
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('Element_Number').AsInteger := QENumber;
    Open;
    Depth := FieldByName('Depth').asfloat;
    ElementType := FieldByName('Element_Type').asstring;
    Length := fieldbyname('Length').AsInteger;
    Quantity := FieldByName('Quantity').asfloat;
    thickness := FieldByName('thickness').asinteger;
    thicknessDesc := FieldByName('thickness_mm').asstring;
    UnitPrice := FieldByName('Unit_Price').asfloat;
    PriceUnit := fieldbyname('Price_Unit').asinteger;
    Worktop := FieldByName('worktop').asinteger;
    worktopDesc := FieldByName('worktop_Description').asstring;
    worktopgroup := fieldbyname('worktop_group').AsInteger;
    MaterialUse := fieldbyname('Material_Use').AsInteger;
    MaterialUseDescr := fieldbyname('Use_Description').AsString;
    OriginalUnitPrice := fieldbyname('Original_Unit_Price').Asfloat;
    Close;
  end;
end;

procedure TQElement.SaveToDB;
begin
  with FParent.FDataModule.qryQAddElement do
  begin
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('Element_Description').Asstring := ElementDescription;
    ParamByName('Element_Number').AsInteger := QENumber;
    Parambyname('Material_Type').AsInteger := Material;
    ParambyName('Worktop').asinteger := worktop;
    Parambyname('Depth').asfloat := Depth;
    Parambyname('Element_type').asstring := 'P';
    Parambyname('Length').AsInteger := Length;
    Parambyname('Quantity').asfloat := Quantity;
    Parambyname('thickness').asinteger := thickness;
    Parambyname('Unit_Price').asfloat := UnitPrice;
    Parambyname('Upstand_Polish_Cost').asfloat := 0.00;
    Parambyname('Upstand_Polish_Price').asfloat := 0.00;
    ParambyName('Price_unit').AsInteger := PriceUnit;
    Parambyname('worktop').asinteger := Worktop;
    Parambyname('No_of_Polished_Depths').asinteger := 0;
    Parambyname('No_of_Polished_lengths').asinteger := 0;
    if MaterialUse = 0 then
      Parambyname('Material_Use').clear
    else
      Parambyname('Material_Use').AsInteger := MaterialUse;
    Parambyname('Total_Upstand_Pieces').asinteger := 0;
    ExecSQL;
  end;
end;

procedure TQElement.SetDepth(const Value: double);
begin
  FDepth := Value;
end;

procedure TQElement.SetElementDescription(const Value: string);
begin
  FElementDescription := Value;
end;

procedure TQElement.SetElementType(const Value: string);
begin
  FElementType := Value;
end;

procedure TQElement.SetGrossCost(const Value: currency);
begin
  FGrossCost := Value;
end;

procedure TQElement.SetLength(const Value: integer);
begin
  FLength := Value;
end;

procedure TQElement.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TQElement.SetMaterialDescr(const Value: string);
begin
  FMaterialDescr := Value;
end;

procedure TQElement.SetMaterialUse(const Value: integer);
begin
  FMaterialUse := Value;
end;

procedure TQElement.SetMaterialUseDescr(const Value: string);
begin
  FMaterialUseDescr := Value;
end;

procedure TQElement.SetOriginalUnitPrice(const Value: currency);
begin
  FOriginalUnitPrice := Value;
end;

procedure TQElement.SetParent(const Value: TQuote);
begin
  FParent := Value;
end;

procedure TQElement.SetPieceGrossCost(const Value: currency);
begin
  FPieceGrossCost := Value;
end;

procedure TQElement.SetPieceQuantity(const Value: double);
begin
  FPieceQuantity := Value;
end;

procedure TQElement.SetPieceUnitCost(const Value: currency);
begin
  FPieceUnitCost := Value;
end;

procedure TQElement.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TQElement.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TQElement.SetQENumber(const Value: integer);
begin
  FQENumber := Value;
end;

procedure TQElement.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TQElement.SetSalesUnit(const Value: integer);
begin
  FSalesUnit := Value;
end;

procedure TQElement.SetSalesUnitDesc(const Value: string);
begin
  FSalesUnitDesc := Value;
end;

procedure TQElement.Setthickness(const Value: integer);
begin
  Fthickness := Value;
end;

procedure TQElement.SetthicknessDesc(const Value: string);
begin
  FthicknessDesc := Value;
end;

procedure TQElement.SetUnitCost(const Value: currency);
begin
  FUnitCost := Value;
end;

procedure TQElement.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

procedure TQElement.Setwidth(const Value: double);
begin
  Fwidth := Value;
end;

procedure TQElement.Setworktop(const Value: integer);
begin
  Fworktop := Value;
end;

procedure TQElement.SetworktopDesc(const Value: string);
begin
  FworktopDesc := Value;
end;

procedure TQElement.SetworktopGroup(const Value: integer);
begin
  FworktopGroup := Value;
end;

{ TQExtra }

function TQExtra.Clone: TQExtra;
begin
  Result := TQExtra.Create(FParent);
  Result.DoNotDiscount  :=           self.DoNotDiscount;
  Result.Extra          :=           self.Extra;;
  Result.ExtraDesc      :=           self.ExtraDesc;
  Result.UnitCost       :=           Self.UnitCost;
  Result.UnitPrice      :=           Self.UnitPrice;
  Result.PriceUnit      :=           Self.PriceUnit;
  Result.PriceUnitDesc  :=           self.PriceUnitDesc;
  Result.QExNumber       :=          Self.QExNumber;
  Result.Quantity       :=           Self.Quantity;
  Result.UnitPrice      :=           Self.UnitPrice;
end;

constructor TQExtra.Create(Quote: TQuote);
begin
  FParent := Quote;
end;

destructor TQExtra.Destroy;
begin

  inherited;
end;

function TQExtra.GetTotalCost: currency;
begin
  result := FQuantity * FUnitCost;
end;

function TQExtra.GetTotalPrice: currency;
begin
  result := FQuantity * FUnitPrice;
end;

procedure TQExtra.LoadFromDB;
begin
  with FParent.FDataModule.qryQExtra do
  begin
    Close;
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('Extra_no').AsInteger := QExNumber;
    Open;
    DoNotDiscount := (fieldbyname('Do_not_Discount').asstring = 'Y');
    Extra := FieldbyName('Extra_Charge').asinteger;
    Quantity := FieldbyName('Quantity').asfloat;
    UnitPrice := Fieldbyname('Unit_Price').asfloat;
    PriceUnit := FieldbyName('Price_unit').AsInteger;
    Close;
  end;

end;

procedure TQExtra.SaveToDB;
begin
  with FParent.FDataModule.qryQAddExtra do
  begin
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('Extra_no').AsInteger := QExNumber;
    ParambyName('Extra_Charge').asinteger := Extra;
    Parambyname('Quantity').asfloat := Quantity;
    Parambyname('Unit_Cost').asfloat := UnitCost;
    Parambyname('Unit_Price').asfloat := UnitPrice;
    ParambyName('Price_unit').AsInteger := PriceUnit;
    if DoNotDiscount then
      ParambyName('Do_Not_Discount').Asstring := 'Y'
    else
      ParambyName('Do_Not_Discount').Asstring := 'N';
    ExecSQL;
  end;
end;

procedure TQExtra.SetDoNotDiscount(const Value: boolean);
begin
  FDoNotDiscount := Value;
end;

procedure TQExtra.SetExtra(const Value: integer);
begin
  FExtra := Value;
end;

procedure TQExtra.SetExtraDesc(const Value: string);
begin
  FExtraDesc := Value;
end;

procedure TQExtra.SetParent(const Value: TQuote);
begin
  FParent := Value;
end;

procedure TQExtra.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TQExtra.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TQExtra.SetQExNumber(const Value: integer);
begin
  FQExNumber := Value;
end;

procedure TQExtra.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TQExtra.SetUnitCost(const Value: currency);
begin
  FUnitCost := Value;
end;

procedure TQExtra.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

{ TQCutOut }

function TQCutOut.Clone: TQCutOut;
begin
  Result := TQCutOut.Create(FParent);
  Result.CutOut         :=           self.CutOut;
  Result.CutOutDesc     :=           self.CutOutDesc;
  Result.Discount       :=           self.Discount;
  Result.Material       :=           Self.Material;
  Result.MaterialDescr  :=           Self.MaterialDescr;
  Result.UnitCost       :=           Self.UnitCost;
  Result.UnitPrice      :=           Self.UnitPrice;
  Result.PriceUnit      :=           Self.PriceUnit;
  Result.PriceUnitDesc  :=           Self.PriceUnitDesc;
  Result.QCONumber      :=           Self.QCONumber;
  Result.Quantity       :=           Self.Quantity;
  Result.EdgeType      :=           Self.EdgeType;
  Result.EdgeTypeDesc  :=           Self.EdgeTypeDesc;
end;

constructor TQCutOut.Create(Quote: TQuote);
begin
  FParent := Quote;
end;

destructor TQCutOut.Destroy;
begin

  inherited;
end;

function TQCutOut.GetTotalCost: currency;
begin
  result := FQuantity * FUnitCost;
end;

function TQCutOut.GetTotalPrice: currency;
begin
  result := FQuantity * FUnitPrice;
end;

procedure TQCutOut.LoadFromDB;
begin
  with FParent.FDataModule.qryQCutOut do
  begin
    Close;
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('cutout_Number').AsInteger := QCONumber;
    Open;
    cutout := FieldbyName('cutout').asinteger;
    discount := FieldbyName('cutout_discount').asfloat;
    Material := FieldbyName('Material_Type').AsInteger;
    Quantity := FieldbyName('Quantity').asfloat;
    EdgeType := Fieldbyname('Edge_Type').asinteger;
    UnitPrice := Fieldbyname('Unit_Price').asfloat;
    UnitCost := Fieldbyname('Unit_Cost').asfloat;
    PriceUnit := FieldbyName('Price_unit').AsInteger;
    Close;
  end;

end;

procedure TQCutOut.SaveToDB;
begin
  with FParent.FDataModule.qryQAddCutOut do
  begin
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('cutout_Number').AsInteger := QCONumber;
    ParamByName('Cutout').asinteger := Cutout;
    ParamByName('Cutout_Discount').asfloat := Discount;
    Parambyname('Material_Type').AsInteger := Material;
    Parambyname('Quantity').asfloat := Quantity;
    Parambyname('Edge_Type').asinteger := EdgeType;
    Parambyname('Unit_Cost').asfloat := UnitCost;
    Parambyname('Unit_Price').asfloat := UnitPrice;
    ParambyName('Price_unit').AsInteger := PriceUnit;
    ExecSQL;
  end;

end;

procedure TQCutOut.SetCutOut(const Value: integer);
begin
  FCutOut := Value;
end;

procedure TQCutOut.SetCutOutDesc(const Value: string);
begin
  FCutOutDesc := Value;
end;

procedure TQCutOut.SetDiscount(const Value: double);
begin
  FDiscount := Value;
end;

procedure TQCutOut.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TQCutOut.SetEdgeTypeDesc(const Value: string);
begin
  FEdgeTypeDesc := Value;
end;

procedure TQCutOut.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TQCutOut.SetMaterialDescr(const Value: string);
begin
  FMaterialDescr := Value;
end;

procedure TQCutOut.SetParent(const Value: TQuote);
begin
  FParent := Value;
end;

procedure TQCutOut.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TQCutOut.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TQCutOut.SetQCONumber(const Value: integer);
begin
  FQCONumber := Value;
end;

procedure TQCutOut.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TQCutOut.SetUnitCost(const Value: currency);
begin
  FUnitCost := Value;
end;

procedure TQCutOut.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

{ TQEdge }

function TQEdge.Clone: TQEdge;
begin
  Result := TQEdge.Create(FParent);
  Result.Discount       :=          self.discount;
  Result.Edge           :=          self.Edge;
  Result.EdgeDesc       :=          Self.EdgeDesc;
  Result.Material       :=           Self.Material;
  Result.MaterialDescr  :=           Self.MaterialDescr;
  Result.UnitCost       :=           Self.UnitCost;
  Result.UnitPrice      :=           Self.UnitPrice;
  Result.PriceUnit      :=           Self.PriceUnit;
  Result.PriceUnitDesc  :=           Self.PriceUnitDesc;
  Result.QEdgNumber     :=           Self.QEdgNumber;
  Result.Length         :=           Self.Length;
  Result.EdgeType      :=           Self.EdgeType;
  Result.EdgeTypeDesc  :=           Self.EdgeTypeDesc;
end;

constructor TQEdge.Create(Quote: TQuote);
begin
  FParent := Quote;
end;

destructor TQEdge.Destroy;
begin

  inherited;
end;

function TQEdge.GetTotalCost: currency;
begin
  result := (FLength / 1000)* FUnitCost;
end;

function TQEdge.GetTotalPrice: currency;
begin
  result := (FLength / 1000)* FUnitPrice;
end;

procedure TQEdge.LoadFromDB;
begin
  with FParent.FDataModule.qryQEdge do
  begin
    Close;
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('Edge_Number').AsInteger := QEdgNumber;
    Open;
    Discount := FieldbyName('Edge_Discount').asfloat;
    Edge := FieldbyName('Edge_Profile').asinteger;
    Material := FieldbyName('Material_Type').AsInteger;
    Length := FieldbyName('Length').asfloat;
    EdgeType := Fieldbyname('Edge_Type').asinteger;
    UnitCost := Fieldbyname('Unit_Cost').asfloat;
    UnitPrice := Fieldbyname('Unit_Price').asfloat;
    PriceUnit := FieldbyName('Price_unit').AsInteger;
    Close;
  end;

end;

procedure TQEdge.SaveToDB;
begin
  with FParent.FDataModule.qryQAddEdge do
  begin
    ParamByName('Quote').AsInteger := FParent.DbKey;
    Parambyname('Edge_Discount').asfloat := Discount;
    ParamByName('Edge_Number').AsInteger := QEdgNumber;
    ParamByName('Edge_Profile').asinteger := Edge;
    Parambyname('Material_Type').AsInteger := Material;
    Parambyname('Length').asfloat := Length;
    Parambyname('Edge_Type').asinteger := EdgeType;
    Parambyname('Unit_Cost').asfloat := UnitCost;
    Parambyname('Unit_Price').asfloat := UnitPrice;
    ParambyName('Price_unit').AsInteger := PriceUnit;
    ExecSQL;
  end;

end;

procedure TQEdge.SetDiscount(const Value: double);
begin
  FDiscount := Value;
end;

procedure TQEdge.SetEdge(const Value: integer);
begin
  FEdge := Value;
end;

procedure TQEdge.SetEdgeDesc(const Value: string);
begin
  FEdgeDesc := Value;
end;

procedure TQEdge.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TQEdge.SetEdgeTypeDesc(const Value: string);
begin
  FEdgeTypeDesc := Value;
end;

procedure TQEdge.SetLength(const Value: double);
begin
  FLength := Value;
end;

procedure TQEdge.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TQEdge.SetMaterialDescr(const Value: string);
begin
  FMaterialDescr := Value;
end;

procedure TQEdge.SetParent(const Value: TQuote);
begin
  FParent := Value;
end;

procedure TQEdge.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TQEdge.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TQEdge.SetQEdgNumber(const Value: integer);
begin
  FQEdgNumber := Value;
end;

procedure TQEdge.SetUnitCost(const Value: currency);
begin
  FUnitCost := Value;
end;

procedure TQEdge.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

{ TQExtras }

procedure TQExtras.Add(aExtra: TQExtra);
begin
  FItems.Add(aExtra);
end;

procedure TQExtras.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQExtra(FItems[i]).Free;
end;

function TQExtras.Clone: TQExtras;
var
  i : integer;
begin
  Result := TQExtras.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQExtra(FItems[i]).Clone);
end;

constructor TQExtras.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQExtras.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQExtras.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQExtra(FItems[i]).Free;
  FItems.Free;
  inherited;

end;

function TQExtras.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQExtras.GetItems(Index: integer): TQExtra;
begin
  Result := TQExtra(FItems[Index]);
end;

function TQExtras.GetTotalCosts: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQExtra(FItems[i]).TotalCost;
end;

function TQExtras.GetTotalSales: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQExtra(FItems[i]).TotalPrice;
end;

function TQExtras.IndexOf(const ExtraNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQExtra(FItems[i]).QExNumber = ExtraNo then
      Result := i;
end;

procedure TQExtras.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQExtra(FItems[i]).QExNumber:= (i+1);
end;

procedure TQExtras.SetItems(Index: integer; const Value: TQExtra);
begin
  FItems[Index] := Value;
end;

{ TQEdges }

procedure TQEdges.Add(aEdge: TQEdge);
begin
  FItems.Add(aEdge);
end;

procedure TQEdges.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQEdge(FItems[i]).Free;
end;

function TQEdges.Clone: TQEdges;
var
  i : integer;
begin
  Result := TQEdges.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQEdge(FItems[i]).Clone);
end;

constructor TQEdges.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQEdges.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQEdges.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQEdge(FItems[i]).Free;
  FItems.Free;
  inherited;

end;

function TQEdges.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQEdges.GetItems(Index: integer): TQEdge;
begin
  Result := TQEdge(FItems[Index]);
end;

function TQEdges.GetTotalCosts: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQEdge(FItems[i]).TotalCost;
end;

function TQEdges.GetTotalSales: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQEdge(FItems[i]).TotalPrice;
end;

function TQEdges.IndexOf(const EdgeNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQEdge(FItems[i]).QEdgNumber = EdgeNo then
      Result := i;
end;

procedure TQEdges.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQEdge(FItems[i]).QEdgNumber:= (i+1);
end;

procedure TQEdges.SetItems(Index: integer; const Value: TQEdge);
begin
  FItems[Index] := Value;
end;

{ TQCutOuts }

procedure TQCutOuts.Add(aCutOut: TQCutOut);
begin
  FItems.Add(aCutOut);

end;

procedure TQCutOuts.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQCutOut(FItems[i]).Free;
end;

function TQCutOuts.Clone: TQCutOuts;
var
  i : integer;
begin
  Result := TQCutOuts.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQCutOut(FItems[i]).Clone);
end;

constructor TQCutOuts.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQCutOuts.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQCutOuts.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQCutOut(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TQCutOuts.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQCutOuts.GetItems(Index: integer): TQCutOut;
begin
  Result := TQCutOut(FItems[Index]);
end;

function TQCutOuts.GetTotalCosts: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQCutOut(FItems[i]).TotalCost;
end;

function TQCutOuts.GetTotalSales: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQCutOut(FItems[i]).TotalPrice;
end;

function TQCutOuts.IndexOf(const CutOutNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQCutOut(FItems[i]).QCONumber = CutOutNo then
      Result := i;
end;

procedure TQCutOuts.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQCutOut(FItems[i]).QCONumber:= (i+1);
end;

procedure TQCutOuts.SetItems(Index: integer; const Value: TQCutOut);
begin
  FItems[Index] := Value;
end;

function TdtmdlQuote.GetCustomerAddress(tempCust: integer): string;
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

function TdtmdlQuote.GetCustomerDiscount(tempCust: integer): double;
begin
  result := 0.00;
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Discount_Rate').asfloat;
    end;
end;

function TdtmdlQuote.GetCustomerName(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Customer_Name').asstring;
    end;
end;

function TdtmdlQuote.GetCustomerStreet(tempCust: integer): string;
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

function TdtmdlQuote.GetCustomerLocale(tempCust: integer): string;
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

function TdtmdlQuote.GetCustomerTown(tempCust: integer): string;
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

function TdtmdlQuote.GetCustomerPostcode(tempCust: integer): string;
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

function TdtmdlQuote.GetCustomerCounty(tempCust: integer): string;
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

function TdtmdlQuote.GetCustomerTelephone(tempCust: integer): string;
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

function TdtmdlQuote.GetCustomerFax(tempCust: integer): string;
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

function TdtmdlQuote.GetCustomerWebsite(tempCust: integer): string;
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

function TdtmdlQuote.GetCustomerEmail(tempCust: integer): string;
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

function TdtmdlQuote.GetAddress(tempCode: integer): string;
var
  i: integer;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      for i := 1 to 5 do
        begin
          if trim(fields[i].asstring) = '' then continue;
          result := result + trim(fields[i].asstring) + #13#10;
        end;
    end;
end;

function TdtmdlQuote.GetAddressName(tempCode: integer): string;
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

function TdtmdlQuote.GetAddressStreet(tempCode: integer): string;
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

function TdtmdlQuote.GetAddressLocale(tempCode: integer): string;
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

function TdtmdlQuote.GetAddressTown(tempCode: integer): string;
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

function TdtmdlQuote.GetAddressPostcode(tempCode: integer): string;
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

function TdtmdlQuote.GetAddressCounty(tempCode: integer): string;
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

function TdtmdlQuote.GetAddressTelephone(tempCode: integer): string;
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

function TdtmdlQuote.GetAddressFax(tempCode: integer): string;
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

function TdtmdlQuote.GetAddressWebsite(tempCode: integer): string;
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

function TdtmdlQuote.GetAddressEmail(tempCode: integer): string;
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

function TdtmdlQuote.GetAddressOnMailingList(tempCode: integer): boolean;
begin
  result := false;
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
      result := (fieldbyname('Mailing').asstring = 'Y');
    end;
end;

function TdtmdlQuote.GetContractDeliveryPrice(tmpCode: integer): real;
begin
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tmpCode;
      open;
      result := fieldbyname('Delivery_Price').asfloat;
    end;
end;

function TdtmdlQuote.GetContractInstallPrice(tmpCode: integer): real;
begin
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tmpCode;
      open;
      result := fieldbyname('Installation_Price').asfloat;
    end;

end;

function TdtmdlQuote.GetContractSurveyPrice(tmpCode: integer): real;
begin
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tmpCode;
      open;
      result := fieldbyname('Survey_Price').asfloat;
    end;
end;

procedure TdtmdlQuote.DeleteAddress(iAddress: integer);
begin
  try
    with qryDelAddress do
      begin
        close;
        parambyname('Address').asinteger := iAddress;
        execsql;
      end;
  except
  end;
end;

function TdtmdlQuote.SetAddress(iAddress: integer; AddName, Street, AddLocale: string;
  Town, postcode, County, phone, email: string): integer;
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
          parambyname('Address_Name').asstring := AddName;
          parambyname('Street').asstring := Street;
          parambyname('Locale').asstring := addlocale;
          parambyname('Town_City').asstring := Town;
          parambyname('Postcode').asstring := Postcode;
          parambyname('County_State').asstring := County;
          parambyname('Email_address').asstring := Email;
          parambyname('Telephone_number').asstring:= Phone;
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

{ TQUpstand }

function TQUpstand.Clone: TQUpstand;
begin
  Result := TQUpstand.Create(FParent);
  Result.ElementType    :=           Self.ElementType;
  Result.OriginalUnitPrice
                        :=           self.OriginalUnitPrice;
  Result.Material       :=           Self.Material;
  Result.MaterialDescr  :=           Self.MaterialDescr;
  Result.MaterialUse    :=           Self.MaterialUse;
  Result.MaterialUseDescr  :=        Self.MaterialUseDescr;
  Result.NoOfDepths     :=           self.NoOfDepths;
  Result.NoOfLengths    :=           self.NoOfLengths;
  Result.Depth          :=           Self.Depth;
  Result.Length         :=           Self.Length;
  Result.QENumber       :=           Self.QENumber;
  Result.Quantity       :=           Self.Quantity;
  Result.thickness      :=           Self.thickness;
  Result.thicknessDesc  :=           Self.thicknessDesc;
  Result.TotalUpstandPieces
                        :=           self.TotalUpstandPieces;
  Result.UnitPrice      :=           Self.UnitPrice;
  Result.PolishCost     :=           Self.PolishCost;
  Result.PolishPrice    :=           Self.PolishPrice;
  Result.PriceUnit      :=           Self.PriceUnit;
  Result.PriceUnitDesc  :=           Self.PriceUnitDesc;
  Result.worktop        :=           Self.worktop;
  Result.worktopDesc    :=           Self.worktopDesc;
end;

constructor TQUpstand.Create(Quote: TQuote);
begin
  FParent := Quote;
end;

destructor TQUpstand.Destroy;
begin

  inherited;
end;

function TQUpstand.GetTotalArea: currency;
begin
  Result := ((fDepth * FLength)/1000000) * FQuantity;
end;

function TQUpstand.GetTotalPolishCost: currency;
begin
  Result := (((FLength/1000)*FNoOfLengths) * FPolishCost) + (((FDepth/1000)*FNoOfDepths) * FPolishCost);
end;

function TQUpstand.GetTotalPolishPrice: currency;
begin
  Result := (((FLength/1000)*FNoOfLengths) * FPolishPrice) + (((FDepth/1000)*FNoOfDepths) * FPolishPrice);
end;

function TQUpstand.GetTotalPrice: currency;
begin
  Result := (((fDepth * FLength)/1000000) * FQuantity * FUnitPrice)+ self.TotalPolishPrice;
end;

procedure TQUpstand.LoadFromDB;
begin
  with FParent.FDataModule.qryQUpstand do
  begin
    Close;
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('Upstand_Number').AsInteger := QENumber;
    Open;
    Depth := FieldByName('Depth').asfloat;
    ElementType := FieldByName('Element_Type').asstring;
    Length := fieldbyname('Length').AsInteger;
    Quantity := FieldByName('Quantity').asfloat;
    thickness := FieldByName('thickness').asinteger;
    thicknessDesc := FieldByName('thickness_mm').asstring;
    UnitPrice := FieldByName('Unit_Price').asfloat;
    PolishCost := fieldbyname('Upstand_Polish_Cost').asfloat;
    PolishPrice := FieldByName('Upstand_Polish_Price').asfloat;
    PriceUnit := fieldbyname('Price_Unit').asinteger;
    Worktop := FieldByName('worktop').asinteger;
    worktopDesc := FieldByName('worktop_Description').asstring;
    MaterialUse := fieldbyname('Material_Use').asinteger;
    MaterialUseDescr := fieldbyname('Use_Description').asstring;
    TotalUpstandPieces := fieldbyname('Total_Upstand_Pieces').AsInteger;
    Close;
  end;
end;

procedure TQUpstand.SaveToDB;
begin
  with FParent.FDataModule.qryQAddElement do
  begin
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('Element_Description').Asstring := '';
    ParamByName('Element_Number').AsInteger := QENumber;
    Parambyname('Material_Type').AsInteger := Material;
    ParambyName('Worktop').asinteger := worktop;
    Parambyname('Depth').asfloat := Depth;
    Parambyname('Element_type').asstring := 'U';
    Parambyname('Length').AsInteger := Length;
    Parambyname('Quantity').asfloat := Quantity;
    Parambyname('thickness').asinteger := thickness;
    Parambyname('Unit_Price').asfloat := UnitPrice;
    Parambyname('Upstand_Polish_Cost').asfloat := PolishCost;
    Parambyname('Upstand_Polish_Price').asfloat := PolishPrice;
    ParambyName('Price_unit').AsInteger := PriceUnit;
    Parambyname('No_of_Polished_Depths').asinteger := NoOfDepths;
    Parambyname('No_of_Polished_lengths').asinteger := NoOfLengths;
    Parambyname('worktop').asinteger := Worktop;
    if MaterialUse = 0 then
      Parambyname('Material_Use').clear
    else
      Parambyname('Material_Use').AsInteger := MaterialUse;
    Parambyname('Total_Upstand_Pieces').asinteger := TotalUpstandPieces;
    ExecSQL;
  end;
end;

procedure TQUpstand.SetDepth(const Value: double);
begin
  FDepth := Value;
end;

procedure TQUpstand.SetElementType(const Value: string);
begin
  FElementType := Value;
end;

procedure TQUpstand.SetLength(const Value: integer);
begin
  FLength := Value;
end;

procedure TQUpstand.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TQUpstand.SetMaterialDescr(const Value: string);
begin
  FMaterialDescr := Value;
end;

procedure TQUpstand.SetMaterialUse(const Value: integer);
begin
  FMaterialUse := Value;
end;

procedure TQUpstand.SetMaterialUseDescr(const Value: string);
begin
  FMaterialUseDescr := Value;
end;

procedure TQUpstand.SetNoOfDepths(const Value: integer);
begin
  FNoOfDepths := Value;
end;

procedure TQUpstand.SetNoOfLengths(const Value: integer);
begin
  FNoOfLengths := Value;
end;

procedure TQUpstand.SetOriginalUnitPrice(const Value: currency);
begin
  FOriginalUnitPrice := Value;
end;

procedure TQUpstand.SetParent(const Value: TQuote);
begin
  FParent := Value;
end;

procedure TQUpstand.SetPolishCost(const Value: currency);
begin
  FPolishCost := Value;
end;

procedure TQUpstand.SetPolishPrice(const Value: currency);
begin
  FPolishPrice := Value;
end;

procedure TQUpstand.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TQUpstand.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TQUpstand.SetQENumber(const Value: integer);
begin
  FQENumber := Value;
end;

procedure TQUpstand.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TQUpstand.Setthickness(const Value: integer);
begin
  Fthickness := Value;
end;

procedure TQUpstand.SetthicknessDesc(const Value: string);
begin
  FthicknessDesc := Value;
end;

procedure TQUpstand.SetTotalUpstandPieces(const Value: integer);
begin
  FTotalUpstandPieces := Value;
end;

procedure TQUpstand.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

procedure TQUpstand.Setworktop(const Value: integer);
begin
  Fworktop := Value;
end;

procedure TQUpstand.SetworktopDesc(const Value: string);
begin
  FworktopDesc := Value;
end;

{ TQUpstands }

procedure TQUpstands.Add(aUpstand: TQUpstand);
begin
  FItems.Add(aUpstand);
end;

procedure TQUpstands.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQUpstand(FItems[i]).Free;
end;

function TQUpstands.Clone: TQUpstands;
var
  i : integer;
begin
  Result := TQUpstands.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQUpstand(FItems[i]).Clone);
end;

constructor TQUpstands.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQUpstands.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQUpstands.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQUpstand(FItems[i]).Free;
  FItems.Free;
  inherited;

end;

function TQUpstands.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQUpstands.GetItems(Index: integer): TQUpstand;
begin
  Result := TQUpstand(FItems[Index]);
end;

function TQUpstands.GetTotalArea: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQUpstand(FItems[i]).TotalArea;

end;

function TQUpstands.GetTotalCosts: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQUpstand(FItems[i]).TotalPolishCost;
end;

function TQUpstands.GetTotalSales: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQUpstand(FItems[i]).TotalPrice;

end;

function TQUpstands.IndexOf(const UpstandNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQUpstand(FItems[i]).QENumber = UpstandNo then
      Result := i;
end;

procedure TQUpstands.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQUpstand(FItems[i]).QENumber:= (i+1)+1000;
end;

procedure TQUpstands.SetItems(Index: integer; const Value: TQUpstand);
begin
  FItems[Index] := Value;
end;

function TdtmdlQuote.GetVatRate(tempVat: integer): real;
begin
  with qryGetVat do
    begin
      close;
      parambyname('Vat').asinteger := tempVat;
      open;
      Result := fieldbyname('Vat_Rate').asfloat;
    end;
end;

{ TQEvents }

procedure TQEvents.Add(aEvent: TQEvent);
begin
  FItems.Add(aEvent);
end;

procedure TQEvents.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQEvent(FItems[i]).Free;
end;

function TQEvents.Clone: TQEvents;
var
  i : integer;
begin
  Result := TQEvents.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQEvent(FItems[i]).Clone);
end;

constructor TQEvents.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQEvents.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQEvents.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQEvent(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TQEvents.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQEvents.GetItems(Index: integer): TQEvent;
begin
  Result := TQEvent(FItems[Index]);
end;

function TQEvents.IndexOf(const EventNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQEvent(FItems[i]).EventNumber = EventNo then
      Result := i;
end;

procedure TQEvents.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQEvent(FItems[i]).EventNumber:= (i+1);
end;

procedure TQEvents.SetItems(Index: integer; const Value: TQEvent);
begin
  FItems[Index] := Value;
end;

{ TQEvent }

function TQEvent.Clone: TQEvent;
begin
  Result := TQEvent.Create(FParent);
  Result.EventNumber    :=           self.EventNumber;
  Result.DateEntered    :=           self.DateEntered;
  Result.operator       :=           Self.Operator;
  Result.OperatorName   :=           self.OperatorName; 
  Result.Narrative      :=           Self.Narrative;
end;

constructor TQEvent.Create(Quote: TQuote);
begin
  FParent := Quote;
  FNarrative := TNotes.Create;
end;

destructor TQEvent.Destroy;
begin
  FNarrative.Free;
  inherited;
end;

procedure TQEvent.LoadFromDB;
begin
  with FParent.FDataModule.qryQEvent do
  begin
    Close;
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('Internal_Note').AsInteger := EventNumber;
    Open;
    DateEntered := FieldbyName('Date_Time_Entered').asdatetime;
    Narrative.dbkey := FieldbyName('Narrative').AsInteger;
    Operator := FieldbyName('Operator').asinteger;
    OperatorName := FieldbyName('Operator_Name').asstring;
    Close;
  end;

end;

procedure TQEvent.SaveToDB;
begin
  Narrative.SavetoDB;
  with FParent.FDataModule.qryQAddEvent do
  begin
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('Internal_Note').AsInteger := EventNumber;
    ParamByName('Operator').asinteger := Operator;
    Parambyname('Date_Time_Entered').Asdatetime := DateEntered;
    Parambyname('Narrative').asinteger := Narrative.dbKey;
    ExecSQL;
  end;
end;

procedure TQEvent.SetDateEntered(const Value: TDateTime);
begin
  FDateEntered := Value;
end;

procedure TQEvent.SetEventNumber(const Value: integer);
begin
  FEventNumber := Value;
end;

procedure TQEvent.SetNarrative(const Value: TNotes);
begin
  FNarrative := Value;
end;

procedure TQEvent.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TQEvent.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TQEvent.SetParent(const Value: TQuote);
begin
  FParent := Value;
end;

procedure TdtmdlQuote.UpdateQStatus(tempQuote: integer; tempStatus: integer);
begin
  with qryUpQuote do
    begin
      close;
      parambyname('Quote').asinteger := TempQuote;
      parambyname('Quote_Status').asinteger := TempStatus;
      execsql;
    end;
end;

procedure TdtmdlQuote.UpdateQStatusSO(tempQuote: integer; tempStatus: integer);
begin
  with qryUpQuoteSO do
    begin
      close;
      parambyname('Quote').asinteger := TempQuote;
      parambyname('Quote_Status').asinteger := TempStatus;
      parambyname('Date_Accepted').asdatetime := date;
      execsql;
    end;
end;

procedure TdtmdlQuote.UpdateSOStatus(tempJob, tempQuote: integer; tempStatus: integer);
var
  SOrder, SOLine: integer;
begin
  with qryGetSOLine do
    begin
      close;
      parambyname('Quote').asinteger := TempQuote;
      open;

      SOrder := fieldbyname('Sales_order').asinteger;
      SOLine := fieldbyname('Sales_order_line_no').asinteger;
    end;

    // Set the job against the sales order line
  with qryUpSOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := SOrder;
      parambyname('Sales_Order_Line_no').asinteger := SOLine;
      parambyname('Job').asinteger := tempJob;
      execsql;
    end;

    // Update the Sales Order status

  with qryUpSOStatus do
    begin
      close;
      parambyname('Sales_order').asinteger := SOrder;
      parambyname('Sales_order_Status').asinteger := tempStatus;
      execsql;
    end;
end;

function TdtmdlQuote.GetWorktopGroup(tempCode: integer): integer;
begin
  with qryWTGroup do
    begin
      close;
      parambyname('Worktop_group').asinteger := tempCode;
      open;
      result := fieldbyname('Worktop_group').AsInteger;
    end;
end;

procedure TdtmdlQuote.qryAllQuotesStatus_TextGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
(*  if (dtsAllQuotes.Dataset.fieldbyname('Quote_status').asinteger = 30) then
    begin
      qryGetJob.close;
      qryGetJob.parambyname('Quote').asinteger := dtsAllQuotes.Dataset.fieldbyname('Quote').asinteger;
      qryGetJob.open;

      if qryGetJob.recordcount > 0 then
        begin
          text := qryGetJob.fieldbyname('Job').asstring;
          exit;
        end
      else
        text := dtsAllQuotes.Dataset.fieldbyname('Status_Description').asstring;
    end
  else
*)
  text := dtsAllQuotes.Dataset.fieldbyname('Status_Description').asstring;
end;

function TdtmdlQuote.GetWorktopUnitPrice(tempCode,
  tempSize: integer): real;
begin
  with qryOneWTThickness do
    begin
      close;
      parambyName('worktop').asinteger := tempCode;
      parambyName('thickness').asinteger := tempSize;
      open;
      result := fieldbyname('Unit_Price').asfloat;
    end;

end;

function TdtmdlQuote.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (Description <> '') or
            (Material <> '') or
            (QuoteReference <> '') or
            (ProjectReference <> '') or
            (Reference <> '') or
            (QuoteDate <> 0) or
            (ExpiryDate <> 0) or
            (Status <> '') or
            (ShowInactive = 'Y') or
            (ShowLive) then
    result := true
  else
    result := false;
end;

{ TQSlabs }

procedure TQSlabs.Add(aSlab: TQSlab);
begin
  FItems.Add(aSlab);
end;

procedure TQSlabs.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQSlab(FItems[i]).Free;
end;

function TQSlabs.Clone: TQSlabs;
var
  i : integer;
begin
  Result := TQSlabs.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQSlab(FItems[i]).Clone);
end;

constructor TQSlabs.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQSlabs.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQSlabs.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQSlab(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TQSlabs.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQSlabs.GetItems(Index: integer): TQSlab;
begin
  Result := TQSlab(FItems[Index]);
end;

function TQSlabs.GetTotalArea: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQSlab(FItems[i]).TotalArea;
end;

function TQSlabs.GetTotalCosts: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQSlab(FItems[i]).TotalCost;

end;

function TQSlabs.GetTotalWasteCosts: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TQSlab(FItems[i]).TotalWasteCost;
end;

function TQSlabs.IndexOf(const SlabNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQSlab(FItems[i]).QSlabNo = SlabNo then
      Result := i;
end;

procedure TQSlabs.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQSlab(FItems[i]).QSlabNo:= i+1;
end;

procedure TQSlabs.SetItems(Index: integer; const Value: TQSlab);
begin
  FItems[Index] := Value;
end;

{ TQSlab }

function TQSlab.Clone: TQSlab;
begin
  Result := TQSlab.Create(FParent);

  Result.AdhesiveProductCode := self.AdhesiveProductCode;
  Result.AdhesiveDescription := self.AdhesiveDescription;
  Result.AdhesiveQuantity :=    self.AdhesiveQuantity;
  Result.AdhesiveCostPackQuantity
                          :=    self.AdhesiveCostPackQuantity;
  Result.AdhesiveUnitCost :=    self.AdhesiveUnitCost;
  Result.Material       :=      self.Material;
  Result.MarkupPercentage :=    self.MarkupPercentage;
  Result.Worktop        :=      self.worktop;
  Result.WorktopDesc    :=      self.worktopdesc;
  Result.Thickness      :=      self.thickness;
  Result.thicknessDesc  :=      self.thicknessDesc;
  Result.SlabSize       :=      self.SlabSize;
  Result.Supplier       :=      self.Supplier;
  Result.SupplierName   :=      self.SupplierName;
  Result.Length         :=      self.Length;
  Result.Depth          :=      self.Depth;
  Result.UnitCost       :=      self.UnitCost;
  Result.UnitPrice      :=      self.UnitPrice;
  Result.PriceUnit      :=      self.PriceUnit;
  Result.QSlabNo        :=      self.QSlabNo;
  Result.Quantity        :=      self.Quantity;
  Result.WasteMultiplier :=     self.WasteMultiplier;
  Result.WastePercentage :=     self.WastePercentage;
  Result.WasteValue      :=      self.WasteValue;
end;

constructor TQSlab.Create(Quote: TQuote);
begin
  FParent := Quote;
end;

destructor TQSlab.Destroy;
begin

  inherited;
end;

function TQSlab.GetTotalArea: double;
begin
  Result := ((Length * Depth)/1000000)*Quantity;
end;

function TQSlab.GetTotalCost: double;
begin
  Result := ((((Length * Depth)/1000000) * UnitCost)*Quantity) + (AdhesiveUnitCost * (AdhesiveQuantity/self.AdhesiveCostPackQuantity));
end;

function TQSlab.GetTotalPrice: double;
begin
  Result := (((Length * Depth)/1000000) * UnitPrice)*Quantity;
end;

function TQSlab.GetTotalWasteCost: double;
begin
  Result := ((((Length * Depth)/1000000) * UnitCost) * ((WastePercentage/100.0000) * WasteMultiplier))*Quantity;
end;

procedure TQSlab.SaveToDB;
var
  dtmdlQuoteSupplier: TdtmdlSuppliers;
  iCount, iPricePointer: integer;
  stext: string;
begin
  with FParent.FDataModule.qryQAddSlab do
  begin
    ParamByName('Quote').AsInteger := FParent.DbKey;
    ParamByName('Slab_Number').AsInteger := QSlabNo;
    Parambyname('Worktop').AsInteger := Worktop;
    Parambyname('Thickness').AsInteger := Thickness;
    Parambyname('Supplier').AsInteger := Supplier;
    Parambyname('Length').AsInteger := Length;
    Parambyname('Depth').AsInteger := Depth;
    Parambyname('Unit_Cost').Asfloat := UnitCost;
    Parambyname('Quantity').Asfloat := Quantity;
    Parambyname('Price_Unit').Asinteger := PriceUnit;
    Parambyname('Waste_Percentage').Asinteger := WastePercentage;
    Parambyname('Waste_Value').Asfloat := WasteValue;
    Parambyname('Waste_Cost_Multiplier').AsInteger := WasteMultiplier;
    Parambyname('Markup_Percentage').Asfloat := MarkupPercentage;
    Parambyname('Unit_Price').Asfloat := UnitPrice;
    if SlabSize = 0 then
      Parambyname('Slab_Size').clear
    else
      Parambyname('Slab_Size').AsInteger := SlabSize;

    Parambyname('Adhesive_Product_Code').Asstring := AdhesiveProductCode;
    Parambyname('Adhesive_Quantity').Asinteger := AdhesiveQuantity;
    Parambyname('Adhesive_Unit_Cost').Asfloat := AdhesiveUnitCost;
    Parambyname('Adhesive_Cost_Pack_Quantity').Asfloat := AdhesiveCostPackQuantity;

    execsql;
  end;

  {Create the prices in the supplier}
  if UnitCost > 0 then
    begin
      dtmdlQuoteSupplier := TdtmdlSuppliers.create(application);
      try
        {Check Supplier/Worktop}
        dtmdlQuoteSupplier.qryChkSupplierWT.close;
        dtmdlQuoteSupplier.qryChkSupplierWT.parambyname('Supplier').asinteger := Supplier;
        dtmdlQuoteSupplier.qryChkSupplierWT.parambyname('Worktop').asinteger := Worktop;
        dtmdlQuoteSupplier.qryChkSupplierWT.open;

        if dtmdlQuoteSupplier.qryChkSupplierWT.recordcount = 0 then
          begin
            {Add Supplier/Worktop record}
            dtmdlQuoteSupplier.qryAddSupplierWT.close;
            dtmdlQuoteSupplier.qryAddSupplierWT.parambyname('Supplier').asinteger := Supplier;
            dtmdlQuoteSupplier.qryAddSupplierWT.parambyname('Worktop').asinteger := Worktop;
            dtmdlQuoteSupplier.qryAddSupplierWT.execsql;
          end;

        {Check for Supplier/Worktop/Thickness}

        dtmdlQuoteSupplier.qryChkSupplierWTThickness.close;

        if dtmdlWorktops.IsSQL then
          begin
            sText := stringreplace(dtmdlQuoteSupplier.qryChkSupplierWTThickness.SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
            dtmdlQuoteSupplier.qryChkSupplierWTThickness.SQL.Text := sText;
          end;

        dtmdlQuoteSupplier.qryChkSupplierWTThickness.parambyname('Supplier').asinteger := Supplier;
        dtmdlQuoteSupplier.qryChkSupplierWTThickness.parambyname('Worktop').asinteger := Worktop;
        dtmdlQuoteSupplier.qryChkSupplierWTThickness.parambyname('Thickness').asinteger := Thickness;
        dtmdlQuoteSupplier.qryChkSupplierWTThickness.open;

        {If the worktop and thickness already exists for this supplier then don't add}
        if dtmdlQuoteSupplier.qryChkSupplierWTThickness.recordcount = 0 then
          begin
            {Get Price Pointer}
            dtmdlWorktops.qryNewPrice.Close;
            dtmdlWorktops.qryNewPrice.Open;
            iPricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	          dtmdlWorktops.qryAddPointer.Close;
            dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := iPricePointer;
            dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
	          dtmdlWorktops.qryAddPointer.ExecSQl;

            {Add Supplier/Worktop/Thickness record}
            dtmdlQuoteSupplier.qryAddSupplierWTThickness.close;
            dtmdlQuoteSupplier.qryAddSupplierWTThickness.parambyname('Supplier').asinteger := Supplier;
            dtmdlQuoteSupplier.qryAddSupplierWTThickness.parambyname('Worktop').asinteger := Worktop;
            dtmdlQuoteSupplier.qryAddSupplierWTThickness.parambyname('Thickness').asinteger := Thickness;
            dtmdlQuoteSupplier.qryAddSupplierWTThickness.parambyname('Price_Pointer').asinteger := iPricePointer;
            dtmdlQuoteSupplier.qryAddSupplierWTThickness.execsql;
          end
        else
          begin
            if dtmdlQuoteSupplier.qryChkSupplierWTThickness.fieldbyname('Unit_Cost').asfloat > 0 then
              exit
            else
              iPricePointer := dtmdlQuoteSupplier.qryChkSupplierWTThickness.fieldbyname('Price_Pointer').asinteger;
          end;
          
        {Now add the cost price}
        dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := iPricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := 0.00;
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := UnitCost;
	      dtmdlWorktops.qryAddPrice.execSQL;

      finally
        dtmdlQuoteSupplier.Free;
      end;
    end;
end;

procedure TQSlab.SetAdhesiveCostPackQuantity(const Value: integer);
begin
  FAdhesiveCostPackQuantity := Value;
end;

procedure TQSlab.SetAdhesiveDescription(const Value: string);
begin
  FAdhesiveDescription := Value;
end;

procedure TQSlab.SetAdhesiveProductCode(const Value: string);
begin
  FAdhesiveProductCode := Value;
end;

procedure TQSlab.SetAdhesiveQuantity(const Value: integer);
begin
  FAdhesiveQuantity := Value;
end;

procedure TQSlab.SetAdhesiveUnitCost(const Value: currency);
begin
  FAdhesiveUnitCost := Value;
end;

procedure TQSlab.SetDepth(const Value: integer);
begin
  FDepth := Value;
end;

procedure TQSlab.SetLength(const Value: integer);
begin
  FLength := Value;
end;

procedure TQSlab.SetMarkupPercentage(const Value: double);
begin
  FMarkupPercentage := Value;
end;

procedure TQSlab.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TQSlab.SetParent(const Value: TQuote);
begin
  FParent := Value;
end;

procedure TQSlab.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TQSlab.SetQSlabNo(const Value: integer);
begin
  FQSlabNo := Value;
end;

procedure TQSlab.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TQSlab.SetSlabSize(const Value: integer);
begin
  FSlabSize := Value;
end;

procedure TQSlab.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TQSlab.SetSupplierName(const Value: string);
begin
  FSupplierName := Value;
end;

procedure TQSlab.Setthickness(const Value: integer);
begin
  Fthickness := Value;
end;

procedure TQSlab.SetthicknessDesc(const Value: string);
begin
  FthicknessDesc := Value;
end;

procedure TQSlab.SetUnitCost(const Value: currency);
begin
  FUnitCost := Value;
end;

procedure TQSlab.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

procedure TQSlab.SetWasteMultiplier(const Value: integer);
begin
  FWasteMultiplier := Value;
end;

procedure TQSlab.SetWastePercentage(const Value: integer);
begin
  FWastePercentage := Value;
end;

procedure TQSlab.SetWasteValue(const Value: double);
begin
  FWasteValue := Value;
end;

procedure TQSlab.Setworktop(const Value: integer);
begin
  Fworktop := Value;
end;

procedure TQSlab.Setworktopdesc(const Value: string);
begin
  Fworktopdesc := Value;
end;

function TdtmdlQuote.GetCustomerVat(tempCust: integer): integer;
begin
  result := 0;
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Vat').asinteger;
    end;
end;

function TdtmdlQuote.GetContractCutOutDiscount(tmpCode: integer): real;
begin
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tmpCode;
      open;
      result := fieldbyname('CutOut_Discount').asfloat;
    end;
end;

function TdtmdlQuote.GetContractEdgeDiscount(tmpCode: integer): real;
begin
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tmpCode;
      open;
      result := fieldbyname('Edge_Discount').asfloat;
    end;
end;

procedure TdtmdlQuote.UpdateQAddress(tempQuote, tempCustomer, tempAddress: integer; tempName: string);
begin
  with qryUpQuoteAddress do
    begin
      close;
      parambyname('Quote').asinteger := TempQuote;
      parambyname('Customer').asinteger := TempCustomer;
      parambyname('Customer_Name').asstring := tempName;
      parambyname('Address').clear;
      execsql;
    end;

  try
    with qryDelAddress do
      begin
        close;
        parambyname('Address').asinteger := TempAddress;
        execsql;
      end;
  except
  end;
end;

procedure TdtmdlQuote.UpdateAllQAddress(tempName: string; tempCustomer: integer);
begin
  with qryGetSpeculativeQuotes do
    begin
      close;
      parambyname('Customer_Name').asstring := tempName;
      open;

      while eof <> true do
        begin
          self.UpdateQAddress(fieldbyname('Quote').asinteger, fieldbyname('Customer').asinteger, fieldbyname('Address').asinteger, tempName);
          next;
        end;
    end;
end;

procedure TdtmdlQuote.qryAllQuotesExpiry_Date_NewGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
(*  if (qryAllQuotesExpiry_Date.asdatetime = 0) then
    text := ''
  else
    text := padatestr(qryAllQuotesExpiry_Date.asdatetime);
*)
end;

end.
