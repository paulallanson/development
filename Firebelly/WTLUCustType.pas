unit WTLUCustType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids;

type
  TfrmWTLUCustType = class(TForm)
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    stsbrDetails: TStatusBar;
    dtsCustTypes: TDataSource;
    qryCustTypes: TQuery;
    qryDelete: TQuery;
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUCustType: TfrmWTLUCustType;

implementation

uses wtMaintCustTypes, wtMain;

{$R *.dfm}

procedure TfrmWTLUCustType.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Customer_Type').asinteger;
  try
    frmWTMaintCustTypes := TfrmWTMaintCustTypes.create(Application);
    frmWTMaintCustTypes.FunctionMode := FuncMode;
    frmWTMaintCustTypes.showmodal;
    iCode := frmWTMaintCustTypes.iCode;
    refresh;
    qryCustTypes.Locate('Customer_Type',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCustTypes.free;
  end;
end;

procedure TfrmWTLUCustType.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Customer_Type WHERE Customer_Type = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Customer_Type').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Description').asstring
                    + ' customer type has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUCustType.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUCustType.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;

end;

procedure TfrmWTLUCustType.Refresh;
begin
  qryCustTypes.close;
  if not chkbxShowInactive.Checked then
    begin
      qryCustTypes.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryCustTypes.parambyname('inactive').asstring := 'Y';
    end;

  qryCustTypes.open;
  stsbrDetails.panels[0].text := inttostr(qryCustTypes.recordcount) + ' records displayed';
end;

procedure TfrmWTLUCustType.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUCustType.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUCustType.btnExcelClick(Sender: TObject);
begin
//  frmWTMain.ExportTableToExcel(frmWTLUCustType);
  frmWTMain.ExportToExcel(frmWTLUCustType);
end;

procedure TfrmWTLUCustType.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUCustType.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

end.
