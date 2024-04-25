unit PBLUActivities;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, Grids, DBGrids, ComCtrls, ToolWin, Buttons, DB, ExtCtrls, IniFiles, PBActivityDM, DateUtils,
  System.ImageList;

type
  TfrmPBLUActivities = class(TForm)
    Panel3: TPanel;
    Label3: TLabel;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TButton;
    btnSearch: TBitBtn;
    CoolBar7: TCoolBar;
    ToolBar8: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    dbgDetails: TDBGrid;
    imglstjobs: TImageList;
    Label60: TLabel;
    edtSearch: TEdit;
    tmrSearch: TTimer;
    lblShowLive: TLabel;
    chkbxShowAll: TCheckBox;
    btnFollowUp: TToolButton;
    btnReports: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure chkbxShowAllClick(Sender: TObject);
    procedure btnFollowUpClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
  private
    FActivated: boolean;
    ActiveCode: integer;
    DontSaveLayout: Boolean;
    dtmdlAllActivities : TdtmdlActivity;
    iMnuMaint: integer;
    iOperatorRep: Integer;
    FDisableNameChangeEvent: boolean;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: TactMode);
    { Private declarations }
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmPBLUActivities: TfrmPBLUActivities;

implementation

uses
  System.UITypes, System.Types,
  pbMainMenu, CCSCommon, PBMaintActivity, pbDatabase,
  PBLUActivitiesSearch, PBLUActivityReports;

{$R *.dfm}

procedure TfrmPBLUActivities.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'ActivityLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
    end;
  Action := caFree;
end;

procedure TfrmPBLUActivities.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUActivities.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllActivities.refreshData;
end;

procedure TfrmPBLUActivities.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
  sShowLive, sShowAllOperators: string;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      stempdate := ReadString('Centrereed Broker', 'Activity Search Date', 'None');
      sShowLive := ReadString('Centrereed Broker', 'Show Live Activities', 'None');
      sShowAllOperators := ReadString('Centrereed Broker', 'Show All Operator Activities', 'None');
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllActivities := TdtmdlActivity.create(self);
  dtmdlAllActivities.AssignedTo := frmPBMainMenu.iOperator;
  dtmdlAllActivities.Operator := frmPBMainMenu.iOperator;

  if stempdate = 'None' then
    dtmdlAllActivities.ActivityDate := Date - 365
  else
    dtmdlAllActivities.ActivityDate := PBdatestr(stempdate);

  if sShowLive = 'None' then
    dtmdlAllActivities.ShowOnlyLive := false
  else
    dtmdlAllActivities.ShowOnlyLive := true;

  if sShowAllOperators = 'None' then
    begin
      dtmdlAllActivities.Operator := frmPBMainMenu.iOperator;
      chkbxShowAll.checked := false;
    end
  else
    begin
      dtmdlAllActivities.Operator := 0;
      chkbxShowAll.checked := true;
    end;

  dtmdlAllActivities.dtsActivityGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllActivities.dtsActivityGrid;

  CCSCommon.SetDBGridCols('', 'ActivityLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TfrmPBLUActivities.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive, sShowAllOperators: string;
begin
  if dtmdlAllActivities.ShowOnlyLive then
    sShowLive := 'Show'
  else
    sShowLive := 'None';

  if (dtmdlAllActivities.Operator = 0) and (chkbxShowAll.visible) then
    sShowAllOperators := 'Show'
  else
    sShowAllOperators := 'None';

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      WriteString('Centrereed Broker', 'Activity Search Date', pbdatestr(dtmdlAllActivities.ActivityDate));
      WriteString('Centrereed Broker', 'Show Live Activities', sShowLive);
      WriteString('Centrereed Broker', 'Show All Operator Activities', sShowAllOperators);
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllActivities.free;
end;

procedure TfrmPBLUActivities.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllActivities do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnFollowUp.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    lblShowLive.Visible := ShowOnlyLive;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUActivities.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmPBLUActivities.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllActivities.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUActivities.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUActivities.CallMaintScreen(aMode : TactMode);
var
  bTempOK: ByteBool;
  Key : integer;
  frm: TPBMaintActivityFrm;
  aActivity : TActivity;
begin
  if aMode = actAdd then
    Key := 0
  else
    Key := dbgDetails.datasource.dataset.fieldbyname('Activity').asinteger;

  aActivity := TActivity.Create(dtmdlAllActivities);
  try
    aActivity.DbKey := key;
    aActivity.LoadFromDB;
    Frm := TPBMaintActivityFrm.Create(Self);
    try
     if aMode = actAdd then
      begin
        aActivity.CustomerName := edtSearch.text;
(*        aActivity.Customer := iCustomer;
        if self.Prospect then
          Frm.Entity := 'PROSPECT'
        else
          Frm.Entity := 'CUST';
*)
      end;
     if aMode = actAdd then
      begin
        if aActivity.OriginalActivity = 0 then
          aActivity.OriginalActivity := aActivity.dbKey;
      end;

     Frm.Mode := aMode;
     Frm.Activity := aActivity;
     Frm.ShowModal;
     Key := aActivity.DbKey;
     bTempOK := (Frm.ModalResult = mrOK);
    finally
      Frm.Free;
    end;
  finally
    aActivity.Free;
  end;

  if bTempOK then
    begin
      dtmdlAllActivities.RefreshData;

      if aMode <> actDelete then
        dbgDetails.datasource.DataSet.Locate('Activity', Variant(inttostr(Key)),[lopartialKey]);
    end;
end;

procedure TfrmPBLUActivities.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(actAdd);
end;

procedure TfrmPBLUActivities.btnChangeClick(Sender: TObject);
begin
  if trim(btnChange.caption) = '&View' then
    CallMaintScreen(actView)
  else
    CallMaintScreen(actChange);
end;

procedure TfrmPBLUActivities.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen(actDelete);
end;

procedure TfrmPBLUActivities.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUActivities.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('Activity_Status').asinteger = 30) then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
  else
  if IsToday(dbgDetails.datasource.dataset.fieldByName('Due_Date_Time').Asdatetime) and
      (dbgDetails.datasource.dataset.fieldByName('Activity_Status').asinteger < 30) then
      begin
          (Sender as TDBGrid).Canvas.font.color := clWhite;
          (Sender as TDBGrid).Canvas.Brush.color := clGreen;
          (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Due_Date_Time').Asdatetime < now) and
      (dbgDetails.datasource.dataset.fieldByName('Activity_Status').asinteger < 30) then
      begin
          (Sender as TDBGrid).Canvas.font.color := clRed;
          (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

  
end;

procedure TfrmPBLUActivities.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlAllActivities.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlAllActivities.SortOrder := SortField + SortType;
  dtmdlAllActivities.SortType := SortType;

  dtmdlAllActivities.refreshdata;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmPBLUActivities.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuActivities') ;
  if not FActivated then
    begin
//      btnPrint.Visible := false;
      {Check if the operator REP is needed} ;
      If dmBroker.iAccCtrlMenu = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;
      {Get the button statuses} ;
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuActivities') ;

      If dmBroker.iAccCtrlMenu = 5 then
        dtmdlAllActivities.Operator := frmpbMainMenu.iOperator;
      dtmdlAllActivities.Rep := iOperatorRep;

      chkbxShowAll.Visible := dmBroker.OperatorCanViewActivities(frmpbMainMenu.iOperator);
      btnDelete.Visible := chkbxShowAll.Visible;
      Factivated := true;
    end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllActivities.RefreshData;
  dbgDetails.DataSource.DataSet.Locate('Activity', Variant(inttostr(ActiveCode)),[lopartialKey]);

end;

procedure TfrmPBLUActivities.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Activity').asinteger;
  except
    ActiveCode := 0;
  end;

end;

procedure TfrmPBLUActivities.btnSearchClick(Sender: TObject);
begin
  frmPBLUActivitiesSearch := TfrmPBLUActivitiesSearch.create(self);
  try
    frmPBLUActivitiesSearch.dtmdlSearchActivities := dtmdlAllActivities;
    frmPBLUActivitiesSearch.edtBranch.Text := dtmdlAllActivities.BranchName;
    frmPBLUActivitiesSearch.edtContact.Text := dtmdlAllActivities.ContactName;
    frmPBLUActivitiesSearch.edtPriority.Text := dtmdlAllActivities.Priority;
    frmPBLUActivitiesSearch.edtSubject.Text := dtmdlAllActivities.Subject;
    frmPBLUActivitiesSearch.edtType.Text := dtmdlAllActivities.ActivityType;
    frmPBLUActivitiesSearch.edtStatus.text := dtmdlAllActivities.ActivityStatus;
    frmPBLUActivitiesSearch.edtCreatedBy.text := dtmdlAllActivities.CreatedByName;
    frmPBLUActivitiesSearch.edtAssignedTo.text := dtmdlAllActivities.AssignedToName;

    frmPBLUActivitiesSearch.edtReference.Text := dtmdlAllActivities.Reference;
    frmPBLUActivitiesSearch.edtDescription.Text := dtmdlAllActivities.Description;

    frmPBLUActivitiesSearch.edtDate.Text := pbDateStr(dtmdlAllActivities.DateCreated);
    frmPBLUActivitiesSearch.edtDueDate.Text := pbDateStr(dtmdlAllActivities.DueDate);

    frmPBLUActivitiesSearch.chkbxShowOnlyLive.checked := dtmdlAllActivities.ShowOnlyLive;
    frmPBLUActivitiesSearch.showModal;
  finally
    frmPBLUActivitiesSearch.free;
  end;
end;

procedure TfrmPBLUActivities.chkbxShowAllClick(Sender: TObject);
begin
  if (Sender as TCheckBox).checked then
    dtmdlAllActivities.Operator := 0
  else
    dtmdlAllActivities.Operator := frmPBMainMenu.iOperator;
  dtmdlAllActivities.Refreshdata;
end;

procedure TfrmPBLUActivities.btnFollowUpClick(Sender: TObject);
begin
  CallMaintScreen(actFollowUp);
end;

procedure TfrmPBLUActivities.btnReportsClick(Sender: TObject);
begin
  frmPBLUActivityReports := TfrmPBLUActivityReports.create(self);
  try
    frmPBLUActivityReports.showmodal;
  finally
    frmPBLUActivityReports.free;
  end;
end;

end.
