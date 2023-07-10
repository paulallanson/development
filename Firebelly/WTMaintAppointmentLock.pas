unit WTMaintAppointmentLock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TfrmWTMaintAppointmentLock = class(TForm)
    Panel1: TPanel;
    dbgDetails: TDBGrid;
    qryApptStatus: TQuery;
    dtsApptStatus: TDataSource;
    btnUnlock: TButton;
    btnRefresh: TButton;
    btnClose: TButton;
    qryDeleteApptStatus: TQuery;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnUnlockClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure RefreshData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTMaintAppointmentLock: TfrmWTMaintAppointmentLock;

implementation

uses wtMain, AllCommon, wtDataModule;

{$R *.dfm}

procedure TfrmWTMaintAppointmentLock.btnRefreshClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmWTMaintAppointmentLock.RefreshData;
begin
  with qryApptStatus do
    begin
      close;
      open;
    end;
end;

procedure TfrmWTMaintAppointmentLock.FormActivate(Sender: TObject);
begin
  RefreshData;
//  dtmdlWorktops.ScreenAccessControl(Self,'',frmWTMain.iOperator,0,0) ;
end;

procedure TfrmWTMaintAppointmentLock.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTMaintAppointmentLock.btnUnlockClick(Sender: TObject);
var
  id, iLockNo: integer;
begin
  if MessageDlg('WARNING: Removing record locks could affect the integrity of the schedule module data. ' + #13 +
                'Would you like to continue and remove the selected appointment record?', mtWarning,
    [mbYes, mbNo], 0) = mrYes then
    begin
      id := dbgDetails.DataSource.DataSet.fieldbyname('id').asinteger;

      with qryDeleteApptStatus do
        begin
          close;
          parambyname('id').asinteger := id;
          execsql
        end;
      RefreshData;
    end;
end;

procedure TfrmWTMaintAppointmentLock.FormCreate(Sender: TObject);
begin
  AllCommon.LoadFormLayout(frmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintAppointmentLock.FormDestroy(Sender: TObject);
begin
  AllCommon.SaveFormLayout(frmWTMain.AppIniFile, self);
end;

end.
