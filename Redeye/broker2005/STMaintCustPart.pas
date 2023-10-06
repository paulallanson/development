unit STMaintCustPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintCustPartFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    edtProduct: TEdit;
    edtDescr: TEdit;
    btnCustomer: TBitBtn;
    edtCustomer: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtProductCode: TEdit;
    memSellPrice: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    memPackSize: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UnitFactorEditChange(Sender: TObject);
    procedure UnitFactorEditKeyPress(Sender: TObject; var Key: Char);
    procedure btnCustomerClick(Sender: TObject);
    procedure memSellPriceKeyPress(Sender: TObject; var Key: Char);
    procedure memSellPriceEnter(Sender: TObject);
    procedure memSellPriceExit(Sender: TObject);
    procedure memPackSizeExit(Sender: TObject);
  private
    sOldValue: string;
  public
    sFuncMode: string[1];
    iCust: integer;
    sCode, sDescr, sCustomer: string;
  end;

var
  STMaintCustPartFrm: TSTMaintCustPartFrm;

implementation

uses UITypes, STLUCustPart, ComObj, ActiveX, CCSCommon, PBLUCust;

{$R *.DFM}

procedure TSTMaintCustPartFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  edtProduct.text := sCode;
  edtdescr.text := sDescr;
  if sFuncMode = 'A' then
    Caption := 'Add new Customer product details';
  if sFuncMode = 'C' then
    Caption := 'Change Customer product details';
  if sFuncMode = 'D' then
    Caption := 'Delete Customer product details';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    edtCustomer.Text := '';
    edtProductCode.Text := '';
    sCustomer := '';
    memSellPrice.text := '0.00';
    memPackSize.text := '1';
  end
  else
  begin
    btnCustomer.enabled := false;
    with STLUCustPartFrm.DetsSRC.DataSet do
    begin
      iCust := FieldByName('Customer').asinteger;
      edtCustomer.Text := FieldByName('Customer_Name').AsString;
      edtProductCode.Text := FieldByName('Customer_Part_Code').AsString;
      sCustomer := FieldByName('Customer_Name').AsString;
      memSellPrice.text := formatfloat('0.00',(fieldbyname('Sell_Price').asfloat));
      memPackSize.text := formatfloat('0',(fieldbyname('Sell_Pack_Quantity').asfloat));
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
end;

procedure TSTMaintCustPartFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtCustomer.Text <> '');
end;

procedure TSTMaintCustPartFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSTMaintCustPartFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintCustPartFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintCustPartFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      begin
        with AddSQL do
          begin
            close;
            Parambyname('Customer').asinteger := iCust;
            ParamByName('Part').Asstring := sCode;
            ParamByName('Customer_Part_Code').AsString := edtProductCode.Text + '';
            parambyname('Sell_Price').asfloat := StrToFloatDef(memSellPrice.text, 0, FormatSettings);
            parambyname('Sell_PAck_Quantity').asinteger := strtoint(memPackSize.text);
            ExecSQL;
          end;
      end;
    with UpdSQL do
    begin
      Parambyname('Customer').asinteger := iCust;
      ParamByName('Part').Asstring := sCode;
      ParamByName('Customer_Part_Code').AsString := edtProductCode.Text + '';
      parambyname('Sell_Price').asfloat := StrToFloatDef(memSellPrice.text, 0, FormatSettings);
      parambyname('Sell_PAck_Quantity').asinteger := strtoint(memPackSize.text);
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with DelSQL do
      begin
        Close;
        ParamByName('Part').Asstring := sCode;
        ParamByName('Customer').Asinteger := iCust;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TSTMaintCustPartFrm.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintCustPartFrm.UnitFactorEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TSTMaintCustPartFrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_LookUp := True ;
    PBLUCustFrm.bAllow_Upd := True ;
    PBLUCustFrm.bSel_Branch := false ;
    PBLUCustFrm.SelCode := iCust;
    PBLUCustFrm.ShowModal;
    If PBLUCustFrm.Selected then
      begin
        iCust := PBLUCustFrm.SelCode;
        edtCustomer.Text := PBLUCustFrm.SelName;
        sCustomer := PBLUCustFrm.SelName;
      end;
  finally
    PBLUCustFrm.Free;
  end;
  CheckOK(Self) ;
end;

procedure TSTMaintCustPartFrm.memSellPriceKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
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

procedure TSTMaintCustPartFrm.memSellPriceEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TSTMaintCustPartFrm.memSellPriceExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  if trim((Sender as TMemo).Text) = '' then
    (Sender as TMemo).Text := '0.00';
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TSTMaintCustPartFrm.memPackSizeExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate integer on exit}
  if trim((Sender as TMemo).Text) = '' then
    (Sender as TMemo).Text := '1';
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;

end;

end.
