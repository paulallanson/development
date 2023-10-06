unit pbLUPurchaseInvoices;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin,
  Db, PBSupplierInvoiceDM, System.ImageList;

type
  TfrmPBLUPurchaseInvoices = class(TForm)
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    stsbrDetails: TStatusBar;
    imglstFunctions: TImageList;
    tmrSearch: TTimer;
    Panel2: TPanel;
    btnClose: TButton;
    chkbxShowArchived: TCheckBox;
    pmnAdd: TPopupMenu;
    btnFromProduction: TMenuItem;
    btnfromJobBag: TMenuItem;
    btnFromPurchOrder: TMenuItem;
    pmnDummy: TPopupMenu;
    dbgDetails: TDBGrid;
    Panel3: TPanel;
    Label3: TLabel;
    PageScroller1: TPageScroller;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    btnPass: TToolButton;
    btnQuery: TToolButton;
    btnReset: TToolButton;
    btnReports: TToolButton;
    pmnuFunctions: TPopupMenu;
    mnuAdd: TMenuItem;
    mnuChange: TMenuItem;
    mnuDelete: TMenuItem;
    mnuPass: TMenuItem;
    mnuQuery: TMenuItem;
    mnuReset: TMenuItem;
    ToolButton2: TToolButton;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure chkbxShowArchivedClick(Sender: TObject);
    procedure btnFromProductionClick(Sender: TObject);
    procedure btnfromJobBagClick(Sender: TObject);
    procedure btnFromPurchOrderClick(Sender: TObject);
    procedure btnPassClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnAddMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDetailsCellClick(Column: TColumn);
    procedure dbgDetailsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnReportsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure mnuPassClick(Sender: TObject);
    procedure mnuQueryClick(Sender: TObject);
    procedure mnuResetClick(Sender: TObject);
    procedure pmnuFunctionsPopup(Sender: TObject);
  private
    FActivated: boolean;
    DontSaveLayout: Boolean;
    dtmdlAllSuppInvoices: TdmSupplierInvoice;
    FDisableNameChangeEvent: boolean;
    procedure SetFunctionBtns(Dataset: TDataset);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetInvoiceStatus(aMode: string);
    procedure CallMaintScreen(aMode: TPIMode);
    procedure SaveInvoiceStatus(tempStatus: integer);
    { Private declarations }
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmPBLUPurchaseInvoices: TfrmPBLUPurchaseInvoices;

implementation

uses UITypes, CCSCommon, PBMaintSuppInvoice, PBLUSupplierInvoicePO, PBLUSupplierInvoiceJB,
      PBLUSupplierInvoicePurch, PBMaintSuppInvoicePass, pbMainMenu,
  pbDatabase, pbLUPurchaseInvoiceRpts;

{$R *.DFM}

procedure TfrmPBLUPurchaseInvoices.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'PurchaseInvoicesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmPBLUPurchaseInvoices.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUPurchaseInvoices.FormCreate(Sender: TObject);
begin
  dtmdlAllSuppInvoices := TdmSupplierInvoice.create(self);

  dtmdlAllSuppInvoices.dsSIHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllSuppInvoices.dsSIHeaderGrid;
  dtmdlAllSuppInvoices.qrySIHeaderGrid.AfterScroll := SetFunctionBtns;

  btnPass.Visible := dtmdlAllSuppInvoices.CanPassInvoices;
  btnReset.Visible := btnPass.Visible;
//  btnQuery.Visible := btnPass.Visible;

  CCSCommon.SetDBGridCols('', 'PurchaseInvoicesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  dmBroker.ScreenAccessControl(Self,'mnuPurchaseInvoicing',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLUPurchaseInvoices.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllSuppInvoices do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';

    mnuChange.enabled := btnChange.enabled;
  end;
end;

procedure TfrmPBLUPurchaseInvoices.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllSuppInvoices.refreshdata;
end;

procedure TfrmPBLUPurchaseInvoices.FormShow(Sender: TObject);
begin
//  dtmdlAllSuppInvoices.RefreshData;
  edtSearch.setfocus;
end;

procedure TfrmPBLUPurchaseInvoices.CallMaintScreen(aMode : TPIMode);
var
  Key : integer;
  frm : TPBMaintSuppInvoicefrm;
  aInvoice : TSuppInvoice;
begin
  if aMode = piAdd then
    Key := 0
  else
    begin
      Key := dtmdlAllSuppInvoices.CurrentSInvoice;
      if dbgDetails.DataSource.DataSet.FieldByName('Supp_Invoice_Status').AsInteger >= 20 then
        begin
          if MessageDlg('This invoice has been passed for posting to the ledger, the details can only be viewed and cannot be modified or deleted', mtWarning,
                        [mbOk,mbCancel], 0) = mrCancel then exit;
          aMode := piView;
        end
    end;

//  dbgDetails.DataSource.DataSet.Close;
  try
    aInvoice := TSuppInvoice.Create(dtmdlAllSuppInvoices);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TPBMaintSuppInvoicefrm.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.SupplierInvoice := aInvoice;
        Frm.ShowModal;
        if (Frm.ModalResult = mrok) then
          begin
            Key := aInvoice.DbKey;
            dbgDetails.DataSource.DataSet.close;
            dbgDetails.DataSource.DataSet.Open;
            dbgDetails.DataSource.DataSet.Locate('Supplier_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;
          end;
      finally
        Frm.Free;
      end;
    finally
      aInvoice.Free;
    end;
  finally
(*    dbgDetails.DataSource.DataSet.close;
    dbgDetails.DataSource.DataSet.Open;
    dbgDetails.DataSource.DataSet.Locate('Supplier_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;
*)
  end;
end;

procedure TfrmPBLUPurchaseInvoices.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllSuppInvoices.Supplier := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUPurchaseInvoices.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUPurchaseInvoices.chkbxShowArchivedClick(Sender: TObject);
begin
  dtmdlAllSuppInvoices.DisplayArchived := chkbxShowArchived.checked;
  dtmdlAllSuppInvoices.refreshdata;
end;

procedure TfrmPBLUPurchaseInvoices.btnFromProductionClick(Sender: TObject);
begin
  PBLUSupplierInvoicePOfrm := TPBLUSupplierInvoicePOfrm.create(self);
  try
    PBLUSupplierInvoicePOfrm.showmodal;
    if PBLUSupplierInvoicePOfrm.ModalResult = mrOK then
      dtmdlAllSuppInvoices.RefreshData;
  finally
    PBLUSupplierInvoicePOfrm.free;
  end;
end;

procedure TfrmPBLUPurchaseInvoices.btnfromJobBagClick(Sender: TObject);
begin
  PBLUSupplierInvoiceJBfrm := TPBLUSupplierInvoiceJBfrm.create(self);
  try
    PBLUSupplierInvoiceJBfrm.showmodal;
    if PBLUSupplierInvoiceJBfrm.ModalResult = mrOK then
      dtmdlAllSuppInvoices.RefreshData;
  finally
    PBLUSupplierInvoiceJBfrm.free;
  end;
end;

procedure TfrmPBLUPurchaseInvoices.btnFromPurchOrderClick(Sender: TObject);
begin
  PBLUSupplierInvoicePurchfrm := TPBLUSupplierInvoicePurchfrm.create(self);
  try
    PBLUSupplierInvoicePurchfrm.showmodal;
    if PBLUSupplierInvoicePurchfrm.ModalResult = mrOK then
      dtmdlAllSuppInvoices.RefreshData;
  finally
    PBLUSupplierInvoicePurchfrm.free;
  end;
end;

procedure TfrmPBLUPurchaseInvoices.btnPassClick(Sender: TObject);
begin
  SetInvoiceStatus('P');
end;

procedure TfrmPBLUPurchaseInvoices.btnQueryClick(Sender: TObject);
var
  key: integer;
  aInvoice: TSuppInvoice;
begin
  if MessageDlg((Sender as TToolButton).Hint,mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit
  else
    begin
      Key := dtmdlAllSuppInvoices.CurrentSInvoice;
      aInvoice := TSuppInvoice.Create(dtmdlAllSuppInvoices);
      try
        aInvoice.DbKey := key;
        aInvoice.LoadFromDB;
        aInvoice.SaveStatus(15);
      finally
        dbgDetails.DataSource.DataSet.close;
        dbgDetails.DataSource.DataSet.Open;
        dbgDetails.DataSource.DataSet.Locate('Supplier_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;
        aInvoice.free;
      end;
    end;
end;

procedure TfrmPBLUPurchaseInvoices.SaveInvoiceStatus(tempStatus: integer);
var
  temploop: integer;
  key: integer;
  aInvoice: TSuppInvoice;
begin
  dbgDetails.Datasource.Dataset.DisableControls;
  try
    for TempLoop := 0 to pred(dbgDetails.SelectedRows.count) do
      begin
        dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[TempLoop]));
//        Key := dtmdlAllSuppInvoices.CurrentSInvoice;
        Key := dbgDetails.DataSource.DataSet.fieldbyname('Supplier_invoice').asinteger;
        try
          aInvoice := TSuppInvoice.Create(dtmdlAllSuppInvoices);
          aInvoice.DbKey := key;
          aInvoice.LoadFromDB;
          aInvoice.SaveStatus(tempStatus);
        finally
          aInvoice.free;
        end;
      end;
  finally
    dbgDetails.DataSource.DataSet.close;
    dbgDetails.DataSource.DataSet.Open;
    dbgDetails.DataSource.DataSet.Locate('Supplier_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;
    dbgDetails.Datasource.Dataset.EnableControls;
  end;
end;

procedure TfrmPBLUPurchaseInvoices.btnResetClick(Sender: TObject);
begin
  SetInvoiceStatus('R');
end;

procedure TfrmPBLUPurchaseInvoices.SetInvoiceStatus(aMode: string);
var
  key: Integer;
  Frm: TPBMaintSuppInvoicePassfrm;
  aInvoice : TSuppInvoice;
begin
  Key := dtmdlAllSuppInvoices.CurrentSInvoice;
  aInvoice := TSuppInvoice.Create(dtmdlAllSuppInvoices);
  try
    aInvoice.DbKey := key;
    aInvoice.LoadFromDB;
    Frm := TPBMaintSuppInvoicePassfrm.Create(Self);
    try
      Frm.Mode := aMode;
      frm.SupplierInvoice := aInvoice;
      frm.InvoiceorCredit := 'I';
      Frm.ShowModal;
      if frm.modalresult = mrOK then
      begin
        dtmdlAllSuppInvoices.refreshdata;
(*        dbgDetails.DataSource.DataSet.close;
        dbgDetails.DataSource.DataSet.Open;
*)
        dbgDetails.DataSource.DataSet.Locate('Supplier_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;
      end;
    finally
      frm.free;
    end;
  finally
    aInvoice.free;
  end;
end;

procedure TfrmPBLUPurchaseInvoices.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(piAdd);
end;

procedure TfrmPBLUPurchaseInvoices.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(piChange);
end;

procedure TfrmPBLUPurchaseInvoices.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen(piDelete);
end;

procedure TfrmPBLUPurchaseInvoices.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUPurchaseInvoices.btnAddMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnFromJobBag.visible := frmpbMainMenu.UseJobBags;
  try
    btnFromPurchOrder.visible := frmpbMainMenu.UseStockSystem and dmBroker.CanMatchPOs;
  except
    btnFromPurchOrder.visible := false;
  end;

  if (not btnFromJobBag.visible) and
     (not btnFromPurchOrder.visible) then
    begin
      btnAdd.dropdownmenu := pmnDummy;
      btnFromProductionClick(self);
    end
  else
    btnAdd.dropdownMenu := pmnAdd;
end;

procedure TfrmPBLUPurchaseInvoices.SetFunctionBtns(Dataset: TDataset);
begin
  with Dataset do
  begin
    btnDelete.enabled := (fieldbyname('Supp_invoice_Status').asinteger = 10);
    btnPass.enabled := not(fieldbyname('Supp_invoice_Status').asinteger >= 20);
    btnQuery.enabled := not(fieldbyname('Supp_invoice_Status').asinteger >= 20);
    btnReset.enabled := (fieldbyname('Supp_invoice_Status').asinteger = 20);

    mnuPass.enabled := btnPass.Enabled;
    mnuQuery.enabled := btnQuery.Enabled;
    mnuReset.enabled := btnReset.enabled;

    mnuDelete.enabled := btnDelete.Enabled;

  end;
end;

procedure TfrmPBLUPurchaseInvoices.dbgDetailsCellClick(Column: TColumn);
begin
  self.stsBrDetails.Panels[1].Text := dtmdlAllSuppInvoices.PONumList;
end;

procedure TfrmPBLUPurchaseInvoices.dbgDetailsKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_up)
  or (key = vk_down)
  or (key = vk_home)
  or (key = vk_end)
  or (key = vk_prior)
  or (key = vk_next) then
  begin
    self.stsBrDetails.Panels[1].Text := dtmdlAllSuppInvoices.PONumList;
  end;
end;

procedure TfrmPBLUPurchaseInvoices.btnReportsClick(Sender: TObject);
begin
  frmPBLUPurchaseInvoiceRpts := TfrmPBLUPurchaseInvoiceRpts.create(self);
  try
    frmPBLUPurchaseInvoiceRpts.showmodal;
  finally
    frmPBLUPurchaseInvoiceRpts.free;
  end;
end;

procedure TfrmPBLUPurchaseInvoices.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuPurchaseInvoicing') ;
  if not FActivated then
  begin
    FActivated := True;
  end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllSuppInvoices.RefreshData;
end;

procedure TfrmPBLUPurchaseInvoices.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlAllSuppInvoices.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  if (column.fieldname = 'PONum') then
    SortField := 'Purchase_Order'
  else if (column.FieldName = 'tot_val') then
    SortField := 'Goods_Value'
  else if (column.FieldName = 'tot_invoices') then
    SortField := 'Goods_Value'
  else if (column.FieldName = 'Sales_Invoice_No') then
    SortField := 'Goods_Value'
  else
    SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlAllSuppInvoices.SortOrder := SortField + SortType;
  dtmdlAllSuppInvoices.SortType := SortType;

  dtmdlAllSuppInvoices.refreshdata;
end;

procedure TfrmPBLUPurchaseInvoices.mnuPassClick(Sender: TObject);
begin
  SaveInvoiceStatus(20);
end;

procedure TfrmPBLUPurchaseInvoices.mnuQueryClick(Sender: TObject);
begin
  SaveInvoiceStatus(15);
end;

procedure TfrmPBLUPurchaseInvoices.mnuResetClick(Sender: TObject);
begin
  SaveInvoiceStatus(10);
end;

procedure TfrmPBLUPurchaseInvoices.pmnuFunctionsPopup(Sender: TObject);
begin
  mnuPass.Visible := btnPass.Visible;
  mnuQuery.Visible :=  btnQuery.Visible;
  mnuReset.visible := btnReset.Visible;
  N1.Visible := mnuPass.Visible;
end;

end.
