unit wtEmailList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBCtrls, ExtCtrls, Db, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTEmailList = class(TForm)
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
    qryFitters: TFDQuery;
    dtsFitters: TDataSource;
    btnEmail: TButton;
    UpSalesOrderTemplaterSQL: TFDQuery;
    UpSalesOrderFitterSQL: TFDQuery;
    procedure FormCreate(Sender: TObject);
//    procedure EmailListGridSelectCell(Sender: TObject; ACol, ARow: Longint;
//      var CanSelect: Boolean);
    procedure EmailListGridClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbExportFilterClick(Sender: TObject);
    procedure EmailListGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure cmbContactsClick(Sender: TObject);
    procedure cmbContactsEnter(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
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
    procedure UpdateSalesOrderFitter;
    procedure UpdateSalesOrderTemplater;
  public
    { Public declarations }
    EmailContactArray: array[1..100,1..3] of string;
    UseBranchAddr: array [1..100] of boolean;
    property CodeType: string read FCodeType write SetCodeType;

  end;

var
  frmWTEmailList: TfrmWTEmailList;

implementation

uses wtMain;

{$R *.DFM}

procedure TfrmWTEmailList.FormCreate(Sender: TObject);
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

procedure TfrmWTEmailList.EmailListGridClick(Sender: TObject);
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

procedure TfrmWTEmailList.FormShow(Sender: TObject);
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
  IniFile := TIniFile.Create(frmwtMain.AppIniFile);
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

function TfrmWTEmailList.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := grid.leftcol to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TfrmWTEmailList.celltop(grid: TStringGrid; Row: Integer): Integer;
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

procedure TfrmWTEmailList.cmbExportFilterClick(Sender: TObject);
begin
  with EmailListGrid do
  begin
    cells[5,row] := cmbExportFilter.keyvalue;
    cells[4,row] := cmbExportFilter.text;
  end;
end;

procedure TfrmWTEmailList.EmailListGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  cmbExportFilter.width := EmailListGrid.colwidths[Acol];

  cmbContacts.width := EmailListGrid.colwidths[Acol];
end;

procedure TfrmWTEmailList.EmailListGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
	if (ACol = 2) or (ACol = 3) or (ACol = 4) then
    EmailListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    EmailListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TfrmWTEmailList.BitBtn1Click(Sender: TObject);
begin
  if CodeType = 'S' then
    UpdateDetails(UpSuppSQL)
  else
  if CodeType = 'I' then
    UpdateInvDetails
  else
  if CodeType = 'T' then
    UpdateSalesOrderTemplater
  else
  if CodeType = 'F' then
    UpdateSalesOrderFitter
  else
  if CodeType = 'C' then
    UpdateDetails(UpCustSQL);
end;

procedure TfrmWTEmailList.UpdateDetails(UpSQL: TFDQuery);
var
  irow: integer;
begin
  for irow := 1 to 100 do
    begin
      if (EmailListGrid.cells[2,irow] = '') or
         (EmailListGrid.cells[3,irow] = '') or
         (self.UseBranchAddr[irow] = true) then continue;

(*      with UpSQL do
        begin
          close;
          parambyname('Code').asinteger := strtoint(EmailContactArray[irow,3]);
          parambyname('Contact_no').asinteger := strtoint(EmailContactArray[irow,2]);
          parambyname('Email').asstring := EmailListGrid.cells[3,irow];
//          parambyname('ExportFilter').asstring := EmailListGrid.cells[5,irow];
          execsql;
        end;
*)
    end;
end;

procedure TfrmWTEmailList.UpdateInvDetails;
var
  irow: integer;
begin
  for irow := 1 to 100 do
    begin
      if (EmailListGrid.cells[2,irow] = '') or
         (EmailListGrid.cells[3,irow] = '') or
         (self.UseBranchAddr[irow] = true) then continue;

(*      with UpInvoiceSQL do
        begin
          close;
          parambyname('Sales_Invoice_no').asstring := EmailListGrid.cells[0,irow];
          parambyname('Contact_no').asinteger := strtoint(EmailContactArray[irow,3]);
          execsql;
        end;
*)
    end;
end;

procedure TfrmWTEmailList.UpdateSalesOrderFitter;
var
  irow: integer;
begin
  for irow := 1 to 100 do
    begin
      if (EmailListGrid.cells[2,irow] = '') then continue;

      with UpSalesOrderFitterSQL do
        begin
          close;
          parambyname('Sales_Order').asinteger := strtoint(EmailListGrid.cells[0,irow]);
          parambyname('Fitter').asinteger := strtoint(EmailContactArray[irow,3]);
          execsql;
        end;
    end;
end;

procedure TfrmWTEmailList.UpdateSalesOrderTemplater;
var
  irow: integer;
begin
  for irow := 1 to 100 do
    begin
      if (EmailListGrid.cells[2,irow] = '') then continue;

      with UpSalesOrderTemplaterSQL do
        begin
          close;
          parambyname('Sales_Order').asinteger := strtoint(EmailListGrid.cells[0,irow]);
          parambyname('Templater').asinteger := strtoint(EmailContactArray[irow,3]);
          execsql;
        end;
    end;
end;

procedure TfrmWTEmailList.SetCodeType(const Value: string);
begin
  {'S' - Supplier
   'C' - Customer
   'I' - Invoicing
   'F' - Fitters
   'T' - Templaters
   'Q' - Quotes}
   
  FCodeType := Value;
  btnEmail.visible := (FCodeType = 'F');
end;

procedure TfrmWTEmailList.cmbContactsClick(Sender: TObject);
begin
  with EmailListGrid do
  begin
    EmailContactArray[row,3] := cmbContacts.keyvalue;
    cells[2,row] := cmbContacts.text;
    cells[3,row] := dtsContacts.DataSet.Fields[2].asstring;
  end;

end;

procedure TfrmWTEmailList.cmbContactsEnter(Sender: TObject);
begin
  if (CodeType = 'C') or (CodeType = 'I') or (CodeType = 'Q') then
    begin
      with qryContacts, EmailListGrid do
        begin
          dtsContacts.DataSet := qryContacts;
          close;
          parambyname('Customer').asinteger := strtoint(EmailContactArray[row,1]);
          open;
        end;
    end
  else
  if (CodeType = 'F') or (CodeType = 'T') or (CodeType = 'D') then
    begin
      with qryFitters, EmailListGrid do
        begin
          dtsContacts.DataSet := qryFitters;
          close;
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
          open;
        end;
    end
end;

procedure TfrmWTEmailList.btnEmailClick(Sender: TObject);
var
  sEmail, sContact, sContactCode: string;
  iRow: integer;
begin
  sEmail :=   EmailListGrid.cells[3,1];
  sContact :=  EmailListGrid.cells[2,1];
  sContactCode := EmailContactArray[1,3];

  for irow := 2 to pred(EmailListGrid.rowcount) do
    begin
      EmailListGrid.cells[3,iRow] := sEmail;
      EmailListGrid.cells[2,iRow] := sContact;
      EmailContactArray[iRow,3] := sContactCode;
    end;
end;

end.
