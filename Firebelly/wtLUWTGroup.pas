unit wtLUWTGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, DBCtrls, QrCtrls,
  ExtCtrls, ComCtrls;

type
  TfrmWTLUWTGroup = class(TForm)
    dbgDetails: TDBGrid;
    srcWTGroup: TDataSource;
    lkpMatType: TQuery;
    srclkpMatType: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    btnLUMatType: TBitBtn;
    qryWTGroup: TQuery;
    qryDelete: TQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure srcWTGroupDataChange(Sender: TObject; Field: TField);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnLUMatTypeClick(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUWTGroup: TfrmWTLUWTGroup;

implementation

uses
  WTMaintWTGroup, wtDataModule, wtMain, wtLUMatType, System.UITypes;

{$R *.dfm}

procedure TfrmWTLUWTGroup.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Worktop_Group').asinteger;
  try
    frmWTMaintWTGroup := TfrmWTMaintWTGroup.create(Application);
    frmWTMaintWTGroup.FunctionMode := FuncMode;
    frmWTMaintWTGroup.showmodal;
    iCode := frmWTMaintWTGroup.iCode;
    refresh;
    qryWTGroup.Locate('Worktop_Group',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintWTGroup.free;
  end;
end;

procedure TfrmWTLUWTGroup.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUWTGroup.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');

end;

procedure TfrmWTLUWTGroup.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Worktop_Group WHERE Worktop_Group = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Worktop_Group').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Worktop_Group_Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUWTGroup.FormActivate(Sender: TObject);
begin
  lkpMatType.Close;
  lkpMatType.Open;

  dblkpMaterialType.keyvalue :=1;

  dblkpMaterialTypeClick(Self);
end;

procedure TfrmWTLUWTGroup.srcWTGroupDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.Enabled := ((Sender as TDatasource).DataSet.RecordCount > 0);
  btnDelete.Enabled := ((Sender as TDatasource).DataSet.RecordCount > 0);
  btnExcel.Enabled := ((Sender as TDatasource).DataSet.RecordCount > 0);
end;

procedure TfrmWTLUWTGroup.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUWTGroup.Refresh;
begin
  qryWTGroup.close;
  qryWTGroup.parambyname('Material_Type').asstring := dblkpMaterialType.keyvalue;
  if not chkbxShowInactive.Checked then
    begin
      qryWTGroup.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryWTGroup.parambyname('inactive').asstring := 'Y';
    end;

  qryWTGroup.open;
  stsbrDetails.panels[0].text := inttostr(qryWTGroup.recordcount) + ' records displayed';
end;

procedure TfrmWTLUWTGroup.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;
  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWTLUWTGroup.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUWTGroup.dblkpMaterialTypeClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUWTGroup.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUWTGroup);
end;

procedure TfrmWTLUWTGroup.btnLUMatTypeClick(Sender: TObject);
begin
  frmWTLUMatType := TfrmWTLUMatType.create(self);
  try
    frmWTLUMatType.showmodal;
  finally
    frmWTLUMatType.free;
  end;

  lkpMatType.Close;
  lkpMatType.Open;
end;

end.
