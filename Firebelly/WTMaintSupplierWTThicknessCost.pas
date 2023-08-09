unit WTMaintSupplierWTThicknessCost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CRControls, Buttons, FireDAC.Stan.Param;

type
  TfrmWTMaintSupplierWTThicknessCost = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblWorktop: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    edtmnyCost: TCREditMoney;
    Label7: TLabel;
    lblSupplierName: TLabel;
    lblThickness: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    FCostPrice: double;
    FPricePointer: integer;
    procedure SetCostPrice(const Value: double);
    procedure SetPricePointer(const Value: integer);
    { Private declarations }
  public
    bOK: boolean;
    property CostPrice: double read FCostPrice write SetCostPrice;
    property PricePointer: integer read FPricePointer write SetPricePointer;
  end;

var
  frmWTMaintSupplierWTThicknessCost: TfrmWTMaintSupplierWTThicknessCost;

implementation

uses wtDataModule, wtMain;

{$R *.dfm}

procedure TfrmWTMaintSupplierWTThicknessCost.btnOKClick(Sender: TObject);
var
  iPricePointer: integer;
begin
  if (StrToFloatDef(edtmnyCost.text, 0, FormatSettings) <> CostPrice) then
    begin
	    dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := self.PricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := 0.00;
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
	    dtmdlWorktops.qryAddPrice.execSQL;

      bOK := true;
    end;
end;

procedure TfrmWTMaintSupplierWTThicknessCost.SetCostPrice(
  const Value: double);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWTMaintSupplierWTThicknessCost.SetPricePointer(
  const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintSupplierWTThicknessCost.BitBtn2Click(Sender: TObject);
begin
  bOK := false;
end;

end.
