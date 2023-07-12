unit wtMaintQuote;

interface

uses                         
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Grids, DBCtrls, wtQuotesDm,
  CRControls, AllCommon, DB, DBTables, Spin, DateSelV5, ToolWin,
  ImgList, ShellAPI, Menus, Inifiles, DBGrids,
  taoCntrr, taoFrmts, taoMapi, Activex, AxCtrls, Clipbrd, ComObj,
  ShellCtrls;

type
  TfrmWTMaintQuote = class(TForm)
    pnlTop: TPanel;
    stsbrDetails: TStatusBar;
    pcDetails: TPageControl;
    tbWorktops: TTabSheet;
    tbCutOuts: TTabSheet;
    tbEdges: TTabSheet;
    tbUpstands: TTabSheet;
    tbCharges: TTabSheet;
    tbDocuments: TTabSheet;
    Label10: TLabel;
    sgElements: TStringGrid;
    sgCutOuts: TStringGrid;
    sgEdges: TStringGrid;
    sgExtras: TStringGrid;
    pnlFoot: TPanel;
    Panel5: TPanel;
    btnAddCutOuts: TBitBtn;
    btnChangeCutOuts: TBitBtn;
    btnDeleteCutOuts: TBitBtn;
    Panel6: TPanel;
    btnAddEdges: TBitBtn;
    btnChangeEdges: TBitBtn;
    btnDeleteEdges: TBitBtn;
    Panel7: TPanel;
    btnAddExtras: TBitBtn;
    btnChangeExtras: TBitBtn;
    btnDeleteExtras: TBitBtn;
    edtNettPrice: TMemo;
    tbCustomer: TTabSheet;
    Label4: TLabel;
    Label18: TLabel;
    btnCustomerSearch: TBitBtn;
    Label6: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    pnlAddress: TPanel;
    edtCustomerName: TEdit;
    edtStreet: TEdit;
    edtlocale: TEdit;
    edtTown: TEdit;
    edtPostcode: TEdit;
    edtCounty: TEdit;
    edtContact: TEdit;
    btnContactSearch: TBitBtn;
    pnlTelephone: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    edtTelephone: TEdit;
    edtEmail: TEdit;
    Telephone: TLabel;
    Email: TLabel;
    Panel1: TPanel;
    btnAddUpstds: TBitBtn;
    btnChangeUpstds: TBitBtn;
    btnDeleteUpstds: TBitBtn;
    sgUpstands: TStringGrid;
    tbEvents: TTabSheet;
    Panel3: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel18: TPanel;
    sgEvents: TStringGrid;
    memEventNotes: TMemo;
    btnAddEvents: TBitBtn;
    btnChangeEvents: TBitBtn;
    btnDeleteEvents: TBitBtn;
    tbInstallation: TTabSheet;
    Panel19: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    lblAccepted: TLabel;
    edtAccepted: TEdit;
    btnAccepted: TBitBtn;
    Label30: TLabel;
    edtTemplate: TEdit;
    btntemplate: TBitBtn;
    Label16: TLabel;
    Panel20: TPanel;
    memInstallAdd: TMemo;
    lblDeletePrompt: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label31: TLabel;
    pnlTotals: TPanel;
    lblDiscountRate: TLabel;
    edtDiscountRate: TCREditMoney;
    lblDiscountValue: TLabel;
    edtDiscountValue: TCREditMoney;
    Label11: TLabel;
    edtComplete: TMemo;
    edtInstallPrice: TCREditMoney;
    Label8: TLabel;
    Label9: TLabel;
    edtSurveyPrice: TCREditMoney;
    edtDeliveryPrice: TCREditMoney;
    Label14: TLabel;
    lblVat: TLabel;
    edtVatValue: TMemo;
    edtGrossPrice: TMemo;
    lblTotal: TLabel;
    Label28: TLabel;
    spnDepositTerms: TSpinEdit;
    edtDepositPaid: TCREditMoney;
    Label29: TLabel;
    Label17: TLabel;
    dblkpShowroom: TDBLookupComboBox;
    Label24: TLabel;
    btnContactClear: TSpeedButton;
    dblkpVatRate: TDBLookupComboBox;
    Label26: TLabel;
    edtInstallName: TEdit;
    Label27: TLabel;
    edtInstallPhone: TEdit;
    Panel2: TPanel;
    lblWTTotalArea: TLabel;
    lblWTTotalSales: TLabel;
    Panel10: TPanel;
    btnAddElts: TBitBtn;
    btnChangeElts: TBitBtn;
    btnDeleteElts: TBitBtn;
    btnGlobalElts: TBitBtn;
    Panel4: TPanel;
    lblUpTotalArea: TLabel;
    lblUpTotalSales: TLabel;
    Panel14: TPanel;
    lblCOTotalSales: TLabel;
    lblCOTotalCost: TLabel;
    Panel15: TPanel;
    lblEdgeTotalSales: TLabel;
    lblEdgeTotalCost: TLabel;
    Panel16: TPanel;
    lblExTotalSales: TLabel;
    lblExTotalCost: TLabel;
    tbAnalysis: TTabSheet;
    Panel17: TPanel;
    Label32: TLabel;
    memTotalCost: TMemo;
    memTotalSell: TMemo;
    ScrollBox1: TScrollBox;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    memTempMileageCost: TMemo;
    memExtrasCost: TMemo;
    memEdgeCost: TMemo;
    memCutOutCost: TMemo;
    memCutOutSell: TMemo;
    memEdgeSell: TMemo;
    memExtrasSell: TMemo;
    Label33: TLabel;
    Label34: TLabel;
    memTempLabourCost: TMemo;
    memTemplateSell: TMemo;
    memTempLabour: TMemo;
    Label35: TLabel;
    memTempLabourRate: TMemo;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label44: TLabel;
    memSlabArea: TMemo;
    memSlabCost: TMemo;
    memWorktopArea: TMemo;
    memWorktopSell: TMemo;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    memTemplateMargin: TMemo;
    Memo5: TMemo;
    Label48: TLabel;
    Memo6: TMemo;
    Memo7: TMemo;
    Memo8: TMemo;
    memTemplateMarginPerc: TMemo;
    Memo10: TMemo;
    Label49: TLabel;
    memFitMileageCost: TMemo;
    Label51: TLabel;
    memFitLabourCost: TMemo;
    memFittingSell: TMemo;
    memFitLabour: TMemo;
    Label52: TLabel;
    memFitLabourRate: TMemo;
    Label53: TLabel;
    memFittingMargin: TMemo;
    memFittingMarginPerc: TMemo;
    lblDiscountAnalysis: TLabel;
    Label57: TLabel;
    memSupplyCost: TMemo;
    memSupplyPrice: TMemo;
    memSupplyMargin: TMemo;
    memSupplyMarginPerc: TMemo;
    Shape1: TShape;
    memTotalMargin: TMemo;
    memTotalMarginPerc: TMemo;
    memDiscountValueAnalysis: TMemo;
    lblDiscountMarkup: TLabel;
    tbSlabs: TTabSheet;
    Panel24: TPanel;
    btnAddSlabs: TBitBtn;
    btnChangeSlabs: TBitBtn;
    btnDeleteSlabs: TBitBtn;
    Panel25: TPanel;
    lblSlabTotalArea: TLabel;
    lblSlabTotalCost: TLabel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    sgSlabs: TStringGrid;
    Label43: TLabel;
    memHandlingRate: TMemo;
    Label55: TLabel;
    memHandlingArea: TMemo;
    memHandlingCost: TMemo;
    Label58: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    memDelMileageCost: TMemo;
    memDelLabourCost: TMemo;
    memDeliverySell: TMemo;
    memDelLabour: TMemo;
    memDelLabourRate: TMemo;
    memDeliveryMargin: TMemo;
    memDeliveryMarginPerc: TMemo;
    chkbxDelMileage: TCheckBox;
    chkbxFitMileage: TCheckBox;
    chkbxTempMileage: TCheckBox;
    memMileage: TMemo;
    memMileageRate: TMemo;
    Panel11: TPanel;
    Label25: TLabel;
    imgDocuments: TImageList;
    imgIcons: TImageList;
    DocOpenDialog: TOpenDialog;
    svDlgOfficeDoc: TSaveDialog;
    btnGlobalUpstds: TBitBtn;
    memFitLabourMen: TMemo;
    Label12: TLabel;
    memDelLabourMen: TMemo;
    Label13: TLabel;
    lblUpTotalPolishCost: TLabel;
    chkbxDeclined: TCheckBox;
    lblReason: TLabel;
    dblkpReason: TDBLookupComboBox;
    btnReason: TButton;
    tbLinkedQuotes: TTabSheet;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    btnExcel: TToolButton;
    btnWord: TToolButton;
    btnEmail: TToolButton;
    btnAttach: TToolButton;
    lblSlabWasteCost: TLabel;
    lblWasteValue: TLabel;
    edtWasteValue: TMemo;
    chkbxApproved: TCheckBox;
    Label50: TLabel;
    edtTimescale: TEdit;
    Label54: TLabel;
    edtCallBackDay: TEdit;
    Label56: TLabel;
    edtCallBackTime: TEdit;
    chkbxOnMailingList: TCheckBox;
    lblDesigner: TLabel;
    dblkpDesigner: TDBLookupComboBox;
    btnDesigner: TBitBtn;
    lblFrontWTTotalArea: TLabel;
    lblFrontSlabTotalArea: TLabel;
    taoWinControl1: TtaoWinControl;
    taoWinControl1In1: TtaoInFileContents;
    taoWinControl1In2: TtaoInCells;
    taoWinControl1In3: TtaoInBiff8;
    taoWinControl1In4: TtaoInBiff5;
    taoWinControl1In5: TtaoInUnicodeText;
    taoWinControl1In6: TtaoInText;
    taoWinControl1In7: TtaoInHDrop;
    taoWinControl1In8: TtaoInShellIDList;
    taoWinControl1In9: TtaoInFileContentsW;
    taoWinControl1In10: TtaoInOEMessage;
    taoWinControl1In11: TtaoInURL;
    taoWinControl1In12: TtaoInURLNetscape4;
    taoWinControl1Out1: TtaoOutBiff8;
    taoWinControl1Out2: TtaoOutRtf;
    taoWinControl1Out3: TtaoOutUnicodeText;
    taoWinControl1Out4: TtaoOutText;
    taoWinControl1Out5: TtaoOutCells;
    taoWinControl1Out6: TtaoOutHDrop;
    taoWinControl1Out7: TtaoOutFileNameMap;
    taoWinControl1Out8: TtaoOutShellIDList;
    taoWinControl1Out9: TtaoOutFileDescriptor;
    taoWinControl1Out10: TtaoOutFileDescriptorW;
    taoWinControl1Out11: TtaoOutFileContents;
    taoWinControl1Out12: TtaoOutPreferredEffect;
    taoWinControl1Out13: TtaoOutURL;
    taoWinControl1Out14: TtaoOutURLShortcut;
    taoWinControl1Out15: TtaoOutURLShortcutTitle;
    pmnuDocuments: TPopupMenu;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    N2: TMenuItem;
    pmnuSelectAll: TMenuItem;
    lblSalesLead: TLabel;
    dblkpLeadSource: TDBLookupComboBox;
    btnSalesLead: TBitBtn;
    tbNotes: TTabSheet;
    Panel23: TPanel;
    Panel12: TPanel;
    bynSpecialInstructions: TBitBtn;
    pnlNotes: TPanel;
    memNotes: TMemo;
    Label65: TLabel;
    stvDocuments: TShellTreeView;
    slvDocuments: TShellListView;
    pnlRevenueCentre: TPanel;
    pnlHeader: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    btnHigh: TSpeedButton;
    btnLow: TSpeedButton;
    btnCalendarTask: TSpeedButton;
    Label63: TLabel;
    lblExpiryDate: TLabel;
    edtQuoteNumber: TEdit;
    dtpckQuoteDate: TDateTimePicker;
    dblkpOperator: TDBLookupComboBox;
    dblkpMaterial: TDBLookupComboBox;
    edtReference: TEdit;
    btnLUMatType: TBitBtn;
    edtDescription: TMemo;
    edtFollowUpDate: TEdit;
    btnFollowUpDate: TBitBtn;
    edtProject: TEdit;
    edtExpiryDate: TEdit;
    btnExpiryDate: TBitBtn;
    Label59: TLabel;
    dblkpRevenueCentre: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure edtReferenceChange(Sender: TObject);
    procedure edtInstallPriceChange(Sender: TObject);
    procedure edtSurveyPriceChange(Sender: TObject);
    procedure edtDeliveryPriceChange(Sender: TObject);
    procedure btnCustomerSearchClick(Sender: TObject);
    procedure dblkpMaterialClick(Sender: TObject);
    procedure btnAddEltsClick(Sender: TObject);
    procedure btnChangeEltsClick(Sender: TObject);
    procedure btnAddCutOutsClick(Sender: TObject);
    procedure btnChangeCutOutsClick(Sender: TObject);
    procedure btnAddEdgesClick(Sender: TObject);
    procedure btnChangeEdgesClick(Sender: TObject);
    procedure btnAddExtrasClick(Sender: TObject);
    procedure btnChangeExtrasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtContactChange(Sender: TObject);
    procedure btnAddUpstdsClick(Sender: TObject);
    procedure btnChangeUpstdsClick(Sender: TObject);
    procedure btnContactSearchClick(Sender: TObject);
    procedure edtDiscountRateChange(Sender: TObject);
    procedure edtDiscountValueChange(Sender: TObject);
    procedure edtDiscountRateEnter(Sender: TObject);
    procedure edtDiscountRateExit(Sender: TObject);
    procedure edtDiscountValueEnter(Sender: TObject);
    procedure edtDiscountValueExit(Sender: TObject);
    procedure btnDeleteEltsClick(Sender: TObject);
    procedure btnDeleteCutOutsClick(Sender: TObject);
    procedure btnDeleteEdgesClick(Sender: TObject);
    procedure btnDeleteUpstdsClick(Sender: TObject);
    procedure btnDeleteExtrasClick(Sender: TObject);
    procedure sgElementsDblClick(Sender: TObject);
    procedure sgCutOutsDblClick(Sender: TObject);
    procedure sgEdgesDblClick(Sender: TObject);
    procedure sgUpstandsDblClick(Sender: TObject);
    procedure sgExtrasDblClick(Sender: TObject);
    procedure btnAddEventsClick(Sender: TObject);
    procedure btnChangeEventsClick(Sender: TObject);
    procedure btnDeleteEventsClick(Sender: TObject);
    procedure sgEventsClick(Sender: TObject);
    procedure sgEventsDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure edtInstallPriceExit(Sender: TObject);
    procedure edtCustomerNameChange(Sender: TObject);
    procedure btnLUMatTypeClick(Sender: TObject);
    procedure edtDepositPaidChange(Sender: TObject);
    procedure spnDepositTermsChange(Sender: TObject);
    procedure edtTemplateExit(Sender: TObject);
    procedure btntemplateClick(Sender: TObject);
    procedure btnAcceptedClick(Sender: TObject);
    procedure btnGlobalEltsClick(Sender: TObject);
    procedure btnSalesLeadClick(Sender: TObject);
    procedure btnDesignerClick(Sender: TObject);
    procedure btnContactClearClick(Sender: TObject);
    procedure btnFollowUpDateClick(Sender: TObject);
    procedure edtFollowUpDateExit(Sender: TObject);
    procedure tbAnalysisShow(Sender: TObject);
    procedure memDiscountValueAnalysisChange(Sender: TObject);
    procedure memTemplateSellChange(Sender: TObject);
    procedure memTempMilesEnter(Sender: TObject);
    procedure memTempMilesChange(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure memFitLabourChange(Sender: TObject);
    procedure memTempLabourChange(Sender: TObject);
    procedure memFittingSellChange(Sender: TObject);
    procedure btnAddSlabsClick(Sender: TObject);
    procedure btnChangeSlabsClick(Sender: TObject);
    procedure btnDeleteSlabsClick(Sender: TObject);
    procedure sgSlabsDblClick(Sender: TObject);
    procedure memHandlingRateChange(Sender: TObject);
    procedure memDelLabourChange(Sender: TObject);
    procedure memDeliverySellChange(Sender: TObject);
    procedure chkbxTempMileageClick(Sender: TObject);
    procedure chkbxFitMileageClick(Sender: TObject);
    procedure chkbxDelMileageClick(Sender: TObject);
    procedure memMileageChange(Sender: TObject);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure mnuOpenDocumentClick(Sender: TObject);
    procedure mnuDeleteDocumentClick(Sender: TObject);
    procedure btnWordClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnGlobalUpstdsClick(Sender: TObject);
    procedure btnLowClick(Sender: TObject);
    procedure btnHighClick(Sender: TObject);
    procedure btnCalendarTaskClick(Sender: TObject);
    procedure chkbxDeclinedClick(Sender: TObject);
    procedure btnReasonClick(Sender: TObject);
    procedure tbLinkedQuotesShow(Sender: TObject);
    procedure bynSpecialInstructionsClick(Sender: TObject);
    procedure edtTimescaleChange(Sender: TObject);
    procedure edtCallBackDayChange(Sender: TObject);
    procedure edtCallBackTimeChange(Sender: TObject);
    procedure edtProjectChange(Sender: TObject);
    procedure dblkpVatRateClick(Sender: TObject);
    procedure btnExpiryDateClick(Sender: TObject);
    procedure taoWinControl1SetDataPaste(Sender: TObject;
      Data: IInterface);
    procedure taoWinControl1SetDataTarget(Sender: TObject;
      Data: IInterface; X, Y: Integer);
    procedure taoWinControl1UpdateAction(Sender: TObject;
      Action: TtaoUpdateAction; var Enable: Boolean);
    procedure pmnuDocumentsPopup(Sender: TObject);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure slvDocumentsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure stvDocumentsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure stvDocumentsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tbDocumentsShow(Sender: TObject);
    procedure dblkpRevenueCentreClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FRetailCustomer: bytebool;
    FUseMarkup: bytebool;
    FEmailApplication: string;
    FContractQuote: boolean;
    FOriginalQuoteFromReQuote: integer;
    procedure ShowElements;
    procedure ShowUpstands;
    procedure ShowCutOuts;
    procedure ShowEdges;
    procedure ShowExtras;
    procedure ShowSlabs;
    procedure ShowEvents;
    procedure ShowDetails;
    procedure ShowTotals;
    procedure ShowDiscount;
    procedure ShowDocuments(iQuote: integer);
    procedure ShowListViewDocuments(strPath: string; ListView: TListView;
      ImageList: TImageList);
    procedure BuildElementGrid;
    procedure BuildEdgeGrid;
    procedure BuildExtraGrid;
    procedure BuildSlabGrid;
    procedure BuildEventGrid;
    procedure BuildCutOutGrid;
    procedure BuildUpstandGrid;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure SetGridHeaders;
    procedure SetRetailCustomer(const Value: bytebool);
    procedure SetSalesLeadSource;
    procedure SetAddressFields(tempCode: integer);
    procedure ClearAddressFields;
    procedure CallMaintElement(aMode: TqelMode);
    procedure CallMaintCutOut(aMode: TqcoMode);
    procedure CallMaintEdge(aMode: TqedgMode);
    procedure CallMaintExtra(aMode: TqexMode);
    procedure CallMaintUpstand(aMode: TqelMode);
    procedure CallMaintEvent(aMode: TqevMode);
    procedure CallMaintSlab(aMode: TqslMode);
    procedure EnableAddButtons;
    function ShowNotes(TempNotes: integer): string;
    function UpdateNotes: Integer;
    function InputDate(TempDate: TDateTime): TDateTime;
    function UpdateInstallAddress: Integer;
    procedure SetContact(tempCode: integer);
    procedure ShowAnalysisTotals;
    procedure ShowAnalysisGrandTotals;
    function ShowMileageCost(sType: string): double;
    function ShowLabourCost(sType: string): double;
    procedure ShowTemplateTotals;
    procedure ShowFittingTotals;
    procedure ShowDeliveryTotals;
    function ShowHandlingCost: double;
    procedure SendAndSaveEmail(sTo, sSubject: string);
    procedure SetUseMarkup(const Value: bytebool);
    procedure CreateOutlookReminder;
    procedure SetEmailApplication(const Value: string);
    procedure ShowLinkedQuotes;
    procedure GetNotes(iNarrative: Integer);
    procedure SetContractQuote(const Value: boolean);
    procedure MoveOriginalQuoteDocuments;
    procedure SetOriginalQuoteFromReQuote(const Value: integer);
    function FormatDateasDateTime(sDate: string): TDateTime;
    procedure MyWinControlSetData(const Data: IInterface);
    function ParseDocumentFrom(tmpFrom: string): string;
    procedure ParseMessage(const AFileName: string; var ATo, AFrom,
      ASubject, ADate, ABody: string);
  private
    Descending: Boolean;
    SortedColumn: Integer;
    ExpiryDays: integer;
    FollowUpDays: integer;
    FActivated: Boolean;
    FMode: TqMode;
    FQuote: TQuote;
    sOldValue: string;
    procedure SetMode(const Value: TqMode);
    procedure SetQuote(const Value: TQuote);
  public
    bOK: boolean;
    bChangeRate: boolean;
    bChangeValue: boolean;
    property ContractQuote: boolean read FContractQuote write SetContractQuote;
    property EmailApplication: string read FEmailApplication write SetEmailApplication;
    property Mode: TqMode read FMode write SetMode;
    property OriginalQuoteFromReQuote: integer read FOriginalQuoteFromReQuote write SetOriginalQuoteFromReQuote;
    property Quote: TQuote read FQuote write SetQuote;
    property RetailCustomer: bytebool read FRetailCustomer write SetRetailCustomer;
    property UseMarkup: bytebool read FUseMarkup write SetUseMarkup;
  end;

var
  frmWTMaintQuote: TfrmWTMaintQuote;

implementation

uses
  wtCommon, WTSrchCustomer, wtMain, wtMaintQElement, wtMaintQCutOut, wtMaintQEdge,
  wtMaintQExtra, wtNotesDM, wtDataModule, wtMaintQUpstand, WTMaintQEvents,
  WTSrchCustContacts, wtLUMatType, WTMaintQElementM, WTMaintQUpstandM,
  wtLUSalesLead, WTLUDesigner, WTMaintQSlab, WTMaintEmail, WTWordOLE, WTExcelOLE,
  WTMaintContApp, wtLUReason, wtLUSpecialInstruction;

{$R *.DFM}

{ TfrmWtMaintQuote }

procedure TfrmWTMaintQuote.SetMode(const Value: TqMode);
begin
  FMode := Value;
  pnlTop.Enabled := (FMode <> qView);
  pnlTotals.Enabled := (FMode <> qView);
  tbCustomer.Enabled := (FMode <> qView) and (FMode <> qRestrict);
  tbWorktops.Enabled := (FMode <> qView) and (FMode <> qRestrict);
  tbEdges.Enabled := (FMode <> qView) and (FMode <> qRestrict);
  tbCutOuts.Enabled := (FMode <> qView) and (FMode <> qRestrict);
  tbInstallation.Enabled := (FMode <> qView) and (FMode <> qRestrict);
  tbUpstands.Enabled := (FMode <> qView) and (FMode <> qRestrict);
  tbCharges.Enabled := (FMode <> qView) and (FMode <> qRestrict);
//  tbDocuments.Enabled := FMode <> qView;
  tbEvents.Enabled := FMode <> qView;

// show accepted date if view mode
  edtAccepted.visible := FMode = qView;
  lblAccepted.visible := edtAccepted.visible;
  btnAccepted.visible := edtAccepted.visible;
end;

procedure TfrmWTMaintQuote.SetQuote(const Value: TQuote);
begin
  FQuote := Value;
end;

procedure TfrmWTMaintQuote.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    bChangeRate := false;
    bChangeValue := false;

    bOK := false;

    dtmdlWorktops.qryCompany.close;
    dtmdlWorktops.qryCompany.open;

    dblkpMaterial.listSource := Quote.DataModule.dtsMaterial;
    Quote.DataModule.qryMaterial.Close;
    Quote.DataModule.qryMaterial.parambyname('Material_Type').asinteger := Quote.Material;
    Quote.DataModule.qryMaterial.open;

    dblkpOperator.listSource := Quote.DataModule.dtsOperator;
    Quote.DataModule.qryOperator.Close;
    Quote.DataModule.qryOperator.parambyname('Operator').asinteger := Quote.AccountManager;
    Quote.DataModule.qryOperator.open;

    dblkpLeadSource.listSource := Quote.DataModule.dtsLeadSource;
    Quote.DataModule.qryLeadSource.close;
    Quote.DataModule.qryLeadSource.parambyname('Sales_Lead_Source').asinteger := Quote.LeadSource;
    Quote.DataModule.qryLeadSource.open;

    dblkpVatRate.listSource := Quote.DataModule.dtsVat;
    Quote.DataModule.qryVat.close;
    Quote.DataModule.qryVat.parambyname('Vat').asinteger := Quote.Vat;
    Quote.DataModule.qryVat.open;

    dblkpDesigner.listSource := Quote.DataModule.dtsDesigner;
    Quote.DataModule.qryDesigner.close;
    Quote.DataModule.qryDesigner.parambyname('Designer').asinteger := Quote.DesignerID;
    Quote.DataModule.qryDesigner.open;

    dblkpShowroom.listSource := Quote.DataModule.dtsBranch;
    Quote.DataModule.qryBranch.close;
    Quote.DataModule.qryBranch.parambyname('Customer').asinteger := Quote.Customer;
    Quote.DataModule.qryBranch.parambyname('Branch_no').asinteger := Quote.Branch;
    Quote.DataModule.qryBranch.open;

    dblkpReason.listsource := Quote.DataModule.dtsQReason;
    Quote.DataModule.qryQReason.close;
    Quote.DataModule.qryQReason.open;
    Quote.DataModule.qryQReason.First;

    dblkpRevenueCentre.listsource := Quote.DataModule.dtsRevenueCentre;
    Quote.DataModule.qryRevenueCentre.close;
    Quote.DataModule.qryRevenueCentre.open;
    Quote.DataModule.qryRevenueCentre.First;

    if Quote.DataModule.qryLeadSource.RecordCount = 1 then
      dblkpLeadSource.KeyValue := Quote.DataModule.qryLeadSource.fieldbyname('Sales_Lead_Source').asinteger;

    case Mode of
    qAdd     : Caption := 'Add a Quote';
    qChange  : Caption := 'Change a Quote';
    qDelete  : Caption := 'Delete a Quote';
    qCopy   : Caption := 'Copy a Quote';
    qRequote   : Caption := 'Requote a Quote';
    end;  { case }
    if (Mode = qAdd) or (Mode = qCopy) or (Mode = qRequote) then
      sTemp := ' New Quote '
    else
      sTemp := ' Quote ' + IntToStr(Quote.DbKey) + ' ';

    if (Mode = qCopy) or (Mode = qRequote) then
      begin
        Quote.DbKey := 0;
        Quote.Inactive := 'N';
      end;

    ShowDetails;
    ShowElements;
    ShowUpstands;
    ShowCutOuts;
    ShowEdges;
    ShowExtras;
    ShowSlabs;
    ShowEvents;

    if (Mode = qRequote) then
      ShowDocuments(OriginalQuoteFromReQuote)
    else
      ShowDocuments(Quote.dbKey);

    ShowTotals;
    {Had to put this in because the components where losing the Listdatasource}
    CheckOK(Self);
    FActivated := true;
  end;

  if frmWTMain.bEndUSer then
    begin
      lblSalesLead.Visible := false;
      dblkpLeadSource.visible := false;
      btnSalesLead.visible := false;
    end;
end;

procedure TfrmWTMaintQuote.ShowDetails;
var
  tmpDate: TDateTime;
begin
  if Mode = qAdd then
    begin
      edtQuoteNumber.text := '<New Quote>';
      dtpckQuoteDate.Date := date;

      btnCalendarTask.Visible := false;

      if ExpiryDays > 0 then
        begin
          tmpDate := date + ExpiryDays;
          edtExpiryDate.text := PADateStr(tmpdate);
        end
      else
        edtExpiryDate.text := '';

      if FollowUpDays > 0 then
        begin
          tmpDate := date + FollowUpDays;
          edtFollowUpDate.text := PADateStr(tmpdate);
        end
      else
        edtFollowUpDate.text := '';

      dblkpOperator.keyvalue := frmWTMain.Operator;
      edtCustomerName.text := Quote.CustomerName;

      edtReference.text := '';
      edtProject.text := '';
      edtContact.text := '';
      edtDescription.text := Quote.Description;
      edtTemplate.text := '';
      edtAccepted.Text := '';
      Quote.DiscountRate := dtmdlWorktops.GetDiscountRate;

      if dtmdlWorktops.UseRevenueCentres then
        begin
          dblkpRevenueCentre.KeyValue := dtmdlWorktops.GetOperatorRevenueCentre(frmWTMain.Operator);
          Quote.RevenueCentre := dblkpRevenueCentre.KeyValue;
        end
      else
        begin
          dblkpRevenueCentre.KeyValue := 0;
          Quote.RevenueCentre := 0;
        end;

      dblkpVatRate.keyvalue := 0;
      spnDepositTerms.value := 0;
      edtNettPrice.text := formatfloat('0.00',0.00);
      edtVatValue.text := formatfloat('0.00',0.00);
      edtdepositPaid.text := formatfloat('0.00',0.00);
      edtGrossPrice.text := formatfloat('0.00',0.00);
      edtInstallPrice.text := formatfloat('0.00',dtmdlWorktops.qryCompany.fieldbyname('Install_rate').asfloat);
      edtDeliveryPrice.text := formatfloat('0.00',dtmdlWorktops.qryCompany.fieldbyname('Delivery_rate').asfloat);
      edtSurveyPrice.text := formatfloat('0.00',dtmdlWorktops.qryCompany.fieldbyname('Survey_rate').asfloat);
      edtDiscountRate.text := formatfloat('0.00',Quote.DiscountRate);
      edtDiscountValue.text := formatfloat('0.00',0.00);
      edtWasteValue.text := formatfloat('0.00',0.00);

      memInstallAdd.lines.clear;
      edtInstallName.Text := '';
      edtInstallPhone.Text := '';
      self.RetailCustomer := false;
      self.UseMarkup := false;

      chkbxDeclined.Visible := false;
      chkbxDeclined.Checked := false;

      Quote.HandlingRate := dtmdlWorktops.GetDefaultHandlingRate;
      Quote.MileageRate := round(dtmdlWorktops.GetDefaultMileageRate);
      Quote.TemplateMileageRate := 0;
      Quote.TemplateLabourRate := dtmdlWorktops.GetDefaultLabourRate;
      Quote.FittingMileageRate := 0;
      Quote.FittingLabourRate := dtmdlWorktops.GetDefaultLabourRate;
      Quote.DeliveryMileageRate := 0;
      Quote.DeliveryLabourRate := dtmdlWorktops.GetDefaultLabourRate;

      if ContractQuote then
        begin
          if dtmdlWorktops.UseRevenueCentres then
            begin
              dblkpRevenueCentre.KeyValue := dtmdlWorktops.GetOperatorRevenueCentre(frmWTMain.Operator);
            end
          else
            dblkpRevenueCentre.KeyValue := 0;


          if (Quote.Address = 0) then
            SetAddressFields(quote.Customer)
          else
            SetAddressFields(quote.Address);

          dblkpMaterial.keyvalue := Quote.Material;

          if ExpiryDays > 0 then
            begin
              tmpDate := date + ExpiryDays;
              edtExpiryDate.text := PADateStr(tmpdate);
            end
          else
            edtExpiryDate.text := '';

          if FollowUpDays > 0 then
            begin
              tmpDate := date + FollowUpDays;
              edtFollowUpDate.text := PADateStr(tmpdate);
            end
          else
            edtFollowUpDate.text := paDateStr(date);

          edtReference.text := Quote.Reference;
          edtProject.Text := Quote.ProjectReference;

          dblkpLeadSource.keyvalue := dtmdlWorktops.GetCustomerSalesLeadSource;
          dblkpVatRate.keyvalue := Quote.DataModule.GetCustomerVat(Quote.Customer);
          edtInstallPrice.text := formatfloat('0.00',Quote.DataModule.GetContractInstallPrice(Quote.Customer));
          edtDeliveryPrice.text := formatfloat('0.00',Quote.DataModule.GetContractDeliveryPrice(Quote.Customer));
          edtSurveyPrice.text := formatfloat('0.00',Quote.DataModule.GetContractSurveyPrice(Quote.Customer));

          edtDiscountRate.text := formatfloat('0.00',0.00);
          edtDiscountValue.text := formatfloat('0.00',0.00);
        end;

      if frmWTMain.bEndUser then
        begin
          if ExpiryDays > 0 then
            begin
              tmpDate := date + ExpiryDays;
              edtExpiryDate.text := PADateStr(tmpdate);
            end
          else
            edtExpiryDate.text := '';

          if FollowUpDays > 0 then
            begin
              tmpDate := date + FollowUpDays;
              edtFollowUpDate.text := PADateStr(tmpdate);
            end
          else
            edtFollowUpDate.Text := paDateStr(date);

          if dtmdlWorktops.GetCustomerCount = 1 then
            begin
              Quote.Customer := dtmdlWorktops.GetOnlyCustomer;
            end;

          if Quote.Customer <> 0 then
            begin
              self.RetailCustomer := false;
              Quote.Speculative := false;
              edtCustomerName.Text := Quote.DataModule.GetCustomerName(Quote.Customer);
              self.SetAddressFields(Quote.Customer);
              self.SetContact(Quote.Customer);
              dblkpVatRate.keyvalue := Quote.DataModule.GetCustomerVat(Quote.Customer);
              edtDiscountRate.text := formatfloat('0.00',Quote.DataModule.GetCustomerDiscount(Quote.Customer));
            end;
        end;
    end
  else
    begin
      if Quote.dbKey = 0 then
        begin
          edtQuoteNumber.text := '<New Quote>';
          dtpckQuoteDate.Date := date;

          if dtmdlWorktops.UseRevenueCentres then
            begin
              dblkpRevenueCentre.KeyValue := dtmdlWorktops.GetOperatorRevenueCentre(frmWTMain.Operator);
            end
          else
            dblkpRevenueCentre.KeyValue := 0;

          if ExpiryDays > 0 then
            begin
              tmpDate := date + ExpiryDays;
              edtExpiryDate.text := PADateStr(tmpdate);
            end
          else
            edtExpiryDate.text := '';

          if FollowUpDays > 0 then
            begin
              tmpDate := date + FollowUpDays;
              edtFollowUpDate.text := PADateStr(tmpdate);
            end
          else
            edtFollowUpDate.text := '';

          btnCalendarTask.Visible := false;
          edtReference.text := Quote.Reference;
          edtProject.Text := Quote.ProjectReference;

          dblkpLeadSource.KeyValue := Quote.LeadSource;
          edtTemplate.Text := '';
          edtAccepted.Text := '';
          btnHigh.Flat := true;
          btnLow.Flat := true;

          chkbxDeclined.Checked := false;

          Quote.Operator := frmWTMain.Operator;
          Quote.OperatorName := frmWTMain.OperatorName;
        end
      else
        begin
          edtQuoteNumber.text := inttostr(Quote.dbKey);
          dtpckQuoteDate.Date := Quote.QDate;

          if Quote.ExpiryDate = 0 then
            begin
              if ExpiryDays > 0 then
                begin
                  tmpDate := date + ExpiryDays;
                  edtExpiryDate.text := PADateStr(tmpdate);
                end
              else
                edtExpiryDate.text := '';
            end
          else
            edtExpiryDate.text := PADateStr(Quote.ExpiryDate);

          edtFollowUpDate.text := PADateStr(Quote.DateRequired);

          btnCalendarTask.Visible := (copy(EmailApplication,1,3) = 'OUT');

          edtReference.text := Quote.Reference;
          edtProject.Text := Quote.ProjectReference;

          dblkpLeadSource.KeyValue := Quote.LeadSource;

          edtTemplate.Text := paDateStr(Quote.TemplateDate);
          edtAccepted.Text := paDateStr(Quote.AcceptedDate);

          chkbxDeclined.Checked := (Quote.Inactive = 'Y');
          dblkpReason.KeyValue := Quote.Reason;

          if Quote.Importance = 'H' then
            begin
              btnHigh.Flat := false;
              btnLow.Flat := true;
            end
          else
          if Quote.Importance = 'L' then
            begin
              btnHigh.Flat := true;
              btnLow.Flat := false;
            end
          else
            begin
              btnHigh.Flat := true;
              btnLow.Flat := true;
            end;

          dtmdlWorktops.CreateQuoteDirectory(inttostr(Quote.dbKey));
        end;
      chkbxApproved.Visible := (Quote.Status = 5);   {Status is Estimate pending}

      dblkpDesigner.KeyValue := Quote.DesignerID;
      dblkpShowroom.KeyValue := Quote.Branch;
      dblkpMaterial.keyvalue := Quote.Material;
      dblkpOperator.KeyValue := Quote.AccountManager;

      dblkpRevenueCentre.keyvalue := Quote.RevenueCentre;
      
      edtCustomerName.text := Quote.CustomerName;
      edtDescription.text := Quote.description;
      edtContact.text := Quote.ContactName;
      self.RetailCustomer := (Quote.Address <> 0) and (not Quote.Speculative);
      self.UseMarkup := self.RetailCustomer and dtmdlWorktops.PricesAreTrade;

      if (Quote.Address = 0) then
        SetAddressFields(quote.Customer)
      else
        SetAddressFields(quote.Address);

      memNotes.text := ShowNotes(Quote.ExtraNotes);

      memInstallAdd.Text := ShowNotes(Quote.InstallAddress);
      edtInstallName.Text := Quote.InstallName;
      edtInstallPhone.Text := Quote.InstallPhone;

      spnDepositTerms.value := round(Quote.DepositTerms);
      edtdepositPaid.text := formatfloat('0.00',Quote.DepositAmount);
      edtInstallPrice.Text := formatfloat('0.00',Quote.InstallPrice);
      edtSurveyPrice.Text := formatfloat('0.00',Quote.SurveyPrice);
      edtDeliveryPrice.Text := formatfloat('0.00',Quote.DeliveryPrice);

      edtCallBackDay.text := Quote.CallBackDay;
      edtCallBackTime.Text := Quote.CallBackTime;

      edtTimescale.text := Quote.Timescale;

      if self.UseMarkup then
        begin
          edtDiscountRate.Text := formatfloat('0.00',Quote.MarkupRate);
          edtDiscountValue.text := formatfloat('0.00',Quote.MarkupValue);
        end
      else
        begin
          edtDiscountRate.Text := formatfloat('0.00',Quote.DiscountRate);
          edtDiscountValue.text := formatfloat('0.00',Quote.DiscountValue);
        end;

//      lblVatRate.caption := formatfloat('0.00',Quote.VatRate);
      dblkpVatRate.keyvalue := Quote.Vat;

      stsbrDetails.Panels[0].Text := 'Created by: ' + Quote.OperatorName;
      stsbrDetails.Panels[1].Text := 'Original Quote: ' + floattostr(Quote.OriginalQuote);

      ShowTotals;
    end;

  if ContractQuote then
    begin
      Quote.CutOutDiscount := Quote.DataModule.GetContractCutOutDiscount(Quote.Customer);
      Quote.EdgeDiscount := Quote.DataModule.GetContractEdgeDiscount(Quote.Customer);
    end;

  pnlTop.enabled := not(Mode = qView) and not(Mode = qDelete);
  EnableAddButtons;
//  btnOK.Visible := not(Mode = qView);
  lbldeleteprompt.visible := (Mode = qDelete);

  CheckOK(self);
end;

function TfrmWTMaintQuote.ShowNotes(TempNotes: integer): string;
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

function TfrmWTMaintQuote.UpdateInstallAddress: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := Quote.InstallAddress;
    Notes.Data := memInstallAdd.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintQuote.UpdateNotes: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := Quote.ExtraNotes;
    Notes.Data := memNotes.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

procedure TfrmWTMaintQuote.CheckOK(Sender: TObject);
begin
  btnOK.enabled :=  (trim(edtCustomerName.Text) <> '') and
                    (trim(edtDescription.Text) <> '') and
                    (trim(edtReference.Text) <> '') and
                    (dblkpMaterial.keyvalue <> 0);
end;

procedure TfrmWTMaintQuote.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
    rowcount := 2;
    end;
end;

procedure TfrmWTMaintQuote.ShowCutOuts;
begin
  if Mode = qAdd then
    begin
      ClearGrid(sgCutOuts);  {Clear contents of Line grid}
      BuildCutOutGrid;
    end
  else
    begin
      ClearGrid(sgCutOuts);  {Clear contents of Line grid}
      BuildCutOutGrid;
    end;
end;

procedure TfrmWTMaintQuote.ShowEdges;
begin
  if Mode = qAdd then
    begin
      ClearGrid(sgEdges);  {Clear contents of Line grid}
      BuildEdgeGrid;
    end
  else
    begin
      ClearGrid(sgEdges);  {Clear contents of Line grid}
      BuildEdgeGrid;
    end;

end;

procedure TfrmWTMaintQuote.ShowTotals;
begin
  edtNettPrice.Text := formatfloat('0.00',Quote.TotalPrice);
  edtWasteValue.Text := formatfloat('0.00',Quote.TotalWasteCost);
  edtComplete.Text := formatfloat('0.00',(Quote.TotalPrice-Quote.DiscountValue+Quote.MarkupValue+Quote.TotalWasteCost));
  edtVatValue.Text := formatfloat('0.00',Quote.TotalVat);
  edtGrossPrice.Text := formatfloat('0.00',(Quote.TotalGross+Quote.TotalVat));
end;

procedure TfrmWTMaintQuote.ShowDiscount;
var
  rDiscount: real;
begin
  if self.UseMarkup then
    begin
      Quote.DiscountRate := 0;
      Quote.DiscountValue := 0;
      rDiscount := Quote.TotalPrice * (Quote.MarkupRate/100);
      edtDiscountValue.text := formatfloat('0.00',rDiscount);
      Quote.MarkupValue := rDiscount;
    end
  else
    begin
      Quote.MarkupRate := 0;
      Quote.MarkupValue := 0;
//      rDiscount := Quote.TotalPrice * (Quote.DiscountRate/100);
      rDiscount := Quote.TotalDiscountablePrice * (Quote.DiscountRate/100);
      edtDiscountValue.text := formatfloat('0.00',rDiscount);
      Quote.DiscountValue := rDiscount;
    end;
end;

procedure TfrmWTMaintQuote.ShowElements;
begin
  if Mode = qAdd then
    begin
      ClearGrid(sgElements);  {Clear contents of Line grid}
      BuildElementGrid;
    end
  else
    begin
      ClearGrid(sgElements);  {Clear contents of Line grid}
      BuildElementGrid;
    end;
end;

procedure TfrmWTMaintQuote.ShowUpstands;
begin
  if Mode = qAdd then
    begin
      ClearGrid(sgUpstands);  {Clear contents of Line grid}
      BuildUpstandGrid;
    end
  else
    begin
      ClearGrid(sgUpstands);  {Clear contents of Line grid}
      BuildUpstandGrid;
    end;
end;

procedure TfrmWTMaintQuote.ShowExtras;
begin
  if Mode = qAdd then
    begin
      ClearGrid(sgExtras);  {Clear contents of Line grid}
      BuildExtraGrid;
    end
  else
    begin
      ClearGrid(sgExtras);  {Clear contents of Line grid}
      BuildExtraGrid;
    end;
end;

procedure TfrmWTMaintQuote.ShowSlabs;
begin
  if Mode = qAdd then
    begin
      ClearGrid(sgSlabs);  {Clear contents of Line grid}
      BuildSlabGrid;
    end
  else
    begin
      ClearGrid(sgSlabs);  {Clear contents of Line grid}
      BuildSlabGrid;
    end;
end;

procedure TfrmWTMaintQuote.BuildElementGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgElements, Quote.datamodule do
    begin
      for i := 0 to pred(Quote.Elements.count) do
        begin
        cells[0,i+1] := inttostr(Quote.Elements[i].QENumber);
        cells[1,i+1] := Quote.Elements[i].worktopDesc;
        cells[2,i+1] := Quote.Elements[i].thicknessDesc;
        cells[3,i+1] := inttostr(Quote.Elements[i].Length);
        cells[4,i+1] := floattostr(Quote.Elements[i].depth);
        cells[5,i+1] := floattostr(Quote.Elements[i].Quantity);
        cells[6,i+1] := formatfloat('0.00',Quote.Elements[i].TotalArea);
        cells[7,i+1] := formatfloat('0.00',Quote.Elements[i].UnitPrice);
        cells[8,i+1] := formatfloat('0.00',Quote.Elements[i].TotalPrice);
        cells[9,i+1] := Quote.Elements[i].ElementDescription;

        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;

  lblWTTotalArea.Caption := 'Total Worktop Area (sqm): ' + formatfloat('0.00',Quote.Elements.TotalArea);
  lblFrontWTTotalArea.Caption := 'Total Material Area (sqm): ' + formatfloat('0.00',(Quote.Elements.TotalArea + Quote.Upstands.TotalArea));
  lblWTTotalSales.Caption := 'Total Worktop Price: ' + formatfloat('0.00',Quote.Elements.TotalSales);

  btnChangeElts.enabled := not (Quote.Elements.count = 0);
  btnDeleteElts.enabled := not (Quote.Elements.count = 0);
  btnGlobalElts.enabled := not (Quote.Elements.count = 0);

end;

procedure TfrmWTMaintQuote.BuildUpstandGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgUpstands, Quote.datamodule do
    begin
      for i := 0 to pred(Quote.Upstands.count) do
        begin
        cells[0,i+1] := inttostr((Quote.Upstands[i].QENumber - 1000));
        cells[1,i+1] := Quote.Upstands[i].worktopDesc;
        cells[2,i+1] := Quote.Upstands[i].thicknessDesc;
        cells[3,i+1] := floattostr(Quote.Upstands[i].depth);
        cells[4,i+1] := inttostr(Quote.Upstands[i].Length);
        cells[5,i+1] := floattostr(Quote.Upstands[i].Quantity);
        cells[6,i+1] := formatfloat('0.00',Quote.Upstands[i].TotalArea);
        cells[7,i+1] := formatfloat('0.00',Quote.Upstands[i].UnitPrice);
        cells[8,i+1] := formatfloat('0.00',Quote.Upstands[i].TotalPolishPrice);
        cells[9,i+1] := formatfloat('0.00',Quote.Upstands[i].TotalPrice);
         if trim(Quote.Upstands[i].MaterialUseDescr) = '' then
          cells[10,i+1] := 'Upstand'
        else
          cells[10,i+1] := Quote.Upstands[i].MaterialUseDescr;
        cells[11,i+1] := inttostr(Quote.Upstands[i].TotalUpstandPieces);

        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;

  lblUpTotalArea.Caption := 'Total Upstand Area (sqm): ' + formatfloat('0.00',Quote.Upstands.TotalArea);

  lblFrontWTTotalArea.Caption := 'Total Material Area (sqm): ' + formatfloat('0.00',(Quote.Elements.TotalArea + Quote.Upstands.TotalArea));

  lblUpTotalSales.Caption := 'Total Upstand Price: ' + formatfloat('0.00',Quote.Upstands.TotalSales);
  lblUpTotalPolishCost.Caption := 'Total Upstand Edge Polish Cost: ' + formatfloat('0.00',Quote.Upstands.TotalCosts);

  btnChangeUpstds.enabled := not (Quote.Upstands.count = 0);
  btnDeleteUpstds.enabled := not (Quote.Upstands.count = 0);
  btnGlobalUpstds.enabled := not (Quote.Upstands.count = 0);

end;

procedure TfrmWTMaintQuote.BuildCutOutGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgCutOuts, Quote.datamodule do
    begin
      for i := 0 to pred(Quote.CutOuts.count) do
        begin
        cells[0,i+1] := inttostr(Quote.CutOuts[i].QCONumber);
        cells[1,i+1] := Quote.CutOuts[i].CutOutDesc;
        cells[2,i+1] := Quote.CutOuts[i].EdgeTypeDesc;
        cells[3,i+1] := floattostr(Quote.CutOuts[i].Quantity);
        cells[4,i+1] := formatfloat('0.00',Quote.CutOuts[i].UnitCost);
        cells[5,i+1] := formatfloat('0.00',Quote.CutOuts[i].UnitPrice);
        cells[6,i+1] := formatfloat('0.00',Quote.CutOuts[i].TotalPrice);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;

  lblCOTotalSales.Caption := 'Total Cut Out Price: ' + formatfloat('0.00',Quote.CutOuts.TotalSales);
  lblCOTotalCost.Caption := 'Total Cut Out Cost: ' + formatfloat('0.00',Quote.CutOuts.TotalCosts);

  btnChangeCutOuts.enabled := not (Quote.CutOuts.count = 0);
  btnDeleteCutOuts.enabled := not (Quote.CutOuts.count = 0);
end;

procedure TfrmWTMaintQuote.BuildEdgeGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgEdges, Quote.datamodule do
    begin
      for i := 0 to pred(Quote.Edges.count) do
        begin
        cells[0,i+1] := inttostr(Quote.Edges[i].QEdgNumber);
        cells[1,i+1] := Quote.Edges[i].EdgeDesc;
        cells[2,i+1] := Quote.Edges[i].EdgeTypeDesc;
        cells[3,i+1] := floattostr(Quote.Edges[i].Length);
        cells[4,i+1] := formatfloat('0.00',Quote.Edges[i].UnitCost);
        cells[5,i+1] := formatfloat('0.00',Quote.Edges[i].UnitPrice);
        cells[6,i+1] := formatfloat('0.00',Quote.Edges[i].TotalPrice);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;

  lblEdgeTotalSales.Caption := 'Total Edge Price: ' + formatfloat('0.00',Quote.Edges.TotalSales);
  lblEdgeTotalCost.Caption := 'Total Edge Cost: ' + formatfloat('0.00',Quote.Edges.TotalCosts);

  btnChangeEdges.enabled := not (Quote.Edges.count = 0);
  btnDeleteEdges.enabled := not (Quote.Edges.count = 0);
end;

procedure TfrmWTMaintQuote.BuildExtraGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgExtras, Quote.datamodule do
    begin
      for i := 0 to pred(Quote.Extras.count) do
        begin
        cells[0,i+1] := inttostr(Quote.Extras[i].QEXNumber);
        cells[1,i+1] := Quote.Extras[i].ExtraDesc;
        cells[2,i+1] := floattostr(Quote.Extras[i].Quantity);
        cells[3,i+1] := formatfloat('0.00',Quote.Extras[i].UnitCost);
        cells[4,i+1] := formatfloat('0.00',Quote.Extras[i].UnitPrice);
        cells[5,i+1] := formatfloat('0.00',Quote.Extras[i].TotalPrice);
        if Quote.Extras[i].DoNotDiscount then
          cells[6,i+1] := 'No'
        else
          cells[6,i+1] := 'Yes';

        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;

  lblExTotalSales.Caption := 'Extras Total Price: ' + formatfloat('0.00',Quote.Extras.TotalSales);
  lblExTotalCost.Caption := 'Extras Total Cost: ' + formatfloat('0.00',Quote.Extras.TotalCosts);

  btnChangeExtras.enabled := not (Quote.Extras.count = 0);
  btnDeleteExtras.enabled := not (Quote.Extras.count = 0);
end;

procedure TfrmWTMaintQuote.BuildSlabGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgSlabs, Quote.datamodule do
    begin
      for i := 0 to pred(Quote.Slabs.count) do
        begin
        cells[0,i+1] := inttostr(Quote.Slabs[i].QSlabNo);
        cells[1,i+1] := Quote.Slabs[i].WorktopDesc;
        cells[2,i+1] := Quote.Slabs[i].ThicknessDesc;
        cells[3,i+1] := Quote.Slabs[i].SupplierName;
        cells[4,i+1] := formatfloat('0.00',Quote.Slabs[i].Quantity);
        cells[5,i+1] := inttostr(Quote.Slabs[i].Length);
        cells[6,i+1] := inttostr(Quote.Slabs[i].Depth);
        cells[7,i+1] := formatfloat('0.00',Quote.Slabs[i].TotalArea);
        cells[8,i+1] := formatfloat('0.00',Quote.Slabs[i].UnitCost);
        cells[9,i+1] := formatfloat('0.00',Quote.Slabs[i].TotalCost);
        cells[10,i+1] := formatfloat('0.00',Quote.Slabs[i].TotalWasteCost);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;

  lblSlabWasteCost.Caption := 'Total Waste Cost: ' + formatfloat('0.00',Quote.Slabs.TotalWasteCosts);
  lblSlabTotalCost.Caption := 'Total Slab Cost: ' + formatfloat('0.00',Quote.Slabs.TotalCosts);

  lblSlabTotalArea.Caption := 'Total Slab Area (sqm): ' + formatfloat('0.00',Quote.Slabs.TotalArea);
  lblFrontSlabTotalArea.Caption := lblSlabTotalArea.Caption;

  btnChangeSlabs.enabled := not (Quote.Slabs.count = 0);
  btnDeleteSlabs.enabled := not (Quote.Slabs.count = 0);
end;

procedure TfrmWTMaintQuote.SetGridHeaders;
begin
  {Element header}
  sgElements.cells[0,0] := 'No';
  sgElements.cells[1,0] := 'Worktop';
  sgElements.cells[2,0] := 'Thick (mm)';
  sgElements.cells[3,0] := 'Length (mm)';
  sgElements.cells[4,0] := 'Depth (mm)';
  sgElements.cells[5,0] := 'Qty';
  sgElements.cells[6,0] := 'Area (sqm)';
  sgElements.cells[7,0] := 'Unit Price';
  sgElements.cells[8,0] := 'Total';
  sgElements.cells[9,0] := 'Description';

  {Upstand header}
  sgUpstands.cells[0,0] := 'No';
  sgUpstands.cells[1,0] := 'Material/Colour';
  sgUpstands.cells[2,0] := 'Thick (mm)';
  sgUpstands.cells[3,0] := 'Depth (mm)';
  sgUpstands.cells[4,0] := 'Length (mm)';
  sgUpstands.cells[5,0] := 'Qty';
  sgUpstands.cells[6,0] := 'Area (sqm)';
  sgUpstands.cells[7,0] := 'Unit Price';
  sgUpstands.cells[8,0] := 'Polish';
  sgUpstands.cells[9,0] := 'Total';
  sgUpstands.cells[10,0] := 'Used for';
  sgUpstands.cells[11,0] := 'No. of Pieces';

  {CutOut header}
  sgCutOuts.cells[0,0] := 'No';
  sgCutOuts.cells[1,0] := 'Cutout';
  sgCutOuts.cells[2,0] := 'Edge Type';
  sgCutOuts.cells[3,0] := 'Qty';
  sgCutOuts.cells[4,0] := 'Unit Cost';
  sgCutOuts.cells[5,0] := 'Unit Price';
  sgCutOuts.cells[6,0] := 'Total Price';

  {Edge header}
  sgEdges.cells[0,0] := 'No';
  sgEdges.cells[1,0] := 'Edge';
  sgEdges.cells[2,0] := 'Edge Type';
  sgEdges.cells[3,0] := 'Length';
  sgEdges.cells[4,0] := 'Unit Cost';
  sgEdges.cells[5,0] := 'Unit Price';
  sgEdges.cells[6,0] := 'Total Price';

  {Extras header}
  sgExtras.cells[0,0] := 'No';
  sgExtras.cells[1,0] := 'Extra Charge';
  sgExtras.cells[2,0] := 'Quantity';
  sgExtras.cells[3,0] := 'Unit Cost';
  sgExtras.cells[4,0] := 'Unit Price';
  sgExtras.cells[5,0] := 'Total Price';
  sgExtras.cells[6,0] := 'Discounted';

  {Event header}
  sgEvents.cells[0,0] := 'No';
  sgEvents.cells[1,0] := 'Date/Time';
  sgEvents.cells[2,0] := 'Operator';

  {Analysis Headers}
  sgSlabs.cells[0,0] := 'No';
  sgSlabs.cells[1,0] := 'Colour';
  sgSlabs.cells[2,0] := 'Thickness';
  sgSlabs.cells[3,0] := 'Supplier';
  sgSlabs.cells[4,0] := 'No. of Slabs';
  sgSlabs.cells[5,0] := 'Length (mm)';
  sgSlabs.cells[6,0] := 'Depth (mm)';
  sgSlabs.cells[7,0] := 'Area sqm';
  sgSlabs.cells[8,0] := 'Cost';
  sgSlabs.cells[9,0] := 'Total Cost';
  sgSlabs.cells[10,0] := 'Waste Cost';

end;

procedure TfrmWTMaintQuote.FormCreate(Sender: TObject);
var
  TempArray: array[0..255] of Char;
begin
  SetGridHeaders;
  dtmdlNotes := TdtmdlNotes.create(self);

  {Decide whether to show expiry date info}
  ExpiryDays := dtmdlWorktops.GetNumberOfExpiryDays;
  FollowUpDays := dtmdlWorktops.GetNumberofFollowUpDays;

  lblExpiryDate.Visible := (ExpiryDays > 0);
  edtExpiryDate.Visible := lblExpiryDate.Visible;
  btnExpiryDate.Visible := lblExpiryDate.Visible;

  chkbxApproved.Visible := false;

  pnlRevenueCentre.Visible := dtmdlWorktops.UseRevenueCentres;
  pcDetails.Pages[6].TabVisible := dtmdlWorktops.UseCostingSystem;
  lblWasteValue.Visible := pcDetails.Pages[6].TabVisible;
  edtWasteValue.Visible := pcDetails.Pages[6].TabVisible;
  pcDetails.Pages[11].TabVisible := pcDetails.Pages[6].TabVisible;

  pcDetails.ActivePage := tbCustomer;
  AllCommon.LoadFormLayout('myWorktops.ini', self);

  GetPrivateProfileString('Email', 'Application', '', TempArray,
    sizeof(TempArray), 'myworktops.ini');

  EmailApplication := TempArray;
end;

procedure TfrmWTMaintQuote.btnOKClick(Sender: TObject);
var
  iQuoteFollowUpReminder: integer;
  iSlabs, iElements: integer;
  bAllSlabsExists, bSlabExists: boolean;
begin
  bOK := true;
  if Mode = qDelete then
    if MessageDlg('Are you sure you want to delete this quote?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

  if not frmWTMain.bEndUser then
    begin
      if ((Mode = qAdd) or (Mode = qcopy) or (Mode = qRequote)) and (dblkpLeadSource.Text = '') then
        begin
          messagedlg('Cannot save this quote, you must enter a Sales Lead Source', mterror,
            [mbOk], 0);
          dblkpLeadSource.SetFocus;
          exit;
        end;
    end;

  if ((Mode = qAdd) or (Mode = qcopy) or (Mode = qChange)  or (Mode = qRequote)) and ((Quote.Elements.TotalArea > 0) or (Quote.Upstands.TotalArea > 0)) and (dtmdlWorktops.UseCostingSystem) and (not Quote.ContractQuote) then
    begin
      if Quote.Slabs.count = 0 then
        begin
          MessageDlg('Cost Analysis is in use, slab details for this quote must be provided', mterror, [mbOk], 0);
          pcDetails.ActivePage := tbSlabs;
          CallMaintSlab(qslAdd);
          exit;
        end;

      {Check that total area of slabs meets requirements}
      if Quote.Slabs.TotalArea < (Quote.Elements.TotalArea + Quote.Upstands.TotalArea) then
        begin
          MessageDlg('The slab requirements doesn''t cover the total material requirement for this quote', mterror, [mbOk], 0);
          exit;
        end;

      {Check that all the slabs are for the elements in the quote}
      bAllSlabsExists := true;
      for iSlabs := 0 to pred(Quote.slabs.count) do
        begin
          bSlabExists := false;
          for iElements := 0 to pred(Quote.elements.count) do
            begin
              if (Quote.Slabs[iSlabs].worktop = Quote.elements[iElements].worktop) AND (Quote.Slabs[iSlabs].thickness = Quote.elements[iElements].thickness) then
                begin
                  bSlabExists := true;
                  break;
                end;
            end;

          if bSlabExists then
            continue;

          for iElements := 0 to pred(Quote.Upstands.count) do
            begin
              if (Quote.Slabs[iSlabs].worktop = Quote.Upstands[iElements].worktop) AND (Quote.Slabs[iSlabs].thickness = Quote.Upstands[iElements].thickness) then
                begin
                  bSlabExists := true;
                  break;
                end;
            end;

          if bSlabExists then
            continue
          else
            bAllSlabsExists := false;
        end;


      if bAllSlabsExists = false then
        begin
          MessageDlg('The slab details entered don''t match the element requirements for the quote', mterror, [mbOk], 0);
          exit;
        end;
    end;

  if ((Mode = qAdd) or (Mode = qcopy) or (Mode = qChange) or (Mode = qRequote)) then
    begin
      if trim(edtFollowUpDate.text) = '' then
        begin
          MessageDlg('Please enter a follow up date for this quote', mterror, [mbOk], 0);
          edtFollowUpDate.SetFocus;
          exit;
        end;

      if chkbxDeclined.Checked and (dblkpReason.Text = '') then
        begin
          messagedlg('If the quote is to be declined then please select a reason', mtError, [mbOk], 0);
          dblkpReason.setfocus;
          exit;
        end;
    end;

  if (Mode = qcopy) or (Mode = qRequote) then
    begin
      Quote.Address := 0;
      Quote.ExtraNotes := 0;
      Quote.Terms := 0;
      Quote.Availability := 0;
      Quote.InstallAddress := 0;
    end;

  if self.UseMarkup then
    begin
      Quote.DiscountRate := 0;
      Quote.DiscountValue := 0;
    end
  else
    begin
      Quote.MarkupRate := 0;
      Quote.MarkupValue := 0;
    end;

  Quote.QDate := dtpckQuoteDate.date;
  Quote.DateRequired := PADateStr(edtFollowUpDate.text);
  
  if edtExpiryDate.Text = '' then
    Quote.ExpiryDate := 0
  else
    Quote.ExpiryDate := PADateStr(edtExpiryDate.Text);

  Quote.AcceptedDate := paDateStr(edtAccepted.text);

  Quote.TemplateDate := paDateStr(edtTemplate.text);
  Quote.Retail := self.RetailCustomer;
  Quote.ExtraNotes := UpdateNotes;
  Quote.Terms := 0;
  Quote.Availability := 0;
  Quote.InstallAddress := UpdateInstallAddress;
  Quote.AccountManager := dblkpOperator.keyvalue;
  Quote.Operator := frmWTMain.Operator;

  {If declined then set the reason}
  if chkbxDeclined.checked then
    Quote.Inactive := 'Y'
  else
    Quote.Inactive := 'N';

  try
    Quote.Reason := dblkpReason.KeyValue;
  except
    Quote.Reason := 0;
  end;

  {Set the Impoirtance}
  if btnHigh.Flat = false then
    Quote.Importance := 'H'
  else
  if btnLow.Flat = false then
    Quote.Importance := 'L'
  else
    Quote.Importance := '';

  if dblkpLeadSource.Text = '' then
    Quote.LeadSource := 0
  else
    Quote.LeadSource := dblkpLeadSource.KeyValue;

  if dblkpDesigner.Text = '' then
    Quote.DesignerID := 0
  else
    Quote.DesignerID := dblkpDesigner.KeyValue;

  Quote.Vat := dblkpVatRate.KeyValue;

  Quote.InstallName := edtInstallName.text;
  Quote.InstallPhone := edtInstallPhone.text;

  if dblkpShowroom.Text = '' then
    Quote.Branch := 0
  else
    Quote.Branch := dblkpShowroom.KeyValue;

  if RetailCustomer or Quote.Speculative then
    Quote.Address := Quote.DataModule.SetAddress(Quote.Address,
                                                edtCustomerName.text,
                                                edtStreet.text,
                                                edtLocale.text,
                                                edtTown.text,
                                                edtPostcode.text,
                                                edtCounty.text,
                                                edtTelephone.text,
                                                edtEmail.text);

  if (Mode = qChange) and chkbxApproved.Visible and chkbxApproved.Checked then
    Quote.Status := 10;

  if (Mode = qAdd) or (Mode = qChange) or (Mode = qCopy) or (Mode = qRequote) or (Mode = qRestrict) or (Mode = qView) then
    begin
      Quote.SaveToDB(true);

      if Mode = qRequote then
        begin
          MoveOriginalQuoteDocuments;
        end;

      if (Mode = qAdd) or (Mode = qCopy) or (Mode = qRequote) then
        begin
          messagedlg('Quote number '+ floattostr(Quote.dbKey)+ ' created', mtInformation, [mbOk], 0);

          {Set a follow up date}
          if (copy(EmailApplication,1,3) = 'OUT') then
            begin
              iQuoteFollowUpReminder := dtmdlWorktops.GetQuoteFollowUpReminder(frmWTMain.Operator);
              if (iQuoteFollowUpReminder = 1) then
                CreateOutlookReminder
              else
              if (iQuoteFollowUpReminder = 2)  and (Quote.Importance <> 'L') then
                CreateOutlookReminder
              else
              if (iQuoteFollowUpReminder = 3)  and (Quote.Importance = 'H') then
                CreateOutlookReminder;
            end;
        end;
    end
  else
  if (Mode = qDelete) then
    begin
      Quote.Inactive := 'Y';
      Quote.DeleteFromDB;
    end;

  ModalResult := mrOK;
  close;
end;

procedure TfrmWTMaintQuote.MoveOriginalQuoteDocuments;
var
  sSource, sDest: string;
  ListItem: TListItem;
  irow: integer;
  icount: Integer;
begin
  sSource := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(self.OriginalQuoteFromReQuote) + '\' ;
  sDest :=  dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbkey) + '\' ;

  try
    for icount := 0 to pred(slvDocuments.Items.Count) do
      begin
      //selected and NOT folder
        if NOT slvDocuments.Folders[icount].IsFolder then
          begin
            try
              filecopy(slvDocuments.Folders[icount].PathName, stringReplace(slvDocuments.Folders[icount].PathName,sSource,sDest,[rfReplaceAll, rfIgnoreCase]));
            except
            end;
          end
        else
          begin
            try
              directorycopy(slvDocuments.Folders[icount].PathName, stringReplace(slvDocuments.Folders[icount].PathName,sSource,sDest,[rfReplaceAll, rfIgnoreCase]));
            except
            end;
          end;
      end;
  finally
  end;

(*  for irow := 0 to pred(lstvwDocuments.items.count) do
    begin
      ListItem := lstvwDocuments.items[irow];
      //copy the file
      try
        filecopy(sSource+ListItem.Caption, sDest+ListItem.Caption);
      except
      end;
    end;
*)
end;

procedure TfrmWTMaintQuote.edtDescriptionChange(Sender: TObject);
begin
  Quote.Description := edtDescription.Text;
  CheckOK(self);
end;

procedure TfrmWTMaintQuote.edtReferenceChange(Sender: TObject);
begin
  Quote.Reference := edtReference.Text;
  CheckOK(self);
end;

procedure TfrmWTMaintQuote.edtInstallPriceChange(Sender: TObject);
begin
  try
    Quote.InstallPrice := strtofloat(edtInstallPrice.text);
  except
    Quote.InstallPrice := 0.00;
  end;
  memFittingSell.Text := formatfloat('#,##0.00', Quote.InstallPrice);
  ShowTotals;
end;

procedure TfrmWTMaintQuote.edtSurveyPriceChange(Sender: TObject);
begin
  try
    Quote.SurveyPrice := strtofloat(edtSurveyPrice.text);
  except
    Quote.SurveyPrice := 0.00;
  end;
  memTemplateSell.Text := formatfloat('#,##0.00', Quote.SurveyPrice);
  ShowTotals;
end;

procedure TfrmWTMaintQuote.edtDeliveryPriceChange(Sender: TObject);
begin
  try
    Quote.DeliveryPrice := strtofloat(edtDeliveryPrice.text);
  except
    Quote.DeliveryPrice := 0.00;
  end;
  memDeliverySell.Text := formatfloat('#,##0.00', Quote.DeliveryPrice);
  ShowTotals;
end;

procedure TfrmWTMaintQuote.btnCustomerSearchClick(Sender: TObject);
var
  bUseCustomerFixRates: boolean;
begin
  if (Mode = qRequote) and (Quote.dbKey <> Quote.OriginalQuote) then
    begin
      if messagedlg('This is a requote, changing the customer could cause incorrect reporting issues. Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;
    end;

  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Quote.Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        Quote.Customer := frmwtSrchCustomer.CodeSelected;
        Quote.CustomerName := frmwtSrchCustomer.NameSelected;

        UseMarkup := false;

        {Over ride the company default trade discount}
        bChangeRate := true;
        if frmWTSrchCustomer.RetailCustomer then
          begin
            if dtmdlWorktops.PricesAreTrade then
              UseMarkup := true;

            if UseMarkup then
              begin
                Quote.DiscountRate := 0;
                Quote.DiscountValue := 0;
                Quote.MarkupRate := frmWTSrchCustomer.DiscountRate;
                edtDiscountRate.text := formatfloat('0.00',Quote.MarkupRate);
              end
            else
              begin
                Quote.MarkupRate := 0;
                Quote.MarkupValue := 0;
                Quote.DiscountRate := frmWTSrchCustomer.DiscountRate;
                edtDiscountRate.text := formatfloat('0.00',Quote.DiscountRate);
              end;
          end
        else
          begin
            Quote.MarkupRate := 0;
            Quote.MarkupValue := 0;
            Quote.DiscountRate := frmWTSrchCustomer.DiscountRate;
            edtDiscountRate.text := formatfloat('0.00',Quote.DiscountRate);
          end;

        bChangeRate := false;
        {Allocate Customer discount section finished}

        if frmwtSrchCustomer.UseCustomerFixRates then
          begin
            edtInstallPrice.text := formatfloat('0.00',frmwtSrchCustomer.InstallationPrice);
            edtDeliveryPrice.text := formatfloat('0.00',frmwtSrchCustomer.DeliveryPrice);
            edtSurveyPrice.text := formatfloat('0.00',frmwtSrchCustomer.SurveyPrice);
          end;

        Quote.DepositTerms := frmWTSrchCustomer.DepositTerms;
        spnDepositTerms.Value := round(Quote.DepositTerms);

        Quote.Vat := frmwtSrchCustomer.Vat;
        Quote.VatRate := Quote.DataModule.GetVatRate(Quote.Vat);
        dblkpVatRate.KeyValue := Quote.Vat;
        edtCustomerName.text := frmwtSrchCustomer.NameSelected;
        RetailCustomer := frmwtSrchCustomer.RetailCustomer;
        Quote.Speculative := frmwtSrchCustomer.Speculative;

        if (not RetailCustomer) AND (not Quote.Speculative) then
          begin
            SetAddressFields(Quote.Customer);
            SetContact(Quote.Customer);
            SetSalesLeadSource;
          end
        else
          begin
            ClearAddressFields;
            pnlAddress.Enabled := true;
            pnlTelephone.Enabled := true;
          end;

        {look for any branches that might exist}
        Quote.DataModule.qryBranch.close;
        Quote.DataModule.qryBranch.parambyname('Customer').asinteger := Quote.Customer;
        Quote.DataModule.qryBranch.open;

//        ShowTotals;
      end
  finally
    frmwtSrchCustomer.free;
  end;
end;

procedure TfrmWTMaintQuote.SetContact(tempCode: integer);
begin
  with Quote.DataModule.qryGetContacts do
    begin
      close;
      parambyname('Customer').asinteger := tempCode;
      open;

      if recordcount = 1 then
        begin
          Quote.ContactName := fieldbyname('Contact_Name').asstring;
          edtContact.text := Quote.ContactName;
        end;
    end;
end;

procedure TfrmWTMaintQuote.SetAddressFields(tempCode: integer);
begin
  ClearAddressFields;
  if (not Retailcustomer) AND (not Quote.Speculative) then
    begin
      edtStreet.text := Quote.dataModule.GetCustomerStreet(Quote.Customer);
      edtLocale.text := Quote.dataModule.GetCustomerLocale(Quote.Customer);
      edtTown.text := Quote.dataModule.GetCustomerTown(Quote.Customer);
      edtPostcode.text := Quote.dataModule.GetCustomerPostcode(Quote.Customer);
      edtCounty.text := Quote.dataModule.GetCustomerCounty(Quote.Customer);
      edtTelephone.text := Quote.dataModule.GetCustomerTelephone(Quote.Customer);
      edtEmail.text := Quote.dataModule.GetCustomerEmail(Quote.Customer);

      pnlAddress.Enabled := false;
      pnlTelephone.Enabled := false;
    end
  else
    begin
      edtCustomerName.text := Quote.dataModule.GetAddressName(Quote.Address);
      edtStreet.text := Quote.dataModule.GetAddressStreet(Quote.Address);
      edtLocale.text := Quote.dataModule.GetAddressLocale(Quote.Address);
      edtTown.text := Quote.dataModule.GetAddressTown(Quote.Address);
      edtPostcode.text := Quote.dataModule.GetAddressPostcode(Quote.Address);
      edtCounty.text := Quote.dataModule.GetAddressCounty(Quote.Address);
      edtTelephone.text := Quote.dataModule.GetAddressTelephone(Quote.Address);
      edtEmail.text := Quote.dataModule.GetAddressEmail(Quote.Address);

      chkbxOnMailingList.Checked := Quote.dataModule.GetAddressOnMailingList(Quote.Address);
      chkbxOnMailingList.enabled := false;

      pnlAddress.Enabled := true;
      pnlTelephone.Enabled := true;
    end;

end;

procedure TfrmWTMaintQuote.SetSalesLeadSource;
begin
  dblkpLeadSource.keyvalue := dtmdlWorktops.GetCustomerSalesLeadSource;
end;

procedure TfrmWTMaintQuote.ClearAddressFields;
begin
  edtStreet.Clear;
  edtLocale.Clear;
  edtTown.Clear;
  edtPostcode.Clear;
  edtCounty.Clear;
  edtTelephone.Clear;
  edtEmail.Clear;
end;


procedure TfrmWTMaintQuote.SetRetailCustomer(const Value: bytebool);
begin
  FRetailCustomer := Value;
end;

procedure TfrmWTMaintQuote.dblkpMaterialClick(Sender: TObject);
begin
  Quote.Material := dblkpMaterial.KeyValue;
  EnableAddButtons;
end;

procedure TfrmWTMaintQuote.EnableAddButtons;
begin
  btnAddElts.Enabled := (Quote.Material <> 0);
  btnAddUpstds.Enabled := (Quote.Material <> 0);
  btnAddCutOuts.Enabled := (Quote.Material <> 0);
  btnAddEdges.Enabled := (Quote.Material <> 0);
  btnAddExtras.Enabled := (Quote.Material <> 0);
  btnAddSlabs.Enabled := (Quote.Material <> 0);
end;

procedure TfrmWTMaintQuote.btnAddEltsClick(Sender: TObject);
begin
  CallMaintElement(qelAdd);
end;

procedure TfrmWTMaintQuote.CallMaintElement(aMode : TqelMode);
var
  inx : integer;
  QElement : TQElement;
  frm: TfrmWTMaintQElement;
begin
//  inx := sgElements.row;
  try
    inx := strtoint(sgElements.cells[0,sgElements.row]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintQElement.Create(Self);
    try
      if aMode = qelAdd then
        QElement := TQElement.create(Quote)
      else
      begin
        inx := Quote.Elements.IndexOf(inx);
        QElement := Quote.Elements[inx];
      end;
      Frm.QElement := QElement;
      Frm.Mode := aMode;
      Frm.Material := dblkpMaterial.keyvalue;
      Frm.MaterialType := dblkpMaterial.Text;
      if (aMode = qelAdd) and (Quote.Elements.Count > 0) then
        begin
          Frm.Worktop := Quote.Elements[Quote.Elements.Count - 1].worktop;
          Frm.WorktopGroup := Quote.Elements[Quote.Elements.Count - 1].worktopgroup;
          frm.Thickness := Quote.Elements[Quote.Elements.Count - 1].thickness;
          frm.Material := Quote.Elements[Quote.Elements.Count - 1].Material;
          frm.QElement.UnitPrice := Quote.Elements[Quote.Elements.Count - 1].UnitPrice;
          frm.QElement.PriceUnit := Quote.Elements[Quote.Elements.Count - 1].PriceUnit;
          frm.QElement.OriginalUnitPrice := Quote.Elements[Quote.Elements.Count - 1].OriginalUnitPrice;
        end;
      Frm.ShowModal;
      if (aMode = qelAdd) and (Frm.ModalResult <> mrOK) then
        QElement.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowElements;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = qelAdd then
      begin
        inx := pred(Quote.Elements.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = qelDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgElements.row := inx+1;
  end;
end;

procedure TfrmWTMaintQuote.CallMaintUpstand(aMode : TqelMode);
var
  inx : integer;
  QUpstand : TQUpstand;
  frm: TfrmWTMaintQUpstand;
begin
//  inx := sgUpstands.row+1000;
  try
    inx := strtoint(sgUpstands.cells[0,sgUpstands.row])+1000;
  except
    inx := 1000;
  end;

  try
    frm := TfrmWTMaintQUpstand.Create(Self);
    try
      if aMode = qelAdd then
        QUpstand := TQUpstand.create(Quote)
      else
      begin
        inx := Quote.Upstands.IndexOf(inx);
        QUpstand := Quote.Upstands[inx];
      end;
      Frm.QUpstand := QUpstand;
      Frm.Mode := aMode;
      Frm.Material := dblkpMaterial.keyvalue;
      Frm.MaterialType := dblkpMaterial.Text;
      if (aMode = qelAdd) and (Quote.Upstands.Count = 0) and (Quote.Elements.count > 0) then
        begin
          Frm.Worktop := Quote.Elements[0].worktop;
          frm.Thickness := dtmdlWorktops.qryCompany.fieldbyname('Underslip_thickness').asinteger;
          frm.PolishPrice := dtmdlWorktops.qryCompany.fieldbyname('Upstand_Polish_Price').asfloat;
          frm.PolishCost := dtmdlWorktops.qryCompany.fieldbyname('Upstand_Polish_Cost').asfloat;
//          frm.QUpstand.PriceUnit := Quote.Elements[0].PriceUnit;
//          frm.QUpstand.UnitPrice := Quote.Elements[0].UnitPrice;
        end
      else
      if (aMode = qelAdd) and (Quote.Upstands.Count = 0) then
        begin
          frm.Thickness := dtmdlWorktops.qryCompany.fieldbyname('Underslip_thickness').asinteger;
          frm.PolishPrice := dtmdlWorktops.qryCompany.fieldbyname('Upstand_Polish_Price').asfloat;
          frm.PolishCost := dtmdlWorktops.qryCompany.fieldbyname('Upstand_Polish_Cost').asfloat;
        end
      else
      if (aMode = qelAdd) and (Quote.Upstands.Count > 0) then
        begin
          Frm.Material := Quote.Upstands[Quote.Upstands.Count - 1].Material;
          Frm.Worktop := Quote.Upstands[Quote.Upstands.Count - 1].worktop;
          frm.Thickness := Quote.Upstands[Quote.Upstands.Count - 1].thickness;
          frm.PolishCost := Quote.Upstands[Quote.Upstands.Count - 1].PolishCost;
          frm.PolishPrice := Quote.Upstands[Quote.Upstands.Count - 1].PolishPrice;
          Frm.MaterialUse := Quote.Upstands[Quote.Upstands.Count - 1].MaterialUse;
          Frm.Depth := Quote.Upstands[Quote.Upstands.Count - 1].Depth;
          frm.QUpstand.UnitPrice := Quote.Upstands[Quote.Upstands.Count - 1].UnitPrice;
          frm.QUpstand.PriceUnit := Quote.Upstands[Quote.Upstands.Count - 1].PriceUnit;
          frm.QUpstand.OriginalUnitPrice := Quote.Upstands[Quote.Upstands.Count - 1].OriginalUnitPrice;
        end;
      Frm.ShowModal;
      if (aMode = qelAdd) and (Frm.ModalResult <> mrOK) then
        QUpstand.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowUpstands;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = qelAdd then
      begin
        inx := pred(Quote.Upstands.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = qelDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgUpstands.row := inx+1;
  end;
end;

procedure TfrmWTMaintQuote.CallMaintSlab(aMode : TqslMode);
var
  inx : integer;
  QSlab : TQSlab;
  frm: TfrmWTMaintQSlab;
begin
  try
    inx := strtoint(sgSlabs.cells[0,sgSlabs.row]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintQSlab.Create(Self);
    try
      if aMode = qslAdd then
        QSlab := TQSlab.create(Quote)
      else
      begin
        inx := Quote.Slabs.IndexOf(inx);
        QSlab := Quote.Slabs[inx];
      end;
      Frm.QSlab := QSlab;
      Frm.Mode := aMode;
      Frm.Material := dblkpMaterial.keyvalue;
      Frm.MaterialType := dblkpMaterial.Text;

      try
        frm.Worktop := Quote.Elements[0].worktop
      except
        frm.Worktop := 0;
      end;

      try
        frm.Thickness := Quote.Elements[0].thickness
      except
        frm.thickness := 0;
      end;

      if (aMode = qslAdd) and (Quote.Slabs.Count > 0) then
        begin
          Frm.Supplier := Quote.Slabs[Quote.Slabs.Count - 1].Supplier;
          Frm.Worktop := Quote.Slabs[Quote.Slabs.Count - 1].worktop;
          frm.Thickness := Quote.Slabs[Quote.Slabs.Count - 1].thickness;
          frm.Material := Quote.Slabs[Quote.Slabs.Count - 1].Material;
          QSlab.UnitCost := Quote.Slabs[Quote.Slabs.Count - 1].UnitCost;
        end;

      Frm.ShowModal;
      if (aMode = qslAdd) and (Frm.ModalResult <> mrOK) then
        QSlab.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowSlabs;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = qslAdd then
      begin
        inx := pred(Quote.Slabs.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = qslDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgSlabs.row := inx+1;
  end;
end;

procedure TfrmWTMaintQuote.btnChangeEltsClick(Sender: TObject);
begin
  CallMaintElement(qelChange);
end;

procedure TfrmWTMaintQuote.btnAddCutOutsClick(Sender: TObject);
begin
  CallMaintCutOut(qcoAdd);
end;

procedure TfrmWTMaintQuote.CallMaintCutOut(aMode : TqcoMode);
var
  inx : integer;
  QCutOut : TQCutOut;
  frm: TfrmWTMaintQCutOut;
begin
//  inx := sgCutOuts.row;

  try
    inx := strtoint(sgCutOuts.cells[0,sgCutOuts.row]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintQCutOut.Create(Self);
    try
      if aMode = qcoAdd then
        QCutOut := TQCutOut.create(Quote)
      else
      begin
        inx := Quote.CutOuts.IndexOf(inx);
        QCutOut := Quote.CutOuts[inx];
      end;
      Frm.QCutOut := QCutOut;
      Frm.Mode := aMode;
      Frm.Material := dblkpMaterial.KeyValue;
      Frm.MaterialType := dblkpMaterial.Text;
      if (aMode = qcoAdd) and (Quote.CutOuts.Count > 0) then
        begin
          frm.EdgeType := Quote.CutOuts[Quote.CutOuts.Count - 1].EdgeType;
        end;
      Frm.ShowModal;
      if (aMode = qcoAdd) and (Frm.ModalResult <> mrOK) then
        QCutOut.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowCutOuts;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = qcoAdd then
      begin
        inx := pred(Quote.CutOuts.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = qcoDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgCutOuts.row := inx+1;
  end;
end;

procedure TfrmWTMaintQuote.CallMaintEdge(aMode : TqedgMode);
var
  inx : integer;
  QEdge : TQEdge;
  frm: TfrmWTMaintQEdge;
begin
//  inx := sgEdges.row;

  try
    inx := strtoint(sgEdges.cells[0,sgEdges.row]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintQEdge.Create(Self);
    try
      if aMode = qedgAdd then
        QEdge := TQEdge.create(Quote)
      else
      begin
        inx := Quote.Edges.IndexOf(inx);
        QEdge := Quote.Edges[inx];
      end;
      Frm.QEdge := QEdge;
      Frm.Mode := aMode;
      Frm.Material := dblkpMaterial.KeyValue;
      Frm.MaterialType := dblkpMaterial.Text;
      if (aMode = qedgAdd) and (Quote.Edges.Count > 0) then
        begin
          frm.EdgeType := Quote.Edges[Quote.Edges.Count - 1].EdgeType;
        end;
      Frm.ShowModal;
      if (aMode = qedgAdd) and (Frm.ModalResult <> mrOK) then
        QEdge.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowEdges;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = qedgAdd then
      begin
        inx := pred(Quote.Edges.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = qedgDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgEdges.row := inx+1;
  end;
end;

procedure TfrmWTMaintQuote.CallMaintEvent(aMode : TqevMode);
var
  inx : integer;
  QEvent : TQEvent;
  frm: TfrmWTMaintQEvents;
begin
//  inx := sgEvents.row;

  try
    inx := strtoint(sgEvents.cells[0,sgEvents.row]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintQEvents.Create(Self);
    try
      if aMode = qevAdd then
        QEvent := TQEvent.create(Quote)
      else
      begin
        inx := Quote.Events.IndexOf(inx);
        QEvent := Quote.Events[inx];
      end;
      Frm.QEvent := QEvent;
      Frm.Mode := aMode;
//      Frm.OperatorName := dblkpOperator.Text;
//      Frm.Operator := dblkpOperator.keyvalue;
      Frm.OperatorName := frmWTMain.OperatorName;
      Frm.Operator := frmWTMain.Operator;
      Frm.ShowModal;
      if (aMode = qevAdd) and (Frm.ModalResult <> mrOK) then
        QEvent.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowEvents;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = qevAdd then
      begin
        inx := pred(Quote.Events.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = qevDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgEvents.row := inx+1;
  end;
end;

procedure TfrmWTMaintQuote.CallMaintExtra(aMode : TqexMode);
var
  inx : integer;
  QExtra : TQExtra;
  frm: TfrmWTMaintQExtra;
begin
//  inx := sgExtras.row;

  try
    inx := strtoint(sgExtras.cells[0,sgExtras.row]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintQExtra.Create(Self);
    try
      if aMode = qexAdd then
        QExtra := TQExtra.create(Quote)
      else
      begin
        inx := Quote.Extras.IndexOf(inx);
        QExtra := Quote.Extras[inx];
      end;
      Frm.QExtra := QExtra;
      Frm.Mode := aMode;
      Frm.ShowModal;
      if (aMode = qexAdd) and (Frm.ModalResult <> mrOK) then
        QExtra.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowExtras;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = qexAdd then
      begin
        inx := pred(Quote.Extras.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = qexDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgExtras.row := inx+1;
  end;
end;

procedure TfrmWTMaintQuote.btnChangeCutOutsClick(Sender: TObject);
begin
  CallMaintCutOut(qcoChange);
end;

procedure TfrmWTMaintQuote.btnAddEdgesClick(Sender: TObject);
begin
  CallMaintEdge(qedgAdd);
end;

procedure TfrmWTMaintQuote.btnChangeEdgesClick(Sender: TObject);
begin
  CallMaintEdge(qedgChange);
end;

procedure TfrmWTMaintQuote.btnAddExtrasClick(Sender: TObject);
begin
  CallMaintExtra(qexAdd);
end;

procedure TfrmWTMaintQuote.btnChangeExtrasClick(Sender: TObject);
begin
  CallMaintExtra(qexChange);
end;

procedure TfrmWTMaintQuote.FormDestroy(Sender: TObject);
begin
  dtmdlNotes.free;
  AllCommon.SaveFormLayout('myWorktops.ini', self);
end;

procedure TfrmWTMaintQuote.edtContactChange(Sender: TObject);
begin
  Quote.ContactName := edtContact.text;
end;

procedure TfrmWTMaintQuote.btnAddUpstdsClick(Sender: TObject);
begin
  CallMaintUpstand(qelAdd);

end;

procedure TfrmWTMaintQuote.btnChangeUpstdsClick(Sender: TObject);
begin
  CallMaintUpstand(qelChange);

end;

procedure TfrmWTMaintQuote.btnContactSearchClick(Sender: TObject);
begin
  frmwtSrchCustContacts := TfrmwtSrchCustContacts.create(self);
  try
    frmwtSrchCustContacts.Customer := Quote.Customer;
    frmwtSrchCustContacts.isLookup := true;
    frmwtSrchCustContacts.showmodal;
    if frmwtSrchCustContacts.modalresult = idOK then
      begin
        Quote.ContactName := frmwtSrchCustContacts.ContactName;
        edtContact.Text := Quote.ContactName;
      end
  finally
    frmwtSrchCustContacts.free;
  end;

end;

procedure TfrmWTMaintQuote.edtDiscountRateChange(Sender: TObject);
var
  rDiscount: real;
begin
  if (Sender as TEdit).Text = '' then
    (Sender as TEdit).Text := '0.00';
  if bChangeRate then
    begin
      if self.UseMarkup then
        begin
          Quote.MarkupRate := strtofloat(edtDiscountRate.text);
          rDiscount := Quote.TotalPrice * (Quote.MarkupRate/100);
          Quote.MarkupValue := rDiscount;
        end
      else
        begin
          Quote.DiscountRate := strtofloat(edtDiscountRate.text);
          rDiscount := Quote.TotalPrice * (Quote.DiscountRate/100);
          rDiscount := Quote.TotalDiscountablePrice * (Quote.DiscountRate/100);
          edtDiscountValue.text := formatfloat('0.00',rDiscount);
          memDiscountValueAnalysis.text := edtDiscountValue.text;
          Quote.DiscountValue := rDiscount;
        end;
      edtDiscountValue.text := formatfloat('0.00',rDiscount);
      memDiscountValueAnalysis.text := edtDiscountValue.text;
      ShowTotals;
    end;
end;

procedure TfrmWTMaintQuote.edtDiscountValueChange(Sender: TObject);
var
  rDiscount: real;
begin
  if (Sender as TEdit).Text = '' then
    (Sender as TEdit).Text := '0.00';
  if bChangeValue then
    begin
      if self.UseMarkup then
        begin
          Quote.MarkupValue := strtofloat(edtDiscountValue.text);
          rDiscount := ((Quote.MarkupValue / Quote.TotalPrice)*100);
          Quote.MarkupRate := rDiscount;
          ShowTotals;
        end
      else
        begin
          Quote.DiscountValue := strtofloat(edtDiscountValue.text);
//          rDiscount := ((Quote.DiscountValue / Quote.TotalPrice)*100);
          rDiscount := ((Quote.DiscountValue / Quote.TotalDiscountablePrice)*100);
          Quote.DiscountRate := rDiscount;
        end;
      memDiscountValueAnalysis.Text := formatfloat('0.00',Quote.MarkupValue);
      edtDiscountRate.text := formatfloat('0.00',rDiscount);
      ShowTotals;
    end;
end;

procedure TfrmWTMaintQuote.edtDiscountRateEnter(Sender: TObject);
begin
  bChangeRate := true;
end;

procedure TfrmWTMaintQuote.edtDiscountRateExit(Sender: TObject);
begin
  bChangeRate := false;
end;

procedure TfrmWTMaintQuote.edtDiscountValueEnter(Sender: TObject);
begin
  bChangeValue := true;
end;

procedure TfrmWTMaintQuote.edtDiscountValueExit(Sender: TObject);
begin
  bChangeValue := false;
end;

procedure TfrmWTMaintQuote.btnDeleteEltsClick(Sender: TObject);
begin
  CallMaintElement(qelDelete);
end;

procedure TfrmWTMaintQuote.btnDeleteCutOutsClick(Sender: TObject);
begin
  CallMaintCutOut(qcoDelete);
end;

procedure TfrmWTMaintQuote.btnDeleteEdgesClick(Sender: TObject);
begin
  CallMaintEdge(qedgDelete);
end;

procedure TfrmWTMaintQuote.btnDeleteUpstdsClick(Sender: TObject);
begin
  CallMaintUpstand(qelDelete);
end;

procedure TfrmWTMaintQuote.btnDeleteExtrasClick(Sender: TObject);
begin
  CallMaintExtra(qexDelete);
end;

procedure TfrmWTMaintQuote.sgElementsDblClick(Sender: TObject);
begin
  btnChangeEltsClick(self);
end;

procedure TfrmWTMaintQuote.sgCutOutsDblClick(Sender: TObject);
begin
  btnChangeCutOutsClick(self);
end;

procedure TfrmWTMaintQuote.sgEdgesDblClick(Sender: TObject);
begin
  btnChangeEdgesClick(self);
end;

procedure TfrmWTMaintQuote.sgUpstandsDblClick(Sender: TObject);
begin
  btnChangeUpstdsClick(self);
end;

procedure TfrmWTMaintQuote.sgExtrasDblClick(Sender: TObject);
begin
  btnChangeExtrasClick(self);
end;

procedure TfrmWTMaintQuote.ShowEvents;
begin
  ClearGrid(sgEvents);  {Clear contents of Line grid}
  BuildEventGrid;
  sgEventsClick(self);
end;

procedure TfrmWTMaintQuote.BuildEventGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgEvents, Quote.datamodule do
    begin
      for i := 0 to pred(Quote.Events.count) do
        begin
        cells[0,i+1] := inttostr(Quote.Events[i].EventNumber);
        cells[1,i+1] := paDateStr(Quote.Events[i].DateEntered);
        cells[2,i+1] := Quote.Events[i].OperatorName;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeEvents.enabled := not (Quote.Events.count = 0);
  btnDeleteEvents.enabled := not (Quote.Events.count = 0);
end;

procedure TfrmWTMaintQuote.btnAddEventsClick(Sender: TObject);
begin
  CallMaintEvent(qevAdd);
end;

procedure TfrmWTMaintQuote.btnChangeEventsClick(Sender: TObject);
begin
  CallMaintEvent(qevChange);
end;

procedure TfrmWTMaintQuote.btnDeleteEventsClick(Sender: TObject);
begin
  CallMaintEvent(qevDelete);
end;

procedure TfrmWTMaintQuote.sgEventsClick(Sender: TObject);
var
  QEvent: TQEvent;
  inx: integer;
begin
  inx := sgEvents.row;
  try
    inx := Quote.Events.IndexOf(inx);
    QEvent := Quote.Events[inx];
    memEventNotes.Text := QEvent.Narrative.Data;
  except
    memEventNotes.Lines.Clear;
  end;
end;

procedure TfrmWTMaintQuote.sgEventsDblClick(Sender: TObject);
begin
  btnChangeEventsClick(self);
end;

procedure TfrmWTMaintQuote.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  if Mode = qView then exit;

  TempWord := MessageDlg('Do you want to save these quote details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    btnOKClick(self);
end;

procedure TfrmWTMaintQuote.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTMaintQuote.edtInstallPriceExit(Sender: TObject);
begin
  if (Sender as TCREditMoney).text = '' then
    (Sender as TCREditMoney).text := '0.00';
end;

procedure TfrmWTMaintQuote.edtCustomerNameChange(Sender: TObject);
begin
  Quote.CustomerName := edtCustomerName.text;
  CheckOK(self);
end;

procedure TfrmWTMaintQuote.btnLUMatTypeClick(Sender: TObject);
begin
  frmWTLUMatType := TfrmWTLUMatType.create(self);
  try
    frmWTLUMatType.showmodal;
  finally
    frmWTLUMatType.free;
  end;

  Quote.DataModule.dtsMaterial.DataSet.close;
  Quote.DataModule.dtsMaterial.DataSet.open;
end;

procedure TfrmWTMaintQuote.edtDepositPaidChange(Sender: TObject);
begin
  try
    Quote.DepositAmount := strtofloat(edtDepositPaid.text);
  except
    Quote.DepositAmount := 0.00;
  end;
end;

procedure TfrmWTMaintQuote.spnDepositTermsChange(Sender: TObject);
begin
  Quote.DepositTerms := (Sender as TSpinEdit).Value;
end;

procedure TfrmWTMaintQuote.edtTemplateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
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

  (Sender as TEdit).Text := paDatestr(NewDate);
end;

procedure TfrmWTMaintQuote.btntemplateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtTemplate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtTemplate.text;

  edtTemplate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTMaintQuote.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTMaintQuote.btnAcceptedClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtAccepted.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtAccepted.text;

  edtAccepted.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintQuote.btnGlobalEltsClick(Sender: TObject);
var
  icount, inx : integer;
  QElement : TQElement;
  QUpstand : TQUpstand;
  frm: TfrmWTMaintQElementM;
begin
  inx := sgElements.row;
  try
    frm := TfrmWTMaintQElementM.Create(Self);
    try
      inx := Quote.Elements.IndexOf(inx);
      QElement := Quote.Elements[inx];

      Frm.QElement := QElement;
      Frm.Material := dblkpMaterial.keyvalue;
      Frm.MaterialType := dblkpMaterial.Text;

      Frm.ShowModal;
      if Frm.ModalResult = mrOK then
        begin
          {Change all the worktops elements}
          for icount := 0 to pred(Quote.Elements.count) do
            begin
              QElement := Quote.Elements[icount];
              QElement.Worktop := Quote.Elements[inx].worktop;
              QElement.WorktopGroup := Quote.Elements[inx].worktopGroup;
              QElement.worktopDesc := Quote.Elements[inx].worktopDesc;
              QElement.thickness := Quote.Elements[inx].thickness;
              QElement.thicknessDesc := Quote.Elements[inx].thicknessDesc;
              QElement.UnitPrice := Quote.Elements[inx].UnitPrice;
            end;
         {Change all the upstand elements}
          for icount := 0 to pred(Quote.Upstands.count) do
            begin
              QUpstand := Quote.Upstands[icount];
              QUpstand.Worktop := Quote.Elements[inx].worktop;
              QUpstand.worktopDesc := Quote.Elements[inx].worktopDesc;
//              QUpstand.WorktopGroup := Quote.Elements[inx].worktopGroup;
              QUpstand.thickness := frm.UpThickness;
              QUpstand.thicknessDesc := frm.UpthicknessDesc;
              QUpstand.UnitPrice := frm.UpUnitPrice;
            end;

          ShowElements;
          ShowUpstands;
          ShowDiscount;
          ShowTotals;

//          messagedlg('This global change has not altered any upstands, splashbacks etc, please make any necessary amendments on the Upstand/Splashback page.', mtInformation,
//              [mbOk], 0);
        end;
    finally
      Frm.Free;
    end;
  finally
    sgElements.row := inx+1;
  end;
end;

procedure TfrmWTMaintQuote.btnSalesLeadClick(Sender: TObject);
begin
  frmWTLUSalesLead := TfrmWTLUSalesLead.create(self);
  try
    frmWTLUSalesLead.showmodal;
  finally
    frmWTLUSalesLead.free;
  end;

  Quote.DataModule.dtsLeadSource.DataSet.close;
  Quote.DataModule.dtsLeadSource.DataSet.open;
  CheckOK(self);
end;

procedure TfrmWTMaintQuote.btnDesignerClick(Sender: TObject);
begin
  frmWTLUDesigner := TfrmWTLUDesigner.create(self);
  try
    frmWTLUDesigner.showmodal;
  finally
    frmWTLUDesigner.free;
  end;

  Quote.DataModule.dtsDesigner.DataSet.close;
  Quote.DataModule.dtsDesigner.DataSet.open;

end;

procedure TfrmWTMaintQuote.btnContactClearClick(Sender: TObject);
begin
  edtContact.clear;
  Quote.ContactName := edtContact.text;
end;

procedure TfrmWTMaintQuote.btnFollowUpDateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtFollowUpDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtFollowUpDate.text;

  edtFollowUpDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintQuote.edtFollowUpDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
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
  (Sender as TEdit).Text := paDatestr(NewDate);
end;

procedure TfrmWTMaintQuote.tbAnalysisShow(Sender: TObject);
var
  rTotalCost, rTotalSell, rTotalSupplyCost, rTotalSupplySell: real;
begin
  memSlabArea.Text := formatfloat('0.00',Quote.Slabs.TotalArea);
  memSlabCost.Text := formatfloat('#,##0.00',Quote.Slabs.TotalCosts);

  memWorktopArea.Text := formatfloat('0.00',Quote.Elements.TotalArea + Quote.Upstands.TotalArea);
  memHandlingArea.Text := formatfloat('0.00',Quote.Elements.TotalArea + Quote.Upstands.TotalArea);
  memHandlingRate.Text := formatfloat('0.00',Quote.HandlingRate);
  memHandlingCost.Text := formatfloat('#,##0.00',ShowHandlingCost);

  memWorktopSell.Text := formatfloat('#,##0.00',Quote.Elements.TotalSales + Quote.Upstands.TotalSales);
  memCutOutCost.Text := formatfloat('#,##0.00',Quote.CutOuts.TotalCosts);
  memCutOutSell.Text := formatfloat('#,##0.00',Quote.CutOuts.TotalSales);
  memEdgeCost.Text := formatfloat('#,##0.00',(Quote.Edges.TotalCosts + Quote.Upstands.TotalCosts));
  memEdgeSell.Text := formatfloat('#,##0.00',Quote.Edges.TotalSales);
  memExtrasCost.Text := formatfloat('#,##0.00',Quote.Extras.TotalCosts);
  memExtrasSell.Text := formatfloat('#,##0.00',Quote.Extras.TotalSales);

  memDiscountValueAnalysis.Text := formatfloat('0.00',Quote.DiscountValue);

  memTemplateSell.Text := formatfloat('0.00',Quote.SurveyPrice);
  memFittingSell.Text := formatfloat('0.00',Quote.InstallPrice);

  memMileage.Text := formatfloat('0',Quote.Mileage);
  memMileageRate.Text := formatfloat('0',Quote.MileageRate);

  chkbxTempMileage.checked := (Quote.TemplateMileage <> 0) or (Quote.TemplateMileageRate <> 0);
  chkbxFitMileage.checked := (Quote.FittingMileage <> 0) or (Quote.FittingMileageRate <> 0);
  chkbxDelMileage.checked := (Quote.DeliveryMileage <> 0) or (Quote.DeliveryMileageRate <> 0);

  memTempLabour.Text := formatfloat('0.00',Quote.TemplateLabourHours);
  memTempLabourRate.Text := formatfloat('0.00',Quote.TemplateLabourRate);

  memFitLabour.Text := formatfloat('#,##0.00',Quote.FittingLabourHours);
  memFitLabourRate.Text := formatfloat('#,##0.00',Quote.FittingLabourRate);
  memFitLabourMen.Text := inttostr(Quote.FittingLabourMen);

  memDelLabour.Text := formatfloat('#,##0.00',Quote.DeliveryLabourHours);
  memDelLabourRate.Text := formatfloat('#,##0.00',Quote.DeliveryLabourRate);
  memDelLabourMen.Text := inttostr(Quote.DeliveryLabourMen);

  memTempMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('T'));
  memTempLabourCost.text := formatfloat('#,##0.00', ShowLabourCost('T'));
  memFitMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('F'));
  memFitLabourCost.text := formatfloat('#,##0.00', ShowLabourCost('F'));
  memDelMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('D'));
  memDelLabourCost.text := formatfloat('#,##0.00', ShowLabourCost('D'));

  ShowTemplateTotals;
  ShowFittingTotals;
  ShowDeliveryTotals;
  ShowAnalysisTotals;
  ShowAnalysisGrandTotals;
end;

procedure TfrmWTMaintQuote.memDiscountValueAnalysisChange(Sender: TObject);
begin
  ShowAnalysisTotals;
  ShowAnalysisGrandTotals;
end;

procedure TfrmWTMaintQuote.ShowAnalysisGrandTotals;
var
  rSell, rCost, rMargin, rMarginPerc: real;
begin
  {Show Grand Totals}


  rCost := (Quote.TotalSupplyCost + Quote.TotalTemplateCost + Quote.TotalFittingCost + Quote.TotalDeliveryCost);
  rSell := (Quote.TotalPrice-Quote.DiscountValue+Quote.MarkupValue) + Quote.InstallPrice + Quote.SurveyPrice + Quote.DeliveryPrice + Quote.TotalWasteCost;

  rMargin := rSell - rCost;
  try
    rMarginPerc := (rMargin / rSell) * 100;
  except
    rMarginPerc := 0;
  end;

  memTotalCost.Text := formatfloat('#,##0.00',rCost);
  memTotalSell.Text := formatfloat('#,##0.00',rSell);
  memTotalMargin.Text := formatfloat('#,##0.00', rMargin);
  memTotalMarginPerc.Text := formatfloat('#,##0.00', rMarginPerc);
end;

procedure TfrmWTMaintQuote.ShowAnalysisTotals;
var
  rSell, rCost, rMargin, rMarginPerc: real;
begin
  {Show Supply Totals}
  rCost := (Quote.TotalSupplyCost);
  rSell := (Quote.TotalPrice-Quote.DiscountValue+Quote.MarkupValue);

  rMargin := rSell - rCost;
  try
    rMarginPerc := (rMargin / rSell) * 100;
  except
    rMarginPerc := 0;
  end;

  memSupplyCost.Text := formatfloat('#,##0.00', rCost);
  memSupplyPrice.Text := formatfloat('#,##0.00', rSell);
  memSupplyMargin.Text := formatfloat('#,##0.00', rMargin);
  memSupplyMarginPerc.Text := formatfloat('#,##0.00', rMarginPerc);
end;

procedure TfrmWTMaintQuote.memTemplateSellChange(Sender: TObject);
begin
  ShowTemplateTotals;
  ShowAnalysisGrandTotals;
end;

function TfrmWTMaintQuote.ShowMileageCost(sType: string): double;
var
  rMileageCost: real;
begin
  if sType = 'F' then
    begin
      rMileageCost := Quote.FittingMileageRate * (Quote.FittingMileage/100);
      result := rMileageCost;
    end
  else
  if sType = 'D' then
    begin
      rMileageCost := Quote.DeliveryMileageRate * (Quote.DeliveryMileage/100);
      result := rMileageCost;
    end
  else
    begin
      rMileageCost := Quote.TemplateMileageRate * (Quote.TemplateMileage/100);
      result := rMileageCost;
    end;
end;

function TfrmWTMaintQuote.ShowHandlingCost: double;
begin
  result := Quote.HandlingRate * (Quote.Elements.TotalArea + Quote.Upstands.TotalArea);
end;

function TfrmWTMaintQuote.ShowLabourCost(sType: string): double;
var
  rLabourCost: real;
begin
  if sType = 'F' then
    begin
      rLabourCost := Quote.FittingLabourRate * Quote.FittingLabourHours * Quote.FittingLabourMen;
      result := rLabourCost;
    end
  else
  if sType = 'D' then
    begin
      rLabourCost := Quote.DeliveryLabourRate * (Quote.DeliveryLabourHours) * Quote.DeliveryLabourMen;
      result := rLabourCost;
    end
  else
    begin
      rLabourCost := Quote.TemplateLabourRate * (Quote.TemplateLabourHours);
      result := rLabourCost;
    end;
end;

procedure TfrmWTMaintQuote.memTempMilesEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
  bChangeRate := true;
end;

procedure TfrmWTMaintQuote.memTempMilesChange(Sender: TObject);
var
  rMileageCost: real;
begin
(*  if bChangeRate then
    begin
      try
        Quote.TemplateMileage := strtoint(memTempMiles.text);
      except
        Quote.TemplateMileage := 0;
      end;
      Quote.FittingMileage := Quote.TemplateMileage;

      try
        Quote.TemplateMileageRate := strtoint(memTempMileRate.text);
      except
        Quote.TemplateMileageRate := 0;
      end;
      Quote.FittingMileageRate := Quote.TemplateMileageRate;

      memTempMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('T'));
      memFitMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('F'));

      ShowTemplateTotals;
      ShowFittingTotals;
      ShowDeliveryTotals;
      ShowAnalysisGrandTotals;
    end;
*)
end;

procedure TfrmWTMaintQuote.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
    exit;
  end
  else
    (Sender as TMemo).Text := TempStr;
  bChangeRate := false;
end;

procedure TfrmWTMaintQuote.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  bChangeRate := false;
end;


procedure TfrmWTMaintQuote.memFitLabourChange(Sender: TObject);
var
  rLabourCost: real;
begin
  if bChangeRate then
    begin
      try
        Quote.FittingLabourHours := strtofloat(memFitLabour.text);
      except
        Quote.FittingLabourHours := 0;
      end;

      try
        Quote.FittingLabourRate := strtofloat(memFitLabourRate.text);
      except
        Quote.FittingLabourRate := 0;
      end;

      try
        Quote.FittingLabourMen := strtoint(memFitLabourMen.text);
      except
        Quote.FittingLabourMen := 1;
      end;

      memFitLabourCost.text := formatfloat('#,##0.00', ShowLabourCost('F'));
      ShowFittingTotals;
      ShowAnalysisGrandTotals;
    end;
end;

procedure TfrmWTMaintQuote.memTempLabourChange(Sender: TObject);
var
  rLabourCost: real;
begin
  if bChangeRate then
    begin
      try
        Quote.TemplateLabourHours := strtofloat(memTempLabour.text);
      except
        Quote.TemplateLabourHours := 0;
      end;

      try
        Quote.TemplateLabourRate := strtofloat(memTempLabourRate.text);
      except
        Quote.TemplateLabourRate := 0;
      end;

      memTempLabourCost.text := formatfloat('#,##0.00', ShowLabourCost('T'));
      ShowTemplateTotals;
      ShowAnalysisGrandTotals;
    end;
end;

procedure TfrmWTMaintQuote.ShowDeliveryTotals;
var
  rSell, rCost, rMargin, rMarginPerc: real;
begin
  {Show Supply Totals}
  rCost := (Quote.DeliveryLabourRate * Quote.DeliveryLabourHours * Quote.DeliveryLabourMen) + (Quote.DeliveryMileage * (Quote.DeliveryMileageRate/100));
  rSell := Quote.DeliveryPrice;

  rMargin := rSell - rCost;
  try
    rMarginPerc := (rMargin / rSell) * 100;
  except
    rMarginPerc := 0;
  end;

  memDeliveryMargin.Text := formatfloat('#,##0.00', rMargin);
  memDeliveryMarginPerc.Text := formatfloat('#,##0.00', rMarginPerc);
end;

procedure TfrmWTMaintQuote.ShowFittingTotals;
var
  rSell, rCost, rMargin, rMarginPerc: real;
begin
  {Show Supply Totals}
  rCost := (Quote.FittingLabourRate * Quote.FittingLabourHours * Quote.FittingLabourMen) + (Quote.FittingMileage * (Quote.FittingMileageRate/100));
  rSell := Quote.InstallPrice;

  rMargin := rSell - rCost;
  try
    rMarginPerc := (rMargin / rSell) * 100;
  except
    rMarginPerc := 0;
  end;

  memFittingMargin.Text := formatfloat('#,##0.00', rMargin);
  memFittingMarginPerc.Text := formatfloat('#,##0.00', rMarginPerc);
end;

procedure TfrmWTMaintQuote.ShowTemplateTotals;
var
  rSell, rCost, rMargin, rMarginPerc: real;
begin
  {Show Supply Totals}
  rCost := (Quote.TemplateLabourRate * Quote.TemplateLabourHours) + (Quote.TemplateMileage * (Quote.TemplateMileageRate/100));
  rSell := Quote.SurveyPrice;

  rMargin := rSell - rCost;
  try
    rMarginPerc := (rMargin / rSell) * 100;
  except
    rMarginPerc := 0;
  end;

  memTemplateMargin.Text := formatfloat('#,##0.00', rMargin);
  memTemplateMarginPerc.Text := formatfloat('#,##0.00', rMarginPerc);
end;

procedure TfrmWTMaintQuote.memFittingSellChange(Sender: TObject);
begin
  ShowFittingTotals;
  ShowAnalysisGrandTotals;
end;

procedure TfrmWTMaintQuote.btnAddSlabsClick(Sender: TObject);
begin
  CallMaintSlab(qslAdd);
end;

procedure TfrmWTMaintQuote.btnChangeSlabsClick(Sender: TObject);
begin
  CallMaintSlab(qslChange);
end;

procedure TfrmWTMaintQuote.btnDeleteSlabsClick(Sender: TObject);
begin
  CallMaintSlab(qslDelete);
end;

procedure TfrmWTMaintQuote.sgSlabsDblClick(Sender: TObject);
begin
  btnChangeSlabsClick(self);
end;

procedure TfrmWTMaintQuote.memHandlingRateChange(Sender: TObject);
var
  rHandlingCost: real;
begin
  if bChangeRate then
    begin
      try
        Quote.HandlingRate := strtofloat(memHandlingRate.text);
      except
        Quote.HandlingRate := 0;
      end;

      memHandlingCost.text := formatfloat('#,##0.00', ShowHandlingCost);
      ShowAnalysisTotals;
      ShowAnalysisGrandTotals;
    end;
end;

procedure TfrmWTMaintQuote.memDelLabourChange(Sender: TObject);
var
  rLabourCost: real;
begin
  if bChangeRate then
    begin
      try
        Quote.DeliveryLabourHours := strtofloat(memDelLabour.text);
      except
        Quote.DeliveryLabourHours := 0;
      end;

      try
        Quote.DeliveryLabourRate := strtofloat(memDelLabourRate.text);
      except
        Quote.DeliveryLabourRate := 0;
      end;

      try
        Quote.DeliveryLabourMen := strtoint(memDelLabourMen.text);
      except
        Quote.DeliveryLabourMen := 1;
      end;

      memDelLabourCost.text := formatfloat('#,##0.00', ShowLabourCost('D'));
      ShowDeliveryTotals;
      ShowAnalysisGrandTotals;
    end;
end;

procedure TfrmWTMaintQuote.memDeliverySellChange(Sender: TObject);
begin
  ShowDeliveryTotals;
  ShowAnalysisGrandTotals;
end;

procedure TfrmWTMaintQuote.chkbxTempMileageClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
    begin
      try
        Quote.TemplateMileage := Quote.Mileage;
      except
        Quote.TemplateMileage := 0
      end;

      try
        Quote.TemplateMileageRate := Quote.MileageRate;
      except
        Quote.TemplateMileageRate := 0
      end;
    end
  else
    begin
      Quote.TemplateMileage := 0;
      Quote.TemplateMileageRate := 0;
    end;
  memTempMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('T'));

  ShowTemplateTotals;
  ShowAnalysisGrandTotals;
end;

procedure TfrmWTMaintQuote.chkbxFitMileageClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
    begin
      try
        Quote.FittingMileage := Quote.Mileage;
      except
        Quote.FittingMileage := 0
      end;

      try
        Quote.FittingMileageRate := Quote.MileageRate;
      except
        Quote.FittingMileageRate := 0
      end;
    end
  else
    begin
      Quote.FittingMileage := 0;
      Quote.FittingMileageRate := 0;
    end;
  memFitMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('F'));

  ShowFittingTotals;
  ShowAnalysisGrandTotals;

end;

procedure TfrmWTMaintQuote.chkbxDelMileageClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
    begin
      try
        Quote.DeliveryMileage := Quote.Mileage;
      except
        Quote.DeliveryMileage := 0
      end;

      try
        Quote.DeliveryMileageRate := Quote.MileageRate;
      except
        Quote.DeliveryMileageRate := 0
      end;
    end
  else
    begin
      Quote.DeliveryMileage := 0;
      Quote.DeliveryMileageRate := 0;
    end;

  memDelMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('D'));

  ShowDeliveryTotals;
  ShowAnalysisGrandTotals;
end;

procedure TfrmWTMaintQuote.memMileageChange(Sender: TObject);
begin
  if bChangeRate then
    begin
      try
        Quote.Mileage := strtoint(memMileage.text);
      except
        Quote.Mileage := 0;
      end;

      try
        Quote.MileageRate := strtoint(memMileageRate.text);
      except
        Quote.MileageRate := 0;
      end;

      {Template}
      if chkbxtempMileage.Checked then
        begin
          Quote.TemplateMileage := Quote.Mileage;
          Quote.TemplateMileageRate := Quote.MileageRate;
        end
      else
        begin
          Quote.TemplateMileage := 0;
          Quote.TemplateMileageRate := 0
        end;

      {Fitting}
      if chkbxFitMileage.Checked then
        begin
          Quote.FittingMileage := Quote.Mileage;
          Quote.FittingMileageRate := Quote.MileageRate;
        end
      else
        begin
          Quote.FittingMileage := 0;
          Quote.FittingMileageRate := 0
        end;

      {Fitting}
      if chkbxDelMileage.Checked then
        begin
          Quote.DeliveryMileage := Quote.Mileage;
          Quote.DeliveryMileageRate := Quote.MileageRate;
        end
      else
        begin
          Quote.DeliveryMileage := 0;
          Quote.DeliveryMileageRate := 0
        end;

      memTempMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('T'));
      memFitMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('F'));
      memDelMileageCost.text := formatfloat('#,##0.00', ShowMileageCost('D'));

      ShowTemplateTotals;
      ShowFittingTotals;
      ShowDeliveryTotals;
      ShowAnalysisGrandTotals;
    end;
end;

procedure TfrmWTMaintQuote.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
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

procedure TfrmWTMaintQuote.ShowDocuments(iQuote: integer);
var
  sPath: string;
begin
  if iQuote = 0 then
    begin
      stvDocuments.visible := false;
      slvDocuments.visible := false;
      exit;
    end;

  sPath := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(iQuote) + '\';

  try
    stvDocuments.root := sPath;
    slvDocuments.root := sPath;
  except
    messagedlg('The document location hasn''t been defined for Quotes within Company Preferences. Contact your Firebelly administrator', mtError, [mbAbort], 0);
    stvDocuments.visible := false;
    slvDocuments.visible := false;
  end;

(*  // Assign a Imagelist to the ListView
  lstvwDocuments.Clear;
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
//  lstvwDocuments.ViewStyle := vsIcon;
//  lstvwDocuments.Columns.Add;
//  lstvwDocuments.Columns.Add;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
*)
end;

procedure TfrmWTMaintQuote.lstvwDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
(*  sPath := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey) + '\';
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
*)
end;

procedure TfrmWTMaintQuote.mnuOpenDocumentClick(Sender: TObject);
begin
  lstvwDocumentsDblClick(self);
end;

procedure TfrmWTMaintQuote.mnuDeleteDocumentClick(Sender: TObject);
var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
begin
(*  iRow := lstvwDocuments.ItemIndex;
  if iRow = -1 then exit;
  if messagedlg('Delete the selected document?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ListItem := lstvwDocuments.items[irow];
      sFileName := ListItem.caption;

      lstvwDocuments.Items.Delete(iRow);

      //Delete the actual file only if not Converting or adding as we don't know the directory name
      if (Mode <> qAdd) then
        begin
          sPath :=  dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbkey) + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;
*)
end;

procedure TfrmWTMaintQuote.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docdir, compdir, docExt: string;
begin
  docDir := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey);
  compDir := dtmdlWorktops.GetCompanyQuoteDirectory;

  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  IniFile := TIniFile.Create(frmWTMain.AppIniFile);

  sBody := '';
  sfilePath := docdir;
  okToSave := false;

  EmailAndSaveViaOutlook(sTo, sSubject, sBody, sFilePath, okToSave, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

  if okToSave then
    begin
       ShowDocuments(Quote.dbKey);
    end;
end;

procedure TfrmWTMaintQuote.btnWordClick(Sender: TObject);
var
  compdir, docdir, jobBagDir, docExt, sPAth: string;
  sFullFile, sFileName: string;
  iLength, ipos, i: integer;
  okToSave, userCancelled, docsaved: boolean;
begin
//  docDir := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey);
  compDir := dtmdlWorktops.GetCompanyQuoteDirectory;
  if stvDocuments.TopItem.Text = stvDocuments.Selected.Text then
    docDir := compDir + '\' + inttostr(Quote.dbKey) +'\'
  else
    docDir := compDir + '\' + inttostr(Quote.dbKey) +'\' + stvDocuments.Selected.Text +'\';


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
          WTWordOLEFrm := TWTWordOLEFrm.Create(self);
          WTWordOLEFrm.SaveAsDocument(compDir+sPath);
          docSaved := true;
        finally
          WTWordOLEFrm.Free;
        end;
      end
      else
      begin
        try
          WTExcelOLEFrm := TWTExcelOLEFrm.Create(self);
          WTExcelOLEFrm.SaveAsDocument(compDir+sPath);
          docSaved := true;
        finally
          WTExcelOLEFrm.Free;
        end;
      end;

      ShowDocuments(Quote.dbKey);

      if docSaved then
      begin
(*        lstvwDocuments.itemindex := -1;
        for i := 0 to pred(lstvwDocuments.Items.count) do
          begin
            if lstvwDocuments.Items[i].caption = sFileName then
              lstvwDocuments.itemindex := i;
          end;
        if lstvwDocuments.itemindex >= 0 then
          lstvwDocumentsDblClick(self);
*)
      end;
    end
    else
    begin
    end;
end;

procedure TfrmWTMaintQuote.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  WTMaintEmailFrm := TWTMaintEmailFrm.create(self);
  try
    WTMaintEmailFrm.Supplier := 0;
    WTMaintEmailFrm.SupplierBranch := 0;
    WTMaintEmailFrm.SupplierContact := 0;
    WTMaintEmailFrm.AddressType := 0;
    WTMaintEmailFrm.Customer := Quote.customer;
    WTMaintEmailFrm.CustomerBranch := 0;
    WTMaintEmailFrm.CustomerContact := 0;
    WTMaintEmailFrm.showmodal;
    if WTMaintEmailFrm.modalresult = idOK then
      begin
        sTo := WTMaintEmailFrm.edtEmail.text;
        sSubject := WTMaintEmailFrm.edtSubject.text;
        SendAndSaveEmail(sTo, sSubject);
      end;
  finally
    WTMaintEmailFrm.free;
  end;
end;

procedure TfrmWTMaintQuote.btnAttachClick(Sender: TObject);
var
  i, ipos, ilength, icount: integer;
  sFile, sFullFile, docDir: string;
begin
//  docDir := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey);

  {Find a document} ;
  if stvDocuments.TopItem.Text = stvDocuments.Selected.Text then
    docDir := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey) +'\'
  else
    docDir := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey) +'\' + stvDocuments.Selected.Text +'\';

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

            while i <> 0 do
              begin
                ipos := pos('\',sFullFile);

                sFullFile := stringreplace(sFullFile, '\', '!', []);

                i := pos('\',sFullFile);
              end;

            sFile := copy(DocOpenDialog.Files.Strings[icount], ipos+1, (iLength - ipos));

            FileCopy(DocOpenDialog.Files.Strings[icount], docDir + '\' + sFile) ;
          end;
        ShowDocuments(Quote.dbKey);
      end;
  end;
end;

procedure TfrmWTMaintQuote.FormResize(Sender: TObject);
begin
(*  lblNotes.left := memNotes.Left;
  self.memNotes.width := trunc((self.tbDocuments.width/2));
  self.lstvwDocuments.width := trunc((self.tbDocuments.width/2));
*)
//  self.pnlNotes.width := trunc((self.tbDocuments.width/2));
//  self.lstvwDocuments.width := trunc((self.tbDocuments.width/2));
//  lblNotes.left := pnlNotes.Left;
end;

procedure TfrmWTMaintQuote.SetUseMarkup(const Value: bytebool);
begin
  FUseMarkup := Value;
  if FUseMarkup then
    begin
      lblDiscountRate.Caption := 'Markup Rate %';
      lblDiscountValue.caption := 'Markup Value';
      lblDiscountAnalysis.caption := 'Markup';
      lblDiscountMarkup.caption := 'Plus';
    end
  else
    begin
      lblDiscountRate.Caption := 'Discount Rate %';
      lblDiscountValue.caption := 'Discount Value';
      lblDiscountAnalysis.caption := 'Discount';
      lblDiscountMarkup.caption := 'Minus';
    end;
end;

procedure TfrmWTMaintQuote.btnGlobalUpstdsClick(Sender: TObject);
var
  icount, inx : integer;
  QElement : TQElement;
  QUpstand : TQUpstand;
  frm: TfrmWTMaintQUpstandM;
begin
  try
    inx := strtoint(sgUpstands.cells[0,sgUpstands.row])+1000;
  except
    inx := 1000;
  end;

  try
    frm := TfrmWTMaintQUpstandM.Create(Self);
    try
      inx := Quote.Upstands.IndexOf(inx);
      QUpstand := Quote.Upstands[inx];

      Frm.QUpstand := QUpstand;
      Frm.Material := dblkpMaterial.keyvalue;
      Frm.MaterialType := dblkpMaterial.Text;
      Frm.ShowModal;
      if Frm.ModalResult = mrOK then
        begin
          {Change all the upstand elements}
          for icount := 0 to pred(Quote.Upstands.count) do
            begin
              QUpstand := Quote.Upstands[icount];
              QUpstand.Worktop := Frm.QUpstand.worktop;
              QUpstand.worktopDesc := Frm.QUpstand.worktopDesc;
//              QUpstand.WorktopGroup := Quote.Elements[inx].worktopGroup;
              QUpstand.thickness := Frm.QUpstand.thickness;
              QUpstand.thicknessDesc := Frm.QUpstand.thicknessDesc;
              QUpstand.UnitPrice := Frm.QUpstand.UnitPrice;
            end;
          ShowElements;
          ShowUpstands;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    sgElements.row := inx+1;
  end;
end;

procedure TfrmWTMaintQuote.btnLowClick(Sender: TObject);
begin
  if (sender as TSpeedButton).flat then
    (sender as TSpeedButton).flat := false
  else
    (sender as TSpeedButton).flat := true;
  if not (sender as TSpeedButton).flat then
    btnHigh.Flat := true;
end;

procedure TfrmWTMaintQuote.btnHighClick(Sender: TObject);
begin
  if (sender as TSpeedButton).flat then
    (sender as TSpeedButton).flat := false
  else
    (sender as TSpeedButton).flat := true;
  if not (sender as TSpeedButton).flat then
    btnLow.Flat := true;
end;

procedure TfrmWTMaintQuote.CreateOutlookReminder;
var
  sSubject, sBody: string;
  TargetDateTime, TargetTime: TDateTime;
  Hour, Min, Sec, MSec: Word;
begin
  if messagedlg('Do you want to create a Follow Up reminder in your Calendar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if edtFollowUpDate.Text = '' then
        exit;

      sSubject := 'Follow up quote: ' + inttostr(Quote.dbKey) +
                    ' - ' + edtCustomerName.text;
      sBody := '';

      sBody := 'Description: ' + edtDescription.text + #13#10 + #13#10;

      sBody := sbody + 'Telephone: ' + edtTelephone.text + #13#10 + #13#10;

      sBody := sBody + 'Email: ' + edtEmail.text;

      TargetTime := encodeTime(9,0,0,0);
      decodeTime(TargetTime,Hour,Min,Sec,MSec);

      TargetDatetime := PADateStr(edtFollowUpDate.Text) + encodetime(Hour,Min,Sec,Msec);
      AddAppViaOutLook('',sSubject,sBody,TargetDateTime,true,20);
    end;

(*  WTMaintContAppfrm := TWTMaintContAppfrm.create(self);
  try
    if edtFollowUpDate.Text <> '' then
      begin
        if paDateStr(edtFollowUpDate.text) > date then
          WTMaintContAppfrm.DateTimePicker.Date := paDateStr(edtFollowUpDate.text);
      end;

    WTMaintContAppfrm.showmodal;
    if WTMaintContAppfrm.modalresult = idOK then
      begin
        sSubject := 'Follow up quote: ' + inttostr(Quote.dbKey) +
                    ' - ' + edtCustomerName.text;
        sBody := '';

        sBody := 'Description: ' + edtDescription.text + #13#10 + #13#10;

        sBody := sbody + 'Telephone: ' + edtTelephone.text + #13#10 + #13#10;

        sBody := sBody + 'Email: ' + edtEmail.text;

        decodetime(WTMaintContAppfrm.dtpckAppTime.time,Hour,Min,Sec,Msec);

        TargetDatetime := WTMaintContAppfrm.DateTimePicker.date + encodetime(Hour,Min,Sec,Msec);
        AddAppViaOutLook('',sSubject,sBody,TargetDateTime,true,20);
      end;
  finally
    WTMaintContAppfrm.free;
  end;
*)
end;

procedure TfrmWTMaintQuote.btnCalendarTaskClick(Sender: TObject);
begin
  CreateOutLookReminder;
end;

procedure TfrmWTMaintQuote.SetEmailApplication(const Value: string);
begin
  FEmailApplication := Value;
end;

procedure TfrmWTMaintQuote.chkbxDeclinedClick(Sender: TObject);
begin
  dblkpReason.visible := chkbxDeclined.Checked;
  lblReason.visible := chkbxDeclined.Checked;
  btnReason.visible := chkbxDeclined.Checked;
end;

procedure TfrmWTMaintQuote.btnReasonClick(Sender: TObject);
begin
  frmwtLUReason := TfrmwtLUReason.Create(Self);
  try
    frmwtLUReason.ShowModal;

    with Quote.DataModule do
      begin
        qryQReason.Close;
        qryQReason.Open;
      end;
  finally
    frmwtLUReason.Free;
  end;
end;

procedure TfrmWTMaintQuote.ShowLinkedQuotes;
begin
  with Quote.Datamodule.qryGetLinkedQuotes do
    begin
      close;
      parambyname('Original_Quote').asinteger := Quote.OriginalQuote;
      open;
    end;
end;


procedure TfrmWTMaintQuote.tbLinkedQuotesShow(Sender: TObject);
begin
  ShowLinkedQuotes;
end;

procedure TfrmWTMaintQuote.bynSpecialInstructionsClick(Sender: TObject);
begin
  frmWTLUSpecialInstruction := TfrmWtLUSpecialInstruction.create(application);
  try
    frmWtLUSpecialInstruction.bAllow_Upd := true;
    frmWtLUSpecialInstruction.bIs_lookup := true;
    frmWtLUSpecialInstruction.showmodal;
    if frmWtLUSpecialInstruction.selected then
      begin
        GetNotes(frmWtLUSpecialInstruction.SelNarrative);
      end;
  finally
     frmWtLUSpecialInstruction.free;
  end;
end;

procedure TfrmWTMaintQuote.GetNotes(iNarrative: Integer);
var
  Narrative: TNotes;
begin
  if iNarrative = 0 then Exit;
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    memNotes.Text := Narrative.Data;
  finally
    Narrative.Free;
  end;
end;

procedure TfrmWTMaintQuote.SetContractQuote(const Value: boolean);
begin
  FContractQuote := Value;
  dblkpMaterial.Enabled := not FContractQuote;
  btnCustomerSearch.enabled := not FContractQuote;
//  pnlTotals.Enabled := not FContractQuote;
  tbWorktops.Enabled := (not FContractQuote) or (not dtmdlWorktops.UseSlabContractQuoting);
//  tbUpstands.Enabled := tbWorktops.Enabled;
  Quote.ContractQuote := FContractQuote;
end;

procedure TfrmWTMaintQuote.edtTimescaleChange(Sender: TObject);
begin
  Quote.Timescale := (Sender as TEdit).Text;
end;

procedure TfrmWTMaintQuote.edtCallBackDayChange(Sender: TObject);
begin
  Quote.CallBackDay := (Sender as TEdit).Text;

end;

procedure TfrmWTMaintQuote.edtCallBackTimeChange(Sender: TObject);
begin
  Quote.CallBackTime := (Sender as TEdit).Text;
end;

procedure TfrmWTMaintQuote.SetOriginalQuoteFromReQuote(
  const Value: integer);
begin
  FOriginalQuoteFromReQuote := Value;
end;

procedure TfrmWTMaintQuote.edtProjectChange(Sender: TObject);
begin
  Quote.ProjectReference := edtProject.Text;
end;

procedure TfrmWTMaintQuote.dblkpVatRateClick(Sender: TObject);
begin
  Quote.Vat := dblkpVatRate.KeyValue;
  Quote.VatRate := dblkpVatRate.listSource.DataSet.fieldbyname('Vat_Rate').asfloat;
  edtVatValue.Text := formatfloat('0.00',Quote.TotalVat);
  edtGrossPrice.Text := formatfloat('0.00',(Quote.TotalGross+Quote.TotalVat));
end;

procedure TfrmWTMaintQuote.btnExpiryDateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtExpiryDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtExpiryDate.text;

  edtExpiryDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintQuote.MyWinControlSetData(const Data: IUnknown);
const
  cExtensionOutlook = '.msg';
  cExtensionOutlookExpress = '.eml';
  cNotOutlookWarning = 'This file doesn''t come from Microsoft Outlook.';
  cOutlookExpressWarning = #13#10'Apparently the file comes from MS Outlook Express.';
var
  MyData: ItaoCells;
  i: Integer;
  MyPath, MyFileName, MyFilePath, MyExtension, MyWarning: string;
  MyTo, MyFrom, MySubject, MyDate, MyBody: string;
  myNewDate: TDateTime;
  MyFileStream: TStream;
  NewFilePath: string;
  sFile, sFullFile: string;
  iLength, iPos, icount: integer;
begin
  if Supports(Data, ItaoCells, MyData) then
    begin
//      MyPath := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey) +'\';
      if stvDocuments.TopItem.Text = stvDocuments.Selected.Text then
        MyPath := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey) +'\'
      else
        MyPath := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey) +'\' + stvDocuments.Selected.Text +'\';

      if not DirectoryExists(MyPath) then
  	    begin
     	    CreateDirectory(MyPath);
  	    end;

      for i := 0 to MyData.RowCount - 1 do
        begin
          MyFileName := MyData[0, i];
          MyExtension := LowerCase(ExtractFileExt(MyFileName));
          if MyExtension = cExtensionOutlook then
            begin

{ Store the contents as a file on the disk. }
              MyFilePath := MyPath + MyFileName;

{If the file name already exists then increase the number}
              icount := 0;
              NewFilePath := MyFilePath;
              while FileExists(NewFilePath) = true do
                begin
                  inc(icount);
                  NewFilePath := copy(MyFilePath, 1, length(MyFilePath)-4) + '(' + inttostr(icount) + ')' + MyExtension;
                end;

              MyFilePath := NewFilePath;

              MyFileStream := TFileStream.Create(MyFilePath, fmCreate or fmShareDenyWrite);
              try
                TextToStream(MyData[1, i], MyFileStream);
              finally
                MyFileStream.Free;
              end;
{ GUI }
              try
                ParseMessage((MyPath+MyFileName), MyTo, MyFrom, MySubject, MyDate, MyBody);
                if trim(MyDate) = '' then
                  myNewDate := date
                else
                  myNewDate := FormatDateasDateTime(MyDate);
              except
                myNewdate := date
              end;
//  This is where we add the data into the grid and to the document component

              ShowDocuments(Quote.dbKey);
            end
          else
            begin
              sFullFile := myFileName;
              iLength := length(sFullFile);

              iCount := 1;

              while iCount <> 0 do
                begin
                  ipos := pos('\',sFullFile);

                  sFullFile := stringreplace(sFullFile, '\', '!', []);

                  iCount := pos('\',sFullFile);
                end;

              sFile := copy(myFileName, ipos+1, (iLength - ipos));

              FileCopy(myFileName, myPath + sfile) ;
              ShowDocuments(Quote.dbkey);
            end;
        end;
    end;
end;

procedure TfrmWTMaintQuote.ParseMessage(const AFileName: string; var ATo, AFrom,
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

function TfrmWTMaintQuote.ParseDocumentFrom(tmpFrom: string): string;
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

function TfrmWTMaintQuote.FormatDateasDateTime(sDate: string): TDateTime;
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
  result := padatestr(copy(trim(tmpDate),1,10));
end;

procedure TfrmWTMaintQuote.taoWinControl1SetDataPaste(Sender: TObject;
  Data: IInterface);
begin
  MyWinControlSetData(Data);
end;

procedure TfrmWTMaintQuote.taoWinControl1SetDataTarget(Sender: TObject;
  Data: IInterface; X, Y: Integer);
begin
{ Ignore the drop point. So we can handle drag-and-drop and clipboard operations in uniform way. }
  MyWinControlSetData(Data);

end;

procedure TfrmWTMaintQuote.taoWinControl1UpdateAction(Sender: TObject;
  Action: TtaoUpdateAction; var Enable: Boolean);
begin
 { The Paste sub-item in the Edit menu is linked to an Action object. Enable is False on enter. }
  Enable := True;
end;

procedure TfrmWTMaintQuote.pmnuDocumentsPopup(Sender: TObject);
begin
(*  if Mode = qAdd then
    exit
  else
    begin
      pmnuDelete.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuOpen.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuSelectAll.Enabled := (lstvwDocuments.Items.count > 0);
    end;
*)
end;

procedure TfrmWTMaintQuote.pmnuPasteClick(Sender: TObject);
var
  f: THandle;
  buffer: Array [0..MAX_PATH] of Char;
  i, numFiles: Integer;
  sFile, sFullFile, docdir: string;
  iCount, iPos, iLength: integer;
begin
  docDir := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey);
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
  ShowDocuments(Quote.dbkey);
end;

procedure TfrmWTMaintQuote.pmnuDeleteClick(Sender: TObject);
var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
begin
(*  iRow := lstvwDocuments.ItemIndex;
  if iRow = -1 then exit;
  if messagedlg('Delete the selected document?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ListItem := lstvwDocuments.items[irow];
      sFileName := ListItem.caption;

      lstvwDocuments.Items.Delete(iRow);

      //Delete the actual file only if not Converting or adding as we don't know the directory name
      if (Mode <> qAdd) then
        begin
          sPath :=  dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(Quote.dbKey) + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;
*)
end;

procedure TfrmWTMaintQuote.pmnuSelectAllClick(Sender: TObject);
var
  icount: integer;
begin
(*  with lstvwDocuments do
    begin
      Items.BeginUpdate;
      for icount := 0 to pred(items.count) do
        begin
          items[icount].selected := true ;
        end;
      Items.EndUpdate;
    end;
*)
end;

procedure TfrmWTMaintQuote.lstvwDocumentsColumnClick(Sender: TObject;
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

procedure TfrmWTMaintQuote.lstvwDocumentsCompare(Sender: TObject; Item1,
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

procedure TfrmWTMaintQuote.slvDocumentsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Shift = [ssLeft] then
    (Sender as TShellListView).BeginDrag(false, 5);

end;

procedure TfrmWTMaintQuote.stvDocumentsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  files: TStringList;
  slv : TShellListView;
  cnt: integer;
  node: TTreeNode;
  sNewFile, sOldFile: string;
  pNewFile, pOldFile: array[0..255] of Char;
begin
  if (slvDocuments.selected = nil) or (X = 0) or (Y = 0) then
    exit;

  if (Source = slvDocuments) and (slvDocuments.ItemIndex > -1) and (Sender = stvDocuments) then
    begin
      try
        node := stvDocuments.GetNodeAt(X, Y);
      except
        exit;
      end;
    end
  else
    exit;

  slv := TShellListView(Source);

  files := TStringList.Create;
  try
    if NOT slv.MultiSelect then
      files.Add(slv.SelectedFolder.PathName)
    else //multiselect
    begin
      for cnt := 0 to -1 + slv.Items.Count do
        begin
      //selected and NOT folder
          if slv.Items[cnt].Selected AND (NOT slv.Folders[cnt].IsFolder) then
            begin
              if pos('.',slv.Folders[cnt].DisplayName) > 0 then
                sNewFile := slv.Folders[cnt].DisplayName
              else
                sNewFile := slv.Folders[cnt].DisplayName + ExtractFileExt(slv.Folders[cnt].PathName);

              if pos(Node.Text,slvDocuments.Root) > 0 then
                sNewFile := slvDocuments.Root + sNewFile
              else
                sNewFile := slvDocuments.Root + Node.Text + '\' + sNewFile;

              sOldFile := slv.Folders[cnt].PathName;

              StrPCopy(pNewFile, sNewFile);
              StrPCopy(pOldFile, sOldFile);
              movefile(pOldFile, pNewfile);
            end;
        end;
    end;
  finally
    files.Free;
  end;

end;

procedure TfrmWTMaintQuote.stvDocumentsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TShellListView;
end;

procedure TfrmWTMaintQuote.tbDocumentsShow(Sender: TObject);
begin
  if stvDocuments.Visible then
    stvDocuments.SetFocus;
end;

procedure TfrmWTMaintQuote.dblkpRevenueCentreClick(Sender: TObject);
begin
  Quote.RevenueCentre := dblkpRevenueCentre.KeyValue;
end;

procedure TfrmWTMaintQuote.SpeedButton1Click(Sender: TObject);
begin
  dblkpRevenueCentre.KeyValue := 0;
  Quote.RevenueCentre := 0;
end;

end.




