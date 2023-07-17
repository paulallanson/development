unit wtLUReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, QrCtrls,
  ComCtrls, ExtCtrls;

type
  TfrmWTLUReason = class(TForm)
    dbgDetails: TDBGrid;
    srcReason: TDataSource;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    stsbrDetails: TStatusBar;
    btnExcel: TBitBtn;
    qryReason: TQuery;
    qryDelete: TQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure srcReasonDataChange(Sender: TObject; Field: TField);
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
  frmWTLUReason: TfrmWTLUReason;

implementation

uses WTMaintReason, wtMain;

{$R *.dfm}

procedure TfrmWTLUReason.Refresh;
begin
  qryReason.close;
  qryReason.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  qryReason.open;
  stsbrDetails.panels[0].text := inttostr(qryReason.recordcount) + ' records displayed';
end;


procedure TfrmWTLUReason.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Inactive_Reason').asinteger;
  try
    frmWTMaintReason := TfrmWTMaintReason.create(Application);
    frmWTMaintReason.FunctionMode := FuncMode;
    frmWTMaintReason.showmodal;
    iCode := frmWTMaintReason.iCode;
    refresh;
    qryReason.Locate('Inactive_Reason',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintReason.free;
  end;
end;

procedure TfrmWTLUReason.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUReason.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUReason.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Inactive_Reason WHERE Inactive_Reason = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Inactive_Reason').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Inactive_Reason_Descr').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUReason.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUReason.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUReason.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUReason.srcReasonDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcReason.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcReason.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcReason.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUReason.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUReason.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWTLUReason.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUReason);
end;

procedure TfrmWTLUReason.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUReason.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.
