unit PBContractDM;

interface

uses
  SysUtils, Classes, DB, CCSCommon, ActiveX,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TConMode   = (conAdd, conChange, conDelete, conCopy, conRequote, conView);

  TdtmdlContract = class(TDataModule)
    qryGetContract: TFDQuery;
    qryZero: TFDQuery;
    AddSQL: TFDQuery;
    GetLastSQL: TFDQuery;
    qryUpContract: TFDQuery;
    qryContractGrid: TFDQuery;
    dtsContractGrid: TDataSource;
    qryContractBase: TFDQuery;
    qryContacts: TFDQuery;
    dtsContacts: TDataSource;
    qryPeriodType: TFDQuery;
    dtsPeriodType: TDataSource;
    qryPaymentTerms: TFDQuery;
    dtsPaymentTerms: TDataSource;
    qryAddContract: TFDQuery;
    qryVersionCount: TFDQuery;
    qryGetLastContractNo: TFDQuery;
    qryUpCompany: TFDQuery;
    qryJobBags: TFDQuery;
    dtsJobBags: TDataSource;
    qryDeleteJobBag: TFDQuery;
    qryPurchaseOrders: TFDQuery;
    dtsPurchaseOrders: TDataSource;
    qryDeletePO: TFDQuery;
    qryGetdbKey: TFDQuery;
    qrySalesInvoices: TFDQuery;
    dtsSalesInvoices: TDataSource;
    qryAllSalesInvoiceCharges: TFDQuery;
    qrySalesInvoicesSales_Invoice: TIntegerField;
    qrySalesInvoicesSales_Invoice_No: TWideStringField;
    qrySalesInvoicesInvoice_Date: TDateTimeField;
    qrySalesInvoicesInvoice_Description: TWideStringField;
    qrySalesInvoicesInvoice_or_Credit: TWideStringField;
    qrySalesInvoicesGoods_Value: TFloatField;
    qrySalesInvoicesVat_Value: TFloatField;
    qrySalesInvoicesTotal_Value: TFloatField;
    procedure qrySalesInvoicesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    function GetNextContractNumber: integer;
    function GetHeaderCount: integer;
    function GetHeaderJobCount: integer;
    function GetHeaderPOCount: integer;
  public
    AccountMgr: string;
    ContractDate: TDateTime;
    BranchName: string;
    ContactName: string;
    CreatedByName: string;
    CreatedBy: integer;
    Customer: integer;
    CustomerName: string;
    DateCreated: TDateTime;
    DateRequired: TDateTime;
    Description: string;
    DueDate: TDateTime;
    Operator: integer;
    OperatorName: string;
    QuantityDesc: string;
    MinimumQuantityDesc: string;
    Reference: string;
    Rep: integer;
    RepName: string;
    RepIsSubRep: boolean;
    SubRepName: string;
    ShowCompleted: boolean;
    ShowInactive: string;
    ShowLive: boolean;
    ShowOnlyLive: boolean;
    ShowWIP: boolean;
    SortType: string;
    SortOrder: string;
    Status: string;
    function GetJobBagTotalSalesInvoiced(tempCode: integer): real;
    property HeaderCount: integer read GetHeaderCount;
    property HeaderJobCount: integer read GetHeaderJobCount;
    property HeaderPOCount: integer read GetHeaderPOCount;
    procedure RefreshData;
    function UsingSearch: boolean;
  end;

  TContract = class
  private
    FBranch: integer;
    FOperator: integer;
    FNarrative: integer;
    FContactNo: integer;
    FPaymentTerms: integer;
    FTermAfterInitialPeriod: integer;
    FReviewPeriodType: integer;
    FQuantity: integer;
    Fdbkey: integer;
    FDuration: integer;
    FOfficeContact: integer;
    FMinimumQuantity: integer;
    FRep: integer;
    FSubRep: integer;
    FTermAfterInitialPeriodType: integer;
    FTerminationNoticePeriod: integer;
    FCustomer: integer;
    FTerminationNoticePeriodType: integer;
    FDurationPeriodType: integer;
    FReviewPeriod: integer;
    FCustOrderNo: string;
    FNarrativeText: string;
    FCustomerName: string;
    FOfficeContactName: string;
    FOperatorName: string;
    FBranchName: string;
    FSubRepName: string;
    FDescription: string;
    FRepName: string;
    FDate: TDateTime;
    FDataModule: TdtmdlContract;
    FContactName: string;
    FOriginalContract: integer;
    FContractNumber: double;
    FStatus: integer;
    FStatusDescr: string;
    FinactiveReason: integer;
    Finactive: string;
    FReference: string;
    FExpiryDate: TDateTime;
    FEffectiveDate: TDateTime;
    FMode: TConMode;
    FFrequencyPeriodType: integer;
    FFrequency: integer;
    function GetNextContractVersionNumber: real;
    procedure SetBranch(const Value: integer);
    procedure SetBranchName(const Value: string);
    procedure SetContactNo(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetCustOrderNo(const Value: string);
    procedure SetDate(const Value: TDateTime);
    procedure Setdbkey(const Value: integer);
    procedure SetDescription(const Value: string);
    procedure SetDuration(const Value: integer);
    procedure SetDurationPeriodType(const Value: integer);
    procedure SetMinimumQuantity(const Value: integer);
    procedure SetNarrative(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetOfficeContact(const Value: integer);
    procedure SetOfficeContactName(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetPaymentTerms(const Value: integer);
    procedure SetQuantity(const Value: integer);
    procedure SetRep(const Value: integer);
    procedure SetRepName(const Value: string);
    procedure SetReviewPeriod(const Value: integer);
    procedure SetReviewPeriodType(const Value: integer);
    procedure SetSubRep(const Value: integer);
    procedure SetSubRepName(const Value: string);
    procedure SetTermAfterInitialPeriod(const Value: integer);
    procedure SetTermAfterInitialPeriodType(const Value: integer);
    procedure SetTerminationNoticePeriod(const Value: integer);
    procedure SetTerminationNoticePeriodType(const Value: integer);
    procedure SetContactName(const Value: string);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SetOriginalContract(const Value: integer);
    procedure SetContractNumber(const Value: double);
    procedure SetStatus(const Value: integer);
    procedure SetStatusDescr(const Value: string);
    procedure SetExpiryDate(const Value: TDateTime);
    procedure Setinactive(const Value: string);
    procedure SetinactiveReason(const Value: integer);
    procedure SetReference(const Value: string);
    procedure SetEffectiveDate(const Value: TDateTime);
    procedure SetMode(const Value: TConMode);
    procedure SetFrequency(const Value: integer);
    procedure SetFrequencyPeriodType(const Value: integer);
  public
    constructor Create(DataModule : TdtmdlContract);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TContract;
    function GetdbKey: integer;
    procedure DeleteFromDB;
    procedure LoadFromDB;
    procedure SaveToDB(TempAll: boolean);
    property Branch: integer read FBranch write SetBranch;
    property BranchName : string read FBranchName write SetBranchName;
    property ContactNo: integer read FContactNo write SetContactNo;
    property ContactName: string read FContactName write SetContactName;
    property ContractNumber: double read FContractNumber write SetContractNumber;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property CustOrderNo: string read FCustOrderNo write SetCustOrderNo;
    property DataModule: TdtmdlContract read FDataModule;
    property Date : TDateTime read FDate write SetDate;
    property Description : string read FDescription write SetDescription;
    property Duration: integer read FDuration write SetDuration;
    property DurationPeriodType: integer read FDurationPeriodType write SetDurationPeriodType;
    property dbkey: integer read Fdbkey write Setdbkey;
    property EffectiveDate: TDateTime read FEffectiveDate write SetEffectiveDate;
    property ExpiryDate: TDateTime read FExpiryDate write SetExpiryDate;
    property Frequency: integer read FFrequency write SetFrequency;
    property FrequencyPeriodType: integer read FFrequencyPeriodType write SetFrequencyPeriodType;
    property inactive: string read Finactive write Setinactive;
    property inactiveReason: integer read FinactiveReason write SetinactiveReason;
    property MinimumQuantity: integer read FMinimumQuantity write SetMinimumQuantity;
    property Mode: TConMode read FMode write SetMode;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property OfficeContact: integer read FOfficeContact write SetOfficeContact;
    property OfficeContactName: string read FOfficeContactName write SetOfficeContactName;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property OriginalContract: integer read FOriginalContract write SetOriginalContract;
    property PaymentTerms: integer read FPaymentTerms write SetPaymentTerms;
    property Quantity: integer read FQuantity write SetQuantity;
    property Reference: string read FReference write SetReference;
    property Rep: integer read FRep write SetRep;
    property RepName: string read FRepName write SetRepName;
    property ReviewPeriod: integer read FReviewPeriod write SetReviewPeriod;
    property ReviewPeriodType: integer read FReviewPeriodType write SetReviewPeriodType;
    property Status: integer read FStatus write SetStatus;
    property StatusDescription: string read FStatusDescr write SetStatusDescr;
    property SubRep: integer read FSubRep write SetSubRep;
    property SubRepName: string read FSubRepName write SetSubRepName;
    property TerminationNoticePeriod: integer read FTerminationNoticePeriod write SetTerminationNoticePeriod;
    property TerminationNoticePeriodType: integer read FTerminationNoticePeriodType write SetTerminationNoticePeriodType;
    property TermAfterInitialPeriod: integer read FTermAfterInitialPeriod write SetTermAfterInitialPeriod;
    property TermAfterInitialPeriodType: integer read FTermAfterInitialPeriodType write SetTermAfterInitialPeriodType;
  end;

var
  dtmdlContract: TdtmdlContract;

implementation

uses pbDatabase, PBMainMenu;

{$R *.dfm}

{ TContract }

procedure TContract.Clear;
begin

end;

function TContract.Clone: TContract;
begin
  Result := TContract.Create(FDataModule);
  Result.Branch   := self.Branch;
  Result.BranchName  :=  self.BranchName;
  Result.ContactNo  :=  self.ContactNo;
  Result.ContactName  :=  self.ContactName;
  Result.ContractNumber :=  self.ContractNumber;
  Result.Customer := self.Customer;
  Result.CustomerName :=  self.CustomerName;
  Result.CustOrderNo  :=  self.CustOrderNo;
  Result.Date   :=  self.Date;
  Result.Description  :=  self.Description;
  Result.Duration :=  self.Duration;
  Result.DurationPeriodType :=  self.DurationPeriodType;
  Result.EffectiveDate  :=  self.EffectiveDate;
  Result.Frequency :=  self.Frequency;
  Result.FrequencyPeriodType :=  self.FrequencyPeriodType;
  Result.MinimumQuantity    :=  self.MinimumQuantity;
  Result.Narrative    :=  self.Narrative;
  Result.NarrativeText  :=  self.NarrativeText;
  Result.OfficeContact  :=  self.OfficeContact;
  Result.OfficeContactName  :=  self.OfficeContactName;
  Result.Operator   :=  self.Operator;
  Result.OperatorName   :=  self.OperatorName;
  Result.OriginalContract   := self.OriginalContract;
  Result.PaymentTerms   :=  self.PaymentTerms;
  Result.Quantity   :=  self.PaymentTerms;
  Result.Rep    :=  self.Rep;
  Result.RepName  :=  self.RepName;
  Result.ReviewPeriod   :=  self.ReviewPeriod;
  Result.ReviewPeriodType   :=  self.ReviewPeriodType;
  Result.Status     :=  self.status;
  Result.StatusDescription  :=  self.StatusDescription;
  Result.SubRep   :=  self.SubRep;
  Result.SubRepName   :=  self.SubRepName;
  Result.TerminationNoticePeriod  :=  self.TerminationNoticePeriod;
  Result.TerminationNoticePeriodType  :=  self.TerminationNoticePeriodType;
  Result.TermAfterInitialPeriod   :=  self.TermAfterInitialPeriod;
  Result.TermAfterInitialPeriodType :=  self.TermAfterInitialPeriodType;
end;

constructor TContract.Create(DataModule: TdtmdlContract);
begin
  FDataModule := DataModule;
end;

procedure TContract.DeleteFromDB;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Contract_Purchase_Order WHERE Contract =' + IntToStr(DbKey));
    ExecSQL;
  end;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Contract_Job_Bag WHERE Contract =' + IntToStr(DbKey));
    ExecSQL;
  end;

  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Contract WHERE Contract =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

destructor TContract.Destroy;
begin
  inherited;
end;

procedure TContract.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with FDataModule.qryZero do
  begin
    SQL.Clear;
(*    SQL.Add('Insert Into Activity ' +
            '(Activity, Activity_Type, Activity_Subject, Date_Time_Entered, Start_Date_Time, Due_Date_Time, Activity_Status,' +
            ' Activity_Priority, Operator, Narrative) ' +
            'VALUES(' + '0,' + inttoStr(ActivityType) + ',' + '''' + self.Subject + ''',' + '0,' + '0,' +
              '0,' + inttostr(Status) + ',' + inttoStr(Priority) + ',' + inttostr(Operator) + ',' + '0' + ')');
*)
    try
      ExecSQL;
    except
    end;
  end;
end;

function TContract.GetNextKey: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with FDataModule.AddSQL do
    begin
(*      Close ;
      ParamByName('Activity_type').AsInteger := ActivityType;
      ParamByName('Activity_Subject').AsString := GuidToString(aGuid);
      ParamByName('Date_Time_Entered').AsDateTime := DateTimeEntered;
      ParamByName('Start_Date_Time').AsDateTime := StartDateTime;
      ParamByName('Due_Date_Time').AsDateTime := DueDateTime;
      ParamByName('Activity_Status').AsInteger := Status;
      ParamByName('Activity_Priority').AsInteger := Priority;
      ParamByName('Operator').AsInteger := Operator;
      ParamByName('Narrative').AsInteger := Narrative;
      ExecSQL;
*)
    end;
    with FDataModule.GetLastSQL do
    begin
      Close;
      ParamByName('Event_Guid').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Activity').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TContract.DeleteZero;
begin
  with FdataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Contract Where Contract = 0 ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TContract.LoadFromDB;
begin
  { Load the header record then all lines belonging to the sales invoice }
  Clear;
  with FDataModule.qryGetContract do
  begin
    Close;
    ParamByName('Contract').AsInteger := DbKey;
    Open;
    Branch                   := FieldByName('Branch_no').asinteger;
    BranchName               := FieldByName('Branch_Name').asstring;
    ContactNo                := FieldByName('Contact_no').asinteger;
    ContactName              := FieldByName('Contact_Name').asstring;

    ContractNumber           := FieldByName('Contract_Number').asfloat;
    Customer                 := FieldByName('Customer').asinteger;
    CustomerName             := FieldByName('Customer_Name').asstring;
    CustOrderNo              := Fieldbyname('Cust_Order_No').asstring;
    Date                     := FieldByName('Date_Point').asDateTime;
    Description              := FieldByName('Description').asstring;
    ExpiryDate               := FieldByName('Expiry_Date').asDateTime;
    EffectiveDate            := FieldByName('Date_Effective').asDateTime;

    if FieldByName('Duration_Mths').asinteger = 0 then
      Duration                 := 1
    else
      Duration                 := FieldByName('Duration_Mths').asinteger;

    DurationPeriodType       := FieldByName('Duration_Period_Type').asinteger;

    if FieldByName('Frequency_Period').asinteger = 0 then
      Frequency                 := 1
    else
      Frequency                 := FieldByName('Frequency_Period').asinteger;
      
    FrequencyPeriodType       := FieldByName('Frequency_Period_Type').asinteger;

    inactive                 := FieldByName('inactive').asstring;
    inactiveReason           := FieldByName('inactive_Reason').asinteger;
    MinimumQuantity          := FieldByName('Minimum_Quantity').asinteger;

    Narrative                := FieldByName('Notes').asinteger;
    NarrativeText            := dmBroker.GetNarrative(Narrative);
    OfficeContact            := FieldByName('Office_Contact').asinteger;
    OfficeContactName        := FieldByName('Office_Contact_Name').asstring;
    Operator                 := FieldByName('Operator').asinteger;
    OperatorName             := FieldByName('Operator_Name').asstring;
    OriginalContract         := FieldByName('Original_Contract').asinteger;

    PaymentTerms             := fieldbyname('Payment_Terms').asinteger;
    Quantity                 := FieldByName('Quantity').asinteger;
    Reference                := FieldByName('Reference').asstring;
    Rep                      := FieldByName('Rep').asinteger;
    RepName                  := FieldByName('Rep_Name').asstring;

    ReviewPeriod             := fieldbyname('Review_Period').asinteger;
    ReviewPeriodType         := FieldByName('Review_Period_Type').asinteger;

    Status                   := FieldByName('Contract_Status').asinteger;
    StatusDescription        := FieldByName('Status_Description').asstring;

    SubRep                   := FieldByName('Sub_Rep').asinteger;
    SubRepName               := FieldByName('Sub_Rep_Name').asstring;

    TerminationNoticePeriod  := fieldbyname('Termination_Notice_Period').asinteger;
    TerminationNoticePeriodType
                             := FieldByName('Termination_Notice_Period_Type').asinteger;
    TermAfterInitialPeriod  := fieldbyname('Term_After_Initial_Period').asinteger;
    TermAfterInitialPeriodType
                             := FieldByName('Term_After_Initial_Period_Type').asinteger;
  end;

end;

procedure TContract.SaveToDB(TempAll: boolean);
var
  iTempNarr: integer;
  ContractNumber: real;
begin
  if DbKey = 0 then
    begin
      with FDataModule.qryAddContract do
        begin
          Parambyname('Customer').asinteger         := Customer;
          Parambyname('Branch_no').asinteger       := Branch;
          Parambyname('Contact_no').asinteger      := ContactNo;

          Parambyname('Date_Point').asdatetime     := self.Date;
          Parambyname('Date_Effective').asdatetime     := self.EffectiveDate;
          Parambyname('Expiry_Date').asdatetime     := self.ExpiryDate;

          Parambyname('Cust_Order_no').asstring     := self.CustOrderNo;
          Parambyname('Reference').asstring     := self.Reference;

          Parambyname('Description').asstring    := self.Description;

          Parambyname('Rep').asinteger              := Rep;
          Parambyname('Sub_Rep').asinteger          := SubRep;

          Parambyname('Operator').asinteger         := frmPBMainMenu.iOperator;
          Parambyname('Office_Contact').asinteger   := OfficeContact;

          Parambyname('Quantity').asinteger         := Quantity;
          Parambyname('Minimum_Quantity').asinteger   := self.MinimumQuantity;

          Parambyname('Duration_mths').asinteger    := self.Duration;
          if self.Duration = 0 then
            begin
              Parambyname('Duration_Period_Type').clear
            end
          else
            begin
              Parambyname('Duration_Period_Type').asinteger    := self.DurationPeriodType;
            end;

          Parambyname('Frequency_Period').asinteger    := self.Frequency;
          if self.Frequency = 0 then
            begin
              Parambyname('Frequency_Period_Type').clear
            end
          else
            begin
              Parambyname('Frequency_Period_Type').asinteger    := self.FrequencyPeriodType;
            end;

          Parambyname('Termination_Notice_Period').asinteger    := self.TerminationNoticePeriod;
          if self.TerminationNoticePeriod = 0 then
            begin
              Parambyname('Termination_Notice_Period_Type').clear
            end
          else
            begin
              Parambyname('Termination_Notice_Period_Type').asinteger    := self.TerminationNoticePeriodType;
            end;

          Parambyname('Term_After_Initial_Period').asinteger    := self.TermAfterInitialPeriod;
          if self.TermAfterInitialPeriodType = 0 then
            begin
              Parambyname('Term_After_Initial_Period_Type').clear
            end
          else
            begin
              Parambyname('Term_After_Initial_Period_Type').asinteger    := self.TermAfterInitialPeriodType;
            end;

          Parambyname('Review_Period').asinteger    := self.ReviewPeriod;
          if self.ReviewPeriodType = 0 then
            begin
              Parambyname('Review_Period_Type').clear
            end
          else
            begin
              Parambyname('Review_Period_Type').asinteger    := self.ReviewPeriodType;
            end;

          if PaymentTerms = 0 then
            Parambyname('Payment_Terms').clear
          else
            Parambyname('Payment_Terms').asinteger    := self.PaymentTerms;

          Parambyname('inactive').asstring    := 'N';
          Parambyname('inactive_reason').clear;

          Parambyname('Contract_Status').asinteger    := 10;

          if (Mode = conAdd) or (Mode = conCopy) then
            begin
              ContractNumber := FDataModule.GetNextContractNumber;
              Parambyname('Contract_Number').asfloat   := ContractNumber;
              Parambyname('Original_Contract').asinteger := trunc(ContractNumber);

              OriginalContract := trunc(ContractNumber);
              self.ContractNumber := ContractNumber;
            end
          else
          if (Mode = conReQuote) then
            begin
              ContractNumber := GetNextContractVersionNumber;
              Parambyname('Contract_Number').asfloat := ContractNumber;
              Parambyname('Original_Contract').asinteger := trunc(ContractNumber);
              self.ContractNumber := ContractNumber;
            end
          else
            begin
              Parambyname('Contract_Number').asfloat   := ContractNumber;
              Parambyname('Original_Contract').asinteger := OriginalContract;
            end;

          {Save the narrative}
          iTempNarr := Narrative;
          dmBroker.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Notes').clear
          else
            ParamByName('Notes').Asinteger := Narrative;
          ExecSQL;
        end;
      dmBroker.CreateContractDocDirectory(floattostr(ContractNumber));
      dbkey := GetdbKey;
    end
  else
    begin
      with FDataModule.qryUpContract do
        begin
          Parambyname('Contract').asinteger         := self.dbkey;

          Parambyname('Customer').asinteger         := Customer;
          Parambyname('Branch_no').asinteger       := Branch;
          Parambyname('Contact_no').asinteger      := ContactNo;

          Parambyname('Date_Point').asdatetime     := self.Date;
          Parambyname('Date_Effective').asdatetime     := self.EffectiveDate;
          Parambyname('Expiry_Date').asdatetime     := self.ExpiryDate;

          Parambyname('Cust_Order_no').asstring     := self.CustOrderNo;
          Parambyname('Reference').asstring     := self.Reference;

          Parambyname('Description').asstring    := self.Description;

          Parambyname('Rep').asinteger              := Rep;
          Parambyname('Sub_Rep').asinteger          := SubRep;

          Parambyname('Office_Contact').asinteger   := OfficeContact;

          Parambyname('Quantity').asinteger         := Quantity;
          Parambyname('Minimum_Quantity').asinteger   := self.MinimumQuantity;

          Parambyname('Duration_mths').asinteger    := self.Duration;
          if self.Duration = 0 then
            begin
              Parambyname('Duration_Period_Type').clear
            end
          else
            begin
              Parambyname('Duration_Period_Type').asinteger    := self.DurationPeriodType;
            end;

          Parambyname('Frequency_Period').asinteger    := self.Frequency;
          if self.Frequency = 0 then
            begin
              Parambyname('Frequency_Period_Type').clear
            end
          else
            begin
              Parambyname('Frequency_Period_Type').asinteger    := self.FrequencyPeriodType;
            end;

          Parambyname('Termination_Notice_Period').asinteger    := self.TerminationNoticePeriod;
          if self.TerminationNoticePeriod = 0 then
            begin
              Parambyname('Termination_Notice_Period_Type').clear
            end
          else
            begin
              Parambyname('Termination_Notice_Period_Type').asinteger    := self.TerminationNoticePeriodType;
            end;

          Parambyname('Term_After_Initial_Period').asinteger    := self.TermAfterInitialPeriod;
          if self.TermAfterInitialPeriodType = 0 then
            begin
              Parambyname('Term_After_Initial_Period_Type').clear
            end
          else
            begin
              Parambyname('Term_After_Initial_Period_Type').asinteger    := self.TermAfterInitialPeriodType;
            end;

          Parambyname('Review_Period').asinteger    := self.ReviewPeriod;
          if self.ReviewPeriodType = 0 then
            begin
              Parambyname('Review_Period_Type').clear
            end
          else
            begin
              Parambyname('Review_Period_Type').asinteger    := self.ReviewPeriodType;
            end;

          if PaymentTerms = 0 then
            Parambyname('Payment_Terms').clear
          else
            Parambyname('Payment_Terms').asinteger    := self.PaymentTerms;

          Parambyname('inactive').asstring    := 'N';
          Parambyname('inactive_reason').clear;

          Parambyname('Contract_Status').asinteger    := self.Status;

          {Save the narrative}
          iTempNarr := Narrative;
          dmBroker.SaveNarrative(iTempNarr,NarrativeText);
          Narrative := iTempNarr;
          if Narrative = 0 then
            ParamByName('Notes').clear
          else
            ParamByName('Notes').Asinteger := Narrative;
          ExecSQL;
        end;
    end
end;

procedure TContract.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TContract.SetBranchName(const Value: string);
begin
  FBranchName := Value;
end;

procedure TContract.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TContract.SetContactNo(const Value: integer);
begin
  FContactNo := Value;
end;

procedure TContract.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TContract.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TContract.SetCustOrderNo(const Value: string);
begin
  FCustOrderNo := Value;
end;

procedure TContract.SetDate(const Value: TDateTime);
begin
  FDate := Value;
end;

procedure TContract.Setdbkey(const Value: integer);
begin
  Fdbkey := Value;
end;

procedure TContract.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TContract.SetDuration(const Value: integer);
begin
  FDuration := Value;
end;

procedure TContract.SetDurationPeriodType(const Value: integer);
begin
  FDurationPeriodType := Value;
end;

procedure TContract.SetMinimumQuantity(const Value: integer);
begin
  FMinimumQuantity := Value;
end;

procedure TContract.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TContract.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TContract.SetOfficeContact(const Value: integer);
begin
  FOfficeContact := Value;
end;

procedure TContract.SetOfficeContactName(const Value: string);
begin
  FOfficeContactName := Value;
end;

procedure TContract.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TContract.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TContract.SetPaymentTerms(const Value: integer);
begin
  FPaymentTerms := Value;
end;

procedure TContract.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TContract.SetRep(const Value: integer);
begin
  FRep := Value;
end;

procedure TContract.SetRepName(const Value: string);
begin
  FRepName := Value;
end;

procedure TContract.SetReviewPeriod(const Value: integer);
begin
  FReviewPeriod := Value;
end;

procedure TContract.SetReviewPeriodType(const Value: integer);
begin
  FReviewPeriodType := Value;
end;

procedure TContract.SetSubRep(const Value: integer);
begin
  FSubRep := Value;
end;

procedure TContract.SetSubRepName(const Value: string);
begin
  FSubRepName := Value;
end;

procedure TContract.SetTermAfterInitialPeriod(const Value: integer);
begin
  FTermAfterInitialPeriod := Value;
end;

procedure TContract.SetTermAfterInitialPeriodType(const Value: integer);
begin
  FTermAfterInitialPeriodType := Value;
end;

procedure TContract.SetTerminationNoticePeriod(const Value: integer);
begin
  FTerminationNoticePeriod := Value;
end;

procedure TContract.SetTerminationNoticePeriodType(const Value: integer);
begin
  FTerminationNoticePeriodType := Value;
end;

procedure TContract.SetOriginalContract(const Value: integer);
begin
  FOriginalContract := Value;
end;

procedure TContract.SetContractNumber(const Value: double);
begin
  FContractNumber := Value;
end;

procedure TContract.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TContract.SetStatusDescr(const Value: string);
begin
  FStatusDescr := Value;
end;

procedure TContract.SetExpiryDate(const Value: TDateTime);
begin
  FExpiryDate := Value;
end;

procedure TContract.Setinactive(const Value: string);
begin
  Finactive := Value;
end;

procedure TContract.SetinactiveReason(const Value: integer);
begin
  FinactiveReason := Value;
end;

procedure TContract.SetReference(const Value: string);
begin
  FReference := Value;
end;

procedure TContract.SetEffectiveDate(const Value: TDateTime);
begin
  FEffectiveDate := Value;
end;

function TContract.GetNextContractVersionNumber: real;
begin
  try
    with FDataModule.qryVersionCount do
      begin
        Close;
        parambyname('Original_Contract').asfloat := OriginalContract;
        Open;
        Result := (FieldByName('Last_Version').Asfloat) + 0.01;
        Close;
      end;
  except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Contract Version number:' + #13 + E.Message);
    end;
  end;
end;

procedure TContract.SetMode(const Value: TConMode);
begin
  FMode := Value;
end;

procedure TContract.SetFrequency(const Value: integer);
begin
  FFrequency := Value;
end;

procedure TContract.SetFrequencyPeriodType(const Value: integer);
begin
  FFrequencyPeriodType := Value;
end;

function TContract.GetdbKey: integer;
begin
  with datamodule.qryGetdbKey do
    begin
      close;
      parambyname('Contract_Number').asfloat := ContractNumber;
      open;
      result := fieldbyname('Contract').asinteger;
    end;
end;

{ TdtmdlContract }

function TdtmdlContract.GetNextContractNumber: integer;
begin
  dmBroker.LockCompanyRecord;
  try
    try
      with qryGetLastContractNo do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Contract_number').AsInteger + 1;
        Close;
      end;
      with qryUpCompany do
      begin
        ParamByName('Last_Contract_number').Asinteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Contract number:' + #13 + E.Message);
    end;
    end;
  finally
    dmBroker.FreeCompanyRecord;
  end;
end;

function TdtmdlContract.GetHeaderCount: integer;
begin
  result := qryContractGrid.recordcount;
end;

procedure TdtmdlContract.RefreshData;
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
  qryContractGrid.sql.Text := qryContractBase.SQl.Text;

  sTemp := '';
  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';

  if ContactName <> '' then
    sTemp := sTemp + ' AND ((Customer_Contact.Name LIKE ''%' + ContactName + '%''))';

  if Description <> '' then
    sTemp := sTemp + ' AND (Contract.Description LIKE ''%' + Description + '%'')';

  if QuantityDesc <> '' then
    sTemp := sTemp + ' AND (Contract.Quantity = ''' + QuantityDesc  + ''')';

  if MinimumQuantityDesc <> '' then
    sTemp := sTemp + ' AND (Contract.Minimum_Quantity = ''' + MinimumQuantityDesc  + ''')';

  if Status <> '' then
    begin
      sTemp := sTemp + ' AND (Contract_Status.Status_Description LIKE ''%' + Status + '%'')';
    end;

  if Rep <> 0 then
    begin
      if RepIsSubRep then
        sTemp := sTemp + ' AND ((Contract.Sub_Rep = ' + inttostr(Rep) + '))'
      else
        sTemp := sTemp + ' AND ((Contract.Rep = ' + inttostr(Rep) + '))';
    end;

  if RepName <> '' then
    sTemp := sTemp + ' AND (Rep.Name LIKE ''%' + RepName + '%'')';

  if SubRepName <> '' then
    sTemp := sTemp + ' AND (Sub_Rep.Name LIKE ''%' + SubRepName + '%'')';

  if accountMgr <> '' then
    sTemp := sTemp + ' AND (Office_Contact.Name LIKE ''%' + AccountMgr + '%'')';

  if OperatorName <> '' then
    sTemp := sTemp + ' AND (Operator.Name LIKE ''%' + OperatorName + '%'')';

  if CreatedbyName <> '' then
    sTemp := sTemp + ' AND (Operator.Name LIKE ''%' + CreatedbyName + '%'')';

  if ShowOnlyLive then
    sTemp := sTemp + ' AND (Contract.Contract_Status <> 30)';

  if DateCreated > 0 then
    sTemp := sTemp + ' AND (Contract.Date_Time_Entered >= ' + qDate(DateCreated) + ')';

  if SortOrder = '' then
    sTemp := sTemp + ' ORDER BY Contract.Contract DESC '
  else
    sTemp := sTemp + ' ORDER BY ' + SortOrder;

  qryContractGrid.SQL.text := qryContractGrid.SQL.text + sTemp;

  with qryContractGrid do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;
    end;
end;

function TdtmdlContract.UsingSearch: boolean;
begin
  if (CustomerName <> '')  or
            (Description <> '') or
            (QuantityDesc <> '') or
            (MinimumQuantityDesc <> '') or
            (Status <> '') or
            (RepName <> '') or
            (SubRepName <> '') or
            (AccountMgr <> '') or
            (OperatorName <> '') or
            (DateCreated > 0) then
    result := true
  else
    result := false;
end;

function TdtmdlContract.GetHeaderJobCount: integer;
begin
  result := qryJobBags.recordcount;
end;

function TdtmdlContract.GetHeaderPOCount: integer;
begin
  result := qryPurchaseOrders.recordcount;
end;

procedure TdtmdlContract.qrySalesInvoicesCalcFields(DataSet: TDataSet);
begin
  with qryAllSalesInvoiceCharges do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := qrySalesInvoices.fieldbyname('Sales_invoice').asinteger;
      open;
      qrySalesInvoices.FieldByName('Total_Goods').asfloat := qrySalesInvoices.fieldbyname('Goods_Value').asfloat + fieldbyname('Amount_Total').asfloat;
      qrySalesInvoices.FieldByName('Total_Vat').asfloat := qrySalesInvoices.fieldbyname('Vat_Value').asfloat + fieldbyname('Vat_Total').asfloat;
      qrySalesInvoices.FieldByName('Total_Invoice').asfloat := qrySalesInvoices.fieldbyname('Total_Value').asfloat +
                                                                  fieldbyname('Amount_Total').asfloat + fieldbyname('Vat_Total').asfloat;
    end;

end;

function TdtmdlContract.GetJobBagTotalSalesInvoiced(
  tempCode: integer): real;
begin
  result := 0;
  with qrySalesInvoices do
    begin
      close;
      parambyname('Contract').asinteger := tempCode;
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

end.
