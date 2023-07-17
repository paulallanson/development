unit wtMaintCutOutDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, CRControls, Buttons, DBCtrls, QrCtrls;

type
  TfrmWTMaintCutOutDetails = class(TForm)
    Label1: TLabel;
    dblkpDescription: TDBLookupComboBox;
    btnCutOuts: TBitBtn;
    edtmnyCost: TCREditMoney;
    Label4: TLabel;
    Label3: TLabel;
    edtmnySell: TCREditMoney;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    lkpCutOuts: TQuery;
    srclkpCutOuts: TDataSource;
    qryAdd: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure btnCutOutsClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FSellPrice: currency;
    FCostPrice: currency;
    FMaterialType: integer;
    FPricePointer: integer;
    FEdgeType: integer;
    FFunctionMode: string;
    procedure SetCostPrice(const Value: currency);
    procedure SetEdgeType(const Value: integer);
    procedure SetFunctionMode(const Value: string);
    procedure SetMaterialType(const Value: integer);
    procedure SetPricePointer(const Value: integer);
    procedure SetSellPrice(const Value: currency);
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
  frmWTMaintCutOutDetails: TfrmWTMaintCutOutDetails;

implementation

uses wtDataModule, wtLUCutOuts, wtLUCutOutDetails, wtMain;

{$R *.dfm}

procedure TfrmWTMaintCutOutDetails.btnOKClick(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
	    dtmdlWorktops.qryNewPrice.Close;
      dtmdlWorktops.qryNewPrice.Open;
      PricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

      dtmdlWorktops.qryAddPointer.Close;
      dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'C';
	    dtmdlWorktops.qryAddPointer.ExecSQl;

      with qryAdd do
        begin
          Close;
          parambyname('Cutout').asinteger := dblkpDescription.KeyValue;
          parambyname('Edge_Type').asinteger := self.EdgeType;
          parambyname('Material_Type').asinteger := self.MaterialType;
          paramByName('Price_Pointer').Asinteger := PricePointer;
          ExecSQL;
        end;

	    dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'Q';
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
	    dtmdlWorktops.qryAddPrice.execSQL;
    end
  else
    begin
      if (strtofloat(edtmnySell.text) <> SellPrice) or
         (strtofloat(edtmnyCost.text) <> CostPrice) then
      begin
	      dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'Q';
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
    end;

end;

procedure TfrmWTMaintCutOutDetails.EnableOK(Sender: TObject);
begin
  btnOK.enabled := dblkpDescription.text <> '';
end;

procedure TfrmWTMaintCutOutDetails.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWTMaintCutOutDetails.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TfrmWTMaintCutOutDetails.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
  if Value = 'C' then
    begin
      dblkpDescription.Enabled := false;
      btnCutOuts.Enabled := false;
    end;
end;

procedure TfrmWTMaintCutOutDetails.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintCutOutDetails.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintCutOutDetails.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  edtmnySell.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmWTMaintCutOutDetails.btnCutOutsClick(Sender: TObject);
begin
  frmWtLUCutOuts := TfrmWtLUCutOuts.create(application);
  try
    frmWtLUCutOuts.showmodal;
  finally
    frmWtLUCutOuts.free;
  end;
  
  with lkpCutOuts do
    begin
      close;
      parambyname('Material_Type').asinteger := MaterialType;
      parambyname('Edge_Type').AsInteger := EdgeType;
      open;
    end;
end;

procedure TfrmWTMaintCutOutDetails.FormActivate(Sender: TObject);
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
      dblkpDescription.keyvalue := 0;
      dblkpDescription.SetFocus;
    end
  else
    begin
      with lkpCutOuts do
      begin
        close;
        parambyname('Material_Type').asinteger := 0;
        parambyname('Edge_Type').asinteger := 0;
        open;
      end;
      dblkpDescription.keyvalue := frmwtLUCutOutDetails.dbgDetails.datasource.dataset.fieldbyname('Cutout').asinteger;
    end;
  EnableOK(self);

end;

end.
