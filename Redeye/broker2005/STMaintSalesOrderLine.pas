unit STMaintSalesOrderLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, STSOObjects, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSTMaintSalesOrderLine = class(TForm)
    Panel1: TPanel;
    pnlDetails: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    memProduced: TMemo;
    memPrice: TMemo;
    memPackSize: TMemo;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edtProductCode: TEdit;
    edtDescription: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    memQuantity: TMemo;
    Label2: TLabel;
    memOvers: TMemo;
    Label9: TLabel;
    memReturns: TMemo;
    Label10: TLabel;
    memWastage: TMemo;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SaveMemoField(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure memProducedChange(Sender: TObject);
    procedure memReturnsChange(Sender: TObject);
    procedure memProducedKeyPress(Sender: TObject; var Key: Char);
    procedure memReturnsKeyPress(Sender: TObject; var Key: Char);
    procedure memPriceKeyPress(Sender: TObject; var Key: Char);
    procedure memPackSizeKeyPress(Sender: TObject; var Key: Char);
  private
    sOldValue: string;
    FActivated: boolean;
    procedure ShowDetails;
    procedure CalculateWastageQty;
  public
    Mode: char;
    OrderLine: TOrderLine;
  end;

var
  frmSTMaintSalesOrderLine: TfrmSTMaintSalesOrderLine;

implementation

uses CCSCommon;

{$R *.dfm}

procedure TfrmSTMaintSalesOrderLine.FormActivate(Sender: TObject);
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

procedure TfrmSTMaintSalesOrderLine.ShowDetails;
begin
  memQuantity.text := floattostr(OrderLine.OrdQty);
  memOvers.text := floattostr(OrderLine.OversQty);
  memProduced.text := floattostr(OrderLine.ProducedQty);

  memReturns.text := floattostr(OrderLine.ReturnsQty);
  memWastage.text := floattostr(OrderLine.DelQty - (OrderLine.ProducedQty + OrderLine.ReturnsQty));

  memPrice.Text := formatfloat('0.000',OrderLine.Sell_Price);
  memPackSize.text := inttostr(OrderLine.SellPackQuantity);

  edtDescription.text := '';
  edtProductCode.text := OrderLine.Part;
end;

procedure TfrmSTMaintSalesOrderLine.btnOKClick(Sender: TObject);
begin
  if strtoint(memWastage.Text) < 0 then
    begin
      messagedlg('It is not possible to have a negative wastage quantity, please review the Produced and Return to Stock quantities.', mtError, [mbOk], 0);
      exit;
    end;
  OrderLine.ProducedQty := strtoint(memProduced.text);
  OrderLine.ReturnsQty := strtoint(memReturns.text);
  OrderLine.WasteQty := strtoint(memWastage.text);
  OrderLine.Sell_Price := StrToFloatDef(memPrice.text, 0, FormatSettings);
  OrderLine.SellPackQuantity := strtoint(memPackSize.text);
  ModalResult := mrOK;
end;

procedure TfrmSTMaintSalesOrderLine.CalculateWastageQty;
begin
  try
    memWastage.text := inttostr(OrderLine.DelQty - (strtoint(memProduced.text) + strtoint(memReturns.text)));
  except
    memWastage.Text := '0';
  end;
end;

procedure TfrmSTMaintSalesOrderLine.memProducedChange(Sender: TObject);
begin
  CalculateWastageQty;
  EnableOK(self);
end;

procedure TfrmSTMaintSalesOrderLine.memReturnsChange(Sender: TObject);
begin
  CalculateWastageQty;
  enableOK(self);
end;

procedure TfrmSTMaintSalesOrderLine.memProducedKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TfrmSTMaintSalesOrderLine.memReturnsKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TfrmSTMaintSalesOrderLine.memPriceKeyPress(Sender: TObject;
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

procedure TfrmSTMaintSalesOrderLine.memPackSizeKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TfrmSTMaintSalesOrderLine.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (memProduced.Text <> '') and
                    (memReturns.Text <> '') and
                    (memPrice.Text <> '') and
                    (memPackSize.Text <> '');
end;

procedure TfrmSTMaintSalesOrderLine.SaveMemoField(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmSTMaintSalesOrderLine.ValidateMoney(Sender: TObject);
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


end.
