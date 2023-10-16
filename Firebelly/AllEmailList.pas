unit AllEmailList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBCtrls, ExtCtrls, Db, IniFiles, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TAllEmailListFrm = class(TForm)
    Panel1: TPanel;
    EmailListGrid: TStringGrid;
    cmbExportFilter: TDBLookupComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ExFilterSQL: TFDQuery;
    ExFilterSRC: TDataSource;
    lblCount: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure EmailListGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure EmailListGridClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbExportFilterClick(Sender: TObject);
    procedure EmailListGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
  public
  end;

var
  AllEmailListFrm: TAllEmailListFrm;

implementation

{$R *.DFM}

procedure TAllEmailListFrm.FormCreate(Sender: TObject);
begin
  EmailListgrid.cells[2,0] := 'Email Address';
  EmailListgrid.cells[3,0] := 'Attachment File type';
end;

procedure TAllEmailListFrm.EmailListGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
	if (ACol = 1) or (ACol = 3) then
    EmailListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    EmailListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TAllEmailListFrm.EmailListGridClick(Sender: TObject);
begin
  with EmailListGrid do
  begin
    if Col = 3 then
    begin
      cmbExportFilter.Top := celltop(EmailListGrid, Row);
      cmbExportFilter.Left := cellleft(EmailListGrid, Col);
      cmbExportFilter.width := colwidths[3];

      if cells[3,row] <> '' then
        cmbExportFilter.KeyValue := cells[4,row];
      cmbExportFilter.bringtofront;
      cmbExportFilter.Visible := True;
      cmbExportFilter.SetFocus;
    end
    else
    begin
      cmbExportFilter.sendtoback;
      cmbExportFilter.Visible := False;
    end
  end;
end;

procedure TAllEmailListFrm.FormShow(Sender: TObject);
var
  IniFile: TIniFile;
  defAttach: string;
  irow: integer;
begin
  with ExFilterSQL do
  begin
    close;
    open;
  end;

  //check for email attachment type default in Broker.ini
  //if none set rtf as default.
  IniFile := TIniFile.Create('Broker.ini');
  try
    defAttach := IniFile.ReadString('Email', 'Def Attach Type', 'RTF');
  finally
    IniFile.Free;
  end;

  cmbExportFilter.keyvalue := defAttach;

  //check thru grid lines, if no export filter set then default to rtf
  for irow := 1 to 100 do
  begin
    if (EmailListGrid.cells[0,irow] = '') then continue;
    //or
    //   (EmailListGrid.cells[1,irow] = '')
    if EmailListGrid.cells[3,irow] = '' then
    begin
      EmailListGrid.cells[3,irow] := ExFilterSQL.FieldbyName('Description').asString;
      EmailListGrid.cells[4,irow] := ExFilterSQL.FieldbyName('ExportFilter').asString;
    end;
  end;
end;

function TAllEmailListFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := 0 to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TAllEmailListFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Top;
  for i := grid.toprow to Row do
  begin
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  end;
  Result := t;

end;

procedure TAllEmailListFrm.cmbExportFilterClick(Sender: TObject);
begin
  with EmailListGrid do
  begin
    cells[4,row] := cmbExportFilter.keyvalue;
    cells[3,row] := cmbExportFilter.text;
  end;
end;

procedure TAllEmailListFrm.EmailListGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  cmbExportFilter.width := EmailListGrid.colwidths[Acol];
end;

end.
