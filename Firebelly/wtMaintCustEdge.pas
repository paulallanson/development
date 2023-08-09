unit wtMaintCustEdge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CRControls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintCustEdge = class(TForm)
    Label1: TLabel;
    dblkpDescription: TDBLookupComboBox;
    btnCutOuts: TBitBtn;
    edtmnyCost: TCREditMoney;
    edtmnySell: TCREditMoney;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Label3: TLabel;
    lkpEdges: TFDQuery;
    srclkpEdges: TDataSource;
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
    FGroupID: integer;
    FEdgeProfile: integer;
    procedure SetCostPrice(const Value: currency);
    procedure SetEdgeType(const Value: integer);
    procedure SetFunctionMode(const Value: string);
    procedure SetPricePointer(const Value: integer);
    procedure SetSellPrice(const Value: currency);
    procedure SetMaterialType(const Value: integer);
    procedure SetGroupID(const Value: integer);
    procedure SetEdgeProfile(const Value: integer);
    { Private declarations }
  public
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property EdgeProfile: integer read FEdgeProfile write SetEdgeProfile;
    property EdgeType: integer read FEdgeType write SetEdgeType;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property GroupID: integer read FGroupID write SetGroupID;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property PricePointer: integer read FPricePointer write SetPricePointer;
  end;

var
  frmWTMaintCustEdge: TfrmWTMaintCustEdge;

implementation

uses wtDataModule, wtLUEdges, wtMain;

{$R *.dfm}

{ TfrmWTMaintCustCutOut }

procedure TfrmWTMaintCustEdge.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWTMaintCustEdge.SetEdgeType(const Value: integer);
begin
  FEdgeType := Value;
end;

procedure TfrmWTMaintCustEdge.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;

  if Value = 'C' then
    begin
      dblkpDescription.Enabled := false;
    end;
end;

procedure TfrmWTMaintCustEdge.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintCustEdge.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintCustEdge.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  edtmnySell.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmWTMaintCustEdge.btnOKClick(Sender: TObject);
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
          parambyname('Edge_Profile').asinteger := dblkpDescription.keyvalue;
          parambyname('Edge_Type').asinteger := EdgeType;
          parambyname('Price_Pointer').asinteger := PricePointer;
          execsql;
        end;

      dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := date;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := StrToFloatDef(edtmnySell.text, 0, FormatSettings);
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 3;
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
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
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
    end;
end;

procedure TfrmWTMaintCustEdge.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpDescription.text <> '') AND
                    (edtmnyCost.Text <> '') AND
                    (edtmnySell.Text <> '');
end;


procedure TfrmWTMaintCustEdge.SetGroupID(const Value: integer);
begin
  FGroupID := Value;
end;

procedure TfrmWTMaintCustEdge.btnCutOutsClick(Sender: TObject);
begin
  frmWtLUEdges := TfrmWtLUEdges.create(application);
  try
    frmWtLUEdges.showmodal;
  finally
    frmWtLUEdges.free;
  end;
end;

procedure TfrmWTMaintCustEdge.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      with lkpEdges do
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
      with lkpEdges do
      begin
        close;
        parambyname('Group_Id').asinteger := 0;
        parambyname('Edge_Type').asinteger := 0;
        open;
        dblkpDescription.keyvalue := EdgeProfile;
      end;
    end;
  EnableOK(self);

end;

procedure TfrmWTMaintCustEdge.SetEdgeProfile(const Value: integer);
begin
  FEdgeProfile := Value;
end;

end.
