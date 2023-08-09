unit wtMaintEdgeDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, CRControls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintEdgeDetails = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    edtmnyCost: TCREditMoney;
    edtmnySell: TCREditMoney;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    dblkpDescription: TDBLookupComboBox;
    lkpEdges: TFDQuery;
    srclkpEdges: TDataSource;
    btnEdges: TBitBtn;
    qryAdd: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure btnEdgesClick(Sender: TObject);
    procedure dblkpDescriptionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  frmWTMaintEdgeDetails: TfrmWTMaintEdgeDetails;

implementation

uses wtDataModule, wtLUEdges, WTLUEdgeDetails, wtMain;

{$R *.dfm}

procedure TfrmWTMaintEdgeDetails.btnOKClick(Sender: TObject);
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

      with qryAdd do
        begin
          Close;
          parambyname('Edge_Profile').asinteger := dblkpDescription.KeyValue;
          parambyname('Edge_Type').asinteger := self.EdgeType;
          parambyname('Material_Type').asinteger := self.MaterialType;

          paramByName('Price_Pointer').Asinteger := PricePointer;
          ExecSQL;
        end;

	    dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 3;
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := StrToFloatDef(edtmnySell.text, 0, FormatSettings);
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
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
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 3;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := StrToFloatDef(edtmnySell.text, 0, FormatSettings);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
    end;
end;

procedure TfrmWTMaintEdgeDetails.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;

  if Value = 'C' then
    begin
      dblkpDescription.Enabled := false;
      btnEdges.Enabled := false;
    end;

end;

procedure TfrmWTMaintEdgeDetails.EnableOK(Sender: TObject);
begin
  btnOK.enabled := dblkpDescription.text <> '';
end;

procedure TfrmWTMaintEdgeDetails.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWTMaintEdgeDetails.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintEdgeDetails.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  edtmnySell.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmWTMaintEdgeDetails.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintEdgeDetails.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TfrmWTMaintEdgeDetails.btnEdgesClick(Sender: TObject);
begin
  frmWtLUEdges := TfrmWtLUEdges.create(application);
  try
    frmWtLUEdges.showmodal;
  finally
    frmWtLUEdges.free;
  end;

  with lkpEdges do
    begin
      close;
      parambyname('Material_Type').asinteger := MaterialType;
      parambyname('Edge_Type').AsInteger := EdgeType;
      open;
    end;
end;

procedure TfrmWTMaintEdgeDetails.dblkpDescriptionClick(Sender: TObject);
begin
  enableok(self);
end;

procedure TfrmWTMaintEdgeDetails.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      with lkpEdges do
      begin
        close;
        parambyname('Material_Type').asinteger := MaterialType;
        parambyname('Edge_Type').AsInteger := EdgeType;
        open;
      end;
      dblkpDescription.keyvalue := 0;
      dblkpDescription.SetFocus;
    end
  else
    begin
      with lkpEdges do
      begin
        close;
        parambyname('Material_Type').asinteger := 0;
        parambyname('Edge_Type').AsInteger := 0;
        open;
      end;
      dblkpDescription.keyvalue := frmwtLUEdgeDetails.dbgDetails.datasource.dataset.fieldbyname('edge_profile').asinteger;
    end;
  EnableOK(self);

end;

end.
