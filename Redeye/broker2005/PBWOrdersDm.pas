unit PBWOrdersDm;

interface

uses
  SysUtils, Classes, DB, PBNarrativeDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TWOMode   = (woAdd, woChange, woRaise, woDelete, woRepeat, woView);
  TWOEvMode   = (woevAdd, woevChange, woevDelete, woevView);
  TWODelivMode   = (wodelAdd, wodelChange, wodelDelete, wodelView);

  TdtmdlWOrders = class(TDataModule)
    qryWOHeader: TFDQuery;
    qryWOAddHeader: TFDQuery;
    qryWOUpHeader: TFDQuery;
    qryZero: TFDQuery;
    qryWOHeaderGrid: TFDQuery;
    dtsWOHeaderGrid: TDataSource;
    qryAllWOrders: TFDQuery;
    qryOperator: TFDQuery;
    dsOperator: TDataSource;
    qryCompany: TFDQuery;
    qryRep: TFDQuery;
    dsRep: TDataSource;
    qryCustReps: TFDQuery;
    qryCustContacts: TFDQuery;
    dtsCustContacts: TDataSource;
    qryReserveSlot: TFDQuery;
    qryGetReservedSlot: TFDQuery;
    qryWOGetLast: TFDQuery;
    qryGetJB: TFDQuery;
    qryUpdJB: TFDQuery;
    qryAddJB: TFDQuery;
    GetLastJBSQL: TFDQuery;
    UpdLastJBSQL: TFDQuery;
    qryCheckJobBag: TFDQuery;
    GetLastJBLineSQL: TFDQuery;
    qryAddJBHead: TFDQuery;
    qrySpare: TFDQuery;
    qryGetProcesses: TFDQuery;
    qryWOAddProcess: TFDQuery;
    qryWOProcess: TFDQuery;
    qryWOAllProcesses: TFDQuery;
    qryWOEvent: TFDQuery;
    qryWOAddEvent: TFDQuery;
    qryWOAllDeliveries: TFDQuery;
    qryWODelivery: TFDQuery;
    qryWOAddDelivery: TFDQuery;
    dtsCourierService: TDataSource;
    qryCourierService: TFDQuery;
    qryWOAllEvents: TFDQuery;
    qryGetJBLine: TFDQuery;
    qryUpdJBHead: TFDQuery;
    qryWOProcessQstn: TFDQuery;
    qryWOAddProcessQstn: TFDQuery;
    qryGetWOQuestions: TFDQuery;
    qryGetQuestions: TFDQuery;
    qryGetQuestionList: TFDQuery;
    qryVatCode: TFDQuery;
    dtsVatCode: TDataSource;
    dtsCustReps: TDataSource;
    qryAccManager: TFDQuery;
    dtsAccManager: TDataSource;
    qryGetOpAccountTeam: TFDQuery;
    qryGetAccountTeam: TFDQuery;
    qrySelectedWO: TFDQuery;
    qryPriceUnit: TFDQuery;
    dtsPriceUnit: TDataSource;
    qryGetPriceUnit: TFDQuery;
    qryGetJBWO: TFDQuery;
    qryAddJBWO: TFDQuery;
    qryUpdWONumber: TFDQuery;
    qryGetLastWOJB: TFDQuery;
    qryGetPackage: TFDQuery;
    qryGetCustomerRep: TFDQuery;
    qryGetRep: TFDQuery;
    qryUpWODeliv: TFDQuery;
    qryUpWOStatus: TFDQuery;
    qryGetWOStatus: TFDQuery;
    qryGetJobBagWO: TFDQuery;
    qryPaperSize: TFDQuery;
    dtsPaperSize: TDataSource;
    qryGetPaperSize: TFDQuery;
    qryWOJBProcesses: TFDQuery;
    qryGetProcessList: TFDQuery;
    qryGetWIProcess: TFDQuery;
    qryGetProcess: TFDQuery;
    dtsProcessPaperSize: TDataSource;
    qryProcessPaperSize: TFDQuery;
    qryGetOldQuestions: TFDQuery;
    qryWCGroup: TFDQuery;
    dtsWCGroup: TDataSource;
    dtsWC: TDataSource;
    qryWC: TFDQuery;
    OldqryWCGroup: TFDQuery;
    qryGetCourierService: TFDQuery;
    qryCourierSort: TFDQuery;
    dtsCourierSort: TDataSource;
    qryCourierSpeed: TFDQuery;
    dtsCourierSpeed: TDataSource;
    qryGetCompAddr: TFDQuery;
    qryGetCustAddr: TFDQuery;
    qryGetAddHocAddr: TFDQuery;
    dtsAddress: TDataSource;
    qryGetCompBrAddr: TFDQuery;
  private
    function CalculatePrice(const PriceUnit: integer; Quantity, Price: double): double;
    function GetCurrentWOrder: integer;
    function GetCurrentWOrderNumber: double;
    function GetHeaderCount: integer;
    procedure FreeCompanyRecord;
    procedure LockCompanyRecord;
    function GetJobBagLine(tempCode: integer): integer;
  public
    BranchName: string;
    Customer: integer;
    CustomerName: string;
    CustomerRef: string;
    Description: string;
    Status: string;
    OrdQtyDesc: string;
    JobBag: string;
    Operator: integer;
    NotInJobBag: boolean;
    Rep: integer;
    RepIsSubRep: boolean;
    ShowInactive: Boolean;
    ShowWIP: Boolean;
    OrderDate: Tdatetime;
    function GetAccountTeamName(tempCode: integer): string;
    function GetReturnAddress(iTempCode, iTempBranch, iTempType: Integer): string;
    function GetCustomerRep(tempCust, tempBranch: integer): integer;
    function GetOpAccountTeam(tempCode: integer): integer;
    function GetOpAccountTeamName(tempCode: integer): string;
    function GetCompanyVatCode: integer;
    function CheckJobBagExist(TempCode: integer): boolean;
    function GetJobBagNo(tempCode: integer): integer;
    function GetNarrative(const iNarrative: integer): string;
    function GetNextJobBagNumber: integer;
    function GetNextJobBagLineNumber(tempNo: integer): integer;
    function GetNextJobBagWorksOrderNo(tempNo: integer): integer;
    function GetPackageSizeDescr(tempCode: integer): string;
    function GetRepName(tempCode: integer): string;
    function GetProcessNumberType(tempCode: integer): string;
    function GetPaperPromptNarrative(tempCode: integer): string;
    function ShowProcessSimplexDuplex(tempCode: integer): string;
    function ShowProcessPaperSize(tempCode: integer): string;
    function UsingSearch: boolean;
    procedure RefreshData;
    procedure RefreshJBData;
    procedure SetJBStatus(tmpJB: integer);
    procedure SetWOStatus(tmpWO, tmpStatus: integer);
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    property CurrentWOrder : integer read GetCurrentWOrder;
    property CurrentWOrderNumber : double read GetCurrentWOrderNumber;
    property HeaderCount: integer read GetHeaderCount;
  end;

  TWOrder = class;

  TWOQuestions  = class;

  TWOPart    = class
  private
  public
  end;

  TWOParts   = class;

  TWODeliv   = class
  private
    FWeight: integer;
    FQuantity: integer;
    FCourier: integer;
    FService: integer;
    FQuantityAct: integer;
    FPackSize: integer;
    FDelivNumber: integer;
    FServiceDescr: string;
    FCourierName: string;
    FDelivDateAct: TDateTime;
    FDelivDate: TDatetime;
    FParent: TWOrder;
    FCustomerAccount: boolean;
    FPackSizeDescr: string;
    FAddress2: string;
    FAddress1: string;
    FAddress3: string;
    FPostcode: string;
    FTown: string;
    FAddressReq: boolean;
    FCustomerAccountCode: string;
    FCustomerAccountName: string;
    FDelivName: string;
    FHandOverDate: TDateTime;
    FDeferred: boolean;
    FSpeed: integer;
    FSort: integer;
    FReturnAddressRequired: boolean;
    procedure SetCourier(const Value: integer);
    procedure SetCourierName(const Value: string);
    procedure SetDelivDate(const Value: TDatetime);
    procedure SetDelivDateAct(const Value: TDateTime);
    procedure SetDelivNumber(const Value: integer);
    procedure SetPackSize(const Value: integer);
    procedure SetParent(const Value: TWOrder);
    procedure SetQuantity(const Value: integer);
    procedure SetQuantityAct(const Value: integer);
    procedure SetService(const Value: integer);
    procedure SetServiceDescr(const Value: string);
    procedure SetWeight(const Value: integer);
    procedure SetCustomerAccount(const Value: boolean);
    procedure SetPackSizeDescr(const Value: string);
    procedure SetAddress1(const Value: string);
    procedure SetAddress2(const Value: string);
    procedure SetAddress3(const Value: string);
    procedure SetPostcode(const Value: string);
    procedure SetTown(const Value: string);
    procedure SetAddressReq(const Value: boolean);
    procedure SetCustomerAccountCode(const Value: string);
    procedure SetCustomerAccountName(const Value: string);
    procedure SetDelivName(const Value: string);
    procedure SetHandOverDate(const Value: TDateTime);
    procedure SetDeferred(const Value: boolean);
    procedure SetSort(const Value: integer);
    procedure SetSpeed(const Value: integer);
    procedure SetReturnAddressRequired(const Value: boolean);
  public
    constructor Create(WOrder : TWOrder);
    destructor Destroy; override;
    function Clone : TWODeliv;
    procedure LoadFromDB;
    procedure SaveToDB;
    procedure SaveDelivery;
    property AddressReq: boolean read FAddressReq write SetAddressReq;
    property Courier: integer read FCourier write SetCourier;
    property CourierName: string read FCourierName write SetCourierName;
    property CustomerAccount: Boolean read FCustomerAccount write SetCustomerAccount;
    property CustomerAccountCode: string read FCustomerAccountCode write SetCustomerAccountCode;
    property CustomerAccountName: string read FCustomerAccountName write SetCustomerAccountName;
    property Deferred: boolean read FDeferred write SetDeferred;
    property DelivDate: TDatetime read FDelivDate write SetDelivDate;
    property DelivDateAct: TDateTime read FDelivDateAct write SetDelivDateAct;
    property DelivName: string read FDelivName write SetDelivName;
    property DelivNumber: integer read FDelivNumber write SetDelivNumber;
    property HandOverDate: TDateTime read FHandOverDate write SetHandOverDate;
    property PackSize: integer read FPackSize write SetPackSize;
    property PackSizeDescr: string read FPackSizeDescr write SetPackSizeDescr;
    property Parent: TWOrder read FParent write SetParent;
    property Quantity: integer read FQuantity write SetQuantity;
    property QuantityAct: integer read FQuantityAct write SetQuantityAct;
    property ReturnAddressRequired: boolean read FReturnAddressRequired write SetReturnAddressRequired;
    property Service: integer read FService write SetService;
    property ServiceDescr: string read FServiceDescr write SetServiceDescr;
    property Sort: integer read FSort write SetSort;
    property Speed: integer read FSpeed write SetSpeed;
    property Weight: integer read FWeight write SetWeight;
    property Address1: string read FAddress1 write SetAddress1;
    property Address2: string read FAddress2 write SetAddress2;
    property Address3: string read FAddress3 write SetAddress3;
    property Town: string read FTown write SetTown;
    property Postcode: string read FPostcode write SetPostcode;
  end;

  TWODelivs  = class;

  TWOEvent   = class
  private
    FEventNumber: integer;
    FOperator: integer;
    FOperatorName: string;
    FDateEntered: TDateTime;
    FNarrative: TNarrative;
    FParent: TWOrder;
    procedure SetDateEntered(const Value: TDateTime);
    procedure SetEventNumber(const Value: integer);
    procedure SetNarrative(const Value: TNarrative);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetParent(const Value: TWOrder);
  public
    constructor Create(WOrder : TWOrder);
    destructor Destroy; override;
    function Clone : TWOEvent;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DateEntered: TDateTime read FDateEntered write SetDateEntered;
    property EventNumber: integer read FEventNumber write SetEventNumber;
    property Narrative: TNarrative read FNarrative write SetNarrative;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property Parent: TWOrder read FParent write SetParent;
  end;

  TWOEvents = class;

  TWOProcess = class
  private
    Fparent: TWOrder;
    FProcess: integer;
    FProcessName: string;
    FNarrative: TNarrative;
    FWOProcessNo: integer;
    FWOQuestions: TWOQuestions;
    FTargetDate: TDateTime;
    FQuantity: integer;
    FNumberUp: integer;
    FPaperSize: integer;
    FCustPaperSize: string;
    FLaserFormat: string;
    FNoOfHours: double;
    FTeamCount: integer;
    FWorkCentre: integer;
    FWorkCentreGroup: integer;
    FUseWorkCentres: boolean;
    FProcessGroup: integer;
    procedure Setparent(const Value: TWOrder);
    procedure SetNarrative(const Value: TNarrative);
    procedure SetProcess(const Value: integer);
    procedure SetProcessName(const Value: string);
    procedure SetWOProcessNo(const Value: integer);
    procedure SetTargetDate(const Value: TDateTime);
    procedure SetQuantity(const Value: integer);
    procedure SetNumberUp(const Value: integer);
    procedure SetCustPaperSize(const Value: string);
    procedure SetLaserFormat(const Value: string);
    procedure SetPaperSize(const Value: integer);
    procedure SetNoOfHours(const Value: double);
    procedure SetTeamCount(const Value: integer);
    procedure SetWorkCentre(const Value: integer);
    procedure SetWorkCentreGroup(const Value: integer);
    procedure SetUseWorkCentres(const Value: boolean);
    procedure SetProcessGroup(const Value: integer);
  public
    constructor Create(WOrder : TWOrder);
    destructor Destroy; override;
    procedure Clear;
    function Clone : TWOProcess;
    procedure LoadQuestions;
    procedure LoadFromDB;
    procedure SaveToDB;
    procedure SaveQuestions;
    property UseWorkCentres: boolean read FUseWorkCentres write SetUseWorkCentres;
    property Narrative: TNarrative read FNarrative write SetNarrative;
    property NoOfHours: double read FNoOfHours write SetNoOfHours;
    property NumberUp: integer read FNumberUp write SetNumberUp;
    property Parent: TWOrder read Fparent write Setparent;
    property Process: integer read FProcess write SetProcess;
    property ProcessName: string read FProcessName write SetProcessName;
    property ProcessGroup: integer read FProcessGroup write SetProcessGroup;
    property Quantity: integer read FQuantity write SetQuantity;
    property LaserFormat: string read FLaserFormat write SetLaserFormat;
    property CustPaperSize: string read FCustPaperSize write SetCustPaperSize;
    property PaperSize: integer read FPaperSize write SetPaperSize;
    property Questions : TWOQuestions read FWOQuestions;
    property TargetDate: TDateTime read FTargetDate write SetTargetDate;
    property TeamCount: integer read FTeamCount write SetTeamCount;
    property WOProcessNo: integer read FWOProcessNo write SetWOProcessNo;
    property WorkCentre: integer read FWorkCentre write SetWorkCentre;
    property WorkCentreGroup: integer read FWorkCentreGroup write SetWorkCentreGroup;
  end;

  TWOProcesses = class;

  TWOQuestion = class
  private
    FQuestionNo: integer;
    FProcess: integer;
    FQuestion: integer;
    FQuestionText: string;
    FAnswer: string;
    FParent: TWOProcess;
    FPromptType: string;
    FMandatory: boolean;
    procedure SetAnswer(const Value: string);
    procedure SetProcess(const Value: integer);
    procedure SetQuestion(const Value: integer);
    procedure SetQuestionNo(const Value: integer);
    procedure SetQuestionText(const Value: string);
    procedure SetPromptType(const Value: string);
    procedure SetMandatory(const Value: boolean);
  public
    constructor Create(WOProcess: TWOProcess);
    destructor Destroy; override;
    function Clone : TWOQuestion;
    procedure LoadFromDB;
    procedure SaveToDB;
    property Answer: string read FAnswer write SetAnswer;
    property Mandatory: boolean read FMandatory write SetMandatory;
    property Parent: TWOProcess read FParent;
    property Process: integer read FProcess write SetProcess;
    property PromptType: string read FPromptType write SetPromptType;
    property Question: integer read FQuestion write SetQuestion;
    property QuestionNo: integer read FQuestionNo write SetQuestionNo;
    property QuestionText: string read FQuestionText write SetQuestionText;
  end;

  TWOParts     = class
  private
  public
  end;

  TWOQuestions = class
  private
    FItems : TList;
    FParent: TWOProcess;
    function GetCount: integer;
    function GetItems(Index: integer): TWOQuestion;
    procedure SetItems(Index: integer; const Value: TWOQuestion);
  public
    constructor Create(WOProcess : TWOProcess);
    destructor Destroy; override;
    procedure Add(aQuestion : TWOQuestion);
    procedure Clear;
    function  Clone : TWOQuestions;
    procedure Delete(const Index : integer);
    function  IndexOf(const QuestionNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TWOQuestion read GetItems write SetItems;
      default;
    property Parent : TWOProcess read FParent;
  end;

  TWODelivs    = class
  private
    FParent: TWOrder;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TWODeliv;
    procedure SetItems(Index: integer; const Value: TWODeliv);
    function GetTotalAssigned: Double;
  public
    constructor Create(WOrder : TWOrder);
    destructor Destroy; override;
    procedure Add(aDeliv: TWODeliv);
    procedure Clear;
    function  Clone : TWODelivs;
    procedure Delete(const Index : integer);
    function  IndexOf(const DelivNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TWODeliv read GetItems write SetItems;
      default;
    property Parent : TWOrder read FParent;
    property TotalAssigned: Double read GetTotalAssigned;

  end;

  TWOEvents    = class
  private
    FItems: TList;
    FParent: TWOrder;
    function GetCount: integer;
    function GetItems(Index: integer): TWOEvent;
    procedure SetItems(Index: integer; const Value: TWOEvent);
  public
    constructor Create(WOrder : TWOrder);
    destructor Destroy; override;
    procedure Add(aEvent: TWOEvent);
    procedure Clear;
    function  Clone : TWOEvents;
    procedure Delete(const Index : integer);
    function  IndexOf(const EventNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TWOEvent read GetItems write SetItems;
      default;
    property Parent : TWOrder read FParent;
  end;

  TWOProcesses  = class
  private
    FItems: TList;
    FParent: TWOrder;
    function GetCount: integer;
    function GetItems(Index: integer): TWOProcess;
    procedure SetItems(Index: integer; const Value: TWOProcess);
  public
    constructor Create(WOrder : TWOrder);
    destructor Destroy; override;
    procedure Add(aProcess : TWOProcess);
    procedure Clear;
    function  Clone : TWOProcesses;
    procedure Delete(const Index : integer);
    function  IndexOf(const ProcessNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TWOProcess read GetItems write SetItems;
      default;
    property Parent : TWOrder read FParent;
  end;

  TWOrder = class
  private
    FEstimatedCost: currency;
    FQuantityEst: double;
    FWOStatus: integer;
    FOperator: integer;
    FVersionNo: integer;
    FSIMethod: string;
    FdbKey: integer;
    FProductionType: integer;
    FBranch: integer;
    FContact: integer;
    FRep: integer;
    FOfficeContact: integer;
    FCustomer: integer;
    FOperatorName: string;
    FWONumber: double;
    FRepName: string;
    FDescription: string;
    FOfficeContactName: string;
    FWOStatusDesc: string;
    FCustomerName: string;
    FCustomerPO: string;
    FWONumberPrevious: double;
    FProductionTypeDesc: string;
    FContactName: string;
    FBranchName: string;
    FSIMethodDesc: string;
    FEstimatedInvoiceDate: TDateTime;
    FDateRequired: TDateTime;
    FEstimatedStartDate: TDateTime;
    FWODate: TDateTime;
    FDataModule: TdtmdlWOrders;
    FQuantityAct: double;
    FInactive: string;
    FJobBagNo: integer;
    FWOProcesses: TWOProcesses;
    FWOEvents: TWOEvents;
    FWODelivs: TWODelivs;
    FVatRate: double;
    FVatCode: integer;
    FAccountTeam: integer;
    FAccountTeamName: string;
    FJobBagLine: integer;
    FEstimatedSellPrice: currency;
    FSellUnit: integer;
    FIsPerso100: string;
    FAccountManagerName: string;
    FWOCount: integer;
    FNarrative: integer;
    FNarrativeText: string;
    FWOMode: TWOMode;
    FReturnCustomerAdHoc: integer;
    FReturnCompany: integer;
    FReturnCustomer: integer;
    FReturnBranch: integer;
    FReturnCompanyBranch: integer;
    procedure AddZero;
    procedure DeleteZero;
    procedure SetBranch(const Value: integer);
    procedure SetBranchName(const Value: string);
    procedure SetContact(const Value: integer);
    procedure SetContactName(const Value: string);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetCustomerPO(const Value: string);
    procedure SetDateRequired(const Value: TDateTime);
    procedure SetdbKey(const Value: integer);
    procedure SetDescription(const Value: string);
    procedure SetEstimatedCost(const Value: currency);
    procedure SetEstimatedInvoiceDate(const Value: TDateTime);
    procedure SetEstimatedStartDate(const Value: TDateTime);
    procedure SetOfficeContact(const Value: integer);
    procedure SetOfficeContactName(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetProductionType(const Value: integer);
    procedure SetProductionTypeDesc(const Value: string);
    procedure SetQuantityEst(const Value: double);
    procedure SetRep(const Value: integer);
    procedure SetRepName(const Value: string);
    procedure SetSIMethod(const Value: string);
    procedure SetSIMethodDesc(const Value: string);
    procedure SetVersionNo(const Value: integer);
    procedure SetWODate(const Value: TDateTime);
    procedure SetWONumber(const Value: double);
    procedure SetWONumberPrevious(const Value: double);
    procedure SetWOStatus(const Value: integer);
    procedure SetWOStatusDesc(const Value: string);
    procedure SetQuantityAct(const Value: double);
    procedure SetInactive(const Value: string);
    function GetNextWOdbNumber: integer;
    function GetNextWONumber: integer;
    procedure SetJobBagNo(const Value: integer);
    procedure SetVatCode(const Value: integer);
    procedure SetVatRate(const Value: double);
    procedure SetAccountTeam(const Value: integer);
    procedure SetAccountTeamName(const Value: string);
    procedure SetJobBagLine(const Value: integer);
    procedure SetEstimatedSellPrice(const Value: currency);
    procedure SetSellUnit(const Value: integer);
    procedure SetIsPerso100(const Value: string);
    procedure SetAccountManagerName(const Value: string);
    function GetWorksOrderJBNumber: double;
    procedure SetWOCount(const Value: integer);
    procedure SetNarrative(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetWOMode(const Value: TWOMode);
    procedure SetReturnBranch(const Value: integer);
    procedure SetReturnCompany(const Value: integer);
    procedure SetReturnCustomer(const Value: integer);
    procedure SetReturnCustomerAdHoc(const Value: integer);
    procedure SetReturnCompanyBranch(const Value: integer);
  public
    constructor Create(DataModule : TdtmdlWOrders);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TWOrder;
    procedure DeleteDeliveries;
    procedure DeleteEvents;
    procedure DeleteProcesses;
    procedure DeleteFromDB;
    procedure LoadFromDB;
    procedure LoadProcesses;
    procedure LoadProcessQuestions;
    procedure LoadDeliveries;
    procedure LoadEvents;
    procedure SaveToDB(TempAll: boolean);
    procedure SaveJBLine;
    procedure SaveWONumber;
    procedure SaveProcesses;
    procedure SaveDeliveries;
    procedure SaveEvents;
    procedure SaveStatus;
    function GetStatusDescription(tmpStatus: integer): string;
    property AccountManagerName: string read FAccountManagerName write SetAccountManagerName;
    property AccountTeam: integer read FAccountTeam write SetAccountTeam;
    property AccountTeamName: string read FAccountTeamName write SetAccountTeamName;
    property Branch: integer read FBranch write SetBranch;
    property BranchName: string read FBranchName write SetBranchName;
    property Contact: integer read FContact write SetContact;
    property ContactName: string read FContactName write SetContactName;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property CustomerPO: string read FCustomerPO write SetCustomerPO;
    property DataModule: TdtmdlWOrders read FDataModule;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property dbKey: integer read FdbKey write SetdbKey;
    property Deliveries: TWODelivs read FWODelivs;
    property Description: string read FDescription write SetDescription;
    property EstimatedCost: currency read FEstimatedCost write SetEstimatedCost;
    property EstimatedSellPrice: currency read FEstimatedSellPrice write SetEstimatedSellPrice;
    property EstimatedStartDate: TDateTime read FEstimatedStartDate write SetEstimatedStartDate;
    property EstimatedInvoiceDate: TDateTime read FEstimatedInvoiceDate write SetEstimatedInvoiceDate;
    property Events: TWOEvents read FWOEvents;
    property Inactive: string read FInactive write SetInactive;
    property IsPerso100: string read FIsPerso100 write SetIsPerso100;
    property JobBagNo: integer read FJobBagNo write SetJobBagNo;
    property JobBagLine: integer read FJobBagLine write SetJobBagLine;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property Processes: TWOProcesses read FWOProcesses;
    property ProductionType: integer read FProductionType write SetProductionType;
    property ProductionTypeDesc: string read FProductionTypeDesc write SetProductionTypeDesc;
    property QuantityEst: double read FQuantityEst write SetQuantityEst;
    property QuantityAct: double read FQuantityAct write SetQuantityAct;
    property ReturnCompany: integer read FReturnCompany write SetReturnCompany;
    property ReturnCompanyBranch: integer read FReturnCompanyBranch write SetReturnCompanyBranch;
    property ReturnCustomer: integer read FReturnCustomer write SetReturnCustomer;
    property ReturnBranch: integer read FReturnBranch write SetReturnBranch;
    property ReturnCustomerAdHoc: integer read FReturnCustomerAdHoc write SetReturnCustomerAdHoc;
    property OfficeContact: integer read FOfficeContact write SetOfficeContact;
    property WOCount: integer read FWOCount write SetWOCount;
    property OfficeContactName: string read FOfficeContactName write SetOfficeContactName;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property Rep: integer read FRep write SetRep;
    property RepName: string read FRepName write SetRepName;
    property SellUnit: integer read FSellUnit write SetSellUnit;
    property SIMethod: string read FSIMethod write SetSIMethod;
    property SIMethodDesc: string read FSIMethodDesc write SetSIMethodDesc;
    property VatCode: integer read FVatCode write SetVatCode;
    property VatRate: double read FVatRate write SetVatRate;
    property VersionNo: integer read FVersionNo write SetVersionNo;
    property WODate: TDateTime read FWODate write SetWODate;
    property WOMode: TWOMode read FWOMode write SetWOMode;
    property WONumber: double read FWONumber write SetWONumber;
    property WONumberPrevious: double read FWONumberPrevious write SetWONumberPrevious;
    property WOStatus: integer read FWOStatus write SetWOStatus;
    property WOStatusDesc: string read FWOStatusDesc write SetWOStatusDesc;
  end;
var
  dtmdlWOrders: TdtmdlWOrders;

implementation

uses pbDatabase, ComObj, ActiveX, pbMainMenu;

{$R *.dfm}

{ TWOrder }

procedure TWOrder.AddZero;
begin
  { To overcome problems with empty tables and NULL values,
    we write dummy records with key value zero which will
    be deleted at the end of reserving a slot. }
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO Customer(Customer, Name) VALUES(0,'' '')');
    try
      ExecSQL;
    except { ignore error, may be a record lying around from a failed attempt }
    end;
    SQL.Clear;
    SQL.Add('INSERT INTO Customer_Branch');
    SQL.Add('(Customer, Branch_No, Name, Building_No_name,');
    SQL.Add('Street, Town, Postcode, Phone)');
    SQL.Add('VALUES(0,0,'' '','' '','' '','' '','' '','' '')');
    try
      ExecSQL;
    except { ignore error, may be a record lying around from a failed attempt }
    end;
    SQL.Clear;
    SQL.Add('INSERT INTO Customer_Contact');
    SQL.Add('(Customer, Branch_No, Contact_no, Name, Contact_type)');
    SQL.Add('VALUES(0,0,0,'' '',1)');
    try
      ExecSQL;
    except { ignore error, may be a record lying around from a failed attempt }
    end;

    SQL.Clear;
    SQL.Add('INSERT INTO Works_Order (Works_Order, Customer, Branch_no, Contact_no, Description, Works_Order_number, Date_Required, Date_point, ');
    SQL.Add('Estimated_Quantity, Actual_quantity, Works_Order_Status, Date_Start)');
    SQL.Add('VALUES(0,0,0,0,'' '','' '',0,0,0,0,10,0)');
    try
      ExecSQL;
    except { ignore error, may be a record lying around from a failed attempt }
    end;
  end;
end;

procedure TWOrder.DeleteZero;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Works_Order WHERE Works_Order=0');
    try
      ExecSQL;
    except { ignore error, another user may have deleted already }
    end;

    SQL.Clear;
    SQL.Add('DELETE FROM Customer_Contact WHERE ');
    SQL.Add('Customer=0 AND Branch_No=0 AND Contact_no=0');
    try
      ExecSQL;
    except { ignore error, another user may have deleted already }
    end;
    SQL.Clear;
    SQL.Add('DELETE FROM Customer_Branch WHERE ');
    SQL.Add('Customer=0 AND Branch_No=0');
    try
      ExecSQL;
    except { ignore error, another user may have deleted already }
    end;
    SQL.Clear;
    SQL.Add('DELETE FROM Customer WHERE Customer=0');
    try
      ExecSQL;
    except { ignore error, another user may have deleted already }
    end;
  end;
end;

function TWOrder.GetNextWOdbNumber: integer;
var
  aGuid : TGUID;
begin
  { To prevent collisions in a multi-user environment, we get the next
    available works order key by unconditionally writing a dummy record into
    the database then reading it back.  Using a GUID ensures we always
    get a unique stamp on the record to retrieve it with. }
  Result := 0;
  AddZero;
  try
    with FDataModule.qryReserveSlot do
    begin
      if CoCreateGuid(aGuid) <> S_OK then
        Raise Exception.Create('CoCreateGuid failed');
      ParamByname('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with FDataModule.qryGetReservedSlot do
    begin
      Close;
      ParamByname('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Works_Order').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

function TWOrder.GetWorksOrderJBNumber: double;
var
  TempNext: integer;
begin
  Result := JobBagNo + ((WOCount+1)/100);

end;

function TWOrder.GetNextWONumber: integer;
var
  tempWO: integer;
begin
  FDataModule.LockCompanyRecord;

  try
    try
      with FDataModule.qryWOGetLast do
        begin
          close;
          open;
          tempWO := fieldbyname('Last_Works_Order_number').asinteger + 1;
        end;

      with FDataModule.qryZero do
        begin
          Close ;
          SQL.Clear ;
          SQL.Add('Update Company') ;
          SQL.Add('Set Last_Works_order_number = ' + IntToStr(tempWO)) ;
          ExecSQL ;
        end;

      result := tempWO;
    except on E: Exception do
      begin
        Result := -1;
        Raise Exception.Create('Failed to get next works order number:' + #13 + E.Message);
      end;
    end;
  finally
    FDataModule.FreeCompanyRecord;
  end;
end;

procedure TWOrder.Clear;
begin
  Customer :=       0;
  CustomerName :=   '';
  WODate :=           0;
  FWODelivs.Clear;
  FWOEvents.Clear;
  FWOProcesses.Clear;
end;

function TWOrder.Clone: TWOrder;
begin
  Result := TWOrder.Create(FDataModule);
  Result.AccountManagerName   := self.AccountManagerName;
  Result.AccountTeam          := self.AccountTeam;
  Result.AccountTeamName      := self.AccountTeamName;
  Result.Branch               := self.Branch;
  Result.BranchName           := self.BranchName;
  Result.Contact              := self.Contact;
  Result.ContactName          := self.ContactName;
  Result.Customer             := self.Customer;
  Result.CustomerName         := self.CustomerName;
  Result.CustomerPO           := self.CustomerPO;
  Result.DateRequired         := self.DateRequired;
  Result.Description          := self.Description;
  Result.EstimatedCost        := self.EstimatedCost;
  Result.EstimatedSellPrice   := self.EstimatedSellPrice;
  Result.EstimatedStartDate   := self.EstimatedStartDate;
  Result.EstimatedInvoiceDate := self.EstimatedInvoiceDate;
  Result.Inactive             := self.Inactive;
  Result.IsPerso100           := self.IsPerso100;
  Result.JobBagNo             := self.JobBagNo;
  Result.JobBagLine           := self.JobBagLine;
  Result.Narrative            := self.Narrative;
  Result.NarrativeText        := self.NarrativeText;
  Result.ProductionType       := self.ProductionType;
  Result.ProductionTypeDesc   := self.ProductionTypeDesc;
  Result.QuantityEst          := self.QuantityEst;
  Result.QuantityAct          := self.QuantityAct;
  Result.ReturnCompany        := self.ReturnCompany;
  Result.ReturnCompanyBranch  := self.ReturnCompanyBranch;
  Result.ReturnCustomer       := self.ReturnCustomer;
  Result.ReturnBranch         := self.ReturnBranch;
  Result.ReturnCustomerAdHoc  := self.ReturnCustomerAdHoc;
  Result.OfficeContact        := self.OfficeContact;
  Result.OfficeContactName    := self.OfficeContactName;
  Result.Operator             := self.Operator;
  Result.OperatorName         := self.OperatorName;
  Result.Rep                  := self.Rep;
  Result.RepName              := self.RepName;
  Result.SellUnit             := self.SellUnit;
  Result.SIMethod             := self.SIMethod;
  Result.SIMethodDesc         := self.SIMethodDesc;
  Result.VatCode              := self.VatCode;
  Result.VatRate              := self.VatRate;
  Result.VersionNo            := self.VersionNo;
  Result.WOCount              := self.WOCount;
  Result.WODate               := self.WODate;
  Result.WOMode               := self.WOMode;
  Result.WONumber             := self.WONumber;
  Result.WONumberPrevious     := self.WONumberPrevious;
  Result.WOStatus             := self.WOStatus;
  Result.WOStatusDesc         := self.WOStatusDesc;
  Result.FWODelivs.Free;
  Result.FWODelivs :=  Self.FWODelivs.Clone;
  Result.FWOEvents.Free;
  Result.FWOEvents :=  Self.FWOEvents.Clone;
  Result.FWOProcesses.Free;
  Result.FWOProcesses :=  Self.FWOProcesses.Clone;

end;

constructor TWOrder.Create(DataModule: TdtmdlWOrders);
begin
  FDataModule   := DataModule;
  FWOProcesses  := TWOProcesses.Create(Self);
  FWODelivs     := TWODelivs.Create(Self);
  FWOEvents     := TWOEvents.Create(Self);
end;

procedure TWOrder.DeleteFromDB;
var
  i: integer;
begin
  DeleteEvents;
  DeleteDeliveries;
  DeleteProcesses;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Works_Order WHERE Works_Order =' + IntToStr(DbKey));
    ExecSQL;
  end;

end;

destructor TWOrder.Destroy;
begin
  FWODelivs.Free;
  FWOEvents.Free;
  FWOProcesses.Free;
  inherited;
end;

procedure TWOrder.LoadFromDB;
begin
  { Load the header record then all bits and pieces belonging to the Works Order}
  Clear;
  with FDataModule.qryWOHeader do
  begin
    Close;
    ParamByName('Works_Order').AsInteger := DbKey;
    Open;
    Branch :=                 FieldByName('Branch_No').AsInteger;
    BranchName :=             FieldByName('Branch_Name').Asstring;
    Customer :=               FieldByName('Customer').AsInteger;
    CustomerName :=           FieldByName('Customer_Name').AsString;
    Contact :=                FieldByName('Contact_no').asinteger;
//    ContactName :=          FieldByName('Contact_Name').asstring;
    CustomerPO :=             FieldByName('Cust_Order_no').asstring;
    DateRequired :=           FieldByName('Date_Required').asdatetime;
    Description :=            FieldByName('Description').Asstring;
    EstimatedInvoiceDate :=   FieldByName('Estimated_Invoice_Date').asdatetime;
    EstimatedCost :=          FieldByName('Estimated_Cost').asfloat;
    EstimatedSellPrice :=     Fieldbyname('Estimated_Selling_Price').asfloat;
    EstimatedStartDate :=     FieldByName('Date_Start').asdatetime;
    Inactive :=               FieldByName('Inactive').Asstring;
    IsPerso100 :=             FieldByName('Is_Perso_100_Percent').asstring;
//    JobBagNo :=               FDataModule.GetJobBagNo(dbKey);
//    JobBagLine :=             FDataModule.GetJobBagLine(dbkey);
    Narrative :=              FieldByName('Narrative').AsInteger;
    NarrativeText :=          FDataModule.GetNarrative(Narrative);
    OfficeContact:=           FieldByName('Office_Contact').asinteger;
    AccountManagerName :=     FieldByName('Office_Contact_Name').asstring;
    AccountTeam :=            Fieldbyname('Account_Team').asinteger;
    AccountTeamName :=        FDataModule.GetAccountTeamName(AccountTeam);
    Operator :=               FieldByName('Operator').AsInteger;
    OperatorName :=           Fieldbyname('Operator_Name').asstring;
    ProductionType :=         FieldByName('Production_Type').asinteger;
    ProductionTypeDesc :=     FieldByName('Production_Type_Description').asstring;
    QuantityEst :=            FieldByName('Estimated_Quantity').asfloat;
    QuantityAct :=            Fieldbyname('Actual_Quantity').asfloat;

    {Return of Address details}
    ReturnCompany :=          Fieldbyname('Return_Company').asinteger;
    ReturnCompanyBranch :=    Fieldbyname('Return_Company_Branch').asinteger;
    ReturnCustomer :=         Fieldbyname('Return_Customer').asinteger;
    ReturnBranch :=           Fieldbyname('Return_Branch_no').asinteger;
    ReturnCustomerAdHoc :=    Fieldbyname('Return_Customer_Ad_Hoc_Address').asinteger;

    if woMode = woRepeat then
      Rep :=                  FDataModule.GetCustomerRep(Customer, Branch)
    else
      Rep :=                  FieldByName('Rep').Asinteger;
    RepName :=                FieldByName('Rep_Name').asstring;
    SellUnit :=               Fieldbyname('Sell_unit').asinteger;
    SIMethod :=               FieldByName('Sales_Invoice_Method').asstring;
    VatCode :=                FieldbyName('Vat_Code').asinteger;
    VatRate :=                FieldbyName('Vat_Rate').asfloat;
    VersionNo :=              FieldByName('Version_Number').asinteger;
    WOCount :=                0;
    WODate :=                 FieldByName('Date_Point').asdatetime;
    WONumber :=               FieldByName('Works_Order_Number').asfloat;
    WONumberPrevious :=       FieldByName('Previous_WO_Number').asfloat;
    if woMode = woRepeat then
      WOStatus :=               10
    else
      WOStatus :=               FieldByName('Works_Order_Status').asinteger;
    WOStatusDesc :=           FieldByName('Works_Order_Status_Descr').asstring;
    Close;
  end;
  LoadProcesses;
  LoadProcessQuestions;
  LoadDeliveries;
  if woMode <> woRepeat then
    LoadEvents;
end;

procedure TWOrder.SaveToDB(TempAll: boolean);
var
  iTempNarr: integer;
  woAddJB: boolean;
begin
  woAddJB := false;
  if DbKey = 0 then
    begin
      DbKey     := GetNextWONumber;
      WONumber  := GetWorksOrderJBNumber;
      woAddJB := true;
      with FDataModule.qryWOAddHeader do
        begin
          ParamByName('Works_Order').AsInteger := DbKey;
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Contact_no').AsInteger := Contact;
          ParamByName('Customer').AsInteger := Customer;
          ParamByName('Cust_Order_no').Asstring := CustomerPO;
          ParambyName('Date_Required').asdatetime := DateRequired;
          Parambyname('Description').asstring := Description;
          ParamByName('Estimated_Cost').Asfloat := EstimatedCost;
          Parambyname('Estimated_Selling_Price').asfloat := EstimatedSellPrice;
          ParamByName('Date_Start').Asdatetime := EstimatedStartDate;
          ParamByName('Estimated_Invoice_Date').Asdatetime := EstimatedInvoiceDate;
          if Inactive = '' then
            ParamByName('Inactive').clear
          else
            ParamByName('Inactive').Asstring := Inactive;
          ParamByName('Is_Perso_100_Percent').asstring := IsPerso100;
          if ProductionType = 0 then
            ParamByName('Production_Type').Asinteger := 1
          else
            ParamByName('Production_Type').Asinteger := ProductionType;
          ParamByName('Office_Contact').AsInteger := OfficeContact;
          ParamByName('Operator').AsInteger := frmpbMainMenu.iOperator;
          Parambyname('Estimated_quantity').asfloat := QuantityEst;
          Parambyname('Actual_Quantity').asfloat := QuantityAct;

          Parambyname('Return_Company').clear;
          Parambyname('Return_Customer').clear;
          Parambyname('Return_Branch_no').clear;
          Parambyname('Return_Customer_Ad_Hoc_Address').clear;

          if ReturnCompany <> 0 then
            begin
              Parambyname('Return_Company').asinteger := ReturnCompany;
              Parambyname('Return_Company_Branch').asinteger := ReturnCompany;
            end
          else
          if ReturnCustomer <> 0 then
            begin
              Parambyname('Return_Customer').asinteger := ReturnCustomer;
              Parambyname('Return_Branch_no').asinteger := ReturnBranch;
            end
          else
          if ReturnCustomerAdHoc <> 0 then
            Parambyname('Return_Customer_Ad_Hoc_Address').asinteger := ReturnCustomerAdHoc;

          Parambyname('Rep').asinteger := Rep;
          Parambyname('Sales_Invoice_Method').asstring := 'O';
          if SellUnit = 0 then
            Parambyname('Sell_Unit').clear
          else
            Parambyname('Sell_Unit').asinteger := SellUnit;

          Parambyname('Vat_Code').asinteger := VatCode;

          Parambyname('Version_number').asinteger := VersionNo;
          ParambyName('Works_Order_Number').asfloat := WONumber;
          ParambyName('Date_Point').asdatetime := WODate;
          ParambyName('Previous_WO_Number').asfloat := WONumberPrevious;
          ParamByName('Works_Order_Status').AsInteger := 10;
          if AccountTeam = 0 then
            Parambyname('Account_Team').clear
          else
            Parambyname('Account_Team').AsInteger := AccountTeam;

          iTempNarr := Narrative;
          FDataModule.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Narrative').clear
          else
            ParamByName('Narrative').Asinteger := Narrative;

          ExecSQL;
        end;
    end
  else
  if TempAll then
    begin
      with FDataModule.qryWOUpHeader do
        begin
          ParamByName('Works_Order').AsInteger := DbKey;
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Contact_no').AsInteger := Contact;
          ParamByName('Customer').AsInteger := Customer;
          ParamByName('Cust_Order_no').Asstring := CustomerPO;
          ParambyName('Date_Required').asdatetime := DateRequired;
          Parambyname('Description').asstring := Description;
          ParamByName('Estimated_Cost').Asfloat := EstimatedCost;
          Parambyname('Estimated_Selling_Price').asfloat := EstimatedSellPrice;
          ParamByName('Date_Start').Asdatetime := EstimatedStartDate;
          ParamByName('Estimated_Invoice_Date').Asdatetime := EstimatedInvoiceDate;
          if Inactive = '' then
            ParamByName('Inactive').clear
          else
            ParamByName('Inactive').Asstring := Inactive;
          ParamByName('Is_Perso_100_Percent').asstring := IsPerso100;
          if ProductionType = 0 then
            ParamByName('Production_Type').Asinteger := 1
          else
            ParamByName('Production_Type').Asinteger := ProductionType;
          ParamByName('Office_Contact').AsInteger := OfficeContact;
          Parambyname('Estimated_quantity').asfloat := QuantityEst;
          Parambyname('Actual_Quantity').asfloat := QuantityAct;

          Parambyname('Return_Company').clear;
          Parambyname('Return_Customer').clear;
          Parambyname('Return_Branch_no').clear;
          Parambyname('Return_Customer_Ad_Hoc_Address').clear;

          if ReturnCompany <> 0 then
            begin
              Parambyname('Return_Company').asinteger := ReturnCompany;
              Parambyname('Return_Company_Branch').asinteger := ReturnCompany;
            end
          else
          if ReturnCustomer <> 0 then
            begin
              Parambyname('Return_Customer').asinteger := ReturnCustomer;
              Parambyname('Return_Branch_no').asinteger := ReturnBranch;
            end
          else
          if ReturnCustomerAdHoc <> 0 then
            Parambyname('Return_Customer_Ad_Hoc_Address').asinteger := ReturnCustomerAdHoc;

          Parambyname('Rep').asinteger := Rep;
          Parambyname('Sales_Invoice_Method').asstring := SIMethod;
          if SellUnit = 0 then
            Parambyname('Sell_Unit').clear
          else
            Parambyname('Sell_Unit').asinteger := SellUnit;

          Parambyname('Vat_Code').asinteger := VatCode;

          Parambyname('Version_number').asinteger := VersionNo;
          ParambyName('Works_Order_Number').asfloat := WONumber;
          ParambyName('Date_Point').asdatetime := WODate;
          ParambyName('Previous_WO_Number').asfloat := WONumberPrevious;
          ParamByName('Works_Order_Status').AsInteger := WOStatus;
          if AccountTeam = 0 then
            Parambyname('Account_Team').clear
          else
            Parambyname('Account_Team').AsInteger := AccountTeam;

          iTempNarr := Narrative;
          FDataModule.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Narrative').clear
          else
            ParamByName('Narrative').Asinteger := Narrative;
          ExecSQL;
        end
    end;
  SaveProcesses;
  SaveDeliveries;
  SaveEvents;
  if (woAddJB = true) and (JobBagNo = 0) then
    begin
      SaveJBLine;
      SaveWONumber;
    end
  else
  if JobBagNo <> 0 then
    begin
      SaveJBLine;
      FDataModule.SetJBStatus(JobBagNo);
    end;
end;

procedure TWOrder.SaveJBLine;
var
  i, iJobBag, iJobBagLine: Integer;
begin
  FDataModule.qryGetJBWO.close;
  FDataModule.qryGetJBWO.parambyname('Works_Order').asinteger := dbKey;
  FDataModule.qryGetJBWO.open;

  if (FDataModule.qryGetJBWO.recordcount = 0) then
    begin
      if JobBagNo = 0 then
        begin
          iJobBag := FDataModule.GetNextJobBagNumber;
            while FDataModule.CheckJobBagExist(iJobBag) do
              iJobBag := FDataModule.GetNextJobBagNumber;
            {Add a Job Bag Header record}
          FDataModule.qryAddJBHead.close;
          FDataModule.qryAddJBHead.parambyname('Job_Bag').asinteger := iJobBag;
          FDataModule.qryAddJBHead.parambyname('Job_Bag_Descr').asstring := Description;
          FDataModule.qryAddJBHead.parambyname('Customer').asinteger := Customer;
          FDataModule.qryAddJBHead.parambyname('Branch_no').asinteger := Branch;
          FDataModule.qryAddJBHead.parambyname('Date_Point').asdatetime := WODate;
          FDataModule.qryAddJBHead.parambyname('Contact_no').asinteger := Contact;
          FDataModule.qryAddJBHead.parambyname('Goods_Required').asdatetime := DateRequired;
          FDataModule.qryAddJBHead.parambyname('Quantity').asfloat := QuantityEst;
          FDataModule.qryAddJBHead.parambyname('Cust_Order_no').asstring := CustomerPO;
          FDataModule.qryAddJBHead.parambyname('Rep').asinteger := Rep;
          FDataModule.qryAddJBHead.parambyname('Operator').asinteger := frmpbMainMenu.iOperator;
          FDataModule.qryAddJBHead.parambyname('Office_Contact').asinteger := OfficeContact;
          FDataModule.qryAddJBHead.parambyname('Job_Bag_Status').asinteger := 10;
          FDataModule.qryAddJBHead.parambyname('Account_Team').asinteger := AccountTeam;

          FDataModule.qryAddJBHead.parambyname('Job_Bag_Production_Status').asinteger := 10;
          FDataModule.qryAddJBHead.execsql;

          {Add the Job Bag Works Order record}
          FDataModule.qryAddJBWO.close;
          FDataModule.qryAddJBWO.parambyname('Job_Bag').asinteger := iJobBag;
          FDataModule.qryAddJBWO.parambyname('Works_Order_No').asinteger := 1;
          FDataModule.qryAddJBWO.parambyname('Works_Order').asinteger := dbkey;
          FDataModule.qryAddJBWO.execsql;

          JobBagNo := iJoBBag;
        end
      else
        begin
          iJobBag := JobBagNo;
          {Add the Job Bag Works Order record}
          FDataModule.qryAddJBWO.close;
          FDataModule.qryAddJBWO.parambyname('Job_Bag').asinteger := iJobBag;
          FDataModule.qryAddJBWO.parambyname('Works_Order_No').asinteger := FDataModule.GetNextJobBagWorksOrderNo(iJobBag);
          FDataModule.qryAddJBWO.parambyname('Works_Order').asinteger := dbkey;
          FDataModule.qryAddJBWO.execsql;
        end;
      iJobBagLine := 0;

    end;
end;

procedure TWOrder.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TWOrder.SetBranchName(const Value: string);
begin
  FBranchName := Value;
end;

procedure TWOrder.SetContact(const Value: integer);
begin
  FContact := Value;
end;

procedure TWOrder.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TWOrder.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TWOrder.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TWOrder.SetCustomerPO(const Value: string);
begin
  FCustomerPO := Value;
end;

procedure TWOrder.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TWOrder.SetdbKey(const Value: integer);
begin
  FdbKey := Value;
end;

procedure TWOrder.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TWOrder.SetEstimatedCost(const Value: currency);
begin
  FEstimatedCost := Value;
end;

procedure TWOrder.SetEstimatedInvoiceDate(const Value: TDateTime);
begin
  FEstimatedInvoiceDate := Value;
end;

procedure TWOrder.SetEstimatedStartDate(const Value: TDateTime);
begin
  FEstimatedStartDate := Value;
end;

procedure TWOrder.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TWOrder.SetOfficeContact(const Value: integer);
begin
  FOfficeContact := Value;
end;

procedure TWOrder.SetOfficeContactName(const Value: string);
begin
  FOfficeContactName := Value;
end;

procedure TWOrder.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TWOrder.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TWOrder.SetProductionType(const Value: integer);
begin
  FProductionType := Value;
end;

procedure TWOrder.SetProductionTypeDesc(const Value: string);
begin
  FProductionTypeDesc := Value;
end;

procedure TWOrder.SetQuantityAct(const Value: double);
begin
  FQuantityAct := Value;
end;

procedure TWOrder.SetQuantityEst(const Value: double);
begin
  FQuantityEst := Value;
end;

procedure TWOrder.SetRep(const Value: integer);
begin
  FRep := Value;
end;

procedure TWOrder.SetRepName(const Value: string);
begin
  FRepName := Value;
end;

procedure TWOrder.SetSIMethod(const Value: string);
begin
  FSIMethod := Value;
end;

procedure TWOrder.SetSIMethodDesc(const Value: string);
begin
  FSIMethodDesc := Value;
end;

procedure TWOrder.SetVersionNo(const Value: integer);
begin
  FVersionNo := Value;
end;

procedure TWOrder.SetWODate(const Value: TDateTime);
begin
  FWODate := Value;
end;

procedure TWOrder.SetWONumber(const Value: double);
begin
  FWONumber := Value;
end;

procedure TWOrder.SetWONumberPrevious(const Value: double);
begin
  FWONumberPrevious := Value;
end;

procedure TWOrder.SetWOStatus(const Value: integer);
begin
  FWOStatus := Value;
end;

procedure TWOrder.SetWOStatusDesc(const Value: string);
begin
  FWOStatusDesc := Value;
end;

procedure TWOrder.SetJobBagNo(const Value: integer);
begin
  FJobBagNo := Value;
end;

procedure TWOrder.SaveProcesses;
var
  i : integer;
begin
  { When saving, we have to delete all processes records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteProcesses;  { Get rid of any already in database }
  FWOProcesses.Renumber;
  for i := 0 to Pred(FWOProcesses.Count) do
    begin
      FWOProcesses[i].SaveToDB;
    end;
end;

procedure TWOrder.DeleteProcesses;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Works_Order_process_detail WHERE Works_Order =' + IntToStr(DbKey));
    ExecSQL;
  end;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Works_Order_process WHERE Works_Order =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TWOrder.LoadProcesses;
var
  aProcess : TWOProcess;
begin
  FWOProcesses.Clear;
  if (self.dbKey = 0) and (self.JobBagNo <> 0) then
    begin
      with FDataModule.qryWOJBProcesses do
      begin
        Close;
        ParamByName('Job_Bag').AsInteger := self.JobBagNo;
        Open;
        while not(EOF) do
        begin
          aProcess := TWOProcess.Create(Self);
          aProcess.WOProcessNo := aProcess.Parent.Processes.Count + 1;
          aProcess.Process := FieldByName('Process').AsInteger;
          aProcess.ProcessName := FieldByName('Process_Description').asstring;
          aProcess.ProcessGroup := fieldbyname('Process_Group').asinteger;
          aProcess.UseWorkCentres := (fieldbyname('Is_Work_Centre_Based').asstring = 'Y');
          FWOProcesses.Add(aProcess);
          Next;
        end;
        Close;
      end;
    end
  else
    begin
      with FDataModule.qryWOAllProcesses do
      begin
        Close;
        ParamByName('Works_order').AsInteger := DbKey;
        Open;
        while not(EOF) do
        begin
          aProcess := TWOProcess.Create(Self);
//          aProcess.WOProcessNo := FieldByName('Process_no').AsInteger;
          aProcess.WOProcessNo := aProcess.Parent.Processes.Count + 1;
          aProcess.TargetDate := Fieldbyname('Target_Receipt_Date').asdatetime;
          aProcess.Process := FieldByName('Process').AsInteger;
          aProcess.ProcessName := FieldByName('Process_Description').asstring;
          aProcess.ProcessGroup := fieldbyname('Process_Group').asinteger;
          aProcess.Quantity := FieldbyName('Quantity').asinteger;
          aProcess.NumberUp := Fieldbyname('Number_Up').asinteger;
          aProcess.NoOfHours := fieldbyname('No_of_hours').asfloat;
          aProcess.LaserFormat := Fieldbyname('Laser_Format').asstring;
          aProcess.PaperSize := Fieldbyname('Paper_Size').asinteger;
          aProcess.CustPaperSize := Fieldbyname('Custom_Paper_Size').asstring;
          aProcess.TeamCount := fieldbyname('Team_Count').asinteger;
          aProcess.UseWorkCentres := (fieldbyname('Is_Work_Centre_Based').asstring = 'Y');
          aProcess.WorkCentre := fieldbyname('Work_Centre').asinteger;
          aProcess.WorkCentreGroup := fieldbyname('Work_Centre_Group').asinteger;
          aProcess.Narrative.dbKey := FieldByName('Narrative').Asinteger;
          aProcess.Narrative.LoadFromDB;
          FWOProcesses.Add(aProcess);
          Next;
        end;
        Close;
      end;
    end;
end;

procedure TWOrder.LoadDeliveries;
var
  aDeliv : TWODeliv;
begin
  FWODelivs.Clear;
  with FDataModule.qryWOAllDeliveries do
  begin
    Close;
    ParamByName('Works_order').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aDeliv := TWODeliv.Create(Self);
      aDeliv.Address1 := FieldByName('Building_no_name').asstring;
      aDeliv.Address2 := FieldByName('Street').asstring;
      aDeliv.Address3 := FieldByName('Locale').asstring;
      aDeliv.Town := FieldByName('Town').asstring;
      aDeliv.Postcode := FieldByName('Postcode').asstring;
      aDeliv.AddressReq := (Fieldbyname('Delivery_Address_Req').asstring = 'Y');
      aDeliv.DelivNumber := FieldByName('Delivery_no').AsInteger;
      aDeliv.DelivName := FieldByName('Name').AsString;
      aDeliv.Deferred := (fieldbyname('Deferred_Service').asstring = 'Y');
      if (woMode = woRepeat) then
        begin
          aDeliv.DelivDate := date;
          aDeliv.HandOverDate := date-7;

          aDeliv.QuantityAct := 0;
          aDeliv.DelivDateAct := 0;
        end
      else
        begin
          aDeliv.DelivDate := FieldByName('Delivery_Date').AsDateTime;
          aDeliv.QuantityAct := FieldByName('Qty_Delivered').AsInteger;
          aDeliv.DelivDateAct := FieldByName('Date_Deliv_Actual').AsDateTime;
          aDeliv.HandOverDate := fieldbyname('Handover_Date').asdatetime;
        end;

      aDeliv.ReturnAddressRequired := (fieldbyname('Return_Address_Required').asstring = 'Y');
      aDeliv.Quantity := FieldByName('Qty_To_Deliver').asinteger;
      aDeliv.Courier := FieldByName('Courier').asinteger;
      aDeliv.CourierName := FieldbyName('Courier_Name').asstring;
      aDeliv.Service := FieldbyName('Service_no').asinteger;
      aDeliv.ServiceDescr := FieldByName('Service_Description').asstring;
      aDeliv.Sort := fieldbyname('Courier_Sort').asinteger;
      aDeliv.Speed := fieldbyname('Courier_Speed').asinteger;
      aDeliv.PackSize := FieldByName('Package_size').asinteger;
      aDeliv.PackSizeDescr := FDataModule.GetPackageSizeDescr(aDeliv.PackSize);
      aDeliv.Weight := Fieldbyname('Package_Weight_gms').asinteger;
      aDeliv.CustomerAccount := fieldbyname('Customer_Account').asstring = 'Y';
      aDeliv.CustomerAccountCode := fieldbyname('Customer_Account_code').asstring;
      aDeliv.CustomerAccountName := fieldbyname('Customer_Account_name').asstring;

      FWODelivs.Add(aDeliv);
      Next;
    end;
    Close;
  end;
end;

procedure TWOrder.SaveDeliveries;
var
  i : integer;
begin
  { When saving, we have to delete all delivery records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteDeliveries;  { Get rid of any already in database }
  FWODelivs.Renumber;
  for i := 0 to Pred(FWODelivs.Count) do
    begin
      FWODelivs[i].SaveToDB;
    end;
end;

procedure TWOrder.DeleteDeliveries;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Works_Order_Delivery WHERE Works_Order =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TWOrder.LoadEvents;
var
  aEvent : TWOEvent;
begin
  FWOEvents.Clear;
  with FDataModule.qryWOAllEvents do
  begin
    Close;
    ParamByName('Works_Order').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aEvent := TWOEvent.Create(Self);
      aEvent.EventNumber := FieldByName('Event_no').AsInteger;
      aEvent.DateEntered := FieldByName('Event_Date_Time').Asdatetime;
      aEvent.Operator := FieldByName('Operator').Asinteger;
      aEvent.OperatorName := FieldByName('Operator_Name').asstring;
      aEvent.Narrative.dbKey := FieldByName('Narrative').asinteger;
      aEvent.Narrative.LoadFromDB;

      FWOEvents.Add(aEvent);
      Next;
    end;
    Close;
  end;
end;

procedure TWOrder.SaveEvents;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteEvents;  { Get rid of any already in database }
  FWOEvents.Renumber;
  for i := 0 to Pred(FWOEvents.Count) do
    begin
      FWOEvents[i].SaveToDB;
    end;
end;

procedure TWOrder.DeleteEvents;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Works_Order_Event WHERE Works_Order =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TWOrder.LoadProcessQuestions;
var
  aQuestion: TWOQuestion;
  aProcess:  TWOProcess;
  i, icount: integer;
begin
  for i := 0 to pred(FWOProcesses.Count) do
    begin
      aProcess := FWOProcesses[i];

      aProcess.FWOQuestions.Clear;

      with FDataModule.qryGetQuestions do
      begin
        if woMode <> woAdd then
          begin
            SQL.Text := FDataModule.qryGetOldQuestions.SQL.Text;
            Close;
            ParamByName('Process').AsInteger := aProcess.FProcess;
            ParamByName('Works_Order').AsInteger := aProcess.parent.dbkey;
            Open;
          end
        else
          begin
            Close;
            ParamByName('Process').AsInteger := aProcess.FProcess;
            Open;
          end;

        icount := 1;
        while not(EOF) do
        begin
          aQuestion := TWOQuestion.Create(aProcess);
          aQuestion.Process         := FieldByName('Process').AsInteger;
          aQuestion.PromptType      := FieldByName('Prompt_Type').asstring;
          aQuestion.Mandatory       := (FieldByName('Is_Mandatory').asstring = 'Y');
          aQuestion.Question        := FieldByName('Question').Asinteger;
          aQuestion.QuestionText    := FieldByName('Question_Text').Asstring;
          aQuestion.QuestionNo      := aProcess.FWOQuestions.Count + 1;

      {Get the answer to the question}
          FDataModule.qryGetWOQuestions.close;
          FDataModule.qryGetWOQuestions.parambyname('Works_Order').asinteger := dbkey;
//          FDataModule.qryGetWOQuestions.parambyname('Process_no').asinteger := aProcess.WOProcessNo;
          FDataModule.qryGetWOQuestions.parambyname('Process').asinteger := aProcess.Process;
          FDataModule.qryGetWOQuestions.parambyname('Question').asinteger := aQuestion.Question;
          FDataModule.qryGetWOQuestions.open;
          aQuestion.Answer          := FDataModule.qryGetWOQuestions.FieldByName('Process_Answer').Asstring;
          aProcess.FWOQuestions.Add(aQuestion);
          Next;
        end;
        Close;
      end;
    end;
end;

procedure TWOrder.SetVatCode(const Value: integer);
begin
  FVatCode := Value;
end;

procedure TWOrder.SetVatRate(const Value: double);
begin
  FVatRate := Value;
end;

procedure TWOrder.SetAccountTeam(const Value: integer);
begin
  FAccountTeam := Value;
end;

procedure TWOrder.SetAccountTeamName(const Value: string);
begin
  FAccountTeamName := Value;
end;

procedure TWOrder.SetJobBagLine(const Value: integer);
begin
  FJobBagLine := Value;
end;

procedure TWOrder.SetEstimatedSellPrice(const Value: currency);
begin
  FEstimatedSellPrice := Value;
end;

procedure TWOrder.SetSellUnit(const Value: integer);
begin
  FSellUnit := Value;
end;

procedure TWOrder.SetIsPerso100(const Value: string);
begin
  FIsPerso100 := Value;
end;

procedure TWOrder.SetAccountManagerName(const Value: string);
begin
  FAccountManagerName := Value;
end;

procedure TWOrder.SaveWONumber;
begin
  WONumber := JobBagNo + (1/100);
  with FDataModule.qryUpdWONumber do
    begin
      close;
      parambyname('Works_Order').asinteger := dbkey;
      parambyname('Works_Order_Number').asfloat := WONumber;
      execsql;
    end;
end;

procedure TWOrder.SetWOCount(const Value: integer);
begin
  FWOCount := Value;
end;

procedure TWOrder.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TWOrder.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TWOrder.SetWOMode(const Value: TWOMode);
begin
  FWOMode := Value;
end;

procedure TWOrder.SaveStatus;
var
  icount, iDelivered, iStatus: integer;
begin
  iDelivered := 0;

  for icount := 0 to pred(deliveries.count) do
    if deliveries[icount].DelivDateAct <> 0 then
      iDelivered := iDelivered + 1;

  if deliveries.count = iDelivered then
    iStatus := 3000
  else
  if iDelivered = 0 then
    iStatus := 20
  else
    iStatus := 2500;

  with FDatamodule.qryUpWOStatus do
    begin
      close;
      parambyname('Works_Order').asinteger := dbKey;
      parambyname('Works_Order_Status').asinteger := iStatus;
      execsql;
    end;
end;

function TWOrder.GetStatusDescription(tmpStatus: integer): string;
begin
  with FDataModule.qryGetWOStatus do
    begin
      close;
      parambyname('Works_Order_Status').asinteger := tmpStatus;
      open;
      result := fieldbyname('Works_Order_Status_Descr').asstring;
    end;
end;

procedure TWOrder.SetReturnBranch(const Value: integer);
begin
  FReturnBranch := Value;
end;

procedure TWOrder.SetReturnCompany(const Value: integer);
begin
  FReturnCompany := Value;
end;

procedure TWOrder.SetReturnCustomer(const Value: integer);
begin
  FReturnCustomer := Value;
end;

procedure TWOrder.SetReturnCustomerAdHoc(const Value: integer);
begin
  FReturnCustomerAdHoc := Value;
end;

procedure TWOrder.SetReturnCompanyBranch(const Value: integer);
begin
  FReturnCompanyBranch := Value;
end;

{ TdtmdlWOrders }

function TdtmdlWOrders.GetHeaderCount: integer;
begin
  result := qryWOHeaderGrid.RecordCount;
end;

function TdtmdlWOrders.GetCurrentWOrder: integer;
begin
  if qryWOHeaderGrid.RecordCount > 0 then
    Result := qryWOHeaderGrid.FieldByName('Works_Order').AsInteger
  else
    Result := 0;
end;

function TdtmdlWOrders.GetCurrentWOrderNumber: double;
begin
  if qryWOHeaderGrid.RecordCount > 0 then
    Result := qryWOHeaderGrid.FieldByName('Works_Order_Number').Asfloat
  else
    Result := 0;
end;

procedure TdtmdlWOrders.RefreshData;
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
  qryWOHeaderGrid.close;
  qryWOHeaderGrid.SQL.Clear;

  {Add the Purchase Order query details}
  sTemp := '';
  qryWOHeaderGrid.SQL.text := qryWOHeaderGrid.SQL.text + qryAllWOrders.SQL.text;
  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if CustomerRef <> '' then
    sTemp := sTemp + ' AND (Works_Order.Cust_Order_no LIKE ''' + CustomerRef + '%'')';
  if OrdQtyDesc <> '' then
    sTemp := sTemp + ' AND (Works_Order.Estimated_Quantity = ' + OrdQtyDesc + ')';
  if JobBag <> '' then
    sTemp := sTemp + ' AND ((select top 1 Job_Bag from Job_Bag_Works_Order JBWO '
                    + 'WHERE JBWO.Works_order = Works_Order.Works_Order) = ' + JobBag + ')';
  if Rep <> 0 then
    begin
      sTemp := sTemp + ' AND (Works_Order.Rep = ' + inttostr(Rep) + ')';
    end;

  if Operator <> 0 then
    sTemp := sTemp + ' AND (Works_Order.Operator = ' + inttostr(Operator) + ')';
  if Status <> '' then
    sTemp := sTemp + ' AND (Works_Order_Status.Works_Order_Status_Descr LIKE ''%' + Status + '%'')';

  if ShowWIP then
    sTemp := sTemp + ' AND (Works_Order.Works_Order_Status < 3000)';

  if ShowInactive then
    sTemp := sTemp + ' AND ((Works_Order.inactive is NULL) OR (Works_Order.inactive = ''N'') '
                    + ' OR (Works_Order.inactive = ''Y''))'
  else
    sTemp := sTemp + ' AND ((Works_Order.inactive is NULL) OR (Works_Order.inactive = ''N''))';


  sTemp := sTemp + ' AND Works_Order.Date_Point >= ' + qDate(OrderDate);
  qryWOHeaderGrid.SQL.text := qryWOHeaderGrid.SQL.text + sTemp;

  sTemp := 'ORDER BY Works_Order.Works_Order_number desc';

  qryWOHeaderGrid.SQL.text := qryWOHeaderGrid.SQL.text + sTemp;

  with qryWOHeaderGrid do
  begin
    Close;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

procedure TdtmdlWOrders.RefreshJBData;
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
  qryWOHeaderGrid.close;
  qryWOHeaderGrid.SQL.Clear;

  {Add the Purchase Order query details}
  sTemp := '';
  qryWOHeaderGrid.SQL.text := qryWOHeaderGrid.SQL.text + qryAllWOrders.SQL.text;
  if CustomerName <> '' then
    sTemp := sTemp + ' AND (Customer.Name LIKE ''%' + CustomerName + '%'')';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if CustomerRef <> '' then
    sTemp := sTemp + ' AND (Works_Order.Cust_Order_no LIKE ''' + CustomerRef + '%'')';
  if OrdQtyDesc <> '' then
    sTemp := sTemp + ' AND (Works_Order.Estimated_Quantity = ' + OrdQtyDesc + ')';
  if JobBag <> '' then
    sTemp := sTemp + ' AND ((select Job_Bag from Job_Bag_Works_Order JBWO '
                    + 'WHERE JBWO.Works_order = Works_Order.Works_Order) <> ' + JobBag + ')';
  if Rep <> 0 then
    sTemp := sTemp + ' AND (Works_Order.Rep = ' + inttostr(Rep) + ')';
  if Operator <> 0 then
    sTemp := sTemp + ' AND (Works_Order.Operator = ' + inttostr(Operator) + ')';
  if NotInJobBag then
    begin
      sTemp := sTemp + ' AND (Works_Order.Works_Order Not In (Select Works_Order From Job_Bag_Works_Order '
                     + ' WHERE Job_Bag_Works_Order.Works_Order = Works_Order.Works_Order)) ';
    end;
  if ShowInactive then
    sTemp := sTemp + ' AND ((Works_Order.inactive is NULL) OR (Works_Order.inactive = ''N'') '
                    + ' OR (Works_Order.inactive = ''Y''))'
  else
    sTemp := sTemp + ' AND ((Works_Order.inactive is NULL) OR (Works_Order.inactive = ''N''))';


  sTemp := sTemp + ' AND Works_Order.Date_Point >= ' + qDate(OrderDate);
  qryWOHeaderGrid.SQL.text := qryWOHeaderGrid.SQL.text + sTemp;

  sTemp := ' ORDER BY Works_Order.Works_Order_number desc';

  qryWOHeaderGrid.SQL.text := qryWOHeaderGrid.SQL.text + sTemp;

  with qryWOHeaderGrid do
  begin
    Close;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

function TdtmdlWOrders.GetJobBagNo(tempCode: integer): integer;
begin
  with qryGetJBWO do
    begin
      close;
      parambyname('Works_order').asinteger := tempcode;
      open;
      result := fieldbyname('Job_Bag').asinteger;
    end;
end;

function TdtmdlWOrders.GetJobBagLine(tempCode: integer): integer;
begin
  with qryGetJB do
    begin
      close;
      parambyname('Works_order').asinteger := tempcode;
      open;
      result := fieldbyname('Job_Bag_line').asinteger;
    end;
end;

procedure TdtmdlWOrders.FreeCompanyRecord;
begin
  with qrySpare do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

procedure TdtmdlWOrders.LockCompanyRecord;
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
    with qrySpare do
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

function TdtmdlWOrders.GetNextJobBagNumber: integer;
begin
  LockCompanyRecord;
  try
    try
      with GetLastJBSQL do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Job_Bag_Number').AsInteger + 1;
        Close;
      end;
      with UpdLastJBSQL do
      begin
        ParamByName('Last_Job_Bag_Number').Asinteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Job Bag number:' + #13 + E.Message);
    end;
    end;
  finally
    FreeCompanyRecord;
  end;
end;

function TdtmdlWOrders.GetNextJobBagLineNumber(tempNo: integer): integer;
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

function TdtmdlWOrders.CheckJobBagExist(TempCode: integer): boolean;
begin
  with qryCheckJobBag do
    begin
      close;
      parambyname('Job_Bag').asinteger := TempCode;
      open;
      Result := (recordcount > 0);
    end;
end;

function TdtmdlWOrders.GetCompanyVatCode: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Vat_Code').asinteger;
    end;
end;

function TdtmdlWOrders.GetAccountTeamName(tempCode: integer): string;
begin
  with qryGetAccountTeam do
    begin
      close;
      parambyname('Account_Team').asinteger := tempcode;
      open;
      result := fieldbyname('Account_team_name').asstring;
    end;
end;

function TdtmdlWOrders.GetOpAccountTeam(tempCode: integer): integer;
begin
  with qryGetOpAccountTeam do
    begin
      close;
      parambyname('Operator').asinteger := tempcode;
      open;
      result := fieldbyname('Account_team').asinteger;
    end;
end;

function TdtmdlWOrders.GetOpAccountTeamName(tempCode: integer): string;
begin
  with qryGetOpAccountTeam do
    begin
      close;
      parambyname('Operator').asinteger := tempcode;
      open;
      result := fieldbyname('Account_team_name').asstring;
    end;
end;

function TdtmdlWOrders.CalculatePrice(const PriceUnit: integer; Quantity,
  Price: double): double;
var
  Factor : integer;
begin
  with qryGetPriceUnit do
  begin
    Close;
    ParamByName('Price_Unit').AsInteger := PriceUnit;
    Open;
    Factor := FieldByName('Price_Unit_Factor').AsInteger;
    Close;
    if Factor = 0 then { price per job }
      Result := Price
    else               { price per N }
      Result := (Quantity/Factor) * Price;
  end;
end;

function TdtmdlWOrders.GetNextJobBagWorksOrderNo(tempNo: integer): integer;
begin
  with qryGetLastWOJB do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempNo;
      open;
      result := fieldbyname('Last_Works_Order').asinteger + 1;
    end;
end;

function TdtmdlWOrders.GetPackageSizeDescr(tempCode: integer): string;
begin
  with qryGetPackage do
    begin
      close;
      parambyname('Package_Size').asinteger := tempCode;
      open;
      result := fieldbyname('Package_Size_Description').asstring;
    end;
end;

function TdtmdlWOrders.GetNarrative(const iNarrative: integer): string;
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

procedure TdtmdlWOrders.SaveNarrative(var iNarrative: Integer;
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

function TdtmdlWOrders.GetCustomerRep(tempCust,
  tempBranch: integer): integer;
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

function TdtmdlWOrders.GetRepName(tempCode: integer): string;
begin
  with qryGetRep do
    begin
      close;
      parambyname('Rep').asinteger := tempcode;
      open;
      result := fieldbyname('Name').asstring;
    end;
end;

function TdtmdlWOrders.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (BranchName <> '') or
            (CustomerRef <> '') or
            (OrdQtyDesc <> '') or
            (JobBag <> '') or
            (CustomerRef <> '') or
            (OrdQtyDesc <> '') or
            (Status <> '') or
            (ShowInactive)  or
            (ShowWIP) then
    result := true
  else
    result := false;
end;

procedure TdtmdlWOrders.SetWOStatus(tmpWO, tmpStatus: integer);
begin
  with qryUpWOStatus do
    begin
      close;
      parambyname('Works_Order').asinteger := tmpWO;
      parambyname('Works_Order_Status').asinteger := tmpStatus;
      execsql;
    end;
end;

procedure TdtmdlWOrders.SetJBStatus(tmpJB: integer);
var
  tmpStatus, minStatus, maxStatus, icount: Integer;
begin
  minStatus := 9999;
  maxStatus := 0;

  with qryGetJobBagWO do
    begin
      close;
      parambyname('Job_Bag').asinteger := tmpJB;
      open;

      while eof <> true do
        begin
          if minStatus > fieldbyname('Works_Order_Status').asinteger then
            minStatus := fieldbyname('Works_Order_Status').asinteger;
          if maxStatus < fieldbyname('Works_Order_Status').asinteger then
            maxStatus := fieldbyname('Works_Order_Status').asinteger;
          next;
        end;
    end;

  if qryGetJobBagWO.recordcount = 0 then
    tmpStatus := 0
  else
    begin
      if minStatus = maxStatus then
        tmpStatus := minStatus
      else
        tmpStatus := minStatus + 5;
    end;

  with qryUpdJBHead do
    begin
      close;
      parambyname('Job_Bag').asinteger := tmpJB;
      parambyname('Job_Bag_Production_Status').asinteger := tmpStatus;
      execsql;
    end;
end;

function TdtmdlWOrders.GetProcessNumberType(tempCode: integer): string;
begin
  with qryGetProcess do
    begin
      close;
      parambyname('Process').asinteger := tempCode;
      open;
      result := fieldbyname('Number_Type_Description').asstring;
    end;
end;

function TdtmdlWOrders.ShowProcessSimplexDuplex(tempCode: integer): string;
begin
  with qryGetProcess do
    begin
      close;
      parambyname('Process').asinteger := tempCode;
      open;
      result := fieldbyname('Prompt_For_Laser_Format').asstring;
    end;
end;

function TdtmdlWOrders.ShowProcessPaperSize(tempCode: integer): string;
begin
  with qryGetProcess do
    begin
      close;
      parambyname('Process').asinteger := tempCode;
      open;
      result := fieldbyname('Prompt_For_Paper_Size').asstring;
    end;
end;

function TdtmdlWOrders.GetPaperPromptNarrative(tempCode: integer): string;
begin
  with qryGetProcess do
    begin
      close;
      parambyname('Process').asinteger := tempCode;
      open;
      result := fieldbyname('Paper_Prompt_Narrative').asstring;
    end;
end;

function TdtmdlWOrders.GetReturnAddress(iTempCode, iTempBranch,
  iTempType: Integer): string;
begin
  {Build a suitable description for the delivery}
  if iTempType = 1 then {Company address}
    begin
      if iTempBranch <> 0 then
        begin
          dtsAddress.DataSet := qryGetCompBrAddr;
          with qryGetCompBrAddr do
          begin
            Close;
            ParamByName('Branch_No').AsInteger := iTempBranch;
            Open;
            Result := 'Here:  ' + Trim(FieldByName('Name').AsString) + ', ' +
                  Trim(FieldByName('Branch_Name').AsString);
          end;
        end
      else
        begin
          dtsAddress.DataSet := qryGetCompAddr;
          with qryGetCompAddr do
            begin
              Close;
              Open;
              Result := 'Here:  ' + FieldByName('Name').AsString;
            end;
        end
    end
  else
  if iTempType = 2 then {Customer address}
    begin
      dtsAddress.DataSet := qryGetCustAddr;
      with qryGetCustAddr do
      begin
        Close;
        ParamByName('Customer').AsInteger := iTempcode;
        ParamByName('Branch_No').AsInteger := iTempBranch;
        Open;
        Result := 'Cust/Br:  ' + Trim(FieldByName('Name').AsString) + ', ' +
            Trim(FieldByName('Branch_Name').AsString);
      end;
    end
  else
  if iTempType = 3 then {Ad-hoc address}
    begin
      dtsAddress.DataSet := qryGetAddHocAddr;
      with qryGetAddHocAddr do
      begin
        Close;
        ParamByName('Ad_Hoc_Address').AsInteger := iTempCode;
        Open;
        Result := 'Ad Hoc:  ' + FieldByName('Name').AsString;
      end;
    end;
end;

{ TWOProcesses }

procedure TWOProcesses.Add(aProcess: TWOProcess);
begin
  FItems.Add(aProcess);
end;

procedure TWOProcesses.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWOProcess(FItems[i]).Free;
end;

function TWOProcesses.Clone: TWOProcesses;
var
  i : integer;
begin
  Result := TWOProcesses.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TWOProcess(FItems[i]).Clone);
end;

constructor TWOProcesses.Create(WOrder: TWOrder);
begin
  FParent := WOrder;
  FItems := TList.Create;
end;

procedure TWOProcesses.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TWOProcesses.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWOProcess(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TWOProcesses.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TWOProcesses.GetItems(Index: integer): TWOProcess;
begin
  Result := TWOProcess(FItems[Index]);
end;

function TWOProcesses.IndexOf(const ProcessNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TWOProcess(FItems[i]).WOProcessNo = ProcessNo then
      Result := i;
end;

procedure TWOProcesses.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWOProcess(FItems[i]).WOProcessNo:= (i+1);
end;

procedure TWOProcesses.SetItems(Index: integer; const Value: TWOProcess);
begin
  FItems[Index] := Value;
end;

{ TWOProcess }

procedure TWOProcess.Clear;
begin
  FWOQuestions.Clear;
end;

function TWOProcess.Clone: TWOProcess;
begin
  Result := TWOProcess.Create(FParent);
  Result.Process           :=           self.Process;
  Result.ProcessName       :=           Self.ProcessName;
  Result.Quantity          :=           Self.Quantity;
  Result.WOProcessNo       :=           Self.WOProcessNo;
  Result.Narrative         :=           Self.Narrative;
  Result.NoOfHours         :=           self.NoOfHours;
  Result.NumberUp          :=           Self.NumberUp;
  Result.TargetDate        :=           self.TargetDate;
  Result.LaserFormat       :=           self.LaserFormat;
  Result.PaperSize         :=           self.PaperSize;
  Result.ProcessGroup      :=           self.ProcessGroup;
  Result.CustPaperSize     :=           self.CustPaperSize;
  Result.TeamCount         :=           Self.TeamCount;
  Result.UseWorkCentres    :=           self.UseWorkCentres;
  Result.WorkCentre        :=           Self.WorkCentre;
  Result.WorkCentreGroup   :=           Self.WorkCentreGroup;
  Result.FWOQuestions.Free;
  Result.FWOQuestions :=  Self.FWOQuestions.Clone;
end;

constructor TWOProcess.Create(WOrder: TWOrder);
begin
  FParent := WOrder;
  FNarrative := TNarrative.Create;
  FWOQuestions  := TWOQuestions.Create(Self);
end;

destructor TWOProcess.Destroy;
begin
  FWOQuestions.Free;
  FNarrative.Free;
  inherited;
end;

procedure TWOProcess.LoadFromDB;
begin
  with FParent.FDataModule.qryWOProcess do
  begin
    Close;
    ParamByName('Works_Order').Asfloat := FParent.DbKey;
    ParamByName('Process_no').AsInteger := WOProcessNo;
    Open;
    TargetDate := FieldbyName('Target_Receipt_Date').AsDateTime;
    Quantity := Fieldbyname('Quantity').asinteger;
    NumberUp := Fieldbyname('Number_up').asinteger;
    NoofHours := Fieldbyname('No_of_hours').asfloat;
    Process := FieldbyName('Process').asinteger;
    ProcessName := FieldbyName('Process_Description').asstring;
    LaserFormat := Fieldbyname('Laser_Format').asstring;
    PaperSize := Fieldbyname('Paper_Size').asinteger;
    ProcessGroup := fieldbyname('Process_Group').asinteger;
    CustPaperSize := Fieldbyname('Custom_Paper_Size').asstring;
    Narrative.dbkey := FieldbyName('Narrative').AsInteger;
    TeamCount := fieldbyname('Team_Count').asinteger;
    UseWorkCentres := (fieldbyname('Is_Work_Centre_Based').asstring = 'Y');
    WorkCentre := fieldbyname('Work_Centre').asinteger;
    WorkCentreGroup := fieldbyname('Work_Centre_Group').asinteger;
    Close;
  end;
  LoadQuestions
end;

procedure TWOProcess.LoadQuestions;
var
  aQuestion : TWOQuestion;
  icount: integer;
begin
  FWOQuestions.Clear;
  with parent.FDataModule.qryGetQuestions do
  begin
    Close;
    ParamByName('Process').AsInteger := self.Process;
    Open;
    icount := 1;
    while not(EOF) do
    begin
      aQuestion := TWOQuestion.Create(Self);
      aQuestion.Process         := FieldByName('Process').AsInteger;
      aQuestion.PromptType      := FieldByName('Prompt_Type').asstring;
      aQuestion.Question        := FieldByName('Question').Asinteger;
      aQuestion.QuestionText    := FieldByName('Question_Text').Asstring;
      aQuestion.QuestionNo      := FWOQuestions.Count + 1;

      {Get the answer to the question}
      parent.FDataModule.qryGetWOQuestions.close;
      parent.FDataModule.qryGetWOQuestions.parambyname('Works_Order').asinteger := parent.dbkey;
      parent.FDataModule.qryGetWOQuestions.parambyname('Process_no').asinteger := self.WOProcessNo;
      parent.FDataModule.qryGetWOQuestions.parambyname('Process').asinteger := self.Process;
      parent.FDataModule.qryGetWOQuestions.parambyname('Question').asinteger := aQuestion.Question;
      parent.FDataModule.qryGetWOQuestions.open;
      aQuestion.Answer          := parent.FDataModule.qryGetWOQuestions.FieldByName('Process_Answer').Asstring;
      FWOQuestions.Add(aQuestion);
      Next;
    end;
    Close;
  end;
end;

procedure TWOProcess.SaveQuestions;
var
  i: integer;
begin
  FWOQuestions.Renumber;
  for i := 0 to Pred(FWOQuestions.Count) do
    begin
      if FWOQuestions[i].answer <> '' then
        FWOQuestions[i].SaveToDB;
    end;
end;

procedure TWOProcess.SaveToDB;
begin
  Narrative.SavetoDB;
  with FParent.FDataModule.qryWOAddProcess do
  begin
    ParamByName('Works_Order').Asinteger := FParent.DbKey;
    ParamByName('Process_no').AsInteger := WOProcessNo;
    ParamByName('Process').asinteger := Process;
    ParamByName('Quantity').AsInteger := Quantity;
    Parambyname('Number_Up').asinteger := NumberUp;
    Parambyname('Narrative').AsInteger := Narrative.dbkey;
    ParamByName('Laser_Format').Asstring := LaserFormat;
    ParamByName('Paper_Size').AsInteger := PaperSize;
    ParamByName('Custom_Paper_Size').Asstring := CustPaperSize;
    Parambyname('Target_Receipt_Date').asdatetime := TargetDate;
    Parambyname('No_of_hours').asfloat := NoofHours;
    Parambyname('Team_Count').asinteger := TeamCount;
    if WorkCentre = 0 then
      Parambyname('Work_Centre').clear
    else
      Parambyname('Work_Centre').asinteger := WorkCentre;

    if WorkCentreGroup = 0 then
      Parambyname('Work_Centre').clear
    else
      Parambyname('Work_Centre_Group').asinteger := WorkCentreGroup;
    ExecSQL;
  end;
  SaveQuestions;
end;

procedure TWOProcess.SetCustPaperSize(const Value: string);
begin
  FCustPaperSize := Value;
end;

procedure TWOProcess.SetLaserFormat(const Value: string);
begin
  FLaserFormat := Value;
end;

procedure TWOProcess.SetNarrative(const Value: TNarrative);
begin
  FNarrative := Value;
end;

procedure TWOProcess.SetNoOfHours(const Value: double);
begin
  FNoOfHours := Value;
end;

procedure TWOProcess.SetNumberUp(const Value: integer);
begin
  FNumberUp := Value;
end;

procedure TWOProcess.SetPaperSize(const Value: integer);
begin
  FPaperSize := Value;
end;

procedure TWOProcess.Setparent(const Value: TWOrder);
begin
  Fparent := Value;
end;

procedure TWOProcess.SetProcess(const Value: integer);
begin
  FProcess := Value;
end;

procedure TWOProcess.SetProcessGroup(const Value: integer);
begin
  FProcessGroup := Value;
end;

procedure TWOProcess.SetProcessName(const Value: string);
begin
  FProcessName := Value;
end;

procedure TWOProcess.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TWOProcess.SetTargetDate(const Value: TDateTime);
begin
  FTargetDate := Value;
end;

procedure TWOProcess.SetTeamCount(const Value: integer);
begin
  FTeamCount := Value;
end;

procedure TWOProcess.SetUseWorkCentres(const Value: boolean);
begin
  FUseWorkCentres := Value;
end;

procedure TWOProcess.SetWOProcessNo(const Value: integer);
begin
  FWOProcessNo := Value;
end;

procedure TWOProcess.SetWorkCentre(const Value: integer);
begin
  FWorkCentre := Value;
end;

procedure TWOProcess.SetWorkCentreGroup(const Value: integer);
begin
  FWorkCentreGroup := Value;
end;

{ TWOEvents }

procedure TWOEvents.Add(aEvent: TWOEvent);
begin
  FItems.Add(aEvent);
end;

procedure TWOEvents.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWOEvent(FItems[i]).Free;
end;

function TWOEvents.Clone: TWOEvents;
var
  i : integer;
begin
  Result := TWOEvents.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TWOEvent(FItems[i]).Clone);
end;

constructor TWOEvents.Create(WOrder: TWOrder);
begin
  FParent := WOrder;
  FItems := TList.Create;
end;

procedure TWOEvents.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TWOEvents.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWOEvent(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TWOEvents.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TWOEvents.GetItems(Index: integer): TWOEvent;
begin
  Result := TWOEvent(FItems[Index]);
end;

function TWOEvents.IndexOf(const EventNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TWOEvent(FItems[i]).EventNumber = EventNo then
      Result := i;
end;

procedure TWOEvents.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWOEvent(FItems[i]).EventNumber:= (i+1);
end;

procedure TWOEvents.SetItems(Index: integer; const Value: TWOEvent);
begin
  FItems[Index] := Value;
end;

{ TWOEvent }

function TWOEvent.Clone: TWOEvent;
begin
  Result := TWOEvent.Create(FParent);
  Result.EventNumber    :=           self.EventNumber;
  Result.DateEntered    :=           self.DateEntered;
  Result.operator       :=           Self.Operator;
  Result.OperatorName   :=           self.OperatorName; 
  Result.Narrative      :=           Self.Narrative;
end;

constructor TWOEvent.Create(WOrder: TWOrder);
begin
  FParent := WOrder;
  FNarrative := TNarrative.Create;
end;

destructor TWOEvent.Destroy;
begin
  FNarrative.Free;
  inherited;
end;

procedure TWOEvent.LoadFromDB;
begin
  with FParent.FDataModule.qryWOEvent do
  begin
    Close;
    ParamByName('Works_Order').AsInteger := FParent.DbKey;
    ParamByName('Event_no').AsInteger := EventNumber;
    Open;
    DateEntered := FieldbyName('Event_Date_Time').asdatetime;
    Narrative.dbkey := FieldbyName('Narrative').AsInteger;
    Operator := FieldbyName('Operator').asinteger;
    OperatorName := FieldbyName('Operator_Name').asstring;
    Close;
  end;
end;

procedure TWOEvent.SaveToDB;
begin
  Narrative.SavetoDB;
  with FParent.FDataModule.qryWOAddEvent do
  begin
    ParamByName('Works_Order').AsInteger := FParent.DbKey;
    ParamByName('Event_no').AsInteger := EventNumber;
    ParamByName('Operator').asinteger := Operator;
    Parambyname('Event_Date_Time').Asdatetime := DateEntered;
    Parambyname('Narrative').asinteger := Narrative.dbKey;
    ExecSQL;
  end;
end;

procedure TWOEvent.SetDateEntered(const Value: TDateTime);
begin
  FDateEntered := Value;
end;

procedure TWOEvent.SetEventNumber(const Value: integer);
begin
  FEventNumber := Value;
end;

procedure TWOEvent.SetNarrative(const Value: TNarrative);
begin
  FNarrative := Value;
end;

procedure TWOEvent.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TWOEvent.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TWOEvent.SetParent(const Value: TWOrder);
begin
  FParent := Value;
end;

{ TWODelivs }

procedure TWODelivs.Add(aDeliv: TWODeliv);
begin
  FItems.Add(aDeliv);
end;

procedure TWODelivs.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWODeliv(FItems[i]).Free;
end;

function TWODelivs.Clone: TWODelivs;
var
  i : integer;
begin
  Result := TWODelivs.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TWODeliv(FItems[i]).Clone);
end;

constructor TWODelivs.Create(WOrder: TWOrder);
begin
  FParent := WOrder;
  FItems := TList.Create;
end;

procedure TWODelivs.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TWODelivs.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWODeliv(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TWODelivs.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TWODelivs.GetItems(Index: integer): TWODeliv;
begin
  Result := TWODeliv(FItems[Index]);
end;

function TWODelivs.GetTotalAssigned: Double;
var
  i                           : Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    begin
      Result := Result + Items[i].Quantity;
    end;
end;

function TWODelivs.IndexOf(const DelivNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TWODeliv(FItems[i]).DelivNumber = DelivNo then
      Result := i;
end;

procedure TWODelivs.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWODeliv(FItems[i]).DelivNumber:= (i+1);
end;

procedure TWODelivs.SetItems(Index: integer; const Value: TWODeliv);
begin
  FItems[Index] := Value;
end;

{ TWODeliv }

function TWODeliv.Clone: TWODeliv;
begin
  Result := TWODeliv.Create(FParent);
  Result.AddressReq           :=           self.AddressReq;
  Result.Courier              :=           Self.Courier;
  Result.CourierName          :=           Self.CourierName;
  Result.CustomerAccount      :=           Self.CustomerAccount;
  Result.CustomerAccountCode  :=           Self.CustomerAccountCode;
  Result.CustomerAccountName  :=           Self.CustomerAccountName;
  Result.Deferred             :=           Self.Deferred;
  Result.DelivDate            :=           Self.DelivDate;
  Result.DelivDateAct         :=           Self.DelivDateAct;
  Result.DelivName            :=           Self.DelivName;
  Result.DelivNumber          :=           Self.DelivNumber;
  Result.HandOverDate         :=           Self.HandOverDate;
  Result.PackSize             :=           Self.PackSize;
  Result.PackSizeDescr        :=           Self.PackSizeDescr;
  Result.Quantity             :=           Self.Quantity;
  Result.QuantityAct          :=           Self.QuantityAct;
  Result.ReturnAddressRequired :=          self.ReturnAddressRequired;
  Result.Service              :=           Self.Service;
  Result.ServiceDescr         :=           Self.ServiceDescr;
  Result.Sort                 :=           self.sort;
  Result.Speed                :=           self.speed;
  Result.Weight               :=           Self.Weight;
end;

constructor TWODeliv.Create(WOrder: TWOrder);
begin
  FParent := WOrder;
end;

destructor TWODeliv.Destroy;
begin

  inherited;
end;

procedure TWODeliv.LoadFromDB;
begin
  with FParent.FDataModule.qryWODelivery do
  begin
    Close;
    ParamByName('Works_Order').AsInteger := FParent.DbKey;
    ParamByName('Delivery_no').AsInteger := DelivNumber;
    Open;
    Address1 := FieldByName('Building_no_name').asstring;
    Address2 := FieldByName('Street').asstring;
    Address3 := FieldByName('Locale').asstring;
    Town := FieldByName('Town').asstring;
    Postcode := FieldByName('Postcode').asstring;
    AddressReq := (Fieldbyname('Delivery_Address_Req').asstring = 'Y');
    DelivDate := FieldByName('Delivery_Date').AsDateTime;
    DelivName := FieldByName('Name').AsString;
    Quantity := FieldByName('Qty_To_Deliver').asinteger;
    QuantityAct := FieldByName('Qty_Delivered').AsInteger;
    DelivDateAct := FieldByName('Date_Deliv_Actual').AsDateTime;
    HandOverDate := fieldbyname('Handover_Date').asdatetime;
    Courier := FieldByName('Courier').asinteger;
    CourierName := FieldbyName('Courier_Name').asstring;
    Service := FieldbyName('Service_no').asinteger;
    ServiceDescr := FieldByName('Service_Description').asstring;
(*    PackSize := FieldByName('Pack_Quantity').asinteger;
    Weight := Fieldbyname('Delivery_Weight_Kilos').asinteger;
*)
    ReturnAddressRequired := (fieldbyname('Return_Address_Required').asstring = 'Y');
    Sort := fieldbyname('Courier_Sort').asinteger;
    Speed := fieldbyname('Courier_Speed').asinteger;
    PackSize := FieldByName('Package_size').asinteger;
    PackSizeDescr := parent.DataModule.GetPackageSizeDescr(PackSize);
    Weight := Fieldbyname('Package_Weight_gms').asinteger;
    CustomerAccount := fieldbyname('Customer_Account').asstring = 'Y';
    CustomerAccountCode := fieldbyname('Customer_Account_code').asstring;
    CustomerAccountName := fieldbyname('Customer_Account_name').asstring;
    close;
  end;
end;

procedure TWODeliv.SaveDelivery;
begin
  with FParent.FDataModule.qryUpWODeliv do
    begin
      close;
      parambyname('Works_Order').asinteger := Parent.dbKey;
      parambyname('Delivery_no').asinteger := DelivNumber;
      parambyname('Qty_Delivered').asinteger := QuantityAct;
      parambyname('Date_Deliv_Actual').asdatetime := DelivDateAct;
      execsql;
    end;
end;

procedure TWODeliv.SaveToDB;
begin
  with FParent.FDataModule.qryWOAddDelivery do
  begin
    ParamByName('Works_Order').AsInteger := FParent.DbKey;
    ParamByName('Delivery_no').AsInteger := DelivNumber;
    ParamByName('Delivery_Date').AsDateTime := DelivDate;
    if HandOverdate = 0 then
      ParamByName('Handover_Date').clear
    else
      ParamByName('Handover_Date').AsDateTime := HandOverDate;
    ParamByName('Qty_To_Deliver').asinteger := Quantity;
    ParamByName('Qty_Delivered').AsInteger := QuantityAct;
    ParamByName('Date_Deliv_Actual').AsDateTime := DelivDateAct;
    ParamByName('Courier').asinteger := Courier;
    ParamByName('Service_no').asinteger := Service;
    if Sort = 0 then
      ParamByName('Courier_Sort').clear
    else
      ParamByName('Courier_Sort').asinteger := Sort;

    if Speed = 0 then
      ParamByName('Courier_Speed').clear
    else
      ParamByName('Courier_Speed').asinteger := Speed;

    ParamByName('Pack_Quantity').asinteger := 0;
    if PackSize = 0 then
      ParamByName('Package_size').clear
    else
      ParamByName('Package_size').asinteger := PackSize;
    ParamByName('Delivery_Weight_Kilos').asinteger := Weight;
    ParamByName('Package_Weight_gms').asinteger := Weight;
    if CustomerAccount then
      ParamByName('Customer_Account').asstring := 'Y'
    else
      ParamByName('Customer_Account').asstring := 'N';
    ParamByName('Name').asstring := DelivName;
    ParamByName('Customer_Account_Code').asstring := CustomerAccountCode;
    ParamByName('Customer_Account_Name').asstring := CustomerAccountName;
    if AddressReq then
      begin
        ParambyName('Name').asstring := DelivName;
        ParambyName('Building_no_Name').asstring := Address1;
        ParambyName('Street').asstring := Address2;
        ParambyName('Locale').asstring := Address3;
        ParambyName('Town').asstring := Town;
        ParambyName('Postcode').asstring := Postcode;
      end
    else
      begin
        ParambyName('Name').asstring := DelivName;
        ParambyName('Building_no_Name').clear;
        ParambyName('Street').clear;
        ParambyName('Locale').clear;
        ParambyName('Town').clear;
        ParambyName('Postcode').clear;
      end;
    ExecSQL;
  end;

end;

procedure TWODeliv.SetAddress1(const Value: string);
begin
  FAddress1 := Value;
end;

procedure TWODeliv.SetAddress2(const Value: string);
begin
  FAddress2 := Value;
end;

procedure TWODeliv.SetAddress3(const Value: string);
begin
  FAddress3 := Value;
end;

procedure TWODeliv.SetAddressReq(const Value: boolean);
begin
  FAddressReq := Value;
end;

procedure TWODeliv.SetCourier(const Value: integer);
begin
  FCourier := Value;
end;

procedure TWODeliv.SetCourierName(const Value: string);
begin
  FCourierName := Value;
end;

procedure TWODeliv.SetCustomerAccount(const Value: boolean);
begin
  FCustomerAccount := Value;
end;

procedure TWODeliv.SetCustomerAccountCode(const Value: string);
begin
  FCustomerAccountCode := Value;
end;

procedure TWODeliv.SetCustomerAccountName(const Value: string);
begin
  FCustomerAccountName := Value;
end;

procedure TWODeliv.SetDeferred(const Value: boolean);
begin
  FDeferred := Value;
end;

procedure TWODeliv.SetDelivDate(const Value: TDatetime);
begin
  FDelivDate := Value;
end;

procedure TWODeliv.SetDelivDateAct(const Value: TDateTime);
begin
  FDelivDateAct := Value;
end;

procedure TWODeliv.SetDelivName(const Value: string);
begin
  FDelivName := Value;
end;

procedure TWODeliv.SetDelivNumber(const Value: integer);
begin
  FDelivNumber := Value;
end;

procedure TWODeliv.SetHandOverDate(const Value: TDateTime);
begin
  FHandOverDate := Value;
end;

procedure TWODeliv.SetPackSize(const Value: integer);
begin
  FPackSize := Value;
end;

procedure TWODeliv.SetPackSizeDescr(const Value: string);
begin
  FPackSizeDescr := Value;
end;

procedure TWODeliv.SetParent(const Value: TWOrder);
begin
  FParent := Value;
end;

procedure TWODeliv.SetPostcode(const Value: string);
begin
  FPostcode := Value;
end;

procedure TWODeliv.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TWODeliv.SetQuantityAct(const Value: integer);
begin
  FQuantityAct := Value;
end;

procedure TWODeliv.SetReturnAddressRequired(const Value: boolean);
begin
  FReturnAddressRequired := Value;
end;

procedure TWODeliv.SetService(const Value: integer);
begin
  FService := Value;
end;

procedure TWODeliv.SetServiceDescr(const Value: string);
begin
  FServiceDescr := Value;
end;

procedure TWODeliv.SetSort(const Value: integer);
begin
  FSort := Value;
end;

procedure TWODeliv.SetSpeed(const Value: integer);
begin
  FSpeed := Value;
end;

procedure TWODeliv.SetTown(const Value: string);
begin
  FTown := Value;
end;

procedure TWODeliv.SetWeight(const Value: integer);
begin
  FWeight := Value;
end;

{ TWOQuestions }

procedure TWOQuestions.Add(aQuestion: TWOQuestion);
begin
  FItems.Add(aQuestion);
end;

procedure TWOQuestions.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWOQuestion(FItems[i]).Free;
end;

function TWOQuestions.Clone: TWOQuestions;
var
  i : integer;
begin
  Result := TWOQuestions.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TWOQuestion(FItems[i]).Clone);
end;

constructor TWOQuestions.Create(WOProcess: TWOProcess);
begin
  FParent := WOProcess;
  FItems := TList.Create;
end;

procedure TWOQuestions.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TWOQuestions.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWOQuestion(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TWOQuestions.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TWOQuestions.GetItems(Index: integer): TWOQuestion;
begin
  Result := TWOQuestion(FItems[Index]);
end;

function TWOQuestions.IndexOf(const QuestionNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TWOQuestion(FItems[i]).QuestionNo = QuestionNo then
      Result := i;
end;

procedure TWOQuestions.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TWOQuestion(FItems[i]).QuestionNo := (i+1);
end;

procedure TWOQuestions.SetItems(Index: integer; const Value: TWOQuestion);
begin
  FItems[Index] := Value;
end;

{ TWOQuestion }

function TWOQuestion.Clone: TWOQuestion;
begin
  Result := TWOQuestion.Create(FParent);
  Result.Answer       :=  self.Answer;
  Result.Mandatory    :=  self.Mandatory;
  Result.Process      :=  self.Process;
  Result.PromptType   :=  self.PromptType;
  Result.QuestionNo   :=  self.QuestionNo;
  Result.QuestionText :=  self.QuestionText;
  Result.Question     :=  self.Question;
end;

constructor TWOQuestion.Create(WOProcess: TWOProcess);
begin
  FParent := WOProcess;
end;

destructor TWOQuestion.Destroy;
begin

  inherited;
end;

procedure TWOQuestion.LoadFromDB;
begin
  with FParent.FParent.FDataModule.qryWOProcessQstn do
  begin
    Close;
    ParamByName('Works_order').AsInteger := FParent.FParent.DbKey;
    Parambyname('Process_no').asinteger := FParent.WOProcessNo;
    Parambyname('Process').asinteger := FParent.Process;
    ParambyName('Question').asinteger := Question;
    open;
    Process := FParent.Process;
    Answer := fieldbyname('Process_Answer').asstring;
    Mandatory := (fieldbyname('Mandatory').asstring = 'Y');
    PromptType := fieldbyname('Prompt_Type').asstring;
    QuestionText := fieldbyname('Process_Question').asstring;
  end;
end;

procedure TWOQuestion.SaveToDB;
begin
  with FParent.FParent.FDataModule.qryWOAddProcessQstn do
  begin
    close;
    ParamByName('Works_Order').AsInteger := FParent.FParent.DbKey;
    Parambyname('Process_no').asinteger := FParent.WOProcessNo;
    Parambyname('Process').asinteger := FParent.Process;
    ParambyName('Question').asinteger := Question;
    ParambyName('Process_Answer').asstring := Answer;
    execsql;
  end;
end;

procedure TWOQuestion.SetAnswer(const Value: string);
begin
  FAnswer := Value;
end;

procedure TWOQuestion.SetMandatory(const Value: boolean);
begin
  FMandatory := Value;
end;

procedure TWOQuestion.SetProcess(const Value: integer);
begin
  FProcess := Value;
end;

procedure TWOQuestion.SetPromptType(const Value: string);
begin
  FPromptType := Value;
end;

procedure TWOQuestion.SetQuestion(const Value: integer);
begin
  FQuestion := Value;
end;

procedure TWOQuestion.SetQuestionNo(const Value: integer);
begin
  FQuestionNo := Value;
end;

procedure TWOQuestion.SetQuestionText(const Value: string);
begin
  FQuestionText := Value;
end;

end.
