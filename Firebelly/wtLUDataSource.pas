unit wtLUDataSource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, gtQrCtrls,
  ExtCtrls, ComCtrls;

type
  TfrmWTLUDataSource = class(TForm)
    dbgDetails: TDBGrid;
    srcDataSource: TDataSource;
    qryDataSource: TQuery;
    qryDelete: TQuery;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUDataSource: TfrmWTLUDataSource;

implementation

uses wtMaintDataSource;

{$R *.dfm}

procedure TfrmWTLUDataSource.Refresh;
begin
  qryDataSource.close;
  if not chkbxShowInactive.Checked then
    begin
      qryDataSource.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryDataSource.parambyname('inactive').asstring := 'Y';
    end;

  qryDataSource.open;
  stsbrDetails.panels[0].text := inttostr(qryDataSource.recordcount) + ' records displayed';
end;


procedure TfrmWTLUDataSource.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Data_Source').asinteger;
  try
    frmWTMaintDataSource := TfrmWTMaintDataSource.create(Application);
    frmWTMaintDataSource.FunctionMode := FuncMode;
    frmWTMaintDataSource.showmodal;
    iCode := frmWTMaintDataSource.iCode;
    refresh;
    qryDataSource.Locate('Data_Source',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintDataSource.free;
  end;
end;

procedure TfrmWTLUDataSource.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUDataSource.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUDataSource.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Data_Source WHERE Data_Source = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Data_Source').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Data_Source_Title').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUDataSource.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUDataSource.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');

end;

procedure TfrmWTLUDataSource.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUDataSource.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcDataSource.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcDataSource.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUDataSource.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUDataSource.dbgDetailsDrawColumnCell(Sender: TObject;
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

end.
