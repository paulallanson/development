unit PBMaintQuoteSupply;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, DB, DBTables, PBQuotesDM, ComCtrls,
  ExtCtrls;

type
  TPBMaintQuoteSupplyFrm = class(TForm)
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    grpbxDetails: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    memQuantity: TMemo;
    memCostPrice: TMemo;
    lblCostPrice: TLabel;
    Label4: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    qryPriceUnit: TQuery;
    dtsPriceUnit: TDataSource;
    qryGetPUnit: TQuery;
    edtDescription: TRichEdit;
    Label5: TLabel;
    memSellPrice: TMemo;
    Label14: TLabel;
    dblkpVat: TDBLookupComboBox;
    qryVat: TQuery;
    dtsVat: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure QtyMemoExit(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateMoney3DP(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure memCostPriceChange(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure CheckKeyIsFloat(Sender: TObject; var Key: Char);
  private
    FActivated: boolean;
    FOldValue : string;
    FMode: TQLMode;
    FQuoteSupply: TQuoteSupply;
    procedure ShowDetails;
    function CalculateSellPrice(tempQty, tempUnit: integer;
      tempValue: real): real;
    function GetProductTypeCat(tempCode: integer): integer;
    procedure SetMode(const Value: TQLMode);
    function GetPriceUnit(tempUnit: integer): integer;
    procedure SetQuoteSupply(const Value: TQuoteSupply);
    { Private declarations }
  public
    property QuoteSupply: TQuoteSupply read FQuoteSupply write SetQuoteSupply;
    property Mode: TQLMode read FMode write SetMode;
  end;

var
  PBMaintQuoteSupplyFrm: TPBMaintQuoteSupplyFrm;

implementation

uses CCSCommon, pbDatabase;

const

  PriceUnit =
  'SELECT * '+
  'FROM Price_unit '+
  'WHERE ((Price_unit_Inactive is NULL) or (Price_unit_inactive = ''N'')) '+
  'ORDER BY Description ';


  OrigPriceUnit =
  'SELECT * '+
  'FROM Price_unit '+
  'ORDER BY Description ';

{$R *.dfm}

function TPBMaintQuoteSupplyFrm.GetProductTypeCat(tempCode: integer): integer;
begin
end;

function TPBMaintQuoteSupplyFrm.CalculateSellPrice(tempQty, tempUnit: integer; tempValue: real): real;
var
  unitFactor: integer;
begin
  with qryGetPUnit do
    begin
      close;
      parambyname('Price_Unit').asinteger := tempunit;
      open;

      UnitFactor := fieldbyname('Price_unit_Factor').asinteger;
    end;
  if UnitFactor = 0 then
    result := tempValue
  else
    result := ((tempQty/UnitFactor)*tempValue);
end;

procedure TPBMaintQuoteSupplyFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  OKBitBtn.Enabled := (Trim(edtDescription.Text) <> '') and
    (Trim(memCostPrice.Text) <> '') and
    (Trim(memSellPrice.Text) <> '') and
    (Trim(memQuantity.Text) <> '') and
    (dblkpPriceUnit.text <> '');
end;

procedure TPBMaintQuoteSupplyFrm.FormActivate(Sender: TObject);
var
  sQuote : string;
  icount: integer;
begin
  if not FActivated then
  begin
    sQuote := floatToStr(QuoteSupply.Parent.DbKey);
    if Mode = qlAdd then
      Caption := 'Add supply details: ' + sQuote;
    if Mode = qlChange then
      Caption := 'Change supply details: ' + sQuote;
    if Mode = qlDelete then
      Caption := 'Delete supply details: ' + sQuote;

    with qryVAT do
      begin
        Close;
        Open;
      end;

    with qryPriceUnit do
      begin
        close;
        open;
      end;

    ShowDetails;

    grpbxDetails.Enabled := (Mode <> qlDelete) and (Mode <> qlView);

    DelLabel.Visible := (Mode = qlDelete);

    OKBitBtn.Visible := not(Mode = qlView);

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintQuoteSupplyFrm.ShowDetails;
begin
  if Mode = qlAdd then
  begin
    dblkpPriceUnit.KeyValue := 0;
    edtDescription.Text := '';
    memQuantity.Text := '1';
    memSellPrice.Text := '0.000';
    memCostPrice.Text := '0.000';
    dblkpVat.KeyValue := dmBroker.GetCustomerVATCode(QuoteSupply.Parent.Customer);
  end
  else
  begin
    dblkpPriceUnit.KeyValue := QuoteSupply.PriceUnit;
    edtDescription.Text := QuoteSupply.Description;
    memQuantity.Text := FormatQty(QuoteSupply.Quantity);
    memCostPrice.Text := Formatfloat('##0.000',(QuoteSupply.UnitCost));
    memSellPrice.Text := Formatfloat('##0.000',(QuoteSupply.UnitSell));
    dblkpVat.KeyValue := QuoteSupply.Vatcode;
  end;
end;

procedure TPBMaintQuoteSupplyFrm.OKBitBtnClick(Sender: TObject);
var
  inx : integer;
begin
  QuoteSupply.Description := Trim(edtDescription.Text);
  QuoteSupply.Quantity := strtoint(memQuantity.text);
  QuoteSupply.UnitSell := strtofloat(memSellPrice.text);
  QuoteSupply.PriceUnit := dblkpPriceUnit.KeyValue;
  QuoteSupply.UnitCost := strtofloat(memCostPrice.text);
  QuoteSupply.PriceUnitDesc := dblkpPriceUnit.Text;
  QuoteSupply.PriceUnitFactor := GetPriceUnit(QuoteSupply.PriceUnit);
  QuoteSupply.VatCode := dblkpVat.KeyValue;

  if Mode = qlAdd then
  begin
    QuoteSupply.QSupplyNo := QuoteSupply.Parent.Supplies.MaxLineNo + 1;
    QuoteSupply.Sequence := QuoteSupply.Parent.Supplies.count+1;
    QuoteSupply.Parent.Supplies.Add(QuoteSupply);
  end
  else
  if Mode = qlDelete then
  begin
    inx := QuoteSupply.Parent.Supplies.IndexOf(QuoteSupply.QSupplyNo);
    QuoteSupply.Parent.Supplies.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintQuoteSupplyFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintQuoteSupplyFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintQuoteSupplyFrm.ValidateMoney3DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintQuoteSupplyFrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintQuoteSupplyFrm.QtyMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintQuoteSupplyFrm.SetMode(const Value: TQLMode);
begin
  FMode := Value;
  memQuantity.enabled := FMode <> qlRestrict;
  memSellPrice.enabled := FMode <> qlRestrict;
  memCostPrice.enabled := FMode <> qlRestrict;
  dblkpPriceUnit.enabled := FMode <> qlRestrict;
end;

procedure TPBMaintQuoteSupplyFrm.memCostPriceChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintQuoteSupplyFrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBMaintQuoteSupplyFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

function TPBMaintQuoteSupplyfrm.GetPriceUnit(tempUnit: integer): integer;
begin
  with qryGetPUnit do
    begin
      close;
      parambyname('Price_Unit').asinteger := tempunit;
      open;
      result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

procedure TPBMaintQuoteSupplyFrm.SetQuoteSupply(const Value: TQuoteSupply);
begin
  FQuoteSupply := Value;
end;

end.
