unit WTJobsDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, wtNotesDM, gtQrCtrls, AllCommon, Math;

type
  TjMode   = (jAdd, jChange, jDelete, jCopy, jView, jConvert, jRestrict);
  TjelMode   = (jelAdd, jelChange, jelDelete, jelView);
  TjcoMode   = (jcoAdd, jcoChange, jcoDelete, jcoView);
  TjedgMode   = (jedgAdd, jedgChange, jedgDelete, jedgView);
  TjexMode   = (jexAdd, jexChange, jexDelete, jexView);
  TjevMode   = (jevAdd, jevChange, jevDelete, jevView);
  TjremMode   = (jremAdd, jremChange, jremDelete, jremView);

  TdtmdlJob = class(TDataModule)
    dtsAllJobs: TDataSource;
    qryAllJobs: TQuery;
    qrydummy: TQuery;
    qryZero: TQuery;
    qryjHeader: TQuery;
    qryjAddHeader: TQuery;
    qryjUpHeader: TQuery;
    qryjElement: TQuery;
    qryjAddElement: TQuery;
    qryjAllElements: TQuery;
    qryjExtra: TQuery;
    qryjCutOut: TQuery;
    qryjEdge: TQuery;
    qryjAddExtra: TQuery;
    qryjAddCutOut: TQuery;
    qryjAddEdge: TQuery;
    qryJAllCutOuts: TQuery;
    qryjAllEdges: TQuery;
    qryJAllExtras: TQuery;
    qryjUpElement: TQuery;
    qryjUpCutOuts: TQuery;
    qryGetAddress: TQuery;
    qryGetCustomer: TQuery;
    qryMaterial: TQuery;
    dtsMaterial: TDataSource;
    qryOperator: TQuery;
    dtsOperator: TDataSource;
    qryjUpstand: TQuery;
    qryjAllUpstands: TQuery;
    qryUpCompany: TQuery;
    qryJGetLast: TQuery;
    qryDelAddress: TQuery;
    qryGetNextAdd: TQuery;
    qryAddAddress: TQuery;
    qryUpAddress: TQuery;
    qryVat: TQuery;
    qryQHeader: TQuery;
    qryQAllElements: TQuery;
    qryQAllCutOuts: TQuery;
    qryQAllEdges: TQuery;
    qryQAllExtras: TQuery;
    qryQAllUpstands: TQuery;
    qryJEvent: TQuery;
    qryJAddEvent: TQuery;
    qryJAllEvents: TQuery;
    qryAllJobsJob: TFloatField;
    qryAllJobsJob_Status: TIntegerField;
    qryAllJobsQuote: TIntegerField;
    qryAllJobsCustomer: TIntegerField;
    qryAllJobsContact_name: TStringField;
    qryAllJobsOrder_ref_no: TStringField;
    qryAllJobsDate_Raised: TDateTimeField;
    qryAllJobsDate_Required: TDateTimeField;
    qryAllJobsPayment_due: TDateTimeField;
    qryAllJobsProduction_date: TDateTimeField;
    qryAllJobsTemplate_date: TDateTimeField;
    qryAllJobsInstallation_date: TDateTimeField;
    qryAllJobsDeposit_amount: TFloatField;
    qryAllJobsDelivery_Price: TFloatField;
    qryAllJobsInstallation_price: TFloatField;
    qryAllJobsSurvey_price: TFloatField;
    qryAllJobsOperator: TIntegerField;
    qryAllJobsProduction_date_Actual: TDateTimeField;
    qryAllJobsTemplate_date_actual: TDateTimeField;
    qryAllJobsInstallation_date_actual: TDateTimeField;
    qryAllJobsDescription: TStringField;
    qryAllJobsMaterial_Type: TIntegerField;
    qryAllJobsExtra_Notes: TIntegerField;
    qryAllJobsAvailability: TIntegerField;
    qryAllJobsPayment_Terms: TIntegerField;
    qryAllJobsReference: TStringField;
    qryAllJobsNett_Price: TFloatField;
    qryAllJobsInactive: TStringField;
    qryAllJobsInactive_Reason: TIntegerField;
    qryAllJobsAddress: TIntegerField;
    qryAllJobsDiscount_Rate: TFloatField;
    qryAllJobsDiscount_Value: TFloatField;
    qryAllJobsCustomer_Name: TStringField;
    qryAllJobsMaterial_Description: TStringField;
    qryAllJobsStatus_Description: TStringField;
    qryAllJobsOperator_Name: TStringField;
    qryAllJobsGross_Price: TFloatField;
    qryUpQuote: TQuery;
    qryUpSOLine: TQuery;
    qryUpSOStatus: TQuery;
    qrySOHead: TQuery;
    qryJUpStatus: TQuery;
    qryGetSO: TQuery;
    qryGetSOLines: TQuery;
    qryJRemedial: TQuery;
    qryJAddRemedial: TQuery;
    qryJAllRemedials: TQuery;
    qryAllJobsInstall_Address: TIntegerField;
    qryAllJobsDeposit_Terms: TFloatField;
    qryAllJobsVAT: TIntegerField;
    qryAllJobsQuote_Nett_Price: TFloatField;
    qryAllJobsSales_Order: TIntegerField;
    qryFitter: TQuery;
    dtsFitter: TDataSource;
    qryDesigner: TQuery;
    dtsDesigner: TDataSource;
    dtsBranch: TDataSource;
    qryBranch: TQuery;
    qryAllJobsis_retail_customer: TStringField;
    qryAllJobsGross_Price_Incl_Vat: TFloatField;
    qryAllJobsProject_Reference: TStringField;
    qryAllJobsCredit_Status: TStringField;
    qryAllJobsCredit_Limit: TFloatField;
    qryReason: TQuery;
    dtsReason: TDataSource;
    qryAllJobsWorktop_Weight: TFloatField;
    qryAddRemedial: TQuery;
    qryCheckRemedial: TQuery;
  private
    function GetHeaderCount: integer;
    function GetHeaderCountAll: integer;
    function GetCurrentJob: integer;
    function GetNextJNumber: integer;
    function GetInstallAddress(tempQuote: integer): integer;
  public
    Customer: integer;
    CustomerName: string;
    Description: string;
    ProjectReference: string;
    Reference: string;
    Material: string;
    OrderRef: string;
    QuoteNo: integer;
    SalesOrder: integer;
    ShowWIP: boolean;
    ShowInactive: string;
    ShowRecords: integer;
    SortType: string;
    SortOrder: string;
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
    function GetCustomerAddress(tempcust: integer): string;
    function GetCustomerStreet(tempCust: integer): string;
    function GetCustomerCounty(tempCust: integer): string;
    function GetCustomerEmail(tempCust: integer): string;
    function GetCustomerFax(tempCust: integer): string;
    function GetCustomerLocale(tempCust: integer): string;
    function GetCustomerPostcode(tempCust: integer): string;
    function GetCustomerTelephone(tempCust: integer): string;
    function GetCustomerTown(tempCust: integer): string;
    function GetCustomerWebsite(tempCust: integer): string;
    function GetCustomerPO(tempQuote: integer): string;
    function GetInstallDate(tempQuote: integer): TDateTime;
    function GetInstallName(tempQuote: integer): string;
    function GetInstallPhone(tempQuote: integer): string;
    function GetNarrative(const iNarrative: integer): string;
    function GetTemplateDate(tempQuote: integer): TDateTime;
    function GetVatRate(tempVat: integer): real;
    function UsingSearch: boolean;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    function SetAddress(iAddress: integer;
                        AddName, Street, AddLocale: string;
                        Town, postcode, County, phone, email: string): integer;
    property CurrentJob : integer read GetCurrentJob;
    property HeaderCount: integer read GetHeaderCount;
    property HeaderCountAll: integer read GetHeaderCountAll;
    procedure RefreshAlldata;
    procedure Refreshdata;
    procedure UpdateQStatus(tempQuote: integer);
    procedure UpdateSOLine(tempQuote, tempJob: integer);
    procedure UpdateSOStatus(tempSO, tempStatus: integer);
    procedure SetSOrderStatus(tempJob: real);
    function SOOutstandingBalance(tempJob: real): real;
  end;

  TJob = class;

  TJExtra  = class
  private
    FUnitPrice: currency;
    FQuantity: double;
    FPriceUnit: integer;
    FExtra: integer;
    FJExNumber: integer;
    FPriceUnitDesc: string;
    FExtraDesc: string;
    FParent: TJob;
    FDoNotDiscount: boolean;
    function GetTotalPrice: currency;
    procedure SetExtra(const Value: integer);
    procedure SetExtraDesc(const Value: string);
    procedure SetParent(const Value: TJob);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetJExNumber(const Value: integer);
    procedure SetQuantity(const Value: double);
    procedure SetUnitPrice(const Value: currency);
    procedure SetDoNotDiscount(const Value: boolean);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    function Clone : TJExtra;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DoNotDiscount: boolean read FDoNotDiscount write SetDoNotDiscount;
    property Extra: integer read FExtra write SetExtra;
    property ExtraDesc: string read FExtraDesc write SetExtraDesc;
    property Parent: TJob read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property JExNumber: integer read FJExNumber write SetJExNumber;
    property Quantity: double read FQuantity write SetQuantity;
    property TotalPrice: currency read GetTotalPrice;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
  end;

  TJExtras = class;

  TJEdge  = class
  private
    FUnitPrice: currency;
    FLength: double;
    FEdge: integer;
    FJEdgNumber: integer;
    FMaterial: integer;
    FPriceUnit: integer;
    FEdgeDesc: string;
    FMaterialDescr: string;
    FPriceUnitDesc: string;
    FParent: TJob;
    FEdgeType: integer;
    FEdgeTypeDesc: string;
    function GetTotalPrice: currency;
    procedure SetEdge(const Value: integer);
    procedure SetEdgeDesc(const Value: string);
    procedure SetJEdgNumber(const Value: integer);
    procedure SetLength(const Value: double);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialDescr(const Value: string);
    procedure SetParent(const Value: TJob);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetUnitPrice(const Value: currency);
    procedure SetEdgeType(const Value: integer);
    procedure SetEdgeTypeDesc(const Value: string);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    function Clone : TJEdge;
    procedure LoadFromDB;
    procedure SaveToDB;
    property Edge: integer read FEdge write SetEdge;
    property EdgeDesc: string read FEdgeDesc write SetEdgeDesc;
    property EdgeType: integer read FEdgeType write SetEdgeType;
    property EdgeTypeDesc: string read FEdgeTypeDesc write SetEdgeTypeDesc;
    property Length: double read FLength write SetLength;
    property Material: integer read FMaterial write SetMaterial;
    Property MaterialDescr: string read FMaterialDescr write SetMaterialDescr;
    property Parent: TJob read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property JEdgNumber: integer read FJEdgNumber write SetJEdgNumber;
    property TotalPrice: currency read GetTotalPrice;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
  end;

  TJEdges = class;

  TJEvent   = class
  private
    FEventNumber: integer;
    FOperator: integer;
    FDateEntered: TDateTime;
    FParent: TJob;
    FOperatorName: string;
    FNarrative: TNotes;
    procedure SetDateEntered(const Value: TDateTime);
    procedure SetEventNumber(const Value: integer);
    procedure SetOperator(const Value: integer);
    procedure SetParent(const Value: TJob);
    procedure SetOperatorName(const Value: string);
    procedure SetNarrative(const Value: TNotes);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    function Clone : TJEvent;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DateEntered: TDateTime read FDateEntered write SetDateEntered;
    property EventNumber: integer read FEventNumber write SetEventNumber;
    property Narrative: TNotes read FNarrative write SetNarrative;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName:string read FOperatorName write SetOperatorName;
    property Parent: TJob read FParent write SetParent;
  end;

  TJEvents = class;

  TJRemedial   = class
  private
    FParent: TJob;
    FFitter: integer;
    FRemedialNumber: integer;
    FPrice: real;
    FCompleted: string;
    FFitterName: string;
    FMaterialsRequired: string;
    FInstallDate: TDateTime;
    FNarrative: TNotes;
    FOperator: integer;
    FOperatorName: string;
    FDateRaised: TDateTime;
    FManufacturingNotes: integer;
    FOriginalTemplater: integer;
    FSiteRequirements: string;
    FOriginalFitter: integer;
    FRemedialType: integer;
    FRemedialCategory: integer;
    FToolsRequired: string;
    FRemedialDept: integer;
    FAdditionalNotes: integer;
    FItemsStillOnSite: string;
    FItemsToReturnToSite: string;
    FAdditionalNotesText: string;
    FManufacturingNotesText: string;
    FProductionRequired: string;
    FRemedialID: integer;
    FCustomer: integer;
    FOfficeNotes: integer;
    FOfficeNotesText: string;
    procedure SetParent(const Value: TJob);
    procedure SetCompleted(const Value: string);
    procedure SetFitter(const Value: integer);
    procedure SetFitterName(const Value: string);
    procedure SetInstallDate(const Value: TDateTime);
    procedure SetMaterialsRequired(const Value: string);
    procedure SetPrice(const Value: real);
    procedure SetRemedialNumber(const Value: integer);
    procedure SetNarrative(const Value: TNotes);
    procedure SetDateRaised(const Value: TDateTime);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetAdditionalNotes(const Value: integer);
    procedure SetItemsStillOnSite(const Value: string);
    procedure SetItemsToReturnToSite(const Value: string);
    procedure SetManufacturingNotes(const Value: integer);
    procedure SetOriginalFitter(const Value: integer);
    procedure SetOriginalTemplater(const Value: integer);
    procedure SetRemedialCategory(const Value: integer);
    procedure SetRemedialDept(const Value: integer);
    procedure SetRemedialType(const Value: integer);
    procedure SetSiteRequirements(const Value: string);
    procedure SetToolsRequired(const Value: string);
    procedure SetAdditionalNotesText(const Value: string);
    procedure SetManufacturingNotesText(const Value: string);
    procedure SetProductionRequired(const Value: string);
    procedure SetRemedialID(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetOfficeNotes(const Value: integer);
    procedure SetOfficeNotesText(const Value: string);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    function Clone : TJRemedial;
    procedure LoadFromDB;
    procedure SaveToDB;
    property AdditionalNotes: integer read FAdditionalNotes write SetAdditionalNotes;
    property AdditionalNotesText: string read FAdditionalNotesText write SetAdditionalNotesText;
    property Completed: string read FCompleted write SetCompleted;
    property Customer: integer read FCustomer write SetCustomer;
    property DateRaised: TDateTime read FDateRaised write SetDateRaised;
    property Fitter: integer read FFitter write SetFitter;
    property FitterName: string read FFitterName write SetFitterName;
    property InstallDate: TDateTime read FInstallDate write SetInstallDate;
    property ItemsStillOnSite: string read FItemsStillOnSite write SetItemsStillOnSite;
    property ItemsToReturnToSite: string read FItemsToReturnToSite write SetItemsToReturnToSite;
    property ManufacturingNotes: integer read FManufacturingNotes write SetManufacturingNotes;
    property ManufacturingNotesText: string read FManufacturingNotesText write SetManufacturingNotesText;
    property MaterialsRequired: string read FMaterialsRequired write SetMaterialsRequired;
    property Narrative: TNotes read FNarrative write SetNarrative;
    property OfficeNotes: integer read FOfficeNotes write SetOfficeNotes;
    property OfficeNotesText: string read FOfficeNotesText write SetOfficeNotesText;
    property OriginalFitter: integer read FOriginalFitter write SetOriginalFitter;
    property OriginalTemplater: integer read FOriginalTemplater write SetOriginalTemplater;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property Parent: TJob read FParent write SetParent;
    property Price: real read FPrice write SetPrice;
    property ProductionRequired: string read FProductionRequired write SetProductionRequired;
    property RemedialCategory: integer read FRemedialCategory write SetRemedialCategory;
    property RemedialDept: integer read FRemedialDept write SetRemedialDept;
    property RemedialID: integer read FRemedialID write SetRemedialID;
    property RemedialNumber: integer read FRemedialNumber write SetRemedialNumber;
    property RemedialType: integer read FRemedialType write SetRemedialType;
    property SiteRequirements: string read FSiteRequirements write SetSiteRequirements;
    property ToolsRequired: string read FToolsRequired write SetToolsRequired;
  end;

  TJRemedials = class;

  TJCutOut  = class
  private
    FUnitPrice: currency;
    FQuantity: double;
    FJCONumber: integer;
    FMaterial: integer;
    FCutOut: integer;
    FPriceUnit: integer;
    FMaterialDescr: string;
    FCutOutDesc: string;
    FPriceUnitDesc: string;
    FParent: TJob;
    FEdgeType: integer;
    FEdgeTypeDesc: string;
    function GetTotalPrice: currency;
    procedure SetCutOut(const Value: integer);
    procedure SetCutOutDesc(const Value: string);
    procedure SetJCONumber(const Value: integer);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialDescr(const Value: string);
    procedure SetParent(const Value: TJob);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetQuantity(const Value: double);
    procedure SetUnitPrice(const Value: currency);
    procedure SetEdgeType(const Value: integer);
    procedure SetEdgeTypeDesc(const Value: string);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    function Clone : TJCutOut;
    procedure LoadFromDB;
    procedure SaveToDB;
    property CutOut: integer read FCutOut write SetCutOut;
    property CutOutDesc: string read FCutOutDesc write SetCutOutDesc;
    property EdgeType: integer read FEdgeType write SetEdgeType;
    property EdgeTypeDesc: string read FEdgeTypeDesc write SetEdgeTypeDesc;
    property Material: integer read FMaterial write SetMaterial;
    Property MaterialDescr: string read FMaterialDescr write SetMaterialDescr;
    property Parent: TJob read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property JCONumber: integer read FJCONumber write SetJCONumber;
    property Quantity: double read FQuantity write SetQuantity;
    property TotalPrice: currency read GetTotalPrice;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
  end;

  TJCutOuts = class;

  TJElement = class
  private
    FParent: TJob;
    FJENumber: integer;
    FUnitPrice: currency;
    FDepth: double;
    FQuantity: double;
    FMaterial: integer;
    Fworktop: integer;
    FLength: integer;
    Fthickness: integer;
    FPriceUnit: integer;
    FMaterialDescr: string;
    FElementType: string;
    FworktopDesc: string;
    FPriceUnitDesc: string;
    FthicknessDesc: string;
    FworktopGroup: integer;
    FMaterialUse: integer;
    FMaterialUseDescr: string;
    FElementDescription: string;
    procedure SetParent(const Value: TJob);
    procedure SetJENumber(const Value: integer);
    function GetTotalPrice: currency;
    procedure SetDepth(const Value: double);
    procedure SetElementType(const Value: string);
    procedure SetLength(const Value: integer);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialDescr(const Value: string);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetQuantity(const Value: double);
    procedure Setthickness(const Value: integer);
    procedure SetthicknessDesc(const Value: string);
    procedure SetUnitPrice(const Value: currency);
    procedure Setworktop(const Value: integer);
    procedure SetworktopDesc(const Value: string);
    procedure SetworktopGroup(const Value: integer);
    procedure SetMaterialUse(const Value: integer);
    procedure SetMaterialUseDescr(const Value: string);
    procedure SetElementDescription(const Value: string);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    function Clone : TJElement;
    procedure LoadFromDB;
    procedure SaveToDB;
    property ElementDescription: string read FElementDescription write SetElementDescription;
    property ElementType: string read FElementType write SetElementType;
    property Depth: double read FDepth write SetDepth;
    property Material: integer read FMaterial write SetMaterial;
    property MaterialDescr: string read FMaterialDescr write SetMaterialDescr;
    property MaterialUse: integer read FMaterialUse write SetMaterialUse;
    property MaterialUseDescr: string read FMaterialUseDescr write SetMaterialUseDescr;
    property Parent: TJob read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property JENumber: integer read FJENumber write SetJENumber;
    property Quantity: double read FQuantity write SetQuantity;
    property TotalPrice: currency read GetTotalPrice;
    property thickness: integer read Fthickness write Setthickness;
    property thicknessDesc: string read FthicknessDesc write SetthicknessDesc;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
    property Length: integer read FLength write SetLength;
    property worktop: integer read Fworktop write Setworktop;
    property worktopDesc: string read FworktopDesc write SetworktopDesc;
    property worktopGroup: integer read FworktopGroup write SetworktopGroup;
  end;

  TJElements = class;

  TJUpstand = class
  private
    FUnitPrice: currency;
    FQuantity: double;
    FDepth: double;
    Fworktop: integer;
    FPriceUnit: integer;
    Fthickness: integer;
    FJENumber: integer;
    FMaterial: integer;
    FLength: integer;
    FElementType: string;
    FPriceUnitDesc: string;
    FthicknessDesc: string;
    FworktopDesc: string;
    FMaterialDescr: string;
    FParent: TJob;
    FPolishPrice: currency;
    FMaterialUse: integer;
    FMaterialUseDescr: string;
    FNoOfLengths: integer;
    FNoOfDepths: integer;
    FTotalUpstandPieces: integer;
    function GetTotalPolishPrice: currency;
    function GetTotalPrice: currency;
    procedure SetDepth(const Value: double);
    procedure SetElementType(const Value: string);
    procedure SetJENumber(const Value: integer);
    procedure SetLength(const Value: integer);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialDescr(const Value: string);
    procedure SetParent(const Value: TJob);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetQuantity(const Value: double);
    procedure Setthickness(const Value: integer);
    procedure SetthicknessDesc(const Value: string);
    procedure SetUnitPrice(const Value: currency);
    procedure Setworktop(const Value: integer);
    procedure SetworktopDesc(const Value: string);
    procedure SetPolishPrice(const Value: currency);
    procedure SetMaterialUse(const Value: integer);
    procedure SetMaterialUseDescr(const Value: string);
    procedure SetNoOfDepths(const Value: integer);
    procedure SetNoOfLengths(const Value: integer);
    procedure SetTotalUpstandPieces(const Value: integer);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    function Clone : TJUpstand;
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
    property Parent: TJob read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property JENumber: integer read FJENumber write SetJENumber;
    property Quantity: double read FQuantity write SetQuantity;
    property TotalPrice: currency read GetTotalPrice;
    property TotalPolishPrice: currency read GetTotalPolishPrice;
    property TotalUpstandPieces: integer read FTotalUpstandPieces write SetTotalUpstandPieces;
    property thickness: integer read Fthickness write Setthickness;
    property thicknessDesc: string read FthicknessDesc write SetthicknessDesc;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
    property PolishPrice: currency read FPolishPrice write SetPolishPrice;
    property Length: integer read FLength write SetLength;
    property worktop: integer read Fworktop write Setworktop;
    property worktopDesc: string read FworktopDesc write SetworktopDesc;
  end;

  TJUpstands = class;

  TJEvents    = class
  private
    FParent: TJob;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TJEvent;
    procedure SetItems(Index: integer; const Value: TJEvent);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    procedure Add(aEvent: TJEvent);
    procedure Clear;
    function  Clone : TJEvents;
    procedure Delete(const Index : integer);
    function  IndexOf(const EventNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJEvent read GetItems write SetItems;
      default;
    property Parent : TJob read FParent;
  end;

  TJExtras   = class
  private
    FItems: TList;
    FParent: TJob;
    function GetCount: integer;
    function GetItems(Index: integer): TJExtra;
    procedure SetItems(Index: integer; const Value: TJExtra);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    procedure Add(aExtra: TJExtra);
    procedure Clear;
    function  Clone : TJExtras;
    procedure Delete(const Index : integer);
    function  IndexOf(const ExtraNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJExtra read GetItems write SetItems;
      default;
    property Parent : TJob read FParent;
  end;

  TJEdges    = class
  private
    FItems: TList;
    FParent: TJob;
    function GetCount: integer;
    function GetItems(Index: integer): TJEdge;
    procedure SetItems(Index: integer; const Value: TJEdge);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    procedure Add(aEdge : TJEdge);
    procedure Clear;
    function  Clone : TJEdges;
    procedure Delete(const Index : integer);
    function  IndexOf(const EdgeNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJEdge read GetItems write SetItems;
      default;
    property Parent : TJob read FParent;
  end;

  TJRemedials    = class
  private
    FItems: TList;
    FParent: TJob;
    function GetCount: integer;
    function GetItems(Index: integer): TJRemedial;
    procedure SetItems(Index: integer; const Value: TJRemedial);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    procedure Add(aRemedial : TJRemedial);
    procedure Clear;
    function  Clone : TJRemedials;
    procedure Delete(const Index : integer);
    function  IndexOf(const RemedialNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJRemedial read GetItems write SetItems;
      default;
    property Parent : TJob read FParent;
  end;

  TJCutOuts  = class
  private
    FItems: TList;
    FParent: TJob;
    function GetCount: integer;
    function GetItems(Index: integer): TJCutOut;
    procedure SetItems(Index: integer; const Value: TJCutOut);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    procedure Add(aCutOut : TJCutOut);
    procedure Clear;
    function  Clone : TJCutOuts;
    procedure Delete(const Index : integer);
    function  IndexOf(const CutOutNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJCutOut read GetItems write SetItems;
      default;
    property Parent : TJob read FParent;
  end;

  TJElements  = class
  private
    FParent: TJob;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TJElement;
    procedure SetItems(Index: integer; const Value: TJElement);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    procedure Add(aElement : TJElement);
    procedure Clear;
    function  Clone : TJElements;
    procedure Delete(const Index : integer);
    function  IndexOf(const ElementNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJElement read GetItems write SetItems;
      default;
    property Parent : TJob read FParent;
  end;

  TJUpstands  = class
  private
    FItems: TList;
    FParent: TJob;
    function GetCount: integer;
    function GetItems(Index: integer): TJUpstand;
    procedure SetItems(Index: integer; const Value: TJUpstand);
  public
    constructor Create(Job : TJob);
    destructor Destroy; override;
    procedure Add(aUpstand : TJUpstand);
    procedure Clear;
    function  Clone : TJUpstands;
    procedure Delete(const Index : integer);
    function  IndexOf(const UpstandNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJUpstand read GetItems write SetItems;
      default;
    property Parent : TJob read FParent;
  end;

  TJob = class
  private
    FdbKey: integer;
    FCustomer: integer;
    FAddress: integer;
    FCustomerName: string;
    FJDate: TDateTime;
    FDataModule: TdtmdlJob;
    FJElements: TJElements;
    FRetail: bytebool;
    FNettPrice: currency;
    FDiscountValue: currency;
    FSurveyPrice: currency;
    FDeliveryPrice: currency;
    FInstallPrice: currency;
    FDiscountRate: double;
    FOperator: integer;
    FExtraNotes: integer;
    FEstimator: integer;
    FAvailability: integer;
    FStatus: integer;
    FReason: integer;
    FVat: integer;
    FTerms: integer;
    FMaterial: integer;
    FVatRate: real;
    FReference: string;
    FDescription: string;
    FEstimatorName: string;
    FContactName: string;
    FMaterialDesc: string;
    FInactive: string;
    FOperatorName: string;
    FStatusDescr: string;
    FDateRequired: TDateTime;
    FJUpstands: TJUpstands;
    FJCutOuts: TJCutOuts;
    FJEdges: TJEdges;
    FJExtras: TJExtras;
    FCustomerPO: string;
    FQuote: integer;
    FProductionDate: TDateTime;
    FActProdDate: TDateTime;
    FActInstallDate: TDateTime;
    FActTempDate: TDateTime;
    FInstallDate: TDateTime;
    FTemplateDate: TDateTime;
    FJEvents: TJEvents;
    FInstallAddress: integer;
    FDepositAmount: currency;
    FDepositTerms: double;
    FQuoteNettPrice: currency;
    FJRemedials: TJRemedials;
    FFitter: integer;
    FFitterName: string;
    FInstallPhone: string;
    FInstallContact: string;
    FDesignerID: integer;
    FBranch: integer;
    FRiskNotes: integer;
    FMarkupValue: currency;
    FMarkupRate: double;
    FJMode: TJMode;
    FWasteValue: currency;
    FProjectReference: string;
    FSpeculative: boolean;
    procedure SetdbKey(const Value: integer);
    procedure SetAddress(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetJDate(const Value: TDateTime);
    function GetTotalDiscountablePrice: currency;
    function GetTotalDiscounted: currency;
    function GetTotalGross: currency;
    function GetTotalPrice: currency;
    function GetTotalVat: currency;
    procedure SetAvailability(const Value: integer);
    procedure SetContactName(const Value: string);
    procedure SetDateRequired(const Value: TDateTime);
    procedure SetDeliveryPrice(const Value: currency);
    procedure SetDescription(const Value: string);
    procedure SetDiscountRate(const Value: double);
    procedure SetDiscountValue(const Value: currency);
    procedure SetEstimator(const Value: integer);
    procedure SetEstimatorName(const Value: string);
    procedure SetExtraNotes(const Value: integer);
    procedure SetInactive(const Value: string);
    procedure SetInstallPrice(const Value: currency);
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialDesc(const Value: string);
    procedure SetNettPrice(const Value: currency);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetReason(const Value: integer);
    procedure SetReference(const Value: string);
    procedure SetRetail(const Value: bytebool);
    procedure SetStatus(const Value: integer);
    procedure SetStatusDescr(const Value: string);
    procedure SetSurveyPrice(const Value: currency);
    procedure SetTerms(const Value: integer);
    procedure SetVat(const Value: integer);
    procedure SetVatRate(const Value: real);
    procedure SetCustomerPO(const Value: string);
    procedure SetActInstallDate(const Value: TDateTime);
    procedure SetActProdDate(const Value: TDateTime);
    procedure SetActTempDate(const Value: TDateTime);
    procedure SetInstallDate(const Value: TDateTime);
    procedure SetProductionDate(const Value: TDateTime);
    procedure SetQuote(const Value: integer);
    procedure SetTemplateDate(const Value: TDateTime);
    function GetCurrentStatus: integer;
    procedure SetInstallAddress(const Value: integer);
    procedure SetDepositAmount(const Value: currency);
    procedure SetDepositTerms(const Value: double);
    procedure SetQuoteNettPrice(const Value: currency);
    procedure SetFitter(const Value: integer);
    procedure SetFitterName(const Value: string);
    procedure SetInstallContact(const Value: string);
    procedure SetInstallPhone(const Value: string);
    procedure SetBranch(const Value: integer);
    procedure SetDesignerID(const Value: integer);
    procedure SetRiskNotes(const Value: integer);
    procedure SetMarkupRate(const Value: double);
    procedure SetMarkupValue(const Value: currency);
    procedure SetJMode(const Value: TJMode);
    procedure SetWasteValue(const Value: currency);
    procedure SetProjectReference(const Value: string);
    procedure SetSpeculative(const Value: boolean);
  public
    constructor Create(DataModule : TdtmdlJob);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TJob;
    procedure DeleteFromDB;
    procedure DeleteElements;
    procedure DeleteUpstands;
    procedure DeleteCutOuts;
    procedure DeleteEdges;
    procedure DeleteExtras;
    procedure DeleteRemedials;
    procedure DeleteEvents;
    procedure LoadFromDB;
    procedure LoadFromQuote;
    procedure LoadFromSalesOrder;
    procedure LoadElements;
    procedure LoadCutOuts;
    procedure LoadEdges;
    procedure LoadExtras;
    procedure LoadEvents;
    procedure LoadUpstands;
    procedure LoadRemedials;
    procedure LoadQCutOuts;
    procedure LoadQEdges;
    procedure LoadQElements;
    procedure LoadQExtras;
    procedure LoadQUpstands;
    procedure MoveSalesDocuments;
    procedure SaveStatusToDB;
    procedure SaveToDB(TempAll: boolean);
    procedure SaveCutOuts;
    procedure SaveEdges;
    procedure SaveExtras;
    procedure SaveEvents;
    procedure SaveElements;
    procedure SaveRemedials;
    procedure SaveUpstands;
    procedure SaveJobNumber;
    property ActInstallDate: TDateTime read FActInstallDate write SetActInstallDate;
    property ActProdDate: TDateTime read FActProdDate write SetActProdDate;
    property ActTempDate: TDateTime read FActTempDate write SetActTempDate;
    property Address: integer read FAddress write SetAddress;
    property Availability: integer read FAvailability write SetAvailability;
    property Branch: integer read FBranch write SetBranch;
    property ContactName: string read FContactName write SetContactName;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property CustomerPO: string read FCustomerPO write SetCustomerPO;
    property CutOuts: TJCutOuts read FJCutOuts;
    property DataModule: TdtmdlJob read FDataModule;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property DesignerID: integer read FDesignerID write SetDesignerID;
    property dbKey: integer read FdbKey write SetdbKey;
    property Description: string read FDescription write SetDescription;
    property DeliveryPrice: currency read FDeliveryPrice write SetDeliveryPrice;
    property DepositTerms: double read FDepositTerms write SetDepositTerms;
    property DepositAmount: currency read FDepositAmount write SetDepositAmount;
    property DiscountRate: double read FDiscountRate write SetDiscountRate;
    property DiscountValue: currency read FDiscountValue write SetDiscountValue;
    property Edges: TJEdges read FJEdges;
    property Elements : TJElements read FJElements;
    property Estimator: integer read FEstimator write SetEstimator;
    property EstimatorName: string read FEstimatorName write SetEstimatorName;
    property Extras: TJExtras read FJExtras;
    property ExtraNotes: integer read FExtraNotes write SetExtraNotes;
    property Events: TJEvents read FJEvents;
    property Fitter: integer read FFitter write SetFitter;
    property FitterName: string read FFitterName write SetFitterName;
    property JDate: TDateTime read FJDate write SetJDate;
    property JMode: TJMode read FJMode write SetJMode;
    property Inactive: string read FInactive write SetInactive;
    property InstallAddress: integer read FInstallAddress write SetInstallAddress;
    property InstallContact: string read FInstallContact write SetInstallContact;
    property InstallPhone: string read FInstallPhone write SetInstallPhone;
    property InstallDate: TDateTime read FInstallDate write SetInstallDate;
    property InstallPrice: currency read FInstallPrice write SetInstallPrice;
    property MarkupRate: double read FMarkupRate write SetMarkupRate;
    property MarkupValue: currency read FMarkupValue write SetMarkupValue;
    property Material:integer read FMaterial write SetMaterial;
    property MaterialDesc: string read FMaterialDesc write SetMaterialDesc;
    property NettPrice: currency read FNettPrice write SetNettPrice;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property ProductionDate: TDateTime read FProductionDate write SetProductionDate;
    property ProjectReference: string read FProjectReference write SetProjectReference;
    property Quote: integer read FQuote write SetQuote;
    property QuoteNettPrice: currency read FQuoteNettPrice write SetQuoteNettPrice;
    property Reason: integer read FReason write SetReason;
    property Remedials: TJRemedials read FJRemedials;
    property Retail: bytebool read FRetail write SetRetail;
    property Reference: string read FReference write SetReference;
    property RiskNotes: integer read FRiskNotes write SetRiskNotes;
    property CurrentStatus: integer read GetCurrentStatus;
    property Speculative: boolean read FSpeculative write SetSpeculative;
    property Status: integer read FStatus write SetStatus;
    property StatusDescr: string read FStatusDescr write SetStatusDescr;
    property SurveyPrice: currency read FSurveyPrice write SetSurveyPrice;
    property TemplateDate: TDateTime read FTemplateDate write SetTemplateDate;
    property Terms: integer read FTerms write SetTerms;
    property TotalDiscountablePrice: currency read GetTotalDiscountablePrice;
    property TotalPrice: currency read GetTotalPrice;
    property TotalVat: currency read GetTotalVat;
    property TotalGross: currency read GetTotalGross;
    property TotalDiscounted: currency read GetTotalDiscounted;
    property Upstands: TJUpstands read FJUpstands;
    property Vat: integer read FVat write SetVat;
    property VatRate: real read FVatRate write SetVatRate;
    property WasteValue: currency read FWasteValue write SetWasteValue;
  end;

var
  dtmdlJob: TdtmdlJob;

implementation

uses wtMain, wtDataModule;

{$R *.dfm}

{ TdtmdlJob }

function TdtmdlJob.GetCurrentJob: integer;
begin
  if dtsAllJobs.dataset.RecordCount > 0 then
    Result := dtsAllJobs.dataset.FieldByName('Job').AsInteger
  else
    Result := 0;
end;

function TdtmdlJob.GetHeaderCount: integer;
begin
  result := 0;
end;

function TdtmdlJob.GetHeaderCountAll: integer;
begin
  result := qryAllJobs.recordcount;
end;

function TdtmdlJob.GetNextJNumber: integer;
begin
  with qryJGetLast do
    begin
      close;
      open;
      result := fieldbyname('Last_Job_number').asinteger + 1;
    end;
end;

procedure TdtmdlJob.RefreshAlldata;
var
  sTemp: string;
begin
  sTemp := '';
  with qryAllJobs do
    begin
      sql.Clear;

      if ShowRecords = 0 then
        stemp := 'SELECT DISTINCT TOP ' + inttostr(3000)
      else
        stemp := 'SELECT DISTINCT TOP ' + inttostr(ShowRecords);

      sTemp := sTemp + qryDummy.sql.text;

      if CustomerName <> '' then
        sTemp := sTemp + ' AND Job.Customer_name LIKE ''%' + CustomerName + '%''';
      if Description <> '' then
        sTemp := sTemp + ' AND Job.Description LIKE ''%' + Description + '%''';
      if ProjectReference <> '' then
        sTemp := sTemp + ' AND Job.Project_Reference LIKE ''%' + ProjectReference + '%''';
      if Reference <> '' then
        sTemp := sTemp + ' AND Job.Reference LIKE ''%' + Reference + '%''';
      if Material <> '' then
        sTemp := sTemp + ' AND Material_Type.Description LIKE ''%' + Material + '%''';
      if OrderRef <> '' then
        sTemp := sTemp + ' AND Job.Order_Ref_no LIKE ''%' + OrderRef + '%''';
(*      close;
      parambyname('Description').asstring := '%' + Description + '%';
*)
      if ShowWIP then
        sTemp := sTemp + ' AND (Job.Job_Status < 50)';

      sTemp := sTemp + ' AND ((Job.inactive is NULL) or (Job.inactive = ''N'') or '
                         + '(Job.inactive = ''' + ShowInactive + '''))';

      if TradeRetail = 1 then
        sTemp := sTemp + ' AND (((Customer.Is_Retail_Customer <> ''Y'') AND ((Customer.Is_Commercial_Customer <> ''Y'') OR (Customer.Is_Commercial_Customer IS NULL))))'
      else
      if TradeRetail = 2 then
        sTemp := sTemp + ' AND (Customer.Is_Retail_Customer = ''Y'')'
      else
      if TradeRetail = 3 then
        sTemp := sTemp + ' AND (Customer.Is_Commercial_Customer = ''Y'')' ;

      if SortOrder = '' then
        sTemp := sTemp + ' ORDER BY Job.Job desc'
      else
        sTemp := sTemp + ' ORDER BY ' + SortOrder;

      sql.text := sTemp;
      open;
    end;
end;

procedure TdtmdlJob.Refreshdata;
begin

end;

function TdtmdlJob.GetCustomerAddress(tempCust: integer): string;
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

function TdtmdlJob.GetCustomerStreet(tempCust: integer): string;
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

function TdtmdlJob.GetCustomerLocale(tempCust: integer): string;
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

function TdtmdlJob.GetCustomerTown(tempCust: integer): string;
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

function TdtmdlJob.GetCustomerPostcode(tempCust: integer): string;
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

function TdtmdlJob.GetCustomerCounty(tempCust: integer): string;
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

function TdtmdlJob.GetCustomerTelephone(tempCust: integer): string;
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

function TdtmdlJob.GetCustomerFax(tempCust: integer): string;
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

function TdtmdlJob.GetCustomerWebsite(tempCust: integer): string;
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

function TdtmdlJob.GetCustomerEmail(tempCust: integer): string;
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

function TdtmdlJob.GetAddress(tempCode: integer): string;
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

function TdtmdlJob.GetAddressName(tempCode: integer): string;
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

function TdtmdlJob.GetAddressStreet(tempCode: integer): string;
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

function TdtmdlJob.GetAddressLocale(tempCode: integer): string;
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

function TdtmdlJob.GetAddressTown(tempCode: integer): string;
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

function TdtmdlJob.GetAddressPostcode(tempCode: integer): string;
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

function TdtmdlJob.GetAddressCounty(tempCode: integer): string;
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

function TdtmdlJob.GetAddressTelephone(tempCode: integer): string;
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

function TdtmdlJob.GetAddressFax(tempCode: integer): string;
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

function TdtmdlJob.GetAddressWebsite(tempCode: integer): string;
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

function TdtmdlJob.GetAddressEmail(tempCode: integer): string;
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

procedure TdtmdlJob.DeleteAddress(iAddress: integer);
begin
  with qryDelAddress do
    begin
      close;
      parambyname('Address').asinteger := iAddress;
      execsql;
    end;
end;

function TdtmdlJob.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (Description <> '') or
            (Material <> '') or
            (ProjectReference <> '') or
            (Reference <> '') or
            (OrderRef <> '') or
            (QuoteNo <> 0) or
            (ShowInactive = 'Y') or
            (ShowWIP) then
    result := true
  else
    result := false;
end;

function TdtmdlJob.SetAddress(iAddress: integer; AddName, Street, AddLocale: string;
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

function TdtmdlJob.GetVatRate(tempVat: integer): real;
begin
  with qryVat do
    begin
      close;
      parambyname('Vat').asinteger := tempVat;
      open;
      Result := fieldbyname('Vat_Rate').asfloat;
    end;
end;

procedure TdtmdlJob.UpdateQStatus(tempQuote: integer);
begin
  with qryUpQuote do
    begin
      close;
      parambyname('Quote').asinteger := TempQuote;
      execsql;
    end;
end;

procedure TdtmdlJob.UpdateSOLine(tempQuote, tempJob: integer);
begin
  with qryUpSOLine do
    begin
      close;
      parambyname('Quote').asinteger := TempQuote;
      parambyname('Job').asinteger := Tempjob;
      execsql;
    end;
end;

procedure TdtmdlJob.UpdateSOStatus(tempSO, tempStatus: integer);
begin
  with qryUpSOStatus do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempSO;
      parambyname('Sales_Order_Status').asinteger := tempStatus;
      execsql;
    end;
end;

function TdtmdlJob.GetCustomerPO(tempQuote: integer): string;
begin
  with qrySOHead do
    begin
      close;
      parambyname('Quote').asinteger := tempQuote;
      open;
      result := fieldbyname('Order_Ref_No').asstring;
    end;
end;

function TdtmdlJob.GetInstallDate(tempQuote: integer): TDateTime;
begin
  with qrySOHead do
    begin
      close;
      parambyname('Quote').asinteger := tempQuote;
      open;
      result := fieldbyname('Date_Required').asdatetime;
    end;
end;

function TdtmdlJob.GetTemplateDate(tempQuote: integer): TDateTime;
begin
  with qrySOHead do
    begin
      close;
      parambyname('Quote').asinteger := tempQuote;
      open;
      result := fieldbyname('Template_Date').asdatetime;
    end;
end;

function TdtmdlJob.GetInstallName(tempQuote: integer): string;
begin
  with qrySOHead do
    begin
      close;
      parambyname('Quote').asinteger := tempQuote;
      open;
      result := fieldbyname('Install_Name').asstring;
    end;
end;

function TdtmdlJob.GetInstallAddress(tempQuote: integer): integer;
begin
  with qrySOHead do
    begin
      close;
      parambyname('Quote').asinteger := tempQuote;
      open;
      result := fieldbyname('Install_Address').asinteger;
    end;
end;

function TdtmdlJob.GetInstallPhone(tempQuote: integer): string;
begin
  with qrySOHead do
    begin
      close;
      parambyname('Quote').asinteger := tempQuote;
      open;
      result := fieldbyname('Install_Phone').asstring;
    end;
end;

procedure TdtmdlJob.SetSOrderStatus(tempJob: real);
var
  tempSOrder: integer;
  tempStatus: integer;
begin
  with qryGetSO do
    begin
      close;
      parambyname('Job').asfloat := tempJob;
      open;
      tempSOrder := fieldbyname('Sales_order').asinteger;
      if fieldbyname('Sales_Order_Status').asinteger > 60 then
        exit;
    end;

  with qryGetSOLines do
    begin
      close;
      parambyname('Sales_order').asinteger := tempSOrder;
      open;
    end;

  if qryGetSOLines.fieldbyname('total_complete').asinteger = qryGetSOLines.fieldbyname('total_lines').asinteger then
    tempStatus := 60
  else
  if qryGetSOLines.fieldbyname('total_complete').asinteger > 0 then
    tempStatus := 55
  else
  if qryGetSOLines.fieldbyname('total_waiting_fitting').asinteger  = qryGetSOLines.fieldbyname('total_lines').asinteger then
    tempStatus := 53
  else
    tempStatus := 50;

  with qryUpSOStatus do
    begin
      close;
      parambyname('Sales_order').asinteger := tempSOrder;
      parambyname('Sales_order_Status').asinteger := tempStatus;
      execsql;
    end;
end;

function TdtmdlJob.SOOutstandingBalance(tempJob: real): real;
begin
  result := 0;
  with qryGetSO do
    begin
      close;
      parambyname('Job').asfloat := tempJob;
      open;

      result := (SimpleroundTo(fieldbyname('Goods_Value').asfloat, -2) + SimpleroundTo(fieldbyname('VAT_Value').asfloat,-2))
              - (SimpleroundTo(fieldbyname('Deposit_Amount').asfloat,-2));
    end;
end;

function TdtmdlJob.GetNarrative(const iNarrative: integer): string;
var
  Narrative : TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.Data;
  finally
    Narrative.Free;
  end;
end;

procedure TdtmdlJob.SaveNarrative(var iNarrative: Integer;
  const Data: string);
var
  Narrative: TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.Data := Data;
    Narrative.SaveToDB;
    iNarrative := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

{ TJob }

procedure TJob.Clear;
begin
  Customer :=       0;
  CustomerName :=   '';
  JDate :=           0;
  Address :=        0;
  RiskNotes :=      0;
  FJElements.Clear;
  FJCutOuts.Clear;
  FJEdges.Clear;
  FJExtras.Clear;
  FJUpstands.Clear;
  FJEvents.Clear;
  FJRemedials.Clear;
end;

function TJob.Clone: TJob;
begin
  Result := TJob.Create(FDataModule);
  Result.DateRequired :=  self.DateRequired;
  Result.ExtraNotes :=    self.ExtraNotes;
  Result.ActInstallDate:= self.ActInstallDate;
  Result.ActProdDate :=   self.ActProdDate;
  Result.ActTempDate :=   self.ActTempDate;
  Result.Address  :=      self.Address;
  Result.Availability :=  self.Availability;
  Result.Branch :=        self.Branch;
  Result.DesignerID :=    self.DesignerID;
  Result.DiscountRate :=  self.DiscountRate;
  Result.DiscountValue := self.DiscountValue;
  Result.Terms :=         self.Terms;
  Result.Status :=        self.Status;
  Result.StatusDescr :=   self.StatusDescr;
  Result.SurveyPrice:=    self.SurveyPrice;
  Result.Inactive :=      self.Inactive;
  Result.InstallAddress:= self.InstallAddress;
  Result.Reason :=        self.reason;
  Result.DeliveryPrice:=  self.DeliveryPrice;
  Result.DepositTerms :=  self.DepositTerms;
  Result.DepositAmount := self.DepositAmount;
  Result.InstallPrice:=   self.InstallPrice;
  Result.MarkupRate :=    self.MarkupRate;
  Result.MarkupValue  :=  self.MarkupValue;
  Result.Material :=      self.Material;
  Result.MaterialDesc :=  self.MaterialDesc;
  Result.NettPrice:=      self.NettPrice;
  Result.Estimator:=      self.Estimator;
  Result.Fitter :=        self.Fitter;
  Result.FitterName :=    self.FitterName;
  Result.Customer:=       self.Customer;
  Result.CustomerName:=   self.CustomerName;
  Result.CustomerPO:=     self.CustomerPO;
  Result.Description:=    self.Description;
  Result.EstimatorName:=  self.EstimatorName;
  Result.ProductionDate:= self.ProductionDate;
  Result.TemplateDate :=  self.TemplateDate;
  Result.InstallDate :=   self.InstallDate;
  Result.InstallContact :=   self.InstallContact;
  Result.InstallPhone :=  self.InstallPhone;
  Result.ProjectReference := self.ProjectReference;
  Result.Reference:=      self.Reference;
  Result.retail :=        self.Retail;
  Result.ContactName:=    self.ContactName;
  Result.jDate:=          self.jDate;
  Result.Quote :=         self.Quote;
  Result.QuoteNettprice := self.QuoteNettPrice;
  Result.RiskNotes  :=    self.RiskNotes;
  Result.Operator :=      self.Operator;
  Result.OperatorName :=  self.OperatorName;
  Result.Speculative :=   self.Speculative;
  Result.Vat  :=          self.Vat;
  Result.VatRate  :=      self.VatRate;
  Result.WasteValue :=    self.WasteValue;
  Result.FJElements.Free;
  Result.FJElements :=  Self.FJElements.Clone;
  Result.FJUpstands.Free;
  Result.FJUpstands :=  Self.FJUpstands.Clone;
  Result.FJCutOuts.Free;
  Result.FJCutOuts :=  Self.FJCutOuts.Clone;
  Result.FJEdges.Free;
  Result.FJEdges :=  Self.FJEdges.Clone;
  Result.FJExtras.Free;
  Result.FJExtras :=  Self.FJExtras.Clone;
  Result.FJEvents.Free;
  Result.FJEvents :=  Self.FJEvents.Clone;
  Result.FJRemedials.Free;
  Result.FJRemedials :=  Self.FJRemedials.Clone;
end;

constructor TJob.Create(DataModule: TdtmdlJob);
begin
  FDataModule := DataModule;
  FJElements := TJElements.Create(Self);
  FJUpstands := TJUpstands.Create(Self);
  FJCutOuts := TJCutOuts.Create(Self);
  FJEdges := TJEdges.Create(Self);
  FJExtras := TJExtras.Create(Self);
  FJEvents := TJEvents.Create(Self);
  FJRemedials := TJRemedials.Create(Self);
end;

procedure TJob.DeleteFromDB;
begin
  DeleteElements;
  DeleteCutOuts;
  DeleteEdges;
  DeleteExtras;
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job WHERE Job =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJob.DeleteElements;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Element WHERE Job =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJob.DeleteUpstands;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Element WHERE Element_Type = ''U'' and Job =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJob.DeleteCutOuts;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_cutout WHERE Job =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJob.DeleteEdges;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Edge WHERE Job =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJob.DeleteExtras;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Extra WHERE Job =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJob.DeleteRemedials;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Remedial WHERE Job =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

destructor TJob.Destroy;
begin
  FJElements.Free;
  FJCutOuts.Free;
  FJEdges.Free;
  FJExtras.Free;
  FJUpstands.Free;
  FJEvents.Free;
  FJRemedials.Free;
  inherited;
end;

function TJob.GetTotalDiscounted: currency;
begin
  Result := TotalPrice - FDiscountValue + FMarkupValue;
end;

function TJob.GetTotalGross: currency;
begin
  Result := TotalPrice + InstallPrice + SurveyPrice + DeliveryPrice - DiscountValue + MarkupValue + WasteValue;
end;

function TJob.GetTotalPrice: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FjElements.Count) do
    begin
      result := result + FjElements[i].TotalPrice;
    end;

  for i := 0 to Pred(FjUpstands.Count) do
    begin
      result := result + FjUpstands[i].TotalPrice;
    end;

  for i := 0 to Pred(FjCutOuts.Count) do
    begin
      result := result + FjCutOuts[i].TotalPrice;
    end;

  for i := 0 to Pred(FjEdges.Count) do
    begin
      result := result + FjEdges[i].TotalPrice;
    end;

  for i := 0 to Pred(FjExtras.Count) do
    begin
      result := result + FjExtras[i].TotalPrice;
    end ;
end;

function TJob.GetTotalVat: currency;
begin
  Result := TotalPrice * (FVatRate/100);
end;

procedure TJob.LoadFromDB;
begin
  { Load the header record then all lines belonging to the sales invoice }
  Clear;
  with FDataModule.qryJHeader do
  begin
    Close;
    ParamByName('Job').Asfloat := DbKey;
    Open;
    ActProdDate :=    fieldbyname('Production_Date_Actual').asdatetime;
    ActTempDate :=    fieldbyname('Template_Date_Actual').asdatetime;
    ActInstallDate := fieldbyname('Installation_Date_Actual').asdatetime;
    Address :=      fieldbyname('Address').asinteger;
    Branch :=       fieldbyname('Branch_no').asinteger;
    DesignerID :=   fieldbyname('Designer').asinteger;
    Material :=       fieldbyname('Material_type').asinteger;
    MaterialDesc :=   fieldbyname('Material_Description').asstring;
    Availability :=    fieldbyname('Availability').asinteger;
    DateRequired :=    fieldbyname('Date_Required').asdatetime;
    if fieldbyname('Discount_Rate').Asstring = '' then
      DiscountRate  :=  0.00
    else
      DiscountRate  :=  fieldbyname('Discount_Rate').AsFloat;
    DiscountValue := fieldbyname('Discount_Value').asfloat;

    ExtraNotes :=     fieldbyname('Extra_Notes').asinteger;
    Terms :=          fieldbyname('Payment_Terms').asinteger;
    SurveyPrice:=    fieldbyname('Survey_Price').asfloat;
    DeliveryPrice:=  fieldbyname('Delivery_Price').asfloat;
    DepositTerms :=  fieldbyname('Deposit_Terms').asinteger;
    DepositAmount := fieldbyname('Deposit_Amount').asfloat;
    InstallPrice:=   fieldbyname('Installation_Price').asfloat;

    if fieldbyname('Markup_Rate').Asstring = '' then
      MarkupRate  :=  0.00
    else
      MarkupRate  :=  fieldbyname('Markup_Rate').AsFloat;
    MarkupValue := fieldbyname('Markup_Value').asfloat;
    WasteValue := fieldbyname('Waste_Value').asfloat;

    NettPrice:=      fieldbyname('Nett_Price').asfloat;
    Operator :=       fieldbyname('operator').asinteger;
    OperatorName :=   fieldbyname('Operator_Name').asstring;
    Estimator:=      fieldbyname('Operator').asinteger;
    Fitter :=         fieldbyname('Fitter').asinteger;
    Customer:=       fieldbyname('Customer').asinteger;
    CustomerName:=   fieldbyname('Customer_Name').asstring;
    CustomerPO  :=   fieldbyname('Order_Ref_no').asstring;
    Description:=    fieldbyname('Description').asstring;
    EstimatorName:=  fieldbyname('Operator_Name').asstring;
    ProjectReference:=
                     fieldbyname('Project_Reference').asstring;
    Reference:=      fieldbyname('Reference').asstring;
    ContactName:=    fieldbyname('Contact_Name').asstring;
    jDate:=          fieldbyname('Date_Raised').asdatetime;
    Status :=        fieldbyname('Job_Status').asinteger;
    StatusDescr :=   fieldbyname('Status_Description').asstring;
    Inactive :=      fieldbyname('Inactive').asstring;
    ProductionDate:= fieldbyname('Production_Date').asdatetime;
    TemplateDate :=  fieldbyname('Template_Date').asdatetime;
    InstallDate :=   fieldbyname('Installation_Date').asdatetime;
    InstallAddress := fieldbyname('Install_Address').asinteger;
    InstallContact := fieldbyname('Install_Name').asstring;
    InstallPhone :=  fieldbyname('Install_Phone').asstring;
    Quote :=         fieldbyname('Quote').asinteger;
    QuoteNettPrice := fieldbyname('Quote_Nett_Price').asfloat;
    Reason :=        fieldbyname('Inactive_Reason').asinteger;
    RiskNotes :=      fieldbyname('Risk_Notes').asinteger;
    Vat :=           fieldbyname('Vat').asinteger;
    VatRate :=        fieldbyname('Vat_Rate').asfloat;
    Speculative :=    (fieldbyname('Customer_is_Speculative').asString = 'Y');
    Close;
  end;
  LoadElements;
  LoadUpstands;
  LoadCutOuts;
  LoadEdges;
  LoadExtras;
  if (jMode <> jCopy) then
    LoadEvents;
  LoadRemedials;
end;

procedure TJob.SaveStatusToDB;
begin
  with FDataModule.qryJUpStatus do
    begin
      ParamByName('Job').Asfloat := DbKey;
      ParamByName('Job_status').Asinteger := status;
      ParambyName('Installation_Date_Actual').asdatetime := ActInstallDate;
      ExecSQL;
    end;
end;

procedure TJob.SaveToDB(TempAll: boolean);
var
  bNewJob: boolean;
begin
  bNewJob := false;
  if DbKey = 0 then
    begin
      bNewJob := true;
      DbKey := FDataModule.GetNextJNumber;
      with FDataModule.qryJAddHeader do
        begin
          ParamByName('Job').Asfloat := DbKey;
          if (Retail) or (Speculative) then
            ParamByName('Address').asinteger := address
          else
            ParamByName('Address').clear;
          ParambyName('Production_Date_Actual').asdatetime := ActProdDate;
          ParambyName('Template_Date_Actual').asdatetime := ActTempDate;
          ParambyName('Installation_Date_Actual').asdatetime := ActInstallDate;
          ParambyName('Date_Required').asdatetime := self.DateRequired;
          ParamByName('Date_Raised').asdatetime := self.JDate;
          Parambyname('Discount_Rate').asfloat := DiscountRate;
          Parambyname('Discount_Value').AsFloat := DiscountValue;
          ParamByName('Customer').AsInteger := Customer;
          ParamByName('Customer_Name').Asstring := CustomerName;
          ParamByName('Material_type').Asinteger := Material;
          Parambyname('Contact_Name').asstring := ContactName;
          ParamByName('Description').Asstring := Description;
          ParamByName('Operator').AsInteger := Operator;

          if DesignerID = 0 then
            ParamByName('Designer').clear
          else
            ParamByName('Designer').AsInteger := DesignerID;

          if Branch = 0 then
            ParamByName('Branch_no').clear
          else
            ParamByName('Branch_no').AsInteger := Branch;

          Parambyname('Markup_Rate').asfloat := MarkupRate;
          Parambyname('Markup_Value').AsFloat := MarkupValue;
          Parambyname('Waste_Value').AsFloat := WasteValue;

          ParambyName('Installation_Price').asfloat := self.InstallPrice;
          ParamByName('Delivery_Price').Asfloat := self.DeliveryPrice;
          ParamByName('Survey_Price').Asfloat := self.SurveyPrice;
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
          if InstallAddress = 0 then
            ParamByName('Install_address').clear
          else
            ParamByName('Install_Address').Asinteger := InstallAddress;
          if RiskNotes = 0 then
            ParamByName('Risk_Notes').clear
          else
            ParamByName('Risk_Notes').Asinteger := RiskNotes;
          Parambyname('Install_Name').asstring := InstallContact;
          Parambyname('Install_Phone').asstring := InstallPhone;
          ParambyName('Project_Reference').asstring := ProjectReference;
          ParambyName('Reference').asstring := Reference;
          ParambyName('Order_Ref_no').asstring := CustomerPO;
          ParamByName('job_Status').Asinteger := 10;
          ParamByName('Nett_Price').Asfloat := TotalPrice;
          Parambyname('Inactive').asstring := 'N';
          Parambyname('inactive_reason').clear;
          if Fitter = 0 then
            Parambyname('Fitter').clear
          else
            Parambyname('Fitter').asinteger := Fitter;
          Parambyname('vat').asinteger := vat;
          Parambyname('Deposit_Terms').Asfloat := DepositTerms;
          Parambyname('Deposit_Amount').Asfloat := DepositAmount;
          if quote = 0 then
            Parambyname('quote').clear
          else
            Parambyname('Quote').asinteger := Quote;
          ParamByname('Quote_Nett_price').asfloat := QuoteNettPrice;
          ParambyName('Production_Date').asdatetime := ProductionDate;
          ParambyName('Template_Date').asdatetime := TemplateDate;
          ParambyName('Installation_Date').asdatetime := InstallDate;
          ExecSQL;
        end;
      SaveJobNumber;
      dtmdlWorktops.CreateJobDocDirectory(inttostr(dbKey));
    end
  else
  if TempAll then
    begin
      with FDataModule.qryJUpHeader do
        begin
          ParamByName('Job').Asfloat := DbKey;
          if (Retail) or (Speculative) then
            ParamByName('Address').asinteger := address
          else
            ParamByName('Address').clear;
          ParambyName('Production_Date_Actual').asdatetime := ActProdDate;
          ParambyName('Template_Date_Actual').asdatetime := ActTempDate;
          ParambyName('Installation_Date_Actual').asdatetime := ActInstallDate;
          ParambyName('Date_Required').asdatetime := self.DateRequired;
          ParamByName('Date_Raised').asdatetime := self.JDate;
          Parambyname('Discount_Rate').asfloat := DiscountRate;
          Parambyname('Discount_Value').AsFloat := DiscountValue;
          ParamByName('Customer').AsInteger := Customer;
          ParamByName('Customer_Name').Asstring := CustomerName;
          ParamByName('Material_type').Asinteger := Material;
          Parambyname('Contact_Name').asstring := ContactName;
          ParamByName('Description').Asstring := Description;
          ParamByName('Operator').AsInteger := Operator;

          if DesignerID = 0 then
            ParamByName('Designer').clear
          else
            ParamByName('Designer').AsInteger := DesignerID;

          if Branch = 0 then
            ParamByName('Branch_no').clear
          else
            ParamByName('Branch_no').AsInteger := Branch;

          Parambyname('MArkup_Rate').asfloat := MarkupRate;
          Parambyname('MArkup_Value').AsFloat := MarkupValue;
          Parambyname('Waste_Value').AsFloat := WasteValue;

          ParambyName('Installation_Price').asfloat := self.InstallPrice;
          ParamByName('Delivery_Price').Asfloat := self.DeliveryPrice;
          ParamByName('Survey_Price').Asfloat := self.SurveyPrice;
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
          if InstallAddress = 0 then
            ParamByName('Install_address').clear
          else
            ParamByName('Install_Address').Asinteger := InstallAddress;
          if RiskNotes = 0 then
            ParamByName('Risk_Notes').clear
          else
            ParamByName('Risk_Notes').Asinteger := RiskNotes;
          Parambyname('Install_Name').asstring := InstallContact;
          Parambyname('Install_Phone').asstring := InstallPhone;
          ParambyName('Project_Reference').asstring := ProjectReference;
          ParambyName('Reference').asstring := Reference;
          ParambyName('Order_Ref_no').asstring := CustomerPO;
          ParamByName('Job_Status').Asinteger := Status;
          ParamByName('Nett_Price').Asfloat := TotalPrice;
          Parambyname('Inactive').asstring := inactive;
          Parambyname('vat').asinteger := vat;
          if Fitter = 0 then
            Parambyname('Fitter').clear
          else
            Parambyname('Fitter').asinteger := Fitter;
          Parambyname('Deposit_Terms').Asfloat := DepositTerms;
          Parambyname('Deposit_Amount').Asfloat := DepositAmount;
          if reason = 0 then
            Parambyname('inactive_reason').clear
          else
            Parambyname('inactive_reason').asinteger := self.Reason;
          if quote = 0 then
            Parambyname('quote').clear
          else
            Parambyname('Quote').asinteger := Quote;
          ParamByname('Quote_Nett_price').asfloat := QuoteNettPrice;
          ParambyName('Production_Date').asdatetime := ProductionDate;
          ParambyName('Template_Date').asdatetime := TemplateDate;
          ParambyName('Installation_Date').asdatetime := InstallDate;
          ExecSQL;
        end
    end;
  if not Retail and not Speculative and (address <> 0) then
    DataModule.DeleteAddress(Address);

  SaveElements;
  SaveUpstands;
  SaveCutOuts;
  SaveEdges;
  SaveExtras;
  SaveEvents;
  SaveRemedials;
end;

procedure TJob.SaveElements;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteElements;  { Get rid of any already in database }
  FJElements.Renumber;
  for i := 0 to Pred(FJElements.Count) do
    begin
      FJElements[i].SaveToDB;
    end;
end;

procedure TJob.SaveUpstands;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteUpstands;  { Get rid of any already in database }
  FJUpstands.Renumber;
  for i := 0 to Pred(FJUpstands.Count) do
    begin
      FJUpstands[i].SaveToDB;
    end;
end;

procedure TJob.SaveCutOuts;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteCutOuts;  { Get rid of any already in database }
  FJCutOuts.Renumber;
  for i := 0 to Pred(FJCutOuts.Count) do
    begin
      FJCutOuts[i].SaveToDB;
    end;
end;

procedure TJob.SaveEdges;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteEdges;  { Get rid of any already in database }
  FJEdges.Renumber;
  for i := 0 to Pred(FJEdges.Count) do
    begin
      FJEdges[i].SaveToDB;
    end;
end;

procedure TJob.SaveExtras;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteExtras;  { Get rid of any already in database }
  FJExtras.Renumber;
  for i := 0 to Pred(FJExtras.Count) do
    begin
      FJExtras[i].SaveToDB;
    end;
end;

procedure TJob.SaveRemedials;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteRemedials;  { Get rid of any already in database }
  FJRemedials.Renumber;
  for i := 0 to Pred(FJRemedials.Count) do
    begin
      FJRemedials[i].SaveToDB;
    end;
end;

procedure TJob.SetAddress(const Value: integer);
begin
  FAddress := Value;
end;

procedure TJob.SetAvailability(const Value: integer);
begin
  FAvailability := Value;
end;

procedure TJob.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TJob.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TJob.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TJob.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TJob.SetdbKey(const Value: integer);
begin
  FdbKey := Value;
end;

procedure TJob.SetDeliveryPrice(const Value: currency);
begin
  FDeliveryPrice := Value;
end;

procedure TJob.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TJob.SetDiscountRate(const Value: double);
begin
  FDiscountRate := Value;
end;

procedure TJob.SetDiscountValue(const Value: currency);
begin
  FDiscountValue := Value;
end;

procedure TJob.SetEstimator(const Value: integer);
begin
  FEstimator := Value;
end;

procedure TJob.SetEstimatorName(const Value: string);
begin
  FEstimatorName := Value;
end;

procedure TJob.SetExtraNotes(const Value: integer);
begin
  FExtraNotes := Value;
end;

procedure TJob.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TJob.SetInstallPrice(const Value: currency);
begin
  FInstallPrice := Value;
end;

procedure TJob.SetJDate(const Value: TDateTime);
begin
  FJDate := Value;
end;

procedure TJob.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TJob.SetMaterialDesc(const Value: string);
begin
  FMaterialDesc := Value;
end;

procedure TJob.SetNettPrice(const Value: currency);
begin
  FNettPrice := Value;
end;

procedure TJob.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TJob.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TJob.SetReason(const Value: integer);
begin
  FReason := Value;
end;

procedure TJob.SetReference(const Value: string);
begin
  FReference := Value;
end;

procedure TJob.SetRetail(const Value: bytebool);
begin
  FRetail := Value;
end;

procedure TJob.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TJob.SetStatusDescr(const Value: string);
begin
  FStatusDescr := Value;
end;

procedure TJob.SetSurveyPrice(const Value: currency);
begin
  FSurveyPrice := Value;
end;

procedure TJob.SetTerms(const Value: integer);
begin
  FTerms := Value;
end;

procedure TJob.SetVat(const Value: integer);
begin
  FVat := Value;
end;

procedure TJob.SetVatRate(const Value: real);
begin
  FVatRate := Value;
end;

procedure TJob.LoadElements;
var
  aElement : TJElement;
begin
  FJElements.Clear;
  with FDataModule.qryJAllElements do
  begin
    Close;
    ParamByName('Job').Asfloat := DbKey;
    Open;
    while not(EOF) do
    begin
      aElement := TJElement.Create(Self);
      aElement.JENumber := FieldByName('Element_Number').AsInteger;
      aElement.Material := FieldByName('Material_Type').AsInteger;
      aElement.MaterialDescr := FieldByName('Material_Description').Asstring;
      aElement.ElementType := FieldByName('Element_Type').Asstring;
      aElement.ElementDescription := FieldByName('Element_Description').Asstring;
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
      FJElements.Add(aElement);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.LoadUpstands;
var
  aUpstand : TJUpstand;
begin
  FJUpstands.Clear;
  with FDataModule.qryJAllUpstands do
  begin
    Close;
    ParamByName('Job').Asfloat := DbKey;
    Open;
    while not(EOF) do
    begin
      aUpstand := TJUpstand.Create(Self);
      aUpstand.JENumber := FieldByName('Element_Number').AsInteger;
      aUpstand.Material := FieldByName('Material_Type').AsInteger;
      aUpstand.MaterialDescr := FieldByName('Material_Description').Asstring;
      aUpstand.ElementType := FieldByName('Element_Type').Asstring;
      aUpstand.Depth := FieldByName('Depth').asfloat;
      aUpstand.Length := FieldByName('Length').asinteger;
      aUpstand.Quantity := FieldByName('Quantity').asfloat;
      aUpstand.thickness := FieldByName('thickness').asinteger;
      aUpstand.thicknessDesc := FieldByName('thickness_mm').asstring;
      aUpstand.UnitPrice := FieldByName('Unit_Price').asfloat;
      aUpstand.PolishPrice := FieldByName('Upstand_Polish_Price').asfloat;
      aUpstand.PriceUnit := FieldByName('Price_unit').asinteger;
      aUpstand.Worktop := FieldByName('worktop').asinteger;
      aUpstand.worktopDesc := FieldByName('worktop_Description').asstring;
      aUpstand.MaterialUse := FieldByName('Material_Use').AsInteger;
      aUpstand.MaterialUseDescr := FieldByName('Use_Description').Asstring;
      aUpstand.NoOfDepths := FieldByName('No_of_Polished_Depths').asinteger;
      aUpstand.NoOfLengths := FieldByName('No_of_Polished_Lengths').asinteger;
      if fieldbyname('Total_Upstand_Pieces').Asinteger = 0 then
        aUpstand.TotalUpstandPieces := 1
      else
        aUpstand.TotalUpstandPieces := fieldbyname('Total_Upstand_Pieces').Asinteger;
      FJUpstands.Add(aUpstand);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.LoadCutOuts;
var
  aCutOut : TJCutOut;
begin
  FJCutOuts.Clear;
  with FDataModule.qryJAllCutOuts do
  begin
    Close;
    ParamByName('Job').Asfloat := DbKey;
    Open;
    while not(EOF) do
    begin
      aCutOut := TJCutOut.Create(Self);
      aCutOut.jCONumber := FieldByName('Cutout_Number').AsInteger;
      aCutOut.CutOut := FieldByName('Cutout').AsInteger;
      aCutOut.CutoutDesc := FieldByName('CutOut_Description').Asstring;
      aCutOut.Material := FieldByName('Material_Type').AsInteger;
      aCutOut.MaterialDescr := FieldByName('Material_Description').Asstring;
      aCutOut.Quantity := FieldByName('Quantity').asfloat;
      aCutOut.EdgeType := FieldByName('Edge_Type').asinteger;
      aCutOut.EdgeTypeDesc := FieldByName('Edge_Type_Description').asstring;
      aCutOut.UnitPrice := FieldByName('Unit_Price').asfloat;
      aCutOut.PriceUnit := FieldByName('Price_unit').asinteger;
      aCutOut.PriceUnitDesc := '';
      FJCutOuts.Add(aCutOut);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.LoadEdges;
var
  aEdge : TJEdge;
begin
  FJEdges.Clear;
  with FDataModule.qryJAllEdges do
  begin
    Close;
    ParamByName('Job').Asfloat := DbKey;
    Open;
    while not(EOF) do
    begin
      aEdge := TJEdge.Create(Self);

      aEdge.jEdgNumber := FieldByName('Edge_Number').AsInteger;
      aEdge.Edge := FieldByName('Edge_Profile').Asinteger;
      aEdge.EdgeDesc := FieldByName('Edge_Description').Asstring;
      aEdge.Material := FieldByName('Material_Type').AsInteger;
      aEdge.MaterialDescr := FieldByName('Material_Description').Asstring;
      aEdge.Length := FieldByName('Length').asinteger;
      aEdge.EdgeType := FieldByName('Edge_Type').asinteger;
      aEdge.EdgeTypeDesc := FieldByName('Edge_Type_Description').asstring;
      aEdge.UnitPrice := FieldByName('Unit_Price').asfloat;
      aEdge.PriceUnit := FieldByName('Price_unit').asinteger;
      aEdge.PriceUnitDesc := '';

      FJEdges.Add(aEdge);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.LoadExtras;
var
  aExtra : TJExtra;
begin
  FJExtras.Clear;
  with FDataModule.qryJAllExtras do
  begin
    Close;
    ParamByName('Job').Asfloat := DbKey;
    Open;
    while not(EOF) do
    begin
      aExtra := TJExtra.Create(Self);
      aExtra.JExNumber := FieldByName('Extra_No').AsInteger;
      aExtra.DoNotDiscount := (FieldByName('Do_Not_Discount').asstring = 'Y');
      aExtra.Extra := FieldByName('Extra_Charge').AsInteger;
      aExtra.ExtraDesc := FieldByName('Description').Asstring;
      aExtra.Quantity := FieldByName('Quantity').asfloat;
      aExtra.UnitPrice := FieldByName('Unit_Price').asfloat;
      aExtra.PriceUnit := FieldByName('Price_unit').asinteger;
      aExtra.PriceUnitDesc := '';

      FJExtras.Add(aExtra);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.LoadRemedials;
var
  aRemedial : TJRemedial;
begin
  FJRemedials.Clear;
  with FDataModule.qryJAllRemedials do
  begin
    Close;
    ParamByName('Job').Asfloat := DbKey;
    Open;
    while not(EOF) do
    begin
      aRemedial := TJRemedial.Create(Self);

(*      aRemedial.RemedialNumber := FieldByName('Remedial_Number').AsInteger;
      aRemedial.Fitter := FieldByName('Fitter').Asinteger;
      aRemedial.FitterName := fieldbyname('Fitter_Name').asstring;
      aRemedial.Narrative.dbkey := fieldbyname('Notes').asinteger;
      aRemedial.Narrative.LoadFromDB;

      aRemedial.MaterialsRequired := fieldbyname('Material_Required').asstring;
      aRemedial.Price := fieldbyname('Installation_Price').asfloat;
      aRemedial.InstallDate := fieldbyname('Installation_Date').asdatetime;
      aRemedial.DateRaised := fieldbyname('Date_Raised').asdatetime;
      aRemedial.Completed := fieldbyname('Completed').asstring;
      aRemedial.Operator := FieldByName('Operator').Asinteger;
      aRemedial.OperatorName := fieldbyname('Operator_Name').asstring;
*)

      aRemedial.RemedialNumber := FieldByName('Remedial_Number').AsInteger;
      aRemedial.AdditionalNotes := fieldbyname('Additional_Notes').asinteger;
      aRemedial.AdditionalNotesText := dtmdlJob.getNarrative(aRemedial.AdditionalNotes);
      aRemedial.Customer  := fieldbyname('Customer').asinteger;
      aRemedial.Completed := fieldbyname('Completed').asstring;
      aRemedial.DateRaised := fieldbyname('Date_Raised').asdatetime;
      aRemedial.Fitter := fieldbyname('Fitter').asinteger;
      aRemedial.FitterName := fieldbyname('Fitter_Name').asstring;
      aRemedial.InstallDate := fieldbyname('Installation_Date').asdatetime;
      aRemedial.ItemsStillOnSite := fieldbyname('Items_Still_On_Site').asstring;
      aRemedial.ItemsToReturnToSite := fieldbyname('Items_To_Return_To_Site').asstring;
      aRemedial.Narrative.dbkey := FieldbyName('Notes').AsInteger;
      aRemedial.Narrative.LoadFromDB;

      aRemedial.ManufacturingNotes := FieldbyName('Manufacturing_Notes').AsInteger;
      aRemedial.ManufacturingNotesText := dtmdlJob.getNarrative(aRemedial.ManufacturingNotes);
      aRemedial.MaterialsRequired := fieldbyname('Material_Required').asstring;

      aRemedial.OfficeNotes := FieldbyName('Office_Notes').AsInteger;
      aRemedial.OfficeNotesText := dtmdlJob.getNarrative(aRemedial.OfficeNotes);

      aRemedial.Operator := fieldbyname('Operator').AsInteger;
      aRemedial.OperatorName := fieldbyname('Operator_Name').asstring;
      aRemedial.OriginalFitter := fieldbyname('Original_Fitter').asinteger;
      aRemedial.OriginalTemplater := fieldbyname('Original_Templater').asinteger;
      aRemedial.Price := fieldbyname('Installation_Price').asfloat;

      aRemedial.ProductionRequired := fieldbyname('Production_Required').asstring;
      aRemedial.RemedialID := fieldbyname('Remedial').asinteger;
      aRemedial.RemedialType := fieldbyname('Remedial_Type').asinteger;
      aRemedial.RemedialDept := fieldbyname('Remedial_Dept').asinteger;
      aRemedial.RemedialCategory := fieldbyname('Remedial_Category').asinteger;
      aRemedial.SiteRequirements := fieldbyname('Site_Requirements').asstring;
      aRemedial.ToolsRequired := fieldbyname('Tools_Required').asstring;
      FJRemedials.Add(aRemedial);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.SaveJobNumber;
begin
  with datamodule.qryUpCompany do
    begin
      close;
      parambyname('Last_Job_number').asinteger := dbKey;
      execsql;
    end;
end;

procedure TJob.SetCustomerPO(const Value: string);
begin
  FCustomerPO := Value;
end;

procedure TJob.LoadFromSalesOrder;
begin
  { Load the header record then all lines belonging to the sales invoice }
  Clear;
  with FDataModule.qryQHeader do
  begin
    Close;
    ParamByName('Quote').AsInteger := FDataModule.QuoteNo;
    Open;
    ActProdDate :=    date;
    ActTempDate :=    date;
    ActInstallDate := date;
    Address :=        fieldbyname('Address').asinteger;
    Branch :=       fieldbyname('Branch_no').asinteger;
    DesignerID :=   fieldbyname('Designer').asinteger;
    Material :=       fieldbyname('Material_type').asinteger;
    MaterialDesc :=   fieldbyname('Material_Description').asstring;
    Availability :=    fieldbyname('Availability').asinteger;
    DateRequired :=    fieldbyname('Date_Required').asdatetime;
    if fieldbyname('Discount_Rate').Asstring = '' then
      DiscountRate  :=  0.00
    else
      DiscountRate  :=  fieldbyname('Discount_Rate').AsFloat;
    DiscountValue := fieldbyname('Discount_Value').asfloat;
    DepositTerms :=  fieldbyname('Deposit_Terms').asinteger;
    DepositAmount := fieldbyname('Deposit_Amount').asfloat;
    ExtraNotes :=     fieldbyname('Extra_Notes').asinteger;
    Terms :=          fieldbyname('Payment_Terms').asinteger;
    SurveyPrice:=    fieldbyname('Survey_Price').asfloat;
    DeliveryPrice:=  fieldbyname('Delivery_Price').asfloat;
    InstallAddress:=  Datamodule.GetInstallAddress(FDataModule.QuoteNo);
    if installaddress = 0 then
      InstallAddress:=  fieldbyname('Install_Address').asinteger;
    InstallContact := Datamodule.GetInstallName(FDataModule.QuoteNo);
    InstallPhone :=   Datamodule.GetInstallPhone(FDataModule.QuoteNo);
    InstallPrice:=   fieldbyname('Installation_Price').asfloat;

    if fieldbyname('Markup_Rate').Asstring = '' then
      MarkupRate  :=  0.00
    else
      MarkupRate  :=  fieldbyname('Markup_Rate').AsFloat;
    MarkupValue := fieldbyname('Markup_Value').asfloat;
    WasteValue := fieldbyname('Waste_Value').asfloat;

    NettPrice:=      fieldbyname('Nett_Price').asfloat;
    QuoteNettPrice := fieldbyname('Nett_Price').asfloat;
    Operator :=       fieldbyname('operator').asinteger;
    OperatorName :=   fieldbyname('Operator_Name').asstring;
    Estimator:=      fieldbyname('Operator').asinteger;
    Customer:=       fieldbyname('Customer').asinteger;
    CustomerName:=   fieldbyname('Customer_Name').asstring;
    CustomerPO  :=   Datamodule.GetCustomerPO(FDataModule.QuoteNo);
    Description:=    fieldbyname('Description').asstring;
    EstimatorName:=  fieldbyname('Operator_Name').asstring;
    ProjectReference:=
                     fieldbyname('Reference').asstring;
    Reference:=      fieldbyname('Reference').asstring;
    ContactName:=    fieldbyname('Contact_Name').asstring;
    JDate:=          date;
    Status :=        fieldbyname('Quote_Status').asinteger;
    StatusDescr :=   fieldbyname('Status_Description').asstring;
    Inactive :=      fieldbyname('Inactive').asstring;
    ProductionDate:= date;
    TemplateDate :=  Datamodule.GetTemplateDate(FDataModule.QuoteNo);

    if frmWTMain.bEndUser then
      InstallDate := fieldbyname('Date_Required').asdatetime
    else
      InstallDate :=   Datamodule.GetInstallDate(FDataModule.QuoteNo);

    Vat :=           fieldbyname('Vat').asinteger;
    VatRate :=        fieldbyname('Vat_Rate').asfloat;
    Quote :=         FDataModule.QuoteNo;
    Reason :=        fieldbyname('Inactive_Reason').asinteger;
    Speculative :=    (fieldbyname('Customer_is_Speculative').asString = 'Y');
    Close;
  end;
end;

procedure TJob.LoadFromQuote;
begin
  { Load the header record then all lines belonging to the sales invoice }
  Clear;
  with FDataModule.qryQHeader do
  begin
    Close;
    ParamByName('Quote').AsInteger := FDataModule.QuoteNo;
    Open;
    ActProdDate :=    date;
    ActTempDate :=    date;
    ActInstallDate := date;
    Address :=        fieldbyname('Address').asinteger;
    Branch :=       fieldbyname('Branch_no').asinteger;
    DesignerID :=   fieldbyname('Designer').asinteger;
    Material :=       fieldbyname('Material_type').asinteger;
    MaterialDesc :=   fieldbyname('Material_Description').asstring;
    Availability :=    fieldbyname('Availability').asinteger;
    DateRequired :=    fieldbyname('Date_Required').asdatetime;
    if fieldbyname('Discount_Rate').Asstring = '' then
      DiscountRate  :=  0.00
    else
      DiscountRate  :=  fieldbyname('Discount_Rate').AsFloat;
    DiscountValue := fieldbyname('Discount_Value').asfloat;
    DepositTerms :=  fieldbyname('Deposit_Terms').asinteger;
    DepositAmount := fieldbyname('Deposit_Amount').asfloat;

    ExtraNotes :=     fieldbyname('Sales_Order_Notes').asinteger;

    Terms :=          fieldbyname('Payment_Terms').asinteger;
    SurveyPrice:=    fieldbyname('Survey_Price').asfloat;
    DeliveryPrice:=  fieldbyname('Delivery_Price').asfloat;
    InstallAddress:=  Datamodule.GetInstallAddress(FDataModule.QuoteNo);
    if installaddress = 0 then
      InstallAddress:=  fieldbyname('Install_Address').asinteger;
    InstallContact := Datamodule.GetInstallName(FDataModule.QuoteNo);
    InstallPhone :=   Datamodule.GetInstallPhone(FDataModule.QuoteNo);
    InstallPrice:=   fieldbyname('Installation_Price').asfloat;

    if fieldbyname('Markup_Rate').Asstring = '' then
      MarkupRate  :=  0.00
    else
      MarkupRate  :=  fieldbyname('Markup_Rate').AsFloat;
    MarkupValue := fieldbyname('Markup_Value').asfloat;
    WasteValue := fieldbyname('Waste_Value').asfloat;

    NettPrice:=      fieldbyname('Nett_Price').asfloat;
    QuoteNettPrice := fieldbyname('Nett_Price').asfloat;
    Operator :=       fieldbyname('operator').asinteger;
    OperatorName :=   fieldbyname('Operator_Name').asstring;
    Estimator:=      fieldbyname('Operator').asinteger;
    Customer:=       fieldbyname('Customer').asinteger;
    CustomerName:=   fieldbyname('Customer_Name').asstring;
    CustomerPO  :=   Datamodule.GetCustomerPO(FDataModule.QuoteNo);
    Description:=    fieldbyname('Description').asstring;
    EstimatorName:=  fieldbyname('Operator_Name').asstring;
    ProjectReference:=
                     fieldbyname('Project_Reference').asstring;
    Reference:=      fieldbyname('Reference').asstring;
    ContactName:=    fieldbyname('Contact_Name').asstring;
    JDate:=          date;
    Status :=        fieldbyname('Quote_Status').asinteger;
    StatusDescr :=   fieldbyname('Status_Description').asstring;
    Inactive :=      fieldbyname('Inactive').asstring;
    ProductionDate:= date;
    TemplateDate :=  Datamodule.GetTemplateDate(FDataModule.QuoteNo);

    if frmWTMain.bEndUser then
      InstallDate := fieldbyname('Date_Required').asdatetime
    else
      InstallDate :=   Datamodule.GetInstallDate(FDataModule.QuoteNo);

    Vat :=           fieldbyname('Vat').asinteger;
    VatRate :=        fieldbyname('Vat_Rate').asfloat;
    Quote :=         FDataModule.QuoteNo;
    Reason :=        fieldbyname('Inactive_Reason').asinteger;

    Retail :=    (fieldbyname('Is_Retail_Customer').asString = 'Y');
    Speculative :=    (fieldbyname('Customer_is_Speculative').asString = 'Y');
    Close;
  end;
  LoadQElements;
  LoadQUpstands;
  LoadQCutOuts;
  LoadQEdges;
  LoadQExtras;
end;

procedure TJob.LoadQElements;
var
  aElement : TJElement;
begin
  FJElements.Clear;
  with FDataModule.qryQAllElements do
  begin
    Close;
    ParamByName('Quote').AsInteger := FDataModule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      aElement := TJElement.Create(Self);
      aElement.JENumber := FieldByName('Element_Number').AsInteger;
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
      FJElements.Add(aElement);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.LoadQUpstands;
var
  aUpstand : TJUpstand;
begin
  FJUpstands.Clear;
  with FDataModule.qryQAllUpstands do
  begin
    Close;
    ParamByName('Quote').AsInteger := FDataModule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      aUpstand := TJUpstand.Create(Self);
      aUpstand.JENumber := FieldByName('Element_Number').AsInteger;
      aUpstand.Material := FieldByName('Material_Type').AsInteger;
      aUpstand.MaterialDescr := FieldByName('Material_Description').Asstring;
      aUpstand.ElementType := FieldByName('Element_Type').Asstring;
      aUpstand.Depth := FieldByName('Depth').asfloat;
      aUpstand.Length := FieldByName('Length').asinteger;
      aUpstand.Quantity := FieldByName('Quantity').asfloat;
      aUpstand.thickness := FieldByName('thickness').asinteger;
      aUpstand.thicknessDesc := FieldByName('thickness_mm').asstring;
      aUpstand.UnitPrice := FieldByName('Unit_Price').asfloat;
      aUpstand.PolishPrice := FieldByName('Upstand_Polish_Price').asfloat;
      aUpstand.PriceUnit := FieldByName('Price_unit').asinteger;
      aUpstand.Worktop := FieldByName('worktop').asinteger;
      aUpstand.worktopDesc := FieldByName('worktop_Description').asstring;
      aUpstand.MaterialUse := FieldByName('Material_Use').AsInteger;
      aUpstand.MaterialUseDescr := FieldByName('Use_Description').Asstring;
      aUpstand.NoOfDepths := FieldByName('No_of_Polished_Depths').asinteger;
      aUpstand.NoOfLengths := FieldByName('No_of_Polished_Lengths').asinteger;
      if fieldbyname('Total_Upstand_Pieces').Asinteger = 0 then
        aUpstand.TotalUpstandPieces := 1
      else
        aUpstand.TotalUpstandPieces := fieldbyname('Total_Upstand_Pieces').Asinteger;
      FJUpstands.Add(aUpstand);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.LoadQCutOuts;
var
  aCutOut : TJCutOut;
begin
  FJCutOuts.Clear;
  with FDataModule.qryQAllCutOuts do
  begin
    Close;
    ParamByName('Quote').AsInteger := FDataModule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      aCutOut := TJCutOut.Create(Self);
      aCutOut.JCONumber := FieldByName('Cutout_Number').AsInteger;
      aCutOut.CutOut := FieldByName('Cutout').AsInteger;
      aCutOut.CutoutDesc := FieldByName('CutOut_Description').Asstring;
      aCutOut.Material := FieldByName('Material_Type').AsInteger;
      aCutOut.MaterialDescr := FieldByName('Material_Description').Asstring;
      aCutOut.Quantity := FieldByName('Quantity').asfloat;
      aCutOut.EdgeType := FieldByName('Edge_Type').asinteger;
      aCutOut.EdgeTypeDesc := FieldByName('Edge_Type_Description').asstring;
      aCutOut.UnitPrice := FieldByName('Unit_Price').asfloat;
      aCutOut.PriceUnit := FieldByName('Price_unit').asinteger;
      aCutOut.PriceUnitDesc := '';
      FJCutOuts.Add(aCutOut);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.LoadQEdges;
var
  aEdge : TJEdge;
begin
  FJEdges.Clear;
  with FDataModule.qryQAllEdges do
  begin
    Close;
    ParamByName('Quote').AsInteger := FDataModule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      aEdge := TJEdge.Create(Self);

      aEdge.jEdgNumber := FieldByName('Edge_Number').AsInteger;
      aEdge.Edge := FieldByName('Edge_Profile').Asinteger;
      aEdge.EdgeDesc := FieldByName('Edge_Description').Asstring;
      aEdge.Material := FieldByName('Material_Type').AsInteger;
      aEdge.MaterialDescr := FieldByName('Material_Description').Asstring;
      aEdge.Length := FieldByName('Length').asinteger;
      aEdge.EdgeType := FieldByName('Edge_Type').asinteger;
      aEdge.EdgeTypeDesc := FieldByName('Edge_Type_Description').asstring;
      aEdge.UnitPrice := FieldByName('Unit_Price').asfloat;
      aEdge.PriceUnit := FieldByName('Price_unit').asinteger;
      aEdge.PriceUnitDesc := '';

      FJEdges.Add(aEdge);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.LoadQExtras;
var
  aExtra : TJExtra;
begin
  FJExtras.Clear;
  with FDataModule.qryQAllExtras do
  begin
    Close;
    ParamByName('Quote').AsInteger := FDataModule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      aExtra := TJExtra.Create(Self);
      aExtra.JExNumber := FieldByName('Extra_No').AsInteger;
      aExtra.DoNotDiscount := (FieldByName('Do_Not_Discount').Asstring = 'Y');
      aExtra.Extra := FieldByName('Extra_Charge').AsInteger;
      aExtra.ExtraDesc := FieldByName('Description').Asstring;
      aExtra.Quantity := FieldByName('Quantity').asfloat;
      aExtra.UnitPrice := FieldByName('Unit_Price').asfloat;
      aExtra.PriceUnit := FieldByName('Price_unit').asinteger;
      aExtra.PriceUnitDesc := '';

      FJExtras.Add(aExtra);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.SetActInstallDate(const Value: TDateTime);
begin
  FActInstallDate := Value;
end;

procedure TJob.SetActProdDate(const Value: TDateTime);
begin
  FActProdDate := Value;
end;

procedure TJob.SetActTempDate(const Value: TDateTime);
begin
  FActTempDate := Value;
end;

procedure TJob.SetInstallDate(const Value: TDateTime);
begin
  FInstallDate := Value;
end;

procedure TJob.SetProductionDate(const Value: TDateTime);
begin
  FProductionDate := Value;
end;

procedure TJob.SetQuote(const Value: integer);
begin
  FQuote := Value;
end;

procedure TJob.SetTemplateDate(const Value: TDateTime);
begin
  FTemplateDate := Value;
end;

procedure TJob.DeleteEvents;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM job_internal_Note WHERE job =' + IntToStr(DbKey));
    ExecSQL;
  end;

end;

procedure TJob.LoadEvents;
var
  aEvent : TJEvent;
begin
  FJEvents.Clear;
  with FDataModule.qryJAllEvents do
  begin
    Close;
    ParamByName('Job').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aEvent := TJEvent.Create(Self);
      aEvent.EventNumber := FieldByName('Internal_Note').AsInteger;
      aEvent.DateEntered := FieldByName('Date_Time_Entered').Asdatetime;
      aEvent.Operator := FieldByName('Operator').Asinteger;
      aEvent.OperatorName := FieldByName('Operator_Name').asstring;
      aEvent.Narrative.dbKey := FieldByName('Narrative').asinteger;
      aEvent.Narrative.LoadFromDB;

      FJEvents.Add(aEvent);
      Next;
    end;
    Close;
  end;
end;

procedure TJob.SaveEvents;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteEvents;  { Get rid of any already in database }
  FJEvents.Renumber;
  for i := 0 to Pred(FJEvents.Count) do
    begin
      FJEvents[i].SaveToDB;
    end;

end;

function TJob.GetCurrentStatus: integer;
begin
  if FStatus = 50 then
    Result := 50
  else
  if FActInstallDate <> 0 then
    Result := 40
  else
  if FActProdDate <> 0 then
    Result := 30
  else
  if FActTempDate <> 0 then
    Result := 20
  else
    Result := 10
end;

procedure TJob.SetInstallAddress(const Value: integer);
begin
  FInstallAddress := Value;
end;

procedure TJob.SetDepositAmount(const Value: currency);
begin
  FDepositAmount := Value;
end;

procedure TJob.SetDepositTerms(const Value: double);
begin
  FDepositTerms := Value;
end;

procedure TJob.SetQuoteNettPrice(const Value: currency);
begin
  FQuoteNettPrice := Value;
end;

procedure TJob.SetFitter(const Value: integer);
begin
  FFitter := Value;
end;

procedure TJob.SetFitterName(const Value: string);
begin
  FFitterName := Value;
end;

procedure TJob.SetInstallContact(const Value: string);
begin
  FInstallContact := Value;
end;

procedure TJob.SetInstallPhone(const Value: string);
begin
  FInstallPhone := Value;
end;

procedure TJob.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TJob.SetDesignerID(const Value: integer);
begin
  FDesignerID := Value;
end;

procedure TJob.SetRiskNotes(const Value: integer);
begin
  FRiskNotes := Value;
end;

procedure TJob.MoveSalesDocuments;
var
  sSource, sDest: string;
  i: integer;
  SearchRec: TSearchRec;
begin

  sSource := dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(self.datamodule.SalesOrder) + '\' ;
  sDest :=  dtmdlWorktops.GetCompanyJobDirectory + '\' + inttostr(dbkey) + '\' ;

  i := FindFirst(sSource + '*.*', faArchive, SearchRec);
  while i = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
          (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          //copy the file
          filecopy(sSource+SearchRec.Name, sDest+SearchRec.Name);
        end;
      i := FindNext(SearchRec);
    end;
end;

procedure TJob.SetMarkupRate(const Value: double);
begin
  FMarkupRate := Value;
end;

procedure TJob.SetMarkupValue(const Value: currency);
begin
  FMarkupValue := Value;
end;

procedure TJob.SetJMode(const Value: TJMode);
begin
  FJMode := Value;
end;

procedure TJob.SetWasteValue(const Value: currency);
begin
  FWasteValue := Value;
end;

procedure TJob.SetProjectReference(const Value: string);
begin
  FProjectReference := Value;
end;

procedure TJob.SetSpeculative(const Value: boolean);
begin
  FSpeculative := Value;
end;

function TJob.GetTotalDiscountablePrice: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FjElements.Count) do
    begin
      result := result + FjElements[i].TotalPrice;
    end;

  for i := 0 to Pred(FjUpstands.Count) do
    begin
      result := result + FjUpstands[i].TotalPrice;
    end;

  for i := 0 to Pred(FjCutOuts.Count) do
    begin
      result := result + FjCutOuts[i].TotalPrice;
    end;

  for i := 0 to Pred(FjEdges.Count) do
    begin
      result := result + FjEdges[i].TotalPrice;
    end;

  for i := 0 to Pred(FjExtras.Count) do
    begin
      if not FJExtras[i].DoNotDiscount then
        result := result + FJExtras[i].TotalPrice;
    end ;
end;

{ TJElement }

function TJElement.Clone: TJElement;
begin
  Result := TJElement.Create(FParent);
  Result.ElementDescription
                        :=           self.ElementDescription;
  Result.ElementType    :=           Self.ElementType;
  Result.Material       :=           Self.Material;
  Result.MaterialDescr  :=           Self.MaterialDescr;
  Result.MaterialUse    :=           self.MaterialUse;
  Result.MaterialUseDescr :=         self.MaterialUseDescr;
  Result.Depth          :=           Self.Depth;
  Result.Length         :=           Self.Length;
  Result.jENumber       :=           Self.JENumber;
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

constructor TJElement.Create(Job: TJob);
begin
  FParent := Job;
end;

destructor TJElement.Destroy;
begin
  inherited;
end;

function TJElement.GetTotalPrice: currency;
begin
  Result := ((fDepth * FLength)/1000000) * FQuantity * FUnitPrice;
end;

procedure TJElement.LoadFromDB;
begin
  with FParent.FDataModule.qryJElement do
  begin
    Close;
    ParamByName('Job').AsInteger := FParent.DbKey;
    ParamByName('Element_Number').AsInteger := jENumber;
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
    Close;
  end;
end;

procedure TJElement.SaveToDB;
begin
  with FParent.FDataModule.qryJAddElement do
  begin
    ParamByName('Job').Asfloat := FParent.DbKey;
    ParamByName('Element_Description').Asstring := ElementDescription;
    ParamByName('Element_Number').AsInteger := JENumber;
    Parambyname('Material_Type').AsInteger := Material;
    ParambyName('Worktop').asinteger := worktop;
    Parambyname('Depth').asfloat := Depth;
    Parambyname('Element_type').asstring := 'P';
    Parambyname('Length').AsInteger := Length;
    Parambyname('Quantity').asfloat := Quantity;
    Parambyname('thickness').asinteger := thickness;
    Parambyname('Unit_Price').asfloat := UnitPrice;
    Parambyname('Upstand_Polish_Price').asfloat := 0;
    ParambyName('Price_unit').AsInteger := PriceUnit;
    Parambyname('worktop').asinteger := Worktop;
    Parambyname('No_of_Polished_Depths').asinteger := 0;
    Parambyname('No_of_Polished_Lengths').asinteger := 0;
    if MaterialUse = 0 then
      Parambyname('Material_Use').clear
    else
      Parambyname('Material_Use').AsInteger := MaterialUse;
    parambyname('Total_Upstand_Pieces').asinteger := 0;
    ExecSQL;
  end;
end;

procedure TJElement.SetDepth(const Value: double);
begin
  FDepth := Value;
end;

procedure TJElement.SetElementDescription(const Value: string);
begin
  FElementDescription := Value;
end;

procedure TJElement.SetElementType(const Value: string);
begin
  FElementType := Value;
end;

procedure TJElement.SetJENumber(const Value: integer);
begin
  FJENumber := Value;
end;

procedure TJElement.SetLength(const Value: integer);
begin
  FLength := Value;
end;

procedure TJElement.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TJElement.SetMaterialDescr(const Value: string);
begin
  FMaterialDescr := Value;
end;

procedure TJElement.SetMaterialUse(const Value: integer);
begin
  FMaterialUse := Value;
end;

procedure TJElement.SetMaterialUseDescr(const Value: string);
begin
  FMaterialUseDescr := Value;
end;

procedure TJElement.SetParent(const Value: TJob);
begin
  FParent := Value;
end;

procedure TJElement.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TJElement.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TJElement.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TJElement.Setthickness(const Value: integer);
begin
  Fthickness := Value;
end;

procedure TJElement.SetthicknessDesc(const Value: string);
begin
  FthicknessDesc := Value;
end;

procedure TJElement.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

procedure TJElement.Setworktop(const Value: integer);
begin
  Fworktop := Value;
end;

procedure TJElement.SetworktopDesc(const Value: string);
begin
  FworktopDesc := Value;
end;

procedure TJElement.SetworktopGroup(const Value: integer);
begin
  FworktopGroup := Value;
end;

{ TJElements }

procedure TJElements.Add(aElement: TJElement);
begin
  FItems.Add(aElement);
end;

procedure TJElements.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJElement(FItems[i]).Free;
end;

function TJElements.Clone: TJElements;
var
  i : integer;
begin
  Result := TJElements.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJElement(FItems[i]).Clone);
end;

constructor TJElements.Create(Job: TJob);
begin
  FParent := Job;
  FItems := TList.Create;
end;

procedure TJElements.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJElements.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJElement(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJElements.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJElements.GetItems(Index: integer): TJElement;
begin
  Result := TJElement(FItems[Index]);
end;

function TJElements.IndexOf(const ElementNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJElement(FItems[i]).JENumber = ElementNo then
      Result := i;
end;

procedure TJElements.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJElement(FItems[i]).JENumber:= (i+1);
end;

procedure TJElements.SetItems(Index: integer; const Value: TJElement);
begin
  FItems[Index] := Value;
end;

{ TJUpstand }

function TJUpstand.Clone: TJUpstand;
begin
  Result := TJUpstand.Create(FParent);
  Result.ElementType    :=           Self.ElementType;
  Result.Material       :=           Self.Material;
  Result.MaterialDescr  :=           Self.MaterialDescr;
  Result.MaterialUse    :=           Self.MaterialUse;
  Result.MaterialUseDescr  :=        Self.MaterialUseDescr;
  Result.NoOfDepths     :=           self.NoOfDepths;
  Result.NoOfLengths    :=           self.NoOfLengths;
  Result.Depth          :=           Self.Depth;
  Result.Length         :=           Self.Length;
  Result.JENumber       :=           Self.JENumber;
  Result.Quantity       :=           Self.Quantity;
  Result.thickness      :=           Self.thickness;
  Result.thicknessDesc  :=           Self.thicknessDesc;
  Result.UnitPrice      :=           Self.UnitPrice;
  Result.PolishPrice    :=           Self.PolishPrice;
  Result.PriceUnit      :=           Self.PriceUnit;
  Result.PriceUnitDesc  :=           Self.PriceUnitDesc;
  Result.worktop        :=           Self.worktop;
  Result.worktopDesc    :=           Self.worktopDesc;
  Result.TotalUpstandPieces
                        :=           self.TotalUpstandPieces;
end;

constructor TJUpstand.Create(Job: TJob);
begin
  FParent := Job;
end;

destructor TJUpstand.Destroy;
begin

  inherited;
end;

function TJUpstand.GetTotalPolishPrice: currency;
begin
  Result := (((FLength/1000)*FNoOfLengths) * FPolishPrice) + (((FDepth/1000)*FNoOfDepths) * FPolishPrice);
end;

function TJUpstand.GetTotalPrice: currency;
begin
  Result := (((fDepth * FLength)/1000000) * FQuantity * FUnitPrice) + self.TotalPolishPrice;
end;

procedure TJUpstand.LoadFromDB;
begin
  with FParent.FDataModule.qryJUpstand do
  begin
    Close;
    ParamByName('Job').Asfloat := FParent.DbKey;
    ParamByName('Upstand_Number').AsInteger := JENumber;
    Open;
    Depth := FieldByName('Depth').asfloat;
    ElementType := FieldByName('Element_Type').asstring;
    Length := fieldbyname('Length').AsInteger;
    Quantity := FieldByName('Quantity').asfloat;
    thickness := FieldByName('thickness').asinteger;
    thicknessDesc := FieldByName('thickness_mm').asstring;
    UnitPrice := FieldByName('Unit_Price').asfloat;
    PolishPrice := FieldByName('Upstand_Polish_Price').asfloat;
    PriceUnit := fieldbyname('Price_Unit').asinteger;
    Worktop := FieldByName('worktop').asinteger;
    worktopDesc := FieldByName('worktop_Description').asstring;
    MaterialUse := fieldbyname('Material_Use').asinteger;
    MaterialUseDescr := fieldbyname('Use_Description').asstring;
    Close;
  end;
end;

procedure TJUpstand.SaveToDB;
begin
  with FParent.FDataModule.qryJAddElement do
  begin
    ParamByName('Job').Asfloat := FParent.DbKey;
    ParamByName('Element_Description').Asstring := '';
    ParamByName('Element_Number').AsInteger := JENumber;
    Parambyname('Material_Type').AsInteger := Material;
    ParambyName('Worktop').asinteger := worktop;
    Parambyname('Depth').asfloat := Depth;
    Parambyname('Element_type').asstring := 'U';
    Parambyname('Length').AsInteger := Length;
    Parambyname('Quantity').asfloat := Quantity;
    Parambyname('thickness').asinteger := thickness;
    Parambyname('Unit_Price').asfloat := UnitPrice;
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

procedure TJUpstand.SetDepth(const Value: double);
begin
  FDepth := Value;
end;

procedure TJUpstand.SetElementType(const Value: string);
begin
  FElementType := Value;
end;

procedure TJUpstand.SetJENumber(const Value: integer);
begin
  FJENumber := Value;
end;

procedure TJUpstand.SetLength(const Value: integer);
begin
  FLength := Value;
end;

procedure TJUpstand.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TJUpstand.SetMaterialDescr(const Value: string);
begin
  FMaterialDescr := Value;
end;

procedure TJUpstand.SetMaterialUse(const Value: integer);
begin
  FMaterialUse := Value;
end;

procedure TJUpstand.SetMaterialUseDescr(const Value: string);
begin
  FMaterialUseDescr := Value;
end;

procedure TJUpstand.SetNoOfDepths(const Value: integer);
begin
  FNoOfDepths := Value;
end;

procedure TJUpstand.SetNoOfLengths(const Value: integer);
begin
  FNoOfLengths := Value;
end;

procedure TJUpstand.SetParent(const Value: TJob);
begin
  FParent := Value;
end;

procedure TJUpstand.SetPolishPrice(const Value: currency);
begin
  FPolishPrice := Value;
end;

procedure TJUpstand.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TJUpstand.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TJUpstand.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TJUpstand.Setthickness(const Value: integer);
begin
  Fthickness := Value;
end;

procedure TJUpstand.SetthicknessDesc(const Value: string);
begin
  FthicknessDesc := Value;
end;

procedure TJUpstand.SetTotalUpstandPieces(const Value: integer);
begin
  FTotalUpstandPieces := Value;
end;

procedure TJUpstand.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

procedure TJUpstand.Setworktop(const Value: integer);
begin
  Fworktop := Value;
end;

procedure TJUpstand.SetworktopDesc(const Value: string);
begin
  FworktopDesc := Value;
end;

{ TJUpstands }

procedure TJUpstands.Add(aUpstand: TJUpstand);
begin
  FItems.Add(aUpstand);
end;

procedure TJUpstands.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJUpstand(FItems[i]).Free;
end;

function TJUpstands.Clone: TJUpstands;
var
  i : integer;
begin
  Result := TJUpstands.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJUpstand(FItems[i]).Clone);
end;

constructor TJUpstands.Create(Job: TJob);
begin
  FParent := Job;
  FItems := TList.Create;
end;

procedure TJUpstands.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJUpstands.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJUpstand(FItems[i]).Free;
  FItems.Free;
  inherited;

end;

function TJUpstands.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJUpstands.GetItems(Index: integer): TJUpstand;
begin
  Result := TJUpstand(FItems[Index]);
end;

function TJUpstands.IndexOf(const UpstandNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJUpstand(FItems[i]).JENumber = UpstandNo then
      Result := i;
end;

procedure TJUpstands.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJUpstand(FItems[i]).JENumber:= (i+1)+1000;
end;

procedure TJUpstands.SetItems(Index: integer; const Value: TJUpstand);
begin
  FItems[Index] := Value;
end;

{ TJExtra }

function TJExtra.Clone: TJExtra;
begin
  Result := TJExtra.Create(FParent);
  Result.DoNotDiscount  :=           self.DoNotDiscount;
  Result.Extra          :=           self.Extra;;
  Result.ExtraDesc      :=           self.ExtraDesc;
  Result.UnitPrice      :=           Self.UnitPrice;
  Result.PriceUnit      :=           Self.PriceUnit;
  Result.PriceUnitDesc  :=           self.PriceUnitDesc;
  Result.JExNumber       :=          Self.JExNumber;
  Result.Quantity       :=           Self.Quantity;
  Result.UnitPrice      :=           Self.UnitPrice;
end;

constructor TJExtra.Create(Job: TJob);
begin
  FParent := Job;
end;

destructor TJExtra.Destroy;
begin

  inherited;
end;

function TJExtra.GetTotalPrice: currency;
begin
  result := FQuantity * FUnitPrice;
end;

procedure TJExtra.LoadFromDB;
begin
  with FParent.FDataModule.qryJExtra do
  begin
    Close;
    ParamByName('Job').Asfloat := FParent.DbKey;
    ParamByName('Extra_no').AsInteger := JExNumber;
    Open;
    DoNotDiscount := (fieldbyname('Do_not_Discount').asstring = 'Y');
    Extra := FieldbyName('Extra_Charge').asinteger;
    Quantity := FieldbyName('Quantity').asfloat;
    UnitPrice := Fieldbyname('Unit_Price').asfloat;
    PriceUnit := FieldbyName('Price_unit').AsInteger;
    Close;
  end;
end;

procedure TJExtra.SaveToDB;
begin
  with FParent.FDataModule.qryJAddExtra do
  begin
    ParamByName('Job').Asfloat := FParent.DbKey;
    ParamByName('Extra_no').AsInteger := JExNumber;
    ParambyName('Extra_Charge').asinteger := Extra;
    Parambyname('Quantity').asfloat := Quantity;
    Parambyname('Unit_Price').asfloat := UnitPrice;
    ParambyName('Price_unit').AsInteger := PriceUnit;
    if DoNotDiscount then
      ParambyName('Do_Not_Discount').Asstring := 'Y'
    else
      ParambyName('Do_Not_Discount').Asstring := 'N';
    ExecSQL;
  end;
end;

procedure TJExtra.SetExtra(const Value: integer);
begin
  FExtra := Value;
end;

procedure TJExtra.SetExtraDesc(const Value: string);
begin
  FExtraDesc := Value;
end;

procedure TJExtra.SetParent(const Value: TJob);
begin
  FParent := Value;
end;

procedure TJExtra.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TJExtra.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TJExtra.SetJExNumber(const Value: integer);
begin
  FJExNumber := Value;
end;

procedure TJExtra.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TJExtra.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

procedure TJExtra.SetDoNotDiscount(const Value: boolean);
begin
  FDoNotDiscount := Value;
end;

{ TJEdge }

function TJEdge.Clone: TJEdge;
begin
  Result := TJEdge.Create(FParent);
  Result.Edge           :=          self.Edge;
  Result.EdgeDesc       :=          Self.EdgeDesc;
  Result.Material       :=           Self.Material;
  Result.MaterialDescr  :=           Self.MaterialDescr;
  Result.UnitPrice      :=           Self.UnitPrice;
  Result.PriceUnit      :=           Self.PriceUnit;
  Result.PriceUnitDesc  :=           Self.PriceUnitDesc;
  Result.JEdgNumber     :=           Self.JEdgNumber;
  Result.Length         :=           Self.Length;
  Result.EdgeType      :=           Self.EdgeType;
  Result.EdgeTypeDesc  :=           Self.EdgeTypeDesc;
end;

constructor TJEdge.Create(Job: TJob);
begin
  FParent := Job;
end;

destructor TJEdge.Destroy;
begin

  inherited;
end;

function TJEdge.GetTotalPrice: currency;
begin
  result := (FLength / 1000)* FUnitPrice;
end;

procedure TJEdge.LoadFromDB;
begin
  with FParent.FDataModule.qryJEdge do
  begin
    Close;
    ParamByName('Job').Asfloat := FParent.DbKey;
    ParamByName('Edge_Number').AsInteger := JEdgNumber;
    Open;
    Edge := FieldbyName('Edge_Profile').asinteger;
    Material := FieldbyName('Material_Type').AsInteger;
    Length := FieldbyName('Length').asfloat;
    EdgeType := Fieldbyname('Edge_Type').asinteger;
    UnitPrice := Fieldbyname('Unit_Price').asfloat;
    PriceUnit := FieldbyName('Price_unit').AsInteger;
    Close;
  end;
end;

procedure TJEdge.SaveToDB;
begin
  with FParent.FDataModule.qryJAddEdge do
  begin
    ParamByName('Job').Asfloat := FParent.DbKey;
    ParamByName('Edge_Number').AsInteger := JEdgNumber;
    ParamByName('Edge_Profile').asinteger := Edge;
    Parambyname('Material_Type').AsInteger := Material;
    Parambyname('Length').asfloat := Length;
    Parambyname('Edge_Type').asinteger := EdgeType;
    Parambyname('Unit_Price').asfloat := UnitPrice;
    ParambyName('Price_unit').AsInteger := PriceUnit;
    ExecSQL;
  end;
end;

procedure TJEdge.SetEdge(const Value: integer);
begin
  FEdge := Value;
end;

procedure TJEdge.SetEdgeDesc(const Value: string);
begin
  FEdgeDesc := Value;
end;

procedure TJEdge.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TJEdge.SetEdgeTypeDesc(const Value: string);
begin
  FEdgeTypeDesc := Value;
end;

procedure TJEdge.SetJEdgNumber(const Value: integer);
begin
  FJEdgNumber := Value;
end;

procedure TJEdge.SetLength(const Value: double);
begin
  FLength := Value;
end;

procedure TJEdge.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TJEdge.SetMaterialDescr(const Value: string);
begin
  FMaterialDescr := Value;
end;

procedure TJEdge.SetParent(const Value: TJob);
begin
  FParent := Value;
end;

procedure TJEdge.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TJEdge.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TJEdge.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

{ TJCutOut }

function TJCutOut.Clone: TJCutOut;
begin
  Result := TJCutOut.Create(FParent);
  Result.CutOut         :=           self.CutOut;
  Result.CutOutDesc     :=           self.CutOutDesc;
  Result.Material       :=           Self.Material;
  Result.MaterialDescr  :=           Self.MaterialDescr;
  Result.UnitPrice      :=           Self.UnitPrice;
  Result.PriceUnit      :=           Self.PriceUnit;
  Result.PriceUnitDesc  :=           Self.PriceUnitDesc;
  Result.JCONumber      :=           Self.JCONumber;
  Result.Quantity       :=           Self.Quantity;
  Result.EdgeType      :=           Self.EdgeType;
  Result.EdgeTypeDesc  :=           Self.EdgeTypeDesc;

end;

constructor TJCutOut.Create(Job: TJob);
begin
  FParent := Job;
end;

destructor TJCutOut.Destroy;
begin

  inherited;
end;

function TJCutOut.GetTotalPrice: currency;
begin
  result := FQuantity * FUnitPrice;
end;

procedure TJCutOut.LoadFromDB;
begin
  with FParent.FDataModule.qryJCutOut do
  begin
    Close;
    ParamByName('Job').Asfloat := FParent.DbKey;
    ParamByName('cutout_Number').AsInteger := JCONumber;
    Open;
    cutout := FieldbyName('cutout').asinteger;
    Material := FieldbyName('Material_Type').AsInteger;
    Quantity := FieldbyName('Quantity').asfloat;
    EdgeType := Fieldbyname('Edge_Type').asinteger;
    UnitPrice := Fieldbyname('Unit_Price').asfloat;
    PriceUnit := FieldbyName('Price_unit').AsInteger;
    Close;
  end;

end;

procedure TJCutOut.SaveToDB;
begin
  with FParent.FDataModule.qryJAddCutOut do
  begin
    ParamByName('Job').Asfloat := FParent.DbKey;
    ParamByName('cutout_Number').AsInteger := JCONumber;
    ParamByName('Cutout').asinteger := Cutout;
    Parambyname('Material_Type').AsInteger := Material;
    Parambyname('Quantity').asfloat := Quantity;
    Parambyname('Edge_Type').asinteger := EdgeType;
    Parambyname('Unit_Price').asfloat := UnitPrice;
    ParambyName('Price_unit').AsInteger := PriceUnit;
    ExecSQL;
  end;
end;

procedure TJCutOut.SetCutOut(const Value: integer);
begin
  FCutOut := Value;
end;

procedure TJCutOut.SetCutOutDesc(const Value: string);
begin
  FCutOutDesc := Value;
end;

procedure TJCutOut.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TJCutOut.SetEdgeTypeDesc(const Value: string);
begin
  FEdgeTypeDesc := Value;
end;

procedure TJCutOut.SetJCONumber(const Value: integer);
begin
  FJCONumber := Value;
end;

procedure TJCutOut.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TJCutOut.SetMaterialDescr(const Value: string);
begin
  FMaterialDescr := Value;
end;

procedure TJCutOut.SetParent(const Value: TJob);
begin
  FParent := Value;
end;

procedure TJCutOut.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TJCutOut.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TJCutOut.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TJCutOut.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

{ TJExtras }

procedure TJExtras.Add(aExtra: TJExtra);
begin
  FItems.Add(aExtra);
end;

procedure TJExtras.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJExtra(FItems[i]).Free;
end;

function TJExtras.Clone: TJExtras;
var
  i : integer;
begin
  Result := TJExtras.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJExtra(FItems[i]).Clone);
end;

constructor TJExtras.Create(Job: TJob);
begin
  FParent := Job;
  FItems := TList.Create;
end;

procedure TJExtras.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJExtras.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJExtra(FItems[i]).Free;
  FItems.Free;
  inherited;

end;

function TJExtras.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJExtras.GetItems(Index: integer): TJExtra;
begin
  Result := TJExtra(FItems[Index]);
end;

function TJExtras.IndexOf(const ExtraNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJExtra(FItems[i]).JExNumber = ExtraNo then
      Result := i;
end;

procedure TJExtras.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJExtra(FItems[i]).jExNumber:= (i+1);
end;

procedure TJExtras.SetItems(Index: integer; const Value: TJExtra);
begin
  FItems[Index] := Value;
end;

{ TJEdges }

procedure TJEdges.Add(aEdge: TJEdge);
begin
  FItems.Add(aEdge);
end;

procedure TJEdges.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJEdge(FItems[i]).Free;
end;

function TJEdges.Clone: TJEdges;
var
  i : integer;
begin
  Result := TJEdges.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJEdge(FItems[i]).Clone);
end;

constructor TJEdges.Create(Job: TJob);
begin
  FParent := Job;
  FItems := TList.Create;
end;

procedure TJEdges.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJEdges.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJEdge(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJEdges.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJEdges.GetItems(Index: integer): TJEdge;
begin
  Result := TJEdge(FItems[Index]);
end;

function TJEdges.IndexOf(const EdgeNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJEdge(FItems[i]).JEdgNumber = EdgeNo then
      Result := i;
end;

procedure TJEdges.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJEdge(FItems[i]).jedgNumber:= (i+1);
end;

procedure TJEdges.SetItems(Index: integer; const Value: TJEdge);
begin
  FItems[Index] := Value;
end;

{ TJCutOuts }

procedure TJCutOuts.Add(aCutOut: TJCutOut);
begin
  FItems.Add(aCutOut);
end;

procedure TJCutOuts.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJCutOut(FItems[i]).Free;
end;

function TJCutOuts.Clone: TJCutOuts;
var
  i : integer;
begin
  Result := TJCutOuts.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJCutOut(FItems[i]).Clone);
end;

constructor TJCutOuts.Create(Job: TJob);
begin
  FParent := Job;
  FItems := TList.Create;
end;

procedure TJCutOuts.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJCutOuts.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJCutOut(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJCutOuts.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJCutOuts.GetItems(Index: integer): TJCutOut;
begin
  Result := TJCutOut(FItems[Index]);
end;

function TJCutOuts.IndexOf(const CutOutNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJCutOut(FItems[i]).jCONumber = CutOutNo then
      Result := i;
end;

procedure TJCutOuts.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJCutOut(FItems[i]).jCONumber:= (i+1);
end;

procedure TJCutOuts.SetItems(Index: integer; const Value: TJCutOut);
begin
  FItems[Index] := Value;
end;

{ TJEvents }

procedure TJEvents.Add(aEvent: TJEvent);
begin
  FItems.Add(aEvent);
end;

procedure TJEvents.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJEvent(FItems[i]).Free;
end;

function TJEvents.Clone: TJEvents;
var
  i : integer;
begin
  Result := TJEvents.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJEvent(FItems[i]).Clone);
end;

constructor TJEvents.Create(Job: TJob);
begin
  FParent := Job;
  FItems := TList.Create;
end;

procedure TJEvents.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJEvents.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJEvent(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJEvents.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJEvents.GetItems(Index: integer): TJEvent;
begin
  Result := TJEvent(FItems[Index]);
end;

function TJEvents.IndexOf(const EventNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJEvent(FItems[i]).EventNumber = EventNo then
      Result := i;
end;

procedure TJEvents.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJEvent(FItems[i]).EventNumber:= (i+1);
end;

procedure TJEvents.SetItems(Index: integer; const Value: TJEvent);
begin
  FItems[Index] := Value;
end;

{ TJEvent }

function TJEvent.Clone: TJEvent;
begin
  Result := TJEvent.Create(FParent);
  Result.EventNumber    :=           self.EventNumber;
  Result.DateEntered    :=           self.DateEntered;
  Result.operator       :=           Self.Operator;
  Result.OperatorName   :=           self.OperatorName;
  Result.Narrative      :=           Self.Narrative;
end;

constructor TJEvent.Create(Job: TJob);
begin
  FParent := Job;
  FNarrative := TNotes.Create;
end;

destructor TJEvent.Destroy;
begin
  FNarrative.Free;
  inherited;
end;

procedure TJEvent.LoadFromDB;
begin
  with FParent.FDataModule.qryJEvent do
  begin
    Close;
    ParamByName('Job').AsInteger := FParent.DbKey;
    ParamByName('Internal_Note').AsInteger := EventNumber;
    Open;
    DateEntered := FieldbyName('Date_Time_Entered').asdatetime;
    Narrative.dbkey := FieldbyName('Narrative').AsInteger;
    Operator := FieldbyName('Operator').asinteger;
    OperatorName := FieldbyName('Operator_Name').asstring;
    Close;
  end;

end;

procedure TJEvent.SaveToDB;
begin
  Narrative.SavetoDB;
  with FParent.FDataModule.qryJAddEvent do
  begin
    ParamByName('Job').AsInteger := FParent.DbKey;
    ParamByName('Internal_Note').AsInteger := EventNumber;
    ParamByName('Operator').asinteger := Operator;
    Parambyname('Date_Time_Entered').Asdatetime := DateEntered;
    Parambyname('Narrative').asinteger := Narrative.dbKey;
    ExecSQL;
  end;
end;

procedure TJEvent.SetDateEntered(const Value: TDateTime);
begin
  FDateEntered := Value;
end;

procedure TJEvent.SetEventNumber(const Value: integer);
begin
  FEventNumber := Value;
end;

procedure TJEvent.SetNarrative(const Value: TNotes);
begin
  FNarrative := Value;
end;

procedure TJEvent.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TJEvent.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TJEvent.SetParent(const Value: TJob);
begin
  FParent := Value;
end;

{ TJRemedial }

function TJRemedial.Clone: TJRemedial;
begin
  Result := TJRemedial.Create(FParent);
  Result.AdditionalNotes    :=           self.AdditionalNotes;
  Result.AdditionalNotesText :=          self.AdditionalNotesText;
  Result.Customer           :=           self.Customer;
  Result.Completed          :=           self.Completed;
  Result.DateRaised         :=           self.DateRaised;
  Result.Fitter             :=           self.Fitter;
  Result.FitterName         :=           self.FitterName;
  Result.InstallDate        :=           self.InstallDate;
  Result.ItemsStillOnSite   :=           self.ItemsStillOnSite;
  Result.ItemsToReturnToSite :=          self.ItemsToReturnToSite;
  Result.ManufacturingNotes :=           self.ManufacturingNotes;
  Result.ManufacturingNotesText :=       self.ManufacturingNotesText;
  Result.MaterialsRequired  :=           self.MaterialsRequired;
  Result.Narrative          :=           self.Narrative;
  Result.OfficeNotes        :=           self.OfficeNotes;
  Result.OfficeNotesText    :=           self.OfficeNotesText;
  Result.Operator           :=           self.Operator;
  Result.OperatorName       :=           self.OperatorName;
  Result.OriginalFitter     :=           self.OriginalFitter;
  Result.OriginalTemplater  :=           self.OriginalTemplater;
  Result.Price              :=           self.Price;
  Result.ProductionRequired :=           self.ProductionRequired;
  Result.RemedialNumber     :=           self.RemedialNumber;
  Result.RemedialCategory   :=           self.RemedialCategory;
  Result.RemedialDept       :=           self.RemedialDept;
  Result.RemedialType       :=           self.RemedialType;
  Result.RemedialID         :=           self.RemedialID;
  Result.SiteRequirements   :=           self.SiteRequirements;
  Result.ToolsRequired      :=           self.ToolsRequired;
end;

constructor TJRemedial.Create(Job: TJob);
begin
  FParent := Job;
  FNarrative := TNotes.Create;
end;

destructor TJRemedial.Destroy;
begin
  FNarrative.Free;
  inherited;
end;

procedure TJRemedial.LoadFromDB;
begin
  with FParent.FDataModule.qryJRemedial do
  begin
    Close;
    ParamByName('Job').AsInteger := FParent.DbKey;
    ParamByName('Remedial_Number').AsInteger := RemedialNumber;
    Open;
    AdditionalNotes := fieldbyname('Additional_Notes').asinteger;
    AdditionalNotesText := dtmdlJob.getNarrative(AdditionalNotes);
    Customer := fieldbyname('Customer').asinteger;
    Completed := fieldbyname('Completed').asstring;
    DateRaised := fieldbyname('Date_Raised').asdatetime;
    Fitter := fieldbyname('Fitter').asinteger;
    FitterName := fieldbyname('Fitter_Name').asstring;
    InstallDate := fieldbyname('Installation_Date').asdatetime;
    ItemsStillOnSite := fieldbyname('Items_Still_On_Site').asstring;
    ItemsToReturnToSite := fieldbyname('Items_To_Return_To_Site').asstring;
    Narrative.dbkey := FieldbyName('Notes').AsInteger;
    ManufacturingNotes := FieldbyName('Manufacturing_Notes').AsInteger;
    ManufacturingNotesText := dtmdlJob.getNarrative(ManufacturingNotes);
    MaterialsRequired := fieldbyname('Material_Required').asstring;
    OfficeNotes := FieldByName('Office_Notes').AsInteger;
    OfficeNotesText := dtmdlJob.GetNarrative(OfficeNotes);
    Operator := fieldbyname('Operator').AsInteger;
    OperatorName := fieldbyname('Operator_Name').asstring;
    OriginalFitter := fieldbyname('Original_Fitter').asinteger;
    OriginalTemplater := fieldbyname('Original_Templater').asinteger;
    Price := fieldbyname('Installation_Price').asfloat;
    ProductionRequired := fieldbyname('Production_Required').asstring;
    RemedialType := fieldbyname('Remedial_Type').asinteger;
    RemedialDept := fieldbyname('Remedial_Dept').asinteger;
    RemedialCategory := fieldbyname('Remedial_Category').asinteger;
    RemedialID := fieldbyname('Remedial').asinteger;
    SiteRequirements := fieldbyname('Site_Requirements').asstring;
    ToolsRequired := fieldbyname('Tools_Required').asstring;
    Close;
  end;
end;

procedure TJRemedial.SaveToDB;
var
  iTempNarr: integer;
  iRemedial: integer;
begin
  {Check whether a record has been added to the Remedial table - This will supercede Job_Remedial}
  with FParent.FDataModule.qryCheckRemedial do
  begin
    close;
    ParamByName('Job').AsInteger := FParent.DbKey;
    ParamByName('Remedial_Number').AsInteger := RemedialNumber;
    open;

    if recordcount > 0 then
      iRemedial := fieldbyname('ID').asinteger
    else
      begin
        with FParent.FDataModule.qryAddRemedial do
        begin
          close;
          ParamByName('Sales_Order').AsInteger := 0;
          ParamByName('Job').AsInteger := FParent.DbKey;
          ParamByName('Remedial_Number').AsInteger := RemedialNumber;
          ParamByName('Date_Raised').AsDateTime := DateRaised;
          ParamByName('Operator').Asinteger := Operator;
          if RemedialType = 0 then
            ParamByName('Remedial_Type').clear
          else
            ParamByName('Remedial_Type').Asinteger := RemedialType;
          if RemedialDept = 0 then
            ParamByName('Remedial_Dept').clear
          else
            ParamByName('Remedial_Dept').Asinteger := RemedialDept;
          if RemedialCategory = 0 then
            ParamByName('Remedial_Category').clear
          else
            ParamByName('Remedial_Category').Asinteger := RemedialCategory;
          ParamByName('Operator').Asinteger := Operator;
          ExecSQL;
        end;

        {Get the Remedial number}
        with FParent.FDataModule.qryCheckRemedial do
        begin
          close;
          ParamByName('Job').AsInteger := FParent.DbKey;
          ParamByName('Remedial_Number').AsInteger := RemedialNumber;
          open;

          iRemedial := fieldbyname('ID').asinteger
        end;
      end;
  end;

  Narrative.SavetoDB;
  with FParent.FDataModule.qryJAddRemedial do
  begin
    iTempNarr := self.AdditionalNotes;
    dtmdlJob.SaveNarrative(iTempNarr, self.AdditionalNotesText);
    AdditionalNotes := iTempNarr;

    iTempNarr := self.ManufacturingNotes;
    dtmdlJob.SaveNarrative(iTempNarr, self.ManufacturingNotesText);
    ManufacturingNotes := iTempNarr;

    iTempNarr := self.OfficeNotes;
    dtmdlJob.SaveNarrative(iTempNarr, self.OfficeNotesText);
    OfficeNotes := iTempNarr;

    ParamByName('Job').AsInteger := FParent.DbKey;
    ParamByName('Remedial_Number').AsInteger := RemedialNumber;
    if Fitter = 0 then
      ParamByName('Fitter').clear
    else
      ParamByName('Fitter').AsInteger := Fitter;

    if OriginalTemplater = 0 then
      ParamByName('Original_Templater').clear
    else
      ParamByName('Original_Templater').AsInteger := OriginalTemplater;

    if OriginalFitter = 0 then
      ParamByName('Original_Fitter').clear
    else
      ParamByName('Original_Fitter').AsInteger := OriginalFitter;

    Parambyname('Notes').asinteger := Narrative.dbKey;
    ParamByName('Material_Required').Asstring := MaterialsRequired;
    ParamByName('Installation_Price').Asfloat := Price;
    ParamByName('Installation_Date').AsDateTime := InstallDate;
    ParamByName('Completed').AsString := Completed;
    ParamByName('Date_Raised').AsDateTime := DateRaised;
    ParamByName('Operator').Asinteger := Operator;
    if RemedialType = 0 then
      ParamByName('Remedial_Type').clear
    else
      ParamByName('Remedial_Type').Asinteger := RemedialType;
    if RemedialDept = 0 then
      ParamByName('Remedial_Dept').clear
    else
      ParamByName('Remedial_Dept').Asinteger := RemedialDept;
    if RemedialCategory = 0 then
      ParamByName('Remedial_Category').clear
    else
      ParamByName('Remedial_Category').Asinteger := RemedialCategory;
    ParamByName('Items_to_Return_To_Site').Asstring := ItemsToReturnToSite;
    ParamByName('Items_Still_On_Site').Asstring := ItemsStillOnSite;

    ParamByName('Operator').Asinteger := Operator;

    ParamByName('Tools_Required').Asstring := ToolsRequired;
    ParamByName('Site_Requirements').Asstring := SiteRequirements;

    ParamByName('Production_Required').AsString := ProductionRequired;

    ParamByName('Additional_Notes').Asinteger := AdditionalNotes;
    ParamByName('Manufacturing_Notes').Asinteger := ManufacturingNotes;

    if OfficeNotes = 0 then
      ParamByName('Office_Notes').clear
    else
      ParamByName('Office_Notes').Asinteger := OfficeNotes;

    if Customer = 0 then
      ParamByName('Customer').clear
    else
      ParamByName('Customer').Asinteger := Customer;

    ParamByName('Remedial').Asinteger := iRemedial;
    ExecSQL;
  end;
end;

procedure TJRemedial.SetAdditionalNotes(const Value: integer);
begin
  FAdditionalNotes := Value;
end;

procedure TJRemedial.SetAdditionalNotesText(const Value: string);
begin
  FAdditionalNotesText := Value;
end;

procedure TJRemedial.SetCompleted(const Value: string);
begin
  FCompleted := Value;
end;

procedure TJRemedial.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TJRemedial.SetDateRaised(const Value: TDateTime);
begin
  FDateRaised := Value;
end;

procedure TJRemedial.SetFitter(const Value: integer);
begin
  FFitter := Value;
end;

procedure TJRemedial.SetFitterName(const Value: string);
begin
  FFitterName := Value;
end;

procedure TJRemedial.SetInstallDate(const Value: TDateTime);
begin
  FInstallDate := Value;
end;

procedure TJRemedial.SetItemsStillOnSite(const Value: string);
begin
  FItemsStillOnSite := Value;
end;

procedure TJRemedial.SetItemsToReturnToSite(const Value: string);
begin
  FItemsToReturnToSite := Value;
end;

procedure TJRemedial.SetManufacturingNotes(const Value: integer);
begin
  FManufacturingNotes := Value;
end;

procedure TJRemedial.SetManufacturingNotesText(const Value: string);
begin
  FManufacturingNotesText := Value;
end;

procedure TJRemedial.SetMaterialsRequired(const Value: string);
begin
  FMaterialsRequired := Value;
end;

procedure TJRemedial.SetNarrative(const Value: TNotes);
begin
  FNarrative := Value;
end;

procedure TJRemedial.SetOfficeNotes(const Value: integer);
begin
  FOfficeNotes := Value;
end;

procedure TJRemedial.SetOfficeNotesText(const Value: string);
begin
  FOfficeNotesText := Value;
end;

procedure TJRemedial.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TJRemedial.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TJRemedial.SetOriginalFitter(const Value: integer);
begin
  FOriginalFitter := Value;
end;

procedure TJRemedial.SetOriginalTemplater(const Value: integer);
begin
  FOriginalTemplater := Value;
end;

procedure TJRemedial.SetParent(const Value: TJob);
begin
  FParent := Value;
end;

procedure TJRemedial.SetPrice(const Value: real);
begin
  FPrice := Value;
end;

procedure TJRemedial.SetProductionRequired(const Value: string);
begin
  FProductionRequired := Value;
end;

procedure TJRemedial.SetRemedialCategory(const Value: integer);
begin
  FRemedialCategory := Value;
end;

procedure TJRemedial.SetRemedialDept(const Value: integer);
begin
  FRemedialDept := Value;
end;

procedure TJRemedial.SetRemedialID(const Value: integer);
begin
  FRemedialID := Value;
end;

procedure TJRemedial.SetRemedialNumber(const Value: integer);
begin
  FRemedialNumber := Value;
end;

procedure TJRemedial.SetRemedialType(const Value: integer);
begin
  FRemedialType := Value;
end;

procedure TJRemedial.SetSiteRequirements(const Value: string);
begin
  FSiteRequirements := Value;
end;

procedure TJRemedial.SetToolsRequired(const Value: string);
begin
  FToolsRequired := Value;
end;

{ TJRemedials }

procedure TJRemedials.Add(aRemedial: TJRemedial);
begin
  FItems.Add(aRemedial);
end;

procedure TJRemedials.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJRemedial(FItems[i]).Free;
end;

function TJRemedials.Clone: TJRemedials;
var
  i : integer;
begin
  Result := TJRemedials.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJRemedial(FItems[i]).Clone);
end;

constructor TJRemedials.Create(Job: TJob);
begin
  FParent := Job;
  FItems := TList.Create;
end;

procedure TJRemedials.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJRemedials.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJRemedial(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJRemedials.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJRemedials.GetItems(Index: integer): TJRemedial;
begin
  Result := TJRemedial(FItems[Index]);
end;

function TJRemedials.IndexOf(const RemedialNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJRemedial(FItems[i]).RemedialNumber = RemedialNo then
      Result := i;
end;

procedure TJRemedials.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJRemedial(FItems[i]).RemedialNumber := (i+1);
end;

procedure TJRemedials.SetItems(Index: integer; const Value: TJRemedial);
begin
  FItems[Index] := Value;
end;

end.
