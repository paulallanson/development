unit PBLUContracts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, StdCtrls, ExtCtrls, ImgList,
  Buttons, DB, PBContractDM, IniFiles, Menus, System.ImageList;

type
  TfrmPBLUContracts = class(TForm)
    stsbrDetails: TStatusBar;
    imglstjobs: TImageList;
    Panel3: TPanel;
    Label3: TLabel;
    lblShowLive: TLabel;
    CoolBar7: TCoolBar;
    ToolBar8: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    btnReports: TToolButton;
    btnPrint: TToolButton;
    Panel1: TPanel;
    Label60: TLabel;
    btnSearch: TBitBtn;
    edtSearch: TEdit;
    dbgDetails: TDBGrid;
    tmrSearch: TTimer;
    Panel2: TPanel;
    Label2: TLabel;
    btnClose: TButton;
    edtNumber: TEdit;
    pmnFunctions: TPopupMenu;
    pmnuAdd: TMenuItem;
    pmnuChange: TMenuItem;
    pmnuDelete: TMenuItem;
    N2: TMenuItem;
    pmnuPrint: TMenuItem;
    ResetGrid1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure FormDeactivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure ResetGrid1Click(Sender: TObject);
  private
    FActivated: boolean;
    ActiveCode: integer;
    DontSaveLayout: Boolean;
    dtmdlAllContracts : TdtmdlContract;
    iMnuMaint: integer;
    iOperatorRep: Integer;
    FDisableNameChangeEvent: boolean;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: TconMode);
    function CheckInput: boolean;
    procedure SetButtonProperties(Sender: TObject);
    { Private declarations }
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmPBLUContracts: TfrmPBLUContracts;

implementation

uses
  System.UITypes, System.Types,
  pbMainMenu, pbDatabase, CCSCommon, PBMaintContract, PBLUContractSearch;

{$R *.dfm}

procedure TfrmPBLUContracts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'ContractLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
    end;
  Action := caFree;
end;

procedure TfrmPBLUContracts.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUContracts.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllContracts.refreshData;
end;

procedure TfrmPBLUContracts.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
  sShowLive: string;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      stempdate := ReadString('Centrereed Broker', 'Contract Search Date', 'None');
      sShowLive := ReadString('Centrereed Broker', 'Show Live Contracts', 'None');
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllContracts := TdtmdlContract.create(self);

  if stempdate = 'None' then
    dtmdlAllContracts.ContractDate := Date - 365
  else
    dtmdlAllContracts.ContractDate := PBdatestr(stempdate);

  if sShowLive = 'None' then
    dtmdlAllContracts.ShowOnlyLive := false
  else
    dtmdlAllContracts.ShowOnlyLive := true;

  dtmdlAllContracts.dtsContractGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllContracts.dtsContractGrid;

  CCSCommon.SetDBGridCols('', 'ContractLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TfrmPBLUContracts.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive: string;
begin
  if dtmdlAllContracts.ShowOnlyLive then
    sShowLive := 'Show'
  else
    sShowLive := 'None';

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      WriteString('Centrereed Broker', 'Contract Search Date', pbdatestr(dtmdlAllContracts.ContractDate));
      WriteString('Centrereed Broker', 'Show Live Contracts', sShowLive);
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllContracts.free;
end;

procedure TfrmPBLUContracts.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllContracts do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;

    edtNumber.Text := dbgDetails.datasource.dataset.fieldbyname('Contract_Number').asstring;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    lblShowLive.Visible := ShowLive;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUContracts.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllContracts.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUContracts.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuContracts') ;
  if not FActivated then
    begin
//      btnPrint.Visible := false;
      {Check if the operator REP is needed} ;
      If dmBroker.iAccCtrlMenu = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;
      {Get the button statuses} ;
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuContracts') ;

      If dmBroker.iAccCtrlMenu = 5 then
        dtmdlAllContracts.Operator := frmpbMainMenu.iOperator;
      dtmdlAllContracts.Rep := iOperatorRep;
      dtmdlAllContracts.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

      SetButtonProperties(self);

      FActivated := True;
    end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllContracts.RefreshData;
  dbgDetails.DataSource.DataSet.Locate('Contract', Variant(inttostr(ActiveCode)),[lopartialKey]);

end;

procedure TfrmPBLUContracts.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmPBLUContracts.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUContracts.CallMaintScreen(aMode : TconMode);
var
  bTempOK: ByteBool;
  Key : integer;
  frm: TPBMaintContractFrm;
  aContract : TContract;
begin
  if aMode = conAdd then
    Key := 0
  else
    Key := dbgDetails.datasource.dataset.fieldbyname('Contract').asinteger;

  aContract := TContract.Create(dtmdlAllContracts);
  try
    aContract.DbKey := key;
    aContract.LoadFromDB;
    Frm := TPBMaintContractFrm.Create(Self);
    try
     if aMode = conAdd then
      begin
        if aContract.OriginalContract = 0 then
          aContract.OriginalContract := aContract.dbKey;
      end;

     Frm.Mode := aMode;
     Frm.Contract := aContract;
     Frm.ShowModal;
     Key := aContract.DbKey;
     bTempOK := (Frm.ModalResult = mrOK);
    finally
      Frm.Free;
    end;
  finally
    aContract.Free;
  end;

  if bTempOK then
    begin
      dtmdlAllContracts.RefreshData;

      if aMode <> conDelete then
        dbgDetails.datasource.DataSet.Locate('Contract', Variant(inttostr(Key)),[lopartialKey]);
    end;
end;

procedure TfrmPBLUContracts.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(conAdd);
end;

procedure TfrmPBLUContracts.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  if trim(btnChange.caption) = '&View' then
    CallMaintScreen(conView)
  else
    CallMaintScreen(conChange);
end;

procedure TfrmPBLUContracts.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen(conDelete);
end;

procedure TfrmPBLUContracts.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUContracts.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmPBLUContracts.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlAllContracts.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlAllContracts.SortOrder := SortField + SortType;
  dtmdlAllContracts.SortType := SortType;

  dtmdlAllContracts.refreshdata;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmPBLUContracts.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Contract').asinteger;
  except
    ActiveCode := 0;
  end;

end;

procedure TfrmPBLUContracts.btnSearchClick(Sender: TObject);
begin
  frmPBLUContractSearch := TfrmPBLUContractSearch.create(self);
  try
    frmPBLUContractSearch.dtmdlSearchContracts := dtmdlAllContracts;
    frmPBLUContractSearch.edtStatus.Text := dtmdlAllContracts.Status;
    frmPBLUContractSearch.edtQuantity.Text := dtmdlAllContracts.QuantityDesc;
    frmPBLUContractSearch.edtMinimumQuantity.Text := dtmdlAllContracts.MinimumQuantityDesc;
    frmPBLUContractSearch.edtDescription.Text := dtmdlAllContracts.Description;
    frmPBLUContractSearch.edtRep.Text := dtmdlAllContracts.RepName;
    frmPBLUContractSearch.edtSubRep.Text := dtmdlAllContracts.SubRepName;
    frmPBLUContractSearch.edtAccountMgr.Text := dtmdlAllContracts.AccountMgr;
    frmPBLUContractSearch.edtOperator.Text := dtmdlAllContracts.OperatorName;
    frmPBLUContractSearch.chkbxShowWIP.checked := dtmdlAllContracts.ShowWIP;
    frmPBLUContractSearch.chkbxShowInactive.checked := (dtmdlAllContracts.ShowInactive = 'Y');

    frmPBLUContractSearch.edtDate.Text := pbDateStr(dtmdlAllContracts.ContractDate);
    frmPBLUContractSearch.edtDateReq.Text := pbDateStr(dtmdlAllContracts.DateRequired);
    frmPBLUContractSearch.showModal;
  finally
    frmPBLUContractSearch.free;
  end;
end;

procedure TfrmPBLUContracts.btnReportsClick(Sender: TObject);
begin
(*  frmPBLUContractReports := TfrmPBLUContractReports.create(self);
  try
    frmPBLUContractReports.showmodal;
  finally
    frmPBLUContractReports.free;
  end;
*)
end;

function TfrmPBLUContracts.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Contract_Number', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Contract '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmPBLUContracts.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmPBLUContracts.SetButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd: ByteBool;
begin
  {They can UPDATE this job if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the job bag Non Conformance maint button on the menu} ;
  bTempCanUpd :=  ((iMnuMaint = 1) or
                  (iMnuMaint = 4) or
                  (iMnuMaint = 5)) ;
  {They can ADD jobs IF} ;
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
// set popup menu properties
  pmnuAdd.Visible := btnAdd.Visible;
  pmnuChange.Visible := btnChange.Visible;
  pmnuPrint.Visible := btnPrint.Visible;
  pmnuDelete.visible := btnDelete.Visible
end;

procedure TfrmPBLUContracts.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('ContractLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

end.
