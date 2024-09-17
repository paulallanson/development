unit pbCustomerDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlCustomers = class(TDataModule)
    qryCustomers: TFDQuery;
    dtsCustomers: TDataSource;
    CheckCustAccExistsSQL: TFDQuery;
    CurrSRC: TDataSource;
    qryZero: TFDQuery;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    StatusDataSource: TDataSource;
    GetStatusSQL: TFDQuery;
    UpdSQL: TFDQuery;
    GetCurrSQL: TFDQuery;
    GetTypesSQL: TFDQuery;
    GetVATSQL: TFDQuery;
    GetCustNameSQL: TFDQuery;
    GetCountrySQL: TFDQuery;
    DelSQL: TFDQuery;
    GetCompSQL: TFDQuery;
    IntrastatSRC: TDataSource;
    GetBranchNameSQL: TFDQuery;
    TypesSRC: TDataSource;
    GetCrdStatSQL: TFDQuery;
    CountrySRC: TDataSource;
    DelBranchSQL: TFDQuery;
    CheckSuppAccExistsSQL: TFDQuery;
    UpdBranchSQL: TFDQuery;
    VATSRC: TDataSource;
    AddBranchSQL: TFDQuery;
    UpdNotesOnlySQL: TFDQuery;
    UpdDelivNotesOnlySQL: TFDQuery;
    GetIntrastatSQL: TFDQuery;
    CrdStatSRC: TDataSource;
    qryGetCustomer: TFDQuery;
    qryCustProdPrefix: TFDQuery;
    dtsrcCustProdPrefix: TDataSource;
    qryCustomersBase: TFDQuery;
    qryCustomerLU: TFDQuery;
    dtsCustomerLU: TDataSource;
    UpdprefixSQL: TFDQuery;
    qryGetTechCustomer: TFDQuery;
    qryGetTechContact: TFDQuery;
    qryEInvoicing: TFDQuery;
    dtsEInvoicing: TDataSource;
    qryUpdProductStatus: TFDQuery;
    qryGetEInvoicing: TFDQuery;
    qryDocuments: TFDQuery;
    dtsDocuments: TDataSource;
    qryAddDocument: TFDQuery;
    qryGetLastDoc: TFDQuery;
    qryDelDocument: TFDQuery;
    qryUpdDocument: TFDQuery;
    qryTerms: TFDQuery;
    dtsTerms: TDataSource;
    qryRevenueCentre: TFDQuery;
    dtsRevenueCentre: TDataSource;
    qryGetTerms: TFDQuery;
    GetContactNameSQL: TFDQuery;
    dtsProspects: TDataSource;
    qryProspectBase: TFDQuery;
    qryProspects: TFDQuery;
    qryUpdMulti: TFDQuery;
    qryUpdMultiBranch: TFDQuery;
    qryGetOneCustomer: TFDQuery;
    qryReps: TFDQuery;
    dtsReps: TDataSource;
    qryDelRepBranch: TFDQuery;
    qryAddRepBranch: TFDQuery;
    qryCompanyTypes: TFDQuery;
    dtsCompanyTypes: TDataSource;
    qryGetAccCodes: TFDQuery;
    dtsGetAccCodes: TDataSource;
    qryGetImportance: TFDQuery;
    dtsGetImportance: TDataSource;
    qryCustomerBranches: TFDQuery;
    dtsCustomerBranches: TDataSource;
    qryContacts: TFDQuery;
    dtsContacts: TDataSource;
    qryAddContact: TFDQuery;
    qryCheckName: TFDQuery;
    qrySetCContactActive: TFDQuery;
    qrySetCContactInactive: TFDQuery;
    qryAddCustomerCat: TFDQuery;
    qryCustomerCategories: TFDQuery;
    dtsCustomerCategories: TDataSource;
    qryDelCustomerCat: TFDQuery;
    qryUpCustomerCatSupply: TFDQuery;
    qryUpCustomerCatNotes: TFDQuery;
    qryGetCContactDetails: TFDQuery;
    qryGetCustomerOrders: TFDQuery;
    qrySetCustomerInactive: TFDQuery;
    qryHOContacts: TFDQuery;
    dtsHOContacts: TDataSource;
    qryGetContactCats: TFDQuery;
    dtsContactCats: TDataSource;
    qryUpCustomerCatUsed: TFDQuery;
    qryOperators: TFDQuery;
    dtsOperators: TDataSource;
    qryDelAccManager: TFDQuery;
    qryAddAccManager: TFDQuery;
    qryDelSecondRep: TFDQuery;
    qryEndUsers: TFDQuery;
    dtsEndUsers: TDataSource;
    qryEndUserBase: TFDQuery;
  private
    FIncludeLapsed: boolean;
    FIncludeProspects: boolean;
    function GetHeaderCount: integer;
    function GetHeaderEndUserCount: integer;
    function GetHeaderProspectCount: integer;
    function GetBranchCount: integer;
    function GetContactCount: integer;
    procedure SetIncludeLapsed(const Value: boolean);
    procedure SetIncludeProspects(const Value: boolean);
    function GetHOContactCount: integer;
    function GetCustomerName: string;
  public
    Customer: integer;
    AccountManager: string;
    Analysis1, Analysis2, Analysis3, Analysis4: string;
    County: string;
    CustomerName, BranchName, ContactName: string;
    CustomerStatus, CustomerType: string;
    DateCreated: TDateTime;
    Terms: string;
    Town: string;
    Postcode: string;
    Telephone: string;
    Fax: string;
    Importance: string;
    RepName: string;
    Rep: integer;
    RepIsSubRep: boolean;
    RevenueCentre: string;
    ShowInactive, ShowInactiveBranches, ShowInactiveContacts: boolean;
    SortType: string;
    SortOrder: string;
    SubRepName: string;
    procedure RefreshBranches;
    procedure RefreshHOContacts;
    procedure RefreshData;
    procedure RefreshProspectData;
    procedure RefreshEndUserData;
    procedure RefreshCategoryData;
    property BranchCount: integer read GetBranchCount;
    property ContactCount: integer read GetContactCount;
    property HeaderCount: integer read GetHeaderCount;
    property HeaderCountEndUser: integer read GetHeaderEndUserCount;
    property HeaderCountProspect: integer read GetHeaderProspectCount;
    property HOContactCount: integer read GetHOContactCount;
    property IncludeLapsed: boolean read FIncludeLapsed write SetIncludeLapsed;
    property IncludeProspects: boolean read FIncludeProspects write SetIncludeProspects;
    function UsingSearch: boolean;
    function GetNextDocument(tmpCust: integer): integer;
    function ShowDirectDebitPrompt(tmpCode: integer): boolean;
  end;

var
  dtmdlCustomers: TdtmdlCustomers;

implementation

uses pbDatabase;

{$R *.DFM}

function TdtmdlCustomers.GetHeaderCount: integer;
begin
  Result := qryCustomers.RecordCount;
end;

function TdtmdlCustomers.GetNextDocument(tmpCust: integer): integer;
begin
  with qryGetLastDoc do
    begin
      close;
      parambyname('Customer').asinteger := tmpCust;
      open;
      result := fieldbyname('Last_Document').asinteger + 1;
    end;
end;

procedure TdtmdlCustomers.RefreshData;
var
  sTemp : string ;
  sShowInactive: string;
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
  qryCustomers.sql.clear;
  qryCustomers.sql.text := qryCustomersBase.sql.text;

  if not ShowInactive then
    sShowInactive := 'Y'
  else
    sShowInactive := 'N';

  sTemp := '';
  if IncludeLapsed then
    sTemp := sTemp + ' OR (Customer.Customer_Status = 90)';

  if IncludeProspects then
    sTemp := sTemp + ' OR (Customer.Customer_Status = 80)';

  sTemp := sTemp + ')';

  if Town <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Town LIKE ''%' + Town + '%'')';
  if Postcode <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Postcode LIKE ''' + Postcode + '%'')';
  if County <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.County LIKE ''%' + County + '%'')';
  if Telephone <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Phone LIKE ''' + Telephone  + '%'')';
  if Fax <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Fax_Number LIKE ''' + Fax  + '%'')';
  if CustomerStatus <> '' then
    sTemp := sTemp + ' AND (Customer_Status.Customer_Status_Descr LIKE ''' + CustomerStatus  + '%'')';
  if CustomerType <> '' then
    sTemp := sTemp + ' AND (Customer_Type.Description LIKE ''' + CustomerType  + '%'')';
  if Terms <> '' then
    sTemp := sTemp + ' AND ((SELECT Payment_Terms_Description '
                   +  ' FROM Payment_Terms '
                   +  ' WHERE Payment_Terms.Payment_Terms = Customer.Payment_Terms) LIKE ''%' + Terms  + '%'')';
  if Importance <> '' then
    sTemp := sTemp + ' AND ((SELECT Importance_Description '
                   +  ' FROM Level_of_Importance '
                   +  ' WHERE Level_of_Importance.Level_of_Importance = Customer.Level_of_Importance) LIKE ''%' + Importance  + '%'')';
  if RevenueCentre <> '' then
    sTemp := sTemp + ' AND ((SELECT Invoice_Location_Descr '
                   +  ' FROM Invoice_location '
                   +  ' WHERE Invoice_location.Invoice_location = Customer.Invoice_location) LIKE ''%' + RevenueCentre  + '%'')';
  if Rep <> 0 then
    begin
      if RepIsSubRep then
        sTemp := sTemp + ' AND ((SELECT TOP 1 Rep.Rep '
                   + ' FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
                   + ' WHERE ((Reps_Branches.Customer = Customer_Branch.Customer) AND '
                   + ' (Reps_Branches.Branch_no = Customer_Branch.Branch_no) AND '
                   + ' ((Reps_Branches.Is_Main_Rep IS NULL) OR (Reps_Branches.Is_Main_Rep = ''N'')) AND '
                   + ' (Reps_Branches.Rep = ' + inttostr(Rep) + '))) = ' + inttostr(Rep) + ')'
      else
        sTemp := sTemp + ' AND ((SELECT TOP 1 Rep.Rep '
                   + ' FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
                   + ' WHERE ((Reps_Branches.Customer = Customer_Branch.Customer) AND '
                   + ' (Reps_Branches.Branch_no = Customer_Branch.Branch_no) AND '
                   + ' (Reps_Branches.Rep = ' + inttostr(Rep) + '))'
                   + ' ORDER BY Reps_Branches.Is_Main_Rep DESC) = ' + inttostr(Rep) + ')'
    end;
  if RepName <> '' then
    sTemp := sTemp + ' AND ((SELECT top 1 Rep.Name '
                   + ' FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
	                 + ' WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer) AND '
                   + ' ((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))'
                   + ' ORDER BY Reps_Branches.Is_Main_Rep DESC) LIKE ''%' + RepName + '%'')';
  if SubRepName <> '' then
    sTemp := sTemp + ' AND ((SELECT TOP 1 Rep.Name '
                   + ' FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
	                 + ' WHERE ((Reps_Branches.Customer = Customer_Branch.Customer) AND (Reps_Branches.Branch_no = Customer_Branch.Branch_no)) AND '
				           + '(Reps_Branches.Rep <> (SELECT top 1 Rep.Rep '
                   + '             FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
	                 + '            WHERE ((Reps_Branches.Customer = Customer_Branch.Customer) AND (Reps_Branches.Branch_no = Customer_Branch.Branch_no))'
                   + '            ORDER BY Reps_Branches.Is_Main_Rep DESC))) LIKE ''%' + SubRepName + '%'')';
  if AccountManager <> '' then
    sTemp := sTemp + ' AND ((SELECT top 1 Operator.Name '
                   + ' FROM Operator INNER JOIN Customer_Operator ON Operator.Operator = Customer_Operator.Operator '
	                 + ' WHERE Customer_Operator.Customer = Customer_Branch.Customer '
                   + ' ORDER BY Customer_Operator.Is_main_Operator DESC) LIKE ''%' + AccountManager + '%'')';
  if Analysis1 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_1 LIKE ''' + Analysis1  + '%'')';
  if Analysis2 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_2 LIKE ''' + Analysis2  + '%'')';
  if Analysis3 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_3 LIKE ''' + Analysis3  + '%'')';
  if Analysis4 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_4 LIKE ''' + Analysis4  + '%'')';

  if DateCreated > 0 then
    sTemp := sTemp + ' AND Customer.Date_Created >= ' + qDate(DateCreated);

  sTemp := sTemp + ' AND ((Customer.acc_active = ''Y'') or (customer.acc_active = ''' + sShowInactive + '''))';

  if SortOrder = '' then
    sTemp := sTemp + ' ORDER BY Customer.Name '
  else
    sTemp := sTemp + ' ORDER BY ' + SortOrder;

//  sTemp := sTemp + ' ORDER BY Customer.Name ';

  qryCustomers.SQL.Text := qryCustomers.SQL.Text + sTemp;

  with qryCustomers do
  begin
    Close;
    parambyname('Code_From').asstring := GetCustomerName;
    Open;
  end;

end;

procedure TdtmdlCustomers.RefreshProspectData;
var
  sTemp : string ;
  sShowInactive: string;
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
  qryProspects.sql.clear;
  qryProspects.sql.text := qryProspectBase.sql.text;

  if not ShowInactive then
    sShowInactive := 'Y'
  else
    sShowInactive := 'N';

  sTemp := '';
  if Town <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Town LIKE ''%' + Town + '%'')';
  if Postcode <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Postcode LIKE ''' + Postcode + '%'')';
  if County <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.County LIKE ''%' + County + '%'')';
  if Telephone <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Phone LIKE ''' + Telephone  + '%'')';
  if Fax <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Fax_Number LIKE ''' + Fax  + '%'')';
  if CustomerStatus <> '' then
    sTemp := sTemp + ' AND (Customer_Status.Customer_Status_Descr LIKE ''' + CustomerStatus  + '%'')';
  if CustomerType <> '' then
    sTemp := sTemp + ' AND (Customer_Type.Description LIKE ''' + CustomerType  + '%'')';

  if Terms <> '' then
    sTemp := sTemp + ' AND ((SELECT Payment_Terms_Description '
                   +  ' FROM Payment_Terms '
                   +  ' WHERE Payment_Terms.Payment_Terms = Customer.Payment_Terms) LIKE ''%' + Terms  + '%'')';
  if RevenueCentre <> '' then
    sTemp := sTemp + ' AND ((SELECT Invoice_Location_Descr '
                   +  ' FROM Invoice_location '
                   +  ' WHERE Invoice_location.Invoice_location = Customer.Invoice_location) LIKE ''%' + RevenueCentre  + '%'')';
  if Importance <> '' then
    sTemp := sTemp + ' AND ((SELECT Importance_Description '
                   +  ' FROM Level_of_Importance '
                   +  ' WHERE Level_of_Importance.Level_of_Importance = Customer.Level_of_Importance) LIKE ''%' + Importance  + '%'')';
  if Rep <> 0 then
    begin
      if RepIsSubRep then
        sTemp := sTemp + ' AND ((SELECT TOP 1 Rep.Rep '
                   + ' FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
                   + ' WHERE ((Reps_Branches.Customer = Customer_Branch.Customer) AND '
                   + ' (Reps_Branches.Branch_no = Customer_Branch.Branch_no) AND '
                   + ' ((Reps_Branches.Is_Main_Rep IS NULL) OR (Reps_Branches.Is_Main_Rep = ''N'')) AND '
                   + ' (Reps_Branches.Rep = ' + inttostr(Rep) + '))) = ' + inttostr(Rep) + ')'
      else
        sTemp := sTemp + ' AND ((SELECT TOP 1 Rep.Rep '
                   + ' FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
                   + ' WHERE ((Reps_Branches.Customer = Customer_Branch.Customer) AND '
                   + ' (Reps_Branches.Branch_no = Customer_Branch.Branch_no) AND '
                   + ' (Reps_Branches.Rep = ' + inttostr(Rep) + '))'
                   + ' ORDER BY Reps_Branches.Is_Main_Rep DESC) = ' + inttostr(Rep) + ')'
    end;
  if RepName <> '' then
    sTemp := sTemp + ' AND ((SELECT top 1 Rep.Name '
                   + ' FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
	                 + ' WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer) AND '
                   + ' ((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))'
                   + ' ORDER BY Reps_Branches.Is_Main_Rep DESC) LIKE ''%' + RepName + '%'')';
  if AccountManager <> '' then
    sTemp := sTemp + ' AND ((SELECT top 1 Operator.Name '
                   + ' FROM Operator INNER JOIN Customer_Operator ON Operator.Operator = Customer_Operator.Operator '
	                 + ' WHERE Customer_Operator.Customer = Customer_Branch.Customer '
                   + ' ORDER BY Customer_Operator.Is_main_Operator DESC) LIKE ''%' + AccountManager + '%'')';
  if Analysis1 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_1 LIKE ''' + Analysis1  + '%'')';
  if Analysis2 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_2 LIKE ''' + Analysis2  + '%'')';
  if Analysis3 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_3 LIKE ''' + Analysis3  + '%'')';
  if Analysis4 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_4 LIKE ''' + Analysis4  + '%'')';

  if DateCreated > 0 then
    sTemp := sTemp + ' AND Customer.Date_Created >= ' + qDate(DateCreated);

  sTemp := sTemp + ' AND ((Customer.acc_active = ''Y'') or (customer.acc_active = ''' + sShowInactive + '''))';

  if SortOrder = '' then
    sTemp := sTemp + ' ORDER BY Customer.Name '
  else
    sTemp := sTemp + ' ORDER BY ' + SortOrder;

//  sTemp := sTemp + ' ORDER BY Customer.Name ';

  qryProspects.SQL.text := qryProspects.SQL.text + sTemp;

  with qryProspects do
  begin
    Close;
    parambyname('Code_From').asstring := '%' + CustomerName + '%';
    Open;
  end;

end;

function TdtmdlCustomers.ShowDirectDebitPrompt(tmpCode: integer): boolean;
begin
  with qryGetTerms do
    begin
      close;
      parambyname('Payment_Terms').asinteger := tmpCode;
      open;
      result := (fieldbyname('Payment_Type').asstring = 'DD');
    end;
end;

function TdtmdlCustomers.UsingSearch: boolean;
begin
  if (Town <> '') or
            (Postcode <> '') or
            (Telephone <> '') or
            (County <> '') or
            (Terms <> '') or
            (Fax <> '') or
            (CustomerStatus <> '') or
            (CustomerType <> '') or
            (RevenueCentre <> '') or
            (RepName <> '') or
            (SubRepName <> '') or
            (AccountManager <> '') or
            (Importance <> '') or
            (Analysis1 <> '') or
            (Analysis2 <> '') or
            (ShowInactive) then
    result := true
  else
    result := false;

end;

function TdtmdlCustomers.GetHeaderProspectCount: integer;
begin
  Result := qryProspects.RecordCount;
end;

procedure TdtmdlCustomers.RefreshBranches;
begin
  with qryCustomerBranches do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Name').asstring := '%' + BranchName + '%';
      if ShowInactiveBranches then
        ParamByName('inactive').AsString := 'Y'
      else
        ParamByName('inactive').AsString := 'N';
      open;
    end;
  with qryContacts do
    begin
      close;
      parambyname('Name').asstring := '%' + ContactName + '%';
      if ShowInactiveContacts then
        ParamByName('inactive').AsString := 'Y'
      else
        ParamByName('inactive').AsString := 'N';
      open;
    end;
end;

function TdtmdlCustomers.GetBranchCount: integer;
begin
  Result := qryCustomerBranches.RecordCount;

end;

function TdtmdlCustomers.GetContactCount: integer;
begin
  Result := qryContacts.RecordCount;

end;

function TdtmdlCustomers.GetCustomerName: string;
var
  CriteriaValue: string;
begin
  if CustomerName.IsEmpty then
    CriteriaValue := '%'
  else
    CriteriaValue := '%' + CustomerName + '%';
  Result := CriteriaValue;
end;

procedure TdtmdlCustomers.RefreshCategoryData;
begin
  with qryCustomerCategories do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;
    end;
end;

procedure TdtmdlCustomers.SetIncludeLapsed(const Value: boolean);
begin
  FIncludeLapsed := Value;
end;

procedure TdtmdlCustomers.SetIncludeProspects(const Value: boolean);
begin
  FIncludeProspects := Value;
end;

procedure TdtmdlCustomers.RefreshHOContacts;
begin
  with qryHOContacts do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Name').asstring := '%' + '' + '%';
      if ShowInactiveContacts then
        ParamByName('inactive').AsString := 'Y'
      else
        ParamByName('inactive').AsString := 'N';
      open;
    end;
end;

function TdtmdlCustomers.GetHOContactCount: integer;
begin
  Result := qryHOContacts.RecordCount;
end;

procedure TdtmdlCustomers.RefreshEndUserData;
var
  sTemp : string ;
  sShowInactive: string;
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
  qryEndUsers.sql.clear;
  qryEndUsers.sql.text := qryEndUserBase.sql.text;

  if not ShowInactive then
    sShowInactive := 'Y'
  else
    sShowInactive := 'N';

  sTemp := '';
  if Town <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Town LIKE ''%' + Town + '%'')';
  if Postcode <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Postcode LIKE ''' + Postcode + '%'')';
  if County <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.County LIKE ''%' + County + '%'')';
  if Telephone <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Phone LIKE ''' + Telephone  + '%'')';
  if Fax <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Fax_Number LIKE ''' + Fax  + '%'')';
  if CustomerStatus <> '' then
    sTemp := sTemp + ' AND (Customer_Status.Customer_Status_Descr LIKE ''' + CustomerStatus  + '%'')';
  if CustomerType <> '' then
    sTemp := sTemp + ' AND (Customer_Type.Description LIKE ''' + CustomerType  + '%'')';

  if Terms <> '' then
    sTemp := sTemp + ' AND ((SELECT Payment_Terms_Description '
                   +  ' FROM Payment_Terms '
                   +  ' WHERE Payment_Terms.Payment_Terms = Customer.Payment_Terms) LIKE ''%' + Terms  + '%'')';
  if RevenueCentre <> '' then
    sTemp := sTemp + ' AND ((SELECT Invoice_Location_Descr '
                   +  ' FROM Invoice_location '
                   +  ' WHERE Invoice_location.Invoice_location = Customer.Invoice_location) LIKE ''%' + RevenueCentre  + '%'')';
  if Importance <> '' then
    sTemp := sTemp + ' AND ((SELECT Importance_Description '
                   +  ' FROM Level_of_Importance '
                   +  ' WHERE Level_of_Importance.Level_of_Importance = Customer.Level_of_Importance) LIKE ''%' + Importance  + '%'')';
  if Rep <> 0 then
    begin
      if RepIsSubRep then
        sTemp := sTemp + ' AND ((SELECT TOP 1 Rep.Rep '
                   + ' FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
                   + ' WHERE ((Reps_Branches.Customer = Customer_Branch.Customer) AND '
                   + ' (Reps_Branches.Branch_no = Customer_Branch.Branch_no) AND '
                   + ' ((Reps_Branches.Is_Main_Rep IS NULL) OR (Reps_Branches.Is_Main_Rep = ''N'')) AND '
                   + ' (Reps_Branches.Rep = ' + inttostr(Rep) + '))) = ' + inttostr(Rep) + ')'
      else
        sTemp := sTemp + ' AND ((SELECT TOP 1 Rep.Rep '
                   + ' FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
                   + ' WHERE ((Reps_Branches.Customer = Customer_Branch.Customer) AND '
                   + ' (Reps_Branches.Branch_no = Customer_Branch.Branch_no) AND '
                   + ' (Reps_Branches.Rep = ' + inttostr(Rep) + '))'
                   + ' ORDER BY Reps_Branches.Is_Main_Rep DESC) = ' + inttostr(Rep) + ')'
    end;
  if RepName <> '' then
    sTemp := sTemp + ' AND ((SELECT top 1 Rep.Name '
                   + ' FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep '
	                 + ' WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer) AND '
                   + ' ((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))'
                   + ' ORDER BY Reps_Branches.Is_Main_Rep DESC) LIKE ''%' + RepName + '%'')';
  if AccountManager <> '' then
    sTemp := sTemp + ' AND ((SELECT top 1 Operator.Name '
                   + ' FROM Operator INNER JOIN Customer_Operator ON Operator.Operator = Customer_Operator.Operator '
	                 + ' WHERE Customer_Operator.Customer = Customer_Branch.Customer '
                   + ' ORDER BY Customer_Operator.Is_main_Operator DESC) LIKE ''%' + AccountManager + '%'')';
  if Analysis1 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_1 LIKE ''' + Analysis1  + '%'')';
  if Analysis2 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_2 LIKE ''' + Analysis2  + '%'')';
  if Analysis3 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_3 LIKE ''' + Analysis3  + '%'')';
  if Analysis4 <> '' then
    sTemp := sTemp + ' AND (Customer.Analysis_Code_4 LIKE ''' + Analysis4  + '%'')';

  if DateCreated > 0 then
    sTemp := sTemp + ' AND Customer.Date_Created >= ' + qDate(DateCreated);

  sTemp := sTemp + ' AND ((Customer.acc_active = ''Y'') or (customer.acc_active = ''' + sShowInactive + '''))';

  if SortOrder = '' then
    sTemp := sTemp + ' ORDER BY Customer.Name '
  else
    sTemp := sTemp + ' ORDER BY ' + SortOrder;

//  sTemp := sTemp + ' ORDER BY Customer.Name ';

  qryEndUsers.SQL.text := qryEndUsers.SQL.text + sTemp;

  with qryEndUsers do
  begin
    Close;
    parambyname('Code_From').asstring := '%' + CustomerName + '%';
    Open;
  end;

end;

function TdtmdlCustomers.GetHeaderEndUserCount: integer;
begin
  Result := qryEndUsers.RecordCount;
end;

end.
