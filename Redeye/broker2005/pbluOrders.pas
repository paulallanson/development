unit pbluOrders;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, ImgList, ToolWin, Menus,
  Db, pbOrdersDM, inifiles, Buttons, System.ImageList;

type
  TfrmpbLUOrders = class(TForm)
    CoolBar1: TCoolBar;
    imglstOrders: TImageList;
    tmrSearch: TTimer;
    dbgDetails: TDBGrid;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnClose: TButton;
    edtSearch: TEdit;
    edtNumber: TEdit;
    pmnAdd: TPopupMenu;
    btnFromPO: TMenuItem;
    btnFromSO: TMenuItem;
    pmnProofs: TPopupMenu;
    btnApprovalform1: TMenuItem;
    btnStatus1: TMenuItem;
    pmnFunctions: TPopupMenu;
    pmnuAdd: TMenuItem;
    pmnuChange: TMenuItem;
    pmnuCopy: TMenuItem;
    pmnuRepeat: TMenuItem;
    pmnuPrintFax: TMenuItem;
    N1: TMenuItem;
    pmnuProofs: TMenuItem;
    N3: TMenuItem;
    pmnuDelivery: TMenuItem;
    N4: TMenuItem;
    pmnuResetGrid: TMenuItem;
    PageScroller1: TPageScroller;
    Panel3: TPanel;
    Label3: TLabel;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnHistory: TToolButton;
    btnRepeat: TToolButton;
    btnPrint: TToolButton;
    btnRequote: TToolButton;
    btnseparator1: TToolButton;
    ToolButton3: TToolButton;
    btnProofs: TToolButton;
    btnDeliveriesSpacer: TToolButton;
    btnDeliveries: TToolButton;
    btnHold: TToolButton;
    ToolButton4: TToolButton;
    btnreports: TToolButton;
    N2: TMenuItem;
    pmnuCancel: TMenuItem;
    btnDelete: TToolButton;
    ApprovalForm1: TMenuItem;
    Status1: TMenuItem;
    pmnuCurrentCharges: TMenuItem;
    pmnuRequote: TMenuItem;
    chkbxShowUnauthorised: TCheckBox;
    btnSearch: TBitBtn;
    lblWorkinProgress: TLabel;
    btnCopy: TToolButton;
    btnRefresh: TToolButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnRepeatClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnHoldClick(Sender: TObject);
    procedure btnApprovalform1Click(Sender: TObject);
    procedure btnStatus1Click(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnDeliveriesClick(Sender: TObject);
    procedure btnFromPOClick(Sender: TObject);
    procedure pmnuResetGridClick(Sender: TObject);
    procedure btnreportsClick(Sender: TObject);
    procedure btnRequoteClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure pmnuCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnHistoryClick(Sender: TObject);
    procedure pmnuCurrentChargesClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowUnauthorisedClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    ActiveCode: real;
    DontSaveLayout: Boolean;
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtonProperties(Sender: TObject);
    function OrderAuthorised: boolean;
  private
    FActivated: boolean;
    dtmdlAllOrders: TdtmdlOrders;
    iOperatorRep: Integer;
    iMnuMaintPOrds, iMnuMaintEnqs: integer;
    iMnuBtnPOMaint, iMnuBtnPOSend, iMnuBtnDeliv, iMnuBtnProof, iMnuBtnProofHist: Integer ;
    procedure CallMaintScreen(sTempFuncMode: Char);
    function CheckInput: boolean;
    procedure PrintPO;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
  end;

var
  frmpbLUOrders: TfrmpbLUOrders;

implementation

uses
  System.UITypes, System.Types,
  pbDatabase, PBRSProofN, PBLUProofHistN, pbMainMenu, PBMaintPOrd, pbPOObjects,
  PBRSPOrdN, pbluOrdersSearch, pbluCustDeliv, ccscommon, pbLUOrderRpts,
  PBPOToEnq, PBMaintPOrdInactive, PBPOrdHist, PBLUPOLAddChgs;

{$R *.DFM}

procedure TfrmpbLUOrders.CallMaintScreen(sTempFuncMode: Char);
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
(*  else
        dmBroker.iAccCtrlMenu := 1 ;
*)
  {Check whether the Purchase Order has been included in an invoice Period End}
  if dtmdlAllOrders.PeriodEndRun('PO',dbgDetails.datasource.dataset.FieldByName('Sales_order').Asfloat,selline) and
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
  else if (iPOrdHeadStatus > 0) and (iPOrdHeadStatus < 25) and (sTempFuncMode = 'D') then
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
          dtmdlAllOrders.RefreshPOdata;
        end;
        Exit;
      end
    else
      exit;
  end
  else if (iPOrdHeadStatus > 0) and (sTempFuncMode = 'D') and (dmBroker.iAccCtrlMenu = 1) then
  begin
    MessageDlg('This order has been ' +
      dbgDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ', you cannot delete it', mtError, [mbOK], 0);
    Exit;
  end
  else if (iPOrdHeadStatus >= 10) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) and
          (dbgDetails.datasource.dataset.FieldByName('Authorised_by').asinteger <> 0) then
  begin
    if (dbgDetails.datasource.dataset.FieldByName('Authorised_by').asinteger <> frmPBMainMenu.iOperator) then
      begin
        if MessageDlg('This order has been authorised, you cannot change the cost and sales values' +
          ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
          Exit;
      end;
  end
  else if (iPOrdHeadStatus > 10) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
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
    dtmdlAllOrders.refreshPOdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(rTempSel)),[lopartialKey]) ;
    end;
  end;
end;

procedure TfrmpbLUOrders.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllOrders do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnCopy.Enabled := HeaderCount > 0;
    btnHistory.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnRepeat.Enabled := HeaderCount > 0;
    btnRequote.Enabled := HeaderCount > 0;
    btnHold.Enabled := HeaderCount > 0;
    btnDeliveries.Enabled := HeaderCount > 0;
    btnProofs.enabled := HeaderCount > 0;

    if dbgDetails.datasource.dataset.fieldbyname('Needs_Authorising').asstring = 'Y' then
      edtNumber.text := 'N/A'
    else
      edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Sales_order').asstring;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    lblWorkinProgress.Visible := ShowWIP;
    
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmpbLUOrders.SetButtonProperties(Sender: TObject);
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
  btnDeliveries.Visible := bTempCanUpd;
  btnDeliveriesSpacer.Visible := btnDeliveries.Visible;
  btnDelete.Visible := bTempCanUpd and dmBroker.OperatorCanDeletePurchaseOrders(frmPBMainMenu.iOperator);

  btnStatus1.Visible := bTempCanUpd;

// set popup menu properties
  pmnuAdd.Visible := btnAdd.Visible;
  pmnuChange.Visible := btnChange.Visible;
  pmnuCopy.Visible := false;
  pmnuRequote.visible := btnRequote.Visible;
  pmnuRepeat.Visible := btnRepeat.Visible;
  pmnuPrintFax.Visible := btnPrint.Visible;
  pmnuProofs.Visible := btnProofs.Visible;
  pmnuDelivery.Visible := btnDeliveries.visible;
  pmnuCancel.visible := btnDelete.visible;
  pmnuCurrentCharges.Visible := bTempCanUpd;
end;

procedure TfrmpbLUOrders.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbLUOrders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'OrderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmpbLUOrders.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
  sShowWIP: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      stempdate := ReadString('Centrereed Broker', 'Order Search Date', 'None');
      sShowWIP := ReadString('Centrereed Broker', 'Show Purchase Order WIP', 'None');
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllOrders := TdtmdlOrders.create(self);

  btnSeparator1.visible := dtmdlAllOrders.stockinuse;

  if stempdate = 'None' then
    dtmdlAllOrders.OrderDate := Date - 365
  else
    dtmdlAllOrders.OrderDate := pbdatestr(stempdate);

  if sShowWIP = 'None' then
    dtmdlAllOrders.ShowWIP := false
  else
    dtmdlAllOrders.ShowWIP := true;

  dtmdlAllOrders.dtsOrders.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllOrders.dtsOrders;

  chkbxShowUnauthorised.Visible := (dmBroker.CanAuthorise(frmPBMainMenu.iOperator) = 'P') or
                                   (dmBroker.CanAuthorise(frmPBMainMenu.iOperator) = 'F');

  CCSCommon.SetDBGridCols('', 'OrderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
//  dmBroker.ScreenAccessControl(Self,'mnuProduction',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmpbLUOrders.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowWIP: string;
begin
  if dtmdlAllOrders.ShowWIP then
    sShowWIP := 'Show'
  else
    sShowWIP := 'None';

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      WriteString('Centrereed Broker', 'Order Search Date', pbdatestr(dtmdlAllOrders.OrderDate));
      WriteString('Centrereed Broker', 'Show Purchase Order WIP', sShowWIP);
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllOrders.free;
end;

procedure TfrmpbLUOrders.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllOrders.refreshPOdata;
end;

procedure TfrmpbLUOrders.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmpbLUOrders.edtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmpbLUOrders.btnAddClick(Sender: TObject);
begin
  {Add a new PO}
//  if not dtmdlAllOrders.stockinuse then
    CallMaintScreen('A');
end;

procedure TfrmpbLUOrders.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallMaintScreen('C')
end;

function TfrmpbLUOrders.CheckInput: boolean;
var
  poNumber: string;
begin
  result := true;

  if trim(edtNumber.Text) = 'N/A' then
    poNumber := dbgDetails.datasource.DataSet.fieldbyname('Order_Number').asstring
  else
    poNumber := edtNumber.text;

  if not dbgDetails.datasource.DataSet.locate('Sales_order', Variant(poNumber),[lopartialKey]) and
     not dbgDetails.datasource.DataSet.locate('Alt_Purchase_Order', Variant(poNumber),[lopartialKey]) then
    begin
      messagedlg('Order '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmpbLUOrders.btnCopyClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  if dmBroker.GetCustomerStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Orders cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  CallMaintScreen('P')
end;

procedure TfrmpbLUOrders.btnRepeatClick(Sender: TObject);
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

procedure TfrmpbLUOrders.btnPrintClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  PrintPO
end;

procedure TfrmpbLUOrders.PrintPO;
var
  bTempOK: Boolean;
  selcode: real;
  bAuthorised: boolean;
begin
  bAuthorised := not (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');
  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
    end;

  {Purchase order Print/Fax}
  selcode := dbgDetails.datasource.dataset.fieldbyname('Sales_order').asfloat;

  PBRSPOrdNFrm := TPBRSPOrdNFrm.Create(Self);
  try
    PBRSPOrdNFrm.bAuthorised := bAuthorised;
    PBRSPOrdNFrm.EnquiryMemo.text := floattostr(selcode);

    PBRSPOrdNFrm.ShowModal;
    bTempOK := PBRSPOrdNFrm.bOK;
  finally
    PBRSPOrdNFrm.Free;
  end;

  if bTempOK then
  begin
    dtmdlAllOrders.refreshPOdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

function TfrmpbLUOrders.OrderAuthorised: boolean;
var
  rPOLimit, rLimit: real;
  rPOValue: real;
begin
  result := True;

  if dtmdlAllOrders.IsPOAuthorised(dbgDetails.datasource.DataSet.FieldByName('Sales_Order').Asfloat) then
    exit;

  with dtmdlAllOrders.qryOperator do
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

procedure TfrmpbLUOrders.btnHoldClick(Sender: TObject);
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
      with dtmdlAllOrders.qryOnHold do
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
      dtmdlAllOrders.refreshPOdata;
      dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(rTempSel)),[lopartialKey]) ;
    end;
end;

procedure TfrmpbLUOrders.btnApprovalform1Click(Sender: TObject);
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

procedure TfrmpbLUOrders.btnStatus1Click(Sender: TObject);
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

procedure TfrmpbLUOrders.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmpbLUOrders.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllOrders.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbLUOrders.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbLUOrders.btnSearchClick(Sender: TObject);
begin
  frmpbLuOrdersSearch := TfrmpbLuOrdersSearch.create(self);
  try
    frmpbLuOrdersSearch.dtmdlSearchOrders := dtmdlAllOrders;
    frmpbLuOrdersSearch.SearchType := 'PO';
    frmpbLuOrdersSearch.edtBranch.text := dtmdlAllOrders.BranchName;
    frmpbLuOrdersSearch.edtProductCode.Text := dtmdlAllOrders.ProductCode;
    frmpbLuOrdersSearch.edtFormReference.Text := dtmdlAllOrders.FormReference;
    frmpbLuOrdersSearch.edtCustOrderNo.Text := dtmdlAllOrders.CustomerRef;
    frmpbLuOrdersSearch.edtQuantity.Text := dtmdlAllOrders.OrdQtyDesc;
    frmpbLuOrdersSearch.edtDescription.Text := dtmdlAllOrders.Description;
    frmpbLuOrdersSearch.edtDescriptiveRef.Text := dtmdlAllOrders.DescriptiveRef;
    frmpbLuOrdersSearch.edtJobNumber.Text := dtmdlAllOrders.JobNumber;
    frmpbLuOrdersSearch.edtSupplier.text := dtmdlAllOrders.SupplierName;
    frmpbLuOrdersSearch.edtDate.Text := pbDateStr(dtmdlAllOrders.OrderDate);
    frmpbLuOrdersSearch.chkbxShowCancelled.checked := dtmdlAllOrders.ShowInactive;
    frmpbLuOrdersSearch.chkbxShowWIP.checked := dtmdlAllOrders.ShowWIP;
    frmpbLuOrdersSearch.edtStatus.text := dtmdlAllOrders.Status;
    frmpbLuOrdersSearch.edtRep.Text := dtmdlAllOrders.RepName;
    frmpbLuOrdersSearch.edtAccountMgr.Text := dtmdlAllOrders.AccountMgr;
    frmpbLuOrdersSearch.edtOperator.Text := dtmdlAllOrders.OperatorName;
    frmpbLuOrdersSearch.showModal;
  finally
    frmpbLuOrdersSearch.free;
  end;
end;

procedure TfrmpbLUOrders.btnDeliveriesClick(Sender: TObject);
var
  tempSO: real;
  bAuthorised: boolean;
  bCanConfirm: boolean;
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

  bCanConfirm := true;

(*  if (dbgDetails.datasource.dataset.fieldByName('Proof_Required').AsString = 'Y') and
     not dtmdlAllOrders.ProofApproved(dbgDetails.datasource.dataset.fieldByName('Sales_Order').asfloat,
                                      dbgDetails.datasource.dataset.fieldByName('Line').asinteger) then
    begin
      bCanConfirm := false;
      if MessageDlg('This order requires a proof, the proof must be approved before the delivery can be confirmed.'
                  + ' Continue? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;
    end;
*)
  tempSO := dbgDetails.DataSource.dataset.fieldbyname('Sales_order').asfloat;
  frmpbluOrderDeliv := TfrmpbluOrderDeliv.create(self);
  try
    frmpbluOrderDeliv.Ordertype := dbgDetails.DataSource.dataset.fieldbyname('Order_type').asstring;
    frmpbluOrderDeliv.CanConfirm := bCanConfirm;
    frmpbluOrderDeliv.OrderNumber := dbgDetails.DataSource.dataset.fieldbyname('Sales_order').asfloat;
    frmpbluOrderDeliv.caption := frmpbluOrderDeliv.caption + ' ' + dbgDetails.DataSource.dataset.fieldbyname('Sales_order').asstring;
    frmpbluOrderDeliv.showmodal;
  finally
    frmpbluOrderDeliv.free;
    dtmdlAllOrders.refreshPOdata;
    dbgDetails.datasource.dataset.locate('Sales_Order', Variant(floattostr(tempSO)),[lopartialKey]) ;
  end;

end;

procedure TfrmpbLUOrders.btnFromPOClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmpbLUOrders.pmnuResetGridClick(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('OrderLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmpbLUOrders.btnreportsClick(Sender: TObject);
begin
  frmPBLUOrderRpts := TfrmPBLUOrderRpts.create(self);
  try
    frmPBLUOrderRpts.showmodal;
  finally
    frmPBLUOrderRpts.free;
  end;
end;

procedure TfrmpbLUOrders.btnRequoteClick(Sender: TObject);
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
    PBPOToEnqFrm.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    PBPOToEnqFrm.Description := dbgDetails.datasource.dataset.fieldbyname('Description').asstring;
    PBPOToEnqFrm.Quantity := dbgDetails.datasource.dataset.fieldbyname('Quantity').asinteger;
    PBPOToEnqFrm.ShowModal;
  finally
    PBPOToEnqFrm.Free;
  end;
  end;

end;

procedure TfrmpbLUOrders.btnDeleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  if dbgDetails.DataSource.dataset.fieldbyname('Order_type').asstring = 'PO' then
    CallMaintScreen('D');
end;

procedure TfrmpbLUOrders.pmnuCancelClick(Sender: TObject);
var
  bTempOK: Boolean;
  rTempSel: real;
  iPordHeadStatus: integer;
  SelCode: real;
  SelLine: integer;
begin
  SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  SelLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;
  iPOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;
  if (iPOrdHeadStatus >= 25) then
  begin
    MessageDlg('This order has been ' +
      dbgDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ', you cannot cancel it', mtError, [mbOK], 0);
    Exit;
  end;

  PBMaintPOrdInactivefrm := TPBMaintPOrdInactivefrm.create(self);

  try
    PBMaintPOrdInactivefrm.rPurchaseOrder := selcode;
    PBMaintPOrdInactiveFrm.iLine := selLine;
    PBMaintPOrdInactiveFrm.iJobBag := dbgDetails.datasource.dataset.FieldByName('Job_Bag').asinteger;
    PBMaintPOrdInactivefrm.showmodal;
    if PBMaintPOrdInactivefrm.modalresult = idOK then
      bTempOK := true
    else
      bTempOK := false;
    rTempSel := SelCode;
  finally
    PBMaintPOrdInactivefrm.Free;
  end;
  if bTempOK then
  begin
    dtmdlAllOrders.refreshPOdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(rTempSel)),[lopartialKey]) ;
  end;
end;

procedure TfrmpbLUOrders.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuProduction') ;
  if not FActivated then
    begin
      {Check if the operator REP is needed} ;
      If dmBroker.iAccCtrlMenu = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;
      {Get the button statuses} ;
      iMnuMaintPOrds := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuProduction') ;
      iMnuMaintEnqs := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuEnquiries') ;

      If dmBroker.iAccCtrlMenu = 5 then
        dtmdlAllOrders.Operator := frmpbMainMenu.iOperator;
      dtmdlAllOrders.Rep := iOperatorRep;
      dtmdlAllOrders.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

      SetButtonProperties(Self);

      FActivated := True;
    end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllOrders.refreshPOdata;
  dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmpbLUOrders.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  except
    Activecode := 0
  end;
end;

procedure TfrmpbLUOrders.btnHistoryClick(Sender: TObject);
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

procedure TfrmpbLUOrders.pmnuCurrentChargesClick(Sender: TObject);
var
  SelCode: real;
  SelLine: integer;
begin
  if not CheckInput then
    exit;

  SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  SelLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;

  {Call the form to display the current period additionsl charges}
  PBLUPOLAddChgsfrm := TPBLUPOLAddChgsfrm.create(self);
  try
    PBLUPOLAddChgsfrm.PONumber := selCode;
    PBLUPOLAddChgsfrm.Line := selline;

    PBLUPOLAddChgsfrm.showmodal;
  finally
    PBLUPOLAddChgsfrm.free;
  end;

end;

procedure TfrmpbLUOrders.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y') then
    begin
      if (dbgDetails.datasource.dataset.fieldByName('Order_Status').AsInteger = 5) then
        begin
//        (Sender as TDBGrid).Canvas.Brush.color := cllime
          (Sender as TDBGrid).Canvas.Brush.color := $00428C49;
          (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
        end
      else
        begin
          (Sender as TDBGrid).Canvas.font.Color := $00428C49;
          (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
        end;

      (Sender as TDBGrid).Canvas.Font.Style := Font.Style + [fsBold];
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.Color := clRed;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Authorised_By').AsInteger <> 0) then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsBold];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('NCA_Live_Lines').Asinteger > 0) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clRed;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('NCA_Signed_Off').Asinteger > 0) then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clyellow;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
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
        Column.Alignment := taLeftJustify;
    end
  else
  	begin
  		if Assigned(Column.Field) then
        Column.Alignment := taRightJustify;
     end;
end;

procedure TfrmpbLUOrders.chkbxShowUnauthorisedClick(Sender: TObject);
begin
  dtmdlAllOrders.ShowOnlyUnAuthorised := (Sender as TCheckbox).checked;
  dtmdlAllOrders.RefreshPOData;
end;

procedure TfrmpbLUOrders.btnRefreshClick(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asfloat;
  except
    Activecode := 0
  end;

  dtmdlAllOrders.refreshPOdata;
  dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

end.
