unit wtMaintCustCustOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CRControls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintCustCutOut = class(TForm)
    Label1: TLabel;
    dblkpDescription: TDBLookupComboBox;
    btnCutOuts: TBitBtn;
    edtmnyCost: TCREditMoney;
    edtmnySell: TCREditMoney;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Label3: TLabel;
    lkpCutOuts: TFDQuery;
    srclkpCutOuts: TDataSource;
    qryAdd: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure btnCutOutsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FSellPrice: currency;
    FCostPrice: currency;
    FEdgeType: integer;
    FPricePointer: integer;
    FFunctionMode: string;
    FMaterialType: integer;
    FCutOut: integer;
    FGroupID: integer;
    procedure SetCostPrice(const Value: currency);
    procedure SetEdgeType(const Value: integer);
    procedure SetFunctionMode(const Value: string);
    procedure SetPricePointer(const Value: integer);
    procedure SetSellPrice(const Value: currency);
    procedure SetMaterialType(const Value: integer);
    procedure SetCutOut(const Value: integer);
    procedure SetGroupID(const Value: integer);
    { Private declarations }
  public
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property CutOut: integer read FCutOut write SetCutOut;
    property EdgeType: integer read FEdgeType write SetEdgeType;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property GroupID: integer read FGroupID write SetGroupID;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property PricePointer: integer read FPricePointer write SetPricePointer;
  end;

var
  frmWTMaintCustCutOut: TfrmWTMaintCustCutOut;

implementation

uses wtDataModule, WTLUCustCutOutDetails, wtLUCutOuts, wtMain;

{$R *.dfm}

{ TfrmWTMaintCustCutOut }

procedure TfrmWTMaintCustCutOut.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWTMaintCustCutOut.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TfrmWTMaintCustCutOut.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;

  if Value = 'C' then
    begin
      dblkpDescription.Enabled := false;
    end;
end;

procedure TfrmWTMaintCustCutOut.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintCustCutOut.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintCustCutOut.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  edtmnySell.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmWTMaintCustCutOut.btnOKClick(Sender: TObject);
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
          close;
          parambyname('Group_id').asinteger := GroupID;
          parambyname('CutOut').asinteger := dblkpDescription.keyvalue;
          parambyname('Edge_Type').asinteger := EdgeType;
          parambyname('Price_Pointer').asinteger := PricePointer;
          execsql;
        end;

      dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := date;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'Q';
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
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
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
    end;
end;

procedure TfrmWTMaintCustCutOut.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpDescription.text <> '') AND
                    (edtmnyCost.Text <> '') AND
                    (edtmnySell.Text <> '');
end;


procedure TfrmWTMaintCustCutOut.SetCutOut(const Value: integer);
begin
  FCutOut := Value;
end;

procedure TfrmWTMaintCustCutOut.SetGroupID(const Value: integer);
begin
  FGroupID := Value;
end;

procedure TfrmWTMaintCustCutOut.btnCutOutsClick(Sender: TObject);
begin
  frmWtLUCutOuts := TfrmWtLUCutOuts.create(application);
  try
    frmWtLUCutOuts.showmodal;
  finally
    frmWtLUCutOuts.free;
  end;
end;

procedure TfrmWTMaintCustCutOut.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      with lkpCutOuts do
      begin
        close;
        parambyname('Group_Id').asinteger := GroupID;
        parambyname('Edge_Type').asinteger := EdgeType;
        open;
      end;
      dblkpDescription.SetFocus;
    end
  else
    begin
      with lkpCutOuts do
      begin
        close;
        parambyname('Group_Id').asinteger := 0;
        parambyname('Edge_Type').asinteger := 0;
        open;
        dblkpDescription.keyvalue := CutOut;
      end;
    end;
  EnableOK(self);

end;

end.
