unit PBActivityDM;

interface

uses
  SysUtils, Classes, DB, DBTables, CCSCommon, ActiveX;

type
  TActMode   = (actAdd, actChange, actDelete, actView, actFollowUp);

  TdtmdlActivity = class(TDataModule)
    qryZero: TQuery;
    qryUpActivity: TQuery;
    qryGetActivity: TQuery;
    AddSQL: TQuery;
    GetLastSQL: TQuery;
    qryActivityGrid: TQuery;
    dtsActivityGrid: TDataSource;
    qryOperator: TQuery;
    dsOperator: TDataSource;
    qryCustomerBranches: TQuery;
    qryContacts: TQuery;
    dtsCustomerBranches: TDataSource;
    dtsContacts: TDataSource;
    qryAssignedTo: TQuery;
    dtsAssignedTo: TDataSource;
    qryActivityType: TQuery;
    dtsActivityType: TDataSource;
    qryActivityStatus: TQuery;
    dtsActivityStatus: TDataSource;
    qryActivityPriority: TQuery;
    dtsActivityPriority: TDataSource;
    qryActivityModule: TQuery;
    dtsActivityModule: TDataSource;
    qryActivityBase: TQuery;
    qryActivityReminder: TQuery;
    dtsActivityReminder: TDataSource;
    qryGetLinkedActivities: TQuery;
    dtsGetLinkedActivities: TDataSource;
    qryGetCustomerContact: TQuery;
  private
    function GetHeaderCount: integer;
    function GetReminderCount: integer;
    function GetHistoryCount: integer;
    { Private declarations }
  public
    ActivityDate: TDateTime;
    ActivityStatus: string;
    ActivityType: string;
    AssignedToName: string;
    AssignedTo: integer;
    BranchName: string;
    ContactName: string;
    CreatedByName: string;
    CreatedBy: integer;
    Customer: integer;
    CustomerName: string;
    DateCreated: TDateTime;
    Description: string;
    DueDate: TDateTime;
    Operator: integer;
    OperatorName: string;
    Priority: string;
    Reference: string;
    Rep: integer;
    ShowCompleted: boolean;
    ShowOnlyLive: boolean;
    SortType: string;
    SortOrder: string;
    Subject: string;
    property HeaderCount: integer read GetHeaderCount;
    property HistoryCount: integer read GetHistoryCount;
    property ReminderCount: integer read GetReminderCount;
    procedure RefreshData;
    function RefreshReminders: integer;
    function UsingSearch: boolean;
  end;

  TActivity       = class
  private
    FStatus: integer;
    FActivityType: integer;
    FOperator: integer;
    FAssignedTo: integer;
    FCustomer: integer;
    FNarrative: integer;
    FdbKey: integer;
    FContact: integer;
    FPriority: integer;
    FBranch: integer;
    FNarrativeText: string;
    FActivityTypeDescription: string;
    FEntity: string;
    FCustomerName: string;
    FEntityReference: string;
    FBranchName: string;
    FPriorityDescription: string;
    FContactName: string;
    FSubject: string;
    FStatusDescription: string;
    FOperatorName: string;
    FDueDateTime: TDateTime;
    FStartDateTime: TDateTime;
    FDateTimeEntered: TDateTime;
    FDataModule: TdtmdlActivity;
    FAssignedToName: string;
    FModule: integer;
    FReminder: boolean;
    FEntityReferenceDescription: string;
    FModuleDescription: string;
    FOriginalActivity: integer;
    procedure SetActivityType(const Value: integer);
    procedure SetActivityTypeDescription(const Value: string);
    procedure SetAssignedTo(const Value: integer);
    procedure SetBranch(const Value: integer);
    procedure SetBranchName(const Value: string);
    procedure SetContact(const Value: integer);
    procedure SetContactName(const Value: string);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetDateTimeEntered(const Value: TDateTime);
    procedure SetdbKey(const Value: integer);
    procedure SetDueDateTime(const Value: TDateTime);
    procedure SetEntity(const Value: string);
    procedure SetEntityReference(const Value: string);
    procedure SetNarrative(const Value: integer);
    procedure SetNarrativeText(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetPriority(const Value: integer);
    procedure SetPriorityDescription(const Value: string);
    procedure SetStartDateTime(const Value: TDateTime);
    procedure SetStatus(const Value: integer);
    procedure SetStatusDescription(const Value: string);
    procedure SetSubject(const Value: string);
    procedure SetAssignedToName(const Value: string);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextActivity: integer;
    procedure SetModule(const Value: integer);
    procedure SetReminder(const Value: boolean);
    procedure SetEntityReferenceDescription(const Value: string);
    procedure SetModuleDescription(const Value: string);
    procedure SetOriginalActivity(const Value: integer);
  public
    constructor Create(DataModule : TdtmdlActivity);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TActivity;
    procedure DeleteFromDB;
    procedure LoadFromDB;
    procedure SaveToDB(TempAll: boolean);
    property ActivityType: integer read FActivityType write SetActivityType;
    property ActivityTypeDescription: string read FActivityTypeDescription write SetActivityTypeDescription;
    property AssignedTo: integer read FAssignedTo write SetAssignedTo;
    property AssignedToName: string read FAssignedToName write SetAssignedToName;
    property Branch: integer read FBranch write SetBranch;
    property BranchName: string read FBranchName write SetBranchName;
    property Contact: integer read FContact write SetContact;
    property ContactName: string read FContactName write SetContactName;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property DataModule: TdtmdlActivity read FDataModule;
    property DateTimeEntered: TDateTime read FDateTimeEntered write SetDateTimeEntered;
    property DueDateTime: TDateTime read FDueDateTime write SetDueDateTime;
    property dbKey: integer read FdbKey write SetdbKey;
    property Entity: string read FEntity write SetEntity;
    property EntityReference: string read FEntityReference write SetEntityReference;
    property EntityReferenceDescription: string read FEntityReferenceDescription write SetEntityReferenceDescription;
    property Module: integer read FModule write SetModule;
    property ModuleDescription: string read FModuleDescription write SetModuleDescription;
    property Narrative: integer read FNarrative write SetNarrative;
    property NarrativeText: string read FNarrativeText write SetNarrativeText;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property OriginalActivity: integer read FOriginalActivity write SetOriginalActivity;
    property Priority: integer read FPriority write SetPriority;
    property PriorityDescription: string read FPriorityDescription write SetPriorityDescription;
    property Reminder: boolean read FReminder write SetReminder;
    property StartDateTime: TDateTime read FStartDateTime write SetStartDateTime;
    property Status: integer read FStatus write SetStatus;
    property StatusDescription: string read FStatusDescription write SetStatusDescription;
    property Subject: string read FSubject write SetSubject;
  end;

var
  dtmdlActivity: TdtmdlActivity;

implementation

uses
  PBNarrativeDM, pbDatabase;

{$R *.dfm}

{ TActivity }

procedure TActivity.Clear;
begin

end;

function TActivity.Clone: TActivity;
begin
    Result := TActivity.Create(FDataModule);
    Result.ActivityType             := self.ActivityType;
    Result.ActivityTypeDescription  := Self.ActivityTypeDescription;
    Result.AssignedTo               := Self.AssignedTo;
    Result.AssignedToName           := self.AssignedToName;
    Result.Branch                   := Self.Branch;
    Result.BranchName               := Self.BranchName;
    Result.Contact                  := Self.Contact;
    Result.ContactName              := Self.ContactName;
    Result.Customer                 := Self.Customer;
    Result.CustomerName             := Self.CustomerName;
    Result.DateTimeEntered          := Self.DateTimeEntered;
    Result.DueDateTime              := Self.DueDateTime;
    Result.dbKey                    := Self.dbKey;
    Result.Entity                   := Self.Entity;
    Result.EntityReference          := Self.EntityReference;
    Result.EntityReferenceDescription
                                    := Self.EntityReferenceDescription;
    Result.Module                   := self.Module;
    Result.ModuleDescription        := self.ModuleDescription;
    Result.Narrative                := Self.Narrative;
    Result.NarrativeText            := Self.NarrativeText;
    Result.Operator                 := Self.Operator;
    Result.OperatorName             := Self.OperatorName;
    Result.OriginalActivity         := self.OriginalActivity;
    Result.Priority                 := Self.Priority;
    Result.PriorityDescription      := Self.PriorityDescription;
    Result.Reminder                 := Self.Reminder;
    Result.StartDateTime            := Self.StartDateTime;
    Result.Status                   := Self.Status;
    Result.StatusDescription        := Self.StatusDescription;
    Result.Subject                  := Self.Subject;
end;

constructor TActivity.Create(DataModule: TdtmdlActivity);
begin
  FDataModule := DataModule;
end;

procedure TActivity.DeleteFromDB;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Activity WHERE Activity =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

destructor TActivity.Destroy;
begin
  inherited;
end;

procedure TActivity.LoadFromDB;
begin
  { Load the header record then all lines belonging to the sales invoice }
  Clear;
  with FDataModule.qryGetActivity do
  begin
    Close;
    ParamByName('Activity').AsInteger := DbKey;
    Open;
    ActivityType             := FieldByName('Activity_Type').asinteger;
    ActivityTypeDescription  := FieldByName('Activity_Type_Description').asstring;
    AssignedTo               := FieldByName('Assigned_To').asinteger;
    AssignedToName           :=  FieldByName('Assigned_To_Name').asstring;
    Branch                   := FieldByName('Branch_no').asinteger;
    BranchName               := FieldByName('Branch_Name').asstring;
    Contact                  := FieldByName('Contact_no').asinteger;
    ContactName              := FieldByName('Contact_Name').asstring;
    Customer                 := FieldByName('Customer').asinteger;
    CustomerName             := FieldByName('Customer_Name').asstring;
    DateTimeEntered          := FieldByName('Date_Time_Entered').asdatetime;
    DueDateTime              := FieldByName('Due_Date_Time').asdatetime;

    Module                   := fieldbyname('Activity_Module').asinteger;
    ModuleDescription        := fieldbyname('Activity_Short_Description').asstring;

    EntityReference          := FieldByName('Entity_Reference').asstring;
    EntityReferenceDescription := FieldByName('Entity_Reference_Description').asstring;

    Narrative                := FieldByName('Narrative').asinteger;
    NarrativeText            := dmBroker.GetNarrative(Narrative);
    Operator                 := FieldByName('Operator').asinteger;
    OperatorName             := FieldByName('Operator_Name').asstring;

    OriginalActivity         := fieldbyname('Original_Activity').asinteger;
    Priority                 := FieldByName('Activity_Priority').asinteger;
    PriorityDescription      := FieldByName('Activity_Priority_Description').asstring;
    Reminder                 := (FieldByName('Activity_Reminder').asstring = 'Y');
    StartDateTime            := FieldByName('Start_Date_Time').asdatetime;
    Status                   := FieldByName('Activity_Status').asinteger;
    StatusDescription        := FieldByName('Activity_Status_Description').asstring;
    Subject                  := FieldByName('Activity_Subject').asstring;
  end;
end;

procedure TActivity.SaveToDB(TempAll: boolean);
var
  iTempNarr: integer;
begin
  if DbKey = 0 then
    DbKey := GetNextActivity;

  with FDataModule.qryUpActivity do
    begin
      ParamByName('Activity').AsInteger     := DbKey;
      Parambyname('Activity_Type').asinteger := ActivityType;
      Parambyname('Assigned_To').asinteger   := AssignedTo;
      Parambyname('Branch_no').asinteger       := Branch;
      Parambyname('Contact_no').asinteger      := Contact;
      Parambyname('Customer').asinteger     := Customer;
      Parambyname('Due_Date_Time').asdatetime :=  DueDateTime;
      Parambyname('Entity_Reference').asstring   :=  EntityReference;
      ParamByName('Entity_Reference_Description').asstring := EntityReferenceDescription;

      {Save the narrative}
      iTempNarr := Narrative;
      dmBroker.SaveNarrative(iTempNarr,NarrativeText);
      Narrative := iTempNarr;
      if Narrative = 0 then
        ParamByName('Narrative').clear
      else
        ParamByName('Narrative').Asinteger := Narrative;

      Parambyname('Activity_Priority').asinteger     :=  Priority ;
      Parambyname('Start_Date_Time').asdatetime   :=  StartDateTime ;
      Parambyname('Activity_Status').asinteger       :=  Status;
      Parambyname('Activity_Subject').asstring       :=  Subject;
      if Module = 0 then
        Parambyname('Activity_Module').clear
      else
        Parambyname('Activity_Module').asinteger       :=  Module;
      if Reminder then
        Parambyname('Activity_Reminder').asstring       :=  'Y'
      else
        Parambyname('Activity_Reminder').asstring       :=  'N';

      Parambyname('Original_Activity').asinteger       :=  OriginalActivity;
      ExecSQL;
    end
end;

procedure TActivity.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Activity ' +
            '(Activity, Activity_Type, Activity_Subject, Date_Time_Entered, Start_Date_Time, Due_Date_Time, Activity_Status,' +
            ' Activity_Priority, Operator, Narrative) ' +
            'VALUES(' + '0,' + inttoStr(ActivityType) + ',' + '''' + self.Subject + ''',' + '0,' + '0,' +
              '0,' + inttostr(Status) + ',' + inttoStr(Priority) + ',' + inttostr(Operator) + ',' + '0' + ')');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TActivity.GetNextActivity: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with FDataModule.AddSQL do
    begin
      Close ;
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

procedure TActivity.DeleteZero;
begin
  with FdataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Activity Where Activity = 0 ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TActivity.SetActivityType(const Value: integer);
begin
  FActivityType := Value;
end;

procedure TActivity.SetActivityTypeDescription(const Value: string);
begin
  FActivityTypeDescription := Value;
end;

procedure TActivity.SetAssignedTo(const Value: integer);
begin
  FAssignedTo := Value;
end;

procedure TActivity.SetAssignedToName(const Value: string);
begin
  FAssignedToName := Value;
end;

procedure TActivity.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TActivity.SetBranchName(const Value: string);
begin
  FBranchName := Value;
end;

procedure TActivity.SetContact(const Value: integer);
begin
  FContact := Value;
end;

procedure TActivity.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TActivity.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TActivity.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TActivity.SetDateTimeEntered(const Value: TDateTime);
begin
  FDateTimeEntered := Value;
end;

procedure TActivity.SetdbKey(const Value: integer);
begin
  FdbKey := Value;
end;

procedure TActivity.SetDueDateTime(const Value: TDateTime);
begin
  FDueDateTime := Value;
end;

procedure TActivity.SetEntity(const Value: string);
begin
  FEntity := Value;
end;

procedure TActivity.SetEntityReference(const Value: string);
begin
  FEntityReference := Value;
end;

procedure TActivity.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TActivity.SetNarrativeText(const Value: string);
begin
  FNarrativeText := Value;
end;

procedure TActivity.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TActivity.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TActivity.SetPriority(const Value: integer);
begin
  FPriority := Value;
end;

procedure TActivity.SetPriorityDescription(const Value: string);
begin
  FPriorityDescription := Value;
end;

procedure TActivity.SetStartDateTime(const Value: TDateTime);
begin
  FStartDateTime := Value;
end;

procedure TActivity.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TActivity.SetStatusDescription(const Value: string);
begin
  FStatusDescription := Value;
end;

procedure TActivity.SetSubject(const Value: string);
begin
  FSubject := Value;
end;

procedure TActivity.SetModule(const Value: integer);
begin
  FModule := Value;
end;

procedure TActivity.SetReminder(const Value: boolean);
begin
  FReminder := Value;
end;

procedure TActivity.SetEntityReferenceDescription(const Value: string);
begin
  FEntityReferenceDescription := Value;
end;

procedure TActivity.SetModuleDescription(const Value: string);
begin
  FModuleDescription := Value;
end;

procedure TActivity.SetOriginalActivity(const Value: integer);
begin
  FOriginalActivity := Value;
end;

{ TdtmdlActivity }

function TdtmdlActivity.GetHeaderCount: integer;
begin
  result := qryActivityGrid.recordcount;
end;

function TdtmdlActivity.GetHistoryCount: integer;
begin
  result := qryGetLinkedActivities.recordcount;
end;

function TdtmdlActivity.GetReminderCount: integer;
begin
  result := qryActivityReminder.RecordCount;
end;

procedure TdtmdlActivity.RefreshData;
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
  qryActivityGrid.sql.Text := qryActivityBase.SQl.Text;

  sTemp := '';
  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';

  if BranchName <> '' then
    sTemp := sTemp + ' AND ((Customer_Branch.Name LIKE ''%' + BranchName + '%''))';

  if ContactName <> '' then
    sTemp := sTemp + ' AND ((Customer_Contact.Name LIKE ''%' + ContactName + '%''))';

  if Priority <> '' then
    sTemp := sTemp + ' AND (Activity_Priority.Activity_Priority_Description LIKE ''%' + Priority + '%'')';

  if Subject <> '' then
    sTemp := sTemp + ' AND (Activity.Activity_Subject LIKE ''%' + Subject + '%'')';

  if Reference <> '' then
    sTemp := sTemp + ' AND (Activity.Entity_Reference LIKE ''%' + Reference + '%'')';

  if Description <> '' then
    sTemp := sTemp + ' AND (Activity.Entity_Reference_Description LIKE ''%' + Description + '%'')';

  if ActivityType <> '' then
    sTemp := sTemp + ' AND (Activity_Type.Activity_Type_Description LIKE ''%' + ActivityType + '%'')';

  if ActivityStatus <> '' then
    sTemp := sTemp + ' AND (Activity_Status.Activity_Status_Description LIKE ''%' + ActivityStatus + '%'')';

  if CreatedbyName <> '' then
    sTemp := sTemp + ' AND (Operator.Name LIKE ''%' + CreatedbyName + '%'')';

  if AssignedToName <> '' then
    sTemp := sTemp + ' AND ((SELECT Name FROM Operator WHERE Operator.Operator = Activity.Assigned_to) LIKE ''%' + AssignedToName + '%'')';

  if ShowOnlyLive then
    sTemp := sTemp + ' AND (Activity.Activity_Status <> 30)';

  if DueDate > 0 then
    sTemp := sTemp + ' AND (Activity.Due_Date_Time >= ' + qDate(DueDate) + ')';

  if DateCreated > 0 then
    sTemp := sTemp + ' AND (Activity.Date_Time_Entered >= ' + qDate(DateCreated) + ')';

  if SortOrder = '' then
    sTemp := sTemp + ' ORDER BY Activity.Due_Date_Time DESC '
  else
    sTemp := sTemp + ' ORDER BY ' + SortOrder;

  qryActivityGrid.SQL.text := qryActivityGrid.SQL.text + sTemp;

  with qryActivityGrid do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Assigned_To').asinteger := AssignedTo;
      parambyname('Operator').asinteger := Operator;
      open;
    end;
end;

function TdtmdlActivity.RefreshReminders: integer;
function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  result := 0;

  with qryActivityReminder do
    begin
      sql.Text := qryActivityBase.SQl.Text;

      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Assigned_To').asinteger := AssignedTo;

      parambyname('Operator').asinteger := 99999; {Set to very high vlaue as we don't want to see anything other than what is assigned}

      SQL.Add(' AND (Datediff(minute, getdate(), Activity.Due_Date_Time) < 15)');
//      SQL.Add(' AND Activity.Due_Date_Time <= '  + qDate(date+1));
      SQL.Add(' AND Activity.Activity_Status = 20');

      SQL.Add(' ORDER BY Activity.Due_Date_Time DESC');
      open;

      result := recordcount;
    end;
end;

function TdtmdlActivity.UsingSearch: boolean;
begin
  if (CustomerName <> '')  or
            (BranchName <> '') or
            (ContactName <> '') or
            (Priority <> '') or
            (Subject <> '') or
            (Reference <> '') or
            (Description <> '') or
            (ActivityType <> '') or
            (ActivityStatus <> '') or
            (CreatedByName <> '') or
            (AssignedToName <> '') or
            (DueDate > 0) or
            (DateCreated > 0) then
    result := true
  else
    result := false;
end;

end.
