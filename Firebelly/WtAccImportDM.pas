unit WTAccImportDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait;

type
  TdmAccImport = class(TDataModule)
    AddBranchSQL: TFDQuery;
    AddCustSQL: TFDQuery;
    GetBranchSQL: TFDQuery;
    UpCustSQL: TFDQuery;
    UpBranchSQL: TFDQuery;
    GetNextBranchSQL: TFDQuery;
    GetNextCustSQL: TFDQuery;
    GetNextContactSQL: TFDQuery;
    AddRepSQL: TFDQuery;
    AddContactSQL: TFDQuery;
    AddSuppSQL: TFDQuery;
    GetNextSuppSQL: TFDQuery;
    AddSuppBranchSQL: TFDQuery;
    UpSuppSQL: TFDQuery;
    UpSuppBranchSQL: TFDQuery;
    GetLastNarrSQL: TFDQuery;
    GetCustBranchSQL: TFDQuery;
    AddSuppContSQL: TFDQuery;
    GetNextSuppContactSQL: TFDQuery;
    GetSuppBranchSQL: TFDQuery;
    AddNarrSQL: TFDQuery;
    UpBranchNarrSQL: TFDQuery;
    GetSageCustomer: TFDQuery;
    Sage50Database: TFDConnection;
    CustExistSQL: TFDQuery;
    GetNextRepSQL: TFDQuery;
    AddNewRepSQL: TFDQuery;
    CheckRepSQL: TFDQuery;
    AddCurrencySQL: TFDQuery;
    GetSageSupplier: TFDQuery;
    SuppExistSQL: TFDQuery;
    UpCreditLimitSQL: TFDQuery;
    UpCompanyImpSQL: TFDQuery;
    GetSagePayments: TFDQuery;
    UpPaymentSQL: TFDQuery;
    GetCompanySQL: TFDQuery;
    UpCompanyPayDateSQL: TFDQuery;
    UpAuditHSQL: TFDQuery;
    GetSageAuditH: TFDQuery;
    GetSageAuditU: TFDQuery;
    UPAuditUSQL: TFDQuery;
    DelSageAuditH: TFDQuery;
    MaximiserDB: TFDConnection;
    GetMaxContacts: TFDQuery;
    GetMaxEmail: TFDQuery;
    GetMaxWebsite: TFDQuery;
    CustNameExistSQL: TFDQuery;
    CheckContactSQL: TFDQuery;
    QuickbooksDB: TFDConnection;
    DelRepSQL: TFDQuery;
    GetRepSQL: TFDQuery;
    GetCustBrSQL: TFDQuery;
    AddContactinfoSQL: TFDQuery;
    CheckBranchSQL: TFDQuery;
    UpdBranchSQL: TFDQuery;
    UpdContactSQL: TFDQuery;
    UpdContactInfoSQL: TFDQuery;
    qryGetLastCustType: TFDQuery;
    qryGetCustType: TFDQuery;
    qryAddCustType: TFDQuery;
    qryGetLastContType: TFDQuery;
    qryGetContType: TFDQuery;
    qryAddContType: TFDQuery;
    qryCheckMaterial: TFDQuery;
    qryGetNextMaterial: TFDQuery;
    qryAddMaterialType: TFDQuery;
    qryCheckWTGroup: TFDQuery;
    qryGetNextWTGroup: TFDQuery;
    qryAddWTGroup: TFDQuery;
    qryCheckWorktop: TFDQuery;
    qryGetNextWorktop: TFDQuery;
    qryAddWorktop: TFDQuery;
    qryCheckThickness: TFDQuery;
    qryGetNextThickness: TFDQuery;
    qryAddThickness: TFDQuery;
    qryAddWTThickness: TFDQuery;
    qryCheckWorktopThickness: TFDQuery;
    procedure Sage50DatabaseBeforeConnect(Sender: TObject);
    procedure MaximiserDBBeforeConnect(Sender: TObject);
    procedure QuickbooksDBBeforeConnect(Sender: TObject);
    procedure DatabaseError(ASender, AInitiator: TObject; var AException: Exception);
  private
    icustomer: integer;
    LastPaymentUpdate: TDateTime;
    FSettlementDays: integer;
    FBalance: real;
    FCreditLimit: real;
    FSettlementRate: real;
    FOnHold: string;
    FAddress1: string;
    FAddress4: string;
    FAccountRef: string;
    FWebAddress: string;
    FDelAddress2: string;
    FAddress3: string;
    FDelAddress4: string;
    FCurrency: string;
    FAddress2: string;
    FCompanyName: string;
    FAccountStatus: string;
    FDelAddress3: string;
    FTelephone: string;
    FDelFax: string;
    FDelAddress1: string;
    FRep: string;
    FContactName: string;
    FVAtNumber: string;
    FDelTelephone: string;
    FAddress5: string;
    FFax: string;
    FDelAddress5: string;
    FDelContact: string;
    FEmail: string;
    FSalesInvoice: integer;
    FPaidAmount: real;
    FPaidStatus: string;
    FPaidDate: TDateTime;
    FPaidFlag: string;
    FDateEntered: TDateTime;
    FTranNumber: integer;
    FInvRef: string;
    FTranType: string;
    FSplitXref: integer;
    FSplitNumber: integer;
    FUsageNumber: integer;
    FDeletedFlag: integer;
    FDetails: string;
    FReference: string;
    FUserName: string;
    FContactNo: integer;
    FSalutation: string;
    FRecordType: integer;
    FTitle: string;
    FRepCode: integer;
    FDelCode: string;
    FDelName: string;
    FMobile: string;
    FNoEmployees: integer;
    FCounty: string;
    FCustDataSource: integer;
    FForename: string;
    FCustomerType: string;
    FContactType: string;
    FMaterial: string;
    FWorktop: string;
    FGroup: string;
    FPrice: double;
    FThickness: string;
    { Private declarations }
    procedure DoOneMaximiserContact;
    procedure DoOneCreditLimit;
    procedure DoOnePayment;
    procedure DoOneAuditH;
    procedure DoOneAuditU;
    function GetContactType(sType: string): integer;
    procedure SetProperties(QuerySQL: TFDQuery);
    procedure SetMaximiserProperties(QuerySQL: TFDQuery);
    procedure SetAccountRef(const Value: string);
    procedure SetAccountStatus(const Value: string);
    procedure SetAddress1(const Value: string);
    procedure SetAddress2(const Value: string);
    procedure SetAddress3(const Value: string);
    procedure SetAddress4(const Value: string);
    procedure SetAddress5(const Value: string);
    procedure SetBalance(const Value: real);
    procedure SetCompanyName(const Value: string);
    procedure SetContactName(const Value: string);
    procedure SetCreditLimit(const Value: real);
    procedure SetCurrency(const Value: string);
    procedure SetDelAddress1(const Value: string);
    procedure SetDelAddress2(const Value: string);
    procedure SetDelAddress3(const Value: string);
    procedure SetDelAddress4(const Value: string);
    procedure SetDelAddress5(const Value: string);
    procedure SetDelContact(const Value: string);
    procedure SetDelFax(const Value: string);
    procedure SetDelTelephone(const Value: string);
    procedure SetFax(const Value: string);
    procedure SetOnHold(const Value: string);
    procedure SetRep(const Value: string);
    procedure SetSettlementDays(const Value: integer);
    procedure SetSettlementRate(const Value: real);
    procedure SetTelephone(const Value: string);
    procedure SetVAtNumber(const Value: string);
    procedure SetWebAddress(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetPaidAmount(const Value: real);
    procedure SetPaidDate(const Value: TDateTime);
    procedure SetPaidStatus(const Value: string);
    procedure SetSalesInvoice(const Value: integer);
    procedure SetPaidFlag(const Value: string);
    procedure SetDateEntered(const Value: TDateTime);
    procedure SetInvRef(const Value: string);
    procedure SetTranNumber(const Value: integer);
    procedure SetTranType(const Value: string);
    procedure SetDeletedFlag(const Value: integer);
    procedure SetDetails(const Value: string);
    procedure SetReference(const Value: string);
    procedure SetSplitNumber(const Value: integer);
    procedure SetSplitXref(const Value: integer);
    procedure SetUsageNumber(const Value: integer);
    procedure SetUserName(const Value: string);
    procedure SetContactNo(const Value: integer);
    procedure SetSalutation(const Value: string);
    procedure SetRecordType(const Value: integer);
    procedure SetTitle(const Value: string);
    procedure SetRepCode(const Value: integer);
    procedure SetDelCode(const Value: string);
    procedure SetDelName(const Value: string);
    procedure SetMobile(const Value: string);
    procedure SetCounty(const Value: string);
    procedure SetNoEmployees(const Value: integer);
    procedure SetCustDataSource(const Value: integer);
    procedure SetForename(const Value: string);
    function GetCustomerType(sType: string): integer;
    procedure SetCustomerType(const Value: string);
    procedure SetContactType(const Value: string);
    procedure SetWorktop(const Value: string);
    procedure SetGroup(const Value: string);
    procedure SetMaterial(const Value: string);
    procedure SetPrice(const Value: double);
    procedure SetThickness(const Value: string);
  public
    { Public declarations }
    iCustomercount, iSupplierCount, iCurrencycount, iCreditCount, iStockcount: integer;
    procedure DoOneCustomer;
    function DoOneCustomerRep: boolean;
    procedure DoOneSupplier;
    function DoOneWorktop: boolean;
    procedure AddMaximiserContacts(sDataSource: string);
    procedure AddQuickbooksCustomers(sDataSource: string);
    procedure AddCustomers(sDataSource: string);
    procedure AddSuppliers(sDataSource: string);
    procedure AddCreditLimits(sDataSource: string);
    procedure AddPayments(sDataSource: string);
    procedure AddStock(sDataSource: string);
    procedure AddCurrency;
    procedure SetCompanyImportDir(sTemp: string);
    property CompanyName: string read FCompanyName write SetCompanyName;
    property AccountRef: string read FAccountRef write SetAccountRef;
    property AccountStatus: string read FAccountStatus write SetAccountStatus;
    property Address1: string read FAddress1 write SetAddress1;
    property Address2: string read FAddress2 write SetAddress2;
    property Address3: string read FAddress3 write SetAddress3;
    property Address4: string read FAddress4 write SetAddress4;
    property Address5: string read FAddress5 write SetAddress5;
    property ContactName: string read FContactName write SetContactName;
    property ContactNo: integer read FContactNo write SetContactNo;
    property County: string read FCounty write SetCounty;
    property ContactType: string read FContactType write SetContactType;
    property CustDataSource: integer read FCustDataSource write SetCustDataSource;
    property CustomerType: string read FCustomerType write SetCustomerType;
    property Telephone: string read FTelephone write SetTelephone;
    property Fax: string read FFax write SetFax;
    property Forename: string read FForename write SetForename;
    property WebAddress: string read FWebAddress write SetWebAddress;
    property DelName: string read FDelName write SetDelName;
    property DelCode: string read FDelCode write SetDelCode;
    property DelAddress1: string read FDelAddress1 write SetDelAddress1;
    property DelAddress2: string read FDelAddress2 write SetDelAddress2;
    property DelAddress3: string read FDelAddress3 write SetDelAddress3;
    property DelAddress4: string read FDelAddress4 write SetDelAddress4;
    property DelAddress5: string read FDelAddress5 write SetDelAddress5;
    property DelContact: string read FDelContact write SetDelContact;
    property DelTelephone: string read FDelTelephone write SetDelTelephone;
    property DelFax: string read FDelFax write SetDelFax;
    property RecordType: integer read FRecordType write SetRecordType;
    property Rep: string read FRep write SetRep;
    property RepCode: integer read FRepCode write SetRepCode;
    property Salutation: string read FSalutation write SetSalutation;
    property Title: string read FTitle write SetTitle;
    property VAtNumber: string read FVAtNumber write SetVAtNumber;
    property Currency: string read FCurrency write SetCurrency;
    property SettlementRate: real read FSettlementRate write SetSettlementRate;
    property SettlementDays: integer read FSettlementDays write SetSettlementDays;
    property CreditLimit: real read FCreditLimit write SetCreditLimit;
    property NoEmployees: integer read FNoEmployees write SetNoEmployees;
    property OnHold: string read FOnHold write SetOnHold;
    property Balance: real read FBalance write SetBalance;
    property Email: string read FEmail write SetEmail;
    property Material: string read FMaterial write SetMaterial;
    property Worktop: string read FWorktop write SetWorktop;
    property Group: string read FGroup write SetGroup;
    property Thickness: string read FThickness write SetThickness;
    property Price: double read FPrice write SetPrice;
    property Mobile: string read FMobile write SetMobile;
    property PaidStatus: string read FPaidStatus write SetPaidStatus;
    property PaidAmount: real read FPaidAmount write SetPaidAmount;
    property PaidDate: TDateTime read FPaidDate write SetPaidDate;
    property PaidFlag: string read FPaidFlag write SetPaidFlag;
    property SalesInvoice: integer read FSalesInvoice write SetSalesInvoice;
    property TranNumber: integer read FTranNumber write SetTranNumber;
    property TranType: string read FTranType write SetTranType;
    property InvRef: string read FInvRef write SetInvRef;
    property DateEntered: TDateTime read FDateEntered write SetDateEntered;
    property UsageNumber: integer read FUsageNumber write SetUsageNumber;
    property SplitNumber: integer read FSplitNumber write SetSplitNumber;
    property SplitXref: integer read FSplitXref write SetSplitXref;
    property Reference: string read FReference write SetReference;
    property Details: string read FDetails write SetDetails;
    property UserName: string read FUserName write SetUserName;
    property DeletedFlag: integer read FDeletedFlag write SetDeletedFlag;
  end;

var
  dmAccImport: TdmAccImport;

Const
  SageCurrency: array[1..15] of string =
  ('Pounds',
   ' ',
   ' ',
   ' ',
   'Deutsch',
   ' ',
   ' ',
   ' ',
   ' ',
   ' ',
   ' ',
   ' ',
   ' ',
   'Dollar',
   ' ');

  cLump    = 5;  { Estimate throughput every ten records }

implementation

uses WTAccExport3, wtDataModule, AllCommon, wtMain;

var
  iTotal, i: integer;

{$R *.DFM}

const
  {Sage Audit Header SQL statement}
  SQLCoreSageAuditH =
  'select Audit_header.tran_number, '+
  ' Audit_header.type, '+
  ' Audit_Header.inv_ref, '+
  ' Audit_Header.Date_Entered, '+
  ' Audit_Header.Paid_Flag, '+
  ' Audit_Header.Paid_Status  '+
  'from Audit_header '+
  'where ((Audit_header.type = ''SR'') OR '+
  '(Audit_header.type = ''SA'') OR '+
  '(Audit_header.type = ''SI'')) ';
//  'Audit_header.Paid_Flag = ''Y'' ';

  {Sage Audit Usage SQL statement}
  SQLCoreSageAuditU =
  'select * '+
  'from Audit_Usage '+
  'where ((Audit_usage.type = ''SR'') OR '+
  '(Audit_usage.type = ''SA'') OR '+
  '(Audit_usage.type = ''SI'')) ';

  SQLCore =
  'select Sage_Audit_header.tran_number, '+
  ' Sage_Audit_header.type, '+
  ' Sage_Audit_usage.split_number, '+
  ' Sage_Audit_usage.amount, '+
  ' AuditH.inv_ref, '+
  ' Sage_Audit_Header.Date_Entered, '+
  ' AuditH.Paid_Flag, '+
  ' AuditH.Paid_Status  '+
  'from Sage_Audit_header, Sage_Audit_usage, Sage_Audit_header AuditH '+
  'where ((Sage_Audit_header.type = ''SR'') OR '+
  '(Sage_Audit_header.type = ''SA'')) AND '+
  ' (Sage_Audit_header.tran_number = Sage_Audit_usage.split_crossref) and '+
  ' (Sage_Audit_usage.split_number = AuditH.tran_number) ';


procedure TdmAccImport.AddCustomers(sDataSource: string);
begin
  Sage50Database.ConnectionDefName := sDataSource;
  Sage50Database.Connected := true;
  with GetSageCustomer do
    begin
      close;
      open;

      iTotal := recordcount;
      i := 0;
      while not eof do
        begin
          inc(i);
          SetProperties(GetSageCustomer);
          DoOneCustomer;
          frmWTAccExport3.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TdmAccImport.AddSuppliers(sDataSource: string);
begin
  Sage50Database.ConnectionDefName := sDataSource;
  Sage50Database.Connected := true;
  with GetSageSupplier do
    begin
      close;
      open;

      iTotal := recordcount;
      i := 0;
      while not eof do
        begin
          inc(i);
          SetProperties(GetSageSupplier);
          DoOneSupplier;
          frmWTAccExport3.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TdmAccImport.SetProperties(QuerySQL: TFDQuery);
begin
  with QuerySQL do
  begin
    AccountRef := fieldbyName('ACCOUNT_REF').asstring;
    Address1 := fieldbyName('ADDRESS_1').asstring;
    Address2 := fieldbyName('ADDRESS_2').asstring;
    Address3 := fieldbyName('ADDRESS_3').asstring;
    Address4 := fieldbyName('ADDRESS_4').asstring;
    CompanyName := fieldbyName('NAME').asstring;
    Address5 := fieldbyName('ADDRESS_5').asstring;
    ContactName := fieldbyname('CONTACT_NAME').asstring;
    Telephone := fieldbyName('TELEPHONE').asstring;
    Fax := fieldbyName('FAX').asstring;
    EMail := fieldbyName('E_MAIL').asstring;
    WebAddress := fieldbyName('Web_Address').asstring;
    DelAddress1 := fieldbyName('DEL_ADDRESS_1').asstring;
    DelAddress2 := fieldbyName('DEL_ADDRESS_2').asstring;
    DelAddress3 := fieldbyName('DEL_ADDRESS_3').asstring;
    DelAddress4 := fieldbyName('DEL_ADDRESS_4').asstring;
    DelAddress5 := fieldbyName('DEL_ADDRESS_5').asstring;
    DelContact := fieldbyname('DEL_CONTACT_NAME').asstring;
    DelTelephone := fieldbyName('DEL_TELEPHONE').asstring;
    DelFAX := fieldbyName('DEL_FAX').asstring;
    AccountStatus := fieldbyName('ANALYSIS_1').asstring;
    Rep := fieldbyName('ANALYSIS_2').asstring;
    VATNumber := fieldbyName('VAT_REG_NUMBER').asstring;
    Currency := fieldbyName('CURRENCY').asstring;
    SettlementRate := fieldbyName('SETTLEMENT_DISC_RATE').asfloat;
    SettlementDays := fieldbyname('SETTLEMENT_DUE_DAYS').asinteger;
    CreditLimit := fieldbyname('CREDIT_LIMIT').asfloat;
    OnHold := fieldbyname('ACCOUNT_ON_HOLD').asstring;
    Balance := fieldbyname('Balance').asfloat;
    try
      Salutation := fieldbyname('First_Name').asstring;
    except
      Salutation := '';
    end;
  end;
end;

procedure TdmAccImport.SetMaximiserProperties(QuerySQL: TFDQuery);
begin
  with QuerySQL do
  begin
    AccountRef := fieldbyName('Client_id').asstring;
    RecordType := fieldbyName('Record_Type').asinteger;
    ContactNo := fieldbyName('Contact_Number').asinteger;
    Address1 := fieldbyName('ADDRESS_1').asstring;
    Address2 := fieldbyName('ADDRESS_2').asstring;
    Address3 := fieldbyName('ADDRESS_3').asstring;
    Address4 := fieldbyName('ADDRESS_4').asstring;
    Address5 := fieldbyName('ADDRESS_5').asstring;
    CompanyName := fieldbyName('NAME').asstring;
    if trim(fieldbyname('First_Name').asstring) <> '' then
      ContactName := trim(fieldbyname('First_Name').asstring + ' ' + fieldbyname('Name').asstring)
    else
      ContactName := trim(fieldbyname('Name').asstring);
    Salutation := fieldbyname('Salutation').asstring;
    salutation := trim(StringReplace(Salutation,'Dear','',[rfReplaceAll]));

    Title := fieldbyname('Title').asstring;
    Telephone := fieldbyName('Phone_1').asstring;
    Fax := fieldbyName('Phone_2').asstring;
    with GetMaxEmail do
      begin
        close;
        parambyname('Client_id').asstring := AccountRef;
        parambyname('Contact_Number').asinteger := ContactNo;
        open;
        EMail := fieldbyName('E_MAIL').asstring;
      end;

    with GetMaxWebsite do
      begin
        close;
        parambyname('Client_id').asstring := AccountRef;
        parambyname('Contact_Number').asinteger := ContactNo;
        open;
        WebAddress := fieldbyName('Web_Address').asstring;
      end;

    DelAddress1 := '';
    DelAddress2 := '';
    DelAddress3 := '';
    DelAddress4 := '';
    DelAddress5 := '';
    DelContact := '';
    DelTelephone := '';
    DelFAX := '';
    AccountStatus := '';
    Rep := '';
    VATNumber := '';
    Currency := '1';
    SettlementRate := 0.00;
    SettlementDays := 0;
    CreditLimit := 0.00;
    OnHold := 'U';
    Balance := 0.00;
  end;
end;

function TdmAccImport.DoOneCustomerRep: boolean;
var
  iCust, iBranch, icontact, iRep: integer;
begin
  Result := false;

  CustNameExistSQL.close;
  CustNameExistSQl.Parambyname('Name').asstring := trim(CompanyName);
  CustNameExistSQL.open;

  {Don't add if already exists}
  if CustNameExistSQL.recordcount > 0 then
    iCust := CustNameExistSQL.fieldbyname('Customer').asinteger
  else
    exit;

// Get Rep Code
  with GetRepSQL do
    begin
      close;
      parambyname('Name').asstring := Rep;
      open;
      if recordcount > 0 then
        iRep := fieldbyname('Rep').asinteger
      else
        exit;
    end;

  With DelRepSQL do
    begin
      close ;
      ParamByName('Customer').AsInteger := icust ;
      ExecSQL ;
    end;

  with GetCustBrSQL do
    begin
      close;
      ParamByName('Customer').AsInteger := icust ;
      open;

      first;

      while eof <> true do
        begin
          iBranch := fieldbyname('Branch_no').asinteger;

          AddRepSQL.close ;
          AddRepSQL.ParamByName('Customer').AsInteger := icust ;
          AddRepSQL.ParamByName('Branch_No').AsInteger := iBranch;
          AddRepSQL.ParamByName('Rep').AsInteger := iRep;
          AddRepSQL.ParamByName('Percentage').AsFloat := 100;
          AddRepSQL.ExecSQL ;

          next;
        end;
    end;

  result := true;
end;

procedure TdmAccImport.DoOneCustomer;
var
  iCust, icontact, iRep: integer;
begin
  {Check that Customer exists}
  CustExistSQL.close;
  CustExistSQl.Parambyname('Account_Code').asstring := trim(copy(AccountRef,1,8));
  CustExistSQl.Parambyname('Customer_Name').asstring := trim(CompanyName);
  CustExistSQL.open;

  {Don't add if already exists}
  if CustExistSQL.recordcount > 0 then
    iCust := CustExistSQL.fieldbyname('Customer').asinteger
  else
  begin
    iCustomerCount := iCustomerCount + 1;
    with GetNextCustSQL do
      begin
        close;
        open;
        iCust := fieldbyname('Last_Customer').asinteger+1;
      end;

    {Add Customer}
    with AddCustSQL do
      begin
        close;
        parambyname('Customer').asinteger := iCust;
        parambyname('Customer_Name').asstring := CompanyName;
        parambyname('Credit_limit').asfloat := CreditLimit;
        parambyname('Not_Active').asstring := 'N';
        parambyname('Credit_Status').asstring := 'U';

        parambyname('Customer_Type').asinteger := GetCustomerType(CustomerType);
        parambyname('VAT').asinteger := dtmdlWorktops.GetDefaultVat;
        parambyname('Date_Created').asdatetime := date;
        ParamByName('Street').AsString := Address1;
        ParamByName('Locale').AsString := Address2;
        ParamByName('Town_City').AsString := Address4;
        ParamByName('PostCode').AsString := Address5;
        ParamByName('Telephone_number').AsString := Telephone;
        ParamByName('Fax_Number').AsString := Fax;
        ParamByName('EMail_address').AsString := EMail+' ';
        ParamByName('Account_Code').AsString := '';
        ParamByName('Is_Retail_Customer').AsString := 'N';
        ParamByName('County_State').AsString := County;
        ParamByName('Use_Online_Ordering').AsString := 'N';
        ParamByName('Discount_Rate').Asfloat := 0.00;
        ParamByName('Deposit_Terms').Asinteger := 50;
        ParamByName('No_of_Employees').Asinteger := NoEmployees;
        ParamByName('Web_Address').Asstring := WebAddress;
        ParamByName('Data_Source').Asinteger := CustDataSource;
        ParamByName('Prospect').Asstring := 'Y';
        ParamByName('Rep').Asinteger := 1;
        execsql;
      end;
  end;

  if ContactName <> '' then
    begin
      {So if Contact exists}
      CheckContactSQL.close;
      CheckContactSQL.parambyname('Customer').asinteger := iCust;
      CheckContactSQL.parambyname('Name').asstring := ContactName;
      CheckContactSQL.open;

      if CheckContactSQL.RecordCount > 0 then
        begin
          iContact := CheckContactSQL.fieldbyname('Contact_no').asinteger;

          With UpdContactSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icust;
            ParamByName('Contact_No').AsInteger := icontact;
            ParamByName('Contact_Name').AsString := ContactName;
            ParamByName('Telephone_number').AsString := Telephone;
            ParamByName('Fax_number').AsString := Fax+' ';
            ParamByName('Mobile_Number').AsString := Mobile+' ';
            ParamByName('Email_address').AsString := Email+' ';
            ParamByName('Contact_Type').Asinteger := GetContactType(ContactType);
            ParamByName('Title').AsString := Title;
            ParamByName('Forename').AsString := ForeName;
            ExecSQL ;
          end;
        end
      else
        begin
          with GetNextContactSQL do
          begin
            close;
            parambyname('Customer').asinteger := iCust;
            open;

            iContact := fieldbyname('Last_Contact').asinteger+1;
          end;

          With AddContactSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icust;
            ParamByName('Contact_No').AsInteger := icontact;
            ParamByName('Contact_Name').AsString := ContactName;
            ParamByName('Telephone_number').AsString := Telephone;
            ParamByName('Fax_number').AsString := Fax+' ';
            ParamByName('Mobile_Number').AsString := Mobile+' ';
            ParamByName('Email_address').AsString := Email+' ';
            ParamByName('Contact_Type').Asinteger := GetContactType(ContactType);
            ParamByName('Title').AsString := Title;
            ParamByName('Forename').AsString := ForeName;
            ExecSQL ;
          end;

        end;
    end;
end;

function TdmAccImport.DoOneWorktop: boolean;
var
  iMaterial, iMaterialCount: integer;
  iGroup, iGroupCount: integer;
  iWorktop, iWorktopCount: integer;
  iThickness, iThicknessCount: integer;
  iPricePointer: integer;
begin
  Result := false;

  {Check whether Material exists .... if not then add}
  iMaterial := 0;
  with qryCheckMaterial do
    begin
      close;
      Parambyname('Description').asstring := trim(Material);
      open;

      {Don't add if already exists}
      if recordcount > 0 then
        iMaterial := fieldbyname('Material_Type').asinteger
      else
        begin
          iMaterialCount := iMaterialCount + 1;
          with qryGetNextMaterial do
            begin
              close;
              open;
              iMaterial := fieldbyname('Last_Material').asinteger+1;
            end;

          {Add Material Type}
          with qryAddMaterialType do
            begin
              close;
              parambyname('Material_Type').asinteger := iMaterial;
              parambyname('Description').asstring := Material;
              execsql;
            end;

        end;
    end;

  {Check whether a group exists .... if not then add}
  iGroup := 0;
  if Group <> '' then
    begin
      with qryCheckWTGroup do
        begin
          close;
          parambyname('Material_Type').asinteger := iMaterial;
          Parambyname('Worktop_Group_Description').asstring := trim(Group);
          open;

          {Don't add if already exists}
          if recordcount > 0 then
            iGroup := fieldbyname('Worktop_Group').asinteger
          else
            begin
              iGroupCount := iGroupCount + 1;
              with qryGetNextWTGroup do
                begin
                  close;
                  open;
                  iGroup := fieldbyname('Last_Group').asinteger+1;
                end;

              {Add Worktop Group}
              with qryAddWTGroup do
                begin
                  close;
                  parambyname('Worktop_Group').asinteger := iGroup;
                  parambyname('Worktop_Group_Description').asstring := Group;
                  parambyname('Material_Type').asinteger := iMaterial;
                  execsql;
                end;

            end;
        end;
    end;

  {Check whether a Worktop exists .... if not then add}
  iWorktop := 0;
  if trim(Worktop) <> '' then
    begin
      with qryCheckWorktop do
        begin
          close;
          Parambyname('Description').asstring := trim(Worktop);
          Parambyname('Material_Type').asinteger := iMaterial;
          open;

          {Don't add if already exists}
          if recordcount > 0 then
            iWorktop := fieldbyname('Worktop').asinteger
          else
            begin
              iWorktopCount := iWorktopCount + 1;
              with qryGetNextWorktop do
                begin
                  close;
                  open;
                  iWorktop := fieldbyname('Last_Worktop').asinteger+1;
                end;

              {Add Worktop }
              with qryAddWorktop do
                begin
                  close;
                  parambyname('Worktop').asinteger := iWorktop;
                  parambyname('Description').asstring := trim(Worktop);
                  parambyname('Material_Type').asinteger := iMaterial;
                  if iGroup = 0 then
                    parambyname('Worktop_Group').clear
                  else
                    parambyname('Worktop_Group').asinteger := iGroup;
                  execsql;
                end;
            end;
        end;
    end;

  {Check whether thickness exists .... if not then add}
  iThickness := 0;
  if Thickness <> '' then
    begin
      with qryCheckThickness do
        begin
          close;
          Parambyname('Thickness_mm').asstring := trim(Thickness) + ' mm';
          open;

          {Don't add if already exists}
          if recordcount > 0 then
            iThickness := fieldbyname('Thickness').asinteger
          else
            begin
              iThicknessCount := iThicknessCount + 1;
              with qryGetNextThickness do
                begin
                  close;
                  open;
                  iThickness := fieldbyname('Last_Thickness').asinteger+1;
                end;

              {Add Worktop }
              with qryAddThickness do
                begin
                  close;
                  parambyname('Thickness').asinteger := iThickness;
                  parambyname('Thickness_mm').asstring := trim(Thickness) + ' mm';
                  execsql;
                end;
            end;
        end;
    end;

  {Add worktop thickness record}
  if (iThickness <> 0) and (iWorktop <> 0) and (Price <> 0) then
    begin
      qryCheckWorktopThickness.close;
      qryCheckWorktopThickness.parambyname('Worktop').asinteger := iWorktop;
      qryCheckWorktopThickness.parambyname('Thickness').asinteger := iThickness;
      qryCheckWorktopThickness.open;
      if qryCheckWorktopThickness.recordcount > 0 then
        iPricePointer := qryCheckWorktopThickness.fieldbyname('Price_Pointer').asinteger
      else
        begin
          dtmdlWorktops.qryNewPrice.Close;
          dtmdlWorktops.qryNewPrice.Open;
          iPricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

          {Add new price pointer record}
	        dtmdlWorktops.qryAddPointer.Close;
          dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := iPricePointer;
          dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
	        dtmdlWorktops.qryAddPointer.ExecSQl;

          try
            qryAddWTThickness.close;
            qryAddWTThickness.parambyname('Worktop').asinteger := iWorktop;
            qryAddWTThickness.parambyname('Thickness').asinteger := iThickness;
            qryAddWTThickness.parambyname('Price_Pointer').asinteger := iPricePointer;
            qryAddWTThickness.execsql;
          except
          end;
        end;

      {Add new price record}
	    dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := iPricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := Price;
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := 0.00;
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
	    dtmdlWorktops.qryAddPrice.execSQL;
    end;

  result := true;
end;

function  TdmAccImport.GetCustomerType(sType: string): integer;
var
  iCode: integer;
begin
  with qryGetCustType do
    begin
      close;
      parambyname('Description').asstring := sType;
      open;
      if recordcount > 0 then
        result := fieldbyname('Customer_type').asinteger
      else
        begin

          qryGetLastCustType.close;
          qryGetLastCustType.open;
          iCode := qryGetLastCustType.fieldbyname('Last_Code').asinteger+1;


          qryAddCustType.close;
          qryAddCustType.parambyname('Customer_Type').asinteger := iCode;
          qryAddCustType.parambyname('Description').asstring := sType;
          qryAddCustType.execsql;

          result := iCode;
        end;
    end;
end;

procedure TdmAccImport.MaximiserDBBeforeConnect(Sender: TObject);
begin
  ConfigureFDConnection(MaximiserDB);
end;

procedure TdmAccImport.QuickbooksDBBeforeConnect(Sender: TObject);
begin
  ConfigureFDConnection(QuickbooksDB);
end;

function  TdmAccImport.GetContactType(sType: string): integer;
var
  iCode: integer;
begin
  with qryGetContType do
    begin
      close;
      parambyname('Contact_Type_Description').asstring := sType;
      open;
      if recordcount > 0 then
        result := fieldbyname('Contact_type').asinteger
      else
        begin

          qryGetLastContType.close;
          qryGetLastContType.open;
          iCode := qryGetLastContType.fieldbyname('Last_Code').asinteger+1;


          qryAddContType.close;
          qryAddContType.parambyname('Contact_Type').asinteger := iCode;
          qryAddContType.parambyname('Contact_Type_Description').asstring := sType;
          qryAddContType.execsql;

          result := iCode;
        end;
    end;
end;

procedure TdmAccImport.DoOneMaximiserContact;
var
  iBranch, icontact, iRep: integer;
begin
  {Check that Customer exists}
  if  (RecordType = 1) or
      (RecordType = 2) then
    begin
      CustNameExistSQL.close;
      CustNameExistSQl.Parambyname('Name').asstring := trim(CompanyName);
      CustNameExistSQL.open;

      {Don't add if already exists}
      if CustNameExistSQL.recordcount > 0 then exit;

      iCustomerCount := iCustomerCount + 1;
      with GetNextCustSQL do
        begin
          close;
          open;
          iCustomer := fieldbyname('Last_Customer').asinteger+1;
        end;

      {Add Customer}
      with AddCustSQL do
        begin
          close;
          parambyname('Customer').asinteger := iCustomer;
          parambyname('Name').asstring := CompanyName;
          parambyname('Settlement_Discount').asfloat := SettlementRate;
          parambyname('Settlement_Days').asinteger := SettlementDays;
          parambyname('Credit_limit').asfloat := CreditLimit;
          parambyname('Acc_Active').asstring := 'Y';
          if OnHold = 'Y' then
            parambyname('Credit_Status').asstring := 'S'
          else;
            parambyname('Credit_Status').asstring := 'U';

          parambyname('Customer_Type').asinteger := 1;
          parambyname('Intrastat_id').asinteger := 1;
          parambyname('Country_id').clear;
          parambyname('VAT_Reference').asstring := VATNumber;
          parambyname('Customer_Status').asinteger := 1;
          parambyname('Available_Credit').asfloat := CreditLimit-Balance;
          parambyname('Currency_Code_Def').asinteger := strtoint(Currency);
          parambyname('VAT_Code_Def').asinteger := 1;
          execsql;
        end;

      {Add Branch}
      with AddBranchSQL do
        begin
          Close ;
          ParamByName('Customer').AsInteger := iCustomer;
          ParamByName('Branch_no').AsInteger := 0 ;
          ParamByName('Name').AsString := 'Head Office' ;
          ParamByName('Building_No_Name').AsString := Address1;
          ParamByName('Street').AsString := Address2;
          ParamByName('Locale').AsString := Address3;
          ParamByName('Town').AsString := Address4;
          ParamByName('PostCode').AsString := Address5;
          ParamByName('Phone').AsString := Telephone;
          ParamByName('Fax_Number').AsString := Fax;
          ParamByName('EMail').AsString := EMail;
          ParamByName('Narrative').Clear;
          ParamByName('Account_Code').AsString := '';
          ParamByName('Inv_To_Customer').asinteger := iCustomer;
          ParamByName('Inv_To_Branch').AsInteger := 0;
          ExecSQL ;
        end;

      {Add Rep if there is one}
      if Rep <> '' then
        begin
          {Check to see if the rep exists}
          with CheckRepSQL do
            begin
              close;
              parambyname('Name').asstring := Rep;
              open;

              if recordcount = 0 then
                begin
                  GetNextRepSQL.close;
                  GetNextRepSQL.open;
                  iRep := GetNextRepSQL.fieldbyname('Last_Record').asinteger + 1;

                  AddNewRepSQL.close;
                  AddNewRepSQL.parambyname('Rep').asinteger := iRep;
                  AddNewRepSQL.parambyname('Name').asstring := Rep;
                  AddNewRepSQl.execSQl;
                end
              else
                iRep := CheckRepSQL.fieldbyname('Rep').asinteger;
            end;

          With AddRepSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icustomer ;
            ParamByName('Branch_No').AsInteger := 0;
            ParamByName('Rep').AsInteger := iRep;
            ParamByName('Percentage').AsFloat := 100;
            ExecSQL ;
          end;
        end;

      {Add Delivery Address}
      if DelAddress1 <> '' then
        begin
          with GetNextBranchSQl do
            begin
              close;
              parambyname('Customer').asinteger := iCustomer;
              open;

              iBranch := fieldbyname('Last_Branch').asinteger+1;
            end;

          with AddBranchSQL do
            begin
              Close ;
        	    ParamByName('Customer').AsInteger := iCustomer ;
        	    ParamByName('Branch_no').AsInteger := iBranch ;
        	    ParamByName('Name').AsString := 'Delivery Address';
        	    ParamByName('Building_No_Name').AsString := DelAddress1;
        	    ParamByName('Street').AsString := DelAddress2;
        	    ParamByName('Locale').AsString := DelAddress3;
        	    ParamByName('Town').AsString := DelAddress4;
        	    ParamByName('PostCode').AsString := DelAddress5;
        	    ParamByName('Phone').AsString := DelTelephone;
        	    ParamByName('Fax_Number').AsString := DelFax;
        	    ParamByName('EMail').AsString := '';
              ParamByName('Narrative').Clear;
        	    ParamByName('Account_Code').AsString := '';
              ParamByName('Inv_To_Customer').asinteger := iCustomer;
              ParamByName('Inv_To_Branch').AsInteger := 0;
        	    ExecSQL ;
            end;
        end;
    end;
  {Add Contact if there is one}
  if RecordType > 1 then
    begin
      with CheckContactSQL do
      begin
        close;
        parambyname('Customer').asinteger := iCustomer;
        parambyname('Branch_no').asinteger := 0;
        parambyname('Name').asstring := ContactName;
        open;
        if recordcount > 0 then
          exit;
      end;

      with GetNextContactSQL do
      begin
        close;
        parambyname('Customer').asinteger := iCustomer;
        parambyname('Branch_no').asinteger := 0;
        open;

        iContact := fieldbyname('Last_Contact').asinteger+1;
      end;

      With AddContactSQL do
      begin
        Close ;
        ParamByName('Customer').AsInteger := icustomer;
        ParamByName('Branch_No').AsInteger := 0;
        ParamByName('Contact_No').AsInteger := icontact;
        ParamByName('Name').AsString := ContactName;
        ParamByName('Phone').AsString := Telephone;
        ParamByName('EMail').AsString := Email;
        ParamByName('Salutation').AsString := Salutation;
        ParamByName('Contact_Type').AsInteger := GetContactType(Title);
        ExecSQL ;
      end;
    end;
end;

procedure TdmAccImport.DoOneSupplier;
var
  iSupp, icontact: integer;
begin
  {Check that Customer exists}
  SuppExistSQL.close;
  SuppExistSQl.Parambyname('Account_Code').asstring := trim(copy(AccountRef,1,8));
  SuppExistSQL.open;

  {Don't add if already exists}
  if SuppExistSQL.recordcount > 0 then exit;

  iSupplierCount := iSuppliercount + 1;

  with GetNextSuppSQL do
    begin
      close;
      open;
      iSupp := fieldbyname('Last_Supplier').asinteger+1;
    end;

  {Add Supplier}
  with AddSuppSQL do
    begin
      close;
   		ParamByName('Supplier').AsInteger := iSupp ;
      ParamByName('Name').AsString := CompanyName;
      ParamByName('Acc_Active').AsString := 'Y';
      ParamByName('Discount').AsFloat := SettlementRate;
      ParamByName('Intrastat_Id').AsInteger := 1;
      ParamByName('Country_Id').Clear;
      ParamByName('Currency_Code').asinteger := strtoint(Currency);
      ParamByName('VAT_Reference').AsString := VATNumber;
      Parambyname('Vat_Code_Def').asinteger := 1;
      ExecSQL ;
    end;

  {Add Branch}
  With AddSuppBranchSQL do
    begin
      Close ;
      ParamByName('Supplier').AsInteger := isupp ;
      ParamByName('Name').AsString := 'Head Office' ;
      ParamByName('Account_Code').AsString := AccountRef;
      ParamByName('Building_No_Name').AsString := Address1;
      ParamByName('Street').AsString := Address2;
      ParamByName('Locale').AsString := Address3;
      ParamByName('Town').AsString := Address4;
      ParamByName('PostCode').AsString := Address5;
      ParamByName('Phone').AsString := Telephone;
      ParamByName('Fax_Number').AsString := fax;
      ParamByName('EMail').AsString := email;
      ParamByName('Narrative').Clear;
      ExecSQL ;
    end;


  {Add Contact if there is one}
  if ContactName <> '' then
    begin
      with GetNextSuppContactSQL do
      begin
        close;
        parambyname('Supplier').asinteger := iSupp;
        parambyname('Branch_no').asinteger := 0;
        open;

        iContact := fieldbyname('Last_Contact').asinteger+1;
      end;

      With AddSuppContSQL do
      begin
        Close ;
        ParamByName('Supplier').AsInteger := isupp;
        ParamByName('Branch_No').AsInteger := 0;
        ParamByName('Contact_No').AsInteger := icontact;
        ParamByName('Name').AsString := ContactName;
        ParamByName('Phone').AsString := Telephone;
        ParamByName('EMail').AsString := '';
        ParamByName('Salutation').AsString := '';
        ParamByName('Contact_Type').AsInteger := 1;
        ExecSQL ;
      end;
    end;

(*  {Add Delivery Address}
  if DelAddress1 <> '' then
    begin
      with GetNextBranchSQl do
        begin
          close;
          parambyname('Customer').asinteger := iCust;
          open;

          iBranch := fieldbyname('Last_Branch').asinteger+1;
        end;

      with AddBranchSQL do
        begin
          Close ;
        	ParamByName('Customer').AsInteger := iCust ;
        	ParamByName('Branch_no').AsInteger := iBranch ;
        	ParamByName('Name').AsString := 'Delivery Address';
        	ParamByName('Building_No_Name').AsString := DelAddress1;
        	ParamByName('Street').AsString := DelAddress2;
        	ParamByName('Locale').AsString := DelAddress3;
        	ParamByName('Town').AsString := DelAddress4;
        	ParamByName('PostCode').AsString := DelAddress5;
        	ParamByName('Phone').AsString := DelTelephone;
        	ParamByName('Fax_Number').AsString := DelFax;
        	ParamByName('EMail').AsString := '';
          ParamByName('Narrative').Clear;
        	ParamByName('Account_Code').AsString := '';
          ParamByName('Inv_To_Customer').asinteger := iCust;
          ParamByName('Inv_To_Branch').AsInteger := 0;
        	ExecSQL ;
        end;
    end;
*)
end;

procedure TdmAccImport.AddCurrency;
var
  icount: integer;
begin
  for icount := 1 to 15 do
    begin
      if trim(SageCurrency[icount]) = '' then continue;
      iCurrencyCount := iCurrencyCount + 1;
      try
        AddCurrencySQL.close;
        AddCurrencySQL.parambyname('Currency_Code').asinteger := icount;
        AddCurrencySQL.parambyname('Currency_Code_Descr').asstring := SageCurrency[icount];
        AddCurrencySQL.execsql;
      except
      end;
    end;
end;

procedure TdmAccImport.AddCreditLimits(sDataSource: string);
begin
  Sage50Database.ConnectionDefName := sDataSource;
  Sage50Database.Connected := true;
  with GetSageCustomer do
    begin
      close;
      open;

      iTotal := recordcount;
      i := 0;
      while not eof do
        begin
          inc(i);
          SetProperties(GetSageCustomer);
          DoOneCreditLimit;
          frmWTAccExport3.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TdmAccImport.AddPayments(sDataSource: string);
var
  sTemp : string;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;

function sageDate(const aDate : TDateTime) : string;
  begin
     Result := '''' + FormatDateTime('yyyy"-"mm"-"dd', aDate) + '''';
  end;
{ Local function }
begin
  with GetCompanySQL do
    begin
      close;
      open;
      if fieldbyname('Last_Payment_Update').asstring = '' then
        LastPaymentUpdate := paDateStr('31/12/1999')
      else
        LastPaymentUpdate := fieldbyname('Last_Payment_Update').asdatetime;
    end;
  Sage50Database.ConnectionDefName := sDataSource;
  Sage50Database.Connected := true;

  {Clear the Sage Audit File}
  with DelSageAuditH do
    begin
      close;
      execsql;
    end;
  {load the Sage Audit Header details first}
  sTemp := SQLCoreSageAuditH;
//  sTemp := sTemp + ' ';
//  sTemp := sTemp + ' AND Audit_Header.Date_Entered >= ' + sageDate(LastPaymentUpdate);

  with GetSageAuditH do
    begin
      frmWTAccExport3.lblstatus.caption := 'Processing step 1/3 - Sage Audit Header records';
      close;
      sql.text := sTemp;
      open;

      iTotal := recordcount;
      i := 0;
      while eof <> true do
        begin
          inc(i);
          TranNumber := fieldbyname('TRAN_NUMBER').asinteger;
          TranType := fieldbyname('TYPE').asstring;
          InvRef := fieldbyname('INV_REF').asstring;
          DateEntered := fieldbyname('DATE_ENTERED').asdatetime;
          PaidFlag := fieldbyname('PAID_FLAG').asstring;
          PaidStatus := fieldbyname('PAID_STATUS').asstring;
          DoOneAuditH;

          frmWTAccExport3.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;

  {load the Sage Audit Header details first}
  sTemp := SQLCoreSageAuditU;
  sTemp := sTemp + ' ';
  sTemp := sTemp + ' AND Audit_Usage.Date >= ' + sageDate(LastPaymentUpdate);

  with GetSageAuditU do
    begin
      frmWTAccExport3.lblstatus.caption := 'Processing step 2/3 - Sage Audit usage records';
      close;
      sql.text := sTemp;
      open;

      iTotal := recordcount;
      i := 0;
      while eof <> true do
        begin
          inc(i);
          TranType := fieldbyname('TYPE').asstring;
          UsageNumber := fieldbyname('Usage_Number').asinteger;
          SplitNumber := fieldbyname('Split_Number').asinteger;
          SplitXRef := fieldbyname('Split_crossref').asinteger;
          Reference := fieldbyname('REFERENCE').asstring;
          Details := fieldbyname('DETAILS').asstring;
          UserName := fieldbyname('User_Name').asstring;
          DateEntered := fieldbyname('DATE').asdatetime;
          PaidAmount := fieldbyname('AMOUNT').asfloat;
          DeletedFlag := fieldbyname('DELETED_FLAG').asinteger;
          DoOneAuditU;

          frmWTAccExport3.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;

  sTemp := SQLCore;
  sTemp := sTemp + ' ';
  sTemp := sTemp + ' AND Sage_Audit_Header.Date_Entered >= ' + qDate(LastPaymentUpdate);
  sTemp := sTemp + ' ORDER BY Sage_Audit_Header.tran_number, Sage_Audit_Usage.split_number';

  with GetSagePayments do
    begin
      close;
      sql.text := sTemp;
//      parambyname('Date_Entered').asdate := LastPaymentUpdate;
      open;

      iTotal := recordcount;
      i := 0;
      while not eof do
        begin
          inc(i);
          try
            SalesInvoice := fieldbyname('INV_REF').asinteger;
          except
            frmWTAccExport3.Progress.Position := Round( i / itotal * 100);
            Application.ProcessMessages;
            next;
            continue;
          end;
          PaidStatus := fieldbyname('PAID_STATUS').asstring;
          PaidFlag := fieldbyname('PAID_FLAG').asstring;
          PaidAmount := fieldbyname('AMOUNT').asfloat;
          PaidDate := fieldbyname('DATE_ENTERED').asdatetime;
          DoOnePayment;
          frmWTAccExport3.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
  with UpCompanyPayDateSQL do
    begin
      close;
      parambyname('Last_Payment_Update').asdatetime := date;
      execsql;
    end;
end;

procedure TdmAccImport.AddStock(sDataSource: string);
begin
  Sage50Database.ConnectionDefName := sDataSource;
  Sage50Database.Connected := true;

  {As yet no stock linkage exists for Sage}
(*  with GetSageCustomer do
    begin
      close;
      open;

      while not eof do
        begin
          SetProperties(GetSageCustomer);
          DoOneCreditLimit;
          next;
        end;
    end;
*)
end;

procedure TdmAccImport.DoOneCreditLimit;
var
  iCust: integer;
begin
  {Check that Customer exists}
  CustExistSQL.close;
  CustExistSQl.Parambyname('Account_Code').asstring := trim(AccountRef);
  CustExistSQL.open;

  icust := CustExistSQL.fieldbyname('Customer').asinteger;
  with UpCreditLimitSQL do
    begin
      close;
      parambyname('Customer').asinteger := icust;
      parambyname('Credit_Limit').asfloat := CreditLimit;
      parambyname('Available_Credit').asfloat := CreditLimit-Balance;
      execsql;

    end;
  iCreditCount := iCreditcount + 1;
end;

procedure TdmAccImport.DoOnePayment;
begin
  with UpPaymentSQL do
    begin
      close;
      parambyname('Sales_invoice_no').asinteger := SalesInvoice;
      if PaidFlag = 'Y' then
        parambyname('Paid_Status').asstring := 'Y'
      else
        parambyname('Paid_Status').asstring := PaidStatus;

      parambyname('Paid_Amount').asfloat := PaidAmount;
      parambyname('Paid_Date').asdatetime := PaidDate;
      execsql;

    end;
  iCreditCount := iCreditcount + 1;
end;

procedure TdmAccImport.DoOneAuditH;
begin
  try
  with UpAuditHSQL do
    begin
      close;
      parambyname('tran_number').asinteger := TranNumber;
      parambyname('type').asstring := Trantype;
      parambyname('inv_ref').asstring := InvRef;
      parambyname('date_entered').asdatetime := DateEntered;
      parambyname('Paid_flag').asstring := PaidFlag;
      parambyname('Paid_Status').asstring := PaidStatus;
      execsql;

    end;
  except
  end;
end;

procedure TdmAccImport.DoOneAuditU;
begin
  try
  with UpAuditUSQL do
    begin
      close;
      parambyname('type').asstring := Trantype;
      parambyname('usage_number').asinteger := UsageNumber;
      parambyname('split_number').asinteger := SplitNumber;
      parambyname('split_crossref').asinteger := SplitXRef;
      parambyname('reference').asstring := Reference;
      parambyname('details').asstring := details;
      parambyname('user_name').asstring := UserName;
      parambyname('date').asdatetime := DateEntered;
      parambyname('amount').asfloat := PaidAmount;
      parambyname('deleted_flag').asinteger := DeletedFlag;
      execsql;

    end;
  except
  end;
end;

procedure TdmAccImport.SetCompanyImportDir(sTemp: string);
begin
  with UpCompanyImpSQL do
    begin
      close;
      parambyname('Data_Import_Directory').asstring := sTemp;
      execsql;
    end;
end;

procedure TdmAccImport.Sage50DatabaseBeforeConnect(Sender: TObject);
begin
  ConfigureFDConnection(Sage50Database);
end;

procedure TdmAccImport.DatabaseError(ASender, AInitiator: TObject; var AException: Exception);
var
  Exc: EFDDBEngineException;
begin
  if AException is EFDDBEngineException then
  begin
    Exc := (AException as EFDDBEngineException);
    ParseException(Exc);
  end;
end;

procedure TdmAccImport.SetAccountRef(const Value: string);
begin
  FAccountRef := Value;
end;

procedure TdmAccImport.SetAccountStatus(const Value: string);
begin
  FAccountStatus := Value;
end;

procedure TdmAccImport.SetAddress1(const Value: string);
begin
  FAddress1 := Value;
end;

procedure TdmAccImport.SetAddress2(const Value: string);
begin
  FAddress2 := Value;
end;

procedure TdmAccImport.SetAddress3(const Value: string);
begin
  FAddress3 := Value;
end;

procedure TdmAccImport.SetAddress4(const Value: string);
begin
  FAddress4 := Value;
end;

procedure TdmAccImport.SetAddress5(const Value: string);
begin
  FAddress5 := Value;
end;

procedure TdmAccImport.SetBalance(const Value: real);
begin
  FBalance := Value;
end;

procedure TdmAccImport.SetCompanyName(const Value: string);
begin
  FCompanyName := Value;
end;

procedure TdmAccImport.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TdmAccImport.SetCreditLimit(const Value: real);
begin
  FCreditLimit := Value;
end;

procedure TdmAccImport.SetCurrency(const Value: string);
begin
  FCurrency := Value;
end;

procedure TdmAccImport.SetDelAddress1(const Value: string);
begin
  FDelAddress1 := Value;
end;

procedure TdmAccImport.SetDelAddress2(const Value: string);
begin
  FDelAddress2 := Value;
end;

procedure TdmAccImport.SetDelAddress3(const Value: string);
begin
  FDelAddress3 := Value;
end;

procedure TdmAccImport.SetDelAddress4(const Value: string);
begin
  FDelAddress4 := Value;
end;

procedure TdmAccImport.SetDelAddress5(const Value: string);
begin
  FDelAddress5 := Value;
end;

procedure TdmAccImport.SetDelContact(const Value: string);
begin
  FDelContact := Value;
end;

procedure TdmAccImport.SetDelFax(const Value: string);
begin
  FDelFax := Value;
end;

procedure TdmAccImport.SetDelTelephone(const Value: string);
begin
  FDelTelephone := Value;
end;

procedure TdmAccImport.SetFax(const Value: string);
begin
  FFax := Value;
end;

procedure TdmAccImport.SetOnHold(const Value: string);
begin
  FOnHold := Value;
end;

procedure TdmAccImport.SetRep(const Value: string);
begin
  FRep := Value;
end;

procedure TdmAccImport.SetSettlementDays(const Value: integer);
begin
  FSettlementDays := Value;
end;

procedure TdmAccImport.SetSettlementRate(const Value: real);
begin
  FSettlementRate := Value;
end;

procedure TdmAccImport.SetTelephone(const Value: string);
begin
  FTelephone := Value;
end;

procedure TdmAccImport.SetVAtNumber(const Value: string);
begin
  FVAtNumber := Value;
end;

procedure TdmAccImport.SetWebAddress(const Value: string);
begin
  FWebAddress := Value;
end;

procedure TdmAccImport.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TdmAccImport.SetPaidAmount(const Value: real);
begin
  FPaidAmount := Value;
end;

procedure TdmAccImport.SetPaidDate(const Value: TDateTime);
begin
  FPaidDate := Value;
end;

procedure TdmAccImport.SetPaidStatus(const Value: string);
begin
  FPaidStatus := Value;
end;

procedure TdmAccImport.SetSalesInvoice(const Value: integer);
begin
  FSalesInvoice := Value;
end;

procedure TdmAccImport.SetPaidFlag(const Value: string);
begin
  FPaidFlag := Value;
end;

procedure TdmAccImport.SetDateEntered(const Value: TDateTime);
begin
  FDateEntered := Value;
end;

procedure TdmAccImport.SetInvRef(const Value: string);
begin
  FInvRef := Value;
end;

procedure TdmAccImport.SetTranNumber(const Value: integer);
begin
  FTranNumber := Value;
end;

procedure TdmAccImport.SetTranType(const Value: string);
begin
  FTranType := Value;
end;

procedure TdmAccImport.SetDeletedFlag(const Value: integer);
begin
  FDeletedFlag := Value;
end;

procedure TdmAccImport.SetDetails(const Value: string);
begin
  FDetails := Value;
end;

procedure TdmAccImport.SetReference(const Value: string);
begin
  FReference := Value;
end;

procedure TdmAccImport.SetSplitNumber(const Value: integer);
begin
  FSplitNumber := Value;
end;

procedure TdmAccImport.SetSplitXref(const Value: integer);
begin
  FSplitXref := Value;
end;

procedure TdmAccImport.SetUsageNumber(const Value: integer);
begin
  FUsageNumber := Value;
end;

procedure TdmAccImport.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure TdmAccImport.AddMaximiserContacts(sDataSource: string);
begin
  MaximiserDB.ConnectionDefName := sDataSource;
  MaximiserDB.Connected := true;
  with GetMaxContacts do
    begin
      close;
      open;

      iTotal := recordcount;
      i := 0;
      while not eof do
        begin
          inc(i);
          SetMaximiserProperties(GetMaxContacts);
          DoOneMaximiserContact;
          frmWTAccExport3.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TdmAccImport.AddQuickbooksCustomers(sDataSource: string);
begin
  QuickbooksDB.ConnectionDefName := sDataSource;
  QuickbooksDB.Connected := true;
  with GetMaxContacts do
    begin
      close;
      open;

      iTotal := recordcount;
      i := 0;
      while not eof do
        begin
          inc(i);
          SetMaximiserProperties(GetMaxContacts);
          DoOneMaximiserContact;
          frmWTAccExport3.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TdmAccImport.SetContactNo(const Value: integer);
begin
  FContactNo := Value;
end;

procedure TdmAccImport.SetSalutation(const Value: string);
begin
  FSalutation := Value;
end;

procedure TdmAccImport.SetRecordType(const Value: integer);
begin
  FRecordType := Value;
end;

procedure TdmAccImport.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

procedure TdmAccImport.SetRepCode(const Value: integer);
begin
  FRepCode := Value;
end;

procedure TdmAccImport.SetDelCode(const Value: string);
begin
  FDelCode := Value;
end;

procedure TdmAccImport.SetDelName(const Value: string);
begin
  FDelName := Value;
end;

procedure TdmAccImport.SetMobile(const Value: string);
begin
  FMobile := Value;
end;

procedure TdmAccImport.SetCounty(const Value: string);
begin
  FCounty := Value;
end;

procedure TdmAccImport.SetNoEmployees(const Value: integer);
begin
  FNoEmployees := Value;
end;

procedure TdmAccImport.SetCustDataSource(const Value: integer);
begin
  FCustDataSource := Value;
end;

procedure TdmAccImport.SetForename(const Value: string);
begin
  FForename := Value;
end;

procedure TdmAccImport.SetCustomerType(const Value: string);
begin
  FCustomerType := Value;
end;

procedure TdmAccImport.SetContactType(const Value: string);
begin
  FContactType := Value;
end;

procedure TdmAccImport.SetWorktop(const Value: string);
begin
  FWorktop := Value;
end;

procedure TdmAccImport.SetGroup(const Value: string);
begin
  FGroup := Value;
end;

procedure TdmAccImport.SetMaterial(const Value: string);
begin
  FMaterial := Value;
end;

procedure TdmAccImport.SetPrice(const Value: double);
begin
  FPrice := Value;
end;

procedure TdmAccImport.SetThickness(const Value: string);
begin
  FThickness := Value;
end;

end.
