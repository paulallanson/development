unit PBAccImportDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, PBPOObjects;

type
  TdmAccImport = class(TDataModule)
    AddBranchSQL: TQuery;
    AddCustSQL: TQuery;
    GetBranchSQL: TQuery;
    UpCustSQL: TQuery;
    UpBranchSQL: TQuery;
    GetNextBranchSQL: TQuery;
    GetNextCustSQL: TQuery;
    GetNextContactSQL: TQuery;
    AddRepSQL: TQuery;
    AddContactSQL: TQuery;
    AddSuppSQL: TQuery;
    GetNextSuppSQL: TQuery;
    AddSuppBranchSQL: TQuery;
    UpSuppSQL: TQuery;
    UpSuppBranchSQL: TQuery;
    GetLastNarrSQL: TQuery;
    GetCustBranchSQL: TQuery;
    AddSuppContSQL: TQuery;
    GetNextSuppContactSQL: TQuery;
    GetSuppBranchSQL: TQuery;
    AddNarrSQL: TQuery;
    UpBranchNarrSQL: TQuery;
    GetSageCustomer: TQuery;
    Sage50Database: TDatabase;
    CustExistSQL: TQuery;
    GetNextRepSQL: TQuery;
    AddNewRepSQL: TQuery;
    CheckRepSQL: TQuery;
    AddCurrencySQL: TQuery;
    GetSageSupplier: TQuery;
    SuppExistSQL: TQuery;
    UpCreditLimitSQL: TQuery;
    UpCompanyImpSQL: TQuery;
    GetSagePayments: TQuery;
    UpPaymentSQL: TQuery;
    GetCompanySQL: TQuery;
    UpCompanyPayDateSQL: TQuery;
    UpAuditHSQL: TQuery;
    GetSageAuditH: TQuery;
    GetSageAuditU: TQuery;
    UPAuditUSQL: TQuery;
    DelSageAuditH: TQuery;
    MaximiserDB: TDatabase;
    GetMaxContacts: TQuery;
    GetMaxEmail: TQuery;
    GetMaxWebsite: TQuery;
    CustNameExistSQL: TQuery;
    CheckContactSQL: TQuery;
    qryGetCType: TQuery;
    qryNextCType: TQuery;
    qryAddCType: TQuery;
    QuickbooksDB: TDatabase;
    DelRepSQL: TQuery;
    GetRepSQL: TQuery;
    GetCustBrSQL: TQuery;
    AddContactinfoSQL: TQuery;
    CheckBranchSQL: TQuery;
    UpdBranchSQL: TQuery;
    UpdContactSQL: TQuery;
    UpdContactInfoSQL: TQuery;
    qryGetCustomerContact: TQuery;
    qryGetSupplierContact: TQuery;
    qryGetProductTYpe: TQuery;
    qryAddPO: TQuery;
    qryAddPOLine: TQuery;
    qryGetPriceUnit: TQuery;
    qryGetRep: TQuery;
    qryAddDelivLine: TQuery;
    qryAddSI: TQuery;
    qryAddSILine: TQuery;
    qryGetNextSI: TQuery;
    qryGetNextPI: TQuery;
    qryAddPI: TQuery;
    qryAddPILine: TQuery;
    qryGetTopRep: TQuery;
    qryCheckSINumber: TQuery;
    qryUpdSI: TQuery;
    qryGetNextSILine: TQuery;
    UpCreditNoteSQL: TQuery;
    UpdCustSQL: TQuery;
    CheckSuppContactSQL: TQuery;
    UpdSuppContactSQL: TQuery;
    DelSageAuditU: TQuery;
    qryAddCustomerType: TQuery;
    qryGetCustomerType: TQuery;
    qryAddCountry: TQuery;
    qryGetCountry: TQuery;
    qryGetVatCode: TQuery;
    qryGetPaymentTerms: TQuery;
    qryGetOperator: TQuery;
    qryGetPriceUnitByDesc: TQuery;
    qryGetNextJobBag: TQuery;
    qryUpCompany: TQuery;
    qryAddJobBag: TQuery;
    qryAddJobBagLine: TQuery;
    qryGetPriceUnitFactor: TQuery;
    qryGetPOImport: TQuery;
    qryGetSupplierByAccount: TQuery;
    qryGetPurchaseOrder: TQuery;
    qryUpdPOLine: TQuery;
    qryUpdDeliveryDetail: TQuery;
    qryUpdJBLine: TQuery;
    qryGetJobBagRef: TQuery;
    qryGetJBLine: TQuery;
    qryGetNextSICharge: TQuery;
    qryAddSICharge: TQuery;
    qryGetVat: TQuery;
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
    FCostPrice: double;
    FSellPrice: double;
    FPONumber: real;
    FQuantity: integer;
    FProductType: string;
    FCustomerOrderRef: string;
    FCustomerAccount: string;
    FDescription: string;
    FSalesInvoiceNo: string;
    FSupplierOrderRef: string;
    FSupplierAccount: string;
    FVatable: string;
    FSupplierInvoiceNo: string;
    FRequiredDate: TdateTime;
    FOrderDate: Tdatetime;
    FSupplierInvoiceDate: TDateTime;
    FSalesInvoiceDate: TDateTime;
    FInvoiceDate: TDateTime;
    FCustomerStatus: string;
    FContactMobile: string;
    FAnalysis2: string;
    FAnalysis3: string;
    FAnalysis1: string;
    FSubRep: string;
    FAnalysis4: string;
    FCoRegNumber: string;
    FCustomerType: string;
    FCountry: string;
    FDateCreated: TDateTime;
    FFirstName: string;
    FContactType: string;
    FLastName: string;
    FVATCode: string;
    FSICCode: string;
    FContactTitle: string;
    FCreditTerms: integer;
    FContactEmail: string;
    FOfficeContact: integer;
    FOperator: integer;
    FCustomerContactName: string;
    FPriceUnit: integer;
    FLineNumber: integer;
    FDescriptiveReference: string;
    FOrderStatus: integer;
    FInvoiceOrCredit: string;
    FNominalCode: string;
    FJBNumber: integer;
    { Private declarations }
    function GetContactType(tempValue: string):integer;
    procedure DoOneMaximiserContact;
    procedure DoOneCreditLimit;
    procedure DoOnePayment;
    procedure DoOneAuditH;
    procedure DoOneAuditU;
    procedure SetProperties(QuerySQL: TQuery);
    procedure SetMaximiserProperties(QuerySQL: TQuery);
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
    procedure SetCostPrice(const Value: double);
    procedure SetCustomerAccount(const Value: string);
    procedure SetCustomerOrderRef(const Value: string);
    procedure SetDescription(const Value: string);
    procedure SetOrderDate(const Value: Tdatetime);
    procedure SetPONumber(const Value: real);
    procedure SetProductType(const Value: string);
    procedure SetQuantity(const Value: integer);
    procedure SetRequiredDate(const Value: TdateTime);
    procedure SetSalesInvoiceDate(const Value: TDateTime);
    procedure SetSalesInvoiceNo(const Value: string);
    procedure SetSellPrice(const Value: double);
    procedure SetSupplierInvoiceNo(const Value: string);
    procedure SetSupplierAccount(const Value: string);
    procedure SetSupplierInvoiceDate(const Value: TDateTime);
    procedure SetSupplierOrderRef(const Value: string);
    procedure SetVatable(const Value: string);
    procedure SetInvoiceDate(const Value: TDateTime);
    procedure SetCustomerStatus(const Value: string);
    procedure SetContactMobile(const Value: string);
    procedure SetAnalysis1(const Value: string);
    procedure SetAnalysis2(const Value: string);
    procedure SetAnalysis3(const Value: string);
    procedure SetAnalysis4(const Value: string);
    procedure SetCoRegNumber(const Value: string);
    procedure SetSubRep(const Value: string);
    procedure SetCustomerType(const Value: string);
    procedure SetCountry(const Value: string);
    procedure SetDateCreated(const Value: TDateTime);
    procedure SetContactType(const Value: string);
    procedure SetFirstName(const Value: string);
    procedure SetLastName(const Value: string);
    procedure SetVATCode(const Value: string);
    procedure SetSICCode(const Value: string);
    procedure SetContactTitle(const Value: string);
    procedure SetCreditTerms(const Value: integer);
    procedure SetContactEmail(const Value: string);
    procedure SetOfficeContact(const Value: integer);
    procedure SetOperator(const Value: integer);
    procedure SetCustomerContactName(const Value: string);
    procedure SetPriceUnit(const Value: integer);
    function GetNextJobBagNumber: integer;
    procedure SetDescriptiveReference(const Value: string);
    procedure SetLineNumber(const Value: integer);
    procedure SetOrderStatus(const Value: integer);
    procedure SetInvoiceOrCredit(const Value: string);
    procedure SetNominalCode(const Value: string);
    procedure SetJBNumber(const Value: integer);
  public
    { Public declarations }
    iCustomercount, iSupplierCount, iCurrencycount, iCreditCount, iStockcount: integer;
    function OrderExists(tmpOrder: real): boolean;
    function JBLineExists(tmpJB, tmpLine: integer): boolean;
    function DoOneCustomerRep: boolean;
    function GetCustomerType(tempDescription: string): integer;
    function GetCountry(tempDescription: string): integer;
    function GetJobBagByReference(tempCode: string): integer;
    function GetJobBagDescription(tempCode: string): string;
    function GetOperatorByInitials(tempName: string): integer;
    function GetPaymentTerms(tempValue: integer): integer;
    function GetPriceUnitFactor(tempPriceUnit: integer): integer;
    function GetPriceUnitByDescription(tempDescription: string): integer;
    function GetPurchaseOrderSupplier(tmpPO: real): integer;
    function GetPurchaseOrderSupplierBranch(tmpPO: real): integer;
    function GetSupplierByAccountCode(tempCode: string): integer;
    function GetSupplierAccountCode(tempPO: string): string;
    function GetVatCode(tempDescription: string): integer;
    function GetVatRate(tempCode: integer): real;
    procedure DoOneCustomer;
    function DoOneJobBag: integer;
    procedure DoOneJobBagLine(tmpJobBag: integer);
    function DoOneOrder: boolean;
    function DoOneSalesInvoice: integer;
    procedure UpdateSalesInvoice(Invoice: integer);
    procedure DoOneSalesInvoiceCharge(tmpInvoice: integer);
    procedure DoOneSalesInvoiceLine(tmpInvoice: integer);
    procedure DoOneSupplier;
    procedure DoOneSupplierInvoice;
    function UpdateOrder: boolean;
    procedure AddMaximiserContacts(sDataSource: string);
    procedure AddQuickbooksCustomers(sDataSource: string);
    procedure AddCustomers(sDataSource: string);
    procedure AddSuppliers(sDataSource: string);
    procedure AddCreditLimits(sDataSource: string);
    procedure AddPayments(sDataSource: string);
    procedure AddStock(sDataSource: string);
    procedure AddCurrency;
    procedure SetCompanyImportDir(sTemp: string);
    property AccountRef: string read FAccountRef write SetAccountRef;
    property AccountStatus: string read FAccountStatus write SetAccountStatus;
    property Address1: string read FAddress1 write SetAddress1;
    property Address2: string read FAddress2 write SetAddress2;
    property Address3: string read FAddress3 write SetAddress3;
    property Address4: string read FAddress4 write SetAddress4;
    property Address5: string read FAddress5 write SetAddress5;
    property Analysis1: string read FAnalysis1 write SetAnalysis1;
    property Analysis2: string read FAnalysis2 write SetAnalysis2;
    property Analysis3: string read FAnalysis3 write SetAnalysis3;
    property Analysis4: string read FAnalysis4 write SetAnalysis4;
    property Balance: real read FBalance write SetBalance;
    property CompanyName: string read FCompanyName write SetCompanyName;
    property ContactEmail: string read FContactEmail write SetContactEmail;
    property ContactName: string read FContactName write SetContactName;
    property ContactMobile: string read FContactMobile write SetContactMobile;
    property ContactNo: integer read FContactNo write SetContactNo;
    property ContactTitle: string read FContactTitle write SetContactTitle;
    property ContactType: string read FContactType write SetContactType;
    property CoRegNumber: string read FCoRegNumber write SetCoRegNumber;
    property CostPrice: double read FCostPrice write SetCostPrice;
    property Country: string read FCountry write SetCountry;
    property CreditLimit: real read FCreditLimit write SetCreditLimit;
    property CreditTerms: integer read FCreditTerms write SetCreditTerms;
    property Currency: string read FCurrency write SetCurrency;
    property CustomerAccount: string read FCustomerAccount write SetCustomerAccount;
    property CustomerContactName: string read FCustomerContactName write SetCustomerContactName;
    property CustomerOrderRef: string read FCustomerOrderRef write SetCustomerOrderRef;
    property CustomerStatus: string read FCustomerStatus write SetCustomerStatus;
    property CustomerType: string read FCustomerType write SetCustomerType;
    property DateEntered: TDateTime read FDateEntered write SetDateEntered;
    property DateCreated: TDateTime read FDateCreated write SetDateCreated;
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
    property DeletedFlag: integer read FDeletedFlag write SetDeletedFlag;
    property Description: string read FDescription write SetDescription;
    property DescriptiveReference: string read FDescriptiveReference write SetDescriptiveReference;
    property Details: string read FDetails write SetDetails;
    property Email: string read FEmail write SetEmail;
    property Fax: string read FFax write SetFax;
    property FirstName: string read FFirstName write SetFirstName;
    property InvRef: string read FInvRef write SetInvRef;
    property InvoiceDate: TDateTime read FInvoiceDate write SetInvoiceDate;
    property InvoiceOrCredit: string read FInvoiceOrCredit write SetInvoiceOrCredit;
    property JBNumber: integer read FJBNumber write SetJBNumber;
    property LastName: string read FLastName write SetLastName;
    property LineNumber: integer read FLineNumber write SetLineNumber;
    property NominalCode: string read FNominalCode write SetNominalCode;
    property OfficeContact: integer read FOfficeContact write SetOfficeContact;
    property OnHold: string read FOnHold write SetOnHold;
    property Operator: integer read FOperator write SetOperator;
    property OrderDate: Tdatetime read FOrderDate write SetOrderDate;
    property OrderStatus: integer read FOrderStatus write SetOrderStatus;
    property PaidStatus: string read FPaidStatus write SetPaidStatus;
    property PaidAmount: real read FPaidAmount write SetPaidAmount;
    property PaidDate: TDateTime read FPaidDate write SetPaidDate;
    property PaidFlag: string read FPaidFlag write SetPaidFlag;
    property PONumber: real read FPONumber write SetPONumber;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property ProductType: string read FProductType write SetProductType;
    property Quantity: integer read FQuantity write SetQuantity;
    property Reference: string read FReference write SetReference;
    property RecordType: integer read FRecordType write SetRecordType;
    property Rep: string read FRep write SetRep;
    property RepCode: integer read FRepCode write SetRepCode;
    property RequiredDate: TdateTime read FRequiredDate write SetRequiredDate;
    property SalesInvoice: integer read FSalesInvoice write SetSalesInvoice;
    property SalesInvoiceDate: TDateTime read FSalesInvoiceDate write SetSalesInvoiceDate;
    property SalesInvoiceNo: string read FSalesInvoiceNo write SetSalesInvoiceNo;
    property Salutation: string read FSalutation write SetSalutation;
    property SellPrice: double read FSellPrice write SetSellPrice;
    property SettlementRate: real read FSettlementRate write SetSettlementRate;
    property SettlementDays: integer read FSettlementDays write SetSettlementDays;
    property SICCode: string read FSICCode write SetSICCode;
    property SplitNumber: integer read FSplitNumber write SetSplitNumber;
    property SplitXref: integer read FSplitXref write SetSplitXref;
    property SubRep: string read FSubRep write SetSubRep;
    property SupplierAccount: string read FSupplierAccount write SetSupplierAccount;
    property SupplierInvoiceDate: TDateTime read FSupplierInvoiceDate write SetSupplierInvoiceDate;
    property SupplierInvoiceNo: string read FSupplierInvoiceNo write SetSupplierInvoiceNo;
    property SupplierOrderRef: string read FSupplierOrderRef write SetSupplierOrderRef;
    property Telephone: string read FTelephone write SetTelephone;
    property Title: string read FTitle write SetTitle;
    property TranNumber: integer read FTranNumber write SetTranNumber;
    property TranType: string read FTranType write SetTranType;
    property UsageNumber: integer read FUsageNumber write SetUsageNumber;
    property UserName: string read FUserName write SetUserName;
    property VATCode: string read FVATCode write SetVATCode;
    property VAtNumber: string read FVAtNumber write SetVAtNumber;
    property Vatable: string read FVatable write SetVatable;
    property WebAddress: string read FWebAddress write SetWebAddress;
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

uses PBAccExport3, PBDatabase, pbMainMenu;

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
  ' AuditH.Paid_Status,  '+
  ' Sage_Audit_usage.Date  '+
  'from Sage_Audit_header, Sage_Audit_usage, Sage_Audit_header AuditH '+
  'where ((Sage_Audit_header.type = ''SR'') OR '+
  '(Sage_Audit_header.type = ''SA'')) AND '+
  ' (Sage_Audit_header.tran_number = Sage_Audit_usage.split_crossref) and '+
  ' (Sage_Audit_usage.split_number = AuditH.tran_number) ';


procedure TdmAccImport.AddCustomers(sDataSource: string);
begin
  Sage50Database.AliasName := sDataSource;
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
          PBAccExport3frm.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TdmAccImport.AddSuppliers(sDataSource: string);
begin
  Sage50Database.AliasName := sDataSource;
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
          PBAccExport3frm.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TdmAccImport.SetProperties(QuerySQL: TQuery);
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

procedure TdmAccImport.SetMaximiserProperties(QuerySQL: TQuery);
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
  iCust, iBranch, iRep: integer;
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
  iCust, iBranch, icontact, iRep, iCountry, iVatID, iContactType, iPaymentTerms: integer;
begin
  {Check that Customer exists}
  CustExistSQL.close;
  CustExistSQl.Parambyname('Account_Code').asstring := trim(copy(AccountRef,1,8));
  CustExistSQl.Parambyname('Customer_Name').asstring := trim(CompanyName);
  CustExistSQL.open;

  iBranch := 0;

  {Don't add if already exists}
  if CustExistSQL.recordcount > 0 then
    begin
      iCust := CustExistSQL.fieldbyname('Customer').asinteger;

      {Update Customer}
      with UpdCustSQL do
        begin
          close;
          parambyname('Customer').asinteger := iCust;
          parambyname('Name').asstring := CompanyName;

          if CustomerStatus = 'Prospect' then
            parambyname('Customer_Status').asinteger := 80
          else
          if CustomerStatus = 'Lapsed' then
            parambyname('Customer_Status').asinteger := 90
          else
            parambyname('Customer_Status').asinteger := 100;
          execsql;
        end;

      {Update Branch}
      with UpdBranchSQL do
        begin
          Close ;
      	  ParamByName('Customer').AsInteger := iCust ;
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

          if trim(AccountRef) <> '' then
            ParamByName('Account_Code').AsString := trim(AccountRef)
          else
            ParamByName('Account_Code').AsString := '';

          ParamByName('Short_Code').AsString := DelCode;
          ExecSQL ;
        end;
    end
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
        parambyname('Name').asstring := CompanyName;
        parambyname('Settlement_Discount').asfloat := SettlementRate;
        parambyname('Settlement_Days').asinteger := SettlementDays;
        parambyname('Credit_limit').asfloat := CreditLimit;
        parambyname('Acc_Active').asstring := 'Y';
        if OnHold = 'Y' then
          parambyname('Credit_Status').asstring := 'S'
        else;
          parambyname('Credit_Status').asstring := 'U';

        parambyname('Customer_Type').asinteger := GetCustomerType(CustomerType);
        parambyname('Intrastat_id').asinteger := 1;

        iCountry := GetCountry(Country);
        if iCountry = 0 then
          parambyname('Country_id').clear
        else
          parambyname('Country_id').asinteger := iCountry;

        parambyname('VAT_Reference').asstring := VATNumber;
        parambyname('Company_Reg_Number').asstring := CoRegNumber;

        parambyname('Analysis_Code_1').asstring := Analysis1;
        parambyname('Analysis_Code_2').asstring := Analysis2;
        parambyname('Analysis_Code_3').asstring := Analysis3;
        parambyname('Analysis_Code_4').asstring := Analysis4;

        parambyname('GDPR_Letter_Sent').asstring := 'N';
        parambyname('GDPR_Letter_Signed').asstring := 'N';

        if CustomerStatus = 'Prospect' then
          parambyname('Customer_Status').asinteger := 80
        else
        if CustomerStatus = 'Lapsed' then
          parambyname('Customer_Status').asinteger := 90
        else
          parambyname('Customer_Status').asinteger := 100;

        parambyname('Available_Credit').asfloat := CreditLimit-Balance;
        parambyname('Currency_Code_Def').asinteger := strtoint(Currency);

        if VatCode <> '' then
          iVatID := GetVATCode(VatCode)
        else
          iVatID := dmBroker.GetCompanyVatCode;
          
        if iVatID = -1 then
          iVatID := dmBroker.GetCompanyVatCode;
        parambyname('VAT_Code_Def').asinteger := iVatID;

        if DateCreated = 0 then
          DateCreated := date;
        parambyname('Date_Created').asdatetime := DateCreated;
        parambyname('Created_by').asinteger := frmPBMainMenu.iOperator;

        iPaymentTerms := GetPaymentTerms(CreditTerms);
        if iPaymentTerms = 0 then
          parambyname('Payment_Terms').clear
        else
          parambyname('Payment_Terms').asinteger := iPaymentTerms;
        execsql;
      end;

    {Add Branch}
    with AddBranchSQL do
      begin
        Close ;
        ParamByName('Customer').AsInteger := iCust;
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

        if CustomerStatus = 'Prospect' then
          ParamByName('Account_Code').AsString := ''
        else
        if CustomerStatus = 'Lapsed' then
          ParamByName('Account_Code').AsString := AccountRef
        else
          ParamByName('Account_Code').AsString := AccountRef;

        ParamByName('Inv_To_Customer').asinteger := iCust;
        ParamByName('Inv_To_Branch').AsInteger := 0;
        ParamByName('Short_Code').AsString := DelCode;
        ExecSQL ;
      end;
  end;

  {If not a branch then Add Contact if there is one}
  if (DelName <> '') then
    begin
      {Check to see if branch already exists}
      with CheckBranchSQL do
        begin
          close;
          parambyname('Customer').asinteger := iCust;
          parambyname('Short_Code').asstring := DelCode;
          open;
        end;

      if CheckBranchSQL.recordcount > 0 then
        begin
          iBranch := CheckBranchSQL.fieldbyname('Branch_no').asinteger;

          with UpdBranchSQL do
            begin
              Close ;
        	    ParamByName('Customer').AsInteger := iCust ;
        	    ParamByName('Branch_no').AsInteger := iBranch ;
        	    ParamByName('Name').AsString := DelName;
        	    ParamByName('Building_No_Name').AsString := DelAddress1;
        	    ParamByName('Street').AsString := DelAddress2;
        	    ParamByName('Locale').AsString := DelAddress3;
        	    ParamByName('Town').AsString := DelAddress4;
        	    ParamByName('PostCode').AsString := DelAddress5;
        	    ParamByName('Phone').AsString := DelTelephone;
        	    ParamByName('Fax_Number').AsString := DelFax;
        	    ParamByName('EMail').AsString := '';
        	    ParamByName('Account_Code').AsString := '';
        	    ParamByName('Short_Code').AsString := DelCode;
        	    ExecSQL ;
            end;
        end
      else
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
        	    ParamByName('Name').AsString := DelName;
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
        	    ParamByName('Short_Code').AsString := DelCode;
        	    ExecSQL ;
            end;
        end;
    end;

  if ContactName <> '' then
    begin
      {So if Contact exists}
      CheckContactSQL.close;
      CheckContactSQL.parambyname('Customer').asinteger := iCust;
      CheckContactSQL.parambyname('Branch_no').asinteger := iBranch;
      CheckContactSQL.parambyname('Name').asstring := ContactName;
      CheckContactSQL.ParamByName('EMail').AsString := Email;
      CheckContactSQL.open;

      if CheckContactSQL.RecordCount > 0 then
        begin
          iContact := CheckContactSQL.fieldbyname('Contact_no').asinteger;

          With UpdContactSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icust;
            ParamByName('Branch_No').AsInteger := iBranch;
            ParamByName('Contact_No').AsInteger := icontact;
            ParamByName('Name').AsString := ContactName;
            ParamByName('Phone').AsString := Telephone;
            ParamByName('Mobile_no').AsString := ContactMobile;
            ParamByName('EMail').AsString := ContactEmail;
            ParamByName('Salutation').AsString := Salutation;
            ExecSQL ;
          end;
        end
      else
        begin
          with GetNextContactSQL do
          begin
            close;
            parambyname('Customer').asinteger := iCust;
            parambyname('Branch_no').asinteger := iBranch;
            open;

            iContact := fieldbyname('Last_Contact').asinteger+1;
          end;

          With AddContactSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icust;
            ParamByName('Branch_No').AsInteger := iBranch;
            ParamByName('Contact_No').AsInteger := icontact;
            ParamByName('Name').AsString := ContactName;
            ParamByName('Phone').AsString := Telephone;
            ParamByName('Mobile_no').AsString := ContactMobile;
            ParamByName('EMail').AsString := ContactEmail;
            ParamByName('ExportFilter').AsString := 'PDF';
            ParamByName('Salutation').AsString := Salutation;

            iContactType := GetContactType(ContactType);
            ParamByName('Contact_Type').AsInteger := iContactType;
            ExecSQL ;
          end;

(*          With AddContactinfoSQL do
          begin
            Close ;
            ParamByName('Contact_Name').AsString := ContactName;
            ParamByName('Account_Number').Asstring := DelCode;
            ParamByName('Pays_Online').AsString := 'Y';
            ParamByName('Account_Month').AsString := '12';
            ParamByName('Account_Year').AsString := '2011';
            ParamByName('Pays_Online').AsString := 'Y';
            ExecSQL ;
          end;

          With UpdContactInfoSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icust;
            ParamByName('Branch_No').AsInteger := iBranch;
            ParamByName('Contact_No').AsInteger := icontact;
            execsql;
          end;
*)
        end;
    end;

  {Add Rep if there is one}
  if Rep <> '' then
    begin
      {Check to see if the rep exists}
      with CheckRepSQL do
        begin
          close;
          parambyname('Name').asstring := copy(Rep,1,40);
          open;

          if recordcount = 0 then
            begin
              GetNextRepSQL.close;
              GetNextRepSQL.open;
              iRep := GetNextRepSQL.fieldbyname('Last_Record').asinteger + 1;

              AddNewRepSQL.close;
              AddNewRepSQL.parambyname('Rep').asinteger := iRep;
              AddNewRepSQL.parambyname('Name').asstring := Rep;
              AddNewRepSQL.parambyname('Rep_Is_Sub_Rep').asstring := 'N';
              AddNewRepSQl.execSQl;
            end
          else
            iRep := CheckRepSQL.fieldbyname('Rep').asinteger;
        end;

      try
        With AddRepSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icust ;
            ParamByName('Branch_No').AsInteger := iBranch;
            ParamByName('Rep').AsInteger := iRep;
            ParamByName('Percentage').AsFloat := 100;
            ParamByName('Is_Main_Rep').AsString := 'Y';
            ExecSQL ;
          end;
      except
      end;
    end;

  {Add Sub Rep if there is one}
  if SubRep <> '' then
    begin
      {Check to see if the rep exists}
      with CheckRepSQL do
        begin
          close;
          parambyname('Name').asstring := copy(SubRep,1,40);
          open;

          if recordcount = 0 then
            begin
              GetNextRepSQL.close;
              GetNextRepSQL.open;
              iRep := GetNextRepSQL.fieldbyname('Last_Record').asinteger + 1;

              AddNewRepSQL.close;
              AddNewRepSQL.parambyname('Rep').asinteger := iRep;
              AddNewRepSQL.parambyname('Name').asstring := SubRep;
              AddNewRepSQL.parambyname('Rep_Is_Sub_Rep').asstring := 'Y';
              AddNewRepSQl.execSQl;
            end
          else
            iRep := CheckRepSQL.fieldbyname('Rep').asinteger;
        end;

      try
        With AddRepSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icust ;
            ParamByName('Branch_No').AsInteger := iBranch;
            ParamByName('Rep').AsInteger := iRep;
            ParamByName('Percentage').AsFloat := 0;
            ParamByName('Is_Main_Rep').AsString := 'N';
            ExecSQL ;
          end;
      except
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
  iSupp, ibranch, icontact, iVatID, iCountry: integer;
begin
  {Check that Customer exists}
  SuppExistSQL.close;
  SuppExistSQl.Parambyname('Account_Code').asstring := trim(copy(AccountRef,1,8));
  SuppExistSQl.Parambyname('Supplier_Name').asstring := trim(CompanyName);
  SuppExistSQL.open;

  {Check that Customer exists}
  iBranch := 0;

  {Don't add if already exists}
  if SuppExistSQL.recordcount > 0 then
    begin
      iSupp := SuppExistSQL.fieldbyname('Supplier').asinteger;
    end
  else
  begin
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

        iCountry := GetCountry(Country);
        if iCountry = 0 then
          parambyname('Country_id').clear
        else
          parambyname('Country_id').asinteger := iCountry;

        ParamByName('Currency_Code').asinteger := strtoint(Currency);
        ParamByName('VAT_Reference').AsString := VATNumber;

        if VatCode <> '' then
          iVatID := GetVATCode(VatCode)
        else
          iVatID := dmBroker.GetCompanyVatCode;
          
        if iVatID = -1 then
          iVatID := dmBroker.GetCompanyVatCode;
        parambyname('VAT_Code_Def').asinteger := iVatID;
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
  end;

  {Add Contact if there is one}
  if ContactName <> '' then
    begin
      {So if Contact exists}
      CheckSuppContactSQL.close;
      CheckSuppContactSQL.parambyname('Supplier').asinteger := iSupp;
      CheckSuppContactSQL.parambyname('Branch_no').asinteger := iBranch;
      CheckSuppContactSQL.parambyname('Name').asstring := ContactName;
      CheckSuppContactSQL.ParamByName('EMail').AsString := Email;
      CheckSuppContactSQL.open;

      if CheckSuppContactSQL.RecordCount > 0 then
        begin
          iContact := CheckSuppContactSQL.fieldbyname('Contact_no').asinteger;

          With UpdSuppContactSQL do
          begin
            Close ;
            ParamByName('Supplier').AsInteger := iSupp;
            ParamByName('Branch_No').AsInteger := iBranch;
            ParamByName('Contact_No').AsInteger := icontact;
            ParamByName('Name').AsString := ContactName;
            ParamByName('Phone').AsString := Telephone;
            ParamByName('Mobile_no').AsString := ContactMobile;
            ParamByName('EMail').AsString := Email;
            ParamByName('Salutation').AsString := Salutation;
            ExecSQL ;
          end;
        end
      else
        begin
          with GetNextSuppContactSQL do
          begin
            close;
            parambyname('Supplier').asinteger := iSupp;
            parambyname('Branch_no').asinteger := iBranch;
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
            ParamByName('Mobile_no').AsString := ContactMobile;
            ParamByName('EMail').AsString := Email;
            ParamByName('ExportFilter').AsString := 'PDF';
            ParamByName('Salutation').AsString := '';
            ParamByName('Contact_Type').AsInteger := 1;
            ExecSQL ;
          end;
        end;
    end;
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
  Sage50Database.AliasName := sDataSource;
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
          PBAccExport3frm.Progress.Position := Round( i / itotal * 100);
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
    if dmBroker.IsSQL then
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
        LastPaymentUpdate := PBDateStr('31/12/1999')
      else
        LastPaymentUpdate := fieldbyname('Last_Payment_Update').asdatetime;
    end;

  Sage50Database.AliasName := sDataSource;
  Sage50Database.Connected := true;

  {Clear the Sage Audit Header File}
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
      PBAccExport3frm.lblstatus.caption := 'Processing step 1/3 - Sage Audit Header records';
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

          PBAccExport3frm.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;

  {Clear the Sage Audit Usage File - Added this for debugging - 30/7/2018}
  with DelSageAuditU do
    begin
      close;
      execsql;
    end;

  {load the Sage Audit Header details first}
  sTemp := SQLCoreSageAuditU;
//  sTemp := sTemp + ' ';
//  sTemp := sTemp + ' AND Audit_Usage.Date >= ' + sageDate(LastPaymentUpdate);

  with GetSageAuditU do
    begin
      PBAccExport3frm.lblstatus.caption := 'Processing step 2/3 - Sage Audit usage records';
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

          PBAccExport3frm.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;


  PBAccExport3frm.lblstatus.caption := 'Processing step 3/3 - Processing payments';

  sTemp := SQLCore;
  sTemp := sTemp + ' ';
  sTemp := sTemp + ' AND Sage_Audit_Header.Date_Entered >= ' + qDate(LastPaymentUpdate);
  sTemp := sTemp + ' ORDER BY Sage_Audit_Header.tran_number, Sage_Audit_Usage.split_number';

  with GetSagePayments do
    begin
      close;
      sql.text := sTemp;
      open;

      iTotal := recordcount;
      i := 0;
      while not eof do
        begin
          inc(i);
          try
            SalesInvoice := fieldbyname('INV_REF').asinteger;
          except
            PBAccExport3frm.Progress.Position := Round( i / itotal * 100);
            Application.ProcessMessages;
            next;
            continue;
          end;
          PaidStatus := fieldbyname('PAID_STATUS').asstring;
          PaidFlag := fieldbyname('PAID_FLAG').asstring;
          PaidAmount := fieldbyname('AMOUNT').asfloat;
          PaidDate := fieldbyname('DATE').asdatetime;
          DoOnePayment;
          PBAccExport3frm.Progress.Position := Round( i / itotal * 100);
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
  Sage50Database.AliasName := sDataSource;
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
      parambyname('Sales_invoice_no').asstring := inttostr(SalesInvoice);
      if PaidFlag = 'Y' then
        parambyname('Paid_Status').asstring := 'Y'
      else
        parambyname('Paid_Status').asstring := PaidStatus;

      parambyname('Paid_Amount').asfloat := PaidAmount;
      parambyname('Paid_Date').asdatetime := PaidDate;
      execsql;

    end;

  with UpCreditNoteSQL do
    begin
      close;
      parambyname('Reference').asstring := inttostr(SalesInvoice);
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
  MaximiserDB.AliasName := sDataSource;
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
          PBAccExport3frm.Progress.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TdmAccImport.AddQuickbooksCustomers(sDataSource: string);
begin
  QuickbooksDB.AliasName := sDataSource;
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
          PBAccExport3frm.Progress.Position := Round( i / itotal * 100);
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

function TdmAccImport.GetContactType(tempValue: string): integer;
var
  icontactType: integer;
begin
  with qryGetCType do
    begin
      close;
      parambyname('Description').asstring := trim(TempValue);
      open;
      if recordcount > 0 then
        begin
          result := fieldbyname('Contact_Type').asinteger;
          exit;
        end
    end;

  {create a new Contact}
  qryNextCType.close;
  qryNextCType.open;
  iContactType := qryNextCType.fieldbyname('Next_Contact_Type').asinteger;

  with qryAddCType do
    begin
      close;
      parambyname('Contact_Type').asinteger := iContactType;
      parambyname('Description').asstring := TempValue;
      execsql;
    end;
  Result := iContactType;
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

procedure TdmAccImport.SetCostPrice(const Value: double);
begin
  FCostPrice := Value;
end;

procedure TdmAccImport.SetCustomerAccount(const Value: string);
begin
  FCustomerAccount := Value;
end;

procedure TdmAccImport.SetCustomerOrderRef(const Value: string);
begin
  FCustomerOrderRef := Value;
end;

procedure TdmAccImport.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TdmAccImport.SetOrderDate(const Value: Tdatetime);
begin
  FOrderDate := Value;
end;

procedure TdmAccImport.SetPONumber(const Value: real);
begin
  FPONumber := Value;
end;

procedure TdmAccImport.SetProductType(const Value: string);
begin
  FProductType := Value;
end;

procedure TdmAccImport.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TdmAccImport.SetRequiredDate(const Value: TdateTime);
begin
  FRequiredDate := Value;
end;

procedure TdmAccImport.SetSalesInvoiceDate(const Value: TDateTime);
begin
  FSalesInvoiceDate := Value;
end;

procedure TdmAccImport.SetSalesInvoiceNo(const Value: string);
begin
  FSalesInvoiceNo := Value;
end;

procedure TdmAccImport.SetSellPrice(const Value: double);
begin
  FSellPrice := Value;
end;

procedure TdmAccImport.SetSupplierInvoiceNo(const Value: string);
begin
  FSupplierInvoiceNo := Value;
end;

procedure TdmAccImport.SetSupplierAccount(const Value: string);
begin
  FSupplierAccount := Value;
end;

procedure TdmAccImport.SetSupplierInvoiceDate(const Value: TDateTime);
begin
  FSupplierInvoiceDate := Value;
end;

procedure TdmAccImport.SetSupplierOrderRef(const Value: string);
begin
  FSupplierOrderRef := Value;
end;

procedure TdmAccImport.SetVatable(const Value: string);
begin
  FVatable := Value;
end;

function TdmAccImport.DoOneOrder: boolean;
var
  iCustomer, iBranch, icontact, iSuppBranch, isupplier, iSuppContact, iProductType, iPriceUnit, iRep, iVATID: integer;
begin
  result := false;
  {Check that Customer exists}
  with CustExistSQL do
    begin
      close;
      Parambyname('Account_Code').asstring := trim(copy(CustomerAccount,1,10));
      Parambyname('Customer_Name').asstring := '';
      open;

      if RecordCount > 0 then
        begin
          iCustomer := fieldbyname('Customer').asinteger;
          iBranch := fieldbyname('Branch_no').asinteger;
        end
      else
        exit;
    end;

  {Get the Rep}
  with qryGetRep do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_no').asinteger := iBranch;
      open;

      iRep := fieldbyname('Rep').asinteger;
    end;

  {If no Rep then get the first one}
  if iRep = 0 then
    begin
      with qryGetTopRep do
        begin
          close;
          open;

          iRep := fieldbyname('Rep').asinteger;
        end;
    end;

  {get the Supplier details}
  if SupplierAccount = '' then
    SupplierAccount := dmBroker.GetCompanySupplierAccCode;

  with GetSuppBranchSQL do
    begin
      close;
      Parambyname('Account_Code').asstring := trim(copy(SupplierAccount,1,10));
      open;

      if RecordCount > 0 then
        begin
          iSupplier := fieldbyname('Supplier').asinteger;
          iSuppBranch := fieldbyname('Branch_no').asinteger;
        end
      else
        begin
          iSupplier := dmBroker.GetCompanySupplier;
          iSuppBranch := dmBroker.GetCompanySupplierBranch;
        end;
    end;

  {Get a contact, if it exists then OK otherwise create one}
  with qryGetCustomerContact do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_no').asinteger := iBranch;
      open;

      if RecordCount > 0 then
        begin
          iContact := fieldbyname('Contact_no').asinteger;
        end
      else
        begin
          with GetNextContactSQL do
          begin
            close;
            parambyname('Customer').asinteger := iCustomer;
            parambyname('Branch_no').asinteger := iBranch;
            open;

            iContact := fieldbyname('Last_Contact').asinteger+1;
          end;

          With AddContactSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icustomer;
            ParamByName('Branch_No').AsInteger := iBranch;
            ParamByName('Contact_No').AsInteger := icontact;
            ParamByName('Name').AsString := 'Name';
            ParamByName('Phone').AsString := '0';
            ParamByName('Mobile_no').AsString := '07';
            ParamByName('EMail').AsString := '';
            ParamByName('ExportFilter').AsString := 'PDF';
            ParamByName('Salutation').AsString := 'Name';
            ParamByName('Contact_Type').AsInteger := 1;
            ExecSQL ;
          end;
        end;
    end;

  {Get the Supplier contact}
  with qryGetSupplierContact do
    begin
      close;
      parambyname('Supplier').asinteger := iSupplier;
      parambyname('Branch_no').asinteger := iSuppBranch;
      open;

      if RecordCount > 0 then
        begin
          iSuppContact := fieldbyname('Contact_no').asinteger;
        end
      else
        begin
          with GetNextSuppContactSQL do
          begin
            close;
            parambyname('Supplier').asinteger := iSupplier;
            parambyname('Branch_no').asinteger := iSuppBranch;
            open;

            iSuppContact := fieldbyname('Last_Contact').asinteger+1;
          end;

          with AddSuppContSQL do
          begin
            Close ;
            ParamByName('Supplier').AsInteger := isupplier;
            ParamByName('Branch_No').AsInteger := 0;
            ParamByName('Contact_No').AsInteger := iSuppcontact;
            ParamByName('Name').AsString := 'Name';
            ParamByName('Phone').AsString := '0';
            ParamByName('Mobile_no').AsString := '07';
            ParamByName('EMail').AsString := '';
            ParamByName('ExportFilter').AsString := 'PDF';
            ParamByName('Salutation').AsString := 'Name';
            ParamByName('Contact_Type').AsInteger := 1;
            ExecSQL ;
          end;
        end;
    end;

  {Get the Product type code based on the Product type description}
  with qryGetProductType do
    begin
      close;
      parambyname('Description').asstring := ProductType;
      open;

      if recordcount > 0 then
        iProductType := fieldbyname('Product_Type').asinteger
      else
        iProductType := dmBroker.GetDefaultProductType;
    end;

  {Get the Order Unit}
  if PriceUnit = 0 then
    begin
      with qryGetPriceUnit do
        begin
          close;
          open;

          iPriceUnit := fieldbyname('Price_Unit').asinteger;
        end;
    end
  else
    iPriceUnit := PriceUnit;

  {Add the Purchase Order here}
  with qryAddPO do
    begin
      close;
      parambyname('Purchase_order').asfloat := PONumber;
      parambyname('Date_Point').asdatetime := OrderDate;
      parambyname('Supplier').asinteger := iSupplier;
      parambyname('Branch_No').asinteger := iSuppBranch;
      if Operator = 0 then
        parambyname('Operator').asinteger := frmPBMainMenu.iOperator
      else
        parambyname('Operator').asinteger := Operator;

      parambyname('Purch_Ord_Head_Status').asinteger := OrderStatus;

      parambyname('Contact_no').asinteger := iSuppContact;

      if OfficeContact = 0 then
        parambyname('Office_Contact').asinteger := frmPBMainMenu.iOperator
      else
        parambyname('Office_Contact').asinteger := OfficeContact;
      execsql;
    end;

  {Add the Purchase Order Line here}
  with qryAddPOLine do
    begin
      close;
      parambyname('Purchase_order').asfloat := PONumber;
      parambyname('Line').asinteger := 1;
      parambyname('Cust_Order_no').asstring := CustomerOrderRef;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_No').asinteger := iBranch;
      parambyname('Supplier_Reference').asstring := SupplierOrderRef;
      parambyname('Goods_Required').asdatetime := RequiredDate;
      parambyname('Goods_Reqd_by_Customer').asdatetime := RequiredDate;

(*      if InvoiceDate <> 0 then
        parambyname('Purch_Ord_Line_Status').asinteger := 30
      else
*)
      parambyname('Purch_Ord_Line_Status').asinteger := OrderStatus;

(*      if vatable = 'Y' then
        parambyname('Vat_Code').asinteger := 1
      else
        parambyname('Vat_Code').asinteger := 0;
*)

      if VatCode <> '' then
        iVatID := GetVATCode(VatCode)
      else
        iVatID := dmBroker.GetCompanyVatCode;

      if iVatID = -1 then
        iVatID := dmBroker.GetCompanyVatCode;

      parambyname('Vat_Code').asinteger := iVatID;

      parambyname('Suppliers_Desc').asstring := Description;
      parambyname('Customers_Desc').asstring := Description;

      parambyname('Quantity').asinteger := Quantity;
      parambyname('Order_Price').asfloat := CostPrice;
      parambyname('Selling_Price').asfloat := SellPrice;

      parambyname('List_Price').asfloat := sellPrice;
      parambyname('Product_Type').asinteger := iProductType;

      parambyname('Printed_PO').asstring := 'Y';
      parambyname('Sell_Unit').asinteger := iPriceUnit;
      parambyname('Order_Unit').asinteger := iPriceUnit;
      parambyname('Supp_Inv_Recd').asstring := 'N';

      parambyname('Rep').asinteger := iRep;
      parambyname('Contact_no').asinteger := iContact;
      parambyname('Qty_Supp_Inv').asfloat := Quantity;
      parambyname('Qty_Invoiced').asfloat := Quantity;
      execsql;
    end;

  {Add the Purchase Order Delivery Line}
  with qryAddDelivLine do
    begin
      close;
      parambyname('Purchase_order').asfloat := PONumber;
      parambyname('Line').asinteger := 1;
      parambyname('Delivery_No').asinteger := 1;
      parambyname('Qty_To_Deliver').asfloat := Quantity;
(*      if InvoiceDate <> 0 then
        parambyname('Qty_Delivered').asfloat := Quantity
      else
        parambyname('Qty_Delivered').asfloat := 0;
*)
      parambyname('Qty_Invoiced').asfloat := 0;
      parambyname('Date_Point').asdatetime := OrderDate;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_No0').asinteger := iBranch;

      if OrderStatus > 20 then
        begin
          parambyname('Qty_Delivered').asfloat := Quantity;
          parambyname('Date_Deliv_Actual').asdatetime := InvoiceDate;
          parambyname('Is_Updated').asstring := 'Y';
        end
      else
        begin
          parambyname('Date_Deliv_Actual').clear;
          parambyname('Is_Updated').asstring := 'N';
          parambyname('Qty_Delivered').asfloat := 0;
        end;

      parambyname('No_of_Boxes').asinteger := 1;
      parambyname('Delivery_Instructions').asstring := '';
      parambyname('Delivery_To_Stock').asstring := 'N';
      parambyname('Goods_Reqd_by_Customer').asdatetime :=  RequiredDate;
      parambyname('Contact_Name').asstring := '';
      execsql;
    end;
  Result := true;
end;

procedure TdmAccImport.SetInvoiceDate(const Value: TDateTime);
begin
  FInvoiceDate := Value;
end;

function TdmAccImport.DoOneSalesInvoice: integer;
var
  iCustomer, iBranch, icontact, iRep, SINumber: integer;
begin
  Result := 0;
  SINumber := 0;

  {Check that Customer exists}
  with CustExistSQL do
    begin
      close;
      Parambyname('Account_Code').asstring := trim(copy(CustomerAccount,1,10));
      Parambyname('Customer_Name').asstring := '';
      open;

      if RecordCount > 0 then
        begin
          iCustomer := fieldbyname('Customer').asinteger;
          iBranch := fieldbyname('Branch_no').asinteger;
        end
      else
        exit;
    end;

  {Get the Rep}
  with qryGetRep do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_no').asinteger := iBranch;
      open;

      iRep := fieldbyname('Rep').asinteger;
    end;

  {If no Rep then get the first one}
  if iRep = 0 then
    begin
      with qryGetTopRep do
        begin
          close;
          open;

          iRep := fieldbyname('Rep').asinteger;
        end;
    end;

  {Get a contact, if it exists then OK otherwise create one}
  with qryGetCustomerContact do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_no').asinteger := iBranch;
      open;

      if RecordCount > 0 then
        begin
          iContact := fieldbyname('Contact_no').asinteger;
        end
      else
        begin
          with GetNextContactSQL do
          begin
            close;
            parambyname('Customer').asinteger := iCustomer;
            parambyname('Branch_no').asinteger := iBranch;
            open;

            iContact := fieldbyname('Last_Contact').asinteger+1;
          end;

          With AddContactSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icustomer;
            ParamByName('Branch_No').AsInteger := iBranch;
            ParamByName('Contact_No').AsInteger := icontact;
            ParamByName('Name').AsString := 'Name';
            ParamByName('Phone').AsString := '0';
            ParamByName('Mobile_no').AsString := '07';
            ParamByName('EMail').AsString := '';
            ParamByName('ExportFilter').AsString := 'PDF';
            ParamByName('Salutation').AsString := 'Name';
            ParamByName('Contact_Type').AsInteger := 1;
            ExecSQL ;
          end;
        end;
    end;

  {Get the SI number if not already found one}
  if SINumber = 0 then
    begin
      with qryGetNextSI do
        begin
          close;
          open;
          SINumber := fieldbyname('Next_SI_Number').asinteger;
        end;
    end;

  {Add the Sales Invoice}
  with qryAddSI do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := SINumber;
      parambyname('Invoice_Date').asdatetime := SalesInvoiceDate;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_No').asinteger := iBranch;

      if Operator = 0 then
        parambyname('Operator').asinteger := frmPBMainMenu.iOperator
      else
        parambyname('Operator').asinteger := Operator;

      parambyname('Sales_Invoice_Status').asinteger := OrderStatus;

      parambyname('Contact_no').asinteger := iContact;

      if OfficeContact = 0 then
        parambyname('Office_Contact').asinteger := frmPBMainMenu.iOperator
      else
        parambyname('Office_Contact').asinteger := OfficeContact;

//      parambyname('Goods_Value').asfloat := SellPrice;
      parambyname('Goods_Value').asfloat := 0.00;

      parambyname('Vat_Value').asfloat := 0.00;

      parambyname('Sales_Invoice_no').asstring := SalesInvoiceNo;
      parambyname('Inv_to_Customer').asinteger := iCustomer;
      parambyname('Inv_To_Branch').asinteger := iBranch;
      parambyname('Invoice_Or_Credit').asstring := InvoiceOrCredit;

      parambyname('Paid_Status').asstring := PaidStatus;
      parambyname('Paid_Amount').asfloat := 0;
      parambyname('Paid_Date').asdatetime := PaidDate;

      parambyname('Sales_Invoice_Type').asstring := 'J';

      parambyname('Reference').asstring := Reference;
      parambyname('Rep').asinteger := iRep;
      parambyname('Invoice_Description').asstring := Description;
      parambyname('Currency_Code').asinteger := 1;
      parambyname('Cash_Sales').asstring := 'N';
      parambyname('Electronic_Invoice').asstring := 'N';
      parambyname('Cust_Order_No').asstring := CustomerOrderRef;
      execsql;
    end;

  Result := SINumber;
end;

procedure TdmAccImport.UpdateSalesInvoice(Invoice: integer);
var
  rGoodsValue, rVatValue, rVatRate: real;
  iPriceUnitFactor, iVatCode: integer;
begin
  {Add the Sales Invoice}
  with qryUpdSI do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := Invoice;

      iPriceUnitFactor := GetPriceUnitFactor(PriceUnit);
      if iPriceUnitFactor = 0 then
        begin
          rGoodsValue := SellPrice;
        end
      else
        begin
          rGoodsValue := SellPrice * (Quantity/iPriceUnitFactor);
        end;

      parambyname('Goods_Value').asfloat := rGoodsValue;

      iVatCode := GetVATCode(VatCode);
      rVatRate := GetVATRate(iVatCode);
      rVatValue := rGoodsValue * (rVatRate/100);

      parambyname('Vat_Value').asfloat := rVatValue;

      execsql;
    end;
end;

procedure TdmAccImport.DoOneSalesInvoiceCharge(tmpInvoice: integer);
var
  iSILine: integer;
begin
  {Get the next imvoice line number}
  with qryGetNextSICharge do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tmpInvoice;
      open;

      iSILine := fieldbyname('Next_SI_Charge_Number').asinteger;
    end;

  {Add the Sales Invoice Line here}
  with qryAddSICharge do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tmpInvoice;
      parambyname('Additional_Charge').asinteger := iSILine;

      parambyname('Details').asstring := Description;
      parambyname('Amount').asfloat := SellPrice;

      parambyname('Vat_Code').asinteger :=  GetVatCode(VatCode);
      parambyname('Nominal').asstring := NominalCode;
      execsql;
    end;

end;

procedure TdmAccImport.DoOneSalesInvoiceLine(tmpInvoice: integer);
var
  iSILine: integer;
begin
  {Get the next imvoice line number}
  with qryGetNextSILine do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tmpInvoice;
      open;

      iSILine := fieldbyname('Next_SI_Line_Number').asinteger;
    end;

  {Add the Sales Invoice Line here}
  with qryAddSILine do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tmpInvoice;
      parambyname('Invoice_Line_no').asinteger := iSILine;

      if PONumber <> 0 then
        begin
          parambyname('Purchase_Order').asfloat := PONumber;
          parambyname('Line').asinteger := 1;
        end
      else
        begin
          parambyname('Purchase_Order').clear;
          parambyname('Line').clear;
        end;

      parambyname('Qty_Invoiced').asfloat := Quantity;
      parambyname('Goods_Value').asfloat := SellPrice;
      parambyname('Vat_Value').asfloat := 0;

      parambyname('Vat_Code').asinteger :=  GetVatCode(VatCode);
      parambyname('Product_Type').asinteger := dmBroker.GetDefaultProductType;

      parambyname('Sales_Invoice_Status').asinteger := 30 ;

      parambyname('Price_Unit').asinteger := PriceUnit;

      parambyname('Nominal').asstring := NominalCode;

      parambyname('Job_Bag').asinteger := JBNumber;
      parambyname('Job_Bag_Line').asinteger := LineNumber;
      execsql;
    end;

end;

procedure TdmAccImport.DoOneSupplierInvoice;
var
  iCustomer, iBranch, icontact, iProductType, iPriceUnit, iRep, iSupplier, iSuppBranch, SINumber, PINumber: integer;
begin
  {Check that Customer exists}
  with CustExistSQL do
    begin
      close;
      Parambyname('Account_Code').asstring := trim(copy(CustomerAccount,1,10));
      Parambyname('Customer_Name').asstring := '';
      open;

      if RecordCount > 0 then
        begin
          iCustomer := fieldbyname('Customer').asinteger;
          iBranch := fieldbyname('Branch_no').asinteger;
        end
      else
        exit;
    end;

  {get the Supplier details}
  with GetSuppBranchSQL do
    begin
      close;
      Parambyname('Account_Code').asstring := trim(copy(SupplierAccount,1,10));
      open;

      if RecordCount > 0 then
        begin
          iSupplier := fieldbyname('Supplier').asinteger;
          iSuppBranch := fieldbyname('Branch_no').asinteger;
        end
      else
        exit;
    end;

  {Get the Product type code based on the Product type description}
  with qryGetProductType do
    begin
      close;
      parambyname('Description').asstring := ProductType;
      open;

      if recordcount > 0 then
        iProductType := fieldbyname('Product_Type').asinteger
      else
        iProductType := dmBroker.GetDefaultProductType;
    end;

  {Get the Order Unit}
  with qryGetPriceUnit do
    begin
      close;
      open;

      iPriceUnit := fieldbyname('Price_Unit').asinteger;
    end;

  {Get the PI number}
  with qryGetNextPI do
    begin
      close;
      open;
      PINumber := fieldbyname('Next_PI_Number').asinteger;
    end;

  {Add the Supplier Invoice}
  with qryAddPI do
    begin
      close;
      parambyname('Supplier_Invoice').asinteger := PINumber;
      parambyname('Invoice_Date').asdatetime := SupplierInvoiceDate;
      parambyname('Supplier').asinteger := iSupplier;
      parambyname('Branch_No').asinteger := iBranch;
      parambyname('Operator').asinteger := frmPBMainMenu.iOperator;
      parambyname('Supp_Invoice_Status').asinteger := 30;

      parambyname('Supp_Inv_Alt_Ref').asstring := inttostr(PINumber);

      parambyname('Goods_Value').asfloat := CostPrice;

      if Vatable = 'Y' then
        parambyname('Vat_Value').asfloat := SellPrice * 0.20
      else
        parambyname('Vat_Value').asfloat := 0;

      parambyname('Supplier_Invoice_no').asstring := SupplierInvoiceNo;

      parambyname('Invoice_Or_Credit').asstring := 'I';

      parambyname('Goods_Value_Diff').asfloat := 0.00;
      parambyname('Vat_Value_Diff').asfloat := 0.00;

      parambyname('Currency_Code').asinteger := 1;
      execsql;
    end;

  {Add the Sales Invoice Line here}
  with qryAddPILine do
    begin
      close;
      parambyname('Supplier_Invoice').asinteger := PINumber;
      parambyname('Invoice_Line_no').asinteger := 1;
      parambyname('Purchase_Order').asfloat := PONumber;
      parambyname('Line').asinteger := 1;
      parambyname('Qty_Invoiced').asfloat := Quantity;
      parambyname('Goods_Value').asfloat := CostPrice;

      if vatable = 'Y' then
        parambyname('Vat_Code').asinteger := 1
      else
        parambyname('Vat_Code').asinteger := 0;

      parambyname('Vat_Value').asfloat := 0.00;
      
      parambyname('Supp_Invoice_Status').asinteger := 30 ;

      parambyname('Price_Unit').asinteger := iPriceUnit;

      parambyname('Nominal').asstring := dmBroker.GetCompanyPurchaseNominal;

      execsql;
    end;

end;

procedure TdmAccImport.SetCustomerStatus(const Value: string);
begin
  FCustomerStatus := Value;
end;

procedure TdmAccImport.SetContactMobile(const Value: string);
begin
  FContactMobile := Value;
end;

procedure TdmAccImport.SetAnalysis1(const Value: string);
begin
  FAnalysis1 := Value;
end;

procedure TdmAccImport.SetAnalysis2(const Value: string);
begin
  FAnalysis2 := Value;
end;

procedure TdmAccImport.SetAnalysis3(const Value: string);
begin
  FAnalysis3 := Value;
end;

procedure TdmAccImport.SetAnalysis4(const Value: string);
begin
  FAnalysis4 := Value;
end;

procedure TdmAccImport.SetCoRegNumber(const Value: string);
begin
  FCoRegNumber := Value;
end;

procedure TdmAccImport.SetSubRep(const Value: string);
begin
  FSubRep := Value;
end;

procedure TdmAccImport.SetCustomerType(const Value: string);
begin
  FCustomerType := Value;
end;

function TdmAccImport.GetVatCode(tempDescription: string): integer;
begin
  result := 0;
  with qryGetVatCode do
    begin
      close;
      parambyname('Vat_Ref').asstring := tempDescription;
      open;

      if recordcount = 0 then
        result := -1
      else
        result := fieldbyname('Vat_Code').asinteger;
    end;
end;

function TdmAccImport.GetCustomerType(tempDescription: string): integer;
begin
  result := 0;
  with qryGetCustomerType do
    begin
      close;
      parambyname('Description').asstring := tempDescription;
      open;

      if recordcount = 0 then
        result := 0
      else
        result := fieldbyname('Customer_Type').asinteger;
    end;

  if result = 0 then
    begin
      with qryAddCustomerType do
        begin
          close;
          parambyname('Description').asstring := tempDescription;
          execsql;
        end;
    end
  else
    exit;

  with qryGetCustomerType do
    begin
      close;
      parambyname('Description').asstring := tempDescription;
      open;

      result := fieldbyname('Customer_Type').asinteger;
    end;
end;

function TdmAccImport.GetPaymentTerms(tempValue: integer): integer;
begin
  result := 0;
  with qryGetPaymentTerms do
    begin
      close;
      parambyname('Number_of_Days').asinteger := tempValue;
      open;

      if recordcount = 0 then
        result := 0
      else
        result := fieldbyname('payment_Terms').asinteger;
    end;
end;

function TdmAccImport.GetCountry(tempDescription: string): integer;
begin
  if trim(tempDescription) = '' then
    begin
      result := 0;
      exit;
    end;
    
  with qryGetCountry do
    begin
      close;
      parambyname('Description').asstring := tempDescription;
      open;

      if recordcount = 0 then
        result := 0
      else
        result := fieldbyname('Country_id').asinteger;
    end;

  if result = 0 then
    begin
      with qryAddCountry do
        begin
          close;
          parambyname('Description').asstring := tempDescription;
          execsql;
        end;
    end
  else
    exit;

  with qryGetCountry do
    begin
      close;
      parambyname('Description').asstring := tempDescription;
      open;

      result := fieldbyname('Country_id').asinteger;
    end;
end;

procedure TdmAccImport.SetCountry(const Value: string);
begin
  FCountry := Value;
end;

procedure TdmAccImport.SetDateCreated(const Value: TDateTime);
begin
  FDateCreated := Value;
end;

procedure TdmAccImport.SetContactType(const Value: string);
begin
  FContactType := Value;
end;

procedure TdmAccImport.SetFirstName(const Value: string);
begin
  FFirstName := Value;
end;

procedure TdmAccImport.SetLastName(const Value: string);
begin
  FLastName := Value;
end;

procedure TdmAccImport.SetVATCode(const Value: string);
begin
  FVATCode := Value;
end;

procedure TdmAccImport.SetSICCode(const Value: string);
begin
  FSICCode := Value;
end;

procedure TdmAccImport.SetContactTitle(const Value: string);
begin
  FContactTitle := Value;
end;

procedure TdmAccImport.SetCreditTerms(const Value: integer);
begin
  FCreditTerms := Value;
end;

procedure TdmAccImport.SetContactEmail(const Value: string);
begin
  FContactEmail := Value;
end;

procedure TdmAccImport.SetOfficeContact(const Value: integer);
begin
  FOfficeContact := Value;
end;

procedure TdmAccImport.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

function TdmAccImport.GetJobBagByReference(tempCode: string): integer;
begin
  Result := 0;

  with qryGetJobBagRef do
    begin
      close;
      parambyname('Description_Reference').asstring := tempCode;
      open;

      Result := fieldbyname('Job_Bag').asinteger;
    end;
end;

function TdmAccImport.GetJobBagDescription(tempCode: string): string;
begin
  Result := '';

  with qryGetJobBagRef do
    begin
      close;
      parambyname('Description_Reference').asstring := tempCode;
      open;

      Result := fieldbyname('Job_Bag_Descr').asstring;
    end;
end;

function TdmAccImport.GetOperatorByInitials(tempName: string): integer;
begin
  Result := 0;

  with qryGetOperator do
    begin
      close;
      parambyname('Short_Name').asstring := tempName;
      open;

      Result := fieldbyname('Operator').asinteger;
    end;
end;

procedure TdmAccImport.SetCustomerContactName(const Value: string);
begin
  FCustomerContactName := Value;
end;

function TdmAccImport.GetPriceUnitByDescription(
  tempDescription: string): integer;
var
  iPUF: integer;
begin
  Result := 0;

  iPUF := 1;

  if tempDescription = 'Lot' then
    iPUF := 0
  else
  if (tempDescription = 'Each') or (tempDescription = 'EACH') then
    iPUF := 1;

  with qryGetPriceUnitbyDesc do
    begin
      close;
      parambyname('Description').asstring := tempDescription;
      parambyname('Price_Unit_Factor').asinteger := iPUF;
      open;
      result := fieldbyname('Price_Unit').asinteger;
    end;
end;

procedure TdmAccImport.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

function TdmAccImport.DoOneJobBag: integer;
var
  iCustomer, iBranch, icontact, iSuppBranch, isupplier, iSuppContact, iProductType, iRep, iJobBag: integer;
begin
  Result := 0;
  
  {Check that Customer exists}
  with CustExistSQL do
    begin
      close;
      Parambyname('Account_Code').asstring := trim(copy(CustomerAccount,1,10));
      Parambyname('Customer_Name').asstring := '';
      open;

      if RecordCount > 0 then
        begin
          iCustomer := fieldbyname('Customer').asinteger;
          iBranch := fieldbyname('Branch_no').asinteger;
        end
      else
        exit;
    end;

  {Get the Rep}
  with qryGetRep do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_no').asinteger := iBranch;
      open;

      iRep := fieldbyname('Rep').asinteger;
    end;

  {If no Rep then get the first one}
  if iRep = 0 then
    begin
      with qryGetTopRep do
        begin
          close;
          open;

          iRep := fieldbyname('Rep').asinteger;
        end;
    end;

  {Get a contact, if it exists then OK otherwise create one}
  with qryGetCustomerContact do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_no').asinteger := iBranch;
      open;

      if RecordCount > 0 then
        begin
          iContact := fieldbyname('Contact_no').asinteger;
        end
      else
        begin
          with GetNextContactSQL do
          begin
            close;
            parambyname('Customer').asinteger := iCustomer;
            parambyname('Branch_no').asinteger := iBranch;
            open;

            iContact := fieldbyname('Last_Contact').asinteger+1;
          end;

          With AddContactSQL do
          begin
            Close ;
            ParamByName('Customer').AsInteger := icustomer;
            ParamByName('Branch_No').AsInteger := iBranch;
            ParamByName('Contact_No').AsInteger := icontact;
            ParamByName('Name').AsString := 'Name';
            ParamByName('Phone').AsString := '0';
            ParamByName('Mobile_no').AsString := '07';
            ParamByName('EMail').AsString := '';
            ParamByName('ExportFilter').AsString := 'PDF';
            ParamByName('Salutation').AsString := 'Name';
            ParamByName('Contact_Type').AsInteger := 1;
            ExecSQL ;
            ExecSQL ;
          end;
        end;
    end;

  {Add the Job bag Header}
  with qryAddJobBag do
    begin
      close;
      iJobBag := GetNextJobBagNumber;
      parambyname('Job_Bag').asinteger := iJobBag;
      parambyname('Job_Bag_Descr').asstring := Description;
      parambyname('Date_Point').asdatetime := OrderDate;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_No').asinteger := iBranch;
      parambyname('Contact_no').asinteger := iContact;
      parambyname('Rep').asinteger := iRep;

      parambyname('Cust_Order_no').asstring := CustomerOrderRef;
      parambyname('Goods_Required').asdatetime := RequiredDate;

      if Operator = 0 then
        parambyname('Operator').asinteger := frmPBMainMenu.iOperator
      else
        parambyname('Operator').asinteger := Operator;

      if OfficeContact = 0 then
        parambyname('Office_Contact').asinteger := frmPBMainMenu.iOperator
      else
        parambyname('Office_Contact').asinteger := OfficeContact;

      parambyname('Description_Reference').asstring := DescriptiveReference;
      parambyname('Quantity').asinteger := Quantity;

      parambyname('Job_bag_Status').asinteger := OrderStatus;

      if OrderStatus > 20 then
        parambyname('Qty_Invoiced').asinteger := Quantity
      else
        parambyname('Qty_Invoiced').asinteger := 0;

      execsql;
    end;

  with qryUpCompany do
    begin
      close;
      parambyname('Last_Job_Bag_Number').asinteger := iJobBag;
      execsql;
    end;

  Result := iJobBag;
end;

function TdmAccImport.GetNextJobBagNumber: integer;
begin
  Result := 1;
  with qryGetNextJobBag do
    begin
      close;
      open;
      result := fieldbyname('Next_Job_Bag_Number').asinteger;
    end;
end;

procedure TdmAccImport.SetDescriptiveReference(const Value: string);
begin
  FDescriptiveReference := Value;
end;

procedure TdmAccImport.SetLineNumber(const Value: integer);
begin
  FLineNumber := Value;
end;

procedure TdmAccImport.DoOneJobBagLine(tmpJobBag: integer);
var
  iPriceUnitFactor: integer;
begin
  {Add the Job bag Header}
  with qryAddJobBagLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tmpJobBag;
      parambyname('Job_bag_line').asinteger := self.LineNumber;

      if PONumber <> 0 then
        begin
          parambyname('Job_bag_line_Type').asstring := 'P';
          parambyname('Purchase_Order').asfloat := PONumber;
          parambyname('Line').asinteger := 1;
          parambyname('Supplier').asinteger := GetPurchaseOrderSupplier(PONumber);
          parambyname('Branch_no').asinteger := GetPurchaseOrderSupplierBranch(PONumber);
        end
      else
        begin
          parambyname('Job_bag_line_Type').asstring := 'A';
          parambyname('Purchase_Order').clear;
          parambyname('Line').clear;
          parambyname('Supplier').asinteger := dmBroker.GetCompanySupplier;
          parambyname('Branch_no').asinteger := 0
        end;

      parambyname('Job_Bag_line_Descr').asstring := Description;

      iPriceUnitFactor := GetPriceUnitFactor(PriceUnit);
      if iPriceUnitFactor = 0 then
        begin
          parambyname('Job_Bag_Line_Cost').asfloat := CostPrice;
          parambyname('Job_Bag_line_Sell').asfloat := SellPrice;
        end
      else
        begin
          parambyname('Job_Bag_Line_Cost').asfloat := CostPrice * (Quantity/iPriceUnitFactor);
          parambyname('Job_Bag_line_Sell').asfloat := SellPrice * (Quantity/iPriceUnitFactor);
        end;

      parambyname('Job_Bag_Line_Invoiced').asstring := 'Y';
      parambyname('Job_Bag_Quantity').asinteger := Quantity;
      parambyname('Vat_Code').asinteger :=  GetVatCode(VatCode);
      parambyname('Product_Type').asinteger := dmBroker.GetDefaultProductType;
      parambyname('Inactive').asstring := 'N';
      parambyname('Job_Bag_line_Status').asinteger := 30;
      parambyname('Price_Unit').asinteger := PriceUnit;
      parambyname('Selling_Price').asfloat := SellPrice;
      parambyname('Sequence_no').asinteger := LineNumber;
      parambyname('Ready_to_Invoice').asstring := 'Y';
      parambyname('Qty_Invoiced').asinteger := Quantity;
      execsql;
    end;
end;

function TdmAccImport.GetPriceUnitFactor(tempPriceUnit: integer): integer;
begin
  with qryGetPriceUnitFactor do
    begin
      close;
      parambyname('Price_Unit').asinteger := tempPriceUnit;
      open;

      Result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

function TdmAccImport.GetSupplierAccountCode(tempPO: string): string;
begin
  with qryGetPOImport do
    begin
      close;
      parambyname('Purchase_Order').asstring := tempPO;
      open;

      Result := fieldbyname('Supplier_Number').asstring;
    end;
end;

function TdmAccImport.GetSupplierByAccountCode(tempCode: string): integer;
begin
  with qryGetSupplierByAccount do
    begin
      close;
      parambyname('Account_Code').asstring := tempCode;
      open;

      Result := fieldbyname('Supplier').asinteger;
    end;
end;

function TdmAccImport.GetPurchaseOrderSupplier(tmpPO: real): integer;
begin
  with qryGetPurchaseOrder do
    begin
      close;
      parambyname('Purchase_order').asfloat := tmpPO;
      open;
      result := fieldbyname('Supplier').asinteger;
    end;
end;

function TdmAccImport.GetPurchaseOrderSupplierBranch(
  tmpPO: real): integer;
begin
  with qryGetPurchaseOrder do
    begin
      close;
      parambyname('Purchase_order').asfloat := tmpPO;
      open;
      result := fieldbyname('Branch_No').asinteger;
    end;

end;

procedure TdmAccImport.SetOrderStatus(const Value: integer);
begin
  FOrderStatus := Value;
end;

function TdmAccImport.OrderExists(tmpOrder: real): boolean;
begin
  Result := false;

  with qryGetPurchaseOrder do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tmpOrder;
      open;
      result := (recordcount > 0);
    end;
end;

function TdmAccImport.JBLineExists(tmpJB, tmpLine: integer): boolean;
begin
  Result := false;

  with qryGetJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tmpJB;
      parambyname('Job_Bag_Line').asinteger := tmpLine;
      open;
      result := (recordcount > 0);
    end;
end;

function TdmAccImport.UpdateOrder: boolean;
var
  iPriceUnitFactor: integer;
begin
  Result := false;
  try
    with qryUpdPOLine do
      begin
        close;
        parambyname('Purchase_Order').asfloat := PONumber;
        parambyname('Quantity').asinteger := Quantity;
        execsql
      end;

    with qryUpdDeliveryDetail do
      begin
        close;
        parambyname('Purchase_Order').asfloat := PONumber;
        parambyname('Quantity').asinteger := Quantity;
        execsql
      end;

    with qryUpdJBLine do
      begin
        close;
        parambyname('Purchase_Order').asfloat := PONumber;
        parambyname('Quantity').asinteger := Quantity;

        iPriceUnitFactor := GetPriceUnitFactor(PriceUnit);
        if iPriceUnitFactor = 0 then
          begin
            parambyname('Job_Bag_Line_Cost').asfloat := CostPrice;
            parambyname('Job_Bag_line_Sell').asfloat := SellPrice;
          end
        else
          begin
            parambyname('Job_Bag_Line_Cost').asfloat := CostPrice * (Quantity/iPriceUnitFactor);
            parambyname('Job_Bag_line_Sell').asfloat := SellPrice * (Quantity/iPriceUnitFactor);
          end;

        execsql
      end;
  finally
    Result := true;
  end;

end;

procedure TdmAccImport.SetInvoiceOrCredit(const Value: string);
begin
  FInvoiceOrCredit := Value;
end;

procedure TdmAccImport.SetNominalCode(const Value: string);
begin
  FNominalCode := Value;
end;

procedure TdmAccImport.SetJBNumber(const Value: integer);
begin
  FJBNumber := Value;
end;

function TdmAccImport.GetVatRate(tempCode: integer): real;
begin
  result := 0;
  with qryGetVat do
    begin
      close;
      parambyname('Vat_Code').asinteger := tempCode;
      open;

      if recordcount = 0 then
        result := -1
      else
        result := fieldbyname('Vat_Rate').asfloat;
    end;

end;

end.
