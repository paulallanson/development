unit PBLUSInvDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, PBPOObjects, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmLookUpSInv = class(TDataModule)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    GetCustSQL: TFDQuery;
    Query1: TFDQuery;
    DummySQL: TFDQuery;
    GetStatementSQL: TFDQuery;
    GetCustStatSQL: TFDQuery;
    SetStatementSQL: TFDQuery;
    oldDummySQL: TFDQuery;
    GetDetsSQLSales_Invoice: TIntegerField;
    GetDetsSQLSales_Invoice_No: TWideStringField;
    GetDetsSQLInvoice_Date: TDateTimeField;
    GetDetsSQLGoods_Value: TCurrencyField;
    GetDetsSQLVat_Value: TCurrencyField;
    GetDetsSQLInv_to_Customer: TIntegerField;
    GetDetsSQLInvoice_Description: TWideStringField;
    GetDetsSQLReference: TWideStringField;
    GetDetsSQLInv_to_Branch: TIntegerField;
    GetDetsSQLInvoice_or_Credit: TWideStringField;
    GetDetsSQLSales_Invoice_Status: TIntegerField;
    GetDetsSQLName: TWideStringField;
    GetDetsSQLBranch_no: TIntegerField;
    GetDetsSQLAccount_Code: TWideStringField;
    GetDetsSQLstatement_reference: TWideStringField;
    GetDetsSQLstatement_date: TDateTimeField;
  private
    FCustomer: string;
    FDateFrom: TDateTime;
    FDateTo: TDateTime;
    FStatement: string;
    procedure SetCustomer(const Value: string);
    function GetRecordcount: integer;
    procedure SetDateFrom(const Value: TDateTime);
    procedure SetDateTo(const Value: TDateTime);
    procedure SetStatement(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    ShowUnPaid: boolean;
    procedure Refreshdata;
    function GetnextStatement(TempCust, TempBranch: integer): string;
    procedure SetStatementNo(const TempCode: integer);
    property Recordcount: integer read GetRecordcount;
    property Customer: string read FCustomer write SetCustomer;
    property DateFrom: TDateTime read FDateFrom write SetDateFrom;
    property DateTo: TDateTime read FDateTo write SetDateTo;
    property Statement: string read FStatement write SetStatement;
  end;

var
  dmLookUpSInv: TdmLookUpSInv;

implementation

uses PBDatabase;

{$R *.DFM}

procedure TdmLookUpSInv.RefreshData;
var
  sTemp : string;

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
  with GetDetsSQL do
  begin
    sTemp := DummySQL.SQL.text;
    SQL.Clear;
    close;
    if Statement = '' then
      begin
      sTemp := sTemp + ' WHERE Sales_Invoice.Sales_Invoice_Status >= 20 ';
      sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date >= ' + qDate(DateFrom);
      sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(DateTo);
      sTemp := sTemp + ' AND ((Customer_Branch.Account_Code =''' + Customer + '''))';
      sTemp := sTemp + ' AND ((Sales_Invoice.Statement_Reference is NULL))' ;
      sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';

      if ShowUnpaid then
        sTemp := sTemp + ' AND ((Sales_Invoice.Paid_Status <> ''Y'') AND (Sales_Invoice.Paid_Status <> ''p''))';
      end
    else
      begin
      sTemp := sTemp + ' WHERE Sales_Invoice.Sales_Invoice_Status >= 20 ';
//      sTemp := sTemp + ' AND ((Customer.Name Like ''%' + Customer + '%'') or (Customer_Branch.Account_Code =''' + Customer + '''))';
      sTemp := sTemp + ' AND ((Customer_Branch.Account_Code =''' + Customer + '''))';
      sTemp := sTemp + ' AND ((Sales_Invoice.Statement_Reference = ''' + Statement + '''))';
//      sTemp := sTemp + ' AND Sales_Invoice.Sales_Invoice_Type is null';
      end;
    sTemp := sTemp + ' ORDER BY Sales_Invoice.sales_invoice_no DESC ';
    SQL.text := sTemp;
    Open;
  end;
end;

function TdmLookUpSInv.GetnextStatement(TempCust, TempBranch: integer): string;
begin
  with GetStatementSQL do
    begin
      close;
      parambyname('Customer').asinteger := TempCust;
      parambyname('Branch_no').asinteger := TempBranch;
      open;
      result := incrementNo(fieldbyname('Last_Statement_ref').asstring);
    end;
end;

procedure TdmLookUpSInv.SetStatementNo(const TempCode: integer);
begin
  with SetStatementSQL do
    begin
      close;
      parambyname('Sales_invoice').asinteger := TempCode;
      execsql;
    end;
end;

procedure TdmLookUpSInv.SetCustomer(const Value: string);
begin
  FCustomer := Value;
end;

function TdmLookUpSInv.GetRecordcount: integer;
begin
  Result := GetDetsSQL.RecordCount;
end;

procedure TdmLookUpSInv.SetDateFrom(const Value: TDateTime);
begin
  FDateFrom := Value;
end;

procedure TdmLookUpSInv.SetDateTo(const Value: TDateTime);
begin
  FDateTo := Value;
end;

procedure TdmLookUpSInv.SetStatement(const Value: string);
begin
  FStatement := Value;
end;

end.
