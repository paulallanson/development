unit PBPOObjects;

interface

uses
  Classes, Forms, PBNarrativeDM, contnrs, windows, PBDocObjects, Variants;

type
  TAddressType  = (atAdHoc, atSupplier, atRep, atCustomer, atCompany);
  TPONCMode  = (poncAdd, poncChange, poncDelete, poncView, poncRestrict, poncCopy);
  TPOSCMode  = (poscAdd, poscChange, poscDelete, poscView, poscRestrict, poscCopy);

  TIntNote = class
  private
    FOperator: integer;
    FNarrative: TNarrative;
    FDateEntered: TDateTime;
    FOperatorName: string;
    procedure SetNarrative(const Value: TNarrative);
    procedure SetOperator(const Value: integer);
    procedure SetDateEntered(const Value: TDateTime);
    procedure SetOperatorName(const Value: string);
  published
    constructor Create;
    destructor Destroy; override;
    property DateEntered: TDateTime read FDateEntered write SetDateEntered;
    property Narrative: TNarrative read FNarrative write SetNarrative;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
  end;

  TIntNoteList = class(TObjectList)
  private
    function GetNotes(index: integer): TIntNote;
    procedure SetNotes(index: integer; const Value: TIntNote);
  public
    function add(IntNote: TIntNote): integer;
    property Items[index: integer]: TIntNote read GetNotes write SetNotes; default;
  end;

  TDeliveryLine = class
  private
    FDatePoint: TDateTime;
    FQtyDelivered: Double;
    FQtyToDeliver: Double;
    FQtyInvoiced: Double;
    FBranchNo: Integer;
    FSupplier: Integer;
    FCustomer: Integer;
    FNoOfBoxes: Integer;
    FBranchNoZero: Integer;
    FDeliveryNo: Integer;
    FLine: Integer;
    FAdHocAddress: Integer;
    FRep: Integer;
    FInstructions: string;
    FDeliverViaCompany: string;
    FDeliveryToStock: string;
    FDeliveryNotePrinted: string;
    FDateDelivActual: TDateTime;
    FGoodsRequiredbyCust: TDateTime;
    FFAO: string;
    FCompanyBranch: integer;
    FWeight: double;
    FService: integer;
    FCourier: integer;
    FPackType: integer;
    function  GetAddressType : TAddressType;
    procedure SetAdHocAddress(const Value: Integer);
    procedure SetBranchNo(const Value: Integer);
    procedure SetBranchNoZero(const Value: Integer);
    procedure SetCustomer(const Value: Integer);
    procedure SetDatePoint(const Value: TDateTime);
    procedure SetDeliveryNo(const Value: Integer);
    procedure SetLine(const Value: Integer);
    procedure SetNoOfBoxes(const Value: Integer);
    procedure SetQtyDelivered(const Value: Double);
    procedure SetQtyInvoiced(const Value: Double);
    procedure SetQtyToDeliver(const Value: Double);
    procedure SetRep(const Value: Integer);
    procedure SetSupplier(const Value: Integer);
    procedure SetInstructions(const Value: string);
    procedure SetDeliverViaCompany(const Value: string);
    procedure SetDateDelivActual(const Value: TDateTime);
    procedure SetDeliveryNotePrinted(const Value: string);
    procedure SetDeliveryToStock(const Value: string);
    procedure SetGoodsRequiredbyCust(const Value: TDateTime);
    procedure SetFAO(const Value: string);
    procedure SetCompanyBranch(const Value: integer);
    procedure SetCourier(const Value: integer);
    procedure SetService(const Value: integer);
    procedure SetWeight(const Value: double);
    procedure SetPackType(const Value: integer);
  public
    procedure Assign(aDelivery: TDeliveryLine);
    function Clone: TDeliveryLine;
    property AddressType: TAddressType read GetAddressType;
    property AdHocAddress: Integer read FAdHocAddress write SetAdHocAddress;
    property BranchNo: Integer read FBranchNo write SetBranchNo;
    property BranchNoZero: Integer read FBranchNoZero write SetBranchNoZero;
    property CompanyBranch: integer read FCompanyBranch write SetCompanyBranch;
    property Customer: Integer read FCustomer write SetCustomer;
    property Courier: integer read FCourier write SetCourier;
    property DatePoint: TDateTime read FDatePoint write SetDatePoint;
    property DeliveryNo: Integer read FDeliveryNo write SetDeliveryNo;
    property GoodsRequiredbyCust: TDateTime read FGoodsRequiredbyCust write SetGoodsRequiredbyCust;
    property Instructions: string read FInstructions write SetInstructions;
    property Line: Integer read FLine write SetLine;
    property NoOfBoxes: Integer read FNoOfBoxes write SetNoOfBoxes;
    property QtyDelivered: Double read FQtyDelivered write SetQtyDelivered;
    property QtyInvoiced: Double read FQtyInvoiced write SetQtyInvoiced;
    property QtyToDeliver: Double read FQtyToDeliver write SetQtyToDeliver;
    property Rep: Integer read FRep write SetRep;
    property Supplier: Integer read FSupplier write SetSupplier;
    property Service: integer read FService write SetService;
    property PackType: integer read FPackType write SetPackType;
    property DeliverViaCompany: string read FDeliverViaCompany write SetDeliverViaCompany;
    property DateDelivActual: TDateTime read FDateDelivActual write SetDateDelivActual;
    property DeliveryToStock: string read FDeliveryToStock write SetDeliveryToStock;
    property DeliveryNotePrinted: string read FDeliveryNotePrinted write SetDeliveryNotePrinted;
    property FAO: string read FFAO write SetFAO;
    property Weight: double read FWeight write SetWeight;
  end;

  TDeliveryLines = class;

  TNonConform = class
  private
    FTotalCost: double;
    FCosttoClient: double;
    FRaisedBy: integer;
    FNCDepartment: integer;
    FQAOperator: integer;
    FNonConformNo: integer;
    FNarrative: integer;
    FResponse: integer;
    FStatus: integer;
    FNCType: integer;
    FPreventative: integer;
    FNCNumber: integer;
    FOperator: integer;
    FCorrective: integer;
    FOperatorName: string;
    FQAOperatorName: string;
    FNarrativeText: string;
    FNCTypeDescription: string;
    FInactive: string;
    FNCDepartmentName: string;
    FResponseNotes: string;
    FRaisedByName: string;
    FPreventativeNotes: string;
    FCorrectiveNotes: string;
    FInactiveDate: TDateTime;
    FDatePoint: TDateTime;
    FCorrectiveDate: TDateTime;
    FPreventativeDate: TDatetime;
    FResponseDate: TDateTime;
    FQASignOffDate: TDateTime;
    FLine: integer;
    FJobRePrinted: string;
    FSamplesAvailable: string;
    FNCCategory: integer;
    FNCCategoryDescription: string;
    function GetStatusDescription: string;
    procedure SetCorrective(const Value: integer);
    procedure SetCorrectiveDate(const Value: TDateTime);
    procedure SetCorrectiveNotes(const Value: string);
    procedure SetCosttoClient(const Value: double);
    procedure SetDatePoint(const Value: TDateTime);
    procedure SetInactive(const Value: string);
    procedure SetInactiveDate(const Value: TDateTime);
    procedure SetNarrative(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetNCDepartment(const Value: integer);
    procedure SetNCDepartmentName(const Value: string);
    procedure SetNCNumber(const Value: integer);
    procedure SetNCType(const Value: integer);
    procedure SetNCTypeDescription(const Value: string);
    procedure SetNonConformNo(const Value: integer);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetPreventative(const Value: integer);
    procedure SetPreventativeDate(const Value: TDatetime);
    procedure SetPreventativeNotes(const Value: string);
    procedure SetQAOperator(const Value: integer);
    procedure SetQAOperatorName(const Value: string);
    procedure SetQASignOffDate(const Value: TDateTime);
    procedure SetRaisedBy(const Value: integer);
    procedure SetRaisedByName(const Value: string);
    procedure SetResponse(const Value: integer);
    procedure SetResponseDate(const Value: TDateTime);
    procedure SetResponseNotes(const Value: string);
    procedure SetStatus(const Value: integer);
    procedure SetTotalCost(const Value: double);
    procedure SetLine(const Value: integer);
    procedure SetJobRePrinted(const Value: string);
    procedure SetSamplesAvailable(const Value: string);
    procedure SetNCCategory(const Value: integer);
    procedure SetNCCategoryDescription(const Value: string);
  public
    procedure Assign(aNonConform: TNonConform);
    function Clone: TNonConform;
    property Corrective: integer read FCorrective write SetCorrective;
    property CorrectiveDate: TDateTime read FCorrectiveDate write SetCorrectiveDate;
    property CorrectiveNotes: string read FCorrectiveNotes write SetCorrectiveNotes;
    property DatePoint: TDateTime read FDatePoint write SetDatePoint;
    property JobRePrinted: string read FJobRePrinted write SetJobRePrinted;
    property Line: integer read FLine write SetLine;
    property NonConformNo: integer read FNonConformNo write SetNonConformNo;
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

  TNonConformDocs = class;

  TStockCode = class
  private
    FQtyOrdered: double;
    FQtyDelivered: double;
    FCodeNo: integer;
    FFormReference: integer;
    FLine: integer;
    FStockReference: string;
    FFormReferenceID: string;
    FDescription: string;
    procedure SetCodeNo(const Value: integer);
    procedure SetDescription(const Value: string);
    procedure SetFormReference(const Value: integer);
    procedure SetFormReferenceID(const Value: string);
    procedure SetLine(const Value: integer);
    procedure SetQtyDelivered(const Value: double);
    procedure SetQtyOrdered(const Value: double);
    procedure SetStockReference(const Value: string);
  public
    procedure Assign(aStockCode: TStockCode);
    function Clone: TStockCode;
    property CodeNo: integer read FCodeNo write SetCodeNo;
    property Description: string read FDescription write SetDescription;
    property FormReference: integer read FFormReference write SetFormReference;
    property FormReferenceID: string read FFormReferenceID write SetFormReferenceID;
    property Line: integer read FLine write SetLine;
    property QtyOrdered: double read FQtyOrdered write SetQtyOrdered;
    property QtyDelivered: double read FQtyDelivered write SetQtyDelivered;
    property StockReference: string read FStockReference write SetStockReference;
  end;

  TStockCodes = class;

  TExtraCharge = class
  private
    FQuotationPrice: Currency;
    FAmount: Double;
    FAdditionalCharge: Integer;
    FLine: Integer;
    FDetails: string;
    FVatCode: Integer;
    procedure SetAdditionalCharge(const Value: Integer);
    procedure SetAmount(const Value: Double);
    procedure SetDetails(const Value: string);
    procedure SetLine(const Value: Integer);
    procedure SetQuotationPrice(const Value: Currency);
    procedure SetVatCode(const Value: Integer);
  public
    procedure Assign(anExtra: TExtraCharge);
    function Clone: TExtraCharge;
    property AdditionalCharge: Integer read FAdditionalCharge write
      SetAdditionalCharge;
    property Amount: Double read FAmount write SetAmount;
    property Details: string read FDetails write SetDetails;
    property Line: Integer read FLine write SetLine;
    property QuotationPrice: Currency read FQuotationPrice write
      SetQuotationPrice;
    property VatCode: Integer read FVatCode write SetVatCode;
  end;

  TExtraCharges = class;

  TPartDetail = class
  private
    FSameAsPart: Integer;
    FPartNo: Integer;
    FHeading: string;
    FRightMarginType: string;
    FReverseInks: string;
    FPaperColour: string;
    FPaperWeight: string;
    FPaperMaterial: string;
    FLeftMarginWidth: string;
    FRightMarginWidth: string;
    FLeftMarginType: string;
    FPaperBrand: string;
    FFaceInks: string;
    FLine: Integer;
    FPartDescription: string;
    FPlateChanges: integer;
    function GetPartNoStr: string;
    procedure SetFaceInks(const Value: string);
    procedure SetHeading(const Value: string);
    procedure SetLeftMarginType(const Value: string);
    procedure SetLeftMarginWidth(const Value: string);
    procedure SetPaperBrand(const Value: string);
    procedure SetPaperColour(const Value: string);
    procedure SetPaperMaterial(const Value: string);
    procedure SetPaperWeight(const Value: string);
    procedure SetPartNo(const Value: Integer);
    procedure SetReverseInks(const Value: string);
    procedure SetRightMarginType(const Value: string);
    procedure SetRightMarginWidth(const Value: string);
    procedure SetSameAsPart(const Value: Integer);
    procedure SetLine(const Value: Integer);
    procedure SetPartDescription(const Value: string);
    procedure SetPlateChanges(const Value: integer);
  public
    procedure Assign(aPart: TPartDetail);
    function Clone: TPartDetail;
    property FaceInks: string read FFaceInks write SetFaceInks;
    property Heading: string read FHeading write SetHeading;
    property LeftMarginType: string read FLeftMarginType write
      SetLeftMarginType;
    property LeftMarginWidth: string read FLeftMarginWidth write
      SetLeftMarginWidth;
    property Line: Integer read FLine write SetLine;
    property PaperBrand: string read FPaperBrand write SetPaperBrand;
    property PaperColour: string read FPaperColour write SetPaperColour;
    property PaperMaterial: string read FPaperMaterial write SetPaperMaterial;
    property PaperWeight: string read FPaperWeight write SetPaperWeight;
    property PartNo: Integer read FPartNo write SetPartNo;
    property PartDescription : string read FPartDescription write SetPartDescription;
    property PartNoStr: string read GetPartNoStr;
    property PlateChanges: integer read FPlateChanges write SetPlateChanges;
    property ReverseInks: string read FReverseInks write SetReverseInks;
    property RightMarginType: string read FRightMarginType write
      SetRightMarginType;
    property RightMarginWidth: string read FRightMarginWidth write
      SetRightMarginWidth;
    property SameAsPart: Integer read FSameAsPart write SetSameAsPart;
  end;

  TPartDetails = class;

  TAdditionalDetail = class
  private
    FFAOFlag: Char;
    FDetailNo: Integer;
    FNarrative: Integer;
    FDetail: string;
    FLine: Integer;
    FNarrativeText: string;
    procedure SetDetail(const Value: string);
    procedure SetDetailNo(const Value: Integer);
    procedure SetFAOFlag(const Value: Char);
    procedure SetNarrative(const Value: Integer);
    procedure SetLine(const Value: Integer);
    procedure SetNarrativeText(const Value: string);
  public
    procedure Assign(aDetail: TAdditionalDetail);
    function Clone: TAdditionalDetail;
    property DetailNo: Integer read FDetailNo write SetDetailNo;
    property Detail: string read FDetail write SetDetail;
    property FAOFlag: Char read FFAOFlag write SetFAOFlag;
    property Line: Integer read FLine write SetLine;
    property Narrative: Integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
  end;

  TAdditionalDetails = class;

  TQuestion = class
  private
    FQuestionNo: integer;
    FProductType: integer;
    FAnswer: string;
    FQuestionText: string;
    FPromptType: string;
    procedure SetAnswer(const Value: string);
    procedure SetProductType(const Value: integer);
    procedure SetQuestionNo(const Value: integer);
    procedure SetQuestionText(const Value: string);
    procedure SetPromptType(const Value: string);
  public
    procedure Assign(aQuestion : TQuestion);
    function  Clone : TQuestion;
    property Answer : string read FAnswer write SetAnswer;
    property ProductType : integer read FProductType write SetProductType;
    property QuestionNo : integer read FQuestionNo write SetQuestionNo;
    property QuestionText : string read FQuestionText write SetQuestionText;
    property PromptType: string read FPromptType write SetPromptType;
  end;

  TQuestions = class;

  TCallOffOrder = class
  private
    FPONumber: real;
    FCustomer: integer;
    FOrderQty: integer;
    FSuppContact: integer;
    FSupplier: integer;
    FCustBranch: integer;
    FSuppBranch: integer;
    FCustContact: integer;
    FLine: integer;
    FOrderDate: Tdatetime;
    FRequiredDate: TDateTime;
    FQtyDelivered: Double;
    FDelSupplier: Integer;
    FDelCustomer: Integer;
    FRep: Integer;
    FAdHocAddress: Integer;
    FDelSuppBranchNo: Integer;
    FDelCustBranchNo: Integer;
    FNoOfBoxes: Integer;
    FInstructions: string;
    FDateDelivActual: TDateTime;
    FCallOffNo: integer;
    FPOLine: integer;
    FStatus: integer;
    FCallOffSeq: integer;
    FCostPrice: Double;
    FSellPrice: Double;
    FFormReference: integer;
    FSellUnit: integer;
    FCostUnit: integer;
    FBoxQty: string;
    FDescription: string;
    FCustOrderNo: string;
    FNumberInstructions: string;
    FDelRep: Integer;
    FInActive: string;
    FInActiveReason: integer;
    FInActiveDate: TDateTime;
    FCalloffInvoicedUpfront: string;
    FInvoiceUpfront: string;
    FFAO: string;
    FDescriptiveRef: string;
    function GetAddressType : TAddressType;
    procedure SetCustBranch(const Value: integer);
    procedure SetCustContact(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetLine(const Value: integer);
    procedure SetOrderDate(const Value: Tdatetime);
    procedure SetOrderQty(const Value: integer);
    procedure SetPONumber(const Value: real);
    procedure SetRequiredDate(const Value: TDateTime);
    procedure SetSuppBranch(const Value: integer);
    procedure SetSuppContact(const Value: integer);
    procedure SetSupplier(const Value: integer);
    procedure SetAdHocAddress(const Value: Integer);
    procedure SetDateDelivActual(const Value: TDateTime);
    procedure SetDelCustBranchNo(const Value: Integer);
    procedure SetDelCustomer(const Value: Integer);
    procedure SetDelSuppBranchNo(const Value: Integer);
    procedure SetDelSupplier(const Value: Integer);
    procedure SetInstructions(const Value: string);
    procedure SetNoOfBoxes(const Value: Integer);
    procedure SetQtyDelivered(const Value: Double);
    procedure SetRep(const Value: Integer);
    procedure SetCallOffNo(const Value: integer);
    procedure SetPOLine(const Value: integer);
    procedure SetStatus(const Value: integer);
    procedure SetCallOffSeq(const Value: integer);
    procedure SetBoxQty(const Value: string);
    procedure SetCostPrice(const Value: Double);
    procedure SetCostUnit(const Value: integer);
    procedure SetCustOrderNo(const Value: string);
    procedure SetDescription(const Value: string);
    procedure SetFormReference(const Value: integer);
    procedure SetSellPrice(const Value: Double);
    procedure SetSellUnit(const Value: integer);
    procedure SetNumberInstructions(const Value: string);
    procedure SetDelRep(const Value: Integer);
    procedure SetInActive(const Value: string);
    procedure SetInActiveDate(const Value: TDateTime);
    procedure SetInActiveReason(const Value: integer);
    procedure SetCalloffInvoicedUpfront(const Value: string);
    procedure SetInvoiceUpfront(const Value: string);
    procedure SetFAO(const Value: string);
  public
    procedure Assign(aCallOffOrder: TCallOffOrder);
    function Clone: TCallOffOrder;
    property AddressType: TAddressType read GetAddressType;
    property AdHocAddress: Integer read FAdHocAddress write SetAdHocAddress;
    property CallOffNo: integer read FCallOffNo write SetCallOffNo;
    property Customer: integer read FCustomer write SetCustomer;
    property CustBranch: integer read FCustBranch write SetCustBranch;
    property CustContact: integer read FCustContact write SetCustContact;
    property DateDelivActual: TDateTime read FDateDelivActual write SetDateDelivActual;
    property DelCustBranchNo: Integer read FDelCustBranchNo write SetDelCustBranchNo;
    property DelCustomer: Integer read FDelCustomer write SetDelCustomer;
    property DelSuppBranchNo: Integer read FDelSuppBranchNo write SetDelSuppBranchNo;
    property DelSupplier: Integer read FDelSupplier write SetDelSupplier;
    property DelRep: Integer read FDelRep write SetDelRep;
    property Instructions: string read FInstructions write SetInstructions;
    property Line: integer read FLine write SetLine;
    property NoOfBoxes: Integer read FNoOfBoxes write SetNoOfBoxes;
    property OrderDate: Tdatetime read FOrderDate write SetOrderDate;
    property OrderQty: integer read FOrderQty write SetOrderQty;
    property PONumber: real read FPONumber write SetPONumber;
    property POLine: integer read FPOLine write SetPOLine;
    property QtyDelivered: Double read FQtyDelivered write SetQtyDelivered;
    property Rep: Integer read FRep write SetRep;
    property RequiredDate: TDateTime read FRequiredDate write SetRequiredDate;
    property SuppBranch: integer read FSuppBranch write SetSuppBranch;
    property SuppContact: integer read FSuppContact write SetSuppContact;
    property Supplier: integer read FSupplier write SetSupplier;
    property Status: integer read FStatus write SetStatus;
    property CallOffSeq: integer read FCallOffSeq write SetCallOffSeq;
    property BoxQty: string read FBoxQty write SetBoxQty;
    property SellPrice: Double read FSellPrice write SetSellPrice;
    property CostPrice: Double read FCostPrice write SetCostPrice;
    property SellUnit: integer read FSellUnit write SetSellUnit;
    property CostUnit: integer read FCostUnit write SetCostUnit;
    property Description: string read FDescription write SetDescription;
    property CustOrderNo: string read FCustOrderNo write SetCustOrderNo;
    property FormReference: integer read FFormReference write SetFormReference;
    property NumberInstructions: string read FNumberInstructions write SetNumberInstructions;
    property InActive: string read FInActive write SetInActive;
    property InActiveReason: integer read FInActiveReason write SetInActiveReason;
    property InActiveDate: TDateTime read FInActiveDate write SetInActiveDate;
    property InvoiceUpfront: string read FInvoiceUpfront write SetInvoiceUpfront;
    property CalloffInvoicedUpfront: string read FCalloffInvoicedUpfront write SetCalloffInvoicedUpfront;
    property FAO: string read FFAO write SetFAO;
  end;

  TCallOffOrders = class;

  TOrderLine = class
  private
    FDeliveryLines: TDeliveryLines;
    FExtraCharges: TExtraCharges;
    FPartDetails: TPartDetails;
    FAdditionalDetails: TAdditionalDetails;
    FQuestions : TQuestions;
    FProofRequired: Boolean;
    FSuppInvRecd: Boolean;
    FPrintedPO: Boolean;
    FSellingPrice: Currency;
    FOrderPrice: Currency;
    FListPrice: Currency;
    FQuantity: double;
    FLineZero: Integer;
    FExpectedLife: Integer;
    FEnquiry: Integer;
    FFormReference: Integer;
    FOrderUnit: integer;
    FCustomer: Integer;
    FSellUnit: integer;
    FPOLineStatus: Integer;
    FVATCode: Integer;
    FLine: Integer;
    FProductType: Integer;
    FBranchNo: Integer;
    FCustomersDesc: string;
    FSupplierReference: string;
    FSuppliersDesc: string;
    FCustOrderNo: string;
    FNarrative: Integer;
    FRep: Integer;
    FFormsPerBox: string;
    FSupplierJobRef: string;
    FProofStatus: string;
    FGoodsRequired: TDateTime;
    FProofDate: TDateTime;
    FNarrativeText: string;
    FDepth: double;
    FWidth: double;
    FNoOfParts: Integer;
    FStockLocation: Integer;
    FWidthUnit: string;
    FArtWork: string;
    FDepthUnit: string;
    FNCROTCMix: string;
    FCustomerContact: Integer;
    FNoOfPlateChanges: Integer;
    FNumbering: string;
    FOnHold: string;
    FCallOffOrders: TCallOffOrders;
    FOriginalOrder: real;
    FOriginalOrderLine: integer;
    FNoOfSets: string;
    FNoOfCalloffs: string;
    FInactive: string;
    FInactiveReason: integer;
    FInactiveDate: TDateTime;
    FCalloffInvoicedUpfront: string;
    FInvoiceUpfront: string;
    FQtyinStock: double;
    FQtyInvoiced: double;
    FJobBagNumber: integer;
    FIntNoteList: TIntNoteList;
    FGoodsRequiredByCust: TDateTime;
    FDocumentList: TPODocList;
    FJobType: integer;
    FDescriptiveRef: string;
    FInvoiceBeforeDelivery: boolean;
    FCashSale: string;
    FMatched: boolean;
    FProofStatusDate: TDateTime;
    FCostCentre: string;
    FFSCClaim: integer;
    FFSCMixed: real;
    FNonConformDocs: TNonConformDocs;
    FStockCodes: TStockCodes;
    FFileCopiesReceivedBy: integer;
    FFileCopiesReceived: TDateTime;
    FFileCopiesReceivedName: string;
    FAltPurchaseOrder: string;
    function GetLineStatus: integer;
    procedure SetBranchNo(const Value: Integer);
    procedure SetCustomer(const Value: Integer);
    procedure SetCustomersDesc(const Value: string);
    procedure SetCustOrderNo(const Value: string);
    procedure SetEnquiry(const Value: Integer);
    procedure SetExpectedLife(const Value: Integer);
    procedure SetFormReference(const Value: Integer);
    procedure SetFormsPerBox(const Value: string);
    procedure SetGoodsRequired(const Value: TDateTime);
    procedure SetLine(const Value: Integer);
    procedure SetLineZero(const Value: Integer);
    procedure SetListPrice(const Value: Currency);
    procedure SetNarrative(const Value: Integer);
    procedure SetOrderPrice(const Value: Currency);
    procedure SetOrderUnit(const Value: integer);
    procedure SetPOLineStatus(const Value: Integer);
    procedure SetPrintedPO(const Value: Boolean);
    procedure SetProductType(const Value: Integer);
    procedure SetProofDate(const Value: TDateTime);
    procedure SetProofRequired(const Value: Boolean);
    procedure SetProofStatus(const Value: string);
    procedure SetQuantity(const Value: double);
    procedure SetRep(const Value: Integer);
    procedure SetSellingPrice(const Value: Currency);
    procedure SetSellUnit(const Value: integer);
    procedure SetSuppInvRecd(const Value: Boolean);
    procedure SetSupplierJobRef(const Value: string);
    procedure SetSupplierReference(const Value: string);
    procedure SetSuppliersDesc(const Value: string);
    procedure SetVATCode(const Value: Integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetArtWork(const Value: string);
    procedure SetDepth(const Value: double);
    procedure SetDepthUnit(const Value: string);
    procedure SetNCROTCMix(const Value: string);
    procedure SetNoOfParts(const Value: Integer);
    procedure SetStockLocation(const Value: Integer);
    procedure SetWidth(const Value: double);
    procedure SetWidthUnit(const Value: string);
    procedure SetCustomerContact(const Value: Integer);
    procedure SetNoOfPlateChanges(const Value: Integer);
    procedure SetNumbering(const Value: string);
    procedure SetOnHold(const Value: string);
    procedure SetOriginalOrder(const Value: real);
    procedure SetOriginalOrderLine(const Value: integer);
    procedure SetNoOfCalloffs(const Value: string);
    procedure SetNoOfSets(const Value: string);
    procedure SetInactive(const Value: string);
    procedure SetInactiveDate(const Value: TDateTime);
    procedure SetInactiveReason(const Value: integer);
    procedure SetCalloffInvoicedUpfront(const Value: string);
    procedure SetInvoiceUpfront(const Value: string);
    procedure SetQtyinStock(const Value: double);
    procedure SetQtyInvoiced(const Value: double);
    procedure SetJobBagNumber(const Value: integer);
    procedure SetIntNoteList(const Value: TIntNoteList);
    procedure SetGoodsRequiredByCust(const Value: TDateTime);
    procedure SetDocumentList(const Value: TPODocList);
    procedure SetJobType(const Value: integer);
    procedure SetDescriptiveRef(const Value: string);
    procedure SetInvoiceBeforeDelivery(const Value: boolean);
    procedure SetCashSale(const Value: string);
    procedure SetMatched(const Value: boolean);
    procedure SetProofStatusDate(const Value: TDateTime);
    procedure SetCostCentre(const Value: string);
    procedure SetFSCClaim(const Value: integer);
    procedure SetFSCMixed(const Value: real);
    function GetTotalCostValue: currency;
    procedure SetFileCopiesReceived(const Value: TDateTime);
    procedure SetFileCopiesReceivedBy(const Value: integer);
    procedure SetFileCopiesReceivedName(const Value: string);
    procedure SetAltPurchaseOrder(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(aLine: TOrderLine);
    function Clone: TOrderLine;
    property AdditionalDetails: TAdditionalDetails read FAdditionalDetails;
    property AltPurchaseOrder: string read FAltPurchaseOrder write SetAltPurchaseOrder;
    property ArtWork: string read FArtWork write SetArtWork;
    property BranchNo: Integer read FBranchNo write SetBranchNo;
    property CallOffOrders: TCallOffOrders read FCallOffOrders;
    property CashSale: string read FCashSale write SetCashSale;
    property CostCentre: string read FCostCentre write SetCostCentre;
    property Customer: Integer read FCustomer write SetCustomer;
    property CustomerContact: Integer read FCustomerContact write SetCustomerContact;
    property CustomersDesc: string read FCustomersDesc write SetCustomersDesc;
    property DescriptiveRef: string read FDescriptiveRef write SetDescriptiveRef;
    property CustOrderNo: string read FCustOrderNo write SetCustOrderNo;
    property DeliveryLines: TDeliveryLines read FDeliveryLines;
    property Depth: double read FDepth write SetDepth;
    property DepthUnit: string read FDepthUnit write SetDepthUnit;
    property Enquiry: Integer read FEnquiry write SetEnquiry;
    property ExpectedLife: Integer read FExpectedLife write SetExpectedLife;
    property ExtraCharges: TExtraCharges read FExtraCharges;
    property FileCopiesReceived: TDateTime read FFileCopiesReceived write SetFileCopiesReceived;
    property FileCopiesReceivedName: string read FFileCopiesReceivedName write SetFileCopiesReceivedName;
    property FileCopiesReceivedBy: integer read FFileCopiesReceivedBy write SetFileCopiesReceivedBy;
    property FormReference: Integer read FFormReference write SetFormReference;
    property FormsPerBox: string read FFormsPerBox write SetFormsPerBox;
    property FSCClaim: integer read FFSCClaim write SetFSCClaim;
    property FSCMixed: real read FFSCMixed write SetFSCMixed;
    property GoodsRequired: TDateTime read FGoodsRequired write SetGoodsRequired;
    property GoodsRequiredByCust: TDateTime read FGoodsRequiredByCust write SetGoodsRequiredByCust;
    property InvoiceBeforeDelivery: boolean read FInvoiceBeforeDelivery write SetInvoiceBeforeDelivery;
    property JobBagNumber: integer read FJobBagNumber write SetJobBagNumber;
    property JobType: integer read FJobType write SetJobType;
    property Line: Integer read FLine write SetLine;
    property LineZero: Integer read FLineZero write SetLineZero;
    property ListPrice: Currency read FListPrice write SetListPrice;
    property Matched: boolean read FMatched write SetMatched;
    property Narrative: Integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property NonConformDocs: TNonConformDocs read FNonConformDocs;
    property NoOfParts: Integer read FNoOfParts write SetNoOfParts;
    property NoOfPlateChanges: Integer read FNoOfPlateChanges write SetNoOfPlateChanges;
    property NCROTCMix: string read FNCROTCMix write SetNCROTCMix;
    property OrderPrice: Currency read FOrderPrice write SetOrderPrice;
    property OrderUnit: integer read FOrderUnit write SetOrderUnit;
    property PartDetails: TPartDetails read FPartDetails;
    property POLineStatus: Integer read FPOLineStatus write SetPOLineStatus;
    property PrintedPO: Boolean read FPrintedPO write SetPrintedPO;
    property ProductType: Integer read FProductType write SetProductType;
    property ProofDate: TDateTime read FProofDate write SetProofDate;
    property ProofRequired: Boolean read FProofRequired write SetProofRequired;
    property ProofStatus: string read FProofStatus write SetProofStatus;
    property ProofStatusDate: TDateTime read FProofStatusDate write SetProofStatusDate;
    property Quantity: double read FQuantity write SetQuantity;
    property Questions : TQuestions read FQuestions;
    property Rep: Integer read FRep write SetRep;
    property SellingPrice: Currency read FSellingPrice write SetSellingPrice;
    property SellUnit: integer read FSellUnit write SetSellUnit;
    property StockLocation: Integer read FStockLocation write SetStockLocation;
    property SuppInvRecd: Boolean read FSuppInvRecd write SetSuppInvRecd;
    property SupplierJobRef: string read FSupplierJobRef write
      SetSupplierJobRef;
    property SupplierReference: string read FSupplierReference write
      SetSupplierReference;
    property SuppliersDesc: string read FSuppliersDesc write SetSuppliersDesc;
    property StockCodes: TStockCodes read FStockCodes;
    property Numbering: string read FNumbering write SetNumbering;
    property Width: double read FWidth write SetWidth;
    property WidthUnit: string read FWidthUnit write SetWidthUnit;
    property OnHold: string read FOnHold write SetOnHold;
    property OriginalOrder: real read FOriginalOrder write SetOriginalOrder;
    property OriginalOrderLine: integer read FOriginalOrderLine write SetOriginalOrderLine;
    property NoOfSets: string read FNoOfSets write SetNoOfSets;
    property NoOfCalloffs: string read FNoOfCalloffs write SetNoOfCalloffs;
    property Inactive: string read FInactive write SetInactive;
    property InactiveReason: integer read FInactiveReason write SetInactiveReason;
    property InactiveDate: TDateTime read FInactiveDate write SetInactiveDate;
    property InvoiceUpfront: string read FInvoiceUpfront write SetInvoiceUpfront;
    property CalloffInvoicedUpfront: string read FCalloffInvoicedUpfront write SetCalloffInvoicedUpfront;
    property QtyinStock: double read FQtyinStock write SetQtyinStock;
    property QtyInvoiced: double read FQtyInvoiced write SetQtyInvoiced;
    property LineStatus: integer read GetLineStatus;
    property IntNoteList: TIntNoteList read FIntNoteList write SetIntNoteList;
    property DocumentList: TPODocList read FDocumentList write SetDocumentList;
    property VATCode: Integer read FVATCode write SetVATCode;
    property TotalCostValue: currency read GetTotalCostValue;
  end;

  TNonConformDocs = class
  private
    FItems : TList;
    function GetCount: integer;
    function GetItems(Index: integer): TNonConform;
    function GetMaxLineNo: integer;
    procedure SetItems(Index: integer; const Value: TNonConform);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aNonConform : TNonConform);
    procedure Clear;
    function  Clone : TNonConformDocs;
    procedure Delete(const Index : integer);
    function IndexOf(const NonConformNo: integer) : integer;
    property Count : integer read GetCount;
    property Items[Index : integer] : TNonConform read GetItems write SetItems;
      default;
    property MaxLineNo: integer read GetMaxLineNo;
  end;

  TStockCodes = class
  private
    FItems : TList;
    function GetCount: integer;
    function GetItems(Index: integer): TStockCode;
    function GetMaxLineNo: integer;
    procedure SetItems(Index: integer; const Value: TStockCode);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aStockCode : TStockCode);
    procedure Clear;
    function  Clone : TStockCodes;
    procedure Delete(const Index : integer);
    function IndexOf(const CodeNo: integer) : integer;
    property Count : integer read GetCount;
    property Items[Index : integer] : TStockCode read GetItems write SetItems; default;
    property MaxLineNo: integer read GetMaxLineNo;
  end;

  TDeliveryLines = class
  private
    FLines: TList;
    FMaxLines: Integer;
    function GetCount: Integer;
    function GetLines(Index: Integer): TDeliveryLine;
    function GetNextLineNumber: Integer;
    function GetTotal: Double;
    function GetTotalDelivered: Double;
    function GetTotalinStock: Double;
    function GetTotalStock: Double;
    procedure SetLines(Index: Integer; const Value: TDeliveryLine);
    function GetStockSupplier: integer;
    function GetStockSupplierBr: integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aLine: TDeliveryLine);
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TDeliveryLines;
    function IndexFromDelNo(const DelNo: Integer): Integer;
    property Count: Integer read GetCount;
    property Lines[Index: Integer]: TDeliveryLine read GetLines write SetLines;
    default;
    property MaxLines: Integer read FMaxLines;
    property NextLineNumber: Integer read GetNextLineNumber;
    property StockSupplier: integer read GetStockSupplier;
    property StockSupplierBr: integer read GetStockSupplierBr;
    property Total: Double read GetTotal;
    property TotalDelivered: Double read GetTotalDelivered;
    property TotalStock: Double read GetTotalStock;
    property TotalinStock: Double read GetTotalinStock;
  end;

  TExtraCharges = class
  private
    FCharges: TList;
    FMaxCharges: Integer;
    function GetCount: Integer;
    function GetCharges(Index: Integer): TExtraCharge;
    function GetNextChargeNumber: Integer;
    function GetTotal: Double;
    function GetTotalSell: Double;
    procedure SetCharges(Index: Integer; const Value: TExtraCharge);
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
    property TotalSell: Double read GetTotalSell;
  end;

  TPartDetails = class
  private
    FParts: TList;
    FMaxParts: Integer;
    function GetCount: Integer;
    function GetParts(Index: Integer): TPartDetail;
    function GetNextPartNumber: Integer;
    procedure SetParts(Index: Integer; const Value: TPartDetail);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aPart: TPartDetail);
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TPartDetails;
    function IndexFromPartNo(const PartNo: Integer): Integer;
    property Count: Integer read GetCount;
    property Parts[Index: Integer]: TPartDetail read GetParts write SetParts;
    default;
    property MaxParts: Integer read FMaxParts;
    property NextPartNumber: Integer read GetNextPartNumber;
  end;

  TAdditionalDetails = class
  private
    FAdditionals: TList;
    FMaxAdditionals: Integer;
    function GetCount: Integer;
    function GetAdditionals(Index: Integer): TAdditionalDetail;
    function GetNextAdditionalNumber: Integer;
    procedure SetAdditionals(Index: Integer; const Value: TAdditionalDetail);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aAdditional: TAdditionalDetail);
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TAdditionalDetails;
    function IndexFromDetailNo(const DetailNo: Integer): Integer;
    property Count: Integer read GetCount;
    property Additionals[Index: Integer]: TAdditionalDetail
      read GetAdditionals write SetAdditionals; default;
    property MaxAdditionals: Integer read FMaxAdditionals;
    property NextAdditionalNumber: Integer read GetNextAdditionalNumber;
  end;

  TQuestions = class
  private
    FQuestions: TList;
    function GetCount: Integer;
    function GetQuestions(Index: Integer): TQuestion;
    procedure SetQuestions(Index: Integer; const Value: TQuestion);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aQuestion: TQuestion);
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TQuestions;
    function IndexFromQuestionNo(const QuestionNo: Integer): Integer;
    property Count: Integer read GetCount;
    property Questions[Index: Integer]: TQuestion
      read GetQuestions write SetQuestions; default;
  end;

  TCallOffOrders = class
  private
    FLines: TList;
    FMaxLines: Integer;
    function GetCount: Integer;
    function GetNextLineNumber: Integer;
    function GetLines(Index: Integer): TCallOffOrder;
    procedure SetLines(Index: Integer; const Value: TCallOffOrder);
    function GetTotal: Double;
    function GetTotalDelivered: Double;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aLine: TCallOffOrder);
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TCallOffOrders;
    function IndexFromCallOffNo(const CallNo: Integer): Integer;
    property Count: Integer read GetCount;
    property Lines[Index: Integer]: TCallOffOrder read GetLines
          write SetLines; default;
    property MaxLines: Integer read FMaxLines;
    property NextLineNumber: Integer read GetNextLineNumber;
    property Total: Double read GetTotal;
    property TotalDelivered: Double read GetTotalDelivered;
  end;

  TOrderLines = class
  private
    FLines: TList;
    FMaxLines: Integer;
    function GetCount: Integer;
    function GetLines(Index: Integer): TOrderLine;
    function GetNextLineNumber: Integer;
    procedure SetLines(Index: Integer; const Value: TOrderLine);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aLine: TOrderLine);
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TOrderLines;
    function IndexFromLineNo(const LineNo: Integer): Integer;
    property Count: Integer read GetCount;
    property Lines[Index: Integer]: TOrderLine read GetLines write SetLines;
    default;
    property MaxLines: Integer read FMaxLines;
    property NextLineNumber: Integer read GetNextLineNumber;
  end;

  TPurchaseOrder = class
  private
    FSupplier: Integer;
    FPONumber: real;
    FBranchNo: Integer;
    FPOHeadStatus: Integer;
    FCurrencyCode: Integer;
    FSupplierContactNo: Integer;
    FDatePoint: TDateTime;
    FFuncMode: char;
    FOrderLines: TOrderLines;
    FOfficeContact: Integer;
    FDefaultVatCode: Integer;
    FBranchName: string;
    FSupplierName: string;
    FNoDelInstruct: Boolean;
    FTheirContact: string;
    FSalutation: string;
    FOurContact: string;
    FAccountTeam: integer;
    FAccountTeamName: string;
    FAuthorisedBy: integer;
    FAuthorisedByName: string;
    FNarrative: integer;
    FNarrativeText: string;
    FNeedsAuthorising: boolean;
    FOperator: integer;
    FCourier: integer;
    FNonConformDocs: TNonConformDocs;
    procedure SetOfficeContact(const Value: Integer);
    procedure SetDefaultVatCode(const Value: Integer);
    procedure SetBranchName(const Value: string);
    procedure SetSupplierName(const Value: string);
    procedure SetNoDelInstruct(const Value: Boolean);
    procedure SetTheirContact(const Value: string);
    procedure SetSalutation(const Value: string);
    procedure SetOurContact(const Value: string);
    procedure SetAccountTeam(const Value: integer);
    procedure SetAccountTeamName(const Value: string);
    procedure SetAuthorisedBy(const Value: integer);
    procedure SetAuthorisedByName(const Value: string);
    procedure SetNarrative(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetNeedsAuthorising(const Value: boolean);
    procedure SetOperator(const Value: integer);
    procedure SetCourier(const Value: integer);
    procedure SetNonConformDocs(const Value: TNonConformDocs);
  public
    constructor Create(DataMod : TDataModule);
    destructor Destroy; override;
    procedure Clear;
    function Clone: TPurchaseOrder;
    property AccountTeam: integer read FAccountTeam write SetAccountTeam;
    property AccountTeamName: string read FAccountTeamName write SetAccountTeamName;
    property AuthorisedBy: integer read FAuthorisedBy write SetAuthorisedBy;
    property AuthorisedByName: string read FAuthorisedByName write SetAuthorisedByName;
    property Courier: integer read FCourier write SetCourier;
    property NeedsAuthorising: boolean read FNeedsAuthorising write SetNeedsAuthorising;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property BranchNo: Integer read FBranchNo write FBranchNo;
    property BranchName : string read FBranchName write SetBranchName;
    property CurrencyCode: Integer read FCurrencyCode write FCurrencyCode;
    property DatePoint: TDateTime read FDatePoint write FDatePoint;
    property DefaultVatCode: Integer read FDefaultVatCode write
      SetDefaultVatCode;
    property FuncMode: char read FFuncMode write FFuncMode;
    property Operator: integer read FOperator write SetOperator;
    property OfficeContact: Integer read FOfficeContact write SetOfficeContact;
    property OrderLines: TOrderLines read FOrderLines write FOrderLines;
    property NoDelInstruct : Boolean read FNoDelInstruct write SetNoDelInstruct;
    property POHeadStatus: Integer read FPOHeadStatus write FPOHeadStatus;
    property PONumber: real read FPONumber write FPONumber;
    property Supplier: Integer read FSupplier write FSupplier;
    property SupplierName : string read FSupplierName write SetSupplierName;
    property SupplierContactNo: Integer read FSupplierContactNo
      write FSupplierContactNo;
    property TheirContact: string read FTheirContact write SetTheirContact;
    property Salutation: string read FSalutation write SetSalutation;
    property OurContact: string read FOurContact write SetOurContact;
 end;

  { Commonly used constants }

const
  { Purchase Order Maintenance Function Mode Codes }
  poAdd                       = 'A';
  poChange                    = 'C';
  poDelete                    = 'D';
  poAddToExisting             = 'E';
  poInvoiced                  = 'I';
  poRepeat                    = 'M';
  poCopy                      = 'P';
  poRestore                   = 'R';
  poView                      = 'S';
  poRestrict                  = 'T';
  poCancel                    = 'X';
  poAuthorise                 = 'V';
  poMatched                   = 'Z';

  NarrativeChunkLength        = 100;

  { Purchase Order Limits }
  cMaxDeliveryLines           = 100;
  cMaxCallOffOrders           = 95;
  cMaxExtraCharges            = 10;
  cMaxPartDetails             = 50;
  cMaxAdditionalDetails       = 50;
  cMaxOrderLines              = 100;

  cMillimetres                = 'mm';
  cInches                     = 'in';
  { Additional Details Flag }
  adSupplierOnly              = 'S';
  adCustomerOnly              = 'C';
  adSupplierAndCustomer       = 'B';
  { Enquiry Status values }
  esSome                      = 5;
  esCreated                   = 10;
  esPartSelectedForEst        = 15;
  esSelectedForEst            = 20;
  esPartSentToSupplier        = 25;
  esSentToSupplier            = 30;
  esSomeSupplierResponse      = 35;
  esAllSuppliersReponded      = 40;
  esSomePricesSet             = 45;
  esAllPricesSet              = 50;
  esSomeQuotesPrinted         = 65;
  esAllQuotesPrinted          = 70;
  esSomeConfirmedAsSalesOrd   = 75;
  esAllConfirmedAsSalesOrd    = 80;
  esSomePurchaseOrdersRaised  = 85;
  esAllPurchaseOrdersRaised   = 90;
  esSomeCancelled             = 95;
  esAllCancelled              = 100;
  esSomePurchInvReceived      = 105;
  esAllPurchInvReceived       = 110;
  esSomeSalesInvReceived      = 115;
  esAllSalesInvReceived       = 120;
  esMarkedInactive            = 200;

  { Purchase Order Header Status values }
  phCreated                   = 10;
  phSomeSentToSupplier        = 15;
  phAllSentToSupplier         = 20;
  phPartDelivered             = 21;
  phAllDelivered              = 22;
  phSomeInvoiceRaised         = 25;
  phAllInvoiceRaised          = 30;
  phPartlyInvoiced            = 35;
  phFullyInvoiced             = 40;

  {Purchase Order Line Status values }
  plNotYetSent                = 10;
  plSentToSupplier            = 20;
  plPartDelivered             = 21;
  plAllDelivered              = 22;
  plSomeInvoiceRaised         = 25;
  plSalesInvoiceRaised        = 30;
  plGoodsInvoicedBySupplier   = 40;

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
{ If passed a string or a float, FormatQty will return a string.}
function FormatAnyQty(const Qty: variant): string;
{ If passed a string or a float, PostoNegQty will return a string.  An
  error message will be displayed if the value is invalid. }
function PostoNegQty(const Qty: variant): integer;
{ If passed a string or a float, PostoNegFormatMoney will return a string.  An
  error message will be displayed if the value is invalid. }
function PostoNegMoney(const Money: variant): double;
{ If passed a string or a float, FormatMoney will return a string.  An
  error message will be displayed if the value is invalid. }
function FormatMoney(const Money: variant): string;
{ If passed a string or a float, FormatMoney will return a string.  An
  error message will be displayed if the value is invalid. }
function FormatMoneyTo3DP(const Money: variant): string;
{ BoolToChar will return Y if param is true, false otherwise }
function BoolToChar(const Bool: Boolean): Char;

{ Global variables, how terrible }
var
  PurchaseOrder               : TPurchaseOrder;

implementation

uses UITypes, 
  Dialogs, SysUtils, PBPODataMod;

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
      Result := StrToFloat(vIn);
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
        Result := FormatFloat('######0', StrToFloat(Qty))
      else
        Result := FormatFloat('######0', Qty);
      if StrToFloat(Result) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except
    if VarType(Qty) = VarString then
      MessageDlg('Invalid quantity - ' + Qty, mtError, [mbOK], 0)
    else MessageDlg('Invalid quantity', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function FormatAnyQty(const Qty: variant): string;
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
        Result := FormatFloat('######0', StrToFloat(Qty))
      else
        Result := FormatFloat('######0', Qty);
(*      if StrToFloat(Result) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
*)
    end;

  except
    if VarType(Qty) = VarString then
      MessageDlg('Invalid quantity - ' + Qty, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid quantity', mtError, [mbOK], 0);
    Result := 'X';
  end;
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

function FormatMoney(const Money: variant): string;
begin
  if VarType(Money) = VarString then
  begin
    if Trim(Money) = '' then
    begin
      Result := '';
      Exit;
    end;
  end;
  try
    begin
      if VarType(Money) = VarString then
        Result := FormatFloat('######0.00', StrToFloat(Money))
      else
        Result := FormatFloat('######0.00', Money);
(*
      if StrToFloat(Result) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
*)
    end;
  except
    if VarType(Money) = VarString then
      MessageDlg('Invalid financial value - ' + Money, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid financial value', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function FormatMoneyTo3DP(const Money: variant): string;
begin
  if VarType(Money) = VarString then
  begin
    if Trim(Money) = '' then
    begin
      Result := '';
      Exit;
    end;
  end;
  try
    begin
      if VarType(Money) = VarString then
        Result := FormatFloat('######0.000', StrToFloat(Money))
      else
        Result := FormatFloat('######0.000', Money);
    end;
  except
    if VarType(Money) = VarString then
      MessageDlg('Invalid financial value - ' + Money, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid financial value', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function PosToNegMoney(const Money: variant): double;
begin
  try
    begin
      if VarType(Money) = VarString then
        Result := (StrToFloat(Money)*-1)
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

function BoolToChar(const Bool: Boolean): Char;
begin
  if Bool then
    Result := 'Y'
  else
    Result := 'N';
end;

{ TDeliveryLine }

procedure TDeliveryLine.Assign(aDelivery: TDeliveryLine);
begin
  AdHocAddress := aDelivery.AdHocAddress;
  BranchNo := aDelivery.BranchNo;
  BranchNoZero := aDelivery.BranchNoZero;
  CompanyBranch := aDelivery.CompanyBranch;
  Customer := aDelivery.Customer;
  Courier := aDelivery.Courier;
  DatePoint := aDelivery.DatePoint;
  GoodsRequiredbyCust := aDelivery.GoodsRequiredbyCust;
  DeliveryNo := aDelivery.DeliveryNo;
  Instructions := aDelivery.Instructions;
  Line := aDelivery.Line;
  NoOfBoxes := aDelivery.NoOfBoxes;
  PackType := aDelivery.PackType;
  QtyDelivered := aDelivery.QtyDelivered;
  QtyInvoiced := aDelivery.QtyInvoiced;
  QtyToDeliver := aDelivery.QtyToDeliver;
  Rep := aDelivery.Rep;
  Service := aDelivery.Service;
  Supplier := aDelivery.Supplier;
  DeliverViaCompany := aDelivery.DeliverViaCompany;
  DateDelivActual := aDelivery.DateDelivActual;
  DeliverytoStock := aDelivery.DeliverytoStock;
  DeliveryNotePrinted := aDelivery.DeliveryNotePrinted;
  FAO := aDelivery.FAO;
  Weight := aDelivery.Weight;
end;

function TDeliveryLine.Clone: TDeliveryLine;
begin
  Result := TDeliveryLine.Create;
  Result.Assign(Self);
end;

function TDeliveryLine.GetAddressType: TAddressType;
begin
  if AdHocAddress <> 0 then
    Result := atAdHoc
  else
  if Supplier <> 0 then
    Result := atSupplier
  else
  if Rep <> 0 then
    Result := atRep
  else
  if Customer <> 0 then
    Result := atCustomer
  else
    Result := atCompany;
end;

procedure TDeliveryLine.SetAdHocAddress(const Value: Integer);
begin
  FAdHocAddress := Value;
end;

procedure TDeliveryLine.SetBranchNo(const Value: Integer);
begin
  FBranchNo := Value;
end;

procedure TDeliveryLine.SetBranchNoZero(const Value: Integer);
begin
  FBranchNoZero := Value;
end;

procedure TDeliveryLine.SetCompanyBranch(const Value: integer);
begin
  FCompanyBranch := Value;
end;

procedure TDeliveryLine.SetCourier(const Value: integer);
begin
  FCourier := Value;
end;

procedure TDeliveryLine.SetCustomer(const Value: Integer);
begin
  FCustomer := Value;
end;

procedure TDeliveryLine.SetDateDelivActual(const Value: TDateTime);
begin
  FDateDelivActual := Value;
end;

procedure TDeliveryLine.SetDatePoint(const Value: TDateTime);
begin
  FDatePoint := Value;
end;

procedure TDeliveryLine.SetDeliverViaCompany(const Value: string);
begin
  FDeliverViaCompany := Value;
end;

procedure TDeliveryLine.SetDeliveryNo(const Value: Integer);
begin
  FDeliveryNo := Value;
end;

procedure TDeliveryLine.SetDeliveryNotePrinted(const Value: string);
begin
  FDeliveryNotePrinted := Value;
end;

procedure TDeliveryLine.SetDeliveryToStock(const Value: string);
begin
  FDeliveryToStock := Value;
end;

procedure TDeliveryLine.SetFAO(const Value: string);
begin
  FFAO := Value;
end;

procedure TDeliveryLine.SetGoodsRequiredbyCust(const Value: TDateTime);
begin
  FGoodsRequiredbyCust := Value;
end;

procedure TDeliveryLine.SetInstructions(const Value: string);
begin
  FInstructions := Value;
end;

procedure TDeliveryLine.SetLine(const Value: Integer);
begin
  FLine := Value;
end;

procedure TDeliveryLine.SetNoOfBoxes(const Value: Integer);
begin
  FNoOfBoxes := Value;
end;

procedure TDeliveryLine.SetPackType(const Value: integer);
begin
  FPackType := Value;
end;

procedure TDeliveryLine.SetQtyDelivered(const Value: Double);
begin
  FQtyDelivered := Value;
end;

procedure TDeliveryLine.SetQtyInvoiced(const Value: Double);
begin
  FQtyInvoiced := Value;
end;

procedure TDeliveryLine.SetQtyToDeliver(const Value: Double);
begin
  FQtyToDeliver := Value;
end;

procedure TDeliveryLine.SetRep(const Value: Integer);
begin
  FRep := Value;
end;

procedure TDeliveryLine.SetService(const Value: integer);
begin
  FService := Value;
end;

procedure TDeliveryLine.SetSupplier(const Value: Integer);
begin
  FSupplier := Value;
end;

procedure TDeliveryLine.SetWeight(const Value: double);
begin
  FWeight := Value;
end;

{ TExtraCharge }

procedure TExtraCharge.Assign(anExtra: TExtraCharge);
begin
  AdditionalCharge := anExtra.AdditionalCharge;
  Amount := anExtra.Amount;
  Details := anExtra.Details;
  VatCode := anExtra.VatCode;
  Line := anExtra.Line;
  QuotationPrice := anExtra.QuotationPrice;

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

procedure TExtraCharge.SetDetails(const Value: string);
begin
  FDetails := Value;
end;

procedure TExtraCharge.SetLine(const Value: Integer);
begin
  FLine := Value;
end;

procedure TExtraCharge.SetQuotationPrice(const Value: Currency);
begin
  FQuotationPrice := Value;
end;

procedure TExtraCharge.SetVatCode(const Value: Integer);
begin
  FVatCode := Value;
end;

{ TOrderLine }

procedure TOrderLine.Assign(aLine: TOrderLine);
begin
  FAdditionalDetails.Free;
  FDeliveryLines.Free;
  FExtraCharges.Free;
  FPartDetails.Free;
  FNonConformDocs.free;
  FStockCodes.free;
  FQuestions.Free;
  FAdditionalDetails := aLine.AdditionalDetails.Clone;
  FDeliveryLines := aLine.DeliveryLines.Clone;
  FExtraCharges := aLine.ExtraCharges.Clone;
  FPartDetails := aLine.PartDetails.Clone;
  FNonConformDocs := aLine.NonConformDocs.clone;
  FStockCodes := aLine.StockCodes.clone;
  FQuestions := aLine.Questions.clone;
  ArtWork := aLine.ArtWork;
  AltPurchaseOrder := aLine.AltPurchaseOrder;
  BranchNo := aLine.BranchNo;
  CashSale := aLine.CashSale;
  CostCentre := aLine.CostCentre;
  Customer := aLine.Customer;
  CustomerContact := aLine.CustomerContact;
  CustomersDesc := aLine.CustomersDesc;
  DescriptiveRef := aLine.DescriptiveRef;
  CustOrderNo := aLine.CustOrderNo;
  Depth := aLine.Depth;
  DepthUnit := aLine.DepthUnit;
  Enquiry := aLine.Enquiry;
  ExpectedLife := aLine.ExpectedLife;
  FileCopiesReceived := aLine.FileCopiesReceived;
  FileCopiesReceivedName := aLine.FileCopiesReceivedName;
  FileCopiesReceivedBy := aLine.FileCopiesReceivedBy;
  FormReference := aLine.FormReference;
  FormsPerBox := aLine.FormsPerBox;
  FSCClaim := aLine.FSCClaim;
  FSCMixed := aLine.FSCMixed;
  GoodsRequired := aLine.GoodsRequired;
  GoodsRequiredbyCust := aLine.GoodsRequiredbyCust;
  JobBagNumber := aLine.JobBagNumber;
  JobType := aLine.JobType;
  InvoiceBeforeDelivery := aLine.InvoiceBeforeDelivery;
  Line := aLine.Line;
  LineZero := aLine.LineZero;
  ListPrice := aLine.ListPrice;
  Matched := aLine.Matched;
  Narrative := aLine.Narrative;
  NarrativeText := aLine.NarrativeText;
  NoOfParts := aLine.NoOfParts;
  NoOfPlateChanges := aLine.NoOfPlateChanges;
  NCROTCMix := aLine.NCROTCMix;
  OrderPrice := aLine.OrderPrice;
  OrderUnit := aLine.OrderUnit;
  POLineStatus := aLine.POLineStatus;
  PrintedPO := aLine.PrintedPO;
  ProductType := aLine.ProductType;
  ProofDate := aLine.ProofDate;
  ProofRequired := aLine.ProofRequired;
  ProofStatus := aLine.ProofStatus;
  ProofStatusDate := aLine.ProofStatusDate;
  Quantity := aLine.Quantity;
  Rep := aLine.Rep;
  SellingPrice := aLine.SellingPrice;
  SellUnit := aLine.SellUnit;
  StockLocation := aLine.StockLocation;
  SuppInvRecd := aLine.SuppInvRecd;
  SupplierJobRef := aLine.SupplierJobRef;
  SupplierReference := aLine.SupplierReference;
  SuppliersDesc := aLine.SuppliersDesc;
  Numbering := aLine.Numbering;
  VATCode := aLine.VATCode;
  Width := aLine.Width;
  WidthUnit := aLine.WidthUnit;
  OnHold := aLine.OnHold;
  OriginalOrder := aLine.OriginalOrder;
  OriginalOrderLine := aLine.OriginalOrderLine;
  NoOfSets := aLine.NoOfSets;
  NoOfCallOffs := aLine.NoOfCallOffs;
  InActive := aLine.Inactive;
  InActiveReason := aLine.InactiveReason;
  InActiveDate := aLine.InactiveDate;
  InvoiceUpfront := aLine.InvoiceUpfront;
  CalloffInvoicedUpfront := aLine.CalloffInvoicedUpfront;
  QtyinStock := aLine.QtyinStock;
  QtyInvoiced := aLine.QtyInvoiced;
end;

function TOrderLine.Clone: TOrderLine;
begin
  Result := TOrderLine.Create;
  Result.Assign(Self);
end;

constructor TOrderLine.Create;
begin
  FDeliveryLines := TDeliveryLines.Create;
  FExtraCharges := TExtraCharges.Create;
  FPartDetails := TPartDetails.Create;
  FAdditionalDetails := TAdditionalDetails.Create;
  FQuestions := TQuestions.Create;
  FCallOffOrders := TCallOffOrders.Create;
  FNonConformDocs := TNonConformDocs.Create;
  FStockCodes := TStockCodes.Create;
  self.FIntNoteList := TIntNoteList.Create;
  self.FDocumentList := TPODocList.Create;
end;

destructor TOrderLine.Destroy;
begin
  FDeliveryLines.Free;
  FExtraCharges.Free;
  FPartDetails.Free;
  FAdditionalDetails.Free;
  FQuestions.Free;
  FCallOffOrders.Free;
  FNonConformDocs.Free;
  FStockCodes.Free;
  self.FIntNoteList.Free;
  self.FDocumentList.free;
  FDeliveryLines := nil;
  FExtraCharges := nil;
  FPartDetails := nil;
  FAdditionalDetails := nil;
  FQuestions := nil;
  FCallOffOrders := nil;
  FNonConformDocs := nil;
  FStockCodes := nil;
  self.FIntNoteList := nil;
  self.FDocumentList := nil;
  inherited;
end;

function TOrderLine.GetLineStatus: integer;
begin
  if Quantity = 0 then
    Result := 10
  else
  if QtyInvoiced >= Quantity then
    Result := 30
  else
  if (QtyInvoiced <> 0) and (QtyInvoiced < Quantity) then
    Result := 25
  else
  if (DeliveryLines.TotalDelivered >= Quantity) then
    Result := 22
  else
  if (DeliveryLines.TotalDelivered <> 0) and (DeliveryLines.TotalDelivered < Quantity) then
    Result := 21
  else
  if POLineStatus > 20 then
    Result := 20
  else
    Result := POLineStatus;

  {If delivered and invoiced upfront then set to complete}
  if  (Result > 21) and
      (Result < 25) and
      (InvoiceUpfront = 'N') and
      (self.DeliveryLines.TotalStock > 0) then
    Result := 50;
end;

function TOrderLine.GetTotalCostValue: currency;
var
  PriceUnitFactor: integer;
begin
  PriceUnitFactor := PBPODM.GetPriceUnitFactor(FOrderUnit);

  if PriceUnitFactor = 0 then
    Result := FOrderPrice
  else
    Result := ((FQuantity / PriceUnitFactor) * FOrderPrice);
end;

procedure TOrderLine.SetAltPurchaseOrder(const Value: string);
begin
  FAltPurchaseOrder := Value;
end;

procedure TOrderLine.SetArtWork(const Value: string);
begin
  FArtWork := Value;
end;

procedure TOrderLine.SetBranchNo(const Value: Integer);
begin
  FBranchNo := Value;
end;

procedure TOrderLine.SetCalloffInvoicedUpfront(const Value: string);
begin
  FCalloffInvoicedUpfront := Value;
end;

procedure TOrderLine.SetCashSale(const Value: string);
begin
  FCashSale := Value;
end;

procedure TOrderLine.SetCostCentre(const Value: string);
begin
  FCostCentre := Value;
end;

procedure TOrderLine.SetCustomer(const Value: Integer);
begin
  FCustomer := Value;
end;

procedure TOrderLine.SetCustomerContact(const Value: Integer);
begin
  FCustomerContact := Value;
end;

procedure TOrderLine.SetCustomersDesc(const Value: string);
begin
  FCustomersDesc := Value;
end;

procedure TOrderLine.SetCustOrderNo(const Value: string);
begin
  FCustOrderNo := Value;
end;

procedure TOrderLine.SetDepth(const Value: double);
begin
  FDepth := Value;
end;

procedure TOrderLine.SetDepthUnit(const Value: string);
begin
  FDepthUnit := Value;
end;

procedure TOrderLine.SetDescriptiveRef(const Value: string);
begin
  FDescriptiveRef := Value;
end;

procedure TOrderLine.SetDocumentList(const Value: TPODocList);
begin
  FDocumentList := Value;
end;

procedure TOrderLine.SetEnquiry(const Value: Integer);
begin
  FEnquiry := Value;
end;

procedure TOrderLine.SetExpectedLife(const Value: Integer);
begin
  FExpectedLife := Value;
end;

procedure TOrderLine.SetFileCopiesReceived(const Value: TDateTime);
begin
  FFileCopiesReceived := Value;
end;

procedure TOrderLine.SetFileCopiesReceivedBy(const Value: integer);
begin
  FFileCopiesReceivedBy := Value;
end;

procedure TOrderLine.SetFileCopiesReceivedName(const Value: string);
begin
  FFileCopiesReceivedName := Value;
end;

procedure TOrderLine.SetFormReference(const Value: Integer);
begin
  FFormReference := Value;
end;

procedure TOrderLine.SetFormsPerBox(const Value: string);
begin
  FFormsPerBox := Value;
end;

procedure TOrderLine.SetFSCClaim(const Value: integer);
begin
  FFSCClaim := Value;
end;

procedure TOrderLine.SetFSCMixed(const Value: real);
begin
  FFSCMixed := Value;
end;

procedure TOrderLine.SetGoodsRequired(const Value: TDateTime);
begin
  FGoodsRequired := Value;
end;

procedure TOrderLine.SetGoodsRequiredByCust(const Value: TDateTime);
begin
  FGoodsRequiredByCust := Value;
end;

procedure TOrderLine.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TOrderLine.SetInactiveDate(const Value: TDateTime);
begin
  FInactiveDate := Value;
end;

procedure TOrderLine.SetInactiveReason(const Value: integer);
begin
  FInactiveReason := Value;
end;

procedure TOrderLine.SetIntNoteList(const Value: TIntNoteList);
begin
  FIntNoteList := Value;
end;

procedure TOrderLine.SetInvoiceBeforeDelivery(const Value: boolean);
begin
  FInvoiceBeforeDelivery := Value;
end;

procedure TOrderLine.SetInvoiceUpfront(const Value: string);
begin
  FInvoiceUpfront := Value;
end;

procedure TOrderLine.SetJobBagNumber(const Value: integer);
begin
  FJobBagNumber := Value;
end;

procedure TOrderLine.SetJobType(const Value: integer);
begin
  FJobType := Value;
end;

procedure TOrderLine.SetLine(const Value: Integer);
begin
  FLine := Value;
end;

procedure TOrderLine.SetLineZero(const Value: Integer);
begin
  FLineZero := Value;
end;

procedure TOrderLine.SetListPrice(const Value: Currency);
begin
  FListPrice := Value;
end;

procedure TOrderLine.SetMatched(const Value: boolean);
begin
  FMatched := Value;
end;

procedure TOrderLine.SetNarrative(const Value: Integer);
begin
  FNarrative := Value;
end;

procedure TOrderLine.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TOrderLine.SetNCROTCMix(const Value: string);
begin
  FNCROTCMix := Value;
end;

procedure TOrderLine.SetNoOfCalloffs(const Value: string);
begin
  FNoOfCalloffs := Value;
end;

procedure TOrderLine.SetNoOfParts(const Value: Integer);
begin
  FNoOfParts := Value;
end;

procedure TOrderLine.SetNoOfPlateChanges(const Value: Integer);
begin
  FNoOfPlateChanges := Value;
end;

procedure TOrderLine.SetNoOfSets(const Value: string);
begin
  FNoOfSets := Value;
end;

procedure TOrderLine.SetNumbering(const Value: string);
begin
  FNumbering := Value;
end;

procedure TOrderLine.SetOnHold(const Value: string);
begin
  FOnHold := Value;
end;

procedure TOrderLine.SetOrderPrice(const Value: Currency);
begin
  FOrderPrice := Value;
end;

procedure TOrderLine.SetOrderUnit(const Value: integer);
begin
  FOrderUnit := Value;
end;

procedure TOrderLine.SetOriginalOrder(const Value: real);
begin
  FOriginalOrder := Value;
end;

procedure TOrderLine.SetOriginalOrderLine(const Value: integer);
begin
  FOriginalOrderLine := Value;
end;

procedure TOrderLine.SetPOLineStatus(const Value: Integer);
begin
  FPOLineStatus := Value;
end;

procedure TOrderLine.SetPrintedPO(const Value: Boolean);
begin
  FPrintedPO := Value;
end;

procedure TOrderLine.SetProductType(const Value: Integer);
begin
  FProductType := Value;
end;

procedure TOrderLine.SetProofDate(const Value: TDateTime);
begin
  FProofDate := Value;
end;

procedure TOrderLine.SetProofRequired(const Value: Boolean);
begin
  FProofRequired := Value;
end;

procedure TOrderLine.SetProofStatus(const Value: string);
begin
  FProofStatus := Value;
end;

procedure TOrderLine.SetProofStatusDate(const Value: TDateTime);
begin
  FProofStatusDate := Value;
end;

procedure TOrderLine.SetQtyinStock(const Value: double);
begin
  FQtyinStock := Value;
end;

procedure TOrderLine.SetQtyInvoiced(const Value: double);
begin
  FQtyInvoiced := Value;
end;

procedure TOrderLine.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TOrderLine.SetRep(const Value: Integer);
begin
  FRep := Value;
end;

procedure TOrderLine.SetSellingPrice(const Value: Currency);
begin
  FSellingPrice := Value;
end;

procedure TOrderLine.SetSellUnit(const Value: integer);
begin
  FSellUnit := Value;
end;

procedure TOrderLine.SetStockLocation(const Value: Integer);
begin
  FStockLocation := Value;
end;

procedure TOrderLine.SetSuppInvRecd(const Value: Boolean);
begin
  FSuppInvRecd := Value;
end;

procedure TOrderLine.SetSupplierJobRef(const Value: string);
begin
  FSupplierJobRef := Value;
end;

procedure TOrderLine.SetSupplierReference(const Value: string);
begin
  FSupplierReference := Value;
end;

procedure TOrderLine.SetSuppliersDesc(const Value: string);
begin
  FSuppliersDesc := Value;
end;

procedure TOrderLine.SetVATCode(const Value: Integer);
begin
  FVATCode := Value;
end;

procedure TOrderLine.SetWidth(const Value: double);
begin
  FWidth := Value;
end;

procedure TOrderLine.SetWidthUnit(const Value: string);
begin
  FWidthUnit := Value;
end;

{ TDeliveryLines }

function CompareDeliveryNo(Item1, Item2: Pointer): Integer;
begin
  { Compare returns < 0 if Item1 is less and Item2, 0 if they are equal
    and > 0 if Item1 is greater than Item2.}
  if TDeliveryLine(Item1).DeliveryNo = TDeliveryLine(Item2).DeliveryNo then
    Result := 0
  else
    if TDeliveryLine(Item1).DeliveryNo < TDeliveryLine(Item2).DeliveryNo then
    Result := -1
  else
    Result := 1;
end;

procedure TDeliveryLines.Add(aLine: TDeliveryLine);
begin
  if FLines.Count = MaxLines then
    raise Exception.Create('Maximum number of delivery lines exceeded');
  FLines.Add(aLine);
  FLines.Sort(CompareDeliveryNo);
end;

procedure TDeliveryLines.Clear;
var
  i                           : Integer;
begin
  for i := 0 to Pred(FLines.Count) do
  begin
    TDeliveryLine(FLines[i]).Free;
    FLines[i] := nil;
  end;
  FLines.Clear;
end;

function TDeliveryLines.Clone: TDeliveryLines;
var
  i                           : Integer;
begin
  Result := TDeliveryLines.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Lines[i].Clone);
end;

constructor TDeliveryLines.Create;
begin
  FLines := TList.Create;
  FMaxLines := cMaxDeliveryLines;
end;

procedure TDeliveryLines.Delete(const Index: Integer);
begin
  FLines.Delete(Index);
end;

destructor TDeliveryLines.Destroy;
begin
  Clear;
  FLines.Free;
  FLines := nil;
  inherited;
end;

function TDeliveryLines.GetCount: Integer;
begin
  Result := FLines.Count;
end;

function TDeliveryLines.GetLines(Index: Integer): TDeliveryLine;
begin
  Result := FLines[Index];
end;

function TDeliveryLines.GetNextLineNumber: Integer;
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
        if Lines[i].DeliveryNo = Candidate then
          used := True;
      if not used then
      begin
        Result := Candidate;
        Exit;
      end;
    end;
end;

function TDeliveryLines.GetTotal: Double;
var
  i                           : Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    begin
    Result := Result + Lines[i].QtyToDeliver;
    end;
end;

function TDeliveryLines.IndexFromDelNo(const DelNo: Integer): Integer;
var
  i                           : Integer;
begin
  Result := -1;
  for i := 0 to Pred(Count) do
    if Lines[i].DeliveryNo = DelNo then
    begin
      Result := i;
      Break;
    end;
end;

procedure TDeliveryLines.SetLines(Index: Integer;
  const Value: TDeliveryLine);
begin
  FLines[Index] := Value;
  FLines.Sort(CompareDeliveryNo);
end;

function TDeliveryLines.GetTotalinStock: Double;
var
  i                           : Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    begin
      if (Lines[i].DeliveryToStock = 'Y') then
        Result := Result + Lines[i].QtyDelivered
    end;
end;

function TDeliveryLines.GetTotalStock: Double;
var
  i                           : Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    begin
      if (Lines[i].DeliveryToStock = 'Y') then
        Result := Result + Lines[i].QtyToDeliver;
    end;
end;


function TDeliveryLines.GetStockSupplier: integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    begin
      if (Lines[i].DeliveryToStock = 'Y') and (Lines[i].Supplier <> 0) then
        begin
          Result := Lines[i].Supplier;
          exit;
        end;
    end;
end;

function TDeliveryLines.GetStockSupplierBr: integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    begin
      if (Lines[i].DeliveryToStock = 'Y') and (Lines[i].Supplier <> 0) then
        begin
          Result := Lines[i].BranchNo;
          exit;
        end;
    end;
end;

function TDeliveryLines.GetTotalDelivered: Double;
var
  i                           : Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    begin
      Result := Result + Lines[i].QtyDelivered
    end;
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

function TExtraCharges.GetTotalSell: Double;
var
  i                           : Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    Result := Result + Charges[i].QuotationPrice;
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

procedure TOrderLines.Add(aLine: TOrderLine);
begin
  if FLines.Count = MaxLines then
    raise Exception.Create('Maximum number of order lines exceeded');
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

procedure TOrderLines.SetLines(Index: Integer; const Value: TOrderLine);
begin
  FLines[Index] := Value;
  FLines.Sort(CompareLineNo);
end;

{ TPurchaseOrder }

procedure TPurchaseOrder.Clear;
begin
  FOrderLines.Clear;
  FSupplier := 0;
  FPONumber := 0;
  FBranchNo := 0;
  FPOHeadStatus := 0;
  FCurrencyCode := 0;
  FSupplierContactNo := 0;
  FDatePoint := 0;
end;

function TPurchaseOrder.Clone: TPurchaseOrder;
begin
  Result := TPurchaseOrder.Create(nil);
  Result.OrderLines.Free;
  Result.OrderLines := Self.OrderLines.Clone;
  Result.AccountTeam := self.AccountTeam;
  Result.AccountTeamName := self.AccountTeamName;
  Result.AuthorisedBy := self.AuthorisedBy;
  Result.AuthorisedByName := self.AuthorisedByName;
  Result.Courier := self.Courier;
  Result.NeedsAuthorising := self.NeedsAuthorising;
  Result.BranchNo := Self.BranchNo;
  Result.BranchName := Self.BranchName;
  Result.SupplierContactNo := Self.SupplierContactNo;
  Result.CurrencyCode := Self.CurrencyCode;
  Result.DatePoint := Self.DatePoint;
  Result.DefaultVatCode := Self.DefaultVatCode;
  Result.Narrative := Self.Narrative;
  Result.NarrativeText := self.NarrativeText;
  Result.NoDelInstruct := Self.NoDelInstruct;
  Result.Operator := Self.Operator;
  Result.OfficeContact := Self.OfficeContact;
  Result.POHeadStatus := Self.POHeadStatus;
  Result.PONumber := Self.PONumber;
  Result.Supplier := Self.Supplier;
  Result.SupplierName := Self.SupplierName;
  Result.TheirContact := Self.TheirContact;
  Result.Salutation := Self.Salutation;
  Result.OurContact := Self.OurContact;
end;

constructor TPurchaseOrder.Create(DataMod : TDataModule);
begin
  FOrderLines := TOrderLines.Create;
  if Assigned(DataMod) then
    NoDelInstruct := TPBPODM(DataMod).NoDelInstruct;
end;

destructor TPurchaseOrder.Destroy;
begin
  FOrderLines.Free;
  FOrderLines := nil;
  inherited;
end;

procedure TPurchaseOrder.SetAccountTeam(const Value: integer);
begin
  FAccountTeam := Value;
end;

procedure TPurchaseOrder.SetAccountTeamName(const Value: string);
begin
  FAccountTeamName := Value;
end;

procedure TPurchaseOrder.SetAuthorisedBy(const Value: integer);
begin
  FAuthorisedBy := Value;
end;

procedure TPurchaseOrder.SetAuthorisedByName(const Value: string);
begin
  FAuthorisedByName := Value;
end;

procedure TPurchaseOrder.SetBranchName(const Value: string);
begin
  FBranchName := Value;
end;

procedure TPurchaseOrder.SetCourier(const Value: integer);
begin
  FCourier := Value;
end;

procedure TPurchaseOrder.SetDefaultVatCode(const Value: Integer);
begin
  FDefaultVatCode := Value;
end;

procedure TPurchaseOrder.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TPurchaseOrder.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TPurchaseOrder.SetNeedsAuthorising(const Value: boolean);
begin
  FNeedsAuthorising := Value;
end;

procedure TPurchaseOrder.SetNoDelInstruct(const Value: Boolean);
begin
  FNoDelInstruct := Value;
end;

procedure TPurchaseOrder.SetNonConformDocs(const Value: TNonConformDocs);
begin
  FNonConformDocs := Value;
end;

procedure TPurchaseOrder.SetOfficeContact(const Value: Integer);
begin
  FOfficeContact := Value;
end;

procedure TPurchaseOrder.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TPurchaseOrder.SetOurContact(const Value: string);
begin
  FOurContact := Value;
end;

procedure TPurchaseOrder.SetSalutation(const Value: string);
begin
  FSalutation := Value;
end;

procedure TPurchaseOrder.SetSupplierName(const Value: string);
begin
  FSupplierName := Value;
end;

procedure TPurchaseOrder.SetTheirContact(const Value: string);
begin
  FTheirContact := Value;
end;

{ TPartDetails }

function ComparePartNo(Item1, Item2: Pointer): Integer;
begin
  { Compare returns < 0 if Item1 is less and Item2, 0 if they are equal
    and > 0 if Item1 is greater than Item2.}
  if TPartDetail(Item1).PartNo = TPartDetail(Item2).PartNo then
    Result := 0
  else
    if TPartDetail(Item1).PartNo < TPartDetail(Item2).PartNo then
    Result := -1
  else
    Result := 1;
end;

procedure TPartDetails.Add(aPart: TPartDetail);
begin
  if FParts.Count = MaxParts then
    raise Exception.Create('Maximum number of parts exceeded');
  FParts.Add(aPart);
  FParts.Sort(ComparePartNo);
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

function TPartDetails.GetNextPartNumber: Integer;
var
  i, Candidate                : Integer;
  used                        : Boolean;
begin
  Result := -1; { Worst case scenario }
  if Count = 0 then
    Result := 1
  else
    for Candidate := 1 to MaxParts do
    begin
      used := False;
      for i := 0 to Pred(Count) do
        if Parts[i].PartNo = Candidate then
          used := True;
      if not used then
      begin
        Result := Candidate;
        Exit;
      end;
    end;
end;

function TPartDetails.GetParts(Index: Integer): TPartDetail;
begin
  Result := TPartDetail(FParts[Index]);
end;

function TPartDetails.IndexFromPartNo(const PartNo: Integer): Integer;
var
  i                           : Integer;
begin
  Result := -1;
  for i := 0 to Pred(Count) do
    if Parts[i].PartNo = PartNo then
    begin
      Result := i;
      Break;
    end;
end;

procedure TPartDetails.SetParts(Index: Integer; const Value: TPartDetail);
begin
  FParts[Index] := Value;
  FParts.Sort(ComparePartNo);
end;

{ TPartDetail }

procedure TPartDetail.Assign(aPart: TPartDetail);
begin
  FaceInks := aPart.FaceInks;
  Heading := aPart.Heading;
  LeftMarginType := aPart.LeftMarginType;
  LeftMarginWidth := aPart.LeftMarginWidth;
  Line := aPart.Line;
  PaperBrand := aPart.PaperBrand;
  PaperColour := aPart.PaperColour;
  PaperMaterial := aPart.PaperMaterial;
  PaperWeight := aPart.PaperWeight;
  PartDescription := aPart.PartDescription;
  PartNo := aPart.PartNo;
  PlateChanges := aPart.PlateChanges;
  ReverseInks := aPart.ReverseInks;
  RightMarginType := aPart.RightMarginType;
  RightMarginWidth := aPart.RightMarginWidth;
  SameAsPart := aPart.SameAsPart;
end;

function TPartDetail.Clone: TPartDetail;
begin
  Result := TPartDetail.Create;
  Result.Assign(Self);
end;

function TPartDetail.GetPartNoStr: string;
begin
  if FPartDescription <> '' then
    Result := FPartDescription
  else
    Result := 'Part ' + IntToStr(PartNo);
end;

procedure TPartDetail.SetFaceInks(const Value: string);
begin
  FFaceInks := Value;
end;

procedure TPartDetail.SetHeading(const Value: string);
begin
  FHeading := Value;
end;

procedure TPartDetail.SetLeftMarginType(const Value: string);
begin
  FLeftMarginType := Value;
end;

procedure TPartDetail.SetLeftMarginWidth(const Value: string);
begin
  FLeftMarginWidth := Value;
end;

procedure TPartDetail.SetLine(const Value: Integer);
begin
  FLine := Value;
end;

procedure TPartDetail.SetPaperBrand(const Value: string);
begin
  FPaperBrand := Value;
end;

procedure TPartDetail.SetPaperColour(const Value: string);
begin
  FPaperColour := Value;
end;

procedure TPartDetail.SetPaperMaterial(const Value: string);
begin
  FPaperMaterial := Value;
end;

procedure TPartDetail.SetPaperWeight(const Value: string);
begin
  FPaperWeight := Value;
end;

procedure TPartDetail.SetPartNo(const Value: Integer);
begin
  FPartNo := Value;
end;

procedure TPartDetail.SetPartDescription(const Value: string);
begin
  FPartDescription := Value;
end;

procedure TPartDetail.SetReverseInks(const Value: string);
begin
  FReverseInks := Value;
end;

procedure TPartDetail.SetRightMarginType(const Value: string);
begin
  FRightMarginType := Value;
end;

procedure TPartDetail.SetRightMarginWidth(const Value: string);
begin
  FRightMarginWidth := Value;
end;

procedure TPartDetail.SetSameAsPart(const Value: Integer);
begin
  FSameAsPart := Value;
end;

procedure TPartDetail.SetPlateChanges(const Value: integer);
begin
  FPlateChanges := Value;
end;

{ TAdditionalDetail }

procedure TAdditionalDetail.Assign(aDetail: TAdditionalDetail);
begin
  DetailNo := aDetail.DetailNo;
  Detail := aDetail.Detail;
  FAOFlag := aDetail.FAOFlag;
  Line := aDetail.Line;
  Narrative := aDetail.Narrative;
  NarrativeText := aDetail.NarrativeText;
end;

function TAdditionalDetail.Clone: TAdditionalDetail;
begin
  Result := TAdditionalDetail.Create;
  Result.Assign(Self);
end;

procedure TAdditionalDetail.SetDetail(const Value: string);
begin
  FDetail := Value;
end;

procedure TAdditionalDetail.SetDetailNo(const Value: Integer);
begin
  FDetailNo := Value;
end;

procedure TAdditionalDetail.SetFAOFlag(const Value: Char);
begin
  FFAOFlag := Value;
end;

procedure TAdditionalDetail.SetLine(const Value: Integer);
begin
  FLine := Value;
end;

procedure TAdditionalDetail.SetNarrative(const Value: Integer);
begin
  FNarrative := Value;
end;

procedure TAdditionalDetail.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

{ TAdditionalDetails }

procedure TAdditionalDetails.Add(aAdditional: TAdditionalDetail);
begin
  if FAdditionals.Count = MaxAdditionals then
    raise Exception.Create('Maximum number of Additional Details exceeded');
  FAdditionals.Add(aAdditional);
end;

procedure TAdditionalDetails.Clear;
var
  i                           : Integer;
begin
  for i := 0 to Pred(FAdditionals.Count) do
  begin
    TAdditionalDetail(FAdditionals[i]).Free;
    FAdditionals[i] := nil;
  end;
  FAdditionals.Clear;
end;

function TAdditionalDetails.Clone: TAdditionalDetails;
var
  i                           : Integer;
begin
  Result := TAdditionalDetails.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Additionals[i].Clone);
end;

constructor TAdditionalDetails.Create;
begin
  FAdditionals := TList.Create;
  FMaxAdditionals := cMaxAdditionalDetails;
end;

procedure TAdditionalDetails.Delete(const Index: Integer);
begin
  FAdditionals.Delete(Index);
end;

destructor TAdditionalDetails.Destroy;
begin
  Clear;
  FAdditionals.Free;
  FAdditionals := nil;
  inherited;
end;

function TAdditionalDetails.GetAdditionals(
  Index: Integer): TAdditionalDetail;
begin
  Result := TAdditionalDetail(FAdditionals[Index]);
end;

function TAdditionalDetails.GetCount: Integer;
begin
  Result := FAdditionals.Count;
end;

function TAdditionalDetails.GetNextAdditionalNumber: Integer;
var
  i, Candidate                : Integer;
  used                        : Boolean;
begin
  Result := -1; { Worst case scenario }
  if Count = 0 then
    Result := 1
  else
    for Candidate := 1 to MaxAdditionals do
    begin
      used := False;
      for i := 0 to Pred(Count) do
        if Additionals[i].DetailNo = Candidate then
          used := True;
      if not used then
      begin
        Result := Candidate;
        Exit;
      end;
    end;
end;

function TAdditionalDetails.IndexFromDetailNo(
  const DetailNo: Integer): Integer;
var
  i                           : Integer;
begin
  Result := -1;
  for i := 0 to Pred(Count) do
    if Additionals[i].DetailNo = DetailNo then
    begin
      Result := i;
      Break;
    end;
end;

procedure TAdditionalDetails.SetAdditionals(Index: Integer;
  const Value: TAdditionalDetail);
begin
  FAdditionals[Index] := Value;
end;

{ TQuestion }

procedure TQuestion.Assign(aQuestion: TQuestion);
begin
  aQuestion.Answer := Self.Answer;
  aQuestion.ProductType := Self.ProductType;
  aQuestion.QuestionNo := Self.QuestionNo;
  aQuestion.QuestionText := Self.QuestionText;
  aQuestion.PromptType := Self.PromptType;
end;

function TQuestion.Clone: TQuestion;
begin
  Result := TQuestion.Create;
  Assign(Result);
end;

procedure TQuestion.SetAnswer(const Value: string);
begin
  FAnswer := Value;
end;

procedure TQuestion.SetProductType(const Value: integer);
begin
  FProductType := Value;
end;

procedure TQuestion.SetPromptType(const Value: string);
begin
  FPromptType := Value;
end;

procedure TQuestion.SetQuestionNo(const Value: integer);
begin
  FQuestionNo := Value;
end;

procedure TQuestion.SetQuestionText(const Value: string);
begin
  FQuestionText := Value;
end;

{ TQuestions }

procedure TQuestions.Add(aQuestion: TQuestion);
begin
  FQuestions.Add(aQuestion);
end;

procedure TQuestions.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FQuestions.Count) do
  begin
    TQuestion(FQuestions[i]).Free;
    FQuestions[i] := nil;
  end;
  FQuestions.Clear;
end;

function TQuestions.Clone: TQuestions;
var
  i : Integer;
begin
  Result := TQuestions.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Questions[i].Clone);
end;

constructor TQuestions.Create;
begin
  FQuestions := TList.Create;
end;

procedure TQuestions.Delete(const Index: Integer);
begin
  FQuestions.Delete(Index);
end;

destructor TQuestions.Destroy;
begin
  Clear;
  FQuestions.Free;
  FQuestions := nil;
  inherited;
end;

function TQuestions.GetCount: Integer;
begin
  Result := FQuestions.Count;
end;

function TQuestions.GetQuestions(Index: Integer): TQuestion;
begin
  Result := TQuestion(FQuestions[Index]);
end;

function TQuestions.IndexFromQuestionNo(
  const QuestionNo: Integer): Integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FQuestions.Count) do
    if TQuestion(FQuestions[i]).QuestionNo = QuestionNo then
      Result := i;
end;

procedure TQuestions.SetQuestions(Index: Integer; const Value: TQuestion);
begin
  FQuestions[Index] := Value;
end;

{ TCallOffOrder }

procedure TCallOffOrder.Assign(aCallOffOrder: TCallOffOrder);
begin
  aCallOffOrder.PONumber := Self.PONumber;
  aCallOffOrder.POLine := Self.POLine;
  aCallOffOrder.CallOffNo := Self.CallOffNo;
  aCallOffOrder.Line := Self.Line;
  aCallOffOrder.Supplier := Self.Supplier;
  aCallOffOrder.SuppBranch := Self.SuppBranch;
  aCallOffOrder.SuppContact := Self.SuppContact;
  aCallOffOrder.Customer := Self.Customer;
  aCallOffOrder.CustBranch := Self.CustBranch;
  aCallOffOrder.CustContact := Self.CustContact;
  aCallOffOrder.OrderDate := Self.OrderDate;
  aCallOffOrder.RequiredDate := Self.RequiredDate;
  aCallOffOrder.OrderQty := Self.OrderQty;
  aCallOffOrder.AdhocAddress := Self.AdhocAddress;
  aCallOffOrder.DelSuppBranchNo := Self.DelSuppBranchNo;
  aCallOffOrder.DelCustBranchNo := Self.DelCustBranchNo;
  aCallOffOrder.DelCustomer := Self.DelCustomer;
  aCallOffOrder.DelSupplier := Self.DelSupplier;
  aCallOffOrder.DelRep := Self.DelRep;
  aCallOffOrder.Instructions := Self.Instructions;
  aCallOffOrder.NoofBoxes := Self.NoofBoxes;
  aCallOffOrder.QtyDelivered := Self.QtyDelivered;
  aCallOffOrder.Rep := Self.Rep;
  aCallOffOrder.DateDelivActual := Self.DateDelivActual;
  aCallOffOrder.Status := Self.Status;
  aCallOffOrder.CallOffSeq := Self.CallOffSeq;
  aCallOffOrder.BoxQty := Self.BoxQty;
  aCallOffOrder.SellPrice := Self.SellPrice;
  aCallOffOrder.CostPrice := Self.CostPrice;
  aCallOffOrder.SellUnit := Self.SellUnit;
  aCallOffOrder.CostUnit := Self.CostUnit;
  aCallOffOrder.Description := Self.Description;
  aCallOffOrder.CustOrderNo := Self.CustOrderNo;
  aCallOffOrder.FormReference := Self.FormReference;
  aCallOffOrder.NumberInstructions := Self.NumberInstructions;
  aCallOffOrder.Inactive := Self.Inactive;
  aCallOffOrder.InActiveReason := self.InactiveReason;
  aCallOffOrder.InActiveDate := self.InactiveDate;
  aCallOffOrder.InvoiceUpfront := self.InvoiceUpfront;
  aCallOffOrder.CalloffInvoicedUpfront := self.CalloffInvoicedUpfront;
end;

function TCallOffOrder.Clone: TCallOffOrder;
begin
  Result := TCallOffOrder.Create;
  Assign(Result);
end;

function TCallOffOrder.GetAddressType : TAddressType;
begin
  if AdHocAddress <> 0 then
    Result := atAdHoc
  else
  if Supplier <> 0 then
    Result := atSupplier
  else
  if Rep <> 0 then
    Result := atRep
  else
  if Customer <> 0 then
    Result := atCustomer
  else
    Result := atCompany;
end;

procedure TCallOffOrder.SetAdHocAddress(const Value: Integer);
begin
  FAdHocAddress := Value;
end;

procedure TCallOffOrder.SetBoxQty(const Value: string);
begin
  FBoxQty := Value;
end;

procedure TCallOffOrder.SetCalloffInvoicedUpfront(const Value: string);
begin
  FCalloffInvoicedUpfront := Value;
end;

procedure TCallOffOrder.SetCallOffNo(const Value: integer);
begin
  FCallOffNo := Value;
end;

procedure TCallOffOrder.SetCallOffSeq(const Value: integer);
begin
  FCallOffSeq := Value;
end;

procedure TCallOffOrder.SetCostPrice(const Value: Double);
begin
  FCostPrice := Value;
end;

procedure TCallOffOrder.SetCostUnit(const Value: integer);
begin
  FCostUnit := Value;
end;

procedure TCallOffOrder.SetCustBranch(const Value: integer);
begin
  FCustBranch := Value;
end;

procedure TCallOffOrder.SetCustContact(const Value: integer);
begin
  FCustContact := Value;
end;

procedure TCallOffOrder.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TCallOffOrder.SetCustOrderNo(const Value: string);
begin
  FCustOrderNo := Value;
end;

procedure TCallOffOrder.SetDateDelivActual(const Value: TDateTime);
begin
  FDateDelivActual := Value;
end;

procedure TCallOffOrder.SetDelCustBranchNo(const Value: Integer);
begin
  FDelCustBranchNo := Value;
end;

procedure TCallOffOrder.SetDelCustomer(const Value: Integer);
begin
  FDelCustomer := Value;
end;

procedure TCallOffOrder.SetDelRep(const Value: Integer);
begin
  FDelRep := Value;
end;

procedure TCallOffOrder.SetDelSuppBranchNo(const Value: Integer);
begin
  FDelSuppBranchNo := Value;
end;

procedure TCallOffOrder.SetDelSupplier(const Value: Integer);
begin
  FDelSupplier := Value;
end;

procedure TCallOffOrder.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TCallOffOrder.SetFAO(const Value: string);
begin
  FFAO := Value;
end;

procedure TCallOffOrder.SetFormReference(const Value: integer);
begin
  FFormReference := Value;
end;

procedure TCallOffOrder.SetInActive(const Value: string);
begin
  FInActive := Value;
end;

procedure TCallOffOrder.SetInActiveDate(const Value: TDateTime);
begin
  FInActiveDate := Value;
end;

procedure TCallOffOrder.SetInActiveReason(const Value: integer);
begin
  FInActiveReason := Value;
end;

procedure TCallOffOrder.SetInstructions(const Value: string);
begin
  FInstructions := Value;
end;

procedure TCallOffOrder.SetInvoiceUpfront(const Value: string);
begin
  FInvoiceUpfront := Value;
end;

procedure TCallOffOrder.SetLine(const Value: integer);
begin
  FLine := Value;
end;

procedure TCallOffOrder.SetNoOfBoxes(const Value: Integer);
begin
  FNoOfBoxes := Value;
end;

procedure TCallOffOrder.SetNumberInstructions(const Value: string);
begin
  FNumberInstructions := Value;
end;

procedure TCallOffOrder.SetOrderDate(const Value: Tdatetime);
begin
  FOrderDate := Value;
end;

procedure TCallOffOrder.SetOrderQty(const Value: integer);
begin
  FOrderQty := Value;
end;

procedure TCallOffOrder.SetPOLine(const Value: integer);
begin
  FPOLine := Value;
end;

procedure TCallOffOrder.SetPONumber(const Value: real);
begin
  FPONumber := Value;
end;

procedure TCallOffOrder.SetQtyDelivered(const Value: Double);
begin
  FQtyDelivered := Value;
end;

procedure TCallOffOrder.SetRep(const Value: Integer);
begin
  FRep := Value;
end;

procedure TCallOffOrder.SetRequiredDate(const Value: TDateTime);
begin
  FRequiredDate := Value;
end;

procedure TCallOffOrder.SetSellPrice(const Value: Double);
begin
  FSellPrice := Value;
end;

procedure TCallOffOrder.SetSellUnit(const Value: integer);
begin
  FSellUnit := Value;
end;

procedure TCallOffOrder.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TCallOffOrder.SetSuppBranch(const Value: integer);
begin
  FSuppBranch := Value;
end;

procedure TCallOffOrder.SetSuppContact(const Value: integer);
begin
  FSuppContact := Value;
end;

procedure TCallOffOrder.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

{ TCallOffOrders }

function CompareCallOffNo(Item1, Item2: Pointer): Integer;
begin
  { Compare returns < 0 if Item1 is less and Item2, 0 if they are equal
    and > 0 if Item1 is greater than Item2.}
  if TCallOffOrder(Item1).CallOffSeq = TCallOffOrder(Item2).CallOffSeq then
    Result := 0
  else
    if TCallOffOrder(Item1).CallOffSeq < TCallOffOrder(Item2).CallOffSeq then
    Result := -1
  else
    Result := 1;
end;

procedure TCallOffOrders.Add(aLine: TCallOffOrder);
begin
  if FLines.Count = MaxLines then
    raise Exception.Create('Maximum number of Call Offs exceeded');
  FLines.Add(aLine);
  FLines.Sort(CompareCallOffNo);
end;

procedure TCallOffOrders.Clear;
var
  i                           : Integer;
begin
  for i := 0 to Pred(FLines.Count) do
  begin
    TCallOffOrder(FLines[i]).Free;
    FLines[i] := nil;
  end;
  FLines.Clear;
end;

function TCallOffOrders.Clone: TCallOffOrders;
var
  i                           : Integer;
begin
  Result := TCallOffOrders.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Lines[i].Clone);
end;

constructor TCallOffOrders.Create;
begin
  FLines := TList.Create;
  FMaxLines := cMaxCallOffOrders;
end;

procedure TCallOffOrders.Delete(const Index: Integer);
begin
  FLines.Delete(Index);
end;

destructor TCallOffOrders.Destroy;
begin
  Clear;
  FLines.Free;
  FLines := nil;
  inherited;
end;

function TCallOffOrders.GetCount: Integer;
begin
  Result := FLines.Count;
end;

function TCallOffOrders.GetNextLineNumber: Integer;
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
        if Lines[i].CallOffSeq = Candidate then
          used := True;
      if not used then
      begin
        Result := Candidate;
        Exit;
      end;
    end;
end;

function TCallOffOrders.IndexFromCallOffNo(const CallNo: Integer): Integer;
var
  i                           : Integer;
begin
  Result := -1;
  for i := 0 to Pred(Count) do
    if Lines[i].CallOffSeq = CallNo then
    begin
      Result := i;
      Break;
    end;
end;

function TCallOffOrders.GetLines(Index: Integer): TCallOffOrder;
begin
  Result := FLines[Index];
end;

procedure TCallOffOrders.SetLines(Index: Integer;
  const Value: TCallOffOrder);
begin
  FLines[Index] := Value;
  FLines.Sort(CompareCallOffNo);
end;

function TCallOffOrders.GetTotal: Double;
var
  i                           : Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    begin
    if Lines[i].Inactive = 'Y' then continue;
    Result := Result + Lines[i].OrderQty;
    end;
end;

function TCallOffOrders.GetTotalDelivered: Double;
var
  i                           : Integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    begin
    if Lines[i].Inactive = 'Y' then continue;
    Result := Result + Lines[i].QtyDelivered;
    end;
end;

{ TIntNote }

constructor TIntNote.Create;
begin
  self.FNarrative := TNarrative.Create;
end;

destructor TIntNote.Destroy;
begin
  self.FNarrative.Free;
  inherited;
end;

procedure TIntNote.SetDateEntered(const Value: TDateTime);
begin
  FDateEntered := Value;
end;

procedure TIntNote.SetNarrative(const Value: TNarrative);
begin
  FNarrative := Value;
end;

procedure TIntNote.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

{ TIntNoteList }

procedure TIntNote.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

{ TIntNoteList }

function TIntNoteList.add(IntNote: TIntNote): integer;
begin
  Result := inherited add(IntNote);
end;

function TIntNoteList.GetNotes(index: integer): TIntNote;
begin
  Result := inherited Items[index] as TIntNote;
end;

procedure TIntNoteList.SetNotes(index: integer; const Value: TIntNote);
begin
  inherited Items[index] := Value;
end;

{ TNonConformDocs }

procedure TNonConformDocs.Add(aNonConform: TNonConform);
begin
  FItems.Add(aNonConform);
end;

procedure TNonConformDocs.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TNonConform(FItems[i]).Free;
end;

function TNonConformDocs.Clone: TNonConformDocs;
var
  i                           : Integer;
begin
  Result := TNonConformDocs.Create;
  for i := 0 to Pred(Count) do
    Result.Add(iTems[i].Clone);
end;

constructor TNonConformDocs.Create;
begin
  FItems := TList.Create;
end;

procedure TNonConformDocs.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TNonConformDocs.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TNonConform(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TNonConformDocs.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TNonConformDocs.GetItems(Index: integer): TNonConform;
begin
  Result := TNonConform(FItems[Index]);
end;

function TNonConformDocs.GetMaxLineNo: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].NonConformNo > Result then
      Result := Items[i].NonConformNo;
end;

function TNonConformDocs.IndexOf(const NonConformNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TNonConform(FItems[i]).NonConformNo = NonConformNo then
      Result := i;
end;

procedure TNonConformDocs.SetItems(Index: integer; const Value: TNonConform);
begin

end;

{ TNonConform }

procedure TNonConform.Assign(aNonConform: TNonConform);
begin
  DatePoint        :=    aNonConform.DatePoint;
  NonConformNo     :=    aNonConform.NonConformNo;
  Operator         :=    aNonConform.Operator;
  RaisedBy         :=    aNonConform.RaisedBy;
  RaisedByName     :=    aNonConform.RaisedByName;
  JobRePrinted     :=    aNonConform.JobRePrinted;
  Line             :=    aNonConform.Line;
  NCCategory       :=    aNonConform.NCCategory;
  NCCategoryDescription := aNonConform.NCCategoryDescription;
  NCDepartment     :=    aNonConform.NCDepartment;
  NCDepartmentName :=    aNonConform.NCDepartmentName;
  NCNumber         :=    aNonConform.NCNumber;
  NCType           :=    aNonConform.NCType;
  NCTypeDescription :=   aNonConform.NCTypeDescription;
  QAOperator       :=    aNonConform.QAOperator;
  QAOperatorName   :=    aNonConform.QAOperatorName;
  QASignOffDate    :=    aNonConform.QASignOffDate;
  TotalCost        :=    aNonConform.TotalCost;
  Narrative        :=    aNonConform.Narrative;
  NarrativeText    :=    aNonConform.NarrativeText;
  Response         :=    aNonConform.Response;
  ResponseDate     :=    aNonConform.ResponseDate;
  ResponseNotes    :=    aNonConform.ResponseNotes;
  Corrective       :=    aNonConform.Corrective;
  CorrectiveDate   :=    aNonConform.CorrectiveDate;
  CorrectiveNotes  :=    aNonConform.CorrectiveNotes;
  Preventative     :=    aNonConform.Preventative;
  PreventativeDate :=    aNonConform.PreventativeDate;
  PreventativeNotes :=   aNonConform.PreventativeNotes;
  CosttoClient     :=    aNonConform.CosttoClient;
  SamplesAvailable :=    aNonConform.SamplesAvailable;
  Status           :=    aNonConform.status;
  Inactive         :=    aNonConform.Inactive;
  Inactivedate     :=    aNonConform.InactiveDate;
end;

function TNonConform.Clone: TNonConform;
begin
  Result := TNonConform.Create;
  Result.Assign(Self);
end;

function TNonConform.GetStatusDescription: string;
begin

end;

procedure TNonConform.SetCorrective(const Value: integer);
begin
  FCorrective := Value;
end;

procedure TNonConform.SetCorrectiveDate(const Value: TDateTime);
begin
  FCorrectiveDate := Value;
end;

procedure TNonConform.SetCorrectiveNotes(const Value: string);
begin
  FCorrectiveNotes := Value;
end;

procedure TNonConform.SetCosttoClient(const Value: double);
begin
  FCosttoClient := Value;
end;

procedure TNonConform.SetDatePoint(const Value: TDateTime);
begin
  FDatePoint := Value;
end;

procedure TNonConform.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TNonConform.SetInactiveDate(const Value: TDateTime);
begin
  FInactiveDate := Value;
end;

procedure TNonConform.SetJobRePrinted(const Value: string);
begin
  FJobRePrinted := Value;
end;

procedure TNonConform.SetLine(const Value: integer);
begin
  FLine := Value;
end;

procedure TNonConform.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TNonConform.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TNonConform.SetNCCategory(const Value: integer);
begin
  FNCCategory := Value;
end;

procedure TNonConform.SetNCCategoryDescription(const Value: string);
begin
  FNCCategoryDescription := Value;
end;

procedure TNonConform.SetNCDepartment(const Value: integer);
begin
  FNCDepartment := Value;
end;

procedure TNonConform.SetNCDepartmentName(const Value: string);
begin
  FNCDepartmentName := Value;
end;

procedure TNonConform.SetNCNumber(const Value: integer);
begin
  FNCNumber := Value;
end;

procedure TNonConform.SetNCType(const Value: integer);
begin
  FNCType := Value;
end;

procedure TNonConform.SetNCTypeDescription(const Value: string);
begin
  FNCTypeDescription := Value;
end;

procedure TNonConform.SetNonConformNo(const Value: integer);
begin
  FNonConformNo := Value;
end;

procedure TNonConform.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TNonConform.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TNonConform.SetPreventative(const Value: integer);
begin
  FPreventative := Value;
end;

procedure TNonConform.SetPreventativeDate(const Value: TDatetime);
begin
  FPreventativeDate := Value;
end;

procedure TNonConform.SetPreventativeNotes(const Value: string);
begin
  FPreventativeNotes := Value;
end;

procedure TNonConform.SetQAOperator(const Value: integer);
begin
  FQAOperator := Value;
end;

procedure TNonConform.SetQAOperatorName(const Value: string);
begin
  FQAOperatorName := Value;
end;

procedure TNonConform.SetQASignOffDate(const Value: TDateTime);
begin
  FQASignOffDate := Value;
end;

procedure TNonConform.SetRaisedBy(const Value: integer);
begin
  FRaisedBy := Value;
end;

procedure TNonConform.SetRaisedByName(const Value: string);
begin
  FRaisedByName := Value;
end;

procedure TNonConform.SetResponse(const Value: integer);
begin
  FResponse := Value;
end;

procedure TNonConform.SetResponseDate(const Value: TDateTime);
begin
  FResponseDate := Value;
end;

procedure TNonConform.SetResponseNotes(const Value: string);
begin
  FResponseNotes := Value;
end;

procedure TNonConform.SetSamplesAvailable(const Value: string);
begin
  FSamplesAvailable := Value;
end;

procedure TNonConform.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TNonConform.SetTotalCost(const Value: double);
begin
  FTotalCost := Value;
end;

{ TStockCodes }

procedure TStockCodes.Add(aStockCode: TStockCode);
begin
  FItems.Add(aStockCode);
end;

procedure TStockCodes.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TStockCode(FItems[i]).Free;
end;

function TStockCodes.Clone: TStockCodes;
var
  i                           : Integer;
begin
  Result := TStockCodes.Create;
  for i := 0 to Pred(Count) do
    Result.Add(iTems[i].Clone);
end;

constructor TStockCodes.Create;
begin
  FItems := TList.Create;
end;

procedure TStockCodes.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TStockCodes.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TStockCode(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TStockCodes.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TStockCodes.GetItems(Index: integer): TStockCode;
begin
  Result := TStockCode(FItems[Index]);
end;

function TStockCodes.GetMaxLineNo: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].CodeNo > Result then
      Result := Items[i].CodeNo;
end;

function TStockCodes.IndexOf(const CodeNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TStockCode(FItems[i]).CodeNo = CodeNo then
      Result := i;
end;

procedure TStockCodes.SetItems(Index: integer; const Value: TStockCode);
begin

end;

{ TStockCode }

procedure TStockCode.Assign(aStockCode: TStockCode);
begin
  CodeNo          :=    aStockCode.CodeNo;
  Description     :=    aStockCode.Description;
  FormReference   :=    aStockCode.FormReference;
  FormReferenceID :=    aStockCode.FormReferenceID;
  Line            :=    aStockCode.Line;
  QtyOrdered      :=    aStockCode.QtyOrdered;
  QtyDelivered    :=    aStockCode.QtyDelivered;
  StockReference  :=    aStockCode.StockReference
end;

function TStockCode.Clone: TStockCode;
begin
  Result := TStockCode.Create;
  Result.Assign(Self);
end;

procedure TStockCode.SetCodeNo(const Value: integer);
begin
  FCodeNo := Value;
end;

procedure TStockCode.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TStockCode.SetFormReference(const Value: integer);
begin
  FFormReference := Value;
end;

procedure TStockCode.SetFormReferenceID(const Value: string);
begin
  FFormReferenceID := Value;
end;

procedure TStockCode.SetLine(const Value: integer);
begin
  FLine := Value;
end;

procedure TStockCode.SetQtyDelivered(const Value: double);
begin
  FQtyDelivered := Value;
end;

procedure TStockCode.SetQtyOrdered(const Value: double);
begin
  FQtyOrdered := Value;
end;

procedure TStockCode.SetStockReference(const Value: string);
begin
  FStockReference := Value;
end;

end.
