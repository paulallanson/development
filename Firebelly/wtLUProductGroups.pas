unit wtLUProductGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBTables, DB, gtQrCtrls,
  ExtCtrls, ComCtrls;

type
  TfrmWTLUProductGroups = class(TForm)
    dbgDetails: TDBGrid;
    srcDetails: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnExcel: TBitBtn;
    BitBtn4: TBitBtn;
    qryProductGroup: TQuery;
    qryDelete: TQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
    CodeSelected: integer;
  end;

var
  frmWTLUProductGroups: TfrmWTLUProductGroups;

implementation

uses wtMaintProductGroup, wtMain;

{$R *.dfm}

procedure TfrmWTLUProductGroups.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUProductGroups.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');

end;

procedure TfrmWTLUProductGroups.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Product_Group').asinteger;
  try
    frmWTMaintProductGroup := TfrmWTMaintProductGroup.create(Application);
    frmWTMaintProductGroup.FunctionMode := FuncMode;
    frmWTMaintProductGroup.showmodal;
    iCode := frmWTMaintProductGroup.iCode;
    refresh;
    qryProductGroup.Locate('Product_Group',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintProductGroup.free;
  end;
end;

procedure TfrmWTLUProductGroups.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Product_Group WHERE Product_Group = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Product_Group').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Product_Group_Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUProductGroups.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUProductGroups.SetButtons(Sender: TObject; Field: TField);
begin
  with srcDetails.dataset do
  begin
    btnEdit.Enabled := recordCount > 0;
    btnDelete.Enabled := recordCount > 0;
    btnExcel.Enabled := recordcount > 0;
  end;
end;

procedure TfrmWTLUProductGroups.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUProductGroups.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUProductGroups.Refresh;
begin
  qryProductGroup.close;
  if not chkbxShowInactive.Checked then
    begin
      qryProductGroup.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryProductGroup.parambyname('inactive').asstring := 'Y';
    end;

  qryProductGroup.open;
  stsbrDetails.panels[0].text := inttostr(qryProductGroup.recordcount) + ' records displayed';
end;

procedure TfrmWTLUProductGroups.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUProductGroups.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUProductGroups);
end;

end.
