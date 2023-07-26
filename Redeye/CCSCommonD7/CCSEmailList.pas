(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Fax list Form

VSS Info:
$Header: /Broker Stock/STEmailList.pas 3     10/07/03 13:22 Davidn $
$History: STEmailList.pas $
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 10/07/03   Time: 13:22
 * Updated in $/Broker Stock
 * Deleted declaration of unused variables.
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 29/04/:3   Time: 11:54
 * Updated in $/Broker Stock
 * default description
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 24/04/:3   Time: 11:20
 * Created in $/Broker Stock
 * Email form
 * 
 * *****************  Version 2  *****************
 * User: Davidn       Date: 24/10/02   Time: 11:56
 * Updated in $/PBL D5
 * set default email file attachment type to be displayed in grid.
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 6/02/:1    Time: 9:57
 * Created in $/PBL D5
 * Initial takeon of Email Recipient list
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CCSEmailList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBCtrls, ExtCtrls, Db, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCCSEmailListFrm = class(TForm)
    Panel1: TPanel;
    EmailListGrid: TStringGrid;
    cmbExportFilter: TDBLookupComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ExFilterSQL: TFDQuery;
    ExFilterSRC: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure EmailListGridSelectCell(Sender: TObject; Col, Row: Longint;
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
  CCSEmailListFrm: TCCSEmailListFrm;

implementation

uses pbMainMenu;

{$R *.DFM}

procedure TCCSEmailListFrm.FormCreate(Sender: TObject);
begin
  EmailListgrid.cells[2,0] := 'Email Address';
  EmailListgrid.cells[3,0] := 'Attachment File type';
end;

procedure TCCSEmailListFrm.EmailListGridSelectCell(Sender: TObject; Col,
  Row: Longint; var CanSelect: Boolean);
begin
	if (Col = 1) or (Col = 3) then
    EmailListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    EmailListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TCCSEmailListFrm.EmailListGridClick(Sender: TObject);
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

procedure TCCSEmailListFrm.FormShow(Sender: TObject);
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
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);
  with IniFile do
  begin
    defAttach := ReadString('Email', 'Def Attach Type', 'RTF');
    Free;
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

function TCCSEmailListFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := 0 to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TCCSEmailListFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
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

procedure TCCSEmailListFrm.cmbExportFilterClick(Sender: TObject);
begin
  with EmailListGrid do
  begin
    cells[4,row] := cmbExportFilter.keyvalue;
    cells[3,row] := cmbExportFilter.text;
  end;
end;

procedure TCCSEmailListFrm.EmailListGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  cmbExportFilter.width := EmailListGrid.colwidths[Acol];

end;

end.
