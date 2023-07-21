unit WTMaintLogins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintLogins = class(TForm)
    Panel1: TPanel;
    btnDelete: TButton;
    btnRefresh: TButton;
    btnClose: TButton;
    dbgDetails: TDBGrid;
    qryWorkstation: TFDQuery;
    dtsWorkstation: TDataSource;
    qryDeleteWS: TFDQuery;
    stsbrDetails: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    SortField: string;
    SortOrder: string;
    SortType: string;
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  frmWTMaintLogins: TfrmWTMaintLogins;

implementation

uses wtDataModule, wtMain, AllCommon;

{$R *.dfm}

procedure TfrmWTMaintLogins.RefreshData;
begin
  with qryWorkstation do
    begin
      close;

      SQL.Delete(pred(SQL.count));

      if SortOrder = '' then
        SQL.Add(' ORDER BY Workstation.Workstation ASC')
      else
        SQL.Add(' ORDER BY ' + SortOrder);
      open;
      stsbrDetails.Panels[0].text := inttostr(recordcount) + ' records displayed';
    end;
end;

procedure TfrmWTMaintLogins.FormActivate(Sender: TObject);
begin
  RefreshData;
//  btnDelete.Visible := (frmWTMain.OperatorName = 'firebelly') or (frmWTMain.OperatorName = 'Firebelly');
end;

procedure TfrmWTMaintLogins.btnRefreshClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmWTMaintLogins.btnDeleteClick(Sender: TObject);
var
  iWorkstation: integer;
begin
  if MessageDlg('WARNING: Removing login records can affect the integrity of the system ' + #13 +
                'Would you like to continue and remove the selected user record?', mtWarning,
    [mbYes, mbNo], 0) = mrYes then
    begin
      iWorkstation := dbgDetails.DataSource.DataSet.fieldbyname('Workstation').asinteger;

      with qryDeleteWS do
        begin
          close;
          parambyname('Workstation').asinteger := iWorkstation;
          execsql
        end;
      RefreshData;
    end;
end;

procedure TfrmWTMaintLogins.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  SortOrder := SortField + SortType;
  RefreshData;
end;

procedure TfrmWTMaintLogins.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTMaintLogins.FormCreate(Sender: TObject);
begin
  AllCommon.LoadFormLayout(frmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintLogins.FormDestroy(Sender: TObject);
var
  fileName: string;
begin
  if Pos('\', frmwtMain.AppIniFile) > 0 then
    fileName := frmwtMain.AppIniFile else
    fileName := ExtractFilePath(Application.ExeName) + frmwtMain.AppIniFile;
  AllCommon.SaveFormLayout(frmWTMain.AppIniFile, self);
end;

end.
