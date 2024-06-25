unit wtMaintSalesOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, wtSalesOrderDM, Grids, ComCtrls,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, Menus, CRControls, Spin, ImgList, ShellAPI, WTQuotesDM, ToolWin, IniFiles,
  DBGrids, DateUtils, WTPurchasesDM, wtSalesInvoiceDM, WTJobsDM, DB, Activex, AxCtrls, Clipbrd, ComObj, QrPrntr,
  ShellCtrls, System.ImageList, FireDAC.Stan.Param, DragDrop, DropTarget, DragDropFile, DropComboTarget;

type
  TfrmWTMaintSalesOrder = class(TForm)
    pnlTop: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    edtNumber: TEdit;
    dblkpOperator: TDBLookupComboBox;
    pnlHeader: TPanel;
    Label11: TLabel;
    btnCustomer: TBitBtn;
    dblkpRep: TDBLookupComboBox;
    pnlBottom: TPanel;
    lblDeleteprompt: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    stsbrDetails: TStatusBar;
    pnlFooter: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    memGoods: TMemo;
    memVAT: TMemo;
    memTotal: TMemo;
    Label7: TLabel;
    Label12: TLabel;
    edtReference: TEdit;
    Label13: TLabel;
    edtCustOrderNo: TEdit;
    pmnDummy: TPopupMenu;
    pmnLines: TPopupMenu;
    mnChangeLine: TMenuItem;
    mnDeleteLine: TMenuItem;
    mnAddLine: TMenuItem;
    Label16: TLabel;
    BitBtn3: TBitBtn;
    dtpckDate: TDateTimePicker;
    N1: TMenuItem;
    mnInsertQuote: TMenuItem;
    btnLUReps: TBitBtn;
    chkbxonHold: TCheckBox;
    mnPrintQuote: TMenuItem;
    chkbxInactive: TCheckBox;
    pcDetails: TPageControl;
    tbDetails: TTabSheet;
    tbDocuments: TTabSheet;
    dbgLines: TStringGrid;
    Panel12: TPanel;
    Label44: TLabel;
    imgDocuments: TImageList;
    mnAddQuote: TMenuItem;
    mnCopyQuote: TMenuItem;
    imgIcons: TImageList;
    DocOpenDialog: TOpenDialog;
    svDlgOfficeDoc: TSaveDialog;
    tbContactDetails: TTabSheet;
    edtContact: TEdit;
    Label28: TLabel;
    edtDescription: TMemo;
    scrlAddress: TScrollBox;
    chkbxMaterialRequired: TCheckBox;
    grpMaterials: TGroupBox;
    Label17: TLabel;
    Label19: TLabel;
    edtMatsReqDate: TEdit;
    btnMatsReqDate: TBitBtn;
    btnMatsRecDate: TBitBtn;
    edtMatsRecDate: TEdit;
    rdgrpDateType: TRadioGroup;
    grpDates: TGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    edtTempDate: TEdit;
    btnTempDate: TBitBtn;
    edtReqDate: TEdit;
    btnReqdDate: TBitBtn;
    Label18: TLabel;
    Label23: TLabel;
    Label20: TLabel;
    pnlAddress: TPanel;
    edtCustomerName: TEdit;
    edtStreet: TEdit;
    edtLocale: TEdit;
    edtTown: TEdit;
    edtPostcode: TEdit;
    Label24: TLabel;
    edtCounty: TEdit;
    pnlContactInfo: TPanel;
    Label26: TLabel;
    Label25: TLabel;
    edtTelephone: TEdit;
    edtEmailAddress: TEdit;
    tbrDocuments: TToolBar;
    btnExcel: TToolButton;
    btnWord: TToolButton;
    btnEmail: TToolButton;
    btnAttach: TToolButton;
    N2: TMenuItem;
    mnProperties: TMenuItem;
    mnRequote: TMenuItem;
    tbLinkedQuotes: TTabSheet;
    DBGrid1: TDBGrid;
    Label15: TLabel;
    Label14: TLabel;
    Label27: TLabel;
    edtDepositPaid: TCREditMoney;
    edtDepositReqd: TCREditMoney;
    edtDepositTerms: TCREditMoney;
    tbEvents: TTabSheet;
    Panel9: TPanel;
    Panel3: TPanel;
    sgEvents: TStringGrid;
    Panel18: TPanel;
    btnAddEvents: TBitBtn;
    btnChangeEvents: TBitBtn;
    btnDeleteEvents: TBitBtn;
    Panel8: TPanel;
    memEventNotes: TMemo;
    tbPurchases: TTabSheet;
    Panel2: TPanel;
    btnPOChange: TBitBtn;
    btnPODelete: TBitBtn;
    btnPORaise: TBitBtn;
    N3: TMenuItem;
    mnRaisePO: TMenuItem;
    btnPOPrint: TBitBtn;
    dbgPurchases: TDBGrid;
    btnPORemove: TBitBtn;
    pnlPurchasesFoot: TPanel;
    chkbxShowInactive: TCheckBox;
    tbSchedulingProperties: TTabSheet;
    chkbxTemplateInSchedule: TCheckBox;
    chkbxFittingInSchedule: TCheckBox;
    pmnPurchases: TPopupMenu;
    Add1: TMenuItem;
    mnuPOChange: TMenuItem;
    mnuPORemove: TMenuItem;
    mnuPODelete: TMenuItem;
    mnuPOPrint: TMenuItem;
    mnuPOReceive: TMenuItem;
    N4: TMenuItem;
    pmnuDocuments: TPopupMenu;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    MenuItem1: TMenuItem;
    pmnuSelectAll: TMenuItem;
    pnlDocuments: TPanel;
    pnlPlanDocument: TPanel;
    Label32: TLabel;
    edtPlansDocument: TEdit;
    Button5: TButton;
    opndlgPlans: TOpenDialog;
    TabSheet1: TTabSheet;
    Panel6: TPanel;
    Label36: TLabel;
    dbgSalesInvoices: TDBGrid;
    Panel19: TPanel;
    Label42: TLabel;
    memTotalSI: TMemo;
    Panel7: TPanel;
    btnViewSI: TBitBtn;
    btnRePrintSI: TBitBtn;
    tbNotes: TTabSheet;
    Panel10: TPanel;
    lblApplianceDetails: TLabel;
    lblNotes: TLabel;
    edtApplianceDetails: TMemo;
    Panel1: TPanel;
    memNotes: TMemo;
    stvDocuments: TShellTreeView;
    slvDocuments: TShellListView;
    rdgrpJobType: TRadioGroup;
    pnlFitters: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    btnContactClear: TSpeedButton;
    SpeedButton1: TSpeedButton;
    dblkpTemplater: TDBLookupComboBox;
    dblkpFitter: TDBLookupComboBox;
    btnFitter: TBitBtn;
    pnlInstallAddress: TPanel;
    Label6: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    edtInstallationName: TEdit;
    edtInstallationStreet: TEdit;
    edtInstallationLocale: TEdit;
    edtInstallationTown: TEdit;
    edtInstallationPostcode: TEdit;
    edtInstallationCounty: TEdit;
    pnlInstallContact: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label33: TLabel;
    edtInstallName: TEdit;
    edtInstallPhone: TEdit;
    edtInstallEmail: TEdit;
    memInstallAddress: TMemo;
    tbJobs: TTabSheet;
    tbRemedials: TTabSheet;
    Panel11: TPanel;
    btnJobChange: TBitBtn;
    btnJobDelete: TBitBtn;
    btnJobPrint: TBitBtn;
    dbgJobs: TDBGrid;
    Panel13: TPanel;
    btnRemedialChange: TBitBtn;
    btnRemedialDelete: TBitBtn;
    btnRemedialAdd: TBitBtn;
    btnRemedialPrint: TBitBtn;
    dbgRemedials: TDBGrid;
    btnJobSheet: TBitBtn;
    btnJobFitting: TBitBtn;
    btnJobComplete: TBitBtn;
    N5: TMenuItem;
    ConverttoJob1: TMenuItem;
    pnlRevenueCentre: TPanel;
    Label59: TLabel;
    dblkpRevenueCentre: TDBLookupComboBox;
    SpeedButton2: TSpeedButton;
    edtProject: TEdit;
    btnRemedialOrder: TBitBtn;
    chkbxDoNotInvoice: TCheckBox;
    chkbxTemplateDocsReturned: TCheckBox;
    chkbxFittingDocsReturned: TCheckBox;
    pnlSubContract: TPanel;
    Label31: TLabel;
    edtSubContractCustomer: TEdit;
    Button1: TButton;
    SpeedButton6: TSpeedButton;
    pmnuRemedials: TPopupMenu;
    Add2: TMenuItem;
    pmnuRemedialChange: TMenuItem;
    pmnuRemedialDelete: TMenuItem;
    pmnuRemedialPrint: TMenuItem;
    pmnuRemedialOrder: TMenuItem;
    btnCustomerBranch: TButton;
    Label40: TLabel;
    edtSiteName: TEdit;
    btnClearCustomerBranch: TSpeedButton;
    btnGenerateDocs: TButton;
    DropComboTarget1: TDropComboTarget;
    pnlBody: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure mnChangeLineClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure mnAddLineClick(Sender: TObject);
    procedure pmnLinesPopup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtReferenceChange(Sender: TObject);
    procedure edtCustOrderNoChange(Sender: TObject);
    procedure edtDepositPaidChange(Sender: TObject);
    procedure dbgLinesDblClick(Sender: TObject);
    procedure edtContactChange(Sender: TObject);
    procedure mnDeleteLineClick(Sender: TObject);
    procedure mnInsertQuoteClick(Sender: TObject);
    procedure btnLURepsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkbxMaterialRequiredClick(Sender: TObject);
    procedure btnTempDateClick(Sender: TObject);
    procedure edtTempDateExit(Sender: TObject);
    procedure btnReqdDateClick(Sender: TObject);
    procedure btnMatsReqDateClick(Sender: TObject);
    procedure btnMatsRecDateClick(Sender: TObject);
    procedure mnPrintQuoteClick(Sender: TObject);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure mnuOpenDocumentClick(Sender: TObject);
    procedure pmnuDocumentsPopup(Sender: TObject);
    procedure mnuDeleteDocumentClick(Sender: TObject);
    procedure edtDepositReqdChange(Sender: TObject);
    procedure edtDepositReqdEnter(Sender: TObject);
    procedure edtDepositReqdExit(Sender: TObject);
    procedure edtDepositTermsChange(Sender: TObject);
    procedure edtDepositTermsEnter(Sender: TObject);
    procedure edtDepositTermsExit(Sender: TObject);
    procedure mnAddQuoteClick(Sender: TObject);
    procedure mnCopyQuoteClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnWordClick(Sender: TObject);
    procedure rdgrpDateTypeClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mnPropertiesClick(Sender: TObject);
    procedure mnRequoteClick(Sender: TObject);
    procedure tbLinkedQuotesShow(Sender: TObject);
    procedure btnContactClearClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnFitterClick(Sender: TObject);
    procedure sgEventsDblClick(Sender: TObject);
    procedure btnAddEventsClick(Sender: TObject);
    procedure btnChangeEventsClick(Sender: TObject);
    procedure btnDeleteEventsClick(Sender: TObject);
    procedure sgEventsClick(Sender: TObject);
    procedure edtProjectChange(Sender: TObject);
    procedure btnPORaiseClick(Sender: TObject);
    procedure btnPOChangeClick(Sender: TObject);
    procedure mnRaisePOClick(Sender: TObject);
    procedure dbgPurchasesDblClick(Sender: TObject);
    procedure btnPOPrintClick(Sender: TObject);
    procedure btnPORemoveClick(Sender: TObject);
    procedure btnPODeleteClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure chkbxTemplateInScheduleClick(Sender: TObject);
    procedure chkbxFittingInScheduleClick(Sender: TObject);
    procedure edtApplianceDetailsChange(Sender: TObject);
    procedure pmnPurchasesPopup(Sender: TObject);
    procedure mnuPOReceiveClick(Sender: TObject);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure chkbxonHoldClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure edtPlansDocumentChange(Sender: TObject);
    procedure edtPlansDocumentDblClick(Sender: TObject);
    procedure dbgSalesInvoicesDblClick(Sender: TObject);
    procedure dbgSalesInvoicesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnViewSIClick(Sender: TObject);
    procedure btnRePrintSIClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure stvDocumentsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure stvDocumentsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure stvDocumentsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tbDocumentsShow(Sender: TObject);
    procedure rdgrpJobTypeClick(Sender: TObject);
    procedure edtInstallationNameChange(Sender: TObject);
    procedure btnJobAddClick(Sender: TObject);
    procedure btnJobChangeClick(Sender: TObject);
    procedure btnJobDeleteClick(Sender: TObject);
    procedure btnJobPrintClick(Sender: TObject);
    procedure btnJobSheetClick(Sender: TObject);
    procedure btnJobFittingClick(Sender: TObject);
    procedure btnJobCompleteClick(Sender: TObject);
    procedure dbgJobsDblClick(Sender: TObject);
    procedure btnRemedialAddClick(Sender: TObject);
    procedure btnRemedialChangeClick(Sender: TObject);
    procedure btnRemedialDeleteClick(Sender: TObject);
    procedure btnRemedialPrintClick(Sender: TObject);
    procedure dbgRemedialsDblClick(Sender: TObject);
    procedure ConverttoJob1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnRemedialOrderClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure pmnuRemedialsPopup(Sender: TObject);
    procedure btnCustomerBranchClick(Sender: TObject);
    procedure btnClearCustomerBranchClick(Sender: TObject);
    procedure btnGenerateDocsClick(Sender: TObject);
    procedure DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
  private
    Descending: Boolean;
    SortedColumn: Integer;
    bChangeRate: boolean;
    bChangeValue: boolean;
    bNotesFlash: ByteBool;
    dtmdlPurchases: TdtmdlPurchaseOrder;
    FActivated : Boolean;
    FMode: TsopMode;
    FSOrder: TSOrder;
    FRetailCustomer: bytebool;
    FTemplateInSchedule: bytebool;
    FFittingInSchedule: bytebool;
    FCanUpdateSchedule: bytebool;
    FOriginalSalesOrderFromCopy: integer;
    procedure SetMode(const Value: TsopMode);
    procedure SetSOrder(const Value: TSOrder);
    procedure SetGridHeaders;
    procedure BuildLineGrid;
    procedure BuildPurchaseOrderGrid;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure ShowDetails;
    procedure ShowLineDetails;
    procedure ShowPurchaseOrders;
    procedure ShowLinkedQuotes;
    procedure ShowSalesInvoices;
    procedure ShowJobs;
    procedure ShowRemedials;
    procedure ShowEvents;
    procedure ShowDocuments(iSalesOrder: integer);
    procedure ShowQuoteDocuments;
    procedure ShowTotals;
    procedure CheckNotes(Sender: TObject);
    procedure CallMaintEvent(aMode: TsoevMode);
    procedure CallMaintJobScreen(aMode: TsolMode);
    procedure CallMaintQuoteScreen(aMode: TsolMode);
    procedure CallMaintPropertyScreen(aMode: TsolMode);
    procedure CallMaintScreen(aMode: TsolMode);
    procedure SetRetailCustomer(const Value: bytebool);
    procedure SetAddressFields(tempCode: integer);
    procedure SetInstallationAddressFields(tempCode: integer);
    function ShowNotes(TempNotes: integer): string;
    function UpdateInstallAddress: Integer;
    procedure UpdateInstallationAddress;
    procedure CallQuoteSelectScreen;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure ShowListViewDocuments(strPath: string; ListView: TListView;
      ImageList: TImageList);
    procedure BuildEventGrid;
    procedure SendAndSaveEmail(sTo, sSubject: string);
    function UpdateNotes: Integer;
    procedure MoveQuoteDocument;
    procedure SetFittingInSchedule(const Value: bytebool);
    procedure SetTemplateInSchedule(const Value: bytebool);
    procedure CheckCustomerCreditStatus;
    procedure CheckIfSpeculative;
    procedure CallPOMaintScreen(aMode: TpopMode);
    procedure CallPOReceiptsScreen(aMode: TpopMode);
    procedure SetCanUpdateSchedule(const Value: bytebool);
    procedure CopyOriginalSalesOrderDocuments;
    procedure SetOriginalSalesOrderFromCopy(const Value: integer);
    procedure ClearAddressFields;
    procedure ClearInstallationAddressFields;
    procedure ParseInstallationAddress(installAddress: TMemo);
    procedure CallJobMaintScreen(aMode: TjMode);
    procedure CallMaintRemedials(aMode: TjremMode);
    procedure ConvertToJobScreen(SOLine: TSOLine);
    function ConvertRemedialToOrder: integer;
    function UpdateRemedialInstallAddress(iCode: integer;
      sAddress: string): Integer;
    procedure CreateandCopyRemedialSheet(iSOrder, iJob, iRemedial: integer);
    procedure CreateQuoteDocument(iSOrder, iQuote: integer);
    procedure MoveSiteDocuments(iSOrder: integer);
    procedure DeleteQuoteDocuments;
    procedure UpdateQuoteDocuments;
    function GetFilesPath: string;
  public
    bOK: boolean;
    bOperatorCanUpdateSchedule: boolean;
    property FittingInSchedule: bytebool read FFittingInSchedule write SetFittingInSchedule;
    property Mode: TsopMode read FMode write SetMode;
    property OriginalSalesOrderFromCopy: integer read FOriginalSalesOrderFromCopy write SetOriginalSalesOrderFromCopy;
    property RetailCustomer: bytebool read FRetailCustomer write SetRetailCustomer;
    property SOrder: TSOrder read FSOrder write SetSOrder;
    property TemplateInSchedule: bytebool read FTemplateInSchedule write SetTemplateInSchedule;
  end;

var
  frmWTMaintSalesOrder: TfrmWTMaintSalesOrder;
  dtmdlAllJobs: TdtmdlJob;

implementation

uses
  System.UITypes, System.Types, taoMAPI, wtMain, allCommon, AllImages, WTMaintSalesOrderLine, WTMaintSalesOrderJobLine,
  WTSrchCustomer, WTSrchCustContacts, wtNotesDM, wtDBMemo, WTLUSalesOrderQuotes, WTMaintSOEvents, wtLUReps, DateSelV5,
  wtRSQuote, wtDataModule, WtMaintQuote, WTMaintEmail, WTWordOLE, WTExcelOLE, wtLUFitters, WTMaintCustomer,
  WtMaintPurchaseOrder, WTMaintPurchaseOrderReceipts, WTRSPOrder, WTMaintSalesOrderRaisePO, WTMaintSalesInvoice,
  WTRSSalesInvoiceReprint, WtMaintJob, WtRSJobSheet, WtMaintJobComplete, WTMaintJRemedial, WTRSJobRemedialSheet,
  WtRPJobRemedialSheet, WTLUCustomerSite, wtRPQuote, QRPDFFilt, Shared.DragDrop.Helper;

{$R *.dfm}

procedure AddTemplateAppointment(saleOrderKey: integer; ShowAppointment: boolean); stdcall; external 'FirebellyTeamScheduler.dll';
procedure AddFittingAppointment(saleOrderKey: integer; ShowAppointment: boolean); stdcall; external 'FirebellyTeamScheduler.dll';

{ TfrmWTMaintSalesOrder }

procedure TfrmWTMaintSalesOrder.SetMode(const Value: TsopMode);
begin
  FMode := Value;
end;

procedure TfrmWTMaintSalesOrder.SetSOrder(const Value: TSOrder);
begin
  FSOrder := Value;
end;

procedure TfrmWTMaintSalesOrder.FormActivate(Sender: TObject);
var
  sTemp: string;
  iLines: integer;
begin
  if not FActivated then
  begin
    bChangeValue := false;
    bChangeRate := false;

    bOperatorCanUpdateSchedule := dtmdlWorktops.OperatorCanUpdateSchedule(frmWtMain.Operator);

    {Show Properties page if can update schedule}
    tbSchedulingProperties.TabVisible := bOperatorCanUpdateSchedule;

    with SOrder.DataModule do
    begin
      qryOperator.close;
      qryOperator.open;
    end;

    with SOrder.DataModule do
    begin
      qryRep.close;
      qryRep.open;
    end;

    with SOrder.DataModule do
    begin
      qryRevenueCentre.close;
      qryRevenueCentre.open;
    end;

    with SOrder.DataModule.qryFitter do
    begin
      close;
      parambyname('Fitter').asinteger := SOrder.Fitter;
      open;
    end;

    with SOrder.DataModule.qryTemplater do
    begin
      close;
      parambyname('Templater').asinteger := SOrder.Templater;
      open;
    end;

    case Mode of
    sopAdd     : Caption := 'Add a Sales Order';
    sopChange  : Caption := 'Change a Sales Order';
    sopDelete  : Caption := 'Delete a Sales Order';
    sopCopy   : Caption := 'Copy a Sales Order';
    end;  { case }
    if (Mode = sopAdd)  or (Mode = sopCopy) then
      sTemp := ' New Sales Order '
    else
      sTemp := ' Sales Order ' + IntToStr(SOrder.DbKey) + ' ';

    if Mode = sopCopy then
      begin
        SOrder.DbKey := 0;
        for ilines := 0 to pred(SOrder.lines.count) do
          begin
            Sorder.Lines[iLines].QtyAllocated := 0;
            Sorder.Lines[iLines].QtyDelivered := 0;
            Sorder.Lines[iLines].QtyInvoiced := 0;
          end;
      end;


    ShowDetails;
    ShowLineDetails;
    if Mode <> sopCopy then
      begin
        ShowJobs;
        ShowRemedials;
        ShowPurchaseOrders;
        ShowSalesInvoices;
        ShowEvents;
      end;

    if (Mode = sopConvert) and (SOrder.DataModule.QuoteNo <> 0) then
      ShowQuoteDocuments
    else
    if (Mode = sopCopy) then
      ShowDocuments(OriginalSalesOrderFromCopy)
    else
      ShowDocuments(SOrder.dbKey);

    ShowTotals;
    {Had to put this in because the components where losing the Listdatasource}
    dblkpOperator.ListSource := SOrder.DataModule.dtsOperator;
    dblkpRep.ListSource := SOrder.DataModule.dtsRep;
    dblkpFitter.ListSource := SOrder.DataModule.dtsFitter;
    dblkpTemplater.ListSource := SOrder.DataModule.dtsTemplater;
    dblkpRevenueCentre.listsource := SOrder.DataModule.dtsRevenueCentre;

    Checknotes(Self);
    CheckOK(Self);

//    CheckifSpeculative;
    CheckCustomerCreditStatus;
    FActivated := true;
  end;
end;

procedure TfrmWTMaintSalesOrder.CheckCustomerCreditStatus;
var
  custStatus: string;
begin
  custStatus := dtmdlWorktops.GetCustomerCreditStatus(SOrder.Customer);
  if (custStatus = 'S') or (custStatus = 'B') then
    MessageDlg(cOnStop, mtWarning,[mbOk], 0)
  else
  if custStatus = 'O' then
    MessageDlg(cOverDue, mtWarning,[mbOk], 0);
end;

procedure TfrmWTMaintSalesOrder.CheckIfSpeculative;
var
  OldCursor : TCursor;
  iCustomer: integer;
begin
  if SOrder.Speculative then
    begin
      if MessageDlg('This order is for a speculative trade customer, do you want to convert to a confirmed trade customer?',
          mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

      frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);

      try
        frmwtSrchCustomer.CodeSelected := SOrder.Customer;
        frmwtSrchCustomer.Address := SOrder.Address;

        frmwtSrchCustomer.showmodal;
        if frmwtSrchCustomer.modalresult = idOK then
          begin
          end;
      finally
        frmwtSrchCustomer.Free;
      end;
(*      {Display customer create screen}
      OldCursor := Screen.Cursor;
      Screen.Cursor := crHourglass;

      frmWTMaintCustomer := TfrmWTMaintCustomer.create(application);
      try
        iCustomer := 0;
        frmWTMaintCustomer.GetRecord(iCustomer);
        frmWTMaintCustomer.GetAddress(SOrder.Address);

        frmWTMaintCustomer.FunctionMode := 'S';
        frmWTMaintCustomer.showmodal;
        if frmWTMaintCustomer.ModalResult = idOK then
          begin
            SOrder.Customer := frmWTMaintCustomer.Customer;
          end;
      finally
        Screen.Cursor := OldCursor;
        frmWTMaintCustomer.free;
      end;
*)
    end;
end;

procedure TfrmWTMaintSalesOrder.FormCreate(Sender: TObject);
begin
  bOK := false;

  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  {Set job type}
  if not dtmdlWorktops.UseRemedialsAsOrders then
    begin
      with rdgrpJobType do
        begin
          Items.Delete(4);
          Items.Delete(3);
          height := 90;
          top := 166;
        end;
      pnlSubContract.visible := false;
    end;

  btnRemedialOrder.Visible := dtmdlWorktops.UseRemedialsAsOrders;
  SetGridHeaders;

  dtmdlAllJobs := TdtmdlJob.create(Application);
  pnlRevenueCentre.Visible := dtmdlWorktops.UseRevenueCentres;
  pcDetails.ActivePage := tbDetails;
  tbPurchases.TabVisible := dtmdlWorktops.UsePurchaseOrdering;
  btnGenerateDocs.Visible := dtmdlWorktops.UseDocumentTransfer;

  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);

  lblNotes.left := memNotes.Left;
  lblApplianceDetails.left := edtApplianceDetails.Left;
end;

procedure TfrmWTMaintSalesOrder.SetGridHeaders;
begin
  {Sales Order header}
  dbgLines.cells[0,0] := 'Line';
  dbgLines.cells[1,0] := 'Quote';
  dbgLines.cells[2,0] := 'Part Code';
  dbgLines.cells[2,0] := 'Description';
  dbgLines.cells[3,0] := 'Quantity';
  dbgLines.cells[5,0] := 'Unit Price';
  dbgLines.cells[4,0] := 'Price Unit';
  dbgLines.cells[6,0] := 'Total Goods';
  dbgLines.cells[7,0] := 'VAT Rate';
  dbgLines.cells[8,0] := 'Job';
  dbgLines.cells[9,0] := 'PO Number';
  dbgLines.cells[10,0] := 'Invoice Number';

(*
  {Purchase Order header}
  dbgPurchases.cells[0,0] := 'Line';
  dbgPurchases.cells[1,0] := 'PO Number';
  dbgPurchases.cells[2,0] := 'Date Raised';
  dbgPurchases.cells[3,0] := 'Date Required';
  dbgPurchases.cells[4,0] := 'Supplier';
  dbgPurchases.cells[5,0] := 'Description';
  dbgPurchases.cells[6,0] := 'Slab Size';
  dbgPurchases.cells[7,0] := 'Cost';
  dbgPurchases.cells[8,0] := 'Quantity';
  dbgPurchases.cells[9,0] := 'Total Cost';
  dbgPurchases.cells[10,0] := 'Status';
  dbgPurchases.cells[11,0] := 'GRN No.';
*)

  {Event header}
  sgEvents.cells[0,0] := 'No';
  sgEvents.cells[1,0] := 'Date/Time';
  sgEvents.cells[2,0] := 'Operator';

end;

procedure TfrmWTMaintSalesOrder.ShowDetails;
var
  Year, Month, Day, DOW: Word;
  tmpDate: TDateTime;
begin
  if Mode = sopAdd then
    begin
      edtNumber.text := '<New Order>';
      dtpckDate.Date := date;

      {Default the Template date}
      tmpDate := incday(date,1);
      DecodeDateFully(tmpDate,Year, Month, Day,DOW);

      case DOW of
        1:  begin
              tmpDate := incday(tmpDate,1);
              edtTempDate.text := paDateStr(tmpDate);
            end;
        2..6: edtTempDate.text := paDateStr(tmpdate);
        7:  begin
              tmpDate := incday(tmpDate,2);
              edtTempDate.text := paDateStr(tmpDate);
            end;
      end;

      {Default the Fitting date}
      tmpDate := incday(date,8);
      DecodeDateFully(tmpDate,Year, Month, Day,DOW);

      case DOW of
        1:  begin
              tmpDate := incday(tmpDate,1);
              edtReqDate.text := paDateStr(tmpDate);
            end;
        2..6: edtReqDate.text := paDateStr(tmpdate);
        7:  begin
              tmpDate := incday(tmpDate,2);
              edtReqDate.text := paDateStr(tmpDate);
            end;
      end;

      SOrder.TemplateDate := padatestr(edtTempDate.text);
      SOrder.DateRequired := padatestr(edtReqDate.text);

      dblkpRevenueCentre.KeyValue := 0;
      if dtmdlWorktops.UseRevenueCentres then
        begin
          dblkpRevenueCentre.KeyValue := dtmdlWorktops.GetOperatorRevenueCentre(frmWTMain.Operator);
        end
      else
        dblkpRevenueCentre.KeyValue := 0;

      dblkpOperator.KeyValue := frmWtMain.Operator;
      dblkpRep.KeyValue := 0;
      edtDescription.Text := '';
      edtCustomerName.text := '';
      edtProject.text := '';
      edtReference.text := '';
      edtCustOrderNo.Text := '';
      edtContact.text := '';
      edtDepositTerms.Text := '0.00';
      edtDepositReqd.Text := '0.00';
      edtDepositPaid.Text := '0.00';
      memInstallAddress.lines.clear;
      edtInstallName.Text := '';
      edtInstallEmail.Text := '';
      edtInstallPhone.Text := '';
      edtEmailAddress.Text := '';

      edtSubContractCustomer.Text := '';

      self.RetailCustomer := false;

      edtMatsReqDate.Text := '';
      edtMatsRecDate.text := '';

      edtApplianceDetails.Text := '';
      dblkpFitter.KeyValue := 0;
      dblkpTemplater.KeyValue := 0;
      rdgrpJobType.ItemIndex := 0;

      edtPlansDocument.text := '';

      btnCustomerBranch.Visible := false;

      tbJobs.TabVisible := false;
      tbRemedials.TabVisible := false;
      tbPurchases.TabVisible := false;
    end
  else
    begin
      if SOrder.dbKey = 0 then
        begin
          edtNumber.text := '<New Order>';
          dtpckDate.Date := date;

          {Default the Template date}
          tmpDate := incday(date,1);
          DecodeDateFully(tmpDate,Year, Month, Day,DOW);

          case DOW of
            1:  begin
                  tmpDate := incday(tmpDate,1);
                  edtTempDate.text := paDateStr(tmpDate);
                end;
            2..6: edtTempDate.text := paDateStr(tmpdate);
            7:  begin
                  tmpDate := incday(tmpDate,2);
                  edtTempDate.text := paDateStr(tmpDate);
                end;
          end;

          {Default the Fitting date}
          tmpDate := incday(date,8);
          DecodeDateFully(tmpDate,Year, Month, Day,DOW);

          case DOW of
            1:  begin
                  tmpDate := incday(tmpDate,1);
                  edtReqDate.text := paDateStr(tmpDate);
                end;
            2..6: edtReqDate.text := paDateStr(tmpdate);
            7:  begin
                  tmpDate := incday(tmpDate,2);
                  edtReqDate.text := paDateStr(tmpDate);
                end;
          end;

          {Added 7/9/2022 to use the remedial proposed date}
          if Mode = sopRemedial then
            begin
              edtReqDate.text := paDateStr(SOrder.DateRequired);
            end
          else
            begin
              SOrder.TemplateDate := padatestr(edtTempDate.text);
              SOrder.DateRequired := padatestr(edtReqDate.text);
            end;

          edtMatsReqDate.Text := '';
          edtMatsRecDate.text := '';

          if dtmdlWorktops.UseRevenueCentres then
            begin
              dblkpRevenueCentre.KeyValue := dtmdlWorktops.GetOperatorRevenueCentre(frmWTMain.Operator);
            end
          else
            dblkpRevenueCentre.KeyValue := 0;

          if SOrder.Retail then
            begin
              if SOrder.InstallAddress <> 0 then
                memInstallAddress.Text := ShowNotes(SOrder.InstallAddress)
              else
                memInstallAddress.Text := dtmdlWorktops.getAddress(SOrder.Address)
            end
          else
            begin
              memInstallAddress.Text := ShowNotes(SOrder.InstallAddress);
            end;

          btnCustomerBranch.Visible := SOrder.BranchExist;

          SOrder.InstallAddress := 0;

          {This is the new installation address format}
          if SOrder.InstallationAddress <> 0 then
            SetInstallationAddressFields(SOrder.InstallationAddress)
          else
            ParseInstallationAddress(memInstallAddress);

          edtSiteName.Text := SOrder.CustomerBranchName;

          SOrder.InstallationAddress := 0;

          SOrder.Operator := frmWTMain.Operator;
          SOrder.OperatorName := frmWTMain.OperatorName;
        end
      else
        begin
          edtNumber.text := inttostr(SOrder.dbKey);
          dtpckDate.Date := SOrder.SODate;
          edtReqDate.text := paDateStr(SOrder.DateRequired);
          try
            edtTempDate.text := paDateStr(SOrder.TemplateDate);
          except
            edtTempDate.text := paDateStr(SOrder.DateRequired);
          end;

          {Show the material required date}
          if SOrder.MaterialReqdDate = 0 then
            edtMatsReqDate.Text := ''
          else
            edtMatsReqDate.Text := paDateStr(SOrder.MaterialReqdDate);

          {Show the material received date}
          if SOrder.MaterialRecdDate = 0 then
            edtMatsRecDate.Text := ''
          else
            edtMatsRecDate.Text := paDateStr(SOrder.MaterialRecdDate);

          if SOrder.DateType = 'P' then
            rdgrpDateType.ItemIndex := 0
          else
          if SOrder.DateType = 'C' then
            rdgrpDateType.ItemIndex := 1
          else
            rdgrpDateType.ItemIndex := 2;

          dtmdlWorktops.CreateSalesDocDirectory(inttostr(SOrder.dbKey));
          memInstallAddress.Text := ShowNotes(SOrder.InstallAddress);

          if SOrder.InstallationAddress <> 0 then
            SetInstallationAddressFields(SOrder.InstallationAddress)
          else
            ParseInstallationAddress(memInstallAddress);

          edtSiteName.Text := SOrder.CustomerBranchName;
          btnCustomerBranch.Visible := SOrder.BranchExist;

        end;

      edtCustomerName.text := SOrder.CustomerName;
//      memInstallAddress.text := SOrder.DataModule.GetCustomerAddress(SOrder.InstallAddress);

      memNotes.text := SOrder.NarrativeText;

      edtInstallName.Text := SOrder.InstallName;
      edtInstallEmail.Text := SOrder.InstallEmail;
      edtInstallPhone.Text := SOrder.InstallPhone;

      edtSubContractCustomer.Text := SOrder.InvoiceCustomerName;

      edtContact.text := SOrder.ContactName;
      self.RetailCustomer := (SOrder.Address <> 0) and (not SOrder.Speculative);

      if (SOrder.Address = 0) then
        SetAddressFields(SOrder.Customer)
      else
        SetAddressFields(SOrder.Address);

//      SOrder.DataModule.GetCustomerRep(SOrder.Rep);
      if SOrder.AccountManager = 0 then
        dblkpOperator.KeyValue :=  frmWTMain.Operator
      else
        dblkpOperator.KeyValue :=  SOrder.AccountManager;

      dblkpRep.KeyValue :=  SOrder.Rep;
      dblkpRevenueCentre.KeyValue :=  SOrder.RevenueCentre;

      chkbxMaterialRequired.Checked := SOrder.MaterialRequired;
      chkbxOnHold.Checked := SOrder.OnHold;
      chkbxDoNotInvoice.Checked := SOrder.DoNotInvoice;
      chkbxTemplateDocsReturned.checked := SOrder.TemplateDocsReturned;
      chkbxFittingDocsReturned.checked := SOrder.FittingDocsReturned;

      chkbxinactive.Checked := (SOrder.inactive = 'Y');

      if (SOrder.SupplyOnly = 'Y') then
        rdgrpJobType.ItemIndex := 1
      else
      if (SOrder.CollectionOnly = 'Y') then
        rdgrpJobType.ItemIndex := 2
      else
      if (SOrder.RemedialProduction = 'Y') then
        rdgrpJobType.ItemIndex := 3
      else
      if (SOrder.RemedialNoProduction = 'Y') then
        rdgrpJobType.ItemIndex := 4
      else
        rdgrpJobType.ItemIndex := 0;

      bChangeRate := true;
      edtDepositTerms.text := formatfloat('0.00',SOrder.DepositTerms);
      bChangeRate := false;

      edtDepositPaid.Text := formatfloat('0.00',SOrder.DepositAmount);
      edtDescription.Text := SOrder.Description;

      edtproject.Text := SOrder.ProjectReference;
      edtReference.Text := SOrder.Reference;
      edtCustOrderNo.Text := SOrder.OrderReference;

      {Scheduling}
      chkbxTemplateInSchedule.Checked := (SOrder.TemplateInSchedule);
      chkbxFittingInSchedule.checked := (SOrder.FittingInSchedule);

      TemplateInSchedule := SOrder.TemplateInSchedule;
      FittingInSchedule := SOrder.FittingInSchedule;

      if rdgrpJobType.itemindex > 0 then
        begin
          edtTempDate.Enabled := false;
          btnTempDate.enabled := false;
        end
      else
        begin
          edtTempDate.Enabled := true;
          btnTempDate.enabled := true;

          edtTempDate.enabled := not TemplateInSchedule;
          btnTempDate.Enabled := edttempDate.enabled;

        end;

      edtReqDate.enabled := not FittingInSchedule;
      btnReqdDate.enabled := edtReqDate.enabled;

      if FittingInSchedule then
        begin
          rdgrpDateType.Items.Delete(2);
          rdgrpDateType.height := 70;
        end;

      edtPlansDocument.text := SOrder.LocationPlanDocument;
      edtApplianceDetails.Text := SOrder.ApplianceDetails;

      dblkpFitter.KeyValue := SOrder.Fitter;
      dblkpTemplater.KeyValue := SOrder.Templater;
//      pnlFitters.Enabled := (not TemplateInSchedule) and (not FittingInSchedule);

      rdgrpJobType.Enabled := not TemplateInSchedule AND not FittingInSchedule;

      rdgrpDateType.Enabled := not TemplateInSchedule OR not FittingInSchedule;
      rdgrpDateType.Enabled := not SOrder.OnHold;

      grpDates.Enabled := (not SOrder.OnHold) and (SOrder.DateType <> 'T');

      stsbrDetails.Panels[0].Text := 'Created by: ' + SOrder.OperatorName;

(*      if SOrder.StockAllocationStartDate <> 0 then
        stsbrDetails.Panels[1].Text := 'Stock Allocated for fitting between ' + paDateStr(SOrder.StockAllocationStartDate) + ' and ' + paDateStr(SOrder.StockAllocationEndDate) ;
*)
    end;

  {Don't allow changing of subcontract customer if it's been invoiced or part invocied}
  pnlSubContract.Enabled := SOrder.Status < 90;

  pnlTop.enabled := not(Mode = sopView) and not(Mode = sopDelete);
  pnlHeader.enabled := not(Mode = sopView) and not(Mode = sopDelete);
  pnlFooter.enabled := not(Mode = sopView) and not(Mode = sopDelete);
  pcDetails.enabled := not(Mode = sopView) and not(Mode = sopDelete);
  btnOK.Visible := not(Mode = sopView);
  lbldeleteprompt.visible := (Mode = sopDelete);
  if (Mode = sopView) or (Mode = sopDelete) then
    begin
      dbgLines.popupMenu := pmnDummy;
    end;
end;

function TfrmWTMaintSalesOrder.ShowNotes(TempNotes: integer): string;
var
  Notes: TNotes;
begin
  Result := '';
  if TempNotes = 0 then exit;
  Notes := TNotes.create;
  try
    Notes.DbKey := TempNotes;
    Notes.LoadfromDb;
    Result := Notes.DataInfo;
  finally
    Notes.free;
  end;
end;

procedure TfrmWTMaintSalesOrder.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
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
            var Stamp: TDateTime;
            FileAge(strPath + ListItem.Caption, Stamp);
            ListItem.SubItems.Add(DateTimeToStr(Stamp));
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

procedure TfrmWTMaintSalesOrder.ShowDocuments(iSalesOrder: integer);
var
  sPath: string;
begin
  if iSalesOrder = 0 then
    begin
      stvDocuments.visible := false;
      slvDocuments.visible := false;
      exit;
    end;

  sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(iSalesOrder) + '\';

  try
    stvDocuments.root := sPath;
    slvDocuments.root := sPath;
  except
    messagedlg('The document location hasn''t been defined for Sales Orders within Company Preferences. Contact your Firebelly administrator', mtError, [mbAbort], 0);
    stvDocuments.visible := false;
    slvDocuments.visible := false;
  end;

(*  lstvwDocuments.Clear;
  // Assign a Imagelist to the ListView
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
*)
  if Mode = sopCopy then
    begin
      stvDocuments.enabled := false;
      slvDocuments.enabled := false;
      tbrDocuments.Enabled := false;
    end;

end;

procedure TfrmWTMaintSalesOrder.ShowQuoteDocuments;
var
  sPath: string;
begin
  if SOrder.datamodule.QuoteNo = 0 then
    begin
      stvDocuments.visible := false;
      slvDocuments.visible := false;
      exit;
    end;

  sPath := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(SOrder.datamodule.QuoteNo) + '\';

  try
    stvDocuments.root := sPath;
    slvDocuments.root := sPath;
  except
    messagedlg('The document location hasn''t been defined for Quotes within Company Preferences. Contact your Firebelly administrator', mtError, [mbAbort], 0);
    stvDocuments.visible := false;
    slvDocuments.visible := false;
  end;
  // Assign a Imagelist to the ListView
(*  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
//  lstvwDocuments.ViewStyle := vsIcon;
//  lstvwDocuments.Columns.Add;
//  lstvwDocuments.Columns.Add;
//  ShowListViewDocuments('\\aktivsrv01\company data\jobs\803537', lstvwDocuments, imgDocuments);
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
*)
end;

function TfrmWTMaintSalesOrder.UpdateInstallAddress: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := SOrder.InstallAddress;
    Notes.DataInfo := memInstallAddress.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

procedure TfrmWTMaintSalesOrder.SetAddressFields(tempCode: integer);
begin
  ClearAddressFields;
  if (not Retailcustomer) AND (not SOrder.Speculative) then
    begin
      edtStreet.text := SOrder.dataModule.GetCustomerStreet(SOrder.Customer);
      edtLocale.text := SOrder.dataModule.GetCustomerLocale(SOrder.Customer);
      edtTown.text := SOrder.dataModule.GetCustomerTown(SOrder.Customer);
      edtPostcode.text := SOrder.dataModule.GetCustomerPostcode(SOrder.Customer);
      edtCounty.text := SOrder.dataModule.GetCustomerCounty(SOrder.Customer);
      edtTelephone.text := SOrder.dataModule.GetCustomerTelephone(SOrder.Customer);
      edtEmailAddress.text := SOrder.dataModule.GetCustomerEmail(SOrder.Customer);

      pnlAddress.Enabled := false;
      scrlAddress.Enabled := false;
//      pnlTelephone.Enabled := false;
    end
  else
    begin
      edtCustomerName.text := SOrder.dataModule.GetAddressName(SOrder.Address);
      edtStreet.text := SOrder.dataModule.GetAddressStreet(SOrder.Address);
      edtLocale.text := SOrder.dataModule.GetAddressLocale(SOrder.Address);
      edtTown.text := SOrder.dataModule.GetAddressTown(SOrder.Address);
      edtPostcode.text := SOrder.dataModule.GetAddressPostcode(SOrder.Address);
      edtCounty.text := SOrder.dataModule.GetAddressCounty(SOrder.Address);
      edtTelephone.text := SOrder.dataModule.GetAddressTelephone(SOrder.Address);
      edtEmailAddress.text := SOrder.dataModule.GetAddressEmail(SOrder.Address);

      pnlAddress.Enabled := true;
      scrlAddress.Enabled := true;
//      pnlTelephone.Enabled := true;
    end;

end;

procedure TfrmWTMaintSalesOrder.SetInstallationAddressFields(tempCode: integer);
begin
  ClearInstallationAddressFields;
  edtInstallationName.text := SOrder.dataModule.GetAddressName(tempCode);
  edtInstallationStreet.text := SOrder.dataModule.GetAddressStreet(tempCode);
  edtInstallationLocale.text := SOrder.dataModule.GetAddressLocale(tempCode);
  edtInstallationTown.text := SOrder.dataModule.GetAddressTown(tempCode);
  edtInstallationPostcode.text := SOrder.dataModule.GetAddressPostcode(tempCode);
  edtInstallationCounty.text := SOrder.dataModule.GetAddressCounty(tempCode);

(*  edtInstallationName.text := SOrder.dataModule.GetAddressName(SOrder.InstallationAddress);
  edtInstallationStreet.text := SOrder.dataModule.GetAddressStreet(SOrder.InstallationAddress);
  edtInstallationLocale.text := SOrder.dataModule.GetAddressLocale(SOrder.InstallationAddress);
  edtInstallationTown.text := SOrder.dataModule.GetAddressTown(SOrder.InstallationAddress);
  edtInstallationPostcode.text := SOrder.dataModule.GetAddressPostcode(SOrder.InstallationAddress);
  edtInstallationCounty.text := SOrder.dataModule.GetAddressCounty(SOrder.InstallationAddress);
*)

//  edtTelephone.text := SOrder.dataModule.GetAddressTelephone(SOrder.InstallationAddress);
//  edtEmailAddress.text := SOrder.dataModule.GetAddressEmail(SOrder.InstallationAddress);

  edtSiteName.enabled := SOrder.BranchExist;
  btnCustomerBranch.visible := Sorder.BranchExist
end;

procedure TfrmWTMaintSalesOrder.ShowTotals;
var
  rDeposit: real;
begin
  memGoods.text := FloatToStrF(SOrder.TotalGoods, ffCurrency, 15, 2);
  memVAT.text := FloatToStrF(SOrder.TotalVAT, ffCurrency, 15, 2);
  memTotal.text := FloatToStrF((SOrder.TotalGoods+SOrder.TotalVAT), ffCurrency, 15, 2);

  {Show Deposit Values}
  rDeposit := (SOrder.TotalGoods + Sorder.TotalVat) * (SOrder.DepositTerms/100);
  edtDepositReqd.text := formatfloat('0.00',rDeposit);
end;

procedure TfrmWTMaintSalesOrder.ClearAddressFields;
begin
  edtStreet.Clear;
  edtLocale.Clear;
  edtTown.Clear;
  edtPostcode.Clear;
  edtCounty.Clear;
//  edtTelephone.Clear;
//  edtEmail.Clear;
end;

procedure TfrmWTMaintSalesOrder.ClearInstallationAddressFields;
begin
  edtInstallationName.Clear;
  edtInstallationStreet.Clear;
  edtInstallationLocale.Clear;
  edtInstallationTown.Clear;
  edtInstallationPostcode.Clear;
  edtInstallationCounty.Clear;
end;

procedure TfrmWTMaintSalesOrder.ShowLineDetails;
begin
  if (Mode = sopAdd) then
    begin
      ClearGrid(dbgLines);  {Clear contents of Line grid}
      BuildLineGrid;
    end
  else
    begin
      BuildLineGrid;
    end;
end;

procedure TfrmWTMaintSalesOrder.ShowLinkedQuotes;
begin
  with SOrder.Datamodule.qryGetLinkedQuotes do
    begin
      close;
      parambyname('Sales_Order').asinteger := SOrder.dbKey;
      open;
    end;
end;

procedure TfrmWTMaintSalesOrder.ClearGrid(TempGrid: TStringGrid);
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

procedure TfrmWTMaintSalesOrder.BuildLineGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with dbgLines, SOrder.datamodule do
    begin
      for i := 0 to pred(SOrder.Lines.count) do
        begin
        cells[0,i+1] := inttostr(SOrder.Lines[i].SOLNumber);
        if SOrder.Lines[i].Quote <> 0 then
          begin
            if Mode = sopCopy then
              cells[1,i+1] := ''
            else
              cells[1,i+1] := 'Q/'+ floattostr(SOrder.Lines[i].Quote)
          end
        else
          cells[1,i+1] := SOrder.Lines[i].StockCode;
        cells[2,i+1] := SOrder.Lines[i].Description;
        cells[3,i+1] := floattostr(SOrder.Lines[i].Quantity);
        cells[4,i+1] := inttostr(SOrder.Lines[i].SellUnit);
        cells[5,i+1] := formatfloat('0.00',SOrder.Lines[i].UnitPrice);
        cells[6,i+1] := formatfloat('0.00',SOrder.Lines[i].TotalGoods);
        cells[7,i+1] := SOrder.Lines[i].VATDescription;
        if SOrder.Lines[i].Job <> 0 then
          cells[8,i+1] := 'J/'+ floattostr(SOrder.Lines[i].Job)
        else
          cells[8,i+1] := '';
        if SOrder.Lines[i].PONumber <> 0 then
          cells[9,i+1] := 'PO/'+ floattostr(SOrder.Lines[i].PONumber)
        else
          cells[9,i+1] := '';
        cells[10,i+1] := SOrder.Lines[i].SINumber;

        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
end;

procedure TfrmWTMaintSalesOrder.BuildPurchaseOrderGrid;
var
  i, icount: integer;
begin
(*  icount := 0;
  with dbgPurchases, SOrder.datamodule do
    begin
      for i := 0 to pred(SOrder.Purchases.count) do
        begin
        cells[0,i+1] := inttostr(SOrder.Purchases[i].POLNumber);
        cells[1,i+1] := 'PO/'+ floattostr(SOrder.Purchases[i].PONumber) ;
        cells[2,i+1] := paDateStr(SOrder.Purchases[i].DateRaised);
        cells[3,i+1] := paDateStr(SOrder.Purchases[i].DateRequired);
        cells[4,i+1] := SOrder.Purchases[i].SupplierName;
        cells[5,i+1] := SOrder.Purchases[i].LineDescription;
        cells[6,i+1] := inttostr(SOrder.Purchases[i].SlabLength) + ' x ' + inttostr(SOrder.Purchases[i].SlabDepth) + ' ' + SOrder.Purchases[i].SlabDescription;
        cells[7,i+1] := formatfloat('ï¿½0.00',SOrder.Purchases[i].UnitCost);
        cells[8,i+1] := inttostr(SOrder.Purchases[i].Quantity);
        cells[9,i+1] := formatfloat('ï¿½0.00',SOrder.Purchases[i].TotalCost);
        cells[10,i+1] := SOrder.Purchases[i].StatusDescription;
        cells[11,i+1] := SOrder.Purchases[i].GRNNumber;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
*)
end;

procedure TfrmWTMaintSalesOrder.CheckNotes(Sender: TObject);
begin
end;

procedure TfrmWTMaintSalesOrder.CheckOK(Sender : TObject);
begin
  btnOK.enabled := (dblkpOperator.keyvalue <> null) and
                    (edtCustomerName.Text <> '') and
                    (trim(edtReference.Text) <> '') and
                    (trim(edtDescription.Text) <> '') and
                    (trim(edtCustOrderNo.Text) <> '') and
                    (SOrder.lines.count > 0) and
                    (dblkpRep.KeyValue <> 0) and
                    (edtInstallName.Text <> '') and
                    (edtInstallPhone.Text <> '') and
                    (memInstallAddress.Text <> '');
end;

procedure TfrmWTMaintSalesOrder.btnOKClick(Sender: TObject);
var
  iCount, iLines, iCustomerVat: integer;
  bUpdateSchedule: boolean;
  sSchedulingSystem: string;
begin
  if Mode = sopDelete then
    if MessageDlg('Are you sure you want to delete this sales order?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;

  if rdgrpDateType.ItemIndex = -1 then
    begin
      messagedlg('Please specify the nature of the template and fitting dates', mtinformation, [mbOK], 0);
      rdgrpDateType.setfocus;
      exit;
    end;

  if (rdgrpDateType.ItemIndex = 2) AND (dtmdlWorktops.CheckMandatorySODates) then
    begin
      messagedlg('Please specify either provisional or confirmed for the template and fitting dates. TBC is unavailable!', mtinformation, [mbOK], 0);
      rdgrpDateType.setfocus;
      exit;
    end;

  if (rdgrpDateType.ItemIndex < 2) AND ((edtTempDate.Text = '') OR (edtReqDate.Text = '')) AND (rdgrpJobType.ItemIndex = 0) then
    begin
      messagedlg('Please specify the template and fitting dates', mtinformation, [mbOK], 0);
      rdgrpDateType.setfocus;
      exit;
    end;

  if chkbxMaterialRequired.checked and (edtMatsReqdate.Text = '') then
    begin
      messagedlg('If materials are required then please specify a Required Date', mtinformation, [mbOK], 0);
      edtMatsReqDate.setfocus;
      exit;
    end;

  if (rdgrpDateType.ItemIndex < 2) AND (PADateStr(edtTempDate.Text) > PADateStr(edtReqDate.Text)) then
    begin
      messagedlg('The template date is before the fitting date!', mtWarning, [mbOK], 0);
    end;

  iCustomerVat := dtmdlWorktops.GetCustomerVat(SOrder.Customer);
  if (dtmdlWorktops.GetCustomerVatRate(SOrder.Customer) = 0) then
    begin
      for icount := 0 to pred(SOrder.lines.count) do
        if SOrder.lines[icount].VatRate > 0 then
          if messagedlg('This customer is zero rated but the order has vatable lines. Amend the order lines?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              for iLines := 0 to pred(SOrder.lines.count) do
                SOrder.lines[iLines].Vat := iCustomerVat;
            end;
    end;

  SOrder.SODate := dtpckDate.date;
  SOrder.DateRequired := paDateStr(edtReqDate.text);
  SOrder.TemplateDate := paDateStr(edtTempDate.text);
  SOrder.AccountManager := dblkpOperator.KeyValue;
  SOrder.Operator := frmWTMain.Operator;
  SOrder.Rep := dblkprep.KeyValue;
  SOrder.RevenueCentre := dblkpRevenueCentre.KeyValue;
  SOrder.OnHold := chkbxOnHold.checked;
  SOrder.DoNotInvoice := chkbxDoNotInvoice.checked;
  SOrder.TemplateDocsReturned := chkbxTemplateDocsReturned.checked;
  SOrder.FittingDocsReturned := chkbxFittingDocsReturned.checked;

  if chkbxInactive.checked then
    SOrder.inactive := 'Y'
  else
    SOrder.inactive := 'N';

  SOrder.TemplateInSchedule := chkbxTemplateInSchedule.checked;
  SOrder.FittingInSchedule := chkbxFittingInSchedule.checked;

  SOrder.Fitter := dblkpFitter.KeyValue;
  SOrder.Templater := dblkpTemplater.KeyValue;

  case rdgrpJobType.ItemIndex of
    1:  begin
          SOrder.SupplyOnly := 'Y';
          SOrder.CollectionOnly := 'N';
          SOrder.RemedialProduction := 'N';
          SOrder.RemedialNoProduction := 'N';
        end;
    2:  begin
          SOrder.SupplyOnly := 'N';
          SOrder.CollectionOnly := 'Y';
          SOrder.RemedialProduction := 'N';
          SOrder.RemedialNoProduction := 'N';
        end;
    3:  begin
          SOrder.SupplyOnly := 'N';
          SOrder.CollectionOnly := 'N';
          SOrder.RemedialProduction := 'Y';
          SOrder.RemedialNoProduction := 'N';
        end;
    4:  begin
          SOrder.SupplyOnly := 'N';
          SOrder.CollectionOnly := 'N';
          SOrder.RemedialProduction := 'N';
          SOrder.RemedialNoProduction := 'Y';
        end
  else
    begin
      SOrder.SupplyOnly := 'N';
      SOrder.CollectionOnly := 'N';
      SOrder.RemedialProduction := 'N';
      SOrder.RemedialNoProduction := 'N';
    end
  end;

  SOrder.ExtraNotes := UpdateNotes;
  SOrder.MaterialRequired := chkbxMaterialRequired.checked;
  if SOrder.MaterialRequired then
    begin
      SOrder.MaterialReqdDate := paDateStr(edtMatsReqDate.text);
      SOrder.MaterialRecdDate := paDateStr(edtMatsRecDate.text);
    end
  else
    begin
      SOrder.MaterialReqdDate := 0;
      SOrder.MaterialRecdDate := 0;
    end;

  SOrder.InstallEmail := edtInstallEmail.text;
  SOrder.InstallName := edtInstallName.text;
  SOrder.InstallPhone := edtInstallPhone.text;

  case rdgrpDateType.itemindex of
    0: SOrder.DateType := 'P';
    1: SOrder.DateType := 'C';
    2: SOrder.DateType := 'T';
  end;

  if (Mode = sopCopy) or (Mode = sopConvert)  or (Mode = sopRemedial) then
    begin
      SOrder.InstallAddress := 0;
      SOrder.Status := 10;
    end;

  bUpdateSchedule := false;
  sSchedulingSystem := '';

  if (not SOrder.OnHold) and (SOrder.DateType <> 'T') then
    begin
      {Check if order is for fitting of worktops and needs to update schedule}
      sSchedulingSystem := trim(dtmdlWorktops.SchedulingSystem);
      if (sSchedulingSystem <> '') then
        begin
          if bOperatorCanUpdateSchedule then
            begin
              for icount := 0 to pred(SOrder.Lines.count) do
                begin
                  if SOrder.lines[icount].Quote <> 0 then
                    begin
                      bUpdateSchedule := true;
                      break;
                    end;
                end;
              if (SOrder.RemedialProduction = 'Y') or (SOrder.RemedialNoProduction = 'Y') then
                bUpdateSchedule := true;
            end;
        end;

      {Check if Outlook is running if using Outlook scheduling}
      if bUpdateSchedule and (pos('Outlook',sSchedulingSystem) > 0) then
        begin
          bUpdateSchedule := (pos('OUT',frmwtMain.EmailApplication) > 0) AND dtmdlWorktops.IsOutlookRunning;
        end;
    end;

  if (Mode = sopAdd) or (Mode = sopChange) or (Mode = sopCopy) or (Mode = sopConvert) or (Mode = sopRemedial) then
    begin
      SOrder.InstallationAddress := SOrder.DataModule.SetAddress(SOrder.InstallationAddress,
                                                edtInstallationName.text,
                                                edtInstallationStreet.text,
                                                edtInstallationLocale.text,
                                                edtInstallationTown.text,
                                                edtInstallationPostcode.text,
                                                edtInstallationCounty.text,
                                                edtInstallEmail.text,
                                                edtInstallphone.text,
                                                'I');
      SOrder.InstallAddress := UpdateInstallAddress;
      SOrder.CustomerName := edtCustomerName.Text;
      SOrder.Retail := self.RetailCustomer;

      {If using scheduling then make sure we've got the correct template date before saving}
      If TemplateInSchedule then
        SOrder.TemplateDate := SOrder.DataModule.GetTemplateDate(SOrder.dbKey);

      {If using scheduling then make sure we've got the correct fitting date before saving}
      if FittingInSchedule then
        SOrder.DateRequired := SOrder.DataModule.GetFittingDate(SOrder.dbKey);

      if RetailCustomer OR SOrder.Speculative then
        SOrder.Address := SOrder.DataModule.SetAddress(SOrder.Address,
                                                edtCustomerName.text,
                                                edtStreet.text,
                                                edtLocale.text,
                                                edtTown.text,
                                                edtPostcode.text,
                                                edtCounty.text,
                                                edtEmailAddress.text,
                                                edtTelephone.text,
                                                '');
      SOrder.OrderMode := Mode;
      SOrder.SaveToDB(true);

      if Mode = sopConvert then
        begin
          MoveQuoteDocument;
        end
      else
      if Mode = sopCopy then
        begin
          CopyOriginalSalesOrderDocuments;
        end;

      if (Mode = sopAdd) or (Mode = sopConvert) or (Mode = sopCopy) or (Mode = sopRemedial)then
        begin
          messagedlg('Sales Order number '+ floattostr(SOrder.dbKey)+ ' created', mtInformation, [mbOk], 0);

          if ((bUpdateSchedule) AND (messagedlg('Update the schedule with the appointment dates and details?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)) then
            begin
              try
                if (rdgrpDateType.ItemIndex < 2) then
                  begin
                    if (SOrder.SupplyOnly = 'Y') or (SOrder.CollectionOnly = 'Y') then
                      begin
                        if SOrder.DateRequired <> 0 then
                          begin
                            if (sSchedulingSystem = 'Moraware') then
                              begin
                                if dtmdlWorktops.UseDocumentTransfer then
                                  begin
                                    for icount := 0 to pred(SOrder.Lines.count) do
                                      begin
                                        if SOrder.Lines[icount].Quote > 0 then
                                          CreateQuoteDocument(SOrder.dbKey, SOrder.Lines[icount].Quote);
                                      end;
                                    MoveSiteDocuments(SOrder.dbKey);
                                  end;
                                AddMorawareAppointment(SOrder.Fitter, SOrder.dbKey, false);
                              end
                            else
                            if (pos('Outlook',sSchedulingSystem) > 0) then
                                AddOutlookDeliveryAppointment(SOrder.Fitter, SOrder.dbKey, false)
                          end;
                        messagedlg('The Delivery/Collection appointment has been added to the Firebelly Schedule.', mtInformation, [mbOk], 0);
                      end
                    else
                    if (SOrder.RemedialProduction = 'Y') or (SOrder.RemedialNoProduction = 'Y') then
                      begin
                        if SOrder.DateRequired <> 0 then
                          begin
                            if (sSchedulingSystem = 'Moraware') then
                              begin
                                if dtmdlWorktops.UseDocumentTransfer then
                                  begin
                                    for icount := 0 to pred(SOrder.Lines.count) do
                                      begin
                                        if SOrder.Lines[icount].Quote > 0 then
                                          CreateQuoteDocument(SOrder.dbKey, SOrder.Lines[icount].Quote);
                                      end;
                                    MoveSiteDocuments(SOrder.dbKey);
                                  end;
                                AddMorawareAppointment(SOrder.Fitter, SOrder.dbKey, false);
                              end
                            else
                            if (pos('Outlook',sSchedulingSystem) > 0) then
                              begin
                                if (SOrder.RemedialProduction = 'Y') then
                                  AddOutlookRemedialProductionAppointment(SOrder.Fitter, SOrder.dbKey, false)
                                else
                                  AddOutlookRemedialNoProductionAppointment(SOrder.Fitter, SOrder.dbKey, false);
                              end;
                          end;
                        messagedlg('The Remedial appointment has been added to the Firebelly Schedule.', mtInformation, [mbOk], 0);
                      end
                    else
                      begin
                        if SOrder.TemplateDate <> 0 then
                          begin
                            if (sSchedulingSystem = 'Moraware') then
                              begin
                                if dtmdlWorktops.UseDocumentTransfer then
                                  begin
                                    for icount := 0 to pred(SOrder.Lines.count) do
                                      begin
                                        if SOrder.Lines[icount].Quote > 0 then
                                          CreateQuoteDocument(SOrder.dbKey, SOrder.Lines[icount].Quote);
                                      end;
                                    MoveSiteDocuments(SOrder.dbKey);
                                  end;
                                AddMorawareAppointment(SOrder.Fitter, SOrder.dbKey, false);
                              end
                            else
                            if (pos('Outlook',sSchedulingSystem) > 0) then
                              AddOutlookTemplateAppointment(SOrder.Templater, SOrder.dbKey, false);
                          end;

                        if SOrder.DateRequired <> 0 then
                          begin
                            if (sSchedulingSystem = 'Moraware') then
                            else
                            if (pos('Outlook',sSchedulingSystem) > 0) then
                              AddOutlookFittingAppointment(SOrder.Fitter, SOrder.dbKey, false);
                          end;

                        messagedlg('Template and Fitting appointments have been added to the Firebelly Schedule.', mtInformation, [mbOk], 0);
                      end;
                  end;
              except
              end;
            end;
        end
      else
        begin
          if ((bUpdateSchedule) AND (messagedlg('Update the schedule with the appointment dates and details?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)) then
            begin
              if (rdgrpDateType.ItemIndex < 2) then
                begin
                  if (SOrder.SupplyOnly = 'Y') or (SOrder.CollectionOnly = 'Y') then
                    begin
                      if not SOrder.FittingInSchedule then
                        begin
                          if (sSchedulingSystem = 'Moraware') then
                            begin
                              if dtmdlWorktops.UseDocumentTransfer then
                                begin
                                  for icount := 0 to pred(SOrder.Lines.count) do
                                    begin
                                      if SOrder.Lines[icount].Quote > 0 then
                                        CreateQuoteDocument(SOrder.dbKey, SOrder.Lines[icount].Quote);
                                    end;
                                  MoveSiteDocuments(SOrder.dbKey);
                                end;
                              AddMorawareAppointment(SOrder.Fitter, SOrder.dbKey, false);
                            end
                          else
                          if (pos('Outlook',sSchedulingSystem) > 0) then
                            AddOutlookDeliveryAppointment(SOrder.Fitter, SOrder.dbKey, false);
                        end
                      else
                        begin
                          if (sSchedulingSystem = 'Moraware') then
                          else
                          if (pos('Outlook',sSchedulingSystem) > 0) then
//                              UpdateOutlookDeliveryAppointment(SOrder.Fitter, SOrder.dbKey, false);
                        end;
                      if not SOrder.FittingInSchedule then
                        messagedlg('The Delivery appointment has been updated to the Firebelly Schedule.', mtInformation, [mbOk], 0);
                    end
                  else
                  if (SOrder.RemedialProduction = 'Y') or (SOrder.RemedialNoProduction = 'Y') then
                    begin
                      if not SOrder.FittingInSchedule then
                        begin
                          if (sSchedulingSystem = 'Moraware') then
                            begin
                              if dtmdlWorktops.UseDocumentTransfer then
                                begin
                                  for icount := 0 to pred(SOrder.Lines.count) do
                                    begin
                                      if SOrder.Lines[icount].Quote > 0 then
                                        CreateQuoteDocument(SOrder.dbKey, SOrder.Lines[icount].Quote);
                                    end;
                                  MoveSiteDocuments(SOrder.dbKey);
                                end;
                              AddMorawareAppointment(SOrder.Fitter, SOrder.dbKey, false);
                            end
                          else
                          if (pos('Outlook',sSchedulingSystem) > 0) then
                            begin
                              if (SOrder.RemedialProduction = 'Y') then
                                AddOutlookRemedialProductionAppointment(SOrder.Fitter, SOrder.dbKey, false)
                              else
                                AddOutlookRemedialNoProductionAppointment(SOrder.Fitter, SOrder.dbKey, false);
                            end;
                        end
                      else
                        begin
                          if (sSchedulingSystem = 'Moraware') then
                          else
                          if (pos('Outlook',sSchedulingSystem) > 0) then
                            begin
(*                              if (SOrder.RemedialProduction = 'Y') then
                                UpdateOutlookRemedialProductionAppointment(SOrder.Fitter, SOrder.dbKey, false)
                              else
                                UpdateOutlookRemedialNoProductionAppointment(SOrder.Fitter, SOrder.dbKey, false);
*)
                            end;
                        end;
                      if not SOrder.FittingInSchedule then
                        messagedlg('The Remedial appointment has been updated to the Firebelly Schedule.', mtInformation, [mbOk], 0);
                    end
                  else
                    begin
                      if SOrder.TemplateDate <> 0 then
                        begin
                          if not SOrder.TemplateInSchedule then
                            begin
                              if (sSchedulingSystem = 'Moraware') then
                                begin
                                  if dtmdlWorktops.UseDocumentTransfer then
                                    begin
                                      for icount := 0 to pred(SOrder.Lines.count) do
                                        begin
                                          if SOrder.Lines[icount].Quote > 0 then
                                            CreateQuoteDocument(SOrder.dbKey, SOrder.Lines[icount].Quote);
                                        end;
                                      MoveSiteDocuments(SOrder.dbKey);
                                    end;
                                  AddMorawareAppointment(SOrder.Fitter, SOrder.dbKey, false);
                                end
                              else
                              if (pos('Outlook',sSchedulingSystem) > 0) then
                                AddOutlookTemplateAppointment(SOrder.Templater, SOrder.dbKey, false);
                            end
                          else
                            begin
                              if (sSchedulingSystem = 'Moraware') then
                              else
                              if (pos('Outlook',sSchedulingSystem) > 0) then
//                                UpdateOutlookTemplateAppointment(SOrder.Templater, SOrder.dbKey, false)
                                ;
                            end
                        end;

                      if SOrder.DateRequired <> 0 then
                        begin
                          if not SOrder.FittingInSchedule then
                            begin
                              if (sSchedulingSystem = 'Moraware') then
                              else
                              if (pos('Outlook',sSchedulingSystem) > 0) then
                                AddOutlookFittingAppointment(SOrder.Fitter, SOrder.dbKey, false);
                            end
                          else
                            begin
                              if (sSchedulingSystem = 'Moraware') then
                              else
                              if (pos('Outlook',sSchedulingSystem) > 0) then
//                                  UpdateOutlookFittingAppointment(SOrder.Fitter, SOrder.dbKey, false)
                                  ;
                            end;
                        end;
                      if not SOrder.TemplateInSchedule or not SOrder.FittingInSchedule then
                        messagedlg('Template and Fitting appointments have been updated to the Firebelly Schedule.', mtInformation, [mbOk], 0);
                    end;
                end;
            end;
        end;
    end
  else
  if (Mode = sopDelete) then
    if SOrder.dbkey = 0 then
      begin
        SOrder.Inactive := 'Y';
        SOrder.DeleteFromDB;
      end
    else
      begin
        SOrder.Inactive := 'Y';
        SOrder.DeleteFromDB;
      end;
  bOK := true;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintSalesOrder.MoveQuoteDocument;
var
  sSource, sDest: string;
  ListItem: TListItem;
  irow: integer;

  icount: Integer;
begin

  sSource := dtmdlWorktops.GetCompanyQuoteDirectory + '\' + inttostr(SOrder.datamodule.QuoteNo) + '\' ;
  sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(SOrder.dbkey) + '\' ;

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

procedure TfrmWTMaintSalesOrder.mnChangeLineClick(Sender: TObject);
begin
  if (copy(dbgLines.cells[1,dbgLines.row],1,2) = 'Q/') or (copy(dbgLines.cells[1,dbgLines.row],1,2) = '') then
    begin
      if Mode = sopCopy then
        exit
      else
        CallMaintQuoteScreen(solChange)
    end
  else
    CallMaintScreen(solChange);
end;

function TfrmWTMaintSalesOrder.UpdateNotes: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := SOrder.ExtraNotes;
    Notes.DataInfo := memNotes.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

procedure TfrmWTMaintSalesOrder.CallMaintScreen(aMode : TsolMode);
var
  iCol, iRow: integer;
  inx : integer;
  SOLine : TSOLIne;
  frm: TfrmWTMaintSalesOrderLine;
begin
//  inx := dbgLines.row;
  icol := dbgLines.col;
  irow := dbgLines.row;
  try
    inx := strtoint(dbgLines.cells[0, iRow]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintSalesOrderLine.Create(Self);
    try
      if aMode = solAdd then
        SOLine := TSOLine.Create(SOrder)
      else
      begin
        inx := SOrder.Lines.IndexOf(inx);
        SOLine := SOrder.Lines[inx];
      end;
      Frm.SOrder := SOrder;
      Frm.SOLine := SOLine;
      Frm.Mode := aMode;
      if SOLine.QtyInvoiced > 0 then
        begin
          if MessageDlg('This line has been invoiced and cannot be changed or deleted, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit
          else
            Frm.Mode := solView;
        end;
      Frm.ShowModal;
      if (aMode = solAdd) and (Frm.ModalResult <> mrOK) then
        SOLine.Free;
    finally
      Frm.Free;
    end;
  finally
    ShowLineDetails;
    ShowTotals;
    checkok(self);
  end;
end;

procedure TfrmWTMaintSalesOrder.CallMaintEvent(aMode : TsoevMode);
var
  inx : integer;
  SOEvent : TSOEvent;
  frm: TfrmWTMaintSOEvents;
begin
//  inx := sgEvents.row;

  try
    inx := strtoint(sgEvents.cells[0,sgEvents.row]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintSOEvents.Create(Self);
    try
      if aMode = soevAdd then
        SOEvent := TSOEvent.create(SOrder)
      else
      begin
        inx := SOrder.Events.IndexOf(inx);
        SOEvent := SOrder.Events[inx];
      end;
      Frm.SOEvent := SOEvent;
      Frm.Mode := aMode;
//      Frm.OperatorName := dblkpOperator.Text;
//      Frm.Operator := dblkpOperator.keyvalue;
      Frm.OperatorName := frmWTMain.OperatorName;
      Frm.Operator := frmWTMain.Operator;
      Frm.ShowModal;
      if (aMode = soevAdd) and (Frm.ModalResult <> mrOK) then
        SOEvent.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowEvents;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = soevAdd then
      begin
        inx := pred(SOrder.Events.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = soevDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgEvents.row := inx+1;
  end;
end;

procedure TfrmWTMaintSalesOrder.CallMaintPropertyScreen(aMode : TsolMode);
var
  iCol, iRow, inx : integer;
  SOLine : TSOLIne;
  frm: TfrmWTMaintSalesOrderLine;
begin
//  inx := dbgLines.row;
  icol := dbgLines.col;
  irow := dbgLines.row;

  try
    inx := strtoint(dbgLines.cells[0, iRow]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintSalesOrderLine.Create(Self);
    try
      if aMode = solAdd then
        SOLine := TSOLine.Create(SOrder)
      else
      begin
        inx := SOrder.Lines.IndexOf(inx);
        SOLine := SOrder.Lines[inx];
      end;
      Frm.SOLine := SOLine;
      Frm.Mode := aMode;
      Frm.ChangeAll := true;
      Frm.ShowModal;
      if (aMode = solAdd) and (Frm.ModalResult <> mrOK) then
        SOLine.Free;
    finally
      Frm.Free;
    end;
  finally
    ShowLineDetails;
    ShowTotals;
    checkok(self);
  end;
end;

procedure TfrmWTMaintSalesOrder.CallMaintQuoteScreen(aMode : TsolMode);
var
  iCol, iRow: integer;
  inx : integer;
  SOLine : TSOLIne;
  key: integer;
  frm : TfrmWtMaintQuote;
  dtmdlQuoteSO: TdtmdlQuote;
  aQuote : TQuote;
  qMode: TqMode;
begin
//  inx := dbgLines.row;
  icol := dbgLines.col;
  irow := dbgLines.row;

  try
    inx := strtoint(dbgLines.cells[0, iRow]);
  except
    inx := 1
  end;

  if (aMode = solAdd) then
    begin
      SOLine := TSOLine.Create(SOrder);
      key := 0
    end
  else
    begin
      inx := SOrder.Lines.IndexOf(inx);
      SOLine := SOrder.Lines[inx];
      Key := SOLine.Quote;
    end;

  dtmdlQuoteSO := TdtmdlQuote.create(self);
  try
    aQuote := TQuote.Create(dtmdlQuoteSO);
    aQuote.DbKey := Key;

    {set the quote status}
    if aMode = solAdd then
      qMode := qAdd
    else
    if aMode = solChange then
      qMode := qChange
    else
    if aMode = solCopy then
      qMode := qCopy
    else
    if aMode = solRequote then
      qMode := qRequote;

    aQuote.QMode := qMode;
    aQuote.LoadFromDB;

    if (aMode = solCopy) then
      begin
        SOLine := TSOLine.Create(SOrder);
        aMode := solAdd;
      end;

    if qMode = qRequote then
      begin
        if MessageDlg('A requote will replace the selected quote in the order with a new quote, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
      end;

    if qMode = qChange then
      begin
        if SOLine.QtyInvoiced > 0 then
          begin
            if MessageDlg('This line has been invoiced, only the costs can be changed or deleted, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              exit
            else
              qMode := qView;
          end
        else
        if (aQuote.Status > 10) and (aQuote.Status < 23)  then
          begin
            if MessageDlg('This quote is '+ aQuote.StatusDescr + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              exit;
          end
        else
        if (aQuote.Status > 23) then
          begin
            if MessageDlg('This quote is '+ aQuote.StatusDescr + ', you cannot change any of the specification, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                exit
            else
              qMode := qRestrict;
          end;
      end;

    Frm := TfrmwtMaintQuote.Create(Self);
    try
      Frm.Mode := qMode;
      Frm.OriginalQuoteFromReQuote := aQuote.dbKey;
      Frm.Quote := aQuote;
      Frm.ShowModal;
      if (aMode = solAdd) and (not Frm.bOK) then
        SOLine.Free
      else
      if Frm.bOK then
        begin
          SOLine.UnitPrice := aQuote.TotalPrice - aQuote.DiscountValue + aQuote.InstallPrice + aQuote.SurveyPrice + aQuote.DeliveryPrice + aQuote.MarkupValue + aQuote.TotalWasteCost;
          SOLine.NettPrice := aQuote.TotalPrice;
          SOLine.DiscountValue := aQuote.DiscountValue;
          SOLine.MarkupValue := aQuote.MarkupValue;
          SOLine.InstallPrice := aQuote.InstallPrice;
          SOLine.SurveyPrice := aQuote.SurveyPrice;
          SOLine.DeliveryPrice := aQuote.DeliveryPrice;
          SOLine.WasteValue := aQuote.TotalWasteCost;
          SOLine.Vat := aQuote.Vat;
          SOLine.Description := aQuote.Description;
          SOLine.Quantity := 1;
          SOLine.CostUnit := 1;
          SOLine.SellUnit := 1;
          SOline.Quote := aQuote.dbKey;
          if aMode = solCopy then
            SOLine.Job := 0;
//          SOLine.QtyAllocated := 0;
//          SOLine.QtyDelivered := 0;
//          SOLine.QtyInvoiced := 0;
          SOLine.Product := 0;
          SOLine.StockDescription := '';
          SOLine.StockCode := '';
          SOLine.UnitCost := 0;
          SOLine.VatDescription := SOLine.parent.datamodule.getVatDescription(SOLine.Vat);
          SOLine.VatRate := aQuote.VatRate;
          if (aMode = solAdd) then
            begin
              SOLine.SOLNumber := SOLine.Parent.Lines.MaxLineNo + 1;
              SOLine.Mode := 'A';
              SOLine.Parent.Lines.Add(SOLine);
            end;

          if SOrder.TemplateInSchedule and dtmdlWorktops.UseDocumentTransfer then
            begin
              {Delete all PDf documents and then re-add existing quote docs}
              UpdateQuoteDocuments;
            end;
        end;
    finally
      Frm.Free;
    end;
  finally
    dtmdlQuoteSO.Free;
  end;

  ShowLineDetails;
  ShowTotals;

  checkok(self);
end;

procedure TfrmWTMaintSalesOrder.CallMaintJobScreen(aMode : TsolMode);
var
  iCol, iRow: integer;
  inx : integer;
  SOLine : TSOLIne;
  frm: TfrmWTMaintSalesOrderJobLine;
begin
//  inx := dbgLines.row;
  icol := dbgLines.col;
  irow := dbgLines.row;
  inx := strtoint(dbgLines.cells[0, iRow]);

  try
    frm := TfrmWTMaintSalesOrderJobLine.Create(Self);
    try
      if aMode = solAdd then
        SOLine := TSOLine.Create(SOrder)
      else
      begin
        inx := SOrder.Lines.IndexOf(inx);
        SOLine := SOrder.Lines[inx];
      end;
      Frm.SOLine := SOLine;
      Frm.Mode := aMode;
      if SOLine.QtyInvoiced > 0 then
        begin
          if MessageDlg('This line has been invoiced and cannot be changed or deleted, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit
          else
            Frm.Mode := solView;
        end;
      Frm.ShowModal;
      if (aMode = solAdd) and (Frm.ModalResult <> mrOK) then
        SOLine.Free;
    finally
      Frm.Free;
    end;
  finally
    ShowLineDetails;
    ShowTotals;
    checkok(self);
  end;
end;

procedure TfrmWTMaintSalesOrder.btnCustomerClick(Sender: TObject);
var
  custStatus: string;
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := SOrder.Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        custStatus := dtmdlWorktops.GetCustomerCreditStatus(frmwtSrchCustomer.CodeSelected);
        if custStatus <> 'B' then
          begin
            if custStatus = 'S' then
              MessageDlg(cOnStop, mtWarning,[mbOk], 0)
            else
            if custStatus = 'O' then
              MessageDlg(cOverdue, mtWarning,[mbOk], 0);

            SOrder.Customer := frmwtSrchCustomer.CodeSelected;
            SOrder.CustomerName := frmwtSrchCustomer.NameSelected;

            SOrder.BranchExist := dtmdlWorktops.DoesCustomerBranchExist(SOrder.Customer);

            if SOrder.CustomerBranch <> 0 then
              SetInstallationAddressFields(0);

            SOrder.DepositTerms := frmWTSrchCustomer.DepositTerms;
            bChangeRate := true;
            edtDepositTerms.text := formatfloat('0.00',SOrder.DepositTerms);
            bChangeRate := false;
            edtCustomerName.text := frmwtSrchCustomer.NameSelected;
            RetailCustomer := frmwtSrchCustomer.RetailCustomer;
            SOrder.Speculative := frmwtSrchCustomer.Speculative;

            SOrder.Rep := frmwtSrchCustomer.Rep;
            dblkpRep.keyvalue := SOrder.Rep;

            if (not RetailCustomer) AND (not SOrder.Speculative) then
              begin
                SetAddressFields(SOrder.Customer);
              end
            else
              begin
                ClearAddressFields;
                pnlAddress.Enabled := true;
                scrlAddress.Enabled := true;
              end;
          end
        else
          begin
            //customer is on stop and on stop customers are blocked so warn user and return
            MessageDlg('This Customer is currently On Stop.'+#10#13+'Orders cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
          end;
      end
  finally
    frmwtSrchCustomer.free;
  end;
  CheckOK(self);
end;

procedure TfrmWTMaintSalesOrder.SetRetailCustomer(const Value: bytebool);
begin
  FRetailCustomer := Value;
end;

procedure TfrmWTMaintSalesOrder.mnAddLineClick(Sender: TObject);
begin
  CallMaintScreen(solAdd);
end;

procedure TfrmWTMaintSalesOrder.pmnLinesPopup(Sender: TObject);
var
  inx: integer;
  SOLine: TSOLine;
begin
  if (SOrder.Lines.count > 0) then
    begin
      inx := dbgLines.row;
      inx := strtoint(dbgLines.Cells[0,inx]);
      inx := SOrder.Lines.IndexOf(inx);
      SOLine := SOrder.Lines[inx];

      mnChangeLine.enabled := (SOrder.Lines.count > 0);
      mnDeleteLine.enabled := (SOrder.Lines.count > 0) and (SOLine.QtyInvoiced <= 0);
      mnProperties.enabled := (SOrder.Lines.count > 0);

      mnCopyQuote.enabled := (SOLine.Quote <> 0) and (Mode <> sopCopy);
      mnRequote.enabled := (SOLine.QtyInvoiced <= 0) and (SOLine.Quote <> 0);
      mnPrintQuote.enabled := (SOLine.Quote <> 0) and (Mode <> sopCopy);
      mnRaisePO.visible := dtmdlWorktops.UsePurchaseOrdering and ((Mode <> sopConvert));
      mnRaisePO.enabled := dtmdlWorktops.UsePurchaseOrdering and ((Mode <> sopConvert));
    end
  else
    begin
      mnChangeLine.enabled := (SOrder.Lines.count > 0);
      mnDeleteLine.enabled := (SOrder.Lines.count > 0);
      mnProperties.enabled := (SOrder.Lines.count > 0);

      mnCopyQuote.enabled := (SOrder.Lines.count > 0);
      mnReQuote.enabled := (SOrder.Lines.count > 0);
      mnPrintQuote.enabled := (SOrder.Lines.count > 0);
      mnRaisePO.visible := false;
    end;
end;

procedure TfrmWTMaintSalesOrder.BitBtn3Click(Sender: TObject);
begin
  frmwtSrchCustContacts := TfrmwtSrchCustContacts.create(self);
  try
    frmwtSrchCustContacts.Customer := SOrder.Customer;
    frmwtSrchCustContacts.ContactNo := SOrder.ContactNo;
    frmwtSrchCustContacts.isLookup := true;
    frmwtSrchCustContacts.showmodal;
    if frmwtSrchCustContacts.modalresult = idOK then
      begin
        SOrder.ContactNo := frmwtSrchCustContacts.ContactNo;
        edtContact.Text := frmwtSrchCustContacts.ContactName;
      end
  finally
    frmwtSrchCustContacts.free;
  end;
end;

procedure TfrmWTMaintSalesOrder.edtReferenceChange(Sender: TObject);
begin
   SOrder.Reference := edtReference.text;
   CheckOK(self);
end;

procedure TfrmWTMaintSalesOrder.edtCustOrderNoChange(Sender: TObject);
begin
   SOrder.OrderReference := edtCustOrderNo.text;
   CheckOK(self);

end;

procedure TfrmWTMaintSalesOrder.edtDepositPaidChange(Sender: TObject);
begin
  SOrder.DepositAmount := StrToFloatDef(edtDepositPaid.text, 0, FormatSettings);
  CheckOK(self);
end;

procedure TfrmWTMaintSalesOrder.dbgLinesDblClick(Sender: TObject);
begin
  if dbgLines.Cells[0,dbgLines.Row] <> '' then
    mnChangeLineclick(self);
end;

procedure TfrmWTMaintSalesOrder.edtContactChange(Sender: TObject);
begin
  SOrder.ContactName := edtContact.Text;
  CheckOK(self);
end;

procedure TfrmWTMaintSalesOrder.mnDeleteLineClick(Sender: TObject);
begin
  if SOrder.Lines.count = 1 then
    begin
      MessageDlg('You cannot delete the last line of an order', mtInformation,
        [mbOk], 0);
      exit;
    end;

  if (copy(dbgLines.cells[1,dbgLines.row],1,2) = 'Q/') or (copy(dbgLines.cells[1,dbgLines.row],1,2) = '') then
    CallMaintJobScreen(solDelete)
  else
    CallMaintScreen(solDelete);

end;

procedure TfrmWTMaintSalesOrder.mnInsertQuoteClick(Sender: TObject);
begin
  CallQuoteSelectScreen;
end;

procedure TfrmWTMaintSalesOrder.CallQuoteSelectScreen;
var
  SOLine : TSOLine;
  frm: TfrmWTLUSalesOrderQuotes;
begin
  frm := TfrmWTLUSalesOrderQuotes.Create(Self);
  try
    SOLine := TSOLine.Create(SOrder);
    frm.edtCustomerName.text := SOrder.CustomerName;
    frm.Customer := SOrder.Customer;
    frm.SOLine := SOLine;
    Frm.ShowModal;
    if (Frm.ModalResult <> mrOK) then
      SOLine.Free;
    if Frm.ModalResult = mrOK then
      begin
        ShowLineDetails;
        ShowTotals;

        if SOrder.TemplateInSchedule and dtmdlWorktops.UseDocumentTransfer then
          begin
            {Delete all PDf documents and then re-add existing quote docs}
            UpdateQuoteDocuments;
          end;
      end;
  finally
    Frm.Free;
    CheckOK(self);
  end;
end;

procedure TfrmWTMaintSalesOrder.btnLURepsClick(Sender: TObject);
begin
  frmWTLUReps := TfrmWTLUReps.create(self);
  try
    frmWTLUReps.showmodal;
  finally
    frmWTLUReps.free;
  end;

  dtmdlSalesOrder.dtsRep.DataSet.active := false;
  dtmdlSalesOrder.dtsRep.DataSet.active := true;

end;

procedure TfrmWTMaintSalesOrder.FormDestroy(Sender: TObject);
begin
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintSalesOrder.chkbxMaterialRequiredClick(
  Sender: TObject);
begin
  grpMaterials.Enabled := (Sender as TCheckbox).checked;
end;

procedure TfrmWTMaintSalesOrder.btnTempDateClick(Sender: TObject);
var
  tempDate: string;
  dtTemp: TDateTime;
begin
  if trim(edtTempDate.Text) = '' then
    begin
      dtTemp := date + 1;
      tempdate := padateStr(dtTemp);
    end
  else
    tempdate := edtTempDate.text;

  edtTempDate.text := paDatestr(InputDate(paDateStr(tempdate)));

  if trim(edtReqDate.Text) = '' then
    begin
      dtTemp := paDateStr(edtTempDate.Text);
      dtTemp := incDay(dtTemp,7);
      edtReqDate.text := paDatestr(dtTemp);
    end;
end;

function TfrmWTMaintSalesOrder.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTMaintSalesOrder.edtTempDateExit(Sender: TObject);
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

procedure TfrmWTMaintSalesOrder.btnReqdDateClick(Sender: TObject);
var
  tempDate: string;
  dtTemp: TDateTime;
begin
  if trim(edtReqDate.Text) = '' then
    begin
      dtTemp := date + 1;
      tempdate := padateStr(dtTemp);
    end
  else
    tempdate := edtReqDate.text;

  edtReqDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintSalesOrder.btnMatsReqDateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtMatsReqDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtMatsReqDate.text;

  edtMatsReqDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintSalesOrder.btnMatsRecDateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtMatsRecDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtMatsRecDate.text;

  edtMatsRecDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintSalesOrder.mnPrintQuoteClick(Sender: TObject);
var
  OldCursor : TCursor;
  iCol, iRow: integer;
  inx, key: integer;
  SOLine: TSOLine;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

//  inx := dbgLines.row;
  icol := dbgLines.col;
  irow := dbgLines.row;
  inx := strtoint(dbgLines.cells[0, iRow]);

  inx := SOrder.Lines.IndexOf(inx);
  SOLine := SOrder.Lines[inx];

  try
    frmWTRSQuote := TfrmWTRSQuote.Create( Application );
    Key := SOLine.Quote;
    frmWTRSQuote.bRetail := self.RetailCustomer;
    frmWTRSQuote.bSpeculative := SOrder.Speculative;
    frmWTRSQuote.memSelection.text := inttostr(Key);
    frmWTRSQuote.showmodal;
  finally
    frmWTRSQuote.free;
    Screen.Cursor := OldCursor;
  end;

end;

procedure TfrmWTMaintSalesOrder.lstvwDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
(*  sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(Sorder.dbKey) + '\';
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

procedure TfrmWTMaintSalesOrder.mnuOpenDocumentClick(Sender: TObject);
begin
  lstvwDocumentsDblClick(self);
end;

procedure TfrmWTMaintSalesOrder.pmnuDocumentsPopup(Sender: TObject);
begin
(*  if Mode = sopConvert then
    exit
  else
    begin
      pmnuDelete.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuOpen.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuSelectAll.Enabled := (lstvwDocuments.Items.count > 0);
    end;
*)
end;

procedure TfrmWTMaintSalesOrder.mnuDeleteDocumentClick(Sender: TObject);
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
      if (Mode <> sopConvert) and (Mode <> sopAdd) then
        begin
          sPath :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(SOrder.dbkey) + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;
*)
end;

procedure TfrmWTMaintSalesOrder.edtDepositReqdChange(Sender: TObject);
var
  rValue: real;
  rDeposit: real;
begin
  if (Sender as TCREditMoney).Text = '' then
    (Sender as TCREditMoney).Text := '0.00';
  if bChangeValue then
    begin
      rValue := StrToFloatDef((Sender as TCREditMoney).text, 0, FormatSettings);
      rDeposit := (rValue / (SOrder.TotalGoods + SOrder.TotalVat))*100;
      edtDepositTerms.text := formatfloat('0.00',rDeposit);
      SOrder.DepositTerms := rDeposit;
    end;
end;

procedure TfrmWTMaintSalesOrder.edtDepositReqdEnter(Sender: TObject);
begin
  bChangeValue := true;
end;

procedure TfrmWTMaintSalesOrder.edtDepositReqdExit(Sender: TObject);
begin
  bChangeValue := false;
end;

procedure TfrmWTMaintSalesOrder.edtDepositTermsChange(Sender: TObject);
var
  rDeposit: real;
begin
  if (Sender as TEdit).Text = '' then
    (Sender as TEdit).Text := '0.00';
  if bChangeRate then
    begin
      SOrder.DepositTerms := StrToFloatDef(edtDepositTerms.text, 0, FormatSettings);
      rDeposit := (SOrder.TotalGoods + Sorder.TotalVat) * (SOrder.DepositTerms/100);
      edtDepositReqd.text := formatfloat('0.00',rDeposit);
    end;
end;

procedure TfrmWTMaintSalesOrder.edtDepositTermsEnter(Sender: TObject);
begin
  bChangeRate := true;

end;

procedure TfrmWTMaintSalesOrder.edtDepositTermsExit(Sender: TObject);
begin
  bChangeRate := false;
end;

procedure TfrmWTMaintSalesOrder.mnAddQuoteClick(Sender: TObject);
begin
  CallMaintQuoteScreen(solAdd);
end;

procedure TfrmWTMaintSalesOrder.mnCopyQuoteClick(Sender: TObject);
begin
  CallMaintQuoteScreen(solCopy);
end;

procedure TfrmWTMaintSalesOrder.btnAttachClick(Sender: TObject);
var
  I: Integer;
  SourceFileName, DestFileName, DocDir: string;
begin
  {Find a document}
  DocDir := GetFilesPath;

  CopyDocuments(DocOpenDialog, DocDir,
    procedure
    begin
      ShowDocuments(Sorder.dbKey);
    end);
end;

procedure TfrmWTMaintSalesOrder.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  WTMaintEmailFrm := TWTMaintEmailFrm.create(self);
  try
    WTMaintEmailFrm.Supplier := 0;
    WTMaintEmailFrm.SupplierBranch := 0;
    WTMaintEmailFrm.SupplierContact := 0;
    WTMaintEmailFrm.AddressType := 0;
    WTMaintEmailFrm.Customer := SOrder.Customer;
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

procedure TfrmWTMaintSalesOrder.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docdir, compdir, docExt: string;
begin
  docDir := dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(Sorder.dbKey);
  compDir := dtmdlWorktops.GetCompanySalesDirectory;

  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try

  finally
    IniFile.Free;
  end;

  sBody := '';
  sfilePath := docdir;
  okToSave := false;

  EmailAndSaveViaOutlook(sTo, sSubject, sBody, sFilePath, okToSave, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

  if okToSave then
    begin
       ShowDocuments(Sorder.dbKey);
    end;
end;

procedure TfrmWTMaintSalesOrder.btnWordClick(Sender: TObject);
var
  compdir, docdir, jobBagDir, docExt, sPAth: string;
  sFullFile, sFileName: string;
  iLength, ipos, i: integer;
  okToSave, userCancelled, docsaved: boolean;
begin
//  docDir := dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(Sorder.dbKey);
  compDir := dtmdlWorktops.GetCompanySalesDirectory;

  if stvDocuments.TopItem.Text = stvDocuments.Selected.Text then
    docDir := compDir + '\' + inttostr(SOrder.dbKey) +'\'
  else
    docDir := compDir + '\' + inttostr(SOrder.dbKey) +'\' + stvDocuments.Selected.Text +'\';

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
          MessageDlg('You can''t save a document outside the Sales Document Directory',
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

      ShowDocuments(Sorder.dbKey);

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

procedure TfrmWTMaintSalesOrder.rdgrpDateTypeClick(Sender: TObject);
begin
  if rdgrpDateType.itemindex = 2 then
    begin
      edttempDate.Clear;
      edtReqDate.clear;
    end;
  grpDates.enabled := (rdgrpDateType.itemindex <> 2);
end;

procedure TfrmWTMaintSalesOrder.edtDescriptionChange(Sender: TObject);
begin
   SOrder.Description := edtDescription.text;
   CheckOK(self);
end;

procedure TfrmWTMaintSalesOrder.FormResize(Sender: TObject);
begin
  self.edtApplianceDetails.width := trunc((self.tbDocuments.width/4));
  self.memNotes.width := trunc((self.tbDocuments.width/4));
//  self.lstvwDocuments.width := trunc((self.tbDocuments.width/4));
  lblNotes.left := memNotes.Left;
  lblApplianceDetails.left := edtApplianceDetails.Left;
end;

function TfrmWTMaintSalesOrder.GetFilesPath: string;
var
  DocDir: string;
begin
  DocDir := dtmdlWorktops.GetCompanySalesDirectory;
  DocDir := IncludeTrailingPathDelimiter(DocDir) + IntToStr(SOrder.dbKey);

  if stvDocuments.TopItem.Text <> stvDocuments.Selected.Text then
    DocDir := IncludeTrailingPathDelimiter(DocDir) + stvDocuments.Selected.Text;

  Result := DocDir;
end;

procedure TfrmWTMaintSalesOrder.mnPropertiesClick(Sender: TObject);
begin
  CallMaintPropertyScreen(solChange);
end;

procedure TfrmWTMaintSalesOrder.mnRequoteClick(Sender: TObject);
begin
  CallMaintQuoteScreen(solRequote);
end;

procedure TfrmWTMaintSalesOrder.tbLinkedQuotesShow(Sender: TObject);
begin
  ShowLinkedQuotes;
end;

procedure TfrmWTMaintSalesOrder.SetFittingInSchedule(
  const Value: bytebool);
begin
  FFittingInSchedule := Value;
end;

procedure TfrmWTMaintSalesOrder.SetTemplateInSchedule(
  const Value: bytebool);
begin
  FTemplateInSchedule := Value;
end;

procedure TfrmWTMaintSalesOrder.btnContactClearClick(Sender: TObject);
begin
  dblkpFitter.keyvalue := 0;
end;

procedure TfrmWTMaintSalesOrder.SpeedButton1Click(Sender: TObject);
begin
  dblkpTemplater.keyvalue := 0;
end;

procedure TfrmWTMaintSalesOrder.btnFitterClick(Sender: TObject);
begin
  frmWTLUFitters := TfrmWTLUFitters.create(self);
  try
    frmWTLUFitters.showmodal;
  finally
    frmWTLUFitters.free;
  end;

  with SOrder.DataModule do
    begin
      qryFitter.close;
      qryFitter.open;
    end;

    with SOrder.DataModule do
    begin
      qryTemplater.close;
      qryTemplater.open;
    end;
end;

procedure TfrmWTMaintSalesOrder.ShowEvents;
begin
  ClearGrid(sgEvents);  {Clear contents of Line grid}
  BuildEventGrid;
  sgEventsClick(self);
end;

procedure TfrmWTMaintSalesOrder.BuildEventGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgEvents, SOrder.datamodule do
    begin
      for i := 0 to pred(SOrder.Events.count) do
        begin
        cells[0,i+1] := inttostr(SOrder.Events[i].EventNumber);
        cells[1,i+1] := paDateStr(SOrder.Events[i].DateEntered);
        cells[2,i+1] := SOrder.Events[i].OperatorName;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeEvents.enabled := not (SOrder.Events.count = 0);
  btnDeleteEvents.enabled := not (SOrder.Events.count = 0);
end;

procedure TfrmWTMaintSalesOrder.sgEventsDblClick(Sender: TObject);
begin
  btnChangeEventsClick(self);
end;

procedure TfrmWTMaintSalesOrder.btnAddEventsClick(Sender: TObject);
begin
  CallMaintEvent(soevAdd);
end;

procedure TfrmWTMaintSalesOrder.btnChangeEventsClick(Sender: TObject);
begin
  CallMaintEvent(soevChange);

end;

procedure TfrmWTMaintSalesOrder.btnDeleteEventsClick(Sender: TObject);
begin
  CallMaintEvent(soevDelete);
end;

procedure TfrmWTMaintSalesOrder.sgEventsClick(Sender: TObject);
var
  SOEvent: TSOEvent;
  inx: integer;
begin
  inx := sgEvents.row;
  memEventNotes.Lines.Clear;

  if Assigned(SOrder.Events) then
  begin
    inx := SOrder.Events.IndexOf(inx);
    if inx >= 0 then
    begin
      SOEvent := SOrder.Events[inx];
      memEventNotes.Text := SOEvent.Narrative.DataInfo;
    end;
  end;
end;

procedure TfrmWTMaintSalesOrder.edtProjectChange(Sender: TObject);
begin
   SOrder.ProjectReference := edtProject.text;
end;

procedure TfrmWTMaintSalesOrder.CallPOReceiptsScreen(aMode : TpopMode);
var
  Key : integer;
  frm : TfrmWTMaintPurchaseOrderReceipts;
  aPOrder : TPOrder;
  bOK: boolean;
//  sWarning: string;
begin
  dtmdlPurchases := TdtmdlPurchaseOrder.create(Application);

  Key := dbgPurchases.DataSource.DataSet.fieldbyname('Purchase_Order').asinteger;

  if (dbgPurchases.DataSource.DataSet.FieldByName('purchase_order_status').asinteger >= 40) AND
    (dbgPurchases.DataSource.DataSet.FieldByName('purchase_order_status').asinteger <= 50)  then
        begin
          if MessageDlg('This order is '+ dbgPurchases.DataSource.DataSet.FieldByName('Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end;
  try
    aPOrder := TPOrder.Create(dtmdlPurchases);
    try
      aPOrder.DbKey := key;
      aPOrder.LoadFromDB;
      Frm := TfrmWTMaintPurchaseOrderReceipts.Create(Self);
      try
        Frm.POrder := aPOrder;
        Frm.ShowModal;
        bOK := Frm.bOK;
        Key := aPOrder.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aPOrder.Free;
    end;
  finally
    if bOK then
    begin
      dbgPurchases.DataSource.DataSet.Close;
      dbgPurchases.DataSource.DataSet.Open;
      dbgPurchases.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;
      with dbgPurchases do
        begin
          try
            if datasource.dataset.recordcount > 0 then
              SelectedRows.CurrentRowSelected := true ;
          except
          end;
        end;
    end;
  end;
end;

procedure TfrmWTMaintSalesOrder.CallPOMaintScreen(aMode : TpopMode);
var
  Key : integer;
  frm : TfrmWtMaintPurchaseOrder;
  aPOrder : TPOrder;
  bOK: boolean;
begin
  dtmdlPurchases := TdtmdlPurchaseOrder.create(Application);

  try
    if (aMode = popAdd) or (aMode = popRaise) then
      Key := 0
    else
      Key := dbgPurchases.DataSource.DataSet.fieldbyname('Purchase_Order').asinteger;

    try
      aPOrder := TPOrder.Create(dtmdlPurchases);
      try
        aPOrder.DbKey := key;

        aPOrder.DataModule.SalesOrder := SOrder.dbkey;
        aPOrder.LoadFromDB;

        bOK := false;
        Frm := TfrmWtMaintPurchaseOrder.Create(Self);
        try
          Frm.Mode := aMode;
          if aMode = popAdd then
            aPOrder.Reference := inttostr(SOrder.dbkey);

          Frm.POrder := aPOrder;

          Frm.ShowModal;
          bOK := frm.bOK;
          Key := aPOrder.DbKey;
        finally
          Frm.Free;
        end;
      finally
        aPOrder.Free;
      end;
    finally
      if bOK then
      begin
        ShowPurchaseOrders;
        dbgPurchases.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;

        with dbgPurchases do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
    end;
  finally
      dtmdlPurchases.free;
  end;
end;

procedure TfrmWTMaintSalesOrder.btnPORaiseClick(Sender: TObject);
begin
  CallPOMaintScreen(popRaise);
end;

procedure TfrmWTMaintSalesOrder.btnPOChangeClick(Sender: TObject);
begin
  CallPOMaintScreen(popChange);
end;

procedure TfrmWTMaintSalesOrder.ShowPurchaseOrders;
var
  aLine : TSOPurchase;
  iCount: integer;
begin
  SOrder.LoadPurchaseOrders;

(*  with SOrder.Datamodule.qrySOPurchases do
    begin
      close;
      parambyname('Sales_Order').asinteger := SOrder.dbKey;
      if chkbxShowInactive.checked then
        parambyname('inactive').asstring := 'Y'
      else
        parambyname('inactive').asstring := 'N';
      open;

      iCount := 1;
      while not(EOF) do
      begin
        aLine := TSOPurchase.Create(SOrder);
        aLine.DateRaised := FieldByName('Date_Raised').Asdatetime;
        aLine.DateREquired := FieldByName('Date_Required'). asdatetime;
        aLine.GRNNumber := FieldByName('GRN_Number').asstring;
        aLine.inactive := (FieldByName('inactive').asstring = 'Y');
        aLine.LineDescription := FieldByName('PO_Line_Description').asstring;
        aLine.OfficeContact := FieldByName('Office_Contact').asinteger;
        aLine.OfficeContactName := FieldByName('Office_Contact_Name').asstring;
        aLine.Operator := FieldByName('Operator').asinteger;
        aLine.OperatorName := FieldByName('Operator_Name').asstring;
        aLine.OnHold := (FieldByName('On_Hold').asstring = 'Y');
        aLine.PONumber := FieldByName('Purchase_Order').asinteger;
        aLine.POLineNumber := FieldByName('Line_No').asinteger;
        aLine.POLNumber := iCount;
        aLine.Quantity := FieldByName('Quantity').asinteger;
        aLine.SlabDescription := fieldbyname('Slab_Description').asstring;
        aLine.SlabDepth := fieldbyname('Slab_Depth').asinteger;
        aLine.SlabLength := fieldbyname('Slab_Length').asinteger;
        aLine.Status := fieldbyname('Purchase_Order_Status').asinteger;
        aLine.StatusDescription := fieldbyname('Status_Description').asstring;
        aLine.Supplier := FieldByName('Supplier').asinteger;
        aLine.SupplierName := FieldByName('Supplier_Name').asstring;
        aLine.SupplierContact := FieldByName('Supplier').asinteger;
        aLine.SupplierContactName := FieldByName('Contact_Name').asstring;
        aLine.UnitCost := FieldByName('Unit_Cost').asfloat;
        SOrder.Purchases.Add(aLine);

        iCount := iCount + 1;

        Next;
      end;
*)
      btnPOChange.Enabled := SOrder.Datamodule.qrySOPurchases.RecordCount > 0;
      btnPORemove.Enabled := SOrder.Datamodule.qrySOPurchases.RecordCount > 0;
      btnPODelete.Enabled := SOrder.Datamodule.qrySOPurchases.RecordCount > 0;
      btnPOPrint.Enabled := SOrder.Datamodule.qrySOPurchases.RecordCount > 0;
//    end;
(*
  if (Mode = sopAdd) then
    begin
      ClearGrid(dbgPurchases);  {Clear contents of Line grid}
      BuildPurchaseOrderGrid;
    end
  else
    begin
      BuildPurchaseOrderGrid;
    end;
*)
end;

procedure TfrmWTMaintSalesOrder.mnRaisePOClick(Sender: TObject);
var
  iSupplier: integer;
  iCol, iRow, inx, key: integer;
  SOLine: TSOLine;
  aPOrder : TPOrder;
  bOK: boolean;
  frm : TfrmWtMaintPurchaseOrder;
begin
  icol := dbgLines.col;
  irow := dbgLines.row;

  try
    inx := strtoint(dbgLines.cells[0, iRow]);
  except
    inx := 1
  end;

  inx := SOrder.Lines.IndexOf(inx);
  SOLine := SOrder.Lines[inx];
  Key := SOLine.Quote;

  {Check if purchase order raised for this line}
  if SOLine.PONumber <> 0 then
    begin
      if messagedlg('A purchase order has already been raised for this item. Do you want to abort?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        exit;
    end;

  {If there are more than one slab suppliers, then need to do differently}
  iSupplier := SOrder.DataModule.GetQuoteSlabSupplierCount(Key);
  if iSupplier = 0 then
    begin
      {If multiple suppliers then auto generate}
      if messagedlg('Slab requirements are for multiple suppliers. Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          frmWTMaintSalesOrderRaisePO := TfrmWTMaintSalesOrderRaisePO.create(self);
          try
            frmWTMaintSalesOrderRaisePO.SOLine := SOLine;
            frmWTMaintSalesOrderRaisePO.showmodal;
          finally
            frmWTMaintSalesOrderRaisePO.free;
          end;
          messagedlg('Purchase orders have been created for the different suppliers.', mtInformation, [mbOk], 0);
        end
      else
        exit;
    end
  else
    begin
      {If single supplier then display PO screen}
      dtmdlPurchases := TdtmdlPurchaseOrder.create(Application);

      aPOrder := TPorder.Create(dtmdlPurchases);
      try
        dtmdlPurchases.Quote := key;
        dtmdlPurchases.Supplier := iSupplier;
        dtmdlPurchases.SalesOrder := SOrder.dbkey;
        dtmdlPurchases.SalesOrderLineNo := SOLine.SOLNumber;
        aPorder.LoadFromQuoteSlabs;

        if aPOrder.Supplier = 0 then
          aPorder.LoadFromQuote;

        Frm := TfrmWtMaintPurchaseOrder.Create(Self);
        try
          Frm.Mode := popRaise;
          Frm.POrder := aPOrder;
          Frm.ShowModal;
          if frm.bOK then
            self.ShowPurchaseOrders;
        finally
          Frm.Free;
        end;
      finally
        aPOrder.Free;
      end;
    end;
end;

procedure TfrmWTMaintSalesOrder.dbgPurchasesDblClick(Sender: TObject);
begin
  if dbgPurchases.datasource.DataSet.fieldbyname('Purchase_Order').asstring <> '' then
    btnPOChangeClick(self);
end;

procedure TfrmWTMaintSalesOrder.btnPOPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSPOrder := TfrmWTRSPOrder.Create( Application );
    Key := dbgPurchases.DataSource.DataSet.fieldbyname('Purchase_Order').asinteger;
    frmWTRSPOrder.memSelection.text := inttostr(Key);
    frmWTRSPOrder.showmodal;
  finally
    frmWTRSPOrder.free;
    dbgPurchases.DataSource.DataSet.Close;
    dbgPurchases.DataSource.DataSet.Open;
    dbgPurchases.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;
    with dbgPurchases do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
    Screen.Cursor := OldCursor;
  end;
  dbgPurchases.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;
end;

procedure TfrmWTMaintSalesOrder.btnPORemoveClick(Sender: TObject);
begin
  if messagedlg('Remove this purchase order from this sales order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with SOrder.DataModule.qryRemovePO do
        begin
          close;
          parambyname('Sales_Order').asinteger := SOrder.dbkey;
          parambyname('Purchase_Order').asinteger := dbgPurchases.datasource.dataset.fieldbyname('Purchase_Order').asinteger;
          parambyname('Line_no').asinteger := dbgPurchases.datasource.dataset.fieldbyname('Line_no').asinteger;
          execsql;
        end;

      {Refrtesh the purchase orders}
      ShowPurchaseOrders;
    end;
end;

procedure TfrmWTMaintSalesOrder.btnPODeleteClick(Sender: TObject);
begin
  if messagedlg('Delete this purchase order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with SOrder.DataModule.qryDeletePO do
        begin
          close;
          parambyname('Purchase_Order').asinteger := dbgPurchases.datasource.dataset.fieldbyname('Purchase_Order').asinteger;
          execsql;
        end;

      {Refrtesh the purchase orders}
      ShowPurchaseOrders;
    end;

end;

procedure TfrmWTMaintSalesOrder.chkbxShowInactiveClick(Sender: TObject);
begin
  ShowPurchaseOrders;
end;

procedure TfrmWTMaintSalesOrder.SetCanUpdateSchedule(
  const Value: bytebool);
begin
  FCanUpdateSchedule := Value;
end;

procedure TfrmWTMaintSalesOrder.chkbxTemplateInScheduleClick(
  Sender: TObject);
begin
  templateInSchedule := (Sender as TCheckbox).Checked;
end;

procedure TfrmWTMaintSalesOrder.chkbxFittingInScheduleClick(
  Sender: TObject);
begin
  FittingInSchedule := (Sender as TCheckbox).Checked;
end;

procedure TfrmWTMaintSalesOrder.edtApplianceDetailsChange(Sender: TObject);
begin
   SOrder.ApplianceDetails := edtApplianceDetails.text;
end;

procedure TfrmWTMaintSalesOrder.pmnPurchasesPopup(Sender: TObject);
begin
  mnuPOChange.enabled := btnPOChange.Enabled;
  mnuPORemove.enabled := btnPORemove.Enabled;
  mnuPODelete.enabled := btnPODelete.Enabled;
  mnuPOPrint.enabled := btnPOPrint.Enabled;
  mnuPOReceive.enabled := btnPOPrint.Enabled;

end;

procedure TfrmWTMaintSalesOrder.mnuPOReceiveClick(Sender: TObject);
begin
  CallPOReceiptsScreen(popChange);
end;

procedure TfrmWTMaintSalesOrder.lstvwDocumentsColumnClick(Sender: TObject;
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

procedure TfrmWTMaintSalesOrder.lstvwDocumentsCompare(Sender: TObject;
  Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else
  if SortedColumn <> 0 then
    Compare := CompareText(Item1.SubItems[SortedColumn-1], Item2.SubItems[SortedColumn-1]);

  if Descending then
    Compare := -Compare;

end;

procedure TfrmWTMaintSalesOrder.pmnuPasteClick(Sender: TObject);
var
  DocDir: string;
begin
  DocDir := dtmdlWorktops.GetCompanySalesDirectory;
  DocDir := IncludeTrailingPathDelimiter(DocDir) + inttostr(SOrder.dbKey);

  {Find a document}
  CopyDocumentsFromClipboard(DocDir,
    procedure
    begin
      ShowDocuments(Sorder.dbKey);
    end);
end;

procedure TfrmWTMaintSalesOrder.pmnuDeleteClick(Sender: TObject);
(*var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
*)
begin
(*  iRow := lstvwDocuments.ItemIndex;
  if iRow = -1 then exit;
  if messagedlg('Delete the selected document?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ListItem := lstvwDocuments.items[irow];
      sFileName := ListItem.caption;

      lstvwDocuments.Items.Delete(iRow);

      //Delete the actual file only if not Converting or adding as we don't know the directory name
      if (Mode <> sopAdd) then
        begin
          sPath :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(SOrder.dbKey) + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;
*)
end;

procedure TfrmWTMaintSalesOrder.pmnuSelectAllClick(Sender: TObject);
(*var
  icount: integer;
*)
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

procedure TfrmWTMaintSalesOrder.chkbxonHoldClick(Sender: TObject);
begin
  rdgrpDateType.Enabled := not (Sender as TCheckbox).checked;
  grpDates.Enabled := not (Sender as TCheckbox).checked;
end;

procedure TfrmWTMaintSalesOrder.Button5Click(Sender: TObject);
var
  docDir: string;
begin
  docDir := dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(Sorder.dbKey);

  opndlgPlans.Files.Clear;
  opndlgPlans.InitialDir := docdir;
  opndlgPlans.FileName := edtPlansDocument.Text;
  if opndlgPlans.Execute then
    begin
      if opndlgPlans.Files.Count > 0 then
      begin
        edtPlansDocument.Text := opndlgPlans.Files[opndlgPlans.Files.Count - 1];
      end;
    end;
end;

procedure TfrmWTMaintSalesOrder.edtPlansDocumentChange(Sender: TObject);
begin
  SOrder.LocationPlanDocument := (Sender as TEdit).text;
end;

procedure TfrmWTMaintSalesOrder.edtPlansDocumentDblClick(Sender: TObject);
var
  sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
  sDoc := (Sender as TEdit).text;
  Params := '' ;
  StrPCopy(FiName, sDoc) ;

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

procedure TfrmWTMaintSalesOrder.ShowRemedials;
begin
  dbgRemedials.DataSource := SOrder.Datamodule.dtsRemedials;
  with SOrder.Datamodule.qryRemedials do
    begin
      close;
      parambyname('Sales_Order').asinteger := SOrder.dbKey;
      open;

      btnRemedialChange.enabled := not (recordcount = 0) and (Mode <> sopCopy);
      btnRemedialDelete.enabled := not (recordcount = 0) and (Mode <> sopCopy);
      btnRemedialPrint.enabled := not (recordcount = 0) and (Mode <> sopCopy);
      btnRemedialOrder.enabled := not (recordcount = 0) and (Mode <> sopCopy);
    end;
end;

procedure TfrmWTMaintSalesOrder.ShowJobs;
begin
  dbgJobs.DataSource := SOrder.Datamodule.dtsJobs;
  with SOrder.Datamodule.qryJobs do
    begin
      close;
      parambyname('Sales_Order').asinteger := SOrder.dbKey;
      open;

      btnJobChange.enabled := not (recordcount = 0) and (Mode <> sopCopy);
      btnJobDelete.enabled := not (recordcount = 0) and (Mode <> sopCopy);
      btnJobPrint.enabled := not (recordcount = 0) and (Mode <> sopCopy);
      btnJobSheet.enabled := not (recordcount = 0) and (Mode <> sopCopy);
      btnJobFitting.enabled := not (recordcount = 0) and (Mode <> sopCopy);
      btnJobComplete.enabled := not (recordcount = 0) and (Mode <> sopCopy);
    end;
end;

procedure TfrmWTMaintSalesOrder.ShowSalesInvoices;
var
  rTotalSI: real;
begin
  dbgSalesInvoices.DataSource := SOrder.Datamodule.dtsSalesInvoices;
  with SOrder.Datamodule.qrySalesInvoices do
    begin
      close;
      parambyname('Sales_Order').asinteger := SOrder.dbKey;
      open;

      btnViewSI.enabled := not (recordcount = 0) and (Mode <> sopCopy);
      btnRePrintSI.enabled := not (recordcount = 0) and (Mode <> sopCopy);
    end;

//  rTotalSI := SOrder.DataModule.GetJobBagTotalSalesInvoiced(SOrder.dbKey);
  rTotalSI := 0.00;
  memTotalSI.text := formatfloat('?#,###,##0.00',rTotalSI);
end;

procedure TfrmWTMaintSalesOrder.dbgSalesInvoicesDblClick(Sender: TObject);
begin
  if btnViewSI.Enabled then
    btnViewSIClick(self);
end;

procedure TfrmWTMaintSalesOrder.dbgSalesInvoicesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  sValue: string;
begin
  if(dbgSalesInvoices.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if (dbgSalesInvoices.datasource.dataset.fieldbyname('Invoice_or_credit').asstring = 'C') then
  begin
    (Sender as TDBGrid).Canvas.font.Color := clRed;
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.Color := clMenuHighlight;
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
                 Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,Column.field.asstring);
                 (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
               end;
      		END;
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Goods') or
          (Column.Title.Caption = 'Total') or
          (Column.Title.Caption = 'Vat') then
        begin
          TNumericField(Column.Field).DisplayFormat := '£#,###,##0.00';
        end;

       Column.Alignment := taRightJustify;
     end;
end;

procedure TfrmWTMaintSalesOrder.btnViewSIClick(Sender: TObject);
var
  Key : integer;
  frm : TfrmWTMaintSalesInvoice;
  aInvoice : TSalesInvoice;
  dtmdlSOSInvoices: TdtmdlSalesInvoice;
begin
  Key := dbgSalesInvoices.DataSource.DataSet.fieldbyname('Sales_Invoice').asinteger;
  if MessageDlg('You only have access to view the selected invoice, continue?', mtConfirmation,
    [mbOk,mbCancel], 0) = mrCancel then exit;

  dtmdlSOSInvoices := TdtmdlSalesInvoice.create(self);
  try
    aInvoice := TSalesInvoice.Create(dtmdlSOSInvoices);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TfrmWTMaintSalesInvoice.Create(Self);
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
  end;
end;

procedure TfrmWTMaintSalesOrder.btnRePrintSIClick(Sender: TObject);
var
  icount: integer;
  key: integer;
  SINumber: integer;
  frm : TfrmWTRSSalesInvoiceReprint;
begin
  SINumber := dbgSalesInvoices.Datasource.Dataset.FieldByName('Invoice_no').AsInteger;
  Key := dbgSalesInvoices.Datasource.Dataset.FieldByName('sales_invoice').AsInteger;
  try
    Frm := TfrmWTRSSalesInvoiceReprint.Create(Self);
    try
      Frm.icode := Key;
      Frm.memSelection.text := inttostr(SINumber);

      Frm.InvoicePrint := true;
      Frm.ShowModal;
    finally
      Frm.Free;
    end;
  finally
  end;
end;

procedure TfrmWTMaintSalesOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  if Mode = sopView then exit;

  TempWord := MessageDlg('Do you want to save these order details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    btnOKClick(self);
end;

procedure TfrmWTMaintSalesOrder.CopyOriginalSalesOrderDocuments;
var
  sSource, sDest: string;
  ListItem: TListItem;
  irow: integer;
  icount: Integer;
begin
  sSource := dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(self.OriginalSalesOrderFromCopy) + '\' ;
  sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(SOrder.dbkey) + '\' ;

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

procedure TfrmWTMaintSalesOrder.SetOriginalSalesOrderFromCopy(
  const Value: integer);
begin
  FOriginalSalesOrderFromCopy := Value;
end;

procedure TfrmWTMaintSalesOrder.stvDocumentsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Shift = [ssLeft] then
    (Sender as TShellListView).BeginDrag(false, 5);
end;

procedure TfrmWTMaintSalesOrder.stvDocumentsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TShellListView;
end;

procedure TfrmWTMaintSalesOrder.stvDocumentsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
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

procedure TfrmWTMaintSalesOrder.tbDocumentsShow(Sender: TObject);
begin
  if stvDocuments.Visible and (Mode <> sopCopy) then
    stvDocuments.SetFocus;
end;

procedure TfrmWTMaintSalesOrder.rdgrpJobTypeClick(Sender: TObject);
begin
  if (Sender as TRadioGroup).itemindex > 0 then
    begin
      edtTempDate.Enabled := false;
      btnTempDate.enabled := false;
      edtTempDate.Text := '';
      edtReqDate.Text := padatestr(SOrder.DateRequired);
    end
  else
    begin
      edtTempDate.Enabled := true;
      btnTempDate.enabled := true;
      edtTempDate.Text := padatestr(SOrder.TemplateDate);
      edtReqDate.Text := padatestr(SOrder.DateRequired);
    end;

  {if set to TBC then clear the dates}
  if rdgrpDateType.ItemIndex = 2 then
    begin
      edtTempDate.Text := '';
      edtReqDate.Text := '';
    end;
end;

procedure TfrmWTMaintSalesOrder.edtInstallationNameChange(Sender: TObject);
begin
  UpdateInstallationAddress;
  CheckOK(self);
end;

procedure TfrmWTMaintSalesOrder.UpdateInstallationAddress;
begin
  if FActivated then
    begin
      memInstallAddress.lines.clear;
      if edtInstallationName.text <> '' then
        memInstallAddress.Lines.Add(edtInstallationName.text);
      if edtInstallationStreet.text <> '' then
        memInstallAddress.Lines.Add(edtInstallationStreet.text);
      if edtInstallationLocale.text <> '' then
        memInstallAddress.Lines.Add(edtInstallationLocale.text);
      if edtInstallationTown.text <> '' then
        memInstallAddress.Lines.Add(edtInstallationTown.text);
      if edtInstallationPostcode.text <> '' then
        memInstallAddress.Lines.Add(edtInstallationPostcode.text);
      if edtInstallationCounty.text <> '' then
        memInstallAddress.Lines.Add(edtInstallationCounty.text);
    end;
end;

procedure TfrmWTMaintSalesOrder.ParseInstallationAddress(installAddress: TMemo);
var
  iCount: integer;
begin
  for iCount := 0 to pred(installaddress.Lines.count) do
    begin
      if installaddress.Lines[iCount] = '' then break;

      if icount = 0 then
        edtInstallationName.text := installaddress.Lines[iCount]
      else
      if icount = 1 then
        edtInstallationStreet.text := installaddress.Lines[iCount]
      else
      if icount = 2 then
        edtInstallationLocale.text := installaddress.Lines[iCount]
      else
      if icount = 3 then
        edtInstallationTown.text := installaddress.Lines[iCount]
      else
      if icount = 4 then
        edtInstallationPostcode.text := installaddress.Lines[iCount]
      else
        edtInstallationCounty.text := installaddress.Lines[iCount];
    end;
(*    memInstallAddress.Lines.Add(edtInstallationName.text);
    memInstallAddress.Lines.Add(edtInstallationStreet.text);
  if edtInstallationLocale.text <> '' then
    memInstallAddress.Lines.Add(edtInstallationLocale.text);
  if edtInstallationTown.text <> '' then
    memInstallAddress.Lines.Add(edtInstallationTown.text);
  if edtInstallationPostcode.text <> '' then
    memInstallAddress.Lines.Add(edtInstallationPostcode.text);
  if edtInstallationCounty.text <> '' then
    memInstallAddress.Lines.Add(edtInstallationCounty.text);
*)
end;

procedure TfrmWTMaintSalesOrder.btnJobAddClick(Sender: TObject);
begin
  CallJobMaintScreen(jAdd);
end;

procedure TfrmWTMaintSalesOrder.CallJobMaintScreen(aMode : TjMode);
var
  Key, iFirstKey : integer;
  frm : TfrmWtMaintJob;
  aJob : TJob;
  bOK: boolean;
begin
  if aMode = jAdd then
    Key := 0
  else
  if aMode = jChange then
    begin
      if dbgJobs.DataSource.DataSet.FieldByName('Job_status').asinteger >= 50 then
        begin
          if MessageDlg('This job is '+ dbgJobs.DataSource.DataSet.FieldByName('Job_Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
          aMode := jRestrict;
        end
      else
      if dbgJobs.DataSource.DataSet.FieldByName('Job_status').asinteger > 10 then
        begin
          if MessageDlg('This job is '+ dbgJobs.DataSource.DataSet.FieldByName('Job_Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end;
      Key := dbgJobs.DataSource.DataSet.FieldByName('Job').asinteger;
    end
  else
    Key := dbgJobs.DataSource.DataSet.FieldByName('Job').asinteger;

  try
    aJob := TJob.Create(dtmdlAllJobs);
    try
      aJob.DbKey := key;
      aJob.jMode := aMode;
      aJob.LoadFromDB;
      Frm := TfrmwtMaintJob.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.Job := aJob;
        Frm.ShowModal;
        bOK := Frm.bOK;
        Key := aJob.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aJob.Free;
    end;
  finally
    if bOK then
    begin
      dbgJobs.DataSource.DataSet.Close;
      dbgJobs.DataSource.DataSet.Open;
      iFirstKey := dbgJobs.DataSource.DataSet.fieldbyname('Job').asinteger;

      while (dbgJobs.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) <> true) and (key < iFirstKey) do
        begin
          inc(key);
        end;
    end;
  end;
end;

procedure TfrmWTMaintSalesOrder.btnJobChangeClick(Sender: TObject);
begin
  CallJobMaintScreen(jChange);
end;

procedure TfrmWTMaintSalesOrder.btnJobDeleteClick(Sender: TObject);
begin
  CallJobMaintScreen(jDelete);
end;

procedure TfrmWTMaintSalesOrder.btnJobPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key, SOkey: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtRSJobSheet := TfrmWtRSJobSheet.Create( Application );
  try
    Key := dbgJobs.DataSource.DataSet.FieldByName('Job').asinteger;
    SOKey := dbgJobs.datasource.DataSet.FieldByName('Sales_Order').asinteger;
    frmWtRSJobSheet.PrintType := 'J';
    frmWtRSJobSheet.memSelection.text := inttostr(Key);
    frmWtRSJobSheet.sJobNumber := inttostr(Key);
    frmWtRSJobSheet.sOrderNumber := inttostr(SOKey);
    frmWtRSJobSheet.showmodal;
  finally
    frmWtRSJobSheet.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmWTMaintSalesOrder.btnJobSheetClick(Sender: TObject);
var
  OldCursor : TCursor;
  key, SOkey: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtRSJobSheet := TfrmWtRSJobSheet.Create( Application );
  try
    Key := dbgJobs.datasource.DataSet.FieldByName('Job').asinteger;
    SOKey := dbgJobs.datasource.DataSet.FieldByName('Sales_Order').asinteger;
    frmWtRSJobSheet.memSelection.text := inttostr(Key);
    frmWtRSJobSheet.sJobNumber := inttostr(Key);
    frmWtRSJobSheet.sOrderNumber := inttostr(SOKey);
    frmWtRSJobSheet.showmodal;
  finally
    frmWtRSJobSheet.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmWTMaintSalesOrder.btnJobFittingClick(Sender: TObject);
var
  OldCursor : TCursor;
  key, SOKey: integer;
begin
  OldCursor := Screen.Cursor;

  Key := dbgJobs.datasource.DataSet.FieldByName('Job').asinteger;
  SOKey := dbgJobs.datasource.DataSet.FieldByName('Sales_Order').asinteger;

  {OK, let's check that we are able to print Fitting sheet}
  if dtmdlWorktops.CheckBalancePaid then
    begin
      if (dbgJobs.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'Y') AND (dtmdlAllJobs.SOOutstandingBalance(key) > 0) then
        begin
          messagedlg('There is still a balance outstanding for this job. Ensure full payment has been received before fitting.', mtInformation,
                      [mbOk], 0);
          exit;
        end
      else
      if  (dbgJobs.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'N') AND
          (dbgJobs.DataSource.DataSet.fieldbyname('Credit_Status').asstring = 'L')  AND
          (dbgJobs.DataSource.DataSet.fieldbyname('Credit_Limit').asfloat = 0) AND
          (dtmdlAllJobs.SOOutstandingBalance(key) > 0) then
        begin
          messagedlg('There is still a balance outstanding for this job. Ensure full payment has been received before fitting.', mtInformation,
                      [mbOk], 0);
          exit;
        end;
    end;

  Screen.Cursor := crHourglass;
  frmWtRSJobSheet := TfrmWtRSJobSheet.Create( Application );
  try
    frmWTRSJobSheet.bRetail := (dbgJobs.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'Y');
    frmWtRSJobSheet.PrintType := 'F';
    frmWtRSJobSheet.memSelection.text := inttostr(Key);
    frmWtRSJobSheet.sJobNumber := inttostr(Key);
    frmWtRSJobSheet.sOrderNumber := inttostr(SOKey);
    frmWtRSJobSheet.showmodal;
    dtmdlAllJobs.SetSOrderStatus(Key);
  finally
    frmWtRSJobSheet.free;
    Screen.Cursor := OldCursor;
  end;

  dbgJobs.DataSource.DataSet.Close;
  dbgJobs.DataSource.DataSet.Open;
  dbgJobs.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) ;
end;

procedure TfrmWTMaintSalesOrder.btnJobCompleteClick(Sender: TObject);
var
  Key, iFirstKey : integer;
  frm : TfrmWtMaintJobComplete;
  aJob : TJob;
begin
  if dbgJobs.DataSource.DataSet.FieldByName('Job_status').asinteger >= 50 then
    begin
      MessageDlg('This job is already complete.', mtError,
        [mbAbort], 0);
      exit;
    end;

  Key := dbgJobs.DataSource.DataSet.fieldbyname('Job').asinteger;

  try
    aJob := TJob.Create(dtmdlAllJobs);
    try
      aJob.DbKey := key;
      aJob.LoadFromDB;
      Frm := TfrmwtMaintJobComplete.Create(Self);
      try
        Frm.Job := aJob;
        Frm.ShowModal;
        Key := aJob.DbKey;
        dtmdlAllJobs.SetSOrderStatus(Key);
      finally
        Frm.Free;
      end;
    finally
      aJob.Free;
    end;
  finally
    dbgJobs.DataSource.DataSet.Close;
    dbgJobs.DataSource.DataSet.Open;
    iFirstKey := dbgJobs.DataSource.DataSet.fieldbyname('Job').asinteger;

    while (dbgJobs.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) <> true) and (key < iFirstKey) do
      begin
        inc(key);
      end;
  end;
end;

procedure TfrmWTMaintSalesOrder.dbgJobsDblClick(Sender: TObject);
begin
  btnJobChangeClick(self);
end;

procedure TfrmWTMaintSalesOrder.btnRemedialAddClick(Sender: TObject);
begin
  CallMaintRemedials(jremAdd);
end;

procedure TfrmWTMaintSalesOrder.CallMaintRemedials(aMode : TjremMode);
var
  inx : integer;
  Job: TJob;
  jRemedial : TjRemedial;
  frm: TfrmWTMaintJRemedial;
begin
//  inx := sgRemedials.row;
  Job := TJob.create(dtmdlAllJobs);
  try
    Job.dbkey := dbgJobs.DataSource.DataSet.fieldbyname('Job').asinteger;
    Job.LoadFromDB;

    try
      inx := dbgRemedials.datasource.dataset.fieldbyname('Remedial_Number').asinteger;
    except
      inx := 1;
    end;

    try
      frm := TfrmWTMaintjRemedial.Create(Self);
      try
        if aMode = jremAdd then
          jRemedial := TjRemedial.create(Job)
        else
        begin
          inx := Job.Remedials.IndexOf(inx);
          jRemedial := Job.Remedials[inx];
        end;
        Frm.jRemedial := jRemedial;
        Frm.Mode := aMode;
        Frm.ShowModal;
        if (aMode = jremAdd) and (Frm.ModalResult <> mrOK) then
          jRemedial.Free;
        if Frm.ModalResult = mrOK then
          begin
            Job.SaveToDB(true);
            ShowRemedials;
            dbgRemedials.DataSource.DataSet.Locate('Job;Remedial_Number', VarArrayOf([inttostr(Job.dbKey),inttostr(inx+1)]),[lopartialKey]);
          end;
      finally
        Frm.Free;
      end;
    finally
    end;
  finally
    Job.free;
  end;
end;

procedure TfrmWTMaintSalesOrder.btnRemedialChangeClick(Sender: TObject);
begin
  CallMaintRemedials(jremChange);
end;

procedure TfrmWTMaintSalesOrder.btnRemedialDeleteClick(Sender: TObject);
begin
  CallMaintRemedials(jremDelete);
end;

procedure TfrmWTMaintSalesOrder.btnRemedialPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  frmWTRSJobRemedialSheet := TfrmWTRSJobRemedialSheet.Create( Application );
  try
    Key := dbgRemedials.datasource.DataSet.FieldByName('Job').asinteger;
    frmWTRSJobRemedialSheet.Job := Key;
    frmWTRSJobRemedialSheet.showmodal;
  finally
    frmWTRSJobRemedialSheet.free;
    Screen.Cursor := OldCursor;
  end;

end;

procedure TfrmWTMaintSalesOrder.dbgRemedialsDblClick(Sender: TObject);
begin
  btnRemedialChangeClick(self);
end;

procedure TfrmWTMaintSalesOrder.ConverttoJob1Click(Sender: TObject);
var
  icol, iRow, inx, key, quote: integer;
  rDepositReqd: real;
  SOLine: TSOLine;
  sCreditStatus: string;
  bUsePurchasing: boolean;
begin
  icol := dbgLines.col;
  irow := dbgLines.row;

  try
    inx := strtoint(dbgLines.cells[0, iRow]);
  except
    inx := 1
  end;

  inx := SOrder.Lines.IndexOf(inx);
  SOLine := SOrder.Lines[inx];
  Quote := SOLine.Quote;

  if (SOLine.Job <> 0) then
    begin
      messagedlg('This line has already been converted to a job. You cannot convert the line to a job again', mtError, [mbAbort], 0);
        exit;
    end;

  bUsePurchasing := dtmdlWorktops.UsePurchaseOrdering;

  {Check Credit Status}
  sCreditStatus := dtmdlWorktops.GetCustomerCreditStatus(SOrder.Customer);
  if sCreditStatus = 'B' then
    begin
      MessageDlg(cBlock, mtWarning,[mbOk], 0);
      exit;
    end
  else
    if (sCreditStatus = 'S') then
      MessageDlg(cOnStop, mtWarning,[mbOk], 0)
  else
    if sCreditStatus = 'O' then
      MessageDlg(cOverDue, mtWarning,[mbOk], 0);

  rDepositReqd := (SOrder.TotalGoods * (SOrder.DepositTerms/100));

  if  (SOrder.DepositTerms <> 0) and (SOrder.Status < 50) and
      (SOrder.DepositAmount < rDepositReqd) then
    begin
      messagedlg('A deposit for this order hasn''t been received, templating and production cannot continue.', mtError, [mbAbort], 0);
        exit;
    end;

  if bUsePurchasing and (SOrder.Status < 20) then
    begin
      if SOrder.Datamodule.OutstandingPurchases(SOrder.dbKey) then
        begin
          if messagedlg('Purchases for this order haven''t been received. Continue to convert the order to a job?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            exit;
        end;
    end;

  if MessageDlg('Do you want to convert quote ' + inttostr(quote) + ', to a new job?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  ConvertToJobScreen(SOLine);
end;

procedure TfrmWTMaintSalesOrder.ConvertToJobScreen(SOLine: TSOLine);
var
  tempSO: integer;
  Key : integer;
  frm : TfrmWtMaintJob;
  aJob : TJob;
begin
  tempSO := SOrder.dbKey;
  dtmdlJob := TdtmdlJob.create(application);
  Key := 0;
  try
    aJob := TJob.Create(dtmdlJob);
    try
      aJob.DataModule.QuoteNo := SOLine.Quote;
      aJob.DataModule.SalesOrder := tempSO;
      aJob.DbKey := key;
      aJob.LoadFromQuote;
      aJob.Reference := SOrder.Reference;

      Frm := TfrmwtMaintJob.Create(Self);
      try
        Frm.Mode := jConvert;
        Frm.Job := aJob;
        Frm.ShowModal;
        if Frm.ModalResult = idOK then
          begin
            dtmdlJob.UpdateQStatus(aJob.Quote);
            dtmdlJob.UpdateSOLine(aJob.Quote, aJob.dbKey);
            dtmdlJob.UpdateSOStatus(tempSO, 50);
            SOLIne.Job := aJOb.dbKey;
          end;
      finally
        Frm.Free;
      end;
    finally
      aJob.Free;
    end;
  finally
    dtmdlJob.free;
    ShowLineDetails;
    ShowJobs;
  end;
end;

procedure TfrmWTMaintSalesOrder.SpeedButton2Click(Sender: TObject);
begin
  dblkpRevenueCentre.KeyValue := 0;
end;

procedure TfrmWTMaintSalesOrder.btnRemedialOrderClick(Sender: TObject);
var
  iSalesOrder, ijob, inx: integer;
begin
  if dbgRemedials.datasource.dataset.fieldbyname('Remedial_Sales_Order').asinteger <> 0 then
    begin
      messagedlg('A remedial order has already been created.', mtInformation, [mbOk], 0);
      exit;
    end;

  if MessageDlg('Do you want to create an order for this remedial?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;

  iJob := dbgRemedials.datasource.dataset.fieldbyname('Job').asinteger;
  inx := dbgRemedials.datasource.dataset.fieldbyname('Remedial_Number').asinteger;
  iSalesOrder := ConvertRemedialToOrder;
  if iSalesOrder <> 0 then
    begin
//      messagedlg('Remedial Sales Order '+ floattostr(iSalesOrder)+ ' has been created', mtInformation, [mbOk], 0);

      ShowRemedials;
      dbgRemedials.DataSource.DataSet.Locate('Job;Remedial_Number', VarArrayOf([inttostr(iJob),inttostr(inx+1)]),[lopartialKey]);
    end;

end;

function TfrmWTMaintSalesOrder.ConvertRemedialToOrder: integer;
var
  aSOrder: TSOrder;
  aSOLine: TSOLine;
  dtmdlOneSales: TdtmdlSalesOrder;
  iCount: integer;
  inx : integer;
  Job: TJob;
  sInstallAddress: string;
  jRemedial : TjRemedial;
  frmRem: TfrmWTMaintSalesOrder;
  bOK: boolean;
begin
  Job := TJob.create(dtmdlAllJobs);
  try
    Job.dbkey := dbgJobs.DataSource.DataSet.fieldbyname('Job').asinteger;
    Job.LoadFromDB;

    try
      inx := dbgRemedials.datasource.dataset.fieldbyname('Remedial_Number').asinteger;
    except
      inx := 1;
    end;

    try
      inx := Job.Remedials.IndexOf(inx);
      jRemedial := Job.Remedials[inx];

      dtmdlOneSales := TdtmdlSalesOrder.create(Application);
      aSOrder := TSOrder.Create(dtmdlOneSales);
      try
        aSOrder.DbKey := SOrder.dbKey;
        aSOrder.Operator := frmwtMain.Operator;
        aSOrder.SOMode := sopRemedial;
        aSOrder.LoadFromDB;

        aSorder.dbKey := 0;
        aSOrder.SupplyOnly := 'N';
        aSOrder.CollectionOnly := 'N';

        if jRemedial.ProductionRequired = 'Y' then
          begin
            aSOrder.RemedialProduction := 'Y';
            aSOrder.RemedialNoProduction := 'N';
          end
        else
          begin
            aSOrder.RemedialProduction := 'N';
            aSOrder.RemedialNoProduction := 'Y';
          end ;

        aSOrder.TemplateInSchedule := false;
        aSOrder.FittingInSchedule := false;

        aSOrder.FittingDocsReturned := false;
        aSOrder.TemplateDocsReturned := false;

        aSorder.TemplateDate := 0;
        aSorder.SODate := date;

        if JRemedial.InstallDate <> 0 then
          aSOrder.DateRequired := JRemedial.InstallDate
        else
          aSorder.DateRequired := date;

        aSOrder.Templater := 0;
        aSOrder.Fitter := 0;

        aSOrder.InvoiceCustomer := jRemedial.Customer;
        aSorder.InvoiceCustomerName := dtmdlWorktops.GetCustomerName(jRemedial.Customer);

        sInstallAddress := ShowNotes(SOrder.InstallAddress);
        aSOrder.InstallAddress := UpdateRemedialInstallAddress(0, sInstallAddress);

        aSOrder.InstallationAddress := aSOrder.DataModule.SetAddress(0,
                                                edtInstallationName.text,
                                                edtInstallationStreet.text,
                                                edtInstallationLocale.text,
                                                edtInstallationTown.text,
                                                edtInstallationPostcode.text,
                                                edtInstallationCounty.text,
                                                edtInstallEmail.text,
                                                edtInstallphone.text,
                                                'I');

        for icount := pred(aSOrder.lines.count) downto 0 do
          begin
            aSOrder.lines.Delete(icount);
          end;

        aSOLine := TSOLine.Create(aSOrder);
        try
          aSOLine.SOLNumber := 1;
          aSOLine.Product := dtmdlWorktops.GetDefaultRemedialProductCode;
          aSOLine.StockCode := dtmdlWorktops.GetProductStockCode(aSOLine.Product);
          aSOLine.Description := dtmdlWorktops.GetProductDescription(aSOLine.Product);
          aSOLine.UnitPrice := jremedial.Price;
          aSOLine.SellUnit := 1;
          aSOLine.Quantity := 1;
          aSOLine.QtyDelivered := 0;
          aSOLine.QtyInvoiced := 0;
          aSOLine.VAT := dtmdlWorktops.GetCustomerVat(aSOrder.Customer);
          aSOLine.Job := 0;
        finally
        end;
        aSOrder.Lines.Add(aSOLine);

        aSOrder.Status := 10;

        aSorder.RemedialID := JRemedial.RemedialID;

        frmRem := TfrmwtMaintSalesOrder.Create(application);
        try
          FrmRem.OriginalSalesOrderFromCopy := SOrder.dbKey;
          FrmRem.Mode := sopRemedial;
          FrmRem.SOrder := aSOrder;

          frmRem.showmodal;
          bOK := FrmRem.bOK;

//        aSorder.SaveToDB(true);
          if bOK then
            begin
              Result := aSOrder.dbkey;
              CreateandCopyRemedialSheet(Result, Job.dbKey, JRemedial.RemedialNumber);
            end
          else
            Result := 0;
        finally
          frmRem.Free;
        end;

      finally
        aSOrder.free;
        dtmdlOneSales.Free;
      end;
    finally
    end;
  finally
    Job.Free;
  end;
end;

function TfrmWTMaintSalesOrder.UpdateRemedialInstallAddress(iCode: integer; sAddress: string): Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iCode;
    Notes.DataInfo := sAddress;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

procedure TfrmWTMaintSalesOrder.CreateandCopyRemedialSheet(iSOrder, iJob, iRemedial: integer);
var
  FEmailAttachment : TstringList;
  sAttachment: array[0..255] of Char;
  iCount: integer;
  sLocation, sDest, sFileName: string;
  PDFFilter: TQRPDFDocumentFilter;
begin
  sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(iSorder) + '\' ;

  FEmailAttachment := nil;
  frmWTRPJobRemedialSheet := nil;
  try
    FEmailAttachment := TStringList.create;
    frmWTRPJobRemedialSheet := TfrmWTRPJobRemedialSheet.create(self);

    frmWTRPJobRemedialSheet.qrpJobSheet.ShowProgress := false;
    frmWTRPJobRemedialSheet.bPreview := false;
    frmWTRPJobRemedialSheet.Job := iJob;
    frmWTRPJobRemedialSheet.RemedialOrder := iSOrder;
    frmWTRPJobRemedialSheet.RemedialNo := iRemedial;

    frmWTRPJobRemedialSheet.bPrintLogo := true;

    frmWTRPJobRemedialSheet.qryReport.sql := SOrder.DataModule.qryRemedialReport.sql;

    if (frmWTRPJobRemedialSheet.GetDetails = 0) then
      exit;

    sLocation := GetWinTempDir;

    sFileName := 'RS' + inttostr(iSorder) + '-J'+ inttostr(iJob) + 'L' + inttostr(iRemedial);

    FEmailAttachment.add(sLocation + sFilename + '.pdf');
    PDFFilter := TQRPDFDocumentFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
    try
      frmWTRPJobRemedialSheet.qrpJobSheet.Prepare;
      frmWTRPJobRemedialSheet.qrpJobSheet.ExportToFilter(PDFFilter);
    finally
      frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter.Free;
      frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter := nil;
      PDFFilter.Free;
    end;

    {Now move the Remedial Sheet as PDF to the new Sales order folder}
    filecopy(sLocation + sFilename + '.pdf', sDest + sFilename + '.pdf');

    for iCount := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sAttachment, FEmailAttachment.strings[iCount]);
        deletefile(sAttachment);
      end;
  finally
    FEmailAttachment.Free;
    frmWTRPJobRemedialSheet.free;
  end;
end;

procedure TfrmWTMaintSalesOrder.Button1Click(Sender: TObject);
var
  iCount: integer;
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := SOrder.InvoiceCustomer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        SOrder.InvoiceCustomer := frmwtSrchCustomer.CodeSelected;
        edtSubContractCustomer.Text := frmwtSrchCustomer.NameSelected;
      end;
  finally
    frmwtSrchCustomer.free;
  end;
end;

procedure TfrmWTMaintSalesOrder.SpeedButton6Click(Sender: TObject);
begin
  SOrder.InvoiceCustomer := 0;
  edtSubContractCustomer.Text := '';
end;

procedure TfrmWTMaintSalesOrder.pmnuRemedialsPopup(Sender: TObject);
begin
  pmnuRemedialChange.enabled := btnRemedialChange.Enabled;
  pmnuRemedialDelete.enabled := btnRemedialDelete.Enabled;
  pmnuRemedialPrint.enabled := btnRemedialPrint.Enabled;
  pmnuRemedialOrder.enabled := btnRemedialOrder.Enabled;
end;

procedure TfrmWTMaintSalesOrder.btnCustomerBranchClick(Sender: TObject);
var
  sInstallName, sInstallEmail, sInstallPhone: string;
begin
  frmWTLUCustomerSite := TfrmWTLUCustomerSite.create(self);
  try
    frmWTLUCustomerSite.Customer := SOrder.Customer;
    frmWTLUCustomerSite.CustomerName := Sorder.CustomerName;
    frmWTLUCustomerSite.isLookup := true;
    frmWTLUCustomerSite.showmodal;
    if frmWTLUCustomerSite.selected then
      begin
//        if SOrder.CustomerBranch <> frmWTLUCustomerSite.SelectedCode then
          begin
            edtSiteName.Text := frmWTLUCustomerSite.SelectedName;
            SOrder.CustomerBranch := frmWTLUCustomerSite.SelectedCode;
            SOrder.CustomerBranchName := frmWTLUCustomerSite.SelectedName;
            SetInstallationAddressFields(frmWTLUCustomerSite.SelectedAddress);

            sInstallName := frmWTLUCustomerSite.SelectedInstallName;
            sInstallEmail := frmWTLUCustomerSite.SelectedInstallEmail;
            sInstallPhone := frmWTLUCustomerSite.SelectedInstallMobile;

            if (trim(edtInstallName.Text) <> '') or (trim(edtInstallPhone.Text) <> '') then
              begin
                if messagedlg('Overwite the existing installation contact details?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                  begin
                    edtInstallName.Text := sInstallName;
                    edtInstallEmail.Text := sInstallEmail;
                    edtInstallPhone.Text := sInstallPhone;
                  end;
              end
            else
              begin
                edtInstallName.Text := sInstallName;
                edtInstallEmail.Text := sInstallEmail;
                edtInstallPhone.Text := sInstallPhone;
              end;
          end;
      end;
  finally
    frmWTLUCustomerSite.free;
  end;

end;

procedure TfrmWTMaintSalesOrder.btnClearCustomerBranchClick(
  Sender: TObject);
begin
  edtSiteName.Text := '';
  SOrder.CustomerBranch := 0;
end;

procedure TfrmWTMaintSalesOrder.CreateQuoteDocument(iSOrder, iQuote: integer);
var
  FEmailAttachment : TstringList;
  sAttachment: array[0..255] of Char;
  iCount: integer;
  sLocation, sDest, sQuoteFolder, sFileName: string;
  PDFFilter: TQRPDFDocumentFilter;
begin
  sQuoteFolder := dtmdlWorktops.GetCompanyQuoteDocumentFolder;

  if sQuoteFolder <> '' then
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(iSorder) + '\' + sQuoteFolder + '\'
  else
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(iSorder) + '\';

  FEmailAttachment := TStringList.create;
  FEmailAttachment.clear;

  frmwtRPQuote := TfrmwtRPQuote.create(self);
  try
    frmwtRPQuote.Quote := iQuote;
    frmwtRPQuote.bPrintLogo := false;
    frmwtRPQuote.bPrintDetail := false;
    frmwtRPQuote.bPrintAcceptance := false;
    frmwtRPQuote.bOnlyGrandTotal := false;
    frmwtRPQuote.bPrintTotals := false;
    frmwtRPQuote.bEndUser := false ;
    frmWTRPQuote.bPreview := false;
    frmWTRPQuote.qrpDetails.ShowProgress := false;

    if (frmwtRPQuote.GetDetails = 0) then
      exit;

    sLocation := GetWinTempDir;

//    sFileName := 'Q' + inttostr(iSorder);
    sFileName := 'Q' + inttostr(iQuote);

    FEmailAttachment.add(sLocation + sFilename + '.pdf');
    PDFFilter := TQRPDFDocumentFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
    try
      frmwtRPQuote.qrpDetails.Prepare;
      frmwtRPQuote.qrpDetails.ExportToFilter(PDFFilter);
    finally
      frmwtRPQuote.qrpDetails.QRPrinter.Free;
      frmwtRPQuote.qrpDetails.QRPrinter := nil;
      PDFFilter.Free;
    end;
  finally
    {Now move the Quote as PDF to the new Sales order folder}
    filecopy(sLocation + sFilename + '.pdf', sDest + sFilename + '.pdf');

    for iCount := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sAttachment, FEmailAttachment.strings[iCount]);
        deletefile(sAttachment);
      end;

    FEmailAttachment.Free;
    frmWTRPQuote.Free;
  end;
end;

procedure TfrmWTMaintSalesOrder.MoveSiteDocuments(iSOrder: integer);
var
  sDest, sSource, sSafetyFolder: string;
  irow: integer;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
  sFilename: string;
begin
  sSource := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + SOrder.CustomerName + '\' + SOrder.CustomerBranchName + '\';

  sSafetyFolder := dtmdlWorktops.GetCompanySafetyDocumentFolder;

  if sSafetyFolder <> '' then
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(iSorder) + '\' + sSafetyFolder + '\'
  else
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(iSorder) + '\';

  // search for the first file
  irow := FindFirst(sSource + '*.*', faArchive, SearchRec);

  while irow = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          //Get The DisplayName
          SHGetFileInfo(PChar(sSource + SearchRec.Name), 0, FileInfo, SizeOf(FileInfo), SHGFI_DISPLAYNAME);

          sFilename := SearchRec.Name;

          filecopy(sSource+sFilename, sDest+sFilename);
        end;
      irow := FindNext(SearchRec);
    end;
end;

procedure TfrmWTMaintSalesOrder.btnGenerateDocsClick(Sender: TObject);
var
  icount: integer;
begin
  if (messagedlg('Confirm generating order documents', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      for icount := 0 to pred(SOrder.Lines.count) do
        begin
          if SOrder.Lines[icount].Quote > 0 then
            CreateQuoteDocument(SOrder.dbKey, SOrder.Lines[icount].Quote);
        end;
      MoveSiteDocuments(SOrder.dbKey);
      Messagedlg('Order documents created within the file structure', mtConfirmation,[mbOk], 0);
    end;
end;

procedure TfrmWTMaintSalesOrder.UpdateQuoteDocuments;
var
  icount: integer;
begin
  DeleteQuoteDocuments;
  for icount := 0 to pred(SOrder.Lines.count) do
    begin
      if SOrder.Lines[icount].Quote > 0 then
        CreateQuoteDocument(SOrder.dbKey, SOrder.Lines[icount].Quote);
    end;
end;

procedure TfrmWTMaintSalesOrder.DeleteQuoteDocuments;
var
  SearchRec: TSearchRec;
  sLocation, sDest, sQuoteFolder, sFileName: string;
  icount: integer;
begin
  sQuoteFolder := dtmdlWorktops.GetCompanyQuoteDocumentFolder;

  {We don't want to delete everything out of the parent folder}
  if sQuoteFolder = '' then
    exit;

  if sQuoteFolder <> '' then
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(SOrder.dbKey) + '\' + sQuoteFolder + '\'
  else
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(SOrder.dbKey) + '\';

  icount := FindFirst(sDest + '*.*', faArchive, SearchRec);

  while icount = 0 do
    begin
      sFileName := SearchRec.Name;

      deletefile(sDest + sFilename);

      iCount := FindNext(SearchRec);
    end;
end;

procedure TfrmWTMaintSalesOrder.DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint;
  var Effect: Integer);
begin
  var TargetPath := GetFilesPath;
  DropComboTarget1.SaveDroppedFiles(TargetPath,
    procedure
    begin
      ShowDocuments(SOrder.dbKey);
    end);
end;

end.
