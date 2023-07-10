unit pbSupplierDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdtmdlSuppliers = class(TDataModule)
    qrySuppliers: TQuery;
    dtsSuppliers: TDataSource;
    qryZero: TQuery;
    CurrSRC: TDataSource;
    GetLastSQL: TQuery;
    DelSQL: TQuery;
    GetIntrastatSQL: TQuery;
    AddSQL: TQuery;
    AddBranchSQL: TQuery;
    CountrySRC: TDataSource;
    GetCompSQL: TQuery;
    IntrastatSRC: TDataSource;
    GetCountrySQL: TQuery;
    UpdBranchSQL: TQuery;
    UpdNotesOnlySQL: TQuery;
    CheckCustAccExistsSQL: TQuery;
    DelBranchSQL: TQuery;
    CheckSuppAccExistsSQL: TQuery;
    VATSRC: TDataSource;
    UpdSQL: TQuery;
    GetCurrSQL: TQuery;
    GetVATSQL: TQuery;
    qryGetSupplier: TQuery;
    qryCharges: TQuery;
    dtsCharges: TDataSource;
    qryCouriers: TQuery;
    dtsCouriers: TDataSource;
    qryDocuments: TQuery;
    dtsDocuments: TDataSource;
    qryAddDocument: TQuery;
    qryGetLastDoc: TQuery;
    qryDelDocument: TQuery;
    qryUpdDocument: TQuery;
    qryGetInvoices: TQuery;
    qryAddReplEntity: TQuery;
    qrySuppliersBase: TQuery;
    qryTerms: TQuery;
    dtsTerms: TDataSource;
    OldqrySuppliersBase: TQuery;
  private
    function GetHeaderCount: integer;
    { Private declarations }
  public
    County: string;
    DateCreated: TDateTime;
    Fax: string;
    Postcode: string;
    SupplierName: string;
    ShowInactive: Boolean;
    telephone: string;
    Town: string;
    procedure RefreshData;
    property HeaderCount: integer read GetHeaderCount;
    function GetNextDocument(tmpSupp: integer): integer;
    function InvoicesExist(tmpSupp: integer): boolean;
    function UsingSearch: boolean;
  end;

var
  dtmdlSuppliers: TdtmdlSuppliers;

implementation

uses pbDatabase;

{$R *.DFM}

function TdtmdlSuppliers.GetHeaderCount: integer;
begin
  Result := qrySuppliers.RecordCount;
end;

function TdtmdlSuppliers.GetNextDocument(tmpSupp: integer): integer;
begin
  with qryGetLastDoc do
    begin
      close;
      parambyname('Supplier').asinteger := tmpSupp;
      open;
      result := fieldbyname('Last_Document').asinteger + 1;
    end;
end;

function TdtmdlSuppliers.InvoicesExist(tmpSupp: integer): boolean;
begin
  result := false;
  with qryGetInvoices do
    begin
      close;
      parambyname('Supplier').asinteger := tmpSupp;
      open;
      result := recordcount > 0;
    end;
end;

procedure TdtmdlSuppliers.RefreshData;
var
  sTemp, sShowInactive: string;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  qrySuppliers.sql.clear;
  qrySuppliers.sql.text := qrySuppliersBase.sql.text;

  if not ShowInactive then
    sShowInactive := 'Y'
  else
    sShowInactive := 'N';

  sTemp := '';
  if Town <> '' then
    sTemp := sTemp + ' AND (Supplier_Branch.Town LIKE ''%' + Town + '%'')';
  if Postcode <> '' then
    sTemp := sTemp + ' AND (Supplier_Branch.Postcode LIKE ''' + Postcode + '%'')';
  if County <> '' then
    sTemp := sTemp + ' AND (Supplier_Branch.County LIKE ''%' + County + '%'')';
  if Telephone <> '' then
    sTemp := sTemp + ' AND (Supplier_Branch.Phone LIKE ''' + Telephone  + '%'')';
  if Fax <> '' then
    sTemp := sTemp + ' AND (Supplier_Branch.Fax_Number LIKE ''' + Fax  + '%'')';

  sTemp := sTemp + ' AND ((Supplier.acc_active = ''Y'') or (Supplier.acc_active = ''' + sShowInactive + '''))';

  sTemp := sTemp + ' ORDER BY Supplier.Name ';

  qrySuppliers.SQL.text := qrySuppliers.SQL.text + sTemp;

  with qrySuppliers do
  begin
    Close;
    parambyname('Code_From').asstring := '%' + SupplierName + '%';
    Open;
  end;
end;

function TdtmdlSuppliers.UsingSearch: boolean;
begin
  if (Town <> '') or
            (Postcode <> '') or
            (Telephone <> '') or
            (County <> '') or
            (Fax <> '') or
            (ShowInactive) then
    result := true
  else
    result := false;

end;

end.
