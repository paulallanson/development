unit PBWorkstationLock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBWorkstationLockFrm = class(TForm)
    Panel1: TPanel;
    dbgDetails: TDBGrid;
    qryWorkstationLock: TFDQuery;
    dtsWorkstationLock: TDataSource;
    btnUnlock: TButton;
    btnRefresh: TButton;
    btnClose: TButton;
    qryDeleteWSL: TFDQuery;
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
  PBWorkstationLockFrm: TPBWorkstationLockFrm;

implementation

uses
  System.UITypes,
  pbMainMenu, CCSCommon, pbDatabase;

{$R *.dfm}

procedure TPBWorkstationLockFrm.btnRefreshClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TPBWorkstationLockFrm.RefreshData;
begin
  with qryWorkstationLock do
    begin
      close;
      open;
    end;
end;

procedure TPBWorkstationLockFrm.FormActivate(Sender: TObject);
begin
  RefreshData;
  dmBroker.ScreenAccessControl(Self,'',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBWorkstationLockFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPBWorkstationLockFrm.btnUnlockClick(Sender: TObject);
var
  iWorkstation, iLockNo: integer;
begin
  if MessageDlg('WARNING: Removing record locks could affect the integrity of the associated module data. ' + #13 +
                'Would you like to continue and remove the selected workstation record?', mtWarning,
    [mbYes, mbNo], 0) = mrYes then
    begin
      iWorkstation := dbgDetails.DataSource.DataSet.fieldbyname('Workstation').asinteger;
      iLockNo := dbgDetails.DataSource.DataSet.fieldbyname('Lock_No').asinteger;

      with qryDeleteWSL do
        begin
          close;
          parambyname('Workstation').asinteger := iWorkstation;
          parambyname('Lock_no').asinteger := iLockNo;
          execsql
        end;
      RefreshData;
    end;
end;

procedure TPBWorkstationLockFrm.FormCreate(Sender: TObject);
begin
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBWorkstationLockFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

end.
