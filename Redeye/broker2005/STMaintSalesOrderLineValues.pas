unit STMaintSalesOrderLineValues;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, STSOObjects, CCSCommon;

type
  TfrmSTMaintSalesOrderLineValues = class(TForm)
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edtProductCode: TEdit;
    edtDescription: TEdit;
    pnlDetails: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    memPrice: TMemo;
    memPackSize: TMemo;
    Panel1: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    memCostPackSize: TMemo;
    Label5: TLabel;
    memCost: TMemo;
    Label9: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    memInvoiced: TMemo;
    memQuantity: TMemo;
    Label1: TLabel;
    Label3: TLabel;
    memProduced: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure memProducedKeyPress(Sender: TObject; var Key: Char);
    procedure memCostEnter(Sender: TObject);
    procedure memPriceEnter(Sender: TObject);
    procedure memPriceKeyPress(Sender: TObject; var Key: Char);
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure memCostPackSizeKeyPress(Sender: TObject; var Key: Char);
    procedure memPackSizeKeyPress(Sender: TObject; var Key: Char);
  private
    sOldValue: string;
    FActivated: boolean;
    procedure ShowDetails;
  public
    Mode: char;
    OrderLine: TOrderLine;
  end;

var
  frmSTMaintSalesOrderLineValues: TfrmSTMaintSalesOrderLineValues;

implementation

{$R *.dfm}

procedure TfrmSTMaintSalesOrderLineValues.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    Caption := 'Change a Sales Order line';

    sTemp := ' Sales Order ' + IntToStr(OrderLine.OrderNo) + ' ';

    ShowDetails;
    pnlDetails.enabled := (Mode <> 'V');
    btnOk.visible := (Mode <> 'V');

    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmSTMaintSalesOrderLineValues.ShowDetails;
begin
  memQuantity.text := floattostr(OrderLine.OrdQty);
//  memProduced.text := floattostr(OrderLine.DelQty);
  memProduced.text := floattostr(OrderLine.ProducedQty);
  memInvoiced.Text := floattostr(OrderLine.InvQty);

  memPrice.Text := formatfloat('0.000',OrderLine.Sell_Price);
  memPackSize.text := inttostr(OrderLine.SellPackQuantity);

  memCost.Text := formatfloat('0.000',OrderLine.Part_Cost);
  memCostPackSize.text := inttostr(OrderLine.PurchPackQuantity);

  edtDescription.text := '';
  edtProductCode.text := OrderLine.Part;
end;

procedure TfrmSTMaintSalesOrderLineValues.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (memProduced.Text <> '') and
                    (memInvoiced.Text <> '') and
                    (memPrice.Text <> '') and
                    (memCost.Text <> '') and
                    (memCostPackSize.Text <> '') and
                    (memPackSize.Text <> '');
end;

procedure TfrmSTMaintSalesOrderLineValues.btnOKClick(Sender: TObject);
begin
  OrderLine.ProducedQty := strtoint(memProduced.text);
  OrderLine.InvQty := strtoint(memInvoiced.text);
  OrderLine.Sell_Price := strtofloat(memPrice.text);
  OrderLine.SellPackQuantity := strtoint(memPackSize.text);
  OrderLine.Part_Cost := strtofloat(memCost.text);
  OrderLine.PurchPackQuantity := strtoint(memCostPackSize.text);
  ModalResult := mrOK;
end;

procedure TfrmSTMaintSalesOrderLineValues.memProducedKeyPress(
  Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TfrmSTMaintSalesOrderLineValues.memCostEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmSTMaintSalesOrderLineValues.memPriceEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmSTMaintSalesOrderLineValues.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TfrmSTMaintSalesOrderLineValues.memPriceKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfrmSTMaintSalesOrderLineValues.memCostPackSizeKeyPress(
  Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TfrmSTMaintSalesOrderLineValues.memPackSizeKeyPress(
  Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TfrmSTMaintSalesOrderLineValues.ValidateQty(Sender: TObject);
var
  TempStr: string;
  lifeExp: integer;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if (TempStr = 'X') or (TempStr = '0') then
  begin
    (Sender as TMemo).Text := sOldValue;
    If (Sender as TMemo).Enabled then
        (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

end.
