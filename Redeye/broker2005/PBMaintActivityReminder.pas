unit PBMaintActivityReminder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, PBActivityDM, DBCtrls,
  Buttons, ComCtrls;

type
  TPBMaintActivityReminderFrm = class(TForm)
    pnlHeader: TPanel;
    dbgDetails: TDBGrid;
    pnlFooter: TPanel;
    btnComplete: TButton;
    btnOpen: TButton;
    btnCompleteAll: TButton;
    dbtxtSubject: TDBText;
    dbtxtDueDate: TDBText;
    Label1: TLabel;
    btnCalendarTask: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    stsbrDetails: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnCompleteClick(Sender: TObject);
    procedure btnCompleteAllClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
  private
    FOperator: integer;
    FCustomer: integer;
    procedure SetOperator(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallActivityMaintScreen(aMode: TactMode);
    { Private declarations }
  public
    { Public declarations }
    dtmdlActivityReminder: TdtmdlActivity;
    property Customer: integer read FCustomer write SetCustomer;
    property Operator: integer read FOperator write SetOperator;
  end;

var
  PBMaintActivityReminderFrm: TPBMaintActivityReminderFrm;

implementation

uses PBMaintActivity, pbMainMenu, CCSCommon;

{$R *.dfm}

{ TPBMaintActivityReminderFrm }

procedure TPBMaintActivityReminderFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TPBMaintActivityReminderFrm.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TPBMaintActivityReminderFrm.FormActivate(Sender: TObject);
begin
  dbgDetails.DataSource := dtmdlActivityReminder.dtsActivityReminder;
  dbtxtSubject.DataSource := dtmdlActivityReminder.dtsActivityReminder;
  dbtxtDueDate.DataSource := dtmdlActivityReminder.dtsActivityReminder;

  self.Caption := 'Activity Reminders for ' + frmPBMainMenu.sOperator_Name;

  dtmdlActivityReminder.Customer := self.Customer;
  dtmdlActivityReminder.AssignedTo := Operator;
  dtmdlActivityReminder.RefreshReminders;
end;

procedure TPBMaintActivityReminderFrm.FormCreate(Sender: TObject);
begin
  frmPBMainMenu.tmrCheckActivity.enabled := false;
  dtmdlActivityReminder := TdtmdlActivity.Create(self);
  dtmdlActivityReminder.dtsActivityReminder.OnDataChange := SetButtons;
  CCSCommon.SetDBGridCols('', 'ActivityReminderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintActivityReminderFrm.FormDestroy(Sender: TObject);
begin
  dtmdlActivityReminder.Free;
  frmPBMainMenu.tmrCheckActivity.enabled := true;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'ActivityReminderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TPBMaintActivityReminderFrm.SetButtons(Sender: TObject;
  Field: TField);
begin
  with dtmdlActivityReminder do
  begin
    btnCompleteAll.enabled := ReminderCount > 0;
    btnComplete.enabled := ReminderCount > 0;
    btnOpen.enabled := ReminderCount > 0;
    stsBrDetails.panels[0].text := inttostr(ReminderCount) + ' records displayed';
  end;
end;

procedure TPBMaintActivityReminderFrm.CallActivityMaintScreen(aMode : TactMode);
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

  aActivity := TActivity.Create(dtmdlActivityReminder);
  try
    aActivity.DbKey := key;
    aActivity.LoadFromDB;
    Frm := TPBMaintActivityFrm.Create(Self);
    try
     if aMode = actAdd then
      begin
        aActivity.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Customer_Name').asstring;
        aActivity.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
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
      dtmdlActivityReminder.RefreshReminders;

      if aMode <> actDelete then
        dbgDetails.datasource.DataSet.Locate('Activity', Variant(inttostr(Key)),[lopartialKey]);
    end;
end;

procedure TPBMaintActivityReminderFrm.btnOpenClick(Sender: TObject);
begin
  CallActivityMaintScreen(actChange);
end;

procedure TPBMaintActivityReminderFrm.dbgDetailsDblClick(Sender: TObject);
begin
  btnOpenClick(self)
end;

procedure TPBMaintActivityReminderFrm.btnCompleteClick(Sender: TObject);
var
  aActivity: TActivity;
  key: integer;
begin
  if MessageDlg('Do you want to set this activity to complete?', mtConfirmation,
              [mbOk,mbCancel], 0) = mrOK then
    begin

      key := dbgDetails.Datasource.dataset.fieldbyname('Activity').asinteger;

      aActivity := TActivity.Create(dtmdlActivityReminder);
      try
        aActivity.DbKey := key;
        aActivity.LoadFromDB;
        aActivity.Status := 30;
        aActivity.SaveToDB(true);

        dtmdlActivityReminder.RefreshReminders;

        dbgDetails.datasource.DataSet.Locate('Activity', Variant(inttostr(Key)),[lopartialKey]);
      finally
        aActivity.Free;
      end;
    end;
end;

procedure TPBMaintActivityReminderFrm.btnCompleteAllClick(Sender: TObject);
var
  aActivity: TActivity;
  iCount: integer;
  key: integer;
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

  if MessageDlg('Do you want to set all activities to complete?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
        begin
          dbgDetails.datasource.DataSet.GotoBookmark(Pointer(dbgDetails.SelectedRows[iCount])) ;

          aActivity := TActivity.Create(dtmdlActivityReminder);
          try
            aActivity.DbKey := key;
            aActivity.LoadFromDB;
            aActivity.Status := 30;
            aActivity.SaveToDB(true);

            dtmdlActivityReminder.RefreshReminders;

            dbgDetails.datasource.DataSet.Locate('Activity', Variant(inttostr(Key)),[lopartialKey]);
          finally
            aActivity.Free;
          end;
        end;
    end;
end;

procedure TPBMaintActivityReminderFrm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintActivityReminderFrm.dbgDetailsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('Activity_Status').asinteger = 30) then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Due_Date_Time').Asdatetime = date) and
      (dbgDetails.datasource.dataset.fieldByName('Activity_Status').asinteger < 30) then
      begin
          (Sender as TDBGrid).Canvas.font.color := clWhite;
          (Sender as TDBGrid).Canvas.Brush.color := clGreen;
      end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Due_Date_Time').Asdatetime < now) and
      (dbgDetails.datasource.dataset.fieldByName('Activity_Status').asinteger < 30) then
      (Sender as TDBGrid).Canvas.Font.Color := clRed ;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);

end;

procedure TPBMaintActivityReminderFrm.Button2Click(Sender: TObject);
begin
  frmpbMainMenu.btnActivitiesClick(self);
  close;
end;

end.
