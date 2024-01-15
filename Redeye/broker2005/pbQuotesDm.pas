unit pbQuotesDm;

interface

uses
  SysUtils, Classes, DB, pbMainMenu, CCSCommon, pbDatabase, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TqMode   = (qAdd, qChange, qDelete, qCopy, qView, qRepeat, qReQuote);
  TqlMode  = (qlAdd, qlChange, qlDelete, qlView, qlRestrict);
  TqDocMode = (qdocAdd, qdocChange, qdocDelete, qdocView);

  TdtmdlQuotes = class(TDataModule)
    qryZero: TFDQuery;
    qryQHeader: TFDQuery;
    qryQAddHeader: TFDQuery;
    qryQUpdHeader: TFDQuery;
    dsQAllLines: TDataSource;
    qryQAllLines: TFDQuery;
    UpdLastQuoteSQL: TFDQuery;
    GetLastQuoteSQL: TFDQuery;
    qryQHeaderGrid: TFDQuery;
    dsQHeaderGrid: TDataSource;
    qryGetCustomerRep: TFDQuery;
    OperatorSQL: TFDQuery;
    OperatorSRC: TDataSource;
    srcCustContact: TDataSource;
    qryCustContact: TFDQuery;
    qryGetRep: TFDQuery;
    qryPriceUnit: TFDQuery;
    dtsPriceUnit: TDataSource;
    qryQDocument: TFDQuery;
    qryQAddDocument: TFDQuery;
    qryQAllDocuments: TFDQuery;
    qryQAddLine: TFDQuery;
    qryQLine: TFDQuery;
    qryQAllSupplies: TFDQuery;
    qryQAddSupply: TFDQuery;
    qryQSupply: TFDQuery;
    qryGetPriceUnit: TFDQuery;
    qryUpdQuoteStatus: TFDQuery;
    qryGetProductType: TFDQuery;
    qryGetPUnitFromFactor: TFDQuery;
    qryQUpdEstimateFile: TFDQuery;
    qryQReason: TFDQuery;
    dtsQReason: TDataSource;
    qryQuoteWon: TFDQuery;
    qryDummy: TFDQuery;
    qryGetWorkCentrebyName: TFDQuery;
    qryGetWorkCentreGroupbyName: TFDQuery;
    qryGetWorkCentreWCGroup: TFDQuery;
    qryGetProcess: TFDQuery;
    qryGetWorkCentrebyEstName: TFDQuery;
    qryQuotesJB: TFDQuery;
    dtsQuotesJB: TDataSource;
    qryQuotesNotConverted: TFDQuery;
    qryGetCustomerPrices: TFDQuery;
    qryGetCustContact: TFDQuery;
    qryQAddProcessGroup: TFDQuery;
    qryQProcessGroup: TFDQuery;
    qryGetProcessGroups: TFDQuery;
    qryReQuoteCount: TFDQuery;
    qryQUpdEstimateDate: TFDQuery;
    qryGetCustomer: TFDQuery;
    qryGetQuoteCostDefaults: TFDQuery;
    qryGetCustomerSubRep: TFDQuery;
    qryDummyOld: TFDQuery;
    qryJBHeader: TFDQuery;
    qryJBAllLines: TFDQuery;
    dtsPackFormat: TDataSource;
    qryPackFormat: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    function GetHeaderCount: integer;
    function GetHeaderCountJB: integer;
  public
    BranchName: string;
    CustomerName: string;
    Customer: integer;
    CustomerRef: string;
    Description: string;
    EndUserName: string;
    JobNo: integer;
    Rep: integer;
    RepName: string;
    RepIsSubRep: boolean;
    SubRep: integer;
    SubRepName: string;
    Quantity: string;
    Operator: integer;
    OperatorName: string;
    Status: string;
    ShowInactive: string;
    ShowLive: boolean;
    SortType: string;
    SortOrder: string;
    QuoteDate: TDateTime;
    property HeaderCount: integer read GetHeaderCount;
    property headerCountJB: integer read GetHeaderCountJB;
    procedure RefreshData;
    procedure RefreshDataJB;
    function GetCustomerRep(tempCust, tempBranch: integer): integer;
    function GetCustomerSubRep(tempCust, tempBranch: integer): integer;
    function GetNarrative(const iNarrative: integer): string;
    function GetRepName(tempCode: integer): string;
    function GetPriceUnit(tempCode: integer): string;
    function GetPriceUnitFactor(tempCode: integer): integer;
    function GetPriceUnitFromFactor(tempQty: integer): integer;
    function GetProcessDescription(tempCode: integer): string;
    function GetProcessGroup(tempCode: integer): integer;
    function GetProcessProductType(tempCode: integer): integer;
    function GetProductType(tempCode: integer): string;
    function GetNewProcessCode(tempDesc: string; OldCode: integer): integer;
    function GetNewProductTypeCode(tempDesc: string; OldCode: integer): integer;
    function GetWorkCentre(tempCode: string): integer;
    function GetWorkCentreByEstName(tempCode: string): integer;
    function GetWorkCentreGroupbyName(tempCode: string): integer;
    function GetWorkCentreGroupbyWC(tempCode: integer): integer;
    function IsProspect(tempCode: integer): boolean;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    procedure UpdateQuoteStatus(tempCode: real; tempStatus: integer);
    function UsingSearch: boolean;
  end;

  TQuote = class;

  TQuoteDept = class
  private
    FQDepartmentNo: integer;
    FSpecification: string;
    FParent: TQuote;
    FDepartmentName: string;
    FDepartment: integer;
    FSpecificationID: integer;
    procedure SetParent(const Value: TQuote);
    procedure SetQDepartmentNo(const Value: integer);
    procedure SetSpecification(const Value: string);
    procedure SetDepartmentName(const Value: string);
    procedure SetDepartment(const Value: integer);
    procedure SetSpecificationID(const Value: integer);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQuoteDept;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DepartmentName: string read FDepartmentName write SetDepartmentName;
    property Specification: string read FSpecification write SetSpecification;
    property SpecificationID: integer read FSpecificationID write SetSpecificationID;
    property Department: integer read FDepartment write SetDepartment;
    property QDepartmentNo: integer read FQDepartmentNo write SetQDepartmentNo;
    property Parent: TQuote read FParent write SetParent;
  end;

  TQuoteDepts = class;

  TQuoteDoc = class
  private
    FQDocumentNo: integer;
    FDocumentPath: string;
    FDocumentTitle: string;
    FDocumentDate: TDateTime;
    FParent: TQuote;
    procedure SetDocumentDate(const Value: TDateTime);
    procedure SetDocumentPath(const Value: string);
    procedure SetDocumentTitle(const Value: string);
    procedure SetParent(const Value: TQuote);
    procedure SetQDocumentNo(const Value: integer);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQuoteDoc;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DocumentDate: TDateTime read FDocumentDate write SetDocumentDate;
    property DocumentPath: string read FDocumentPath write SetDocumentPath;
    property DocumentTitle: string read FDocumentTitle write SetDocumentTitle;
    property QDocumentNo: integer read FQDocumentNo write SetQDocumentNo;
    property Parent: TQuote read FParent write SetParent;
  end;

  TQuoteDocs = class;

  TQuoteSupply = class
  private
    FParent: TQuote;
    FDescription: string;
    FEnquiryLine: integer;
    FEnquiry: integer;
    FQSupplyNo: integer;
    FLineConverted: string;
    FQuantity: integer;
    FUnitSell: double;
    FUnitCost: double;
    FPriceUnitFactor: integer;
    FPriceUnitDesc: string;
    FPriceUnit: integer;
    FProductType: integer;
    FProductTypeDesc: string;
    FSequence: integer;
    FVatCode: integer;
    function GetTotalCost: currency;
    function GetTotalSell: currency;
    procedure SetDescription(const Value: string);
    procedure SetEnquiry(const Value: integer);
    procedure SetEnquiryLine(const Value: integer);
    procedure SetQSupplyNo(const Value: integer);
    procedure SetLineConverted(const Value: string);
    procedure SetQuantity(const Value: integer);
    procedure SetPriceUnitFactor(const Value: integer);
    procedure SetUnitCost(const Value: double);
    procedure SetUnitSell(const Value: double);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetPriceUnit(const Value: integer);
    procedure SetProductType(const Value: integer);
    procedure SetProductTypeDesc(const Value: string);
    procedure SetSequence(const Value: integer);
    procedure SetVatCode(const Value: integer);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQuoteSupply;
    procedure DeleteFromDB;
    procedure LoadFromDB;
    procedure SaveToDB;
    property Description: string read FDescription write SetDescription;
    property Enquiry: integer read FEnquiry write SetEnquiry;
    property EnquiryLine: integer read FEnquiryLine write SetEnquiryLine;
    property LineConverted: string read FLineConverted write SetLineConverted;
    property Parent : TQuote read FParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitFactor: integer read FPriceUnitFactor write SetPriceUnitFactor;
    property PriceUnitDesc: string  read FPriceUnitDesc write SetPriceUnitDesc;
    property ProductType: integer read FProductType write SetProductType;
    property ProductTypeDesc: string read FProductTypeDesc write SetProductTypeDesc;
    property Quantity: integer read FQuantity write SetQuantity;
    property QSupplyNo: integer read FQSupplyNo write SetQSupplyNo;
    property Sequence: integer read FSequence write SetSequence;
    property TotalCost: currency read GetTotalCost;
    property TotalSell: currency read GetTotalSell;
    property UnitCost: double read FUnitCost write SetUnitCost;
    property UnitSell: double read FUnitSell write SetUnitSell;
    property VatCode: integer read FVatCode write SetVatCode;
  end;

  TQuoteSupplies = class;

  TQuoteLine = class
  private
    FParent: TQuote;
    FLineConverted: boolean;
    FJustMoved: boolean;
    FUnitSell: double;
    FUnitCost: double;
    FQuantity: double;
    FPriceUnit: integer;
    FQuoteLineNo: integer;
    FCategory: integer;
    FSequence: integer;
    FPriceUnitFactor: integer;
    FProductType: integer;
    FCategoryDesc: string;
    FProductTypeDesc: string;
    FPriceUnitDesc: string;
    FDescription: string;
    FUnitSSP: double;
    FTotalCost: double;
    FNoOfHours: double;
    FUnitCostOHD: double;
    FUnitSSPOrig: double;
    FWorkCentreGroup: integer;
    FWorkCentre: integer;
    FTeamCount: integer;
    FProcess: integer;
    FProcessGroup: integer;
    FProcessDesc: string;
    FCostingToolFlag: boolean;
    FSubNumber: integer;
    FCostNumber: integer;
    FCatNumber: integer;
    FVatCode: integer;
    FInternalCostLine: boolean;
    FInternalCostMarkupPercentage: double;
    FUnitResellerPrice: double;
    procedure SetCategory(const Value: integer);
    procedure SetCategoryDesc(const Value: string);
    procedure SetDescription(const Value: string);
    procedure SetJustMoved(const Value: boolean);
    procedure SetLineConverted(const Value: boolean);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetPriceUnitFactor(const Value: integer);
    procedure SetProductType(const Value: integer);
    procedure SetProductTypeDesc(const Value: string);
    procedure SetQuantity(const Value: double);
    procedure SetQuoteLineNo(const Value: integer);
    procedure SetSequence(const Value: integer);
    procedure SetUnitCost(const Value: double);
    procedure SetUnitSell(const Value: double);
    procedure SetUnitSSP(const Value: double);
    function GetTotalCost: currency;
    function GetTotalSSP: currency;
    function GetTotalASP: currency;
    function GetTotalRSP: currency;
    procedure SetNoOfHours(const Value: double);
    procedure SetUnitCostOHD(const Value: double);
    procedure SetUnitSSPOrig(const Value: double);
    procedure SetTeamCount(const Value: integer);
    procedure SetWorkCentre(const Value: integer);
    procedure SetWorkCentreGroup(const Value: integer);
    procedure SetProcess(const Value: integer);
    procedure SetProcessGroup(const Value: integer);
    procedure SetProcessDesc(const Value: string);
    procedure SetCostingToolFlag(const Value: boolean);
    procedure SetCatNumber(const Value: integer);
    procedure SetCostNumber(const Value: integer);
    procedure SetSubNumber(const Value: integer);
    procedure SetVatCode(const Value: integer);
    procedure SetInternalCostLine(const Value: boolean);
    procedure SetInternalCostMarkupPercentage(const Value: double);
    procedure SetUnitResellerPrice(const Value: double);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    function Clone : TQuoteLine;
    procedure DeleteFromDB;
    procedure LoadFromDB;
    procedure SaveToDB;
    property Category: integer read FCategory write SetCategory;
    property CategoryDesc: string read FCategoryDesc write SetCategoryDesc;
    property CostingToolFlag: boolean read FCostingToolFlag write SetCostingToolFlag;
    property CatNumber: integer read FCatNumber write SetCatNumber;
    property CostNumber: integer read FCostNumber write SetCostNumber;
    property Description: string read FDescription write SetDescription;
    property JustMoved: boolean read FJustMoved write SetJustMoved;
    property InternalCostLine: boolean read FInternalCostLine write SetInternalCostLine;
    property InternalCostMarkupPercentage: double read FInternalCostMarkupPercentage write SetInternalCostMarkupPercentage;
    property LineConverted: boolean read FLineConverted write SetLineConverted;
    property NoOfHours: double read FNoOfHours write SetNoOfHours;
    property Parent : TQuote read FParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitFactor: integer read FPriceUnitFactor write SetPriceUnitFactor;
    property PriceUnitDesc: string read FPriceUnitDesc write SetPriceUnitDesc;
    property Process: integer read FProcess write SetProcess;
    property ProcessDesc: string read FProcessDesc write SetProcessDesc;
    property ProcessGroup: integer read FProcessGroup write SetProcessGroup;
    property ProductType: integer read FProductType write SetProductType;
    property ProductTypeDesc: string read FProductTypeDesc write SetProductTypeDesc;
    property Quantity: double read FQuantity write SetQuantity;
    property QuoteLineNo: integer read FQuoteLineNo write SetQuoteLineNo;
    property Sequence: integer read FSequence write SetSequence;
    property SubNumber: integer read FSubNumber write SetSubNumber;
    property TeamCount: integer read FTeamCount write SetTeamCount;
    property TotalCost: currency read GetTotalCost;
    property TotalSSP: currency read GetTotalSSP;
    property TotalASP: currency read GetTotalASP;
    property TotalRSP: currency read GetTotalRSP;
    property UnitCost: double read FUnitCost write SetUnitCost;
    property UnitCostOHD: double read FUnitCostOHD write SetUnitCostOHD;
    property UnitResellerPrice: double read FUnitResellerPrice write SetUnitResellerPrice;
    property UnitSell: double read FUnitSell write SetUnitSell;
    property UnitSSP: double read FUnitSSP write SetUnitSSP;
    property UnitSSPOrig: double read FUnitSSPOrig write SetUnitSSPOrig;
    property VatCode: integer read FVatCode write SetVatCode;
    property WorkCentre: integer read FWorkCentre write SetWorkCentre;
    property WorkCentreGroup: integer read FWorkCentreGroup write SetWorkCentreGroup;
  end;

  TQuoteLines = class;

  TQuoteSupplies = class
  private
    FParent: TQuote;
    FItems : TList;
    function GetCount: integer;
    function GetItems(Index: integer): TQuoteSupply;
    procedure SetItems(Index: integer; const Value: TQuoteSupply);
    function GetMaxLineNo: integer;
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aSupply : TQuoteSupply);
    procedure Clear;
    function  Clone : TQuoteSupplies;
    procedure Delete(const Index : integer);
    function IndexOf(const SupplyNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQuoteSupply read GetItems write SetItems;
      default;
    property MaxLineNo: integer read GetMaxLineNo;
    property Parent : TQuote read FParent;
  end;

  TQuoteLines = class
  private
    FParent: TQuote;
    FItems : TList;
    function GetCount: integer;
    function GetItems(Index: integer): TQuoteLine;
    function GetMaxLineNo: integer;
    procedure SetItems(Index: integer; const Value: TQuoteLine);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aLine : TQuoteLine);
    procedure Clear;
    function  Clone : TQuoteLines;
    procedure Delete(const Index : integer);
    function IndexOf(const LineNumber: integer) : integer;
    function IndexOfSequence(const SeqNumber: integer): integer;
    procedure Renumber;
    procedure ReSequence;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQuoteLine read GetItems write SetItems;
      default;
    property Parent : TQuote read FParent;
    property MaxLineNo: integer read GetMaxLineNo;
  end;

  TQuoteDepts  = class
  private
    FItems: TList;
    FParent: TQuote;
    function GetCount: integer;
    function GetItems(Index: integer): TQuoteDept;
    procedure SetItems(Index: integer; const Value: TQuoteDept);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aDepartment : TQuoteDept);
    procedure Clear;
    function  Clone : TQuoteDepts;
    procedure Delete(const Index : integer);
    function  IndexOf(const DepartmentNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQuoteDept read GetItems write SetItems;
      default;
    property Parent : TQuote read FParent;
  end;

  TQuoteDocs  = class
  private
    FItems: TList;
    FParent: TQuote;
    function GetCount: integer;
    function GetItems(Index: integer): TQuoteDoc;
    procedure SetItems(Index: integer; const Value: TQuoteDoc);
  public
    constructor Create(Quote : TQuote);
    destructor Destroy; override;
    procedure Add(aDocument : TQuoteDoc);
    procedure Clear;
    function  Clone : TQuoteDocs;
    procedure Delete(const Index : integer);
    function  IndexOf(const DocumentNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TQuoteDoc read GetItems write SetItems;
      default;
    property Parent : TQuote read FParent;
  end;

  TQuote = class
  private
    FBranch: integer;
    FCustomer: integer;
    FOperator: integer;
    FQuoteStatus: integer;
    FDbKey: real;
    FNarrative: integer;
    FInactiveReason: integer;
    FOfficeContact: integer;
    FQuantity: integer;
    FContactNo: integer;
    FRep: integer;
    FBranchName: string;
    FInactive: string;
    FNarrativeText: string;
    FOperatorName: string;
    FDescription: string;
    FCustomerName: string;
    FCustOrderNo: string;
    FGoodsRequired: TDateTime;
    FDate: TDateTime;
    FInactiveDate: TDateTime;
    FStartDate: TDateTime;
    FDataModule: TdtmdlQuotes;
    FQMode: TQMode;
    FDescriptiveRef: string;
    FDateRequired: TDateTime;
    FDateQuoteRequired: TDateTime;
    FPriceUnit: integer;
    FConvertPercentage: double;
    FQuoteDocs: TQuoteDocs;
    FQuoteLines: TQuoteLines;
    FQuoteSupplies: TQuoteSupplies;
    FPriceUnitFactor: integer;
    FOfficeContactName: string;
    FEstimateFile: string;
    FEstimateFilePath: string;
    FJobBag: integer;
    FQuoteReason: integer;
    FLastEstimateDate: TDateTime;
    FEstimateFileOrig: string;
    FAdhoc: integer;
    FContactName: string;
    FEmail: string;
    FAdhocName: string;
    FPhone: string;
    FQuoteDepts: TQuoteDepts;
    FOriginalQuote: real;
    FProspectQuote: boolean;
    FSubRep: integer;
    FAcquiredCustomer: boolean;
    FEndUserBranch: integer;
    FEndUserCustomer: integer;
    FEndUserCustomerName: string;
    FPackFormat: integer;
    FEnclosingType: string;
    function GetTotalNonInternalCost: currency;
    function GetTotalCost: currency;
    function GetTotalMargin: currency;
    function GetTotalMarginPerc: double;
    function GetTotalRepCost: currency;
    function GetTotalRepMargin: currency;
    function GetTotalRepMarginPerc: double;
    function GetTotalReseller: currency;
    function GetTotalResellerMargin: currency;
    function GetTotalResellerMarginPerc: double;
    function GetTotalSell: currency;
    function GetTotalSSP: currency;
    function GetUnitSell: currency;
    function GetCostingToolUsed: boolean;
    procedure SetBranch(const Value: integer);
    procedure SetBranchName(const Value: string);
    procedure SetContactNo(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetCustOrderNo(const Value: string);
    procedure SetDate(const Value: TDateTime);
    procedure SetDbKey(const Value: real);
    procedure SetDescription(const Value: string);
    procedure SetGoodsRequired(const Value: TDateTime);
    procedure SetInactive(const Value: string);
    procedure SetInactiveDate(const Value: TDateTime);
    procedure SetInactiveReason(const Value: integer);
    procedure SetNarrative(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetOfficeContact(const Value: integer);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetQuantity(const Value: integer);
    procedure SetQuoteStatus(const Value: integer);
    procedure SetRep(const Value: integer);
    procedure SetStartDate(const Value: TDateTime);
    function GetNextQuoteNumber: integer;
    function GetNextReQuoteNumber: real;
    procedure SetQMode(const Value: TQMode);
    procedure SetDescriptiveRef(const Value: string);
    procedure SetDateRequired(const Value: TDateTime);
    procedure SetDateQuoteRequired(const Value: TDateTime);
    procedure SetPriceUnit(const Value: integer);
    procedure SetConvertPercentage(const Value: double);
    procedure DeleteDepartments;
    procedure DeleteDocuments;
    procedure DeleteLines;
    procedure DeleteSupplies;
    function GetQuoteStatus: integer;
    procedure SaveDepartments;
    procedure SaveDocuments;
    procedure SaveLines;
    procedure SaveSupplies;
    procedure SetPriceUnitFactor(const Value: integer);
    procedure SetOfficeContactName(const Value: string);
    procedure SetEstimateFile(const Value: string);
    procedure SetEstimateFilePath(const Value: string);
    procedure SetJobBag(const Value: integer);
    procedure SetQuoteReason(const Value: integer);
    procedure SetLastEstimateDate(const Value: TDateTime);
    procedure SetEstimateFileOrig(const Value: string);
    procedure SetAdhoc(const Value: integer);
    procedure SetAdhocName(const Value: string);
    procedure SetContactName(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetPhone(const Value: string);
    function GetCustomerHasPrices: boolean;
    procedure SetOriginalQuote(const Value: real);
    procedure SetProspectQuote(const Value: boolean);
    procedure SetSubRep(const Value: integer);
    procedure SetAcquiredCustomer(const Value: boolean);
    procedure SetEndUserBranch(const Value: integer);
    procedure SetEndUserCustomer(const Value: integer);
    procedure SetEndUserCustomerName(const Value: string);
    procedure SetEnclosingType(const Value: string);
    procedure SetPackFormat(const Value: integer);
  public
    constructor Create(DataModule : TdtmdlQuotes);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TQuote;
    procedure DeleteFromDB;
    function GetCompanyMarkup: real;
    function GetCustomerMarkup(Customer: integer; var bOverride: boolean; var rMarkup: real): boolean;
    procedure LoadFromDB;
    procedure LoadFromJobBag;
    procedure LoadJobBagLines;
    procedure LoadCostLine;
    procedure LoadLines;
    procedure LoadSupplies;
    procedure LoadDepartments;
    procedure LoadDocuments;
    procedure SaveEstimateFile;
    procedure SaveLastEstimateDate;
    procedure SaveToDB(TempAll: boolean);
    property Adhoc: integer read FAdhoc write SetAdhoc;
    property AdhocName: string read FAdhocName write SetAdhocName;
    property AcquiredCustomer: boolean read FAcquiredCustomer write SetAcquiredCustomer;
    property Branch : integer read FBranch write SetBranch;
    property BranchName : string read FBranchName write SetBranchName;
    property ContactNo: integer read FContactNo write SetContactNo;
    property ContactName: string read FContactName write SetContactName;
    property ConvertPercentage: double read FConvertPercentage write SetConvertPercentage;
    property CostingToolUsed: boolean read GetCostingToolUsed;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property CustomerHasPrices: boolean read GetCustomerHasPrices;
    property DataModule: TdtmdlQuotes read FDataModule;
    property Date : TDateTime read FDate write SetDate;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property DateQuoteRequired: TDateTime read FDateQuoteRequired write SetDateQuoteRequired;
    property DbKey : real read FDbKey write SetDbKey;
    property Departments: TQuoteDepts read FQuoteDepts;
    property Description : string read FDescription write SetDescription;
    property DescriptiveRef: string read FDescriptiveRef write SetDescriptiveRef;
    property Documents : TQuoteDocs read FQuoteDocs;
    property Email: string read FEmail write SetEmail;
    property EnclosingType: string read FEnclosingType write SetEnclosingType;
    property EndUserBranch: integer read FEndUserBranch write SetEndUserBranch;
    property EndUserCustomer: integer read FEndUserCustomer write SetEndUserCustomer;
    property EndUserCustomerName: string read FEndUserCustomerName write SetEndUserCustomerName;
    property EstimateFile: string read FEstimateFile write SetEstimateFile;
    property EstimateFileOrig: string read FEstimateFileOrig write SetEstimateFileOrig;
    property Inactive: string read FInactive write SetInactive;
    property InactiveDate: TDateTime read FInactiveDate write SetInactiveDate;
    property InactiveReason: integer read FInactiveReason write SetInactiveReason;
    property JobBag: integer read FJobBag write SetJobBag;
    property LastEstimateDate: TDateTime read FLastEstimateDate write SetLastEstimateDate;
    property Lines : TQuoteLines read FQuoteLines;
    property Supplies: TQuoteSupplies read FQuoteSupplies;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property OfficeContact: integer read FOfficeContact write SetOfficeContact;
    property OfficeContactName: string read FOfficeContactName write SetOfficeContactName;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property OriginalQuote: real read FOriginalQuote write SetOriginalQuote;
    property PackFormat: integer read FPackFormat write SetPackFormat;
    property Phone: string read FPhone write SetPhone;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitFactor : integer read FPriceUnitFactor write SetPriceUnitFactor;
    property ProspectQuote: boolean read FProspectQuote write SetProspectQuote;
    property QMode: TQMode read FQMode write SetQMode;
    property Quantity: integer read FQuantity write SetQuantity;
    property QuoteReason: integer read FQuoteReason write SetQuoteReason;
    property QuoteStatus: integer read FQuoteStatus write SetQuoteStatus;
    property Rep: integer read FRep write SetRep;
    property SubRep: integer read FSubRep write SetSubRep;
    property StartDate: TDateTime read FStartDate write SetStartDate;
    property TotalNonInternalCost : currency read GetTotalNonInternalCost;
    property TotalCost : currency read GetTotalCost;
    property TotalMargin : currency read GetTotalMargin;
    property TotalMarginPerc : double read GetTotalMarginPerc;
    property TotalRepCost: currency read GetTotalRepCost;
    property TotalRepMargin : currency read GetTotalRepMargin;
    property TotalRepMarginPerc : double read GetTotalRepMarginPerc;
    property TotalReseller: currency read GetTotalReseller;
    property TotalResellerMargin : currency read GetTotalResellerMargin;
    property TotalResellerMarginPerc : double read GetTotalResellerMarginPerc;
    property TotalSell : currency read GetTotalSell;
    property TotalSSP: currency read GetTotalSSP;
    property UnitSell : currency read GetUnitSell;
  end;

implementation

uses
  ComObj, ActiveX, PBNarrativeDM;

{$R *.dfm}

{ TQuote }

procedure TQuote.Clear;
begin
  Customer :=       0;
  CustomerName :=   '';
  Date :=           0;
  Description :=    '';
end;

function TQuote.Clone: TQuote;
begin
  Result := TQuote.Create(FDataModule);
  Result.Adhoc :=           Self.Adhoc;
  Result.AdhocName :=       Self.AdhocName;
  Result.AcquiredCustomer := self.AcquiredCustomer;
  Result.Branch :=          Self.Branch;
  Result.BranchName :=      Self.BranchName;
  Result.ContactNo :=       Self.ContactNo;
  Result.ContactName :=     Self.ContactName;
  Result.ConvertPercentage := Self.ConvertPercentage;
  Result.Customer :=        Self.Customer;
  Result.CustomerName :=    Self.CustomerName;
  Result.Date :=            Self.Date;
  Result.DateRequired :=    Self.DateRequired;
  Result.DateQuoteRequired := Self.DateQuoteRequired;
  Result.DbKey :=           Self.DbKey;
  Result.Description :=     Self.Description;
  Result.DescriptiveRef :=  Self.DescriptiveRef;
  Result.EnclosingType :=   self.EnclosingType;
  Result.Email :=           Self.Email;
  Result.EndUserCustomer := Self.EndUserCustomer;
  Result.EndUserCustomerName := Self.EndUserCustomerName;
  Result.EndUserBranch :=   Self.EndUserBranch;
  Result.EstimateFile :=    Self.EstimateFile;
  Result.EstimateFileOrig :=      Self.EstimateFileOrig;
  Result.Inactive :=        Self.Inactive;
  Result.InactiveDate :=    Self.InactiveDate;
  Result.InactiveReason :=  Self.InactiveReason;
  Result.JobBag :=          Self.JobBag;
  Result.LastEstimateDate :=      Self.LastEstimateDate;
  Result.Narrative :=       Self.Narrative;
  Result.NarrativeText :=   self.NarrativeText;
  Result.OfficeContact :=   Self.OfficeContact;
  Result.OfficeContactName :=   Self.OfficeContactName;
  Result.Operator :=        Self.Operator;
  Result.OperatorName :=    Self.OperatorName;
  Result.OriginalQuote :=   Self.OriginalQuote;
  Result.PackFormat :=      self.PackFormat;
  Result.Phone :=           Self.Phone;
  Result.PriceUnit  :=      Self.PriceUnit;
  Result.PriceUnitFactor  :=      Self.PriceUnitFactor;
  Result.ProspectQuote    :=      self.ProspectQuote;
  Result.Quantity :=        Self.Quantity;
  Result.Rep :=             Self.Rep;
  Result.SubRep :=          self.SubRep;
  Result.StartDate  :=      Self.StartDate;
  Result.FQuoteLines.Free;
  Result.FQuoteLines :=    Self.FQuoteLines.Clone;
  Result.FQuoteSupplies.Free;
  Result.FQuoteSupplies :=   Self.FQuoteSupplies.Clone;
  Result.FQuoteDocs.Free;
  Result.FQuoteDocs :=   Self.FQuoteDocs.Clone;
  Result.FQuoteDepts.Free;
  Result.FQuoteDepts :=   Self.FQuoteDepts.Clone;
end;

constructor TQuote.Create(DataModule: TdtmdlQuotes);
begin
  FDataModule := DataModule;
  FQuoteLines := TQuoteLines.Create(Self);
  FQuoteSupplies := TQuoteSupplies.Create(Self);
  FQuoteDocs := TQuoteDocs.Create(Self);
  FQuoteDepts := TQuoteDepts.Create(Self);
end;

procedure TQuote.DeleteFromDB;
begin
  DeleteLines;
  DeleteSupplies;
  DeleteDepartments;
  DeleteDocuments;
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote WHERE Quote =' + floatToStr(DbKey));
    ExecSQL;
  end;
end;

destructor TQuote.Destroy;
begin
  FQuoteLines.Free;
  FQuoteSupplies.Free;
  FQuoteDocs.Free;
  FQuoteDepts.Free;
  inherited;
end;

function TQuote.GetTotalCost: currency;
var
  i: integer;
begin
  result := 0.000;
  for i := 0 to Pred(FQuoteLines.Count) do
    begin
      if FQuoteLines[i].InternalCostLine then
        continue;

      if FQuoteLines[i].PriceUnitFactor = 0 then
        result := Result + FQuoteLines[i].UnitCost
      else
        result := Result + FQuoteLines[i].UnitCost*(FQuoteLines[i].Quantity/FQuoteLines[i].PriceUnitFactor);
    end;

  for i := 0 to Pred(FQuoteSupplies.Count) do
    begin
      if FQuoteSupplies[i].PriceUnitFactor = 0 then
        result := Result + FQuoteSupplies[i].UnitCost
      else
        result := Result + FQuoteSupplies[i].UnitCost*(FQuoteSupplies[i].Quantity/FQuoteSupplies[i].PriceUnitFactor);
    end;
end;

function TQuote.GetTotalNonInternalCost: currency;
var
  i: integer;
begin
  result := 0.000;
  for i := 0 to Pred(FQuoteLines.Count) do
    begin
      if FQuoteLines[i].InternalCostLine then
        continue;
      if FQuoteLines[i].PriceUnitFactor = 0 then
        result := Result + FQuoteLines[i].UnitCost
      else
        result := Result + FQuoteLines[i].UnitCost*(FQuoteLines[i].Quantity/FQuoteLines[i].PriceUnitFactor);
    end;
  for i := 0 to Pred(FQuoteSupplies.Count) do
    begin
      if FQuoteSupplies[i].PriceUnitFactor = 0 then
        result := Result + FQuoteSupplies[i].UnitCost
      else
        result := Result + FQuoteSupplies[i].UnitCost*(FQuoteSupplies[i].Quantity/FQuoteSupplies[i].PriceUnitFactor);
    end;
end;

function TQuote.GetTotalMargin: currency;
begin
  result := TotalSell - TotalCost;
end;

function TQuote.GetTotalMarginPerc: double;
begin
  if FQuoteLines.Count = 0 then
    Result := 0
  else
  if TotalSell <> 0 then
    result := ((TotalMargin)/TotalSell)*100
  else
    Result := -999999;
end;

function TQuote.GetTotalSell: currency;
var
  i: integer;
begin
  result := 0.000;
  for i := 0 to Pred(FQuoteLines.Count) do
    begin
      if FQuoteLines[i].PriceUnitFactor = 0 then
        result := Result + FQuoteLines[i].UnitSell
      else
        result := Result + FQuoteLines[i].UnitSell*(FQuoteLines[i].Quantity/FQuoteLines[i].PriceUnitFactor);
    end;
  for i := 0 to Pred(FQuoteSupplies.Count) do
    begin
      if FQuoteSupplies[i].PriceUnitFactor = 0 then
        result := Result + FQuoteSupplies[i].UnitSell
      else
        result := Result + FQuoteSupplies[i].UnitSell*(FQuoteSupplies[i].Quantity/FQuoteSupplies[i].PriceUnitFactor);
    end;
end;

function TQuote.GetTotalSSP: currency;
var
  i: integer;
begin
  result := 0.000;
  for i := 0 to Pred(FQuoteLines.Count) do
    begin
      if FQuoteLines[i].PriceUnitFactor = 0 then
        result := Result + FQuoteLines[i].UnitSSP
      else
        result := Result + FQuoteLines[i].UnitSSP*(FQuoteLines[i].Quantity/FQuoteLines[i].PriceUnitFactor);
    end;
  for i := 0 to Pred(FQuoteSupplies.Count) do
    begin
      if FQuoteSupplies[i].PriceUnitFactor = 0 then
        result := Result + FQuoteSupplies[i].UnitSell
      else
        result := Result + FQuoteSupplies[i].UnitSell*(FQuoteSupplies[i].Quantity/FQuoteSupplies[i].PriceUnitFactor);
    end;
end;

function TQuote.GetTotalRepCost: currency;
var
  i: integer;
begin
  result := 0.000;
  for i := 0 to Pred(FQuoteLines.Count) do
    begin
      if FQuoteLines[i].PriceUnitFactor = 0 then
        result := Result + FQuoteLines[i].UnitCost
      else
        result := Result + FQuoteLines[i].UnitCost*(FQuoteLines[i].Quantity/FQuoteLines[i].PriceUnitFactor);
    end;

  for i := 0 to Pred(FQuoteSupplies.Count) do
    begin
      if FQuoteSupplies[i].PriceUnitFactor = 0 then
        result := Result + FQuoteSupplies[i].UnitCost
      else
        result := Result + FQuoteSupplies[i].UnitCost*(FQuoteSupplies[i].Quantity/FQuoteSupplies[i].PriceUnitFactor);
    end;
end;

function TQuote.GetTotalRepMargin: currency;
begin
  result := TotalSell - TotalRepCost;
end;

function TQuote.GetTotalRepMarginPerc: double;
begin
  if FQuoteLines.Count = 0 then
    Result := 0
  else
  if TotalSell <> 0 then
    result := ((TotalRepMargin)/TotalSell)*100
  else
    Result := -999999;
end;

procedure TQuote.LoadFromDB;
begin
  Clear;
  with FDataModule.qryQHeader do
  begin
    Close;
    ParamByName('Quote').Asfloat := DbKey;
    Open;

    if qMode = qCopy then
      QuoteStatus :=    10
    else
      QuoteStatus :=    FieldbyName('Quote_Status').AsInteger;

    Adhoc :=          Fieldbyname('Ad_Hoc_Address').asinteger;
    AdhocName :=      Fieldbyname('Ad_Hoc_Name').asstring;
    AcquiredCustomer := (Fieldbyname('Customer_is_Acquired').asstring = 'Y');

    OfficeContact :=
                      FieldByName('Office_Contact').asinteger;
    OfficeContactName :=
                      FieldByName('Office_Contact_Name').asstring;
    Branch :=         FieldByName('Branch_No').AsInteger;
    BranchName :=     FieldByName('Branch_Name').AsString;
    Customer :=       FieldByName('Customer').AsInteger;
    CustomerName :=   FieldByName('Cust_Name').AsString;
    ContactNo :=      FieldByName('Contact_no').Asinteger;
    ContactName :=    Fieldbyname('Contact_Name').asstring;
    Date :=           FieldByName('Date_Point').AsDateTime;
    Description :=    FieldByName('Description').AsString;
    DescriptiveRef := FieldByName('Descriptive_Reference').AsString;
    DateRequired :=   FieldByName('Date_Required').AsDateTime;
    DateQuoteRequired :=   FieldByName('Quote_Required_By').AsDateTime;

    EnclosingType := FieldbyName('Enclosing_Type').asstring;

    Email :=          Fieldbyname('Email').asstring;

    EndUserCustomer :=  FieldByName('End_User_Customer').AsInteger;
    EndUserBranch :=  FieldByName('End_User_Branch_No').AsInteger;
    EndUserCustomerName := FieldByName('End_User_Customer_Name').Asstring;

    OfficeContact :=  FieldByName('Office_Contact').Asinteger;
    Quantity :=       FieldByName('Quantity').Asinteger;
    JobBag :=         FieldByName('Job_Bag').asinteger;

    LastEstimateDate :=    Fieldbyname('Date_Last_Estimated').asdatetime;
    ProspectQuote := (fieldbyname('Prospect_Quote').asstring = 'Y');

    if (qMode = qRepeat) or (qMode = qCopy) or (qMode = qReQuote) then
      begin
        Rep :=          FDataModule.GetCustomerRep(Customer, Branch);
        SubRep :=          FDataModule.GetCustomerSubRep(Customer, Branch);
        EstimateFile := '';
      end
    else
      begin
        Rep :=            FieldbyName('Rep').asinteger;
        SubRep :=            FieldbyName('Sub_Rep').asinteger;
        if (SubRep = 0) and not ProspectQuote then
          SubRep :=          FDataModule.GetCustomerSubRep(Customer, Branch);

        EstimateFile :=   FieldbyName('Estimate_File').asstring;
      end;

    EstimateFileOrig := FieldbyName('Estimate_File').asstring;

    Narrative :=      FieldByName('Narrative').AsInteger;
    NarrativeText :=  FDataModule.GetNarrative(Narrative);

    if (qMode = qReQuote) or (qMode = qRepeat) then
      OriginalQuote :=  floor(fieldbyname('Quote').asfloat)
    else
    if (qMode = qCopy) then
      OriginalQuote :=  0
    else
      OriginalQuote :=  floor(fieldbyname('Original_Quote').asfloat);

    if FieldbyName('Inactive').asstring = 'Y' then
      inactive  :=    'Y'
    else
      inactive :=     'N';

    PackFormat :=           Fieldbyname('Pack_Format_ID').asinteger;
    Phone :=          fieldbyname('Phone').asstring;
    QuoteReason := fieldbyname('Quote_Reason').asinteger;
    try
      if fieldbyname('Date_Start').asstring = '' then
        StartDate :=  date
      else
        StartDate :=  fieldbyname('Date_Start').asdatetime;
    except
      StartDate :=  date;
    end;

    Operator :=       Fieldbyname('Operator').asinteger;
    OperatorName :=   Fieldbyname('Operator_Name').asstring;
    PriceUnit :=   Fieldbyname('Price_Unit').asinteger;
    PriceUnitFactor :=   Fieldbyname('Price_Unit_Factor').asinteger;
    ConvertPercentage :=   Fieldbyname('Convert_Percentage').asfloat;

    Close;
  end;
  LoadLines;
   LoadDepartments;
  if (qMode <> qCopy) and (qMode <> qRepeat) and (qMode <> qReQuote) then
    begin
      LoadSupplies;
      LoadDocuments;
    end;
end;

procedure TQuote.LoadLines;
var
  aLine : TQuoteLine;
  icount: integer;
  rMarkup: real;
  Result, bOverride: boolean;
begin
  icount := 0;
  FQuoteLines.Clear;

  with FDataModule.qryQAllLines do
  begin
    Close;
    ParamByName('Quote').Asfloat := DbKey;
    Open;
    while not(EOF) do
    begin
      inc(icount);
      aLine := TQuoteLine.Create(Self);
      aLine.QuoteLineNo := fieldbyname('Quote_Line_No').asinteger;
      aLine.CatNumber := fieldbyname('Category_Number').asinteger;
      aLine.CostNumber := fieldbyname('Cost_Number').asinteger;
      aLine.CostingToolFlag := (fieldbyname('Costing_Tool_Flag').asstring = 'Y');
      aLine.Description := fieldbyname('Quote_Line_Description').asstring;
      aLine.UnitCost := fieldbyname('Unit_Cost').asfloat;
      aLine.UnitResellerPrice := fieldbyname('Reseller_Price').asfloat;
      aLine.UnitSell := fieldbyname('Unit_Price').asfloat;
      aLine.UnitSSP := fieldbyname('Unit_SSP').asfloat;
      aLine.UnitCostOHD := fieldbyname('Unit_Cost_Plus_OHD').asfloat;
      aLine.UnitSSPOrig := fieldbyname('Unit_SSP_Original').asfloat;
      aLine.Quantity := fieldbyname('Quantity').asinteger;
      aLine.InternalCostLine := (fieldbyname('Line_Is_Internal_Cost').asstring = 'Y');
      aLine.InternalCostMarkupPercentage := fieldbyname('Quote_Cost_Markup_Perc').asfloat;
      aLine.LineConverted := (fieldbyname('Line_Converted').asstring = 'Y');
      aLine.NoOfHours := fieldbyname('No_of_Hours').asfloat;
      aLine.PriceUnit := fieldbyname('Price_Unit').asinteger;
      aLine.PriceUnitFactor := fieldbyname('Price_Unit_Factor').asinteger;
      aLine.PriceUnitDesc := fieldbyname('Price_Unit_Description').asstring;
      aLine.Process := fieldbyname('Process').asinteger;
      aLine.ProcessDesc := FDataModule.GetProcessDescription(aLine.Process);
      aLine.ProcessGroup := fieldbyname('Process_Group').asinteger;
      aLine.ProductType := fieldbyname('Product_Type').asinteger;
      aLine.ProductTypeDesc := fieldbyname('Product_Type_Description').asstring;
      aLine.Sequence := icount;
      aLine.SubNumber := fieldbyName('Sub_Category').asinteger;
      aLine.JustMoved := False;
      aLine.TeamCount := fieldbyname('Team_Count').AsInteger;
      aLine.VatCode := fieldbyname('Vat_Code').AsInteger;
      aLine.WorkCentre := fieldbyname('Work_Centre').asinteger;
      aLine.WorkCentreGroup := fieldbyname('Work_Centre_Group').asinteger;
      aLine.InternalCostLine := (fieldbyname('Line_Is_Internal_Cost').asstring = 'Y');

      if aLine.InternalCostLine then
        begin
          if (qMode = qRepeat) or (qMode = qCopy) or (qMode = qReQuote) then
            begin
              {Get the customer and check if there is an ovveride on the cost markup}
              bOverride := false;
              rMarkup := dmBroker.GetDefaultCostMarkupPerc;
              {The Override is checked and markup set within the function}
              Result := self.GetCustomerMarkup(Customer, bOverride, rMarkup);
              aLine.InternalCostMarkupPercentage := rMarkup;
            end
          else
            aLine.InternalCostMarkupPercentage := fieldbyname('Quote_Cost_Markup_Perc').asfloat;
        end
      else
        aLine.InternalCostMarkupPercentage := 0.00;

      FQuoteLines.Add(aLine);
      next
    end;
  end;
  if iCount = 0 then
    begin
      LoadCostLine;
    end;

  {Check if cost line has been added when copying or requoting}
  if (qMode = qcopy) or (qMode = qRequote) then
    begin
      for icount := 0 to pred(lines.Count) do
        begin
          if lines[icount].InternalCostLine then
            exit;
        end;
      LoadCostLine;
    end;
end;

procedure TQuote.LoadJobBagLines;
var
  aLine : TQuoteLine;
  icount: integer;
  rMarkup: real;
  Result, bOverride: boolean;
begin
  icount := 0;
  FQuoteLines.Clear;

  with FDataModule.qryJBAllLines do
  begin
    Close;
    ParamByName('JobBag').AsInteger := FDataModule.JobNo;
    Open;
    while not(EOF) do
    begin
      inc(icount);
      aLine := TQuoteLine.Create(Self);
      aLine.QuoteLineNo := icount;
      aLine.CatNumber := fieldbyname('Category_Number').asinteger;
      aLine.CostNumber := fieldbyname('Cost_Number').asinteger;
      aLine.CostingToolFlag := false;
      aLine.Description := fieldbyname('Job_Bag_Line_Descr').asstring;
      aLine.UnitCost := fieldbyname('Unit_Cost').asfloat;
      aLine.UnitResellerPrice := fieldbyname('Reseller_Price').asfloat;
      aLine.UnitSell := fieldbyname('Selling_Price').asfloat;
      aLine.UnitSSP := fieldbyname('Unit_SSP').asfloat;
      aLine.UnitCostOHD := fieldbyname('Unit_Cost_Plus_OHD').asfloat;
      aLine.UnitSSPOrig := fieldbyname('Unit_SSP_Original').asfloat;
      aLine.Quantity := fieldbyname('Job_Bag_Quantity').asinteger;
      aLine.InternalCostLine := (fieldbyname('Line_Is_Internal_Cost').asstring = 'Y');
      aLine.InternalCostMarkupPercentage := fieldbyname('Job_Cost_Markup_Perc').asfloat;
      aLine.LineConverted := false;
      aLine.NoOfHours := 0;
      aLine.PriceUnit := fieldbyname('Price_Unit').asinteger;
      aLine.PriceUnitFactor := fieldbyname('Price_Unit_Factor').asinteger;
      aLine.PriceUnitDesc := fieldbyname('Price_Unit_Description').asstring;
      if fieldbyname('Process').asinteger > 0 then
        aLine.Process := fieldbyname('Process').asinteger
      else
        aLine.Process := fieldbyname('Product_Type_Process').asinteger ;

      aLine.ProcessDesc := FDataModule.GetProcessDescription(aLine.Process);

      if fieldbyname('Process_Group').asinteger > 0 then
        aLine.ProcessGroup := fieldbyname('Process_Group').asinteger
      else
        aLine.ProcessGroup := fieldbyname('Product_Type_Process_Group').asinteger;

      aLine.ProductType := fieldbyname('Product_Type').asinteger;
      aLine.ProductTypeDesc := fieldbyname('Product_Type_Description').asstring;
      aLine.Sequence := icount;
      aLine.SubNumber := fieldbyName('Sub_Category').asinteger;
      aLine.JustMoved := False;
      aLine.TeamCount := 1;
      aLine.VatCode := fieldbyname('Vat_Code').AsInteger;
      aLine.WorkCentre := 0;
      aLine.WorkCentreGroup := 0;
      aLine.InternalCostLine := (fieldbyname('Line_Is_Internal_Cost').asstring = 'Y');

      if aLine.InternalCostLine then
        begin
          if (qMode = qRepeat) or (qMode = qCopy) or (qMode = qReQuote) then
            begin
              {Get the customer and check if there is an ovveride on the cost markup}
              bOverride := false;
              rMarkup := dmBroker.GetDefaultCostMarkupPerc;
              {The Override is checked and markup set within the function}
              Result := self.GetCustomerMarkup(Customer, bOverride, rMarkup);
              aLine.InternalCostMarkupPercentage := rMarkup;
            end
          else
            aLine.InternalCostMarkupPercentage := fieldbyname('Job_Cost_Markup_Perc').asfloat;
        end
      else
        aLine.InternalCostMarkupPercentage := 0.00;

      FQuoteLines.Add(aLine);
      next
    end;
  end;
  if iCount = 0 then
    begin
      LoadCostLine;
    end;

(*      aLine.CurrencyCode := FieldByName('Currency_Code').AsInteger;
      aLine.JBLine :=  FieldByName('Job_Bag_Line').AsInteger;
      aLine.JBLineType := FieldByName('Job_Bag_Line_Type').AsString[1];
      aLine.PurchaseOrder := FieldByName('Purchase_Order').asfloat;
      aLine.Line := FieldByName('Line').AsInteger;
      aLine.Supplier:= FieldByName('Supplier').AsInteger;
      aLine.BranchNo := FieldByName('Branch_No').AsInteger;
      aLine.SupplierName:= FieldByName('SupplierName').AsString;
      aLine.BranchName := FieldByName('BranchName').AsString;
      aLine.JBLineDescr := FieldByName('Job_Bag_Line_Descr').AsString;
      aLine.JBLineCost := FieldByName('Job_Bag_Line_Cost').AsFloat;
      aLine.JBLineSell := FieldByName('Job_Bag_Line_Sell').AsFloat;
      aLine.JBLineReseller := FieldByName('Job_Bag_Line_Reseller').AsFloat;

      if aLine.PurchaseOrder <> 0 then
        aLine.JBLineInactive := aLine.GetJBLineInactive(aLine.PurchaseOrder,aLine.Line)
      else
        begin
          stest := trim(fieldbyname('Line_Inactive').AsString);
          if stest = 'Y' then
            aLine.JBLineInactive := true
          else
            aLine.JBLineInactive := false;
        end;

      aLine.Quote := fieldbyname('Quote').asfloat;
      aLine.QuoteLineNo := fieldbyname('Quote_Line_no').asinteger;

      aLine.SONumber := FieldByName('Sales_Order').asinteger;
      aLine.SOLineNo := FieldByName('Sales_Order_Line_no').AsInteger;

      if aLine.PurchaseOrder <> 0 then
        aLine.JBLineInvoiced := aLine.GetPOLineStatus(aLine.PurchaseOrder,aLine.Line)
      else
      if aLine.SONumber <> 0 then
        aLine.JBLineInvoiced := aLine.GetSOLineStatus(aLine.SONumber, aLine.SOLineNo)
      else
        aLine.JBLineInvoiced := FieldByName('Job_Bag_Line_Invoiced').AsString;

      aLine.JBQtyInvoiced := FieldbyName('Qty_Invoiced').asinteger;
      aLine.JBLinePurchInvd := FieldByName('supp_inv_recd').AsString = 'Y';
      aLine.JBQuantity := FieldByName('Job_Bag_Quantity').AsInteger;
      aLine.ProductType := FieldByName('Product_Type').AsInteger;
      aLine.VATCode := FieldByName('VAT_Code').AsInteger;
      aLine.VATDescription := FieldByName('VAT_Description').AsString;
      aLine.WONumber := FieldbyName('Works_Order').asinteger;
      aLine.WorksOrderNumber := FDataModule.GetWONumber(aLine.WONumber);
      aLine.Process := FieldbyName('Process').asinteger;
      aLine.PriceUnit := Fieldbyname('Price_Unit').asinteger;
      aLine.ResellerPrice := Fieldbyname('Reseller_Price').asfloat;
      aLine.SellPrice := Fieldbyname('Selling_Price').asfloat;
      aLine.CostPrice := FieldbyName('Unit_Cost').asfloat;
      aLine.SuggPrice := fieldbyName('Unit_SSP').asfloat;
      aLine.CostPriceOHD := FieldbyName('Unit_Cost_plus_OHD').asfloat;
      aLine.SSPOrig := fieldbyName('Unit_SSP_Original').asfloat;
      aLine.JBLineMode := 'C';
      aLine.JBLineStatus := Fieldbyname('Job_Bag_line_status').asinteger;
      if aLine.PurchaseOrder <> 0 then
        begin
          aLine.JBLineStatusText := FDataModule.GetPOStatus(aLine.PurchaseOrder, aLine.Line, dbKey, aLine.JBLine, aLine.JBLineInvoiced);
        end
      else
      if aLine.SONumber <> 0 then
        begin
          aLine.JBLineStatusText := FDataModule.GetSOStatus(aLine.SONumber, dbKey, aLine.JBLine, aLine.JBLineInvoiced);
        end
      else
        begin
          aLine.JBLineStatusText := FDataModule.GetSundryStatus(dbKey, aLine.JBLine, aLine.JBLineInvoiced);
          if aLine.JBLineInactive then
            aLine.JBLineStatusText := '*Deleted*';
        end;

      aLine.Sequence := icount;
      aLine.JustMoved := false;
      aLine.ReadyToInvoice := fieldbyname('Ready_to_invoice').asstring;
      aLine.ClearedFundsReq := FDataModule.GetPOClearedFunds(aLine.PurchaseOrder, aline.Line);
      aLine.ClearedFundsRec := FDataModule.GetInvClearedFunds(aLine.PurchaseOrder, aLine.Line);
      aLine.NeedsAuthorising := FDataModule.GetPOAuthorised(aLine.PurchaseOrder);

      aLine.InternalCostLine := (fieldbyname('Line_Is_Internal_Cost').asstring = 'Y');
      aLine.InternalCostMarkupPercentage := fieldbyname('Job_Cost_Markup_Perc').asfloat;
*)
end;

procedure TQuote.LoadCostLine;
var
  aLine : TQuoteLine;
  rMarkup: real;
  Result, bOverride: boolean;
begin
  with FDataModule.qryGetQuoteCostDefaults do
    begin
      close;
      open;

      if fieldbyname('Default_Quote_Cost_Process').asinteger <> 0 then
        begin
          {Get the customer and check if there is an ovveride on the cost markup}
          bOverride := false;
          rMarkup := fieldbyname('Default_Quote_Cost_markup_perc').asfloat;
          Result := self.GetCustomerMarkup(Customer, bOverride, rMarkup);
          if result and not bOverride then
            rMarkup := fieldbyname('Default_Quote_Cost_markup_perc').asfloat;

          aLine := TQuoteLine.Create(Self);
          aLine.QuoteLineNo := 1;
          aLine.CatNumber := 0;
          aLine.CostNumber := 0;
          aLine.CostingToolFlag := false;
          aLine.Description := fieldbyname('Default_Quote_Cost_Description').asstring;
          aLine.UnitSell := 0;
          aLine.UnitSSP := 0;
          aLine.UnitCostOHD := 0;
          aLine.UnitSSPOrig := 0;
          aLine.Quantity := 1;
          aLine.LineConverted := false;
          aLine.NoOfHours := 0;
          aLine.PriceUnit := 2;
          aLine.PriceUnitFactor := 0;
          aLine.PriceUnitDesc := 'Per Job';
          aLine.Process := fieldbyname('Default_Quote_Cost_Process').asinteger;
          aLine.ProcessDesc := FDataModule.GetProcessDescription(aLine.Process);
          aLine.ProcessGroup := fieldbyname('Process_Group').asinteger;
          aLine.ProductType := fieldbyname('Product_Type').asinteger;
          aLine.ProductTypeDesc := fieldbyname('Product_Type_Description').asstring;
          aLine.Sequence := 0;
          aLine.SubNumber := 0;
          aLine.JustMoved := False;
          aLine.TeamCount := 0;
          aLine.VatCode := fieldbyname('Vat_Code').AsInteger;
          aLine.WorkCentre := 0;
          aLine.WorkCentreGroup := 0;
          aLine.InternalCostLine := true;
          aLine.InternalCostMarkupPercentage := rMarkup;
//          aLine.InternalCostMarkupPercentage := fieldbyname('Default_Quote_Cost_markup_perc').asfloat;
          aLine.UnitCost := (self.TotalNonInternalCost * (aLine.InternalCostMarkupPercentage/100));
          FQuoteLines.Add(aLine);
        end;
    end;
end;

function TQuote.GetNextQuoteNumber: integer;
begin
  dmBroker.LockCompanyRecord;
  try
    try
      with FDataModule.GetLastQuoteSQL do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Quote_Number').AsInteger + 1;
        Close;
      end;
      with FDataModule.UpdLastQuoteSQL do
      begin
        ParamByName('Last_Quote_Number').Asinteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Quote number:' + #13 + E.Message);
    end;
    end;
  finally
    dmBroker.FreeCompanyRecord;
  end;
end;

function TQuote.GetNextReQuoteNumber: real;
begin
  try
    with FDataModule.qryReQuoteCount do
      begin
        Close;
        parambyname('Original_Quote').asfloat := OriginalQuote;
        Open;
        Result := OriginalQuote + ((FieldByName('ReQuote_Count').AsInteger + 1)/100);
         Close;
      end;
  except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Quote number:' + #13 + E.Message);
    end;
  end;
end;

procedure TQuote.SaveEstimateFile;
begin
  with FDataModule.qryQUpdEstimateFile do
    begin
      close;
      parambyname('Quote').asfloat := dbkey;
      parambyname('Estimate_File').asstring := EstimateFile;
      execsql;
    end;
end;

procedure TQuote.SaveLastEstimateDate;
begin
  with FDataModule.qryQUpdEstimateDate do
    begin
      close;
      parambyname('Quote').asfloat := dbkey;
      parambyname('Date_Last_Estimated').asdatetime := now;
      execsql;
    end;
end;

procedure TQuote.SaveToDB(TempAll: boolean);
var
  iTempNarr: integer;
begin
  if DbKey = 0 then
    begin
      if (qMode = qReQuote) then
        dbkey   := GetNextReQuoteNumber
      else
        dbKey     := GetNextQuoteNumber;

      with FDataModule.qryQAddHeader do
        begin
          ParamByName('Quote').Asfloat := DbKey;

          if adhoc = 0 then
            ParamByName('Ad_hoc_Address').clear
          else
            ParamByName('Ad_hoc_Address').AsInteger := Adhoc;

          if customer = 0 then
            begin
              ParamByName('Branch_no').clear;
              ParamByName('Customer').clear;
              ParamByName('Contact_no').clear;
            end
          else
            begin
              ParamByName('Branch_no').AsInteger := Branch;
              ParamByName('Customer').AsInteger := Customer;
              ParamByName('Contact_no').AsInteger := ContactNo;
              ParamByName('Ad_hoc_Address').clear
            end;

          ParamByName('Contact_Name').Asstring := ContactName;

          if CustomerName <> '' then
            ParamByName('Customer_Name').Asstring := CustomerName
          else
            ParamByName('Customer_Name').Asstring := AdhocName;

          ParamByName('Email').Asstring := Email;

          ParamByName('Quote_Status').Asinteger := GetQuoteStatus;
          ParamByName('Quote_Required_By').asDateTime := DateQuoteRequired;
          ParamByName('Date_Point').AsDateTime := Date;
          ParamByName('Date_Start').AsDateTime := StartDate;
          ParamByName('Date_Required').AsDateTime := DateRequired;
          ParamByName('Office_Contact').Asinteger := OfficeContact;
          ParamByName('Description').AsString := Description;
          ParamByName('Estimate_File').AsString := EstimateFile;

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

          Parambyname('Operator').AsInteger := frmPBMainMenu.iOperator;
          ParamByName('Descriptive_Reference').AsString := DescriptiveRef;
          ParamByName('Quantity').Asinteger := Quantity;

          Parambyname('Enclosing_Type').asstring := EnclosingType;

          if PackFormat = 0 then
            Parambyname('Pack_Format_ID').clear
          else
            Parambyname('Pack_Format_ID').asinteger := PackFormat;

          ParamByName('Phone').Asstring := Phone;

          ParamByName('Rep').Asinteger := Rep;

          if SubRep = 0 then
            ParamByName('Sub_Rep').clear
          else
            ParamByName('Sub_Rep').Asinteger := SubRep;

          Parambyname('Inactive').asstring := Inactive;
          Parambyname('Date_Last_Estimated').AsDateTime := LastEstimateDate;
          if Inactive = 'N' then
            Parambyname('Quote_Reason').clear
          else
            Parambyname('Quote_Reason').asinteger := QuoteReason;
          iTempNarr := Narrative;
          FDataModule.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Narrative').clear
          else
            ParamByName('Narrative').Asinteger := Narrative;
          Parambyname('Total_Cost_Value').asfloat := TotalCost;
          Parambyname('Total_Sales_Value').asfloat := TotalSell;
          Parambyname('Total_Suggested_Value').asfloat := TotalSSP;
          if PriceUnit = 0 then
            Parambyname('Price_Unit').clear
          else
            Parambyname('Price_Unit').asinteger := PriceUnit;
          Parambyname('Convert_Percentage').asfloat := ConvertPercentage;
          Parambyname('Original_Quote').asfloat := OriginalQuote;

          if ProspectQuote then
            Parambyname('Prospect_Quote').asstring := 'Y'
          else
            Parambyname('Prospect_Quote').asstring := 'N';

          ExecSQL;
        end;
      dmBroker.CreateQuoteDocDirectory(floattostr(dbKey));
    end
  else
  if TempAll then
    begin
      with FDataModule.qryQUpdHeader do
        begin
          ParamByName('Quote').Asfloat := DbKey;
          if adhoc = 0 then
            ParamByName('Ad_hoc_Address').clear
          else
            ParamByName('Ad_hoc_Address').AsInteger := Adhoc;

          if customer = 0 then
            begin
              ParamByName('Branch_no').clear;
              ParamByName('Customer').clear;
              ParamByName('Contact_no').clear;
            end
          else
            begin
              ParamByName('Branch_no').AsInteger := Branch;
              ParamByName('Customer').AsInteger := Customer;
              ParamByName('Contact_no').AsInteger := ContactNo;
              ParamByName('Ad_hoc_Address').clear
            end;

          ParamByName('Contact_Name').Asstring := ContactName;

          if CustomerName <> '' then
            ParamByName('Customer_Name').Asstring := CustomerName
          else
            ParamByName('Customer_Name').Asstring := AdhocName;

          ParamByName('Email').Asstring := Email;

          ParamByName('Quote_Status').Asinteger := GetQuoteStatus;
          ParamByName('Quote_Required_By').asDateTime := DateQuoteRequired;
          ParamByName('Date_Point').AsDateTime := Date;
          ParamByName('Date_Start').AsDateTime := StartDate;
          ParamByName('Date_Required').AsDateTime := DateRequired;
          ParamByName('Office_Contact').Asinteger := OfficeContact;
          ParamByName('Description').AsString := Description;
          ParamByName('Descriptive_Reference').AsString := DescriptiveRef;
          ParamByName('Estimate_File').AsString := EstimateFile;

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

          ParamByName('Quantity').Asinteger := Quantity;

          Parambyname('Enclosing_Type').asstring := EnclosingType;

          if PackFormat = 0 then
            Parambyname('Pack_Format_ID').clear
          else
            Parambyname('Pack_Format_ID').asinteger := PackFormat;

          ParamByName('Phone').Asstring := Phone;
          ParamByName('Rep').Asinteger := Rep;

          if SubRep = 0 then
            ParamByName('Sub_Rep').clear
          else
            ParamByName('Sub_Rep').Asinteger := SubRep;

          Parambyname('Inactive').asstring := Inactive;
          Parambyname('Date_Last_Estimated').AsDateTime := LastEstimateDate;
          if Inactive = 'N' then
            Parambyname('Quote_Reason').clear
          else
            Parambyname('Quote_Reason').asinteger := QuoteReason;
          iTempNarr := Narrative;
          FDataModule.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Narrative').clear
          else
            ParamByName('Narrative').Asinteger := Narrative;
          Parambyname('Total_Cost_Value').asfloat := TotalCost;
          Parambyname('Total_Sales_Value').asfloat := TotalSell;
          Parambyname('Total_Suggested_Value').asfloat := TotalSSP;
          if PriceUnit = 0 then
            Parambyname('Price_Unit').clear
          else
            Parambyname('Price_Unit').asinteger := PriceUnit;
          Parambyname('Convert_Percentage').asfloat := ConvertPercentage;
          Parambyname('Original_Quote').asfloat := OriginalQuote;

          if ProspectQuote then
            Parambyname('Prospect_Quote').asstring := 'Y'
          else
            Parambyname('Prospect_Quote').asstring := 'N';

          ExecSQL;
        end;
    end;
  SaveLines;
  SaveSupplies;
  SaveDepartments;
  SaveDocuments;
end;

procedure TQuote.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TQuote.SetBranchName(const Value: string);
begin
  FBranchName := Value;
end;

procedure TQuote.SetContactNo(const Value: integer);
begin
  FContactNo := Value;
end;

procedure TQuote.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TQuote.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TQuote.SetCustOrderNo(const Value: string);
begin
  FCustOrderNo := Value;
end;

procedure TQuote.SetDate(const Value: TDateTime);
begin
  FDate := Value;
end;

procedure TQuote.SetDbKey(const Value: real);
begin
  FDbKey := Value;
end;

procedure TQuote.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TQuote.SetGoodsRequired(const Value: TDateTime);
begin
  FGoodsRequired := Value;
end;

procedure TQuote.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TQuote.SetInactiveDate(const Value: TDateTime);
begin
  FInactiveDate := Value;
end;

procedure TQuote.SetInactiveReason(const Value: integer);
begin
  FInactiveReason := Value;
end;

procedure TQuote.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TQuote.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TQuote.SetOfficeContact(const Value: integer);
begin
  FOfficeContact := Value;
end;

procedure TQuote.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TQuote.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TQuote.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TQuote.SetQuoteStatus(const Value: integer);
begin
  FQuoteStatus := Value;
end;

procedure TQuote.SetRep(const Value: integer);
begin
  FRep := Value;
end;

procedure TQuote.SetStartDate(const Value: TDateTime);
begin
  FStartDate := Value;
end;

procedure TQuote.SetQMode(const Value: TQMode);
begin
  FQMode := Value;
end;

procedure TQuote.SetDescriptiveRef(const Value: string);
begin
  FDescriptiveRef := Value;
end;

procedure TQuote.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TQuote.SetDateQuoteRequired(const Value: TDateTime);
begin
  FDateQuoteRequired := Value;
end;

procedure TQuote.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TQuote.SetConvertPercentage(const Value: double);
begin
  FConvertPercentage := Value;
end;

procedure TQuote.DeleteLines;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_Line WHERE Quote = ' + floatToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TQuote.SaveLines;
var
  i : integer;
begin
  DeleteLines;  { Get rid of any already in database }
  FQuoteLines.Renumber;
  for i := 0 to Pred(FQuoteLines.Count) do
    begin
      FQuoteLines[i].SaveToDB;
    end;
end;

function TdtmdlQuotes.GetHeaderCount: integer;
begin
  result := qryQHeaderGrid.RecordCount;
end;

function TdtmdlQuotes.GetNarrative(const iNarrative: integer): string;
var
  Narrative : TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

procedure TdtmdlQuotes.RefreshDataJB;
var
  sTemp : string;
begin
  qryQuotesJB.close;
  qryQuotesJB.sql.clear;
  qryQuotesJB.sql.text := qryQuotesNotConverted.sql.text;

  sTemp := '';

  sTemp := sTemp + ' ORDER BY Quote.Quote desc ';

  qryQuotesJB.SQL.text := qryQuotesJB.SQL.text + sTemp;

  with qryQuotesJB do
  begin
    Close;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

procedure TdtmdlQuotes.RefreshData;
var
  sTemp : string;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  qryQHeaderGrid.sql.clear;
  qryQHeaderGrid.sql.text := qryDummy.sql.text;

  sTemp := '';
  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Quote.Customer_Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';
  if Quantity <> '' then
    sTemp := sTemp + ' AND (Quote.Quantity = ''' + Quantity  + ''')';
  if Status <> '' then
    begin
      sTemp := sTemp + ' AND (Quote_Status.Quote_Status_Description LIKE ''%' + Status + '%'')';
    end;
  if CustomerRef <> '' then
    sTemp := sTemp + ' AND (Quote.Cust_Order_no LIKE ''' + CustomerRef + '%'')';
  sTemp := sTemp + ' AND Quote.Date_Point >= ' + qDate(QuoteDate);
  sTemp := sTemp + ' AND ((Quote.inactive is NULL) or (Quote.inactive = ''N'') or '
                         + '(Quote.inactive = ''' + ShowInactive + '''))';
  if RepName <> '' then
    sTemp := sTemp + ' AND (Rep.Name LIKE ''%' + RepName + '%'')';
  if OperatorName <> '' then
    sTemp := sTemp + ' AND (Operator.Name LIKE ''%' + OperatorName + '%'')';
  if SubRepName <> '' then
    sTemp := sTemp + ' AND (SubRep.Name LIKE ''%' + SubRepName + '%'')';
  if EndUserName <> '' then
    sTemp := sTemp + ' AND (End_User.Name LIKE ''%' + EndUserName + '%'')';

  if Rep <> 0 then
    begin
      if RepIsSubRep then
        sTemp := sTemp + ' AND (Quote.Sub_Rep = ' + inttostr(Rep) + ')'
      else
        sTemp := sTemp + ' AND (Quote.Rep = ' + inttostr(Rep) + ')';
    end;

  if Operator <> 0 then
    sTemp := sTemp + ' AND (Quote.Operator = ' + inttostr(Operator) + ')';

  if ShowLive then
    sTemp := sTemp + ' AND (Quote.Quote_Status < 100)';

  if SortOrder = '' then
      sTemp := sTemp + ' ORDER BY Quote.Quote desc '
  else
    sTemp := sTemp + ' ORDER BY ' + SortOrder;

//  sTemp := sTemp + ' ORDER BY Quote.Quote desc ';

  qryQHeaderGrid.SQL.text := qryQHeaderGrid.SQL.text + sTemp;

  with qryQHeaderGrid do
  begin
    Close;
    {order date greater than 1/1/1990}
    if QuoteDate > 32874 then
      parambyname('Records').asinteger := 100000000
    else
      parambyname('Records').asinteger := 2000;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

procedure TdtmdlQuotes.SaveNarrative(var iNarrative: Integer;
  const Data: string);
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.DataInfo := Data;
    Narrative.SaveToDB;
    iNarrative := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

function TdtmdlQuotes.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (BranchName <> '') or
            (RepName <> '') or
            (SubRepName <> '') or
            (Quantity <> '') or
            (Status <> '') or
            (CustomerRef <> '') or
            (Description <> '') or
            (EndUserName <> '') or
            (OperatorName <> '') then
    result := true
  else
    result := false;
end;

function TdtmdlQuotes.GetRepName(tempCode: integer): string;
begin
  with qryGetRep do
    begin
      close;
      parambyname('Rep').asinteger := tempcode;
      open;
      result := fieldbyname('Name').asstring;
    end;
end;

function TdtmdlQuotes.GetCustomerRep(tempCust, tempBranch: integer): integer;
begin
  with qryGetCustomerRep do
    begin
      close;
      parambyname('Customer').asinteger := tempcust;
      parambyname('Branch_no').asinteger := tempBranch;
      open;
      result := fieldbyname('Rep').asinteger;
    end;
end;

function TdtmdlQuotes.GetCustomerSubRep(tempCust, tempBranch: integer): integer;
begin
  with qryGetCustomerSubRep do
    begin
      close;
      parambyname('Customer').asinteger := tempcust;
      parambyname('Branch_no').asinteger := tempBranch;
      open;
      result := fieldbyname('Rep').asinteger;
    end;
end;

procedure TQuote.LoadDocuments;
var
  aDocument : TQuoteDoc;
begin
  FQuoteDocs.Clear;
  with FDataModule.qryQAllDocuments do
  begin
    Close;
    ParamByName('Quote').Asfloat := DbKey;
    Open;
    while not(EOF) do
    begin
      aDocument := TQuoteDoc.Create(Self);
      aDocument.QDocumentNo := FieldByName('Document_No').AsInteger;
      aDocument.DocumentPath := FieldByName('Document').Asstring;
      aDocument.DocumentTitle := FieldByName('Document_Title').Asstring;
      if FieldByName('Date_Created').Asdatetime = 0 then
        aDocument.DocumentDate := pbdatestr('01/01/2000')
      else
        aDocument.DocumentDate := FieldByName('Date_Created').Asdatetime;
      FQuoteDocs.Add(aDocument);
      Next;
    end;
    Close;
  end;
end;

procedure TQuote.LoadSupplies;
var
  aSupply : TQuoteSupply;
  icount: integer;
begin
  icount := 0;
  FQuoteSupplies.Clear;
  with FDataModule.qryQAllSupplies do
  begin
    Close;
    ParamByName('Quote').Asfloat := DbKey;
    Open;
    while not(EOF) do
    begin
      inc(icount);
      aSupply := TQuoteSupply.Create(Self);
      aSupply.QSupplyNo := icount;
      aSupply.Description := fieldbyname('Quote_Supply_Description').asstring;
      aSupply.Enquiry := fieldbyname('Enquiry').asinteger;
      aSupply.EnquiryLine := fieldbyname('Line').asinteger;
      aSupply.LineConverted := fieldbyname('Line_Converted').asstring;
      aSupply.Quantity := fieldbyname('Quantity').asinteger;
      aSupply.UnitCost := fieldbyname('Unit_Cost').asfloat;
      aSupply.UnitSell := fieldbyname('Unit_Price').asfloat;
      aSupply.PriceUnit := fieldbyname('Price_Unit').asinteger;
      aSupply.PriceUnitFactor := fieldbyname('Price_Unit_Factor').asinteger;
      aSupply.PriceUnitDesc := fieldbyname('Price_Unit_Description').asstring;
      aSupply.VatCode := fieldbyname('Vat_Code').asinteger;
//      aSupply.Description := fieldbyname('Form_Description').asstring;
//      aSupply.ProductType := fieldbyname('Product_Type').asinteger;
//      aSupply.ProductTypeDesc := fieldbyname('Product_Type_Description').asstring;
//      aSupply.UnitCost := fieldbyname('Supplier_Price').asfloat;
//      aSupply.UnitSell := fieldbyname('Quotation_Price').asfloat;
      FQuoteSupplies.Add(aSupply);
      next
    end;
  end;
end;

procedure TQuote.SaveSupplies;
var
  i : integer;
begin
  DeleteSupplies;  { Get rid of any already in database }
  FQuoteSupplies.Renumber;
  for i := 0 to Pred(FQuoteSupplies.Count) do
    begin
      FQuoteSupplies[i].SaveToDB;
    end;
end;

procedure TQuote.SaveDepartments;
var
  i : integer;
begin
  DeleteDepartments;  { Get rid of any already in database }
  FQuoteDepts.Renumber;
  for i := 0 to Pred(FQuoteDepts.Count) do
    begin
      if FQuoteDepts[i].Specification <> '' then
        FQuoteDepts[i].SaveToDB;
    end;
end;

procedure TQuote.SaveDocuments;
var
  i : integer;
begin
  DeleteDocuments;  { Get rid of any already in database }
  FQuoteDocs.Renumber;
  for i := 0 to Pred(FQuoteDocs.Count) do
    FQuoteDocs[i].SaveToDB;
end;

procedure TQuote.DeleteDocuments;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_Document WHERE Quote =' + floatToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TQuote.DeleteDepartments;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_Process_Group WHERE Quote = ' + floatToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TQuote.DeleteSupplies;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Quote_Supply WHERE Quote = ' + floatToStr(DbKey));
    ExecSQL;
  end;
end;

function TQuote.GetQuoteStatus: integer;
begin
  if (JobBag <> 0) then
    result := 100
  else
  if (Lines.Count > 0) or
     (Supplies.Count > 0) then
    result := 30
  else
  if (trim(Narrativetext) <> '') then
    result := 20
  else
    result := 10;

  if QuoteStatus > Result then
    Result := QuoteStatus;
end;

function TQuote.GetUnitSell: currency;
begin
  if PriceUnitFactor = 0 then
    result := TotalSell
  else
    begin
      if quantity = 0 then
        result := 0
      else
        result := TotalSell/(quantity/PriceUnitFactor);
    end;
end;

procedure TQuote.SetPriceUnitFactor(const Value: integer);
begin
  FPriceUnitFactor := Value;
end;

procedure TQuote.SetOfficeContactName(const Value: string);
begin
  FOfficeContactName := Value;
end;

procedure TQuote.SetEstimateFile(const Value: string);
begin
  FEstimateFile := Value;
end;

procedure TQuote.SetEstimateFilePath(const Value: string);
begin
  FEstimateFilePath := Value;
end;

procedure TQuote.SetJobBag(const Value: integer);
begin
  FJobBag := Value;
end;

procedure TQuote.SetQuoteReason(const Value: integer);
begin
  FQuoteReason := Value;
end;

procedure TQuote.SetLastEstimateDate(const Value: TDateTime);
begin
  FLastEstimateDate := Value;
end;

procedure TQuote.SetEstimateFileOrig(const Value: string);
begin
  FEstimateFileOrig := Value;
end;

procedure TQuote.SetAdhoc(const Value: integer);
begin
  FAdhoc := Value;
end;

procedure TQuote.SetAdhocName(const Value: string);
begin
  FAdhocName := Value;
end;

procedure TQuote.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TQuote.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TQuote.SetPhone(const Value: string);
begin
  FPhone := Value;
end;

function TQuote.GetCostingToolUsed: boolean;
var
  i: integer;
begin
  result := False;
  for i := 0 to Pred(FQuoteLines.Count) do
    begin
      if FQuoteLines[i].CostingToolFlag then
        begin
          result := true;
          exit;
        end;
    end;
end;

function TQuote.GetCustomerHasPrices: boolean;
begin
  with FDataModule.qryGetCustomerPrices do
    begin
      close;
      parambyname('Customer').asinteger := customer;
      open;
      result := (recordcount > 0);
    end;

end;

procedure TQuote.LoadDepartments;
var
  aDepartment : TQuoteDept;
  icount: integer;
begin
  FQuoteDepts.Clear;
  with FDataModule.qryGetProcessGroups do
  begin
    Close;
    Open;
    first;
    icount := 0;

    while not(EOF) do
    begin
      aDepartment := TQuoteDept.Create(Self);
      aDepartment.QDepartmentNo := icount;
      aDepartment.Department := FieldByName('Process_Group').AsInteger;
      aDepartment.DepartmentName := FieldByName('Process_Group_Description').Asstring;

      FDataModule.qryQProcessGroup.close;
      FDataModule.qryQProcessGroup.parambyname('Quote').asfloat := self.dbKey;
      FDataModule.qryQProcessGroup.parambyname('Process_Group').asinteger := aDepartment.Department;
      FDataModule.qryQProcessGroup.open;

      aDepartment.SpecificationID := FDataModule.qryQProcessGroup.fieldbyname('Quote_Specification_id').asinteger;
      if aDepartment.SpecificationID = 0 then
        aDepartment.Specification := FDataModule.qryQProcessGroup.FieldByName('Quote_Specification').Asstring
      else
        aDepartment.Specification := FDataModule.GetNarrative(aDepartment.SpecificationID);
      FQuoteDepts.Add(aDepartment);
      icount := icount + 1;
      Next;
    end;
  end;
end;

procedure TQuote.SetOriginalQuote(const Value: real);
begin
  FOriginalQuote := Value;
end;

procedure TQuote.SetProspectQuote(const Value: boolean);
begin
  FProspectQuote := Value;
end;

procedure TQuote.SetSubRep(const Value: integer);
begin
  FSubRep := Value;
end;

function TQuote.GetCustomerMarkup(Customer: integer;
  var bOverride: boolean; var rMarkup: real): boolean;
begin
  with DataModule.qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;
      Result := (recordcount > 0);
      if Result then
        begin
          bOverride := (fieldbyname('Override_Cost_Markup_Perc').asstring = 'Y');

          if bOverride then
            rMarkup := fieldbyname('Default_Quote_Cost_markup_perc').asfloat;
        end;
    end;
end;

function TQuote.GetCompanyMarkup: real;
begin
  with FDataModule.qryGetQuoteCostDefaults do
    begin
      close;
      open;
      result := fieldbyname('Default_Quote_Cost_markup_perc').asfloat;
    end;
end;

procedure TQuote.SetAcquiredCustomer(const Value: boolean);
begin
  FAcquiredCustomer := Value;
end;

procedure TQuote.SetEndUserBranch(const Value: integer);
begin
  FEndUserBranch := Value;
end;

procedure TQuote.SetEndUserCustomer(const Value: integer);
begin
  FEndUserCustomer := Value;
end;

procedure TQuote.SetEndUserCustomerName(const Value: string);
begin
  FEndUserCustomerName := Value;
end;

function TQuote.GetTotalReseller: currency;
var
  i: integer;
begin
  result := 0.000;
  for i := 0 to Pred(FQuoteLines.Count) do
    begin
      if FQuoteLines[i].PriceUnitFactor = 0 then
        result := Result + FQuoteLines[i].UnitResellerPrice
      else
        result := Result + FQuoteLines[i].UnitResellerPrice*(FQuoteLines[i].Quantity/FQuoteLines[i].PriceUnitFactor);
    end;
  for i := 0 to Pred(FQuoteSupplies.Count) do
    begin
      if FQuoteSupplies[i].PriceUnitFactor = 0 then
        result := Result + FQuoteSupplies[i].UnitSell
      else
        result := Result + FQuoteSupplies[i].UnitSell*(FQuoteSupplies[i].Quantity/FQuoteSupplies[i].PriceUnitFactor);
    end;
end;

function TQuote.GetTotalResellerMargin: currency;
begin
  result := TotalReseller - TotalSell;
end;

function TQuote.GetTotalResellerMarginPerc: double;
begin
  if FQuoteLines.Count = 0 then
    Result := 0
  else
  if TotalReseller <> 0 then
    result := ((TotalResellerMargin)/TotalReseller)*100
  else
    Result := -999999;

end;

procedure TQuote.LoadFromJobBag;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qryJBHeader do
  begin
    Close;
    ParamByName('JobBag').AsInteger := FDataModule.JobNo;
    Open;

    QuoteStatus :=    10;

    Adhoc :=          0;
    AdhocName :=      '';
    AcquiredCustomer := (Fieldbyname('Customer_is_Acquired').asstring = 'Y');

    OfficeContact :=
                      FieldByName('Office_Contact').asinteger;
    OfficeContactName := dmBroker.GetOperatorDocDirectory(OfficeContact);
    Branch :=         FieldByName('Branch_No').AsInteger;
    BranchName :=     FieldByName('Branch_Name').AsString;
    Customer :=       FieldByName('Customer').AsInteger;
    CustomerName :=   FieldByName('Cust_Name').AsString;
    ContactNo :=      FieldByName('Contact_no').Asinteger;

//    ContactName :=    Fieldbyname('Contact_Name').asstring;
    Date :=           date;
    Description :=    FieldByName('Job_Bag_Descr').AsString;
    DescriptiveRef := FieldByName('Description_Reference').AsString;
    DateRequired :=   date;
    DateQuoteRequired :=   date;
//    Email :=          Fieldbyname('Email').asstring;

    EndUserCustomer :=  FieldByName('End_User_Customer').AsInteger;
    EndUserBranch :=  FieldByName('End_User_Branch_No').AsInteger;
    EndUserCustomerName := FieldByName('End_User_Customer_Name').Asstring;

    Quantity :=       FieldByName('Quantity').Asinteger;
    JobBag :=         0;

    LastEstimateDate :=    date;
    ProspectQuote := false;

    Rep :=          FDataModule.GetCustomerRep(Customer, Branch);
    SubRep :=       FDataModule.GetCustomerSubRep(Customer, Branch);

    EstimateFile := '';

    EstimateFileOrig := '';

    Narrative :=      FieldByName('Narrative').AsInteger;
    NarrativeText :=  FDataModule.GetNarrative(Narrative);
    Narrative :=      0;

    OriginalQuote :=  0;

    inactive :=     'N';

    Phone :=          '';
    QuoteReason := 0;

    StartDate :=  date;

    Operator :=       frmPBMainMenu.iOperator;
    OperatorName :=   frmPBMainMenu.sOperator_Name;
    PriceUnit :=   Fieldbyname('Price_Unit').asinteger;
    PriceUnitFactor :=   Fieldbyname('Price_Unit_Factor').asinteger;
    ConvertPercentage :=   0;

    Close;

  LoadJobBagLines;
(*
    AccountManagerName :=
                      FieldByName('Office_Contact_Name').asstring;
    AccountTeam :=    FieldByName('Account_Team').asinteger;
    AcquiredCustomer := (Fieldbyname('Customer_is_Acquired').asstring = 'Y');
    Branch :=         FieldByName('Branch_No').AsInteger;
    BranchName :=     FieldByName('Branch_Name').AsString;
    CashSale :=       (FieldbyName('Cash_Sales').asstring = 'Y');
    CostCentre :=     Fieldbyname('Cost_Centre').asstring;
    Customer :=       FieldByName('Customer').AsInteger;
    CustomerName :=   FieldByName('Cust_Name').AsString;
    ContactNo :=      FieldByName('Contact_no').Asinteger;
    Date :=           FieldByName('Date_Point').AsDateTime;
    Description :=    FieldByName('Job_Bag_Descr').AsString;
    DescriptiveRef := FieldbyName('Description_Reference').asstring;

    EnclosingType := FieldbyName('Enclosing_Type').asstring;
    EndUserCustomer :=  FieldByName('End_User_Customer').AsInteger;
    EndUserCustomerName := FieldByName('End_User_Customer_Name').Asstring;
    EndUserBranch :=  FieldByName('End_User_Branch_No').AsInteger;

    GoodsRequired :=  FieldByName('Goods_Required').AsDateTime;
    OfficeContact :=  FieldByName('Office_Contact').Asinteger;
    Quantity :=       FieldByName('Quantity').Asinteger;
    CustOrderNo :=    FieldByName('Cust_Order_No').Asstring;

    if JBMode = jbrepeat then
      begin
        Rep :=          FDataModule.GetCustomerRep(Customer, Branch);
        SubRep :=       FDataModule.GetCustomerSubRep(Customer, Branch);
      end
    else
      begin
        Rep :=          FieldbyName('Rep').asinteger;
        SubRep :=       FieldbyName('Sub_Rep').asinteger;
        if SubRep = 0 then
          SubRep :=          FDataModule.GetCustomerSubRep(Customer, Branch);
      end;

    DefaultVAtCode := FieldbyName('Vat_Code_Def').asinteger;
    Narrative :=      FieldByName('Narrative').AsInteger;
    NarrativeText :=  FDataModule.GetNarrative(Narrative);

    ProductionComplete := (fieldbyname('Production_Complete').asstring = 'Y');
    try
      ProductionCompleteBy := fieldbyname('Production_Complete_by').asinteger;
      ProductionCompleteByName := dmBroker.GetOperatorName(ProductionCompleteBy);
    except
      ProductionCompleteBy := 0;
      ProductionCompleteByName := '';
    end;

    ProductionDate := fieldbyname('Production_Complete_Date').asdatetime;
    ReadyToInvoice := Fieldbyname('Ready_for_invoicing').asstring;
    if FieldbyName('Inactive').asstring = 'Y' then
      inactive  :=    'Y'
    else
      inactive :=     'N';

    try
      if fieldbyname('Date_Start').asstring = '' then
        StartDate :=  date
      else
        StartDate :=  fieldbyname('Date_Start').asdatetime;
    except
      StartDate :=  date;
    end;

    try
      InvoiceBy := fieldbyname('Invoiced_by').asinteger;
      InvoiceByName := dmBroker.getOperatorName(InvoiceBy);
      InvoiceByDate :=  fieldbyname('Invoiced_Date').asdatetime;
    except
      InvoiceBy := 0;
      InvoiceByName := '';
      InvoiceByDate :=  0;
    end;

    if (JBMode = jbRepeat) or (JBMode = jbConvert) then
      begin
        InvoiceThisWeek := false;
        InvoiceThisWeekBy := 0;
        InvoiceThisWeekDate := 0;
        InvoiceThisWeekName := '';
      end
    else
      begin
        InvoiceThisWeek := (fieldbyname('Invoice_This_Week').asstring = 'Y');
        InvoiceThisWeekBy := fieldbyname('Invoice_This_Week_By').asinteger;
        InvoiceThisWeekDate := fieldbyname('Invoice_This_Week_Date').asDateTime;
        InvoiceThisWeekName := Fieldbyname('Invoice_This_Week_Name').asstring;
      end;


    InvoiceLocation := FieldbyName('Invoice_Location').asinteger;
    Operator :=       Fieldbyname('Operator').asinteger;
    OperatorName :=   Fieldbyname('Operator_Name').asstring;
    OriginalJBOrder := Fieldbyname('Original_Job_Bag').asfloat;
    OnHold :=         Fieldbyname('On_Hold').asstring;
    ProductionStatus := fieldbyname('Job_Bag_Production_Status').asinteger;

    ArtRequired  :=        (Fieldbyname('Artwork_Required').asstring = 'Y');
    ArtDueDate :=           Fieldbyname('Artwork_Due_Date').asdatetime;
    ArtProofDate :=         Fieldbyname('Artwork_Proof_Date').asdatetime;
    ArtProofDate :=         Fieldbyname('Artwork_Approval_Date').asdatetime;
    DSRequired :=           (Fieldbyname('Data_Services_Required').asstring = 'Y');
    DataRequiredDate :=     Fieldbyname('Data_Required_Date').asdatetime;
    BriefRequiredDate  :=   Fieldbyname('Brief_Required_Date').asdatetime;
    TextRequiredDate :=     Fieldbyname('Text_Required_Date').asdatetime;
    BriefAvailableDate :=   Fieldbyname('Brief_Available_Date').asdatetime;
    TextAvailableDate  :=   Fieldbyname('Text_Available_Date').asdatetime;
    TextProofDate  :=       Fieldbyname('Text_Proof_Date').asdatetime;

    PackFormat :=           Fieldbyname('Pack_Format_ID').asinteger;
    PriceUnit :=            Fieldbyname('Price_Unit').asinteger;
    PriceUnitFactor :=      Fieldbyname('Price_unit_Factor').asinteger;

    ProofRequiredDate  :=   Fieldbyname('Proof_Required_Date').asdatetime;
    ProofApprovalDate  :=   Fieldbyname('Proof_Approval_Date').asdatetime;

    FileCopiesReceived :=   (Fieldbyname('File_Copies_Received_Date').asdatetime <> 0);
    FileCopiesReceivedDate :=   Fieldbyname('File_Copies_Received_Date').asdatetime;
    FileCopiesReceivedBy := Fieldbyname('File_Copies_Received_by').asinteger;
    FileCopiesReceivedName := Fieldbyname('Files_Received_by_Name').asstring;

    try
      ProofByMethod     :=  Fieldbyname('Proof_By_Method').AsString;
    except
      ProofByMethod     :=  'PDF';
    end;

    SamplesRequired  :=     (Fieldbyname('Samples_Required').asstring = 'Y');
    SampleToClientDate :=   Fieldbyname('Sample_To_Client').asdatetime;
    SampleApprovalDate :=   Fieldbyname('Sample_Approval').asdatetime;
    ScheduleApproved :=     (Fieldbyname('Schedule_Approved').asstring = 'Y');
    Status :=               Fieldbyname('Job_Bag_Status').asinteger;

    if JBMode = jbrepeat then
      QuoteNo := 0
    else
      QuoteNo :=              fieldbyname('Quote').asfloat;
*)
  end;
end;

procedure TQuote.SetEnclosingType(const Value: string);
begin
  FEnclosingType := Value;
end;

procedure TQuote.SetPackFormat(const Value: integer);
begin
  FPackFormat := Value;
end;

{ TQuoteDocs }

procedure TQuoteDocs.Add(aDocument: TQuoteDoc);
begin
  FItems.Add(aDocument);
end;

procedure TQuoteDocs.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteDoc(FItems[i]).Free;
end;

function TQuoteDocs.Clone: TQuoteDocs;
var
  i : integer;
begin
  Result := TQuoteDocs.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQuoteDoc(FItems[i]).Clone);
end;

constructor TQuoteDocs.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQuoteDocs.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQuoteDocs.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteDoc(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TQuoteDocs.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQuoteDocs.GetItems(Index: integer): TQuoteDoc;
begin
  Result := TQuoteDoc(FItems[Index]);
end;

function TQuoteDocs.IndexOf(const DocumentNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQuoteDoc(FItems[i]).QDocumentNo = DocumentNo then
      Result := i;
end;

procedure TQuoteDocs.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteDoc(FItems[i]).QDocumentNo := (i+1);
end;

procedure TQuoteDocs.SetItems(Index: integer; const Value: TQuoteDoc);
begin

end;

{ TQuoteDoc }

function TQuoteDoc.Clone: TQuoteDoc;
begin
  Result := TQuoteDoc.Create(FParent);
  Result.DocumentDate   :=    Self.DocumentDate;
  Result.DocumentTitle  :=    Self.DocumentTitle;
  Result.DocumentPath   :=    Self.DocumentPath;
  Result.QDocumentNo    :=    Self.QDocumentNo;
end;

constructor TQuoteDoc.Create(Quote: TQuote);
begin
  FParent := Quote;
end;

destructor TQuoteDoc.Destroy;
begin

  inherited;
end;

procedure TQuoteDoc.LoadFromDB;
begin
  with FParent.FDataModule.qryQDocument do
  begin
    Close;
    ParamByName('Quote').Asfloat := FParent.DbKey;
    ParamByName('Document_no').AsInteger := QDocumentNo;
    Open;
    DocumentDate := FieldByName('Date_Created').asdatetime;
    DocumentPath := FieldByName('Document').Asstring;
    DocumentTitle := FieldByName('Document_Title').Asstring;
  end;
end;

procedure TQuoteDoc.SaveToDB;
begin
  with FParent.FDataModule.qryQAddDocument do
  begin
    ParamByName('Quote').Asfloat := FParent.DbKey;
    ParamByName('Document_No').AsInteger := QDocumentNo;
    ParamByName('Date_Created').AsDateTime := DocumentDate;
    ParamByName('Document_Title').asstring := DocumentTitle;
    ParamByName('Document').asstring := DocumentPath;
    ExecSQL;
  end;
end;

procedure TQuoteDoc.SetDocumentDate(const Value: TDateTime);
begin
  FDocumentDate := Value;
end;

procedure TQuoteDoc.SetDocumentPath(const Value: string);
begin
  FDocumentPath := Value;
end;

procedure TQuoteDoc.SetDocumentTitle(const Value: string);
begin
  FDocumentTitle := Value;
end;

procedure TQuoteDoc.SetParent(const Value: TQuote);
begin
  FParent := Value;
end;

procedure TQuoteDoc.SetQDocumentNo(const Value: integer);
begin
  FQDocumentNo := Value;
end;

{ TQuoteSupply }

function TQuoteSupply.Clone: TQuoteSupply;
begin
  Result := TQuoteSupply.Create(FParent);
  Result.Description    :=    Self.Description;
  Result.Enquiry        :=    Self.Enquiry;
  Result.EnquiryLine    :=    Self.EnquiryLine;
  Result.LineConverted  :=    Self.LineConverted;
  Result.PriceUnit      :=    Self.PriceUnit;
  Result.PriceUnitFactor :=   Self.PriceUnitFactor;
  Result.PriceUnitDesc  :=    Self.PriceUnitDesc;
  Result.ProductType    :=    Self.ProductType;
  Result.ProductTypeDesc :=   Self.ProductTypeDesc;
  Result.QSupplyNo      :=    Self.QSupplyNo;
  Result.Quantity       :=    Self.Quantity;
  Result.Sequence       :=    Self.Sequence;
  Result.UnitCost       :=    Self.UnitCost;
  Result.UnitSell       :=    Self.UnitSell;
  Result.VatCode        :=    self.VatCode;
end;

constructor TQuoteSupply.Create(Quote: TQuote);
begin
  FParent := Quote;
end;

procedure TQuoteSupply.DeleteFromDB;
begin

end;

destructor TQuoteSupply.Destroy;
begin
  inherited;
end;

function TQuoteSupply.GetTotalCost: currency;
begin
  if PriceUnitFactor = 0 then
    result := UnitCost
  else
    result := (Quantity/PriceUnitFactor) * UnitCost;
end;

function TQuoteSupply.GetTotalSell: currency;
begin
  if PriceUnitFactor = 0 then
    result := UnitSell
  else
    result := (Quantity/PriceUnitFactor) * UnitSell;
end;

procedure TQuoteSupply.LoadFromDB;
begin
  with FParent.FDataModule.qryQSupply do
  begin
    Close;
    ParamByName('Quote').Asfloat := FParent.DbKey;
    ParamByName('Quote_Supply_No').AsInteger := QSupplyNo;
    Open;
    Description := fieldbyname('Quote_Supply_Description').asstring;
    Enquiry := fieldbyname('Enquiry').asinteger;
    EnquiryLine := fieldbyname('Line').asinteger;
    LineConverted := fieldbyname('Line_Converted').asstring;
    PriceUnit := fieldbyname('Price_Unit').asinteger;
    PriceUnitFactor := fieldbyname('Price_Unit_Factor').asinteger;
    PriceUnitDesc := fieldbyname('Price_Unit_Description').asstring;
    Quantity := fieldbyname('Quantity').asinteger;
//    Description := fieldbyname('Form_Description').asstring;
//    ProductType := fieldbyname('Product_Type').asinteger;
//    ProductTypeDesc := fieldbyname('Product_Type_Description').AsString;
//    UnitCost := fieldbyname('Supplier_Price').asfloat;
//    UnitSell := fieldbyname('Quotation_Price').asfloat;
    UnitCost := fieldbyname('Unit_Cost').asfloat;
    UnitSell := fieldbyname('Unit_Price').asfloat;
    VatCode := fieldbyname('Vat_Code').asinteger;
    end;
end;

procedure TQuoteSupply.SaveToDB;
begin
  with FParent.FDataModule.qryQAddSupply do
  begin
    ParamByName('Quote').Asfloat := FParent.DbKey;
    ParamByName('Quote_Supply_No').AsInteger := QSupplyNo;
    ParamByName('Enquiry').Asinteger := Enquiry;
    ParamByName('Line').asinteger := EnquiryLine;
    ParamByName('Line_Converted').asstring := LineConverted;
    ParamByName('Quantity').asinteger := Quantity;
    ParamByName('Quote_Supply_description').asstring := Description;
    ParamByName('Unit_Cost').asfloat := self.UnitCost;
    ParamByName('Unit_Price').asfloat := UnitSell;
    ParamByName('Price_Unit').asinteger := PriceUnit;
    if VatCode = -1 then
      ParamByName('Vat_Code').clear
    else
      ParamByName('Vat_Code').asinteger := VatCode;
    ExecSQL;
  end;
end;

procedure TQuoteSupply.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TQuoteSupply.SetEnquiry(const Value: integer);
begin
  FEnquiry := Value;
end;

procedure TQuoteSupply.SetEnquiryLine(const Value: integer);
begin
  FEnquiryLine := Value;
end;

procedure TQuoteSupply.SetLineConverted(const Value: string);
begin
  FLineConverted := Value;
end;

procedure TQuoteSupply.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TQuoteSupply.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TQuoteSupply.SetPriceUnitFactor(const Value: integer);
begin
  FPriceUnitFactor := Value;
end;

procedure TQuoteSupply.SetProductType(const Value: integer);
begin
  FProductType := Value;
end;

procedure TQuoteSupply.SetProductTypeDesc(const Value: string);
begin
  FProductTypeDesc := Value;
end;

procedure TQuoteSupply.SetQSupplyNo(const Value: integer);
begin
  FQSupplyNo := Value;
end;

procedure TQuoteSupply.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TQuoteSupply.SetSequence(const Value: integer);
begin
  FSequence := Value;
end;

procedure TQuoteSupply.SetUnitCost(const Value: double);
begin
  FUnitCost := Value;
end;

procedure TQuoteSupply.SetUnitSell(const Value: double);
begin
  FUnitSell := Value;
end;

procedure TQuoteSupply.SetVatCode(const Value: integer);
begin
  FVatCode := Value;
end;

{ TQuoteLine }

function TQuoteLine.Clone: TQuoteLine;
begin
  Result := TQuoteLine.Create(FParent);
  Result.Category  :=           Self.Category;
  Result.CategoryDesc :=        Self.CategoryDesc;
  Result.CatNumber :=           Self.CatNumber;
  Result.CostNumber :=          Self.CostNumber;
  Result.CostingToolFlag :=     Self.CostingToolFlag;
  Result.QuoteLineNo :=         Self.QuoteLineNo;
  Result.Description :=         Self.Description;
  Result.UnitCost :=            Self.UnitCost;
  Result.UnitCostOHD :=         Self.UnitCostOHD;
  Result.UnitResellerPrice  :=  Self.UnitResellerPrice;
  Result.UnitSell :=            Self.UnitSell;
  Result.UnitSSP :=             Self.UnitSSP;
  Result.UnitSSPOrig :=         Self.UnitSSPOrig;
  Result.Quantity :=            Self.Quantity;
  Result.InternalCostLine :=    self.InternalCostLine;
  Result.InternalCostMarkupPercentage
                          :=    self.InternalCostMarkupPercentage;
  Result.LineConverted :=       Self.LineConverted;
  Result.NoOfHours :=           Self.NoOfHours;
  Result.PriceUnit :=           Self.PriceUnit;
  Result.PriceUnitFactor :=     Self.PriceUnitFactor;
  Result.PriceUnitDesc :=       Self.PriceUnitDesc;
  Result.Process :=             Self.Process;
  Result.ProcessDesc :=         Self.ProcessDesc;
  Result.ProcessGroup :=        Self.ProcessGroup;
  Result.ProductType :=         Self.ProductType;
  Result.ProductTypeDesc :=     Self.ProductTypeDesc;
  Result.Sequence :=            Self.Sequence;
  Result.SubNumber :=           Self.SubNumber;
  Result.TeamCount :=           Self.TeamCount;
  Result.JustMoved :=           Self.JustMoved;
  Result.VatCode :=             self.VatCode;
  Result.WorkCentre :=          Self.WorkCentre;
  Result.WorkCentreGroup :=     Self.WorkCentreGroup;
end;

constructor TQuoteLine.Create(Quote: TQuote);
begin
  FParent := Quote;
end;

procedure TQuoteLine.DeleteFromDB;
begin
end;

destructor TQuoteLine.Destroy;
begin

  inherited;
end;

function TQuoteLine.GetTotalASP: currency;
begin
  if PriceUnitFactor = 0 then
    result := UnitSell
  else
    result := (Quantity/PriceUnitFactor) * UnitSell;
end;

function TQuoteLine.GetTotalCost: currency;
begin
  if PriceUnitFactor = 0 then
    result := UnitCost
  else
    result := (Quantity/PriceUnitFactor) * UnitCost;
end;

function TQuoteLine.GetTotalRSP: currency;
begin
  if PriceUnitFactor = 0 then
    result := UnitResellerPrice
  else
    result := (Quantity/PriceUnitFactor) * UnitResellerPrice;
end;

function TQuoteLine.GetTotalSSP: currency;
begin
  if PriceUnitFactor = 0 then
    result := UnitSSP
  else
    result := (Quantity/PriceUnitFactor) * UnitSSP;

end;

procedure TQuoteLine.LoadFromDB;
begin
  with FParent.FDataModule.qryQLine do
  begin
    Close;
    ParamByName('Quote').Asfloat := FParent.DbKey;
    ParamByName('Quote_Line_No').AsInteger := QuoteLineNo;
    Open;
    CostNumber := fieldbyname('Cost_Number').AsInteger;
    CatNumber := fieldbyname('Category_Number').AsInteger;
    CostingToolFlag := (fieldbyname('Costing_Tool_Flag').asstring = 'Y');
    Description := fieldbyname('Quote_Line_Description').asstring;
    UnitCost := fieldbyname('Unit_Cost').asfloat;
    UnitSell := fieldbyname('Unit_Sell').asfloat;
    UnitSSP := fieldbyname('Unit_SSP').asfloat;
    UnitCostOHD := fieldbyname('Unit_Cost_Plus_OHD').asfloat;
    UnitSSPOrig := fieldbyname('Unit_SSP_Original').asfloat;
    Quantity := fieldbyname('Quanity').asinteger;
    InternalCostLine := (fieldbyname('Line_Is_Internal_Cost').asstring = 'Y');
    InternalCostMarkupPercentage := fieldbyname('Quote_Cost_Markup_Perc').asfloat;
    LineConverted := (fieldbyname('Line_Converted').asstring = 'Y');
    NoOfHours := fieldbyname('No_of_Hours').asfloat;
    PriceUnit := fieldbyname('Price_Unit').asinteger;
    PriceUnitFactor := fieldbyname('Price_Unit_Factor').asinteger;
    PriceUnitDesc := fieldbyname('Price_Unit_Description').asstring;
    Process := fieldbyname('Process').asinteger;
    ProcessDesc := FParent.FDataModule.GetProcessDescription(Process);
    ProcessGroup := fieldbyname('Process_Group').asinteger;
    ProductType := fieldbyname('Product_Type').asinteger;
    ProductTypeDesc := fieldbyname('Product_Type_Description').asstring;
    Sequence := 1;
    SubNumber := fieldbyname('Sub_Category').AsInteger;
    JustMoved := False;
    TeamCount := fieldbyname('Team_Count').AsInteger;
    VatCode   := fieldbyname('Vat_Code').asinteger;
    WorkCentre := fieldbyname('Work_Centre').asinteger;
    WorkCentreGroup := fieldbyname('Work_Centre_Group').asinteger;
    Close;
  end;
end;

procedure TQuoteLine.SaveToDB;
begin
  with FParent.FDataModule.qryQaddLine do
  begin
    ParamByName('Quote').Asfloat := FParent.DbKey;
    ParamByName('Quote_Line_no').AsInteger := QuoteLineNo;
    ParamByName('Quote_Line_Description').AsString := Description;

    Parambyname('Reseller_Price').asfloat := self.UnitResellerPrice;

    ParamByName('Unit_Cost').AsFloat := UnitCost;
    ParamByName('Unit_Price').AsFloat := UnitSell;
    ParamByName('Unit_SSP').AsFloat := UnitSSP;
    ParamByName('Unit_Cost_Plus_OHD').AsFloat := UnitCostOHD;
    ParamByName('Unit_SSP_Original').AsFloat := UnitSSPOrig;
    ParamByName('Quantity').Asfloat := Quantity;

    if CostingToolFlag then
      ParamByName('Costing_Tool_Flag').asstring := 'Y'
    else
      ParamByName('Costing_Tool_Flag').asstring := 'N';

    if ProductType <= 0 then
      ParamByName('Product_Type').clear
    else
      ParambyName('Product_Type').asinteger := ProductType;
    Parambyname('Process').asinteger := Process;
    if PriceUnit <= 0 then
      ParamByName('Price_Unit').clear
    else
      ParambyName('Price_Unit').asinteger := PriceUnit;
    Parambyname('Sequence_no').asinteger := Sequence;
    Parambyname('no_of_hours').asfloat := noOfhours;
    if LineConverted then
      Parambyname('Line_Converted').asstring := 'Y'
    else
      Parambyname('Line_Converted').asstring := 'N';
    Parambyname('Team_Count').asinteger := TeamCount;

    Parambyname('Quote_Cost_Markup_Perc').asfloat := self.InternalCostMarkupPercentage;

    if self.InternalCostLine then
      Parambyname('Line_Is_Internal_Cost').asstring := 'Y'
    else
      Parambyname('Line_Is_Internal_Cost').asstring := 'N';

    if WorkCentre = 0 then
      Parambyname('Work_Centre').clear
    else
      Parambyname('Work_Centre').asinteger := WorkCentre;

    if WorkCentreGroup = 0 then
      Parambyname('Work_Centre_Group').clear
    else
      Parambyname('Work_Centre_Group').asinteger := WorkCentreGroup;

    if CostNumber = 0 then
      Parambyname('Cost_Number').clear
    else
      Parambyname('Cost_Number').asinteger := CostNumber;

    if CatNumber = 0 then
      Parambyname('Category_Number').clear
    else
      Parambyname('Category_Number').asinteger := CatNumber;

    if SubNumber = 0 then
      Parambyname('Sub_Category').clear
    else
      Parambyname('Sub_Category').asinteger := SubNumber;

    if VatCode = -1 then
      parambyname('Vat_Code').clear
    else
      parambyname('Vat_Code').asinteger := VatCode;
    ExecSQL;
  end;
end;

procedure TQuoteLine.SetCategory(const Value: integer);
begin
  FCategory := Value;
end;

procedure TQuoteLine.SetCategoryDesc(const Value: string);
begin
  FCategoryDesc := Value;
end;

procedure TQuoteLine.SetCatNumber(const Value: integer);
begin
  FCatNumber := Value;
end;

procedure TQuoteLine.SetCostingToolFlag(const Value: boolean);
begin
  FCostingToolFlag := Value;
end;

procedure TQuoteLine.SetCostNumber(const Value: integer);
begin
  FCostNumber := Value;
end;

procedure TQuoteLine.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TQuoteLine.SetInternalCostLine(const Value: boolean);
begin
  FInternalCostLine := Value;
end;

procedure TQuoteLine.SetInternalCostMarkupPercentage(const Value: double);
begin
  FInternalCostMarkupPercentage := Value;
end;

procedure TQuoteLine.SetJustMoved(const Value: boolean);
begin
  FJustMoved := Value;
end;

procedure TQuoteLine.SetLineConverted(const Value: boolean);
begin
  FLineConverted := Value;
end;

procedure TQuoteLine.SetNoOfHours(const Value: double);
begin
  FNoOfHours := Value;
end;

procedure TQuoteLine.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TQuoteLine.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TQuoteLine.SetPriceUnitFactor(const Value: integer);
begin
  FPriceUnitFactor := Value;
end;

procedure TQuoteLine.SetProcess(const Value: integer);
begin
  FProcess := Value;
end;

procedure TQuoteLine.SetProcessDesc(const Value: string);
begin
  FProcessDesc := Value;
end;

procedure TQuoteLine.SetProcessGroup(const Value: integer);
begin
  FProcessGroup := Value;
end;

procedure TQuoteLine.SetProductType(const Value: integer);
begin
  FProductType := Value;
end;

procedure TQuoteLine.SetProductTypeDesc(const Value: string);
begin
  FProductTypeDesc := Value;
end;

procedure TQuoteLine.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TQuoteLine.SetQuoteLineNo(const Value: integer);
begin
  FQuoteLineNo := Value;
end;

procedure TQuoteLine.SetSequence(const Value: integer);
begin
  FSequence := Value;
end;

procedure TQuoteLine.SetSubNumber(const Value: integer);
begin
  FSubNumber := Value;
end;

procedure TQuoteLine.SetTeamCount(const Value: integer);
begin
  FTeamCount := Value;
end;

procedure TQuoteLine.SetUnitCost(const Value: double);
begin
  FUnitCost := Value;
end;

procedure TQuoteLine.SetUnitCostOHD(const Value: double);
begin
  FUnitCostOHD := Value;
end;

procedure TQuoteLine.SetUnitResellerPrice(const Value: double);
begin
  FUnitResellerPrice := Value;
end;

procedure TQuoteLine.SetUnitSell(const Value: double);
begin
  FUnitSell := Value;
end;

procedure TQuoteLine.SetUnitSSP(const Value: double);
begin
  FUnitSSP := Value;
end;

procedure TQuoteLine.SetUnitSSPOrig(const Value: double);
begin
  FUnitSSPOrig := Value;
end;

procedure TQuoteLine.SetVatCode(const Value: integer);
begin
  FVatCode := Value;
end;

procedure TQuoteLine.SetWorkCentre(const Value: integer);
begin
  FWorkCentre := Value;
end;

procedure TQuoteLine.SetWorkCentreGroup(const Value: integer);
begin
  FWorkCentreGroup := Value;
end;

{ TQuoteSupplies }

procedure TQuoteSupplies.Add(aSupply: TQuoteSupply);
begin
  FItems.Add(aSupply);
end;

procedure TQuoteSupplies.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteSupply(FItems[i]).Free;
end;

function TQuoteSupplies.Clone: TQuoteSupplies;
var
  i : integer;
begin
  Result := TQuoteSupplies.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQuoteSupply(FItems[i]).Clone);
end;

constructor TQuoteSupplies.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQuoteSupplies.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQuoteSupplies.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteSupply(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TQuoteSupplies.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQuoteSupplies.GetItems(Index: integer): TQuoteSupply;
begin
  Result := TQuoteSupply(FItems[Index]);
end;

function TQuoteSupplies.GetMaxLineNo: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].QSupplyNo > Result then
      Result := Items[i].QSupplyNo;
end;

function TQuoteSupplies.IndexOf(const SupplyNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQuoteSupply(FItems[i]).QSupplyNo = SupplyNo then
      Result := i;
end;

procedure TQuoteSupplies.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteSupply(FItems[i]).QSupplyNo := (i+1);
end;

procedure TQuoteSupplies.SetItems(Index: integer;
  const Value: TQuoteSupply);
begin
  FItems[Index] := Value;
end;

{ TQuoteLines }

procedure TQuoteLines.Add(aLine: TQuoteLine);
begin
  FItems.Add(aLine);
end;

procedure TQuoteLines.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteLine(FItems[i]).Free;
end;

function TQuoteLines.Clone: TQuoteLines;
var
  i : integer;
begin
  Result := TQuoteLines.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQuoteLine(FItems[i]).Clone);
end;

constructor TQuoteLines.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQuoteLines.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQuoteLines.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteLine(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TQuoteLines.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQuoteLines.GetItems(Index: integer): TQuoteLine;
begin
  Result := TQuoteLine(FItems[Index]);
end;

function TQuoteLines.GetMaxLineNo: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].QuoteLineNo > Result then
      Result := Items[i].QuoteLineNo;
end;

function TQuoteLines.IndexOf(const LineNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQuoteLine(FItems[i]).QuoteLineNo = LineNumber then
      Result := i;
end;

function TQuoteLines.IndexOfSequence(const SeqNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQuoteLine(FItems[i]).Sequence = SeqNumber then
      Result := i;
end;

procedure TQuoteLines.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteLine(FItems[i]).QuoteLineNo := (i+1);
end;

procedure TQuoteLines.ReSequence;
var
  i : integer;
  iIndex: integer;
begin
  iIndex := 0;
  for i := 0 to Pred(FItems.Count) do
    begin
      TQuoteLine(Items[i]).sequence := i + 1;
    end;
end;

procedure TQuoteLines.SetItems(Index: integer; const Value: TQuoteLine);
begin
  FItems[Index] := Value;
end;

procedure TdtmdlQuotes.UpdateQuoteStatus(tempCode: real;
  tempStatus: integer);
begin
  with qryUpdQuoteStatus do
    begin
      close;
      parambyname('Quote').asfloat := tempCode;
      parambyname('Quote_Status').asinteger := tempStatus;
      execsql;
    end;
end;

function TdtmdlQuotes.GetNewProductTypeCode(tempDesc: string; OldCode: integer): integer;
begin
  with qryGetProductType do
    begin
      close;
      sql.clear;
      sql.text := 'Select * from Product_Type where Short_Desc = ''' + tempDesc + '''';
      open;
      result := fieldbyname('Product_Type').asinteger;
      if result = 0 then
        result := OldCode;
    end;
end;

function TdtmdlQuotes.GetNewProcessCode(tempDesc: string; OldCode: integer): integer;
begin
  with qryGetProcess do
    begin
      close;
      sql.clear;
      sql.text := 'Select * from Process where Short_Description = ''' + tempDesc + '''';
      open;
      result := fieldbyname('Process').asinteger;
      if result = 0 then
        result := OldCode;
    end;
end;

function TdtmdlQuotes.GetProcessProductType(tempCode: integer): integer;
begin
  with qryGetProcess do
    begin
      close;
      sql.clear;
      sql.text := 'Select * from Process where Process = ''' + inttostr(tempCode) + '''';
      open;
      result := fieldbyname('Product_Type').asinteger;
    end;
end;

function TdtmdlQuotes.GetProcessGroup(tempCode: integer): integer;
begin
  with qryGetProcess do
    begin
      close;
      sql.clear;
      sql.text := 'Select * from Process where Process = ''' + inttostr(tempCode) + '''';
      open;
      result := fieldbyname('Process_Group').asinteger;
    end;
end;

function TdtmdlQuotes.GetProductType(tempCode: integer): string;
begin
  with qryGetProductType do
    begin
      close;
      sql.clear;
      sql.text := 'Select * from Product_Type where Product_type = ' + inttostr(tempCode);
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

function TdtmdlQuotes.GetPriceUnitFromFactor(tempQty: integer): integer;
begin
  with qryGetPUnitFromFactor do
    begin
      close;
      parambyname('Price_Unit_Factor').asinteger := tempQty;
      open;
      result := fieldbyname('Price_Unit').asinteger;
    end;
end;

function TdtmdlQuotes.GetPriceUnit(tempCode: integer): string;
begin
  with qryGetPriceUnit do
    begin
      close;
      parambyname('Price_Unit').asinteger := tempCode;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

function TdtmdlQuotes.GetPriceUnitFactor(tempCode: integer): integer;
begin
  with qryGetPriceUnit do
    begin
      close;
      parambyname('Price_Unit').asinteger := tempCode;
      open;
      result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

procedure TdtmdlQuotes.DataModuleCreate(Sender: TObject);
begin
  showInactive := 'Y';

  FormatSettings := TFormatSettings.Create;
  FormatSettings.ThousandSeparator := #00;
  FormatSettings.DecimalSeparator := '.';
end;

function TdtmdlQuotes.GetWorkCentre(tempCode: string): integer;
begin
  if tempCode = '' then
    begin
      result := 0;
      exit;
    end;

  with qryGetWorkCentrebyName do
    begin
      close;
      parambyname('Work_Centre_Short_Name').asstring := tempCode;
      open;
      result := fieldbyname('Work_Centre').asinteger;
    end;
end;

function TdtmdlQuotes.GetWorkCentreByEstName(tempCode: string): integer;
begin
  if tempCode = '' then
    begin
      result := 0;
      exit;
    end;

  with qryGetWorkCentrebyEstName do
    begin
      close;
      parambyname('Estimating_Name').asstring := tempCode;
      open;
      result := fieldbyname('Work_Centre').asinteger;
    end;
end;

function TdtmdlQuotes.GetWorkCentreGroupbyName(tempCode: string): integer;
begin
  if tempCode = '' then
    begin
      result := 0;
      exit;
    end;
  with qryGetWorkCentreGroupbyName do
    begin
      close;
      parambyname('Work_Centre_Group_Short_Name').asstring := tempCode;
      open;
      result := fieldbyname('Work_Centre_Group').asinteger;
    end;
end;

function TdtmdlQuotes.GetWorkCentreGroupbyWC(tempCode: integer): integer;
begin
  with qryGetWorkCentreWCGroup do
    begin
      close;
      parambyname('Work_Centre').asinteger := tempCode;
      open;
      result := fieldbyname('Work_Centre_Group').asinteger;
    end;
end;

function TdtmdlQuotes.GetProcessDescription(tempCode: integer): string;
begin
  with qryGetProcess do
    begin
      close;
      sql.clear;
      sql.text := 'Select * from Process where Process = ''' + inttostr(tempCode) + '''';
      open;
      result := fieldbyname('Process_Description').asstring;
    end;
end;

function TdtmdlQuotes.GetHeaderCountJB: integer;
begin
  result := qryQuotesJB.RecordCount;
end;

{ TQuoteDept }

function TQuoteDept.Clone: TQuoteDept;
begin
  Result := TQuoteDept.Create(FParent);
  Result.Department       :=    Self.Department;
  Result.DepartmentName  :=    Self.DepartmentName;
  Result.Specification   :=    Self.Specification;
  Result.SpecificationID :=    Self.SpecificationID;
  Result.QDepartmentNo    :=    Self.QDepartmentNo;
end;

constructor TQuoteDept.Create(Quote: TQuote);
begin
  FParent := Quote;
end;

destructor TQuoteDept.Destroy;
begin

  inherited;
end;

procedure TQuoteDept.LoadFromDB;
begin
end;

procedure TQuoteDept.SaveToDB;
var
  iTempNarr: integer;
begin
  with FParent.FDataModule.qryQAddProcessGroup do
  begin
    close;
    ParamByName('Quote').Asfloat := FParent.DbKey;
    ParamByName('Process_Group').AsInteger := Department;
    ParamByName('Quote_Specification').asstring := trim(Specification);

    if (parent.FQMode = qReQuote) OR (parent.FQMode = qCopy) then
      SpecificationID := 0;

    iTempNarr := SpecificationID;
    parent.FDataModule.SaveNarrative(iTempNarr,Specification);
    SpecificationID := iTempNarr;
    if SpecificationID = 0 then
      ParamByName('Quote_Specification_id').clear
    else
      ParamByName('Quote_Specification_id').Asinteger := SpecificationID;
    ExecSQL;
  end;
end;

procedure TQuoteDept.SetDepartment(const Value: integer);
begin
  FDepartment := Value;
end;

procedure TQuoteDept.SetDepartmentName(const Value: string);
begin
  FDepartmentName := Value;
end;

procedure TQuoteDept.SetParent(const Value: TQuote);
begin
  FParent := Value;
end;

procedure TQuoteDept.SetQDepartmentNo(const Value: integer);
begin
  FQDepartmentNo := Value;
end;

procedure TQuoteDept.SetSpecification(const Value: string);
begin
  FSpecification := Value;
end;

procedure TQuoteDept.SetSpecificationID(const Value: integer);
begin
  FSpecificationID := Value;
end;

{ TQuoteDepts }

procedure TQuoteDepts.Add(aDepartment: TQuoteDept);
begin
  FItems.Add(aDepartment);
end;

procedure TQuoteDepts.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteDept(FItems[i]).Free;
end;

function TQuoteDepts.Clone: TQuoteDepts;
var
  i : integer;
begin
  Result := TQuoteDepts.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TQuoteDept(FItems[i]).Clone);
end;

constructor TQuoteDepts.Create(Quote: TQuote);
begin
  FParent := Quote;
  FItems := TList.Create;
end;

procedure TQuoteDepts.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TQuoteDepts.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteDept(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TQuoteDepts.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TQuoteDepts.GetItems(Index: integer): TQuoteDept;
begin
  Result := TQuoteDept(FItems[Index]);
end;

function TQuoteDepts.IndexOf(const DepartmentNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TQuoteDept(FItems[i]).QDepartmentNo = DepartmentNo then
      Result := i;
end;

procedure TQuoteDepts.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TQuoteDept(FItems[i]).QDepartmentNo := (i+1);
end;

procedure TQuoteDepts.SetItems(Index: integer; const Value: TQuoteDept);
begin

end;

function TdtmdlQuotes.IsProspect(tempCode: integer): boolean;
begin
  result := false;
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCode;
      open;
      {Prospect if customer_Status is > 1 and < 100}
      result := ((fieldbyname('Customer_Status').asinteger > 1) and (fieldbyname('Customer_Status').asinteger < 100));
    end;
end;

end.
