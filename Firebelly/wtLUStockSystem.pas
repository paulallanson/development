unit wtLUStockSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, QrCtrls,
  ExtCtrls, ComCtrls, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmWTLUStockSystem = class(TForm)
    dbgDetails: TDBGrid;
    srcStockSystem: TDataSource;
    qryStockSystem: TFDQuery;
    qryDelete: TFDQuery;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
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
    procedure srcStockSystemDataChange(Sender: TObject; Field: TField);
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
  frmWTLUStockSystem: TfrmWTLUStockSystem;

implementation

uses wtMaintStockSystem;

{$R *.dfm}

procedure TfrmWTLUStockSystem.Refresh;
begin
  qryStockSystem.close;
  qryStockSystem.open;
  stsbrDetails.panels[0].text := inttostr(qryStockSystem.recordcount) + ' records displayed';
end;


procedure TfrmWTLUStockSystem.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  sCode: string;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  sCode := dbgDetails.datasource.dataset.fieldbyname('Stock_System').asstring;
  try
    frmWTMaintStockSystem := TfrmWTMaintStockSystem.create(Application);
    frmWTMaintStockSystem.FunctionMode := FuncMode;
    frmWTMaintStockSystem.showmodal;
    sCode := frmWTMaintStockSystem.sCode;
    refresh;
    qryStockSystem.Locate('Stock_System',Variant(sCode),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintStockSystem.free;
  end;
end;

procedure TfrmWTLUStockSystem.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUStockSystem.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUStockSystem.btnDeleteClick(Sender: TObject);
var
  sData: string;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            sData := dbgDetails.DataSource.dataset.fieldbyname('Stock_System').asstring;
            close;
            SQL.Text := 'DELETE FROM Stock_System WHERE Stock_System = ' + '''' + dbgDetails.DataSource.dataset.fieldbyname('Stock_System').asstring + '''';
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Stock_System_Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUStockSystem.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUStockSystem.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');

end;

procedure TfrmWTLUStockSystem.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUStockSystem.srcStockSystemDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcStockSystem.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcStockSystem.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUStockSystem.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUStockSystem.dbgDetailsDrawColumnCell(Sender: TObject;
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

end.
