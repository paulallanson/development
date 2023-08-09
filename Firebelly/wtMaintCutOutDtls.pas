unit wtMaintCutOutDtls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtMaintEdgeDetails, DBCtrls, StdCtrls, Buttons, CRControls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintCutOutDtls = class(TfrmWTMaintEdgeDetails)
    lkpCutOuts: TFDQuery;
    srclkpCutOuts: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEdgesClick(Sender: TObject);
  private
    FFunctionMode: string;
    FSellPrice: currency;
    FCostPrice: currency;
    FPricePointer: integer;
    FMaterialType: integer;
    FEdgeType: integer;
    procedure SetFunctionMode(const Value: string);
    procedure SetCostPrice(const Value: currency);
    procedure SetPricePointer(const Value: integer);
    procedure SetSellPrice(const Value: currency);
    procedure SetMaterialType(const Value: integer);
    procedure SetEdgeType(const Value: integer);
    { Private declarations }
  public
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property EdgeType: integer read FEdgeType write SetEdgeType;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property PricePointer: integer read FPricePointer write SetPricePointer;
  end;

var
  frmWTMaintCutOutDtls: TfrmWTMaintCutOutDtls;

implementation

uses wtLUCutOutDtls, wtDataModule, wtLUCutOuts;

{$R *.dfm}

procedure TfrmWTMaintCutOutDtls.btnOKClick(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      frmwtLUCutOutDtls.tblCOutThickness.Post;
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := StrToFloatDef(edtmnySell.text, 0, FormatSettings);
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
	    dtmdlWorktops.qryAddPrice.execSQL;
    end
  else
    begin
      if (StrToFloatDef(edtmnySell.text) <> SellPrice, 0, FormatSettings) or
         (StrToFloatDef(edtmnyCost.text) <> CostPrice, 0, FormatSettings) then
      begin
	      dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'Q';
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := StrToFloatDef(edtmnySell.text, 0, FormatSettings);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := 1;
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
    end;
end;

procedure TfrmWTMaintCutOutDtls.BitBtn2Click(Sender: TObject);
begin
  frmwtLUCutOutDtls.tblCOutThickness.cancel;
end;

procedure TfrmWTMaintCutOutDtls.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;

  if Value = 'A' then
    begin
      frmwtLUCutOutDtls.tblCOutThickness.Insert;
    end
  else
  if Value = 'C' then
    begin
      dblkpDescription.Enabled := false;
    end;

end;

procedure TfrmWTMaintCutOutDtls.FormShow(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      with lkpCutOuts do
      begin
        close;
        parambyname('Material_Type').asinteger := MaterialType;
        parambyname('Edge_Type').asinteger := EdgeType;
        open;
      end;
    end
  else
    begin
      with lkpCutOuts do
      begin
        close;
        parambyname('Material_Type').asinteger := 0;
        parambyname('Edge_Type').asinteger := 0;
        open;
        dblkpDescription.keyvalue := frmWtLUCutOutDtls.dbgDetails.datasource.dataset.fieldbyname('Cutout').asinteger;
      end;
    end;

  EnableOK(self);
end;

procedure TfrmWTMaintCutOutDtls.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWTMaintCutOutDtls.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintCutOutDtls.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  edtmnySell.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmWTMaintCutOutDtls.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintCutOutDtls.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TfrmWTMaintCutOutDtls.btnEdgesClick(Sender: TObject);
begin
  frmWtLUCutOuts := TfrmWtLUCutOuts.create(application);
  try
    frmWtLUCutOuts.showmodal;
  finally
    frmWtLUCutOuts.free;
  end;
  FormShow(self);
end;

end.
