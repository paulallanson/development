unit WTContractsDM;

interface

uses
  SysUtils, Classes, DB, wtNotesDM, wtQuotesDM, ComObj, ActiveX,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TcqMode   = (cqAdd, cqChange, cqDelete, cqCopy, cqView, cqRequote);
  TcqoMode   = (cqoAdd, cqoChange, cqoReName);
  TcqevMode   = (cqevAdd, cqevChange, cqevDelete, cqevView);

  TdtmdlContract = class(TDataModule)
    qryZero: TFDQuery;
    qryCQHeader: TFDQuery;
    qryCQAddHeader: TFDQuery;
    qryCQUpHeader: TFDQuery;
    qryCQGetLast: TFDQuery;
    qryAllContracts: TFDQuery;
    dtsAllContracts: TDataSource;
    qrydummy: TFDQuery;
    qryCustContracts: TFDQuery;
    dtsContracts: TDataSource;
    qryOperator: TFDQuery;
    dtsOperator: TDataSource;
    qryUpCompany: TFDQuery;
    qryCQAddLine: TFDQuery;
    qryCQAllLines: TFDQuery;
    qryGetCQLOptions: TFDQuery;
    qryCQLAddOption: TFDQuery;
    dsCustQuotes: TDataSource;
    qryCustQuotes: TFDQuery;
    dsDummy: TDataSource;
    qryGetCustomerWorktop: TFDQuery;
    qryGetCustomerPrice: TFDQuery;
    qryCQAllEvents: TFDQuery;
    qryCQAddEvent: TFDQuery;
    qryGetCutOutPrice: TFDQuery;
    qryGetEdgePrice: TFDQuery;
    qryGetAddress: TFDQuery;
    qryGetNextAdd: TFDQuery;
    qryAddAddress: TFDQuery;
    qryUpAddress: TFDQuery;
    qryDelAddress: TFDQuery;
    qryUpQuoteAddress: TFDQuery;
    qryUpContractAddress: TFDQuery;
    qryGetCustomerWG: TFDQuery;
    qryAddCustomerWG: TFDQuery;
    qryGetCustomerWT: TFDQuery;
    qryAddCustomerWT: TFDQuery;
    qryGetCustomerTH: TFDQuery;
    qryAddCustomerTH: TFDQuery;
    qryGetCustGroupWorktop: TFDQuery;
    qryGetCustGroupThickness: TFDQuery;
    qryReQuoteCount: TFDQuery;
    GetLastSQL: TFDQuery;
    DelSQL: TFDQuery;
    AddSQL: TFDQuery;
    qryCQUpdateHeader: TFDQuery;
    qryGetCustomerSupplier: TFDQuery;
    qryGetCustomerCutOutPrice: TFDQuery;
    qryGetCustomerEdgePrice: TFDQuery;
    qryGetMaterialSlab: TFDQuery;
    qryRevenueCentre: TFDQuery;
    dtsRevenueCentre: TDataSource;
  private
    function GetNextContractID: integer;
    function GetNextCQNumber: integer;
    function GetHeaderCount: integer;
    function GetHeaderCountAll: integer;
    function GetCurrentContract: integer;
    procedure AddZero;
    procedure DeleteZero;
  public
    Customer: integer;
    CustomerName: string;
    Description: string;
    Developer: string;
    OfficeContact: string;
    OperatorName: string;
    QuoteReference: string;
    SiteLocation: string;
    ShowInactive: string;
    ShowLive: boolean;
    TradeRetail: integer;
    SortType: string;
    SortOrder: string;
    property CurrentContract: integer read GetCurrentContract;
    property HeaderCount: integer read GetHeaderCount;
    property HeaderCountAll: integer read GetHeaderCountAll;
    procedure RefreshAlldata;
    procedure RefreshQuoteData;
    function GetCustomerCutOutPrice(tmpCustomer, tmpMaterial, tmpEdgeType, tmpCutOut: integer): double;
    function GetCustomerEdgePrice(tmpCustomer, tmpMaterial, tmpEdgeType, tmpEdge: integer): double;
    function GetCustomerGroupCost(tmpCust, tmpGroup, tmpThickness: integer): double;
    function GetCustomerGroupPrice(tmpCust, tmpGroup, tmpThickness: integer): double;
    function GetCustomerGroupWorktop(tmpCust, tmpGroup: integer): integer;
    function GetCustomerGroupSupplier(tmpCust, tmpGroup: integer): integer;
    function GetMaterialCutOutPrice(tmpMaterial, tmpEdgeType, tmpCutOut: integer): double;
    function GetMaterialEdgePrice(tmpMaterial, tmpEdgeType, tmpEdge: integer): double;
    function GetMaterialSlabSize(tmpMaterial: integer; var iLength, iDepth: integer): boolean;
    function GetNarrative(const iNarrative: integer): string;
    function UsingSearch: boolean;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    function SetAddress(iAddress: integer;
                        AddName, Street, AddLocale: string;
                        Town, postcode, County, phone, email: string): integer;
    procedure UpdateQuoteAddress(tempContract, tempQuote, tempCustomer, tempAddress: integer; tempName: string);
  end;

  TContract = class;

  TContractOptions = class;

  TContractLine = class
  private
    FLine: integer;
    FMode: string;
    FDrawingNumber: string;
    FParent: TContract;
    FContractOptions: TContractOptions;
    FSupplierReference: string;
    FNumberOfUnits: integer;
    procedure SetDrawingNumber(const Value: string);
    procedure SetLine(const Value: integer);
    procedure SetMode(const Value: string);
    procedure SetParent(const Value: TContract);
    procedure SetSupplierReference(const Value: string);
    procedure SetNumberOfUnits(const Value: integer);
  public
    constructor Create(Contract : TContract);
    destructor Destroy; override;
    procedure Clear;
    function Clone : TContractLine;
    procedure SaveToDB;
    procedure LoadOptions;
    procedure LoadFromDB;
    procedure SaveOptions;
    procedure DeleteFromDB;
    property DrawingNumber: string read FDrawingNumber write SetDrawingNumber;
    property Line: integer read FLine write SetLine;
    property Mode: string read FMode write SetMode;
    property NumberOfUnits: integer read FNumberOfUnits write SetNumberOfUnits;
    property Options: TContractOptions read FContractOptions;
    property Parent: TContract read FParent write SetParent;
    property SupplierReference: string read FSupplierReference write SetSupplierReference;
  end;

  TContractLines = class;

  TContractEvent   = class
  private
    FEventNumber: integer;
    FOperator: integer;
    FOperatorName: string;
    FDateEntered: TDateTime;
    FNarrative: TNotes;
    FParent: TContract;
    procedure SetDateEntered(const Value: TDateTime);
    procedure SetEventNumber(const Value: integer);
    procedure SetNarrative(const Value: TNotes);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetParent(const Value: TContract);
  public
    constructor Create(Contract : TContract);
    destructor Destroy; override;
    function Clone : TContractEvent;
    procedure SaveToDB;
    property DateEntered: TDateTime read FDateEntered write SetDateEntered;
    property EventNumber: integer read FEventNumber write SetEventNumber;
    property Narrative: TNotes read FNarrative write SetNarrative;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName:string read FOperatorName write SetOperatorName;
    property Parent: TContract read FParent write SetParent;
  end;

  TContractEvents = class;

  TContractOption = class
  private
    FOptionNumber: integer;
    FQuote: integer;
    FDescription: string;
    FQuestionText: string;
    FParent: TContractLine;
    FNettPrice: currency;
    FInstallPrice: currency;
    FDeliveryPrice: currency;
    FSurveyPrice: currency;
    FGroup: integer;
    FQuotedescription: string;
    FMaterialType: integer;
    FMarkupValue: currency;
    FDiscountValue: currency;
    FThickness: integer;
    FIncompatible: boolean;
    FQuoteMarkup: double;
    FOriginalQuote: integer;
    procedure SetDescription(const Value: string);
    procedure SetOptionNumber(const Value: integer);
    procedure SetQuote(const Value: integer);
    procedure SetNettPrice(const Value: currency);
    procedure SetInstallPrice(const Value: currency);
    procedure SetDeliveryPrice(const Value: currency);
    procedure SetSurveyPrice(const Value: currency);
    procedure SetGroup(const Value: integer);
    procedure SetQuotedescription(const Value: string);
    procedure SetMaterialType(const Value: integer);
    procedure SetDiscountValue(const Value: currency);
    procedure SetMarkupValue(const Value: currency);
    procedure SetThickness(const Value: integer);
    procedure SetIncompatible(const Value: boolean);
    procedure SetQuoteMarkup(const Value: double);
    procedure SetOriginalQuote(const Value: integer);
  public
    constructor Create(ContractLine: TContractLine);
    destructor Destroy; override;
    function Clone : TContractOption;
    procedure CopyQuote;
    procedure SaveToDB;
    property DeliveryPrice: currency read FDeliveryPrice write SetDeliveryPrice;
    property Description: string read FDescription write SetDescription;
    property DiscountValue: currency read FDiscountValue write SetDiscountValue;
    property Group: integer read FGroup write SetGroup;
    property Incompatible: boolean read FIncompatible write SetIncompatible;
    property InstallPrice: currency read FInstallPrice write SetInstallPrice;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property MarkupValue: currency read FMarkupValue write SetmarkupValue;
    property NettPrice: currency read FNettPrice write SetNettPrice;
    property OptionNumber: integer read FOptionNumber write SetOptionNumber;
    property OriginalQuote: integer read FOriginalQuote write SetOriginalQuote;
    property Parent: TContractLine read FParent;
    property Quote: integer read FQuote write SetQuote;
    property Quotedescription: string read FQuotedescription write SetQuotedescription;
    property QuoteMarkup: double read FQuoteMarkup write SetQuoteMarkup;
    property SurveyPrice: currency read FSurveyPrice write SetSurveyPrice;
    property Thickness: integer read FThickness write SetThickness;
  end;

  TContractOptions  = class
  private
    FParent: TContractLine;
    FItems : TList;
    function GetCount: integer;
    function GetItems(Index: integer): TContractOption;
    procedure SetItems(Index: integer; const Value: TContractOption);
  public
    constructor Create(ContractLine : TContractLine);
    destructor Destroy; override;
    procedure Add(aOption : TContractOption);
    procedure Clear;
    function  Clone : TContractOptions;
    procedure Delete(const Index : integer);
    function  IndexOf(const OptionNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TContractOption read GetItems write SetItems;
      default;
    property Parent : TContractLine read FParent;
  end;

  TContractEvents    = class
  private
    FParent: TContract;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TContractEvent;
    procedure SetItems(Index: integer; const Value: TContractEvent);
  public
    constructor Create(Contract : TContract);
    destructor Destroy; override;
    procedure Add(aEvent: TContractEvent);
    procedure Clear;
    function  Clone : TContractEvents;
    procedure Delete(const Index : integer);
    function  IndexOf(const EventNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TContractEvent read GetItems write SetItems;
      default;
    property Parent : TContract read FParent;
  end;

  TContractLines  = class
  private
    FParent: TContract;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TContractLine;
    procedure SetItems(Index: integer; const Value: TContractLine);
  public
    constructor Create(Contract : TContract);
    destructor Destroy; override;
    procedure Add(aLine : TContractLine);
    procedure Clear;
    function  Clone : TContractLines;
    procedure Delete(const Index : integer);
    function  IndexOf(const LineNumber: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TContractLine read GetItems write SetItems;
      default;
    property Parent : TContract read FParent;
  end;

  TContract = class
  private
    FContractQuoteNumber: double;
    FExtraNotes: integer;
    FdbKey: integer;
    FCustomer: integer;
    FEstimator: integer;
    FAccountManager: integer;
    FOperator: integer;
    FDescription: string;
    FInactive: string;
    FOperatorName: string;
    FCustomerName: string;
    FEstimatorName: string;
    FDeveloper: string;
    FAccountManagerName: string;
    FSiteLocation: string;
    FCQMode: TCQMode;
    FContractDate: TDateTime;
    FDataModule: TdtmdlContract;
    FInactiveReason: integer;
    FContractLines: TContractLines;
    FNarrativeText: string;
    FContactName: string;
    FContractEvents: TContractEvents;
    FContractMode: TCQMode;
    FSpeculative: boolean;
    FPostCode: string;
    FTownCity: string;
    FStreet: string;
    FCounty: string;
    FWebAddress: string;
    FEmailAddress: string;
    FTelephoneNumber: string;
    FLocality: string;
    FAddress: integer;
    FExpiryDate: TDateTime;
    FQuoteNumber: double;
    FOriginalQuote: integer;
    FAllowPriceChange: boolean;
    FSitePhone: string;
    FSiteContact: string;
    FRevenueCentre: integer;
    FCustomerBranch: integer;
    FCustomerBranchName: string;
    FBranchExist: boolean;
    function GetNextReQuoteNumber: real;
    procedure SetAccountManager(const Value: integer);
    procedure SetAccountManagerName(const Value: string);
    procedure SetCQMode(const Value: TCQMode);
    procedure SetContractDate(const Value: TDateTime);
    procedure SetContractQuoteNumber(const Value: double);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetdbKey(const Value: integer);
    procedure SetDescription(const Value: string);
    procedure SetDeveloper(const Value: string);
    procedure SetEstimator(const Value: integer);
    procedure SetEstimatorName(const Value: string);
    procedure SetExtraNotes(const Value: integer);
    procedure SetInactive(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetSiteLocation(const Value: string);
    procedure SetInactiveReason(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetContactName(const Value: string);
    procedure SetContractMode(const Value: TCQMode);
    procedure SetSpeculative(const Value: boolean);
    procedure SetCounty(const Value: string);
    procedure SetEmailAddress(const Value: string);
    procedure SetLocality(const Value: string);
    procedure SetPostCode(const Value: string);
    procedure SetStreet(const Value: string);
    procedure SetTelephoneNumber(const Value: string);
    procedure SetTownCity(const Value: string);
    procedure SetWebAddress(const Value: string);
    procedure SetAddress(const Value: integer);
    procedure SetExpiryDate(const Value: TDateTime);
    procedure SetOriginalQuote(const Value: integer);
    procedure SetQuoteNumber(const Value: double);
    procedure SetAllowPriceChange(const Value: boolean);
    procedure SetSiteContact(const Value: string);
    procedure SetSitePhone(const Value: string);
    procedure SetRevenueCentre(const Value: integer);
    procedure SetCustomerBranch(const Value: integer);
    procedure SetCustomerBranchName(const Value: string);
    procedure SetBranchExist(const Value: boolean);
  public
    constructor Create(DataModule : TdtmdlContract);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TContract;
    function GetAddress(Address: integer): boolean;
    function GetOptionTotals(iOption: integer): double;
    procedure DeleteFromDB;
    procedure DeleteEvents;
    procedure DeleteLines;
    procedure DeleteOptions;
    procedure LoadFromDB;
    procedure LoadLines;
    procedure LoadEvents;
    procedure LoadLineOptions;
    procedure SaveCustomerWorktopGroups(OldCustomer: integer);
    procedure SaveToDB(TempAll: boolean);
    procedure SaveLines;
    procedure SaveEvents;
    procedure SaveQuoteNumber;
    property AccountManager: integer read FAccountManager write SetAccountManager;
    property AccountManagerName: string read FAccountManagerName write SetAccountManagerName;
    property Address: integer read FAddress write SetAddress;
    property AllowPriceChange: boolean read FAllowPriceChange write SetAllowPriceChange;
    property BranchExist: boolean read FBranchExist write SetBranchExist;
    property CQMode: TCQMode read FCQMode write SetCQMode;
    property ContactName: string read FContactName write SetContactName;
    property ContractDate: TDateTime read FContractDate write SetContractDate;
    property ContractMode: TCQMode read FContractMode write SetContractMode;
    property ContractQuoteNumber: double read FContractQuoteNumber write SetContractQuoteNumber;
    property County: string read FCounty write SetCounty;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerBranch: integer read FCustomerBranch write SetCustomerBranch;
    property CustomerBranchName: string read FCustomerBranchName write SetCustomerBranchName;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property DataModule: TdtmdlContract read FDataModule;
    property dbKey: integer read FdbKey write SetdbKey;
    property Description: string read FDescription write SetDescription;
    property Developer: string read FDeveloper write SetDeveloper;
    property EmailAddress: string read FEmailAddress write SetEmailAddress;
    property Estimator: integer read FEstimator write SetEstimator;
    property EstimatorName: string read FEstimatorName write SetEstimatorName;
    property ExpiryDate: TDateTime read FExpiryDate write SetExpiryDate;
    property ExtraNotes: integer read FExtraNotes write SetExtraNotes;
    property Events: TContractEvents read FContractEvents;
    property Inactive: string read FInactive write SetInactive;
    property InactiveReason: integer read FInactiveReason write SetInactiveReason;
    property Lines : TContractLines read FContractLines;
    property Locality: string read FLocality write SetLocality;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property OriginalQuote: integer read FOriginalQuote write SetOriginalQuote;
    property PostCode: string read FPostCode write SetPostCode;
    property QuoteNumber: double read FQuoteNumber write SetQuoteNumber;
    property RevenueCentre: integer read FRevenueCentre write SetRevenueCentre;
    property SiteContact: string read FSiteContact write SetSiteContact;
    property SiteLocation: string read FSiteLocation write SetSiteLocation;
    property SitePhone: string read FSitePhone write SetSitePhone;
    property Speculative: boolean read FSpeculative write SetSpeculative;
    property Street: string read FStreet write SetStreet;
    property TelephoneNumber: string read FTelephoneNumber write SetTelephoneNumber;
    property TownCity: string read FTownCity write SetTownCity;
    property WebAddress: string read FWebAddress write SetWebAddress;
  end;

var
  dtmdlContract: TdtmdlContract;
  dtmdlCopyQuote: TdtmdlQuote;

implementation

uses wtDataModule, wtMain;

{$R *.dfm}

{ TContract }

procedure TContract.Clear;
begin
  Customer :=       0;
  CustomerName :=   '';
  ContractDate :=    0;
  FContractLines.Clear;
  FContractEvents.Clear;
end;

function TContract.Clone: TContract;
begin
  Result := TContract.Create(FDataModule);
  Result.AccountManager :=      self.AccountManager;
  Result.AccountManagerName :=  self.AccountManagerName;
  Result.Address :=             self.Address;
  Result.AllowPriceChange :=    self.AllowPriceChange;
  REsult.BranchExist :=         self.BranchExist;
  Result.CQMode :=              self.CQMode;
  Result.ContactName  :=        self.ContactName;
  Result.ContractDate :=        self.ContractDate;
  Result.ContractQuoteNumber := self.ContractQuoteNumber;
  Result.ContractMode :=        self.ContractMode;
  Result.County :=              self.County;
  Result.Customer:=             self.Customer;
  Result.CustomerBranch :=      self.CustomerBranch;
  Result.CustomerBranchName :=  self.CustomerBranchName;
  Result.CustomerName:=         self.CustomerName;
  Result.Description:=          self.Description;
  Result.Developer :=           self.Developer;
  Result.ExpiryDate :=          self.ExpiryDate;
  Result.EmailAddress :=        self.EmailAddress;
  Result.Estimator :=           self.Estimator;
  Result.EstimatorName :=       self.EstimatorName;
  Result.ExtraNotes :=          self.ExtraNotes;
  Result.Inactive :=            self.Inactive;
  Result.InactiveReason :=      self.InactiveReason;
  Result.Locality :=            self.Locality;
  Result.NarrativeText :=       self.NarrativeText;
  Result.Operator :=            self.Operator;
  Result.OperatorName :=        self.OperatorName;
  Result.OriginalQuote :=       self.OriginalQuote;
  Result.PostCode :=            self.PostCode;
  Result.QuoteNumber :=         self.QuoteNumber;
  Result.RevenueCentre :=       self.RevenueCentre;
  Result.SiteContact :=         self.SiteContact;
  Result.SitePhone :=          self.SitePhone;
  Result.SiteLocation :=        self.SiteLocation;
  Result.Speculative :=         self.Speculative;
  Result.Street :=              self.Street;
  Result.TelephoneNumber :=     self.TelephoneNumber;
  Result.TownCity :=            self.TownCity;
  Result.WebAddress :=          self.WebAddress;
  Result.FContractLines.Free;
  Result.FContractLines :=  Self.FContractLines.Clone;
  Result.FContractEvents.Free;
  Result.FContractEvents :=  Self.FContractEvents.Clone;
end;

constructor TContract.Create(DataModule: TdtmdlContract);
begin
  FDataModule := DataModule;
  FContractLines := TContractLines.Create(Self);
  FContractEvents := TContractEvents.Create(Self);
end;

procedure TContract.DeleteFromDB;
begin
  DeleteOptions;
  DeleteLines;
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Contract_Quote WHERE Contract_Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

destructor TContract.Destroy;
begin
  FContractLines.Free;
  FContractEvents.Free;
  inherited;
end;

procedure TContract.LoadFromDB;
begin
  { Load the header record then all lines belonging to the quote }
  Clear;
  with FDataModule.qryCQHeader do
  begin
    Close;
    ParamByName('Contract_Quote').AsInteger := DbKey;
    Open;

    Address := fieldbyname('Address').asinteger;
    if fieldbyname('Account_Manager').asinteger = 0 then
      AccountManager := fieldbyname('Operator').asinteger
    else
      AccountManager := fieldbyname('Account_Manager').asinteger;
    ExpiryDate :=     fieldbyname('Expiry_Date').asdatetime;
    ExtraNotes :=     fieldbyname('Notes').asinteger;
    NarrativeText :=    datamodule.GetNarrative(ExtraNotes);
    ContactName :=    fieldbyname('Contact_Name').asstring;
    ContractDate:=          fieldbyname('Contract_Date').asdatetime;
    ContractQuoteNumber :=  fieldbyname('Contract_Quote_Number').asfloat;
    Customer:=       fieldbyname('Customer').asinteger;
    CustomerName:=   fieldbyname('Customer_Name').asstring;

    CustomerBranch := fieldbyname('Branch_No').AsInteger;
    CustomerBranchName := dtmdlWorktops.GetCustomerBranchName(Customer, CustomerBranch);

    BranchExist := dtmdlWorktops.DoesCustomerBranchExist(Customer);

    Description:=    fieldbyname('Contract_Description').asstring;
    Developer :=     fieldbyname('Developer').asstring;
    Inactive :=      fieldbyname('Inactive').asstring;
    InactiveReason :=      fieldbyname('Inactive_Reason').asinteger;
    Operator :=       fieldbyname('operator').asinteger;
    OperatorName :=   fieldbyname('Operator_Name').asstring;

    RevenueCentre := fieldbyname('Revenue_Centre').asinteger;
    SiteContact :=   fieldbyname('Site_Contact').asstring;
    SitePhone :=   fieldbyname('Site_Phone').asstring;
    SiteLocation :=   fieldbyname('Site_Location').asstring;
    Speculative := (fieldbyname('Customer_is_speculative').AsString = 'Y');

    if Address <> 0 then
      GetAddress(Address);

    if cqMode = cqRequote then
      begin
        if (fieldbyname('Original_Quote').AsInteger <> 0) and
           (fieldbyname('Contract_Quote').AsInteger <> fieldbyname('Original_Quote').AsInteger) then
          OriginalQuote := fieldbyname('Original_Quote').AsInteger
        else
          OriginalQuote := fieldbyname('Contract_Quote').AsInteger;
      end
    else
      begin
        if fieldbyname('Original_Quote').AsInteger = 0 then
          OriginalQuote := dbKey
        else
          OriginalQuote := fieldbyname('Original_Quote').AsInteger;
      end;
    QuoteNumber :=   fieldbyname('Quote_Number').asfloat;
    
    AllowPriceChange := (OriginalQuote <> QuoteNumber);
    Close;
  end;
  LoadLines;
  LoadLineOptions;
  if (cqMode <> cqRequote) and (cqMode <> cqCopy) then
    LoadEvents;
end;

procedure TContract.LoadLines;
var
  aLine : TContractLine;
begin
  FContractLines.Clear;
  with FDataModule.qryCQAllLines do
  begin
    Close;
    ParamByName('Contract_Quote').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aLine := TContractLine.Create(Self);
      aLine.Line := FieldByName('Line_Number').AsInteger;
      aLine.DrawingNumber := FieldByName('Drawing_Number').Asstring;
      aLine.SupplierReference := FieldByName('Supplier_Reference').Asstring;
      aLine.NumberOfUnits := FieldByName('Number_of_Units').Asinteger;
      FContractLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TContract.LoadEvents;
var
  aEvent : TContractEvent;
begin
  FContractEvents.Clear;
  with FDataModule.qryCQAllEvents do
  begin
    Close;
    ParamByName('Contract_Quote').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aEvent := TContractEvent.Create(Self);
      aEvent.EventNumber := FieldByName('Internal_Note').AsInteger;
      aEvent.DateEntered := FieldByName('Date_Time_Entered').Asdatetime;
      aEvent.Operator := FieldByName('Operator').Asinteger;
      aEvent.OperatorName := FieldByName('Operator_Name').asstring;
      aEvent.Narrative.dbKey := FieldByName('Narrative').asinteger;
      aEvent.Narrative.LoadFromDB;

      FContractEvents.Add(aEvent);
      Next;
    end;
    Close;
  end;
end;

procedure TContract.SaveLines;
var
  i : integer;
begin
  DeleteOptions;  { Get rid of any already in database }
  DeleteLines;  { Get rid of any already in database }
  FContractLines.Renumber;
  for i := 0 to Pred(FContractLines.Count) do
    FContractLines[i].SaveToDB;
end;

procedure TContract.SaveToDB(TempAll: boolean);
begin
  if DbKey = 0 then
    begin
      dbKey := FDataModule.GetNextContractID;
    end;

  if TempAll then
    begin
      with FDataModule.qryCQUpdateHeader do
        begin
          ParamByName('Contract_Quote').AsInteger := DbKey;
          if self.Address = 0 then
            Parambyname('Address').clear
          else
            Parambyname('Address').asinteger := self.Address;
          ParambyName('Account_Manager').asinteger := self.AccountManager;
          ParamByName('Contact_Name').asstring := self.ContactName;
          ParamByName('Contract_Date').asdatetime := self.ContractDate;
          ParamByName('Customer').AsInteger := Customer;
          Parambyname('Customer_Name').asstring := CustomerName;

          if CustomerBranch = 0 then
            ParamByName('Branch_No').clear
          else
            ParamByName('Branch_No').AsInteger := CustomerBranch;

          ParamByName('Contract_Description').Asstring := Description;
          if ExtraNotes = 0 then
            ParamByName('Notes').clear
          else
            ParamByName('Notes').Asinteger := ExtraNotes;
          Parambyname('Inactive').asstring := inactive;
          if self.inactiveReason = 0 then
            ParambyName('Inactive_Reason').clear
          else
            Parambyname('Inactive_Reason').asinteger := self.inactiveReason;

          if ExpiryDate = 0 then
            Parambyname('Expiry_Date').clear
          else
            Parambyname('Expiry_Date').asdatetime := ExpiryDate;

          Parambyname('Developer').asstring := Developer;

          if RevenueCentre = 0 then
            Parambyname('Revenue_Centre').clear
          else
            Parambyname('Revenue_Centre').asinteger := RevenueCentre;

          Parambyname('Site_Contact').asstring := SiteContact;
          Parambyname('Site_Location').asstring := SiteLocation;
          Parambyname('Site_Phone').asstring := SitePhone;

          if (cqMode = cqAdd) or (cqMode = cqCopy) then
            begin
              QuoteNumber := FDataModule.GetNextCQNumber;
              Parambyname('Quote_Number').asfloat   := QuoteNumber;
              Parambyname('Original_Quote').asInteger := Trunc(QuoteNumber);
              Parambyname('Contract_Quote_Number').asfloat := QuoteNumber;

              OriginalQuote := trunc(QuoteNumber);
              ContractQuoteNumber := QuoteNumber;
            end
          else
          if (cqMode = cqReQuote) then
            begin
              QuoteNumber := GetNextReQuoteNumber;
              Parambyname('Quote_Number').asfloat := QuoteNumber;
              Parambyname('Original_Quote').asinteger := OriginalQuote;
              Parambyname('Contract_Quote_Number').asfloat := QuoteNumber;
            end
          else
            begin
              Parambyname('Quote_Number').asfloat   := QuoteNumber;
              Parambyname('Original_Quote').asinteger := OriginalQuote;
              Parambyname('Contract_Quote_Number').asfloat := ContractQuoteNumber;
            end;

          ExecSQL;
        end;
      if (cqMode = cqAdd) or (cqMode = cqCopy) then
        begin
          SaveQuoteNumber;
        end;
//          dtmdlWorktops.CreateContractDocDirectory(inttostr(dbKey));
      dtmdlWorktops.CreateContractDocDirectory(floattostr(QuoteNumber));
    end;
  SaveLines;
  SaveEvents;

end;

procedure TContract.SetAccountManager(const Value: integer);
begin
  FAccountManager := Value;
end;

procedure TContract.SetAccountManagerName(const Value: string);
begin
  FAccountManagerName := Value;
end;

procedure TContract.SetCQMode(const Value: TCQMode);
begin
  FCQMode := Value;
end;

procedure TContract.SetContractDate(const Value: TDateTime);
begin
  FContractDate := Value;
end;

procedure TContract.SetContractQuoteNumber(const Value: double);
begin
  FContractQuoteNumber := Value;
end;

procedure TContract.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TContract.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TContract.SetdbKey(const Value: integer);
begin
  FdbKey := Value;
end;

procedure TContract.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TContract.SetDeveloper(const Value: string);
begin
  FDeveloper := Value;
end;

procedure TContract.SetEstimator(const Value: integer);
begin
  FEstimator := Value;
end;

procedure TContract.SetEstimatorName(const Value: string);
begin
  FEstimatorName := Value;
end;

procedure TContract.SetExtraNotes(const Value: integer);
begin
  FExtraNotes := Value;
end;

procedure TContract.SetInactive(const Value: string);
begin
  FInactive := Value;
end;

procedure TContract.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TContract.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TContract.SetSiteLocation(const Value: string);
begin
  FSiteLocation := Value;
end;

procedure TContract.DeleteEvents;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Contract_Quote_internal_Note WHERE Contract_Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TContract.DeleteLines;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Contract_Quote_Line WHERE Contract_Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TContract.DeleteOptions;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Contract_Quote_Line_Option WHERE Contract_Quote =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

procedure TContract.SetInactiveReason(const Value: integer);
begin
  FInactiveReason := Value;
end;

procedure TContract.SaveQuoteNumber;
begin
  with datamodule.qryUpCompany do
    begin
      close;
//      parambyname('Last_Contract_Quote_number').asinteger := dbKey;
      parambyname('Last_Contract_Quote_number').asInteger := trunc(QuoteNumber);
      execsql;
    end;
end;

procedure TContract.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TContract.LoadLineOptions;
var
  aOption: TContractOption;
  aLine:  TContractLine;
  i, icount: integer;
begin
  for i := 0 to pred(FContractLines.Count) do
    begin
      aLine := FContractLines[i];

      aLine.FContractOptions.Clear;

      with FDataModule.qryGetCQLOptions do
        begin
          Close;
          ParamByName('Contract_Quote').AsInteger := aLine.parent.dbkey;
          ParamByName('Line_Number').AsInteger := aLine.Line;
          Open;

          icount := 1;
          while not(EOF) do
          begin
            aOption := TContractOption.Create(aLine);
            aOption.Description       := FieldByName('Option_Description').asstring;
            aOption.DeliveryPrice     := fieldbyname('Delivery_Price').asfloat;
            aOption.DiscountValue     := fieldbyname('Discount_Value').asfloat;
            aOption.Group             := fieldbyname('Group_Number').asinteger;
            aOption.InstallPrice      := fieldbyname('Installation_Price').asfloat;
            aOption.MarkupValue       := fieldbyname('Markup_Value').asfloat;
            aOption.MaterialType      := fieldbyname('Material_Type').asinteger;
            aOption.NettPrice         := fieldbyname('Nett_Price').asfloat;
            aOption.OptionNumber      := aLine.FContractOptions.Count + 1;
            aOption.Quote             := FieldByName('Quote').AsInteger;
            aOption.OriginalQuote     := FieldByName('Original_Quote').AsInteger;
            aOption.QuoteDescription  := fieldbyname('Quote_Description').asstring;
            aOption.SurveyPrice       := fieldbyname('Survey_Price').asfloat;
            aOption.Thickness         := fieldbyname('Thickness').asinteger;

            if (cqMode = cqCopy) or (cqMode = cqRequote) then
              aOption.QuoteMarkup       := 0
            else
              aOption.QuoteMarkup       := fieldbyname('Markup_Percentage').asfloat;

            aLine.FContractOptions.Add(aOption);

            Next;
          end;
          Close;
      end;
    end;
end;

procedure TContract.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TContract.SaveEvents;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteEvents;  { Get rid of any already in database }
  FContractEvents.Renumber;
  for i := 0 to Pred(FContractEvents.Count) do
    begin
      FContractEvents[i].SaveToDB;
    end;
end;

procedure TContract.SetContractMode(const Value: TCQMode);
begin
  FContractMode := Value;
end;

procedure TContract.SetSpeculative(const Value: boolean);
begin
  FSpeculative := Value;
end;

procedure TContract.SetCounty(const Value: string);
begin
  FCounty := Value;
end;

procedure TContract.SetEmailAddress(const Value: string);
begin
  FEmailAddress := Value;
end;

procedure TContract.SetLocality(const Value: string);
begin
  FLocality := Value;
end;

procedure TContract.SetPostCode(const Value: string);
begin
  FPostCode := Value;
end;

procedure TContract.SetStreet(const Value: string);
begin
  FStreet := Value;
end;

procedure TContract.SetTelephoneNumber(const Value: string);
begin
  FTelephoneNumber := Value;
end;

procedure TContract.SetTownCity(const Value: string);
begin
  FTownCity := Value;
end;

procedure TContract.SetWebAddress(const Value: string);
begin
  FWebAddress := Value;
end;

procedure TContract.SetAddress(const Value: integer);
begin
  FAddress := Value;
end;

function TContract.GetAddress(Address: integer): boolean;
begin
  with DataModule.qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := Address;
      open;

      Street := fieldbyname('Street').asstring;
      Locality := fieldbyname('Locale').asstring;
      TownCity := fieldbyname('Town_City').asstring;
      Postcode := fieldbyname('Postcode').asstring;
      County := fieldbyname('County_State').asstring;
      TelephoneNumber := fieldbyname('Telephone_Number').asstring;
      EmailAddress := fieldbyname('Email_Address').asstring;
      WebAddress := fieldbyname('Web_Address').asstring;
    end;
end;

procedure TContract.SaveCustomerWorktopGroups(OldCustomer: integer);
var
  iLine, iOption: integer;
  iPricePointer: integer;
  sGroupDescription: string;
  iMaterial: integer;
  stext: string;
begin
  for iLine := 0 to pred(self.Lines.count) do
    begin
      for iOption := 0 to pred(Lines[iLine].options.count) do
        begin
          {find original Customer_worktop_group}
          with dataModule.qryGetCustomerWG do
            begin
              close;
              parambyname('Customer').asinteger := OldCustomer;
              parambyname('Group_Number').asinteger := Lines[iLine].options[iOption].Group;
              open;

              {Don't create anything if we can't find it}
              if RecordCount = 0 then
                continue;

              sGroupDescription := dataModule.qryGetCustomerWG.fieldbyname('Group_Description').asstring;
              iMaterial := dataModule.qryGetCustomerWG.fieldbyname('Material_Type').asinteger;
            end;

          {Does the group already exist for new customer?}
          with dataModule.qryGetCustomerWG do
            begin
              close;
              parambyname('Customer').asinteger := self.Customer;
              parambyname('Group_Number').asinteger := Lines[iLine].options[iOption].Group;
              open;

              if recordcount = 0 then
                begin
                  {create new Customer_worktop_group}
                  try
                    with dataModule.qryAddCustomerWG do
                      begin
                        close;
                        parambyname('Customer').asinteger := self.Customer;
                        parambyname('Group_Number').asinteger := Lines[iLine].options[iOption].Group;
                        parambyname('Group_Description').asstring := sGroupDescription;
                        parambyname('Material_Type').asinteger := iMaterial;
                        execsql;
                      end;
                  except
                  end;
                end;
            end;

          {Get Worktop group colours}
          with dataModule.qryGetCustomerWT do
            begin
              close;
              parambyname('Customer').asinteger := OldCustomer;
              parambyname('Group_Number').asinteger := Lines[iLine].options[iOption].Group;
              open;

              {Add the customer worktops}
              while EOF <> true do
                begin
                  try
                    with dataModule.qryGetCustGroupWorktop do
                      begin
                        close;
                        parambyname('Customer').asinteger := self.Customer;
                        parambyname('Group_Number').asinteger := Lines[iLine].options[iOption].Group;
                        parambyname('Worktop').asinteger := dataModule.qryGetCustomerWT.fieldbyname('Worktop').asinteger;
                        open;

                        if recordcount = 0 then
                          begin
                            with dataModule.qryAddCustomerWT do
                              begin
                                close;
                                parambyname('Customer').asinteger := self.Customer;
                                parambyname('Group_Number').asinteger := Lines[iLine].options[iOption].Group;
                                parambyname('Worktop').asinteger := dataModule.qryGetCustomerWT.fieldbyname('Worktop').asinteger;
                                execsql;
                              end;
                          end;
                      end;
                  except
                  end;
                  next;
                end;
            end;

          {Get Worktop group thickness}
          with dataModule.qryGetCustomerTH do
            begin
              close;

              if dtmdlWorktops.IsSQL then
                begin
                  sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
                  SQL.Text := sText;
                end;

              parambyname('Customer').asinteger := OldCustomer;
              parambyname('Group_Number').asinteger := Lines[iLine].options[iOption].Group;
              open;

              {Add the customer Thickness}
              while EOF <> true do
                begin
                  try
                    with dataModule.qryGetCustGroupThickness do
                      begin
                        close;
                        parambyname('Customer').asinteger := self.Customer;
                        parambyname('Group_Number').asinteger := Lines[iLine].options[iOption].Group;
                        parambyname('Thickness').asinteger := dataModule.qryGetCustomerTH.fieldbyname('Thickness').asinteger;
                        open;

                        if recordcount = 0 then
                          begin
	                          dtmdlWorktops.qryNewPrice.Close;
                            dtmdlWorktops.qryNewPrice.Open;
                            iPricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	                          dtmdlWorktops.qryAddPointer.Close;
                            dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := iPricePointer;
                            dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
	                          dtmdlWorktops.qryAddPointer.ExecSQl;

	                          dtmdlWorktops.qryAddPrice.Close;
                            dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := iPricePointer;
                            dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
                            dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
                            dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := dataModule.qryGetCustomerTH.fieldbyname('Unit_Price').asfloat;
                            dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := 0.00;
                            dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
                            dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
                            dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
	                          dtmdlWorktops.qryAddPrice.ExecSQl;

                            with dataModule.qryAddCustomerTH do
                              begin
                                close;
                                parambyname('Customer').asinteger := self.Customer;
                                parambyname('Group_Number').asinteger := Lines[iLine].options[iOption].Group;
                                parambyname('Thickness').asinteger := dataModule.qryGetCustomerTH.fieldbyname('Thickness').asinteger;
                                parambyname('Price_Pointer').asinteger := iPricePointer;
                                execsql;
                              end;
                          end;
                      end;
                  except
                  end;
                  next;
                end;
            end;
        end;
    end;
end;

function TContract.GetOptionTotals(iOption: integer): double;
var
  iCount: integer;
begin
  result := 0;
  for icount := 0 to pred(self.lines.count) do
    begin
      Result := Result + (Lines[icount].Options[iOption].NettPrice + Lines[icount].Options[iOption].InstallPrice + Lines[icount].Options[iOption].SurveyPrice);
    end;
end;

procedure TContract.SetExpiryDate(const Value: TDateTime);
begin
  FExpiryDate := Value;
end;

procedure TContract.SetOriginalQuote(const Value: integer);
begin
  FOriginalQuote := Value;
end;

procedure TContract.SetQuoteNumber(const Value: double);
begin
  FQuoteNumber := Value;
end;

function TContract.GetNextReQuoteNumber: real;
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
      Raise Exception.Create('Failed to get next Contract Quote number:' + #13 + E.Message);
    end;
  end;
end;

procedure TContract.SetAllowPriceChange(const Value: boolean);
begin
  FAllowPriceChange := Value;
end;

procedure TContract.SetSiteContact(const Value: string);
begin
  FSiteContact := Value;
end;

procedure TContract.SetSitePhone(const Value: string);
begin
  FSitePhone := Value;
end;

procedure TContract.SetRevenueCentre(const Value: integer);
begin
  FRevenueCentre := Value;
end;

procedure TContract.SetCustomerBranch(const Value: integer);
begin
  FCustomerBranch := Value;
end;

procedure TContract.SetCustomerBranchName(const Value: string);
begin
  FCustomerBranchName := Value;
end;

procedure TContract.SetBranchExist(const Value: boolean);
begin
  FBranchExist := Value;
end;

{ TdtmdlContract }

function TdtmdlContract.GetHeaderCount: integer;
begin
  Result := qryCustContracts.recordcount;
end;

function TdtmdlContract.GetHeaderCountAll: integer;
begin
  Result := qryAllContracts.recordcount;
end;

function TdtmdlContract.GetNextCQNumber: integer;
begin
(*  with qryCQGetLast do
    begin
      close;
      open;
      result := fieldbyname('Last_Contract_Quote_number').asinteger + 1;
    end;
*)
  dtmdlWorktops.LockCompanyRecord;
  try
    try
      with qryCQGetLast do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Contract_Quote_number').AsInteger + 1;
        Close;
      end;
      with qryUpCompany do
      begin
        ParamByName('Last_Contract_Quote_number').Asinteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Contract Quote number:' + #13 + E.Message);
    end;
    end;
  finally
    dtmdlWorktops.FreeCompanyRecord;
  end;
end;

function TdtmdlContract.GetNextContractID: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ParamByName('Operator').Asinteger := frmWTMain.Operator;
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Contract_Quote').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TdtmdlContract.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Contract_Quote ' +
            '(Contract_Quote, Contract_Date, Contract_Quote_Number, Customer, Contract_Description) ' +
            'VALUES(0, 0, 0.00, 1,''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TdtmdlContract.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Contract_Quote Where Contract_Quote = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TdtmdlContract.RefreshAlldata;
var
  sTemp: string;
begin
  sTemp := '';
  with qryAllContracts do
    begin
      sql.Clear;
      sTemp := qryDummy.sql.text;
      if CustomerName <> '' then
        sTemp := sTemp + ' AND Contract_Quote.Customer_name LIKE ''%' + CustomerName + '%''';
      if Description <> '' then
        sTemp := sTemp + ' AND Contract_Quote.Contract_Description LIKE ''%' + Description + '%''';
      if QuoteReference <> '' then
        sTemp := sTemp + ' AND Contract_Quote.Quote_Number LIKE ''' + QuoteReference + '%''';
      if SiteLocation <> '' then
        sTemp := sTemp + ' AND Contract_Quote.Site_Location LIKE ''%' + SiteLocation + '%''';
      if Developer <> '' then
        sTemp := sTemp + ' AND Contract_Quote.Developer LIKE ''%' + Developer + '%''';

      sTemp := sTemp + ' AND ((Contract_Quote.inactive is NULL) or (Contract_Quote.inactive = ''N'') or '
                         + '(Contract_Quote.inactive = ''' + ShowInactive + '''))';

      if TradeRetail = 1 then
        sTemp := sTemp + ' AND (((Customer.Is_Retail_Customer <> ''Y'') AND ((Customer.Is_Commercial_Customer <> ''Y'') OR (Customer.Is_Commercial_Customer IS NULL))))'
      else
      if TradeRetail = 2 then
        sTemp := sTemp + ' AND (Customer.Is_Retail_Customer = ''Y'')'
      else
      if TradeRetail = 3 then
        sTemp := sTemp + ' AND (Customer.Is_Commercial_Customer = ''Y'')' ;


//      sTemp := sTemp + ' ORDER BY Contract_Quote.Contract_Quote desc';

       if SortOrder = '' then
        sTemp := sTemp + ' ORDER BY Contract_Quote.Quote_Number desc'
      else
        sTemp := sTemp + ' ORDER BY ' + SortOrder;

      sql.text := sTemp;
      open;
    end;
end;

function TdtmdlContract.GetCurrentContract: integer;
begin
  if dtsAllContracts.dataset.RecordCount > 0 then
    Result := dtsAllContracts.dataset.FieldByName('Contract_Quote').AsInteger
  else
    Result := 0;
end;

function TdtmdlContract.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (Description <> '') or
            (Developer <> '') or
            (SiteLocation <> '') or
            (OfficeContact <> '') or
            (OperatorName <> '') or
            (QuoteReference <> '') or
            (ShowInactive = 'Y') or
            (ShowLive) then
    result := true
  else
    result := false;
end;

function TdtmdlContract.GetNarrative(const iNarrative: integer): string;
var
  Narrative : TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

procedure TdtmdlContract.SaveNarrative(var iNarrative: Integer;
  const Data: string);
var
  Narrative: TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.DataInfo := Data;
    Narrative.SaveToDB;
    iNarrative := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

procedure TdtmdlContract.RefreshQuoteData;
var
  icount: integer;
begin
  with qryCustQuotes do
    begin
      Close;
      parambyname('Customer').asinteger := customer;
      open;

      icount := recordcount;
    end;
end;

function TdtmdlContract.GetCustomerGroupWorktop(tmpCust,
  tmpGroup: integer): integer;
begin
  Result := 0;

  with qryGetCustomerWorktop do
    begin
      close;
      parambyname('Customer').asinteger := tmpCust;
      parambyname('Group_Number').asinteger := tmpGroup;
      open;
      result := fieldbyname('Worktop').asinteger;
    end;
end;

function TdtmdlContract.GetCustomerGroupSupplier(tmpCust,
  tmpGroup: integer): integer;
begin
  Result := 0;

  with qryGetCustomerSupplier do
    begin
      close;
      parambyname('Customer').asinteger := tmpCust;
      parambyname('Group_Number').asinteger := tmpGroup;
      open;
      result := fieldbyname('Supplier').asinteger;
    end;
end;

function TdtmdlContract.GetCustomerGroupPrice(tmpCust,
  tmpGroup, tmpThickness: integer): double;
var
  sText: string;
begin
  Result := 0;

  with qryGetCustomerPrice do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Customer').asinteger := tmpCust;
      parambyname('Group_Number').asinteger := tmpGroup;
      parambyname('Thickness').asinteger := tmpThickness;
      open;
      result := fieldbyname('Unit_Price').asfloat;
    end;
end;

function TdtmdlContract.GetCustomerGroupCost(tmpCust,
  tmpGroup, tmpThickness: integer): double;
begin
  Result := 0;

  with qryGetCustomerPrice do
    begin
      close;
      parambyname('Customer').asinteger := tmpCust;
      parambyname('Group_Number').asinteger := tmpGroup;
      parambyname('Thickness').asinteger := tmpThickness;
      open;
      result := fieldbyname('Unit_Cost').asfloat;
    end;
end;

function TdtmdlContract.GetCustomerCutOutPrice(tmpCustomer, tmpMaterial, tmpEdgeType, tmpCutOut: integer): double;
var
  sText: string;
begin
  Result := 0;

  with qryGetCustomerCutOutPrice do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Customer').asinteger := tmpCustomer;
      parambyname('Material_Type').asinteger := tmpMaterial;
      parambyname('Edge_Type').asinteger := tmpEdgeType;
      parambyname('CutOut').asinteger := tmpCutOut;
      open;
      if recordcount > 0 then
        result := fieldbyname('Unit_Price').asfloat
      else
        result := -1;
    end;
end;

function TdtmdlContract.GetMaterialCutOutPrice(tmpMaterial,
  tmpEdgeType, tmpCutOut: integer): double;
var
  sText: string;
begin
  Result := 0;

  with qryGetCutOutPrice do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Material_Type').asinteger := tmpMaterial;
      parambyname('Edge_Type').asinteger := tmpEdgeType;
      parambyname('CutOut').asinteger := tmpCutOut;
      open;
      if recordcount > 0 then
        result := fieldbyname('Unit_Price').asfloat
      else
        result := -1;
    end;
end;

function TdtmdlContract.GetCustomerEdgePrice(tmpCustomer, tmpMaterial, tmpEdgeType, tmpEdge: integer): double;
var
  stext: string;
begin
  Result := 0;

  with qryGetCustomerEdgePrice do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Customer').asinteger := tmpCustomer;
      parambyname('Material_Type').asinteger := tmpMaterial;
      parambyname('Edge_Type').asinteger := tmpEdgeType;
      parambyname('Edge_Profile').asinteger := tmpEdge;
      open;
      if recordcount > 0 then
        result := fieldbyname('Unit_Price').asfloat
      else
        result := -1;
    end;
end;

function TdtmdlContract.GetMaterialEdgePrice(tmpMaterial,
  tmpEdgeType, tmpEdge: integer): double;
var
  sText: string;
begin
  Result := 0;

  with qryGetEdgePrice do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Material_Type').asinteger := tmpMaterial;
      parambyname('Edge_Type').asinteger := tmpEdgeType;
      parambyname('Edge_Profile').asinteger := tmpEdge;
      open;
      if recordcount > 0 then
        result := fieldbyname('Unit_Price').asfloat
      else
        result := -1;
    end;
end;

function TdtmdlContract.SetAddress(iAddress: integer; AddName, Street,
  AddLocale, Town, postcode, County, phone, email: string): integer;
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

procedure TdtmdlContract.UpdateQuoteAddress(tempContract, tempQuote, tempCustomer, tempAddress: integer; tempName: string);
begin
  with qryUpContractAddress do
    begin
      close;
//      parambyname('Contract_Quote').asinteger := TempContract;
      parambyname('Customer').asinteger := TempCustomer;
      parambyname('Customer_Name').asstring := tempName;
      parambyname('Original_Address').asinteger := tempAddress;
      parambyname('Address').clear;
      execsql;
    end;

  with qryUpQuoteAddress do
    begin
      close;
//      parambyname('Quote').asinteger := TempQuote;
      parambyname('Customer').asinteger := TempCustomer;
      parambyname('Customer_Name').asstring := tempName;
      parambyname('Original_Address').asinteger := tempAddress;
      parambyname('Address').clear;
      execsql;
    end;

  with qryDelAddress do
    begin
      close;
      parambyname('Address').asinteger := TempAddress;
      execsql;
    end;
end;

function TdtmdlContract.GetMaterialSlabSize(tmpMaterial: integer; var iLength, iDepth: integer): boolean;
begin
  result := false;

  with qryGetMaterialSlab do
    begin
      close;
      parambyname('Material_Type').asinteger := tmpMaterial;
      parambyname('Length').asinteger := iLength;
      open;
      if recordcount > 0 then
        begin
          iLength := fieldbyname('Length').asinteger;
          iDepth := fieldbyname('Depth').asinteger;
          Result := true;
        end;
    end;
end;

{ TContractLine }

function TContractLine.Clone: TContractLine;
begin
  Result :=                   TContractLine.Create(FParent);
  Result.DrawingNumber  :=    self.DrawingNumber;
  Result.Line           :=    self.Line;
  Result.NumberofUnits  :=    self.NumberOfUnits;
  Result.SupplierReference := self.SupplierReference;
  Result.FContractOptions.Free;
  Result.FContractOptions :=  Self.FContractOptions.Clone;
end;

procedure TContractLine.Clear;
begin
  FContractOptions.Clear;
end;

constructor TContractLine.Create(Contract: TContract);
begin
  FParent := Contract;
  FContractOptions  := TContractOptions.Create(Self);
end;

procedure TContractLine.DeleteFromDB;
begin
  with parent.FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Contract_Quote_Line WHERE Contract = ' + IntToStr(parent.DbKey) + ' AND Line_Number = ' + inttostr(self.Line));
    ExecSQL;
  end;
end;

destructor TContractLine.Destroy;
begin
  FContractOptions.Free;
  inherited;
end;

procedure TContractLine.LoadFromDB;
begin

end;

procedure TContractLine.LoadOptions;
begin

end;

procedure TContractLine.SaveOptions;
var
  i: integer;
begin
  FContractOptions.Renumber;
  for i := 0 to Pred(FContractOptions.Count) do
    begin
      if ((parent.ContractMode = cqCopy) or (parent.ContractMode = cqRequote)) and (FContractOptions[i].Quote <> 0) then
        FContractOptions[i].CopyQuote;

      FContractOptions[i].SaveToDB;
    end;
end;

procedure TContractLine.SaveToDB;
begin
  with FParent.FDataModule.qryCQAddLine do
  begin
    close;
    ParamByName('Contract_Quote').AsInteger := FParent.DbKey;
    ParamByName('Line_Number').AsInteger := Line;
    ParambyName('Drawing_Number').asstring := DrawingNumber;
    ParambyName('Supplier_Reference').asstring := SupplierReference;
    ParambyName('Number_of_Units').asinteger := NumberOfUnits;
    ExecSQL;
  end;
  dtmdlWorktops.CreateContractDocDirectory(floattostr(parent.QuoteNumber) + '\' + inttostr(self.Line));

  if (parent.ContractMode = cqCopy) or (parent.ContractMode = cqRequote)then
    begin
      dtmdlCopyQuote := TdtmdlQuote.create(parent.FDataModule);

      try
        SaveOptions;
      finally
        dtmdlCopyQuote.free;
      end;
      
    end
  else
    SaveOptions;
end;

procedure TContractLine.SetDrawingNumber(const Value: string);
begin
  FDrawingNumber := Value;
end;

procedure TContractLine.SetLine(const Value: integer);
begin
  FLine := Value;
end;

procedure TContractLine.SetMode(const Value: string);
begin
  FMode := Value;
end;

procedure TContractLine.SetParent(const Value: TContract);
begin
  FParent := Value;
end;

procedure TContractLine.SetSupplierReference(const Value: string);
begin
  FSupplierReference := Value;
end;

procedure TContractLine.SetNumberOfUnits(const Value: integer);
begin
  FNumberOfUnits := Value;
end;

{ TContractLines }

procedure TContractLines.Add(aLine: TContractLine);
begin
  FItems.Add(aLine);
end;

procedure TContractLines.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TContractLine(FItems[i]).Free;
end;

function TContractLines.Clone: TContractLines;
var
  i : integer;
begin
  Result := TContractLines.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TContractLine(FItems[i]).Clone);
end;

constructor TContractLines.Create(Contract: TContract);
begin
  FParent := Contract;
  FItems := TList.Create;
end;

procedure TContractLines.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TContractLines.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TContractLine(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TContractLines.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TContractLines.GetItems(Index: integer): TContractLine;
begin
  Result := TContractLine(FItems[Index]);
end;

function TContractLines.IndexOf(const LineNumber: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TContractLine(FItems[i]).Line = LineNumber then
      Result := i;
end;

procedure TContractLines.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TContractLine(FItems[i]).Line:= (i+1);
end;

procedure TContractLines.SetItems(Index: integer;
  const Value: TContractLine);
begin
  FItems[Index] := Value;
end;

{ TContractOption }

function TContractOption.Clone: TContractOption;
begin
  Result :=                   TContractOption.Create(FParent);
  Result.DeliveryPrice  :=    self.DeliveryPrice;
  Result.Description    :=    self.Description;
  Result.DiscountValue  :=    self.DiscountValue;
  Result.Group          :=    self.Group;
  Result.Incompatible   :=    self.Incompatible;
  Result.InstallPrice   :=    self.InstallPrice;
  Result.MarkupValue    :=    self.MarkupValue;
  Result.MaterialType   :=    self.MaterialType;
  Result.NettPrice      :=    self.NettPrice;
  Result.OptionNumber   :=    self.OptionNumber;
  Result.OriginalQuote  :=    self.OriginalQuote;
  Result.Quote          :=    self.Quote;
  Result.Quotedescription :=  self.Quotedescription;
  Result.QuoteMarkup    :=    self.QuoteMarkup;
  Result.SurveyPrice    :=    self.SurveyPrice;
  Result.Thickness      :=    self.Thickness;
end;

procedure TContractOption.CopyQuote;
var
  aQuote: TQuote;
begin
  aQuote := TQuote.Create(dtmdlCopyQuote);
  try
    self.OriginalQuote := self.Quote;
    aQuote.DbKey := self.Quote;
    aQuote.qMode := qChange;
    aQuote.LoadFromDB;
    aQuote.QMode := qAdd;
    aQuote.dbkey := 0;
    aQuote.QDate := date;
    aQuote.DateRequired := date;
    aQuote.ContractQuoteNumber := self.Parent.Parent.dbKey;
    aQuote.ContractLine := self.Parent.Line;
    aQuote.ContractOption := self.OptionNumber;
    aQuote.SaveToDB(true);
    self.Quote := aQuote.dbKey;
  finally
    aQuote.free;
  end;
end;

constructor TContractOption.Create(ContractLine: TContractLine);
begin                
  FParent := ContractLine;
end;

destructor TContractOption.Destroy;
begin
  inherited;
end;

procedure TContractOption.SaveToDB;
begin
  with FParent.FParent.FDataModule.qryCQLAddOption do
  begin
    close;
    ParamByName('Contract_Quote').AsInteger := FParent.FParent.DbKey;
    ParamByName('Line_Number').AsInteger := FParent.Line;
    ParambyName('Option_Number').asinteger := self.OptionNumber;
    ParambyName('Group_Number').AsInteger := Group;
    ParamByName('Option_description').Asstring := Description;
    if Quote = 0 then
      ParambyName('Quote').clear
    else
      ParambyName('Quote').asinteger := Quote;
    ParambyName('Original_Quote').asinteger := OriginalQuote;
    Parambyname('Quote_Description').asstring := QuoteDescription;
    ParambyName('Nett_Price').asfloat := NettPrice;
    ParambyName('Installation_Price').asfloat := InstallPrice;
    ParambyName('Delivery_Price').asfloat := DeliveryPrice;
    ParambyName('Discount_Value').asfloat := DiscountValue;
    ParambyName('Markup_Value').asfloat := MarkupValue;
    ParambyName('Survey_Price').asfloat := SurveyPrice;
    if Thickness = 0 then
      ParambyName('Thickness').clear
    else
      ParambyName('Thickness').asinteger := Thickness;
    ParambyName('Markup_Percentage').asfloat := QuoteMarkup;
    ExecSQL;
  end;
end;

procedure TContractOption.SetDeliveryPrice(const Value: currency);
begin
  FDeliveryPrice := Value;
end;

procedure TContractOption.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TContractOption.SetDiscountValue(const Value: currency);
begin
  FDiscountValue := Value;
end;

procedure TContractOption.SetGroup(const Value: integer);
begin
  FGroup := Value;
end;

procedure TContractOption.SetIncompatible(const Value: boolean);
begin
  FIncompatible := Value;
end;

procedure TContractOption.SetInstallPrice(const Value: currency);
begin
  FInstallPrice := Value;
end;

procedure TContractOption.SetMarkupValue(const Value: currency);
begin
  FMarkupValue := Value;
end;

procedure TContractOption.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TContractOption.SetNettPrice(const Value: currency);
begin
  FNettPrice := Value;
end;

procedure TContractOption.SetOptionNumber(const Value: integer);
begin
  FOptionNumber := Value;
end;

procedure TContractOption.SetOriginalQuote(const Value: integer);
begin
  FOriginalQuote := Value;
end;

procedure TContractOption.SetQuote(const Value: integer);
begin
  FQuote := Value;
end;

procedure TContractOption.SetQuotedescription(const Value: string);
begin
  FQuotedescription := Value;
end;

procedure TContractOption.SetQuoteMarkup(const Value: double);
begin
  FQuoteMarkup := Value;
end;

procedure TContractOption.SetSurveyPrice(const Value: currency);
begin
  FSurveyPrice := Value;
end;

procedure TContractOption.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

{ TContractOptions }

procedure TContractOptions.Add(aOption: TContractOption);
begin
  FItems.Add(aOption);
end;

procedure TContractOptions.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TContractOption(FItems[i]).Free;
end;

function TContractOptions.Clone: TContractOptions;
var
  i : integer;
begin
  Result := TContractOptions.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TContractOption(FItems[i]).Clone);
end;

constructor TContractOptions.Create(ContractLine: TContractLine);
begin
  FParent := ContractLine;
  FItems := TList.Create;
end;

procedure TContractOptions.Delete(const Index: integer);
begin
  try
    FItems.Delete(Index);
  except
  end;
end;

destructor TContractOptions.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TContractOption(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TContractOptions.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TContractOptions.GetItems(Index: integer): TContractOption;
begin
  Result := TContractOption(FItems[Index]);
end;

function TContractOptions.IndexOf(const OptionNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TContractOption(FItems[i]).OptionNumber = OptionNo then
      Result := i;
end;

procedure TContractOptions.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TContractOption(FItems[i]).OptionNumber := (i+1);
end;

procedure TContractOptions.SetItems(Index: integer;
  const Value: TContractOption);
begin
  FItems[Index] := Value;
end;

{ TContractEvents }

procedure TContractEvents.Add(aEvent: TContractEvent);
begin
  FItems.Add(aEvent);
end;

procedure TContractEvents.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TContractEvent(FItems[i]).Free;
end;

function TContractEvents.Clone: TContractEvents;
var
  i : integer;
begin
  Result := TContractEvents.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TContractEvent(FItems[i]).Clone);
end;

constructor TContractEvents.Create(Contract: TContract);
begin
  FParent := Contract;
  FItems := TList.Create;
end;

procedure TContractEvents.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TContractEvents.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TContractEvent(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TContractEvents.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TContractEvents.GetItems(Index: integer): TContractEvent;
begin
  Result := TContractEvent(FItems[Index]);
end;

function TContractEvents.IndexOf(const EventNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TContractEvent(FItems[i]).EventNumber = EventNo then
      Result := i;
end;

procedure TContractEvents.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TContractEvent(FItems[i]).EventNumber:= (i+1);
end;

procedure TContractEvents.SetItems(Index: integer;
  const Value: TContractEvent);
begin
  FItems[Index] := Value;
end;

{ TContractEvent }

function TContractEvent.Clone: TContractEvent;
begin
  Result := TContractEvent.Create(FParent);
  Result.EventNumber    :=           self.EventNumber;
  Result.DateEntered    :=           self.DateEntered;
  Result.operator       :=           Self.Operator;
  Result.OperatorName   :=           self.OperatorName; 
  Result.Narrative      :=           Self.Narrative;
end;

constructor TContractEvent.Create(Contract: TContract);
begin
  FParent := Contract;
  FNarrative := TNotes.Create;
end;

destructor TContractEvent.Destroy;
begin
  FNarrative.Free;
  inherited;
end;

procedure TContractEvent.SaveToDB;
begin
  Narrative.SavetoDB;
  with FParent.FDataModule.qryCQAddEvent do
  begin
    ParamByName('Contract_Quote').AsInteger := FParent.DbKey;
    ParamByName('Internal_Note').AsInteger := EventNumber;
    ParamByName('Operator').asinteger := Operator;
    Parambyname('Date_Time_Entered').Asdatetime := DateEntered;
    Parambyname('Narrative').asinteger := Narrative.dbKey;
    ExecSQL;
  end;
end;

procedure TContractEvent.SetDateEntered(const Value: TDateTime);
begin
  FDateEntered := Value;
end;

procedure TContractEvent.SetEventNumber(const Value: integer);
begin
  FEventNumber := Value;
end;

procedure TContractEvent.SetNarrative(const Value: TNotes);
begin
  FNarrative := Value;
end;

procedure TContractEvent.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TContractEvent.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TContractEvent.SetParent(const Value: TContract);
begin
  FParent := Value;
end;

end.
