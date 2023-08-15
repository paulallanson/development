unit pbluCustOrders;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ComCtrls, ExtCtrls, ToolWin, Mask, DBCtrls,
  ImgList, Db, Menus, stpickobject, IniFiles, Buttons, System.ImageList,
  FireDAC.Stan.Param;

const
  {Message values for communication between this child and its parent frmLuCustomers}
  luCustomers_childclosed   = WM_APP + 102; {sent from child to parent}
  luCustomers_parentclosed  = WM_APP + 103; {sent from parent to child}

type
  TfrmpbluCustOrders = class(TForm)
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    stsbrDetails: TStatusBar;
    Label1: TLabel;
    btnClose: TButton;
    edtSearch: TEdit;
    dbgDetails: TDBGrid;
    tmrSearch: TTimer;
    imglstOrders: TImageList;
    pmnAdd: TPopupMenu;
    btnFromPO: TMenuItem;
    btnFromSO: TMenuItem;
    pmnAllocate: TPopupMenu;
    mnuAllocate: TMenuItem;
    mnuDeAllocate: TMenuItem;
    pmnPicking: TPopupMenu;
    btnPrintPickNote: TMenuItem;
    btnConfirmPick: TMenuItem;
    pmnProofs: TPopupMenu;
    Approvalform1: TMenuItem;
    btnStatus1: TMenuItem;
    Label2: TLabel;
    edtNumber: TEdit;
    pmnfunctions: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Copy1: TMenuItem;
    Repeat1: TMenuItem;
    Print1: TMenuItem;
    N1: TMenuItem;
    Allocate1: TMenuItem;
    Picking1: TMenuItem;
    N2: TMenuItem;
    Proofs1: TMenuItem;
    N3: TMenuItem;
    Delivery1: TMenuItem;
    N4: TMenuItem;
    OnHold1: TMenuItem;
    ResetGrid1: TMenuItem;
    PageScroller1: TPageScroller;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnHistory: TToolButton;
    btnRepeat: TToolButton;
    btnPrint: TToolButton;
    btnseparator1: TToolButton;
    btnAllocatefnc: TToolButton;
    btnPicking: TToolButton;
    ToolButton3: TToolButton;
    btnProofs: TToolButton;
    btnDeliveriesSpacer: TToolButton;
    btnDeliveries: TToolButton;
    btnHold: TToolButton;
    Panel3: TPanel;
    Panel2: TPanel;
    lblTitle: TLabel;
    PageScroller2: TPageScroller;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    btnEnquiries: TToolButton;
    btnJobs: TToolButton;
    btnStock: TToolButton;
    btnProduction: TToolButton;
    btnCustomers: TToolButton;
    btnrequote: TToolButton;
    btnSalesInvoicing: TToolButton;
    btnDelete: TToolButton;
    Allocate2: TMenuItem;
    DeAllocate1: TMenuItem;
    PrintPickingNote1: TMenuItem;
    ConfirmPicking1: TMenuItem;
    ApprovalForm2: TMenuItem;
    Status2: TMenuItem;
    N5: TMenuItem;
    Requote1: TMenuItem;
    History1: TMenuItem;
    chkbxShowUnauthorised: TCheckBox;
    btnSearch: TBitBtn;
    btnQuotes: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnRepeatClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnDeliveriesClick(Sender: TObject);
    procedure btnHoldClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnAddMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFromPOClick(Sender: TObject);
    procedure btnFromSOClick(Sender: TObject);
    procedure btnPrintPickNoteClick(Sender: TObject);
    procedure btnConfirmPickClick(Sender: TObject);
    procedure mnuAllocateClick(Sender: TObject);
    procedure mnuDeAllocateClick(Sender: TObject);
    procedure btnAllocatefncClick(Sender: TObject);
    procedure Approvalform1Click(Sender: TObject);
    procedure btnStatus1Click(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure ResetGrid1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnEnquiriesClick(Sender: TObject);
    procedure btnJobsClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure pmnAllocatePopup(Sender: TObject);
    procedure btnrequoteClick(Sender: TObject);
    procedure btnSalesInvoicingClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnHistoryClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowUnauthorisedClick(Sender: TObject);
    procedure btnQuotesClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(sTempFuncMode: Char);
    procedure CallMaintSOScreen(sTempFuncMode: Char);
    procedure CallAllocScreen(sTempFuncMode: Char);
    procedure PrintPO;
    procedure PrintSO;
    function CheckInput: boolean;
    procedure SetOperator(iTempOp: Integer);
    procedure SetButtonProperties(Sender: TObject);
    function OrderAuthorised: boolean;
  protected
    procedure luCustomersParentClosed(var Message: TMessage); message luCustomers_ParentClosed;
  private
    iMnuMaintPOrds, iMnuMaintEnqs: integer;
    ActiveCode: real;
    DontSaveLayout: Boolean;
    FParentForm: TForm;
    FCustomer: integer;
    procedure SetParentForm(const Value: TForm);
    procedure SetCustomer(const Value: integer);
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    CustomerName: string;
    procedure ClearSearchCriteria;
    property Customer: integer read FCustomer write SetCustomer;
    property ParentForm: TForm read FParentForm write SetParentForm;
  end;

var
  frmpbluCustOrders: TfrmpbluCustOrders;

implementation

uses
  System.UITypes, System.Types,
  pbOrdersdm, pbluOrdersSearch, pbDatabase, PBMaintPOrd, pbPOObjects,
  PBRSPOrdN, PBLUCConta, STMntSOrd, stSOObjects, ccscommon,
  STPrtAllocSales, STRSPickNote, STStockDM, stPickingDM, STPickbyPart,
  STRSSalesOrd, PBLUProofHistN, PBRSProofN, pbMainMenu, pbluCustDeliv,
  pbluCustEnquiries, pbluCustomers, PBPOToEnq, PBMaintPOrdInactive, PBPOrdHist;

{$R *.DFM}

{ TfrmLuOrders }

procedure TfrmpbluCustOrders.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmpbluCustOrders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PostMessage(ParentForm.Handle, luCustomers_Childclosed, left, Top);

  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'CustomerOrderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmpbluCustOrders.luCustomersParentClosed(var Message: TMessage);
begin
  close;
  message.result := 1;
end;

procedure TfrmpbluCustOrders.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluCustOrders.FormCreate(Sender: TObject);  
var
  IniFile : TIniFile;
  stempDate: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    stempdate := IniFile.ReadString('Centrereed Broker', 'Customer Order Search Date', 'None');
  finally
    IniFile.Free;
  end;

  dtmdlOrders := TdtmdlOrders.create(self);

  btnAllocatefnc.visible := dtmdlOrders.stockinuse;
  btnPicking.visible := dtmdlOrders.stockinuse;

  btnSeparator1.visible := dtmdlOrders.stockinuse;

  if stempdate = 'None' then
    dtmdlOrders.OrderDate := Date - 365
  else
    dtmdlOrders.OrderDate := pbdatestr(stempdate);


  dtmdlOrders.dtsOrders.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlOrders.dtsOrders;

  btnStock.visible := frmPBMainMenu.btnStock.visible;
  btnJobs.visible := frmPBMainMenu.btnJobs.visible;

  CCSCommon.SetDBGridCols('', 'CustomerOrderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TfrmpbluCustOrders.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Centrereed Broker', 'Customer Order Search Date', pbdatestr(dtmdlOrders.OrderDate));
  finally
    IniFile.Free;
  end;

  dtmdlOrders.free;
end;

procedure TfrmpbluCustOrders.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
  dtmdlOrders.Customer := FCustomer;
  dtmdlOrders.RefreshData;
end;

procedure TfrmpbluCustOrders.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlOrders.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustOrders.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlOrders.refreshdata;
end;

procedure TfrmpbluCustOrders.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluCustOrders.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmpbluCustOrders.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlOrders do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
//    btnCopy.Enabled := HeaderCount > 0;
    btnHistory.Enabled := HeaderCount > 0;
    btnHold.Enabled := HeaderCount > 0;
    btnRequote.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnDeliveries.Enabled := HeaderCount > 0;
    btnAllocatefnc.enabled := (dbgDetails.datasource.dataset.fieldbyname('Order_type').asstring <> 'PO') and
                            (HeaderCount > 0);
    btnPicking.enabled := (dbgDetails.datasource.dataset.fieldbyname('Order_type').asstring <> 'PO')and
                            (HeaderCount > 0);
    btnProofs.enabled := (not btnPicking.enabled) and (HeaderCount > 0);

    btnRepeat.Enabled := (not btnPicking.enabled) and (HeaderCount > 0);

    if dbgDetails.datasource.dataset.fieldbyname('Needs_Authorising').asstring = 'Y' then
      edtNumber.text := 'N/A'
    else
      edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Sales_order').asstring;

    SetButtonProperties(Self);

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmpbluCustOrders.SetButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd, bTempCanRequote: ByteBool;
begin
  {They can UPDATE this order if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the PO Maint button on the menu} ;
//  iTempAccCtrl := iMnuBtnPOMaint ;
  bTempCanUpd :=  ((iMnuMaintPords = 1) or
                  (iMnuMaintPords = 4) or
                  (iMnuMaintPords = 5));
  {They can ADD orders IF} ;
  {    they have FULL, REP or OPERATOR access} ;
  bTempCanReQuote := ((iMnuMaintEnqs = 1) or (iMnuMaintEnqs = 4) or
                                        (iMnuMaintEnqs = 5)) ;
  bTempCanAdd := ((iMnuMaintPords = 1) or (iMnuMaintPords = 4) or
                                        (iMnuMaintPords = 5)) ;
  btnAdd.Visible := bTempCanAdd ;
  if bTempCanUpd then
    begin
      btnChange.Caption := '  &Change  ';
    end
  else
    begin
      btnChange.Caption := '   &View   ';
    end;
  btnRepeat.Visible := bTempCanUpd ;
  btnHold.Visible := bTempCanUpd ;
  btnRequote.Visible := bTempCanReQuote;
  btnDelete.Visible := bTempCanUpd;
  btnDeliveries.Visible := bTempCanUpd;
  btnDeliveriesSpacer.Visible := btnDeliveries.Visible;

  btnStatus1.Visible := bTempCanUpd;
  {Deal with the "Print POs" permissions} ;
(*  btnPrint.Visible := (dmBroker.AccessControlOpRep(iMnuBtnPOSend,frmpbMainMenu.iOperator,
        dtmdlAllOrders.dtsOrders.dataset.FieldByName('Operator').AsInteger, dtmdlAllOrders.dtsOrders.dataset.FieldByName('Rep').AsInteger) = 1) ;
  {Deal with the "Deliveries" permissions} ;
  btnDeliveries.Visible := (dmBroker.AccessControlOpRep(iMnuBtnDeliv,frmpbMainMenu.iOperator,
        dtmdlAllOrders.dtsOrders.dataset.FieldByName('Operator').AsInteger, dtmdlAllOrders.dtsOrders.dataset.FieldByName('Rep').AsInteger) = 1) ;
  {Deal with the "Proofs" permissions} ;
  btnApprovalForm1.Enabled := (dmBroker.AccessControlOpRep(iMnuBtnProof,frmpbMainMenu.iOperator,
        dtmdlAllOrders.dtsOrders.dataset.FieldByName('Operator').AsInteger, dtmdlAllOrders.dtsOrders.dataset.FieldByName('Rep').AsInteger) = 1) ;
  btnStatus1.Enabled := (dmBroker.AccessControlOpRep(iMnuBtnProofHist,frmpbMainMenu.iOperator,
        dtmdlAllOrders.dtsOrders.dataset.FieldByName('Operator').AsInteger, dtmdlAllOrders.dtsOrders.dataset.FieldByName('Rep').AsInteger) = 1) ;
  btnProofs.Visible := (btnApprovalForm1.Enabled) or (btnStatus1.Enabled) ;
*)
end;

procedure TfrmpbluCustOrders.btnSearchClick(Sender: TObject);
begin
  frmpbLuOrdersSearch := TfrmpbLuOrdersSearch.create(self);
  try
    frmpbLuOrdersSearch.dtmdlSearchOrders := dtmdlOrders;
    frmpbLuOrdersSearch.edtBranch.text := dtmdlOrders.BranchName;
    frmpbLuOrdersSearch.edtProductCode.Text := dtmdlOrders.ProductCode;
    frmpbLuOrdersSearch.edtFormReference.Text := dtmdlOrders.FormReference;
    frmpbLuOrdersSearch.edtCustOrderNo.Text := dtmdlOrders.CustomerRef;
    frmpbLuOrdersSearch.edtQuantity.Text := dtmdlOrders.OrdQtyDesc;
    frmpbLuOrdersSearch.edtDescription.Text := dtmdlOrders.Description;
    frmpbLuOrdersSearch.edtDescriptiveRef.Text := dtmdlOrders.DescriptiveRef;
    frmpbLuOrdersSearch.edtJobNumber.Text := dtmdlOrders.JobNumber;
    frmpbLuOrdersSearch.edtSupplier.text := dtmdlOrders.SupplierName;
    frmpbLuOrdersSearch.edtDate.Text := pbDateStr(dtmdlOrders.OrderDate);
    frmpbLuOrdersSearch.showModal;
  finally
    frmpbLuOrdersSearch.free;
  end;
end;

procedure TfrmpbluCustOrders.ClearSearchCriteria;
begin
  dtmdlOrders.BranchName := '';
  dtmdlOrders.ProductCode := '';
  dtmdlOrders.FormReference := '';
  dtmdlOrders.CustomerRef := '';
  dtmdlOrders.OrdQtyDesc := '';
  dtmdlOrders.Description := '';
  dtmdlOrders.OrderDate := pbDatestr('01/01/1990');

  edtSearch.text := '';
end;

procedure TfrmpbluCustOrders.btnAddClick(Sender: TObject);
begin
  {Add a new PO}
  if not dtmdlOrders.stockinuse then
    CallMaintScreen('A');
end;

procedure TfrmpbluCustOrders.CallMaintSOScreen(sTempFuncMode: Char);
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
      SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
      iSOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;
    end;
        
  if (iSOrdHeadStatus > 10) and (sTempFuncMode = 'D') then
  begin
    MessageDlg('This order has been ' +
      dbgDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ', you cannot delete it', mtError, [mbOK], 0);
    Exit;
  end;

  {Check whether the Sales Order has been included in a invoice Period End}
  if dtmdlOrders.PeriodEndRun('SO',selcode,0) and
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
      dbgDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ' - Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        sTempFuncMode := 'H';
      end
    else
      exit;
  end;

  if (sTempFuncMode = 'P') then
    begin
      if (dtmdlOrders.IsCustomerOnStop(dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger))
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
    dtmdlOrders.Refreshdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  end;
end;

procedure TfrmpbluCustOrders.CallMaintScreen(sTempFuncMode: Char);
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
      SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
      SelLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;
      iPOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;
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
          PBMaintPOrdInactiveFrm.iJobBag := dbgDetails.datasource.dataset.FieldByName('Job_Bag').asinteger;
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
          dtmdlOrders.Refreshdata;
        end;
        Exit;
      end
    else
      exit;
  end
  else if (iPOrdHeadStatus > 0) and (sTempFuncMode = 'D') then
  begin
    MessageDlg('This order has been ' +
      dbgDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ', you cannot delete it', mtError, [mbOK], 0);
    Exit;
  end;

  {Check whether the Purchase Order has been included in a invoice Period End}
  if dtmdlOrders.PeriodEndRun('PO',dbgDetails.datasource.dataset.FieldByName('Sales_order').Asfloat,selline) and
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
          (dbgDetails.datasource.dataset.FieldByName('Authorised_by').asinteger <> 0) then
  begin
    if (dbgDetails.datasource.dataset.FieldByName('Authorised_by').asinteger <> frmPBMainMenu.iOperator) then
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
      dbgDetails.datasource.dataset.FieldByName('Status_Description').AsString +
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
    dtmdlOrders.Refreshdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(rTempSel)),[lopartialKey]) ;
    end;
  end;
end;

function TfrmpbluCustOrders.CheckInput: boolean;
var
  poNumber: string;
begin
  result := true;

  if trim(edtNumber.Text) = 'N/A' then
    poNumber := dbgDetails.datasource.DataSet.fieldbyname('Order_Number').asstring
  else
    poNumber := edtNumber.text;

  if not dbgDetails.datasource.DataSet.locate('Sales_order', Variant(poNumber),[lopartialKey]) then
    begin
      messagedlg('Order '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmpbluCustOrders.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  if dbgDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
    CallMaintScreen('C')
  else
    CallMaintSOScreen('C');

end;

procedure TfrmpbluCustOrders.btnCopyClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  if dmBroker.GetCustomerStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Orders cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  if dbgDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
    CallMaintScreen('P')
  else
    CallMaintSOScreen('P');
end;

procedure TfrmpbluCustOrders.btnRepeatClick(Sender: TObject);
var
  bAuthorised: boolean;
begin
  if not CheckInput then
    exit;

  if dmBroker.GetCustomerStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Orders cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  bAuthorised := not (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');
  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  if (dbgDetails.datasource.dataset.fieldByName('NCA_Live_Lines').Asinteger > 0) or (dbgDetails.datasource.dataset.fieldByName('NCA_Signed_off').Asinteger > 0) then
    begin
      MessageDlg('Non Conformance issues exist for this order, please make a note of the details.', mtWarning, [mbOk], 0);
    end;

  if dbgDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
    CallMaintScreen('M');
end;

procedure TfrmpbluCustOrders.btnPrintClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  if dbgDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
    PrintPO
  else
    PrintSO;
end;

procedure TfrmpbluCustOrders.PrintSO;
var
  bTempOK: Boolean;
  selcode: integer;
begin
  selcode := dbgDetails.datasource.dataset.fieldbyname('Sales_order').asinteger;
  try
    STRSSalesOrdfrm := TSTRSSalesOrdfrm.create(self);
    STRSSalesOrdfrm.OrderGroupBox.caption := STRSSalesOrdfrm.OrderGroupBox.caption + inttostr(selcode);
    STRSSalesOrdfrm.Customerlbl.caption := CustomerName;
    STRSSalesOrdfrm.OrderDateLbl.caption := dbgDetails.datasource.dataset.fieldbyname('Order_Date').asstring;
    STRSSalesOrdfrm.SONumber := selcode;
    STRSSalesOrdfrm.showmodal;
    bTempOK := STRSSalesOrdfrm.bOK;
  finally
    STRSSalesOrdfrm.free;
  end;
  If bTempOK then
  begin
    dtmdlOrders.Refreshdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TfrmpbluCustOrders.PrintPO;
var
  bTempOK: Boolean;
  selcode: integer;
  bAuthorised: boolean;
begin
  bAuthorised := not (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
    end;

  {Purchase order Print/Fax}
  selcode := dbgDetails.datasource.dataset.fieldbyname('Sales_order').asinteger;

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
    dtmdlOrders.Refreshdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

function TfrmpbluCustOrders.OrderAuthorised: boolean;
var
  rPOLimit, rLimit: real;
  rPOValue: real;
begin
  result := True;

  if dtmdlOrders.IsPOAuthorised(dbgDetails.datasource.DataSet.FieldByName('Sales_Order').Asfloat) then
    exit;

  with dtmdlOrders.qryOperator do
    begin
      close;
      parambyname('Operator').asinteger := frmpbMainMenu.iOperator;
      open;
      rPOLimit := fieldbyname('Max_UnAuthorised_PO_Value').asfloat;
    end;

  rPOValue := CalcTotalValue(dbgDetails.datasource.DataSet.FieldByName('Quantity').AsInteger,
                             dbgDetails.datasource.DataSet.FieldByName('Order_Unit').AsInteger,
                             dbgDetails.datasource.DataSet.FieldByName('Order_Price').Asfloat);
  rLimit := dmBroker.GetDefaultPOrderLimit;

  if rPOLimit > rLimit then
    rLimit := rPOLimit;

  if rPOValue > rLimit then
    begin
      MessageDlg('The value of this purchase order is ' + FloatToStrF(rPOValue, ffCurrency, 15, 2) + ', which is over your '
                  + 'order limit of ' + FloatToStrF(rLimit, ffCurrency, 15, 2) +  ', please obtain the necessary authorisation.', mterror, [mbOk], 0);
      result := false;
    end;
end;

procedure TfrmpbluCustOrders.btnDeliveriesClick(Sender: TObject);
var
  tempSO: real;
  bAuthorised: boolean;
begin
  if not CheckInput then
    exit;

  bAuthorised := not (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  tempSO := dbgDetails.DataSource.dataset.fieldbyname('Sales_order').asfloat;
  frmpbluOrderDeliv := TfrmpbluOrderDeliv.create(self);
  try
    frmpbluOrderDeliv.Ordertype := dbgDetails.DataSource.dataset.fieldbyname('Order_type').asstring;
    frmpbluOrderDeliv.OrderNumber := dbgDetails.DataSource.dataset.fieldbyname('Sales_order').asfloat;
    frmpbluOrderDeliv.caption := frmpbluOrderDeliv.caption + ' ' + dbgDetails.DataSource.dataset.fieldbyname('Sales_order').asstring;
    frmpbluOrderDeliv.showmodal;
  finally
    frmpbluOrderDeliv.free;
    dtmdlOrders.refreshdata;
    dbgDetails.datasource.dataset.locate('Sales_Order', Variant(floattostr(tempSO)),[lopartialKey]) ;
  end;
end;

procedure TfrmpbluCustOrders.btnHoldClick(Sender: TObject);
var
  stext: string;
  iPordHeadStatus: integer;
  rTemPSel: real;
  SelCode: real;
  SelLine: integer;
  bAuthorised: boolean;
begin
  if not CheckInput then
    exit;

  bAuthorised := not (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  SelLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;
  iPOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  if dbgDetails.datasource.dataset.FieldByName('On_Hold').AsString = 'Y' then
    sText := ' remove the On Hold status for this order.'
  else
    begin
      if (iPOrdHeadStatus > 22) and (dbgDetails.datasource.DataSet.FieldByName('Supp_Inv_Recd').asstring = 'Y') then
      begin
        MessageDlg('This order has been ' +
          dbgDetails.datasource.dataset.FieldByName('Status_Description').AsString +
          ' and been matched against a supplier invoice, you cannot set this order On Hold', mtError, [mbOK], 0);
        exit;
      end;

      stext := ' place this order On Hold.';
    end;

  if MessageDlg('Confirm you wish to'+stext, mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
    Exit
  else
    begin
      with dtmdlOrders.qryOnHold do
        begin
          close;
          parambyname('Purchase_Order').asfloat := selCode ;
          parambyname('Line').asinteger := selLine;
          if (dbgDetails.datasource.dataset.FieldByName('On_Hold').AsString = 'Y') then
            parambyname('On_Hold').asstring := 'N'
          else
            parambyname('On_Hold').asstring := 'Y';
          execsql;
        end;
      rTempSel := selcode;
      dtmdlOrders.Refreshdata;
      dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(rTempSel)),[lopartialKey]) ;
    end;
end;

procedure TfrmpbluCustOrders.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeclick(self);
end;

procedure TfrmpbluCustOrders.btnAddMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if dtmdlOrders.stockinuse then
    btnAdd.dropdownMenu := pmnAdd;
end;

procedure TfrmpbluCustOrders.btnFromPOClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmpbluCustOrders.btnFromSOClick(Sender: TObject);
begin
  CallMaintSOScreen('A');
end;

procedure TfrmpbluCustOrders.CallAllocScreen(sTempFuncMode: Char);
var
  iTempSel: Integer;
  bTempOK: Boolean;
  selcode: integer;
begin
  SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
  STPrtAllocSalesFrm := TSTPrtAllocSalesFrm.Create(Self);
  try
    STPrtAllocSalesFrm.iOrder := selcode;
    STPrtAllocSalesFrm.bDeAlloc := (sTempFuncMode = 'D');

    STPrtAllocSalesFrm.iStoreFrom := dtmdlOrders.GetSOPartStore(selcode);
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
    dtmdlOrders.Refreshdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  end;
end;

procedure TfrmpbluCustOrders.btnPrintPickNoteClick(Sender: TObject);
var
  Reprint: ByteBool;
  selcode: integer;
  iSordHeadStatus: integer;
  bTempOK: Bytebool;
begin
  if not CheckInput then
    exit;
  Reprint := false;
  selcode := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  iSOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

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
      messagedlg('The status of this order is '+ dbgDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ' can only print/reprint Despatch Note.', mtWarning,
      [mbOk], 0);
     exit;
    end;

  if (dtmdlOrders.GetSOReplenSource(selcode) = 1) then
    begin
      messagedlg('Picking Notes cannot be printed for Direct Supply orders', mtInformation,
      [mbOk], 0);
      exit;
    end;

  STRSPickNotefrm:= TSTRSPickNotefrm.create(self);
  try
    STRSPickNotefrm.OrderGroupBox.caption := STRSPickNotefrm.OrderGroupBox.caption + inttostr(selcode);
    STRSPickNotefrm.Customerlbl.caption := CustomerName;
    STRSPickNotefrm.OrderDateLbl.caption := dbgDetails.datasource.dataset.fieldbyname('Order_Date').asstring;
    STRSPickNotefrm.DeliveryDateEdit.text := dbgDetails.datasource.dataset.fieldbyname('Goods_Required').asstring;
    STRSPickNotefrm.SONumber := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
    STRSPickNotefrm.DateRequired := dbgDetails.datasource.dataset.fieldbyname('Goods_Required').asdatetime;
    STRSPickNotefrm.Reprint := Reprint;
    STRSPickNotefrm.showmodal;
    bTempOK := STRSPickNotefrm.bOK;
  finally
    STRSPickNotefrm.free;
  end;
  If bTempOK then
  begin
    dtmdlOrders.Refreshdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TfrmpbluCustOrders.btnConfirmPickClick(Sender: TObject);
var
  selcode: integer;
  bTempOK: Bytebool;
  iIntSelCode: integer;
  sPickRef: string;
  iSOrdHeadStatus: integer;
begin
  if not CheckInput then
    exit;
  selcode := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  iSOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  if (iSordHeadStatus = 150) then
    begin
      messagedlg('Cannot reconfirm the Delivery', mtWarning,
      [mbOk], 0);
      exit
    end;

  if (iSordHeadStatus > 150) then
    begin
      messagedlg('The status of this order is '+ dbgDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ' cannot Confirm the Delivery again.', mtWarning,
      [mbOk], 0);
      exit;
    end;

  if (dtmdlOrders.GetSoReplenSource(selcode) = 1) then
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
  sPickRef := dtmdlOrders.GetPickingRef(selcode);
  dmBroker.AddIntSelCode(iIntSelCode, StrToFloatDef(sPickRef, 0, FormatSettings), sPickRef);
  
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
    dtmdlOrders.Refreshdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TfrmpbluCustOrders.mnuAllocateClick(Sender: TObject);
begin
  CallAllocScreen('A');
end;

procedure TfrmpbluCustOrders.mnuDeAllocateClick(Sender: TObject);
begin
  CallAllocScreen('D');
end;

procedure TfrmpbluCustOrders.btnAllocatefncClick(Sender: TObject);
var
  iSordHeadStatus: integer;
  selcode: integer;
begin
  if not CheckInput then
    exit;

  selcode := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;;
  iSOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;
  if (iSOrdHeadStatus > 50) then
    begin
      messagedlg('The status of this order is '+ dbgDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ' unable to process allocations.', mtInformation,
      [mbOk], 0);
      exit;
    end;

  if (dtmdlOrders.GetSoReplenSource(selcode) = 1) then
    begin
      messagedlg('Direct Supply orders cannot be allocated/deallocated', mtInformation,
      [mbOk], 0);
      exit;
    end;
  btnAllocatefnc.dropdownmenu := pmnAllocate;
end;

procedure TfrmpbluCustOrders.Approvalform1Click(Sender: TObject);
var
  SelCode: real;
  SelLine: integer;
  bAuthorised: boolean;
begin
  if not CheckInput then
    exit;

  bAuthorised := not (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  SelLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;
  {Check whether the Proof has already been printed}
  if dbgDetails.datasource.Dataset.fieldbyname('Proof_Revision').asstring <> '' then
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

procedure TfrmpbluCustOrders.btnStatus1Click(Sender: TObject);
var
  selcode: real;
  selline: integer;
  bAuthorised: boolean;
begin
  if not CheckInput then
    exit;

  bAuthorised := not (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  SelLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;

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

procedure TfrmpbluCustOrders.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);

end;

procedure TfrmpbluCustOrders.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('CustomerOrderLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmpbluCustOrders.FormActivate(Sender: TObject);
begin
  SetOperator(frmPBMainMenu.iOperator);
  if Customer <> 0 then
    begin
      dtmdlOrders.refreshdata;
      dbgDetails.DataSource.DataSet.Locate('Sales_Order', Variant(floattostr(ActiveCode)),[lopartialKey]);
    end;
    
  iMnuMaintPOrds := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuProduction') ;
  iMnuMaintEnqs := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuEnquiries') ;
end;

procedure TfrmpbluCustOrders.btnEnquiriesClick(Sender: TObject);
begin
  frmpbluCustomers.btnEnquiriesClick(self);
end;

procedure TfrmpbluCustOrders.btnJobsClick(Sender: TObject);
begin
  frmpbluCustomers.btnJobsClick(self);
end;

procedure TfrmpbluCustOrders.btnStockClick(Sender: TObject);
begin
  frmpbluCustomers.btnStockClick(self);
end;

procedure TfrmpbluCustOrders.btnCustomersClick(Sender: TObject);
begin
  frmpbluCustomers.btnCustomersClick(self);
end;

procedure TfrmpbluCustOrders.pmnAllocatePopup(Sender: TObject);
var
  selcode: integer;
begin
  selcode := dbgDetails.datasource.DataSet.FieldByName('Sales_order').AsInteger;
  mnuAllocate.enabled :=  (dtmdlOrders.GetSoReplenSource(selcode) <> 1) and
                          (dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger >= 10) and
                          (dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger < 50);

  mnuDeAllocate.enabled := (dtmdlOrders.GetSoReplenSource(selcode) <> 1) and
                           (dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger = 50);


end;

procedure TfrmpbluCustOrders.btnrequoteClick(Sender: TObject);
var
  bAuthorised: boolean;
begin
  if not CheckInput then
    exit;

  bAuthorised := not (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');

  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  if dbgDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
  begin
  PBPOToEnqFrm := TPBPOToEnqFrm.Create(Self);
  try
    PBPOToEnqFrm.PONumber := dbgDetails.datasource.DataSet.fieldbyname('sales_order').asfloat;
    PBPOToEnqFrm.iLine := dbgDetails.datasource.dataset.fieldbyname('Line').asinteger;
    PBPOToEnqFrm.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    PBPOToEnqFrm.CustomerName := CustomerName;
    PBPOToEnqFrm.Description := dbgDetails.datasource.dataset.fieldbyname('Description').asstring;
    PBPOToEnqFrm.Quantity := dbgDetails.datasource.dataset.fieldbyname('Quantity').asinteger;
    PBPOToEnqFrm.ShowModal;
  finally
    PBPOToEnqFrm.Free;
  end;
  end;
end;

procedure TfrmpbluCustOrders.btnSalesInvoicingClick(Sender: TObject);
begin
  frmpbluCustomers.btnSalesInvoicingClick(self);
end;

procedure TfrmpbluCustOrders.SetOperator(iTempOp: Integer);
var
  icount                      : Integer;
  cTempComp                   : TComponent;
begin
  {Disable all selection buttons}
  for icount := 0 to ComponentCount - 1 do
  begin
    if Components[icount] is TToolButton then
    begin
      if TToolButton(Components[icount]).Parent.Name <> 'ToolBar1' then
        TToolButton(Components[icount]).Enabled := False;
    end;
  end;
  {Set buttons according to file}
  try
    with dmBroker.qryGetButtons do
    begin
      Close;
      ParamByName('Operator').AsInteger := iTempOp;
      Open;
      First;
      while not EOF do
      begin
        cTempComp :=
          self.FindComponent(stringreplace((FieldByName('Button_Name').AsString),'mnu','btn',[rfReplaceAll,rfIgnoreCase]));
        if Assigned(cTempComp) then
          if cTempComp is TToolButton then
            try
            (cTempComp as TToolButton).Enabled := (FieldByName('Button_Status').AsString <> 'B');
            except
            end;
        Next;
      end;
    end;
  except
  end;
  btnProduction.Enabled := false;
end;
procedure TfrmpbluCustOrders.btnDeleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  if dbgDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
    CallMaintScreen('D')
  else
    CallMaintSOScreen('D');
end;

procedure TfrmpbluCustOrders.btnHistoryClick(Sender: TObject);
var
  PBPOrdHistFrm: TPBPOrdHistFrm;
begin
  if dbgDetails.DataSource.DataSet.FieldByName('original_order').asFloat = 0.00 then
  begin
    messageDlg('There is no previous order history for this order.', mtInformation, [mbOK], 0);
  end
  else
  begin
    PBPOrdHistFrm := TPBPOrdHistFrm.Create(self);
    try
      PBPOrdHistFrm.PONum :=
        dbgDetails.DataSource.DataSet.FieldByName('sales_Order').asFloat;
      PBPOrdHistFrm.lineNo :=
        dbgDetails.DataSource.DataSet.FieldByName('line').asInteger;

      PBPOrdHistFrm.ShowModal;
    finally
      PBPOrdHistFrm.Free;
    end;
  end;
end;

procedure TfrmpbluCustOrders.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y') then
    begin
      if (dbgDetails.datasource.dataset.fieldByName('Order_Status').AsInteger = 5) then
        (Sender as TDBGrid).Canvas.Brush.color := cllime
      else
        (Sender as TDBGrid).Canvas.font.Color := clLime
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') then
    (Sender as TDBGrid).Canvas.font.Color := clRed
  else
  if (dbgDetails.datasource.dataset.fieldByName('Authorised_By').AsInteger <> 0) then
    (Sender as TDBGrid).Canvas.font.style := [fsBold]
  else
  if (dbgDetails.datasource.dataset.fieldByName('NCA_Live_Lines').Asinteger > 0) then
    (Sender as TDBGrid).Canvas.Brush.color := clRed
  else
  if (dbgDetails.datasource.dataset.fieldByName('NCA_Signed_Off').Asinteger > 0) then
    (Sender as TDBGrid).Canvas.Brush.color := cllime;

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

procedure TfrmpbluCustOrders.chkbxShowUnauthorisedClick(Sender: TObject);
begin
  dtmdlOrders.ShowOnlyUnAuthorised := (Sender as TCheckbox).checked;
  dtmdlOrders.RefreshPOData;
end;

procedure TfrmpbluCustOrders.btnQuotesClick(Sender: TObject);
begin
  frmpbluCustomers.btnQuotesClick(self);
end;

procedure TfrmpbluCustOrders.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  except
    ActiveCode := 0;
  end;
end;

end.
