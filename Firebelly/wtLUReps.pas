unit wtLUReps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUReps = class(TForm)
    dbgDetails: TDBGrid;
    srcReps: TDataSource;
    stsbrdetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    qryReps: TFDQuery;
    qryDelete: TFDQuery;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure srcRepsDataChange(Sender: TObject; Field: TField);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUReps: TfrmWTLUReps;

implementation

uses UITypes, wtMaintReps, wtMain;

{$R *.dfm}

procedure TfrmWTLUReps.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintReps := TfrmWTMaintReps.create(Application);
    frmWTMaintReps.FunctionMode := FuncMode;
    frmWTMaintReps.showmodal;
    iCode := frmWTMaintReps.iCode;
    refresh;
    qryReps.Locate('Rep',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintReps.free;
  end;
end;

procedure TfrmWTLUReps.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUReps.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUReps.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmWTLUReps.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Rep WHERE Rep = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Rep').asinteger);
            execsql;
          end;
        refresh;
      except messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Rep_Name').asstring + ' has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUReps.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUReps.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');

end;

procedure TfrmWTLUReps.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUReps.srcRepsDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcReps.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcReps.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcReps.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUReps.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmWTLUReps.Refresh;
begin
  qryReps.close;
  if not chkbxShowInactive.Checked then
    begin
      qryReps.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryReps.parambyname('inactive').asstring := 'Y';
    end;

  qryReps.open;
  stsbrDetails.panels[0].text := inttostr(qryReps.recordcount) + ' records displayed';
end;

procedure TfrmWTLUReps.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUReps.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUReps);
end;

end.
