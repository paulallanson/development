unit wtLULevelofImportance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, ExtCtrls, ComCtrls;

type
  TfrmwtLULevelofImportance = class(TForm)
    dbgDetails: TDBGrid;
    srcLevelOfImportance: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    qryLevelofImportance: TQuery;
    qryDelete: TQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure DeleteFromDB(keyID: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwtLULevelofImportance: TfrmwtLULevelofImportance;

implementation

uses wtMain, wtMaintLevelofImportance;

{$R *.dfm}

procedure TfrmwtLULevelofImportance.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmwtLULevelofImportance.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  if FuncMode = 'A' then
    iCode := 0
  else
    iCode := dbgDetails.datasource.dataset.fieldbyname('Level_of_Importance').asinteger;

  try
    frmWTMaintLevelOfImportance := TfrmWTMaintLevelOfImportance.create(Application);
    frmWTMaintLevelOfImportance.FunctionMode := FuncMode;
    frmWTMaintLevelOfImportance.showmodal;
    iCode := frmWTMaintLevelOfImportance.iCode;
    Refresh;
    qryLevelofImportance.Locate('Level_of_Importance',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintLevelOfImportance.free;
  end;
end;

procedure TfrmwtLULevelofImportance.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmwtLULevelofImportance.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Level_of_Importance WHERE Level_of_Importance = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Level_of_Importance').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Importance_Description').asstring
                    + ' level of importance has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmwtLULevelofImportance.DeleteFromDB(keyID: integer);
begin
end;

procedure TfrmwtLULevelofImportance.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLULevelofImportance.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmwtLULevelofImportance.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLULevelofImportance.Refresh;
begin
  qryLevelofImportance.close;
  if not chkbxShowInactive.Checked then
    begin
      qryLevelofImportance.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryLevelofImportance.parambyname('inactive').asstring := 'Y';
    end;

  qryLevelofImportance.open;
  stsbrDetails.panels[0].text := inttostr(qryLevelofImportance.recordcount) + ' records displayed';
end;

procedure TfrmwtLULevelofImportance.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLULevelofImportance.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
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

procedure TfrmwtLULevelofImportance.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportTableToExcel(frmWTLULevelofImportance);
end;

end.
