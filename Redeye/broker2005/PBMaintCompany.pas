unit PBMaintCompany;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, ComCtrls, Buttons, DBCtrls, ExtCtrls, Mask, Spin,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCompanyFrm = class(TForm)
    GetCompanySQL: TFDQuery;
    UpCompanySQL: TFDQuery;
    GetCurrSQL: TFDQuery;
    GetCurrSRC: TDataSource;
    tbSettings: TPageControl;
    tbsAddress: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PostCodeEdit: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    PhoneEdit: TEdit;
    FaxEdit: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    EMailEdit: TEdit;
    Label2: TLabel;
    DefCurrDBLookupComboBox: TDBLookupComboBox;
    AccCustCheckBox: TCheckBox;
    AccSuppCheckBox: TCheckBox;
    Label6: TLabel;
    NominalDBLookupComboBox: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    GetNominalSQL: TFDQuery;
    GetNominalSRC: TDataSource;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    SupplierEdit: TEdit;
    Label12: TLabel;
    BranchEdit: TEdit;
    SelSuppBtn: TBitBtn;
    GetSupplierSQL: TFDQuery;
    ClearBitBtn: TBitBtn;
    GroupBox2: TGroupBox;
    SuppFaxEdit: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    SuppPhoneEdit: TEdit;
    dblucmbbxCommission: TDBLookupComboBox;
    dtdrcCommission: TDataSource;
    qryCommission: TFDQuery;
    Label15: TLabel;
    DelivNotesBitBtn: TBitBtn;
    FlashDelivTimer: TTimer;
    UpdDelivNotesOnlySQL: TFDQuery;
    chkbxAssignPIN: TCheckBox;
    Label16: TLabel;
    DBLuCmbBxDefVat: TDBLookupComboBox;
    QryVat: TFDQuery;
    DsVat: TDataSource;
    QryPrdTyp: TFDQuery;
    DSPrdTyp: TDataSource;
    TabSheet4: TTabSheet;
    chkbxFormRefReq: TCheckBox;
    Label17: TLabel;
    DBLuCmbBxDefPrdTyp: TDBLookupComboBox;
    btbtnClearProdType: TBitBtn;
    cmbBudgetType: TComboBox;
    Label19: TLabel;
    chkbxOnstop: TCheckBox;
    edtCashSalesAcc: TEdit;
    lblCashSaleAccount: TLabel;
    rdgrpJobBag: TRadioGroup;
    JobBagsCheckBox: TCheckBox;
    grpbxAuthorisePO: TGroupBox;
    chkbxAuthorisePO: TCheckBox;
    Label20: TLabel;
    memCreditLimit: TMemo;
    chkbxCustMandatory: TCheckBox;
    chkbxSuppMandatory: TCheckBox;
    PNDefEdit: TMaskEdit;
    SNDefEdit: TMaskEdit;
    chkbxMatchPOs: TCheckBox;
    chkbxUseRevenueCentres: TCheckBox;
    TabSheet5: TTabSheet;
    Label18: TLabel;
    edtPOLocation: TEdit;
    btnBrowse: TButton;
    Label21: TLabel;
    edtEnquiryLocation: TEdit;
    Button1: TButton;
    Label22: TLabel;
    edtJobBagLocation: TEdit;
    Button2: TButton;
    chkbxUseAccManagers: TCheckBox;
    chkbxUseProduction: TCheckBox;
    chkbxDontDefaultDelivery: TCheckBox;
    Label23: TLabel;
    edtQuoteLocation: TEdit;
    Button3: TButton;
    chkbxCanChangeInvoice: TCheckBox;
    chkbxUseJBCosts: TCheckBox;
    tbsProduction: TTabSheet;
    Label24: TLabel;
    edtWIEmailAddress: TEdit;
    Label25: TLabel;
    edtWIEmailName: TEdit;
    Label26: TLabel;
    VATRegEdit: TEdit;
    chkbxUseFSC: TCheckBox;
    Label27: TLabel;
    edtCustLocation: TEdit;
    Button4: TButton;
    Label28: TLabel;
    edtSuppLocation: TEdit;
    Button5: TButton;
    chkbxUseNCA: TCheckBox;
    btnPaymentNotes: TBitBtn;
    FlashPayTimer: TTimer;
    chkbxDefSODeliveries: TCheckBox;
    chkbxUseConInvoicing: TCheckBox;
    chkbxPaymentTerms: TCheckBox;
    chkbxConfirmProduction: TCheckBox;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    GroupBox3: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    edtDeliveryDescription: TEdit;
    memDeliveryCharge: TMemo;
    memDeliveryCost: TMemo;
    dblkpDeliveryVat: TDBLookupComboBox;
    Label38: TLabel;
    edtCompanyRegNo: TEdit;
    Label39: TLabel;
    edtWebAddress: TEdit;
    Label40: TLabel;
    memDeliveryThreshold: TMemo;
    qryOnlineVAT: TFDQuery;
    dtsOnlineVAT: TDataSource;
    tbsTerms: TTabSheet;
    Label41: TLabel;
    Label42: TLabel;
    edtSalesTermsDoc: TEdit;
    edtPurchaseTermsDoc: TEdit;
    Button6: TButton;
    Button7: TButton;
    opndlgTerms: TOpenDialog;
    chkbxStockVersions: TCheckBox;
    tbsAnalysis: TTabSheet;
    Label43: TLabel;
    Label44: TLabel;
    edtAnalysis1Caption: TEdit;
    edtAnalysis2Caption: TEdit;
    GroupBox4: TGroupBox;
    Label45: TLabel;
    dblkpWebProductType: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    Label46: TLabel;
    dblkpWebPaidProductType: TDBLookupComboBox;
    BitBtn3: TBitBtn;
    Label47: TLabel;
    cmbAliasList: TComboBox;
    BitBtn4: TBitBtn;
    chkbxDefaultVat: TCheckBox;
    chkbxDefaultCustomerAccCode: TCheckBox;
    chkbxDefaultSupplierAccCode: TCheckBox;
    chkbxProductPrefix: TCheckBox;
    chkbxUsePackPricing: TCheckBox;
    chkbxShowWIPurchaseOrders: TCheckBox;
    chkbxUseProspects: TCheckBox;
    chkbxUseCreditCheck: TCheckBox;
    btnSupplierTerms: TBitBtn;
    FlashTermsTimer: TTimer;
    chkbxStockCodeMandatory: TCheckBox;
    chkbxAllowDeliveryImbal: TCheckBox;
    Label48: TLabel;
    PayTermsDBLookupComboBox: TDBLookupComboBox;
    qryPayTerms: TFDQuery;
    dtsPayTerms: TDataSource;
    BitBtn5: TBitBtn;
    btnCreditTermsNotes: TBitBtn;
    FlashCreditTimer: TTimer;
    btnEmailHelp: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    grpbxReorderReminder: TGroupBox;
    spnReorderReminderInterval: TSpinEdit;
    Label49: TLabel;
    chkbxUseReorderReminder: TCheckBox;
    Label50: TLabel;
    Label51: TLabel;
    memReOrderValue: TMemo;
    chkbxDefaultDeliveryViaCompany: TCheckBox;
    chkbxUseCRM: TCheckBox;
    tbsCRM: TTabSheet;
    Label52: TLabel;
    dblkpQActivityType: TDBLookupComboBox;
    qryActivityType: TFDQuery;
    dtsActivityType: TDataSource;
    btnActivityType: TButton;
    Label53: TLabel;
    Label54: TLabel;
    edtAnalysis3Caption: TEdit;
    edtAnalysis4Caption: TEdit;
    Label55: TLabel;
    dblkpEActivityType: TDBLookupComboBox;
    pnlBottom: TPanel;
    BitBtn1: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlTop: TPanel;
    Label1: TLabel;
    NameEdit: TEdit;
    StatusBar1: TStatusBar;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    dblkpProofActivity: TDBLookupComboBox;
    dblkpReorderActivity: TDBLookupComboBox;
    dblkpOrderAckActivity: TDBLookupComboBox;
    dblkpOrderDelActivity: TDBLookupComboBox;
    Label60: TLabel;
    edtActivityLocation: TEdit;
    Button8: TButton;
    chkbxUseSubReps: TCheckBox;
    btnEnquiryStructure: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Label61: TLabel;
    edtEmailStorage: TEdit;
    Button15: TButton;
    chkbxUseGDPR: TCheckBox;
    GroupBox5: TGroupBox;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    edtQuoteDescription: TMemo;
    Label65: TLabel;
    memQuoteCostMarkup: TMemo;
    qryProcessGroup: TFDQuery;
    dtsProcessGroup: TDataSource;
    qryProcess: TFDQuery;
    dtsProcess: TDataSource;
    dblkpProcessGroup: TDBLookupComboBox;
    dblkpProcess: TDBLookupComboBox;
    BitBtn6: TBitBtn;
    btnProdType: TButton;
    Button16: TButton;
    Label66: TLabel;
    edtStudioPriceListDoc: TEdit;
    Button17: TButton;
    Label67: TLabel;
    edtDirectDebitID: TEdit;
    Label68: TLabel;
    edtContractLocation: TEdit;
    Button18: TButton;
    Button19: TButton;
    chkbxUseContracts: TCheckBox;
    Label69: TLabel;
    edtRegOfficeAddress: TEdit;
    chkbxUseAcquiredCustomers: TCheckBox;
    chkbxUseCTRLPOrdering: TCheckBox;
    chkbxUseSAPIntegration: TCheckBox;
    Label70: TLabel;
    edtGlobalInvoiceEmail: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    Label29: TLabel;
    Label32: TLabel;
    memEmailEnquiry: TMemo;
    memEmailQuote: TMemo;
    Label30: TLabel;
    Label31: TLabel;
    memEmailPO: TMemo;
    memEmailAck: TMemo;
    Label33: TLabel;
    memEmailInvoice: TMemo;
    Label71: TLabel;
    memEmailOrdersDue: TMemo;
    Label72: TLabel;
    memEmailProformaInvoice: TMemo;
    dtsActivityTypeQuotRem: TDataSource;
    qryActivityTypeQuotRem: TFDQuery;
    qryActivityTypeProofStActiv: TFDQuery;
    dtsActivityTypeProofStActiv: TDataSource;
    dtsActivityTypeReorderAct: TDataSource;
    qryActivityTypeReorderAct: TFDQuery;
    dtsActivityTypeOrdAct: TDataSource;
    qryActivityTypeOrdAct: TFDQuery;
    qryActivityTypeDelivAct: TFDQuery;
    dtsActivityTypeDelivAct: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure UpdateCompany;
    procedure FormActivate(Sender: TObject);
    procedure SelSuppBtnClick(Sender: TObject);
    procedure ClearBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlashDelivTimerTimer(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure DelivNotesBitBtnClick(Sender: TObject);
    procedure btbtnClearProdTypeClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure JobBagsCheckBoxClick(Sender: TObject);
    procedure chkbxAuthorisePOClick(Sender: TObject);
    procedure memCreditLimitExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnPaymentNotesClick(Sender: TObject);
    procedure FlashPayTimerTimer(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FlashTermsTimerTimer(Sender: TObject);
    procedure btnSupplierTermsClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnCreditTermsNotesClick(Sender: TObject);
    procedure FlashCreditTimerTimer(Sender: TObject);
    procedure btnEmailHelpClick(Sender: TObject);
    procedure chkbxUseReorderReminderClick(Sender: TObject);
    procedure memReOrderValueExit(Sender: TObject);
    procedure btnActivityTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure btnEnquiryStructureClick(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure memQuoteCostMarkupExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure btnProdTypeClick(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
  private
    FSuppBranch: integer;
    FSupplier: integer;
    procedure SetSuppBranch(const Value: integer);
    procedure SetSupplier(const Value: integer);
    function GetNarrative(const iNarrative: integer): string;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    function UpdateEmailEnquiry: Integer;
    function UpdateEmailAck: Integer;
    function UpdateEmailInvoice: Integer;
    function UpdateEmailOrdersDue: Integer;
    function UpdateEmailPO: Integer;
    function UpdateEmailProformaInvoice: Integer;
    function UpdateEmailQuote: Integer;
    procedure GetActivityTypes;
    procedure CallMaintScreen(Module: integer);
    procedure ReopenDatasets(Dataset: TDataSet);
  private
    { Private declarations }
    bDelivNotesFlash, bPaymentNotesFlash, bSupplierTermsFlash, bCreditTermsFlash: ByteBool;
    iPaymentText, iEnqtext, iPOtext, iAckText, iQuoteText, iInvoicetext, iProformaInvoicetext, iOrdersDuetext, iSupplierTerms, iCreditTermsText: integer;
    sOldValue: string;
    sPaymentText, sSupplierTerms, sCreditTermsText: string;
    procedure GetSupplier(iSupplier, iBranch: integer);
    property Supplier: integer read FSupplier write SetSupplier;
    property SuppBranch: integer read FSuppBranch write SetSuppBranch;
public
    { Public declarations }
  end;

var
  PBMaintCompanyFrm: TPBMaintCompanyFrm;

implementation

uses UITypes, PBDelivNotes, pbDatabase, PBLUSupp, PBImages, pbMainMenu, CCSCommon, PBNarrativeDM, PBDBMemo,
  PBParamsHelp, PBLUActivityType, PBMaintCompanyDocStructure, PBLUProcess,
  PBLUProcessGroup;

{$R *.DFM}

procedure TPBMaintCompanyFrm.FormShow(Sender: TObject);
begin
  PBDelivNotesFrm := TPBDelivNotesFrm.Create(Self);
  PBDelivNotesFrm.bAllow_Upd := True;
  with GetCompanySQl do
  begin
    Close;
    Open;
    First;

    if fieldbyname('Accounts_Package').asstring = 'SAGEMMS' then
    begin
      SNDefEdit.editMask := '!00009999/AAA/AAA;0;_';
      SNDefEdit.MaxLength := 16;

      PNDefEdit.editMask := '!00009999/AAA/AAA;0;_';
      PNDefEdit.MaxLength := 16;
    end
  else
    begin
      SNDefEdit.editMask := '';
      SNDefEdit.MaxLength := 8;

      PNDefEdit.editMask := '';
      PNDefEdit.MaxLength := 8;
    end;

    NameEdit.Text := FieldByName('Name').AsString;
    BuildingEdit.Text := FieldByName('Building_no_Name').AsString;
    StreetEdit.Text := FieldByName('Street').AsString;
    LocaleEdit.Text := FieldByName('Locale').AsString;
    TownEdit.Text := FieldByName('Town').AsString;
    PostCodeEdit.Text := FieldByName('Postcode').AsString;
    PhoneEdit.Text := FieldByName('Phone').AsString;
    FaxEdit.Text := FieldByName('Fax_number').AsString;
    SuppPhoneEdit.Text := FieldByName('Supplier_Phone').AsString;
    SuppFaxEdit.Text := FieldByName('Supplier_Fax').AsString;
    EMailEdit.Text := FieldByName('EMail').AsString;
    edtWebAddress.Text := FieldByName('Web_Address').AsString;
    edtCompanyRegNo.Text := FieldByName('Company_Reg_no').AsString;
    VATRegEdit.Text := FieldByName('VAT_Registration_No').AsString;
    edtRegOfficeAddress.text := FieldByName('Registered_Office_Address').AsString;
    PNDefEdit.Text := FieldByName('Purch_Nom_Def').AsString;
    sNDefEdit.Text := FieldByName('Sales_Nom_Def').AsString;
    memCreditLimit.Text := formatfloat('#####0.00',FieldByName('Default_PO_Limit').Asfloat);
    iPaymentText := fieldbyname('Invoice_Payment_Notes').asinteger;
    sPaymentText := GetNarrative(fieldbyname('Invoice_Payment_Notes').asinteger);
    sSupplierTerms := GetNarrative(fieldbyname('Supplier_Payment_Terms').asinteger);
    sCreditTermsText := GetNarrative(fieldbyname('Credit_Terms_Notes').asinteger);
    PBDelivNotesFrm.LoadMemoData(FieldByName('Delivery_Narrative').AsInteger);

    if FieldByName('Default_Payment_Terms').AsInteger = 0 then
      PayTermsDBLookupComboBox.KeyValue := 0
    else
      PayTermsDBLookupComboBox.KeyValue := FieldByName('Default_Payment_Terms').AsInteger;

    if FieldByName('Currency_Code_Def').AsInteger = 0 then
      DefCurrDBLookupComboBox.KeyValue := 0
    else
      DefCurrDBLookupComboBox.KeyValue :=
        FieldByName('Currency_Code_Def').AsInteger;

    if FieldByName('Nominal_Level').Asstring = '' then
      NominalDBLookupComboBox.KeyValue := 0
    else
      NominalDBLookupComboBox.KeyValue :=
        FieldByName('Nominal_Level').Asstring;

    if FieldByName('commission_type').Asstring = '' then
      self.dblucmbbxCommission.KeyValue := 'PDINV'
    else
      self.dblucmbbxCommission.KeyValue :=
        FieldByName('commission_type').Asstring;

    JobBagsCheckBox.Checked := (FieldByName('Job_Bag_In_Use').AsString = 'Y');
    chkbxUseRevenueCentres.Checked := (FieldByName('Use_Revenue_Centres').AsString = 'Y');
    chkbxUseAccManagers.Checked := (FieldByName('Use_Account_Managers').AsString = 'Y');
    chkbxUseProduction.Checked := (FieldByName('Use_Production').AsString = 'Y');
    chkbxUseGDPR.Checked := (FieldByName('Use_GDPR').AsString = 'Y');
    chkbxConfirmProduction.Checked := (FieldByName('Confirm_Production').AsString = 'Y');
    chkbxStockVersions.Checked := (FieldByName('Allow_Stock_Versions').AsString = 'Y');
    chkbxProductPrefix.Checked := (FieldByName('Product_Prefix_not_Required').AsString = 'Y');
    chkbxDefSODeliveries.Checked := (FieldByName('Default_SO_Last_Delivery').AsString = 'Y');
    chkbxUseJBCosts.Checked := (FieldByName('Include_Job_Bag_Costs').AsString = 'Y');
    chkbxDontDefaultDelivery.Checked := (FieldByName('Dont_Default_PO_Deliveries').AsString = 'Y');
    chkbxDefaultVat.Checked := (FieldByName('Default_Buy_Print_Vat_Code').AsString = 'Y');
    chkbxDefaultDeliveryViaCompany.Checked := (FieldByName('Default_Delivery_Via_Company').AsString = 'Y');

    chkbxUsePackPricing.Checked := (FieldByName('Use_Pack_Pricing').AsString = 'Y');

    chkbxUseProspects.Checked := (FieldByName('Use_Prospect_System').AsString = 'Y');
    chkbxUseCRM.Checked := (FieldByName('Use_CRM_System').AsString = 'Y');
    chkbxUseSAPIntegration.Checked := (FieldByName('Use_SAP_Integration').AsString = 'Y');

    chkbxStockCodeMandatory.Checked := (FieldByName('Stock_ref_Mandatory').AsString = 'Y');

    chkbxAllowDeliveryImbal.Checked := (FieldByName('Allow_Delivery_Imbalance').AsString = 'Y');

    chkbxUseReorderReminder.Checked := (FieldByName('Use_Reorder_Reminder').AsString = 'Y');
    spnReOrderReminderInterval.value := FieldByName('Reorder_Reminder_Interval').Asinteger;
    memReorderValue.text := formatfloat('#####0.00',FieldByName('Reorder_Reminder_Min_Value').Asfloat);
    spnReOrderReminderInterval.enabled := chkbxUseReorderReminder.Checked;
    memReorderValue.enabled := chkbxUseReorderReminder.Checked;

    if (Fieldbyname('Job_Bag_is_mandatory').asstring = 'Y') then
      rdgrpJobBag.ItemIndex := 2
    else
    if (Fieldbyname('Job_Bag_is_mandatory').asstring = 'N') then
      rdgrpJobBag.ItemIndex := 1
    else
      rdgrpJobBag.ItemIndex := 0;

    chkbxDefaultCustomerAccCode.Checked := (FieldByName('Default_Customer_Account_Code').AsString = 'Y');
    chkbxDefaultSupplierAccCode.Checked := (FieldByName('Default_Supplier_Account_Code').AsString = 'Y');

    AccCustCheckBox.Checked := (FieldByName('Acc_Code_Cust_Unique').AsString =
      'Y');
    AccSuppCheckBox.Checked := (FieldByName('Acc_Code_Supp_Unique').AsString =
      'Y');
    chkbxAssignPIN.Checked := (FieldByName('Use_PIN_Reference').asString = 'Y');
    chkbxOnStop.Checked := (FieldByName('onstop').asString = 'Y');
    chkbxUseCreditCheck.checked := (FieldByName('Use_Credit_Checking').asString = 'Y');
    chkbxCanChangeInvoice.Checked := (FieldByName('Change_Invoice_After_Print').asString = 'Y');
    chkbxUseConInvoicing.Checked := (FieldByName('Use_Consolidated_Invoicing').asString = 'Y');
    chkbxMatchPOs.Checked := (FieldByName('Match_Purchase_Orders').asString = 'Y');

    chkbxUseFSC.Checked := (FieldByName('Use_FSC_Claim').asString = 'Y');
    chkbxUseNCA.Checked := (FieldByName('Use_Non_Conformance').asString = 'Y');

    chkbxUseSubReps.Checked := (FieldByName('Use_Sub_Reps').asString = 'Y');
    chkbxUseContracts.Checked := (FieldByName('Use_Contract_Module').asString = 'Y');
    chkbxUseAcquiredCustomers.Checked := (FieldByName('Use_Acquired_Customers').asString = 'Y');
    chkbxUseCTRLPOrdering.checked := (fieldbyname('Use_CTRLP_Ordering').asstring = 'Y');

    chkbxCustMandatory.checked := (FieldByName('Cust_acc_code_mandatory').asString = 'Y');
    chkbxSuppMandatory.checked := (FieldByName('Supp_acc_code_mandatory').asString = 'Y');

    chkbxAuthorisePO.Checked := (FieldByName('Authorise_POrders').AsString = 'Y');

    chkbxPaymentTerms.Checked := (FieldByName('Use_Invoice_Notes_for_Terms').AsString = 'Y');

    chkbxShowWIPurchaseOrders.checked := (FieldByName('Show_WI_Purchase_Orders').AsString = 'Y');
    
    if fieldbyname('Supplier').asstring = '' then
      begin
        SupplierEdit.clear;
        BranchEdit.clear;
      end
    else
      begin
        Supplier := fieldbyname('Supplier').asinteger;
        SuppBranch := fieldbyname('Branch_no').asinteger;
        GetSupplier(fieldbyname('Supplier').asinteger,fieldbyname('Branch_no').asinteger);
      end;
    DBLuCmbBxDefVat.KeyValue := FieldByName('Vat_Code').asInteger;

    dblkpEActivityType.keyvalue := FieldByName('Enquiry_Reminder_Activity_Type').asInteger;
    dblkpQActivityType.keyvalue := FieldByName('Quote_Reminder_Activity_Type').asInteger;
    dblkpProofActivity.keyvalue := FieldByName('Proof_Status_Activity_Type').asInteger;
    dblkpReOrderActivity.keyvalue := FieldByName('Reorder_Activity_Type').asInteger;
    dblkpOrderAckActivity.keyvalue := FieldByName('Order_Ack_Activity_Type').asInteger;
    dblkpOrderDelActivity.keyvalue := FieldByName('Order_Delivery_Activity_Type').asInteger;

    if FieldByName('Product_Type').asInteger = 0 then
      DBLuCmbBxDefPrdTyp.KeyValue := 0
    else
      DBLuCmbBxDefPrdTyp.KeyValue := FieldByName('Product_Type').asInteger;
    edtPOLocation.text := Fieldbyname('Document_Directory').asstring;
    edtJobBagLocation.text := Fieldbyname('Job_Bag_Document_Directory').asstring;
    edtEnquiryLocation.text := Fieldbyname('Enquiry_Document_Directory').asstring;
    edtQuoteLocation.text := Fieldbyname('Quote_Document_Directory').asstring;
    edtCustLocation.text := Fieldbyname('Customer_Document_Directory').asstring;
    edtSuppLocation.text := Fieldbyname('Supplier_Document_Directory').asstring;
    edtActivityLocation.text := Fieldbyname('Activity_Document_Directory').asstring;
    edtContractLocation.text := Fieldbyname('Contract_Document_Directory').asstring;
    edtEmailStorage.text := Fieldbyname('Email_Storage_Directory').asstring;

    edtSalesTermsDoc.text := Fieldbyname('Sales_order_Terms_file').asstring;
    edtPurchaseTermsDoc.text := Fieldbyname('Purchase_order_Terms_file').asstring;
    edtStudioPriceListDoc.text := Fieldbyname('Studio_Price_Guide_File').asstring;

    edtAnalysis1Caption.text := Fieldbyname('Analysis_Code_1_Caption').asstring;
    edtAnalysis2Caption.text := Fieldbyname('Analysis_Code_2_Caption').asstring;
    edtAnalysis3Caption.text := Fieldbyname('Analysis_Code_3_Caption').asstring;
    edtAnalysis4Caption.text := Fieldbyname('Analysis_Code_4_Caption').asstring;

    {Set Web2Print unPaid Product Type}
    if FieldByName('Default_Web2Print_Product_Type').asInteger = 0 then
      dblkpWebProductType.KeyValue := 0
    else
      dblkpWebProductType.KeyValue := FieldByName('Default_Web2Print_Product_Type').asInteger;

    {Set Web2Print Paid Product Type}
    if FieldByName('Default_Web_Paid_Product_Type').asInteger = 0 then
      dblkpWebPaidProductType.KeyValue := 0
    else
      dblkpWebPaidProductType.KeyValue := FieldByName('Default_Web_Paid_Product_Type').asInteger;

    if FieldByName('Performance_target_type').asstring = 'C' then
      cmbBudgetType.itemindex := 1
    else
      cmbBudgetType.itemindex := 0;

    self.chkbxFormRefReq.Checked :=
      (FieldByName('Form_Reference_Mandatory').asString = 'Y');

    self.edtCashSalesAcc.Text := FieldByName('Cash_Sales_Account_Code').asString;
    self.edtDirectDebitID.Text := FieldByName('Direct_Debit_Account_ID').asString;
    self.edtGlobalInvoiceEmail.Text := FieldByName('Global_Invoice_Email').asString;

    edtWIEmailAddress.Text := fieldbyname('Default_WI_Email_Address').asstring;
    edtWIEmailName.Text := fieldbyname('Default_WI_Email_Name').asstring;

    memEmailEnquiry.text := GetNarrative(fieldbyname('Email_Enquiry_Notes').asinteger);
    memEmailPO.text := GetNarrative(fieldbyname('Email_Purchase_Order_Notes').asinteger);
    memEmailAck.text := GetNarrative(fieldbyname('Email_Acknowledgement_Notes').asinteger);
    memEmailQuote.text := GetNarrative(fieldbyname('Email_Quotation_Notes').asinteger);
    memEmailInvoice.text := GetNarrative(fieldbyname('Email_Invoice_Notes').asinteger);
    memEmailOrdersDue.text := GetNarrative(fieldbyname('Email_Orders_Due_Notes').asinteger);
    memEmailProformaInvoice.text := GetNarrative(fieldbyname('Email_Proforma_Notes').asinteger);

    edtDeliveryDescription.Text := fieldbyname('Online_Delivery_Description').asstring;
    memDeliveryCharge.Text := formatfloat('0.00',fieldbyname('Online_Delivery_Charge').asfloat);
    memDeliveryCost.Text := formatfloat('0.00',fieldbyname('Online_Delivery_cost').asfloat);
    memDeliveryThreshold.Text := formatfloat('0.00',fieldbyname('Online_Delivery_Threshold').asfloat);
    dblkpDeliveryVat.keyvalue := fieldbyname('Online_Delivery_Vat_Code').asinteger;

    {Quoting defaults}
    if FieldByName('Default_Quote_Cost_Process_Grp').asInteger = 0 then
      dblkpProcessGroup.KeyValue := 0
    else
      dblkpProcessGroup.KeyValue := FieldByName('Default_Quote_Cost_Process_Grp').asInteger;

    if FieldByName('Default_Quote_Cost_Process').asInteger = 0 then
      dblkpProcess.KeyValue := 0
    else
      dblkpProcess.KeyValue := FieldByName('Default_Quote_Cost_Process').asInteger;
    edtQUoteDescription.text := FieldByName('Default_Quote_Cost_Description').asstring;
    memQuoteCostMarkup.text := formatfloat('0.00',FieldByName('Default_Quote_Cost_markup_perc').asfloat);
  end;
end;

function TPBMaintCompanyFrm.GetNarrative(const iNarrative: integer): string;
var
  Narrative : TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

procedure TPBMaintCompanyFrm.SaveNarrative(var iNarrative: Integer;
  const Data: string);
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.DataInfo := Data;
    Narrative.SaveToDB;
    iNarrative := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

procedure TPBMaintCompanyFrm.BitBtn1Click(Sender: TObject);
begin
  UpdateCompany;
end;

procedure TPBMaintCompanyFrm.GetSupplier(iSupplier, iBranch: integer);
begin
  with GetSupplierSQL do
    begin
      close;
      parambyname('Supplier').asinteger := iSupplier;
      parambyname('Branch_no').asinteger := iBranch;
      open;

      first;
      SupplierEdit.text := fieldbyname('Supplier_Name').asstring;
      BranchEdit.text := fieldbyname('Branch_Name').asstring;
    end;
end;

procedure TPBMaintCompanyFrm.UpdateCompany;
var
  iTempNarr: integer;
begin
  with UpCompanySQl do
  begin
    Close;
    ParamByName('Name').AsString := NameEdit.Text + '';
    ParamByName('Building_no_Name').AsString := BuildingEdit.Text + '';
    ParamByName('Street').AsString := StreetEdit.Text + '';
    ParamByName('Locale').AsString := LocaleEdit.Text + '';
    ParamByName('Town').AsString := TownEdit.Text + '';
    ParamByName('Postcode').AsString := PostCodeEdit.Text + '';
    ParamByName('Phone').AsString := PhoneEdit.Text + '';
    ParamByName('Fax_number').AsString := FaxEdit.Text + '';
    ParamByName('Supplier_Phone').AsString := SuppPhoneEdit.Text + '';
    ParamByName('Supplier_Fax').AsString := SuppFaxEdit.Text + '';
    ParamByName('EMail').AsString := EMailEdit.Text + '';
    ParamByName('Web_Address').AsString := edtWebAddress.Text + '';
    ParamByName('Company_Reg_no').AsString := edtCompanyRegNo.Text + '';
    ParamByName('VAT_Registration_No').AsString := VATRegEdit.Text + '';
    ParamByName('Registered_Office_Address').AsString := edtRegOfficeAddress.Text + '';

    ParamByName('Purch_Nom_Def').AsString := PNDefEdit.Text + '';
    ParamByName('Sales_Nom_Def').AsString := SNDefEdit.Text + '';
    ParamByName('Default_PO_Limit').Asfloat := StrToFloatDef(memCreditLimit.text, 0, FormatSettings);

    if PayTermsDBLookupComboBox.text <> '' then
      ParamByName('Default_Payment_Terms').AsInteger :=
        PayTermsDBLookupComboBox.KeyValue
    else
      ParamByName('Default_Payment_Terms').Clear;

    if DefCurrDBLookupComboBox.text <> '' then
      ParamByName('Currency_Code_Def').AsInteger :=
        DefCurrDBLookupComboBox.KeyValue
    else
      ParamByName('Currency_Code_Def').Clear;

    if NominalDBLookupComboBox.text <> '' then
      ParamByName('Nominal_Level').Asstring :=
        NominalDBLookupComboBox.KeyValue
    else
      ParamByName('Nominal_Level').Clear;

    if self.dblucmbbxCommission.text <> '' then
      ParamByName('commission_type').Asstring :=
        self.dblucmbbxCommission.KeyValue
    else
      ParamByName('commission_type').Clear;

    if JobBagsCheckBox.Checked then
      ParamByName('Job_Bag_In_Use').AsString := 'Y'
    else
      ParamByName('Job_Bag_In_Use').AsString := 'N';

    if chkbxDefaultVat.Checked then
      ParamByName('Default_Buy_Print_Vat_Code').AsString := 'Y'
    else
      ParamByName('Default_Buy_Print_Vat_Code').AsString := 'N';

    if chkbxDefaultDeliveryViaCompany.Checked then
      ParamByName('Default_Delivery_Via_Company').AsString := 'Y'
    else
      ParamByName('Default_Delivery_Via_Company').AsString := 'N';

    if chkbxUsePackPricing.Checked then
      ParamByName('Use_Pack_Pricing').AsString := 'Y'
    else
      ParamByName('Use_Pack_Pricing').AsString := 'N';

    if chkbxUseProspects.Checked then
      ParamByName('Use_Prospect_System').AsString := 'Y'
    else
      ParamByName('Use_Prospect_System').AsString := 'N';

    if chkbxUseCRM.Checked then
      ParamByName('Use_CRM_System').AsString := 'Y'
    else
      ParamByName('Use_CRM_System').AsString := 'N';

    if chkbxUseSAPIntegration.Checked then
      ParamByName('Use_SAP_Integration').AsString := 'Y'
    else
      ParamByName('Use_SAP_Integration').AsString := 'N';

    if chkbxUseRevenueCentres.Checked then
      ParamByName('Use_Revenue_Centres').AsString := 'Y'
    else
      ParamByName('Use_Revenue_Centres').AsString := 'N';

    if chkbxUseAccManagers.Checked then
      ParamByName('Use_Account_Managers').AsString := 'Y'
    else
      ParamByName('Use_Account_Managers').AsString := 'N';

    if chkbxUseProduction.Checked then
      ParamByName('Use_Production').AsString := 'Y'
    else
      ParamByName('Use_Production').AsString := 'N';

    if chkbxUseGDPR.Checked then
      ParamByName('Use_GDPR').AsString := 'Y'
    else
      ParamByName('Use_GDPR').AsString := 'N';

    if chkbxUseReorderReminder.Checked then
      ParamByName('Use_Reorder_Reminder').AsString := 'Y'
    else
      ParamByName('Use_Reorder_Reminder').AsString := 'N';

    Parambyname('Reorder_Reminder_Interval').asinteger := spnReorderReminderInterval.value;
    ParamByName('Reorder_Reminder_Min_Value').Asfloat := StrToFloatDef(memReorderValue.text, 0, FormatSettings);

    if chkbxConfirmProduction.Checked then
      ParamByName('Confirm_Production').AsString := 'Y'
    else
      ParamByName('Confirm_Production').AsString := 'N';

    if chkbxStockVersions.Checked then
      ParamByName('Allow_Stock_Versions').AsString := 'Y'
    else
      ParamByName('Allow_Stock_Versions').AsString := 'N';

    if chkbxProductPrefix.Checked then
      ParamByName('Product_Prefix_not_Required').AsString := 'Y'
    else
      ParamByName('Product_Prefix_not_Required').AsString := 'N';

    if chkbxStockCodeMandatory.Checked then
      ParamByName('Stock_Ref_Mandatory').AsString := 'Y'
    else
      ParamByName('Stock_Ref_Mandatory').AsString := 'N';

    if chkbxAllowdeliveryImbal.Checked then
      ParamByName('Allow_Delivery_imbalance').AsString := 'Y'
    else
      ParamByName('Allow_Delivery_Imbalance').AsString := 'N';

    if chkbxDefSODeliveries.Checked then
      ParamByName('Default_SO_Last_Delivery').AsString := 'Y'
    else
      ParamByName('Default_SO_Last_Delivery').AsString := 'N';

    if chkbxUseJBCosts.Checked then
      ParamByName('Include_Job_Bag_Costs').AsString := 'Y'
    else
      ParamByName('Include_Job_Bag_Costs').AsString := 'N';

    if chkbxDontDefaultDelivery.Checked then
      ParamByName('Dont_Default_PO_Deliveries').AsString := 'Y'
    else
      ParamByName('Dont_Default_PO_Deliveries').AsString := 'N';

    if chkbxAuthorisePO.Checked then
      ParamByName('Authorise_POrders').AsString := 'Y'
    else
      ParamByName('Authorise_POrders').AsString := 'N';

    if chkbxPaymentTerms.Checked then
      ParamByName('Use_Invoice_Notes_for_Terms').AsString := 'Y'
    else
      ParamByName('Use_Invoice_Notes_for_Terms').AsString := 'N';

    if rdgrpJobBag.ItemIndex = 2 then
      ParamByName('Job_Bag_Is_Mandatory').AsString := 'Y'
    else
    if rdgrpJobBag.ItemIndex = 1 then
      ParamByName('Job_Bag_Is_Mandatory').AsString := 'N'
    else
      ParamByName('Job_Bag_Is_Mandatory').AsString := 'P';

    if AccCustCheckBox.Checked then
      ParamByName('Acc_Code_Cust_Unique').AsString := 'Y'
    else
      ParamByName('Acc_Code_Cust_Unique').AsString := 'N';

    if AccSuppCheckBox.Checked then
      ParamByName('Acc_Code_Supp_Unique').AsString := 'Y'
    else
      ParamByName('Acc_Code_Supp_Unique').AsString := 'N';

    if chkbxDefaultCustomerAccCode.Checked then
      ParamByName('Default_Customer_Account_Code').AsString := 'Y'
    else
      ParamByName('Default_Customer_Account_Code').AsString := 'N';

    if chkbxDefaultSupplierAccCode.Checked then
      ParamByName('Default_Supplier_Account_Code').AsString := 'Y'
    else
      ParamByName('Default_Supplier_Account_Code').AsString := 'N';

    if (Supplier = 0) or (Supplier = 0) then
      begin
        ParamByName('Supplier').clear;
        ParamByName('Branch_no').clear;
      end
    else
      begin
        ParamByName('Supplier').Asinteger := Supplier;
        ParamByName('Branch_no').Asinteger := SuppBranch;
      end;
    PBDelivNotesFrm.UpdMemoData(Self);
    if PBDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := PBDelivNotesFrm.iNarr;

    {Get and save the Credit Terms Text}
    iTempNarr := iCreditTermsText;
    SaveNarrative(iTempNarr,sCreditTermsText);
    iCreditTermsText := iTempNarr;
    if iCreditTermsText = 0 then
      ParamByName('Credit_Terms_Notes').clear
    else
      ParamByName('Credit_Terms_Notes').Asinteger := iCreditTermsText;

    {Get and save the Invoice Payment notes}
    iTempNarr := iPaymentText;
    SaveNarrative(iTempNarr,sPaymentText);
    iPaymentText := iTempNarr;
    if iPaymentText = 0 then
      ParamByName('Invoice_Payment_Notes').clear
    else
      ParamByName('Invoice_Payment_Notes').Asinteger := iPaymentText;

    {Get and save the Supplier Payment Terms}
    iTempNarr := iSupplierTerms;
    SaveNarrative(iTempNarr,sSupplierTerms);
    iSupplierTerms := iTempNarr;
    if iSupplierTerms = 0 then
      ParamByName('Supplier_Payment_Terms').clear
    else
      ParamByName('Supplier_Payment_Terms').Asinteger := iSupplierTerms;

    {Get and save the Email Enquiry notes}
    iTempNarr := iEnqText;
    SaveNarrative(iTempNarr,memEmailEnquiry.text);
    iEnqText := iTempNarr;
    if iEnqText = 0 then
      ParamByName('Email_Enquiry_Notes').clear
    else
      ParamByName('Email_Enquiry_Notes').Asinteger := iEnqText;

    {Get and save the Email PO notes}
    iTempNarr := iPOText;
    SaveNarrative(iTempNarr,memEmailPO.text);
    iPOText := iTempNarr;
    if iPOText = 0 then
      ParamByName('Email_Purchase_Order_Notes').clear
    else
      ParamByName('Email_Purchase_Order_Notes').Asinteger := iPOText;

    {Get and save the Email Enquiry notes}
    iTempNarr := iAckText;
    SaveNarrative(iTempNarr,memEmailAck.text);
    iAckText := iTempNarr;
    if iAckText = 0 then
      ParamByName('Email_Acknowledgement_Notes').clear
    else
      ParamByName('Email_Acknowledgement_Notes').Asinteger := iAckText;

    {Get and save the Email Enquiry notes}
    iTempNarr := iQuoteText;
    SaveNarrative(iTempNarr,memEmailQuote.text);
    iQuoteText := iTempNarr;
    if iQuoteText = 0 then
      ParamByName('Email_Quotation_Notes').clear
    else
      ParamByName('Email_Quotation_Notes').Asinteger := iQuoteText;

    {Get and save the Email Enquiry notes}
    iTempNarr := iInvoiceText;
    SaveNarrative(iTempNarr,memEmailInvoice.text);
    iInvoiceText := iTempNarr;
    if iInvoiceText = 0 then
      ParamByName('Email_Invoice_Notes').clear
    else
      ParamByName('Email_Invoice_Notes').Asinteger := iInvoiceText;

    {Get and save the Email Orders Due notes}
    iTempNarr := iOrdersDueText;
    SaveNarrative(iTempNarr,memEmailOrdersDue.text);
    iOrdersDueText := iTempNarr;
    if iOrdersDueText = 0 then
      ParamByName('Email_Orders_Due_Notes').clear
    else
      ParamByName('Email_Orders_Due_Notes').Asinteger := iOrdersDueText;

    {Get and save the Email Proforma notes}
    iTempNarr := iProformaInvoiceText;
    SaveNarrative(iTempNarr,memEmailProformaInvoice.text);
    iProformaInvoiceText := iTempNarr;
    if iProformaInvoiceText = 0 then
      ParamByName('Email_Proforma_Notes').clear
    else
      ParamByName('Email_Proforma_Notes').Asinteger := iProformaInvoiceText;

    if self.chkbxAssignPIN.Checked then
    begin
      ParamByName('Use_PIN_Reference').asString := 'Y';
      dmBroker.UseSuppInvPIN := true;
    end
    else
    begin
      ParamByName('Use_PIN_Reference').asString := 'N';
      dmBroker.UseSuppInvPIN := false;
    end;

    if self.chkbxCustMandatory.Checked then
    begin
      ParamByName('Cust_acc_code_mandatory').asString := 'Y';
    end
    else
    begin
      ParamByName('Cust_acc_code_mandatory').asString := 'N';
    end;

    if self.chkbxSuppMandatory.Checked then
    begin
      ParamByName('Supp_acc_code_mandatory').asString := 'Y';
    end
    else
    begin
      ParamByName('Supp_acc_code_mandatory').asString := 'N';
    end;

    if self.chkbxOnstop.Checked then
    begin
      ParamByName('onstop').asString := 'Y';
    end
    else
    begin
      ParamByName('onstop').asString := 'N';
    end;

    if self.chkbxUseCreditCheck.Checked then
    begin
      ParamByName('Use_Credit_Checking').asString := 'Y';
    end
    else
    begin
      ParamByName('Use_Credit_Checking').asString := 'N';
    end;

    if self.chkbxCanChangeInvoice.Checked then
    begin
      ParamByName('Change_Invoice_After_Print').asString := 'Y';
    end
    else
    begin
      ParamByName('Change_Invoice_After_Print').asString := 'N';
    end;

    if self.chkbxUseConInvoicing.Checked then
    begin
      ParamByName('Use_Consolidated_Invoicing').asString := 'Y';
    end
    else
    begin
      ParamByName('Use_Consolidated_Invoicing').asString := 'N';
    end;

    if self.chkbxMatchPOs.Checked then
    begin
      ParamByName('Match_Purchase_orders').asString := 'Y';
    end
    else
    begin
      ParamByName('Match_Purchase_orders').asString := 'N';
    end;

    if self.chkbxUseFSC.Checked then
    begin
      ParamByName('Use_FSC_Claim').asString := 'Y';
    end
    else
    begin
      ParamByName('Use_FSC_Claim').asString := 'N';
    end;

    if self.chkbxUseNCA.Checked then
    begin
      ParamByName('Use_Non_Conformance').asString := 'Y';
    end
    else
    begin
      ParamByName('Use_Non_Conformance').asString := 'N';
    end;

    if self.chkbxUseSubReps.Checked then
    begin
      ParamByName('Use_Sub_Reps').asString := 'Y';
    end
    else
    begin
      ParamByName('Use_Sub_Reps').asString := 'N';
    end;

    if self.chkbxUseContracts.Checked then
    begin
      ParamByName('Use_Contract_Module').asString := 'Y';
    end
    else
    begin
      ParamByName('Use_Contract_Module').asString := 'N';
    end;

    if self.chkbxUseAcquiredCustomers.Checked then
    begin
      ParamByName('Use_Acquired_Customers').asString := 'Y';
    end
    else
    begin
      ParamByName('Use_Acquired_Customers').asString := 'N';
    end;

    if self.chkbxUseCTRLPOrdering.Checked then
    begin
      ParamByName('Use_CTRLP_Ordering').asString := 'Y';
    end
    else
    begin
      ParamByName('Use_CTRLP_Ordering').asString := 'N';
    end;

    if self.chkbxShowWIPurchaseORders.Checked then
    begin
      ParamByName('Show_WI_Purchase_Orders').asString := 'Y';
    end
    else
    begin
      ParamByName('Show_WI_Purchase_Orders').asString := 'N';
    end;

    ParamByName('Vat_Code').asInteger := DBLuCmbBxDefVat.KeyValue;

    {Set Enquiry Default actvity type}
    if dblkpEActivityType.text <> '' then
      Parambyname('Enquiry_Reminder_Activity_Type').asinteger := dblkpEActivityType.KeyValue
    else
      Parambyname('Enquiry_Reminder_Activity_Type').Clear;

    {Set Quote Default actvity type}
    if dblkpQActivityType.text <> '' then
      Parambyname('Quote_Reminder_Activity_Type').asinteger := dblkpQActivityType.KeyValue
    else
      Parambyname('Quote_Reminder_Activity_Type').Clear;

    {Set Reorder actvity type}
    if dblkpReorderActivity.text <> '' then
      Parambyname('Reorder_Activity_Type').asinteger := dblkpReorderActivity.KeyValue
    else
      Parambyname('Reorder_Activity_Type').Clear;

    {Set Proof actvity type}
    if dblkpProofActivity.text <> '' then
      Parambyname('Proof_Status_Activity_Type').asinteger := dblkpProofActivity.KeyValue
    else
      Parambyname('Proof_Status_Activity_Type').Clear;

    {Set order acknowledgement activity type}
    if dblkpOrderAckActivity.text <> '' then
      Parambyname('Order_Ack_Activity_Type').asinteger := dblkpOrderAckActivity.KeyValue
    else
      Parambyname('Order_Ack_Activity_Type').Clear;

    {Set order delivery actvity type}
    if dblkpOrderDelActivity.text <> '' then
      Parambyname('Order_Delivery_Activity_Type').asinteger := dblkpOrderDelActivity.KeyValue
    else
      Parambyname('Order_Delivery_Activity_Type').Clear;

    if DBLuCmbBxDefPrdTyp.text = '' then
      ParamByName('Product_Type').clear
    else
      ParamByName('Product_Type').asInteger := DBLuCmbBxDefPrdTyp.KeyValue;

    {Set Web2Print Unpaid product Type}
    if dblkpWebProductType.text = '' then
      ParamByName('Default_Web2Print_Product_Type').clear
    else
      ParamByName('Default_Web2Print_Product_Type').asInteger := dblkpWebProductType.KeyValue;

    {Set Web2Print Paid product Type}
    if dblkpWebProductType.text = '' then
      ParamByName('Default_Web_Paid_Product_Type').clear
    else
      ParamByName('Default_Web_Paid_Product_Type').asInteger := dblkpWebPaidProductType.KeyValue;

    Parambyname('Document_Directory').asstring := edtPOLocation.text;
    Parambyname('Job_Bag_Document_Directory').asstring := edtJobBagLocation.text;
    Parambyname('Enquiry_Document_Directory').asstring := edtEnquiryLocation.text;
    Parambyname('Quote_Document_Directory').asstring := edtQuoteLocation.text;
    Parambyname('Customer_Document_Directory').asstring := edtCustLocation.text;
    Parambyname('Supplier_Document_Directory').asstring := edtSuppLocation.text;
    Parambyname('Activity_Document_Directory').asstring := edtActivityLocation.text;
    Parambyname('Contract_Document_Directory').asstring := edtContractLocation.text;
    Parambyname('Email_Storage_Directory').asstring := edtEmailStorage.text;

    Parambyname('Sales_Order_Terms_File').asstring := edtSalesTermsDoc.text;
    Parambyname('Purchase_order_Terms_File').asstring := edtPurchaseTermsDoc.text;
    Parambyname('Studio_Price_Guide_File').asstring := edtStudioPriceListDoc.text;

    Parambyname('Analysis_Code_1_Caption').asstring := edtAnalysis1Caption.text;
    Parambyname('Analysis_Code_2_Caption').asstring := edtAnalysis2Caption.text;
    Parambyname('Analysis_Code_3_Caption').asstring := edtAnalysis3Caption.text;
    Parambyname('Analysis_Code_4_Caption').asstring := edtAnalysis4Caption.text;

    if self.chkbxFormRefReq.Checked then
      Parambyname('Form_Reference_Mandatory').asString := 'Y'
    else
      Parambyname('Form_Reference_Mandatory').asString := 'N';

    case cmbBudgetType.itemindex of
      0: Parambyname('Performance_target_type').asString := 'R';
      1: Parambyname('Performance_target_type').asString := 'C';
    end;

    ParamByName('Cash_Sales_Account_Code').asString :=
      self.edtCashSalesAcc.text;

    ParamByName('Direct_Debit_Account_ID').asString := self.edtDirectDebitID.text;
    ParamByName('Global_Invoice_Email').asString := self.edtGlobalInvoiceEmail.text;

    Parambyname('Default_WI_Email_Address').asstring := edtWIEmailAddress.Text;
    Parambyname('Default_WI_Email_Name').asstring := edtWIEmailName.Text;

    {Online Delivery Details}
    Parambyname('Online_Delivery_Description').asstring := edtDeliveryDescription.Text;
    if memDeliveryThreshold.Text = '' then
      Parambyname('Online_Delivery_Threshold').clear
    else
      Parambyname('Online_Delivery_Threshold').asfloat := StrToFloatDef(memDeliveryThreshold.Text, 0, FormatSettings);

    if memDeliveryCharge.Text = '' then
      Parambyname('Online_Delivery_Charge').clear
    else
      Parambyname('Online_Delivery_Charge').asfloat := StrToFloatDef(memDeliveryCharge.Text, 0, FormatSettings);

    if memDeliveryCost.Text = '' then
      Parambyname('Online_Delivery_Cost').clear
    else
      Parambyname('Online_Delivery_Cost').asfloat := StrToFloatDef(memDeliveryCost.Text, 0, FormatSettings);
      
    if dblkpDeliveryVat.text = '' then
      Parambyname('Online_Delivery_Vat_Code').clear
    else
      Parambyname('Online_Delivery_Vat_Code').asinteger := dblkpDeliveryVat.keyvalue;

    Parambyname('Replicate_DBAlias').asstring := cmbAliasList.text;

    {Set Quote Production defaults}
    if dblkpProcessGroup.text = '' then
      Parambyname('Default_Quote_Cost_Process_Grp').clear
    else
      Parambyname('Default_Quote_Cost_Process_Grp').asinteger := dblkpProcessGroup.keyvalue;

    if dblkpProcess.text = '' then
      Parambyname('Default_Quote_Cost_Process').clear
    else
      Parambyname('Default_Quote_Cost_Process').asinteger := dblkpProcess.keyvalue;

    Parambyname('Default_Quote_Cost_Description').asstring := edtQuoteDescription.Text;

    if trim(memQuoteCostMarkup.text) = '' then
      Parambyname('Default_Quote_Cost_markup_perc').asfloat := 0
    else
      Parambyname('Default_Quote_Cost_markup_perc').asfloat := StrToFloatDef(memQuoteCostMarkup.Text, 0, FormatSettings);
    ExecSQL;
  end;
end;

procedure TPBMaintCompanyFrm.FormActivate(Sender: TObject);
var
  iAliasList: integer;
  sgList: TStringList;
begin
  with GetCurrSQL do
  begin
    Close;
    Open;
  end;

  with GetNominalSQL do
  begin
    Close;
    Open;
  end;

  with self.qryCommission do
  begin
    active := false;
    active := true;
  end;

  with qryPayTerms do
  begin
    Close;
    Open;
  end;

  GetActivityTypes;

  QryVat.close;
  QryVat.open;

  QryOnlineVat.close;
  QryOnlineVat.open;

  QryPrdTyp.close;
  QryPrdTyp.open;

  {Open Production processes}
  with qryProcessGroup do
    begin
      Close;
      Open;
    end;

  with qryProcess do
    begin
      close;
      open;
    end;

  {Populate the Alias combo box}
  cmbAliasList.clear;
  sgList := TStringList.Create;
  try
    FDManager.GetConnectionDefNames(sgList);
    { fill a list box with alias names for the user to select from }
    for iAliasList := 0 to sgList.Count - 1 do
      if ((pos('Redeye',sgList[iAliasList]) > 0) or (pos('Redeye',sgList[iAliasList]) > 0) or
          (pos('Broker',sgList[iAliasList]) > 0) or (pos('broker',sgList[iAliasList]) > 0)) and
          (pos('ADO',sgList[iAliasList]) = 0) then
        cmbAliasList.Items.Add(sgList[iAliasList]);

    cmbAliasList.Sorted := true;
    cmbAliasList.ItemIndex := cmbAliasList.items.indexof(GetCompanySQL.fieldbyname('Replicate_DBAlias').asstring);
  finally
    sgList.Free;
  end;

  tbSettings.ActivePage := tbsAddress;
  CheckNotes(Self);
  dmBroker.ScreenAccessControl(Self,'mnuCompanyPrefs',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintCompanyFrm.SelSuppBtnClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bAllow_Upd := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.SelCode := Supplier;
    PBLUSuppFrm.SelBranch := SuppBranch;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      Supplier := PBLUSuppFrm.SelCode;
      SupplierEdit.Text := PBLUSuppFrm.SelName;
      SuppBranch := PBLUSuppFrm.SelBranch;
      BranchEdit.Text := PBLUSuppFrm.SelBranchName;
    end;
  finally
    PBLUSuppFrm.Free;
  end;
end;

procedure TPBMaintCompanyFrm.SetSuppBranch(const Value: integer);
begin
  FSuppBranch := Value;
end;

procedure TPBMaintCompanyFrm.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TPBMaintCompanyFrm.ClearBitBtnClick(Sender: TObject);
begin
  SupplierEdit.clear;
  BranchEdit.Clear;
  Supplier := 0;
  SuppBranch := 0;
end;

procedure TPBMaintCompanyFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBDelivNotesFrm.Free;
end;

procedure TPBMaintCompanyFrm.FlashDelivTimerTimer(Sender: TObject);
begin
 if bDelivNotesFlash then
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bDelivNotesFlash := (not (bDelivNotesFlash));
end;

procedure TPBMaintCompanyFrm.DelivNotesBitBtnClick(Sender: TObject);
begin
 PBDelivNotesFrm.bAllow_Upd := True;
  PBDelivNotesFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBDelivNotesFrm.bMemoUpd) then
        begin
        PBDelivNotesFrm.UpdMemoData(Self) ;
        With UpdDelivNotesOnlySQL do
                begin
                Close ;
                if PBDelivNotesFrm.iNarr = 0 then
                        ParamByName('Delivery_Narrative').Clear
                else
                        ParamByName('Delivery_Narrative').AsInteger := PBDelivNotesFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintCompanyFrm.CheckNotes(Sender: TObject);
begin
  if PBDelivNotesFrm.CheckNotes(Self) then
  begin
    FlashDelivTimer.Enabled := True;
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashDelivTimer.Enabled := False;
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;

  if trim(sCreditTermsText) <> '' then
  begin
    FlashCreditTimer.Enabled := True;
    btnCreditTermsNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashCreditTimer.Enabled := False;
    btnCreditTermsNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;

  if trim(sPaymentText) <> '' then
  begin
    FlashPayTimer.Enabled := True;
    btnPaymentNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashPayTimer.Enabled := False;
    btnPaymentNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;

  if trim(sSupplierTerms) <> '' then
  begin
    FlashTermsTimer.Enabled := True;
    btnSupplierTerms.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTermsTimer.Enabled := False;
    btnSupplierTerms.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintCompanyFrm.btbtnClearProdTypeClick(Sender: TObject);
begin
  self.DBLuCmbBxDefPrdTyp.KeyValue := 0;
end;

procedure TPBMaintCompanyFrm.btnBrowseClick(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtPOLocation.Text;
    if DirDlg.Execute then
      edtPOLocation.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintCompanyFrm.JobBagsCheckBoxClick(Sender: TObject);
begin
  rdgrpJobBag.enabled := jobBagsCheckBox.Checked;
end;

procedure TPBMaintCompanyFrm.chkbxAuthorisePOClick(Sender: TObject);
begin
  if not chkbxAuthorisePO.checked then
    begin
      memCreditLimit.Text := '0.00';
      memCreditLimit.enabled := false;
    end
  else
    memCreditLimit.enabled := true;
end;

procedure TPBMaintCompanyFrm.memCreditLimitExit(Sender: TObject);
begin
  if memCreditLimit.Text <> '' then
  begin
    try
      memCreditLimit.Text := FormatFloat('######0.00', StrToFloatDef(memCreditLimit.Text, 0, FormatSettings))
    except
      MessageDlg('Invalid value', mtError, [mbOK], 0);
      memCreditLimit.SetFocus;
    end;
  end;
end;

procedure TPBMaintCompanyFrm.Button1Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtEnquiryLocation.Text;
    if DirDlg.Execute then
      edtEnquiryLocation.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintCompanyFrm.Button2Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtJobBagLocation.Text;
    if DirDlg.Execute then
      edtJobBagLocation.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintCompanyFrm.Button3Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtQuoteLocation.Text;
    if DirDlg.Execute then
      edtQuoteLocation.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;

end;

procedure TPBMaintCompanyFrm.Button4Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtCustLocation.Text;
    if DirDlg.Execute then
      edtCustLocation.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintCompanyFrm.Button5Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtSuppLocation.Text;
    if DirDlg.Execute then
      edtSuppLocation.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintCompanyFrm.btnPaymentNotesClick(Sender: TObject);
var
  PBDBInvMemoFrm: TPBDBMemoFrm;
begin
  PBDBInvMemofrm := TPBDBMemoFrm.create(self);
  try
    PBDBInvMemoFrm.Datamemo.text := sPaymentText;
    PBDBInvMemoFrm.bAllow_Upd := true;
    PBDBInvMemoFrm.ShowModal;
    sPaymentText := PBDBInvMemofrm.Datamemo.text;
  finally
    PBDBInvMemofrm.free;
  end;
  CheckNotes(Self);
end;

procedure TPBMaintCompanyFrm.FlashPayTimerTimer(Sender: TObject);
begin
 if bPaymentNotesFlash then
    btnPaymentNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnPaymentNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bPaymentNotesFlash := (not (bPaymentNotesFlash));

end;

function TPBMaintCompanyFrm.UpdateEmailEnquiry: Integer;
var
  Notes: TNarrative;
begin
  Notes := TNarrative.Create;
  try
    Notes.DbKey := iEnqText;
    Notes.DataInfo := memEmailEnquiry.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TPBMaintCompanyFrm.UpdateEmailPO: Integer;
var
  Notes: TNarrative;
begin
  Notes := TNarrative.Create;
  try
    Notes.DbKey := iPOText;
    Notes.DataInfo := memEmailPO.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TPBMaintCompanyFrm.UpdateEmailAck: Integer;
var
  Notes: TNarrative;
begin
  Notes := TNarrative.Create;
  try
    Notes.DbKey := iAckText;
    Notes.DataInfo := memEmailAck.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TPBMaintCompanyFrm.UpdateEmailQuote: Integer;
var
  Notes: TNarrative;
begin
  Notes := TNarrative.Create;
  try
    Notes.DbKey := iQuoteText;
    Notes.DataInfo := memEmailQuote.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TPBMaintCompanyFrm.UpdateEmailInvoice: Integer;
var
  Notes: TNarrative;
begin
  Notes := TNarrative.Create;
  try
    Notes.DbKey := iInvoiceText;
    Notes.DataInfo := memEmailInvoice.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TPBMaintCompanyFrm.UpdateEmailOrdersDue: Integer;
var
  Notes: TNarrative;
begin
  Notes := TNarrative.Create;
  try
    Notes.DbKey := iOrdersDueText;
    Notes.DataInfo := memEmailOrdersDue.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TPBMaintCompanyFrm.UpdateEmailProformaInvoice: Integer;
var
  Notes: TNarrative;
begin
  Notes := TNarrative.Create;
  try
    Notes.DbKey := iProformaInvoiceText;
    Notes.DataInfo := memEmailProformaInvoice.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

procedure TPBMaintCompanyFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit};
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintCompanyFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;
procedure TPBMaintCompanyFrm.Button6Click(Sender: TObject);
begin
  opndlgTerms.Files.Clear;
  opndlgTerms.FileName := edtSalesTermsDoc.Text;
  if opndlgTerms.Execute then
    begin
      if opndlgTerms.Files.Count > 0 then
      begin
        edtSalesTermsDoc.Text := opndlgTerms.Files[opndlgTerms.Files.Count - 1];
      end;
    end;
end;

procedure TPBMaintCompanyFrm.Button7Click(Sender: TObject);
begin
  opndlgTerms.Files.Clear;
  opndlgTerms.FileName := edtPurchaseTermsDoc.Text;
  if opndlgTerms.Execute then
    begin
      if opndlgTerms.Files.Count > 0 then
      begin
        edtPurchaseTermsDoc.Text := opndlgTerms.Files[opndlgTerms.Files.Count - 1];
      end;
    end;
end;

procedure TPBMaintCompanyFrm.BitBtn2Click(Sender: TObject);
begin
  self.dblkpWebProductType.KeyValue := 0;
end;

procedure TPBMaintCompanyFrm.BitBtn3Click(Sender: TObject);
begin
  self.dblkpWebPaidProductType.KeyValue := 0;
end;

procedure TPBMaintCompanyFrm.BitBtn4Click(Sender: TObject);
begin
  self.cmbAliasList.itemindex := -1;
end;

procedure TPBMaintCompanyFrm.FlashTermsTimerTimer(Sender: TObject);
begin
  if bSupplierTermsFlash then
    btnSupplierTerms.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnSupplierTerms.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bSupplierTermsFlash := (not (bSupplierTermsFlash));

end;

procedure TPBMaintCompanyFrm.btnSupplierTermsClick(Sender: TObject);
var
  PBDBInvMemoFrm: TPBDBMemoFrm;
begin
  PBDBInvMemofrm := TPBDBMemoFrm.create(self);
  try
    PBDBInvMemoFrm.Datamemo.text := sSupplierTerms;
    PBDBInvMemoFrm.bAllow_Upd := true;
    PBDBInvMemoFrm.ShowModal;
    sSupplierTerms := PBDBInvMemofrm.Datamemo.text;
  finally
    PBDBInvMemofrm.free;
  end;
  CheckNotes(Self);
end;

procedure TPBMaintCompanyFrm.BitBtn5Click(Sender: TObject);
begin
  self.PayTermsDBLookupComboBox.keyvalue := 0;
end;

procedure TPBMaintCompanyFrm.btnCreditTermsNotesClick(Sender: TObject);
var
  PBDBInvMemoFrm: TPBDBMemoFrm;
begin
  PBDBInvMemofrm := TPBDBMemoFrm.create(self);
  try
    PBDBInvMemoFrm.Datamemo.text := sCreditTermsText;
    PBDBInvMemoFrm.bAllow_Upd := true;
    PBDBInvMemoFrm.ShowModal;
    sCreditTermsText := PBDBInvMemofrm.Datamemo.text;
  finally
    PBDBInvMemofrm.free;
  end;
  CheckNotes(Self);
end;

procedure TPBMaintCompanyFrm.FlashCreditTimerTimer(Sender: TObject);
begin
 if bCreditTermsFlash then
    btnCreditTermsNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnCreditTermsNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bCreditTermsFlash := (not (bCreditTermsFlash));

end;

procedure TPBMaintCompanyFrm.btnEmailHelpClick(Sender: TObject);
begin
  PBParamsHelpfrm := TPBParamsHelpfrm.create(self);

  try
    PBParamsHelpfrm.showmodal;
  finally
    PBParamsHelpfrm.free;
  end;

end;

procedure TPBMaintCompanyFrm.chkbxUseReorderReminderClick(Sender: TObject);
begin
  spnReorderReminderInterval.Enabled := (Sender as TCheckbox).Checked;
  memReorderValue.Enabled := (Sender as TCheckbox).Checked;
end;

procedure TPBMaintCompanyFrm.memReOrderValueExit(Sender: TObject);
begin
  if memReorderValue.Text <> '' then
  begin
    try
      memReorderValue.Text := FormatFloat('######0.00', StrToFloatDef(memReorderValue.Text, 0, FormatSettings))
    except
      MessageDlg('Invalid value', mtError, [mbOK], 0);
      memReorderValue.SetFocus;
    end;
  end;

end;

procedure TPBMaintCompanyFrm.ReopenDatasets(Dataset: TDataSet);
begin
  Dataset.Close;
  Dataset.Open
end;

procedure TPBMaintCompanyFrm.btnActivityTypeClick(Sender: TObject);
begin
  PBLUActivityTypeFrm := TPBLUActivityTypeFrm.Create(Self);
  try
    PBLUActivityTypeFrm.bIs_Lookup := False;
    PBLUActivityTypeFrm.bAllow_Upd := True;
    PBLUActivityTypeFrm.ShowModal;
  finally
    PBLUActivityTypeFrm.Free;
  end;

  GetActivityTypes;
end;

procedure TPBMaintCompanyFrm.GetActivityTypes;
begin
  ReopenDatasets(qryActivityType);
  ReopenDatasets(qryActivityTypeQuotRem);
  ReopenDatasets(qryActivityTypeProofStActiv);
  ReopenDatasets(qryActivityTypeReorderAct);
  ReopenDatasets(qryActivityTypeOrdAct);
  ReopenDatasets(qryActivityTypeDelivAct);
end;

procedure TPBMaintCompanyFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;
  CCSCommon.LoadFormLayout(TfrmpbMainMenu.AppIniFile, self);
end;

procedure TPBMaintCompanyFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintCompanyFrm.Button8Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtActivityLocation.Text;
    if DirDlg.Execute then
      edtActivityLocation.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintCompanyFrm.CallMaintScreen(Module: integer);
begin
  PBMaintCompanyDocStructureFrm :=  TPBMaintCompanyDocStructureFrm.create(self);
  try
    PBMaintCompanyDocStructureFrm.module := Module;
    PBMaintCompanyDocStructureFrm.showmodal;
  finally
    PBMaintCompanyDocStructureFrm.free
  end;
end;

procedure TPBMaintCompanyFrm.btnEnquiryStructureClick(Sender: TObject);
begin
  CallMaintScreen((Sender as TButton).Tag);
end;

procedure TPBMaintCompanyFrm.Button15Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtEmailStorage.Text;
    if DirDlg.Execute then
      edtEmailStorage.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintCompanyFrm.memQuoteCostMarkupExit(Sender: TObject);
begin
  if (Sender as TMemo).Text <> '' then
  begin
    try
      (Sender as TMemo).Text := FormatFloat('######0.00', StrToFloatDef((Sender as TMemo).Text, 0, FormatSettings))
    except
      MessageDlg('Invalid value', mtError, [mbOK], 0);
      (Sender as TMemo).SetFocus;
    end;
  end;
end;

procedure TPBMaintCompanyFrm.BitBtn6Click(Sender: TObject);
begin
  self.dblkpProcessGroup.keyvalue := 0;
  self.dblkpProcess.keyvalue := 0;
end;

procedure TPBMaintCompanyFrm.btnProdTypeClick(Sender: TObject);
begin
  PBLUProcessFrm := TPBLUProcessFrm.Create(Self);
  try
    PBLUProcessFrm.bIs_Lookup := True;
    PBLUProcessFrm.bAllow_Upd := True;
    PBLUProcessFrm.SelCode := dblkpProcess.KeyValue;
    PBLUProcessFrm.ProcessGroup := dblkpProcessGroup.KeyValue;
    PBLUProcessFrm.ShowModal;
    if PBLUProcessFrm.Selected then
    begin
      dblkpProcess.KeyValue := PBLUProcessFrm.SelCode;
    end;
  finally
    PBLUProcessFrm.Free;
  end;
end;

procedure TPBMaintCompanyFrm.Button16Click(Sender: TObject);
begin
  PBLUProcessGroupFrm := TPBLUProcessGroupFrm.Create(Self);
  try
    PBLUProcessGroupFrm.bIs_Lookup := True;
    PBLUProcessGroupFrm.bAllow_Upd := True;
    PBLUProcessGroupFrm.SelCode := dblkpProcessGroup.KeyValue;
    PBLUProcessGroupFrm.ShowModal;
    if PBLUProcessGroupFrm.Selected then
    begin
      dblkpProcessGroup.KeyValue := PBLUProcessGroupFrm.SelCode;
    end;
  finally
    PBLUProcessGroupFrm.Free;
  end;

end;

procedure TPBMaintCompanyFrm.Button17Click(Sender: TObject);
begin
  opndlgTerms.Files.Clear;
  opndlgTerms.FileName := edtStudioPriceListDoc.Text;
  if opndlgTerms.Execute then
    begin
      if opndlgTerms.Files.Count > 0 then
      begin
        edtStudioPriceListDoc.Text := opndlgTerms.Files[opndlgTerms.Files.Count - 1];
      end;
    end;
end;

procedure TPBMaintCompanyFrm.Button18Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtContractLocation.Text;
    if DirDlg.Execute then
      edtContractLocation.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

end.
