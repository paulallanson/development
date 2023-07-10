unit wtLUAppointmentType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, ExtCtrls, ComCtrls;

type
  TfrmwtLUAppointmentType = class(TForm)
    dbgDetails: TDBGrid;
    srcAppointmentType: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnEdit: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryDelete: TQuery;
    BitBtn1: TBitBtn;
    qryDefaults: TQuery;
    qryAppointmentType: TQuery;
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

uses wtMain, wtMaintAppointmentType;

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
var
  Txt: array [0..255] of Char;
begin
//  (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('AppointmentColour').asinteger;
//  (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Font_Colour').asinteger;

  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
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
