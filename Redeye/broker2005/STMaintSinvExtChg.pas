(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Sales Invoice  Extra Charges form.

 ***************************************************************)

unit STMaintSinvExtChg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Spin, ExtCtrls,
  STSOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintSInvExtChgFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label3: TLabel;
    SOrdLabel: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    CostMemo: TMemo;
    Label5: TLabel;
    VATDBLookupComboBox: TDBLookupComboBox;
    VATsDataSource: TDataSource;
    GetVatsQuery: TFDQuery;
    LblCst: TLabel;
    MemoCst: TMemo;
    qryAddChrgs: TFDQuery;
    cmbbxAddChrg: TComboBox;
    btnLUAddChrg: TButton;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure VATDBLCBClick(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbbxAddChrgClick(Sender: TObject);
    procedure btnLUAddChrgClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FExtraCharge: TExtraCharge;
    FFuncMode: Char;
    sOldValue: string;
    sDescName: string;
    fInvorOrd: Char;
    procedure BuildAddChrgList;
  public
    bOK: Boolean;
    property ExtraCharge: TExtraCharge read FExtraCharge
      write FExtraCharge;
    property FuncMode: Char read FFuncMode write FFuncMode;
    property InvorOrd: Char read fInvorOrd write fInvorOrd;
  end;

var
  STMaintSInvExtChgFrm: TSTMaintSInvExtChgFrm;

implementation

uses STSODataMod, PBLUAddCharges;

{$R *.DFM}

procedure TSTMaintSInvExtChgFrm.FormActivate(Sender: TObject);
var
Title : string;
begin
  bOK := False;
  if fInvOrOrd <> 'O' then
    title := 'Invoice'
  else
    begin
      title := 'Order';
      LblCst.Visible := True;
      MemoCst.Visible := True;
    end;

  if FFuncMode = soAdd then
    Caption := 'Add a new Sales '+title+' extra charge'
  else
    if FFuncMode = soChange then
      Caption := 'Change a Sales '+title+' extra charge'
    else
      if FFuncMode = soDelete then
        Caption := 'Delete a Sales '+title+' extra charge'
      else
        if FFuncMode = soView then
          Caption := 'View Sales '+title+' extra charge';
  if FFuncMode = soAdd then
  begin
    {Empty details}
//    cmbbxAddChrg.Text := '';
    CostMemo.Text := '0.00';
    memoCst.Text := '0.00';
  end
  else
    with ExtraCharge do
    begin
      {Get the apppropriate detail and display it}
      cmbbxAddChrg.Text := Details;
      CostMemo.Text := FormatMoney(Amount);
      MemoCst.Text := FormatMoney(Cost);
      VatDBLookUpComboBox.KeyValue := ChgVatCode;
    end;
  SOrdLabel.Caption := sDescName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := not (FFuncMode in [soDelete, soView]);
  DelLabel.Visible := (FFuncMode = soDelete);
  OKBitBtn.Visible := (FFuncMode <> soView);
  CheckOK(Self);
end;

procedure TSTMaintSInvExtChgFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  if fInvorOrd = 'I' then
    OKBitBtn.Enabled := (cmbbxAddChrg.Text <> '') and
    (CostMemo.Text <> '') and (VATDBLookupComboBox.text <> '')
  else
  OKBitBtn.Enabled := (cmbbxAddChrg.Text <> '') and
    (CostMemo.Text <> '')  and (MemoCst.Text <> '') and (VATDBLookupComboBox.text <> '');
end;

procedure TSTMaintSInvExtChgFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSTMaintSInvExtChgFrm.OKBitBtnClick(Sender: TObject);
begin
  if FFuncMode in [soAdd, soChange] then
  begin
    with ExtraCharge do
    begin
      Details := cmbbxAddChrg.Text;
      Amount := StrToFloatDef(CostMemo.Text, 0, FormatSettings);
      Cost := StrToFloatDef(MemoCst.Text, 0, FormatSettings);
      ChgVatCode := VatDBLookupComboBox.KeyValue;
      Vat := Amount * (StrToFloatDef(StSalesOrdDM.getVatCodeVatRate(ChgVatCode), 0, FormatSettings) / 100);
    end;
  end
  else
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation,
      [mbNo, mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
  end;
  bOK := True;
end;

procedure TSTMaintSInvExtChgFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TSTMaintSInvExtChgFrm.VATDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintSInvExtChgFrm.ValidateMoney(Sender: TObject);
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

procedure TSTMaintSInvExtChgFrm.FormCreate(Sender: TObject);
begin
 with GetVatsQuery do
  begin
    Close;
    Open;
  end;
end;

procedure TSTMaintSInvExtChgFrm.cmbbxAddChrgClick(Sender: TObject);
begin
  if qryAddChrgs.Locate('details', self.cmbbxAddChrg.Text, [loCaseInsensitive]) then
  begin
    self.CostMemo.Text := FloatToStrF(qryAddChrgs.FieldByName('quotation_price').asFloat, ffFixed, 15, 2);
    self.MemoCst.Text := FloatToStrF(qryAddChrgs.FieldByName('amount').asFloat, ffFixed, 15, 2)
  end
  else
  begin
    self.CostMemo.Text := '';
  end;
end;

procedure TSTMaintSInvExtChgFrm.BuildAddChrgList;
var
  sTemp: string;
begin
  sTemp := cmbbxAddChrg.text;
  self.cmbbxAddChrg.Clear;
  with qryAddChrgs do
  begin
    close;
    open;
    while not eof do
    begin
      cmbbxAddChrg.Items.Add(fieldByName('details').asString);
      next;
    end;
  end;
  cmbbxAddChrg.Text := sTemp;
end;

procedure TSTMaintSInvExtChgFrm.btnLUAddChrgClick(Sender: TObject);
begin
  PBLUAddChrgFrm := TPBLUAddChrgFrm.Create(Self);
  try
    PBLUAddChrgFrm.bIs_Lookup := false;
    PBLUAddChrgFrm.bAllow_Upd := true;
    PBLUAddChrgFrm.ShowModal;

  finally
    PBLUAddChrgFrm.Free;
    self.BuildAddChrgList;
  end;
end;

procedure TSTMaintSInvExtChgFrm.FormShow(Sender: TObject);
begin
  self.BuildAddChrgList;
end;

end.
