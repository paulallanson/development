unit wtCustomerDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlCustomers = class(TDataModule)
    qryBranches: TFDQuery;
    dtsBranches: TDataSource;
    qryRep: TFDQuery;
    dtsRep: TDataSource;
    lkpCustomerType: TFDQuery;
    dtsCustomerType: TDataSource;
    dtsVAT: TDataSource;
    lkpVAT: TFDQuery;
    lkpCreditStatus: TFDQuery;
    dtsCreditStatus: TDataSource;
    qryQuotes: TFDQuery;
    qryEvents: TFDQuery;
    dtsEvents: TDataSource;
    dtsQuotes: TDataSource;
    qrySOrders: TFDQuery;
    dtsSOrders: TDataSource;
    qryJobs: TFDQuery;
    dtsJobs: TDataSource;
    qryInvoices: TFDQuery;
    dtsInvoices: TDataSource;
    qryAction: TFDQuery;
    dtsAction: TDataSource;
    qryOperator: TFDQuery;
    dtsOperator: TDataSource;
    qryCustContact: TFDQuery;
    dtsCustContact: TDataSource;
    qryProspectStatus: TFDQuery;
    dtsProspectStatus: TDataSource;
    qryPaymentTerms: TFDQuery;
    dtsPaymentTerms: TDataSource;
    qryWorkGroups: TFDQuery;
    qryGetAddress: TFDQuery;
    qryLevelofImportance: TFDQuery;
    dtsLeveloFImportance: TDataSource;
    qryMaterialTypes: TFDQuery;
    dtsMaterialTypes: TDataSource;
    qryQuotesQuote: TIntegerField;
    qryQuotesDate_Required: TDateTimeField;
    qryQuotesDate_Raised: TDateTimeField;
    qryQuotesCustomer: TIntegerField;
    qryQuotesDescription: TWideStringField;
    qryQuotesOperator: TIntegerField;
    qryQuotesInstallation_price: TCurrencyField;
    qryQuotesDelivery_Price: TCurrencyField;
    qryQuotesSurvey_price: TCurrencyField;
    qryQuotesExtra_Notes: TIntegerField;
    qryQuotesAvailability: TIntegerField;
    qryQuotesPayment_terms: TIntegerField;
    qryQuotesReference: TWideStringField;
    qryQuotesQuote_Status: TIntegerField;
    qryQuotesNett_Price: TCurrencyField;
    qryQuotesInactive: TWideStringField;
    qryQuotesInactive_reason: TIntegerField;
    qryQuotesOperator_Name: TWideStringField;
    qryQuotesStatus_Description: TWideStringField;
    qryQuotesCustomer_name: TWideStringField;
    qryQuotesContact_Name: TWideStringField;
    qryQuotesMaterial_Type: TIntegerField;
    qryQuotesMaterial_Description: TWideStringField;
    qryQuotesAddress: TIntegerField;
    qryQuotesGross_Price: TFloatField;
    qryQuotesIs_Retail_Customer: TWideStringField;
    qrySOrdersSales_Order: TIntegerField;
    qrySOrdersDate_Raised: TDateTimeField;
    qrySOrdersDate_Required: TDateTimeField;
    qrySOrdersCustomer: TIntegerField;
    qrySOrdersReference: TWideStringField;
    qrySOrdersExtra_Notes: TIntegerField;
    qrySOrdersOperator: TIntegerField;
    qrySOrdersContact_name: TWideStringField;
    qrySOrdersOrder_ref_no: TWideStringField;
    qrySOrdersSales_Order_Status: TIntegerField;
    qrySOrdersDeposit_amount: TFloatField;
    qrySOrdersDeposit_Terms: TFloatField;
    qrySOrdersGoods_Value: TFloatField;
    qrySOrdersVAT_Value: TFloatField;
    qrySOrdersRep: TIntegerField;
    qrySOrdersInstall_Address: TIntegerField;
    qrySOrdersInactive: TWideStringField;
    qrySOrdersCustomer_Name: TWideStringField;
    qrySOrdersInactive_Reason: TIntegerField;
    qrySOrdersAddress: TIntegerField;
    qrySOrdersTemplate_Date: TDateTimeField;
    qrySOrdersDate_Type: TWideStringField;
    qrySOrdersMaterials_Required: TWideStringField;
    qrySOrdersMaterials_Reqd_Date: TDateTimeField;
    qrySOrdersMaterials_Recd_Date: TDateTimeField;
    qrySOrdersInstall_Name: TWideStringField;
    qrySOrdersInstall_Phone: TWideStringField;
    qrySOrdersOn_Hold: TWideStringField;
    qrySOrdersEmail_Address: TWideStringField;
    qrySOrdersAccount_Manager: TIntegerField;
    qrySOrdersDescriptive_Reference: TWideStringField;
    qrySOrdersTemplate_Duration: TIntegerField;
    qrySOrdersFitting_Duration: TIntegerField;
    qrySOrdersFitter: TIntegerField;
    qrySOrdersIs_In_Outlook: TWideStringField;
    qrySOrdersIsFittingInOutlook: TWideStringField;
    qrySOrdersIsTemplateInOutlook: TWideStringField;
    qrySOrdersTemplater: TIntegerField;
    qrySOrdersSupply_Only: TWideStringField;
    qrySOrdersProject_Reference: TWideStringField;
    qrySOrdersPaid_Status: TWideStringField;
    qrySOrdersContact_no: TIntegerField;
    qrySOrdersAppliance_Details: TWideStringField;
    qrySOrdersLocation_Plan_Document: TWideStringField;
    qrySOrdersSSMA_TimeStamp: TBytesField;
    qrySOrdersCollection_Only: TWideStringField;
    qrySOrdersInstallation_Address: TIntegerField;
    qrySOrdersTemplate_Docs_Returned: TWideStringField;
    qrySOrdersFitting_Docs_Returned: TWideStringField;
    qrySOrdersRevenue_Centre: TIntegerField;
    qrySOrdersRemedial_Production: TWideStringField;
    qrySOrdersRemedial_No_Production: TWideStringField;
    qrySOrdersSales_Order_Number: TFloatField;
    qrySOrdersOriginal_Sales_Order: TIntegerField;
    qrySOrdersRemedial_ID: TIntegerField;
    qrySOrdersInv_Customer: TIntegerField;
    qrySOrdersBranch_no: TIntegerField;
    qrySOrdersDo_not_invoice: TWideStringField;
    qrySOrdersoriginal_customer_name: TWideStringField;
    qrySOrdersOperator_name: TWideStringField;
    qrySOrdersTotal_Value: TFloatField;
    qrySOrderssales_order_status_desc: TWideStringField;
    qryJobsJob: TFloatField;
    qryJobsJob_Status: TIntegerField;
    qryJobsQuote: TIntegerField;
    qryJobsCustomer: TIntegerField;
    qryJobsContact_name: TWideStringField;
    qryJobsOrder_ref_no: TWideStringField;
    qryJobsDate_Raised: TDateTimeField;
    qryJobsDate_Required: TDateTimeField;
    qryJobsPayment_due: TDateTimeField;
    qryJobsProduction_date: TDateTimeField;
    qryJobsTemplate_date: TDateTimeField;
    qryJobsInstallation_date: TDateTimeField;
    qryJobsDeposit_amount: TCurrencyField;
    qryJobsDelivery_Price: TCurrencyField;
    qryJobsInstallation_price: TCurrencyField;
    qryJobsSurvey_price: TCurrencyField;
    qryJobsOperator: TIntegerField;
    qryJobsProduction_date_Actual: TDateTimeField;
    qryJobsTemplate_date_actual: TDateTimeField;
    qryJobsInstallation_date_actual: TDateTimeField;
    qryJobsDescription: TWideStringField;
    qryJobsMaterial_Type: TIntegerField;
    qryJobsExtra_Notes: TIntegerField;
    qryJobsAvailability: TIntegerField;
    qryJobsPayment_Terms: TIntegerField;
    qryJobsReference: TWideStringField;
    qryJobsNett_Price: TCurrencyField;
    qryJobsInactive: TWideStringField;
    qryJobsInactive_Reason: TIntegerField;
    qryJobsAddress: TIntegerField;
    qryJobsDiscount_Rate: TFloatField;
    qryJobsDiscount_Value: TCurrencyField;
    qryJobsCustomer_Name: TWideStringField;
    qryJobsInstall_Address: TIntegerField;
    qryJobsDeposit_Terms: TFloatField;
    qryJobsVAT: TIntegerField;
    qryJobsQuote_Nett_Price: TCurrencyField;
    qryJobsFitter: TIntegerField;
    qryJobsInstall_Name: TWideStringField;
    qryJobsInstall_Phone: TWideStringField;
    qryJobsDesigner: TIntegerField;
    qryJobsBranch_no: TIntegerField;
    qryJobsRisk_Notes: TIntegerField;
    qryJobsDescriptive_Reference: TWideStringField;
    qryJobsMarkup_Rate: TFloatField;
    qryJobsMarkup_Value: TFloatField;
    qryJobsContract_Quote: TWideStringField;
    qryJobsWaste_Percentage: TFloatField;
    qryJobsWaste_Value: TFloatField;
    qryJobsProject_Reference: TWideStringField;
    qryJobsSpecification: TIntegerField;
    qryJobsRisk_Assessment: TIntegerField;
    qryJobsMaterial_Description: TWideStringField;
    qryJobsStatus_Description: TWideStringField;
    qryJobsOperator_Name: TWideStringField;
    qryJobsIs_retail_customer: TWideStringField;
    qryJobsGross_Price: TCurrencyField;
    qryJobsSales_Order: TIntegerField;
    qryInvoicesInvoice_Date: TDateTimeField;
    qryInvoicesCustomer: TIntegerField;
    qryInvoicesInactive: TWideStringField;
    qryInvoicesInvoice_or_Credit: TWideStringField;
    qryInvoicesOriginal_Name: TWideStringField;
    qryInvoicesStatus_Description: TWideStringField;
    qryInvoicesGoods_Value: TCurrencyField;
    qryInvoicesVat_Value: TCurrencyField;
    qryInvoicesTotal_Value: TCurrencyField;
    qryInvoicesInvoice_no: TWideStringField;
    qryInvoicesSales_invoice_status: TIntegerField;
    qryInvoicesSales_Invoice: TIntegerField;
    qryInvoicesReference: TWideStringField;
    qryInvoicesDescription: TWideStringField;
    qryInvoicesCustomer_Name: TWideStringField;
  private
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
  Result := 0;
end;

procedure TdtmdlCustomers.refreshData;
begin
  //
end;

function TdtmdlCustomers.GetContactCount: integer;
begin
  Result := 0;
end;

end.
