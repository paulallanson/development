unit PBMaintSuppInvoiceLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, PBPOObjects, PBSupplierInvoiceDM, DBCtrls, Db, CCSCommon, Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSuppInvoiceLinefrm = class(TForm)
    Panel1: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    lblOrderType: TLabel;
    lblOrderNumber: TLabel;
    lblDescription: TLabel;
    Label1: TLabel;
    qryVAT: TFDQuery;
    qryPriceUnit: TFDQuery;
    dsVAT: TDataSource;
    dsPriceUnit: TDataSource;
    pnlDetails: TPanel;
    Label2: TLabel;
    memQuantity: TMemo;
    Label4: TLabel;
    memPrice: TMemo;
    Label16: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    lblPriceUnit: TLabel;
    Label5: TLabel;
    dblkpVat: TDBLookupComboBox;
    lblDelete: TLabel;
    lblPacks: TLabel;
    lblCreditType: TLabel;
    cmbCreditType: TComboBox;
    lblVatValue: TLabel;
    memVatValue: TMemo;
    edtNominal: TMaskEdit;
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure memQuantityChange(Sender: TObject);
    procedure memPriceChange(Sender: TObject);
    procedure edtNominalChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure memVatValueChange(Sender: TObject);
    procedure cmbCreditTypeChange(Sender: TObject);
    procedure memQuantityKeyPress(Sender: TObject; var Key: Char);
  private
    sOldValue: string;
    FActivated: boolean;
    FOrderType: string;
    FNominalType: string;
    FSuppInvoiceLine: TSuppInvoiceLine;
    FMode: TpilMode;
    FAccountsPackage: string;
    procedure CheckOK(Sender: TObject);
    procedure ShowDetails;
    procedure SetOrderType(const Value: string);
    procedure SetNominalType(const Value: string);
    procedure SetComponentColours;
    procedure SetSuppInvoiceLine(const Value: TSuppInvoiceLine);
    procedure SetMode(const Value: TpilMode);
    procedure SetAccountsPackage(const Value: string);
    { Private declarations }
  public
    property AccountsPackage: string read FAccountsPackage write SetAccountsPackage;
    property Mode: TpilMode read FMode write SetMode;
    property NominalType: string read FNominalType write SetNominalType;
    property OrderType: string read FOrderType write SetOrderType;
    property SuppInvoiceLine: TSuppInvoiceLine read FSuppInvoiceLine write SetSuppInvoiceLine;
  end;

var
  PBMaintSuppInvoiceLinefrm: TPBMaintSuppInvoiceLinefrm;

implementation

{$R *.DFM}

{ TPBMaintSuppInvoiceLinefrm }

procedure TPBMaintSuppInvoiceLinefrm.SetMode(const Value: TpilMode);
begin
  FMode := Value;
  lblDelete.visible := (FMode = pilDelete);
  pnlDetails.enabled := not (FMode = pilDelete);
end;

procedure TPBMaintSuppInvoiceLinefrm.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    pilAdd     : Caption := 'Add a Supplier Invoice Line';
    pilChange  : Caption := 'Change a Supplier Invoice line';
    pilDelete  : Caption := 'Delete a Supplier Invoice Line';
    end;  { case }
    if Mode = pilAdd then
      sTemp := ' New Supplier Invoice '
    else
      sTemp := ' Supplier Invoice ' + IntToStr(SuppInvoiceLine.Parent.DbKey) + ' ';

    qryVAT.active := false;
    qryVAT.active := true;

    qryPriceUnit.active := false;
    qryPriceUnit.active := true;
    
    if SuppInvoiceLine.Parent.InvoiceorCredit = 'C' then
      SetComponentColours;


    ShowDetails;
    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintSuppInvoiceLinefrm.ShowDetails;
begin
  if Mode <> pilAdd then
  begin
    if SuppInvoiceLine.PONumber <> 0 then
      begin
        lblOrderType.caption := 'Production Order: ';
        lblOrderNumber.caption := floattostr(SuppInvoiceLine.PONumber);
        memQuantity.text := floattostr(SuppInvoiceLine.Quantity);
      end
    else
    if SuppInvoiceLine.PurchNumber <> 0 then
      begin
        lblOrderType.caption := 'Purchase Order: ';
        lblOrderNumber.caption := SuppInvoiceLine.Parent.DataModule.GetPurchOrdNumber(SuppInvoiceLine.PurchNumber);
        memQuantity.text := showinpacks(round(SuppInvoiceLine.Quantity),SuppInvoiceLine.PackQty);
      end
    else
    if SuppInvoiceLine.JBNumber <> 0 then
      begin
        lblOrderType.caption := 'Job Bag No: ';
        lblOrderNumber.caption := inttostr(SuppInvoiceLine.JBNumber);
        memQuantity.text := floattostr(SuppInvoiceLine.Quantity);
      end;

    if SuppInvoiceLine.CreditType = 'Q' then
      cmbCreditType.itemindex := 1
    else
    if SuppInvoiceLine.CreditType = 'V' then
      cmbCreditType.itemindex := 2
    else
      cmbCreditType.itemindex := 0;

    lblPacks.caption := 'Pack Size: '+ inttostr(SuppInvoiceLine.PackQty);
    lblDescription.caption := SuppInvoiceLine.Description;
    edtNominal.text := SuppInvoiceLine.Nominal;
    dblkpVAT.KeyValue := SuppInvoiceLine.VatCode;
    dbLkpPriceUnit.KeyValue := SuppInvoiceLine.PriceUnit;
    dbLkpPriceUnit.visible := SuppInvoiceLine.PONumber <> 0;
    lblPriceUnit.visible := SuppInvoiceLine.PONumber <> 0;
    lblPacks.visible := SuppInvoiceLine.PONumber = 0;
    memPrice.Text := formatfloat('0.000',(SuppInvoiceLine.GoodsValue*SuppInvoiceLine.PackQty));
    memVatValue.Text := formatFloat('0.000',SuppInvoiceLine.VatValue);
  end
  else
  begin
    memQuantity.Text := '';
    memPrice.Text := '';
    edtNominal.text := '';
    dblkpVAT.KeyValue := 1;
    dblkpPriceUnit.KeyValue := 0;
    cmbCreditType.ItemIndex := 1;
  end;
  lblCreditType.visible := (SuppInvoiceLine.Parent.InvoiceOrCredit = 'C');
  cmbCreditType.visible := (SuppInvoiceLine.Parent.InvoiceOrCredit = 'C');
  lblVatValue.visible := (SuppInvoiceLine.Parent.InvoiceOrCredit = 'C') and (SuppInvoiceLine.CreditType = 'V');
  memVatValue.visible := (SuppInvoiceLine.Parent.InvoiceOrCredit = 'C') and (SuppInvoiceLine.CreditType = 'V');
end;

procedure TPBMaintSuppInvoiceLinefrm.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (memQuantity.text <> '') and
                    (memPrice.text <> '') and
                    (edtNominal.text <> '');
end;

procedure TPBMaintSuppInvoiceLinefrm.memQuantityChange(Sender: TObject);
begin
  checkOK(self);
end;

procedure TPBMaintSuppInvoiceLinefrm.memPriceChange(Sender: TObject);
begin
  checkOK(self);
end;

procedure TPBMaintSuppInvoiceLinefrm.edtNominalChange(Sender: TObject);
begin
  checkok(self);
end;

procedure TPBMaintSuppInvoiceLinefrm.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  SuppInvoiceLine.Quantity := InpToSing(Trim(memQuantity.Text),SuppInvoiceLine.packQty);
//  SuppInvoiceLine.Quantity := StrToFloatDef(Trim(memQuantity.Text), 0, FormatSettings);
  SuppInvoiceLine.GoodsValue := (StrToFloatDef(memPrice.Text, 0, FormatSettings)/SuppInvoiceLine.PackQty);
  SuppInvoiceLine.Nominal := edtNominal.Text;

  SuppInvoiceLine.PriceUnit := dblkpPriceUnit.keyvalue;
  SuppInvoiceLine.PriceUnitDescr := SuppInvoiceLine.Parent.DataModule.GetPUnitDescription(SuppInvoiceLine.PriceUnit);
  SuppInvoiceLine.PriceUnitFactor := SuppInvoiceLine.Parent.DataModule.GetPUnitFactor(SuppInvoiceLine.PriceUnit);
  SuppInvoiceLine.VATCode := dblkpVAT.keyvalue;
  SuppInvoiceLine.VATRate := SuppInvoiceLine.Parent.DataModule.GetVatRate(SuppInvoiceLine.VATCode);
  SuppInvoiceLine.VatValue := StrToFloatDef(memVatValue.Text, 0, FormatSettings);
  if (SuppInvoiceLine.Parent.DBKey = 0) and (SuppInvoiceLine.Parent.InvoiceOrCredit = 'C') then
    SuppInvoiceLine.OriginalQty := 0;
  if Mode = pilAdd then
  begin
    SuppInvoiceLine.SILine := SuppInvoiceLine.Parent.Lines.Count + 1;
    SuppInvoiceLine.Parent.Lines.Add(SuppInvoiceLine);
  end
  else
  if Mode = pilDelete then
  begin
    inx := SuppInvoiceLine.Parent.Lines.IndexOf(SuppInvoiceLine.SILine);
    SuppInvoiceLine.Parent.Lines.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintSuppInvoiceLinefrm.SetOrderType(const Value: string);
begin
  FOrderType := Value;
end;

procedure TPBMaintSuppInvoiceLinefrm.SetNominalType(const Value: string);
begin
  FNominalType := Value;
end;

procedure TPBMaintSuppInvoiceLinefrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
(*  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
*)end;

procedure TPBMaintSuppInvoiceLinefrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyto3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintSuppInvoiceLinefrm.SaveValue(Sender: TObject);
begin
//  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintSuppInvoiceLinefrm.SetSuppInvoiceLine(
  const Value: TSuppInvoiceLine);
begin
  FSuppInvoiceLine := Value;
end;

procedure TPBMaintSuppInvoiceLinefrm.memVatValueChange(Sender: TObject);
begin
  checkOK(self);
end;

procedure TPBMaintSuppInvoiceLinefrm.cmbCreditTypeChange(Sender: TObject);
begin
  with cmbCreditType do
    begin
      case itemindex of
      0:  begin
            lblVatValue.visible := false;
            memVatValue.visible := false;
            memVatValue.Text := '0.00';
            SuppInvoiceLine.CreditType := 'P';
          end;
      1:  begin
            lblVatValue.visible := false;
            memVatValue.visible := false;
            memVatValue.Text := '0.00';
            SuppInvoiceLine.CreditType := 'Q';
          end;
      2:  begin
            lblVatValue.visible := true;
            memVatValue.visible := true;
            memPrice.Text := '0.00';
            SuppInvoiceLine.CreditType := 'V';
          end;
      end;
    end;
end;

procedure TPBMaintSuppInvoiceLinefrm.SetComponentColours;
var
  i: integer;
begin
  for i := 0 to pred(componentcount) do
    begin
      if Components[i] is TEdit then
        TEdit(Components[i]).Font.color := clred
      else
      if Components[i] is TMemo then
        TMemo(Components[i]).Font.color := clred
      else
      if Components[i] is TDBLookupComboBox then
        TDBLookupComboBox(Components[i]).Font.color := clred
      else
      if Components[i] is TMaskEdit then
        TMaskEdit(Components[i]).Font.color := clred
      else
      if Components[i] is TComboBox then
        TComboBox(Components[i]).Font.color := clred;
    end;
end;

procedure TPBMaintSuppInvoiceLinefrm.SetAccountsPackage(
  const Value: string);
begin
  FAccountsPackage := Value;
  if FAccountsPackage = 'SAGEMMS' then
    begin
      edtNominal.editMask := '!90009999/AAA/AAA;0;_';
      edtNominal.MaxLength := 16;
    end
  else
    begin
      edtNominal.editMask := '';
      edtNominal.MaxLength := 8;
    end;
end;

procedure TPBMaintSuppInvoiceLinefrm.memQuantityKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if SuppInvoiceLine.PackQty <> 0 then
    begin
      if Sender is TEdit then
        with Sender as TEdit do
          P := Pos(':', Text)
      else
      if Sender is TMemo then
        with Sender as TMemo do
          P := Pos(':', Text)
      else { wot is the Sender ? }
        Exit;

      case Key of
        '0'..'9': ;
        ':':
          if P > 0 then Key := #0;
        #8: {backspace};
      else
        Key := #0;
      end;
    end
  else
    begin
      case Key of
        '0'..'9': ;
        #8: {backspace};
      else
        Key := #0;
      end;
    end;
end;

end.
