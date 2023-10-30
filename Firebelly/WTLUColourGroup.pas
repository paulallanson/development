unit WTLUColourGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, QrCtrls, ExtCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUColourGroup = class(TForm)
    dbgDetails: TDBGrid;
    srcColourGroup: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryColourGroup: TFDQuery;
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
  public
    { Public declarations }
  end;

var
  frmWTLUColourGroup: TfrmWTLUColourGroup;

implementation

uses
  System.UITypes, System.Types,
  wtMain, wtMaintColourGroup;

{$R *.DFM}

procedure TfrmWTLUColourGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWTLUColourGroup.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmWTLUColourGroup.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUColourGroup.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUColourGroup.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Colour_Group').asinteger;
  try
    frmWTMaintColourGroup := TfrmWTMaintColourGroup.create(Application);
    frmWTMaintColourGroup.FunctionMode := FuncMode;
    frmWTMaintColourGroup.showmodal;
    iCode := frmWTMaintColourGroup.iCode;
    refresh;
    qryColourGroup.Locate('Colour_Group',Variant(inttostr(iCode)),[]);

  finally
    Screen.Cursor := OldCursor;
    frmWTMaintColourGroup.free;
  end;
end;

procedure TfrmWTLUColourGroup.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Colour_Group WHERE Colour_Group = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Colour_Group').asinteger);
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

procedure TfrmWTLUColourGroup.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUColourGroup.Refresh;
begin
  qryColourGroup.close;
  if not chkbxShowInactive.Checked then
    begin
      qryColourGroup.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryColourGroup.parambyname('inactive').asstring := 'Y';
    end;

  qryColourGroup.open;
  stsbrDetails.panels[0].text := inttostr(qryColourGroup.recordcount) + ' records displayed';
end;

procedure TfrmWTLUColourGroup.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if(dbgDetails.datasource.dataset.fieldByName('Show_Online').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.brush.color := clGreen;
      (Sender as TDBGrid).Canvas.font.color := clWhite;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmWTLUColourGroup.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUColourGroup.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUColourGroup.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportTableToExcel(frmWTLUColourGroup);
end;

end.
