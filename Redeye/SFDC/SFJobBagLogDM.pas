unit SFJobBagLogDM;

interface

uses
  SysUtils, Classes, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlJobBagLog = class(TDataModule)
    qryProcessGrp: TFDQuery;
    dtsProcessGroup: TDataSource;
    qryProcess: TFDQuery;
    dtsProcess: TDataSource;
    qryWorkCentre: TFDQuery;
    dtsWorkCentre: TDataSource;
    qryProcessPaper: TFDQuery;
    dtsProcessPaper: TDataSource;
    qryGetJobBag: TFDQuery;
    DelSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    GetLastSQL: TFDQuery;
    qryZero: TFDQuery;
    qryJobLogGrid: TFDQuery;
    dtsJobLogGrid: TDataSource;
    oldqryJobLogBase: TFDQuery;
    qryJobLogGridJob_Bag_Time_Log: TIntegerField;
    qryJobLogGridDate_Entered: TDateTimeField;
    qryJobLogGridJob_Bag: TIntegerField;
    qryJobLogGridJob_Bag_Description: TWideStringField;
    qryJobLogGridCustomer: TIntegerField;
    qryJobLogGridBranch_No: TIntegerField;
    qryJobLogGridCustomer_Name: TWideStringField;
    qryJobLogGridDate_Point: TDateTimeField;
    qryJobLogGridProcess_Group: TIntegerField;
    qryJobLogGridProcess_Group_Description: TWideStringField;
    qryJobLogGridProcess: TIntegerField;
    qryJobLogGridProcess_Description: TWideStringField;
    qryJobLogGridWork_Centre: TIntegerField;
    qryJobLogGridWork_Centre_Name: TWideStringField;
    qryJobLogGridPaper_Size: TIntegerField;
    qryJobLogGridPaper_Size_Description: TWideStringField;
    qryJobLogGridCustom_Paper_Size: TWideStringField;
    qryJobLogGridNumber_Up: TIntegerField;
    qryJobLogGridLaser_Format: TWideStringField;
    qryJobLogGridQuantity: TFloatField;
    qryJobLogGridOperator: TIntegerField;
    qryJobLogGridOperator_Name: TWideStringField;
    qryJobLogGridAudit_Workstation: TWideStringField;
    qryJobLogGridLabour_Time_From: TDateTimeField;
    qryJobLogGridLabour_Time_To: TDateTimeField;
    qryJobLogGridLabour_Hours: TFloatField;
    qryJobLogGridMachine_Hours: TFloatField;
    qryJobLogGridTeam_Count: TIntegerField;
    qryWCOperators: TFDQuery;
    dtsWCOperators: TDataSource;
    qryGetProcessGrp: TFDQuery;
    qryProcessOps: TFDQuery;
    dtsProcessOps: TDataSource;
    qryJobLogGridWork_Centre_Operator: TWideStringField;
    qryJobLogGridOperation_Description: TWideStringField;
    qryJobLogGridLabour_Overtime_Hours: TFloatField;
    qryGetEmployee: TFDQuery;
    qryGetJobLog: TFDQuery;
    qryProcessGrpWC: TFDQuery;
    dtsProcessGrpWC: TDataSource;
    qryGetJobTimeLog: TFDQuery;
    qryDelMulti: TFDQuery;
    qryWCOperatorsBase: TFDQuery;
    qryOldJobLogBase: TFDQuery;
    qryOldGetJobLog: TFDQuery;
    qryGetNonJobTimeLog: TFDQuery;
    qryJobLogGridActivity: TWideStringField;
    qryActivities: TFDQuery;
    qryGetEmployeeTime: TFDQuery;
    qryDelJobBagLog: TFDQuery;
    qryGetActivity: TFDQuery;
    qryJobLogBase: TFDQuery;
    qryGetWorkCentre: TFDQuery;
    qryGetWorkCentrebyName: TFDQuery;
    qryGetProcess: TFDQuery;
    qryGetWorkCentrebyShortName: TFDQuery;
    qryWCOperator: TFDQuery;
  private
    function GetHeaderCount: integer;
    procedure GetTotalHours;
  public
    DateFrom, DateTo: TDateTime;
    WCOperatorName: string;
    Customer, Department, Process, Operation, WorkCentre, JobNumber, JobName, NonJobCode: string;
    TotalLabour, TotalOvertime, TotalMachine: double;
    function CheckJobBagNo(tmpCode: integer): boolean;
    function GetDeptHourlyRate(tmpCode: integer): double;
    function GetEmployee(tmpCode: string): boolean;
    function GetJobBagCustomer(tmpCode: integer): integer;
    function GetOperatorHourlyRate(tmpCode: integer): double;
    function GetWorkCentre(tmpCode: string): integer;
    function GetWorkCentrebyShortName(tmpCode: string): integer;
    function GetWorkCentreHourlyRate(tmpCode: integer): double;
    function GetWorkCentreRates(iWorkCentre: integer; var rMachineRate, rClickRate: real): boolean;
    function UsingSearch: boolean;
    procedure RefreshData;
    property HeaderCount: integer read GetHeaderCount;
  end;

var
  dtmdlJobBagLog: TdtmdlJobBagLog;

implementation

uses PBDatabase;

{$R *.dfm}

function TdtmdlJobBagLog.GetDeptHourlyRate(tmpCode: integer): double;
begin
  with qryGetProcessGrp do
    begin
      close;
      parambyname('Process_Group').asinteger := tmpcode;
      open;
      result := fieldbyname('Hourly_Rate').asfloat;
    end;
end;

function TdtmdlJobBagLog.GetOperatorHourlyRate(tmpCode: integer): double;
begin
  with qryWCOperator do
    begin
      close;
      parambyname('Work_Centre_Operator').asinteger := tmpcode;
      open;
      result := fieldbyname('Hourly_Rate').asfloat;
    end;
end;

function TdtmdlJobBagLog.GetWorkCentreHourlyRate(tmpCode: integer): double;
begin
  with qryGetWorkCentre do
    begin
      close;
      parambyname('Work_Centre').asinteger := tmpcode;
      open;
      result := fieldbyname('Hourly_Rate').asfloat;
    end;
end;

function TdtmdlJobBagLog.GetEmployee(tmpCode: string): boolean;
begin
  with qryGetEmployee do
    begin
      close;
      parambyname('Employee_number').asstring := tmpCode;
      open;
      result := (recordcount > 0);
    end;
end;

function TdtmdlJobBagLog.GetWorkCentre(tmpCode: string): integer;
begin
  with qryGetWorkCentrebyName do
    begin
      close;
      parambyname('Work_Centre_Name').asstring := tmpCode;
      open;
      if recordcount > 0 then
        result := fieldbyname('Work_centre').asinteger
      else
        result := 0;
    end;
end;

function TdtmdlJobBagLog.GetWorkCentrebyShortName(tmpCode: string): integer;
begin
  with qryGetWorkCentrebyShortName do
    begin
      close;
      parambyname('Work_Centre_Short_Name').asstring := tmpCode;
      open;
      if recordcount > 0 then
        result := fieldbyname('Work_centre').asinteger
      else
        result := 0;
    end;
end;

function TdtmdlJobBagLog.GetWorkCentreRates(iWorkCentre: integer; var rMachineRate, rClickRate: real): boolean;
begin
  with qryGetWorkCentre do
    begin
      close;
      parambyname('Work_Centre').asinteger := iWorkCentre;
      open;

      rMachineRate := fieldbyname('Hourly_Rate').asfloat;
      rClickRate := fieldbyname('Click_Charge').asfloat;
      result := (recordcount > 0);
    end;
end;

function TdtmdlJobBagLog.GetHeaderCount: integer;
begin
  result := qryJobLogGrid.RecordCount;
end;

procedure TdtmdlJobBagLog.GetTotalHours;
var
  rLabour, rOvertime, rMachine: real;
begin
  rLabour := 0;
  rOvertime := 0;
  rMachine := 0;
  with dtmdlJobBagLog.qryJobLogGrid do
    begin
      first;
      while eof <> true do
        begin
          rLabour := rLabour + fieldbyname('Labour_Hours').AsFloat;
          rOvertime := rOvertime + fieldbyname('Labour_Overtime_Hours').AsFloat;
          rMachine := rMachine + fieldbyname('Machine_Hours').AsFloat;
          next;
        end;
      first;
    end;
  TotalLabour := rLabour;
  TotalOvertime := rOvertime;
  TotalMachine := rMachine;
end;

procedure TdtmdlJobBagLog.RefreshData;
var
  sTemp : string ;
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

  dtsJobLogGrid.DataSet := nil;
  qryJobLogGrid.sql.clear;
  qryJobLogGrid.sql.text := qryJobLogBase.sql.text;

  sTemp := '';
  sTemp := sTemp + ' AND Job_Bag_Time_Log.Date_Point >= ' + qDate(DateFrom);
  sTemp := sTemp + ' AND Job_Bag_Time_Log.Date_Point <= ' + qDate(DateTo);
  if Customer <> '' then
    sTemp := sTemp + ' AND (Customer.name LIKE ''%' + Customer + '%'')';
  if Department <> '' then
    sTemp := sTemp + ' AND (Process_Group.Process_Group_Description LIKE ''' + Department + '%'')';
  if Process <> '' then
    sTemp := sTemp + ' AND (Process.Process_Description LIKE ''' + Process  + '%'')';
  if WorkCentre <> '' then
    sTemp := sTemp + ' AND (Work_Centre.Work_Centre_Name LIKE ''%' + WorkCentre  + '%'')';
  if JobNumber <> '' then
    sTemp := sTemp + ' AND (Job_Bag_Time_Log.Job_Bag LIKE ''' + JobNumber  + '%'')';
  if JobName <> '' then
    sTemp := sTemp + ' AND (Job_bag.Job_Bag_Descr LIKE ''%' + JobName  + '%'')';
  if NonJobCode <> '' then
    sTemp := sTemp + ' AND (Job_bag_Time_Log.Activity LIKE ''%' + NonJobCode  + '%'')';
  if Operation <> '' then
    sTemp := sTemp + ' AND ((select Process_Operation.Operation_Description '
                   + ' FROM Process_Operation '
                   + ' WHERE  (Process_Operation.Process = Job_Bag_Time_Log.Process) and '
                   + ' (Process_Operation.Operation = Job_Bag_Time_Log.Operation)) LIKE ''' + Operation  + '%'')';
  if WCOperatorName <> '' then
    sTemp := sTemp + ' AND ((select WCO.Name '
                   + ' FROM Work_Centre_Operator WCO '
                   + ' WHERE WCO.Work_Centre_Operator = Job_Bag_Time_Log.Work_Centre_Operator) LIKE ''%' + WCOperatorName + '%'')';

(*  if DateFrom > 0 then
    sTemp := sTemp + ' AND Customer.Date_Created >= ' + qDate(DateCreated);
*)

  sTemp := sTemp + ' ORDER BY Job_Bag_Time_Log.date_point desc, Job_Bag_Time_log desc ';

  qryJobLogGrid.SQL.text := qryJobLogGrid.SQL.text + sTemp;

  with qryJobLogGrid do
  begin
    Close;
    Open;
  end;

  GetTotalHours;
  dtsJobLogGrid.DataSet := qryJobLogGrid;

end;

function TdtmdlJobBagLog.UsingSearch: boolean;
begin
  if (Customer <> '') or
            (Department <> '') or
            (WorkCentre <> '') or
            (Process <> '') or
            (Operation <> '') or
            (JobNumber <> '') or
            (JobName <> '')  or
            (NonJobCode <> '') then
    result := true
  else
    result := false;

end;

function TdtmdlJobBagLog.CheckJobBagNo(tmpCode: integer): boolean;
begin
  with qryGetJobBag do
    begin
      close;
      parambyname('Job_bag').asinteger := tmpCode;
      open;
      result := (recordcount > 0);
    end;
end;

function TdtmdlJobBagLog.GetJobBagCustomer(tmpCode: integer): integer;
begin
  with qryGetJobBag do
    begin
      close;
      parambyname('Job_Bag').asinteger := tmpCode;
      open;
      result := fieldbyname('Customer').AsInteger;
    end;
end;

end.
