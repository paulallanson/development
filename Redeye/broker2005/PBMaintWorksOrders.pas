unit PBMaintWorksOrders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, Buttons, DBCtrls, ExtCtrls, pbWOrdersDM,
  DB, DBTables, Spin, PBJobBagDM, Menus;

type
  TfrmPBMaintWorksOrders = class(TForm)
    pnlTop: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtOrderNumber: TEdit;
    pgProduction: TPageControl;
    tbDespatch: TTabSheet;
    Panel7: TPanel;
    btnAddDelivs: TBitBtn;
    btnChangeDelivs: TBitBtn;
    btnDeleteDelivs: TBitBtn;
    tbEvents: TTabSheet;
    Panel3: TPanel;
    sgEvents: TStringGrid;
    Panel8: TPanel;
    memEventNotes: TMemo;
    Panel9: TPanel;
    Panel18: TPanel;
    btnAddEvents: TBitBtn;
    btnChangeEvents: TBitBtn;
    btnDeleteEvents: TBitBtn;
    pnlFoot: TPanel;
    pnlOK: TPanel;
    stsbrDetails: TStatusBar;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    lblDeletePrompt: TLabel;
    edtDate: TEdit;
    edtDateReq: TEdit;
    btnDateRequired: TBitBtn;
    pnlCustomer: TPanel;
    Label5: TLabel;
    edtDateStart: TEdit;
    btnDateStart: TBitBtn;
    Label8: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TBitBtn;
    btnContacts: TButton;
    Label11: TLabel;
    Label13: TLabel;
    edtCustomerOrder: TEdit;
    Label12: TLabel;
    Label15: TLabel;
    edtPreviousWIN: TEdit;
    Label6: TLabel;
    sgDelivs: TStringGrid;
    tbProcesses: TTabSheet;
    Label4: TLabel;
    edtVersionNo: TEdit;
    dblkpContact: TDBLookupComboBox;
    pnlprocess: TPanel;
    pnlHeader: TPanel;
    Label7: TLabel;
    memDescription: TMemo;
    lblProductionType: TLabel;
    edtProductionType: TEdit;
    btnProductionType: TBitBtn;
    tbReturnAddress: TTabSheet;
    scrlQuestions: TScrollBox;
    lblAccountTeam: TLabel;
    edtAccountTeam: TEdit;
    Button1: TButton;
    memActualQty: TMemo;
    Label20: TLabel;
    btnAccountManager: TBitBtn;
    edtAccountManager: TEdit;
    chkbxPerso100: TCheckBox;
    btnJobBag: TBitBtn;
    btnNotes: TBitBtn;
    FlashTimer: TTimer;
    edtRep: TEdit;
    chkbxComplete: TCheckBox;
    pmnuProcess: TPopupMenu;
    InsertProcess1: TMenuItem;
    DeleteProcess1: TMenuItem;
    mnuProcess: TMenuItem;
    pnlprMachine: TPanel;
    pnlprNotes: TPanel;
    memProcessNotes: TMemo;
    pnlprTop: TPanel;
    lblReceiptDate: TLabel;
    lblQuantity: TLabel;
    lblNumberUp: TLabel;
    edtReceiptDate: TEdit;
    btnReceiptDate: TBitBtn;
    memQuantity: TMemo;
    spnNumberUp: TSpinEdit;
    rdgrpFormat: TRadioGroup;
    grpbxPaper: TGroupBox;
    lblCustomSize: TLabel;
    lblSize: TLabel;
    dblkpSize: TDBLookupComboBox;
    edtCustomSize: TEdit;
    lblRunHours: TLabel;
    lblMachineGroup: TLabel;
    lblMachine: TLabel;
    lblStaffCount: TLabel;
    memHours: TMemo;
    dblkpMachineGroup: TDBLookupComboBox;
    dblkpMachine: TDBLookupComboBox;
    memStaff: TMemo;
    pnlprNotesHead: TPanel;
    lblProcessNotes: TLabel;
    rdgrpAddressType: TRadioGroup;
    AddrGrpBox: TGroupBox;
    AddrTypeLabel: TLabel;
    BranchNameLabel: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    NameEdit: TEdit;
    BranchNameEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PostCodeEdit: TEdit;
    CountyEdit: TEdit;
    SearchBtn: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure btnDateRequiredClick(Sender: TObject);
    procedure btnDateStartClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnContactsClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure btnProductionTypeClick(Sender: TObject);
    procedure dblkpContactClick(Sender: TObject);
    procedure dblkpRepClick(Sender: TObject);
    procedure edtCustomerOrderChange(Sender: TObject);
    procedure dblkpAccManagerClick(Sender: TObject);
    procedure memEstimatedSellChange(Sender: TObject);
    procedure memEstimatedQtyChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPreviousWINChange(Sender: TObject);
    procedure memDescriptionChange(Sender: TObject);
    procedure edtVersionNoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgEventsClick(Sender: TObject);
    procedure sgEventsDblClick(Sender: TObject);
    procedure btnAddEventsClick(Sender: TObject);
    procedure btnChangeEventsClick(Sender: TObject);
    procedure btnDeleteEventsClick(Sender: TObject);
    procedure btnAddDelivsClick(Sender: TObject);
    procedure btnChangeDelivsClick(Sender: TObject);
    procedure btnDeleteDelivsClick(Sender: TObject);
    procedure sgDelivsDblClick(Sender: TObject);
    procedure QuestionChange(Sender: TObject);
    procedure QuestionClick(Sender: TObject);
    procedure QuestionDropDown(Sender: TObject);
    procedure tbProcessesEnter(Sender: TObject);
    procedure dblkpVatCodeClick(Sender: TObject);
    procedure dblkpPriceUnitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure memActualQtyChange(Sender: TObject);
    procedure chkbxPerso100Click(Sender: TObject);
    procedure btnAccountManagerClick(Sender: TObject);
    procedure btnJobBagClick(Sender: TObject);
    procedure btnReceiptDateClick(Sender: TObject);
    procedure btnNotesClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpSizeClick(Sender: TObject);
    procedure pmnuProcessPopup(Sender: TObject);
    procedure mnuProcessClick(Sender: TObject);
    procedure DeleteProcess1Click(Sender: TObject);
    procedure edtDateReqExit(Sender: TObject);
    procedure edtDateStartExit(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dblkpMachineGroupClick(Sender: TObject);
    procedure rdgrpAddressTypeClick(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
  private
    bNotesFlash: ByteBool;
    sOldValue: string;
    FActivated: boolean;
    FMode: TwoMode;
    FWOrder: TWOrder;
    FSelectedProcess: TWOProcess;
    dmWOJobBag: TdmJobBag;
    FComeFromJobBag: boolean;
    FReturnCompanyBranch: integer;
    FReturnCustomerAdhoc: integer;
    FReturnCompany: integer;
    FReturnBranch: integer;
    FReturnCustomer: integer;
    procedure AddWOProcesses;
    procedure DeleteDataComponents;
    procedure SetMode(const Value: TwoMode);
    procedure SetWOrder(const Value: TWOrder);
    procedure ShowDeliveries;
    procedure ShowDetails;
    procedure ShowEvents;
    procedure ShowProcesses;
    procedure CheckOK(Sender: TObject);
    procedure GetCustomerReps(tempno: integer);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure GetCustomerContacts(tempno: integer);
    procedure AddProcessComponents(tempTabSheet: TTabSheet; aProcess: TWOProcess);
    procedure AddProcessQuestions(aProcess: TWOProcess);
    procedure UpdateProcessNotes;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure BuildDeliveryGrid;
    procedure BuildEventGrid;
    procedure SetGridHeaders;
    procedure CallMaintEvent(aMode: TwoevMode);
    procedure CallMaintDelivs(aMode: TwoDelivMode);
    procedure SetSelectedProcess(const Value: TWOProcess);
    procedure CallMaintJobBagScreen(aMode: TjbMode);
    procedure SetComeFromJobBag(const Value: boolean);
    procedure CheckNotes(Sender: TObject);
    procedure ResizeProcessTab;
    procedure GetWorkCentres(tmpProcess: TWOProcess);
    procedure ShowAddress(Sender: TObject);
    procedure ShowReturnAddress;
    procedure SetReturnBranch(const Value: integer);
    procedure SetReturnCompany(const Value: integer);
    procedure SetReturnCompanyBranch(const Value: integer);
    procedure SetReturnCustomer(const Value: integer);
    procedure SetReturnCustomerAdhoc(const Value: integer);
    procedure ClearReturnAddress;
    function ReturnAddressRequired: boolean;
    { Private declarations }
  public
    bOK: boolean;
    property ComeFromJobBag: boolean read FComeFromJobBag write SetComeFromJobBag;
    property SelectedProcess: TWOProcess read FSelectedProcess write SetSelectedProcess;
    property ReturnCompany: integer read FReturnCompany write SetReturnCompany;
    property ReturnCompanyBranch: integer read FReturnCompanyBranch write SetReturnCompanyBranch;
    property ReturnCustomerAdhoc: integer read FReturnCustomerAdhoc write SetReturnCustomerAdhoc;
    property ReturnCustomer: integer read FReturnCustomer write SetReturnCustomer;
    property ReturnBranch: integer read FReturnBranch write SetReturnBranch;
    property WOrder : TWOrder read FWOrder write SetWOrder;
    property Mode: TwoMode read FMode write SetMode;
  end;

var
  frmPBMaintWorksOrders: TfrmPBMaintWorksOrders;

implementation

uses pbMainMenu, CCSCommon, DateSelV5, PBLUCust, PBLUCConta,
  PBLUProductionType, PBLUPreProduction, PBNarrativeDM, pbDatabase,
  PBMaintWOrderEvents, PBMaintWOrderDelivs, PBMaintJobBagDets, PBLUCRep,
  PBLUAccountManager, PBMaintJobBag, PBImages, PBDBMemo, PBLUOps,
  pbLUCompBranch, PBLUAdHoc;

const

  WorkCentreSQL =
  'SELECT work_centre_WC_Group.work_centre, work_centre.work_Centre_Name '+
  'FROM work_centre_WC_Group, work_Centre '+
  'WHERE work_centre_WC_Group.work_centre = work_centre.work_Centre and '+
  '      ((work_centre_group = :work_Centre_Group) OR (:work_Centre_Group = 0)) '+
  'ORDER BY Work_Centre_Name ';

{$R *.dfm}

procedure TfrmPBMaintWorksOrders.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBMaintWorksOrders.SetMode(const Value: TwoMode);
begin
  FMode := Value;
end;

procedure TfrmPBMaintWorksOrders.SetWOrder(const Value: TWOrder);
begin
  FWOrder := Value;
end;

procedure TfrmPBMaintWorksOrders.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    with WOrder.DataModule do
    begin
      qryPaperSize.Close;
      qryPaperSize.Open;
    end;

    with WOrder.DataModule do
    begin
      qryOperator.Close;
      qryOperator.Open;
    end;

    with WOrder.DataModule do
    begin
      qryCompany.close;
      qryCompany.open;
    end;

    with WOrder.DataModule do
    begin
      qryRep.close;
      qryRep.open;
    end;

    with WOrder.DataModule do
    begin
      qryVatCode.close;
      qryVatCode.open;
    end;

    with WOrder.DataModule do
    begin
      qryPriceUnit.close;
      qryPriceUnit.open;
    end;

    case Mode of
    woAdd     : Caption := 'Add a Works Order ';
    woChange  : Caption := 'Change a Works Order ';
    woDelete  : Caption := 'Delete a Works Order ';
    woRepeat   : Caption := 'Repeat a Works Order ';
    end;  { case }
    if (Mode = woAdd) or (Mode = woRepeat) then
      sTemp := ' New Works Order '
    else
      sTemp := ' Works Order ' + IntToStr(WOrder.DbKey) + ' ';

    if Mode = woRepeat then
      begin
        WOrder.DbKey := 0;
        WOrder.WONumberPrevious := Worder.WONumber;
        WOrder.WONumber := 0;
        WOrder.WODate := now;
        if WOrder.DateRequired < date then
          WOrder.DateRequired := date;

        if WOrder.EstimatedStartDate < date then
          WOrder.EstimatedStartDate := date;

        WOrder.CustomerPO := '';
        WOrder.VersionNo := 1;
        if not ComefromJobBag then
          WOrder.JobBagNo := 0;
        WOrder.OfficeContact := 0;
        WOrder.AccountManagerName := '';
        WOrder.AccountTeam := WOrder.DataModule.GetOpAccountTeam(WOrder.OfficeContact);
        WOrder.AccountTeamName := WOrder.DataModule.GetAccountTeamName(WOrder.AccountTeam);
      end;

    lblAccountteam.Visible := dmBroker.UseAccountManagers;
    edtAccountTeam.Visible := lblAccountTeam.Visible;

    ShowDetails;
    DeleteDataComponents;
    ShowProcesses;
    ShowDeliveries;
    ShowEvents;

//    ShowTotals;
    {Had to put this in because the components where losing the Listdatasource}
    dblkpContact.ListSource := WOrder.DataModule.dtsCustContacts;

    Checknotes(Self);
    CheckOK(Self);
    FActivated := true;
    FormResize(self);
  end;
end;

procedure TfrmPBMaintWorksOrders.ShowDetails;
begin
  if Mode = woAdd then
    begin
      WOrder.SIMethod := 'O';
      edtOrderNumber.text := '<New Order>';
      memDescription.Text := '';
      edtDate.text := PBDateStr(now);
      edtDateReq.text := PBDateStr(Date);
      edtDateStart.text := PBDateStr(Date);
      edtCustomer.text := '';
      dblkpContact.KeyValue := 0;
      dblkpContact.ListSource.DataSet.close;
//      memEstimatedSell.Text := '0.00';
      edtProductionType.Text := '';
      edtCustomerOrder.text := '';
      edtPreviousWIN.text := '';
      edtVersionNo.Text := '1';
      btnJobBag.visible := false;
//      dblkpVatCode.keyvalue := WOrder.DataModule.GetCompanyVatCode;
//      WOrder.VatCode := dblkpVatCode.keyvalue;
//      dblkpAccManager.KeyValue := 0;
//      dblkpPriceUnit.KeyValue := 0;
      chkbxPerso100.checked := false;

      memProcessNotes.lines.clear;

      if ComeFromJobBag then
        begin
          edtDateReq.Text := pbDateStr(WOrder.DateRequired);
          edtDateStart.Text := pbDateStr(WOrder.EstimatedStartDate);
          memDescription.Text := WOrder.Description;
          edtCustomer.text := WOrder.CustomerName + '/' + WOrder.BranchName;
          GetCustomerContacts(WOrder.Contact);
//          memEstimatedQty.Text := formatfloat('##0',WOrder.QuantityEst);
          memActualQty.Text := formatfloat('##0',WOrder.QuantityAct);
          edtCustomerOrder.text := WOrder.CustomerPO;
          GetCustomerReps(WOrder.Rep);
          edtRep.Text := WOrder.DataModule.GetRepName(WOrder.Rep);
          edtAccountManager.Text := WOrder.AccountManagerName;
          edtAccountTeam.Text := WOrder.AccountTeamName;
        end
      else
        begin
//          dblkpRep.KeyValue := 0;
//          dblkpRep.ListSource.DataSet.close;
          WOrder.AccountTeam := 0;
          edtAccountManager.Text := '';
          edtAccountTeam.Text := '';
        end;

      ReturnCompany := 1;
      ReturnCompanyBranch := 0;
    end
  else
    begin
      if WOrder.WONumber = 0 then
        begin
          edtOrderNumber.text := '<New Order>';
//          memEstimatedQty.Text := '';
          memActualQty.Text := '';
        end
      else
        begin
          edtOrderNumber.text := formatfloat('0.00',(WOrder.WONumber));
//          memEstimatedQty.Text := formatfloat('##0',WOrder.QuantityEst);
          memActualQty.Text := formatfloat('##0',WOrder.QuantityAct);
        end;

      memDescription.Text := WOrder.Description;
      edtDate.text := PBDateStr(WOrder.WODate);
      edtDateReq.text := PBDateStr(WOrder.DateRequired);
      edtDateStart.text := PBDateStr(WOrder.EstimatedStartDate);
      edtCustomer.text := WOrder.CustomerName + '/' + WOrder.BranchName;
      GetCustomerContacts(WOrder.Contact);
//      memEstimatedSell.Text := formatfloat('##0.00',WOrder.EstimatedSellPrice);
      edtProductionType.Text := WOrder.ProductionTypeDesc;
      edtCustomerOrder.text := WOrder.CustomerPO;
      if WOrder.WONumberPrevious = 0 then
        edtPreviousWIN.text := ''
      else
        edtPreviousWIN.text := floattostr(WOrder.WONumberPrevious);
      edtVersionNo.Text := inttostr(WOrder.VersionNo);
      btnJobBag.caption := 'Job Bag: ' + inttostr(WOrder.JobBagNo);

      btnJobBag.Visible := (WOrder.JobBagNo <> 0);

//      dblkpVatCode.keyvalue := WOrder.VatCode;

//      dblkpPriceUnit.KeyValue := WOrder.SellUnit;
      chkbxPerso100.checked := (Worder.IsPerso100 = 'Y');

      GetCustomerReps(WOrder.Rep);
      edtRep.Text := WOrder.DataModule.GetRepName(WOrder.rep);
      edtAccountManager.Text := WOrder.AccountManagerName;
      edtAccountTeam.Text := WOrder.AccountTeamName;

      ShowReturnAddress;

      chkbxComplete.Checked := (WOrder.WOStatus = 3000);
      stsbrDetails.Panels[0].Text := 'Created by: ' + WOrder.OperatorName;
    end;

  pnlTop.enabled := not(Mode = woView) and not(Mode = woDelete);
  pnlHeader.enabled := not(Mode = woView) and not(Mode = woDelete);
  pnlCustomer.enabled := not(Mode = woView) and not(Mode = woDelete);

  btnOK.Visible := not(Mode = woView);
  lbldeleteprompt.visible := (Mode = woDelete);
  chkbxComplete.Visible := (Mode <> woDelete);
  if (Mode = woView) or (Mode = woDelete) then
    begin
//      sgLines.popupMenu := pmnDummy;
//      sgCharges.popupMenu := pmnDummy;
    end;
end;

procedure TfrmPBMaintWorksOrders.ShowProcesses;
var
  tempTabSheet: TTabsheet;
  icount: integer;
begin
  LockWindowUpdate(Handle);
  try
    pgProduction.hide;
    try
      {Remove any existing process tabs}
      for icount := pred(pgProduction.PageCount-4) downto 0 do
        begin
          tempTabSheet := pgProduction.Pages[icount];
          tempTabSheet.Free;
        end;

      {Create new process tabs}
      for icount := pred(WOrder.Processes.count) downto 0 do
        begin
          tempTabSheet := TTabSheet.Create(pgProduction);
          tempTabSheet.PageControl := pgProduction;
          tempTabSheet.PageIndex := 0;
          tempTabSheet.Caption := WOrder.Processes[icount].ProcessName;
          tempTabSheet.Name := 'tbsht'+inttostr(WOrder.Processes[icount].Process);
          tempTabSheet.OnEnter := tbProcessesEnter;
//          tempTabSheet.PopupMenu := pmnuProcess;
          AddProcessComponents(tempTabSheet,WOrder.Processes[icount]);
          AddProcessQuestions(WOrder.Processes[icount]);
        end;
      pgProduction.ActivePageIndex := 0;
      pgProduction.pages[pred(pgProduction.PageCount)].tabVisible := false;
//      pgProduction.pages[pred(pgProduction.PageCount-1)].tabVisible := false; {this hides the Parts tab page}

      ReSizeProcessTab;
    finally
      pgProduction.show;
    end;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TfrmPBMaintWorksOrders.SetGridHeaders;
begin
  {Extras header}
  sgDelivs.cells[0,0] := 'No';
  sgDelivs.cells[1,0] := 'Courier';
  sgDelivs.cells[2,0] := 'Service';
  sgDelivs.cells[3,0] := 'Quantity';
  sgDelivs.cells[4,0] := 'Despatch';
  sgDelivs.cells[5,0] := 'Weight (gsm)';
  sgDelivs.cells[6,0] := 'Despatched';

  {Event header}
  sgEvents.cells[0,0] := 'No';
  sgEvents.cells[1,0] := 'Date/Time';
  sgEvents.cells[2,0] := 'Operator';
end;

procedure TfrmPBMaintWorksOrders.AddProcessComponents(tempTabSheet: TTabSheet; aProcess: TWOProcess);
var
  myPanel, myTopPanel, myHeadPanel, myNotesPanel, myMachinePanel: TPanel;
  mylabel: TLabel;
  myMemo: TMemo;
  myEdit: TEdit;
  mySpinEdit: TSpinEdit;
  myScrollbox: TScrollbox;
  myBitBtn: TBitBtn;
  myRadioGroup: TRadiogroup;
  myGroupBox: TGroupBox;
  myQuery: TQuery;
  myDataSource: TDataSource;
  myDBLookupCombo: TDBLookupComboBox;
begin
  {this is the main panel for all the process details}
  myPanel := TPanel.Create(Self);
  with myPanel do
    begin
      Name := 'pnl'+inttostr(aProcess.Process);
      Parent := tempTabsheet;
      Caption := '';
      width := pnlprocess.Width;
      align := pnlprocess.Align;
      bevelinner := pnlprocess.BevelInner;
    end;

  {Do the top panel and components}
  myTopPanel := TPanel.Create(Self);
  with myTopPanel do
    begin
      Name := 'pnlprTop'+inttostr(aProcess.Process);
      Parent := myPanel;
      Caption := '';
      height := pnlprTop.height;
      align := pnlprTop.Align;
      bevelinner := pnlprTop.BevelInner;
    end;

  mySpinEdit := TSpinEdit.create(self);
  with mySpinEdit do
    begin
      Name := 'spnNumberUp'+inttostr(aProcess.Process);
      Parent := myTopPanel;
      left := spnNumberUp.Left;
      top := spnNumberUp.Top;
      width := spnNumberUp.width;
      if aProcess.NumberUp = 0 then
        value := 1
      else
        value := aProcess.NumberUp;
      MinValue := spnNumberUp.MinValue;
      MaxValue := spnNumberUp.MaxValue;
      TabOrder := spnNumberUp.TabOrder;
    end;

  myMemo := TMemo.create(self);
  with myMemo do
    begin
      Name := 'memQuantity'+inttostr(aProcess.Process);
      Parent := myTopPanel;
      left := memQuantity.Left;
      top := memQuantity.Top;
      height := memQuantity.Height;
      width := memQuantity.Width;
      lines.Clear;
      if aProcess.Quantity = 0 then
        text := floattostr(aProcess.parent.QuantityEst)
      else
        text := inttostr(aProcess.Quantity);
      tabOrder := memQuantity.TabOrder;
      OnEnter := SaveValue;
      OnExit := ValidateQty;
      OnKeyPress := CheckKeyisNumber;
    end;

  myLabel := TLabel.create(self);
  with myLabel do
    begin
      Name := 'lblReceiptDate'+inttostr(aProcess.Process);
      Parent := myTopPanel;
      caption := stringreplace(lblReceiptDate.caption,'$',aProcess.ProcessName,[]);
      left := lblReceiptDate.Left;
      top := lblReceiptDate.Top;
      width := lblReceiptDate.width;
      width := 200;
      wordwrap := lblReceiptDate.wordwrap;
    end;

  myLabel := TLabel.create(self);
  with myLabel do
    begin
      Name := 'lblQuantity'+inttostr(aProcess.Process);
      Parent := myTopPanel;
      caption := lblQuantity.caption;
      left := lblQuantity.Left;
      top := lblQuantity.Top;
      width := lblQuantity.width;
      wordwrap := lblQuantity.wordwrap;
    end;

  myLabel := TLabel.create(self);
  with myLabel do
    begin
      Name := 'lblNumberUp'+inttostr(aProcess.Process);
      alignment := lblNumberUp.Alignment;
      Parent := myTopPanel;
      caption := WOrder.DataModule.GetProcessNumberType(aProcess.Process);
      if trim(caption) = '' then
        caption := lblNumberUp.caption;
      left := lblNumberUp.Left;
      top := lblNumberUp.Top;
      width := lblNumberUp.width;
      wordwrap := lblNumberUp.wordwrap;
    end;

  myEdit := TEdit.create(self);
  with myEdit do
    begin
      Name := 'edtReceiptDate'+inttostr(aProcess.Process);
      Parent := myTopPanel;
      if (Mode = woAdd) or (Mode = woRepeat) then
        text :=  pbdatestr(aProcess.Parent.EstimatedStartDate)
      else
        text := pbdatestr(aProcess.TargetDate);
      left := edtReceiptDate.Left;
      top := edtReceiptDate.Top;
      width := edtReceiptDate.width;
      tabOrder := edtReceiptDate.TabOrder;
      OnExit := edtDateExit;
    end;

  myBitBtn := TBitBtn.create(self);
  with myBitBtn do
    begin
      Name := 'btnReceiptDate'+inttostr(aProcess.Process);
      Parent := myTopPanel;
      caption := '';
      glyph := btnReceiptDate.glyph;
      height := btnReceiptDate.Height;
      left := btnReceiptDate.Left;
      top := btnReceiptDate.Top;
      width := btnReceiptDate.width;
      tabOrder := btnReceiptDate.TabOrder;
      OnClick := btnReceiptDateClick;
    end;

  myGroupBox := TGroupBox.create(self);
  with myGroupBox do
    begin
      Name := 'grpbxPaper'+inttostr(aProcess.Process);
      Parent := myTopPanel;
      caption := WOrder.DataModule.GetPaperPromptNarrative(aProcess.Process);
      if caption = '' then
        caption := grpbxPaper.caption;

      left := grpbxPaper.Left;
      top := grpbxPaper.Top;
      width := grpbxPaper.width;
      height := grpbxPaper.height;
      tabOrder := grpbxPaper.TabOrder;
      visible := (WOrder.DataModule.ShowProcessPaperSize(aProcess.Process) = 'Y');
    end;

  myQuery := TQuery.Create(Self);
  with myQuery do
    begin
      Name := 'qryPPSize'+inttostr(aProcess.Process);
      DatabaseName := WOrder.DataModule.qryProcessPaperSize.DatabaseName;
      SQL := WOrder.DataModule.qryProcessPaperSize.SQL;
      close;
      parambyname('Works_Order').asinteger := WOrder.dbKey;
      parambyname('Process').asinteger := aProcess.Process;
      open;
    end;

  myDataSource := TDataSource.Create(Self);
  with myDatasource do
    begin
      Name := 'dtsPPSize'+inttostr(aProcess.Process);
      Dataset := myQuery;
    end;

  myDBLookupCombo := TDBLookupComboBox.Create(self);
  with myDBLookupCombo do
    begin
      // Retrieve all papers for this process
      Name := 'dblkpSize'+inttostr(aProcess.Process);
      Parent := myGroupBox;
      left := dblkpSize.Left;
      top := dblkpSize.Top;
      width := dblkpSize.width;
      tabOrder := dblkpSize.TabOrder;
//      Listsource := WOrder.DataModule.dtsPaperSize;
      Listsource := myDataSource;
      ListField := 'Description';
      KeyField := 'Paper_Size';
      KeyValue := aProcess.PaperSize;
      OnClick := dblkpSizeClick;
    end;

  myEdit := TEdit.create(self);
  with myEdit do
    begin
      Name := 'edtCustomSize'+inttostr(aProcess.Process);
      Parent := myGroupBox;
      text := aProcess.CustPaperSize;
      left := edtCustomSize.Left;
      top := edtCustomSize.Top;
      width := edtCustomSize.width;
      Enabled := (aProcess.CustPaperSize <> '');
      tabOrder := edtCustomSize.TabOrder;
    end;

  myRadioGroup := TRadioGroup.create(self);
  with myRadioGroup do
    begin
      Name := 'rdgrpFormat'+inttostr(aProcess.Process);
      Parent := myTopPanel;
      caption := rdgrpFormat.caption;
      left := rdgrpFormat.Left;
      top := rdgrpFormat.Top;
      width := rdgrpFormat.width;
      height := rdgrpFormat.height;
      items := rdgrpFormat.items;
      if aProcess.LaserFormat = 'S' then
        itemindex := 1
      else
      if aProcess.LaserFormat = 'D' then
        itemindex := 2
      else
        itemindex := 0;
      visible := (WOrder.DataModule.ShowProcessSimplexDuplex(aProcess.Process) = 'Y');
      if not visible then
        itemindex := 0;
    end;

  myLabel := TLabel.create(self);
  with myLabel do
    begin
      Name := 'lblSize'+inttostr(aProcess.Process);
      Parent := myGroupBox;
      caption := lblSize.caption;
      left := lblSize.Left;
      top := lblSize.Top;
      width := lblSize.width;
      wordwrap := lblSize.wordwrap;
    end;

  myLabel := TLabel.create(self);
  with myLabel do
    begin
      Name := 'lblCustomSize'+inttostr(aProcess.Process);
      Parent := myGroupBox;
      caption := lblCustomSize.caption;
      left := lblCustomSize.Left;
      top := lblCustomSize.Top;
      width := lblCustomSize.width;
      wordwrap := lblCustomSize.wordwrap;
    end;

{-----------------------------------------------------}
  {Only create then if this process uses work centres}
  if aProcess.UseWorkCentres then
    begin
      {Do the Machine panel and components}
      myMachinePanel := TPanel.Create(Self);
      with myMachinePanel do
        begin
          Name := 'pnlprMachine'+inttostr(aProcess.Process);
          Parent := myPanel;
          Caption := '';
          height := pnlprMachine.height;
          align := pnlprMachine.Align;
          bevelinner := pnlprMachine.BevelInner;
        end;

      myLabel := TLabel.create(self);
      with myLabel do
        begin
          Name := 'lblMachineGroup'+inttostr(aProcess.Process);
          Parent := myMachinePanel;
          caption := lblMachineGroup.caption;
          left := lblMachineGroup.Left;
          top := lblMachineGroup.Top;
          width := lblMachineGroup.width;
          wordwrap := lblMachineGroup.wordwrap;
        end;

      myLabel := TLabel.create(self);
      with myLabel do
        begin
          Name := 'lblMachine'+inttostr(aProcess.Process);
          Parent := myMachinePanel;
          caption := lblMachine.caption;
          left := lblMachine.Left;
          top := lblMachine.Top;
          width := lblMachine.width;
          wordwrap := lblMachine.wordwrap;
        end;

      myLabel := TLabel.create(self);
      with myLabel do
        begin
          Name := 'lblRunHours'+inttostr(aProcess.Process);
          Parent := myMachinePanel;
          caption := lblRunHours.caption;
          left := lblRunHours.Left;
          top := lblRunHours.Top;
          width := lblRunHours.width;
          wordwrap := lblRunHours.wordwrap;
        end;

      myLabel := TLabel.create(self);
      with myLabel do
        begin
          Name := 'lblStaffCount'+inttostr(aProcess.Process);
          Parent := myMachinePanel;
          caption := lblStaffCount.caption;
          left := lblStaffCount.Left;
          top := lblStaffCount.Top;
          width := lblStaffCount.width;
          wordwrap := lblStaffCount.wordwrap;
        end;

      myMemo := TMemo.create(self);
      with myMemo do
        begin
          Name := 'memHours'+inttostr(aProcess.Process);
          Parent := myMachinePanel;
          left := memHours.Left;
          top := memHours.Top;
          height := memHours.Height;
          width := memHours.Width;
          lines.Clear;
          if aProcess.NoOfHours = 0 then
            text := formatfloat('##0.00',0)
          else
            text := formatfloat('##0.00',aProcess.NoofHours);
          tabOrder := memHours.TabOrder;
          OnEnter := SaveValue;
          OnExit := ValidateMoney;
          OnKeyPress := CheckKeyisNumber;
        end;

      myMemo := TMemo.create(self);
      with myMemo do
        begin
          Name := 'memStaff'+inttostr(aProcess.Process);
          Parent := myMachinePanel;
          left := memStaff.Left;
          top := memStaff.Top;
          height := memStaff.Height;
          width := memStaff.Width;
          lines.Clear;
          text := inttostr(aProcess.TeamCount);
          tabOrder := memStaff.TabOrder;
          OnEnter := SaveValue;
          OnExit := ValidateQty;
          OnKeyPress := CheckKeyisNumber;
        end;

      myQuery := TQuery.Create(Self);
      with myQuery do
        begin
          Name := 'qryWCGroup'+inttostr(aProcess.Process);
          DatabaseName := WOrder.DataModule.qryWCGroup.DatabaseName;
          SQL := WOrder.DataModule.qryWCGroup.SQL;
          close;
//          parambyname('Process').asinteger := aProcess.Process;
          open;
        end;

      myDataSource := TDataSource.Create(Self);
      with myDatasource do
        begin
          Name := 'dtsWCGroup'+inttostr(aProcess.Process);
          Dataset := myQuery;
        end;

      myDBLookupCombo := TDBLookupComboBox.Create(self);
      with myDBLookupCombo do
        begin
          // Retrieve all papers for this process
          Name := 'dblkpMachineGroup'+inttostr(aProcess.Process);
          Parent := myMachinePanel;
          left := dblkpMachineGroup.Left;
          top := dblkpMachineGroup.Top;
          width := dblkpMachineGroup.width;
          tabOrder := dblkpMachineGroup.TabOrder;
          Listsource := myDataSource;
          ListField := 'Work_Centre_Group_Name';
          KeyField := 'Work_Centre_Group';
          KeyValue := aProcess.WorkCentreGroup;
          OnClick := dblkpMachineGroupClick;
        end;

      myQuery := TQuery.Create(Self);
      with myQuery do
        begin
          Name := 'qryWC'+inttostr(aProcess.Process);
          DatabaseName := WOrder.DataModule.qryWC.DatabaseName;
          SQL := WOrder.DataModule.qryWC.SQL;
        end;

      myDataSource := TDataSource.Create(Self);
      with myDatasource do
        begin
          Name := 'dtsWC'+inttostr(aProcess.Process);
          Dataset := myQuery;
        end;

      GetWorkCentres(aProcess);

      myDBLookupCombo := TDBLookupComboBox.Create(self);
      with myDBLookupCombo do
        begin
          // Retrieve all papers for this process
          Name := 'dblkpMachine'+inttostr(aProcess.Process);
          Parent := myMachinePanel;
          left := dblkpMachine.Left;
          top := dblkpMachine.Top;
          width := dblkpMachine.width;
          tabOrder := dblkpMachine.TabOrder;
          Listsource := myDataSource;
          ListField := 'Work_Centre_Name';
          KeyField := 'Work_Centre';
          KeyValue := aProcess.WorkCentre;
        end;
    end;
{-------------------------------------------------------}

  {Do the Notes panel and Memo field}
  myNotesPanel := TPanel.Create(Self);
  with myNotesPanel do
    begin
      Name := 'pnlprNotes'+inttostr(aProcess.Process);
      Parent := myPanel;
      Caption := '';
      width := pnlprNotes.Width;
      height := pnlprNotes.height;
      align := pnlprNotes.Align;
      bevelinner := pnlprNotes.BevelInner;
    end;

  {Do the Notes Header panel and labels}
  myHeadPanel := TPanel.Create(Self);
  with myHeadPanel do
    begin
      Name := 'pnlprNotesHead'+inttostr(aProcess.Process);
      Parent := myNotesPanel;
      Caption := '';
      height := pnlprNotesHead.height;
      align := pnlprNotesHead.Align;
      bevelinner := pnlprNotesHead.BevelInner;
    end;

  myLabel := TLabel.create(self);
  with myLabel do
    begin
      Name := 'lblProcessNotes'+inttostr(aProcess.Process);
      Parent := myHeadPanel;
      caption := lblProcessNotes.caption;
      left := lblProcessNotes.Left;
      top := lblProcessNotes.Top;
      width := lblProcessNotes.width;
    end;

  myMemo := TMemo.create(self);
  with myMemo do
    begin
      Name := 'mem'+inttostr(aProcess.Process);
      Parent := myNotesPanel;
      align := memProcessNotes.Align;
      left := memProcessNotes.Left;
      top := memProcessNotes.Top;
      height := memProcessNotes.Height;
      scrollbars := memProcessNotes.scrollbars;
      width := memProcessNotes.Width;
      lines.Clear;
      tabOrder := memProcessNotes.TabOrder;
      text := aProcess.Narrative.Data;
    end;

{------------------------------------------------}

  myScrollBox := TScrollBox.create(self);
  with myScrollBox do
    begin
      Name := 'scrl'+inttostr(aProcess.Process);
      parent := tempTabSheet;
      align := alClient;
//     align := scrlQuestions.align;
    end;
//  myPanel.Align := alClient;
end;

procedure TfrmPBMaintWorksOrders.AddProcessQuestions(aProcess: TWOProcess);
var
  myScrollBox: TScrollBox;
  myLabel : TLabel;
  myEdit : TEdit;
  myMemo : TMemo;
  myComboBox: TComboBox;
  myCheckBox: TCheckBox;
  mySpinEdit: TSpinEdit;
  sTempName : string;
  iPos : integer;
  icount : integer;
begin
  myScrollBox := (findcomponent('scrl'+inttostr(aProcess.process)) as TScrollBox);

(*  { Do the frees in reverse order or all hell breaks loose }
  for icount := Pred(ComponentCount) downto 0 do
    if TComponent(Components[icount]).Tag >= 999999 then
      TComponent(Components[icount]).Free;
*)

  iPos := 5;
  for icount := 0 to Pred(aProcess.Questions.Count) do
  with aProcess.Questions[icount] do
  begin
    if PromptType = 'cbo' then
      begin
        MyLabel := TLabel.Create(Self);
        MyComboBox := TComboBox.Create(Self);
        stempname := 'cbo' + Copy((IntToStr(1000 + Question)),2,3) + 'Line' +
          IntToStr(aProcess.WOProcessNo);
        Mylabel.autosize := False;
        MyComboBox.Name := stempname;
        MyLabel.Caption := QuestionText;
        MyComboBox.Parent := myScrollbox;
        MyLabel.Parent := myScrollbox;
        MyComboBox.Tag := 999999 + icount;
        MyLabel.Tag := 999999;
        MyLabel.Left := 5;
        MyLabel.Width := 150;
        MyLabel.Top := ipos;
        Mylabel.Font.Size := 8;
        MyComboBox.Width := 200;
        MyComboBox.Left := mylabel.Left + mylabel.Width + 5;
        MyComboBox.Text := Answer;
        MyComboBox.OnClick := QuestionClick;
        MyComboBox.OnChange := QuestionChange;
        MyComboBox.OnDropDown := QuestionDropDown;
        MyLabel.Height := 13;
        MyComboBox.Height := 21;
//        ipos := ipos + MyLabel.Height;
        MyComboBox.Top := ipos;
        MyLabel.Top := MyComboBox.Top+5;
        ipos := ipos + MyComboBox.Height+5;
//        MyComboBox.style := csdropdownlist;
      end
    else
    if PromptType = 'chk' then
      begin
        MyLabel := TLabel.Create(Self);
        MyCheckBox := TCheckBox.Create(Self);
        stempname := 'chk' + Copy((IntToStr(1000 + Question)),2,3) + 'Line' +
          IntToStr(aProcess.WOProcessNo);
        MyCheckBox.Name := stempname;
        MyCheckBox.Caption := '';
        MyCheckBox.Parent := myScrollbox;

        Mylabel.autosize := False;
        MyLabel.Caption := QuestionText;
        MyLabel.Parent := myScrollbox;
        MyLabel.Tag := 999999;
        MyLabel.Left := 5;
        MyLabel.Width := 150;
        MyLabel.Top := ipos;
        Mylabel.Font.Size := 8;
        MyLabel.Height := 15;

        MyCheckBox.Tag := 999999 + icount;
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
        stempname := 'spn' + Copy((IntToStr(1000 + Question)),2,3) + 'Line' +
          IntToStr(aProcess.WOProcessNo);
        Mylabel.autosize := False;
        MySpinEdit.Name := stempname;
        MyLabel.Caption := QuestionText;
        MySpinEdit.Parent := myScrollbox;
        MyLabel.Parent := myScrollbox;
        MySpinEdit.Tag := 999999 + icount;
        MyLabel.Tag := 999999;
        MyLabel.Left := 5;
        MyLabel.Width := 150;
        MySpinEdit.Top := ipos;
        Mylabel.Font.Size := 8;
        MySpinEdit.Width := 80;
        MySpinEdit.Left := mylabel.Left + mylabel.Width + 5;
        try
          MySpinEdit.value := strtoint(Answer);
        except
          MySpinEdit.value := 0;
        end;

        MySpinEdit.OnChange := QuestionChange;
        MyLabel.Height := 13;
        MySpinEdit.Height := 22;
        MySpinEdit.MaxValue := 999999;
        MyLabel.top := MySpinEdit.top+5;
        ipos := ipos + MySpinedit.Height+5;
      end
    else
    if PromptType = 'mem' then
      begin
        MyLabel := TLabel.Create(Self);
        MyMemo := TMemo.Create(Self);
        stempname := 'Memo' + Copy((IntToStr(1000 + Question)),2,3) + 'Line' +
          IntToStr(aProcess.WOProcessNo);
        Mylabel.autosize := False;
        MyMemo.Name := stempname;
        MyLabel.Caption := QuestionText;
        MyMemo.Parent := myScrollbox;
        MyLabel.Parent := myScrollbox;
        MyMemo.Tag := 999999 + icount;
        MyLabel.Tag := 999999;
        MyLabel.Left := 5;
        MyLabel.Width := 150;
        Mylabel.Font.Size := 8;
        MyMemo.Width := 230;
        MyMemo.Scrollbars := ssVertical;
        MyMemo.Left := mylabel.Left + mylabel.Width + 5;
        MyMemo.Text := Answer;
        MyMemo.OnChange := QuestionChange;
        MyLabel.Height := 15;
        MyMemo.Height := 66;
//        ipos := ipos + MyLabel.Height;
        MyMemo.Top := ipos;
        MyLabel.Top := MyMemo.Top+5;
        ipos := ipos + MyMemo.Height+5;
      end
    else
      begin
        MyLabel := TLabel.Create(Self);
        MyEdit := TEdit.Create(Self);
        stempname := 'Edit' + Copy((IntToStr(1000 + Question)),2,3) + 'Line' +
          IntToStr(aProcess.WOProcessNO);
        Mylabel.autosize := False;
        MyEdit.Name := stempname;
        MyLabel.Caption := QuestionText;
        MyEdit.Parent := myScrollbox;
        MyLabel.Parent := myScrollbox;
        MyEdit.Tag := 999999 + icount;
        MyLabel.Tag := 999999;
        MyLabel.Left := 5;
        MyLabel.Width := 150;
        Mylabel.Font.Size := 8;
        MyEdit.Width := 230;
        MyEdit.Left := mylabel.Left + mylabel.Width + 5;
        MyEdit.Text := Answer;
        MyEdit.OnChange := QuestionChange;
        MyLabel.Height := 13;
        MyEdit.Height := 21;
//        ipos := ipos + MyLabel.Height;
        MyEdit.Top := ipos;
        MyLabel.Top := MyEdit.Top+5;
        ipos := ipos + Myedit.Height+5;
      end;
  end;

end;

procedure TfrmPBMaintWorksOrders.CheckOK(Sender : TObject);
begin
  btnOK.enabled := (edtAccountManager.text <> '') and
                   (memActualQty.Text <> '') and
                   (edtCustomer.Text <> '') and
                   (memDescription.Text <> '') and
                   (edtCustomerOrder.Text <> '') and
                   (dblkpContact.Text <> '') and
                   (edtRep.Text <> '');
end;

procedure TfrmPBMaintWorksOrders.GetCustomerReps(tempno: integer);
begin
(*  with WOrder.Datamodule.qryCustReps do
    begin
      close;
      parambyname('Customer').asinteger := WOrder.Customer;
      parambyname('Branch_no').asinteger := WOrder.Branch;
      open;

      if (recordcount = 1) then
        begin
         if tempno = 0 then
           dblkpRep.keyvalue := fieldbyname('Rep').asinteger
         else
           dblkpRep.keyvalue := tempno
        end
      else
        begin
          if tempno = 0 then
            dblkpRep.keyvalue := 0
          else
            dblkpRep.keyvalue := tempno
        end;
      WOrder.Rep := dblkpRep.keyvalue;
    end;
*)
end;

procedure TfrmPBMaintWorksOrders.GetCustomerContacts(tempno: integer);
begin
  with WOrder.Datamodule.qryCustContacts do
    begin
      close;
      parambyname('Customer').asinteger := WOrder.Customer;
      parambyname('Branch_no').asinteger := WOrder.Branch;
      open;

      if (recordcount = 1) then
        begin
         if tempno = 0 then
           dblkpContact.keyvalue := fieldbyname('Contact_no').asinteger
         else
           dblkpContact.keyvalue := tempno
        end
      else
        begin
          if tempno = 0 then
            dblkpContact.keyvalue := 0
          else
            dblkpContact.keyvalue := tempno
        end;
      WOrder.Contact := dblkpContact.keyvalue;
    end;
end;

procedure TfrmPBMaintWorksOrders.btnDateClick(Sender: TObject);
var
  NewDate: TDateTime;
begin
  NewDate := InputDate(StrToDate(edtdate.Text));
  edtDate.Text := PBDatestr(NewDate);
end;

function TfrmPBMaintWorksOrders.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmPBMaintWorksOrders.btnDateRequiredClick(Sender: TObject);
var
  NewDate: TDateTime;
begin
  NewDate := InputDate(StrToDate(edtdateReq.Text));
  if (NewDate < date) and (Mode = woAdd) then
    begin
      MessageDlg('Mailing Date must be on or after the current date', mtError, [mbOk], 0);
      edtDateReq.SetFocus;
      Exit;
    end;
  edtDateReq.Text := PBDatestr(NewDate);
end;

procedure TfrmPBMaintWorksOrders.btnDateStartClick(Sender: TObject);
var
  NewDate: TDateTime;
begin
  NewDate := InputDate(StrToDate(edtdateStart.Text));
  if (NewDate < date) and (Mode = woAdd) then
    begin
      MessageDlg('Start Date must be on or after the current date', mtError, [mbOk], 0);
      edtDateStart.SetFocus;
      Exit;
    end;
  edtDateStart.Text := PBDatestr(NewDate);
end;

procedure TfrmPBMaintWorksOrders.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmPBMaintWorksOrders.ValidateMoney(Sender: TObject);
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
  begin
    (Sender as TMemo).Text := TempStr;
  end;
end;

procedure TfrmPBMaintWorksOrders.ValidateQty(Sender: TObject);
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
end;

procedure TfrmPBMaintWorksOrders.CheckKeyIsNumber(Sender: TObject; var Key: Char);
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

procedure TfrmPBMaintWorksOrders.btnCustomerClick(Sender: TObject);
begin
  PBLUCustfrm := TPBLUCustfrm.Create(self);
  try
    PBLUCustfrm.bIs_Lookup := true;
    PBLUCustfrm.bSel_Branch := True;
    PBLUCustfrm.bAllow_upd := true;

    PBLUCustfrm.Selcode := WOrder.Customer;
    PBLUCustfrm.SelBranch := WOrder.Branch;

    PBLUCustfrm.SelName := WOrder.CustomerName;
    PBLUCustfrm.SelBranchName := WOrder.BranchName;

    PBLUCustFrm.ShowModal;
    if PBLUCustfrm.selected then
    begin
      WOrder.Customer := PBLUCustfrm.Selcode;
      WOrder.CustomerName := PBLUCustfrm.SelName;
      WOrder.Branch := PBLUCustfrm.SelBranch;
      WOrder.BranchName := PBLUCustfrm.SelBranchName;

      edtCustomer.text := '';
      edtCustomer.text := WOrder.CustomerName + '/' + WOrder.BranchName;

      WOrder.Rep := WOrder.DataModule.GetCustomerRep(WOrder.customer,WOrder.Branch);
      edtRep.Text := WOrder.DataModule.GetRepName(WOrder.Rep);

(*      {Get associated Rep}
      if dblkpRep.keyvalue = 0 then
        GetCustomerReps(0)
      else
        GetCustomerReps(dblkpRep.keyvalue);
*)

      {Get associated Contact}
      if dblkpContact.keyvalue = 0 then
        GetCustomerContacts(0)
      else
        GetCustomerContacts(dblkpContact.keyvalue);
      checkOK(self);
    end;
  finally
    PBLUCustfrm.Free;
  end;

end;

procedure TfrmPBMaintWorksOrders.btnContactsClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := True;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := WOrder.Customer;
    PBLUCContaFrm.iBranch := WOrder.Branch;
    PBLUCContaFrm.SelCode := dblkpContact.keyvalue;
    PBLUCContaFrm.sCustName := WOrder.CustomerName;
    PBLUCContaFrm.sBranchName := WOrder.BranchName;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      WOrder.Contact := PBLUCContaFrm.SelCode;
      GetCustomerContacts(WOrder.Contact);
    end;
  finally
    PBLUCContaFrm.Free;
  end;
  CheckOK(self);

end;

procedure TfrmPBMaintWorksOrders.edtDescriptionChange(Sender: TObject);
begin
  WOrder.Description := (Sender as TEdit).Text;
  CheckOK(self);
end;

procedure TfrmPBMaintWorksOrders.btnProductionTypeClick(Sender: TObject);
begin
  PBLUProductionTypeFrm := TPBLUProductionTypeFrm.Create(Self);
  try
    PBLUProductionTypeFrm.selcode := WOrder.ProductionType;
    PBLUProductionTypeFrm.selName := edtProductionType.text;
    PBLUProductionTypeFrm.bIs_Lookup := true;
    PBLUProductionTypeFrm.bAllow_Upd := True;
    PBLUProductionTypeFrm.ShowModal;
    if PBLUProductionTypeFrm.selected then
      begin
      if WOrder.ProductionType <> PBLUProductionTypeFrm.selcode then
        begin
          WOrder.ProductionType := PBLUProductionTypeFrm.selcode;
          edtProductionType.Text := PBLUProductionTypeFrm.selName;
          AddWOProcesses;
          DeleteDataComponents;
          ShowProcesses;
        end
      end;
  finally
    PBLUProductionTypeFrm.Free;
  end;
  CheckOK(self);
end;

procedure TfrmPBMaintWorksOrders.dblkpContactClick(Sender: TObject);
begin
  WOrder.Contact := dblkpContact.keyvalue;
  CheckOK(self);

end;

procedure TfrmPBMaintWorksOrders.dblkpRepClick(Sender: TObject);
begin
//  WOrder.Rep := dblkpRep.keyvalue;
  CheckOK(self);

end;

procedure TfrmPBMaintWorksOrders.edtCustomerOrderChange(Sender: TObject);
begin
  WOrder.CustomerPO := (Sender as TEdit).Text;
  CheckOK(self);
end;

procedure TfrmPBMaintWorksOrders.dblkpAccManagerClick(Sender: TObject);
begin
(*  WOrder.OfficeContact := dblkpAccManager.keyvalue;
  WOrder.AccountTeam := Worder.DataModule.GetOpAccountTeam(WOrder.OfficeContact);
  WOrder.AccountTeamName := Worder.DataModule.GetAccountTeamName(WOrder.AccountTeam);
  edtAccountTeam.text := WOrder.AccountTeamName;
  CheckOK(self);
*)
end;

procedure TfrmPBMaintWorksOrders.memEstimatedSellChange(Sender: TObject);
begin
  if FActivated then
    begin
      try
        WOrder.EstimatedSellPrice := strtofloat((Sender as TMemo).text);
      except
        WOrder.EstimatedSellPrice := 0.00;
      end;
    end;
  CheckOK(self);
end;

procedure TfrmPBMaintWorksOrders.memEstimatedQtyChange(Sender: TObject);
begin
  try
    WOrder.QuantityEst := strtofloat((Sender as TMemo).text);
  except
    WOrder.QuantityEst := 1;
  end;
  CheckOK(self);
end;

procedure TfrmPBMaintWorksOrders.btnOKClick(Sender: TObject);
var
  TempWord: Word;
  icount, iquestion: integer;
  edtTmpPaper, edtTmpDate: TEdit;
  DespatchDate: TDateTime;
  dblkpTmpSize: TDBLookupComboBox;
  grpbxTmpPaper: TGroupBox;
begin
  if (edtAccountTeam.visible) and (edtAccountTeam.Text = '') then
    begin
      messagedlg('Cannot continue, the account manager is not associated with any team', mtInformation,
      [mbOk], 0);
      exit;
    end;

  if ((Mode = woAdd) or (Mode = woRaise) or (Mode = woRepeat)) and (WOrder.Deliveries.count = 0) then
    begin
      messagedlg('At least one method of despatch must be specified', mtInformation, [mbOk], 0);
      pgProduction.ActivePage := tbDespatch;
      exit;
    end;

  if (ReturnAddressRequired) and ((rdgrpAddressType.ItemIndex <= 0) or (NameEdit.Text = '')) then
    begin
      messagedlg('A Return Address is required, please select the relevant address', mtInformation, [mbOk], 0);
      pgProduction.ActivePage := tbReturnAddress;
      exit;
    end;

  if WOrder.WOStatus < 30 then
    begin
      if pbdatestr(trim(edtDateStart.text)) > pbdatestr(trim(edtDateReq.text)) then
        begin
          messagedlg('The start date and mailing date are invalid! The start date cannot be later than the mailing date', mtError,[mbOk], 0);
          edtDateStart.setfocus;
          exit;
        end;
      {Check that the despatch dates are no later than the Mail Date}
      DespatchDate := 0;
      for icount := 0 to pred(WOrder.Deliveries.count) do
        begin
          if (WOrder.deliveries[icount].DelivDate < DespatchDate) or (DespatchDate = 0) then
            DespatchDate := WOrder.deliveries[icount].DelivDate;
        end;

      if DespatchDate <> pbdatestr(trim(edtDateReq.text)) then
        begin
          TempWord := messagedlg('The earliest despatch date is ' + pbdatestr(DespatchDate) + ', which is different to the works instruction mailing date, '
                                  + ' do you want the mailing date changed to this date and continue to save?', mtConfirmation,
                                  [mbYes, mbNo], 0) ;

          if TempWord = mrNo then
            begin
              Exit;
            end
          else
            begin
              edtdateReq.Text := pbdatestr(DespatchDate);
            end;
        end;

      for icount := 0 to pred(WOrder.Processes.count) do
        begin
          {Check that dates are valid}
          edtTmpDate := (findcomponent('edtReceiptDate'+inttostr(WOrder.Processes[icount].process)) as TEdit);
          if (pbdatestr(trim(edtTmpDate.text)) < pbdatestr(trim(edtDateStart.text))) or
             (pbdatestr(trim(edtTmpDate.text)) > pbdatestr(trim(edtDateReq.text))) then
            begin
              messagedlg('The commencement date for ' + WOrder.Processes[icount].ProcessName +
                          ' is not within the start and mailing date for the works instruction', mtError,[mbOk], 0);
              pgProduction.ActivePageIndex := icount;
              exit;
            end;

          {Check that paper size has been entered}
          dblkpTmpSize := (findcomponent('dblkpSize'+inttostr(WOrder.Processes[icount].process)) as TDBLookupComboBox);
          grpbxTmpPaper := (findcomponent('grpbxPaper'+inttostr(WOrder.Processes[icount].process)) as TGroupBox);
          edtTmpPaper := (findcomponent('edtCustomSize'+inttostr(WOrder.Processes[icount].process)) as TEdit);
          if (trim(dblkpTmpSize.text) = '') and (grpbxTmpPaper.visible) then
            begin
              messagedlg( 'The ' + grpbxTmpPaper.caption + ' size within ' + WOrder.Processes[icount].ProcessName +
                          ' is mandatory, please select a size', mtError,[mbOk], 0);
              pgProduction.ActivePageIndex := icount;
              exit;
            end;

          if (trim(edtTmpPaper.text) = '') and (edtTmpPaper.enabled) then
            begin
              messagedlg( 'The ' + grpbxTmpPaper.caption + ' size selected in ' + WOrder.Processes[icount].ProcessName +
                          ' is a custom size, please specify the custom sizes', mtError,[mbOk], 0);
              pgProduction.ActivePageIndex := icount;
              exit;
            end;
          {check that all mandatory fields have been entered}
          for iquestion := 0 to pred(WOrder.Processes[icount].Questions.count) do
            if WOrder.Processes[icount].Questions[iquestion].Mandatory then
              if trim(WOrder.Processes[icount].Questions[iquestion].Answer) = '' then
                begin
                  messagedlg( WOrder.Processes[icount].Questions[iquestion].QuestionText + ' within ' +
                          WOrder.Processes[icount].ProcessName +
                          ' is a mandatory field, please make an entry.', mtError,[mbOk], 0);
                  pgProduction.ActivePageIndex := icount;
                  exit;
                end
        end;
    end;

  {Set the Return Address details}
  {The values should be set when selecting the address type}
  WOrder.ReturnCompany := 0;
  Worder.ReturnCompanyBranch := 0;
  WOrder.ReturnCustomer := 0;
  WOrder.ReturnBranch := 0;
  WOrder.ReturnCustomerAdHoc := 0;
  
  case rdgrpAddressType.itemindex of
    1:  begin
          WOrder.ReturnCompany := ReturnCompany;
          Worder.ReturnCompanyBranch := ReturnCompanyBranch;
        end;
    2:  begin
          WOrder.ReturnCustomer := ReturnCustomer;
          WOrder.ReturnBranch := ReturnBranch;
        end;
    3:  begin
          WOrder.ReturnCustomerAdHoc := ReturnCustomerAdHoc;
        end;
  end;
  
    //  WOrder.WODate := PBDateStr(edtDate.text);
  WOrder.DateRequired := PBDateStr(edtDateReq.text);
  WOrder.EstimatedStartDate := PBDateStr(edtDateStart.text);
  WOrder.QuantityEst := strtoint(memActualQty.text);
  WOrder.QuantityAct := strtoint(memActualQty.text);
//  WOrder.OfficeContact := dblkpAccManager.KeyValue;

  {Go set the narrative for the different processes}
  UpdateProcessNotes;

  if (Mode = woAdd) or (Mode = woRaise) or (Mode = woRepeat) then
    begin
      WOrder.WODate := now;
      WOrder.WOStatus := 10;
    end;

  if chkbxComplete.checked then
    begin
      WOrder.WOStatus := 3000;
      for icount := 0 to pred(WOrder.Deliveries.Count) do
        begin
          if Worder.Deliveries[icount].DelivDateAct = 0 then
            begin
              Worder.deliveries[icount].DelivDateAct := date;
              Worder.deliveries[icount].QuantityAct := Worder.deliveries[icount].Quantity;
            end;
        end;
    end
  else
  if not chkbxComplete.checked and (WOrder.WOStatus = 3000) then
    begin
      WOrder.WOStatus := 20;
      for icount := 0 to pred(WOrder.Deliveries.Count) do
        begin
          Worder.deliveries[icount].DelivDateAct := 0;
          Worder.deliveries[icount].QuantityAct := 0;
        end;
    end;
  bOK := true;
  if (Mode = woAdd) or (Mode = woRaise) or (Mode = woChange) or (Mode = woRepeat) then
    begin
      WOrder.SaveToDB(true);
    end
  else
  if (Mode = woDelete) then
    begin
      WOrder.Inactive := 'Y';
      WOrder.DeleteFromDB;
    end;

  if (Mode = woAdd) or (Mode = woRepeat) then
    begin
      MessageDlg('The works instruction number is : ' + floatToStr(WOrder.WONumber), mtInformation, [mbOK], 0);
    end;

  ModalResult := mrOK;
end;

procedure TfrmPBMaintWorksOrders.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  if Mode = woView then exit;

  TempWord := MessageDlg('Do you want to save these order details?', mtConfirmation,
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
      if bOK <> true then
        Action := caNone;
    end;
end;

procedure TfrmPBMaintWorksOrders.edtPreviousWINChange(Sender: TObject);
begin
  try
    WOrder.WONumberPrevious := strtofloat((Sender as TEdit).text);
  except
    WOrder.WONumberPrevious := 0;
  end;
end;

procedure TfrmPBMaintWorksOrders.memDescriptionChange(Sender: TObject);
begin
  WOrder.Description := (Sender as TMemo).Text;
  CheckOK(self);
end;

procedure TfrmPBMaintWorksOrders.edtVersionNoChange(Sender: TObject);
begin
  WOrder.VersionNo := strtoint((Sender as TEdit).Text);
end;

procedure TfrmPBMaintWorksOrders.AddWOProcesses;
var
  WOProcess: TWOProcess;
  WOQuestion: TWOQuestion;
  inx: integer;
begin
  for inx := pred(WOrder.Processes.count) downto 0 do
    begin
      WOProcess := WOrder.Processes[inx];
      WOProcess.Parent.Processes.Delete(inx);
    end;

  with WOrder.DataModule.qryGetProcesses do
    begin
      close;
      parambyname('Production_Type').asinteger := WOrder.ProductionType;
      open;

      while eof <> true do
        begin
          WOProcess := TWOProcess.create(WOrder);
          WOProcess.Process := fieldbyname('Process').asinteger;
          WOProcess.ProcessName := fieldbyname('Process_Description').asstring;
          WOProcess.Narrative.dbkey := 0;
          WOProcess.WOProcessNo := WOProcess.Parent.Processes.Count + 1;
          WOProcess.Parent.Processes.Add(WOProcess);

          {Now add the associated questions}
          WOrder.DataModule.qryGetQuestions.close;
          WOrder.DataModule.qryGetQuestions.parambyname('Process').AsInteger := WOProcess.Process;
          WOrder.DataModule.qryGetQuestions.open;
          while WOrder.DataModule.qryGetQuestions.eof <> true do
            begin
              WOQuestion := TWOQuestion.Create(WOProcess);
              WOQuestion.Process := WOProcess.Process;
              WOQuestion.Question := WOrder.DataModule.qryGetQuestions.fieldbyname('Question').asinteger;
              WOQuestion.QuestionText := WOrder.DataModule.qryGetQuestions.fieldbyname('Question_text').asstring;
              WOQuestion.PromptType := WOrder.DataModule.qryGetQuestions.fieldbyname('Prompt_Type').asstring;
              WOQuestion.QuestionNo := WOQuestion.Parent.Questions.Count + 1;
              WOQuestion.Answer := '';
              WOQuestion.Parent.Questions.Add(WOQuestion);
              WOrder.DataModule.qryGetQuestions.next;
            end;
          next;
        end;
    end;
end;

procedure TfrmPBMaintWorksOrders.UpdateProcessNotes;
var
  icount: integer;
  tempMem, tempStaff, tempHours: TMemo;
  tempEdt, tempCustom: TEdit;
  tempSpn: TSpinEdit;
  tempRadgrp: TRadioGroup;
  tempDBlkp, tempWCGroup, tempWC: TDBLookupComboBox;
begin
  for icount := 0 to pred(WOrder.Processes.count) do
    begin
      {Get the process notes}
      tempMem := (findcomponent('mem'+inttostr(WOrder.Processes[icount].process)) as TMemo);
      WOrder.Processes[icount].Narrative.Data := tempMem.Text;
      if WOrder.dbKey = 0 then
        Worder.Processes[icount].Narrative.dbkey := 0;
      {Get the process Target Receipt dates}
      tempEdt := (findcomponent('edtReceiptDate'+inttostr(WOrder.Processes[icount].process)) as TEdit);
      tempCustom := (findcomponent('edtCustomSize'+inttostr(WOrder.Processes[icount].process)) as TEdit);
      tempMem := (findcomponent('memQuantity'+inttostr(WOrder.Processes[icount].process)) as TMemo);
      tempSpn := (findcomponent('spnNumberUp'+inttostr(WOrder.Processes[icount].process)) as TSpinEdit);
      tempRadGrp := (findcomponent('rdgrpFormat'+inttostr(WOrder.Processes[icount].process)) as TRadioGroup);
      tempDBlkp := (findcomponent('dblkpSize'+inttostr(WOrder.Processes[icount].process)) as TDBLookupComboBox);
      tempWCGroup := (findcomponent('dblkpMachineGroup'+inttostr(WOrder.Processes[icount].process)) as TDBLookupComboBox);
      tempWC := (findcomponent('dblkpMachine'+inttostr(WOrder.Processes[icount].process)) as TDBLookupComboBox);
      tempHours := (findcomponent('memHours'+inttostr(WOrder.Processes[icount].process)) as TMemo);
      tempStaff := (findcomponent('memStaff'+inttostr(WOrder.Processes[icount].process)) as TMemo);
      WOrder.Processes[icount].TargetDate := pbDatestr(tempEdt.Text);
      WOrder.Processes[icount].CustPaperSize := tempCustom.Text;
      WOrder.Processes[icount].Quantity := strtoint(tempmem.text);
      WOrder.Processes[icount].NumberUp := tempspn.Value;
      WOrder.Processes[icount].PaperSize := tempDBlkp.KeyValue;
      try
        WOrder.Processes[icount].NoOfHours := strtofloat(tempHours.Text);
      except
        WOrder.Processes[icount].NoOfHours := 0;
      end;

      try
        WOrder.Processes[icount].TeamCount := strtoint(tempStaff.text);
      except
        WOrder.Processes[icount].TeamCount := 0;
      end;

      try
        WOrder.Processes[icount].WorkCentreGroup := tempWCGroup.keyvalue;
      except
        WOrder.Processes[icount].WorkCentreGroup := 0;
      end;

      try
        WOrder.Processes[icount].WorkCentre := tempWC.keyvalue;
      except
        WOrder.Processes[icount].WorkCentre := 0;
      end;
      
      case tempRadGrp.ItemIndex of

        0: WOrder.Processes[icount].LaserFormat := 'N';
        1: WOrder.Processes[icount].LaserFormat := 'S';
        2: WOrder.Processes[icount].LaserFormat := 'D';

(*        0: WOrder.Processes[icount].LaserFormat := 'S';
        1: WOrder.Processes[icount].LaserFormat := 'D';
*)
      else
        WOrder.Processes[icount].LaserFormat := 'N';
      end;
    end;
end;

procedure TfrmPBMaintWorksOrders.ShowEvents;
begin
  ClearGrid(sgEvents);  {Clear contents of Line grid}
  BuildEventGrid;
  sgEventsClick(self);
end;

procedure TfrmPBMaintWorksOrders.ShowDeliveries;
begin
  ClearGrid(sgDelivs);  {Clear contents of Line grid}
  BuildDeliveryGrid;
end;

procedure TfrmPBMaintWorksOrders.ClearGrid(TempGrid: TStringGrid);
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

procedure TfrmPBMaintWorksOrders.BuildEventGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgEvents, WOrder.datamodule do
    begin
      for i := 0 to pred(WOrder.Events.count) do
        begin
        cells[0,i+1] := inttostr(WOrder.Events[i].EventNumber);
        cells[1,i+1] := pbDateStr(WOrder.Events[i].DateEntered);
        cells[2,i+1] := WOrder.Events[i].OperatorName;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeEvents.enabled := not (WOrder.Events.count = 0);
  btnDeleteEvents.enabled := not (WOrder.Events.count = 0);
end;

procedure TfrmPBMaintWorksOrders.BuildDeliveryGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgDelivs, WOrder.datamodule do
    begin
      for i := 0 to pred(WOrder.Deliveries.count) do
        begin
        cells[0,i+1] := inttostr(WOrder.Deliveries[i].DelivNumber);
        cells[1,i+1] := WOrder.Deliveries[i].CourierName;
        cells[2,i+1] := WOrder.Deliveries[i].ServiceDescr;
        cells[3,i+1] := inttostr(WOrder.Deliveries[i].Quantity);
        cells[4,i+1] := pbdatestr(WOrder.Deliveries[i].DelivDate);
        cells[5,i+1] := inttostr(WOrder.Deliveries[i].weight);
        cells[6,i+1] := pbdatestr(WOrder.Deliveries[i].DelivDateAct);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeDelivs.enabled := not (WOrder.Deliveries.count = 0);
  btnDeleteDelivs.enabled := not (WOrder.Deliveries.count = 0);
end;

procedure TfrmPBMaintWorksOrders.FormCreate(Sender: TObject);
begin
  SetGridHeaders;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TfrmPBMaintWorksOrders.sgEventsClick(Sender: TObject);
var
  WOEvent: TWOEvent;
  inx: integer;
begin
  inx := sgEvents.row;
  try
    inx := WOrder.Events.IndexOf(inx);
    WOEvent := WOrder.Events[inx];
    memEventNotes.Text := WOEvent.Narrative.Data;
  except
    memEventNotes.Lines.Clear;
  end;
end;

procedure TfrmPBMaintWorksOrders.sgEventsDblClick(Sender: TObject);
begin
  btnChangeEventsClick(self);
end;

procedure TfrmPBMaintWorksOrders.btnAddEventsClick(Sender: TObject);
begin
  CallMaintEvent(woevAdd);
end;

procedure TfrmPBMaintWorksOrders.CallMaintEvent(aMode : TwoevMode);
var
  inx : integer;
  WOEvent : TWOEvent;
  frm: TfrmPBMaintWOrderEvents;
begin
  inx := sgEvents.row;
  try
    frm := TfrmPBMaintWOrderEvents.Create(Self);
    try
      if aMode = woevAdd then
        WOEvent := TWOEvent.create(WOrder)
      else
      begin
        inx := WOrder.Events.IndexOf(inx);
        WOEvent := WOrder.Events[inx];
      end;
      Frm.WOEvent := WOEvent;
      Frm.Mode := aMode;
      Frm.OperatorName := Worder.OperatorName;
      Frm.Operator := WOrder.Operator;
      Frm.ShowModal;
      if (aMode = woevAdd) and (Frm.ModalResult <> mrOK) then
        WOEvent.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowEvents;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = woevAdd then
      begin
        inx := pred(WOrder.Events.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = woevDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgEvents.row := inx+1;
  end;
end;

procedure TfrmPBMaintWorksOrders.CallMaintDelivs(aMode : TwoDelivMode);
var
  inx : integer;
  WODeliv : TWODeliv;
  frm: TfrmPBMaintWOrderDelivs;
begin
  if (aMode = wodelChange) and (sgDelivs.cells[0,1] = '') then
    exit;
    
  inx := sgDelivs.row;
  try
    frm := TfrmPBMaintWOrderDelivs.Create(Self);
    try
      if aMode = wodelAdd then
        begin
          WODeliv := TWODeliv.create(WOrder);
          WODeliv.Quantity := round(WOrder.QuantityAct - WOrder.Deliveries.TotalAssigned);
          if round(WOrder.QuantityAct - WOrder.Deliveries.TotalAssigned) <= 0 then
            begin
              MessageDlg('The despatch details for the full quantity have been entered', mtInformation, [mbOk], 0);
              exit;
            end;
        end
      else
      begin
        inx := WOrder.Deliveries.IndexOf(inx);
        WODeliv := WOrder.Deliveries[inx];
      end;
      Frm.WODeliv := WODeliv;
      Frm.Mode := aMode;

      Frm.ShowModal;
      if (aMode = wodelAdd) and (Frm.ModalResult <> mrOK) then
        WODeliv.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowDeliveries;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = wodelAdd then
      begin
        inx := pred(WOrder.Deliveries.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = wodelDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgDelivs.row := inx+1;
  end;
  CheckOK(self);
end;

procedure TfrmPBMaintWorksOrders.btnChangeEventsClick(Sender: TObject);
begin
  CallMaintEvent(woevChange);

end;

procedure TfrmPBMaintWorksOrders.btnDeleteEventsClick(Sender: TObject);
begin
  CallMaintEvent(woevDelete);
end;

procedure TfrmPBMaintWorksOrders.btnAddDelivsClick(Sender: TObject);
begin
  CallMaintDelivs(wodelAdd);
end;

procedure TfrmPBMaintWorksOrders.btnChangeDelivsClick(Sender: TObject);
begin
  CallMaintDelivs(wodelChange);
end;

procedure TfrmPBMaintWorksOrders.btnDeleteDelivsClick(Sender: TObject);
begin
  CallMaintDelivs(wodelDelete);
end;

procedure TfrmPBMaintWorksOrders.sgDelivsDblClick(Sender: TObject);
begin
  btnChangeDelivsClick(self);
end;

procedure TfrmPBMaintWorksOrders.QuestionClick(Sender: TObject);
begin
 if Sender is TCheckBox then
  with Sender as TCheckBox do
    if Checked then
      SelectedProcess.Questions[Tag-999999].Answer := 'Y'
    else
      SelectedProcess.Questions[Tag-999999].Answer := 'N'
end;

procedure TfrmPBMaintWorksOrders.QuestionChange(Sender: TObject);
begin
 if Sender is TMemo then
  with Sender as TMemo do
    SelectedProcess.Questions[Tag-999999].Answer := (Sender as TMemo).Text
 else
 if Sender is TEDit then
  with Sender as TEdit do
    SelectedProcess.Questions[Tag-999999].Answer := (Sender as TEdit).Text
 else
 if Sender is TComboBox then
  with Sender as TComboBox do
    SelectedProcess.Questions[Tag-999999].Answer := (Sender as TComboBox).Text
 else
 if Sender is TSpinEdit then
  with Sender as TSpinEdit do
    SelectedProcess.Questions[Tag-999999].Answer := inttostr((Sender as TSpinEdit).Value);
end;

procedure TfrmPBMaintWorksOrders.QuestionDropDown(Sender: TObject);
var
  stext: string;
  stemp: string;
  iQuestion: integer;
begin
  with WOrder.DataModule do
  begin
    sTemp:= trim((Sender as TComboBox).Name);
    iQuestion := strtoint(copy(sTemp,4,3));
    qryGetQuestionList.Close;
    qryGetQuestionList.ParamByName('Process').AsInteger := SelectedProcess.Process;
    qryGetQuestionList.ParamByName('Question').AsInteger := iQuestion;
    qryGetQuestionList.Open;
    stext := (Sender as TComboBox).Text;
    (Sender as TComboBox).Items.Clear;
    while (not qryGetQuestionList.EOF) do
    begin
      (Sender as TComboBox).Items.Add(Trim(qryGetQuestionList.FieldByName('Question_List_Descr').AsString));
      qryGetQuestionList.Next;
    end;
    if (Sender as TComboBox).items.count = 1 then
      (Sender as TComboBox).Itemindex := 0
    else
      (Sender as TComboBox).Itemindex := (Sender as TComboBox).Items.IndexOf(stext);
    if (Sender as TComboBox).Itemindex = -1 then
      (Sender as TComboBox).Text := stext;
    qryGetQuestionList.Close;
  end;
end;

procedure TfrmPBMaintWorksOrders.tbProcessesEnter(Sender: TObject);
var
  inx: integer;
  tempTabSheet: TTabSheet;
  iProcess: integer;
begin
(*  inx := ((Sender as TTabSheet).pageindex+1);
  try
    inx := WOrder.Processes.IndexOf(inx);
    SelectedProcess := WOrder.Processes[inx];
  except
  end;
*)
  inx := ((Sender as TTabSheet).pageindex);
  tempTabSheet := pgProduction.Pages[inx];
  try
    iProcess := strtoint(copy(tempTabSheet.Name,6,10));
  except
    iProcess := 0;
  end;

  for inx := 0 to pred(WOrder.Processes.count) do
    begin
      if iProcess = WOrder.Processes[inx].Process then
        begin
          SelectedProcess := WOrder.Processes[inx];
          break;
        end;
    end;
end;

procedure TfrmPBMaintWorksOrders.SetSelectedProcess(
  const Value: TWOProcess);
begin
  FSelectedProcess := Value;
end;

procedure TfrmPBMaintWorksOrders.dblkpVatCodeClick(Sender: TObject);
begin
//  WOrder.VatCode := dblkpVatCode.keyvalue;
end;

procedure TfrmPBMaintWorksOrders.CallMaintJobBagScreen(aMode: TjbMode);
var
  Key : integer;
//  frm : TPBMaintJobBagDetsFrm;
  frm : TPBMaintJobBagFrm;
  aBag : TJobBag;
begin
  dmWOJobBag := TdmJobBag.Create(Self);

  Key := WOrder.JobBagNo;

(*
  if (aMode = jbChange) and (dbgDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status').asinteger >= 25) then
    begin
      if MessageDlg('This job bag has been ' +
        dbgDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring +
        ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
    end;

  if aMode = jbAdd then
    Key := 0
  else
    begin
  //    Key := dmJobBag.CurrentJobBag;  { Get it before we close dataset }
      Key := dbgDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;
    end;
*)

  try
    aBag := TJobBag.Create(dmWOJobBag);
    try
      aBag.DbKey := key;
      aBag.LoadFromDB;
      Frm := TPBMaintJobBagFrm.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.JobBag := aBag;
        Frm.bComefromOrder := true;
        Frm.ShowModal;
      finally
        Frm.Free;
      end;
    finally
      aBag.Free;
    end;
  finally
    dmWOJobBag.Free;
  end;
end;

procedure TfrmPBMaintWorksOrders.dblkpPriceUnitClick(Sender: TObject);
begin
//  WOrder.SellUnit := dblkpPriceUnit.keyvalue;
//  checkok(self);
end;

procedure TfrmPBMaintWorksOrders.Button1Click(Sender: TObject);
begin
  PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
  try
    PBLUCRepFrm.bIs_Lookup := True;
    if dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator) then
      PBLUCRepFrm.bAllow_Upd := false
    else
      PBLUCRepFrm.bAllow_Upd := True;

    PBLUCRepFrm.iCust := WOrder.Customer;
    PBLUCRepFrm.iBranch := WOrder.Branch;
    PBLUCRepFrm.sCustName := WOrder.CustomerName;
    PBLUCRepFrm.sBranchName := WOrder.BranchName;
    PBLUCRepFrm.ShowModal;
    if PBLUCRepFrm.bselected then
    begin
      WOrder.Rep := PBLUCRepFrm.SelCode;
      edtRep.Text := PBLUCRepFrm.SelName;
      GetCustomerReps(WOrder.Rep);
    end;
  finally
    PBLUCRepFrm.Free;
  end;
  CheckOK(self);
end;

procedure TfrmPBMaintWorksOrders.memActualQtyChange(Sender: TObject);
begin
  try
    WOrder.QuantityAct := strtofloat((Sender as TMemo).text);
  except
    WOrder.QuantityAct := 1;
  end;

  CheckOK(self);
end;

procedure TfrmPBMaintWorksOrders.chkbxPerso100Click(Sender: TObject);
begin
  if chkbxPerso100.checked then
    WOrder.IsPerso100 := 'Y'
  else
    WOrder.IsPerso100 := 'N';
end;

procedure TfrmPBMaintWorksOrders.btnAccountManagerClick(Sender: TObject);
begin
  if dmBroker.UseAccountManagers then
    begin
      PBLUAccountManagerFrm := TPBLUAccountManagerFrm.Create(Owner);
      try
        PBLUAccountManagerFrm.bIs_Lookup := True;
        PBLUAccountManagerFrm.bAllow_Upd := True;

        PBLUAccountManagerFrm.SelCode := WOrder.OfficeContact;
        PBLUAccountManagerFrm.ShowModal;
        if PBLUAccountManagerFrm.selected then
        begin
          WOrder.OfficeContact := PBLUAccountManagerFrm.SelCode;
          edtAccountManager.Text := PBLUAccountManagerFrm.SelName;
          WOrder.AccountTeam := PBLUAccountManagerFrm.SelTeam;
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

        PBLUOpsFrm.SelCode := WOrder.OfficeContact;
        PBLUOpsFrm.ShowModal;
        if PBLUOpsFrm.selected then
        begin
          WOrder.OfficeContact := PBLUOpsFrm.SelCode;
          WOrder.AccountManagerName := PBLUOpsFrm.SelName;
          edtAccountManager.Text := PBLUOpsFrm.SelName;
        end;
      finally
        PBLUOpsFrm.Free;
      end;
    end;
  CheckOK(self);
end;

procedure TfrmPBMaintWorksOrders.btnJobBagClick(Sender: TObject);
begin
  if (self.ComeFromJobBag) or (WOrder.JobBagNo = 0)then
    exit
  else
    CallMaintJobBagScreen(jbChange);
end;

procedure TfrmPBMaintWorksOrders.btnReceiptDateClick(Sender: TObject);
var
  NewDate: TDateTime;
  myEdit: TEdit;
begin
  myEdit := (findcomponent('edtReceiptDate'+inttostr(SelectedProcess.Process)) as TEdit);
  NewDate := InputDate(StrToDate(myEdit.text));
  myEdit.Text := PBDatestr(NewDate);
end;

procedure TfrmPBMaintWorksOrders.SetComeFromJobBag(const Value: boolean);
begin
  FComeFromJobBag := Value;
  btnCustomer.Enabled := not FComeFromJobBag;
(*  btnProductiontype.Visible := not FComeFromJobBag or (WOrder.JobBagNo <> 0);
  edtProductionType.Visible := btnProductionType.Visible;
  lblProductionType.Visible := btnProductionType.Visible;
*)
end;

procedure TfrmPBMaintWorksOrders.btnNotesClick(Sender: TObject);
var
  PBDBWOrderMemoFrm: TPBDBMemoFrm;
begin
  PBDBWOrderMemofrm := TPBDBMemoFrm.create(self);
  try
    if Mode = woView then
      PBDBWOrderMemofrm.bAllow_Upd := false
    else
      PBDBWOrderMemofrm.bAllow_Upd := true;

    PBDBWOrderMemofrm.Datamemo.text := WOrder.NarrativeText;
    PBDBWOrderMemofrm.ShowModal;
    WOrder.Narrativetext := PBDBWOrderMemofrm.Datamemo.text;
  finally
    PBDBWOrderMemofrm.free;
  end;
  checknotes(Self);
end;

procedure TfrmPBMaintWorksOrders.CheckNotes(Sender: TObject);
begin
  if trim(WOrder.NarrativeText) <> '' then
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

procedure TfrmPBMaintWorksOrders.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    btnNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TfrmPBMaintWorksOrders.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TfrmPBMaintWorksOrders.dblkpSizeClick(Sender: TObject);
var
  myEdit: TEdit;
begin
  myEdit := (findcomponent('edtCustomSize'+inttostr(SelectedProcess.Process)) as TEdit);
  with WOrder.DataModule.qryGetPaperSize do
    begin
      close;
      parambyname('Paper_Size').asinteger := (sender as TDBLookupComboBox).keyvalue;
      try
        open;
      except
      end;
      myEdit.Enabled := (fieldbyname('Paper_width_mm').asinteger = 0);
      if fieldbyname('Paper_width_mm').asinteger <> 0 then
        myEdit.Text := '';
    end;
end;

procedure TfrmPBMaintWorksOrders.pmnuProcessPopup(Sender: TObject);
var
  NewMenuItem: TMenuItem;
  icount: integer;
begin
  insertprocess1.Clear;
  with WOrder.DataModule.qryGetProcessList do
    begin
      close;
      open;
      icount := 0;
      while eof <> true do
        begin
          NewMenuItem := TMenuItem.Create(pmnuProcess);
          try
            NewMenuItem.caption := WOrder.DataModule.qryGetProcessList.fieldbyname('Process_Description').asstring;
            NewMenuItem.tag := WOrder.DataModule.qryGetProcessList.fieldbyname('Process').asinteger;
            NewMenuItem.OnClick := mnuProcessClick;
            insertprocess1.Insert(icount,NewMenuItem);
          except
            NewMenuItem.Free;
          end;

          icount := icount + 1;
          next;
        end;
    end;
end;

procedure TfrmPBMaintWorksOrders.mnuProcessClick(Sender: TObject);
var
  WOProcess: TWOProcess;
  WOQuestion: TWOQuestion;
  iPage, iCurrentPage: integer;
  sItemDesc: string;
begin
  iCurrentPage := pgProduction.ActivePageIndex;
  with (Sender as TMenuItem) do
    begin
      sItemDesc := stringreplace((Sender as TMenuItem).caption,'&','',[]);
      for ipage := 0 to pred(pgProduction.PageCount) do
        begin
          if pgProduction.Pages[ipage].Caption = sItemDesc then
            begin
              messagedlg('The selected process already exist, please select another', mtError,[mbOk], 0);
              exit;
            end;
        end;

      // Renumber the processes
(*      for iPage := icurrentPage to pred(WOrder.Processes.count) do
        begin
          WOrder.Processes[ipage].WOProcessNo := ipage+1;
        end;
*)
      WOProcess := TWOProcess.create(WOrder);
      WOProcess.Process := tag;
      WOProcess.ProcessName := caption;
      WOProcess.Narrative.dbkey := 0;
      WOProcess.Quantity := round(WOrder.QuantityAct);
      WOProcess.TargetDate := WOrder.EstimatedStartDate;
      WOProcess.NumberUp := 1;
      WOProcess.WOProcessNo := WOProcess.Parent.Processes.Count + 1;
      WOProcess.Parent.Processes.Add(WOProcess);

      {Now add the associated questions}
      WOrder.DataModule.qryGetQuestions.close;
      WOrder.DataModule.qryGetQuestions.parambyname('Process').AsInteger := WOProcess.Process;
      WOrder.DataModule.qryGetQuestions.open;
      while WOrder.DataModule.qryGetQuestions.eof <> true do
        begin
          WOQuestion := TWOQuestion.Create(WOProcess);
          WOQuestion.Process := WOProcess.Process;
          WOQuestion.Question := WOrder.DataModule.qryGetQuestions.fieldbyname('Question').asinteger;
          WOQuestion.QuestionText := WOrder.DataModule.qryGetQuestions.fieldbyname('Question_text').asstring;
          WOQuestion.PromptType := WOrder.DataModule.qryGetQuestions.fieldbyname('Prompt_Type').asstring;
          WOQuestion.QuestionNo := WOQuestion.Parent.Questions.Count + 1;
          WOQuestion.Answer := '';
          WOQuestion.Parent.Questions.Add(WOQuestion);
          WOrder.DataModule.qryGetQuestions.next;
        end;
    end;
  DeleteDataComponents;
  ShowProcesses;
  pgProduction.ActivePageIndex := iCurrentPage;
end;

procedure TfrmPBMaintWorksOrders.DeleteProcess1Click(Sender: TObject);
var
  inx, inxDeleted: integer;
  tempTabSheet: TTabSheet;
  iProcess: integer;
begin
  inx := pgProduction.activepageindex;
  inxDeleted := inx;

  tempTabSheet := pgProduction.Pages[inx];
  try
    iProcess := strtoint(copy(tempTabSheet.Name,6,10));
  except
    begin
      messagedlg('You cannot delete this page, this page is not a process!', mtError,[mbOk], 0);
      exit;
    end;
  end;

  for inx := 0 to pred(WOrder.Processes.count) do
    begin
      if iProcess = WOrder.Processes[inx].Process then
        begin
          if messagedlg('Delete the selected process from this Works Instruction?',
            mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              exit;
          WOrder.Processes.Delete(inx);
          DeleteDataComponents;
          ShowProcesses;
          try
            pgproduction.activePageindex := inxDeleted;
          except
            pgproduction.ActivePageIndex := 0;
          end;
          break;
        end;
    end;
end;

procedure TfrmPBMaintWorksOrders.edtDateReqExit(Sender: TObject);
var
  NewDate: TDateTime;
  tempStr: string;
begin
  try
    NewDate := StrToDate((Sender as Tedit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as Tedit).SetFocus;
      Exit;
    end;
  end;

  TempStr := Activecontrol.Name;
  if tempStr <> 'btnDateRequired' then
    begin
      if (NewDate < date) and (Mode = woAdd) then
      begin
        MessageDlg('Mailing Date must be on or after the current date', mtError, [mbOk], 0);
        edtDateReq.SetFocus;
        Exit;
      end;
    end;

  (Sender as Tedit).Text := PBDatestr(NewDate);
end;

procedure TfrmPBMaintWorksOrders.edtDateStartExit(Sender: TObject);
var
  NewDate: TDateTime;
  tempStr: string;
begin
  try
    NewDate := StrToDate((Sender as Tedit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as Tedit).SetFocus;
      Exit;
    end;
  end;

  TempStr := Activecontrol.Name;
  if tempStr <> 'btnDateStart' then
    begin
      if (NewDate < date) and (Mode = woAdd) then
      begin
        MessageDlg('Start Date must be on or later than the current date', mtError, [mbOk], 0);
        edtDateStart.SetFocus;
        Exit;
      end;
    end;

  (Sender as Tedit).Text := PBDatestr(NewDate);
end;

procedure TfrmPBMaintWorksOrders.edtDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
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

procedure TfrmPBMaintWorksOrders.DeleteDataComponents
;
var
  i: integer;
begin
  for i := pred(self.componentcount) downto 0 do
    begin
      if Components[i] is TQuery then
        TQuery(Components[i]).free
      else
      if Components[i] is TDataSource then
        TDataSource(Components[i]).free
    end;
end;

procedure TfrmPBMaintWorksOrders.FormResize(Sender: TObject);
var
  myScrollbox: TScrollbox;
  myPanel: TPanel;
  iProcess: integer;
begin
  if FActivated = true then
    begin
      ResizeProcessTab
    end;
end;

procedure TfrmPBMaintWorksOrders.ResizeProcessTab;
var
  myScrollbox: TScrollbox;
  myPanel: TPanel;
  iProcess: integer;
begin
  for iProcess := 0 to pred(WOrder.Processes.Count) do
    begin
      myScrollBox := (findcomponent('scrl'+inttostr(WOrder.Processes[iProcess].Process)) as TScrollBox);
      myScrollbox.Width := trunc(pgProduction.Width / 2);

      myPanel := (findcomponent('pnl'+inttostr(WOrder.Processes[iProcess].Process)) as TPanel);
      myPanel.Width := trunc(pgProduction.Width / 2);
    end;
end;

procedure TfrmPBMaintWorksOrders.dblkpMachineGroupClick(Sender: TObject);
begin
  SelectedProcess.WorkCentreGroup := (sender as TDBLookupComboBox).KeyValue;
  GetWorkCentres(SelectedProcess);
end;

procedure TfrmPBMaintWorksOrders.GetWorkCentres(tmpProcess: TWOProcess);
var
  myQuery: TQuery;
begin
  myQuery := (findcomponent('qryWC'+inttostr(tmpProcess.process)) as TQuery);
  with myQuery do
    begin
      close;
      sql.clear;
      if tmpProcess.WorkCentre <> 0 then
        begin
          SQL.Text := 'select work_centre, Work_Centre_Name from Work_Centre where Work_Centre = ' + inttostr(tmpProcess.WorkCentre) + ' ';
          SQL.Text := SQL.Text + 'UNION ';
        end;
      SQL.Text := SQL.Text + WorkCentreSQL;
      parambyname('Work_Centre_Group').asinteger := tmpProcess.WorkCentreGroup;
      open;
    end;
end;

procedure TfrmPBMaintWorksOrders.rdgrpAddressTypeClick(Sender: TObject);
begin
  {Setup the address box}
  case rdgrpAddressType.ItemIndex of
    0:
      begin
        AddrTypeLabel.Caption := 'N/A';
        AddrGrpBox.enabled := false;
        ClearReturnAddress;
        exit;
      end;
    1:
      begin
        AddrTypeLabel.Caption := 'Company';
        AddrGrpBox.enabled := dmBroker.UseCompanyBranch;
        if ReturnCompany = 0 then
          begin
            ReturnCompany := 1;
            ReturnCompanyBranch := 0;
          end;
        BranchNameLabel.Visible := AddrGrpBox.enabled;
        BranchNameEdit.Visible := BranchNameLabel.Visible
      end;
    2:
      begin
        AddrTypeLabel.Caption := 'Customer';
        AddrGrpBox.enabled := true;
        if ReturnCustomer = 0 then
          begin
            ReturnCustomer := WOrder.Customer;
            ReturnBranch := WOrder.Branch;
          end;
        BranchNameLabel.Visible := True;
        BranchNameEdit.Visible := True;
      end;
    3:
      begin
        AddrTypeLabel.Caption := 'Ad Hoc';
        AddrGrpBox.enabled := true;
        BranchNameLabel.Visible := False;
        BranchNameEdit.Visible := False;
      end;
  end;

  ShowAddress(Self);
end;

procedure TfrmPBMaintWorksOrders.SearchBtnClick(Sender: TObject);
begin
  {Access the searches}
  case rdgrpAddressType.ItemIndex of
    1:
      begin
        PBLUCompBranchFrm := TPBLUCompBranchFrm.Create(Self);
        try
          PBLUCompBranchFrm.bIs_Lookup := True;
          PBLUCompBranchFrm.bAllow_Upd := False;
          PBLUCompBranchFrm.SelCode := ReturnCompanyBranch;
          PBLUCompBranchFrm.ShowModal;
          if PBLUCompBranchFrm.Selected then
          begin
            ReturnCompanyBranch := PBLUCompBranchFrm.SelCode;
          end;
        finally
          PBLUCompBranchFrm.Free;
        end;
      end;
    2:
      begin
        PBLUCustFrm := TPBLUCustFrm.Create(Self);
        try
          PBLUCustFrm.bIs_Lookup := True;
          PBLUCustFrm.bAllow_Upd := False;
          PBLUCustFrm.bSel_Branch := True;
          PBLUCustFrm.SelCode := ReturnCustomer;
          PBLUCustFrm.SelBranch := ReturnBranch;
          PBLUCustFrm.ShowModal;
          if PBLUCustFrm.Selected then
          begin
            ReturnCustomer := PBLUCustFrm.SelCode;
            ReturnBranch := PBLUCustFrm.SelBranch;
          end;
        finally
          PBLUCustFrm.Free;
        end;
      end;
    3:
      begin
        PBLUAdHocFrm := TPBLUAdHocFrm.Create(Self);
        try
          PBLUAdHocFrm.bIs_Lookup := True;
          PBLUAdHocFrm.bAllow_Upd := True;
          PBLUAdHocFrm.Customer := WOrder.Customer;
          PBLUAdHocFrm.SelCode := ReturnCustomerAdHoc;
          PBLUAdHocFrm.ShowModal;
          if PBLUAdHocFrm.Selected then
            ReturnCustomerAdHoc := PBLUAdHocFrm.SelCode;
        finally
          PBLUAdHocFrm.Free;
        end;
      end;
  end;
  ShowAddress(Self);
end;

procedure TfrmPBMaintWorksOrders.ShowAddress(Sender: TObject);
begin
  {Diplay the address on-screen}
  with WOrder.Datamodule do
    case rdgrpAddressType.ItemIndex of
      1: GetReturnAddress(0, ReturnCompanyBranch, 1);
      2: GetReturnAddress(ReturnCustomer, ReturnBranch, 2);
      3: GetReturnAddress(ReturnCustomerAdHoc, 0, 3);
    end;

  with WOrder.Datamodule.dtsAddress.DataSet do
    begin
    NameEdit.Text := FieldByName('Name').AsString;
    if (rdgrpAddressType.ItemIndex = 1) or (rdgrpAddressType.ItemIndex = 2) then
      BranchNameEdit.Text := FieldByName('Branch_Name').AsString;
    BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
    StreetEdit.Text := FieldByName('Street').AsString;
    LocaleEdit.Text := FieldByName('Locale').AsString;
    TownEdit.Text := FieldByName('Town').AsString;
    PostCodeEdit.Text := FieldByName('PostCode').AsString;
    CountyEdit.Text := FieldByName('County').AsString;
  end;
end;


procedure TfrmPBMaintWorksOrders.ShowReturnAddress;
begin
  {Set up the Return Address type}
  if WOrder.ReturnCompany <> 0 then
    begin
      ReturnCompany := WOrder.ReturnCompany;
      ReturnCompanyBranch := WOrder.ReturnCompanyBranch;
      rdgrpAddressType.ItemIndex := 1;
    end
  else
  if WOrder.ReturnCustomer <> 0 then
    begin
      ReturnCustomer := WOrder.ReturnCustomer;
      ReturnBranch := WOrder.ReturnBranch;
      rdgrpAddressType.ItemIndex := 2;
    end
  else
  if WOrder.ReturnCustomerAdHoc <> 0 then
    begin
      ReturnCustomerAdhoc := WOrder.ReturnCustomerAdhoc;
      rdgrpAddressType.ItemIndex := 3;
    end
  else
    begin
      rdgrpAddressType.ItemIndex := 0;
    end;
end;

procedure TfrmPBMaintWorksOrders.ClearReturnAddress;
begin
  NameEdit.text := '';
  BranchNameEdit.text := '';
  BuildingEdit.text := '';
  StreetEdit.text := '';
  LocaleEdit.text := '';
  TownEdit.text := '';
  Postcodeedit.text := '';
  CountyEdit.text := '';
end;

procedure TfrmPBMaintWorksOrders.SetReturnBranch(const Value: integer);
begin
  FReturnBranch := Value;
end;

procedure TfrmPBMaintWorksOrders.SetReturnCompany(const Value: integer);
begin
  FReturnCompany := Value;
end;

procedure TfrmPBMaintWorksOrders.SetReturnCompanyBranch(
  const Value: integer);
begin
  FReturnCompanyBranch := Value;
end;

procedure TfrmPBMaintWorksOrders.SetReturnCustomer(const Value: integer);
begin
  FReturnCustomer := Value;
end;

procedure TfrmPBMaintWorksOrders.SetReturnCustomerAdhoc(
  const Value: integer);
begin
  FReturnCustomerAdhoc := Value;
end;

function TfrmPBMaintWorksOrders.ReturnAddressRequired: boolean;
var
  icount: integer;
begin
  Result := false;
  with WOrder do
    begin
      for icount := 0 to pred(deliveries.count) do
        begin
          if deliveries[icount].ReturnAddressRequired then
            begin
              Result := true;
              exit;
            end;
        end;
    end;
end;

end.
