unit WTPricesDM;

interface

uses
  SysUtils, Classes, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlPrices = class(TDataModule)
    qryAllPrices: TFDQuery;
    dtsAllPrices: TDataSource;
    qryDummyCurrent: TFDQuery;
    qryDummyFuture: TFDQuery;
    qryDeletePrices: TFDQuery;
    qryAllPricesWorktop: TIntegerField;
    qryAllPricesWorktop_Description: TWideStringField;
    qryAllPricesThickness: TIntegerField;
    qryAllPricesThickness_mm: TWideStringField;
    qryAllPricesPrice_pointer: TIntegerField;
    qryAllPricesMaterial_Type: TIntegerField;
    qryAllPricesMaterial_Type_Description: TWideStringField;
    qryAllPricesWorktop_Group: TIntegerField;
    qryAllPricesWorktop_Group_Description: TWideStringField;
    qryAllPricesEffective_Date: TSQLTimeStampField;
    qryAllPricesDate_Changed: TSQLTimeStampField;
    qryAllPricesUnit_Price: TCurrencyField;
    qryAllPricesUnit_Cost: TCurrencyField;
    qryAllPricesPrice_Unit_Description: TWideStringField;
    qryAllPricesOperator_Name: TWideStringField;
  private
    function GetHeaderCountAll: integer;
    { Private declarations }
  public
    Colour: string;
    EffectiveDate: TdateTime;
    Group: string;
    Material: string;
    PriceType: integer;
    ShowInactiveWorktops: boolean;
    ShowOnlyWebPrices: boolean;
    ShowCurrent: boolean;
    ShowLive: boolean;
    Thickness: string;
    property HeaderCountAll: integer read GetHeaderCountAll;
    function UsingSearch: boolean;
    procedure RefreshWorktopData;
  end;

var
  dtmdlPrices: TdtmdlPrices;

implementation

uses wtDataModule;

{$R *.dfm}

{ TdtmdlPrices }

function TdtmdlPrices.GetHeaderCountAll: integer;
begin
  Result := qryAllPrices.recordcount;
end;

procedure TdtmdlPrices.RefreshWorktopData;
var
  sTemp, sText: string;
  dtTemp: TDateTime;
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  sTemp := '';
  with qryAllPrices do
    begin
      sql.Clear;
      
      case priceType of
          0: sTemp := qryDummyCurrent.sql.text;
          1: sTemp := qryDummyFuture.sql.text;
      end;

      if Material <> '' then
        sTemp := sTemp + ' AND Material_Type.Description LIKE ''%' + Material + '%''';
      if Colour <> '' then
        sTemp := sTemp + ' AND Worktop.Description LIKE ''%' + Colour + '%''';
      if Thickness <> '' then
        sTemp := sTemp + ' AND (select Thickness_mm from Thickness where Thickness.Thickness = Worktop_Thickness.Thickness) LIKE ''%' + Thickness + '%''';
      if Group <> '' then
        sTemp := sTemp + ' AND Worktop_Group.Worktop_Group_Description LIKE ''%' + Group + '%''';
      if ShowOnlyWebPrices then
        sTemp := sTemp + ' AND Worktop.Show_Online =  ''Y''';
      if ShowInactiveWorktops then
        sTemp := sTemp + ' AND ((Worktop.inactive = ''Y'') or (Worktop.inactive = ''N'') or (Worktop.inactive is NULL))'
      else
        sTemp := sTemp + ' AND ((Worktop.inactive = ''N'') or (Worktop.inactive is NULL))';

//      dtTemp := strtodatetime(datetostr(date)+' 23:59:59');
      if PriceType = 1 then
        begin
          sTemp := sTemp + ' AND Prices.Effective_Date >= ' + qDate(date+1);

          if EffectiveDate <> 0 then
            sTemp := sTemp + ' AND Effective_Date >= ' + qDate(EffectiveDate) + ' AND Effective_Date <= ' + qDate(EffectiveDate+1);
        end
      else
        begin
          if EffectiveDate <> 0 then
              sTemp := stemp +  ' AND (select top 1 Effective_Date '+
                                '      from Prices '+
                                '      where  Prices.Price_pointer = worktop_thickness.price_pointer and '+
                                '             Prices.effective_date <= now() '+
                                '      order by Prices.effective_date desc) >= '  + qDate(EffectiveDate) +
                                ' AND (select top 1 Effective_Date '+
                                '      from Prices '+
                                '      where  Prices.Price_pointer = worktop_thickness.price_pointer and '+
                                '             Prices.effective_date <= now() '+
                                '      order by Prices.effective_date desc) <= '  + qDate(EffectiveDate+1);
        end;

      sTemp := sTemp + ' ORDER BY Material_Type.Description, Worktop.Description, Worktop_Thickness.Thickness';
      sql.text := sTemp;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      open;
    end;
end;

function TdtmdlPrices.UsingSearch: boolean;
begin
(*  if (CustomerName <> '') or
            (Description <> '') or
            (Material <> '') or
            (QuoteReference <> '') or
            (Reference <> '') or
            (Status <> '') or
            (ShowInactive = 'Y') or
            (ShowLive) then
    result := true
  else
    result := false;
*)
end;

end.
