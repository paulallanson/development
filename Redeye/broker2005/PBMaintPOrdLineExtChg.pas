unit PBMaintPOrdLineExtChg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Spin, ExtCtrls,
  PBPOObjects, contnrs;

type
  TPBMaintPOrdLineExtChgFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    POrdLabel: TLabel;
    Label9: TLabel;
    CostMemo: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    PriceMemo: TMemo;
    DetailsEdit: TEdit;
    dblkpVatRate: TDBLookupComboBox;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure VATDBLCBClick(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure btnLUAddChargeClick(Sender: TObject);
  private
    FExtraCharge: TExtraCharge;
    FFuncMode: Char;
    sOldValue: string;
    sDescName: string;
  public
    bOK: Boolean;
    ChargeList: TObjectList;
    property ExtraCharge: TExtraCharge read FExtraCharge
      write FExtraCharge;
    property FuncMode: Char read FFuncMode write FFuncMode;
  end;

var
  PBMaintPOrdLineExtChgFrm: TPBMaintPOrdLineExtChgFrm;

implementation

uses UITypes, 
  PBLUAdHoc, PBLUSupp, PBLURep, PBLUCust, PBPODataMod, PBLUAddCharges;

{$R *.DFM}

procedure TPBMaintPOrdLineExtChgFrm.FormActivate(Sender: TObject);
begin
  bOK := False;
  if FFuncMode = poAdd then
    Caption := 'Add a new purchase order line extra charge'
  else
    if FFuncMode = poChange then
      Caption := 'Change a purchase order line extra charge'
    else
      if FFuncMode = poDelete then
        Caption := 'Delete a purchase order line extra charge'
      else
        if FFuncMode = poView then
          Caption := 'View purchase order line extra charge';
  if FFuncMode = poAdd then
  begin
    {Empty details}
    DetailsEdit.Text := '';
    CostMemo.Text := '0.00';
    PriceMemo.Text := '0.00';
    dblkpVatRate.KeyValue := ExtraCharge.VatCode;
  end
  else
    with ExtraCharge do
    begin
      {Get the apppropriate detail and display it}
      DetailsEdit.Text := Details;
      CostMemo.Text := FormatMoney(Amount);
      PriceMemo.Text := FormatMoney(QuotationPrice);
      dblkpVatRate.KeyValue := VatCode;
    end;
  POrdLabel.Caption := sDescName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := not CharInSet(FFuncMode, [poDelete, poView]);
  DelLabel.Visible := (FFuncMode = poDelete);
  OKBitBtn.Visible := (FFuncMode <> poView);
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineExtChgFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DetailsEdit.Text <> '') and
    (CostMemo.Text <> '') and
    (PriceMemo.Text <> '');
end;

procedure TPBMaintPOrdLineExtChgFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPOrdLineExtChgFrm.OKBitBtnClick(Sender: TObject);
begin
  if CharInSet(FFuncMode, [poChange, poAdd]) then
  begin
    with ExtraCharge do
    begin
      Details := DetailsEdit.Text;
      Amount := PBFloatStr(CostMemo.Text);
      QuotationPrice := PBFloatStr(PriceMemo.Text);
      VatCode := dblkpVatRate.KeyValue;
    end;
  end
  else if FFuncMode = poDelete then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
  end;
  bOK := True;
end;

procedure TPBMaintPOrdLineExtChgFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintPOrdLineExtChgFrm.VATDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPOrdLineExtChgFrm.ValidateMoney(Sender: TObject);
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

procedure TPBMaintPOrdLineExtChgFrm.btnLUAddChargeClick(Sender: TObject);
var
  x: integer;
begin
  PBLUAddChrgFrm := TPBLUAddChrgFrm.Create(Self);
  try
    PBLUAddChrgFrm.bIs_Lookup := True;
    PBLUAddChrgFrm.bAllow_Upd := False;
    PBLUAddChrgFrm.ShowModal;


    with PBLUAddChrgFrm.dbgrdDets.datasource.dataset do
    begin
      for x:=0 to pred(PBLUAddChrgFrm.dbgrdDets.SelectedRows.Count) do
      begin
        ExtraCharge := TExtraCharge.Create;
        GotoBookmark(TBookmark(PBLUAddChrgFrm.dbgrdDets.SelectedRows.Items[x]));
        ExtraCharge.Details := FieldByName('Details').asString;
        ExtraCharge.Amount := FieldByName('Amount').asFloat;
        ExtraCharge.QuotationPrice := FieldByName('Quotation_price').asFloat;
        ChargeList.Add(ExtraCharge);
      end;
      DetailsEdit.Text := FieldByName('Details').asString;
      CostMemo.Text := FloatToStr(FieldByName('Amount').asFloat);
      PriceMemo.Text := FloatToStr(FieldByName('Quotation_price').asFloat);
    end;
  finally
    PBLUAddChrgFrm.Free;
  end;

end;

end.
