unit wtLUJobs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Db, Grids, DBGrids, WTJobsDM,
  Menus, AllCommon, IniFiles, Buttons, QrCtrls, System.ImageList;

type
  TfrmwtLUJobs = class(TForm)
    stsBrDetails: TStatusBar;
    Panel1: TPanel;
    Button1: TButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    ToolButton6: TToolButton;
    imgLstHot: TImageList;
    btnPrint: TToolButton;
    Label1: TLabel;
    edtSearch: TEdit;
    tmrSearch: TTimer;
    btnCopy: TToolButton;
    dbgDetails: TDBGrid;
    pMnuReports: TPopupMenu;
    CuttingSchedule1: TMenuItem;
    OrderSheet1: TMenuItem;
    Accont1: TMenuItem;
    CoolBar2: TCoolBar;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtNumber: TEdit;
    btnCutting: TToolButton;
    btnFitting: TToolButton;
    btnComplete: TToolButton;
    ToolButton1: TToolButton;
    btnJobSheet: TToolButton;
    lblWorkinProgress: TLabel;
    btnSearch: TBitBtn;
    btnRemedial: TToolButton;
    Label4: TLabel;
    cmbCustomerFilter: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure CuttingSchedule1Click(Sender: TObject);
    procedure MasonsReport1Click(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure OrderSheet1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCuttingClick(Sender: TObject);
    procedure btnFittingClick(Sender: TObject);
    procedure btnCompleteClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnJobSheetClick(Sender: TObject);
    procedure btnRemedialClick(Sender: TObject);
    procedure cmbCustomerFilterChange(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDetailsTitleClick(Column: TColumn);
  private
    ActiveCode: integer;
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(aMode: TjMode);
    function CheckInput: boolean;
    procedure CallCompleteScreen;
    { Private declarations }
  protected
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
  end;

var
  frmwtLUJobs: TfrmwtLUJobs;
  dtmdlAllJobs: TdtmdlJob;

implementation

uses WtMaintJob, WTRSJobCutSched, WTRSJobMasonRpt, WTJobSearch,
  wtRSJobSheet, WtMaintJobComplete, WTLUJobRpts, wtMain, wtDataModule,
  WTRSJobRemedialSheet;

{$R *.DFM}

{ TfrmLUQuotes }

procedure TfrmwtLUJobs.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmwtLUJobs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'JobsLU Col Order', 'myWorktops.ini', self.dbgDetails);
  Action := caFree;
end;

procedure TfrmwtLUJobs.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUJobs.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive: string;
begin
  dtmdlAllJobs := TdtmdlJob.create(Application);
  dtmdlAllJobs.dtsAllJobs.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllJobs.dtsAllJobs;

  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      if (ReadString('Jobs', 'Customer Filter', '0') = '0') then
        cmbCustomerFilter.itemindex := 0
      else
      if (ReadString('Jobs', 'Customer Filter', '1') = '1') then
        cmbCustomerFilter.itemindex := 1
      else
      if (ReadString('Jobs', 'Customer Filter', '2') = '2') then
        cmbCustomerFilter.itemindex := 2
      else
      if (ReadString('Jobs', 'Customer Filter', '3') = '3') then
        cmbCustomerFilter.itemindex := 3;

      sShowLive := ReadString('Jobs', 'Show WIP', 'None');
      dtmdlAllJobs.ShowRecords := strtoint(ReadString('Jobs', 'Show Records', '0'));
      Free;
    end;

  if sShowLive = 'None' then
    dtmdlAllJobs.ShowWIP := false
  else
    dtmdlAllJobs.ShowWIP := true;

  AllCommon.SetDBGridCols('', 'JobsLU Col Order', 'myWorktops.ini', self.dbgDetails);
end;

procedure TfrmwtLUJobs.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive: string;
begin
  if dtmdlAllJobs.ShowWIP then
    sShowLive := 'Show'
  else
    sShowLive := 'None';

  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      WriteString('Jobs', 'Customer Filter', inttostr(cmbCustomerFilter.itemindex));
      WriteString('Jobs', 'Show WIP', sShowLive);
      WriteString('Jobs', 'Show Records', inttostr(dtmdlAllJobs.ShowRecords));
      Free;
    end;

  dtmdlAllJobs.free;
end;

procedure TfrmwtLUJobs.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllJobs.customerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmwtLUJobs.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllJobs.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllJobs.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUJobs.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllJobs do
  begin
    btnChange.Enabled := HeaderCountAll > 0;
    btnPrint.Enabled := HeaderCountAll > 0;
    btnJobSheet.Enabled := HeaderCountAll > 0;
    btnCutting.Enabled := HeaderCountAll > 0;
    btnFitting.Enabled := HeaderCountAll > 0;
    btnRemedial.Enabled := HeaderCountAll > 0;
    btnComplete.Enabled := HeaderCountAll > 0;
    btnCopy.Enabled := HeaderCountAll > 0;
    btnDelete.Enabled := HeaderCountAll > 0;
    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Job').asstring;
    lblWorkinProgress.Visible := ShowWIP;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;
    stsBrDetails.panels[0].text := inttostr(HeaderCountAll) + ' records displayed';
  end;
end;

procedure TfrmwtLUJobs.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  if trim(btnChange.caption) = '&View' then
    CallMaintScreen(jRestrict)
  else
    CallMaintScreen(jChange);
end;

procedure TfrmwtLUJobs.CallMaintScreen(aMode : TjMode);
var
  Key, iFirstKey : integer;
  frm : TfrmWtMaintJob;
  aJob : TJob;
  bOK: boolean;
begin
  if aMode = jAdd then
    Key := 0
  else
  if aMode = jChange then
    begin
      if dbgdetails.DataSource.DataSet.FieldByName('Job_status').asinteger >= 50 then
        begin
          if MessageDlg('This job is '+ dbgdetails.DataSource.DataSet.FieldByName('Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
          aMode := jRestrict;
        end
      else
      if dbgdetails.DataSource.DataSet.FieldByName('Job_status').asinteger > 10 then
        begin
          if MessageDlg('This job is '+ dbgdetails.DataSource.DataSet.FieldByName('Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end;
      Key := dtmdlAllJobs.CurrentJob;
    end
  else
    Key := dtmdlAllJobs.CurrentJob;

  try
    aJob := TJob.Create(dtmdlAllJobs);
    try
      aJob.DbKey := key;
      aJob.jMode := aMode;
      aJob.LoadFromDB;
      Frm := TfrmwtMaintJob.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.Job := aJob;
        Frm.ShowModal;
        bOK := Frm.bOK;
        Key := aJob.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aJob.Free;
    end;
  finally
    if bOK then
    begin
      dbgdetails.DataSource.DataSet.Close;
      dbgdetails.DataSource.DataSet.Open;
      iFirstKey := dbgdetails.DataSource.DataSet.fieldbyname('Job').asinteger;

      while (dbgdetails.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) <> true) and (key < iFirstKey) do
        begin
          inc(key);
        end;
    end;
  end;
end;

procedure TfrmwtLUJobs.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(jAdd);
end;

procedure TfrmwtLUJobs.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmwtLUJobs.CuttingSchedule1Click(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSJobCutSched := TfrmWTRSJobCutSched.Create( Application );
    Key := dtmdlAllJobs.CurrentJob;
    frmWTRSJobCutSched.memSelection.text := inttostr(Key);
    frmWTRSJobCutSched.showmodal;
  finally
    frmWTRSJobCutSched.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmwtLUJobs.MasonsReport1Click(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSJobMasonRpt := TfrmWTRSJobMasonRpt.Create( Application );
    Key := dtmdlAllJobs.CurrentJob;
    frmWTRSJobMasonRpt.memSelection.text := inttostr(Key);
    frmWTRSJobMasonRpt.showmodal;
  finally
    frmWTRSJobMasonRpt.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmwtLUJobs.btnSearchClick(Sender: TObject);
begin
  frmWTJobSearch := TfrmWTJobSearch.create(self);
  try
    frmWTJobSearch.dtmdlJob := dtmdlAllJobs;
    frmWTJobSearch.edtDescription.text := dtmdlAllJobs.Description;
    frmWTJobSearch.edtProjectReference.Text := dtmdlAllJobs.ProjectReference;
    frmWTJobSearch.edtReference.Text := dtmdlAllJobs.Reference;
    frmWTJobSearch.edtMaterial.Text := dtmdlAllJobs.Material;
    frmWTJobSearch.edtOrderRef.Text := dtmdlAllJobs.OrderRef;
    frmWTJobSearch.spnedtRecords.Value := dtmdlAllJobs.showRecords;
    frmWTJobSearch.chkbxShowWIP.checked := dtmdlAllJobs.ShowWIP;
    frmWTJobSearch.chkbxShowInactive.checked := dtmdlAllJobs.showInactive = 'Y';
    frmWTJobSearch.showModal;
  finally
    frmWTJobSearch.free;
  end;
end;

procedure TfrmwtLUJobs.btnDeleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(jDelete);
end;

procedure TfrmwtLUJobs.btnCopyClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(jCopy);
end;

procedure TfrmwtLUJobs.OrderSheet1Click(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtRSJobSheet := TfrmWtRSJobSheet.Create( Application );
  try
    Key := dtmdlAllJobs.CurrentJob;
    frmWtRSJobSheet.memSelection.text := inttostr(Key);
    frmWtRSJobSheet.showmodal;
  finally
    frmWtRSJobSheet.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmwtLUJobs.FormShow(Sender: TObject);
begin
//  dtmdlAllJobs.RefreshAlldata;
  edtSearch.setfocus;
end;

procedure TfrmwtLUJobs.edtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);

end;

function TfrmwtLUJobs.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Job', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Job '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmwtLUJobs.FormActivate(Sender: TObject);
begin
  if frmWTMain.bEndUser then
    begin
      btnJobSheet.Visible := false;
      btnCutting.Visible := false;
      btnFitting.Visible := false;
      btnRemedial.Visible := false;
      btnComplete.Visible := false;
      btnAdd.Visible := false;
      btnCopy.Visible := false;
      btnChange.Caption := '  &View  ';
    end;

  dtmdlAllJobs.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllJobs.RefreshAlldata;
  dbgDetails.datasource.DataSet.locate('Job', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUJobs.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key, SOkey: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtRSJobSheet := TfrmWtRSJobSheet.Create( Application );
  try
    Key := dtmdlAllJobs.CurrentJob;
    SOKey := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
    frmWtRSJobSheet.PrintType := 'J';
    frmWtRSJobSheet.memSelection.text := inttostr(Key);
    frmWtRSJobSheet.sJobNumber := inttostr(Key);
    frmWtRSJobSheet.sOrderNumber := inttostr(SOKey);
    frmWtRSJobSheet.showmodal;
  finally
    frmWtRSJobSheet.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmwtLUJobs.btnCuttingClick(Sender: TObject);
var
  OldCursor : TCursor;
  key, SOkey: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtRSJobSheet := TfrmWtRSJobSheet.Create( Application );
  try
    Key := dtmdlAllJobs.CurrentJob;
    SOKey := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
    frmWtRSJobSheet.PrintType := 'C';
    frmWtRSJobSheet.memSelection.text := inttostr(Key);
    frmWtRSJobSheet.sJobNumber := inttostr(Key);
    frmWtRSJobSheet.sOrderNumber := inttostr(SOKey);
    frmWtRSJobSheet.showmodal;
    dtmdlAllJobs.SetSOrderStatus(Key);
  finally
    frmWtRSJobSheet.free;
    Screen.Cursor := OldCursor;
  end;
  dbgdetails.DataSource.DataSet.Close;
  dbgdetails.DataSource.DataSet.Open;
  dbgdetails.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) ;
end;

procedure TfrmwtLUJobs.btnFittingClick(Sender: TObject);
var
  OldCursor : TCursor;
  key, SOKey: integer;
begin
  OldCursor := Screen.Cursor;

  Key := dtmdlAllJobs.CurrentJob;
  SOKey := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;

  {OK, let's check that we are able to print Fitting sheet}
  if dtmdlWorktops.CheckBalancePaid then
    begin
      if (dbgdetails.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'Y') AND (dtmdlAllJobs.SOOutstandingBalance(key) > 0) then
        begin
          messagedlg('There is still a balance outstanding for this job. Ensure full payment has been received before fitting.', mtInformation,
                      [mbOk], 0);
          exit;
        end
      else
      if  (dbgdetails.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'N') AND
          (dbgdetails.DataSource.DataSet.fieldbyname('Credit_Status').asstring = 'L')  AND
          (dbgdetails.DataSource.DataSet.fieldbyname('Credit_Limit').asfloat = 0) AND
          (dtmdlAllJobs.SOOutstandingBalance(key) > 0) then
        begin
          messagedlg('There is still a balance outstanding for this job. Ensure full payment has been received before fitting.', mtInformation,
                      [mbOk], 0);
          exit;
        end;
    end;

  Screen.Cursor := crHourglass;
  frmWtRSJobSheet := TfrmWtRSJobSheet.Create( Application );
  try
    frmWTRSJobSheet.bRetail := (dbgdetails.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'Y');
    frmWtRSJobSheet.PrintType := 'F';
    frmWtRSJobSheet.memSelection.text := inttostr(Key);
    frmWtRSJobSheet.sJobNumber := inttostr(Key);
    frmWtRSJobSheet.sOrderNumber := inttostr(SOKey);
    frmWtRSJobSheet.showmodal;
    dtmdlAllJobs.SetSOrderStatus(Key);
  finally
    frmWtRSJobSheet.free;
    Screen.Cursor := OldCursor;
  end;

  dbgdetails.DataSource.DataSet.Close;
  dbgdetails.DataSource.DataSet.Open;
  dbgdetails.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) ;
end;

procedure TfrmwtLUJobs.CallCompleteScreen;
var
  Key, iFirstKey, iCount : integer;
  frm : TfrmWtMaintJobComplete;
  aJob : TJob;
begin
  if dbgDetails.SelectedRows.Count = 1 then
    begin
      if dbgdetails.DataSource.DataSet.FieldByName('Job_status').asinteger >= 50 then
        begin
          MessageDlg('This job is already complete.', mtError,
            [mbAbort], 0);
          exit;
        end;

      Key := dtmdlAllJobs.CurrentJob;

      try
        aJob := TJob.Create(dtmdlAllJobs);
        try
          aJob.DbKey := key;
          aJob.LoadFromDB;
          Frm := TfrmwtMaintJobComplete.Create(Self);
          try
            Frm.Job := aJob;
            Frm.ShowModal;
            Key := aJob.DbKey;
            dtmdlAllJobs.SetSOrderStatus(Key);
          finally
            Frm.Free;
          end;
        finally
          aJob.Free;
        end;
      finally
        dbgdetails.DataSource.DataSet.Close;
        dbgdetails.DataSource.DataSet.Open;
        iFirstKey := dbgdetails.DataSource.DataSet.fieldbyname('Job').asinteger;

        while (dbgdetails.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) <> true) and (key < iFirstKey) do
          begin
            inc(key);
          end;
        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
    end
  else
    begin
      if MessageDlg('Do you want to complete the selected jobs?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          for iCount := (dbgDetails.SelectedRows.Count - 1) downto 0 do
            begin
              dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;

              Key := dbgDetails.datasource.DataSet.fieldbyname('Job').asinteger;

              aJob := TJob.Create(dtmdlAllJobs);
              try
                aJob.DbKey := key;
                aJob.LoadFromDB;
                aJob.Status := 50;
                aJob.ActInstallDate := date;
                aJob.SaveStatustoDB;

                dtmdlAllJobs.SetSOrderStatus(Key);
              finally
                aJob.Free;
              end;
            end;

          dbgdetails.DataSource.DataSet.Close;
          dbgdetails.DataSource.DataSet.Open;
          iFirstKey := dbgdetails.DataSource.DataSet.fieldbyname('Job').asinteger;

          while (dbgdetails.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) <> true) and (key < iFirstKey) do
            begin
              inc(key);
            end;
          with dbgDetails do
            begin
              try
                if datasource.dataset.recordcount > 0 then
                  SelectedRows.CurrentRowSelected := true ;
              except
              end;
            end;
        end;
    end;
end;

procedure TfrmwtLUJobs.btnCompleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallCompleteScreen;
end;

procedure TfrmwtLUJobs.ToolButton1Click(Sender: TObject);
begin
  frmWTLUjobRpts := TfrmWTLUJobRpts.create(self);
  try
    frmWTLUJobRpts.showmodal;
  finally
    frmWTLUJobRpts.free;
  end;
end;

procedure TfrmwtLUJobs.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Job').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmwtLUJobs.btnJobSheetClick(Sender: TObject);
var
  OldCursor : TCursor;
  key, SOkey: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtRSJobSheet := TfrmWtRSJobSheet.Create( Application );
  try
    Key := dbgDetails.datasource.DataSet.FieldByName('Job').asinteger;
    SOKey := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;
    frmWtRSJobSheet.memSelection.text := inttostr(Key);
    frmWtRSJobSheet.sJobNumber := inttostr(Key);
    frmWtRSJobSheet.sOrderNumber := inttostr(SOKey);
    frmWtRSJobSheet.showmodal;
  finally
    frmWtRSJobSheet.free;
    Screen.Cursor := OldCursor;
  end;

end;

procedure TfrmwtLUJobs.btnRemedialClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  frmWTRSJobRemedialSheet := TfrmWTRSJobRemedialSheet.Create( Application );
  try
    Key := dbgDetails.datasource.DataSet.FieldByName('Job').asinteger;
    frmWTRSJobRemedialSheet.Job := Key;
    frmWTRSJobRemedialSheet.showmodal;
  finally
    frmWTRSJobRemedialSheet.free;
    Screen.Cursor := OldCursor;
  end;

(*  frmWtRSJobSheet := TfrmWtRSJobSheet.Create( Application );
  try
    Key := dbgDetails.datasource.DataSet.FieldByName('Job').asinteger;
    frmWtRSJobSheet.PrintType := 'R';
    frmWtRSJobSheet.memSelection.text := inttostr(Key);
    frmWtRSJobSheet.sJobNumber := inttostr(Key);
    frmWtRSJobSheet.showmodal;
    dtmdlAllJobs.SetSOrderStatus(Key);
  finally
    frmWtRSJobSheet.free;
    Screen.Cursor := OldCursor;
  end;
  dbgdetails.DataSource.DataSet.Close;
  dbgdetails.DataSource.DataSet.Open;
  dbgdetails.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) ;
*)
end;

procedure TfrmwtLUJobs.cmbCustomerFilterChange(Sender: TObject);
begin
  dtmdlAllJobs.TradeRetail := (Sender as TComboBox).itemindex;
  dtmdlAllJobs.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUJobs.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'Job') and (Column.Title.Caption <> 'Supply Price') and (Column.Title.Caption <> 'Install Price')
                                        and (Column.Title.Caption <> 'Survey Price') and (Column.Title.Caption <> 'Delivery Price')
                                        and (Column.Title.Caption <> 'Quote Reference') and (Column.Title.Caption <> 'Original Quote')
                                        and (Column.Title.Caption <> 'Sales Order') and (Column.Title.Caption <> 'Quote No.')
                                        and (Column.Title.Caption <> 'Total Price incl VAT') then
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

procedure TfrmwtLUJobs.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlAllJobs.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  if (column.FieldName = 'Status_Text') then
    SortField := 'Job_Status.Job_Status_Description'
  else if (column.FieldName = 'Expiry_Date_New') then
    SortField := 'Job.Expiry_Date'
  else
    SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlAllJobs.SortOrder := SortField + SortType;
  dtmdlAllJobs.SortType := SortType;

  dtmdlAllJobs.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

end.
