unit pbLUPurchaseCredits;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin,
  Db, PBSupplierInvoiceDM, System.ImageList;

type
  TfrmPBLUPurchaseCredits = class(TForm)
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
    N1: TMenuItem;
    mnuPass: TMenuItem;
    mnuQuery: TMenuItem;
    mnuReset: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure chkbxShowArchivedClick(Sender: TObject);
    procedure btnPassClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsCellClick(Column: TColumn);
    procedure dbgDetailsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnReportsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pmnuFunctionsPopup(Sender: TObject);
  private
    FActivated: boolean;
    DontSaveLayout: Boolean;
    dtmdlAllSuppCredits: TdmSupplierInvoice;
    FDisableNameChangeEvent: boolean;
    procedure SetFunctionBtns(Dataset: TDataset);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetInvoiceStatus(aMode: string);
    procedure CallMaintScreen(aMode: TPIMode);
    { Private declarations }
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmPBLUPurchaseCredits: TfrmPBLUPurchaseCredits;

implementation

uses UITypes, CCSCommon, PBMaintSuppInvoice, PBLUSupplierInvoicePO, PBLUSupplierInvoiceJB,
      PBLUSupplierInvoicePurch, PBMaintSuppInvoicePass, pbMainMenu,
  PBLUSupplierInvoiceCN, pbDatabase, pbLUPurchaseInvoiceRpts;

{$R *.DFM}

procedure TfrmPBLUPurchaseCredits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'PurchaseCreditsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmPBLUPurchaseCredits.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUPurchaseCredits.FormCreate(Sender: TObject);
begin
  dtmdlAllSuppCredits := TdmSupplierInvoice.create(self);

  dtmdlAllSuppCredits.dsPCHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllSuppCredits.dsPCHeaderGrid;
  dtmdlAllSuppCredits.qryPCHeaderGrid.AfterScroll := SetFunctionBtns;

  btnPass.Visible := dtmdlAllSuppCredits.CanPassInvoices;
  btnReset.Visible := btnPass.Visible;
//  btnQuery.Visible := btnPass.Visible;

  CCSCommon.SetDBGridCols('', 'PurchaseCreditsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  dmBroker.ScreenAccessControl(Self,'mnuPurchaseInvoicing',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLUPurchaseCredits.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllSuppCredits do
  begin
    btnChange.Enabled := CreditHeaderCount > 0;
    btnDelete.Enabled := CreditHeaderCount > 0;
    stsBrDetails.panels[0].text := inttostr(CreditHeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUPurchaseCredits.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllSuppCredits.refreshCreditdata;
end;

procedure TfrmPBLUPurchaseCredits.FormShow(Sender: TObject);
begin
//  dtmdlAllSuppCredits.RefreshCreditData;
  edtSearch.setfocus;
end;

procedure TfrmPBLUPurchaseCredits.CallMaintScreen(aMode : TPIMode);
var
  Key : integer;
  frm : TPBMaintSuppInvoicefrm;
  aInvoice : TSuppInvoice;
begin
  if aMode = piAdd then
    Key := 0
  else
    begin
      Key := dtmdlAllSuppCredits.CurrentCreditNote;
      if dbgDetails.DataSource.DataSet.FieldByName('Supp_Invoice_Status').AsInteger >= 20 then
        begin
          if MessageDlg('This invoice has been passed for posting to the ledger, the details can only be viewed and cannot be modified or deleted', mtWarning,
                        [mbOk,mbCancel], 0) = mrCancel then exit;
          aMode := piView;
        end
    end;

//  dbgDetails.DataSource.DataSet.Close;
  try
    aInvoice := TSuppInvoice.Create(dtmdlAllSuppCredits);
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

procedure TfrmPBLUPurchaseCredits.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllSuppCredits.Supplier := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUPurchaseCredits.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUPurchaseCredits.chkbxShowArchivedClick(Sender: TObject);
begin
  dtmdlAllSuppCredits.DisplayArchived := chkbxShowArchived.checked;
  dtmdlAllSuppCredits.refreshCreditdata;
end;

procedure TfrmPBLUPurchaseCredits.btnPassClick(Sender: TObject);
begin
  SetInvoiceStatus('P');
end;

procedure TfrmPBLUPurchaseCredits.btnQueryClick(Sender: TObject);
var
  key: integer;
  aInvoice: TSuppInvoice;
begin
  if MessageDlg((Sender as TToolButton).Hint,mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit
  else
    begin
      Key := dtmdlAllSuppCredits.CurrentCreditNote;
      aInvoice := TSuppInvoice.Create(dtmdlAllSuppCredits);
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

procedure TfrmPBLUPurchaseCredits.btnResetClick(Sender: TObject);
begin
  SetInvoiceStatus('R');
end;

procedure TfrmPBLUPurchaseCredits.SetInvoiceStatus(aMode: string);
var
  key: Integer;
  Frm: TPBMaintSuppInvoicePassfrm;
  aInvoice : TSuppInvoice;
begin
  Key := dtmdlAllSuppCredits.CurrentCreditNote;
  aInvoice := TSuppInvoice.Create(dtmdlAllSuppCredits);
  try
    aInvoice.DbKey := key;
    aInvoice.LoadFromDB;
    Frm := TPBMaintSuppInvoicePassfrm.Create(Self);
    try
      Frm.Mode := aMode;
      frm.SupplierInvoice := aInvoice;
      frm.InvoiceorCredit := 'C';
      Frm.ShowModal;
      if frm.modalresult = mrOK then
      begin
        dbgDetails.DataSource.DataSet.close;
        dbgDetails.DataSource.DataSet.Open;
        dbgDetails.DataSource.DataSet.Locate('Supplier_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;
      end;
    finally
      frm.free;
    end;
  finally
    aInvoice.free;
  end;
end;
procedure TfrmPBLUPurchaseCredits.btnAddClick(Sender: TObject);
begin
  PBLUSupplierInvoiceCNfrm := TPBLUSupplierInvoiceCNfrm.create(self);
  try
    PBLUSupplierInvoiceCNfrm.showmodal;
    if PBLUSupplierInvoiceCNfrm.ModalResult = mrOK then
      dtmdlAllSuppCredits.RefreshCreditData;
  finally
    PBLUSupplierInvoiceCNfrm.free;
  end;
end;

procedure TfrmPBLUPurchaseCredits.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(piChange);
end;

procedure TfrmPBLUPurchaseCredits.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen(piDelete);
end;

procedure TfrmPBLUPurchaseCredits.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUPurchaseCredits.SetFunctionBtns(Dataset: TDataset);
begin
  with Dataset do
  begin
    btnDelete.enabled := (fieldbyname('Supp_invoice_Status').asinteger = 10);
    btnPass.enabled := not(fieldbyname('Supp_invoice_Status').asinteger >= 20);
    btnQuery.enabled := not(fieldbyname('Supp_invoice_Status').asinteger >= 20);
    btnReset.enabled := (fieldbyname('Supp_invoice_Status').asinteger = 20);
  end;
end;

procedure TfrmPBLUPurchaseCredits.dbgDetailsCellClick(Column: TColumn);
begin
  self.stsBrDetails.Panels[1].Text := dtmdlAllSuppCredits.PONumList;
end;

procedure TfrmPBLUPurchaseCredits.dbgDetailsKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_up)
  or (key = vk_down)
  or (key = vk_home)
  or (key = vk_end)
  or (key = vk_prior)
  or (key = vk_next) then
  begin
    self.stsBrDetails.Panels[1].Text := dtmdlAllSuppCredits.PONumList;
  end;
end;

procedure TfrmPBLUPurchaseCredits.btnReportsClick(Sender: TObject);
begin
  frmPBLUPurchaseInvoiceRpts := TfrmPBLUPurchaseInvoiceRpts.create(self);
  try
    frmPBLUPurchaseInvoiceRpts.showmodal;
  finally
    frmPBLUPurchaseInvoiceRpts.free;
  end;
end;

procedure TfrmPBLUPurchaseCredits.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuPurchaseInvoicing') ;
  if not FActivated then
  begin
    FActivated := True;
  end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllSuppCredits.refreshCreditdata;;
end;

procedure TfrmPBLUPurchaseCredits.pmnuFunctionsPopup(Sender: TObject);
begin
  mnuPass.Visible := btnPass.Visible;
  mnuQuery.Visible :=  btnQuery.Visible;
  mnuReset.visible := btnReset.Visible;
  N1.Visible := mnuPass.Visible;
end;

end.
