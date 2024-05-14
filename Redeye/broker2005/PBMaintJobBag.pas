unit PBMaintJobBag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, Grids, DB,
  DBGrids, PBJobBagDM, ExtCtrls, ComCtrls, DBCtrls, PBPOObjects, pbOrdersDM, Variants, printers, stSOObjects,
  Menus, PBWOrdersDM, ShellAPI, IniFiles, pbSalesInvoiceDM, ActiveX, OleCtrls, SHDocVw, pbSupplierInvoiceDM,
  ImgList, Clipbrd, ToolWin, FileCtrl, DateUtils, System.ImageList, FireDAC.Stan.Param, DragDrop, DropTarget,
  DragDropFile, DropComboTarget;

type
  TPBMaintJobBagFrm = class(TForm)
    pnlHeader: TPanel;
    Label2: TLabel;
    pgDetails: TPageControl;
    tsOrders: TTabSheet;
    pnlCharges: TPanel;
    edtCustomer: TEdit;
    btnCustomer: TBitBtn;
    Label6: TLabel;
    BitBtn4: TBitBtn;
    pnlBottom: TPanel;
    stsbrDetails: TStatusBar;
    Label1: TLabel;
    edtDescription: TEdit;
    dblkpCustomerContact: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    edtCustOrderNo: TEdit;
    memQuantity: TMemo;
    Label9: TLabel;
    btnRep: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel4: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pmnDummy: TPopupMenu;
    pmnFunctions: TPopupMenu;
    mnuInsertexistingPO: TMenuItem;
    mnuAddnewPO: TMenuItem;
    N3: TMenuItem;
    mnuChangeLine: TMenuItem;
    mnuDelete: TMenuItem;
    mnuAddProduction: TMenuItem;
    mnuAddSundrycharge: TMenuItem;
    mnuAddWorksOrderCharge: TMenuItem;
    N4: TMenuItem;
    Label11: TLabel;
    edtDescriptiveRef: TEdit;
    pmnPOrders: TPopupMenu;
    Print1: TMenuItem;
    add1: TMenuItem;
    Change1: TMenuItem;
    Delete1: TMenuItem;
    N6: TMenuItem;
    InsertanexistingPO1: TMenuItem;
    FlashTimer: TTimer;
    pnlFooter: TPanel;
    btnNotes: TBitBtn;
    btnAddPO: TBitBtn;
    btnNew: TBitBtn;
    btnChange: TBitBtn;
    btnProduction: TBitBtn;
    btnExtras: TBitBtn;
    btnAdd: TBitBtn;
    btnDelete: TBitBtn;
    sgLines: TStringGrid;
    pmnSOrders: TPopupMenu;
    mnuChange: TMenuItem;
    mnuPrintStockOrder: TMenuItem;
    mnuEditDescription: TMenuItem;
    N2: TMenuItem;
    mnuAllocate: TMenuItem;
    mnuDeAllocate: TMenuItem;
    N1: TMenuItem;
    mnuPickingNote: TMenuItem;
    mnuConfirm: TMenuItem;
    mnuProduction: TMenuItem;
    mnuConvert: TMenuItem;
    ConvertEnquirytoaPO1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    mnuReturnsReport: TMenuItem;
    chkbxLineReadyToInvoice: TCheckBox;
    mnuEditSOPrices: TMenuItem;
    tsIntNotes: TTabSheet;
    DocOpenDialog: TOpenDialog;
    svDlgOfficeDoc: TSaveDialog;
    Panel6: TPanel;
    Panel7: TPanel;
    lblDocumentDir: TLabel;
    tsInvoicing: TTabSheet;
    edtRep: TEdit;
    tsSchedule: TTabSheet;
    pnlArtwork: TPanel;
    pnlSamples: TPanel;
    pnlDataServices: TPanel;
    Panel15: TPanel;
    chkbxArtRequired: TCheckBox;
    scrlArtwork: TScrollBox;
    Label13: TLabel;
    edtArtDueInDate: TEdit;
    btnArtDueInDate: TBitBtn;
    btnArtProofReqDate: TBitBtn;
    edtArtProofReqDate: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    edtArtApprovalDate: TEdit;
    btnArtApprovalDate: TBitBtn;
    Panel16: TPanel;
    chkbxDSRequired: TCheckBox;
    scrlDataServices: TScrollBox;
    Label16: TLabel;
    edtDataDueInDate: TEdit;
    btnDataDueInDate: TBitBtn;
    btnClientBriefInDate: TBitBtn;
    edtClientBriefInDate: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    edtTextDueInDate: TEdit;
    btnTextDueInDate: TBitBtn;
    btnBriefToDSDate: TBitBtn;
    edtBriefToDSDate: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    edtTextToDSDate: TEdit;
    btnTextToDSDate: TBitBtn;
    btnTextProofReqDate: TBitBtn;
    edtTextProofReqDate: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtLiveProofReqDate: TEdit;
    btnLiveProofReqDate: TBitBtn;
    btnLiveProofAppDate: TBitBtn;
    edtLiveProofAppDate: TEdit;
    Label23: TLabel;
    Panel17: TPanel;
    chkbxSamples: TCheckBox;
    scrlSamples: TScrollBox;
    Label27: TLabel;
    edtSEPClientDate: TEdit;
    btnSEPClientDate: TBitBtn;
    btnSEPApprovalDate: TBitBtn;
    edtSEPApprovalDate: TEdit;
    Label28: TLabel;
    tsProduction: TTabSheet;
    pnlTop: TPanel;
    labJobBagInfo: TLabel;
    edtJobBag: TEdit;
    Label4: TLabel;
    edtDate: TEdit;
    btnDate: TBitBtn;
    Label3: TLabel;
    edtDateReq: TEdit;
    BitBtn2: TBitBtn;
    Label25: TLabel;
    edtStartDate: TEdit;
    BitBtn6: TBitBtn;
    Panel12: TPanel;
    memScheduleNotes: TMemo;
    Panel14: TPanel;
    btnNewSchedule: TBitBtn;
    btnHistorySchedule: TBitBtn;
    lblRevision: TLabel;
    chkbxArtDueInDate: TCheckBox;
    chkbxArtProofReqDate: TCheckBox;
    chkbxArtApprovalDate: TCheckBox;
    chkbxSEPClientDate: TCheckBox;
    chkbxSEPApprovalDate: TCheckBox;
    chkbxDataDueInDate: TCheckBox;
    chkbxClientBriefInDate: TCheckBox;
    chkbxTextDueInDate: TCheckBox;
    chkbxBriefToDSDate: TCheckBox;
    chkbxTextToDSDate: TCheckBox;
    chkbxTextProofReqDate: TCheckBox;
    chkbxLiveProofReqDate: TCheckBox;
    chkbxLiveProofAppDate: TCheckBox;
    lblScheduleDate: TLabel;
    lblScheduleOp: TLabel;
    Label26: TLabel;
    cmbApprovalType: TComboBox;
    tsRequests: TTabSheet;
    sgRequests: TStringGrid;
    pnlRequests: TPanel;
    btnAddRequest: TBitBtn;
    btnChangeRequest: TBitBtn;
    btnDeleteRequest: TBitBtn;
    pmnRequests: TPopupMenu;
    mnuRequestChange: TMenuItem;
    mnuRequestPrint: TMenuItem;
    mnuRequestEditSOPrices: TMenuItem;
    MenuItem5: TMenuItem;
    mnuRequestAllocate: TMenuItem;
    mnuRequestDeAllocate: TMenuItem;
    MenuItem8: TMenuItem;
    mnuRequestPickNote: TMenuItem;
    mnuRequestConfirm: TMenuItem;
    btnChargeRequest: TBitBtn;
    pmnWorks: TPopupMenu;
    pmniView: TMenuItem;
    pmniPrint: TMenuItem;
    tsSupply: TTabSheet;
    mnuCopy: TMenuItem;
    Panel11: TPanel;
    sgSupply: TStringGrid;
    btnConvertSupply: TBitBtn;
    Label24: TLabel;
    edtDataToDSDate: TEdit;
    btnDatatoDSDate: TBitBtn;
    chkbxDataToDSDate: TCheckBox;
    Label29: TLabel;
    edtPDFProofReqDate: TEdit;
    btnPDFProofReqDate: TBitBtn;
    chkbxPDFProofReqDate: TCheckBox;
    chkbxPDFProofAppDate: TCheckBox;
    btnPDFProofAppDate: TBitBtn;
    edtPDFProofAppDate: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    edtPDFProofArtDate: TEdit;
    btnPDFProofArtDate: TBitBtn;
    chkbxPDFProofArtDate: TCheckBox;
    cmbOnHold: TComboBox;
    Label10: TLabel;
    BitBtn3: TBitBtn;
    scrlProduction: TScrollBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    CheckBox6: TCheckBox;
    Panel10: TPanel;
    Panel13: TPanel;
    sgWorks: TStringGrid;
    pnlWorks: TPanel;
    btnAddWorks: TBitBtn;
    btnChangeWorks: TBitBtn;
    btnDeleteWorks: TBitBtn;
    btnInsertWorks: TBitBtn;
    btnPrintWorks: TBitBtn;
    btnCopyWorks: TBitBtn;
    btnRepeatWorks: TBitBtn;
    pnlCostCentre: TPanel;
    Label35: TLabel;
    edtCostCentre: TEdit;
    btnCostCentre: TBitBtn;
    tsDataCollect: TTabSheet;
    Panel21: TPanel;
    dbgDataCollect: TDBGrid;
    cmbDepartment: TComboBox;
    Label39: TLabel;
    Panel22: TPanel;
    lblMachineHours: TLabel;
    lblOvertimeHours: TLabel;
    lblLabourHours: TLabel;
    imgChkbxGreyed: TImage;
    imgChkBxInvoiceAll: TImage;
    chkbxCashSale: TCheckBox;
    ConvertQuoteintoJob1: TMenuItem;
    tsNCA: TTabSheet;
    pnlFunctions: TPanel;
    btnAddNCA: TBitBtn;
    btnChangeNCA: TBitBtn;
    btnDeleteNCA: TBitBtn;
    btnPrintNCA: TBitBtn;
    tsAnalysis: TTabSheet;
    pnlSInvoices: TPanel;
    dbgSalesInvoices: TDBGrid;
    Panel8: TPanel;
    btnViewSI: TBitBtn;
    btnRePrintSI: TBitBtn;
    Panel9: TPanel;
    Label36: TLabel;
    pnlPInvoices: TPanel;
    dbgPurchaseInvoices: TDBGrid;
    Panel20: TPanel;
    btnViewPI: TBitBtn;
    Panel18: TPanel;
    Label37: TLabel;
    Panel1: TPanel;
    Label12: TLabel;
    Label38: TLabel;
    Label41: TLabel;
    Panel19: TPanel;
    Label42: TLabel;
    lblTotalPInvoices: TLabel;
    Panel23: TPanel;
    Panel24: TPanel;
    Label43: TLabel;
    Panel25: TPanel;
    sgNCADetails: TStringGrid;
    Panel26: TPanel;
    Label40: TLabel;
    memNCADetails: TMemo;
    pnlDataAnalysis: TPanel;
    Panel28: TPanel;
    Label44: TLabel;
    memTotalOvertime: TMemo;
    memTotalLabour: TMemo;
    memTotalMachine: TMemo;
    memTotalClick: TMemo;
    memTotalProductionCost: TMemo;
    Label45: TLabel;
    Label46: TLabel;
    memTotalPIAnalysis: TMemo;
    memTotalSIAnalysis: TMemo;
    memTotalSI: TMemo;
    memTotalPI: TMemo;
    memTotalMarginAnalysis: TMemo;
    memMarginPercAnalysis: TMemo;
    Label47: TLabel;
    Label48: TLabel;
    sgAnalysis: TStringGrid;
    Label49: TLabel;
    Label50: TLabel;
    memBudgetPOAnalysis: TMemo;
    memBudgetSalesAnalysis: TMemo;
    memBudgetMargin: TMemo;
    memBudgetMarginPerc: TMemo;
    lblPICount: TLabel;
    Button1: TButton;
    memBudgetEstimated: TMemo;
    pnlProduction: TPanel;
    chkbxProductionComplete: TCheckBox;
    imgChkbxChecked: TImage;
    imgChkbxUnChecked: TImage;
    edtdateComplete: TEdit;
    btnDateComplete: TBitBtn;
    lblCompleteBy: TLabel;
    tsDeliveries: TTabSheet;
    pnlDeliveries: TPanel;
    btnAddDelivery: TBitBtn;
    btnChangeDelivery: TBitBtn;
    btnDeleteDelivery: TBitBtn;
    btnPrintDeliveryNote: TBitBtn;
    sgDeliveries: TStringGrid;
    btnPrintDeliveryLabel: TBitBtn;
    chkbxAuthorise: TCheckBox;
    RepeatanexistingPO1: TMenuItem;
    mnuRepeatanexistingPO2: TMenuItem;
    miSendTo: TMenuItem;
    miExcel: TMenuItem;
    N5: TMenuItem;
    N9: TMenuItem;
    miSendto1: TMenuItem;
    Excel1: TMenuItem;
    N10: TMenuItem;
    miSendTo2: TMenuItem;
    Excel2: TMenuItem;
    N11: TMenuItem;
    miSendTo3: TMenuItem;
    Excel3: TMenuItem;
    btnPrintWorksISO: TBitBtn;
    tsSpecification: TTabSheet;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    imgIcons: TImageList;
    pmnuDocuments: TPopupMenu;
    CreateExcelDocument1: TMenuItem;
    CreateWordDocument1: TMenuItem;
    Email1: TMenuItem;
    Adddocument1: TMenuItem;
    MenuItem1: TMenuItem;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    MenuItem2: TMenuItem;
    pmnuSelectAll: TMenuItem;
    tlbrDocuments: TToolBar;
    btnExcel: TToolButton;
    btnWord: TToolButton;
    btnEmail: TToolButton;
    btnAttach: TToolButton;
    imgDocuments: TImageList;
    lstvwDocuments: TListView;
    chkbxReadytoInvoice: TCheckBox;
    lblJobRevenue: TLabel;
    dblkpJobRevenue: TDBLookupComboBox;
    chkbxFileCopies: TCheckBox;
    btnEmailSupplier: TToolButton;
    edtDateCopiesReceived: TEdit;
    btnDateCopiesReceived: TBitBtn;
    lblCopiesReceivedBy: TLabel;
    dirlstJobDocuments: TDirectoryListBox;
    pnlDocumentsLeft: TPanel;
    Label5: TLabel;
    edtAccountManager: TEdit;
    btnAccountManager: TBitBtn;
    lblAccountteam: TLabel;
    edtAccountTeam: TEdit;
    pnlSubReps: TPanel;
    Label52: TLabel;
    edtSubRep: TEdit;
    btnSubRep: TBitBtn;
    chkbxInvoiceThisWeek: TCheckBox;
    lblInvoiceThisWeekBy: TLabel;
    lblInvoiceThisWeekDate: TLabel;
    pnlEndUser: TPanel;
    Label53: TLabel;
    edtEndUser: TEdit;
    btnEndUser: TBitBtn;
    pnlOurTotals: TPanel;
    labCosts: TLabel;
    labSales: TLabel;
    labMargin: TLabel;
    LabMarginPerc: TLabel;
    labTotalCost: TLabel;
    labTotalSell: TLabel;
    LabTotalMargin: TLabel;
    labTotalMarginPerc: TLabel;
    lblCompany: TLabel;
    pnlPackPrice: TPanel;
    Label51: TLabel;
    labUnitSell: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    bitbtnPriceUnitClear: TBitBtn;
    Panel5: TPanel;
    pnlReseller: TPanel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    reselTotalCost: TLabel;
    reselTotalSell: TLabel;
    reselTotalMargin: TLabel;
    reselTotalMarginPerc: TLabel;
    Label58: TLabel;
    Delivery1: TMenuItem;
    lblNonConformance: TLabel;
    lblGDPRSignedStatement: TLabel;
    pnlPackFormat: TPanel;
    Label59: TLabel;
    dblkpPackFormat: TDBLookupComboBox;
    btnPackFormat: TBitBtn;
    rdgrpEnclosingType: TRadioGroup;
    pnlRep: TPanel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    repTotalCost: TLabel;
    RepTotalSell: TLabel;
    RepTotalMargin: TLabel;
    repTotalMarginPerc: TLabel;
    Label68: TLabel;
    pmnuSI: TPopupMenu;
    pmnuViewSI: TMenuItem;
    pmnuRePrintSI: TMenuItem;
    pmnuPI: TPopupMenu;
    pmnuViewPI: TMenuItem;
    DropComboTarget1: TDropComboTarget;
    procedure btnCancelClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAddPOClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure edtDateReqExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure memQuantityEnter(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure memQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure dbgLinesDblClick(Sender: TObject);
    procedure dblkpCustomerContactClick(Sender: TObject);
    procedure dblkpRepClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProductionClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnSOrdersPopup(Sender: TObject);
    procedure mnuChangeClick(Sender: TObject);
    procedure mnuAllocateClick(Sender: TObject);
    procedure mnuDeAllocateClick(Sender: TObject);
    procedure mnuPickingNoteClick(Sender: TObject);
    procedure mnuConfirmClick(Sender: TObject);
    procedure btnExtrasClick(Sender: TObject);
    procedure pmnFunctionsPopup(Sender: TObject);
    procedure btnAccountManagerClick(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure btnNotesClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure sgLinesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgLinesDblClick(Sender: TObject);
    procedure btnChangeWorksClick(Sender: TObject);
    procedure btnAddWorksClick(Sender: TObject);
    procedure btnDeleteWorksClick(Sender: TObject);
    procedure sgWorksDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgWorksDblClick(Sender: TObject);
    procedure sgLinesContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure mnuPrintStockOrderClick(Sender: TObject);
    procedure mnuEditDescriptionClick(Sender: TObject);
    procedure mnuProductionClick(Sender: TObject);
    procedure btnInsertWorksClick(Sender: TObject);
    procedure sgLinesRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure btnPrintWorksClick(Sender: TObject);
    procedure btnCopyWorksClick(Sender: TObject);
    procedure mnuConvertClick(Sender: TObject);
    procedure mnuReturnsReportClick(Sender: TObject);
    procedure btnRepeatWorksClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgLinesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgLinesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chkbxLineReadyToInvoiceClick(Sender: TObject);
    procedure sgLinesTopLeftChanged(Sender: TObject);
    procedure InvoiceAllClick(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure mnuEditSOPricesClick(Sender: TObject);
    procedure chkbxReadytoInvoiceClick(Sender: TObject);
    procedure dblkpJobRevenueClick(Sender: TObject);
    procedure SetButtonProperties(Sender: TObject);
    procedure btnViewSIClick(Sender: TObject);
    procedure btnRePrintSIClick(Sender: TObject);
    procedure dbgSalesInvoicesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgSalesInvoicesDblClick(Sender: TObject);
    procedure chkbxArtRequiredClick(Sender: TObject);
    procedure chkbxDSRequiredClick(Sender: TObject);
    procedure chkbxSamplesClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edtArtDueInDateExit(Sender: TObject);
    procedure btnArtDueInDateClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure btnNewScheduleClick(Sender: TObject);
    procedure btnHistoryScheduleClick(Sender: TObject);
    procedure chkbxArtDueInDateClick(Sender: TObject);
    procedure btnAddRequestClick(Sender: TObject);
    procedure btnChangeRequestClick(Sender: TObject);
    procedure sgRequestsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgRequestsDblClick(Sender: TObject);
    procedure pmnRequestsPopup(Sender: TObject);
    procedure mnuRequestChangeClick(Sender: TObject);
    procedure btnDeleteRequestClick(Sender: TObject);
    procedure mnuRequestPrintClick(Sender: TObject);
    procedure mnuRequestEditSOPricesClick(Sender: TObject);
    procedure mnuRequestAllocateClick(Sender: TObject);
    procedure mnuRequestDeAllocateClick(Sender: TObject);
    procedure mnuRequestPickNoteClick(Sender: TObject);
    procedure mnuRequestConfirmClick(Sender: TObject);
    procedure btnChargeRequestClick(Sender: TObject);
    procedure pmnWorksPopup(Sender: TObject);
    procedure mnuCopyClick(Sender: TObject);
    procedure sgSupplyDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnConvertSupplyClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject);
    procedure btnCostCentreClick(Sender: TObject);
    procedure cmbDepartmentChange(Sender: TObject);
    procedure ConvertQuoteintoJob1Click(Sender: TObject);
    procedure btnAddNCAClick(Sender: TObject);
    procedure btnChangeNCAClick(Sender: TObject);
    procedure btnDeleteNCAClick(Sender: TObject);
    procedure sgNCADetailsDblClick(Sender: TObject);
    procedure btnPrintNCAClick(Sender: TObject);
    procedure sgNCADetailsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure tsAnalysisShow(Sender: TObject);
    procedure sgNCADetailsClick(Sender: TObject);
    procedure memTotalSIChange(Sender: TObject);
    procedure memTotalPIChange(Sender: TObject);
    procedure sgAnalysisDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure dbgPurchaseInvoicesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgPurchaseInvoicesDblClick(Sender: TObject);
    procedure btnViewPIClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkbxProductionCompleteClick(Sender: TObject);
    procedure edtdateCompleteExit(Sender: TObject);
    procedure btnDateCompleteClick(Sender: TObject);
    procedure sgDeliveriesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnAddDeliveryClick(Sender: TObject);
    procedure btnChangeDeliveryClick(Sender: TObject);
    procedure btnDeleteDeliveryClick(Sender: TObject);
    procedure sgDeliveriesDblClick(Sender: TObject);
    procedure btnPrintDeliveryNoteClick(Sender: TObject);
    procedure btnPrintDeliveryLabelClick(Sender: TObject);
    procedure RepeatanexistingPO1Click(Sender: TObject);
    procedure dblkpPriceUnitClick(Sender: TObject);
    procedure FormRefClrBitBtnClick(Sender: TObject);
    procedure memQuantityChange(Sender: TObject);
    procedure miExcelClick(Sender: TObject);
    procedure Excel3Click(Sender: TObject);
    procedure edtCustOrderNoChange(Sender: TObject);
    procedure btnPrintWorksISOClick(Sender: TObject);
    procedure SpecificationChange(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure chkbxFileCopiesClick(Sender: TObject);
    procedure btnEmailSupplierClick(Sender: TObject);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure btnDateCopiesReceivedClick(Sender: TObject);
    procedure dirlstJobDocumentsChange(Sender: TObject);
    procedure btnSubRepClick(Sender: TObject);
    procedure chkbxInvoiceThisWeekClick(Sender: TObject);
    procedure btnEndUserClick(Sender: TObject);
    procedure Delivery1Click(Sender: TObject);
    procedure dblkpPackFormatClick(Sender: TObject);
    procedure rdgrpEnclosingTypeClick(Sender: TObject);
    procedure btnPackFormatClick(Sender: TObject);
    procedure DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
  private
    bReadPage: boolean;
    bOK: boolean;
    bNotesFlash: ByteBool;
    dtmdlJBOrders: TdtmdlOrders;
    dtmdlJBWOrders: TdtmdlWOrders;
    FActivated, FAnalysisOn : Boolean;
    FEmailApplication : string;
    FJobBag: TJobBag;
    FMode: TJBMode;
    FOriginalCustomer : integer;
    FOriginalBranch : integer;
    FPOStatus: integer;
    FPOStatusDescr: string;
    FSOStatus: integer;
    FSOStatusDescr: string;
    FSODateOrdered: TDateTime;
    FSODateRequired: TDateTime;
    FWOStatus: integer;
    FWOStatusDescr: string;
    sOldValue: string;
    FDefaultBin: integer;
    FDefaultPrinter: string;
    FSchedMode: TJBSchMode;
    function GetFilesPath: string;
    procedure AddPurchaseOrder(const rPO: real; iLine : integer);
    procedure AddPurchaseOrderFromEnq(const rPO: real; iLine: integer);
    function AddNewOrderLine(const LineNo: Integer): PBPOObjects.TOrderLine;
    procedure CreateDelivery(const iCust : integer; OrdLine: PBPOObjects.TOrderLine);
    procedure CallAllocScreen(sTempFuncMode: Char);
    procedure CallInsertEnqScreen;
    procedure CallInsertWOScreen;
    procedure CallMaintForm(aMode : TJBLMode);
    procedure CallMaintScreen(const aMode: TJBLMode);
    procedure CallMaintStockScreen(sTempFuncMode: Char);
    procedure CallMaintWOrderScreen(const aMode: TJBMode);
    procedure CallMaintExtrasForm(aMode: TJBLMode);
    procedure CallMaintLines(aMode: TJBLMode);
    procedure CallMaintWorksOrder(const aMode: TjbwoMode);
    procedure CallMaintNCA(aMode: TjbncMode);
    procedure CallMaintDeliveries(aMode: TJBDelivMode);
    procedure CallMaintDetailsForm(aMode: TJBMode);
    procedure CallMaintDocuments(const aMode: TjbdocMode);
    procedure CallMaintProduction;
    procedure CallMaintStockRequest(sTempFuncMode: Char);
    function  ConfirmChange(const newCust, newBranch : integer) : Boolean;
    procedure DropPurchaseOrders;
    procedure GetCustomerContacts(tempNo: integer);
    procedure GetCustomerReps(tempNo: integer);
    procedure LoadDepartments;
    procedure SelectCode(tempCode: real);
    procedure SelectSalesOrder(tempCode: integer);
    procedure SetJobBag(const Value: TJobBag);
    procedure SetProperties;
    procedure ShowDetails;
    procedure ShowRequests;
    procedure ShowDocuments;
    procedure ShowQuoteDocuments;
    procedure ShowSpecification;
    procedure ShowLineDetails;
    procedure ShowProcesses;
    procedure ShowSchedules;
    procedure ShowSalesInvoices;
    procedure ShowDataCollection;
    procedure ShowPurchaseInvoices;
    procedure ShowNonConformDetails;
    procedure ShowTotals;
    procedure ShowUnitPrice;
    procedure ShowWorksInstructions;
    procedure SetMode(const Value: TJBMode);
    procedure UpdJobBagHead(Sender: TObject);
    function AddNewSalesOrder: TSalesOrder;
    procedure SelectWorksOrder(tempCode: integer);
    procedure UpdJobBagHeadWorksOrder(aWOrder: TWOrder);
    procedure CheckNotes(Sender: TObject);
    procedure BuildDeliveryGrid;
    procedure BuildDocumentGrid;
    procedure BuildRequestGrid;
    procedure BuildLineGrid;
    procedure BuildWorksGrid;
    procedure BuildNonConformGrid;
    procedure BuildSpecification;
    procedure SetLineHeaders;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure ClearProcesses;
    procedure SetJBButtons(LineNo: integer);
    procedure SetButtons;
    procedure LoadImageChecked(tempRow, iChecked: integer);
    procedure CallRepeatWOScreen;
    procedure ReNumberLines(delLine: integer);
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    procedure ReLoadImages;
    function celltopNew(grid: TStringGrid; Row: Integer): Integer;
    procedure SendAndSaveEmail(sTo, sSubject: string);
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    function ParseDocumentFrom(tmpFrom: string): string;
    procedure ParseMessage(const AFileName: string; var ATo, AFrom,
      ASubject, ADate, ABody: string);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure SetSchedMode(const Value: TJBSchMode);
    procedure CreateSchedule;
    procedure CreateNewSchedule;
    procedure CallAllocRequest(sTempFuncMode: Char);
    procedure SetViewProperties;
    procedure BuildSupplyGrid;
    procedure ShowSupplies;
    procedure BuildProcesses;
    procedure UpdateProcesses;
    function FormatDateasDateTime(sDate: string): TDateTime;
    procedure InsertQuoteDetails(tmpQuote: double);
    procedure ShowAnalysis;
    procedure ShowDeliveries;
    procedure MoveQuoteDocuments;
    procedure ShowListViewDocuments(strPath: string; ListView: TListView;
      ImageList: TImageList);
    procedure UpdateInternalCost;
    procedure CheckForCustomerNotes;
  private
    Descending: Boolean;
    SortedColumn: Integer;
    rTotalSI, rTotalPI: real;
    rRepeatPO: real;
    CostCentreLevel: string;
    DroppedEmailFile: string;
    iMnuMaintPOrds: integer;
    iDocumentCol: integer;
    bNewPOAdded: boolean;
    bInvoiceChange, bTempCanUpd, bTempView, bTempNotes: boolean;
    sPath, sParentPath: string;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  public
    bComeFromOrder: boolean;
    property JobBag : TJobBag read FJobBag write SetJobBag;
    property Mode: TJBMode read FMode write SetMode;
    property SchedMode: TJBSchMode read FSchedMode write SetSchedMode;
  end;

implementation

uses
  System.UITypes, System.Types,
  PBPODataMod, PBAuditDM, PBMaintPOrd, PBLUCust, pbMainMenu, PBLUCConta, PBLUCRep, PBMaintJobBagRC,
  DateSelV5, pbLUCustOrdersJB, pbDatabase, STMntSOrd, CCSCommon, STpickobject,
  STPrtAllocSales, STRSPickNote, stPickingDM, STStockDM, STPickbyPart,
  PBMaintWorksOrders, PBMaintJobBagExtras, PBLUAccountManager, PBRSPOrdN,
  PBImages, PBDBMemo, PBMaintJobBagLines, PBMaintJobBagProcess, STRSSalesOrd,
  PBMaintJobBagLineDetails, STMaintSalesOrder, pbLUCustWorksJB,
  PBRSWorksOrder, pbLUCustEnqsJB, STRSSOProdReturns, STRSPickingNote,
  STMaintPick, PBMaintJobBagDoc, PBDocObjects, OleCtnrs, PBWordOLE, PBExcelOLE,
  PBMaintEmail, PBMaintSalesInvoice, PBSalesInvRPrint, ComObj, AxCtrls, taoMapi,
  PBMaintJobBagSched, PBLUOps, PBAutoPO, PBLUCustCstCntr,
  PBLUBranchCstCntr, pbLUCustQuotesJB, PBMaintJobBagNonConfDoc, PBMaintSuppInvoice,
  PBRSNonConform, CCSPrint, PBMaintJobBagProcessCosts, PBMaintJobBagDelivery,
  PBRSJobBagDelivNote, PBRSJobBagBoxLabels, PBSendtoExcel,
  PBRSWorksOrderISO, PBMaintEmailSupplier, pbluCustDeliv, PBLUPackFormat, Shared.DragDrop.Helper;

{$R *.DFM}

var
  oldCursor: TCursor;

procedure TPBMaintJobBagFrm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintJobBagFrm.FormActivate(Sender: TObject);
var
  sTemp : string;
  custStatus: string;
  bHasGDPRBeenSigned: boolean;
begin
  if not FActivated then
  begin
    try
      PBAuditDataMod.WriteAudit(3, JobBag.dbkey, 0, 0, 0, self.caption);
    except
    end;

    iMnuMaintPOrds := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuProduction') ;
    SetButtonProperties(self);
    bOK := false;

    with JobBag.DataModule do
    begin
      qryPackFormat.close;
      qryPackFormat.parambyname('ID').asinteger := JobBag.PackFormat;
      qryPackFormat.Open;

      qryAllPriceUnits.close;
      qryAllpriceUnits.Open;

      OperatorSQL.close;
      OperatorSQL.open;

      qryInvoiceLoc.close;
      qryInvoiceLoc.parambyname('Invoice_Location').asinteger := JobBag.InvoiceLocation;
      qryInvoiceLoc.open;
      if qryInvoiceLoc.RecordCount = 1 then
        dblkpJobRevenue.KeyValue := qryInvoiceLoc.fieldbyname('Invoice_Location').asinteger;
    end;

    dblkpPackFormat.ListSource := JobBag.DataModule.dtsPackFormat;
    dblkpCustomerContact.listsource := JobBag.DataModule.srcCustContact;
    dblkpPriceUnit.listsource := JobBag.DataModule.dtsAllPriceUnits;
    dblkpJobRevenue.ListSource := JobBag.DataModule.srcInvoiceLoc;
    dbgSalesInvoices.DataSource := JobBag.DataModule.srcAllSalesInvoices;
    dbgPurchaseInvoices.DataSource := JobBag.DataModule.srcAllPurchInvoices;
    dbgDataCollect.DataSource := JobBag.DataModule.srcDataCollect;
//    dbgAnalysis.Datasource := JobBag.DataModule.srcDataCollectCosts;

    case Mode of
    jbAdd     : Caption := 'Add a Job Bag';
    jbChange  : Caption := 'Change a Job Bag';
    jbDelete  : Caption := 'Delete a Job Bag';
    jbView    : Caption := 'View Job Bag details';
    jbRepeat   : Caption := 'Repeat a Job Bag ';
    jbConvert   : Caption := 'Convert quote to a Job Bag ';

    end;  { case }

    lblDocumentDir.Caption := lblDocumentDir.Caption + ' ' + dmBroker.GetCompanyJobBagDirectory;

    if (Mode = jbAdd)  or (Mode = jbRepeat) or (Mode = jbConvert) then
      sTemp := ' New Job Bag '
    else
      sTemp := ' Job Bag ' + IntToStr(JobBag.DbKey) + ' ';

    if (Mode = jbRepeat) or (Mode = jbConvert) then
      begin
        JobBag.DbKey := 0;
        JobBag.Date := date;
//        JobBag.GoodsRequired := date;
        JobBag.CustOrderNo := '';
        JobBag.OfficeContact := 0;
        JobBag.AccountTeam := JobBag.DataModule.GetOpAccountTeam(JobBag.OfficeContact);
        JobBag.readytoinvoice := 'N';

        JobBag.ProductionComplete := false;
        JobBag.ProductionDate := 0;
        JobBag.ProductionCompleteBy := 0;

        JobBag.FileCopiesReceived := false;
        JobBag.FileCopiesReceivedDate := 0;
        JobBag.FileCopiesReceivedBy := 0;

        JobBag.Operator := frmPBMainMenu.iOperator;
        JobBag.OperatorName := frmPBMainMenu.sOperator_Name;
        JobBag.Inactive := 'N';
      end;

    btnProduction.Visible := dmBroker.UseJobBagCosts;

    chkbxAuthorise.visible := (JobBag.Status = 5);

    LoadDepartments;
    ShowDetails;
    
    UpDateInternalCost;
    ShowLineDetails;
    ShowProcesses;
    ShowWorksInstructions;
    ShowRequests;
    ShowSchedules;
    ShowSalesInvoices;
    ShowSupplies;
    ShowPurchaseInvoices;
    ShowDataCollection;
    ShowNonConformDetails;
    ShowDeliveries;
    ShowSpecification;

    if (Mode = jbConvert) and (JobBag.DataModule.QuoteNo <> 0) then
      ShowQuoteDocuments
    else
      begin
        sParentPath := dmBroker.GetCompanyJobBagDirectory;
        if sParentPath <> '' then
          begin
            if (JobBag.dbKey <> 0) then
              begin
                sParentPath := dmBroker.GetCompanyJobBagDirectory + '\' + inttostr(JobBag.dbKey) + '\';
                sPath := sParentPath;
                dirlstJobDocuments.Directory := sPath;

                ShowDocuments;
              end;
          end;
      end;

    ShowTotals;

    SetProperties;

    Checknotes(Self);
    CheckOK(Self);

    FActivated := true;

//    if JobBag.JBStatus < 23 then
    custStatus := dmBroker.GetCustomerStatus(JobBag.Customer);

    if custStatus <> 'B' then
      begin
        if (custStatus = 'S') then
          MessageDlg(cOnStop, mtWarning,[mbOk], 0)
        else
        if custStatus = 'O' then
          MessageDlg(cOverDue, mtWarning,[mbOk], 0)
      end
    else
      begin
        //customer is on stop and on stop customers are blocked so warn user and return
        MessageDlg('This Customer is currently On Stop.'+#10#13+'Job Bags cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
        pnlCharges.enabled := false;
        pnlrequests.enabled := false;
        pnlWorks.enabled := false;
        sgLines.PopupMenu := nil;
        sgRequests.PopupMenu := nil;
        sgWorks.PopupMenu := nil;
      end;

    {Check that GDPR is in use}
    if dmBroker.UseGDPR then
      begin
        lblGDPRSignedStatement.visible := false;
        bHasGDPRBeenSigned := dmBroker.GetCustomerGDPRSigned(JobBag.Customer);
        if not bHasGDPRBeenSigned and (JobBag.Customer <> 0) then
          begin
            MessageDlg('The GDPR Policy has not been signed by this customer!!!', mtWarning,[mbOk], 0);
            lblGDPRSignedStatement.visible := true;
          end;
      end;

    if Mode = jbView then
      SetViewProperties
    else
    if (Mode = jbRepeat) or (Mode = jbCopy) or (Mode = jbConvert) then
      begin
        self.CheckForCustomerNotes;
      end;

    dmBroker.ScreenAccessControl(Self,'',frmPBMainMenu.iOperator,0,0) ;
  end;
end;

procedure TPBMaintJobBagFrm.SetViewProperties;
begin
  btnChange.Enabled := (JobBag.Lines.Count <> 0);
  btnPrintWorks.Enabled := (JobBag.Works.count <> 0);
  btnPrintWorksISO.Enabled := (JobBag.Works.count <> 0);
  btnChange.Caption := '&View';
  btnChangeWorks.Caption := '&View';
  btnChangeWorks.Enabled := (JobBag.Works.count <> 0);

  btnViewSI.Enabled := (JobBag.DataModule.qryAllSalesInvoices.RecordCount > 0);
  btnRePrintSI.Enabled := (JobBag.DataModule.qryAllSalesInvoices.RecordCount > 0);

  sgLines.popupmenu := nil;
  sgRequests.popupmenu := nil;
  sgWorks.PopupMenu := nil;
  pnlTop.Enabled := false;
  pnlHeader.enabled := false;
  pnlFooter.enabled := false;
end;

procedure TPBMaintJobBagFrm.SetButtonProperties(Sender: TObject);
begin
  {They can UPDATE this order if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the order is for the operator's rep OR} ;
  {    they have OPERATOR access and the order is for the operator} ;
  {Use the setting for the PO Maint button on the menu} ;
//  iTempAccCtrl := iMnuBtnPOMaint ;
  bTempCanUpd :=  ((iMnuMaintPords = 1) or
                  (iMnuMaintPords = 4) or
                  (iMnuMaintPords = 5) or
                  (dmBroker.CanUpdatePOinJobBag(frmPBMainMenu.iOperator)));
  bTempView := (iMnuMaintPOrds = 3);
  bTempNotes := (iMnuMaintPOrds = 2);
end;

procedure TPBMaintJobBagFrm.SetJobBag(const Value: TJobBag);
begin
  FJobBag := Value;
  FOriginalCustomer := JobBag.Customer;
  FOriginalBranch := JobBag.Branch;
end;

procedure TPBMaintJobBagFrm.CheckOK(Sender : TObject);
begin
  if (chkbxProductionComplete.checked) and (JobBag.JBStatus < 25) then
    begin
      btnOK.enabled := (Trim(edtDescription.Text) <> '') and
        (Trim(edtCustOrderNo.Text) <> '') and
        (Trim(memQuantity.Text) <> '') and
        (Trim(edtCustomer.Text) <> '') and
        (Trim(edtDateReq.Text) <> '') and
        (Trim(edtStartDate.Text) <> '') and
        (dblkpCustomerContact.text <> '') and
        (edtRep.text <> '') and
        (edtDateComplete.text <> '') and
        (edtAccountManager.Text <> '');
    end
  else
    begin
      btnOK.enabled := (Trim(edtDescription.Text) <> '') and
        (Trim(edtCustOrderNo.Text) <> '') and
        (Trim(memQuantity.Text) <> '') and
        (Trim(edtCustomer.Text) <> '') and
        (Trim(edtDateReq.Text) <> '') and
        (Trim(edtStartDate.Text) <> '') and
        (dblkpCustomerContact.text <> '') and
        (edtRep.text <> '') and
        (edtAccountManager.Text <> '');
    end;
end;

procedure TPBMaintJobBagFrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  dblkpPriceUnitClick(self);
end;

procedure TPBMaintJobBagFrm.ShowDetails;
var
  iLines: integer;
begin
  if Mode = jbAdd then
    begin
      edtJobBag.text := '<New Order>';
      edtDateReq.Text := '';
      edtStartDate.Text := '';
      edtDate.text := PBDateStr(Date);
      edtCustomer.text := '';
      edtDescription.text := '';
      edtDescriptiveRef.Text := '';
      edtCustOrderNo.text := '';
      memQuantity.text := '';
      edtAccountTeam.text := '';
      chkbxProductionComplete.checked := false;
      chkbxInvoiceThisWeek.Checked := false;
      chkbxFileCopies.checked := false;
      edtDateComplete.Enabled := false;
      btnDateComplete.Enabled := false;
      edtDateCopiesReceived.Enabled := false;
      btnDateCopiesReceived.Enabled := false;
      chkbxReadyToInvoice.checked := false;
      if dmBroker.ConfirmProduction then
        chkbxReadytoInvoice.Enabled := false;
      chkbxCashSale.checked := false;
      edtAccountManager.Text := '';
      dblkpPackFormat.keyvalue := -1;
      dblkpJobRevenue.Enabled := false;
      lbljobRevenue.Enabled := false;
      dblkpJobRevenue.keyvalue := 0;
      cmbOnHold.ItemIndex := -1;
      edtRep.Text := '';
      edtSubRep.Text := '';
      lblCompleteBy.caption := '';
      lblCopiesReceivedBy.Caption := '';
      lblInvoiceThisWeekBy.Caption := '';
      lblInvoiceThisWeekDate.Caption := '';
      edtEndUser.text := '';
    end
  else
    begin
      if JobBag.DbKey = 0 then
        edtJobBag.text := '<New Order>'
      else
        begin
          edtJobBag.text := IntToStr(JobBag.DbKey);
          dmBroker.CreateJobBagDocDirectory(inttostr(JobBag.dbKey));
        end;

      edtDate.text := PBDateStr(JobBag.Date);
      edtCustomer.text := JobBag.CustomerName+'/'+JobBag.BranchName;
      edtDescription.text := JobBag.Description;
      edtDescriptiveRef.Text := JobBag.DescriptiveRef;
      edtCustOrderNo.text := JobBag.CustOrderNo;
      memQuantity.text := inttostr(JobBag.Quantity);
//      chkbxOnHold.Checked := (JobBag.OnHold = 'Y');

      dblkpPriceUnit.keyvalue := JobBag.PriceUnit;

      if JobBag.OnHold = 'Y' then
        cmbOnHold.ItemIndex := 0
      else
      if JobBag.OnHold = 'P' then
        cmbOnHold.ItemIndex := 1
      else
        cmbOnHold.ItemIndex := -1;

      if JobBag.AcquiredCustomer then
        begin
          pnlEndUser.Visible := true;
          edtEndUser.text := JobBag.EndUserCustomerName; {Put Edn USer name here}
          sgLines.ColWidths[6] := 80;
        end
      else
        begin
          pnlEndUser.Visible := false;
          edtEndUser.text := '';
          sgLines.ColWidths[6] := -1;
        end;
      pnlReseller.Visible := pnlEndUser.Visible;

      if dmBroker.ShowRepTotals then
        begin
          pnlRep.Visible := true;
        end
      else
        begin
          pnlRep.Visible := false;
        end;

      imgChkbxInvoiceAll.left := cellleft(sgLines,8);

      if (Mode = jbRepeat) or (Mode = jbConvert) then
        begin
          edtDateReq.Text := '';
          edtStartDate.Text := '';
          edtDateComplete.Text := '';
          edtDateCopiesReceived.Text := '';
          lblInvoiceThisWeekDate.caption := '';
          lblInvoiceThisWeekBy.Caption := '';
        end
      else
        begin
          edtDateReq.Text := PBDateStr(JobBag.GoodsRequired);
          edtStartDate.Text := pbDateStr(JobBag.StartDate);
          for iLines := 0 to pred(JobBag.lines.count) do
            begin
              if JobBag.Lines[iLines].ReadyToInvoice = 'Y' then
                begin
                  imgChkbxInvoiceAll.picture := imgChkbxChecked.Picture;
                  imgChkbxInvoiceAll.Tag := 1;
                end;
            end;

          chkbxInvoiceThisWeek.checked := (JobBag.InvoiceThisWeek);
          lblInvoiceThisWeekDate.Caption := pbdatestr(jobBag.InvoiceThisWeekDate);
          lblInvoiceThisWeekBy.Caption := 'by ' + JobBag.InvoiceThisWeekName;
          lblInvoiceThisWeekBy.Visible := chkbxInvoiceThisWeek.checked;
        end;

      chkbxProductionComplete.checked := (JobBag.ProductionComplete);

      edtDateComplete.Text := pbdatestr(jobBag.ProductionDate);
      lblCompleteBy.Caption := 'by ' + JobBag.ProductionCompleteByName;

      edtDateComplete.Enabled := chkbxProductionComplete.checked;
      btnDateComplete.Enabled := chkbxProductionComplete.checked;
      lblCompleteby.Visible := chkbxProductionComplete.checked;

      chkbxFileCopies.checked := JobBag.FileCopiesReceived;

      edtDateCopiesReceived.Text := pbdatestr(jobBag.FileCopiesreceivedDate);
      lblCopiesReceivedBy.Caption := 'by ' + JobBag.FileCopiesReceivedName;

      edtDateCopiesReceived.Enabled := chkbxFileCopies.checked;
      btnDateCopiesReceived.Enabled := chkbxFileCopies.checked;
      lblCopiesReceivedBy.Visible := chkbxFileCopies.checked;

      if dmBroker.ConfirmProduction then
        chkbxReadytoInvoice.Enabled := chkbxProductionComplete.checked and dmBroker.ConfirmProduction;
        
      chkbxReadyToInvoice.checked := (JobBag.readytoinvoice = 'Y');

      chkbxCashSale.checked := (JobBag.cashsale);

      if JobBag.OfficeContact = 0 then
        edtAccountManager.Text := ''
      else
        edtAccountManager.Text :=  JobBag.AccountManagerName;
      edtAccountTeam.text := JobBag.Datamodule.GetOpAccountTeamName(JobBag.OfficeContact);

      rdgrpEnclosingType.itemindex := rdgrpEnclosingType.Items.IndexOf(jobBag.EnclosingType);

(*      if rdgrpEnclosingType.itemindex = -1 then
        rdgrpEnclosingType.itemindex := 0;
*)

      dblkpPackFormat.KeyValue := JobBag.PackFormat;
      dblkpJobRevenue.keyvalue := JobBag.InvoiceLocation;

      dblkpJobRevenue.enabled := chkbxReadytoInvoice.checked;
      lblJobRevenue.enabled := chkbxReadytoInvoice.checked;

      GetCustomerContacts(JobBag.ContactNo);
      GetCustomerReps(JobBag.Rep);

      {Cost centres}
      CostCentreLevel := dmBroker.GetCustomerCostCentreLevel(JobBag.Customer);
      pnlCostCentre.visible := (CostCentreLevel <> '');

(*      if CostCentreLevel <> '' then
        edtCostCentre.Text := JobBag.DataModule.GetCostCentre(JobBag.Customer, JobBag.Branch, JobBag.CostCentre, CostCentreLevel)
      else
        edtCostCentre.Text := '';
*)
      edtCostCentre.Text := JobBag.CostCentre;

      edtRep.Text := JobBag.DataModule.GetRepName(JobBag.rep);
      edtSubRep.Text := JobBag.DataModule.GetRepName(JobBag.SubRep);

//      lblProductionStatus.Caption := 'Production Status: ' + JobBag.Datamodule.GetProductionStatus(JobBag.ProductionStatus);

      stsbrDetails.Panels[0].Text := 'Created by: ' + JobBag.OperatorName;
      if JobBag.QuoteNo <> 0 then
        stsbrDetails.Panels[1].Text := 'Converted Quote: ' + floattostr(JobBag.QuoteNo);

      stsbrDetails.Panels[2].Text := 'Production Status: ' + JobBag.Datamodule.GetProductionStatus(JobBag.ProductionStatus);

      if JobBag.InvoiceByName <> '' then
        stsbrDetails.Panels[3].Text := 'Prepared for Invoicing by: ' + JobBag.InvoiceByName + ' - ' + formatdatetime('dd"/"mm"/"yy " at " hh:mm',JobBag.InvoiceByDate);
    end;
  btnOK.Visible := not(dmBroker.iAccCtrlMenu = 3);
end;

procedure TPBMaintJobBagFrm.ShowTotals;
begin
  labTotalCost.Caption := FloatToStrF(JobBag.TotalCost, ffCurrency, 15, 2);
  labTotalSell.Caption := FloatToStrF(JobBag.TotalSell, ffCurrency, 15, 2);
  labTotalMargin.Caption := FloatToStrF(JobBag.TotalMargin, ffCurrency, 15, 2);
  labTotalMarginPerc.Caption := FloatToStrF(JobBag.TotalMarginPerc, ffFixed, 15, 2);
  ShowUnitPrice;

  {Show total reseller values}
  reselTotalCost.Caption := FloatToStrF(JobBag.TotalSell, ffCurrency, 15, 2);
  reselTotalSell.Caption := FloatToStrF(JobBag.TotalReseller, ffCurrency, 15, 2);
  reselTotalMargin.Caption := FloatToStrF(JobBag.TotalResellerMargin, ffCurrency, 15, 2);
  reselTotalMarginPerc.Caption := FloatToStrF(JobBag.TotalResellerMarginPerc, ffFixed, 15, 2);

  {Show total rep values}
  repTotalCost.Caption := FloatToStrF(JobBag.TotalRepCost, ffCurrency, 15, 2);
  repTotalSell.Caption := FloatToStrF(JobBag.TotalSell, ffCurrency, 15, 2);
  repTotalMargin.Caption := FloatToStrF(JobBag.TotalRepMargin, ffCurrency, 15, 2);
  repTotalMarginPerc.Caption := FloatToStrF(JobBag.TotalRepMarginPerc, ffFixed, 15, 2);
end;

procedure TPBMaintJobBagFrm.ShowUnitPrice;
begin
  labUnitSell.Caption := FloatToStrF(JobBag.UnitSell, ffCurrency, 15, 2);
end;

procedure TPBMaintJobBagFrm.btnAddPOClick(Sender: TObject);
var
  inx: integer;
  rTempPO: real;
  iTempPOLine: Integer;
  Selected : Boolean;
  sOrders: string;
  icount: integer;
begin
  rTempPO := 0;
  iTempPOLine := 0;
  frmPBLUCustOrdersJB := TfrmPBLUCustOrdersJB.Create(Self);
  try
    sOrders := '';
    for icount := 0 to pred(JobBag.lines.count) do
      begin
        if JobBag.lines[icount].JBlineType = 'P' then
          if sOrders = '' then
            sOrders := floattostr(jobBag.lines[icount].PurchaseOrder)
          else
            sOrders := sOrders + ',' + floattostr(jobBag.lines[icount].PurchaseOrder);
      end;
    frmPBLUCustOrdersJB.ExistingOrders := sOrders;
    frmPBLUCustOrdersJB.bNot_In_JB := True;
    frmPBLUCustOrdersJB.Customer := JobBag.Customer;
    frmPBLUCustOrdersJB.Branch := JobBag.Branch;
    frmPBLUCustOrdersJB.CustomerName :=
      Trim(JobBag.CustomerName) + '/' + Trim(JobBag.BranchName);
    frmPBLUCustOrdersJB.ShowModal;
    Selected := frmPBLUCustOrdersJB.Selected;
    if Selected then
    begin
      rTempPO := frmPBLUCustOrdersJB.SelCode;
      iTempPOLine := frmPBLUCustOrdersJB.SelLine;
      bNewPOAdded := true;
    end;
  finally
    frmPBLUCustOrdersJB.Free;
  end;
  if Selected then
  begin
    try
      AddPurchaseOrder(rTempPO, iTempPOLine);
    finally
      UpDateInternalCost;
      ShowLineDetails;
      ShowTotals;
      inx := pred(JobBag.Lines.count);
      if inx < 0 then inx := 0;
      sgLines.Row := inx+1;
    end;
  end;
end;

procedure TPBMaintJobBagFrm.AddPurchaseOrder(const rPO: real;
  iLine: integer);
var
  JBLine : TJobBagLine;
  PurchaseOrder : TPurchaseOrder;
  OrderLine : PBPOObjects.TOrderLine;
  inx : integer;
begin
  PBPODM := TPBPODM.Create(Self);
  try
    PurchaseOrder := TPurchaseOrder.Create(PBPODM);
    try
      PurchaseOrder.PONumber := rPO;
      PBPODM.LoadPOFromDatabase(PurchaseOrder);
      inx := PurchaseOrder.OrderLines.IndexFromLineNo(iLine);
      OrderLine := PurchaseOrder.OrderLines[inx];
      JBLine := TJobBagLine.Create(JobBag);
      JBLine.CurrencyCode := PurchaseOrder.CurrencyCode;
//      JBLine.JBLine := JobBag.Lines.Count + 1;
      JBLine.JBLine := JobBag.Lines.MaxLineNo + 1;
      JBLine.JBLineType := 'P';
      JBLine.JBLineMode := 'N';
      JBLine.PurchaseOrder := PurchaseOrder.PONumber;
      JBLine.Line := OrderLine.Line;
      JBLine.Supplier:= PurchaseOrder.Supplier;
      JBLine.BranchNo := PurchaseOrder.BranchNo;
      JBLine.JBLineDescr := OrderLine.CustomersDesc;
      JBLine.JBQuantity := Trunc(OrderLine.Quantity);
      with JobBag.Datamodule do
      begin
        JBLine.JBLineCost := CalculatePrice(OrderLine.OrderUnit,
          OrderLine.Quantity, OrderLine.OrderPrice)+OrderLine.ExtraCharges.Total;
        JBLine.JBLineSell := CalculatePrice(OrderLine.SellUnit,
          OrderLine.Quantity, OrderLine.SellingPrice)+OrderLine.ExtraCharges.TotalSell;
        JBLine.JBLineReseller := CalculatePrice(OrderLine.SellUnit,
          OrderLine.Quantity, OrderLine.SellingPrice)+OrderLine.ExtraCharges.TotalSell;
      end;
      JBLine.JBLineInvoiced := 'N';
      if OrderLine.POLineStatus >= 30 then      {Fully invoiced}
        begin
          JBLine.JBLineInvoiced := 'Y';
          JBLine.JBLineStatus := OrderLine.POLineStatus;
        end
      else if OrderLine.POLineStatus >= 25 then   {Part Invoiced}
        begin
          JBLine.JBLineInvoiced := 'P';
          JBLine.JBLineStatus := OrderLine.POLineStatus;
        end
      else if OrderLine.POLineStatus >= 21 then     {Fully or part delivered}
        JBLine.JBLineStatus := OrderLine.POLineStatus
      else
        JBLine.JBLineStatus := 12;     {In production}

      JBLine.VATCode := OrderLine.VATCode;

      JBLine.JBLineStatusText := JobBag.DataModule.GetPOStatus(PurchaseOrder.PONumber,OrderLine.Line,
                                            JobBag.dbKey, JBLine.JBLine, JBLine.JBLineInvoiced);
      JBLine.SupplierName := PurchaseOrder.SupplierName;
      JBLine.Sequence := JBLine.Parent.Lines.count+1;


      JBLine.ClearedFundsReq := JobBag.DataModule.GetPOClearedFunds(JBLine.PurchaseOrder, JBLine.Line);
      JBLine.ClearedFundsRec := JobBag.DataModule.GetInvClearedFunds(JBLine.PurchaseOrder, JBLine.Line);
      JBLine.NeedsAuthorising := JobBag.DataModule.GetPOAuthorised(JBLine.PurchaseOrder);

      JobBag.Lines.Add(JBLine);
//      JobBag.SaveToDB(false);
    finally
      PurchaseOrder.Free;
    end;
  finally
    PBPODM.Free;
  end;
end;

procedure TPBMaintJobBagFrm.AddPurchaseOrderFromEnq(const rPO: real;
  iLine: integer);
var
  JBLine : TJobBagLine;
  PurchaseOrder : TPurchaseOrder;
  OrderLine : PBPOObjects.TOrderLine;
  inx : integer;
begin
  PBPODM := TPBPODM.Create(Self);
  try
    PurchaseOrder := TPurchaseOrder.Create(PBPODM);
    try
      PurchaseOrder.PONumber := rPO;
      PBPODM.LoadPOFromDatabase(PurchaseOrder);
      inx := PurchaseOrder.OrderLines.IndexFromLineNo(iLine);
      OrderLine := PurchaseOrder.OrderLines[inx];
      JBLine := TJobBagLine.Create(JobBag);
      JBLine.CurrencyCode := PurchaseOrder.CurrencyCode;
//      JBLine.JBLine := JobBag.Lines.Count + 1;
      JBLine.JBLine := JobBag.Lines.MaxLineNo + 1;
      JBLine.JBLineType := 'P';
      JBLine.JBLineMode := 'C';
      JBLine.PurchaseOrder := PurchaseOrder.PONumber;
      JBLine.Line := OrderLine.Line;
      JBLine.Supplier:= PurchaseOrder.Supplier;
      JBLine.BranchNo := PurchaseOrder.BranchNo;
      JBLine.JBLineDescr := OrderLine.CustomersDesc;
      JBLine.JBQuantity := Trunc(OrderLine.Quantity);
      with JobBag.Datamodule do
      begin
        JBLine.JBLineCost := CalculatePrice(OrderLine.OrderUnit,
          OrderLine.Quantity, OrderLine.OrderPrice)+OrderLine.ExtraCharges.Total;
        JBLine.JBLineSell := CalculatePrice(OrderLine.SellUnit,
          OrderLine.Quantity, OrderLine.SellingPrice)+OrderLine.ExtraCharges.TotalSell;
        JBLine.JBLineReseller := CalculatePrice(OrderLine.SellUnit,
          OrderLine.Quantity, OrderLine.SellingPrice)+OrderLine.ExtraCharges.TotalSell;
      end;
      JBLine.JBLineInvoiced := 'N';
      if OrderLine.POLineStatus >= 30 then      {Fully invoiced}
        begin
          JBLine.JBLineInvoiced := 'Y';
          JBLine.JBLineStatus := OrderLine.POLineStatus;
        end
      else if OrderLine.POLineStatus >= 25 then   {Part Invoiced}
        begin
          JBLine.JBLineInvoiced := 'P';
          JBLine.JBLineStatus := OrderLine.POLineStatus;
        end
      else if OrderLine.POLineStatus >= 21 then     {Fully or part delivered}
        JBLine.JBLineStatus := OrderLine.POLineStatus
      else
        JBLine.JBLineStatus := 12;     {In production}

      JBLine.VATCode := OrderLine.VATCode;

      JBLine.JBLineStatusText := JobBag.DataModule.GetPOStatus(PurchaseOrder.PONumber,OrderLine.Line,
                                            JobBag.dbKey, JBLine.JBLine, JBLine.JBLineInvoiced);
      JBLine.SupplierName := PurchaseOrder.SupplierName;
      JBLine.Sequence := JBLine.Parent.Lines.count + 1;

      JBLine.ClearedFundsReq := JobBag.DataModule.GetPOClearedFunds(JBLine.PurchaseOrder, JBLine.Line);
      JBLine.ClearedFundsRec := JobBag.DataModule.GetInvClearedFunds(JBLine.PurchaseOrder, JBLine.Line);
      JBLine.NeedsAuthorising := JobBag.DataModule.GetPOAuthorised(JBLine.PurchaseOrder);

      JobBag.Lines.Add(JBLine);
//      JobBag.SaveToDB(false);
    finally
      PurchaseOrder.Free;
    end;
  finally
    PBPODM.Free;
  end;
end;

procedure TPBMaintJobBagFrm.FormCreate(Sender: TObject);
begin
  rTotalPI := 0;
  rTotalSI := 0;
  bInvoiceChange := false;
  bNewPOAdded := false;

  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  lblJobRevenue.Visible := dmBroker.UseRevenueCentres;
  dblkpJobRevenue.Visible := dmBroker.UseRevenueCentres;

  btnExtras.Visible := dmBroker.UseProduction;
  btnAdd.Visible := not btnExtras.Visible;
//  pgDetails.Pages[1].tabVisible := false;
//  pgDetails.Pages[2].tabVisible := false;
  // Only display these tabs if using production
  pgDetails.Pages[2].TabVisible := dmBroker.UseProduction;
  pgDetails.Pages[3].TabVisible := pgDetails.Pages[2].TabVisible;
  pgDetails.Pages[4].TabVisible := pgDetails.Pages[2].TabVisible;
  pgDetails.Pages[7].TabVisible := pgDetails.Pages[2].TabVisible;
  pgDetails.Pages[9].TabVisible := pgDetails.Pages[2].TabVisible;

  // Only display stock request if using stock
  pgDetails.Pages[1].TabVisible := frmPBMainMenu.UseStockSystem;
  pgDetails.Pages[8].TabVisible := dmBroker.UseNonConformance;

  {Not used yet so don't display}
  pgDetails.Pages[2].TabVisible := false;

  {Show pack pricing option is using Pack Prices}
  pnlPackPrice.Visible := dmBroker.UsePackPricing;

  pgDetails.ActivePage := tsOrders;
  SetLineHeaders;

  lblAccountteam.Visible := dmBroker.UseAccountManagers;
  edtAccountTeam.Visible := lblAccountTeam.Visible;

  if lblAccountteam.Visible then
    pnlTop.Height := 66
  else
    pnlTop.Height := 40;

  pnlSubReps.Visible := dmBroker.UseSubReps;

  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintJobBagFrm.SetJBButtons(LineNo: integer);
begin
  btnChange.Enabled := (JobBag.Lines.count > 0) and (Mode <> jbAdd) and (Mode <> jbConvert);
  btnDelete.Enabled := (JobBag.Lines.count > 0) and (Mode <> jbAdd) and (Mode <> jbConvert);
  btnAddPO.enabled := (Mode <> jbAdd) and (Mode <> jbConvert);
  btnNew.enabled := (Mode <> jbAdd) and (Mode <> jbConvert) and bTempCanUpd;
  btnAdd.enabled := (Mode <> jbAdd) and (Mode <> jbConvert);
  btnProduction.Enabled := (Mode <> jbAdd) and (Mode <> jbConvert);
  btnExtras.Enabled := (Mode <> jbAdd) and (Mode <> jbConvert);
  btnNotes.Enabled := (Mode <> jbAdd) and (Mode <> jbConvert);

  pgDetails.Pages[4].TabVisible := (Mode <> jbAdd) and (Mode <> jbConvert);  {Document tab}

  if (JobBag.Lines[LineNo].JBLineType = 'S') and (Mode <> jbAdd) and (Mode <> jbConvert) and (Mode <> jbView) then
    sgLines.PopupMenu := pmnSOrders
  else
  if (JobBag.Lines[LineNo].JBLineType = 'P') and (Mode <> jbAdd) and (Mode <> jbConvert) and (Mode <> jbView) then
    sgLines.PopupMenu := pmnPOrders
  else
    sgLines.PopupMenu := pmnFunctions;

  if Mode = jbView then
    sgLines.PopupMenu := nil;

  Application.ProcessMessages;
end;

procedure TPBMaintJobBagFrm.CallMaintForm(aMode: TJBLMode);
var
  inx : integer;
  irow: integer;
  JobBagLine : TJobBagLIne;
  PBMaintJobBagRCFrm: TPBMaintJobBagRCFrm;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 1);
  irow := inx;

  if aMode = jblAdd then
    JobBagLine := TJobBagLine.Create(JobBag)
  else
    begin
      inx := JobBag.Lines.IndexOfSequence(inx);
      JobBagLine := JobBag.Lines[inx];

      if aMode = jblChange then
        begin
          if (JobBagLine.JBLineInvoiced = 'P') or
             (JobBagLine.JBLineInvoiced = 'Y') then
            begin
                if MessageDlg('This Job bag line has been invoiced, you cannot change the quantity or values ' +
                  ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                  Exit;
                aMode := jblRestrict;
            end
          else
            begin
              if JobBagLine.JBLinePurchInvd then
                begin
                  if MessageDlg('A Supplier invoice has been entered for this item ' +
                    ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                    Exit;
                end;
            end;
        end;
      if aMode = jblDelete then
        begin
          if (JobBagLine.JBLineType = 'P') and
             (not dmBroker.OperatorCanDeletePOs(frmPBMainMenu.iOperator)) then
            begin
              messagedlg('Cannot delete, you do not have the permissions to delete orders from job bags, contact your supervisor.', mtInformation, [mbOk], 0);
              exit;
            end;

          if (JobBagLine.JBLineInvoiced = 'P') or
             (JobBagLine.JBLineInvoiced = 'Y') then
            begin
              messagedlg('Cannot delete, this item has been invoiced.', mtInformation, [mbOk], 0);
              exit;
            end;
          if JobBagLine.JBLinePurchInvd then
            begin
              messagedlg('Cannot delete, a Supplier Invoice has been entered for this item.', mtInformation, [mbOk], 0);
              exit;
            end;
        end;
    end;
  PBMaintJobBagRCFrm := TPBMaintJobBagRCFrm.Create(Self);
  try
    PBMaintJobBagRCFrm.JobBagLine := JobBagLine;

    PBMaintJobBagRCFrm.Mode := aMode;
    PBMaintJobBagRCFrm.ShowModal;
    if (aMode = jblAdd) and (PBMaintJobBagRCFrm.ModalResult <> mrOK) then
      JobBagLine.Free;
    if (PBMaintJobBagRCFrm.ModalResult = mrOK) then
      begin
        if (aMode = jblDelete) and (not PBMaintJobBagRCFrm.MakeInactive) then
          ReNumberLines(irow);
        if Mode <> jbView then
          begin
            UpdateInternalCost;
            ShowLineDetails;
            ShowTotals;
          end;
        if aMode = jblAdd then
          begin
            irow := JobBag.Lines.count;
            if irow <= 0 then irow := 1;
          end
        else
        if (aMode = jblDelete) and (not PBMaintJobBagRCFrm.MakeInactive) then
          begin
            irow := irow-1;
            if irow <= 0 then irow := 1;
          end;
        sgLines.row := irow;
      end;
  finally
    PBMaintJobBagRCFrm.Free;
  end;
end;

procedure TPBMaintJobBagFrm.CallMaintDeliveries(aMode: TJBDelivMode);
var
  inx, irow : integer;
  JobBagDelivery: TJobBagDelivery;
  PBMaintJobBagDeliveryFrm: TPBMaintJobBagDeliveryFrm;
begin
  inx := StrToIntDef(sgDeliveries.cells[0,sgDeliveries.row], 1);
  irow := inx;
  
  try
    PBMaintJobBagDeliveryFrm := TPBMaintJobBagDeliveryFrm.Create(Self);
    try
      if aMode = jbDelivAdd then
        begin
          JobBagDelivery := TJobBagDelivery.Create(JobBag);
          PBMaintJobBagDeliveryFrm.FCustomer := JobBag.customer;
          PBMaintJobBagDeliveryFrm.FCustomerBranch := JobBag.Branch;
        end
      else
      begin
        if JobBag.Deliveries.Count > 0 then
        begin
          inx := JobBag.Deliveries.IndexOf(inx);
          JobBagDelivery := JobBag.Deliveries[inx];
        end;
      end;

      PBMaintJobBagDeliveryFrm.JobBagDelivery := JobBagDelivery;
      PBMaintJobBagDeliveryFrm.Mode := aMode;
      PBMaintJobBagDeliveryFrm.ShowModal;
      if ((aMode = jbDelivAdd)) and (PBMaintJobBagDeliveryFrm.ModalResult <> mrOK) then
      if Assigned(JobBagDelivery) then
        JobBagDelivery.Free;
      if (PBMaintJobBagDeliveryFrm.ModalResult = mrOK) then
        begin
          if Mode <> jbView then
            begin
              ShowDeliveries;
            end;

          if (aMode = jbDelivAdd) then
            begin
              irow := JobBag.Deliveries.count;
              if irow <= 0 then irow := 1;
            end ;
          sgDeliveries.row := irow;
        end;
    finally
      PBMaintJobBagDeliveryFrm.Free;
    end;
  finally
  end;
  CheckOK(self);

end;

procedure TPBMaintJobBagFrm.CallMaintExtrasForm(aMode: TJBLMode);
var
  inx : integer;
  JobBagLine : TJobBagLIne;
  PBMaintJobBagExtrasFrm: TPBMaintJobBagExtrasFrm;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);
//  dbgLines.DataSource.Dataset.Close;

//  inx := sgLines.row;
  try
    PBMaintJobBagExtrasFrm := TPBMaintJobBagExtrasFrm.Create(Self);
    try
      if aMode = jblAdd then
        JobBagLine := TJobBagLine.Create(JobBag)
      else
      begin
        inx := JobBag.Lines.IndexOf(inx);
        JobBagLine := JobBag.Lines[inx];
        if aMode = jblChange then
          begin
            if (JobBagLine.JBLineInvoiced = 'P') or
               (JobBagLine.JBLineInvoiced = 'Y') then
              begin
                if MessageDlg('Job bag item has been invoiced ' +
                  ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                  Exit;
//                aMode := jbView;
              end
              else
              begin
                if JobBagLine.JBLinePurchInvd then
                begin
                  if MessageDlg('A Supplier invoice has been entered for this item ' +
                    ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                   Exit;
                   // aMode := jbView;
                end;
              end;
          end;
         if aMode = jblDelete then
          begin
            if (JobBagLine.JBLineInvoiced = 'P') or
               (JobBagLine.JBLineInvoiced = 'Y') then
              begin
                messagedlg('Cannot delete, this item has been invoiced.', mtInformation, [mbOk], 0);
                exit;
              end;
            if JobBagLine.JBLinePurchInvd then
              begin
                messagedlg('Cannot delete, a Supplier Invoice has been entered for this item.', mtInformation, [mbOk], 0);
                exit;
              end;
          end;
      end;
      JobBagLine.Supplier := dmBroker.GetCompanySupplier;
      JobBagLine.BranchNo := dmBroker.GetCompanySupplierBranch;
      JobBagLine.SupplierName := jobbag.DataModule.GetSupplierName(JobBagLine.Supplier);
      JobBagLine.JBLineStatusText := jobbag.DataModule.GetSundryStatus(JobBag.DbKey,JobBagLine.JBLine,JobBagLine.JBLineInvoiced);

      PBMaintJobBagExtrasFrm.JobBagLine := JobBagLine;
      if aMode = jblAdd then
        PBMaintJobBagExtrasFrm.WONumber := JobBag.DataModule.GetWorksOrderNumber(JobBag.DbKey)
      else
        PBMaintJobBagExtrasFrm.WONumber := JobBagLine.WONumber;
      PBMaintJobBagExtrasFrm.Mode := aMode;
      PBMaintJobBagExtrasFrm.ShowModal;
      if (aMode = jblAdd) and (PBMaintJobBagExtrasFrm.ModalResult <> mrOK) then
        JobBagLine.Free;
    finally
      PBMaintJobBagExtrasFrm.Free;
    end;
  finally
    if Mode <> jbView then
      begin
        UpdateInternalCost;
        ShowLineDetails;
        ShowTotals;
      end;

    if aMode = jblAdd then
      begin
        inx := pred(JobBag.Lines.count);
        if inx < 0 then inx := 0;
      end ;
    sgLines.row := inx+1;
  end;
  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.CallMaintLines(aMode: TJBLMode);
var
  inx : integer;
  irow: integer;
  JobBagLine, JobBagLineCopy : TJobBagLine;
  PBMaintJobBagLinesFrm: TPBMaintJobBagLinesFrm;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 1);
  irow := inx;
//  inx := sgLines.row;
  try
    PBMaintJobBagLinesFrm := TPBMaintJobBagLinesFrm.Create(Self);
    try
      if aMode = jblAdd then
        begin
          JobBagLine := TJobBagLine.Create(JobBag);
          if JobBag.Lines.count > 0 then
            begin
              JobBagLine.ProductType := JobBag.Lines[pred(JobBag.Lines.count)].ProductType;
            end
        end
      else
      if aMode = jblCopy then
        begin
          JobBagLine := TJobBagLine.Create(JobBag);
          inx := JobBag.Lines.IndexOfSequence(inx);
          JobBagLineCopy := JobBag.Lines[inx];

          if JobBagLineCopy.InternalCostLine then
            begin
              MessageDlg('This is an internal cost line and cannot be copied. A job bag can have only one internal cost line.', mtError,
                [mbOk], 0);
              exit;
            end;

          JobBagLine.JBLineDescr := JobBagLineCopy.JBLineDescr;
          JobBagLine.JBQuantity := JobBagLineCopy.JBQuantity;
          JobBagLine.SellPrice := JobBagLineCopy.SellPrice;
          JobBagLine.PriceUnit := JobBagLineCopy.PriceUnit;
          JobBagLine.JBLineCost := JobBagLineCopy.JBLineCost;
          JobBagLine.JBLineSell := JobBagLineCopy.JBLineSell;
          JobBagLine.JBLineReseller := JobBagLineCopy.JBLineReseller;
          JobBagLine.VatCode := JobBagLineCopy.VatCode;
          JobBagLine.ProductType := JobBagLineCopy.ProductType;
        end
      else
      begin
        inx := JobBag.Lines.IndexOfSequence(inx);
        JobBagLine := JobBag.Lines[inx];

        if (aMode = jblChange) then
          begin
            if JobBagLine.InternalCostLine and (not dmBroker.OperatorCanDeleteQuoteCosts(frmPBMainMenu.iOperator)) then
              begin
                MessageDlg('This line is an internal cost and cannot be changed.', mtInformation,
                  [mbOk], 0);
                exit;
              end
            else
            if (aMode = jblDelete) and (not dmBroker.OperatorCanDeleteQuoteCosts(frmPBMainMenu.iOperator)) then
              begin
                if JobBagLine.InternalCostLine then
                  begin
                    MessageDlg('This line is an internal cost and cannot be changed.', mtInformation,
                      [mbOk], 0);
                    exit;
                  end
              end;
          end;

        if aMode = jblChange then
          begin
            if (JobBagLine.JBLineInvoiced = 'P') or
               (JobBagLine.JBLineInvoiced = 'Y') then
              begin
                if MessageDlg('This Job bag line has been invoiced, you cannot change the quantity or values ' +
                  ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                  Exit;
                aMode := jblRestrict;
              end
              else
              begin
                if JobBagLine.JBLinePurchInvd then
                begin
                  if MessageDlg('A Supplier invoice has been entered for this item ' +
                    ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                   Exit;
                   // aMode := jbView;
                end;
              end;
          end
        else
        if aMode = jblDelete then
          begin
            if (JobBagLine.JBLineInvoiced = 'P') or
               (JobBagLine.JBLineInvoiced = 'Y') then
              begin
                messagedlg('Cannot delete, this item has been invoiced.', mtInformation, [mbOk], 0);
                exit;
              end;
            if JobBagLine.JBLinePurchInvd then
              begin
                messagedlg('Cannot delete, a Supplier Invoice has been entered for this item.', mtInformation, [mbOk], 0);
                exit;
              end;
          end;
      end;
      JobBagLine.Supplier := dmBroker.GetCompanySupplier;
      JobBagLine.BranchNo := dmBroker.GetCompanySupplierBranch;
      JobBagLine.SupplierName := jobbag.DataModule.GetSupplierName(JobBagLine.Supplier);
      JobBagLine.JBLineStatusText := jobbag.DataModule.GetSundryStatus(JobBag.DbKey,JobBagLine.JBLine,JobBagLine.JBLineInvoiced);

      PBMaintJobBagLinesFrm.JobBagLine := JobBagLine;
      PBMaintJobBagLinesFrm.WONumber := JobBagLine.WONumber;
      PBMaintJobBagLinesFrm.WorksOrderNumber := JobBag.DataModule.GetWONumber(JobBagLine.WONumber);
      PBMaintJobBagLinesFrm.Mode := aMode;
      PBMaintJobBagLinesFrm.InternalCostLine := JobBagLine.InternalCostLine;
      PBMaintJobBagLinesFrm.ShowModal;
      if ((aMode = jblAdd) or (aMode = jblCopy)) and (PBMaintJobBagLinesFrm.ModalResult <> mrOK) then
        JobBagLine.Free;
      if (PBMaintJobBagLinesFrm.ModalResult = mrOK) then
        begin
          if Mode <> jbView then
            begin
              UpDateInternalCost;
              ShowLineDetails;
              ShowTotals;
            end;

          if (aMode = jblAdd) or (aMode = jblCopy) then
            begin
              irow := JobBag.Lines.count;
              if irow <= 0 then irow := 1;
            end ;
          sgLines.row := irow;
        end;
    finally
      PBMaintJobBagLinesFrm.Free;
    end;
  finally
  end;
  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.UpdateInternalCost;
var
  iCount: integer;
begin
  for icount := 0 to pred(jobbag.lines.count) do
    begin
      if JobBag.Lines[iCount].InternalCostLine then
        begin
          JobBag.Lines[iCount].JBLineCost := (JobBag.TotalNonInternalCost * (JobBag.Lines[iCount].InternalCostMarkupPercentage/100));
          break;
        end;
    end;
end;

procedure TPBMaintJobBagFrm.CallMaintScreen(const aMode: TJBLMode);
var
  bCanChangeInvoicedOrders: boolean;
  tmpAccCtrlMenu: integer;
  OrdLine: PBPOObjects.TOrderLine;
  inx : integer;
  irow: integer;
  bTempOK: Boolean;
  JobBagLine : TJobBagLIne;
  PONumber: real;
  stempFuncMode: string;
begin
  {Determine if the Operator can change sales values after invoicing}
   bCanChangeInvoicedOrders := dmBroker.OperatorCanChangeInvoicedOrders(frmPBMainMenu.iOperator);

  {Call NEW Purchase Order Maintenance}
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);
  irow := inx;
//  inx := sgLines.row;

  if (aMode = jblAdd) then
    begin
      JobBagLine := TJobBagLine.Create(JobBag);
    end
  else
  if (aMode = jblrepeat) then
    begin
      JobBagLine := TJobBagLine.Create(JobBag);

      PONumber := rRepeatPO;
    end
  else
    begin
      inx := JobBag.Lines.IndexOfSequence(inx);
      JobBagLine := JobBag.Lines[inx];

      PONumber := JobBagLine.PurchaseOrder;
    end;

  tmpAccCtrlMenu := dmBroker.iAccCtrlMenu;
  {Check whether the Purchase Order has been included in a invoice Period End}
  if dtmdlJBOrders.PeriodEndRun('PO',PONumber,1) and (aMode = jblChange) then
  begin
    if MessageDlg('This order has been included in a Period end, the cost and sales values cannot be modified' +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
    sTempFuncMode := 'T';
  end
  else if ((FPOStatus = 25) or (FPOStatus = 30)) and (aMode = jblChange) and (not bCanChangeInvoicedOrders) then
  begin
    if MessageDlg('This order has been invoiced, the sales values cannot be modified' +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
    sTempFuncMode := 'I';
  end
  else
  if (FPOStatus >= 10) and (aMode = jblChange) and
          (JobBag.DataModule.GetPOAuthorisedBy(PONumber) <> 0) then
  begin
    if (JobBag.DataModule.GetPOAuthorisedBy(PONumber) <> frmPBMainMenu.iOperator) then
      begin
        if MessageDlg('This order has been authorised, you cannot change the cost and sales values' +
          ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
          Exit;
      end;
  end
  else if (FPOStatus > 10) and (aMode = jblChange) then
    begin
      if MessageDlg('This order has been ' + FPOStatusDescr + ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
    end;

  try
    PBMaintPOrdfrm := TPBMaintPOrdfrm.Create(Self);
    try
      if (aMode = jblAdd) or (aMode = jblRepeat) then
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

      if aMode = jblChange then
        PBMaintPOrdfrm.FuncMode := 'C'
      else
      if aMode = jblView then
        begin
          PBMaintPOrdfrm.FuncMode := 'C';
          if bTempView then
            dmBroker.iAccCtrlMenu := 3
          else
          if bTempNotes then
            dmBroker.iAccCtrlMenu := 2;
        end
      else
      if aMode = jblRepeat then
        PBMaintPOrdfrm.FuncMode := 'M'
      else
      if aMode = jblAdd then
        PBMaintPOrdfrm.FuncMode := 'A';

      if stempFuncMode = 'T' then
        PBMaintPOrdFrm.FuncMode := 'T'
      else
      if stempFuncMode = 'I' then
        PBMaintPOrdFrm.FuncMode := 'I';

      if aMode = jblAdd then
        PBMaintPOrdfrm.PurchaseOrderNo := 0
      else
        PBMaintPOrdfrm.PurchaseOrderNo := PONumber;

      PurchaseOrder.POHeadStatus := FPOStatus;
      PurchaseOrder.BranchNo := JobBag.Branch;

      PBMaintPOrdfrm.SetupDetails(Self);

      PBMaintPOrdfrm.JobBagNo := JobBag.dbKey;
      PBMaintPOrdfrm.JobBagLine := JobBag.Lines.MaxLineNo + 1;

      if aMode = jblAdd then
        begin
          PBMaintPOrdfrm.DateEdit.Text := pbdatestr(date);

          PBMaintPOrdFrm.edtAccountManager.Text := '';
          PBMaintPOrdFrm.edtAccountTeam.Text := '';

          OrdLine := AddNewOrderLine(1);
//          CreateDelivery(JobBag.Customer,OrdLine);
        end;
      PBMaintPOrdfrm.bComeFromJobBag := true;

      if aMode = jblRepeat then
        begin
          PurchaseOrder.OrderLines[0].CustOrderNo := JobBag.CustOrderNo;
          PurchaseOrder.OrderLines[0].Quantity := JobBag.Quantity;
        end;

      PBMaintPOrdfrm.ShowModal;
      bTempOK := PBMaintPOrdfrm.bOK;

      if bTempOK then
        begin
          JobBagLine.Supplier:= PurchaseOrder.Supplier;
          JobBagLine.BranchNo := PurchaseOrder.BranchNo;
          JobBagLine.JBLineDescr := PBMaintPOrdfrm.selectedLine.CustomersDesc;
          JobBagLine.JBQuantity := Trunc(PBMaintPOrdfrm.selectedLine.Quantity);
          with JobBag.Datamodule do
            begin
              JobBagLine.JBLineCost := CalculatePrice(PBMaintPOrdfrm.selectedLine.OrderUnit,
                PBMaintPOrdfrm.selectedLine.Quantity, PBMaintPOrdfrm.selectedLine.OrderPrice)
                + PBMaintPOrdfrm.selectedLine.extracharges.Total;
              JobBagLine.JBLineSell := CalculatePrice(PBMaintPOrdfrm.selectedLine.SellUnit,
                PBMaintPOrdfrm.selectedLine.Quantity, PBMaintPOrdfrm.selectedLine.SellingPrice)
                + PBMaintPOrdfrm.selectedLine.extracharges.TotalSell;
              JobBagLine.JBLineReseller := CalculatePrice(PBMaintPOrdfrm.selectedLine.SellUnit,
                PBMaintPOrdfrm.selectedLine.Quantity, PBMaintPOrdfrm.selectedLine.SellingPrice)
                + PBMaintPOrdfrm.selectedLine.extracharges.TotalSell;
            end;
          if PBMaintPOrdFrm.selectedLine.LineStatus = 25 then
            JobBagLine.JBLineInvoiced := 'P'
          else
          if PBMaintPOrdFrm.selectedLine.LineStatus >= 30 then
            JobBagLine.JBLineInvoiced := 'Y'
          else
            JobBagLine.JBLineInvoiced := 'N';

          JobBagLine.VATCode := PBMaintPOrdfrm.selectedLine.VATCode;

          JobBagLine.JBLineStatusText := JobBag.DataModule.GetPOStatus(PurchaseOrder.PONumber,PBMaintPOrdFrm.SelectedLine.Line,
                                            JobBag.dbKey, JobBagLine.JBLine, JobBagLine.JBLineInvoiced);
          JobBagLine.SupplierName := PBMaintPOrdFrm.SupplierEdit.text;

          if (aMode = jblAdd) or (aMode = jblRepeat) then
            begin
            JobBagLine.CurrencyCode := PurchaseOrder.CurrencyCode;
//            JobBagLine.JBLine := JobBag.Lines.Count + 1;
            JobBagLine.JBLine := JobBag.Lines.MaxLineNo + 1;
            JobBagLine.JBLineType := 'P';
            JobBagLine.JBLineMode := 'C';
            JobBagLine.Sequence := JobBag.Lines.count + 1;
            JobBagLine.PurchaseOrder := PurchaseOrder.PONumber;
            JobBagLine.Line := PBMaintPOrdfrm.selectedLine.Line;
            JobBagLine.Parent.Lines.Add(JobBagLine);
            bNewPOAdded := true;
            end
          else
          if aMode = jblChange then
            begin
            if PBMaintPordFrm.UpdJobBagHead then
              UpdJobBagHead(Self);
//            JobBagLine.Parent.SaveToDB(false);
            end;

          JobBagLine.ClearedFundsReq := JobBag.DataModule.GetPOClearedFunds(JobBagLine.PurchaseOrder, JobBagLine.Line);
          JobBagLine.ClearedFundsRec := JobBag.DataModule.GetInvClearedFunds(JobBagLine.PurchaseOrder, JobBagLine.Line);
          JobBagLine.NeedsAuthorising := JobBag.DataModule.GetPOAuthorised(JobBagLine.PurchaseOrder);

          if Mode <> jbView then
            begin
              UpDateInternalCost;
              ShowLineDetails;
              ShowTotals;
            end;

          if (aMode = jblAdd) or (aMode = jblRepeat) then
            begin
              irow := JobBag.Lines.count;
              if irow <= 0 then irow := 1;
            end ;
          sgLines.row := irow;
        end;
    finally
      PBMaintPOrdfrm.Free;
    end;
  finally
    dmBroker.iAccCtrlMenu := tmpAccCtrlMenu;
  end;
end;

procedure TPBMaintJobBagFrm.SelectCode(tempCode: real);
begin
  with dtmdlJBOrders.qrySelectedPO do
    begin
      Close;
      ParamByName('Purchase_Order').asfloat := tempCode;
      Open;
      First;
    end;

  FPOStatus := dtmdlJBOrders.qrySelectedPO.FieldByName('Purch_Ord_Head_Status').AsInteger;
  FPOStatusDescr := dtmdlJBOrders.qrySelectedPO.FieldByName('Status_Descr').AsString;
end;

procedure TPBMaintJobBagFrm.SelectSalesOrder(tempCode: integer);
begin
  with dtmdlJBOrders.qrySelectedSO do
    begin
      Close;
      ParamByName('Sales_Order').asfloat := tempCode;
      Open;
      First;
    end;

  FSOStatus := dtmdlJBOrders.qrySelectedSO.FieldByName('Sales_Order_Head_Status').AsInteger;
  FSOStatusDescr := dtmdlJBOrders.qrySelectedSO.FieldByName('Status_Descr').AsString;
  FSODateOrdered := dtmdlJBOrders.qrySelectedSO.FieldByName('Date_Ordered').AsDateTime;
  FSODateRequired := dtmdlJBOrders.qrySelectedSO.FieldByName('Date_Required').AsDateTime;
end;

procedure TPBMaintJobBagFrm.SelectWorksOrder(tempCode: integer);
begin
  with dtmdlJBWOrders.qrySelectedWO do
    begin
      Close;
      ParamByName('Works_Order').asfloat := tempCode;
      Open;
      First;
    end;

  FWOStatus := dtmdlJBWOrders.qrySelectedWO.FieldByName('Works_Order_Status').AsInteger;
  FWOStatusDescr := dtmdlJBWOrders.qrySelectedWO.FieldByName('Status_Descr').AsString;
end;

procedure TPBMaintJobBagFrm.btnAddClick(Sender: TObject);
begin
  CallMaintForm(jblAdd);
end;

procedure TPBMaintJobBagFrm.btnChangeClick(Sender: TObject);
var
  inx: integer;
  JobBagLine: TJobBagLine;
begin
  if JobBag.Lines.Count > 0 then
  begin
    inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);
    inx := jobbag.Lines.IndexOfSequence(inx);
    JobBagLine := JobBag.Lines[inx];
  end;

  if JobBagLine.JBLineType = 'P' then
    begin
      if bComeFromOrder then exit;
      dtmdlJBOrders := TdtmdlOrders.create(self);
      try
        SelectCode(JobBagLine.PurchaseOrder);
        if btempCanUpd then
          CallMaintScreen(jblChange)
        else
        if bTempView or bTempNotes or (Mode = jbView) then
          CallMaintScreen(jblView)
        else
          begin
            messagedlg('You do not have access to the Purchase Ordering module.', mtError, [mbOk], 0);
            exit;
          end;
      finally
        dtmdlJBOrders.free;
      end;
    end
  else
  if JobBagLine.JBLineType = 'S' then
    begin
      if bComeFromOrder then exit;
      dtmdlJBOrders := TdtmdlOrders.create(self);
      try
        SelectSalesOrder(JobBagLine.SONumber);
        if trim(btnChange.caption) = '&View' then
          CallMaintStockScreen('S')
        else
          CallMaintStockScreen('C');
      finally
        dtmdlJBOrders.free;
      end;
    end
  else
  if JobBagLine.JBLineType = 'W' then
    begin
      if bComeFromOrder then exit;
      dtmdlJBWOrders := TdtmdlWOrders.create(self);
      try
        SelectWorksOrder(JobBagLine.WONumber);
        CallMaintWOrderScreen(jbChange);
      finally
        dtmdlJBWOrders.free;
      end;
    end
  else
  if JobBagLine.JBLineType = 'A' then
    begin
      if trim(btnChange.caption) = '&View' then
        CallMaintLines(jblView)
      else
        CallMaintLines(jblChange);
    end
  else
    CallMaintForm(jblChange)
end;

procedure TPBMaintJobBagFrm.btnDeleteClick(Sender: TObject);
begin
  CallMaintForm(jblDelete);
end;

procedure TPBMaintJobBagFrm.SetMode(const Value: TJBMode);
begin
  FMode := Value;
end;

procedure TPBMaintJobBagFrm.btnCustomerClick(Sender: TObject);
var
  custOnStop, blockOnStopCust: boolean;
  custStatus: string;
  OperatorCannotAdd: boolean;
  bHasGDPRBeenSigned: boolean;
  Result, bOverride: boolean;
  rMarkup: real;
  iCount: integer;
begin
  { We must use the global PBLUCustFrm variable as it is assumed to
    exist by other units called by PBLUCustFrm. }
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.SelCode := JobBag.Customer;
    PBLUCustFrm.SelBranch := JobBag.Branch;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
      begin
      {Check that this operator can add jobs for this customer - check Operator_Invoice_Location}
      OperatorCannotAdd := dmBroker.CheckOperatorCustomer(PBLUCustFrm.SelCode, frmPBMainMenu.iOperator);
      if OperatorCannotAdd then
        begin
          MessageDlg('You do not have permission to create jobs for this customer!', mtError,[mbOk], 0);
          exit;
        end;

      CostCentreLevel := PBLUCustFrm.SelCCLevel;
      pnlCostCentre.visible := CostCentreLevel <> '';

      custStatus := dmBroker.GetCustomerStatus(PBLUCustFrm.SelCode);
      if custStatus <> 'B' then
      begin
        //either the customer is not on stop or on stop customers are not blocked
        if custStatus = 'S' then
          MessageDlg(cOnStop, mtWarning,[mbOk], 0)
        else
        if custStatus = 'O' then
          MessageDlg(cOverdue, mtWarning,[mbOk], 0);

        if ConfirmChange(PBLUCustFrm.SelCode, PBLUCustFrm.SelBranch) then
        begin
          JobBag.AcquiredCustomer := PBLUCustFrm.AcquiredCustomer;
          if JobBag.AcquiredCustomer then
            begin
              pnlEndUser.Visible := true;
              sgLines.ColWidths[6] := 80;
            end
          else
            begin
              pnlEndUser.Visible := false;
              edtEndUser.text := '';
              sgLines.ColWidths[6] := -1;
            end;
          pnlReseller.Visible := pnlEndUser.Visible;
          imgChkbxInvoiceAll.left := cellleft(sgLines,8);

          JobBag.Customer := PBLUCustFrm.SelCode;
          JobBag.Branch := PBLUCustFrm.SelBranch;
          edtCustomer.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
          JobBag.CustomerName := PBLUCustFrm.SelName;
          JobBag.BranchName := PBLUCustFrm.SelBranchName;

          JobBag.Rep := JobBag.DataModule.GetCustomerRep(JobBag.customer,JobBag.Branch);
          JobBag.SubRep := JobBag.DataModule.GetCustomerSubRep(JobBag.customer,JobBag.Branch);
          edtRep.Text := JobBag.DataModule.GetRepName(Jobbag.Rep);
          edtSubRep.Text := JobBag.DataModule.GetRepName(Jobbag.SubRep);

          JobBag.ContactNo := 0;

          if dblkpCustomerContact.keyvalue = null then
            GetCustomerContacts(0)
          else
            begin
              GetCustomerContacts(dblkpCustomerContact.keyvalue);
              dblkpCustomerContactClick(dblkpCustomerContact);
            end;

          {Check if this customer overrides the production cost markup}
          rMarkup := JobBag.GetCompanyMarkup;
          Result := JobBag.GetCustomerMarkup(JobBag.Customer,bOverride,rMarkup);
          for icount := 0 to pred(JobBag.lines.count) do
            begin
              if JobBag.lines[iCount].InternalCostLine then
                begin
                  JobBag.lines[iCount].InternalCostMarkupPercentage := rMarkup;
                  JobBag.lines[iCount].JBLineCost := (JobBag.TotalNonInternalCost * (JobBag.lines[iCount].InternalCostMarkupPercentage/100));
                end;
              break;
            end;
          ShowLineDetails;
          ShowTotals;
        end;
      end
      else
      begin
        //customer is on stop and on stop customers are blocked so warn user and return
        MessageDlg('This Customer is currently On Stop.'+#10#13+'Orders cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      end;

      if dmBroker.UseGDPR then
        begin
          lblGDPRSignedStatement.visible := false;
          bHasGDPRBeenSigned := dmBroker.GetCustomerGDPRSigned(PBLUCustFrm.SelCode);
          if not bHasGDPRBeenSigned then
            begin
              MessageDlg('The GDPR Policy has not been signed by this customer!!!', mtWarning,[mbOk], 0);
              lblGDPRSignedStatement.visible := true;
            end;
        end;
    end;
  finally
    PBLUCustFrm.Free;
  end;
  CheckOK(Self);
end;

function TPBMaintJobBagFrm.ConfirmChange(const newCust,
  newBranch: integer): Boolean;
begin
  { If the user has changed customer and there are purchase orders in this
    job bag then we have to drop the purchase orders not for the
    newly selected customer/branch. }
  if ((newCust <> JobBag.Customer) or (newBranch <> JobBag.Branch))
    and (JobBag.Lines.POCount > 0) then
  begin
    if MessageDlg('If you change the customer and/or branch then all ' + #13 +
      'purchase orders currently in this job bag will be deleted' + #13 +
      'when you finally save the change.' + #13 +
      'If this is what you want then click OK to confirm otherwise ' + #13 +
      'click abort.', mtConfirmation, [mbOK, mbAbort], 0) = mrOK then
      Result := true
    else
      Result := false;
  end
  else
    Result := true;  { No actual change }
end;

procedure TPBMaintJobBagFrm.GetCustomerContacts(tempno: integer);
begin
  with JobBag.Datamodule.qryCustContact do
    begin
      close;
      parambyname('Customer').asinteger := JobBag.Customer;
      parambyname('Branch_no').asinteger := JobBag.Branch;
      open;

      if (recordcount = 1) then
        begin
         if tempno = 0 then
           dblkpCustomerContact.keyvalue := fieldbyname('Contact_no').asinteger
         else
           dblkpCustomerContact.keyvalue := tempno
        end
      else
        begin
          if tempno = 0 then
            dblkpCustomerContact.keyvalue := 0
          else
            dblkpCustomerContact.keyvalue := tempno
        end;

//      JobBag.ContactNo := dblkpCustomerContact.keyvalue;
    end;
end;

procedure TPBMaintJobBagFrm.GetCustomerReps(tempno: integer);
begin
end;

function TPBMaintJobBagFrm.GetFilesPath: string;
begin
  Result := sPath;
end;

procedure TPBMaintJobBagFrm.btnDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDate.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintJobBagFrm.btnOKClick(Sender: TObject);
var
  MyFileName, MyTo, MyFrom, MySubject, MyDate, MyBody: string;
  i: integer;
  icount: integer;
begin
  if Mode = jbDelete then
    begin
      if messagedlg('Are you sure you want to delete this job bag?', mtConfirmation, [mbYes, mbNo], 1) = mrYes then
        JobBag.DeleteFromDB
      else
        exit;
    end
  else
  begin
    if dmBroker.UseSAPIntegration and (dblkpPackFormat.Text = '') then
      begin
        messagedlg('Please specify the Pack Format and Enclosing Type', mtError,[mbOk], 0);
        dblkpPackFormat.setfocus;
        exit;
      end;

    if JobBag.AcquiredCustomer and (trim(edtEndUser.Text) = '') then
      begin
        if messagedlg('This job bag is for a reseller, do you want to enter the End User details?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            btnEndUserClick(self);
            exit;
          end;
      end;

    // Check that the dates are valid
    if pbdatestr(trim(edtStartDate.text)) > pbdatestr(trim(edtDateReq.text)) then
      begin
        messagedlg('The start date and date required are invalid! The start date cannot be later than the required date', mtError,[mbOk], 0);
        edtStartDate.setfocus;
        exit;
      end;

//  Check that all funds have been received where required
    if cmbOnHold.ItemIndex < 0 then
      begin
        for i := 0 to pred(Jobbag.lines.count) do
          begin
            if (JobBag.Lines[i].ClearedFundsReq) and (not JobBag.Lines[i].ClearedFundsRec) then
              begin
                messagedlg('Payment for the invoice associated with line ' + inttostr(JobBag.Lines[i].Sequence)
                      + ', has not been received, this job must go ON HOLD until the funds have been received',
                      mtInformation, [mbOk], 0);
//                chkbxOnHold.checked := true;
                cmbOnHold.ItemIndex := 1;
                break;
              end;
          end;
      end;

    if chkbxReadytoInvoice.checked then
      begin
        for i := 0 to pred(Jobbag.lines.count) do
          begin
            if (JobBag.Lines[i].JBQuantity = 0) and (JobBag.Lines[i].JBLineType <> 'S') then
            begin
              messagedlg('Cannot invoice this job bag, there are lines with zero quantity', mtInformation, [mbOk], 0);
              exit;
            end;
            {Check that there is something to invoice}
            if not JobBag.OKtoInvoice then
            begin
              messagedlg('Cannot invoice this job bag, there are no lines ready for invoicing.', mtInformation, [mbOk], 0);
              exit;
            end;
          end;
        {Check whether the account is active and whether an account code exists}
        if (JobBag.DataModule.GetCustomerInvoiceAccountCode(JobBag.Customer, JobBag.Branch)) <> true then
          begin
            messagedlg('Cannot invoice this job bag, the invoicing customer does not have an account code.',mterror,
                      [mbAbort], 0);
            exit;
          end;

        if (dmBroker.UseRevenueCentres) and (bInvoiceChange) and (dblkpJobRevenue.Text = '') then
          begin
            messagedlg('The job bag cannot be saved, a revenue centre must be selected.',mterror,
                      [mbAbort], 0);
            exit;
          end;

        if JobBag.ReconcileStock then
          begin
            if MessageDlg('Stock Requests used in this job have still to be reconciled, do you still want to continue saving?',
                mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              exit;
          end;

        if (JobBag.ReadyToInvoice = 'N') or (JobBag.ReadyToInvoice = '') then
          begin
            JobBag.InvoiceBy := frmPBMainMenu.iOperator;
            JobBag.InvoiceByDate := now;
          end;
        JobBag.ReadyToInvoice := 'Y'
      end
    else
      begin
        JobBag.InvoiceBy := 0;
        JobBag.InvoiceByDate := 0;
        JobBag.ReadyToInvoice := 'N';
      end;

(*    for icount := 0 to pred(JobBag.Documents.count) do
      begin
        // this is to get the date of the email
        if copy(Jobbag.Documents[icount].DocumentPath, length(Jobbag.Documents[icount].DocumentPath) - 3, 4) = '.msg' then
          begin
            try
              MyFileName := dmBroker.GetCompanyDocDirectory+Jobbag.Documents[icount].DocumentPath;
              ParseMessage(MyFileName, MyTo, MyFrom, MySubject, MyDate, MyBody);
              Jobbag.Documents[icount].DocumentDate := strtodate(MyDate);
            except
              // leave the date as it is
            end;
          end;
      end;
*)

    JobBag.Description := Trim(edtDescription.Text);
    JobBag.DescriptiveRef := Trim(edtDescriptiveRef.text);
    JobBag.CustomerName := Trim(edtCustomer.Text);
//    JobBag.BranchName := Trim(edtBranch.Text);
    JobBag.Date := PBDateStr(edtDate.Text);
    JobBag.GoodsRequired := PBDateStr(edtDateReq.Text);
    JobBag.StartDate := PBDateStr(edtStartDate.text);

    if chkbxInvoiceThisWeek.Checked then
      begin
        JobBag.InvoiceThisWeekDate := pbDateStr(lblInvoiceThisWeekDate.caption);
        if not JobBag.InvoiceThisWeek then
          JobBag.InvoiceThisWeekBy := frmPBMainMenu.iOperator;
        JobBag.InvoiceThisWeek := true;
      end
    else
      begin
        JobBag.InvoiceThisWeek := false;
        JobBag.InvoiceThisWeekDate := 0;
        JobBag.InvoiceThisWeekBy := 0;
      end;

    if chkbxProductionComplete.Checked then
      begin
        JobBag.ProductionDate := pbDateStr(edtDateComplete.Text);
        if not JobBag.ProductionComplete then
          JobBag.ProductionCompleteBy := frmPBMainMenu.iOperator;
        JobBag.ProductionComplete := true;
      end
    else
      begin
        JobBag.ProductionComplete := false;
        JobBag.ProductionDate := 0;
        JobBag.ProductionCompleteBy := 0;
      end;

    if chkbxFileCopies.Checked then
      begin
        JobBag.FileCopiesReceivedDate := pbDateStr(edtDateCopiesReceived.Text);
        if not JobBag.FileCopiesReceived then
          JobBag.FileCopiesReceivedBy := frmPBMainMenu.iOperator;
        JobBag.FileCopiesReceived := true;
      end
    else
      begin
        JobBag.FileCopiesReceived := false;
        JobBag.FileCopiesReceivedDate := 0;
        JobBag.FileCopiesReceivedBy := 0;
      end;

    JobBag.CustOrderNo := edtCustOrderNo.Text;
    JobBag.Quantity := StrToIntDef(memQuantity.text, 0);
    JobBag.Operator := frmPBMainMenu.iOperator;
    JobBag.ContactNo := dblkpCustomerContact.keyvalue;
//    JobBag.Rep := dblkpRep.keyvalue;

//  Check that all the works instrcutions are within the start and mailing dates of the Job Bag
    for icount := 0 to pred(JobBag.Works.count) do
      begin
        if (JobBag.GoodsRequired < JobBag.works[icount].MailDate) then
          begin
            messagedlg('The mailing dates for the works instructions ' +
                          ' are not within the mailing date for the job bag, please modify the relevant date/s', mtError,[mbOk], 0);
            pgDetails.ActivePageIndex := 3;
            exit;
          end;

      end;

    JobBag.CashSale := chkbxCashSale.Checked;
    
    if cmbOnHold.ItemIndex = 0 then
      JobBag.OnHold := 'Y'
    else
    if cmbOnHold.ItemIndex = 1 then
      JobBag.OnHold := 'P'
    else
      JobBag.OnHold := 'N';

      // Load new scedule
    if SchedMode = jbSchAdd then
      begin
        CreateSchedule;
      end;

    UpdateProcesses;

    if FOriginalCustomer <> 0 then
      begin
        if ((FOriginalCustomer <> JobBag.Customer) OR (FOriginalBranch <> JobBag.Branch)) AND (JobBag.Status >= 12) then
          DropPurchaseOrders;
      end;

    if (JobBag.Status < 10) and chkbxAuthorise.checked then
      JobBag.Status := 10;

    JobBag.SaveToDB(true);

    if Mode = jbConvert then
      begin
        MoveQuoteDocuments;
      end;
  end;

  bOK := true;
  if (Mode = jbAdd) or (Mode = jbRepeat) then
    begin
      {Write Add job bag to audit trail} ;
      PBAuditDataMod.WriteAudit(1200, JobBag.dbKey, 0, 0, 0, intToStr(JobBag.dbKey)) ;
      MessageDlg('The job bag number is : ' + intToStr(JobBag.dbKey), mtInformation, [mbOK], 0);

      Mode := jbChange;
      Factivated := false;
      FormActivate(self);
      exit;
    end
  else
    {Write UPDATE job bag to audit trail} ;
    PBAuditDataMod.WriteAudit(2200, JobBag.dbkey, 0, 0, 0, intToStr(JobBag.dbKey)) ;

  ModalResult := mrOK;
end;

procedure TPBMaintJobBagFrm.MoveQuoteDocuments;
var
  sSource, sDest: string;
  ListItem: TListItem;
  irow: integer;
begin

  sSource := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(JobBag.datamodule.QuoteNo) + '\' ;
  sDest :=  dmBroker.GetCompanyJobBagDirectory + '\' + inttostr(JobBag.DbKey) + '\';

  for irow := 0 to pred(lstvwDocuments.items.count) do
    begin
      ListItem := lstvwDocuments.items[irow];
      //copy the file
      try
        filecopy(sSource+ListItem.Caption, sDest+ListItem.Caption);
      except
      end;
    end;
end;

procedure TPBMaintJobBagFrm.CreateSchedule;
var
  inx: integer;
  JobBagSched: TJobBagSched;
begin
  inx := jobbag.schedules.count;
  inx := JobBag.Schedules.IndexOf(inx);
  jobbagSched := JobBag.Schedules[inx];

  if not chkbxArtRequired.checked and
     not chkbxDSRequired.checked and
     not chkbxSamples.checked then
      begin
        inx := JobBagSched.Parent.Schedules.IndexOf(jobbagSched.JBScheduleNo);
        jobbagSched.Parent.Schedules.Delete(inx);
        jobbagSched.Parent.Schedules.Renumber;
        exit;
      end;

  jobbagSched.ArtRequired := chkbxArtRequired.checked;
  if chkbxArtRequired.checked then
    begin
      jobbagSched.ArtDueDate := pbDateStr(edtArtDueInDate.text);
      jobbagSched.ArtProofDate := pbDateStr(edtArtProofReqDate.text);
      jobbagSched.ArtApprovalDate := pbDateStr(edtArtApprovalDate.text);

      if chkbxArtDueInDate.Checked then
        jobbagSched.ArtDueDateAct := pbDatestr(chkbxArtDueInDate.hint)
      else
        jobbagSched.ArtDueDateAct := pbDatestr('');

      if chkbxArtProofReqDate.Checked then
        jobbagSched.ArtProofDateAct := pbDatestr(chkbxArtProofReqDate.hint)
      else
        jobbagSched.ArtProofDateAct := pbDatestr('');

      if chkbxArtApprovalDate.Checked then
        jobbagSched.ArtApprovalDateAct := pbDatestr(chkbxArtApprovalDate.hint)
      else
        jobbagSched.ArtApprovalDateAct := pbDatestr('');
    end;

  jobbagSched.DSRequired := chkbxDSRequired.checked;
  if chkbxDSRequired.checked then
    begin
      jobbagSched.DataRequiredDate := pbDateStr(edtDataDueInDate.text);
      jobbagSched.BriefRequiredDate := pbDateStr(edtClientBriefInDate.text);
      jobbagSched.TextRequiredDate := pbDateStr(edtTextDueInDate.text);

      jobbagSched.BriefAvailableDate := pbDateStr(edtBrieftoDSDate.text);
      jobbagSched.DataAvailableDate := pbDateStr(edtDatatoDSDate.text);
      jobbagSched.TextAvailableDate := pbDateStr(edtTexttoDSDate.text);

      jobbagSched.TextProofDate := pbDateStr(edttextProofReqDate.text);

      jobbagSched.PDFProofArtworkDate := pbDateStr(edtPDFProofArtDate.text);
      jobbagSched.PDFProofRequiredDate := pbDateStr(edtPDFProofReqDate.text);
      jobbagSched.PDFProofApprovalDate := pbDateStr(edtPDFProofAppDate.text);

      jobbagSched.ProofRequiredDate := pbDateStr(edtLiveProofReqDate.text);
      jobbagSched.ProofApprovalDate := pbDateStr(edtLiveProofAppDate.text);

      if chkbxDataDueInDate.Checked then
        jobbagSched.DataRequiredDateAct := pbdatestr(chkbxDataDueInDate.Hint)
      else
        jobbagSched.DataRequiredDateAct := pbDatestr('');

      if chkbxClientBriefInDate.Checked then
        jobbagSched.BriefRequiredDateAct := pbdatestr(chkbxClientBriefInDate.Hint)
      else
        jobbagSched.BriefRequiredDateAct := pbDatestr('');

      if chkbxTextDueInDate.Checked then
        jobbagSched.TextRequiredDateAct := pbdatestr(chkbxTextDueInDate.Hint)
      else
        jobbagSched.TextRequiredDateAct := pbDatestr('');

      if chkbxBriefToDSDate.Checked then
        jobbagSched.BriefAvailableDateAct := pbdatestr(chkbxBriefToDSDate.Hint)
      else
        jobbagSched.BriefAvailableDateAct := pbDatestr('');

      if chkbxDataToDSDate.Checked then
        jobbagSched.DataAvailableDateAct := pbdatestr(chkbxDataToDSDate.Hint)
      else
        jobbagSched.DataAvailableDateAct := pbDatestr('');

      if chkbxTextToDSDate.Checked then
        jobbagSched.TextAvailableDateAct := pbdatestr(chkbxTextToDSDate.Hint)
      else
        jobbagSched.TextAvailableDateAct := pbDatestr('');

      if chkbxTextProofReqDate.Checked then
        jobbagSched.TextProofDateAct := pbdatestr(chkbxTextProofReqDate.Hint)
      else
        jobbagSched.TextProofDateAct := pbDatestr('');

      if chkbxPDFProofArtDate.Checked then
        jobbagSched.PDFProofArtworkDateAct := pbdatestr(chkbxPDFProofArtDate.Hint)
      else
        jobbagSched.PDFProofArtworkDateAct := pbDatestr('');

      if chkbxPDFProofReqDate.Checked then
        jobbagSched.PDFProofRequiredDateAct := pbdatestr(chkbxPDFProofReqDate.Hint)
      else
        jobbagSched.PDFProofRequiredDateAct := pbDatestr('');

      if chkbxPDFProofAppDate.Checked then
        jobbagSched.PDFProofApprovalDateAct := pbdatestr(chkbxPDFProofAppDate.Hint)
      else
        jobbagSched.PDFProofApprovalDateAct := pbDatestr('');

      if chkbxLiveProofReqDate.Checked then
        jobbagSched.ProofRequiredDateAct := pbdatestr(chkbxLiveProofReqDate.Hint)
      else
        jobbagSched.ProofRequiredDateAct := pbDatestr('');

      if chkbxLiveProofAppDate.Checked then
        jobbagSched.ProofApprovalDateAct := pbdatestr(chkbxLiveProofAppDate.Hint)
      else
        jobbagSched.ProofApprovalDateAct := pbDatestr('');
    end;

  jobbagSched.SamplesRequired := chkbxSamples.checked;
  if chkbxSamples.checked then
    begin
      jobbagSched.SampleToClientDate := pbDateStr(edtSEPClientDate.text);
      jobbagSched.SampleApprovalDate := pbDateStr(edtSEPApprovalDate.text);

      if chkbxSEPClientDate.Checked then
        jobbagSched.SampletoClientDateAct := pbDatestr(chkbxSEPClientDate.hint)
      else
        jobbagSched.SampletoClientDateAct := pbDatestr('');

      if chkbxSEPApprovalDate.Checked then
        jobbagSched.SampleApprovalDateAct := pbDatestr(chkbxSEPApprovalDate.hint)
      else
        jobbagSched.SampleApprovalDateAct := pbDatestr('');
    end;

  if cmbApprovalType.ItemIndex = 0 then
    jobbagsched.ApprovalType := 'C'
  else
  if cmbApprovalType.ItemIndex = 1 then
    jobbagsched.ApprovalType := 'E'
  else
    jobbagsched.ApprovalType := '';
  jobbagsched.NarrativeText := memScheduleNotes.Text;
end;

procedure TPBMaintJobBagFrm.DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint;
  var Effect: Integer);
begin
  var TargetPath := GetFilesPath;
  DropComboTarget1.SaveDroppedFiles(TargetPath, ShowDocuments);
end;

procedure TPBMaintJobBagFrm.DropPurchaseOrders;
var
  i : integer;
begin
  { The user has changed customer and/or branch so we must drop any
    existing purchase orders or chaos will ensue. }
  if JobBag.Lines.POCount > 0 then
  for i := Pred(JobBag.Lines.Count) downto 0 do   { reverse cos we're deleting }
    if JobBag.Lines[i].JBLineType = 'P' then
      JobBag.Lines.Delete(i);
end;

procedure TPBMaintJobBagFrm.BitBtn2Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateReq.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDateReq.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintJobBagFrm.edtDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtDate.Text = '' then
    Exit;

  try
    NewDate := StrToDate(edtDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDate.SetFocus;
      Exit;
    end;
  end;

  edtDate.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintJobBagFrm.edtDateReqExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If edtDateReq.Text = '' then
    Exit;
    try
    NewDate := StrToDate(edtDateReq.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDateReq.SetFocus;
      Exit;
    end;
  end;

  edtDateReq.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintJobBagFrm.BitBtn4Click(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := true;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := JobBag.Customer;
    PBLUCContaFrm.iBranch := JobBag.Branch;
    if dblkpCustomerContact.keyvalue = null then
      PBLUCContaFrm.SelCode := 0
    else
      PBLUCContaFrm.SelCode := dblkpCustomerContact.keyvalue;
    PBLUCContaFrm.sCustName := JobBag.CustomerName;
    PBLUCContaFrm.sBranchName := JobBag.BranchName;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      GetCustomerContacts(PBLUCContaFrm.SelCode);
      JobBag.ContactNo := PBLUCContaFrm.SelCode;
      if PBLUCContaFrm.Account_Number <> '' then
      begin
        if MessageDlg('This Contact has payment details on file. Is this a Cash Sale?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          JobBag.CashSale := true;
          chkbxCashSale.checked := true;
        end;
      end;
    end;
  finally
    PBLUCContaFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.btnNewClick(Sender: TObject);
begin
  dtmdlJBOrders := TdtmdlOrders.create(self);
  try
    CallMaintScreen(jblAdd);
  finally
    dtmdlJBOrders.Free;
  end;
end;

procedure TPBMaintJobBagFrm.memQuantityEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintJobBagFrm.memQuantityKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TPBMaintJobBagFrm.dbgLinesDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TPBMaintJobBagFrm.CreateDelivery(const iCust : integer;
  OrdLine: PBPOObjects.TOrderLine);
var
  aLine: TDeliveryLine;
begin
  aLine := TDeliveryLine.Create;
  with aLine do
  begin
    {Setup a delivery to the customer, or company if there is no customer}
    Line := OrdLine.Line;
    DeliveryNo := 1;
    QtyToDeliver := JobBag.Quantity;
    DatePoint := Date;

    var n := StrToIntDef(OrdLine.FormsPerBox, 0);
    if n > 0 then
      NoOfBoxes := JobBag.Quantity div n else
      NoOfBoxes := 1;

    Customer := iCust;
    BranchNoZero := PurchaseOrder.BranchNo;
  end;
  OrdLine.DeliveryLines.Add(aLine);
end;

function TPBMaintJobBagFrm.AddNewOrderLine(const LineNo: Integer): PBPOObjects.TOrderLine;
begin
  Result := PBPOObjects.TOrderLine.Create;
  with Result do
  begin
    Line := LineNo;
    CustOrderNo := edtCustOrderNo.Text;
    Customer := JobBag.Customer;
    BranchNo := JobBag.Branch;
    CustomerContact := JobBag.ContactNo;
    Enquiry := 0;
    LineZero := 0;
    SupplierReference := '';
    SupplierJobRef := '';
(*    GoodsRequired := StrToDate(edtDateReq.Text);
    GoodsRequiredByCust := StrToDate(edtDateReq.Text);
*)  if PBDateStr(edtDateReq.Text) > date then
      begin
        GoodsRequired := StrToDate(edtDateReq.Text);
        GoodsRequiredByCust := StrToDate(edtDateReq.Text);
      end
    else
      begin
        GoodsRequired := date;
        GoodsRequiredByCust := date;
      end;
    POLineStatus := 10;
    ProofRequired := False;
    ProofDate := 0;
    ExpectedLife := 0;
    VATCode := JobBag.DefaultVatCode;
    SuppliersDesc := edtDescription.text;
    CustomersDesc := edtDescription.text;
    DescriptiveRef := edtDescriptiveRef.Text;
    Quantity := JobBag.Quantity;
    OrderPrice := 0.00;
    SellingPrice := 0.00;
    ListPrice := 0.00;
    ProductType := 0;
    PrintedPO := False;
//    OrderUnit := 0;
//    SellUnit := 0;
    SuppInvRecd := False;
    Rep := JobBag.Rep;
    ProofStatus := '';
    Narrative := 0;
    NarrativeText := '';
    FormReference := 0;
    FormsPerBox := '';
    Depth := 0;
    DepthUnit := 'mm';
    Result.Width := 0;
    WidthUnit := 'mm';
    Artwork := '';
    NCROTCMix := 'X';
    NoOfPlateChanges := 0;
  end;
  PurchaseOrder.OrderLines.Add(Result);
end;

function TPBMaintJobBagFrm.AddNewSalesOrder: TSalesOrder;
begin
  with SalesOrder do
    begin
      Customer := JobBag.Customer;
      BranchNo := JobBag.Branch;
      CustomerName := JobBag.CustomerName;
      BranchName := JobBag.BranchName;
      CustomerContactNo := JobBag.ContactNo;
      ContactName := dblkpcustomerContact.Text;

(*      DeliveryCustomer := JobBag.Customer;
      DeliveryBranch := JobBag.Branch;
*)
      Operator := JobBag.Operator;

      CustOrderNo := JobBag.CustOrderNo;
      DateReq := date;
      RepLines[0].Rep := JobBag.Rep;
      RepLines[0].ActnTkn := 'A';
      ReplenishSource := 2;
      SOType := 'J';
    end;
  Result := SalesOrder;
end;

procedure TPBMaintJobBagFrm.dblkpCustomerContactClick(Sender: TObject);
begin
  if JobBag.ContactNo <> (Sender as TDBLookupComboBox).keyvalue then
    begin
      if JobBag.DataModule.GetContactAccountNo(JobBag.Customer, JobBag.Branch, (Sender as TDBLookupComboBox).keyvalue) <> '' then
        begin
          if MessageDlg('This Contact has payment details on file. Is this a Cash Sale?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            JobBag.CashSale := true;
            chkbxCashSale.checked := true;
          end;
        end;
    end;

  JobBag.ContactNo := (Sender as TDBLookupComboBox).keyvalue;

  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.dblkpRepClick(Sender: TObject);
begin
  JobBag.rep := (Sender as TDBLookupComboBox).keyvalue;
  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.btnRepClick(Sender: TObject);
begin
  PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
  try
    PBLUCRepFrm.bIs_Lookup := True;
    if dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator) then
      PBLUCRepFrm.bAllow_Upd := false
    else
      PBLUCRepFrm.bAllow_Upd := True;

    PBLUCRepFrm.iCust := JobBag.Customer;
    PBLUCRepFrm.iBranch := JobBag.Branch;
    PBLUCRepFrm.sCustName := JobBag.CustomerName;
    PBLUCRepFrm.sBranchName := JobBag.BranchName;
    PBLUCRepFrm.SelCode := JobBag.Rep;
    PBLUCRepFrm.ShowModal;
    if PBLUCRepFrm.bselected then
    begin
      JobBag.Rep := PBLUCRepFrm.selcode;
      edtRep.Text := PBLUCRepFrm.SelName;
//      GetCustomerReps(PBLUCRepFrm.SelCode);
    end;
  finally
    PBLUCRepFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.FormShow(Sender: TObject);
begin
  if (self.JobBag.JBStatus >= 30) and (Mode <> jbRepeat) then
    begin
//      pnlHeader.Enabled := false;
      self.btnCustomer.Enabled := false;
      self.btnRep.enabled := false;
      pnlProduction.Enabled := false;
    end
  else
  if not dmBroker.OperatorCanConfirmProduction(frmPBMainMenu.iOperator) then
    begin
      chkbxProductionComplete.enabled := false;
      pnlProduction.Enabled := false;
      self.btnCustomer.Enabled := true;
    end
  else
    self.btnCustomer.Enabled := true;

  pnlPackFormat.Visible := dmBroker.UseSAPIntegration;
end;

procedure TPBMaintJobBagFrm.UpdJobBagHead(Sender: TObject);
begin
  edtDescription.text := purchaseOrder.OrderLines[0].CustomersDesc;
  edtDescriptiveRef.Text := PurchaseOrder.OrderLines[0].DescriptiveRef;
  memQuantity.Text := formatfloat('########',purchaseOrder.Orderlines[0].Quantity);
  edtDateReq.Text := DateToStr(PurchaseOrder.OrderLines[0].GoodsRequiredByCust);
  edtCustOrderNo.Text := PurchaseOrder.OrderLines[0].CustOrderNo;
end;

procedure TPBMaintJobBagFrm.UpdJobBagHeadWorksOrder(aWOrder: TWOrder);
begin
  edtDescription.text := aWOrder.Description;
  memQuantity.Text := formatfloat('########',aWOrder.QuantityEst);
  edtDateReq.Text := DateToStr(aWOrder.DateRequired);
  edtCustOrderNo.Text := aWOrder.CustomerPO;
  JobBag.OfficeContact := aWorder.OfficeContact;
  JobBag.Rep := aWOrder.Rep;
//  dblkpRep.keyvalue := aWOrder.Rep;
end;

procedure TPBMaintJobBagFrm.btnProductionClick(Sender: TObject);
begin
//  CallMaintStockScreen('A');
  CallMaintProduction;
end;

procedure TPBMaintJobBagFrm.CallMaintProduction;
begin
  PBMaintJobBagProcessCostsFrm := TPBMaintJobBagProcessCostsFrm.create(self);
  try
    PBMaintJobBagProcessCostsFrm.JobBag := JobBag;
    PBMaintJobBagProcessCostsFrm.showmodal;
  finally
    PBMaintJobBagProcessCostsFrm.free;
  end;

end;

procedure TPBMaintJobBagFrm.CallMaintStockScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  iTempSel: Integer;
  iSOrdHeadStatus: integer;
  SONumber: integer;
  JobBagLine : TJobBagLIne;
  inx, ilines: integer;
  i, irow: integer;
begin
  if (FSOStatus > 30) and (sTempFuncMode = 'C') then
  begin
    if MessageDlg('This order has been ' + FSOStatusDescr +
      ' - Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        sTempFuncMode := 'H';
      end
    else
      exit;
  end;

  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 1);
  irow := inx;

  STMntSordFrm := TSTMntSordFrm.Create(Self);
  try
    STMntSordFrm.FuncMode := sTempFuncMode;
    SalesOrder.SOHeadStatus := FSOStatus;

    if sTempFuncMode = 'A' then
      begin
        STMntSordFrm.SalesOrderNo := 0;
        SalesOrder.OfficeContact := frmPBMainMenu.iOperator;
        SalesOrder.AccountManagerName := frmPBMainMenu.sOperator_Name;
        SalesOrder.AccountTeam := JobBag.Datamodule.GetOpAccountTeam(frmPBMainMenu.iOperator);
      end
    else
      begin
        inx := JobBag.Lines.IndexOfSequence(inx);
        JobBagLine := JobBag.Lines[inx];
        SONumber := JobBagLine.SONumber;
        STMntSordFrm.SalesOrderNo := SONumber;
      end;

    STMntSordFrm.SetupDetails(Self);

    STMntSOrdfrm.JobBagNo := JobBag.dbKey;
    if sTempFuncMode = 'A' then
      begin
        SalesOrder := AddNewSalesOrder;
      end;

    STMntSordFrm.ShowModal;
    bTempOK := STMntSordFrm.bOK;
    if bTempOK then
      begin
        for ilines := 0 to pred(SalesOrder.OrderLines.Count) do
        begin
//          if (sTempFuncMode = 'A') then
          if (SalesOrder.OrderLines[ilines].ActnTkn = 'A') then
          begin
            JobBagLine := TJobBagLine.Create(JobBag);
            JobBagLine.CurrencyCode := 1;
            JobBagLine.JBLine := JobBag.Lines.MaxLineNo + 1;
            JobBagLine.JBLineType := 'S';
            JobBagLine.JBLineMode := 'C';
            JobBagLine.PurchaseOrder := 0;
            JobBagLine.Line := 0;
            JobBagLine.Supplier:= dmBroker.GetCompanySupplier;
            JobBagLine.BranchNo := dmBroker.GetCompanySupplierBranch;
            SONumber := SalesOrder.SONumber;
            JobBagLine.SONumber := SalesOrder.SONumber;
            JobBagLine.SOLineNo := SalesOrder.OrderLines[ilines].Line;
            JobBagLine.JBLineDescr := SalesOrder.OrderLines[ilines].part;
            JobBagLine.JBQuantity := Trunc(SalesOrder.OrderLines[ilines].OrdQty);
            with JobBag.Datamodule do
            begin
              JobBagLine.JBLineCost := CalculateStockPrice(SalesOrder.OrderLines[ilines].PurchPackQuantity,
                SalesOrder.OrderLines[ilines].OrdQty, SalesOrder.OrderLines[ilines].Part_Cost);
              JobBagLine.JBLineSell := CalculateStockPrice(SalesOrder.OrderLines[ilines].SellPackQuantity,
                SalesOrder.OrderLines[ilines].OrdQty, SalesOrder.OrderLines[ilines].Sell_Price);
              JobBagLine.JBLineReseller := CalculateStockPrice(SalesOrder.OrderLines[ilines].SellPackQuantity,
                SalesOrder.OrderLines[ilines].OrdQty, SalesOrder.OrderLines[ilines].Sell_Price);
            end;
            if SalesOrder.SOHeadStatus = 200 then
              JobBagLine.JBLineInvoiced := 'P'
            else
            if SalesOrder.SOHeadStatus >= 250 then
              JobBagLine.JBLineInvoiced := 'Y'
            else
              JobBagLine.JBLineInvoiced := 'N';

              //            JobBagLine.JBLineInvoiced := PBMaintPOrdfrm.selectedLine.POLineStatus >= 30;
            JobBagLine.SupplierName := JobBag.DataModule.GetSupplierName(JobBagLine.Supplier);
            JobBagLine.JBLineStatusText := JobBag.DataModule.GetSOStatus(JobBagLine.SONumber,JobBag.DbKey,JobBagLine.JBLine,JobBagLine.JBLineInvoiced);
            JobBagLine.VATCode := SalesOrder.OrderLines[ilines].VatCode;
            JobBagLine.Sequence := JobBagLine.Parent.Lines.count + 1;
            JobBagLine.Parent.Lines.Add(JobBagLine);
          end
          else
          if (SalesOrder.OrderLines[ilines].ActnTkn = 'C') then
          begin
            inx := JobBag.Lines.IndexOf(SalesOrder.OrderLines[ilines].JobBagLine);
            JobBagLine := JobBag.Lines[inx];

            JobBagLine.JBLineDescr := SalesOrder.OrderLines[ilines].Part;
            JobBagLine.JBQuantity := Trunc(SalesOrder.OrderLines[ilines].OrdQty);

            JobBagLine.SONumber := SalesOrder.SONumber;
            JobBagLine.SOLineNo := SalesOrder.OrderLines[ilines].Line;

            with JobBag.Datamodule do
            begin
              JobBagLine.JBLineCost := CalculateStockPrice(SalesOrder.OrderLines[ilines].PurchPackQuantity,
                SalesOrder.OrderLines[ilines].OrdQty, SalesOrder.OrderLines[ilines].Part_Cost);
              JobBagLine.JBLineSell := CalculateStockPrice(SalesOrder.OrderLines[ilines].SellPackQuantity,
                SalesOrder.OrderLines[ilines].OrdQty, SalesOrder.OrderLines[ilines].Sell_Price);
              JobBagLine.JBLineReseller := CalculateStockPrice(SalesOrder.OrderLines[ilines].SellPackQuantity,
                SalesOrder.OrderLines[ilines].OrdQty, SalesOrder.OrderLines[ilines].Sell_Price);
            end;
            if SalesOrder.SOHeadStatus = 200 then
              JobBagLine.JBLineInvoiced := 'P'
            else
            if SalesOrder.SOHeadStatus >= 250 then
              JobBagLine.JBLineInvoiced := 'Y'
            else
              JobBagLine.JBLineInvoiced := 'N';

            JobBagLine.SupplierName := JobBag.DataModule.GetSupplierName(JobBagLine.Supplier);
            JobBagLine.JBLineStatusText := JobBag.DataModule.GetSOStatus(JobBagLine.SONumber,JobBag.DbKey,JobBagLine.JBLine,JobBagLine.JBLineInvoiced);
            JobBagLine.VATCode := SalesOrder.OrderLines[ilines].VATCode;
//            JobBagLine.Parent.SaveToDB(false);
          end
          else
          if (SalesOrder.OrderLines[ilines].ActnTkn = 'D') then
          begin
            inx := JobBag.Lines.IndexOf(SalesOrder.OrderLines[ilines].JobBagLine);
            JobBagLine := JobBag.Lines[inx];
//            JobBagLine.DeletefromDB;
            JobBagLine.Parent.Lines.Delete(inx);
          end;
        end;
      end;

    iTempSel := SalesOrder.SONumber;

  finally
    STMntSordFrm.Free;
  end;

  for i := 0 to pred(JobBag.Lines.count) do
    if JobBag.Lines[i].SONumber = SONumber then
      begin
        JobBag.Lines[i].JBQuantity := JobBag.DataModule.GetJobBagLineQty(JobBag.DbKey, JobBag.Lines[i].JBLine);
        JobBag.Lines[i].JBLineCost := JobBag.DataModule.GetJobBagLineCost(JobBag.DbKey, JobBag.Lines[i].JBLine);
        JobBag.Lines[i].JBLineSell := JobBag.DataModule.GetJobBagLineSell(JobBag.DbKey, JobBag.Lines[i].JBLine);
        JobBag.Lines[i].JBLineReseller := JobBag.DataModule.GetJobBagLineReseller(JobBag.DbKey, JobBag.Lines[i].JBLine);
        JobBag.Lines[i].JBLineStatusText := JobBag.DataModule.GetSOStatus(SONumber,JobBag.DbKey,JobBag.Lines[i].JBLine,JobBag.Lines[i].JBLineInvoiced);
      end;

  if Mode <> jbView then
    begin
      UpdateInternalCost;
      ShowLineDetails;
      ShowTotals;
    end;

  if sTempFuncMode = 'A' then
    begin
      irow := JobBag.Lines.count;
      if irow <= 0 then irow := 1;
    end ;
  sgLines.row := irow;
end;

procedure TPBMaintJobBagFrm.CallMaintStockRequest(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  iTempSel: Integer;
  iSOrdHeadStatus: integer;
  SONumber: integer;
  JobBagRequest : TJobBagRequest;
  inx, ilines: integer;
  i, irow: integer;
begin
  inx := StrToIntDef(sgRequests.cells[0,sgRequests.row], 1);

  if sTempFuncMode <> 'A' then
    begin
      if JobBag.Requests.Count > 0 then
      begin
        inx := JobBag.Requests.IndexOf(inx);
        JobBagRequest := JobBag.Requests[inx];

        dtmdlJBOrders := TdtmdlOrders.create(self);
        try
          SelectSalesOrder(JobBagRequest.SalesOrder);
        finally
          dtmdlJBOrders.Free;
        end;
      end;

      if (FSOStatus > 30) and (sTempFuncMode = 'C') then
      begin
        if MessageDlg('This order has been ' + FSOStatusDescr +
          ' - Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            sTempFuncMode := 'H';
          end
        else
          exit;
      end;
    end;

  irow := inx;

  STMntSordFrm := TSTMntSordFrm.Create(Self);
  try
    STMntSordFrm.FuncMode := sTempFuncMode;
    SalesOrder.SOHeadStatus := FSOStatus;

    if sTempFuncMode = 'A' then
      begin
        STMntSordFrm.SalesOrderNo := 0;
        SalesOrder.OfficeContact := frmPBMainMenu.iOperator;
        SalesOrder.AccountManagerName := frmPBMainMenu.sOperator_Name;
        SalesOrder.AccountTeam := JobBag.Datamodule.GetOpAccountTeam(frmPBMainMenu.iOperator);
      end
    else
      begin
//        inx := JobBag.Requests.IndexOf(inx);
//        JobBagRequest := JobBag.Requests[inx];
        SONumber := JobBagRequest.SalesOrder;
        STMntSordFrm.SalesOrderNo := SONumber;
      end;

    STMntSordFrm.SetupDetails(Self);

    STMntSOrdfrm.JobBagNo := JobBag.dbKey;
    STMntSOrdFrm.FAddJobBag := false;
    STMntSOrdFrm.FAddJobBagReq := true;

    if sTempFuncMode = 'A' then
      begin
        SalesOrder := AddNewSalesOrder;
      end;

    STMntSordFrm.ShowModal;
    bTempOK := STMntSordFrm.bOK;
    if bTempOK then
      begin
      for ilines := 0 to pred(SalesOrder.OrderLines.Count) do
        begin
//          if (sTempFuncMode = 'A') then
          if (SalesOrder.OrderLines[ilines].ActnTkn = 'A') then
          begin
            JobBagRequest := TJobBagRequest.Create(JobBag);
            JobBagRequest.JBRequestNo := JobBag.Requests.count + 1;

            JobBagRequest.Salesorder := SalesOrder.SONumber;
            JobBagRequest.SalesOrderLine := SalesOrder.OrderLines[ilines].Line;
            JobBagRequest.DateRequested := SalesOrder.DatePoint;
            JobBagRequest.PartCode := SalesOrder.OrderLines[ilines].Part;
            JobBagRequest.PartDescription := JobBag.DataModule.GetPartDescr(SalesOrder.OrderLines[ilines].Part);
            JobBagRequest.QtyOrdered := SalesOrder.OrderLines[iLines].OrdQty;
            JobBagRequest.QtyDespatched := SalesOrder.OrderLines[iLines].DelQty;
            JobBagRequest.ToInvoice := false;
            JobBagRequest.Status := SalesOrder.OrderStatus;
            JobBagRequest.StatusDescr := JobBag.DataModule.GetSOStatusDescr(SalesOrder.SONumber);
            JobBagRequest.Parent.Requests.Add(JobBagRequest);
          end
          else
          if (SalesOrder.OrderLines[ilines].ActnTkn = 'C') then
          begin
            inx := JobBag.Requests.IndexOf(SalesOrder.OrderLines[ilines].JobBagRequest);
            JobBagRequest := JobBag.Requests[inx];

            JobBagRequest.Salesorder := SalesOrder.SONumber;
            JobBagRequest.SalesOrderLine := SalesOrder.OrderLines[ilines].Line;
            JobBagRequest.DateRequested := SalesOrder.DatePoint;
            JobBagRequest.PartCode := SalesOrder.OrderLines[ilines].Part;
            JobBagRequest.PartDescription := JobBag.DataModule.GetPartDescr(SalesOrder.OrderLines[ilines].Part);
            JobBagRequest.QtyOrdered := SalesOrder.OrderLines[iLines].OrdQty;
            JobBagRequest.QtyDespatched := SalesOrder.OrderLines[iLines].DelQty;
            JobBagRequest.Status := SalesOrder.OrderStatus;
            JobBagRequest.StatusDescr := JobBag.DataModule.GetSOStatusDescr(SalesOrder.SONumber);
            JobBagRequest.ToInvoice := false;
          end
          else
          if (SalesOrder.OrderLines[ilines].ActnTkn = 'D') and ((sTempFuncMode <> 'A')) then
          begin
            inx := JobBag.Requests.IndexOf(SalesOrder.OrderLines[ilines].JobBagRequest);
            JobBagRequest := JobBag.Requests[inx];
            JobBagRequest.Parent.Requests.Delete(inx);
          end;
        end;
      end;

    iTempSel := SalesOrder.SONumber;

  finally
    STMntSordFrm.Free;
  end;

  for i := 0 to pred(JobBag.Requests.count) do
    if JobBag.Requests[i].SalesOrder = SONumber then
      begin
        JobBag.Requests[i].Status := JobBag.DataModule.GetSalesOrderStatus(JobBag.Requests[i].SalesOrder);
        JobBag.Requests[i].StatusDescr := JobBag.DataModule.GetSOStatusDescr(JobBag.Requests[i].SalesOrder);
        JobBag.Requests[i].QtyOrdered := JobBag.DataModule.GetSOLineOrderQty(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
        JobBag.Requests[i].QtyDespatched := JobBag.DataModule.GetSOLineDeliveryQty(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
      end;

  if Mode <> jbView then
    ShowRequests;

  if sTempFuncMode = 'A' then
    begin
      inx := pred(JobBag.Requests.count);
      if inx <= 0 then inx := 0;
    end
  else
  if sTempFuncMode = 'D' then
    begin
      inx := inx - 1;
      if inx < 0 then inx := 0;
    end;
  sgRequests.row := inx + 1;
end;

procedure TPBMaintJobBagFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  if Mode = jbView then exit;


  if bNewPOAdded then
    TempWord := MessageDlg('A NEW PO has been added to the job bag do you want to save these details? ' +
                           'If you don''t save, the PO will not be saved in the job bag', mtWarning,
      [mbYes, mbNo, mbCancel], 0)
  else
    TempWord := MessageDlg('Do you want to save these job bag details?', mtConfirmation,
      [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
    begin
      Exit;
    end
  else
  if TempWord = mrCancel then
    Action := caNone
  else
    begin
      btnOKClick(self);
    end;

end;

procedure TPBMaintJobBagFrm.pmnSOrdersPopup(Sender: TObject);
var
  inx: integer;
  JobBagLine: TJobBagLine;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

  inx := jobbag.Lines.IndexOfSequence(inx);
  JobBagLine := JobBag.Lines[inx];

  dtmdlJBOrders := TdtmdlOrders.create(self);
  try
    SelectSalesOrder(JobBagLine.SONumber);
    mnuAllocate.enabled := (FSOStatus >= 10) and (FSOStatus < 50);
    mnuDeAllocate.enabled := (FSOStatus >= 50) and (FSOStatus < 100);
    mnuConfirm.enabled := (FSOStatus >= 100) and (FSOStatus < 150) and (FSOStatus <> 120);
    mnuProduction.enabled := (FSOStatus = 120);
    mnuEditSOPrices.enabled := (FSOStatus >= 140);
  finally
    dtmdlJBOrders.free;
  end;
end;

procedure TPBMaintJobBagFrm.mnuChangeClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TPBMaintJobBagFrm.CallAllocScreen(sTempFuncMode: Char);
var
  iTempSel: Integer;
  bTempOK: Boolean;
  SONumber: integer;
  inx: integer;
  JobBagLine: TJobBagLine;
  i: integer;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

//  inx := sgLines.row;
  inx := jobbag.Lines.IndexOfSequence(inx);
  JobBagLine := JobBag.Lines[inx];

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    SONumber := JobBagLine.SONumber;
    STPrtAllocSalesFrm := TSTPrtAllocSalesFrm.Create(Self);
    try
      STPrtAllocSalesFrm.iOrder := SONumber;
      STPrtAllocSalesFrm.bDeAlloc := (sTempFuncMode = 'D');

      STPrtAllocSalesFrm.iStoreFrom := dtmdlJBOrders.GetSOPartStore(SONumber);
      STPrtAllocSalesFrm.lblSalesOrderNo.Caption := 'Sales Order: ' + IntToStr(SONumber) +
                                 '   Despatch From: ' ;
      STPrtAllocSalesFrm.ShowModal;
      bTempOK := STPrtAllocSalesFrm.bOK ;
      if bTempOK then
        begin
          for i := 0 to pred(JobBag.Lines.count) do
            if JobBag.Lines[i].SONumber = SONumber then
              JobBag.Lines[i].JBLineStatusText := JobBag.DataModule.GetSOStatus(SONumber,JobBag.DbKey,JobBag.Lines[i].JBLine,JobBag.Lines[i].JBLineInvoiced);
        end
    finally
      STPrtAllocSalesFrm.Free;
      UpdateInternalCost;
      ShowLineDetails;
      sgLines.row := inx+1;
    end;
  finally
    dtmdlJBOrders.free;
  end;
end;

procedure TPBMaintJobBagFrm.CallAllocRequest(sTempFuncMode: Char);
var
  iTempSel: Integer;
  bTempOK: Boolean;
  SONumber: integer;
  inx: integer;
  JobBagRequest: TJobBagRequest;
  i: integer;
begin
  inx := StrToIntDef(sgRequests.cells[0,sgRequests.row], 0);

//  inx := sgLines.row;
  inx := jobbag.Requests.IndexOf(inx);
  JobBagRequest := JobBag.Requests[inx];

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    SONumber := JobBagRequest.SalesOrder;

    STPrtAllocSalesFrm := TSTPrtAllocSalesFrm.Create(Self);
    try
      STPrtAllocSalesFrm.iOrder := SONumber;
      STPrtAllocSalesFrm.bDeAlloc := (sTempFuncMode = 'D');

      STPrtAllocSalesFrm.iStoreFrom := dtmdlJBOrders.GetSOPartStore(SONumber);
      STPrtAllocSalesFrm.lblSalesOrderNo.Caption := 'Sales Order: ' + IntToStr(SONumber) +
                                 '   Despatch From: ' ;
      STPrtAllocSalesFrm.ShowModal;
      bTempOK := STPrtAllocSalesFrm.bOK ;
      if bTempOK then
        begin
          for i := 0 to pred(JobBag.Requests.count) do
            if JobBag.Requests[i].SalesOrder = SONumber then
              begin
                JobBag.Requests[i].Status := JobBag.DataModule.GetSalesOrderStatus(JobBag.Requests[i].SalesOrder);
                JobBag.Requests[i].StatusDescr := JobBag.DataModule.GetSOStatusDescr(JobBag.Requests[i].SalesOrder);
              end;
        end
    finally
      STPrtAllocSalesFrm.Free;
      ShowRequests;
      sgRequests.row := inx+1;
    end;
  finally
    dtmdlJBOrders.free;
  end;
end;

procedure TPBMaintJobBagFrm.mnuAllocateClick(Sender: TObject);
begin
  CallAllocScreen('A');
end;

procedure TPBMaintJobBagFrm.mnuDeAllocateClick(Sender: TObject);
begin
  CallAllocScreen('D');
end;

procedure TPBMaintJobBagFrm.mnuPickingNoteClick(Sender: TObject);
var
  Reprint: ByteBool;
  SONumber: integer;
  SOStatus: integer;
  bTempOK: Bytebool;
  iTempSel: integer;
  customername: string;
  inx, i: integer;
  JobBagLine: TJobBagLine;
  NewPicking: boolean;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

  inx := jobbag.Lines.IndexOfSequence(inx);
  JobBagLine := JobBag.Lines[inx];

  customername := JobBag.CustomerName;
  Reprint := false;

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    SelectSalesOrder(JobBagLine.SONumber);

    SONumber := JobBagLine.SONumber;

    NewPicking := true;

    if (FSOStatus < 50) then
      begin
        messagedlg('Cannot print a Picking Note, stock has not been allocated to the order.', mtWarning,
            [mbOk], 0);
        exit
      end
    else
    if (FSOStatus = 100) then
      begin
        messagedlg('The Picking Note has already been printed', mtWarning,
          [mbOk], 0);
        Reprint := true;
        NewPicking := dtmdlJBOrders.IsNewPicking(SONumber);
      end
    else
    if (FSOStatus > 100) then
      begin
        NewPicking := dtmdlJBOrders.IsNewPicking(SONumber);
        if NewPicking then
          begin
            if messagedlg('The status of this order is '+ FSOStatusDescr + ', continue?',
                  mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit;
          end
        else
          begin
            messagedlg('The status of this order is '+ FSOStatusDescr + ' you cannot print/reprint the Picking Note.', mtWarning,
              [mbOk], 0);
            exit;
          end;
      end;

    if NewPicking then
      begin
        STRSPickingNotefrm:= TSTRSPickingNotefrm.create(self);
        try
          STRSPickingNotefrm.Customerlbl.caption := CustomerName;
          STRSPickingNotefrm.OrderDateLbl.caption := pbDateStr(FSODateOrdered);
          STRSPickingNotefrm.SONumber := SONumber;
          STRSPickingNotefrm.DateRequired := FSODateRequired;
          STRSPickingNotefrm.toDestroy := false;
          STRSPickingNotefrm.IsSalesOrder := True;
          STRSPickingNotefrm.showmodal;
          bTempOK := STRSPickingNotefrm.bOK;
        finally
          STRSPickingNotefrm.free;
        end;
      end
    else
      begin
        STRSPickNotefrm:= TSTRSPickNotefrm.create(self);
        try
          STRSPickNotefrm.OrderGroupBox.caption := STRSPickNotefrm.OrderGroupBox.caption + inttostr(SONumber);
          STRSPickNotefrm.Customerlbl.caption := CustomerName;
          STRSPickNotefrm.OrderDateLbl.caption := pbDateStr(FSODateOrdered);
          STRSPickNotefrm.DeliveryDateEdit.text := pbDateStr(FSODateRequired);
          STRSPickNotefrm.SONumber := SONumber;
          STRSPickNotefrm.DateRequired := FSODateRequired;
          STRSPickNotefrm.Reprint := Reprint;
          STRSPickNotefrm.showmodal;
          bTempOK := STRSPickNotefrm.bOK;
        finally
          STRSPickNotefrm.free;
        end;
      end;
    if bTempOK then
      begin
        for i := 0 to pred(JobBag.Lines.count) do
          if JobBag.Lines[i].SONumber = SONumber then
            JobBag.Lines[i].JBLineStatusText := JobBag.DataModule.GetSOStatus(SONumber,JobBag.DbKey,JobBag.Lines[i].JBLine,JobBag.Lines[i].JBLineInvoiced);
          iTempSel := SONumber;
        UpdateInternalCost;
        ShowLineDetails;
        sgLines.row := inx+1;
      end
  finally
    dtmdlJBOrders.free;
  end;
end;

procedure TPBMaintJobBagFrm.mnuConfirmClick(Sender: TObject);
var
  bTempOK: Bytebool;
  iIntSelCode: integer;
  sPickRef: string;
  SONumber: integer;
  PickingList: TPickingList;
var
  inx, i: integer;
  JobBagLine: TJobBagLine;
  NewPicking: boolean;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

  inx := jobbag.Lines.IndexOfSequence(inx);
  JobBagLine := JobBag.Lines[inx];

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    SelectSalesOrder(JobBagLine.SONumber);

    SONumber := JobBagLine.SONumber;

    NewPicking := dtmdlJBOrders.IsNewPicking(SONumber);

    if NewPicking then
      begin
        STMaintPickFrm := TSTMaintPickFrm.Create(Self);
        try
          STMaintPickFrm.IsSalesOrder := True;
          STMaintPickFrm.SalesOrder := SONumber;
          STMaintPickFrm.ShowModal;
          bTempOK := STMaintPickFrm.bOK;
        finally
          STMaintPickFrm.Free;
        end;
      end
    else
      begin
        {Delete any entries currently in the IntSel table for this process}
        {This has all been added because the Picking confirmation screen works off the Intsel table}
        iIntSelCode := dmBroker.GetNextIntSelCode(Self) ;
        dmBroker.DelIntSelCode(iIntSelCode, True);

        {Get the Picking Refererence}
        sPickRef := dtmdlJBOrders.GetPickingRef(SONumber);
        dmBroker.AddIntSelCode(iIntSelCode,StrToFloatDef(sPickRef, 0, FormatSettings), sPickRef);

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
          STPickByPartFrm.Free;
          stStockDataMod.free;
          stPickDM.free;
        end;
      end;
    if bTempOK then
      begin
        for i := 0 to pred(JobBag.Lines.count) do
          if JobBag.Lines[i].SONumber = SONumber then
            begin
            JobBag.Lines[i].JBQuantity := JobBag.DataModule.GetJobBagLineQty(JobBag.DbKey, JobBag.Lines[i].JBLine);
            JobBag.Lines[i].JBLineCost := JobBag.DataModule.GetJobBagLineCost(JobBag.DbKey, JobBag.Lines[i].JBLine);
            JobBag.Lines[i].JBLineSell := JobBag.DataModule.GetJobBagLineSell(JobBag.DbKey, JobBag.Lines[i].JBLine);
            JobBag.Lines[i].JBLineReseller := JobBag.DataModule.GetJobBagLineReseller(JobBag.DbKey, JobBag.Lines[i].JBLine);
            JobBag.Lines[i].JBLineStatusText := JobBag.DataModule.GetSOStatus(SONumber,JobBag.DbKey,JobBag.Lines[i].JBLine,JobBag.Lines[i].JBLineInvoiced);
            end;
        UpdateInternalCost;
        ShowLineDetails;
        sgLines.row := inx+1;
      end;
  finally
    dtmdlJBOrders.Free;
  end;
end;

procedure TPBMaintJobBagFrm.CallMaintWOrderScreen(
  const aMode: TJBMode);
var
  bTempOK: Boolean;
  iTempSel: Integer;
  key: integer;
  JobBagLine : TJobBagLIne;
  inx, ilines: integer;
  aWOrder: TWOrder;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

  if (aMode = jbAdd) or (aMode = jbCopy) then
    begin
      JobBagLine := TJobBagLine.Create(JobBag);
    end
  else
  if aMode = jbChange then
    begin
      inx := JobBag.Lines.IndexOf(inx);
      JobBagLine := JobBag.Lines[inx];

      key := JobBagLine.WONumber;

    end;

  try

    aWOrder := TWOrder.Create(dtmdlJBWOrders);
    aWOrder.DbKey := key;
    aWOrder.LoadFromDB;

    frmPBMaintWorksOrders := TfrmPBMaintWorksOrders.Create(Self);
    try
      if aMode = jbChange then
        frmPBMaintWorksOrders.Mode := woChange
      else
      if aMode = jbAdd then
        frmPBMaintWorksOrders.Mode := woAdd;

      frmPBMaintWorksOrders.WOrder := aWOrder;
      frmPBMaintWorksOrders.ComeFromJobBag := true;
      frmPBMaintWorksOrders.ShowModal;
      bTempOK := frmPBMaintWorksOrders.bOK;

      if bTempOK then
        begin
          if (aMode = jbAdd) or (aMode = jbCopy) then
            begin
            JobBagLine.CurrencyCode := 1;
//            JobBagLine.JBLine := JobBag.Lines.Count + 1;
            JobBagLine.JBLine := JobBag.Lines.MaxLineNo + 1;
            JobBagLine.JBLineType := 'W';
            JobBagLine.JBLineMode := 'C';
            JobBagLine.WONumber := aWOrder.dbkey;
            JobBagLine.Supplier:= dmBroker.GetCompanySupplier;
            JobBagLine.BranchNo := dmBroker.GetCompanySupplierBranch;
            JobBagLine.JBLineDescr := aWOrder.Description;
            JobBagLine.JBQuantity := Trunc(aWorder.QuantityEst);
            JobBagLine.JBLineCost := 0.00;
            JobBagLine.JBLineSell := aWOrder.EstimatedCost;
            JobBagLine.JBLineReseller := aWOrder.EstimatedCost;
            if aWOrder.WOStatus >= 30 then
              JobBagLine.JBLineInvoiced := 'Y'
            else
            if aWOrder.WOStatus >= 25 then
              JobBagLine.JBLineInvoiced := 'P'
            else
              JobBagLine.JBLineInvoiced := 'N';

            JobBagLine.VATCode := aWOrder.VatCode;
            JobBagLine.Parent.Lines.Add(JobBagLine);
            end
          else
          if aMode = jbChange then
            begin
            {Update the job bag head}
            if aWorder.JobBagLine = 1 then
              UpdJobBagHeadWorksOrder(aWOrder);
            JobBagLine.JBLineDescr := aWOrder.Description ;
            JobBagLine.JBQuantity := Trunc(aWOrder.QuantityEst);
            JobBagLine.JBLineCost := 0.00;
            JobBagLine.JBLineSell := aWorder.EstimatedCost;
            JobBagLine.JBLineReseller := aWorder.EstimatedCost;
            if aWOrder.WOStatus >= 30 then
              JobBagLine.JBLineInvoiced := 'Y'
            else
            if aWOrder.WOStatus >= 25 then
              JobBagLine.JBLineInvoiced := 'P'
            else
              JobBagLine.JBLineInvoiced := 'N';

            JobBagLine.VATCode := aWOrder.VATCode;
//            JobBagLine.Parent.SaveToDB(false);
            end;
        end;
    finally
      aWOrder.Free;
      frmPBMaintWorksOrders.Free;
    end;
  finally
    UpdateInternalCost;
    ShowLineDetails;
    ShowTotals;
  end;
end;

procedure TPBMaintJobBagFrm.btnExtrasClick(Sender: TObject);
begin
//  CallMaintExtrasForm(jblAdd);
  CallMaintLines(jblAdd);
end;

procedure TPBMaintJobBagFrm.pmnFunctionsPopup(Sender: TObject);
begin
  with pmnFunctions do
    begin
      mnuinsertexistingPO.enabled := btnAddPO.enabled;
      mnuaddNewPO.enabled := btnNew.enabled;
      mnuaddProduction.enabled := btnProduction.Enabled;
      mnuaddsundrycharge.Enabled := btnAdd.enabled;
      mnuaddWorksOrderCharge.Enabled := btnExtras.enabled;
      mnuchangeline.enabled := btnChange.enabled;
      mnuconvert.enabled := btnAddPO.enabled;
      mnudelete.enabled := btnDelete.enabled;
      mnuCopy.enabled := btnChange.enabled;
      mnuAddProduction.Visible := btnProduction.Visible;
    end;
end;

procedure TPBMaintJobBagFrm.btnAccountManagerClick(Sender: TObject);
begin
  if dmBroker.UseAccountManagers then
    begin
      PBLUAccountManagerFrm := TPBLUAccountManagerFrm.Create(Owner);
      try
        PBLUAccountManagerFrm.bIs_Lookup := True;
        PBLUAccountManagerFrm.bAllow_Upd := True;

        PBLUAccountManagerFrm.SelCode := JobBag.OfficeContact;
        PBLUAccountManagerFrm.ShowModal;
        if PBLUAccountManagerFrm.selected then
        begin
          JobBag.OfficeContact := PBLUAccountManagerFrm.SelCode;
          JobBag.AccountManagerName := PBLUAccountManagerFrm.SelName;
          edtAccountManager.Text := PBLUAccountManagerFrm.SelName;
          JobBag.AccountTeam := PBLUAccountManagerFrm.SelTeam;
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

        PBLUOpsFrm.SelCode := JobBag.OfficeContact;
        PBLUOpsFrm.ShowModal;
        if PBLUOpsFrm.selected then
        begin
          JobBag.OfficeContact := PBLUOpsFrm.SelCode;
          JobBag.AccountManagerName := PBLUOpsFrm.SelName;
          edtAccountManager.Text := PBLUOpsFrm.SelName;
        end;
      finally
        PBLUOpsFrm.Free;
      end;
    end;
  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.Print1Click(Sender: TObject);
var
  bTempOK: Boolean;
  selcode: real;
  inx: integer;
  JobBagLine: TJobBagLine;
  bAuthorised: boolean;
begin
  bAuthorised := true;

  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);
  inx := jobbag.Lines.IndexOfSequence(inx);
  JobBagLine := JobBag.Lines[inx];

  selcode := JobBagLine.PurchaseOrder;
  bAuthorised := not JobBagLine.NeedsAuthorising;
  if JobBagLine.NeedsAuthorising then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
    end;

  PBRSPOrdNFrm := TPBRSPOrdNFrm.Create(Self);
  try
    PBRSPOrdNFrm.bAuthorised := bAuthorised;
    PBRSPOrdNFrm.EnquiryMemo.text := floattostr(selcode);
    PBRSPOrdNFrm.ShowModal;
    bTempOK := PBRSPOrdNFrm.bOK;
    if bTempOK then
      begin
        JobBagLine.JBLineStatusText := JobBag.DataModule.GetPOStatus(selcode,JobBagLine.Line,JobBag.DbKey,JobBagLine.JBLine,JobBagLine.JBLineInvoiced);
        ShowLineDetails;
        sgLines.Row := inx+1;
      end;
  finally
    PBRSPOrdNFrm.Free;
  end;
end;

procedure TPBMaintJobBagFrm.CheckNotes(Sender: TObject);
begin
  if trim(JobBag.NarrativeText) <> '' then
  begin
    FlashTimer.Enabled := True;
    btnNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    btnNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintJobBagFrm.btnNotesClick(Sender: TObject);
var
  PBDBInvMemoFrm: TPBDBMemoFrm;
begin
  PBDBInvMemofrm := TPBDBMemoFrm.create(self);
  try
    if Mode = jbView then
      PBDBInvMemoFrm.bAllow_Upd := false
    else
      PBDBInvMemoFrm.bAllow_Upd := true;

    PBDBInvMemoFrm.Datamemo.text := JobBag.NarrativeText;
    PBDBInvMemoFrm.ShowModal;
    JobBag.Narrativetext := PBDBInvMemofrm.Datamemo.text;
  finally
    PBDBInvMemofrm.free;
  end;
  checknotes(Self);
end;

procedure TPBMaintJobBagFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    btnNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintJobBagFrm.ShowLineDetails;
begin
  if Mode = jbAdd then
    begin
      ClearGrid(sgLines);  {Clear contents of Line grid}
      JobBag.Lines.ReSequence;
      BuildLineGrid;
    end
  else
    begin
      ClearGrid(sgLines);  {Clear contents of Line grid}
      JobBag.Lines.ReSequence;
      BuildLineGrid;
    end;
end;

procedure TPBMaintJobBagFrm.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
//    rowcount := 2;
    end;
end;

procedure TPBMaintJobBagFrm.ReNumberLines(delLine: integer);
var
  icount, inx, iLine: integer;
  JobBagLine: TJobBagLine;
begin
  for icount := 0 to pred(JobBag.lines.count) do
    begin
      iLine := JobBag.Lines[icount].JBLine;
      inx := JobBag.Lines.IndexOf(iLine);
      JobBagLine := JobBag.Lines[inx];

      if (JobBagLine.sequence < delLine) then
        continue
      else
        begin
          JobBagLine.sequence := JobBagLine.sequence - 1;
          sgLines.Cells[0,JobBagLine.sequence] := inttostr(JobBagLine.sequence);
        end;
    end;
end;

procedure TPBMaintJobBagFrm.BuildLineGrid;
var
  i, icount, iLine, iChecked: integer;
  irow: integer;
  myImage: TImage;
begin
  icount := 0;

  {free any existing images}
  for iLine := 1 to pred(sgLines.RowCount) do
    begin
      for iChecked := 0 to 2 do
        begin
          try
            myImage :=  findcomponent('img'+Copy((IntToStr(1000 + iLine)),2,3)+'I'+inttostr(iChecked)) as TImage;
            myImage.Free;
          except
          end;
        end;
    end;

  with sgLines, jobbag.datamodule do
    begin
      for i := 0 to pred(jobbag.Lines.count) do
        begin
          irow := jobbag.Lines[i].Sequence;
//          cells[0,i+1] := inttostr(jobbag.Lines[i].JBLine);
          cells[0,irow] := inttostr(jobbag.Lines[i].Sequence);
          if JobBag.Lines[i].PurchaseOrder <> 0 then
            begin
              cells[1,irow] := 'PO/'+floattostr(jobbag.Lines[i].PurchaseOrder);
            end
          else
          if JobBag.Lines[i].SONumber <> 0 then
            begin
              cells[1,irow] := 'SO/'+inttostr(jobbag.Lines[i].SONumber);
            end
          else
          if JobBag.Lines[i].WorksOrderNumber <> 0 then
            begin
              cells[1,irow] := 'WI/'+floattostr(jobbag.Lines[i].WorksOrderNumber);
            end
          else
            cells[1,irow] := 'Sundry';

          if JobBag.Lines[i].NeedsAuthorising then
            cells[1,irow] := 'N/A';

          cells[2,irow] := jobbag.Lines[i].JBLineDescr;
          cells[3,irow] := inttostr(jobbag.Lines[i].JBQuantity);
          cells[4,irow] := formatfloat('0.0000',jobbag.lines[i].JBLineCost);
          cells[5,irow] := formatfloat('0.0000',jobbag.lines[i].JBLineSell);
          cells[6,irow] := formatfloat('0.0000',jobbag.lines[i].JBLineReseller);
          cells[7,irow] := jobbag.lines[i].JBLineStatusText;

          if jobbag.lines[i].ReadyToInvoice = 'Y' then
            begin
              if jobbag.lines[i].JBLineInvoiced = 'N' then
                LoadImageChecked(irow, 1)
              else
                LoadImageChecked(irow, 2);
            end
          else
            LoadImageChecked(irow, 0);

          cells[9,irow] := jobbag.lines[i].SupplierName;
//          sglines.RowHeights[irow] := -1;
          icount := icount + 1;
        end;

      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  SetButtons;
end;

procedure TPBMaintJobBagFrm.BuildWorksGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgWorks, jobbag.datamodule do
    begin
      for i := 0 to pred(jobbag.Works.count) do
        begin
        cells[0,i+1] := inttostr(jobbag.Works[i].JBWorksOrderNo);
        if jobbag.Works[i].WorksOrderNumber = 0 then
          cells[1,i+1] := '<New WIN>'
        else
          cells[1,i+1] := formatfloat('##0.00',jobbag.Works[i].WorksOrderNumber);
        cells[2,i+1] := formatdatetime('dd/mm/yy hh:mm',jobbag.Works[i].WODate);
        cells[3,i+1] := PBDateStr(jobbag.Works[i].StartDate);
        cells[4,i+1] := PBDateStr(jobbag.Works[i].MailDate);
        cells[5,i+1] := floattostr(jobbag.Works[i].Quantity);
        cells[6,i+1] := jobbag.Works[i].Description;
        cells[7,i+1] := jobbag.Works[i].StatusDescription;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnAddWorks.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnInsertWorks.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnChangeWorks.enabled := not (JobBag.Works.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnCopyWorks.enabled := not (JobBag.Works.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnRepeatWorks.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnDeleteWorks.enabled := not (JobBag.Works.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnPrintWorks.enabled := not (JobBag.Works.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnPrintWorksISO.enabled := not (JobBag.Works.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
end;

procedure TPBMaintJobBagFrm.BuildDeliveryGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgDeliveries, jobbag.datamodule do
    begin
      for i := 0 to pred(jobbag.Deliveries.count) do
        begin
        cells[0,i+1] := inttostr(jobbag.Deliveries[i].DeliveryNo);
        cells[1,i+1] := pbDatestr(JobBag.deliveries[i].DateRequired);
        cells[2,i+1] := jobBag.deliveries[i].DeliveryLocation;
        cells[3,i+1] := formatfloat('0',jobBag.deliveries[i].qtyToDeliver);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnAddDelivery.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnChangeDelivery.enabled := not (JobBag.Deliveries.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnDeleteDelivery.enabled := not (JobBag.Deliveries.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnPrintDeliveryNote.enabled := not (JobBag.Deliveries.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnPrintDeliveryLabel.enabled := not (JobBag.Deliveries.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
end;

procedure TPBMaintJobBagFrm.BuildDocumentGrid;
begin
end;

procedure TPBMaintJobBagFrm.BuildRequestGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgRequests, jobbag.datamodule do
    begin
      for i := 0 to pred(jobbag.Requests.count) do
        begin
        cells[0,i+1] := inttostr(jobbag.Requests[i].JBRequestNo);
        cells[1,i+1] := inttostr(JobBag.Requests[i].SalesOrder);
        cells[2,i+1] := PBDateStr(JobBag.Requests[i].DateRequested);
        cells[3,i+1] := JobBag.Requests[i].PartCode;
        cells[4,i+1] := JobBag.Requests[i].PartDescription;
        cells[5,i+1] := formatfloat('0',JobBag.Requests[i].QtyOrdered);
        cells[6,i+1] := formatfloat('0',JobBag.Requests[i].QtyDespatched);
        cells[7,i+1] := formatfloat('0',JobBag.Requests[i].QtyInvoiced);
        if JobBag.Requests[i].IncludedCharge then
          cells[8,i+1] := 'Included in Charges'
        else
          cells[8,i+1] := JobBag.Requests[i].StatusDescr;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnAddRequest.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnChangeRequest.enabled := not (JobBag.Requests.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnDeleteRequest.enabled := not (JobBag.Requests.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnChargeRequest.enabled := not (JobBag.Requests.count = 0) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);

end;

procedure TPBMaintJobBagFrm.ShowSchedules;
var
  inx: integer;
  JobBagSched: TJobBagSched;
begin
  with jobbag.datamodule do
    begin
      inx := jobbag.schedules.count;
      if inx = 0 then
        begin
          jobbagSched := TjobbagSched.create(JobBag);

          chkbxArtRequired.checked := false;
          edtArtDueInDate.text := '';
          edtArtProofReqDate.text := '';
          edtArtApprovalDate.text := '';

          chkbxDSRequired.checked := false;
          edtDataDueInDate.text := '';
          edtClientBriefInDate.text := '';
          edtTextDueInDate.text := '';

          edtBriefToDSDate.text := '';
          edtDataToDSDate.text := '';
          edtTextToDSDate.text := '';
          edtTextProofReqDate.text := '';

          edtPDFProofArtDate.text := '';
          edtPDFProofAppDate.text := '';
          edtPDFProofReqDate.text := '';

          edtLiveProofReqDate.text := '';
          edtLiveProofAppDate.text := '';

          chkbxSamples.checked := false;
          edtSepClientDate.text := '';
          edtSepApprovalDate.text := '';
          memScheduleNotes.clear;

          cmbApprovalType.ItemIndex := -1;

          JobBagSched.ScheduleDate := now;
          JobBagSched.operator := frmPBMainMenu.iOperator;
          JobBagSched.JBScheduleNo := JobBagSched.Parent.Schedules.Count + 1;
          JobBagSched.Parent.Schedules.Add(JobBagSched);
          lblRevision.caption := 'Revision No: '+ inttostr(JobBagSched.JBScheduleNo);
          lblScheduleDate.caption := 'Date: '+ pbdatestr(JobBagSched.ScheduleDate);
          lblScheduleOp.caption := 'Operator: '+ frmPBMainMenu.sOperator_Name;
        end
      else
      begin
        inx := JobBag.Schedules.IndexOf(inx);
        jobbagSched := JobBag.Schedules[inx];

        chkbxArtRequired.checked := jobbagSched.ArtRequired;
        edtArtDueInDate.text := pbDatestr(jobbagSched.ArtDueDate);
        edtArtProofReqDate.text := pbDatestr(jobbagSched.ArtProofDate);
        edtArtApprovalDate.text := pbDatestr(jobbagSched.ArtApprovalDate);

        if pbDatestr(jobbagSched.ArtDueDateAct) <> '' then
          begin
            chkbxArtDueInDate.Checked := (pbDatestr(jobbagSched.ArtDueDateAct) <> '');
            chkbxArtDueInDate.Hint := pbDatestr(jobbagSched.ArtDueDateAct);
          end;
        if pbDatestr(jobbagSched.ArtProofDateAct) <> '' then
          begin
            chkbxArtProofReqDate.Checked := (pbDatestr(jobbagSched.ArtProofDateAct) <> '');
            chkbxArtProofReqDate.Hint := pbDatestr(jobbagSched.ArtProofDateAct);
          end;
        if pbDatestr(jobbagSched.ArtApprovalDateAct) <> '' then
          begin
            chkbxArtApprovalDate.Checked := (pbDatestr(jobbagSched.ArtApprovalDateAct) <> '');
            chkbxArtApprovalDate.Hint := pbDatestr(jobbagSched.ArtApprovalDateAct);
          end;

        chkbxDSRequired.checked := jobbagSched.DSRequired;
        edtDataDueInDate.text := pbDatestr(jobbagSched.DataRequiredDate);
        edtClientBriefInDate.text := pbDatestr(jobbagSched.BriefRequiredDate);
        edtTextDueInDate.text := pbDatestr(jobbagSched.TextRequiredDate);
        edtBriefToDSDate.text := pbDatestr(jobbagSched.BriefAvailableDate);
        edtDataToDSDate.text := pbDatestr(jobbagSched.DataAvailableDate);
        edtTextToDSDate.text := pbDatestr(jobbagSched.TextAvailableDate);
        edtTextProofReqDate.text := pbDatestr(jobbagSched.TextProofDate);

        edtPDFProofArtDate.text := pbDatestr(jobbagSched.PDFProofArtworkDate);
        edtPDFProofAppDate.text := pbDatestr(jobbagSched.PDFProofApprovalDate);
        edtPDFProofReqDate.text := pbDatestr(jobbagSched.PDFProofRequiredDate);

        edtLiveProofReqDate.text := pbDatestr(jobbagSched.ProofRequiredDate);
        edtLiveProofAppDate.text := pbDatestr(jobbagSched.ProofApprovalDate);

        if pbDatestr(jobbagSched.DataRequiredDateAct) <> '' then
          begin
            chkbxDataDueInDate.Checked := (pbDatestr(jobbagSched.DataRequiredDateAct) <> '');
            chkbxDataDueInDate.Hint := pbDatestr(jobbagSched.DataRequiredDateAct);
          end;
        if pbDatestr(jobbagSched.BriefRequiredDateAct) <> '' then
          begin
            chkbxClientBriefInDate.Checked := (pbDatestr(jobbagSched.BriefRequiredDateAct) <> '');
            chkbxClientBriefInDate.Hint := pbDatestr(jobbagSched.BriefRequiredDateAct);
          end;
        if pbDatestr(jobbagSched.TextRequiredDateAct) <> '' then
          begin
            chkbxTextDueInDate.Checked := (pbDatestr(jobbagSched.TextRequiredDateAct) <> '');
            chkbxTextDueInDate.Hint := pbDatestr(jobbagSched.TextRequiredDateAct);
          end;
        if pbDatestr(jobbagSched.BriefAvailableDateAct) <> '' then
          begin
            chkbxBriefToDSDate.Checked := (pbDatestr(jobbagSched.BriefAvailableDateAct) <> '');
            chkbxBriefToDSDate.Hint := pbDatestr(jobbagSched.BriefAvailableDateAct);
          end;
        if pbDatestr(jobbagSched.DataAvailableDateAct) <> '' then
          begin
            chkbxDataToDSDate.Checked := (pbDatestr(jobbagSched.DataAvailableDateAct) <> '');
            chkbxDataToDSDate.Hint := pbDatestr(jobbagSched.DataAvailableDateAct);
          end;
        if pbDatestr(jobbagSched.TextAvailableDateAct) <> '' then
          begin
            chkbxTextToDSDate.Checked := (pbDatestr(jobbagSched.TextAvailableDateAct) <> '');
            chkbxTextToDSDate.Hint := pbDatestr(jobbagSched.TextAvailableDateAct);
          end;
        if pbDatestr(jobbagSched.TextProofDateAct) <> '' then
          begin
            chkbxTextProofReqDate.Checked := (pbDatestr(jobbagSched.TextProofDateAct) <> '');
            chkbxTextProofReqDate.Hint := pbDatestr(jobbagSched.TextProofDateAct);
          end;

        if pbDatestr(jobbagSched.PDFProofArtworkDateAct) <> '' then
          begin
            chkbxPDFProofArtDate.Checked := (pbDatestr(jobbagSched.PDFProofArtworkDateAct) <> '');
            chkbxPDFProofArtDate.Hint := pbDatestr(jobbagSched.PDFProofArtworkDateAct);
          end;

        if pbDatestr(jobbagSched.PDFProofRequiredDateAct) <> '' then
          begin
            chkbxPDFProofReqDate.Checked := (pbDatestr(jobbagSched.PDFProofRequiredDateAct) <> '');
            chkbxPDFProofReqDate.Hint := pbDatestr(jobbagSched.PDFProofRequiredDateAct);
          end;

        if pbDatestr(jobbagSched.PDFProofApprovalDateAct) <> '' then
          begin
            chkbxPDFProofAppDate.Checked := (pbDatestr(jobbagSched.PDFProofApprovalDateAct) <> '');
            chkbxPDFProofAppDate.Hint := pbDatestr(jobbagSched.PDFProofApprovalDateAct);
          end;

        if pbDatestr(jobbagSched.ProofRequiredDateAct) <> '' then
          begin
            chkbxLiveProofReqDate.Checked := (pbDatestr(jobbagSched.ProofRequiredDateAct) <> '');
            chkbxLiveProofReqDate.Hint := pbDatestr(jobbagSched.ProofRequiredDateAct);
          end;
        if pbDatestr(jobbagSched.ProofApprovalDateAct) <> '' then
          begin
            chkbxLiveProofAppDate.Checked := (pbDatestr(jobbagSched.ProofApprovalDateAct) <> '');
            chkbxLiveProofAppDate.Hint := pbDatestr(jobbagSched.ProofApprovalDateAct);
          end;

        chkbxSamples.checked := jobbagSched.SamplesRequired;
        edtSepClientDate.text := pbDatestr(jobbagSched.SampleToClientDate);
        edtSepApprovalDate.text := pbDatestr(jobbagSched.SampleApprovalDate);

        if pbDatestr(jobbagSched.SampleToClientDateAct) <> '' then
          begin
            chkbxSEPClientDate.Checked := (pbDatestr(jobbagSched.SampleToClientDateAct) <> '');
            chkbxSEPClientDate.Hint := pbDatestr(jobbagSched.SampleToClientDateAct);
          end;
        if pbDatestr(jobbagSched.SampleApprovalDateAct) <> '' then
          begin
            chkbxSEPApprovalDate.Checked := (pbDatestr(jobbagSched.SampleApprovalDateAct) <> '');
            chkbxSEPApprovalDate.Hint := pbDatestr(jobbagSched.SampleApprovalDateAct);
          end;

        if jobbagsched.ApprovalType = 'C' then
          cmbApprovalType.ItemIndex := 0
        else
          cmbApprovalType.ItemIndex := 1;

        memScheduleNotes.text := jobbagsched.NarrativeText;

        lblRevision.caption := 'Revision No: '+ inttostr(JobBagSched.JBScheduleNo);
        lblScheduleDate.caption := 'Date: '+ pbdatestr(JobBagSched.ScheduleDate);
        lblScheduleOp.caption := 'Operator: '+ JobBagSched.OperatorName;
      end;
    end;
  btnNewSchedule.Enabled := (jobbag.Schedules.Count > 0);
  btnHistorySchedule.Enabled := (jobbag.Schedules.Count > 1);
end;

procedure TPBMaintJobBagFrm.CreateNewSchedule;
var
  JobBagSched: TJobBagSched;
begin
  JobbagSched := TJobbagSched.create(JobBag);

  JobBagSched.ScheduleDate := now;
  JobBagSched.operator := frmPBMainMenu.iOperator;
  JobBagSched.JBScheduleNo := JobBagSched.Parent.Schedules.Count + 1;
  JobBagSched.Parent.Schedules.Add(JobBagSched);
  lblRevision.caption := 'Revision No: '+ inttostr(JobBagSched.JBScheduleNo);
end;

procedure TPBMaintJobBagFrm.SetButtons;
begin
  btnChange.Enabled := (JobBag.Lines.count > 0) and (Mode <> jbAdd) and (Mode <> jbRepeat)  and (Mode <> jbConvert) and (Mode <> jbView);
  btnDelete.Enabled := (JobBag.Lines.count > 0) and (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView) ;
  btnAddPO.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnNew.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat)  and (Mode <> jbConvert) and (Mode <> jbView) and bTempCanUpd;
  btnAdd.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView) ;
  btnProduction.Enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnExtras.Enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnNotes.Enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);

  pgDetails.Pages[4].TabVisible := (Mode <> jbAdd) and (Mode <> jbRepeat); {Document tab}

//  chkbxInactive.Enabled := ((Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert)) and (JobBag.JBStatus < 25);
end;

procedure TPBMaintJobBagFrm.SetLineHeaders;
begin
  {Invoice Line header}
  sgLines.cells[0,0] := 'Line';
  sgLines.cells[1,0] := 'Order No';
  sgLines.cells[2,0] := 'Description';
  sgLines.cells[3,0] := 'Quantity';
  sgLines.cells[4,0] := 'Cost';
  sgLines.cells[5,0] := 'Sell';
  sgLines.cells[6,0] := 'Reseller';
  sgLines.cells[7,0] := 'Status';
  sgLines.cells[8,0] := '      Invoice';
  sgLines.cells[9,0] := 'Supplier';

  imgChkbxInvoiceAll.parent := sgLines;
  imgChkbxInvoiceAll.left := cellleft(sgLines,8);
  imgChkbxInvoiceAll.Top := 1;
  imgChkbxInvoiceAll.Tag := 0;
  imgChkbxInvoiceAll.visible := true;
  imgChkbxInvoiceAll.OnClick := InvoiceAllClick;

  sgRequests.cells[0,0] := 'Line';
  sgRequests.cells[1,0] := 'Sales Order';
  sgRequests.cells[2,0] := 'Date';
  sgRequests.cells[3,0] := 'Part';
  sgRequests.cells[4,0] := 'Description';
  sgRequests.cells[5,0] := 'Qty Ordered';
  sgRequests.cells[6,0] := 'Qty Despatched';
  sgRequests.cells[7,0] := 'Qty Invoiced';
  sgRequests.cells[8,0] := 'Status';

  sgWorks.cells[0,0] := 'Line';
  sgWorks.cells[1,0] := 'WI No';
  sgWorks.cells[2,0] := 'Date Created';
  sgWorks.cells[3,0] := 'Start Date';
  sgWorks.cells[4,0] := 'Mail Date';
  sgWorks.cells[5,0] := 'Quantity';
  sgWorks.cells[6,0] := 'Description';
  sgWorks.cells[7,0] := 'Status';

  sgSupply.cells[0,0] := 'Line';
  sgSupply.cells[1,0] := 'Enquiry';
  sgSupply.cells[2,0] := 'Enq Line';
  sgSupply.cells[3,0] := 'Description';
  sgSupply.cells[4,0] := 'Quantity';
  sgSupply.cells[5,0] := 'Total Cost';
  sgSupply.cells[6,0] := 'Total Sell';

    {Invoice Line header}
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

  sgAnalysis.cells[0,0] := '';
  sgAnalysis.cells[1,0] := 'Department';
  sgAnalysis.cells[2,0] := 'Labour';
  sgAnalysis.cells[3,0] := 'Overtime';
  sgAnalysis.cells[4,0] := 'Machine';
  sgAnalysis.cells[5,0] := 'Click';
  sgAnalysis.cells[6,0] := 'Total Costs';
  sgAnalysis.cells[7,0] := 'Est. Costs';

  sgDeliveries.cells[0,0] := 'Line';
  sgDeliveries.cells[1,0] := 'Date';
  sgDeliveries.cells[2,0] := 'Deliver To';
  sgDeliveries.cells[3,0] := 'Quantity';
end;

procedure TPBMaintJobBagFrm.sgLinesDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  inx: integer;
  JobBagLine: TJobBagLine;
  iSelected: integer;
begin
  iSelected := sgLines.row;
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ARow <> 0) and (ACol <> 0) then
      begin
//        Canvas.Brush.Color := clwhite;
        try
          inx := StrToIntDef(sgLines.cells[0, ARow], 0);
          inx := jobbag.Lines.IndexOfSequence(inx);

          if JobBag.Lines.Count > 0  then
          begin
            JobBagLine := JobBag.Lines[inx];

            if JobBagLine.NeedsAuthorising then
              Canvas.Font.Color := clLime
            else
            if JobBagLine.ClearedFundsReq and not JobBagLine.ClearedFundsRec then
              Canvas.Font.Color := clRed
            else
            if JobBagLine.JBLineInactive then
              begin
                Canvas.Font.Color := clSilver;
                Canvas.Font.Style := Font.Style + [fsStrikeOut]
              end
            else
            if ARow = iSelected then
              Canvas.Font.Color := clBlack
            else
              Canvas.Font.Color := Font.Color;
          end;
        except
          Canvas.Font.Color := Font.Color;
        end;

        Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, Cells[ACol, ARow]);
      end;

    if jobbag.Lines.Count > 0 then
    begin
      const Gap = 4;
      var Text := Cells[ACol, ARow];
      var WidthOfText := Canvas.TextWidth(Text);
      var WidthOfCell := ColWidths[ACol];
      var LeftOffset := WidthOfCell - WidthOfText - Gap;

      if (ACol = 0) or (ACol = 2) or (ACol = 7) or (ACol = 8) or (ACol = 9) then
      begin
        if gdFixed in State then
          Canvas.Brush.Color := sgLines.FixedColor else
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
          Canvas.Brush.Color := sgLines.FixedColor else
          if gdSelected in State then
            Canvas.Brush.Color := $00FFF0E1 else
            Canvas.Brush.Color := clWindow;
        Canvas.FillRect(Rect);
        Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
      end;
    end;
  end;
end;

procedure TPBMaintJobBagFrm.sgLinesDblClick(Sender: TObject);
begin
  if (dmBroker.iAccCtrlMenu = 2) or (dmBroker.iAccCtrlMenu = 3) then exit;
  if sgLines.Cells[0,1] <> '' then
    btnChangeClick(self);
end;

procedure TPBMaintJobBagFrm.ShowWorksInstructions;
begin
  if Mode = jbAdd then
    begin
      ClearGrid(sgWorks);  {Clear contents of Line grid}
      BuildWorksGrid;
    end
  else
    begin
      ClearGrid(sgWorks);  {Clear contents of Line grid}
      BuildWorksGrid;
    end;
end;

procedure TPBMaintJobBagFrm.ShowDeliveries;
begin
  ClearGrid(sgDeliveries);  {Clear contents of Line grid}
  BuildDeliveryGrid;
end;

procedure TPBMaintJobBagFrm.ShowDocuments;
//var
//  sPath: string;
begin
//  sPath := dmBroker.GetCompanyJobBagDirectory + '\' + inttostr(JobBag.dbKey) + '\'

  // Assign a Imagelist to the ListView
  lstvwDocuments.Clear;
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;

  // Show the documents and directories associated with the job
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
  lstvwDocumentsColumnClick(lstvwDocuments,lstvwDocuments.Columns[1]);

  tlbrDocuments.Enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  if  (Mode = jbAdd) or
      (Mode = jbRepeat) or
      (Mode = jbConvert) or
      (Mode = jbView) then
        begin
          lstvwDocuments.PopupMenu := pmnDummy;
        end;
end;

procedure TPBMaintJobBagFrm.ShowRequests;
begin
  ClearGrid(sgRequests);  {Clear contents of Line grid}
  BuildRequestGrid;
end;

procedure TPBMaintJobBagFrm.btnChangeWorksClick(Sender: TObject);
begin
  if bComeFromOrder then exit;
  if trim(btnChangeWorks.caption) = '&View' then
    CallMaintWorksOrder(jbwoView)
  else
    CallMaintWorksOrder(jbwoChange);
end;

procedure TPBMaintJobBagFrm.CallMaintWorksOrder(const aMode: TjbwoMode);
var
  inx : integer;
  JBWOrder : TJobBagWOrder;
  aWOrder : TWOrder;
  frm: TfrmPBMaintWorksOrders;
begin
  dtmdlJBWOrders := TdtmdlWOrders.create(self);

  inx := sgWorks.row;
  try
    aWOrder := TWOrder.Create(dtmdlJBWOrders);

    frm := TfrmPBMaintWorksOrders.Create(Self);

    try
      if aMode = jbwoAdd then
        begin
          JBWOrder := TJobBagWOrder.create(JobBag);
          UpdateProcesses;
          JobBag.SaveProcesses
        end
      else
      begin
        inx := JobBag.Works.IndexOf(inx);
        JBWOrder := JobBag.Works[inx];
      end;

      aWOrder.DbKey := JBWOrder.WorksOrder;
      aWOrder.JobBagNo := JobBag.DbKey;
      aWOrder.LoadFromDB;

      if aMode = jbwoChange then
        frm.Mode := woChange
      else
      if aMode = jbwoRepeat then
        begin
          frm.Mode := woRepeat;
          JBWOrder := TJobBagWOrder.create(JobBag);

          if aWOrder.DateRequired < date then
            aWOrder.DateRequired := date;

          if aWOrder.EstimatedStartDate < date then
            aWOrder.EstimatedStartDate := date;

          aWOrder.WOCount := JBWorder.Parent.Works.Count;
        end
      else
      if aMode = jbwoAdd then
        begin
          frm.Mode := woAdd;
          aWOrder.Description := JobBag.Description;
          aWOrder.Customer := JobBag.Customer;
          aWOrder.Branch := JobBag.Branch;
          if pbdatestr(edtDateReq.text) < date then
            aWOrder.DateRequired := date
          else
            aWOrder.DateRequired := pbdatestr(edtDateReq.text);
          if pbdatestr(edtStartDate.text) < date then
            aWOrder.EstimatedStartDate := date
          else
            aWOrder.EstimatedStartDate := pbdatestr(edtStartDate.text);
          aWOrder.CustomerName := JobBag.CustomerName;
          aWOrder.BranchName := JobBag.BranchName;
          aWorder.CustomerPO := JobBag.CustOrderNo;
          aWorder.QuantityAct := StrToFloatDef(memQuantity.text, 0, FormatSettings);
          aWOrder.QuantityEst := StrToFloatDef(memQuantity.text, 0, FormatSettings);
          aWorder.Contact := JobBag.ContactNo;
          aWOrder.Rep := JobBag.Rep;
          aWOrder.OfficeContact := JobBag.OfficeContact;
          aWOrder.AccountManagerName := JobBag.AccountManagerName;
          aWorder.AccountTeam := JobBag.AccountTeam;
          aWOrder.AccountTeamName := JobBag.DataModule.GetAccountTeamName(JobBag.AccountTeam);
          aWOrder.WOCount := JBWorder.Parent.Works.Count;
        end
      else
      if aMode = jbwoView then
        frm.Mode := woView
      else
      if aMode = jbwoDelete then
        frm.Mode := woDelete;

      Frm.WOrder := aWOrder;
      Frm.ComeFromJobBag := true;
      Frm.ShowModal;
      if ((aMode = jbwoAdd) or (aMode = jbwoRepeat)) and (Frm.ModalResult <> mrOK) then
        JBWOrder.Free;
      if Frm.ModalResult = mrOK then
        begin
          JBWOrder.WorksOrder := aWOrder.dbKey;
          JBWOrder.WorksOrderNumber := aWOrder.WONumber;
          JBWorder.Description := aWOrder.Description;
          JBWorder.Quantity := aWOrder.QuantityAct;
          JBWorder.StatusDescription := aWOrder.GetStatusDescription(aWOrder.WOStatus);
          JBWorder.Status := aWOrder.WOStatus;
          JBWorder.WODate := aWOrder.WODate;
          JBWOrder.StartDate := aWOrder.EstimatedStartDate;
          JBWOrder.MailDate := aWOrder.DateRequired;
          if (aMode = jbwoAdd) or (aMode = jbwoRepeat) then
            begin
              JBWorder.JBWorksOrderNo := JBWorder.Parent.Works.Count + 1;
              JBWorder.Parent.Works.Add(JBWorder);
            end;

          if (Mode <> jbView) then
            ShowWorksInstructions;
        end;
    finally
      Frm.Free;
      aWOrder.Free;
    end;
  finally
    dtmdlJBWOrders.free;

    if (aMode = jbwoAdd) then
      begin
        inx := pred(JobBag.Works.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = jbwoDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgWorks.row := inx+1;
  end;
end;

procedure TPBMaintJobBagFrm.btnAddWorksClick(Sender: TObject);
begin
  if bComeFromOrder then exit;
  CallMaintWorksOrder(jbwoAdd);
end;

procedure TPBMaintJobBagFrm.btnDeleteWorksClick(Sender: TObject);
var
  inx, iWO: integer;
  JBWOrder: TJobBagWOrder;
begin
  if bComeFromOrder then exit;
  inx := sgWorks.row;
  inx := JobBag.Works.IndexOf(inx);
  JBWOrder := JobBag.Works[inx];
  if messagedlg('Remove this works instruction from the job bag?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      JBWOrder.Parent.Works.Delete(inx);
      ShowWorksInstructions;
      inx := inx-1;
      if inx < 0 then inx := 0;
      sgWorks.row := inx+1;
    end;
end;

procedure TPBMaintJobBagFrm.sgWorksDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with (Sender as TStringGrid) do
  if jobbag.Works.Count > 0 then
  begin
    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if (ACol >= 0) or (ACol >= 4) then
  	begin
      if gdFixed in State then
        Canvas.Brush.Color := sgWorks.FixedColor else
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
        Canvas.Brush.Color := sgWorks.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end;
  end;
end;

procedure TPBMaintJobBagFrm.sgWorksDblClick(Sender: TObject);
begin
  if (dmBroker.iAccCtrlMenu = 2) or (dmBroker.iAccCtrlMenu = 3) then exit;
  if sgWorks.Cells[0,1] <> '' then
    btnChangeWorksClick(self);
end;

procedure TPBMaintJobBagFrm.sgLinesContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  inx: integer;
  JobBagLine: TJobBagLine;
begin
//  inx := (MousePos.Y div 19);

  if (dmBroker.iAccCtrlMenu = 2) or (dmBroker.iAccCtrlMenu = 3) then exit;

  try
    inx := StrToIntDef(sglines.cells[0,sgLines.row], 0);

    if (inx > 0) and (inx <= JobBag.Lines.count) then
      begin
        inx := StrToIntDef(sgLines.cells[0,inx], 0);
        inx := JobBag.Lines.IndexOfSequence(inx);
        JobBagLine := JobBag.Lines[inx];

        if (JobBagLine.JBLineType = 'S') and (Mode <> jbAdd) and (Mode <> jbRepeat)  and (Mode <> jbConvert) and (Mode <> jbView) then
          sgLines.PopupMenu := pmnSOrders
        else
        if (JobBagLine.JBLineType = 'P') and (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView) then
          sgLines.PopupMenu := pmnPOrders
        else
          sgLines.PopupMenu := pmnFunctions;
      end
    else
      sgLines.PopupMenu := pmnFunctions;
  except
    sgLines.PopupMenu := pmnFunctions;
  end;

  if Mode = jbView then
    sgLines.PopupMenu := nil;
end;

procedure TPBMaintJobBagFrm.mnuPrintStockOrderClick(Sender: TObject);
var
  inx: integer;
  JobBagLine: TJobBagLine;
  bTempOK: Boolean;
  selcode: integer;
  customername: string;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

//  inx := sgLines.row;

  inx := JobBag.Lines.IndexOfSequence(inx);
  JobBagLine := JobBag.Lines[inx];

  CustomerName := edtCustomer.text;
  selcode := JobBagLine.SONumber;
  try
    STRSSalesOrdfrm := TSTRSSalesOrdfrm.create(self);
    STRSSalesOrdfrm.OrderGroupBox.caption := STRSSalesOrdfrm.OrderGroupBox.caption + inttostr(selcode);
    STRSSalesOrdfrm.Customerlbl.caption := CustomerName;
    STRSSalesOrdfrm.OrderDateLbl.caption := edtDate.text;
    STRSSalesOrdfrm.SONumber := selcode;
    STRSSalesOrdfrm.showmodal;
    bTempOK := STRSSalesOrdfrm.bOK;
  finally
    STRSSalesOrdfrm.free;
  end;
end;

procedure TPBMaintJobBagFrm.mnuEditDescriptionClick(Sender: TObject);
begin
  CallMaintDetailsForm(jbChange);
end;

procedure TPBMaintJobBagFrm.CallMaintDetailsForm(aMode: TJBMode);
var
  inx : integer;
  JobBagLine : TJobBagLIne;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

//  inx := sgLines.row;
  try
    PBMaintJobBagLineDetailsFrm := TPBMaintJobBagLineDetailsFrm.Create(Self);
    try
      if aMode = jbAdd then
        JobBagLine := TJobBagLine.Create(JobBag)
      else
      begin
        inx := JobBag.Lines.IndexOfSequence(inx);
        JobBagLine := JobBag.Lines[inx];
        if aMode = jbChange then
          begin
            if (JobBagLine.JBLineInvoiced = 'P') or
               (JobBagLine.JBLineInvoiced = 'Y') then
              begin
                if MessageDlg('Job bag item has been invoiced ' +
                  ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                  Exit;
//                aMode := jbView;
              end
              else
              begin
                if JobBagLine.JBLinePurchInvd then
                begin
                  if MessageDlg('A Supplier invoice has been entered for this item ' +
                    ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                   Exit;
                   // aMode := jbView;
                end;
              end;
          end;
      end;
      PBMaintJobBagLineDetailsFrm.JobBagLine := JobBagLine;
      PBMaintJobBagLineDetailsFrm.Mode := aMode;
      PBMaintJobBagLineDetailsFrm.ShowModal;
    finally
      PBMaintJobBagLineDetailsFrm.Free;
    end;
  finally
    if Mode <> jbView then
      begin
        UpdateInternalCost;
        ShowLineDetails;
      end;
    sgLines.row := inx+1;
  end;
end;

procedure TPBMaintJobBagFrm.mnuProductionClick(Sender: TObject);
var
  i: integer;
  inx: integer;
  JobBagLine: TJobBagLine;
  SONumber: integer;
  bTempOK: boolean;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

//  inx := sgLines.Row;

  inx := JobBag.Lines.IndexOfSequence(inx);
  JobBagLine := JobBag.Lines[inx];

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try

    SONumber := JobBagLine.SONumber;

    SelectSalesOrder(SONumber);

    if (FSOStatus <> 120) then
      begin
        messagedlg('The status of this order is '+ FSOStatusDescr + ' unable to confirm this order', mtInformation,
        [mbOk], 0);
          exit;
      end;


    if (dtmdlJBOrders.GetSOtype(SONumber) <> 'J') then
      begin
        messagedlg('Only Orders associated with Job Bags can be confirmed as complete', mtInformation, [mbOk], 0);
        exit;
      end;

    frmSTMaintSalesOrder := TfrmSTMaintSalesOrder.Create(Self);
    try
      frmSTMaintSalesOrder.Mode := 'C';
      frmSTMaintSalesOrder.SalesOrderNo := SONumber;
      frmSTMaintSalesOrder.JobBagNo := JobBag.dbkey;
      frmSTMaintSalesOrder.ShowModal;
      bTempOK := frmSTMaintSalesOrder.bOK;
      if bTempOK then
        begin
          for i := 0 to pred(JobBag.Lines.count) do
            begin
              if JobBag.Lines[i].SONumber = SONumber then
              begin
                JobBag.Lines[i].JBLineInvoiced := JobBag.DataModule.GetJobBagLineInvoiced(JobBag.DbKey, JobBag.Lines[i].JBLine);
                JobBag.Lines[i].JBQuantity := JobBag.DataModule.GetJobBagLineQty(JobBag.DbKey, JobBag.Lines[i].JBLine);
                JobBag.Lines[i].JBLineCost := JobBag.DataModule.GetJobBagLineCost(JobBag.DbKey, JobBag.Lines[i].JBLine);
                JobBag.Lines[i].JBLineSell := JobBag.DataModule.GetJobBagLineSell(JobBag.DbKey, JobBag.Lines[i].JBLine);
                JobBag.Lines[i].JBLineReseller := JobBag.DataModule.GetJobBagLineReseller(JobBag.DbKey, JobBag.Lines[i].JBLine);
                JobBag.Lines[i].JBLineStatusText := JobBag.DataModule.GetSOStatus(SONumber,JobBag.DbKey,JobBag.Lines[i].JBLine,JobBag.Lines[i].JBLineInvoiced);
              end;
            end;
          UpdateInternalCost;
          ShowLineDetails;
          ShowTotals;
          sgLines.row := inx+1;
        end;
    finally
      frmSTMaintSalesOrder.Free;
    end;
  finally
    dtmdlJBOrders.Free;
  end;
end;

procedure TPBMaintJobBagFrm.btnInsertWorksClick(Sender: TObject);
begin
  CallInsertWOScreen;
end;

procedure TPBMaintJobBagFrm.CallInsertWOScreen;
var
  JBWOrder : TJobBagWOrder;
  selected: boolean;
begin
  JBWOrder := TJobBagWOrder.create(JobBag);

  frmPBLUCustWorksJB := TfrmPBLUCustWorksJB.Create(Self);
  try
    frmPBLUCustWorksJB.bNot_In_JB := True;
    frmPBLUCustWorksJB.Customer := JobBag.Customer;
    frmPBLUCustWorksJB.Branch := JobBag.Branch;
    frmPBLUCustWorksJB.CustomerName :=
      Trim(JobBag.CustomerName) + '/' + Trim(JobBag.BranchName);
    frmPBLUCustWorksJB.ShowModal;
    Selected := frmPBLUCustWorksJB.Selected;
    if not Selected then
      JBWOrder.free
    else
      begin
        JBWOrder.WorksOrder := frmPBLUCustWorksJB.SelCode;
        JBWOrder.WorksOrderNumber := frmPBLUCustWorksJB.SelNumber;
        JBWorder.Description := frmPBLUCustWorksJB.SelDescription;
        JBWorder.Quantity := frmPBLUCustWorksJB.SelQty;
        JBWorder.WODate := frmPBLUCustWorksJB.SelDate;
        JBWOrder.StartDate := frmPBLUCustWorksJB.StartDate;
        JBWOrder.MailDate := frmPBLUCustWorksJB.DateRequired;
        JBWorder.JBWorksOrderNo := JBWorder.Parent.Works.Count + 1;
        JBWorder.Parent.Works.Add(JBWorder);

        ShowWorksInstructions;
      end;
  finally
    frmPBLUCustWorksJB.Free;
  end;
end;

procedure TPBMaintJobBagFrm.CallRepeatWOScreen;
var
  inx: integer;
  key: integer;
  aWOrder : TWOrder;
  JBWOrder : TJobBagWOrder;
  selected: boolean;
  frm: TfrmPBMaintWorksOrders;
begin
  dtmdlJBWOrders := TdtmdlWOrders.create(self);

  aWOrder := TWOrder.Create(dtmdlJBWOrders);

  frmPBLUCustWorksJB := TfrmPBLUCustWorksJB.Create(Self);
  try
    frmPBLUCustWorksJB.bNot_In_JB := False;
    frmPBLUCustWorksJB.Customer := JobBag.Customer;
    frmPBLUCustWorksJB.Branch := JobBag.Branch;
    frmPBLUCustWorksJB.JobBag := JobBag.dbkey;
    frmPBLUCustWorksJB.CustomerName :=
      Trim(JobBag.CustomerName) + '/' + Trim(JobBag.BranchName);
    frmPBLUCustWorksJB.ShowModal;
    Selected := frmPBLUCustWorksJB.Selected;
    if Selected then
      begin
        Key := frmPBLUCustWorksJB.SelCode;
        aWOrder.WOMode := woRepeat;
        aWOrder.DbKey := key;
        aWOrder.LoadFromDB;
        aWOrder.JobBagNo := JobBag.DbKey;
        JBWOrder := TJobBagWOrder.create(JobBag);
        aWOrder.WOCount := JBWorder.Parent.Works.Count;
        Frm := TfrmPBMaintWorksOrders.Create(Self);
        try
          Frm.Mode := woRepeat;
          Frm.WOrder := aWOrder;
          Frm.ComeFromJobBag := true;
          Frm.ShowModal;
          if (Frm.ModalResult <> mrOK) then
            JBWOrder.Free;
          if Frm.ModalResult = mrOK then
            begin
              JBWOrder.WorksOrder := aWOrder.dbKey;
              JBWOrder.WorksOrderNumber := aWOrder.WONumber;
              JBWorder.Description := aWOrder.Description;
              JBWorder.Quantity := aWOrder.QuantityAct;
              JBWorder.WODate := aWOrder.WODate;
              JBWOrder.StartDate := aWOrder.EstimatedStartDate;
              JBWOrder.MailDate := aWOrder.DateRequired;
              JBWorder.JBWorksOrderNo := JBWorder.Parent.Works.Count + 1;
              JBWorder.Parent.Works.Add(JBWorder);

              ShowWorksInstructions;
            end;
        finally
          Frm.Free;
        end;
      end;
  finally
    frmPBLUCustWorksJB.Free;
    aWOrder.Free;
    dtmdlJBWOrders.free;

    inx := pred(JobBag.Works.count);
    if inx < 0 then inx := 0;
    sgWorks.row := inx+1;
  end;
end;

procedure TPBMaintJobBagFrm.CallInsertEnqScreen;
var
  inx: integer;
  rTempPO: real;
  iTempPOLine: Integer;
  Selected : Boolean;
begin
  rTempPO := 0;
  iTempPOLine := 0;
  frmPBLUCustEnqsJB := TfrmPBLUCustEnqsJB.Create(Self);
  try
    frmPBLUCustEnqsJB.Customer := JobBag.Customer;
    frmPBLUCustEnqsJB.Branch := JobBag.Branch;
    frmPBLUCustEnqsJB.JobBagNo := JobBag.dbkey;
    frmPBLUCustEnqsJB.CustomerName :=
      Trim(JobBag.CustomerName) + '/' + Trim(JobBag.BranchName);
    frmPBLUCustEnqsJB.ShowModal;
    Selected := frmPBLUCustEnqsJB.Selected;
    if Selected then
    begin
      rTempPO := frmPBLUCustEnqsJB.SelCode;
      iTempPOLine := frmPBLUCustEnqsJB.SelLine;
    end;
  finally
    frmPBLUCustEnqsJB.Free;
  end;
  if Selected then
  begin
    try
      AddPurchaseOrderFromEnq(rTempPO, iTempPOLine);
    finally
      UpdateInternalCost;
      ShowLineDetails;
      ShowTotals;

      inx := pred(JobBag.Lines.count);
      if inx < 0 then
        inx := 0;
      sgLines.row := inx+1;
    end;
  end;
end;

procedure TPBMaintJobBagFrm.sgLinesRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  inx, icount: integer;
  iLine: integer;
  NewSequence: integer;
  JobBagLine: TJobBagLine;
  NewJobBagLine: TJobBagLine;
begin
  inx := FromIndex;
  inx := JobBag.Lines.IndexOfSequence(inx);
  NewJobBagLine := JobBag.Lines[inx];

  NewJobBagLine.JustMoved := true;
  NewJobBagLine.Sequence := ToIndex;
  sgLines.Cells[0,ToIndex] := inttostr(NewJobBagLine.sequence);

  if FromIndex > ToIndex then
    begin
    NewSequence := ToIndex;

    for icount := 0 to pred(JobBag.lines.count) do
      begin
        iLine := JobBag.Lines[icount].JBLine;
//        inx := JobBag.Lines.IndexOf(icount+1);
        inx := JobBag.Lines.IndexOf(iLine);
        JobBagLine := JobBag.Lines[inx];

        if JobBagLine.JustMoved then
          continue;

        if (JobBagLine.sequence < Toindex) or (JobBagLine.sequence > Fromindex) then
          continue
        else
          begin
            JobBagLine.sequence := JobBagLine.sequence + 1;
            sgLines.Cells[0,JobBagLine.sequence] := inttostr(JobBagLine.sequence);
          end;
      end;
    end
  else
    begin
    NewSequence := FromIndex;

    for icount := 0 to pred(JobBag.lines.count) do
      begin
        iLine := JobBag.Lines[icount].JBLine;
//        inx := JobBag.Lines.IndexOf(icount+1);
        inx := JobBag.Lines.IndexOf(iLine);
        JobBagLine := JobBag.Lines[inx];

        if JobBagLine.JustMoved then
          continue;

        if (JobBagLine.sequence < Fromindex) or (JobBagLine.sequence > Toindex) then
          continue
        else
          begin
            JobBagLine.sequence := JobBagLine.sequence - 1;
            sgLines.Cells[0,JobBagLine.sequence] := inttostr(JobBagLine.sequence);
          end;
      end;
    end;
  sgLines.Row := ToIndex;
  NewJobBagLine.JustMoved := false;
  reloadimages;
end;

procedure TPBMaintJobBagFrm.btnPrintWorksClick(Sender: TObject);
var
  OldCursor : TCursor;
  JBWOrder: TJobBagWOrder;
  key, inx: integer;
  WONumber: real;
  tmpCustomer, tmpDescription: string;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  inx := sgWorks.row;

  inx := JobBag.Works.IndexOf(inx);
  JBWOrder := JobBag.Works[inx];
  try
    frmPBRSWorksOrder := TfrmPBRSWorksOrder.Create( Application );
    Key := JBWOrder.WorksOrder;
    WONumber := JBWOrder.WorksOrderNumber;
    tmpCustomer := JobBag.CustomerName;
    tmpDescription := JBWOrder.Description;

    frmPBRSWorksOrder.WONumber := JBWOrder.WorksOrder;
    frmPBRSWorksOrder.WOStatus := JBWOrder.Status;
    frmPBRSWorksOrder.JobBagNo := JobBag.dbkey;
    frmPBRSWorksOrder.memSelection.text := floattostr(WONumber);
    frmPBRSWorksOrder.edtCustomer.text := tmpCustomer;
    frmPBRSWorksOrder.memDescription.text := tmpDescription;
    frmPBRSWorksOrder.showmodal;
    JBWorder.Status := frmPBRSWorksOrder.WOStatus;

  finally
    frmPBRSWorksOrder.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TPBMaintJobBagFrm.btnCopyWorksClick(Sender: TObject);
begin
  if bComeFromOrder then exit;
  CallMaintWorksOrder(jbwoRepeat);
end;

procedure TPBMaintJobBagFrm.mnuConvertClick(Sender: TObject);
begin
  CallInsertEnqScreen;
end;

procedure TPBMaintJobBagFrm.mnuReturnsReportClick(Sender: TObject);
var
  inx: integer;
  JobBagLine: TJobBagLine;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

  inx := JobBag.Lines.IndexOfSequence(inx);
  JobBagLine := JobBag.Lines[inx];

  STRSSOProdReturnsfrm := TSTRSSOProdReturnsfrm.Create(self);
  try
    STRSSOProdReturnsfrm.lblJobBag.caption := inttostr(JobBagLine.parent.DbKey);
    STRSSOProdReturnsfrm.lblDescription.caption := JobBagLine.parent.Description;
    STRSSOProdReturnsfrm.showmodal;
  finally
    STRSSOProdReturnsfrm.free;
  end
end;

procedure TPBMaintJobBagFrm.btnRepeatWorksClick(Sender: TObject);
begin
  CallRepeatWOScreen;
end;

procedure TPBMaintJobBagFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);

  try
    PBAuditDataMod.WriteAudit(4, JobBag.dbKey, 0, 0, 0, self.Caption) ;
  except
  end;
end;

procedure TPBMaintJobBagFrm.sgLinesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i: integer;
begin
  if ssRight in Shift then
    sgLines.row := (Y div 19) + (sgLines.TopRow - 1);

  if X <= sgLines.DefaultColWidth then
    begin
      OldCursor := screen.cursor;
      screen.cursor := crMultiDrag;
    end;
end;

procedure TPBMaintJobBagFrm.sgLinesMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  screen.cursor := oldcursor;
end;

function TPBMaintJobBagFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;

  {this is for the fixed column}
  t := t + grid.ColWidths[0] + grid.gridlinewidth;
  for i := grid.leftcol to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t + grid.gridlinewidth;
end;

function TPBMaintJobBagFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Top;

  t := t + grid.RowHeights[0] + grid.gridlinewidth;
  for i := grid.toprow to Row - 1 do
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  Result := t + grid.gridlinewidth;
end;

function TPBMaintJobBagFrm.celltopNew(grid: TStringGrid; Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.Top - grid.gridlinewidth;

  t := t + grid.RowHeights[0] + grid.gridlinewidth;
  for i := grid.TopRow to Row - 1 do
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  Result := t + grid.gridlinewidth;
end;

procedure TPBMaintJobBagFrm.chkbxLineReadyToInvoiceClick(Sender: TObject);
begin
  with sgLines do
  begin
    if chkbxLineReadyToInvoice.checked then
      cells[8,row] := 'Invoice'
    else
      cells[8,row] := '';
  end;

end;

procedure TPBMaintJobBagFrm.LoadImageChecked(tempRow, iChecked: integer);
var
  myImage: TImage;
  tempName: string;
begin
    myImage := TImage.Create(Self);
    tempName := 'img' + Copy((IntToStr(1000 + temprow)),2,3)+'I'+inttostr(iChecked);
    myImage.name := tempname;
    myImage.Parent := sgLines;
    myImage.Left := cellleft(sgLines,8);
    myImage.Top := celltop(sgLines,tempRow);
    myImage.Width := imgChkbxChecked.width;
    myImage.Height := imgChkbxChecked.height;
    if iChecked = 2 then
      myImage.picture := imgChkbxGreyed.picture
    else
    if iChecked = 0 then
      myImage.picture := imgChkbxUnChecked.picture
    else
      myImage.picture := imgChkBxChecked.picture;
    myImage.Tag := iChecked;
    myImage.visible := true;
    myImage.OnClick := ImageClick
end;

procedure TPBMaintJobBagFrm.ImageClick(Sender: TObject);
var
  iLine: integer;
  iChecked: integer;
  myImage: TImage;
begin
  if dmBroker.iAccCtrlMenu = 3 then exit;
  iLine := StrToIntDef(copy((Sender as TImage).name,4,3), 0);

  for iChecked := 0 to 2 do
    if iChecked <> (Sender as TImage).tag then
      begin
        myImage :=  findcomponent('img'+Copy((IntToStr(1000 + iLine)),2,3)+'I'+inttostr(iChecked)) as TImage;
        myImage.Free;
      end;

  {Setting Checked}
  if (Sender as TImage).tag = 0 then
    begin
      LoadImageChecked(iLine,1);
      (Sender as TImage).sendtoback;
      (Sender as TImage).visible := false;
      JobBag.Lines[iLine-1].ReadyToInvoice := 'Y';
    end
  else
  {Unchecking}
  if (Sender as TImage).tag = 1 then
    begin
      LoadImageChecked(iLine,0);
      (Sender as TImage).sendtoback;
      (Sender as TImage).visible := false;
      JobBag.Lines[iLine-1].ReadyToInvoice := 'N'
    end
  else
    begin
      exit;
    end;
end;

procedure TPBMaintJobBagFrm.InvoiceAllClick(Sender: TObject);
var
  iLine, iChecked: integer;
  myImage: TImage;
  bCheckedOn: boolean;
begin
  if dmBroker.iAccCtrlMenu = 3 then exit;

  with (Sender as TImage) do
    begin
      visible := false;
      if Tag = 0 then
        begin
          picture := imgChkbxChecked.picture;
          tag := 1;
          bCheckedOn := true;
        end
      else
        begin
          picture := imgChkbxUnChecked.picture;
          tag := 0;
          bCheckedOn := false;
        end;

      for iline := 1 to JobBag.Lines.count do
        begin
          if (JobBag.Lines[iLine-1].JBLineInvoiced = 'Y') then
            continue;

          if not bCheckedOn and (JobBag.Lines[iLine-1].ReadyToInvoice = 'Y') then
            begin
              for iChecked := 0 to 2 do
                begin
                  myImage := self.findcomponent('img'+Copy((IntToStr(1000 + iLine)),2,3)+'I'+inttostr(iChecked)) as TImage;
                  try
                    myImage.Free;
                  except
                  end;
                end;
              LoadImageChecked(iLine,0);
              JobBag.Lines[iLine-1].ReadyToInvoice := 'N';
            end
          else
          if bCheckedOn and ((JobBag.Lines[iLine-1].ReadyToInvoice = 'N') or (JobBag.Lines[iLine-1].ReadyToInvoice = '')) then
            begin
              for iChecked := 0 to 2 do
                begin
                  myImage := self.findcomponent('img'+Copy((IntToStr(1000 + iLine)),2,3)+'I'+inttostr(iChecked)) as TImage;
                  try
                    myImage.Free;
                  except
                  end;
                end;
              LoadImageChecked(iLine,1);
              JobBag.Lines[iLine-1].ReadyToInvoice := 'Y';
            end;
        end;
      visible := true;
    end;

end;

procedure TPBMaintJobBagFrm.sgLinesTopLeftChanged(Sender: TObject);
var
  icount: integer;
  iLine, iRow: integer;
  myImage: TImage;
begin
  for icount := 0 to pred(componentcount) do
    if (Components[icount] is TImage) then
      begin
        try
          myImage := (Components[icount] as TImage);
          (Components[icount] as TImage).Left := cellleft(sgLines,7);
          iRow := StrToIntDef(copy((Components[icount] as TImage).name,4,3), 0);
          if iRow >= sgLines.TopRow then
            begin
              (Components[icount] as TImage).Top := celltop(sgLines,iRow);
              (Components[icount] as TImage).visible := true;
            end
          else
            (Components[icount] as TImage).visible := false;

        except
        end;
      end;
end;

procedure TPBMaintJobBagFrm.ReLoadImages;
var
  iline, iChecked: integer;
  inx: integer;
  myImage: TImage;
  JobBagLine: TJobBagLine;
begin
  for iline := 1 to pred(sgLines.rowcount) do
    begin
      for iChecked := 0 to 2 do
        begin
          try
            myImage :=  findcomponent('img'+Copy((IntToStr(1000 + iLine)),2,3)+'I'+inttostr(iChecked)) as TImage;
            myImage.Free;
          except
          end;
        end;
    end;

  for iline := 1 to pred(sgLines.rowcount) do
    begin
      inx := jobbag.Lines.IndexOfSequence(iline);
      JobBagLine := JobBag.Lines[inx];

      if (JobBagLine.ReadyToInvoice = 'Y') and (JobBagLine.JBLineInvoiced = 'Y') then
        LoadImageChecked(iline,2)
      else
      if (JobBagLine.ReadyToInvoice = 'Y') then
        LoadImageChecked(iline,1)
      else
        LoadImageChecked(iline,0);

    end;
end;

procedure TPBMaintJobBagFrm.mnuEditSOPricesClick(Sender: TObject);
var
  i: integer;
  inx: integer;
  JobBagLine: TJobBagLine;
  SONumber: integer;
  bTempOK: boolean;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

//  inx := sgLines.Row;

  inx := JobBag.Lines.IndexOfSequence(inx);
  JobBagLine := JobBag.Lines[inx];

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try

    SONumber := JobBagLine.SONumber;

    SelectSalesOrder(SONumber);

    if (dtmdlJBOrders.SOInvoiced(SONumber)) then
      begin
        messagedlg('This order has been invoiced, unable to change the cost and sell prices', mtInformation,
        [mbOk], 0);
          exit;
      end;

    frmSTMaintSalesOrder := TfrmSTMaintSalesOrder.Create(Self);
    try
      frmSTMaintSalesOrder.Mode := 'J';
      frmSTMaintSalesOrder.SalesOrderNo := SONumber;
      frmSTMaintSalesOrder.JobBagNo := JobBag.dbkey;
      frmSTMaintSalesOrder.ShowModal;
      bTempOK := frmSTMaintSalesOrder.bOK;
      if bTempOK then
        begin
          for i := 0 to pred(JobBag.Lines.count) do
            begin
              if JobBag.Lines[i].SONumber = SONumber then
              begin
                JobBag.Lines[i].JBLineInvoiced := JobBag.DataModule.GetJobBagLineInvoiced(JobBag.DbKey, JobBag.Lines[i].JBLine);
                JobBag.Lines[i].JBQuantity := JobBag.DataModule.GetJobBagLineQty(JobBag.DbKey, JobBag.Lines[i].JBLine);
                JobBag.Lines[i].JBLineCost := JobBag.DataModule.GetJobBagLineCost(JobBag.DbKey, JobBag.Lines[i].JBLine);
                JobBag.Lines[i].JBLineSell := JobBag.DataModule.GetJobBagLineSell(JobBag.DbKey, JobBag.Lines[i].JBLine);
                JobBag.Lines[i].JBLineReseller := JobBag.DataModule.GetJobBagLineReseller(JobBag.DbKey, JobBag.Lines[i].JBLine);
                JobBag.Lines[i].JBLineStatusText := JobBag.DataModule.GetSOStatus(SONumber,JobBag.DbKey,JobBag.Lines[i].JBLine,JobBag.Lines[i].JBLineInvoiced);
              end;
            end;
          UpdateInternalCost;
          ShowLineDetails;
          ShowTotals;
          sgLines.row := inx+1;
        end;
    finally
      frmSTMaintSalesOrder.Free;
    end;
  finally
    dtmdlJBOrders.Free;
  end;
end;

procedure TPBMaintJobBagFrm.chkbxReadytoInvoiceClick(Sender: TObject);
begin
  lblJobRevenue.enabled := chkbxReadytoInvoice.Checked;
  dblkpJobRevenue.Enabled := chkbxReadytoInvoice.Checked;
  if FActivated then
    bInvoiceChange := chkbxReadytoInvoice.Checked;
end;

procedure TPBMaintJobBagFrm.dblkpJobRevenueClick(Sender: TObject);
begin
  JobBag.InvoiceLocation := dblkpJobRevenue.KeyValue;
end;

procedure TPBMaintJobBagFrm.CallMaintDocuments(const aMode: TjbdocMode);
begin
end;

procedure TPBMaintJobBagFrm.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docdir, compdir, docExt: string;
  document: TDocument;
  JobBagDoc: TJobBagDoc;
  inx: integer;
begin
  docDir := dmBroker.GetCompanyJobBagDirectory + '\' + inttostr(JobBag.DbKey);
  compDir := dmBroker.GetCompanyJobBagDirectory;

  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  with IniFile do
    FEmailApplication := ReadString('Email', 'Application', 'None');

  sBody := '';
  sfilePath := docdir;
  okToSave := false;

  EmailAndSaveViaOutlook(sTo,sSubject,sBody,sFilePath,okToSave, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

  if okToSave then
    begin
      ShowDocuments;
    end;
end;

procedure TPBMaintJobBagFrm.ShowSalesInvoices;
begin
  with JobBag.DataModule.qryAllSalesInvoices do
    begin
      close;
      parambyname('Job_Bag').asinteger := JobBag.dbkey;
      open;

      btnViewSI.enabled := not (recordcount = 0) and (Mode <> jbRepeat);
      btnRePrintSI.enabled := not (recordcount = 0) and (Mode <> jbRepeat);
    end;

  rTotalSI := JobBag.DataModule.GetJobBagTotalSalesInvoiced(JobBag.dbKey);
  memTotalSI.text := formatfloat('£#,###,##0.00',rTotalSI);
end;

procedure TPBMaintJobBagFrm.ShowDataCollection;
var
  rTotalLabour, rTotalOvertime, rTotalMachine: double;
  iJobBag, iDept: integer;
begin
  with JobBag.DataModule.qryDataCollect do
    begin
      close;
      parambyname('Job_Bag').asinteger := JobBag.dbkey;
      if cmbDepartment.itemindex = 0 then
        begin
          parambyname('Process_Group').asinteger := 0;
          iDept := 0;
        end
      else
        begin
          JobBag.DataModule.qryDepartments.first;
          JobBag.DataModule.qryDepartments.moveby(cmbDepartment.ItemIndex - 1);
          parambyname('Process_Group').asinteger := JobBag.DataModule.qryDepartments.fieldbyname('Process_group').asinteger;
          iDept := JobBag.DataModule.qryDepartments.fieldbyname('Process_group').asinteger;
        end;
      open;
    end;

  iJobBag := JobBag.dbkey;
  JobBag.DataModule.GetDataCollectTotals(iJobBag, iDept, rTotalLabour, rTotalOvertime, rTotalMachine);
  lblLabourHours.caption := 'Total Labour Hours: ' + formatfloat('##0.00',rTotalLabour);
  lblOvertimeHours.caption := 'Total Overtime Hours: ' + formatfloat('##0.00',rTotalOvertime);
  lblMachineHours.caption := 'Total Machine Hours: ' + formatfloat('##0.00',rTotalMachine);

end;

procedure TPBMaintJobBagFrm.ShowAnalysis;
var
  tempStr: string;
  inx, hashpos: integer;
  slproduction: TStringList;
  rMargin, rMarginPerc, rTotalCosts, rTotalSales, rTotalProduction: double;
  rlabour, rOvertime, rMachine, rClick, rDeptTotal, rEstimated: double;
  rlabourTot, rOvertimeTot, rMachineTot, rClickTot, rEstimatedTot, rTotal: double;
  sDepartment: string;
begin
  ClearGrid(sgAnalysis);

  rlabourTot := 0.00;
  rOvertimeTot := 0.00;
  rMachineTot := 0.00;
  rClickTot := 0.00;
  rTotal := 0.00;
  rEstimatedTot := 0.00;

  slProduction := TStringList.Create;
  try
    JobBag.DataModule.GetDataCollectCosts(JobBag.dbkey, slProduction);

    if slProduction.Count > 0 then
      begin
        sgAnalysis.RowCount := slProduction.Count + 1;
        pnlDataAnalysis.height := (slProduction.Count * 19) + 48;
      end
    else
      begin
        sgAnalysis.RowCount := 2;
        pnlDataAnalysis.height := 0
      end;

    for inx := 0 to (slProduction.Count - 1) do
    begin
      tempStr := slProduction[inx];

      hashPos := pos('#', tempStr);
      sDepartment := copy(tempStr, 1, hashPos-1);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));

      {Total labour}
      hashPos := pos('#', tempStr);
      rLabour := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      rLabourTot := rLabourTot + rLabour;

      {Total overtime}
      hashPos := pos('#', tempStr);
      rOvertime := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      rOvertimeTot := rOvertimeTot + rOvertime;

      {Total machine charge}
      hashPos := pos('#', tempStr);
      rMachine := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      rMachineTot := rmachineTot + rMachine;

      {Total click charge}
      hashPos := pos('#', tempStr);
      rClick := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));
      rClickTot := rClicktot + rClick;

      {Total for this dept}
      hashPos := pos('#', tempStr);
      tempStr := copy(tempStr, hashPos + 1, length(tempStr));

      {Total Estimated}
      try
        hashPos := pos('#', tempStr);
        rEstimated := StrToFloatDef(copy(tempStr, 1, hashPos-1), 0, FormatSettings);
        tempStr := copy(tempStr, hashPos + 1, length(tempStr));
        rEstimatedTot := rEstimatedTot + rEstimated;
      except
        rEstimated := 0;
        rEstimatedTot := rEstimatedTot + 0;
      end;

      rDeptTotal := rLabour + rOvertime + rMachine + rClick;

      sgAnalysis.Cells[1, inx+1] := sDepartment;
      sgAnalysis.Cells[2, inx+1] := formatfloat('£#,##0.00',rLabour);
      sgAnalysis.Cells[3, inx+1] := formatfloat('£#,##0.00',rOvertime);
      sgAnalysis.Cells[4, inx+1] := formatfloat('£#,##0.00',rMachine);
      sgAnalysis.Cells[5, inx+1] := formatfloat('£#,##0.00',rClick);
      sgAnalysis.Cells[6, inx+1] := formatfloat('£#,##0.00',rDeptTotal);
      sgAnalysis.Cells[7, inx+1] := formatfloat('£#,##0.00',rEstimated);
    end;
  finally
    slProduction.Free;
  end;

  rTotalProduction := rLabourTot + rOvertimeTot + rMachineTot + rClickTot;

  rTotalcosts :=  rTotalProduction + rTotalPI;
  rTotalSales := rTotalSI;
  rMargin := rTotalSales - rTotalCosts;

  if rTotalSales <> 0 then
    rMarginPerc := (rMargin / rTotalSales)*100
  else
    rMarginPerc := -999.99;

  memTotalLabour.Text := formatfloat('£#,##0.00',rLabourTot);
  memTotalOvertime.Text := formatfloat('£#,##0.00',rOvertimeTot);
  memTotalMachine.Text := formatfloat('£#,##0.00',rMachineTot);
  memTotalClick.Text := formatfloat('£#,##0.00',rClickTot);
  memTotalProductionCost.Text := formatfloat('£#,##0.00',rTotalProduction);


  memTotalMarginAnalysis.Text := formatfloat('£#,##0.00;(£#,##0.00)',rMargin);
  memMarginPercAnalysis.Text := formatfloat('#,##0.00;(#,##0.00)',rMarginPerc);

  with memTotalMarginAnalysis do
    begin
      if rMargin < 0 then
        Font.color := clred
      else
        Font.color := clblack
    end;
  memMarginPercAnalysis.Font.Color := memTotalMarginAnalysis.Font.Color;

  {Now do the Budget figures}
  memBudgetEstimated.text := formatfloat('£#,##0.00',rEStimatedTot);
  memBudgetPOAnalysis.Text := labTotalCost.caption;
  memBudgetSalesAnalysis.Text := labTotalSell.caption;

  rMargin := JobBag.TotalSell - JobBag.TotalCost - rEstimatedTot;
  if JobBag.TotalSell = 0 then
    rMarginPerc := -999.99
  else
    rMarginPerc := (rMargin / JobBag.TotalSell)*100;

  memBudgetMargin.Text := formatfloat('£#,##0.00;(£#,##0.00)',rMargin);
  memBudgetMarginPerc.Text := formatfloat('#,##0.00;(#,##0.00)',rMarginPerc);

  lblPICount.caption := inttostr(JobBag.DataModule.qryAllPurchInvoices.recordcount) + ' invoice/credits from ' + inttostr(JobBag.TotalPOCount) + ' purchase orders';

end;

procedure TPBMaintJobBagFrm.ShowPurchaseInvoices;
begin
  with JobBag.DataModule.qryAllPurchInvoices do
    begin
      close;
      parambyname('Job_Bag').asinteger := JobBag.dbkey;
      open;
      btnViewPI.enabled := not (recordcount = 0) and (Mode <> jbRepeat);

    end;
  rTotalPI := JobBag.DataModule.GetJobBagTotalPurchInvoiced(JobBag.dbKey);
  memTotalPI.text := formatfloat('£#,###,##0.00',rTotalPI);
end;

procedure TPBMaintJobBagFrm.btnViewSIClick(Sender: TObject);
var
  Key : integer;
  frm : TPBMaintSalesInvoicefrm;
  aInvoice : TSalesInvoice;
  dmJBSalesInvoice: TdmSalesInvoice;
begin
  Key := dbgSalesInvoices.DataSource.DataSet.fieldbyname('Sales_Invoice').asinteger;
  if MessageDlg('You only have access to view the selected invoice, continue?', mtConfirmation,
    [mbOk,mbCancel], 0) = mrCancel then exit;

  dmJBSalesInvoice := TdmSalesInvoice.create(self);
  try
  aInvoice := TSalesInvoice.Create(dmJBSalesInvoice);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TPBMaintSalesInvoicefrm.Create(Self);
      try
        Frm.Mode := siView;
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
    dmJBSalesInvoice.free;
  end;
end;

procedure TPBMaintJobBagFrm.btnRePrintSIClick(Sender: TObject);
var
  key: string;
begin
  key := dbgSalesInvoices.datasource.dataset.fieldbyname('Sales_invoice_no').asstring;

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

procedure TPBMaintJobBagFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBMaintJobBagFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TPBMaintJobBagFrm.dbgSalesInvoicesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgSalesInvoices.datasource.dataset.fieldbyname('Invoice_or_credit').asstring = 'C') then
    begin
      (Sender as TDBGrid).Canvas.font.Color := clRed;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'Total') and
      (Column.Title.Caption <> 'Goods') and
      (Column.Title.Caption <> 'Vat') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
     end
  else
  	begin
    		WITH Sender AS TDBGrid DO
      		BEGIN
           	if (Column.Title.Caption <> 'Goods') and
               (Column.Title.Caption <> 'Total') and
               (Column.Title.Caption <> 'Vat') then
              	begin
                  Canvas.Brush.Color := Color;
                  Canvas.Font.Color  := Font.Color;
                  Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2, Column.field.asstring);
                end;
      		END;
			{Display the Columns Right justified in the cells}
      if Assigned(Column.Field) then
      begin
        if  (Column.Title.Caption = 'Goods') or
            (Column.Title.Caption = 'Total') or
            (Column.Title.Caption = 'Vat') then
        begin
          TNumericField(Column.Field).DisplayFormat := '£#,###,##0.00';
        end;

        Column.Alignment := taRightJustify;
      end;
    end;
end;

procedure TPBMaintJobBagFrm.dbgSalesInvoicesDblClick(Sender: TObject);
begin
  if btnViewSI.Enabled then
    btnViewSIClick(self);
end;

procedure TPBMaintJobBagFrm.ParseMessage(const AFileName: string; var ATo, AFrom,
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

function TPBMaintJobBagFrm.ParseDocumentFrom(tmpFrom: string): string;
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

function TPBMaintJobBagFrm.FormatDateasDateTime(sDate: string): TDateTime;
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

procedure TPBMaintJobBagFrm.chkbxArtRequiredClick(Sender: TObject);
var
  icount: integer;
begin
  scrlArtwork.Enabled := (sender as TCheckbox).Checked;
  JobBag.ArtRequired := (sender as TCheckbox).Checked;
  for icount := 0 to pred(self.ComponentCount) do
    if self.Components[icount] is TEdit then
      begin
        if (self.Components[icount] as TEdit).tag = 10 then
          if (sender as TCheckbox).Checked then
            (self.Components[icount] as TEdit).color := clwhite
          else
            (self.Components[icount] as TEdit).color := clbtnFace;
      end
    else
    if self.Components[icount] is TBitBtn then
      begin
        if (self.Components[icount] as TBitBtn).tag = 10 then
          (self.Components[icount] as TBitBtn).enabled := (sender as TCheckbox).Checked;
      end;
end;

procedure TPBMaintJobBagFrm.chkbxDSRequiredClick(Sender: TObject);
var
  icount: integer;
begin
  scrlDataServices.Enabled := (sender as TCheckbox).Checked;
  JobBag.DSRequired := (sender as TCheckbox).Checked;
  for icount := 0 to pred(self.ComponentCount) do
    if self.Components[icount] is TEdit then
      begin
        if ((self.Components[icount] as TEdit).tag = 20) then
          if (sender as TCheckbox).Checked then
            (self.Components[icount] as TEdit).color := clwhite
          else
            (self.Components[icount] as TEdit).color := clbtnFace;
      end
    else
    if self.Components[icount] is TComboBox then
      begin
        if ((self.Components[icount] as TComboBox).tag = 20) then
          if (sender as TCheckbox).Checked then
            (self.Components[icount] as TComboBox).color := clwhite
          else
            (self.Components[icount] as TComboBox).color := clbtnFace;
      end
    else
    if self.Components[icount] is TBitBtn then
      begin
        if (self.Components[icount] as TBitBtn).tag = 20 then
          (self.Components[icount] as TBitBtn).enabled := (sender as TCheckbox).Checked;
      end;
end;

procedure TPBMaintJobBagFrm.chkbxSamplesClick(Sender: TObject);
var
  icount: integer;
begin
  scrlSamples.Enabled := (sender as TCheckbox).Checked;
  JobBag.SamplesRequired := (sender as TCheckbox).Checked;
  for icount := 0 to pred(self.ComponentCount) do
    if self.Components[icount] is TEdit then
      begin
        if (self.Components[icount] as TEdit).tag = 30 then
          if (sender as TCheckbox).Checked then
            (self.Components[icount] as TEdit).color := clwhite
          else
            (self.Components[icount] as TEdit).color := clbtnFace;
      end
    else
    if self.Components[icount] is TBitBtn then
      begin
        if (self.Components[icount] as TBitBtn).tag = 30 then
          (self.Components[icount] as TBitBtn).enabled := (sender as TCheckbox).Checked;
      end;
end;

procedure TPBMaintJobBagFrm.FormResize(Sender: TObject);
begin
  self.pnlArtwork.Width := trunc(self.tsSchedule.Width / 3);
  self.pnlSamples.Width := trunc(self.tsSchedule.Width / 3);
  self.pnlPInvoices.height := trunc(((self.tsInvoicing.height)/2));
end;

procedure TPBMaintJobBagFrm.edtArtDueInDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).Text) = '' then
    exit;

  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;

  (Sender as TEdit).Text := PBDatestr(NewDate);
end;

procedure TPBMaintJobBagFrm.btnArtDueInDateClick(Sender: TObject);
var
  NewDate: TDateTime;
  myEdit: TEdit;
  temp: string;
begin
  temp := stringreplace((Sender as TBitBtn).Name,'btn','edt',[rfIgnoreCase]);
  myEdit := (findcomponent(temp) as TEdit);
  try
    NewDate := InputDate(StrToDate(myEdit.text));
  except
    NewDate := InputDate(date);
  end;
  myEdit.Text := PBDatestr(NewDate);
end;

function TPBMaintJobBagFrm.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintJobBagFrm.BitBtn6Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtStartDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtStartDate.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintJobBagFrm.SetProperties;
begin
  pnlProduction.Visible := dmBroker.ConfirmProduction;
  if Mode = jbChange then
    begin
      edtJobBag.Enabled := false;
//      edtDate.enabled := false;
//      btnDate.Visible := false
    end;
end;

procedure TPBMaintJobBagFrm.SetSchedMode(const Value: TJBSchMode);
begin
  FSchedMode := Value;
end;

procedure TPBMaintJobBagFrm.btnNewScheduleClick(Sender: TObject);
begin
  if messagedlg('Do you want to create a new schedule revision', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      CreateNewSchedule;
    end;
end;

procedure TPBMaintJobBagFrm.btnHistoryScheduleClick(Sender: TObject);
begin
  PBMaintJobBagSchedFrm := TPBMaintJobBagSchedFrm.create(self);
  try
    PBMaintJobBagSchedFrm.JobBag := JobBag;
    PBMaintJobBagSchedFrm.showmodal;
  finally
    PBMaintJobBagSchedFrm.free;
  end;
end;

procedure TPBMaintJobBagFrm.chkbxArtDueInDateClick(Sender: TObject);
var
  NewDate: TDateTime;
  myCheckbox: TCheckbox;
  temp: string;
begin
  if not FActivated then exit;

  if (Sender as TCheckbox).checked <> true then
    begin
      (Sender as TCheckbox).hint := '';
      exit;
    end
  else
    (Sender as TCheckbox).hint := PBDatestr(date);

end;

procedure TPBMaintJobBagFrm.btnAddRequestClick(Sender: TObject);
begin
  CallMaintStockRequest('A');
end;

procedure TPBMaintJobBagFrm.btnChangeRequestClick(Sender: TObject);
begin
  CallMaintStockRequest('C');
end;

procedure TPBMaintJobBagFrm.sgRequestsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with (Sender as TStringGrid) do
  if jobbag.Lines.Count > 0 then
  begin
    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if (ACol = 5) or (ACol = 6) or (ACol = 7) then
  	begin
			{Display the Columns Right justified in the cells}

      if gdFixed in State then
        Canvas.Brush.Color := sgRequests.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end
    else
  	begin
      if gdFixed in State then
        Canvas.Brush.Color := sgRequests.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end;
  end;
end;

procedure TPBMaintJobBagFrm.sgRequestsDblClick(Sender: TObject);
begin
  if (dmBroker.iAccCtrlMenu = 2) or (dmBroker.iAccCtrlMenu = 3) then exit;
  if sgRequests.Cells[0,1] <> '' then
    btnChangeRequestClick(self);
end;

procedure TPBMaintJobBagFrm.pmnRequestsPopup(Sender: TObject);
var
  inx: integer;
  JobBagRequest: TJobBagRequest;
begin
  try
    inx := StrToIntDef(sgRequests.cells[0,sgRequests.row], 0);
  except
    mnuRequestChange.enabled := false;
    mnuRequestPrint.Enabled := false;
    mnuRequestAllocate.enabled := false;
    mnuRequestDeAllocate.enabled := false;
    mnuRequestConfirm.enabled := false;
    mnuRequestEditSOPrices.enabled := false;
    mnuRequestPickNote.enabled := false;
    exit;
  end;

  if JobBag.Requests.Count > 0 then
  begin
    inx := jobbag.Requests.IndexOf(inx);
    JobBagRequest := JobBag.Requests[inx];

    dtmdlJBOrders := TdtmdlOrders.create(self);
    try
      SelectSalesOrder(JobBagRequest.SalesOrder);
      mnuRequestAllocate.enabled := (FSOStatus >= 10) and (FSOStatus < 50);
      mnuRequestDeAllocate.enabled := (FSOStatus >= 50) and (FSOStatus < 100);
      mnuRequestConfirm.enabled := (FSOStatus >= 100) and (FSOStatus < 150) and (FSOStatus <> 120);
      mnuRequestEditSOPrices.enabled := (FSOStatus >= 140);
    finally
      dtmdlJBOrders.free;
    end;
  end;
end;

procedure TPBMaintJobBagFrm.mnuRequestChangeClick(Sender: TObject);
begin
  btnChangeRequestClick(self);
end;

procedure TPBMaintJobBagFrm.btnDeleteRequestClick(Sender: TObject);
var
  inx, irow: integer;
  JobBagRequest: TJobBagRequest;
begin
  inx := StrToIntDef(sgRequests.cells[0,sgRequests.row], 1);
  inx := JobBag.Requests.IndexOf(inx);
  JobBagRequest := JobBag.Requests[inx];

  if JobBagRequest.IncludedCharge then
    begin
      MessageDlg('This stock request cannot be deleted, this has already been added to the list of charges', mtInformation, [mbOk], 0);
      exit;
    end;

  if messagedlg('Delete the selected stock request from the Job Bag', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      JobBagRequest.Parent.Requests.Delete(inx);
      ShowRequests;

      inx := inx - 1;
      if inx < 0 then inx := 0;
      sgRequests.row := inx + 1;
    end;
end;

procedure TPBMaintJobBagFrm.mnuRequestPrintClick(Sender: TObject);
var
  inx: integer;
  JobBagRequest: TJobBagRequest;
  bTempOK: Boolean;
  selcode: integer;
  customername: string;
begin
  inx := StrToIntDef(sgRequests.cells[0,sgRequests.row], 0);

  inx := JobBag.Requests.IndexOf(inx);
  JobBagRequest := JobBag.Requests[inx];

  CustomerName := edtCustomer.text;
  selcode := JobBagRequest.SalesOrder;
  try
    STRSSalesOrdfrm := TSTRSSalesOrdfrm.create(self);
    STRSSalesOrdfrm.OrderGroupBox.caption := STRSSalesOrdfrm.OrderGroupBox.caption + inttostr(selcode);
    STRSSalesOrdfrm.Customerlbl.caption := CustomerName;
    STRSSalesOrdfrm.OrderDateLbl.caption := edtDate.text;
    STRSSalesOrdfrm.SONumber := selcode;
    STRSSalesOrdfrm.showmodal;
    bTempOK := STRSSalesOrdfrm.bOK;
  finally
    STRSSalesOrdfrm.free;
  end;
end;

procedure TPBMaintJobBagFrm.mnuRequestEditSOPricesClick(Sender: TObject);
var
  i: integer;
  inx: integer;
  JobBagRequest: TJobBagRequest;
  SONumber: integer;
  bTempOK: boolean;
begin
  inx := StrToIntDef(sgRequests.cells[0,sgRequests.row], 0);

  inx := JobBag.Requests.IndexOf(inx);
  JobBagRequest := JobBag.Requests[inx];

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try

    SONumber := JobBagRequest.SalesOrder;

    SelectSalesOrder(SONumber);

    if (dtmdlJBOrders.SOInvoiced(SONumber)) then
      begin
        messagedlg('This order has been invoiced, unable to change the cost and sell prices', mtInformation,
        [mbOk], 0);
          exit;
      end;

    frmSTMaintSalesOrder := TfrmSTMaintSalesOrder.Create(Self);
    try
      frmSTMaintSalesOrder.Mode := 'J';
      frmSTMaintSalesOrder.SalesOrderNo := SONumber;
      frmSTMaintSalesOrder.JobBagNo := JobBag.dbkey;
      frmSTMaintSalesOrder.ShowModal;
      bTempOK := frmSTMaintSalesOrder.bOK;
      if bTempOK then
        begin
          for i := 0 to pred(JobBag.Requests.count) do
            begin
              if JobBag.Requests[i].SalesOrder = SONumber then
              begin
                JobBag.Requests[i].Status := JobBag.DataModule.GetSalesOrderStatus(JobBag.Requests[i].SalesOrder);
                JobBag.Requests[i].StatusDescr := JobBag.DataModule.GetSOStatusDescr(JobBag.Requests[i].SalesOrder);
                JobBag.Requests[i].QtyOrdered := JobBag.DataModule.GetSOLineOrderQty(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
                JobBag.Requests[i].QtyDespatched := JobBag.DataModule.GetSOLineDeliveryQty(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
              end;
            end;
          ShowRequests;
          sgRequests.row := inx+1;
        end;
    finally
      frmSTMaintSalesOrder.Free;
    end;
  finally
    dtmdlJBOrders.Free;
  end;
end;

procedure TPBMaintJobBagFrm.mnuRequestAllocateClick(Sender: TObject);
begin
  CallAllocRequest('A');
end;

procedure TPBMaintJobBagFrm.mnuRequestDeAllocateClick(Sender: TObject);
begin
  CallAllocRequest('D');
end;

procedure TPBMaintJobBagFrm.mnuRequestPickNoteClick(Sender: TObject);
var
  Reprint: ByteBool;
  SONumber: integer;
  SOStatus: integer;
  bConfirmPick: boolean;
  bTempOK: Bytebool;
  iTempSel: integer;
  customername: string;
  inx, i: integer;
  JobBagRequest: TJobBagRequest;
  NewPicking: boolean;
begin
  inx := StrToIntDef(sgRequests.cells[0,sgRequests.row], 0);

  inx := jobbag.Requests.IndexOf(inx);
  JobBagRequest := JobBag.Requests[inx];

  customername := JobBag.CustomerName;

  Reprint := false;
  bConfirmPick := false;

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    SelectSalesOrder(JobBagRequest.SalesOrder);

    SONumber := JobBagRequest.SalesOrder;

    NewPicking := true;

    if (FSOStatus < 50) then
      begin
        messagedlg('Cannot print a Picking Note, stock has not been allocated to the order.', mtWarning,
            [mbOk], 0);
        exit
      end
    else
    if (FSOStatus = 100) then
      begin
        messagedlg('The Picking Note has already been printed', mtWarning,
          [mbOk], 0);
        Reprint := true;
        NewPicking := dtmdlJBOrders.IsNewPicking(SONumber);
      end
    else
    if (FSOStatus > 100) then
      begin
        NewPicking := dtmdlJBOrders.IsNewPicking(SONumber);
        if NewPicking then
          begin
            if messagedlg('The status of this order is '+ FSOStatusDescr + ', continue?',
                  mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit;
          end
        else
          begin
            messagedlg('The status of this order is '+ FSOStatusDescr + ' you cannot print/reprint the Picking Note.', mtWarning,
              [mbOk], 0);
            exit;
          end;
      end;

    if NewPicking then
      begin
        STRSPickingNotefrm:= TSTRSPickingNotefrm.create(self);
        try
          STRSPickingNotefrm.Customerlbl.caption := CustomerName;
          STRSPickingNotefrm.OrderDateLbl.caption := pbDateStr(FSODateOrdered);
          STRSPickingNotefrm.SONumber := SONumber;
          STRSPickingNotefrm.DateRequired := FSODateRequired;
          STRSPickingNotefrm.toDestroy := false;
          STRSPickingNotefrm.IsSalesOrder := True;
          STRSPickingNotefrm.showmodal;
          bConfirmPick := STRSPickingNotefrm.chkbxAutoConfirm.checked;
          bTempOK := STRSPickingNotefrm.bOK;
        finally
          STRSPickingNotefrm.free;
        end;
      end
    else
      begin
        STRSPickNotefrm:= TSTRSPickNotefrm.create(self);
        try
          STRSPickNotefrm.OrderGroupBox.caption := STRSPickNotefrm.OrderGroupBox.caption + inttostr(SONumber);
          STRSPickNotefrm.Customerlbl.caption := CustomerName;
          STRSPickNotefrm.OrderDateLbl.caption := pbDateStr(FSODateOrdered);
          STRSPickNotefrm.DeliveryDateEdit.text := pbDateStr(FSODateRequired);
          STRSPickNotefrm.SONumber := SONumber;
          STRSPickNotefrm.DateRequired := FSODateRequired;
          STRSPickNotefrm.Reprint := Reprint;
          STRSPickNotefrm.showmodal;
          bTempOK := STRSPickNotefrm.bOK;
        finally
          STRSPickNotefrm.free;
        end;
      end;
    if bTempOK then
      begin
        for i := 0 to pred(JobBag.Requests.count) do
          if JobBag.Requests[i].SalesOrder = SONumber then
            begin
              if bConfirmPick then
                begin
                  JobBag.Requests[i].QtyOrdered := JobBag.DataModule.GetSOLineOrderQty(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
                  JobBag.Requests[i].QtyDespatched := JobBag.DataModule.GetSOLineDeliveryQty(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
                  JobBag.Requests[i].CostPackQty := JobBag.DataModule.GetSOLineCostPack(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
                  JobBag.Requests[i].SellPackQty := JobBag.DataModule.GetSOLineSellPack(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
                  JobBag.Requests[i].CostPrice := JobBag.DataModule.GetSOLineCostPrice(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
                  JobBag.Requests[i].SellPrice := JobBag.DataModule.GetSOLineSellPrice(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
                  JobBag.Requests[i].VatCode := JobBag.DataModule.GetSOLineVatCode(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
                end;

              JobBag.Requests[i].Status := JobBag.DataModule.GetSalesOrderStatus(JobBag.Requests[i].SalesOrder);
              JobBag.Requests[i].StatusDescr := JobBag.DataModule.GetSOStatusDescr(JobBag.Requests[i].SalesOrder);
            end;
          iTempSel := SONumber;
        ShowRequests;
        sgRequests.row := inx+1;
      end
  finally
    dtmdlJBOrders.free;
  end;
end;

procedure TPBMaintJobBagFrm.mnuRequestConfirmClick(Sender: TObject);
var
  bTempOK: Bytebool;
  iIntSelCode: integer;
  sPickRef: string;
  SONumber: integer;
  PickingList: TPickingList;
  inx, i: integer;
  JobBagRequest: TJobBagRequest;
  NewPicking: boolean;
begin
  inx := StrToIntDef(sgRequests.cells[0,sgRequests.row], 0);

  inx := jobbag.Requests.IndexOf(inx);
  JobBagRequest := JobBag.Requests[inx];

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    SelectSalesOrder(JobBagRequest.SalesOrder);

    SONumber := JobBagRequest.SalesOrder;

    NewPicking := dtmdlJBOrders.IsNewPicking(SONumber);

    if NewPicking then
      begin
        STMaintPickFrm := TSTMaintPickFrm.Create(Self);
        try
          STMaintPickFrm.IsSalesOrder := True;
          STMaintPickFrm.SalesOrder := SONumber;
          STMaintPickFrm.ShowModal;
          bTempOK := STMaintPickFrm.bOK;
        finally
          STMaintPickFrm.Free;
        end;
      end
    else
      begin
        {Delete any entries currently in the IntSel table for this process}
        {This has all been added because the Picking confirmation screen works off the Intsel table}
        iIntSelCode := dmBroker.GetNextIntSelCode(Self) ;
        dmBroker.DelIntSelCode(iIntSelCode, True);

        {Get the Picking Refererence}
        sPickRef := dtmdlJBOrders.GetPickingRef(SONumber);
        dmBroker.AddIntSelCode(iIntSelCode,StrToFloatDef(sPickRef, 0, FormatSettings), sPickRef);

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
          STPickByPartFrm.Free;
          stStockDataMod.free;
          stPickDM.free;
        end;
      end;
    if bTempOK then
      begin
        for i := 0 to pred(JobBag.Requests.count) do
          if JobBag.Requests[i].SalesOrder = SONumber then
            begin
              JobBag.Requests[i].Status := JobBag.DataModule.GetSalesOrderStatus(JobBag.Requests[i].SalesOrder);
              JobBag.Requests[i].StatusDescr := JobBag.DataModule.GetSOStatusDescr(JobBag.Requests[i].SalesOrder);
              JobBag.Requests[i].QtyOrdered := JobBag.DataModule.GetSOLineOrderQty(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
              JobBag.Requests[i].QtyDespatched := JobBag.DataModule.GetSOLineDeliveryQty(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
              JobBag.Requests[i].CostPackQty := JobBag.DataModule.GetSOLineCostPack(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
              JobBag.Requests[i].SellPackQty := JobBag.DataModule.GetSOLineSellPack(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
              JobBag.Requests[i].CostPrice := JobBag.DataModule.GetSOLineCostPrice(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
              JobBag.Requests[i].SellPrice := JobBag.DataModule.GetSOLineSellPrice(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
              JobBag.Requests[i].VatCode := JobBag.DataModule.GetSOLineVatCode(JobBag.Requests[i].SalesOrder,JobBag.Requests[i].SalesOrderLine);
            end;
        ShowRequests;
        sgRequests.row := inx+1;
      end;
  finally
    dtmdlJBOrders.Free;
  end;
end;

procedure TPBMaintJobBagFrm.btnChargeRequestClick(Sender: TObject);
var
  inx, icount: integer;
  iProductType, iSupplier, iBranch: integer;
  JobBagRequest: TJobBagRequest;
  JobBagLine: TJobBagLine;
begin
  inx := StrToIntDef(sgRequests.cells[0,sgRequests.row], 1);

  {locate the job request}
  inx := JobBag.Requests.IndexOf(inx);
  JobBagRequest := JobBag.Requests[inx];

  if JobBagRequest.IncludedCharge then
    begin
      MessageDlg('This stock request has already been added to the list of charges', mtInformation, [mbOk], 0);
      exit;
    end;

  if JobBagRequest.Status < 150 then
    begin
      MessageDlg('This stock request must be pick confirmed before it can be added to the charges.', mtError, [mbOk], 0);
      exit;
    end
  else
  if JobBagRequest.Status >= 250 then
    begin
      MessageDlg('This stock has already been invoiced', mtInformation, [mbOk], 0);
      exit;
    end;

  if messagedlg('Do you want to add this stock request to the list of job bag charges?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      with JobBag.DataModule.qryAddSOJBLine do
        begin
          for icount := 0 to Pred(Params.Count) do
            Params[icount].Clear;

          ParamByName('Job_Bag').asinteger := JobBag.dbkey;
          ParamByName('Job_Bag_Line').AsInteger := JobBag.Lines.MaxLineNo + 1;
          ParamByName('Job_Bag_Line_Type').Asstring := 'S';
          ParamByName('Sales_Order').asfloat := JobBagRequest.SalesOrder;
          ParamByName('Sales_Order_Line_No').AsInteger := JobBagRequest.SalesOrderLine;
          ParamByName('Job_Bag_Line_Descr').AsString := JobBagRequest.Partcode + ' - ' + JobBagRequest.PartDescription;

          with JobBag.Datamodule do
            begin
              ParamByName('Job_Bag_Line_Cost').AsFloat :=
                CalculateStockPrice(JobBagRequest.CostPackQty, JobBagRequest.QtyOrdered, JobBagRequest.CostPrice);
              ParamByName('Job_Bag_Line_Sell').AsFloat :=
                CalculateStockPrice(JobBagRequest.SellPackQty, JobBagRequest.QtyOrdered, JobBagRequest.SellPrice);
            end;

          if JobBagRequest.Status >= 250 then
            ParamByName('Job_Bag_Line_Invoiced').AsString := 'Y'
          else if JobBagRequest.Status >= 200 then
            ParamByName('Job_Bag_Line_Invoiced').AsString := 'P'
          else
            ParamByName('Job_Bag_Line_Invoiced').AsString := 'N';

          ParamByName('Job_Bag_Quantity').AsFloat := JobBagRequest.QtyOrdered;
          ParamByName('Vat_Code').AsInteger := JobBagRequest.VatCode;

          iSupplier := dmBroker.GetCompanySupplier;
          iBranch := dmBroker.GetCompanySupplierBranch;
          ParamByName('Supplier').Asinteger := iSupplier;
          ParamByName('Branch_no').AsInteger := iBranch;

          iProductType := JobBag.DataModule.GetPartProductType(JobBagRequest.PartCode);
          if iProductType = 0 then
            ParamByName('Product_type').clear
          else
            ParambyName('Product_Type').asinteger := iProductType;

          ParamByname('Sequence_no').AsInteger := JobBagRequest.Parent.Lines.count + 1;
          ExecSQL;
        end;

      {create the job bag line}
      JobBagLine := TJobBagLine.Create(JobBag);
      JobBagLine.CurrencyCode := 1;
      JobBagLine.JBLine := JobBag.Lines.MaxLineNo + 1;
      JobBagLine.JBLineType := 'S';
      JobBagLine.JBLineMode := 'C';
      JobBagLine.PurchaseOrder := 0;
      JobBagLine.Line := 0;
      JobBagLine.Supplier:= iSupplier;
      JobBagLine.BranchNo := iBranch;
      JobBagLine.ProductType := iProductType;

      JobBagLine.SONumber := JobBagRequest.SalesOrder;
      JobBagLine.SOLineNo := JobBagRequest.SalesOrderLine;
      JobBagLine.JBLineDescr := JobBagRequest.PartCode;
      JobBagLine.JBQuantity := Trunc(JobBagRequest.QtyOrdered);

      with JobBag.Datamodule do
        begin
          JobBagLine.JBLineCost := CalculateStockPrice(JobBagRequest.CostPackQty,
                JobBagRequest.QtyOrdered, JobBagRequest.CostPrice);
          JobBagLine.JBLineSell := CalculateStockPrice(JobBagRequest.SellPackQty,
                JobBagRequest.QtyOrdered, JobBagRequest.SellPrice);
          JobBagLine.JBLineReseller := CalculateStockPrice(JobBagRequest.SellPackQty,
                JobBagRequest.QtyOrdered, JobBagRequest.SellPrice);
        end;

      if JobBagRequest.Status = 200 then
        JobBagLine.JBLineInvoiced := 'P'
      else
      if JobBagRequest.Status >= 250 then
        JobBagLine.JBLineInvoiced := 'Y'
      else
        JobBagLine.JBLineInvoiced := 'N';

      JobBagLine.SupplierName := JobBag.DataModule.GetSupplierName(JobBagLine.Supplier);
      JobBagLine.JBLineStatusText := JobBag.DataModule.GetSOStatus(JobBagLine.SONumber,JobBag.DbKey,JobBagLine.JBLine,JobBagLine.JBLineInvoiced);
      JobBagLine.VATCode := JobBagRequest.VatCode;
      JobBagLine.Sequence := JobBagRequest.Parent.Lines.count + 1;

      JobBagLine.Parent.Lines.Add(JobBagLine);

      {update the stock request to say that it has been included in charges}
      JobBagRequest.IncludedCharge := true;

      UpdateInternalCost;
      ShowLineDetails;
      ShowRequests;
      ShowTotals;
    end;
end;

procedure TPBMaintJobBagFrm.pmnWorksPopup(Sender: TObject);
begin
  pmniPrint.enabled := not (JobBag.Works.count = 0) and (Mode <> jbRepeat);
  pmniView.enabled := not (JobBag.Works.count = 0) and (Mode <> jbRepeat);
end;

procedure TPBMaintJobBagFrm.mnuCopyClick(Sender: TObject);
begin
  CallMaintLines(jblCopy);
end;

procedure TPBMaintJobBagFrm.ShowSupplies;
begin
  ClearGrid(sgSupply);  {Clear contents of supply grid}
  BuildSupplyGrid;
end;

procedure TPBMaintJobBagFrm.BuildSupplyGrid;
var
  i, icount, iLine, iChecked, irow: integer;
  myImage: TImage;
begin
  icount := 0;
  irow := 1;

  with sgSupply, JobBag.datamodule do
    begin
      for i := 0 to pred(JobBag.Supplies.count) do
        begin
          cells[0,irow] := inttostr(JobBag.Supplies[i].JBSupplyNo);
          cells[1,irow] := inttostr(JobBag.Supplies[i].Enquiry);
          cells[2,irow] := inttostr(JobBag.Supplies[i].EnquiryLine);
          cells[3,irow] := JobBag.Supplies[i].Description;
          cells[4,irow] := floattostr(JobBag.Supplies[i].Quantity);
          cells[5,irow] := formatfloat('0.00',JobBag.Supplies[i].TotalCost);
          cells[6,irow] := formatfloat('0.00',JobBag.Supplies[i].TotalSell);
          cells[7,irow] := JobBag.Supplies[i].PriceUnitDesc;
          inc(irow);
          icount := icount + 1;
        end;

      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
//  btnAddSupply.enabled := (Mode <> qAdd) and (Mode <> qRepeat);
  btnConvertSupply.enabled := (JobBag.Supplies.count <> 0) and (Mode <> jbRepeat) and (Mode <> jbConvert);
  if (JobBag.Supplies.Count > 0) then
    tsSupply.Caption := 'Pending Enquiries' + ' (' + inttostr(JobBag.Supplies.count) + ')'
  else
    begin
      pgDetails.Pages[(FindComponent('tsSupply') as TTabSheet).PageIndex].TabVisible := false;
    end;
end;

procedure TPBMaintJobBagFrm.sgSupplyDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with (Sender as TStringGrid) do
  begin
    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if JobBag.Supplies.Count > 0 then
    begin
      if (ACol = 0) or (ACol = 1) or (ACol = 2) or (ACol = 3) or (ACol = 7) then
      begin
        if gdFixed in State then
          Canvas.Brush.Color := sgSupply.FixedColor else
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
          Canvas.Brush.Color := sgSupply.FixedColor else
          if gdSelected in State then
            Canvas.Brush.Color := $00FFF0E1 else
            Canvas.Brush.Color := clWindow;
        Canvas.FillRect(Rect);
        Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
      end;
    end;
  end;
end;

procedure TPBMaintJobBagFrm.btnConvertSupplyClick(Sender: TObject);
var
  iTempEnq, iTempEnqLine: integer;
  inx, irow: integer;
  JobBagSupply: TJobBagSupply;
begin
  inx := StrToIntDef(sgSupply.cells[0,sgSupply.row], 0);
  irow := inx;

  inx := JobBag.Supplies.IndexOf(inx);
  JobBagSupply := JobBag.Supplies[inx];

  iTempEnq := JobBagSupply.Enquiry;
  iTempEnqLine := JobBagSupply.EnquiryLine;

  PBAutoPOFrm := TPBAutoPOFrm.Create(Self);
  try
    PBAutoPOFrm.TempEnqNo := iTempEnq;
    PBAutoPOFrm.TempEnqLineNo := iTempEnqLine;
    PBAutoPOFrm.JobBagNo := JobBag.DbKey;
    PBAutoPOFrm.MainLoop(self);
    if PBAutoPOFrm.TempOK then
      begin
        try
          AddPurchaseOrderFromEnq(PBAutoPOFrm.tempPO, 1);
          JobBagSupply.Parent.Supplies.Delete(inx);
        finally
          ShowSupplies;
          UpdateInternalCost;
          ShowLineDetails;
          ShowTotals;

          {set position on supplies grid}
          inx := inx - 1;
          if inx < 0 then inx := 0;
          sgSupply.row := inx + 1;

          {set position on Charges grid}
          inx := pred(JobBag.Lines.count);
          if inx < 0 then
            inx := 0;
          sgLines.row := inx+1;


          messagedlg('A new purchase order has been added to the list of charges.', mtInformation, [mbOk], 0);
        end;
      end
  finally
    PBAutoPOFrm.Free;
  end;
end;

procedure TPBMaintJobBagFrm.BitBtn3Click(Sender: TObject);
begin
  cmbOnHold.ItemIndex := -1;
end;

procedure TPBMaintJobBagFrm.ShowNonConformDetails;
begin
  ClearGrid(sgNCADetails);
  BuildNonConformGrid;
end;

procedure TPBMaintJobBagFrm.BuildNonConformGrid;
var
  icount: integer;
  irow: integer;
begin
  icount := 0;
  with sgNCADetails, jobbag.datamodule do
    begin
      for irow := 0 to pred(jobbag.NonConformDocs.count) do
        begin
          cells[0,irow+1] := inttostr(jobbag.NonConformDocs[irow].JBNonConformNo);
          cells[1,irow+1] := inttostr(jobbag.NonConformDocs[irow].NCNumber);

          cells[2,irow+1] := pbdatestr(jobbag.NonConformDocs[irow].DatePoint);
          cells[3,irow+1] := jobbag.NonConformDocs[irow].NCTypeDescription;
          cells[4,irow+1] := jobbag.NonConformDocs[irow].StatusDescription;
          cells[5,irow+1] := jobbag.NonConformDocs[irow].RaisedByName;
          cells[6,irow+1] := jobbag.NonConformDocs[irow].NCDepartmentName;
          cells[7,irow+1] := jobbag.NonConformDocs[irow].QAOperatorName;
          cells[8,irow+1] := pbdatestr(jobbag.NonConformDocs[irow].QASignOffDate);
          cells[9,irow+1] := formatfloat('0.00',jobbag.NonConformDocs[irow].TotalCost);
          icount := icount + 1;
        end;

      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
      sgNCADetailsClick(self);
    end;
  btnAddNCA.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  btnChangeNCA.Enabled := (JobBag.NonConformDocs.count > 0);
  btnDeleteNCA.Enabled := (JobBag.NonConformDocs.count > 0);
  btnPrintNCA.Enabled := (JobBag.NonConformDocs.count > 0);

  lblNonConformance.Visible := (JobBag.NonConformDocs.count > 0);
end;

procedure TPBMaintJobBagFrm.ShowProcesses;
begin
  ClearProcesses;  {Clear contents of Process page}
  BuildProcesses;
end;

procedure TPBMaintJobBagFrm.ClearProcesses;
var
  icount: integer;
begin
end;

procedure TPBMaintJobBagFrm.BuildProcesses;
var
  aProcess: TJobBagProcess;
  CurrentGroup: string;
  myScrollBox: TScrollBox;
  myLabel : TLabel;
  myCheckBox: TCheckBox;
  sTempName : string;
  iPos : integer;
  icount : integer;
begin
  scrlProduction.Free;
  currentGroup := '';

  myScrollBox := TScrollBox.create(self);
  with myScrollBox do
    begin
      Name := 'scrlProduction';
      parent := tsProduction;
      width := 260;
      align := alLeft;
    end;
  iPos := 8;
  with JobBag.datamodule do
    begin
      for icount := 0 to pred(JobBag.Processes.count) do
        begin
          aProcess := JobBag.Processes[icount];

          with aProcess do
            begin
              if aProcess.ProcessGroupName <> CurrentGroup then
                begin
                  //This is a new group so add a label
                  MyLabel := TLabel.Create(Self);
                  Mylabel.autosize := False;
                  MyLabel.Caption := ProcessGroupName;
                  MyLabel.Parent := myScrollbox;
                  MyLabel.Tag := 999999;
                  MyLabel.Left := 8;
                  MyLabel.Width := 150;
                  Mylabel.Font.Size := 8;
                  Mylabel.Font.Style := [fsBold];
                  MyLabel.Height := 13;
                  MyLabel.Top := ipos;
                  ipos := ipos + Mylabel.Height+2;

                  //Now add the checkbox component
                  MyCheckBox := TCheckBox.Create(Self);
                  stempname := 'chkProcess' + Copy((IntToStr(1000 + Process)),2,3);
                  MyCheckBox.Name := stempname;
                  MyCheckBox.Caption := ProcessName;
                  MyCheckBox.Parent := myScrollbox;

                  MyCheckBox.Tag := 999999 + icount;
                  MyCheckBox.Left := 32;
                  MyCheckBox.Width := 200;
                  MyCheckBox.Font.Size := 8;
                  MyCheckBox.Top := ipos;
                  MyCheckBox.checked := isUsed;
                  MyCheckBox.OnClick := CheckBoxClick;
                  MyCheckBox.Height := 17;
                  ipos := ipos + MyCheckBox.Height+2;
                end
              else
                begin
                  MyCheckBox := TCheckBox.Create(Self);
                  stempname := 'chkProcess' + Copy((IntToStr(1000 + Process)),2,3);
                  MyCheckBox.Name := stempname;
                  MyCheckBox.Caption := ProcessName;
                  MyCheckBox.Parent := myScrollbox;

                  MyCheckBox.Tag := 999999 + icount;
                  MyCheckBox.Left := 32;
                  MyCheckBox.Width := 200;
                  MyCheckBox.Font.Size := 8;
                  MyCheckBox.Top := ipos;
                  MyCheckBox.checked := isUsed;
                  MyCheckBox.OnClick := CheckBoxClick;
                  MyCheckBox.Height := 17;
                  ipos := ipos + MyCheckBox.Height+2;
                end;
              currentGroup := ProcessGroupName;
            end;
        end;
    end;
end;

procedure TPBMaintJobBagFrm.CheckBoxClick(Sender: TObject);
var
  isused: boolean;
  myCheckBox: TCheckbox;
begin
  isused := (sender as TCheckbox).checked;
end;

procedure TPBMaintJobBagFrm.UpdateProcesses;
var
  icount: integer;
  myCheckBox: TCheckBox;
begin
  for icount := 0 to pred(JobBag.Processes.count) do
    begin
      {Get the process notes}
      myCheckBox := (findcomponent('chkProcess'+Copy((IntToStr(1000 + JobBag.Processes[icount].Process)),2,3)) as TCheckBox);
      JobBag.Processes[icount].IsUsed := myCheckBox.Checked;
    end;
end;

procedure TPBMaintJobBagFrm.btnCostCentreClick(Sender: TObject);
begin
  if CostCentreLevel = 'C' then
    begin
      PBLUCustCstCntrFrm := TPBLUCustCstCntrFrm.Create(Self);
      try
        PBLUCustCstCntrFrm.bIs_Lookup := True;
        PBLUCustCstCntrFrm.bAllow_Upd := True;
        PBLUCustCstCntrFrm.sSelCode := JobBag.CostCentre;
        PBLUCustCstCntrFrm.iCust := JobBag.Customer;
        PBLUCustCstCntrFrm.sCustName := edtCustomer.Text;
        PBLUCustCstCntrFrm.ShowModal;
        if PBLUCustCstCntrFrm.Selected then
          begin
            JobBag.CostCentre := PBLUCustCstCntrFrm.sSelCode;
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
        PBLUBranchCstCntrFrm.sSelCode := JobBag.CostCentre;
        PBLUBranchCstCntrFrm.iCust := JobBag.Customer;
        PBLUBranchCstCntrFrm.iBranch := JobBag.Branch;
        PBLUBranchCstCntrFrm.sCustName := edtCustomer.Text;
        PBLUBranchCstCntrFrm.ShowModal;
        if PBLUBranchCstCntrFrm.Selected then
          begin
            JobBag.CostCentre := PBLUBranchCstCntrFrm.sSelCode;
            edtCostCentre.Text := PBLUBranchCstCntrFrm.sSelName;
          end;
      finally
        PBLUBranchCstCntrFrm.Free;
      end;
    end;
end;

procedure TPBMaintJobBagFrm.cmbDepartmentChange(Sender: TObject);
begin
  ShowDataCollection;
end;

procedure TPBMaintJobBagFrm.LoadDepartments;
begin
  cmbDepartment.items.Clear;
  with JobBag.DataModule.qryDepartments do
    begin
      close;
      open;

      cmbDepartment.Items.add('All Departments');

      while eof <> true do
        begin
          cmbDepartment.Items.add(fieldbyname('Process_Group_Description').asstring);
          next;
        end;
      cmbDepartment.ItemIndex := 0;
    end
end;

procedure TPBMaintJobBagFrm.ConvertQuoteintoJob1Click(Sender: TObject);
var
  tmpQuote: double;
  inx: integer;
  Selected : Boolean;
begin
  frmpbluCustQuotesJB := TfrmpbluCustQuotesJB.Create(Self);
  try
    frmpbluCustQuotesJB.Customer := JobBag.Customer;
    frmpbluCustQuotesJB.Branch := JobBag.Branch;
    frmpbluCustQuotesJB.JobBagNo := JobBag.dbkey;
    frmpbluCustQuotesJB.CustomerName :=
      Trim(JobBag.CustomerName) + '/' + Trim(JobBag.BranchName);
    frmpbluCustQuotesJB.ShowModal;
    Selected := frmpbluCustQuotesJB.Selected;
    if Selected then
    begin
      tmpQuote := frmpbluCustQuotesJB.SelCode;
    end;
  finally
    frmpbluCustQuotesJB.Free;
  end;
  if Selected then
  begin
    try
      InsertQuoteDetails(tmpQuote);
    finally
      UpdateInternalCost;
      ShowLineDetails;
      ShowTotals;

      inx := pred(JobBag.Lines.count);
      if inx < 0 then
        inx := 0;
      sgLines.row := inx+1;
    end;
  end;
end;

procedure TPBMaintJobBagFrm.InsertQuoteDetails(tmpQuote: double);
begin
  JobBag.DataModule.QuoteNo := tmpQuote;
  JobBag.InsertQuoteLines;
end;

procedure TPBMaintJobBagFrm.CallMaintNCA(aMode: TjbncMode);
var
  inx, iRow, LineNo : integer;
  jobBagNonConform : TjobBagNonConform;
  frm: TPBMaintJobBagNonConfDocFrm;
begin
  inx := sgNCADetails.row;

  irow := inx;

  frm := TPBMaintJobBagNonConfDocFrm.Create(Self);
  try
    if aMode = jbncAdd then
      JobBagNonConform := TJobBagNonConform.Create(JobBag)
    else
    begin
      inx := JobBag.nonConformDocs.IndexOf(inx);
      JobBagNonConform := JobBag.nonConformDocs[inx];
    end;

    if (Mode = jbView) then
      aMode := jbncView;

    Frm.JobBagNonConform := JobBagNonConform;
    Frm.Mode := aMode;
    Frm.ShowModal;
    if (aMode = jbncAdd) and (Frm.ModalResult <> mrOK) then
      JobBagNonConform.Free;

    if (Frm.ModalResult = mrOK) then
      begin
        if Mode <> jbView then
          begin
            ShowNonConformDetails;
          end;

        if aMode = jbncAdd then
          begin
            irow := JobBag.NonConformDocs.count;
            if irow <= 0 then irow := 1;
          end
        else
        if aMode = jbncDelete then
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

procedure TPBMaintJobBagFrm.btnAddNCAClick(Sender: TObject);
begin
  CallMaintNCA(jbncAdd);
end;

procedure TPBMaintJobBagFrm.btnChangeNCAClick(Sender: TObject);
begin
  CallMaintNCA(jbncChange);
end;

procedure TPBMaintJobBagFrm.btnDeleteNCAClick(Sender: TObject);
begin
  CallMaintNCA(jbncDelete);
end;

procedure TPBMaintJobBagFrm.sgNCADetailsDblClick(Sender: TObject);
begin
  if (JobBag.NonConformDocs.count = 0) then
    exit;
  btnChangeNCAClick(self);
end;

procedure TPBMaintJobBagFrm.btnPrintNCAClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: real;
  inx: integer;
  JobBagNonConform: TJobBagNonConform;
begin
  inx := sgNCADetails.row;

  inx := JobBag.nonConformDocs.IndexOf(inx);
  JobBagNonConform := JobBag.nonConformDocs[inx];


  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  JobBag.SaveNonConformDocs;
  try
    frmPBRSNonConform := TfrmPBRSNonConform.Create( Application );
    Key := JobBagNonConform.NCNumber;

    frmPBRSNonConform.memSelection.text := floattostr(Key);
    frmPBRSNonConform.edtCustomer.text := JobBag.CustomerName;
    frmPBRSNonConform.memDescription.text := JoBbag.Description;
    frmPBRSNonConform.memJobBag.text := inttostr(JobBag.dbKey);
    frmPBRSNonConform.showmodal;
  finally
    frmPBRSNonConform.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TPBMaintJobBagFrm.sgNCADetailsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  inx: integer;
  JBNCL: TJobBagNonConform;
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
          inx := jobbag.NonConformDocs.IndexOf(inx);

          if JobBag.NonConformDocs.Count > 0 then
          begin
          JBNCL := JobBag.NonConformDocs[inx];

          if JBNCL.Inactive = 'Y' then
            begin
              Canvas.Font.Color := clSilver;
              Canvas.Font.Style := Font.Style + [fsStrikeOut]
            end
          else
          if ARow = iSelected then
            Canvas.Font.Color := clBlack
          else
            Canvas.Font.Color := Font.Color;
          end;

        except
          Canvas.Font.Color := Font.Color;
        end;
        Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, Cells[ACol, ARow]);
      end;

    if jobbag.NonConformDocs.Count > 0 then
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

procedure TPBMaintJobBagFrm.tsAnalysisShow(Sender: TObject);
begin
  if not FAnalysisOn then
    begin
      ShowAnalysis;
      FAnalysisOn := true;
    end;
end;

procedure TPBMaintJobBagFrm.sgNCADetailsClick(Sender: TObject);
var
  inx: integer;
  JobBagNonConform: TJobBagNonConform;
begin
  if sgNCADetails.Cells[0,1] = '' then
    begin
      memNCADetails.clear;
    end
  else
    begin
      inx := sgNCADetails.row;

      inx := JobBag.nonConformDocs.IndexOf(inx);
      JobBagNonConform := JobBag.nonConformDocs[inx];
      memNCADetails.text := JobBagNonConform.NarrativeText;
    end;
end;

procedure TPBMaintJobBagFrm.memTotalSIChange(Sender: TObject);
begin
  memTotalSIAnalysis.text := (sender as TMemo).text;
  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.memTotalPIChange(Sender: TObject);
begin
  memTotalPIAnalysis.text := (sender as TMemo).text;
  checkOK(self);
end;

procedure TPBMaintJobBagFrm.sgAnalysisDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ARow <> 0) and (ACol <> 0) then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, Cells[ACol, ARow]);
    end;

    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if (ACol = 0) or (ACol = 1) then
    begin
      if gdFixed in State then
        Canvas.Brush.Color := sgAnalysis.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end
    else
    begin
      if gdFixed in State then
        Canvas.Brush.Color := sgAnalysis.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end;
  end;
end;

procedure TPBMaintJobBagFrm.dbgPurchaseInvoicesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgPurchaseInvoices.datasource.dataset.fieldbyname('Invoice_or_credit').asstring = 'C') then
    begin
      (Sender as TDBGrid).Canvas.font.Color := clRed;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'Total') and
      (Column.Title.Caption <> 'Goods') and
      (Column.Title.Caption <> 'Vat') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
     end
  else
  	begin
    		WITH Sender AS TDBGrid DO
      		BEGIN
           	if (Column.Title.Caption <> 'Goods') and
               (Column.Title.Caption <> 'Total') and
               (Column.Title.Caption <> 'Vat') then
              	begin
                  Canvas.Brush.Color := Color;
                  Canvas.Font.Color  := Font.Color;
                  Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2, Column.field.asstring);
                end;
      		END;
			{Display the Columns Right justified in the cells}
      if Assigned(Column.Field) then
      begin
        if  (Column.Title.Caption = 'Goods') or
            (Column.Title.Caption = 'Total') or
            (Column.Title.Caption = 'Vat') then
        begin
          TNumericField(Column.Field).DisplayFormat := '£#,###,##0.00';
        end;

        Column.Alignment := taRightJustify;
      end;
    end;
end;

procedure TPBMaintJobBagFrm.dbgPurchaseInvoicesDblClick(Sender: TObject);
begin
  if btnViewPI.Enabled then
    btnViewPIClick(self);

end;

procedure TPBMaintJobBagFrm.btnViewPIClick(Sender: TObject);
var
  Key : integer;
  frm : TPBMaintSuppInvoicefrm;
  aInvoice : TSuppInvoice;
  dmJBSupplierInvoice: TdmSupplierInvoice;
begin
  Key := dbgPurchaseInvoices.DataSource.DataSet.fieldbyname('Supplier_Invoice').asinteger;
  if MessageDlg('You only have access to view the selected invoice, continue?', mtConfirmation,
    [mbOk,mbCancel], 0) = mrCancel then exit;

  dmJBSupplierInvoice := TdmSupplierInvoice.create(self);
  try
  aInvoice := TSuppInvoice.Create(dmJBSupplierInvoice);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TPBMaintSuppInvoicefrm.Create(Self);
      try
        Frm.Mode := piView;
        Frm.SupplierInvoice := aInvoice;
        Frm.ShowModal;
        Key := aInvoice.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aInvoice.Free;
    end;
  finally
    dmJBSupplierInvoice.free;
  end;
end;

procedure TPBMaintJobBagFrm.Button1Click(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
    PrinterSettings := TPrinterSettings.Create;
    if SetUpPrinter(PrinterSettings) then
        self.print;
      PrinterSettings.Free;
end;

procedure TPBMaintJobBagFrm.chkbxProductionCompleteClick(Sender: TObject);
begin
  chkbxReadytoinvoice.Enabled := (sender as TCheckbox).Checked;
  edtDateComplete.Enabled := chkbxReadytoinvoice.Enabled;
  btnDateComplete.enabled := chkbxReadytoinvoice.Enabled;
  if FActivated and (sender as TCheckbox).checked then
    btnDateCompleteClick(self);
  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.edtdateCompleteExit(Sender: TObject);
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

procedure TPBMaintJobBagFrm.btnDateCompleteClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateComplete.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDateComplete.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintJobBagFrm.sgDeliveriesDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with (Sender as TStringGrid) do
  begin
    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if (ACol = 3) then
  	begin
			{Display the Columns Right justified in the cells}
      if gdFixed in State then
        Canvas.Brush.Color := sgDeliveries.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end
    else
  	begin
        if gdFixed in State then
        Canvas.Brush.Color := sgDeliveries.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end;
  end;
end;

procedure TPBMaintJobBagFrm.btnAddDeliveryClick(Sender: TObject);
begin
  CallMaintDeliveries(jbdelivAdd);
end;

procedure TPBMaintJobBagFrm.btnChangeDeliveryClick(Sender: TObject);
begin
  CallMaintDeliveries(jbdelivChange);

end;

procedure TPBMaintJobBagFrm.btnDeleteDeliveryClick(Sender: TObject);
begin
  CallMaintDeliveries(jbdelivDelete);
end;

procedure TPBMaintJobBagFrm.sgDeliveriesDblClick(Sender: TObject);
begin
  btnChangeDeliveryClick(self);
end;

procedure TPBMaintJobBagFrm.btnPrintDeliveryNoteClick(Sender: TObject);
var
  inx, irow: integer;
  JobBagDelivery: TJobBagDelivery;
begin
  inx := StrToIntDef(sgDeliveries.cells[0,sgDeliveries.row], 1);
  irow := inx;

  inx := JobBag.Deliveries.IndexOf(inx);
  JobBagDelivery := JobBag.Deliveries[inx];

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  JobBag.SaveDeliveries;

  PBRSJobBagDelivNoteFrm := TPBRSJobBagDelivNoteFrm.create(self);

  try
    PBRSJobBagDelivNoteFrm.JobBag := JobBagDelivery.Parent.DbKey;
    PBRSJobBagDelivNoteFrm.Delivery := JobBagDelivery.DeliveryNo;
    PBRSJobBagDelivNoteFrm.CustName := JobBagDelivery.Parent.CustomerName;
    PBRSJobBagDelivNoteFrm.Quantity := formatfloat('0',JobBagDelivery.QtyToDeliver);

    {If Delivery Date already exists then show it and confirm delivery}
    if PBDateStr(JobBagDelivery.DateDelivered) = '' then
      begin
      PBRSJobBagDelivNoteFrm.DeliveryDate := pbDateStr(JobBagDelivery.DateRequired);
      end
    else
      begin
      PBRSJobBagDelivNoteFrm.DeliveryDate := PBDateStr(JobBagDelivery.DateDelivered);
      end;
    PBRSJobBagDelivNoteFrm.ActualDeliveryDate := PBDateStr(JobBagDelivery.DateDelivered);
    PBRSJobBagDelivNoteFrm.Description := JobBagDelivery.parent.Description;
    PBRSJobBagDelivNoteFrm.showmodal;
  finally
    PBRSJobBagDelivNoteFrm.free;
  end;
end;

procedure TPBMaintJobBagFrm.btnPrintDeliveryLabelClick(Sender: TObject);
var
  inx, irow: integer;
  JobBagDelivery: TJobBagDelivery;
begin
  inx := StrToIntDef(sgDeliveries.cells[0,sgDeliveries.row], 1);
  irow := inx;

  inx := JobBag.Deliveries.IndexOf(inx);
  JobBagDelivery := JobBag.Deliveries[inx];

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  JobBag.SaveDeliveries;

  PBRSJobBagBoxLabelsFrm := TPBRSJobBagBoxLabelsFrm.create(self);

  try
    PBRSJobBagBoxLabelsFrm.JobBag := JobBagDelivery.Parent.DbKey;
    PBRSJobBagBoxLabelsFrm.Delivery := JobBagDelivery.DeliveryNo;
    PBRSJobBagBoxLabelsFrm.CustName := JobBagDelivery.Parent.CustomerName;
    PBRSJobBagBoxLabelsFrm.Quantity := formatfloat('0',JobBagDelivery.QtyToDeliver);

    {If Delivery Date already exists then show it and confirm delivery}
    if PBDateStr(JobBagDelivery.DateDelivered) = '' then
      begin
        PBRSJobBagBoxLabelsFrm.DeliveryDate := pbDateStr(JobBagDelivery.DateRequired);
      end
    else
      begin
        PBRSJobBagBoxLabelsFrm.DeliveryDate := PBDateStr(JobBagDelivery.DateDelivered);
      end;

    PBRSJobBagBoxLabelsFrm.Description := JobBagDelivery.Parent.Description;
    PBRSJobBagBoxLabelsFrm.BoxQuantity := inttostr(JobBagDelivery.boxQuantity);
//    PBRSJobBagBoxLabelsFrm.NoOfSets := JobBagDelivery.
    PBRSJobBagBoxLabelsFrm.NoOfBoxes := JobBagDelivery.NumberOfBoxes;
    PBRSJobBagBoxLabelsFrm.stocked := JobBagDelivery.DeliverToStock;
    PBRSJobBagBoxLabelsFrm.showmodal;

  finally
    PBRSJobBagBoxLabelsFrm.free;
  end;
end;

procedure TPBMaintJobBagFrm.RepeatanexistingPO1Click(Sender: TObject);
var
  rTempPO: real;
  iTempPOLine, inx: Integer;
  Selected : Boolean;
begin
  rTempPO := 0;
  iTempPOLine := 0;
  frmPBLUCustOrdersJB := TfrmPBLUCustOrdersJB.Create(Self);
  try
    frmPBLUCustOrdersJB.bNot_In_JB := false;
    frmPBLUCustOrdersJB.bShowInvoiced := true;
    frmPBLUCustOrdersJB.Customer := JobBag.Customer;
    frmPBLUCustOrdersJB.Branch := JobBag.Branch;
    frmPBLUCustOrdersJB.CustomerName :=
      Trim(JobBag.CustomerName) + '/' + Trim(JobBag.BranchName);

    frmPBLUCustOrdersJB.ShowModal;
    Selected := frmPBLUCustOrdersJB.Selected;
    if Selected then
    begin
      rTempPO := frmPBLUCustOrdersJB.SelCode;
      iTempPOLine := frmPBLUCustOrdersJB.SelLine;
    end;
  finally
    frmPBLUCustOrdersJB.Free;
  end;

  {If an order has been selected then display the PO maint screen}
  if Selected then
  begin
    rRepeatPO := rTempPO;

    dtmdlJBOrders := TdtmdlOrders.create(self);
    try
      if btempCanUpd then
        CallMaintScreen(jblRepeat)
      else
        begin
          messagedlg('You do not have access to the Purchase Ordering module.', mtError, [mbOk], 0);
          exit;
        end;
    finally
      dtmdlJBOrders.free
    end;
  end;
end;

procedure TPBMaintJobBagFrm.dblkpPriceUnitClick(Sender: TObject);
begin
  try
    JobBag.PriceUnit := dblkpPriceUnit.KeyValue;
    JobBag.PriceUnitFactor := JobBag.DataModule.GetPriceUnitFactor(JobBag.PriceUnit);
  except
    JobBag.PriceUnit := 0;
    JobBag.PriceUnitFactor := 0;
  end;
  ShowUnitPrice;
  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.FormRefClrBitBtnClick(Sender: TObject);
begin
  dblkpPriceUnit.KeyValue := 0;
  JobBag.PriceUnit := dblkpPriceUnit.KeyValue;
  JobBag.PriceUnitFactor := 0;
  labUnitSell.Caption := FloatToStrF(JobBag.UnitSell, ffCurrency, 15, 3);
end;

procedure TPBMaintJobBagFrm.memQuantityChange(Sender: TObject);
begin
  try
    JobBag.Quantity := StrToIntDef(memQuantity.text, 0)
  except
    JobBag.Quantity := 0;
  end;

  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.miExcelClick(Sender: TObject);
begin
  {export the details to Excel}
  frmPBSendtoExcel := TfrmPBSendtoExcel.create(self);
  try
    frmPBSendtoExcel.ExportType := 'S';
    frmPBSendtoExcel.ExportStrGrid := sgLines;
    frmPBSendtoExcel.ExportFormCaption := 'Job Bag ' +  inttostr(JobBag.dbKey) + ' - Charges';
    frmPBSendtoExcel.show;
  finally
    frmPBSendtoExcel.free;
  end;
end;

procedure TPBMaintJobBagFrm.Excel3Click(Sender: TObject);
begin
  {export the details to Excel}
  frmPBSendtoExcel := TfrmPBSendtoExcel.create(self);
  try
    frmPBSendtoExcel.ExportType := 'S';
    frmPBSendtoExcel.ExportStrGrid := sgRequests;
    frmPBSendtoExcel.ExportFormCaption := 'Job Bag ' +  inttostr(JobBag.dbKey) + ' - Stock Requests';
    frmPBSendtoExcel.show;
  finally
    frmPBSendtoExcel.free;
  end;
end;

procedure TPBMaintJobBagFrm.edtCustOrderNoChange(Sender: TObject);
begin
  JobBag.CustOrderNo := (Sender as TEdit).text;
  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.btnPrintWorksISOClick(Sender: TObject);
var
  OldCursor : TCursor;
  JBWOrder: TJobBagWOrder;
  key, inx: integer;
  WONumber: real;
  tmpCustomer, tmpDescription: string;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  inx := sgWorks.row;

  inx := JobBag.Works.IndexOf(inx);
  JBWOrder := JobBag.Works[inx];
  try
    PBRSWorksOrderISOfrm := TPBRSWorksOrderISOfrm.Create( Application );
    Key := JBWOrder.WorksOrder;
    WONumber := JBWOrder.WorksOrderNumber;
    tmpCustomer := JobBag.CustomerName;
    tmpDescription := JBWOrder.Description;

    PBRSWorksOrderISOfrm.WONumber := JBWOrder.WorksOrder;
    PBRSWorksOrderISOfrm.WOStatus := JBWOrder.Status;
    PBRSWorksOrderISOfrm.JobBagNo := JobBag.dbkey;
    PBRSWorksOrderISOfrm.memSelection.text := floattostr(WONumber);
    PBRSWorksOrderISOfrm.edtCustomer.text := tmpCustomer;
    PBRSWorksOrderISOfrm.memDescription.text := tmpDescription;
    PBRSWorksOrderISOfrm.showmodal;
    JBWorder.Status := PBRSWorksOrderISOfrm.WOStatus;

  finally
    PBRSWorksOrderISOfrm.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TPBMaintJobBagFrm.ShowSpecification;
var
  icount: integer;
  myScrollbox: TScrollbox;
begin
  LockWindowUpdate(Handle);
  try
    myScrollBox := (findcomponent('scrlbxSpec') as TScrollBox);
    myScrollbox.free;
  finally
    LockWindowUpdate(0);
  end;

  BuildSpecification;
end;

procedure TPBMaintJobBagFrm.BuildSpecification;
var
  icount: integer;
  myScrollBox: TScrollBox;
  stempname: string;
  myPanel1, myPanel2: TPanel;
  myMemo: TMemo;
begin
  myScrollBox := TScrollBox.create(self);
  myScrollBox.Name := 'scrlbxSpec';
  myScrollBox.parent := tsSpecification;
  myScrollBox.align := alClient;

  for icount := 0 to pred(JobBag.Departments.count) do
    begin
      with JobBag.Departments[icount] do
        begin
          myPanel1 := TPanel.Create(Self);
          stempname := 'pnlHead' + Copy((IntToStr(1000 + JDepartmentNo)),2,3);
          myPanel1.Name := stempname;
          myPanel1.Caption := ' ' + DepartmentName;
//          myPanel1.Parent := scrlbxSpec;
          myPanel1.Parent := myScrollbox;
          myPanel1.Tag := 999;
          myPanel1.Align := alTop;
          myPanel1.Alignment := taLeftJustify;
          myPanel1.Font.Size := 8;
          myPanel1.Font.Style := [fsBold];
          myPanel1.Height := 17;
          myPanel1.bevelOuter := bvNone;

          {Add second panel to hold Memo component for specification}
          myPanel2 := TPanel.Create(Self);
          stempname := 'pnlDet' + Copy((IntToStr(1000 + JDepartmentNo)),2,3);
          myPanel2.Name := stempname;
          myPanel2.Caption := '';
//          myPanel2.Parent := scrlbxSpec;
          myPanel2.Parent := myScrollbox;
          myPanel2.Tag := 999;
          myPanel2.Align := alTop;
          myPanel2.Font.Size := 8;
          myPanel2.Height := 80;
          myPanel2.bevelOuter := bvNone;

          {Add Memo component to hold specification}
          mymemo := TMemo.Create(Self);
          stempname := 'mem' + Copy((IntToStr(1000 + JDepartmentNo)),2,3);
          myMemo.Name := stempname;
          myMemo.text := Specification;
          myMemo.Parent :=  myPanel2;
          myMemo.Tag := icount;
          myMemo.Align := alClient;
          myMemo.ScrollBars := ssVertical;
          myMemo.OnChange := SpecificationChange;
          myMemo.Font.Size := 8;
        end;
    end;
end;

procedure TPBMaintJobBagFrm.SpecificationChange(Sender: TObject);
var
  inx: integer;
begin
  inx := (Sender as TMemo).Tag;
  JobBag.Departments[inx].Specification := (Sender as TMemo).Text;
end;

procedure TPBMaintJobBagFrm.ShowQuoteDocuments;
var
  sPath: string;
begin
  sPath := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(JobBag.datamodule.QuoteNo) + '\';
  // Assign a Imagelist to the ListView
  lstvwDocuments.Clear;
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);

  tlbrDocuments.Enabled := (Mode <> jbAdd) and (Mode <> jbRepeat) and (Mode <> jbConvert) and (Mode <> jbView);
  if  (Mode = jbAdd) or
      (Mode = jbRepeat) or
      (Mode = jbConvert) or
      (Mode = jbView) then
        begin
          lstvwDocuments.PopupMenu := pmnDummy;
        end;
end;

procedure TPBMaintJobBagFrm.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
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
    i := FindFirst(strPath + '*.*', faAnyFile, SearchRec);
    while i = 0 do
    begin
      with ListView do
      begin
        // On directories and volumes
        if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
          (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
//        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
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

procedure TPBMaintJobBagFrm.btnExcelClick(Sender: TObject);
var
  compdir, docdir, jobBagDir, docExt, sNewPath: string;
  sFullFile, sFileName: string;
  iLength, ipos, i: integer;
  okToSave, userCancelled, docsaved: boolean;
begin
//  docDir := dmBroker.GetCompanyJobBagDirectory + '\' + floattostr(JobBag.dbKey);
  docdir := sPath;

  compDir := dmBroker.GetCompanyJobBagDirectory;

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
          MessageDlg('You can''t save a document outside the Job Document Directory',
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
      sNewPath := copy(svDlgOfficeDoc.FileName, length(compdir)+1, length(svDlgOfficeDoc.FileName));

      {get file name}
      sfullFile := sNewPath;

      iLength := length(sFullFile);

      while i <> 0 do
        begin
          ipos := pos('\',sFullFile);
          sFullFile := stringreplace(sFullFile, '\', '!', []);

          i := pos('\',sFullFile);
        end;

      sFileName := copy(sNewPath, ipos+1, (iLength - ipos));

      if docExt = '.doc' then
      begin
        try
          PBWordOLEFrm := TPBWordOLEFrm.Create(self);
          PBWordOLEFrm.SaveAsDocument(compDir+sNewPath);
          docSaved := true;
        finally
          PBWordOLEFrm.Free;
        end;
      end
      else
      begin
        try
          PBExcelOLEFrm := TPBExcelOLEFrm.Create(self);
          PBExcelOLEFrm.SaveAsDocument(compDir+sNewPath);
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

procedure TPBMaintJobBagFrm.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody: string;
begin
  PBMaintEmailFrm := TPBMaintEmailFrm.create(self);
  try
    PBMaintEmailFrm.Supplier := 0;
    PBMaintEmailFrm.SupplierBranch := 0;
    PBMaintEmailFrm.SupplierContact := 0;
    PBMaintEmailFrm.AddressType := 0;
    PBMaintEmailFrm.Customer := JobBag.customer;
    PBMaintEmailFrm.CustomerBranch := JobBag.Branch;
    PBMaintEmailFrm.CustomerContact := JobBag.ContactNo;
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

procedure TPBMaintJobBagFrm.btnAttachClick(Sender: TObject);
var
  DocDir: string;
begin
  DocDir := sPath;

  {Find a document};
  CopyDocuments(DocOpenDialog, DocDir,
    procedure
    begin
      ShowDocuments;
    end);
end;

procedure TPBMaintJobBagFrm.lstvwDocumentsDblClick(Sender: TObject);
var
//  sPath: string;
  sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
//  sPath := dmBroker.GetCompanyJobBagDirectory + '\' + inttostr(JobBag.dbKey) + '\';
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

procedure TPBMaintJobBagFrm.pmnuPasteClick(Sender: TObject);
var
  DocDir: string;
begin
  DocDir := dmBroker.GetCompanyJobBagDirectory;
  DocDir := IncludeTrailingPathDelimiter(DocDir) + inttostr(JobBag.dbkey);

  {Find a document}
  CopyDocumentsFromClipboard(DocDir,
    procedure
    begin
      ShowDocuments;
    end);
end;

procedure TPBMaintJobBagFrm.pmnuDeleteClick(Sender: TObject);
var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
begin
  sPath :=  dmBroker.GetCompanyJobBagDirectory + '\' + inttostr(JobBag.dbkey) + '\';
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

procedure TPBMaintJobBagFrm.chkbxFileCopiesClick(Sender: TObject);
begin
  if chkbxFileCopies.checked then
    begin
      edtDateCopiesReceived.Enabled := true;
      btnDateCopiesReceived.enabled := true;
//      JobBag.FileCopiesReceived := date;
//      JobBag.FileCopiesReceivedBy := frmPBMainMenu.iOperator;
//      JobBag.FileCopiesReceivedName := frmPBMainMenu.sOperator_Name
    end
  else
    begin
      edtDateCopiesReceived.Enabled := false;
      btnDateCopiesReceived.enabled := false;
//      JobBag.FileCopiesReceived := 0;
//      JobBag.FileCopiesReceivedBy := 0;
//      JobBag.FileCopiesReceivedName := '';
    end;
  if FActivated and (sender as TCheckbox).checked then
    btnDateCopiesReceivedClick(self);
//  CheckOK(self);
end;

procedure TPBMaintJobBagFrm.btnEmailSupplierClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  PBMaintEmailSupplierFrm := TPBMaintEmailSupplierFrm.create(self);
  try
    PBMaintEmailSupplierFrm.JobBag := JobBag;
    PBMaintEmailSupplierFrm.AddressType := 1;
    PBMaintEmailSupplierFrm.Customer := 0;
    PBMaintEmailSupplierFrm.CustomerBranch := 0;
    PBMaintEmailSupplierFrm.CustomerContact := 0;
    PBMaintEmailSupplierFrm.showmodal;
    if PBMaintEmailSupplierFrm.modalresult = idOK then
      begin
        sTo := PBMaintEmailSupplierFrm.edtEmail.text;
        sSubject := PBMaintEmailSupplierFrm.edtSubject.text;
        SendAndSaveEmail(sTo, sSubject);
      end;
  finally
    PBMaintEmailSupplierFrm.free;
  end;
end;

procedure TPBMaintJobBagFrm.lstvwDocumentsColumnClick(Sender: TObject;
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

  if SortedColumn = 2 then
    TListView(Sender).SortType := stData
  else
    TListView(Sender).SortType := stText;
end;

procedure TPBMaintJobBagFrm.lstvwDocumentsCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
  dtDate1, dtDate2: TDateTime;
  sTest: string;
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else
  if SortedColumn = 2 then
    begin
      sTest := DateTimeToStr(now);
      dtDate1 := strtoDateTime(trim(Item1.SubItems[SortedColumn-1]));
      dtDate2 := strtoDateTime(trim(Item2.SubItems[SortedColumn-1]));

      Compare := CompareDateTime(dtDate1, dtDate2);
    end
  else
    Compare := CompareText(Item1.SubItems[SortedColumn-1], Item2.SubItems[SortedColumn-1]) ;

  if Descending then
    Compare := -Compare;
end;

procedure TPBMaintJobBagFrm.btnDateCopiesReceivedClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateCopiesReceived.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDateCopiesReceived.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintJobBagFrm.dirlstJobDocumentsChange(Sender: TObject);
begin
  if FActivated then
    begin
      if pos(inttostr(JobBag.dbKey),dirlstJobDocuments.directory) = 0 then
        begin
          messagedlg('The selected folder is outside the location for this job bag and is therefore invalid', mtError,[mbOk], 0);
          dirlstJobDocuments.directory := sParentPath;
        end;

      sPath := trim(dirlstJobDocuments.directory) + '\';

      {Show documents in this folder}
      ShowDocuments;
    end;
end;

procedure TPBMaintJobBagFrm.btnSubRepClick(Sender: TObject);
begin
  PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
  try
    PBLUCRepFrm.bIs_Lookup := True;
    if dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator) then
      PBLUCRepFrm.bAllow_Upd := false
    else
      PBLUCRepFrm.bAllow_Upd := True;
    PBLUCRepFrm.bOnlyShowSubReps := True;

    PBLUCRepFrm.iCust := JobBag.Customer;
    PBLUCRepFrm.iBranch := JobBag.Branch;
    PBLUCRepFrm.sCustName := JobBag.CustomerName;
    PBLUCRepFrm.sBranchName := JobBag.BranchName;
    PBLUCRepFrm.SelCode := JobBag.SubRep;
    PBLUCRepFrm.ShowModal;
    if PBLUCRepFrm.bselected then
      begin
        JobBag.SubRep := PBLUCRepFrm.selcode;
        edtSubRep.Text := PBLUCRepFrm.SelName;
//        GetCustomerReps(PBLUCRepFrm.SelCode);
      end;
  finally
    PBLUCRepFrm.Free;
  end;
end;

procedure TPBMaintJobBagFrm.CheckForCustomerNotes;
begin
  if edtCustomer.text <> '' then
  begin
    PBLUCustFrm := TPBLUCustFrm.Create(Self);
    try
      PBLUCustFrm.SelCode := JobBag.Customer;
      PBLUCustFrm.SelBranch := JobBag.Branch;
      PBLUCustFrm.ShowCustomerData;
      if PBLUCustFrm.dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
        PBLUCustFrm.ShowNotes(self);
    finally
      PBLUCustFrm.Free;
    end;
  end;
end;

procedure TPBMaintJobBagFrm.chkbxInvoiceThisWeekClick(Sender: TObject);
begin
  if (Sender as TCheckBox).checked then
    begin
      edtDateCopiesReceived.Enabled := true;
      btnDateCopiesReceived.enabled := true;
    end
  else
    begin
      edtDateCopiesReceived.Enabled := false;
      btnDateCopiesReceived.enabled := false;
    end;
  if FActivated and (sender as TCheckbox).checked then
    lblInvoiceThisWeekDate.caption := PBDateStr(date);
end;

procedure TPBMaintJobBagFrm.btnEndUserClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.SelCode := JobBag.EndUserCustomer;
    PBLUCustFrm.SelBranch := JobBag.EndUserBranch;
    PBLUCustFrm.bEndUsers := true;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
      begin
        JobBag.EndUserCustomer := PBLUCustFrm.SelCode;
        JobBag.EndUserBranch := PBLUCustFrm.SelBranch;
        edtEndUser.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
      end;
  finally
    PBLUCustFrm.Free;
  end;

end;

procedure TPBMaintJobBagFrm.Delivery1Click(Sender: TObject);
var
  selcode: real;
  inx: integer;
  JobBagLine: TJobBagLine;
  bAuthorised: boolean;
  bCanConfirm: boolean;
begin
  bAuthorised := true;

  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);

  inx := jobbag.Lines.IndexOfSequence(inx);
  JobBagLine := JobBag.Lines[inx];

  selcode := JobBagLine.PurchaseOrder;
  bAuthorised := not JobBagLine.NeedsAuthorising;

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  bCanConfirm := true;

  frmpbluOrderDeliv := TfrmpbluOrderDeliv.create(self);
  try
    frmpbluOrderDeliv.Ordertype := 'PO';
    frmpbluOrderDeliv.CanConfirm := bCanConfirm;
    frmpbluOrderDeliv.OrderNumber := SelCode;
    frmpbluOrderDeliv.caption := frmpbluOrderDeliv.caption + ' ' + floattostr(SelCode);
    frmpbluOrderDeliv.showmodal;
  finally
    JobBagLine.JBLineStatusText := JobBag.DataModule.GetPOStatus(selcode,JobBagLine.Line,JobBag.DbKey,JobBagLine.JBLine,JobBagLine.JBLineInvoiced);
    ShowLineDetails;
    sgLines.Row := inx + 1;
    frmpbluOrderDeliv.free;
  end;
end;

procedure TPBMaintJobBagFrm.dblkpPackFormatClick(Sender: TObject);
begin
  JobBag.PackFormat := (Sender as TDBLookupComboBox).KeyValue;
end;

procedure TPBMaintJobBagFrm.rdgrpEnclosingTypeClick(Sender: TObject);
begin
  JobBag.EnclosingType := (Sender as TRadioGroup).items[(Sender as TRadioGroup).itemindex];
end;

procedure TPBMaintJobBagFrm.btnPackFormatClick(Sender: TObject);
begin
  PBLUPackFormatFrm := TPBLUPackFormatFrm.Create(Self);
  try
    PBLUPackFormatFrm.bIs_Lookup := True;
    PBLUPackFormatFrm.bAllow_Upd := True;
    PBLUPackFormatFrm.ShowModal;
    with JobBag.DataModule do
      begin
        qryPackFormat.close;
        qryPackFormat.parambyname('ID').asinteger := JobBag.PackFormat;
        qryPackFormat.Open;
      end;
  finally
    PBLUPackFormatFrm.Free;
  end;

end;

end.

