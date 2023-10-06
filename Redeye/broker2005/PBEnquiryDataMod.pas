unit PBEnquiryDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, contnrs, PBNarrativeDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEnqDM = class(TDataModule)
    GetCustContSQL: TFDQuery;
    GetCustContSRC: TDataSource;
    GetOpSQL: TFDQuery;
    GetOpSRC: TDataSource;
    GetPriceUnitSQL: TFDQuery;
    PriceUnitSRC: TDataSource;
    qryCompany: TFDQuery;
    GetLastSQL: TFDQuery;
    UpdLastSQL: TFDQuery;
    AddEnqHeaderSQL: TFDQuery;
    GetCustRepSQL: TFDQuery;
    CustRepSRC: TDataSource;
    AddEnqLineSQL: TFDQuery;
    AddEnqLineQtySQL: TFDQuery;
    AddEnqSupplierSQL: TFDQuery;
    AddEnqSuppQtySQL: TFDQuery;
    AddEnqLinePartSQL: TFDQuery;
    qrySelEnquiry: TFDQuery;
    qryInsEnquiry: TFDQuery;
    qryUpdEnquiry: TFDQuery;
    qrySelCustDetails: TFDQuery;
    qrySelCustBrnchDetails: TFDQuery;
    qrySelContactDetails: TFDQuery;
    qrySelCustContactNo: TFDQuery;
    qrySelCustRepNo: TFDQuery;
    qrySelRepDtls: TFDQuery;
    qrySelOperators: TFDQuery;
    qrySelOperator: TFDQuery;
    qrySelOperatorNo: TFDQuery;
    qrySelEnqLine: TFDQuery;
    qrySelNoOfEnqLines: TFDQuery;
    qryInsEnqLine: TFDQuery;
    qryUpdEnqLine: TFDQuery;
    qrySelProdType: TFDQuery;
    qrySelFormRef: TFDQuery;
    qrySelPart: TFDQuery;
    qrySelNoOfEnqParts: TFDQuery;
    qryInsEnqLinePart: TFDQuery;
    qryUpdEnqLinePart: TFDQuery;
    qryDelEnqLinePart: TFDQuery;
    qryDelEnqLine: TFDQuery;
    qryDelEnq: TFDQuery;
    qryDelEnqLineParts: TFDQuery;
    qryPaperDtls: TFDQuery;
    qrySelDefCustRep: TFDQuery;
    qrySelProdTypeQs: TFDQuery;
    qrySelNoOfProdTypeQs: TFDQuery;
    qrySelProdTypeQList: TFDQuery;
    qrySelEnqAnswer: TFDQuery;
    qrySelEnqLineQtys: TFDQuery;
    qrySelEnqLineQty: TFDQuery;
    qrySelPriceUnit: TFDQuery;
    qrySelSupplier: TFDQuery;
    qrySelSupplrBrnch: TFDQuery;
    qrySelEnqQteSupls: TFDQuery;
    qrySelSuppEnqQtyPrice: TFDQuery;
    qrySelNarrative: TFDQuery;
    qryDelNarrative: TFDQuery;
    qryInsNarrative: TFDQuery;
    qrySelMaxNarrative: TFDQuery;
    qrySelSuppRespns: TFDQuery;
    qryInsSuppRespns: TFDQuery;
    qryDelSuppRespns: TFDQuery;
    qryUpdSuppRespns: TFDQuery;
    qrySelPriceUnits: TFDQuery;
    qrySelPriceUnitNo: TFDQuery;
    qryDelLineQty: TFDQuery;
    qryInsLineQty: TFDQuery;
    qryUpdLineQty: TFDQuery;
    qryInsSuppEnqQty: TFDQuery;
    qryUpdSuppEnqQty: TFDQuery;
    qryDelSuppEnqQty: TFDQuery;
    qrySelNoOfCapbltys: TFDQuery;
    qrySelCapability: TFDQuery;
    qrySelEnqLineCpbltys: TFDQuery;
    qrydelEnqLineCpbltys: TFDQuery;
    qryInsEnqLineCpblty: TFDQuery;
    qryInsEnqAnswer: TFDQuery;
    qryUpdEnqAnswer: TFDQuery;
    qryDelEnqAnswer: TFDQuery;
    qrySelSuppBrnchConts: TFDQuery;
    qrySelEnqAddNts: TFDQuery;
    qrySelEnqAddNote: TFDQuery;
    qryDelEnqAddNote: TFDQuery;
    qryInsEnqAddNote: TFDQuery;
    qryUpdEnqAddNote: TFDQuery;
    qrySelSuppEnqAddChrg: TFDQuery;
    qrySelSuppEnqAddChrgs: TFDQuery;
    qryDelSuppEnqAddChrg: TFDQuery;
    qryInsSuppEnqAddChrg: TFDQuery;
    qryUpdSuppEnqAddChrg: TFDQuery;
    qryDelSuppEnqAddChrgs: TFDQuery;
    dtsrcSuppBrnchConts: TDataSource;
    qryInsQuote: TFDQuery;
    qryReserveSlot: TFDQuery;
    qryGetReservedSlot: TFDQuery;
    qryDelSuppEnqQtys: TFDQuery;
  private
    { Private declarations }
    procedure LockCompanyRecord;
    procedure FreeCompanyRecord;
  public
    { Public declarations }
    function GetNextEnqNumber: Integer;
    function GetDefCustRep(CustNo, BrnchNo: integer): integer;
    function GetNextNarrativeNo():integer;
    function GetNextEnqLineNo(EnqNo: integer): integer;
    function GetPriceUnitDesc(PriceUnit: integer): string;
    function GetPriceUnitNo(Description: string): integer;
  end;

  type TSupplierQuote = record
    SupplierPrice: double;
    PriceUnit: integer;
    PriceUnitDesc: string;
    PriceUnitFactor: double;
    ResponseQuantity: double;
    PriceSelected: boolean;
    MarkedUpPrice: double;
  end;

  type TPriceGrid = array of array of TSupplierQuote;
  //price grid is indexed by quantities then suppliers, like so
  //PriceGrid[quantityIndex, supplierIndex]
  TExtraCharge = class
    ExtraChargeNo: integer;
    Details: string;
    Cost: currency;
    Price: currency;
  public
    procedure Load(SuppNo, BrnchNo, EnqNo, LineNo: integer);
    procedure Delete(SuppNo, BrnchNo, EnqNo, LineNo: integer);
    procedure Insert(SuppNo, BrnchNo, EnqNo, LineNo, chrgNo: integer);
  end;

  TAdditionalDetail = class
    AdditionlDetailNo: integer;
    Audience: string;
    Details: string;
    NewDetail: boolean;
    Modified: boolean;
    Deleted: boolean;
  public
    procedure Load(EnqNo, LineNo: integer);
    procedure Save(EnqNo, LineNo: integer);
    procedure Delete(EnqNo, LineNo: integer);
    procedure Insert(EnqNo, LineNo: integer);
    procedure Update(EnqNo, LineNo: integer);
  end;

  TPriceUnit = class
    PriceUnit: integer;
    Description: string;
    UnitFactor: double;
    ShowOnReport: string;
  public
    procedure Load;
  end;

  TSupplierResponse = class
  private
    FExtraCharges: TObjectList;
    function GetExtraCharges(index: integer): TExtraCharge;
    procedure SetExtraCharges(index: integer; const Value: TExtraCharge);
  public
    ActResponseDate: TDate;
    DeliveryComment: String;
    SupplierReference: String;
    PrintedEnquiry: boolean;
    IsUpdated: boolean;
    ContactNo: integer;
    RunOnQuantity: double;
    RunOnPrice: currency;
    Deleted: boolean;
    NewResponse: boolean;
    Modified: boolean;
    property ExtraCharges[index: integer]: TExtraCharge read GetExtraCharges write SetExtraCharges;
    Constructor Create;
    Destructor Destroy;override;
    procedure load(SuppNo, BrnchNo, EnqNo, LineNo: integer);
    procedure save(SuppNo, BrnchNo, EnqNo, LineNo: integer);
    procedure insert(SuppNo, BrnchNo, EnqNo, LineNo: integer);
    procedure update(SuppNo, BrnchNo, EnqNo, LineNo: integer);
    procedure delete(SuppNo, BrnchNo, EnqNo, LineNo: integer);
    procedure deleteExtraCharges(SuppNo, BrnchNo, EnqNo, LineNo: integer);
    function NoOfExtraCharges(): integer;
    procedure SaveExtraCharges(SuppNo, BrnchNo, EnqNo, LineNo: integer);
    procedure ClearExtraCharges;
    procedure AddExtraCharge(anExtraCharge: TExtraCharge);
    function CalcExtraChargeCosts: double;
  end;

  TSupplierBranch = class
    BranchNo: integer;
    Name: string;
  public
    procedure Load(SupplierNo: integer);
  end;

  TSupplier = class
    SupplierNo: integer;
    Name: string;
    Branch: TSupplierBranch;
    //SupplierQuote is only used when the supplier is created to be on the list
    //of quoting suppliers, the basic TSupplier.Create doesn't create an instance of
    //TSupplierQuote, but the overloaded constructor does.
    SupplierResponse: TSupplierResponse;
  public
    Constructor Create;overload;
    Constructor Create(Quoting: boolean);overload;
    Destructor Destroy;override;
    procedure Load;
  end;

  TLineQuantity = class
    Quantity: double;
    SupplierPrice: currency;
    QuotePrice: currency;
    Supplier: TSupplier;
    PriceUnit: TPriceUnit;
    LowestPriceIndex: integer;
    NewLineQuantity: boolean;
    Modified: boolean;
    Deleted: boolean;
  public
    Constructor Create;
    Destructor Destroy;override;
    procedure Load(EnqNo, LineNo: integer);
    procedure Save(EnqNo, LineNo: integer);
    procedure Insert(EnqNo, LineNo: integer);
    procedure Update(EnqNo, LineNo: integer);
    procedure Delete(EnqNo, LineNo: integer);
  end;

  TCapability = class
    CapabilityNo: integer;
    Description: string;
    Selected: boolean;
  public
    procedure Load(EnqNo, LineNo, ProdTypeNo: integer);
    procedure Insert(EnqNo, LineNo, ProdTypeNo: integer);
  end;

  TQuestion = class
    QuestionNo: integer;
    Text: string;
    Category: integer;
    CategoryDesc: string;
    PromptType: string;
    Answer: string;
    Answers: TStringList;
    NewAnswer: boolean;
    Modified: boolean;
  private
    procedure GetPossibleAnswers(ProdTypeNo: integer);
  public
    Constructor Create;
    Destructor Destroy;override;
    procedure Load(EnqNo, LineNo, ProdTypeNo: integer);
    procedure CheckForAnswer(EnqNo, LineNo, ProdTypeNo: integer);
    procedure SaveAnswer(EnqNo, LineNo, ProdTypeNo: Integer);
    procedure InsertAnswer(EnqNo, LineNo, ProdTypeNo: Integer);
    procedure UpdateAnswer(EnqNo, LineNo, ProdTypeNo: Integer);
    procedure DeleteAnswer(EnqNo, LineNo, ProdTypeNo: Integer);
  end;

  TPart = class
    PartNo: integer;
    Heading: string;
    SameAsPart: integer;
    PaperBrand: string;
    PaperMaterial: string;
    PaperWeight: string;
    PaperColour: string;
    FaceInks: string;
    ReverseInks: string;
    LeftMarginType: string;
    LeftMarginWidth: string;
    RightMarginType: string;
    RightMarginWidth: string;
    NoOfPlateChanges: integer;
    Description: string;
  public
    procedure Load(EnqNo, LineNo: integer);
    procedure Save(EnqNo, LineNo: integer);
    procedure Update(EnqNo, LineNo: integer);
    procedure Insert(EnqNo, LineNo: integer);
    procedure Delete(EnqNo, LineNo: integer);
  end;

  TFormReference = class
    RefNo: integer;
    ID: string;
    Customer: integer;
    Branch_No: integer;
    Description: string;
    StockedItem: boolean;
    ReOrderLevel: integer;
  public
    procedure Load;
    procedure Clear;
  end;

  TProductType = class
  private
    FQuestions: TObjectList;
    FCapabilities: TObjectList;
    procedure SetQuestions(index: integer; const Value: TQuestion);
    function GetQuestions(index: integer): TQuestion;
    function GetCapabilities(index: integer): TCapability;
    procedure SetCapabilities(index: integer; const Value: TCapability);
  public
    TypeNo: integer;
    Description: string;
    property Questions[index: integer]: TQuestion read GetQuestions write SetQuestions;
    property Capabilities[index: integer]: TCapability read GetCapabilities write SetCapabilities;
    procedure Load(EnqNo, LineNo: integer);
    function GetCapabilityCount: integer;
    Constructor Create;
    Destructor Destroy;override;
    function NoOfQuestions: integer;
  end;

  TEnquiryLine = class
  private
    FAdditionalDetails: TObjectList;
    FParts: TObjectList;
    FQuantities: TObjectList;
    FQuotingSuppliers: TObjectList;
    procedure SetParts(index: integer; const Value: TPart);
    function GetParts(index: integer): TPart;
    procedure SetQuantities(index: integer; const Value: TLineQuantity);
    function GetQuantities(index: integer): TLineQuantity;
    procedure SetQuotingSuppliers(index: integer; const Value: TSupplier);
    function GetQuotingSuppliers(index: integer): TSupplier;
    function GetAdditionalDetails(index: integer): TAdditionalDetail;
    procedure SetAdditionalDetails(index: integer;
      const Value: TAdditionalDetail);
  public
    LineNo: integer;
    FormDescription: string;
    NCROTCMix: string;
    Depth: double;
    DepthUnit: string;
    Width: double;
    WidthUnit: string;
    ArtworkInstructions: string;
    FormsPerBox: string;
    NoOfPlates: integer;
    OrderedQuantity: integer;
    OrderedPrice: Currency;
    PriceUnit: integer;
    ProofStatus: string;
    ProofDate: TDateTime;
    ProductType: TProductType;
    EnquiryStatus: integer;
    ReqResponseDate: TDateTime;
    SelectedSupplier: TSupplier;
    PrintedQuotation: boolean;
    EnqInactive: boolean;
    EnqInactiveDate: TDateTime;
    EnqInactiveReason: integer;
    FirmOrder: boolean;
    Narrative: TNarrative;
    FormReference: TFormReference;
    NumberInstructions: string;
    RunOnQuantity: double;
    RunOnPrice: Currency;
    RunOnCost: Currency;
    NewLine: boolean;
    Modified: boolean;
    PriceGrid: TPriceGrid;
    property QuotingSuppliers[index: integer]: TSupplier read GetQuotingSuppliers write SetQuotingSuppliers;
    property Quantities[index:integer]: TLineQuantity read GetQuantities write SetQuantities;
    property Parts[index: integer]: TPart read GetParts write SetParts;
    property AdditionalDetails[index: integer]: TAdditionalDetail read GetAdditionalDetails write SetAdditionalDetails;
    Constructor Create;
    Destructor Destroy;override;
    procedure Load(EnqNo: integer);
    procedure LoadParts(EnqNo: integer);
    procedure LoadQuantities(EnqNo: integer);
    procedure LoadQuoteSuppliers(EnqNo: Integer);
    procedure Save(EnqNo: integer);
    procedure SaveParts(EnqNo: integer);
    procedure DeleteParts(EnqNo: integer);
    procedure Insert(EnqNo: integer);
    procedure Update(EnqNo: integer);
    function GetNoOfParts:integer;
    function NoOfQuantities: integer;
    function NoOfQuotingSuppliers: integer;
    procedure LoadPriceGrid(EnqNo: integer);
    procedure NewPart();
    procedure RemovePart(index: integer);
    function CopyPart(index: integer): integer;
    procedure SetDefaultValues;
    procedure InsertQuantity();overload;
    procedure InsertQuantity(index: integer; aLineQuantity: TLineQuantity);overload;
    procedure InsertPrices(index: integer);
    procedure SaveQuantities(EnqNo: integer);
    procedure SaveQuoteSuppliers(EnqNo: integer);
    procedure SavePriceGrid(EnqNo: integer);
    procedure DeleteSupplierQuote(EnqNo, QtyInx, SuppInx: integer);
    procedure InsertSupplierQuote(EnqNo, QtyInx, SuppInx: integer);
    procedure UpdateSupplierQuote(EnqNo, QtyInx, SuppInx: integer);
    procedure DeleteCapabilities(EnqNo: integer);
    procedure InsertCapabilities(EnqNo: integer);
    function IsQuoteSupplier(SuppNo, BrnchNo: integer): boolean;
    procedure AddQuoteSupplier(aQuoteSupplier: TSupplier);overload;
    procedure AddQuoteSupplier;overload;
    procedure AddQuantity(aLineQuantity: TLineQuantity);
    procedure DeleteQuantity(index: integer);
    procedure DeleteQuoteSupplier(index: integer);
    procedure ClearDeletedQuoteSuppliers();
    procedure ClearDeletedQuantities();
    procedure NewPriceRow;
    procedure SaveAnswers(EnqNo: Integer);
    procedure LoadAddtnlDtls(EnqNo: Integer);
    function NoOfNotes: integer;
    procedure AddAdditionalDetail(theAudience: string);
    procedure SaveAdditionalDetails(EnqNo: integer);
    function NoOfActualQuantities: integer;
  end;

  TOperator = class
    OperatorNo: integer;
    Name: String;
  public
    procedure Load;
    procedure GetOpNoByName;
  end;

  TRep = class
    RepNo: integer;
    Name: string;
  public
    procedure Load;
    procedure GetRepNoByName;
  end;

  TContact = class
    ContactNo: integer;
    Name: string;
    Phone: string;
    Fax: string;
  public
    procedure Load(CustNo, BrnchNo: integer);
    procedure GetContactNoByName(CustNo, BrnchNo: integer);
  end;

  TCustomerBranch = class
    BranchNo: integer;
    BranchName: string;
    BranchAddr: TStringList;
  public
    Constructor Create;
    Destructor Destroy;override;
    procedure Load(CustNo: integer);
  end;

  TCustomer = class
    CustomerNo: integer;
    CustName: string;
    CreditLimit: currency;
    AvailableCredit: currency;
  public
    procedure Load();
  end;

  TEnquiry = class
  public
    EnquiryNo: integer;
    DatePoint: TDateTime;
    Operator: TOperator;
    CustEstContact: string;
    QuoteReqBy: TDateTime;
    CustomerQuoteDate: TDateTime;
    Customer: TCustomer;
    CustomerBranch: TCustomerBranch;
    Rep: TRep;
    Description: string;
    EnquiryStatus: integer;
    EnqInActive: string;
    OfficeContact: TOperator;
    Contact: TContact;
    //SelectedLine: integer;
    NewEnquiry: boolean;
    //DetailsModified is used to prompt for a save attempt when some details of the
    //enquiry have changed, Modified is used at the different levels of the
    //enquiry so that only the details that have changed get saved to the database
    DetailsModified: boolean;
    ChangesSaved: boolean;
    Modified: boolean;
    Deleted: boolean;
    Line: TEnquiryLine;
    ReadOnly: boolean;
    EnquiryType: string;
    Constructor Create;overload;
    Constructor Create(EnqNo: integer);overload;
    constructor Create(EnqNo, LineNo: integer);overload;
    constructor create(EnqNo, LineNo: integer; copy: string);overload;
    Destructor Destroy;override;
    procedure New();
    procedure Load();
    function Save(): boolean;
    procedure SaveLine();
    procedure Insert();
    procedure Update();
    procedure Edit();
    procedure SetDefaultValues;
  end;

  TEnquiryQuote = class(TEnquiry)
    function Save(): boolean;
    procedure Insert();
    procedure Edit();
  end;
var
  PBEnqDM: TPBEnqDM;

const
  rvSuccess = true;
  rvFailure = false;

implementation

uses UITypes, pbDatabase, pbMainMenu, PBMaintEnquiry, PBMaintQEnq;

{$R *.DFM}

function TPBEnqDM.GetNextEnqNumber: Integer;
begin
  LockCompanyRecord;
  try
    try
      with GetLastSQL do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Enquiry_Number').AsInteger + 1;
        Close;
      end;
      with UpdLastSQL do
      begin
        ParamByName('Last_Enquiry_Number').AsInteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Enquiry number:' + #13 + E.Message);
    end;
    end;
  finally
    FreeCompanyRecord;
  end;
end;

procedure TPBEnqDM.LockCompanyRecord;
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
  MySelf := frmpbMainMenu.iOperator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qryCompany do
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

procedure TPBEnqDM.FreeCompanyRecord;
begin
  with qryCompany do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

{ TEnquiry }

constructor TEnquiry.Create;
begin
  //calling TEnquiry.Create without params creates a new blank enquiry
  inherited;
  Operator := TOperator.Create;
  Customer := TCustomer.Create;
  CustomerBranch := TCustomerBranch.Create;
  Rep := TRep.Create;
  OfficeContact := TOperator.Create;
  Contact := TContact.Create;
  Line := TEnquiryline.Create;

  Self.SetDefaultValues;
  Self.Line.SetDefaultValues;
end;

constructor TEnquiry.Create(EnqNo, LineNo: integer);
begin
  //calling TEnquiry.Create with EnqNo and LineNo creates the enquiry
  //and loads a specific enquiry line from the database
  inherited Create;
  Operator := TOperator.Create;
  Customer := TCustomer.Create;
  CustomerBranch := TCustomerBranch.Create;
  Rep := TRep.Create;
  OfficeContact := TOperator.Create;
  Contact := TContact.Create;
  Line := TEnquiryline.Create;

  Self.EnquiryNo:= EnqNo;
  Self.Load;
  Self.Line.LineNo := LineNo;
  Self.Line.Load(Self.EnquiryNo);
end;

constructor TEnquiry.Create(EnqNo: integer);
begin
  //calling TEnquiry.Create with EnqNo just loads the enquiry header details
  //the line number is set to the next one available and the line defaults are
  //set
  inherited Create;
  Operator := TOperator.Create;
  Customer := TCustomer.Create;
  CustomerBranch := TCustomerBranch.Create;
  Rep := TRep.Create;
  OfficeContact := TOperator.Create;
  Contact := TContact.Create;
  Line := TEnquiryline.Create;

  Self.EnquiryNo:= EnqNo;
  Self.Load;
  Self.Line.SetDefaultValues;
  Self.Line.LineNo := PBEnqDM.GetNextEnqLineNo(EnqNo);
  Self.Modified := true;
end;

constructor TEnquiry.Create(EnqNo, LineNo: integer; copy: string);
var
  qtyInx, suppInx: integer;
begin
  //calling TEnquiry.Create with EnqNo and LineNo creates the enquiry
  //and loads a specific enquiry line from the database
  //the string parameter just lets the us pass a string such as 'copy' to
  //signify that we want to make a copy of the enquiry.
  inherited Create;
  Operator := TOperator.Create;
  Customer := TCustomer.Create;
  CustomerBranch := TCustomerBranch.Create;
  Rep := TRep.Create;
  OfficeContact := TOperator.Create;
  Contact := TContact.Create;
  Line := TEnquiryline.Create;

  Self.EnquiryNo:= EnqNo;
  Self.Load;
  Self.Line.LineNo := LineNo;
  Self.Line.Load(Self.EnquiryNo);

  Self.EnquiryNo := 0;
  Self.NewEnquiry := true;
  Self.Line.NewLine := true;
  Self.DetailsModified := true;
  Self.ReadOnly := false;

  for qtyInx := 0 to (Self.Line.NoOfQuantities - 1) do
  begin
    Self.Line.Quantities[qtyInx].NewLineQuantity := true;
  end;
  for suppInx := 0 to (Self.Line.NoOfQuotingSuppliers - 1) do
  begin
    Self.Line.QuotingSuppliers[suppInx].SupplierResponse.NewResponse := true;
  end;
end;

destructor TEnquiry.Destroy;
begin
  Line.Free;
  Contact.Free;
  OfficeContact.Free;
  Rep.Free;
  CustomerBranch.Free;
  Customer.Free;
  Operator.Free;
  inherited;
end;

procedure TEnquiry.Edit;
var
  MaintForm: TPBMaintEnquiryFrm;
begin
  MaintForm := TPBMaintEnquiryFrm.Create(PBEnqDM);
  with MaintForm do
  begin
    Enquiry := Self;

    ShowModal();
  end;
  MaintForm.Free;
end;

procedure TEnquiry.Insert;
begin
  with PBEnqDM.qryInsEnquiry do
  begin
    ParamByName('Date_Point').asDateTime := Self.DatePoint;
    ParamByName('Operator').asInteger := Self.Operator.OperatorNo;
    ParamByName('Cust_Est_Contact').asString := Self.CustEstContact;

    if Self.QuoteReqBy = 0 then
      ParamByName('Quote_Required_By').Clear
    else
      ParamByName('Quote_Required_By').asDateTime := Self.QuoteReqBy;

    if Self.CustomerQuoteDate = 0 then
      ParamByName('Customer_Quote_Date').Clear
    else
      ParamByName('Customer_Quote_Date').asDateTime := Self.CustomerQuoteDate;

    ParamByName('Customer').asInteger := Self.Customer.CustomerNo;
    ParamByName('Branch_No').asInteger := Self.CustomerBranch.BranchNo;

    if Self.Rep.RepNo = -1 then
      ParamByName('Rep').Clear
    else
      ParamByName('Rep').asInteger := Self.Rep.RepNo;

    ParamByName('Description').asString := Self.Description;
    ParamByName('Enquiry_Status').asInteger := Self.EnquiryStatus;
    ParamByName('Enq_InActive').asString := Self.EnqInActive;
    if Self.OfficeContact.OperatorNo = -1 then
      ParamByName('Office_Contact').Clear
    else
      ParamByName('Office_Contact').asInteger := Self.OfficeContact.OperatorNo;

    ParamByName('Contact_No').asInteger := Self.Contact.ContactNo;
    ParamByName('Enquiry_Type').asString := Self.EnquiryType;
    ParamByName('Enquiry').asInteger := Self.EnquiryNo;

    ExecSQL;
  end;
end;

procedure TEnquiry.Load;
begin
  with PBEnqDM.qrySelEnquiry do
  begin
    Close;
    ParamByName('EnqNo').asInteger := Self.EnquiryNo;
    Open;

    Self.DatePoint := FieldByName('Date_Point').asDateTime;
    Self.CustEstContact := FieldByName('Cust_est_Contact').asString;
    Self.QuoteReqBy := FieldByName('Quote_Required_By').asDateTime;
    Self.CustomerQuoteDate := FieldByName('Customer_Quote_Date').asDateTime;
    Self.Description := FieldByName('Description').asString;
    Self.EnquiryStatus := FieldByName('Enquiry_Status').asInteger;
    Self.EnqInActive := FieldByName('Enq_InActive').asString;
    Self.EnquiryType := FieldByName('Enquiry_Type').asString;

    Self.OfficeContact.OperatorNo := FieldByName('Office_Contact').asInteger;
    Self.OfficeContact.Load;

    Self.Operator.OperatorNo := FieldByName('Operator').asInteger;
    Self.Operator.Load;
    
    Self.Customer.CustomerNo := FieldByName('Customer').asInteger;
    Self.Customer.Load();

    Self.CustomerBranch.BranchNo := FieldByName('Branch_No').asInteger;
    Self.CustomerBranch.Load(Self.Customer.CustomerNo);


    Self.Rep.RepNo := FieldByName('Rep').asInteger;
    Self.Rep.Load;

    Self.Contact.ContactNo := FieldByName('Contact_No').asInteger;
    Self.Contact.Load(Self.Customer.CustomerNo, Self.CustomerBranch.BranchNo);
  end;
end;

procedure TEnquiry.New;
begin
  Self.DatePoint := Now();
  self.Operator.OperatorNo := frmpbMainMenu.iOperator;
  Self.Operator.Load;
end;

function TEnquiry.Save: boolean;
begin
  if Self.ReadOnly then
  begin
    MessageDlg('Cannot save read-only copy of enquiry.', mtWarning, [mbOK], 0);
    Result := rvFailure;
    exit;
  end;

  with dmBroker.PBLDatabase do
  begin
    try
      StartTransaction;

      if Self.NewEnquiry then
      begin
        //new enquiry, need to insert records
        Self.EnquiryNo := PBEnqDM.GetNextEnqNumber;
        Self.Insert;
      end
      else if Self.Modified then
      begin
        //existing enquiry, need to update records
        Self.Update;
      end;

      Self.SaveLine;

      Commit;
      Result := rvSuccess;
    except on E: Exception do
      begin
        ShowMessage('Unable to save details, ' + e.message);
        Rollback;
        Result := rvFailure;
      end;
    end;
  end;
end;

procedure TEnquiry.SaveLine;
begin
    Self.Line.Save(Self.EnquiryNo);
end;

procedure TEnquiry.SetDefaultValues;
begin
  Self.NewEnquiry := true;
  Self.DatePoint := Now();
  Self.Operator.OperatorNo := frmpbMainMenu.iOperator;
  Self.Operator.Load;
  Self.QuoteReqBy := Now();
  Self.EnquiryStatus := 10;
  Self.OfficeContact.OperatorNo := Self.Operator.OperatorNo;
  Self.OfficeContact.Load;
end;

procedure TEnquiry.Update;
begin
  with PBEnqDM.qryUpdEnquiry do
  begin
    ParamByName('Date_Point').asDateTime := Self.DatePoint;
    ParamByName('Operator').asInteger := Self.Operator.OperatorNo;
    ParamByName('Cust_Est_Contact').asString := Self.CustEstContact;
    
    if Self.QuoteReqBy = 0 then
      ParamByName('Quote_Required_By').Clear
    else
      ParamByName('Quote_Required_By').asDateTime := Self.QuoteReqBy;

    if Self.CustomerQuoteDate = 0 then
      ParamByName('Customer_Quote_Date').Clear
    else
      ParamByName('Customer_Quote_Date').asDateTime := Self.CustomerQuoteDate;

    ParamByName('Customer').asInteger := Self.Customer.CustomerNo;
    ParamByName('Branch_No').asInteger := Self.CustomerBranch.BranchNo;

    if Self.Rep.RepNo = -1 then
      ParamByName('Rep').Clear
    else
      ParamByName('Rep').asInteger := Self.Rep.RepNo;

    ParamByName('Description').asString := Self.Description;
    ParamByName('Enquiry_Status').asInteger := Self.EnquiryStatus;
    ParamByName('Enq_InActive').asString := Self.EnqInActive;
    if Self.OfficeContact.OperatorNo = -1 then
      ParamByName('Office_Contact').Clear
    else
      ParamByName('Office_Contact').asInteger := Self.OfficeContact.OperatorNo;
      
    ParamByName('Contact_No').asInteger := Self.Contact.ContactNo;
    ParamByName('Enquiry_Type').asString := Self.EnquiryType;
    ParamByName('Enquiry').asInteger := Self.EnquiryNo;

    ExecSQL;
  end;
end;

{ TCustomer }

procedure TCustomer.Load;
begin
  with PBEnqDM.qrySelCustDetails do
  begin
    Close;
    ParamByName('Customer').asInteger := Self.CustomerNo;
    Open;

    Self.CustName := FieldByName('Name').asString;
    Self.CreditLimit := FieldByName('Credit_Limit').asCurrency;
    Self.AvailableCredit := FieldByName('Available_Credit').asCurrency;

    Close;
  end;
end;

{ TCustomerBranch }

constructor TCustomerBranch.Create;
begin
  inherited;
  BranchAddr := TStringList.Create;
end;

destructor TCustomerBranch.Destroy;
begin
  BranchAddr.Free;
  inherited;
end;

procedure TCustomerBranch.Load(CustNo: integer);
begin
  with PBEnqDM.qrySelCustBrnchDetails do
  begin
    Close;
    ParamByName('Customer').asInteger := CustNo;
    ParamByName('Branch_No').asInteger := Self.BranchNo;
    Open;

    Self.BranchName := FieldByName('Name').asString;

    Self.BranchAddr.Clear;
    Self.BranchAddr.Add(FieldByName('Building_No_name').asString);
    Self.BranchAddr.Add(FieldByName('Street').asString);
    Self.BranchAddr.Add(FieldByName('Locale').asString);
    Self.BranchAddr.Add(FieldByName('Town').asString);
    Self.BranchAddr.Add(FieldByName('Postcode').asString);

    Close;
  end;
end;

{ TContact }

procedure TContact.GetContactNoByName(CustNo, BrnchNo: integer);
begin
  with PBEnqDM.qrySelCustContactNo do
  begin
    Close;
    ParamByName('Customer').asInteger := CustNo;
    ParamByName('Branch_No').asInteger := BrnchNo;
    ParamByName('Name').asString := Self.Name;
    Open;
    Self.ContactNo := FieldByName('Contact_No').asInteger;

    Close;
  end;
end;

procedure TContact.Load(CustNo, BrnchNo: integer);
begin
  with PBEnqDM.qrySelContactDetails do
  begin
    Close;
    ParamByName('Customer').asInteger := CustNo;
    ParamByName('Branch_No').asInteger := BrnchNo;
    ParamByName('Contact_No').asInteger := Self.ContactNo;
    Open;

    Self.Name := FieldByName('Name').asString;
    Self.Phone := FieldbyName('Phone').asString;
    Self.Fax := FieldByName('Fax_Number').asString;

    Close;
  end;
end;

{ TRep }

procedure TRep.GetRepNoByName;
begin
  with PBEnqDM.qrySelCustRepNo do
  begin
    Close;
    ParamByName('Name').asString := Self.Name;
    Open;
    Self.RepNo := FieldByName('Rep').asInteger;

    Close;
  end;
end;

procedure TRep.Load();
begin
  with PBEnqDM.qrySelRepDtls do
  begin
    Close;
    ParamByName('Rep').asInteger := Self.RepNo;
    Open;
    if RecordCount = 0 then
    begin
      Self.RepNo := -1;
      Self.Name := '';
    end
    else
    begin
      Self.Name := FieldByName('Name').AsString;
    end;

    Close;
  end;
end;

{ TOperator }

procedure TOperator.GetOpNoByName;
begin
  with PBEnqDM.qrySelOperatorNo do
  begin
    Close;
    ParamByName('Name').asString := Self.Name;
    Open;
    Self.OperatorNo := FieldByName('Operator').asInteger;

    Close;
  end;
end;

procedure TOperator.Load;
begin
  with PBEnqDM.qrySelOperator do
  begin
    Close;
    ParamByName('Operator').asInteger := Self.OperatorNo;
    Open;
    Self.Name := FieldByName('Name').asString;

    Close;
  end;
end;

{ TEnquiryLine }

procedure TEnquiryLine.AddAdditionalDetail(theAudience: string);
var
  AddDetail: TAdditionalDetail;
begin
  AddDetail := TAdditionalDetail.Create;
  AddDetail.AdditionlDetailNo := Self.NoOfNotes;
  AddDetail.Audience := theAudience;
  AddDetail.NewDetail := true;
  Self.FAdditionalDetails.Add(AddDetail);
end;

procedure TEnquiryLine.AddQuantity(aLineQuantity: TLineQuantity);
begin
  Self.FQuantities.Add(aLineQuantity);
end;

procedure TEnquiryLine.AddQuoteSupplier(aQuoteSupplier: TSupplier);
begin
  Self.FQuotingSuppliers.Add(aQuoteSupplier);
end;

procedure TEnquiryLine.AddQuoteSupplier;
var
  QuoteSupplier: TSupplier;
begin
  QuoteSupplier := TSupplier.Create(true);
  QuoteSupplier.SupplierResponse.NewResponse := true;
  Self.AddQuoteSupplier(QuoteSupplier);
end;

procedure TEnquiryLine.ClearDeletedQuantities;
var
  qtyInx: Integer;
begin
  for qtyInx := (Self.NoOfQuantities - 1) downto 0 do
  begin
    if Self.Quantities[qtyInx].Deleted then
    begin
      Self.DeleteQuantity(qtyInx);
    end;
  end;
end;

procedure TEnquiryLine.ClearDeletedQuoteSuppliers;
var
  suppInx: Integer;
begin
  for suppInx := (Self.NoOfQuotingSuppliers - 1) downto 0 do
  begin
    if Self.QuotingSuppliers[suppInx].SupplierResponse.Deleted then
    begin
      Self.DeleteQuoteSupplier(suppInx);
    end;
  end;
end;

function TEnquiryLine.CopyPart(index: integer): integer;
var
  aPart: TPart;
begin
  aPart := Tpart.Create;
  aPart.PartNo := Self.GetNoOfParts;
  aPart.Heading := Self.Parts[index].Heading;
  aPart.SameAsPart := index;
  aPart.PaperBrand := Self.Parts[index].PaperBrand;
  aPart.PaperMaterial := Self.Parts[index].PaperMaterial;
  aPart.PaperWeight := Self.Parts[index].PaperWeight;
  aPart.PaperColour := Self.Parts[index].PaperColour;
  aPart.FaceInks := Self.Parts[index].FaceInks;
  aPart.ReverseInks := Self.Parts[index].ReverseInks;
  aPart.LeftMarginType := Self.Parts[index].LeftMarginType;
  aPart.LeftMarginWidth := Self.Parts[index].LeftMarginWidth;
  aPart.RightMarginType := Self.Parts[index].RightMarginType;
  aPart.RightMarginWidth := Self.Parts[index].RightMarginWidth;
  aPart.NoOfPlateChanges := Self.Parts[index].NoOfPlateChanges;
  aPart.Description := Self.Parts[index].Description;
  FParts.Add(aPart);
  Self.Modified := true;
  Result := Self.GetNoOfParts - 1;
end;

constructor TEnquiryLine.Create;
begin
  inherited;
  ProductType := TProductType.Create;
  SelectedSupplier := TSupplier.Create;
  Narrative := TNarrative.Create;
  FormReference := TFormReference.Create;
  FQuantities := TObjectList.Create;
  FQuotingSuppliers := TObjectList.Create;
  FParts := TObjectList.Create;
  FAdditionalDetails := TObjectlist.Create;
end;

procedure TEnquiryLine.DeleteCapabilities(EnqNo: integer);
begin
  with PBEnqDM.qryDelEnqLineCpbltys do
  begin
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := Self.LineNo;
    ExecSQL;
  end;
end;

procedure TEnquiryLine.DeleteParts(EnqNo: integer);
begin
  with PBEnqDM.qryDelEnqLineParts do
  begin
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := Self.LineNo;
    
    ExecSQL;
  end;
end;

procedure TEnquiryLine.DeleteQuantity(index: integer);
begin
  Self.FQuantities.Delete(index);
end;

procedure TEnquiryLine.DeleteQuoteSupplier(index: integer);
begin
  Self.FQuotingSuppliers.Delete(index);
end;

procedure TEnquiryLine.DeleteSupplierQuote(EnqNo, QtyInx, SuppInx: integer);
begin
  with PBEnqDM.qryDelSuppEnqQty do
  begin
    ParamByName('Supplier').asInteger := Self.QuotingSuppliers[SuppInx].SupplierNo;
    ParamByName('Branch_No').asInteger := Self.QuotingSuppliers[SuppInx].Branch.BranchNo;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := Self.LineNo;
    ParamByName('Quantity').asFloat := Self.Quantities[QtyInx].Quantity;
    
    ExecSQL;
  end;
end;

destructor TEnquiryLine.Destroy;
begin
  FAdditionalDetails.Free;
  FParts.Free;
  FQuotingSuppliers.Free;
  FQuantities.Free;
  FormReference.Free;
  Narrative.Free;
  SelectedSupplier.Free;
  ProductType.Free;
  inherited;
end;

function TEnquiryLine.GetAdditionalDetails(
  index: integer): TAdditionalDetail;
begin
  Result := FAdditionalDetails[index] as TAdditionalDetail;
end;

function TEnquiryLine.GetNoOfParts: integer;
begin
  Result := FParts.Count;
end;

function TEnquiryLine.GetParts(index: integer): TPart;
begin
  Result := FParts[index] as TPart;
end;

function TEnquiryLine.GetQuantities(index: integer): TLineQuantity;
begin
  Result := FQuantities[index] as TLineQuantity;
end;

function TEnquiryLine.GetQuotingSuppliers(index: integer): TSupplier;
begin
  Result := FQuotingSuppliers[index] as TSupplier;
end;

procedure TEnquiryLine.Insert(EnqNo: integer);
begin
  with PBEnqDM.qryInsEnqLine do
  begin
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := Self.LineNo;
    ParamByName('Form_description').asString := Self.FormDescription;
    
    if Self.GetNoOfParts = 0 then
      ParamByName('No_Of_Parts').Clear
    else
      ParamByName('No_Of_Parts').asInteger := Self.GetNoOfParts;

    if Self.NCROTCMix = '' then
          ParamByName('NCR_OTC_Mix').asString := 'X' // x = n/a
    else
          ParamByName('NCR_OTC_Mix').asString := Self.NCROTCMix;

    ParamByName('Depth').asFloat := Self.Depth;
    ParamByName('Depth_Unit').asString := Self.DepthUnit;
    ParamByName('Width').asFloat := Self.Width;
    ParamByName('Width_Unit').asString := Self.WidthUnit;
    ParamByName('ArtWork_Instructions').asString := Self.ArtworkInstructions;
    ParamByName('forms_per_box').asString := Self.FormsPerBox;
    ParamByName('No_Of_Plates').asInteger := Self.NoOfPlates;
    ParamByName('Ordered_Quantity').asInteger := self.OrderedQuantity;
    ParamByName('Ordered_Price').asCurrency := self.OrderedPrice;
    if self.PriceUnit = 0 then
      ParamByName('Price_Unit').Clear
    else
      ParamByName('Price_Unit').asInteger := self.PriceUnit;

    if self.ProofStatus = '' then
      ParamByName('Proof_Status').Clear
    else
      ParamByName('Proof_Status').asString := self.ProofStatus;

    if Self.ProofDate = 0 then
      ParamByName('Proof_Date').Clear
    else
      ParamByName('Proof_Date').asDateTime := Self.ProofDate;

    ParamByName('Product_Type').asInteger := self.ProductType.TypeNo;
    ParamByName('Enquiry_Status').asInteger := self.EnquiryStatus;
    ParamByName('Req_Response_date').asDateTime := Now();
    if Self.SelectedSupplier.SupplierNo = 0 then
      ParamByName('SelectedSupplier').Clear
    else
      ParamByName('SelectedSupplier').asInteger := Self.SelectedSupplier.SupplierNo;

    ParamByName('SelectedBranch_No').asInteger := Self.SelectedSupplier.Branch.BranchNo;

    if Self.PrintedQuotation then
      ParamByName('Printed_Quotation').asString := 'Y'
    else
      ParamByName('Printed_Quotation').asString := 'N';

    if Self.EnqInactive then
      ParamByName('Enq_Inactive').asString := 'Y'
    else
      ParamByName('Enq_Inactive').asString := 'N';

    if Self.EnqInactiveDate = 0 then
      ParamByName('Enq_Inactive_Date').Clear
    else
      ParamByName('Enq_Inactive_Date').asDateTime := Self.EnqInactiveDate;

    if Self.EnqInactiveReason = 0 then
      ParamByName('Enq_Inactive_Reason').Clear
    else
      ParamByName('Enq_Inactive_Reason').asInteger := Self.EnqInactiveReason;

    if Self.FirmOrder then
      ParamByName('Firm_Order').asString := 'Y'
    else
      ParamByName('Firm_Order').asString := 'N';

    ParamByName('Narrative').asInteger := Self.Narrative.dbKey;
    if Self.FormReference.RefNo = 0 then
      ParamByName('Form_Reference').Clear
    else
      ParamByName('Form_Reference').asInteger := Self.FormReference.RefNo;

    ParamByName('Number_Instructions').asString := Self.NumberInstructions;
    ParamByName('Run_On_Quantity').asFloat := Self.RunOnQuantity;
    ParamByName('Run_On_Price').asCurrency := Self.RunOnPrice;
    ParamByName('Run_On_Cost').asCurrency := Self.RunOnCost;

    ExecSQL;
  end;
end;

procedure TEnquiryLine.InsertCapabilities(EnqNo: integer);
var
  cpbltyInx: integer;
begin
  for cpbltyInx := 0 to (Self.ProductType.GetCapabilityCount - 1) do
  begin
    if Self.ProductType.Capabilities[cpbltyInx].Selected then
    begin
      Self.ProductType.Capabilities[cpbltyInx].Insert(EnqNo, Self.LineNo, Self.ProductType.TypeNo);
    end;
  end;
end;

procedure TEnquiryLine.InsertPrices(index: integer);
var
  x, y: integer;
begin
  SetLength(Self.PriceGrid, (Self.NoOfQuantities), Self.NoOfQuotingSuppliers);

  if (index = Self.NoOfQuantities - 1) then
  begin
    //no need to do anything the new qunatity is larger than any
    //of the others and so the new column (the last in the grid)
    //is for the new quantity and so the prices in it will be blank
    //and the others do not have to be shuffled
  end
  else
  begin
    //here the new quantity is in between some of the existing quantities
    //so it is inserted in the middle, as such the 'higher' price grid
    //columns need to be shifted right to make room.
    for x := Self.NoOfQuantities - 2 downto index do
    begin
      for y := 0 to (Self.NoOfQuotingSuppliers - 1) do
      begin
        Self.PriceGrid[x+1, y].SupplierPrice := Self.PriceGrid[x, y].SupplierPrice;
        Self.PriceGrid[x+1, y].PriceUnit := Self.PriceGrid[x, y].PriceUnit;
        Self.PriceGrid[x+1, y].ResponseQuantity := Self.PriceGrid[x, y].ResponseQuantity;
        Self.PriceGrid[x+1, y].PriceSelected := Self.PriceGrid[x, y].PriceSelected;
        Self.PriceGrid[x+1, y].MarkedUpPrice := Self.PriceGrid[x, y].MarkedUpPrice;
      end;
    end;
  end;

  for y := 0 to (Self.NoOfQuotingSuppliers - 1) do
  begin
    Self.PriceGrid[index, y].SupplierPrice := 0.00;
    Self.PriceGrid[index, y].PriceUnit := 1;
    Self.PriceGrid[index, y].ResponseQuantity := Self.Quantities[index].Quantity;
    Self.PriceGrid[index, y].PriceSelected := false;
    Self.PriceGrid[index, y].MarkedUpPrice := 0.00;
  end;
end;

procedure TEnquiryLine.InsertQuantity(index: integer;
  aLineQuantity: TLineQuantity);
begin
  Self.FQuantities.Insert(index, aLineQuantity);
end;

procedure TEnquiryLine.InsertQuantity;
var
  aLineQuantity: TLineQuantity;
begin
  aLineQuantity := TLineQuantity.Create;
  aLineQuantity.NewLineQuantity := true;
  aLineQuantity.Modified := false;
  aLineQuantity.Deleted := false;
  Self.AddQuantity(aLineQuantity);
end;

procedure TEnquiryLine.InsertSupplierQuote(EnqNo, QtyInx, SuppInx: integer);
begin
  with PBEnqDM.qryInsSuppEnqQty do
  begin
    ParamByName('Supplier').asInteger := Self.QuotingSuppliers[SuppInx].SupplierNo;
    ParamByName('Branch_No').asInteger := Self.QuotingSuppliers[SuppInx].Branch.BranchNo;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := Self.LineNo;
    ParamByName('Quantity').asFloat := Self.Quantities[QtyInx].Quantity;
    ParamByName('Supplier_Price').asCurrency := Self.PriceGrid[QtyInx, SuppInx].SupplierPrice;
    if Self.PriceGrid[QtyInx, SuppInx].PriceUnit = 0 then
      ParamByName('Price_Unit').Clear
    else
      ParamByName('Price_Unit').asInteger := Self.PriceGrid[QtyInx, SuppInx].PriceUnit;
      
    ParamByName('Response_Quantity').asFloat := Self.PriceGrid[QtyInx, SuppInx].ResponseQuantity;
    if Self.PriceGrid[QtyInx, SuppInx].PriceSelected then
      ParamByName('Price_Selected').asString := 'Y'
    else
      ParamByName('Price_Selected').asString := 'N';
    ParamByName('Marked_Up_Price').asCurrency := Self.PriceGrid[QtyInx, SuppInx].MarkedUpPrice;

    ExecSQL;
  end;
end;

function TEnquiryLine.IsQuoteSupplier(SuppNo, BrnchNo: integer): boolean;
var
  suppInx: integer;
begin
  for SuppInx := 0 to (Self.NoOfQuotingSuppliers - 1) do
  begin
    if (SuppNo = Self.QuotingSuppliers[suppInx].SupplierNo) and
       (BrnchNo = Self.QuotingSuppliers[suppInx].Branch.BranchNo) then
    begin
      Result := true;
      exit;
    end;
  end;
  Result := false;
end;

procedure TEnquiryLine.Load(EnqNo: integer);
begin
  with PBEnqDM.qrySelEnqLine do
  begin
    Close;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := Self.LineNo;
    Open;
    Self.FormDescription := FieldByName('Form_Description').asString;
    Self.NCROTCMix := FieldByName('NCR_OTC_Mix').asString;
    Self.Depth := FieldByName('Depth').asFloat;
    Self.DepthUnit := FieldByName('Depth_Unit').asString;
    Self.Width := FieldByName('Width').asFloat;
    Self.WidthUnit := FieldByName('Width_Unit').asString;
    Self.ArtworkInstructions := FieldByName('Artwork_Instructions').asString;
    Self.FormsPerBox := FieldByName('Forms_Per_Box').asString;
    Self.NoOfPlates := FieldByName('No_Of_Plates').asInteger;
    Self.OrderedQuantity := FieldByName('Ordered_Quantity').asInteger;
    Self.OrderedPrice := FieldByName('Ordered_Price').asFloat;
    Self.PriceUnit := FieldByName('Price_Unit').asInteger;
    Self.ProofStatus := FieldByName('Proof_Status').asString;
    Self.ProofDate := FieldByName('Proof_Date').asDateTime;
    Self.EnquiryStatus := FieldByName('Enquiry_Status').asInteger;
    Self.ReqResponseDate := FieldByName('Req_Response_Date').asDateTime;

    if FieldByName('Printed_Quotation').asString = 'Y' then
      Self.PrintedQuotation := true
    else
      Self.PrintedQuotation := false;
    if FieldByName('Enq_InActive').asString = 'Y' then
      Self.EnqInactive := true
    else
      Self.EnqInactive := false;
    Self.EnqInactiveDate := FieldByName('Enq_InActive_Date').asDateTime;
    Self.EnqInactiveReason := FieldByName('Enq_InActive_Reason').asInteger;
    if FieldByName('Firm_Order').asString = 'Y' then
      Self.FirmOrder := true
    else
      Self.FirmOrder := false;
    
    Self.NumberInstructions := FieldByName('Number_Instructions').asString;
    Self.RunOnQuantity := FieldByName('Run_On_Quantity').asFloat;
    Self.RunOnPrice := FieldByName('Run_On_Price').asCurrency;
    Self.RunOnCost := FieldByName('Run_On_Cost').asCurrency;

    Self.Narrative.dbKey := FieldByName('Narrative').asInteger;
    Self.Narrative.LoadfromDB;

    Self.ProductType.TypeNo := FieldByName('Product_Type').asInteger;
    Self.ProductType.Load(EnqNo, Self.LineNo);

    Self.SelectedSupplier.SupplierNo := FieldByName('SelectedSupplier').asInteger;
    Self.SelectedSupplier.Load;

    Self.SelectedSupplier.Branch.BranchNo := FieldByName('SelectedBranch_no').asInteger;
    Self.SelectedSupplier.Branch.Load(Self.SelectedSupplier.SupplierNo);

    Self.FormReference.RefNo := FieldByName('Form_Reference').asInteger;
    Self.FormReference.Load;

    //Load Part Details
    Self.LoadParts(EnqNo);

    //load quantities and supplier costs and quotes
    Self.LoadQuantities(EnqNo);

    //load list of suppliers approached for quote
    Self.LoadQuoteSuppliers(EnqNo);

    //set the size of the price grid and fill it
    Self.LoadPriceGrid(EnqNo);

    //load the additional notes relatingto suppliers and customers
    Self.LoadAddtnlDtls(EnqNo);

    Close;
  end;
end;

procedure TEnquiryLine.LoadAddtnlDtls(EnqNo: Integer);
var
  aDetail: TAdditionalDetail;
  x, DetCount: integer;
begin
  with PBEnqDM.qrySelEnqAddNts do
  begin
    Close;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := Self.LineNo;
    Open;
    DetCount := RecordCount;
    First;
    for x := 0 to (DetCount - 1) do
    begin
      aDetail := TAdditionalDetail.Create;
      aDetail.AdditionlDetailNo := FieldByName('Additional_Details').asInteger;
      aDetail.Load(EnqNo, LineNo);
      Self.FAdditionalDetails.Add(aDetail);
      Next;
    end;
  end;
end;

procedure TEnquiryLine.LoadParts(EnqNo: integer);
var
  aPart: TPart;
  x, PartCount: integer;
begin
  with PBEnqDM.qrySelNoOfEnqParts do
  begin
    Close;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := Self.LineNo;
    Open;
    PartCount := RecordCount;
    First;
    for x := 0 to (PartCount - 1) do
    begin
      aPart := TPart.Create;
      aPart.PartNo := FieldByName('Part_No').asInteger;
      aPart.Load(EnqNo, Self.LineNo);
      Self.FParts.Add(aPart);
      Next;
    end;
  end;
end;

procedure TEnquiryLine.LoadPriceGrid(EnqNo: integer);
var
  quantIndex, suppIndex: integer;
begin
  SetLength(Self.PriceGrid, Self.NoOfQuantities, Self.NoOfQuotingSuppliers);

  PBEnqDM.qrySelPriceUnits.Close;
  PBEnqDM.qrySelPriceUnits.Open;

  for quantIndex := 0 to (Self.NoOfQuantities - 1) do
  begin
    for suppIndex := 0 to (Self.NoOfQuotingSuppliers - 1) do
    begin
      with PBEnqDM.qrySelSuppEnqQtyPrice do
      begin
        Close;
        ParamByName('enquiry').asInteger := EnqNo;
        ParamByName('line').asInteger := Self.LineNo;
        ParamByName('quantity').asFloat := Self.Quantities[quantIndex].Quantity;
        ParamByName('supplier').asInteger := Self.QuotingSuppliers[suppIndex].SupplierNo;
        ParamByName('branch_no').asInteger := Self.QuotingSuppliers[suppIndex].Branch.BranchNo;
        Open;
        Self.PriceGrid[quantIndex, suppIndex].SupplierPrice := FieldByName('Supplier_Price').asFloat;
        Self.PriceGrid[quantIndex, suppIndex].PriceUnit := FieldByName('Price_Unit').asInteger;

        PBEnqDM.qrySelPriceUnits.Locate('Price_Unit', Variant(FieldByName('Price_Unit').asInteger), [lopartialKey]);
        Self.PriceGrid[quantIndex, suppIndex].PriceUnitDesc := PBEnqDM.qrySelPriceUnits.FieldByName('Description').asString;
        Self.PriceGrid[quantIndex, suppIndex].PriceUnitFactor := PBEnqDM.qrySelPriceUnits.FieldByName('Price_Unit_Factor').asFloat;

        Self.PriceGrid[quantIndex, suppIndex].ResponseQuantity := FieldByName('Response_Quantity').asFloat;
        if FieldByName('Price_Selected').asString = 'Y' then
          Self.PriceGrid[quantIndex, suppIndex].PriceSelected := true
        else
          Self.PriceGrid[quantIndex, suppIndex].PriceSelected := false;
        Self.PriceGrid[quantIndex, suppIndex].MarkedUpPrice := FieldByName('Marked_Up_Price').asFloat;
        Close;
      end;
    end;
  end;
  PBEnqDM.qrySelPriceUnits.Close;
end;

procedure TEnquiryLine.LoadQuantities(EnqNo: integer);
var
  aLineQuantity: TLineQuantity;
  x, QuantityCount: integer;
begin
  with PBenqDM.qrySelEnqLineQtys do
  begin
    Close;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := Self.LineNo;
    Open;
    QuantityCount := RecordCount;
    first;
    for x := 0 to (QuantityCount - 1) do
    begin
      aLineQuantity := TLineQuantity.Create;
      aLineQuantity.Quantity := FieldByName('Quantity').asFloat;
      aLineQuantity.Load(EnqNo, Self.LineNo);
      Self.FQuantities.Add(aLineQuantity);
      Next;
    end;
  end;
end;

procedure TEnquiryLine.LoadQuoteSuppliers(EnqNo: Integer);
var
  aSupplier: TSupplier;
  x, SupplierCount: integer;
begin
    with PBEnqDM.qrySelEnqQteSupls do
    begin
      Close;
      ParamByName('enquiry').asInteger := EnqNo;
      ParamByName('line').asInteger := Self.LineNo;
      Open;
      SupplierCount := RecordCount;
      first;
      for x := 0 to (SupplierCount - 1) do
      begin
        aSupplier := TSupplier.Create(true);
        aSupplier.SupplierNo := FieldByName('supplier').asInteger;
        aSupplier.Load;
        aSupplier.Branch.BranchNo := FieldByName('Branch_No').asInteger;
        aSupplier.Branch.Load(aSupplier.SupplierNo);
        aSupplier.SupplierResponse.Load(aSupplier.SupplierNo, aSupplier.Branch.BranchNo, EnqNo, LineNo);
        Self.FQuotingSuppliers.Add(aSupplier);
        Next;
      end;
    end;
end;

procedure TEnquiryLine.NewPart;
var
  aPart: TPart;
begin
  aPart := Tpart.Create;
  FParts.Add(aPart);
end;

procedure TEnquiryLine.NewPriceRow;
var
  qtyInx: integer;
begin
  SetLength(Self.PriceGrid, (Self.NoOfQuantities), Self.NoOfQuotingSuppliers);
  for qtyInx := 0 to (Self.NoOfQuantities - 1) do
  begin
    Self.PriceGrid[qtyInx, (Self.NoOfQuotingSuppliers - 1)].PriceUnitDesc := 'per 1000';
    Self.PriceGrid[qtyInx, (Self.NoOfQuotingSuppliers - 1)].PriceUnit :=
      PBEnqDM.GetPriceUnitNo('per 1000');
    Self.PriceGrid[qtyInx, (Self.NoOfQuotingSuppliers - 1)].PriceUnitFactor := 1000;
  end;
end;

function TEnquiryLine.NoOfActualQuantities: integer;
var
  qtyInx: integer;
  quantities: integer;
begin
  quantities := 0;
  for qtyInx := 0 to (Self.NoOfQuantities - 1) do
  begin
    if not Self.Quantities[qtyInx].Deleted then
      quantities := quantities + 1;
  end;
  Result := quantities;
end;

function TEnquiryLine.NoOfNotes: integer;
begin
  Result := FAdditionalDetails.Count;
end;

function TEnquiryLine.NoOfQuantities: integer;
begin
  Result := FQuantities.Count;
end;

function TEnquiryLine.NoOfQuotingSuppliers: integer;
begin
  Result := FQuotingSuppliers.Count;
end;

procedure TEnquiryLine.RemovePart(index: integer);
begin
  Self.FParts.Delete(index);
  Self.modified := true;
end;

procedure TEnquiryLine.Save(EnqNo: integer);
begin
  //save narrative first, because if narrative is new need to get a narrative no
  //and if deleted need to remove narrative reference number.
  Self.Narrative.SavetoDB;
  if Self.NewLine then
  begin
    //new line so use insert query
    //have to do narrative first to make sure narrative number is
    //available for the enquiry line record
    Self.Insert(EnqNo);
    Self.SaveParts(EnqNo);
    Self.InsertCapabilities(EnqNo);
  end
  else if Self.Modified then
  begin
    //existing line that has been modified, so use update query
    Self.Update(EnqNo);
    Self.DeleteParts(EnqNo);
    Self.SaveParts(EnqNo);
    Self.DeleteCapabilities(EnqNo);
    Self.InsertCapabilities(EnqNo);
  end;

  Self.SaveAnswers(EnqNo);
  Self.SaveQuantities(EnqNo);
  Self.SaveQuoteSuppliers(EnqNo);
  Self.SavePriceGrid(EnqNo);
  Self.SaveAdditionalDetails(EnqNo);
  Self.ClearDeletedQuoteSuppliers;
  Self.ClearDeletedQuantities;
  Self.LoadPriceGrid(EnqNo);
end;

procedure TEnquiryLine.SaveAdditionalDetails(EnqNo: integer);
var
  x: integer;
begin
  for x := 0 to (Self.NoOfNotes - 1) do
  begin
    Self.AdditionalDetails[x].Save(EnqNo, LineNo);
  end;
end;

procedure TEnquiryLine.SaveAnswers(EnqNo: Integer);
var
  x: integer;
begin
  for x := 0 to (Self.ProductType.NoOfQuestions - 1) do
  begin
    Self.ProductType.Questions[x].SaveAnswer(EnqNo, Self.LineNo, Self.ProductType.TypeNo);
  end;
end;

procedure TEnquiryLine.SaveParts(EnqNo: integer);
var
  x: integer;
begin
  for x := 0 to (Self.GetNoOfParts - 1) do
  begin
    Self.Parts[x].Save(EnqNo, Self.LineNo);
  end;
end;

procedure TEnquiryLine.SavePriceGrid(EnqNo: integer);
var
  QtyInx, SuppInx: integer;
begin
  for QtyInx := 0 to (Self.NoOfQuantities - 1) do
  begin
    for SuppInx := 0 to (Self.NoOfQuotingSuppliers - 1) do
    begin
      if Self.Quantities[QtyInx].Deleted or Self.QuotingSuppliers[SuppInx].SupplierResponse.Deleted then
        Self.DeleteSupplierQuote(EnqNo, QtyInx, SuppInx)
      else if Self.Quantities[QtyInx].NewLineQuantity  or Self.QuotingSuppliers[SuppInx].SupplierResponse.NewResponse then
        Self.InsertSupplierQuote(EnqNo, QtyInx, SuppInx)
      else if Self.Quantities[QtyInx].Modified or Self.QuotingSuppliers[SuppInx].SupplierResponse.Modified then
        Self.UpdateSupplierQuote(EnqNo, QtyInx, SuppInx);
    end;
  end;
end;

procedure TEnquiryLine.SaveQuantities(EnqNo: integer);
var
  x: integer;
begin
  for x := 0 to (Self.NoOfQuantities - 1) do
  begin
    Self.Quantities[x].Save(EnqNo, Self.LineNo);
  end;
end;

procedure TEnquiryLine.SaveQuoteSuppliers(EnqNo: integer);
var
  x: integer;
begin
  for x := 0 to (Self.NoOfQuotingSuppliers - 1) do
  begin
    Self.QuotingSuppliers[x].SupplierResponse.save(
        Self.QuotingSuppliers[x].SupplierNo,
        Self.QuotingSuppliers[x].Branch.BranchNo,
        EnqNo,
        Self.LineNo);
  end;
end;

procedure TEnquiryLine.SetAdditionalDetails(index: integer;
  const Value: TAdditionalDetail);
begin
  FAdditionalDetails[index] := Value;
end;

procedure TEnquiryLine.SetDefaultValues;
begin
  Self.NewLine := true;
  Self.LineNo := 1;
  Self.WidthUnit := 'mm';
  Self.DepthUnit := 'mm';
  Self.EnqInactive := false;
  Self.PrintedQuotation := false;
  Self.EnquiryStatus := 10;
  Self.RunOnQuantity := 0;
  Self.RunOnPrice := 0.00;
  Self.RunOnCost := 0.00;
end;

procedure TEnquiryLine.SetParts(index: integer; const Value: TPart);
begin
  FParts[index] := Value;
end;

procedure TEnquiryLine.SetQuantities(index: integer; const Value: TLineQuantity);
begin
  FQuantities[index] := Value;
end;

procedure TEnquiryLine.SetQuotingSuppliers(index: integer; const Value: TSupplier);
begin
  FQuotingSuppliers[index] := Value;
end;

procedure TEnquiryLine.Update(EnqNo: integer);
begin
  with PBEnqDM.qryUpdEnqLine do
  begin
    ParamByName('Form_description').asString := Self.FormDescription;

    if Self.GetNoOfParts = 0 then
      ParamByName('No_Of_Parts').Clear
    else
      ParamByName('No_Of_Parts').asInteger := Self.GetNoOfParts;
      
    if Self.NCROTCMix = '' then
      ParamByName('NCR_OTC_Mix').asString := 'X' // x = n/a
    else
      ParamByName('NCR_OTC_Mix').asString := Self.NCROTCMix;

    ParamByName('Depth').asFloat := Self.Depth;
    ParamByName('Depth_Unit').asString := Self.DepthUnit;
    ParamByName('Width').asFloat := Self.Width;
    ParamByName('Width_Unit').asString := Self.WidthUnit;
    ParamByName('ArtWork_Instructions').asString := Self.ArtworkInstructions;
    ParamByName('forms_per_box').asString := Self.FormsPerBox;
    ParamByName('No_Of_Plates').asInteger := Self.NoOfPlates;
    ParamByName('Ordered_Quantity').asInteger := self.OrderedQuantity;
    ParamByName('Ordered_Price').asCurrency := self.OrderedPrice;
    if self.PriceUnit = 0 then
      ParamByName('Price_Unit').Clear
    else
      ParamByName('Price_Unit').asInteger := self.PriceUnit;

    if self.ProofStatus = '' then
      ParamByName('Proof_Status').Clear
    else
      ParamByName('Proof_Status').asString := self.ProofStatus;

    if Self.ProofDate = 0 then
      ParamByName('Proof_Date').Clear
    else
      ParamByName('Proof_Date').asDateTime := Self.ProofDate;

    ParamByName('Product_Type').asInteger := self.ProductType.TypeNo;
    ParamByName('Enquiry_Status').asInteger := self.EnquiryStatus;
    ParamByName('Req_Response_date').asDateTime := Now();
    if Self.SelectedSupplier.SupplierNo = 0 then
      ParamByName('SelectedSupplier').Clear
    else
      ParamByName('SelectedSupplier').asInteger := Self.SelectedSupplier.SupplierNo;

    ParamByName('SelectedBranch_No').asInteger := Self.SelectedSupplier.Branch.BranchNo;

    if Self.PrintedQuotation then
      ParamByName('Printed_Quotation').asString := 'Y'
    else
      ParamByName('Printed_Quotation').asString := 'N';

    if Self.EnqInactive then
      ParamByName('Enq_Inactive').asString := 'Y'
    else
      ParamByName('Enq_Inactive').asString := 'N';

    if Self.EnqInactiveDate = 0 then
      ParamByName('Enq_Inactive_Date').Clear
    else
      ParamByName('Enq_Inactive_Date').asDateTime := Self.EnqInactiveDate;

    if Self.EnqInactiveReason = 0 then
      ParamByName('Enq_Inactive_Reason').Clear
    else
      ParamByName('Enq_Inactive_Reason').asInteger := Self.EnqInactiveReason;

    if Self.FirmOrder then
      ParamByName('Firm_Order').asString := 'Y'
    else
      ParamByName('Firm_Order').asString := 'N';

    ParamByName('Narrative').asInteger := Self.Narrative.dbKey;
    if Self.FormReference.RefNo = 0 then
      ParamByName('Form_Reference').Clear
    else
      ParamByName('Form_Reference').asInteger := Self.FormReference.RefNo;

    ParamByName('Number_Instructions').asString := Self.NumberInstructions;
    ParamByName('Run_On_Quantity').asFloat := Self.RunOnQuantity;
    ParamByName('Run_On_Price').asCurrency := Self.RunOnPrice;
    ParamByName('Run_On_Cost').asCurrency := Self.RunOnCost;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := Self.LineNo;

    ExecSQL;
  end;
end;

procedure TPart.Update(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qryUpdEnqLinePart do
  begin
    ParamByName('part_no').asInteger := Self.PartNo;
    ParamByName('heading').asString := Self.Heading;
    ParamByName('same_as_part').asInteger := Self.SameAsPart;
    ParamByName('paper_brand').asString := Self.PaperBrand;
    ParamByName('paper_material').asString := Self.PaperMaterial;
    ParamByName('paper_weight').asString := Self.PaperWeight;
    ParamByName('paper_colour').asString := Self.PaperColour;
    ParamByName('face_inks').asString := Self.FaceInks;
    ParamByName('reverse_inks').asString := Self.ReverseInks;
    ParamByName('left_margin_type').asString := Self.LeftMarginType;
    ParamByName('left_margin_width').asString := Self.LeftMarginWidth;
    ParamByName('right_margin_type').asString := Self.RightMarginType;
    ParamByName('right_margin_width').asString := Self.RightMarginWidth;
    ParamByName('no_of_plate_changes').asInteger := Self.NoOfPlateChanges;
    ParamByName('part_description').asString := Self.Description;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := lineNo;

    ExecSQL;
  end;
end;

procedure TEnquiryLine.UpdateSupplierQuote(EnqNo, QtyInx, SuppInx: integer);
begin
  with PBEnqDM.qryUpdSuppEnqQty do
  begin
    ParamByName('Supplier_Price').asCurrency := Self.PriceGrid[QtyInx, SuppInx].SupplierPrice;
    if Self.PriceGrid[QtyInx, SuppInx].PriceUnit = 0 then
      ParamByName('Price_Unit').Clear
    else
      ParamByName('Price_Unit').asInteger := Self.PriceGrid[QtyInx, SuppInx].PriceUnit;
      
    ParamByName('Response_Quantity').asFloat := Self.PriceGrid[QtyInx, SuppInx].ResponseQuantity;
    if Self.PriceGrid[QtyInx, SuppInx].PriceSelected then
      ParamByName('Price_Selected').asString := 'Y'
    else
      ParamByName('Price_Selected').asString := 'N';
    ParamByName('Marked_Up_Price').asCurrency := Self.PriceGrid[QtyInx, SuppInx].MarkedUpPrice;

    ParamByName('Supplier').asInteger := Self.QuotingSuppliers[SuppInx].SupplierNo;
    ParamByName('Branch_No').asInteger := Self.QuotingSuppliers[SuppInx].Branch.BranchNo;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := Self.LineNo;
    ParamByName('Quantity').asFloat := Self.Quantities[QtyInx].Quantity;

    ExecSQL;
  end;
end;

{ TProductType }

constructor TProductType.Create;
begin
  inherited;
  FQuestions := TObjectList.Create;
  FCapabilities := TObjectList.Create;
end;

destructor TProductType.Destroy;
begin
  FCapabilities.Free;
  FQuestions.Free;
  inherited;
end;

function TProductType.GetCapabilities(index: integer): TCapability;
begin
  Result := FCapabilities[index] as TCapability;
end;

function TProductType.GetCapabilityCount: integer;
begin
  Result := Self.FCapabilities.Count;
end;

function TProductType.GetQuestions(index: integer): TQuestion;
begin
  Result := FQuestions[index] as TQuestion;
end;

procedure TProductType.Load(EnqNo, LineNo: integer);
var
  aQuestion: TQuestion;
  aCapability: TCapability;
begin
  //get product type description
  with PBEnqDM.qrySelProdType do
  begin
    close;
    ParamByName('Product_type').asInteger := Self.TypeNo;
    Open;
    Self.Description := FieldByName('Description').asString;

    Close;
  end;

  //clear any existing questions
  Self.FQuestions.Clear;
  //get product type questions
  with PBEnqDM.qrySelNoOfProdTypeQs do
  begin
    Close;
    ParamByName('product_type').asInteger := self.TypeNo;
    Open;
    while not EOF do
    begin
      aQuestion := TQuestion.Create;
      aQuestion.QuestionNo := FieldByName('Question').asInteger;
      aQuestion.Load(EnqNo, LineNo, Self.TypeNo);
      Self.FQuestions.Add(aQuestion);
      next;
    end;
    Close;
  end;

  //clear any existing capabilies
  Self.FCapabilities.Clear;
  //get availalbleCapabilites
  with PBenqDM.qrySelNoOfCapbltys do
  begin
    Close;
    ParamByName('Product_Type').asInteger := Self.TypeNo;
    Open;
    while not EOF do
    begin
      aCapability := TCapability.Create;
      aCapability.CapabilityNo := FieldByName('Capability').asInteger;
      aCapability.Load(EnqNo, LineNo, Self.TypeNo);
      Self.FCapabilities.Add(aCapability);
      next;
    end;
  end;
end;

function TProductType.NoOfQuestions: integer;
begin
  Result := FQuestions.Count;
end;

procedure TProductType.SetCapabilities(index: integer;
  const Value: TCapability);
begin
  FCapabilities[index] := Value;
end;

procedure TProductType.SetQuestions(index: integer; const Value: TQuestion);
begin
  FQuestions[index] := Value;
end;

{ TFormReference }

procedure TFormReference.Clear;
begin
  RefNo := 0;
  ID := '';
  Customer := 0;
  Branch_No :=0;
  Description := '';
  StockedItem := false;
  ReOrderLevel := 0;
end;

procedure TFormReference.Load;
begin
  with PBEnqDM.qrySelFormRef do
  begin
    Close;
    ParamByName('form_Reference').asInteger := Self.RefNo;
    Open;
    Self.ID := FieldByName('Form_reference_ID').asString;
    Self.Customer := FieldByName('Customer').asInteger;
    Self.Branch_No := FieldByName('Branch_No').asInteger;
    Self.Description := FieldByName('Form_Reference_Descr').asString;
    if FieldByName('Stocked_Item').asString = 'Y' then
      Self.StockedItem := true
    else
      Self.StockedItem := false;
    self.ReOrderLevel := FieldByName('Reorder_Level').asInteger;

    Close;
  end;
end;

{ TPart }

procedure TPart.Delete(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qryDelEnqLinePart do
  begin
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('part_no').asInteger := Self.PartNo;

    ExecSQL;
  end;
end;

procedure TPart.Insert(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qryInsEnqLinePart do
  begin
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := lineNo;
    ParamByName('part_no').asInteger := Self.PartNo;
    ParamByName('heading').asString := Self.Heading;
    ParamByName('same_as_part').asInteger := Self.SameAsPart;
    ParamByName('paper_brand').asString := Self.PaperBrand;
    ParamByName('paper_material').asString := Self.PaperMaterial;
    ParamByName('paper_weight').asString := Self.PaperWeight;
    ParamByName('paper_colour').asString := Self.PaperColour;
    ParamByName('face_inks').asString := Self.FaceInks;
    ParamByName('reverse_inks').asString := Self.ReverseInks;
    ParamByName('left_margin_type').asString := Self.LeftMarginType;
    ParamByName('left_margin_width').asString := Self.LeftMarginWidth;
    ParamByName('right_margin_type').asString := Self.RightMarginType;
    ParamByName('right_margin_width').asString := Self.RightMarginWidth;
    ParamByName('no_of_plate_changes').asInteger := Self.NoOfPlateChanges;
    ParamByName('part_description').asString := Self.Description;

    ExecSQL;
  end;
end;

procedure TPart.Load(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qrySelPart do
  begin
    Close;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('part_no').asInteger := Self.PartNo;
    Open;
    Self.Heading := FieldByName('Heading').asString;
    Self.SameAsPart := FieldByName('Same_as_Part').asInteger;
    Self.PaperBrand := FieldByName('Paper_Brand').asString;
    Self.PaperMaterial := FieldByName('Paper_Material').asString;
    Self.PaperWeight := FieldByName('Paper_Weight').asString;
    Self.PaperColour := FieldByName('Paper_Colour').asString;
    Self.FaceInks := FieldByName('Face_Inks').asString;
    Self.ReverseInks := FieldByName('Reverse_Inks').asString;
    Self.LeftMarginType := FieldByName('Left_Margin_Type').asString;
    Self.LeftMarginWidth := FieldByName('Left_Margin_Width').asString;
    Self.RightMarginType := FieldByName('Right_Margin_Type').asString;
    Self.RightMarginWidth := FieldByName('Right_Margin_Width').asString;
    Self.NoOfPlateChanges := FieldByName('No_Of_Plate_Changes').asInteger;
    Self.Description := FieldByName('Part_description').asString;

    Close;
  end;
end;

procedure TPart.Save(EnqNo, LineNo: integer);
begin
  //All parts records are deleted prior to saving incase any parts
  //have been deleted, so whenever an enquiry is saved the parts details are
  //deleted and reinserted as fresh records.
  Self.Insert(EnqNo, LineNo);
end;

function TPBEnqDM.GetDefCustRep(CustNo, BrnchNo: integer): integer;
begin
  with qrySelDefCustRep do
  begin
    Close;
    ParamByName('Customer').asInteger := CustNo;
    ParamByName('Branch_no').asInteger := BrnchNo;
    Open;
    Result := FieldByName('Mainrep').asInteger;

    Close;
  end;
end;

{ TQuestion }

procedure TQuestion.CheckForAnswer(EnqNo, LineNo, ProdTypeNo: integer);
begin
  with PBEnqDM.qrySelEnqAnswer do
  begin
    Close;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('product_type').asInteger := ProdTypeNo;
    ParamByName('question').asInteger := Self.QuestionNo;
    Open;
    if RecordCount = 1 then
    begin
      Self.Answer := FieldByName('Product_Answer').asString;
    end
    else
    begin
      Self.NewAnswer := True;
    end;
    Close;
  end;
end;

constructor TQuestion.Create;
begin
  inherited;
  Answers := TStringList.Create;
end;

procedure TQuestion.DeleteAnswer(EnqNo, LineNo, ProdTypeNo: Integer);
begin
  with PBEnqDM.qryDelEnqAnswer do
  begin
    begin
      ParamByname('Product_Type').asinteger := ProdTypeNo;
      ParamByName('Question').asInteger := Self.QuestionNo;
      ParamByName('Enquiry').asInteger := EnqNo;
      ParamByName('Line').asInteger := LineNo;
      ExecSQL;
    end;
  end;
end;

destructor TQuestion.Destroy;
begin
  Answers.Free;
  inherited;
end;

procedure TQuestion.GetPossibleAnswers(ProdTypeNo: integer);
begin
  with PBEnqDM.qrySelProdTypeQList do
  begin
    Close;
    ParamByName('product_type').asInteger := ProdTypeNo;
    ParamByName('question').asInteger := Self.QuestionNo;
    Open;
    while not EOF do
    begin
      Self.Answers.Add(FieldByName('Question_List_Descr').asString);
      next;
    end;

    Close;
  end;
end;

procedure TQuestion.InsertAnswer(EnqNo, LineNo, ProdTypeNo: Integer);
begin
  if Self.Answer <> '' then
  begin
    with PBEnqDM.qryInsEnqAnswer do
    begin
      ParamByname('Product_Type').asinteger := ProdTypeNo;
      ParamByName('Question').asInteger := Self.QuestionNo;
      ParamByName('Enquiry').asInteger := EnqNo;
      ParamByName('Line').asInteger := LineNo;
      ParamByName('Product_Answer').asString := Self.Answer;
      ExecSQL;
    end;
  end;
end;

procedure TQuestion.Load(EnqNo, LineNo, ProdTypeNo: integer);
begin
  with PBEnqDM.qrySelProdTypeQs do
  begin
    Close;
    ParamByName('product_type').asInteger := ProdTypeNo;
    ParamByName('Question').asInteger := Self.QuestionNo;
    Open;
    Self.Text := FieldByName('Question_Text').asString;
    Self.Category := FieldByName('Question_Category').asInteger;
    Self.CategoryDesc := FieldByName('Question_Category_Descr').asString;
    Self.PromptType := FieldByName('Prompt_Type').asString;
    if Self.PromptType = 'cbo' then
    begin
      Self.Answers.Clear;
      Self.GetPossibleAnswers(ProdTypeNo);
    end;

    Self.CheckForAnswer(EnqNo, LineNo, ProdTypeNo);

    Close;
  end;
end;

procedure TQuestion.SaveAnswer(EnqNo, LineNo, ProdTypeNo: Integer);
begin
  if Self.Answer = '' then
    Self.DeleteAnswer(EnqNo, LineNo, ProdTypeNo)
  else if Self.NewAnswer then
    Self.InsertAnswer(EnqNo, LineNo, ProdTypeNo)
  else if Self.Modified then
    Self.UpdateAnswer(EnqNo, LineNo, ProdTypeNo);
end;

procedure TQuestion.UpdateAnswer(EnqNo, LineNo, ProdTypeNo: Integer);
begin
  begin
    with PBEnqDM.qryUpdEnqAnswer do
    begin
      ParamByName('Product_Answer').asString := Self.Answer;
      ParamByname('Product_Type').asinteger := ProdTypeNo;
      ParamByName('Question').asInteger := Self.QuestionNo;
      ParamByName('Enquiry').asInteger := EnqNo;
      ParamByName('Line').asInteger := LineNo;
      ExecSQL;
    end;
  end;
end;

{ TLineQuantity }

constructor TLineQuantity.Create;
begin
  inherited;
  Supplier := TSupplier.Create;
  PriceUnit := TPriceUnit.Create;
end;

procedure TLineQuantity.Delete(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qryDelLineQty do
  begin
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := LineNo;
    ParamByName('Quantity').asFloat := Self.Quantity;
    ExecSQL;
  end;
end;

destructor TLineQuantity.Destroy;
begin
  PriceUnit.Free;
  Supplier.Free;
  inherited;
end;

procedure TLineQuantity.Insert(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qryInsLineQty do
  begin
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('quantity').asFloat := Self.Quantity;

    if Self.SupplierPrice = 0.00 then
      ParamByName('supplier_price').Clear
    else
      ParamByName('supplier_price').asCurrency := Self.SupplierPrice;

    if Self.QuotePrice = 0.00 then
      ParamByName('quotation_price').Clear
    else
      ParamByName('quotation_price').asCurrency := Self.QuotePrice;

    if Self.Supplier.SupplierNo = 0 then
      ParamByName('Supplier').Clear
    else
      ParamByName('Supplier').asInteger := Self.Supplier.SupplierNo;

    ParamByName('Branch_no').asInteger := Self.Supplier.Branch.BranchNo;

    if Self.PriceUnit.PriceUnit = 0 then
      ParamByName('price_unit').Clear
    else
      ParamByName('price_unit').asInteger := Self.PriceUnit.PriceUnit;

    ExecSQL;
  end;
end;

procedure TLineQuantity.Load(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qrySelEnqLineQty do
  begin
    Close;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('quantity').asFloat := Self.Quantity;
    Open;
    Self.SupplierPrice := FieldByName('Supplier_Price').asCurrency;
    Self.QuotePrice := FieldByName('Quotation_Price').asCurrency;

    Self.Supplier.SupplierNo := FieldByName('Supplier').asInteger;
    Self.Supplier.Load;

    Self.Supplier.Branch.BranchNo := FieldByName('Branch_No').asInteger;
    Self.Supplier.Branch.Load(Self.Supplier.SupplierNo);

    Self.PriceUnit.PriceUnit := FieldByName('Price_Unit').asInteger;
    Self.PriceUnit.Load;

    Close;
  end;
end;

procedure TLineQuantity.Save(EnqNo, LineNo: integer);
begin
  if Self.Deleted then
    Self.Delete(EnqNo, LineNo)
  else if Self.NewLineQuantity then
    Self.Insert(EnqNo, LineNo)
  else if Self.Modified then
    Self.Update(EnqNo, LineNo);
end;

procedure TLineQuantity.Update(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qryUpdLineQty do
  begin
    if Self.SupplierPrice = 0.00 then
      ParamByName('supplier_price').Clear
    else
      ParamByName('supplier_price').asCurrency := Self.SupplierPrice;

    if Self.QuotePrice = 0.00 then
      ParamByName('quotation_price').Clear
    else
      ParamByName('quotation_price').asCurrency := Self.QuotePrice;

    if Self.Supplier.SupplierNo = 0 then
      ParamByName('Supplier').Clear
    else
      ParamByName('Supplier').asInteger := Self.Supplier.SupplierNo;

    ParamByName('Branch_no').asInteger := Self.Supplier.Branch.BranchNo;

    if Self.PriceUnit.PriceUnit = 0 then
      ParamByName('price_unit').Clear
    else
      ParamByName('price_unit').asInteger := Self.PriceUnit.PriceUnit;

    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('quantity').asFloat := Self.Quantity;
    ExecSQL;
  end;
end;

{ TPriceUnit }

procedure TPriceUnit.Load;
begin
  with PBEnqDM.qrySelPriceUnit do
  begin
    Close;
    ParamByName('price_unit').asinteger := Self.PriceUnit;
    Open;
    Self.Description := FieldByName('Description').asString;
    Self.UnitFactor := FieldByName('Price_unit_factor').asFloat;
    Self.ShowOnReport := FieldByName('Show_On_Report').asString;

    Close;
  end;
end;

{ TSupplierBranch }

procedure TSupplierBranch.Load(SupplierNo: integer);
begin
  with PBEnqDM.qrySelSupplrBrnch do
  begin
    Close;
    ParamByName('Supplier').asInteger := SupplierNo;
    ParamByName('branch_no').asinteger := Self.BranchNo;
    Open;
    Self.Name := FieldByName('Name').asString;

    Close;
  end;
end;

{ TSupplier }

constructor TSupplier.Create;
begin
  inherited Create;
  Branch := TSupplierBranch.Create;
end;

constructor TSupplier.Create(quoting: boolean);
begin
  inherited Create;
  Branch := TSupplierBranch.Create;
  //if quoting is true then this supplier object is part of the quoting suppliers
  //list and therefore an instance of TSupplierResponse needs to be created to hold the
  //quote response date and run on values.
  if quoting then
    SupplierResponse := TSupplierResponse.Create;
end;

destructor TSupplier.Destroy;
begin
  if Assigned(SupplierResponse) then
    SupplierResponse.Free;
  Branch.Free;
  inherited;
end;

procedure TSupplier.Load;
begin
  with PBEnqDM.qrySelSupplier do
  begin
    Close;
    ParamByName('Supplier').asInteger := self.SupplierNo;
    Open;
    Self.Name := FieldByName('Name').asString;

    Close;
  end;
end;

function TPBEnqDM.GetNextNarrativeNo: integer;
begin
  with PBEnqDM.qrySelMaxNarrative do
  begin
    Close;
    Open;
    Result := fieldByName('MaxNarrative').asInteger + 1;
    Close;
  end;
end;

function TPBEnqDM.GetNextEnqLineNo(EnqNo: integer): integer;
begin
  with Self.qrySelNoOfEnqLines do
  begin
    Close;
    ParamByName('enquiry').asInteger := EnqNo;
    Open;
    //2 gets added because line no
    Result := FieldByName('MaxLine').asInteger + 1;
    Close;
  end;
end;

{ TSupplierResponse }

procedure TSupplierResponse.AddExtraCharge(anExtraCharge: TExtraCharge);
begin
  FExtraCharges.Add(anExtraCharge);
end;

function TSupplierResponse.CalcExtraChargeCosts: double;
var
  chrgInx: integer;
begin
  Result := 0.00;
  for chrgInx := 0 to (Self.NoOfExtraCharges - 1) do
  begin
    Result := Result + Self.ExtraCharges[chrgInx].Cost;
  end;
end;

procedure TSupplierResponse.ClearExtraCharges;
begin
  FExtraCharges.Clear;
end;

constructor TSupplierResponse.Create;
begin
  inherited;
  FExtraCharges := TObjectList.Create;
end;

procedure TSupplierResponse.delete(SuppNo, BrnchNo, EnqNo,
  LineNo: integer);
begin
  with PBEnqDM.qryDelSuppEnqQtys do
  begin
    ParamByName('Supplier').asInteger := SuppNo;
    ParamByName('Branch_No').asInteger := BrnchNo;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := LineNo;
    ExecSQL;
  end;

  with PBEnqDM.qryDelSuppRespns do
  begin
    ParamByName('Supplier').asInteger := SuppNo;
    ParamByName('Branch_No').asInteger := BrnchNo;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := LineNo;
    ExecSQL;
  end;
end;

procedure TSupplierResponse.deleteExtraCharges(SuppNo, BrnchNo, EnqNo,
  LineNo: integer);
begin
  with PBEnqDM.qryDelSuppEnqAddChrgs do
  begin
    ParamByName('supplier').asInteger := SuppNo;
    ParamByName('branch_no').asInteger := BrnchNo;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ExecSQL;
  end;
end;

destructor TSupplierResponse.Destroy;
begin
  FExtraCharges.Free;
  inherited;
end;

function TSupplierResponse.GetExtraCharges(index: integer): TExtraCharge;
begin
  Result := FExtraCharges[index] as TExtraCharge;
end;

procedure TSupplierResponse.insert(SuppNo, BrnchNo, EnqNo,
  LineNo: integer);
begin
  with PBEnqDM.qryInsSuppRespns do
  begin
    ParamByName('Supplier').asInteger := SuppNo;
    ParamByName('Branch_No').asInteger := BrnchNo;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := LineNo;
    if Self.ActResponseDate = 0 then
      ParamByName('Act_Response_Date').Clear
    else
      ParamByName('Act_Response_Date').asDateTime := Self.ActResponseDate;

    if Self.DeliveryComment = '' then
      ParamByName('Delivery_Comment').Clear
    else
      ParamByName('Delivery_Comment').asString := Self.DeliveryComment;

    if Self.SupplierReference = '' then
      ParamByName('Supplier_Reference').Clear
    else
      ParamByName('Supplier_Reference').asString := Self.SupplierReference;

    if Self.PrintedEnquiry then
      ParamByName('Printed_Enquiry').asString := 'Y'
    else
      ParamByName('Printed_Enquiry').asString := 'N';

    if Self.IsUpdated then
      ParamByName('Is_Updated').asString := 'Y'
    else
      ParamByName('Is_Updated').asString := 'N';

    if Self.ContactNo = 0 then
      ParamByName('Contact_No').Clear
    else
      ParamByName('Contact_No').asInteger := Self.ContactNo;

    if Self.RunOnQuantity = -1 then
      ParamByName('Run_On_Quantity').Clear
    else
      ParamByName('Run_On_Quantity').asFloat := Self.RunOnQuantity;

    if Self.RunOnPrice = -1 then
      ParamByName('Run_On_Price').Clear
    else
      ParamByName('Run_On_Price').asCurrency := Self.RunOnPrice;

    ExecSQL;
  end;
end;

procedure TSupplierResponse.load(SuppNo, BrnchNo, EnqNo, LineNo: integer);
var
  anExtraCharge: TExtraCharge;
begin
  with PBEnqDM.qrySelSuppRespns do
  begin
    Close;
    ParamByName('Supplier').asInteger := SuppNo;
    ParamByName('Branch_No').asInteger := BrnchNo;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := LineNo;
    Open;
    Self.ActResponseDate := FieldByName('Act_Response_Date').asDateTime;
    Self.DeliveryComment := FieldByName('Delivery_Comment').asString;
    Self.SupplierReference := FieldByName('Supplier_Reference').asString;

    if FieldByName('Printed_Enquiry').asString = 'Y' then
      Self.PrintedEnquiry := true
    else
      Self.PrintedEnquiry := false;

    if FieldByName('Is_Updated').asString = 'Y' then
      Self.IsUpdated := true
    else
      Self.IsUpdated := false;

    Self.ContactNo := FieldByName('Contact_No').asInteger;

    if FieldByName('Run_On_Quantity').IsNull then
      Self.RunOnQuantity := -1
    else
      Self.RunOnQuantity := FieldByName('Run_On_Quantity').asFloat;

    if FieldByName('Run_On_Price').IsNull then
      Self.RunOnPrice := -1
    else
      Self.RunOnPrice := FieldByName('Run_On_Price').asCurrency;

    //load extra charges
    with PBEnqDM.qrySelSuppEnqAddChrgs do
    begin
      Close;
      ParamByName('supplier').asInteger := SuppNo;
      ParamByName('branch_no').asInteger := brnchNo;
      ParamByName('enquiry').asInteger := EnqNo;
      ParamByName('line').asInteger := LineNo;
      open;
      first;
      while not EOF do
      begin
        anExtraCharge := TExtraCharge.Create;
        anExtraCharge.Details := FieldByName('details').asString;
        anExtraCharge.Cost := FieldByName('amount').asCurrency;
        anExtraCharge.Price := FieldByName('quotation_price').asCurrency;
        Self.AddExtraCharge(anExtraCharge);
        next;
      end;
    end;
  end;
end;

function TSupplierResponse.NoOfExtraCharges: integer;
begin
  Result := FExtraCharges.Count;
end;

procedure TSupplierResponse.save(SuppNo, BrnchNo, EnqNo, LineNo: integer);
begin
  if Self.Deleted then
  begin
    Self.delete(SuppNo, BrnchNo, EnqNo, LineNo);
    Self.deleteExtraCharges(SuppNo, BrnchNo, EnqNo, LineNo);
  end
  else if Self.NewResponse then
  begin
    Self.Insert(SuppNo, BrnchNo, EnqNo, LineNo);
    Self.SaveExtraCharges(SuppNo, BrnchNo, EnqNo, LineNo);
  end
  else if Self.Modified then
  begin
    Self.Update(SuppNo, BrnchNo, EnqNo, LineNo);
    Self.deleteExtraCharges(SuppNo, BrnchNo, EnqNo, LineNo);
    Self.SaveExtraCharges(SuppNo, BrnchNo, EnqNo, LineNo);
  end;
end;

procedure TSupplierResponse.SaveExtraCharges(SuppNo, BrnchNo, EnqNo,
  LineNo: integer);
var
  x: integer;
begin
  for x := 0 to (Self.NoOfExtraCharges - 1) do
  begin
    Self.ExtraCharges[x].Insert(SuppNo, BrnchNo, EnqNo, LineNo, (x+1));
  end;
end;

procedure TSupplierResponse.SetExtraCharges(index: integer;
  const Value: TExtraCharge);
begin
  FExtraCharges[index] := value;
end;

procedure TSupplierResponse.update(SuppNo, BrnchNo, EnqNo,
  LineNo: integer);
begin
  with PBEnqDM.qryUpdSuppRespns do
  begin
    ParamByName('Supplier').asInteger := SuppNo;
    ParamByName('Branch_No').asInteger := BrnchNo;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := LineNo;
    if Self.ActResponseDate = 0 then
      ParamByName('Act_Response_Date').Clear
    else
      ParamByName('Act_Response_Date').asDateTime := Self.ActResponseDate;

    if Self.DeliveryComment = '' then
      ParamByName('Delivery_Comment').Clear
    else
      ParamByName('Delivery_Comment').asString := Self.DeliveryComment;

    if Self.SupplierReference = '' then
      ParamByName('Supplier_Reference').Clear
    else
      ParamByName('Supplier_Reference').asString := Self.SupplierReference;

    if Self.PrintedEnquiry then
      ParamByName('Printed_Enquiry').asString := 'Y'
    else
      ParamByName('Printed_Enquiry').asString := 'N';

    if Self.IsUpdated then
      ParamByName('Is_Updated').asString := 'Y'
    else
      ParamByName('Is_Updated').asString := 'N';

    if Self.ContactNo = 0 then
      ParamByName('Contact_No').Clear
    else
      ParamByName('Contact_No').asInteger := Self.ContactNo;

    if Self.RunOnQuantity = -1 then
      ParamByName('Run_On_Quantity').Clear
    else
      ParamByName('Run_On_Quantity').asFloat := Self.RunOnQuantity;

    if Self.RunOnPrice = -1 then
      ParamByName('Run_On_Price').Clear
    else
      ParamByName('Run_On_Price').asCurrency := Self.RunOnPrice;

    ExecSQL;
  end;
end;

function TPBEnqDM.GetPriceUnitDesc(PriceUnit: integer): string;
begin

end;

function TPBEnqDM.GetPriceUnitNo(Description: string): integer;
begin
  with Self.qrySelPriceUnitNo do
  begin
    Close;
    ParamByName('description').asString := description;
    Open;
    Result := FieldByName('Price_Unit').asInteger;
  end;
end;

{ TCapability }

procedure TCapability.Insert(EnqNo, LineNo, ProdTypeNo: integer);
begin
  with PBenqDM.qryInsEnqLineCpblty do
  begin
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('product_type').asInteger := ProdTypeNo;
    ParamByName('capability').asInteger := Self.CapabilityNo;
    ExecSQL;
  end;
end;

procedure TCapability.Load(EnqNo, LineNo, ProdTypeNo: integer);
begin
  with PBEnqDM.qrySelCapability do
  begin
    Close;
    ParamByName('Product_Type').asInteger := ProdTypeNo;
    ParamByName('Capability').asInteger := self.CapabilityNo;
    Open;
    Self.Description := FieldByName('Description').asString;
    Close;
  end;

  with PBEnqDM.qrySelEnqLineCpbltys do
  begin
    Close;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('product_type').asInteger := ProdTypeNo;
    ParamByName('capability').asInteger := self.CapabilityNo;
    Open;
    if RecordCount > 0 then
      self.Selected := true
    else
      self.Selected := false;
    Close;
  end;
end;

{ TAdditionalDetail }

procedure TAdditionalDetail.Delete(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qryDelEnqAddNote do
  begin
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := LineNo;
    ParamByName('Additional_Details').asInteger := Self.AdditionlDetailNo;
    ExecSQL;
  end;
end;

procedure TAdditionalDetail.Insert(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qryInsEnqAddNote do
  begin
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := LineNo;
    ParamByName('Additional_Details').asInteger := Self.AdditionlDetailNo;
    ParamByName('FAO_Flag').asString := Self.Audience;
    ParamByName('Details').asString := Self.Details;
    ExecSQL;
  end;
end;

procedure TAdditionalDetail.Load(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qrySelEnqAddNote do
  begin
    Close;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := LineNo;
    ParamByName('Additional_Details').asInteger := Self.AdditionlDetailNo;
    Open;
    Self.Audience := FieldByName('FAO_Flag').asString;
    Self.Details := FieldByName('Details').asString;
    Close;
  end;
end;

procedure TAdditionalDetail.Save(EnqNo, LineNo: integer);
begin
  if Self.Deleted then
    Self.Delete(EnqNo, LineNo)
  else if Self.NewDetail then
    Self.Insert(EnqNo, LineNo)
  else if Self.Modified then
    Self.Update(EnqNo, LineNo);
end;

procedure TAdditionalDetail.Update(EnqNo, LineNo: integer);
begin
  with PBEnqDM.qryUpdEnqAddNote do
  begin
    ParamByName('FAO_Flag').asString := Self.Audience;
    ParamByName('Details').asString := Self.Details;
    ParamByName('Enquiry').asInteger := EnqNo;
    ParamByName('Line').asInteger := LineNo;
    ParamByName('Additional_Details').asInteger := Self.AdditionlDetailNo;
    ExecSQL;
  end;
end;

{ TExtraCharge }

procedure TExtraCharge.Delete(SuppNo, BrnchNo, EnqNo, LineNo: integer);
begin
  with PBEnqDM.qryDelSuppEnqAddChrg do
  begin
    ParamByName('supplier').asInteger := SuppNo;
    ParamByName('branch_no').asInteger := BrnchNo;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('additional_charge').asInteger := Self.ExtraChargeNo;
    ExecSQL;
  end;
end;

procedure TExtraCharge.Insert(SuppNo, BrnchNo, EnqNo, LineNo, chrgNo: integer);
begin
  with PBEnqDM.qryInsSuppEnqAddChrg do
  begin
    ParamByName('supplier').asInteger := SuppNo;
    ParamByName('branch_no').asInteger := BrnchNo;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('additional_charge').asInteger := chrgNo;
    ParamByName('details').asString := Self.Details;
    ParamByName('amount').asCurrency := Self.Cost;
    ParamByName('quotation_price').asCurrency := Self.Price;
    ExecSQL;
  end;
end;

procedure TExtraCharge.Load(SuppNo, BrnchNo, EnqNo, LineNo: integer);
begin
  with PBEnqDM.qrySelSuppEnqAddChrg do
  begin
    Close;
    ParamByName('supplier').asInteger := SuppNo;
    ParamByName('branch_no').asInteger := BrnchNo;
    ParamByName('enquiry').asInteger := EnqNo;
    ParamByName('line').asInteger := LineNo;
    ParamByName('additional_charge').asInteger := Self.ExtraChargeNo;
    Open;

    Self.Details := FieldByName('Details').asString;
    Self.Cost := FieldByName('Amount').asCurrency;
    Self.Price := FieldByName('quotation_price').asCurrency;

    Close;
  end;
end;

{ TQuickEnquiry }

procedure TEnquiryQuote.Edit;
var
  MaintForm: TPBMaintQEnqFrm;
begin
  MaintForm := TPBMaintQEnqFrm.Create(PBEnqDM);
  with MaintForm do
  begin
    Enquiry := Self;

    ShowModal();
    if ModalResult = mrYes then
    begin
      Self.ChangesSaved := true;
    end;
  end;
  MaintForm.Free;
end;

procedure TEnquiryQuote.Insert;
begin
  with PBEnqDM.qryInsQuote do
  begin
    ParamByName('Date_Point').asDateTime := Self.DatePoint;
    ParamByName('Operator').asInteger := Self.Operator.OperatorNo;
    ParamByName('Cust_Est_Contact').asString := Self.CustEstContact;

    if Self.QuoteReqBy = 0 then
      ParamByName('Quote_Required_By').Clear
    else
      ParamByName('Quote_Required_By').asDateTime := Self.QuoteReqBy;

    if Self.CustomerQuoteDate = 0 then
      ParamByName('Customer_Quote_Date').Clear
    else
      ParamByName('Customer_Quote_Date').asDateTime := Self.CustomerQuoteDate;

    ParamByName('Customer').asInteger := Self.Customer.CustomerNo;
    ParamByName('Branch_No').asInteger := Self.CustomerBranch.BranchNo;

    if Self.Rep.RepNo = -1 then
      ParamByName('Rep').Clear
    else
      ParamByName('Rep').asInteger := Self.Rep.RepNo;

    ParamByName('Description').asString := Self.Description;
    ParamByName('Enquiry_Status').asInteger := Self.EnquiryStatus;
    ParamByName('Enq_InActive').asString := Self.EnqInActive;
    if Self.OfficeContact.OperatorNo = -1 then
      ParamByName('Office_Contact').Clear
    else
      ParamByName('Office_Contact').asInteger := Self.OfficeContact.OperatorNo;

    ParamByName('Contact_No').asInteger := Self.Contact.ContactNo;
    ParamByName('Enquiry_Type').asString := Self.EnquiryType;
    ParamByName('Enquiry').asInteger := Self.EnquiryNo;

    ExecSQL;
  end;
end;

function TEnquiryQuote.Save: boolean;
begin
  if Self.ReadOnly then
  begin
    MessageDlg('Cannot save read-only copy of enquiry.', mtWarning, [mbOK], 0);
    Result := rvFailure;
    exit;
  end;

  with dmBroker.PBLDatabase do
  begin
    try
      StartTransaction;

      if Self.NewEnquiry then
      begin
        //new enquiry, need to insert records
        Self.EnquiryNo := PBEnqDM.GetNextEnqNumber;
        Self.Insert;
      end
      else if Self.Modified then
      begin
        //existing enquiry, need to update records
        Self.Update;
      end;

      Self.SaveLine;

      Commit;
      Result := rvSuccess;
    except on E: Exception do
      begin
        ShowMessage('Unable to save details, ' + e.message);
        Rollback;
        Result := rvFailure;
      end;
    end;
  end;
end;

end.
