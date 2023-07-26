unit CSMaintAddChrgs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSMaintAddChrgsFrm = class(TForm)
    grpbxDetails: TGroupBox;
    lblDelete: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    lblDescription: TLabel;
    edtDescription: TEdit;
    lblCost: TLabel;
    lblCharge: TLabel;
    qryInsAddChrg: TFDQuery;
    qryUpdAddChrg: TFDQuery;
    qryDelAddChrge: TFDQuery;
    qrySelNextAddChrg: TFDQuery;
    memSell: TMemo;
    memCost: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure edtCostKeyPress(Sender: TObject; var Key: Char);
    procedure edtChargeKeyPress(Sender: TObject; var Key: Char);
    procedure memCostEnter(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateKeyPress(Sender: TObject;
  var Key: Char);
  private
    sOldValue: string;
    function getNextAddChrg():integer;
  public
    sFuncMode: string[1];
    SelCode: integer;
  end;

var
  CSMaintAddChrgsFrm: TCSMaintAddChrgsFrm;

implementation

{$R *.DFM}

procedure TCSMaintAddChrgsFrm.FormActivate(Sender: TObject);
begin
  if sFuncMode = 'A' then
    Caption := 'Add a new Additional Charge';
  if sFuncMode = 'C' then
    Caption := 'Change an Additional Charge';
  if sFuncMode = 'D' then
    Caption := 'Delete an Additional Charge';

  if sFuncMode = 'A' then
  begin
    memCost.text := '0.00';
    memSell.text := '0.00';
  end;
  {Enable or disable the buttons}
  grpbxDetails.Enabled := (sFuncMode <> 'D');
  lblDelete.Visible := (sFuncMode = 'D');
end;

function TCSMaintAddChrgsFrm.getNextAddChrg: integer;
begin
  with Self.qrySelNextAddChrg do
  begin
    Close;
    Open;
    Result := FieldByName('Last_Chrg_No').asInteger + 1;
    Close;
  end;
end;

procedure TCSMaintAddChrgsFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode = 'A' then
  begin
    with Self.qryInsAddChrg do
    begin
      SelCode := GetNextAddChrg();
      ParamByName('Additional_Charge').asInteger := SelCode;
      ParamByName('Details').asString := edtDescription.Text;
      ParamByName('Amount').asFloat := StrToFloat(memCost.text);
      ParamByName('Quotation_Price').asFloat := StrToFloat(memSell.Text);
      ExecSQL;
    end;
  end
  else if SFuncMode = 'C' then
  begin
    with Self.qryUpdAddChrg do
    begin
      ParamByName('Details').asString := edtDescription.Text;
      ParamByName('Amount').asFloat := StrToFloat(memCost.Text);
      ParamByName('Quotation_Price').asFloat := StrToFloat(memSell.Text);
      ParamByName('Additional_Charge').asInteger := SelCode;
      ExecSQL;
    end;
  end
  else
  begin
    with Self.qryDelAddChrge do
    begin
      ParamByName('Additional_charge').asInteger := SelCode;
      ExecSQL;
    end;
  end;
end;

procedure TCSMaintAddChrgsFrm.edtCostKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
    VK_DECIMAL	: ;
    Ord('.'): ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TCSMaintAddChrgsFrm.edtChargeKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
    VK_DECIMAL	: ;
    Ord('.'): ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TCSMaintAddChrgsFrm.memCostEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TCSMaintAddChrgsFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TCSMaintAddChrgsFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TCSMaintAddChrgsFrm.ValidateKeyPress(Sender: TObject;
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

procedure TCSMaintAddChrgsFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtDescription.Text <> '') and
    (memCost.text <> '') and
    (memsell.text <> '');
end;

end.
