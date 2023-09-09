unit pbJobsDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlJobs = class(TDataModule)
    qryJobs: TFDQuery;
    dtsJobs: TDataSource;
    qryDummy: TFDQuery;
    qryJobReturns: TFDQuery;
    dtsJobReturns: TDataSource;
    qryJBReturnLines: TFDQuery;
    dtsJBReturnLines: TDataSource;
    qryJBPartQtys: TFDQuery;
    qryJobsNCA: TFDQuery;
    dtsJobsNCA: TDataSource;
    qryOldDummyNCA: TFDQuery;
    qryDummyNCA: TFDQuery;
    qryDummyOlder: TFDQuery;
    dtsContractJobs: TDataSource;
    qryContractJobs: TFDQuery;
    qryAddToContract: TFDQuery;
    qryGetJobBagPOs: TFDQuery;
    qryAddPOToContract: TFDQuery;
    qryCheckContract: TFDQuery;
    qryUpdInvThisWeek: TFDQuery;
    qryDummyOld: TFDQuery;
    qryJobsJob_Bag: TIntegerField;
    qryJobsJob_Bag_Descr: TWideStringField;
    qryJobsCustomer_Name: TWideStringField;
    qryJobsDate_Point: TSQLTimeStampField;
    qryJobsBranch_Name: TWideStringField;
    qryJobsCustomer: TIntegerField;
    qryJobsBranch_No: TIntegerField;
    qryJobsAccount_Code: TWideStringField;
    qryJobsCust_Order_no: TWideStringField;
    qryJobsGoods_Required: TSQLTimeStampField;
    qryJobsQuantity: TFloatField;
    qryJobsJob_Bag_Status_descr: TWideStringField;
    qryJobsJob_Bag_Status: TIntegerField;
    qryJobsinactive: TWideStringField;
    qryJobsrep: TIntegerField;
    qryJobsRep_Name: TWideStringField;
    qryJobsOperator: TIntegerField;
    qryJobsOperator_Name: TWideStringField;
    qryJobsOffice_Contact: TIntegerField;
    qryJobsAccount_Manager: TWideStringField;
    qryJobsDescription_Reference: TWideStringField;
    qryJobsOn_Hold: TWideStringField;
    qryJobsDate_Start: TSQLTimeStampField;
    qryJobsNCA_Live_Lines: TIntegerField;
    qryJobsNCA_Signed_Off: TIntegerField;
    procedure qryJobsStatus_TextGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    function GetHeaderCount: integer;
    function GetReturnCount: integer;
    function GetNCACount: integer;
    function GetHeaderContractJobCount: integer;
    { Private declarations }
  public
    AccountMgr: string;
    BranchName: string;
    Contract: integer;
    CustomerName: string;
    Customer: integer;
    CustomerRef: string;
    Description: string;
    DescriptiveRef: string;
    EndUserName: string;
    Raisedby: string;
    RaisingDept: string;
    ReasonType: string;
    Rep: integer;
    RepName: string;
    RepIsSubRep: boolean;
    SubRepName: string;
    OrdQtyDesc: string;
    Operator: integer;
    OperatorName: string;
    Quote: string;
    SourceDept: string;
    Status, ProductionStatus: string;
    ShowInactive: string;
    ShowInactiveNCA: string;
    ShowOnlyComplete: boolean;
    ShowThisWeek: boolean;
    ShowWIP: boolean;
    ShowLiveNCA: boolean;
    SortType: string;
    SortOrder: string;
    ReturnName: string;
    JobDate: TDateTime;
    NCADate: TDateTime;
    DateRequired: TDateTime;
    procedure RefreshData;
    procedure RefreshContractJobs;
    procedure RefreshNCAData;
    procedure RefreshReturns;
    property HeaderCount: integer read GetHeaderCount;
    property HeaderContractJobCount: integer read GetHeaderContractJobCount;
    property ReturnCount: integer read GetReturnCount;
    property NCACount: integer read GetNCACount;
    procedure SetInvoiceThisWeek(tempCode: integer; tempStatus: string);
    function CheckContract(tempCode: integer): boolean;
    function UsingSearch: boolean;
    function UsingNCASearch: boolean;
  end;

var
  dtmdlJobs: TdtmdlJobs;

implementation

uses pbDatabase, pbMainMenu;

const
  JBReturnsSQL =
  'Select distinct '+
  'Job_Bag.Job_Bag, '+
  'Job_Bag.goods_required, '+
  'Job_Bag.customer, '+
  'customer.name as Customer_Name, '+
  'Job_Bag.Job_Bag_Descr, '+
  'Job_Bag.office_contact, '+
  'operator.Name as Account_Manager, '+
  'Job_Bag.Rep, '+
  'Rep.Name as Rep_Name, '+
  'Job_Bag_Return.Part, '+
  'Part.Part_Description, '+
  'sum(Job_Bag_Return.Quantity) as Qty_To_Return '+
  'from  Job_Bag_Return, '+
  '    Job_Bag, '+
  '    customer, '+
  '    operator, '+
  '    rep, '+
  '    Part '+
  'where Job_Bag_Return.Job_Bag = Job_Bag.Job_Bag and '+
  '    Job_Bag.customer = customer.customer and '+
  '    Job_Bag.office_Contact = operator.operator and '+
  '    Job_Bag.Rep = Rep.Rep and '+
  '    Job_Bag_Return.Part = Part.Part '+
  'GROUP BY '+
  '   Job_Bag.Job_Bag, '+
  '   Job_Bag.goods_required, '+
  '   Job_Bag.customer, '+
  '   customer.name, '+
  '   Job_Bag.Job_Bag_Descr, '+
  '   Job_Bag.office_contact, '+
  '   operator.Name, '+
  '   Job_Bag.Rep, '+
  '   Rep.Name, '+
  '   Job_Bag_Return.Part, '+
  '   Part.Part_Description '+
  'HAVING 1 = 1 ';


{$R *.DFM}

{ TdtmdlJobs }

function TdtmdlJobs.GetHeaderCount: integer;
begin
  result := qryJobs.recordcount;
end;

function TdtmdlJobs.GetReturnCount: integer;
begin
  result := qryJobReturns.RecordCount;
end;

procedure TdtmdlJobs.RefreshReturns;
var
  sTemp : string;
begin
  qryJobReturns.sql.clear;
  qryJobReturns.sql.text := JBReturnsSQL;

  sTemp := '';
  if ReturnName <> '' then
    sTemp := sTemp + ' AND (Job_Bag_Return.Part LIKE ''%' + ReturnName + '%'')';

  sTemp := sTemp + ' ORDER BY Job_Bag.Job_Bag desc ';

  qryJobReturns.SQL.text := qryJobReturns.SQL.text + sTemp;

  with qryJobReturns do
  begin
    Close;
    Open;
  end;
end;

procedure TdtmdlJobs.RefreshData;
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
  qryJobs.sql.clear;
  qryJobs.sql.text := qryDummy.sql.text;

  sTemp := '';
  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if Quote <> '' then
    sTemp := sTemp + ' AND (Job_Bag.Quote = ''' + Quote  + ''')';
  if OrdQtyDesc <> '' then
    sTemp := sTemp + ' AND (Job_Bag.Quantity = ''' + OrdQtyDesc  + ''')';
  if Status <> '' then
    begin
      if (Status = 'on hold') or (Status = 'ON HOLD') then
        sTemp := sTemp + ' AND ((Job_Bag.On_Hold = ''Y'') or (Job_Bag.On_Hold = ''P''))'
      else
        sTemp := sTemp + ' AND (Job_Bag_Status.Job_Bag_Status_Descr LIKE ''%' + Status + '%'')';
    end;
  if ProductionStatus <> '' then
    sTemp := sTemp + ' AND ((select Job_Bag_Production_Descr '
                   + ' FROM Job_Bag_Production_Status JBPS '
                   + ' WHERE JBPS.Job_Bag_Production_Status = Job_Bag.Job_Bag_Production_Status) LIKE ''%' + ProductionStatus + '%'')';
  if CustomerRef <> '' then
    sTemp := sTemp + ' AND (Job_Bag.Cust_Order_no LIKE ''' + CustomerRef + '%'')';
  sTemp := sTemp + ' AND Job_Bag.Date_Point >= ' + qDate(JobDate);
  if DateRequired <> 0 then
    sTemp := sTemp + ' AND Job_Bag.Goods_Required <= ' + qDate(DateRequired);
  sTemp := sTemp + ' AND ((Job_Bag.inactive is NULL) or (Job_Bag.inactive = ''N'') or '
                         + '(Job_Bag.inactive = ''' + ShowInactive + '''))';
  if DescriptiveRef <> '' then
    sTemp := sTemp + ' AND (Job_Bag.Description_Reference LIKE ''%' + DescriptiveRef + '%'')';
  if RepName <> '' then
    sTemp := sTemp + ' AND (Rep.Name LIKE ''%' + RepName + '%'')';
  if SubRepName <> '' then
    sTemp := sTemp + ' AND (Sub_Rep.Name LIKE ''%' + SubRepName + '%'')';
  if accountMgr <> '' then
    sTemp := sTemp + ' AND (AM.Name LIKE ''%' + AccountMgr + '%'')';
  if OperatorName <> '' then
    sTemp := sTemp + ' AND (Operator.Name LIKE ''%' + OperatorName + '%'')';
  if EndUserName <> '' then
    sTemp := sTemp + ' AND (End_User.Name LIKE ''%' + EndUserName + '%'')';

(*  if Customer = 0 then
    begin
      if Rep <> 0 then
        sTemp := sTemp + ' AND ((Job_Bag.Rep = ' + inttostr(Rep) + ') OR ' +
                         '((SELECT Top 1 Rep FROM Reps_Branches WHERE Reps_Branches.customer = Job_Bag.Customer and ' +
                         'Reps_Branches.branch_no = Job_Bag.branch_no) = ' + inttostr(Rep) + '))';
      if Operator <> 0 then
        sTemp := sTemp + ' AND (Job_Bag.Operator = ' + inttostr(Operator) + ')';
    end;
*)
  {these lines added to ensure Rep and Operator permissions work}
  {Starts here ....}
  if Rep <> 0 then
    begin
      if RepIsSubRep then
        sTemp := sTemp + ' AND ((Job_Bag.Sub_Rep = ' + inttostr(Rep) + '))'
      else
        sTemp := sTemp + ' AND ((Job_Bag.Rep = ' + inttostr(Rep) + ') OR ' +
                         '((SELECT Top 1 Rep FROM Reps_Branches WHERE Reps_Branches.customer = Job_Bag.Customer and ' +
                         'Reps_Branches.branch_no = Job_Bag.branch_no) = ' + inttostr(Rep) + '))';
    end;

  if Operator <> 0 then
    sTemp := sTemp + ' AND (Job_Bag.Operator = ' + inttostr(Operator) + ')';
  {....End here!}

  if ShowWIP then
    sTemp := sTemp + ' AND (Job_Bag.Job_Bag_Status < 30)';

  if ShowOnlyComplete then
    sTemp := sTemp + ' AND ((Job_Bag.Production_Complete = ''Y'') AND (Job_Bag.Job_bag_Status < 30))';

  if ShowThisWeek then
    sTemp := sTemp + ' AND ((Job_Bag.Invoice_This_Week = ''Y'') AND (Job_Bag.Job_bag_Status < 30))';

  if SortOrder = '' then
      sTemp := sTemp + ' ORDER BY Job_Bag.Job_Bag desc '
  else
    sTemp := sTemp + ' ORDER BY ' + SortOrder;

  qryJobs.SQL.text := qryJobs.SQL.text + sTemp;

  with qryJobs do
  begin
    Close;
    {order date greater than 1/1/1990}
    if JobDate > 32874 then
      parambyname('Records').asinteger := 100000000
    else
      parambyname('Records').asinteger := 2000;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

procedure TdtmdlJobs.qryJobsStatus_TextGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (dtsJobs.Dataset.fieldbyname('Inactive').asstring = 'Y') then
    text := 'CANCELLED'
  else
  if (dtsJobs.Dataset.fieldbyname('On_Hold').asstring = 'Y') then
    text := 'ON HOLD'
  else
  if (dtsJobs.Dataset.fieldbyname('On_Hold').asstring = 'P') then
    text := 'Postage Payment Required'
  else
    text := dtsJobs.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring;

end;

function TdtmdlJobs.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (BranchName <> '') or
            (RepName <> '') or
            (SubRepName <> '') or
            (OrdQtyDesc <> '') or
            (Status <> '') or
            (CustomerRef <> '') or
            (Quote <> '') or
            (DescriptiveRef <> '') or
            (Description <> '') or
            (AccountMgr <> '') or
            (ShowInactive = 'Y') or
            (ShowWIP = true) or
            (EndUserName <> '') or
            (OperatorName <> '') then
    result := true
  else
    result := false;
end;

function TdtmdlJobs.UsingNCASearch: boolean;
begin
  if (CustomerName <> '') or
            (RaisingDept <> '') or
            (RepName <> '') or
            (ReasonType <> '') or
            (Status <> '') or
            (SourceDept <> '') or
            (Description <> '') or
            (AccountMgr <> '') or
            (ShowLiveNCA = true) or
            (ShowInactiveNCA = 'Y') or
            (Raisedby <> '') then
    result := true
  else
    result := false;
end;

function TdtmdlJobs.GetNCACount: integer;
begin
  result := qryJobsNCA.RecordCount;
end;

procedure TdtmdlJobs.RefreshNCAData;
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
  qryJobsNCA.sql.clear;
  qryJobsNCA.sql.text := qryDummyNCA.sql.text;

  sTemp := '';
(*  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';
*)
  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((CASE when Job_Bag.Customer <> 0 then '
		               + ' (select Customer.Name '
                   + ' from Customer '
                   + ' where Customer.Customer = Job_bag.Customer) '
                   + ' ELSE '
		               + ' (select Customer.Name '
	 	               + ' from Customer '
                   + ' where Customer.Customer = Purchase_OrderLine.Customer) '
                   + ' END LIKE ''%' + CustomerName + '%'')'
                   + ' OR '
                   + ' (CASE when Job_Bag.Customer <> 0 then '
		               + ' (select Customer_Branch.Account_code '
                   + ' from Customer_Branch '
                   + ' where Customer_Branch.Customer = Job_bag.Customer and '
                   + ' Customer_Branch.Branch_no = Job_bag.Branch_no) '
	                 + ' ELSE '
                   + ' (select Customer_Branch.Account_code '
                   + ' from Customer_Branch '
                   + ' where Customer_Branch.Customer = Purchase_orderline.Customer and '
		               + ' Customer_Branch.Branch_no = Purchase_orderline.Branch_no) '
	                 + ' END LIKE ''%' + CustomerName + '%''))';


  if Status <> '' then
    begin
      sTemp := sTemp + ' AND (Non_Conform_Status.Non_Conform_Status_Descr LIKE ''%' + Status + '%'')';
    end;
  sTemp := sTemp + ' AND Job_Bag_Non_Conform.Date_Point >= ' + qDate(NCADate);
(*  if RepName <> '' then
    sTemp := sTemp + ' AND (Rep.Name LIKE ''%' + RepName + '%'')';
*)
  if RepName <> '' then
    sTemp := sTemp + ' AND (CASE when Job_Bag.Rep <> 0 then  '
		               + ' (select Rep.Name '
                   + ' from Rep '
                   + ' where Rep.Rep = Job_bag.Rep) '
                   + ' ELSE '
                   + ' (select Rep.Name '
                   + ' from Rep '
                   + ' where Rep.Rep = Purchase_orderLine.Rep) '
                   + ' END LIKE ''%' + RepName + '%'')';
(*  if accountMgr <> '' then
    sTemp := sTemp + ' AND (AM.Name LIKE ''%' + AccountMgr + '%'')';
*)
  if accountMgr <> '' then
	    sTemp := sTemp + ' AND (CASE when Job_Bag.Office_Contact <> 0 then '
		                 + ' (select operator.Name '
	 	                 + ' from Operator '
	                   + ' where Operator.Operator = Job_bag.Office_Contact) '
	                   + ' ELSE '
		                 + ' (select operator.Name '
	 	                 + ' from Purchase_Order, Operator '
                     + ' where Purchase_order.Purchase_Order = Purchase_orderLine.Purchase_Order and '
			               + ' Operator.Operator = Purchase_Order.Office_Contact) '
                     + ' END LIKE ''%' + accountmgr + '%'')';
  if ReasonType <> '' then
    sTemp := sTemp + ' AND (Non_Conform_Type.Non_Conform_Type_Descr LIKE ''%' + ReasonType + '%'')';
  if RaisedBy <> '' then
    sTemp := sTemp + ' AND (Operator.Name LIKE ''%' + Raisedby + '%'')';
  if RaisingDept <> '' then
    sTemp := sTemp + ' AND (Raised_By_Dept.Non_Conform_Dept_Descr LIKE ''%' + RaisingDept + '%'')';
  if SourceDept <> '' then
    sTemp := sTemp + ' AND (Non_Conform_Dept.Non_Conform_Dept_Descr LIKE ''%' + SourceDept + '%'')';

  if Rep <> 0 then
    begin
      if RepIsSubRep then
        sTemp := sTemp + ' AND ((Job_Bag.Sub_Rep = ' + inttostr(Rep) + '))'
      else
        sTemp := sTemp + ' AND (Job_Bag.Rep = ' + inttostr(Rep) + ')';
    end;

  if Operator <> 0 then
    sTemp := sTemp + ' AND (Job_Bag_Non_Conform.Operator = ' + inttostr(Operator) + ')';

  if ShowLiveNCA then
    sTemp := sTemp + ' AND (Non_Conform_Status.Non_Conform_Status < 50)';

  sTemp := sTemp + ' AND ((Job_Bag_Non_Conform.inactive is NULL) or (Job_Bag_Non_Conform.inactive = ''N'') or '
                         + '(Job_Bag_Non_Conform.inactive = ''' + ShowInactiveNCA + '''))';

  sTemp := sTemp + ' ORDER BY Job_Bag_Non_Conform.Job_Bag_Non_Conform desc ';

  qryJobsNCA.SQL.text := qryJobsNCA.SQL.text + sTemp;

  with qryJobsNCA do
  begin
    Close;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

procedure TdtmdlJobs.RefreshContractJobs;
begin
  with qryContractJobs do
  begin
    Close;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    parambyname('Contract').asinteger := Contract;
    Open;
  end;

end;

function TdtmdlJobs.GetHeaderContractJobCount: integer;
begin
  result := qryContractJobs.recordcount;
end;

function TdtmdlJobs.CheckContract(tempCode: integer): boolean;
begin
  result := false;
  with qryCheckContract do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      open;

      result := (recordcount > 0);
    end;
end;

procedure TdtmdlJobs.SetInvoiceThisWeek(tempCode: integer;
  tempStatus: string);
begin
  with qryUpdInvThisWeek do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      parambyname('Invoice_This_Week').asstring := tempStatus;
      if tempStatus = 'Y' then
        begin
          parambyname('Invoice_This_Week_By').asinteger := frmPBMainMenu.iOperator;
          parambyname('Invoice_This_Week_Date').asdatetime := date;
        end
      else
        begin
          parambyname('Invoice_This_Week_By').clear;
          parambyname('Invoice_This_Week_Date').clear;
        end;
      execsql;
    end;
end;

end.
