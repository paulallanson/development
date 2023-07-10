unit WTMaintWTThickness;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, CRControls, DB, DBTables, gtQrCtrls;

type
  TfrmWTMaintWTThickness = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dblkpThickness: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    edtmnyCost: TCREditMoney;
    edtmnySell: TCREditMoney;
    Label5: TLabel;
    Label6: TLabel;
    lkpThickness: TQuery;
    srclkpThickness: TDataSource;
    lblWorktop: TLabel;
    chkbxInactive: TCheckBox;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EnableOK(Sender: TObject);
  private
    FFunctionMode: string;
    FSellPrice: currency;
    FCostPrice: currency;
    FPricePointer: integer;
    FWorktop: integer;
    procedure SetFunctionMode(const Value: string);
    procedure SetSellPrice(const Value: currency);
    procedure SetCostPrice(const Value: currency);
    procedure SetPricePointer(const Value: integer);
    procedure SetWorktop(const Value: integer);
    { Private declarations }
  public
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property PricePointer: integer read FPricePointer write SetPricePointer;
    property Worktop: integer read FWorktop write SetWorktop;
  end;

var
  frmWTMaintWTThickness: TfrmWTMaintWTThickness;

implementation

uses wtLUWTThickness, wtDataModule, wtMain;

{$R *.DFM}

{ TfrmWTMaintWTThickness }

procedure TfrmWTMaintWTThickness.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;

  if Value = 'C' then
    Begin
      dblkpThickness.Enabled := false;
    end;
end;

procedure TfrmWTMaintWTThickness.btnOKClick(Sender: TObject);
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
          parambyname('Worktop').asinteger := self.Worktop;
          parambyname('Thickness').asinteger := dblkpThickness.KeyValue;

          paramByName('Price_Pointer').Asinteger := PricePointer;
          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
        end;

	    dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
	    dtmdlWorktops.qryAddPrice.execSQL;
    end
  else
    begin
      with qryUpdate do
        begin
          close;
          parambyname('Price_Pointer').asinteger := PricePointer;
          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';
          execSQL;
        end;
        
      if (strtofloat(edtmnySell.text) <> SellPrice) or
         (strtofloat(edtmnyCost.text) <> CostPrice) then
      begin
	      dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtmnySell.text);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtmnyCost.text);
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
    end;

end;

procedure TfrmWTMaintWTThickness.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
    with lkpThickness do
      begin
        close;
        parambyname('worktop').asinteger := worktop;
        parambyname('Thickness').asinteger := 0;
        open;
      end;
      dblkpThickness.keyvalue := 0;
    end
  else
    begin
    with lkpThickness do
      begin
        close;
        parambyname('worktop').asinteger := 0;
        parambyname('Thickness').asinteger := frmwtLUWTThickness.dbgDetails.datasource.dataset.fieldbyname('thickness').asinteger;
        open;
      end;
      dblkpThickness.keyvalue := frmwtLUWTThickness.dbgDetails.datasource.dataset.fieldbyname('thickness').asinteger;
    end;
end;

procedure TfrmWTMaintWTThickness.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  edtmnySell.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmWTMaintWTThickness.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWTMaintWTThickness.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintWTThickness.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintWTThickness.EnableOK(Sender: TObject);
begin
  btnOK.enabled := dblkpThickness.keyvalue <> 0;
end;

end.
