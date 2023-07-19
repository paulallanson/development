unit WTMaintParams;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, ComCtrls, Buttons, DB,
  Spin, CRControls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintParams = class(TForm)
    pcDetails: TPageControl;
    tsGeneral: TTabSheet;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    tsCharges: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    TabSheet4: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    memAvail: TMemo;
    memTerms: TMemo;
    TabSheet5: TTabSheet;
    Label10: TLabel;
    Label22: TLabel;
    srcParams: TDataSource;
    qryUpParams: TFDQuery;
    lkpThickness: TFDQuery;
    srclkpThickness: TDataSource;
    Label8: TLabel;
    Label7: TLabel;
    Label25: TLabel;
    dblkpAccountsPackage: TDBLookupComboBox;
    qryAccounts: TFDQuery;
    dtsAccounts: TDataSource;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    TabSheet2: TTabSheet;
    Label30: TLabel;
    chkbxTradeDetails: TCheckBox;
    Label31: TLabel;
    Button2: TButton;
    Label32: TLabel;
    Button1: TButton;
    Label33: TLabel;
    Label34: TLabel;
    Button3: TButton;
    Label35: TLabel;
    memPayment: TMemo;
    Label36: TLabel;
    Label40: TLabel;
    dblkpDefaultVat: TDBLookupComboBox;
    qryVat: TFDQuery;
    dtsVat: TDataSource;
    Label9: TLabel;
    dblkpUpstand: TDBLookupComboBox;
    grpbxCosting: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    chkbxUseCosting: TCheckBox;
    Label20: TLabel;
    chkbxPricesAreTrade: TCheckBox;
    Label3: TLabel;
    Label6: TLabel;
    Label41: TLabel;
    Button4: TButton;
    Label42: TLabel;
    memRetailPayment: TMemo;
    qryVatVat_Rate: TFloatField;
    qryVatVat: TIntegerField;
    Label43: TLabel;
    TabSheet1: TTabSheet;
    Label44: TLabel;
    Button5: TButton;
    Label45: TLabel;
    Button6: TButton;
    opndlgTerms: TOpenDialog;
    Label46: TLabel;
    Button7: TButton;
    TabSheet6: TTabSheet;
    Panel1: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label52: TLabel;
    memRetailTerms: TMemo;
    qryScheduling: TFDQuery;
    dtsScheduling: TDataSource;
    Label54: TLabel;
    Button8: TButton;
    Label55: TLabel;
    memConfirm: TMemo;
    Label56: TLabel;
    TabSheet7: TTabSheet;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    dblkpOperator: TDBLookupComboBox;
    dblkpAccountManager: TDBLookupComboBox;
    dblkpSalesLeadSource: TDBLookupComboBox;
    btnSalesLead: TBitBtn;
    qryOperator: TFDQuery;
    dtsOperator: TDataSource;
    qryAccountManager: TFDQuery;
    dtsAccountManager: TDataSource;
    qrySalesSource: TFDQuery;
    dtsSalesSource: TDataSource;
    Label61: TLabel;
    Button9: TButton;
    SpeedButton4: TSpeedButton;
    Label62: TLabel;
    spnQuoteValidDays: TSpinEdit;
    Label63: TLabel;
    chkbxBalanceRequired: TCheckBox;
    Label64: TLabel;
    memFactoredPayment: TMemo;
    Label67: TLabel;
    DBMemo1: TDBMemo;
    Label68: TLabel;
    Button10: TButton;
    chkbxMandatoryDates: TCheckBox;
    chkbxUseOnstop: TCheckBox;
    Label70: TLabel;
    GroupBox1: TGroupBox;
    chkbxUseContractQuoting: TCheckBox;
    chkbxContractQuoteBySlab: TCheckBox;
    chkbxUsePurchaseOrdering: TCheckBox;
    PageControl1: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    Label49: TLabel;
    memEmailInvoice: TMemo;
    Label47: TLabel;
    memEmailQuote: TMemo;
    Label60: TLabel;
    memEmailRetailQuote: TMemo;
    Label48: TLabel;
    memEmailSalesConfirm: TMemo;
    Label69: TLabel;
    memEmailRetailSalesConfirm: TMemo;
    Label66: TLabel;
    btnEmailHelp: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label71: TLabel;
    Label72: TLabel;
    memEmailSalesFittingConfirm: TMemo;
    Label74: TLabel;
    spnQuoteFollowUpDays: TSpinEdit;
    Label75: TLabel;
    qryCompany: TFDQuery;
    qryUpCompany: TFDQuery;
    edtStreet: TEdit;
    edtLocale: TEdit;
    edtTownCity: TEdit;
    edtPostcode: TEdit;
    edtCountyState: TEdit;
    edtTelephoneNumber: TEdit;
    edtFaxNumber: TEdit;
    edtWebAddress: TEdit;
    edtEmailAddress: TEdit;
    edtVatNumber: TEdit;
    edtUniqueTaxReference: TEdit;
    edtInstallRate: TCREditMoney;
    edtSurveyRate: TCREditMoney;
    edtDeliveryRate: TCREditMoney;
    edtDiscountRate: TCREditFloat;
    edtUpstandPolishPrice: TCREditMoney;
    edtDepositTerms: TCREditFloat;
    edtUpstandPolishCost: TCREditMoney;
    edtQuotePrefix: TEdit;
    edtJobPrefix: TEdit;
    edtDefaultSalesNominal: TEdit;
    edtDefaultPurchaseNominal: TEdit;
    edtDataExportDirectory: TEdit;
    edtLastFileNoInv: TCREditInt;
    dblkpNominalLevel: TComboBox;
    edtWebsiteImageDirectory: TEdit;
    edtSalesEmail: TEdit;
    edtProductionEmail: TEdit;
    edtCustomerDocumentDirectory: TEdit;
    edtSupplierDocumentDirectory: TEdit;
    edtQuoteDocumentDirectory: TEdit;
    edtSalesDocumentDirectory: TEdit;
    edtJobDocumentDirectory: TEdit;
    edtContractDocumentDirectory: TEdit;
    edtDefaultMileageRate: TCREditMoney;
    edtDefaultLabourRate: TCREditMoney;
    edtDefaultHandlingRate: TCREditMoney;
    edtWasteCostMultiplier: TCREditInt;
    edtTemplateConditionsFile: TEdit;
    edtSalesOrderTermsFile: TEdit;
    edtSalesAvailabilityFile: TEdit;
    edtCompanyName: TEdit;
    Label76: TLabel;
    dblkpCustSalesLeadSource: TDBLookupComboBox;
    qryCustSalesSource: TFDQuery;
    dtsCustSalesSource: TDataSource;
    SpeedButton2: TSpeedButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Label77: TLabel;
    edtDrawingFolderName: TEdit;
    Label4: TLabel;
    qryInactiveReason: TFDQuery;
    dtsInactiveReason: TDataSource;
    dblkpInactiveContract: TDBLookupComboBox;
    memEmailPurchaseOrder: TRichEdit;
    chkbxUseRevenueCentres: TCheckBox;
    qryGetProduct: TFDQuery;
    Label19: TLabel;
    edtTemplateDocsOut: TEdit;
    Label21: TLabel;
    edtTemplateDocsIn: TEdit;
    Label50: TLabel;
    edtFittingDocsOut: TEdit;
    Label51: TLabel;
    edtFittingDocsIn: TEdit;
    GroupBox2: TGroupBox;
    Label53: TLabel;
    dblkpSchedulePackage: TDBLookupComboBox;
    DirectClrBitBtn: TBitBtn;
    BitBtn1: TBitBtn;
    edtSharedFolder: TEdit;
    Label73: TLabel;
    chkbxUseDocumentTransfer: TCheckBox;
    grpbxDocumentTransfer: TGroupBox;
    Label65: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    edtQuotationDocumentFolder: TEdit;
    edtSafetyDocumentFolder: TEdit;
    edtRemedialDocumentFolder: TEdit;
    grpbxRemedials: TGroupBox;
    Label5: TLabel;
    edtRemedialProduct: TEdit;
    btnLUProducts: TButton;
    btnClearProduct: TSpeedButton;
    chkbxUseRemedialsAsOrders: TCheckBox;
    procedure EnableOK(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure chkbxUseCostingClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure btnEmailHelpClick(Sender: TObject);
    procedure DirectClrBitBtnClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure btnSalesLeadClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure chkbxUseContractQuotingClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure btnLUProductsClick(Sender: TObject);
    procedure btnClearProductClick(Sender: TObject);
    procedure chkbxUseDocumentTransferClick(Sender: TObject);
    procedure chkbxUseRemedialsAsOrdersClick(Sender: TObject);
  private
    iProduct: integer;
    iTerms, iRetailTerms, iAvailability, iPayments, iRetailPayments, iFactoredPayments, iConfirmation: integer;
    iRetailQuoteEmail, iQuoteEmail, iInvoiceEmail, iSalesConfirmEmail, iRetailSalesConfirmEmail, iPurchaseOrderEmail, iSalesFittingConfirmEmail: integer;
    function GetCompNotes(TempNotes: integer): string;
    procedure SaveNotes;
    function UpdateAvailability: Integer;
    function UpdateTerms: Integer;
    function UpdatePayments: Integer;
    function UpdateRetailPayments: Integer;
    function UpdateRetailTerms: Integer;
    function UpdateQuotationEmail: Integer;
    function UpdateInvoiceEmail: Integer;
    function UpdateSalesConfirmEmail: Integer;
    function UpdateSalesFittingConfirmEmail: Integer;
    function UpdateConfirmation: Integer;
    function UpdateRetailQuotationEmail: Integer;
    function UpdateFactoredPayments: Integer;
    function UpdatePurchaseOrderEmail: Integer;
    function UpdateRetailSalesConfirmEmail: Integer;
    procedure SaveToDB;
    procedure CallMaintScreen(Module: integer);
    function GetProductCode(iCode: integer): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTMaintParams: TfrmWTMaintParams;

implementation

uses wtNotesDM, AllCommon, WTParamsHelp, wtLUSalesLead,
  WTMaintCompanyDocStructure, wtLUProducts;

{$R *.DFM}

procedure TfrmWTMaintParams.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWTMaintParams.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintParams.FormCreate(Sender: TObject);
begin
  iTerms := 0;
  iRetailTerms := 0;
  iAvailability := 0;
  iConfirmation := 0;
  iRetailQuoteEmail := 0;
  iQuoteEmail := 0;
  iInvoiceEmail := 0;
  iSalesConfirmEmail := 0;
  iRetailSalesConfirmEmail := 0;
  iSalesFittingConfirmEmail := 0;
  iProduct := 0;

  dtmdlNotes := TdtmdlNotes.create(self);
  lkpThickness.Active := true;
//  tblParams.Active := true;

  qryCompany.active := false;
  qryCompany.active := true;

  qryAccounts.Active := false;
  qryAccounts.Active := true;

  qryVat.Active := false;
  qryVat.Active := true;

  qryInactiveReason.Active := false;
  qryInactiveReason.Active := true;

  qryScheduling.Active := false;
  qryScheduling.Active := true;

  qryOperator.Active := false;
  qryOperator.parambyname('Operator').asinteger := qryCompany.fieldbyname('Operator').asinteger;
  qryOperator.Active := true;

  qryAccountManager.Active := false;
  qryAccountManager.parambyname('Operator').asinteger := qryCompany.fieldbyname('Account_Manager').asinteger;
  qryAccountManager.Active := true;

  qrySalesSource.Active := false;
  qrySalesSource.parambyname('Sales_Lead_Source').asinteger := qryCompany.fieldbyname('Sales_Lead_Source').asinteger;
  qrySalesSource.Active := true;

  qryCustSalesSource.Active := false;
  qryCustSalesSource.parambyname('Sales_Lead_Source').asinteger := qryCompany.fieldbyname('Customer_Sales_Lead_Source').asinteger;
  qryCustSalesSource.Active := true;

  pcDetails.ActivePage := tsGeneral;
end;

procedure TfrmWTMaintParams.FormDestroy(Sender: TObject);
begin
  lkpThickness.Active := false;
//  tblParams.Active := false;
  dtmdlNotes.free;
end;

procedure TfrmWTMaintParams.FormActivate(Sender: TObject);
begin
  with qryCompany do
    begin
      edtCompanyName.Text := fieldbyname('Company_Name').asstring;

      edtStreet.Text := fieldbyname('Street').asstring;
      edtLocale.Text := fieldbyname('Locale').asstring;
      edtTownCity.Text := fieldbyname('Town_City').asstring;
      edtPostcode.Text := fieldbyname('Postcode').asstring;
      edtCountyState.Text := fieldbyname('County_State').asstring;
      edtTelephoneNumber.Text := fieldbyname('Telephone_Number').asstring;
      edtFaxNumber.Text := fieldbyname('Fax_Number').asstring;
      edtWebAddress.Text := fieldbyname('Web_Address').asstring;
      edtemailAddress.Text := fieldbyname('Email_Address').asstring;
      edtVatNumber.Text := fieldbyname('Vat_Number').asstring;
      edtUniqueTaxReference.Text := fieldbyname('Unique_Tax_Reference').asstring;

      edtInstallRate.Text := formatfloat('0.00',fieldbyname('Install_Rate').asfloat);
      edtSurveyRate.Text := formatfloat('0.00',fieldbyname('Survey_Rate').asfloat);
      edtDeliveryRate.Text := formatfloat('0.00',fieldbyname('Delivery_Rate').asfloat);
      edtDiscountRate.Text := formatfloat('0.00',fieldbyname('Discount_Rate').asfloat);
      edtDepositTerms.Text := formatfloat('0.00',fieldbyname('Deposit_Terms').asfloat);
      dblkpUpstand.KeyValue := fieldbyname('Underslip_Thickness').asinteger;
      edtUpstandPolishPrice.Text := formatfloat('0.00',fieldbyname('Upstand_Polish_Price').asfloat);
      edtUpstandPolishCost.Text := formatfloat('0.00',fieldbyname('Upstand_Polish_Cost').asfloat);
      edtQuotePrefix.Text := fieldbyname('Quote_Prefix').asstring;
      edtJobPrefix.Text := fieldbyname('Job_Prefix').asstring;

(*      edtLastQuoteNumber.text := inttostr(fieldbyname('Last_Quote_Number').asinteger);
      edtLastContractQuoteNumber.text := inttostr(fieldbyname('Last_Contract_Quote_Number').asinteger);
      edtLastJobNumber.text := inttostr(fieldbyname('Last_Job_Number').asinteger);
      edtLastSalesOrderNumber.text := inttostr(fieldbyname('Last_Sales_Order_Number').asinteger);
      edtLastPurchaseOrderNumber.text := inttostr(fieldbyname('Last_Purchase_Order_Number').asinteger);
      edtLastInvoiceNumber.text := inttostr(fieldbyname('Last_Invoice_Number').asinteger);
      edtLastCreditNoteNumber.text := inttostr(fieldbyname('Last_Credit_Note_Number').asinteger);
*)

      dblkpInactiveContract.KeyValue := fieldbyname('Contract_Inactive_Reason').asinteger;
      dblkpDefaultVat.KeyValue := fieldbyname('Default_Vat').asinteger;
      dblkpNominalLevel.text := fieldbyname('Nominal_Level').asstring;
      edtDefaultSalesNominal.text := fieldbyname('Default_Sales_Nominal').asstring;
      edtDefaultPurchaseNominal.text := fieldbyname('Default_Purchase_Nominal').asstring;
      dblkpAccountsPackage.KeyValue := fieldbyname('Accounts_Package').asstring;
      edtDataExportDirectory.text := fieldbyname('Data_Export_Directory').asstring;
      edtLastFileNoInv.text := inttostr(fieldbyname('Last_File_No_Inv').asinteger);

      dblkpOperator.KeyValue := fieldbyname('Operator').asinteger;
      dblkpAccountManager.KeyValue := fieldbyname('Account_Manager').asinteger;
      dblkpSalesLeadSource.KeyValue := fieldbyname('Sales_Lead_Source').asinteger;
      dblkpCustSalesLeadSource.KeyValue := fieldbyname('Customer_Sales_Lead_Source').asinteger;
      edtWebsiteImageDirectory.text := fieldbyname('Website_Image_Directory').asstring;

      edtTemplateDocsOut.text := fieldbyname('Template_Docs_Out').asstring;
      edtTemplateDocsIn.text := fieldbyname('Template_Docs_In').asstring;
      edtFittingDocsOut.text := fieldbyname('Fitting_Docs_Out').asstring;
      edtFittingDocsIn.text := fieldbyname('Fitting_Docs_In').asstring;

      edtSalesEmail.Text := fieldbyname('Sales_Email').asstring;
      edtProductionEmail.Text := fieldbyname('Production_Email').asstring;
      edtCustomerDocumentDirectory.Text := fieldbyname('Customer_Document_Directory').asstring;
      edtSupplierDocumentDirectory.Text := fieldbyname('Supplier_Document_Directory').asstring;
      edtQuoteDocumentDirectory.Text := fieldbyname('Quote_Document_Directory').asstring;
      edtSalesDocumentDirectory.Text := fieldbyname('Sales_Document_Directory').asstring;
      edtJobDocumentDirectory.Text := fieldbyname('Job_Document_Directory').asstring;
      edtContractDocumentDirectory.Text := fieldbyname('Contract_Document_Directory').asstring;
      edtDefaultMileageRate.Text := formatfloat('0.00',fieldbyname('Default_Mileage_Rate').asfloat);
      edtDefaultLabourRate.Text := formatfloat('0.00',fieldbyname('Default_Labour_Rate').asfloat);
      edtDefaultHandlingRate.Text := formatfloat('0.00',fieldbyname('Default_Handling_Rate').asfloat);
      edtWasteCostMultiplier.Text := formatfloat('0.00',fieldbyname('Waste_Cost_Multiplier').asfloat);
      dblkpSchedulePackage.keyvalue := fieldbyname('Schedule_Package').asstring;
      edtSharedFolder.Text := fieldbyname('Shared_Folder').asstring;

      edtDrawingFolderName.Text := fieldbyname('Contract_Drawing_Folder_Name').asstring;
      edtTemplateConditionsFile.Text := fieldbyname('Template_Conditions_File').asstring;
      edtSalesOrderTermsFile.Text := fieldbyname('Sales_Order_Terms_File').asstring;
      edtSalesAvailabilityFile.Text := fieldbyname('Sales_Availability_File').asstring;

      chkbxUseRevenueCentres.Checked := (qryCompany.fieldbyname('Use_Revenue_Centres').asstring = 'Y');
      chkbxUsePurchaseOrdering.Checked := (qryCompany.fieldbyname('Use_Purchase_Ordering').asstring = 'Y');
      chkbxUseContractQuoting.Checked := (qryCompany.fieldbyname('Use_Contract_Quoting').asstring = 'Y');
      chkbxContractQuoteBySlab.checked := (qryCompany.fieldbyname('Contract_Quote_By_Slab').asstring = 'Y');
      chkbxPricesAreTrade.Checked := (qryCompany.fieldbyname('Prices_Are_Trade').asstring = 'Y');
      chkbxBalanceRequired.Checked := (qryCompany.fieldbyname('Balance_Required_Before_Fit').asstring = 'Y');
      chkbxUseOnstop.Checked := (qryCompany.fieldbyname('Use_Onstop').asstring = 'Y');
      chkbxMandatoryDates.Checked := (qryCompany.fieldbyname('Mandatory_Temp_Fit_Dates').asstring = 'Y');
      chkbxTradeDetails.Checked := (qryCompany.fieldbyname('Use_Trade_Layout').asstring = 'Y');
      chkbxUseCosting.Checked := (qryCompany.fieldbyname('Use_Costing_System').asstring = 'Y');
      spnQuoteValidDays.Value := qryCompany.fieldbyname('Default_Quote_Valid_days').asinteger;
      spnQuoteFollowUpDays.Value := qryCompany.fieldbyname('Default_Quote_Follow_Up_days').asinteger;

      chkbxUseRemedialsAsOrders.Checked := (qryCompany.fieldbyname('Use_Remedials_As_Orders').asstring = 'Y');
      chkbxUseRemedialsAsOrdersClick(Self);
      
      chkbxUseDocumentTransfer.Checked := (qryCompany.fieldbyname('Use_Document_Transfer').asstring = 'Y');
      edtQuotationDocumentFolder.Text := fieldbyname('Quotation_Document_Folder').asstring;
      edtSafetyDocumentFolder.Text := fieldbyname('Safety_Document_Folder').asstring;
      edtRemedialDocumentFolder.Text := fieldbyname('Remedial_Document_Folder').asstring;

      iProduct := qryCompany.fieldbyname('Def_Remedial_Product_Code').asinteger;
      edtRemedialProduct.Text := GetProductCode(iProduct);

      grpbxDocumentTransfer.enabled := chkbxUseDocumentTransfer.Checked;
    end;
end;

function TfrmWTMaintParams.GetProductCode(iCode: integer): string;
begin
  with qryGetProduct do
    begin
      close;
      parambyname('Product').asinteger := iCode;
      open;

      result := fieldbyname('Product_Code').asstring;
    end;
end;

function TfrmWTMaintParams.GetCompNotes(TempNotes: integer): string;
var
  Notes: TNotes;
begin
  Result := '';
  if TempNotes = 0 then exit;
  Notes := TNotes.create;
  try
    Notes.DbKey := TempNotes;
    Notes.LoadfromDb;
    Result := Notes.Data;
  finally
    Notes.free;
  end;
end;

procedure TfrmWTMaintParams.SaveNotes;
begin
  with qryUpParams do
    begin
      close;
      parambyname('Terms').asinteger := UpdateTerms;
      parambyname('Retail_Payment_Terms').asinteger := UpdateRetailTerms;
      parambyname('Availability').asinteger := UpdateAvailability;
      parambyname('Order_Confirmation_Notes').asinteger := UpdateConfirmation;
      parambyname('Invoice_Payment_Notes').asinteger := UpdatePayments;
      parambyname('Retail_Payment_Notes').asinteger := UpdateRetailPayments;
      parambyname('Factored_Payment_Notes').asinteger := UpdateFactoredPayments;
      parambyname('Email_Quotation_Notes').asinteger := UpdateQuotationEmail;
      parambyname('Email_Retail_Quote_Notes').asinteger := UpdateRetailQuotationEmail;
      parambyname('Email_Sales_Confirm_Notes').asinteger := UpdateSalesConfirmEmail;
      parambyname('Email_Fitting_Confirm_Notes').asinteger := UpdateSalesFittingConfirmEmail;
      parambyname('Email_Retail_SO_Confirm_Notes').asinteger := UpdateRetailSalesConfirmEmail;
      parambyname('Email_Invoice_Notes').asinteger := UpdateInvoiceEmail;
      parambyname('Email_Purchase_Order_Notes').asinteger := UpdatePurchaseOrderEmail;
      execsql;
    end;
end;

procedure TfrmWTMaintParams.SaveToDB;
begin
  with qryUpCompany do
    begin
      close;
      parambyname('Company_Name').asstring := edtCompanyName.Text;

      parambyname('Street').asstring := edtStreet.Text;
      parambyname('Locale').asstring := edtLocale.Text;
      parambyname('Town_City').asstring := edtTownCity.Text;
      parambyname('Postcode').asstring := edtPostcode.Text;
      parambyname('County_State').asstring := edtCountyState.Text;
      parambyname('Telephone_Number').asstring := edtTelephoneNumber.Text;
      parambyname('Fax_Number').asstring := edtFaxNumber.Text;
      parambyname('Web_Address').asstring := edtWebAddress.Text;
      parambyname('Email_Address').asstring := edtemailAddress.Text;
      parambyname('Vat_Number').asstring := edtVatNumber.Text;
      parambyname('Unique_Tax_Reference').asstring := edtUniqueTaxReference.Text;

      parambyname('Install_Rate').asfloat := strtofloat(edtInstallRate.Text);
      parambyname('Survey_Rate').asfloat := strtofloat(edtSurveyRate.Text);
      parambyname('Delivery_Rate').asfloat := strtofloat(edtDeliveryRate.Text);
      parambyname('Discount_Rate').asfloat := strtofloat(edtDiscountRate.Text);
      parambyname('Deposit_Terms').asfloat := strtofloat(edtDepositTerms.Text);
      if dblkpUpstand.keyvalue = 0 then
        parambyname('Underslip_Thickness').clear
      else
        parambyname('Underslip_Thickness').asinteger := dblkpUpstand.KeyValue;

      parambyname('Upstand_Polish_Price').asfloat := strtofloat(edtUpstandPolishPrice.Text);
      parambyname('Upstand_Polish_Cost').asfloat := strtofloat(edtUpstandPolishCost.Text);
      parambyname('Quote_Prefix').asstring := edtQuotePrefix.Text;
      parambyname('Job_Prefix').asstring := edtJobPrefix.Text;

(*      parambyname('Last_Quote_Number').asinteger := strtoint(edtLastQuoteNumber.text);
      parambyname('Last_Contract_Quote_Number').asinteger := strtoint(edtLastContractQuoteNumber.text);
      parambyname('Last_Job_Number').asinteger := strtoint(edtLastJobNumber.text);
      parambyname('Last_Sales_Order_Number').asinteger := strtoint(edtLastSalesOrderNumber.text);
      parambyname('Last_Purchase_Order_Number').asinteger := strtoint(edtLastPurchaseOrderNumber.text);
      parambyname('Last_Invoice_Number').asinteger := strtoint(edtLastInvoiceNumber.text);
      parambyname('Last_Credit_Note_Number').asinteger := strtoint(edtLastCreditNoteNumber.text);
*)

      if dblkpInactiveContract.KeyValue = 0 then
        parambyname('Contract_Inactive_Reason').clear
      else
        parambyname('Contract_Inactive_Reason').asinteger := dblkpInactiveContract.KeyValue;
        
      parambyname('Default_Vat').asinteger := dblkpDefaultVat.KeyValue;
      parambyname('Nominal_Level').asstring := dblkpNominalLevel.text;
      parambyname('Default_Sales_Nominal').asstring := edtDefaultSalesNominal.text;
      parambyname('Default_Purchase_Nominal').asstring := edtDefaultPurchaseNominal.text;
      parambyname('Accounts_Package').asstring := dblkpAccountsPackage.KeyValue;
      parambyname('Data_Export_Directory').asstring := edtDataExportDirectory.text;
      parambyname('Last_File_No_Inv').asinteger := strtoint(edtLastFileNoInv.text);

      parambyname('Sales_Email').asstring := edtSalesEmail.Text;
      parambyname('Production_Email').asstring := edtProductionEmail.Text;
      parambyname('Customer_Document_Directory').asstring := edtCustomerDocumentDirectory.Text;
      parambyname('Supplier_Document_Directory').asstring := edtSupplierDocumentDirectory.Text;
      parambyname('Quote_Document_Directory').asstring := edtQuoteDocumentDirectory.Text;
      parambyname('Sales_Document_Directory').asstring := edtSalesDocumentDirectory.Text;
      parambyname('Job_Document_Directory').asstring := edtJobDocumentDirectory.Text;
      parambyname('Contract_Document_Directory').asstring := edtContractDocumentDirectory.Text;
      parambyname('Default_Mileage_Rate').asfloat := strtofloat(edtDefaultMileageRate.Text);
      parambyname('Default_Labour_Rate').asfloat := strtofloat(edtDefaultLabourRate.Text);
      parambyname('Default_Handling_Rate').asfloat := strtofloat(edtDefaultHandlingRate.Text);
      parambyname('Waste_Cost_Multiplier').asfloat := strtofloat(edtWasteCostMultiplier.Text);
      if dblkpSchedulePackage.keyvalue = '' then
        parambyname('Schedule_Package').clear
      else
        parambyname('Schedule_Package').asstring := dblkpSchedulePackage.keyvalue;
      parambyname('Shared_Folder').asstring := edtSharedFolder.Text;

      parambyname('Contract_Drawing_Folder_Name').asstring := edtDrawingFolderName.Text;
      parambyname('Template_Conditions_File').asstring := edtTemplateConditionsFile.Text;
      parambyname('Sales_Order_Terms_File').asstring := edtSalesOrderTermsFile.Text;
      parambyname('Sales_Availability_File').asstring := edtSalesAvailabilityFile.Text;

      if dblkpOperator.KeyValue = 0 then
        parambyname('Operator').clear
      else
        parambyname('Operator').asinteger := dblkpOperator.KeyValue;

      if dblkpAccountManager.KeyValue = 0 then
        parambyname('Account_Manager').clear
      else
        parambyname('Account_Manager').asinteger := dblkpAccountManager.KeyValue;

      if dblkpSalesLeadSource.KeyValue = 0 then
        parambyname('Sales_Lead_Source').clear
      else
        parambyname('Sales_Lead_Source').asinteger := dblkpSalesLeadSource.KeyValue;

      if dblkpCustSalesLeadSource.KeyValue = 0 then
        parambyname('Customer_Sales_Lead_Source').clear
      else
        parambyname('Customer_Sales_Lead_Source').asinteger := dblkpCustSalesLeadSource.KeyValue;

      parambyname('Website_Image_Directory').asstring := edtWebsiteImageDirectory.text;

      parambyname('Template_Docs_Out').asstring := edtTemplateDocsOut.text;
      parambyname('Template_Docs_In').asstring := edtTemplateDocsIn.text;
      parambyname('Fitting_Docs_Out').asstring := edtFittingDocsOut.text;
      parambyname('Fitting_Docs_In').asstring := edtFittingDocsIn.text;

      {Save all the Terms and Availability and Email notes}
      parambyname('Terms').asinteger := UpdateTerms;
      parambyname('Retail_Payment_Terms').asinteger := UpdateRetailTerms;
      parambyname('Availability').asinteger := UpdateAvailability;
      parambyname('Order_Confirmation_Notes').asinteger := UpdateConfirmation;
      parambyname('Invoice_Payment_Notes').asinteger := UpdatePayments;
      parambyname('Retail_Payment_Notes').asinteger := UpdateRetailPayments;
      parambyname('Factored_Payment_Notes').asinteger := UpdateFactoredPayments;
      parambyname('Email_Quotation_Notes').asinteger := UpdateQuotationEmail;
      parambyname('Email_Retail_Quote_Notes').asinteger := UpdateRetailQuotationEmail;
      parambyname('Email_Sales_Confirm_Notes').asinteger := UpdateSalesConfirmEmail;
      parambyname('Email_Fitting_Confirm_Notes').asinteger := UpdateSalesFittingConfirmEmail;
      parambyname('Email_Retail_SO_Confirm_Notes').asinteger := UpdateRetailSalesConfirmEmail;
      parambyname('Email_Invoice_Notes').asinteger := UpdateInvoiceEmail;
      parambyname('Email_Purchase_Order_Notes').asinteger := UpdatePurchaseOrderEmail;

      if chkbxUseRevenueCentres.Checked then
        ParamByName('Use_Revenue_Centres').asstring := 'Y'
      else
        ParamByName('Use_Revenue_Centres').asstring := 'N';

      if chkbxUsePurchaseOrdering.Checked then
        ParamByName('Use_Purchase_Ordering').asstring := 'Y'
      else
        ParamByName('Use_Purchase_Ordering').asstring := 'N';

      if chkbxUseContractQuoting.Checked then
        ParamByName('Use_Contract_Quoting').asstring := 'Y'
      else
        ParamByName('Use_Contract_Quoting').asstring := 'N';

      if chkbxContractQuoteBySlab.Checked then
        ParamByName('Contract_Quote_By_Slab').asstring := 'Y'
      else
        ParamByName('Contract_Quote_By_Slab').asstring := 'N';

      if chkbxPricesAreTrade.Checked then
        ParamByName('Prices_Are_Trade').asstring := 'Y'
      else
        ParamByName('Prices_Are_Trade').asstring := 'N';

      if chkbxBalanceRequired.Checked then
        ParamByName('Balance_Required_Before_Fit').asstring := 'Y'
      else
        ParamByName('Balance_Required_Before_Fit').asstring := 'N';

      if chkbxUseOnStop.Checked then
        ParamByName('Use_Onstop').asstring := 'Y'
      else
        ParamByName('Use_Onstop').asstring := 'N';

      if chkbxMandatoryDates.Checked then
        ParamByName('Mandatory_Temp_Fit_Dates').asstring := 'Y'
      else
        ParamByName('Mandatory_Temp_Fit_Dates').asstring := 'N';

      if chkbxTradeDetails.Checked then
        ParamByName('Use_Trade_Layout').asstring := 'Y'
      else
        ParamByName('Use_Trade_Layout').asstring := 'N';

      if chkbxUseCosting.Checked then
        ParamByName('Use_Costing_System').asstring := 'Y'
      else
        ParamByName('Use_Costing_System').asstring := 'N';

      if chkbxUseDocumentTransfer.Checked then
        ParamByName('Use_Document_Transfer').asstring := 'Y'
      else
        ParamByName('Use_Document_Transfer').asstring := 'N';

      if chkbxUseRemedialsAsOrders.Checked then
        ParamByName('Use_Remedials_As_Orders').asstring := 'Y'
      else
        ParamByName('Use_Remedials_As_Orders').asstring := 'N';

      parambyname('Quotation_Document_Folder').asstring := edtQuotationDocumentFolder.Text;
      parambyname('Safety_Document_Folder').asstring := edtSafetyDocumentFolder.Text;
      parambyname('Remedial_Document_Folder').asstring := edtRemedialDocumentFolder.Text;

      ParamByName('Default_Quote_Valid_days').asinteger := spnQuoteValidDays.Value;
      ParamByName('Default_Quote_Follow_Up_days').asinteger := spnQuoteFollowUpDays.Value;

      if iProduct = 0 then
        ParamByName('Def_Remedial_Product_Code').clear
      else
        ParamByName('Def_Remedial_Product_Code').asinteger := iProduct;

      execsql;
    end;
end;

function TfrmWTMaintParams.UpdatePayments: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iPayments;
    Notes.Data := memPayment.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateRetailPayments: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iRetailPayments;
    Notes.Data := memRetailPayment.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateFactoredPayments: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iFactoredPayments;
    Notes.Data := memFactoredPayment.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateTerms: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iTerms;
    Notes.Data := memTerms.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateRetailTerms: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iRetailTerms;
    Notes.Data := memRetailTerms.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateAvailability: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iAvailability;
    Notes.Data := memAvail.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateConfirmation: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iConfirmation;
    Notes.Data := memConfirm.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateQuotationEmail: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iQuoteEmail;
    Notes.Data := memEmailQuote.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateRetailQuotationEmail: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iRetailQuoteEmail;
    Notes.Data := memEmailRetailQuote.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateInvoiceEmail: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iInvoiceEmail;
    Notes.Data := memEmailInvoice.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateSalesFittingConfirmEmail: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iSalesFittingConfirmEmail;
    Notes.Data := memEmailSalesFittingConfirm.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateSalesConfirmEmail: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iSalesConfirmEmail;
    Notes.Data := memEmailSalesConfirm.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdateRetailSalesConfirmEmail: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iRetailSalesConfirmEmail;
    Notes.Data := memEmailRetailSalesConfirm.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintParams.UpdatePurchaseOrderEmail: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iPurchaseOrderEmail;
    Notes.Data := memEmailPurchaseOrder.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

procedure TfrmWTMaintParams.FormShow(Sender: TObject);
begin
  memTerms.text := GetCompNotes(qryCompany.fieldbyname('Payment_Terms').asinteger);
  memRetailTerms.text := GetCompNotes(qryCompany.fieldbyname('Retail_Payment_Terms').asinteger);
  memAvail.text := GetCompNotes(qryCompany.fieldbyname('Availability').asinteger);
  memPayment.text := GetCompNotes(qryCompany.fieldbyname('Invoice_Payment_Notes').asinteger);
  memRetailPayment.text := GetCompNotes(qryCompany.fieldbyname('Retail_Payment_Notes').asinteger);
  memFactoredPayment.text := GetCompNotes(qryCompany.fieldbyname('Factored_Payment_Notes').asinteger);
  memConfirm.text := GetCompNotes(qryCompany.fieldbyname('Order_Confirmation_Notes').asinteger);
  iTerms := qryCompany.Fieldbyname('Payment_Terms').Asinteger;
  iRetailTerms := qryCompany.Fieldbyname('Retail_Payment_Terms').Asinteger;
  iAvailability := qryCompany.Fieldbyname('Availability').Asinteger;
  iPayments := qryCompany.Fieldbyname('Invoice_Payment_Notes').Asinteger;
  iRetailPayments := qryCompany.Fieldbyname('Retail_Payment_Notes').Asinteger;
  iFactoredPayments := qryCompany.Fieldbyname('Factored_Payment_Notes').Asinteger;
  iConfirmation := qryCompany.Fieldbyname('Order_Confirmation_Notes').Asinteger;

  {Email details}
  memEmailRetailQuote.text := GetCompNotes(qryCompany.fieldbyname('Email_Retail_Quote_Notes').asinteger);
  memEmailQuote.text := GetCompNotes(qryCompany.fieldbyname('Email_Quotation_Notes').asinteger);
  memEmailInvoice.text := GetCompNotes(qryCompany.fieldbyname('Email_Invoice_Notes').asinteger);
  memEmailSalesConfirm.text := GetCompNotes(qryCompany.fieldbyname('Email_Sales_Confirm_Notes').asinteger);
  memEmailSalesFittingConfirm.text := GetCompNotes(qryCompany.fieldbyname('Email_Fitting_Confirm_Notes').asinteger);
  memEmailRetailSalesConfirm.text := GetCompNotes(qryCompany.fieldbyname('Email_Retail_SO_Confirm_Notes').asinteger);
  memEmailPurchaseOrder.text := GetCompNotes(qryCompany.fieldbyname('Email_Purchase_Order_Notes').asinteger);
  iRetailQuoteEmail := qryCompany.Fieldbyname('Email_Retail_Quote_Notes').Asinteger;
  iQuoteEmail := qryCompany.Fieldbyname('Email_Quotation_Notes').Asinteger;
  iInvoiceEmail := qryCompany.Fieldbyname('Email_Invoice_Notes').Asinteger;
  iSalesConfirmEmail := qryCompany.Fieldbyname('Email_Sales_Confirm_Notes').Asinteger;
  iSalesFittingConfirmEmail := qryCompany.Fieldbyname('Email_Fitting_Confirm_Notes').Asinteger;
  iRetailSalesConfirmEmail := qryCompany.Fieldbyname('Email_Retail_SO_Confirm_Notes').Asinteger;
  iPurchaseOrderEmail := qryCompany.Fieldbyname('Email_Purchase_Order_Notes').Asinteger;
end;

procedure TfrmWTMaintParams.EnableOK(Sender: TObject);
begin
  btnOK.Enabled :=  (edtCompanyName.Text <> '');
end;

procedure TfrmWTMaintParams.Button2Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtJobDocumentDirectory.Text;
    if DirDlg.Execute then
      edtJobDocumentDirectory.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TfrmWTMaintParams.Button1Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtSalesDocumentDirectory.Text;
    if DirDlg.Execute then
      edtSalesDocumentDirectory.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TfrmWTMaintParams.Button3Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtCustomerDocumentDirectory.Text;
    if DirDlg.Execute then
      edtCustomerDocumentDirectory.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TfrmWTMaintParams.chkbxUseCostingClick(Sender: TObject);
begin
  edtDefaultMileageRate.enabled := chkbxUseCosting.checked;
  edtDefaultLabourRate.enabled := chkbxUseCosting.checked;
  edtDefaultHandlingRate.enabled:= chkbxUseCosting.checked;
  edtWasteCostMultiplier.enabled:= chkbxUseCosting.checked;
end;

procedure TfrmWTMaintParams.Button4Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtQuoteDocumentDirectory.Text;
    if DirDlg.Execute then
      edtQuoteDocumentDirectory.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TfrmWTMaintParams.Button5Click(Sender: TObject);
begin
  opndlgTerms.Files.Clear;
  opndlgTerms.FileName := edtTemplateConditionsFile.Text;
  if opndlgTerms.Execute then
    begin
      if opndlgTerms.Files.Count > 0 then
      begin
        edtTemplateConditionsFile.Text := opndlgTerms.Files[opndlgTerms.Files.Count - 1];
      end;
    end;
end;

procedure TfrmWTMaintParams.Button6Click(Sender: TObject);
begin
  opndlgTerms.Files.Clear;
  opndlgTerms.FileName := edtSalesOrderTermsFile.Text;
  if opndlgTerms.Execute then
    begin
      if opndlgTerms.Files.Count > 0 then
      begin
        edtSalesOrderTermsFile.Text := opndlgTerms.Files[opndlgTerms.Files.Count - 1];
      end;
    end;
end;

procedure TfrmWTMaintParams.Button7Click(Sender: TObject);
begin
  opndlgTerms.Files.Clear;
  opndlgTerms.FileName := edtSalesAvailabilityFile.Text;
  if opndlgTerms.Execute then
    begin
      if opndlgTerms.Files.Count > 0 then
      begin
        edtSalesAvailabilityFile.Text := opndlgTerms.Files[opndlgTerms.Files.Count - 1];
      end;
    end;

end;

procedure TfrmWTMaintParams.btnEmailHelpClick(Sender: TObject);
begin
  frmWTParamsHelp := TfrmWTParamsHelp.create(self);

  try
    frmWTParamsHelp.showmodal;
  finally
    frmWTParamsHelp.free;
  end;
end;

procedure TfrmWTMaintParams.DirectClrBitBtnClick(Sender: TObject);
begin
  dblkpSchedulePackage.keyvalue := '';
end;

procedure TfrmWTMaintParams.Button8Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtContractDocumentDirectory.Text;
    if DirDlg.Execute then
      edtContractDocumentDirectory.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TfrmWTMaintParams.btnSalesLeadClick(Sender: TObject);
begin
  frmWTLUSalesLead := TfrmWTLUSalesLead.create(self);
  try
    frmWTLUSalesLead.showmodal;
  finally
    frmWTLUSalesLead.free;
  end;

  qrySalesSource.Active := false;
  qrySalesSource.parambyname('Sales_Lead_Source').asinteger := qryCompany.fieldbyname('Sales_Lead_Source').asinteger;
  qrySalesSource.Active := true;
end;

procedure TfrmWTMaintParams.Button9Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtWebsiteImageDirectory.Text;
    if DirDlg.Execute then
      edtWebsiteImageDirectory.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TfrmWTMaintParams.SpeedButton4Click(Sender: TObject);
begin
  dblkpUpstand.KeyValue := 0;
end;

procedure TfrmWTMaintParams.Button10Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtCustomerDocumentDirectory.Text;
    if DirDlg.Execute then
      edtCustomerDocumentDirectory.text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;

end;

procedure TfrmWTMaintParams.chkbxUseContractQuotingClick(Sender: TObject);
begin
  chkbxContractQuoteBySlab.enabled := (Sender as TCheckBox).checked;
end;

procedure TfrmWTMaintParams.BitBtn1Click(Sender: TObject);
begin
  edtSharedFolder.Text := '';
end;

procedure TfrmWTMaintParams.SpeedButton2Click(Sender: TObject);
begin
  dblkpCustSalesLeadSource.KeyValue := 0;
end;

procedure TfrmWTMaintParams.CallMaintScreen(Module: integer);
begin
  frmWTMaintCompanyDocStructure :=  TfrmWTMaintCompanyDocStructure.create(self);
  try
    frmWTMaintCompanyDocStructure.module := Module;
    frmWTMaintCompanyDocStructure.showmodal;
  finally
    frmWTMaintCompanyDocStructure.free
  end;
end;


procedure TfrmWTMaintParams.Button11Click(Sender: TObject);
begin
  CallMaintScreen((Sender as TButton).Tag);
end;

procedure TfrmWTMaintParams.btnLUProductsClick(Sender: TObject);
begin
  frmwtLUProducts := TfrmwtLUProducts.create(self);
  try
    frmwtLUProducts.Product := iProduct;
    frmwtLUProducts.isLookup := true;
    frmwtLUProducts.showmodal;
    if frmwtLUProducts.modalresult = idOK then
      begin
        iProduct := frmwtLUProducts.Product;
        edtRemedialProduct.Text := frmwtLUProducts.ProductCode;
      end;
  finally
    frmwtLUProducts.free;
  end;
end;

procedure TfrmWTMaintParams.btnClearProductClick(Sender: TObject);
begin
  iProduct := 0;
  edtRemedialProduct.Text := '';
end;

procedure TfrmWTMaintParams.chkbxUseDocumentTransferClick(Sender: TObject);
begin
  grpbxDocumentTransfer.Enabled := chkbxUseDocumentTransfer.checked;
  edtQuotationDocumentFolder.enabled := chkbxUseDocumentTransfer.checked;
  edtSafetyDocumentFolder.enabled := chkbxUseDocumentTransfer.checked;
  edtRemedialDocumentFolder.enabled:= chkbxUseDocumentTransfer.checked;
end;

procedure TfrmWTMaintParams.chkbxUseRemedialsAsOrdersClick(Sender: TObject);
begin
  grpbxRemedials.enabled := chkbxUseRemedialsAsOrders.checked ;
  edtRemedialProduct.Enabled := chkbxUseRemedialsAsOrders.checked ;
  btnLUProducts.Enabled := chkbxUseRemedialsAsOrders.checked ;
  btnClearProduct.Enabled := chkbxUseRemedialsAsOrders.checked ;
end;

end.
