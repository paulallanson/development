unit WTMaintCustWTGroupPrices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, CRControls, DB, DBTables, gtQrCtrls, Math,
  Mask, WTLUCustWTGroupPrices;

type
  TfrmWTMaintCustWTGroupPrices = class(TForm)
    dblkpThickness: TDBLookupComboBox;
    edtmnySell: TCREditMoney;
    Label3: TLabel;
    Label5: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    lkpThickness: TQuery;
    srclkpThickness: TDataSource;
    Label4: TLabel;
    edtmnyCost: TCREditMoney;
    Label15: TLabel;
    edtMarkupPercentage: TCREditMoney;
    qryAdd: TQuery;
    qryUpdate: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtMarkupPercentageChange(Sender: TObject);
    procedure edtmnyCostChange(Sender: TObject);
    procedure edtmnySellChange(Sender: TObject);
    procedure edtmnySellEnter(Sender: TObject);
    procedure edtmnySellExit(Sender: TObject);
    procedure edtMarkupPercentageEnter(Sender: TObject);
    procedure edtMarkupPercentageExit(Sender: TObject);
  private
    FSellPrice: currency;
    FPricePointer: integer;
    FFunctionMode: string;
    Fthickness: integer;
    FCostPrice: currency;
    FCustomer: integer;
    FGroupCode: integer;
    FChangePrice: boolean;
    FChangeMarkupRate: boolean;
    FActivated: boolean;
    FMarkup: double;
    procedure GetUnitPrice;
    procedure GetMarkupPercentage;
    procedure SetFunctionMode(const Value: string);
    procedure SetPricePointer(const Value: integer);
    procedure SetSellPrice(const Value: currency);
    procedure Setthickness(const Value: integer);
    procedure SetCostPrice(const Value: currency);
    procedure SetCustomer(const Value: integer);
    procedure SetGroupCode(const Value: integer);
    procedure SetChangePrice(const Value: boolean);
    procedure SetChangeMarkupRate(const Value: boolean);
    procedure SetActivated(const Value: boolean);
    procedure SetMarkup(const Value: double);
    { Private declarations }
  public
    property Activated: boolean read FActivated write SetActivated;
    property ChangePrice: boolean read FChangePrice write SetChangePrice;
    property ChangeMarkupRate: boolean read FChangeMarkupRate write SetChangeMarkupRate;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property Customer: integer read FCustomer write SetCustomer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property GroupCode: integer read FGroupCode write SetGroupCode;
    property Markup: double read FMarkup write SetMarkup;
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property thickness: integer read Fthickness write Setthickness;
    property PricePointer: integer read FPricePointer write SetPricePointer;
  end;

var
  frmWTMaintCustWTGroupPrices: TfrmWTMaintCustWTGroupPrices;

implementation

uses wtDataModule, wtMain;

{$R *.dfm}

{ TfrmWTMaintWTGPrices }

procedure TfrmWTMaintCustWTGroupPrices.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
  if Value = 'C' then
    Begin
      dblkpThickness.Enabled := false;
    end;
end;

procedure TfrmWTMaintCustWTGroupPrices.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintCustWTGroupPrices.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  edtmnySell.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmWTMaintCustWTGroupPrices.btnOKClick(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
	    dtmdlWorktops.qryNewPrice.Close;
      dtmdlWorktops.qryNewPrice.Open;
      PricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	    dtmdlWorktops.qryAddPointer.Close;
      dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
	    dtmdlWorktops.qryAddPointer.ExecSQl;

      with qryAdd do
        begin
          Close;
          parambyname('Customer').asinteger := Customer;
          parambyname('Group_Number').asinteger := GroupCode;
          parambyname('Thickness').asinteger := dblkpThickness.KeyValue;
          parambyname('Markup_Percentage').asfloat := strtofloat(edtMarkupPercentage.text);

          paramByName('Price_Pointer').Asinteger := PricePointer;
          ExecSQL;
        end;

	    dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
	    dtmdlWorktops.qryAddPrice.ExecSQl;
    end
  else
    begin
      with qryUpdate do
        begin
          parambyname('Customer').asinteger := Customer;
          parambyname('Group_Number').asinteger := GroupCode;
          parambyname('Thickness').asinteger := Thickness;
          parambyname('Markup_Percentage').asfloat := strtofloat(edtMarkupPercentage.text);
          execsql;
        end;

      if (strtofloat(edtmnySell.text) <> SellPrice) or (strtofloat(edtmnyCost.text) <> CostPrice) then
      begin
	      dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
    end;
end;

procedure TfrmWTMaintCustWTGroupPrices.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    if FunctionMode = 'A' then
    begin
    with lkpThickness do
      begin
        close;
        parambyname('Customer').asinteger := Customer;
        parambyname('Group_Number').asinteger := GroupCode;
        parambyname('Thickness').asinteger := 0;
        open;
      end;
    dblkpThickness.KeyValue := 0;
    end
    else
    begin
      with lkpThickness do
      begin
        close;
        parambyname('Customer').asinteger := Customer;
        parambyname('Group_Number').asinteger := GroupCode;
        parambyname('Thickness').asinteger := Thickness;
        open;
      end;
      dblkpThickness.keyvalue := Thickness;
    end;
    FActivated := true;
  end;
  enableok(self);
end;

procedure TfrmWTMaintCustWTGroupPrices.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpThickness.keyvalue <> 0);
end;

procedure TfrmWTMaintCustWTGroupPrices.Setthickness(const Value: integer);
begin
  Fthickness := Value;
end;

procedure TfrmWTMaintCustWTGroupPrices.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWTMaintCustWTGroupPrices.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWTMaintCustWTGroupPrices.SetGroupCode(const Value: integer);
begin
  FGroupCode := Value;
end;

procedure TfrmWTMaintCustWTGroupPrices.edtMarkupPercentageChange(
  Sender: TObject);
begin
  if FChangePrice or not FActivated then exit;
  GetUnitPrice;
end;

procedure TfrmWTMaintCustWTGroupPrices.GetUnitPrice;
var
  rUnitPrice, rUnitCost, rTotal, rSlabTotal: real;
  idepth, iLength, iQuantity: integer;
  rMarkupPercentage: real;
begin
  try
    rMarkupPercentage := strtofloat(edtMarkupPercentage.text);
  except
    rMarkupPercentage := 0;
  end;

  try
    rUnitCost := strtofloat(edtmnyCost.text);
  except
    rUnitCost := 0.00;
  end;

  rUnitPrice := roundTo(rUnitCost * (1 + (rMarkupPercentage/100)),-2);

  edtmnySell.text := formatfloat('0.00',rUnitPrice);
end;

procedure TfrmWTMaintCustWTGroupPrices.edtmnyCostChange(Sender: TObject);
begin
  if not FActivated then exit;
  GetUnitPrice;
  EnableOK(self);
end;

procedure TfrmWTMaintCustWTGroupPrices.edtmnySellChange(Sender: TObject);
begin
  if FChangeMarkupRate or not FActivated then exit;
  GetMarkupPercentage;
  EnableOK(self);
end;

procedure TfrmWTMaintCustWTGroupPrices.GetMarkupPercentage;
var
  rUnitPrice, rUnitCost, rTotal, rSlabTotal: real;
  idepth, iLength, iQuantity: integer;
  rMarkupPercentage: real;
begin
  try
    rUnitprice := strtofloat(edtmnySell.text) ;
  except
    rUnitprice := 0;
  end;

  try
    rMarkupPercentage := ((strtofloat(edtmnySell.text)/strtofloat(edtmnyCost.text))-1) * 100;
  except
    rMarkupPercentage := 0;
  end;

  edtMarkupPercentage.text := formatfloat('0.00',rMarkupPercentage);
  enableOK(self)
end;

procedure TfrmWTMaintCustWTGroupPrices.edtmnySellEnter(Sender: TObject);
begin
  FChangePrice := true;

end;

procedure TfrmWTMaintCustWTGroupPrices.edtmnySellExit(Sender: TObject);
begin
  FChangePrice := false;
end;

procedure TfrmWTMaintCustWTGroupPrices.SetChangePrice(
  const Value: boolean);
begin
  FChangePrice := Value;
end;

procedure TfrmWTMaintCustWTGroupPrices.edtMarkupPercentageEnter(
  Sender: TObject);
begin
  FChangeMarkupRate := true;

end;

procedure TfrmWTMaintCustWTGroupPrices.edtMarkupPercentageExit(
  Sender: TObject);
begin
  FChangeMarkupRate := false;
end;

procedure TfrmWTMaintCustWTGroupPrices.SetChangeMarkupRate(
  const Value: boolean);
begin
  FChangeMarkupRate := Value;
end;

procedure TfrmWTMaintCustWTGroupPrices.SetActivated(const Value: boolean);
begin
  FActivated := Value;
end;

procedure TfrmWTMaintCustWTGroupPrices.SetMarkup(const Value: double);
begin
  FMarkup := Value;
  edtMarkupPercentage.text := formatfloat('0.00',FMarkup);
end;

end.
