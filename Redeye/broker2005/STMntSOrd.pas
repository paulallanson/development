unit STMntSOrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, ComCtrls, Grids, STSOObjects,
  Menus, CCSCommon, PBJobBagDM, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
type
  TSTMntSOrdFrm = class(TForm)
    FlashTimer: TTimer;
    pnlTop: TPanel;
    Label5: TLabel;
    Label8: TLabel;
    OrdNoLabel: TLabel;
    Label2: TLabel;
    DateEdit: TEdit;
    DateBitBtn: TBitBtn;
    DtReqEdit: TEdit;
    DtReqBitBtn: TBitBtn;
    pnlFooter: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlAddCharges: TPanel;
    pMnuMaint: TPopupMenu;
    LineAddBitBtn: TMenuItem;
    LineDelBitBtn: TMenuItem;
    LineChgBitBtn: TMenuItem;
    pMnuView: TPopupMenu;
    SelectBitBtn: TMenuItem;
    Label10: TLabel;
    memoTotal: TMemo;
    NotesBitBtn: TBitBtn;
    pnlDetails: TPanel;
    pnlLines: TPanel;
    LineDetsStringGrid: TStringGrid;
    pnlHead: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    CustNameEdit: TEdit;
    CustBitBtn: TBitBtn;
    ContactEdit: TEdit;
    SelContactBtn: TButton;
    OrdEdit: TEdit;
    dbLkpCmbRep: TDBLookupComboBox;
    DeliveryBitBtn: TBitBtn;
    DeliveryEdit: TEdit;
    dblkpReplType: TDBLookupComboBox;
    pnlWarehouse: TPanel;
    Label14: TLabel;
    StoreComboBox: TDBLookupComboBox;
    pnlSupplier: TPanel;
    Label4: TLabel;
    Label15: TLabel;
    edtSupplier: TEdit;
    btnSupplierLU: TBitBtn;
    dblkpOrdertype: TDBLookupComboBox;
    Label16: TLabel;
    ExtChgDetsStringGrid: TStringGrid;
    ExtChgMenu: TPopupMenu;
    ChrgAddBitBtn: TMenuItem;
    ChrgChgBitBtn: TMenuItem;
    ChrgDelBitBtn: TMenuItem;
    pnlDeliveryType: TPanel;
    RdBtnToCust: TRadioButton;
    RDBtnToAdHoc: TRadioButton;
    N1: TMenuItem;
    LineSerialNos: TMenuItem;
    btnAddService: TMenuItem;
    btnDelivery: TBitBtn;
    FalshTimerDelNotes: TTimer;
    qryVATCode: TFDQuery;
    dtsVatCode: TDataSource;
    Label18: TLabel;
    cmbbxOrderType: TComboBox;
    rdbtnToProduction: TRadioButton;
    lblJobBagCaption: TLabel;
    lblJobBagNo: TLabel;
    stsbrDetails: TStatusBar;
    Label20: TLabel;
    OfficeComboBox: TDBLookupComboBox;
    Label17: TLabel;
    chkbxDoNotInvc: TCheckBox;
    lblFAO: TLabel;
    edtFAO: TEdit;
    chkbxAuthorise: TCheckBox;
    chkbxCashSale: TCheckBox;
    pnlCostCentre: TPanel;
    Label12: TLabel;
    edtCostCentre: TEdit;
    btnCostCentre: TBitBtn;
    qryGetStockAlloc: TFDQuery;
    chkbxInactive: TCheckBox;
    ChangePrices1: TMenuItem;
    Change1: TMenuItem;
    mnuAddItem: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure ShortNameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure CustNameEditChange(Sender: TObject);
    procedure DateBitBtnClick(Sender: TObject);
    procedure CustBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DeleteLines(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DescrEditChange(Sender: TObject);
    procedure DtReqBitBtnClick(Sender: TObject);
    procedure DetsGrpBoxClick(Sender: TObject);
    procedure ShowLineGrid(Sender: TObject);
    procedure ShowQtyLineGrid(Sender: TObject);
    procedure ShowExtChgGrid(Sender: TObject);
    procedure LineAddBitBtnClick(Sender: TObject);
    procedure LineChgBitBtnClick(Sender: TObject);
    procedure LineDelBitBtnClick(Sender: TObject);
    procedure SetupDetails(Sender: TObject);
    procedure LineDetsStringGridSelectCell(Sender: TObject;
  Col, Row: Longint; var CanSelect: Boolean);
    procedure LineDetsStringGridDrawCell(Sender: TObject; vCol,
  vRow: Longint; Rect: TRect; State: TGridDrawState);
    procedure SelContactBtnClick(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure btnCostCentreClick(Sender: TObject);
    procedure LineDetsStringGridDblClick(Sender: TObject);
    procedure OrdEditChange(Sender: TObject);
    procedure DateEditExit(Sender: TObject);
    procedure DtReqEditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure LineDetsStringGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RepBitBtnClick(Sender: TObject);
    procedure edtDeliveryNotesChange(Sender: TObject);
    procedure DeliveryBitBtnClick(Sender: TObject);
    procedure dbLkpCmbRepClick(Sender: TObject);
    procedure btnSupplierLUClick(Sender: TObject);
    procedure dblkpReplTypeClick(Sender: TObject);
    procedure dblkpOrdertypeClick(Sender: TObject);
    procedure StoreComboBoxClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure ChrgAddBitBtnClick(Sender: TObject);
    procedure ChrgChgBitBtnClick(Sender: TObject);
    procedure ChrgDelBitBtnClick(Sender: TObject);
    procedure ExtChgDetsStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure ExtChgMenuPopup(Sender: TObject);
    procedure RdBtnToCustClick(Sender: TObject);
    procedure RDBtnToAdHocClick(Sender: TObject);
    procedure ExtChgDetsStringGridDrawCell(Sender: TObject; VCol,
      VRow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ExtChgDetsStringGridDblClick(Sender: TObject);
    procedure pMnuMaintPopup(Sender: TObject);
    procedure LineSerialNosClick(Sender: TObject);
    procedure btnAddServiceClick(Sender: TObject);
    procedure btnDeliveryClick(Sender: TObject);
    procedure FalshTimerDelNotesTimer(Sender: TObject);
    procedure chkbxDoNotInvcClick(Sender: TObject);
    procedure cmbbxOrderTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdbtnToProductionClick(Sender: TObject);
    procedure btnAccountManagerClick(Sender: TObject);
    procedure edtFAOChange(Sender: TObject);
    procedure CustNameEditExit(Sender: TObject);
    procedure ChangePrices1Click(Sender: TObject);
    procedure pMnuViewPopup(Sender: TObject);
  private
    FJobBagNo: integer;
    function GetSelectedCharge: TExtraCharge;
    procedure CheckDeliveryNotes(Sender: TObject);
    procedure ShowHeaderDetails;
    procedure SetJobBagNo(const Value: integer);
    procedure AllocateStock;
    procedure UpdateStatus;
    procedure SaveCustomerContactStatus;
    procedure CreateDeliveryDetails;
  private
    { Private declarations }
    bOrderDelivered: bytebool;
    bAutoAllocate: bytebool;
    bReadytoInvoice: ByteBool;
    bNotesFlash: ByteBool;
    bDeliveryFlash: ByteBool;
    CostCentreLevel: string;
    sBranch: string;
    sDelCustName: string;
    sDelBranchName: string;
    FActiveDone: Boolean;
    FFuncMode: Char;
    FSelectedLineIndex: Integer;
    bDisableLineNameChangeEvent : Boolean;
    Disc_Val : real;
    disc_type : string;
    FSelectedRepPercIndex: Integer;
    FSelectedChargeIndex: Integer;
    //temporary holder of SO Head Status if the user clicks Do Not Inv by mistake
    trueSOHeadStat: integer;
    function GetSelectedLine: TOrderLine;
    function getselectedRepPerc: TRepLine;
    function OKAdding: Boolean;
    function OKChanging: Boolean;
    function OKDeleting: Boolean;
    function HasCostCentres: Boolean;
    function GetPartDescription(sPart: string; irow: integer): boolean;
    function GetSellPrice(TempPart: string): real;
    function GetOrderValue: real;
    procedure DeleteSerialNos(const inx: integer);
    procedure SaveSerialNos(const inx: integer);
    procedure UpdateSOLines;
    procedure UpdateRepPerc;
    procedure UpdateJobBagLine(Query: TFDQuery; const inx: Integer);
    procedure CreateExtraChargeLine;
    procedure UpdateExtraCharges;
    procedure RecalcTotals;
    procedure CallExtChgMaintScreen(sTempFuncMode: Char);
    procedure DeleteJobBagLine(Query: TFDQuery; const inx: Integer);
    procedure DeleteJobBagRequest(Query: TFDQuery; const inx: Integer);
    procedure DefContact(iTempCust, iTempBranch: Integer);
    procedure CallLineDetailsMaintScreen(sTempFuncMode: Char);
    procedure CallLineMaintScreen(sTempFuncMode: Char);
    procedure CallServiceMaintScreen(sTempFuncMode: Char);
    procedure HandleSOLine(Query: TFDQuery; const inx: Integer);
    procedure HandleJobBagLine(Query: TFDQuery; const inx: Integer);
    procedure HandleJobBagRequest(Query: TFDQuery; const inx: Integer);
    procedure HandleSORepPerc(Query: TFDQuery; const inx: integer);
    procedure GetSupplierOrderTypes;
    procedure DisplaySourceDetails;
    procedure SetDeliverTo;
    property SelectedCharge: TExtraCharge read GetSelectedCharge;
  public
    FAddJobBag: boolean;
    FaddJobBagReq: boolean;
    SalesOrderNo: integer;
    bOK: Boolean;
    iCst_Cntr_Count : integer;
    fTempOrdTot: Real ;
    property FuncMode: Char read FFuncMode write FFuncMode;
    property JobBagNo: integer read FJobBagNo write SetJobBagNo;
    property SelectedLine: TOrderLine read GetSelectedLine;
    property SelectedLineIndex: Integer read FSelectedLineIndex;
    property SelectedRepPerc: TRepLine read GetSelectedRepPerc;
    property SelectedRepPercIndex: Integer read FSelectedRepPercIndex;
    property SelectedChargeIndex: Integer read FSelectedChargeIndex;
    end;

var
  STMntSOrdFrm: TSTMntSOrdFrm;

implementation

uses STSODataMod, DateSelV5, STMaintSOrdLineServ, STMaintSOrdLine, PBDBMemo, PBLUCust,
  pbMainMenu, PBLUCustCstCntr, STMaintSinvExtChg, STMaintSOrdSerialNos, PBLUCConta,
  PBImages, PBLUAdHoc, PBLUSupp, STMntSOrdSpecIn, PBLUProductionLoc,
  PBLUAccountManager, pbDatabase, PBLUBranchCstCntr, STStockDM, STMaintSOrdLinePrices;

var
  CSDBSOMemoFrm: TPBDBMemoFrm;
  CSLUCContaFrm: TPBLUCContaFrm;
  CSLUAdHocFrm: TPBLUAdHocFrm;
  CSLUSuppFrm: TPBLUSuppFrm;

{$R *.DFM}

procedure TSTMntSOrdFrm.FormActivate(Sender: TObject);
var
  custStatus: string;
begin
  if not FActiveDone then
  try
    ShowLineGrid(Self);
    CheckOK(Self);
  finally
    FActiveDone := True;
  end;

  chkbxAuthorise.visible := (SalesOrder.SOHeadStatus < 10);

  if SalesOrder.SOHeadStatus < 200 then
    custStatus := dmBroker.GetCustomerStatus(SalesOrder.Customer);

  if (custStatus = 'S') or (custStatus = 'B') then
    MessageDlg(cOnStop, mtWarning,[mbOk], 0)
  else
  if custStatus = 'O' then
    MessageDlg(cOverDue, mtWarning,[mbOk], 0);

  dblkpCmbRep.enabled := not dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator);
end;

procedure TSTMntSOrdFrm.CheckOK(Sender: TObject);
begin
{Enable/disable OK button} ;
if ffuncMode = soDelete then
  OKBitBtn.Enabled := true
else
    OKBitBtn.Enabled := (Trim(CustNameEdit.Text) <> '') and
    (Trim(DateEdit.Text) <> '') and
    (Trim(DTReqEdit.Text) <> '') and
    (Trim(OrdEdit.Text) <> '') and
    (Trim(ContactEdit.text) <> '') and
    (OfficeCombobox.keyvalue <> 0) and
    (Trim(DeliveryEdit.text) <> '') and
    (dbLkpCmbRep.keyvalue <> 0) and
    (((SalesOrder.ReplenishSource = 2) and (storecombobox.text <> '')) or
     (((SalesOrder.ReplenishSource = 1) or (SalesOrder.ReplenishSource = 3)) and (DbLkpOrderType.text <> '') and (Trim(edtSupplier.Text) <> ''))) and
    (SalesOrder.OrderLines.Count > 0);
end;

procedure TSTMntSOrdFrm.CancelBitBtnClick(Sender: TObject);
begin
(*  if FuncMode <> 'S' then
    begin
    if MessageDlg('Do you want to cancel any changes?', mtConfirmation,
      [mbYes, mbNo], 0) = mrNo then
    begin
      Exit;
    end;
    end;
*)
  Close ;
end;

procedure TSTMntSOrdFrm.ShortNameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntSOrdFrm.OKBitBtnClick(Sender: TObject);
var
  lineInx: integer;
  iStock, iNonStock, iService, iPrintOnDemand: integer;
begin
  if (FSelectedLineIndex = -1) and (FFuncMode = soChange) then
  begin
    if MessageDlg('There are now no lines on this order. ' +
      'Do you want to delete it ?',
      mtConfirmation, [mbOK, mbAbort], 0) = mrOK then
      FFuncMode := soDelete
    else
      Exit;
  end;

  iStock := 0;
  iNonStock := 0;
  iservice := 0;
  iPrintOnDemand := 0;

  bOrderDelivered := false;
  bAutoAllocate := false;

  for lineInx := 0 to salesOrder.OrderLines.Count - 1 do
    begin
      if salesOrder.OrderLines[lineinx].PartClass = 'STK' then
        inc(iStock)
      else
      if salesOrder.OrderLines[lineinx].PartClass = 'NSTK' then
        inc(iNonStock)
      else
      if salesOrder.OrderLines[lineinx].PartClass = 'SERV' then
        inc(iService)
      else
      if salesOrder.OrderLines[lineinx].PartClass = 'POD' then
        inc(iPrintOnDemand);
    end;

  if (FFuncMode = soAdd) or (FFuncMode = soCopy) or (FFuncMode = soChange) or (FFuncMode = soChangeHead) then
  begin
    if iService = salesOrder.OrderLines.Count then
      begin
        if MessageDlg('All items on this order are service items, do you want to make this order available for invoicing?', mtWarning,
        [mbYes, mbNo], 0) = mrYes then
          begin
            bReadytoInvoice := true;
            SalesOrder.SOHeadStatus := 150;
          end;
      end
    else
    if iPrintOnDemand = salesOrder.OrderLines.Count then
      begin
        if MessageDlg('All items on this order are print on demand items, do you want to make this order available for invoicing?', mtWarning,
        [mbYes, mbNo], 0) = mrYes then
          begin
            bOrderDelivered := true;

            for lineInx := 0 to salesOrder.OrderLines.Count - 1 do
              begin
                SalesOrder.OrderLines[lineInx].DelQty := SalesOrder.OrderLines[lineInx].OrdQty;
              end;
              
            bReadytoInvoice := true;
            SalesOrder.SOHeadStatus := 150;
          end;
      end;
  end;

  if FFuncMode <> soDelete then
  begin
    //run thru the order lines, if a part is numbered but no serial numbers have been allocated
    //warn the user and do not save the order.
    for lineInx := 0 to salesOrder.OrderLines.Count - 1 do
    begin
      if ((STSalesOrdDM.GetPartNumbered(SalesOrder.OrderLines[lineInx].Part)) and
          (SalesOrder.OrderLines[lineInx].SerialNumbers.Count = 0)) then
      begin
        messageDlg(SalesOrder.OrderLines[lineInx].Part + ' is numbered stock. You must assign serial numbers to the stock in this order.',
                   mtWarning, [mbOK], 0);
        self.LineDetsStringGrid.Row := lineInx + 1;
        self.LineDetsStringGrid.Col := 1;
        exit;
      end;
    end;
  end;

  if STSalesOrdDM.IsCustomerOnStop(SalesOrder.Customer) then
    begin
      if MessageDlg('This Customer is currently ON STOP, do you want to save these order details?', mtWarning,
        [mbYes, mbNo], 0) = mrNo then
          exit;
    end;
(*  else if MessageDlg('Do you want to save these order details?', mtConfirmation,
    [mbYes, mbNo], 0) = mrNo then
      Exit;
*)

  if (SalesOrder.SOHeadStatus < 10) and chkbxAuthorise.checked then
    SalesOrder.SOHeadStatus := 10;

  if chkbxCashSale.checked then
    SalesOrder.CashSale := 'Y'
  else
    SalesOrder.CashSale := 'N';

  if chkbxInactive.checked then
    SalesOrder.Inactive := 'Y'
  else
    SalesOrder.Inactive := 'N';

  Screen.Cursor := crHourGlass;
  try
    if (FFuncMode = soAdd) then
      bOK := OKAdding
    else
    if (FFuncMode = soChange) or (FFuncMode = soChangeHead) then
      bOK := OKChanging
    else
    if FFuncMode = soDelete then
      bOK := OKDeleting
    else
      bOK := True;

    {Now Allocate Stock}
    if (iStock > 0) and dmBroker.AutoAllocateStock and (SalesOrder.SOHeadStatus < 50) and (SalesOrder.ReplenishSource >= 2) then
      begin
        if MessageDlg('Do you want to allocate stock to the items on this order?', mtInformation,
              [mbYes, mbNo], 0) = mrYes then
            AllocateStock;
      end;

    {If Print On Demand}
    if bOrderDelivered then
      begin
        CreateDeliveryDetails;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
  if bOK then
    Close;
end;

procedure TSTMntSOrdFrm.CreateDeliveryDetails;
var
  iCount: integer;
begin
  {Delete any existing Delivery details}
  with stSalesOrdDM.DelDelivLineDetsSQL do
    begin
      close;
      parambyname('Sales_order').asinteger := SalesOrder.SONumber;
      execsql;
    end;

  with stSalesOrdDM.DelDelivDetsSQL do
    begin
      close;
      parambyname('Sales_order').asinteger := SalesOrder.SONumber;
      execsql;
    end;

  {Add the delivery details}
  with stSalesOrdDM.AddDelivDetSQL do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      ParamByName('Sales_Order_Deliv').AsInteger := 1;
      ParamByName('Del_Dt').AsDateTime := PBDateStr(DtReqEdit.text);
      ParamByName('Desp_Note_No').AsString := inttostr(SalesOrder.SONumber) + '01';
      ParamByName('Delivery_Instructions').asstring := SalesOrder.DeliveryNotes;
      ParamByName('Del_Type').clear;
      ParamByname('Courier').clear;
      ExecSQL;
    end;

  for icount := 0 to pred(SalesOrder.OrderLines.count) do
    begin
      with stSalesOrdDM.AddDelivLineDetSQL do
        begin
          Close;
          ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
          ParamByName('Sales_order_Line_No').AsInteger := icount+1;
          ParamByName('Sales_Order_Deliv').AsInteger := 1;
          ParamByName('Quantity_Delivered').AsInteger := SalesOrder.OrderLines[icount].OrdQty;
          ParamByName('Quantity_Picked').AsInteger := SalesOrder.OrderLines[icount].OrdQty;
          ExecSQL;
        end;
    end;
end;

procedure TSTMntSOrdFrm.AllocateStock;
var
  ilines: integer;
  iTempQty: integer;
begin
  {Firstly check that there is enough stock}
  with qryGetStockAlloc do
    begin
      close;
      ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      ParamByName('Part').AsString := '%' ;
      ParamByName('Part_Store').AsInteger := SalesOrder.PartStore;
      open;

      first;
      while eof <> true do
        begin
          if FieldByName('Qty_free').AsInteger < (FieldByName('Quantity_Ordered').AsInteger + FieldByName('Quantity_Overs').AsInteger) then
            begin
              messagedlg('There is insufficient free stock to allocate to all items on this order, cannot proceed with stock allocation',
                            mtError, [mbOK], 0);
              exit;
            end;
          next;
        end;
    end;

  {Do the allocation}
  for iLines := 0 to pred(SalesOrder.orderlines.count) do
      begin
        iTempQty := (SalesOrder.orderlines[iLines].OrdQty + SalesOrder.orderlines[iLines].OversQty - SalesOrder.orderlines[iLines].DelQty - SalesOrder.orderlines[iLines].AllocQty);
        {allocate as much stock as required/available} ;
        if iTempQty <= STStockDataMod.CheckFreePickStock(SalesOrder.PartStore, SalesOrder.orderlines[iLines].Part) then
          begin
            {Actually do the stock allocation} ;
            STStockDataMod.AllocStock(SalesOrder.PartStore, SalesOrder.orderlines[iLines].Part, SalesOrder.SONumber, iTempQty, 1, SalesOrder.orderlines[iLines].Line, 'D','') ;
          end
        else
          begin
            STStockDataMod.AllocStock(SalesOrder.PartStore, SalesOrder.orderlines[iLines].Part, SalesOrder.SONumber,
            STStockDataMod.CheckFreePickStock(SalesOrder.PartStore, SalesOrder.orderlines[iLines].Part), 1, SalesOrder.orderlines[iLines].Line, 'D','') ;
          end;
      end;
  SalesOrder.SOHeadStatus := 50;
  UpdateStatus;
end;

procedure TSTMntSOrdFrm.NameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntSOrdFrm.CustNameEditChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTMntSOrdFrm.DateBitBtnClick(Sender: TObject);
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DateEdit.Text);
    DateSelV5Form.ShowModal;
    DateEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
    SalesOrder.datepoint := DateSelV5Form.MonthCalendar1.Date;
  finally
    DateSelV5Form.Free;
  end;
CheckOK(Self) ;
end;

procedure TSTMntSOrdFrm.CustBitBtnClick(Sender: TObject);
var
  i: integer;
  custStatus: string;
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_LookUp := True ;
    PBLUCustFrm.bAllow_Upd := True ;
    PBLUCustFrm.bSel_Branch := True ;
    PBLUCustFrm.SelCode := SalesOrder.Customer;
    PBLUCustFrm.SelBranch := SalesOrder.BranchNo;
    PBLUCustFrm.ShowModal;
    If PBLUCustFrm.Selected then
      begin
      CostCentreLevel := PBLUCustFrm.SelCCLevel;
      pnlCostCentre.visible := CostCentreLevel <> '';
      custStatus := dmBroker.GetCustomerStatus(PBLUCustFrm.SelCode);
(*      custOnStop := PBPODM.IsCustomerOnStop(PBLUCustFrm.SelCode);
      try
        blockOnStopCust := dmBroker.qryCompany.FieldByName('OnStop').asString = 'Y';
      except
        blockOnStopCust := false;
      end;

      if (custOnStop = false)
        OR ((custOnStop = true) AND (blockOnStopCust = false)) then
*)
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

        LineDetsStringGrid.enabled := True;
        if (SalesOrder.Customer <> PBLUCustFrm.SelCode)
          or (SalesOrder.BranchNo <> PBLUCustFrm.SelBranch) then
          begin
            if ffuncmode = soadd then
            begin
              SalesOrder.SOHeadStatus := soCreated;
              for i := 0 to pred(SalesOrder.OrderLines.Count) do
                SalesOrder.OrderLines[i].SOLineStatus := slNotYetSent;
            end;
            defContact(PBLUCustFrm.selcode, PBLUCustFrm.SelBranch);
          end;
        SalesOrder.Customer := PBLUCustFrm.SelCode;
        CustNameEdit.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
        sBranch := PBLUCustFrm.SelBranchName;
        SalesOrder.BranchNo := PBLUCustFrm.SelBranch;
        if deliveryEdit.text = '' then
          begin
            if dmBroker.DefaulttoLastDelivery then
              begin
              with stSalesOrdDM.qryGetSOLastDelivery do
                begin
                  close;
                  parambyname('Customer').asinteger := SalesOrder.Customer;
                  parambyname('Branch_no').asinteger := SalesOrder.BranchNo;
                  open;
                  if recordcount = 0 then
                    begin
                      SalesOrder.deliveryCustomer := SalesOrder.Customer;
                      SalesOrder.DeliveryBranch := SalesOrder.Branchno;
                    end
                  else
                    begin
                      if fieldbyname('Ad_Hoc_Address').asinteger <> 0 then
                        begin
                          rdbtntoCust.Checked := false;
                          rdbtntoAdhoc.checked := true;
                          rdbtntoProduction.checked := false;
                          SalesOrder.AdhocAddress := fieldbyname('Ad_Hoc_Address').asinteger;
                          SalesOrder.deliveryCustomer := 0;
                          SalesOrder.DeliveryBranch := 0;
                        end
                      else
                        begin
                          rdbtntoCust.Checked := true;
                          rdbtntoAdhoc.checked := false;
                          rdbtntoProduction.checked := false;
                          SalesOrder.AdhocAddress := 0;
                          SalesOrder.deliveryCustomer := fieldbyname('Delivery_Customer').asinteger;
                          SalesOrder.DeliveryBranch := fieldbyname('Delivery_Branch').asinteger;
                        end;
                    end;
                end;
              end
            else
              begin
                SalesOrder.deliveryCustomer := SalesOrder.Customer;
                SalesOrder.DeliveryBranch := SalesOrder.Branchno;
              end;
            DeliveryEdit.text :=  STSalesOrdDM.GetCustName(SalesOrder.DeliveryCustomer)
                                + '/' + STSalesOrdDM.GetCustBranchName(SalesOrder.DeliveryCustomer,SalesOrder.DeliveryBranch);
          end;

        {Display Rep}
        dbLkpCmbRep.keyvalue := STSalesOrdDM.DefaultRep(PBLUCustFrm.SelCode,PBLUCustFrm.SelBranch);
        dbLkpCmbRepClick(Self);
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
  CheckOK(Self) ;
end;

procedure TSTMntSOrdFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);
  with IniFile do
    begin
      WriteString('Redeye', 'Replenishment Type', inttostr(dblkpReplType.keyvalue));
      Free;
    end;

  STStockDataMod.Free ;
  STSalesOrdDM.Free ;
  SalesOrder.Free;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;


procedure TSTMntSOrdFrm.DeleteLines(Sender: TObject);
begin
{Delete the detail lines} ;
end;

procedure TSTMntSOrdFrm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  iReplenishType: integer;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      iReplenishType := strtoint(ReadString('Redeye', 'Replenishment Type', '2'));
      Free;
    end;

  {Activate the invoice method SQL}
  CSDBSOMemoFrm := TPBDBMemoFrm.Create(Self);
  CSDBSOMemoFrm.bAllow_Upd := True;
  STSalesOrdDM := TStSalesOrdDM.Create(Self);
  STStockDataMod := TSTStockDataMod.Create(Self) ;
  with StSalesOrdDM do
  begin
    OperatorSQL.Close;
    OperatorSQL.Open;
    DefWHouseSQL.Close;
    DefWHouseSQL.Open;
    StoreSQL.Close;
    StoreSQL.Open;
    RepSourceSQL.Close;
    RepSourceSQL.Open;

//    dblkprepltype.keyvalue := 2; {Replenish from Warehouse}
    dblkprepltype.keyvalue := iReplenishType;
    GetPartSQL.close;
    GetPartSQL.open;
    end;
  { Create objects we need }
  SalesOrder := TSalesOrder.Create(STSalesOrdDM);

  {Display Supplier selection as default}
  pnlSupplier.Visible := true;
  pnlSupplier.Top := pnlWarehouse.top;
  pnlSupplier.left := pnlWarehouse.left;
  pnlSupplier.bevelOuter := bvNone;
//  windowstate := wsMaximized ;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TSTMntSOrdFrm.DescrEditChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TSTMntSOrdFrm.DtReqBitBtnClick(Sender: TObject);
begin
 DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DtReqEdit.Text);
    DateSelV5Form.ShowModal;
    DtReqEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
CheckOK(Self) ;
end;

function TSTMntSOrdFrm.GetSelectedLine: TOrderLine;
begin
 if FSelectedLineIndex < 0 then
    Result := nil
  else
    Result := SalesOrder.OrderLines[FSelectedLineIndex];
end;

function TSTMntSOrdFrm.OKAdding: Boolean;
begin
  Result := False;
  if SalesOrder.OrderLines.Count = 0 then
  begin
    MessageDlg('You must add some lines to the order first', mtError,
      [mbOK], 0);
    Exit;
  end;
  SalesOrder.SoNumber := STSalesOrdDM.GetNextSONumber;
  CSDBSOMemoFrm.UpdMemoData(Self);
  with STSalesOrdDM.AddSQL, SalesOrder do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := SONumber;
    if OfficeComboBox.KeyValue = 0 then
      ParamByName('Office_Contact').AsInteger := frmpbMainMenu.iOperator
    else
      ParamByName('Office_Contact').AsInteger := OfficeComboBox.KeyValue;

    ParambyName('Account_Team').asinteger := AccountTeam;
//    ParamByName('Office_Contact').AsInteger := OfficeContact;
    ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
    ParamByName('Date_Reqd').AsDateTime := StrToDate(DtReqEdit.Text);
    ParamByName('Date_Ordrd').AsDateTime := StrToDate(DateEdit.Text);
    ParamByName('Cust_Order_No').AsString := CustOrderNo;
    ParamByName('Delivery_Contact_Name').Asstring := FAO;
    ParamByName('Customer').AsInteger := Customer;
    ParamByName('Branch_No').AsInteger := BranchNo;

    if CostCentre = '' then
      begin
        ParamByName('Cost_Centre').clear;
        ParamByName('Customer0').clear;
      end
    else
      begin
        ParamByName('Cost_Centre').Asstring := CostCentre;
        ParamByName('Customer0').AsInteger := Customer;
      end;

    if AdHocAddress = 0 then
      ParamByName('Ad_Hoc_Address').clear
    else
      ParamByName('Ad_Hoc_Address').AsInteger := AdHocAddress;

    if ProductionLocation = 0 then
      ParamByName('Production_Location').clear
    else
      ParamByName('Production_Location').AsInteger := ProductionLocation;

    Parambyname('Cash_Sales').asstring := CashSale;
    Parambyname('inactive').asstring := inactive;

    ParamByName('Order_Type').AsString := SOType;
    if bReadyToInvoice then
      ParamByName('Sales_Order_Head_Status').AsInteger := soHeadStatus
    else
      ParamByName('Sales_Order_Head_Status').AsInteger := soCreated;

     if CSDBSOMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBSOMemoFrm.iNarr;
    ParamByName('Contact_No').AsInteger := CustomerContactNo;
    ParamByName('Delivery_Notes').Asstring := DeliveryNotes;
    ParamByName('Delivery_Customer').Asinteger := DeliveryCustomer;
    ParamByName('Delivery_Branch').Asinteger := DeliveryBranch;
    Parambyname('Replenish_source').asinteger := ReplenishSource;
    if (ReplenishSource = 1) or (ReplenishSource = 3) then   {Supplier}
      begin
        Parambyname('Supplier').asinteger := Supplier;
        Parambyname('Branch_no0').asinteger := BranchNo0;
        Parambyname('Supp_Order_type').asstring := trim(SupplierOrderType);
        parambyname('Part_Store').asinteger := PartStore;
      end
    else                          {Warehouse}
      begin
        parambyname('Part_Store').asinteger := PartStore;
        Parambyname('Supplier').clear;
        Parambyname('Branch_no0').clear;
        Parambyname('Supp_Order_type').clear;
      end;
    ExecSQL;
  end;
  UpdateSOLines;
  UpdateRepPerc;
  CreateExtraChargeLine;
  SaveCustomerContactStatus;
  MessageDlg('The sales order number is : ' +
    IntToStr(SalesOrder.SONumber), mtInformation, [mbOK], 0);
  Result := True;
end;

function TSTMntSOrdFrm.OKChanging: Boolean;
begin
Result := True;
    CSDBSOMemoFrm.UpdMemoData(Self);
   try
    {Update an existing code}
    with StSalesOrdDM.UpdSQL, SalesOrder do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := SONumber;

      if OfficeComboBox.KeyValue = 0 then
        ParamByName('Office_Contact').AsInteger := frmPBMainMenu.iOperator
      else
        ParamByName('Office_Contact').AsInteger := OfficeComboBox.KeyValue;

      ParambyName('Account_Team').asinteger := AccountTeam;
//      ParamByName('Office_Contact').AsInteger := OfficeContact;
      ParamByName('Contact_No').AsInteger := CustomerContactNo;
      ParamByName('Part_Store').AsInteger := StoreComboBox.KeyValue;
      ParamByName('Date_Ordrd').AsDateTime := StrToDate(DateEdit.Text);
      ParamByName('Date_Reqd').AsDateTime := StrToDate(DtReqEdit.Text);
      ParamByName('Delivery_Contact_Name').Asstring := FAO;
      ParamByName('Cust_order_No').AsString := CustOrderNo;
      ParamByName('Customer').AsInteger := Customer;
      ParamByName('Branch_No').AsInteger := BranchNo;

      if CostCentre = '' then
        begin
          ParamByName('Cost_Centre').clear;
          ParamByName('Customer0').clear;
        end
      else
        begin
          ParamByName('Cost_Centre').Asstring := CostCentre;
          ParamByName('Customer0').AsInteger := Customer;
        end;

      ParamByName('Sales_Order_Head_Status').AsInteger := SOHeadStatus;
      if AdHocAddress = 0 then
        ParamByName('Ad_Hoc_Address').clear
      else
        ParamByName('Ad_Hoc_Address').AsInteger := AdHocAddress;

      if ProductionLocation = 0 then
        ParamByName('Production_Location').clear
      else
        ParamByName('Production_Location').AsInteger := ProductionLocation;

      if CSDBSOMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBSOMemoFrm.iNarr;
      ParamByName('Delivery_Notes').Asstring := DeliveryNotes;
      ParamByName('Delivery_Customer').Asinteger := DeliveryCustomer;
      ParamByName('Delivery_Branch').Asinteger := DeliveryBranch;
      Parambyname('Replenish_source').asinteger := ReplenishSource;
      if (ReplenishSource = 1) or (ReplenishSource = 3) then   {Supplier}
        begin
          Parambyname('Supplier').asinteger := Supplier;
          Parambyname('Branch_no0').asinteger := BranchNo0;
          Parambyname('Supp_Order_type').asstring := trim(SupplierOrderType);
          parambyname('Part_Store').asinteger := PartStore;
        end
      else                          {Warehouse}
        begin
          parambyname('Part_Store').asinteger := PartStore;
          Parambyname('Supplier').clear;
          Parambyname('Branch_no0').clear;
          Parambyname('Supp_Order_type').clear;
        end;
      ParamByName('Order_Type').asString := SOType;
      ParamByName('Cash_Sales').asString := CashSale;
      ParamByName('inactive').asString := inactive;

      ExecSQL;
    end;
(*    if FFuncMode = soChangeHead then
      begin
        UpdateRepPerc;
        UpdateExtraCharges;
        exit;
      end;
*)
    UpdateSOLines;
    UpdateRepPerc;
    UpdateExtraCharges;
    SaveCustomerContactStatus
    except on E: Exception do
    begin
      Result := False;
      MessageDlg('Error during update: ' + E.Message, mtError, [mbAbort], 0);
    end;
  end;
end;

function TSTMntSOrdFrm.OKDeleting: Boolean;
var
icount: integer;
begin
 Result := False;
  if MessageDlg('Really delete these details ?', mtConfirmation,
    [mbNo, mbYes], 0) <> mrYes then
  begin
    Close;
    Exit;
  end;
  with StSalesOrdDM, SalesOrder do
  begin
  for icount := 0 to Pred(SalesOrder.RepLines.Count) do
    begin
     HandleSORepPerc(StSalesOrdDM.DelSOLineRepPercSQL, icount);
    end;
    DeleteSOPORef(SONumber);
    DeleteSOSerialNos(SONumber);
    DeleteSORep(SONumber);
    DeleteSOSundry(SONumber);
    DeleteCharges(SONumber);
    if CSDBSOMemoFrm.iNarr <> 0 then
      DeleteSONarrative(CSDBSOMemoFrm.iNarr);
    DeleteSOLines(SONumber);
    DeleteSalesOrder(SONumber);
  end;
  Result := True;
end;

procedure TSTMntSOrdFrm.UpdateSOLines;
var
  icount, iLine: Integer;
begin
  iLine := 0;
  {Update the sales order lines}
  for icount := 0 to Pred(SalesOrder.OrderLines.Count) do
  begin
    if SalesOrder.OrderLines[icount].ActnTkn = 'A' then
      begin
        iLine := iLine + 1;
        HandleSOLine(STSalesOrdDM.AddSOLineSQL, icount);
        if FAddJobBag then
          HandleJobBagLine(STSalesOrdDM.AddJobBagSQL, icount)
        else
        if FaddJobBagReq then
          HandleJobBagRequest(STSalesOrdDM.AddJobBagReqSQL, icount);
      end
    else
    if (SalesOrder.OrderLines[icount].ActnTkn = 'C') or (SalesOrder.OrderLines[icount].ActnTkn = '') then
      begin
        iLine := iLine + 1;
        HandleSOLine(STSalesOrdDM.UpdSOLineSQL, icount);
        if FAddJobBag then
          UpdateJobBagLine(STSalesOrdDM.UpdJobBagSQL, icount);
      end
    else
    if SalesOrder.OrderLines[icount].ActnTkn = 'D' then
      begin
        if FAddJobBag then
          DeleteJobBagLine(STSalesOrdDM.DelJobBagSQL, icount)
        else
        if FaddJobBagReq then
          DeleteJobBagRequest(STSalesOrdDM.DelJobBagReqSQL, icount);
        HandleSOLine(StSalesOrdDM.DelSOLineSQL, icount);
      end;
  end;
end;

procedure TSTMntSOrdFrm.DeleteJobBagLine(Query: TFDQuery;
  const inx: Integer);
var
  dmJobBag : TdmJobBag;
  iJobBag: Integer;
begin

//  GetCompany;
  dmJobBag := TdmJobBag.Create(Self);
  try
    with Query, SalesOrder.OrderLines[inx] do
    begin
      iJobBag := JobBagNo;
      close;
      ParamByName('Job_Bag').asinteger := iJobBag;
      ParamByName('Sales_Order').asfloat := SalesOrder.SONumber;
      ParamByName('Sales_Order_Line_No').AsInteger := Line;
      execsql;
    end;
  finally
    dmJobBag.Free;
  end;
end;

procedure TSTMntSOrdFrm.UpdateJobBagLine(Query: TFDQuery;
  const inx: Integer);
var
  dmJobBag : TdmJobBag;
  i, iJobBag, iJobBagLine: Integer;
begin

  dmJobBag := TdmJobBag.Create(Self);
  try
    with Query, SalesOrder.OrderLines[inx] do
    begin

      iJobBag := JobBagNo;
      for i := 0 to Pred(Params.Count) do
        Params[i].Clear;

      ParamByName('Job_Bag').asinteger := iJobBag;
      ParamByName('Job_Bag_Line_Type').Asstring := 'S';
      ParamByName('Sales_Order').asfloat := SalesOrder.SONumber;
      ParamByName('Sales_Order_Line_No').AsInteger := Line;
      ParamByName('Job_Bag_Line_Descr').AsString :=  Part + ' - ' + STSalesOrdDM.GetPartDescr(Part);
      with dmJobBag do
      begin
        ParamByName('Job_Bag_Line_Cost').AsFloat :=
          CalculateStockPrice(PurchPackQuantity, OrdQty, Part_Cost);
        ParamByName('Job_Bag_Line_Sell').AsFloat :=
          CalculateStockPrice(SellPackQuantity, OrdQty, Sell_Price);
      end;
      if SalesOrder.SOHeadStatus >= 250 then
        ParamByName('Job_Bag_Line_Invoiced').AsString := 'Y'
      else if SalesOrder.SOHeadStatus >= 200 then
        ParamByName('Job_Bag_Line_Invoiced').AsString := 'P'
      else
        ParamByName('Job_Bag_Line_Invoiced').AsString := 'N';
      ParamByName('Job_Bag_Quantity').AsFloat := OrdQty;
      ParamByName('Vat_Code').AsInteger := VATCode;
      ParamByName('Supplier').Asinteger := STSalesOrdDM.GetCompanySupplier;
      ParamByName('Branch_no').AsInteger := STSalesOrdDM.GetCompanySupplierBranch;
      if STSalesOrdDM.GetPartProductType(Part) = 0 then
        ParamByName('Product_type').clear
      else
        ParamByName('Product_type').AsInteger := STSalesOrdDM.GetPartProductType(Part);
      ExecSQL;
    end;
  finally
    dmJobBag.Free;
  end;
end;

procedure TSTMntSOrdFrm.HandleJobBagLine(Query: TFDQuery;
  const inx: Integer);
var
  dmJobBag : TdmJobBag;
  i, iJobBag, iJobBagLine: Integer;
begin

//  GetCompany;
  dmJobBag := TdmJobBag.Create(Self);
  try
    with Query, SalesOrder.OrderLines[inx] do
    begin
      iJobBag := JobBagNo;
      for i := 0 to Pred(Params.Count) do
        Params[i].Clear;

      ParamByName('Job_Bag').asinteger := iJobBag;
      if JobBagNo > 0 then
        ParamByName('Job_Bag_Line').AsInteger := STSalesOrdDM.GetNextJobBagLineNumber(iJobBag)
      else
        begin
          if iJobBagLine = 0 then
            ParamByName('Job_Bag_Line').AsInteger := 1
          else
            ParamByName('Job_Bag_Line').AsInteger := iJobBagLine;
        end;
      ParamByName('Job_Bag_Line_Type').Asstring := 'S';
      ParamByName('Sales_Order').asfloat := SalesOrder.SONumber;
//      ParamByName('Sales_Order_Line_No').AsInteger := inx;
      ParamByName('Sales_Order_Line_No').AsInteger := Line;
      ParamByName('Job_Bag_Line_Descr').AsString := Part + ' - ' + STSalesOrdDM.GetPartDescr(Part);
      with dmJobBag do
      begin
        ParamByName('Job_Bag_Line_Cost').AsFloat :=
          CalculateStockPrice(PurchPackQuantity, OrdQty, Part_Cost);
        ParamByName('Job_Bag_Line_Sell').AsFloat :=
          CalculateStockPrice(SellPackQuantity, OrdQty, Sell_Price);
      end;
      if SalesOrder.SOHeadStatus >= 250 then
        ParamByName('Job_Bag_Line_Invoiced').AsString := 'Y'
      else if SalesOrder.SOHeadStatus >= 200 then
        ParamByName('Job_Bag_Line_Invoiced').AsString := 'P'
      else
        ParamByName('Job_Bag_Line_Invoiced').AsString := 'N';
      ParamByName('Job_Bag_Quantity').AsFloat := OrdQty;
      ParamByName('Vat_Code').AsInteger := VATCode;
      ParamByName('Supplier').Asinteger := STSalesOrdDM.GetCompanySupplier;
      ParamByName('Branch_no').AsInteger := STSalesOrdDM.GetCompanySupplierBranch;
      if STSalesOrdDM.GetPartProductType(Part) = 0 then
        ParamByName('Product_type').clear
      else
        ParamByName('Product_type').AsInteger := STSalesOrdDM.GetPartProductType(Part);
      ParamByname('Sequence_no').AsInteger := STSalesOrdDM.GetNextJobBagLineNumber(iJobBag);
      ExecSQL;
    end;
  finally
    dmJobBag.Free;
  end;
end;

procedure TSTMntSOrdFrm.DetsGrpBoxClick(Sender: TObject);
begin
 if SalesOrder.SOHeadStatus > shCreated then
    MessageDlg('You can''t change the sales order header because some lines '
      + 'have been sent to the customer', mtError, [mbOK], 0);
end;

procedure TSTMntSOrdFrm.ShowLineGrid(Sender: TObject);
var
  TempFrom, TempTo: string;
  TempCount: Integer;
  inx: Integer;
begin
  If (FuncMode = 'S') or (FuncMode = 'H') then
    begin
      ShowQtyLineGrid(Self);
      Exit;
    end;
  LineDetsStringGrid.ColWidths[7] := -1;
  for TempCount := 0 to LineDetsStringGrid.RowCount do
    begin
    LineDetsStringGrid.rows[TempCount].clear;
    end;
  LineDetsStringGrid.Cells[0, 0] := 'Line';
  LineDetsStringGrid.Cells[1, 0] := 'Part';
  LineDetsStringGrid.Cells[2, 0] := 'Description';
  LineDetsStringGrid.Cells[3, 0] := 'Pack Size';
  LineDetsStringGrid.Cells[4, 0] := 'Quantity';
  LineDetsStringGrid.Cells[5, 0] := 'Price';
  LineDetsStringGrid.Cells[6, 0] := 'Total';
  LineDetsStringGrid.Cells[0, 1] := '';
  LineDetsStringGrid.Cells[1, 1] := '';
  LineDetsStringGrid.Cells[2, 1] := '';
  LineDetsStringGrid.Cells[3, 1] := '';
  LineDetsStringGrid.Cells[4, 1] := '';
  LineDetsStringGrid.Cells[5, 1] := '';
  LineDetsStringGrid.Cells[6, 1] := '';
  TempFrom := '';
  TempTo := 'ZZZ';
  inx := 0;
  fTempOrdTot := 0;
{  if SalesOrder.OrderLines.Count = 0 then
    LineDetsStringGrid.enabled := False
  else
    LineDetsStringGrid.enabled := True;  }
  for TempCount := 0 to Pred(SalesOrder.OrderLines.Count) do
    with SalesOrder.OrderLines[TempCount] do
    begin
        with LineDetsStringGrid do
        begin
          if ActnTkn <> 'D' then
          begin
          Inc(inx);
          Cells[0, inx] := IntToStr(inx);//IntToStr(Line);
          Cells[1, inx] := Part;
          if LineIsSample then
            Cells[2, inx] := STSalesOrdDM.GetPartDescr(Part) + ' (SAMPLE)'
          else
            Cells[2, inx] := STSalesOrdDM.GetPartDescr(Part);
          Cells[3, inx] := IntToStr(sellPackQuantity);
          //STSalesOrdDM.GetSellUnit(Part);
//          Cells[4, inx] := FormatQty(OrdQty);
          Cells[4, inx] := OrdQtyinPacks;
          Cells[5, inx] := FormatMoneyto3Dp(Sell_Price);
          Cells[6, inx] := FormatMoney((Ordqty / SellPackQuantity)*Sell_Price);
          Cells[7, inx] := 'C';
          fTempOrdTot := fTempOrdTot + ((Ordqty / SellPackQuantity)*Sell_Price);
      end;
    end;
  end;
  if inx > 0 then
    LineDetsStringGrid.RowCount := inx + 1
  else
    LineDetsStringGrid.RowCount := 2;
  LineChgBitBtn.Enabled := inx > 0;
  LineDelBitBtn.Enabled := inx > 0;
  SelectBitBtn.Enabled := inx > 0;

  if inx > 0 then
    begin
      FSelectedLineIndex := 0;
      LineDetsStringGrid.Cells[0, inx+1] := '';
      LineDetsStringGrid.Cells[1, inx+1] := '';
      LineDetsStringGrid.Cells[2, inx+1] := '';
      LineDetsStringGrid.Cells[3, inx+1] := '';
      LineDetsStringGrid.Cells[4, inx+1] := '';
      LineDetsStringGrid.Cells[5, inx+1] := '';
      LineDetsStringGrid.Cells[6, inx+1] := '';
      LineDetsStringGrid.Cells[7, inx+1] := '';
      end
    else
    FSelectedLineIndex := -1;
    ShowExtChgGrid(Self);
    memoTotal.text := CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(fTempOrdTot+SalesOrder.ExtraCharges.Total)) ;
end;

procedure TSTMntSOrdFrm.LineAddBitBtnClick(Sender: TObject);
begin
  { Is there any more room ? }
  if SalesOrder.OrderLines.NextLineNumber < 1 then
    MessageDlg('Maximum number of lines already on this order', mtError,
      [mbAbort], 0)
  else
  begin
    CallLineMaintScreen(soAdd);
    LineDetsStringGrid.row := LineDetsStringGrid.rowcount - 1;
  end;
end;

procedure TSTMntSOrdFrm.LineChgBitBtnClick(Sender: TObject);
begin
  if (SelectedLine.SOLineStatus >= slSalesInvoiceRaised) then
    MessageDlg('This line has been invoiced' +
      ', you cannot change it', mtError, [mbOK], 0)
  else
    CallLineMaintScreen(soChange);
end;

procedure TSTMntSOrdFrm.LineDelBitBtnClick(Sender: TObject);
var
  tempInx: integer;
  tempPartCode: string;
  contractNo: integer;
begin
  if (SelectedLine.SOLineStatus >= slSalesInvoiceRaised) then
    MessageDlg('This line has been invoiced' +
      ', you cannot delete it', mtError, [mbOK], 0)
  else
  begin
    CallLineMaintScreen(soDelete);
    tempPartCode :=
      self.LineDetsStringGrid.Cells[1, self.LineDetsStringGrid.Row];
    tempInx := SalesOrder.OrderLines.IndexFromPartCode(tempPartCode);
    if tempInx <> -1 then
      FSelectedLineIndex := tempInx;
  end;
end;

procedure TSTMntSOrdFrm.CallLineMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  OrderLine: TOrderLine;
  iOrder: Integer;
begin
  if sTempFuncMode = soAdd then
  begin
    iOrder := SalesOrder.OrderLines.NextLineNumber;
    OrderLine := TOrderLine.Create;
    OrderLine.Line := iOrder;
    OrderLine.SOLineStatus := slNotYetSent;
    OrderLine.ActnTkn := 'A';
    end
  else
    OrderLine := SelectedLine.Clone;

  if OrderLine.PartClass = 'SERV' then
    begin
      STMaintSOrdLineServFrm := TSTMaintSOrdLineServFrm.Create(Self);
      try
        STMaintSOrdLineServFrm.FuncMode := sTempFuncMode;
        STMaintSOrdLineServFrm.SalesOrder := SalesOrder;
        STMaintSOrdLineServFrm.SONumber := SalesOrder.SONumber;
        STMaintSOrdLineServFrm.OrderLine := OrderLine;
        STMaintSOrdLineServFrm.ShowModal;
        bTempOK := STMaintSOrdLineServFrm.bOK;
      finally
        STMaintSOrdLineServFrm.Free;
      end;
    end
  else
    begin
      STMaintSOrdLineFrm := TSTMaintSOrdLineFrm.Create(Self);
      try
        STMaintSOrdLineFrm.FuncMode := sTempFuncMode;
        STMaintSOrdLineFrm.SalesOrder := SalesOrder;
        STMaintSOrdLineFrm.SONumber := SalesOrder.SONumber;
        STMaintSOrdLineFrm.OrderLine := OrderLine;
        STMaintSOrdLineFrm.Supplier := SalesOrder.Supplier;
        STMaintSOrdLineFrm.BranchNo := SalesOrder.BranchNo0;
        STMaintSOrdLineFrm.PartStore := SalesOrder.PartStore;
        STMaintSOrdLineFrm.ReplenishSource := SalesOrder.ReplenishSource;

        if SalesOrder.ReplenishSource = 1 then
          begin
            STMaintSOrdLineFrm.lblSource.Caption := 'Supplier: ';
            STMaintSOrdLineFrm.lblReplenishName.Caption := edtSupplier.text;
          end
        else
          begin
            STMaintSOrdLineFrm.lblSource.Caption := 'Warehouse: ';
            STMaintSOrdLineFrm.lblReplenishName.Caption := StoreComboBox.text;
          end;

        STMaintSOrdLineFrm.ShowModal;
        bTempOK := STMaintSOrdLineFrm.bOK;
      finally
        STMaintSOrdLineFrm.Free;
      end;
    end;
  if bTempOK then
  begin
    if sTempFuncMode = soAdd then
      SalesOrder.OrderLines.Add(OrderLine)
    else
      if sTempFuncMode = soChange then
      begin
        SalesOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        OrderLine.Free;
      end
      else { Must be delete }
      begin
        SalesOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        OrderLine.Free;
      end;
    ShowLineGrid(Self);
  end
  else
    OrderLine.Free;
  CheckOK(Self);
end;

procedure TSTMntSOrdFrm.CallServiceMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  OrderLine: TOrderLine;
  iOrder: Integer;
begin
  if sTempFuncMode = soAdd then
  begin
    iOrder := SalesOrder.OrderLines.NextLineNumber;
    OrderLine := TOrderLine.Create;
    OrderLine.Line := iOrder;
    OrderLine.SOLineStatus := slNotYetSent;
    OrderLine.ActnTkn := 'A';
    end
  else
    OrderLine := SelectedLine.Clone;
  STMaintSOrdLineServFrm := TSTMaintSOrdLineServFrm.Create(Self);
  try
    STMaintSOrdLineServFrm.FuncMode := sTempFuncMode;
    STMaintSOrdLineServFrm.SalesOrder := SalesOrder;
    STMaintSOrdLineServFrm.SONumber := SalesOrder.SONumber;
    STMaintSOrdLineServFrm.OrderLine := OrderLine;
    STMaintSOrdLineServFrm.ShowModal;
    bTempOK := STMaintSOrdLineServFrm.bOK;
  finally
    STMaintSOrdLineServFrm.Free;
  end;
  if bTempOK then
  begin
    if sTempFuncMode = soAdd then
      SalesOrder.OrderLines.Add(OrderLine)
    else
      if sTempFuncMode = soChange then
      begin
        SalesOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        OrderLine.Free;
      end
      else { Must be delete }
      begin
        SalesOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        OrderLine.Free;
      end;
    ShowLineGrid(Self);
  end
  else
    OrderLine.Free;
  CheckOK(Self);
end;

procedure TSTMntSOrdFrm.CallLineDetailsMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  OrderLine: TOrderLine;
  iOrder: Integer;
begin
  OrderLine := SelectedLine.Clone;
  STMaintSOrdLinePricesFrm := TSTMaintSOrdLinePricesFrm.Create(Self);
  try
    STMaintSOrdLinePricesFrm.FuncMode := sTempFuncMode;
    STMaintSOrdLinePricesFrm.SalesOrder := SalesOrder;
    STMaintSOrdLinePricesFrm.SONumber := SalesOrder.SONumber;
    STMaintSOrdLinePricesFrm.OrderLine := OrderLine;
    STMaintSOrdLinePricesFrm.ShowModal;
    bTempOK := STMaintSOrdLinePricesFrm.bOK;
  finally
    STMaintSOrdLinePricesFrm.Free;
  end;
  if bTempOK then
  begin
    if sTempFuncMode = soAdd then
      SalesOrder.OrderLines.Add(OrderLine)
    else
      if sTempFuncMode = soChange then
      begin
        SalesOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        OrderLine.Free;
      end
      else { Must be delete }
      begin
        SalesOrder.OrderLines[SelectedLineIndex].Assign(OrderLine);
        OrderLine.Free;
      end;
    ShowLineGrid(Self);
  end
  else
    OrderLine.Free;
  CheckOK(Self);
end;

procedure TSTMntSOrdFrm.LineDetsStringGridSelectCell(Sender: TObject;
  Col, Row: Longint; var CanSelect: Boolean);
var
  tempInx: integer;
  tempPartCode: string;
begin
  //need to find the selected line index based on the part code
  tempPartCode := self.LineDetsStringGrid.Cells[1, Row];
  tempInx := SalesOrder.OrderLines.IndexFromPartCode(tempPartCode);
  if tempInx <> -1 then
    FSelectedLineIndex := tempInx;
end;

procedure TSTMntSOrdFrm.LineDetsStringGridDrawCell(Sender: TObject; vCol,
  vRow: Longint; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  if (vCol = 0) or (vCol = 1) or (vCol = 2) then
  	begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
			{Display the Columns Right justified in the cells}
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;

end;

procedure TSTMntSOrdFrm.SetupDetails(Sender: TObject);
var
  RepLine: TRepLine;
  tempStatus: integer;
begin
  Repline := TRepline.create;
  qryVatCode.close;
  qryVatCode.open;

 if FFuncMode = soAdd then
    Caption := 'Add a new sales order'
  else
    if FFuncMode = soChange then
      Caption := 'Change a sales order'
    else
      if FFuncMode = soDelete then
        Caption := 'Delete a sales order'
      else
        if FFuncMode = soView then
          Caption := 'View sales order'
        else
          if FFuncMode = soCopy then
            Caption := 'Copy a sales order';

  {Setup the details for the form}
  if (FFuncMode = soAdd) and (JobBagNo = 0) then
  begin
    with STSalesOrdDm do
      begin
        RepSQL.close;
        RepSQL.parambyname('Rep').asinteger := 0;
        RepSQL.open;
      end;

    {Empty details}
    OrdNoLabel.Caption := '<New Order>';
    CustNameEdit.Text := '';
    OrdEdit.Text := '';
    edtFAO.Text := '';
//    edtDeliveryNotes.Text := '';
    SalesOrder.Clear;
    DateEdit.Text := PBDateStr(date);
    DTReqEdit.Text := PBDateStr(date);
    ContactEdit.Text := '';
    edtCostCentre.Text := '';
    edtSupplier.Text := '';
    cmbbxOrderType.itemindex := 0;
    SalesOrder.OfficeContact := frmPBMainMenu.iOperator;
    if SalesOrder.OfficeContact <> 0 then
      OfficeComboBox.KeyValue := SalesOrder.OfficeContact;

(*    edtAccountManager.Text := '';
    edtAccountTeam.Text := '';
*)
    SalesOrder.PartStore := stSalesOrdDM.DefWHouseSQL.fieldByName('Default_Warehouse').AsInteger;
    StoreComboBox.KeyValue := stSalesOrdDM.DefWHouseSQL.fieldByName('Default_Warehouse').AsInteger;
    SalesOrder.RepLines.Add(RepLine);
    SalesOrder.DatePoint := date;
    DisplaySourceDetails;
  end
  else
  begin
    if FFuncMode <> soAddToExisting then
    begin
        SalesOrder.SONumber := SalesOrderNo;
        SalesOrder.FuncMode := FFuncMode;
        STSalesOrdDM.LoadSOFromDatabase(SalesOrder);
        STSalesOrdDM.LoadExtChgOrd(SalesOrder);

        with STSalesOrdDm do
          begin
            RepSQL.close;
            RepSQL.parambyname('Rep').asinteger := salesOrder.RepLines[0].rep;
            RepSQL.open;
          end;
          
        if FFuncMode = soCopy then
        begin
          DateEdit.Text := DateToStr(date);
          DtReqEdit.Text := DateToStr(date);
          OrdNoLabel.Caption := '<New Order>';
          OrdEdit.Text := '';
(*          edtAccountManager.Text := '';
          edtAccountTeam.Text := '';
*)
          SalesOrder.SONumber := -1;
          SalesOrder.SOHeadStatus := 10;
          FFuncMode := soAdd;
          SalesOrder.FuncMode := FFuncMode;
        end
        else
        begin
          DateEdit.Text := DateToStr(SalesOrder.DatePoint);
          DtReqEdit.Text := DateToStr(SalesOrder.DateReq);
          OrdNoLabel.Caption := IntToStr(SalesOrder.SONumber);
          OrdEdit.Text := SalesOrder.CustOrderNo;
          stsbrDetails.Panels[0].Text := 'Created by: ' + SalesOrder.OperatorName;
        end;


//        edtDeliveryNotes.Text := FieldByName('Delivery_Notes').AsString;
        CustNameEdit.Text := Salesorder.CustomerName + '/' + SalesOrder.BranchName;

        CostCentreLevel := dmBroker.GetCustomerCostCentreLevel(SalesOrder.Customer);
        pnlCostCentre.visible := (CostCentreLevel <> '');

(*        if CostCentreLevel <> '' then
          edtCostCentre.Text := stSalesOrdDM.GetCostCentre(SalesOrder.Customer, SalesOrder.BranchNo, SalesOrder.CostCentre, CostCentreLevel)
        else
          edtCostCentre.Text := '';
*)
        edtCostCentre.Text := Salesorder.CostCentre;

        edtFAO.Text := Salesorder.FAO;
(*        if SalesOrder.OfficeContact <> 0 then
          edtAccountManager.Text := SalesOrder.AccountManagerName;

        edtAccountTeam.Text := STSalesOrdDM.GetAccountTeamName(SalesOrder.AccountTeam);
*)
        OfficeComboBox.KeyValue := SalesOrder.OfficeContact;
        CSDBSOMemoFrm.LoadMemoData(SalesOrder.SONarrative);
        ContactEdit.Text := SalesOrder.ContactName;
        if SalesOrder.PartStore <> 0 then
          StoreComboBox.KeyValue := SalesOrder.PartStore;
        end;
        if SalesOrder.AdHocAddress = 0 then
          begin
            RdBtnToCust.Checked := True;
            DeliveryEdit.text := STSalesOrdDM.GetCustName(SalesOrder.DeliveryCustomer)
                            + '/' + STSalesOrdDM.GetCustBranchName(SalesOrder.DeliveryCustomer, SalesOrder.DeliveryBranch);
          end
        else
          begin
            RdBtnToAdHoc.Checked := True;
            DeliveryEdit.Text := STSalesOrdDM.GetAdHocName(SalesOrder.AdHocAddress);
          end;
        dbLkpCmbRep.keyvalue := salesOrder.RepLines[0].rep;
        dblkpReplType.keyvalue := SalesOrder.ReplenishSource;
        if SalesOrder.Supplier <> 0 then
          begin
            edtSupplier.text := STSalesOrdDM.GetSuppName(SalesOrder.Supplier)
                            + '/' + STSalesOrdDM.GetSuppBranchName(SalesOrder.Supplier, SalesOrder.BranchNo0);
            GetSupplierOrderTypes;
            dblkpOrderType.keyvalue := SalesOrder.SupplierOrderType;
          end;

        if SalesOrder.SOType = 'S' then
          cmbbxOrderType.ItemIndex := 0
        else
(*        if SalesOrder.SOType = 'C' then
          cmbbxOrderType.ItemIndex := 1
        else
*)
        if SalesOrder.SOType = 'J' then
          cmbbxOrderType.ItemIndex := 1
        else
        if SalesOrder.SOType = 'W' then
          cmbbxOrderType.ItemIndex := 2
        else
        if SalesOrder.SOType = 'D' then
          begin
            cmbbxOrderType.ItemIndex := 3;
          end;

        chkbxCashSale.Checked := (SalesOrder.CashSale = 'Y');
        chkbxInactive.checked := (SalesOrder.inactive = 'Y');
        chkbxinactive.visible := (SalesOrder.SOHeadStatus < 200); 
        DisplaySourceDetails;
  end;
  {Enable or disable the buttons}
  if (FFuncMode <> soDelete) then
    OKBitBtn.Caption := 'Save'
  else
  begin
    LineDetsStringGrid.PopupMenu := nil;
    ExtChgDetsStringGrid.PopupMenu := nil;
    OKBitBtn.Caption := 'Delete';
  end;

  CheckNotes(Self);
  CheckDeliveryNotes(Self);
  CheckOK(Self);
  DateEdit.Enabled := ((SalesOrder.SOHeadStatus <= shDespConfirmed) or (FFuncMode = soAdd));
  DateBitBtn.Enabled := ((SalesOrder.SOHeadStatus <= shDespConfirmed) or (FFuncMode = soAdd));
  DtReqEdit.Enabled := ((SalesOrder.SOHeadStatus <= shDespConfirmed) or (FFuncMode = soAdd));
  DtReqBitBtn.Enabled := ((SalesOrder.SOHeadStatus <= shDespConfirmed) or (FFuncMode = soAdd));
  OfficeComboBox.Enabled := ((SalesOrder.SOHeadStatus <= shDespConfirmed) or (FFuncMode = soAdd));
//  btnAccountManager.Enabled := ((SalesOrder.SOHeadStatus <= shDespConfirmed) or (FFuncMode = soAdd));

  tempStatus := STSalesOrdDM.ConfirmSOStatus(SalesOrder);
  if  (SalesOrder.SOHeadStatus >= shDespConfirmed) and
    ((SalesOrder.SOHeadStatus < shFullyInvoiced)
    or (tempStatus < 250)) then
  begin
    chkbxDoNotInvc.visible := true;
    //the status of the order has been set to fully invoiced using the Do not invoice
    //checkbox. so have to allow for the undoing of this by looking up the status
    //based on what sales invoices have been raised
    chkbxDoNotInvc.Checked := (SalesOrder.SOHeadStatus = shFullyInvoiced);
    self.trueSOHeadStat := tempStatus;
  end
  else
  begin
    chkbxDoNotInvc.visible := false;
  end;

  if SalesOrder.SOHeadStatus = shFullyInvoiced then
  begin
    ExtChgDetsStringGrid.PopupMenu := nil;
    ExtChgDetsStringGrid.OnDblClick := nil;
  end;

  SelectBitBtn.Visible := (FFuncMode = soView);

  OKBitBtn.Visible := (FFuncMode <> soView);
  if (ffuncmode = soView) or (ffuncmode = SOChangeHead) then
    begin
      lineaddBitBtn.Enabled := False;
      LineChgBitBtn.Enabled := False;
      LineDelBitBtn.Enabled := False;
(*      ChrgAddBitBtn.Enabled := False;
      ChrgChgBitBtn.Enabled := False;
      ChrgDelBitBtn.Enabled := False;
*)    end;
  edtFAO.Visible := (SalesOrder.ReplenishSource = 1);
  lblFAO.visible := edtFAO.Visible;

  bOK := False;
  bDisableLineNameChangeEvent := False;
end;

procedure TSTMntSOrdFrm.HandleSOLine(Query: TFDQuery; const inx: Integer);
var
  i: Integer;
begin
  {Delete any Serial numbers attached to this sales order line}
  DeleteSerialNos(inx);

  with Query, SalesOrder.OrderLines[inx] do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].Clear;
    if query.name = 'UpdSOLineSQL' then
    begin
      ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      ParamByName('Line').AsInteger := Line;
      ParamByName('Part').AsString := Part;
      ParamByName('Part_Sales_Price').AsFloat := Sell_Price;
      ParamByName('Sell_Pack_Quantity').AsInteger := SellPackQuantity;
      ParamByName('Quantity_Ordered').AsInteger := OrdQty;
      ParambyName('Quantity_Overs').asinteger := OversQty;
      if LineIsSample then
        Parambyname('Line_iS_sample').asstring := 'Y'
      else
        Parambyname('Line_iS_sample').asstring := 'N';
      ParamByName('Sales_Order_Line_Status').AsInteger := SOLineStatus;
      ParamByName('Vat_Code').asinteger := VatCode;
      ParamByName('Part_Cost').AsFloat := Part_Cost;
      ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;
      ParamByName('Discount_Type').asString := Disc_Type;
      ParamByName('Discount_Value').asFloat := Disc_Val;
      ParamByName('Quantity_Delivered').Asinteger := DelQty;
      ParamByName('Quantity_Invoiced').Asinteger := InvQty;
      if MarkupType = '' then
        ParamByName('Markup_Type').clear
      else
        ParamByName('Markup_Type').asstring := MarkupType;
      ParamByName('Markup_Value').asfloat := MarkupValue;
    end ;
    if query.name= 'AddSOLineSQL' then
    begin
      ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      ParamByName('Line').AsInteger := Line;
      ParamByName('Part').AsString := Part;
      ParamByName('Part_Cost').AsFloat := Part_Cost;
      ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;
      ParamByName('Part_Sales_Price').AsFloat := Sell_Price;
      ParamByName('Sell_Pack_Quantity').AsInteger := SellPackQuantity;
      ParamByName('Quantity_Ordered').AsInteger := OrdQty;
      ParambyName('Quantity_Overs').asinteger := OversQty;
      if LineIsSample then
        Parambyname('Line_iS_sample').asstring := 'Y'
      else
        Parambyname('Line_iS_sample').asstring := 'N';

      ParamByName('Quantity_Allocated').AsInteger := AllocQty;
      ParamByName('Quantity_Delivered').AsInteger := DelQty;
//    ParamByName('Quantity_Delivered').AsInteger := OrdQty;
      ParamByName('Contract').Clear;
      ParamByName('Contract_Line_No').Clear;
      ParamByName('Sales_Order_Line_Status').AsInteger := SOLineStatus;
      ParamByName('Quantity_Invoiced').AsInteger := InvQty;
      ParamByName('Discount_Type').asString := Disc_Type;
      ParamByName('Discount_Value').asFloat := Disc_Val;
      ParamByName('Vat_Code').asinteger := VatCode;
      ParambyName('Original_Sell_Price').asfloat := OriginalSellPrice;
      if MarkupType = '' then
        ParamByName('Markup_Type').clear
      else
        ParamByName('Markup_Type').asstring := MarkupType;
      ParamByName('Markup_Value').asfloat := MarkupValue;
    end;
    if query.name = 'DelSOLineSQL' then
    begin
     ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      ParamByName('Line').AsInteger := Line;
    end;
    ExecSQL;
  end;

  {Add serial numbers if adding or updating a line}
  if (query.name = 'UpdSOLineSQL') or
     (query.name = 'AddSOLineSQL') then
    SaveSerialNos(inx);
end;

procedure TSTMntSOrdFrm.DefContact(iTempCust, iTempBranch: Integer);
begin
  {Default the contact if there is ONLY 1 for the selected Customer}
  with STSalesOrdDM.GetCustContSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := iTempCust;
    ParamByName('Branch_no').AsInteger := iTempBranch;
    Open;
    if RecordCount = 1 then
    begin
      SalesOrder.CustomerContactNo := FieldByName('Contact_No').AsInteger;
      ContactEdit.Text := FieldByName('Name').AsString;

      if FieldByName('Account_Number').AsString <> '' then
      begin
        if MessageDlg('This Contact has payment details on file. Is this a Cash Sale?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
(*          SalesOrder.SOType := 'C';
          cmbbxOrderType.ItemIndex := 1;
*)
          SalesOrder.CashSale := 'Y';
          chkbxCashSale.checked := true;
        end;
      end;
    end
    else
    begin
      SalesOrder.CustomerContactNo := 0;
      ContactEdit.Text := '';
    end;
  end;
end;

procedure TSTMntSOrdFrm.SelContactBtnClick(Sender: TObject);
begin
  CSLUCContaFrm := TPBLUCContaFrm.Create(Self);
  try
    CSLUCContaFrm.bIs_Lookup := True;
    CSLUCContaFrm.bAllow_Upd := True;
    CSLUCContaFrm.SelCode := SalesOrder.CustomerContactNo;
    CSLUCContaFrm.iCust := SalesOrder.Customer;
    CSLUCContaFrm.iBranch := SalesOrder.BranchNo;
    CSLUCContaFrm.sCustName := CustNameEdit.Text;
    CSLUCContaFrm.sBranchName := sBranch;
    CSLUCContaFrm.ShowModal;
    if CSLUCContaFrm.bSelected then
    begin
      SalesOrder.CustomerContactNo := CSLUCContaFrm.SelCode;
      ContactEdit.Text := CSLUCContaFrm.SelName;
      if CSLUCContaFrm.Account_Number <> '' then
      begin
        if MessageDlg('This Contact has payment details on file. Is this a Cash Sale?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
(*          SalesOrder.SOType := 'C';
          cmbbxOrderType.ItemIndex := 1;
*)
          SalesOrder.CashSale := 'Y';
          chkbxCashSale.checked := true;
        end;
      end;
    end;
  finally
    CSLUCContaFrm.Free;
  end;
(*   if (hascostcentres) and (edtCostCentre.Text = '') then
    begin
    MessageDlg('You must select a Cost Centre for this Customer', mtError, [mbOK], 0);
    OKBitbtn.Enabled := False;
    CstCntrBitBtn.click;
    end;
*)
  CheckOK(Self);
end;

procedure TSTMntSOrdFrm.SelectBitBtnClick(Sender: TObject);
begin
 CallLineMaintScreen(soView);
end;

procedure TSTMntSOrdFrm.btnCostCentreClick(Sender: TObject);
begin
  if CostCentreLevel = 'C' then
    begin
      PBLUCustCstCntrFrm := TPBLUCustCstCntrFrm.Create(Self);
      try
        PBLUCustCstCntrFrm.bIs_Lookup := True;
        PBLUCustCstCntrFrm.bAllow_Upd := True;
        PBLUCustCstCntrFrm.sSelCode := SalesOrder.CostCentre;
        PBLUCustCstCntrFrm.iCust := SalesOrder.Customer;
        PBLUCustCstCntrFrm.sCustName := CustNameEdit.Text;
        PBLUCustCstCntrFrm.ShowModal;
        if PBLUCustCstCntrFrm.Selected then
          begin
            SalesOrder.CostCentre := PBLUCustCstCntrFrm.sSelCode;
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
        PBLUBranchCstCntrFrm.sSelCode := SalesOrder.CostCentre;
        PBLUBranchCstCntrFrm.iCust := SalesOrder.Customer;
        PBLUBranchCstCntrFrm.iBranch := SalesOrder.BranchNo;
        PBLUBranchCstCntrFrm.sCustName := CustNameEdit.Text;
        PBLUBranchCstCntrFrm.ShowModal;
        if PBLUBranchCstCntrFrm.Selected then
          begin
            SalesOrder.CostCentre := PBLUBranchCstCntrFrm.sSelCode;
            edtCostCentre.Text := PBLUBranchCstCntrFrm.sSelName;
          end;
      finally
        PBLUBranchCstCntrFrm.Free;
      end;
    end;
  CheckOK(Self);
end;

procedure TSTMntSOrdFrm.LineDetsStringGridDblClick(Sender: TObject);
begin
  If (FuncMode = 'S') or (FuncMode = 'H') then
    SelectBitBtnClick(Self)
  else
    LineChgBitBtnClick(self);

(*  if LineChgBitBtn.Enabled then
    if FFuncMode <> soView then
      LineChgBitBtnClick(Self)
    else
      SelectBitBtnClick(Self)
*)
end;

procedure TSTMntSOrdFrm.OrdEditChange(Sender: TObject);
begin
SalesOrder.CustOrderNo := OrdEdit.Text;
CheckOk(Self);
end;

procedure TSTMntSOrdFrm.DateEditExit(Sender: TObject);
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
      DateEdit.SetFocus;
      Exit;
    end;
  end;

  DateEdit.Text := PBDatestr(NewDate);
  SalesOrder.Datepoint := newdate ;
  CheckOK(Self);
end;

procedure TSTMntSOrdFrm.DtReqEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If DtReqEdit.Text = '' then
    Exit;
    try
    NewDate := StrToDate(DtReqEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DtReqEdit.SetFocus;
      Exit;
    end;
  end;

  DtReqEdit.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TSTMntSOrdFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(OKBitBtn.enabled) then exit;

  if FFuncMode = soView then exit;

  TempWord := MessageDlg('Do you want to save these order details?', mtConfirmation,
      [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
    begin
      CSDBSOMemoFrm.Free;
      Exit;
    end
  else
  if TempWord = mrCancel then
    Action := caNone
  else
    begin
      OKBitBtnClick(self);
      CSDBSOMemoFrm.Free;
    end;

end;

procedure TSTMntSOrdFrm.NotesBitBtnClick(Sender: TObject);
begin
  if fFuncMode = soView then
    CSDBSOMemoFrm.bAllow_Upd := false
  else
    CSDBSOMemoFrm.bAllow_Upd := true;

  CSDBSOMemoFrm.ShowModal;
  checknotes(Self);
end;

procedure TSTMntSOrdFrm.CheckNotes(Sender: TObject);
begin
  if CSDBSOMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TSTMntSOrdFrm.CheckDeliveryNotes(Sender: TObject);
begin
  if trim(SalesOrder.DeliveryNotes) <> '' then
  begin
    FalshTimerDelNotes.Enabled := True;
    btnDelivery.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FalshTimerDelNotes.Enabled := False;
    btnDelivery.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

function TSTMntSOrdFrm.HasCostCentres: Boolean;
begin
Result := False;
  with STSalesOrdDM.GetCustCstCntrSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := SalesOrder.Customer;
    Open;
    if RecordCount >0 then
      result := true;
  end;
end;

procedure TSTMntSOrdFrm.LineDetsStringGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 CheckOK(Self);
end;

procedure TSTMntSOrdFrm.FormKeyPress(Sender: TObject; var Key: Char);
var
  OrderLine: TOrderLine;
  iOrder: Integer;
  begin
  if Key = #13 then { if it's an enter key }
    begin
      Key := #0; { eat enter key }
      Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
    end;
(*    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      with TStringGrid(ActiveControl) do
      begin
        if name <> 'LineDetsStringGrid' then exit;
        if col = 1 then
          if GetPartDescription(cells[col,row],row) then
            begin
            if cells[7, row ] = '' then
              begin
              iOrder := SalesOrder.OrderLines.NextLineNumber;
              OrderLine := TOrderLine.Create;
              OrderLine.Line := iOrder;
              cells[0,row] := formatqty(iorder);
              OrderLine.SOLineStatus := slNotYetSent;
              OrderLine.ActnTkn := 'A';
              OrderLine.Part := cells[1,row];
              OrderLine.Sell_Price := StrToFloat(cells[5,row]);
              OrderLine.OrdQty := inptoSing((cells[4,row]),OrderLine.SellPackQuantity);
              SalesOrder.OrderLines.Add(OrderLine);
              LineChgBitBtn.Enabled := True ;
              LineDelBitBtn.Enabled := True;
              SelectBitBtn.Enabled := True ;

              if SalesOrder.OrderLines.Count <> 1 then
               memoTotal.text := CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(getOrderValue)) ;
              cells[7,row] := OrderLine.ActnTkn;
              end;
              col := 4;   {Move on to the Quantity field}
              exit;
            end
          else
            begin
            MessageDlg('Part does not exist', mtError,
              [mbOk], 0);
            exit;
            end;

        if Col = 4 then
          begin
            cells[col+2,row] := formatmoney(strToInt(cells[col,row]) * StrToFloat(cells[col+1,row]));
            salesorder.OrderLines.Lines[row-1].Ordqty := InptoSing(cells[4,row],salesorder.OrderLines.Lines[row-1].SellPackQuantity);
            if salesorder.orderlines.lines[row-1].ActnTkn <> 'A' then
              salesorder.orderlines.lines[row-1].ActnTkn := 'C';
            memoTotal.text := CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(getOrderValue)) ;
            CheckOK(Self);
            row := row+1;
            Col := 1;
            Exit;
          end;

        if col = 5 then
          begin
            cells[col+1,row] := formatmoney(strToInt(cells[col-1,row]) * StrToFloat(cells[col,row]));
            salesorder.OrderLines.Lines[row-1].Sell_Price := strToFloat(cells[5,row]);
            if salesorder.orderlines.lines[row-1].ActnTkn <> 'A' then
              salesorder.orderlines.lines[row-1].ActnTkn := 'C';
             memoTotal.text := CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(getOrderValue)) ;
            col := 1;
            row := row + 1;
            exit;
          end;
      end;
*)
end;

function TSTMntSOrdFrm.GetPartDescription(sPart: string;
  irow: integer): boolean;
begin
  LineDetsStringGrid.cells[1,irow] := UpperCase(LineDetsStringGrid.cells[1,irow]);
  with StSalesOrdDM.GetPartDetsSQL do
    begin
      close;
      parambyname('Part').asstring := sPart;
      open;

      first;

      result := (recordcount <> 0);

      if result then
        begin
        if (trim(LineDetsStringGrid.cells[1,LineDetsStringGrid.rowcount-1]) <> '') or
            (LineDetsStringGrid.row = LineDetsStringGrid.rowcount-1) then
          LineDetsStringGrid.rowcount := LineDetsStringGrid.rowcount + 1;

        LineDetsStringGrid.cells[2,irow] := fieldbyname('Part_Description').asstring;
        LineDetsStringGrid.cells[3,irow] := fieldbyname('Sell_Pack_Quantity').asstring;
        LineDetsStringGrid.cells[4,irow] := '1';
        LineDetsStringGrid.cells[5,irow] := formatmoney(getsellprice(spart));
        LineDetsStringGrid.cells[6,irow] := formatmoney(strToFloat(LineDetsStringGrid.cells[5,irow]) * StrToInt(LineDetsStringGrid.cells[4,irow]));
        end;
    end;
end;

function TSTMntSOrdFrm.GetSellPrice(TempPart: string): real;
var
Price, Part_cost : Real;
Cost_Unit, Sell_Unit: Integer;
begin
Disc_Val := 0 ;
Sell_unit := StSalesOrdDM.GetPartDetsSQL.fieldByName('Sell_Pack_Quantity').AsInteger;
Price := StSalesOrdDM.GetPartDetsSQL.fieldByName('Part_cost_cat').AsFloat / Sell_unit;
Cost_unit := StSalesOrdDM.GetPartDetsSQL.fieldByName('Purch_Pack_Quantity').AsInteger;
Part_Cost := StSalesOrdDM.GetPartDetsSQL.fieldByName('Part_Purchase_Price').AsFloat / Cost_Unit;
With STSalesOrdDM.getPartDiscSQL do
        begin
        Close;
        ParamByName('Part').AsString := TempPart ;
        ParamBYName('Customer').AsInteger := Salesorder.Customer;
        Open;
        First;
        if recordcount > 0 then
          begin
          Disc_Val := fieldByName('Discount_Value').AsFloat;
          Disc_Type := fieldByName('Discount_Type').Asstring;
          end
        else
          begin
            with STSalesOrdDM.getGroupDiscSQL do
            begin
              close;
              ParamByName('Customer').asInteger := SalesOrder.Customer;
              ParamByName('Part_Group').AsInteger := StSalesOrdDM.GetPartDetsSQL.fieldByName('Part_Group').AsInteger;
              Open;
              first;
              if recordcount > 0 then
                Disc_Val := FieldByName('Discount_Value').AsFloat;
                Disc_Type := fieldByName('Discount_Type').AsString;
              end;
          end;
        end;


        if (Disc_Type = 'X') or (Disc_Type = 'P') then
          Price := price - Disc_Val
          else
            If Disc_Type = 'C' then
            Price := ((Part_Cost) + ((part_cost * disc_val )/100. ))
            else
              if Disc_Type = 'S' then
              Price := ((price ) - ((price * disc_val)/100. ));

      Result := price;
end;

function TSTMntSOrdFrm.GetOrderValue: real;
var
TempCount : Integer;
TmpTotal : real;
begin
TmpTotal := 0.00;
 for TempCount := 0 to Pred(SalesOrder.OrderLines.Count) do
    with SalesOrder.OrderLines[TempCount] do
    begin
    tmpTotal := tmpTotal + (ordqty / SellPackQuantity) * sell_price;
    end;
    next;
 result := tmptotal;
end;

procedure TSTMntSOrdFrm.RepBitBtnClick(Sender: TObject);
begin
//CallRepPercMaintScreen(ffuncmode);
end;

function TSTMntSOrdFrm.getselectedRepPerc: TRepLine;
begin
  if (SelectedLine = nil) or (FSelectedRepPercIndex < 0) then
    Result := nil
  else
    Result := SalesOrder.RepLines[FSelectedRepPercIndex];
end;

procedure TSTMntSOrdFrm.UpdateRepPerc;
var
  icount: Integer;
begin {Update the sales order lines}
  for icount := 0 to Pred(SalesOrder.RepLines.Count) do
  begin
    if SalesOrder.RepLines[icount].ActnTkn = 'A' then
        HandleSORepPerc(STSalesOrdDM.AddSOLineRepPercSQL, icount)
      else
      if SalesOrder.RepLines[icount].ActnTkn = 'C' then
          HandleSORepPerc(STSalesOrdDM.UpdSOLineRepPercSQL, icount)
        else
          if SalesOrder.RepLines[icount].ActnTkn = 'D' then
          HandleSORepPerc(StSalesOrdDM.DelSOLineRepPercSQL, icount);
  end;

end;

procedure TSTMntSOrdFrm.HandleSORepPerc(Query: TFDQuery; const inx: integer);
var
  i: Integer;
begin
  with STSalesOrdDM.DelAllRepPercSQL do
    begin
      close;
      ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      execsql;
    end;

  with Query, SalesOrder.RepLines[inx] do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].Clear;
    if query.name = 'UpdSOLineRepPercSQL' then
    begin
    ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
    ParamByName('Rep').AsInteger := Rep;
    ParamByName('Rep_Percentage').AsFloat := Percentage;
    end ;
    if query.name= 'AddSOLineRepPercSQL' then
    begin
    ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
    ParamByName('Rep').AsInteger := Rep;
    ParamByName('Rep_Percentage').AsFloat := Percentage;
    end;
    if query.name = 'DelSOLineRepPercSQL' then
    begin
     ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
      ParamByName('Rep').AsInteger := Rep;
    end;
    ExecSQL;
  end;
end;

procedure TSTMntSOrdFrm.edtDeliveryNotesChange(Sender: TObject);
begin
// SalesOrder.DeliveryNotes := edtDeliveryNotes.Text;

end;

procedure TSTMntSOrdFrm.DeliveryBitBtnClick(Sender: TObject);
begin
if RdBtnToCust.checked then
  begin
    PBLUCustFrm := TPBLUCustFrm.Create(Self);
    try
      PBLUCustFrm.bIs_LookUp := True ;
      PBLUCustFrm.bAllow_Upd := True ;
      PBLUCustFrm.bSel_Branch := True ;
      PBLUCustFrm.SelCode := SalesOrder.DeliveryCustomer;
      PBLUCustFrm.SelBranch := SalesOrder.DeliveryBranch;
      PBLUCustFrm.ShowModal;
      If PBLUCustFrm.Selected then
       begin
        SalesOrder.DeliveryCustomer := PBLUCustFrm.SelCode;
        SalesOrder.DeliveryBranch := PBLUCustFrm.SelBranch;
        sDelCustName := PBLUCustFrm.SelName;
        sDelBranchName := PBLUCustFrm.SelBranchName;
        Deliveryedit.text := STSalesOrdDM.GetCustName(SalesOrder.DeliveryCustomer)
                            + '/' + STSalesOrdDM.GetCustBranchName(SalesOrder.DeliveryCustomer,SalesOrder.DeliveryBranch);
       end;
    finally
      PBLUCustFrm.Free;
    end;
  end
else
if RdBtnToAdhoc.checked then
  begin
    CSLUAdHocFrm := TPBLUAdHocFrm.Create(Self);
    try
      CSLUAdHocFrm.bIs_LookUp := True ;
      CSLUAdHocFrm.bAllow_Upd := True ;
      CSLUAdHocFrm.SelCode := SalesOrder.AdHocAddress;
      CSLUAdHocFrm.ShowModal;
      If CSLUAdHocFrm.Selected then
       begin
        SalesOrder.AdHocAddress := CSLUAdHocFrm.SelCode;
        sDelCustName := CSLUAdHocFrm.SelName;
//        sDelBranchName := CSLUAdHocFrm.SelBranchName;
        Deliveryedit.text := STSalesOrdDM.GetAdHocName(SalesOrder.AdHocAddress);
        if (pos('DESTROY',DeliveryEdit.text) > 0) and (cmbbxOrderType.ItemIndex <> 3) then
          begin
            messagedlg('If this order is to destroy stock, then the order type must be a Destroy Notification', mtInformation,[mbOk], 0);
            SalesOrder.SOType := 'D';
            cmbbxOrderType.ItemIndex := 3;
          end;
       end;
    finally
      CSLUAdHocFrm.Free;
    end;
  end
else
if rdbtnToProduction.checked then
  begin
    PBLUProductionLocFrm := TPBLUProductionLocFrm.Create(Self);
    try
      PBLUProductionLocFrm.bIs_LookUp := True ;
      PBLUProductionLocFrm.bAllow_Upd := True ;
      PBLUProductionLocFrm.SelCode := SalesOrder.AdHocAddress;
      PBLUProductionLocFrm.ShowModal;
      If PBLUProductionLocFrm.Selected then
       begin
        SalesOrder.ProductionLocation := PBLUProductionLocFrm.SelCode;
        sDelCustName := PBLUProductionLocFrm.SelName;
//        sDelBranchName := CSLUAdHocFrm.SelBranchName;
        Deliveryedit.text := STSalesOrdDM.GetProductionName(SalesOrder.ProductionLocation);
       end;
    finally
      PBLUProductionLocFrm.Free;
    end;
  end;
end;

procedure TSTMntSOrdFrm.dbLkpCmbRepClick(Sender: TObject);
var
  RepLine: TRepLine;
begin
  FSelectedRepPercIndex := 0;
  RepLine := TRepLine.Create;
//  RepLine := SelectedRepPerc.Clone;

  SalesOrder.RepLines[0].free;
  SalesOrder.RepLines.Delete(0);
  RepLine.rep := dblkpCmbRep.keyvalue;
  RepLine.RepName := dblkpCmbRep.text;
  RepLine.ActnTkn := 'A';

  SalesOrder.RepLines.Add(RepLine);
  Checkok(Self);

end;

procedure TSTMntSOrdFrm.ShowQtyLineGrid(Sender: TObject);
var
  TempFrom, TempTo: string;
  TempCount: Integer;
  inx: Integer;
begin
  for TempCount := 0 to LineDetsStringGrid.RowCount do
    begin
    LineDetsStringGrid.rows[TempCount].clear;
    end;
  LineDetsStringGrid.ColWidths[1] := 200;
  LineDetsStringGrid.ColWidths[2] := 250;
  LineDetsStringGrid.ColCount := 10;
  LineDetsStringGrid.Cells[0, 0] := 'Line';
  LineDetsStringGrid.Cells[1, 0] := 'Part';
  LineDetsStringGrid.Cells[2, 0] := 'Description';
  LineDetsStringGrid.Cells[3, 0] := 'Pack Size';
  LineDetsStringGrid.Cells[4, 0] := 'Qty On Ord';
  LineDetsStringGrid.Cells[5, 0] := 'Qty Alloc';
  LineDetsStringGrid.Cells[6, 0] := 'Qty Deliv';
  LineDetsStringGrid.Cells[7, 0] := 'Qty Inv';
  LineDetsStringGrid.Cells[8, 0] := 'Price';
  LineDetsStringGrid.Cells[9, 0] := 'Total';
  LineDetsStringGrid.Cells[0, 1] := '';
  LineDetsStringGrid.Cells[1, 1] := '';
  LineDetsStringGrid.Cells[2, 1] := '';
  LineDetsStringGrid.Cells[3, 1] := '';
  LineDetsStringGrid.Cells[4, 1] := '';
  LineDetsStringGrid.Cells[5, 1] := '';
  LineDetsStringGrid.Cells[6, 1] := '';
  LineDetsStringGrid.Cells[7, 1] := '';
  LineDetsStringGrid.Cells[8, 1] := '';
  LineDetsStringGrid.Cells[9, 1] := '';
  TempFrom := '';
  TempTo := 'ZZZ';
  inx := 0;
 { if SalesOrder.OrderLines.Count = 0 then
    LineDetsStringGrid.enabled := False
  else
    LineDetsStringGrid.enabled := True;  }
  for TempCount := 0 to Pred(SalesOrder.OrderLines.Count) do
    with SalesOrder.OrderLines[TempCount] do
    begin
        with LineDetsStringGrid do
        begin
          if ActnTkn <> 'D' then
          begin
          Inc(inx);
          Cells[0, inx] := IntToStr(inx);//IntToStr(Line);
          Cells[1, inx] := Part;
          if LineIsSample then
            Cells[2, inx] := STSalesOrdDM.GetPartDescr(Part)+ ' (SAMPLE)'
          else
            Cells[2, inx] := STSalesOrdDM.GetPartDescr(Part);
//          Cells[3, inx] := STSalesOrdDM.GetSellUnit(Part);
          Cells[3, inx] := IntToStr(sellPackQuantity);
//          Cells[4, inx] := FormatQty(OrdQty);
          Cells[4, inx] := ShowInPacks(OrdQty,SellPackQuantity);
          Cells[5, inx] := ShowInPacks(AllocQty,SellPackQuantity);
          Cells[6, inx] := ShowInPacks(DelQty,SellPackQuantity);
          Cells[7, inx] := ShowInPacks(InvQty,SellPackQuantity);
          Cells[8, inx] := FormatMoneyto3dp(Sell_Price);
          Cells[9, inx] := FormatMoney((Ordqty/SellPackQuantity)*Sell_Price);
          Cells[10, inx] := 'C';
//          fTempTot := fTempTot + ((Ordqty/SellPackQuantity)*Sell_Price);
          fTempOrdTot := fTempOrdTot + ((Ordqty / SellPackQuantity)*Sell_Price);
      end;
    end;
  end;
  if inx > 0 then
    LineDetsStringGrid.RowCount := inx + 1
  else
    LineDetsStringGrid.RowCount := 2;
  LineChgBitBtn.Enabled := False;
  LineDelBitBtn.Enabled := False;
  SelectBitBtn.Enabled := False;

  LineDetsStringGrid.popupMenu := pMnuView;

  if inx > 0 then
    begin
      FSelectedLineIndex := 0;
      LineDetsStringGrid.Cells[0, inx+1] := '';
      LineDetsStringGrid.Cells[1, inx+1] := '';
      LineDetsStringGrid.Cells[2, inx+1] := '';
      LineDetsStringGrid.Cells[3, inx+1] := '';
      LineDetsStringGrid.Cells[4, inx+1] := '';
      LineDetsStringGrid.Cells[5, inx+1] := '';
      LineDetsStringGrid.Cells[6, inx+1] := '';
      LineDetsStringGrid.Cells[7, inx+1] := '';
      end
    else
    FSelectedLineIndex := -1;
    ShowExtChgGrid(Self);
    ExtChgDetsStringGrid.enabled := not (FuncMode = 'S');
//    memoTotal.text := CurrencyDisp(FloatToStr(fTempTot+SalesOrder.ExtraCharges.Total)) ;
    memoTotal.text := CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(fTempOrdTot+SalesOrder.ExtraCharges.Total)) ;
    pnlTop.Enabled := not (FuncMode = 'S');
    pnlHead.Enabled := not (FuncMode = 'S');
end;

procedure TSTMntSOrdFrm.btnSupplierLUClick(Sender: TObject);
begin
   CSLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    CSLUSuppFrm.bIs_LookUp := True ;
    CSLUSuppFrm.bAllow_Upd := True ;
    CSLUSuppFrm.bSel_Branch := True ;
    CSLUSuppFrm.SelCode := SalesOrder.Supplier;
    CSLUSuppFrm.SelBranch := SalesOrder.BranchNo0;
    CSLUSuppFrm.ShowModal;
    If CSLUSuppFrm.Selected then
      begin
        SalesOrder.Supplier := CSLUSuppFrm.SelCode;
        edtSupplier.Text := CSLUSuppFrm.SelName + '/' + CSLUSuppFrm.SelBranchName;
        SalesOrder.BranchNo0 := CSLUSuppFrm.SelBranch;
        GetSupplierOrderTypes;
      end;
  finally
    CSLUSuppFrm.Free;
  end;
CheckOK(Self) ;
end;

procedure TSTMntSOrdFrm.GetSupplierOrderTypes;
begin
  with STSalesOrdDM.GetSuppOTypeSQL do
    begin
      close;
      parambyname('Supplier').asinteger := SalesOrder.Supplier;
      open;
      if recordcount = 1 then
        begin
          dblkpOrderType.KeyValue := fieldbyname('Supp_Order_type').asstring;
          SalesOrder.SupplierOrderType := fieldbyname('Supp_Order_type').asstring;
        end;
    end;
end;

procedure TSTMntSOrdFrm.DisplaySourceDetails;
begin
  with dblkpReplType do
    begin
      SalesOrder.ReplenishSource := keyvalue;
      pnlSupplier.visible := (keyvalue = 1) or (keyvalue = 3); {from Supplier}
      pnlWarehouse.visible := (keyvalue = 2); {from Warehouse}
      pnlSupplier.top := pnlWarehouse.top;
      pnlSupplier.left := pnlWarehouse.left;
      pnlWarehouse.BevelOuter := bvnone;
      pnlSupplier.BevelOuter := bvnone;
    end;
    CheckOK(Self);
end;

procedure TSTMntSOrdFrm.dblkpReplTypeClick(Sender: TObject);
begin
  DisplaySourceDetails;
end;

procedure TSTMntSOrdFrm.dblkpOrdertypeClick(Sender: TObject);
begin
  SalesOrder.SupplierOrderType := (sender as TDBLookupComboBox).keyvalue;
  CheckOK(Self);
end;

procedure TSTMntSOrdFrm.StoreComboBoxClick(Sender: TObject);
begin
  SalesOrder.PartStore := (Sender as TDBLookupComboBox).keyvalue;
  CheckOK(self);
end;

procedure TSTMntSOrdFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TSTMntSOrdFrm.ChrgAddBitBtnClick(Sender: TObject);
begin
 if Selectedline = nil then
    Exit;
     CallExtChgMaintScreen(soAdd);
end;

procedure TSTMntSOrdFrm.ChrgChgBitBtnClick(Sender: TObject);
begin
  if SelectedChargeIndex = -1 then
    Exit;
  CallExtChgMaintScreen(soChange);
end;

procedure TSTMntSOrdFrm.ChrgDelBitBtnClick(Sender: TObject);
begin
 if SelectedChargeIndex = -1 then
    Exit;
  CallExtChgMaintScreen(soDelete);
end;

procedure TSTMntSOrdFrm.CallExtChgMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  ExtraCharge: TExtraCharge;
  inx, iCharge: Integer;
begin
  if sTempFuncMode = soAdd then
  begin
    ExtraCharge := TExtraCharge.Create;
    ExtraCharge.AdditionalCharge := SalesOrder.ExtraCharges.NextChargeNumber;
  end
  else
    ExtraCharge := SelectedCharge.Clone;
  STMaintSInvExtChgFrm := TSTMaintSInvExtChgFrm.Create(Self);
  try
    STMaintSInvExtChgFrm.FuncMode := sTempFuncMode;
    STMaintSInvExtChgFrm.ExtraCharge := ExtraCharge;
    STmaintSInvExtChgFrm.InvorOrd := 'O';
    STMaintSInvExtChgFrm.ShowModal;
    bTempOK := STMaintSInvExtChgFrm.bOK;
  finally
    STMaintSInvExtChgFrm.Free;
  end;
  if bTempOK then
  begin
    iCharge := ExtraCharge.AdditionalCharge;
    if sTempFuncMode = soAdd then
      SalesOrder.ExtraCharges.Add(ExtraCharge);
    inx := SalesOrder.ExtraCharges.IndexFromChargeNo(iCharge);
    if sTempFuncMode in [soChange, soDelete] then
    begin
      SalesOrder.ExtraCharges[inx].Free;
     SalesOrder.ExtraCharges.Delete(inx);
    end;
    if sTempFuncMode = soChange then
     SalesOrder.ExtraCharges.Add(ExtraCharge);
    if sTempFuncMode = soDelete then
      ExtraCharge.Free;
    ShowExtChgGrid(Self);
    recalcTotals;
  end
  else
    ExtraCharge.Free;
end;

procedure TSTMntSOrdFrm.CreateExtraChargeLine;
var
icount: integer;
begin
 {Insert a new Invoice Line record}
  for icount := 0 to pred(SalesOrder.ExtraCharges.Count) do
   with SalesOrder.ExtraCharges[iCount] do
      begin
  with STSalesOrdDM.AddOrdExtChgSQL do
  begin
    Close;
    ParamByName('Sales_Order').AsInteger := salesorder.SONumber;
    ParamByName('Additional_Charge').AsInteger := AdditionalCharge;
    ParamByName('Details').Asstring := Details;
    ParamByName('Nominal').AsString := NominalCode;
    ParamByName('Amount').AsFloat := Amount;
    ParamByName('Cost').AsFloat := Cost;
    ParambyName('Vat_Code').asinteger := ChgVatCode;
    ExecSQL;
  end;
 end;
end;

procedure TSTMntSOrdFrm.UpdateExtraCharges;
var
icount: integer;
begin
 {Insert a new Invoice Line record}
    if FFuncMode <> soAdd then
    begin
      with STSalesOrdDM.DelOrdExtChgSQL do
      begin
        Close;
        ParamByName('Sales_Order').asinteger := salesorder.SoNumber;
        execSQL;
      end;
    end;

 for icount := 0 to pred(SalesOrder.ExtraCharges.Count) do
   with SalesOrder.ExtraCharges[iCount] do
   begin
    with STSalesOrdDM.AddOrdExtChgSQL do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := salesorder.SoNumber;
      ParamByName('Additional_Charge').AsInteger := AdditionalCharge;
      ParamByName('Details').Asstring := Details;
      ParamByName('Nominal').AsString := StSalesOrdDm.GetDefSalesNominal;
      ParamByName('Amount').AsFloat := Amount;
      ParamByName('Cost').AsFloat := Cost;
      ParamByName('Vat_Code').AsInteger := ChgVatCode;
      ExecSQL;
    end ;
   end;

end;

procedure TSTMntSOrdFrm.SaveCustomerContactStatus;
begin
  with SalesOrder do
    begin
      with STSalesOrdDM.qryUpdateContactStatus do
      begin
        close;
        ParamByName('Customer').asinteger := Customer;
        ParamByName('Branch_no').AsInteger := BranchNo;
        ParamByName('Contact_no').AsInteger := CustomerContactNo;
        ExecSQL;
      end;
    end;
end;

procedure TSTMntSOrdFrm.RecalcTotals;
begin
 MemoTotal.text := CurrencyDisp(frmpbMainMenu.sCurrencyMask,FloatToStr(SalesOrder.ExtraCharges.Total+FTempOrdTot));
end;

function TSTMntSOrdFrm.GetSelectedCharge: TExtraCharge;
begin
 if (SelectedLine = nil) or (FSelectedChargeIndex < 0) then
    Result := nil
  else
    Result := SalesOrder.ExtraCharges[FSelectedChargeIndex];
end;

procedure TSTMntSOrdFrm.ShowExtChgGrid(Sender: TObject);
var
  TempCount,
    iNoOfExtChg: Integer;
begin
  iNoOfExtChg := 0;
  ExtChgDetsStringGrid.Cells[0, 0] := 'Details';
  ExtChgDetsStringGrid.Cells[1, 0] := 'Cost';
  ExtChGDetsStringGrid.Cells[2, 0] := 'Amount';
  ExtChgDetsStringGrid.Cells[3, 0] := 'Vat Rate';
  ExtChgDetsStringGrid.Cells[0, 1] := '';
  ExtChgDetsStringGrid.Cells[1, 1] := '';
  ExtChgDetsStringGrid.Cells[2, 1] := '';
  ExtChgDetsStringGrid.Cells[3, 1] := '';
  if assigned(SalesOrder.extraCharges) then
    for TempCount := 0 to Pred(SalesOrder.ExtraCharges.Count) do
      with SalesOrder.ExtraCharges[TempCount] do
      begin
        iNoOfExtChg := iNoOfExtChg + 1;
        ExtChgDetsStringGrid.Cells[0, iNoOfExtChg] := Details;
        ExtChgDetsStringGrid.Cells[1, iNoOfExtChg] := FormatMoney(Cost);
        ExtChgDetsStringGrid.Cells[2, iNoOfExtChg] := FormatMoney(Amount);
        ExtChgDetsStringGrid.Cells[3, iNoofExtChg] := STSalesOrdDM.getVatCodeVatRate(ChgVatCode);
      end;
  if iNoOfExtChg > 1 then
    ExtChgDetsStringGrid.RowCount := iNoOfExtChg + 1
  else
    ExtChgDetsStringGrid.RowCount := 2;
  if iNoOfExtChg > 0 then
  begin
    FSelectedChargeIndex := 0;
  end
  else
  begin
    FSelectedChargeIndex := -1;
  end;
end;

procedure TSTMntSOrdFrm.ExtChgDetsStringGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
if FSelectedChargeIndex = ARow - 1 then Exit;
  FSelectedChargeIndex := ARow - 1;
end;

procedure TSTMntSOrdFrm.ExtChgMenuPopup(Sender: TObject);
begin
  chrgChgBitBtn.enabled := (SalesOrder.ExtraCharges.count <> 0);
  chrgDelBitBtn.enabled := (SalesOrder.ExtraCharges.count <> 0);
end;

procedure TSTMntSOrdFrm.RdBtnToCustClick(Sender: TObject);
begin
  SetDeliverTo;
end;

procedure TSTMntSOrdFrm.SetDeliverTo;
begin
//rdBtnToCust.checked := not rdBtnToAdHoc.checked;
if rdBtnToCust.Checked then
  begin
    SalesOrder.deliveryCustomer := SalesOrder.Customer;
            SalesOrder.DeliveryBranch := SalesOrder.Branchno;
            DeliveryEdit.text :=  STSalesOrdDM.GetCustName(SalesOrder.DeliveryCustomer)
                                + '/' + STSalesOrdDM.GetCustBranchName(SalesOrder.DeliveryCustomer,SalesOrder.DeliveryBranch);
  SalesOrder.AdhocAddress := 0;
  end
else
if rdBtnToadhoc.Checked then
  begin
    SalesOrder.DeliveryCustomer := 0;
    SalesOrder.DeliveryBranch := 0;
    DeliveryEdit.Text := STSalesOrdDM.GetAdHocName(SalesOrder.AdHocAddress);
  end
else
  begin
    SalesOrder.AdhocAddress := 0;
    SalesOrder.DeliveryCustomer := 0;
    SalesOrder.DeliveryBranch := 0;
    DeliveryEdit.Text := STSalesOrdDM.GetProductionName(SalesOrder.ProductionLocation);
  end
end;

procedure TSTMntSOrdFrm.RDBtnToAdHocClick(Sender: TObject);
begin
Deliveryedit.Text := '';
SetDeliverTo;
end;

procedure TSTMntSOrdFrm.ExtChgDetsStringGridDrawCell(Sender: TObject; VCol,
  VRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  if (vCol = 0) then
  	begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
			{Display the Columns Right justified in the cells}
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;

end;

procedure TSTMntSOrdFrm.ExtChgDetsStringGridDblClick(Sender: TObject);
begin
  ChrgChgBitBtnClick(self);
end;

procedure TSTMntSOrdFrm.DeleteSerialNos(const inx: integer);
begin
  STSalesOrdDM.DeleteSOSerialNos(SalesOrder.SONumber,
    SalesOrder.OrderLines[inx].Line);
end;

procedure TSTMntSOrdFrm.SaveSerialNos(const inx: integer);
var
  i, iToNumbers: Integer;
  iLength: integer;
  sFirst, sLast, sOutFirst, sOutLast: string;
  bKeepThis: boolean;
begin
  for i := 0 to pred(SalesOrder.OrderLines[inx].StockSerialNos.Count) do
    begin
      if (SalesOrder.SONumber <> SalesOrder.OrderLines[inx].StockSerialNos[i].Salesorder) and
         (SalesOrder.OrderLines[inx].StockSerialNos[i].Salesorder <> 0)  then
        continue
      else
        STSalesOrdDM.DeleteStoreStockSerialItems(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock,
                                                 SalesOrder.OrderLines[inx].StockSerialNos[i].SerialItemNo);
      sFirst := SalesOrder.OrderLines[inx].StockSerialNos[i].SerialItemFrom;
      sLast := SalesOrder.OrderLines[inx].StockSerialNos[i].SerialItemTo;

      bKeepThis := true;

      for iToNumbers := 0 to pred(SalesOrder.OrderLines[inx].SerialNumbers.Count) do
        begin
          sOutFirst := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemFrom;
          sOutLast := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemTo;

          iLength := length(sOutFirst);

          {if first number is greater than last - then not removed from this batch}
          if (sOutFirst > sLast) then
            continue
          else
          if (sOutFirst < sFirst) and (sOutLast < sFirst) then
            continue
          else
          {if first number is same as first number in batch then see where the last number falls}
          if (sOutFirst = sFirst) then
            begin
              bKeepThis := false;
              if (sOutLast < sLast) then
                begin
                  {Add those items taken but allocate the sales order number}
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemFrom;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemTo;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').asinteger := SalesOrder.OrderLines[inx].Line;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                  {Add the items after the last}
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := PadWithZeros(strtoint64(sOutLast)+1,iLength);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := sLast;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').clear;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').clear;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                end
              else
                begin
                  {All these serial numbers have been selected, allocate the sales order number}
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemFrom;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemTo;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').asinteger := SalesOrder.OrderLines[inx].Line;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                end;
            end
          else
          if (sOutFirst > sFirst) then
            begin
              {Add in those numbers not taken, i.e. before the first}
              STSalesOrdDM.AddStStkSerialNosSQL.close;
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := sFirst;
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := Padwithzeros(strtoint64(sOutFirst)-1,iLength);
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').clear;
              STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').clear;
              STSalesOrdDM.AddStStkSerialNosSQL.execsql;

              if (sOutLast < sLast) then
                begin
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemFrom;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemTo;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').asinteger := SalesOrder.OrderLines[inx].Line;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                  {Add in those numbers not taken, i.e. up to the last}
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := Padwithzeros(strtoint64(sOutLast)+1,iLength);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := sLast;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').clear;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').clear;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                end
              else
                begin
                  {All these serial numbers have been selected, allocate the sales order number}
                  STSalesOrdDM.AddStStkSerialNosSQL.close;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemFrom;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := SalesOrder.OrderLines[inx].SerialNumbers[iToNumbers].SerialItemTo;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
                  STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').asinteger := SalesOrder.OrderLines[inx].Line;
                  STSalesOrdDM.AddStStkSerialNosSQL.execsql;
                end;
              bKeepThis := false;
            end;
        end;

      if bKeepThis then
        begin
          {Add to Store_Stock_Serial_items with no changes}
          STSalesOrdDM.AddStStkSerialNosSQL.close;
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Store_stock').asinteger := SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock;
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_no').asinteger := STSalesOrdDM.GetNextStoreStockSerialNo(SalesOrder.OrderLines[inx].StockSerialNos[i].StoreStock);
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_from').asstring := sFirst;
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Serial_item_to').asstring := sLast;
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order').clear;
          STSalesOrdDM.AddStStkSerialNosSQL.parambyname('Sales_Order_line_no').clear;
          STSalesOrdDM.AddStStkSerialNosSQL.execsql;
        end;
    end;

  for i := 0 to Pred(SalesOrder.OrderLines[inx].SerialNumbers.Count) do
    with SalesOrder, OrderLines[inx], SerialNumbers[i] do
    begin
      with STSalesOrdDM.AddSerialNosSQL do
      begin
        Close;
        ParamByName('Sales_Order').asinteger := SONumber;
        ParamByName('Sales_order_Line_no').AsInteger := OrderLines[inx].Line;
        ParamByName('Serial_item_no').AsInteger := i+1;
        ParamByName('Serial_item_from').AsString := SerialItemFrom;
        ParamByName('Serial_item_to').Asstring := SerialItemTo;
        ParamByName('Sets_per_pad').asinteger := SetsPerPad;
       ExecSQL;
      end;
    end;
end;

procedure TSTMntSOrdFrm.pMnuMaintPopup(Sender: TObject);
var
  inx: integer;
begin
  inx := LineDetsStringGrid.row-1;

  if (LineDetsStringGrid.row = 0) or (LineDetsStringGrid.cells[0,LineDetsStringGrid.row] = '') then
    exit;
  LineSerialNos.visible := STSalesOrdDM.GetPartNumbered(SalesOrder.OrderLines[inx].Part);
  N1.visible := STSalesOrdDM.GetPartNumbered(SalesOrder.OrderLines[inx].Part);
end;

procedure TSTMntSOrdFrm.LineSerialNosClick(Sender: TObject);
var
  inx: integer;
begin
  inx := LinedetsStringgrid.row -1;
  STMaintSOrdSerialNosFrm := TSTMaintSOrdSerialNosFrm.create(self);
  try
    STMaintSOrdSerialNosFrm.OrderLine := SalesOrder.OrderLines[inx];
    STMaintSOrdSerialNosfrm.SONumber := SalesOrder.SONumber;
    STMaintSOrdSerialNosFrm.Product := SalesOrder.OrderLines[inx].Part;
    STMaintSOrdSerialNosFrm.lblProductCode.caption := SalesOrder.OrderLines[inx].Part + ' - ' + STSalesOrdDM.GetPartDescr(SalesOrder.OrderLines[inx].Part);
    STMaintSOrdSerialNosFrm.Quantity := SalesOrder.OrderLines[inx].OrdQty;
    STMaintSOrdSerialNosFrm.showmodal;
(*    if STMaintSOrdSerialNosFrm.modalresult = idOK then
      SalesOrder.OrderLines[inx].ActnTkn := 'C';

*)
  finally
    STMaintSOrdSerialNosFrm.free;
  end;
end;

procedure TSTMntSOrdFrm.btnAddServiceClick(Sender: TObject);
begin
  { Is there any more room ? }
  if SalesOrder.OrderLines.NextLineNumber < 1 then
    MessageDlg('Maximum number of lines already on this order', mtError,
      [mbAbort], 0)
  else
    begin
    CallServiceMaintScreen(soAdd);
    LineDetsStringGrid.row := LineDetsStringGrid.rowcount - 1;
    end;
end;

procedure TSTMntSOrdFrm.btnDeliveryClick(Sender: TObject);
begin
  STMntSOrdSpecInFrm := TSTMntSOrdSpecInFrm.create(self);
  try
    STMntSOrdSpecInFrm.DispMemo.text := SalesOrder.DeliveryNotes;
    STMntSOrdSpecInFrm.showmodal;
    if STMntSOrdSpecInFrm.bOK then
      SalesOrder.DeliveryNotes := STMntSOrdSpecInFrm.DispMemo.text;
  finally
    STMntSOrdSpecInFrm.free;
  end;
  CheckDeliveryNotes(Self);
end;

procedure TSTMntSOrdFrm.FalshTimerDelNotesTimer(Sender: TObject);
begin
  if bDeliveryFlash then
    btnDelivery.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnDelivery.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bDeliveryFlash := (not (bDeliveryFlash));
end;

procedure TSTMntSOrdFrm.chkbxDoNotInvcClick(Sender: TObject);
begin
  //funcmode is soView if sales order's sales invoices have been included in a
  //period end, but even then the user should be able to change the 'not invoiced'
  //flag and save the changes
  if (FFuncMode = soView) and (chkbxDoNotInvc.Focused) then
  begin
    FFuncMode := soChangeHead;
    OKBitBtn.Visible := true;
  end;

  if self.chkbxDoNotInvc.Checked then
  begin
    self.trueSOHeadStat := SalesOrder.SOHeadStatus;
    SalesOrder.SOHeadStatus := 250;
  end
  else
  begin
    SalesOrder.SOHeadStatus := self.trueSOHeadStat;
  end;
end;

procedure TSTMntSOrdFrm.cmbbxOrderTypeChange(Sender: TObject);
begin
  if cmbbxOrderType.Text = 'Sales Order' then
    SalesOrder.SOType := 'S'
  else
(*  if cmbbxOrderType.Text = 'Cash Sale' then
    SalesOrder.SOType := 'C'
  else
*)
  if cmbbxOrderType.Text = 'Web Order' then
    SalesOrder.SOType := 'W'
  else
  if cmbbxOrderType.Text = 'Job Bag Stock' then
    SalesOrder.SOType := 'J'
  else
    SalesOrder.SOType := 'D';
end;

procedure TSTMntSOrdFrm.FormShow(Sender: TObject);
begin
  if (JobBagNo <> 0) then
    begin
      ShowHeaderDetails;
    end;
end;

procedure TSTMntSOrdFrm.ShowHeaderDetails;
begin
  DateEdit.Text := DateToStr(SalesOrder.DatePoint);
  DtReqEdit.Text := DateToStr(SalesOrder.DateReq);
  OrdEdit.Text := SalesOrder.CustOrderNo;
  edtFAO.Text := SalesOrder.FAO;
  edtFAO.Visible := (SalesOrder.ReplenishSource = 1);

  CustNameEdit.Text := Salesorder.CustomerName + '/' + SalesOrder.BranchName;

  {Cost centres}
  CostCentreLevel := dmBroker.GetCustomerCostCentreLevel(SalesOrder.Customer);
  pnlCostCentre.visible := (CostCentreLevel <> '');

  if CostCentreLevel <> '' then
    edtCostCentre.Text := stSalesOrdDM.GetCostCentre(SalesOrder.Customer, SalesOrder.BranchNo, SalesOrder.CostCentre, CostCentreLevel)
  else
    edtCostCentre.Text := '';

//  edtCostCentre.Text := Salesorder.CostCentre;

  if SalesOrder.OfficeContact <> 0 then
    OfficeComboBox.KeyValue := SalesOrder.OfficeContact;

(*  edtAccountManager.Text := SalesOrder.AccountManagerName;
  edtAccountTeam.Text := STSalesOrdDM.GetAccountTeamName(SalesOrder.AccountTeam);
*)

  ContactEdit.Text := SalesOrder.ContactName;
  if SalesOrder.PartStore <> 0 then
    StoreComboBox.KeyValue := SalesOrder.PartStore;

  if SalesOrder.AdHocAddress <> 0 then
    begin
      RdBtnToAdHoc.Checked := True;
      DeliveryEdit.Text := STSalesOrdDM.GetAdHocName(SalesOrder.AdHocAddress);
    end
  else
  if SalesOrder.DeliveryCustomer <> 0 then
    begin
      RdBtnToCust.Checked := True;
      DeliveryEdit.text := STSalesOrdDM.GetCustName(SalesOrder.DeliveryCustomer)
                           + '/' + STSalesOrdDM.GetCustBranchName(SalesOrder.DeliveryCustomer, SalesOrder.DeliveryBranch);
    end
  else
    begin
//      RdBtnToAdhoc.enabled := false;
//      RdBtnToCust.enabled := false;
      rdbtntoProduction.Checked := true;
      DeliveryEdit.Text := STSalesOrdDM.GetProductionName(SalesOrder.ProductionLocation);
    end;

  with STSalesOrdDm do
    begin
      RepSQL.Close;
      RepSQl.ParamByName('Rep').asinteger := salesOrder.RepLines[0].rep;
      RepSQl.open;
    end;

  dbLkpCmbRep.keyvalue := salesOrder.RepLines[0].rep;
  dblkpReplType.keyvalue := SalesOrder.ReplenishSource;

  if SalesOrder.SOType = 'S' then
    cmbbxOrderType.ItemIndex := 0
  else
(*  if SalesOrder.SOType = 'C' then
    cmbbxOrderType.ItemIndex := 1
  else
*)
  if SalesOrder.SOType = 'J' then
    cmbbxOrderType.ItemIndex := 1
  else
  if SalesOrder.SOType = 'W' then
    cmbbxOrderType.ItemIndex := 2
  else
  if SalesOrder.SOType = 'D' then
    begin
      cmbbxOrderType.ItemIndex := 3;
    end;

  DisplaySourceDetails;
end;

procedure TSTMntSOrdFrm.SetJobBagNo(const Value: integer);
begin
  FJobBagNo := Value;
  lblJobBagNo.visible := (FJobBagNo <> 0);
  lblJobBagCaption.Visible := (FJobBagNo <> 0);
//  cmbbxOrderType.Enabled := (FJobBagNo = 0);
  FAddJobBag := (FJobBagNo <> 0);

  lblJobBagNo.caption := inttostr(FJobBagNo);
  custbitbtn.enabled := (FJobBagNo = 0);
  selcontactbtn.enabled := (FJobBagNo = 0);
  rdbtntoProduction.Visible := (FJobBagNo <> 0);
end;

procedure TSTMntSOrdFrm.rdbtnToProductionClick(Sender: TObject);
begin
  Deliveryedit.Text := '';
  SetDeliverTo;
end;

procedure TSTMntSOrdFrm.btnAccountManagerClick(Sender: TObject);
begin
(*  PBLUAccountManagerFrm := TPBLUAccountManagerFrm.Create(Owner);
  try
    PBLUAccountManagerFrm.bIs_Lookup := True;
    PBLUAccountManagerFrm.bAllow_Upd := True;

    PBLUAccountManagerFrm.SelCode := SalesOrder.OfficeContact;
    PBLUAccountManagerFrm.ShowModal;
    if PBLUAccountManagerFrm.selected then
    begin
      SalesOrder.OfficeContact := PBLUAccountManagerFrm.SelCode;
      SalesOrder.AccountManagerName := PBLUAccountManagerFrm.SelName;
      edtAccountManager.Text := PBLUAccountManagerFrm.SelName;
      SalesOrder.AccountTeam := PBLUAccountManagerFrm.SelTeam;
      edtAccountTeam.Text := PBLUAccountManagerFrm.SelTeamName;
    end;
  finally
    PBLUAccountManagerFrm.Free;
  end;
  CheckOK(self);
*)
end;

procedure TSTMntSOrdFrm.HandleJobBagRequest(Query: TFDQuery;
  const inx: Integer);
var
  dmJobBag : TdmJobBag;
  i, iJobBag, iJobBagRequest: Integer;
begin
  dmJobBag := TdmJobBag.Create(Self);
  try
    with Query, SalesOrder.OrderLines[inx] do
    begin
      iJobBag := JobBagNo;
      for i := 0 to Pred(Params.Count) do
        Params[i].Clear;

      ParamByName('Job_Bag').asinteger := iJobBag;
      if JobBagNo > 0 then
        ParamByName('Request_no').AsInteger := STSalesOrdDM.GetNextJobBagRequest(iJobBag)
      else
        begin
          if iJobBagRequest = 0 then
            ParamByName('Request_no').AsInteger := 1
          else
            ParamByName('Request_no').AsInteger := iJobBagRequest;
        end;
      ParamByName('Sales_Order').asfloat := SalesOrder.SONumber;
      ParamByName('Sales_Order_Line_No').AsInteger := Line;
//      ParamByName('Sales_Order_Line_No').AsInteger := inx;
      ExecSQL;
    end;
  finally
    dmJobBag.Free;
  end;
end;

procedure TSTMntSOrdFrm.DeleteJobBagRequest(Query: TFDQuery;
  const inx: Integer);
var
  dmJobBag : TdmJobBag;
  iJobBag: Integer;
begin
  dmJobBag := TdmJobBag.Create(Self);
  try
    with Query, SalesOrder.OrderLines[inx] do
    begin
      iJobBag := JobBagNo;
      close;
      ParamByName('Job_Bag').asinteger := iJobBag;
      ParamByName('Sales_Order').asfloat := SalesOrder.SONumber;
      ParamByName('Sales_Order_Line_No').AsInteger := Line;
      execsql;
    end;
  finally
    dmJobBag.Free;
  end;

end;

procedure TSTMntSOrdFrm.edtFAOChange(Sender: TObject);
begin
  SalesOrder.FAO := edtFAO.Text;
end;

procedure TSTMntSOrdFrm.CustNameEditExit(Sender: TObject);
var
  sAccCode, sShortCode: string;
  i, iCustomer, iBranch, idelimiter, ilength: integer;
  sCustomerName, sBranchName, custStatus: string;
begin
  if CustBitBtn.focused or Cancelbitbtn.focused then
    begin
      CustNameEdit.text := '';
      exit;
    end;

  if trim(CustNameedit.Text) = '' then
    begin
      exit;
    end;

  {extract the account code and the branch short code}
  idelimiter := pos('/',(sender as TEdit).text);
  iLength := length(trim((sender as TEdit).text));

  sAccCode := copy((sender as TEdit).text,1,(idelimiter-1));
  sShortCode := copy((sender as TEdit).text,(idelimiter+1),(iLength-idelimiter));
  try
    with stSalesOrdDM.qryGetCustBranch do
    begin
      close;
      parambyname('Account_Code').asstring := sAccCode;
      parambyname('Short_Code').asstring := sShortCode;
      open;
      if recordcount = 0 then
        begin
          messagedlg('This customer and branch code doesn''t exist', mtError, [mbOk], 0);
          CustNameEdit.SetFocus;
          exit;
        end
      else
        begin
          iCustomer := fieldbyname('Customer').asinteger;
          iBranch := fieldbyname('Branch_no').asinteger;

          sCustomerName := fieldbyname('Customer_Name').asstring;
          sBranchName := fieldbyname('Branch_Name').asstring;

          CostCentreLevel := fieldbyname('Cost_Centre_Level').asstring;
          pnlCostCentre.visible := CostCentreLevel <> '';
          custStatus := dmBroker.GetCustomerStatus(iCustomer);
          if custStatus <> 'B' then
          begin
            if custStatus = 'S' then
              MessageDlg(cOnStop, mtWarning,[mbOk], 0)
            else
            if custStatus = 'O' then
              MessageDlg(cOverdue, mtWarning,[mbOk], 0);

            LineDetsStringGrid.enabled := True;
            if (SalesOrder.Customer <> iCustomer) or (SalesOrder.BranchNo <> iBranch) then
              begin
                if ffuncmode = soadd then
                begin
                  SalesOrder.SOHeadStatus := soCreated;
                  for i := 0 to pred(SalesOrder.OrderLines.Count) do
                    SalesOrder.OrderLines[i].SOLineStatus := slNotYetSent;
                end;
                defContact(iCustomer, iBranch);
              end;

            SalesOrder.Customer := iCustomer;
            CustNameEdit.Text := sCustomerName + '/' + sBranchName;

            sBranch := sBranchName;
            SalesOrder.BranchNo := iBranch;

            if deliveryEdit.text = '' then
              begin
                with stSalesOrdDM.qryGetSOLastDelivery do
                  begin
                    close;
                    parambyname('Customer').asinteger := SalesOrder.Customer;
                    parambyname('Branch_no').asinteger := SalesOrder.BranchNo;
                    open;
                    if recordcount = 0 then
                      begin
                        SalesOrder.deliveryCustomer := SalesOrder.Customer;
                        SalesOrder.DeliveryBranch := SalesOrder.Branchno;
                      end
                    else
                      begin
                        if fieldbyname('Ad_Hoc_Address').asinteger <> 0 then
                          begin
                            rdbtntoCust.Checked := false;
                            rdbtntoAdhoc.checked := true;
                            rdbtntoProduction.checked := false;
                            SalesOrder.AdhocAddress := fieldbyname('Ad_Hoc_Address').asinteger;
                            SalesOrder.deliveryCustomer := 0;
                            SalesOrder.DeliveryBranch := 0;
                          end
                        else
                          begin
                            rdbtntoCust.Checked := true;
                            rdbtntoAdhoc.checked := false;
                            rdbtntoProduction.checked := false;
                            SalesOrder.AdhocAddress := 0;
                            SalesOrder.deliveryCustomer := fieldbyname('Delivery_Customer').asinteger;
                            SalesOrder.DeliveryBranch := fieldbyname('Delivery_Branch').asinteger;
                          end;
                      end;
                  end;
                DeliveryEdit.text :=  STSalesOrdDM.GetCustName(SalesOrder.DeliveryCustomer)
                                + '/' + STSalesOrdDM.GetCustBranchName(SalesOrder.DeliveryCustomer,SalesOrder.DeliveryBranch);
              end;

            {Display Rep}
            dbLkpCmbRep.keyvalue := STSalesOrdDM.DefaultRep(iCustomer,iBranch);
            dbLkpCmbRepClick(Self);
            OrdEdit.SetFocus;
          end
          else
          begin
            //customer is on stop and on stop customers are blocked so warn user and return
            MessageDlg('This Customer is currently On Stop.'+#10#13+'Orders cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
          end;
        end;
    end;
  except
  end;
end;

procedure TSTMntSOrdFrm.UpdateStatus;
begin
  with StSalesOrdDM.UpdOrderStatusSQL, SalesOrder do
    begin
      Close;
      ParamByName('OrderNo').AsInteger := SONumber;

      ParamByName('Status').AsInteger := SOHeadStatus;
      ExecSQL;
    end;
end;

procedure TSTMntSOrdFrm.ChangePrices1Click(Sender: TObject);
begin
  CallLineDetailsMaintScreen(soChange);
end;

procedure TSTMntSOrdFrm.pMnuViewPopup(Sender: TObject);
var
  iCount: integer;
begin
  mnuAddItem.visible := true;
  for iCount := 0 to pred(SalesOrder.orderLines.count) do
    begin
      if (SalesOrder.orderLines[icount].PartClass = 'STK') or (SalesOrder.orderLines[icount].PartClass = 'NSTK') then
        begin
          mnuAddItem.visible := false;
          exit;
        end;
    end;
end;

end.


