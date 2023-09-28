unit pbluFormReferences;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin, ExtCtrls, ImgList,
  Menus, DB, pbFormReferenceDM, System.ImageList;

type
  TfrmPBLUFormReferences = class(TForm)
    Panel3: TPanel;
    Label3: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    ToolButton2: TToolButton;
    btnReports: TToolButton;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    Panel2: TPanel;
    btnClose: TButton;
    stsbrDetails: TStatusBar;
    pmnFunctions: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    ResetGrid1: TMenuItem;
    imglst: TImageList;
    tmrSearch: TTimer;
    btnMovements: TToolButton;
    btnLocations: TToolButton;
    btnNonStock: TToolButton;
    chkbxShowNonStocked: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnMovementsClick(Sender: TObject);
    procedure btnLocationsClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure chkbxShowNonStockedClick(Sender: TObject);
  private
    ActiveCode: integer;
    FActivated: Boolean;
    DontSaveLayout: Boolean;
    FDisableNameChangeEvent: boolean;
    dtmdlAllForms: TdtmdlForms;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: string);
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmPBLUFormReferences: TfrmPBLUFormReferences;

implementation

uses pbDatabase, pbMainMenu, CCSCommon, PBLUStkLocs, PBLUFormReferenceRpts, PBMaintFormReference,
  PBLUStkHistory;

{$R *.dfm}

procedure TfrmPBLUFormReferences.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'FormReferenceLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;

end;

procedure TfrmPBLUFormReferences.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUFormReferences.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllForms.refreshdata;
end;

procedure TfrmPBLUFormReferences.FormCreate(Sender: TObject);
var
  i: integer;
begin
  dtmdlAllForms := TdtmdlForms.create(self);
  dtmdlAllForms.dtsForms.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllForms.dtsForms;

  btnMovements.visible := not frmpbMainMenu.UseStockSystem;
  btnLocations.visible := not frmpbMainMenu.UseStockSystem;
  btnNonStock.visible := not frmpbMainMenu.UseStockSystem;

  CCSCommon.SetDBGridCols('', 'FormReferenceLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  if frmpbMainMenu.UseStockSystem then
    for i := 0 to pred(dbgDetails.columns.count) do
      if dbgDetails.columns.items[i].fieldname = 'Qty_in_Stock' then
        dbgDetails.columns.items[i].Visible := false;

  dmBroker.ScreenAccessControl(Self,'mnuFormReferences',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLUFormReferences.FormDestroy(Sender: TObject);
begin
  dtmdlAllForms.free;
end;

procedure TfrmPBLUFormReferences.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllForms do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnMovements.Enabled := HeaderCount > 0;
    btnLocations.Enabled := HeaderCount > 0;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUFormReferences.FormShow(Sender: TObject);
begin
  dtmdlAllForms.RefreshData;
  edtSearch.setfocus;
end;

procedure TfrmPBLUFormReferences.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllForms.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUFormReferences.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUFormReferences.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmPBLUFormReferences.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmPBLUFormReferences.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUFormReferences.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuFormReferences') ;
  if not FActivated then
  begin
    FActivated := True;
  end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllForms.ShowNonStocked := true;
  dtmdlAllForms.RefreshData;
  dbgDetails.datasource.DataSet.locate('Form_Reference', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmPBLUFormReferences.CallMaintScreen(aMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintFormReferenceFrm := TPBMaintFormReferenceFrm.Create(Self);
  try
    PBMaintFormReferenceFrm.sFuncMode := aMode;
    if aMode <> 'A' then
    begin
      PBMaintFormReferenceFrm.iCust := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
      PBMaintFormReferenceFrm.iBranch := dbgDetails.datasource.DataSet.FieldByName('Branch_no').AsInteger;
      PBMaintFormReferenceFrm.iCode := dbgDetails.datasource.DataSet.FieldByName('Form_Reference').AsInteger;
      PBMaintFormReferenceFrm.RefDescrEdit.Text := Trim(dbgDetails.datasource.DataSet.FieldByName('Form_Reference_Descr').AsString);
      PBMaintFormReferenceFrm.RefIDEdit.Text := Trim(dbgDetails.datasource.DataSet.FieldByName('Form_Reference_ID').AsString);
      PBMaintFormReferenceFrm.edtReorder.Text := Trim(dbgDetails.datasource.DataSet.FieldByName('Reorder_Level').AsString);
      PBMaintFormReferenceFrm.sFormRef := Trim(dbgDetails.datasource.DataSet.FieldByName('Form_Reference_ID').AsString);
      PBMaintFormReferenceFrm.StockRefEdit.Text := Trim(dbgDetails.datasource.DataSet.FieldByName('Stock_Reference').AsString);
      PBMaintFormReferenceFrm.ChkBoxStockedItem.Checked := (dbgDetails.datasource.DataSet.FieldByName('Stocked_Item').AsString) = 'Y';
      PBMaintFormReferenceFrm.sCustName := dbgDetails.datasource.DataSet.FieldByName('Cust_Name').Asstring;
      PBMaintFormReferenceFrm.sBranchName := dbgDetails.datasource.DataSet.FieldByName('Branch_Name').asstring;
    end
    else
    begin
      PBMaintFormReferenceFrm.iCust := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
      PBMaintFormReferenceFrm.iBranch := dbgDetails.datasource.DataSet.FieldByName('Branch_no').AsInteger;
      PBMaintFormReferenceFrm.sCustName := dbgDetails.datasource.DataSet.FieldByName('Cust_Name').Asstring;
      PBMaintFormReferenceFrm.sBranchName := dbgDetails.datasource.DataSet.FieldByName('Branch_Name').asstring;
      PBMaintFormReferenceFrm.iCode := 0;
      PBMaintFormReferenceFrm.RefDescrEdit.Text := Trim(dbgDetails.datasource.DataSet.FieldByName('Product_Code_Prefix').AsString);
      PBMaintFormReferenceFrm.RefIDEdit.Text := Trim(dbgDetails.datasource.DataSet.FieldByName('Product_Code_Prefix').AsString);
      PBMaintFormReferenceFrm.sFormRef := Trim(dbgDetails.datasource.DataSet.FieldByName('Product_Code_Prefix').AsString);
      PBMaintFormReferenceFrm.StockRefEdit.Text := Trim(dbgDetails.datasource.DataSet.FieldByName('Product_Code_Prefix').AsString);
    end;

    PBMaintFormReferenceFrm.ShowModal;
    bTempOK := (PBMaintFormReferenceFrm.ModalResult = mrOK);
    iTempSel := PBMaintFormReferenceFrm.iCode;
    if btempOK then
    begin
      dtmdlAllForms.refreshdata;
      if aMode <> 'D' then
      begin
        dbgDetails.datasource.DataSet.locate('Form_Reference', Variant(floattostr(iTempSel)),[lopartialKey]) ;
      end;
    end;
    edtSearch.SetFocus;
  finally
    PBMaintFormReferenceFrm.Free;
  end;
end;

procedure TfrmPBLUFormReferences.btnMovementsClick(Sender: TObject);
begin
  PBLUStkHistoryfrm := TPBLUStkHistoryFrm.create(self);
  try
    PBLUStkHistoryfrm.iFormRef := dbgDetails.DataSource.DataSet.fieldbyname('Form_Reference').asinteger;
    PBLUStkHistoryfrm.iCust := dbgDetails.DataSource.DataSet.fieldbyname('Customer').asinteger;
    PBLUStkHistoryfrm.iBranch := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
    PBLUStkHistoryfrm.edtCustomerName.text := dbgDetails.DataSource.DataSet.fieldbyname('Cust_Name').asstring+'/'+
                                          dbgDetails.DataSource.DataSet.fieldbyname('Branch_Name').asstring;
    PBLUStkHistoryfrm.edtStockRef.text := dbgDetails.DataSource.DataSet.fieldbyname('Stock_Reference').asstring;
    PBLUStkHistoryfrm.edtFormDescr.text := dbgDetails.DataSource.DataSet.fieldbyname('Form_Reference_descr').asstring;

    PBLUStkHistoryfrm.memoReorder.text := dbgDetails.DataSource.DataSet.fieldbyname('Reorder_level').asstring;
    PBLUStkHistoryfrm.ShowModal;
  finally
    PBLUStkHistoryfrm.Free;
  end;
end;

procedure TfrmPBLUFormReferences.btnLocationsClick(Sender: TObject);
begin
  PBLUStkLocsFrm := TPBLUStkLocsFrm.create(self);
  try
    PBLUStkLocsFrm.iFormRef := dbgDetails.DataSource.DataSet.fieldbyname('Form_Reference').asinteger;
    PBLUStkLocsFrm.ShowModal;
  finally
    PBLUStkLocsFrm.Free;
  end;
end;

procedure TfrmPBLUFormReferences.btnReportsClick(Sender: TObject);
begin
  frmPBLUFormReferenceRpts := TfrmPBLUFormReferenceRpts.create(self);
  try
    frmPBLUFormReferenceRpts.showmodal;
  finally
    frmPBLUFormReferenceRpts.free;
  end;
end;

procedure TfrmPBLUFormReferences.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TfrmPBLUFormReferences.FormDeactivate(Sender: TObject);
begin
  try
    ActiveCode := dbgDetails.DataSource.DataSet.fieldbyname('Form_Reference').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmPBLUFormReferences.chkbxShowNonStockedClick(Sender: TObject);
begin
  dtmdlAllForms.ShowNonStocked := (sender as TCheckBox).checked;
  dtmdlAllForms.refreshdata;
end;

end.
