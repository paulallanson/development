unit WTMaintMaterialTypeUpstands;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, Buttons, CRControls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintMaterialTypeUpstands = class(TForm)
    Label4: TLabel;
    Label3: TLabel;
    edtmnyCost: TCREditMoney;
    edtmnySell: TCREditMoney;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    qryUpdUpstand: TFDQuery;
    edtDescription: TEdit;
    qryAddUpstand: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
  private
    FSellPrice: currency;
    FCostPrice: currency;
    FPricePointer: integer;
    FWorktopType: integer;
    FFunctionMode: string;
    procedure SetCostPrice(const Value: currency);
    procedure SetFunctionMode(const Value: string);
    procedure SetPricePointer(const Value: integer);
    procedure SetSellPrice(const Value: currency);
    procedure SetWorktopType(const Value: integer);
    { Private declarations }
  public
    property WorktopType: integer read FWorktopType write SetWorktopType;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property PricePointer: integer read FPricePointer write SetPricePointer;
  end;

var
  frmWTMaintMaterialTypeUpstands: TfrmWTMaintMaterialTypeUpstands;

implementation

uses wtMaintMaterialType, wtDataModule;

{$R *.dfm}

procedure TfrmWTMaintMaterialTypeUpstands.btnOKClick(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
	    dtmdlWorktops.qryNewPrice.Close;
      dtmdlWorktops.qryNewPrice.Open;
      PricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

      dtmdlWorktops.qryAddPointer.Close;
      dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'E';
	    dtmdlWorktops.qryAddPointer.ExecSQl;

      with qryAddUpstand do
        begin
          close;
          parambyname('Description').asstring := trim(edtDescription.text);
          parambyname('Worktop_Type').asinteger := WorktopType;
          parambyName('inactive').asstring := 'N';
          parambyName('Price_Pointer').asinteger := PricePointer;
          execsql;
        end;

	    dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := date;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'Q';
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := StrToFloatDef(edtmnySell.text, 0, FormatSettings);
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := 1;
	    dtmdlWorktops.qryAddPrice.execSQL;
    end
  else
    begin
      if (StrToFloatDef(edtmnySell.text, 0, FormatSettings) <> SellPrice) or
         (StrToFloatDef(edtmnyCost.text, 0, FormatSettings) <> CostPrice) then
      begin
	      dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := StrToFloatDef(edtmnySell.text, 0, FormatSettings);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 3;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := 1;
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
      with qryUpdUpstand do
        begin
          close;
          parambyname('Price_Pointer').asinteger := PricePointer;
          parambyname('Description').asstring := trim(edtDescription.text);
          execsql;
        end;
    end;
end;

procedure TfrmWTMaintMaterialTypeUpstands.SetCostPrice(
  const Value: currency);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWTMaintMaterialTypeUpstands.SetFunctionMode(
  const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWTMaintMaterialTypeUpstands.SetPricePointer(
  const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintMaterialTypeUpstands.SetSellPrice(
  const Value: currency);
begin
  FSellPrice := Value;
  edtmnySell.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmWTMaintMaterialTypeUpstands.SetWorktopType(
  const Value: integer);
begin
  FWorktopType := Value;
end;

procedure TfrmWTMaintMaterialTypeUpstands.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      edtDescription.SetFocus;
    end;
  EnableOK(self);
end;

procedure TfrmWTMaintMaterialTypeUpstands.EnableOK(Sender: TObject);
begin
  btnOK.enabled := edtDescription.text <> '';
end;

procedure TfrmWTMaintMaterialTypeUpstands.edtDescriptionChange(
  Sender: TObject);
begin
  enableok(self);
end;

end.
