unit PBMaintSuppCharges;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Spin, ExtCtrls,
  contnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSuppChargesFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label9: TLabel;
    CostMemo: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    PriceMemo: TMemo;
    DetailsEdit: TEdit;
    dblkpVatRate: TDBLookupComboBox;
    Label4: TLabel;
    qryGetNextCharge: TFDQuery;
    qryAddCharge: TFDQuery;
    qryUpdCharge: TFDQuery;
    qryVatCode: TFDQuery;
    dtsVatCode: TDataSource;
    qryDelCharge: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure VATDBLCBClick(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
  private
    FFuncMode: Char;
    sOldValue: string;
    function GetNextCharge: integer;
  public
    bOK: Boolean;
    sDetails: string;
    rCostValue, rSalesValue: real;
    iCharge, iSupplier, iVatCode: integer;
    property FuncMode: Char read FFuncMode write FFuncMode;
  end;

var
  PBMaintSuppChargesFrm: TPBMaintSuppChargesFrm;

implementation

uses UITypes, CCSCommon;

{$R *.DFM}

procedure TPBMaintSuppChargesFrm.FormActivate(Sender: TObject);
begin
  bOK := False;
  if FFuncMode = 'A' then
    Caption := 'Add a new supplier charge'
  else
    if FFuncMode = 'C' then
      Caption := 'Change a supplier charge'
    else
      if FFuncMode = 'D' then
        Caption := 'Delete a supplier charge'
      else
        if FFuncMode = 'V' then
          Caption := 'View a supplier charge';

  qryVatCode.Active := false;
  qryVatCode.Active := true;

  if FFuncMode = 'A' then
  begin
    {Empty details}
    DetailsEdit.Text := '';
    CostMemo.Text := '0.00';
    PriceMemo.Text := '0.00';
    dblkpVatRate.KeyValue := 1;
  end
  else
    {Get the apppropriate detail and display it}
  begin
    DetailsEdit.Text := sDetails;
    CostMemo.Text := FormatMoney(rCostValue);
    PriceMemo.Text := FormatMoney(rSalesValue);
    dblkpVatRate.KeyValue := iVatCode;
  end;

  {Enable or disable the buttons}
  DetsGrpBox.Enabled := not CharInSet(FFuncMode, ['D','V']);
  DelLabel.Visible := (FFuncMode = 'D');
  OKBitBtn.Visible := (FFuncMode <> 'V');
  CheckOK(Self);
end;

procedure TPBMaintSuppChargesFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DetailsEdit.Text <> '') and
    (CostMemo.Text <> '') and
    (PriceMemo.Text <> '');
end;

procedure TPBMaintSuppChargesFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintSuppChargesFrm.OKBitBtnClick(Sender: TObject);
begin
  if CharInSet(FFuncMode, ['A','C']) then
  begin
    if FFuncMode = 'A' then
      begin
        iCharge := GetNextCharge;
        with qryAddCharge do
          begin
            close;
            parambyname('Supplier').asinteger := iSupplier;
            parambyname('Charge_no').asinteger := iCharge;
            parambyname('Details').asstring := DetailsEdit.text;
            parambyname('Amount').asfloat := StrToFloatDef(CostMemo.Text, 0, FormatSettings);
            parambyname('Quotation_Price').asfloat := StrToFloatDef(PriceMemo.Text, 0, FormatSettings);
            parambyname('Vat_code').asinteger := dblkpVatRate.KeyValue;
            execsql;
          end;
      end
    else
      begin
        with qryUpdCharge do
          begin
            close;
            parambyname('Supplier').asinteger := iSupplier;
            parambyname('Charge_no').asinteger := iCharge;
            parambyname('Details').asstring := DetailsEdit.text;
            parambyname('Amount').asfloat := StrToFloatDef(CostMemo.Text, 0, FormatSettings);
            parambyname('Quotation_Price').asfloat := StrToFloatDef(PriceMemo.Text, 0, FormatSettings);
            parambyname('Vat_code').asinteger := dblkpVatRate.KeyValue;
            execsql;
          end;
      end;
  end
  else if FFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end
    else
      begin
        with qryDelCharge do
          begin
            close;
            parambyname('Supplier').asinteger := iSupplier;
            parambyname('Charge_no').asinteger := iCharge;
            execsql;
          end;
      end
  end;
  bOK := True;
end;

procedure TPBMaintSuppChargesFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintSuppChargesFrm.VATDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSuppChargesFrm.ValidateMoney(Sender: TObject);
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

function TPBMaintSuppChargesFrm.GetNextCharge: integer;
begin
  with qryGetNextCharge do
    begin
      close;
      parambyname('Supplier').asinteger := iSupplier;
      open;
      result := fieldbyname('Last_Charge').asinteger + 1;
    end;
end;

end.
