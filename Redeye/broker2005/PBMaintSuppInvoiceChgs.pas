unit PBMaintSuppInvoiceChgs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, PBPOObjects, PBSupplierInvoiceDM, Db, ExtCtrls, Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSuppInvoiceChgsfrm = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryVAT: TFDQuery;
    dsVAT: TDataSource;
    lblDelete: TLabel;
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtdetails: TEdit;
    memPrice: TMemo;
    dblkpVat: TDBLookupComboBox;
    Nominal: TLabel;
    edtNominal: TMaskEdit;
    Label4: TLabel;
    cmbPurchaseOrders: TComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender : TObject);
    procedure memPriceEnter(Sender: TObject);
    procedure memPriceExit(Sender: TObject);
  private
    sOldValue: string;
    Factivated: boolean;
    FMode: TpicMode;
    FSuppInvoiceChg: TSuppInvoiceChg;
    FAccountsPackage: string;
    procedure ShowDetails;
    procedure SetMode(const Value: TpicMode);
    procedure SetSuppInvoiceChg(const Value: TSuppInvoiceChg);
    procedure SetAccountsPackage(const Value: string);
    procedure SetComponentColours;
    procedure LoadPOList;
  public
    property AccountsPackage: string read FAccountsPackage write SetAccountsPackage;
    property Mode: TpicMode read FMode write SetMode;
    property SuppInvoiceChg: TSuppInvoiceChg read FSuppInvoiceChg write SetSuppInvoiceChg;
  end;

var
  PBMaintSuppInvoiceChgsfrm: TPBMaintSuppInvoiceChgsfrm;

implementation

{$R *.DFM}

{ TPBMaintInvChgsfrm }

{ TPBMaintInvChgsfrm }

procedure TPBMaintSuppInvoiceChgsfrm.SetMode(const Value: TpicMode);
begin
  FMode := Value;
  lblDelete.Visible := (FMode = picDelete);
  pnlDetails.Enabled := not(FMode = picDelete);
end;

procedure TPBMaintSuppInvoiceChgsfrm.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  SuppInvoiceChg.Details := edtDetails.Text;
  SuppInvoiceChg.Amount := StrTofloat(memPrice.Text);
  SuppInvoiceChg.Nominal := edtNominal.Text;

  SuppInvoiceChg.VATCode := dblkpVAT.keyvalue;
  SuppInvoiceChg.VATRate := SuppInvoiceChg.Parent.DataModule.GetVatRate(SuppInvoiceChg.VATCode);

  SuppInvoiceChg.PONumber := strtofloat(cmbPurchaseOrders.text);
  SuppInvoiceChg.POLine := 1;

  if Mode = picAdd then
  begin
    SuppInvoiceChg.SICharge := SuppInvoiceChg.Parent.Charges.Count + 1;
    SuppInvoiceChg.Parent.Charges.Add(SuppInvoiceChg);
  end
  else
  if Mode = picDelete then
  begin
    inx := SuppInvoiceChg.Parent.Charges.IndexOf(SuppInvoiceChg.SICharge);
    SuppInvoiceChg.Parent.Charges.Delete(inx);
    SuppInvoiceChg.Parent.Charges.Renumber;
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintSuppInvoiceChgsfrm.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    picAdd     : Caption := 'Add a Supplier Invoice charge';
    picChange  : Caption := 'Change a Supplier Invoice charge';
    picDelete  : Caption := 'Delete a Supplier Invoice charge';
    end;  { case }
    if Mode = picAdd then
      sTemp := ' New Supplier Invoice '
    else
      sTemp := ' Supplier Invoice ' + IntToStr(SuppInvoiceChg.Parent.DbKey) + ' ';

    qryVAT.active := false;
    qryVAT.active := true;

    if SuppInvoiceChg.Parent.InvoiceorCredit = 'C' then
      SetComponentColours;

    LoadPOList;
    ShowDetails;
    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintSuppInvoiceChgsfrm.LoadPOList;
var
  i: integer;
begin
  for i := 0 to pred(SuppInvoiceChg.parent.lines.count) do
    cmbPurchaseOrders.Items.Add(floattostr(SuppInvoiceChg.parent.Lines[i].PONumber));
end;

procedure TPBMaintSuppInvoiceChgsfrm.ShowDetails;
begin
  if Mode <> picAdd then
  begin
    edtDetails.Text := SuppInvoiceChg.Details;
    memPrice.Text := formatfloat('0.00',SuppInvoiceChg.Amount);
    edtNominal.text := SuppInvoicechg.Nominal;
    dblkpVAT.KeyValue := SuppInvoicechg.VatCode;
(*    if cmbPurchaseOrders.Items.count = 1 then
      cmbPurchaseOrders.itemindex := 0
    else
      cmbPurchaseOrders.itemindex := cmbPurchaseOrders.items.indexof(floattostr(SuppInvoiceChg.PONumber));
*)
    cmbPurchaseOrders.text := floattostr(SuppInvoiceChg.PONumber);
  end
  else
  begin
    edtDetails.Text := '';
    memPrice.Text := '0.00';
    edtNominal.text := '';
    dblkpVAT.KeyValue := 1;
    if cmbPurchaseOrders.Items.count = 1 then
      cmbPurchaseOrders.itemindex := 0;
  end;
end;

procedure TPBMaintSuppInvoiceChgsfrm.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (edtDetails.text <> '') and
                    (memPrice.text <> '') and
                    (edtNominal.text <> '') and
                    (cmbPurchaseOrders.text <> '');
end;

procedure TPBMaintSuppInvoiceChgsfrm.memPriceEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintSuppInvoiceChgsfrm.memPriceExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintSuppInvoiceChgsfrm.SetSuppInvoiceChg(
  const Value: TSuppInvoiceChg);
begin
  FSuppInvoiceChg := Value;
end;

procedure TPBMaintSuppInvoiceChgsfrm.SetAccountsPackage(
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

procedure TPBMaintSuppInvoiceChgsfrm.SetComponentColours;
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

end.
