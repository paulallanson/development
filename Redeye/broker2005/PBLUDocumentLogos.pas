unit PBLUDocumentLogos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBLUDocumentLogos = class(TForm)
    dbgDetails: TDBGrid;
    srcDocumentLogo: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryDocumentLogo: TFDQuery;
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
  frmPBLUDocumentLogos: TfrmPBLUDocumentLogos;

implementation

uses
  System.UITypes, System.Types,
  PBMaintDocumentLogo, pbMainMenu;

{$R *.DFM}

procedure TfrmPBLUDocumentLogos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPBLUDocumentLogos.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmPBLUDocumentLogos.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmPBLUDocumentLogos.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmPBLUDocumentLogos.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('ID').asinteger;
  try
    frmPBMaintDocumentLogos := TfrmPBMaintDocumentLogos.create(Application);
    frmPBMaintDocumentLogos.FunctionMode := FuncMode;
    frmPBMaintDocumentLogos.showmodal;
    iCode := frmPBMaintDocumentLogos.iCode;
    refresh;
    qryDocumentLogo.Locate('ID',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmPBMaintDocumentLogos.free;
  end;
end;

procedure TfrmPBLUDocumentLogos.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Document_logo WHERE ID = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('ID').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Logo_Name').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmPBLUDocumentLogos.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmPBLUDocumentLogos.Refresh;
begin
  qryDocumentLogo.close;
  if not chkbxShowInactive.Checked then
    begin
      qryDocumentLogo.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryDocumentLogo.parambyname('inactive').asstring := 'Y';
    end;

  qryDocumentLogo.open;
  stsbrDetails.panels[0].text := inttostr(qryDocumentLogo.recordcount) + ' records displayed';
end;

procedure TfrmPBLUDocumentLogos.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmPBLUDocumentLogos.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmPBLUDocumentLogos.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmPBLUDocumentLogos.btnExcelClick(Sender: TObject);
begin
 frmpbMainMenu.ExportToExcel(frmPBLUDocumentLogos);
end;

end.
