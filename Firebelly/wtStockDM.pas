unit wtStockDM;

interface

uses
  SysUtils, Classes, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TstkMode   = (stkAdd, stkChange, stkDelete, stkCopy, stkView);

  TdtmdlStock = class(TDataModule)
    qryAllStock: TFDQuery;
    dtsAllStock: TDataSource;
    qryDummy: TFDQuery;
    wtStkDatabase: TDatabase;
    qryStockSystem: TFDQuery;
    qryProduct: TFDQuery;
    qryGSmart: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    function GetHeaderCountAll: integer;
    { Private declarations }
  public
    sAlias: string;
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
begin
  if sAlias = 'GSmart' then
    begin
      dtsAllStock.DataSet := qryGSmart;
      with qryGSmart do
        begin
          close;
          parambyname('Code').asstring := Description;
          open;
        end;
    end
  else
    begin
      with qryAllStock do
        begin
          sql.Clear;
          sql.text := qryDummy.sql.text;
          parambyname('Code').asstring := Description;
          open;
        end;
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

procedure TdtmdlStock.DataModuleCreate(Sender: TObject);
var
  sUserName, sPassword: string;
begin
  with qryStockSystem do
    begin
      close;
      parambyname('Stock_System').asstring := dtmdlWorktops.StockSystemCode;
      open;

      if fieldbyname('External_System').asstring = 'Y' then
        begin
          sAlias := fieldbyname('Database_Alias_Name').asstring;
          sUserName := fieldbyname('Login_Username').asstring;
          sPassword := fieldbyname('Login_Password').asstring;


          with wtStkDatabase do
            begin

              AliasName := sAlias;
              params[0] := 'User Name=readonly';
              params[1] := 'Password=R34donly4';
            end;
        end;
    end;
end;

end.
