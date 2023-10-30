unit wtLUAppointmentDateType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtLUAppointmentDateType = class(TForm)
    dbgDetails: TDBGrid;
    srcAppointmentDateType: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnEdit: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryAppointmentDateType: TFDQuery;
    procedure btnEditClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwtLUAppointmentDateType: TfrmwtLUAppointmentDateType;

implementation

uses
  System.Types,
  wtMain, wtMaintAppointmentDateType;

{$R *.dfm}

procedure TfrmwtLUAppointmentDateType.CallMaintScreen(FuncMode: string);
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
    frmWTMaintAppointmentDateType := TfrmWTMaintAppointmentDateType.create(Application);
    frmWTMaintAppointmentDateType.FunctionMode := FuncMode;
    frmWTMaintAppointmentDateType.showmodal;
    iCode := frmWTMaintAppointmentDateType.iCode;
    Refresh;
    qryAppointmentDateType.Locate('ID',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintAppointmentDateType.free;
  end;
end;

procedure TfrmwtLUAppointmentDateType.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmwtLUAppointmentDateType.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUAppointmentDateType.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmwtLUAppointmentDateType.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUAppointmentDateType.Refresh;
begin
  qryAppointmentDateType.close;
  qryAppointmentDateType.open;
  stsbrDetails.panels[0].text := inttostr(qryAppointmentDateType.recordcount) + ' records displayed';
end;

procedure TfrmwtLUAppointmentDateType.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUAppointmentDateType.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmwtLUAppointmentDateType.btnExcelClick(Sender: TObject);
begin
// frmWTMain.ExportTableToExcel(frmWTLUAppointmentDateType);
 frmWTMain.ExportToExcel(frmWTLUAppointmentDateType);
end;

procedure TfrmwtLUAppointmentDateType.dbgDetailsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
// (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('AppointmentColour').asinteger;
// (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Font_Colour').asinteger;
// (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
end;

end.
