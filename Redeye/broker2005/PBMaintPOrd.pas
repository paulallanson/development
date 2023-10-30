unit PBMaintPOrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, Grids,
  PBPOObjects, ComCtrls, Spin, ImgList, ToolWin, Menus, contnrs, ShellAPI,
  IniFiles, PBDocObjects, OleCtnrs, PBJobBagDM, DBGrids, DateUtils, PBActivityDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPOrdFrm = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    POrdNoMemo: TMemo;
    Label5: TLabel;
    DateEdit: TEdit;
    SelDateBtn: TSpeedButton;
    lblAccountManager: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    SupplierEdit: TEdit;
    ContactEdit: TEdit;
    SelContactBtn: TButton;
    SelSupBtn: TButton;
    Label9: TLabel;
    CurrDBLUCB: TDBLookupComboBox;
    CurrClearBitBtn: TBitBtn;
    stsbrDetails: TStatusBar;
    Panel4: TPanel;
    OrderLinePage: TPageControl;
    tsGeneral: TTabSheet;
    Label32: TLabel;
    Label37: TLabel;
    Label25: TLabel;
    Label30: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label18: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label50: TLabel;
    Label34: TLabel;
    FormRefClrBitBtn: TBitBtn;
    FormRefButton: TButton;
    FormDescEdit: TEdit;
    FormRefEdit: TEdit;
    CustRefEdit: TEdit;
    CustNameEdit: TEdit;
    CustLUBtn: TButton;
    ContactCombo: TComboBox;
    ContactLUBtn: TButton;
    RepLUButton: TButton;
    RepEdit: TEdit;
    CustDescEdit: TMemo;
    OnHoldChkBox: TCheckBox;
    ProdTypeEdit: TEdit;
    ProdTypeBtn: TButton;
    DepthEdit: TEdit;
    WidthEdit: TEdit;
    Unit1: TEdit;
    Unit2: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    ExpectedLifeSpinEdit: TSpinEdit;
    tsParts: TTabSheet;
    tsQuestions: TTabSheet;
    tsSupplierDetails: TTabSheet;
    tsDelivery: TTabSheet;
    Label8: TLabel;
    defaultSizeBtn: TButton;
    Label51: TLabel;
    Label53: TLabel;
    FormsPerBoxEdit: TEdit;
    SetsEdit: TEdit;
    Label52: TLabel;
    NumberingEdit: TEdit;
    Panel3: TPanel;
    ViewBitBtn: TBitBtn;
    LineDelBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    pumPartDetails: TPopupMenu;
    Add1: TMenuItem;
    Delete1: TMenuItem;
    MarginDefaults1: TMenuItem;
    N1: TMenuItem;
    Label41: TLabel;
    ArtEdit: TMemo;
    Panel6: TPanel;
    sgPartDetails: TStringGrid;
    ColourComboBox: TComboBox;
    WeightComboBox: TComboBox;
    BrandComboBox: TComboBox;
    MaterialComboBox: TComboBox;
    Panel7: TPanel;
    AddNotesMemo: TMemo;
    SameAsLbl: TLabel;
    pumAddNotes: TPopupMenu;
    Add2: TMenuItem;
    Change2: TMenuItem;
    Delete2: TMenuItem;
    PlateChangeLbl: TLabel;
    PlateChangeSpin: TSpinEdit;
    MaintainPapers1: TMenuItem;
    N2: TMenuItem;
    Panel5: TPanel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    OrderQtyMemo: TMemo;
    OrdPriceMemo: TMemo;
    SellPriceMemo: TMemo;
    Label60: TLabel;
    DeliverQtyMemo: TMemo;
    OrderUnitDBLCB: TDBLookupComboBox;
    Label45: TLabel;
    Label46: TLabel;
    SellUnitDBLCB: TDBLookupComboBox;
    Label26: TLabel;
    TotOrderMemo: TMemo;
    Label27: TLabel;
    TotSellMemo: TMemo;
    popCallOff: TPopupMenu;
    Add3: TMenuItem;
    Change1: TMenuItem;
    N3: TMenuItem;
    popCallOffDelbtn: TMenuItem;
    ArtworkBtn: TButton;
    ProfitLabel: TLabel;
    ProfPercLabel: TLabel;
    ProfMemo: TMemo;
    PercProfMemo: TMemo;
    Label28: TLabel;
    Label29: TLabel;
    OrdChrgMemo: TMemo;
    SlsChrgMemo: TMemo;
    tsCalloffs: TTabSheet;
    Label58: TLabel;
    DelivDetsStringGrid: TStringGrid;
    DelivAddBitBtn: TBitBtn;
    DelivChgBitBtn: TBitBtn;
    DelivDelBitBtn: TBitBtn;
    QtyMemo: TMemo;
    Label6: TLabel;
    OrdQtyLbl: TLabel;
    OrdQtyMemo: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label11: TLabel;
    DelInstructPanel: TPanel;
    Label24: TLabel;
    DelInstructMemo: TMemo;
    AddrTypeRadGrp: TRadioGroup;
    AddrGrpBox: TGroupBox;
    AddrTypeLabel: TLabel;
    BranchNameLabel: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    NameEdit: TEdit;
    BranchNameEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PostCodeEdit: TEdit;
    QtysGrpBox: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    QtyToDeliverMemo: TMemo;
    QtyDeliveredMemo: TMemo;
    QtyInvoicedMemo: TMemo;
    NoOfBoxesMemo: TMemo;
    DatePointEdit: TEdit;
    DeliveryDateEdit: TEdit;
    DeliverViachk: TCheckBox;
    DelivsSelectBitBtn: TBitBtn;
    Label56: TLabel;
    Label38: TLabel;
    SuppDescEdit: TMemo;
    SuppRefEdit: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    SuppJobRefEdit: TEdit;
    Label57: TLabel;
    ExtChgDetsStringGrid: TStringGrid;
    ExtChgFuncGrpBox: TGroupBox;
    ExtChgAddBitBtn: TBitBtn;
    ExtChgChgBitBtn: TBitBtn;
    ExtChgDelBitBtn: TBitBtn;
    btnLUAddChrg: TButton;
    ValueMemo: TMemo;
    AddDetailsMemo: TMemo;
    AddDetailsList: TListBox;
    Label12: TLabel;
    gbAddDets: TGroupBox;
    btnAddSuppCustNotes: TBitBtn;
    btnChgSuppCustNotes: TBitBtn;
    btnDelSuppCustNotes: TBitBtn;
    ExtChgSelectBitBtn: TBitBtn;
    Panel10: TPanel;
    sbQuestions: TScrollBox;
    Panel9: TPanel;
    ProductQLbl: TLabel;
    sgCallOff: TStringGrid;
    CallOffAddBtn: TBitBtn;
    CallOffChgBtn: TBitBtn;
    CallOffDelBtn: TBitBtn;
    NoCallOffEdit: TEdit;
    StockQtyMemo: TMemo;
    Label4: TLabel;
    Label13: TLabel;
    SchedQtyMemo: TMemo;
    DelivQtyMemo: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    InStockQtyMemo: TMemo;
    Label31: TLabel;
    StockRefEdit: TEdit;
    Label49: TLabel;
    InvoiceQtyMemo: TMemo;
    tsIntNotes: TTabSheet;
    Label33: TLabel;
    ReqByDateEdit: TEdit;
    ReqByDateLUBtn: TSpeedButton;
    Label55: TLabel;
    CustReqDateEdit: TEdit;
    CustReqDateBtn: TSpeedButton;
    GroupBox1: TGroupBox;
    ProofByLabel: TLabel;
    ProofStatLabel: TLabel;
    ProofsReqChkBox: TCheckBox;
    ProofsDateEdit: TEdit;
    ProofDateBtn: TBitBtn;
    ProofsBitBtn: TBitBtn;
    ProofStatDBLUCB: TDBLookupComboBox;
    Label59: TLabel;
    CustReqDelDateEdit: TEdit;
    chkInvoiceUpfront: TCheckBox;
    Label61: TLabel;
    edtLifeExp: TEdit;
    ExpLifeDateBtn: TSpeedButton;
    Label62: TLabel;
    dblkpVatRate: TDBLookupComboBox;
    pnlDocs: TPanel;
    lblDocs: TLabel;
    strgrdDocs: TStringGrid;
    btbtnAddDoc: TBitBtn;
    btbtnChangeDoc: TBitBtn;
    btbtnDeleteDoc: TBitBtn;
    btbtnOpen: TBitBtn;
    Panel8: TPanel;
    Label63: TLabel;
    sgIntNotes: TStringGrid;
    btbtnAddIntNote: TBitBtn;
    btbtnChangeIntNote: TBitBtn;
    btbtnDeleteIntNote: TBitBtn;
    btbtnAppntmnt: TBitBtn;
    mmIntNote: TMemo;
    lblNote: TLabel;
    lblFAO: TLabel;
    edtFAO: TEdit;
    btbtnWordDoc: TBitBtn;
    btbtnExcelSheet: TBitBtn;
    svDlgOfficeDoc: TSaveDialog;
    tbInvoicing: TTabSheet;
    pnlSalesInvs: TPanel;
    Label64: TLabel;
    Label66: TLabel;
    strgrdSalesInvs: TStringGrid;
    mmSInvQtyTot: TMemo;
    mmSInvGoodsTot: TMemo;
    mmSInvVatTot: TMemo;
    mmSInvGrandTot: TMemo;
    pnlPurchInvs: TPanel;
    Label65: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    strgrdPurchInvs: TStringGrid;
    mmPInvQtyTot: TMemo;
    mmPInvGoodsTot: TMemo;
    mmPInvVatTot: TMemo;
    mmPInvGrandTot: TMemo;
    mmOrdQtyInvTab: TMemo;
    btnEmail: TBitBtn;
    dblkpJobType: TDBLookupComboBox;
    Label69: TLabel;
    btnClearJobType: TBitBtn;
    OleContainer1: TOleContainer;
    edtDescReference: TEdit;
    Label70: TLabel;
    lblAccountTeam: TLabel;
    edtAccountTeam: TEdit;
    edtAccountManager: TEdit;
    btnAccountManager: TButton;
    btnJobBag: TBitBtn;
    chkbxAuthorised: TCheckBox;
    chkbxInvoiceBeforeDelivery: TCheckBox;
    chkbxClearedFunds: TCheckBox;
    btnAuthNotes: TBitBtn;
    FlashTimer: TTimer;
    lblAuthorisedBy: TLabel;
    tsStockUsage: TTabSheet;
    pnlStockUsage: TPanel;
    pnlStock: TPanel;
    dbgStockUsage: TDBGrid;
    Label72: TLabel;
    Label73: TLabel;
    dbgStock: TDBGrid;
    Label74: TLabel;
    lblTotalUsage: TLabel;
    Label75: TLabel;
    lblTotalStock: TLabel;
    Label76: TLabel;
    lblOrdQtyStockUsage: TLabel;
    chkbxMake2Invoice: TCheckBox;
    btnPriceChanges: TButton;
    lblProofStatus: TLabel;
    edtProofStatusDate: TEdit;
    pnlFSCClaim: TPanel;
    lblFSCClaim: TLabel;
    dblkpFSCClaim: TDBLookupComboBox;
    lblFSCMix: TLabel;
    spnFSCMix: TSpinEdit;
    pnlCostCentre: TPanel;
    lblCostCentre: TLabel;
    edtCostCentre: TEdit;
    btnCostCentre: TButton;
    btnClearClaim: TBitBtn;
    tsNCA: TTabSheet;
    pnlFunctions: TPanel;
    btnAddNCA: TBitBtn;
    btnChangeNCA: TBitBtn;
    btnDeleteNCA: TBitBtn;
    btnPrintNCA: TBitBtn;
    Panel25: TPanel;
    sgNCADetails: TStringGrid;
    Panel26: TPanel;
    Label10: TLabel;
    memNCADetails: TMemo;
    pnlVersions: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    btnAddStockCode: TBitBtn;
    btnChangeStockCode: TBitBtn;
    btnDeleteStockCode: TBitBtn;
    sgVersions: TStringGrid;
    chkbxFileCopies: TCheckBox;
    DocOpenDialog: TOpenDialog;
    DeliveryToStockChk: TCheckBox;
    Label54: TLabel;
    CountyEdit: TEdit;
    lblAltPurchaseOrder: TLabel;
    edtAltPurchaseOrder: TEdit;
    procedure ValidateQty(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SelSupBtnClick(Sender: TObject);
    procedure SelDateBtnClick(Sender: TObject);
    procedure SelContactBtnClick(Sender: TObject);
    procedure DetsGrpBoxClick(Sender: TObject);
    procedure ShowLineGrid(Sender: TObject);
    procedure LineAddBitBtnClick(Sender: TObject);
    procedure LineChgBitBtnClick(Sender: TObject);
    procedure LineDelBitBtnClick(Sender: TObject);
    procedure ShowDelivGrid(Sender: TObject);
    procedure DelivAddBitBtnClick(Sender: TObject);
    procedure DelivChgBitBtnClick(Sender: TObject);
    procedure DelivDelBitBtnClick(Sender: TObject);
    procedure DelivDetsStringGridDblClick(Sender: TObject);
    procedure DelivDetsStringGridDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ShowCallOffGrid(Sender: TObject);
    procedure ShowExtChgGrid(Sender: TObject);
    procedure ExtChgAddBitBtnClick(Sender: TObject);
    procedure ExtChgChgBitBtnClick(Sender: TObject);
    procedure ExtChgDelBitBtnClick(Sender: TObject);
    procedure ExtChgDetsStringGridDblClick(Sender: TObject);
    procedure ExtChgDetsStringGridDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure DelivDetsStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure ExtChgDetsStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SetupDetails(Sender: TObject);
    procedure SetJobTypeAbilities;
    procedure FormActivate(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure DelivsSelectBitBtnClick(Sender: TObject);
    procedure ExtChgSelectBitBtnClick(Sender: TObject);
    procedure ProofsBitBtnClick(Sender: TObject);
    procedure CurrClearBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDeletePartClick(Sender: TObject);
    procedure AddDetailsListClick(Sender: TObject);
    procedure btnAddSuppCustNotesClick(Sender: TObject);
    procedure btnChgSuppCustNotesClick(Sender: TObject);
    procedure DeleteNotesBtnClick(Sender: TObject);
    procedure ChangeNotesBtnClick(Sender: TObject);
    procedure AddNotesbtnClick(Sender: TObject);
    procedure btnDelSuppCustNotesClick(Sender: TObject);
    procedure SupplierEditChange(Sender: TObject);
    procedure MatEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuestionClick(Sender: TObject);
    procedure QuestionChange(Sender: TObject);
    procedure QuestionDropDown(Sender: TObject);
    procedure ColourComboBoxEnter(Sender: TObject);
    procedure ColourComboBoxExit(Sender: TObject);
    procedure PartListDblClick(Sender: TObject);
    procedure DateEditExit(Sender: TObject);
    procedure CallOffAddBtnClick(Sender: TObject);
    procedure CallOffChgBtnClick(Sender: TObject);
    procedure CallOffDelBtnClick(Sender: TObject);
    procedure sgCallOffDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgCallOffDblClick(Sender: TObject);
    procedure NoCallOffEditChange(Sender: TObject);
    procedure ProofsReqChkBoxClick(Sender: TObject);
    procedure ContactComboDropDown(Sender: TObject);
    procedure CustLUBtnClick(Sender: TObject);
    procedure ContactLUBtnClick(Sender: TObject);
    procedure RepLUButtonClick(Sender: TObject);
    procedure ProdTypeBtnClick(Sender: TObject);
    procedure ReqByDateLUBtnClick(Sender: TObject);
    procedure CustDescEditChange(Sender: TObject);
    procedure CustDescEditEnter(Sender: TObject);
    procedure CustDescEditExit(Sender: TObject);
    procedure OnHoldChkBoxClick(Sender: TObject);
    procedure OrderUnitDBLCBClick(Sender: TObject);
    procedure SellUnitDBLCBClick(Sender: TObject);
    procedure ProofsGrpBoxClick(Sender: TObject);
    procedure ReqByDateEditExit(Sender: TObject);
    procedure CustRefEditExit(Sender: TObject);
    procedure DepthEditExit(Sender: TObject);
    procedure WidthEditExit(Sender: TObject);
    procedure UpDown1Exit(Sender: TObject);
    procedure UpDown2Exit(Sender: TObject);
    procedure OrderQtyMemoExit(Sender: TObject);
    procedure OrdPriceMemoExit(Sender: TObject);
    procedure SellPriceMemoExit(Sender: TObject);
    procedure SuppDescEditExit(Sender: TObject);
    procedure SuppRefEditExit(Sender: TObject);
    procedure SuppJobRefEditExit(Sender: TObject);
    procedure ArtEditExit(Sender: TObject);
    procedure FormsPerBoxEditExit(Sender: TObject);
    procedure SetsEditExit(Sender: TObject);
    procedure ExpectedLifeSpinEditExit(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure FormRefButtonClick(Sender: TObject);
    procedure FormRefClrBitBtnClick(Sender: TObject);
    procedure OrderQtyMemoEnter(Sender: TObject);
    procedure ContactComboChange(Sender: TObject);
    procedure DepthEditChange(Sender: TObject);
    procedure WidthEditChange(Sender: TObject);
    procedure OrderQtyMemoChange(Sender: TObject);
    procedure OrdPriceMemoChange(Sender: TObject);
    procedure SellPriceMemoChange(Sender: TObject);
    procedure CustRefEditChange(Sender: TObject);
    procedure ViewBitBtnClick(Sender: TObject);
    procedure AddLineBitBtnClick(Sender: TObject);
    procedure ProofDateBtnClick(Sender: TObject);
    procedure defaultSizeBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sgPartDetailsExit(Sender: TObject);
    procedure sgPartDetailsEnter(Sender: TObject);
    procedure AddPartDetails;
    procedure sgPartDetailsClick(Sender: TObject);
    procedure ColourComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure sgPartDetailsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure MaterialComboBoxClick(Sender: TObject);
    procedure MaterialComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure BrandComboBoxClick(Sender: TObject);
    procedure WeightComboBoxClick(Sender: TObject);
    procedure ColourComboBoxClick(Sender: TObject);
    procedure WeightComboBoxExit(Sender: TObject);
    procedure BrandComboBoxExit(Sender: TObject);
    procedure MaterialComboBoxExit(Sender: TObject);
    procedure AddDetailsListDblClick(Sender: TObject);
    procedure AddDetailsListContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Add1Click(Sender: TObject);
    procedure MaintainPapers1Click(Sender: TObject);
    procedure DelivDetsStringGridClick(Sender: TObject);
    procedure MarginDefaults1Click(Sender: TObject);
    procedure sgPartDetailsContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure sgCallOffSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure popCallOffPopup(Sender: TObject);
    procedure ArtworkBtnClick(Sender: TObject);
    procedure ProofsReqChkBoxExit(Sender: TObject);
    procedure ProofStatDBLUCBExit(Sender: TObject);
    procedure ProofDateBtnExit(Sender: TObject);
    procedure ProofsDateEditExit(Sender: TObject);
    procedure chkInvoiceUpfrontClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLUAddChrgClick(Sender: TObject);
    procedure chkbxMake2InvoiceClick(Sender: TObject);
    procedure sgIntNotesClick(Sender: TObject);
    procedure btbtnAddIntNoteClick(Sender: TObject);
    procedure btbtnChangeIntNoteClick(Sender: TObject);
    procedure btbtnDeleteIntNoteClick(Sender: TObject);
    procedure btbtnAppntmntClick(Sender: TObject);
    procedure NumberingEditExit(Sender: TObject);
    procedure PlateChangeSpinExit(Sender: TObject);
    procedure CustReqDateBtnClick(Sender: TObject);
    procedure CustReqDateEditExit(Sender: TObject);
    procedure ExpLifeDateBtnClick(Sender: TObject);
    procedure edtLifeExpExit(Sender: TObject);
    procedure CustReqDateEditEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkpVatRateClick(Sender: TObject);
    procedure btbtnAddDocClick(Sender: TObject);
    procedure btbtnChangeDocClick(Sender: TObject);
    procedure btbtnDeleteDocClick(Sender: TObject);
    procedure btbtnOpenClick(Sender: TObject);
    procedure pnlDocsResize(Sender: TObject);
    procedure AddNotesMemoChange(Sender: TObject);
    procedure NewOfficeDoc(Sender: TObject);
    procedure tbInvoicingResize(Sender: TObject);
    procedure InvsGridsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdSalesInvsDblClick(Sender: TObject);
    procedure strgrdPurchInvsDblClick(Sender: TObject);
    procedure OrderLinePageChange(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure dblkpJobTypeClick(Sender: TObject);
    procedure btnClearJobTypeClick(Sender: TObject);
    procedure edtDescReferenceExit(Sender: TObject);
    procedure OfficeComboBoxClick(Sender: TObject);
    procedure btnAccountManagerClick(Sender: TObject);
    procedure btnJobBagClick(Sender: TObject);
    procedure chkbxAuthorisedClick(Sender: TObject);
    procedure chkbxInvoiceBeforeDeliveryClick(Sender: TObject);
    procedure btnAuthNotesClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure tsStockUsageResize(Sender: TObject);
    procedure btnPriceChangesClick(Sender: TObject);
    procedure btnCostCentreClick(Sender: TObject);
    procedure dblkpFSCClaimClick(Sender: TObject);
    procedure btnClearClaimClick(Sender: TObject);
    procedure spnFSCMixExit(Sender: TObject);
    procedure ProofStatDBLUCBClick(Sender: TObject);
    procedure ContactComboClick(Sender: TObject);
    procedure sgNCADetailsClick(Sender: TObject);
    procedure btnAddNCAClick(Sender: TObject);
    procedure btnChangeNCAClick(Sender: TObject);
    procedure btnDeleteNCAClick(Sender: TObject);
    procedure btnPrintNCAClick(Sender: TObject);
    procedure sgNCADetailsDblClick(Sender: TObject);
    procedure sgNCADetailsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgVersionsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnAddStockCodeClick(Sender: TObject);
    procedure btnChangeStockCodeClick(Sender: TObject);
    procedure btnDeleteStockCodeClick(Sender: TObject);
    procedure sgVersionsDblClick(Sender: TObject);
    procedure ReqByDateEditChange(Sender: TObject);
    procedure CustReqDateEditChange(Sender: TObject);
    procedure chkbxFileCopiesClick(Sender: TObject);
    procedure edtAltPurchaseOrderExit(Sender: TObject);
  private
    dtmdlActivities : TdtmdlActivity;
    iOldProductType: integer;
    sOriginalProofStatus: string;
    sOldValue: string;
    FAddJobBag: boolean;
    FbAllowDescChg: boolean;
    FEmailApplication : string;
    FFormsperBoxChange: boolean;
    FJobBagNo: integer;
    fDelivNotes: string;
    fUpdJobBagHead: boolean;
    FPurchaseOrderNo: real;
    FJobBagLine: integer;
    procedure SetbAllowDescChg(const Value: boolean);
    procedure SetFormsperBoxChange(const Value: boolean);
    procedure DisplayCallOffButtons(irow: integer);
    procedure SetJobBagNo(const Value: integer);
    procedure SetDelivNotes(const Value: string);
    procedure DisplayIntNotes;
    procedure ResetIntNotesDisplay;
    procedure DisplayDocumentList;
    procedure ResetDocumentListDisplay;
    procedure setUpdJobBagHead(const Value: boolean);
    procedure DisplayInvoiceLists;
    procedure DisplayStockUsage;
    procedure DisplayStock;
    procedure DisplayNonConformDetails;
    procedure DisplayStockCodes;
    procedure ResetInvoiceLists;
    procedure SendAndSaveEmail(sTo, sSubject: string);
    procedure SetPurchaseOrderNo(const Value: real);
    procedure CallMaintJobBagScreen(aMode: TjbMode);
    procedure CallMaintNCA(aMode: TponcMode);
    procedure CallMaintStockCodes(aMode: TposcMode);
    procedure CheckProductTypeInvoicing(tempCode: integer);
    procedure CheckProductTypeCashSale(tempCode: integer);
    procedure CheckNotes(Sender: TObject);
    procedure SetFSCClaimAbilities;
    procedure SetJobBagLine(const Value: integer);
  private
    bNotesFlash: boolean;
    bNeedsAuthorising: boolean;
    dmPOJobBag: TdmJobBag;
    FActiveDone: Boolean;
    FFuncMode: Char;
    FPartDetail: TPartDetail;
    FSelectedChargeIndex: Integer;
    FSelectedDeliveryIndex: Integer;
    FSelectedLineIndex: Integer;
    bDisableLineNameChangeEvent,
      bDelivsBalance:
      Boolean;
    FSelectedCallOffIndex: Integer;
    OldCustReqDate: TDateTime;
    OneDeliveryOnly: Boolean;
    CanDeliverToStock: Boolean;
    DefaultDeliveries: Boolean;
    MixedClaim: boolean;
    procedure AddActivity;
    function GetSelectedCharge: TExtraCharge;
    function GetSelectedDelivery: TDeliveryLine;
    function GetSelectedCallOffOrder: TCallOffOrder;
    function GetSelectedLine: TOrderLine;
    procedure DefContact(iTempSupp, iTempBranch: Integer);
    procedure UpdatePOLines;
    function CalcPOHeadStatus(Sender: TObject): Integer;
    procedure ShowDeliveryDetails(SelectedDelivery: TDeliveryLine);
    procedure UpdatePODelivs;
    procedure UpdateStockCodes;
    procedure UpdateNonConformDocs;
    procedure UpdateCallOffDelivs(const iOrd, iCallOff: integer);
    procedure CallLineMaintScreen(sTempFuncMode: Char);
    function GetDelivDescrLine(iTempRow: Integer): string;
    function GetCallOffDescrLine(iTempRow: Integer): string;
    procedure CallDelivMaintScreen(sTempFuncMode: Char);
    procedure CallOffMaintScreen(sTempFuncMode: Char);
    procedure CallOffCancel(sTempFuncMode: Char);
    procedure UpdatePOExtChg;
    procedure UpdateCallOffs;
    procedure UpdateCallOffLine(const iOrd, iCallOff: integer);
    procedure CallExtChgMaintScreen(sTempFuncMode: Char);
    procedure FillPartList(const iSelect: Integer);
    procedure DelNarrs(Sender: TObject);
    procedure HandlePOLine(Query: TFDQuery; const inx: Integer);
    procedure HandleJobBagLine(Query: TFDQuery; const inx: Integer);
    procedure HandlePODelivery(Query: TFDQuery; const iOrd, iDel: Integer);
    procedure HandleCallOffDelivery(Query: TFDQuery; const iOrd, iCallOff: Integer);
    procedure HandleCallOffLine(Query: TFDQuery; const inx, iCallOff: Integer);
//    procedure UpdateJobBag(const inx: Integer);
    procedure UpdateJobBagHead(const inx: Integer);
    procedure UpdateSalesInvoice(const inx: Integer);
    procedure UpdateStoreStock(const inx: integer);
    function OKAdding: Boolean;
    function OKChanging: Boolean;
    function OKDeleting: Boolean;
    function IsCostUnitInActive(TempCode: integer): boolean;
    function IsSellUnitInActive(TempCode: integer): boolean;
    function IsCustomerActive(TempCust: integer): boolean;
    function IsCustInvUpFrnt(TempCust : integer): boolean;
    function UpdJobBagHeadRqd(POnumber: real): Boolean;
    procedure AddOrderLineParts(inx: Integer);
    procedure AddOrderLineAdditionals(inx: Integer);
    procedure ClearTabSheets;
    procedure FillTabSheets;
    procedure DisplayPartDetails;
    procedure SaveCustomerContactStatus(const inx: Integer);
    procedure SavePartDetails(const inx: Integer);
    procedure SaveCallOffPartDetails(const inx, iCallOff: Integer);
    procedure CreatePartDetailsGrid;
    procedure SetNCAHeaders;
    procedure SetStockCodeHeaders;
    procedure SetAbilities;
    procedure DisplayAdditionalDetails(const inx: Integer);
    procedure SaveAdditionalDetails(const inx: Integer);
    procedure SelectionChanged;
    procedure SetLineDetails;
    procedure SetNewLineDetails;
    procedure LoadOrderLine;
    procedure SetNotesBtns;
    procedure SetQuestions;
    procedure FreeQuestionComponents;
    procedure ChangePartDetails;
    procedure UpdateDelivery;
    procedure UpdateOrderLine;
    procedure SetNewOrderLine;
    procedure CreateDelivery;
    procedure CreateQuestions;
    function InStockTotal: Double;
    procedure CalcTotalOrderValue;
    procedure CalcTotalSalesValue;
    procedure CalcProfitValue;
    procedure GetCharges;
    function JobIsInBag: Boolean;
    procedure GetCompany;
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    procedure CheckForCustomerNotes;
    property bAllowDescChg: boolean read FbAllowDescChg write SetbAllowDescChg;
    property FormsperBoxChange: boolean read FFormsperBoxChange write SetFormsperBoxChange;
  public
    bCanChangeInvoicedOrders: boolean;
    bComeFromJobBag: Boolean;
    bOK: Boolean;
    CostCentreLevel: string;
    DefaultDeliveryViaCompany: boolean;
    reselectCust: boolean;
    compDir, docDir, opDir: string;
    RepCanConvert: Boolean;
    CreateFromEnq: Boolean;
    myOrderLimit, myNewSellLimit, mySellLimit, rOrderLimit, rSellLimit, rNewSellLimit, myMaxOrderLimit: real;
    SellLimitType: string;
    function GetNumberofBoxes(sFormsperBox: string; iQty: real):integer;
    property FuncMode: Char read FFuncMode write FFuncMode;
    property PartDetail: TPartDetail read FPartDetail write FPartDetail;
    property PurchaseOrderNo: real read FPurchaseOrderNo write SetPurchaseOrderNo;
    property SelectedCharge: TExtraCharge read GetSelectedCharge;
    property SelectedDelivery: TDeliveryLine read GetSelectedDelivery;
    property SelectedCallOffOrder: TCallOffOrder read GetSelectedCallOffOrder;
    property SelectedLine: TOrderLine read GetSelectedLine;
    property SelectedChargeIndex: Integer read FSelectedChargeIndex;
    property SelectedDeliveryIndex: Integer read FSelectedDeliveryIndex;
    property SelectedCallOffIndex: Integer read FSelectedCallOffIndex;
    property SelectedLineIndex: Integer read FSelectedLineIndex;
    property JobBagNo: integer read FJobBagNo write SetJobBagNo;
    property JobBagLine: integer read FJobBagLine write SetJobBagLine;
    property DelivNotes: string read fDelivNotes write SetDelivNotes;
    property UpdJobBagHead: boolean read fUpdJobBagHead write setUpdJobBagHead;
  end;

var
  PBMaintPOrdFrm: TPBMaintPOrdFrm;

implementation

uses
  System.UITypes, System.Types,
  PBPODataMod, PBAuditDM, PBLUSupp, PBLUSConta, PBMaintPOrdLine,
  PBMaintPOrdLineDeliv, PBMaintPOrdLineExtChg, pbMainMenu, DateSelV5,
  PBMaintIntNote,pbDatabase, PBLUProofHistN, PBPOAddDtls, PBMaintPOAddNotes,
  PBMaintPOrdLInactive, PBMaintPOrdLineCallOff, PBLUCust, PBLUCConta,
  PBLURep, PBLUPrdTyp, PBLUCustFormRef, PBMaintPOrdLView, PBLUStandSize,
  PBMaintPaper, PBLUArtwrkTyp, PBLUAddCharges, PBMaintContApp, pbPartDescDg,
  CCSCommon, PBMaintPOLineDoc, PBDocObjectsDM, PBMaintSalesInvoice, pbSalesInvoiceDm,
  PBMaintSuppInvoice, pbSupplierInvoiceDM, PBMaintPOEmail, PBWordOLE,
  PBExcelOLE, PBLUAccountManager, PBMaintJobBag, PBDBMemo, PBImages,
  PBLUCRep, PBMaintPOrdHistory, PBLUOps, PBLUCustCstCntr,
  PBLUBranchCstCntr, PBMaintPOrdNonConfDoc, PBRSNonConform, PBMaintPOrdLineStockCode;

{$R *.DFM}

function TPBMaintPOrdFrm.GetSelectedCharge: TExtraCharge;
begin
  if (SelectedLine = nil) or (FSelectedChargeIndex < 0) then
    Result := nil
  else
    Result := SelectedLine.ExtraCharges[FSelectedChargeIndex];
end;

function TPBMaintPOrdFrm.GetSelectedDelivery: TDeliveryLine;
begin
  if (SelectedLine = nil) or (FSelectedDeliveryIndex < 0) then
    Result := nil
  else
    Result := SelectedLine.DeliveryLines[FSelectedDeliveryIndex];
end;

function TPBMaintPOrdFrm.GetSelectedCallOffOrder: TCallOffOrder;
begin
  if (SelectedLine = nil) or (FSelectedCallOffIndex < 0) then
    Result := nil
  else
    Result := SelectedLine.CallOffOrders[FSelectedCallOffIndex];
end;

function TPBMaintPOrdFrm.GetSelectedLine: TOrderLine;
begin
  if FSelectedLineIndex < 0 then
    Result := nil
  else
    Result := PurchaseOrder.OrderLines[FSelectedLineIndex];
end;

procedure TPBMaintPOrdFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  if FFuncMode = poDelete then
    OKBitBtn.Enabled := true
  else
    OKBitBtn.Enabled := (Trim(SupplierEdit.Text) <> '') and
    (Trim(DateEdit.Text) <> '') and
    (Trim(ContactEdit.Text) <> '') and
    (Trim(CustNameEdit.text) <> '') and
    (Trim(ContactCombo.Text) <> '') and
    (Trim(RepEdit.Text) <> '') and
    (Trim(CustDescEdit.text) <> '') and
    (Trim(ProdTypeEdit.text) <> '') and
    (Trim(ReqByDateEdit.text) <> '') and
    (Trim(CustReqDateEdit.text) <> '') and
    (Trim(CustRefEdit.Text) <> '') and
    (Trim(DepthEdit.Text) <> '') and
    (Trim(WidthEdit.Text) <> '') and
    (Trim(OrderQtyMemo.Text) <> '') and
    (Trim(OrdPriceMemo.text) <> '') and
    (Trim(SellPriceMemo.Text) <> '') and
    (Trim(dblkpVatRate.Text) <> '') and
    (edtAccountManager.text <> '') and
    ((OrderUnitDBLCB.keyvalue <> 0) and (OrderUnitDBLCB.Text <> '')) and
    ((SellUnitDBLCB.keyvalue <> 0) and (SellUnitDBLCB.text <> '')) and
    ((FormRefEdit.text <> '') or (PBPODM.GetCompanySQl.fieldbyname('Form_Reference_Mandatory').asString <> 'Y'));
end;

procedure TPBMaintPOrdFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

function TPBMaintPOrdFrm.OKAdding: Boolean;
var
  sTemp: string;
  iTempNarr: integer;
begin
  Result := False;
  if PurchaseOrder.OrderLines.Count = 0 then
  begin
    MessageDlg('You must add some lines to the order first', mtError,
      [mbOK], 0);
    Exit;
  end;
  PurchaseOrder.PONumber := PBPODM.GetNextPONumber;

  with PBPODM.AddSQL, PurchaseOrder do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PONumber;
    ParamByName('Supplier').AsInteger := Supplier;
    ParamByName('Branch_No').AsInteger := BranchNo;
    ParamByName('Date_Point').AsDateTime := StrToDate(DateEdit.Text);
    ParamByName('Contact_No').AsInteger := SupplierContactNo;
    ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
    if edtAccountManager.text = '' then
      ParamByName('Office_Contact').AsInteger := frmPBMainMenu.iOperator
    else
      ParamByName('Office_Contact').AsInteger := OfficeContact;
    ParamByName('Purch_Ord_Inv_Method').AsString := 'L';

    ParamByName('Purch_Ord_Head_Status').AsInteger := phCreated;
    if (CurrDBLUCB.KeyValue <> 0) and (CurrDBLUCB.text <> '') then
      ParamByName('Currency_Code').AsInteger := CurrDBLUCB.KeyValue
    else
      ParamByName('Currency_Code').Clear;
    Parambyname('Account_Team').asinteger := AccountTeam;

    if bNeedsAuthorising then
      parambyname('Needs_Authorising').asstring := 'Y'
    else
      parambyname('Needs_Authorising').asstring := 'N';

    if AuthorisedBy = 0 then
      Parambyname('Authorised_by').clear
    else
      Parambyname('Authorised_by').asinteger := AuthorisedBy;

    iTempNarr := Narrative;
    PBPODM.SaveNarrative(iTempNarr,NarrativeText);
    Narrative := iTempNarr;
    if Narrative = 0 then
      ParamByName('Authorised_Reason').clear
    else
      ParamByName('Authorised_Reason').Asinteger := Narrative;
    ExecSQL;
    {Write ADD PURCHASE ORDER to audit trail} ;
    PBAuditDataMod.WriteAudit(1100, Trunc(PONumber), 0, 0, 0, FloatToStr(PONumber)) ;
    {Create a directory for the Purchase order number}
    dmBroker.CreatePurchaseOrderDocDirectory(floattostr(PurchaseOrder.PONumber));
  end;
  UpdatePOLines;
  UpdatePODelivs;
  UpdatePOExtChg;
  UpdateCallOffs;
  UpdateStockCodes;

  {If using CRM then update activities}
  if frmPBMainMenu.UseCRMSystem AND frmPBMainMenu.mnuActivities.enabled then
    begin
      AddActivity;
    end;

  PBPODM.DeletePOLines(PurchaseOrder.PONumber);
  sTemp := '';

  if FAddJobBag then
    sTemp := ', also created job bag : ' + inttostr(JobBagNo);

  if bNeedsAuthorising then
    MessageDlg('Purchase Order created ' + sTemp, mtInformation, [mbOK], 0)
  else
    MessageDlg('The purchase order number is : ' +
      floatToStr(PurchaseOrder.PONumber) + sTemp, mtInformation, [mbOK], 0);
  Result := True;
end;

function TPBMaintPOrdFrm.OKChanging: Boolean;
var
  iTempNarr: integer;
begin
  Result := True;
  try
    {Update an existing code}
    with PBPODM.UpdSQL, PurchaseOrder do
    begin
      Close;
      ParamByName('Purchase_Order').asfloat := PONumber;
      ParamByName('Supplier').AsInteger := Supplier;
      ParamByName('Branch_No').AsInteger := BranchNo;
      ParamByName('Date_Point').AsDateTime := StrToDate(DateEdit.Text);
      ParamByName('Contact_No').AsInteger := SupplierContactNo;
//      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      ParamByName('Purch_Ord_Inv_Method').AsString := 'L';
      ParamByName('Purch_Ord_Head_Status').AsInteger := CalcPOHeadStatus(Self);
      if (CurrDBLUCB.KeyValue <> 0) and (CurrDBLUCB.text <> '') then
        ParamByName('Currency_Code').AsInteger := CurrDBLUCB.KeyValue
      else
        ParamByName('Currency_Code').Clear;
      if edtAccountManager.text = '' then
        ParamByName('Office_Contact').AsInteger := frmPBMainMenu.iOperator
      else
        ParamByName('Office_Contact').AsInteger := OfficeContact;
      Parambyname('Account_Team').asinteger := AccountTeam;

      if bNeedsAuthorising then
        parambyname('Needs_Authorising').asstring := 'Y'
      else
        parambyname('Needs_Authorising').asstring := 'N';

      if AuthorisedBy = 0 then
        Parambyname('Authorised_by').clear
      else
        Parambyname('Authorised_by').asinteger := AuthorisedBy;

      iTempNarr := Narrative;
      PBPODM.SaveNarrative(iTempNarr,NarrativeText);
      Narrative := iTempNarr;
      if Narrative = 0 then
        ParamByName('Authorised_Reason').clear
      else
        ParamByName('Authorised_Reason').Asinteger := Narrative;

      {Write UPDATE PURCHASE ORDER FIELDS to audit trail} ;
      PBAuditDataMod.FieldChanges('purchase_order',PBPODM.GetPOSQL,PBPODM.UpdSQL) ;
      ExecSQL;
    end;
    if ((selectedline.jobbagnumber <> 0) and UpdJobBagHeadRqd(PurchaseOrder.PoNumber)) = True then
      UpdateJobBagHead(Selectedlineindex);
    if (iOldProducttype <> Selectedline.ProductType) and (Selectedline.POLineStatus > plAllDelivered) then
      UpdateSalesInvoice(0);
    UpdateStoreStock(0);
    UpdatePOLines;
    UpdatePODelivs;
    UpdatePOExtChg;
    UpdateCallOffs;
    UpdateNonConformDocs;
    UpdateStockCodes;

    {If using CRM then update activities}
    if frmPBMainMenu.UseCRMSystem AND frmPBMainMenu.mnuActivities.enabled AND (PurchaseOrder.OrderLines[0].ProofStatus <> '') then
      begin
        AddActivity;
      end;

    PBPODM.DeletePOLines(PurchaseOrder.PONumber);
    {Write UPDATE PURCHASE ORDER to audit trail} ;
    PBAuditDataMod.WriteAudit(2100, Trunc(PurchaseOrder.PONumber), 0, 0, 0, POrdNoMemo.Text) ;
  except on E: Exception do
    begin
      Result := False;
      MessageDlg('Error during update: ' + E.Message, mtError, [mbAbort], 0);
    end;
  end;
end;

function TPBMaintPOrdFrm.OKDeleting: Boolean;
begin
  Result := False;
  if MessageDlg('Really delete these details ?', mtConfirmation,
    [mbNo, mbYes], 0) <> mrYes then
  begin
    Close;
    Exit;
  end;
  {Delete the narratives}
  DelNarrs(Self);
  with PBPODM, PurchaseOrder do
  begin
    DelJobBags(PONumber, 0);
    DeletePriceHistory(PONumber, 0);
    if CountJobBagLines(PurchaseOrder.OrderLines[0].JobBagNumber) < 1 then
      SetJobBagInactive(PurchaseOrder.OrderLines[0].JobBagNumber);

    ResetIsUpdateLine(PONumber);
    ResetIsUpdateDelivery(PONumber);
    ResetIsUpdateCharge(PONumber);
    DeletePOParts(PONumber);
    DeletePOAdditionals(PONumber);
    DeleteDeliveries(PONumber);
    DeleteCharges(PONumber);
    DeletePOQuestions(PONumber);
    DeletePOLines(PONumber);
    DeletePurchaseOrder(PONumber);
    {Write UPDATE PURCHASE ORDER to audit trail} ;
    PBAuditDataMod.WriteAudit(3100, Trunc(PONumber), 0, 0, 0, FloatToStr(PONumber)) ;
  end;
  Result := True;
end;

procedure TPBMaintPOrdFrm.OKBitBtnClick(Sender: TObject);
var
  key: integer;
  iActivityType: integer;
  aActivity : TActivity;
  AppDateTime: TDateTime;
  bSetReminder, bReminderPrompt: boolean;
  sSubject, sBody: string;
  iMonths: integer;
  Hour, Min, Sec, MSec: Word;
  TempWord: Word;
begin
  {Calculate New Minimum Sell Value}
  if SellLimitType = 'C' then
    begin
      rNewSellLimit := StrToFloatDef(TotOrderMemo.text, 0, FormatSettings) * (1+(rSellLimit/100));
      myNewSellLimit := StrToFloatDef(TotOrderMemo.text, 0, FormatSettings) * (1+(mySellLimit/100));
    end
  else
    begin
      rNewSellLimit := rSellLimit;
      myNewSellLimit := mySellLimit;
    end;

  if (PurchaseOrder.OrderLines.Count = 0) and (FFuncMode = poChange) then
  begin
    if MessageDlg('There are now no lines on this order. ' +
      'Do you want to delete it ?',
      mtConfirmation, [mbOK, mbAbort], 0) = mrOK then
      FFuncMode := poDelete
    else
      Exit;
  end;

  if (dmBroker.GetSupplierStatus(PurchaseOrder.Supplier) = 'N') and ((FFuncMode = poAdd)) then
    begin
      MessageDlg('The supplier is currently inactive, either change the supplier or make this supplier active.', mtError, [mbOK], 0);
      SelSupbtn.SetFocus;
      Exit;
    end;


  if (FFuncMode <> poDelete) and (PurchaseOrder.OrderLines[0].DeliveryLines.count = 0) then
    begin
      MessageDlg('No delivery details have been created for this order, please specify the delivery destination.', mtError, [mbOK], 0);
      OrderLinePage.ActivePage := tsDelivery;
      DelivAddBitBtnClick(self);
      Exit;
    end;

  if (FFuncMode <> poDelete) and (FFuncMode <> poRestrict) and (FFuncMode <> poInvoiced) and
      ((IsSellUnitInActive(PurchaseOrder.OrderLines[0].sellUnit)) or
      (IsCostUnitInActive(PurchaseOrder.OrderLines[0].orderUnit))) then
    begin
      MessageDlg('Either the Cost Unit or the Sell Unit selected are disabled, please select alternative price units.', mtError, [mbok], 0);
      Exit;
    end;

  if (FFuncMode <> poDelete) and (FFuncMode <> poRestrict) and (FFuncMode <> poInvoiced) then
    begin
      if (PurchaseOrder.OrderLines[0].ProofRequired) and (PurchaseOrder.OrderLines[0].proofstatus = '') then
        begin
          MessageDlg('If proofs are required, please select the current proof status', mtError, [mbok], 0);
          Exit;
        end;
    end;

  if (FFuncMode <> poDelete) and (not bDelivsBalance) then
  begin
    if dmBroker.AllowDeliveryImbalance then
      begin
        if MessageDlg('The delivery quantity does not match the ' +
          'order quantity specified, do you want to continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
            Exit;
      end
    else
      begin
        MessageDlg('The delivery quantity does not match the ' +
            'order quantity specified, check the delivery and order quantities. ', mtError, [mbOK], 0);
        exit;
      end;
  end;

  if (FFuncMode <> poDelete) and (strtoInt(OrderQtyMemo.text) < strtoInt(InvoiceQtyMemo.text)) then
  begin
    MessageDlg('The order quantity cannot be less than the quantity invoiced', mtError, [mbOk], 0);
    Exit;
  end;

  if (FFuncMode <> poDelete) and (PurchaseOrder.OrderLines[0].DeliveryLines.TotalStock > 0) and (trim(StockRefEdit.Text) = '') and dmBroker.StockCodeMandatory then
  begin
    MessageDlg('At least one delivery into stock has been specified, please select the relevant stock reference.', mtError, [mbOK], 0);
    Exit;
  end;

  {Check whether the stock item selected is an active product}
  if (FFuncMode <> poDelete) and (trim(StockRefEdit.Text) <> '') then
  begin
    if PBPODM.StockCodeInactive(trim(StockRefEdit.Text)) then
      begin
        messagedlg('The stock reference/form reference selected is inactive, orders cannot be processed for inactive products.', mtError, [mbOK], 0);
        exit;
      end;
  end;

  if (ffuncMode = poAdd) and ((not IsCustomerActive(PurchaseOrder.OrderLines[0].customer))) then
  begin
    MessageDlg('This customer is inactive, please select an active customer.', mtError, [mbok], 0);
    Exit;
  end;

  bNeedsAuthorising := false;
  if  (FFuncMode <> poDelete) and (chkbxAuthorised.checked) and (dmBroker.UseSAPIntegration) and (edtAltPurchaseOrder.Text = '') then
    begin
      MessageDlg('To complete authorisation of this order, enter a SAP Order number', mtError, [mbok], 0);
      edtAltPurchaseOrder.setfocus;
      Exit;
    end;

  if  (FFuncMode <> poDelete) and (dmBroker.AuthorisePOs = 'Y') and
      (StrToFloatDef(TotOrderMemo.text, 0, FormatSettings) > rOrderLimit) and (not chkbxAuthorised.checked) and
      (PurchaseOrder.OrderLines[0].POLineStatus <= 20) then
    begin
      MessageDlg('The value of this purchase order is ' + FloatToStrF(StrToFloatDef(TotOrderMemo.text, 0, FormatSettings), ffCurrency, 15, 3) + ', which is over your '
              + 'order limit of ' + FloatToStrF(rOrderLimit, ffCurrency, 15, 3) +  ', please obtain the necessary authorisation.', mterror, [mbOk], 0);
      bNeedsAuthorising := true
    end
  else
  if  (FFuncMode <> poDelete) and (not chkbxAuthorised.checked) and
      (StrToFloatDef(TotSellMemo.text, 0, FormatSettings) < rNewSellLimit) and
      (PurchaseOrder.OrderLines[0].POLineStatus <= 20) then
    begin
      MessageDlg('The sales value of this purchase order is ' + FloatToStrF(StrToFloatDef(TotSellMemo.text, 0, FormatSettings), ffCurrency, 15, 3) + ', which is less than your '
              + 'minimum total sales value for this order, of ' + FloatToStrF(rNewSellLimit, ffCurrency, 15, 3) +  ', please obtain the necessary authorisation.', mterror, [mbOk], 0);
      bNeedsAuthorising := true;
    end
  else
  if  (FFuncMode <> poDelete) and (chkbxAuthorised.checked) and
//      (dmBroker.CanAuthorise(frmpbMainMenu.iOperator) <> 'F') and
      (frmPBMainMenu.iOperator = PurchaseOrder.AuthorisedBy) and
      (StrToFloatDef(TotOrderMemo.text, 0, FormatSettings) > myOrderLimit) and
      (PurchaseOrder.OrderLines[0].POLineStatus <= 20) then
    begin
      MessageDlg('The value of this purchase order is ' + FloatToStrF(StrToFloatDef(TotOrderMemo.text, 0, FormatSettings), ffCurrency, 15, 3) + ', which is over your '
              + 'order limit of ' + FloatToStrF(myOrderLimit, ffCurrency, 15, 3) +  ', someone else needs to authorise this order.', mterror, [mbOk], 0);
      exit;
    end
  else
  if  (FFuncMode <> poDelete) and (chkbxAuthorised.checked) and
//      (dmBroker.CanAuthorise(frmpbMainMenu.iOperator) <> 'F') and
      (frmPBMainMenu.iOperator = PurchaseOrder.AuthorisedBy) and
      (StrToFloatDef(TotSellMemo.text, 0, FormatSettings) < myNewSellLimit) and
      (PurchaseOrder.OrderLines[0].POLineStatus <= 20) then
    begin
      MessageDlg('The sales value of this purchase order is ' + FloatToStrF(StrToFloatDef(TotSellMemo.text, 0, FormatSettings), ffCurrency, 15, 3) + ', which is less than '
              + 'your minimum total sales value for this order, of ' + FloatToStrF(myNewSellLimit, ffCurrency, 15, 3) +  ', someone else needs to authorise this order.', mterror, [mbOk], 0);
      exit;
    end
  else
  if (FFuncMode <> poDelete) and (StrToFloatDef(TotSellMemo.text, 0, FormatSettings) < StrToFloatDef(TotOrderMemo.Text, 0, FormatSettings)) then
    begin
      if MessageDlg('Total Sales value of this order is less than the Total Cost value, '+
        'do you want to continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
          Exit;
    end;

  {Prompt to confirm the reorder date}
  bSetReminder := false;
  bReminderPrompt := false;

  if (FFuncMode = poAdd) and dmBroker.UseReorderReminder then
    begin
      if edtLifeExp.text <> '' then
        begin
          TempWord := MessageDlg('The expected reorder date is ' + edtLifeExp.text + ' do you want to set a reminder within your tasks?', mtConfirmation,
            [mbYes, mbNo, mbCancel], 0);
          bReminderPrompt := true;
        end
      else
        begin
          if (StrToFloatDef(TotSellMemo.text, 0, FormatSettings) >= dmBroker.MinimumReorderLimit) then
            begin
              iMonths := dmBroker.GetReorderReminderInterval;
              TempWord := MessageDlg('No expected reorder date has been entered, do you want to set a reminder for ' + inttostr(iMonths) + ' months time?', mtConfirmation,
                [mbYes, mbNo, mbCancel], 0);
              bReminderPrompt := true;
            end;
        end;
      if bReminderPrompt then
        begin
          if TempWord = mrNo then
            bSetReminder := false
          else
            if TempWord = mrCancel then
              exit
          else
            begin
              bSetReminder := true;
              if edtLifeExp.text = '' then
                begin
                  edtLifeExp.text := PBDateStr(incMonth(StrToDate(self.CustReqDateEdit.Text), iMonths));
                  SelectedLine.ExpectedLife := trunc(StrToDate(self.edtLifeExp.text) - StrToDate(self.CustReqDateEdit.Text));
                end;
            end;
        end;
    end;

  {Check whether we need to create a job bag}
  if  (FFuncMode = poAdd) then
    begin
      if JobBagNo <> 0 then
        FAddJobBag := true
      else
      begin
        GetCompany;
        if (PBPODM.GetCompanySQL.Fieldbyname('Job_Bag_is_mandatory').asstring = 'Y') then
          begin
            FAddJobBag := true;
            JobBagNo := 0;
          end
        else
        if (PBPODM.GetCompanySQL.Fieldbyname('Job_Bag_in_Use').asstring = 'Y') and
           (PBPODM.GetCompanySQL.Fieldbyname('Job_Bag_is_mandatory').asstring = 'N') then
          begin
            if MessageDlg('Would you like to create a job bag for this order?',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              FAddJobBag := true;
            JobBagNo := 0;
          end
        else
          FAddJobBag := false;
      end;
    end;

  Screen.Cursor := crHourGlass;
  try
    if (FFuncMode = poAdd) then
      bOK := OKAdding
    else
      if (FFuncMode = poChange) or (FFuncMode = poRestrict) or (FFuncMode = poInvoiced) then
        bOK := OKChanging
      else
        if FFuncMode = poDelete then
          bOK := OKDeleting
        else
          bOK := True;
  finally
    Screen.Cursor := crDefault;
  end;

  if bSetReminder then
    begin
      sSubject := 'Reorder PO' + floattostr(PurchaseOrder.PONumber) + ' - ' + PurchaseOrder.OrderLines[0].CustomersDesc +
                  ' - ' + CustNameEdit.Text;

      sBody := 'Supplier: ' + SupplierEdit.text + #13#10 + #13#10;
      sBody := sBody + 'Quantity: ' + floattostr(PurchaseOrder.OrderLines[0].Quantity) + #13#10 + #13#10;
      sBody := sBody + 'Customer Order No: ' + PurchaseOrder.OrderLines[0].CustOrderNo + #13#10 + #13#10;

      Decodetime(now,Hour,Min,Sec,Msec);
      AppDateTime := PBDateStr(edtLifeExp.text) + encodetime(Hour,Min,Sec,Msec);;

      if frmPBMainMenu.UseCRMSystem and frmPBMainMenu.mnuActivities.enabled and frmPBMainMenu.ReorderReminder then
        begin
          {Get Reorder activity}
          iActivityType := dmBroker.GetDefaultReorderActivityType;

          {Update activities with reorder details}
          AppDateTime := PBDateStr(edtLifeExp.text) + encodetime(Hour,Min,Sec,Msec);;

          dtmdlActivities := TdtmdlActivity.create(self);
          try
            aActivity := TActivity.Create(dtmdlActivities);
            try
              aActivity.DbKey := 0;

              if iActivityType = 0 then
                aActivity.ActivityType := 1
              else
                aActivity.ActivityType := iActivityType;

              aActivity.AssignedTo := PurchaseOrder.OfficeContact;
              aActivity.Customer := PurchaseOrder.OrderLines[0].customer;
              aActivity.Branch := PurchaseOrder.OrderLines[0].BranchNo;
              aActivity.Contact := PurchaseOrder.OrderLines[0].CustomerContact;
              aActivity.DateTimeEntered := now;
              aActivity.DueDateTime := AppDateTime;
              aActivity.EntityReference := floattostr(PurchaseOrder.PONumber);
              aActivity.EntityReferenceDescription := PurchaseOrder.OrderLines[0].CustomersDesc;
              aActivity.Module := 30;
              aActivity.Operator := frmPBMainMenu.iOperator;
              aActivity.Priority := 20;
              aActivity.Reminder := false;
              aActivity.StartDateTime := 0;
              aActivity.Status := 20;
              aActivity.Subject := sSubject;
              aActivity.SaveToDB(true);
            finally
              aActivity.free;
            end;
          finally
            dtmdlActivities.free;
          end;
        end
      else
        begin
          AddAppBlindViaOutLook('',sSubject,sBody,AppDateTime,true,20);
        end;
    end;

  if bOK then
    Close;
end;

procedure TPBMaintPOrdFrm.SelSupBtnClick(Sender: TObject);
var
  i : integer;
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
{
    PBLUSuppFrm.bAllow_Upd := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.bIs_Lookup := ((PurchaseOrder.POHeadStatus <= phSomeInvoiceRaised) or (FFuncMode = poAdd));

    PBLUSuppFrm.bAllow_Upd := ((PurchaseOrder.POHeadStatus <= phSomeInvoiceRaised) or (FFuncMode = poAdd));
    PBLUSuppFrm.bSel_Branch := ((PurchaseOrder.POHeadStatus <= phSomeInvoiceRaised) or (FFuncMode = poAdd));
}
    PBLUSuppFrm.bIs_Lookup := ((strgrdPurchInvs.Cells[1,1] = '') or (FFuncMode = poAdd));
    PBLUSuppFrm.bAllow_Upd := PBLUSuppFrm.bIs_Lookup;
    PBLUSuppFrm.bSel_Branch := PBLUSuppFrm.bIs_Lookup;
    PBLUSuppFrm.SelCode := PurchaseOrder.Supplier;
    PBLUSuppFrm.SelBranch := PurchaseOrder.BranchNo;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      if (PurchaseOrder.Supplier <> PBLUSuppFrm.SelCode)
        or (PurchaseOrder.BranchNo <> PBLUSuppFrm.SelBranch) then
      begin  { Supplier changed, reset status }
        PurchaseOrder.POHeadStatus := phCreated;
        for i := 0 to Pred(PurchaseOrder.OrderLines.Count) do
          PurchaseOrder.OrderLines[i].POLineStatus := plNotYetSent;
        DefContact(PBLUSuppFrm.SelCode, PBLUSuppFrm.SelBranch);
      end;
      PurchaseOrder.Supplier := PBLUSuppFrm.SelCode;
      SupplierEdit.Text := PBLUSuppFrm.SelName+'/'+PBLUSuppFrm.SelBranchName;
      PurchaseOrder.BranchNo := PBLUSuppFrm.SelBranch;
      PurchaseOrder.Courier := PBLUSuppFrm.SelCourier;
    end;
  finally
    PBLUSuppFrm.Free;
  end;
  CheckOK(Self);
end;

procedure TPBMaintPOrdFrm.SelDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(DateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      DateEdit.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdFrm.SelContactBtnClick(Sender: TObject);
begin
  PBLUSContaFrm := TPBLUSContaFrm.Create(Self);
  try
{    PBLUSContaFrm.bIs_Lookup := True;
    PBLUSContaFrm.bAllow_Upd := True;
}
    PBLUSContaFrm.bIs_Lookup := (PurchaseOrder.POHeadStatus <= phSomeInvoiceRaised);
    PBLUSContaFrm.bAllow_Upd := (PurchaseOrder.POHeadStatus <= phSomeInvoiceRaised);

    PBLUSContaFrm.SelCode := PurchaseOrder.SupplierContactNo;
    PBLUSContaFrm.iSupp := PurchaseOrder.Supplier;
    PBLUSContaFrm.iBranch := PurchaseOrder.BranchNo;
    PBLUSContaFrm.sSuppName := SupplierEdit.Text;
    PBLUSContaFrm.sBranchName := PBPODM.GetSuppBranchName(PurchaseOrder.Supplier,PurchaseOrder.BranchNo);
    PBLUSContaFrm.ShowModal;
    if PBLUSContaFrm.bSelected then
    begin
      PurchaseOrder.SupplierContactNo := PBLUSContaFrm.SelCode;
      ContactEdit.Text := PBLUSContaFrm.SelName;
    end;
  finally
    PBLUSContaFrm.Free;
  end;
  CheckOK(Self);
end;

procedure TPBMaintPOrdFrm.HandlePOLine(Query: TFDQuery;
  const inx: Integer);
var
  i, iTempNarr: Integer;
begin
  with Query, PurchaseOrder.OrderLines[inx] do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].Clear;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    ParamByName('Line').AsInteger := Line;
    ParamByName('Alt_Purchase_Order').AsString := AltPurchaseOrder;
    ParamByName('Cust_Order_No').AsString := CustOrderNo;
    if Customer <> 0 then
    begin
      ParamByName('Customer').AsInteger := Customer;
      ParamByName('Branch_No').AsInteger := BranchNo;
      if CustomerContact <> 0 then
        ParamByName('Contact_No').AsInteger := CustomerContact;
    end;
    if Enquiry <> 0 then
      ParamByName('Enquiry').AsInteger := Enquiry;
    if LineZero <> 0 then
      ParamByName('Line0').AsInteger := LineZero;
    if SupplierReference <> '' then
      ParamByName('Supplier_Reference').AsString := SupplierReference;
    if SupplierJobRef <> '' then
      ParamByName('Supplier_Job_Ref').AsString := SupplierJobRef;
    ParamByName('Cost_centre').AsString := CostCentre;

    ParamByName('Goods_Required').AsDateTime := GoodsRequired;
    ParamByName('Goods_Reqd_by_Customer').AsDateTime := GoodsRequiredbyCust;
//    ParamByName('Purch_Ord_Line_Status').AsInteger := POLineStatus;
    ParamByName('Proof_Required').AsString := BoolToChar(ProofRequired);
    if ProofRequired and (ProofDate <> 0) then
      ParamByName('Proof_Date').AsDateTime := ProofDate;


    if ExpectedLife <> 0 then
      ParamByName('Expected_Life').AsInteger := ExpectedLife
    else
      ParamByName('Expected_Life').clear;

(*    if PurchaseOrder.DefaultVatCode <> 0 then
      ParamByName('Vat_Code').AsInteger := PurchaseOrder.DefaultVatCode;
*)
    ParamByName('Vat_Code').AsInteger := VatCode;
    ParamByName('Suppliers_Desc').AsString := SuppliersDesc;
    ParamByName('Customers_Desc').AsString := CustomersDesc;
    ParamByName('Description_Reference').AsString := DescriptiveRef;
    ParamByName('Quantity').AsFloat := Quantity;
    ParamByName('Order_Price').AsCurrency := OrderPrice;
    ParamByName('Selling_Price').AsCurrency := SellingPrice;
    ParamByName('List_Price').AsCurrency := ListPrice;
    ParamByName('Product_Type').AsInteger := ProductType;
    ParamByName('Printed_PO').AsString := BoolToChar(PrintedPO);
    ParamByName('Order_Unit').AsInteger := OrderUnit;
    ParamByName('Sell_Unit').AsInteger := SellUnit;
    if Query.Name = 'UpdPOLineSQL' then
      ParamByName('Supp_Inv_Recd').AsString := BoolToChar(SuppInvRecd);
    ParamByName('Rep').AsInteger := Rep;
    if FormReference <> 0 then
      ParamByName('Form_Reference').AsInteger := FormReference;
    iTempNarr := Narrative;
    PBPODM.SaveNarrative(iTempNarr, NarrativeText);
    Narrative := iTempNarr;
    if Narrative <> 0 then
      ParamByName('Narrative').AsInteger := Narrative;
    ParamByName('Forms_per_Box').AsString := FormsPerBox;
    if NCROTCMix = '' then
      ParamByName('NCR_OTC_Mix').clear
    else
      ParamByName('NCR_OTC_Mix').AsString := NCROTCMix;
    ParamByName('Depth').AsFloat := Depth;
    ParamByName('Depth_Unit').AsString := DepthUnit;
    ParamByName('Width').AsFloat := Width;
    ParamByName('Width_Unit').AsString := WidthUnit;
    ParamByName('Artwork_Instructions').AsString := ArtWork;
    ParamByName('Number_Instructions').AsString := Numbering;
    ParamByName('No_Of_Plates').AsInteger := NoOfPlateChanges;
    ParamByName('Original_order').Asfloat := OriginalOrder;
    ParamByName('Original_OrderLine').AsInteger := OriginalOrderLine;
    ParamByName('On_hold').Asstring := OnHold;
    ParamByName('No_of_Sets').Asstring := NoOfSets;
    ParamByName('No_of_CallOffs').Asstring := NoOfCallOffs;
    if Inactive <> 'Y' then
      Inactive := 'N';
    ParamByName('Inactive').Asstring := Inactive;
    if InactiveReason <> 0 then
      ParamByName('Inactive_Reason').Asinteger := InactiveReason;
    if PBDateStr(InactiveDate) <> '' then
      ParambyName('Inactive_Date').asDateTime := InactiveDate;

    if chkInvoiceUpfront.checked then
      ParamByName('Invoice_Upfront').Asstring := 'Y'
    else
      ParamByName('Invoice_Upfront').Asstring := 'N';

    Parambyname('Calloff_invoiced_upfront').asstring := CallOffInvoicedUpfront;
    parambyName('Qty_in_Stock').asfloat := StrToFloatDef(InstockQtyMemo.text, 0, FormatSettings);
    ParamByName('Purch_Ord_Line_Status').AsInteger := LineStatus;
    if JobType = 0 then
      ParambyName('Job_Type').clear
    else
      ParambyName('Job_Type').asinteger := JobType;

    if FSCClaim = 0 then
      ParambyName('FSC_Material_Claim').clear
    else
      ParambyName('FSC_Material_Claim').asinteger := FSCClaim;

    ParambyName('FSC_Mixed_Percentage').asfloat := FSCMixed;


    if chkbxInvoiceBeforeDelivery.checked then
      ParamByName('Ready_to_Invoice').Asstring := 'Y'
    else
      ParamByName('Ready_to_Invoice').Asstring := 'N';

    if chkbxClearedFunds.checked then
      ParamByName('Cash_Sale').Asstring := 'Y'
    else
      ParamByName('Cash_Sale').Asstring := 'N';

    if FileCopiesReceived = 0 then
      begin
        parambyname('File_Copies_Received_Date').clear;
        parambyname('File_Copies_Received_by').clear;
      end
    else
      begin
        parambyname('File_Copies_Received_Date').asdatetime := FileCopiesReceived;
        parambyname('File_Copies_Received_by').asinteger := FileCopiesReceivedBy;
      end;

    ExecSQL;
    if (ProofStatus <> '') and (Query.Name = 'AddPOLineSQL') then
      PBPODM.AddProofHist(PurchaseOrder.PONumber, Line, now, ProofStatus, frmPBMainMenu.iOperator)
    else
    if (ProofStatus <> '') and ProofStatDBLUCB.enabled then
      PBPODM.AddProofHist(PurchaseOrder.PONumber, Line, now, ProofStatus, frmPBMainMenu.iOperator)
  end;
end;

procedure TPBMaintPOrdFrm.HandleJobBagLine(Query: TFDQuery;
  const inx: Integer);
var
  dmJobBag : TdmJobBag;
  i, iJobBag, iJobBagLine, iSubRep: Integer;
begin

  GetCompany;
  if PBPODM.GetCompanySQL.Fieldbyname('Job_Bag_in_Use').asstring <> 'Y' then exit;

  dmJobBag := TdmJobBag.Create(Self);
  try
    with Query, PurchaseOrder.OrderLines[inx] do
    begin
      {Check to see if a job bag exists for this PO}
      PBPODM.GetJobBagDetsSQL.close;
      PBPODM.GetJobBagDetsSQL.parambyname('Purchase_order').asfloat := PurchaseOrder.PONumber;
      PBPODM.GetJobBagDetsSQL.parambyname('Line').asinteger := Line;
      PBPODM.GetJobBagDetsSQL.open;

      if (PBPODM.GetJobBagDetsSQL.recordcount = 0) then
        begin
          if not FAddJobBag then exit;
          if JobBagNo = 0 then
            begin
            iJobBag := PBPODM.GetNextJobBagNumber;
            while PBPODM.CheckJobBagExist(iJobBag) do
              iJobBag := PBPODM.GetNextJobBagNumber;
            {Add a Job Bag Header record}
            PBPODM.AddJobBagHeadSQL.close;
            PBPODM.AddJobBagHeadSQL.parambyname('Job_Bag').asinteger := iJobBag;
            PBPODM.AddJobBagHeadSQL.parambyname('Job_Bag_Descr').asstring := CustomersDesc;
            PBPODM.AddJobBagHeadSQL.parambyname('Customer').asinteger := Customer;
            PBPODM.AddJobBagHeadSQL.parambyname('Branch_no').asinteger := BranchNo;
            PBPODM.AddJobBagHeadSQL.parambyname('Date_Point').asdatetime := StrToDate(DateEdit.Text);
            PBPODM.AddJobBagHeadSQL.parambyname('Contact_no').asinteger := CustomerContact;
//            PBPODM.AddJobBagHeadSQL.parambyname('Goods_Required').asdatetime := GoodsRequired;
            PBPODM.AddJobBagHeadSQL.parambyname('Goods_Required').asdatetime := GoodsRequiredByCust;
            PBPODM.AddJobBagHeadSQL.parambyname('Quantity').asfloat := Quantity;
            PBPODM.AddJobBagHeadSQL.parambyname('Cust_Order_no').asstring := CustOrderNo;
            PBPODM.AddJobBagHeadSQL.parambyname('Rep').asinteger := Rep;

            if dmBroker.UseSubReps then
              begin
                iSubRep := PBPODM.GetCustomerSubRep(Customer, BranchNo);
                if iSubRep = 0 then
                  PBPODM.AddJobBagHeadSQL.parambyname('Sub_Rep').clear
                else
                  PBPODM.AddJobBagHeadSQL.parambyname('Sub_Rep').asinteger := iSubRep;
              end
            else
              PBPODM.AddJobBagHeadSQL.parambyname('Sub_Rep').clear;

            PBPODM.AddJobBagHeadSQL.parambyname('Operator').asinteger := frmPBMainMenu.iOperator;
            PBPODM.AddJobBagHeadSQL.parambyname('Office_Contact').asinteger := PurchaseOrder.OfficeContact;
            PBPODM.AddJobBagHeadSQL.parambyname('Job_Bag_Status').asinteger := 10;
            PBPODM.AddJobBagHeadSQL.parambyname('Invoice_upfront').asstring := InvoiceUpfront;
            PBPODM.AddJobBagHeadSQL.parambyname('Account_Team').asinteger := PurchaseOrder.AccountTeam;
            PBPODM.AddJobBagHeadSQL.execsql;

            JobBagNo := iJobBag;
            Query.SQL := PBPODM.AddJobBagSQL.SQL;
            end
          else
            iJobBag := JobBagNo;
          iJobBagLine := 0;
        end
      else
        begin
          iJobBag := PBPODM.GetJobBagDetsSQL.fieldbyname('Job_bag').asinteger;
          iJobBagLine := PBPODM.GetJobBagDetsSQL.fieldbyname('Job_bag_Line').asinteger;
        end;

      for i := 0 to Pred(Params.Count) do
        Params[i].Clear;

      ParamByName('Job_Bag').asinteger := iJobBag;
      if JobBagNo > 0 then
        begin
          if JobBagLine <> 0 then
            ParamByName('Job_Bag_Line').AsInteger := JobBagLine
          else
            ParamByName('Job_Bag_Line').AsInteger := PBPODM.GetNextJobBagLineNumber(iJobBag);
        end
      else
        begin
          if iJobBagLine = 0 then
            ParamByName('Job_Bag_Line').AsInteger := 1
          else
            ParamByName('Job_Bag_Line').AsInteger := iJobBagLine;
        end;
      ParamByName('Job_Bag_Line_Type').Asstring := 'P';
      ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
      ParamByName('Line').AsInteger := Line;
      ParamByName('Supplier').AsInteger := PurchaseOrder.Supplier;
      ParamByName('Branch_No').AsInteger := PurchaseOrder.BranchNo;
      ParamByName('Job_Bag_Line_Descr').AsString := CustomersDesc;
      with dmJobBag do
      begin
        ParamByName('Job_Bag_Line_Cost').AsFloat :=
          CalculatePrice(OrderUnit, Quantity, OrderPrice)+Extracharges.Total;
        ParamByName('Job_Bag_Line_Sell').AsFloat :=
          CalculatePrice(SellUnit, Quantity, SellingPrice)+Extracharges.TotalSell;
      end;
      ParamByName('Job_Bag_Line_Invoiced').AsString := 'N';
      if LineStatus >= 30 then      {Fully invoiced}
        begin
          ParamByName('Job_Bag_Line_Invoiced').AsString := 'Y';
          Parambyname('Job_Bag_Line_status').asinteger := LineStatus;
        end
      else if LineStatus >= 25 then   {Part Invoiced}
        begin
          ParamByName('Job_Bag_Line_Invoiced').AsString := 'P';
          Parambyname('Job_Bag_Line_status').asinteger := LineStatus;
        end
      else if LineStatus >= 21 then     {Fully or part delivered}
        Parambyname('Job_Bag_Line_status').AsInteger := LineStatus
      else
        Parambyname('Job_Bag_Line_status').asinteger := 12;     {In production}

      ParamByName('Job_Bag_Quantity').AsFloat := Quantity;
      ParamByName('Vat_Code').AsInteger := VATCode;
      ParamByName('Currency_Code').clear;
      ExecSQL;
    end;
  finally
    dmJobBag.Free;
  end;
end;

procedure TPBMaintPOrdFrm.HandleCallOffLine(Query: TFDQuery;
  const inx, iCallOff: Integer);
var
  i: Integer;
//  iTempNarr: integer;
begin
  with Query, PurchaseOrder.OrderLines[inx].CallOffOrders[iCallOff] do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].Clear;
    Close;
    if PONumber = 0 then
      ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber + ((iCallOff+1)/100)
    else
      ParamByName('Purchase_Order').asfloat := PONumber;
    ParamByName('Line').AsInteger := 1;
    ParamByName('Cust_Order_No').AsString := CustOrderNo;
    if Customer <> 0 then
    begin
      ParamByName('Customer').AsInteger := Customer;
      ParamByName('Branch_No').AsInteger := CustBranch;
      if CustContact <> 0 then
        ParamByName('Contact_No').AsInteger := CustContact;
    end;
    ParamByName('Goods_Required').AsDateTime := RequiredDate;
    ParamByName('Goods_Reqd_by_Customer').AsDateTime := RequiredDate;
    ParamByName('Purch_Ord_Line_Status').AsInteger := Status;
    ParamByName('Proof_Required').AsString := 'N';
    ParamByName('Expected_Life').AsInteger := 1;
    if PurchaseOrder.DefaultVatCode <> 0 then
      ParamByName('Vat_Code').AsInteger := PurchaseOrder.DefaultVatCode;
    ParamByName('Suppliers_Desc').AsString := Description;
    ParamByName('Customers_Desc').AsString := Description;
    ParamByName('Description_Reference').AsString := '';
    ParamByName('Quantity').AsFloat := OrderQty;
    ParamByName('Order_Price').AsCurrency := CostPrice;
    ParamByName('Selling_Price').AsCurrency := SellPrice;
    ParamByName('List_Price').AsCurrency := PurchaseOrder.OrderLines[inx].ListPrice;
    ParamByName('Product_Type').AsInteger := PurchaseOrder.OrderLines[inx].ProductType;
    ParamByName('Printed_PO').AsString := 'Y';
    ParamByName('Order_Unit').AsInteger := CostUnit;
    ParamByName('Sell_Unit').AsInteger := SellUnit;
    if Query.Name = 'UpdPOLineSQL' then
      ParamByName('Supp_Inv_Recd').AsString := BoolToChar(PurchaseOrder.OrderLines[inx].SuppInvRecd);
    ParamByName('Rep').AsInteger := Rep;
    if FormReference <> 0 then
      ParamByName('Form_Reference').AsInteger := FormReference;
(*
    iTempNarr := PurchaseOrder.OrderLines[inx].Narrative;
    PBPODM.SaveNarrative(iTempNarr, PurchaseOrder.OrderLines[inx].NarrativeText);
    PurchaseOrder.OrderLines[inx].Narrative := iTempNarr;
    if PurchaseOrder.OrderLines[inx].Narrative <> 0 then
      ParamByName('Narrative').AsInteger := PurchaseOrder.OrderLines[inx].Narrative;
*)
    ParamByName('Forms_per_Box').AsString := BoxQty;
    if PurchaseOrder.OrderLines[inx].NCROTCMix = '' then
      ParamByName('NCR_OTC_Mix').clear
    else
      ParamByName('NCR_OTC_Mix').AsString := PurchaseOrder.OrderLines[inx].NCROTCMix;

    ParamByName('Depth').AsFloat := PurchaseOrder.OrderLines[inx].Depth;
    ParamByName('Depth_Unit').AsString := PurchaseOrder.OrderLines[inx].DepthUnit;
    ParamByName('Width').AsFloat := PurchaseOrder.OrderLines[inx].Width;
    ParamByName('Width_Unit').AsString := PurchaseOrder.OrderLines[inx].WidthUnit;
//    ParamByName('Artwork_Instructions').AsString := PurchaseOrder.OrderLines[inx].ArtWork;
    ParamByName('Number_Instructions').AsString := NumberInstructions;
//    ParamByName('No_Of_Plates').AsInteger := PurchaseOrder.OrderLines[inx].NoOfPlateChanges;
    ParamByName('Original_Order').Asfloat := PurchaseOrder.PONumber;
    ParamByName('Original_Orderline').Asinteger := PurchaseOrder.OrderLines[inx].Line;
    ParamByName('No_of_Sets').Asstring := PurchaseOrder.OrderLines[inx].NoOfSets;
    if inactive <> 'Y' then
      inactive := 'N';
    ParamByName('Inactive').Asstring := Inactive;
    if InactiveReason <> 0 then
      ParamByName('Inactive_Reason').Asinteger := InactiveReason;
    if PBDateStr(InactiveDate) <> '' then
      ParambyName('InActive_Date').asDateTime := InactiveDate;

(*    if chkInvoiceUpfront.checked then
      parambyname('Calloff_Invoiced_Upfront').asstring := 'Y'
    else
      parambyname('Calloff_Invoiced_upfront').asstring := 'N';
*)
    parambyname('Calloff_Invoiced_upfront').asstring := CallOffInvoicedUpfront;
    parambyname('Qty_in_Stock').asfloat := 0;

    parambyname('Ready_to_invoice').asstring := 'N';
    parambyname('Cash_Sale').asstring := 'N';
    parambyname('Cost_Centre').asstring := '';
    parambyname('FSC_Material_Claim').clear;
    parambyname('FSC_Mixed_Percentage').asfloat := 0;
    ExecSQL;
  end;
end;

(*
procedure TPBMaintPOrdFrm.UpdateJobBag(const inx: Integer);
var
  dmJobBag : TdmJobBag;
begin
  dmJobBag := TdmJobBag.Create(Self);
  try
  with PBPODM.UpdJobBagSQL, PurchaseOrder.OrderLines[inx] do
  begin
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    ParamByName('Line').AsInteger := Line;
    ParamByName('Supplier').AsInteger := PurchaseOrder.Supplier;
    ParamByName('Branch_No').AsInteger := PurchaseOrder.BranchNo;
    ParamByName('Job_Bag_Line_Descr').AsString := CustomersDesc;
    with dmJobBag do
    begin
      ParamByName('Job_Bag_Line_Cost').AsFloat :=
        CalculatePrice(OrderUnit, Quantity, OrderPrice);
      ParamByName('Job_Bag_Line_Sell').AsFloat :=
        CalculatePrice(SellUnit, Quantity, SellingPrice);
    end;
    if POLineStatus >= 30 then
      ParamByName('Job_Bag_Line_Invoiced').AsString := 'Y'
    else
      ParamByName('Job_Bag_Line_Invoiced').AsString := 'N';
    ParamByName('Job_Bag_Quantity').AsFloat := Quantity;
    ParamByName('Vat_Code').AsInteger := VATCode;
    ExecSQL;
  end;
  finally
    dmJobBag.Free;
  end;
end;
*)

procedure TPBMaintPOrdFrm.UpdatePOLines;
var
  icount: Integer;
begin
  {Update the purchase order lines}
  PBPODM.ResetIsUpdateLine(PurchaseOrder.PONumber);
  for icount := 0 to Pred(PurchaseOrder.OrderLines.Count) do
  begin
    with PBPODM.GetPOLineSQL do
    begin
      Close;
      ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
      ParamByName('Line').AsInteger := PurchaseOrder.OrderLines[icount].Line;
      Open;
      if EOF then { Add a new PO line and associated records }
      begin
        HandlePOLine(PBPODM.AddPOLineSQL, icount);
        HandleJobBagLine(PBPODM.AddJobBagSQL, icount);
        AddOrderLineParts(icount);
        AddOrderLineAdditionals(icount);

        {Update the price change history with all new details}
        PBPODM.SaveFieldChanges('Purchase_OrderLine',PBPODM.GetPOLineSQL,PBPODM.AddPOLineSQL);
        {Update the audit trail with the file update} ;
        PBAuditDataMod.WriteAudit(1101,Trunc(PurchaseOrder.PONumber),PurchaseOrder.OrderLines[icount].Line,0,0,
                        FloatToStr(PurchaseOrder.PONumber) + '/' + IntToStr(PurchaseOrder.OrderLines[icount].Line)) ;
      end
      else
      begin {Update a PO line}
        HandlePOLine(PBPODM.UpdPOLineSQL, icount);

        PBPODM.SaveFieldChanges('Purchase_OrderLine',PBPODM.GetPOLineSQL,PBPODM.UpdPOLineSQL);
        {Update the audit trail with the field changes. If there has been a field change, write a record UPDATE} ;
        If PBAuditDataMod.FieldChanges('Purchase_OrderLine',PBPODM.GetPOLineSQL,PBPODM.UpdPOLineSQL) then
                PBAuditDataMod.WriteAudit(2101,Trunc(PurchaseOrder.PONumber),PurchaseOrder.OrderLines[icount].Line,0,0,
                        FloatToStr(PurchaseOrder.PONumber) + '/' + IntToStr(PurchaseOrder.OrderLines[icount].Line)) ;
        HandleJobBagLine(PBPODM.UpdJobBagSQL, icount);
//        UpdateJobBag(icount);
      end;

      SavePartDetails(icount);
      SaveAdditionalDetails(icount);
      PBPODM.SaveQuestions(PurchaseOrder, icount);
      PBPODM.SaveIntNotes(purchaseOrder.PONumber, purchaseOrder.OrderLines[icount]);

      {Save Customer Contact status}
      SaveCustomerContactStatus(icount);

      purchaseOrder.OrderLines[icount].DocumentList.Save;

      if (FFuncMode = poAdd) then
      begin
        //if adding an order and the order refers back to a previous order
        //then the expected life needs to be cleared from the old order
        PBPODM.ClearPOExpectedLife(purchaseOrder.OrderLines[icount].OriginalOrder,
          purchaseOrder.OrderLines[icount].OriginalOrderLine);
      end;
      Close;
    end;
  end;
end;

function TPBMaintPOrdFrm.CalcPOHeadStatus(Sender: TObject): Integer;
var
  TempMinStat, TempMaxStat, icount: Integer;
begin
  {Work out what the PO header status should be based on the line statuses}
  TempMinStat := 9999;
  TempMaxStat := 0;
  for icount := 0 to Pred(PurchaseOrder.OrderLines.Count) do
    with PurchaseOrder.OrderLines[icount] do
    begin
(*      if TempMinStat > POLineStatus then
        TempMinStat := POLineStatus;
      if TempMaxStat < POLineStatus then
        TempMaxStat := POLineStatus;
*)
      if TempMinStat > LineStatus then
        TempMinStat := LineStatus;
      if TempMaxStat < LineStatus then
        TempMaxStat := LineStatus;
    end;
  if TempMinStat = TempMaxStat then
    Result := TempMinStat
  else
    Result := TempMinStat + 5;

  if Result <= 5 then
    Result := 10;
end;

procedure TPBMaintPOrdFrm.HandlePODelivery(Query: TFDQuery; const iOrd,
  iDel: Integer);
var
  i: Integer;
begin
  with Query, PurchaseOrder.OrderLines[iOrd].DeliveryLines[iDel] do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].Clear;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    ParamByName('Line').AsInteger := Line;
    ParamByName('Delivery_No').AsInteger := DeliveryNo;
    if AdHocAddress <> 0 then
      ParamByName('Ad_Hoc_Address').AsInteger := AdHocAddress;
    if Supplier <> 0 then
    begin
      ParamByName('Supplier').AsInteger := Supplier;
      ParamByName('Branch_No').AsInteger := BranchNo;
    end;
    if Rep <> 0 then
      ParamByName('Rep').AsInteger := Rep;
    ParamByName('Qty_To_Deliver').AsFloat := QtyToDeliver;
    ParamByName('Qty_Delivered').AsFloat := QtyDelivered;
    ParamByName('Qty_Invoiced').AsFloat := QtyInvoiced;
    ParamByName('Date_Point').AsDateTime := DatePoint;
    ParamByName('Goods_reqd_by_Customer').AsDateTime := GoodsRequiredbyCust;
    if Customer <> 0 then
    begin
      ParamByName('Customer').AsInteger := Customer;
      ParamByName('Branch_No0').AsInteger := BranchNoZero;
    end;
    ParamByName('No_Of_Boxes').AsInteger := NoOfBoxes;
    { Avoid exception if database not updated }
    if not PurchaseOrder.NoDelInstruct then
      ParamByName('Instructions').AsString := Instructions;
    ParambyName('Deliver_Via_Company').asstring := DeliverViaCompany;

    if PBDateStr(DateDelivActual) = '' then
      ParambyName('Date_Deliv_Actual').clear
    else
      ParambyName('Date_Deliv_Actual').asDateTime := DateDelivActual;

    ParambyName('Delivery_to_Stock').asstring := DeliveryToStock;
    ParamByName('FAO').asString := FAO;
    Parambyname('Company_Branch').asinteger := CompanyBranch;

    ParamByName('Delivery_Weight_Kilos').asfloat := weight;
    if courier <> 0 then
      Parambyname('Courier').asinteger := courier
    else
      Parambyname('Courier').clear;
    if service <> 0 then
      Parambyname('Service_no').asinteger := Service
    else
      Parambyname('Service_no').clear;
    if PackType <> 0 then
      Parambyname('Package_Type').asinteger := PackType
    else
      Parambyname('Package_Type').clear;

    ExecSQL;
  end;
end;

procedure TPBMaintPOrdFrm.HandleCallOffDelivery(Query: TFDQuery; const iOrd,
  iCallOff: Integer);
var
  i: Integer;
begin
  with Query, PurchaseOrder.OrderLines[iOrd].CallOffOrders[iCallOff] do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].Clear;
    if PONumber = 0 then
      ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber + ((iCallOff+1)/100)
    else
      ParamByName('Purchase_Order').asfloat := PONumber;
    ParamByName('Line').AsInteger := PurchaseOrder.OrderLines[iord].Line;
    ParamByName('Delivery_No').AsInteger := CallOffNo;
    if AdHocAddress <> 0 then
      ParamByName('Ad_Hoc_Address').AsInteger := AdHocAddress;
    if DelSupplier <> 0 then
    begin
      ParamByName('Supplier').AsInteger := DelSupplier;
      ParamByName('Branch_No').AsInteger := DelSuppBranchNo;
    end;
    if DelRep <> 0 then
      ParamByName('Rep').AsInteger := DelRep;
    ParamByName('Qty_To_Deliver').AsFloat := OrderQty;
    ParamByName('Qty_Delivered').AsFloat := QtyDelivered;
    ParamByName('Qty_Invoiced').AsFloat := 0.00;
    ParamByName('Date_Point').AsDateTime := RequiredDate;
    ParamByName('Goods_reqd_by_Customer').AsDateTime := RequiredDate;
    if DelCustomer <> 0 then
    begin
      ParamByName('Customer').AsInteger := DelCustomer;
      ParamByName('Branch_No0').AsInteger := DelCustBranchNo;
    end;
    ParamByName('No_Of_Boxes').AsInteger := NoOfBoxes;
    { Avoid exception if database not updated }
    ParamByName('Instructions').AsString := Instructions;

    if PBDateStr(DateDelivActual) = '' then
      ParambyName('Date_Deliv_Actual').clear
    else
      ParambyName('Date_Deliv_Actual').asDateTime := DateDelivActual;

    ParambyName('Delivery_to_stock').asstring := 'N';
    ParamByName('FAO').asString := FAO;

    Parambyname('Company_Branch').asinteger := 0;

    ParamByName('Delivery_Weight_Kilos').asfloat := 0;
    Parambyname('Courier').clear;
    Parambyname('Service_no').clear;
    Parambyname('Package_Type').clear;
    ExecSQL;
  end;
end;

procedure TPBMaintPOrdFrm.UpdatePODelivs;
var
  iOrd, iDel: Integer;
begin
  {Update the purchase order deliveries}
  PBPODM.ResetIsUpdateDelivery(PurchaseOrder.PONumber);
  for iOrd := 0 to Pred(PurchaseOrder.Orderlines.Count) do
    for iDel := 0 to Pred(PurchaseOrder.OrderLines[iOrd].DeliveryLines.Count) do
    begin
      with PBPODM.GetPODelivSQL,
        PurchaseOrder.OrderLines[iOrd].DeliveryLines[iDel] do
      begin
        Close;
        ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
        ParamByName('Line').AsInteger := Line;
        ParamByName('Delivery_No').AsInteger := DeliveryNo;
        Open;
        if EOF then {Add a new PO delivery}
          HandlePODelivery(PBPODM.AddPODelivSQL, iOrd, iDel)
        else {Update existing PO delivery line}
          HandlePODelivery(PBPODM.UpdPODelivSQL, iOrd, iDel);
      end;
    end;
  PBPODM.DeleteDeliveries(PurchaseOrder.PONumber);
  { only those flagged as Update = N }
end;

procedure TPBMaintPOrdFrm.UpdateStockCodes;
var
  iOrd, iCount: Integer;
begin
  {Update the purchase order deliveries}
  PBPODM.DeleteStockCodes(PurchaseOrder.PONumber);
  for icount := 0 to Pred(SelectedLine.StockCodes.Count) do
  begin
    with PBPODM.qryAddStockCode, SelectedLine.StockCodes[icount] do
      begin
        close;
        Parambyname('Purchase_Order').asfloat := PurchaseOrder.PONumber;
        Parambyname('Line').asinteger := 1;
        ParamByName('Stock_code_no').asinteger := (icount+1);
        ParamByName('Form_Reference').asinteger := FormReference;
        ParamByName('Quantity_Ordered').asfloat := QtyOrdered;
        ParamByName('Quantity_Delivered').asfloat := QtyDelivered;
        ExecSQL;
      end;
  end;
end;

procedure TPBMaintPOrdFrm.UpdateCallOffDelivs(const iOrd, iCallOff: integer);
var
  rCallOffOrder: real;
begin
  with PurchaseOrder.OrderLines[iOrd].CallOffOrders[iCallOff] do
    begin
      if PONumber = 0 then
        rCallOffOrder := PurchaseOrder.PONumber + ((iCallOff+1)/100)
      else
        rCallOffOrder := PONumber;
    end;

  {Update the purchase order deliveries}
  PBPODM.ResetIsUpdateDelivery(rCallOffOrder);
  with PBPODM.GetPODelivSQL,
        PurchaseOrder.OrderLines[iOrd].CallOffOrders[iCallOff] do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := rCallOffOrder;
    ParamByName('Line').AsInteger := 1;
    ParamByName('Delivery_No').AsInteger := CallOffNo;
    Open;
    if EOF then {Add a new PO delivery}
      HandleCallOffDelivery(PBPODM.AddPODelivSQL, iOrd, iCallOff)
    else {Update existing PO delivery line}
      HandleCallOffDelivery(PBPODM.UpdPODelivSQL, iOrd, iCallOff);
    end;
  PBPODM.DeleteDeliveries(rCallOffOrder);
  { only those flagged as Update = N }
end;

procedure TPBMaintPOrdFrm.UpdateCallOffs;
var
  i, iOrd, iCallOff: Integer;
begin
  {Update the purchase order call off orders}
  for iOrd := 0 to Pred(PurchaseOrder.Orderlines.Count) do
    for iCallOff := 0 to Pred(PurchaseOrder.OrderLines[iOrd].CallOffOrders.Count) do
    begin
      with PurchaseOrder.OrderLines[iOrd].CallOffOrders[iCallOff] do
      begin
        if PONumber = 0 then {Add a new Call Off PO }
          begin
            with PBPODM.AddSQL do
              begin
                for i := 0 to Pred(Params.Count) do
                  Params[i].Clear;
                Close;
                ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber + ((iCallOff+1)/100);
                ParamByName('Supplier').AsInteger := Supplier;
                ParamByName('Branch_No').AsInteger := SuppBranch;
                ParamByName('Date_Point').AsDateTime := OrderDate;
                ParamByName('Contact_No').AsInteger := SuppContact;
                ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
                if edtAccountManager.text = '' then
                  ParamByName('Office_Contact').AsInteger := frmPBMainMenu.iOperator
                else
                  ParamByName('Office_Contact').AsInteger := PurchaseOrder.OfficeContact;
                ParamByName('Purch_Ord_Inv_Method').AsString := 'L';
                ParamByName('Purch_Ord_Head_Status').AsInteger := phAllSenttoSupplier;
                if (CurrDBLUCB.KeyValue <> 0) and (CurrDBLUCB.text <> '') then
                  ParamByName('Currency_Code').AsInteger := CurrDBLUCB.KeyValue
                else
                  ParamByName('Currency_Code').Clear;
                Parambyname('Account_Team').asinteger := PurchaseOrder.AccountTeam;
                Parambyname('Needs_Authorising').asstring := 'N';
                Parambyname('Authorised_by').Clear;
                Parambyname('Authorised_Reason').Clear;
                ExecSQL;
              end;
          end
        else                {Update existing Call Off line}
          begin
            with PBPODM.UpdSQL do
              begin
                for i := 0 to Pred(Params.Count) do
                  Params[i].Clear;
                Close;
                ParamByName('Purchase_Order').asfloat := PONumber;
                ParamByName('Supplier').AsInteger := Supplier;
                ParamByName('Branch_No').AsInteger := SuppBranch;
                ParamByName('Date_Point').AsDateTime := OrderDate;
                ParamByName('Contact_No').AsInteger := SuppContact;
                if edtAccountManager.text = '' then
                  ParamByName('Office_Contact').AsInteger := frmPBMainMenu.iOperator
                else
                  ParamByName('Office_Contact').AsInteger := PurchaseOrder.OfficeContact;
                ParamByName('Purch_Ord_Inv_Method').AsString := 'L';
                ParamByName('Purch_Ord_Head_Status').AsInteger := Status;
                if (CurrDBLUCB.KeyValue <> 0) and (CurrDBLUCB.text <> '') then
                  ParamByName('Currency_Code').AsInteger := CurrDBLUCB.KeyValue
                else
                  ParamByName('Currency_Code').Clear;
                Parambyname('Account_Team').asinteger := PurchaseOrder.AccountTeam;
                Parambyname('Needs_Authorising').asstring := 'N';
                Parambyname('Authorised_by').Clear;
                Parambyname('Authorised_Reason').Clear;
                ExecSQL;
              end;
          end;
        UpdateCallOffLine(iOrd, iCallOff);
        UpdateCallOffDelivs(iOrd, iCallOff);
      end;
    end;
end;

procedure TPBMaintPOrdFrm.UpdateCallOffLine(const iOrd, iCallOff: integer);
var
  i: Integer;
begin
  {Update the purchase order lines}
  with PBPODM.GetPOLineSQL, PurchaseOrder.OrderLines[iOrd].CallOffOrders[iCallOff] do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].Clear;
    Close;
    if PONumber = 0 then
      ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber + ((iCallOff+1)/100)
    else
      ParamByName('Purchase_Order').asfloat := PONumber;
    ParamByName('Line').AsInteger := 1;
    Open;
    if EOF then { Add a new PO line and associated records }
      begin
        HandleCallOffLine(PBPODM.AddPOLineSQL, iOrd, iCallOff);
        SaveCallOffPartDetails(iOrd, iCallOff);
      end
      else
      begin {Update a PO line}
        HandleCallOffLine(PBPODM.UpdPOLineSQL, iOrd, iCallOff);
      end;
    Close;
    end;
end;

procedure TPBMaintPOrdFrm.DetsGrpBoxClick(Sender: TObject);
begin
  if PurchaseOrder.POHeadStatus > phCreated then
    MessageDlg('You can''t change the purchase order header because some lines '
      + 'have been sent to the supplier', mtError, [mbOK], 0);
end;

procedure TPBMaintPOrdFrm.ShowLineGrid(Sender: TObject);
begin
  ViewBitBtn.Enabled := PurchaseOrder.OrderLines.Count > 0;
  LineDelBitBtn.Enabled := PurchaseOrder.OrderLines.Count > 1;
(*  StatusBar1.Panels[2].text := IntToStr(PurchaseOrder.OrderLines.Count) + ' Order Line';
  if PurchaseOrder.OrderLines.Count <> 1 then
    StatusBar1.Panels[2].text := StatusBar1.Panels[2].text + 's';
*)
  if PurchaseOrder.OrderLines.Count > 0 then
    FSelectedLineIndex := 0
  else
    FSelectedLineIndex := -1;
  SetAbilities;
end;

procedure TPBMaintPOrdFrm.SelectionChanged;
begin
  if (PurchaseOrder.OrderLines.Count > 0) then
    FillTabSheets;
end;

procedure TPBMaintPOrdFrm.LineAddBitBtnClick(Sender: TObject);
begin
(*  { Is there any more room ? }
  if PurchaseOrder.OrderLines.NextLineNumber < 1 then
    MessageDlg('Maximum number of lines already on this order', mtError,
      [mbAbort], 0)
  else
    CallLineMaintScreen(poAdd);
*)
end;

procedure TPBMaintPOrdFrm.LineChgBitBtnClick(Sender: TObject);
begin
  if (SelectedLine.POLineStatus >= plSalesInvoiceRaised) then
    if MessageDlg('This line has been invoiced - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;

    CallLineMaintScreen(poChange);
end;

procedure TPBMaintPOrdFrm.LineDelBitBtnClick(Sender: TObject);
begin
  if (SelectedLine.POLineStatus >= plSalesInvoiceRaised) then
    MessageDlg('This line has been invoiced' +
      ', you cannot delete it', mtError, [mbOK], 0)
  else
    if MessageDlg('Delete the current order line details?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        PurchaseOrder.OrderLines[SelectedLineIndex].Free;
        PurchaseOrder.OrderLines.Delete(SelectedLineIndex);
        ShowLineGrid(Self);
        SelectionChanged;
      end;
end;

procedure TPBMaintPOrdFrm.CallLineMaintScreen(sTempFuncMode: Char);
var
  bTempOK, bBoxNo: Boolean;
  OrderLine: TOrderLine;
  iOrder: Integer;
begin
  if sTempFuncMode = poAdd then
  begin
    iOrder := PurchaseOrder.OrderLines.NextLineNumber;
    OrderLine := TOrderLine.Create;
    OrderLine.Line := iOrder;
    OrderLine.POLineStatus := plNotYetSent;
  end
  else
    OrderLine := SelectedLine.Clone;
  PBMaintPOrdLineFrm := TPBMaintPOrdLineFrm.Create(Self);
  try
    PBMaintPOrdLineFrm.FuncMode := sTempFuncMode;
    PBMaintPOrdLineFrm.PONumber := PurchaseOrder.PONumber;
    PBMaintPOrdLineFrm.OrderLine := OrderLine;
    PBMaintPOrdLineFrm.ShowModal;
    bTempOK := PBMaintPOrdLineFrm.bOK;
    bBoxNo := PBMaintPOrdLineFrm.FormsPerBoxChange;
  finally
    PBMaintPOrdLineFrm.Free;
  end;
  if bTempOK then
  begin
    if sTempFuncMode = poAdd then
      begin
        PurchaseOrder.OrderLines.Add(OrderLine);
      end
    else
      if sTempFuncMode = poChange then
      begin
        PurchaseOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        {Update the Delivery detail Box Qtys if Forms per Box has changed}
        if bBoxNo then
          UpdateDelivery;
        OrderLine.Free;
      end
      else { Must be delete }
      begin
        OrderLine.Free;
        PurchaseOrder.OrderLines[SelectedLineIndex].Free;
        PurchaseOrder.OrderLines.Delete(SelectedLineIndex);
      end;
    ShowLineGrid(Self);
    SelectionChanged;
  end
  else
    OrderLine.Free;
  CheckOK(Self);
end;

procedure TPBMaintPOrdFrm.UpdateDelivery;
var
  DeliveryLine: TDeliveryLine;
  i, iDelivery, inx: integer;
begin
  for i:= 0 to pred(Selectedline.deliverylines.count) do
    begin
      FSelectedDeliveryIndex := i ;
      DeliveryLine := SelectedDelivery.Clone;

      with DeliveryLine do
        begin
        if Selectedline.deliverylines.count = 1 then
          begin
            QtytoDeliver := selectedLine.Quantity;
            DatePoint := selectedLine.GoodsRequired;
            GoodsRequiredbyCust := selectedLine.GoodsRequiredByCust;
            if QtyDelivered <> 0 then
              QtyDelivered := QtytoDeliver;
          end;

//        if FormsperBoxChange then
        NoofBoxes := GetNumberofBoxes(selectedline.FormsperBox,QtyToDeliver);

        iDelivery := DeliveryNo;
        end;

      inx := selectedline.DeliveryLines.IndexFromDelNo(iDelivery);
      Selectedline.DeliveryLines[inx].Free;
      Selectedline.DeliveryLines.Delete(inx);

      Selectedline.DeliveryLines.Add(DeliveryLine)
    end;
    ShowDelivGrid(Self);

    FormsperBoxChange := false;
end;

function TPBMaintPOrdFrm.GetNumberofBoxes(sFormsperBox: string; iQty: real):integer;
var
  iBoxes: integer;
begin
  {Try and determine how many boxes if Adding Delivery}
  try
    iBoxes := PBIntStr(PBFloatStr(iQty)) div strtoint(sFormsperBox);
    if iBoxes < 1 then
      result := 0
    else
      result := iBoxes;
  except
    Result := 0
  end;
end;

procedure TPBMaintPOrdFrm.SetLineDetails;
var
  OrderLine: TOrderLine;
begin
  sOriginalProofStatus := SelectedLine.ProofStatus;;
  OrderLine := SelectedLine.Clone;
  {Re-activate the lookup SQLs}
  with PBPODM do
  begin
    if (FFuncMode = poRestrict) or (FFuncMode = poInvoiced) then
      begin
        PriceUnitSRC.DataSet := GetOrigPriceUnitSQL;
        GetOrigPriceUnitSQL.Active := False;
        GetOrigPriceUnitSQL.Active := True;
      end
    else
      begin
        if GetProdTypePUnits(Orderline.ProductType) then
          PriceUnitSRC.DataSet := qryGetProdTypePriceUnit
        else
          begin
            PriceUnitSRC.DataSet := GetPriceUnitSQL;
            GetPriceUnitSQL.Active := False;
            GetPriceUnitSQL.Active := True;
          end;
      end;

    qryFSCClaim.Active := False;
    qryFSCClaim.Active := True;

    GetProofStatSQL.Active := False;
    GetProofStatSQL.Active := True;

    qryVatCode.Active := false;
    qryVatCode.Active := true;

    qryJobType.Active := false;
    qryJobType.Active := true;
  end;
  LoadOrderLine;
  ProofsReqChkBoxClick(Self);
  stsbrDetails.Panels[0].text := 'Status: '+PBPODM.GetStatusDescr(OrderLine.POLineStatus);
  if OrderLine.Enquiry > 0 then
    stsbrDetails.Panels[1].text := 'Original Enquiry No. ' +
      PBIntStr(OrderLine.Enquiry)
  else
    stsbrDetails.Panels[1].text := '';
end;

procedure TPBMaintPOrdFrm.SetNewLineDetails;
var
  OrderLine: TOrderLine;
  iOrder: Integer;
begin
  iOrder := PurchaseOrder.OrderLines.NextLineNumber;
  OrderLine := TOrderLine.Create;
  OrderLine.Line := iOrder;
  OrderLine.POLineStatus := plNotYetSent;
  OrderLine.CalloffInvoicedUpfront := 'N';

  PurchaseOrder.OrderLines.Add(OrderLine);
  with PBPODM do
  begin
    GetPriceUnitSQL.Active := False;
    GetPriceUnitSQL.Active := True;

    qryFSCClaim.active := False;
    qryFSCClaim.active := true;
    
    GetProofStatSQL.Active := False;
    GetProofStatSQL.Active := True;

    qryVatCode.active := false;
    qryVatCode.active := true;

    qryJobType.active := false;
    qryJobType.active := true;
  end;

  SetNewOrderLine;
  ShowLineGrid(self);
end;

procedure TPBMaintPOrdFrm.SetNewOrderLine;
begin
  {Empty details}
  SuppDescEdit.Text := '';
  SuppRefEdit.Text := '';
  SuppJobRefEdit.Text := '';
  CustNameEdit.Text := '';
  RepEdit.Text := '';
  CustDescEdit.Text := '';
  edtDescReference.text := '';
  CustRefEdit.Text := '';
  edtAltPurchaseOrder.Text := '';
  FormRefEdit.Text := '';
  StockRefEdit.Text := '';
  FormsperboxEdit.Text := '';
(*  ReqByDateEdit.Text := PBDateStr(date);
  CustReqDateEdit.Text := PBDateStr(date);
  EdtLifeExp.Text := DateToStr(Now+365);
*)
  ReqByDateEdit.Text := '';
  CustReqDateEdit.Text := '';
  EdtLifeExp.Text := '';
//  ExpectedLifeSpinEdit.Value := 52;
  ProdTypeEdit.Text := '';
  DepthEdit.Text := '';
  WidthEdit.Text := '';
  OrderUnitDBLCB.KeyValue := 0;
  SellUnitDBLCB.KeyValue := 0;
  ContactCombo.Items.Clear;
  ProofsReqChkBox.Checked := False;
  ProofsDateEdit.Text := '';
  OrderQtyMemo.Text := '0';
  OrdQtyMemo.Text := '0';
  InvoiceQtyMemo.text := '0';
  DeliverQtyMemo.Text := '0';
  QtyMemo.Text := '0';
  OrdPriceMemo.Text := '0.000';
  SellPriceMemo.Text := '0.000';
  TotOrderMemo.Text := '0.00';
  TotSellMemo.Text := '0.00';
  PercProfMemo.Text := '0.00';
  ProfMemo.Text := '0.00';
  OrdChrgMemo.Text := '0.00';
  SlsChrgmemo.Text := '0.00';
end;

procedure TPBMaintPOrdFrm.UpdateOrderLine;
begin
  with SelectedLine do
  begin
    AltPurchaseOrder := edtAltPurchaseOrder.Text;
    SuppliersDesc := SuppDescEdit.Text;
    SupplierReference := SuppRefEdit.Text;
    SupplierJobRef := SuppJobRefEdit.Text;
    CustomersDesc := CustDescEdit.Text;
    DescriptiveRef := edtDescReference.text;
    CustOrderNo := CustRefEdit.Text;
    GoodsRequired := PBDateStr(ReqByDateEdit.Text);
    GoodsRequiredbyCust := PBDateStr(CustReqDateEdit.Text);
    if (self.edtLifeExp.text <> '') and (self.CustReqDateEdit.Text <> '') then
    begin
      ExpectedLife := trunc(StrToDate(self.edtLifeExp.text) -
                            StrToDate(self.CustReqDateEdit.Text));
    end
    else
    begin
      ExpectedLife := 0;
    end;
    //ExpectedLife := ExpectedLifeSpinEdit.Value;
    ProofRequired := ProofsReqChkBox.Checked;
    ProofDate := PBDateStr(ProofsDateEdit.Text);
    if ProofStatDBLUCB.text = '' then
      ProofStatus := ''
    else
      ProofStatus := ProofStatDBLUCB.KeyValue;

    Quantity := PBFloatStr(OrderQtyMemo.Text);
    OrdQtyMemo.Text := PBFloatStr(OrderQtyMemo.Text);

    OrderPrice := PBFloatStr(OrdPriceMemo.Text);
    ListPrice := 0.00;
    SellingPrice := PBFloatStr(SellPriceMemo.Text);

    try
      FSCClaim := dblkpFSCClaim.KeyValue;
    except
      FSCClaim := 0;
    end;

    FSCMixed := spnFSCMix.Value;

    if OrderUnitDBLCB.keyvalue <> 0 then
      OrderUnit := OrderUnitDBLCB.KeyValue;
    if SellUnitDBLCB.keyvalue <> 0 then
      SellUnit := SellUnitDBLCB.KeyValue;
    FormsPerBox := FormsPerBoxEdit.Text;
    Depth := PBFloatStr(DepthEdit.Text);
    DepthUnit := Unit1.Text;
    Width := PBFloatStr(WidthEdit.Text);
    WidthUnit := Unit2.Text;
    ArtWork := ArtEdit.Text;
    Numbering := NumberingEdit.Text;
    NoOfPlateChanges := PlateChangeSpin.Value;
    if ContactCombo.ItemIndex >= 0 then
      CustomerContact :=
        integer(ContactCombo.Items.Objects[ContactCombo.ItemIndex]);
    if ONHoldchkBox.checked then
      OnHold := 'Y'
    else
      OnHold := 'N';
    try
      VatCode := dblkpVatRate.keyvalue;
    except
      VatCode := 0;
    end;

    NoOfSets := SetsEdit.text;
    try
      JobType := dblkpJobType.keyvalue
    except
      JobType := 0;
    end;

    if chkbxFileCopies.checked then
      begin
        FileCopiesReceived := date;
        FileCopiesReceivedBy := frmPBMainMenu.iOperator;
        FileCopiesReceivedName := PBPODM.GetOfficeContact(FileCopiesReceivedBy);
      end
    else
      begin
        FileCopiesReceived := 0;
        FileCopiesReceivedBy := 0;
        FileCopiesReceivedName := '';
      end;
  end;
end;

procedure TPBMaintPOrdFrm.CreateDelivery;
var
  aLine: TDeliveryLine;
begin
  aLine := TDeliveryLine.Create;
  with aLine do
  begin
    Line := SelectedLine.Line;
    DeliveryNo := 1;
    QtyToDeliver := PBFloatStr(OrderQtyMemo.Text);
    DatePoint := SelectedLine.GoodsRequired;
    GoodsRequiredByCust := SelectedLine.GoodsRequiredByCust;
    NoOfBoxes := GetNumberofBoxes(SelectedLine.FormsPerBox,QtyToDeliver);
    Customer := SelectedLine.Customer;
    BranchNoZero := SelectedLine.BranchNo;
    if DefaultDeliveryViaCompany then
      DeliverViaCompany := 'Y'
    else
      DeliverViaCompany := 'N';
  end;
  SelectedLine.DeliveryLines.Add(aLine);
end;

procedure TPBMaintPOrdFrm.CreateQuestions;
var
  aQuestion: TQuestion;
begin
  { Add all questions for this product type. }
  with PBPODM.AnyQuestions do
  begin
    Close;
    ParamByName('Product_Type').AsInteger := SelectedLine.ProductType;
    Open;
    while not EOF do
    begin
      aQuestion := TQuestion.Create;
      with aQuestion do
      begin
        ProductType := SelectedLine.ProductType;
        QuestionNo := FieldByName('Question').AsInteger;
        QuestionText := FieldByName('Question_Text').AsString;
        PromptType := FieldByName('Prompt_type').AsString;
      end;
      SelectedLine.Questions.Add(aQuestion);
      Next;
    end;
    Close;
  end;
end;

procedure TPBMaintPOrdFrm.LoadOrderLine;
var
  sText : string;
  RequiredDate: TDateTime;
begin
  with SelectedLine do
  begin
    SuppDescEdit.Text := SuppliersDesc;
    SuppRefEdit.Text := SupplierReference;
    FormsPerBoxEdit.Text := FormsPerBox;
    SuppJobRefEdit.Text := SupplierJobRef;
    CustNameEdit.Text := PBPODM.GetCustName(Customer)+'/'+PBPODM.GetCustBranchName(Customer, BranchNo);
    ContactComboDropDown(nil);
    sText := PBPODM.GetCustContactName(Customer, BranchNo, CustomerContact);
    ContactCombo.Itemindex := ContactCombo.Items.IndexOf(stext);
    CustDescEdit.Text := CustomersDesc;
    edtDescReference.Text := DescriptiveRef;
    CustRefEdit.Text := CustOrderNo;
    edtAltPurchaseOrder.text := AltPurchaseOrder;
    FormRefEdit.Text := PBPODM.GetFormRef(FormReference);
    StockRefEdit.Text := PBPODM.GetStockRef(FormReference);
    FormDescEdit.Text := PBPODM.GetFormDesc(FormReference);

    {Goods required by Supplier date - set to blank if not a valid date}
    if GoodsRequired < 1 then
      ReqByDateEdit.Text := ''
    else
      ReqByDateEdit.Text := DateToStr(GoodsRequired);

    {Goods required by customer date - set to blank if not a valid date}
    if GoodsRequiredbyCust < 1 then
      begin
        CustReqDateEdit.Text := '';
        RequiredDate := date+1;
      end
    else
      begin
        CustReqDateEdit.Text := DateToStr(GoodsRequiredbyCust);
        RequiredDate := PBDateStr(CustReqDateEdit.text);
      end;

    if ExpectedLife <> 0 then
      self.edtLifeExp.Text:= DateToStr(RequiredDate+ExpectedLife)
    else
      self.edtLifeExp.Text:= '';

    ExpectedLifeSpinEdit.Value := ExpectedLife;
    if ProductType = 0 then
      ProdTypeEdit.Text := ''
    else
      ProdTypeEdit.Text := PBPODM.GetProdTypeDesc(ProductType)+'/'+PBPODM.GetProdTypeCategory(ProductType);

    iOldProductType := ProductType;

(*    if Costcentre <> '' then
      edtCostCentre.Text := PBPODM.GetCostCentre(Customer, BranchNo, CostCentre, CostCentreLevel)
    else
      edtCostCentre.Text := '';
*)
    edtCostCentre.Text := CostCentre;
    
    dblkpFSCClaim.KeyValue := FSCClaim;
    spnFSCMix.Value := round(FSCMixed);
    
    RepEdit.Text := PBPODM.GetRepDesc(Rep);
    ProofsReqChkBox.Checked := ProofRequired;
    if ProofDate < 1 then { unassigned }
      ProofsDateEdit.Text := ''
    else
      ProofsDateEdit.Text := DateToStr(ProofDate);
    OrderQtyMemo.Text := FormatQty(Quantity);
    mmOrdQtyInvTab.text := OrderQtyMemo.Text;
    lblOrdQtyStockUsage.caption := formatfloat('#,###,##0',Quantity);
    InvoiceQtyMemo.Text := FormatAnyQty(QtyInvoiced);
    OrdQtyMemo.Text := FormatQty(Quantity);
    OrdPriceMemo.Text := FormatMoneyTo3DP(OrderPrice);
    SellPriceMemo.Text := FormatMoneyTo3DP(SellingPrice);
    OrderUnitDBLCB.KeyValue := OrderUnit;
    SellUnitDBLCB.KeyValue := SellUnit;

    {If adding, check whether to default the VAT code}
    if FuncMode = 'A' then
      begin
        if dmBroker.DefaultVatCode then
          dblkpVatRate.keyvalue := VATCode;
      end
    else
      dblkpVatRate.keyvalue := VATCode;

    dblkpJobType.keyvalue := JobType;
    if ProofStatus = '' then
      begin
        ProofStatDBLUCB.KeyValue := 0;
        edtProofStatusDate.Text := '';
      end
    else
      begin
        ProofStatDBLUCB.KeyValue := ProofStatus;
        edtProofStatusDate.Text := PBDateStr(ProofStatusDate);
      end;
    DepthEdit.Text := PBFloatStr(Depth);
    if DepthUnit = '' then
      DepthUnit := cMillimetres;
    Unit1.Text := DepthUnit;
    WidthEdit.Text := PBFloatStr(Width);
    if WidthUnit = '' then
      WidthUnit := cMillimetres;
    Unit2.Text := WidthUnit;
    ArtEdit.Text := Artwork;
    NumberingEdit.Text := Numbering;
    SetsEdit.text := NoOfSets;
    btnJobBag.visible := (JobBagNumber <> 0);
    if JobBagNumber <> 0 then
      begin
        stsbrDetails.Panels[2].text := 'Included in Job Bag: '+inttostr(JobbagNumber);
        btnJobBag.caption := 'Job Bag '+inttostr(JobbagNumber);
      end;

    if not btnJobBag.Visible then
      begin
        chkbxAuthorised.Left := 8;
        lblAuthorisedBy.Left := 8;
        btnAuthNotes.Left := chkbxAuthorised.Left + chkbxAuthorised.width + 5;
      end;

    if OnHold = 'Y' then
      OnHoldChkBox.checked := true
    else
      OnHoldChkBox.checked := false;

    {Set the File Copies check box}
    if FileCopiesReceived <> 0 then
      begin
        chkbxFileCopies.checked := true;
        chkbxFileCopies.caption := 'File Copies Received ' + PBDateStr(FileCopiesReceived) + ' - ' + FileCopiesReceivedName;
      end
    else
      begin
        chkbxFileCopies.checked := false;
        chkbxFileCopies.caption := 'File Copies Received';
      end;

    chkbxMake2Invoice.visible := ((PBPODM.GetInvoiceUpfront(OriginalOrder,OriginalOrderLine) = 'Y') and (frac(PurchaseOrder.PONumber) <> 0));
    chkbxMake2Invoice.enabled := (POLineStatus <> 30);
    chkbxMake2Invoice.checked := not (CallOffInvoicedUpfront = 'Y');

    chkbxInvoiceBeforeDelivery.visible := (DeliveryLines.TotalDelivered = 0) or
                                          (DeliveryLines.TotalDelivered > selectedline.QtyInvoiced);
    chkbxInvoiceBeforeDelivery.enabled := (POLineStatus < 30);
    chkbxInvoiceBeforeDelivery.checked := InvoiceBeforeDelivery;

//    chkbxClearedFunds.visible := chkbxInvoiceBeforeDelivery.visible;
    chkbxClearedFunds.Checked := (CashSale = 'Y');

    PlateChangeSpin.Value := NoOfPlateChanges;

    SetJobTypeAbilities;
    Getcharges;
    CalcTotalOrderValue;
    CalcTotalSalesValue;
    CalcProfitValue;

  end;
end;

procedure TPBMaintPOrdFrm.ShowDelivGrid(Sender: TObject);
var
  TempCount,
    iNoOfDelivDets: Integer;
begin
  bDelivsBalance := True;
  iNoOfDelivDets := 0;
  DelivDetsStringGrid.Cells[0, 0] := 'Deliver To';
  DelivDetsStringGrid.Cells[1, 0] := 'Qty';
  DelivDetsStringGrid.Cells[0, 1] := '';
  DelivDetsStringGrid.Cells[1, 1] := '';
  if Assigned(SelectedLine) then
    for TempCount := 0 to Pred(SelectedLine.DeliveryLines.Count) do
    begin
      iNoOfDelivDets := iNoOfDelivDets + 1;
      DelivDetsStringGrid.Cells[0, iNoOfDelivDets] :=
        GetDelivDescrLine(TempCount);
      DelivDetsStringGrid.Cells[1, iNoOfDelivDets] :=
        FormatQty(SelectedLine.DeliveryLines[TempCount].QtyToDeliver);
    end;
  if iNoOfDelivDets > 1 then
    DelivDetsStringGrid.RowCount := iNoOfDelivDets + 1
  else
    DelivDetsStringGrid.RowCount := 2;
  DelivChgBitBtn.Enabled := iNoOfDelivDets > 0;
  DelivDelBitBtn.Enabled := iNoOfDelivDets > 0;
  DelivsSelectBitBtn.Enabled := iNoOfDelivDets > 0;

  CallOffAddBtn.Enabled := Trunc(SelectedLine.DeliveryLines.TotalStock) > 0;
  NoCallOffEdit.readonly := Trunc(SelectedLine.DeliveryLines.TotalStock) = 0;
  chkInvoiceUpfront.visible := Trunc(SelectedLine.DeliveryLines.TotalStock) <> 0;
(*  chkInvoiceUpfront.enabled := (Trunc(SelectedLine.DeliveryLines.TotalStock) > 0) and
                               (SelectedLine.POLineStatus < plSomeInvoiceRaised);
*)
  chkInvoiceUpfront.enabled :=  (Trunc(SelectedLine.DeliveryLines.TotalStock) > 0) and
                                (dmBroker.CanOverridePaidStock(frmPBMainMenu.iOperator)) and
                                (selectedLine.POLineStatus <> plSomeInvoiceRaised) and
                                (selectedLine.POLineStatus <> plSalesInvoiceRaised);

  if iNoOfDelivDets > 0 then
  begin
    FSelectedDeliveryIndex := 0;
    QtyMemo.Text := IntToStr(Trunc(SelectedLine.DeliveryLines.Total));
    DeliverQtyMemo.Text := QtyMemo.Text;
    StockQtyMemo.Text := IntToStr(Trunc(SelectedLine.DeliveryLines.TotalStock));
    InStockQtyMemo.text := IntToStr(trunc(InstockTotal));
  end
  else
  begin
    FSelectedDeliveryIndex := -1;
    QtyMemo.Text := '0';
    DeliverQtyMemo.Text := '0';
    StockQtyMemo.Text := '';
  end;
//  gbDelInstruct.Visible := not PurchaseOrder.NoDelInstruct;
  if Assigned(SelectedDelivery) then
    ShowDeliveryDetails(SelectedDelivery)
//    DelInstructMemo.Text := SelectedDelivery.Instructions
  else
    DelInstructMemo.Lines.Clear;

  if frac(PurchaseOrder.PONumber) > 0 then
    begin
      DelivAddBitBTn.enabled := false;
      DelivDelBitBtn.enabled := false;
    end;

  if QtyMemo.text <> OrderQtyMemo.text then
    begin
      QtyMemo.Font.Color := clRed;
      OrdQtyMemo.Font.Color := clRed;
      DeliverQtyMemo.Font.Color := clRed;
      OrderQtyMemo.Font.Color := clRed;
      bDelivsBalance := false
    end
  else
    begin
      QtyMemo.Font.Color := clBlack;
      OrdQtyMemo.Font.Color := clBlack;
      DeliverQtyMemo.Font.Color := clBlack;
      OrderQtyMemo.Font.Color := clBlack;
      bDelivsBalance := true;
    end;

end;

function TPBMaintPOrdFrm.GetDelivDescrLine(iTempRow: Integer): string;
begin
  {Use the GetDelivDesc function to get the details for a specific row}
  with SelectedLine.DeliveryLines[iTempRow], PBPODM do
    if AdHocAddress <> 0 then
      Result := GetDelivDescr(AdHocAddress, 0, 0)
    else
      if Supplier <> 0 then
        Result := GetDelivDescr(Supplier, PurchaseOrder.BranchNo, 1)
      else
        if Rep <> 0 then
          Result := GetDelivDescr(Rep, 0, 2)
        else
          if Customer <> 0 then
            Result := GetDelivDescr(Customer, BranchNoZero, 3)
          else {Get COMPANY address}
            Result := GetDelivDescr(0, 0, 4);
end;

procedure TPBMaintPOrdFrm.DelivAddBitBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  if (SelectedLine.DeliveryLines.count = 1) and OneDeliveryOnly then
    MessageDlg('This job type is limited to only one delivery', mtError,
      [mbAbort], 0)
  else
  if SelectedLine.DeliveryLines.NextLineNumber < 1 then
    MessageDlg('Maximum number of deliveries already on this order', mtError,
      [mbAbort], 0)
  else
    CallDelivMaintScreen(poAdd);
end;

procedure TPBMaintPOrdFrm.DelivChgBitBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  CallDelivMaintScreen(poChange);
end;

procedure TPBMaintPOrdFrm.DelivDelBitBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  if (SelectedLine.DeliveryLines.count = 1) then
    begin
      MessageDlg('You cannot delete the only delivery line on this order.', mtError,
        [mbAbort], 0);
      exit;
    end;
  CallDelivMaintScreen(poDelete);
end;

procedure TPBMaintPOrdFrm.CallDelivMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  DeliveryLine: TDeliveryLine;
  inx, iDelivery: Integer;
begin
  FSelectedDeliveryIndex := DelivDetsStringGrid.row-1;
  if sTempFuncMode = poAdd then
  begin
    DeliveryLine := TDeliveryLine.Create;
    DeliveryLine.QtyToDeliver := SelectedLine.Quantity - SelectedLine.DeliveryLines.Total;
    DeliveryLine.Line := SelectedLine.Line;
    DeliveryLine.DeliveryNo := SelectedLine.DeliveryLines.NextLineNumber;
    DeliveryLine.DatePoint := SelectedLine.GoodsRequired;
    DeliveryLine.GoodsRequiredbyCust := SelectedLine.GoodsRequiredbyCust;
    DeliveryLine.FAO := self.ContactCombo.Text;
    if SelectedLine.DeliveryLines.Count > 0 then
      begin
        DeliveryLine.customer := SelectedLine.DeliveryLines[SelectedLine.DeliveryLines.count - 1].customer;
        DeliveryLine.BranchNoZero := SelectedLine.DeliveryLines[SelectedLine.DeliveryLines.count - 1].BranchNoZero;
        DeliveryLine.Supplier := SelectedLine.DeliveryLines[SelectedLine.DeliveryLines.count - 1].Supplier;
        DeliveryLine.BranchNo := SelectedLine.DeliveryLines[SelectedLine.DeliveryLines.count - 1].BranchNo;
        DeliveryLine.AdHocAddress := SelectedLine.DeliveryLines[SelectedLine.DeliveryLines.count - 1].AdhocAddress;
        DeliveryLine.Rep := SelectedLine.DeliveryLines[SelectedLine.DeliveryLines.count - 1].Rep;
        DeliveryLine.FAO := SelectedLine.DeliveryLines[SelectedLine.DeliveryLines.count - 1].FAO;
      end;
  end
  else
    DeliveryLine := SelectedDelivery.Clone;
  PBMaintPOrdLineDelivFrm := TPBMaintPOrdLineDelivFrm.Create(Self);
  try
    PBMaintPOrdLineDelivFrm.FuncMode := sTempFuncMode;
    PBMaintPOrdLineDelivFrm.PONumber := PurchaseOrder.PONumber;
    PBMaintPOrdLineDelivFrm.DeliveryLine := DeliveryLine;
    PBMaintPOrdLineDelivFrm.NoDelInstruct := PurchaseOrder.NoDelInstruct;
    PBMaintPOrdLineDelivFrm.FormsPerBox := SelectedLine.FormsPerBox;
    PBMaintPOrdLineDelivFrm.CanDeliverToStock := self.CanDeliverToStock;
    PBMaintPOrdLineDelivFrm.CourierCode := PurchaseOrder.Courier;
    PBMaintPOrdLineDelivFrm.ShowModal;
    bTempOK := PBMaintPOrdLineDelivFrm.bOK;
  finally
    PBMaintPOrdLineDelivFrm.Free;
  end;
  if bTempOK then
  begin
    iDelivery := DeliveryLine.DeliveryNo;
    if sTempFuncMode = poAdd then
      begin
        SelectedLine.DeliveryLines.Add(DeliveryLine);
        if (Trunc(SelectedLine.DeliveryLines.TotalStock) <> 0) and (
          isCustInvUpfrnt(PurchaseOrder.OrderLines[0].Customer) = true)  and
          (FFuncMode = poAdd) then
          ChkInvoiceUpfront.Checked := true;
      end;


    inx := SelectedLine.DeliveryLines.IndexFromDelNo(iDelivery);

    {If this is the first delivery line then set the required dates to the ones on the delivery page - if not already set}
    if (iDelivery = 1) and CharInSet(sTempFuncMode, [poAdd, poChange]) then
      begin
        {Supplier Required date}
        if (ReqbyDateEdit.text = '') then
          ReqbyDateEdit.text := PBDateStr(SelectedLine.DeliveryLines[inx].DatePoint);

        {Customer Required date}
        if (CustReqDateEdit.text = '') then
          CustReqDateEdit.text := PBDateStr(SelectedLine.DeliveryLines[inx].GoodsRequiredbyCust);
      end;

    if CharInSet(sTempFuncMode, [poChange, poDelete]) then
    begin
      SelectedLine.DeliveryLines[inx].Free;
      SelectedLine.DeliveryLines.Delete(inx);
    end;
    if sTempFuncMode = poChange then
      begin
        SelectedLine.DeliveryLines.Add(DeliveryLine);
        if (Trunc(SelectedLine.DeliveryLines.TotalStock) <> 0) and (
          isCustInvUpfrnt(PurchaseOrder.OrderLines[0].Customer) = true) and
          (ffuncMode = poAdd) then
          ChkInvoiceUpfront.Checked := true;
      end
    else
      if sTempFuncMode = poDelete then
        DeliveryLine.Free;
    ShowDelivGrid(Self);
    DelivDetsStringGridClick(self);
  end
  else
    DeliveryLine.Free;

  ShowLineGrid(nil);

  chkInvoiceUpfront.enabled :=  (Trunc(SelectedLine.DeliveryLines.TotalStock) > 0) and
                                (dmBroker.CanOverridePaidStock(frmPBMainMenu.iOperator));

end;

procedure TPBMaintPOrdFrm.DelivDetsStringGridDblClick(Sender: TObject);
begin
  if DelivChgBitBtn.Enabled then
    if FFuncMode <> poView then
      DelivChgBitBtnClick(Self)
    else
      DelivsSelectBitBtnClick(Self);
end;

procedure TPBMaintPOrdFrm.DelivDetsStringGridDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  {The following is code extracted from the Delphi Info Base}
  {Display the Columns Right justified in the cells}
  with (Sender as TStringGrid) do
  begin
    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if (ACol = 1) then
    begin
      if gdFixed in State then
        Canvas.Brush.Color := DelivDetsStringGrid.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end
    else
    begin
      if gdFixed in State then
        Canvas.Brush.Color := DelivDetsStringGrid.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end;
  end;
end;

procedure TPBMaintPOrdFrm.UpdatePOExtChg;
var
  icount: Integer;
begin
  {Update the purchase order extra charges}
  PBPODM.ResetIsUpdateCharge(PurchaseOrder.PONumber);
  for icount := 0 to Pred(SelectedLine.ExtraCharges.Count) do
  begin
    with PBPODM.GetExtChgSQL, SelectedLine.ExtraCharges[icount] do
    begin
      Close;
      ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
      ParamByName('Line').AsInteger := Line;
      ParamByName('Additional_Charge').AsInteger := AdditionalCharge;
      Open;
      if EOF then
      begin
        {Add a new PO extra charge}
        with PBPODM.AddExtChgSQL do
        begin
          ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
          ParamByName('Line').AsInteger := Line;
          ParamByName('Additional_Charge').AsInteger := AdditionalCharge;
          ParamByName('Details').AsString := Details;
          ParamByName('Amount').AsFloat := Amount;
          ParamByName('Quotation_Price').AsFloat := QuotationPrice;
          ParamByName('Vat_Code').asInteger := VatCode;
          ExecSQL;
        end;
      end
      else
        {Update a PO extra charge}
        with PBPODM.UpdExtChgSQL do
        begin
          ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
          ParamByName('Line').AsInteger := Line;
          ParamByName('Additional_Charge').AsInteger := AdditionalCharge;
          ParamByName('Details').AsString := Details;
          ParamByName('Amount').AsFloat := Amount;
          ParamByName('Quotation_Price').AsFloat := QuotationPrice;
          ParamByName('Vat_Code').asinteger := VatCode;
          ExecSQL
        end;
    end;
  end;
  PBPODM.DeleteCharges(PurchaseOrder.PONumber);
  { only those flagged as Is_Update = N }
end;

procedure TPBMaintPOrdFrm.ShowExtChgGrid(Sender: TObject);
var
  TempCount,
    iNoOfExtChg: Integer;
begin
  iNoOfExtChg := 0;
  ExtChgDetsStringGrid.Cells[0, 0] := 'Details';
  ExtChgDetsStringGrid.Cells[1, 0] := 'Amount';
  ExtChgDetsStringGrid.Cells[2, 0] := 'Vat Rate';
  ExtChgDetsStringGrid.Cells[0, 1] := '';
  ExtChgDetsStringGrid.Cells[1, 1] := '';
  ExtChgDetsStringGrid.Cells[2, 1] := '';
  if Assigned(SelectedLine) then
    for TempCount := 0 to Pred(SelectedLine.ExtraCharges.Count) do
      with SelectedLine.ExtraCharges[TempCount] do
      begin
        iNoOfExtChg := iNoOfExtChg + 1;
        ExtChgDetsStringGrid.Cells[0, iNoOfExtChg] := Details;
        ExtChgDetsStringGrid.Cells[1, iNoOfExtChg] := FormatMoney(Amount);
        ExtChgDetsStringGrid.Cells[2, iNoofExtChg] := PBPODM.GetVatRate(VatCode);
      end;
  if iNoOfExtChg > 1 then
    ExtChgDetsStringGrid.RowCount := iNoOfExtChg + 1
  else
    ExtChgDetsStringGrid.RowCount := 2;
  ExtChgDetsStringGrid.Row := 1;
  ExtChgChgBitBtn.Enabled := iNoOfExtChg > 0;
  ExtChgDelBitBtn.Enabled := iNoOfExtChg > 0;
  ExtChgSelectBitBtn.Enabled := iNoOfExtChg > 0;
  if iNoOfExtChg > 0 then
  begin
    FSelectedChargeIndex := 0;
    ValueMemo.Text := FormatMoney(SelectedLine.ExtraCharges.Total);
  end
  else
  begin
    FSelectedChargeIndex := -1;
    ValueMemo.Text := '';
  end;
end;

procedure TPBMaintPOrdFrm.ExtChgAddBitBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  if SelectedLine.ExtraCharges.NextChargeNumber < 1 then
    MessageDlg('Maximum number of extra charges already on this order',
      mtError, [mbAbort], 0)
  else
    CallExtChgMaintScreen(poAdd);
end;

procedure TPBMaintPOrdFrm.ExtChgChgBitBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  CallExtChgMaintScreen(poChange);
end;

procedure TPBMaintPOrdFrm.ExtChgDelBitBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  CallExtChgMaintScreen(poDelete);
end;

procedure TPBMaintPOrdFrm.CallExtChgMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  ExtraCharge: TExtraCharge;
  inx, iCharge: Integer;
begin
  PBMaintPOrdLineExtChgFrm := TPBMaintPOrdLineExtChgFrm.Create(Self);
  if sTempFuncMode = poAdd then
  begin
    ExtraCharge := TExtraCharge.Create;
    ExtraCharge.Line := SelectedLine.Line;
    ExtraCharge.AdditionalCharge := SelectedLine.ExtraCharges.NextChargeNumber;
    ExtraCharge.vatcode := PurchaseOrder.OrderLines[0].VATCode;
//    .OrderLines.Lines[selectedline].VATCode;
  end
  else
  begin
    ExtraCharge := SelectedCharge.Clone;

  end;

  try
    PBMaintPOrdLineExtChgFrm.ExtraCharge := ExtraCharge;
    PBMaintPOrdLineExtChgFrm.FuncMode := sTempFuncMode;
    PBMaintPOrdLineExtChgFrm.ShowModal;
    bTempOK := PBMaintPOrdLineExtChgFrm.bOK;


    if bTempOK then
    //bTemp OK.
    begin
      if sTempFuncMode = poAdd then
      begin
        SelectedLine.ExtraCharges.Add(ExtraCharge);
      end;

      iCharge := ExtraCharge.AdditionalCharge;
      inx := SelectedLine.ExtraCharges.IndexFromChargeNo(iCharge);
      if CharInSet(sTempFuncMode, [poChange, poDelete]) then
      begin
        SelectedLine.ExtraCharges[inx].Free;
        SelectedLine.ExtraCharges.Delete(inx);
      end;

      if sTempFuncMode = poChange then
      begin
        SelectedLine.ExtraCharges.Add(ExtraCharge);
//        inx := SelectedLine.ExtraCharges.IndexFromChargeNo(iCharge);
      end;

      if sTempFuncMode = poDelete then
      begin
        ExtraCharge.Free;
//        inx := 0;
      end;

      ShowExtChgGrid(Self);
    end
    else
      ExtraCharge.Free;
  finally
    PBMaintPOrdLineExtChgFrm.Free;
  end;

  getCharges;
  OrderQtyMemoChange(Self);
end;

procedure TPBMaintPOrdFrm.ExtChgDetsStringGridDblClick(Sender: TObject);
begin
  if ExtChgChgBitBtn.Enabled then
    if (FFuncMode <> poView) and (FFuncMode <> poRestrict) then
      ExtChgChgBitBtnClick(Self)
    else
      ExtChgSelectBitBtnClick(Self);
end;

procedure TPBMaintPOrdFrm.ExtChgDetsStringGridDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  {The following is code extracted from the Delphi Info Base}
  {Display the Columns Right justified in the cells}
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (Row <> 0) and (Col <> 0) then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, Cells[Col, Row]);
    end;

    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if (ACol = 1) or (ACol = 2) then
    begin
        if gdFixed in State then
        Canvas.Brush.Color := ExtChgDetsStringGrid.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
  end
    else
    begin
      if gdFixed in State then
        Canvas.Brush.Color := ExtChgDetsStringGrid.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end;
  end;
end;

procedure TPBMaintPOrdFrm.ShowCallOffGrid(Sender: TObject);
var
  TempCount,
  iNoOfCallOffs: Integer;
begin
  NoCallOffedit.text := SelectedLine.NoOfCallOffs;
  if SelectedLine.InvoiceUpfront = 'Y' then
    chkInvoiceUpfront.checked := true
  else
    chkInvoiceUpfront.checked := false;

  iNoOfCallOffs := 0;
  sgCallOff.Cells[0, 0] := 'Order';
  sgCallOff.Cells[1, 0] := 'Date';
  sgCallOff.Cells[2, 0] := 'Delivery to';
  sgCallOff.Cells[3, 0] := 'Quantity';
  sgCallOff.Cells[0, 1] := '';
  sgCallOff.Cells[1, 1] := '';
  sgCallOff.Cells[2, 1] := '';
  sgCallOff.Cells[3, 1] := '';
  if Assigned(SelectedLine) then
    for TempCount := 0 to Pred(SelectedLine.CallOffOrders.Count) do
      with SelectedLine.CallOffOrders[TempCount] do
      begin
        iNoOfCallOffs := iNoOfCallOffs + 1;
        if PONumber = 0 then
          sgCallOff.Cells[0, iNoOfCallOffs] := '<New Order>'
        else
          sgCallOff.Cells[0, iNoOfCallOffs] := PBFloatStr(PONumber);
        sgCallOff.Cells[1, iNoOfCallOffs] := PBDateStr(RequiredDate);
        sgCallOff.Cells[2, iNoOfCallOffs] := GetCallOffDescrLine(TempCount);
        sgCallOff.Cells[3, iNoOfCallOffs] := PBintStr(OrderQty);
      end;
  if iNoOfCallOffs > 1 then
    sgCallOff.RowCount := iNoOfCallOffs + 1
  else
    sgCallOff.RowCount := 2;
  CallOffChgBtn.Enabled := iNoOfCallOffs > 0;
  CallOffDelBtn.Enabled := iNoOfCallOffs > 0;

//  CallOffAddBtn.Enabled := Trunc(SelectedLine.DeliveryLines.TotalStock) > 0;

  if iNoOfCallOffs > 0 then
  begin
    FSelectedCallOffIndex := 0;
    SchedQtyMemo.Text := IntToStr(Trunc(SelectedLine.CallOffOrders.Total));
    DelivQtyMemo.Text := IntToStr(Trunc(SelectedLine.CallOffOrders.TotalDelivered));
    InStockQtyMemo.text := IntToStr(trunc(InstockTotal));
  end
  else
  begin
    FSelectedCallOffIndex := -1;
    SchedQtyMemo.Text := '0';
    DelivQtyMemo.Text := '0';
//    InStockQtyMemo.text := '0';
  end;
  DisplayCallOffButtons(sgCallOff.row);
end;

function TPBMaintPOrdFrm.InStockTotal: Double;
begin
  Result :=  Trunc(SelectedLine.DeliveryLines.TotalinStock) - Trunc(SelectedLine.CallOffOrders.TotalDelivered)
end;

function TPBMaintPOrdFrm.GetCallOffDescrLine(iTempRow: Integer): string;
begin
  {Use the GetDelivDesc function to get the details for a specific row}
  with SelectedLine.CallOffOrders[iTempRow], PBPODM do
    if AdHocAddress <> 0 then
      Result := GetDelivDescr(AdHocAddress, 0, 0)
    else
      if DelSupplier <> 0 then
        Result := GetDelivDescr(DelSupplier, DelSuppBranchNo, 1)
      else
        if DelRep <> 0 then
          Result := GetDelivDescr(DelRep, 0, 2)
        else
          if DelCustomer <> 0 then
            Result := GetDelivDescr(DelCustomer, DelCustBranchNo, 3)
          else {Get COMPANY address}
            Result := GetDelivDescr(0, 0, 4);
end;

procedure TPBMaintPOrdFrm.DelivDetsStringGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
(*  FSelectedDeliveryIndex := Row - 1;
  if Assigned(SelectedDelivery) then
    ShowDeliveryDetails(SelectedDelivery)
  else
    DelInstructMemo.Lines.Clear;
*)
end;

procedure TPBMaintPOrdFrm.ShowDeliveryDetails(SelectedDelivery: TDeliveryLine);
var
  iCompanyBranch, iCustomer, iCustomerBranch, iSupplier, iSupplierBranch, iRep, iAdHocAddress: integer;
begin
  with SelectedDelivery do

  begin
    with PBPODM do
    begin
      GetDelivDescr(0, 0, 4);
      DeliverViaChk.Caption := 'Deliver via ' + AddrSRC.DataSet.fieldbyname('Name').asstring;
      DeliverViaChk.visible := true;
    end;

    DatePointEdit.Text := PBDateStr(DatePoint);
    CustReqDelDateEdit.text := PBDateStr(GoodsRequiredbyCust);
    DeliveryDateEdit.Text := PBDateStr(DateDelivActual);
    QtyToDeliverMemo.Text := PBFloatStr(QtyToDeliver);
    QtyDeliveredMemo.Text := PBFloatStr(QtyDelivered);
    QtyInvoicedMemo.Text := PBFloatStr(QtyInvoiced);

    {Set the Number of Boxes field}
    NoofBoxesMemo.Text := PBIntStr(NoofBoxes);
    iCompanyBranch := CompanyBranch;
    iCustomer := Customer;
    iCustomerBranch := BranchNoZero;
    iSupplier := Supplier;
    iSupplierBranch := BranchNo;
    iRep := Rep;
    iAdHocAddress := AdHocAddress;
    if iCustomer <> 0 then
      AddrTypeRadGrp.ItemIndex := 3
    else
    if iSupplier <> 0 then
      AddrTypeRadGrp.ItemIndex := 1
    else
    if iRep <> 0 then
      AddrTypeRadGrp.ItemIndex := 2
    else
    if iAdHocAddress <> 0 then
      AddrTypeRadGrp.ItemIndex := 0
    else
      AddrTypeRadGrp.ItemIndex := 4;

    {Diplay the address on-screen}
    with PBPODM do
      case AddrTypeRadGrp.ItemIndex of
        0: GetDelivDescr(iAdHocAddress, 0, 0);
        1: GetDelivDescr(iSupplier, iSupplierBranch, 1);
        2: GetDelivDescr(iRep, 0, 2);
        3: GetDelivDescr(iCustomer, iCustomerBranch, 3);
        4: GetDelivDescr(0, iCompanyBranch, 4);
      end;
    with PBPODM.AddrSRC.DataSet do
    begin
      NameEdit.Text := FieldByName('Name').AsString;
      if (AddrTypeRadGrp.ItemIndex = 1) or (AddrTypeRadGrp.ItemIndex = 3) or (AddrTypeRadGrp.ItemIndex = 4) then
        BranchNameEdit.Text := FieldByName('Branch_Name').AsString;

      if (AddrTypeRadGrp.ItemIndex = 3) or (AddrTypeRadGrp.ItemIndex = 0) then
      begin
        edtFAO.Text := selectedDelivery.FAO;
        self.edtFAO.Visible := true;
        self.lblFAO.Visible := true;
      end
      else
      begin
        self.edtFAO.Visible := false;
        self.lblFAO.Visible := false;
      end;
        
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      Countyedit.Text := fieldbyname('County').asstring;
    end;

    if DeliverViaCompany = 'Y' then
      DeliverViaChk.Checked := true;

    if DeliveryToStock = 'Y' then
      DeliveryToStockChk.Checked := true
    else
      DeliveryToStockChk.Checked := false;
         with PBPODM do
      case AddrTypeRadGrp.ItemIndex of
      0: DelivNotes := GetAddressSpecInstr(atAdHoc, AdHocAddress, 0);
      1: DelivNotes := '';
      2: DelivNotes := '';
      3: DelivNotes := GetAddressSpecInstr(atCustomer, Customer, BranchNo);
      4: DelivNotes := GetAddressSpecInstr(atCompany, 0, CompanyBranch);
      end;
     if DelivNotes = '' then
      DelInstructMemo.Text := Instructions
     else
      DelInstructMemo.Text := DelivNotes + #13#10 + Instructions ;
    end;
end;

procedure TPBMaintPOrdFrm.ExtChgDetsStringGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  FSelectedChargeIndex := ARow - 1;
end;

procedure TPBMaintPOrdFrm.FormCreate(Sender: TObject);
begin
  {Activate the invoice method SQL}
  PBPODM := TPBPODM.Create(Self);
  dmPBDocObjects := TdmPBDocObjects.Create(self);
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  with PBPODM do
  begin
    GetInvMethSQL.Close;
    GetInvMethSQL.Open;
    GetCurrSQL.Close;
    GetCurrSQL.Open;
    OperatorSQL.Close;
    OperatorSQL.Open;

    OrderUnitDBLCB.ListSource := PriceUnitSRC;
    SellUnitDBLCB.ListSource := PriceUnitSRC;
  end;
  JobBagNo := 0;

  if not dmBroker.UseAccountManagers then
    begin
      lblAccountTeam.Visible := false;
      edtAccountTeam.Visible := false;
    end;

  CanDeliverToStock := true;
  DefaultDeliveries := dmBroker.defaultdeliveries;
  DefaultDeliveryViaCompany := dmBroker.DefaultDeliveryViaCompany;
  { Create objects we need }
  PurchaseOrder := TPurchaseOrder.Create(PBPODM);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintPOrdFrm.SetupDetails(Sender: TObject);
begin
  if FFuncMode = poAdd then
    Caption := 'Add a new purchase order'
  else
    if (FFuncMode = poChange) or (FFuncMode = poRestrict) or (FFuncMode = poInvoiced) then
      Caption := 'Change a purchase order'
    else
      if FFuncMode = poDelete then
        Caption := 'Delete a purchase order'
      else
        if FFuncMode = poView then
          Caption := 'View purchase order'
        else
          if FFuncMode = poCopy then
            Caption := 'Copy a purchase order'
          else
            if FFuncMode = poRepeat then
              Caption := 'Repeat a purchase order';
  {Setup the details for the form}
  if (FFuncMode = poAdd) then
  begin
    {Empty details}
    POrdNomemo.Text := '<New Order>';
    SupplierEdit.Text := '';
    PurchaseOrder.Clear;
    DateEdit.Text := PBDateStr(date);
    ContactEdit.Text := '';
    PurchaseOrder.OfficeContact := frmPBMainMenu.iOperator;
(*    if PurchaseOrder.OfficeContact <> 0 then
      edtAccountManager.text := PurchaseOrder.OurContact;
    edtAccountTeam.Text := PBPODM.GetOpsAccountTeamName(PurchaseOrder.OfficeContact);
*)
    if dmBroker.UseAccountManagers then
      begin
        edtAccountManager.Text := '';
        edtAccountTeam.Text := '';
      end
    else
      begin
        if PurchaseOrder.OfficeContact <> 0 then
          edtAccountManager.text := frmPBMainMenu.sOperator_Name;
      end;

    chkbxAuthorised.checked := false;
    lblAuthorisedby.caption := '';
  end
  else
  begin
    if FFuncMode <> poAddToExisting then
    begin
      if FFuncMode = poAddToExisting then
          FFuncMode := poChange;
      PurchaseOrder.PONumber := PurchaseOrderNo;
      PurchaseOrder.FuncMode := FFuncMode;
      PBPODM.LoadPOFromDatabase(PurchaseOrder);
      if (FFuncMode = poCopy) or
           (FFuncMode = poRepeat) then
        begin
          FFuncMode := poAdd;
          POrdNomemo.Text := '<New Order>';
          PurchaseOrder.FuncMode := FFuncMode;
          PurchaseOrder.DatePoint := date;
          DateEdit.Text := PBDateStr(date);
          selectedLine.SupplierReference := '';
          SuppRefEdit.Text := '';
          selectedLine.SupplierJobRef := '';
          SuppJobRefEdit.Text := '';
          if dmBroker.UseAccountManagers then
          begin
            edtAccountManager.Text := '';
            edtAccountTeam.Text := '';
          end
          else
          begin
            if PurchaseOrder.OfficeContact <> 0 then
              edtAccountManager.text := frmPBMainMenu.sOperator_Name;
          end;
          chkbxAuthorised.checked := false;
          lblAuthorisedby.caption := '';
        end
      else
        begin
          if PurchaseOrder.NeedsAuthorising then
            POrdNoMemo.Text := 'N/A'
          else
            POrdNoMemo.Text := floatToStr(PurchaseOrder.PONumber);

          DateEdit.Text := DateToStr(PurchaseOrder.DatePoint);
          if PurchaseOrder.OfficeContact <> 0 then
            edtAccountManager.Text := PurchaseOrder.OurContact;
          edtAccountTeam.Text := PurchaseOrder.AccountTeamName;
          chkbxAuthorised.checked := (PurchaseOrder.AuthorisedBy <> 0);
          lblAuthorisedby.caption := '';
          if PurchaseOrder.AuthorisedBy <> 0 then
            begin
              chkbxAuthorised.Caption := chkbxAuthorised.Caption + ' by ' + PurchaseOrder.AuthorisedByName;
              lblAuthorisedBy.caption := chkbxAuthorised.Caption;
              chkbxAuthorised.enabled := false;
              edtAltPurchaseOrder.Enabled := false;
            end;

          {create the relevant PO folder directory}
          dmBroker.CreatePurchaseOrderDocDirectory(floattostr(PurchaseOrder.PONumber));
        end;

      SupplierEdit.Text := PurchaseOrder.SupplierName+'/'+PurchaseOrder.BranchName;
      ContactEdit.Text := PurchaseOrder.TheirContact;
      CurrDBLUCB.KeyValue := PurchaseOrder.CurrencyCode;
    end
    else
      begin
        PBPODM.LoadPOFromDataBase(PurchaseOrder);
      end;
  end;
  {Enable or disable the buttons}
  ClearTabSheets;
  SetAbilities;
  if (FFuncMode <> poDelete) then
    OKBitBtn.Caption := 'Save'
  else
    OKBitBtn.Caption := 'Delete';
  CheckNotes(self);
  CheckOK(Self);
{  SelSupBtn.Enabled := ((PurchaseOrder.POHeadStatus <= phAllSentToSupplier) or (FFuncMode = poAdd));
  SelContactBtn.Enabled := ((PurchaseOrder.POHeadStatus <= phAllSentToSupplier) or (FFuncMode = poAdd));
}
  SelDateBtn.Enabled := ((PurchaseOrder.POHeadStatus <= phAllSentToSupplier) or (FFuncMode = poAdd));
  DateEdit.Enabled := ((PurchaseOrder.POHeadStatus <= phAllSentToSupplier) or (FFuncMode = poAdd));
  DelivsSelectBitBtn.Visible := (FFuncMode = poView);
  ExtChgSelectBitBtn.Visible := (FFuncMode = poView);
  OKBitBtn.Visible := (FFuncMode <> poView);
  bOK := False;
  bDisableLineNameChangeEvent := False;
end;

procedure TPBMaintPOrdFrm.FormActivate(Sender: TObject);
var
  custStatus: string;
begin
  if not FActiveDone then
  try
    CreatePartDetailsGrid;
    SetNCAHeaders;
    SetStockCodeHeaders;

    pnlFSCClaim.Visible := dmBroker.UseFSCClaim;
    pnlVersions.Visible := dmBroker.AllowStockVersions;

    ShowLineGrid(Self);
    SelectionChanged;
    OrderLinePage.ActivePage := tsGeneral;

    if (FuncMode = poAdd) and (PurchaseOrder.OrderLines.count = 0) then
      SetNewLineDetails;

    CheckOK(Self);
  finally
    FActiveDone := True;
  end;
  CostCentreLevel := dmBroker.GetCustomerCostCentreLevel(selectedLine.Customer);

  pnlCostCentre.visible := (CostCentreLevel <> '');

  if SelectedLine.LineStatus < 25 then
    custStatus := dmBroker.GetCustomerStatus(SelectedLine.Customer);
(*  if PBPODM.IsCustomerOnStop(SelectedLine.Customer) then
    MessageDlg('This Customer is currently ON STOP', mtWarning,[mbOk], 0);
*)
  if (custStatus = 'S') or (custStatus = 'B') then
    MessageDlg(cOnStop, mtWarning,[mbOk], 0)
  else
  if custStatus = 'O' then
    MessageDlg(cOverDue, mtWarning,[mbOk], 0);

  if (self.FuncMode = poRepeat)
    or (self.FuncMode = poCopy)
    or (self.FuncMode = poAdd) then
    begin
      self.CheckForCustomerNotes;
      self.CheckProductTypeInvoicing(selectedline.productType);
    end;

  {Screen access control. Use the default setting set in PBLUPOrd} ;
  dmBroker.ScreenAccessControl(Self, '', frmPBMainMenu.iOperator, 0, 0) ;
end;

procedure TPBMaintPOrdFrm.CreatePartDetailsGrid;
begin
  with sgPartDetails do
    begin
      cells[0,0] := 'Part';
      cells[1,0] := 'Heading';
      cells[2,0] := 'Colour';
      cells[3,0] := 'Weight';
      cells[4,0] := 'Brand';
      cells[5,0] := 'Material';
      cells[6,0] := 'Inks/Face';
      cells[7,0] := 'Inks/Reverse';
      cells[8,0] := 'Left Perf Type';
      cells[9,0] := 'Right Perf Type';
      cells[10,0] := 'Left Perf Width';
      cells[11,0] := 'Right Perf Width';
    end;
end;

procedure TPBMaintPOrdFrm.SetNCAHeaders;
begin
    {NCA header details}
  sgNCADetails.cells[0,0] := 'Doc';
  sgNCADetails.cells[1,0] := 'Reference';
  sgNCADetails.cells[2,0] := 'Date';
  sgNCADetails.cells[3,0] := 'Reason';
  sgNCADetails.cells[4,0] := 'Status';
  sgNCADetails.cells[5,0] := 'Raising Dept';
  sgNCADetails.cells[6,0] := 'Source Dept';
  sgNCADetails.cells[7,0] := 'QA Approved';
  sgNCADetails.cells[8,0] := 'QA Date';
  sgNCADetails.cells[9,0] := 'Cost';

end;

procedure TPBMaintPOrdFrm.SetStockCodeHeaders;
begin
  {Stock Code details}
  sgVersions.cells[0,0] := 'Form Reference';
  sgVersions.cells[1,0] := 'Stock Reference';
  sgVersions.cells[2,0] := 'Description';
  sgVersions.cells[3,0] := 'Quantity';
  sgVersions.cells[4,0] := 'Delivered';
end;

procedure TPBMaintPOrdFrm.SelectBitBtnClick(Sender: TObject);
begin
  CallLineMaintScreen(poView);
end;

procedure TPBMaintPOrdFrm.DelivsSelectBitBtnClick(Sender: TObject);
begin
  CallDelivMaintScreen(poView);
end;

procedure TPBMaintPOrdFrm.ExtChgSelectBitBtnClick(Sender: TObject);
begin
  CallExtChgMaintScreen(poView);
end;

procedure TPBMaintPOrdFrm.ProofsBitBtnClick(Sender: TObject);
begin
  {Activate the proofs screen}
  {Purchase order Print/Fax}
  PBLUProofHistNFrm := TPBLUProofHistNFrm.Create(Self);
  try
    PBLUProofHistNFrm.rpurchord := PurchaseOrder.PONumber;
    PBLUProofHistNFrm.ipurchordline := SelectedLine.Line;
    PBLUProofHistNFrm.bAllow_Upd := true;
    PBLUProofHistNFrm.bAllow_Chg := True;
    PBLUProofHistNFrm.bAllow_Add := True;
    PBLUProofHistNFrm.bAllow_Del := True;
    PBLUProofHistNFrm.ShowModal;
    SelectedLine.ProofStatus := PBPODM.GetCurrentProofStatus(PurchaseOrder.PONumber,SelectedLine.Line);
    if SelectedLine.ProofStatus <> '' then
      begin
        ProofStatDBLUCB.KeyValue := SelectedLine.ProofStatus;
        edtProofStatusDate.Text := pbdatestr(PBPODM.GetCurrentProofStatusDate(PurchaseOrder.PONumber,SelectedLine.Line))
      end;
  finally
    PBLUProofHistNFrm.Free;
  end;
end;

procedure TPBMaintPOrdFrm.DelNarrs(Sender: TObject);
var
  icount: Integer;
begin
  for icount := 0 to Pred(PurchaseOrder.OrderLines.Count) do
    if PurchaseOrder.OrderLines[icount].Narrative <> 0 then
      PBPODM.DeleteNarrative(PurchaseOrder.OrderLines[icount].Narrative);
end;

procedure TPBMaintPOrdFrm.CurrClearBitBtnClick(Sender: TObject);
begin
  CurrDBLUCB.KeyValue := 0;
end;

procedure TPBMaintPOrdFrm.DefContact(iTempSupp, iTempBranch: Integer);
begin
  {Default the contact if there is ONLY 1 for the selected supplier}
  with PBPODM.GetSuppContSQL do
  begin
    Close;
    ParamByName('Supplier').AsInteger := iTempSupp;
    ParamByName('Branch_no').AsInteger := iTempBranch;
    Open;
    if RecordCount = 1 then
    begin
      PurchaseOrder.SupplierContactNo := FieldByName('Contact_No').AsInteger;
      ContactEdit.Text := FieldByName('Name').AsString;
    end
    else
    begin
      PurchaseOrder.SupplierContactNo := 0;
      ContactEdit.Text := '';
    end;
  end;
end;

procedure TPBMaintPOrdFrm.FormDestroy(Sender: TObject);
begin
  PBPODM.Free;
  dmPBDocObjects.Free;
  PurchaseOrder.Free;
end;

procedure TPBMaintPOrdFrm.AddOrderLineParts(inx: Integer);
begin
  with PurchaseOrder, OrderLines[inx] do
    if Enquiry <> 0 then
      PBPODM.CopyEnquiryParts(Enquiry, PONumber, LineZero, Line);
end;

procedure TPBMaintPOrdFrm.AddOrderLineAdditionals(inx: Integer);
begin
  with PurchaseOrder, OrderLines[inx] do
    if Enquiry <> 0 then
      PBPODM.CopyEnquiryAdditionals(Enquiry, PONumber, LineZero, Line);
end;

procedure TPBMaintPOrdFrm.AddActivity;
var
  key: integer;
  iActivityType: integer;
  iOriginalActivity: integer;
  iOriginalEnquiryActivity: integer;
  aActivity : TActivity;
  Year, Month, Day, DOW: Word;
  dtDueDate: TDateTime;
begin
  DecodeDateFully(now,Year, Month, Day,DOW);

  case DOW of
    1..5: dtDueDate := incday(now,1);
    6: dtDueDate := incday(now,3);
    7: dtDueDate := incday(now,2);
  end;


  {Check if Enquiry/Quote Activity type already exists}
  {If it does, complete the activity}
  iOriginalEnquiryActivity := 0;
  iActivityType := dmBroker.GetDefaultQuoteActivityType;

  with dmBroker.qryCheckActivity do
    begin
      close;
      ParamByName('Entity_Reference').AsString := trim(inttostr(PurchaseOrder.OrderLines[0].Enquiry));
      ParamByName('Activity_Type').AsInteger := iActivityType;
      ParamByName('Activity_Module').AsInteger := 20;
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      open;

      if recordcount > 0 then
        begin
          if dmBroker.qryCheckActivity.fieldbyname('Original_Activity').asinteger <> 0 then
            iOriginalEnquiryActivity := dmBroker.qryCheckActivity.fieldbyname('Original_Activity').asinteger
          else
            iOriginalEnquiryActivity := dmBroker.qryCheckActivity.fieldbyname('Activity').asinteger;

          iOriginalActivity := dmBroker.qryCheckActivity.fieldbyname('Activity').asinteger;

          dtmdlActivities := TdtmdlActivity.create(self);
          try
            aActivity := TActivity.Create(dtmdlActivities);
            try
              aActivity.DbKey := iOriginalActivity;
              aActivity.LoadFromDB;

              aActivity.Status := 30;
              aActivity.SaveToDB(true);
            finally
              aActivity.free;
            end;
          finally
            dtmdlActivities.free;
          end;
        end;
    end;

  {Now the original activity is out of the way, check whether using proofs and if so has status changed!!}

  {Check to see whether proof status is required and has changed}
  if (PurchaseOrder.OrderLines[0].ProofStatus = '') and frmPBMainMenu.OrderAckReminder then
    begin
      iActivityType := dmBroker.GetDefaultOrderAckActivityType;

      {Check for any existing activities for this type and order}
      with dmBroker.qryCheckActivity do
        begin
          close;
          ParamByName('Entity_Reference').AsString := floattostr(PurchaseOrder.PONumber);
          ParamByName('Activity_Type').AsInteger := iActivityType;
          ParamByName('Activity_Module').AsInteger := 30;
          ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
          open;

          if recordcount > 0 then
            begin
              exit;
            end;
        end;

      {Add new activity}
      dtmdlActivities := TdtmdlActivity.create(self);
      try
        aActivity := TActivity.Create(dtmdlActivities);
        try
          aActivity.DbKey := 0;

          if iActivityType = 0 then
            exit
          else
            aActivity.ActivityType := iActivityType;

          aActivity.AssignedTo := PurchaseOrder.OfficeContact;
          aActivity.Customer := PurchaseOrder.OrderLines[0].Customer;
          aActivity.Branch := PurchaseOrder.OrderLines[0].BranchNo;
          aActivity.Contact := PurchaseOrder.OrderLines[0].CustomerContact;
          aActivity.DateTimeEntered := now;
          aActivity.DueDateTime := dtDueDate;
          aActivity.EntityReference := floattoStr(PurchaseOrder.PONumber);
          aActivity.EntityReferenceDescription := PurchaseOrder.OrderLines[0].CustomersDesc;
          aActivity.Module := 30;
          aActivity.Operator := frmPBMainMenu.iOperator;
          aActivity.Priority := 20;
          aActivity.Reminder := false;
          aActivity.StartDateTime := 0;
          aActivity.Status := 20;
          aActivity.OriginalActivity := iOriginalEnquiryActivity;
          aActivity.Subject := 'Send order acknowledgement ' + floattoStr(PurchaseOrder.PONumber);

          aActivity.SaveToDB(true);
        finally
          aActivity.free;
        end;
      finally
        dtmdlActivities.free;
      end;
    end
  else
  if  (PurchaseOrder.OrderLines[0].ProofStatus <> sOriginalProofStatus) OR
      (PurchaseOrder.OrderLines[0].ProofStatus <> '') AND (FFuncMode = poAdd) AND frmPBMainMenu.ProofReminder then
    begin
      iActivityType := dmBroker.GetDefaultProofActivityType;

      {Check for any existing activities for this type and order}
      with dmBroker.qryCheckActivity do
        begin
          close;
          ParamByName('Entity_Reference').AsString := floattostr(PurchaseOrder.PONumber);
          ParamByName('Activity_Type').AsInteger := iActivityType;
          ParamByName('Activity_Module').AsInteger := 30;
          ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
          open;

          if recordcount > 0 then
          begin
            iOriginalActivity := dmBroker.qryCheckActivity.fieldbyname('Activity').asinteger;

            dtmdlActivities := TdtmdlActivity.create(self);
            try
              aActivity := TActivity.Create(dtmdlActivities);
              try
                aActivity.DbKey := iOriginalActivity;
                aActivity.LoadFromDB;
                aActivity.Status := 30;
                aActivity.SaveToDB(true);
              finally
                aActivity.free;
              end;
            finally
              dtmdlActivities.free;
            end;
          end;
        end;

      if PBPODM.ProofAccepted(PurchaseOrder.OrderLines[0].ProofStatus) and (frmPBMainMenu.OrderAckReminder) then
        begin
          iActivityType := dmBroker.GetDefaultOrderAckActivityType;

          {Add new activity}
          dtmdlActivities := TdtmdlActivity.create(self);
          try
            aActivity := TActivity.Create(dtmdlActivities);
            try
              aActivity.DbKey := 0;

              if iActivityType = 0 then
                exit
              else
                aActivity.ActivityType := iActivityType;

              aActivity.AssignedTo := PurchaseOrder.OfficeContact;
              aActivity.Customer := PurchaseOrder.OrderLines[0].Customer;
              aActivity.Branch := PurchaseOrder.OrderLines[0].BranchNo;
              aActivity.Contact := PurchaseOrder.OrderLines[0].CustomerContact;
              aActivity.DateTimeEntered := now;
              aActivity.DueDateTime := dtDueDate;
              aActivity.EntityReference := floattoStr(PurchaseOrder.PONumber);
              aActivity.EntityReferenceDescription := PurchaseOrder.OrderLines[0].CustomersDesc;
              aActivity.Module := 30;
              aActivity.Operator := frmPBMainMenu.iOperator;
              aActivity.Priority := 20;
              aActivity.Reminder := false;
              aActivity.StartDateTime := 0;
              aActivity.Status := 20;
              if iOriginalEnquiryActivity <> 0 then
                aActivity.OriginalActivity := iOriginalEnquiryActivity
              else
                aActivity.OriginalActivity := iOriginalActivity;
              aActivity.Subject := 'Send order acknowledgement ' + floattoStr(PurchaseOrder.PONumber);

              aActivity.SaveToDB(true);
            finally
              aActivity.free;
            end;
          finally
            dtmdlActivities.free;
          end;
        end
      else
        begin
          if not frmPBMainMenu.ProofReminder then exit;

          iActivityType := dmBroker.GetDefaultProofActivityType;

          dtmdlActivities := TdtmdlActivity.create(self);
          try
            aActivity := TActivity.Create(dtmdlActivities);
            try
              aActivity.DbKey := 0;

              if iActivityType = 0 then
                exit
              else
                aActivity.ActivityType := iActivityType;

              aActivity.AssignedTo := PurchaseOrder.OfficeContact;
              aActivity.Customer := PurchaseOrder.OrderLines[0].Customer;
              aActivity.Branch := PurchaseOrder.OrderLines[0].BranchNo;
              aActivity.Contact := PurchaseOrder.OrderLines[0].CustomerContact;
              aActivity.DateTimeEntered := now;
              aActivity.DueDateTime := dtDueDate;
              aActivity.EntityReference := floattoStr(PurchaseOrder.PONumber);
              aActivity.EntityReferenceDescription := PurchaseOrder.OrderLines[0].CustomersDesc;
              aActivity.Module := 30;
              aActivity.Operator := frmPBMainMenu.iOperator;
              aActivity.Priority := 20;
              aActivity.Reminder := false;
              aActivity.StartDateTime := 0;
              aActivity.Status := 20;
              if iOriginalEnquiryActivity <> 0 then
                aActivity.OriginalActivity := iOriginalEnquiryActivity
              else
                aActivity.OriginalActivity := iOriginalActivity;
              aActivity.Subject := ProofStatDBLUCB.Text + ' ' + floattoStr(PurchaseOrder.PONumber);

              aActivity.SaveToDB(true);
            finally
              aActivity.free;
            end;
          finally
            dtmdlActivities.free;
          end;
        end;
    end;
end;

procedure TPBMaintPOrdFrm.ClearTabSheets;
begin
  { tsParts }
  SameAslbl.Caption := 'Same as Part ';
  { tsAdditional }
  AddNotesMemo.Lines.Clear;
  { tsSuppCustNotes }
  AddDetailsList.Items.Clear;
  AddDetailsMemo.Lines.Clear;
  { tsDelivery }
  QtyMemo.Lines.Clear;
  DeliverQtyMemo.Lines.Clear;
  { tsExtraCharge }
  ValueMemo.Lines.Clear;
  { tsQuestions }
  FreeQuestionComponents;
  Application.ProcessMessages;
end;

procedure TPBMaintPOrdFrm.FillTabSheets;
var
  page1: TTabSheet;
begin
  LockWindowUpdate(Handle);
  try
    OrderLinePage.Hide;
    try
      page1 := OrderLinePage.ActivePage;
      ClearTabSheets;
      SetLineDetails;
      ShowDelivGrid(Self);
      ShowExtChgGrid(Self);
      ShowCallOffGrid(Self);
      FillPartList(0);
      AddNotesMemo.Text := SelectedLine.NarrativeText;
      SetNotesBtns;
      DisplayAdditionalDetails(0);
      DisplayStockCodes;
      SetQuestions;
      if (FFuncMode <> poAdd) and (FFuncMode <> poRepeat) and (FFuncMode <> poCopy) then
        begin
          self.DisplayIntNotes;
          self.DisplayDocumentList;
          self.DisplayInvoiceLists;
          self.DisplayStockUsage;
          self.DisplayStock;
          self.DisplayNonConformDetails;
        end;
      OrderLinePage.ActivePage := page1;
    finally
      OrderLinePage.Show;
    end;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TPBMaintPOrdFrm.FillPartList(const iSelect: Integer);
var
  i: Integer;
begin
  DisplayPartDetails; { To clean out any data showing }
  if SelectedLine <> nil then
    for i := 0 to Pred(SelectedLine.PartDetails.Count) do
      with SelectedLine.PartDetails[i] do
        begin
          with sgPartDetails do
            begin
              if trim(PartDescription) = '' then
                cells[0,i+1] := PartNoStr
              else
                cells[0,i+1] := PartDescription;
              cells[1,i+1] := Heading;
              cells[2,i+1] := PaperColour;
              cells[3,i+1] := PaperWeight;
              cells[4,i+1] := PaperBrand;
              cells[5,i+1] := PaperMaterial;
              cells[6,i+1] := FaceInks;
              cells[7,i+1] := ReverseInks;
              cells[8,i+1] := LeftMarginType;
              cells[9,i+1] := RightMarginType;
              cells[10,i+1] := LeftMarginWidth;
              cells[11,i+1] := RightMarginWidth;
            end;
        end;
  if SelectedLine.PartDetails.Count > 0 then
  begin
    sgPartDetails.rowcount := SelectedLine.PartDetails.Count+1;
  end
  else
    begin
    sgPartDetails.rowcount := 2;
    end;
end;

procedure TPBMaintPOrdFrm.DisplayPartDetails;
var
  icol, irow: integer;
begin
  with sgPartDetails do
    begin
      for irow := 1 to pred(rowcount) do
        for icol := 0 to pred(colcount) do
          begin
            cells[icol,irow] := '';
          end;
    end;
end;

procedure TPBMaintPOrdFrm.AddPartDetails;
var
  aPart: TPartDetail;
  inx, PartNo: Integer;
begin
  if SelectedLine = nil then
    Exit;
  PartNo := SelectedLine.PartDetails.NextPartNumber;
  if PartNo < 1 then
  begin
    MessageDlg('The maximum number of parts have been allocated', mtError,
      [mbOK], 0);
    Exit;
  end;
  aPart := TPartDetail.Create;
  aPart.PartNo := PartNo;
  SelectedLine.PartDetails.Add(aPart);
  inx := SelectedLine.PartDetails.IndexFromPartNo(PartNo);
  FillPartList(inx);
  sgPartDetails.Col := 0;
end;

procedure TPBMaintPOrdFrm.btnDeletePartClick(Sender: TObject);
var
  inx: Integer;
begin
  if (SelectedLine = nil) or (trim(sgPartDetails.cells[0,sgPartDetails.row]) = '') then
    Exit;
  if MessageDlg('Really delete these part details ?', mtConfirmation,
    [mbNo, mbYes], 0) <> mrYes then
    Exit;
  inx := sgPartDetails.Row - 1;
  SelectedLine.PartDetails.Delete(inx);
  FillPartList(inx - 1);
end;

procedure TPBMaintPOrdFrm.SavePartDetails(const inx: Integer);
var
  i: Integer;
begin
  PBPODM.DeletePOPart(PurchaseOrder.PONumber,
    PurchaseOrder.OrderLines[inx].Line);
  for i := 0 to Pred(PurchaseOrder.OrderLines[inx].PartDetails.Count) do
    with PurchaseOrder, OrderLines[inx], PartDetails[i] do
    begin
      with PBPODM.AddPartDetSQL do
      begin
        ParamByName('Purchase_Order').asfloat := PONumber;
        ParamByName('Line').AsInteger := OrderLines[inx].Line;
        ParamByName('Part_No').AsInteger := PartNo;
        ParamByName('Heading').AsString := Heading;
        ParamByName('Same_as_part').AsInteger := SameAsPart;
        ParamByName('Paper_Brand').AsString := PaperBrand;
        ParamByName('Paper_Material').AsString := PaperMaterial;
        ParamByName('Paper_Weight').AsString := PaperWeight;
        ParamByName('Paper_Colour').AsString := PaperColour;
        ParamByName('Face_Inks').AsString := FaceInks;
        ParamByName('Reverse_Inks').AsString := ReverseInks;
        ParamByName('Left_Margin_type').AsString := LeftMarginType;
        ParamByName('Left_Margin_Width').AsString := LeftMArginWidth;
        ParamByName('Right_Margin_Type').AsString := RightMarginType;
        ParamByName('Right_Margin_Width').AsString := RightMarginWidth;
        ParamByName('No_of_plate_changes').AsInteger := PlateChanges;
        ParamByName('Part_Description').AsString := PartDescription;
        ExecSQL;
      end;
    end;
end;

procedure TPBMaintPOrdFrm.SaveCustomerContactStatus(const inx: Integer);
var
  i: Integer;
begin
  with PurchaseOrder.OrderLines[inx] do
    begin
      with PBPODM.UpdateContactStatusSQL do
      begin
        close;
        ParamByName('Customer').asinteger := Customer;
        ParamByName('Branch_no').AsInteger := BranchNo;
        ParamByName('Contact_no').AsInteger := CustomerContact;
        ExecSQL;
      end;
    end;
end;

procedure TPBMaintPOrdFrm.SaveCallOffPartDetails(const inx, iCallOff: Integer);
var
  i: Integer;
  rCallOffOrder: real;
begin
  with PurchaseOrder.OrderLines[inx].CallOffOrders[iCallOff] do
    begin
      if PONumber = 0 then
        rCallOffOrder := PurchaseOrder.PONumber + ((iCallOff+1)/100)
      else
        rCallOffOrder := PONumber;
    end;

  PBPODM.DeletePOPart(rCallOffOrder,1);

  for i := 0 to Pred(PurchaseOrder.OrderLines[inx].PartDetails.Count) do
    with PurchaseOrder, OrderLines[inx], PartDetails[i], OrderLines[inx].CallOffOrders[iCallOff] do
    begin
      with PBPODM.AddPartDetSQL do
      begin
        ParamByName('Purchase_Order').asfloat := rCallOffOrder;
        ParamByName('Line').AsInteger := 1;
        ParamByName('Part_No').AsInteger := PartNo;
        ParamByName('Heading').AsString := Heading;
        ParamByName('Same_as_part').AsInteger := SameAsPart;
        ParamByName('Paper_Brand').AsString := PaperBrand;
        ParamByName('Paper_Material').AsString := PaperMaterial;
        ParamByName('Paper_Weight').AsString := PaperWeight;
        ParamByName('Paper_Colour').AsString := PaperColour;
        ParamByName('Face_Inks').AsString := FaceInks;
        ParamByName('Reverse_Inks').AsString := ReverseInks;
        ParamByName('Left_Margin_type').AsString := LeftMarginType;
        ParamByName('Left_Margin_Width').AsString := LeftMArginWidth;
        ParamByName('Right_Margin_Type').AsString := RightMarginType;
        ParamByName('Right_Margin_Width').AsString := RightMarginWidth;
        ParamByName('No_of_plate_changes').AsInteger := PlateChanges;
        ParamByName('Part_Description').AsString := PartDescription;
        ExecSQL;
      end;
    end;
end;

procedure TPBMaintPOrdFrm.SetAbilities;
var
  bEnabled: Boolean;
  i: Integer;
begin
  { Set control accessibility depending on mode and whether there's any
    data to do anything with. }
//  DetsGrpBox.Enabled := not (FuncMode in [poDelete, poView]);
  bEnabled := (PurchaseOrder.OrderLines.Count > 0) and
    not CharInSet(FuncMode, [poDelete, poView]);
  DelivAddBitBtn.Visible := bEnabled;
  DelivChgBitBtn.Visible := bEnabled;
  DelivDelBitBtn.Visible := bEnabled;
  ExtChgFuncGrpBox.Visible := bEnabled;
  gbAddDets.Visible := bEnabled;
{  gbAddNotesFunc.Visible := bEnabled;
}  for i := 0 to Pred(ComponentCount) do
    if Components[i] is TEdit then
      TEdit(Components[i]).Enabled := bEnabled
    else
    if Components[i] is TMemo then
      TMemo(Components[i]).Enabled := bEnabled
    else
    if Components[i] is TSpinEdit then
      TSpinEdit(Components[i]).Enabled := bEnabled
    else
    if Components[i] is TdbLookupComboBox then
      TdbLookupComboBox(Components[i]).Enabled := bEnabled
    else
    if Components[i] is TComboBox then
      TComboBox(Components[i]).Enabled := bEnabled
    else
    if Components[i] is Tcheckbox then
      Tcheckbox(Components[i]).Enabled := bEnabled;

  {Set the Restricted access components}
(*  SellPriceMemo.enabled := not (FuncMode in [poRestrict, poInvoiced]) and
                          ((PurchaseOrder.AuthorisedBy = 0) or (PurchaseOrder.AuthorisedBy = frmPBMainMenu.iOperator));
  SellUnitDBLCB.enabled := SellPriceMemo.enabled;
  ExtChgFuncGrpBox.visible := SellPriceMemo.enabled;
  CustLUbtn.Enabled := not (FuncMode in [poRestrict, poInvoiced]);
  ContactLUbtn.Enabled := CustLUbtn.Enabled;
  RepLUButton.Enabled := CustLUbtn.Enabled;
  ProdTypeBtn.enabled := CustLUbtn.Enabled;
  btnAccountManager.enabled := not (FuncMode in [poRestrict]);

  dblkpJobType.enabled := not(RepCanConvert) or not(CreateFromEnq);
*)

  if bCanChangeInvoicedOrders then
    begin
      SellPriceMemo.enabled := not CharInSet(FuncMode, [poRestrict]) and
                          ((PurchaseOrder.AuthorisedBy = 0) or (PurchaseOrder.AuthorisedBy = frmPBMainMenu.iOperator));
      SellUnitDBLCB.enabled := SellPriceMemo.enabled;
      ExtChgFuncGrpBox.visible := SellPriceMemo.enabled;

      CustLUbtn.Enabled := not CharInSet(FuncMode, [poRestrict]);
      ContactLUbtn.Enabled := CustLUbtn.Enabled;
      RepLUButton.Enabled := CustLUbtn.Enabled;
      ProdTypeBtn.enabled := CustLUbtn.Enabled;
    end
  else
    begin
      SellPriceMemo.enabled := not CharInSet(FuncMode, [poRestrict, poInvoiced]) and
                          ((PurchaseOrder.AuthorisedBy = 0) or (PurchaseOrder.AuthorisedBy = frmPBMainMenu.iOperator));
      SellUnitDBLCB.enabled := SellPriceMemo.enabled;
      ExtChgFuncGrpBox.visible := SellPriceMemo.enabled;

      CustLUbtn.Enabled := not CharInSet(FuncMode, [poRestrict, poInvoiced]);
      ContactLUbtn.Enabled := CustLUbtn.Enabled;
      RepLUButton.Enabled := CustLUbtn.Enabled;
      ProdTypeBtn.enabled := CustLUbtn.Enabled;
    end;

  btnAccountManager.enabled := not CharInSet(FuncMode, [poRestrict]);
  dblkpJobType.enabled := not(RepCanConvert) or not(CreateFromEnq);
end;

procedure TPBMaintPOrdFrm.DisplayAdditionalDetails(const inx: Integer);
var
  i: Integer;
  sTemp: string;
begin
  if (SelectedLine = nil) then
    Exit;
  AddDetailsList.Items.Clear;
  with SelectedLine do
    for i := 0 to Pred(AdditionalDetails.Count) do
      with AdditionalDetails[i] do
      begin
        case FAOFlag of
          adSupplierOnly: sTemp := 'Supplier Only';
          adCustomerOnly: sTemp := 'Customer Only';
          adSupplierAndCustomer: sTemp := 'Both Suppliers and Customers';
        else
          sTemp := 'Unknown';
        end; { case }
        AddDetailsList.Items.Add(sTemp);
      end;
  if AddDetailsList.Items.Count > 0 then
  begin
    AddDetailsList.ItemIndex := inx;
    AddDetailsListClick(nil);
    btnChgSuppCustNotes.Enabled := True;
    btnDelSuppCustNotes.Enabled := True;
  end
  else
  begin
    btnChgSuppCustNotes.Enabled := False;
    btnDelSuppCustNotes.Enabled := False;
  end;
end;

procedure TPBMaintPOrdFrm.AddDetailsListClick(Sender: TObject);
begin
  if (SelectedLine = nil) or (AddDetailsList.ItemIndex < 0) then
    Exit;
  with SelectedLine.AdditionalDetails[AddDetailsList.ItemIndex] do
  begin
    AddDetailsMemo.Text := Detail; { will be NarrativeText eventually }
  end;
end;

procedure TPBMaintPOrdFrm.btnAddSuppCustNotesClick(Sender: TObject);
var
  iNo: Integer;
  anAdd: TAdditionalDetail;
begin
  if SelectedLine = nil then
    Exit;
  iNo := SelectedLine.AdditionalDetails.NextAdditionalNumber;
  if iNo < 0 then
  begin
    MessageDlg('The maximum number of additional details have been added',
      mtError, [mbOK], 0);
    Exit;
  end;
  PBPOAddDtlsFrm := TPBPOAddDtlsFrm.Create(Self);
  try
    anAdd := TAdditionalDetail.Create;
    anAdd.DetailNo := iNo;
    anAdd.Line := SelectedLine.Line;
    PBPOAddDtlsFrm.FuncMode := poAdd;
    PBPOAddDtlsFrm.AdditionalDetail := anAdd;
    if PBPOAddDtlsFrm.ShowModal = mrOK then
    begin
      SelectedLine.AdditionalDetails.Add(anAdd);
      iNo := SelectedLine.AdditionalDetails.IndexFromDetailNo(iNo);
      DisplayAdditionalDetails(iNo);
    end
    else
      anAdd.Free;
  finally
    PBPOAddDtlsFrm.Free;
  end;
end;

procedure TPBMaintPOrdFrm.btnChgSuppCustNotesClick(Sender: TObject);
var
  aDetail: TAdditionalDetail;
begin
  if (SelectedLine = nil) or (AddDetailsList.ItemIndex < 0) then
    Exit;
  aDetail := SelectedLine.AdditionalDetails[AddDetailsList.ItemIndex].Clone;
  PBPOAddDtlsFrm := TPBPOAddDtlsFrm.Create(Self);
  try
    PBPOAddDtlsFrm.AdditionalDetail := aDetail;
    PBPOAddDtlsFrm.FuncMode := poChange;
    if PBPOAddDtlsFrm.ShowModal = mrOK then
      SelectedLine.AdditionalDetails[AddDetailsList.ItemIndex].Assign(aDetail);
    aDetail.Free;
    DisplayAdditionalDetails(AddDetailsList.ItemIndex);
  finally
    PBPOAddDtlsFrm.Free;
  end;
end;

procedure TPBMaintPOrdFrm.SaveAdditionalDetails(const inx: Integer);
var
  i: Integer;
begin
  PBPODM.DeletePOAdditional(PurchaseOrder.PONumber,
    PurchaseOrder.OrderLines[inx].Line);
  for i := 0 to Pred(PurchaseOrder.OrderLines[inx].AdditionalDetails.Count) do
    with PurchaseOrder, OrderLines[inx], AdditionalDetails[i] do
    begin
      with PBPODM.AddAddDetsSQL do
      begin
        ParamByName('Purchase_Order').asfloat := PONumber;
        ParamByName('Line').AsInteger := OrderLines[inx].Line;
        ParamByName('Additional_Details').AsInteger := DetailNo;
        ParamByName('FAO_Flag').AsString := FAOFlag;
        ParamByName('Details').AsString := Detail;
        ParamByName('Narrative').Clear;
        ExecSQL;
      end;
    end;
end;

procedure TPBMaintPOrdFrm.DeleteNotesBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  PBMaintPOAddNotesFrm := TPBMaintPOAddNotesFrm.Create(Self);
  try
    PBMaintPOAddNotesFrm.FuncMode := poDelete;
    PBMaintPOAddNotesFrm.Text := AddNotesMemo.Text;
    if PBMaintPOAddNotesFrm.ShowModal = mrOK then
    begin
      AddNotesMemo.Text := '';
      SelectedLine.NarrativeText := '';
      SelectedLine.Narrative := 0;
    end;
  finally
    PBMaintPOAddNotesFrm.Free;
  end;
  SetNotesBtns;
end;

procedure TPBMaintPOrdFrm.ChangeNotesBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  PBMaintPOAddNotesFrm := TPBMaintPOAddNotesFrm.Create(Self);
  try
    PBMaintPOAddNotesFrm.FuncMode := poChange;
    PBMaintPOAddNotesFrm.Text := AddNotesMemo.Text;
    if PBMaintPOAddNotesFrm.ShowModal = mrOK then
    begin
      AddNotesMemo.Text := PBMaintPOAddNotesFrm.Text;
      SelectedLine.NarrativeText := AddNotesMemo.Text;
    end;
  finally
    PBMaintPOAddNotesFrm.Free;
  end;
  SetNotesBtns;
end;

procedure TPBMaintPOrdFrm.AddNotesbtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  PBMaintPOAddNotesFrm := TPBMaintPOAddNotesFrm.Create(Self);
  try
    PBMaintPOAddNotesFrm.FuncMode := poAdd;
    PBMaintPOAddNotesFrm.Text := '';
    if PBMaintPOAddNotesFrm.ShowModal = mrOK then
    begin
      AddNotesMemo.Text := PBMaintPOAddNotesFrm.Text;
      SelectedLine.NarrativeText := AddNotesMemo.Text;
    end;
  finally
    PBMaintPOAddNotesFrm.Free;
  end;
  SetNotesBtns;
end;

procedure TPBMaintPOrdFrm.SetNotesBtns;
begin
(*  if AddNotesMemo.Text <> '' then
  begin
    AddNotesBtn.Hide;
    ChangeNotesBtn.Show;
    DeleteNotesBtn.Show;
  end
  else
  begin
    AddNotesBtn.Show;
    ChangeNotesBtn.Hide;
    DeleteNotesBtn.Hide;
  end;
*)
end;

procedure TPBMaintPOrdFrm.btnDelSuppCustNotesClick(Sender: TObject);
begin
  if (SelectedLine = nil) or (AddDetailsList.ItemIndex < 0) then
    Exit;
  PBPOAddDtlsFrm := TPBPOAddDtlsFrm.Create(Self);
  try
    PBPOAddDtlsFrm.AdditionalDetail := SelectedLine.AdditionalDetails[AddDetailsList.ItemIndex] ;
    PBPOAddDtlsFrm.FuncMode := poDelete;
    if PBPOAddDtlsFrm.ShowModal = mrOK then
    begin
      SelectedLine.AdditionalDetails.Delete(AddDetailsList.ItemIndex);
      DisplayAdditionalDetails(AddDetailsList.ItemIndex - 1);
    end
    else
      DisplayAdditionalDetails(AddDetailsList.ItemIndex);
  finally
    PBPOAddDtlsFrm.Free;
  end;
end;

procedure TPBMaintPOrdFrm.SupplierEditChange(Sender: TObject);
var
  iVatCode, iCurrency: Integer;
begin
  PBPODM.GetSupplierDefaults(PurchaseOrder.Supplier, iVatCode, iCurrency);
  PurchaseOrder.DefaultVatCode := iVatCode;
  if (CurrDBLUCB.text = '') and (iCurrency <> 0) then
    CurrDBLUCB.KeyValue := iCurrency;
end;

procedure TPBMaintPOrdFrm.MatEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ChangePartDetails;
end;

procedure TPBMaintPOrdFrm.ChangePartDetails;
var
   apart : TPartDetail;
   irow  : integer;
begin
  with sgPartDetails do
    begin
      for irow := 1 to rowcount -1 do
        begin
          if cells[0,irow] = '' then
            continue;
          aPart := SelectedLine.PartDetails[irow-1].Clone;
          PartDetail := aPart;
          { Save changes into PartDetail }
          with PartDetail do
            begin
              PartDescription := cells[0,irow];
              Heading := cells[1,irow];
              PaperColour := cells[2,irow];
              PaperWeight := cells[3,irow];
              PaperBrand := cells[4,irow];
              PaperMaterial := cells[5,irow];
              FaceInks := cells[6,irow];
              ReverseInks := cells[7,irow];
              LeftMarginType := cells[8,irow];
              RightMarginType := cells[9,irow];
              LeftMarginWidth := cells[10,irow];
              RightMarginWidth := cells[11,irow];
            end;
          SelectedLine.PartDetails[irow-1].Assign(aPart);
        end;
    end;
end;

procedure TPBMaintPOrdFrm.SetQuestions;
var
  i : integer;
  MyLabel : TLabel;
  MyEdit : TEdit;
  MyMemo : TMemo;
  MyComboBox: TComboBox;
  MyCheckBox: TCheckBox;
  MySpinEdit: TSpinEdit;
  sTempName : string;
  iPos : integer;
begin
  ProductQLbl.Caption := 'Questions for Product type: '+PBPODM.GetProdTypeDesc(SelectedLine.ProductType);
  FreeQuestionComponents;
  iPos := 5;
  for i := 0 to Pred(SelectedLine.Questions.Count) do
  with SelectedLine.Questions[i] do
  begin
    if PromptType = 'cbo' then
      begin
        MyLabel := TLabel.Create(Self);
        MyComboBox := TComboBox.Create(Self);
        stempname := 'cbo' + Copy((IntToStr(1000 + QuestionNo)),2,3) + 'Line' +
          IntToStr(SelectedLine.Line);
        Mylabel.autosize := False;
        MyComboBox.Name := stempname;
        MyLabel.Caption := QuestionText;
        MyComboBox.Parent := sbQuestions;
        MyLabel.Parent := sbQuestions;
        MyComboBox.Tag := 999999 + i;
        MyLabel.Tag := 999999;
        MyLabel.Left := 5;
        MyLabel.Width := 200;
        MyLabel.Top := ipos;
        Mylabel.Font.Size := 8;
        MyComboBox.Width := 250;
        MyComboBox.Left := mylabel.Left + mylabel.Width + 5;
        MyComboBox.Text := Answer;
        MyComboBox.OnClick := QuestionClick;
        MyComboBox.OnChange := QuestionChange;
        MyComboBox.OnDropDown := QuestionDropDown;
        MyLabel.Height := 15;
        MyComboBox.Height := 22;
//        ipos := ipos + MyLabel.Height;
        MyComboBox.Top := ipos;
        MyLabel.Top := MyComboBox.Top + 9;
        ipos := ipos + MyComboBox.Height+5;
//        MyComboBox.style := csdropdownlist;
      end
    else
    if PromptType = 'chk' then
      begin
        MyLabel := TLabel.Create(Self);
        MyCheckBox := TCheckBox.Create(Self);
        stempname := 'chk' + Copy((IntToStr(1000 + QuestionNo)),2,3) + 'Line' +
          IntToStr(SelectedLine.Line);
        MyCheckBox.Name := stempname;
        MyCheckBox.Caption := '';
        MyCheckBox.Parent := sbQuestions;

        Mylabel.autosize := False;
        MyLabel.Caption := QuestionText;
        MyLabel.Parent := sbQuestions;
        MyLabel.Tag := 999999;
        MyLabel.Left := 5;
        MyLabel.Width := 200;
        MyLabel.Top := ipos;
        Mylabel.Font.Size := 8;
        MyLabel.Height := 15;

        MyCheckBox.Tag := 999999 + i;
        MyCheckBox.Left := mylabel.Left + mylabel.Width + 5;
        MyCheckBox.Width := 200;
        MyCheckBox.Top := ipos+8;
        MyCheckBox.Font.Size := 8;
        MyCheckBox.checked := (Answer='Y');
        MyCheckBox.OnClick := QuestionClick;
        MyCheckBox.Height := 17;
        MyLabel.Top := MyCheckBox.Top;
        ipos := ipos + MyCheckBox.Height+12;
      end
    else
    if PromptType = 'spn' then
      begin
        MyLabel := TLabel.Create(Self);
        MySpinEdit := TSpinEdit.Create(Self);
        stempname := 'spn' + Copy((IntToStr(1000 + QuestionNo)),2,3) + 'Line' +
          IntToStr(SelectedLine.Line);
        Mylabel.autosize := False;
        MySpinEdit.Name := stempname;
        MyLabel.Caption := QuestionText;
        MySpinEdit.Parent := sbQuestions;
        MyLabel.Parent := sbQuestions;
        MySpinEdit.Tag := 999999 + i;
        MyLabel.Tag := 999999;
        MyLabel.Left := 5;
        MyLabel.Width := 200;
        MySpinEdit.Top := ipos;
        Mylabel.Font.Size := 8;
        MySpinEdit.Width := 100;
        MySpinEdit.Left := mylabel.Left + mylabel.Width + 5;
        try
          MySpinEdit.value := strtoint(Answer);
        except
          MySpinEdit.value := 0;
        end;

        MySpinEdit.OnChange := QuestionChange;
        MyLabel.Height := 15;
        MySpinEdit.Height := 24;
        MySpinEdit.MaxValue := 999999;
        MyLabel.top := MySpinEdit.top+9;
        ipos := ipos + MySpinedit.Height+5;
      end
    else
    if PromptType = 'mem' then
      begin
        MyLabel := TLabel.Create(Self);
        MyMemo := TMemo.Create(Self);
        stempname := 'Memo' + Copy((IntToStr(1000 + QuestionNo)),2,3) + 'Line' +
          IntToStr(SelectedLine.Line);
        Mylabel.autosize := False;
        MyMemo.Name := stempname;
        MyLabel.Caption := QuestionText;
        MyMemo.Parent := sbQuestions;
        MyLabel.Parent := sbQuestions;
        MyMemo.Tag := 999999 + i;
        MyLabel.Tag := 999999;
        MyLabel.Left := 5;
        MyLabel.Width := 200;
        Mylabel.Font.Size := 8;
        MyMemo.Width := (450);
        MyMemo.Scrollbars := ssVertical;
        MyMemo.Left := mylabel.Left + mylabel.Width + 5;
        MyMemo.Text := Answer;
        MyMemo.OnChange := QuestionChange;
        MyLabel.Height := 15;
        MyMemo.Height := 66;
//        ipos := ipos + MyLabel.Height;
        MyMemo.Top := ipos;
        MyLabel.Top := MyMemo.Top+8;
        ipos := ipos + MyMemo.Height+5;
      end
    else
      begin
        MyLabel := TLabel.Create(Self);
        MyEdit := TEdit.Create(Self);
        stempname := 'Edit' + Copy((IntToStr(1000 + QuestionNo)),2,3) + 'Line' +
          IntToStr(SelectedLine.Line);
        Mylabel.autosize := False;
        MyEdit.Name := stempname;
        MyLabel.Caption := QuestionText;
        MyEdit.Parent := sbQuestions;
        MyLabel.Parent := sbQuestions;
        MyEdit.Tag := 999999 + i;
        MyLabel.Tag := 999999;
        MyLabel.Left := 5;
        MyLabel.Width := 200;
        Mylabel.Font.Size := 8;
        MyEdit.Width := (450);
        MyEdit.Left := mylabel.Left + mylabel.Width + 5;
        MyEdit.Text := Answer;
        MyEdit.OnChange := QuestionChange;
        MyLabel.Height := 15;
        MyEdit.Height := 22;
//        ipos := ipos + MyLabel.Height;
        MyEdit.Top := ipos;
        MyLabel.Top := MyEdit.Top+8;
        ipos := ipos + Myedit.Height+5;
      end;
  end;
end;

procedure TPBMaintPOrdFrm.FreeQuestionComponents;
var
  i : integer;
begin
  { Do the frees in reverse order or all hell breaks loose }
  for i := Pred(ComponentCount) downto 0 do
    if TComponent(Components[i]).Tag >= 999999 then
      TComponent(Components[i]).Free;
end;

procedure TPBMaintPOrdFrm.QuestionClick(Sender: TObject);
begin
 if Sender is TCheckBox then
  with Sender as TCheckBox do
    if Checked then
      SelectedLine.Questions[Tag-999999].Answer := 'Y'
    else
      SelectedLine.Questions[Tag-999999].Answer := 'N'
end;

procedure TPBMaintPOrdFrm.QuestionChange(Sender: TObject);
begin
 if Sender is TMemo then
  with Sender as TMemo do
    SelectedLine.Questions[Tag-999999].Answer := (Sender as TMemo).Text
 else
 if Sender is TEDit then
  with Sender as TEdit do
    SelectedLine.Questions[Tag-999999].Answer := (Sender as TEdit).Text
 else
 if Sender is TComboBox then
  with Sender as TComboBox do
    SelectedLine.Questions[Tag-999999].Answer := (Sender as TComboBox).Text
 else
 if Sender is TSpinEdit then
  with Sender as TSpinEdit do
    SelectedLine.Questions[Tag-999999].Answer := inttostr((Sender as TSpinEdit).Value);
end;

procedure TPBMaintPOrdFrm.QuestionDropDown(Sender: TObject);
var
  stext: string;
  stemp: string;
  iQuestion: integer;
begin
  with PBPODM do
  begin
    sTemp:= trim((Sender as TComboBox).Name);
    iQuestion := strtoint(copy(sTemp,4,3));
    QuestListSQL.Close;
    QuestListSQL.ParamByName('Product_Type').AsInteger := SelectedLine.ProductType;
    QuestListSQL.ParamByName('Question').AsInteger := iQuestion;
    QuestListSQL.Open;
    stext := (Sender as TComboBox).Text;
    (Sender as TComboBox).Items.Clear;
    while (not QuestListSQL.EOF) do
    begin
      (Sender as TComboBox).Items.Add(Trim(QuestListSQL.FieldByName('Question_LIst_Descr').AsString));
      QuestListSQL.Next;
    end;
    if (Sender as TComboBox).items.count = 1 then
      (Sender as TComboBox).Itemindex := 0
    else
      (Sender as TComboBox).Itemindex := (Sender as TComboBox).Items.IndexOf(stext);
    if (Sender as TComboBox).Itemindex = -1 then
      (Sender as TComboBox).Text := stext;
    QuestListSQL.Close;
  end;
end;

procedure TPBMaintPOrdFrm.ColourComboBoxEnter(Sender: TObject);
var
  stext: string;
begin
  {In order to make this function generic for all the Paper details, the
  relevant table name is stored in the Hint property of the component.}
  PBPODM.PaperDetailSQL.SQL.clear;
  PBPODM.PaperDetailSQL.SQL.Add('Select * from ');
  PBPODM.PaperDetailSQL.SQL.Add((Sender as TComboBox).hint);
  PBPODM.PaperDetailSQL.SQL.Add('Order by');
  PBPODM.PaperDetailSQL.SQL.Add((Sender as TComboBox).hint + '_Description');
  PBPODM.PaperDetailSQL.close;
  PBPODM.PaperDetailSQL.open;

  stext := sgPartDetails.Cells[sgPartDetails.col, sgPartDetails.Row];

  (Sender as TComboBox).Clear;

  PBPODM.PaperDetailSQL.First;

  while (not PBPODM.PaperDetailSQL.EOF) do
  begin
    (Sender as TComboBox).Items.Add(PBPODM.PaperDetailSQL.Fields[1].AsString);
    PBPODM.PaperDetailSQL.Next;
  end;

  (Sender as TComboBox).text := '';
  (Sender as TComboBox).Itemindex := (Sender as TComboBox).Items.IndexOf(stext);

  if (Sender as TComboBox).Itemindex = -1 then (Sender as TComboBox).Text := stext;

end;

procedure TPBMaintPOrdFrm.ColourComboBoxExit(Sender: TObject);
begin
  ChangePartDetails;
  ColourComboBox.Visible := False;
  WeightComboBox.Visible := False;
  BrandComboBox.Visible := False;
  MaterialComboBox.Visible := False;
  ColourComboBoxClick(self);
end;

procedure TPBMaintPOrdFrm.PartListDblClick(Sender: TObject);
var
  PBPartDescDlg: TPBPartDescDlg;
begin
  if sgPartDetails.row > 0 then
    with SelectedLine.PartDetails[sgPartDetails.row - 1] do
    begin
      PBPartDescDlg := TPBPartDescDlg.Create(Self);
      try
        PBPartDescDlg.Description := PartNoStr;
        if PBPartDescDlg.ShowModal = mrOK then
        begin
          PartDescription := PBPartDescDlg.Description;
          sgPartDetails.cells[0,sgPartDetails.row] := PartDescription;
        end;
      finally
        PBPartDescDlg.Free;
      end;
    end;
end;

procedure TPBMaintPOrdFrm.DateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If DateEdit.Text = '' then
    Exit;
    try
    NewDate := StrToDate(DateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      If DateEdit.Enabled then
        DateEdit.SetFocus;
      Exit;
    end;
  end;

  DateEdit.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintPOrdFrm.CallOffAddBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  CallOffMaintScreen(poAdd);
end;

procedure TPBMaintPOrdFrm.CallOffChgBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;
  CallOffMaintScreen(poChange);
end;

procedure TPBMaintPOrdFrm.CallOffDelBtnClick(Sender: TObject);
begin
  if SelectedLine = nil then
    Exit;

  if CallOffDelBtn.Caption = 'Restore' then
    CallOffCancel('R')
  else
  if CallOffDelBtn.Caption = 'Cancel' then
    CallOffCancel('X')
  else
    CallOffMaintScreen(poDelete);
end;

procedure TPBMaintPOrdFrm.CallOffCancel(sTempFuncMode: Char);
var
  CallOffOrder: TCallOffOrder;
  bTempOK: boolean;
begin
  FSelectedCallOffIndex := sgCallOff.row-1;
  CallOffOrder := SelectedCallOffOrder.Clone;
  if sTempFuncMode = poRestore then
    begin
      if (SelectedLine.DeliveryLines.TotalStock - SelectedLine.CallOffOrders.Total - CallOffOrder.OrderQty) < 0 then
        begin
          messagedlg('Cannot restore this order, the total scheduled quantity will be greater than the Stock Qty', mtError,
            [mbOk], 0);
          exit;
        end;
    end;

  if sTempFuncMode = poCancel then
    if (CallOffOrder.status >= plSomeInvoiceRaised) then
    begin
      if MessageDlg('This order has been invoiced' +
        ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
    end;

  PBMaintPOrdLInactiveFrm := TPBMaintPOrdLInactiveFrm.Create(Self);
  try
    if CallOffOrder.Inactive = 'Y' then
      begin
      PBMaintPOrdLInactiveFrm.chkReActivate.visible := true;
      PBMaintPOrdLInactiveFrm.DBLUReason.keyvalue := CallOffOrder.InactiveReason;
      PBMaintPOrdLInactiveFrm.ireason := CallOffOrder.InactiveReason;
      PBMaintPOrdLInactiveFrm.sdate := PBDateStr(CallOffOrder.InactiveDate);
      end
    else
      begin
      PBMaintPOrdLInactiveFrm.chkReActivate.visible := false;
      end;
    PBMaintPOrdLInactiveFrm.ShowModal;
    if PBMaintPOrdLInactivefrm.chkReActivate.checked then
      begin
        CallOffOrder.Inactive := 'N';
        CallOffOrder.InactiveReason := 0;
        CallOffOrder.InactiveDate := PBdateStr('');
      end
    else
      begin
        CallOffOrder.Inactive := 'Y';
        CallOffOrder.InactiveReason := PBMaintPOrdLInactivefrm.iReason;
        CallOffOrder.InactiveDate := PBDateStr(PBMaintPOrdLInactivefrm.sDate);
      end;
    bTempOK := (PBMaintPOrdLInactivefrm.modalresult = idOK)
  finally
    PBMaintPOrdLInactiveFrm.Free;
  end;

  if btempOK then
    begin
      SelectedLine.CallOffOrders[FSelectedCallOffIndex].Free;
      SelectedLine.CallOffOrders.Delete(FSelectedCallOffIndex);
      SelectedLine.CallOffOrders.Add(CallOffOrder);
      ShowCallOffGrid(Self);
    end
  else
    CallOffOrder.Free;
  ShowLineGrid(nil);
end;

procedure TPBMaintPOrdFrm.CallOffMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  CallOffOrder: TCallOffOrder;
  inx, iCallOff: Integer;
begin
  FSelectedCallOffIndex := sgCallOff.row-1;
  if sTempFuncMode = poAdd then
  begin
    if (SelectedLine.DeliveryLines.TotalStock - SelectedLine.CallOffOrders.Total) = 0 then
      begin
        messagedlg('All Stock has been scheduled, cannot add any more Call Offs', mtError,
            [mbOk], 0);
        exit;
      end;

    CallOffOrder := TCallOffOrder.Create;
    CallOffOrder.PONumber := 0;
    CallOffOrder.Line := SelectedLine.Line;
    CallOffOrder.CallOffNo := 1;
    CallOffOrder.CallOffSeq := SelectedLine.CallOffOrders.NextLineNumber;
    CallOffOrder.Customer := SelectedLine.Customer;
    CallOffOrder.CustBranch := SelectedLine.BranchNo;
    CallOffOrder.CustContact := SelectedLine.CustomerContact;
    CallOffOrder.Rep := SelectedLine.Rep;
    GetCompany;
    if SelectedLine.DeliveryLines.StockSupplier <> 0 then
      begin
        CallOffOrder.Supplier := SelectedLine.DeliveryLines.StockSupplier;
        CallOffOrder.SuppBranch := SelectedLine.DeliveryLines.StockSupplierBr;
      end
    else
      begin
        CallOffOrder.Supplier := PBPODM.GetCompanySQl.fieldbyname('Supplier').asinteger;
        CallOffOrder.SuppBranch := PBPODM.GetCompanySQl.fieldbyname('Branch_no').asinteger;
      end;
    CallOffOrder.SuppContact := 1;

    CallOffOrder.Supplier := 0;
    CallOffOrder.SuppBranch := 0;

    CallOffOrder.OrderQty := round((SelectedLine.DeliveryLines.TotalStock - SelectedLine.CallOffOrders.Total));
    CallOffOrder.OrderDate := date;
    CallOffOrder.Status := plSentToSupplier;
    if CallOffOrder.CallOffSeq = 1 then
      begin
        if (SelectedLine.DeliveryLines.StockSupplier = 0) and (SelectedLine.InvoiceUpfront = 'Y') then
        begin
          CallOffOrder.SellPrice := 0.00;
          CallOffOrder.CostPrice := 0.00;
          CallOffOrder.CalloffInvoicedUpfront := 'Y';
        end
        else
        begin
          CallOffOrder.SellPrice := SelectedLine.SellingPrice;
          CallOffOrder.CostPrice := SelectedLine.OrderPrice;
          CallOffOrder.CalloffInvoicedUpfront := 'N';
        end;
        CallOffOrder.SellUnit := SelectedLine.SellUnit;
        CallOffOrder.CostUnit := SelectedLine.OrderUnit;
        CallOffOrder.Description := SelectedLine.CustomersDesc;
        CallOffOrder.CustOrderNo := SelectedLine.CustOrderNo;
        CallOffOrder.FormReference := SelectedLine.FormReference;
        CallOffOrder.BoxQty := SelectedLine.FormsperBox;
      end
    else
      begin
        if (SelectedLine.DeliveryLines.StockSupplier = 0) and (SelectedLine.InvoiceUpfront = 'Y') then
        begin
          CallOffOrder.SellPrice := 0.00;
          CallOffOrder.CostPrice := 0.00;
          CallOffOrder.CalloffInvoicedUpfront := 'Y';
        end
        else
        begin
          CallOffOrder.SellPrice := SelectedLine.CallOffOrders[0].SellPrice;
          CallOffOrder.CostPrice := SelectedLine.CallOffOrders[0].CostPrice;
          CallOffOrder.CalloffInvoicedUpfront := 'N';
        end;
        CallOffOrder.SellUnit := SelectedLine.CallOffOrders[0].SellUnit;
        CallOffOrder.CostUnit := SelectedLine.CallOffOrders[0].CostUnit;
        CallOffOrder.Description := SelectedLine.CallOffOrders[0].Description;
        CallOffOrder.CustOrderNo := SelectedLine.CallOffOrders[0].CustOrderNo;
        CallOffOrder.FormReference := SelectedLine.CallOffOrders[0].FormReference;
        CallOffOrder.BoxQty := SelectedLine.CallOffOrders[0].BoxQty;
        CallOffOrder.Rep := SelectedLine.CallOffOrders[0].Rep;
      end;
  end
  else
    CallOffOrder := SelectedCallOffOrder.Clone;

  if (CallOffOrder.status >= plSomeInvoiceRaised) and (sTempFuncMode = poChange) then
  begin
    if MessageDlg('This order has been invoiced' +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
  end;

  PBMaintPOrdLineCallOffFrm := TPBMaintPOrdLineCallOffFrm.Create(Self);
  try
    PBMaintPOrdLineCallOffFrm.FuncMode := sTempFuncMode;
    PBMaintPOrdLineCallOffFrm.CallOffOrder := CallOffOrder;
    PBMaintPOrdLineCallOffFrm.MaxQty := round((SelectedLine.DeliveryLines.TotalStock
                                                    - SelectedLine.CallOffOrders.Total
                                                    + CallOffOrder.OrderQty));
    PBMaintPOrdLineCallOffFrm.FormsPerBox := SelectedLine.FormsPerBox;
    PBMaintPOrdLineCallOffFrm.InvoicedUpfront := SelectedLine.InvoiceUpfront;
    PBMaintPOrdLineCallOffFrm.ShowModal;
    bTempOK := PBMaintPOrdLineCallOffFrm.bOK;
  finally
    PBMaintPOrdLineCallOffFrm.Free;
  end;
  if bTempOK then
  begin
    iCallOff := CallOffOrder.CallOffSeq;
    if sTempFuncMode = poAdd then
      SelectedLine.CallOffOrders.Add(CallOffOrder);
    inx := SelectedLine.CallOffOrders.IndexFromCallOffNo(iCallOff);
    if CharInSet(sTempFuncMode, [poChange, poDelete]) then
    begin
      SelectedLine.CallOffOrders[inx].Free;
      SelectedLine.CallOffOrders.Delete(inx);
    end;
    if sTempFuncMode = poChange then
      SelectedLine.CallOffOrders.Add(CallOffOrder)
    else
      if sTempFuncMode = poDelete then
        CallOffOrder.Free;
    ShowCallOffGrid(Self);
  end
  else
    CallOffOrder.Free;
  ShowLineGrid(nil);
end;

procedure TPBMaintPOrdFrm.sgCallOffDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  CallOffOrder: TCallOffOrder;
begin
  with (Sender as TStringGrid) do
  begin
    if (ARow <> 0) and (trim(sgCallOff.Cells[ACol, 1]) <> '') then
      begin
        FSelectedCallOffIndex := ARow-1;
        CallOffOrder := SelectedCallOffOrder.Clone;
        if CallOffOrder.Inactive = 'Y' then
          sgCallOff.Canvas.font.Color := clRed;
      end;
    {The following is code extracted from the Delphi Info Base}
    {Display the Columns Right justified in the cells}

    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if (ACol = 3) then
    begin
      if gdFixed in State then
        Canvas.Brush.Color := sgCallOff.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end
    else
    begin
      if gdFixed in State then
        Canvas.Brush.Color := sgCallOff.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end;
  end;
end;

procedure TPBMaintPOrdFrm.sgCallOffDblClick(Sender: TObject);
begin
  if sgCallOff.row = 0 then exit;
  if CallOffChgBtn.Enabled then
    CallOffChgBtnClick(self);
end;

procedure TPBMaintPOrdFrm.GetCompany;
begin
  with PBPODM.GetCompanySQL do
    begin
      close;
      open;
    end;
end;

procedure TPBMaintPOrdFrm.NoCallOffEditChange(Sender: TObject);
begin
  SelectedLine.NoOfCalloffs := (Sender as TEdit).text;
end;

procedure TPBMaintPOrdFrm.ProofsReqChkBoxClick(Sender: TObject);
begin
  ProofsDateEdit.Enabled := ProofsReqChkBox.Checked;
  ProofDateBtn.Enabled := ProofsReqChkBox.Checked;
  ProofByLabel.Enabled := ProofsReqChkBox.Checked;
  ProofStatLabel.Enabled := ProofsReqChkBox.Checked;
  ProofStatDBLUCB.Enabled := ProofsReqChkBox.Checked;
  ProofsBitBtn.Enabled := ProofsReqChkBox.Checked;

(*  if (not SelectedLine.ProofRequired) and (ProofsReqChkBox.Checked) then
  begin
    ProofStatLabel.Visible := True;
    ProofStatDBLUCB.Visible := True;
    ProofsBitBtn.Visible := True;
  end
  else
  begin
    ProofStatLabel.Visible := False;
    ProofStatDBLUCB.Visible := False;
    ProofsBitBtn.Visible := False;
  end;
*)
  if (FFuncMode <> poAdd) and (FFuncMode <> poCopy) and (FFuncMode <> poRepeat) then
  begin
    ProofStatLabel.Visible := True;
    ProofStatDBLUCB.Visible := True;
    if ProofsReqChkBox.Checked and (SelectedLine.ProofStatus = '') then
      begin
        ProofStatDBLUCB.Enabled := true;
        ProofsBitBtn.Visible := false;
        edtProofStatusDate.Visible := true;
        edtProofStatusDate.enabled := true;
        lblProofStatus.Visible := true;
      end
    else
      begin
        ProofStatDBLUCB.Enabled := false;
        ProofsBitBtn.Visible := True;
        edtProofStatusDate.Visible := true;
        lblProofStatus.Visible := true;
      end;
  end
  else
  begin
    ProofStatLabel.Visible := True;
    ProofStatDBLUCB.Visible := True;
    ProofStatDBLUCB.Enabled := true;
    ProofsBitBtn.Visible := false;
    edtProofStatusDate.Visible := false;
    lblProofStatus.Visible := false;
  end;
end;

procedure TPBMaintPOrdFrm.ContactComboDropDown(Sender: TObject);
var
  stext: string;
begin
  with PBPODM do
  begin
    qrySelActiveCCont.Close;
    qrySelActiveCCont.ParamByName('Customer').AsInteger := SelectedLine.Customer;
    qrySelActiveCCont.ParamByName('Branch').AsInteger := SelectedLine.BranchNo;
    qrySelActiveCCont.Open;
    stext := ContactCombo.Text;
    ContactCombo.Items.Clear;
    while (not qrySelActiveCCont.EOF) do
    begin
      ContactCombo.Items.AddObject
        (Trim(qrySelActiveCCont.FieldByName('Name').AsString),
         TObject(qrySelActiveCCont.FieldByName('Contact_No').AsInteger));
      qrySelActiveCCont.Next;
    end;
    if ContactCombo.items.count = 1 then
      ContactCombo.Itemindex := 0
    else
      ContactCombo.Itemindex := ContactCombo.Items.IndexOf(stext);
    if ContactCombo.Itemindex = -1 then
      ContactCombo.Text := stext;
  end;
end;

procedure TPBMaintPOrdFrm.CustLUBtnClick(Sender: TObject);
var
  custOnStop, blockOnStopCust: boolean;
  custStatus: string;
begin
  if (FFuncMode = poChange) and JobIsInBag then
    Exit;
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.SelCode := SelectedLine.Customer;
    PBLUCustFrm.SelBranch := SelectedLine.BranchNo;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      CostCentreLevel := PBLUCustFrm.SelCCLevel;
      pnlCostCentre.visible := CostCentreLevel <> '';
      custStatus := dmBroker.GetCustomerStatus(PBLUCustFrm.SelCode);
      if custStatus <> 'B' then
      begin
        //either the customer is not on stop or on stop customers are not blocked
(*        if custOnStop = true then
          MessageDlg('This Customer is currently ON STOP', mtWarning,[mbOk], 0);
*)
        if custStatus = 'S' then
          MessageDlg(cOnStop, mtWarning,[mbOk], 0)
        else
        if custStatus = 'O' then
          MessageDlg(cOverdue, mtWarning,[mbOk], 0);

        if (SelectedLine.Customer <> PBLUCustFrm.SelCode)
          or (SelectedLine.BranchNo <> PBLUCustFrm.SelBranch) then
        begin
          {The form reference will be invalid for another customer}
          SelectedLine.FormReference := 0;
          FormRefEdit.Text := '';
          FormDescEdit.Text := '';
          {And so will the REP}
          SelectedLine.Rep := PBPODM.DefaultRep(PBLUCustFrm.SelCode,
            PBLUCustFrm.SelBranch);
          RepEdit.Text := PBPODM.GetRepDesc(SelectedLine.Rep);
          {and so will the delivery details}
          SelectedLine.DeliveryLines.Clear;
          if dmBroker.defaultVatCode then
            begin
              SelectedLine.VatCode := PBPODM.GetCustVat(PBLUCustFrm.SelCode);
              dblkpVatRate.keyvalue := selectedLine.vatcode;
            end;
        end;
        SelectedLine.Customer := PBLUCustFrm.SelCode;
        CustNameEdit.Text := PBLUCustFrm.SelName+'/'+PBLUCustFrm.SelBranchName;
        SelectedLine.BranchNo := PBLUCustFrm.SelBranch;

        {Will the contact change}
        ContactComboDropDown(self);
        if ContactCombo.text <> '' then
          ContactComboClick(self);

        if DefaultDeliveries then
          begin
            if SelectedLine.DeliveryLines.Count = 0 then
              begin
                CreateDelivery;
                ShowDelivGrid(self);
              end
          end;
      end
      else
        begin
          //customer is on stop and on stop customers are blocked so warn user and return
          MessageDlg('This Customer is currently On Stop.'+#10#13+'Orders cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
        end;
    end;
  finally
    PBLUCustFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.ContactLUBtnClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := True;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := SelectedLine.Customer;
    PBLUCContaFrm.iBranch := SelectedLine.BranchNo;
    PBLUCContaFrm.SelCode := SelectedLine.CustomerContact;
    PBLUCContaFrm.sCustName := CustNameedit.Text;
    PBLUCContaFrm.sBranchName := PBPODM.GetCustBranchName(SelectedLine.Customer,SelectedLine.BranchNo);
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      SelectedLine.CustomerContact := PBLUCContaFrm.SelCode;
      ContactComboDropDown(Self);
      ContactCombo.Itemindex :=
        ContactCombo.Items.Indexof(PBLUCContaFrm.SelName);
      if PBLUCContaFrm.Account_Number <> '' then
      begin
        if MessageDlg('This Contact has payment details on file. Is this a Cash Sale?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          chkbxClearedFunds.checked := true;
        end;
      end;
    end;
  finally
    PBLUCContaFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.RepLUButtonClick(Sender: TObject);
begin
  if dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator) then
    begin
      {lookup a Customer/Branch Rep}
      PBLUCRepFrm := TPBLUCRepFrm.Create(self);
      try
        PBLUCRepFrm.bIs_Lookup := True;
        PBLUCRepFrm.bAllow_Upd := false;

        PBLUCRepFrm.iCust := SelectedLine.Customer;
        PBLUCRepFrm.iBranch := SelectedLine.BranchNo;
        PBLUCRepFrm.sCustName := PBPODM.GetCustName(selectedLine.Customer);
        PBLUCRepFrm.sBranchName := PBPODM.GetCustBranchName(selectedLine.customer,selectedLine.BranchNo);
        PBLUCRepFrm.SelCode := SelectedLine.Rep;
        PBLUCRepFrm.ShowModal;
        if PBLUCRepFrm.bselected then
        begin
          SelectedLine.Rep := PBLUCRepFrm.selcode;
          RepEdit.Text := PBLUCRepFrm.SelName;
        end;
      finally
        PBLUCRepFrm.Free;
      end;
    end
  else
    begin
      {Lookup a rep}
      PBLURepFrm := TPBLURepFrm.Create(Self);
      try
        PBLURepFrm.bIs_Lookup := True;
        PBLURepFrm.bAllow_Upd := True;
        PBLURepFrm.SelCode := SelectedLine.Rep;
        PBLURepFrm.ShowModal;
        if PBLURepFrm.Selected then
        begin
          SelectedLine.Rep := PBLURepFrm.SelCode;
          RepEdit.Text := PBLURepFrm.SelName;
        end;
      finally
        PBLURepFrm.Free;
      end;
    end;

  CheckOK(Self);
end;

function TPBMaintPOrdFrm.JobIsInBag: Boolean;
begin
  { If you're amending an existing line, block customer changes where
    the Purchase Order Line is already in a job bag }
  Result := False;
  with PBPODM.GetJobBagDetsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    ParamByName('Line').AsInteger := SelectedLine.Line;
    Open;
    First;
    if not EOF then
    begin
      MessageDlg('You cannot change the customer because this Purchase ' +
        'Order Line is in job bag number ' +
        IntToStr(FieldByName('Job_Bag').AsInteger), mtError, [mbOK], 0);
      Result := True;
    end;
    Close;
  end;
end;

procedure TPBMaintPOrdFrm.ProdTypeBtnClick(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.SelCode := SelectedLine.ProductType;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.Selected then
    begin
      SelectedLine.ProductType := PBLUPrdTypFrm.SelCode;
      ProdTypeEdit.Text := PBLUPrdTypFrm.SelName + '/' + PBLUPrdTypFrm.CatName;
      {Create the Questions for this product type}
      if SelectedLine.Questions.Count = 0 then
        begin
          CreateQuestions;
          SetQuestions;
        end;
      if PBPODM.GetProdTypePUnits(SelectedLine.producttype) then
        PBPODM.PriceUnitSRC.dataset := PBPODM.qryGetProdTypePriceUnit
      else
        begin
          PBPODM.PriceUnitSRC.DataSet := PBPODM.GetPriceUnitSQL;
          PBPODM.GetPriceUnitSQL.Active := False;
          PBPODM.GetPriceUnitSQL.Active := True;
        end;

      CheckProductTypeInvoicing(SelectedLine.producttype);
      CheckProductTypeCashSale(SelectedLine.producttype);
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.CheckProductTypeInvoicing(tempCode: integer);
var
  bInvoice: bytebool;
begin
  bInvoice := PBPODM.GetProdTypeShouldInvoice(tempCode);
  if (not chkbxInvoiceBeforeDelivery.checked) and (bInvoice) then
    begin
      chkbxInvoiceBeforeDelivery.checked := bInvoice;
      messagedlg('Orders for this product type must be invoiced before delivery of goods', mtInformation, [mbOk], 0);
    end;
end;

procedure TPBMaintPOrdFrm.CheckProductTypeCashSale(tempCode: integer);
var
  bCashSale: bytebool;
begin
  bCashSale := PBPODM.GetProdTypeCashSale(tempCode);

  if (not chkbxClearedFunds.checked) and (bCashSale) then
    begin
      chkbxClearedFunds.checked := bCashSale;
    end;
end;

procedure TPBMaintPOrdFrm.ReqByDateLUBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(ReqByDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      ReqByDateEdit.Text := DateToStr(DateSelV5Form.Date);

      if ((ffuncmode = poAdd) or (ffuncmode = poCopy)) and (CustReqDateEdit.text = '') then
        begin
          OldCustReqDate := date+1;

          CustReqDateEdit.Text := ReqByDateEdit.Text;

          try
            edtLifeExp.Text := DateToStr(StrToDate(edtLifeExp.Text) - OldCustReqDate + StrToDate(CustReqDateEdit.Text));
          except
          end;
        end;

      UpdateOrderLine;
      UpdateDelivery;

      CheckOK(self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdFrm.CustDescEditChange(Sender: TObject);
begin
  if bAllowDescChg then
    SuppDescEdit.text := (Sender as TMemo).text;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.CustDescEditEnter(Sender: TObject);
begin
  if (SuppDescEdit.Text = '') or (SuppDescEdit.Text = CustDescEdit.text) or (FFuncMode = poAdd) then
    bAllowDescChg := true;
end;

procedure TPBMaintPOrdFrm.CustDescEditExit(Sender: TObject);
begin
  bAllowDescChg := false;
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.SetbAllowDescChg(const Value: boolean);
begin
  FbAllowDescChg := Value;
end;

procedure TPBMaintPOrdFrm.OnHoldChkBoxClick(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.OrderUnitDBLCBClick(Sender: TObject);
begin
  UpdateOrderLine;
  CalcTotalOrderValue;
  CalcProfitValue;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.SellUnitDBLCBClick(Sender: TObject);
begin
  UpdateOrderLine;
  CalcTotalSalesValue;
  CalcProfitValue;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.ProofsGrpBoxClick(Sender: TObject);
begin
  UpdateOrderLine
end;

procedure TPBMaintPOrdFrm.ReqByDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if ReqByDateEdit.Text = '' then
    exit;

  try
    NewDate := StrToDate(ReqByDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      If ReqByDateEdit.Enabled then
        ReqByDateEdit.SetFocus;
      Exit;
    end;
  end;

  ReqByDateEdit.Text := PBDatestr(NewDate);

  if ((ffuncmode = poAdd) or (ffuncmode = poCopy)) and (CustReqDateEdit.text = '') then
    begin
      OldCustReqDate := date+1;

      CustReqDateEdit.Text := ReqByDateEdit.Text;

      try
        edtLifeExp.Text := DateToStr(StrToDate(edtLifeExp.Text) - OldCustReqDate + StrToDate(CustReqDateEdit.Text));
      except
      end;
    end;

  UpdateOrderLine;
  UpdateDelivery;
end;

procedure TPBMaintPOrdFrm.CustRefEditExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.DepthEditExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.WidthEditExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.UpDown1Exit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.UpDown2Exit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.OrderQtyMemoExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.OrdPriceMemoExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.SellPriceMemoExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.SuppDescEditExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.SuppRefEditExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.SuppJobRefEditExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.ArtEditExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.FormsPerBoxEditExit(Sender: TObject);
begin
  if SelectedLine.FormsPerBox <> (Sender as Tedit).text then
    begin
//      FormsPerBoxChange := true;
      UpdateOrderLine;
      UpdateDelivery;
    end;
end;

procedure TPBMaintPOrdFrm.SetsEditExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.ExpectedLifeSpinEditExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.UpDown1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if Unit1.Text = cMillimetres then
    Unit1.Text := cInches
  else
    Unit1.Text := cMillimetres;
end;

procedure TPBMaintPOrdFrm.UpDown2Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if Unit2.Text = cMillimetres then
    Unit2.Text := cInches
  else
    Unit2.Text := cMillimetres;
end;

procedure TPBMaintPOrdFrm.FormRefButtonClick(Sender: TObject);
begin
  PBLUCustFormRefFrm := TPBLUCustFormRefFrm.Create(Self);
  try
    PBLUCustFormRefFrm.bIs_Lookup := True;
    PBLUCustFormRefFrm.bAllow_Upd := True;
    PBLUCustFormRefFrm.iCust := SelectedLine.Customer;
    PBLUCustFormRefFrm.sCustName := CustNameEdit.Text;
    PBLUCustFormRefFrm.iBranch := SelectedLine.BranchNo;
    PBLUCustFormRefFrm.sBranchName := PBPODM.GetCustBranchName(SelectedLine.Customer,SelectedLine.BranchNo);
    PBLUCustFormRefFrm.SelCode := SelectedLine.FormReference;
    PBLUCustFormRefFrm.ShowModal;
    if PBLUCustFormRefFrm.bSelected then
    begin
      if PBPODM.StockCodeInactive(PBLUCustFormRefFrm.StockCode) then
        begin
          messagedlg('The stock reference/form reference selected is inactive, orders cannot be processed for inactive products.', mtError, [mbOK], 0);
          exit;
        end;
      SelectedLine.FormReference := PBLUCustFormRefFrm.SelCode;
      FormRefEdit.Text := PBLUCustFormRefFrm.SelName;
      StockRefEdit.Text := PBLUCustFormRefFrm.StockCode;
      FormDescEdit.Text := PBLUCustFormRefFrm.SelDescr;
    end;
  finally
    PBLUCustFormRefFrm.Free;
  end;
  CheckOK(Self);

end;

procedure TPBMaintPOrdFrm.FormRefClrBitBtnClick(Sender: TObject);
begin
  SelectedLine.FormReference := 0;
  FormRefEdit.Text := '';
  FormDescEdit.Text := '';
  StockRefEdit.Text := '';

  self.CheckOK(self);
end;

procedure TPBMaintPOrdFrm.SetFormsperBoxChange(const Value: boolean);
begin
  FFormsperBoxChange := Value;
end;

procedure TPBMaintPOrdFrm.OrderQtyMemoEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintPOrdFrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
  lifeExp: integer;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if (TempStr = 'X') or (TempStr = '0') then
  begin
    (Sender as TMemo).Text := sOldValue;
    If (Sender as TMemo).Enabled then
        (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;

  if floattostr(SelectedLine.Quantity) <> (Sender as TMemo).text then
    begin
      //recalculate expected life
      try
        lifeExp := trunc(StrToDate(edtLifeExp.text) - StrToDate(CustReqDateEdit.text));
        lifeExp := trunc(lifeExp * (StrToInt((Sender as TMemo).text)/(SelectedLine.Quantity)));

        if lifeExp > 365 then
          lifeExp := 365;
        edtLifeExp.text := DateToStr(StrToDate(CustReqDateEdit.text)+lifeExp);
      except

      end;
      UpdateOrderLine;
      UpdateDelivery;
    end;

  if SelectedLine.DeliveryLines.count = 0 then
    begin
      MessageDlg('In order to continue you must specify the delivery details associated with this order.', mtInformation, [mbOK], 0);
      DelivAddBitBtnClick(self);
      Exit;
    end;

end;

procedure TPBMaintPOrdFrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintPOrdFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintPOrdFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    If (Sender as TMemo).Enabled then
        (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.CalcTotalOrderValue;
var
  iFactor: integer;
  rValue: real;
begin
  if (trim(OrderQtyMemo.text) = '') or
      (trim(OrdPriceMemo.text) = '') or
      (OrderUnitDBLCB.text = '') then
      begin
        TotOrderMemo.text := '0.00';
        exit;
      end;
  {Get the Price Unit Factor}
  with PBPODM.PriceUnitSQL do
    begin
      close;
      parambyname('Price_Unit').asinteger := OrderUnitDBLCB.keyvalue;
      open;
      iFactor := fieldbyname('Price_unit_Factor').asinteger;
    end;

  if iFactor = 0 then
    rValue := StrToFloatDef(OrdPriceMemo.text, 0, FormatSettings)
  else
    rValue := ((strtoInt(OrderQtyMemo.text)/iFactor) * StrToFloatDef(OrdPriceMemo.text, 0, FormatSettings));

  rvalue := rvalue + StrToFloatDef(OrdChrgMemo.text, 0, FormatSettings);
  TotOrderMemo.text := formatfloat('0.00',rValue);
end;

procedure TPBMaintPOrdFrm.CalcTotalSalesValue;
var
  iFactor: integer;
  rValue: real;
begin
  if (trim(OrderQtyMemo.text) = '') or
      (trim(sellPriceMemo.text) = '') or
      (sellUnitDBLCB.text = '') then
      begin
        TotsellMemo.text := '0.00';
        exit;
      end;
  {Get the Price Unit Factor}
  with PBPODM.PriceUnitSQL do
    begin
      close;
      parambyname('Price_Unit').asinteger := SellUnitDBLCB.keyvalue;
      open;
      iFactor := fieldbyname('Price_unit_Factor').asinteger;
    end;

  if iFactor = 0 then
    rValue := StrToFloatDef(SellPriceMemo.text, 0, FormatSettings)
  else
    rValue := ((strtoInt(OrderQtyMemo.text)/iFactor) * StrToFloatDef(SellPriceMemo.text, 0, FormatSettings));

   rvalue := rvalue + StrToFloatDef(SlsChrgMemo.text, 0, FormatSettings);
   {for TempCount := 0 to Pred(SelectedLine.ExtraCharges.Count) do
      with SelectedLine.ExtraCharges[TempCount] do
      begin
        rvalue := rvalue + QuotationPrice;
      end; }

  TotSellMemo.text := formatfloat('0.00',rValue);
end;

procedure TPBMaintPOrdFrm.ContactComboChange(Sender: TObject);
begin
  UpdateOrderLine;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.DepthEditChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.WidthEditChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.OrderQtyMemoChange(Sender: TObject);
begin
  CalcTotalOrderValue;
  CalcTotalSalesValue;
  CalcProfitValue;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.OrdPriceMemoChange(Sender: TObject);
begin
  CalcTotalOrderValue;
  CalcProfitValue;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.SellPriceMemoChange(Sender: TObject);
begin
  CalcTotalSalesValue;
  CalcProfitValue;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.CustRefEditChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.ViewBitBtnClick(Sender: TObject);
var
  TempFrom, TempTo: string;
  TempCount: Integer;
  inx: Integer;
begin
  PBMaintPOrdLViewfrm := TPBMaintPOrdLViewfrm.create(self);

  with PBMaintPOrdLViewfrm.LineDetsStringGrid do
    begin
      Cells[0, 0] := 'Line';
      Cells[1, 0] := 'Description';
      Cells[2, 0] := 'Status';
      Cells[3, 0] := 'Quantity';
      Cells[4, 0] := 'Deliv Qty';
      Cells[0, 1] := '';
      Cells[1, 1] := '';
      Cells[2, 1] := '';
      Cells[3, 1] := '';
      Cells[4, 1] := '';

      TempFrom := '';
      TempTo := 'ZZZ';
      inx := 0;

      for TempCount := 0 to Pred(PurchaseOrder.OrderLines.Count) do
      with PurchaseOrder.OrderLines[TempCount] do
        begin
          if (AnsiUpperCase(SupplierReference) >= TempFrom) and
            (AnsiUpperCase(SupplierReference) <= TempTo) then
            begin
            Inc(inx);
            Cells[0, inx] := IntToStr(Line);
            Cells[1, inx] := SuppliersDesc;
            Cells[2, inx] := PBPODM.GetStatusDescr(POLineStatus);
            Cells[3, inx] := FormatQty(Quantity);
            Cells[4, inx] := IntToStr(Trunc(DeliveryLines.Total));
            end;
        end;
      if PurchaseOrder.OrderLines.Count > 1 then
        RowCount := PurchaseOrder.OrderLines.Count + 1
      else
        RowCount := 2;
    end;
  PBMaintPOrdLViewfrm.LineDetsStringGrid.Row := FSelectedLineIndex+1;
  PBMaintPOrdLViewfrm.showmodal;
  if PBMaintPOrdLViewfrm.modalresult = idOK then
    begin
      FSelectedLineIndex := PBMaintPOrdLViewfrm.LineDetsStringGrid.Row - 1;
      SelectionChanged;
    end;
  PBMaintPOrdLViewfrm.free;
end;

procedure TPBMaintPOrdFrm.AddLineBitBtnClick(Sender: TObject);
begin
  { Is there any more room ? }
  if PurchaseOrder.OrderLines.NextLineNumber < 1 then
    MessageDlg('Maximum number of lines already on this order', mtError,
      [mbAbort], 0)
  else
    SetNewLineDetails;

  FSelectedLineIndex := pred(PurchaseOrder.OrderLines.count);
  CheckOK(Self);
end;

procedure TPBMaintPOrdFrm.ProofDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(ProofsDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      ProofsDateEdit.Text := DateToStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdFrm.defaultSizeBtnClick(Sender: TObject);
begin
  PBLUStandSizeFrm := TPBLUStandSizeFrm.Create(Self);
  try
    PBLUStandSizeFrm.bIs_Lookup := true;
    PBLUStandSizeFrm.bAllow_Upd := True;
    PBLUStandSizeFrm.ShowModal;
    if PBLUStandSizeFrm.selected then
      begin
        DepthEdit.Text := inttostr(PBLUStandSizeFrm.SelDepth);
        Unit1.Text := cMillimetres;
        WidthEdit.Text := inttostr(PBLUStandSizeFrm.SelWidth);
        Unit2.Text := cMillimetres;
        UpdateOrderLine;
      end;
  finally
    PBLUStandSizeFrm.Free;
  end;
end;

procedure TPBMaintPOrdFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      with sgPartDetails do
      begin
        if Col < pred(colcount) then
          begin
            Col := Col + 1;
            Exit;
          end;

      end;

end;

procedure TPBMaintPOrdFrm.sgPartDetailsExit(Sender: TObject);
begin
  ChangePartDetails;
end;

procedure TPBMaintPOrdFrm.sgPartDetailsEnter(Sender: TObject);
begin
  if selectedLine.PartDetails.count = 0 then
    AddPartDetails;
end;

procedure TPBMaintPOrdFrm.sgPartDetailsClick(Sender: TObject);
begin
  with sgPartDetails do
    begin
      ColourComboBox.sendtoback;
      ColourComboBox.Visible := False;
      WeightComboBox.sendtoback;
      WeightComboBox.Visible := False;
      BrandComboBox.sendtoback;
      BrandComboBox.Visible := False;
      MaterialComboBox.sendtoback;
      MaterialComboBox.Visible := False;

      if Col = 2 then
      begin
        ColourComboBox.Top := celltop(sgPartDetails, Row);
        ColourComboBox.Left := cellleft(sgPartDetails, Col);
        ColourComboBox.width := colwidths[2];

        ColourComboBox.bringtofront;
        ColourComboBox.Visible := True;
        If ColourComboBox.Enabled then
                ColourComboBox.SetFocus;
      end
      else
      if Col = 3 then
      begin
        WeightComboBox.Top := celltop(sgPartDetails, Row);
        WeightComboBox.Left := cellleft(sgPartDetails, Col);
        WeightComboBox.width := colwidths[3];

        WeightComboBox.bringtofront;
        WeightComboBox.Visible := True;
        If WeightComboBox.Enabled then
                WeightComboBox.SetFocus;
      end
      else
      if Col = 4 then
      begin
        BrandComboBox.Top := celltop(sgPartDetails, Row);
        BrandComboBox.Left := cellleft(sgPartDetails, Col);
        BrandComboBox.width := colwidths[4];

        BrandComboBox.bringtofront;
        BrandComboBox.Visible := True;
        If BrandComboBox.Enabled then
                BrandComboBox.SetFocus;
      end
      else
      if Col = 5 then
      begin
        MaterialComboBox.Top := celltop(sgPartDetails, Row);
        MaterialComboBox.Left := cellleft(sgPartDetails, Col);
        MaterialComboBox.width := colwidths[5];

        MaterialComboBox.bringtofront;
        MaterialComboBox.Visible := True;
        If MaterialComboBox.Enabled then
                MaterialComboBox.SetFocus;
      end;
    end;
end;

function TPBMaintPOrdFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := grid.leftcol to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TPBMaintPOrdFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Top;
  for i := grid.toprow to Row do
  begin
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  end;
  Result := t;

end;

procedure TPBMaintPOrdFrm.ColourComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is Tcombobox) then
    begin
      with sgPartDetails do
      begin
        If sgPartDetails.Enabled then
                sgPartDetails.SetFocus;
        sgPartDetails.Col := sgPartDetails.Col + 1;
        exit;
      end;
    end;

end;

procedure TPBMaintPOrdFrm.sgPartDetailsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  {Code extracted from the Delphi Info base No 609}
  if Sender = ActiveControl then Exit;
  if not (gdSelected in State) then Exit;
  with Sender as TStringGrid do
  begin
    Canvas.Brush.Color := Color;
    Canvas.Font.Color := Font.Color;
    Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[Col, Row]);
  end;

  ColourComboBox.width := sgPartDetails.colwidths[2];
  WeightComboBox.width := sgPartDetails.colwidths[3];
  BrandComboBox.width := sgPartDetails.colwidths[4];
  MaterialComboBox.width := sgPartDetails.colwidths[5];
end;

procedure TPBMaintPOrdFrm.MaterialComboBoxClick(Sender: TObject);
begin
  sgPartDetails.Cells[5, sgPartDetails.Row] :=
      MaterialComboBox.text;

end;

procedure TPBMaintPOrdFrm.MaterialComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is Tcombobox) then
    begin
      MaterialComboBoxClick(Self);
      with sgPartDetails do
      begin
//        bMoved := True;
        If sgPartDetails.Enabled then
                sgPartDetails.SetFocus;
        sgPartDetails.Col := sgPartDetails.Col + 1;
        exit;
      end;
    end;


end;

procedure TPBMaintPOrdFrm.BrandComboBoxClick(Sender: TObject);
begin
  sgPartDetails.Cells[4, sgPartDetails.Row] :=
      BrandComboBox.text;

end;

procedure TPBMaintPOrdFrm.WeightComboBoxClick(Sender: TObject);
begin
  sgPartDetails.Cells[3, sgPartDetails.Row] :=
      WeightComboBox.text;

end;

procedure TPBMaintPOrdFrm.ColourComboBoxClick(Sender: TObject);
begin
  sgPartDetails.Cells[2, sgPartDetails.Row] :=
      ColourComboBox.text;
end;

procedure TPBMaintPOrdFrm.WeightComboBoxExit(Sender: TObject);
begin
  ChangePartDetails;
  WeightComboBox.Visible := False;
  WeightComboBoxClick(self);
end;

procedure TPBMaintPOrdFrm.BrandComboBoxExit(Sender: TObject);
begin
  ChangePartDetails;
  BrandComboBox.Visible := False;
  BrandComboBoxClick(self);
end;

procedure TPBMaintPOrdFrm.MaterialComboBoxExit(Sender: TObject);
begin
  ChangePartDetails;
  MaterialComboBox.Visible := False;
  MaterialComboBoxClick(self);
end;

procedure TPBMaintPOrdFrm.AddDetailsListDblClick(Sender: TObject);
begin
  btnChgSuppCustNotesClick(self);
end;

procedure TPBMaintPOrdFrm.AddDetailsListContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  if AddDetailsList.items.count = 0 then
    begin
    change2.enabled := false;
    delete2.enabled := false;
    end
  else
    begin
    change2.enabled := true;
    delete2.enabled := true;
    end
end;

procedure TPBMaintPOrdFrm.Add1Click(Sender: TObject);
begin
  AddPartDetails;
end;

procedure TPBMaintPOrdFrm.MaintainPapers1Click(Sender: TObject);
begin
  {Start up the groupings program}
  PBMaintpaperFrm := TPBMaintpaperFrm.Create(Self);
  try
    PBMaintPaperFrm.ShowModal;
  finally
    PBMaintPaperFrm.Free;
  end;
end;

procedure TPBMaintPOrdFrm.DelivDetsStringGridClick(Sender: TObject);
begin
 FSelectedDeliveryIndex := DelivDetsStringGrid.Row - 1;
  if Assigned(SelectedDelivery) then
    ShowDeliveryDetails(SelectedDelivery)
  else
    DelInstructMemo.Lines.Clear;
end;

procedure TPBMaintPOrdFrm.MarginDefaults1Click(Sender: TObject);
begin
  with sgPartDetails do
  begin
    cells[10,sgPartDetails.row] := '1/2"';
    cells[11,sgPartDetails.row] := '1/2"';
    cells[8,sgPartDetails.row] := 'Std';
    cells[9,sgPartDetails.row] := 'Std';
  end;
end;

procedure TPBMaintPOrdFrm.sgPartDetailsContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  ChangePartDetails;
  if selectedLine.PartDetails.count = 1 then
    Delete1.enabled := false
  else
    Delete1.enabled := true;
end;

procedure TPBMaintPOrdFrm.sgCallOffSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  DisplayCallOffButtons(Arow);
end;

procedure TPBMaintPOrdFrm.DisplayCallOffButtons(irow: integer);
var
  CallOffOrder: TCallOffOrder;
begin
  with sgCallOff do
    begin
      if (irow = 0) or (trim(Cells[0, irow]) = '') then
        exit;

      FSelectedCallOffIndex := irow-1;
      CallOffOrder := SelectedCallOffOrder.Clone;
      if cells[0,irow] = '<New Order>' then
        CallOffDelBtn.Caption := 'Delete'
      else
        if CallOffOrder.Inactive = 'Y' then
          begin
          CallOffDelBtn.Caption := 'Restore';
          CallOffchgBtn.enabled := false;
          end
      else
        begin
        CallOffDelBtn.Caption := 'Cancel';
        CallOffChgBtn.enabled := true;
        end;
    end;
end;

procedure TPBMaintPOrdFrm.popCallOffPopup(Sender: TObject);
begin
  popCallOffdelBtn.caption := CallOffDelBtn.Caption;
end;

procedure TPBMaintPOrdFrm.ArtworkBtnClick(Sender: TObject);
var
  TempLoop: integer;
begin
  PBLUArtwrkTypfrm := TPBLUArtwrkTypfrm.Create(Owner);
  try
    PBLUArtwrkTypfrm.bIs_Lookup := True;
    PBLUArtwrkTypfrm.bAllow_Upd := True;

    SelectedLine.ArtWork := '';
    PBLUArtwrkTypfrm.ShowModal;
(*    if PBLUArtwrkTypfrm.selected then
    begin
      SelectedLine.ArtWork := PBLUArtwrkTypfrm.Selname;
      ArtEdit.text := PBLUArtwrkTypfrm.Selname;
    end;
*)
    if PBLUArtwrkTypfrm.selected then
    begin
      {Update the artwork property and field with the selected details}
      PBLUArtwrkTypfrm.DetsDbGrid.Datasource.Dataset.DisableControls;
      for TempLoop := 0 to pred(PBLUArtwrkTypfrm.DetsDBGrid.SelectedRows.count) do
		    begin
          PBLUArtwrkTypfrm.DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(PBLUArtwrkTypfrm.DetsDBGrid.SelectedRows[TempLoop]));
          SelectedLine.ArtWork := SelectedLine.ArtWork +
            (PBLUArtwrkTypfrm.DetsDBGrid.dataSource.dataset.fieldbyname('Artwork_Instructions').asstring) +
            #13#10;
        end;
      PBLUArtwrkTypfrm.DetsDbGrid.Datasource.Dataset.EnableControls;
      ArtEdit.text := SelectedLine.ArtWork;
    end;
  finally
    PBLUArtwrkTypfrm.free;
  end;
end;

procedure TPBMaintPOrdFrm.CalcProfitValue;
var
  rValue, rValue2: real;
begin
(*  if (TotOrderMemo.text = '0.00') or (TotSellMemo.Text = '0.00') then
        begin
          ProfMemo.Text := '0.00';
          PercProfMemo.Text := '0.00';
          exit;
      end;
*)

//  if ValueMemo.Text <> '' then
//    rvalue := StrToFloatDef(TotSellMemo.Text, 0, FormatSettings) - StrToFloatDef(TotOrderMemo.Text, 0, FormatSettings) - StrToFloatDef(ValueMemo.Text, 0, FormatSettings)
//  else
// Bug : addit costs already included in total cost/total sell so profit calc is the same regardless 
    rvalue := StrToFloatDef(TotSellMemo.Text, 0, FormatSettings) - StrToFloatDef(TotOrderMemo.Text, 0, FormatSettings);
  ProfMemo.Text := formatfloat('0.00',rValue);
  try
    rvalue2 := (rvalue * 100 / StrToFloatDef(TotSellMemo.Text, 0, FormatSettings));
  except
    rvalue2 := -99999.99
  end;
  if rvalue = 0 then
    rvalue2 := 0.00;
  PercProfMemo.Text := formatfloat('0.00',rvalue2);
end;

procedure TPBMaintPOrdFrm.ProofsReqChkBoxExit(Sender: TObject);
begin
UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.ProofStatDBLUCBExit(Sender: TObject);
begin
UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.ProofDateBtnExit(Sender: TObject);
begin
UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.ProofsDateEditExit(Sender: TObject);
begin
UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.GetCharges;
var
  rValue, rvalue1: real;
  TempCount: Integer;
begin
    rvalue := 0;
    rvalue1 := 0;
    for TempCount := 0 to Pred(selectedline.ExtraCharges.Count) do
      with SelectedLine.ExtraCharges[TempCount] do
      begin
        rvalue := rvalue + Amount;
        rvalue1 := rvalue1 + QuotationPrice
      end;
  OrdChrgMemo.text := formatfloat('0.00',rValue);
  slsChrgMemo.text := formatfloat('0.00',rValue1);
end;

procedure TPBMaintPOrdFrm.chkInvoiceUpfrontClick(Sender: TObject);
begin
  if (SelectedLine.POLineStatus >= plSomeInvoiceRaised) and
      (not (Sender as TCheckBox).checked) then
    begin
      MessageDlg('An invoice has already been raised for this stock order, '
              + 'changing this setting will allow the invoicing of call off orders.', mtWarning,
      [mbOk], 0);
    end;

  if chkInvoiceUpfront.checked  then
    SelectedLine.InvoiceUpfront := 'Y'
  else
    SelectedLine.InvoiceUpfront := 'N';

end;

procedure TPBMaintPOrdFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  
  if bOK then exit;

  if not(OKBitBtn.enabled) then exit;

  TempWord := MessageDlg('Do you want to save these order details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    OKBitBtnClick(self);
end;

procedure TPBMaintPOrdFrm.btnLUAddChrgClick(Sender: TObject);
var
  x: integer;
  bTempOK: Boolean;
  ExtraCharge: TExtraCharge;
begin
  bTempOK := false;
  PBLUAddChrgFrm := TPBLUAddChrgFrm.Create(Self);
  try
    PBLUAddChrgFrm.bIs_Lookup := True;
    PBLUAddChrgFrm.bAllow_Upd := False;
    PBLUAddChrgFrm.ShowModal;
    bTempOk := PBLUAddChrgFrm.selected;
    if bTempOK then
    begin
      with PBLUAddChrgFrm.dbgrdDets.datasource.dataset do
      begin
        for x:=0 to pred(PBLUAddChrgFrm.dbgrdDets.SelectedRows.Count) do
        begin
          ExtraCharge := TExtraCharge.Create;
          GotoBookmark(TBookmark(PBLUAddChrgFrm.dbgrdDets.SelectedRows.Items[x]));
          ExtraCharge.Details := FieldByName('Details').asString;
          ExtraCharge.Amount := FieldByName('Amount').asFloat;
          ExtraCharge.QuotationPrice := FieldByName('Quotation_price').asFloat;
          ExtraCharge.VatCode := PurchaseOrder.OrderLines[0].VATCode;
          ExtraCharge.Line := SelectedLine.Line;
          ExtraCharge.AdditionalCharge := SelectedLine.ExtraCharges.NextChargeNumber;
          SelectedLine.ExtraCharges.Add(ExtraCharge);
        end;
        ShowExtChgGrid(Self);
      end;
    end;

  finally
    PBLUAddChrgFrm.Free;
  end;

  getCharges;
  OrderQtyMemoChange(Self);
end;

procedure TPBMaintPOrdFrm.SetJobBagNo(const Value: integer);
begin
  FJobBagNo := Value;
  ContactCombo.enabled := not (Value > 0);
  CustLUBtn.Enabled := not (Value > 0);
  ContactLUBtn.Enabled := not (Value > 0);
  RePLUButton.enabled := not (Value > 0);
end;

procedure TPBMaintPOrdFrm.SetDelivNotes(const Value: string);
begin
  fDelivNotes := Value;
end;

procedure TPBMaintPOrdFrm.chkbxMake2InvoiceClick(Sender: TObject);
begin
  if chkbxmake2Invoice.checked  then
    SelectedLine.CallOffInvoicedUpfront := 'N'
  else
    SelectedLine.CallOffInvoicedUpfront := 'Y';
end;

procedure TPBMaintPOrdFrm.DisplayIntNotes;
var
  inx: integer;
begin
  ResetIntNotesDisplay;
  self.sgIntNotes.Cells[0, 0] := 'Date';
  self.sgIntNotes.Cells[1, 0] := 'Operator';

  inx := self.SelectedLine.IntNoteList.Count - 1;
  if self.SelectedLine.IntNoteList.Count > 0 then
  begin
    self.sgIntNotes.RowCount :=
      self.SelectedLine.IntNoteList.Count + 1;
    self.mmIntNote.Text :=
      self.SelectedLine.IntNoteList[inx].Narrative.DataInfo;
    self.btbtnChangeIntNote.Enabled := true;
    self.btbtnDeleteIntNote.Enabled := true;
  end
  else
  begin
    self.btbtnChangeIntNote.Enabled := false;
    self.btbtnDeleteIntNote.Enabled := false;
  end;

  for inx := (self.SelectedLine.IntNoteList.Count - 1) downto 0 do
  begin
    sgIntNotes.Cells[0, self.SelectedLine.IntNoteList.Count - inx] :=
      DateTimeToStr(self.SelectedLine.IntNoteList[inx].DateEntered);
    sgIntNotes.Cells[1, self.SelectedLine.IntNoteList.Count - inx] :=
      (self.SelectedLine.IntNoteList[inx].OperatorName);
  end;

  if self.SelectedLine.IntNoteList.Count > 0 then
  begin
    self.sgIntNotes.Row := 1;
  end;
end;

procedure TPBMaintPOrdFrm.sgIntNotesClick(Sender: TObject);
var
  inx: integer;
begin
  if self.SelectedLine.IntNoteList.Count = 0 then
    exit;
    
  self.mmIntNote.Clear;
  inx :=  self.selectedLine.IntNoteList.Count - self.sgIntNotes.row;
  self.mmIntNote.Text :=
    self.SelectedLine.IntNoteList[inx].Narrative.DataInfo;
end;

procedure TPBMaintPOrdFrm.ResetIntNotesDisplay;
begin
  self.mmIntNote.Clear;
  self.sgIntNotes.rowcount := 2;
  self.sgIntNotes.Cells[0,1] := '';
  self.sgIntNotes.Cells[1,1] := '';
end;

procedure TPBMaintPOrdFrm.btbtnAddIntNoteClick(Sender: TObject);
var
  IntNote: TIntNote;
  noteFrm: TPBMaintIntNoteFrm;
begin
  IntNote := TIntNote.Create;
  noteFrm := TPBMaintIntNoteFrm.Create(self);

  IntNote.Operator := frmPBMainMenu.iOperator;
  IntNote.OperatorName := frmpBMainMenu.sOperator_name;
  IntNote.DateEntered := Now();

  if noteFrm.New(IntNote) then
  begin
    IntNote.Narrative.SaveToDB;
    selectedLine.IntNoteList.add(IntNote);
    self.sgIntNotes.RowCount := selectedLine.IntNoteList.Count + 1;
    self.sgIntNotes.Cells[0, self.sgIntNotes.RowCount - 1] :=
      DateTimeToStr(IntNote.DateEntered);
    self.sgIntNotes.Cells[1, self.sgIntNotes.RowCount - 1] :=
      IntNote.OperatorName;
    self.sgIntNotes.Row := selectedLine.IntNoteList.Count;

    self.DisplayIntNotes;
  end
  else
  begin
    IntNote.Free;
  end;
  noteFrm.Free;
end;

procedure TPBMaintPOrdFrm.btbtnChangeIntNoteClick(Sender: TObject);
var
  inx: integer;
  noteFrm: TPBMaintIntNoteFrm;
begin
  noteFrm := TPBMaintIntNoteFrm.Create(self);
  inx := selectedLine.IntNoteList.Count - self.sgIntNotes.row;
  if noteFrm.Edit(selectedLine.IntNoteList[inx]) then
  begin
    self.DisplayIntNotes;
  end;
  self.sgIntNotes.Row := selectedLine.IntNoteList.Count - inx;

  noteFrm.Free;
end;

procedure TPBMaintPOrdFrm.btbtnDeleteIntNoteClick(Sender: TObject);
var
  inx: integer;
  noteFrm: TPBMaintIntNoteFrm;
begin
  noteFrm := TPBMaintIntNoteFrm.Create(self);
  inx := selectedLine.IntNoteList.Count - self.sgIntNotes.row;
  if noteFrm.Delete(selectedLine.IntNoteList[inx]) then
  begin
    selectedLine.IntNoteList[inx].Narrative.Delete;
    selectedLine.IntNoteList.Delete(inx);
  self.DisplayIntNotes;
  end;
  noteFrm.Free;
end;

procedure TPBMaintPOrdFrm.btbtnAppntmntClick(Sender: TObject);
var
  sSubject, sBody: string;
  AppDateTime: TDateTime;
  Hour, Min, Sec, MSec: Word;
begin
  PBMaintContAppfrm := TPBMaintContAppfrm.create(self);
  try
    PBMaintContAppfrm.showmodal;
    if PBMaintContAppfrm.modalresult = idOK then
      begin
        sSubject := 'Ref: Purchase Order No.' + POrdNoMemo.text + ' - Customer:' + CustNameEdit.text;
        
        if self.SelectedLine.IntNoteList.Count = 0 then
          sBody := sBody + ''
        else
          sBody := sBody + 'Last event details: ' +
            self.SelectedLine.IntNoteList[self.SelectedLine.IntNoteList.count - 1].OperatorName + ' - ' +
            DateTimeToStr(self.SelectedLine.IntNoteList[self.SelectedLine.IntNoteList.count - 1].DateEntered) +
            #13#10 + #13#10 +
            self.SelectedLine.IntNoteList[self.SelectedLine.IntNoteList.count - 1].Narrative.DataInfo;

        decodetime(PBMaintContAppfrm.dtpckAppTime.time,Hour,Min,Sec,Msec);
//        AppDatetime := PBMaintContAppFrm.mnthCalApp.date + encodetime(Hour,Min,Sec,Msec);
        AppDatetime := PBMaintContAppFrm.DateTimePicker.date + encodetime(Hour,Min,Sec,Msec);
        AddAppViaOutLook('',sSubject,sBody,AppDateTime,true,20);
      end;
  finally
    PBMaintContAppfrm.free;
  end;

end;

procedure TPBMaintPOrdFrm.NumberingEditExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.PlateChangeSpinExit(Sender: TObject);
begin
 UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.CustReqDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(CustReqDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      try
        self.edtLifeExp.Text := DateToStr(DateSelV5Form.Date +
          StrToDate(self.edtLifeExp.Text) - StrToDate(CustReqDateEdit.Text));
      except

      end;
      self.OldCustReqDate := DateSelV5Form.Date;
      CustReqDateEdit.Text := DateToStr(DateSelV5Form.Date);
      UpdateOrderLine;
      UpdateDelivery;
      
      CheckOK(self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdFrm.CustReqDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If CustReqDateEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(CustReqDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      If CustReqDateEdit.Enabled then
        CustReqDateEdit.SetFocus;
      Exit;
    end;
  end;
                                      
  try
    self.edtLifeExp.Text := DateToStr(StrToDate(self.edtLifeExp.Text) -
      self.OldCustReqDate + StrToDate(CustReqDateEdit.Text));
  except
  end;

  CustReqDateEdit.Text := PBDatestr(NewDate);
  UpdateOrderLine;
  UpdateDelivery;
end;

function TPBMaintPOrdFrm.UpdJobBagHeadRqd(POnumber: real): Boolean;
begin
  Result := False;
  if (CustDescEdit.Modified) or (OrderQtyMemo.Modified) or (CustReqDateEdit.Modified) or
    (CustRefEdit.Modified) then
    begin
      with PBPODM.chkjobbaglnSQL do
      begin
        close;
        ParamByname('Job_Bag').AsInteger := selectedline.JobBagNumber;
        ParamByName('Purchase_Order').asFloat := PONumber;
        Open;
        Result := fieldByName('Purchase_Order').AsFloat = PONumber;
      end;
    end;
end;

procedure TPBMaintPOrdFrm.UpdateJobBagHead(const inx: Integer);
var
  tempStatus, jbLineNo: integer;
begin
  UpdJobBagHead := false;
  tempStatus := 10;

  with PBPODM.GetJBPOStatii do
  begin
    close;
    ParamByName('Job_Bag').asInteger := PurchaseOrder.OrderLines[inx].JobBagNumber;
    open;
    if ((FieldByName('minStat').asInteger = 10)
      and (FieldByName('maxStat').asInteger = 10)) then
    begin
      tempStatus := 10;
    end
    else
    begin
      if ((FieldByName('minStat').asInteger = 30)
        and (FieldByName('maxStat').asInteger = 30)) then
      begin
        tempStatus := 30;
      end
      else
      begin
        tempStatus := 25;
      end;
    end;
    close;
  end;
  //update the job bag head status
  with PBPODM.UpdJobBagHeadStat do
  begin
    ParamByName('status').asInteger := tempStatus;
    ParamByName('job_bag').asInteger := PurchaseOrder.OrderLines[inx].JobBagNumber;
    ExecSQL;
  end;

  with PBPODM.GetJobBagDetsSQL do
  begin
    Close;
    ParamByName('purchase_order').asFloat := PurchaseOrder.PONumber;
    ParamByName('line').asInteger := PurchaseOrder.OrderLines[inx].Line;
    Open;

    jbLineNo :=  FieldByName('Job_Bag_Line').asInteger;
    Close;
  end;

  if (jbLineNo <> 1) then
    exit;
    
  if  (MessageDlg('This is the first order in the job bag, do you wish to amend the job bag header information ?',
                  mtConfirmation, [mbNo, mbYes], 0) <> mrYes) then
    Exit;

  with PBPODM.UpdJobBagHeadSQL, PurchaseOrder.OrderLines[inx] do
  begin
    ParamByName('Job_Bag').asInteger := JobBagNumber;
    Parambyname('Job_Bag_Descr').asstring := CustomersDesc;
    parambyname('Goods_Required').asdatetime := GoodsRequiredByCust;
    parambyname('Quantity').asfloat := Quantity;
    parambyname('Cust_Order_no').asstring := CustOrderNo;
    parambyname('Invoice_upfront').asstring := InvoiceUpfront;
    PBPODM.UpdJobBagHeadSQL.ExecSQL;
    UpdJobBaghead := True;
  end;
end;

procedure TPBMaintPOrdFrm.ExpLifeDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtLifeExp.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      edtLifeExp.Text := DateToStr(DateSelV5Form.Date);
      UpdateOrderLine;
      UpdateDelivery
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintPOrdFrm.setUpdJobBagHead(const Value: boolean);
begin
  fUpdJobBagHead := Value;
end;

procedure TPBMaintPOrdFrm.UpdateSalesInvoice(const inx: integer);
begin
  with PBPODM.UpdSILineSQL, PurchaseOrder.OrderLines[inx] do
  begin
    close;
    ParamByName('Purchase_order').asfloat := PurchaseOrder.PONumber;
    Parambyname('Line').asinteger := Line;
    parambyname('Product_type').asinteger := ProductType;
    execsql;
  end;

end;

procedure TPBMaintPOrdFrm.UpdateStoreStock(const inx: integer);
var
  iFactor: integer;
  rUnitCost, rUnitSell: real;
begin
  {Get the Cost Unit Factor}
  with PBPODM.PriceUnitSQL do
    begin
      close;
      parambyname('Price_Unit').asinteger := PurchaseOrder.OrderLines[inx].OrderUnit;
      open;
      iFactor := fieldbyname('Price_unit_Factor').asinteger;
    end;

  if iFactor = 0 then
    rUnitCost := (PurchaseOrder.OrderLines[inx].OrderPrice/PurchaseOrder.OrderLines[inx].Quantity)
  else
    rUnitCost := (PurchaseOrder.OrderLines[inx].OrderPrice/iFactor);

  {Get the Sell Unit Factor}
  with PBPODM.PriceUnitSQL do
    begin
      close;
      parambyname('Price_Unit').asinteger := PurchaseOrder.OrderLines[inx].SellUnit;
      open;
      iFactor := fieldbyname('Price_unit_Factor').asinteger;
    end;

  if iFactor = 0 then
    rUnitSell := (PurchaseOrder.OrderLines[inx].SellingPrice/PurchaseOrder.OrderLines[inx].Quantity)
  else
    rUnitSell := (PurchaseOrder.OrderLines[inx].SellingPrice/iFactor);

  with PBPODM.UpdStoreStockSQL do
  begin
    close;
    ParamByName('Purchase_order').asfloat := PurchaseOrder.PONumber;
    if chkInvoiceUpfront.checked then
      begin
        ParamByName('Invoice_Upfront').Asstring := 'Y';
        ParamByName('Unit_Cost').Asfloat := 0;
      end
    else
      begin
        ParamByName('Invoice_Upfront').Asstring := 'N';
        ParamByName('Unit_Cost').Asfloat := rUnitCost;
      end;
    execsql;
  end;
end;

procedure TPBMaintPOrdFrm.edtLifeExpExit(Sender: TObject);
var
  tempDate: TDateTime;
  dateOK: boolean;
begin
  dateOK := false;
  if self.edtLifeExp.Text = '' then
  begin
    dateOK := true;
  end
  else
  begin
    try
      StrToDate(edtLifeExp.Text);
      dateOK := true;
    except
      MessageDlg('Invalid Date Format.', mtError, [mbOK], 0);
    end;
  end;

  if dateOK then
  begin
    UpdateOrderLine;
    UpdateDelivery;
  end;
end;

procedure TPBMaintPOrdFrm.CustReqDateEditEnter(Sender: TObject);
begin
  try
    self.OldCustReqDate := StrToDate(CustReqDateEdit.text);
  except
    self.OldCustReqDate := date+1;
  end;
end;

procedure TPBMaintPOrdFrm.FormShow(Sender: TObject);
var
  sAuthoriseLevel: string;
begin
  GetCompany;
  try
    OrderLinePage.pages[5].tabvisible := not (PBPODM.GetCompanySQL.fieldbyname('Use_Stock_system').asstring = 'Y');
    OrderLinePage.pages[6].TabVisible := not OrderLinePage.pages[5].tabvisible;
    OrderLinePage.Pages[8].TabVisible := dmBroker.UseNonConformance;
  except
    OrderLinePage.pages[5].tabvisible := true;
  end;
  if PBPODM.GetCompanySQL.fieldbyname('Form_Reference_Mandatory').asString = 'Y' then
    FormRefClrBitBtn.Visible := false;

  if (dmBroker.AuthorisePOs = 'Y') or (PurchaseOrder.NeedsAuthorising) then
    begin
      sAuthoriseLevel := dmBroker.CanAuthorise(frmpbMainMenu.iOperator);
      chkbxAuthorised.Visible :=
                              ((PurchaseOrder.Operator <> frmpbMainMenu.iOperator)) and
                              ((sAuthoriseLevel = 'F') and (FuncMode <> poAdd) and (FuncMode <> poRepeat) and (FuncMode <> poCopy) and (SelectedLine.TotalCostValue <= myMaxOrderLimit) or
                              ((sAuthoriseLevel = 'P') and (FuncMode <> poAdd) and (FuncMode <> poRepeat) and (FuncMode <> poCopy) and (SelectedLine.TotalCostValue <= myMaxOrderLimit) and (SelectedLine.SellingPrice <> 0)) or
                              ((sAuthoriseLevel = 'F') or (sAuthoriseLevel = 'P')) and (PurchaseOrder.AuthorisedBy <> 0));
    end
  else
    chkbxAuthorised.Visible := false;

//  edtAltPurchaseOrder.Visible := chkbxAuthorised.Visible;
//  lblAltPurchaseOrder.Visible := chkbxAuthorised.Visible;

  lblAuthorisedBy.left := chkbxAuthorised.Left;
  lblAuthorisedBy.visible := not chkbxAuthorised.Visible;
  btnAuthNotes.Visible := chkbxAuthorised.Visible or (lblAuthorisedBy.caption <> '');

  if self.reselectCust then
  begin
    selectedline.Customer := 0;
    selectedline.BranchNo := 0;
    CustLUBtnClick(CustLUBtn);
  end;
end;

procedure TPBMaintPOrdFrm.dblkpVatRateClick(Sender: TObject);
begin
  UpdateOrderLine;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.CheckForCustomerNotes;
begin
  if CustNameEdit.text <> '' then
  begin
    PBLUCustFrm := TPBLUCustFrm.Create(Self);
    try
      PBLUCustFrm.SelCode := SelectedLine.Customer;
      PBLUCustFrm.SelBranch := SelectedLine.BranchNo;
      PBLUCustFrm.ShowCustomerData;
//      PBLUCustFrm.dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(SelectedLine.Customer)),[lopartialKey]) ;
      if PBLUCustFrm.dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
        PBLUCustFrm.ShowNotes(self);
    finally
      PBLUCustFrm.Free;
    end;
  end;
end;

function TPBMaintPOrdFrm.IsCustomerActive(TempCust: integer): boolean;
begin
 with PBPODM.GetCustSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    Result := (FieldByName('Acc_Active').AsString = 'Y');
    Close;
  end;
end;

function TPBMaintPOrdFrm.IsSellUnitInActive(TempCode: integer): boolean;
begin
 with PBPODM.PriceUnitSQL do
  begin
    Close;
    ParamByName('Price_unit').AsInteger := TempCode;
    Open;
    Result := (FieldByName('Price_Unit_InActive').AsString = 'Y');
    Close;
  end;
end;

function TPBMaintPOrdFrm.IsCostUnitInActive(TempCode: integer): boolean;
begin
 with PBPODM.PriceUnitSQL do
  begin
    Close;
    ParamByName('Price_Unit').AsInteger := TempCode;
    Open;
    Result := (FieldByName('Price_Unit_InActive').AsString = 'Y');
    Close;
  end;
end;

procedure TPBMaintPOrdFrm.DisplayNonConformDetails;
var
  icount: integer;
  irow, icol: integer;
begin
  icount := 0;

  with sgNCADetails do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
    end;

  with sgNCADetails do
    begin
      for irow := 0 to pred(SelectedLine.NonConformDocs.count) do
        begin
          cells[0,irow+1] := inttostr(SelectedLine.NonConformDocs[irow].NonConformNo);
          cells[1,irow+1] := inttostr(SelectedLine.NonConformDocs[irow].NCNumber);

          cells[2,irow+1] := pbdatestr(SelectedLine.NonConformDocs[irow].DatePoint);
          cells[3,irow+1] := SelectedLine.NonConformDocs[irow].NCTypeDescription;
          cells[4,irow+1] := SelectedLine.NonConformDocs[irow].StatusDescription;
          cells[5,irow+1] := SelectedLine.NonConformDocs[irow].RaisedByName;
          cells[6,irow+1] := SelectedLine.NonConformDocs[irow].NCDepartmentName;
          cells[7,irow+1] := SelectedLine.NonConformDocs[irow].QAOperatorName;
          cells[8,irow+1] := pbdatestr(SelectedLine.NonConformDocs[irow].QASignOffDate);
          cells[9,irow+1] := formatfloat('0.00',SelectedLine.NonConformDocs[irow].TotalCost);
          icount := icount + 1;
        end;

      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
      sgNCADetailsClick(self);
    end;
  btnAddNCA.enabled := (FFuncMode <> poAdd) and (FFuncMode <> poRepeat) and (FFuncMode <> poCopy) and (FFuncMode <> poView);
  btnChangeNCA.Enabled := (SelectedLine.NonConformDocs.count > 0);
  btnDeleteNCA.Enabled := (SelectedLine.NonConformDocs.count > 0);
  btnPrintNCA.Enabled := (SelectedLine.NonConformDocs.count > 0);
end;

procedure TPBMaintPOrdFrm.DisplayStockCodes;
var
  icount: integer;
  irow, icol: integer;
begin
  icount := 0;

  with sgVersions do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
    end;

  with sgVersions do
    begin
      for irow := 0 to pred(SelectedLine.StockCodes.count) do
        begin
          cells[0,irow+1] := SelectedLine.StockCodes[irow].FormReferenceID;
          cells[1,irow+1] := SelectedLine.StockCodes[irow].StockReference;

          cells[2,irow+1] := SelectedLine.StockCodes[irow].Description;
          cells[3,irow+1] := floattostr(SelectedLine.StockCodes[irow].QtyOrdered);
          cells[4,irow+1] := floattostr(SelectedLine.StockCodes[irow].QtyDelivered);
          icount := icount + 1;
        end;

      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnAddStockcode.enabled := (FFuncMode <> poAdd) and (FFuncMode <> poRepeat) and (FFuncMode <> poCopy) and (FFuncMode <> poView);
  btnChangeStockCode.Enabled := (SelectedLine.StockCodes.count > 0);
  btnDeleteStockCode.Enabled := (SelectedLine.StockCodes.count > 0);
end;

procedure TPBMaintPOrdFrm.DisplayDocumentList;
var
  docInx: integer;
  tempStr: string;
begin
  ResetDocumentListDisplay;

  if selectedLine.DocumentList.Count > 0 then
  begin
    strgrdDocs.RowCount := selectedLine.DocumentList.Count + 1;
    btbtnChangeDoc.Enabled := true;
    btbtnDeleteDoc.enabled := true;
    btbtnOpen.Enabled := true;
  end
  else
  begin
    strgrdDocs.RowCount := 2;
    btbtnChangeDoc.Enabled := false;
    btbtnDeleteDoc.enabled := false;
    btbtnOpen.Enabled := false;
  end;

  for docInx := 0 to (selectedLine.DocumentList.Count - 1) do
  begin
    strgrdDocs.cells[0, docInx + 1] := selectedLine.DocumentList[docInx].Title;
    tempStr :=  selectedLine.DocumentList[docInx].Path;

    if copy(tempStr, 1 ,1) = '\' then
      strgrdDocs.cells[1, docInx + 1] := copy(tempStr,2, length(tempStr))
    else
      strgrdDocs.cells[1, docInx + 1] := tempStr;
  end;
end;

procedure TPBMaintPOrdFrm.ResetDocumentListDisplay;
begin
  strgrdDocs.cells[0, 0] := 'Title';
  strgrdDocs.cells[1, 0] := 'Location';
  strgrdDocs.cells[0, 1] := '';
  strgrdDocs.cells[1, 1] := '';
  strgrdDocs.ColWidths[0] := 200;
  strgrdDocs.ColWidths[1] := strgrdDocs.Width - 205;
end;

procedure TPBMaintPOrdFrm.btbtnAddDocClick(Sender: TObject);
var
  docDir, tempStr, tempStr2: string;
//  PBMaintPOLineDocFrm: TPBMaintPOLineDocFrm;
  document: TDocument;
  icount: integer;
begin
  docDir := dmBroker.GetCompanyPurchaseOrderDirectory + '\' + floattostr(PurchaseOrder.PONumber);
  tempStr2 := docDir;

  tempStr := '';

  {Find a document} ;
  With DocOpenDialog do
  begin
    InitialDir := tempStr2;
    FileName := tempStr ;
    ForceCurrentDirectory := false;
    If Execute then
    begin
      {Check that they have NOT gone out of document directory} ;
      If Lowercase(Copy(FileName,1, Length(docDir))) <> Lowercase(docDir) then
      begin
        MessageDlg('You can''t select a document outside the Buy Print Order Document Directory',
                                                mtError,[mbOK],0) ;
      end
      else
      begin
        for icount := 0 to pred(Files.Count) do
          begin
            Document := TDocument.Create;
            Document.Title := Copy(Files.Strings[icount], Length(docDir)+2,100);
            Document.Path := Copy(Files.Strings[icount], length(dmBroker.GetCompanyPurchaseOrderDirectory)+1,255);
            if assigned(document) then
              begin
                SelectedLine.DocumentList.add(document);
              end;
          end;
      end;
      self.DisplayDocumentList;
    end;
  end;
(*  PBMaintPOLineDocFrm := TPBMaintPOLineDocFrm.create(self);
  try
    document := PBMaintPOLineDocFrm.New;
    if assigned(document) then
    begin
      selectedLine.DocumentList.add(document);
      self.DisplayDocumentList;
    end;
  finally
    PBMaintPOLineDocFrm.free;
  end;
*)
end;

procedure TPBMaintPOrdFrm.btbtnChangeDocClick(Sender: TObject);
var
  PBMaintPOLineDocFrm: TPBMaintPOLineDocFrm;
begin
  PBMaintPOLineDocFrm := TPBMaintPOLineDocFrm.create(self);
  try
    PBMaintPOLineDocFrm.edit(selectedLine.DocumentList[strgrdDocs.row - 1]);
    if PBMaintPOLineDocFrm.ModalResult = mrOK then
    begin
      self.DisplayDocumentList;
    end;
  finally
    PBMaintPOLineDocFrm.free;
  end;
end;

procedure TPBMaintPOrdFrm.btbtnDeleteDocClick(Sender: TObject);
var
  PBMaintPOLineDocFrm: TPBMaintPOLineDocFrm;
begin
  PBMaintPOLineDocFrm := TPBMaintPOLineDocFrm.create(self);
  try
    PBMaintPOLineDocFrm.Delete(selectedLine.DocumentList[strgrdDocs.row - 1]);
    if PBMaintPOLineDocFrm.ModalResult = mrOK then
    begin
      selectedLine.DocumentList.Delete(strgrdDocs.row - 1);
      self.DisplayDocumentList;
    end;
  finally
    PBMaintPOLineDocFrm.free;
  end;
end;

procedure TPBMaintPOrdFrm.btbtnOpenClick(Sender: TObject);
var
  iTempResult: Integer;
  FiName, DiName, Params: Array [0..255] of char ;
  document: TDocument;
  sTempError: String ;
  tempdir: string;
begin
  if strgrdDocs.Cells[1, strgrdDocs.row] = '' then
    exit;
    
  document := selectedLine.DocumentList[strgrdDocs.row - 1];

  if (copy(compdir,length(compdir),1) <> '\') and
      (compdir <> '') then
    tempdir := compDir + '\'
  else
    tempdir := trim(compDir);

  Params := '' ;
  StrPCopy(FiName, tempDir + document.path) ;

(*  If UpperCase(Copy(document.path, Length(document.path)-3,4)) <> '.PDF' then
  begin
    {NOT a PDF so just open the document} ;
    Params := '' ;
    StrPCopy(FiName, tempDir + document.path) ;
  end
  else
  begin
    {IS a PDF so just open it in internet explorer} ;
    StrPCopy(Params, tempDir + document.path) ;
    StrPCopy(FiName,'iExplore.exe') ;
  end;
*)
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

procedure TPBMaintPOrdFrm.pnlDocsResize(Sender: TObject);
begin
  strgrdDocs.ColWidths[1] := strgrdDocs.Width - 130;
end;

function TPBMaintPOrdFrm.IsCustInvUpFrnt(TempCust: integer): boolean;
begin
 with PBPODM.GetCustSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    Result := (FieldByName('Invoice_Upfront').AsString = 'Y');
    Close;
  end;
end;

procedure TPBMaintPOrdFrm.NewOfficeDoc(Sender: TObject);
var
  document: TDocument;
  docExt: String;
  okToSave, userCancelled, docsaved: boolean;
  inx: integer;
begin
  okToSave := false;
  userCancelled := false;
  docsaved := false;

  if (Sender as TBitBtn) = btbtnWordDoc then
  begin
    docExt := '.doc';
    svDlgOfficeDoc.Filter := 'Word Document(*.doc)|*.doc';
  end
  else if (Sender as TBitBtn) = btbtnExcelSheet then
  begin
    docExt := '.xls';
    svDlgOfficeDoc.Filter := 'Excel Worksheet(*.xls)|*.xls';
  end
  else
  begin
    exit; //go no further
  end;

  document := TDocument.create;
  try
    document.New(docDir, docExt);
    svDlgOfficeDoc.InitialDir := docDir;
    svDlgOfficeDoc.FileName := document.Path;
    svDlgOfficeDoc.DefaultExt := copy(docExt, 2, 3);

    while (okToSave = false) and (userCancelled = false) do
    begin
      //prompt user for file name
      if svDlgOfficeDoc.execute then
      begin
        //is file in default directory
        if (copy(svDlgOfficeDoc.FileName, 1, length(docDir)) = docDir) then
        begin
          //does file exists
          if fileExists(svDlgOfficeDoc.FileName) then
          begin
            MessageDlg('This file name already exists and may be linked to a Purchase Order. Please choose another file name.', mtWarning, [mbOK], 0);
            okToSave := false;
          end
          else
          begin
            okToSave := true;
          end;
        end
        else
        begin
          MessageDlg('You can''t save a document outside the Company Document Directory',
                                                mtError,[mbOK],0) ;
          svDlgOfficeDoc.FileName := document.Path;
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
      //ok so the user didn't cancel the save dialogue and has chosen a valid
      //save location
      document.Path := copy(svDlgOfficeDoc.FileName, length(compdir)+1, length(svDlgOfficeDoc.FileName));
      document.Title := document.Path;

      //add the file extention if it is missing or remove it from the title if it is there
      if copy(document.path, length(document.path) - 3, 4) <> docExt then
        document.path := document.path + docExt
      else
        document.Title := copy(document.Title, 1, length(document.Title) - 4);

      inx := pos('\', document.Title);
      while inx <> 0 do
      begin
        document.Title := copy(document.Title, inx+1, length(document.Title));
        inx := pos('\', document.Title);
      end;

      selectedLine.DocumentList.add(document);
      self.DisplayDocumentList;

      if docExt = '.doc' then
      begin
        try
          PBWordOLEFrm := TPBWordOLEFrm.Create(self);
          PBWordOLEFrm.SaveAsDocument(compDir+document.Path);
          docSaved := true;
        finally
          PBWordOLEFrm.Free;
        end;
      end
      else
      begin
        try
          PBExcelOLEFrm := TPBExcelOLEFrm.Create(self);
          PBExcelOLEFrm.SaveAsDocument(compDir+document.Path);
          docSaved := true;
        finally
          PBExcelOLEFrm.Free;
        end;
      end;

      if docSaved then
      begin
        self.strgrdDocs.row := self.strgrdDocs.RowCount - 1; //choose the newest item in the list
        self.btbtnOpenClick(Self);
      end;
    end
    else
    begin
      document.free;
    end;
  except
    if assigned(document) then
      document.free;
  end;
end;

procedure TPBMaintPOrdFrm.AddNotesMemoChange(Sender: TObject);
begin
  SelectedLine.NarrativeText := AddNotesMemo.Text;
end;

procedure TPBMaintPOrdFrm.tbInvoicingResize(Sender: TObject);
begin
  self.pnlSalesInvs.Height := round((tbInvoicing.height/2));
end;

procedure TPBMaintPOrdFrm.DisplayInvoiceLists;
var
  invList: TStringList;
  inx, hashPos: integer;
  tempStr: string;
  unitVal, qty, goodsVal, vatVal, lineVal, qtyTot, goodsTot, vatTot, grandTot, addchgs, addchgsVAT: double;
  invNo, invDate, inv: string;
begin
  ResetInvoiceLists;

  qtyTot := 0.00;
  goodsTot := 0.00;
  vatTot := 0.00;
  grandTot := 0.00;

  invList := TStringList.Create;
  try
    PBPODM.GetPOSInvList(PurchaseOrder.PONumber, selectedLine.Line, invList);

    if invList.Count > 0 then
      self.strgrdSalesInvs.RowCount := invList.Count + 1
    else
      self.strgrdSalesInvs.RowCount := 2;

    for inx := 0 to (invList.Count - 1) do
    begin
      tempStr := invList[inx];

      hashPos := pos('#', tempStr);
      invNo := copy(tempStr, 1, hashPos-1);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));

      hashPos := pos('#', tempStr);
      invDate := copy(tempStr, 1, hashPos-1);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));

      hashPos := pos('#', tempStr);
      qty := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      qtyTot := qtyTot + qty;

      hashPos := pos('#', tempStr);
      goodsVal := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      goodsTot := goodsTot + goodsVal;

      hashPos := pos('#', tempStr);
      vatVal := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));

      hashPos := pos('#', tempStr);
      addchgs := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      goodsTot := goodsTot + addchgs;

      hashPos := pos('#', tempStr);
      addchgsVAT := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      vatVal := vatVal + addchgsVAT;

      inv := tempStr;

      vatTot := vatTot + vatVal;

      if qty <> 0.00 then
        unitVal := goodsVal / qty
      else
        unitVal := 0.00;

      lineVal := goodsVal + vatVal + addChgs;
      grandTot := grandTot + lineVal;

      self.strgrdSalesInvs.Cells[1, inx+1] := invNo;
      self.strgrdSalesInvs.Cells[2, inx+1] := invDate;
      self.strgrdSalesInvs.Cells[3, inx+1] := FloatToStrF(qty, ffFixed, 15, 0);
      self.strgrdSalesInvs.Cells[4, inx+1] := FloatToStrF(unitVal, ffFixed, 15, 3);
      self.strgrdSalesInvs.Cells[5, inx+1] := FloatToStrF(goodsVal, ffFixed, 15, 2);
      self.strgrdSalesInvs.Cells[6, inx+1] := FloatToStrF(addchgs, ffFixed, 15, 2);
      self.strgrdSalesInvs.Cells[7, inx+1] := FloatToStrF(vatVal, ffFixed, 15, 2);
      self.strgrdSalesInvs.Cells[8, inx+1] := FloatToStrF(lineVal, ffFixed, 15, 2);
      self.strgrdSalesInvs.Cells[9, inx+1] := inv;
    end;
    mmSInvQtyTot.Text := FloatToStrF(qtyTot, ffFixed, 15, 0);
    mmSInvGoodsTot.Text := FloatToStrF(goodsTot, ffFixed, 15, 2);
    mmSInvVatTot.Text := FloatToStrF(vatTot, ffFixed, 15, 2);
    mmSInvGrandTot.Text := FloatToStrF(grandTot, ffFixed, 15, 2);

    invList.Clear;

    qtyTot := 0.00;
    goodsTot := 0.00;
    vatTot := 0.00;
    grandTot := 0.00;
    PBPODM.GetPOPInvList(PurchaseOrder.PONumber, selectedLine.Line, invList);

    if invList.Count > 0 then
      self.strgrdPurchInvs.RowCount := invList.Count + 1
    else
      self.strgrdPurchInvs.RowCount := 2;

    for inx := 0 to (invList.Count - 1) do
    begin
      tempStr := invList[inx];

      hashPos := pos('#', tempStr);
      invNo := copy(tempStr, 1, hashPos-1);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));

      hashPos := pos('#', tempStr);
      invDate := copy(tempStr, 1, hashPos-1);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));

      hashPos := pos('#', tempStr);
      qty := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      qtyTot := qtyTot + qty;

      hashPos := pos('#', tempStr);
      goodsVal := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      goodsTot := goodsTot + goodsVal;

      hashPos := pos('#', tempStr);
      vatVal := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));

      hashPos := pos('#', tempStr);
      addchgs := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      goodsTot := goodsTot + addchgs;

      hashPos := pos('#', tempStr);
      addchgsVAT := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      vatVal := vatVal + addchgsVAT;

      inv := tempStr;

      vatTot := vatTot + vatVal;

      if qty <> 0.00 then
        unitVal := goodsVal / qty
      else
        unitVal := 0.00;

      lineVal := goodsVal + vatVal + addChgs;
      grandTot := grandTot + lineVal;

      self.strgrdPurchInvs.Cells[1, inx+1] := invNo;
      self.strgrdPurchInvs.Cells[2, inx+1] := invDate;
      self.strgrdPurchInvs.Cells[3, inx+1] := FloatToStrF(qty, ffFixed, 15, 0);
      self.strgrdPurchInvs.Cells[4, inx+1] := FloatToStrF(unitVal, ffFixed, 15, 3);
      self.strgrdPurchInvs.Cells[5, inx+1] := FloatToStrF(goodsVal, ffFixed, 15, 2);
      self.strgrdPurchInvs.Cells[6, inx+1] := FloatToStrF(addChgs, ffFixed, 15, 2);
      self.strgrdPurchInvs.Cells[7, inx+1] := FloatToStrF(vatVal, ffFixed, 15, 2);
      self.strgrdPurchInvs.Cells[8, inx+1] := FloatToStrF(lineVal, ffFixed, 15, 2);
      self.strgrdPurchInvs.Cells[9, inx+1] := inv;
     end;

    mmPInvQtyTot.Text := FloatToStrF(qtyTot, ffFixed, 15, 0);
    mmPInvGoodsTot.Text := FloatToStrF(goodsTot, ffFixed, 15, 2);
    mmPInvVatTot.Text := FloatToStrF(vatTot, ffFixed, 15, 2);
    mmPInvGrandTot.Text := FloatToStrF(grandTot, ffFixed, 15, 2);

  finally
    invList.Free;
  end;

  OrdPriceMemo.enabled := (not CharInSet(FuncMode, [poRestrict])) and
                          ((PurchaseOrder.AuthorisedBy = 0) or (PurchaseOrder.AuthorisedBy = frmPBMainMenu.iOperator)) and
                          (not selectedLine.Matched);
  OrderUnitDBLCB.enabled := (not CharInSet(FuncMode, [poRestrict])) and
                          ((PurchaseOrder.AuthorisedBy = 0) or (PurchaseOrder.AuthorisedBy = frmPBMainMenu.iOperator)) and
                          (not selectedLine.Matched);

  if dmBroker.UseSAPIntegration then
    begin
      OrdPriceMemo.Enabled := SellPriceMemo.enabled;
      OrderUnitDBLCB.enabled := SellPriceMemo.enabled
    end;

//  OnHoldChkBox.Enabled := (SelectedLine.POLineStatus <> 30) or (strgrdPurchInvs.cells[1,1] = '');
end;

procedure TPBMaintPOrdFrm.InvsGridsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  strGrid: TStringGrid;
  lrow, lcol: Longint;
begin
  lRow := ARow;
  lCol := ACol;
  strGrid := Sender as TStringGrid;

  with strGrid, Canvas do
  //set the background colour of the box and the text style depending
  //on which cell is begin drawn
  begin
    if (lRow < FixedRows) or (lCol < FixedCols) then
    begin
      //if its the left and top fixed column/row headers
      Brush.Color := clbtnFace;
      font.Color := clBtnText;
      font.name := strGrid.Font.name;
      font.size := strGrid.Font.size;
      font.style := [];
    end
    else
    if (strGrid.Cells[8, lRow]) <> '' then
    begin
      if  StrToFloatDef(strGrid.Cells[8, lRow], 0, FormatSettings) < 0.00 then
      begin
        //Show in red and white if the goods value is negative (ie its a credit note)
        brush.color := clred;
        font.Color := clWhite;
      end
      else
      begin
        //otherwise....
        Brush.Color := clWhite;
        Font.Color := clBlack;
      end;
    end
    else
    begin
      Brush.Color := clWhite;
      Font.Color := clBlack;
    end;

    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if (lCol = 3) or (lCol = 4) or (lCol = 5) or (lCol = 6) or (lCol = 7)  or (lCol = 8) then
    begin
      //right align
      if gdFixed in State then
        Canvas.Brush.Color := strgrdSalesInvs.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end
    else
    begin
      //left align
      if gdFixed in State then
        Canvas.Brush.Color := strgrdSalesInvs.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end;

    if (lCol = 0) or (lRow = 0) then
    begin
      //default drawing has been switched off in the grid so we have
      //to draw the highlight and shadow on 3d boxes
      pen.color := clBtnHighlight;
      polyline([point(rect.left,rect.bottom-1),
                point(rect.left,rect.top),
                point(rect.right,rect.top)]);
      pen.color := clBtnShadow;
      polyline([point(rect.right-1,rect.top+1),
                point(rect.right-1,rect.bottom-1),
                point(rect.left,rect.bottom-1)]);
    end;
  end;
end;

procedure TPBMaintPOrdFrm.ResetInvoiceLists;
begin
  self.strgrdSalesInvs.Cells[1, 0] := 'Invoice No';
  self.strgrdSalesInvs.Cells[2, 0] := 'Invoice Date';
  self.strgrdSalesInvs.Cells[3, 0] := 'Quantity';
  self.strgrdSalesInvs.Cells[4, 0] := 'Unit Value';
  self.strgrdSalesInvs.Cells[5, 0] := 'Goods Value';
  self.strgrdSalesInvs.Cells[6, 0] := 'Add Charges';
  self.strgrdSalesInvs.Cells[7, 0] := 'Vat Value';
  self.strgrdSalesInvs.Cells[8, 0] := 'Total Value';
  self.strgrdSalesInvs.ColWidths[0] := 20;
  self.strgrdSalesInvs.ColWidths[1] := 85;
  self.strgrdSalesInvs.ColWidths[2] := 85;
  self.strgrdSalesInvs.ColWidths[3] := 64;
  self.strgrdSalesInvs.ColWidths[4] := 90;
  self.strgrdSalesInvs.ColWidths[5] := 90;
  self.strgrdSalesInvs.ColWidths[6] := 90;
  self.strgrdSalesInvs.ColWidths[7] := 90;
  self.strgrdSalesInvs.ColWidths[8] := 90;
  self.strgrdSalesInvs.ColWidths[9] := -1;

  self.strgrdPurchInvs.Cells[1, 0] := 'Invoice No';
  self.strgrdPurchInvs.Cells[2, 0] := 'Invoice Date';
  self.strgrdPurchInvs.Cells[3, 0] := 'Quantity';
  self.strgrdPurchInvs.Cells[4, 0] := 'Unit Value';
  self.strgrdPurchInvs.Cells[5, 0] := 'Goods Value';
  self.strgrdPurchInvs.Cells[6, 0] := 'Add Charges';
  self.strgrdPurchInvs.Cells[7, 0] := 'Vat Value';
  self.strgrdPurchInvs.Cells[8, 0] := 'Total Value';
  self.strgrdPurchInvs.ColWidths[0] := 20;
  self.strgrdPurchInvs.ColWidths[1] := 85;
  self.strgrdPurchInvs.ColWidths[2] := 85;
  self.strgrdPurchInvs.ColWidths[3] := 64;
  self.strgrdPurchInvs.ColWidths[4] := 90;
  self.strgrdPurchInvs.ColWidths[5] := 90;
  self.strgrdPurchInvs.ColWidths[6] := 90;
  self.strgrdPurchInvs.ColWidths[7] := 90;
  self.strgrdPurchInvs.ColWidths[8] := 90;
  self.strgrdPurchInvs.ColWidths[9] := -1;
end;

procedure TPBMaintPOrdFrm.strgrdSalesInvsDblClick(Sender: TObject);
var
  Frm: TPBMaintSalesInvoicefrm;
  aInvoice: TSalesInvoice;
  dmSalesInvoice: TdmSalesInvoice;
  invNo: integer;
  strGrid: TStringGrid;
begin
  strGrid := sender as TStringGrid;
  if strGrid.cells[9, strGrid.row] = '' then
    exit;

  dmSalesInvoice := TdmSalesInvoice.Create(self);
  aInvoice := TSalesInvoice.Create(dmSalesInvoice);
  try
    invNo := StrToInt(strGrid.cells[9, strGrid.row]);
    aInvoice.DbKey := invNo;
    aInvoice.LoadFromDB;
    Frm := TPBMaintSalesInvoicefrm.Create(Self);
    try
      Frm.Mode := siView;
      Frm.SalesInvoice := aInvoice;
      Frm.ShowModal;
    finally
      Frm.Free;
    end;
  finally
    aInvoice.Free;
    dmSalesInvoice.free;
  end;
end;

procedure TPBMaintPOrdFrm.strgrdPurchInvsDblClick(Sender: TObject);
var
  Frm: TPBMaintSuppInvoicefrm;
  aInvoice: TSuppInvoice;
  dmSupplierInvoice: TdmSupplierInvoice;
  invNo: integer;
  strGrid: TStringGrid;
begin
  strGrid := sender as TStringGrid;
  if strGrid.cells[9, strGrid.row] = '' then
    exit;

  dmSupplierInvoice := TdmSupplierInvoice.Create(self);
  aInvoice := TSuppInvoice.Create(dmSupplierInvoice);
  try
    invNo := StrToInt(strGrid.cells[9, strGrid.row]);
    aInvoice.DbKey := invNo;
    aInvoice.LoadFromDB;
    Frm := TPBMaintSuppInvoicefrm.Create(Self);
    try
      Frm.Mode := piView;
      Frm.SupplierInvoice := aInvoice;
      Frm.ShowModal;
    finally
      Frm.Free;
    end;
  finally
    aInvoice.Free;
    dmSupplierInvoice.free;
  end;
end;

procedure TPBMaintPOrdFrm.OrderLinePageChange(Sender: TObject);
begin
  if OrderLinePage.ActivePage.Caption = 'Notes / Documents' then
  begin
    compDir := dmBroker.qryCompany.FieldByName('Document_Directory').AsString;
    docDir := dmBroker.qryCompany.FieldByName('Document_Directory').AsString;
    opDir := dmBroker.GetOperatorDocDirectory(frmPBMainMenu.iOperator);
    if opDir <> '' then
      docDir := docDir + '\' + opDir + '\';
  end;
end;

procedure TPBMaintPOrdFrm.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  PBMaintPOEmailfrm := TPBMaintPOEmailfrm.create(self);
  try
    PBMaintPOEmailfrm.Supplier := PurchaseOrder.Supplier;
    PBMaintPOEmailfrm.SupplierBranch := PurchaseOrder.BranchNo;
    PBMaintPOEmailfrm.SupplierContact := PurchaseOrder.SupplierContactNo;
    PBMaintPOEmailfrm.Customer := SelectedLine.Customer;
    PBMaintPOEmailfrm.CustomerBranch := SelectedLine.BranchNo;
    PBMaintPOEmailfrm.CustomerContact := SelectedLine.CustomerContact;
    PBMaintPOEmailfrm.showmodal;
    if PBMaintPOEmailfrm.modalresult = idOK then
      begin
        sTo := PBMaintPOEmailfrm.edtEmail.text;
        sSubject := PBMaintPOEmailfrm.edtSubject.text;
        SendAndSaveEmail(sTo, sSubject);
      end;
  finally
    PBMaintPOEmailfrm.free;
  end;

end;

procedure TPBMaintPOrdFrm.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docExt: string;
  document: TDocument;
  inx: integer;
begin
  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    FEmailApplication := IniFile.ReadString('Email', 'Application', 'None');
  finally
    IniFile.Free;
  end;

  sBody := '';
  sfilePath := docdir;
  okToSave := false;

  EmailAndSaveViaOutlook(sTo,sSubject,sBody,sFilePath,okToSave, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

  if okToSave then
    begin
      document := TDocument.create;
      try
        document.New(sFilePath, docExt);

        document.Path := trim(copy(sFilePath, length(compDir)+1, length(sFilePath)));
        document.Title := document.Path;

        //add the file extention if it is missing or remove it from the title if it is there
        if copy(document.path, length(document.path) - 3, 4) <> docExt then
          document.path := document.path + docExt
        else
          document.Title := copy(document.Title, 1, length(document.Title) - 4);

        inx := pos('\', document.Title);
        while inx <> 0 do
        begin
          document.Title := copy(document.Title, inx+1, length(document.Title));
          inx := pos('\', document.Title);
        end;

        selectedLine.DocumentList.add(document);
        self.DisplayDocumentList;

        self.strgrdDocs.row := self.strgrdDocs.RowCount - 1; //choose the newest item in the list
      except
        if assigned(document) then
          document.free;
      end;
    end;
end;

procedure TPBMaintPOrdFrm.dblkpJobTypeClick(Sender: TObject);
begin
  UpdateOrderLine;
  SetJobTypeAbilities;
end;

procedure TPBMaintPOrdFrm.SetJobTypeAbilities;
begin
  with PBPODM.qryGetJobType do
    begin
      close;
      parambyname('Job_Type').asinteger := selectedline.jobtype;
      open;
      OneDeliveryOnly := (fieldbyname('One_delivery_only').asstring = 'Y');
      CanDeliverToStock := (fieldbyname('Can_Deliver_to_Stock').asstring = 'Y') or
                          (fieldbyname('Can_Deliver_to_Stock').asstring = '');
      RepCanConvert := (fieldbyname('Rep_Can_Convert_Enquiry').asstring = 'Y');
    end;
end;

procedure TPBMaintPOrdFrm.btnClearJobTypeClick(Sender: TObject);
begin
  dblkpJobType.keyvalue := 0;
  UpdateOrderLine;
  SetJobTypeAbilities;
end;

procedure TPBMaintPOrdFrm.SetPurchaseOrderNo(const Value: real);
begin
  FPurchaseOrderNo := Value;
end;

procedure TPBMaintPOrdFrm.edtDescReferenceExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.OfficeComboBoxClick(Sender: TObject);
begin
(*  edtTeam.Text := PBPODM.GetOpsAccountTeamName(OfficeComboBox.keyvalue);
  checkOK(self);
*)end;

procedure TPBMaintPOrdFrm.btnAccountManagerClick(Sender: TObject);
begin
  if dmBroker.UseAccountManagers then
    begin
      PBLUAccountManagerFrm := TPBLUAccountManagerFrm.Create(Owner);
      try
        PBLUAccountManagerFrm.bIs_Lookup := True;
        PBLUAccountManagerFrm.bAllow_Upd := True;

        PBLUAccountManagerFrm.SelCode := PurchaseOrder.OfficeContact;
        PBLUAccountManagerFrm.ShowModal;
        if PBLUAccountManagerFrm.selected then
        begin
          PurchaseOrder.OfficeContact := PBLUAccountManagerFrm.SelCode;
          edtAccountManager.Text := PBLUAccountManagerFrm.SelName;
          PurchaseOrder.AccountTeam := PBLUAccountManagerFrm.SelTeam;
          edtAccountTeam.Text := PBLUAccountManagerFrm.SelTeamName;
        end;
      finally
        PBLUAccountManagerFrm.Free;
      end;
    end
  else
    begin
      PBLUOpsFrm := TPBLUOpsFrm.Create(Owner);
      try
        PBLUOpsFrm.bIs_Lookup := True;
        PBLUOpsFrm.bAllow_Upd := True;

        PBLUOpsFrm.SelCode := PurchaseOrder.OfficeContact;
        PBLUOpsFrm.ShowModal;
        if PBLUOpsFrm.selected then
        begin
          PurchaseOrder.OfficeContact := PBLUOpsFrm.SelCode;
          edtAccountManager.Text := PBLUOpsFrm.SelName;
        end;
      finally
        PBLUOpsFrm.Free;
      end;
    end;

  CheckOK(self);

end;

procedure TPBMaintPOrdFrm.CallMaintJobBagScreen(aMode: TjbMode);
var
  Key : integer;
//  frm : TPBMaintJobBagDetsFrm;
  frm : TPBMaintJobBagFrm;
  aBag : TJobBag;
  OrigAccCtrlMenu: integer;
begin
  OrigAccCtrlMenu := dmBroker.iAccCtrlMenu;
  dmPOJobBag := TdmJobBag.Create(Self);

  Key := SelectedLine.JobBagNumber;

  try
    aBag := TJobBag.Create(dmPOJobBag);
    try
      aBag.DbKey := key;
      aBag.LoadFromDB;
//      Frm := TPBMaintJobBagDetsFrm.Create(Self);
      Frm := TPBMaintJobBagFrm.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.JobBag := aBag;
        Frm.bComefromOrder := true;

        // if not in View mode, check is this record is locked, if not then lock it
        // 0  not locked
        // 1  locked but want to view
        // 2  locked and don't want to view
        case dmBroker.LockRecord(inttostr(aBag.DbKey),'','','','','Job Bag',Frm.caption,frmPBMainMenu.Workstation,true) of
          0:;
          1: dmBroker.iAccCtrlMenu := 3;
          2: exit
        end;

        Frm.ShowModal;
      finally
        Frm.Free;
      end;
    finally
      dmBroker.UnlockRecord(inttostr(aBag.DbKey),'','','','','Job Bag',frmPBMainMenu.Workstation);
      aBag.Free;
    end;
  finally
    dmPOJobBag.Free;
    dmBroker.iAccCtrlMenu := OrigAccCtrlMenu;
  end;
end;

procedure TPBMaintPOrdFrm.btnJobBagClick(Sender: TObject);
begin
  if (self.bComeFromJobBag) then
    exit
  else
    CallMaintJobBagScreen(jbChange);
end;

procedure TPBMaintPOrdFrm.chkbxAuthorisedClick(Sender: TObject);
begin
  if chkbxAuthorised.checked then
    begin
      if PurchaseOrder.AuthorisedBy = 0 then
        PurchaseOrder.AuthorisedBy := frmpbMainMenu.iOperator;
      if FActiveDone then
        btnAuthNotesClick(self);
    end
  else
    PurchaseOrder.AuthorisedBy := 0;
end;

procedure TPBMaintPOrdFrm.chkbxInvoiceBeforeDeliveryClick(Sender: TObject);
begin
  SelectedLine.InvoiceBeforeDelivery := (Sender as TCheckBox).Checked;
  if (selectedLine.DeliveryLines.TotalStock > 0) and (SelectedLine.InvoiceBeforeDelivery) then
    begin
      self.chkInvoiceUpfront.checked := SelectedLine.InvoiceBeforeDelivery;
    end;
end;

procedure TPBMaintPOrdFrm.btnAuthNotesClick(Sender: TObject);
var
  PBDBMemoFrm: TPBDBMemoFrm;
begin
  PBDBMemofrm := TPBDBMemoFrm.create(self);
  try
    if (FFuncMode = poView) or (PurchaseOrder.AuthorisedBy <> frmPBMainMenu.iOperator) then
      PBDBMemoFrm.bAllow_Upd := false
    else
      PBDBMemoFrm.bAllow_Upd := true;

    PBDBMemoFrm.Datamemo.text := PurchaseOrder.NarrativeText;
    PBDBMemoFrm.ShowModal;
    PurchaseOrder.Narrativetext := PBDBMemofrm.Datamemo.text;
  finally
    PBDBMemofrm.free;
  end;
  checknotes(Self);
end;

procedure TPBMaintPOrdFrm.CheckNotes(Sender: TObject);
begin
  if trim(PurchaseOrder.NarrativeText) <> '' then
  begin
    FlashTimer.Enabled := True;
    btnAuthNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    btnAuthNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintPOrdFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    btnAuthNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnAuthNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintPOrdFrm.DisplayStockUsage;
begin
  dbgStockUsage.DataSource := PBPODm.dtsrcPartMvmnts;
  with PBPODM.qryPartMvmnts do
    begin
      close;
      parambyname('Purchase_Order').asfloat := PurchaseOrder.PONumber;
      open;
    end;
  lblTotalUsage.caption := formatfloat('#,###,##0',PBPODM.GetTotalStockUsage(PurchaseOrder.PONumber));
end;

procedure TPBMaintPOrdFrm.DisplayStock;
begin
  dbgStock.DataSource := PBPODm.dtsrcPartStoreBins;
  with PBPODM.qryPartStoreBins do
    begin
      close;
      parambyname('Purchase_Order').asfloat := PurchaseOrder.PONumber;
      open;
    end;
  lblTotalStock.caption := formatfloat('#,###,##0',PBPODM.GetTotalStock(PurchaseOrder.PONumber));
end;

procedure TPBMaintPOrdFrm.tsStockUsageResize(Sender: TObject);
begin
  self.pnlStockUsage.Height := round((tsStockUsage.height/2));
end;

procedure TPBMaintPOrdFrm.btnPriceChangesClick(Sender: TObject);
begin
  with PBPODM.qryGetPOPriceHist do
    begin
      close;
      parambyname('purchase_order').asfloat := PurchaseOrder.PONumber;
      parambyname('line').asinteger := selectedLine.Line;
      open;
      if recordcount = 0 then
        begin
          messagedlg('There is no price change history information for this purchase order', mtInformation, [mbOk], 0);
          exit;
        end;
    end;

  PBMaintPOrdHistoryFrm  := TPBMaintPOrdHistoryFrm.create(self);
  try
    PBMaintPOrdHistoryFrm.PONumber := PurchaseOrder.PONumber;
    PBMaintPOrdHistoryFrm.OrderLine := selectedLine;
    PBMaintPOrdHistoryFrm.showmodal;
  finally
    PBMaintPOrdHistoryFrm.free
  end;
end;

procedure TPBMaintPOrdFrm.btnCostCentreClick(Sender: TObject);
begin
  if CostCentreLevel = 'C' then
    begin
      PBLUCustCstCntrFrm := TPBLUCustCstCntrFrm.Create(Self);
      try
        PBLUCustCstCntrFrm.bIs_Lookup := True;
        PBLUCustCstCntrFrm.bAllow_Upd := True;
        PBLUCustCstCntrFrm.sSelCode := SelectedLine.CostCentre;
        PBLUCustCstCntrFrm.iCust := SelectedLine.Customer;
        PBLUCustCstCntrFrm.sCustName := CustNameEdit.Text;
        PBLUCustCstCntrFrm.ShowModal;
        if PBLUCustCstCntrFrm.Selected then
          begin
          SelectedLine.CostCentre := PBLUCustCstCntrFrm.sSelCode;
          edtCostCentre.Text := PBLUCustCstCntrFrm.sSelCode;
          end;
      finally
        PBLUCustCstCntrFrm.Free;
      end;
    end
  else
    begin
      PBLUBranchCstCntrFrm := TPBLUBranchCstCntrFrm.Create(Self);
      try
        PBLUBranchCstCntrFrm.bIs_Lookup := True;
        PBLUBranchCstCntrFrm.bAllow_Upd := True;
        PBLUBranchCstCntrFrm.sSelCode := SelectedLine.CostCentre;
        PBLUBranchCstCntrFrm.iCust := SelectedLine.Customer;
        PBLUBranchCstCntrFrm.iBranch := SelectedLine.BranchNo;
        PBLUBranchCstCntrFrm.sCustName := CustNameEdit.Text;
        PBLUBranchCstCntrFrm.ShowModal;
        if PBLUBranchCstCntrFrm.Selected then
          begin
          SelectedLine.CostCentre := PBLUBranchCstCntrFrm.sSelCode;
          edtCostCentre.Text := PBLUBranchCstCntrFrm.sSelName;
          end;
      finally
        PBLUBranchCstCntrFrm.Free;
      end;
    end
end;

procedure TPBMaintPOrdFrm.SetFSCClaimAbilities;
begin
  with PBPODM.qryGetFSCClaim do
    begin
      close;
      parambyname('FSC_Material_Claim').asinteger := selectedline.FSCClaim;
      open;
      MixedClaim := (fieldbyname('Mixed_Claim').asstring = 'Y');
    end;
end;

procedure TPBMaintPOrdFrm.dblkpFSCClaimClick(Sender: TObject);
begin
  UpdateOrderLine;
  SetFSCClaimAbilities
end;

procedure TPBMaintPOrdFrm.btnClearClaimClick(Sender: TObject);
begin
  SelectedLine.FSCClaim := 0;
  dblkpFSCClaim.KeyValue := 0;
end;

procedure TPBMaintPOrdFrm.spnFSCMixExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

procedure TPBMaintPOrdFrm.SetJobBagLine(const Value: integer);
begin
  FJobBagLine := Value;
end;

procedure TPBMaintPOrdFrm.ProofStatDBLUCBClick(Sender: TObject);
begin
  edtProofStatusDate.Text := pbdatestr(date);
end;

procedure TPBMaintPOrdFrm.ContactComboClick(Sender: TObject);
begin
  with PBPODM do
  begin
    qrySelActiveCCont.first;
    qrySelActiveCCont.moveby(ContactCombo.itemindex);

    if SelectedLine.CustomerContact <> qrySelActiveCCont.FieldByName('Contact_No').AsInteger then
    begin
      if PBPODm.GetContactAccountNo(SelectedLine.Customer, SelectedLine.BranchNo, qrySelActiveCCont.FieldByName('Contact_No').AsInteger) <> '' then
        begin
          if MessageDlg('This Contact has payment details on file. Is this a Cash Sale?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            chkbxClearedFunds.checked := true;
          end;
        end;
    end;
  end;
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.sgNCADetailsClick(Sender: TObject);
var
  inx: integer;
  NonConform: TNonConform;
begin
  if sgNCADetails.Cells[0,1] = '' then
    begin
      memNCADetails.clear;
    end
  else
    begin
      inx := sgNCADetails.row;

      inx := SelectedLine.nonConformDocs.IndexOf(inx);
      NonConform := SelectedLine.nonConformDocs[inx];
      memNCADetails.text := NonConform.NarrativeText;
    end;
end;

procedure TPBMaintPOrdFrm.btnAddNCAClick(Sender: TObject);
begin
  CallMaintNCA(poncAdd);
end;

procedure TPBMaintPOrdFrm.CallMaintNCA(aMode: TponcMode);
var
  inx, iRow, LineNo : integer;
  NonConform : TNonConform;
  frm: TPBMaintPOrdNonConfDocFrm;
begin
  inx := sgNCADetails.row;

  irow := inx;

  frm := TPBMaintPOrdNonConfDocFrm.Create(Self);
  try
    if aMode = poncAdd then
      NonConform := TNonConform.Create
    else
    begin
      inx := SelectedLine.nonConformDocs.IndexOf(inx);
      NonConform := selectedline.nonConformDocs[inx];
    end;

    if (FFuncMode = poView) then
      aMode := poncView;

    Frm.NonConform := NonConform;
    Frm.SelectedLine := SelectedLine;
    Frm.Mode := aMode;
    Frm.ShowModal;
    if (aMode = poncAdd) and (Frm.ModalResult <> mrOK) then
      NonConform.Free;

    if (Frm.ModalResult = mrOK) then
      begin
        if FFuncMode <> poView then
          begin
            DisplayNonConformDetails;
          end;

        if aMode = poncAdd then
          begin
            irow := SelectedLine.NonConformDocs.count;
            if irow <= 0 then irow := 1;
          end
        else
        if aMode = poncDelete then
          begin
            irow := irow-1;
            if irow <= 0 then irow := 1;
          end;
        sgNCADetails.row := irow;
      end;
  finally
    Frm.Free;
  end;
end;


procedure TPBMaintPOrdFrm.btnChangeNCAClick(Sender: TObject);
begin
  CallMaintNCA(poncChange);
end;

procedure TPBMaintPOrdFrm.btnDeleteNCAClick(Sender: TObject);
begin
  CallMaintNCA(poncDelete);
end;

procedure TPBMaintPOrdFrm.btnPrintNCAClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: real;
  inx: integer;
  NonConform: TNonConform;
begin
  inx := sgNCADetails.row;

  inx := selectedline.nonConformDocs.IndexOf(inx);
  NonConform := selectedline.nonConformDocs[inx];


  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
//  JobBag.SaveNonConformDocs;
  try
    frmPBRSNonConform := TfrmPBRSNonConform.Create( Application );
    Key := NonConform.NCNumber;

    frmPBRSNonConform.memSelection.text := floattostr(Key);
    frmPBRSNonConform.edtCustomer.text := PBPODM.GetCustName(selectedLine.Customer);
    frmPBRSNonConform.memDescription.text := selectedline.CustomersDesc;
    frmPBRSNonConform.memJobBag.text := floattostr(PurchaseOrder.PONumber);
    frmPBRSNonConform.showmodal;
  finally
    frmPBRSNonConform.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TPBMaintPOrdFrm.UpdateNonConformDocs;
var
  icount: Integer;
  iTempNarr: integer;
begin
  {Update the purchase order extra charges}
  PBPODM.DeleteNonConforms(PurchaseOrder.PONumber);
  for icount := 0 to Pred(SelectedLine.NonConformDocs.Count) do
  begin
    with PBPODM.qryAddNonConform, SelectedLine.NonConformDocs[icount] do
      begin
        close;
        ParamByName('Job_Bag_Non_Conform').AsInteger := NCNumber;
        Parambyname('Purchase_Order').asfloat := PurchaseOrder.PONumber;
        Parambyname('Line').asinteger := 1;
        ParamByName('Job_Bag').clear;
        ParamByName('Date_Point').AsDateTime := DatePoint;
        ParamByName('operator').Asinteger := Operator;
        ParamByName('Raised_by_Dept').asinteger := RaisedBy;
        
        if NCCategory = 0 then
          ParamByName('Non_Conform_Category').clear
        else
          ParamByName('Non_Conform_Category').asinteger := NCCategory;

        ParamByName('Non_Conform_Dept').asinteger := NCDepartment;
        ParamByName('Non_Conform_type').asinteger := NCType;
        if QAOperator = 0 then
          ParamByName('QA_Operator').clear
        else
          ParamByName('QA_Operator').asinteger := QAOperator;
        ParamByName('QA_Sign_Off_Date').asdatetime := QASignOffDate;

        iTempNarr := Narrative;
        PBPODM.SaveNarrative(iTempNarr,NarrativeText);
        Narrative := iTempNarr;
        if Narrative = 0 then
          ParamByName('Non_Conform_Notes').clear
        else
          ParamByName('Non_Conform_Notes').Asinteger := Narrative;

        iTempNarr := Response;
        PBPODM.SaveNarrative(iTempNarr,ResponseNotes);
        Response := iTempNarr;
        if Response = 0 then
          ParamByName('Response_Notes_id').clear
        else
          ParamByName('Response_Notes_id').Asinteger := Response;

        iTempNarr := Corrective;
        PBPODM.SaveNarrative(iTempNarr,CorrectiveNotes);
        Corrective := iTempNarr;
        if Corrective = 0 then
          ParamByName('Corrective_Notes_id').clear
        else
          ParamByName('Corrective_Notes_id').Asinteger := Corrective;

        iTempNarr := Preventative;
        PBPODM.SaveNarrative(iTempNarr,PreventativeNotes);
        Preventative := iTempNarr;
        if Preventative = 0 then
          ParamByName('Preventative_Notes_id').clear
        else
          ParamByName('Preventative_Notes_id').Asinteger := Preventative;

        {Set the response date}
        if (ResponseDate = 0) and (Response <> 0) then
          Parambyname('Response_Date').asdatetime := now
        else
          begin
            if ResponseDate = 0 then
              Parambyname('Response_Date').clear
            else
              Parambyname('Response_Date').asdatetime := ResponseDate;
          end;

        {Set the corrective date}
        if (CorrectiveDate = 0) and (Corrective <> 0) then
          Parambyname('Corrective_Date').asdatetime := now
        else
          begin
            if CorrectiveDate = 0 then
              Parambyname('Corrective_Date').clear
            else
              Parambyname('Corrective_Date').asdatetime := CorrectiveDate;
          end;

        {Set the preventative date}
        if (PreventativeDate = 0) and (Preventative <> 0) then
          Parambyname('Preventative_Date').asdatetime := now
        else
          begin
            if PreventativeDate = 0 then
              Parambyname('Preventative_Date').clear
            else
              Parambyname('Preventative_Date').asdatetime := PreventativeDate;
          end;

        Parambyname('Non_Conform_Status').asinteger := status;
        ParamByName('Total_Cost').asfloat := TotalCost;
        ParamByName('Total_Cost_to_Client').asfloat := CosttoClient;

        parambyname('Job_Reprinted').asstring := JobRePrinted;
        parambyname('Samples_Available').AsString := SamplesAvailable;
        ExecSQL;
      end;
  end;
end;

procedure TPBMaintPOrdFrm.sgNCADetailsDblClick(Sender: TObject);
begin
  if (SelectedLine.NonConformDocs.count = 0) then
    exit;
  btnChangeNCAClick(self);
end;

procedure TPBMaintPOrdFrm.sgNCADetailsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  inx: integer;
  NCL: TNonConform;
  iSelected, icol: integer;
begin
  iSelected := sgNCADetails.row;
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ARow <> 0) and (ACol <> 0) then
      begin
        try
          inx := StrToIntDef(sgNCADetails.cells[0, ARow], 0);
          inx := SelectedLine.NonConformDocs.IndexOf(inx);
          NCL := SelectedLine.NonConformDocs[inx];

          if NCL.Inactive = 'Y' then
            begin
              Canvas.Font.Color := clSilver;
              Canvas.Font.Style := Font.Style + [fsStrikeOut]
            end
          else
          if Arow = iSelected then
            Canvas.Font.Color := color
          else
            Canvas.Font.Color := Font.Color;
        except
          Canvas.Font.Color := Font.Color;
        end;
        Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, Cells[ACol, ARow]);
      end;

    if selectedLine.NonConformDocs.Count > 0 then
    begin
      const Gap = 4;
      var Text := Cells[ACol, ARow];
      var WidthOfText := Canvas.TextWidth(Text);
      var WidthOfCell := ColWidths[ACol];
      var LeftOffset := WidthOfCell - WidthOfText - Gap;

      if (ACol < 9) then
      begin
        if gdFixed in State then
          Canvas.Brush.Color := sgNCADetails.FixedColor else
          if gdSelected in State then
            Canvas.Brush.Color := $00FFF0E1 else
            Canvas.Brush.Color := clWindow;
        Canvas.FillRect(Rect);
        Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
      end
      else
      begin
        {Display the Columns Right justified in the cells}
        if gdFixed in State then
          Canvas.Brush.Color := sgNCADetails.FixedColor else
          if gdSelected in State then
            Canvas.Brush.Color := $00FFF0E1 else
            Canvas.Brush.Color := clWindow;
        Canvas.FillRect(Rect);
        Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
      end;
    end;
  end;
end;

procedure TPBMaintPOrdFrm.sgVersionsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
(*  {Code extracted from the Delphi Info base No 609}
  if Sender = ActiveControl then Exit;
  if not (gdSelected in State) then Exit;
  with Sender as TStringGrid do
  begin
    Canvas.Brush.Color := Color;
    Canvas.Font.Color := Font.Color;
    Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
      Cells[Col, Row]);
  end;
*)end;

procedure TPBMaintPOrdFrm.btnAddStockCodeClick(Sender: TObject);
begin
  CallMaintStockCodes(poscAdd);
end;

procedure TPBMaintPOrdFrm.CallMaintStockCodes(aMode: TposcMode);
var
  inx, iRow, LineNo : integer;
  StockCode : TStockCode;
  frm: TPBMaintPOrdLineStockCodeFrm;
begin
  inx := sgVersions.row;

  irow := inx;

  frm := TPBMaintPOrdLineStockCodeFrm.Create(Self);
  try
    if aMode = poscAdd then
      StockCode := TStockCode.Create
    else
    begin
      inx := SelectedLine.StockCodes.Indexof(inx);
      StockCode := selectedline.StockCodes[inx];
    end;

    if (FFuncMode = poView) then
      aMode := poscView;

    Frm.StockCode := StockCode;
    Frm.SelectedLine := SelectedLine;
    Frm.Mode := aMode;
    Frm.ShowModal;
    if (aMode = poscAdd) and (Frm.ModalResult <> mrOK) then
      StockCode.Free;

    if (Frm.ModalResult = mrOK) then
      begin
        if FFuncMode <> poView then
          begin
            DisplayStockCodes;
          end;

        if aMode = poscAdd then
          begin
            irow := SelectedLine.StockCodes.count;
            if irow <= 0 then irow := 1;
          end
        else
        if aMode = poscDelete then
          begin
            irow := irow-1;
            if irow <= 0 then irow := 1;
          end;
        sgVersions.row := irow;
      end;
  finally
    Frm.Free;
  end;
end;

procedure TPBMaintPOrdFrm.btnChangeStockCodeClick(Sender: TObject);
begin
  CallMaintStockCodes(poscChange);

end;

procedure TPBMaintPOrdFrm.btnDeleteStockCodeClick(Sender: TObject);
begin
  CallMaintStockCodes(poscDelete);
end;

procedure TPBMaintPOrdFrm.sgVersionsDblClick(Sender: TObject);
begin
  if btnChangeStockCode.Enabled then
    begin
      if FFuncMode <> poView then
        btnChangeStockCodeClick(Self)
    end;

end;

procedure TPBMaintPOrdFrm.ReqByDateEditChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.CustReqDateEditChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintPOrdFrm.chkbxFileCopiesClick(Sender: TObject);
begin
  if FActiveDone then
    UpdateOrderLine;

  {Set the File Copies check box}
  if SelectedLine.FileCopiesReceived <> 0 then
    begin
      chkbxFileCopies.caption := 'File Copies Received ' + PBDateStr(SelectedLine.FileCopiesReceived) + ' - ' + SelectedLine.FileCopiesReceivedName;
    end
  else
    begin
      chkbxFileCopies.caption := 'File Copies Received';
    end;
end;

procedure TPBMaintPOrdFrm.edtAltPurchaseOrderExit(Sender: TObject);
begin
  UpdateOrderLine;
end;

end.
