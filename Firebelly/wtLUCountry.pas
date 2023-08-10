unit wtLUCountry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUCountry = class(TForm)
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    stsbrDetails: TStatusBar;
    dtsCountry: TDataSource;
    qryCountry: TFDQuery;
    qryDelete: TFDQuery;
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
  frmWTLUCountry: TfrmWTLUCountry;

implementation

uses
  System.UITypes, System.Types,
  wtMain, wtMaintCountry;

{$R *.dfm}

procedure TfrmWTLUCountry.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Country').asinteger;
  try
    frmWTMaintCountry := TfrmWTMaintCountry.create(Application);
    frmWTMaintCountry.FunctionMode := FuncMode;
    frmWTMaintCountry.showmodal;
    iCode := frmWTMaintCountry.iCode;
    refresh;
    qryCountry.Locate('Country',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCountry.free;
  end;
end;

procedure TfrmWTLUCountry.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Country WHERE Country = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Country').asinteger);
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

procedure TfrmWTLUCountry.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUCountry.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;

end;

procedure TfrmWTLUCountry.Refresh;
begin
  qryCountry.close;
  qryCountry.open;
  stsbrDetails.panels[0].text := inttostr(qryCountry.recordcount) + ' records displayed';
end;

procedure TfrmWTLUCountry.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUCountry.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUCountry.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportTableToExcel(frmWTLUCountry);

end;

procedure TfrmWTLUCountry.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUCountry.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

end.
