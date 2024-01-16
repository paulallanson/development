unit PBJobBagDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, pbMainMenu, PBWOrdersDm, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TJBMode   = (jbAdd, jbChange, jbDelete, jbCopy, jbView, jbRepeat, jbConvert, jbNonConform);
  TJBLMode  = (jblAdd, jblChange, jblDelete, jblView, jblRestrict, jblCopy, jblRepeat);
  TJBNCMode  = (jbncAdd, jbncChange, jbncDelete, jbncView, jbncRestrict, jbncCopy);
  TJBPRMode  = (jbprAdd, jbprChange, jbprDelete, jbprView, jbprCopy);
  TJBOrder  = (jboNumberName, jboNameNumber, jboDateNumber);
  TJBWOMode = (jbwoAdd, jbwoChange, jbwoRaise, jbwoDelete, jbwoRepeat, jbwoView);
  TJBDelivMode = (jbdelivAdd, jbdelivChange, jbdelivDelete, jbdelivView);
  TJBDocMode = (jbdocAdd, jbdocChange, jbdocDelete, jbdocView);
  TJBSchMode = (jbSchAdd, jbSchChange, jbSchDelete, jbSchView);

  TdmJobBag = class(TDataModule)
    dsJBHeaderGrid: TDataSource;
    qryJBHeaderGrid: TFDQuery;
    qryReserveSlot: TFDQuery;
    qryGetReservedSlot: TFDQuery;
    qryZero: TFDQuery;
    qryJBHeader: TFDQuery;
    qryJBUpdHeader: TFDQuery;
    qryJBLine: TFDQuery;
    qryJBAllLines: TFDQuery;
    qryJBAddLine: TFDQuery;
    dsJBAllLines: TDataSource;
    qryJBType: TFDQuery;
    qryPriceUnit: TFDQuery;
    OperatorSQL: TFDQuery;
    OperatorSRC: TDataSource;
    qryCustContact: TFDQuery;
    srcCustContact: TDataSource;
    qryCustReps: TFDQuery;
    srcCustReps: TDataSource;
    qryJBUpLine: TFDQuery;
    qryPOLine: TFDQuery;
    qryJBDelLine: TFDQuery;
    dsDummy: TDataSource;
    qryPO: TFDQuery;
    qryProductType: TFDQuery;
    qryInvoice: TFDQuery;
    qryCust: TFDQuery;
    qrySO: TFDQuery;
    GetLastJBLineSQL: TFDQuery;
    qrySOLine: TFDQuery;
    qryWO: TFDQuery;
    qryGetAllJBLines: TFDQuery;
    qryGetAccountMgr: TFDQuery;
    GetLastJBSQL: TFDQuery;
    UpdLastJBSQL: TFDQuery;
    qrySpare: TFDQuery;
    qryJBAddHeader: TFDQuery;
    qryGetOpAccountTeam: TFDQuery;
    qryGetAccountTeam: TFDQuery;
    qryJBRepeatLines: TFDQuery;
    qryJBWO: TFDQuery;
    srcJBWO: TDataSource;
    qryJBUpdHeaderStatus: TFDQuery;
    GetPartDetailsSQL: TFDQuery;
    qryJBAllWorks: TFDQuery;
    qryJBAddWorks: TFDQuery;
    qryJBWorks: TFDQuery;
    qryGetSupplier: TFDQuery;
    qryGetWorksOrder: TFDQuery;
    qryCheckJBInvoiced: TFDQuery;
    qryInvoiceLoc: TFDQuery;
    srcInvoiceLoc: TDataSource;
    qrySalesInvoice: TFDQuery;
    qryPOHead: TFDQuery;
    qryJBDocument: TFDQuery;
    qryJBAddDocument: TFDQuery;
    qryJBAllDocuments: TFDQuery;
    qryAllSalesInvoices: TFDQuery;
    srcAllSalesInvoices: TDataSource;
    qrySITotal: TFDQuery;
    qryGetRep: TFDQuery;
    qryGetCustomerRep: TFDQuery;
    oldqryJBAllProcesses: TFDQuery;
    qryJBAddProcess: TFDQuery;
    oldqryJBProcess: TFDQuery;
    qryJBAllSchedules: TFDQuery;
    qryJBAddSchedule: TFDQuery;
    qryJBSchedule: TFDQuery;
    qryJBAllRequests: TFDQuery;
    qryJBRequest: TFDQuery;
    qryJBAddRequest: TFDQuery;
    qryAddSOJBLine: TFDQuery;
    qryAllPurchInvoices: TFDQuery;
    srcAllPurchInvoices: TDataSource;
    qryQHeader: TFDQuery;
    qryQAllLines: TFDQuery;
    qryJBAddSupply: TFDQuery;
    qryJBSupply: TFDQuery;
    qryJBAllSupplies: TFDQuery;
    qryQAllSupplies: TFDQuery;
    qryJBHeadTechXML: TFDQuery;
    qryJBProcessTechXML: TFDQuery;
    qryJBMasterTechXML: TFDQuery;
    qryGetJBProdStatus: TFDQuery;
    qryAllProcesses: TFDQuery;
    qryJBProcess: TFDQuery;
    OldqryJBProcessTechXML: TFDQuery;
    qryJBSILines: TFDQuery;
    qryGetCustCC: TFDQuery;
    qryGetBranchCC: TFDQuery;
    qryDataCollect: TFDQuery;
    srcDataCollect: TDataSource;
    qryDepartments: TFDQuery;
    qryGetDataCollectTotals: TFDQuery;
    qryGetCustomerContact: TFDQuery;
    qryUpdQuoteStatus: TFDQuery;
    qryJBUpdQuoteStatus: TFDQuery;
    qryGetCustomerPrices: TFDQuery;
    qryJBAllNonConforms: TFDQuery;
    qryGetLastNC: TFDQuery;
    qryUpdateLastNC: TFDQuery;
    qryJBAddNonConform: TFDQuery;
    qryGetNonConformStatus: TFDQuery;
    qryPITotal: TFDQuery;
    qryDataCollectCosts: TFDQuery;
    srcDataCollectCosts: TDataSource;
    qryJBDelivery: TFDQuery;
    qryJBAddDelivery: TFDQuery;
    qryJBAllDeliveries: TFDQuery;
    GetAddHocAddrSQL: TFDQuery;
    AddrSRC: TDataSource;
    GetRepAddrSQL: TFDQuery;
    GetCustAddrSQL: TFDQuery;
    GetSuppAddrSQL: TFDQuery;
    GetCompAddrSQL: TFDQuery;
    GetCompBrAddrSQL: TFDQuery;
    qryCourierService: TFDQuery;
    dtsCourierService: TDataSource;
    qryPackageType: TFDQuery;
    dtsPackageType: TDataSource;
    qryAllPriceUnits: TFDQuery;
    dtsAllPriceUnits: TDataSource;
    qryGetCustomerAccount: TFDQuery;
    qryGetProcessGroups: TFDQuery;
    qryJProcessGroup: TFDQuery;
    qryJAddProcessGroup: TFDQuery;
    qryQProcessGroup: TFDQuery;
    qryAllSalesInvoiceCharges: TFDQuery;
    qryAllPurchInvoiceCharges: TFDQuery;
    qryUpdateContactStatus: TFDQuery;
    qryGetQuoteCostDefaults: TFDQuery;
    qryGetCustomerSubRep: TFDQuery;
    qryGetCustomer: TFDQuery;
    qryPackFormat: TFDQuery;
    dtsPackFormat: TDataSource;
    qryJBAllLinesJob_Bag: TIntegerField;
    qryJBAllLinesJob_Bag_Line: TIntegerField;
    qryJBAllLinesJob_Bag_Line_Type: TWideStringField;
    qryJBAllLinesPurchase_Order: TFloatField;
    qryJBAllLinesLine: TIntegerField;
    qryJBAllLinesSupplier: TIntegerField;
    qryJBAllLinesBranch_No: TIntegerField;
    qryJBAllLinesJob_Bag_Line_Descr: TWideStringField;
    qryJBAllLinesJob_Bag_Line_Cost: TCurrencyField;
    qryJBAllLinesJob_Bag_Line_Sell: TCurrencyField;
    qryJBAllLinesJob_Bag_Line_Invoiced: TWideStringField;
    qryJBAllLinesJob_Bag_Quantity: TIntegerField;
    qryJBAllLinesVAT_Code: TIntegerField;
    qryJBAllLinesCurrency_Code: TIntegerField;
    qryJBAllLinessupp_inv_recd: TWideStringField;
    qryJBAllLinesProduct_Type: TIntegerField;
    qryJBAllLinesinactive: TWideStringField;
    qryJBAllLinesOperator: TIntegerField;
    qryJBAllLinesSales_Order: TIntegerField;
    qryJBAllLinesSales_Order_Line_no: TIntegerField;
    qryJBAllLinesJob_Bag_Line_Status: TIntegerField;
    qryJBAllLinesworks_order: TIntegerField;
    qryJBAllLinesProcess: TIntegerField;
    qryJBAllLinesPrice_Unit: TIntegerField;
    qryJBAllLinesSelling_Price: TCurrencyField;
    qryJBAllLinesReady_to_invoice: TWideStringField;
    qryJBAllLinesQty_Invoiced: TFloatField;
    qryJBAllLinesUnit_Cost: TCurrencyField;
    qryJBAllLinesUnit_SSP: TCurrencyField;
    qryJBAllLinesUnit_Cost_plus_OHD: TCurrencyField;
    qryJBAllLinesUnit_SSP_Original: TCurrencyField;
    qryJBAllLinesQuote: TFloatField;
    qryJBAllLinesQuote_Line_no: TIntegerField;
    qryJBAllLinesCost_Number: TIntegerField;
    qryJBAllLinesCategory_Number: TIntegerField;
    qryJBAllLinesSub_Category: TIntegerField;
    qryJBAllLinesJob_Cost_Markup_Perc: TFloatField;
    qryJBAllLinesLine_Is_Internal_Cost: TWideStringField;
    qryJBAllLinesReseller_Price: TCurrencyField;
    qryJBAllLinesJob_Bag_Line_Reseller: TCurrencyField;
    qryJBAllLinesSupplierName: TWideStringField;
    qryJBAllLinesBranchName: TWideStringField;
    qryJBAllLinesLine_Inactive: TWideStringField;
    qryJBAllLinesVat_Description: TWideStringField;
    qryAllSalesInvoicesSales_Invoice: TIntegerField;
    qryAllSalesInvoicesSales_Invoice_No: TWideStringField;
    qryAllSalesInvoicesInvoice_Date: TSQLTimeStampField;
    qryAllSalesInvoicesInvoice_Description: TWideStringField;
    qryAllSalesInvoicesInvoice_or_Credit: TWideStringField;
    qryAllSalesInvoicesGoods_Value: TFloatField;
    qryAllSalesInvoicesVat_Value: TFloatField;
    qryAllSalesInvoicesTotal_Value: TFloatField;
    qryAllPurchInvoicesSupplier_Name: TWideStringField;
    qryAllPurchInvoicesSupplier_Invoice: TIntegerField;
    qryAllPurchInvoicesSupplier_Invoice_no: TWideStringField;
    qryAllPurchInvoicesInvoice_Date: TSQLTimeStampField;
    qryAllPurchInvoicesSupp_Inv_Alt_Ref: TWideStringField;
    qryAllPurchInvoicesInvoice_or_Credit: TWideStringField;
    qryAllPurchInvoicesPurchase_order: TFloatField;
    qryAllPurchInvoicesJob_Bag: TIntegerField;
    qryAllPurchInvoicesGoods_Value: TFloatField;
    qryAllPurchInvoicesVat_Value: TFloatField;
    qryAllPurchInvoicesTotal_Value: TFloatField;
    qryDataCollectJob_Bag_Time_Log: TIntegerField;
    qryDataCollectDate_Point: TSQLTimeStampField;
    qryDataCollectWork_Centre_Operator: TIntegerField;
    qryDataCollectWC_Operator_Name: TWideStringField;
    qryDataCollectProcess_Group: TIntegerField;
    qryDataCollectProcess_Group_Description: TWideStringField;
    qryDataCollectProcess: TIntegerField;
    qryDataCollectProcess_Description: TWideStringField;
    qryDataCollectWork_Centre: TIntegerField;
    qryDataCollectWork_Centre_Name: TWideStringField;
    qryDataCollectOperation: TIntegerField;
    qryDataCollectOperation_Description: TWideStringField;
    qryDataCollectPaper_Size: TIntegerField;
    qryDataCollectPaper_Size_Description: TWideStringField;
    qryDataCollectNumber_Up: TIntegerField;
    qryDataCollectQuantity: TFloatField;
    qryDataCollectLaser_Format: TWideStringField;
    qryDataCollectLabour_Time_From: TSQLTimeStampField;
    qryDataCollectLabour_Time_To: TSQLTimeStampField;
    qryDataCollectLabour_Hours: TFloatField;
    qryDataCollectMachine_Hours: TFloatField;
    qryDataCollectLabour_Overtime_Hours: TFloatField;
    qryDataCollectTeam_Count: TIntegerField;
    qryDataCollectHourly_Rate: TFloatField;
    procedure qryJBAllLinesMarginGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryJBAllLinesInactiveGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryJBAllLinesOrderNumberGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryAllSalesInvoicesCalcFields(DataSet: TDataSet);
    procedure qryAllPurchInvoicesCalcFields(DataSet: TDataSet);
  private
    FJBOrder: TJBOrder;
    function  GetCurrentJobBag: integer;
    function  GetCurrentLine: integer;
    function  GetCurrentLineInactive: Boolean;
    function  GetCurrentLineType: char;
    function  GetHeaderCount : integer;
    function  GetLineCount : integer;
    procedure SetJBOrder(const Value: TJBOrder);
    procedure FreeCompanyRecord;
    procedure LockCompanyRecord;
  public
    QuoteNo: real;
    ShowInactive: string;
    function  CalculatePrice(const PriceUnit: integer;
      Quantity, Price: double) : double;
    function CalculateStockPrice(const PriceUnit: integer; Quantity,
      Price: double): double;
    function IsCustomerOnStop(tempCust: integer): boolean;
    function GetNarrative(const iNarrative: integer): string;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    procedure ListAll;
    procedure ListAllLines(const aKey : integer);
    procedure FilterByName(const aName : string);
    property CurrentJobBag : integer read GetCurrentJobBag;
    property CurrentLine : integer read GetCurrentLine;
    property CurrentLineInactive: Boolean read GetCurrentLineInactive;
    property CurrentLineType : char read GetCurrentLineType;
    function GetContactAccountNo(tempCust, tempBranch, tempCode: integer): string;
    function GetCostCentre(tempCust, tempBranch: integer; tempCC, tempCCLevel: string): string;
    function GetCustomerInvoiceAccountCode(tempCust, tempBranch: integer): boolean;
    function GetCustomerRep(tempCust, tempBranch: integer): integer;
    function GetCustomerDefVAT(tempCust: integer): integer;
    function GetCustomerSubRep(tempCust, tempBranch: integer): integer;
    function GetDeliveryDescription(iTempCode, iTempBranch, iTempType: integer): string;
    function GetDataCollectTotals(iJobBag, iDept: integer; var rTotalLabour, rTotalOvertime, rTotalMachine: double): boolean;
    procedure GetDataCollectCosts(iJobBag: integer; var slProduction: TStringList);
    function GetJobBagTotalSalesInvoiced(tempCode: integer): real;
    function GetJobBagTotalPurchInvoiced(tempCode: integer): real;
    function GetJobBagLineCost(tempCode: integer; tempLine: integer): real;
    function GetJobBagLineInvoiced(tempCode, tempLine: integer): string;
    function GetJobBagLineReseller(tempCode, tempLine: integer): real;
    function GetJobBagLineSell(tempCode, tempLine: integer): real;
    function GetJobBagLineQty(tempCode, tempLine: integer): integer;
    function GetPriceUnitFactor(tempCode: integer): integer;
    function GetProductionStatus(tempCode: integer): string;
    function GetAccountTeamName(tempno: integer): string;
    function GetOpAccountTeam(tempno: integer): integer;
    function GetOpAccountTeamName(tempCode: integer): string;
    function GetNextJobBagLineNumber(tempno: integer): integer;
    function GetRepName(tempCode: integer): string;
    function GetSupplierName(tempCode: integer): string;
    function GetPartDescr(tempCode: string): string;
    function GetPartProductType(tempCode: string): integer;
    function GetPOStatus(tempCode: real; tempLine, JBno, JBline: integer; JBInvoiced: string): string;
    function GetPOAuthorised(tempCode: real): boolean;
    function GetPOAuthorisedBy(tempCode: real): integer;
    function GetPOOperator(tempCode: real): integer;
    function GetInvClearedFunds(tempCode: real; tempLine: integer): boolean;
    function GetPOClearedFunds(tempCode: real; tempLine: integer): boolean;
    function GetSOStatus(tempCode, JBno, JBline: integer; JBInvoiced: string): string;
    function GetSOStatusDescr(tempCode: integer): string;
    function GetSOLineCostPack(tempCode, tempLine: integer): integer;
    function GetSOLineCostPrice(tempCode, tempLine: integer): real;
    function GetSOLineDeliveryQty(tempCode, tempLine: integer): integer;
    function GetSOLineOrderQty(tempCode, tempLine: integer): integer;
    function GetSOLineSellPack(tempCode, tempLine: integer): integer;
    function GetSOLineSellPrice(tempCode, tempLine: integer): real;
    function GetSOLineVatCode(tempCode, tempLine: integer): integer;
    function GetSalesOrderStatus(SOno: integer): integer;
    function GetWOStatus(tempCode, JBno, JBline: integer; JBInvoiced: string): string;
    function GetSundryStatus(JBno, JBline: integer; JBInvoiced: string): string;
    function GetWorksOrderNumber(tempno: integer): integer;
    function GetWONumber(tempno: integer): double;
    procedure UpdateQuoteStatus(tempCode: double; tempStatus: integer);
    property JBOrder : TJBOrder read FJBOrder write SetJBOrder;
    property HeaderCount : integer read GetHeaderCount;
    property LineCount : integer read GetLineCount;
  end;

  TJobBag      = class;

  TJobBagDept = class
  private
    FJDepartmentNo: integer;
    FSpecification: string;
    FParent: TJobBag;
    FDepartmentName: string;
    FDepartment: integer;
    FSpecificationID: integer;
    procedure SetParent(const Value: TJobBag);
    procedure SetJDepartmentNo(const Value: integer);
    procedure SetSpecification(const Value: string);
    procedure SetDepartmentName(const Value: string);
    procedure SetDepartment(const Value: integer);
    procedure SetSpecificationID(const Value: integer);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    function Clone : TJobBagDept;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DepartmentName: string read FDepartmentName write SetDepartmentName;
    property Specification: string read FSpecification write SetSpecification;
    property SpecificationID: integer read FSpecificationID write SetSpecificationID;
    property Department: integer read FDepartment write SetDepartment;
    property JDepartmentNo: integer read FJDepartmentNo write SetJDepartmentNo;
    property Parent: TJobBag read FParent write SetParent;
  end;

  TJobBagDepts = class;

  TJobBagProcess = class
  private
    FJBProcessNo: integer;
    FParent: TJobBag;
    FQuantity: double;
    FNoOfHours: double;
    FPaperSize: integer;
    FNoOfElements: integer;
    FPaperDepth: integer;
    FPaperWidth: integer;
    FProcess: integer;
    FWorkCentreGroup: integer;
    FProcessName: string;
    FPaperSizeDescription: string;
    FWorkCentreGroupName: string;
    FSimplexDuplex: string;
    FProcessGroup: integer;
    FProcessGroupName: string;
    FIsUsed: boolean;
    procedure SetJBProcessNo(const Value: integer);
    procedure SetParent(const Value: TJobBag);
    procedure SetNoOfElements(const Value: integer);
    procedure SetNoOfHours(const Value: double);
    procedure SetPaperDepth(const Value: integer);
    procedure SetPaperSize(const Value: integer);
    procedure SetPaperSizeDescription(const Value: string);
    procedure SetPaperWidth(const Value: integer);
    procedure SetProcess(const Value: integer);
    procedure SetProcessName(const Value: string);
    procedure SetQuantity(const Value: double);
    procedure SetSimplexDuplex(const Value: string);
    procedure SetWorkCentreGroup(const Value: integer);
    procedure SetWorkCentreGroupName(const Value: string);
    procedure SetProcessGroup(const Value: integer);
    procedure SetProcessGroupName(const Value: string);
    procedure SetIsUsed(const Value: boolean);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    function Clone : TJobBagProcess;
    procedure LoadFromDB;
    procedure SaveToDB;
    property JBProcessNo: integer read FJBProcessNo write SetJBProcessNo;
    property NoOfHours: double read FNoOfHours write SetNoOfHours;
    property NoOfElements: integer read FNoOfElements write SetNoOfElements;
    property PaperSize: integer read FPaperSize write SetPaperSize;
    property PaperSizeDescription: string read FPaperSizeDescription write SetPaperSizeDescription;
    property PaperDepth: integer read FPaperDepth write SetPaperDepth;
    property PaperWidth: integer read FPaperWidth write SetPaperWidth;
    property Parent: TJobBag read FParent write SetParent;
    property Process: integer read FProcess write SetProcess;
    property ProcessName: string read FProcessName write SetProcessName;
    property ProcessGroup: integer read FProcessGroup write SetProcessGroup;
    property ProcessGroupName: string read FProcessGroupName write SetProcessGroupName;
    property Quantity: double read FQuantity write SetQuantity;
    property SimplexDuplex: string read FSimplexDuplex write SetSimplexDuplex;
    property IsUsed: boolean read FIsUsed write SetIsUsed;
    property WorkCentreGroup: integer read FWorkCentreGroup write SetWorkCentreGroup;
    property WorkCentreGroupName: string read FWorkCentreGroupName write SetWorkCentreGroupName;
  end;

  TJobBagProcesses = class;

  TJobBagDelivery = class
  private
    FParent: TJobBag;
    FDeliveryNo: integer;
    FQtyDelivered: double;
    FDeliveryWeightKilos: double;
    FQtyToDeliver: double;
    FCourier: integer;
    FPackageType: integer;
    FBranchNo: integer;
    FService: integer;
    FRep: integer;
    FAdhocAddress: integer;
    FNumberOfBoxes: integer;
    FPackageName: string;
    FServiceName: string;
    FDeliveryInstructions: string;
    FRepName: string;
    FContactName: string;
    FConsignmentNo: string;
    FCustomerName: string;
    FDeliveryNotePrinted: string;
    FDeliverViaCompany: string;
    FDeliverToStock: string;
    FDateRequired: TDateTime;
    FDateDelivered: TDateTime;
    FDatePoint: TDateTime;
    FSupplier: integer;
    FSupplierBranch: integer;
    FBoxQuantity: integer;
    FDeliveryLocation: string;
    FCompanyBranch: integer;
    FCourierName: string;
    FCustomer: integer;
    procedure SetParent(const Value: TJobBag);
    procedure SetDeliveryNo(const Value: integer);
    procedure SetAdhocAddress(const Value: integer);
    procedure SetBranchNo(const Value: integer);
    procedure SetConsignmentNo(const Value: string);
    procedure SetContactName(const Value: string);
    procedure SetCourier(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetDateDelivered(const Value: TDateTime);
    procedure SetDatePoint(const Value: TDateTime);
    procedure SetDateRequired(const Value: TDateTime);
    procedure SetDeliverToStock(const Value: string);
    procedure SetDeliverViaCompany(const Value: string);
    procedure SetDeliveryInstructions(const Value: string);
    procedure SetDeliveryNotePrinted(const Value: string);
    procedure SetDeliveryWeightKilos(const Value: double);
    procedure SetNumberOfBoxes(const Value: integer);
    procedure SetPackageName(const Value: string);
    procedure SetPackageType(const Value: integer);
    procedure SetQtyDelivered(const Value: double);
    procedure SetQtyToDeliver(const Value: double);
    procedure SetRep(const Value: integer);
    procedure SetRepName(const Value: string);
    procedure SetService(const Value: integer);
    procedure SetServiceName(const Value: string);
    procedure SetSupplier(const Value: integer);
    procedure SetSupplierBranch(const Value: integer);
    procedure SetBoxQuantity(const Value: integer);
    procedure SetDeliveryLocation(const Value: string);
    procedure SetCompanyBranch(const Value: integer);
    procedure SetCourierName(const Value: string);
    procedure SetCustomer(const Value: integer);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    function Clone : TJobBagDelivery;
    procedure LoadFromDB;
    procedure SaveToDB;
    property AdhocAddress: integer read FAdhocAddress write SetAdhocAddress;
    property BoxQuantity: integer read FBoxQuantity write SetBoxQuantity;
    property BranchNo: integer read FBranchNo write SetBranchNo;
    property CompanyBranch: integer read FCompanyBranch write SetCompanyBranch;
    property ConsignmentNo: string read FConsignmentNo write SetConsignmentNo;
    property ContactName: string read FContactName write SetContactName;
    property Courier: integer read FCourier write SetCourier;
    property CourierName: string read FCourierName write SetCourierName;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property DateDelivered: TDateTime read FDateDelivered write SetDateDelivered;
    property DatePoint: TDateTime read FDatePoint write SetDatePoint;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property DeliveryLocation: string read FDeliveryLocation write SetDeliveryLocation;
    property DeliverToStock: string read FDeliverToStock write SetDeliverToStock;
    property DeliverViaCompany: string read FDeliverViaCompany write SetDeliverViaCompany;
    property DeliveryInstructions: string read FDeliveryInstructions write SetDeliveryInstructions;
    property DeliveryNotePrinted: string read FDeliveryNotePrinted write SetDeliveryNotePrinted;
    property DeliveryNo: integer read FDeliveryNo write SetDeliveryNo;
    property DeliveryWeightKilos: double read FDeliveryWeightKilos write SetDeliveryWeightKilos;
    property NumberOfBoxes: integer read FNumberOfBoxes write SetNumberOfBoxes;
    property PackageType: integer read FPackageType write SetPackageType;
    property PackageName: string read FPackageName write SetPackageName;
    property Parent: TJobBag read FParent write SetParent;
    property QtyDelivered: double read FQtyDelivered write SetQtyDelivered;
    property QtyToDeliver: double read FQtyToDeliver write SetQtyToDeliver;
    property Rep: integer read FRep write SetRep;
    property RepName: string read FRepName write SetRepName;
    property Service: integer read FService write SetService;
    property ServiceName: string read FServiceName write SetServiceName;
    property Supplier: integer read FSupplier write SetSupplier;
    property SupplierBranch: integer read FSupplierBranch write SetSupplierBranch;
  end;

  TJobBagDeliveries = class;

  TJobBagDoc = class
  private
    FJBDocumentNo: integer;
    FDocumentPath: string;
    FDocumentTitle: string;
    FParent: TJobBag;
    FDocumentDate: TDateTime;
    FOperator: integer;
    FOperatorName: string;
    FCreatedBy: string;
    procedure SetDocumentPath(const Value: string);
    procedure SetJBDocumentNo(const Value: integer);
    procedure SetParent(const Value: TJobBag);
    procedure SetDocumentTitle(const Value: string);
    procedure SetDocumentDate(const Value: TDateTime);
    procedure SetCreatedBy(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    function Clone : TJobBagDoc;
    procedure LoadFromDB;
    procedure SaveToDB;
    property CreatedBy: string read FCreatedBy write SetCreatedBy;
    property DocumentDate: TDateTime read FDocumentDate write SetDocumentDate;
    property DocumentPath: string read FDocumentPath write SetDocumentPath;
    property DocumentTitle: string read FDocumentTitle write SetDocumentTitle;
    property JBDocumentNo: integer read FJBDocumentNo write SetJBDocumentNo;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property Parent: TJobBag read FParent write SetParent;
  end;

  TJobBagDocs = class;

  TJobBagNonConform = class
  private
    FTotalCost: double;
    FOperator: integer;
    FJBNonConformNo: integer;
    FQAOperator: integer;
    FRaisedBy: integer;
    FNCType: integer;
    FNCDepartment: integer;
    FCorrectiveNotes: string;
    FResponseNotes: string;
    FOperatorName: string;
    FQASignOffDate: TDateTime;
    FDatePoint: TDateTime;
    FParent: TJobBag;
    FNarrative: integer;
    FNarrativeText: string;
    FNCTypeDescription: string;
    FRaisedByName: string;
    FNCDepartmentName: string;
    FQAOperatorName: string;
    FNCNumber: integer;
    FStatus: integer;
    FStatusDescription: string;
    FCosttoClient: double;
    FInactive: string;
    FInactiveDate: TDateTime;
    FResponse: integer;
    FPreventative: integer;
    FCorrective: integer;
    FPreventativeNotes: string;
    FResponseDate: TDateTime;
    FCorrectiveDate: TDateTime;
    FPreventativeDate: TDatetime;
    FJobRePrinted: string;
    FSamplesAvailable: string;
    FNCCategory: integer;
    FNCCategoryDescription: string;
    procedure SetCorrectiveNotes(const Value: string);
    procedure SetDatePoint(const Value: TDateTime);
    procedure SetJBNonConformNo(const Value: integer);
    procedure SetNCDepartment(const Value: integer);
    procedure SetNCType(const Value: integer);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetParent(const Value: TJobBag);
    procedure SetQAOperator(const Value: integer);
    procedure SetQASignOffDate(const Value: TDateTime);
    procedure SetRaisedBy(const Value: integer);
    procedure SetResponseNotes(const Value: string);
    procedure SetTotalCost(const Value: double);
    procedure SetNarrative(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetNCTypeDescription(const Value: string);
    procedure SetRaisedByName(const Value: string);
    procedure SetNCDepartmentName(const Value: string);
    procedure SetQAOperatorName(const Value: string);
    procedure SetNCNumber(const Value: integer);
    procedure SetStatus(const Value: integer);
    procedure SetStatusDescription(const Value: string);
    procedure SetCosttoClient(const Value: double);
    procedure SetInactive(const Value: string);
    procedure SetInactiveDate(const Value: TDateTime);
    function GetStatusDescription: string;
    procedure SetResponse(const Value: integer);
    procedure SetCorrective(const Value: integer);
    procedure SetCorrectiveDate(const Value: TDateTime);
    procedure SetPreventative(const Value: integer);
    procedure SetPreventativeDate(const Value: TDatetime);
    procedure SetPreventativeNotes(const Value: string);
    procedure SetResponseDate(const Value: TDateTime);
    procedure SetJobRePrinted(const Value: string);
    procedure SetSamplesAvailable(const Value: string);
    procedure SetNCCategory(const Value: integer);
    procedure SetNCCategoryDescription(const Value: string);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    function Clone : TJobBagNonConform;
    procedure LoadFromDB;
    procedure SaveToDB;
    property Corrective: integer read FCorrective write SetCorrective;
    property CorrectiveDate: TDateTime read FCorrectiveDate write SetCorrectiveDate;
    property CorrectiveNotes: string read FCorrectiveNotes write SetCorrectiveNotes;
    property DatePoint: TDateTime read FDatePoint write SetDatePoint;
    property JBNonConformNo: integer read FJBNonConformNo write SetJBNonConformNo;
    property JobRePrinted: string read FJobRePrinted write SetJobRePrinted;
    property NCCategory: integer read FNCCategory write SetNCCategory;
    property NCCategoryDescription: string read FNCCategoryDescription write SetNCCategoryDescription;
    property NCDepartment: integer read FNCDepartment write SetNCDepartment;
    property NCDepartmentName: string read FNCDepartmentName write SetNCDepartmentName;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property NCNumber: integer read FNCNumber write SetNCNumber;
    property NCType: integer read FNCType write SetNCType;
    property NCTypeDescription: string read FNCTypeDescription write SetNCTypeDescription;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property Parent: TJobBag read FParent write SetParent;
    property Preventative: integer read FPreventative write SetPreventative;
    property PreventativeDate: TDatetime read FPreventativeDate write SetPreventativeDate;
    property PreventativeNotes: string read FPreventativeNotes write SetPreventativeNotes;
    property QAOperator: integer read FQAOperator write SetQAOperator;
    property QAOperatorName: string read FQAOperatorName write SetQAOperatorName;
    property QASignOffDate: TDateTime read FQASignOffDate write SetQASignOffDate;
    property RaisedBy: integer read FRaisedBy write SetRaisedBy;
    property RaisedByName: string read FRaisedByName write SetRaisedByName;
    property Response: integer read FResponse write SetResponse;
    property ResponseDate: TDateTime read FResponseDate write SetResponseDate;
    property ResponseNotes: string read FResponseNotes write SetResponseNotes;
    property SamplesAvailable: string read FSamplesAvailable write SetSamplesAvailable;
    property Status: integer read FStatus write SetStatus;
    property StatusDescription: string read GetStatusDescription;
    property TotalCost: double read FTotalCost write SetTotalCost;
    property CosttoClient: double read FCosttoClient write SetCosttoClient;
    property Inactive: string read FInactive write SetInactive;
    property InactiveDate: TDateTime read FInactiveDate write SetInactiveDate;
  end;

  TJobBagNonConforms = class;

  TJobBagSupply = class
  private
    FUnitSell: double;
    FUnitCost: double;
    FJBSupplyNo: integer;
    FPriceUnit: integer;
    FEnquiryLine: integer;
    FQuantity: integer;
    FEnquiry: integer;
    FPriceUnitFactor: integer;
    FProductType: integer;
    FPriceUnitDesc: string;
    FProductTypeDesc: string;
    FLineConverted: string;
    FDescription: string;
    FParent: TJobBag;
    function GetTotalCost: currency;
    function GetTotalSell: currency;
    procedure SetDescription(const Value: string);
    procedure SetEnquiry(const Value: integer);
    procedure SetEnquiryLine(const Value: integer);
    procedure SetJBSupplyNo(const Value: integer);
    procedure SetLineConverted(const Value: string);
    procedure SetPriceUnit(const Value: integer);
    procedure SetPriceUnitDesc(const Value: string);
    procedure SetPriceUnitFactor(const Value: integer);
    procedure SetProductType(const Value: integer);
    procedure SetProductTypeDesc(const Value: string);
    procedure SetQuantity(const Value: integer);
    procedure SetUnitCost(const Value: double);
    procedure SetUnitSell(const Value: double);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    function Clone : TJobBagSupply;
    procedure DeleteFromDB;
    procedure LoadFromDB;
    procedure SaveToDB;
    property Description: string read FDescription write SetDescription;
    property Enquiry: integer read FEnquiry write SetEnquiry;
    property EnquiryLine: integer read FEnquiryLine write SetEnquiryLine;
    property LineConverted: string read FLineConverted write SetLineConverted;
    property Parent : TJobBag read FParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitFactor: integer read FPriceUnitFactor write SetPriceUnitFactor;
    property PriceUnitDesc: string  read FPriceUnitDesc write SetPriceUnitDesc;
    property ProductType: integer read FProductType write SetProductType;
    property ProductTypeDesc: string read FProductTypeDesc write SetProductTypeDesc;
    property Quantity: integer read FQuantity write SetQuantity;
    property JBSupplyNo: integer read FJBSupplyNo write SetJBSupplyNo;
    property TotalCost: currency read GetTotalCost;
    property TotalSell: currency read GetTotalSell;
    property UnitCost: double read FUnitCost write SetUnitCost;
    property UnitSell: double read FUnitSell write SetUnitSell;
  end;

  TJobBagSupplies = class;

  TJobBagRequest = class
  private
    FSalesOrder: integer;
    FJBRequestNo: integer;
    FSalesOrderLine: integer;
    FParent: TJobBag;
    FQtyOrdered: integer;
    FStatus: integer;
    FQtyDespatched: integer;
    FPartDescription: string;
    FStatusDescr: string;
    FToInvoice: boolean;
    FPartCode: string;
    FDateRequested: TDateTime;
    FSellPrice: double;
    FCostPrice: double;
    FSellPackQty: integer;
    FVatCode: integer;
    FCostPackQty: integer;
    FIncludedCharge: boolean;
    FQtyInvoiced: integer;
    procedure SetJBRequestNo(const Value: integer);
    procedure SetParent(const Value: TJobBag);
    procedure SetSalesOrder(const Value: integer);
    procedure SetSalesOrderLine(const Value: integer);
    procedure SetPartCode(const Value: string);
    procedure SetPartDescription(const Value: string);
    procedure SetQtyDespatched(const Value: integer);
    procedure SetQtyOrdered(const Value: integer);
    procedure SetStatus(const Value: integer);
    procedure SetStatusDescr(const Value: string);
    procedure SetToInvoice(const Value: boolean);
    procedure SetDateRequested(const Value: TDateTime);
    procedure SetCostPackQty(const Value: integer);
    procedure SetCostPrice(const Value: double);
    procedure SetSellPackQty(const Value: integer);
    procedure SetSellPrice(const Value: double);
    procedure SetVatCode(const Value: integer);
    procedure SetIncludedCharge(const Value: boolean);
    procedure SetQtyInvoiced(const Value: integer);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    function Clone : TJobBagRequest;
    procedure LoadFromDB;
    procedure SaveToDB;
    property CostPackQty: integer read FCostPackQty write SetCostPackQty;
    property CostPrice: double read FCostPrice write SetCostPrice;
    property DateRequested: TDateTime read FDateRequested write SetDateRequested;
    property IncludedCharge: boolean read FIncludedCharge write SetIncludedCharge;
    property JBRequestNo: integer read FJBRequestNo write SetJBRequestNo;
    property Parent: TJobBag read FParent write SetParent;
    property PartCode: string read FPartCode write SetPartCode;
    property PartDescription: string read FPartDescription write SetPartDescription;
    property QtyInvoiced: integer read FQtyInvoiced write SetQtyInvoiced;
    property QtyOrdered: integer read FQtyOrdered write SetQtyOrdered;
    property QtyDespatched: integer read FQtyDespatched write SetQtyDespatched;
    property ToInvoice: boolean read FToInvoice write SetToInvoice;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
    property SalesOrderLine: integer read FSalesOrderLine write SetSalesOrderLine;
    property SellPackQty: integer read FSellPackQty write SetSellPackQty;
    property SellPrice: double read FSellPrice write SetSellPrice;
    property Status: integer read FStatus write SetStatus;
    property StatusDescr: string read FStatusDescr write SetStatusDescr;
    property VatCode: integer read FVatCode write SetVatCode;
  end;

  TJobBagRequests = class;

  TJobBagSched = class
  private
    FJBScheduleNo: integer;
    FParent: TJobBag;
    FSamplesRequired: boolean;
    FDSRequired: boolean;
    FArtRequired: boolean;
    FScheduleApproved: boolean;
    FProofByMethod: string;
    FArtApprovalDate: TDateTime;
    FSampleApprovalDate: TDateTime;
    FBriefRequiredDate: TDateTime;
    FSampleToClientDate: TDateTime;
    FArtDueDate: TDateTime;
    FTextAvailableDate: TDateTime;
    FDataRequiredDate: TDateTime;
    FArtProofDate: TDateTime;
    FProofApprovalDate: TDateTime;
    FTextProofDate: TDateTime;
    FProofRequiredDate: TDateTime;
    FTextRequiredDate: TDateTime;
    FBriefAvailableDate: TDateTime;
    FTextAvailableDateAct: TDateTime;
    FTextProofDateAct: TDateTime;
    FArtProofDateAct: TDateTime;
    FArtApprovalDateAct: TDateTime;
    FSampleApprovalDateAct: TDateTime;
    FProofRequiredDateAct: TDateTime;
    FBriefAvailableDateAct: TDateTime;
    FArtDueDateAct: TDateTime;
    FProofApprovalDateAct: TDateTime;
    FTextRequiredDateAct: TDateTime;
    FDataRequiredDateAct: TDateTime;
    FBriefRequiredDateAct: TDateTime;
    FSampleToClientDateAct: TDateTime;
    FOperator: integer;
    FScheduleDate: TDateTime;
    FOperatorName: string;
    FApprovalType: string;
    FNarrative: integer;
    FNarrativeText: string;
    FPDFProofArtworkDate: TDateTime;
    FDataAvailableDateAct: TDateTime;
    FPDFProofRequiredDate: TDateTime;
    FPDFProofApprovalDate: TDateTime;
    FPDFProofArtworkDateAct: TDateTime;
    FPDFProofApprovalDateAct: TDateTime;
    FDataAvailableDate: TDateTime;
    FPDFProofRequiredDateAct: TDateTime;
    procedure SetJBScheduleNo(const Value: integer);
    procedure SetParent(const Value: TJobBag);
    procedure SetArtApprovalDate(const Value: TDateTime);
    procedure SetArtDueDate(const Value: TDateTime);
    procedure SetArtProofDate(const Value: TDateTime);
    procedure SetArtRequired(const Value: boolean);
    procedure SetBriefAvailableDate(const Value: TDateTime);
    procedure SetBriefRequiredDate(const Value: TDateTime);
    procedure SetDataRequiredDate(const Value: TDateTime);
    procedure SetDSRequired(const Value: boolean);
    procedure SetProofApprovalDate(const Value: TDateTime);
    procedure SetProofByMethod(const Value: string);
    procedure SetProofRequiredDate(const Value: TDateTime);
    procedure SetSampleApprovalDate(const Value: TDateTime);
    procedure SetSamplesRequired(const Value: boolean);
    procedure SetSampleToClientDate(const Value: TDateTime);
    procedure SetScheduleApproved(const Value: boolean);
    procedure SetTextAvailableDate(const Value: TDateTime);
    procedure SetTextProofDate(const Value: TDateTime);
    procedure SetTextRequiredDate(const Value: TDateTime);
    procedure SetArtApprovalDateAct(const Value: TDateTime);
    procedure SetArtDueDateAct(const Value: TDateTime);
    procedure SetArtProofDateAct(const Value: TDateTime);
    procedure SetBriefAvailableDateAct(const Value: TDateTime);
    procedure SetBriefRequiredDateAct(const Value: TDateTime);
    procedure SetDataRequiredDateAct(const Value: TDateTime);
    procedure SetProofApprovalDateAct(const Value: TDateTime);
    procedure SetProofRequiredDateAct(const Value: TDateTime);
    procedure SetSampleApprovalDateAct(const Value: TDateTime);
    procedure SetSampleToClientDateAct(const Value: TDateTime);
    procedure SetTextAvailableDateAct(const Value: TDateTime);
    procedure SetTextProofDateAct(const Value: TDateTime);
    procedure SetTextRequiredDateAct(const Value: TDateTime);
    procedure SetOperator(const Value: integer);
    procedure SetScheduleDate(const Value: TDateTime);
    procedure SetOperatorName(const Value: string);
    procedure SetApprovalType(const Value: string);
    procedure SetNarrative(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetDataAvailableDate(const Value: TDateTime);
    procedure SetDataAvailableDateAct(const Value: TDateTime);
    procedure SetPDFProofApprovalDate(const Value: TDateTime);
    procedure SetPDFProofApprovalDateAct(const Value: TDateTime);
    procedure SetPDFProofArtworkDate(const Value: TDateTime);
    procedure SetPDFProofArtworkDateAct(const Value: TDateTime);
    procedure SetPDFProofRequiredDate(const Value: TDateTime);
    procedure SetPDFProofRequiredDateAct(const Value: TDateTime);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    function Clone : TJobBagSched;
    procedure LoadFromDB;
    procedure SaveToDB;
    property ApprovalType: string read FApprovalType write SetApprovalType;
    property ArtRequired: boolean read FArtRequired write SetArtRequired;
    property ArtDueDate: TDateTime read FArtDueDate write SetArtDueDate;
    property ArtProofDate: TDateTime read FArtProofDate write SetArtProofDate;
    property ArtApprovalDate: TDateTime read FArtApprovalDate write SetArtApprovalDate;
    property BriefAvailableDate: TDateTime read FBriefAvailableDate write SetBriefAvailableDate;
    property BriefRequiredDate: TDateTime read FBriefRequiredDate write SetBriefRequiredDate;
    property DSRequired: boolean read FDSRequired write SetDSRequired;
    property DataAvailableDate: TDateTime read FDataAvailableDate write SetDataAvailableDate;
    property DataRequiredDate: TDateTime read FDataRequiredDate write SetDataRequiredDate;
    property JBScheduleNo: integer read FJBScheduleNo write SetJBScheduleNo;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property Parent: TJobBag read FParent write SetParent;
    property PDFProofArtworkDate: TDateTime read FPDFProofArtworkDate write SetPDFProofArtworkDate;
    property PDFProofRequiredDate: TDateTime read FPDFProofRequiredDate write SetPDFProofRequiredDate;
    property PDFProofApprovalDate: TDateTime read FPDFProofApprovalDate write SetPDFProofApprovalDate;
    property ProofRequiredDate: TDateTime read FProofRequiredDate write SetProofRequiredDate;
    property ProofApprovalDate: TDateTime read FProofApprovalDate write SetProofApprovalDate;
    property SamplesRequired: boolean read FSamplesRequired write SetSamplesRequired;
    property SampleToClientDate: TDateTime read FSampleToClientDate write SetSampleToClientDate;
    property SampleApprovalDate: TDateTime read FSampleApprovalDate write SetSampleApprovalDate;
    property ScheduleApproved: boolean read FScheduleApproved write SetScheduleApproved;
    property ScheduleDate: TDateTime read FScheduleDate write SetScheduleDate;
    property TextRequiredDate: TDateTime read FTextRequiredDate write SetTextRequiredDate;
    property TextAvailableDate: TDateTime read FTextAvailableDate write SetTextAvailableDate;
    property TextProofDate: TDateTime read FTextProofDate write SetTextProofDate;
    property ArtDueDateAct: TDateTime read FArtDueDateAct write SetArtDueDateAct;
    property ArtProofDateAct: TDateTime read FArtProofDateAct write SetArtProofDateAct;
    property ArtApprovalDateAct: TDateTime read FArtApprovalDateAct write SetArtApprovalDateAct;
    property BriefAvailableDateAct: TDateTime read FBriefAvailableDateAct write SetBriefAvailableDateAct;
    property BriefRequiredDateAct: TDateTime read FBriefRequiredDateAct write SetBriefRequiredDateAct;
    property DataAvailableDateAct: TDateTime read FDataAvailableDateAct write SetDataAvailableDateAct;
    property DataRequiredDateAct: TDateTime read FDataRequiredDateAct write SetDataRequiredDateAct;
    property PDFProofArtworkDateAct: TDateTime read FPDFProofArtworkDateAct write SetPDFProofArtworkDateAct;
    property PDFProofRequiredDateAct: TDateTime read FPDFProofRequiredDateAct write SetPDFProofRequiredDateAct;
    property PDFProofApprovalDateAct: TDateTime read FPDFProofApprovalDateAct write SetPDFProofApprovalDateAct;
    property ProofRequiredDateAct: TDateTime read FProofRequiredDateAct write SetProofRequiredDateAct;
    property ProofApprovalDateAct: TDateTime read FProofApprovalDateAct write SetProofApprovalDateAct;
    property SampleToClientDateAct: TDateTime read FSampleToClientDateAct write SetSampleToClientDateAct;
    property SampleApprovalDateAct: TDateTime read FSampleApprovalDateAct write SetSampleApprovalDateAct;
    property TextRequiredDateAct: TDateTime read FTextRequiredDateAct write SetTextRequiredDateAct;
    property TextAvailableDateAct: TDateTime read FTextAvailableDateAct write SetTextAvailableDateAct;
    property TextProofDateAct: TDateTime read FTextProofDateAct write SetTextProofDateAct;
  end;

  TJobBagScheds = class;

  TJobBagLine = class
  private
    FParent: TJobBag;
    FJBLineType: char;
    FJBLineSell: currency;
    FJBLineCost: currency;
    FJBLine: integer;
    FBranchNo: integer;
    FLine: integer;
    FVATCode: integer;
    FCurrencyCode: integer;
    FJBQuantity: integer;
    FSupplier: integer;
    FPurchaseOrder: real;
    FJBLineDescr: string;
    FSupplierName: string;
    FBranchName: string;
    FJBLineMode: string;
    FJBLinePurchInvd: Boolean;
    FJBLineInactive: Boolean;
    FJBLineInvoiced: string;
    FProductType: integer;
    FSOLineNo: integer;
    FSONumber: integer;
    FWONumber: integer;
    FPriceUnit: integer;
    FProcess: integer;
    FSellPrice: currency;
    FJBLineStatus: integer;
    FJBLineStatusText: string;
    FWorksOrderNumber: double;
    FJustMoved: boolean;
    FSequence: integer;
    FJBQtyInvoiced: integer;
    FReadyToInvoice: string;
    FClearedFundsRec: boolean;
    FClearedFundsReq: boolean;
    FNeedsAuthorising: boolean;
    FSuggPrice: currency;
    FCostPrice: currency;
    FCostPriceOHD: currency;
    FSSPOrig: currency;
    FQuote: double;
    FQuoteLineNo: integer;
    FCategory: integer;
    FSubCategory: integer;
    FOperation: integer;
    FVATDescription: string;
    FSubCategoryDescr: string;
    FOperationDescr: string;
    FPriceUnitDescr: string;
    FCategoryDescr: string;
    FProcessDescr: string;
    FInternalCostLine: boolean;
    FInternalCostMarkupPercentage: real;
    FResellerPrice: currency;
    FJBLineReseller: currency;
    function GetJBLineInactive(tempCode: real; tempLine: integer): boolean;
    function GetPOLineStatus(tempCode: real; tempLine: integer): string;
    function GetSOLineStatus(tempCode, templine: integer): string;
    procedure SetBranchNo(const Value: integer);
    procedure SetCurrencyCode(const Value: integer);
    procedure SetJBLine(const Value: integer);
    procedure SetJBLineCost(const Value: currency);
    procedure SetJBLineDescr(const Value: string);
    procedure SetJBLineSell(const Value: currency);
    procedure SetJBLineType(const Value: char);
    procedure SetJBQuantity(const Value: integer);
    procedure SetLine(const Value: integer);
    procedure SetPurchaseOrder(const Value: real);
    procedure SetSupplier(const Value: integer);
    procedure SetVATCode(const Value: integer);
    procedure SetBranchName(const Value: string);
    procedure SetSupplierName(const Value: string);
    procedure SetJBLineMode(const Value: string);
    procedure SetJBLinePurchInvd(const Value: Boolean);
    procedure SetJBLineInactive(const Value: Boolean);
    procedure SetJBLineInvoiced(const Value: string);
    procedure SetProductType(const Value: integer);
    function GetProductTypeDesc: string;
    procedure SetSOLineNo(const Value: integer);
    procedure SetSONumber(const Value: integer);
    procedure SetWONumber(const Value: integer);
    procedure SetPriceUnit(const Value: integer);
    procedure SetProcess(const Value: integer);
    procedure SetSellPrice(const Value: currency);
    procedure SetJBLineStatus(const Value: integer);
    procedure SetJBLineStatusText(const Value: string);
    procedure SetWorksOrderNumber(const Value: double);
    procedure SetJustMoved(const Value: boolean);
    procedure SetSequence(const Value: integer);
    procedure SetJBQtyInvoiced(const Value: integer);
    procedure SetReadyToInvoice(const Value: string);
    procedure SetClearedFundsRec(const Value: boolean);
    procedure SetClearedFundsReq(const Value: boolean);
    procedure SetNeedsAuthorising(const Value: boolean);
    procedure SetCostPrice(const Value: currency);
    procedure SetSuggPrice(const Value: currency);
    procedure SetCostPriceOHD(const Value: currency);
    procedure SetSSPOrig(const Value: currency);
    procedure SetQuote(const Value: double);
    procedure SetQuoteLineNo(const Value: integer);
    procedure SetCategory(const Value: integer);
    procedure SetCategoryDescr(const Value: string);
    procedure SetOperation(const Value: integer);
    procedure SetOperationDescr(const Value: string);
    procedure SetPriceUnitDescr(const Value: string);
    procedure SetSubCategory(const Value: integer);
    procedure SetSubCategoryDescr(const Value: string);
    procedure SetVATDescription(const Value: string);
    procedure SetProcessDescr(const Value: string);
    procedure SetInternalCostLine(const Value: boolean);
    procedure SetInternalCostMarkupPercentage(const Value: real);
    procedure SetResellerPrice(const Value: currency);
    procedure SetJBLineReseller(const Value: currency);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    function Clone : TJobBagLine;
    procedure DeleteFromDB;
    function HasBeenInvoiced: boolean;
    procedure LoadFromDB;
    procedure SaveToDB;
    procedure UpdateToDB;
    property CurrencyCode : integer read FCurrencyCode write SetCurrencyCode;
    property Parent : TJobBag read FParent;
    property PurchaseOrder : real read FPurchaseOrder write SetPurchaseOrder;
    property Line : integer read FLine write SetLine;
    property SONumber: integer read FSONumber write SetSONumber;
    property SOLineNo: integer read FSOLineNo write SetSOLineNo;
    property Supplier: integer read FSupplier write SetSupplier;
    property SupplierName : string read FSupplierName write SetSupplierName;
    property BranchNo : integer read FBranchNo write SetBranchNo;
    property BranchName : string read FBranchName write SetBranchName;
    property Category: integer read FCategory write SetCategory;
    property CategoryDescr: string read FCategoryDescr write SetCategoryDescr;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property CostPriceOHD: currency read FCostPriceOHD write SetCostPriceOHD; // Cost Price plus Overheads
    property ClearedFundsReq: boolean read FClearedFundsReq write SetClearedFundsReq;
    property ClearedFundsRec: boolean read FClearedFundsRec write SetClearedFundsRec;
    property JBLine : integer read FJBLine write SetJBLine;
    property JBLineType : char read FJBLineType write SetJBLineType;
    property JBLineDescr : string read FJBLineDescr write SetJBLineDescr;
    property JBLineCost : currency read FJBLineCost write SetJBLineCost;
    property JBLineReseller: currency read FJBLineReseller write SetJBLineReseller;
    property JBLineSell : currency read FJBLineSell write SetJBLineSell;
    property JBLineInactive: Boolean read FJBLineInactive write SetJBLineInactive;
    property JBLineInvoiced: string read FJBLineInvoiced write SetJBLineInvoiced;
    property JBLinePurchInvd: Boolean read FJBLinePurchInvd write SetJBLinePurchInvd;
    property JBQuantity : integer read FJBQuantity write SetJBQuantity;
    property JBQtyInvoiced : integer read FJBQtyInvoiced write SetJBQtyInvoiced;
    property JBLineMode : string read FJBLineMode write SetJBLineMode;
    property JBLineStatus: integer read FJBLineStatus write SetJBLineStatus;
    property JBLineStatusText: string read FJBLineStatusText write SetJBLineStatusText;
    property InternalCostLine: boolean read FInternalCostLine write SetInternalCostLine;
    property InternalCostMarkupPercentage: real read FInternalCostMarkupPercentage write SetInternalCostMarkupPercentage;
    property NeedsAuthorising: boolean read FNeedsAuthorising write SetNeedsAuthorising;
    property Operation: integer read FOperation write SetOperation;
    property OperationDescr: string read FOperationDescr write SetOperationDescr;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitDescr: string read FPriceUnitDescr write SetPriceUnitDescr;
    property Process: integer read FProcess write SetProcess;
    property ProcessDescr: string read FProcessDescr write SetProcessDescr;
    property ProductType : integer read FProductType write SetProductType;
    property ProductTypeDesc: string read GetProductTypeDesc;
    property Quote: double read FQuote write SetQuote;
    property QuoteLineNo: integer read FQuoteLineNo write SetQuoteLineNo;
    property ReadyToInvoice: string read FReadyToInvoice write SetReadyToInvoice;
    property ResellerPrice: currency read FResellerPrice write SetResellerPrice;     {Unit Reseller Price}
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property SubCategory: integer read FSubCategory write SetSubCategory;
    property SubCategoryDescr: string read FSubCategoryDescr write SetSubCategoryDescr;
    property SuggPrice: currency read FSuggPrice write SetSuggPrice;
    property SSPOrig: currency read FSSPOrig write SetSSPOrig;  // SSP based on original estimating values + 10%
    property VATCode : integer read FVATCode write SetVATCode;
    property VATDescription: string read FVATDescription write SetVATDescription;
    property WONumber: integer read FWONumber write SetWONumber;
    property WorksOrderNumber: double read FWorksOrderNumber write SetWorksOrderNumber;
    property Sequence: integer read FSequence write SetSequence;
    property JustMoved: boolean read FJustMoved write SetJustMoved;
  end;

  TJobBaglines = class;

  TJobBagWOrder   = class
  private
    FJBWorksOrderNo: integer;
    FWorksOrder: integer;
    FDescription: string;
    FParent: TJobBag;
    FWorksOrderNumber: double;
    FQuantity: double;
    FWODate: TDateTime;
    FOriginalWIN: integer;
    FPreviousWIN: double;
    FStatusDescription: string;
    FStatus: integer;
    FMailDate: TDateTime;
    FStartDate: TDateTime;
    procedure SetDescription(const Value: string);
    procedure SetJBWorksOrderNo(const Value: integer);
    procedure SetParent(const Value: TJobBag);
    procedure SetWorksOrder(const Value: integer);
    procedure SetWorksOrderNumber(const Value: double);
    procedure SetQuantity(const Value: double);
    procedure SetWODate(const Value: TDateTime);
    procedure SetOriginalWIN(const Value: integer);
    procedure SetPreviousWIN(const Value: double);
    procedure SetStatusDescription(const Value: string);
    procedure SetStatus(const Value: integer);
    procedure SetMailDate(const Value: TDateTime);
    procedure SetStartDate(const Value: TDateTime);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    function Clone : TJobBagWOrder;
    procedure LoadFromDB;
    procedure SaveToDB;
    property Description: string read FDescription write SetDescription;
    property JBWorksOrderNo: integer read FJBWorksOrderNo write SetJBWorksOrderNo;
    property OriginalWIN: integer read FOriginalWIN write SetOriginalWIN;
    property Parent: TJobBag read FParent write SetParent;
    property PreviousWIN: double read FPreviousWIN write SetPreviousWIN;
    property WorksOrder: integer read FWorksOrder write SetWorksOrder;
    property WODate: TDateTime read FWODate write SetWODate;
    property WorksOrderNumber: double read FWorksOrderNumber write SetWorksOrderNumber;
    property Quantity: double read FQuantity write SetQuantity;
    property StartDate: TDateTime read FStartDate write SetStartDate;
    property MailDate: TDateTime read FMailDate write SetMailDate;
    property Status: integer read FStatus write SetStatus;
    property StatusDescription: string read FStatusDescription write SetStatusDescription;
  end;

  TJobBagWOrders = class;

  TJobBagWOrders  = class
  private
    FItems: TList;
    FParent: TJobBag;
    function GetCount: integer;
    function GetItems(Index: integer): TJobBagWOrder;
    procedure SetItems(Index: integer; const Value: TJobBagWOrder);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    procedure Add(aWorksOrder : TJobBagWOrder);
    procedure Clear;
    function  Clone : TJobBagWOrders;
    procedure Delete(const Index : integer);
    function  IndexOf(const WorksOrderNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJobBagWOrder read GetItems write SetItems;
      default;
    property Parent : TJobBag read FParent;
  end;

  TJobBagDepts  = class
  private
    FItems: TList;
    FParent: TJobBag;
    function GetCount: integer;
    function GetItems(Index: integer): TJobBagDept;
    procedure SetItems(Index: integer; const Value: TJobBagDept);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    procedure Add(aDepartment : TJobBagDept);
    procedure Clear;
    function  Clone : TJobBagDepts;
    procedure Delete(const Index : integer);
    function  IndexOf(const DepartmentNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJobBagDept read GetItems write SetItems;
      default;
    property Parent : TJobBag read FParent;
  end;

  TJobBagNonConforms = class
  private
    FParent: TJobBag;
    FItems : TList;
    function GetCount: integer;
    function GetItems(Index: integer): TJobBagNonConform;
    function GetMaxLineNo: integer;
    procedure SetItems(Index: integer; const Value: TJobBagNonConform);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    procedure Add(aNonConform : TJobBagNonConform);
    procedure Clear;
    function  Clone : TJobBagNonConforms;
    procedure Delete(const Index : integer);
    function IndexOf(const NonConformNo: integer) : integer;
//    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJobBagNonConform read GetItems write SetItems;
      default;
    property MaxLineNo: integer read GetMaxLineNo;
    property Parent : TJobBag read FParent;
  end;

  TJobBagSupplies = class
  private
    FParent: TJobBag;
    FItems : TList;
    function GetCount: integer;
    function GetItems(Index: integer): TJobBagSupply;
    procedure SetItems(Index: integer; const Value: TJobBagSupply);
    function GetMaxLineNo: integer;
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    procedure Add(aSupply : TJobBagSupply);
    procedure Clear;
    function  Clone : TJobBagSupplies;
    procedure Delete(const Index : integer);
    function IndexOf(const SupplyNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJobBagSupply read GetItems write SetItems;
      default;
    property MaxLineNo: integer read GetMaxLineNo;
    property Parent : TJobBag read FParent;
  end;

  TJobBagLines = class
  private
    FParent : TJobBag;
    FItems : TList;
    function GetItems(Index: integer): TJobBagLine;
    procedure SetItems(Index: integer; const Value: TJobBagLine);
    function GetCount: integer;
    function GetPOCount : integer;
    function GetMaxLineNo: integer;
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    procedure Add(aLine : TJobBagLine);
    procedure Clear;
    function  Clone : TJobBagLines;
    procedure Delete(const Index : integer);
    function IndexOf(const LineNumber: integer) : integer;
    function IndexOfSequence(const SeqNumber: integer): integer;
    procedure Renumber;
    procedure ReSequence;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJobBagLine read GetItems write SetItems;
      default;
    property Parent : TJobBag read FParent;
    property POCount : integer read GetPOCount;
    property MaxLineNo: integer read GetMaxLineNo;
  end;

  TJobBagScheds = class
  private
    FItems: TList;
    FParent: TJobBag;
    function GetCount: integer;
    function GetItems(Index: integer): TJobBagSched;
    procedure SetItems(Index: integer; const Value: TJobBagSched);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    procedure Add(aSchedule : TJobBagSched);
    procedure Clear;
    function  Clone : TJobBagScheds;
    procedure Delete(const Index : integer);
    function IndexOf(const ScheduleNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJobBagSched read GetItems write SetItems;
      default;
    property Parent : TJobBag read FParent;
  end;

  TJobBagProcesses = class
  private
    FItems: TList;
    FParent: TJobBag;
    function GetCount: integer;
    function GetItems(Index: integer): TJobBagProcess;
    procedure SetItems(Index: integer; const Value: TJobBagProcess);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    procedure Add(aProcess : TJobBagProcess);
    procedure Clear;
    function  Clone : TJobBagProcesses;
    procedure Delete(const Index : integer);
    function IndexOf(const ProcessNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJobBagProcess read GetItems write SetItems;
      default;
    property Parent : TJobBag read FParent;
  end;

  TJobBagRequests = class
  private
    FItems: TList;
    FParent: TJobBag;
    function GetCount: integer;
    function GetItems(Index: integer): TJobBagRequest;
    procedure SetItems(Index: integer; const Value: TJobBagRequest);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    procedure Add(aRequest : TJobBagRequest);
    procedure Clear;
    function  Clone : TJobBagRequests;
    procedure Delete(const Index : integer);
    function IndexOf(const RequestNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJobBagRequest read GetItems write SetItems;
      default;
    property Parent : TJobBag read FParent;
  end;

  TJobBagDocs  = class
  private
    FItems: TList;
    FParent: TJobBag;
    function GetCount: integer;
    function GetItems(Index: integer): TJobBagDoc;
    procedure SetItems(Index: integer; const Value: TJobBagDoc);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    procedure Add(aDocument : TJobBagDoc);
    procedure Clear;
    function  Clone : TJobBagDocs;
    procedure Delete(const Index : integer);
    function  IndexOf(const DocumentNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJobBagDoc read GetItems write SetItems;
      default;
    property Parent : TJobBag read FParent;
  end;

  TJobBagDeliveries  = class
  private
    FItems: TList;
    FParent: TJobBag;
    function GetCount: integer;
    function GetItems(Index: integer): TJobBagDelivery;
    procedure SetItems(Index: integer; const Value: TJobBagDelivery);
  public
    constructor Create(JobBag : TJobBag);
    destructor Destroy; override;
    procedure Add(aDelivery : TJobBagDelivery);
    procedure Clear;
    function  Clone : TJobBagDeliveries;
    procedure Delete(const Index : integer);
    function  IndexOf(const DeliveryNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TJobBagDelivery read GetItems write SetItems;
      default;
    property Parent : TJobBag read FParent;
  end;

  TJobBag = class
  private
    FDataModule : TdmJobBag;
    FDbKey: integer;
    FCustomer: integer;
    FDescription: string;
    FCustomerName: string;
    FDate: TDateTime;
    FJobBagLines : TJobBagLines;
    FJBOrder: TJBOrder;
    FBranchName: string;
    FBranch: integer;
    FSellingPrice: currency;
    FQtyInvoiced: integer;
    FJBArtwork: integer;
    FRep: integer;
    FProductType: integer;
    FNoOfParts: integer;
    FQuantity: integer;
    FFormReference: integer;
    FInactiveReason: integer;
    FNarrative: integer;
    FSellUnit: integer;
    FContactNo: integer;
    FDepth: real;
    FWidth: real;
    FOriginalJBOrder: real;
    FNumberInstructions: string;
    FNoofSets: string;
    FProofRequired: string;
    FWidthUnit: string;
    FDepthUnit: string;
    FCustOrderNo: string;
    FProofRevision: string;
    FInactive: string;
    FInvoiceUpfront: string;
    FOnHold: string;
    FFormsPerBox: string;
    FGoodsRequired: TDateTime;
    FProofDate: TDateTime;
    FInactiveDate: TDateTime;
    FOfficeContact: integer;
    FOperator: integer;
    FDefaultVatCode: integer;
    FReadyToInvoice: string;
    FOperatorName: string;
    FAccountManagerName: string;
    FAccountTeam: integer;
    FDescriptiveRef: string;
    FNarrativeText: string;
    FJBMode: TJBMode;
    FJobBagWOrders: TJobBagWOrders;
    FInvoiceLocation: integer;
    FJobBagDocs: TJobBagDocs;
    FDSRequired: boolean;
    FSamplesRequired: boolean;
    FArtRequired: boolean;
    FProofRequiredDate: TDateTime;
    FSampleApprovalDate: TDateTime;
    FTextRequiredDate: TDateTime;
    FBriefAvailableDate: TDateTime;
    FSampleToClientDate: TDateTime;
    FDataRequiredDate: TDateTime;
    FBriefRequiredDate: TDateTime;
    FTextAvailableDate: TDateTime;
    FScheduleApproved: boolean;
    FProofApprovalDate: TDateTime;
    FArtProofDate: TDateTime;
    FTextProofDate: TDateTime;
    FArtDueDate: TDateTime;
    FArtApprovalDate: TDateTime;
    FJobBagProcesses: TJobBagProcesses;
    FProofByMethod: string;
    FStartDate: TDateTime;
    FJobBagScheds: TJobBagScheds;
    FJobBagRequests: TJobBagRequests;
    FInvoiceBy: integer;
    FInvoiceByName: string;
    FInvoiceByDate: TDateTime;
    FQuoteNo: real;
    FJobBagSupplies: TJobBagSupplies;
    FProductionStatus: integer;
    FCostCentre: string;
    FCashSale: boolean;
    FJobBagNonConforms: TJobBagNonConforms;
    FProductionComplete: boolean;
    FProductionDate: TDateTime;
    FProductionCompleteBy: integer;
    FProductionCompleteByName: string;
    FJobBagDeliveries: TJobBagDeliveries;
    FStatus: integer;
    FPriceUnit: integer;
    FPriceUnitFactor: integer;
    FJobBagDepts: TJobBagDepts;
    FFileCopiesReceivedBy: integer;
    FFileCopiesReceivedName: string;
    FFileCopiesReceived: boolean;
    FFileCopiesReceivedDate: TDateTime;
    FSubRep: integer;
    FInvoiceThisWeek: boolean;
    FInvoiceThisWeekBy: integer;
    FInvoiceThisWeekDate: TDateTime;
    FInvoiceThisWeekName: string;
    FAcquiredCustomer: boolean;
    FEndUserBranch: integer;
    FEndUserCustomer: integer;
    FEndUserCustomerName: string;
    FPackFormat: integer;
    FEnclosingType: string;
    FTotalRepMargin: currency;
    FTotalRepMarginPerc: double;
    procedure AddZero;
    procedure DeleteZero;
    function  ReserveASlot : integer;
    procedure DeleteDeliveries;
    procedure DeleteDepartments;
    procedure DeleteDocuments;
    procedure DeleteRequests;
    procedure DeleteProcesses;
    procedure DeleteSupplies;
    procedure DeleteNonConforms;
    procedure DeleteSchedules;
    procedure DeleteLines;
    procedure DeleteWorks;
    function GetJBPurchInvoiced: byteBool;
    function GetJBStatus: integer;
    function GetWOStatus: integer;
    function GetTotalSell: currency;
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
    function GetTotalPOCount: integer;
    function GetJBHasBeenInvoiced: boolean;
    function GetNextJobBagNumber: integer;
    function GetOKtoInvoice: bytebool;
    function GetReconcileStock: boolean;
    procedure SaveCustomerContactStatus;
    procedure SaveDocuments;
    procedure SaveLines;
    procedure SaveWorks;
    procedure SaveQuoteStatus;
    procedure SaveStatus;
    procedure SaveDepartments;
    procedure SaveSupplies;
    procedure SaveRequests;
    procedure SaveSchedules;
    procedure SaveRepeatWorks;
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetDate(const Value: TDateTime);
    procedure SetDbKey(const Value: integer);
    procedure SetDescription(const Value: string);
    procedure SetJBOrder(const Value: TJBOrder);
    procedure SetBranchName(const Value: string);
    procedure SetBranch(const Value: integer);
    procedure SetContactNo(const Value: integer);
    procedure SetCustOrderNo(const Value: string);
    procedure SetDepth(const Value: real);
    procedure SetDepthUnit(const Value: string);
    procedure SetFormReference(const Value: integer);
    procedure SetFormsPerBox(const Value: string);
    procedure SetGoodsRequired(const Value: TDateTime);
    procedure SetInactive(const Value: string);
    procedure SetInactiveDate(const Value: TDateTime);
    procedure SetInactiveReason(const Value: integer);
    procedure SetInvoiceUpfront(const Value: string);
    procedure SetJBArtwork(const Value: integer);
    procedure SetNarrative(const Value: integer);
    procedure SetNoOfParts(const Value: integer);
    procedure SetNoofSets(const Value: string);
    procedure SetNumberInstructions(const Value: string);
    procedure SetOnHold(const Value: string);
    procedure SetOriginalJBOrder(const Value: real);
    procedure SetProductType(const Value: integer);
    procedure SetProofDate(const Value: TDateTime);
    procedure SetProofRequired(const Value: string);
    procedure SetProofRevision(const Value: string);
    procedure SetQtyInvoiced(const Value: integer);
    procedure SetQuantity(const Value: integer);
    procedure SetRep(const Value: integer);
    procedure SetSellingPrice(const Value: currency);
    procedure SetSellUnit(const Value: integer);
    procedure SetWidth(const Value: real);
    procedure SetWidthUnit(const Value: string);
    procedure SetOfficeContact(const Value: integer);
    procedure SetOperator(const Value: integer);
    procedure SetDefaultVatCode(const Value: integer);
    procedure SetReadyToInvoice(const Value: string);
    procedure SetOperatorName(const Value: string);
    procedure SetAccountManagerName(const Value: string);
    procedure SetAccountTeam(const Value: integer);
    procedure SetDescriptiveRef(const Value: string);
    procedure SetNarrativeText(const Value: string);
    procedure SetJBMode(const Value: TJBMode);
    procedure SetInvoiceLocation(const Value: integer);
    procedure SetArtDueDate(const Value: TDateTime);
    procedure SetArtProofDate(const Value: TDateTime);
    procedure SetArtRequired(const Value: boolean);
    procedure SetBriefAvailableDate(const Value: TDateTime);
    procedure SetBriefRequiredDate(const Value: TDateTime);
    procedure SetDataRequiredDate(const Value: TDateTime);
    procedure SetDSRequired(const Value: boolean);
    procedure SetProofApprovalDate(const Value: TDateTime);
    procedure SetProofRequiredDate(const Value: TDateTime);
    procedure SetSampleApprovalDate(const Value: TDateTime);
    procedure SetSamplesRequired(const Value: boolean);
    procedure SetSampleToClientDate(const Value: TDateTime);
    procedure SetScheduleApproved(const Value: boolean);
    procedure SetTextAvailableDate(const Value: TDateTime);
    procedure SetTextProofDate(const Value: TDateTime);
    procedure SetTextRequiredDate(const Value: TDateTime);
    procedure SetArtApprovalDate(const Value: TDateTime);
    procedure SetProofByMethod(const Value: string);
    procedure SetStartDate(const Value: TDateTime);
    procedure SetInvoiceBy(const Value: integer);
    procedure SetInvoiceByName(const Value: string);
    procedure SetInvoiceByDate(const Value: TDateTime);
    procedure SetQuoteNo(const Value: real);
    procedure SetProductionStatus(const Value: integer);
    procedure SetCostCentre(const Value: string);
    procedure SetCashSale(const Value: boolean);
    function GetCustomerHasPrices: boolean;
    procedure SetProductionComplete(const Value: boolean);
    procedure SetProductionDate(const Value: TDateTime);
    procedure SetProductionCompleteBy(const Value: integer);
    procedure SetProductionCompleteByName(const Value: string);
    procedure SetStatus(const Value: integer);
    procedure SetPriceUnit(const Value: integer);
    function GetUnitSell: currency;
    procedure SetPriceUnitFactor(const Value: integer);
    procedure SetFileCopiesReceived(const Value: boolean);
    procedure SetFileCopiesReceivedBy(const Value: integer);
    procedure SetFileCopiesReceivedName(const Value: string);
    procedure SetFileCopiesReceivedDate(const Value: TDateTime);
    procedure SetSubRep(const Value: integer);
    procedure SetInvoiceThisWeek(const Value: boolean);
    procedure SetInvoiceThisWeekBy(const Value: integer);
    procedure SetInvoiceThisWeekDate(const Value: TDateTime);
    procedure SetInvoiceThisWeekName(const Value: string);
    procedure SetAcquiredCustomer(const Value: boolean);
    procedure SetEndUserBranch(const Value: integer);
    procedure SetEndUserCustomer(const Value: integer);
    procedure SetEndUserCustomerName(const Value: string);
    procedure SetPackFormat(const Value: integer);
    procedure SetEnclosingType(const Value: string);
  public
    constructor Create(DataModule : TdmJobBag);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TJobBag;
    procedure DeleteFromDB;
    function GetCompanyMarkup: real;
    function GetCustomerMarkup(Customer: integer; var bOverride: boolean; var rMarkup: real): boolean;
    function GetNextJBNonConformNo: integer;
    procedure InsertQuoteLines;
    procedure LoadFromDB;
    procedure LoadFromQuote;
    procedure LoadCostLine;
    procedure LoadLines;
    procedure LoadWorks;
    procedure LoadDeliveries;
    procedure LoadDepartments;
    procedure LoadDocuments;
    procedure LoadProcesses;
    procedure LoadNonConformDocs;
    procedure LoadSupplies;
    procedure LoadQuoteLines;
    procedure LoadQuoteSupplies;
    procedure LoadQuoteDepartments;
    procedure LoadSchedules;
    procedure LoadRequests;
    procedure LoadRepeatWorks;
    procedure LoadRepeatLines;
    procedure SaveToDB(TempAll: boolean);
    procedure SaveProcesses;
    procedure SaveNonConformDocs;
    procedure SaveDeliveries;
    property AccountManagerName: string read FAccountManagerName write SetAccountManagerName;
    property AccountTeam: integer read FAccountTeam write SetAccountTeam;
    property AcquiredCustomer: boolean read FAcquiredCustomer write SetAcquiredCustomer;
    property ArtRequired: boolean read FArtRequired write SetArtRequired;
    property ArtDueDate: TDateTime read FArtDueDate write SetArtDueDate;
    property ArtProofDate: TDateTime read FArtProofDate write SetArtProofDate;
    property ArtApprovalDate: TDateTime read FArtApprovalDate write SetArtApprovalDate;
    property CashSale: boolean read FCashSale write SetCashSale;
    property Departments: TJobBagDepts read FJobBagDepts;
    property DSRequired: boolean read FDSRequired write SetDSRequired;
    property DataRequiredDate: TDateTime read FDataRequiredDate write SetDataRequiredDate;
    property BriefRequiredDate: TDateTime read FBriefRequiredDate write SetBriefRequiredDate;
    property TextRequiredDate: TDateTime read FTextRequiredDate write SetTextRequiredDate;
    property BriefAvailableDate: TDateTime read FBriefAvailableDate write SetBriefAvailableDate;
    property TextAvailableDate: TDateTime read FTextAvailableDate write SetTextAvailableDate;
    property TextProofDate: TDateTime read FTextProofDate write SetTextProofDate;
    property ProofRequiredDate: TDateTime read FProofRequiredDate write SetProofRequiredDate;
    property ProofApprovalDate: TDateTime read FProofApprovalDate write SetProofApprovalDate;
    property ProofByMethod: string read FProofByMethod write SetProofByMethod;
    property SamplesRequired: boolean read FSamplesRequired write SetSamplesRequired;
    property SampleToClientDate: TDateTime read FSampleToClientDate write SetSampleToClientDate;
    property SampleApprovalDate: TDateTime read FSampleApprovalDate write SetSampleApprovalDate;
    property ScheduleApproved: boolean read FScheduleApproved write SetScheduleApproved;
    property Branch : integer read FBranch write SetBranch;
    property BranchName : string read FBranchName write SetBranchName;
    property ContactNo: integer read FContactNo write SetContactNo;
    property CostCentre: string read FCostCentre write SetCostCentre;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property CustomerHasPrices: boolean read GetCustomerHasPrices;
    property CustOrderNo: string read FCustOrderNo write SetCustOrderNo;
    property DataModule: TdmJobBag read FDataModule;
    property Date : TDateTime read FDate write SetDate;
    property DbKey : integer read FDbKey write SetDbKey;
    property DefaultVatCode: integer read FDefaultVatCode write SetDefaultVatCode;
    property Deliveries : TJobBagDeliveries read FJobBagDeliveries;
    property Depth: real read FDepth write SetDepth;
    property DepthUnit: string read FDepthUnit write SetDepthUnit;
    property Description : string read FDescription write SetDescription;
    property DescriptiveRef: string read FDescriptiveRef write SetDescriptiveRef;
    property Documents : TJobBagDocs read FJobBagDocs;
    property EnclosingType: string read FEnclosingType write SetEnclosingType;
    property EndUserBranch: integer read FEndUserBranch write SetEndUserBranch;
    property EndUserCustomer: integer read FEndUserCustomer write SetEndUserCustomer;
    property EndUserCustomerName: string read FEndUserCustomerName write SetEndUserCustomerName;
    property FileCopiesReceived: boolean read FFileCopiesReceived write SetFileCopiesReceived;
    property FileCopiesReceivedBy: integer read FFileCopiesReceivedBy write SetFileCopiesReceivedBy;
    property FileCopiesReceivedDate: TDateTime read FFileCopiesReceivedDate write SetFileCopiesReceivedDate;
    property FileCopiesReceivedName: string read FFileCopiesReceivedName write SetFileCopiesReceivedName;
    property FormReference: integer read FFormReference write SetFormReference;
    property FormsPerBox: string read FFormsPerBox write SetFormsPerBox;
    property GoodsRequired : TDateTime read FGoodsRequired write SetGoodsRequired;
    property Inactive: string read FInactive write SetInactive;
    property InactiveDate: TDateTime read FInactiveDate write SetInactiveDate;
    property InactiveReason: integer read FInactiveReason write SetInactiveReason;
    property InvoiceUpfront: string read FInvoiceUpfront write SetInvoiceUpfront;
    property InvoiceLocation: integer read FInvoiceLocation write SetInvoiceLocation;
    property InvoiceBy: integer read FInvoiceBy write SetInvoiceBy;
    property InvoiceByDate: TDateTime read FInvoiceByDate write SetInvoiceByDate;
    property InvoiceByName: string read FInvoiceByName write SetInvoiceByName;
    property InvoiceThisWeek: boolean read FInvoiceThisWeek write SetInvoiceThisWeek;
    property InvoiceThisWeekBy: integer read FInvoiceThisWeekBy write SetInvoiceThisWeekBy;
    property InvoiceThisWeekDate: TDateTime read FInvoiceThisWeekDate write SetInvoiceThisWeekDate;
    property InvoiceThisWeekName: string read FInvoiceThisWeekName write SetInvoiceThisWeekName;
    property JBArtwork: integer read FJBArtwork write SetJBArtwork;
    property JBOrder : TJBOrder read FJBOrder write SetJBOrder;
    property JBStatus: integer read GetJBStatus;
    property JBPurchInvoiced: byteBool read GetJBPurchInvoiced;
    property JBHasBeenInvoiced : boolean read GetJBHasBeenInvoiced;
    property JBMode: TJBMode read FJBMode write SetJBMode;
    property Lines : TJobBagLines read FJobBagLines;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property NonConformDocs: TJobBagNonConforms read FJobBagNonConforms;
    property NoOfParts: integer read FNoOfParts write SetNoOfParts;
    property NoofSets: string read FNoofSets write SetNoofSets;
    property NumberInstructions: string read FNumberInstructions write SetNumberInstructions;
    property OfficeContact: integer read FOfficeContact write SetOfficeContact;
    property OKtoInvoice: bytebool read GetOKtoInvoice;
    property OnHold: string read FOnHold write SetOnHold;
    property OriginalJBOrder: real read FOriginalJBOrder write SetOriginalJBOrder;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property PackFormat: integer read FPackFormat write SetPackFormat;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property PriceUnitFactor : integer read FPriceUnitFactor write SetPriceUnitFactor;
    property Processes: TJobBagProcesses read FJobBagProcesses;
    property ProductionComplete: boolean read FProductionComplete write SetProductionComplete;
    property ProductionCompleteBy: integer read FProductionCompleteBy write SetProductionCompleteBy;
    property ProductionCompleteByName: string read FProductionCompleteByName write SetProductionCompleteByName;
    property ProductionDate: TDateTime read FProductionDate write SetProductionDate;
    property ProductionStatus: integer read FProductionStatus write SetProductionStatus;
    property ProductType : integer read FProductType write SetProductType;
    property ProofDate : TDateTime read FProofDate write SetProofDate;
    property ProofRequired: string read FProofRequired write SetProofRequired;
    property ProofRevision: string read FProofRevision write SetProofRevision;
    property Quantity: integer read FQuantity write SetQuantity;
    property QuoteNo: real read FQuoteNo write SetQuoteNo;
    property QtyInvoiced: integer read FQtyInvoiced write SetQtyInvoiced;
    property ReadyToInvoice: string read FReadyToInvoice write SetReadyToInvoice;
    property ReconcileStock: boolean read GetReconcileStock;
    property Rep: integer read FRep write SetRep;
    property Requests : TJobBagRequests read FJobBagRequests;
    property SellingPrice: currency read FSellingPrice write SetSellingPrice;
    property SellUnit: integer read FSellUnit write SetSellUnit;
    property Schedules: TJobBagScheds read FJobBagScheds;
    property Status: integer read FStatus write SetStatus;
    property StartDate: TDateTime read FStartDate write SetStartDate;
    property SubRep: integer read FSubRep write SetSubRep;
    property Supplies: TJobBagSupplies read FJobBagSupplies;
    property TotalNonInternalCost : currency read GetTotalNonInternalCost;
    property TotalCost : currency read GetTotalCost;
    property TotalMargin : currency read GetTotalMargin;
    property TotalMarginPerc : double read GetTotalMarginPerc;
    property TotalRepCost : currency read GetTotalRepCost;
    property TotalRepMargin : currency read GetTotalRepMargin;
    property TotalRepMarginPerc : double read GetTotalRepMarginPerc;
    property TotalReseller: currency read GetTotalReseller;
    property TotalResellerMargin : currency read GetTotalResellerMargin;
    property TotalResellerMarginPerc : double read GetTotalResellerMarginPerc;
    property TotalSell : currency read GetTotalSell;
    property TotalPOCount: integer read GetTotalPOCount;
    property UnitSell : currency read GetUnitSell;
    property Width: real read FWidth write SetWidth;
    property WidthUnit: string read FWidthUnit write SetWidthUnit;
    property Works : TJobBagWOrders read FJobBagWOrders;
  end;

implementation

uses
  ComObj, ActiveX, PBNarrativeDM, pbDatabase, Utils;

{$R *.DFM}

{ TJobBag }

procedure TJobBag.AddZero;
begin
  { To overcome problems with empty tables and NULL values,
    we write dummy records with key value zero which will
    be deleted at the end of reserving a slot. }
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO Customer(Customer) VALUES(0)');
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
    SQL.Add('INSERT INTO Job_Bag (Job_bag, Job_Bag_Descr, Customer, Branch_no, Date_point, Operator)');
    SQL.Add('VALUES(0,'' '',0,0,0,' + inttostr(frmPBMainMenu.iOperator) + ')');
    try
      ExecSQL;
    except { ignore error, may be a record lying around from a failed attempt }
    end;
  end;
end;

procedure TJobBag.Clear;
begin
  Customer :=       0;
  CustomerName :=   '';
  Date :=           0;
  Description :=    '';
  FJobBagLines.Clear;
  FJobBagWOrders.Clear;
  FJobBagDocs.Clear;
  FJobBagProcesses.Clear;
  FJobBagScheds.Clear;
  FJobBagRequests.Clear;
  FJobBagSupplies.Clear;
  FJobBagNonConforms.clear;
  FJobBagDeliveries.clear;
  FJobBagDepts.clear;
end;

function TJobBag.Clone: TJobBag;
begin
  Result := TJobBag.Create(FDataModule);
  Result.AccountManagerName := self.AccountManagerName;
  Result.AccountTeam  :=    Self.AccountTeam;
  Result.AcquiredCustomer := self.AcquiredCustomer;

  Result.ArtRequired  :=        Self.ArtRequired;
  Result.ArtDueDate :=          Self.ArtDueDate;
  Result.ArtProofDate :=        Self.ArtProofDate;
  Result.ArtApprovalDate :=     Self.ArtApprovalDate;

  Result.CashSale :=            self.CashSale;
  Result.CostCentre :=          Self.CostCentre;
  Result.DSRequired :=          Self.DSRequired;
  Result.DataRequiredDate :=    Self.DataRequiredDate;
  Result.BriefRequiredDate  :=  Self.BriefRequiredDate;
  Result.TextRequiredDate :=    Self.TextRequiredDate;
  Result.BriefAvailableDate :=  Self.BriefAvailableDate;
  Result.TextAvailableDate  :=  Self.TextAvailableDate;
  Result.TextProofDate  :=      Self.TextProofDate;
  Result.ProofRequiredDate  :=  Self.ProofRequiredDate;
  Result.ProofApprovalDate  :=  Self.ProofApprovalDate;
  Result.ProofByMethod    :=    Self.ProofByMethod;
  Result.SamplesRequired  :=    Self.SamplesRequired;
  Result.SampleToClientDate :=  Self.SampleToClientDate;
  Result.SampleApprovalDate :=  Self.SampleApprovalDate;
  Result.ScheduleApproved :=    Self.ScheduleApproved;

  Result.EnclosingType :=       self.EnclosingType;
  Result.EndUserBranch  :=      self.EndUserBranch;
  Result.EndUserCustomer  :=    self.EndUserCustomer;
  Result.EndUserCustomerName := self.EndUserCustomerName;

  Result.FileCopiesReceived :=      self.FileCopiesReceived;
  Result.FileCopiesReceivedBy :=    self.FileCopiesReceivedBy;
  Result.FileCopiesReceivedDate :=  self.FileCopiesReceivedDate;
  Result.FileCopiesReceivedName :=  self.FileCopiesReceivedName;

  Result.Branch :=          Self.Branch;
  Result.BranchName :=      Self.BranchName;
  Result.Customer :=        Self.Customer;
  Result.CustomerName :=    Self.CustomerName;
  Result.Date :=            Self.Date;
  Result.DbKey :=           Self.DbKey;
  Result.Description :=     Self.Description;
  Result.DescriptiveRef :=  Self.DescriptiveRef;
  Result.JBOrder :=         Self.JBOrder;
  Result.SellingPrice :=    Self.SellingPrice;
  Result.QtyInvoiced :=     Self.QtyInvoiced;
  Result.JBArtwork :=       Self.JBArtwork;
  Result.Rep :=             Self.Rep;
  Result.ProductType :=     Self.ProductType;
  Result.NoOfParts :=       Self.NoOfParts;
  Result.Quantity :=        Self.Quantity;
  Result.QuoteNo :=         Self.QuoteNo;
  Result.FormReference :=   Self.FormReference;
  Result.InactiveReason :=  Self.InactiveReason;
  Result.InvoiceLocation := Self.InvoiceLocation;
  Result.InvoiceBy    :=    Self.InvoiceBy;
  Result.InvoiceByDate :=   Self.InvoiceByDate;
  Result.InvoiceByName :=   Self.InvoiceByName;
  Result.Narrative :=       Self.Narrative;
  Result.NarrativeText :=   self.NarrativeText;
  Result.SellUnit :=        Self.SellUnit;
  Result.ContactNo :=       Self.ContactNo;

  Result.InvoiceThisWeek :=       Self.InvoiceThisWeek;
  Result.InvoiceThisWeekBy :=     Self.InvoiceThisWeekBy;
  Result.InvoiceThisWeekDate :=     Self.InvoiceThisWeekDate;
  Result.InvoiceThisWeekName :=     Self.InvoiceThisWeekName;

  Result.PackFormat :=      self.PackFormat;
  Result.PriceUnit  :=      self.PriceUnit;
  Result.PriceUnitFactor := self.PriceUnitFactor;
  Result.ProductionComplete := self.ProductionComplete;
  Result.ProductionCompleteBy := self.ProductionCompleteBy;
  Result.ProductionCompleteByName := self.ProductionCompleteByName;
  Result.ProductionDate :=  self.ProductionDate;

  Result.ReadyToInvoice :=  Self.ReadyToInvoice;
  Result.Depth :=           Self.Depth;
  Result.Width :=           Self.Width;
  Result.OriginalJBOrder := Self.OriginalJBOrder;
  Result.NumberInstructions := Self.NumberInstructions;
  Result.NoofSets :=        Self.NoofSets;
  Result.ProofRequired :=   Self.ProofRequired;
  Result.ProductionStatus := Self.ProductionStatus;
  Result.WidthUnit :=       Self.WidthUnit;
  Result.DepthUnit :=       Self.DepthUnit;
  Result.CustOrderNo :=     Self.CustOrderNo;
  Result.ProofRevision :=   Self.ProofRevision;
  Result.Inactive :=        Self.Inactive;
  Result.InvoiceUpfront :=  Self.InvoiceUpfront;
  Result.OnHold :=          Self.OnHold ;
  Result.FormsPerBox :=     Self.FormsPerBox;
  Result.StartDate  :=      Self.StartDate;
  Result.GoodsRequired :=   Self.GoodsRequired;
  Result.ProofDate :=       Self.ProofDate;
  Result.InactiveDate :=    Self.InactiveDate;
  Result.OfficeContact :=   Self.OfficeContact;
  Result.Operator :=        Self.Operator;
  Result.OperatorName :=    Self.OperatorName;
  Result.Status :=          self.status;
  Result.SubRep :=          self.SubRep;

  Result.FJobBagLines.Free;
  Result.FJobBagLines :=    Self.FJobBagLines.Clone;
  Result.FJobBagSupplies.Free;
  Result.FJobBagSupplies :=   Self.FJobBagSupplies.Clone;
  Result.FJobBagWOrders.Free;
  Result.FJobBagWOrders :=   Self.FJobBagWOrders.Clone;
  Result.FJobBagDocs.Free;
  Result.FJobBagDocs :=   Self.FJobBagDocs.Clone;
  Result.FJobBagProcesses.Free;
  Result.FJobBagProcesses :=   Self.FJobBagProcesses.Clone;
  Result.FJobBagScheds.Free;
  Result.FJobBagScheds :=   Self.FJobBagScheds.Clone;
  Result.FJobBagRequests.Free;
  Result.FJobBagRequests :=   Self.FJobBagRequests.Clone;
  Result.FJobBagDeliveries.Free;
  Result.FJobBagDeliveries :=   Self.FJobBagDeliveries.Clone;
  Result.FJobBagDepts.Free;
  Result.FJobBagDepts :=   Self.FJobBagDepts.Clone;
end;

constructor TJobBag.Create(DataModule : TdmJobBag);
begin
  FDataModule := DataModule;
  FJobBagLines := TJobBagLines.Create(Self);
  FJobBagWOrders := TJobBagWOrders.Create(Self);
  FJobBagDocs := TJobBagDocs.Create(Self);
  FJobBagProcesses := TJobBagProcesses.Create(Self);
  FJobBagScheds := TJobBagScheds.Create(Self);
  FJobBagRequests := TJobBagRequests.create(self);
  FJobBagSupplies := TJobBagSupplies.create(self);
  FJobBagNonConforms := TJobBagnonConforms.create(self);
  FJobBagDeliveries := TJobBagDeliveries.create(self);
  FJobBagDepts := TJobBagDepts.create(self);
end;

procedure TJobBag.DeleteFromDB;
begin
  DeleteDepartments;
  DeleteWorks;
  DeleteProcesses;
  DeleteSupplies;
  DeleteDocuments;
  DeleteRequests;
  DeleteSchedules;
  DeleteLines;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag WHERE Job_Bag=' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJobBag.DeleteLines;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag_Line_Dets WHERE Job_Bag=' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJobBag.DeleteWorks;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag_Works_Order WHERE Job_Bag =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJobBag.DeleteDeliveries;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag_Delivery_Detail WHERE Job_Bag =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJobBag.DeleteDepartments;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag_Process_Group WHERE Job_Bag =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJobBag.DeleteDocuments;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag_Document WHERE Job_Bag =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJobBag.DeleteRequests;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag_Stock_Request WHERE Job_Bag =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJobBag.DeleteNonConforms;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag_Non_Conform WHERE Job_Bag =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJobBag.DeleteProcesses;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag_Process WHERE Job_Bag =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJobBag.DeleteSchedules;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag_Schedule WHERE Job_Bag =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TJobBag.DeleteZero;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag WHERE Job_Bag=0');
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

destructor TJobBag.Destroy;
begin
  FJobBagLines.Free;
  FJobBagWOrders.Free;
  FJobBagDocs.Free;
  FJobBagProcesses.Free;
  FJobBagScheds.Free;
  FJobBagRequests.Free;
  FJobBagSupplies.Free;
  FJobBagNonConforms.free;
  FJobBagDeliveries.Free;
  FJobBagDepts.Free;
  inherited;
end;

procedure TJobBag.LoadFromDB;
begin
  { Load the header record then all lines belonging to this job bag }
  Clear;
  with FDataModule.qryJBHeader do
  begin
    Close;
    ParamByName('JobBag').AsInteger := DbKey;
    Open;
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

    Close;
  end;
  if JBMode = jbRepeat then
    begin
      LoadRepeatLines;
      LoadProcesses;
      LoadDepartments;
//      LoadRepeatWorks;
    end
  else
  if JBMode = jbNonConform then
    begin
      LoadNonConformDocs;
    end
  else
    begin
      LoadLines;
      LoadWorks;
      LoadDocuments;
      LoadDepartments;
      LoadProcesses;
      LoadSupplies;
      LoadSchedules;
      LoadRequests;
      LoadDeliveries;
      if self.DbKey <> 0 then
        LoadNonConformDocs;
    end;
end;

function TJobBag.GetTotalSell: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FJobBagLines.Count) do
    if not FJobBagLines[i].JBLineInactive then
      Result := Result + roundfloat(FJobBagLines[i].JBLineSell,2);
end;

function TJobBag.GetTotalCost: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FJobBagLines.Count) do
    if not FJobBagLines[i].JBLineInactive and not FJobBagLines[i].FInternalCostLine then
      Result := Result + roundfloat(FJobBagLines[i].JBLineCost,2);
end;

function TJobBag.GetTotalMargin: currency;
begin
  Result := TotalSell - TotalCost;
end;

function TJobBag.GetTotalMarginPerc: double;
begin
  if FJobBagLines.Count = 0 then
    Result := 0
  else
  if TotalSell <> 0 then
    Result := (TotalMargin/TotalSell) * 100
  else
    Result := -999999;
end;

procedure TJobBag.LoadLines;
var
  aLine : TJobBagLine;
  icount: integer;
  stest: string;
begin
  icount := 0;
  FJobBagLines.Clear;
  with FDataModule.qryJBAllLines do
  begin
    Close;
    ParamByName('JobBag').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      inc(icount);
      aLine := TJobBagLine.Create(Self);
      aLine.CurrencyCode := FieldByName('Currency_Code').AsInteger;
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

      FJobBagLines.Add(aLine);
      Next;
    end;
    Close;
  end;

  {Add internal cost line if set up}
  if iCount = 0 then
    begin
      LoadCostLine;
    end;

  {Check if cost line has been added when copying or requoting}
  if (jbMode = jbcopy) or (jbMode = jbRepeat) then
    begin
      for icount := 0 to pred(lines.Count) do
        begin
          if lines[icount].InternalCostLine then
            exit;
        end;
      LoadCostLine;
    end;
end;

procedure TJobBag.LoadCostLine;
var
  aLine : TJobBagLine;
  rMarkup: real;
  Result, bOverride: boolean;
begin
  if not dmBroker.UseProduction then exit;
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

          aLine := TJobBagLine.Create(Self);
          aLine.CurrencyCode := 0;
          aLine.JBLine :=  (self.Lines.count) + 1;
          aLine.JBLineType := 'A';
          aLine.PurchaseOrder := 0;
          aLine.Line := 0;
          aLine.Supplier := dmBroker.GetCompanySupplier;
          aLine.BranchNo := dmBroker.GetCompanySupplierBranch;
          aLine.SupplierName:= aLine.parent.DataModule.GetSupplierName(aLine.Supplier);
          aLine.BranchName := '';
          aLine.JBLineDescr := fieldbyname('Default_Quote_Cost_Description').asstring;
          aLine.JBLineSell := 0.00;
          aLine.JBLineReseller := 0.00;

          aLine.JBLineInactive := false;

          aLine.Quote := 0;
          aLine.QuoteLineNo := 0;

          aLine.SONumber := 0;
          aLine.SOLineNo := 0;

          aLine.JBLineInvoiced := 'N';

          aLine.JBQtyInvoiced := 0;
          aLine.JBLinePurchInvd := false;
          aLine.JBQuantity := 1;
          aLine.ProductType := fieldbyname('Product_Type').asinteger;
          aLine.VATCode := fieldbyname('Vat_Code').AsInteger;
          aLine.VATDescription := '';
          aLine.WONumber := 0;
          aLine.WorksOrderNumber := 0;
          aLine.Process := fieldbyname('Default_Quote_Cost_Process').asinteger;
          aLine.PriceUnit := 2;
          aLine.SellPrice := 0;
          aLine.CostPrice := 0;
          aLine.SuggPrice := 0;
          aLine.CostPriceOHD := 0;
          aLine.SSPOrig := 0;
          aLine.JBLineMode := 'A';
          aLine.JBLineStatus := 10;
          aLine.JBLineStatusText := FDataModule.GetSundryStatus(dbKey, aLine.JBLine, aLine.JBLineInvoiced);

          aLine.Sequence := (self.Lines.count) + 1;
          aLine.JustMoved := false;
          aLine.ReadyToInvoice := 'N';
          aLine.ClearedFundsReq := false;
          aLine.ClearedFundsRec := false;
          aLine.NeedsAuthorising := false;

          aLine.InternalCostLine := true;
          aLine.InternalCostMarkupPercentage := rMarkup;
//          aLine.InternalCostMarkupPercentage := fieldbyname('Default_Quote_Cost_markup_perc').asfloat;
          aLine.JBLineCost := (self.TotalNonInternalCost * (aLine.InternalCostMarkupPercentage/100));
          FJobBagLines.Add(aLine);
        end;
    end;
end;

procedure TJobBag.LoadRepeatLines;
var
  icount: integer;
  aLine : TJobBagLine;
  rMarkup: real;
  Result, bOverride: boolean;
begin
  FJobBagLines.Clear;
  with FDataModule.qryJBRepeatLines do
  begin
    Close;
    ParamByName('JobBag').AsInteger := DbKey;
    Open;
    icount := 0;
    while not(EOF) do
    begin

      aLine := TJobBagLine.Create(Self);
      inc(icount);
      aLine.CurrencyCode := FieldByName('Currency_Code').AsInteger;
      aLine.JBLine := icount;
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
      aLine.JBLineInactive := false;
      aLine.SONumber := FieldByName('Sales_Order').asinteger;
      aLine.SOLineNo := FieldByName('Sales_Order_Line_no').AsInteger;
      aLine.JBLineInvoiced := 'N';

      aLine.JBQtyInvoiced := 0;
      aLine.JBLinePurchInvd := false;
      aLine.JBQuantity := FieldByName('Job_Bag_Quantity').AsInteger;
      aLine.ProductType := FieldByName('Product_Type').AsInteger;
      aLine.VATCode := FDataModule.GetCustomerDefVAT(Customer);
      aLine.WONumber := 0;
      aLine.WorksOrderNumber := 0;
      aLine.Process := 0;
      aLine.PriceUnit := Fieldbyname('Price_Unit').asinteger;
      aLine.SellPrice := Fieldbyname('Selling_Price').asfloat;
      aLine.CostPrice := FieldbyName('Unit_Cost').asfloat;
      aLine.SuggPrice := fieldbyName('Unit_SSP').asfloat;
      aLine.CostPriceOHD := FieldbyName('Unit_Cost_plus_OHD').asfloat;
      aLine.SSPOrig := fieldbyName('Unit_SSP_Original').asfloat;
      aLine.JBLineMode := 'A';
      aLine.JBLineStatus := 10;
      aLine.JBLineStatusText := 'Sundry Created';
      aLine.Sequence := icount;
      aLine.ReadyToInvoice := 'N';
      aLine.JustMoved := false;
      aLine.ClearedFundsReq := false;
      aLine.ClearedFundsRec := false;
      aLine.NeedsAuthorising := false;

      aLine.InternalCostLine := (fieldbyname('Line_Is_Internal_Cost').asstring = 'Y');
      if aLine.InternalCostLine then
        begin
          {Get the customer and check if there is an ovveride on the cost markup}
          bOverride := false;
          rMarkup := dmBroker.GetDefaultCostMarkupPerc;
          {The Override is checked and markup set within the function}
          Result := self.GetCustomerMarkup(Customer, bOverride, rMarkup);
//          if result and not bOverride then
//            rMarkup := fieldbyname('Job_Cost_Markup_Perc').asfloat;
          aLine.InternalCostMarkupPercentage := rMarkup;
        end
      else
        aLine.InternalCostMarkupPercentage := 0.00;
//      aLine.InternalCostMarkupPercentage := fieldbyname('Job_Cost_Markup_Perc').asfloat;

      FJobBagLines.Add(aLine);
      Next;
    end;
    Close;
  end;

  {Insert a cost line if using production}
  for icount := 0 to pred(lines.Count) do
    begin
      if lines[icount].InternalCostLine then
        exit;
    end;
  LoadCostLine;
end;

function TJobBag.ReserveASlot: integer;
var
  aGuid : TGUID;
begin
  { To prevent collisions in a multi-user environment, we get the next
    available job bag key by unconditionally writing a dummy record into
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
      Parambyname('Operator').asinteger := frmPBMainMenu.iOperator;
      ExecSQL;
    end;
    with FDataModule.qryGetReservedSlot do
    begin
      Close;
      ParamByname('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Job_Bag').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TJobBag.SaveStatus;
begin
  with FDataModule.qryJBUpdHeaderStatus do
    begin
      ParamByName('JobBag').AsInteger := DbKey;
      ParamByName('Job_Bag_Status').Asinteger := JBStatus;
      execsql;
    end;
end;

procedure TJobBag.SaveQuoteStatus;
begin
  with FDataModule.qryJBUpdQuoteStatus do
    begin
      ParamByName('Job_Bag').AsInteger := DbKey;
      ParamByName('Quote_Status').AsInteger := 100;
      execsql;
    end;
end;

procedure TJobBag.SaveCustomerContactStatus;
begin
  with FDataModule.qryUpdateContactStatus do
    begin
      close;
      paramByName('Customer').asinteger := Customer;
      ParamByName('Branch_no').AsInteger := Branch;
      ParamByName('Contact_no').AsInteger := ContactNo;
      ExecSQL;
    end;
end;

procedure TJobBag.SaveLines;
var
  i : integer;
begin
  { When saving, if job bag has been invoiced in any way then don't delete.
    otherwise, we have to delete all line records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  if (JBStatus > 10) or (JBPurchInvoiced) or JBHasBeenInvoiced then
    begin
      for i := 0 to Pred(FJobBagLines.Count) do
        begin
          if FJobBagLines[i].JBLineMode = 'C' then
            FJobBagLines[i].UpdateToDB
          else
          if FJobBagLines[i].JBLineMode = 'A' then
            begin
              FJobBagLines[i].SaveToDB;
              FJobBagLines[i].JBLineMode := 'C';
            end
          else
          if FJobBagLines[i].JBLineMode = 'N' then
            begin
              FJobBagLines[i].SaveToDB;
              FJobBagLines[i].JBLineMode := 'C';
            end
          else
          if FJobBagLines[i].JBLineMode = 'D' then
            FJobBagLines[i].DeletefromDB;
        end
    end
  else
    begin
      DeleteLines;  { Get rid of any already in database }
      FJobBagLines.Renumber;
      for i := 0 to Pred(FJobBagLines.Count) do
        FJobBagLines[i].SaveToDB;
    end;
end;

procedure TJobBag.SaveWorks;
var
  i : integer;
begin
  DeleteWorks;  { Get rid of any already in database }
  FJobBagWOrders.Renumber;
  for i := 0 to Pred(FJobBagWOrders.Count) do
    FJobBagWOrders[i].SaveToDB;
end;

procedure TJobBag.SaveDocuments;
var
  i : integer;
begin
  DeleteDocuments;  { Get rid of any already in database }
  FJobBagDocs.Renumber;
  for i := 0 to Pred(FJobBagDocs.Count) do
    FJobBagDocs[i].SaveToDB;
end;

procedure TJobBag.SaveDeliveries;
var
  i : integer;
begin
  DeleteDeliveries;  { Get rid of any already in database }
  FJobBagDeliveries.Renumber;
  for i := 0 to Pred(FJobBagDeliveries.Count) do
    FJobBagDeliveries[i].SaveToDB;
end;

procedure TJobBag.SaveRequests;
var
  i : integer;
begin
  DeleteRequests;  { Get rid of any already in database }
  FJobBagRequests.Renumber;
  for i := 0 to Pred(FJobBagRequests.Count) do
    FJobBagRequests[i].SaveToDB;
end;

procedure TJobBag.SaveNonConformDocs;
var
  i : integer;
begin
  DeleteNonConforms;  { Get rid of any already in database }
//  FJobBagNonConforms.Renumber;
  for i := 0 to Pred(FJobBagNonConforms.Count) do
    FJobBagNonConforms[i].SaveToDB;
end;

procedure TJobBag.SaveProcesses;
var
  i : integer;
begin
  DeleteProcesses;  { Get rid of any already in database }
  FJobBagProcesses.Renumber;
  for i := 0 to Pred(FJobBagProcesses.Count) do
    if FJobBagProcesses[i].isUsed then
      FJobBagProcesses[i].SaveToDB
end;

procedure TJobBag.SaveSchedules;
var
  i : integer;
begin
  DeleteSchedules;  { Get rid of any already in database }
  FJobBagScheds.Renumber;
  for i := 0 to Pred(FJobBagScheds.Count) do
    FJobBagScheds[i].SavetoDB;
end;

procedure TJobBag.SaveRepeatWorks;
var
  key: integer;
  i : integer;
  aWOrder: TWOrder;
  dtmdlJBWOrders: TdtmdlWOrders;
begin
  dtmdlJBWOrders := TdtmdlWOrders.create(application);

  try
    for i := 0 to Pred(FJobBagWOrders.Count) do
      begin
        key := FJobBagWOrders[i].OriginalWIN;
        aWOrder := TWOrder.Create(dtmdlJBWOrders);
        try
          aWOrder.DbKey := key;
          aWOrder.LoadFromDB;

          aWOrder.dbKey := 0;
          aWOrder.WODate := now;
          aWOrder.WONumberPrevious := FJobBagWOrders[i].PreviousWIN;
          aWOrder.DateRequired := date;
          aWOrder.EstimatedStartDate := date;
          aWOrder.JobBagNo := self.DbKey;
          aWOrder.WOCount := i;
          aWOrder.SaveToDB(true);

          FJobBagWOrders[i].WorksOrder := aWOrder.dbKey;
          FJobBagWOrders[i].WorksOrderNumber := aWOrder.WONumber;
        finally
          aWOrder.Free;
        end;

      end;
  finally
    dtmdlJBWOrders.free;
  end;
end;

procedure TJobBag.SaveToDB(TempAll: boolean);
var
  iTempNarr: integer;
  bNewJob: boolean;
begin
  bNewJob := false;
  if DbKey = 0 then
    begin
      bNewJob := true;
      DbKey     := GetNextJobBagNumber;
      with FDataModule.qryJBAddHeader do
        begin
          ParamByName('Job_Bag').AsInteger := DbKey;
          ParamByName('Branch_no').AsInteger := Branch;
          ParamByName('Customer').AsInteger := Customer;
          ParamByName('Contact_no').AsInteger := ContactNo;
          Parambyname('Cost_Centre').asstring := CostCentre;
          if CashSale then
            ParambyName('Cash_Sales').AsString := 'Y'
          else
            Parambyname('Cash_Sales').asstring := 'N';

          ParamByName('Job_Bag_Status').Asinteger := JBStatus;
          ParamByName('Date_Point').AsDateTime := Date;
          ParamByName('Date_Start').AsDateTime := StartDate;
          ParamByName('Goods_Required').AsDateTime := GoodsRequired;
          ParamByName('Office_Contact').Asinteger := OfficeContact;
          ParamByName('Job_Bag_Descr').AsString := Description;
          ParamByName('Description_Reference').AsString := DescriptiveRef;
          ParamByName('Operator').Asinteger := Operator;
          ParamByName('Cust_Order_no').AsString := CustOrderNo;
          ParamByName('Quantity').Asinteger := Quantity;
          ParamByName('Rep').Asinteger := Rep;

          if SubRep = 0 then
            ParamByName('Sub_Rep').clear
          else
            ParamByName('Sub_Rep').Asinteger := SubRep;

          Parambyname('Inactive').asstring := Inactive;
          if ProductionComplete then
            Parambyname('Production_Complete').asstring := 'Y'
          else
            Parambyname('Production_Complete').asstring := 'N';

          Parambyname('Production_Complete_by').asinteger := ProductionCompleteby;

          if InvoiceThisWeek then
            begin
              Parambyname('Invoice_This_Week').asstring := 'Y';
              Parambyname('Invoice_This_Week_Date').asdatetime := date;
              Parambyname('Invoice_This_Week_by').asinteger := InvoiceThisWeekBy;
            end
          else
            begin
              Parambyname('Invoice_This_Week').asstring := 'N';
              Parambyname('Invoice_This_Week_Date').clear;
              Parambyname('Invoice_This_Week_by').clear;
            end;

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

          Parambyname('Enclosing_Type').asstring := EnclosingType;

          if PackFormat = 0 then
            Parambyname('Pack_Format_ID').clear
          else
            Parambyname('Pack_Format_ID').asinteger := PackFormat;

          Parambyname('Ready_for_Invoicing').asstring := ReadyToInvoice;
          Parambyname('Account_Team').asinteger := AccountTeam;
          Parambyname('Operator').AsInteger := frmPBMainMenu.iOperator;
          iTempNarr := Narrative;
          FDataModule.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Narrative').clear
          else
            ParamByName('Narrative').Asinteger := Narrative;
          if OriginalJBOrder = 0 then
            Parambyname('Original_Job_Bag').clear
          else
            Parambyname('Original_Job_Bag').asfloat := OriginalJBOrder;
          if InvoiceLocation = 0 then
            Parambyname('Invoice_Location').clear
          else
            Parambyname('Invoice_Location').asinteger := InvoiceLocation;
          Parambyname('On_Hold').asstring := OnHold;

          if InvoiceBy = 0 then
            Parambyname('Invoiced_By').clear
          else
            Parambyname('Invoiced_By').asinteger := InvoiceBy;
          Parambyname('Invoiced_Date').asdatetime := InvoiceByDate;

          if PriceUnit = 0 then
            ParambyName('Price_Unit').clear
          else
            ParambyName('Price_Unit').asinteger := PriceUnit;

          if ArtRequired then
            begin
              Parambyname('Artwork_Required').asstring := 'Y';
              Parambyname('Artwork_Due_Date').asdatetime := ArtDueDate;
              Parambyname('Artwork_Proof_Date').asdatetime := ArtProofDate;
              Parambyname('Artwork_Approval_Date').asdatetime := ArtProofDate;
            end
          else
            begin
              Parambyname('Artwork_Required').asstring := 'N';
              Parambyname('Artwork_Due_Date').clear;
              Parambyname('Artwork_Proof_Date').clear;
              Parambyname('Artwork_Approval_Date').clear;
            end;

          if DSRequired then
            begin
              Parambyname('Data_Services_Required').asstring := 'Y';
              Parambyname('Data_Required_Date').asdatetime := DataRequiredDate;
              Parambyname('Brief_Required_Date').asdatetime := BriefRequiredDate;
              Parambyname('Text_Required_Date').asdatetime := TextRequiredDate;
              Parambyname('Brief_Available_Date').asdatetime := BriefAvailableDate;
              Parambyname('Text_Available_Date').asdatetime := TextAvailableDate;
              Parambyname('Text_Proof_Date').asdatetime := TextProofDate;
              Parambyname('Proof_Required_Date').asdatetime := ProofRequiredDate;
              Parambyname('Proof_Approval_Date').asdatetime := ProofApprovalDate;
            end
          else
            begin
              Parambyname('Data_Services_Required').asstring := 'N';
              Parambyname('Data_Required_Date').clear;
              Parambyname('Brief_Required_Date').clear;
              Parambyname('Text_Required_Date').clear;
              Parambyname('Brief_Available_Date').clear;
              Parambyname('Text_Available_Date').clear;
              Parambyname('Text_Proof_Date').clear;
              Parambyname('Proof_Required_Date').clear;
              Parambyname('Proof_Approval_Date').clear;
            end;

          if SamplesRequired then
            begin
              Parambyname('Samples_Required').asstring := 'Y';
              Parambyname('Sample_To_Client').asdatetime := SampleToClientDate;
              Parambyname('Sample_Approval').asdatetime := SampleApprovalDate;
            end
          else
            begin
              Parambyname('Samples_Required').asstring := 'N';
              Parambyname('Sample_To_Client').clear;
              Parambyname('Sample_Approval').clear;
            end;

          if FileCopiesReceivedDate = 0 then
            begin
              parambyname('File_Copies_Received_Date').clear;
              parambyname('File_Copies_Received_by').clear;
            end
          else
            begin
              parambyname('File_Copies_Received_Date').asdatetime := FileCopiesReceivedDate;
              parambyname('File_Copies_Received_by').asinteger := FileCopiesReceivedBy;
          end;

          Parambyname('Quote').asfloat := self.DataModule.QuoteNo;
          Parambyname('Job_Bag_Production_Status').asfloat := 0;
          ExecSQL;
        end;
      dmBroker.CreateJobBagDocDirectory(inttostr(dbKey));
    end
  else
  if TempAll then
    begin
      with FDataModule.qryJBUpdHeader do
        begin
          ParamByName('JobBag').AsInteger := DbKey;
          ParamByName('Branch').AsInteger := Branch;
          ParamByName('Customer').AsInteger := Customer;
          Parambyname('Cost_Centre').asstring := CostCentre;
          ParamByName('Contact_no').AsInteger := ContactNo;

          if CashSale then
            ParambyName('Cash_Sales').AsString := 'Y'
          else
            Parambyname('Cash_Sales').asstring := 'N';

          ParamByName('Job_Bag_Status').Asinteger := JBStatus;
          ParamByName('Date').AsDateTime := TUtils.CheckSmallDateTime(Date);
          ParamByName('Goods_Required').AsDateTime := GoodsRequired;
          ParamByName('Date_Start').AsDateTime := StartDate;
          ParamByName('Office_Contact').Asinteger := OfficeContact;
          ParamByName('Description').AsString := Description;
          ParamByName('Description_Reference').AsString := DescriptiveRef;
//          ParamByName('Operator').Asinteger := Operator;
          ParamByName('Cust_Order_no').AsString := CustOrderNo;
          ParamByName('Quantity').Asinteger := Quantity;
          ParamByName('Rep').Asinteger := Rep;

          if SubRep = 0 then
            ParamByName('Sub_Rep').clear
          else
            ParamByName('Sub_Rep').Asinteger := SubRep;

          Parambyname('Inactive').asstring := Inactive;

          if ProductionComplete then
            Parambyname('Production_Complete').asstring := 'Y'
          else
            Parambyname('Production_Complete').asstring := 'N';

          Parambyname('Production_Complete_by').asinteger := ProductionCompleteby;

          if ProductionDate = 0 then
            parambyname('Production_Complete_date').clear
          else
            parambyname('Production_Complete_date').asdatetime := ProductionDate;

          if InvoiceThisWeek then
            Parambyname('Invoice_This_Week').asstring := 'Y'
          else
            Parambyname('Invoice_This_Week').asstring := 'N';

          if InvoiceThisWeekBy = 0 then
            Parambyname('Invoice_This_Week_by').clear
          else
            Parambyname('Invoice_This_Week_by').asinteger := InvoiceThisWeekBy;

          if InvoiceThisWeekDate = 0 then
            parambyname('Invoice_This_Week_Date').clear
          else
            parambyname('Invoice_This_Week_Date').asdatetime := InvoiceThisWeekDate;

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

          Parambyname('Enclosing_Type').asstring := EnclosingType;
          if PackFormat = 0 then
            Parambyname('Pack_Format_ID').clear
          else
            Parambyname('Pack_Format_ID').asinteger := PackFormat;

          Parambyname('Ready_for_Invoicing').asstring := ReadyToInvoice;
          Parambyname('Account_Team').asinteger := AccountTeam;
          iTempNarr := Narrative;
          FDatamodule.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Narrative').clear
          else
            ParamByName('Narrative').Asinteger := Narrative;

          if OriginalJBOrder = 0 then
            Parambyname('Original_Job_Bag').clear
          else
            Parambyname('Original_Job_Bag').asfloat := OriginalJBOrder;
          if InvoiceLocation = 0 then
            Parambyname('Invoice_Location').clear
          else
            Parambyname('Invoice_Location').asinteger := InvoiceLocation;
          Parambyname('On_Hold').asstring := OnHold;

          if InvoiceBy = 0 then
            begin
              Parambyname('Invoiced_By').clear;
              Parambyname('Invoiced_Date').clear;
            end
          else
            begin
              Parambyname('Invoiced_By').asinteger := InvoiceBy;
              Parambyname('Invoiced_Date').asdatetime := InvoiceByDate;
            end;

          if PriceUnit = 0 then
            ParambyName('Price_Unit').clear
          else
            ParambyName('Price_Unit').asinteger := PriceUnit;

          if ArtRequired then
            begin
              Parambyname('Artwork_Required').asstring := 'Y';
              Parambyname('Artwork_Due_Date').asdatetime := ArtDueDate;
              Parambyname('Artwork_Proof_Date').asdatetime := ArtProofDate;
              Parambyname('Artwork_Approval_Date').asdatetime := ArtProofDate;
            end
          else
            begin
              Parambyname('Artwork_Required').asstring := 'N';
              Parambyname('Artwork_Due_Date').clear;
              Parambyname('Artwork_Proof_Date').clear;
              Parambyname('Artwork_Approval_Date').clear;
            end;

          if DSRequired then
            begin
              Parambyname('Data_Services_Required').asstring := 'Y';
              Parambyname('Data_Required_Date').asdatetime := DataRequiredDate;
              Parambyname('Brief_Required_Date').asdatetime := BriefRequiredDate;
              Parambyname('Text_Required_Date').asdatetime := TextRequiredDate;
              Parambyname('Brief_Available_Date').asdatetime := BriefAvailableDate;
              Parambyname('Text_Available_Date').asdatetime := TextAvailableDate;
              Parambyname('Text_Proof_Date').asdatetime := TextProofDate;
              Parambyname('Proof_Required_Date').asdatetime := ProofRequiredDate;
              Parambyname('Proof_Approval_Date').asdatetime := ProofApprovalDate;
            end
          else
            begin
              Parambyname('Data_Services_Required').asstring := 'N';
              Parambyname('Data_Required_Date').clear;
              Parambyname('Brief_Required_Date').clear;
              Parambyname('Text_Required_Date').clear;
              Parambyname('Brief_Available_Date').clear;
              Parambyname('Text_Available_Date').clear;
              Parambyname('Text_Proof_Date').clear;
              Parambyname('Proof_Required_Date').clear;
              Parambyname('Proof_Approval_Date').clear;
            end;

          if SamplesRequired then
            begin
              Parambyname('Samples_Required').asstring := 'Y';
              Parambyname('Sample_To_Client').asdatetime := SampleToClientDate;
              Parambyname('Sample_Approval').asdatetime := SampleApprovalDate;
            end
          else
            begin
              Parambyname('Samples_Required').asstring := 'N';
              Parambyname('Sample_To_Client').clear;
              Parambyname('Sample_Approval').clear;
            end;

          if FileCopiesReceivedDate = 0 then
            begin
              parambyname('File_Copies_Received_Date').clear;
              parambyname('File_Copies_Received_by').clear;
            end
          else
            begin
              parambyname('File_Copies_Received_Date').asdatetime := FileCopiesReceivedDate;
              parambyname('File_Copies_Received_by').asinteger := FileCopiesReceivedBy;
          end;

          Parambyname('Job_Bag_Production_Status').AsInteger := self.GetWOStatus;
          ExecSQL;
        end;
    end;
  SaveLines;
  if bnewJob then
    SaveRepeatWorks
  else
    SaveWorks;
  SaveDeliveries;
  SaveDocuments;
  SaveProcesses;
  SaveSupplies;
  SaveSchedules;
  SaveRequests;
  SaveStatus;
  SaveNonConformDocs;
  SaveDepartments;
  SaveQuoteStatus;
  SaveCustomerContactStatus;
end;

function TJobBag.GetNextJobBagNumber: integer;
begin
  FDataModule.LockCompanyRecord;
  try
    try
      with FDataModule.GetLastJBSQL do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Job_Bag_Number').AsInteger + 1;
        Close;
      end;
      with FDataModule.UpdLastJBSQL do
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
    FDataModule.FreeCompanyRecord;
  end;
end;

function TJobBag.GetNextJBNonConformNo: integer;
begin
  FDataModule.LockCompanyRecord;
  try
    try
      with FDataModule.qryGetLastNC do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Non_Conform_Number').AsInteger + 1;
        Close;
      end;
      with FDataModule.qryUpdateLastNC do
      begin
        ParamByName('Last_Non_Conform_Number').Asinteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Non Conformance number:' + #13 + E.Message);
    end;
    end;
  finally
    FDataModule.FreeCompanyRecord;
  end;
end;

procedure TJobBag.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TJobBag.SetBranchName(const Value: string);
begin
  FBranchName := Value;
end;

procedure TJobBag.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TJobBag.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TJobBag.SetDate(const Value: TDateTime);
begin
  FDate := Value;
end;

procedure TJobBag.SetDbKey(const Value: integer);
begin
  FDbKey := Value;
end;

procedure TJobBag.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TJobBag.SetJBOrder(const Value: TJBOrder);
begin
  FJBOrder := Value;
end;

procedure TJobBag.SetContactNo(const Value: integer);
begin
  FContactNo := Value;
end;

procedure TJobBag.SetCustOrderNo(const Value: string);
begin
  FCustOrderNo := Value;
end;

procedure TJobBag.SetDepth(const Value: real);
begin
  FDepth := Value;
end;

procedure TJobBag.SetDepthUnit(const Value: string);
begin
  FDepthUnit := Value;
end;

procedure TJobBag.SetFormReference(const Value: integer);
begin
  FFormReference := Value;
end;

procedure TJobBag.SetFormsPerBox(const Value: string);
begin
  FFormsPerBox := Value;
end;

procedure TJobBag.SetGoodsRequired(const Value: TDateTime);
begin
  FGoodsRequired := Value;
end;

procedure TJobBag.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TJobBag.SetInactiveDate(const Value: TDateTime);
begin
  FInactiveDate := Value;
end;

procedure TJobBag.SetInactiveReason(const Value: integer);
begin
  FInactiveReason := Value;
end;

procedure TJobBag.SetInvoiceUpfront(const Value: string);
begin
  FInvoiceUpfront := Value;
end;

procedure TJobBag.SetJBArtwork(const Value: integer);
begin
  FJBArtwork := Value;
end;

procedure TJobBag.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TJobBag.SetNoOfParts(const Value: integer);
begin
  FNoOfParts := Value;
end;

procedure TJobBag.SetNoofSets(const Value: string);
begin
  FNoofSets := Value;
end;

procedure TJobBag.SetNumberInstructions(const Value: string);
begin
  FNumberInstructions := Value;
end;

procedure TJobBag.SetOnHold(const Value: string);
begin
  FOnHold := Value;
end;

procedure TJobBag.SetOriginalJBOrder(const Value: real);
begin
  FOriginalJBOrder := Value;
end;

procedure TJobBag.SetProductType(const Value: integer);
begin
  FProductType := Value;
end;

procedure TJobBag.SetProofDate(const Value: TDateTime);
begin
  FProofDate := Value;
end;

procedure TJobBag.SetProofRequired(const Value: string);
begin
  FProofRequired := Value;
end;

procedure TJobBag.SetProofRevision(const Value: string);
begin
  FProofRevision := Value;
end;

procedure TJobBag.SetQtyInvoiced(const Value: integer);
begin
  FQtyInvoiced := Value;
end;

procedure TJobBag.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TJobBag.SetRep(const Value: integer);
begin
  FRep := Value;
end;

procedure TJobBag.SetSellingPrice(const Value: currency);
begin
  FSellingPrice := Value;
end;

procedure TJobBag.SetSellUnit(const Value: integer);
begin
  FSellUnit := Value;
end;

procedure TJobBag.SetWidth(const Value: real);
begin
  FWidth := Value;
end;

procedure TJobBag.SetWidthUnit(const Value: string);
begin
  FWidthUnit := Value;
end;

procedure TJobBag.SetOfficeContact(const Value: integer);
begin
  FOfficeContact := Value;
end;

procedure TJobBag.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TJobBag.SetDefaultVatCode(const Value: integer);
begin
  FDefaultVatCode := Value;
end;

function TJobBag.GetJBStatus: integer;
var
  i, iComplete, iInvoiced, iNotInvoiced, iStockNotReconciled: integer;
  iPOrders, iCosts, iStockReq, iStockReqNew: integer;
begin
  {If this job hasn't been approved yet then keep the status the same and exit}
  if Status = 5 then
    begin
      Result := 5;
      exit;
    end;

  iInvoiced := 0;
  iComplete := 0;
  iNotInvoiced := 0;
  iPOrders := 0;
  iCosts := 0;
  iStockReq := 0;
  iStockReqNew := 0;
  iStockNotReconciled := 0;

  for i := 0 to pred(FJobBagLines.count) do
  begin
    if FJobBagLines.items[i].JBLineType = 'A' then
      inc(iCosts)
    else
    if FJobBagLines.items[i].JBLineType = 'P' then
      inc(iPOrders)
    else
    if FJobBagLines.items[i].JBLineType = 'S' then
      inc(iStockReq);

    if FJobBagLines.items[i].JBLineInactive then
      continue;
    if FJobBagLines.items[i].JBLineInvoiced = 'Y' then
      inc(iInvoiced)
    else
    if FJobBagLines.items[i].JBLineInvoiced = 'C' then
      inc(iComplete)
    else
    begin
      if FJobBagLines.items[i].JBLineInvoiced = 'P' then
      begin
        inc(iInvoiced);
        inc(iNotInvoiced);
      end
      else
      begin
        //this line hasn't been invoiced and if it has zero selling price
        //and the other job bag lines have been invoiced seperately then
        //it could get left as uninvoiced indefinately,
        //this can stop the JB status getting to fully invoiced
        //so only count it as not invoiced if it has a selling price
        if FJobBagLines.Items[i].FJBLineSell <> 0 then
        begin
          inc(iNotInvoiced);
        end
        else
        if (FJobBagLines.Items[i].FJBLineSell = 0) and (FJobBagLines.items[i].JBLineType = 'S') and
           (FJobBagLines.Items[i].GetSOLineStatus(FJobBagLines.items[i].SONumber, FJobBagLines.items[i].SOLineNo) = 'N') then
        begin
          inc(iNotInvoiced);
        end;
      end;
    end;
  end;

  for i := 0 to pred(FJobBagRequests.count) do
  begin
    inc(iStockReqNew);
    if (FJobBagRequests.items[i].Status <= 200) and
      not (FJobBagRequests.items[i].IncludedCharge) then
        inc(iStockNotReconciled);
  end;

  if (iInvoiced = 0) then
    begin
      if (iStockReq > 0) or (iStockReqNew > 0) then
        Result := 20
      else
      if iPOrders > 0 then
        Result := 12
      else
      if iCosts > 0 then
        result := 11
      else
        Result := 10
    end
  else
  if (iInvoiced > 0) and (iNotInvoiced > 0) then
    begin
      if (iStockReq > 0) or (iStockReqNew > 0) then
        Result := 24
      else
      if iPOrders > 0 then
        Result := 23
      else
        Result := 25
    end
  else
  if (iInvoiced > 0) and (iNotInvoiced = 0) and (iStockNotReconciled > 0) then
    Result := 24
  else
    Result := 30;
end;

function TJobBag.GetJBPurchInvoiced: byteBool;
var
  i: integer;
begin
  result := false;
  for i := 0 to pred(FJobBagLines.count) do
    if FJobBagLines.items[i].JBLinePurchInvd then
      result := true
end;

procedure TJobBag.SetReadyToInvoice(const Value: string);
begin
  FReadyToInvoice := Value;
end;

procedure TJobBag.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TJobBag.SetAccountManagerName(const Value: string);
begin
  FAccountManagerName := Value;
end;

procedure TJobBag.SetAccountTeam(const Value: integer);
begin
  FAccountTeam := Value;
end;

procedure TJobBag.SetDescriptiveRef(const Value: string);
begin
  FDescriptiveRef := Value;
end;

function TJobBag.GetOKtoInvoice: bytebool;
var
  i, iCanInvoice, iStatus: integer;
begin
  result := true;
  iCanInvoice := 0;
  for i := 0 to pred(Lines.Count) do
    begin
      iStatus := 0;
      if Lines[i].PurchaseOrder <> 0 then
        begin
          with DataModule.qryPO do
            begin
              close;
              parambyname('Purchase_Order').asfloat := Lines[i].PurchaseOrder;
              parambyname('Line').asinteger := Lines[i].Line;
              open;
              iStatus := fieldbyname('Purch_ord_line_status').asinteger;
              if (iStatus > 20) and (not Lines[i].JBLineInactive) then
                iCanInvoice := iCanInvoice + 1;
            end;
        end
      else
      if Lines[i].SONumber <> 0 then
        begin
          with DataModule.qrySO do
            begin
              close;
              parambyname('Sales_Order').asfloat := Lines[i].SONumber;
              open;
              iStatus := fieldbyname('sales_order_head_status').asinteger;
              if (iStatus >= 150) and (not Lines[i].JBLineInactive) then
                iCanInvoice := iCanInvoice + 1;
            end;
        end
      else
      if Lines[i].WONumber <> 0 then
        begin
          with DataModule.qryWO do
            begin
              close;
              parambyname('Works_Order').asfloat := Lines[i].WONumber;
              open;
              iStatus := fieldbyname('Works_Order_Status').asinteger;
              if (iStatus >= 10) and (not Lines[i].JBLineInactive) then
                iCanInvoice := iCanInvoice + 1;
            end;
        end
      else
        iCanInvoice := iCanInvoice + 1;
    end;
    Result := (iCanInvoice > 0);
end;

procedure TJobBag.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TJobBag.SetJBMode(const Value: TJBMode);
begin
  FJBMode := Value;
end;

procedure TJobBag.LoadWorks;
var
  aWOrder : TJobBagWOrder;
begin
  FJobBagWOrders.Clear;
  with FDataModule.qryJBAllWorks do
  begin
    Close;
    ParamByName('Job_Bag').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aWOrder := TJobBagWOrder.Create(Self);
      aWOrder.JBWorksOrderNo := FieldByName('Works_Order_No').AsInteger;
      aWOrder.WorksOrder := FieldByName('Works_Order').asinteger;
      aWOrder.WorksOrderNumber := FieldByName('Works_Order_Number').asfloat;
      aWOrder.Description := FieldByName('Description').asstring;
      aWOrder.WODate := FieldByName('Date_Point').asdatetime;
      aWOrder.MailDate := FieldByName('Date_Required').asdatetime;
      aWOrder.StartDate := FieldByName('Date_Start').asdatetime;
      aWOrder.Quantity := FieldByName('Actual_Quantity').asinteger;
      aWOrder.Status := Fieldbyname('Works_Order_Status').asinteger;
      aWOrder.StatusDescription := FieldByName('Status_Description').asstring;
      FJobBagWOrders.Add(aWOrder);
      Next;
    end;
    Close;
  end;
end;

procedure TJobBag.LoadDocuments;
var
  aDocument : TJobBagDoc;
  icount: integer;
begin
  FJobBagDocs.Clear;
  icount := 0;
  with FDataModule.qryJBAllDocuments do
  begin
    Close;
    ParamByName('Job_Bag').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      icount := icount + 1;
      aDocument := TJobBagDoc.Create(Self);
      aDocument.JBDocumentNo := icount;
      aDocument.DocumentPath := FieldByName('Document').Asstring;
      aDocument.DocumentTitle := FieldByName('Document_Title').Asstring;
      if FieldByName('Date_Created').Asdatetime = 0 then
        aDocument.DocumentDate := pbdatestr('01/01/2000')
      else
        aDocument.DocumentDate := FieldByName('Date_Created').Asdatetime;
      aDocument.Operator := FieldByName('Operator').Asinteger;
      aDocument.OperatorName := FieldByName('Operator_Name').Asstring;
      aDocument.Createdby := FieldByName('Created_By').Asstring;
      FJobBagDocs.Add(aDocument);
      Next;
    end;
    Close;
  end;
end;

procedure TJobBag.LoadRequests;
var
  aRequest : TJobBagRequest;
begin
  FJobBagRequests.Clear;
  with FDataModule.qryJBAllRequests do
  begin
    Close;
    ParamByName('Job_Bag').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aRequest := TJobBagRequest.Create(Self);
      aRequest.CostPackQty := fieldbyname('Purch_pack_Quantity').asinteger;
      aRequest.CostPrice := fieldbyname('Part_Cost').asfloat;
      aRequest.IncludedCharge := (fieldbyname('Included_in_Charges').asString = 'Y');
      aRequest.JBRequestNo := FieldByName('Request_No').AsInteger;
      aRequest.SalesOrder := FieldByName('Sales_Order').Asinteger;
      aRequest.SalesOrderLine := FieldByName('Sales_Order_Line_no').Asinteger;
      aRequest.DateRequested := fieldbyname('Date_Ordered').asdatetime;
      aRequest.SellPackQty := fieldbyname('Sell_Pack_Quantity').asinteger;
      aRequest.SellPrice := fieldbyname('Part_Sales_Price').asfloat;
      aRequest.Status := fieldbyname('Sales_Order_Head_Status').asinteger;
      aRequest.StatusDescr := fieldbyname('Status_Description').asString;
      aRequest.QtyInvoiced := fieldbyname('Quantity_Invoiced').asinteger;
      aRequest.QtyDespatched := fieldbyname('Quantity_delivered').asinteger;
      aRequest.QtyOrdered := fieldbyname('Quantity_Ordered').asinteger;
      aRequest.PartCode := fieldbyname('Part').asstring;
      aRequest.PartDescription := fieldbyname('Part_Description').asstring;
      aRequest.ToInvoice  := (fieldbyname('Quantity_delivered').asinteger > 0) and
                       (fieldbyname('Quantity_invoiced').asinteger = 0);
      aRequest.VatCode := fieldbyname('Vat_Code').asinteger;
      FJobBagRequests.Add(aRequest);
      Next;
    end;
    Close;
  end;
end;

procedure TJobBag.LoadRepeatWorks;
var
  aWOrder : TJobBagWOrder;
begin
  FJobBagWOrders.Clear;
  with FDataModule.qryJBAllWorks do
  begin
    Close;
    ParamByName('Job_Bag').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aWOrder := TJobBagWOrder.Create(Self);
      aWOrder.JBWorksOrderNo := FieldByName('Works_Order_No').AsInteger;
      aWOrder.OriginalWIN := FieldByName('Works_Order').AsInteger;
      aWOrder.PreviousWIN := FieldByName('Works_Order_Number').Asfloat;
      aWOrder.WorksOrder := 0;
      aWOrder.WorksOrderNumber := 0;
      aWOrder.Description := FieldByName('Description').asstring;
      aWOrder.WODate := now;
      aWOrder.Quantity := FieldByName('Actual_Quantity').asinteger;
      FJobBagWOrders.Add(aWOrder);
      Next;
    end;
    Close;
  end;
end;

function TJobBag.GetJBHasBeenInvoiced: boolean;
begin
  with FDataModule.qryCheckJBInvoiced do
    begin
      close;
      parambyname('Job_Bag').asinteger := dbkey;
      open;
      result := (recordcount > 0);
    end;
end;

procedure TJobBag.SetInvoiceLocation(const Value: integer);
begin
  FInvoiceLocation := Value;
end;

procedure TJobBag.SetArtDueDate(const Value: TDateTime);
begin
  FArtDueDate := Value;
end;

procedure TJobBag.SetArtProofDate(const Value: TDateTime);
begin
  FArtProofDate := Value;
end;

procedure TJobBag.SetArtRequired(const Value: boolean);
begin
  FArtRequired := Value;
end;

procedure TJobBag.SetBriefAvailableDate(const Value: TDateTime);
begin
  FBriefAvailableDate := Value;
end;

procedure TJobBag.SetBriefRequiredDate(const Value: TDateTime);
begin
  FBriefRequiredDate := Value;
end;

procedure TJobBag.SetDataRequiredDate(const Value: TDateTime);
begin
  FDataRequiredDate := Value;
end;

procedure TJobBag.SetDSRequired(const Value: boolean);
begin
  FDSRequired := Value;
end;

procedure TJobBag.SetProofApprovalDate(const Value: TDateTime);
begin
  FProofApprovalDate := Value;
end;

procedure TJobBag.SetProofRequiredDate(const Value: TDateTime);
begin
  FProofRequiredDate := Value;
end;

procedure TJobBag.SetSampleApprovalDate(const Value: TDateTime);
begin
  FSampleApprovalDate := Value;
end;

procedure TJobBag.SetSamplesRequired(const Value: boolean);
begin
  FSamplesRequired := Value;
end;

procedure TJobBag.SetSampleToClientDate(const Value: TDateTime);
begin
  FSampleToClientDate := Value;
end;

procedure TJobBag.SetScheduleApproved(const Value:  boolean);
begin
  FScheduleApproved := Value;
end;

procedure TJobBag.SetTextAvailableDate(const Value: TDateTime);
begin
  FTextAvailableDate := Value;
end;

procedure TJobBag.SetTextProofDate(const Value: TDateTime);
begin
  FTextProofDate := Value;
end;

procedure TJobBag.SetTextRequiredDate(const Value: TDateTime);
begin
  FTextRequiredDate := Value;
end;

procedure TJobBag.SetArtApprovalDate(const Value: TDateTime);
begin
  FArtApprovalDate := Value;
end;

procedure TJobBag.LoadProcesses;
var
  aProcess : TJobBagProcess;
  icount: integer;
begin
  icount := 0;
  FJobBagProcesses.Clear;
  with FDataModule.qryAllProcesses do
  begin
    Close;
//    ParamByName('Job_Bag').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aProcess := TJobBagProcess.Create(Self);
//      aProcess.JBProcessNo := FieldByName('Process_No').AsInteger;
      icount := icount + 1;
      aProcess.JBProcessNo := icount;
      aProcess.Process := fieldbyName('Process').AsInteger;
      aProcess.ProcessName := fieldbyName('Process_Description').Asstring;

      aProcess.ProcessGroup := fieldbyname('Process_Group').asinteger;
      aProcess.ProcessGroupName := fieldbyname('Process_Group_Description').asstring;

      if jbmode = jbAdd then
        aProcess.IsUsed := (fieldbyname('Use_as_default').asstring = 'Y')
      else
        begin
          FDataModule.qryJBProcess.Close;
          FDataModule.qryJBProcess.parambyname('Job_Bag').asinteger := dbKey;
          FDataModule.qryJBProcess.parambyname('Process').asinteger := aProcess.Process;
          FDataModule.qryJBProcess.open;

          aProcess.IsUsed := (FDataModule.qryJBProcess.recordcount > 0);
        end;
(*      aProcess.PaperDepth := fieldbyname('Paper_depth_mm').asinteger;
      aProcess.PaperWidth := fieldbyname('Paper_Width_mm').asinteger;

      aProcess.PaperSize := fieldByName('Paper_Size').AsInteger;
      aProcess.PaperSizeDescription := fieldByName('Paper_Size_Description').AsString;
      aProcess.WorkCentreGroup := fieldByName('Work_Centre_Group').Asinteger;
      aProcess.WorkCentreGroupName := fieldByName('Work_Centre_Group_Name').Asstring;
      aProcess.NoOfElements := fieldByName('No_of_Elements').asinteger;
      aProcess.Quantity := fieldbyname('Quantity').asfloat;
      aProcess.NoOfHours := fieldbyname('No_of_hours').asfloat;
      aProcess.SimplexDuplex := fieldbyname('Simplex_or_Duplex').asstring;
*)
      FJobBagProcesses.Add(aProcess);
      Next;
    end;
    Close;
  end;
end;

procedure TJobBag.LoadSchedules;
var
  aSchedule : TJobBagSched;
begin
  FJobBagScheds.Clear;
  with FDataModule.qryJBAllSchedules do
  begin
    Close;
    ParamByName('Job_Bag').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aSchedule := TJobBagSched.Create(Self);
      aSchedule.JBScheduleNo := FieldByName('Schedule_No').AsInteger;
      aSchedule.ScheduleDate := Fieldbyname('Date_Point').asdatetime;
      aSchedule.ApprovalType := Fieldbyname('Schedule_Approval_Type').asstring;
      aSchedule.Narrative := Fieldbyname('Narrative').asinteger;
      aSchedule.NarrativeText := FDataModule.GetNarrative(aSchedule.Narrative);
      aSchedule.Operator := Fieldbyname('Operator').asinteger;
      aSchedule.OperatorName := Fieldbyname('Operator_Name').asstring;
      aSchedule.ScheduleDate := Fieldbyname('Date_Point').asdatetime;
      aSchedule.ArtRequired  :=        (Fieldbyname('Artwork_Required').asstring = 'Y');
      aSchedule.ArtDueDate :=           Fieldbyname('Artwork_Due_Date').asdatetime;
      aSchedule.ArtProofDate :=         Fieldbyname('Artwork_Proof_Date').asdatetime;
      aSchedule.ArtApprovalDate :=         Fieldbyname('Artwork_Approval_Date').asdatetime;
      aSchedule.DSRequired :=           (Fieldbyname('Data_Services_Required').asstring = 'Y');
      aSchedule.DataRequiredDate :=     Fieldbyname('Data_Required_Date').asdatetime;
      aSchedule.BriefRequiredDate  :=   Fieldbyname('Brief_Required_Date').asdatetime;
      aSchedule.TextRequiredDate :=     Fieldbyname('Text_Required_Date').asdatetime;
      aSchedule.BriefAvailableDate :=   Fieldbyname('Brief_Available_Date').asdatetime;
      aSchedule.DataAvailableDate :=    Fieldbyname('Data_Available_Date').asdatetime;
      aSchedule.TextAvailableDate  :=   Fieldbyname('Text_Available_Date').asdatetime;
      aSchedule.TextProofDate  :=       Fieldbyname('Text_Proof_Date').asdatetime;

      aSchedule.PDFProofArtworkDate  :=   Fieldbyname('PDF_Proof_Artwork_Date').asdatetime;
      aSchedule.PDFProofRequiredDate  :=   Fieldbyname('PDF_Proof_Required_Date').asdatetime;
      aSchedule.PDFProofApprovalDate  :=   Fieldbyname('PDF_Proof_Approval_Date').asdatetime;

      aSchedule.ProofRequiredDate  :=   Fieldbyname('Proof_Required_Date').asdatetime;
      aSchedule.ProofApprovalDate  :=   Fieldbyname('Proof_Approval_Date').asdatetime;

      aSchedule.SamplesRequired  :=     (Fieldbyname('Samples_Required').asstring = 'Y');
      aSchedule.SampleToClientDate :=   Fieldbyname('Sample_To_Client').asdatetime;
      aSchedule.SampleApprovalDate :=   Fieldbyname('Sample_Approval').asdatetime;
      aSchedule.ScheduleApproved :=     (Fieldbyname('Schedule_Approved').asstring = 'Y');

      aSchedule.ArtDueDateAct :=           Fieldbyname('Artwork_Due_Date_Act').asdatetime;
      aSchedule.ArtProofDateAct :=         Fieldbyname('Artwork_Proof_Date_Act').asdatetime;
      aSchedule.ArtApprovalDateAct :=      Fieldbyname('Artwork_Approval_Date_Act').asdatetime;
      aSchedule.DataRequiredDateAct :=     Fieldbyname('Data_Required_Date_Act').asdatetime;
      aSchedule.BriefRequiredDateAct  :=   Fieldbyname('Brief_Required_Date_Act').asdatetime;
      aSchedule.TextRequiredDateAct :=     Fieldbyname('Text_Required_Date_Act').asdatetime;

      aSchedule.BriefAvailableDateAct :=   Fieldbyname('Brief_Available_Date_Act').asdatetime;
      aSchedule.DataAvailableDateAct  :=   Fieldbyname('Data_Available_Date_Act').asdatetime;
      aSchedule.TextAvailableDateAct  :=   Fieldbyname('Text_Available_Date_Act').asdatetime;

      aSchedule.TextProofDateAct  :=       Fieldbyname('Text_Proof_Date_Act').asdatetime;

      aSchedule.PDFProofArtworkDateAct  :=   Fieldbyname('PDF_Proof_Artwork_Date_Act').asdatetime;
      aSchedule.PDFProofApprovalDateAct  :=   Fieldbyname('PDF_Proof_Approval_Date_Act').asdatetime;
      aSchedule.PDFProofRequiredDateAct  :=   Fieldbyname('PDF_Proof_Required_Date_Act').asdatetime;

      aSchedule.ProofRequiredDateAct  :=   Fieldbyname('Proof_Required_Date_Act').asdatetime;
      aSchedule.ProofApprovalDateAct  :=   Fieldbyname('Proof_Approval_Date_Act').asdatetime;
      aSchedule.SampleToClientDateAct :=   Fieldbyname('Sample_To_Client_Act').asdatetime;
      aSchedule.SampleApprovalDateAct :=   Fieldbyname('Sample_Approval_Act').asdatetime;

      FJobBagScheds.Add(aSchedule);
      Next;
    end;
    Close;
  end;
end;

procedure TJobBag.SetProofByMethod(const Value: string);
begin
  FProofByMethod := Value;
end;

procedure TJobBag.SetStartDate(const Value: TDateTime);
begin
  FStartDate := Value;
end;

function TJobBag.GetReconcileStock: boolean;
var
  i: integer;
begin
  result := false;
  for i := 0 to pred(FJobBagRequests.count) do
    if (FJobBagRequests[i].Status <= 200) and not FJobBagRequests[i].IncludedCharge then
      begin
        result := true;
        exit;
      end;
end;

procedure TJobBag.LoadFromQuote;
begin
  Clear;
  with FDataModule.qryQHeader do
  begin
    Close;
    ParamByName('Quote').Asfloat := FDataModule.QuoteNo;
    Open;

    OfficeContact :=  FieldByName('Office_Contact').Asinteger;
    AccountManagerName :=
                      FieldByName('Office_Contact_Name').asstring;
    AccountTeam :=    FDataModule.GetOpAccountTeam(OfficeContact);
    AcquiredCustomer := (Fieldbyname('Customer_is_Acquired').asstring = 'Y');

    Branch :=         FieldByName('Branch_No').AsInteger;
    BranchName :=     FieldByName('Branch_Name').AsString;
    Customer :=       FieldByName('Customer').AsInteger;
    CustomerName :=   FieldByName('Cust_Name').AsString;
    ContactNo :=      FieldByName('Contact_no').Asinteger;
    Date :=           now;
    Description :=    FieldByName('Description').AsString;
    DescriptiveRef := FieldByName('Descriptive_Reference').AsString;
    EnclosingType := FieldByName('Enclosing_Type').AsString;
    EndUserCustomer :=  FieldByName('End_User_Customer').AsInteger;
    EndUserCustomerName := FieldByName('End_User_Customer_Name').Asstring;
    EndUserBranch :=  FieldByName('End_User_Branch_No').AsInteger;

    GoodsRequired :=  FieldByName('Date_Required').AsDateTime;
    Quantity :=       FieldByName('Quantity').Asinteger;
    CustOrderNo :=    '';

    PackFormat :=     Fieldbyname('Pack_Format_ID').asinteger;
    PriceUnit :=      Fieldbyname('Price_Unit').asinteger;

    Rep :=            FieldbyName('Rep').asinteger;
    SubRep :=         FieldbyName('Sub_Rep').asinteger;

(*    Narrative :=      FieldByName('Narrative').AsInteger;
    NarrativeText :=  FDataModule.GetNarrative(Narrative);
*)
    Narrative :=      0;
    NarrativeText :=  '';

    ReadyToInvoice := 'N';
    inactive :=     'N';

    StartDate :=  fieldbyname('Date_Start').asdatetime;

    Operator :=       frmPBMainMenu.iOperator;
    OperatorName :=   frmPBMainMenu.sOperator_Name;
    OriginalJBOrder := 0;
    OnHold :=         'N';

    Close;
  end;
  LoadQuoteLines;
  LoadQuoteSupplies;
  LoadQuoteDepartments;
end;

procedure TJobBag.LoadQuoteLines;
var
  aLine : TJobBagLine;
  icount: integer;
begin
  icount := 0;
  FJobBagLines.Clear;
  with FDataModule.qryQAllLines do
  begin
    Close;
    ParamByName('Quote').Asfloat := FDataModule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      inc(icount);
      aLine := TJobBagLine.Create(Self);
      aLine.CurrencyCode := 0;
      aLine.JBLine := icount;
      aLine.JBLineType := 'A';
      aLine.PurchaseOrder := 0;
      aLine.Line := 0;
      aLine.Supplier:= dmBroker.GetCompanySupplier;
      aLine.BranchNo := dmBroker.GetCompanySupplierBranch;
      aLine.SupplierName:= FDatamodule.GetSupplierName(aLine.Supplier);
      aLine.BranchName := '';
      aLine.JBLineDescr := FieldByName('Quote_Line_Description').AsString;
      aLine.JBLineInactive := false;
      aLine.SONumber := 0;
      aLine.SOLineNo := 0;

      aLine.Quote := fieldbyname('Quote').asfloat;
      aLine.QuoteLineNo := fieldbyname('Quote_Line_no').asinteger;

      aLine.JBLineInvoiced := 'N';

      aLine.JBQtyInvoiced := 0;
      aLine.JBLinePurchInvd := false;
      aLine.JBQuantity := FieldByName('Quantity').AsInteger;
      aLine.ProductType := FieldByName('Product_Type').AsInteger;
      if FieldByName('Vat_Code').AsInteger = -1 then
        aLine.VATCode := FDataModule.GetCustomerDefVAT(aLine.Parent.Customer)
      else
        aLine.VATCode := fieldbyname('Vat_Code').asinteger;
      aLine.WONumber := 0;
      aLine.WorksOrderNumber := 0;
      aLine.Process := 0;
      aLine.PriceUnit := Fieldbyname('Price_Unit').asinteger;
      aLine.ResellerPrice := Fieldbyname('Reseller_Price').asinteger;
      aLine.SuggPrice := Fieldbyname('Unit_SSP').asfloat;
      aLine.SSPOrig := Fieldbyname('Unit_SSP_Original').asfloat;
      aLine.SellPrice := Fieldbyname('Unit_Price').asfloat;
      aLine.JBLineSell := FDatamodule.CalculatePrice(aLine.PriceUnit,aLine.JBQuantity,aLine.SellPrice);
      aLine.JBLineReseller := FDatamodule.CalculatePrice(aLine.PriceUnit,aLine.JBQuantity,aLine.ResellerPrice);

      if dmBroker.UseJobBagCosts then
        begin
          aLine.CostPrice := Fieldbyname('Unit_Cost').asfloat;
          aLine.CostPriceOHD := Fieldbyname('Unit_Cost_plus_OHD').asfloat;
          aLine.JBLineCost := FDatamodule.CalculatePrice(aLine.PriceUnit,aLine.JBQuantity,aLine.CostPrice);
        end
      else
        begin
          aLine.JBLineCost := 0.00;
          aLine.CostPrice := 0.00;
          aLine.CostPriceOHD := 0.00;
        end;

      aLine.JBLineMode := 'A';
      aLine.JBLineStatus := 10;
      aLine.JBLineStatusText := FDataModule.GetSundryStatus(dbKey, aLine.JBLine, aLine.JBLineInvoiced);

      aLine.Sequence := icount;
      aLine.JustMoved := false;
      aLine.ReadyToInvoice := 'N';
      aLine.ClearedFundsReq := false;
      aLine.ClearedFundsRec := false;
      aLine.NeedsAuthorising := false;

      aLine.InternalCostLine := (fieldbyname('Line_Is_Internal_Cost').asstring = 'Y');
      aLine.InternalCostMarkupPercentage := fieldbyname('Quote_Cost_Markup_Perc').asfloat;

      FJobBagLines.Add(aLine);
      next
    end;
  end;
end;

procedure TJobBag.InsertQuoteLines;
var
  aLine : TJobBagLine;
  iSequence, iLineNo: integer;
begin
  iSequence := FJobBagLines.count;
  iLineNo := FJobBagLines.GetMaxLineNo;
  with FDataModule.qryQAllLines do
  begin
    Close;
    ParamByName('Quote').Asfloat := FDataModule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      inc(iLineNo);
      inc(iSequence);
      aLine := TJobBagLine.Create(Self);
      aLine.CurrencyCode := 0;
      aLine.JBLine := iLineNo;
      aLine.JBLineType := 'A';
      aLine.PurchaseOrder := 0;
      aLine.Line := 0;
      aLine.Supplier:= dmBroker.GetCompanySupplier;
      aLine.BranchNo := dmBroker.GetCompanySupplierBranch;
      aLine.SupplierName:= FDatamodule.GetSupplierName(aLine.Supplier);
      aLine.BranchName := '';
      aLine.JBLineDescr := FieldByName('Quote_Line_Description').AsString;
      aLine.JBLineInactive := false;
      aLine.SONumber := 0;
      aLine.SOLineNo := 0;

      aLine.Quote := fieldbyname('Quote').asfloat;
      aLine.QuoteLineNo := fieldbyname('Quote_Line_no').asinteger;

      aLine.JBLineInvoiced := 'N';

      aLine.JBQtyInvoiced := 0;
      aLine.JBLinePurchInvd := false;
      aLine.JBQuantity := FieldByName('Quantity').AsInteger;
      aLine.ProductType := FieldByName('Product_Type').AsInteger;
      aLine.VATCode := FDataModule.GetCustomerDefVAT(aLine.Parent.Customer);
      aLine.WONumber := 0;
      aLine.WorksOrderNumber := 0;
      aLine.Process := 0;
      aLine.PriceUnit := Fieldbyname('Price_Unit').asinteger;
      aLine.SuggPrice := Fieldbyname('Unit_SSP').asfloat;
      aLine.SSPOrig := Fieldbyname('Unit_SSP_Original').asfloat;
      aLine.SellPrice := Fieldbyname('Unit_Price').asfloat;
      aLine.JBLineSell := FDatamodule.CalculatePrice(aLine.PriceUnit,aLine.JBQuantity,aLine.SellPrice);

      if dmBroker.UseJobBagCosts then
        begin
          aLine.CostPrice := Fieldbyname('Unit_Cost').asfloat;
          aLine.CostPriceOHD := Fieldbyname('Unit_Cost_plus_OHD').asfloat;
          aLine.JBLineCost := FDatamodule.CalculatePrice(aLine.PriceUnit,aLine.JBQuantity,aLine.CostPrice);
        end
      else
        begin
          aLine.JBLineCost := 0.00;
          aLine.CostPrice := 0.00;
          aLine.CostPriceOHD := 0.00;
        end;

      aLine.JBLineMode := 'A';
      aLine.JBLineStatus := 10;
      aLine.JBLineStatusText := FDataModule.GetSundryStatus(dbKey, aLine.JBLine, aLine.JBLineInvoiced);

      aLine.Sequence := iSequence;
      aLine.JustMoved := false;
      aLine.ReadyToInvoice := 'N';
      aLine.ClearedFundsReq := false;
      aLine.ClearedFundsRec := false;
      aLine.NeedsAuthorising := false;
      FJobBagLines.Add(aLine);
      next
    end;
  end;
end;

procedure TJobBag.LoadQuoteSupplies;
var
  aSupply : TJobBagSupply;
  icount: integer;
begin
  icount := 0;
  FJobBagSupplies.Clear;
  with FDataModule.qryQAllSupplies do
  begin
    Close;
    ParamByName('Quote').Asfloat := FDataModule.QuoteNo;
    Open;
    while not(EOF) do
    begin
      inc(icount);
      aSupply := TJobBagSupply.Create(Self);
      aSupply.JBSupplyNo := icount;
      aSupply.Description := fieldbyname('Form_Description').asstring;
      aSupply.Enquiry := fieldbyname('Enquiry').asinteger;
      aSupply.EnquiryLine := fieldbyname('Line').asinteger;
      aSupply.LineConverted := fieldbyname('Line_Converted').asstring;
      aSupply.Quantity := fieldbyname('Quantity').asinteger;
      aSupply.UnitCost := fieldbyname('Supplier_Price').asfloat;
      aSupply.UnitSell := fieldbyname('Quotation_Price').asfloat;
      aSupply.PriceUnit := fieldbyname('Price_Unit').asinteger;
      aSupply.PriceUnitFactor := fieldbyname('Price_Unit_Factor').asinteger;
      aSupply.PriceUnitDesc := fieldbyname('Price_Unit_Description').asstring;
      aSupply.ProductType := fieldbyname('Product_Type').asinteger;
      aSupply.ProductTypeDesc := fieldbyname('Product_Type_Description').asstring;
      FJobBagSupplies.Add(aSupply);
      next
    end;
  end;
end;

procedure TJobBag.SetInvoiceBy(const Value: integer);
begin
  FInvoiceBy := Value;
end;

procedure TJobBag.SetInvoiceByName(const Value: string);
begin
  FInvoiceByName := Value;
end;

procedure TJobBag.SetInvoiceByDate(const Value: TDateTime);
begin
  FInvoiceByDate := Value;
end;

procedure TJobBag.SetQuoteNo(const Value: real);
begin
  FQuoteNo := Value;
end;

procedure TJobBag.LoadNonConformDocs;
var
  aNonConform : TJobBagNonConform;
  icount: integer;
begin
  icount := 0;
  FJobBagNonConforms.Clear;
  with FDataModule.qryJBAllNonConforms do
  begin
    Close;
    ParamByName('Job_Bag').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      inc(icount);
      aNonConform := TJobBagNonConform.Create(Self);
      aNonConform.NCNumber := fieldbyname('Job_Bag_Non_Conform').asinteger;
      aNonConform.JBNonConformNo := icount;
      aNonConform.DatePoint := fieldbyname('Date_Point').asdatetime;
      aNonConform.Operator := fieldbyname('Operator').asinteger;
      aNonConform.OperatorName := fieldbyname('Operator_Name').asstring;
      aNonConform.RaisedBy := fieldbyname('raised_By_Dept').asinteger;
      aNonConform.RaisedbyName := fieldbyname('Raised_by_dept_Descr').asstring;
      aNonConform.NCCategory := fieldbyname('Non_Conform_Category').asinteger;
      aNonConform.NCCategoryDescription := fieldbyname('Non_Conform_Category_Descr').asstring;
      aNonConform.NCDepartment := fieldbyname('Non_Conform_Dept').asinteger;
      aNonConform.NCDepartmentName := fieldbyname('Non_Conform_Dept_Descr').asstring;
      aNonConform.NCType := fieldbyname('Non_Conform_Type').asinteger;
      aNonConform.NCTypeDescription := fieldbyname('Non_Conform_Type_Descr').asstring;
      aNonConform.QAOperator := fieldbyname('QA_Operator').asinteger;
      aNonConform.QAOperatorName := fieldbyname('QA_Operator_Name').asstring;
      aNonConform.QASignOffDate := fieldbyname('QA_Sign_Off_Date').asDateTime;
      aNonConform.TotalCost := fieldbyname('Total_Cost').asfloat;
      aNonConform.CosttoClient := fieldbyname('Total_Cost_to_Client').asfloat;
      aNonConform.Inactive := fieldbyname('inactive').asstring;
      aNonConform.InactiveDate := fieldbyname('inactive_date').asdatetime;
      aNonConform.Narrative := fieldbyname('Non_conform_Notes').asinteger;
      aNonConform.NarrativeText := FDataModule.GetNarrative(aNonConform.Narrative);
      aNonConform.Response := fieldbyname('Response_Notes_id').asinteger;
      aNonConform.ResponseNotes := FDataModule.GetNarrative(aNonConform.Response);
      aNonConform.Corrective := fieldbyname('Corrective_Notes_id').asinteger;
      if aNonConform.Corrective = 0 then
        aNonConform.CorrectiveNotes := fieldbyname('Corrective_Notes').asstring
      else
        aNonConform.CorrectiveNotes := FDataModule.GetNarrative(aNonConform.Corrective);
      aNonConform.Preventative := fieldbyname('Preventative_Notes_id').asinteger;
      aNonConform.PreventativeNotes := FDataModule.GetNarrative(aNonConform.Preventative);
      aNonConform.ResponseDate := fieldbyname('Response_Date').asdatetime;
      aNonConform.CorrectiveDate := fieldbyname('Corrective_Date').asdatetime;
      aNonConform.PreventativeDate := fieldbyname('Preventative_Date').asdatetime;

      aNonConform.Status := fieldbyname('Non_Conform_Status').asinteger;
      aNonConform.JobRePrinted := fieldbyname('Job_Reprinted').asstring;
      aNonConform.SamplesAvailable := fieldbyname('Samples_Available').asstring;
      FJobBagNonConforms.Add(aNonConform);
      next
    end;
  end;
end;

procedure TJobBag.LoadSupplies;
var
  aSupply : TJobBagSupply;
  icount: integer;
begin
  icount := 0;
  FJobBagSupplies.Clear;
  with FDataModule.qryJBAllSupplies do
  begin
    Close;
    ParamByName('Job_Bag').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      inc(icount);
      aSupply := TJobBagSupply.Create(Self);
      aSupply.JBSupplyNo := icount;
      aSupply.Description := fieldbyname('Form_Description').asstring;
      aSupply.Enquiry := fieldbyname('Enquiry').asinteger;
      aSupply.EnquiryLine := fieldbyname('Line').asinteger;
      aSupply.LineConverted := fieldbyname('Line_Converted').asstring;
      aSupply.Quantity := fieldbyname('Quantity').asinteger;
      aSupply.UnitCost := fieldbyname('Supplier_Price').asfloat;
      aSupply.UnitSell := fieldbyname('Quotation_Price').asfloat;
      aSupply.PriceUnit := fieldbyname('Price_Unit').asinteger;
      aSupply.PriceUnitFactor := fieldbyname('Price_Unit_Factor').asinteger;
      aSupply.PriceUnitDesc := fieldbyname('Price_Unit_Description').asstring;
      aSupply.ProductType := fieldbyname('Product_Type').asinteger;
      aSupply.ProductTypeDesc := fieldbyname('Product_Type_Description').asstring;
      FJobBagSupplies.Add(aSupply);
      next
    end;
  end;
end;

procedure TJobBag.SaveSupplies;
var
  i : integer;
begin
  DeleteSupplies;  { Get rid of any already in database }
  FJobBagSupplies.Renumber;
  for i := 0 to Pred(FJobBagSupplies.Count) do
    begin
      FJobBagSupplies[i].SaveToDB;
    end;
end;

procedure TJobBag.DeleteSupplies;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Job_Bag_Supply WHERE Job_Bag = ' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

function TJobBag.GetWOStatus: integer;
var
  icount: integer;
  minStatus, maxstatus: integer;
begin
  minStatus := 9999;
  maxStatus := 0;

  for icount := 0 to pred(self.Works.count) do
    begin
      if minStatus > self.Works[icount].Status then
        minStatus := self.Works[icount].Status;
      if maxStatus < self.Works[icount].Status then
        maxStatus := self.Works[icount].Status;
    end;

  if self.Works.count = 0 then
    result := 0
  else
    begin
      if minStatus = maxStatus then
        Result := minStatus
      else
        Result := minStatus + 5;
    end;
end;

procedure TJobBag.SetProductionStatus(const Value: integer);
begin
  FProductionStatus := Value;
end;

procedure TJobBag.SetCostCentre(const Value: string);
begin
  FCostCentre := Value;
end;

procedure TJobBag.SetCashSale(const Value: boolean);
begin
  FCashSale := Value;
end;

function TJobBag.GetCustomerHasPrices: boolean;
begin
  with FDataModule.qryGetCustomerPrices do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;
      result := (recordcount > 0);
    end;
end;

function TJobBag.GetTotalPOCount: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FJobBagLines.Count) do
    if FJobBagLines[i].PurchaseOrder <> 0 then
      Result := Result + 1;

end;

procedure TJobBag.SetProductionComplete(const Value: boolean);
begin
  FProductionComplete := Value;
end;

procedure TJobBag.SetProductionDate(const Value: TDateTime);
begin
  FProductionDate := Value;
end;

procedure TJobBag.SetProductionCompleteBy(const Value: integer);
begin
  FProductionCompleteBy := Value;
end;

procedure TJobBag.SetProductionCompleteByName(const Value: string);
begin
  FProductionCompleteByName := Value;
end;

procedure TJobBag.LoadDeliveries;
var
  aDelivery : TJobBagDelivery;
  icount: integer;
begin
  icount := 0;
  FJobBagDeliveries.Clear;
  with FDataModule.qryJBAllDeliveries do
  begin
    Close;
    ParamByName('Job_Bag').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      inc(icount);
      aDelivery := TJobBagDelivery.Create(Self);
      aDelivery.DeliveryNo := icount;
      aDelivery.AdhocAddress := FieldByName('Ad_hoc_address').asinteger;
      aDelivery.BoxQuantity := fieldbyname('Box_Quantity').asinteger;
      aDelivery.BranchNo := FieldByName('Branch_no').Asinteger;
      aDelivery.CompanyBranch := fieldbyname('Company_Branch').asinteger;
      aDelivery.ConsignmentNo := FieldByName('Consignment_Number').Asstring;
      aDelivery.Courier := FieldByName('Courier').asinteger;
      aDelivery.CourierName := FieldByName('Courier_Name').asstring;
      aDelivery.Customer := FieldByName('Customer').Asinteger;
      aDelivery.CustomerName := FieldByName('Customer_Name').Asstring;
      aDelivery.ContactName := FieldByName('Contact_Name').Asstring;
      aDelivery.DateDelivered := FieldByName('Date_Deliv_Actual').asdatetime;
      aDelivery.DatePoint := FieldByName('Date_Point').Asdatetime;

      if JBMode = jbRepeat then
        aDelivery.DateRequired := self.FGoodsRequired
      else
        aDelivery.DateRequired := FieldByName('Goods_Reqd_by_Customer').Asdatetime;

      aDelivery.DeliverToStock := FieldByName('Delivery_To_Stock').asstring;
      aDelivery.DeliverViaCompany := FieldByName('Deliver_Via_Company').Asstring;
      aDelivery.DeliveryInstructions := FieldByName('Delivery_Instructions').Asstring;
      aDelivery.DeliveryNotePrinted := FieldByName('Delivery_Note_Printed').asstring;
      aDelivery.DeliveryWeightKilos := FieldByName('Delivery_Weight_Kilos').Asfloat;
      aDelivery.NumberofBoxes := FieldByName('No_of_Boxes').asinteger;
      aDelivery.PackageType := FieldByName('Package_Type').Asinteger;
      aDelivery.PackageName := FieldByName('Package_Name').Asstring;
      aDelivery.QtyDelivered := FieldByName('Qty_Delivered').asfloat;
      aDelivery.QtyToDeliver := FieldByName('Qty_To_Deliver').Asfloat;
      aDelivery.Rep := FieldByName('Rep').Asinteger;
//      aDelivery.RepName := FieldByName('Rep_Name').asstring;
      aDelivery.Service := FieldByName('Service_no').Asinteger;
      aDelivery.ServiceName := FieldByName('Service_Name').Asstring;
      aDelivery.Supplier := fieldbyname('Supplier').asinteger;
      aDelivery.SupplierBranch := fieldbyname('Supplier_Branch').asinteger;

      if aDelivery.AdhocAddress <> 0 then
        aDelivery.DeliveryLocation := datamodule.GetDeliveryDescription(aDelivery.AdHocAddress, 0, 0)
      else
      if aDelivery.Supplier <> 0 then
        aDelivery.DeliveryLocation := datamodule.GetDeliveryDescription(aDelivery.Supplier, aDelivery.SupplierBranch, 1)
      else
      if aDelivery.Rep <> 0 then
        aDelivery.DeliveryLocation := datamodule.GetDeliveryDescription(aDelivery.Rep, 0, 2)
      else
      if aDelivery.Customer <> 0 then
        aDelivery.DeliveryLocation := datamodule.GetDeliveryDescription(aDelivery.Customer, aDelivery.BranchNo, 3)
      else
        aDelivery.DeliveryLocation := datamodule.GetDeliveryDescription(0, aDelivery.CompanyBranch, 4);

      FJobBagDeliveries.Add(aDelivery);
      next
    end;
  end;
end;

procedure TJobBag.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TJobBag.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

function TJobBag.GetUnitSell: currency;
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

procedure TJobBag.SetPriceUnitFactor(const Value: integer);
begin
  FPriceUnitFactor := Value;
end;

procedure TJobBag.LoadDepartments;
var
  aDepartment : TJobBagDept;
  icount: integer;
begin
  FJobBagDepts.Clear;
  with FDataModule.qryGetProcessGroups do
  begin
    Close;
    Open;
    first;
    icount := 0;

    while not(EOF) do
    begin
      aDepartment := TJobBagDept.Create(Self);
      aDepartment.JDepartmentNo := icount;
      aDepartment.Department := FieldByName('Process_Group').AsInteger;
      aDepartment.DepartmentName := FieldByName('Process_Group_Description').Asstring;

      FDataModule.qryJProcessGroup.close;
      FDataModule.qryJProcessGroup.parambyname('Job_Bag').asfloat := self.dbKey;
      FDataModule.qryJProcessGroup.parambyname('Process_Group').asinteger := aDepartment.Department;
      FDataModule.qryJProcessGroup.open;

      aDepartment.SpecificationID := FDataModule.qryJProcessGroup.fieldbyname('Job_Bag_Specification_id').asinteger;
      if aDepartment.SpecificationID = 0 then
        aDepartment.Specification := FDataModule.qryJProcessGroup.FieldByName('Job_Bag_Specification').Asstring
      else
        aDepartment.Specification := FDataModule.GetNarrative(aDepartment.SpecificationID);
      FJobBagDepts.Add(aDepartment);
      icount := icount + 1;
      Next;
    end;
  end;
end;

procedure TJobBag.SaveDepartments;
var
  i : integer;
begin
  DeleteDepartments;  { Get rid of any already in database }
  FJobBagDepts.Renumber;
  for i := 0 to Pred(FJobBagDepts.Count) do
    begin
      if FJobBagDepts[i].Specification <> '' then
        FJobBagDepts[i].SaveToDB;
    end;
end;

procedure TJobBag.LoadQuoteDepartments;
var
  aDepartment : TJobBagDept;
  icount: integer;
begin
  FJobBagDepts.Clear;
  with FDataModule.qryGetProcessGroups do
  begin
    Close;
    Open;
    first;
    icount := 0;

    while not(EOF) do
    begin
      aDepartment := TJobBagDept.Create(Self);
      aDepartment.JDepartmentNo := icount;
      aDepartment.Department := FieldByName('Process_Group').AsInteger;
      aDepartment.DepartmentName := FieldByName('Process_Group_Description').Asstring;

      FDataModule.qryQProcessGroup.close;
      FDataModule.qryQProcessGroup.parambyname('Quote').asfloat := FDataModule.QuoteNo;
      FDataModule.qryQProcessGroup.parambyname('Process_Group').asinteger := aDepartment.Department;
      FDataModule.qryQProcessGroup.open;

      aDepartment.SpecificationID := FDataModule.qryQProcessGroup.fieldbyname('Quote_Specification_id').asinteger;
      if aDepartment.SpecificationID = 0 then
        aDepartment.Specification := FDataModule.qryQProcessGroup.FieldByName('Quote_Specification').Asstring
      else
        aDepartment.Specification := FDataModule.GetNarrative(aDepartment.SpecificationID);
      FJobBagDepts.Add(aDepartment);
      icount := icount + 1;
      Next;
    end;
  end;
end;

procedure TJobBag.SetFileCopiesReceived(const Value: boolean);
begin
  FFileCopiesReceived := Value;
end;

procedure TJobBag.SetFileCopiesReceivedBy(const Value: integer);
begin
  FFileCopiesReceivedBy := Value;
end;

procedure TJobBag.SetFileCopiesReceivedName(const Value: string);
begin
  FFileCopiesReceivedName := Value;
end;

procedure TJobBag.SetFileCopiesReceivedDate(const Value: TDateTime);
begin
  FFileCopiesReceivedDate := Value;
end;

function TJobBag.GetTotalNonInternalCost: currency;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Pred(FJobBagLines.Count) do
    begin
      if FJobBagLines[i].InternalCostLine then
        continue;

      if not FJobBagLines[i].JBLineInactive then
        Result := Result + roundfloat(FJobBagLines[i].JBLineCost,2);
    end;
end;

procedure TJobBag.SetSubRep(const Value: integer);
begin
  FSubRep := Value;
end;

procedure TJobBag.SetInvoiceThisWeek(const Value: boolean);
begin
  FInvoiceThisWeek := Value;
end;

procedure TJobBag.SetInvoiceThisWeekBy(const Value: integer);
begin
  FInvoiceThisWeekBy := Value;
end;

procedure TJobBag.SetInvoiceThisWeekDate(const Value: TDateTime);
begin
  FInvoiceThisWeekDate := Value;
end;

procedure TJobBag.SetInvoiceThisWeekName(const Value: string);
begin
  FInvoiceThisWeekName := Value;
end;

function TJobBag.GetCustomerMarkup(Customer: integer; var bOverride: boolean;
  var rMarkup: real): boolean;
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

function TJobBag.GetCompanyMarkup: real;
begin
  with FDataModule.qryGetQuoteCostDefaults do
    begin
      close;
      open;
      result := fieldbyname('Default_Quote_Cost_markup_perc').asfloat;
    end;
end;

procedure TJobBag.SetAcquiredCustomer(const Value: boolean);
begin
  FAcquiredCustomer := Value;
end;

procedure TJobBag.SetEndUserBranch(const Value: integer);
begin
  FEndUserBranch := Value;
end;

procedure TJobBag.SetEndUserCustomer(const Value: integer);
begin
  FEndUserCustomer := Value;
end;

procedure TJobBag.SetEndUserCustomerName(const Value: string);
begin
  FEndUserCustomerName := Value;
end;

function TJobBag.GetTotalReseller: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FJobBagLines.Count) do
    if not FJobBagLines[i].JBLineInactive then
      Result := Result + roundfloat(FJobBagLines[i].JBLineReseller,2);
end;

function TJobBag.GetTotalResellerMargin: currency;
begin
  Result := TotalReseller - TotalSell;
end;

function TJobBag.GetTotalResellerMarginPerc: double;
begin
  if FJobBagLines.Count = 0 then
    Result := 0
  else
  if TotalReseller <> 0 then
    Result := (TotalResellerMargin/TotalReseller) * 100
  else
    Result := -999999;
end;

procedure TJobBag.SetPackFormat(const Value: integer);
begin
  FPackFormat := Value;
end;

procedure TJobBag.SetEnclosingType(const Value: string);
begin
  FEnclosingType := Value;
end;

function TJobBag.GetTotalRepCost: currency;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FJobBagLines.Count) do
    if not FJobBagLines[i].JBLineInactive then
      Result := Result + roundfloat(FJobBagLines[i].JBLineCost,2);
end;

function TJobBag.GetTotalRepMargin: currency;
begin
  Result := TotalSell - TotalRepCost;
end;

function TJobBag.GetTotalRepMarginPerc: double;
begin
  if FJobBagLines.Count = 0 then
    Result := 0
  else
  if TotalSell <> 0 then
    Result := (TotalRepMargin/TotalSell) * 100
  else
    Result := -999999;
end;

{ TJobBagLines }

procedure TJobBagLines.Add(aLine: TJobBagLine);
begin
  FItems.Add(aLine);
end;

procedure TJobBagLines.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagLine(FItems[i]).Free;
end;

function TJobBagLines.Clone: TJobBagLines;
var
  i : integer;
begin
  Result := TJobBagLines.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJobBagLine(FItems[i]).Clone);
end;

constructor TJobBagLines.Create(JobBag : TJobbag);
begin
  FParent := JobBag;
  FItems := TList.Create;
end;

procedure TJobBagLines.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJobBagLines.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagLine(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJobBagLines.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJobBagLines.GetItems(Index: integer): TJobBagLine;
begin
  Result := TJobBagLine(FItems[Index]);
end;

function TJobBagLines.IndexOf(const LineNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagLine(FItems[i]).JBLine = LineNumber then
      Result := i;
end;

function TJobBagLines.IndexOfSequence(const SeqNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagLine(FItems[i]).Sequence = SeqNumber then
      Result := i;
end;

procedure TJobBagLines.SetItems(Index: integer; const Value: TJobBagLine);
begin
  FItems[Index] := Value;
end;

procedure TJobBagLines.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagLine(FItems[i]).JBLine:= (i+1);
end;

procedure TJobBagLines.ReSequence;
var
  i : integer;
  iIndex: integer;
begin
  iIndex := 0;
  for i := 0 to Pred(FItems.Count) do
    begin
      iIndex := TJobBagLine(Items[i]).sequence -1;
    end;
end;

function TJobBagLines.GetPOCount: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].JBLineType = 'P' then
      Inc(Result);
end;

function TJobBagLines.GetMaxLineNo: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].JBLine > Result then
      Result := Items[i].JBLine;
end;

{ TJobBagLine }

function TJobBagLine.Clone: TJobBagLine;
begin
  Result := TJobBagLine.Create(FParent);
  Result.CurrencyCode :=    Self.CurrencyCode;
  Result.JBLine :=          Self.JBLine;
  Result.JBLineType :=      Self.JBLineType;
  Result.PurchaseOrder :=   Self.PurchaseOrder;
  Result.Line :=            Self.Line;
  Result.NeedsAuthorising := Self.NeedsAuthorising;
  Result.SONumber :=        Self.SONumber;
  Result.SOLineNo :=        Self.SOLineNo;
  Result.Supplier:=         Self.Supplier;
  Result.BranchNo :=        Self.BranchNo;
  Result.SupplierName:=     Self.SupplierName;
  Result.BranchName :=      Self.BranchName;
  Result.Category :=        Self.Category;
  Result.CategoryDescr :=   Self.CategoryDescr;
  Result.ClearedFundsReq := Self.ClearedFundsReq;
  Result.ClearedFundsRec := Self.ClearedFundsRec;
  Result.CostPrice :=       Self.CostPrice;
  Result.CostPriceOHD :=    Self.CostPriceOHD;
  Result.JBLineDescr :=     Self.JBLineDescr;
  Result.JBLineCost :=      Self.JBLineCost;
  Result.JBLineReseller :=  Self.JBLineReseller;
  Result.JBLineSell :=      Self.JBLineSell;
  Result.JBLineInactive :=  Self.JBLineInactive;
  Result.JBLineInvoiced :=  Self.JBLineInvoiced;
  Result.JBLinePurchInvd := Self.JBLinePurchInvd;
  Result.JBQuantity :=      Self.JBQuantity;
  Result.JBQtyInvoiced :=   Self.JBQtyInvoiced;
  Result.InternalCostLine := self.InternalCostLine;
  Result.InternalCostMarkupPercentage :=
                            self.InternalCostMarkupPercentage;
  Result.VATCode :=         Self.VATCode;
  Result.VATDescription :=  Self.VATDescription;
  Result.JBLineMode :=      Self.JBLineMode;
  Result.JBLineStatus :=    Self.JBLineStatus;
  Result.JBLineStatusText := Self.JBLineStatusText;
  Result.Operation :=       Self.Operation;
  Result.OperationDescr :=  Self.OperationDescr;
  Result.PriceUnit :=       Self.PriceUnit;
  Result.PriceUnitDescr :=  Self.PriceUnitDescr;
  Result.Process :=         Self.Process;
  Result.ProcessDescr :=    self.ProcessDescr;
  Result.ProductType :=     Self.ProductType;
  Result.Quote  :=          Self.Quote;
  Result.QuoteLineNo :=     Self.QuoteLineNo;
  Result.WONumber :=        Self.WONumber;
  Result.WorksOrderNumber :=        Self.WorksOrderNumber;
  Result.ReadyToInvoice :=  Self.ReadyToInvoice;
  Result.SubCategory :=     Self.SubCategory;
  Result.SubCategoryDescr := Self.SubCategoryDescr;
  Result.ResellerPrice    := Self.ResellerPrice;
  Result.SellPrice :=       Self.SellPrice;
  Result.SuggPrice :=       Self.SuggPrice;
  Result.SSPOrig :=         Self.SSPOrig;
  Result.Sequence :=        Self.Sequence;
  REsult.JustMoved :=       Self.JustMoved;
end;

constructor TJobBagLine.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
end;

destructor TJobBagLine.Destroy;
begin
  inherited;
end;

function TJobBagLine.GetPOLineStatus(tempCode: real;
  tempLine: integer): string;
begin
  with parent.datamodule.qryPOLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;
      if fieldbyname('Purch_ord_line_Status').asinteger = 25 then
        result := 'P'
      else
      if fieldbyname('Purch_ord_line_Status').asinteger = 30 then
        result := 'Y'
      else
      if fieldbyname('Purch_ord_line_Status').asinteger > 30 then
        result := 'C'
      else
        result := 'N';
    end;
end;

procedure TJobBagLine.LoadFromDB;
begin
  with FParent.FDataModule.qryJBLine do
  begin
    Close;
    ParamByName('JobBag').AsInteger := FParent.DbKey;
    ParamByName('Line').AsInteger := JBLine;
    Open;
    CurrencyCode := FieldByName('Currency_Code').AsInteger;
    JBLineType := FieldByName('Job_Bag_Line_Type').AsString[1];
    PurchaseOrder := FieldByName('Purchase_Order').asfloat;
    Line := FieldByName('Line').AsInteger;
    Supplier:= FieldByName('Supplier').AsInteger;
    BranchNo := FieldByName('Branch_No').AsInteger;
    JBLineDescr := FieldByName('Job_Bag_Line_Descr').AsString;
    JBLineCost := FieldByName('Job_Bag_Line_Cost').AsFloat;
    JBLineSell := FieldByName('Job_Bag_Line_Sell').AsFloat;
    JBLineInactive := GetJBLineInactive(PurchaseOrder,Line);
    SONumber := fieldbyname('sales_order').asinteger;
    SOLineNo := fieldbyname('sales_order_line_no').AsInteger;
    if PurchaseOrder <> 0 then
      JBLineInvoiced := GetPOLineStatus(PurchaseOrder,Line)
    else
    if SONumber <> 0 then
      JBLineInvoiced := GetSOLineStatus(SONumber, SOLineNo)
    else
      JBLineInvoiced := FieldByName('Job_Bag_Line_Invoiced').AsString;

    JBLinePurchInvd := FieldByName('supp_inv_recd').AsString[1] = 'Y';
    JBQuantity := FieldByName('Job_Bag_Quantity').AsInteger;
    JBQtyInvoiced := FieldbyName('Qty_Invoiced').asinteger;
    VATCode := FieldByName('VAT_Code').AsInteger;
    PriceUnit := FieldbyName('Price_Unit').asinteger;
    Process := Fieldbyname('Process').asinteger;
    ProductType := FieldByName('Product_Type').asinteger;
    WONumber := FieldByName('Works_order').asinteger;
    WorksOrderNumber := FParent.FDataModule.GetWONumber(WONumber);
    SellPrice := Fieldbyname('Selling_Price').asfloat;
    CostPrice := FieldbyName('Unit_Cost').asfloat;
    CostPriceOHD := FieldbyName('Unit_Cost_Plus_OHD').asfloat;
    SuggPrice := fieldbyName('Unit_SSP').asfloat;
    SSPOrig := fieldbyname('Unit_SSP_Original').asfloat;
    Quote := fieldbyname('Quote').asfloat;
    QuoteLineNo := fieldbyname('Quote_Line_no').asinteger;
    JBLineMode := 'C';
    JBLineStatus := fieldbyname('Job_Bag_Line_status').asinteger;
    if PurchaseOrder <> 0 then
        begin
          JBLineStatusText := parent.FDataModule.GetPOStatus(PurchaseOrder, Line, parent.dbKey, JBLine, JBLineInvoiced);
        end
      else
      if SONumber <> 0 then
        begin
          JBLineStatusText := parent.FDataModule.GetSOStatus(SONumber, parent.dbKey, JBLine, JBLineInvoiced);
        end
      else
        JBLineStatusText := 'Sundry Created';

    Sequence := 1;
    JustMoved := False;
    ReadyToInvoice := fieldbyname('Ready_to_Invoice').asstring;
    ClearedFundsReq := parent.FDataModule.GetPOClearedFunds(PurchaseOrder, Line);
    ClearedFundsRec := parent.FDataModule.GetInvClearedFunds(PurchaseOrder, Line);
    NeedsAuthorising := parent.FDataModule.GetPOAuthorised(PurchaseOrder);
    Close;
  end;
end;

procedure TJobBagLine.DeleteFromDB;
begin
  with FParent.FDataModule.qryJBDelLine do
  begin
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Job_Bag_Line').AsInteger := JBLine;
    ExecSQL;
  end;
end;

function TJobBagLine.HasBeenInvoiced;
begin
  with FParent.FDataModule.qryJBSILines do
  begin
    close;
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Job_Bag_Line').AsInteger := JBLine;
    open;
    result := recordcount > 0;
  end;
end;

procedure TJobBagLine.SaveToDB;
begin
  with FParent.FDataModule.qryJBAddLine do
  begin
    close;
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Job_Bag_Line').AsInteger := JBLine;
    if CurrencyCode < 1 then
      ParamByName('Currency_Code').Clear
    else
      ParamByName('Currency_Code').AsInteger := CurrencyCode;
    ParamByName('Job_Bag_Line_Type').AsString := JBLineType;
    if PurchaseOrder = 0 then
      ParamByName('Purchase_Order').Clear
    else
      ParamByName('Purchase_Order').asfloat := PurchaseOrder;
    if Line = 0 then
      ParamByName('Line').Clear
    else
      ParamByName('Line').AsInteger := Line;
    ParamByName('Supplier').AsInteger := Supplier;
    ParamByName('Branch_No').AsInteger := BranchNo;
    ParamByName('Job_Bag_Line_Descr').AsString := JBLineDescr;
    ParamByName('Job_Bag_Line_Cost').AsFloat := JBLineCost;
    ParamByName('Job_Bag_Line_Sell').AsFloat := JBLineSell;
    ParamByName('Job_Bag_Line_Reseller').AsFloat := JBLineReseller;

    if JBLineInactive then
      Parambyname('Inactive').asstring := 'Y'
    else
      Parambyname('Inactive').asstring := 'N';

(*    if JBLineInvoiced then
      ParamByName('Job_Bag_Line_Invoiced').AsString := 'Y'
    else
      ParamByName('Job_Bag_Line_Invoiced').AsString := 'N';
*)
    ParamByName('Job_Bag_Line_Invoiced').AsString := JBLineInvoiced;
    ParamByName('Job_Bag_Quantity').AsInteger := JBQuantity;
    ParamByName('Qty_Invoiced').asinteger := JBQtyInvoiced;

    if Quote = 0 then
      begin
        Parambyname('Quote').clear;
        Parambyname('Quote_Line_No').clear;
      end
    else
      begin
        Parambyname('Quote').asfloat := Quote;
        Parambyname('Quote_Line_No').AsInteger := QuoteLineNo;
      end;

    if ProductType <= 0 then
      ParamByName('Product_Type').clear
    else
      ParambyName('Product_Type').asinteger := ProductType;
    if VatCode < 0 then
      ParamByName('VAT_Code').Clear
    else
      ParamByName('VAT_Code').AsInteger := VATCode;
    if SONumber = 0 then
      Parambyname('Sales_Order').clear
    else
      ParambyName('Sales_Order').asinteger := SONumber;
    if SOLineNo = 0 then
      Parambyname('Sales_order_line_no').clear
    else
      ParambyName('Sales_Order_line_no').asinteger := SOLineNo;
    if WONumber = 0 then
      Parambyname('Works_order').clear
    else
      Parambyname('Works_order').asinteger := WONumber;
    if Process <= 0 then
      ParamByName('Process').clear
    else
      ParambyName('Process').asinteger := Process;
    if PriceUnit <= 0 then
      ParamByName('Price_Unit').clear
    else
      ParambyName('Price_Unit').asinteger := PriceUnit;
    Parambyname('Reseller_Price').asfloat := ResellerPrice;
    Parambyname('Selling_Price').asfloat := SellPrice;
    Parambyname('Unit_Cost').asfloat := CostPrice;
    Parambyname('Unit_SSP').asfloat := SuggPrice;
    Parambyname('Unit_Cost_plus_OHD').asfloat := CostPriceOHD;
    Parambyname('Unit_SSP_Original').asfloat := SSPOrig;
    if JBLineStatus = 0 then
      JBLineStatus := 10;
    Parambyname('Sequence_no').asinteger := Sequence;
    Parambyname('Job_Bag_Line_Status').asinteger := JBLineStatus;
    Parambyname('Ready_to_Invoice').asstring := ReadyToInvoice;

    if InternalCostLine then
      Parambyname('Line_Is_Internal_Cost').asstring := 'Y'
    else
      Parambyname('Line_Is_Internal_Cost').asstring := 'N';

    Parambyname('Job_Cost_Markup_Perc').asfloat := InternalCostMarkupPercentage;

    ExecSQL;
  end;
end;

procedure TJobBagLine.SetBranchName(const Value: string);
begin
  FBranchName := Value;
end;

procedure TJobBagLine.SetBranchNo(const Value: integer);
begin
  FBranchNo := Value;
end;

procedure TJobBagLine.SetCurrencyCode(const Value: integer);
begin
  FCurrencyCode := Value;
end;

procedure TJobBagLine.SetJBLine(const Value: integer);
begin
  FJBLine := Value;
end;

procedure TJobBagLine.SetJBLineCost(const Value: currency);
begin
  FJBLineCost := Value;
end;

procedure TJobBagLine.SetJBLineDescr(const Value: string);
begin
  FJBLineDescr := Value;
end;

procedure TJobBagLine.SetJBLineMode(const Value: string);
begin
  FJBLineMode := Value;
end;

procedure TJobBagLine.SetJBLineSell(const Value: currency);
begin
  FJBLineSell := Value;
end;

procedure TJobBagLine.SetJBLineType(const Value: char);
begin
  FJBLineType := Value;
end;

procedure TJobBagLine.SetJBQuantity(const Value: integer);
begin
  FJBQuantity := Value;
end;

procedure TJobBagLine.SetLine(const Value: integer);
begin
  FLine := Value;
end;

procedure TJobBagLine.SetPurchaseOrder(const Value: real);
begin
  FPurchaseOrder := Value;
end;

procedure TJobBagLine.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TJobBagLine.SetSupplierName(const Value: string);
begin
  FSupplierName := Value;
end;

procedure TJobBagLine.SetVATCode(const Value: integer);
begin
  FVATCode := Value;
end;

procedure TJobBagLine.UpdateToDB;
begin
  with FParent.FDataModule.qryJBUpLine do
  begin
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Job_Bag_Line').AsInteger := JBLine;
    if CurrencyCode < 1 then
      ParamByName('Currency_Code').Clear
    else
      ParamByName('Currency_Code').AsInteger := CurrencyCode;
    ParamByName('Job_Bag_Line_Type').AsString := JBLineType;
    if PurchaseOrder = 0 then
      ParamByName('Purchase_Order').Clear
    else
      ParamByName('Purchase_Order').asfloat := PurchaseOrder;
    if Line = 0 then
      ParamByName('Line').Clear
    else
      ParamByName('Line').AsInteger := Line;
    ParamByName('Supplier').AsInteger := Supplier;
    ParamByName('Branch_No').AsInteger := BranchNo;
    ParamByName('Job_Bag_Line_Descr').AsString := JBLineDescr;
    ParamByName('Job_Bag_Line_Cost').AsFloat := JBLineCost;
    ParamByName('Job_Bag_Line_Sell').AsFloat := JBLineSell;
    ParamByName('Job_Bag_Line_Reseller').AsFloat := JBLineReseller;

    if JBLineInactive then
      Parambyname('Inactive').asstring := 'Y'
    else
      Parambyname('Inactive').asstring := 'N';
(*    if JBLineInvoiced then
      ParamByName('Job_Bag_Line_Invoiced').AsString := 'Y'
    else
      ParamByName('Job_Bag_Line_Invoiced').AsString := 'N';
*)
    ParamByName('Job_Bag_Line_Invoiced').AsString := JBLineInvoiced;
    ParamByName('Job_Bag_Quantity').AsInteger := JBQuantity;
    ParamByName('Qty_Invoiced').asinteger := JBQtyInvoiced;
    if Quote = 0 then
      begin
        Parambyname('Quote').clear;
        Parambyname('Quote_Line_No').clear;
      end
    else
      begin
        Parambyname('Quote').asfloat := Quote;
        Parambyname('Quote_Line_No').AsInteger := QuoteLineNo;
      end;
    if ProductType <= 0 then
      ParamByName('Product_Type').clear
    else
      ParambyName('Product_Type').asinteger := ProductType;
    if VatCode < 0 then
      ParamByName('VAT_Code').Clear
    else
      ParamByName('VAT_Code').AsInteger := VATCode;

    if SONumber = 0 then
      Parambyname('Sales_Order').clear
    else
      ParambyName('Sales_Order').asinteger := SONumber;
    if SOLineNo = 0 then
      Parambyname('Sales_order_line_no').clear
    else
      ParambyName('Sales_Order_line_no').asinteger := SOLineNo;
    if WONumber = 0 then
      Parambyname('Works_order').clear
    else
      Parambyname('Works_order').asinteger := WONumber;

    if Process <= 0 then
      ParamByName('Process').clear
    else
      ParambyName('Process').asinteger := Process;
    if PriceUnit <= 0 then
      ParamByName('Price_Unit').clear
    else
      ParambyName('Price_Unit').asinteger := PriceUnit;
    Parambyname('Reseller_Price').asfloat := ResellerPrice;
    Parambyname('Selling_Price').asfloat := SellPrice;
    Parambyname('Unit_Cost').asfloat := CostPrice;
    Parambyname('Unit_SSP').asfloat := SuggPrice;
    Parambyname('Unit_Cost_plus_OHD').asfloat := CostPriceOHD;
    Parambyname('Unit_SSP_Original').asfloat := SSPOrig;

    if JBLineStatus = 0 then
      JBLineStatus := 10;

    Parambyname('Sequence_no').asinteger := Sequence;
    Parambyname('Job_Bag_Line_Status').asinteger := JBLineStatus;
    Parambyname('Ready_To_Invoice').asstring := ReadyToInvoice;

    if InternalCostLine then
      Parambyname('Line_Is_Internal_Cost').asstring := 'Y'
    else
      Parambyname('Line_Is_Internal_Cost').asstring := 'N';

    Parambyname('Job_Cost_Markup_Perc').asfloat := InternalCostMarkupPercentage;

    ExecSQL;
  end;
end;

procedure TJobBagLine.SetJBLinePurchInvd(const Value: Boolean);
begin
  FJBLinePurchInvd := Value;
end;

function TJobBagLine.GetJBLineInactive(tempCode: real; tempLine: integer): boolean;
begin
  with parent.datamodule.qryPOLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;
      if fieldbyname('Inactive').asstring = 'Y' then
        result := true
      else
        result := false;
    end;
end;

procedure TJobBagLine.SetJBLineInactive(const Value: Boolean);
begin
  FJBLineInactive := Value;
end;

procedure TJobBagLine.SetJBLineInvoiced(const Value: string);
begin
  FJBLineInvoiced := Value;
end;

procedure TJobBagLine.SetProductType(const Value: integer);
begin
  FProductType := Value;
end;

function TJobBagLine.GetProductTypeDesc: string;
begin
  with Fparent.DataModule.qryProductType do
    begin
      close;
      parambyname('Product_Type').asinteger := FProductType;
      open;
      if recordcount = 0 then
        result := ''
      else
        result := fieldbyname('Description').asstring + '/' + fieldbyname('Category_Description').asstring;
    end;
end;


procedure TJobBagLine.SetSOLineNo(const Value: integer);
begin
  FSOLineNo := Value;
end;

procedure TJobBagLine.SetSONumber(const Value: integer);
begin
  FSONumber := Value;
end;

function TJobBagLine.GetSOLineStatus(tempCode, templine: integer): string;
begin
  with parent.datamodule.qrySO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      open;

      if fieldbyname('sales_order_head_status').asinteger < 150 then
        begin
          result := 'N';
          exit;
        end;
    end;

  with parent.datamodule.qrySOLine do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      if  (fieldbyname('Quantity_Delivered').asinteger = fieldbyname('Quantity_Invoiced').asinteger) and
          (fieldbyname('Quantity_Delivered').asinteger > 0) then
        result := 'Y'
      else
      if fieldbyname('Sales_Order_Head_Status').asinteger = 200 then
        result := 'P'
      else
      if fieldbyname('Sales_Order_Head_Status').asinteger = 250 then
        result := 'Y'
      else
        result := 'N';

      if  (fieldbyname('Sales_Order_Head_Status').asinteger >= 200) and
          (fieldbyname('Part_Sales_Price').asfloat = 0.00) then
        result := 'Y'

    end;
end;

procedure TJobBagLine.SetWONumber(const Value: integer);
begin
  FWONumber := Value;
end;

procedure TJobBagLine.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TJobBagLine.SetProcess(const Value: integer);
begin
  FProcess := Value;
end;

procedure TJobBagLine.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
end;

procedure TJobBagLine.SetJBLineStatus(const Value: integer);
begin
  FJBLineStatus := Value;
end;

procedure TJobBagLine.SetJBLineStatusText(const Value: string);
begin
  FJBLineStatusText := Value;
end;

procedure TJobBagLine.SetWorksOrderNumber(const Value: double);
begin
  FWorksOrderNumber := Value;
end;

procedure TJobBagLine.SetJustMoved(const Value: boolean);
begin
  FJustMoved := Value;
end;

procedure TJobBagLine.SetSequence(const Value: integer);
begin
  FSequence := Value;
end;

procedure TJobBagLine.SetJBQtyInvoiced(const Value: integer);
begin
  FJBQtyInvoiced := Value;
end;

procedure TJobBagLine.SetReadyToInvoice(const Value: string);
begin
  FReadyToInvoice := Value;
end;

procedure TJobBagLine.SetClearedFundsRec(const Value: boolean);
begin
  FClearedFundsRec := Value;
end;

procedure TJobBagLine.SetClearedFundsReq(const Value: boolean);
begin
  FClearedFundsReq := Value;
end;

procedure TJobBagLine.SetNeedsAuthorising(const Value: boolean);
begin
  FNeedsAuthorising := Value;
end;

procedure TJobBagLine.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
end;

procedure TJobBagLine.SetSuggPrice(const Value: currency);
begin
  FSuggPrice := Value;
end;

procedure TJobBagLine.SetCostPriceOHD(const Value: currency);
begin
  FCostPriceOHD := Value;
end;

procedure TJobBagLine.SetSSPOrig(const Value: currency);
begin
  FSSPOrig := Value;
end;

procedure TJobBagLine.SetQuote(const Value: double);
begin
  FQuote := Value;
end;

procedure TJobBagLine.SetQuoteLineNo(const Value: integer);
begin
  FQuoteLineNo := Value;
end;

procedure TJobBagLine.SetCategory(const Value: integer);
begin
  FCategory := Value;
end;

procedure TJobBagLine.SetCategoryDescr(const Value: string);
begin
  FCategoryDescr := Value;
end;

procedure TJobBagLine.SetOperation(const Value: integer);
begin
  FOperation := Value;
end;

procedure TJobBagLine.SetOperationDescr(const Value: string);
begin
  FOperationDescr := Value;
end;

procedure TJobBagLine.SetPriceUnitDescr(const Value: string);
begin
  FPriceUnitDescr := Value;
end;

procedure TJobBagLine.SetSubCategory(const Value: integer);
begin
  FSubCategory := Value;
end;

procedure TJobBagLine.SetSubCategoryDescr(const Value: string);
begin
  FSubCategoryDescr := Value;
end;

procedure TJobBagLine.SetVATDescription(const Value: string);
begin
  FVATDescription := Value;
end;

procedure TJobBagLine.SetProcessDescr(const Value: string);
begin
  FProcessDescr := Value;
end;

procedure TJobBagLine.SetInternalCostLine(const Value: boolean);
begin
  FInternalCostLine := Value;
end;

procedure TJobBagLine.SetInternalCostMarkupPercentage(const Value: real);
begin
  FInternalCostMarkupPercentage := Value;
end;

procedure TJobBagLine.SetResellerPrice(const Value: currency);
begin
  FResellerPrice := Value;
end;

procedure TJobBagLine.SetJBLineReseller(const Value: currency);
begin
  FJBLineReseller := Value;
end;

{ TdmJobBag }

procedure TdmJobBag.FilterByName(const aName: string);
begin
  with qryJBHeaderGrid do
  begin
    {if aName <> '' then
    begin
      Filter := 'Cust_Name = ''' + aName + '*''';
      Filtered := true;
    end
    else
      Filtered := false;}
  close;
  Filtered := false;
  parambyname('custname').asstring := '%'+aName+'%';
  parambyname('ShowInactive').asstring := ShowInactive;
  open;
  end;
end;

procedure TdmJobBag.FreeCompanyRecord;
begin
  with qrySpare do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

procedure TdmJobBag.LockCompanyRecord;
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

function TdmJobBag.GetCurrentJobBag: integer;
begin
  if qryJBHeaderGrid.RecordCount > 0 then
    Result := qryJBHeaderGrid.FieldByName('Job_Bag').AsInteger
  else
    Result := 0;
end;

procedure TdmJobBag.ListAll;
begin
  with qryJBHeaderGrid do
  begin
    Close;
    Filtered := false;
    parambyname('custname').asstring := '';
    parambyname('ShowInactive').asstring := ShowInactive;
    Open;
  end;
end;

procedure TdmJobBag.SetJBOrder(const Value: TJBOrder);
begin
  FJBOrder := Value;
end;

procedure TdmJobBag.qryJBAllLinesMarginGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  Margin : double;
begin
  if qryJBAllLinesJob_Bag_Line_Sell.IsNull then
    Text := ''
  else
  begin
    if qryJBAllLinesJob_Bag_Line_Sell.AsFloat <> 0 then
      Margin :=
        (qryJBAllLinesJob_Bag_Line_Sell.AsFloat-
         qryJBAllLinesJob_Bag_Line_Cost.AsFloat)/
         qryJBAllLinesJob_Bag_Line_Sell.AsFloat
    else
    if  (qryJBAllLinesJob_Bag_Line_Sell.AsFloat = 0) and
        (qryJBAllLinesJob_Bag_Line_Cost.AsFloat = 0)  then
      Margin := 0.00
    else
      Margin := -999.99;
    Text := FloatToStrF(Margin*100, ffFixed, 15, 2);
  end;
end;

procedure TdmJobBag.ListAllLines(const aKey: integer);
begin
  with qryJBAllLines do
  begin
    Close;
    ParamByname('JobBag').AsInteger := aKey;
    Open;
  end;
end;

function TdmJobBag.GetCurrentLine: integer;
begin
  if qryJBAllLines.RecordCount > 0 then
    Result := qryJBAllLinesJob_Bag_Line.AsInteger
  else
    Result := 0;
end;

function TdmJobBag.GetCurrentLineType: char;
begin
  if qryJBAllLines.RecordCount > 0 then
      Result := qryJBAllLinesJob_Bag_Line_Type.AsString[1]
  else
    Result := #00;
end;

function TdmJobBag.GetHeaderCount: integer;
begin
  Result := qryJBHeaderGrid.RecordCount;
end;

function TdmJobBag.GetLineCount: integer;
begin
  Result := qryJBAllLines.RecordCount;
end;

function TdmJobBag.CalculatePrice(const PriceUnit: integer;
  Quantity, Price: double): double;
var
  Factor : integer;
begin
  with qryPriceUnit do
  begin
    Close;
    ParamByName('Unit').AsInteger := PriceUnit;
    Open;
    Factor := FieldByName('Price_Unit_Factor').AsInteger;
    Close;
    if Factor = 0 then { price per job }
      Result := Price
    else               { price per N }
      Result := (Quantity/Factor) * Price;
  end;
end;

function TdmJobBag.CalculateStockPrice(const PriceUnit: integer;
  Quantity, Price: double): double;
begin
  Result := (Quantity/PriceUnit) * Price;
end;

function TdmJobBag.GetCurrentLineInactive: Boolean;
begin
  Result := false;
  if qryJBAllLines.RecordCount > 0 then
    if qryJBAllLinesPurchase_order.Asfloat <> 0 then
      begin
        with qryPOLine do
          begin
            close;
            parambyname('Purchase_order').asfloat := qryJBAllLinesPurchase_order.Asfloat;
            parambyname('Line').asinteger := qryJBAllLinesLine.Asinteger;
            open;
            result := fieldbyname('Inactive').asstring = 'Y';
          end;
      end;
end;

procedure TdmJobBag.qryJBAllLinesInactiveGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  stext: string;
  iPOStatus, iSOStatus: integer;
begin
  stext := '';
  if qryJBAllLines.RecordCount = 0 then
    exit;
  iPOStatus := 0;
  iSOStatus := 0;
  if qryJBAllLinesPurchase_Order.AsFloat <> 0 then
    begin
      with qryPO do
        begin
          close;
          parambyname('Purchase_Order').asfloat := qryJBAllLinesPurchase_Order.AsFloat;
          parambyname('Line').asinteger := qryJBAllLinesLine.Asinteger;
          open;
          stext := fieldbyname('Status_Description').asstring;
          iPOStatus := fieldbyname('Purch_ord_line_status').asinteger;
          if fieldbyname('Inactive').asstring = 'Y' then
            stext := '*Deleted*';
        end;
    end
  else
  if qryJBAllLinesSales_Order.Asinteger <> 0 then
    begin
      with qrySO do
        begin
          close;
          parambyname('Sales_Order').asfloat := qryJBAllLinesSales_Order.AsInteger;
          open;
          stext := fieldbyname('Description').asstring;
          iSOStatus := fieldbyname('sales_order_head_status').asinteger;
        end;
    end
  else
  if qryJBAllLinesWorks_Order.Asinteger <> 0 then
    begin
      with qryWO do
        begin
          close;
          parambyname('Works_Order').asfloat := qryJBAllLinesWorks_Order.AsInteger;
          open;
          stext := fieldbyname('Description').asstring;
          iSOStatus := fieldbyname('Works_Order_Status').asinteger;
        end;
    end
  else
    stext := 'Sundry Created';

  if (qryJBAllLinesJob_Bag_Line_Invoiced.asstring = 'Y') or (iPOStatus = 30) or (iSOStatus = 250) then
    begin
      qryInvoice.close;
      qryInvoice.parambyname('Job_bag').asinteger := dsJBAllLines.Dataset.fieldbyname('Job_bag').asinteger;
      qryInvoice.parambyname('Line').asinteger := dsJBAllLines.Dataset.fieldbyname('Job_bag_Line').asinteger;
      qryInvoice.parambyname('Purchase_order').asinteger := dsJBAllLines.Dataset.fieldbyname('Purchase_Order').asinteger;
      qryInvoice.parambyname('Sales_order').asinteger := dsJBAllLines.Dataset.fieldbyname('Sales_Order').asinteger;
      qryInvoice.open;

      if qryInvoice.recordcount > 0 then
        begin
          if (qryInvoice.FieldByName('Sales_invoice_no').asstring <> '') then
            stext := qryInvoice.fieldbyname('Sales_invoice_no').asstring
          else
            sText := 'Invoice Raised';
        end;
    end;

  text := sText;
end;

function TdmJobBag.IsCustomerOnStop(tempCust: integer): boolean;
begin
  with qryCust do
    begin
      close;
      parambyname('customer').asinteger := tempCust;
      open;
      result := (fieldbyname('credit_status').AsString = 'S');
      close;
    end;
end;

procedure TdmJobBag.qryJBAllLinesOrderNumberGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryJBAllLines.RecordCount = 0 then
    exit;
  if qryJBAllLinesPurchase_Order.AsFloat <> 0 then
    text := 'PO/'+qryJBAllLinesPurchase_Order.AsString
  else
  if qryJBAllLinesSales_Order.AsFloat <> 0 then
    text := 'SO/'+qryJBAllLinesSales_Order.AsString
  else
  if qryJBAllLinesWorks_Order.AsFloat <> 0 then
    text := 'WI/'+qryJBAllLinesWorks_Order.AsString
  else
    text := 'Sundry';

end;

function TdmJobBag.GetNextJobBagLineNumber(tempno: integer): integer;
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

function TdmJobBag.GetWorksOrderNumber(tempno: integer): integer;
begin
  result := 0;
  with qryGetAllJBLines do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempno;
      open;
      first;
      while eof <> true do
        begin
          if fieldbyname('Job_Bag_line_type').asstring = 'W' then
            result := fieldbyname('Works_Order').asinteger;
          next;
        end;
    end;
end;

function TdmJobBag.GetAccountTeamName(tempno: integer): string;
begin
  with qryGetAccountTeam do
    begin
      close;
      parambyname('Account_Team').asinteger := tempno;
      open;
      result := fieldbyname('Account_team_name').asstring;
    end;
end;

function TdmJobBag.GetOpAccountTeam(tempno: integer): integer;
begin
  with qryGetOpAccountTeam do
    begin
      close;
      parambyname('Operator').asinteger := tempno;
      open;
      result := fieldbyname('Account_team').asinteger;
    end;
end;

function TdmJobBag.GetOpAccountTeamName(tempCode: integer): string;
begin
  with qryGetOpAccountTeam do
    begin
      close;
      parambyname('Operator').asinteger := tempcode;
      open;
      result := fieldbyname('Account_team_name').asstring;
    end;
end;

function TdmJobBag.GetCostCentre(tempCust, tempBranch: integer; tempCC, tempCCLevel: string): string;
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

function TdmJobBag.GetProductionStatus(tempCode: integer): string;
begin
  with qryGetJBProdStatus do
    begin
      close;
      parambyname('Job_Bag_Production_Status').asinteger := tempcode;
      open;
      result := fieldbyname('Job_Bag_Production_Descr').asstring;
    end;
end;

function TdmJobBag.GetCustomerRep(tempCust, tempBranch: integer): integer;
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

function TdmJobBag.GetCustomerSubRep(tempCust, tempBranch: integer): integer;
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

function TdmJobBag.GetRepName(tempCode: integer): string;
begin
  with qryGetRep do
    begin
      close;
      parambyname('Rep').asinteger := tempcode;
      open;
      result := fieldbyname('Name').asstring;
    end;
end;

function TdmJobBag.GetNarrative(const iNarrative: integer): string;
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

procedure TdmJobBag.SaveNarrative(var iNarrative: Integer;
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

function TdmJobBag.GetPOAuthorised(tempCode: real): boolean;
begin
  result := true;
  with qryPOHead do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      open;
      result := (fieldbyname('Needs_Authorising').asstring = 'Y')
    end;
end;

function TdmJobBag.GetPOAuthorisedBy(tempCode: real):integer;
begin
  with qryPOHead do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      open;
      result := (fieldbyname('Authorised_By').asinteger)
    end;
end;

function TdmJobBag.GetPOStatus(tempCode: real; tempLine, JBno, JBline: integer; JBInvoiced: string): string;
var
  POStatus: integer;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;
      result := fieldbyname('Status_Description').asstring;
      POStatus := fieldbyname('purch_ord_line_status').asinteger;
      if fieldbyname('Inactive').asstring = 'Y' then
        result := '*Deleted*';
    end;

  if (JBInvoiced = 'Y') or (POStatus = 30) then
  begin
    with qryInvoice do
      begin
        close;
        parambyname('Job_bag').asinteger := JBno;
        parambyname('Line').asinteger := JBline;
        parambyname('Purchase_order').asfloat := tempcode;
        parambyname('Sales_order').asinteger := 0;
        open;

        if  recordcount > 0 then
        begin
          if (FieldByName('Sales_invoice_no').asstring <> '') then
            result := fieldbyname('Sales_invoice_no').asstring
          else
            result := 'Invoice Raised';
        end;
      end;
  end;
end;

function TdmJobBag.GetSOStatusDescr(tempCode: integer): string;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asfloat := tempCode;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

function TdmJobBag.GetSOLineOrderQty(tempCode, tempLine: integer): integer;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Quantity_Ordered').asinteger;
    end;
end;

function TdmJobBag.GetSOLineCostPack(tempCode, tempLine: integer): integer;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Purch_Pack_Quantity').asinteger;
    end;
end;

function TdmJobBag.GetSOLineSellPack(tempCode, tempLine: integer): integer;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Sell_Pack_Quantity').asinteger;
    end;
end;

function TdmJobBag.GetSOLineCostPrice(tempCode, tempLine: integer): real;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_Cost').asfloat;
    end;
end;

function TdmJobBag.GetSOLineSellPrice(tempCode, tempLine: integer): real;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      if trim(fieldbyname('Discount_type').asstring) = '' then
        result := fieldbyname('Part_Sales_Price').asfloat
      else
        result := fieldbyname('Discount_Value').asfloat;
    end;
end;

function TdmJobBag.GetSOLineDeliveryQty(tempCode, tempLine: integer): integer;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Quantity_Delivered').asinteger;
    end;
end;

function TdmJobBag.GetSOStatus(tempCode, JBno, JBline: integer; JBInvoiced: string): string;
var
  SOStatus: integer;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asfloat := tempCode;
      open;
      SOStatus := fieldbyname('sales_order_head_Status').asinteger;
      result := fieldbyname('Description').asstring;
    end;

  if (JBInvoiced = 'Y') or (SOStatus = 250) then
  begin
    with qryInvoice do
      begin
        close;
        parambyname('Job_bag').asinteger := JBno;
        parambyname('Line').asinteger := JBLine;
        parambyname('Purchase_order').asinteger := 0;
        parambyname('Sales_order').asinteger := tempCode;
        open;

        if  recordcount > 0 then
        begin
          if (FieldByName('Sales_invoice_no').asstring <> '') then
            result := fieldbyname('Sales_invoice_no').asstring
          else
            result := 'Invoice Raised';
        end;
      end;
  end;
end;

function TdmJobBag.GetWOStatus(tempCode, JBno, JBline: integer; JBInvoiced: string): string;
begin
  with qryWO do
    begin
      close;
      parambyname('Works_Order').asfloat := qryJBAllLinesWorks_Order.AsInteger;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

function TdmJobBag.GetSundryStatus(JBno, JBline: integer; JBInvoiced: string): string;
begin
  result := 'Sundry Created';
  if (JBInvoiced = 'Y') then
  begin
    with qryInvoice do
      begin
        close;
        parambyname('Job_bag').asinteger := JBno;
        parambyname('Line').asinteger := JBline;
        parambyname('Purchase_order').asfloat := 0;
        parambyname('Sales_order').asinteger := 0;
        open;

        if  recordcount > 0 then
        begin
          if (FieldByName('Sales_invoice_no').asstring <> '') then
            result := fieldbyname('Sales_invoice_no').asstring
          else
            result := 'Invoice Raised';
        end;
      end;
  end;
end;

function TdmJobBag.GetPartDescr(TempCode: String): string;
begin
 with GetPartDetailsSQL do
  begin
    Close;
    ParamByName('Part').AsString := TempCode;
    Open;
    Result := FieldByName('Part_Description').AsString;
    Close;
  end;
end;

function TdmJobBag.GetJobBagLineCost(tempCode, tempLine: integer): real;
begin
  with qryJBLine do
    begin
      Close;
      ParamByName('JobBag').AsInteger := tempCode;
      ParamByName('Line').AsInteger := tempLine;
      Open;

      result := fieldbyname('Job_bag_line_cost').asfloat;
    end;
end;

function TdmJobBag.GetJobBagLineQty(tempCode, tempLine: integer): integer;
begin
  with qryJBLine do
    begin
      Close;
      ParamByName('JobBag').AsInteger := tempCode;
      ParamByName('Line').AsInteger := tempLine;
      Open;

      result := fieldbyname('Job_bag_Quantity').asinteger;
    end;
end;

function TdmJobBag.GetJobBagLineSell(tempCode, tempLine: integer): real;
begin
  with qryJBLine do
    begin
      Close;
      ParamByName('JobBag').AsInteger := tempCode;
      ParamByName('Line').AsInteger := tempLine;
      Open;

      result := fieldbyname('Job_bag_line_sell').asfloat;
    end;
end;

function TdmJobBag.GetJobBagLineReseller(tempCode, tempLine: integer): real;
begin
  with qryJBLine do
    begin
      Close;
      ParamByName('JobBag').AsInteger := tempCode;
      ParamByName('Line').AsInteger := tempLine;
      Open;

      result := fieldbyname('Job_bag_line_Reseller').asfloat;
    end;
end;

function TdmJobBag.GetJobBagLineInvoiced(tempCode, tempLine: integer): string;
begin
  with qryJBLine do
    begin
      Close;
      ParamByName('JobBag').AsInteger := tempCode;
      ParamByName('Line').AsInteger := tempLine;
      Open;

      result := fieldbyname('Job_bag_line_Invoiced').asstring;
    end;
end;

function TdmJobBag.GetSupplierName(tempCode: integer): string;
begin
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempCode;
      open;
      result := fieldbyname('Supplier_Name').asstring
    end;
end;

function TdmJobBag.GetWONumber(tempno: integer): double;
begin
  with qryGetWorksOrder do
    begin
      close;
      parambyname('Works_order').asinteger := tempNo;
      open;
      result := fieldbyname('Works_order_Number').asfloat;
    end;
end;

function TdmJobBag.GetSalesOrderStatus(SOno: integer): integer;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asinteger := SOno;
      open;
      result := fieldbyname('sales_order_head_Status').asinteger;
    end;
end;

function TdmJobBag.GetPOClearedFunds(tempCode: real; tempLine: integer): boolean;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;
      result := (fieldbyname('Cash_Sale').asstring = 'Y') and (fieldbyname('Inactive').AsString <> 'Y')
    end;
end;

function TdmJobBag.GetInvClearedFunds(tempCode: real;
  tempLine: integer): boolean;
begin
  with qrySalesInvoice do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;
      result := (fieldbyname('Paid_Status').asstring = 'Y') or (fieldbyname('Paid_Status').asstring = 'P')
    end;
end;

function TdmJobBag.GetPOOperator(tempCode: real): integer;
begin
  result := 0;
  with qryPOHead do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      open;
      result := fieldbyname('Operator').asinteger;
    end;
end;

function TdmJobBag.GetJobBagTotalSalesInvoiced(tempCode: integer): real;
begin
  result := 0;
  with qryAllSalesInvoices do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      open;

      first;
      while eof <> true do
        begin
          result := result + fieldbyname('Total_Goods').asfloat;
          next;
        end;
      first;
    end;

end;

function TdmJobBag.GetJobBagTotalPurchInvoiced(tempCode: integer): real;
begin
  result := 0;
  with qryAllPurchInvoices do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      open;

      first;
      while eof <> true do
        begin
          result := result + fieldbyname('Total_Goods').asfloat;
          next;
        end;
      first;
    end;
end;

function TdmJobBag.GetPartProductType(tempCode: string): integer;
begin
 with GetPartDetailsSQL do
  begin
    Close;
    ParamByName('Part').AsString := TempCode;
    Open;
    Result := FieldByName('Product_Type').Asinteger;
    Close;
  end;
end;

function TdmJobBag.GetCustomerDefVAT(tempCust: integer): integer;
begin
  with qryCust do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Vat_Code_Def').asinteger;
    end;
end;

function TdmJobBag.GetDataCollectTotals(iJobBag, iDept: integer; var rTotalLabour, rTotalOvertime, rTotalMachine: double): boolean;
begin
  with qryGetDataCollectTotals do
    begin
      close;
      parambyname('Job_Bag').asinteger := iJobBag;
      parambyname('Process_Group').asinteger := iDept;
      open;

      rTotalLabour := fieldbyname('Total_Labour').asfloat;
      rTotalOvertime := fieldbyname('Total_Overtime').asfloat;
      rTotalMachine := fieldbyname('Total_Machine').asfloat;
    end;
end;

function TdmJobBag.GetContactAccountNo(tempCust, tempBranch, tempCode: integer): string;
begin
  with qryGetCustomerContact do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      parambyname('Branch_no').asinteger := tempBranch;
      parambyname('Contact_no').asinteger := tempCode;
      open;
      result := fieldbyname('Account_Number').asstring;
    end;
end;

procedure TdmJobBag.UpdateQuoteStatus(tempCode: double; tempStatus: integer);
begin
  with qryUpdQuoteStatus do
    begin
      close;
      parambyname('Quote').asfloat := tempCode;
      parambyname('Quote_Status').asinteger := tempStatus;
      execsql;
    end;
end;

procedure TdmJobBag.GetDataCollectCosts(iJobBag: integer; var slProduction: TStringList);
var
  icount: integer;
  iProcessGroup: integer;
  tempStr: string;
begin
  with qryDataCollectCosts do
    begin
      close;
      parambyname('Job_Bag').asinteger := iJobBag;
      open;

      iProcessGroup := 0;
      while not eof do
        begin
          {new Process}
          if fieldbyname('Process_Group').asinteger <> iProcessGroup then
            begin
              if fieldbyname('Record_Type').asinteger = 1 then
                begin
                  tempStr := FieldByName('Process_Group_Description').asString + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Labour_Cost').asfloat, ffFixed, 15, 2) + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Overtime_Cost').asfloat, ffFixed, 15, 2) + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Machine_Cost').asfloat, ffFixed, 15, 2) + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Click_Cost').asfloat, ffFixed, 15, 2) + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Total_Production_Cost').asfloat, ffFixed, 15, 2) + '#';
                end
              else
                begin
                  tempStr := FieldByName('Process_Group_Description').asString + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Labour_Cost').asfloat, ffFixed, 15, 2) + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Overtime_Cost').asfloat, ffFixed, 15, 2) + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Machine_Cost').asfloat, ffFixed, 15, 2) + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Click_Cost').asfloat, ffFixed, 15, 2) + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Total_Production_Cost').asfloat, ffFixed, 15, 2) + '#';
                  tempStr := tempStr + FloatToStrF(fieldbyname('Total_Estimated_Cost').asfloat, ffFixed, 15, 2) + '#';
                end;
            end
          else
            begin
              tempStr := tempStr + FloatToStrF(fieldbyname('Total_Estimated_Cost').asfloat, ffFixed, 15, 2) + '#';
            end;
          iProcessGroup := fieldbyname('Process_Group').asinteger;
          next;
          if (fieldbyname('Process_Group').asinteger <> iProcessGroup) and
             (iProcessGroup <> 0) then
            begin
              tempStr := tempStr + fieldbyname('Job_Bag').asstring;
              slProduction.Add(tempStr);
            end;
        end;

      {Add the last record if process groups have been found}
      if iProcessGroup <> 0 then
        begin
          tempStr := tempStr + fieldbyname('Job_Bag').asstring;
          slProduction.Add(tempStr);
        end;
      close;
    end;
end;

function TdmJobBag.GetSOLineVatCode(tempCode, tempLine: integer): integer;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempCode;
      parambyname('Sales_Order_line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Vat_Code').asinteger;
    end;
end;

function TdmJobBag.GetDeliveryDescription(iTempCode, iTempBranch,
  iTempType: integer): string;
begin
  { Some callers depend on the dataset being left open after the call
    so leave it dangling. }
  {Build a suitable description for the delivery}
  if iTempType = 0 then {Ad-hoc address}
  begin
    AddrSRC.DataSet := GetAddHocAddrSQL;
    with GetAddHocAddrSQL do
    begin
      Close;
      ParamByName('Ad_Hoc_Address').AsInteger := iTempCode;
      Open;
      Result := 'Ad Hoc:  ' + FieldByName('Name').AsString;
    end;
  end
  else
    if iTempType = 2 then {Rep address}
    begin
      AddrSRC.DataSet := GetRepAddrSQL;
      with GetRepAddrSQL do
      begin
        Close;
        ParamByName('Rep').AsInteger := iTempCode;
        Open;
        Result := 'Rep   :  ' + FieldByName('Name').AsString;
      end;
    end
    else
      if iTempType = 3 then {Customer address}
      begin
        AddrSRC.DataSet := GetCustAddrSQL;
        with GetCustAddrSQL do
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
        if iTempType = 1 then {Supplier address}
        begin
          AddrSRC.DataSet := GetSuppAddrSQL;
          with GetSuppAddrSQL do
          begin
            Close;
            ParamByName('Supplier').AsInteger := iTempcode;
            ParamByName('Branch_No').AsInteger := iTempBranch;
            Open;
            Result := 'Supp/Br:  ' + Trim(FieldByName('Name').AsString) + ', ' +
              Trim(FieldByName('Branch_Name').AsString);
          end;
        end
      else
        begin
          if iTempBranch <> 0 then
            begin
              AddrSRC.DataSet := GetCompBrAddrSQL;
              with GetCompBrAddrSQL do
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
              AddrSRC.DataSet := GetCompAddrSQL;
              with GetCompAddrSQL do
              begin
                Close;
                Open;
                Result := 'Here:  ' + FieldByName('Name').AsString;
              end;
            end;
        end;
end;

function TdmJobBag.GetPriceUnitFactor(tempCode: integer): integer;
begin
  with qryPriceUnit do
    begin
      close;
      parambyname('Unit').asinteger := tempCode;
      open;
      result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

function TdmJobBag.GetCustomerInvoiceAccountCode(tempCust, tempBranch: integer): boolean;
begin
  result := false;
  with qryGetCustomerAccount do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      parambyname('Branch_no').asinteger := tempBranch;
      open;
      result := (trim(fieldbyname('Account_Code').asstring) <> '');
    end;
end;

{ TJobBagWOrders }

procedure TJobBagWOrders.Add(aWorksOrder: TJobBagWOrder);
begin
  FItems.Add(aWorksOrder);
end;

procedure TJobBagWOrders.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagWOrder(FItems[i]).Free;
end;

function TJobBagWOrders.Clone: TJobBagWOrders;
var
  i : integer;
begin
  Result := TJobBagWOrders.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJobBagWOrder(FItems[i]).Clone);
end;

constructor TJobBagWOrders.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
  FItems := TList.Create;
end;

procedure TJobBagWOrders.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJobBagWOrders.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagWOrder(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJobBagWOrders.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJobBagWOrders.GetItems(Index: integer): TJobBagWOrder;
begin
  Result := TJobBagWOrder(FItems[Index]);
end;

function TJobBagWOrders.IndexOf(const WorksOrderNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagWOrder(FItems[i]).JBWorksOrderNo = WorksOrderNo then
      Result := i;
end;

procedure TJobBagWOrders.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagWOrder(FItems[i]).JBWorksOrderNo := (i+1);
end;

procedure TJobBagWOrders.SetItems(Index: integer; const Value: TJobBagWOrder);
begin
  FItems[Index] := Value;
end;

{ TJobBagWOrder }

function TJobBagWOrder.Clone: TJobBagWOrder;
begin
  Result := TJobBagWOrder.Create(FParent);
  Result.Quantity           :=           self.Quantity;
  Result.WODate             :=           self.WODate;
  Result.StartDate          :=           self.StartDate;
  Result.MailDate           :=           self.MailDate;
  Result.JBWorksOrderNo     :=           self.JBWorksOrderNo;
  Result.WorksOrderNumber   :=           self.WorksOrderNumber;
  Result.OriginalWIN        :=           self.OriginalWIN;
  Result.Description        :=           self.Description;
  Result.PreviousWIN        :=           self.PreviousWIN;
  Result.Status             :=           self.Status;
  Result.StatusDescription  :=           self.StatusDescription;
end;

constructor TJobBagWOrder.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
end;

destructor TJobBagWOrder.Destroy;
begin

  inherited;
end;

procedure TJobBagWOrder.LoadFromDB;
begin
  with FParent.FDataModule.qryJBWorks do
  begin
    Close;
    ParamByName('Job_Bag').AsInteger := Parent.DbKey;
    ParamByName('Works_Order_No').AsInteger := JBWorksOrderNo;
    Open;
    WorksOrder := FieldByName('Works_Order').asinteger;
    WorksOrderNumber := FieldByName('Works_Order_Number').asfloat;
    Description := FieldByName('Description').asstring;
    WODate := FieldByName('Date_Point').asdatetime;
    MailDate := FieldByName('Date_Required').asdatetime;
    StartDate := FieldByName('Date_Start').asdatetime;
    Quantity := FieldByName('Actual_Quantity').asinteger;
    Status := Fieldbyname('Works_Order_Status').asinteger;
    StatusDescription := Fieldbyname('Status_Description').asstring;
    Close;
  end;
end;

procedure TJobBagWOrder.SaveToDB;
begin
  with FParent.FDataModule.qryJBAddWorks do
  begin
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Works_Order_No').AsInteger := JBWorksOrderNo;
    ParamByName('Works_Order').asinteger := WorksOrder;
    ExecSQL;
  end;
end;

procedure TJobBagWOrder.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TJobBagWOrder.SetJBWorksOrderNo(const Value: integer);
begin
  FJBWorksOrderNo := Value;
end;

procedure TJobBagWOrder.SetMailDate(const Value: TDateTime);
begin
  FMailDate := Value;
end;

procedure TJobBagWOrder.SetOriginalWIN(const Value: integer);
begin
  FOriginalWIN := Value;
end;

procedure TJobBagWOrder.SetParent(const Value: TJobBag);
begin
  FParent := Value;
end;

procedure TJobBagWOrder.SetPreviousWIN(const Value: double);
begin
  FPreviousWIN := Value;
end;

procedure TJobBagWOrder.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TJobBagWOrder.SetStartDate(const Value: TDateTime);
begin
  FStartDate := Value;
end;

procedure TJobBagWOrder.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TJobBagWOrder.SetStatusDescription(const Value: string);
begin
  FStatusDescription := Value;
end;

procedure TJobBagWOrder.SetWODate(const Value: TDateTime);
begin
  FWODate := Value;
end;

procedure TJobBagWOrder.SetWorksOrder(const Value: integer);
begin
  FWorksOrder := Value;
end;

procedure TJobBagWOrder.SetWorksOrderNumber(const Value: double);
begin
  FWorksOrderNumber := Value;
end;

{ TJobBagDocs }

procedure TJobBagDocs.Add(aDocument: TJobBagDoc);
begin
  FItems.Add(aDocument);
end;

procedure TJobBagDocs.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagDoc(FItems[i]).Free;
end;

function TJobBagDocs.Clone: TJobBagDocs;
var
  i : integer;
begin
  Result := TJobBagDocs.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJobBagDoc(FItems[i]).Clone);
end;

constructor TJobBagDocs.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
  FItems := TList.Create;
end;

procedure TJobBagDocs.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJobBagDocs.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagDoc(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJobBagDocs.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJobBagDocs.GetItems(Index: integer): TJobBagDoc;
begin
  Result := TJobBagDoc(FItems[Index]);
end;

function TJobBagDocs.IndexOf(const DocumentNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagDoc(FItems[i]).JBDocumentNo = DocumentNo then
      Result := i;
end;

procedure TJobBagDocs.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagDoc(FItems[i]).JBDocumentNo := (i+1);
end;

procedure TJobBagDocs.SetItems(Index: integer; const Value: TJobBagDoc);
begin
  FItems[Index] := Value;
end;

{ TJobBagDoc }

function TJobBagDoc.Clone: TJobBagDoc;
begin
  Result := TJobBagDoc.Create(FParent);
  Result.DocumentDate := Self.DocumentDate;
  Result.DocumentTitle :=    Self.DocumentTitle;
  Result.DocumentPath :=    Self.DocumentPath;
  Result.JBDocumentNo :=    Self.JBDocumentNo;
  Result.Operator := self.Operator;
  Result.OperatorName := self.OperatorName;
  Result.CreatedBy := self.CreatedBy;
end;

constructor TJobBagDoc.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
end;

destructor TJobBagDoc.Destroy;
begin
  inherited;
end;

procedure TJobBagDoc.LoadFromDB;
begin
  with FParent.FDataModule.qryJBDocument do
  begin
    Close;
    ParamByName('JobBag').AsInteger := FParent.DbKey;
    ParamByName('Document_no').AsInteger := JBDocumentNo;
    Open;
    DocumentDate := FieldByName('Date_Created').asdatetime;
    DocumentPath := FieldByName('Document').Asstring;
    DocumentTitle := FieldByName('Document_Title').Asstring;
    Operator := FieldByName('Operator').AsInteger;
    OperatorName := FieldByName('Operator_Name').asstring;
    CreatedBy := FieldByName('Created_By').asstring;
  end;
end;

procedure TJobBagDoc.SaveToDB;
begin
  with FParent.FDataModule.qryJBAddDocument do
  begin
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Document_No').AsInteger := JBDocumentNo;
    ParamByName('Date_Created').AsDateTime := DocumentDate;
    ParamByName('Document_Title').asstring := DocumentTitle;
    ParamByName('Document').asstring := DocumentPath;
    if Operator = 0 then
      ParamByName('Operator').clear
    else
      ParamByName('Operator').AsInteger := Operator;

    ParamByName('Created_By').asstring := CreatedBy;
    ExecSQL;
  end;

end;

procedure TJobBagDoc.SetCreatedBy(const Value: string);
begin
  FCreatedBy := Value;
end;

procedure TJobBagDoc.SetDocumentDate(const Value: TDateTime);
begin
  FDocumentDate := Value;
end;

procedure TJobBagDoc.SetDocumentPath(const Value: string);
begin
  FDocumentPath := Value;
end;

procedure TJobBagDoc.SetDocumentTitle(const Value: string);
begin
  FDocumentTitle := Value;
end;

procedure TJobBagDoc.SetJBDocumentNo(const Value: integer);
begin
  FJBDocumentNo := Value;
end;

procedure TJobBagDoc.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TJobBagDoc.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TJobBagDoc.SetParent(const Value: TJobBag);
begin
  FParent := Value;
end;

{ TJobBagProcesses }

procedure TJobBagProcesses.Add(aProcess: TJobBagProcess);
begin
  FItems.Add(aProcess);
end;

procedure TJobBagProcesses.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagProcess(FItems[i]).Free;
end;

function TJobBagProcesses.Clone: TJobBagProcesses;
var
  i : integer;
begin
  Result := TJobBagProcesses.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJobBagProcess(FItems[i]).Clone);
end;

constructor TJobBagProcesses.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
  FItems := TList.Create;
end;

procedure TJobBagProcesses.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJobBagProcesses.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagProcess(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJobBagProcesses.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJobBagProcesses.GetItems(Index: integer): TJobBagProcess;
begin
  Result := TJobBagProcess(FItems[Index]);
end;

function TJobBagProcesses.IndexOf(const ProcessNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagProcess(FItems[i]).JBProcessNo = ProcessNo then
      Result := i;
end;

procedure TJobBagProcesses.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagProcess(FItems[i]).JBProcessNo := (i+1);
end;

procedure TJobBagProcesses.SetItems(Index: integer;
  const Value: TJobBagProcess);
begin
  FItems[Index] := Value;
end;

{ TJobBagProcess }

function TJobBagProcess.Clone: TJobBagProcess;
begin
  Result := TJobBagProcess.Create(FParent);
  Result.JBProcessNo          :=    Self.JBProcessNo;
  Result.NoOfHours            :=    Self.NoOfHours;
  Result.NoOfElements         :=    Self.NoOfElements;
  Result.PaperSize            :=    Self.PaperSize;
  Result.PaperSizeDescription :=    Self.PaperSizeDescription;
  Result.PaperDepth           :=    Self.PaperDepth;
  Result.PaperWidth           :=    Self.PaperWidth;
  Result.Process              :=    Self.Process;
  Result.ProcessGroup         :=    self.ProcessGroup;
  Result.ProcessGroupName     :=    self.ProcessGroupName;
  Result.ProcessName          :=    Self.ProcessName;
  Result.Quantity             :=    Self.Quantity;
  Result.SimplexDuplex        :=    Self.SimplexDuplex;
  Result.IsUsed               :=    self.IsUsed;
  Result.WorkCentreGroup      :=    Self.WorkCentreGroup;
  Result.WorkCentreGroupName  :=    Self.WorkCentreGroupName;
end;

constructor TJobBagProcess.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
end;

destructor TJobBagProcess.Destroy;
begin
  inherited;
end;

procedure TJobBagProcess.LoadFromDB;
begin
  with FParent.FDataModule.qryJBProcess do
  begin
    Close;
    ParamByName('JobBag').AsInteger := FParent.DbKey;
    ParamByName('Process_no').AsInteger := JBProcessNo;
    Open;
    Process := fieldbyName('Process').AsInteger;
    ProcessName := fieldbyName('Process_Description').Asstring;

    ProcessGroup := fieldbyname('Process_Group').asinteger;
    ProcessGroupName := fieldbyname('Process_Group_Description').asstring;

    isUsed := false;
(*    PaperDepth := fieldbyname('Paper_depth_mm').asinteger;
    PaperWidth := fieldbyname('Paper_Width_mm').asinteger;

    PaperSize := fieldByName('Paper_Size').AsInteger;
    PaperSizeDescription := fieldByName('Paper_Size_Description').AsString;
    WorkCentreGroup := fieldByName('Work_Centre_Group').Asinteger;
    WorkCentreGroupName := fieldByName('Work_Centre_Group_Name').Asstring;
    NoOfElements := fieldByName('No_of_Elements').asinteger;
    Quantity := fieldbyname('Quantity').asfloat;
    NoOfHours := fieldbyname('No_of_hours').asfloat;
    SimplexDuplex := fieldbyname('Simplex_or_Duplex').asstring;
*)
  end;
end;

procedure TJobBagProcess.SaveToDB;
begin
  with FParent.FDataModule.qryJBAddProcess do
  begin
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Process_No').AsInteger := JBProcessNo;
    ParamByName('Process').AsInteger := Process;
    if PaperSize = 0 then
      ParamByName('Paper_Size').clear
    else
      ParamByName('Paper_Size').AsInteger := PaperSize;
    ParamByName('Paper_Depth_mm').AsInteger := PaperDepth;
    ParamByName('Paper_Width_mm').AsInteger := PaperWidth;
    ParamByName('No_of_Elements').AsInteger := NoOfElements;
    ParamByName('No_of_Hours').Asfloat := NoOfHours;
    ParamByName('Quantity').Asfloat := Quantity;
    if WorkCentreGroup = 0 then
      ParamByName('Work_Centre_Group').clear
    else
      ParamByName('Work_Centre_Group').AsInteger := WorkCentreGroup;
    ParamByName('Simplex_or_Duplex').Asstring := self.SimplexDuplex;
    ExecSQL;
  end;
end;

procedure TJobBagProcess.SetIsUsed(const Value: boolean);
begin
  FIsUsed := Value;
end;

procedure TJobBagProcess.SetJBProcessNo(const Value: integer);
begin
  FJBProcessNo := Value;
end;

procedure TJobBagProcess.SetNoOfElements(const Value: integer);
begin
  FNoOfElements := Value;
end;

procedure TJobBagProcess.SetNoOfHours(const Value: double);
begin
  FNoOfHours := Value;
end;

procedure TJobBagProcess.SetPaperDepth(const Value: integer);
begin
  FPaperDepth := Value;
end;

procedure TJobBagProcess.SetPaperSize(const Value: integer);
begin
  FPaperSize := Value;
end;

procedure TJobBagProcess.SetPaperSizeDescription(const Value: string);
begin
  FPaperSizeDescription := Value;
end;

procedure TJobBagProcess.SetPaperWidth(const Value: integer);
begin
  FPaperWidth := Value;
end;

procedure TJobBagProcess.SetParent(const Value: TJobBag);
begin
  FParent := Value;
end;

procedure TJobBagProcess.SetProcess(const Value: integer);
begin
  FProcess := Value;
end;

procedure TJobBagProcess.SetProcessGroup(const Value: integer);
begin
  FProcessGroup := Value;
end;

procedure TJobBagProcess.SetProcessGroupName(const Value: string);
begin
  FProcessGroupName := Value;
end;

procedure TJobBagProcess.SetProcessName(const Value: string);
begin
  FProcessName := Value;
end;

procedure TJobBagProcess.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TJobBagProcess.SetSimplexDuplex(const Value: string);
begin
  FSimplexDuplex := Value;
end;

procedure TJobBagProcess.SetWorkCentreGroup(const Value: integer);
begin
  FWorkCentreGroup := Value;
end;

procedure TJobBagProcess.SetWorkCentreGroupName(const Value: string);
begin
  FWorkCentreGroupName := Value;
end;

{ TJobBagScheds }

procedure TJobBagScheds.Add(aSchedule: TJobBagSched);
begin
  FItems.Add(aSchedule);
end;

procedure TJobBagScheds.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagSched(FItems[i]).Free;
end;

function TJobBagScheds.Clone: TJobBagScheds;
var
  i : integer;
begin
  Result := TJobBagScheds.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJobBagSched(FItems[i]).Clone);
end;

constructor TJobBagScheds.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
  FItems := TList.Create;
end;

procedure TJobBagScheds.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJobBagScheds.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagScheds(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJobBagScheds.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJobBagScheds.GetItems(Index: integer): TJobBagSched;
begin
  Result := TJobBagSched(FItems[Index]);
end;

function TJobBagScheds.IndexOf(const ScheduleNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagSched(FItems[i]).JBScheduleNo = ScheduleNo then
      Result := i;
end;

procedure TJobBagScheds.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagSched(FItems[i]).JBScheduleNo := (i+1);
end;

procedure TJobBagScheds.SetItems(Index: integer;
  const Value: TJobBagSched);
begin
  FItems[Index] := Value;
end;

{ TJobBagSched }

function TJobBagSched.Clone: TJobBagSched;
begin
  Result := TJobBagSched.Create(FParent);
  Result.JBScheduleNo :=    Self.JBScheduleNo;
  Result.ApprovalType :=        self.ApprovalType;
  Result.Narrative  :=          self.Narrative;
  Result.NarrativeText  :=      self.NarrativeText;
  Result.Operator :=            self.Operator;
  Result.OperatorName :=        self.OperatorName;
  Result.ArtRequired  :=        Self.ArtRequired;
  Result.ArtDueDate :=          Self.ArtDueDate;
  Result.ArtProofDate :=        Self.ArtProofDate;
  Result.ArtApprovalDate :=     Self.ArtApprovalDate;
  Result.DSRequired :=          Self.DSRequired;
  Result.DataAvailableDate :=   Self.DataAvailableDate;
  Result.DataRequiredDate :=    Self.DataRequiredDate;
  Result.BriefRequiredDate  :=  Self.BriefRequiredDate;
  Result.TextRequiredDate :=    Self.TextRequiredDate;
  Result.BriefAvailableDate :=  Self.BriefAvailableDate;
  Result.TextAvailableDate  :=  Self.TextAvailableDate;
  Result.TextProofDate  :=      Self.TextProofDate;
  Result.PDFProofArtworkDate := Self.PDFProofArtworkDate;
  Result.PDFProofRequiredDate := Self.PDFProofRequiredDate;
  Result.PDFProofApprovalDate := Self.PDFProofApprovalDate;
  Result.ProofRequiredDate  :=  Self.ProofRequiredDate;
  Result.ProofApprovalDate  :=  Self.ProofApprovalDate;
  Result.SamplesRequired  :=    Self.SamplesRequired;
  Result.SampleToClientDate :=  Self.SampleToClientDate;
  Result.SampleApprovalDate :=  Self.SampleApprovalDate;
  Result.ScheduleApproved :=    Self.ScheduleApproved;
  Result.ScheduleDate :=        Self.ScheduleDate;
  Result.ArtDueDateAct :=           Self.ArtDueDateAct;
  Result.ArtProofDateAct :=         Self.ArtProofDateAct;
  Result.ArtApprovalDateAct :=      Self.ArtApprovalDateAct;
  Result.DataAvailableDateAct :=    Self.DataAvailableDateAct;
  Result.DataRequiredDateAct :=     Self.DataRequiredDateAct;
  Result.BriefRequiredDateAct  :=   Self.BriefRequiredDateAct;
  Result.TextRequiredDateAct :=     Self.TextRequiredDateAct;
  Result.BriefAvailableDateAct :=   Self.BriefAvailableDateAct;
  Result.TextAvailableDateAct  :=   Self.TextAvailableDateAct;
  Result.TextProofDateAct  :=       Self.TextProofDateAct;
  Result.PDFProofArtworkDateAct :=  Self.PDFProofArtworkDateAct;
  Result.PDFProofRequiredDateAct := Self.PDFProofRequiredDateAct;
  Result.PDFProofApprovalDateAct := Self.PDFProofApprovalDateAct;
  Result.ProofRequiredDateAct  :=   Self.ProofRequiredDateAct;
  Result.ProofApprovalDateAct  :=   Self.ProofApprovalDateAct;
  Result.SampleToClientDateAct :=   Self.SampleToClientDateAct;
  Result.SampleApprovalDateAct :=   Self.SampleApprovalDateAct;
end;

constructor TJobBagSched.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
end;

destructor TJobBagSched.Destroy;
begin
  inherited;
end;

procedure TJobBagSched.LoadFromDB;
begin
  with FParent.FDataModule.qryJBSchedule do
  begin
    Close;
    ParamByName('JobBag').AsInteger := FParent.DbKey;
    ParamByName('Schedule_no').AsInteger := JBScheduleNo;
    Open;
    ApprovalType :=         Fieldbyname('Schedule_Approval_Type').asstring;
    Narrative :=            Fieldbyname('Narrative').asinteger;
    NarrativeText :=        parent.FDataModule.GetNarrative(Narrative);
    Operator :=             Fieldbyname('Operator').asinteger;
    OperatorName :=         Fieldbyname('Operator_Name').asstring;
    ScheduleDate :=         Fieldbyname('Date_Point').asdatetime;
    ArtRequired  :=        (Fieldbyname('Artwork_Required').asstring = 'Y');
    ArtDueDate :=           Fieldbyname('Artwork_Due_Date').asdatetime;
    ArtProofDate :=         Fieldbyname('Artwork_Proof_Date').asdatetime;
    ArtApprovalDate :=      Fieldbyname('Artwork_Approval_Date').asdatetime;
    DSRequired :=           (Fieldbyname('Data_Services_Required').asstring = 'Y');
    DataRequiredDate :=     Fieldbyname('Data_Required_Date').asdatetime;
    BriefRequiredDate  :=   Fieldbyname('Brief_Required_Date').asdatetime;
    TextRequiredDate :=     Fieldbyname('Text_Required_Date').asdatetime;
    BriefAvailableDate :=   Fieldbyname('Brief_Available_Date').asdatetime;
    DataAvailableDate :=    Fieldbyname('Data_Available_Date').asdatetime;
    TextAvailableDate  :=   Fieldbyname('Text_Available_Date').asdatetime;
    TextProofDate  :=       Fieldbyname('Text_Proof_Date').asdatetime;

    PDFProofArtworkDate  :=   Fieldbyname('PDF_Proof_Artwork_Date').asdatetime;
    PDFProofRequiredDate  :=   Fieldbyname('PDF_Proof_Required_Date').asdatetime;
    PDFProofApprovalDate  :=   Fieldbyname('PDF_Proof_Approval_Date').asdatetime;

    ProofRequiredDate  :=   Fieldbyname('Proof_Required_Date').asdatetime;
    ProofApprovalDate  :=   Fieldbyname('Proof_Approval_Date').asdatetime;

    SamplesRequired  :=     (Fieldbyname('Samples_Required').asstring = 'Y');
    SampleToClientDate :=   Fieldbyname('Sample_To_Client').asdatetime;
    SampleApprovalDate :=   Fieldbyname('Sample_Approval').asdatetime;
    ScheduleApproved :=     (Fieldbyname('Schedule_Approved').asstring = 'Y');

    ArtDueDateAct :=           Fieldbyname('Artwork_Due_Date_Act').asdatetime;
    ArtProofDateAct :=         Fieldbyname('Artwork_Proof_Date_Act').asdatetime;
    ArtProofDateAct :=         Fieldbyname('Artwork_Approval_Date_Act').asdatetime;
    DataRequiredDateAct :=     Fieldbyname('Data_Required_Date_Act').asdatetime;
    BriefRequiredDateAct  :=   Fieldbyname('Brief_Required_Date_Act').asdatetime;
    DataAvailableDateAct :=    Fieldbyname('Data_Available_Date_Act').asdatetime;
    TextRequiredDateAct :=     Fieldbyname('Text_Required_Date_Act').asdatetime;
    BriefAvailableDateAct :=   Fieldbyname('Brief_Available_Date_Act').asdatetime;
    DataAvailableDateAct :=    Fieldbyname('Data_Available_Date_Act').asdatetime;
    TextAvailableDateAct  :=   Fieldbyname('Text_Available_Date_Act').asdatetime;
    TextProofDateAct  :=       Fieldbyname('Text_Proof_Date_Act').asdatetime;

    PDFProofArtworkDateAct  :=   Fieldbyname('PDF_Proof_Artwork_Date_Act').asdatetime;
    PDFProofRequiredDateAct  :=   Fieldbyname('PDF_Proof_Required_Date_Act').asdatetime;
    PDFProofApprovalDateAct  :=   Fieldbyname('PDF_Proof_Approval_Date_Act').asdatetime;

    ProofRequiredDateAct  :=   Fieldbyname('Proof_Required_Date_Act').asdatetime;
    ProofApprovalDateAct  :=   Fieldbyname('Proof_Approval_Date_Act').asdatetime;

    SampleToClientDateAct :=   Fieldbyname('Sample_To_Client_Act').asdatetime;
    SampleApprovalDateAct :=   Fieldbyname('Sample_Approval_Act').asdatetime;
  end;
end;

procedure TJobBagSched.SaveToDB;
var
  iTempNarr: integer;
begin
  with FParent.FDataModule.qryJBAddSchedule do
  begin
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Schedule_No').AsInteger := JBScheduleNo;
    Parambyname('Operator').asinteger := self.Operator;
    Parambyname('Date_Point').asdatetime := ScheduleDate;
    Parambyname('Schedule_Approval_Type').asstring := ApprovalType;
    if ArtRequired then
      begin
        Parambyname('Artwork_Required').asstring := 'Y';
        Parambyname('Artwork_Due_Date').asdatetime := ArtDueDate;
        Parambyname('Artwork_Proof_Date').asdatetime := ArtProofDate;
        Parambyname('Artwork_Approval_Date').asdatetime := ArtApprovalDate;

        Parambyname('Artwork_Due_Date_Act').asdatetime := ArtDueDateAct;
        Parambyname('Artwork_Proof_Date_Act').asdatetime := ArtProofDateAct;
        Parambyname('Artwork_Approval_Date_Act').asdatetime := ArtApprovalDateAct;
      end
    else
      begin
        Parambyname('Artwork_Required').asstring := 'N';
        Parambyname('Artwork_Due_Date').clear;
        Parambyname('Artwork_Proof_Date').clear;
        Parambyname('Artwork_Approval_Date').clear;

        Parambyname('Artwork_Due_Date_Act').clear;
        Parambyname('Artwork_Proof_Date_Act').clear;
        Parambyname('Artwork_Approval_Date_Act').clear;
      end;

    if DSRequired then
      begin
        Parambyname('Data_Services_Required').asstring := 'Y';
        Parambyname('Data_Required_Date').asdatetime := DataRequiredDate;
        Parambyname('Brief_Required_Date').asdatetime := BriefRequiredDate;
        Parambyname('Text_Required_Date').asdatetime := TextRequiredDate;
        Parambyname('Brief_Available_Date').asdatetime := BriefAvailableDate;
        Parambyname('Data_Available_Date').asdatetime := DataAvailableDate;
        Parambyname('Text_Available_Date').asdatetime := TextAvailableDate;
        Parambyname('Text_Proof_Date').asdatetime := TextProofDate;

        Parambyname('PDF_Proof_Artwork_Date').asdatetime := PDFProofArtworkDate;
        Parambyname('PDF_Proof_Required_Date').asdatetime := PDFProofRequiredDate;
        Parambyname('PDF_Proof_Approval_Date').asdatetime := PDFProofApprovalDate;

        Parambyname('Proof_Required_Date').asdatetime := ProofRequiredDate;
        Parambyname('Proof_Approval_Date').asdatetime := ProofApprovalDate;

        Parambyname('Data_Required_Date_Act').asdatetime := DataRequiredDateAct;
        Parambyname('Brief_Required_Date_Act').asdatetime := BriefRequiredDateAct;
        Parambyname('Text_Required_Date_Act').asdatetime := TextRequiredDateAct;
        Parambyname('Brief_Available_Date_Act').asdatetime := BriefAvailableDateAct;
        Parambyname('Data_Available_Date_Act').asdatetime := DataAvailableDateAct;
        Parambyname('Text_Available_Date_Act').asdatetime := TextAvailableDateAct;
        Parambyname('Text_Proof_Date_Act').asdatetime := TextProofDateAct;

        Parambyname('PDF_Proof_Artwork_Date_Act').asdatetime := PDFProofArtworkDateAct;
        Parambyname('PDF_Proof_Required_Date_Act').asdatetime := PDFProofRequiredDateAct;
        Parambyname('PDF_Proof_Approval_Date_Act').asdatetime := PDFProofApprovalDateAct;

        Parambyname('Proof_Required_Date_Act').asdatetime := ProofRequiredDateAct;
        Parambyname('Proof_Approval_Date_Act').asdatetime := ProofApprovalDateAct;
      end
    else
      begin
        Parambyname('Data_Services_Required').asstring := 'N';
        Parambyname('Data_Required_Date').clear;
        Parambyname('Brief_Required_Date').clear;
        Parambyname('Text_Required_Date').clear;
        Parambyname('Brief_Available_Date').clear;
        Parambyname('Data_Available_Date').clear;
        Parambyname('Text_Available_Date').clear;
        Parambyname('Text_Proof_Date').clear;

        Parambyname('PDF_Proof_Artwork_Date').clear;
        Parambyname('PDF_Proof_Required_Date').clear;
        Parambyname('PDF_Proof_Approval_Date').clear;

        Parambyname('Proof_Required_Date').clear;
        Parambyname('Proof_Approval_Date').clear;

        Parambyname('Data_Required_Date_Act').clear;
        Parambyname('Brief_Required_Date_Act').clear;
        Parambyname('Text_Required_Date_Act').clear;
        Parambyname('Brief_Available_Date_Act').clear;
        Parambyname('Data_Available_Date_Act').clear;
        Parambyname('Text_Available_Date_Act').clear;
        Parambyname('Text_Proof_Date_Act').clear;

        Parambyname('PDF_Proof_Artwork_Date_Act').clear;
        Parambyname('PDF_Proof_Required_Date_Act').clear;
        Parambyname('PDF_Proof_Approval_Date_Act').clear;

        Parambyname('Proof_Required_Date_Act').clear;
        Parambyname('Proof_Approval_Date_Act').clear;
      end;

    if SamplesRequired then
      begin
        Parambyname('Samples_Required').asstring := 'Y';
        Parambyname('Sample_To_Client').asdatetime := SampleToClientDate;
        Parambyname('Sample_Approval').asdatetime := SampleApprovalDate;

        Parambyname('Sample_To_Client_Act').asdatetime := SampleToClientDateAct;
        Parambyname('Sample_Approval_Act').asdatetime := SampleApprovalDateAct;
      end
    else
      begin
        Parambyname('Samples_Required').asstring := 'N';
        Parambyname('Sample_To_Client').clear;
        Parambyname('Sample_Approval').clear;

        Parambyname('Sample_To_Client_Act').clear;
        Parambyname('Sample_Approval_Act').clear;
      end;
    iTempNarr := Narrative;
    parent.FDataModule.SaveNarrative(iTempNarr,NarrativeText);
    Narrative := iTempNarr;
    if Narrative = 0 then
      ParamByName('Narrative').clear
    else
      ParamByName('Narrative').Asinteger := Narrative;
    ExecSQL;
  end;
end;

procedure TJobBagSched.SetApprovalType(const Value: string);
begin
  FApprovalType := Value;
end;

procedure TJobBagSched.SetArtApprovalDate(const Value: TDateTime);
begin
  FArtApprovalDate := Value;
end;

procedure TJobBagSched.SetArtApprovalDateAct(const Value: TDateTime);
begin
  FArtApprovalDateAct := Value;
end;

procedure TJobBagSched.SetArtDueDate(const Value: TDateTime);
begin
  FArtDueDate := Value;
end;

procedure TJobBagSched.SetArtDueDateAct(const Value: TDateTime);
begin
  FArtDueDateAct := Value;
end;

procedure TJobBagSched.SetArtProofDate(const Value: TDateTime);
begin
  FArtProofDate := Value;
end;

procedure TJobBagSched.SetArtProofDateAct(const Value: TDateTime);
begin
  FArtProofDateAct := Value;
end;

procedure TJobBagSched.SetArtRequired(const Value: boolean);
begin
  FArtRequired := Value;
end;

procedure TJobBagSched.SetBriefAvailableDate(const Value: TDateTime);
begin
  FBriefAvailableDate := Value;
end;

procedure TJobBagSched.SetBriefAvailableDateAct(const Value: TDateTime);
begin
  FBriefAvailableDateAct := Value;
end;

procedure TJobBagSched.SetBriefRequiredDate(const Value: TDateTime);
begin
  FBriefRequiredDate := Value;
end;

procedure TJobBagSched.SetBriefRequiredDateAct(const Value: TDateTime);
begin
  FBriefRequiredDateAct := Value;
end;

procedure TJobBagSched.SetDataAvailableDate(const Value: TDateTime);
begin
  FDataAvailableDate := Value;
end;

procedure TJobBagSched.SetDataAvailableDateAct(const Value: TDateTime);
begin
  FDataAvailableDateAct := Value;
end;

procedure TJobBagSched.SetDataRequiredDate(const Value: TDateTime);
begin
  FDataRequiredDate := Value;
end;

procedure TJobBagSched.SetDataRequiredDateAct(const Value: TDateTime);
begin
  FDataRequiredDateAct := Value;
end;

procedure TJobBagSched.SetDSRequired(const Value: boolean);
begin
  FDSRequired := Value;
end;

procedure TJobBagSched.SetJBScheduleNo(const Value: integer);
begin
  FJBScheduleNo := Value;
end;

procedure TJobBagSched.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TJobBagSched.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TJobBagSched.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TJobBagSched.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TJobBagSched.SetParent(const Value: TJobBag);
begin
  FParent := Value;
end;

procedure TJobBagSched.SetPDFProofApprovalDate(const Value: TDateTime);
begin
  FPDFProofApprovalDate := Value;
end;

procedure TJobBagSched.SetPDFProofApprovalDateAct(const Value: TDateTime);
begin
  FPDFProofApprovalDateAct := Value;
end;

procedure TJobBagSched.SetPDFProofArtworkDate(const Value: TDateTime);
begin
  FPDFProofArtworkDate := Value;
end;

procedure TJobBagSched.SetPDFProofArtworkDateAct(const Value: TDateTime);
begin
  FPDFProofArtworkDateAct := Value;
end;

procedure TJobBagSched.SetPDFProofRequiredDate(const Value: TDateTime);
begin
  FPDFProofRequiredDate := Value;
end;

procedure TJobBagSched.SetPDFProofRequiredDateAct(const Value: TDateTime);
begin
  FPDFProofRequiredDateAct := Value;
end;

procedure TJobBagSched.SetProofApprovalDate(const Value: TDateTime);
begin
  FProofApprovalDate := Value;
end;

procedure TJobBagSched.SetProofApprovalDateAct(const Value: TDateTime);
begin
  FProofApprovalDateAct := Value;
end;

procedure TJobBagSched.SetProofByMethod(const Value: string);
begin
  FProofByMethod := Value;
end;

procedure TJobBagSched.SetProofRequiredDate(const Value: TDateTime);
begin
  FProofRequiredDate := Value;
end;

procedure TJobBagSched.SetProofRequiredDateAct(const Value: TDateTime);
begin
  FProofRequiredDateAct := Value;
end;

procedure TJobBagSched.SetSampleApprovalDate(const Value: TDateTime);
begin
  FSampleApprovalDate := Value;
end;

procedure TJobBagSched.SetSampleApprovalDateAct(const Value: TDateTime);
begin
  FSampleApprovalDateAct := Value;
end;

procedure TJobBagSched.SetSamplesRequired(const Value: boolean);
begin
  FSamplesRequired := Value;
end;

procedure TJobBagSched.SetSampleToClientDate(const Value: TDateTime);
begin
  FSampleToClientDate := Value;
end;

procedure TJobBagSched.SetSampleToClientDateAct(const Value: TDateTime);
begin
  FSampleToClientDateAct := Value;
end;

procedure TJobBagSched.SetScheduleApproved(const Value: boolean);
begin
  FScheduleApproved := Value;
end;

procedure TJobBagSched.SetScheduleDate(const Value: TDateTime);
begin
  FScheduleDate := Value;
end;

procedure TJobBagSched.SetTextAvailableDate(const Value: TDateTime);
begin
  FTextAvailableDate := Value;
end;

procedure TJobBagSched.SetTextAvailableDateAct(const Value: TDateTime);
begin
  FTextAvailableDateAct := Value;
end;

procedure TJobBagSched.SetTextProofDate(const Value: TDateTime);
begin
  FTextProofDate := Value;
end;

procedure TJobBagSched.SetTextProofDateAct(const Value: TDateTime);
begin
  FTextProofDateAct := Value;
end;

procedure TJobBagSched.SetTextRequiredDate(const Value: TDateTime);
begin
  FTextRequiredDate := Value;
end;

procedure TJobBagSched.SetTextRequiredDateAct(const Value: TDateTime);
begin
  FTextRequiredDateAct := Value;
end;

{ TJobBagRequests }

procedure TJobBagRequests.Add(aRequest: TJobBagRequest);
begin
  FItems.Add(aRequest);
end;

procedure TJobBagRequests.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagRequest(FItems[i]).Free;
end;

function TJobBagRequests.Clone: TJobBagRequests;
var
  i : integer;
begin
  Result := TJobBagRequests.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJobBagRequest(FItems[i]).Clone);
end;

constructor TJobBagRequests.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
  FItems := TList.Create;
end;

procedure TJobBagRequests.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJobBagRequests.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagRequest(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJobBagRequests.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJobBagRequests.GetItems(Index: integer): TJobBagRequest;
begin
  Result := TJobBagRequest(FItems[Index]);
end;

function TJobBagRequests.IndexOf(const RequestNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagRequest(FItems[i]).JBRequestNo = RequestNo then
      Result := i;
end;

procedure TJobBagRequests.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagRequest(FItems[i]).JBRequestNo := (i+1);
end;

procedure TJobBagRequests.SetItems(Index: integer;
  const Value: TJobBagRequest);
begin
  FItems[Index] := Value;
end;

{ TJobBagRequest }

function TJobBagRequest.Clone: TJobBagRequest;
begin
  Result := TJobBagRequest.Create(FParent);
  Result.CostPackQty    :=    Self.CostPackQty;
  Result.CostPrice      :=    Self.CostPrice;
  Result.DateRequested  :=     Self.DateRequested;
  Result.IncludedCharge :=    Self.IncludedCharge;
  Result.JBRequestNo    :=       Self.JBRequestNo;
  Result.PartCode       :=    Self.PartCode;
  Result.PartDescription  :=  Self.PartDescription;
  Result.QtyInvoiced    :=    Self.QtyInvoiced;
  Result.QtyOrdered     :=    Self.QtyOrdered;
  Result.QtyDespatched  :=    Self.QtyDespatched;
  Result.SalesOrder     :=    Self.SalesOrder;
  Result.SalesOrderLine :=    Self.SalesOrderLine;
  Result.SellPackQty    :=    Self.SellPackQty;
  Result.SellPrice      :=    Self.SellPrice;
  Result.Status         :=    Self.Status;
  Result.StatusDescr    :=    Self.StatusDescr;
  Result.ToInvoice      :=    Self.ToInvoice;
  Result.VatCode        :=    Self.VatCode;
end;

constructor TJobBagRequest.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
end;

destructor TJobBagRequest.Destroy;
begin
  inherited;
end;

procedure TJobBagRequest.LoadFromDB;
begin
  with FParent.FDataModule.qryJBRequest do
  begin
    Close;
    ParamByName('JobBag').AsInteger := FParent.DbKey;
    ParamByName('Request_no').AsInteger := JBRequestNo;
    Open;
    CostPackQty := fieldbyname('Purch_pack_Quantity').asinteger;
    CostPrice := fieldbyname('Part_Cost').asfloat;
    DateRequested := fieldbyname('Date_Ordered').asdatetime;
    IncludedCharge := (fieldbyname('Included_in_Charges').asString = 'Y');
    PartCode := fieldbyname('Part').asstring;
    PartDescription := fieldbyname('Part_Description').asstring;
    QtyInvoiced := fieldbyname('Quantity_Invoiced').asinteger;
    QtyDespatched := fieldbyname('Quantity_delivered').asinteger;
    QtyOrdered := fieldbyname('Quantity_Ordered').asinteger;
    SalesOrder := fieldbyname('Sales_order').asinteger;
    SalesOrderLine := fieldbyname('Sales_order_line_no').asinteger;
    SellPackQty := fieldbyname('Sell_Pack_Quantity').asinteger;
    SellPrice := fieldbyname('Part_Sales_Price').asfloat;
    Status := fieldbyname('Sales_Order_Head_Status').asinteger;
    StatusDescr := fieldbyname('Status_Description').asString;
    ToInvoice  := (fieldbyname('Quantity_delivered').asinteger > 0) and
                       (fieldbyname('Quantity_invoiced').asinteger = 0);
    VatCode := fieldbyname('Vat_Code').asinteger;
  end;
end;

procedure TJobBagRequest.SaveToDB;
begin
  with FParent.FDataModule.qryJBAddRequest do
  begin
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Request_No').AsInteger := JBRequestNo;
    ParamByName('Sales_order').Asinteger := SalesOrder;
    ParamByName('Sales_Order_Line_no').asinteger := SalesOrderLine;
    if IncludedCharge then
      ParambyName('Included_in_Charges').asstring := 'Y'
    else
      ParambyName('Included_in_Charges').asstring := 'N';

    ExecSQL;
  end;
end;

procedure TJobBagRequest.SetCostPackQty(const Value: integer);
begin
  FCostPackQty := Value;
end;

procedure TJobBagRequest.SetCostPrice(const Value: double);
begin
  FCostPrice := Value;
end;

procedure TJobBagRequest.SetDateRequested(const Value: TDateTime);
begin
  FDateRequested := Value;
end;

procedure TJobBagRequest.SetIncludedCharge(const Value: boolean);
begin
  FIncludedCharge := Value;
end;

procedure TJobBagRequest.SetJBRequestNo(const Value: integer);
begin
  FJBRequestNo := Value;
end;

procedure TJobBagRequest.SetParent(const Value: TJobBag);
begin
  FParent := Value;
end;

procedure TJobBagRequest.SetPartCode(const Value: string);
begin
  FPartCode := Value;
end;

procedure TJobBagRequest.SetPartDescription(const Value: string);
begin
  FPartDescription := Value;
end;

procedure TJobBagRequest.SetQtyDespatched(const Value: integer);
begin
  FQtyDespatched := Value;
end;

procedure TJobBagRequest.SetQtyInvoiced(const Value: integer);
begin
  FQtyInvoiced := Value;
end;

procedure TJobBagRequest.SetQtyOrdered(const Value: integer);
begin
  FQtyOrdered := Value;
end;

procedure TJobBagRequest.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
end;

procedure TJobBagRequest.SetSalesOrderLine(const Value: integer);
begin
  FSalesOrderLine := Value;
end;

procedure TJobBagRequest.SetSellPackQty(const Value: integer);
begin
  FSellPackQty := Value;
end;

procedure TJobBagRequest.SetSellPrice(const Value: double);
begin
  FSellPrice := Value;
end;

procedure TJobBagRequest.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TJobBagRequest.SetStatusDescr(const Value: string);
begin
  FStatusDescr := Value;
end;

procedure TJobBagRequest.SetToInvoice(const Value: boolean);
begin
  FToInvoice := Value;
end;

procedure TJobBagRequest.SetVatCode(const Value: integer);
begin
  FVatCode := Value;
end;

{ TJobBagSupply }

function TJobBagSupply.Clone: TJobBagSupply;
begin
  Result := TJobBagSupply.Create(FParent);
  Result.Description    :=    Self.Description;
  Result.Enquiry        :=    Self.Enquiry;
  Result.EnquiryLine    :=    Self.EnquiryLine;
  Result.LineConverted  :=    Self.LineConverted;
  Result.PriceUnit      :=    Self.PriceUnit;
  Result.PriceUnitFactor :=   Self.PriceUnitFactor;
  Result.PriceUnitDesc  :=    Self.PriceUnitDesc;
  Result.ProductType    :=    Self.ProductType;
  Result.ProductTypeDesc :=   Self.ProductTypeDesc;
  Result.JBSupplyNo      :=    Self.JBSupplyNo;
  Result.Quantity       :=    Self.Quantity;
  Result.UnitCost       :=    Self.UnitCost;
  Result.UnitSell       :=    Self.UnitSell;
end;

constructor TJobBagSupply.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
end;

procedure TJobBagSupply.DeleteFromDB;
begin

end;

destructor TJobBagSupply.Destroy;
begin
  inherited;
end;

function TJobBagSupply.GetTotalCost: currency;
begin
  if PriceUnitFactor = 0 then
    result := UnitCost
  else
    result := (Quantity/PriceUnitFactor) * UnitCost;
end;

function TJobBagSupply.GetTotalSell: currency;
begin
  if PriceUnitFactor = 0 then
    result := UnitSell
  else
    result := (Quantity/PriceUnitFactor) * UnitSell;
end;

procedure TJobBagSupply.LoadFromDB;
begin
  with FParent.FDataModule.qryJBSupply do
  begin
    Close;
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Job_Bag_Supply_No').AsInteger := JBSupplyNo;
    Open;
    Description := fieldbyname('Form_Description').asstring;
    Enquiry := fieldbyname('Enquiry').asinteger;
    EnquiryLine := fieldbyname('Line').asinteger;
    LineConverted := fieldbyname('Line_Converted').asstring;
    PriceUnit := fieldbyname('Price_Unit').asinteger;
    PriceUnitFactor := fieldbyname('Price_Unit_Factor').asinteger;
    PriceUnitDesc := fieldbyname('Price_Unit_Description').asstring;
    ProductType := fieldbyname('Product_Type').asinteger;
    ProductTypeDesc := fieldbyname('Product_Type_Description').AsString;
    Quantity := fieldbyname('Quantity').asinteger;
    UnitCost := fieldbyname('Supplier_Price').asfloat;
    UnitSell := fieldbyname('Quotation_Price').asfloat;
  end;
end;

procedure TJobBagSupply.SaveToDB;
begin
  with FParent.FDataModule.qryJBAddSupply do
  begin
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Job_Bag_Supply_No').AsInteger := JBSupplyNo;
    ParamByName('Enquiry').Asinteger := Enquiry;
    ParamByName('Line').asinteger := EnquiryLine;
    ParamByName('Line_Converted').asstring := LineConverted;
    ParamByName('Quantity').asinteger := Quantity;
    ExecSQL;
  end;
end;

procedure TJobBagSupply.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TJobBagSupply.SetEnquiry(const Value: integer);
begin
  FEnquiry := Value;
end;

procedure TJobBagSupply.SetEnquiryLine(const Value: integer);
begin
  FEnquiryLine := Value;
end;

procedure TJobBagSupply.SetJBSupplyNo(const Value: integer);
begin
  FJBSupplyNo := Value;
end;

procedure TJobBagSupply.SetLineConverted(const Value: string);
begin
  FLineConverted := Value;
end;

procedure TJobBagSupply.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TJobBagSupply.SetPriceUnitDesc(const Value: string);
begin
  FPriceUnitDesc := Value;
end;

procedure TJobBagSupply.SetPriceUnitFactor(const Value: integer);
begin
  FPriceUnitFactor := Value;
end;

procedure TJobBagSupply.SetProductType(const Value: integer);
begin
  FProductType := Value;
end;

procedure TJobBagSupply.SetProductTypeDesc(const Value: string);
begin
  FProductTypeDesc := Value;
end;

procedure TJobBagSupply.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TJobBagSupply.SetUnitCost(const Value: double);
begin
  FUnitCost := Value;
end;

procedure TJobBagSupply.SetUnitSell(const Value: double);
begin
  FUnitSell := Value;
end;

{ TJobBagSupplies }

procedure TJobBagSupplies.Add(aSupply: TJobBagSupply);
begin
  FItems.Add(aSupply);
end;

procedure TJobBagSupplies.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagSupply(FItems[i]).Free;
end;

function TJobBagSupplies.Clone: TJobBagSupplies;
var
  i : integer;
begin
  Result := TJobBagSupplies.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJobBagSupply(FItems[i]).Clone);
end;

constructor TJobBagSupplies.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
  FItems := TList.Create;
end;

procedure TJobBagSupplies.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJobBagSupplies.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagSupply(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJobBagSupplies.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJobBagSupplies.GetItems(Index: integer): TJobBagSupply;
begin
  Result := TJobBagSupply(FItems[Index]);
end;

function TJobBagSupplies.GetMaxLineNo: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].JBSupplyNo > Result then
      Result := Items[i].JBSupplyNo;
end;

function TJobBagSupplies.IndexOf(const SupplyNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagSupply(FItems[i]).JBSupplyNo = SupplyNo then
      Result := i;
end;

procedure TJobBagSupplies.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagSupply(FItems[i]).JBSupplyNo := (i+1);
end;

procedure TJobBagSupplies.SetItems(Index: integer;
  const Value: TJobBagSupply);
begin
  FItems[Index] := Value;
end;

{ TJobNonConforms }

procedure TJobBagNonConforms.Add(aNonConform: TJobBagNonConform);
begin
  FItems.Add(aNonConform);
end;

procedure TJobBagNonConforms.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagNonConform(FItems[i]).Free;
end;

function TJobBagNonConforms.Clone: TJobBagNonConforms;
var
  i : integer;
begin
  Result := TJobBagNonConforms.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJobBagNonConform(FItems[i]).Clone);
end;

constructor TJobBagNonConforms.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
  FItems := TList.Create;
end;

procedure TJobbagNonConforms.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJobBagNonConforms.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagNonConform(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJobBagNonConforms.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJobBagNonConforms.GetItems(Index: integer): TJobBagNonConform;
begin
  Result := TJobBagNonConform(FItems[Index]);
end;

function TJobBagNonConforms.GetMaxLineNo: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].JBNonConformNo > Result then
      Result := Items[i].JBNonConformNo;
end;

function TJobBagNonConforms.IndexOf(const NonConformNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagNonConform(FItems[i]).JBNonConformNo = NonConformNo then
      Result := i;
end;

procedure TJobBagNonConforms.SetItems(Index: integer;
  const Value: TJobBagNonConform);
begin

end;

{ TJobBagNonConform }

function TJobBagNonConform.Clone: TJobBagNonConform;
begin
  Result := TJobBagNonConform.Create(FParent);
  Result.DatePoint        :=    Self.DatePoint;
  Result.JobRePrinted     :=    self.JobRePrinted;
  Result.JBNonConformNo   :=    Self.JBNonConformNo;
  Result.Operator         :=    Self.Operator;
  Result.RaisedBy         :=    Self.RaisedBy;
  Result.RaisedByName     :=    Self.RaisedByName;
  Result.NCCategory       :=    self.NCCategory;
  Result.NCCategoryDescription := self.NCCategoryDescription;
  Result.NCDepartment     :=    Self.NCDepartment;
  Result.NCDepartmentName :=    Self.NCDepartmentName;
  Result.NCNumber         :=    Self.NCNumber;
  Result.NCType           :=    Self.NCType;
  Result.NCTypeDescription :=   Self.NCTypeDescription;
  Result.QAOperator       :=    Self.QAOperator;
  Result.QAOperatorName   :=    Self.QAOperatorName;
  Result.QASignOffDate    :=    Self.QASignOffDate;
  Result.TotalCost        :=    Self.TotalCost;
  Result.Narrative        :=    Self.Narrative;
  Result.NarrativeText    :=    Self.NarrativeText;
  Result.Response         :=    Self.Response;
  Result.ResponseDate     :=    self.ResponseDate;
  Result.ResponseNotes    :=    Self.ResponseNotes;
  Result.Corrective       :=    self.Corrective;
  Result.CorrectiveDate   :=    self.CorrectiveDate;
  Result.CorrectiveNotes  :=    Self.CorrectiveNotes;
  Result.Preventative     :=    self.Preventative;
  Result.PreventativeDate :=    self.PreventativeDate;
  Result.PreventativeNotes :=   self.PreventativeNotes;
  Result.CosttoClient     :=    self.CosttoClient;
  Result.SamplesAvailable :=    self.SamplesAvailable;
  Result.Status           :=    self.status;
  Result.Inactive         :=    self.Inactive;
  Result.Inactivedate     :=    self.InactiveDate;
  inherited;
end;

constructor TJobBagNonConform.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
end;

destructor TJobBagNonConform.Destroy;
begin

  inherited;
end;

function TJobBagNonConform.GetStatusDescription: string;
begin
  with parent.FDataModule.qryGetNonConformStatus do
    begin
      close;
      parambyname('Non_Conform_Status').asinteger := Status;
      open;
      result := fieldbyname('Non_Conform_Status_Descr').asstring;
    end;
end;

procedure TJobBagNonConform.LoadFromDB;
begin

end;

procedure TJobBagNonConform.SaveToDB;
var
  iTempNarr: integer;
begin
  with FParent.FDataModule.qryJBAddNonConform do
  begin
    close;
    ParamByName('Job_Bag_Non_Conform').AsInteger := NCNumber;
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Date_Point').AsDateTime := DatePoint;
    ParamByName('operator').Asinteger := Operator;
    ParamByName('Raised_by_Dept').asinteger := RaisedBy;
    if NCCategory = 0 then
      Parambyname('Non_Conform_Category').clear
    else
      Parambyname('Non_Conform_Category').asinteger := NCCategory;
    ParamByName('Non_Conform_Dept').asinteger := NCDepartment;
    ParamByName('Non_Conform_type').asinteger := NCType;
    if QAOperator = 0 then
      ParamByName('QA_Operator').clear
    else
      ParamByName('QA_Operator').asinteger := QAOperator;
    ParamByName('QA_Sign_Off_Date').asdatetime := QASignOffDate;

    iTempNarr := Narrative;
    parent.FDataModule.SaveNarrative(iTempNarr,NarrativeText);
    Narrative := iTempNarr;
    if Narrative = 0 then
      ParamByName('Non_Conform_Notes').clear
    else
      ParamByName('Non_Conform_Notes').Asinteger := Narrative;

    iTempNarr := Response;
    parent.FDataModule.SaveNarrative(iTempNarr,ResponseNotes);
    Response := iTempNarr;
    if Response = 0 then
      ParamByName('Response_Notes_id').clear
    else
      ParamByName('Response_Notes_id').Asinteger := Response;

    iTempNarr := Corrective;
    parent.FDataModule.SaveNarrative(iTempNarr,CorrectiveNotes);
    Corrective := iTempNarr;
    if Corrective = 0 then
      ParamByName('Corrective_Notes_id').clear
    else
      ParamByName('Corrective_Notes_id').Asinteger := Corrective;
//    ParamByName('Corrective_Notes').asstring := CorrectiveNotes;

    iTempNarr := Preventative;
    parent.FDataModule.SaveNarrative(iTempNarr,PreventativeNotes);
    Preventative := iTempNarr;
    if Preventative = 0 then
      ParamByName('Preventative_Notes_id').clear
    else
      ParamByName('Preventative_Notes_id').Asinteger := Preventative;

    {Set the response date}
    if (ResponseDate = 0) and (Response <> 0) then
      Parambyname('Response_Date').asdatetime := now
    else
      begin
        if ResponseDate = 0 then
          Parambyname('Response_Date').clear
        else
          Parambyname('Response_Date').asdatetime := ResponseDate;
      end;

    {Set the corrective date}
    if (CorrectiveDate = 0) and (Corrective <> 0) then
      Parambyname('Corrective_Date').asdatetime := now
    else
      begin
        if CorrectiveDate = 0 then
          Parambyname('Corrective_Date').clear
        else
          Parambyname('Corrective_Date').asdatetime := CorrectiveDate;
      end;

    {Set the preventative date}
    if (PreventativeDate = 0) and (Preventative <> 0) then
      Parambyname('Preventative_Date').asdatetime := now
    else
      begin
        if PreventativeDate = 0 then
          Parambyname('Preventative_Date').clear
        else
          Parambyname('Preventative_Date').asdatetime := PreventativeDate;
      end;

    Parambyname('Non_Conform_Status').asinteger := status;
    ParamByName('Total_Cost').asfloat := TotalCost;
    ParamByName('Total_Cost_to_Client').asfloat := CosttoClient;

    parambyname('Job_Reprinted').asstring := JobRePrinted;
    parambyname('Samples_Available').AsString := SamplesAvailable;
    ExecSQL;
  end;
end;

procedure TJobBagNonConform.SetCorrective(const Value: integer);
begin
  FCorrective := Value;
end;

procedure TJobBagNonConform.SetCorrectiveDate(const Value: TDateTime);
begin
  FCorrectiveDate := Value;
end;

procedure TJobBagNonConform.SetCorrectiveNotes(const Value: string);
begin
  FCorrectiveNotes := Value;
end;

procedure TJobBagNonConform.SetCosttoClient(const Value: double);
begin
  FCosttoClient := Value;
end;

procedure TJobBagNonConform.SetDatePoint(const Value: TDateTime);
begin
  FDatePoint := Value;
end;

procedure TJobBagNonConform.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TJobBagNonConform.SetInactiveDate(const Value: TDateTime);
begin
  FInactiveDate := Value;
end;

procedure TJobBagNonConform.SetJBNonConformNo(const Value: integer);
begin
  FJBNonConformNo := Value;
end;

procedure TJobBagNonConform.SetJobRePrinted(const Value: string);
begin
  FJobRePrinted := Value;
end;

procedure TJobBagNonConform.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TJobBagNonConform.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TJobBagNonConform.SetNCCategory(const Value: integer);
begin
  FNCCategory := Value;
end;

procedure TJobBagNonConform.SetNCCategoryDescription(const Value: string);
begin
  FNCCategoryDescription := Value;
end;

procedure TJobBagNonConform.SetNCDepartment(const Value: integer);
begin
  FNCDepartment := Value;
end;

procedure TJobBagNonConform.SetNCDepartmentName(const Value: string);
begin
  FNCDepartmentName := Value;
end;

procedure TJobBagNonConform.SetNCNumber(const Value: integer);
begin
  FNCNumber := Value;
end;

procedure TJobBagNonConform.SetNCType(const Value: integer);
begin
  FNCType := Value;
end;

procedure TJobBagNonConform.SetNCTypeDescription(const Value: string);
begin
  FNCTypeDescription := Value;
end;

procedure TJobBagNonConform.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TJobBagNonConform.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TJobBagNonConform.SetParent(const Value: TJobBag);
begin
  FParent := Value;
end;

procedure TJobBagNonConform.SetPreventative(const Value: integer);
begin
  FPreventative := Value;
end;

procedure TJobBagNonConform.SetPreventativeDate(const Value: TDatetime);
begin
  FPreventativeDate := Value;
end;

procedure TJobBagNonConform.SetPreventativeNotes(const Value: string);
begin
  FPreventativeNotes := Value;
end;

procedure TJobBagNonConform.SetQAOperator(const Value: integer);
begin
  FQAOperator := Value;
end;

procedure TJobBagNonConform.SetQAOperatorName(const Value: string);
begin
  FQAOperatorName := Value;
end;

procedure TJobBagNonConform.SetQASignOffDate(const Value: TDateTime);
begin
  FQASignOffDate := Value;
end;

procedure TJobBagNonConform.SetRaisedBy(const Value: integer);
begin
  FRaisedBy := Value;
end;

procedure TJobBagNonConform.SetRaisedByName(const Value: string);
begin
  FRaisedByName := Value;
end;

procedure TJobBagNonConform.SetResponse(const Value: integer);
begin
  FResponse := Value;
end;

procedure TJobBagNonConform.SetResponseDate(const Value: TDateTime);
begin
  FResponseDate := Value;
end;

procedure TJobBagNonConform.SetResponseNotes(const Value: string);
begin
  FResponseNotes := Value;
end;

procedure TJobBagNonConform.SetSamplesAvailable(const Value: string);
begin
  FSamplesAvailable := Value;
end;

procedure TJobBagNonConform.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TJobBagNonConform.SetStatusDescription(const Value: string);
begin
  FStatusDescription := Value;
end;

procedure TJobBagNonConform.SetTotalCost(const Value: double);
begin
  FTotalCost := Value;
end;

{ TQuoteDept }

function TJobBagDept.Clone: TJobBagDept;
begin
  Result := TJobBagDept.Create(FParent);
  Result.Department       :=    Self.Department;
  Result.DepartmentName  :=    Self.DepartmentName;
  Result.Specification   :=    Self.Specification;
  Result.SpecificationID :=    Self.SpecificationID;
  Result.JDepartmentNo    :=    Self.JDepartmentNo;
end;

constructor TJobBagDept.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
end;

destructor TJobBagDept.Destroy;
begin

  inherited;
end;

procedure TJobBagDept.LoadFromDB;
begin
end;

procedure TJobBagDept.SaveToDB;
var
  iTempNarr: integer;
begin
  with FParent.FDataModule.qryJAddProcessGroup do
  begin
    close;
    ParamByName('Job_Bag').Asfloat := FParent.DbKey;
    ParamByName('Process_Group').AsInteger := Department;
    ParamByName('Job_Bag_Specification').asstring := trim(Specification);

    if (parent.FJBMode = jbAdd) OR (parent.FJBMode = jbConvert) OR (parent.FJBMode = jbCopy) OR (parent.FJBMode = jbRepeat) then
      SpecificationID := 0;

    iTempNarr := SpecificationID;
    parent.FDataModule.SaveNarrative(iTempNarr,Specification);
    SpecificationID := iTempNarr;
    if SpecificationID = 0 then
      ParamByName('Job_Bag_Specification_id').clear
    else
      ParamByName('Job_Bag_Specification_id').Asinteger := SpecificationID;
    ExecSQL;
  end;
end;

procedure TJobBagDept.SetDepartment(const Value: integer);
begin
  FDepartment := Value;
end;

procedure TJobBagDept.SetDepartmentName(const Value: string);
begin
  FDepartmentName := Value;
end;

procedure TJobBagDept.SetParent(const Value: TJobBag);
begin
  FParent := Value;
end;

procedure TJobBagDept.SetJDepartmentNo(const Value: integer);
begin
  FJDepartmentNo := Value;
end;

procedure TJobBagDept.SetSpecification(const Value: string);
begin
  FSpecification := Value;
end;

procedure TJobBagDept.SetSpecificationID(const Value: integer);
begin
  FSpecificationID := Value;
end;

{ TJobBagDepts }

procedure TJobBagDepts.Add(aDepartment: TJobBagDept);
begin
  FItems.Add(aDepartment);
end;

procedure TJobBagDepts.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagDept(FItems[i]).Free;
end;

function TJobBagDepts.Clone: TJobBagDepts;
var
  i : integer;
begin
  Result := TJobBagDepts.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJobBagDept(FItems[i]).Clone);
end;

constructor TJobBagDepts.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
  FItems := TList.Create;
end;

procedure TJobBagDepts.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJobBagDepts.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagDept(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJobBagDepts.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJobBagDepts.GetItems(Index: integer): TJobBagDept;
begin
  Result := TJobBagDept(FItems[Index]);
end;

function TJobBagDepts.IndexOf(const DepartmentNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagDept(FItems[i]).JDepartmentNo = DepartmentNo then
      Result := i;
end;

procedure TJobBagDepts.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagDept(FItems[i]).JDepartmentNo := (i+1);
end;

procedure TJobBagDepts.SetItems(Index: integer; const Value: TJobBagDept);
begin

end;

{ TJobBagDeliveries }

procedure TJobBagDeliveries.Add(aDelivery: TJobBagDelivery);
begin
  FItems.Add(aDelivery);
end;

procedure TJobBagDeliveries.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagDelivery(FItems[i]).Free;
end;

function TJobBagDeliveries.Clone: TJobBagDeliveries;
var
  i : integer;
begin
  Result := TJobBagDeliveries.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TJobBagDelivery(FItems[i]).Clone);
end;

constructor TJobBagDeliveries.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
  FItems := TList.Create;
end;

procedure TJobBagDeliveries.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TJobBagDeliveries.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagDeliveries(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TJobBagDeliveries.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TJobBagDeliveries.GetItems(Index: integer): TJobBagDelivery;
begin
  Result := TJobBagDelivery(FItems[Index]);
end;

function TJobBagDeliveries.IndexOf(const DeliveryNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TJobBagDelivery(FItems[i]).DeliveryNo = DeliveryNo then
      Result := i;
end;

procedure TJobBagDeliveries.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TJobBagDelivery(FItems[i]).DeliveryNo := (i+1);
end;

procedure TJobBagDeliveries.SetItems(Index: integer;
  const Value: TJobBagDelivery);
begin
  FItems[Index] := Value;
end;

{ TJobBagDelivery }

function TJobBagDelivery.Clone: TJobBagDelivery;
begin
  Result := TJobBagDelivery.Create(FParent);
  Result.AdhocAddress         :=  Self.AdhocAddress;
  Result.BoxQuantity          :=  self.BoxQuantity;
  Result.BranchNo             :=  Self.BranchNo;
  Result.CompanyBranch        :=  self.CompanyBranch;
  Result.ConsignmentNo        :=  Self.ConsignmentNo;
  Result.ContactName          :=  Self.ContactName;
  Result.Courier              :=  Self.Courier;
  Result.CourierName          :=  Self.CourierName;
  Result.Customer             :=  Self.Customer;
  Result.CustomerName         :=  Self.CustomerName;
  Result.DateDelivered        :=  Self.DateDelivered;
  Result.DatePoint            :=  Self.DatePoint;
  Result.DateRequired         :=  Self.DateRequired;
  Result.DeliveryLocation     :=  self.DeliveryLocation;
  Result.DeliverToStock       :=  Self.DeliverToStock;
  Result.DeliverViaCompany    :=  Self.DeliverViaCompany;
  Result.DeliveryInstructions :=  Self.DeliveryInstructions;
  Result.DeliveryNotePrinted  :=  Self.DeliveryNotePrinted;
  Result.DeliveryNo           :=  Self.DeliveryNo;
  Result.DeliveryWeightKilos  :=  Self.DeliveryWeightKilos;
  Result.NumberOfBoxes := Self.NumberOfBoxes;
  Result.PackageType          :=  Self.PackageType;
  Result.PackageName          :=  Self.PackageName;
  Result.QtyDelivered :=  Self.QtyDelivered;
  Result.QtyToDeliver :=  Self.QtyToDeliver;
  Result.Rep                  :=  Self.Rep;
  Result.RepName              :=  Self.RepName;
  Result.Service              :=  Self.Service;
  Result.ServiceName          :=  Self.ServiceName;
  Result.Supplier             :=  self.Supplier;
  Result.SupplierBranch       :=  self.SupplierBranch;
end;

constructor TJobBagDelivery.Create(JobBag: TJobBag);
begin
  FParent := JobBag;
end;

destructor TJobBagDelivery.Destroy;
begin
  inherited;
end;

procedure TJobBagDelivery.LoadFromDB;
begin
  with FParent.FDataModule.qryJBDelivery do
  begin
    Close;
    ParamByName('JobBag').AsInteger := FParent.DbKey;
    ParamByName('Delivery_no').AsInteger := DeliveryNo;
    Open;
    AdhocAddress := FieldByName('Ad_hoc_address').asinteger;
    BoxQuantity :=  Fieldbyname('Box_Quantity').asinteger;
    BranchNo := FieldByName('Branch_no').Asinteger;
    CompanyBranch := fieldbyname('Company_Branch').asinteger;
    ConsignmentNo := FieldByName('Consignment_Number').Asstring;
    Courier := FieldByName('Courier').asinteger;
    CourierName := fieldbyname('Courier_Name').asstring;
    Customer := FieldByName('Customer').Asinteger;
    CustomerName := FieldByName('Contact_Name').Asstring;
    DeliveryLocation := '';
    DateDelivered := FieldByName('Date_Deliv_Actual').asdatetime;
    DatePoint := FieldByName('Date_Point').Asdatetime;
    DateRequired := FieldByName('Goods_Reqd_by_Customer').Asdatetime;
    DeliverToStock := FieldByName('Delivery_To_Stock').asstring;
    DeliverViaCompany := FieldByName('Deliver_Via_Company').Asstring;
    DeliveryInstructions := FieldByName('Delivery_Instructions').Asstring;
    DeliveryNotePrinted := FieldByName('Delivery_Note_Printed').asstring;
    DeliveryWeightKilos := FieldByName('Delivery_Weight_Kilos').Asfloat;
    NumberofBoxes := FieldByName('Number_of_Boxes').asinteger;
    PackageType := FieldByName('Package_Type').Asinteger;
    PackageName := FieldByName('Package_Name').Asstring;
    QtyDelivered := FieldByName('Qty_Delivered').asfloat;
    QtyToDeliver := FieldByName('Qty_To_Deliver').Asfloat;
    Rep := FieldByName('Rep').Asinteger;
//    RepName := FieldByName('Rep_Name').asstring;
    Service := FieldByName('Service_no').Asinteger;
    ServiceName := FieldByName('Service_Name').Asstring;
    Supplier := fieldbyname('Supplier').asinteger;
    SupplierBranch := fieldbyname('Supplier_Branch').asinteger;
  end;
end;

procedure TJobBagDelivery.SaveToDB;
begin
  with FParent.FDataModule.qryJBAddDelivery do
  begin
    ParamByName('Job_Bag').AsInteger := FParent.DbKey;
    ParamByName('Delivery_No').AsInteger := DeliveryNo;
    if AdhocAddress = 0 then
      ParambyName('Ad_hoc_address').clear
    else
      ParambyName('Ad_hoc_address').asinteger := AdhocAddress;
    if Customer = 0 then
      begin
        ParambyName('Customer').clear;
        ParambyName('Branch_no').clear;
      end
    else
      begin
        ParambyName('Customer').Asinteger := Customer;
        ParambyName('Branch_no').Asinteger := BranchNo;
      end;

    Parambyname('Company_Branch').asinteger := CompanyBranch;
    ParambyName('Contact_Name').Asstring := ContactName;
    ParambyName('Consignment_Number').Asstring := ConsignmentNo;
    ParambyName('Courier').asinteger := Courier;
    ParambyName('Date_Deliv_Actual').asdatetime := DateDelivered;
    ParambyName('Date_Point').Asdatetime := DatePoint;
    ParambyName('Goods_Reqd_by_Customer').Asdatetime := DateRequired;
    ParambyName('Delivery_To_Stock').asstring := DeliverToStock;
    ParambyName('Deliver_Via_Company').Asstring := DeliverViaCompany;
    ParambyName('Delivery_Instructions').Asstring := DeliveryInstructions;
    ParambyName('Delivery_Note_Printed').asstring := DeliveryNotePrinted;
    ParambyName('Delivery_Weight_Kilos').Asfloat := DeliveryWeightKilos;
    ParambyName('No_of_Boxes').asinteger := NumberofBoxes;
    ParambyName('Box_Quantity').asinteger := BoxQuantity;
    if PackageType = 0 then
      ParambyName('Package_Type').clear
    else
      ParambyName('Package_Type').Asinteger := PackageType;
    ParambyName('Qty_Delivered').asfloat := QtyDelivered;
    ParambyName('Qty_To_Deliver').Asfloat := QtyToDeliver;
    if Rep = 0 then
      ParambyName('Rep').clear
    else
      ParambyName('Rep').Asinteger := Rep;
    if Service = 0 then
      ParambyName('Service_no').clear
    else
      ParambyName('Service_no').asinteger := Service;

    if Supplier = 0 then
      begin
        parambyname('Supplier').clear;
        parambyname('Supplier_Branch').clear;
      end
    else
      begin
        parambyname('Supplier').asinteger := Supplier;
        parambyname('Supplier_Branch').asinteger := SupplierBranch;
      end;
    ExecSQL;
  end;
end;

procedure TJobBagDelivery.SetAdhocAddress(const Value: integer);
begin
  FAdhocAddress := Value;
end;

procedure TJobBagDelivery.SetBoxQuantity(const Value: integer);
begin
  FBoxQuantity := Value;
end;

procedure TJobBagDelivery.SetBranchNo(const Value: integer);
begin
  FBranchNo := Value;
end;

procedure TJobBagDelivery.SetCompanyBranch(const Value: integer);
begin
  FCompanyBranch := Value;
end;

procedure TJobBagDelivery.SetConsignmentNo(const Value: string);
begin
  FConsignmentNo := Value;
end;

procedure TJobBagDelivery.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TJobBagDelivery.SetCourier(const Value: integer);
begin
  FCourier := Value;
end;

procedure TJobBagDelivery.SetCourierName(const Value: string);
begin
  FCourierName := Value;
end;

procedure TJobBagDelivery.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TJobBagDelivery.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TJobBagDelivery.SetDateDelivered(const Value: TDateTime);
begin
  FDateDelivered := Value;
end;

procedure TJobBagDelivery.SetDatePoint(const Value: TDateTime);
begin
  FDatePoint := Value;
end;

procedure TJobBagDelivery.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TJobBagDelivery.SetDeliverToStock(const Value: string);
begin
  FDeliverToStock := Value;
end;

procedure TJobBagDelivery.SetDeliverViaCompany(const Value: string);
begin
  FDeliverViaCompany := Value;
end;

procedure TJobBagDelivery.SetDeliveryInstructions(const Value: string);
begin
  FDeliveryInstructions := Value;
end;

procedure TJobBagDelivery.SetDeliveryLocation(const Value: string);
begin
  FDeliveryLocation := Value;
end;

procedure TJobBagDelivery.SetDeliveryNo(const Value: integer);
begin
  FDeliveryNo := Value;
end;

procedure TJobBagDelivery.SetDeliveryNotePrinted(const Value: string);
begin
  FDeliveryNotePrinted := Value;
end;

procedure TJobBagDelivery.SetDeliveryWeightKilos(const Value: double);
begin
  FDeliveryWeightKilos := Value;
end;

procedure TJobBagDelivery.SetNumberOfBoxes(const Value: integer);
begin
  FNumberOfBoxes := Value;
end;

procedure TJobBagDelivery.SetPackageName(const Value: string);
begin
  FPackageName := Value;
end;

procedure TJobBagDelivery.SetPackageType(const Value: integer);
begin
  FPackageType := Value;
end;

procedure TJobBagDelivery.SetParent(const Value: TJobBag);
begin
  FParent := Value;
end;

procedure TJobBagDelivery.SetQtyDelivered(const Value: double);
begin
  FQtyDelivered := Value;
end;

procedure TJobBagDelivery.SetQtyToDeliver(const Value: double);
begin
  FQtyToDeliver := Value;
end;

procedure TJobBagDelivery.SetRep(const Value: integer);
begin
  FRep := Value;
end;

procedure TJobBagDelivery.SetRepName(const Value: string);
begin
  FRepName := Value;
end;

procedure TJobBagDelivery.SetService(const Value: integer);
begin
  FService := Value;
end;

procedure TJobBagDelivery.SetServiceName(const Value: string);
begin
  FServiceName := Value;
end;

procedure TJobBagDelivery.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TJobBagDelivery.SetSupplierBranch(const Value: integer);
begin
  FSupplierBranch := Value;
end;

procedure TdmJobBag.qryAllSalesInvoicesCalcFields(DataSet: TDataSet);
begin
  with qryAllSalesInvoiceCharges do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := qryAllSalesInvoices.fieldbyname('Sales_invoice').asinteger;
      open;
      qryAllSalesInvoices.FieldByName('Total_Goods').asfloat := qryAllSalesInvoices.fieldbyname('Goods_Value').asfloat + fieldbyname('Amount_Total').asfloat;
      qryAllSalesInvoices.FieldByName('Total_Vat').asfloat := qryAllSalesInvoices.fieldbyname('Vat_Value').asfloat + fieldbyname('Vat_Total').asfloat;
      qryAllSalesInvoices.FieldByName('Total_Invoice').asfloat := qryAllSalesInvoices.fieldbyname('Total_Value').asfloat +
                                                                  fieldbyname('Amount_Total').asfloat + fieldbyname('Vat_Total').asfloat;
    end;
end;

procedure TdmJobBag.qryAllPurchInvoicesCalcFields(DataSet: TDataSet);
begin
  with qryAllPurchInvoiceCharges do
    begin
      close;
      parambyname('Supplier_Invoice').asinteger := qryAllPurchInvoices.fieldbyname('Supplier_invoice').asinteger;
      open;
      qryAllPurchInvoices.FieldByName('Total_Goods').asfloat := qryAllPurchInvoices.fieldbyname('Goods_Value').asfloat + fieldbyname('Amount_Total').asfloat;
      qryAllPurchInvoices.FieldByName('Total_Vat').asfloat := qryAllPurchInvoices.fieldbyname('Vat_Value').asfloat + fieldbyname('Vat_Total').asfloat;
      qryAllPurchInvoices.FieldByName('Total_Invoice').asfloat := qryAllPurchInvoices.fieldbyname('Total_Value').asfloat +
                                                                  fieldbyname('Amount_Total').asfloat + fieldbyname('Vat_Total').asfloat;
    end;
end;

end.

