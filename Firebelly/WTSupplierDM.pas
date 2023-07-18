unit WTSupplierDM;

interface

uses
  SysUtils, Classes, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlSuppliers = class(TDataModule)
    qryMaterialType: TFDQuery;
    qryGetMaterialGroups: TFDQuery;
    dtsMaterialType: TDataSource;
    dtsGetMaterialGroup: TDataSource;
    qryWorktops: TFDQuery;
    dtsWorktops: TDataSource;
    qryGetWTThickness: TFDQuery;
    qryAddSupplierWT: TFDQuery;
    qryAddSupplierWTThickness: TFDQuery;
    qryWorktopPrices: TFDQuery;
    dtsWorktopPrices: TDataSource;
    qryDummyPrices: TFDQuery;
    qryChkSupplierWT: TFDQuery;
    qryChkSupplierWTThickness: TFDQuery;
    qrySupplierWTInactive: TFDQuery;
    qrySupplierWTDelete: TFDQuery;
    qrySupplierWTThickDelete: TFDQuery;
    qryChkSupplierProd: TFDQuery;
    qryAddSupplierProd: TFDQuery;
    qryUpdSupplierProd: TFDQuery;
    qryProductPrices: TFDQuery;
    dtsProductPrices: TDataSource;
    qryDummyProductPrices: TFDQuery;
    qryGetSupplierProd: TFDQuery;
    qryDelete: TFDQuery;
    qryDeletePrices: TFDQuery;
    qrySupplierWorktops: TFDQuery;
    dtsSupplierWorktops: TDataSource;
    qryDummySupplierWorktops: TFDQuery;
  private
    { Private declarations }
  public
    Colour: string;
    EffectiveDate: TdateTime;
    Group: string;
    Material: string;
    Thickness: string;
    MaterialType: integer;
    ProductCode: string;
    ShowInactive: boolean;
    ShowInactiveProducts: boolean;
    WorktopGroup: integer;
    WorktopDescription: string;
    InactiveWorktops: string;
    procedure RefreshProductPrices(tmpID: integer);
    procedure RefreshSupplierWorktops(tmpID: integer);
    procedure RefreshWorktops;
    procedure RefreshWorktopPrices(tmpID: integer);
  end;

var
  dtmdlSuppliers: TdtmdlSuppliers;

implementation

uses wtDataModule;

{$R *.dfm}

procedure TdtmdlSuppliers.RefreshProductPrices(tmpID: integer);
var
  sTemp, sText: string;
begin
  with qryProductPrices do
    begin
      sql.clear;
      sTemp := qryDummyProductPrices.sql.Text;

      if ProductCode <> '' then
        sTemp := sTemp + ' AND (Supplier_Product.Description LIKE ''%' + ProductCode + '%'') OR (Supplier_Product.Supplier_Product_Code LIKE ''%' + ProductCode + '%'')';
        
      if ShowInactiveProducts then
        sTemp := sTemp + ' AND ((Supplier_Product.inactive = ''Y'') OR (Supplier_Product.inactive = ''N'')) '
      else
        sTemp := sTemp + ' AND ((Supplier_Product.inactive = ''N'')) ';

      sTemp := sTemp + 'ORDER BY Supplier_Product.Supplier_Product_Code';
      sql.text := sTemp;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;
      parambyname('Supplier').asinteger := tmpID;
      open;
    end;
end;

procedure TdtmdlSuppliers.RefreshWorktops;
var
  sTemp: string;
begin
  InactiveWorktops := 'N';
  with qryWorktops do
    begin
      close;
      parambyname('Material_Type').asinteger := MaterialType;
      parambyname('Worktop_Group').asinteger := WorktopGroup;
      parambyname('Description').asstring := '%' + WorktopDescription + '%';
      parambyname('inactive').asstring := InactiveWorktops;
      open;
    end;
end;

procedure TdtmdlSuppliers.RefreshWorktopPrices(tmpID: integer);
var
  sTemp, sText: string;
begin
  with qryWorktopPrices do
    begin
      sql.clear;
      sTemp := qryDummyPrices.sql.Text;

      if Material <> '' then
        sTemp := sTemp + ' AND Material_Type.Description LIKE ''%' + Material + '%''';

      if Colour <> '' then
        sTemp := sTemp + ' AND Worktop.Description LIKE ''%' + Colour + '%''';

      if Thickness <> '' then
        sTemp := sTemp + ' AND Thickness.Thickness_mm LIKE ''%' + Thickness + '%''';

      if Group <> '' then
        sTemp := sTemp + ' AND Worktop_Group.Worktop_Group_Description LIKE ''%' + Group + '%''';

      if ShowInactive then
        sTemp := sTemp + ' AND ((Supplier_Worktop.inactive = ''Y'') OR (Supplier_Worktop.inactive = ''N'')) '
      else
        sTemp := sTemp + ' AND ((Supplier_Worktop.inactive = ''N'')) ';

      sTemp := sTemp + 'ORDER BY Material_Type.Description, Worktop_Group.Worktop_Group_Description, Worktop.Description, Thickness.Thickness_mm';
      sql.text := sTemp;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;
      parambyname('Supplier').asinteger := tmpID;
      open;
    end;
end;

procedure TdtmdlSuppliers.RefreshSupplierWorktops(tmpID: integer);
var
  sTemp, sText: string;
begin
  with qrySupplierWorktops do
    begin
      sql.clear;
      sTemp := qryDummySupplierWorktops.sql.Text;

      if Material <> '' then
        sTemp := sTemp + ' AND Material_Type.Description LIKE ''%' + Material + '%''';

      if Colour <> '' then
        sTemp := sTemp + ' AND Worktop.Description LIKE ''%' + Colour + '%''';

      if Group <> '' then
        sTemp := sTemp + ' AND Worktop_Group.Worktop_Group_Description LIKE ''%' + Group + '%''';

      if ShowInactive then
        sTemp := sTemp + ' AND ((Supplier_Worktop.inactive = ''Y'') OR (Supplier_Worktop.inactive = ''N'')) '
      else
        sTemp := sTemp + ' AND ((Supplier_Worktop.inactive = ''N'')) ';

      sTemp := sTemp + 'ORDER BY Material_Type.Description, Worktop_Group.Worktop_Group_Description, Worktop.Description';
      sql.text := sTemp;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;
      parambyname('Supplier').asinteger := tmpID;
      open;
    end;
end;

end.
