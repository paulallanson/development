unit pbLuNCA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin,
  Db, pbJobsDM, pbJobBagDM, inifiles, Buttons, System.ImageList;

type
  TfrmPBluNCA = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    stsbrDetails: TStatusBar;
    imglstjobs: TImageList;
    tmrSearch: TTimer;
    pmnFunctions: TPopupMenu;
    pmnuAdd: TMenuItem;
    pmnuChange: TMenuItem;
    Panel2: TPanel;
    Label2: TLabel;
    btnClose: TButton;
    edtNumber: TEdit;
    btnReports: TToolButton;
    Panel3: TPanel;
    Label3: TLabel;
    pmnuPrintDraft: TMenuItem;
    pmnuRepeat: TMenuItem;
    N2: TMenuItem;
    ToolButton3: TToolButton;
    btnPrint: TToolButton;
    pmnuPrint: TMenuItem;
    N3: TMenuItem;
    ResetGrid1: TMenuItem;
    btnSearch: TBitBtn;
    lblWorkinProgress: TLabel;
    btnDelete: TToolButton;
    pmnuDelete: TMenuItem;
    pmnuNonConform: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure ResetGrid1Click(Sender: TObject);
    procedure pmnFunctionsPopup(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
  private
    FActivated: boolean;
    ActiveCode: integer;
    DontSaveLayout: Boolean;
    iMnuMaint: integer;
    iOperatorRep: Integer;
    FDisableNameChangeEvent: boolean;
    dtmdlNCAJobs : TdtmdlJobs;
    dmJobBag: TdmJobBag;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetButtonProperties(Sender: TObject);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: TjbncMode);
    function CheckInput: boolean;
    { Private declarations }
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmPBluNCA: TfrmPBluNCA;

implementation

uses
  System.UITypes, System.Types,
  pbMainMenu, pbDatabase, CCSCommon, PBMaintNonConfDoc, pbluNCASearch, PBRSNonConform, PBLUNCARpts;


{$R *.DFM}

procedure TfrmPBluNCA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'JobNCALU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
    end;
  Action := caFree;
end;

procedure TfrmPBluNCA.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBluNCA.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlNCAJobs.refreshNCAdata;
end;

procedure TfrmPBluNCA.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
  sShowWIP: string;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      stempdate := ReadString('Centrereed Broker', 'Job Bag NCA Search Date', 'None');
      sShowWIP := ReadString('Centrereed Broker', 'Show Job Bag Live NCA', 'None');
    end;
  finally
    IniFile.Free;
  end;

  dtmdlNCAJobs := TdtmdlJobs.create(self);

  if stempdate = 'None' then
    dtmdlNCAJobs.NCADate := Date - 365
  else
    dtmdlNCAJobs.NCADate := PBdatestr(stempdate);

  if sShowWIP = 'None' then
    dtmdlNCAJobs.ShowLiveNCA := false
  else
    dtmdlNCAJobs.ShowLiveNCA := true;

  dtmdlNCAJobs.dtsJobsNCA.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlNCAJobs.dtsJobsNCA;

  CCSCommon.SetDBGridCols('', 'JobNCALU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TfrmPBluNCA.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLiveNCA: string;
begin
  if dtmdlNCAJobs.ShowLiveNCA then
    sShowLiveNCA := 'Show'
  else
    sShowLiveNCA := 'None';

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      WriteString('Centrereed Broker', 'Job Bag NCA Search Date', pbdatestr(dtmdlNCAJobs.NCADate));
      WriteString('Centrereed Broker', 'Show Job Bag Live NCA', sShowLiveNCA);
    end;
  finally
    IniFile.Free;
  end;

  dtmdlNCAJobs.free;
end;

procedure TfrmPBluNCA.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlNCAJobs do
  begin
    btnChange.Enabled := NCACount > 0;
    btnPrint.Enabled := NCACount > 0;
    btnDelete.Enabled := NCACount > 0;
    edtNumber.Text := dbgDetails.datasource.dataset.fieldbyname('Job_Bag_Non_Conform').asstring;

    if usingNCASearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    lblWorkinProgress.Visible := ShowLiveNCA;
    stsBrDetails.panels[0].text := inttostr(NCACount) + ' records displayed';
  end;
end;

procedure TfrmPBluNCA.SetButtonProperties(Sender: TObject);
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

procedure TfrmPBluNCA.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmPBluNCA.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlNCAJobs.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBluNCA.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBluNCA.CallMaintScreen(aMode: TjbncMode);
var
  Key : integer;
  frm : TPBMaintNonConfDocFrm;
  aBag : TJobBag;
  OrigAccCtrlMenu: integer;
begin
  OrigAccCtrlMenu := dmBroker.iAccCtrlMenu;

  if aMode = jbncAdd then
    Key := 0
  else
    begin
      Key := dbgDetails.DataSource.DataSet.fieldbyname('Job_Bag_Non_Conform').asinteger;
    end;

  Frm := TPBMaintNonConfDocfrm.Create(Self);
  Frm.icode := key;
  try
    Frm.Mode := aMode;
    Frm.bJobBagType := dmBroker.UseJobBags;

    Frm.ShowModal;
    if (Frm.ModalResult = mrok) then
      begin
        Key := frm.iCode;
        dtmdlNCAJobs.RefreshNCAData;
        dbgDetails.DataSource.DataSet.Locate('Job_Bag_Non_Conform', Variant(inttostr(Key)),[lopartialKey]) ;
      end;

  finally
    Frm.Free;
  end;
end;

procedure TfrmPBluNCA.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(jbncAdd);
end;

procedure TfrmPBluNCA.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  if trim(btnChange.caption) = '&View' then
    CallMaintScreen(jbncView)
  else
    CallMaintScreen(jbncChange);
end;

function TfrmPBluNCA.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Job_Bag_Non_Conform', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Job '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmPBluNCA.edtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmPBluNCA.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBluNCA.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'Total Cost') then
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

procedure TfrmPBluNCA.btnSearchClick(Sender: TObject);
begin
  frmpbLuNCASearch := TfrmpbLuNCASearch.create(self);
  try
    frmpbLuNCASearch.dtmdlSearchNCA := dtmdlNCAJobs;
    frmpbLuNCASearch.edtStatus.Text := dtmdlNCAJobs.Status;
    frmpbLuNCASearch.edtDescription.Text := dtmdlNCAJobs.Description;
    frmpbLuNCASearch.edtRep.Text := dtmdlNCAJobs.RepName;
    frmpbLuNCASearch.edtAccountMgr.Text := dtmdlNCAJobs.AccountMgr;
    frmpbLuNCASearch.edtReasonType.Text := dtmdlNCAJobs.ReasonType;
    frmpbLuNCASearch.edtRaisedby.Text := dtmdlNCAJobs.Raisedby;
    frmpbLuNCASearch.edtRaisingDept.Text := dtmdlNCAJobs.RaisingDept;
    frmpbLuNCASearch.edtSourceDept.Text := dtmdlNCAJobs.SourceDept;
    frmpbLuNCASearch.chkbxShowLiveNCA.checked := dtmdlNCAJobs.ShowLiveNCA;
    frmpbLuNCASearch.chkbxShowInactive.checked :=  (dtmdlNCAJobs.ShowInactiveNCA = 'Y');

    frmpbLuNCASearch.edtDate.Text := pbDateStr(dtmdlNCAJobs.JobDate);
    frmpbLuNCASearch.showModal;
  finally
    frmpbLuNCASearch.free;
  end;
end;

procedure TfrmPBluNCA.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuNCA') ;

  if not FActivated then
    begin
//      btnPrint.Visible := false;
      {Check if the operator REP is needed} ;
      If dmBroker.iAccCtrlMenu = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;
      {Get the button statuses} ;
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuNCA') ;

      If dmBroker.iAccCtrlMenu = 5 then
        dtmdlNCAJobs.Operator := frmpbMainMenu.iOperator;
      dtmdlNCAJobs.Rep := iOperatorRep;
      dtmdlNCAJobs.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

      SetButtonProperties(self);

      FActivated := True;
    end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlNCAJobs.RefreshNCAData;
  dbgDetails.DataSource.DataSet.Locate('Job_Bag_non_Conform', Variant(inttostr(ActiveCode)),[lopartialKey]);
end;

procedure TfrmPBluNCA.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Job_Bag_Non_Conform').asinteger;
  except
    ActiveCode := 0;
  end;
end;

procedure TfrmPBluNCA.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('JobLUNCA Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmPBluNCA.pmnFunctionsPopup(Sender: TObject);
begin
  pmnuChange.Caption := trim(btnChange.caption);
end;

procedure TfrmPBluNCA.btnDeleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(jbncDelete);
end;

procedure TfrmPBluNCA.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: real;
begin
  if not CheckInput then
    exit;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmPBRSNonConform := TfrmPBRSNonConform.Create( Application );
    Key := dbgdetails.DataSource.DataSet.fieldbyname('Job_Bag_Non_Conform').asinteger;

    frmPBRSNonConform.memSelection.text := floattostr(Key);
    frmPBRSNonConform.edtCustomer.text := dbgdetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    frmPBRSNonConform.JobBagType := (dbgdetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger <> 0);
    if dbgdetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger <> 0 then
      begin
        frmPBRSNonConform.memJobBag.text := dbgdetails.DataSource.DataSet.fieldbyname('Job_Bag').asstring;
        frmPBRSNonConform.memDescription.text := dbgdetails.DataSource.DataSet.fieldbyname('Job_Bag_Descr').asstring;
      end
    else
      begin
        frmPBRSNonConform.memJobBag.text := dbgdetails.DataSource.DataSet.fieldbyname('Purchase_Order').asstring;
        frmPBRSNonConform.memDescription.text := dbgdetails.DataSource.DataSet.fieldbyname('Customers_Desc').asstring;
      end;
    frmPBRSNonConform.showmodal;
  finally
    frmPBRSNonConform.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    Screen.Cursor := OldCursor;
  end;
  dbgdetails.DataSource.DataSet.Locate('Job_Bag_Non_Conform', Variant(floattostr(Key)),[lopartialKey]) ;
end;

procedure TfrmPBluNCA.btnReportsClick(Sender: TObject);
begin
  frmPBLUNCARpts := TfrmPBLUNCARpts.create(self);
  try
    frmPBLUNCARpts.showmodal;
  finally
    frmPBLUNCARpts.free;
  end;
end;

end.
