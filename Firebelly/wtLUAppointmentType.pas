unit wtLUAppointmentType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtLUAppointmentType = class(TForm)
    dbgDetails: TDBGrid;
    srcAppointmentType: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnEdit: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryDelete: TFDQuery;
    BitBtn1: TBitBtn;
    qryDefaults: TFDQuery;
    qryAppointmentType: TFDQuery;
    procedure btnEditClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwtLUAppointmentType: TfrmwtLUAppointmentType;

implementation

uses
  System.Types,
  wtMain, wtMaintAppointmentType;

{$R *.dfm}

procedure TfrmwtLUAppointmentType.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  if FuncMode = 'A' then
    iCode := 0
  else
    iCode := dbgDetails.datasource.dataset.fieldbyname('ID').asinteger;
    
  try
    frmWTMaintAppointmentType := TfrmWTMaintAppointmentType.create(Application);
    frmWTMaintAppointmentType.FunctionMode := FuncMode;
    frmWTMaintAppointmentType.showmodal;
    iCode := frmWTMaintAppointmentType.iCode;
    Refresh;
    qryAppointmentType.Locate('ID',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintAppointmentType.free;
  end;
end;

procedure TfrmwtLUAppointmentType.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmwtLUAppointmentType.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUAppointmentType.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmwtLUAppointmentType.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUAppointmentType.Refresh;
begin
  qryAppointmentType.close;
  qryAppointmentType.open;
  stsbrDetails.panels[0].text := inttostr(qryAppointmentType.recordcount) + ' records displayed';
end;

procedure TfrmwtLUAppointmentType.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUAppointmentType.btnExcelClick(Sender: TObject);
begin
// frmWTMain.ExportTableToExcel(frmWTLUAppointmentType);
 frmWTMain.ExportToExcel(frmWTLUAppointmentType);
end;

procedure TfrmwtLUAppointmentType.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
// (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('AppointmentColour').asinteger;
// (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Font_Colour').asinteger;
// (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmwtLUAppointmentType.BitBtn1Click(Sender: TObject);
begin
  with qryDefaults do
    begin
      close;
      sql.clear;
      sql.Text := 'UPDATE AppointmentType ' +
                  'SET AppointmentColour = 8, Font_Colour = NULL '+
                  'WHERE id = 1 ';
      execsql;

      close;
      sql.clear;
      sql.Text := 'UPDATE AppointmentType ' +
                  'SET AppointmentColour = 1, Font_Colour = NULL '+
                  'WHERE id = 2 ';
      execsql;

      close;
      sql.clear;
      sql.Text := 'UPDATE AppointmentType ' +
                  'SET AppointmentColour = 5, Font_Colour = NULL '+
                  'WHERE id = 4 ';
      execsql;
    end;
end;

end.
