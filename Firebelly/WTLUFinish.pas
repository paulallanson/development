unit WTLUFinish;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, QrCtrls, ExtCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUFinish = class(TForm)
    dbgDetails: TDBGrid;
    srcWorktopFinish: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryWorktopFinish: TFDQuery;
    qryDelete: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
  public
    { Public declarations }
  end;

var
  frmWTLUFinish: TfrmWTLUFinish;

implementation

uses
  WTMaintFinish, wtMain;

{$R *.DFM}

procedure TfrmWTLUFinish.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWTLUFinish.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUFinish.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUFinish.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Worktop_Finish').asinteger;
  try
    frmWTMaintFinish := TfrmWTMaintFinish.create(Application);
    frmWTMaintFinish.FunctionMode := FuncMode;
    frmWTMaintFinish.showmodal;
    iCode := frmWTMaintFinish.iCode;
    refresh;
    qryWorktopFinish.Locate('Worktop_Finish',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintFinish.free;
  end;
end;

procedure TfrmWTLUFinish.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Worktop_Finish WHERE Worktop_Finish = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Worktop_Finish').asinteger);
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

procedure TfrmWTLUFinish.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUFinish.Refresh;
begin
  qryWorktopFinish.close;
  if not chkbxShowInactive.Checked then
    begin
      qryWorktopFinish.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryWorktopFinish.parambyname('inactive').asstring := 'Y';
    end;

  qryWorktopFinish.open;
  stsbrDetails.panels[0].text := inttostr(qryWorktopFinish.recordcount) + ' records displayed';
end;

procedure TfrmWTLUFinish.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUFinish.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUFinish.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUFinish.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportTableToExcel(frmWTLUFinish);
end;

end.
