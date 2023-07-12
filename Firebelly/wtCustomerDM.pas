unit wtCustomerDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdtmdlCustomers = class(TDataModule)
    qryBranches: TQuery;
    dtsBranches: TDataSource;
    qryRep: TQuery;
    dtsRep: TDataSource;
    lkpCustomerType: TQuery;
    dtsCustomerType: TDataSource;
    dtsVAT: TDataSource;
    lkpVAT: TQuery;
    lkpCreditStatus: TQuery;
    dtsCreditStatus: TDataSource;
    qryQuotes: TQuery;
    qryEvents: TQuery;
    dtsEvents: TDataSource;
    dtsQuotes: TDataSource;
    qrySOrders: TQuery;
    qrySOrdersSales_Order: TIntegerField;
    qrySOrdersDate_Raised: TDateTimeField;
    qrySOrdersDate_Required: TDateTimeField;
    qrySOrdersCustomer: TIntegerField;
    qrySOrdersReference: TStringField;
    qrySOrdersExtra_Notes: TIntegerField;
    qrySOrdersOperator: TIntegerField;
    qrySOrdersContact_Name: TStringField;
    qrySOrdersOrder_ref_no: TStringField;
    qrySOrdersSales_Order_Status: TIntegerField;
    qrySOrdersDeposit_amount: TFloatField;
    qrySOrdersDeposit_Terms: TFloatField;
    qrySOrdersGoods_Value: TFloatField;
    qrySOrdersVAT_Value: TFloatField;
    qrySOrdersRep: TIntegerField;
    qrySOrdersInstall_Address: TIntegerField;
    qrySOrdersInactive: TStringField;
    qrySOrdersCustomer_Name: TStringField;
    qrySOrdersInactive_Reason: TIntegerField;
    qrySOrdersAddress: TIntegerField;
    qrySOrdersTemplate_Date: TDateTimeField;
    qrySOrdersoriginal_customer_name: TStringField;
    qrySOrdersOperator_name: TStringField;
    qrySOrdersTotal_Value: TFloatField;
    qrySOrderssales_order_status_desc: TStringField;
    qrySOrdersOn_Hold: TStringField;
    qrySOrdersStatus_Text: TStringField;
    dtsSOrders: TDataSource;
    qryJobs: TQuery;
    qryJobsJob: TFloatField;
    qryJobsJob_Status: TIntegerField;
    qryJobsQuote: TIntegerField;
    qryJobsCustomer: TIntegerField;
    qryJobsContact_name: TStringField;
    qryJobsOrder_ref_no: TStringField;
    qryJobsDate_Raised: TDateTimeField;
    qryJobsDate_Required: TDateTimeField;
    qryJobsPayment_due: TDateTimeField;
    qryJobsProduction_date: TDateTimeField;
    qryJobsTemplate_date: TDateTimeField;
    qryJobsInstallation_date: TDateTimeField;
    qryJobsDeposit_amount: TFloatField;
    qryJobsDelivery_Price: TFloatField;
    qryJobsInstallation_price: TFloatField;
    qryJobsSurvey_price: TFloatField;
    qryJobsOperator: TIntegerField;
    qryJobsProduction_date_Actual: TDateTimeField;
    qryJobsTemplate_date_actual: TDateTimeField;
    qryJobsInstallation_date_actual: TDateTimeField;
    qryJobsDescription: TStringField;
    qryJobsMaterial_Type: TIntegerField;
    qryJobsExtra_Notes: TIntegerField;
    qryJobsAvailability: TIntegerField;
    qryJobsPayment_Terms: TIntegerField;
    qryJobsReference: TStringField;
    qryJobsNett_Price: TFloatField;
    qryJobsInactive: TStringField;
    qryJobsInactive_Reason: TIntegerField;
    qryJobsAddress: TIntegerField;
    qryJobsDiscount_Rate: TFloatField;
    qryJobsDiscount_Value: TFloatField;
    qryJobsCustomer_Name: TStringField;
    qryJobsMaterial_Description: TStringField;
    qryJobsStatus_Description: TStringField;
    qryJobsOperator_Name: TStringField;
    qryJobsGross_Price: TFloatField;
    qryJobsInstall_Address: TIntegerField;
    qryJobsDeposit_Terms: TFloatField;
    qryJobsVAT: TIntegerField;
    qryJobsQuote_Nett_Price: TFloatField;
    qryJobsSales_Order: TIntegerField;
    qryJobsis_retail_customer: TStringField;
    dtsJobs: TDataSource;
    qryInvoices: TQuery;
    qryInvoicesInvoice_Date: TDateTimeField;
    qryInvoicesCustomer: TIntegerField;
    qryInvoicesInactive: TStringField;
    qryInvoicesInvoice_or_Credit: TStringField;
    qryInvoicesCustomer_Name: TStringField;
    qryInvoicesStatus_Description: TStringField;
    qryInvoicesGoods_Value: TFloatField;
    qryInvoicesVat_Value: TFloatField;
    qryInvoicesTotal_Value: TFloatField;
    qryInvoicesInvoice_no: TStringField;
    qryInvoicesSales_invoice_status: TIntegerField;
    qryInvoicesSales_Invoice: TIntegerField;
    qryInvoicesReference: TStringField;
    qryInvoicesDescription: TStringField;
    dtsInvoices: TDataSource;
    qryQuotesQuote: TIntegerField;
    qryQuotesDate_Required: TDateTimeField;
    qryQuotesDate_Raised: TDateTimeField;
    qryQuotesCustomer: TIntegerField;
    qryQuotesDescription: TStringField;
    qryQuotesOperator: TIntegerField;
    qryQuotesInstallation_price: TFloatField;
    qryQuotesDelivery_Price: TFloatField;
    qryQuotesSurvey_price: TFloatField;
    qryQuotesExtra_Notes: TIntegerField;
    qryQuotesAvailability: TIntegerField;
    qryQuotesPayment_terms: TIntegerField;
    qryQuotesReference: TStringField;
    qryQuotesQuote_Status: TIntegerField;
    qryQuotesNett_Price: TFloatField;
    qryQuotesInactive: TStringField;
    qryQuotesInactive_reason: TIntegerField;
    qryQuotesOperator_Name: TStringField;
    qryQuotesStatus_Description: TStringField;
    qryQuotesCustomer_name: TStringField;
    qryQuotesContact_Name: TStringField;
    qryQuotesMaterial_Type: TIntegerField;
    qryQuotesMaterial_Description: TStringField;
    qryQuotesAddress: TIntegerField;
    qryQuotesGross_Price: TFloatField;
    qryQuotesIs_Retail_Customer: TStringField;
    qryAction: TQuery;
    dtsAction: TDataSource;
    qryOperator: TQuery;
    dtsOperator: TDataSource;
    qryCustContact: TQuery;
    dtsCustContact: TDataSource;
    qryProspectStatus: TQuery;
    dtsProspectStatus: TDataSource;
    qryPaymentTerms: TQuery;
    dtsPaymentTerms: TDataSource;
    qryWorkGroups: TQuery;
    qryGetAddress: TQuery;
    qryLevelofImportance: TQuery;
    dtsLeveloFImportance: TDataSource;
    qryMaterialTypes: TQuery;
    dtsMaterialTypes: TDataSource;
  private
    FContactCount: integer;
    function GetHeaderCount: integer;
    function GetContactCount: integer;
    { Private declarations }
  public
    CustomerName: string;
    ShowInactive: boolean;
    procedure refreshData;
    property HeaderCount: integer read GetHeaderCount;
    property ContactCount: integer read GetContactCount;
  end;

var
  dtmdlCustomers: TdtmdlCustomers;

implementation

uses
  wtDataModule;

{$R *.DFM}

function TdtmdlCustomers.GetHeaderCount: integer;
begin

end;

procedure TdtmdlCustomers.refreshData;
begin

end;

function TdtmdlCustomers.GetContactCount: integer;
begin

end;

end.
