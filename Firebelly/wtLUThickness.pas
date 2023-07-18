unit wtLUThickness;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB, QrCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWtLUThickness = class(TForm)
    dbgDetails: TDBGrid;
    srcThickness: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    BitBtn3: TBitBtn;
    btnExcel: TBitBtn;
    BitBtn4: TBitBtn;
    qryThickness: TFDQuery;
    qryDelete: TFDQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    procedure btnEditClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    { Private declarations }
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
  public
    { Public declarations }
  end;

var
  frmWtLUThickness: TfrmWtLUThickness;

implementation

uses
  wtMaintThickness, wtMain;

{$R *.DFM}

procedure TfrmWtLUThickness.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWtLUThickness.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWtLUThickness.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.DataSource.DataSet.fieldbyname('Thickness').asinteger;
  try
    frmWTMaintThickness := TfrmWTMaintThickness.create(Application);
    frmWTMaintThickness.FunctionMode := FuncMode;
    frmWTMaintThickness.showmodal;
    iCode := frmWTMaintThickness.iCode;
    Refresh;
    if Funcmode <> 'D' then
      qryThickness.Locate('thickness',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintThickness.free;
  end;
end;

procedure TfrmWtLUThickness.BitBtn3Click(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Thickness WHERE Thickness = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Thickness').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Thickness_mm').asstring
                    + ' thickness has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWtLUThickness.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWtLUThickness.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWtLUThickness.Refresh;
begin
  qryThickness.close;
  qryThickness.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryThickness.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryThickness.parambyname('inactive').asstring := 'Y';
    end;

  qryThickness.open;
  stsbrDetails.panels[0].text := inttostr(qryThickness.recordcount) + ' records displayed';
end;

procedure TfrmWtLUThickness.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWtLUThickness.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWtLUThickness.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportToExcel(frmWtLUThickness);

end;

procedure TfrmWtLUThickness.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWtLUThickness.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.
