unit pbLUPurchaseOrders;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ImgList, StdCtrls, ComCtrls, Grids, DBGrids, ToolWin, Db,
  DBTables, Menus, STPOObjects, STSOObjects, Buttons;

type
  TfrmPBLUPurchaseOrders = class(TForm)
    CoolBar1: TCoolBar;
    dbgDetails: TDBGrid;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    imglstOrders: TImageList;
    tmrSearch: TTimer;
    Label1: TLabel;
    edtSearch: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    edtOrder: TEdit;
    btnClose: TButton;
    Panel3: TPanel;
    Label3: TLabel;
    PageScroller1: TPageScroller;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnCopy: TToolButton;
    btnDelete: TToolButton;
    btnPrint: TToolButton;
    ToolButton1: TToolButton;
    btnReceipts: TToolButton;
    btnDirect: TToolButton;
    btnReports: TToolButton;
    mnMenu: TMainMenu;
    File1: TMenuItem;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Copy1: TMenuItem;
    Delete1: TMenuItem;
    Print1: TMenuItem;
    N1: TMenuItem;
    ExporttoEDI1: TMenuItem;
    N2: TMenuItem;
    Close1: TMenuItem;
    btnEDI: TToolButton;
    ExporttoEDI2: TMenuItem;
    Send1: TMenuItem;
    Excel1: TMenuItem;
    N3: TMenuItem;
    btnAcknowledge: TToolButton;
    SwitchUsers1: TMenuItem;
    btnSearch: TBitBtn;
    btnDeliveryNote: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure edtOrderKeyPress(Sender: TObject; var Key: Char);
    procedure btnPrintClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnReceiptsClick(Sender: TObject);
    procedure btnDirectClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnEDIClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ExporttoEDI2Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure btnAcknowledgeClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure SwitchUsers1Click(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnDeliveryNoteClick(Sender: TObject);
  private
    FActivated: boolean;
    ActiveCode: string;
    DontSaveLayout: Boolean;
    FDisableNameChangeEvent: boolean;
    procedure CallMaintScreen(sTempFuncMode: Char);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure ConfirmDirectPO(iPO, iSO: integer; sStatus: string);
    function CheckInput: boolean;
    { Private declarations }
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmPBLUPurchaseOrders: TfrmPBLUPurchaseOrders;

implementation

uses pbPOrdersDM, ccsCommon, STMntPOrd, STPordRSl, STPrtTran,
  STPODirectConf, pbDatabase, pbMainMenu, pbLUPurchaseOrderRpts,
  STPODataMod, STSODataMod, STEDIPOrd, PBSendPOViaFTP, STRSPOAck,
  stPickingDM, STRSPODelivNote;

{$R *.DFM}

procedure TfrmPBLUPurchaseOrders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'PurchaseOrdersLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;

end;

procedure TfrmPBLUPurchaseOrders.btnCloseClick(Sender: TObject);
begin
  frmpbMainMenu.miExitClick(self);
end;

procedure TfrmPBLUPurchaseOrders.FormCreate(Sender: TObject);
begin
  dtmdlPOrders := TdtmdlPOrders.create(self);

  dtmdlPOrders.dtsPOHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlPOrders.dtsPOHeaderGrid;

  CCSCommon.SetDBGridCols('', 'PurchaseOrdersLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  dmBroker.ScreenAccessControl(Self,'mnuPurchases',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLUPurchaseOrders.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlPOrders do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnCopy.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnDeliveryNote.Enabled := HeaderCount > 0;
    btnAcknowledge.Enabled := HeaderCount > 0;
    btnEDI.Enabled := HeaderCount > 0;
    btnReceipts.Enabled := HeaderCount > 0;
    btnDirect.Enabled := HeaderCount > 0;

    edtOrder.text := dbgDetails.datasource.dataset.fieldbyname('purch_ord_no').asstring;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUPurchaseOrders.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlPOrders.refreshdata;
end;

procedure TfrmPBLUPurchaseOrders.FormShow(Sender: TObject);
begin
//  dtmdlPOrders.RefreshData;
  edtSearch.setfocus;
end;

procedure TfrmPBLUPurchaseOrders.CallMaintScreen(sTempFuncMode: Char);
Var
  bTempOK: ByteBool ;
  sTempStatus: String ;
  iTempSel: Integer;
begin
  sTempStatus := dbgDetails.datasource.dataset.FieldByName('Purch_Ord_Status').AsString ;
//  If (sTempFuncMode <> 'A') and (sTempStatus < 'R') then
  If (sTempFuncMode <> 'A') then
    begin
      if (sTempStatus >= 'U') and (sTempFuncMode <> 'D') then
        begin
          MessageDlg('This Order has been invoiced.  You can only view the Order', mtWarning, [mbOK],0) ;
          sTempFuncMode :='V';
        end
      else
      if (sTempStatus >= 'N') and (sTempFuncMode <> 'D') then
        begin
          MessageDlg('This Order has been fully received.  You can only amend certain lines', mtWarning, [mbOK],0) ;
//          sTempFuncMode :='V';
        end
      else
        begin
          If (sTempStatus >= 'K') and (sTempFuncMode = 'D') then
            begin
              MessageDlg('Can''t delete this order - some goods have been received', mtInformation, [mbOK],0) ;
              exit ;
            end;
          If (sTempStatus >= 'K') then
            begin
              MessageDlg('This order has had goods received against it. You can only amend certain lines', mtWarning, [mbOK],0) ;
            end;
        end;
    end;

  STMntPOrdFrm := TSTMntPOrdFrm.Create(self) ;
  try
    STMntPOrdFrm.sFuncMode := sTempFuncMode ;
    STMntPOrdFrm.iTransType := 2 ;
    STMntPOrdFrm.bStore_Ord := false ;
    STMntPOrdFrm.sFuncDescr := 'purchase' ;
    STMntPOrdFrm.PONumber := dbgDetails.datasource.dataset.FieldByName('Purch_Ord').Asinteger;
    STMntPOrdFrm.ShowModal ;
    bTempOK := (STMntPOrdFrm.ModalResult = mrOK) ;
    iTempSel := STMntPOrdFrm.iCode ;
  finally
    STMntPOrdFrm.Free ;
  end;

  if sTempFuncMode = 'V' then
    sTempFuncMode := 'C';
  if bTempOK then
  begin
    dtmdlPOrders.Refreshdata;
    if sTempFuncMode <> 'D' then
      dbgDetails.datasource.DataSet.locate('purch_ord', Variant(floattostr(iTempSel)),[lopartialKey]);
  end;
end;

procedure TfrmPBLUPurchaseOrders.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlPOrders.Supplier := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUPurchaseOrders.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUPurchaseOrders.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallMaintScreen('C');
end;

procedure TfrmPBLUPurchaseOrders.btnDeleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallMaintScreen('D');
end;

function TfrmPBLUPurchaseOrders.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('purch_ord_no', Variant(edtOrder.text),[lopartialKey]) then
    begin
      messagedlg('Order '+ edtOrder.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmPBLUPurchaseOrders.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUPurchaseOrders.edtOrderKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmPBLUPurchaseOrders.btnPrintClick(Sender: TObject);
begin
  STPordRSlFrm := TSTPordRSLFrm.create(self);
  try
    STPordRslFrm.SelectionMemo.Lines.Add(dbgDetails.datasource.DataSet.FieldByName('Purch_Ord_no').AsString);
    STPordRslfrm.selectradiogroup.enabled := false;
    STPordRslFrm.EnqLUSpeedButton.enabled := false;
//    itempsel := dbgDetails.datasource.DataSet.FieldByName('Purch_Ord').AsInteger;
    STPordRsLFrm.SelectionMemo.ReadOnly := true;
    STPordRslFrm.ShowModal;
  finally
    STPordRSlFrm.Free;
  end;
end;

procedure TfrmPBLUPurchaseOrders.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmPBLUPurchaseOrders.btnReceiptsClick(Sender: TObject);
var
  btempOK: boolean;
  iTempSel: integer;
begin
  if dbgDetails.datasource.dataset.FieldByName('Purch_Ord_Status').AsString >= 'K' then
    MessageDlg('This order has already had some stock received against it', mtWarning, [mbOK],0) ;

  if dbgDetails.datasource.dataset.FieldByName('sales_Order').AsString <> '' then
    begin
      MessageDlg('This is a direct delivery purchase order, you must use the "Confirm Direct Delivery" option',
          mtInformation, [mbOk], 0);
      exit;
    end;

  STPrtTranFrm := TSTPrtTranFrm.Create(Self);
  try
    STPrtTranFrm.sMoveType := 'G' ;

    STPrtTranFrm.iPOrd := dbgDetails.datasource.dataset.FieldByName('Purch_Ord').Asinteger;
    STPrtTranFrm.sFromName := dbgDetails.datasource.dataset.FieldByName('From_Name').AsString ;
    STPrtTranFrm.sPORef := dbgDetails.datasource.dataset.FieldByName('Purch_Ord_no').Asstring;
    STPrtTranFrm.iStore := dbgDetails.datasource.dataset.FieldByName('Part_Store').AsInteger ;
    STPrtTranFrm.ShowModal;
    bTempOK := STPrtTranFrm.bOK;
    iTempSel := STPrtTranFrm.iPOrd;
  finally
    STPrtTranFrm.Free;
  end;
  if bTempOK then
  begin
    dtmdlPOrders.Refreshdata;
    dbgDetails.datasource.DataSet.locate('purch_ord', Variant(floattostr(iTempSel)),[lopartialKey]);
  end;
end;

procedure TfrmPBLUPurchaseOrders.btnDirectClick(Sender: TObject);
var
  bTempOK: boolean;
  iTempSel, icount: integer;
begin
  if dbgDetails.SelectedRows.Count > 1 then
    begin
      if messagedlg('Confirm the Deliveries for the Purchase Orders Selected?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          STPickDM := TStPickDM.Create(Self);

          for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
            begin
              dbgDetails.datasource.DataSet.GotoBookmark(Pointer(dbgDetails.SelectedRows[iCount])) ;
              if iCount = 0 then
                itempSel := dbgDetails.datasource.DataSet.FieldByName('Purch_Ord').asinteger;

              ConfirmDirectPO(dbgDetails.datasource.DataSet.FieldByName('Purch_Ord').asinteger,
                              dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger,
                              dbgDetails.datasource.DataSet.FieldByName('Purch_Ord_Status').asstring);
            end;

          STPickDM.free;

        end;
        dtmdlPOrders.Refreshdata;
        dbgDetails.datasource.DataSet.locate('purch_ord', Variant(floattostr(iTempSel)),[lopartialKey]);
      exit;
    end;

  if (dbgDetails.datasource.DataSet.FieldByName('Purch_Ord_Status').AsString >= 'K') then
    begin
      if MessageDlg('Deliveries have already been made against this order. You can only amend certain lines - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        exit;
    end;

  iTempSel := dbgDetails.datasource.DataSet.FieldByName('Purch_Ord').asinteger;

  STPODirectConfFrm := TSTPODirectConfFrm.Create(Self);
  try
    STPODirectConfFrm.PONumber := iTempSel;
    STPODirectConfFrm.ShowModal;
    bTempOK := STPODirectConfFrm.bOK ;
  finally
    STPODirectConfFrm.Free;
  end;
  if bTempOK then
  begin
    dtmdlPOrders.Refreshdata;
    dbgDetails.datasource.DataSet.locate('purch_ord', Variant(floattostr(iTempSel)),[lopartialKey]);
  end;
end;

procedure TfrmPBLUPurchaseOrders.ConfirmDirectPO(iPO, iSO: integer; sStatus: string);
var
  icount, inx, lineNo: integer;
  tempStat: string;
begin
  {don't do anything if already received}
  if (sStatus > 'N') or (iSO = 0) then exit;


  with dtmdlPOrders.qryGetPOLines do
    begin
      close;
      parambyname('Purch_Ord').asinteger := iPO;
      open;

      while eof <> true do
        begin
          with dtmdlPOrders.qryUpdPOLine do
            begin
              close ;
              ParamByName('Purch_Ord').AsInteger := iPO;
              ParamByName('Purch_Ord_Line_No').AsInteger := dtmdlPOrders.qryGetPOLines.fieldbyname('Purch_Ord_Line_No').asinteger;
              ParamByName('Date_Deliv_Actual').AsDateTime := Date ;
              ParamByName('Fully_Received').AsString := 'Y';
              ParamByName('GRN_No').AsString := 'GRN'+ dtmdlPOrders.qryGetPOLines.fieldbyname('Purch_Ord_No').asstring;
              ExecSQL ;
            end;
          STPickDM.UpdateDirectSalesOrder(dtmdlPOrders.qryGetPOLines.fieldbyname('Sales_order').asinteger,
                                              dtmdlPOrders.qryGetPOLines.fieldbyname('Sales_order_line_no').asinteger,
                                              dtmdlPOrders.qryGetPOLines.fieldbyname('Quantity_Ordered').asinteger);
          next;
        end;
    end;

  with dtmdlPOrders.qryCheckPOStatus do
  begin
    Close ;
    ParamByName('Purch_Ord').AsInteger := iPO ;
    Open ;
    First ;
    if (FieldByName('Purch_Ord_Status').AsString <= 'W') then
    begin
      if fieldbyname('Qty_Invoiced').asinteger > 0 then
        begin
          if fieldbyname('Qty_Invoiced').asinteger >= fieldbyname('Qty_Received').asinteger then
            tempStat := 'W'
          else
            tempStat := 'U';
        end
      else
      if (FieldByName('No_Not_Deliv').AsInteger = 0) and
         (FieldByName('No_Part_Deliv').AsInteger = 0) and
         (FieldByName('No_Deliv').AsInteger > 0) then
        TempStat := 'N'                                       {Fully delivered}
      else
      if (FieldByName('No_Not_Deliv').AsInteger > 0) and       {None delivered}
         (FieldbyName('No_Part_Deliv').asinteger = 0) and
         (FieldByName('No_Deliv').AsInteger = 0) then
         TempStat := 'G'
      else
      if ((FieldByName('No_Not_Deliv').AsInteger > 0) and         {Some delivered}
          (FieldByName('No_Deliv').AsInteger > 0)) or
          (FieldByName('No_Part_Deliv').AsInteger > 0) then
        TempStat := 'K';

      {Update Status}
      with dtmdlPOrders.qryUpdPOStatus do
        begin
          Close ;
          ParamByName('Purch_Ord').AsInteger := iPO ;
          ParamByName('Purch_Ord_Status').AsString := TempStat ;
          ExecSQL ;
        end;
    end;
    STPickDM.UpdateSalesOrderHead(dtmdlPOrders.qryGetPOLines.fieldbyname('Sales_order').asinteger);
  end;
end;

procedure TfrmPBLUPurchaseOrders.btnReportsClick(Sender: TObject);
begin
  frmPBLUPurchaseOrderRpts := TfrmPBLUPurchaseOrderRpts.create(self);
  try
    frmPBLUPurchaseOrderRpts.showmodal;
  finally
    frmPBLUPurchaseOrderRpts.free;
  end;
end;

procedure TfrmPBLUPurchaseOrders.btnEDIClick(Sender: TObject);
var
  PurchaseOrder : TPurchaseOrder;
  STPODM : TSTPODM;
  SalesOrder : TSalesOrder;
  STSalesOrdDM : TSTSalesOrdDM;
  tempStr, transferType: String;
  iTempSel: integer;
begin
  if dbgDetails.datasource.dataset.FieldByName('Purch_Ord_Status').AsString > 'I' then
    begin
      MessageDlg('This Purchase Order has already been transmitted to the supplier and acknowledged',
          mtInformation, [mbOk], 0);
      exit;
    end;

  STPODM := TSTPODM.Create(Self);
  PurchaseOrder := TPurchaseOrder.Create(dbgDetails.DataSource.DataSet.FieldByName('Purch_ord_no').AsString, STPODM);
  iTempSel := dbgDetails.DataSource.DataSet.FieldByName('Purch_ord').asinteger;
  transfertype := PurchaseOrder.SupplierTransferType(STPODM);

  if transferType = 'EDI' then
  begin
    if PurchaseOrder.SupplierCanEDI(STPODM) then
    begin
      if MessageDlg('Please confirm you wish to create an EDI file? ', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      begin
        PurchaseOrder.Free;
        STPODM.Free;
        Exit;
      end;
      //Supplier does EDI so go ahead and create text file
      //will need corresponding Sales Order + Sales OrderDM
      if ((PurchaseOrder.SalesOrder = 0) or (PurchaseOrder.SuppOrderType = 'S') or (PurchaseOrder.SuppOrderType = 'C')) then
      begin
      //no Sales Order Number means order is for Broker themselves
        tempStr := PurchaseOrder.CreateTextFile(STPODM);
      end
      else
      begin
      //Sales Order Number means order is for a customer
      //load SO to get end user details for PWD orders.
        STSalesOrdDM := TSTSalesOrdDM.Create(Self);
        SalesOrder := TSalesOrder.Create(STSalesOrdDM);
        Salesorder.SONumber := PurchaseOrder.SalesOrder;
        STSalesOrdDM.LoadSOFromDatabase(SalesOrder);
        tempStr := PurchaseOrder.CreateTextFile(STPODM, STSalesOrdDM, SalesOrder);
        SalesOrder.Free;
        STSalesOrdDM.Free;
      end;
      PurchaseOrder.UpdateDBRecords(STPODM);
      if  tempStr <> '' then
        ShowMessage('Purchase Order EDI File: '+tempStr+' created.');
      end
      else
      begin
    //Supplier can't EDI so just clean up and leave
        ShowMessage('The selected supplier for this order is unable to accept EDI orders.');
      end;
    end
  else
  if transferType = 'FTP' then
  begin
    if PurchaseOrder.SupplierCanEDI(STPODM) then
    begin
      if MessageDlg('Please confirm you wish to transfer the order via ftp? ', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      begin
        PurchaseOrder.Free;
        STPODM.Free;
        Exit;
      end;

      // open new window to send Purchase Order
      PBSendPOViaFTPFrm := TPBSendPOViaFTPFrm.create(self);
      try
        PBSendPOViaFTPFrm.bSendPO := (dbgDetails.DataSource.DataSet.FieldByName('Purch_ord_Status').asstring <> 'H');
        PBSendPOViaFTPFrm.PurchaseOrder := PurchaseOrder;
        PBSendPOViaFTPFrm.STPODM := STPODM;
        PBSendPOViaFTPFrm.showmodal;

        if PBSendPOViaFTPFrm.bSentOK then
          begin
            dtmdlPOrders.Refreshdata;
            dbgDetails.datasource.DataSet.locate('purch_ord', Variant(floattostr(iTempSel)),[lopartialKey]);
          end;
      finally
        PBSendPOViaFTPFrm.free;
      end;

(*    //Supplier does FTP so go ahead and create text file
    //will need corresponding Sales Order + Sales OrderDM
    if ((PurchaseOrder.SalesOrder = 0) or (PurchaseOrder.SuppOrderType = 'S') or (PurchaseOrder.SuppOrderType = 'C')) then
    begin
    //no Sales Order Number means order is for Broker themselves
      tempStr := PurchaseOrder.CreateTextFile(STPODM);
    end
    else
    begin
    //Sales Order Number means order is for a customer
    //load SO to get end user details for PWD orders.
      STSalesOrdDM := TSTSalesOrdDM.Create(Self);
      SalesOrder := TSalesOrder.Create(STSalesOrdDM);
      Salesorder.SONumber := PurchaseOrder.SalesOrder;
      STSalesOrdDM.LoadSOFromDatabase(SalesOrder);
//      tempStr := PurchaseOrder.CreateTextFile(STPODM, STSalesOrdDM, SalesOrder);
      tempStr := PurchaseOrder.CreateXMLFile(STPODM, STSalesOrdDM, SalesOrder);
      SalesOrder.Free;
      STSalesOrdDM.Free;
    end;
    PurchaseOrder.UpdateDBRecords(STPODM);
    if  tempStr <> '' then
      ShowMessage('Purchase Order EDI File: '+tempStr+' created.');
    end
    else
    begin
    //Supplier can't EDI so just clean up and leave
      ShowMessage('The selected supplier for this order is unable to accept EDI orders.');
*)
    end;
  end
  else
    ShowMessage('No Transfer Protocol available for this supplier');

  PurchaseOrder.Free;
  STPODM.Free;
end;

procedure TfrmPBLUPurchaseOrders.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuPurchases') ;
  if not FActivated then
  begin
    FActivated := True;
  end;

  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlPOrders.Refreshdata;
  dbgDetails.datasource.DataSet.locate('Purch_Ord_No', Variant(ActiveCode),[lopartialKey]) ;
end;

procedure TfrmPBLUPurchaseOrders.ExporttoEDI2Click(Sender: TObject);
begin
  STEDIPOrdFrm := TSTEDIPOrdFrm.Create(Self);
  try
    STEDIPOrdFrm.ShowModal;
  finally
    STEDIPOrdFrm.Free;
  end;
end;

procedure TfrmPBLUPurchaseOrders.Excel1Click(Sender: TObject);
begin
  frmpbMainMenu.miExcelClick(self);
end;

procedure TfrmPBLUPurchaseOrders.btnAcknowledgeClick(Sender: TObject);
begin
  if dbgDetails.datasource.dataset.FieldByName('Purch_Ord_Status').AsString < 'K' then
    begin
      MessageDlg('This Purchase Order has not been acknowledged by the supplier',
          mtInformation, [mbOk], 0);
      exit;
    end;
  STRSPOAckFrm := TSTRSPOAckFrm.create(self);
  try
    STRSPOAckFrm.lblPONumber.caption := dbgDetails.datasource.DataSet.FieldByName('Purch_Ord_no').AsString;
    STRSPOAckFrm.lblSupplier.caption := dbgDetails.datasource.DataSet.FieldByName('Supplier_Name').AsString;
    STRSPOAckFrm.lblPODate.caption := dbgDetails.datasource.DataSet.FieldByName('Purch_Ord_Date').AsString;
    STRSPOAckFrm.PONumber := dbgDetails.datasource.DataSet.FieldByName('Purch_Ord').AsInteger;
    STRSPOAckFrm.ShowModal;
  finally
    STRSPOAckFrm.Free;
  end;
end;

procedure TfrmPBLUPurchaseOrders.FormDeactivate(Sender: TObject);
begin
  try
    ActiveCode := dbgDetails.datasource.dataset.fieldbyname('Purch_Ord_no').asstring;
  except
    Activecode := '';
  end;
end;

procedure TfrmPBLUPurchaseOrders.SwitchUsers1Click(Sender: TObject);
begin
  frmpbMainMenu.miSwitchUserClick(self);
end;

procedure TfrmPBLUPurchaseOrders.btnSearchClick(Sender: TObject);
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

procedure TfrmPBLUPurchaseOrders.btnDeliveryNoteClick(Sender: TObject);
var
  key: string;
  icount: integer;
begin
  key := '';
  if dbgDetails.SelectedRows.Count > 1 then
    begin
      for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
        begin
          dbgDetails.datasource.DataSet.GotoBookmark(Pointer(dbgDetails.SelectedRows[iCount])) ;
          if icount = 0 then
            key := dbgDetails.datasource.DataSet.FieldByName('Purch_Ord_no').asstring
          else
            key := key + ','+ dbgDetails.datasource.DataSet.FieldByName('Purch_Ord_no').asstring;
        end;
    end
  else
  key := dbgDetails.datasource.dataset.fieldbyname('Purch_Ord_no').asstring;
  STRSPODelivNoteFrm := TSTRSPODelivNoteFrm.Create(Self);
  try
    STRSPODelivNoteFrm.selectionMemo.Text := Key;
    STRSPODelivNoteFrm.ShowModal;
  finally
    STRSPODelivNoteFrm.Free;
  end;
end;

end.
