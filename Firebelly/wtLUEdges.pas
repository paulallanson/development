unit wtLUEdges;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBTables, DB, gtQrCtrls,
  ExtCtrls, ComCtrls;

type
  TfrmwtLUEdges = class(TForm)
    dbgDetails: TDBGrid;
    srcEdges: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    chkbxShowOnline: TCheckBox;
    qryEdgeProfile: TQuery;
    qryDelete: TQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    procedure BitBtn4Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
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
  frmwtLUEdges: TfrmwtLUEdges;

implementation

uses  WTMaintEdges, wtMain;

{$R *.dfm}

procedure TfrmwtLUEdges.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUEdges.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Edge_Profile').asinteger;
  try
    frmWTMaintEdges := TfrmWTMaintEdges.create(Application);
    frmWTMaintEdges.FunctionMode := FuncMode;
    frmWTMaintEdges.showmodal ;
    iCode := frmWTMaintEdges.iCode;
    refresh;
    qryEdgeProfile.Locate('Edge_Profile',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintEdges.free;
  end;
end;

procedure TfrmwtLUEdges.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Edge_Profile WHERE Edge_Profile = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Edge_Profile').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmwtLUEdges.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmwtLUEdges.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmwtLUEdges.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmwtLUEdges.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUEdges.Refresh;
begin
  qryEdgeProfile.close;
  qryEdgeProfile.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryEdgeProfile.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryEdgeProfile.parambyname('inactive').asstring := 'Y';
    end;
(*  if not chkbxShowOnline.Checked then
    begin
      qryEdgeProfile.parambyname('Show_Online').asstring := 'N';
    end
  else
    begin
      qryEdgeProfile.parambyname('Show_Online').asstring := 'Y';
    end;
*)
  qryEdgeProfile.open;
  stsbrDetails.panels[0].text := inttostr(qryEdgeProfile.recordcount) + ' records displayed';
end;

procedure TfrmwtLUEdges.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(dbgDetails.datasource.dataset.fieldByName('Show_Online').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.brush.color := clGreen;
      (Sender as TDBGrid).Canvas.font.color := clWhite;
    end;

  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmwtLUEdges.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmwtLUEdges.btnExcelClick(Sender: TObject);
begin
//  frmWTMain.ExportTableToExcel(frmwtLUEdges);
  frmWTMain.ExportToExcel(frmwtLUEdges);
end;

procedure TfrmwtLUEdges.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;

end;

procedure TfrmwtLUEdges.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.
