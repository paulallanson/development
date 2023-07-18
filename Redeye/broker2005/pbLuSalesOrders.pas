unit pbLuSalesOrders;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, Menus, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin,
  Db, DBTables, pbOrdersDM, Inifiles, Buttons;

type
  TfrmPBLUSalesOrders = class(TForm)
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    stsbrDetails: TStatusBar;
    pmnAllocate: TPopupMenu;
    mnuAllocate: TMenuItem;
    mnuDeAllocate: TMenuItem;
    pmnfunctions: TPopupMenu;
    pmnuAdd: TMenuItem;
    pmnuChange: TMenuItem;
    pmnuCopy: TMenuItem;
    pmnuImport: TMenuItem;
    pmnuDelete: TMenuItem;
    pmnuPrint: TMenuItem;
    N1: TMenuItem;
    pmnuAllocateFunc: TMenuItem;
    pmnuPrintPickNote: TMenuItem;
    N3: TMenuItem;
    pmnuDeliveries: TMenuItem;
    N4: TMenuItem;
    ResetGrid1: TMenuItem;
    imglstOrders: TImageList;
    tmrSearch: TTimer;
    pmnPicking: TPopupMenu;
    btnPrintPickNote1: TMenuItem;
    btnConfirmPick: TMenuItem;
    Panel3: TPanel;
    Label3: TLabel;
    dbgDetails: TDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    edtNumber: TEdit;
    btnClose: TButton;
    PageScroller1: TPageScroller;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnCopy: TToolButton;
    btnPrint: TToolButton;
    btnseparator1: TToolButton;
    btnAllocatefnc: TToolButton;
    btnPrintPickNote: TToolButton;
    ToolButton3: TToolButton;
    btnDeliveries: TToolButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    mnMenu: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    N5: TMenuItem;
    Close1: TMenuItem;
    N6: TMenuItem;
    ImportSalesOrders1: TMenuItem;
    btnDelete: TToolButton;
    btnCreatePO: TToolButton;
    Send1: TMenuItem;
    Excel1: TMenuItem;
    N7: TMenuItem;
    btnSearch: TBitBtn;
    btnPickConfirm: TToolButton;
    lblWorkinProgress: TLabel;
    btnImport: TToolButton;
    SwitchUser1: TMenuItem;
    BitBtn1: TBitBtn;
    pmnuAllocate: TMenuItem;
    pmnuDeAllocate: TMenuItem;
    pmnuPickConfirm: TMenuItem;
    pmnuCreatePO: TMenuItem;
    pmnuDoNotInvoice: TMenuItem;
    chkbxShowOrderLines: TCheckBox;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure mnuAllocateClick(Sender: TObject);
    procedure btnAllocatefncClick(Sender: TObject);
    procedure mnuDeAllocateClick(Sender: TObject);
    procedure btnPrintPickNote1Click(Sender: TObject);
    procedure btnConfirmPickClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnDeliveriesClick(Sender: TObject);
    procedure ResetGrid1Click(Sender: TObject);
    procedure pmnAllocatePopup(Sender: TObject);
    procedure ImportSalesOrders1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCreatePOClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnCompleteClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure btnPrintPickNoteClick(Sender: TObject);
    procedure btnPickConfirmClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SwitchUser1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure pmnuDoNotInvoiceClick(Sender: TObject);
    procedure chkbxShowOrderLinesClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
  private
    FActivated: boolean;
    ActiveCode: integer;
    DontSaveLayout: Boolean;
    dtmdlSOOrders: TdtmdlOrders;
    procedure CallMaintScreen(sTempFuncMode: Char);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallAllocScreen(sTempFuncMode: Char);
    function CheckInput: boolean;
    procedure PrintSO;
    procedure ShowColumns;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmPBLUSalesOrders: TfrmPBLUSalesOrders;

implementation

uses STRSPickNote, pbDatabase, stPickingDM, STStockDM, STPickbyPart,
  PBRSProofN, PBLUProofHistN, pbMainMenu, PBMaintPOrd, pbPOObjects,
  STMntSOrd, stSOObjects, STRSSalesOrd, PBRSPOrdN, STPrtAllocSales,
  stpickobject, pbluOrdersSearch, pbluCustDeliv, ccscommon, pbLUOrderRpts,
  STImpSalesOrders, STSODataMod, STPODataMod, STPOObjects,
  pbLUSalesOrdersRpts, STMaintSalesOrder, STRSPickingNote, STMaintPick,
  STImpDirectOrders, PBSalesOrdertoPO;

{$R *.DFM}

procedure TfrmPBLUSalesOrders.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUSalesOrders.CallMaintScreen(sTempFuncMode: Char);
var
  i: integer;
  bTempOK: Boolean;
  iTempSel: Integer;
  iSOrdHeadStatus: integer;
  Selcode, JobBagNo: integer;
begin
  JobBagNo := 0;
  
  {If adding order then set status to Order Created}
  if sTempFuncMode = 'A' then
    begin
      SelCode := 0;
      iSOrdHeadStatus := 10;
      JobBagNo := 0;
    end
  else
    begin
      SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
      iSOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;
//      JobBagNo := dbgDetails.datasource.DataSet.FieldByName('Job_Bag').AsInteger;
      for i := 0 to pred(dbgDetails.Columns.count) do
        begin
          if dbgDetails.Columns.Items[i].FieldName = 'Job_Bag_No' then
            try
              JobBagNo := strtoint(dbgDetails.Columns.Items[i].Field.text)
            except
              JobBagNo := 0;
            end;
        end;
    end;

  if (iSOrdHeadStatus > 10) and (sTempFuncMode = 'D')  and (dmBroker.iAccCtrlMenu = 1) then
  begin
    MessageDlg('This order has been ' +
      dbgDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ', you cannot delete it', mtError, [mbOK], 0);
    Exit;
  end;

  {Check whether the Sales Order has been included in a invoice Period End}
  if dtmdlSOOrders.PeriodEndRun('SO',selcode,0) and
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
      if (dtmdlSOOrders.IsCustomerOnStop(dbgDetails.datasource.DataSet.FieldByName('Customer').asinteger))
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
    STMntSOrdFrm.JobBagNo := JobBagNo;
    STMntSordFrm.SetupDetails(Self);
    STMntSordFrm.ShowModal;
    bTempOK := STMntSordFrm.bOK;
    iTempSel := SalesOrder.SONumber;
  finally
    STMntSordFrm.Free;
  end;
  if bTempOK then
  begin
    dtmdlSOOrders.refreshSOdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  end;
end;

procedure TfrmPBLUSalesOrders.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlSOOrders do
  begin
    btnChange.Enabled := CallOffHeaderCount > 0;
    btnDelete.Enabled := CallOffHeaderCount > 0;
    btnPrint.Enabled := CallOffHeaderCount > 0;
    btnCopy.Enabled := CallOffHeaderCount > 0;
    btnCreatePO.Enabled := CallOffHeaderCount > 0;
    btnDeliveries.Enabled := CallOffHeaderCount > 0;
    btnAllocatefnc.enabled := (dbgDetails.datasource.dataset.fieldbyname('Order_type').asstring <> 'PO') and
                            (CallOffHeaderCount > 0);
    btnPrintPickNote.enabled := (dbgDetails.datasource.dataset.fieldbyname('Order_type').asstring <> 'PO')and
                            (CallOffHeaderCount > 0);

    btnPickConfirm.enabled := (dbgDetails.datasource.dataset.fieldbyname('Order_type').asstring <> 'PO')and
                            (CallOffHeaderCount > 0);

    pmnuChange.Enabled := btnChange.enabled;
    pmnuDelete.Enabled := btnDelete.enabled;
    pmnuPrint.enabled := btnPrint.Enabled;
    pmnuCopy.enabled := btnCopy.Enabled;
    pmnuCreatePO.enabled := btnCreatePO.Enabled;
    pmnuDeliveries.enabled := btnDeliveries.Enabled;
    pmnuAllocatefunc.enabled := btnAllocatefnc.enabled;
    pmnuPrintPickNote.enabled := btnPrintPickNote.enabled ;
    pmnuPickConfirm.enabled := btnPickConfirm.enabled;

    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Sales_order').asstring;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    lblWorkinProgress.Visible := ShowWIP;
    
    stsBrDetails.panels[0].text := inttostr(CallOffHeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUSalesOrders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'SalesOrderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;

end;

procedure TfrmPBLUSalesOrders.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
  sShowWIP, sShowLines: string;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      stempdate := ReadString('Centrereed Broker', 'Call Off Search Date', 'None');
      sShowWIP := ReadString('Centrereed Broker', 'Show Sales Order WIP', 'None');
      sShowLines := ReadString('Redeye', 'Show Sales Order Lines', 'None');
      Free;
    end;

  dtmdlSOOrders := TdtmdlOrders.create(self);

  if stempdate = 'None' then
    dtmdlSOOrders.OrderDate := Date - 365
  else
    dtmdlSOOrders.OrderDate := pbdatestr(stempdate);

  if sShowWIP = 'None' then
    dtmdlSOOrders.ShowWIP := false
  else
    dtmdlSOOrders.ShowWIP := true;

  if (sShowLines = 'None') or (sShowLines = 'N') then
    chkbxShowOrderLines.checked := false
  else
    chkbxShowOrderLines.checked := true;

  dtmdlSOOrders.dtsCallOffs.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlSOOrders.dtsCallOffs;

  CCSCommon.SetDBGridCols('', 'SalesOrderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);

  {Decide which columns to show}
  ShowColumns;

  dmBroker.ScreenAccessControl(Self,'mnuCallOffs',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLUSalesOrders.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowWIP: string;
  sShowLines: string;
begin
  if dtmdlSOOrders.ShowWIP then
    sShowWIP := 'Show'
  else
    sShowWIP := 'None';

  if chkbxShowOrderLines.checked then
    sShowLines := 'Y'
  else
    sShowLines := 'N';

  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Call Off Search Date', pbdatestr(dtmdlSOOrders.OrderDate));
      WriteString('Centrereed Broker', 'Show Sales Order WIP', sShowWIP);
      WriteString('Redeye', 'Show Sales Order Lines', sShowLines);
      Free;
    end;

  dtmdlSOOrders.free;
end;

procedure TfrmPBLUSalesOrders.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlSOOrders.ShowOrderLines := chkbxShowOrderLines.checked;
  dtmdlSOOrders.refreshSOdata;
end;

procedure TfrmPBLUSalesOrders.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmPBLUSalesOrders.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmPBLUSalesOrders.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmPBLUSalesOrders.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallMaintScreen('C')

end;

function TfrmPBLUSalesOrders.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Sales_order', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Order '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmPBLUSalesOrders.btnCopyClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallMaintScreen('P')
end;

procedure TfrmPBLUSalesOrders.btnPrintClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  PrintSO;

end;

procedure TfrmPBLUSalesOrders.PrintSO;
var
  bTempOK: Boolean;
  selcode: integer;
  customername: string;
begin
  CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
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
    dtmdlSOOrders.refreshSOdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TfrmPBLUSalesOrders.mnuAllocateClick(Sender: TObject);
begin
  CallAllocScreen('A');

end;

procedure TfrmPBLUSalesOrders.btnAllocatefncClick(Sender: TObject);
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

  if (dtmdlSOOrders.GetSoReplenSource(selcode) = 1) then
    begin
      messagedlg('Direct Supply orders cannot be allocated/deallocated', mtInformation,
      [mbOk], 0);
      exit;
    end;
  btnAllocatefnc.dropdownmenu := pmnAllocate;
end;

procedure TfrmPBLUSalesOrders.mnuDeAllocateClick(Sender: TObject);
begin
  CallAllocScreen('D');
end;

procedure TfrmPBLUSalesOrders.CallAllocScreen(sTempFuncMode: Char);
var
  iTempSel: Integer;
  bTempOK: Boolean;
  selcode: integer;
begin
  if dbgDetails.datasource.DataSet.FieldByName('inactive').Asstring = 'Y' then
    begin
      messagedlg('Unable to process allocations, this order is inactive', mtWarning,
      [mbOk], 0);
      exit
    end;

  SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
  STPrtAllocSalesFrm := TSTPrtAllocSalesFrm.Create(Self);
  try
    STPrtAllocSalesFrm.iOrder := selcode;
    STPrtAllocSalesFrm.bDeAlloc := (sTempFuncMode = 'D');

    STPrtAllocSalesFrm.iStoreFrom := dtmdlSOOrders.GetSOPartStore(selcode);
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
    dtmdlSOOrders.refreshSOdata;
(*    if sTempFuncMode <> 'D' then
    begin
      dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
*)
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(iTempSel)),[lopartialKey]) ;
  end;
end;

procedure TfrmPBLUSalesOrders.btnPrintPickNote1Click(Sender: TObject);
var
  Reprint: ByteBool;
  selcode: integer;
  iSordHeadStatus: integer;
  bTempOK: Bytebool;
  customername: string;
  NewPicking: Boolean;
begin
  if not CheckInput then
    exit;
  customername := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
  Reprint := false;
  selcode := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  iSOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  if (iSordHeadStatus < 50) then
    begin
      messagedlg('Cannot print a Picking Note, stock has not been allocated to the order.', mtWarning,
      [mbOk], 0);
      exit
    end;

  NewPicking := true;

  if (iSordHeadStatus = 100) then
    begin
      messagedlg('One or more Picking Notes have already been printed', mtWarning, [mbOk], 0);
      Reprint := true;
      NewPicking := dtmdlSOOrders.IsNewPicking(dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger);
    end;

  if (iSordHeadStatus > 100) then
    begin
      NewPicking := dtmdlSOOrders.IsNewPicking(dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger);
      if NewPicking then
        begin
          if messagedlg('The status of this order is '+ dbgDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ', continue?',
                  mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end
      else
        begin
          messagedlg('The status of this order is '+ dbgDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ' you cannot print/reprint the Picking Note.', mtWarning,
            [mbOk], 0);
          exit;
        end;
    end;

  if (dtmdlSOOrders.GetSOReplenSource(selcode) = 1) then
    begin
      messagedlg('Picking Notes cannot be printed for Direct Supply orders', mtInformation, [mbOk], 0);
      exit;
    end;

  if NewPicking then
    begin
      STRSPickingNotefrm:= TSTRSPickingNotefrm.create(self);
      try
        STRSPickingNotefrm.Customerlbl.caption := CustomerName;
        STRSPickingNotefrm.OrderDateLbl.caption := dbgDetails.datasource.dataset.fieldbyname('Order_Date').asstring;
        STRSPickingNotefrm.SONumber := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
        STRSPickingNotefrm.DateRequired := dbgDetails.datasource.dataset.fieldbyname('Goods_Required').asdatetime;
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
    end;

  if bTempOK then
  begin
    dtmdlSOOrders.refreshSOdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TfrmPBLUSalesOrders.btnConfirmPickClick(Sender: TObject);
var
  selcode: integer;
  bTempOK: Bytebool;
  iIntSelCode: integer;
  sPickRef: string;
  iSOrdHeadStatus: integer;
  NewPicking: Boolean;
begin
  if not CheckInput then
    exit;
  selcode := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  iSOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  if (iSordHeadStatus < 100) then
    begin
      messagedlg('Cannot confirm picking, stock must be allocated and a picking note printed prior to confirming picking', mterror,
      [mbOk], 0);
      exit
    end;

  if (iSordHeadStatus = 120) or (iSordHeadStatus = 150) then
    begin
      messagedlg('Cannot reconfirm the Picking', mterror,
      [mbOk], 0);
      exit
    end;

  if (iSordHeadStatus > 150) then
    begin
      messagedlg('The status of this order is '+ dbgDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ' cannot Confirm the Delivery again.', mtWarning,
      [mbOk], 0);
      exit;
    end;

  if (dtmdlSOOrders.GetSoReplenSource(selcode) = 1) then
    begin
      messagedlg('Despatch Confirmation cannot be run for Direct Supply orders', mtInformation,
      [mbOk], 0);
      exit;
    end;

  NewPicking := dtmdlSOOrders.IsNewPicking(dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger);

  if NewPicking then
    begin
      STMaintPickFrm := TSTMaintPickFrm.Create(Self);
      try
        STMaintPickFrm.IsSalesOrder := True;
        STMaintPickFrm.SalesOrder := selcode;
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
      sPickRef := dtmdlSOOrders.GetPickingRef(selcode);
      dmBroker.AddIntSelCode(iIntSelCode,strtofloat(sPickRef),sPickRef);

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
    end;
  if bTempOK then
  begin
    dtmdlSOOrders.refreshSOdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TfrmPBLUSalesOrders.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUSalesOrders.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlSOOrders.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUSalesOrders.btnSearchClick(Sender: TObject);
begin
  frmpbLuOrdersSearch := TfrmpbLuOrdersSearch.create(self);
  try
    frmpbLuOrdersSearch.dtmdlSearchOrders := dtmdlSOOrders;
    if chkbxShowOrderLines.checked then
      frmpbLuOrdersSearch.SearchType := 'SOL'
    else
      frmpbLuOrdersSearch.SearchType := 'SO';
      
    frmpbLuOrdersSearch.edtBranch.text := dtmdlSOOrders.BranchName;
    frmpbLuOrdersSearch.edtProductCode.Text := dtmdlSOOrders.ProductCode;
    frmpbLuOrdersSearch.edtFormReference.Text := dtmdlSOOrders.FormReference;
    frmpbLuOrdersSearch.edtCustOrderNo.Text := dtmdlSOOrders.CustomerRef;
    frmpbLuOrdersSearch.edtQuantity.Text := dtmdlSOOrders.OrdQtyDesc;
    frmpbLuOrdersSearch.edtDescription.Text := dtmdlSOOrders.Description;
    frmpbLuOrdersSearch.edtSupplier.text := dtmdlSOOrders.SupplierName;
    frmpbLuOrdersSearch.edtDate.Text := pbDateStr(dtmdlSOOrders.OrderDate);
    frmpbLuOrdersSearch.edtStatus.Text := dtmdlSOOrders.Status;
    frmpbLuOrdersSearch.edtRep.Text := dtmdlSOOrders.RepName;
    frmpbLuOrdersSearch.edtAccountMgr.Text := dtmdlSOOrders.AccountMgr;
    frmpbLuOrdersSearch.edtOperator.Text := dtmdlSOOrders.OperatorName;
    frmpbLuOrdersSearch.edtJobNumber.Text := dtmdlSOOrders.JobNumber;
    frmpbLuOrdersSearch.chkbxShowWIP.checked := dtmdlSOOrders.ShowWIP;
    frmpbLuOrdersSearch.chkbxShowCancelled.checked := dtmdlSOOrders.ShowInactive;

    frmpbLuOrdersSearch.showModal;
  finally
    frmpbLuOrdersSearch.free;
  end;

end;

procedure TfrmPBLUSalesOrders.btnDeliveriesClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  if dbgDetails.DataSource.dataset.fieldbyname('order_Status').asinteger < 150 then
    begin
      messagedlg('Cannot view delivery details, picking of the stock has not been confirmed.', mtWarning,
      [mbOk], 0);
      exit;
    end;

  frmpbluOrderDeliv := TfrmpbluOrderDeliv.create(self);
  try
    frmpbluOrderDeliv.Ordertype := dbgDetails.DataSource.dataset.fieldbyname('Order_type').asstring;
    frmpbluOrderDeliv.OrderNumber := dbgDetails.DataSource.dataset.fieldbyname('Sales_order').asfloat;
    frmpbluOrderDeliv.caption := frmpbluOrderDeliv.caption + ' ' + dbgDetails.DataSource.dataset.fieldbyname('Sales_order').asstring;
    frmpbluOrderDeliv.showmodal;
  finally
    frmpbluOrderDeliv.free;
  end;
end;

procedure TfrmPBLUSalesOrders.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('SalesOrderLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;

end;

procedure TfrmPBLUSalesOrders.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUSalesOrders.pmnAllocatePopup(Sender: TObject);
var
  selcode: integer;
begin
  selcode := dbgDetails.datasource.DataSet.FieldByName('Sales_order').AsInteger;
  mnuAllocate.enabled :=  (dtmdlSOOrders.GetSoReplenSource(selcode) > 1) and
                          (dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger >= 10) and
                          (dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger < 50);

  mnuDeAllocate.enabled := (dtmdlSOOrders.GetSoReplenSource(selcode) > 1) and
                           (dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger >= 50) and
                           (dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger <= 60);
  pmnuAllocate.enabled := mnuAllocate.enabled;
  pmnuDeAllocate.enabled := mnuDeAllocate.enabled;
end;

procedure TfrmPBLUSalesOrders.ImportSalesOrders1Click(Sender: TObject);
var
  iTempSel: integer;
begin
  iTempSel := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
  STImpSalesOrdersFrm := TSTImpSalesOrdersFrm.create(self);
  try
    STImpSalesOrdersFrm.showmodal;
  finally
    STImpSalesOrdersFrm.free;
  end;
  dtmdlSOOrders.refreshSOdata;

  dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(iTempSel)),[lopartialKey]);
end;

procedure TfrmPBLUSalesOrders.btnDeleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallMaintScreen('D')


end;

procedure TfrmPBLUSalesOrders.btnCreatePOClick(Sender: TObject);
var
  SelCode: integer;
  SalesOrder : TSalesOrder;
  PO : TPurchaseOrder;
  STSalesOrdDM : TSTSalesOrdDM;
  STPODM : TSTPODM;
  iTempSel: integer;
begin
  iTempSel := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;

  PBSalesOrdertoPOFrm := TPBSalesOrdertoPOFrm.create(self);
  try
    PBSalesOrdertoPOFrm.showmodal;
  finally
    PBSalesOrdertoPOFrm.free;
  end;

  dtmdlSOOrders.refreshSOdata;
  dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(iTempSel)),[lopartialKey]);

(*//check SO status
  //status must be xx or lower
  SelCode := dbgDetails.datasource.DataSet.FieldByName('Sales_order').AsInteger;

  if (dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger >= 30) then
  begin
    ShowMessage('A Purchase Order has already been created for this Sales Order.');
    exit;
  end;

  if (dtmdlSOOrders.GetSoReplenSource(Selcode) <> 1) then
  begin
    ShowMessage('You cannot create Purchase Orders for Stock Call Off Orders.');
    exit;
  end;

  //show warning and ask if user wants to proceed.
  if MessageDlg('You are about to raise a Purchase Order based on the Sales Order selected.'+#10#13+
                'Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

//create datamodules required
  STSalesOrdDM := TSTSalesOrdDM.Create(Self);

//create SO object and load data from database
  SalesOrder := TSalesOrder.Create(STSalesOrdDM);
  SalesOrder.SONumber := dbgDetails.Fields[0].AsInteger;
  STSalesOrdDM.LoadSOFromDatabase(SalesOrder);
  STSalesOrdDM.LoadExtChgOrd(SalesOrder);
//create PO object from SO
  STPODM := TSTPODM.Create(Self);
  PO := TPurchaseOrder.Create(SalesOrder, STPODM);

//Save PO to database
  PO.SaveToDB(STPODM);

//update SO status
  SalesOrder.SOHeadStatus := 30;
  with STSalesOrdDM.qryUpdSoStatus do
  begin
    ParamByName('Status').AsInteger := SalesOrder.SOHeadStatus;
    ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
    ExecSQL;
  end;

//refresh the grid because the status of the order has changed
  dtmdlSOOrders.refreshSOdata;
  dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(SalesOrder.SONumber)),[lopartialKey]) ;

  //display message showing PO number, no of lines and order value
  ShowMessage('Purchase Order No: '+PO.PurchOrdNo+', Number of lines: '+IntToStr(PO.NumberOfLines())+', Order Value: £'+FloatToStr(PO.CalcOrderValue));

//free objects and datamodules
  PO.Free;
  SalesOrder.Free;
  STSalesOrdDM.Free;
  STPODM.Free;
*)
end;

procedure TfrmPBLUSalesOrders.ToolButton1Click(Sender: TObject);
begin
  frmPBLUSalesOrdersRpts := TfrmPBLUSalesOrdersRpts.create(self);
  try
    frmPBLUSalesOrdersRpts.showmodal;
  finally
    frmPBLUSalesOrdersRpts.free;
  end;
end;

procedure TfrmPBLUSalesOrders.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuCallOffs') ;
  if not FActivated then
  begin
    FActivated := True;
  end;

  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlSOOrders.ShowOrderLines := chkbxShowOrderLines.checked;
  dtmdlSOOrders.refreshSOdata;
  dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmPBLUSalesOrders.FormDeactivate(Sender: TObject);
begin
  try
    ActiveCode := dbgDetails.datasource.DataSet.FieldByName('Sales_order').AsInteger;
  except
    ActiveCode := 0;
  end;
end;

procedure TfrmPBLUSalesOrders.btnCompleteClick(Sender: TObject);
var
  iSordHeadStatus: integer;
  selcode: integer;
  jobBagNo: integer;
  bTempOK: boolean;
begin
  if not CheckInput then
    exit;

  selcode := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').AsInteger;;
  iSOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  if (iSOrdHeadStatus <> 120) then
    begin
      messagedlg('The status of this order is '+ dbgDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ' unable to complete production of this order', mtInformation,
      [mbOk], 0);
      exit;
    end;


  if (dtmdlSOOrders.GetSOtype(selcode) <> 'J') then
    begin
      messagedlg('Only Orders associated with Job Bags can be confirmed as complete', mtInformation,
      [mbOk], 0);
      exit;
    end;

  JobBagNo := dbgDetails.datasource.DataSet.FieldByName('Job_Bag').AsInteger;

  frmSTMaintSalesOrder := TfrmSTMaintSalesOrder.Create(Self);
  try
    frmSTMaintSalesOrder.Mode := 'C';
    frmSTMaintSalesOrder.SalesOrderNo := SelCode;
    frmSTMaintSalesOrder.JobBagNo := JobBagNo;
    frmSTMaintSalesOrder.ShowModal;
    bTempOK := frmSTMaintSalesOrder.bOK;
    if bTempOK then
    begin
      dtmdlSOOrders.refreshSOdata;
      dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
    end;
  finally
    frmSTMaintSalesOrder.Free;
  end;

end;

procedure TfrmPBLUSalesOrders.Excel1Click(Sender: TObject);
begin
  frmpbMainMenu.miExcelClick(self);
end;

procedure TfrmPBLUSalesOrders.Close1Click(Sender: TObject);
begin
  frmpbMainMenu.miExitClick(self);
end;

procedure TfrmPBLUSalesOrders.btnPrintPickNoteClick(Sender: TObject);
var
  Reprint: ByteBool;
  selcode: integer;
  iSordHeadStatus: integer;
  bTempOK: Bytebool;
  customername: string;
  NewPicking: Boolean;
begin
  if not CheckInput then
    exit;
  customername := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
  Reprint := false;
  selcode := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  iSOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  if dbgDetails.datasource.DataSet.FieldByName('inactive').Asstring = 'Y' then
    begin
      messagedlg('Cannot print a Picking Note, this order is inactive', mtWarning,
      [mbOk], 0);
      exit
    end;

  if (iSordHeadStatus < 50) then
    begin
      messagedlg('Cannot print a Picking Note, stock has not been allocated to the order.', mtWarning,
      [mbOk], 0);
      exit
    end;

  NewPicking := true;

  if (iSordHeadStatus = 100) then
    begin
      messagedlg('One or more Picking Notes have already been printed', mtWarning, [mbOk], 0);
      Reprint := true;
      NewPicking := dtmdlSOOrders.IsNewPicking(dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger);
    end;

  if (iSordHeadStatus > 100) then
    begin
      NewPicking := dtmdlSOOrders.IsNewPicking(dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger);
      if NewPicking then
        begin
          if messagedlg('The status of this order is '+ dbgDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ', continue?',
                  mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end
      else
        begin
          messagedlg('The status of this order is '+ dbgDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ' you cannot print/reprint the Picking Note.', mtWarning,
            [mbOk], 0);
          exit;
        end;
    end;

  if (dtmdlSOOrders.GetSOReplenSource(selcode) = 1) then
    begin
      messagedlg('Picking Notes cannot be printed for Direct Supply orders', mtInformation, [mbOk], 0);
      exit;
    end;

  if NewPicking then
    begin
      STRSPickingNotefrm:= TSTRSPickingNotefrm.create(self);
      try
        STRSPickingNotefrm.Customerlbl.caption := CustomerName;
        STRSPickingNotefrm.OrderDateLbl.caption := dbgDetails.datasource.dataset.fieldbyname('Order_Date').asstring;
        STRSPickingNotefrm.SONumber := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
        STRSPickingNotefrm.DateRequired := dbgDetails.datasource.dataset.fieldbyname('Goods_Required').asdatetime;
        STRSPickingNotefrm.toDestroy := dbgDetails.datasource.dataset.fieldbyname('Sales_Order_Type').asstring = 'D';
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
    end;

  if bTempOK then
  begin
    dtmdlSOOrders.refreshSOdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TfrmPBLUSalesOrders.btnPickConfirmClick(Sender: TObject);
var
  selcode: integer;
  bTempOK: Bytebool;
  iIntSelCode: integer;
  sPickRef: string;
  iSOrdHeadStatus: integer;
  NewPicking: Boolean;
begin
  if not CheckInput then
    exit;
  selcode := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  iSOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  if (iSordHeadStatus < 100) then
    begin
      messagedlg('Cannot confirm picking, stock must be allocated and a picking note printed prior to confirming picking', mterror,
      [mbOk], 0);
      exit
    end;

  if (iSordHeadStatus = 120) or (iSordHeadStatus = 150) then
    begin
      messagedlg('Cannot reconfirm the Picking', mterror,
      [mbOk], 0);
      exit
    end;

  if (iSordHeadStatus > 150) then
    begin
      messagedlg('The status of this order is '+ dbgDetails.datasource.DataSet.fieldbyname('Status_Description').asstring + ' cannot Confirm the Delivery again.', mtWarning,
      [mbOk], 0);
      exit;
    end;

  if (dtmdlSOOrders.GetSoReplenSource(selcode) = 1) then
    begin
      messagedlg('Despatch Confirmation cannot be run for Direct Supply orders', mtInformation,
      [mbOk], 0);
      exit;
    end;

  NewPicking := dtmdlSOOrders.IsNewPicking(dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger);

  if NewPicking then
    begin
      STMaintPickFrm := TSTMaintPickFrm.Create(Self);
      try
        STMaintPickFrm.toDestroy := dbgDetails.datasource.dataset.fieldbyname('Sales_Order_Type').asstring = 'D';
        STMaintPickFrm.IsSalesOrder := True;
        STMaintPickFrm.SalesOrder := selcode;
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
      sPickRef := dtmdlSOOrders.GetPickingRef(selcode);
      dmBroker.AddIntSelCode(iIntSelCode,strtofloat(sPickRef),sPickRef);

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
    end;
  if bTempOK then
  begin
    dtmdlSOOrders.refreshSOdata;
    dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(selcode)),[lopartialKey]) ;
  end;
end;

procedure TfrmPBLUSalesOrders.btnImportClick(Sender: TObject);
var
  iTempSel: integer;
begin
  iTempSel := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
  STImpDirectOrdersFrm := TSTImpDirectOrdersFrm.create(self);
  try
    STImpDirectOrdersFrm.showmodal;
  finally
    STImpDirectOrdersFrm.free;
  end;
  dtmdlSOOrders.refreshSOdata;

  dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(iTempSel)),[lopartialKey]);

end;

procedure TfrmPBLUSalesOrders.dbgDetailsDrawColumnCell(Sender: TObject;
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
  if (dbgDetails.datasource.dataset.fieldByName('Sales_order_Head_Status').AsInteger = 5) then
    (Sender as TDBGrid).Canvas.Brush.color := cllime;
//    (Sender as TDBGrid).Canvas.font.Color := clLime;

  if  (Column.Title.Caption <> 'Quantity') and
      (Column.Title.Caption <> 'Cost Price') and
      (Column.Title.Caption <> 'Cost Pack') and
      (Column.Title.Caption <> 'Sell Pack') and
      (Column.Title.Caption <> 'Sell Price') then
  	begin
      StrPCopy(txt, Column.field.text);
      SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
      ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
  else
  	begin
  		StrPCopy(Txt, Column.field.text);
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;
end;

procedure TfrmPBLUSalesOrders.SwitchUser1Click(Sender: TObject);
begin
  frmpbMainMenu.miSwitchUserClick(self);
end;

procedure TfrmPBLUSalesOrders.BitBtn1Click(Sender: TObject);
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

procedure TfrmPBLUSalesOrders.pmnuDoNotInvoiceClick(Sender: TObject);
var
  icount, iTempSel: integer;
begin
  if dbgDetails.SelectedRows.Count >= 1 then
    begin
      iTempSel := dbgDetails.datasource.DataSet.FieldByName('Sales_order').asinteger;
      if messagedlg('Confirm that the selected orders are not to be invoiced!', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
            begin
              dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
              if (dbgDetails.datasource.DataSet.FieldByName('Sales_order_head_Status').asinteger >=  150) and
                 (dbgDetails.datasource.DataSet.FieldByName('Sales_order_head_Status').asinteger < 250) then
                dtmdlSOOrders.SetSOInvoiceStatus(dbgDetails.datasource.DataSet.FieldByName('Sales_order').asinteger);
            end;
          dtmdlSOOrders.refreshSOdata;
          dbgDetails.datasource.DataSet.locate('sales_order', Variant(floattostr(iTempSel)),[lopartialKey]);
        end;
      exit;
    end;
end;

procedure TfrmPBLUSalesOrders.chkbxShowOrderLinesClick(Sender: TObject);
begin
  ShowColumns;
  dtmdlSOOrders.ShowOrderLines := chkbxShowOrderLines.checked;
  dtmdlSOOrders.refreshSOdata;
end;

procedure TfrmPBLUSalesOrders.ShowColumns;
var
  icount: integer;
begin
  for icount := 0 to pred(dbgDetails.columns.count) do
    begin
      if (dbgDetails.columns[icount].Title.Caption = 'Quantity') or
         (dbgDetails.columns[icount].Title.Caption = 'Product Code') or
         (dbgDetails.columns[icount].Title.Caption = 'Cost Price') or
         (dbgDetails.columns[icount].Title.Caption = 'Sell Price') or
         (dbgDetails.columns[icount].Title.Caption = 'Cost Pack') or
         (dbgDetails.columns[icount].Title.Caption = 'Sell Pack') or
         (dbgDetails.columns[icount].Title.Caption = 'Description') then
            dbgDetails.Columns[icount].Visible := chkbxShowOrderLines.Checked
      else
        dbgDetails.Columns[icount].Visible := true;
    end;
end;

end.
