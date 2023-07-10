unit wtLUFitters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, gtQrCtrls,
  ExtCtrls, ComCtrls;

type
  TfrmWTLUFitters = class(TForm)
    dbgDetails: TDBGrid;
    srcFitters: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnExcel: TBitBtn;
    BitBtn4: TBitBtn;
    qryFitters: TQuery;
    qryDelete: TQuery;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure srcFittersDataChange(Sender: TObject; Field: TField);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUFitters: TfrmWTLUFitters;

implementation

uses wtMaintFitters, wtMain;

{$R *.dfm}

procedure TfrmWTLUFitters.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Fitter').asinteger;
  try
    frmWTMaintFitters := TfrmWTMaintFitters.create(Application);
    frmWTMaintFitters.FunctionMode := FuncMode;
    frmWTMaintFitters.showmodal;
    iCode := frmWTMaintFitters.iCode;
    refresh;
    qryFitters.Locate('Fitter',Variant(inttostr(iCode)),[]);

  finally
    Screen.Cursor := OldCursor;
    frmWTMaintFitters.free;
  end;
end;

procedure TfrmWTLUFitters.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUFitters.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUFitters.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Fitter WHERE Fitter = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Fitter').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Fitter_Name').asstring
                    + ' fitter has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUFitters.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUFitters.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');

end;

procedure TfrmWTLUFitters.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUFitters.srcFittersDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcFitters.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcFitters.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcFitters.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUFitters.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUFitters.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUFitters.Refresh;
begin
  qryFitters.close;
  if not chkbxShowInactive.Checked then
    begin
      qryFitters.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryFitters.parambyname('inactive').asstring := 'Y';
    end;

  qryFitters.open;
  stsbrDetails.panels[0].text := inttostr(qryFitters.recordcount) + ' records displayed';
end;

procedure TfrmWTLUFitters.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUFitters);
end;

end.
