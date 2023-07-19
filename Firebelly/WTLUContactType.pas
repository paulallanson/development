unit WTLUContactType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUContactType = class(TForm)
    dbgDetails: TDBGrid;
    srcContactType: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryContactType: TFDQuery;
    qryDelete: TFDQuery;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure srcContactTypeDataChange(Sender: TObject; Field: TField);
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
  frmWTLUContactType: TfrmWTLUContactType;

implementation

uses UITypes, WTMaintDesigner, WTMaintContactType, wtMain;

{$R *.dfm}

procedure TfrmWTLUContactType.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Contact_Type').asinteger;
  try
    frmWTMaintContactType := TfrmWTMaintContactType.create(Application);
    frmWTMaintContactType.FunctionMode := FuncMode;
    frmWTMaintContactType.showmodal;
    iCode := frmWTMaintContactType.iCode;
    refresh;
    qryContactType.Locate('Contact_Type',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintContactType.free;
  end;
end;

procedure TfrmWTLUContactType.Refresh;
begin
  qryContactType.close;
  qryContactType.open;
  stsbrDetails.panels[0].text := inttostr(qryContactType.recordcount) + ' records displayed';
end;

procedure TfrmWTLUContactType.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUContactType.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUContactType.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Contact_Type WHERE Contact_Type = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Contact_Type').asinteger);
            execsql;
          end;
        refresh;
      except messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Contact_Type_Description').asstring + ' contact type has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUContactType.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUContactType.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUContactType.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUContactType.srcContactTypeDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcContactType.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcContactType.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcContactType.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUContactType.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUContactType.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUContactType.btnExcelClick(Sender: TObject);
begin
//  frmWTMain.ExportTableToExcel(frmWTLUContactType);
  frmWTMain.ExportToExcel(frmWTLUContactType);
end;

end.
