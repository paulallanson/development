unit wtLUEdgeTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUEdgeTypes = class(TForm)
    dbgDetails: TDBGrid;
    srcEdgeType: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btndelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryEdgeType: TFDQuery;
    qryDelete: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btndeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure srcEdgeTypeDataChange(Sender: TObject; Field: TField);
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
  frmWTLUEdgeTypes: TfrmWTLUEdgeTypes;

implementation

uses wtMaintEdgeType, wtMain;

{$R *.dfm}

procedure TfrmWTLUEdgeTypes.FormCreate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUEdgeTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWTLUEdgeTypes.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Edge_Type').asinteger;
  try
    frmWTMaintEdgeType := TfrmWTMaintEdgeType.create(Application);
    frmWTMaintEdgeType.FunctionMode := FuncMode;
    frmWTMaintEdgeType.showmodal;
    iCode := frmWTMaintEdgeType.iCode;
    refresh;
    qryEdgeType.Locate('Edge_Type',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintEdgeType.free;
  end;
end;
procedure TfrmWTLUEdgeTypes.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUEdgeTypes.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUEdgeTypes.btndeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Edge_Type WHERE Edge_Type = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Edge_Type').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Edge_Type_Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUEdgeTypes.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUEdgeTypes.srcEdgeTypeDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.Enabled := (srcEdgeType.DataSet.RecordCount > 0);
  btnDelete.Enabled := (srcEdgeType.DataSet.RecordCount > 0);
  btnExcel.Enabled := (srcEdgeType.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUEdgeTypes.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUEdgeTypes.Refresh;
begin
  qryEdgeType.close;
  if not chkbxShowInactive.Checked then
    begin
      qryEdgeType.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryEdgeType.parambyname('inactive').asstring := 'Y';
    end;

  qryEdgeType.open;
  stsbrDetails.panels[0].text := inttostr(qryEdgeType.recordcount) + ' records displayed';
end;

procedure TfrmWTLUEdgeTypes.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUEdgeTypes.btnExcelClick(Sender: TObject);
begin
//  frmWTMain.ExportTableToExcel(frmWTLUEdgeTypes);
  frmWTMain.ExportToExcel(frmWTLUEdgeTypes);
end;

end.
