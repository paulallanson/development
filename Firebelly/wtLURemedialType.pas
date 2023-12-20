unit WTLURemedialType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLURemedialType = class(TForm)
    dbgDetails: TDBGrid;
    srcRemedialType: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    qryRemedialType: TFDQuery;
    qryDelete: TFDQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure srcRemedialTypeDataChange(Sender: TObject; Field: TField);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLURemedialType: TfrmWTLURemedialType;

implementation

uses
  System.UITypes, System.Types,
  WTMaintRemedialType, wtMain;

{$R *.dfm}

procedure TfrmWTLURemedialType.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Remedial_Type').asinteger;
  try
    frmWTMaintRemedialType := TfrmWTMaintRemedialType.create(Application);
    frmWTMaintRemedialType.FunctionMode := FuncMode;
    frmWTMaintRemedialType.showmodal;
    iCode := frmWTMaintRemedialType.iCode;
    refresh;
    qryRemedialType.Locate('Remedial_Type',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintRemedialType.free;
  end;
end;

procedure TfrmWTLURemedialType.Refresh;
begin
  qryRemedialType.close;
  qryRemedialType.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryRemedialType.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryRemedialType.parambyname('inactive').asstring := 'Y';
    end;

  qryRemedialType.open;
  stsbrDetails.panels[0].text := inttostr(qryRemedialType.recordcount) + ' records displayed';
end;

procedure TfrmWTLURemedialType.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLURemedialType.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLURemedialType.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Remedial_Type WHERE Remedial_Type = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Remedial_Type').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Remedial_Type_Descr').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLURemedialType.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLURemedialType.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLURemedialType.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmWTLURemedialType.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLURemedialType.srcRemedialTypeDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcRemedialType.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcRemedialType.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcRemedialType.DataSet.RecordCount > 0);
end;

procedure TfrmWTLURemedialType.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLURemedialType.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmWTLURemedialType.btnExcelClick(Sender: TObject);
begin
//  frmWTMain.ExportTableToExcel(frmWTLURemedial_Type);
  frmWTMain.ExportToExcel(frmWTLURemedialType);
end;

procedure TfrmWTLURemedialType.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLURemedialType.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.
