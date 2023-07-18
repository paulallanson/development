unit WTLUDesigner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, ComCtrls;

type
  TfrmWTLUDesigner = class(TForm)
    dbgDetails: TDBGrid;
    srcDesigner: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    qryDesigner: TQuery;
    qryDelete: TQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure srcDesignerDataChange(Sender: TObject; Field: TField);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
  frmWTLUDesigner: TfrmWTLUDesigner;

implementation

uses UITypes, WTMaintDesigner, wtMain;

{$R *.dfm}

procedure TfrmWTLUDesigner.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Designer').asinteger;
  try
    frmWTMaintDesigner := TfrmWTMaintDesigner.create(Application);
    frmWTMaintDesigner.FunctionMode := FuncMode;
    frmWTMaintDesigner.showmodal;
    iCode := frmWTMaintDesigner.iCode;
    refresh;
    qryDesigner.Locate('Designer',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintDesigner.free;
  end;
end;

procedure TfrmWTLUDesigner.Refresh;
begin
  qryDesigner.close;
  qryDesigner.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryDesigner.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryDesigner.parambyname('inactive').asstring := 'Y';
    end;

  qryDesigner.open;
  stsbrDetails.panels[0].text := inttostr(qryDesigner.recordcount) + ' records displayed';
end;

procedure TfrmWTLUDesigner.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUDesigner.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUDesigner.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Designer WHERE Designer = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Designer').asinteger);
            execsql;
          end;
        refresh;
      except messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Designer_Name').asstring + ' has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUDesigner.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUDesigner.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUDesigner.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUDesigner.srcDesignerDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcDesigner.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcDesigner.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcDesigner.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUDesigner.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUDesigner.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUDesigner.btnExcelClick(Sender: TObject);
begin
//  frmWTMain.ExportTableToExcel(frmWTLUDesigner);
  frmWTMain.ExportToExcel(frmWTLUDesigner);
end;

procedure TfrmWTLUDesigner.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUDesigner.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.
