unit wtLUProspectAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUProspectAction = class(TForm)
    dbgDetails: TDBGrid;
    srcAction: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryAction: TFDQuery;
    qryDelete: TFDQuery;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure srcActionDataChange(Sender: TObject; Field: TField);
    procedure btnExcelClick(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUProspectAction: TfrmWTLUProspectAction;

implementation

uses UITypes, wtMaintProspectAction, wtMain;

{$R *.dfm}

procedure TfrmWTLUProspectAction.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Prospect_Action').asinteger;
  try
    frmWTMaintProspectAction := TfrmWTMaintProspectAction.create(Application);
    frmWTMaintProspectAction.FunctionMode := FuncMode;
    frmWTMaintProspectAction.showmodal;
    iCode := frmWTMaintProspectAction.iCode;
    refresh;
    qryAction.Locate('Prospect_Action',Variant(inttostr(iCode)),[]);

  finally
    Screen.Cursor := OldCursor;
    frmWTMaintProspectAction.free;
  end;
end;

procedure TfrmWTLUProspectAction.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUProspectAction.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUProspectAction.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Prospect_Action WHERE Prospect_Action = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Prospect_Action').asinteger);
            execsql;
          end;
        refresh;
      except messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Prospect_Action_Description').asstring + ' has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUProspectAction.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUProspectAction.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');

end;

procedure TfrmWTLUProspectAction.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUProspectAction.srcActionDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcAction.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcAction.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcAction.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUProspectAction.Refresh;
begin
  qryAction.close;
  qryAction.open;
  stsbrDetails.panels[0].text := inttostr(qryAction.recordcount) + ' records displayed';
end;

procedure TfrmWTLUProspectAction.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUProspectAction);
end;

end.
