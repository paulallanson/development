unit wtStockDM;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TstkMode   = (stkAdd, stkChange, stkDelete, stkCopy, stkView);

  TdtmdlStock = class(TDataModule)
    qryAllStock: TQuery;
    dtsAllStock: TDataSource;
    qryDummy: TQuery;
    qryProduct: TQuery;
  private
    function GetHeaderCountAll: integer;
    { Private declarations }
  public
    Description: string;
    property HeaderCountAll: integer read GetHeaderCountAll;
    function CheckProductExists(tempCode: string): boolean;
    function GetProduct(tempCode: string): integer;
    function GetProductDescription(tempCode: string): string;
    function GetProductPack(tempCode: string): integer;
    function GetProductPrice(tempCode: string): currency;
    function GetProductVAT(tempCode: string): currency;
    procedure RefreshAlldata;
  end;

var
  dtmdlStock: TdtmdlStock;

implementation

uses wtDataModule;

{$R *.dfm}

function TdtmdlStock.GetHeaderCountAll: integer;
begin
  result := qryAllStock.RecordCount;
end;

procedure TdtmdlStock.RefreshAlldata;
var
  sTemp: string;
begin
  sTemp := '';
  with qryAllStock do
    begin
      sql.Clear;
      sTemp := qryDummy.sql.text;
    end;
end;

function TdtmdlStock.CheckProductExists(tempCode: string): boolean;
var
  sText: string;
begin
  with qryProduct do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Product_Code').asstring := tempCode;
      open;
      result := (recordcount > 0);
    end;
end;

function TdtmdlStock.GetProductDescription(tempCode: string): string;
var
  sText: string;
begin
  with qryProduct do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Product_Code').asstring := tempCode;
      open;
      result := fieldbyname('Product_Description').asstring;
    end;
end;

function TdtmdlStock.GetProductPrice(tempCode: string): currency;
var
  sText: string;
begin
  with qryProduct do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Product_Code').asstring := tempCode;
      open;
      result := fieldbyname('unit_price').asfloat;
    end;
end;

function TdtmdlStock.GetProductVAT(tempCode: string): currency;
var
  sText: string;
begin
  with qryProduct do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Product_Code').asstring := tempCode;
      open;
      result := fieldbyname('Vat').asinteger;
    end;
end;

function TdtmdlStock.GetProductPack(tempCode: string): integer;
var
  sText: string;
begin
  with qryProduct do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Product_Code').asstring := tempCode;
      open;
      result := fieldbyname('Pack_Size').asinteger;
    end;
end;

function TdtmdlStock.GetProduct(tempCode: string): integer;
var
  sText: string;
begin
  with qryProduct do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Product_Code').asstring := tempCode;
      open;
      result := fieldbyname('Product').asinteger;
    end;
end;

end.
