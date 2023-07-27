(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Fax list Form

VSS Info:
$Header: /PBL D5/PBEmailList.pas 2     24/10/02 11:56 Davidn $
$History: PBEmailList.pas $
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
unit PBEmailList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBCtrls, ExtCtrls, Db, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEmailListFrm = class(TForm)
    Panel1: TPanel;
    EmailListGrid: TStringGrid;
    cmbExportFilter: TDBLookupComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ExFilterSQL: TFDQuery;
    ExFilterSRC: TDataSource;
    UpSuppSQL: TFDQuery;
    UpCustSQL: TFDQuery;
    cmbContacts: TDBLookupComboBox;
    qryContacts: TFDQuery;
    dtsContacts: TDataSource;
    qrySuppliers: TFDQuery;
    UpInvoiceSQL: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure EmailListGridClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbExportFilterClick(Sender: TObject);
    procedure EmailListGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure cmbContactsClick(Sender: TObject);
    procedure cmbContactsEnter(Sender: TObject);
    procedure EmailListGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    FCodeType: string;
    { Private declarations }
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    procedure SetCodeType(const Value: string);
    procedure UpdateDetails(UpSQL: TFDQuery);
    procedure UpdateInvDetails;
  public
    { Public declarations }
    EmailContactArray: array[1..100,1..3] of string;
    UseBranchAddr: array [1..100] of boolean;
    property CodeType: string read FCodeType write SetCodeType;

  end;

var
  PBEmailListFrm: TPBEmailListFrm;

implementation

uses pbMainMenu;

{$R *.DFM}

procedure TPBEmailListFrm.FormCreate(Sender: TObject);
var
  inx: integer;
begin
  EmailListgrid.cells[3,0] := 'Email Address';
  EmailListgrid.cells[4,0] := 'Attachment File type';
  EmailListGrid.colwidths[5] := -1;

  for inx := 1 to 100 do
  begin
    self.UseBranchAddr[inx] := false;
  end;
end;

procedure TPBEmailListFrm.EmailListGridClick(Sender: TObject);
begin
  with EmailListGrid do
  begin
    if Col = 2 then
    begin
      cmbContacts.Top := celltop(EmailListGrid, Row);
      cmbContacts.Left := cellleft(EmailListGrid, Col);
      cmbContacts.width := colwidths[2];

      if cells[2,row] <> '' then
        cmbContacts.KeyValue := EmailContactArray[row,3];
      cmbContacts.bringtofront;
      cmbContacts.Visible := True;
      cmbContacts.SetFocus;
    end
    else
    if Col = 4 then
    begin
      cmbExportFilter.Top := celltop(EmailListGrid, Row);
      cmbExportFilter.Left := cellleft(EmailListGrid, Col);
      cmbExportFilter.width := colwidths[4];

      if cells[4,row] <> '' then
        cmbExportFilter.KeyValue := cells[5,row];
      cmbExportFilter.bringtofront;
      cmbExportFilter.Visible := True;
      cmbExportFilter.SetFocus;
    end
    else
    begin
      cmbExportFilter.sendtoback;
      cmbExportFilter.Visible := False;

      cmbContacts.sendtoback;
      cmbContacts.Visible := False;
    end
  end;
end;

procedure TPBEmailListFrm.FormShow(Sender: TObject);
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

  //check for email attachment type default
  //if none set rtf as default.
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    defAttach := IniFile.ReadString('Email', 'Def Attach Type', 'RTF');
  finally
    IniFile.Free;
  end;

  cmbExportFilter.keyvalue := defAttach;

  //check thru grid lines, if no export filter set then default to rtf
  for irow := 1 to 100 do
  begin
    if (EmailListGrid.cells[0,irow] = '') or
       (EmailListGrid.cells[1,irow] = '')  then continue;
    if EmailListGrid.cells[4,irow] = '' then
    begin
      EmailListGrid.cells[4,irow] := ExFilterSQL.FieldbyName('Description').asString;
      EmailListGrid.cells[5,irow] := ExFilterSQL.FieldbyName('ExportFilter').asString;
    end;
  end;
end;

function TPBEmailListFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := grid.leftcol to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TPBEmailListFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
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

procedure TPBEmailListFrm.cmbExportFilterClick(Sender: TObject);
begin
  with EmailListGrid do
  begin
    cells[5,row] := cmbExportFilter.keyvalue;
    cells[4,row] := cmbExportFilter.text;
  end;
end;

procedure TPBEmailListFrm.EmailListGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  cmbExportFilter.width := EmailListGrid.colwidths[Acol];

  cmbContacts.width := EmailListGrid.colwidths[Acol];
end;

procedure TPBEmailListFrm.EmailListGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
	if (ACol = 2) or (ACol = 3) or (ACol = 4) then
    EmailListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    EmailListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TPBEmailListFrm.BitBtn1Click(Sender: TObject);
begin
  if CodeType = 'S' then
    UpdateDetails(UpSuppSQL)
  else
  if CodeType = 'I' then
    UpdateInvDetails
  else
    UpdateDetails(UpCustSQL);
end;

procedure TPBEmailListFrm.UpdateDetails(UpSQL: TFDQuery);
var
  irow: integer;
begin
  for irow := 1 to 100 do
    begin
      if (EmailListGrid.cells[2,irow] = '') or
         (EmailListGrid.cells[3,irow] = '') or
         (self.UseBranchAddr[irow] = true) then continue;

      with UpSQL do
        begin
          close;
          parambyname('Code').asinteger := strtoint(EmailContactArray[irow,1]);
          parambyname('Branch_no').asinteger := strtoint(EmailContactArray[irow,2]);
          parambyname('Contact_no').asinteger := strtoint(EmailContactArray[irow,3]);
          parambyname('Email').asstring := EmailListGrid.cells[3,irow];
          parambyname('ExportFilter').asstring := EmailListGrid.cells[5,irow];
          execsql;
        end;
    end;
end;

procedure TPBEmailListFrm.UpdateInvDetails;
var
  irow: integer;
begin
  for irow := 1 to 100 do
    begin
      if (EmailListGrid.cells[2,irow] = '') or
         (EmailListGrid.cells[3,irow] = '') or
         (EmailListGrid.cells[6,irow] <> '') or
         (self.UseBranchAddr[irow] = true) then continue;

      with UpInvoiceSQL do
        begin
          close;
          parambyname('Sales_Invoice_no').asstring := EmailListGrid.cells[0,irow];
          parambyname('Contact_no').asinteger := strtoint(EmailContactArray[irow,3]);
          execsql;
        end;
    end;
end;

procedure TPBEmailListFrm.SetCodeType(const Value: string);
begin
  {'S' - Supplier
   'C' - Customer
   'I' - Invoicing}
  FCodeType := Value;
end;

procedure TPBEmailListFrm.cmbContactsClick(Sender: TObject);
begin
  with EmailListGrid do
  begin
    EmailContactArray[row,3] := cmbContacts.keyvalue;
    cells[2,row] := cmbContacts.text;
    cells[3,row] := dtsContacts.DataSet.Fields[2].asstring;
  end;

end;

procedure TPBEmailListFrm.cmbContactsEnter(Sender: TObject);
begin
  if (CodeType = 'C') or (CodeType = 'I') then
    begin
      with qryContacts, EmailListGrid do
        begin
          dtsContacts.DataSet := qryContacts;
          close;
          parambyname('Customer').asinteger := strtoint(EmailContactArray[row,1]);
          parambyname('Branch_no').asinteger := strtoint(EmailContactArray[row,2]);
          open;
        end;
    end
  else
    begin
      with qrySuppliers, EmailListGrid do
        begin
          dtsContacts.DataSet := qrySuppliers;
          close;
          parambyname('Supplier').asinteger := strtoint(EmailContactArray[row,1]);
          parambyname('Branch_no').asinteger := strtoint(EmailContactArray[row,2]);
          open;
        end;
    end
end;

end.
