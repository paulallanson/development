unit PBMaintCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, ComCtrls, pbCustomerDM,
  Grids, DBGrids, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Menus, ShellAPI, IniFiles, StrUtils, Spin, printers,
  ImgList, ToolWin, taoMapi, AxCtrls, Clipbrd, pbEnqsdm,
  pbOrdersdm, pbJobBagDM, pbJobsDm, pbStockDm, pbSalesInvoiceDM, stpickobject,
  pbQuotesDM, pbActivityDM, PBDBMemo, PBDelivNotes, System.ImageList,
  FireDAC.Stan.Param;

type
  TPBMaintCustFrm = class(TForm)
    FlashTimer: TTimer;
    FlashDelivTimer: TTimer;
    pgCustomer: TPageControl;
    tbDetails: TTabSheet;
    tbOptions: TTabSheet;
    tbStock: TTabSheet;
    tbDocuments: TTabSheet;
    pmnuDocuments: TPopupMenu;
    Email1: TMenuItem;
    svDlgOfficeDoc: TSaveDialog;
    Panel1: TPanel;
    Label33: TLabel;
    edtLogoLocation: TEdit;
    Button4: TButton;
    stsbrDetails: TStatusBar;
    ToolBar1: TToolBar;
    btnExcel: TToolButton;
    btnWord: TToolButton;
    btnEmail: TToolButton;
    btnAttach: TToolButton;
    lstvwDocuments: TListView;
    imgDocuments: TImageList;
    imgIcons: TImageList;
    DocOpenDialog: TOpenDialog;
    Adddocument1: TMenuItem;
    pmnuOpen: TMenuItem;
    pnlFooter: TPanel;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    ActiveChkBox: TCheckBox;
    lblCreatedOn: TLabel;
    pnlHeader: TPanel;
    Label19: TLabel;
    NameEdit: TEdit;
    DelivNotesBitBtn: TBitBtn;
    NotesBitBtn: TBitBtn;
    pnlGeneralDetails: TPanel;
    grpbxAnalysis: TGroupBox;
    Label1: TLabel;
    lblRevenueCentre: TLabel;
    lblStatus: TLabel;
    Label45: TLabel;
    lblAnalysis1: TLabel;
    lblAnalysis2: TLabel;
    TypeDBLUCB: TDBLookupComboBox;
    CustTypeMaintBitBtn: TBitBtn;
    btnRevenueCentre: TBitBtn;
    dblkpRevenueCentre: TDBLookupComboBox;
    dblkpCustStatus: TDBLookupComboBox;
    dblkpLevelOfImportance: TDBLookupComboBox;
    btnRevenueCentreClear: TBitBtn;
    btnLevelOfImportance: TBitBtn;
    edtAnalysis1: TEdit;
    edtAnalysis2: TEdit;
    grpbxDetails: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label27: TLabel;
    TownEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    PhoneEdit: TEdit;
    FaxEdit: TEdit;
    EMailEdit: TEdit;
    PostCodeEdit: TEdit;
    CountyEdit: TEdit;
    dblkpCountry: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    btnCountryClear: TBitBtn;
    BitBtn7: TBitBtn;
    CreateWordDocument1: TMenuItem;
    CreateExcelDocument1: TMenuItem;
    pmnuDelete: TMenuItem;
    N1: TMenuItem;
    pmnuPaste: TMenuItem;
    N2: TMenuItem;
    pmnuSelectAll: TMenuItem;
    imglstjobs: TImageList;
    tbQuotes: TTabSheet;
    tbEnquiries: TTabSheet;
    tbOrders: TTabSheet;
    tbJobs: TTabSheet;
    tbInvoices: TTabSheet;
    tbBranches: TTabSheet;
    tbActivity: TTabSheet;
    stsBrEnqDetails: TStatusBar;
    CoolBar1: TCoolBar;
    tbrEnquiries: TToolBar;
    btnEnqQuick: TToolButton;
    btnEnqAdd: TToolButton;
    btnEnqChange: TToolButton;
    btnEnqCopy: TToolButton;
    ToolButton4: TToolButton;
    btnEnqPrint: TToolButton;
    btnRepliesSpacer: TToolButton;
    btnEnqReplies: TToolButton;
    btnEnqPricing: TToolButton;
    btnEnqQuote: TToolButton;
    btnEnqConvert: TToolButton;
    dbgEnquiryDetails: TDBGrid;
    Panel2: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    edtEnqSearch: TEdit;
    edtEnqNumber: TEdit;
    btnSearch: TBitBtn;
    imgEnquiries: TImageList;
    tmrSearch: TTimer;
    stsBrOrderDetails: TStatusBar;
    Panel3: TPanel;
    Label48: TLabel;
    Label49: TLabel;
    edtOrderSearch: TEdit;
    edtOrderNumber: TEdit;
    chkbxShowUnauthorised: TCheckBox;
    BitBtn9: TBitBtn;
    imglstOrders: TImageList;
    CoolBar2: TCoolBar;
    PageScroller1: TPageScroller;
    tbrOrders: TToolBar;
    btnOrderAdd: TToolButton;
    btnOrderChange: TToolButton;
    btnOrderRepeat: TToolButton;
    btnOrderDelete: TToolButton;
    btnOrderPrint: TToolButton;
    btnOrderRequote: TToolButton;
    btnOrderHistory: TToolButton;
    btnOrderSeparator1: TToolButton;
    btnOrderAllocatefnc: TToolButton;
    btnOrderPicking: TToolButton;
    ToolButton3: TToolButton;
    btnOrderProofs: TToolButton;
    btnOrderDeliveriesSpacer: TToolButton;
    btnOrderDeliveries: TToolButton;
    btnOrderHold: TToolButton;
    dbgOrderDetails: TDBGrid;
    stsbrJobDetails: TStatusBar;
    CoolBar3: TCoolBar;
    tbrJobs: TToolBar;
    btnJobAdd: TToolButton;
    btnJobChange: TToolButton;
    btnJobRepeat: TToolButton;
    btnJobDelete: TToolButton;
    btnJobPrint: TToolButton;
    ToolButton2: TToolButton;
    btnJobDraft: TToolButton;
    dbgJobDetails: TDBGrid;
    Panel4: TPanel;
    Label50: TLabel;
    edtJobSearch: TEdit;
    Panel5: TPanel;
    Label51: TLabel;
    edtJobNumber: TEdit;
    BitBtn10: TBitBtn;
    stsbrStockDetails: TStatusBar;
    Panel7: TPanel;
    CoolBar4: TCoolBar;
    PageScroller2: TPageScroller;
    tbrStock: TToolBar;
    btnStockChange: TToolButton;
    btnStockLabels: TToolButton;
    ToolButton1: TToolButton;
    btnStockLevels: TToolButton;
    btnStockEnquiry: TToolButton;
    dbgStockDetails: TDBGrid;
    Panel8: TPanel;
    Label52: TLabel;
    edtStockSearch: TEdit;
    Panel9: TPanel;
    chkbxShowNotinUse: TCheckBox;
    imglstMaint: TImageList;
    stsbrInvoiceDetails: TStatusBar;
    CoolBar5: TCoolBar;
    PageScroller3: TPageScroller;
    tbrInvoices: TToolBar;
    btnInvoiceChange: TToolButton;
    btnInvoiceReprint: TToolButton;
    dbgInvoiceDetails: TDBGrid;
    Panel10: TPanel;
    Label53: TLabel;
    edtInvoiceSearch: TEdit;
    Panel11: TPanel;
    Label54: TLabel;
    edtInvoiceNumber: TEdit;
    chkbxShowInactive: TCheckBox;
    imglstFunctions: TImageList;
    pmnStockEnquiry: TPopupMenu;
    StockMovements2: TMenuItem;
    Numbersequences1: TMenuItem;
    BinLocations1: TMenuItem;
    SalesOrdersCallOffs1: TMenuItem;
    ProductionOrders2: TMenuItem;
    PurchaseOrders2: TMenuItem;
    pmnOrderAdd: TPopupMenu;
    btnFromPO: TMenuItem;
    btnFromSO: TMenuItem;
    pmnOrderPicking: TPopupMenu;
    btnPrintPickNote: TMenuItem;
    btnConfirmPick: TMenuItem;
    pmnOrderProofs: TPopupMenu;
    Approvalform1: TMenuItem;
    btnStatus1: TMenuItem;
    pmnOrderAllocate: TPopupMenu;
    mnuAllocate: TMenuItem;
    mnuDeAllocate: TMenuItem;
    stsBrQuoteDetails: TStatusBar;
    CoolBar6: TCoolBar;
    tbrQuotes: TToolBar;
    btnQuoteAdd: TToolButton;
    btnQuoteChange: TToolButton;
    btnQuoteCopy: TToolButton;
    btnQuoteReQuote: TToolButton;
    btnQuoteDelete: TToolButton;
    btnQuotePrint: TToolButton;
    ToolButton5: TToolButton;
    btnQuoteConvert: TToolButton;
    dbgQuoteDetails: TDBGrid;
    imglstButtons: TImageList;
    Panel12: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    edtQuoteSearch: TEdit;
    edtQuoteNumber: TEdit;
    BitBtn11: TBitBtn;
    pnlBranchTop: TPanel;
    Panel13: TPanel;
    Label57: TLabel;
    edtBranchName: TEdit;
    chkbxActiveBranchOnly: TCheckBox;
    CoolBar8: TCoolBar;
    ToolBar9: TToolBar;
    btnBranchAdd: TToolButton;
    btnBranchChange: TToolButton;
    btnBranchDelete: TToolButton;
    pnlContacts: TPanel;
    dbgContactDetails: TDBGrid;
    Panel14: TPanel;
    Label58: TLabel;
    edtContactName: TEdit;
    chkbxActiveContactOnly: TCheckBox;
    Panel15: TPanel;
    Label59: TLabel;
    pnlContactFunctions: TPanel;
    btnContactAdd: TBitBtn;
    btnContactChange: TBitBtn;
    btnContactDelete: TBitBtn;
    dbgBranchDetails: TDBGrid;
    btnContactOnline: TBitBtn;
    btnContactMove: TBitBtn;
    Button2: TButton;
    pnlActivityDetails: TPanel;
    pnlActivityList: TPanel;
    CoolBar7: TCoolBar;
    ToolBar8: TToolBar;
    btnActivityAdd: TToolButton;
    btnActivityChange: TToolButton;
    btnActivityDelete: TToolButton;
    Panel16: TPanel;
    Label60: TLabel;
    Edit1: TEdit;
    dbgActivityDetails: TDBGrid;
    Panel17: TPanel;
    Label61: TLabel;
    Panel18: TPanel;
    memNarrative: TMemo;
    Panel19: TPanel;
    GroupBox2: TGroupBox;
    lblFormRefPref: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtProdPrefix: TEdit;
    DBGrid1: TDBGrid;
    cmbCallOffDeliveryNote: TComboBox;
    chkbxProductPrefix: TCheckBox;
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    EdtEmailOrder: TEdit;
    edtConsumerCode: TEdit;
    edtContractRef: TEdit;
    grpbxEInvoicing: TGroupBox;
    Label17: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label32: TLabel;
    lblSystem: TLabel;
    edtClientCode: TEdit;
    rdgrpProtocol: TRadioGroup;
    edtSiteURL: TEdit;
    edtUsername: TEdit;
    edtPassword: TEdit;
    dblkpSystem: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    chkbxEInvoicing: TCheckBox;
    chkbxUsePrintEvolved: TCheckBox;
    chkbxUseKingfieldOpips: TCheckBox;
    grpbxOnline: TGroupBox;
    chkbxCreateBranchOnline: TCheckBox;
    chkbxShowAvailableStock: TCheckBox;
    ChkBxOnLnOrd: TCheckBox;
    tbCrossSelling: TTabSheet;
    Panel6: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel25: TPanel;
    Label64: TLabel;
    memCategoryNarrative: TMemo;
    dbgCategoryDetails: TDBGrid;
    Panel22: TPanel;
    Button1: TButton;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    btnCategoryNotes: TButton;
    Button8: TButton;
    Panel23: TPanel;
    Edit2: TEdit;
    Label62: TLabel;
    Edit3: TEdit;
    Label63: TLabel;
    Label65: TLabel;
    Edit4: TEdit;
    Label66: TLabel;
    tbFinancials: TTabSheet;
    pnlInvoiceDetails: TPanel;
    grpbxInvoicing: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label10: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label34: TLabel;
    BitBtn5: TBitBtn;
    edtInvToContact: TEdit;
    IntrastatDBLookupComboBox: TDBLookupComboBox;
    VATRefEdit: TEdit;
    DefCurrDBLookupComboBox: TDBLookupComboBox;
    rdgrpCostCentre: TRadioGroup;
    ProspectComboBox: TComboBox;
    DefVATDBLookupComboBox: TDBLookupComboBox;
    VatMaintBitBtn: TBitBtn;
    btnDefaultCurrencyClear: TBitBtn;
    chkbxDisplayDiscounts: TCheckBox;
    SettDiscMemo: TMemo;
    SettDaysMemo: TMemo;
    memPrepayBalance: TMemo;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    edtInvToBranch: TEdit;
    edtInvToCustomer: TEdit;
    pnlCreditDetails: TPanel;
    grpbxCredit: TGroupBox;
    Label5: TLabel;
    Label30: TLabel;
    Label3: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lblLastCreditCheck: TLabel;
    Label25: TLabel;
    lblDirectDebit: TLabel;
    Label9: TLabel;
    CredAvailMemo: TMemo;
    spnCreditScore: TSpinEdit;
    rdgrpCreditRating: TRadioGroup;
    edtLastReturnDate: TEdit;
    btnLastReturnDate: TBitBtn;
    edtAccLodgedDate: TEdit;
    btnAccLodgedDate: TBitBtn;
    edtAccountsFiledDate: TEdit;
    btnAccountsFiledDate: TBitBtn;
    edtAccRefDate: TEdit;
    memIssCapital: TMemo;
    dblkpCompanyType: TDBLookupComboBox;
    edtSICCode: TEdit;
    BitBtn8: TBitBtn;
    dblkpPaymentTerms: TDBLookupComboBox;
    btnTerms: TBitBtn;
    BitBtn4: TBitBtn;
    DDCodeEdit: TEdit;
    grpbxAccountCode: TGroupBox;
    Label11: TLabel;
    AccCodeEdit: TEdit;
    dbgAccountCodes: TDBGrid;
    chkbxInvUpFrnt: TCheckBox;
    chkbxConverttoCustomer: TCheckBox;
    pnlHOContacts: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    CoolBar9: TCoolBar;
    ToolBar2: TToolBar;
    btnHOContactAdd: TToolButton;
    btnHOContactChange: TToolButton;
    btnHOContactDelete: TToolButton;
    pnlContactDetails: TPanel;
    Panel31: TPanel;
    dblstContactCategories: TDBListBox;
    Panel28: TPanel;
    Panel29: TPanel;
    dbgHOContactDetails: TDBGrid;
    Panel30: TPanel;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    DBContactText: TDBText;
    DBCPhoneText: TDBText;
    DBCMobileText: TDBText;
    Label67: TLabel;
    DBCStatusText: TDBText;
    Label68: TLabel;
    DBCEmailText: TDBText;
    btnHOContactOnline: TToolButton;
    btnHOContactEmail: TToolButton;
    btnEnqDecline: TToolButton;
    edtInvToContactEmail: TEdit;
    Label69: TLabel;
    lblAnalysis3: TLabel;
    lblAnalysis4: TLabel;
    edtAnalysis3: TEdit;
    edtAnalysis4: TEdit;
    grpbxGDPR: TGroupBox;
    chkbxGDPRLetterSent: TCheckBox;
    chkbxGDPRSigned: TCheckBox;
    edtdateGDPRSigned: TEdit;
    btnDateGDPRSigned: TBitBtn;
    lblGDPRSignedOperatorName: TLabel;
    CredStatDBLCB: TDBLookupComboBox;
    CredLimMemo: TMemo;
    GroupBox4: TGroupBox;
    Label70: TLabel;
    memQuoteCostMarkup: TMemo;
    chkbxOverrideCostCharges: TCheckBox;
    chkbxAcquiredCompany: TCheckBox;
    chkbxCTRLPCustomer: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure TypeDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SettDaysMemoExit(Sender: TObject);
    procedure SettDiscMemoExit(Sender: TObject);
    procedure CredLimMemoExit(Sender: TObject);
    procedure ShowCustName(Sender: TObject);
    procedure ShowBranchName(Sender: TObject);
    procedure ShowContactName(Sender: TObject);
    procedure InvCustBtnClick(Sender: TObject);
    procedure InvToBranchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CountryClearBitBtnClick(Sender: TObject);
    procedure CredAvailMemoExit(Sender: TObject);
    procedure DefCurrClearBitBtnClick(Sender: TObject);
    procedure AccCodeEditExit(Sender: TObject);
    procedure AccCodeEditEnter(Sender: TObject);
    procedure DelivNotesBitBtnClick(Sender: TObject);
    procedure FlashDelivTimerTimer(Sender: TObject);
    procedure VATBitBtnClick(Sender: TObject);
    procedure DefVATDBLookupComboBoxClick(Sender: TObject);
    procedure VatMaintBitBtnClick(Sender: TObject);
    procedure CustTypeMaintBitBtnClick(Sender: TObject);
    procedure PostCodeEditChange(Sender: TObject);
    procedure dblkpCustStatusClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtProdPrefixChange(Sender: TObject);
    procedure chkbxEInvoicingClick(Sender: TObject);
    procedure dblkpSystemClick(Sender: TObject);
    procedure pmnuDocumentsPopup(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure mnuDocOpenClick(Sender: TObject);
    procedure dbgDocumentsDblClick(Sender: TObject);
    procedure mnuDocChangeClick(Sender: TObject);
    procedure mnuDocDeleteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnTermsClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ChkBxOnLnOrdClick(Sender: TObject);
    procedure memPrepayBalanceExit(Sender: TObject);
    procedure btnRevenueCentreClearClick(Sender: TObject);
    procedure btnRevenueCentreClick(Sender: TObject);
    procedure dblkpPaymentTermsClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure NameEditExit(Sender: TObject);
    procedure btnLastReturnDateClick(Sender: TObject);
    procedure edtLastReturnDateExit(Sender: TObject);
    procedure btnAccLodgedDateClick(Sender: TObject);
    procedure btnAccountsFiledDateClick(Sender: TObject);
    procedure AccCodeEditChange(Sender: TObject);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure btnWordClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnLevelOfImportanceClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure tbEnquiriesShow(Sender: TObject);
    procedure edtEnqSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure btnEnqQuickClick(Sender: TObject);
    procedure btnEnqAddClick(Sender: TObject);
    procedure btnEnqChangeClick(Sender: TObject);
    procedure btnEnqCopyClick(Sender: TObject);
    procedure btnEnqPrintClick(Sender: TObject);
    procedure edtEnqNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnEnqRepliesClick(Sender: TObject);
    procedure btnEnqPricingClick(Sender: TObject);
    procedure btnEnqQuoteClick(Sender: TObject);
    procedure btnEnqConvertClick(Sender: TObject);
    procedure tbOrdersShow(Sender: TObject);
    procedure edtOrderSearchChange(Sender: TObject);
    procedure dbgEnquiryDetailsDblClick(Sender: TObject);
    procedure btnOrderAddClick(Sender: TObject);
    procedure btnOrderChangeClick(Sender: TObject);
    procedure btnOrderRepeatClick(Sender: TObject);
    procedure btnOrderDeleteClick(Sender: TObject);
    procedure btnOrderPrintClick(Sender: TObject);
    procedure btnOrderRequoteClick(Sender: TObject);
    procedure btnOrderHistoryClick(Sender: TObject);
    procedure btnOrderDeliveriesClick(Sender: TObject);
    procedure btnOrderHoldClick(Sender: TObject);
    procedure tbJobsShow(Sender: TObject);
    procedure edtJobSearchChange(Sender: TObject);
    procedure edtOrderNumberKeyPress(Sender: TObject; var Key: Char);
    procedure edtJobNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnJobAddClick(Sender: TObject);
    procedure btnJobChangeClick(Sender: TObject);
    procedure btnJobRepeatClick(Sender: TObject);
    procedure btnJobDeleteClick(Sender: TObject);
    procedure btnJobPrintClick(Sender: TObject);
    procedure btnJobDraftClick(Sender: TObject);
    procedure tbStockShow(Sender: TObject);
    procedure edtStockSearchChange(Sender: TObject);
    procedure tbInvoicesShow(Sender: TObject);
    procedure edtInvoiceSearchChange(Sender: TObject);
    procedure btnInvoiceChangeClick(Sender: TObject);
    procedure btnInvoiceReprintClick(Sender: TObject);
    procedure dbgInvoiceDetailsDblClick(Sender: TObject);
    procedure dbgInvoiceDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edtInvoiceNumberKeyPress(Sender: TObject; var Key: Char);
    procedure tbInvoicesExit(Sender: TObject);
    procedure btnStockChangeClick(Sender: TObject);
    procedure btnStockLabelsClick(Sender: TObject);
    procedure btnStockLevelsClick(Sender: TObject);
    procedure StockMovements2Click(Sender: TObject);
    procedure Numbersequences1Click(Sender: TObject);
    procedure BinLocations1Click(Sender: TObject);
    procedure SalesOrdersCallOffs1Click(Sender: TObject);
    procedure ProductionOrders2Click(Sender: TObject);
    procedure PurchaseOrders2Click(Sender: TObject);
    procedure chkbxShowNotinUseClick(Sender: TObject);
    procedure tbStockExit(Sender: TObject);
    procedure dbgStockDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgStockDetailsDblClick(Sender: TObject);
    procedure dbgJobDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure tbJobsExit(Sender: TObject);
    procedure btnOrderAddMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFromPOClick(Sender: TObject);
    procedure btnFromSOClick(Sender: TObject);
    procedure mnuAllocateClick(Sender: TObject);
    procedure mnuDeAllocateClick(Sender: TObject);
    procedure btnPrintPickNoteClick(Sender: TObject);
    procedure btnConfirmPickClick(Sender: TObject);
    procedure Approvalform1Click(Sender: TObject);
    procedure btnStatus1Click(Sender: TObject);
    procedure pmnOrderAllocatePopup(Sender: TObject);
    procedure dbgOrderDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure chkbxShowUnauthorisedClick(Sender: TObject);
    procedure tbOrdersExit(Sender: TObject);
    procedure dbgOrderDetailsDblClick(Sender: TObject);
    procedure tbEnquiriesExit(Sender: TObject);
    procedure dbgEnquiryDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edtQuoteSearchChange(Sender: TObject);
    procedure dbgQuoteDetailsDblClick(Sender: TObject);
    procedure btnQuoteChangeClick(Sender: TObject);
    procedure btnQuoteAddClick(Sender: TObject);
    procedure btnQuotePrintClick(Sender: TObject);
    procedure btnQuoteConvertClick(Sender: TObject);
    procedure edtQuoteNumberKeyPress(Sender: TObject; var Key: Char);
    procedure tbQuotesShow(Sender: TObject);
    procedure btnQuoteCopyClick(Sender: TObject);
    procedure tbQuotesExit(Sender: TObject);
    procedure btnQuoteDeleteClick(Sender: TObject);
    procedure btnQuoteReQuoteClick(Sender: TObject);
    procedure tbBranchesShow(Sender: TObject);
    procedure chkbxActiveBranchOnlyClick(Sender: TObject);
    procedure edtBranchNameChange(Sender: TObject);
    procedure dbgBranchDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure tbBranchesExit(Sender: TObject);
    procedure edtContactNameChange(Sender: TObject);
    procedure chkbxActiveContactOnlyClick(Sender: TObject);
    procedure btnBranchAddClick(Sender: TObject);
    procedure btnBranchChangeClick(Sender: TObject);
    procedure btnBranchDeleteClick(Sender: TObject);
    procedure btnContactAddClick(Sender: TObject);
    procedure btnContactChangeClick(Sender: TObject);
    procedure btnContactDeleteClick(Sender: TObject);
    procedure dbgContactDetailsDblClick(Sender: TObject);
    procedure dbgBranchDetailsDblClick(Sender: TObject);
    procedure dbgContactDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnContactMoveClick(Sender: TObject);
    procedure btnContactOnlineClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnActivityAddClick(Sender: TObject);
    procedure btnActivityChangeClick(Sender: TObject);
    procedure btnActivityDeleteClick(Sender: TObject);
    procedure tbActivityShow(Sender: TObject);
    procedure tbActivityExit(Sender: TObject);
    procedure tbCrossSellingShow(Sender: TObject);
    procedure dbgActivityDetailsDblClick(Sender: TObject);
    procedure dbgActivityDetailsTitleClick(Column: TColumn);
    procedure dbgActivityDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgQuoteDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtn11Click(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure dbgCategoryDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure btnCategoryNotesClick(Sender: TObject);
    procedure dbgCategoryDetailsDblClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure btnHOContactAddClick(Sender: TObject);
    procedure btnHOContactChangeClick(Sender: TObject);
    procedure btnHOContactDeleteClick(Sender: TObject);
    procedure dbgHOContactDetailsDblClick(Sender: TObject);
    procedure btnEnqDeclineClick(Sender: TObject);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure chkbxGDPRSignedClick(Sender: TObject);
    procedure btnDateGDPRSignedClick(Sender: TObject);
    procedure edtdateGDPRSignedExit(Sender: TObject);
    procedure memQuoteCostMarkupExit(Sender: TObject);
    procedure chkbxOverrideCostChargesClick(Sender: TObject);
  private
    FActivatedEnqs: boolean;
    FActivatedInvoices: boolean;
    FActivatedJobs: boolean;
    FActivatedOrders: boolean;
    FActivatedQuotes: boolean;
    FDefaultBin: integer;
    FDefaultPrinter: string;
    FsFuncMode: ShortString;
    iOperatorRep: integer;
    iMnuMaint: integer;
    FEndUser: boolean;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    procedure SetSalesInvoiceEdit(Dataset: TDataset);
    procedure CheckActivityReminder;
    function CustomerContactOrdersExist(tmpBranch, tmpContact: integer): boolean;
    procedure SetCustomerContactInactive(tmpBranch, tmpContact: integer);
    procedure SetsFuncMode(const Value: ShortString);
    procedure SetEndUser(const Value: boolean);
  private
    Descending: Boolean;
    SortedColumn: Integer;
    Activated: boolean;
    ActiveActivityCode: integer;
    ActiveBranchCode: integer;
    ActiveCategoryCode: integer;
    ActiveContactCode: integer;
    ActiveInvoiceCode: integer;
    ActiveEnquiryCode: integer;
    ActiveOrderCode: real;
    ActiveJobCode: integer;
    ActiveQuoteCode: integer;
    ActiveStockCode: String;
    bRefreshCategories: boolean;
    dmJobBag: TdmJobBag;
    dtmdlCustEnqs: TdtmdlEnqs;
    dtmdlCustJobs: TdtmdlJobs;
    dtmdlCustOrders: TdtmdlOrders;
    dtmdlCustStock: TdtmdlStock;
    dtmdlCustInvoices: TdmSalesInvoice;
    dtmdlCustQuotes: TdtmdlQuotes;
    dtmdlCustActivity: TdtmdlActivity;
    PBActivityMemoFrm: TPBDBMemoFrm;
    PBCategoryMemoFrm: TPBDBMemoFrm;
    PBCustomerMemoFrm: TPBDBMemoFrm;
    PBCustomerDNotesFrm: TPBDelivNotesFrm;
    bOK: boolean;
    sOldValue: string;
    iCreatedBy, iInvToCust, iInvToBranch, iInvToContact: Integer;
    bNotesFlash, bDelivNotesFlash: ByteBool;
    FProspect: boolean;
    FCreditCheck: boolean;
    SICCode: integer;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey : integer;
    procedure RefreshPrefixList;
    procedure UpdateProductStatus(sNotInUse: string);
    procedure ShowDocuments;
    procedure CallMaintDocuments(const aMode: string);
    function GetActivePageIndex: integer;
    procedure SetProspect(const Value: boolean);
    procedure SetCreditCheck(const Value: boolean);
    procedure ShowListViewDocuments(strPath: string; ListView: TListView;
      ImageList: TImageList);
    procedure SendAndSaveEmail(sTo, sSubject: string);
    procedure PrintBmp(bmp: TBitmap);
    procedure PrintForm;
    procedure DisableCreditDetails;
    procedure DisableInvoicingDetails;
    procedure EnableCreditDetails;
    procedure EnableInvoicingDetails;
    procedure ParseMessage(const AFileName: string; var ATo, AFrom,
      ASubject, ADate, ABody: string);
    function FormatDateasDateTime(sDate: string): TDateTime;
    function ParseDocumentFrom(tmpFrom: string): string;
    procedure SetEnquiryButtonProperties(Sender: TObject);
    procedure SetJobButtonProperties(Sender: TObject);
    procedure SetOrderButtonProperties(Sender: TObject);
    procedure SetQuoteButtonProperties(Sender: TObject);
    procedure SetEnquiryButtons(Sender: TObject; Field: TField);
    procedure SetInvoiceButtons(Sender: TObject; Field: TField);
    procedure SetJobButtons(Sender: TObject; Field: TField);
    procedure SetOrderButtons(Sender: TObject; Field: TField);
    procedure SetStockButtons(Sender: TObject; Field: TField);
    procedure SetQuoteButtons(Sender: TObject; Field: TField);
    procedure SetActivityButtons(Sender: TObject; Field: TField);
    procedure SetCategoryButtons(Sender: TObject; Field: TField);
    procedure SetBranchButtons(Sender: TObject; Field: TField);
    procedure SetContactButtons(Sender: TObject; Field: TField);
    procedure SetHOContactButtons(Sender: TObject; Field: TField);
    procedure CallBranchMaintScreen(Mode: string);
    procedure CallContactMaint(sTempFuncMode: string; tmpDBGrid: TDBGrid; tmpBranch: integer; tmpBranchName: string);
    procedure CallActivityMaintScreen(aMode : TactMode);
    procedure CallEnquiryMaintScreen(sTempFuncMode: string);
    procedure CallJobMaintScreen(aMode: TJBMode);
    procedure CallOrderMaintScreen(sTempFuncMode: Char);
    procedure CallSOMaintScreen(sTempFuncMode: Char);
    procedure CallInvoiceMaintScreen(aMode: TsiMode);
    procedure CallStockMaintScreen(sTempFuncMode: Char);
    procedure CallAllocScreen(sTempFuncMode: Char);
    procedure CallQuoteMaintScreen(aMode: TQMode);
    function CheckEnquiryInput: boolean;
    function CheckJobInput: boolean;
    function CheckOrderInput: boolean;
    function CheckQuoteInput: boolean;
    procedure ConvertQuoteToJob;
    procedure PrintPO;
    procedure PrintSO;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  public
    dtmdlOneCustomer: TdtmdlCustomers;
    iCode: Integer;
    iCustomer: integer;
//    sFuncMode: string[1];
    sStatusDescr: string;
    property CreditCheck: boolean read FCreditCheck write SetCreditCheck;
    property EndUser: boolean read FEndUser write SetEndUser;
    property Prospect: boolean read FProspect write SetProspect;
    property sFuncMode: ShortString read FsFuncMode write SetsFuncMode;
  end;

var
  PBMaintCustFrm: TPBMaintCustFrm;

implementation

uses
  System.UITypes, System.Types,
  pbluCustBrSelect, PBImages, ComObj, ActiveX, PBLUVATCode, PBMaintGroups, CCSPrint, PBLUCust, PBLUBranch,
  pbDatabase, pbMainMenu, PBAuditDM, CCSCommon, PBMaintDocument,
  PBLUPaymentTerms, PBLURevenueLoc, PBLUCConta, DateSelV5, pbluSICCode, PBWordOLE, PBExcelOLE, PBMaintEmail,
  PBLULevelOfImportance, PBLUCountry, PBEnquiryDataMod, PBenquiry,
  PBRSEnqN, PBEnqSupResp, PBEnqJobPrice, PBRSQuoN, PBRSQuo, PBAutoPO, PBRSEnq,
  PBPOToEnq, pbluCustDeliv, PBMaintPOrd, STMntSOrd, PBRSPOrdN,
  STRSSalesOrd, PBPOrdHist, stSOObjects, PBMaintPOrdInactive, pbPOObjects,
  PBRSJBDraft, PBMaintJobBagInactive, PBRSJobBag, PBMaintJobBag,
  PBSalesInvRPrint, PBMaintSalesInvoice, STMaintProduct, STRSLabels,
  STLUProductLvls, STLUStkMvmnts, STLUStkLoc, STLUStkSales,
  STLUStkProduction, STLUStkPurchases, STLUStkNmbr, STRSPickNote,
  stPickingDM, STStockDM, STPickbyPart, PBRSProofN, PBLUProofHistN,
  STPrtAllocSales, PBMaintQuote, PBRSQuote, PBMaintBranch, PBMaintCConta,
  PBMaintContactMulti, PBMaintContactOnline, PBMaintActivity,
  PBMaintActivityReminder, pbLuQuotesSearch, pbLuEnqsSearch, pbLuOrdersSearch, pbLuJobsSearch,
  PBEnqCancelLine;

{$R *.DFM}

function TPBMaintCustFrm.GetActivePageIndex: integer;
var
  TempArray: array[0..255] of Char;
begin
  FillChar(TempArray, SizeOf(TempArray), #0);
  {Search the INI file for Default Branch tab}
  if Prospect then
    GetPrivateProfileString('Prospects', 'Default Customer Tab', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile)
  else
  if EndUser then
    GetPrivateProfileString('End Users', 'Default Customer Tab', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile)
  else
    GetPrivateProfileString('Customers', 'Default Customer Tab', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

  TryStrToInt(TempArray, Result);
end;

procedure TPBMaintCustFrm.FormActivate(Sender: TObject);
var
  sCreatedOn: string;
begin
  Activated := false;

  {Create the delivery narrative form}
  PBCustomerDNotesFrm := TPBDelivNotesFrm.Create(Self);
  PBCustomerDNotesFrm.bAllow_Upd := True;
  {Create the memo form}
  PBCustomerMemoFrm := TPBDBMemoFrm.Create(Self);
  PBCustomerMemoFrm.bAllow_Upd := True;

  {Set the datasources of the lookups}
  dblkpPaymentTerms.listsource := dtmdlOneCustomer.dtsTerms;
  DefVATDBLookupComboBox.listsource := dtmdlOneCustomer.VATSRC;
  TypeDBLUCB.listsource := dtmdlOneCustomer.TypesSRC;
  dblkpCustStatus.listsource := dtmdlOneCustomer.StatusDataSource;
  CredStatDBLCB.listsource := dtmdlOneCustomer.CrdStatSRC;
  dblkpCountry.listsource := dtmdlOneCustomer.CountrySRC;
  DefCurrDBLookupComboBox.listsource := dtmdlOneCustomer.CurrSRC;
  IntrastatDBLookupComboBox.listsource := dtmdlOneCustomer.IntrastatSRC;
  dblkpSystem.listsource := dtmdlOneCustomer.dtsEInvoicing;
  dblkpRevenueCentre.listsource := dtmdlOneCustomer.dtsRevenueCentre;
  dblkpCompanyType.listsource := dtmdlOneCustomer.dtsCompanyTypes;
  dbgAccountCodes.DataSource := dtmdlOneCustomer.dtsGetAccCodes;
  dblkpLevelOfImportance.listsource := dtmdlOneCustomer.dtsGetImportance;


  {Re-activate the lookup SQLs}
  dtmdlOneCustomer.qryRevenueCentre.active := false;
  dtmdlOneCustomer.qryRevenueCentre.active := true;
  dtmdlOneCustomer.qryTerms.active := false;
  dtmdlOneCustomer.qryTerms.active := true;
  dtmdlOneCustomer.GetTypesSQL.Active := False;
  dtmdlOneCustomer.GetTypesSQL.Active := True;
  dtmdlOneCustomer.GetStatusSQL.Active := False;
  dtmdlOneCustomer.GetStatusSQL.Active := True;
  dtmdlOneCustomer.GetCrdStatSQL.Active := False;
  dtmdlOneCustomer.GetCrdStatSQL.Active := True;
  dtmdlOneCustomer.GetIntrastatSQL.Active := False;
  dtmdlOneCustomer.GetIntrastatSQL.Active := True;
  dtmdlOneCustomer.GetCountrySQL.Active := False;
  dtmdlOneCustomer.GetCountrySQL.Active := True;
  dtmdlOneCustomer.GetCurrSQL.Active := False;
  dtmdlOneCustomer.GetCurrSQL.Active := True;
  dtmdlOneCustomer.GetVATSQL.Active := False;
  dtmdlOneCustomer.GetVATSQL.Active := True;
  dtmdlOneCustomer.GetCompSQL.active := False;
  dtmdlOneCustomer.GetCompSQL.active := True;
  dtmdlOneCustomer.qryEInvoicing.active := False;
  dtmdlOneCustomer.qryEInvoicing.active := True;
  dtmdlOneCustomer.qryCompanyTypes.active := False;
  dtmdlOneCustomer.qryCompanyTypes.active := True;
  dtmdlOneCustomer.qryGetImportance.Active := False;
  dtmdlOneCustomer.qryGetImportance.Active := True;

  {Set up HO Contact Datasource}
  dbgHOContactDetails.DataSource := dtmdlOneCustomer.dtsHOContacts;
  DBContactText.datasource := dbgHOContactDetails.DataSource;
  DBCPhoneText.datasource := dbgHOContactDetails.DataSource;
  DBCMobileText.datasource := dbgHOContactDetails.DataSource;
  DBCEmailText.datasource := dbgHOContactDetails.DataSource;
  DBCStatusText.datasource := dbgHOContactDetails.DataSource;
  dtmdlOneCustomer.dtsHOContacts.OnDataChange := SetHOContactButtons;

  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new ' + sStatusDescr;
  if sFuncMode = 'C' then
    begin
      if CreditCheck then
        Caption := 'Credit Check '
      else
        Caption := 'Change a ' + sStatusDescr;
    end;
  if sFuncMode = 'D' then
    Caption := 'Delete a ' + sStatusDescr;

  {Determine if using GDPR}
  grpbxGDPR.visible := dmBroker.UseGDPR;

  {}
  chkbxAcquiredCompany.Visible := dmBroker.UseAcquiredCustomers;
  if not chkbxAcquiredCompany.Visible then
    chkbxAcquiredCompany.Checked := false;

  chkbxCTRLPCustomer.Visible := dmBroker.UseCTRLPOrdering;
  if not chkbxCTRLPCustomer.Visible then
    chkbxCTRLPCustomer.Checked := false;

  if sFuncMode = 'A' then
  begin
    {Empty details}
    NameEdit.Text := '';
    if dtmdlOneCustomer.GetTypesSQL.recordcount = 1 then
      TypeDBLUCB.KeyValue := dtmdlOneCustomer.GetTypesSQL.fieldbyname('Customer_Type').asinteger
    else
      TypeDBLUCB.KeyValue := 0;

    if FProspect then
      begin
        dblkpCustStatus.KeyValue := 80; {Prospect}
      end
    else
    if FEndUser then
      begin
        dblkpCustStatus.KeyValue := 200; {End USer}
      end
    else
      dblkpCustStatus.KeyValue := 100 {Customer};

    ActiveChkBox.Checked := True;
    ChkBxOnLnOrd.Checked := False;
    chkbxCreateBranchOnline.checked := false;
    chkbxShowAvailableStock.checked := false;
    chkbxOverrideCostCharges.checked := false;
    ChkBxDisplayDiscounts.Checked := dmBroker.UseDiscountInvoicing;

    chkbxGDPRLetterSent.checked := false;
    chkbxGDPRSigned.checked := false;
    edtDateGDPRSigned.text := '';
    edtDateGDPRSigned.enabled := false;
    btnDateGDPRSigned.enabled := false;
    lblGDPRSignedOperatorName.caption := '';

    {Default whether a product prefix is required for this customer}
    chkbxProductPrefix.checked := dtmdlOneCustomer.GetCompSQL.fieldbyname('Product_Prefix_not_Required').asstring = 'Y';

    SICCode := 0;

    NameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PhoneEdit.Text := '';
    CountyEdit.Text := '';
    FaxEdit.Text := '';
    EMailEdit.Text := '';
    edtConsumerCode.Text := '';
    edtContractRef.Text := '';
    edtClientCode.Text := '';
    edtUsername.Text := '';
    edtPassword.Text := '';
    edtSiteURL.Text := '';
    edtEmailOrder.Text := '';
    CredLimMemo.Text := '0.00';
    SettDaysMemo.Text := '0';
    SettDiscMemo.Text := '0.00';
    memPrePayBalance.Text := '0.00';
    spnCreditScore.value := 100;
    dblkpPaymentTerms.keyvalue := dmBroker.DefaultPaymentTerms;
    PostCodeEdit.Text := '';
    AccCodeEdit.Text := '';
    DDCodeEdit.Text := '';

    edtAnalysis1.Text := '';
    edtAnalysis2.Text := '';
    edtAnalysis3.Text := '';
    edtAnalysis4.Text := '';

    CredStatDBLCB.KeyValue := 'L';
    IntrastatDBLookupComboBox.keyvalue := 1;
    dblkpCountry.KeyValue := 0;
    dblkpLevelOfImportance.KeyValue := 0;
    DefCurrDBLookupComboBox.KeyValue :=
      dtmdlOneCustomer.GetCompSQL.FieldByName('Currency_Code_Def').AsInteger;
    VATRefEdit.Text := '';
    CredAvailMemo.Text := '0.00';
    DefVATDBLookupComboBox.KeyValue := dtmdlOneCustomer.GetCompSQL.fieldbyname('Vat_Code').asinteger;
    ChkBxInvUpFrnt.Checked := true;

    {Credit Check Details}
    edtLastReturnDate.Text := '';
    edtAccLodgedDate.Text := '';
    edtAccountsFiledDate.Text := '';
    edtAccRefDate.Text := '';

    lblLastCreditCheck.caption := '';

    {Ovveride Production Default Cost Charges}
    chkbxOverrideCostCharges.Checked := false;
    memQuoteCostMarkup.enabled := false;
    memQuoteCostMarkup.Text := '0.00';

    {Setup Cost centre default}
    rdgrpCostCentre.ItemIndex := 0;

     {Initially setup as a prospect}
    with ProspectComboBox do
      begin
        itemindex := 0;
        Enabled := True;
      end;

    with cmbCallOffDeliveryNote do
      begin
        itemindex := 0;
        Enabled := True;
      end;

    NameEdit.setfocus;
    sCreatedOn := pbDateStr(date);
    lblcreatedOn.caption := sCreatedOn;

    iCreatedBy := frmPBMainMenu.iOperator;
    stsbrDetails.Panels[0].Text := 'Created: ' + sCreatedOn + ' by ' + frmPBMainMenu.sOperator_Name;
  end
  else
    begin
      with dtmdlOneCustomer.qryGetCustomer do
        begin
        close;
        parambyname('Customer').asinteger := iCustomer;
        open;
        iCode := FieldByName('Customer').AsInteger;
        NameEdit.Text := FieldByName('Name').AsString;
        TypeDBLUCB.KeyValue := FieldByName('Customer_Type').AsInteger;
        dblkpCustStatus.KeyValue := FieldByName('Customer_Status').AsInteger;
        ActiveChkBox.Checked := (FieldByName('Acc_Active').AsString = 'Y');
        ChkBxOnLnOrd.Checked := (FieldByName('Online_Ordering').AsString = 'Y');
        chkbxCreateBranchOnline.checked := (FieldByName('Create_Branch_Online').AsString = 'Y');
        chkbxShowAvailableStock.checked := (FieldByName('Show_Available_Stock').AsString = 'Y');

        {Ovveride Production Default Cost Charges}
        chkbxOverrideCostCharges.Checked := (FieldByName('Override_Cost_Markup_Perc').AsString = 'Y');
        if chkbxOverrideCostCharges.Checked then
          begin
            memQuoteCostMarkup.enabled := true;
            memQuoteCostMarkup.text := formatfloat('0.00',FieldByName('Default_Quote_Cost_markup_perc').asfloat);
          end
        else
          begin
            memQuoteCostMarkup.enabled := false;
            memQuoteCostMarkup.Text := '0.00';
          end;

        {Is this an acquired Customer}
        chkbxAcquiredCompany.checked := (FieldByName('Customer_is_Acquired').AsString = 'Y');

        {Is this an CTRL-P Master Customer}
        chkbxCTRLPCustomer.checked := (FieldByName('CTRLP_Master_Customer').AsString = 'Y');

        ChkBxDisplayDiscounts.Checked := (FieldByName('Use_Discount_Invoice').AsString = 'Y');

        chkbxGDPRLetterSent.checked := (FieldByName('GDPR_Letter_Sent').AsString = 'Y');
        chkbxGDPRSigned.checked := (FieldByName('GDPR_Letter_Signed').AsString = 'Y');

        if chkbxGDPRSigned.checked then
          begin
            edtDateGDPRSigned.text := pbDatestr(FieldByName('GDPR_Letter_Signed_Date').Asdatetime);
            edtDateGDPRSigned.enabled := chkbxGDPRSigned.checked;
            lblGDPRSignedOperatorName.caption := dmBroker.GetOperatorName(FieldByName('GDPR_Letter_Signed_Operator').AsInteger);
            grpbxGDPR.Font.Color := clgreen;
//            grpbxGDPR.Font.Style := [fsbold];
          end
        else
          begin
            edtDateGDPRSigned.text := '';
            edtDateGDPRSigned.enabled := false;
            btnDateGDPRSigned.enabled := false;
            lblGDPRSignedOperatorName.caption := '';
            grpbxGDPR.Font.Color := clred;
          end;

        chkbxProductPrefix.Checked := (FieldByName('Product_Prefix_not_Required').AsString = 'Y');
        NameEdit.Text := FieldByName('Name').AsString;
        BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
        StreetEdit.Text := FieldByName('Street').AsString;
        LocaleEdit.Text := FieldByName('Locale').AsString;
        TownEdit.Text := FieldByName('Town').AsString;
        PhoneEdit.Text := FieldByName('Phone').AsString;
        CountyEdit.text := FieldByName('County').AsString;
        FaxEdit.Text := FieldByName('Fax_Number').AsString;
        EMailEdit.Text := FieldByName('EMail').AsString;
        edtConsumerCode.Text := FieldByName('Consumer_Code').AsString;
        edtContractRef.Text := FieldByName('Contract_Code').AsString;
        EdtEmailOrder.Text := FieldByName('EMail_Address_Order_Confirm').AsString;
        edtLogoLocation.text := FieldByName('Customer_logo_File').AsString;
        CredLimMemo.Text := FormatFloat('######0',
          FieldByName('Credit_Limit').AsFloat);
        SettDaysMemo.Text := IntToStr(FieldByName('Settlement_Days').AsInteger);
        SettDiscMemo.Text := FormatFloat('##0.00',
          FieldByName('Settlement_Discount').AsFloat);
        memPrePayBalance.Text := FormatFloat('######0.00',
          FieldByName('Pre_Pay_Balance').AsFloat);

        dblkpPaymentTerms.keyvalue := fieldbyname('Payment_Terms').asinteger;
        PostCodeEdit.Text := FieldByName('PostCode').AsString;
        AccCodeEdit.Text := FieldByName('Account_Code').AsString;
        DDCodeEdit.Text := FieldByName('Direct_Debit_Code').AsString;
        DDCodeEdit.Visible := dtmdlOneCustomer.ShowDirectDebitPrompt(dblkpPaymentTerms.keyvalue);
        lblDirectDebit.Visible := DDCodeEdit.Visible;

        dblkpRevenueCentre.keyvalue := fieldbyname('Invoice_Location').asinteger;

        edtAnalysis1.Text := fieldbyname('Analysis_Code_1').asstring;
        edtAnalysis2.Text := fieldbyname('Analysis_Code_2').asstring;
        edtAnalysis3.Text := fieldbyname('Analysis_Code_3').asstring;
        edtAnalysis4.Text := fieldbyname('Analysis_Code_4').asstring;

        CredStatDBLCB.KeyValue := FieldByName('Credit_Status').AsString;
        edtProdPrefix.Text := FieldByName('Product_Code_Prefix').asString;

        PBCustomerMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
        PBCustomerDNotesFrm.LoadMemoData(FieldByName('Delivery_Narrative').AsInteger);
        iInvToCust := FieldByName('Inv_To_Customer').AsInteger;
        iInvToBranch := FieldByName('Inv_To_Branch').AsInteger;
        iInvtoContact := fieldbyname('Inv_To_Contact').asinteger;
        IntrastatDBLookupComboBox.KeyValue := FieldByName('Intrastat_Id').AsInteger;

        edtUsername.Text := FieldByName('Connection_Username').AsString;
        edtPassword.Text := FieldByName('Connection_Password').AsString;
        edtSiteURL.Text := FieldByName('Transfer_Site_URL').AsString;
        edtClientCode.Text := FieldByName('Client_Account_Code').AsString;
        dblkpSystem.KeyValue := fieldbyname('e_Invoicing_System').AsString;

        chkbxEInvoicing.checked := (fieldbyname('Electronic_Invoice_Required').asstring = 'Y');

        chkbxUseKingfieldOpips.checked := (fieldbyname('Use_Kingfield_Ordering').asstring = 'Y');
        chkbxUsePrintEvolved.checked := (fieldbyname('Use_Print_Evolved').asstring = 'Y');

        if Fieldbyname('Cost_Centre_Level').asstring = 'B' then
          rdgrpCostCentre.ItemIndex := 2
        else
        if Fieldbyname('Cost_Centre_Level').asstring = 'C' then
          rdgrpCostCentre.ItemIndex := 1
        else
          rdgrpCostCentre.ItemIndex := 0;

        if Fieldbyname('Transfer_Protocol_Type').asstring = 'EDI' then
          rdgrpProtocol.ItemIndex := 0
        else
        if Fieldbyname('Transfer_Protocol_Type').asstring = 'FTP' then
          rdgrpProtocol.ItemIndex := 1
        else
        if Fieldbyname('Transfer_Protocol_Type').asstring = 'HTTPS' then
          rdgrpProtocol.ItemIndex := 1
        else
          rdgrpProtocol.ItemIndex := 3;

        if FieldByName('Country_Id').AsInteger = 0 then
          dblkpCountry.KeyValue := 0
        else
          dblkpCountry.KeyValue := FieldByName('Country_Id').AsInteger;

        if FieldByName('Currency_Code_Def').AsInteger = 0 then
          DefCurrDBLookupComboBox.KeyValue := 0
        else
          DefCurrDBLookupComboBox.KeyValue :=
            FieldByName('Currency_Code_Def').AsInteger;

        if FieldByName('Level_Of_Importance').AsInteger = 0 then
          dblkpLevelOfImportance.KeyValue := 0
        else
          dblkpLevelOfImportance.KeyValue := FieldByName('Level_of_importance').AsInteger;

        VATRefEdit.Text := FieldByName('VAT_Reference').AsString;
        ChkBxInvUpfrnt.checked := FieldByName('Invoice_Upfront').AsString = 'Y';

        CredAvailMemo.Text := FormatFloat('##0.00',
          FieldByName('Available_Credit').AsFloat);


        DefVATDBLookupComboBox.KeyValue := FieldByName('VAT_Code_Def').AsInteger;

        sCreatedOn := pbDateStr(FieldByName('Date_Created').Asdatetime);
        lblCreatedOn.caption := sCreatedOn;

        iCreatedBy := fieldbyname('Created_By').asinteger;
        if fieldbyname('Operator_Name').asstring = '' then
          stsbrDetails.Panels[0].Text := 'Created: ' + sCreatedOn
        else
          stsbrDetails.Panels[0].Text := 'Created: ' + sCreatedOn + ' by ' + fieldbyname('Operator_Name').asstring;

        with cmbCallOffDeliveryNote do
        begin
          itemindex := -1;
          if FieldByName('Call_Off_Delivery_Note_Type').AsString = 'N' then
            itemindex := 0;
        end;

        {Initially set the combo Box to 'Prospect'}
        with ProspectComboBox do
        begin
          itemindex := 0;
          Enabled := True;
          {Change to Actual Customer if Account is on Ledger}
          if FieldByName('Account_Code_on_Ledger').AsString = 'Y' then
          begin
            Items.Add('Account on Ledger');
            itemindex := 2;
            Enabled := False;
          end
          else
          if FieldByName('Account_Code_on_Ledger').AsString = 'P' then
            begin
              itemindex := 1;
              Enabled := True;
            end
          else
          if FieldByName('Account_Code_on_Ledger').AsString = 'U' then
            begin
            Items.Add('Ledger Update Pending');
            itemindex := 2;
            Enabled := False;
            end
          else
          if FieldByName('Account_Code_on_Ledger').AsString = 'I' then
            begin
            Items.Add('Sales Invoice Pending');
            itemindex := 2;
            Enabled := False;
            end
          else
          if FieldByName('Account_Code_on_Ledger').AsString = 'O' then
            begin
            Items.Add('Purchase Invoice Pending');
            itemindex := 2;
            Enabled := False;
            end;

          {Set the Credit Check Details}
          spnCreditScore.value := fieldbyname('Credit_Score').asinteger;

          {Set the Credit Rating}
          case fieldbyname('Credit_Rating').asinteger of
            10: rdgrpCreditRating.ItemIndex := 1;
            20: rdgrpCreditRating.ItemIndex := 2;
            30: rdgrpCreditRating.ItemIndex := 3;
            40: rdgrpCreditRating.ItemIndex := 4;
          else
            rdgrpCreditRating.ItemIndex := 0;
          end;

          edtLastReturnDate.Text := pbdatestr(fieldbyname('Last_Annual_Return_Date').asdatetime);
          edtAccLodgedDate.Text := pbdatestr(fieldbyname('Accounts_Lodged_Date').asdatetime);
          edtAccountsFiledDate.Text := pbdatestr(fieldbyname('Latest_Filed_Accounts_Date').asdatetime);

          if fieldbyname('Accounts_Reference_Date').asstring = '' then
            edtAccRefDate.Text := ''
          else
            edtAccRefDate.Text := fieldbyname('Accounts_Reference_Date').asstring;

          memIssCapital.Text := fieldbyname('Issued_Capital').asstring;
          dblkpCompanyType.keyvalue := fieldbyname('Company_Type').asinteger;
          if trim(fieldbyname('SIC_Code_Description').asstring) = '-' then
            edtSicCode.Text := ''
          else
            edtSicCode.Text := fieldbyname('SIC_Code_Description').asstring;
          SICCode := fieldbyname('SIC_Code').asinteger;

          lblLastCreditCheck.caption := pbdatestr(fieldbyname('Last_Credit_Check_Date').asdatetime);

          dmBroker.CreateCustomerDocDirectory(NameEdit.Text);
        end;

        ShowDocuments;

        {Show the titla of the screen}
        self.caption := self.caption + NameEdit.Text;
      end;
  end;

  {Show the HO Contact info}
  dtmdlOneCustomer.Customer := self.iCustomer;
  dtmdlOneCustomer.RefreshHOContacts;
  {Show the invoice to details}
  ShowCustName(Self);
  ShowBranchName(Self);
  ShowContactName(self);

  {Enable or disable the buttons}
  grpbxDetails.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
//  PrintBitBtn.Visible := (sFuncMode= 'C');
  CheckNotes(Self);
  CheckOK(Self);

  {Depending on type of view then use relevant operator permissions}
  if Prospect then
    dmBroker.ScreenAccessControl(Self,'mnuProspects',frmpbMainMenu.iOperator,0,0)
  else
  if EndUser then
    dmBroker.ScreenAccessControl(Self,'mnuEndUsers',frmpbMainMenu.iOperator,0,0)
  else
    dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmpbMainMenu.iOperator,0,0);

  if frmPBMainMenu.UseCRMSystem and (sFuncMode = 'C') then
    CheckActivityReminder;
  Activated := true;
end;

procedure TPBMaintCustFrm.CheckActivityReminder;
begin
  dtmdlCustActivity.Customer := iCustomer;
  dtmdlCustActivity.AssignedTo := 0;
  
  if dtmdlCustActivity.RefreshReminders > 0 then
    begin
      PBMaintActivityReminderFrm := TPBMaintActivityReminderFrm.create(self);
      try
        PBMaintActivityReminderFrm.customer := dtmdlCustActivity.Customer;
        PBMaintActivityReminderFrm.Operator := dtmdlCustActivity.AssignedTo;
        PBMaintActivityReminderFrm.showmodal;
      finally
        PBMaintActivityReminderFrm.free
      end;
    end;
end;

procedure TPBMaintCustFrm.ShowDocuments;
var
  sPath: string;
begin
  sPath := dmBroker.GetCompanyCustomerDirectory + '\' + NameEdit.text + '\';

  lstvwDocuments.Clear;
  // Assign a Imagelist to the ListView
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
end;

procedure TPBMaintCustFrm.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
var
  i: Integer;
  Icon: TIcon;
  SearchRec: TSearchRec;
  ListItem: TListItem;
  FileInfo: SHFILEINFO;
begin
  // Create a temporary TIcon
  Icon := TIcon.Create;
  ListView.Items.BeginUpdate;
  try
    // search for the first file
    i := FindFirst(strPath + '*.*', faArchive, SearchRec);
    while i = 0 do
    begin
      with ListView do
      begin
        // On directories and volumes
        if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
          (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          ListItem := ListView.Items.Add;
          //Get The DisplayName
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_DISPLAYNAME);
//          Listitem.Caption := FileInfo.szDisplayName;
          Listitem.Caption := SearchRec.Name;
          // Get The TypeName
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_TYPENAME);
          ListItem.SubItems.Add(FileInfo.szTypeName);
          // Get The DateModified
          try
            ListItem.SubItems.Add(DatetimeToStr(FileDateToDateTime(fileage(strPath + ListItem.Caption))));
          except
            ListItem.SubItems.Add('');
          end;

          //Get The Icon That Represents The File
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_ICON or SHGFI_SMALLICON);
          icon.Handle := FileInfo.hIcon;
          ListItem.ImageIndex := ImageList.AddIcon(Icon);
          // Destroy the Icon
          DestroyIcon(FileInfo.hIcon);
        end;
      end;
      i := FindNext(SearchRec);
    end;
  finally
    Icon.Free;
    ListView.Items.EndUpdate;
  end;
end;

procedure TPBMaintCustFrm.CheckOK(Sender: TObject);
begin
  if (sFuncMode = 'D') then
    begin
      OKBitBtn.Enabled := true;
      exit;
    end;
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (TypeDBLUCB.KeyValue <> 0) and
    (dblkpCustStatus.keyvalue <> 0) and
    (TownEdit.Text <> '') and
    (PhoneEdit.Text <> '') and
    (PostCodeEdit.Text <> '') and
    (CredStatDBLCB.KeyValue <> '') and
    (SettDiscMemo.Text <> '') and
    (SettDaysMemo.Text <> '') and
    (CredLimMemo.Text <> '') and
    (edtInvToBranch.text <> '') and
    (IntrastatDBLookupComboBox.Text <> '') and
    (DefVATDBLookupComboBox.Text <> '');
end;

procedure TPBMaintCustFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintCustFrm.TypeDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCustFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCustFrm.OKBitBtnClick(Sender: TObject);
var
  iTempNewCode: Integer;
begin
  {Only do the checks if this is maintaining a customer. Don't bother if this is a Prospect}
  if not FProspect and not FEndUser then
  begin
    if sFuncMode[1] in ['A', 'C'] then
      begin
        {Check that an account code has been entered}
        if (trim(AccCodeEdit.Text) = '') and (dmBroker.CustAccountMandatory) and (ActiveChkBox.checked) then
          begin
            MessageDlg('An account code must be allocated to a customer.', mtError, [mbOk], 0);
            exit;
          end;
      end;

    if (dmBroker.UseCreditChecking) then
      begin
        if (sFuncMode[1] in ['A', 'C']) then
          begin
            {Check that a Payment Terms has been entered}
            if (dtmdlOneCustomer.dtsTerms.DataSet.RecordCount > 0) and (dblkpPaymentTerms.Text = '') then
              begin
                if not dmBroker.CanChangeCreditDetails(frmPBMainMenu.iOperator) then
                  MessageDlg('Payment Terms within the Credit Details must be entered. You don''t have the user permissions to update these details.', mtError, [mbOk], 0)
                else
                  MessageDlg('Payment Terms within the Credit Details must be entered.', mtError, [mbOk], 0);
                exit;
              end;
          end;
      end;
  end;

  if sFuncMode = 'A' then
  begin
    {Add a new code}
    {Add the branch narrative}
    PBCustomerMemoFrm.UpdMemoData(Self);
    PBCustomerDNotesFrm.UpdMemoData(Self);
    {Get Next code}
    iTempNewCode := GetNextKey;
    with dtmdlOneCustomer.UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iTempNewCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Customer_Type').AsInteger := TypeDBLUCB.KeyValue;
      ParamByName('Customer_Status').AsInteger := dblkpCustStatus.KeyValue;
      if ActiveChkBox.Checked then
        ParamByName('Acc_Active').AsString := 'Y'
      else
        ParamByName('Acc_Active').AsString := 'N';
      if ChkBxOnLnOrd.Checked then
        ParamByname('Online_Ordering').ASString := 'Y'
      else
        ParamByName('Online_Ordering').AsString := 'N';

      if ChkBxCreateBranchOnline.Checked then
        ParamByname('Create_Branch_Online').ASString := 'Y'
      else
        ParamByName('Create_Branch_Online').AsString := 'N';

      if ChkBxShowAvailableStock.Checked then
        ParamByname('Show_Available_Stock').ASString := 'Y'
      else
        ParamByName('Show_Available_Stock').AsString := 'N';

      if ChkBxDisplayDiscounts.Checked then
        ParamByname('Use_Discount_Invoice').ASString := 'Y'
      else
        ParamByName('Use_Discount_Invoice').AsString := 'N';

      if ChkBxProductPrefix.Checked then
        ParamByname('Product_Prefix_not_Required').ASString := 'Y'
      else
        ParamByName('Product_Prefix_not_Required').AsString := 'N';

      if chkBxInvUpfrnt.checked then
        ParamByName('Invoice_upfront').AsString := 'Y'
      else
        ParamByName('Invoice_Upfront').AsString := 'N';

      if ChkbxOverrideCostCharges.Checked then
        ParamByname('Override_Cost_Markup_Perc').ASString := 'Y'
      else
        ParamByName('Override_Cost_Markup_Perc').AsString := 'N';

      try
        ParambyName('Default_Quote_Cost_Markup_Perc').asfloat := StrToFloatDef(memQuoteCostMarkup.text, 0, FormatSettings);
      except
        ParambyName('Default_Quote_Cost_Markup_Perc').asfloat := 0.00;
      end;

      if ChkBxAcquiredCompany.Checked then
        ParamByname('Customer_is_Acquired').ASString := 'Y'
      else
        ParamByName('Customer_is_Acquired').AsString := 'N';

      if chkbxCTRLPCustomer.Checked then
        ParamByname('CTRLP_Master_Customer').ASString := 'Y'
      else
        ParamByName('CTRLP_Master_Customer').AsString := 'N';

      ParamByName('Credit_Limit').AsFloat := StrToFloatDef(CredLimMemo.Text, 0, FormatSettings);
      ParamByName('Settlement_Days').AsInteger := StrToInt(SettDaysMemo.Text);
      ParamByName('Settlement_Discount').AsFloat :=
        StrToFloatDef(SettDiscMemo.Text, 0, FormatSettings);
      ParamByName('Pre_Pay_Balance').AsFloat := StrToFloatDef(memPrePayBalance.Text, 0, FormatSettings);
      if dblkpPaymentTerms.text = '' then
        ParamByName('Payment_Terms').clear
      else
        ParamByName('Payment_Terms').Asinteger := dblkpPaymentTerms.KeyValue;

      if dblkpRevenueCentre.text = '' then
        ParamByName('Invoice_location').clear
      else
        ParamByName('Invoice_location').Asinteger := dblkpRevenueCentre.KeyValue;

      ParamByName('Credit_Status').AsString := CredStatDBLCB.KeyValue;
      ParamByName('Intrastat_Id').AsInteger :=
        IntrastatDBLookupComboBox.KeyValue;

      if dblkpCountry.KeyValue = 0 then
        ParamByName('Country_Id').Clear
      else
        ParamByName('Country_Id').AsInteger := dblkpCountry.KeyValue;

      if DefCurrDBLookupComboBox.KeyValue = 0 then
        ParamByName('Currency_Code_Def').Clear
      else
        ParamByName('Currency_Code_Def').AsInteger :=
          DefCurrDBLookupComboBox.KeyValue;

      if dblkpLevelOfImportance.KeyValue = 0 then
        ParamByName('Level_of_importance').Clear
      else
        ParamByName('Level_of_importance').AsInteger := dblkpLevelOfImportance.KeyValue;

      ParamByName('Available_Credit').AsFloat := StrToFloatDef(CredAvailMemo.Text, 0, FormatSettings);
      ParamByName('VAT_Reference').AsString := VATRefEdit.Text + '';
      if DefVATDBLookupComboBox.text = '' then
        ParamByName('VAT_Code_Def').Clear
      else
        ParamByName('VAT_Code_Def').AsInteger :=
          DefVATDBLookupComboBox.KeyValue;
//      ParambyName('Customer_Status').asinteger := 1;
      ParamByName('Email_Ord').AsString := EdtEmailOrder.Text + '';
      ParambyName('Customer_logo_File').asstring := edtLogoLocation.Text + '';
      ParamByName('Consumer_Code').AsString := edtConsumerCode.Text + '';
      ParamByName('Contract_Code').AsString := edtContractRef.Text + '';
      ParamByName('Client_account_Code').AsString := edtClientCode.Text + '';
      ParamByName('Connection_Username').AsString := edtUsername.Text + '';
      ParamByName('Connection_Password').AsString := edtPassword.Text + '';
      ParamByName('Transfer_Site_URL').AsString := edtSiteURL.Text + '';

      ParamByName('Analysis_Code_1').AsString := edtAnalysis1.text + '';
      ParamByName('Analysis_Code_2').AsString := edtAnalysis2.Text + '';
      ParamByName('Analysis_Code_3').AsString := edtAnalysis3.text + '';
      ParamByName('Analysis_Code_4').AsString := edtAnalysis4.Text + '';

      ParamByName('Direct_Debit_Code').AsString := DDCodeEdit.Text + '';

      if chkbxGDPRLetterSent.checked then
        parambyname('GDPR_Letter_Sent').asstring := 'Y'
      else
        parambyname('GDPR_Letter_Sent').asstring := 'N';

      if chkbxGDPRSigned.checked then
        begin
          parambyname('GDPR_Letter_Signed').asstring := 'Y';
          parambyname('GDPR_Letter_Signed_Date').asdatetime := pbDateStr(edtDateGDPRSigned.text);
          parambyname('GDPR_Letter_Signed_Operator').asinteger := frmPBMainMenu.iOperator;
        end
      else
        begin
          parambyname('GDPR_Letter_Signed').asstring := 'N';
          parambyname('GDPR_Letter_Signed_Date').clear;
          parambyname('GDPR_Letter_Signed_Operator').clear;
        end;

      if chkbxEInvoicing.Checked then
        parambyname('Electronic_Invoice_Required').asstring := 'Y'
      else
        parambyname('Electronic_Invoice_Required').asstring := 'N';

      if chkbxUseKingfieldOpips.Checked then
        parambyname('Use_Kingfield_Ordering').asstring := 'Y'
      else
        parambyname('Use_Kingfield_Ordering').asstring := 'N';

      if chkbxUsePrintEvolved.Checked then
        parambyname('Use_Print_Evolved').asstring := 'Y'
      else
        parambyname('Use_Print_Evolved').asstring := 'N';

      case rdgrpProtocol.ItemIndex of
        0: ParamByName('Transfer_Protocol_Type').AsString := 'EDI';
        1: ParamByName('Transfer_Protocol_Type').AsString := 'FTP';
        2: ParamByName('Transfer_Protocol_Type').AsString := 'HTTPS';
      else
        ParamByName('Transfer_Protocol_Type').clear;
      end;

      case rdgrpCostCentre.ItemIndex of
        1: ParamByName('Cost_Centre_Level').AsString := 'C';
        2: ParamByName('Cost_Centre_Level').AsString := 'B';
      else
        ParamByName('Cost_Centre_Level').clear;
      end;

      if dblkpSystem.text = '' then
        ParamByName('e_Invoicing_System').Clear
      else
        ParamByName('e_Invoicing_System').AsInteger := dblkpSystem.KeyValue;

      if lblCreatedOn.caption = '' then
        ParamByname('Date_Created').clear
      else
        ParamByName('Date_Created').asDateTime := StrToDate(lblCreatedOn.caption);

      if iCreatedBy = 0 then
        ParamByname('Created_By').clear
      else
        ParamByName('Created_By').asinteger := iCreatedBy;

      if self.edtProdPrefix.text <> '' then
        ParamByName('Product_Code_Prefix').asString := self.edtProdPrefix.text
      else
        ParamByName('Product_Code_Prefix').clear;

      if cmbCallOffDeliveryNote.itemindex = 0 then
        ParamByName('Call_Off_Delivery_Note_Type').AsString := 'N'
      else
        ParamByName('Call_Off_Delivery_Note_Type').clear;

      {Credit Check Details}
      Parambyname('Credit_Score').asinteger := spnCreditScore.Value;
      case rdgrpCreditRating.itemindex of
        1: Parambyname('Credit_Rating').asinteger := 10;
        2: Parambyname('Credit_Rating').asinteger := 20;
        3: Parambyname('Credit_Rating').asinteger := 30;
        4: Parambyname('Credit_Rating').asinteger := 40
      else
        Parambyname('Credit_Rating').clear
      end;

      if edtLastReturnDate.Text = '' then
        Parambyname('Last_Annual_Return_Date').clear
      else
        Parambyname('Last_Annual_Return_Date').asdatetime := PBDateStr(edtLastReturnDate.Text);

      if edtAccLodgedDate.Text = '' then
        Parambyname('Accounts_Lodged_Date').clear
      else
        Parambyname('Accounts_Lodged_Date').asdatetime := PBDateStr(edtAccLodgedDate.Text);

      if edtAccountsFiledDate.Text = '' then
        Parambyname('Latest_Filed_Accounts_Date').clear
      else
        Parambyname('Latest_Filed_Accounts_Date').asdatetime := PBDateStr(edtAccountsFiledDate.Text);

      Parambyname('Accounts_Reference_Date').asstring := edtAccRefDate.Text;

      if trim(memIssCapital.text) = '' then
        Parambyname('Issued_Capital').clear
      else
        Parambyname('Issued_Capital').asinteger := strtoint(memIssCapital.text);

      if dblkpCompanyType.Text = '' then
        Parambyname('Company_Type').clear
      else
        Parambyname('Company_Type').asinteger := dblkpCompanyType.KeyValue;

      if edtSICCode.Text = '' then
        parambyname('SIC_Code').clear
      else
        parambyname('SIC_Code').asinteger := SICCode;

      ExecSQL;
      dmBroker.CreateCustomerDocDirectory(NameEdit.Text);
    end;
    with dtmdlOneCustomer.AddBranchSQL do
    begin
      iInvToCust := iTempNewCode;
      Close;
      ParamByName('Customer').AsInteger := iTempNewCode;
      ParamByName('Name').AsString := 'Head Office';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('County').AsString := CountyEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      if PBCustomerMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBCustomerMemoFrm.iNarr;
      if PBCustomerDNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := PBCustomerDNotesFrm.iNarr;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      if iInvToCust = 0 then
        ParamByName('Inv_To_Customer').Clear
      else
        ParamByName('Inv_To_Customer').AsInteger := iInvToCust;
      if (iInvToBranch = 0) and (iInvToCust = 0) then
        ParamByName('Inv_To_Branch').Clear
      else
        ParamByName('Inv_To_Branch').AsInteger := iInvToBranch;

      if iInvToContact = 0 then
        ParambyName('Inv_To_contact').clear
      else
        ParamByName('Inv_To_contact').AsInteger := iInvToContact;

      {Update Account code on Ledger}
      if ProspectComboBox.itemindex = 0 then
        ParamByName('Account_Code_on_ledger').AsString := 'N'
      else
        if ProspectComboBox.itemindex = 1 then
          ParamByName('Account_Code_on_ledger').AsString := 'P'
      else
        if ProspectComboBox.itemindex = 2 then
          ParamByName('Account_Code_on_ledger').AsString := 'U'
      else
        if ProspectComboBox.itemindex = 3 then
          ParamByName('Account_Code_on_ledger').AsString := 'I'
      else
        if ProspectComboBox.itemindex = 4 then
          ParamByName('Account_Code_on_ledger').AsString := 'O'
        else
          ParamByName('Account_Code_on_ledger').AsString := 'Y';

      ExecSQL;
    end;
    iCode := iTempNewCode;
    {Write ADD CUSTOMER to audit trail} ;
    PBAuditDataMod.WriteAudit(1000, iCode, 0, 0, 0, NameEdit.Text) ;
  end;
  if sFuncMode = 'C' then
  begin
    {Change active state of stock items}
    if not activechkbox.Checked and (dtmdlOneCustomer.qryGetCustomer.FieldByName('Acc_Active').asstring = 'Y') then
        begin
          if messagedlg('You have made this customer inactive, all associated stock items will now become inactive. Continue?',mtConfirmation,[mbYes, mbCancel], 0) = mrYes then
            UpdateProductStatus('Y')
          else
            exit;
        end
      else
      if activechkbox.Checked and (dtmdlOneCustomer.qryGetCustomer.FieldByName('Acc_Active').asstring = 'N') then
        begin
          if messagedlg('You have re-activated this customer, all associated stock items will now become active again. Continue?',mtConfirmation,[mbYes, mbCancel], 0) = mrYes then
            UpdateProductStatus('N')
          else
            exit;
        end;

    {Update the branch narrative}
    PBCustomerMemoFrm.UpdMemoData(Self);
    PBCustomerDNotesFrm.UpdMemoData(Self);
    {Update an existing code}
    with dtmdlOneCustomer.UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Customer_Type').AsInteger := TypeDBLUCB.KeyValue;

      {Set customer status to customer if converting a prospect}
      if CreditCheck and chkbxConverttoCustomer.checked then
        ParamByName('Customer_Status').AsInteger := 100
      else
        ParamByName('Customer_Status').AsInteger := dblkpCustStatus.Keyvalue;

      if ActiveChkBox.Checked then
        ParamByName('Acc_Active').AsString := 'Y'
      else
        ParamByName('Acc_Active').AsString := 'N';
      if ChkBxOnLnOrd.Checked then
        ParamByname('Online_Ordering').ASString := 'Y'
      else
        ParamByName('Online_Ordering').AsString := 'N';

      if ChkBxCreateBranchOnline.Checked then
        ParamByname('Create_Branch_Online').ASString := 'Y'
      else
        ParamByName('Create_Branch_Online').AsString := 'N';

      if ChkBxShowAvailableStock.Checked then
        ParamByname('Show_Available_Stock').ASString := 'Y'
      else
        ParamByName('Show_Available_Stock').AsString := 'N';

      if ChkBxDisplayDiscounts.Checked then
        ParamByname('Use_Discount_Invoice').ASString := 'Y'
      else
        ParamByName('Use_Discount_Invoice').AsString := 'N';

      if chkbxProductPrefix.Checked then
        ParamByname('Product_Prefix_not_Required').ASString := 'Y'
      else
        ParamByName('Product_Prefix_not_Required').AsString := 'N';

      if chkBxInvUpfrnt.checked then
        ParamByName('Invoice_upfront').AsString := 'Y'
      else
        ParamByName('Invoice_Upfront').AsString := 'N';

      if ChkbxOverrideCostCharges.Checked then
        ParamByname('Override_Cost_Markup_Perc').ASString := 'Y'
      else
        ParamByName('Override_Cost_Markup_Perc').AsString := 'N';

      ParambyName('Default_Quote_Cost_Markup_Perc').asfloat := StrToFloatDef(memQuoteCostMarkup.text, 0, FormatSettings);

      if ChkBxAcquiredCompany.Checked then
        ParamByname('Customer_is_Acquired').ASString := 'Y'
      else
        ParamByName('Customer_is_Acquired').AsString := 'N';

      if chkbxCTRLPCustomer.Checked then
        ParamByname('CTRLP_Master_Customer').ASString := 'Y'
      else
        ParamByName('CTRLP_Master_Customer').AsString := 'N';

      ParamByName('Credit_Limit').AsFloat := StrToFloatDef(CredLimMemo.Text, 0, FormatSettings);
      ParamByName('Settlement_Days').AsInteger := StrToInt(SettDaysMemo.Text);
      ParamByName('Settlement_Discount').AsFloat :=
        StrToFloatDef(SettDiscMemo.Text, 0, FormatSettings);
      ParamByName('Pre_Pay_Balance').AsFloat := StrToFloatDef(memPrePayBalance.Text, 0, FormatSettings);
      if dblkpPaymentTerms.text = '' then
        Parambyname('Payment_Terms').clear
      else
        Parambyname('Payment_Terms').asstring := dblkpPaymentTerms.keyvalue;

      ParamByName('Direct_Debit_Code').AsString := DDCodeEdit.Text + '';

      if chkbxGDPRLetterSent.checked then
        parambyname('GDPR_Letter_Sent').asstring := 'Y'
      else
        parambyname('GDPR_Letter_Sent').asstring := 'N';

      if chkbxGDPRSigned.checked then
        begin
          parambyname('GDPR_Letter_Signed').asstring := 'Y';
          parambyname('GDPR_Letter_Signed_Date').asdatetime := pbDateStr(edtDateGDPRSigned.text);
          parambyname('GDPR_Letter_Signed_Operator').asinteger := frmPBMainMenu.iOperator;
        end
      else
        begin
          parambyname('GDPR_Letter_Signed').asstring := 'N';
          parambyname('GDPR_Letter_Signed_Date').clear;
          parambyname('GDPR_Letter_Signed_Operator').clear;
        end;

      if chkbxGDPRSigned.checked then
        begin
          parambyname('GDPR_Letter_Signed').asstring := 'Y';
          parambyname('GDPR_Letter_Signed_Date').asdatetime := pbDateStr(edtDateGDPRSigned.text);
          parambyname('GDPR_Letter_Signed_Operator').asinteger := frmPBMainMenu.iOperator;
        end
      else
        begin
          parambyname('GDPR_Letter_Signed').asstring := 'N';
          parambyname('GDPR_Letter_Signed_Date').clear;
          parambyname('GDPR_Letter_Signed_Operator').clear;
        end;

      if dblkpRevenueCentre.text = '' then
        ParamByName('Invoice_Location').clear
      else
        ParamByName('Invoice_Location').Asinteger := dblkpRevenueCentre.KeyValue;

      ParamByName('Credit_Status').AsString := CredStatDBLCB.KeyValue;
      ParamByName('Intrastat_Id').AsInteger :=
        IntrastatDBLookupComboBox.KeyValue;

      if dblkpCountry.KeyValue = 0 then
        ParamByName('Country_Id').Clear
      else
        ParamByName('Country_Id').AsInteger := dblkpCountry.KeyValue;

      if DefCurrDBLookupComboBox.KeyValue = 0 then
        ParamByName('Currency_Code_Def').Clear
      else
        ParamByName('Currency_Code_Def').AsInteger :=
          DefCurrDBLookupComboBox.KeyValue;

      if dblkpLevelOfImportance.KeyValue = 0 then
        ParamByName('Level_of_importance').Clear
      else
        ParamByName('Level_of_importance').AsInteger := dblkpLevelOfImportance.KeyValue;

      ParamByName('Available_Credit').AsFloat := StrToFloatDef(CredAvailMemo.Text, 0, FormatSettings);
      ParamByName('VAT_Reference').AsString := VATRefEdit.Text + '';
      if DefVATDBLookupComboBox.text = '' then
        ParamByName('VAT_Code_Def').Clear
      else
        ParamByName('VAT_Code_Def').AsInteger :=
          DefVATDBLookupComboBox.KeyValue;
//      ParambyName('Customer_Status').asinteger := 1;
      ParamByName('Email_Ord').AsString := EdtEmailOrder.Text + '';
      ParambyName('Customer_logo_File').asstring := edtLogoLocation.Text + '';
      ParamByName('Consumer_Code').AsString := edtConsumerCode.Text + '';
      ParamByName('Contract_Code').AsString := edtContractRef.Text + '';

      if chkbxEInvoicing.Checked then
        parambyname('Electronic_Invoice_Required').asstring := 'Y'
      else
        parambyname('Electronic_Invoice_Required').asstring := 'N';

      if chkbxUseKingfieldOpips.Checked then
        parambyname('Use_Kingfield_Ordering').asstring := 'Y'
      else
        parambyname('Use_Kingfield_Ordering').asstring := 'N';

      if chkbxUsePrintEvolved.Checked then
        parambyname('Use_Print_Evolved').asstring := 'Y'
      else
        parambyname('Use_Print_Evolved').asstring := 'N';

      ParamByName('Client_account_Code').AsString := edtClientCode.Text + '';
      ParamByName('Connection_Username').AsString := edtUsername.Text + '';
      ParamByName('Connection_Password').AsString := edtPassword.Text + '';
      ParamByName('Transfer_Site_URL').AsString := edtSiteURL.Text + '';

      ParamByName('Analysis_Code_1').AsString := edtAnalysis1.text + '';
      ParamByName('Analysis_Code_2').AsString := edtAnalysis2.Text + '';
      ParamByName('Analysis_Code_3').AsString := edtAnalysis3.text + '';
      ParamByName('Analysis_Code_4').AsString := edtAnalysis4.Text + '';

      case rdgrpProtocol.ItemIndex of
        0: ParamByName('Transfer_Protocol_Type').AsString := 'EDI';
        1: ParamByName('Transfer_Protocol_Type').AsString := 'FTP';
        2: ParamByName('Transfer_Protocol_Type').AsString := 'HTTPS';
      else
        ParamByName('Transfer_Protocol_Type').clear;
      end;

      case rdgrpCostCentre.ItemIndex of
        1: ParamByName('Cost_Centre_Level').AsString := 'C';
        2: ParamByName('Cost_Centre_Level').AsString := 'B';
      else
        ParamByName('Cost_Centre_Level').clear;
      end;

      if dblkpSystem.text = '' then
        ParamByName('e_Invoicing_System').Clear
      else
        ParamByName('e_Invoicing_System').Asstring := dblkpSystem.KeyValue;

      if lblCreatedOn.caption = '' then
        ParamByname('Date_Created').clear
      else
        ParamByName('Date_Created').asDateTime := StrToDate(lblCreatedOn.caption);

      if iCreatedBy = 0 then
        ParamByname('Created_By').clear
      else
        ParamByName('Created_By').asinteger := iCreatedBy;

      if self.edtProdPrefix.text <> '' then
        ParamByName('Product_Code_Prefix').asString := self.edtProdPrefix.text
      else
        ParamByName('Product_Code_Prefix').clear;

      if cmbCallOffDeliveryNote.itemindex = 0 then
        ParamByName('Call_Off_Delivery_Note_Type').AsString := 'N'
      else
        ParamByName('Call_Off_Delivery_Note_Type').clear;

      {Credit Check Details}
      Parambyname('Credit_Score').asinteger := spnCreditScore.Value;
      case rdgrpCreditRating.itemindex of
        1: Parambyname('Credit_Rating').asinteger := 10;
        2: Parambyname('Credit_Rating').asinteger := 20;
        3: Parambyname('Credit_Rating').asinteger := 30;
        4: Parambyname('Credit_Rating').asinteger := 40
      else
        Parambyname('Credit_Rating').clear
      end;

      if edtLastReturnDate.Text = '' then
        Parambyname('Last_Annual_Return_Date').clear
      else
        Parambyname('Last_Annual_Return_Date').asdatetime := PBDateStr(edtLastReturnDate.Text);

      if edtAccLodgedDate.Text = '' then
        Parambyname('Accounts_Lodged_Date').clear
      else
        Parambyname('Accounts_Lodged_Date').asdatetime := PBDateStr(edtAccLodgedDate.Text);

      if edtAccountsFiledDate.Text = '' then
        Parambyname('Latest_Filed_Accounts_Date').clear
      else
        Parambyname('Latest_Filed_Accounts_Date').asdatetime := PBDateStr(edtAccountsFiledDate.Text);

      Parambyname('Accounts_Reference_Date').asstring := edtAccRefDate.Text;

      if trim(memIssCapital.text) = '' then
        Parambyname('Issued_Capital').clear
      else
        Parambyname('Issued_Capital').asinteger := strtoint(memIssCapital.text);

      if dblkpCompanyType.Text = '' then
        Parambyname('Company_Type').clear
      else
        Parambyname('Company_Type').asinteger := dblkpCompanyType.KeyValue;

      if edtSICCode.Text = '' then
        parambyname('SIC_Code').clear
      else
        parambyname('SIC_Code').asinteger := SICCode;

      {Write the CUSTOMER field changes to the audit trail} ;
      PBAuditDataMod.FieldChanges('customer',dtmdlOneCustomer.qryCustomers,dtmdlOneCustomer.UpdSQL) ;
      ExecSQL;
    end;
    with dtmdlOneCustomer.UpdBranchSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCode;
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('County').AsString := CountyEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      if PBCustomerMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBCustomerMemoFrm.iNarr;
      if PBCustomerDNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := PBCustomerDNotesFrm.iNarr;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      if iInvToCust = 0 then
        ParamByName('Inv_To_Customer').Clear
      else
        ParamByName('Inv_To_Customer').AsInteger := iInvToCust;
      if (iInvToBranch = 0) and (iInvToCust = 0) then
        ParamByName('Inv_To_Branch').Clear
      else
        ParamByName('Inv_To_Branch').AsInteger := iInvToBranch;

      if iInvToContact = 0 then
        ParambyName('Inv_To_contact').clear
      else
        ParamByName('Inv_To_contact').AsInteger := iInvToContact;

      {Update Account code on Ledger}
      if ProspectComboBox.itemindex = 0 then
        ParamByName('Account_Code_on_ledger').AsString := 'N'
      else
        if ProspectComboBox.itemindex = 1 then
          ParamByName('Account_Code_on_ledger').AsString := 'P'
      else
        if ProspectComboBox.itemindex = 2 then
          ParamByName('Account_Code_on_ledger').AsString := 'U'
      else
        if ProspectComboBox.itemindex = 3 then
          ParamByName('Account_Code_on_ledger').AsString := 'I'
      else
        if ProspectComboBox.itemindex = 4 then
          ParamByName('Account_Code_on_ledger').AsString := 'O'
        else
          ParamByName('Account_Code_on_ledger').AsString := 'Y';
      {Write the BRANCH field changes to the audit trail} ;
      PBAuditDataMod.FieldChanges('customer',dtmdlOneCustomer.qryCustomers,dtmdlOneCustomer.UpdBranchSQL) ;
      ExecSQL;
    end;

    {Write UPDATE CUSTOMER to audit trail} ;
    PBAuditDataMod.WriteAudit(2000, iCode, 0, 0, 0, NameEdit.Text) ;
  end;
  if sFuncMode = 'D' then
  begin
    grpbxDetails.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with dtmdlOneCustomer.DelBranchSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCode;
        ExecSQL;
      end;
      with dtmdlOneCustomer.DelSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCode;
        ExecSQL;
      end;
    end;
    {Delete the branch narrative}
    PBCustomerMemoFrm.DelMemoData(Self);
    PBCustomerDNotesFrm.DelMemoData(Self);
    PBAuditDataMod.WriteAudit(3000, 0, 0, 0, 0, NameEdit.Text) ;
  end;
  modalResult := mrok;
end;

procedure TPBMaintCustFrm.SettDaysMemoExit(Sender: TObject);
begin
  if SettDaysMemo.Text <> '' then
  begin
    try
      SettDaysMemo.Text := IntToStr(StrToInt(SettDaysMemo.Text))
    except
      MessageDlg('Invalid settlement days', mtError, [mbOK], 0);
      SettDaysMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TPBMaintCustFrm.SettDiscMemoExit(Sender: TObject);
begin
  if SettDiscMemo.Text <> '' then
  begin
    try
      SettDiscMemo.Text := FormatFloat('##0.00', StrToFloatDef(SettDiscMemo.Text, 0, FormatSettings))
    except
      MessageDlg('Invalid settlement discount', mtError, [mbOK], 0);
      SettDiscMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TPBMaintCustFrm.CredLimMemoExit(Sender: TObject);
begin
  if CredLimMemo.Text <> '' then
  begin
    try
      CredLimMemo.Text := FormatFloat('######0', StrToFloatDef(CredLimMemo.Text, 0, FormatSettings))
    except
      MessageDlg('Invalid value', mtError, [mbOK], 0);
      CredLimMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TPBMaintCustFrm.ShowCustName(Sender: TObject);
begin
  if (iInvToCust = 0) then
  begin
    edtInvToCustomer.text := 'This Customer';
  end
  else
  begin
    with dtmdlOneCustomer.GetCustNameSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iInvToCust;
      Open;
      First;
      edtInvToCustomer.text := FieldByName('Name').AsString;
    end;
  end;
end;

procedure TPBMaintCustFrm.ShowBranchName(Sender: TObject);
begin
  if (iInvToBranch = 0) then
  begin
    edtInvToBranch.text := 'Head Office';
  end
  else
  begin
    with dtmdlOneCustomer.GetBranchNameSQL do
    begin
      Close;
      ParamByName('Branch_No').AsInteger := iInvToBranch;
      if iInvToCust <> 0 then
        ParamByName('Customer').AsInteger := iInvToCust
      else
        ParamByName('Customer').AsInteger := iCode;
      Open;
      First;
      edtInvToBranch.text := FieldByName('Name').AsString;
    end;
  end;
  CheckOK(Self);
end;

procedure TPBMaintCustFrm.InvCustBtnClick(Sender: TObject);
var
  iTempInvToCust: Integer;
  InvToCustFrm: TPBLUCustFrm;
begin
  iTempInvToCust := iInvToCust;
  {Activate the customer lookup screen}
  InvToCustFrm := TPBLUCustfrm.Create(Self);
  try
//    InvToCustFrm.iThisCode := iCode;
    if iInvToCust <> 0 then
      InvToCustFrm.SelCode := iInvToCust
    else
      InvToCustFrm.SelCode := iCode;
    InvToCustFrm.bIs_Lookup := True;
    InvToCustFrm.bAllow_upd := False;
    InvToCustFrm.ShowModal;
//    if (InvToCustFrm.SelCode <> iCode) then
    if InvToCustFrm.selected then
      iInvToCust := InvToCustFrm.SelCode
//    else
//      iInvToCust := 0;
  finally
    InvToCustFrm.Free;
  end;
  ShowCustName(Self);
  if iTempInvToCust <> iInvToCust then
  begin
    iInvToBranch := 0;
    ShowBranchName(Self);

    iInvToContact := 0;
    ShowContactName(self);
  end;
end;

procedure TPBMaintCustFrm.InvToBranchClick(Sender: TObject);
var
  InvToBranchFrm: TPBLUBranchfrm;
  iTempInvToBranch: integer;
begin
  iTempInvToBranch := iInvToBranch;
  {Activate the branch lookup screen}
  InvToBranchFrm := TPBLUBranchFrm.Create(Self);
  try
    if iInvToCust <> 0 then
      InvToBranchFrm.iCust := iInvToCust
    else
      InvToBranchFrm.iCust := iCode;
    InvToBranchFrm.sCustName := edtInvToCustomer.text;
    InvToBranchFrm.SelCode := iInvToBranch;
    InvToBranchFrm.bIs_Lookup := True;
    InvToBranchFrm.bAllow_upd := False;
    InvToBranchFrm.ShowModal;
    iInvToBranch := InvToBranchFrm.SelCode;
  finally
    InvToBranchFrm.Free;
  end;
  ShowBranchName(Self);

  if iTempInvToBranch <> iInvToBranch then
  begin
    iInvToContact := 0;
    ShowContactName(self);
  end;

  CheckOK(Self);
end;

procedure TPBMaintCustFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if modalResult = mrok then exit;

  if not(OKBitBtn.enabled) then exit;

  TempWord := MessageDlg('Do you want to save these details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    OKBitBtnClick(self);
end;

procedure TPBMaintCustFrm.NotesBitBtnClick(Sender: TObject);
begin
  PBCustomerMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBCustomerMemoFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBCustomerMemoFrm.bMemoUpd) then
        begin
        PBCustomerMemoFrm.UpdMemoData(Self) ;
        With dtmdlOneCustomer.UpdNotesOnlySQL do
                begin
                Close ;
                ParamByName('Customer').AsInteger := iCode;
                if PBCustomerMemoFrm.iNarr = 0 then
                        ParamByName('Narrative').Clear
                else
                        ParamByName('Narrative').AsInteger := PBCustomerMemoFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintCustFrm.CheckNotes(Sender: TObject);
begin
  if PBCustomerMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
  if PBCustomerDNotesFrm.CheckNotes(Self) then
  begin
    FlashDelivTimer.Enabled := True;
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashDelivTimer.Enabled := False;
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintCustFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintCustFrm.CountryClearBitBtnClick(Sender: TObject);
begin
  dblkpSystem.KeyValue := '';
end;

procedure TPBMaintCustFrm.CredAvailMemoExit(Sender: TObject);
begin
  if SettDaysMemo.Text <> '' then
  begin
    try
      CredAvailMemo.Text := IntToStr(StrToInt(CredAvailMemo.Text))
    except
      MessageDlg('Invalid credit available', mtError, [mbOK], 0);
      CredAvailMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TPBMaintCustFrm.DefCurrClearBitBtnClick(Sender: TObject);
begin
  DefCurrDBLookupComboBox.KeyValue := 0;
end;

procedure TPBMaintCustFrm.AccCodeEditExit(Sender: TObject);
begin
  if AccCodeEdit.Text = '' then
    begin
      dbgAccountCodes.Visible := false;
      exit;
    end;

  {Validate that the account code is unique}
  With dtmdlOneCustomer.GetCompSQL do
    begin
      Close ;
      Open ;
      First ;

      if not dmBroker.CustomerAccCodeUnique then
        begin
          dbgAccountCodes.Visible := false;
          exit;
        end;
    end;

  with dtmdlOneCustomer.CheckCustAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    ParamByName('Customer').AsInteger := iCode;
    Open;
    First;
    if (not EOF) then
      begin
        MessageDlg('The account code: ' + AccCodeEdit.Text +
        ' is already in use on customer: ' +
        FieldByName('Name').AsString, mtError, [mbOK], 0);
        AccCodeEdit.Text := sOldValue;
        AccCodeEdit.SetFocus;
      end
    else
      dbgAccountCodes.Visible := false;
  end;
end;

procedure TPBMaintCustFrm.AccCodeEditEnter(Sender: TObject);
begin
  sOldValue := AccCodeEdit.Text;
  dbgAccountCodes.Visible := true;
end;

procedure TPBMaintCustFrm.DelivNotesBitBtnClick(Sender: TObject);
begin
  PBCustomerDNotesFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBCustomerDNotesFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBCustomerDNotesFrm.bMemoUpd) then
        begin
        PBCustomerDNotesFrm.UpdMemoData(Self) ;
        With dtmdlOneCustomer.UpdDelivNotesOnlySQL do
                begin
                Close ;
                ParamByName('Customer').AsInteger := iCode;
                if PBCustomerDNotesFrm.iNarr = 0 then
                        ParamByName('Delivery_Narrative').Clear
                else
                        ParamByName('Delivery_Narrative').AsInteger := PBCustomerDNotesFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintCustFrm.FlashDelivTimerTimer(Sender: TObject);
begin
  if bDelivNotesFlash then
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bDelivNotesFlash := (not (bDelivNotesFlash));
end;

procedure TPBMaintCustFrm.VATBitBtnClick(Sender: TObject);
begin
  DefVATDBLookupComboBox.KeyValue := 0;
  CheckOk(self);
end;

procedure TPBMaintCustFrm.DefVATDBLookupComboBoxClick(Sender: TObject);
begin
   CheckOk(self);
end;

function TPBMaintCustFrm.GetNextKey: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with dtmdlOneCustomer.AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with dtmdlOneCustomer.GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Customer').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintCustFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with dtmdlOneCustomer.qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer (Customer, Name) VALUES (0,'' '') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCustFrm.DeleteZero;
begin
  with dtmdlOneCustomer.qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer Where Customer = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCustFrm.VatMaintBitBtnClick(Sender: TObject);
begin
  PBLUVatCodeFrm := TPBLUVatCodeFrm.Create(self) ;
    try
      PBLUVatCodeFrm.bIs_Lookup := False ;
      PBLUVatCodeFrm.bAllow_Upd := True ;
      PBLUVatCodeFrm.iSelCode := 0 ;
      PBLUVatCodeFrm.ShowModal ;
    finally
      PBLUVatCodeFrm.Free ;
    end;
    dtmdlOneCustomer.GetVATSQL.Active := False;
    dtmdlOneCustomer.GetVATSQL.Active := True;
end;

procedure TPBMaintCustFrm.CustTypeMaintBitBtnClick(Sender: TObject);
begin
  PBMaintGroupsFrm := TPBMaintGroupsFrm.Create(self) ;
  try
    PBMaintGroupsFrm.iGroupselect := 1;
    PBMaintGroupsFrm.ShowModal ;
  Finally;
  PBMaintGroupsFrm.Free ;
  end;
  dtmdlOneCustomer.GetTypesSQL.Active := False;
  dtmdlOneCustomer.GetTypesSQL.Active := True;
end;

procedure TPBMaintCustFrm.PostCodeEditChange(Sender: TObject);
begin
CheckOK(Self);
end;

procedure TPBMaintCustFrm.dblkpCustStatusClick(Sender: TObject);
begin
  Prospect := (dblkpCustStatus.keyvalue > 1) and (dblkpCustStatus.keyvalue < 90);
  CheckOk(Self);
end;

procedure TPBMaintCustFrm.PrintBitBtnClick(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
  PrinterSettings := TPrinterSettings.Create;

  try
    if SetUpPrinter(PrinterSettings) then
        PBMaintCustFrm.print;
  finally
    PrinterSettings.Free;
  end;
(*  PrinterSettings := TPrinterSettings.Create;

  try
    if SetUpPrinter(PrinterSettings) then
      begin
        sleep(500);
        PrintForm;
      end
  finally
    PrinterSettings.free;
  end;
*)
end;

procedure TPBMaintCustFrm.PrintForm;
var
  DC: HDC;
  isDcPalDevice: Bool;
  MemDC: HDC;
  MemBitmap: HBITMAP;
  OldMemBitmap: HBITMAP;
  hDibHeader: THandle;
  pDibHeader: Pointer;
  hBits: THandle;
  pBits: Pointer;
  ScaleX: Double;
  ScaleY: Double;
  pPal: PLOGPALETTE;
  pal: HPALETTE;
  OldPal: HPALETTE;
  i: Integer;
begin
  {Get the screen dc}
  DC := GetDC(0);
  {Create a compatible dc}
  MemDC := CreateCompatibleDC(DC);
  {create a bitmap}
  MemBitmap := CreateCompatibleBitmap(DC, Self.Width, Self.Height);
  {select the bitmap into the dc}
  OldMemBitmap := SelectObject(MemDC, MemBitmap);

  {Lets prepare to try a fixup for broken video drivers}
  isDcPalDevice := False;
  if GetDeviceCaps(DC, RASTERCAPS) and RC_PALETTE=RC_PALETTE then
  begin
    GetMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
    FillChar(pPal^, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)),
             #0);
    pPal^.palVersion := $300;
    pPal^.palNumEntries := GetSystemPaletteEntries(DC, 0, 256, pPal^.palPalEntry);
    if pPal^.palNumEntries<>0 then
    begin
      pal := CreatePalette(pPal^);
      OldPal := SelectPalette(MemDC, pal, False);
      isDcPalDevice := True
    end
    else
      FreeMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
  end;
  {copy from the screen to the memdc/bitmap}
  BitBlt(MemDC, 0, 0, Self.Width, Self.Height, DC, Self.Left, Self.Top, SRCCOPY);

  if isDcPalDevice=True then
  begin
    SelectPalette(MemDC, OldPal, False);
    DeleteObject(pal);
  end;
  {unselect the bitmap}
  SelectObject(MemDC, OldMemBitmap);
  {delete the memory dc}
  DeleteDC(MemDC);
  {Allocate memory for a DIB structure}
  hDibHeader := GlobalAlloc(GHND, SizeOf(TBITMAPINFO)+(SizeOf(TRGBQUAD)*
                            256));
  {get a pointer to the alloced memory}
  pDibHeader := GlobalLock(hDibHeader);

  {fill in the dib structure with info on the way we want the DIB}
  FillChar(pDibHeader^, SizeOf(TBITMAPINFO)+(SizeOf(TRGBQUAD)*
           256), #0);
  PBITMAPINFOHEADER(pDibHeader)^.biSize := SizeOf(TBITMAPINFOHEADER);
  PBITMAPINFOHEADER(pDibHeader)^.biPlanes := 1;
  PBITMAPINFOHEADER(pDibHeader)^.biBitCount := 8;
  PBITMAPINFOHEADER(pDibHeader)^.biWidth := Self.Width;
  PBITMAPINFOHEADER(pDibHeader)^.biHeight := Self.Height;
  PBITMAPINFOHEADER(pDibHeader)^.biCompression := BI_RGB;

  {find out how much memory for the bits}
  GetDIBits(DC, MemBitmap, 0, Self.Height, nil, TBITMAPINFO(pDibHeader^),
            DIB_RGB_COLORS);

  {Alloc memory for the bits}
  hBits := GlobalAlloc(GHND, PBITMAPINFOHEADER(pDibHeader)^.BiSizeImage);

  {Get a pointer to the bits}
  pBits := GlobalLock(hBits);

  {Call fn again, but this time give us the bits!}
  GetDIBits(DC, MemBitmap, 0, Self.Height, pBits, PBitmapInfo(pDibHeader)^,
            DIB_RGB_COLORS);

  {Lets try a fixup for broken video drivers}
  if isDcPalDevice=True then
  begin
    for i := 0 to (pPal^.palNumEntries-1) do
    begin
      PBitmapInfo(pDibHeader)^.bmiColors[i].rgbRed := pPal^.palPalEntry[i].peRed;
      PBitmapInfo(pDibHeader)^.bmiColors[i].rgbGreen := pPal^.palPalEntry[i].peGreen;
      PBitmapInfo(pDibHeader)^.bmiColors[i].rgbBlue := pPal^.palPalEntry[i].peBlue;
    end;
    FreeMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
  end;
  {Release the screen dc}
  ReleaseDC(0, DC);
  {Delete the bitmap}
  DeleteObject(MemBitmap);

  {Start print job}
  Printer.BeginDoc;

  {Scale print size }
  ScaleX := Self.Width*3;
  ScaleY := Self.Height*3;

  {Just incase the printer drver is a palette device}
  isDcPalDevice := False;
  if GetDeviceCaps(Printer.Canvas.Handle, RASTERCAPS) and RC_PALETTE=RC_PALETTE
                   then
  begin
    {Create palette from dib}
    GetMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
    FillChar(pPal^, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)),
             #0);
    pPal^.palVersion := $300;
    pPal^.palNumEntries := 256;
    for i := 0 to (pPal^.palNumEntries-1) do
    begin
      pPal^.palPalEntry[i].peRed := PBitmapInfo(pDibHeader)^.bmiColors[i].rgbRed;
      pPal^.palPalEntry[i].peGreen := PBitmapInfo(pDibHeader)^.bmiColors[i].rgbGreen;
      pPal^.palPalEntry[i].peBlue := PBitmapInfo(pDibHeader)^.bmiColors[i].rgbBlue;
    end;
    pal := CreatePalette(pPal^);
    FreeMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
    OldPal := SelectPalette(Printer.Canvas.Handle, pal, False);
    isDcPalDevice := True
  end;
  {send the bits to the printer}
  StretchDiBits(Printer.Canvas.Handle, 0, 0, Round(ScaleX), Round(ScaleY),
                0, 0, Self.Width, Self.Height, pBits, PBitmapInfo(pDibHeader)^,
                DIB_RGB_COLORS, SRCCOPY);

  {Just incase you printer drver is a palette device}
  if isDcPalDevice=True then
  begin
    SelectPalette(Printer.Canvas.Handle, OldPal, False);
    DeleteObject(pal);
  end;
  {Clean up allocated memory}
  GlobalUnlock(hBits);
  GlobalFree(hBits);
  GlobalUnlock(hDibHeader);
  GlobalFree(hDibHeader);

  {end the print job}
  Printer.EndDoc;
end;

procedure TPBMaintCustFrm.PrintBmp(bmp: TBitmap);
var
  Info : PBitmapInfo;
  InfoSize : DWORD;
  Image : Pointer;
  ImageSize : DWORD;
  Bits : HBITMAP;
begin
  Bits := bmp.Handle; // bmp is passed as a parameter
  GetDIBSizes(Bits, InfoSize, ImageSize);
  Info := AllocMem(InfoSize);
  try
    Image := AllocMem(ImageSize);
    try
      GetDIB(Bits, 0, Info^, Image^);

      StretchDIBits(Printer.Canvas.Handle,5, 30, Bmp.Width, bmp.Height,0, 0, bmp.Width, bmp.Height,Image, Info^, DIB_RGB_COLORS, SRCCOPY);

    finally
      FreeMem(Image, ImageSize);
    end;
  finally
    FreeMem(Info, InfoSize);
  end;
end;

procedure TPBMaintCustFrm.FormCreate(Sender: TObject);
var
  sAnalysis: string;
begin
  dtmdlOneCustomer := TdtmdlCustomers.create(self);
  dtmdlCustEnqs := TdtmdlEnqs.create(self);
  dtmdlCustJobs := TdtmdlJobs.create(self);
  dtmdlCustOrders := TdtmdlOrders.create(self);
  dtmdlCustInvoices := TdmSalesInvoice.create(self);
  dtmdlCustStock := TdtmdlStock.create(self);
  dtmdlCustQuotes := TdtmdlQuotes.create(self);
  dtmdlCustActivity := TdtmdlActivity.create(self);

  dtmdlCustEnqs.dtsEnqs.OnDataChange := SetEnquiryButtons;
  dtmdlCustJobs.dtsJobs.OnDataChange := SetJobButtons;
  dtmdlCustOrders.dtsOrders.OnDataChange := SetOrderButtons;
  dtmdlCustStock.dtsStock.OnDataChange := SetStockButtons;
  dtmdlCustInvoices.dsSIHeaderGrid.OnDataChange := SetInvoiceButtons;
  dtmdlCustQuotes.dsQHeaderGrid.OnDataChange := SetQuoteButtons;
  dtmdlCustActivity.dtsActivityGrid.OnDataChange := SetActivityButtons;

  dtmdlCustInvoices.dsSIHeaderGrid.dataset.AfterScroll := SetSalesInvoiceEdit;

  {Default the name of the screen to customer. This will be changed if accessing the screen through the Prospect module}
  sStatusDescr := 'Customer';

  {set analysis code 1}
  sAnalysis := dmBroker.GetAnalysisCode1;
  if sAnalysis <> '' then
    begin
      lblAnalysis1.caption := sAnalysis;
      lblAnalysis1.visible := true;
      edtAnalysis1.visible := true;
    end;

  {set analysis code 2}
  sAnalysis := dmBroker.GetAnalysisCode2;
  if sAnalysis <> '' then
    begin
      lblAnalysis2.caption := sAnalysis;
      lblAnalysis2.visible := true;
      edtAnalysis2.visible := true;
    end;

  {set analysis code 3}
  sAnalysis := dmBroker.GetAnalysisCode3;
  if sAnalysis <> '' then
    begin
      lblAnalysis3.caption := sAnalysis;
      lblAnalysis3.visible := true;
      edtAnalysis3.visible := true;
    end;

  {set analysis code 4}
  sAnalysis := dmBroker.GetAnalysisCode4;
  if sAnalysis <> '' then
    begin
      lblAnalysis4.caption := sAnalysis;
      lblAnalysis4.visible := true;
      edtAnalysis4.visible := true;
    end;

  lblRevenueCentre.Visible := dmBroker.UseRevenueCentres;
  dblkpRevenueCentre.Visible := lblRevenueCentre.Visible;
  btnRevenueCentre.Visible := lblRevenueCentre.Visible;
  btnRevenueCentreClear.Visible := lblRevenueCentre.Visible;

  tbOptions.TabVisible := false;
  tbBranches.TabVisible := false;
  tbQuotes.TabVisible := false;
  tbEnquiries.TabVisible := false;
  tbOrders.TabVisible := false;
  tbJobs.TabVisible := false;
  tbStock.TabVisible := false;
  tbInvoices.TabVisible := false;
  tbDocuments.TabVisible := false;
  tbActivity.TabVisible := false;
  tbCrossSelling.TabVisible := false;

(*  pgCustomer.Pages[1].TabVisible := false;
  pgCustomer.Pages[2].TabVisible := false;
  pgCustomer.Pages[3].TabVisible := false;
  pgCustomer.Pages[4].TabVisible := false;
  pgCustomer.Pages[5].TabVisible := false;
  pgCustomer.Pages[6].TabVisible := false;
  pgCustomer.Pages[7].TabVisible := false;
  pgCustomer.Pages[8].TabVisible := false;
  pgCustomer.Pages[9].TabVisible := false;
  pgCustomer.Pages[10].TabVisible := false;
*)

  {Set the datasources of the data grids}
  dbgEnquiryDetails.DataSource := dtmdlCustEnqs.dtsEnqs;
  dbgJobDetails.DataSource := dtmdlCustJobs.dtsJobs;
  dbgOrderDetails.DataSource := dtmdlCustOrders.dtsOrders;
  dbgStockDetails.DataSource := dtmdlCustStock.dtsStock;
  dbgInvoiceDetails.DataSource := dtmdlCustInvoices.dsSIHeaderGrid;
  dbgQuoteDetails.DataSource := dtmdlCustQuotes.dsQHeaderGrid;
  dbgBranchDetails.DataSource := dtmdlOneCustomer.dtsCustomerBranches;
  dbgActivityDetails.DataSource := dtmdlCustActivity.dtsActivityGrid;

  (*  if dmBroker.UseProspects then
    begin
      pnlPaymentTerms.top := 341;
      lblStatus.Visible := true;
      dblkpCustStatus.Visible := true;
      dbgAccountCodes.Top := 365;
      dbgAccountCodes.height := 82;
    end
  else
    begin
//      pnlPaymentTerms.top := 317;
      pnlPaymentTerms.top := 137;
      lblStatus.Visible := false;
      dblkpCustStatus.Visible := false;
//      dbgAccountCodes.Top := 341;
      dbgAccountCodes.Top := 137;
      dbgAccountCodes.height := 108;
    end;
*)

  CCSCommon.SetDBGridCols('', 'CustomerActivityLU Col Order', frmPBMainMenu.AppIniFile, self.dbgActivityDetails);
  CCSCommon.SetDBGridCols('', 'CustomerBranchLU Col Order', frmPBMainMenu.AppIniFile, self.dbgBranchDetails);
  CCSCommon.SetDBGridCols('', 'CustomerContactLU Col Order', frmPBMainMenu.AppIniFile, self.dbgContactDetails);
  CCSCommon.SetDBGridCols('', 'CustomerHOContactLU Col Order', frmPBMainMenu.AppIniFile, self.dbgHOContactDetails);
  CCSCommon.SetDBGridCols('', 'CustomerQuotesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgQuoteDetails);
  CCSCommon.SetDBGridCols('', 'CustomerOrderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgOrderDetails);
  CCSCommon.SetDBGridCols('', 'CustomerEnqLU Col Order', frmPBMainMenu.AppIniFile, self.dbgEnquiryDetails);
  CCSCommon.SetDBGridCols('', 'CustomerJobLU Col Order', frmPBMainMenu.AppIniFile, self.dbgJobDetails);
  CCSCommon.SetDBGridCols('', 'CustomerStockLU Col Order', frmPBMainMenu.AppIniFile, self.dbgStockDetails);
  CCSCommon.SetDBGridCols('', 'CustomerInvoicesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgInvoiceDetails);
  CCSCommon.LoadFormLayout(myRedeye_INIFILE, self);
end;

procedure TPBMaintCustFrm.edtProdPrefixChange(Sender: TObject);
begin
  if edtProdPrefix.Text <> '' then
    self.RefreshPrefixList;
end;

procedure TPBMaintCustFrm.RefreshPrefixList;
begin
  dtmdlOneCustomer.qryCustProdPrefix.close;
  dtmdlOneCustomer.qryCustProdPrefix.paramByName('Product_Code_Prefix').asString := edtProdPrefix.text + '%';
  dtmdlOneCustomer.qryCustProdPrefix.open;
end;

procedure TPBMaintCustFrm.chkbxEInvoicingClick(Sender: TObject);
begin
  grpbxEInvoicing.Enabled := (sender as Tcheckbox).Checked;
end;

procedure TPBMaintCustFrm.UpdateProductStatus(sNotInUse: string);
begin
  with dtmdlOneCustomer.qryUpdProductStatus do
    begin
      close;
      parambyname('Customer').asinteger := iCode;
      parambyname('Not_In_Use').asstring := sNotInUse;
      execsql;
    end;
end;

procedure TPBMaintCustFrm.dblkpSystemClick(Sender: TObject);
begin
  with dtmdlOneCustomer.qrygetEInvoicing do
    begin
      close;
      parambyname('e_invoicing_system').asstring := dblkpSystem.keyvalue;
      open;
      edtUsername.text := fieldbyname('Connection_Username').asstring;
      edtPassword.text := fieldbyname('Connection_Password').asstring;
      edtSiteURL.text := fieldbyname('Transfer_Site_URL').asstring;

      if Fieldbyname('Transfer_Protocol_Type').asstring = 'EDI' then
        rdgrpProtocol.ItemIndex := 0
      else
      if Fieldbyname('Transfer_Protocol_Type').asstring = 'FTP' then
        rdgrpProtocol.ItemIndex := 1
      else
      if Fieldbyname('Transfer_Protocol_Type').asstring = 'HTTPS' then
        rdgrpProtocol.ItemIndex := 1
      else
        rdgrpProtocol.ItemIndex := 3;

    end;
end;

procedure TPBMaintCustFrm.pmnuDocumentsPopup(Sender: TObject);
begin
  pmnuDelete.Enabled := (lstvwDocuments.Items.count > 0);
  pmnuOpen.Enabled := (lstvwDocuments.Items.count > 0);
  pmnuSelectAll.Enabled := (lstvwDocuments.Items.count > 0);
end;

procedure TPBMaintCustFrm.Add1Click(Sender: TObject);
var
  docDir, tempStr, tempStr2: string;
  icount: integer;
begin
  docDir := dmBroker.GetCompanyCustomerDirectory + '\' + NameEdit.text;
  tempStr2 := docDir;

  tempStr := '';

  {Find a document} ;
  With DocOpenDialog do
  begin
    InitialDir := tempStr2;
    Filter := '';
    FileName := tempStr ;
    ForceCurrentDirectory := false;
    If Execute then
    begin
      {Check that they have NOT gone out of document directory} ;
      If Lowercase(Copy(FileName,1, Length(docDir))) <> Lowercase(docDir) then
      begin
        MessageDlg('You can''t select a document outside the Customer Document Directory',
                                                mtError,[mbOK],0) ;
      end
      else
      begin
        for icount := 0 to pred(Files.Count) do
          begin
            with dtmdlOnecustomer.qryAddDocument do
              begin
                close;
                parambyname('Customer').asinteger := iCustomer;
                parambyname('Document_no').asinteger := dtmdlOnecustomer.GetnextDocument(iCustomer);
                parambyname('Document_Title').asstring := Copy(Files.Strings[icount], Length(docDir)+2,100);
                parambyname('Document').asstring := Copy(Files.Strings[icount], length(dmBroker.GetCompanyCustomerDirectory)+1,255);
                parambyname('Date_Created').asdatetime := FileDateToDateTime(FileAge(Files.Strings[icount]));
                execsql;
              end;
          end;
        ShowDocuments;
//        dbgdocuments.Row := Quote.Documents.count;
      end;
    end;
  end;
end;

procedure TPBMaintCustFrm.mnuDocOpenClick(Sender: TObject);
var
  iTempResult: Integer;
  FiName, Params: Array [0..255] of char ;
  sTempError: String ;
  compdir, docPath: string;
begin
(*  if dbgDocuments.DataSource.DataSet.fieldbyname('Document_Title').asstring = '' then
    exit;

  compdir := dmBroker.GetCompanyCustomerDirectory;
  docPath := dbgDocuments.DataSource.DataSet.fieldbyname('Document').asstring;

  Params := '' ;
  StrPCopy(FiName, compdir+DocPath) ;

  {Use the WINDOWS SHELL to open the document};
  iTempResult := ShellExecute(0,'open',FiName,Params, '', 1) ;
  If iTempResult <= 32 then
  begin
    {There was an error} ;
    sTempError := 'An error occured opening the document - (' + IntToStr(iTempResult) + ')' ;
    Case iTempResult of
      ERROR_FILE_NOT_FOUND : sTempError := 'Document not found' ;
      ERROR_PATH_NOT_FOUND: sTempError := 'Document directory not found' ;
      ERROR_BAD_FORMAT: sTempError := 'The document format is corrupt' ;
      SE_ERR_ACCESSDENIED: sTempError := 'You''re not allowed to access the document' ;
      SE_ERR_ASSOCINCOMPLETE: sTempError := 'The document association is incomplete' ;
      SE_ERR_DDEBUSY: sTempError := 'The document is being used (DDE)' ;
      SE_ERR_DDEFAIL: sTempError :=  'Could not access the document (DDE)' ;
      SE_ERR_DDETIMEOUT: sTempError :=  'Accessing the document took too long (DDE)' ;
      SE_ERR_DLLNOTFOUND: sTempError :=  'A missing DDE is required to access the document' ;
      SE_ERR_NOASSOC: sTempError := 'There is no application on your PC that can open this document' ;
      SE_ERR_OOM: sTempError := 'Your PC does not have enough memory to open this document' ;
      SE_ERR_SHARE: sTempError := 'The document is being accessed by someone else' ;
    end;
    MessageDlg(sTempError,mtError,[mbOK],0) ;
  end;
*)
end;

procedure TPBMaintCustFrm.dbgDocumentsDblClick(Sender: TObject);
begin
  mnuDocOpenClick(self);
end;

procedure TPBMaintCustFrm.mnuDocChangeClick(Sender: TObject);
begin
  CallMaintDocuments('C');
end;

procedure TPBMaintCustFrm.CallMaintDocuments(const aMode: string);
var
  frm: TPBMaintDocumentFrm;
begin
(*  frm := TPBMaintDocumentFrm.Create(Self);

  try
    frm.Mode := aMode;

    frm.DocumentNo := dbgDocuments.datasource.dataset.fieldbyname('Document_no').asinteger;
    frm.DocumentPath := dbgDocuments.datasource.dataset.fieldbyname('Document').asstring;
    frm.DocumentTitle := dbgDocuments.datasource.dataset.fieldbyname('Document_Title').asstring;
    frm.DocumentDate := dbgDocuments.datasource.dataset.fieldbyname('Date_Created').asdatetime;
    Frm.ShowModal;

    if (Frm.ModalResult = mrOK) then
      begin
        if aMode = 'D' then
          begin
            with dtmdlOneCustomer.qryDelDocument do
              begin
                close;
                parambyname('Customer').asinteger := iCustomer;
                parambyname('Document_no').asinteger := frm.DocumentNo;
                execsql;
              end;
          end
        else
          begin
            with dtmdlOneCustomer.qryUpdDocument do
              begin
                close;
                parambyname('Customer').asinteger := iCustomer;
                parambyname('Document_no').asinteger := frm.DocumentNo;
                parambyname('Document').asstring := frm.DocumentPath;
                parambyname('Document_Title').asstring := frm.DocumentTitle;
                execsql;
              end;
          end;
        ShowDocuments;
      end;
  finally
    Frm.Free;
  end;
*)
end;

procedure TPBMaintCustFrm.mnuDocDeleteClick(Sender: TObject);
begin
  CallMaintDocuments('D');
end;

procedure TPBMaintCustFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  iTabIndex: integer;
  sTabName: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    iTabIndex := pgCustomer.ActivePageIndex;
//    sTabName := pgCustomer.pages[iTabIndex].name;

    if iTabIndex < 0 then
      iTabIndex := 0;

    if Prospect then
      begin
        IniFile.WriteString('Prospects', 'Default Customer Tab', inttostr(iTabIndex));
      end
    else
    if EndUser then
      begin
        IniFile.WriteString('End Users', 'Default Customer Tab', inttostr(iTabIndex));
      end
    else
      begin
        IniFile.WriteString('Customers', 'Default Customer Tab', inttostr(iTabIndex));
      end;
  finally
    inifile.free;
  end;

  dtmdlCustActivity.free;
  dtmdlCustQuotes.free;
  dtmdlCustInvoices.Free;
  dtmdlCustStock.Free;
  dtmdlCustOrders.Free;
  dtmdlCustJobs.Free;
  dtmdlCustEnqs.free;
  PBCustomerMemoFrm.Free;
  PBCustomerDNotesFrm.Free;

  CCSCommon.SaveDBGridCols('', 'CustomerActivityLU Col Order', frmPBMainMenu.AppIniFile, self.dbgActivityDetails);
  CCSCommon.SaveDBGridCols('', 'CustomerContactLU Col Order', frmPBMainMenu.AppIniFile, self.dbgContactDetails);
  CCSCommon.SaveDBGridCols('', 'CustomerHOContactLU Col Order', frmPBMainMenu.AppIniFile, self.dbgHOContactDetails);
  CCSCommon.SaveDBGridCols('', 'CustomerBrancheLU Col Order', frmPBMainMenu.AppIniFile, self.dbgBranchDetails);
  CCSCommon.SaveDBGridCols('', 'CustomerQuotesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgQuoteDetails);
  CCSCommon.SaveDBGridCols('', 'CustomerEnqLU Col Order', frmPBMainMenu.AppIniFile, self.dbgEnquiryDetails);
  CCSCommon.SaveDBGridCols('', 'CustomerOrderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgOrderDetails);
  CCSCommon.SaveDBGridCols('', 'CustomerJobLU Col Order', frmPBMainMenu.AppIniFile, self.dbgJobDetails);
  CCSCommon.SaveDBGridCols('', 'CustomerStockLU Col Order', frmPBMainMenu.AppIniFile, self.dbgStockDetails);
  CCSCommon.SaveDBGridCols('', 'CustomerInvoicesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgInvoiceDetails);
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintCustFrm.FormShow(Sender: TObject);
var
  tmpActivePage: TTabsheet;
begin
  {Decide which page to display initially}
//  if (sFuncMode = 'C') and not Prospect then
  if (sFuncMode = 'C') then
    begin
      try
        tmpActivePage := pgCustomer.Pages[self.GetActivePageIndex];
        pgCustomer.ActivePage := tmpActivePage;
      except
        pgCustomer.ActivePageIndex := 0;
      end;

      if not pgCustomer.Pages[pgCustomer.ActivePageIndex].tabVisible then
        pgCustomer.ActivePageIndex := 0;
    end
  else
    pgCustomer.ActivePageIndex := 0;

  if CreditCheck then
    pgCustomer.ActivePage := tbFinancials;

  if not Prospect and not EndUser then
    begin
      tbQuotes.TabVisible := dmBroker.UseProduction AND frmPBMainMenu.btnQuotes.enabled;  {Production}
      tbJobs.TabVisible := frmPBMainMenu.btnJobs.visible AND frmPBMainMenu.btnJobs.enabled;   {Job Bags}
      tbStock.TabVisible := frmPBMainMenu.btnStock.visible;  {Stock}

(*      pgCustomer.Pages[3].TabVisible := dmBroker.UseProduction;  {Production}
      pgCustomer.Pages[6].TabVisible := frmPBMainMenu.btnJobs.visible;   {Job Bags}
      pgCustomer.Pages[7].TabVisible := frmPBMainMenu.btnStock.visible;  {Stock}
*)
    end;

  btnOrderAllocatefnc.visible := frmPBMainMenu.UseStockSystem;
  btnOrderPicking.visible := frmPBMainMenu.UseStockSystem;
  btnOrderSeparator1.visible := frmPBMainMenu.UseStockSystem;

  if CreditCheck and dmBroker.CanChangeCreditDetails(frmPBMainMenu.iOperator) then
    begin
      pnlCreditDetails.Enabled := true;
      pnlInvoiceDetails.Enabled := true;
      EnableCreditDetails;
      EnableInvoicingDetails;
    end;
end;


procedure TPBMaintCustFrm.DisableCreditDetails;
var
  iCount: integer;
begin
  for iCount := 0 to pred(componentcount) do
    begin
      if Components[iCount].Tag = 100 then
        begin
          if Components[iCount] is TLabel then
            TLabel(Components[iCount]).font.color := clGray
          else
          if Components[iCount] is TEdit then
            TEdit(Components[iCount]).enabled := false
          else
          if Components[iCount] is TSpinEdit then
            TSpinEdit(Components[iCount]).enabled := false
          else
          if Components[iCount] is TBitBtn then
            TBitBtn(Components[iCount]).enabled := false
          else
          if Components[iCount] is TCheckBox then
            TCheckBox(Components[iCount]).enabled := false
          else
          if Components[iCount] is TMemo then
            TMemo(Components[iCount]).enabled := false
          else
          if Components[iCount] is TRadioGroup then
            TRadioGroup(Components[iCount]).enabled := false
          else
          if Components[iCount] is TDBLookupComboBox then
            TDBLookupComboBox(Components[iCount]).enabled := false;
        end;
    end;
end;

procedure TPBMaintCustFrm.BitBtn4Click(Sender: TObject);
begin
  dblkppaymentTerms.KeyValue := 0;
  DDCodeEdit.visible := false;
  lblDirectDebit.visible := DDCodeEdit.visible;
end;

procedure TPBMaintCustFrm.btnTermsClick(Sender: TObject);
begin
  PBLUPaymentTermsFrm := TPBLUPaymentTermsFrm.Create(self) ;
  try
    PBLUPaymentTermsFrm.bIs_Lookup := False ;
    PBLUPaymentTermsFrm.bAllow_Upd := True ;
    PBLUPaymentTermsFrm.SelCode := dblkpPaymentTerms.keyvalue ;
    PBLUPaymentTermsFrm.ShowModal ;
  Finally;
    PBLUPaymentTermsFrm.Free ;
  end;

  dtmdlOneCustomer.qryTerms.Active := False;
  dtmdlOneCustomer.qryTerms.Active := True;

end;

procedure TPBMaintCustFrm.Button4Click(Sender: TObject);
var
  docDir, tempstr, tempstr2: string;
begin
  docDir := dmBroker.GetCompanyCustomerDirectory + '\' + NameEdit.text;
  tempStr2 := docDir;

  tempStr := '';

  {Find a document} ;
  With DocOpenDialog do
  begin
    InitialDir := tempStr2;
    Filter := 'Bitmap files (*.bmp)|*.BMP';
    FileName := tempStr ;
    ForceCurrentDirectory := false;
    If Execute then
    begin
      edtLogoLocation.Text := Filename
    end;
  end;
end;

procedure TPBMaintCustFrm.ChkBxOnLnOrdClick(Sender: TObject);
begin
  grpbxOnline.Enabled := (sender as Tcheckbox).Checked;

end;

procedure TPBMaintCustFrm.memPrepayBalanceExit(Sender: TObject);
begin
  if memPrePayBalance.Text <> '' then
  begin
    try
      memPrePayBalance.Text := FormatFloat('######0.00', StrToFloatDef(memPrePayBalance.Text, 0, FormatSettings))
    except
      MessageDlg('Invalid value', mtError, [mbOK], 0);
      memPrePayBalance.SetFocus;
    end;
  end;
end;

procedure TPBMaintCustFrm.btnRevenueCentreClearClick(Sender: TObject);
begin
  dblkpRevenuecentre.KeyValue := 0;
end;

procedure TPBMaintCustFrm.btnRevenueCentreClick(Sender: TObject);
begin
  PBLURevenueLocFrm := TPBLURevenuelocFrm.Create(self) ;
  try
    PBLURevenueLocFrm.bIs_Lookup := False ;
    PBLURevenueLocFrm.bAllow_Upd := True ;

    try
      PBLURevenueLocFrm.SelCode := dblkpRevenueCentre.keyvalue ;
    except
      PBLURevenueLocFrm.SelCode := '' ;
    end;

    PBLURevenueLocFrm.ShowModal ;
  Finally;
    PBLURevenueLocFrm.Free ;
  end;

  dtmdlOneCustomer.qryRevenueCentre.Active := False;
  dtmdlOneCustomer.qryRevenueCentre.Active := True;

end;

procedure TPBMaintCustFrm.dblkpPaymentTermsClick(Sender: TObject);
begin
  with dtmdlOneCustomer.qryGetTerms do
    begin
      close;
      parambyname('Payment_Terms').asinteger := dblkpPaymentTerms.keyvalue;
      open;
      DDCodeEdit.visible := (fieldbyname('Payment_Type').asstring = 'DD');
      lblDirectDebit.visible := DDCodeEdit.visible;
    end;
end;

procedure TPBMaintCustFrm.BitBtn5Click(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(self) ;
  try
    PBLUCContaFrm.bIs_Lookup := true ;
    PBLUCContaFrm.bAllow_Upd := True ;
    PBLUCContaFrm.icust := iInvToCust;
    PBLUCContaFrm.iBranch := iInvToBranch;
    PBLUCContaFrm.SelCode := iInvToContact;
    PBLUCContaFrm.sCustName := edtInvToCustomer.text;
    PBLUCContaFrm.sBranchName := edtInvToBranch.text;
    PBLUCContaFrm.ShowModal ;
    if PBLUCContaFrm.bselected then
      begin
        iInvToContact := PBLUCContaFrm.selCode;
        edtInvToContact.text := PBLUCContaFrm.SelName;
        edtInvToContactEmail.text := PBLUCContaFrm.SelNameEmail;
      end;
  Finally;
    PBLUCContaFrm.Free ;
  end;
end;

procedure TPBMaintCustFrm.ShowContactName(Sender: TObject);
begin
  with dtmdlOneCustomer.GetcontactNameSQL do
    begin
      Close;
      ParamByName('Branch_No').AsInteger := iInvToBranch;
      if iInvToCust <> 0 then
        ParamByName('Customer').AsInteger := iInvToCust
      else
        ParamByName('Customer').AsInteger := iCode;
      ParamByName('Contact_no').AsInteger := iInvToContact;
      Open;
      First;
      edtInvToContact.text := FieldByName('Name').AsString;
      edtInvToContactEmail.text := FieldByName('Email').AsString;
    end;
end;

procedure TPBMaintCustFrm.NameEditExit(Sender: TObject);
var
  sAccCode: string;
  icount: integer;
begin
  if (dmBroker.DefaultCustomerAccCode) and (sFuncMode = 'A') then
    begin
      sAccCode := leftstr(stringreplace(trim(NameEdit.Text), ' ', '',[rfReplaceAll]),8);

      if dmBroker.CustomerAccCodeunique then
        begin
          icount := 0;

          while icount >= 0 do
            begin
              with dtmdlOneCustomer.CheckCustAccExistsSQL do
                begin
                  Close;
                  ParamByName('Acc_Code').AsString := sAccCode;
                  ParamByName('Customer').AsInteger := iCode;
                  Open;
                  if recordcount > 0 then
                    begin
                      icount := icount + 1;
                      if icount < 10 then
                        sAccCode := leftStr(sAccCode,7) + inttostr(icount)
                      else
                      if icount < 100 then
                        sAccCode := leftStr(sAccCode,6) + inttostr(icount)
                      else
                        sAccCode := leftStr(sAccCode,5) + inttostr(icount);
                    end
                  else
                    begin
                      break;
                    end;
                end;
            end;
        end;

      AccCodeEdit.Text := sAccCode;
    end;
end;

procedure TPBMaintCustFrm.SetProspect(const Value: boolean);
begin
  FProspect := Value;
  if FProspect then
    begin
      sStatusDescr := 'Prospect ';

      tbOptions.TabVisible := true;
      tbBranches.TabVisible := true;

      tbQuotes.TabVisible := false;
      tbEnquiries.TabVisible := frmPBMainMenu.btnEnquiries.enabled;
      tbOrders.TabVisible := false;
      tbJobs.TabVisible := false;
      tbStock.TabVisible := false;
      tbInvoices.TabVisible := false;
      tbDocuments.TabVisible := true;
      tbActivity.TabVisible := frmPBMainMenu.UseCRMSystem;
      tbCrossSelling.TabVisible := true;

(*      pgCustomer.Pages[1].TabVisible := true;
      pgCustomer.Pages[2].TabVisible := true;
      pgCustomer.Pages[3].TabVisible := false;
      pgCustomer.Pages[4].TabVisible := false;
      pgCustomer.Pages[5].TabVisible := false;
      pgCustomer.Pages[6].TabVisible := false;
      pgCustomer.Pages[7].TabVisible := false;
      pgCustomer.Pages[8].TabVisible := false;
      pgCustomer.Pages[9].TabVisible := true;   {Documents}
      pgCustomer.Pages[10].TabVisible := true; {Activity}
      pgCustomer.Pages[11].TabVisible := true; {Cross Selling}
*)

//      pnlPaymentTerms.Visible := false;


      pnlInvoiceDetails.enabled := true;
      pnlCreditDetails.enabled := false;

//      DisableInvoicingDetails;
      DisableCreditDetails;

      lblStatus.Visible := true;
      dblkpCustStatus.Visible := true;

      NotesBitBtn.visible := false;
      DelivNotesBitBtn.Visible := false;

      chkbxConverttoCustomer.Visible := true;

      ActiveChkbox.caption := sStatusDescr + ' is active'
    end
  else
    begin
      sStatusDescr := 'Customer ';

      tbOptions.TabVisible := true;
      tbBranches.TabVisible := true;
      tbQuotes.TabVisible := true;
      tbEnquiries.TabVisible := frmPBMainMenu.btnEnquiries.enabled;
      tbOrders.TabVisible := true;
      tbJobs.TabVisible := true;
      tbStock.TabVisible := true;
      tbInvoices.TabVisible := true;
      tbDocuments.TabVisible := true;
      tbActivity.TabVisible := frmPBMainMenu.UseCRMSystem;
      tbCrossSelling.TabVisible := true;

(*      pgCustomer.Pages[1].TabVisible := true;
      pgCustomer.Pages[2].TabVisible := true;
      pgCustomer.Pages[3].TabVisible := true;
      pgCustomer.Pages[4].TabVisible := true;
      pgCustomer.Pages[5].TabVisible := true;
      pgCustomer.Pages[6].TabVisible := true;  {Credit Checking}
      pgCustomer.Pages[7].TabVisible := true;
      pgCustomer.Pages[8].TabVisible := true;
      pgCustomer.Pages[9].TabVisible := true;   {Documents}
      pgCustomer.Pages[10].TabVisible := true; {Activity}
      pgCustomer.Pages[11].TabVisible := true; {Cross Selling}
*)

//      pnlPaymentTerms.Visible := true;

      {Format the screen}
      pnlInvoiceDetails.Enabled := true;
      pnlCreditDetails.enabled := true;

      EnableInvoicingDetails;
      EnableCreditDetails;

      lblStatus.Visible := true;
      dblkpCustStatus.Visible := true;

      NotesBitBtn.visible := true;
      DelivNotesBitBtn.Visible := true;

      chkbxConverttoCustomer.Visible := false;

      if dmBroker.UseCreditChecking then
        begin
          pnlCreditDetails.Enabled := dmBroker.CanChangeCreditDetails(frmPBMainMenu.iOperator);
          pnlInvoiceDetails.Enabled := dmBroker.CanChangeCreditDetails(frmPBMainMenu.iOperator);
//          tbFinancials.enabled := dmBroker.CanChangeCreditDetails(frmPBMainMenu.iOperator);
//          pgCustomer.Pages[6].enabled := dmBroker.CanChangeCreditDetails(frmPBMainMenu.iOperator);
        end;

      if not pnlCreditDetails.enabled then
        DisableCreditDetails
      else
        EnableCreditDetails;

      ActiveChkbox.caption := sStatusDescr + ' is active'
    end;
end;

procedure TPBMaintCustFrm.btnLastReturnDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := PBDateStr(edtLastReturnDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtLastReturnDate.Text := PBDateStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
  checkok(self);
end;

procedure TPBMaintCustFrm.edtLastReturnDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If (Sender as TEdit).Text = '' then
    Exit;
  try
    NewDate := PBDateStr((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := PBDatestr(NewDate);

end;

procedure TPBMaintCustFrm.SetCreditCheck(const Value: boolean);
begin
  FCreditCheck := Value;
  self.Caption := 'Credit Check - ';
end;

procedure TPBMaintCustFrm.btnAccLodgedDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := PBDateStr(edtAccLodgedDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtAccLodgedDate.Text := PBDateStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
  checkok(self);
end;

procedure TPBMaintCustFrm.btnAccountsFiledDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := PBDateStr(edtAccountsFiledDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtAccountsFiledDate.Text := PBDateStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
  checkok(self);
end;

procedure TPBMaintCustFrm.AccCodeEditChange(Sender: TObject);
begin
  with dtmdlOneCustomer.qryGetAccCodes do
    begin
      close;
      parambyname('Account_Code').asstring := (Sender as TEdit).text + '%';
      parambyname('Customer').asinteger := icustomer;
      open;
    end;
end;

procedure TPBMaintCustFrm.lstvwDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
  sPath := dmBroker.GetCompanyCustomerDirectory + '\' + Nameedit.text + '\';
  if sPath = '' then
    exit;

  if lstvwDocuments.ItemIndex = -1 then
    begin
      sDoc := '';
      exit;
    end
  else
    begin
      sDoc := lstvwDocuments.Items[lstvwDocuments.ItemIndex].caption;
    end;

  Params := '' ;
  StrPCopy(FiName, sPath + sDoc) ;

  {Use the WINDOWS SHELL to open the document};
  iTempResult := ShellExecute(0,'open',FiName,Params, '', 1) ;
  If iTempResult <= 32 then
  begin
    {There was an error} ;
    sTempError := 'An error occured opening the document - (' + IntToStr(iTempResult) + ')' ;
    Case iTempResult of
      ERROR_FILE_NOT_FOUND : sTempError := 'Document not found' ;
      ERROR_PATH_NOT_FOUND: sTempError := 'Document directory not found' ;
      ERROR_BAD_FORMAT: sTempError := 'The document format is corrupt' ;
      SE_ERR_ACCESSDENIED: sTempError := 'You''re not allowed to access the document' ;
      SE_ERR_ASSOCINCOMPLETE: sTempError := 'The document association is incomplete' ;
      SE_ERR_DDEBUSY: sTempError := 'The document is being used (DDE)' ;
      SE_ERR_DDEFAIL: sTempError :=  'Could not access the document (DDE)' ;
      SE_ERR_DDETIMEOUT: sTempError :=  'Accessing the document took too long (DDE)' ;
      SE_ERR_DLLNOTFOUND: sTempError :=  'A missing DDE is required to access the document' ;
      SE_ERR_NOASSOC: sTempError := 'There is no application on your PC that can open this document' ;
      SE_ERR_OOM: sTempError := 'Your PC does not have enough memory to open this document' ;
      SE_ERR_SHARE: sTempError := 'The document is being accessed by someone else' ;
    end;
    MessageDlg(sTempError,mtError,[mbOK],0) ;
  end;
end;

procedure TPBMaintCustFrm.btnWordClick(Sender: TObject);
var
  compdir, docdir, jobBagDir, docExt, sPAth: string;
  sFullFile, sFileName: string;
  iLength, ipos, i: integer;
  stemp: string;
  okToSave, userCancelled, docsaved: boolean;
begin
  docDir := dmBroker.GetCompanyCustomerDirectory + '\' + NameEdit.text;
  compDir := dmBroker.GetCompanyCustomerDirectory;

  okToSave := false;
  userCancelled := false;
  docsaved := false;

  if (Sender as TToolButton) = btnWord then
  begin
    docExt := '.doc';
    svDlgOfficeDoc.Filter := 'Word Document(*.doc; *.docx)|*.doc; *.docx';
    svDlgOfficeDoc.FileName := 'New Document';
  end
  else if (Sender as TToolButton) = btnExcel then
  begin
    docExt := '.xls';
    svDlgOfficeDoc.Filter := 'Excel Worksheet(*.xls)|*.xls';
    svDlgOfficeDoc.FileName := 'New Book';
  end
  else
  begin
    exit; //go no further
  end;

  svDlgOfficeDoc.InitialDir := docDir;
  svDlgOfficeDoc.DefaultExt := copy(docExt, 2, 3);

  while (okToSave = false) and (userCancelled = false) do
    begin
      //prompt user for file name
      if svDlgOfficeDoc.execute then
      begin
        //is file in default directory
        iLength := length(docdir);
        sTemp := copy(svDlgOfficeDoc.FileName, 1,iLength);

        if (copy(svDlgOfficeDoc.FileName, 1, length(docDir)) = docDir) then
        begin
          //does file exists
          if fileExists(svDlgOfficeDoc.FileName) then
          begin
            MessageDlg('This file name already exists, please choose another file name.', mtWarning, [mbOK], 0);
            okToSave := false;
          end
          else
          begin
            okToSave := true;
          end;
        end
        else
        begin
          MessageDlg('You can''t save a document outside the Customer Document Directory',
                                                mtError,[mbOK],0) ;
          svDlgOfficeDoc.FileName := '';
          svDlgOfficeDoc.InitialDir := docDir;
          okToSave := false;
        end;
      end
      else
      begin
        userCancelled := true;  //the user cancelled the save dialogue
      end;
    end;

  if (userCancelled = false) then
    begin
      sPath := copy(svDlgOfficeDoc.FileName, length(compdir)+1, length(svDlgOfficeDoc.FileName));

      {get file name}
      sfullFile := sPath;

      iLength := length(sFullFile);

      while i <> 0 do
        begin
          ipos := pos('\',sFullFile);
          sFullFile := stringreplace(sFullFile, '\', '!', []);

          i := pos('\',sFullFile);
        end;

      sFileName := copy(sPath, ipos+1, (iLength - ipos));

      if docExt = '.doc' then
      begin
        try
          PBWordOLEFrm := TPBWordOLEFrm.Create(self);
          PBWordOLEFrm.SaveAsDocument(compDir+sPath);
          docSaved := true;
        finally
          PBWordOLEFrm.Free;
        end;
      end
      else
      begin
        try
          PBExcelOLEFrm := TPBExcelOLEFrm.Create(self);
          PBExcelOLEFrm.SaveAsDocument(compDir+sPath);
          docSaved := true;
        finally
          PBExcelOLEFrm.Free;
        end;
      end;

      ShowDocuments;
      
      if docSaved then
      begin
        lstvwDocuments.itemindex := -1;
        for i := 0 to pred(lstvwDocuments.Items.count) do
          begin
            if lstvwDocuments.Items[i].caption = sFileName then
              lstvwDocuments.itemindex := i;
          end;
        if lstvwDocuments.itemindex >= 0 then
          lstvwDocumentsDblClick(self);
      end;
    end
    else
    begin
    end;
end;

procedure TPBMaintCustFrm.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  PBMaintEmailFrm := TPBMaintEmailFrm.create(self);
  try
    PBMaintEmailFrm.Supplier := 0;
    PBMaintEmailFrm.SupplierBranch := 0;
    PBMaintEmailFrm.SupplierContact := 0;
    PBMaintEmailFrm.AddressType := 0;
    PBMaintEmailFrm.Customer := iCustomer;
    PBMaintEmailFrm.CustomerBranch := 0;
    PBMaintEmailFrm.CustomerContact := 0;
    PBMaintEmailFrm.showmodal;
    if PBMaintEmailFrm.modalresult = idOK then
      begin
        sTo := PBMaintEmailFrm.edtEmail.text;
        sSubject := PBMaintEmailFrm.edtSubject.text;
        SendAndSaveEmail(sTo, sSubject);
      end;
  finally
    PBMaintEmailFrm.free;
  end;
end;

procedure TPBMaintCustFrm.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  docdir, compdir, docExt: string;
begin
  docDir := dmBroker.GetCompanyCustomerDirectory + '\' + NameEdit.text;
  compDir := dmBroker.GetCompanyCustomerDirectory;

  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  sBody := '';
  sfilePath := docdir;
  okToSave := false;

  EmailAndSaveViaOutlook(sTo, sSubject, sBody, sFilePath, okToSave, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

  if okToSave then
    begin
       ShowDocuments;
    end;
end;

procedure TPBMaintCustFrm.btnAttachClick(Sender: TObject);
var
  i, ipos, ilength, icount: integer;
  sFile, sFullFile, docDir: string;
begin
  docDir := dmBroker.GetCompanyCustomerDirectory + '\' + NameEdit.text;
  {Find a document} ;

  if not DirectoryExists(docDir) then
  	begin
     	CreateDirectory(docDir);
  	end;

  DocOpenDialog.Files.Clear;
  if DocOpenDialog.Execute then
  begin
    if DocOpenDialog.Files.Count > 0 then
      begin
        for icount := 0 to pred(DocOpenDialog.Files.Count) do
          begin
            sfullFile := DocOpenDialog.Files.Strings[icount];
            iLength := length(sFullFile);

            i := 1;

            while i <> 0 do
              begin
                ipos := pos('\',sFullFile);

                sFullFile := stringreplace(sFullFile, '\', '!', []);

                i := pos('\',sFullFile);
              end;

            sFile := copy(DocOpenDialog.Files.Strings[icount], ipos+1, (iLength - ipos));

            FileCopy(DocOpenDialog.Files.Strings[icount], docDir + '\' + sfile) ;
          end;
        ShowDocuments;
      end;
  end;
end;

procedure TPBMaintCustFrm.FormResize(Sender: TObject);
begin
  pnlInvoiceDetails.Width := trunc((self.width/2));
//  pnlHOContacts.width := self.width - pnlGeneralDetails.width - pnlContactCategories.width
end;

procedure TPBMaintCustFrm.btnLevelOfImportanceClick(Sender: TObject);
begin
  PBLULevelOfImportanceFrm := TPBLULevelOfImportanceFrm.Create(self) ;
  try
    PBLULevelOfImportanceFrm.bIs_Lookup := False ;
    PBLULevelOfImportanceFrm.bAllow_Upd := True ;
    PBLULevelOfImportanceFrm.SelCode := dblkpLevelOfImportance.keyvalue ;
    PBLULevelOfImportanceFrm.ShowModal ;
  Finally;
    PBLULevelOfImportanceFrm.Free ;
  end;

  dtmdlOneCustomer.qryGetImportance.Active := False;
  dtmdlOneCustomer.qryGetImportance.Active := True;

end;

procedure TPBMaintCustFrm.BitBtn7Click(Sender: TObject);
begin
  dblkpLevelOfImportance.KeyValue := 0;
end;

procedure TPBMaintCustFrm.BitBtn2Click(Sender: TObject);
begin
  PBLUCountryFrm := TPBLUCountryFrm.Create(self) ;
  try
    PBLUCountryFrm.bIs_Lookup := False ;
    PBLUCountryFrm.bAllow_Upd := True ;

    try
      PBLUCountryFrm.SelCode := dblkpCountry.keyvalue ;
    except
      PBLUCountryFrm.SelCode := '' ;
    end;

    PBLUCountryFrm.ShowModal ;
  Finally;
    PBLUCountryFrm.Free ;
  end;

  dtmdlOneCustomer.qryGetImportance.Active := False;
  dtmdlOneCustomer.qryGetImportance.Active := True;

end;

procedure TPBMaintCustFrm.DisableInvoicingDetails;
var
  iCount: integer;
begin
  for iCount := 0 to pred(componentcount) do
    begin
      if Components[iCount].Tag = 200 then
        begin
          if Components[iCount] is TLabel then
            TLabel(Components[iCount]).font.color := clGray
          else
          if Components[iCount] is TEdit then
            TEdit(Components[iCount]).enabled := false
          else
          if Components[iCount] is TSpinEdit then
            TSpinEdit(Components[iCount]).enabled := false
          else
          if Components[iCount] is TBitBtn then
            TBitBtn(Components[iCount]).enabled := false
          else
          if Components[iCount] is TCheckBox then
            TCheckBox(Components[iCount]).enabled := false
          else
          if Components[iCount] is TMemo then
            TMemo(Components[iCount]).enabled := false
          else
          if Components[iCount] is TRadioGroup then
            TRadioGroup(Components[iCount]).enabled := false
          else
          if Components[iCount] is TDBLookupComboBox then
            TDBLookupComboBox(Components[iCount]).enabled := false;
        end;
    end;
end;

procedure TPBMaintCustFrm.EnableCreditDetails;
var
  iCount: integer;
begin
  for iCount := 0 to pred(componentcount) do
    begin
      if Components[iCount].Tag = 100 then
        begin
          if Components[iCount] is TLabel then
            TLabel(Components[iCount]).font.color := clBlack
          else
          if Components[iCount] is TEdit then
            TEdit(Components[iCount]).enabled := true
          else
          if Components[iCount] is TSpinEdit then
            TSpinEdit(Components[iCount]).enabled := true
          else
          if Components[iCount] is TBitBtn then
            TBitBtn(Components[iCount]).enabled := true
          else
          if Components[iCount] is TCheckBox then
            TCheckBox(Components[iCount]).enabled := true
          else
          if Components[iCount] is TMemo then
            TMemo(Components[iCount]).enabled := true
          else
          if Components[iCount] is TRadioGroup then
            TRadioGroup(Components[iCount]).enabled := true
          else
          if Components[iCount] is TDBLookupComboBox then
            TDBLookupComboBox(Components[iCount]).enabled := true;
        end;
    end;
end;

procedure TPBMaintCustFrm.EnableInvoicingDetails;
var
  iCount: integer;
begin
  for iCount := 0 to pred(componentcount) do
    begin
      if Components[iCount].Tag = 200 then
        begin
          if Components[iCount] is TLabel then
            TLabel(Components[iCount]).font.color := clBlack
          else
          if Components[iCount] is TEdit then
            TEdit(Components[iCount]).enabled := true
          else
          if Components[iCount] is TSpinEdit then
            TSpinEdit(Components[iCount]).enabled := true
          else
          if Components[iCount] is TBitBtn then
            TBitBtn(Components[iCount]).enabled := true
          else
          if Components[iCount] is TCheckBox then
            TCheckBox(Components[iCount]).enabled := true
          else
          if Components[iCount] is TMemo then
            TMemo(Components[iCount]).enabled := true
          else
          if Components[iCount] is TRadioGroup then
            TRadioGroup(Components[iCount]).enabled := true
          else
          if Components[iCount] is TDBLookupComboBox then
            TDBLookupComboBox(Components[iCount]).enabled := true;
        end;
    end;
end;

procedure TPBMaintCustFrm.ParseMessage(const AFileName: string; var ATo, AFrom,
  ASubject, ADate, ABody: string);
var
  iLength: integer;
  MyUnicode: Boolean;
  MyFileStream: TFileStream;
  MyFileSize: Integer;
  MyDataHandle: HGlobal;
  MyBuffer: Pointer;
  MyLockBytes: ILockBytes;
  MyStorage: IStorage;
  MyHeader: string;
  MyStrings: TStrings;

  function MyGetProperty(const AStorage: IStorage; AProperty: Word): string;
  const
    MyTString: array[Boolean] of Word = (PT_STRING8, PT_UNICODE);
  var
    MyIStream: IStream;
    MyStreamName: WideString;
    MyOleStream: TOleStream;
    MyStream: TMemoryStream;
    MySucceeded: Boolean;
  begin
{ Construct the predefined stream name }
    MyStreamName := Format('__substg1.0_%.4x%.4x', [AProperty, MyTString[MyUnicode]]);
{ Read a stream, if present, within the storage. }
    MySucceeded := Succeeded(AStorage.OpenStream(PWideChar(MyStreamName), nil,
      STGM_READ or STGM_SHARE_EXCLUSIVE, 0, MyIStream));
    if not MySucceeded then begin
{ Turn MyUnicode over }
      MyUnicode := not MyUnicode;
      MyStreamName := Format('__substg1.0_%.4x%.4x', [AProperty, MyTString[MyUnicode]]);
      MySucceeded := Succeeded(AStorage.OpenStream(PWideChar(MyStreamName), nil,
        STGM_READ or STGM_SHARE_EXCLUSIVE, 0, MyIStream));
    end;
    if MySucceeded then begin
      MyOleStream := TOleStream.Create(MyIStream);
      try
        MyStream := TMemoryStream.Create;
        try
          MyStream.CopyFrom(MyOleStream, 0);
          if MyUnicode then
            Result := PWideChar(MyStream.Memory)
          else
            Result := PChar(MyStream.Memory);
          SetLength(Result, StrLen(PChar(Result))); //  Remove the final #0
        finally
          MyStream.Free;
        end;
      finally
        MyOleStream.Free;
      end;
    end;
  end;

begin
{ Open the copy of the message stored in the project directory }
  MyFileStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    MyFileSize := MyFileStream.Size;
{ Open the file as a Structured Storage }
    MyDataHandle := GlobalAlloc(GMEM_MOVEABLE, MyFileSize);
    try
      MyBuffer := GlobalLock(MyDataHandle);
      try
        MyFileStream.ReadBuffer(MyBuffer^, MyFileSize);
      finally
        GlobalUnlock(MyDataHandle);
      end;

      OleCheck(CreateILockBytesOnHGlobal(MyDataHandle, True, MyLockBytes));
      OleCheck(StgOpenStorageOnILockBytes(MyLockBytes, nil, STGM_READWRITE or
        STGM_SHARE_EXCLUSIVE, nil, 0, MyStorage));

{ Outlook 97/2000 return ANSI strings, Outlook XP/2003 return Unicode strings.
 MyUnicode will be turned on/off in MyGetProperty automatically. }
      MyUnicode := True;
{ If the message came from the Internet, it has got a RFC-compliant header }
      MyHeader := MyGetProperty(MyStorage, PR_TRANSPORT_MESSAGE_HEADERS);
{ Otherwise, construct a simple substitute from internal properties. }
      if MyHeader = '' then begin
        MyHeader :=
          'To: ' + MyGetProperty(MyStorage, PR_DISPLAY_TO) +
          ' ' + MyGetProperty(MyStorage, PR_DISPLAY_CC) +
          ' ' + MyGetProperty(MyStorage, PR_DISPLAY_BCC) + #13#10 +
          'From: ' + MyGetProperty(MyStorage, PR_SENDER_NAME) +
          ' ' + MyGetProperty(MyStorage, PR_SENDER_EMAIL_ADDRESS) + #13#10 +
          'Subject: ' + MyGetProperty(MyStorage, PR_SUBJECT) + #13#10 +
          'Date: ' + MyGetProperty(MyStorage, PR_LAST_MODIFICATION_TIME);
      end;
      ABody := MyGetProperty(MyStorage, PR_BODY);

    finally
      GlobalFree(MyDataHandle);
    end;
  finally
    MyFileStream.Free;
  end;

  { Parse the header as an RFC-compliant header. Exploit INI-files support buil-in in TStrings }
  MyHeader := StringReplace(MyHeader, 'To: ', 'To=', [rfReplaceAll, rfIgnoreCase]);
  MyHeader := StringReplace(MyHeader, 'From: ', 'From=', [rfReplaceAll, rfIgnoreCase]);
  MyHeader := StringReplace(MyHeader, 'Subject: ', 'Subject=', [rfReplaceAll, rfIgnoreCase]);
  MyHeader := StringReplace(MyHeader, 'Date: ', 'Date=', [rfReplaceAll, rfIgnoreCase]);
  MyStrings := TStringList.Create;
  try
    MyStrings.Text := MyHeader;
    ATo := MyStrings.Values['To'];
    AFrom := MyStrings.Values['From'];
    AFrom := ParseDocumentFrom(AFrom);
    ASubject := MyStrings.Values['Subject'];
    ADate := MyStrings.Values['Date'];
  finally
    MyStrings.Free;
  end;
{ Trancate the body text and remove line-ends }
  ABody := StringReplace(Copy(ABody, 0, 64), #13, ' ', [rfReplaceAll]);
  ABody := StringReplace(ABody, #10, ' ', [rfReplaceAll]) + ' ...';
end;

function TPBMaintCustFrm.ParseDocumentFrom(tmpFrom: string): string;
var
  icount: integer;
  Alphas, Numbers: string;
begin
  Alphas := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ';
  Numbers := '01234567890.';

  Result := '';

  if pos('@',tmpFrom) = 0 then
    begin
      for icount := 1 to length(tmpFrom) do
        begin
          if pos(copy(tmpFrom,icount,1),Alphas) > 0 then
            begin
              Result := Result + copy(tmpFrom,icount,1);
              continue;
            end;
          if pos(copy(tmpFrom,icount,1),Numbers) > 0 then
            begin
              Result := Result + copy(tmpFrom,icount,1);
              continue;
            end;
        end;
    end
  else
    result := trim(stringreplace(tmpFrom,'"', ' ',[rfReplaceAll]));
end;

function TPBMaintCustFrm.FormatDateasDateTime(sDate: string): TDateTime;
var
  icount, iStart, iLength: integer;
  tmpDate: string;
  Months: array [1..2,1..12] of string;
begin
  iStart := pos(',',sDate)+1;
  iLength := length(sDate);
  tmpDate := copy(sDate,iStart,21);

  Months[1,1] := '01';
  Months[1,2] := '02';
  Months[1,3] := '03';
  Months[1,4] := '04';
  Months[1,5] := '05';
  Months[1,6] := '06';
  Months[1,7] := '07';
  Months[1,8] := '08';
  Months[1,9] := '09';
  Months[1,10] := '10';
  Months[1,11] := '11';
  Months[1,12] := '12';

  Months[2,1] := 'Jan';
  Months[2,2] := 'Feb';
  Months[2,3] := 'Mar';
  Months[2,4] := 'Apr';
  Months[2,5] := 'May';
  Months[2,6] := 'Jun';
  Months[2,7] := 'Jul';
  Months[2,8] := 'Aug';
  Months[2,9] := 'Sep';
  Months[2,10] := 'Oct';
  Months[2,11] := 'Nov';
  Months[2,12] := 'Dec';

  for icount := 1 to 12 do
    begin
      if pos(' '+Months[2,icount]+' ',tmpDate) > 0 then
        begin
          tmpDate := stringreplace(tmpDate,' '+Months[2,icount]+' ','/'+Months[1,icount]+'/',[]);
          break;
        end;
    end;
  iLength := length(tmpDate);
  result := pbdatestr(copy(trim(tmpDate),1,10));
end;

procedure TPBMaintCustFrm.pmnuPasteClick(Sender: TObject);
var
  f: THandle;
  buffer: Array [0..MAX_PATH] of Char;
  i, numFiles: Integer;
  sFile, sFullFile, docdir: string;
  iCount, iPos, iLength: integer;
begin
  docDir := dmBroker.GetCompanyCustomerDirectory + '\' + NameEdit.text;
  {Find a document} ;

  if not DirectoryExists(docDir) then
  	begin
     	CreateDirectory(docDir);
  	end;

  Clipboard.Open;
  try
    f := Clipboard.GetAsHandle(CF_HDROP);
    if f <> 0 then
    begin
      numFiles := DragQueryFile(f, $FFFFFFFF, nil, 0);
//      memo1.Clear;
      for i:= 0 to numfiles - 1 do
      begin
        buffer[0] := #0;
        DragQueryFile( f, i, buffer, sizeof(buffer));

        sfullFile := buffer;
        iLength := length(sFullFile);

        iCount := 1;

        while iCount <> 0 do
          begin
            ipos := pos('\',sFullFile);

            sFullFile := stringreplace(sFullFile, '\', '!', []);

            iCount := pos('\',sFullFile);
          end;

        sFile := copy(buffer, ipos+1, (iLength - ipos));

        FileCopy(buffer, docDir + '\' + sfile) ;
      end;
    end;
  finally
    Clipboard.close;
  end;
  ShowDocuments;
end;

procedure TPBMaintCustFrm.pmnuDeleteClick(Sender: TObject);
var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
begin
  sPath :=  dmBroker.GetCompanyCustomerDirectory + '\' + NameEdit.text + '\';
  if (lstvwDocuments.selcount = 1) then
    begin
      iRow := lstvwDocuments.ItemIndex;
      if iRow = -1 then
        exit;
      if messagedlg('Delete the selected document?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          ListItem := lstvwDocuments.items[irow];
          sFileName := ListItem.caption;

          lstvwDocuments.Items.Delete(iRow);
          deletefile(sPath+sfileName);
        end
    end
  else
    begin
      for iRow := pred(lstvwDocuments.items.count) downto 0 do
        begin
          if lstvwDocuments.items[iRow].Selected then
            begin
              ListItem := lstvwDocuments.items[irow];
              sFileName := ListItem.caption;

              lstvwDocuments.Items.Delete(iRow);
              deletefile(sPath+sfileName);
            end;

        end;
    end;
end;

procedure TPBMaintCustFrm.pmnuSelectAllClick(Sender: TObject);
var
  icount: integer;
begin
  with lstvwDocuments do
    begin
      Items.BeginUpdate;
      for icount := 0 to pred(items.count) do
        begin
          items[icount].selected := true ;
        end;
      Items.EndUpdate;
    end;
end;

procedure TPBMaintCustFrm.tbEnquiriesShow(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
begin
  if not FActivatedEnqs then
    begin
      {Get the button statuses} ;
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuEnquiries') ;

      IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
      try
        stempdate := IniFile.ReadString('Centrereed Broker', 'Enquiry Search Date', 'None');
      finally
        IniFile.Free;
      end;

      if stempdate = 'None' then
        dtmdlCustEnqs.EnquiryDate := Date - 365
      else
        dtmdlCustEnqs.EnquiryDate := pbdatestr(stempdate);

      dtmdlCustEnqs.Customer := iCustomer;

(*      {Check if the operator REP is needed} ;
      If iMnuMaint = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;

      If iMnuMaint = 5 then
        dtmdlCustEnqs.Operator := frmpbMainMenu.iOperator;

      dtmdlCustEnqs.Rep := iOperatorRep;
      dtmdlCustEnqs.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);
*)
      iOperatorRep := 0 ;

      SetEnquiryButtonProperties(self);


      FactivatedEnqs := true;
    end;

  dtmdlCustEnqs.refreshdata;
  dbgEnquiryDetails.DataSource.DataSet.Locate('Enquiry', Variant(inttostr(ActiveEnquiryCode)),[lopartialKey]);
end;

procedure TPBMaintCustFrm.SetEnquiryButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustEnqs do
  begin
    btnEnqChange.Enabled := HeaderCount > 0;
    btnEnqCopy.Enabled := HeaderCount > 0;
    btnEnqDecline.Enabled := HeaderCount > 0;
    btnEnqPrint.Enabled := HeaderCount > 0;
    btnEnqReplies.Enabled := HeaderCount > 0;
    btnEnqPricing.Enabled := HeaderCount > 0;
    btnEnqQuote.Enabled := HeaderCount > 0;
    btnEnqConvert.Enabled := HeaderCount > 0;
    edtEnqNumber.Text := dbgEnquiryDetails.datasource.dataset.fieldbyname('Enquiry').asstring;

(*    SetButtonProperties(self);

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;
*)
    stsBrEnqDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TPBMaintCustFrm.SetOrderButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustOrders do
  begin
    btnOrderChange.Enabled := HeaderCount > 0;
    btnOrderPrint.Enabled := HeaderCount > 0;
//    btnCopy.Enabled := HeaderCount > 0;
    btnOrderHistory.Enabled := HeaderCount > 0;
    btnOrderHold.Enabled := HeaderCount > 0;
    btnOrderRequote.Enabled := HeaderCount > 0;
    btnOrderDelete.Enabled := HeaderCount > 0;
    btnOrderDeliveries.Enabled := HeaderCount > 0;
    btnOrderAllocatefnc.enabled := (dbgOrderDetails.datasource.dataset.fieldbyname('Order_type').asstring <> 'PO') and
                            (HeaderCount > 0);
    btnOrderPicking.enabled := (dbgOrderDetails.datasource.dataset.fieldbyname('Order_type').asstring <> 'PO')and
                            (HeaderCount > 0);
    btnOrderProofs.enabled := (not btnOrderPicking.enabled) and (HeaderCount > 0);

    btnOrderRepeat.Enabled := (not btnOrderPicking.enabled) and (HeaderCount > 0);

    if dbgOrderDetails.datasource.dataset.fieldbyname('Needs_Authorising').asstring = 'Y' then
      edtOrderNumber.text := 'N/A'
    else
      edtOrderNumber.text := dbgOrderDetails.datasource.dataset.fieldbyname('Sales_order').asstring;

(*    SetButtonProperties(Self);

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;
*)

    stsBrOrderDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TPBMaintCustFrm.edtEnqSearchChange(Sender: TObject);
begin
  dtmdlCustEnqs.Description := (Sender as TEdit).Text;
  tmrSearch.tag := 3;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TPBMaintCustFrm.tmrSearchTimer(Sender: TObject);
begin
  with tmrSearch do
    begin
      Enabled := False;
      case tag of
        1: dtmdlOneCustomer.refreshBranches;
        2: dtmdlCustQuotes.refreshdata;
        3: dtmdlCustEnqs.RefreshData;
        4: dtmdlCustOrders.RefreshData;
        5: dtmdlCustJobs.RefreshData;
        6: dtmdlCustStock.RefreshData;
        7: dtmdlCustInvoices.refreshCustomerdata;
      end;
    end;

end;

procedure TPBMaintCustFrm.btnEnqQuickClick(Sender: TObject);
var
  Enquiry: TEnquiryQuote;
  iTempSel: integer;
begin
  PBEnqDM := TPBEnqDM.Create(Self);
  //true in the constructor denotes the creation of a quick quote.
  Enquiry := TEnquiryQuote.Create;
  try
    Enquiry.EnquiryType := 'Q';
    Enquiry.Line.NewPart;
    with Enquiry.Line.Parts[0] do
    begin
      Description := '';
      Heading := '';
      SameAsPart := 0;
      PaperBrand := '';
      PaperMaterial := '';
      PaperWeight := '';
      PaperColour := '';
      FaceInks := '';
      ReverseInks := '';
      LeftMarginType := '';
      LeftMarginWidth := '';
      RightMarginType := '';
      RightMarginWidth := '';
    end;
    Enquiry.Edit;
    if Enquiry.Modified then
      begin
        dtmdlCustEnqs.refreshdata;
        dbgEnquiryDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
      end;
  finally
    Enquiry.Free;
    PBEnqDM.Free;
  end;
end;

procedure TPBMaintCustFrm.btnEnqAddClick(Sender: TObject);
begin
  CallEnquiryMaintScreen('A');
end;

procedure TPBMaintCustFrm.CallEnquiryMaintScreen(sTempFuncMode: string);
var
  iTempSel: Integer;
  iEnqHeadStatus: integer;
begin
  {If adding enquiry then set status to enquiry Created}
  if sTempFuncMode = 'A' then
    begin
      iEnqHeadStatus := 10;
    end
  else
    begin
      iEnqHeadStatus := dbgEnquiryDetails.datasource.DataSet.FieldByName('Enquiry_status').AsInteger;
    end

  {for the view, set the access level to view. Otherwise, give full access} ;
  If sTempFuncMode = 'V' then
    dmBroker.iAccCtrlMenu := 3;

 if (iEnqHeadStatus > 10) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
  begin
    if MessageDlg('This enquiry is ' +
      dbgEnquiryDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
  end;

  {Call Enquiry Maintenance}
  PBEnquiryFrm := TPBEnquiryFrm.Create(Self);
  try
    PBEnquiryFrm.sEnqFuncMode := sTempFuncMode;
    PBEnquiryFrm.iEnqNumber :=
      dbgEnquiryDetails.datasource.dataset.FieldByName('enquiry').AsInteger;
    if sTempFuncMode = 'A' then
      PBEnquiryFrm.ClearScreen
    else
      if sTempFuncMode = 'C' then
        PBEnquiryFrm.ChangeEnquiry
      else
        if sTempFuncMode = 'R' then
          PBEnquiryFrm.CopyEnquiry
        else
          if sTempFuncMode = 'V' then
            PBEnquiryFrm.ViewEnquiry;
    PBEnquiryFrm.ShowModal;
    iTempSel := PBEnquiryFrm.iEnqNumber;
    if PBEnquiryFrm.ModalResult = idok then
    begin
      dtmdlCustEnqs.refreshdata;
      if sTempFuncMode <> 'D' then
      begin
        dbgEnquiryDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
      end;
    end;
  finally
    PBEnquiryFrm.Free;
  end;
end;

procedure TPBMaintCustFrm.btnEnqChangeClick(Sender: TObject);
begin
  if not CheckEnquiryInput then
    exit;

  if trim(btnEnqChange.caption) = '&View' then
    CallEnquiryMaintScreen('V')
  else
    CallEnquiryMaintScreen('C');

end;

procedure TPBMaintCustFrm.btnEnqCopyClick(Sender: TObject);
begin
  if not CheckEnquiryInput then
    exit;

  CallEnquiryMaintScreen('R');
end;

procedure TPBMaintCustFrm.btnEnqPrintClick(Sender: TObject);
var
  bTempOK: boolean;
  iTempSel: integer;
  sEnquiry: string;
  enqList: TStringList;
  inx: integer;
begin
  if self.dbgEnquiryDetails.SelectedRows.Count < 2 then
  begin
    if not CheckEnquiryInput then
      exit;

    //print enquiry using print single enquiry selection form
    sEnquiry := dbgEnquiryDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
    PBRSEnqNFrm := TPBRSEnqNFrm.Create(Self);
    try
      PBRSEnqNFrm.sDescription := dbgEnquiryDetails.datasource.dataset.fieldbyname('Description').asstring;
      PBRSEnqNFrm.EnquiryMemo.text := sEnquiry;
      PBRSEnqNFrm.ShowModal;
      bTempOK := PBRSEnqNFrm.bOK;
      iTempSel := strtoint(sEnquiry);
    finally
     PBRSEnqNFrm.Free;
    end;

    if bTempOK then
    begin
      dtmdlCustEnqs.refreshdata;
      dbgEnquiryDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  end
  else
  begin
    //multiple enquiries are selected so use multi print form
    PBRSEnqFrm := TPBRSEnqFrm.Create(Self);
    try
      enqList := TStringList.Create;

      for inx := 0 to self.dbgEnquiryDetails.SelectedRows.Count - 1 do
      begin
        dbgEnquiryDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgEnquiryDetails.SelectedRows.Items[inx]));
        enqList.Add(dbgEnquiryDetails.DataSource.DataSet.FieldByName('enquiry').asString)
      end;
      bTempOK := PBRSEnqFrm.PrintEnquiries(enqList);

      dtmdlCustEnqs.refreshdata;
      for inx := 0 to enqList.Count - 1 do
      begin
        dbgEnquiryDetails.DataSource.DataSet.Locate('enquiry', StrToInt(enqList[inx]),[]);
        dbgEnquiryDetails.SelectedRows.CurrentRowSelected := true;
      end;

    finally
      enqList.Free;
      PBRSEnqFrm.Free;
    end;
  end;
end;

procedure TPBMaintCustFrm.edtEnqNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnEnqChangeclick(self);
end;

function TPBMaintCustFrm.CheckEnquiryInput: boolean;
begin
  result := true;
  if not dbgEnquiryDetails.datasource.DataSet.locate('Enquiry', Variant(edtEnqNumber.text),[lopartialKey]) then
    begin
      messagedlg('Enquiry '+ edtEnqNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TPBMaintCustFrm.btnEnqRepliesClick(Sender: TObject);
var
  iTempSel: Integer;
begin
  if not CheckEnquiryInput then
    exit;

  PBEnqSupRespFrm := TPBEnqSupRespFrm.Create(Self);
  try
    PBEnqSupRespFrm.iEnqNumber :=
      dbgEnquiryDetails.datasource.dataset.FieldByName('enquiry').AsInteger;
    PBEnqSupRespFrm.EnquiryEdit.Text :=
      dbgEnquiryDetails.datasource.dataset.FieldByName('enquiry').AsString;
    {Pass the enquiriy's operator and rep across to allow the screen access function to operate} ;
    PBEnqSupRespFrm.iDataOp :=
      dbgEnquiryDetails.datasource.dataset.FieldByName('Operator').AsInteger;
    PBEnqSupRespFrm.iDataRep :=
      dbgEnquiryDetails.datasource.dataset.FieldByName('Rep').AsInteger;
    PBEnqSupRespFrm.GetEnquiryDetails;
    PBEnqSupRespFrm.ShowModal;
    iTempSel := PBEnqSupRespFrm.iEnqNumber;
    if PBEnqSupRespFrm.ModalResult = idok then
    begin
      dtmdlCustEnqs.refreshdata;
      dbgEnquiryDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  finally
    PBEnqSupRespFrm.Free;
  end;
end;

procedure TPBMaintCustFrm.btnEnqPricingClick(Sender: TObject);
var
  iTempSel: Integer;
begin
  if not CheckEnquiryInput then
    exit;

  PBEnqJobPriceFrm := TPBEnqJobPriceFrm.Create(Self);
  try
    PBEnqJobPriceFrm.iEnqNumber :=
      dbgEnquiryDetails.datasource.dataset.FieldByName('enquiry').AsInteger;
    PBEnqJobPriceFrm.iDataOp :=
      dbgEnquiryDetails.datasource.dataset.FieldByName('Operator').AsInteger;
    PBEnqJobPriceFrm.iDataRep :=
      dbgEnquiryDetails.datasource.dataset.FieldByName('Rep').AsInteger;
    PBEnqJobPriceFrm.EnquiryEdit.Text :=
      dbgEnquiryDetails.datasource.dataset.FieldByName('enquiry').AsString;
    PBEnqJobPriceFrm.ShowModal;
    iTempSel := PBEnqJobPriceFrm.iEnqNumber;
    if PBEnqJobPriceFrm.ModalResult = idok then
    begin
      dtmdlCustEnqs.refreshdata;
      dbgEnquiryDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  finally
    PBEnqJobPriceFrm.Free;
  end;
end;

procedure TPBMaintCustFrm.btnEnqQuoteClick(Sender: TObject);
var
  bTempOK: boolean;
  iTempSel: integer;
  iCount: integer;
  sEnquiry, sMulti: string;
begin
  if not CheckEnquiryInput then
    exit;

  sEnquiry := dbgEnquiryDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
  {print the quote}
  if dbgEnquiryDetails.SelectedRows.Count <= 1 then
    begin
      PBRSQuoNFrm := TPBRSQuoNFrm.Create(Self);
      try
        PBRSQuoNFrm.EnquiryMemo.text := dbgEnquiryDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
        PBRSQuoNFrm.ShowModal;
        bTempOK := PBRSQuoNFrm.bOK;
        iTempSel := strtoint(sEnquiry);
      finally
        PBRSQuoNFrm.Free;
      end;
    end
  else
    begin
      for iCount := 0 to (dbgEnquiryDetails.SelectedRows.Count - 1) do
        begin
          dbgEnquiryDetails.Datasource.DataSet.GotoBookmark(TBookmark(dbgEnquiryDetails.SelectedRows[iCount]));
          if icount = 0 then
            sMulti := dbgEnquiryDetails.datasource.dataset.fieldbyname('Enquiry').asstring
          else
            sMulti := sMulti + ','+ dbgEnquiryDetails.datasource.dataset.fieldbyname('Enquiry').asstring ;
        end;
      PBRSQuoFrm := TPBRSQuoFrm.Create(Self);
      try
        PBRSQuoFrm.SelectionMemo.text := sMulti;
        PBRSQuoFrm.ShowModal;
        bTempOK := PBRSQuoFrm.bOK;
        iTempSel := strtoint(sEnquiry);
      finally
        PBRSQuoFrm.Free;
      end;
    end;

  if bTempOK then
    begin
      dtmdlCustEnqs.refreshdata;
      dbgEnquiryDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
end;

procedure TPBMaintCustFrm.btnEnqConvertClick(Sender: TObject);
var
  iTempSel: integer;
  iTempLine: integer;
  iStatus: integer;
begin
  iTempSel := dbgEnquiryDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
  iTempLine := dbgEnquiryDetails.datasource.DataSet.FieldByName('Line').asinteger;
  iStatus := dbgEnquiryDetails.datasource.DataSet.FieldByName('enquiry_status').AsInteger;

  if iStatus < 45 then
    begin
      messagedlg('This enquiry has not had any prices set, cannot convert to an order', mtInformation,
      [mbOk], 0);
      exit;
    end
  else
  if iStatus > 85 then
    begin
      messagedlg('This enquiry has already been converted to an order', mtInformation,
     [mbOk], 0);
       exit;
    end;

  if dmBroker.GetCustomerStatus(dbgEnquiryDetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Enquiries cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  PBAutoPOFrm := TPBAutoPOFrm.Create(Self);
  PBAutoPOFrm.TempEnqNo := iTempSel;
  PBAutoPOFrm.TempEnqLineNo := iTempLine;
  PBAutoPOFrm.MainLoop(self);
  PBAutoPOFrm.Free;

  dtmdlCustEnqs.refreshdata;
  dbgEnquiryDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
end;

procedure TPBMaintCustFrm.tbOrdersShow(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
begin
  if not FActivatedOrders then
    begin
      {Get the button statuses} ;
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuProduction') ;

//      dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,'mnuOrders') ;

      IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
      try
        stempdate := IniFile.ReadString('Centrereed Broker', 'Customer Order Search Date', 'None');
      finally
        IniFile.Free;
      end;

      if stempdate = 'None' then
        dtmdlCustOrders.OrderDate := Date - 365
      else
        dtmdlCustOrders.OrderDate := pbdatestr(stempdate);

      dtmdlCustOrders.Customer := iCustomer;

(*      {Check if the operator REP is needed} ;
      If iMnuMaint = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;

      If iMnuMaint = 5 then
        dtmdlCustOrders.Operator := frmpbMainMenu.iOperator;

      dtmdlCustOrders.Rep := iOperatorRep;
      dtmdlCustOrders.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

*)
      iOperatorRep := 0 ;
      SetOrderButtonProperties(self);

      FactivatedOrders := true;
    end;

  dtmdlCustOrders.refreshdata;
  dbgOrderDetails.DataSource.DataSet.Locate('Sales_Order', Variant(floattostr(ActiveOrderCode)),[lopartialKey]);
end;

procedure TPBMaintCustFrm.edtOrderSearchChange(Sender: TObject);
begin
  dtmdlCustOrders.Description := (Sender as TEdit).Text;
  tmrSearch.tag := 4;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TPBMaintCustFrm.dbgEnquiryDetailsDblClick(Sender: TObject);
begin
  btnEnqChangeclick(self);
end;

procedure TPBMaintCustFrm.btnOrderAddClick(Sender: TObject);
begin
  {Add a new PO}
  if not frmPBMainMenu.UseStockSystem then
    CallOrderMaintScreen('A');

end;

procedure TPBMaintCustFrm.btnOrderChangeClick(Sender: TObject);
begin
  if not CheckOrderInput then
    exit;

  if dbgOrderDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
    begin
      if trim(btnOrderChange.caption) = '&View' then
        CallOrderMaintScreen('V')
      else
        CallOrderMaintScreen('C');
    end
  else
    begin
      if trim(btnOrderChange.caption) = '&View' then
        CallSOMaintScreen('V')
      else
        CallSOMaintScreen('C');
    end;
end;

procedure TPBMaintCustFrm.btnOrderRepeatClick(Sender: TObject);
var
  bAuthorised: boolean;
begin
  if not CheckOrderInput then
    exit;

  if dmBroker.GetCustomerStatus(dbgOrderDetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Orders cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  bAuthorised := not (dbgOrderDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');
  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  if (dbgOrderDetails.datasource.dataset.fieldByName('NCA_Live_Lines').Asinteger > 0) or (dbgOrderDetails.datasource.dataset.fieldByName('NCA_Signed_off').Asinteger > 0) then
    begin
      MessageDlg('Non Conformance issues exist for this order, please make a note of the details.', mtWarning, [mbOk], 0);
    end;

  if dbgOrderDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
    CallOrderMaintScreen('M');
end;

procedure TPBMaintCustFrm.btnOrderDeleteClick(Sender: TObject);
begin
  if not CheckOrderInput then
    exit;

  if dbgOrderDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
    CallOrderMaintScreen('D')
  else
    CallSOMaintScreen('D');

end;

procedure TPBMaintCustFrm.btnOrderPrintClick(Sender: TObject);
begin
  if not CheckOrderInput then
    exit;
  if dbgOrderDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
    PrintPO
  else
    PrintSO;

end;

procedure TPBMaintCustFrm.btnOrderRequoteClick(Sender: TObject);
var
  bAuthorised: boolean;
begin
  if not CheckOrderInput then
    exit;

  bAuthorised := not (dbgOrderDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  if dbgOrderDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
  begin
  PBPOToEnqFrm := TPBPOToEnqFrm.Create(Self);
  try
    PBPOToEnqFrm.PONumber := dbgOrderDetails.datasource.DataSet.fieldbyname('sales_order').asfloat;
    PBPOToEnqFrm.iLine := dbgOrderDetails.datasource.dataset.fieldbyname('Line').asinteger;
    PBPOToEnqFrm.Customer := dbgOrderDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    PBPOToEnqFrm.CustomerName := NameEdit.text;
    PBPOToEnqFrm.Description := dbgOrderDetails.datasource.dataset.fieldbyname('Description').asstring;
    PBPOToEnqFrm.Quantity := dbgOrderDetails.datasource.dataset.fieldbyname('Quantity').asinteger;
    PBPOToEnqFrm.ShowModal;
  finally
    PBPOToEnqFrm.Free;
  end;
  end;
end;

procedure TPBMaintCustFrm.btnOrderHistoryClick(Sender: TObject);
var
  PBPOrdHistFrm: TPBPOrdHistFrm;
begin
  if dbgOrderDetails.DataSource.DataSet.FieldByName('original_order').asFloat = 0.00 then
  begin
    messageDlg('There is no previous order history for this order.', mtInformation, [mbOK], 0);
  end
  else
  begin
    PBPOrdHistFrm := TPBPOrdHistFrm.Create(self);
    try
      PBPOrdHistFrm.PONum :=
        dbgOrderDetails.DataSource.DataSet.FieldByName('sales_Order').asFloat;
      PBPOrdHistFrm.lineNo :=
        dbgOrderDetails.DataSource.DataSet.FieldByName('line').asInteger;

      PBPOrdHistFrm.ShowModal;
    finally
      PBPOrdHistFrm.Free;
    end;
  end;
end;

procedure TPBMaintCustFrm.btnOrderDeliveriesClick(Sender: TObject);
var
  tempSO: real;
  bAuthorised: boolean;
begin
  if not CheckOrderInput then
    exit;

  bAuthorised := not (dbgOrderDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  tempSO := dbgOrderDetails.DataSource.dataset.fieldbyname('Sales_order').asfloat;
  frmpbluOrderDeliv := TfrmpbluOrderDeliv.create(self);
  try
    frmpbluOrderDeliv.Ordertype := dbgOrderDetails.DataSource.dataset.fieldbyname('Order_type').asstring;
    frmpbluOrderDeliv.OrderNumber := dbgOrderDetails.DataSource.dataset.fieldbyname('Sales_order').asfloat;
    frmpbluOrderDeliv.caption := frmpbluOrderDeliv.caption + ' ' + dbgOrderDetails.DataSource.dataset.fieldbyname('Sales_order').asstring;
    frmpbluOrderDeliv.showmodal;
  finally
    frmpbluOrderDeliv.free;
    dtmdlCustOrders.refreshdata;
    dbgOrderDetails.datasource.dataset.locate('Sales_Order', Variant(floattostr(tempSO)),[lopartialKey]) ;
  end;
end;

procedure TPBMaintCustFrm.btnOrderHoldClick(Sender: TObject);
var
  stext: string;
  iPordHeadStatus: integer;
  rTemPSel: real;
  SelCode: real;
  SelLine: integer;
  bAuthorised: boolean;
begin
  if not CheckOrderInput then
    exit;

  bAuthorised := not (dbgOrderDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  SelCode := dbgOrderDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  SelLine := dbgOrderDetails.datasource.DataSet.FieldByName('Line').asinteger;
  iPOrdHeadStatus := dbgOrderDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  if dbgOrderDetails.datasource.dataset.FieldByName('On_Hold').AsString = 'Y' then
    sText := ' remove the On Hold status for this order.'
  else
    begin
      if (iPOrdHeadStatus > 22) and (dbgOrderDetails.datasource.DataSet.FieldByName('Supp_Inv_Recd').asstring = 'Y') then
      begin
        MessageDlg('This order has been ' +
          dbgOrderDetails.datasource.dataset.FieldByName('Status_Description').AsString +
          ' and been matched against a supplier invoice, you cannot set this order On Hold', mtError, [mbOK], 0);
        exit;
      end;

      stext := ' place this order On Hold.';
    end;

  if MessageDlg('Confirm you wish to'+stext, mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
    Exit
  else
    begin
      with dtmdlCustOrders.qryOnHold do
        begin
          close;
          parambyname('Purchase_Order').asfloat := selCode ;
          parambyname('Line').asinteger := selLine;
          if (dbgOrderDetails.datasource.dataset.FieldByName('On_Hold').AsString = 'Y') then
            parambyname('On_Hold').asstring := 'N'
          else
            parambyname('On_Hold').asstring := 'Y';
          execsql;
        end;
      rTempSel := selcode;
      dtmdlCustOrders.Refreshdata;
      dbgOrderDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(rTempSel)),[lopartialKey]) ;
    end;
end;

procedure TPBMaintCustFrm.CallSOMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  iTempSel: Integer;
  iSOrdHeadStatus: integer;
  Selcode: integer;
begin
  {If adding order then set status to Order Created}
  if sTempFuncMode = 'A' then
    begin
      SelCode := 0;
      iSOrdHeadStatus := 10;
    end
  else
    begin
      SelCode := dbgOrderDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
      iSOrdHeadStatus := dbgOrderDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;
    end;
        
  if (iSOrdHeadStatus > 10) and (sTempFuncMode = 'D') then
  begin
    MessageDlg('This order has been ' +
      dbgOrderDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ', you cannot delete it', mtError, [mbOK], 0);
    Exit;
  end;

  {Check whether the Sales Order has been included in a invoice Period End}
  if dtmdlCustOrders.PeriodEndRun('SO',selcode,0) and
                        (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
    begin
    if MessageDlg('This order has been included in a Period end, the details cannot be modified' +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
    sTempFuncMode := 'S';
    end
  else
  if (iSOrdHeadStatus > 30) and (sTempFuncMode = 'C') then
  begin
    if MessageDlg('This order has been ' +
      dbgOrderDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ' - Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        sTempFuncMode := 'H';
      end
    else
      exit;
  end;

  if (sTempFuncMode = 'P') then
    begin
      if (dtmdlCustOrders.IsCustomerOnStop(dbgOrderDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger))
        and (dmBroker.qryCompany.FieldByName('onstop').AsString = 'Y') then
        begin
          messagedlg('Customer is ON STOP, the order cannot be copied.',mtInformation, [mbOK], 0);
          exit;
        end;
    end;

  STMntSordFrm := TSTMntSordFrm.Create(Self);
  try
    STMntSordFrm.FuncMode := sTempFuncMode;
    SalesOrder.SOHeadStatus := iSOrdHeadStatus;
    STMntSordFrm.SalesOrderNo := SelCode;
    STMntSordFrm.SetupDetails(Self);
    STMntSordFrm.ShowModal;
    bTempOK := STMntSordFrm.bOK;
    iTempSel := SalesOrder.SONumber;
  finally
    STMntSordFrm.Free;
  end;
  if bTempOK then
  begin
    dtmdlCustOrders.Refreshdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgOrderDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  end;
end;

procedure TPBMaintCustFrm.CallOrderMaintScreen(sTempFuncMode: Char);
var
  bCanChangeInvoicedOrders: boolean;
  bTempOK: Boolean;
  rTempSel: real;
  iPordHeadStatus: integer;
  SelCode: real;
  SelLine: integer;
begin
  {Determine if the Operator can change sales values after invoicing}
   bCanChangeInvoicedOrders := dmBroker.OperatorCanChangeInvoicedOrders(frmPBMainMenu.iOperator);

  {If adding order then set status to Order Created}
  if sTempFuncMode = 'A' then
    begin
      iPOrdHeadStatus := 10;
      SelCode := 0;
      SelLine := 0;
    end
  else
    begin
      SelCode := dbgOrderDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
      SelLine := dbgOrderDetails.datasource.DataSet.FieldByName('Line').asinteger;
      iPOrdHeadStatus := dbgOrderDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;
    end
  {for the view, set the access level to view. Otherwise, give full access} ;
  If sTempFuncMode = 'V' then
    dmBroker.iAccCtrlMenu := 3;


  if (iPOrdHeadStatus > 0) and (iPOrdHeadStatus < 25) and (sTempFuncMode = 'D') then
  begin
    if MessageDlg('This order cannot be deleted. Do you want to cancel it instead?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
      begin
        PBMaintPOrdInactiveFrm := TPBMaintPOrdInactiveFrm.create(self);

        try
          PBMaintPOrdInactiveFrm.rPurchaseOrder := selcode;
          PBMaintPOrdInactiveFrm.iLine := selLine;
          PBMaintPOrdInactiveFrm.iJobBag := dbgOrderDetails.datasource.dataset.FieldByName('Job_Bag').asinteger;
          PBMaintPOrdInactiveFrm.showmodal;
          if PBMaintPOrdInactiveFrm.modalresult = idOK then
            bTempOK := true
          else
            bTempOK := false;
        finally
          PBMaintPOrdInactiveFrm.Free;
        end;
        if bTempOK then
        begin
          dtmdlCustOrders.Refreshdata;
        end;
        Exit;
      end
    else
      exit;
  end
  else if (iPOrdHeadStatus > 0) and (sTempFuncMode = 'D') then
  begin
    MessageDlg('This order has been ' +
      dbgOrderDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ', you cannot delete it', mtError, [mbOK], 0);
    Exit;
  end;

  {Check whether the Purchase Order has been included in a invoice Period End}
  if dtmdlCustOrders.PeriodEndRun('PO',dbgOrderDetails.datasource.dataset.FieldByName('Sales_order').Asfloat,selline) and
                        (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
    begin
    if MessageDlg('This order has been included in a Period end, the cost and sales values cannot be modified' +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
    sTempFuncMode := 'T';
    end
  else if ((iPOrdHeadStatus = 25) or (iPOrdHeadStatus = 30)) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) and (not bCanChangeInvoicedOrders) then
  begin
    if MessageDlg('This order has been invoiced, the sales values cannot be modified' +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
    sTempFuncMode := 'I';
  end
  else
  if (iPOrdHeadStatus >= 10) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) and
          (dbgOrderDetails.datasource.dataset.FieldByName('Authorised_by').asinteger <> 0) then
  begin
    if (dbgOrderDetails.datasource.dataset.FieldByName('Authorised_by').asinteger <> frmPBMainMenu.iOperator) then
      begin
        if MessageDlg('This order has been authorised, you cannot change the cost and sales values' +
          ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
          Exit;
      end;
  end
  else
  if (iPOrdHeadStatus > 10) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
  begin
    if MessageDlg('This order has been ' +
      dbgOrderDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
  end;

  {Call NEW Purchase Order Maintenance}
  PBMaintPOrdfrm := TPBMaintPOrdfrm.Create(Self);
  try
    if (sTempFuncMode = 'A') or (sTempFuncMode = 'M') or (sTempFuncMode = 'P') then
      begin
        PBMaintPOrdfrm.myMaxOrderLimit := 0.00;
        PBMaintPOrdfrm.myOrderLimit := dmBroker.AuthorisedOrderLimit(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.mySellLimit := dmBroker.MinimumSalesValue(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.rOrderLimit := PBMaintPOrdfrm.myOrderLimit;
        PBMaintPOrdfrm.rSellLimit := PBMaintPOrdfrm.mySellLimit;
        PBMaintPOrdfrm.SellLimitType := dmBroker.MinimumSalesValueType(frmpbMainMenu.iOperator);
      end
    else
      begin
        PBMaintPOrdfrm.myMaxOrderLimit := dmBroker.AuthorisedMaxOrderLimit(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.myOrderLimit := dmBroker.AuthorisedOrderLimit(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.mySellLimit := dmBroker.MinimumSalesValue(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.rOrderLimit := dmBroker.AuthorisedOrderLimit(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.rSellLimit := dmBroker.MinimumSalesValue(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.SellLimitType := dmBroker.MinimumSalesValueType(frmpbMainMenu.iOperator);
      end;
    PBMaintPOrdFrm.bCanChangeInvoicedOrders := bCanChangeInvoicedOrders;
    PBMaintPOrdfrm.FuncMode := sTempFuncMode;
    PBMaintPOrdfrm.PurchaseOrderNo := SelCode;
    PurchaseOrder.POHeadStatus := iPOrdHeadStatus;
    PBMaintPOrdfrm.SetupDetails(Self);
    PBMaintPOrdfrm.ShowModal;
    bTempOK := PBMaintPOrdfrm.bOK;
    rTempSel := PurchaseOrder.PONumber;
  finally
    PBMaintPOrdfrm.Free;
  end;
  if bTempOK then
  begin
    dtmdlCustOrders.Refreshdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgOrderDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(rTempSel)),[lopartialKey]) ;
    end;
  end;
end;

function TPBMaintCustFrm.CheckOrderInput: boolean;
var
  poNumber: string;
begin
  result := true;

  if trim(edtOrderNumber.Text) = 'N/A' then
    poNumber := dbgOrderDetails.datasource.DataSet.fieldbyname('Order_Number').asstring
  else
    poNumber := edtOrderNumber.text;

  if not dbgOrderDetails.datasource.DataSet.locate('Sales_order', Variant(poNumber),[lopartialKey]) then
    begin
      messagedlg('Order '+ edtOrderNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TPBMaintCustFrm.PrintPO;
var
  bTempOK: Boolean;
  selcode: integer;
  bAuthorised: boolean;
begin
  bAuthorised := not (dbgOrderDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
    end;

  {Purchase order Print/Fax}
  selcode := dbgOrderDetails.datasource.dataset.fieldbyname('Sales_order').asinteger;

  PBRSPOrdNFrm := TPBRSPOrdNFrm.Create(Self);
  try
    PBRSPOrdNFrm.bAuthorised := bAuthorised;
    PBRSPOrdNFrm.EnquiryMemo.text := inttostr(selcode);
    PBRSPOrdNFrm.ShowModal;
    bTempOK := PBRSPOrdNFrm.bOK;
  finally
    PBRSPOrdNFrm.Free;
  end;

  if bTempOK then
  begin
    dtmdlCustOrders.Refreshdata;
    dbgOrderDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TPBMaintCustFrm.PrintSO;
var
  bTempOK: Boolean;
  selcode: integer;
begin
  selcode := dbgOrderDetails.datasource.dataset.fieldbyname('Sales_order').asinteger;
  try
    STRSSalesOrdfrm := TSTRSSalesOrdfrm.create(self);
    STRSSalesOrdfrm.OrderGroupBox.caption := STRSSalesOrdfrm.OrderGroupBox.caption + inttostr(selcode);
    STRSSalesOrdfrm.Customerlbl.caption := NameEdit.text;
    STRSSalesOrdfrm.OrderDateLbl.caption := dbgOrderDetails.datasource.dataset.fieldbyname('Order_Date').asstring;
    STRSSalesOrdfrm.SONumber := selcode;
    STRSSalesOrdfrm.showmodal;
    bTempOK := STRSSalesOrdfrm.bOK;
  finally
    STRSSalesOrdfrm.free;
  end;
  If bTempOK then
  begin
    dtmdlCustOrders.Refreshdata;
    dbgOrderDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TPBMaintCustFrm.tbJobsShow(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
begin
  if not FActivatedJobs then
    begin
      {Get the button statuses} ;
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuJobs') ;

//      dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,'mnuJobs') ;

      IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
      try
        stempdate := IniFile.ReadString('Centrereed Broker', 'Customer Job Bag Search Date', 'None');
      finally
        IniFile.Free;
      end;

      if stempdate = 'None' then
        dtmdlCustJobs.JobDate := Date - 365
      else
        dtmdlCustJobs.JobDate := PBdatestr(stempdate);

      dtmdlCustJobs.Customer := iCustomer;

(*      {Check if the operator REP is needed} ;
      If iMnuMaint = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;

      If iMnuMaint = 5 then
        dtmdlCustJobs.Operator := frmpbMainMenu.iOperator;

      dtmdlCustJobs.Rep := iOperatorRep;
      dtmdlCustJobs.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

*)
      iOperatorRep := 0 ;
      SetJobButtonProperties(self);


      FactivatedJobs := true;
    end;

  dtmdlCustJobs.refreshdata;
  dbgJobDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(ActiveJobCode)),[lopartialKey]);
end;

procedure TPBMaintCustFrm.edtJobSearchChange(Sender: TObject);
begin
  dtmdlCustJobs.Description := (Sender as TEdit).Text;
  tmrSearch.tag := 5;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TPBMaintCustFrm.edtOrderNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnOrderChangeclick(self);
end;

procedure TPBMaintCustFrm.edtJobNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnJobChangeclick(self);
end;

procedure  TPBMaintCustFrm.SetJobButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustJobs do
  begin
    btnJobChange.Enabled := HeaderCount > 0;
    btnJobDelete.Enabled := HeaderCount > 0;
    btnJobPrint.Enabled := HeaderCount > 0;
    btnJobDraft.Enabled := HeaderCount > 0;
    btnJobRepeat.Enabled := HeaderCount > 0;
    edtJobNumber.Text := dbgJobDetails.datasource.dataset.fieldbyname('Job_Bag').asstring;

(*    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;
*)
    stsBrJobDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TPBMaintCustFrm.SetJobButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd: ByteBool;
begin
  {They can UPDATE this job if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the job bag maint button on the menu} ;
  bTempCanUpd :=  ((iMnuMaint = 1) or
                  (iMnuMaint = 4) or
                  (iMnuMaint = 5)) ;
  {They can ADD jobs IF} ;
  {    they have FULL, REP or OPERATOR access} ;
  bTempCanAdd := ((iMnuMaint = 1) or (iMnuMaint = 4) or
                                        (iMnuMaint = 5)) ;
  btnJobAdd.Visible := bTempCanAdd ;
  if bTempCanUpd then
    begin
      btnJobChange.Caption := '  &Change  ';
    end
  else
    begin
      btnJobChange.Caption := '   &View   ';
    end;
  btnJobRepeat.Visible := bTempCanUpd ;

  btnJobDelete.Visible := bTempCanUpd and dmBroker.OperatorCanDeleteJobBag(frmPBMainMenu.iOperator);
(*
// set popup menu properties
  pmnuAdd.Visible := btnAdd.Visible;
  pmnuChange.Visible := btnChange.Visible;
  pmnuRepeat.Visible := btnRepeat.Visible;
  pmnuPrint.Visible := btnPrint.Visible;
  pmnuDelete.visible := btnDelete.Visible
*)
end;

procedure TPBMaintCustFrm.SetQuoteButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd: ByteBool;
begin
  {They can UPDATE this job if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the job bag maint button on the menu} ;
  bTempCanUpd :=  ((iMnuMaint = 1) or
                  (iMnuMaint = 4) or
                  (iMnuMaint = 5)) ;
  {They can ADD jobs IF} ;
  {    they have FULL, REP or OPERATOR access} ;
  bTempCanAdd := ((iMnuMaint = 1) or (iMnuMaint = 4) or
                                        (iMnuMaint = 5)) ;
  btnQuoteAdd.Visible := bTempCanAdd ;
  if bTempCanUpd then
    begin
      btnQuoteChange.Caption := '  &Change  ';
    end
  else
    begin
      btnQuoteChange.Caption := '   &View   ';
    end;
  btnQuoteCopy.Visible := bTempCanUpd ;
  btnQuoteReQuote.Visible := bTempCanUpd ;
  btnQuoteConvert.Visible := bTempCanUpd ;

  btnJobDelete.Visible := bTempCanUpd;
(*
// set popup menu properties
  pmnuAdd.Visible := btnAdd.Visible;
  pmnuChange.Visible := btnChange.Visible;
  pmnuRepeat.Visible := btnRepeat.Visible;
  pmnuPrint.Visible := btnPrint.Visible;
  pmnuDelete.visible := btnDelete.Visible
*)
end;

procedure TPBMaintCustFrm.SetEnquiryButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd: ByteBool;
begin
  {They can UPDATE this order if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the PO Maint button on the menu} ;
  bTempCanUpd :=  ((iMnuMaint = 1) or
                  (iMnuMaint = 4) or
                  (iMnuMaint = 5));
  {They can ADD orders IF} ;
  {    they have FULL, REP or OPERATOR access} ;
  bTempCanAdd := ((iMnuMaint = 1) or (iMnuMaint = 4) or
                                        (iMnuMaint = 5)) ;
  btnEnqAdd.Visible := bTempCanAdd ;
  btnEnqQuick.Visible := bTempCanAdd ;
  if bTempCanUpd then
    begin
      btnEnqChange.Caption := '  &Change  ';
    end
  else
    begin
      btnEnqChange.Caption := '   &View   ';
    end;
  btnEnqCopy.Visible := bTempCanAdd ;
  btnEnqDecline.Visible := bTempCanAdd ;
  btnEnqReplies.Visible := bTempCanAdd ;
  btnEnqPricing.Visible := bTempCanAdd ;

  btnEnqConvert.Visible := bTempCanUpd and dmBroker.OperatorCanConvertEnquiry(frmPBMainMenu.iOperator);
end;

procedure TPBMaintCustFrm.SetOrderButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd, bTempCanRequote: ByteBool;
begin
  {They can UPDATE this order if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the PO Maint button on the menu} ;
//  iTempAccCtrl := iMnuBtnPOMaint ;
  bTempCanUpd :=  ((iMnuMaint = 1) or
                  (iMnuMaint = 4) or
                  (iMnuMaint = 5));
  {They can ADD orders IF} ;
  {    they have FULL, REP or OPERATOR access} ;
  bTempCanReQuote := ((iMnuMaint = 1) or (iMnuMaint = 4) or
                                        (iMnuMaint = 5)) ;
  bTempCanAdd := ((iMnuMaint = 1) or (iMnuMaint = 4) or
                                        (iMnuMaint = 5)) ;
  btnOrderAdd.Visible := bTempCanAdd ;
  if bTempCanUpd then
    begin
      btnOrderChange.Caption := '  &Change  ';
    end
  else
    begin
      btnOrderChange.Caption := '   &View   ';
    end;
  btnOrderRepeat.Visible := bTempCanUpd ;
  btnOrderHold.Visible := bTempCanUpd ;
  btnOrderRequote.Visible := bTempCanReQuote;
  btnOrderDelete.Visible := bTempCanUpd;

  btnOrderAllocateFnc.Visible := bTempCanUpd;
  btnOrderPicking.Visible := bTempCanUpd;
  btnOrderProofs.Visible := bTempCanUpd;

  btnOrderDeliveries.Visible := bTempCanUpd;
  btnOrderDeliveriesSpacer.Visible := btnOrderDeliveries.Visible;
end;

procedure TPBMaintCustFrm.btnJobAddClick(Sender: TObject);
begin
  CallJobMaintScreen(jbAdd);
end;

procedure TPBMaintCustFrm.btnJobChangeClick(Sender: TObject);
begin
  if not CheckJobInput then
    exit;

  if trim(btnJobChange.caption) = '&View' then
    CallJobMaintScreen(jbView)
  else
    CallJobMaintScreen(jbChange);
end;

procedure TPBMaintCustFrm.btnJobRepeatClick(Sender: TObject);
begin
  if not CheckJobInput then
    exit;

  if dmBroker.GetCustomerStatus(dbgJobDetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Jobs cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  CallJobMaintScreen(jbRepeat);

end;

procedure TPBMaintCustFrm.btnJobDeleteClick(Sender: TObject);
var
  key: integer;
begin
  if (dbgJobDetails.Datasource.Dataset.fieldbyname('Inactive').asstring = 'Y') then
    begin
      key := dbgJobDetails.datasource.dataset.FieldByName('Job_Bag').asinteger;
      PBMaintJobBagInactiveFrm := TPBMaintJobBagInactiveFrm.create(self);
      try
        PBMaintJobBagInactiveFrm.iJobBag := key;
        PBMaintJobBagInactiveFrm.lblJobBag.caption := dbgJobDetails.datasource.dataset.FieldByName('Job_Bag').asstring;
        PBMaintJobBagInactiveFrm.lblDescription.caption := dbgJobDetails.datasource.dataset.FieldByName('Job_Bag_Descr').asstring;
        PBMaintJobBagInactiveFrm.lblCustomer.caption := dbgJobDetails.datasource.dataset.FieldByName('Customer_Name').asstring;
        PBMaintJobBagInactiveFrm.showmodal;
        if PBMaintJobBagInactiveFrm.modalresult = idOK then
          begin
            dtmdlCustJobs.Refreshdata;
            dbgJobDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(Key)),[lopartialKey]) ;
          end;
      finally
        PBMaintJobBagInactiveFrm.Free;
      end;
    end
  else
  if (dbgJobDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status').asinteger >= 25) then
    begin
      MessageDlg('This job bag status is ' +
        dbgJobDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring +
        ' and therefore cannot be deleted or cancelled.', mtError, [mbOk], 0);
    end
  else
  if (dbgJobDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status').asinteger > 10) then
    begin
      if dbgJobDetails.datasource.dataset.FieldByName('PO_Lines').asinteger > 0 then
        begin
          messageDlg('This job bag contains live Purchase Orders and therefore cannot be deleted or cancelled', mtInformation, [mbOk], 0);
          exit;
        end
      else
        begin
          if MessageDlg('This job bag status is ' +
            dbgJobDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring +
            ' and therefore cannot be deleted. Do you want to cancel it instead?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
          begin
            PBMaintJobBagInactiveFrm := TPBMaintJobBagInactiveFrm.create(self);
            try
              PBMaintJobBagInactiveFrm.iJobBag := dbgJobDetails.datasource.dataset.FieldByName('Job_Bag').asinteger;
              PBMaintJobBagInactiveFrm.lblJobBag.caption := dbgJobDetails.datasource.dataset.FieldByName('Job_Bag').asstring;
              PBMaintJobBagInactiveFrm.lblDescription.caption := dbgJobDetails.datasource.dataset.FieldByName('Job_Bag_Descr').asstring;
              PBMaintJobBagInactiveFrm.lblCustomer.caption := dbgJobDetails.datasource.dataset.FieldByName('Customer_Name').asstring;
              PBMaintJobBagInactiveFrm.showmodal;
              if PBMaintJobBagInactiveFrm.modalresult = idOK then
                dtmdlCustJobs.Refreshdata;
            finally
              PBMaintJobBagInactiveFrm.Free;
            end;
          end;
        end;
    end
  else
    CallJobMaintScreen(jbDelete);
end;

procedure TPBMaintCustFrm.btnJobPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
  tmpCustomer, tmpDescription: string;
begin
  if not CheckJobInput then
    exit;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmPBRSJobBag := TfrmPBRSJobBag.Create( Application );
    Key := dbgJobDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;
    tmpCustomer := dbgJobDetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    tmpDescription := dbgJobDetails.DataSource.DataSet.fieldbyname('Job_Bag_Descr').asstring;

    frmPBRSJobBag.memSelection.text := inttostr(Key);
    frmPBRSJobBag.edtCustomer.text := tmpCustomer;
    frmPBRSJobBag.memDescription.text := tmpDescription;
    frmPBRSJobBag.memQuantity.text := dbgJobDetails.DataSource.DataSet.fieldbyname('Quantity').asstring;
    frmPBRSJobBag.showmodal;
  finally
    frmPBRSJobBag.free;
    dbgJobDetails.DataSource.DataSet.Close;
    dbgJobDetails.DataSource.DataSet.Open;
    Screen.Cursor := OldCursor;
  end;
  dbgJobDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(Key)),[lopartialKey]) ;
end;

procedure TPBMaintCustFrm.btnJobDraftClick(Sender: TObject);
var
  bTempOK: Boolean;
  selcode: integer;
  customername: string;
begin
  if (dbgJobDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status').asinteger > 25) then
    begin
      MessageDlg('This job bag has been ' +
        dbgJobDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring +
        ' a draft invoice is not available', mtInformation,
      [mbOk], 0);
        Exit;
    end;

  CustomerName := dbgJobDetails.datasource.dataset.fieldbyname('Customer_Name').asstring;
  selcode := dbgJobDetails.datasource.dataset.fieldbyname('Job_Bag').asinteger;
  try
    PBRSJBDraftfrm := TPBRSJBDraftfrm.create(self);
    PBRSJBDraftfrm.OrderGroupBox.caption := PBRSJBDraftfrm.OrderGroupBox.caption + inttostr(selcode);
    PBRSJBDraftfrm.lblCustomer.caption := CustomerName;
    PBRSJBDraftfrm.lblDescription.caption := dbgJobDetails.datasource.dataset.fieldbyname('Job_Bag_Descr').asstring;
    PBRSJBDraftfrm.JBNumber := selcode;
    PBRSJBDraftfrm.showmodal;
    bTempOK := PBRSJBDraftfrm.bOK;
  finally
    PBRSJBDraftfrm.free;
  end;
end;

function TPBMaintCustFrm.CheckJobInput: boolean;
begin
  result := true;
  if not dbgJobDetails.datasource.DataSet.locate('Job_Bag', Variant(edtJobNumber.text),[lopartialKey]) then
    begin
      messagedlg('Job '+ edtJobNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TPBMaintCustFrm.CallJobMaintScreen(aMode: TJBMode);
var
  Key : integer;
  frm : TPBMaintJobBagFrm;
  aBag : TJobBag;
  OrigAccCtrlMenu: integer;
begin
  if (aMode = jbChange) and (dbgJobDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      if MessageDlg('This job bag has been cancelled, you cannot maintain the details - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
      aMode := jbView;
    end
  else
  if (aMode = jbChange) and (dbgJobDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status').asinteger >= 25) then
    begin
      if MessageDlg('This job bag has been ' +
        dbgJobDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring +
        ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
    end;

  OrigAccCtrlMenu := dmBroker.iAccCtrlMenu;
  dmJobBag := TdmJobBag.Create(Self);

  if aMode = jbAdd then
    Key := 0
  else
    begin
  //    Key := dmJobBag.CurrentJobBag;  { Get it before we close dataset }
      Key := dbgJobDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;
    end;

  try
    aBag := TJobBag.Create(dmJobBag);
    try
      aBag.DbKey := key;
      aBag.JBMode := aMode;
      aBag.LoadFromDB;
      Frm := TPBMaintJobBagFrm.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.JobBag := aBag;

        // if not in View mode, check is this record is locked, if not then lock it
        // 0  not locked
        // 1  locked but want to view
        // 2  locked and don't want to view
        if (dmBroker.iAccCtrlMenu <> 3) and (aMode = jbChange) then
          begin
            case dmBroker.LockRecord(inttostr(aBag.DbKey),'','','','','Job Bag',Frm.caption,frmPBMainMenu.Workstation,true) of
              0:;
              1: dmBroker.iAccCtrlMenu := 3;
              2: exit
            end
          end;

        Frm.ShowModal;
        if (Frm.ModalResult = mrok)
         then
          begin
            Key := aBag.DbKey;
          end;

      finally
        Frm.Free;
      end;
    finally
      dmBroker.UnlockRecord(inttostr(aBag.DbKey),'','','','','Job Bag',frmPBMainMenu.Workstation);
      aBag.Free;
    end;
  finally
    dmJobBag.Free;
    dmBroker.iAccCtrlMenu := OrigAccCtrlMenu;
  end;

  dtmdlCustJobs.RefreshData;
  dbgJobDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(Key)),[lopartialKey]) ;
//  CallHeaderForm(jbChange);
end;

procedure TPBMaintCustFrm.tbStockShow(Sender: TObject);
begin
  dtmdlCustStock.Customer := iCustomer;
  dtmdlCustStock.refreshdata;
  dbgStockDetails.DataSource.DataSet.Locate('Part', Variant(ActiveStockCode),[lopartialKey]);
end;

procedure TPBMaintCustFrm.edtStockSearchChange(Sender: TObject);
begin
  dtmdlCustStock.Description := edtStockSearch.Text;
  tmrSearch.tag := 6;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBMaintCustFrm.SetStockButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustStock do
  begin
    btnStockChange.Enabled := HeaderCount > 0;
    btnStockLabels.Enabled := HeaderCount > 0;
    btnStockLevels.Enabled := HeaderCount > 0;
    btnStockEnquiry.Enabled := HeaderCount > 0;
//    setbuttonproperties(self);
    stsBrStockDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TPBMaintCustFrm.tbInvoicesShow(Sender: TObject);
begin
  if not FActivatedInvoices then
    begin
      {Get the button statuses} ;
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuSalesInvoicing') ;
//      dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,'mnuSalesInvoicing') ;

      dtmdlCustInvoices.CustomerCode := iCustomer;
//      dtmdlCustInvoices.Customer := dtmdlOneCustomer.qryGetCustomer.fieldbyname('Name').asstring;
      dtmdlCustInvoices.Displayarchived := true;

(*      {Check if the operator REP is needed} ;
      If iMnuMaint = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;

      If iMnuMaint = 5 then
        dtmdlCustInvoices.Operator := frmpbMainMenu.iOperator;

      dtmdlCustInvoices.Rep := iOperatorRep;
      dtmdlCustInvoices.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

*)
      iOperatorRep := 0 ;
      FactivatedInvoices := true;
    end;

  dtmdlCustInvoices.refreshcustomerdata;
  dbgInvoiceDetails.DataSource.DataSet.Locate('Sales_Invoice', Variant(inttostr(ActiveInvoiceCode)),[lopartialKey]);
end;

procedure TPBMaintCustFrm.SetInvoiceButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustInvoices do
  begin
    btninvoiceChange.Enabled := HeaderCount > 0;
    btnInvoiceReprint.Enabled := HeaderCount > 0;
    stsBrInvoiceDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TPBMaintCustFrm.edtInvoiceSearchChange(Sender: TObject);
begin
  dtmdlCustInvoices.Description := (Sender as TEdit).text;
  tmrSearch.tag := 7;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBMaintCustFrm.btnInvoiceChangeClick(Sender: TObject);
begin
  CallInvoiceMaintScreen(siView)
end;

procedure TPBMaintCustFrm.btnInvoiceReprintClick(Sender: TObject);
var
  key: string;
begin
  key := dbgInvoiceDetails.datasource.dataset.fieldbyname('Sales_invoice_no').asstring;

  PBSalesInvrPrintFrm := TPBSalesInvrPrintFrm.Create(Self);
  try
    PBSalesInvRPrintFrm.selectionMemo.Text := Key;
    PBSalesInvrPrintFrm.InvoicePrint := true;
    PBSalesInvrPrintFrm.ShowModal;
  finally
    DefaultPrinter := Printer.Printers[Printer.Printerindex];
    DefaultBin := GetBinSelection;
    PBSalesInvrPrintFrm.Free;
  end;
end;

procedure TPBMaintCustFrm.CallInvoiceMaintScreen(aMode : TsiMode);
var
  Key : integer;
  frm : TPBMaintSalesInvoicefrm;
  aInvoice : TSalesInvoice;
  sWarning: string;
begin
  if aMode = siAdd then
    Key := 0
  else
  if aMode = siView then
    begin
      Key := dtmdlCustInvoices.CurrentSInvoice;
      if MessageDlg('You only have access to view the selected invoice, continue?', mtConfirmation,
              [mbOk,mbCancel], 0) = mrCancel then exit;
    end
  else
    begin
      Key := dtmdlCustInvoices.CurrentSInvoice;
      if dbgInvoiceDetails.DataSource.DataSet.FieldByName('Inactive').Asstring = 'Y' then
        begin
          if MessageDlg('This invoice has been deleted, the details can only be viewed and cannot be modified', mtWarning,
            [mbOk,mbCancel], 0) = mrCancel then
            exit;
          aMode := siView;
        end
      else
      begin
        {Check whether Period end has been run on the invoice}
        with dtmdlCustInvoices.qryPEnd do
        begin
          close;
          parambyname('Sales_invoice').asinteger := Key;
          open;
          if recordcount > 0 then
          begin
          if aMode = siDelete then
            begin
              MessageDlg('This invoice has been included in a period end '
                        + 'and therefore cannot be deleted.', mterror, [mbOk], 0);
              exit;
            end
          else
            begin
              if MessageDlg('This invoice has been included in a period end, '
                        + 'the details can only be viewed and cannot be modified', mtWarning,
              [mbOk,mbCancel], 0) = mrCancel then exit;
              aMode := siView;
            end;
          end
          else
            begin
              if dbgInvoiceDetails.DataSource.DataSet.FieldByName('Sales_Invoice_Status').AsInteger > 20 then
                begin
                  if MessageDlg('This invoice has been posted to the ledger, the details can only be viewed and cannot be modified or deleted', mtWarning,
                      [mbOk,mbCancel], 0) = mrCancel then exit;
                  aMode := siView;
                end
              else
              if dbgInvoiceDetails.DataSource.DataSet.FieldByName('Sales_Invoice_Status').AsInteger = 20 then
                begin
                  if aMode = siDelete then
                    sWarning := 'This invoice has been printed, are you sure you wish to delete this invoice?'
                  else
                    sWarning := 'This invoice has been printed, any changes made will require a reprint of the invoice.';

                  if MessageDlg(sWarning, mtWarning, [mbOk,mbCancel], 0) = mrCancel then
                    exit;
                end;
            end;
        end;
      end;
    end;

//  dbgInvoiceDetails.DataSource.DataSet.Close;
  try
    aInvoice := TSalesInvoice.Create(dtmdlCustInvoices);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TPBMaintSalesInvoicefrm.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.SalesInvoice := aInvoice;
        Frm.ShowModal;
        Key := aInvoice.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aInvoice.Free;
    end;
  finally
    dbgInvoiceDetails.DataSource.DataSet.Close;
    dbgInvoiceDetails.DataSource.DataSet.Open;
    dbgInvoiceDetails.DataSource.DataSet.Locate('Sales_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;
  end;
end;

procedure TPBMaintCustFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBMaintCustFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TPBMaintCustFrm.dbgInvoiceDetailsDblClick(Sender: TObject);
begin
  btnInvoiceChangeclick(self);

end;

procedure TPBMaintCustFrm.dbgInvoiceDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
VAR
  TempRect: TRect;
  Txt: array [0..255] of Char;
  sValue: string;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  TempRect := Rect;
  if (dbgInvoiceDetails.datasource.dataset.fieldbyname('Invoice_or_credit').asstring = 'I') and
    (dbgInvoiceDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if (dbgInvoiceDetails.datasource.dataset.fieldbyname('Invoice_or_credit').asstring = 'C') then
    (Sender as TDBGrid).Canvas.font.Color := clRed;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'Invoice No') and
      (Column.Title.Caption <> 'Total') and
      (Column.Title.Caption <> 'Goods') and
      (Column.Title.Caption <> 'VAT') then
  	begin
      if Assigned(Column.Field) then
	      StrPCopy(Txt, Column.Field.AsString) else
        StrPCopy(Txt, '');
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
    else
  	begin
      WITH Sender AS TDBGrid DO
        BEGIN
          if  (Column.Title.Caption <> 'Invoice No.') and
            (Column.Title.Caption <> 'Goods') and
            (Column.Title.Caption <> 'Total') and
             (Column.Title.Caption <> 'VAT') then
              begin
            Canvas.Brush.Color := Color;
            Canvas.Font.Color  := Font.Color;
            Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,
              Column.field.asstring);
               end;
        END;
			{Display the Columns Right justified in the cells}
      if Assigned(Column.Field) then
      begin
        if  (Column.Title.Caption = 'Goods') or
            (Column.Title.Caption = 'Total') or
            (Column.Title.Caption = 'VAT') then
          try
            sValue := formatfloat('£#,###,##0.00', StrToFloatDef(Column.field.AsString, 0, FormatSettings))
          except
            sValue := ''
          end
        else
          sValue := Column.field.asstring;
      end else
        Svalue := '';

  		StrPCopy(Txt, sValue);

  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
end;

procedure TPBMaintCustFrm.edtInvoiceNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgInvoiceDetails.Datasource.Dataset.Locate('Sales_Invoice_no', Variant(edtInvoiceNumber.Text), [loPartialKey]) then
      btnInvoiceChangeClick(self)
    else
      ShowMessage('Sales Invoice: '+ edtInvoiceNumber.Text + ' does not exist in the current selection.');
  end;

end;

procedure TPBMaintCustFrm.SetSalesInvoiceEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
      try
        edtInvoiceNumber.Text := floatToStr(Dataset.FieldByName('Sales_Invoice_no').asfloat);
      except
        edtInvoiceNumber.Text := '';
      end;
    end;
  with Dataset do
  begin
    btnInvoiceReprint.enabled := (fieldbyname('Sales_invoice_Status').asinteger >= 20);
  end;
end;

procedure TPBMaintCustFrm.tbInvoicesExit(Sender: TObject);
begin
  try
    ActiveInvoiceCode := dbgInvoiceDetails.datasource.DataSet.FieldByName('Sales_invoice').asinteger;
  except
    ActiveInvoiceCode := 0;
  end;

end;

procedure TPBMaintCustFrm.btnStockChangeClick(Sender: TObject);
begin
  CallStockMaintScreen('V');
end;

procedure TPBMaintCustFrm.CallStockMaintScreen(sTempFuncMode: Char);
var
  bTempOK: ByteBool;
  TempPart: string;
begin
  frmSTMaintProduct := TfrmSTMaintProduct.Create(Self);
  try
    if sTempFuncMode = 'A' then
      frmSTMaintProduct.sPart := ''
    else
      frmSTMaintProduct.sPart := dbgStockDetails.datasource.DataSet.fieldbyname('Part').asstring;

    frmSTMaintProduct.iCustomer := iCustomer;
    frmSTMaintProduct.sFuncMode := sTempFuncMode;
    frmSTMaintProduct.ShowModal;
    bTempOK := frmSTMaintProduct.bOK;
    TempPart := frmSTMaintProduct.edtProductCode.text;
  finally
    frmSTMaintProduct.Free;
  end;
  if bTempOK then
  begin
    dtmdlCustStock.Refreshdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgStockDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;
    end;
  end;
end;

procedure TPBMaintCustFrm.btnStockLabelsClick(Sender: TObject);
begin
  STRSLabelsFrm := TSTRSLabelsFrm.create(self);
  try
    STRSLabelsfrm.Selcode := dbgStockDetails.datasource.DataSet.fieldbyname('Part').asstring;
    STRSLabelsfrm.SelName := dbgStockDetails.datasource.DataSet.fieldbyname('Description').asstring;
    STRSLabelsFrm.showmodal;
  finally
    STRSLabelsFrm.free;
  end;
end;

procedure TPBMaintCustFrm.btnStockLevelsClick(Sender: TObject);
begin
  frmSTLUProductLvls := TfrmSTLUProductLvls.create(self);
  try
    frmSTLUProductLvls.sPart := dbgStockDetails.datasource.dataset.fieldbyname('Part').asstring;
    frmSTLUProductLvls.showmodal;
  finally
    frmSTLUProductLvls.free;
  end;
end;

procedure TPBMaintCustFrm.StockMovements2Click(Sender: TObject);
begin
  try
    with dtmdlCustStock.qryPartMvmnts do
    begin
      close;
      paramByName('Part').AsString := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkMvmntsFrm := TSTLUStkMvmntsFrm.Create(self);
    STLUStkMvmntsFrm.dtmdlStockEnquiry := dtmdlCustStock;

    if dtmdlCustStock.qryPartMvmnts.RecordCount = 0 then
    begin
      MessageDlg('There are no movements for this product', mtInformation, [mbOk], 0);
      dtmdlCustStock.qryPartMvmnts.close;
      exit;
    end;

    STLUStkMvmntsFrm.lblPartCode.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkMvmntsFrm.lblPartDesc.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Description').AsString;
    STLUStkMvmntsFrm.lblTotalStock.Caption := formatfloat('#,##0',dbgStockDetails.dataSource.DataSet.FieldByName('store_qty').Asfloat);
    STLUStkMvmntsFrm.lblFreeStock.Caption := formatfloat('#,##0',dbgStockDetails.dataSource.DataSet.FieldByName('qty_free').Asfloat);

    STLUStkMvmntsFrm.ShowModal;
  finally
    STLUStkMvmntsFrm.Free;
  end;
  dtmdlCustStock.qryPartMvmnts.close;

end;

procedure TPBMaintCustFrm.Numbersequences1Click(Sender: TObject);
begin
  STLUStkNmbrFrm := TSTLUStkNmbrFrm.Create(self);
  try
    with dtmdlCustStock.qryPartNumbers do
    begin
      close;
      paramByName('Part').AsString := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkNmbrFrm.dtmdlStockEnquiry := dtmdlCustStock;

    if dtmdlCustStock.qryPartNumbers.RecordCount = 0 then
    begin
      MessageDlg('No numbers exists for this product', mtInformation, [mbOk], 0);
      dtmdlCustStock.qryPartNumbers.close;
      exit;
    end;

    STLUStkNmbrFrm.lblPartCode.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkNmbrFrm.lblPartDesc.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Description').AsString;

    STLUStkNmbrFrm.ShowModal;
  finally
    STLUStkNmbrFrm.Free;
  end;

end;

procedure TPBMaintCustFrm.BinLocations1Click(Sender: TObject);
begin
  STLUStkLocFrm := TSTLUStkLocFrm.Create(self);
  try
    with dtmdlCustStock.qryPartStoreBins do
    begin
      close;
      paramByName('Part').AsString := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkLocFrm.dtmdlStockEnquiry := dtmdlCustStock;

    if dtmdlCustStock.qryPartStoreBins.RecordCount = 0 then
    begin
      MessageDlg('No stock exists for this product', mtInformation, [mbOk], 0);
      dtmdlCustStock.qryPartStoreBins.close;
      exit;
    end;

    STLUStkLocFrm.lblPartCode.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkLocFrm.lblPartDesc.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Description').AsString;

    STLUStkLocFrm.ShowModal;
  finally
    STLUStkLocFrm.Free;
  end;

end;

procedure TPBMaintCustFrm.SalesOrdersCallOffs1Click(Sender: TObject);
begin
  STLUStkSalesFrm := TSTLUStkSalesFrm.Create(self);
  try
    with dtmdlCustStock.qryPartSales do
    begin
      close;
      paramByName('Part').AsString := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkSalesFrm.dtmdlStockEnquiry := dtmdlCustStock;

    if dtmdlCustStock.qryPartSales.RecordCount = 0 then
    begin
      MessageDlg('There are no sales orders for this product', mtInformation, [mbOk], 0);
      dtmdlCustStock.qryPartSales.close;
      exit;
    end;

    STLUStkSalesFrm.lblPartCode.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkSalesFrm.lblPartDesc.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Description').AsString;

    STLUStkSalesFrm.ShowModal;
  finally
    STLUStkSalesFrm.Free;
  end;
  dtmdlCustStock.qryPartSales.close;

end;

procedure TPBMaintCustFrm.ProductionOrders2Click(Sender: TObject);
begin
  STLUStkProductionFrm := TSTLUStkProductionFrm.Create(self);
  try
    with dtmdlCustStock.qryPartProduction do
    begin
      close;
      paramByName('Part').AsString := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkProductionFrm.dtmdlStockEnquiry := dtmdlCustStock;

    if dtmdlCustStock.qryPartProduction.RecordCount = 0 then
    begin
      MessageDlg('There are no production orders for this product', mtInformation, [mbOk], 0);
    end
    else
    begin
      STLUStkProductionFrm.lblPartCode.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
      STLUStkProductionFrm.lblPartDesc.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Description').AsString;

      STLUStkProductionFrm.ShowModal;
    end;
  finally
    STLUStkProductionFrm.Free;
  end;
  dtmdlCustStock.qryPartProduction.close;

end;

procedure TPBMaintCustFrm.PurchaseOrders2Click(Sender: TObject);
begin
  STLUStkPurchasesFrm := TSTLUStkPurchasesFrm.Create(self);
  try
    with dtmdlCustStock.qryPartPOs do
    begin
      close;
      paramByName('Part').AsString := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkPurchasesFrm.dtmdlStockEnquiry := dtmdlCustStock;

    if dtmdlCustStock.qryPartPOs.RecordCount = 0 then
    begin
      MessageDlg('There are no purchase orders for this product', mtInformation, [mbOk], 0);
    end
    else
    begin
      STLUStkPurchasesFrm.lblPartCode.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Part').AsString;
      STLUStkPurchasesFrm.lblPartDesc.Caption := dbgStockDetails.dataSource.DataSet.FieldByName('Description').AsString;

      STLUStkPurchasesFrm.ShowModal;
    end;
  finally
    STLUStkPurchasesFrm.Free;
  end;
  dtmdlCustStock.qryPartPOs.close;

end;

procedure TPBMaintCustFrm.chkbxShowNotinUseClick(Sender: TObject);
begin
  if chkbxShowNotInUse.Checked then
    dtmdlCustStock.NotInUse := 'Y'
  else
    dtmdlCustStock.NotInUse := 'N';
  dtmdlCustStock.Refreshdata;

end;

procedure TPBMaintCustFrm.tbStockExit(Sender: TObject);
begin
  try
    ActiveStockcode := dbgStockDetails.datasource.DataSet.FieldByName('Part').asstring;
  except
    ActiveStockCode := '';
  end;
end;

procedure TPBMaintCustFrm.dbgStockDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
VAR
  TempRect: TRect;
  Txt: array [0..255] of Char;
  sValue: string;
begin
  TempRect := Rect;
  if (dbgStockDetails.datasource.dataset.fieldbyname('Not_in_Use').asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end
  else
  if (dbgStockDetails.datasource.dataset.fieldbyname('Store_Qty').asinteger < dbgStockDetails.datasource.dataset.fieldbyname('Reorder_Level').asinteger) then
    (Sender as TDBGrid).Canvas.font.color := cllime;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'In Stock') and
      (Column.Title.Caption <> 'Allocated') and
      (Column.Title.Caption <> 'Free Stock') and
      (Column.Title.Caption <> 'Paid for') and
      (Column.Title.Caption <> 'Unpaid') and
      (Column.Title.Caption <> 'On Buy Print') and
      (Column.Title.Caption <> 'Maximum') and
      (Column.Title.Caption <> 'Minimum') and
      (Column.Title.Caption <> 'In Production') and
      (Column.Title.Caption <> 'Reorder') and
      (Column.Title.Caption <> 'Forward') and
      (Column.Title.Caption <> 'Unallocated SO') and
      (Column.Title.Caption <> 'Future Stock') and
      (Column.Title.Caption <> 'On Purchase') then
  	begin
      if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
      SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
      ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
  else
  	begin
  		if Assigned(Column.Field) then 
	  StrPCopy(Txt, Column.field.text) else
	  StrPCopy(Txt, '');
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;
end;

procedure TPBMaintCustFrm.dbgStockDetailsDblClick(Sender: TObject);
begin
  btnStockChangeClick(self);
end;

procedure TPBMaintCustFrm.dbgJobDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (dbgJobDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if (dbgJobDetails.datasource.dataset.fieldByName('NCA_Live_Lines').Asinteger > 0) then
    (Sender as TDBGrid).Canvas.Brush.color := clRed
  else
  if (dbgJobDetails.datasource.dataset.fieldByName('NCA_Signed_Off').Asinteger > 0) then
    (Sender as TDBGrid).Canvas.Brush.color := cllime
  else
  if (dbgJobDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') or (dbgJobDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'P') then
    (Sender as TDBGrid).Canvas.font.Color := clRed;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TPBMaintCustFrm.tbJobsExit(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Centrereed Broker', 'Customer Job Bag Search Date', pbdatestr(dtmdlCustJobs.JobDate));
  finally
    IniFile.Free;
  end;

  try
    ActiveJobcode := dbgJobDetails.datasource.DataSet.FieldByName('Job_Bag').asinteger;
  except
    ActiveJobCode := 0;
  end;

end;

procedure TPBMaintCustFrm.btnOrderAddMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if frmPBMainMenu.UseStockSystem then
    btnOrderAdd.dropdownMenu := pmnOrderAdd;

end;

procedure TPBMaintCustFrm.btnFromPOClick(Sender: TObject);
begin
  CallOrderMaintScreen('A');
end;

procedure TPBMaintCustFrm.btnFromSOClick(Sender: TObject);
begin
  CallSOMaintScreen('A');

end;

procedure TPBMaintCustFrm.mnuAllocateClick(Sender: TObject);
begin
  CallAllocScreen('A');
end;

procedure TPBMaintCustFrm.mnuDeAllocateClick(Sender: TObject);
begin
  CallAllocScreen('D');
end;

procedure TPBMaintCustFrm.btnPrintPickNoteClick(Sender: TObject);
var
  Reprint: ByteBool;
  selcode: integer;
  iSordHeadStatus: integer;
  bTempOK: Bytebool;
begin
  if not CheckOrderInput then
    exit;
  Reprint := false;
  selcode := dbgOrderDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  iSOrdHeadStatus := dbgOrderDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  if (iSordHeadStatus < 50) then
    begin
      messagedlg('Cannot print a Picking Note, stock has not been allocated to the order.', mtWarning,
      [mbOk], 0);
      exit
    end;

  if (iSordHeadStatus = 100) then
    begin
      messagedlg('The Picking Note has already been printed', mtWarning,
      [mbOk], 0);
      Reprint := true
    end;

  if (iSordHeadStatus >= 150) then
    begin
      messagedlg('The status of this order is '+ dbgOrderDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ' can only print/reprint Despatch Note.', mtWarning,
      [mbOk], 0);
     exit;
    end;

  if (dtmdlCustOrders.GetSOReplenSource(selcode) = 1) then
    begin
      messagedlg('Picking Notes cannot be printed for Direct Supply orders', mtInformation,
      [mbOk], 0);
      exit;
    end;

  STRSPickNotefrm:= TSTRSPickNotefrm.create(self);
  try
    STRSPickNotefrm.OrderGroupBox.caption := STRSPickNotefrm.OrderGroupBox.caption + inttostr(selcode);
    STRSPickNotefrm.Customerlbl.caption := NameEdit.text;
    STRSPickNotefrm.OrderDateLbl.caption := dbgOrderDetails.datasource.dataset.fieldbyname('Order_Date').asstring;
    STRSPickNotefrm.DeliveryDateEdit.text := dbgOrderDetails.datasource.dataset.fieldbyname('Goods_Required').asstring;
    STRSPickNotefrm.SONumber := dbgOrderDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
    STRSPickNotefrm.DateRequired := dbgOrderDetails.datasource.dataset.fieldbyname('Goods_Required').asdatetime;
    STRSPickNotefrm.Reprint := Reprint;
    STRSPickNotefrm.showmodal;
    bTempOK := STRSPickNotefrm.bOK;
  finally
    STRSPickNotefrm.free;
  end;
  If bTempOK then
  begin
    dtmdlCustOrders.Refreshdata;
    dbgOrderDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;

end;

procedure TPBMaintCustFrm.btnConfirmPickClick(Sender: TObject);
var
  selcode: integer;
  bTempOK: Bytebool;
  iIntSelCode: integer;
  sPickRef: string;
  iSOrdHeadStatus: integer;
begin
  if not CheckOrderInput then
    exit;
  selcode := dbgOrderDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  iSOrdHeadStatus := dbgOrderDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  if (iSordHeadStatus = 150) then
    begin
      messagedlg('Cannot reconfirm the Delivery', mtWarning,
      [mbOk], 0);
      exit
    end;

  if (iSordHeadStatus > 150) then
    begin
      messagedlg('The status of this order is '+ dbgOrderDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ' cannot Confirm the Delivery again.', mtWarning,
      [mbOk], 0);
      exit;
    end;

  if (dtmdlCustOrders.GetSoReplenSource(selcode) = 1) then
    begin
      messagedlg('Despatch Confirmation cannot be run for Direct Supply orders', mtInformation,
      [mbOk], 0);
      exit;
    end;

  {Delete any entries currently in the IntSel table for this process}
  {This has all been added because the Picking confirmation screen works off the Intsel table}
  iIntSelCode := dmBroker.GetNextIntSelCode(Self) ;
  dmBroker.DelIntSelCode(iIntSelCode, True);

  {Get the Picking Refererence}
  sPickRef := dtmdlCustOrders.GetPickingRef(selcode);
  dmBroker.AddIntSelCode(iIntSelCode,StrToFloatDef(sPickRef, 0, FormatSettings),sPickRef);
  
  stPickDM := TstpickDm.Create(self);
  stStockDataMod := TstStockDataMod.Create(self);
  PickingList := TPickingList.Create(stPickDM);

  STPickByPartFrm := TSTPickBYPartFrm.Create(Self);
  try
    STPickByPartFrm.IsSalesOrder := True;
    STPickByPartFrm.iintselcode := iIntselcode;
    STPickByPartFrm.ShowModal;
    bTempOK := STPickByPartFrm.bOK;
  finally
    STPickBYPartFrm.Free;

    stStockDataMod.free;
    stPickDM.free;
  end;
  If bTempOK then
  begin
    dtmdlCustOrders.Refreshdata;
    dbgOrderDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TPBMaintCustFrm.Approvalform1Click(Sender: TObject);
var
  SelCode: real;
  SelLine: integer;
  bAuthorised: boolean;
begin
  if not CheckOrderInput then
    exit;

  bAuthorised := not (dbgOrderDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  SelCode := dbgOrderDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  SelLine := dbgOrderDetails.datasource.DataSet.FieldByName('Line').asinteger;
  {Check whether the Proof has already been printed}
  if dbgOrderDetails.datasource.Dataset.fieldbyname('Proof_Revision').asstring <> '' then
  begin
    if MessageDlg('The Proof Approval Form has already been printed - Continue?', mtConfirmation,
        [mbNo, mbYes], 0) <> mrYes then
    Exit;
  end;

  {Proof Print}
  PBRSProofNFrm := TPBRSProofNFrm.Create(Self);
  try
    PBRSProofNFrm.OrderMemo.text := floattostr(selcode);
    PBRSProofNFrm.iLine := selline;
    PBRSProofNFrm.ShowModal;
  finally
    PBRSProofNFrm.Free;
  end;
end;

procedure TPBMaintCustFrm.btnStatus1Click(Sender: TObject);
var
  selcode: real;
  selline: integer;
  bAuthorised: boolean;
begin
  if not CheckOrderInput then
    exit;

  bAuthorised := not (dbgOrderDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  SelCode := dbgOrderDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  SelLine := dbgOrderDetails.datasource.DataSet.FieldByName('Line').asinteger;

  {Purchase order Print/Fax}
  PBLUProofHistNFrm := TPBLUProofHistNFrm.Create(Self);
  try
    PBLUProofHistNFrm.rpurchord := selcode;
    PBLUProofHistNFrm.ipurchordline := selline;
    PBLUProofHistNFrm.bAllow_Upd := true;
    PBLUProofHistNFrm.bAllow_Add := true;
    PBLUProofHistNFrm.iDataOp := frmpbMainMenu.iOperator;
    PBLUProofHistNFrm.iDataRep := frmpbMainMenu.iRep;
    PBLUProofHistNFrm.ShowModal;
  finally
    PBLUProofHistNFrm.Free;
  end;
end;

procedure TPBMaintCustFrm.pmnOrderAllocatePopup(Sender: TObject);
var
  selcode: integer;
begin
  selcode := dbgOrderDetails.datasource.DataSet.FieldByName('Sales_order').AsInteger;
  mnuAllocate.enabled :=  (dtmdlCustOrders.GetSoReplenSource(selcode) <> 1) and
                          (dbgOrderDetails.datasource.DataSet.FieldByName('Order_status').AsInteger >= 10) and
                          (dbgOrderDetails.datasource.DataSet.FieldByName('Order_status').AsInteger < 50);

  mnuDeAllocate.enabled := (dtmdlCustOrders.GetSoReplenSource(selcode) <> 1) and
                           (dbgOrderDetails.datasource.DataSet.FieldByName('Order_status').AsInteger = 50);


end;

procedure TPBMaintCustFrm.dbgOrderDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgOrderDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end
  else
  if (dbgOrderDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y') then
    begin
      if (dbgOrderDetails.datasource.dataset.fieldByName('Order_Status').AsInteger = 5) then
        (Sender as TDBGrid).Canvas.Brush.color := cllime
      else
        (Sender as TDBGrid).Canvas.font.Color := clLime
    end
  else
  if (dbgOrderDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') then
    (Sender as TDBGrid).Canvas.font.Color := clRed
  else
  if (dbgOrderDetails.datasource.dataset.fieldByName('Authorised_By').AsInteger <> 0) then
    (Sender as TDBGrid).Canvas.font.style := [fsBold]
  else
  if (dbgOrderDetails.datasource.dataset.fieldByName('NCA_Live_Lines').Asinteger > 0) then
    (Sender as TDBGrid).Canvas.Brush.color := clRed
  else
  if (dbgOrderDetails.datasource.dataset.fieldByName('NCA_Signed_Off').Asinteger > 0) then
    (Sender as TDBGrid).Canvas.Brush.color := cllime;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'Order') and
      (Column.Title.Caption <> 'Job Bag') and
      (Column.Title.Caption <> 'Cost Price') and
      (Column.Title.Caption <> 'Cost Unit') and
      (Column.Title.Caption <> 'Sell Unit') and
      (Column.Title.Caption <> 'Sell Price') and
      (Column.Title.Caption <> 'Quantity') then
  	begin
      if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
      SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
      ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
  else
  	begin
  		if Assigned(Column.Field) then 
	  StrPCopy(Txt, Column.field.text) else
	  StrPCopy(Txt, '');
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;
end;

procedure TPBMaintCustFrm.chkbxShowUnauthorisedClick(Sender: TObject);
begin
  dtmdlCustOrders.ShowOnlyUnAuthorised := (Sender as TCheckbox).checked;
  dtmdlCustOrders.RefreshPOData;

end;

procedure TPBMaintCustFrm.tbOrdersExit(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Centrereed Broker', 'Customer Order Search Date', pbdatestr(dtmdlCustOrders.OrderDate));
  finally
    IniFile.Free;
  end;

  try
    ActiveOrdercode := dbgOrderDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  except
    ActiveOrderCode := 0;
  end;

end;

procedure TPBMaintCustFrm.CallAllocScreen(sTempFuncMode: Char);
var
  iTempSel: Integer;
  bTempOK: Boolean;
  selcode: integer;
begin
  SelCode := dbgOrderDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
  STPrtAllocSalesFrm := TSTPrtAllocSalesFrm.Create(Self);
  try
    STPrtAllocSalesFrm.iOrder := selcode;
    STPrtAllocSalesFrm.bDeAlloc := (sTempFuncMode = 'D');

    STPrtAllocSalesFrm.iStoreFrom := dtmdlCustOrders.GetSOPartStore(selcode);
    STPrtAllocSalesFrm.lblSalesOrderNo.Caption := 'Sales Order: ' + IntToStr(selcode) +
                                 '   Despatch From: ' ;
    STPrtAllocSalesFrm.ShowModal;
    bTempOK := STPrtAllocSalesFrm.bOK ;
    iTempSel := selcode;
  finally
    STPrtAllocSalesFrm.Free;
  end;
  If bTempOK then
  begin
    dtmdlCustOrders.Refreshdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgOrderDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  end;
end;

procedure TPBMaintCustFrm.dbgOrderDetailsDblClick(Sender: TObject);
begin
  btnOrderChangeclick(self);
end;

procedure TPBMaintCustFrm.tbEnquiriesExit(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Centrereed Broker', 'Enquiry Search Date', pbdatestr(dtmdlCustEnqs.EnquiryDate));
  finally
    IniFile.Free;
  end;

  try
    ActiveEnquirycode := dbgEnquiryDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
  except
    ActiveEnquiryCode := 0;
  end;

end;

procedure TPBMaintCustFrm.dbgEnquiryDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (dbgEnquiryDetails.datasource.dataset.fieldByName('Enq_Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clRed;
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TPBMaintCustFrm.SetQuoteButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustQuotes do
  begin
    btnQuoteChange.Enabled := HeaderCount > 0;
    btnQuoteCopy.Enabled := HeaderCount > 0;
    btnQuoteDelete.Enabled := HeaderCount > 0;
    btnQuoteReQuote.Enabled := HeaderCount > 0;
    btnQuotePrint.Enabled := HeaderCount > 0;
    btnQuoteConvert.Enabled := HeaderCount > 0;
    edtQuoteNumber.Text := dbgQuoteDetails.datasource.dataset.fieldbyname('Quote').asstring;

(*    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;
*)
    stsBrQuoteDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TPBMaintCustFrm.SetBranchButtons(Sender: TObject; Field: TField);
begin
  with dtmdlOneCustomer do
  begin
    btnBranchChange.enabled := BranchCount > 0;
    btnBranchDelete.enabled := BranchCount > 0;
  end;
end;

procedure TPBMaintCustFrm.SetContactButtons(Sender: TObject; Field: TField);
begin
  with dtmdlOneCustomer do
  begin
    btnContactChange.enabled := ContactCount > 0;
    btnContactDelete.enabled := ContactCount > 0;
    btnContactMove.enabled := ContactCount > 0;
    btnContactOnline.enabled := ContactCount > 0;
  end;
end;

procedure TPBMaintCustFrm.edtQuoteSearchChange(Sender: TObject);
begin
  dtmdlCustQuotes.Description := edtQuoteSearch.Text;
  tmrSearch.tag := 2;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBMaintCustFrm.dbgQuoteDetailsDblClick(Sender: TObject);
begin
  btnQuoteChangeclick(self);

end;

procedure TPBMaintCustFrm.btnQuoteChangeClick(Sender: TObject);
begin
  if not CheckQuoteInput then
    exit;
  if trim(btnQuoteChange.caption) = '&View' then
    CallQuoteMaintScreen(qView)
  else
    CallQuoteMaintScreen(qChange);
end;

procedure TPBMaintCustFrm.btnQuoteAddClick(Sender: TObject);
begin
  CallQuoteMaintScreen(qAdd);
end;

procedure TPBMaintCustFrm.CallQuoteMaintScreen(aMode: TQMode);
var
  Key : real;
  frm : TPBMaintQuoteFrm;
  aQuote : TQuote;
  OrigAccCtrlMenu: integer;
begin
  if (aMode = qChange) and (dbgQuoteDetails.Datasource.Dataset.fieldbyname('Quote_Status').asinteger >= 100) then
    begin
      if MessageDlg('This quote is ' +
        dbgQuoteDetails.Datasource.Dataset.fieldbyname('Quote_Status_Description').asstring +
        ' and can only be viewed - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
      aMode := qView;
    end;

  OrigAccCtrlMenu := dmBroker.iAccCtrlMenu;

  if aMode = qAdd then
    Key := 0
  else
    begin
      Key := dbgQuoteDetails.DataSource.DataSet.fieldbyname('Quote').asfloat;
    end;

  try
    aQuote := TQuote.Create(dtmdlCustQuotes);
    try
      aQuote.DbKey := key;
      aQuote.qMode := aMode;
      aQuote.LoadFromDB;
      Frm := TPBMaintQuoteFrm.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.Quote := aQuote;

        // if not in View mode, check is this record is locked, if not then lock it
        // 0  not locked
        // 1  locked but want to view
        // 2  locked and don't want to view
        if (dmBroker.iAccCtrlMenu <> 3) and (aMode = qChange) then
          begin
            case dmBroker.LockRecord(floattostr(aQuote.DbKey),'','','','','Quote',Frm.caption,frmPBMainMenu.Workstation,true) of
              0:;
              1: dmBroker.iAccCtrlMenu := 3;
              2: exit
            end
          end;

        Frm.ShowModal;
        if (Frm.ModalResult = mrok)
         then
          begin
            Key := aQuote.DbKey;
          end;

      finally
        Frm.Free;
      end;
    finally
      dmBroker.UnlockRecord(floattostr(aQuote.DbKey),'','','','','Quote',frmPBMainMenu.Workstation);
      aQuote.Free;
    end;
  finally
    dmBroker.iAccCtrlMenu := OrigAccCtrlMenu;
  end;

  dtmdlCustQuotes.RefreshData;
  dbgQuoteDetails.DataSource.DataSet.Locate('Quote', Variant(floattostr(Key)),[lopartialKey]) ;
end;

procedure TPBMaintCustFrm.btnQuotePrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: real;
begin
  if not CheckQuoteInput then
    exit;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmPBRSQuote := TfrmPBRSQuote.Create( Application );
    Key := dbgQuoteDetails.DataSource.DataSet.fieldbyname('Quote').asfloat;

    frmPBRSQuote.memSelection.text := floattostr(Key);
    frmPBRSQuote.bProspect := (dbgQuoteDetails.DataSource.DataSet.fieldbyname('Ad_hoc_Address').asinteger <> 0);
    frmPBRSQuote.edtCustomer.text := dbgQuoteDetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    frmPBRSQuote.memDescription.text := dbgQuoteDetails.DataSource.DataSet.fieldbyname('Description').asstring;
    frmPBRSQuote.memQuantity.text := dbgQuoteDetails.DataSource.DataSet.fieldbyname('Quantity').asstring;
    frmPBRSQuote.showmodal;
  finally
    frmPBRSQuote.free;
    dbgQuoteDetails.DataSource.DataSet.Close;
    dbgQuoteDetails.DataSource.DataSet.Open;
    Screen.Cursor := OldCursor;
  end;
  dbgQuoteDetails.DataSource.DataSet.Locate('Quote', Variant(floattostr(Key)),[lopartialKey]) ;
end;

function TPBMaintCustFrm.CheckQuoteInput: boolean;
begin
  result := true;
  if not dbgQuoteDetails.datasource.DataSet.locate('Quote', Variant(edtQuoteNumber.text),[lopartialKey]) then
    begin
      messagedlg('Quote '+ edtQuoteNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TPBMaintCustFrm.btnQuoteConvertClick(Sender: TObject);
begin
  if not CheckQuoteInput then
    exit;
  ConvertQuoteToJob;
end;

procedure TPBMaintCustFrm.ConvertQuoteToJob;
var
  QuoteNo : real;
  key: integer;
  frm : TPBMaintJobBagFrm;
  aJob : TJobBag;
  dtmdlJob: TdmJobBag;
begin
  if dbgQuoteDetails.DataSource.DataSet.FieldByName('Quote_status').asinteger <= 20 then
    begin
      MessageDlg('This is a request for quote and requires an estimate before it can be converted to a job bag', mtError,
        [mbAbort], 0);
      exit;
    end
  else
  if dbgQuoteDetails.DataSource.DataSet.FieldByName('Quote_status').asinteger >=100 then
    begin
      MessageDlg('Cannot convert this quote, this quote has already been converted to a job bag', mtError,
        [mbAbort], 0);
      exit;
    end;

  if dbgQuoteDetails.DataSource.DataSet.FieldByName('inactive').asstring = 'Y' then
    begin
      MessageDlg('Cannot convert this quote, this quote has been declined', mtError,
        [mbAbort], 0);
      exit;
    end;

  if (dbgQuoteDetails.DataSource.dataset.fieldbyname('Estimate_File').asstring <> '') then
    begin
      if (FileDateToDateTime(FileAge(dbgQuoteDetails.DataSource.dataset.fieldbyname('Estimate_File').asstring)) > dbgQuoteDetails.DataSource.dataset.fieldbyname('Date_Last_Estimated').asdatetime) then
        begin
          if messagedlg('There is a possibility that the estimate is different to the quote, do you want to go back into the quote and recalculate', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit;
          CallQuoteMaintScreen(qChange);
          exit;
        end;
    end;

  if dbgQuoteDetails.DataSource.DataSet.FieldByName('Ad_Hoc_Address').asinteger <> 0 then
    begin
      MessageDlg('This quote is for a prospect, in order to convert this to a job, the prospect must be set up as a customer', mtError,
        [mbAbort], 0);
      exit;
    end;

  if dmBroker.GetCustomerStatus(dbgQuoteDetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Quotes cannot be converted for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  if MessageDlg('Do you want to convert quote ' + edtQuoteNumber.text + ', to a new job bag?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;

  dtmdlJob := TdmJobBag.create(application);
  QuoteNo := 0;
  Key := 0;
  try
    aJob := TJobBag.Create(dtmdlJob);
    try
      QuoteNo := dbgQuoteDetails.DataSource.DataSet.FieldByName('Quote').asfloat;
      aJob.DataModule.QuoteNo := QuoteNo;
      aJob.DbKey := key;
      aJob.LoadFromQuote;
      Frm := TPBMaintJobBagFrm.Create(Self);
      try
        Frm.Mode := jbConvert;
        Frm.JobBag := aJob;
        Frm.ShowModal;
        if Frm.ModalResult = idOK then
          begin
            dtmdlCustQuotes.UpdateQuoteStatus(aJob.DataModule.QuoteNo,100);
          end;
      finally
        Frm.Free;
      end;
    finally
      aJob.Free;
    end;
  finally
    dtmdlJob.free;
    dtmdlCustQuotes.RefreshData;
    dbgQuoteDetails.DataSource.DataSet.Locate('Quote', Variant(floattostr(QuoteNo)),[lopartialKey]) ;
  end;
end;

procedure TPBMaintCustFrm.edtQuoteNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnQuoteChangeclick(self);

end;

procedure TPBMaintCustFrm.tbQuotesShow(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
begin
  if not FActivatedQuotes then
    begin
      {Get the button statuses} ;
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuQuotes') ;

//      dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,'mnuQuotes') ;

      IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
      try
        stempdate := IniFile.ReadString('Centrereed Broker', 'Quote Search Date', 'None');
      finally
        IniFile.Free;
      end;

      if stempdate = 'None' then
        dtmdlCustQuotes.QuoteDate := Date - 365
      else
        dtmdlCustQuotes.QuoteDate := pbdatestr(stempdate);

      dtmdlCustQuotes.Customer := iCustomer;

(*      {Check if the operator REP is needed} ;
      If iMnuMaint = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;

      If iMnuMaint = 5 then
        dtmdlCustQuotes.Operator := frmpbMainMenu.iOperator;

      dtmdlCustQuotes.Rep := iOperatorRep;
      dtmdlCustQuotes.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

*)
      iOperatorRep := 0 ;
      SetQuoteButtonProperties(self);

      FactivatedQuotes := true;
    end;

  dtmdlCustQuotes.RefreshData;
  dbgQuoteDetails.DataSource.DataSet.Locate('Quote', Variant(inttostr(ActiveQuoteCode)),[lopartialKey]);
end;

procedure TPBMaintCustFrm.btnQuoteCopyClick(Sender: TObject);
begin
  if not CheckQuoteInput then
    exit;
  CallQuoteMaintScreen(qCopy);

end;

procedure TPBMaintCustFrm.tbQuotesExit(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Centrereed Broker', 'Quote Search Date', pbdatestr(dtmdlCustQuotes.QuoteDate));
  finally
    IniFile.Free;
  end;

  try
    ActiveQuotecode := dbgQuoteDetails.datasource.DataSet.FieldByName('Quote').asinteger;
  except
    ActiveQuoteCode := 0;
  end;

end;

procedure TPBMaintCustFrm.btnQuoteDeleteClick(Sender: TObject);
begin
  if (dbgQuoteDetails.Datasource.Dataset.fieldbyname('Quote_Status').asinteger > 40) then
    begin
      MessageDlg('This quote is ' +
        dbgQuoteDetails.Datasource.Dataset.fieldbyname('Quote_Status_Description').asstring +
        ' and therefore cannot be deleted', mtError, [mbAbort], 0);
        Exit;
    end;
  CallQuoteMaintScreen(qDelete);

end;

procedure TPBMaintCustFrm.btnQuoteReQuoteClick(Sender: TObject);
begin
  if not CheckQuoteInput then
    exit;
  CallQuoteMaintScreen(qReQuote);
end;

procedure TPBMaintCustFrm.tbBranchesShow(Sender: TObject);
begin
  dbgBranchDetails.DataSource := dtmdlOneCustomer.dtsCustomerBranches;
  dbgContactDetails.DataSource := dtmdlOneCustomer.dtsContacts;

  dtmdlOneCustomer.dtsCustomerBranches.OnDataChange := SetBranchButtons;
  dtmdlOneCustomer.dtsContacts.OnDataChange := SetContactButtons;

  dtmdlOneCustomer.Customer := iCustomer;
  dtmdlOneCustomer.RefreshBranches;
  dbgBranchDetails.DataSource.DataSet.Locate('Branch_no', Variant(inttostr(ActiveBranchCode)),[lopartialKey]);
  dbgContactDetails.DataSource.DataSet.Locate('Contact_no', Variant(inttostr(ActiveContactCode)),[lopartialKey]);
end;

procedure TPBMaintCustFrm.chkbxActiveBranchOnlyClick(Sender: TObject);
begin
  ActiveBranchCode := dbgBranchDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
  ActiveContactCode := dbgContactDetails.DataSource.DataSet.fieldbyname('Contact_no').asinteger;
  dtmdlOneCustomer.ShowInactiveBranches := not (Sender as TCheckbox).checked;
  dtmdlOneCustomer.RefreshBranches;
  dbgBranchDetails.DataSource.DataSet.Locate('Branch_no', Variant(inttostr(ActiveBranchCode)),[lopartialKey]);
  dbgContactDetails.DataSource.DataSet.Locate('Contact_no', Variant(inttostr(ActiveContactCode)),[lopartialKey]);
end;

procedure TPBMaintCustFrm.edtBranchNameChange(Sender: TObject);
begin
  dtmdlOneCustomer.BranchName := (Sender as TEdit).Text;
  tmrSearch.tag := 1;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TPBMaintCustFrm.dbgBranchDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (dbgBranchDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TPBMaintCustFrm.tbBranchesExit(Sender: TObject);
begin
  try
    ActiveBranchcode := dbgBranchDetails.datasource.DataSet.FieldByName('Branch_no').asinteger;
  except
    ActiveBranchCode := 0;
  end;

  try
    ActiveContactcode := dbgContactDetails.datasource.DataSet.FieldByName('Contact_no').asinteger;
  except
    ActiveContactCode := 0;
  end;
end;

procedure TPBMaintCustFrm.edtContactNameChange(Sender: TObject);
begin
  dtmdlOneCustomer.ContactName := (Sender as TEdit).Text;
  tmrSearch.tag := 1;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TPBMaintCustFrm.chkbxActiveContactOnlyClick(Sender: TObject);
begin
  ActiveBranchCode := dbgBranchDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
  ActiveContactCode := dbgContactDetails.DataSource.DataSet.fieldbyname('Contact_no').asinteger;
  dtmdlOneCustomer.ShowInactiveContacts := not (Sender as TCheckbox).checked;
  dtmdlOneCustomer.RefreshBranches;
  dbgBranchDetails.DataSource.DataSet.Locate('Branch_no', Variant(inttostr(ActiveBranchCode)),[lopartialKey]);
  dbgContactDetails.DataSource.DataSet.Locate('Contact_no', Variant(inttostr(ActiveContactCode)),[lopartialKey]);
end;

procedure TPBMaintCustFrm.btnBranchAddClick(Sender: TObject);
begin
  CallBranchMaintScreen('A')
end;

procedure TPBMaintCustFrm.btnBranchChangeClick(Sender: TObject);
begin
  CallBranchMaintScreen('C');
end;

procedure TPBMaintCustFrm.btnBranchDeleteClick(Sender: TObject);
begin
  CallBranchMaintScreen('C')
end;

procedure TPBMaintCustFrm.CallBranchMaintScreen(Mode: string);
var
  bTempOK: boolean;
  itemp: integer;
  CostCentreLevel: string;
begin
  PBMaintBranchFrm := TPBMaintBranchFrm.Create(Self);
  try
    PBMaintBranchFrm.sFuncMode := ShortString(Mode);
    PBMaintBranchfrm.sCustName := NameEdit.text;

    case rdgrpCostCentre.ItemIndex of
        1: CostCentreLevel := 'C';
        2: CostCentreLevel := 'B';
    else
        CostCentreLevel := '';
    end;

    PBMaintBranchfrm.CostCentreLevel := CostCentreLevel;

    PBMaintBranchfrm.iCust := dbgBranchDetails.DataSource.DataSet.fieldbyname('Customer').asinteger;
    PBMaintBranchfrm.icode := dbgBranchDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
    PBMaintBranchFrm.ShowModal;
    bTempOK := (PBMaintBranchFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := PBMaintBranchFrm.iCode;
        dtmdlOneCustomer.RefreshBranches;
        dbgBranchDetails.DataSource.DataSet.Locate('Branch_no', Variant(inttostr(iTemp)),[lopartialKey]) ;
      end;
  finally
    PBMaintBranchFrm.Free;
  end;
end;

procedure TPBMaintCustFrm.CallContactMaint(sTempFuncMode: string; tmpDBGrid: TDBGrid; tmpBranch: integer; tmpBranchName: string);
var
  bTempOK: ByteBool;
  iTemp: Integer;
begin
  if sTempFuncMode = 'D' then
    begin
      if CustomerContactOrdersExist(tmpBranch, tmpDBGrid.datasource.DataSet.FieldByName('Contact_No').AsInteger) then
        begin
          if MessageDlg('Cannot delete this contact, orders, jobs or enquiries exist in the system for this person. ' +
                    'Do you want to make them inactive?', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
          begin
            SetCustomerContactInactive(tmpBranch, tmpDBGrid.datasource.DataSet.FieldByName('Contact_No').AsInteger);
            dtmdlOneCustomer.refreshBranches;
          end;
          exit;
        end;
    end;

  PBMaintCContaFrm := TPBMaintCContaFrm.Create(Self);
  try
    PBMaintCContaFrm.sFuncMode := ShortString(sTempFuncMode);

    PBMaintCContaFrm.iCust := iCustomer;
    PBMaintCContaFrm.iBranch := tmpBranch;
    if sTempFuncMode <> 'A' then
      PBMaintCContaFrm.iCode :=
        tmpDBGrid.datasource.DataSet.FieldByName('Contact_No').AsInteger
    else
      PBMaintCContaFrm.iCode := 0;
    PBMaintCContaFrm.sCustName := nameEdit.text;
    PBMaintCContaFrm.sBranchName := tmpBranchName;
    PBMaintCContaFrm.ShowModal;
    bTempOK := (PBMaintCContaFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := PBMaintCContaFrm.iCode;

        if tmpBranch = 0 then
          dtmdlOneCustomer.RefreshHOContacts
        else
          dtmdlOneCustomer.RefreshBranches;
          
        tmpDBGrid.DataSource.DataSet.Locate('Contact_no', Variant(inttostr(iTemp)),[lopartialKey]) ;
      end;
  finally
    PBMaintCContaFrm.Free;
  end;
end;

function TPBMaintCustFrm.CustomerContactOrdersExist(tmpBranch, tmpContact: integer): boolean;
begin
  with dtmdlOneCustomer.qryGetCContactDetails do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_no').asinteger := tmpBranch;
      parambyname('Contact_no').asinteger := tmpContact;
      open;

      result := (recordcount > 0);
    end;
end;

procedure TPBMaintCustFrm.SetCustomerContactInactive(tmpBranch, tmpContact: integer);
begin
  with dtmdlOneCustomer.qrySetCContactInactive do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Branch_no').asinteger := tmpBranch;
      parambyname('Contact_no').asinteger := tmpContact;
      execsql;
    end;
end;

procedure TPBMaintCustFrm.btnContactAddClick(Sender: TObject);
begin
  CallContactMaint('A', dbgContactDetails, dbgBranchDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger, dbgBranchDetails.DataSource.DataSet.fieldbyname('Name').asstring);
end;

procedure TPBMaintCustFrm.btnContactChangeClick(Sender: TObject);
begin
  if dbgContactDetails.datasource.DataSet.FieldByName('Name').asstring <> '' then
    CallContactMaint('C', dbgContactDetails, dbgBranchDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger, dbgBranchDetails.DataSource.DataSet.fieldbyname('Name').asstring);
end;

procedure TPBMaintCustFrm.btnContactDeleteClick(Sender: TObject);
begin
  CallContactMaint('D', dbgContactDetails, dbgBranchDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger, dbgBranchDetails.DataSource.DataSet.fieldbyname('Name').asstring);
end;

procedure TPBMaintCustFrm.dbgContactDetailsDblClick(Sender: TObject);
begin
  btnContactChangeClick(Self);
end;

procedure TPBMaintCustFrm.dbgBranchDetailsDblClick(Sender: TObject);
begin
  btnBranchChangeclick(self);

end;

procedure TPBMaintCustFrm.dbgContactDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if ((Sender as TDBGrid).datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TPBMaintCustFrm.btnContactMoveClick(Sender: TObject);
var
  iTempCount, iTempContact, iTempBranch, iFirstCode: integer;
  bTempAskDets: boolean;
  iNewCust, iNewBranch: integer;
  sName: string;
begin
  bTempAskDets := false;

  for iTempCount := 0 to (dbgContactDetails.SelectedRows.Count - 1) do
    begin
      dbgContactDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgContactDetails.SelectedRows[iTempCount])) ;
      iTempContact := dbgContactDetails.datasource.DataSet.fieldbyname('Contact_no').asinteger;
      iTempBranch := dbgBranchDetails.datasource.DataSet.fieldbyname('Branch_no').asinteger;
      sName := dbgContactDetails.datasource.DataSet.fieldbyname('Name').asstring;
      if iTempCount = 0 then
        iFirstCode := iTempContact;

      if bTempAskDets = False then
        begin
          PBMaintContactMultiFrm := TPBMaintContactMultiFrm.create(self);
          try
            PBMaintContactMultiFrm.iCustomer := iCustomer;
            PBMaintContactMultiFrm.iBranchNo := iTempBranch;
            PBMaintContactMultiFrm.edtCustomerName.text := NameEdit.text;
            PBMaintContactMultiFrm.showmodal;
            if PBMaintContactMultiFrm.bOK = false then
              exit;

            iNewCust := PBMaintContactMultiFrm.iCustomer;
            iNewBranch := PBMaintContactMultiFrm.iBranchNo;

            bTempAskDets := True ;
          finally
            PBMaintContactMultiFrm.free;
          end;
        end;

      {Run the update for each Contact selected}
      with dtmdlOneCustomer.qrySetCContactInactive do
        begin
          close ;
          ParamByName('Customer').Asinteger := iCustomer ;
          ParamByName('Branch_no').Asinteger := iTempBranch ;
          ParamByName('Contact_no').Asinteger := iTempContact ;
          execSQL ;
        end;

      {Before adding make sure thsi contact hasn't been here before}
      with dtmdlOneCustomer.qryCheckName do
        begin
          close;
          ParamByName('Customer').Asinteger := iNewCust ;
          ParamByName('Branch_no').Asinteger := iNewBranch ;
          ParamByName('Name').Asstring := sName;
          open;
        end;

      {If operator focund then set them to active}
      if dtmdlOneCustomer.qryCheckName.recordcount > 0 then
        begin
          iTempContact := dtmdlOneCustomer.qryCheckName.fieldbyname('Contact_no').asinteger;

          with dtmdlOneCustomer.qrySetCContactActive do
            begin
              close ;
              ParamByName('Customer').Asinteger := iNewCust ;
              ParamByName('Branch_no').Asinteger := iNewBranch ;
              ParamByName('Contact_no').Asinteger := iTempContact ;
              execSQL ;
            end;
        end
      else
        begin
          with dtmdlOneCustomer.qryAddContact do
            begin
              close ;
              ParamByName('Customer').Asinteger := iNewCust ;
              ParamByName('Branch_no').Asinteger := iNewBranch ;
              ParamByName('OldCustomer').Asinteger := iCustomer ;
              ParamByName('OldBranch').Asinteger := iTempBranch ;
              ParamByName('OldContact').Asinteger := iTempContact ;
              execSQL ;
            end;
        end;
    end;

  {Refresh the data and find the first product}
  ActiveBranchCode := dbgBranchDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
  dtmdlOneCustomer.RefreshBranches;
  dbgBranchDetails.DataSource.DataSet.Locate('Branch_no', Variant(inttostr(ActiveBranchCode)),[lopartialKey]);

  with dbgContactDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TPBMaintCustFrm.btnContactOnlineClick(Sender: TObject);
begin
  PBMaintContactOnlineFrm := TPBMaintContactOnlineFrm.create(self);
  try
    PBMaintContactOnlineFrm.iCust := iCustomer;
    PBMaintContactOnlineFrm.iBranch := dbgBranchDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
    PBMaintContactOnlineFrm.iCode := dbgContactDetails.datasource.DataSet.FieldByName('Contact_No').AsInteger;
    PBMaintContactOnlineFrm.showmodal;
  finally
    PBMaintContactOnlineFrm.free;
  end;
end;

procedure TPBMaintCustFrm.Button2Click(Sender: TObject);
begin
  with dbgContactDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgContactDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;

end;

procedure TPBMaintCustFrm.SetActivityButtons(Sender: TObject;
  Field: TField);
begin
  with dtmdlCustActivity do
  begin
    btnActivityChange.enabled := HeaderCount > 0;
    btnActivityDelete.enabled := HeaderCount > 0;
  end;

  PBActivityMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBActivityMemoFrm.bAllow_Upd := False;
    PBActivityMemoFrm.LoadMemoData(dbgActivityDetails.datasource.DataSet.FieldByName('Narrative').AsInteger);
    memNarrative.Text := PBActivityMemoFrm.DispMemo.Text ;
  finally
    PBActivityMemoFrm.Free;
  end;
end;

procedure TPBMaintCustFrm.SetHOContactButtons(Sender: TObject;
  Field: TField);
begin
  with dtmdlOneCustomer do
  begin
    btnHOContactChange.enabled := HOContactCount > 0;
    btnHOContactDelete.enabled := HOContactCount > 0;
    btnHOContactOnline.enabled := HOContactCount > 0;
    btnHOContactEmail.enabled := HOContactCount > 0;

    dblstContactCategories.DataSource := dtsContactCats;
    dblstContactCategories.items.clear;
    with qryGetContactCats do
      begin
        close;
        parambyname('Customer').asinteger := iCustomer;
        parambyname('Branch_no').asinteger := 0;
        parambyname('Contact_no').asinteger := dbgHOContactDetails.Datasource.dataset.fieldbyname('Contact_no').asinteger;
        open;

        first;
        while eof <> true do
          begin
            dblstContactCategories.Items.Add(FieldByName('Description').AsString);
            Next;
          end;
        first;
      end;
  end;
end;

procedure TPBMaintCustFrm.btnActivityAddClick(Sender: TObject);
begin
  CallActivityMaintScreen(actAdd);
end;

procedure TPBMaintCustFrm.btnActivityChangeClick(Sender: TObject);
begin
  CallActivityMaintScreen(actChange);

end;

procedure TPBMaintCustFrm.btnActivityDeleteClick(Sender: TObject);
begin
  CallActivityMaintScreen(actDelete);

end;

procedure TPBMaintCustFrm.CallActivityMaintScreen(aMode : TactMode);
var
  bTempOK: ByteBool;
  Key : integer;
  frm: TPBMaintActivityFrm;
  aActivity : TActivity;
begin
  if aMode = actAdd then
    Key := 0
  else
    Key := dbgActivityDetails.datasource.dataset.fieldbyname('Activity').asinteger;

  aActivity := TActivity.Create(dtmdlCustActivity);
  try
    aActivity.DbKey := key;
    aActivity.LoadFromDB;
    Frm := TPBMaintActivityFrm.Create(Self);
    try
     if aMode = actAdd then
      begin
        aActivity.CustomerName := NameEdit.text;
        aActivity.Customer := iCustomer;
        if self.Prospect then
          Frm.Entity := 'PROSPECT'
        else
          Frm.Entity := 'CUST';
      end;

     Frm.Mode := aMode;
     Frm.Activity := aActivity;
     Frm.ShowModal;
     Key := aActivity.DbKey;
     bTempOK := (Frm.ModalResult = mrOK);
    finally
      Frm.Free;
    end;
  finally
    aActivity.Free;
  end;

  if bTempOK then
    begin
      dtmdlCustActivity.RefreshData;

      if aMode <> actDelete then
        dbgActivityDetails.datasource.DataSet.Locate('Activity', Variant(inttostr(Key)),[lopartialKey]);
    end;
end;

procedure TPBMaintCustFrm.tbActivityShow(Sender: TObject);
begin
  if sFuncMode = 'A' then exit;
  dtmdlCustActivity.Customer := iCustomer;
  dtmdlCustActivity.RefreshData;
  dbgActivityDetails.DataSource.DataSet.Locate('Activity', Variant(inttostr(ActiveActivityCode)),[lopartialKey]);
end;

procedure TPBMaintCustFrm.tbActivityExit(Sender: TObject);
begin
  try
    ActiveActivitycode := dbgActivityDetails.datasource.DataSet.FieldByName('Activity').asinteger;
  except
    ActiveActivitycode := 0;
  end;

end;

procedure TPBMaintCustFrm.dbgActivityDetailsDblClick(Sender: TObject);
begin
  btnActivityChangeClick(self);
end;

procedure TPBMaintCustFrm.dbgActivityDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgActivityDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlCustActivity.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgActivityDetails.columns.count) do
    dbgActivityDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlCustActivity.SortOrder := SortField + SortType;
  dtmdlCustActivity.SortType := SortType;

  dtmdlCustActivity.refreshdata;

  with dbgActivityDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TPBMaintCustFrm.dbgActivityDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (dbgActivityDetails.datasource.dataset.fieldByName('Activity_Priority').AsInteger = 3) then
    begin
      (Sender as TDBGrid).Canvas.font.color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.color := clRed;
    end
  else
  if (dbgActivityDetails.datasource.dataset.fieldByName('Activity_Priority').AsInteger = 1) then
    begin
      (Sender as TDBGrid).Canvas.font.color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.color := clGreen;
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);

end;

procedure TPBMaintCustFrm.dbgQuoteDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);

end;

procedure TPBMaintCustFrm.BitBtn11Click(Sender: TObject);
begin
  frmpbLuQuotesSearch := TfrmpbLuQuotesSearch.create(self);
  try
    frmpbLuQuotesSearch.dtmdlSearchQuotes := dtmdlCustQuotes;
    frmpbLuQuotesSearch.edtBranch.text := dtmdlCustQuotes.BranchName;
    frmpbLuQuotesSearch.edtCustOrderNo.Text := dtmdlCustQuotes.CustomerRef;
    frmpbLuQuotesSearch.edtStatus.Text := dtmdlCustQuotes.Status;
    frmpbLuQuotesSearch.edtQuantity.Text := dtmdlCustQuotes.Quantity;
    frmpbLuQuotesSearch.edtDescription.Text := dtmdlCustQuotes.Description;
    frmpbLuQuotesSearch.edtRep.Text := dtmdlCustQuotes.RepName;
    frmpbLuQuotesSearch.edtOperator.Text := dtmdlCustQuotes.OperatorName;
    frmpbLuQuotesSearch.chkbxShowInactive.checked := (dtmdlCustQuotes.ShowInactive = 'Y');
    frmpbLuQuotesSearch.chkbxShowLive.checked := dtmdlCustQuotes.ShowLive;

    frmpbLuQuotesSearch.edtDate.Text := pbDateStr(dtmdlCustQuotes.QuoteDate);
    frmpbLuQuotesSearch.showModal;
  finally
    frmpbLuQuotesSearch.free;
  end;

end;

procedure TPBMaintCustFrm.btnSearchClick(Sender: TObject);
begin
  frmpbLuEnqsSearch := TfrmpbLuEnqsSearch.create(self);
  try
    frmpbLuEnqsSearch.dtmdlSearchEnqs := dtmdlCustEnqs;
    frmpbLuEnqsSearch.edtBranch.text := dtmdlCustEnqs.BranchName;
    frmpbLuEnqsSearch.edtProductCode.Text := dtmdlCustEnqs.ProductCode;
    frmpbLuEnqsSearch.edtFormReference.Text := dtmdlCustEnqs.FormReference;
    frmpbLuEnqsSearch.edtRep.Text := dtmdlCustEnqs.RepName;
    frmpbLuEnqsSearch.edtProductType.Text := dtmdlCustEnqs.ProductType;
    frmpbLuEnqsSearch.edtDate.Text := pbDateStr(dtmdlCustEnqs.EnquiryDate);
    frmpbLuEnqsSearch.chkbxShowCancelled.Checked := dtmdlCustEnqs.ShowInactive;
    frmpbLuEnqsSearch.showModal;
  finally
    frmpbLuEnqsSearch.free;
  end;

end;

procedure TPBMaintCustFrm.BitBtn9Click(Sender: TObject);
begin
  frmpbLuOrdersSearch := TfrmpbLuOrdersSearch.create(self);
  try
    frmpbLuOrdersSearch.dtmdlSearchOrders := dtmdlCustOrders;
    frmpbLuOrdersSearch.edtBranch.text := dtmdlCustOrders.BranchName;
    frmpbLuOrdersSearch.edtProductCode.Text := dtmdlCustOrders.ProductCode;
    frmpbLuOrdersSearch.edtFormReference.Text := dtmdlCustOrders.FormReference;
    frmpbLuOrdersSearch.edtCustOrderNo.Text := dtmdlCustOrders.CustomerRef;
    frmpbLuOrdersSearch.edtQuantity.Text := dtmdlCustOrders.OrdQtyDesc;
    frmpbLuOrdersSearch.edtDescription.Text := dtmdlCustOrders.Description;
    frmpbLuOrdersSearch.edtDescriptiveRef.Text := dtmdlCustOrders.DescriptiveRef;
    frmpbLuOrdersSearch.edtJobNumber.Text := dtmdlCustOrders.JobNumber;
    frmpbLuOrdersSearch.edtSupplier.text := dtmdlCustOrders.SupplierName;
    frmpbLuOrdersSearch.edtDate.Text := pbDateStr(dtmdlCustOrders.OrderDate);
    frmpbLuOrdersSearch.showModal;
  finally
    frmpbLuOrdersSearch.free;
  end;

end;

procedure TPBMaintCustFrm.BitBtn10Click(Sender: TObject);
begin
  frmpbLuJobsSearch := TfrmpbLuJobsSearch.create(self);
  try
    frmpbLuJobsSearch.dtmdlSearchJobs := dtmdlCustJobs;
    frmpbLuJobsSearch.edtBranch.text := dtmdlCustJobs.BranchName;
    frmpbLuJobsSearch.edtCustOrderNo.Text := dtmdlCustJobs.CustomerRef;
    frmpbLuJobsSearch.edtStatus.Text := dtmdlCustJobs.Status;
    frmpbLuJobsSearch.edtQuantity.Text := dtmdlCustJobs.OrdQtyDesc;
    frmpbLuJobsSearch.edtQuote.Text := dtmdlCustJobs.Quote;
    frmpbLuJobsSearch.edtDescription.text := dtmdlCustJobs.Description;
    frmpbLuJobsSearch.edtDescriptiveRef.Text := dtmdlCustJobs.DescriptiveRef;
    frmpbLuJobsSearch.edtRep.Text := dtmdlCustJobs.RepName;
    frmpbLuJobsSearch.edtAccountMgr.Text := dtmdlCustJobs.AccountMgr;
    frmpbLuJobsSearch.edtOperator.Text := dtmdlCustJobs.OperatorName;
    frmpbLuJobsSearch.edtDate.Text := pbDateStr(dtmdlCustJobs.JobDate);
    frmpbLuJobsSearch.edtDateReq.Text := pbDateStr(dtmdlCustJobs.DateRequired);
    frmpbLuJobsSearch.showModal;
  finally
    frmpbLuJobsSearch.free;
  end;

end;

procedure TPBMaintCustFrm.tbCrossSellingShow(Sender: TObject);
begin
  dbgCategoryDetails.DataSource := dtmdlOneCustomer.dtsCustomerCategories;
  dtmdlOneCustomer.dtsCustomerCategories.OnDataChange := SetCategoryButtons;
  dtmdlOneCustomer.Customer := iCustomer;
  dtmdlOneCustomer.RefreshCategoryData;
  dbgCategoryDetails.DataSource.DataSet.Locate('Category', Variant(inttostr(ActiveCategoryCode)),[lopartialKey]);
end;

procedure TPBMaintCustFrm.dbgCategoryDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (dbgCategoryDetails.datasource.dataset.fieldByName('Category_Used').Asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clYellow;
    end
  else
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;


  if (dbgCategoryDetails.datasource.dataset.fieldByName('We_Supply_This_Category').Asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.color := clGreen;
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TPBMaintCustFrm.Button1Click(Sender: TObject);
var
  iCount: integer;
begin
  if MessageDlg('Confirm the customer uses the selected categories?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      ActiveCategoryCode := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;

      for iCount := 0 to (dbgCategoryDetails.SelectedRows.Count - 1) do
        begin
          dbgCategoryDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgCategoryDetails.SelectedRows[iCount])) ;

          if dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category_Used').asstring = '' then
            begin
              with dtmdlOneCustomer.qryAddCustomerCat do
                begin
                  close;
                  parambyname('Customer').asinteger := iCustomer;
                  parambyname('Category').asinteger := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
                  parambyname('Category_Used').asstring := 'Y';
                  parambyname('Narrative').clear;
                  execsql;
                end;
            end
          else
            begin
              with dtmdlOneCustomer.qryUpCustomerCatUsed do
                begin
                  close;
                  parambyname('Customer').asinteger := iCustomer;
                  parambyname('Category').asinteger := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
                  parambyname('Category_Used').asstring := 'Y';
                  execsql;
                end;
            end;
        end;
      dtmdlOneCustomer.RefreshCategoryData;
      dbgCategoryDetails.DataSource.DataSet.Locate('Category', Variant(inttostr(ActiveCategoryCode)),[lopartialKey]);
    end;
end;

procedure TPBMaintCustFrm.Button3Click(Sender: TObject);
var
  iCount: integer;
begin
  if MessageDlg('Confirm the customr doesn''t use the selected categories?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      ActiveCategoryCode := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
      for iCount := 0 to (dbgCategoryDetails.SelectedRows.Count - 1) do
        begin
          dbgCategoryDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgCategoryDetails.SelectedRows[iCount])) ;

          if dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category_Used').asstring = '' then
            begin
              with dtmdlOneCustomer.qryAddCustomerCat do
                begin
                  close;
                  parambyname('Customer').asinteger := iCustomer;
                  parambyname('Category').asinteger := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
                  parambyname('Category_Used').asstring := 'N';
                  parambyname('Narrative').clear;
                  execsql;
                end;
            end
          else
            begin
              with dtmdlOneCustomer.qryUpCustomerCatUsed do
                begin
                  close;
                  parambyname('Customer').asinteger := iCustomer;
                  parambyname('Category').asinteger := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
                  parambyname('Category_Used').asstring := 'N';
                  execsql;
                end;
            end;
        end;
        
      dtmdlOneCustomer.RefreshCategoryData;
      dbgCategoryDetails.DataSource.DataSet.Locate('Category', Variant(inttostr(ActiveCategoryCode)),[lopartialKey]);
    end;
end;

procedure TPBMaintCustFrm.Button5Click(Sender: TObject);
var
  iCount: integer;
begin
  if MessageDlg('Confirm we supply the selected categories?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      ActiveCategoryCode := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;

      for iCount := 0 to (dbgCategoryDetails.SelectedRows.Count - 1) do
        begin
          dbgCategoryDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgCategoryDetails.SelectedRows[iCount])) ;

          if (dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category_Used').asstring = '') then
            begin
              {Add the category}
              with dtmdlOneCustomer.qryAddCustomerCat do
                begin
                  close;
                  parambyname('Customer').asinteger := iCustomer;
                  parambyname('Category').asinteger := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
                  parambyname('Category_Used').asstring := 'N';
                  parambyname('Narrative').clear;
                  execsql;
                end;
            end;

          {Update the category}
          with dtmdlOneCustomer.qryUpCustomerCatSupply do
            begin
              close;
              parambyname('Customer').asinteger := iCustomer;
              parambyname('Category').asinteger := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
              parambyname('We_Supply_This_Category').asstring := 'Y';
              execsql;
            end;
        end;
        
      dtmdlOneCustomer.RefreshCategoryData;
      dbgCategoryDetails.DataSource.DataSet.Locate('Category', Variant(inttostr(ActiveCategoryCode)),[lopartialKey]);
    end;
end;

procedure TPBMaintCustFrm.Button6Click(Sender: TObject);
var
  iCount: integer;
begin
  if MessageDlg('Confirm we don''t supply the selected categories?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      ActiveCategoryCode := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
      for iCount := 0 to (dbgCategoryDetails.SelectedRows.Count - 1) do
        begin
          dbgCategoryDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgCategoryDetails.SelectedRows[iCount])) ;

          if (dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category_Used').asstring = '') then
            begin
              {Add the category}
              with dtmdlOneCustomer.qryAddCustomerCat do
                begin
                  close;
                  parambyname('Customer').asinteger := iCustomer;
                  parambyname('Category').asinteger := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
                  parambyname('Category_Used').asstring := 'N';
                  parambyname('Narrative').clear;
                  execsql;
                end;
            end;

          {Update the category}
          with dtmdlOneCustomer.qryUpCustomerCatSupply do
            begin
              close;
              parambyname('Customer').asinteger := iCustomer;
              parambyname('Category').asinteger := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
              parambyname('We_Supply_This_Category').asstring := 'N';
              execsql;
            end;
        end;

      dtmdlOneCustomer.RefreshCategoryData;
      dbgCategoryDetails.DataSource.DataSet.Locate('Category', Variant(inttostr(ActiveCategoryCode)),[lopartialKey]);
    end;
end;

procedure TPBMaintCustFrm.Button8Click(Sender: TObject);
begin
  with dbgCategoryDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgCategoryDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;

end;

procedure TPBMaintCustFrm.btnCategoryNotesClick(Sender: TObject);
begin
  if dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger = 0 then
    exit
  else
    begin
      ActiveCategoryCode := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;

      if dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category_Used').asstring = '' then
        begin
          with dtmdlOneCustomer.qryAddCustomerCat do
            begin
              close;
              parambyname('Customer').asinteger := iCustomer;
              parambyname('Category').asinteger := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
              parambyname('Category_Used').asstring := 'N';
              parambyname('Narrative').clear;
              execsql;
            end;
        end;

      PBCategoryMemoFrm := TPBDBMemoFrm.Create(Self);
      try
        PBCategoryMemoFrm.LoadMemoData(dbgCategoryDetails.DataSource.DataSet.fieldbyname('Narrative').asinteger);
        PBCategoryMemoFrm.bAllow_Upd := true;
        PBCategoryMemoFrm.ShowModal;
        PBCategoryMemoFrm.UpdMemoData(Self) ;
        with dtmdlOneCustomer.qryUpCustomerCatNotes do
          begin
            close;
            parambyname('Customer').asinteger := iCustomer;
            parambyname('Category').asinteger := dbgCategoryDetails.DataSource.DataSet.fieldbyname('Category').asinteger;
            if PBCategoryMemoFrm.iNarr = 0 then
              ParamByName('Narrative').Clear
            else
              ParamByName('Narrative').AsInteger := PBCategoryMemoFrm.iNarr;
            ExecSQL;
          end;
      finally
        PBCategoryMemoFrm.Free;
      end;

      dtmdlOneCustomer.RefreshCategoryData;
      dbgCategoryDetails.DataSource.DataSet.Locate('Category', Variant(inttostr(ActiveCategoryCode)),[lopartialKey]);
    end;
end;

procedure TPBMaintCustFrm.SetCategoryButtons(Sender: TObject;
  Field: TField);
begin
  PBCategoryMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBCategoryMemoFrm.bAllow_Upd := False;
    PBCategoryMemoFrm.LoadMemoData(dbgCategoryDetails.datasource.DataSet.FieldByName('Narrative').AsInteger);
    memCategoryNarrative.Text := PBCategoryMemoFrm.DispMemo.Text ;
  finally
    PBCategoryMemoFrm.Free;
  end;

end;

procedure TPBMaintCustFrm.dbgCategoryDetailsDblClick(Sender: TObject);
begin
  btnCategoryNotesClick(self);
end;

procedure TPBMaintCustFrm.BitBtn8Click(Sender: TObject);
begin
  PBLUSICCodefrm := TPBLUSICCodefrm.Create(self) ;
  try
    PBLUSICCodefrm.bIs_Lookup := true ;
    PBLUSICCodefrm.bAllow_Upd := True ;
    PBLUSICCodefrm.iSelCode := SICCode ;
    PBLUSICCodefrm.ShowModal ;
    if PBLUSICCodefrm.selected then
      begin
        edtSICCode.text := PBLUSICCodefrm.selName;
        SICCode := PBLUSICCodefrm.iSelCode;
      end;
  finally
    PBLUSICCodefrm.Free ;
  end;
end;

procedure TPBMaintCustFrm.btnHOContactAddClick(Sender: TObject);
begin
  CallContactMaint('A', dbgHOContactDetails, 0, 'Head Office');
end;

procedure TPBMaintCustFrm.btnHOContactChangeClick(Sender: TObject);
begin
  CallContactMaint('C', dbgHOContactDetails, 0, 'Head Office');
end;

procedure TPBMaintCustFrm.btnHOContactDeleteClick(Sender: TObject);
begin
  CallContactMaint('D', dbgHOContactDetails, 0, 'Head Office');
end;

procedure TPBMaintCustFrm.dbgHOContactDetailsDblClick(Sender: TObject);
begin
  btnHOContactChangeClick(self);
end;

procedure TPBMaintCustFrm.SetsFuncMode(const Value: ShortString);
begin
  FsFuncMode := Value;
  pnlHOContacts.visible := (FsFuncMode = 'C') or (FsFuncMode = 'D');
end;

procedure TPBMaintCustFrm.btnEnqDeclineClick(Sender: TObject);
var
  iTempSel: integer;
begin
  iTempSel := dbgEnquiryDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;

  PBEnqCancelLineFrm := TPBEnqCancelLineFrm.create(self);
  try
    PBEnqCancelLineFrm.EnquiryNo := dbgEnquiryDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
    PBEnqCancelLineFrm.EnquiryLine := dbgEnquiryDetails.datasource.DataSet.FieldByName('Line').asinteger;
    PBEnqCancelLineFrm.lblCustomer.caption := 'Customer: ' + dbgEnquiryDetails.datasource.DataSet.FieldByName('Customer_Name').asstring;
    PBEnqCancelLineFrm.lblDescription.caption := 'Description: ' + dbgEnquiryDetails.datasource.DataSet.FieldByName('Description').asstring;

    PBEnqCancelLineFrm.bInactive := (dbgEnquiryDetails.datasource.DataSet.FieldByName('Description').asstring = 'Y');
    PBEnqCancelLineFrm.showmodal;
    if PBEnqCancelLineFrm.modalresult = idok then
      begin
        dtmdlCustEnqs.refreshdata;
        dbgEnquiryDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
      end;
  finally
    PBEnqCancelLineFrm.free;
  end;
end;

procedure TPBMaintCustFrm.lstvwDocumentsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> SortedColumn then
    begin
      SortedColumn := Column.Index;
      Descending := False;
    end
  else
    Descending := not Descending;

  TListView(Sender).SortType := stText;

end;

procedure TPBMaintCustFrm.lstvwDocumentsCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else
  if SortedColumn <> 0 then
    Compare := CompareText(Item1.SubItems[SortedColumn-1], Item2.SubItems[SortedColumn-1]);

  if Descending then
    Compare := -Compare;
end;

procedure TPBMaintCustFrm.chkbxGDPRSignedClick(Sender: TObject);
begin
  edtDateGDPRSigned.Enabled := (Sender as TCheckBox).checked;
  btnDateGDPRSigned.enabled := edtDateGDPRSigned.Enabled;
  if Activated and (sender as TCheckbox).checked then
    btnDateGDPRSignedClick(self);
end;

procedure TPBMaintCustFrm.btnDateGDPRSignedClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateGDPRSigned.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDateGDPRSigned.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintCustFrm.edtdateGDPRSignedExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if (Sender as Tedit).Text = '' then
    begin
      Exit;
    end;

  try
    NewDate := StrToDate((Sender as Tedit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as Tedit).SetFocus;
      Exit;
    end;
  end;

  (Sender as Tedit).Text := PBDatestr(NewDate);
end;

procedure TPBMaintCustFrm.memQuoteCostMarkupExit(Sender: TObject);
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

procedure TPBMaintCustFrm.chkbxOverrideCostChargesClick(Sender: TObject);
begin
  memQuoteCostMarkup.Enabled := (Sender as TCheckbox).Checked;
  if (Sender as TCheckbox).Checked then
    memQuoteCostMarkup.text := '0.00';
end;

procedure TPBMaintCustFrm.SetEndUser(const Value: boolean);
begin
  FEndUser := Value;
  if FEndUser then
    begin
      sStatusDescr := 'End User ';

      tbOptions.TabVisible := false;
      tbBranches.TabVisible := true;

      tbQuotes.TabVisible := false;
      tbEnquiries.TabVisible := false;
      tbOrders.TabVisible := false;
      tbJobs.TabVisible := false;
      tbStock.TabVisible := false;
      tbInvoices.TabVisible := false;
      tbFinancials.TabVisible := false;
      tbDocuments.TabVisible := true;
      tbActivity.TabVisible := false;
      tbCrossSelling.TabVisible := false;

      pnlInvoiceDetails.enabled := false;
      pnlCreditDetails.enabled := false;

      DisableCreditDetails;

      lblStatus.Visible := true;
      dblkpCustStatus.Visible := true;

      NotesBitBtn.visible := false;
      DelivNotesBitBtn.Visible := false;

      chkbxConverttoCustomer.Visible := true;

      ActiveChkbox.caption := sStatusDescr + ' is active'
    end
  else
    begin
      sStatusDescr := 'Customer ';

      tbOptions.TabVisible := true;
      tbBranches.TabVisible := true;
      tbQuotes.TabVisible := true;
      tbEnquiries.TabVisible := frmPBMainMenu.btnEnquiries.enabled;
      tbOrders.TabVisible := true;
      tbJobs.TabVisible := true;
      tbStock.TabVisible := true;
      tbInvoices.TabVisible := true;
      tbDocuments.TabVisible := true;
      tbActivity.TabVisible := frmPBMainMenu.UseCRMSystem;
      tbCrossSelling.TabVisible := true;

      {Format the screen}
      pnlInvoiceDetails.Enabled := true;
      pnlCreditDetails.enabled := true;

      EnableInvoicingDetails;
      EnableCreditDetails;

      lblStatus.Visible := true;
      dblkpCustStatus.Visible := true;

      NotesBitBtn.visible := true;
      DelivNotesBitBtn.Visible := true;

      chkbxConverttoCustomer.Visible := false;

      if dmBroker.UseCreditChecking then
        begin
          pnlCreditDetails.Enabled := dmBroker.CanChangeCreditDetails(frmPBMainMenu.iOperator);
          pnlInvoiceDetails.Enabled := dmBroker.CanChangeCreditDetails(frmPBMainMenu.iOperator);
        end;

      if not pnlCreditDetails.enabled then
        DisableCreditDetails
      else
        EnableCreditDetails;

      ActiveChkbox.caption := sStatusDescr + ' is active'
    end;
end;

end.

