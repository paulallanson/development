unit pbluCustStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, Grids, DBGrids, Db, Menus,
  System.ImageList;

const
  {Message values for communication between this child and its parent frmLuCustomers}
  luCustomers_Stockclosed   = WM_APP + 101; {sent from child to parent}
  luCustomers_parentclosed  = WM_APP + 103; {sent from parent to child}

type
  TfrmpbluCustStock = class(TForm)
    stsBrDetails: TStatusBar;
    CoolBar1: TCoolBar;
    imglstMaint: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    dbgDetails: TDBGrid;
    tmrSearch: TTimer;
    pmnMovements: TPopupMenu;
    OpeningBalances1: TMenuItem;
    Adjustmentin1: TMenuItem;
    Adjustmentout1: TMenuItem;
    Transfers1: TMenuItem;
    pmnFunctions: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    Levels1: TMenuItem;
    N2: TMenuItem;
    MovementActivity1: TMenuItem;
    Bins1: TMenuItem;
    Sales1: TMenuItem;
    ProductionOrders1: TMenuItem;
    PurchaseOrders1: TMenuItem;
    N3: TMenuItem;
    StockMovements1: TMenuItem;
    N4: TMenuItem;
    ResetGrid1: TMenuItem;
    PageScroller1: TPageScroller;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    ToolButton1: TToolButton;
    btnStockLevels: TToolButton;
    btnTransfers: TToolButton;
    btnLabels: TToolButton;
    Print1: TMenuItem;
    Panel2: TPanel;
    btnClose: TButton;
    pmnEnquiry: TPopupMenu;
    StockMovements2: TMenuItem;
    BinLocations1: TMenuItem;
    SalesOrdersCallOffs1: TMenuItem;
    ProductionOrders2: TMenuItem;
    PurchaseOrders2: TMenuItem;
    btnEnquiry: TToolButton;
    Numbersequences1: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    lblTitle: TLabel;
    PageScroller2: TPageScroller;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    btnEnquiries: TToolButton;
    btnJobs: TToolButton;
    btnProduction: TToolButton;
    btnStock: TToolButton;
    btnCustomers: TToolButton;
    chkbxShowNotinUse: TCheckBox;
    btnSalesInvoicing: TToolButton;
    btnMaintain: TToolButton;
    btnQuotes: TToolButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnMovementsClick(Sender: TObject);
    procedure btnLocationsClick(Sender: TObject);
    procedure btnSalesClick(Sender: TObject);
    procedure btnProductionClick(Sender: TObject);
    procedure btnPurchaseOrdersClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnStockLevelsClick(Sender: TObject);
    procedure OpeningBalances1Click(Sender: TObject);
    procedure Adjustmentin1Click(Sender: TObject);
    procedure Adjustmentout1Click(Sender: TObject);
    procedure Transfers1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ResetGrid1Click(Sender: TObject);
    procedure btnNumbersClick(Sender: TObject);
    procedure btnLabelsClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure btnEnquiriesClick(Sender: TObject);
    procedure btnJobsClick(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure btnSalesInvoicingClick(Sender: TObject);
    procedure btnMaintainClick(Sender: TObject);
    procedure chkbxShowNotinUseClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnQuotesClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(sTempFuncMode: Char);
    procedure CallMoveScreen(TempMoveType: String);
    procedure SetOperator(iTempOp: Integer);
    procedure SetButtonProperties(Sender: TObject);
  private
    ActiveCode: string;
    iMnuMaint: integer;
    DontSaveLayout: Boolean;
    FParentForm: TForm;
    FCustomer: integer;
    procedure SetParentForm(const Value: TForm);
    procedure SetCustomer(const Value: integer);
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  protected
    procedure luCustomersParentClosed(var Message: TMessage); message luCustomers_ParentClosed;
  public
    procedure ClearSearchCriteria;
    property Customer: integer read FCustomer write SetCustomer;
    property ParentForm: TForm read FParentForm write SetParentForm;
  end;

var
  frmpbluCustStock: TfrmpbluCustStock;

implementation

uses UITypes, FireDAC.Stan.Param, pbStockDm, STLUStkMvmnts, STLUStkLoc, STLUStkSales, STLUStkProduction,
  STLUStkPurchases, STMaintProduct, STLUProductLvls, STPrtTran, CCSCommon, STLUStkNmbr,
  STRSLabels, pbluCustomers, pbDatabase, pbMainMenu, STStkEnq;

{$R *.DFM}

procedure TfrmpbluCustStock.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluCustStock.luCustomersParentClosed(var Message: TMessage);
begin
  close;
  message.result := 1;
end;

procedure TfrmpbluCustStock.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
  dtmdlStock.Customer := FCustomer;
  dtmdlStock.RefreshData;
end;

procedure TfrmpbluCustStock.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluCustStock.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmpbluCustStock.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PostMessage(ParentForm.Handle, luCustomers_Stockclosed, left, Top);

  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'CustomerStockLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmpbluCustStock.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmpbluCustStock.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlStock do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnLabels.Enabled := HeaderCount > 0;
    btnStockLevels.Enabled := HeaderCount > 0;
    btnMaintain.Enabled := HeaderCount > 0;
(*    btnMovements.Enabled := HeaderCount > 0;
    btnLocations.Enabled := HeaderCount > 0;
    btnsales.Enabled := HeaderCount > 0;
    btnNumbers.Enabled := HeaderCount > 0;
    btnProduction.Enabled := HeaderCount > 0;
    btnPurchaseOrders.Enabled := HeaderCount > 0;
*)
    btnEnquiry.Enabled := HeaderCount > 0;
    btnTransfers.Enabled := HeaderCount > 0;
    setbuttonproperties(self);
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmpbluCustStock.SetButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd: ByteBool;
begin
  {They can UPDATE this order if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the PO Maint button on the menu} ;
//  iTempAccCtrl := iMnuBtnPOMaint ;
  bTempCanUpd :=  ((iMnuMaint = 1) or
                  (iMnuMaint = 4) or
                  (iMnuMaint = 5));
  {They can ADD orders IF} ;
  {    they have FULL, REP or OPERATOR access} ;
  bTempCanAdd := ((iMnuMaint = 1) or (iMnuMaint = 4) or
                                        (iMnuMaint = 5)) ;
  btnAdd.Visible := bTempCanAdd ;
  if bTempCanUpd then
    begin
      btnChange.Caption := '  &Change  ';
    end
  else
    begin
      btnChange.Caption := '   &View   ';
    end;
  btnDelete.Visible := bTempCanUpd;
  btnMaintain.Visible := bTempCanUpd;
  btnTransfers.Visible := bTempCanUpd;
end;

procedure TfrmpbluCustStock.ClearSearchCriteria;
begin
  edtSearch.text := '';
end;

procedure TfrmpbluCustStock.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  dtmdlStock := TdtmdlStock.create(self);
  dtmdlStock.dtsStock.OnDataChange := SetButtons;

  btnJobs.visible := frmPBMainMenu.btnJobs.visible;

  dbgDetails.DataSource := dtmdlStock.dtsStock;

  CCSCommon.SetDBGridCols('', 'CustomerStockLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  dmBroker.ScreenAccessControl(Self,'mnuStock',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmpbluCustStock.FormDestroy(Sender: TObject);
begin
  dtmdlStock.free;
end;

procedure TfrmpbluCustStock.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlStock.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustStock.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlStock.refreshdata;
end;

procedure TfrmpbluCustStock.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmpbluCustStock.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmpbluCustStock.btnMovementsClick(Sender: TObject);
begin
  try
    with dtmdlStock.qryPartMvmnts do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkMvmntsFrm := TSTLUStkMvmntsFrm.Create(self);
    STLUStkMvmntsFrm.dtmdlStockEnquiry := dtmdlStock;

    if dtmdlStock.qryPartMvmnts.RecordCount = 0 then
    begin
      MessageDlg('There are no movements for this product', mtInformation, [mbOk], 0);
      dtmdlStock.qryPartMvmnts.close;
      exit;
    end;

    STLUStkMvmntsFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkMvmntsFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;
    STLUStkMvmntsFrm.lblTotalStock.Caption := formatfloat('#,##0',dbgDetails.dataSource.DataSet.FieldByName('store_qty').Asfloat);
    STLUStkMvmntsFrm.lblFreeStock.Caption := formatfloat('#,##0',dbgDetails.dataSource.DataSet.FieldByName('qty_free').Asfloat);

    STLUStkMvmntsFrm.ShowModal;
  finally
    STLUStkMvmntsFrm.Free;
  end;
  dtmdlStock.qryPartMvmnts.close;
end;

procedure TfrmpbluCustStock.btnLocationsClick(Sender: TObject);
begin
  try
    with dtmdlStock.qryPartStoreBins do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkLocFrm := TSTLUStkLocFrm.Create(self);
    STLUStkLocFrm.dtmdlStockEnquiry := dtmdlStock;

    if dtmdlStock.qryPartStoreBins.RecordCount = 0 then
    begin
      MessageDlg('No stock exists for this product', mtInformation, [mbOk], 0);
      dtmdlStock.qryPartStoreBins.close;
      exit;
    end;

    STLUStkLocFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkLocFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;

    STLUStkLocFrm.ShowModal;
  finally
    STLUStkLocFrm.Free;
  end;
end;

procedure TfrmpbluCustStock.btnSalesClick(Sender: TObject);
begin
  try
    with dtmdlStock.qryPartSales do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkSalesFrm := TSTLUStkSalesFrm.Create(self);
    STLUStkSalesFrm.dtmdlStockEnquiry := dtmdlStock;

    if dtmdlStock.qryPartSales.RecordCount = 0 then
    begin
      MessageDlg('There are no sales orders for this product', mtInformation, [mbOk], 0);
      dtmdlStock.qryPartSales.close;
      exit;
    end;

    STLUStkSalesFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkSalesFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;

    STLUStkSalesFrm.ShowModal;
  finally
    STLUStkSalesFrm.Free;
  end;
  dtmdlStock.qryPartSales.close;
end;

procedure TfrmpbluCustStock.btnProductionClick(Sender: TObject);
begin
  try
    with dtmdlStock.qryPartProduction do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkProductionFrm := TSTLUStkProductionFrm.Create(self);
    STLUStkProductionFrm.dtmdlStockEnquiry := dtmdlStock;

    if dtmdlStock.qryPartProduction.RecordCount = 0 then
    begin
      MessageDlg('There are no production orders for this product', mtInformation, [mbOk], 0);
    end
    else
    begin
      STLUStkProductionFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      STLUStkProductionFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;

      STLUStkProductionFrm.ShowModal;
    end;
  finally
    STLUStkProductionFrm.Free;
  end;
  dtmdlStock.qryPartProduction.close;
end;

procedure TfrmpbluCustStock.btnPurchaseOrdersClick(Sender: TObject);
begin
  try
    with dtmdlStock.qryPartPOs do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkPurchasesFrm := TSTLUStkPurchasesFrm.Create(self);
    STLUStkPurchasesFrm.dtmdlStockEnquiry := dtmdlStock;

    if dtmdlStock.qryPartPOs.RecordCount = 0 then
    begin
      MessageDlg('There are no purchase orders for this product', mtInformation, [mbOk], 0);
    end
    else
    begin
      STLUStkPurchasesFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      STLUStkPurchasesFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;

      STLUStkPurchasesFrm.ShowModal;
    end;
  finally
    STLUStkPurchasesFrm.Free;
  end;
  dtmdlStock.qryPartPOs.close;
end;

procedure TfrmpbluCustStock.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmpbluCustStock.CallMaintScreen(sTempFuncMode: Char);
var
  bTempOK: ByteBool;
  TempPart: string;
begin
  frmSTMaintProduct := TfrmSTMaintProduct.Create(Self);
  try
    if sTempFuncMode = 'A' then
      frmSTMaintProduct.sPart := ''
    else
      frmSTMaintProduct.sPart := dbgDetails.datasource.DataSet.fieldbyname('Part').asstring;

    frmSTMaintProduct.iCustomer := Customer;
    frmSTMaintProduct.sFuncMode := sTempFuncMode;
    frmSTMaintProduct.ShowModal;
    bTempOK := frmSTMaintProduct.bOK;
    TempPart := frmSTMaintProduct.edtProductCode.text;
  finally
    frmSTMaintProduct.Free;
  end;
  if bTempOK then
  begin
    dtmdlStock.Refreshdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;
    end;
  end;
end;
procedure TfrmpbluCustStock.btnStockLevelsClick(Sender: TObject);
begin
  frmSTLUProductLvls := TfrmSTLUProductLvls.create(self);
  try
    frmSTLUProductLvls.sPart := dbgDetails.datasource.dataset.fieldbyname('Part').asstring;
    frmSTLUProductLvls.showmodal;
  finally
    frmSTLUProductLvls.free;
  end;
end;

procedure TfrmpbluCustStock.OpeningBalances1Click(Sender: TObject);
begin
  CallMoveScreen('O')
end;

procedure TfrmpbluCustStock.CallMoveScreen(TempMoveType: String);
var
  bTempOK: boolean;
  tempPart: string;
begin
  tempPart := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
  STPrtTranFrm := TSTPrtTranFrm.Create(Self);
  try
    STPrtTranFrm.PartEdit.text := tempPart;
    STPrtTranFrm.PartDescrEdit.Text := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;
//    STPrtTranFrm.PartBitBtn.visible := false;
    STPrtTranFrm.sMoveType := TempMoveType ;
    STPrtTranFrm.ShowModal;
    bTempOK := STPrtTranFrm.bOK;
  finally
    STPrtTranFrm.Free;
  end;

  dtmdlStock.Refreshdata;
  dbgDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;

end;

procedure TfrmpbluCustStock.Adjustmentin1Click(Sender: TObject);
begin
  CallMoveScreen('A')
end;

procedure TfrmpbluCustStock.Adjustmentout1Click(Sender: TObject);
begin
  CallMoveScreen('B')
end;

procedure TfrmpbluCustStock.Transfers1Click(Sender: TObject);
begin
  CallMoveScreen('T')
end;

procedure TfrmpbluCustStock.FormActivate(Sender: TObject);
begin
  SetOperator(frmPBMainMenu.iOperator);
  if Customer <> 0 then
    begin
      dtmdlStock.refreshdata;
      dbgDetails.DataSource.DataSet.Locate('Part', Variant(ActiveCode),[lopartialKey]);
    end;
end;

procedure TfrmpbluCustStock.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('CustomerStockLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmpbluCustStock.btnNumbersClick(Sender: TObject);
begin
 try
    with dtmdlStock.qryPartNumbers do
    begin
      close;
      paramByName('Part').AsString := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
      open;
    end;
    STLUStkNmbrFrm := TSTLUStkNmbrFrm.Create(self);
    STLUStkNmbrFrm.dtmdlStockEnquiry := dtmdlStock;

    if dtmdlStock.qryPartNumbers.RecordCount = 0 then
    begin
      MessageDlg('No numbers exists for this product', mtInformation, [mbOk], 0);
      dtmdlStock.qryPartNumbers.close;
      exit;
    end;

    STLUStkNmbrFrm.lblPartCode.Caption := dbgDetails.dataSource.DataSet.FieldByName('Part').AsString;
    STLUStkNmbrFrm.lblPartDesc.Caption := dbgDetails.dataSource.DataSet.FieldByName('Description').AsString;

    STLUStkNmbrFrm.ShowModal;
  finally
    STLUStkNmbrFrm.Free;
  end;
end;

procedure TfrmpbluCustStock.btnLabelsClick(Sender: TObject);
begin
  STRSLabelsFrm := TSTRSLabelsFrm.create(self);
  try
    STRSLabelsfrm.Selcode := dbgDetails.datasource.DataSet.fieldbyname('Part').asstring;
    STRSLabelsfrm.SelName := dbgDetails.datasource.DataSet.fieldbyname('Description').asstring;
    STRSLabelsFrm.showmodal;
  finally
    STRSLabelsFrm.free;
  end;
end;

procedure TfrmpbluCustStock.ToolButton5Click(Sender: TObject);
begin
  frmpbluCustomers.btnProductionClick(self);
end;

procedure TfrmpbluCustStock.btnEnquiriesClick(Sender: TObject);
begin
  frmpbluCustomers.btnEnquiriesClick(self);
end;

procedure TfrmpbluCustStock.btnJobsClick(Sender: TObject);
begin
  frmpbluCustomers.btnJobsClick(self);
end;

procedure TfrmpbluCustStock.btnCustomersClick(Sender: TObject);
begin
  frmpbluCustomers.btnCustomersClick(self);
end;

procedure TfrmpbluCustStock.btnSalesInvoicingClick(Sender: TObject);
begin
  frmpbluCustomers.btnSalesInvoicingClick(self);
end;

procedure TfrmpbluCustStock.SetOperator(iTempOp: Integer);
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
  btnStock.Enabled := false;
end;
procedure TfrmpbluCustStock.btnMaintainClick(Sender: TObject);
var
  tempPart: string;
begin
  temppart := dbgDetails.datasource.dataset.fieldbyname('Part').asstring;
  STStkEnqFrm := TSTStkEnqFrm.Create(Self);
  try
    STStkEnqFrm.Part := dbgDetails.datasource.dataset.fieldbyname('Part').asstring;
    STStkEnqFrm.ShowModal;
  finally
    STStkEnqFrm.Free;
  end;
  dtmdlStock.Refreshdata;
  dbgDetails.datasource.DataSet.locate('Part', Variant(TempPart),[lopartialKey]) ;
end;

procedure TfrmpbluCustStock.chkbxShowNotinUseClick(Sender: TObject);
begin
  if chkbxShowNotInUse.Checked then
    dtmdlStock.NotInUse := 'Y'
  else
    dtmdlStock.NotInUse := 'N';
  dtmdlStock.Refreshdata;

end;

procedure TfrmpbluCustStock.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldbyname('Not_in_Use').asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Store_Qty').asinteger < dbgDetails.datasource.dataset.fieldbyname('Reorder_Level').asinteger) then
    begin
      (Sender as TDBGrid).Canvas.font.color := cllime;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'In Stock') and
      (Column.Title.Caption <> 'Allocated') and
      (Column.Title.Caption <> 'Free Stock') and
      (Column.Title.Caption <> 'Paid for') and
      (Column.Title.Caption <> 'Unpaid') and
      (Column.Title.Caption <> 'On Buy Print') and
      (Column.Title.Caption <> 'Maximum') and
      (Column.Title.Caption <> 'Minimum') and
      (Column.Title.Caption <> 'In Production') and
      (Column.Title.Caption <> 'Reorder') and
      (Column.Title.Caption <> 'Forward') and
      (Column.Title.Caption <> 'Unallocated SO') and
      (Column.Title.Caption <> 'Future Stock') and
      (Column.Title.Caption <> 'On Purchase') then
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

procedure TfrmpbluCustStock.btnQuotesClick(Sender: TObject);
begin
  frmpbluCustomers.btnQuotesClick(self);
end;

procedure TfrmpbluCustStock.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Part').asstring;
  except
    ActiveCode := '';
  end;
end;

end.
