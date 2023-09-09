(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Sales Invoice  Extra Charges form.

 ***************************************************************)

unit STMaintPOExtChg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Spin, ExtCtrls,
  STPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintPOExtChgFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label3: TLabel;
    POrdLabel: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    CostMemo: TMemo;
    DetailsEdit: TEdit;
    Label5: TLabel;
    VATDBLookupComboBox: TDBLookupComboBox;
    VATsDataSource: TDataSource;
    GetVatsQuery: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure VATDBLCBClick(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FExtraCharge: TExtraCharge;
    FFuncMode: Char;
    sOldValue: string;
    sDescName: string;
    fInvorOrd: Char;
  public
    bOK: Boolean;
    property ExtraCharge: TExtraCharge read FExtraCharge
      write FExtraCharge;
    property FuncMode: Char read FFuncMode write FFuncMode;
    property InvorOrd: Char read fInvorOrd write fInvorOrd;
  end;

var
  STMaintPOExtChgFrm: TSTMaintPOExtChgFrm;

implementation

uses
  System.UITypes,
  STPODataMod;

{$R *.DFM}

procedure TSTMaintPOExtChgFrm.FormActivate(Sender: TObject);
var
Title : string;
begin
  bOK := False;
  if fInvOrOrd <> 'O' then
    title := 'Invoice'
  else
    title := 'Order';

  if FFuncMode = poAdd then
    Caption := 'Add a new Purchase '+title+' extra charge'
  else
    if FFuncMode = poChange then
      Caption := 'Change a Purchase '+title+' extra charge'
    else
      if FFuncMode = poDelete then
        Caption := 'Delete a Purchase '+title+' extra charge'
      else
        if FFuncMode = poView then
          Caption := 'View Purchase '+title+' extra charge';
  if FFuncMode = poAdd then
  begin
    {Empty details}
    DetailsEdit.Text := '';
    CostMemo.Text := '0.00';
  end
  else
    with ExtraCharge do
    begin
      {Get the apppropriate detail and display it}
      DetailsEdit.Text := Details;
      CostMemo.Text := FormatMoney(Amount);
      VatDBLookUpComboBox.KeyValue := VatCode;
    end;
  POrdLabel.Caption := sDescName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := not (FFuncMode in [poDelete, poView]);
  DelLabel.Visible := (FFuncMode = poDelete);
  OKBitBtn.Visible := (FFuncMode <> poView);
  CheckOK(Self);
end;

procedure TSTMaintPOExtChgFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DetailsEdit.Text <> '') and
    (CostMemo.Text <> '')  and (VATDBLookupComboBox.KeyValue <> 0);
end;

procedure TSTMaintPOExtChgFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSTMaintPOExtChgFrm.OKBitBtnClick(Sender: TObject);
begin
  if FFuncMode in [poAdd, poChange] then
  begin
    with ExtraCharge do
    begin
      Details := DetailsEdit.Text;
      Amount := StrToFloatDef(CostMemo.Text, 0, FormatSettings);
      VatCode := VatDBLookupComboBox.KeyValue;
      Vat := Amount * (STPODM.GetVatRate(VatCode)/100);
      if FFuncMode = poAdd then
      begin
        Nominal := STPODM.GetPODefNom();
      end;
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

procedure TSTMaintPOExtChgFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TSTMaintPOExtChgFrm.VATDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintPOExtChgFrm.ValidateMoney(Sender: TObject);
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

procedure TSTMaintPOExtChgFrm.FormCreate(Sender: TObject);
begin
 ExtraCharge := TExtraCharge.Create;
 with GetVatsQuery do
  begin
    Close;
    Open;
  end;
end;

end.
