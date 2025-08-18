unit wtLUOperators;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUOperators = class(TForm)
    dbgDetails: TDBGrid;
    srcOperators: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryOperators: TFDQuery;
    qryDelete: TFDQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    procedure BitBtn4Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure srcOperatorsDataChange(Sender: TObject; Field: TField);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUOperators: TfrmWTLUOperators;

implementation

uses UITypes, WTMaintOperators, wtMain;

{$R *.dfm}

procedure TfrmWTLUOperators.Refresh;
begin
  qryOperators.close;
  qryOperators.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryOperators.parambyname('Operator_Can_Login').asstring := 'Y';
    end
  else
    begin
      qryOperators.parambyname('Operator_Can_Login').asstring := 'N';
    end;

  qryOperators.open;
  stsbrDetails.panels[0].text := inttostr(qryOperators.recordcount) + ' records displayed';
end;

procedure TfrmWTLUOperators.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Operator').asinteger;
  try
    frmWTMaintOperators := TfrmWTMaintOperators.create(Application);
    frmWTMaintOperators.FunctionMode := FuncMode;
    frmWTMaintOperators.showmodal;
    iCode := frmWTMaintOperators.iCode;
    refresh;
    qryOperators.Locate('Operator',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintOperators.free;
  end;
end;

procedure TfrmWTLUOperators.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUOperators.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Operator WHERE Operator = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Operator').asinteger);
            execsql;
          end;
        refresh;
      except messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Operator_Name').asstring + ' has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUOperators.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUOperators.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');

end;

procedure TfrmWTLUOperators.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');

end;

procedure TfrmWTLUOperators.srcOperatorsDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.enabled := (srcOperators.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcOperators.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcOperators.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUOperators.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUOperators.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('Operator_Can_Login').AsString = 'N') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmWTLUOperators.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTLUOperators.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUOperators.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUOperators.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmWTLUOperators.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUOperators);
end;

end.
