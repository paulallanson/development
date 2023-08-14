unit PBMaintInvChgs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, PBPOObjects, PBSalesInvoiceDM, Db, ExtCtrls, Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintInvChgsfrm = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryVAT: TFDQuery;
    dsVAT: TDataSource;
    lblDelete: TLabel;
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    memPrice: TMemo;
    dblkpVat: TDBLookupComboBox;
    Nominal: TLabel;
    btnLUAddChrg: TButton;
    cmbbxAddChrg: TComboBox;
    qryAddChrgs: TFDQuery;
    Label4: TLabel;
    memCost: TMemo;
    edtNominal: TMaskEdit;
    Label5: TLabel;
    cmbLines: TComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender : TObject);
    procedure memPriceEnter(Sender: TObject);
    procedure memPriceExit(Sender: TObject);
    procedure btnLUAddChrgClick(Sender: TObject);
    procedure cmbbxAddChrgClick(Sender: TObject);
  private
    sOldValue: string;
    Factivated: boolean;
    FSalesInvoiceChg: TSalesInvoiceChg;
    FMode: TsicMode;
    FAccountsPackage: string;
    procedure ShowDetails;
    procedure SetSalesInvoiceChg(const Value: TSalesInvoiceChg);
    procedure SetMode(const Value: TsicMode);
    procedure BuildAddChrgList;
    function GetAddChrgPrice(addChrg: string): double;
    procedure SetAccountsPackage(const Value: string);
  public
    property AccountsPackage: string read FAccountsPackage write SetAccountsPackage;
    property Mode: TsicMode read FMode write SetMode;
    property SalesInvoiceChg: TSalesInvoiceChg read FSalesInvoiceChg write SetSalesInvoiceChg;
  end;

var
  PBMaintInvChgsfrm: TPBMaintInvChgsfrm;

implementation

uses PBLUAddCharges;

{$R *.DFM}

{ TPBMaintInvChgsfrm }

{ TPBMaintInvChgsfrm }

procedure TPBMaintInvChgsfrm.SetMode(const Value: TsicMode);
begin
  FMode := Value;
  lblDelete.Visible := (FMode = sicDelete);
  pnlDetails.Enabled := not(FMode = sicDelete);
end;

procedure TPBMaintInvChgsfrm.SetSalesInvoiceChg(
  const Value: TSalesInvoiceChg);
begin
  FSalesInvoiceChg := Value;
end;

procedure TPBMaintInvChgsfrm.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  SalesInvoiceChg.Details := self.cmbbxAddChrg.Text;
  SalesInvoiceChg.Amount := StrToFloatDef(memPrice.Text, 0, FormatSettings);
  SalesInvoiceChg.Cost := StrToFloatDef(memCost.Text, 0, FormatSettings);
  SalesInvoiceChg.Nominal := edtNominal.Text;

  SalesInvoiceChg.SILine := strtoint(cmbLines.Text);
  SalesInvoiceChg.VATCode := dblkpVAT.keyvalue;
  SalesInvoiceChg.VATRate := SalesInvoiceChg.Parent.DataModule.GetVatRate(SalesInvoiceChg.VATCode);

  if Mode = sicAdd then
  begin
    SalesInvoiceChg.SICharge := SalesInvoiceChg.Parent.Charges.Count + 1;
    SalesInvoiceChg.Parent.Charges.Add(SalesInvoiceChg);
  end
  else
  if Mode = sicDelete then
  begin
    inx := SalesInvoiceChg.Parent.Charges.IndexOf(SalesInvoiceChg.SICharge);
    SalesInvoiceChg.Parent.Charges.Delete(inx);
    SalesInvoiceChg.Parent.Charges.Renumber;
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintInvChgsfrm.FormActivate(Sender: TObject);
var
  sTemp: string;
  i: integer;
begin
  if not FActivated then
  begin
    case Mode of
    sicAdd     : Caption := 'Add a Sales Invoice charge';
    sicChange  : Caption := 'Change a Sales Invoice charge';
    sicDelete  : Caption := 'Delete a Sales Invoice charge';
    end;  { case }
    if Mode = sicAdd then
      sTemp := ' New Sales Invoice '
    else
      sTemp := ' Sales Invoice ' + IntToStr(SalesInvoicechg.Parent.DbKey) + ' ';

    qryVAT.active := false;
    qryVAT.active := true;

    self.BuildAddChrgList;

    for i := 0 to pred(SalesInvoiceChg.parent.Lines.count) do
      cmbLines.Items.Add(inttostr(SalesInvoiceChg.parent.Lines[i].SILine));

    ShowDetails;
    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintInvChgsfrm.ShowDetails;
begin
  if Mode <> sicAdd then
  begin
    self.cmbbxAddChrg.Text := SalesInvoiceChg.Details;
    memPrice.Text := formatfloat('0.00',SalesInvoiceChg.Amount);
    memCost.Text := formatfloat('0.00',SalesInvoiceChg.Cost);
    edtNominal.text := SalesInvoicechg.Nominal;
    dblkpVAT.KeyValue := SalesInvoicechg.VatCode;
    cmbLines.itemindex := cmbLines.items.IndexOf(inttostr(SalesInvoiceChg.SILine));
    if (cmbLines.ItemIndex = -1) and (cmbLines.items.count > 0) then
      cmbLines.ItemIndex := 0;
  end
  else
  begin
    self.cmbbxAddChrg.Text := '';
    memPrice.Text := '0.00';
    memCost.Text := '0.00';
    edtNominal.text := '';
    dblkpVAT.KeyValue := 0;
    cmbLines.ItemIndex := 0;
  end;
end;

procedure TPBMaintInvChgsfrm.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (self.cmbbxAddChrg.text <> '') and
                    (memPrice.text <> '') and
                    (memCost.text <> '') and
                    (edtNominal.text <> '');
end;

procedure TPBMaintInvChgsfrm.memPriceEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintInvChgsfrm.memPriceExit(Sender: TObject);
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

procedure TPBMaintInvChgsfrm.btnLUAddChrgClick(Sender: TObject);
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

procedure TPBMaintInvChgsfrm.BuildAddChrgList;
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

function TPBMaintInvChgsfrm.GetAddChrgPrice(addChrg: string): double;
begin

end;

procedure TPBMaintInvChgsfrm.cmbbxAddChrgClick(Sender: TObject);
begin
  if qryAddChrgs.Locate('details', self.cmbbxAddChrg.Text, [loCaseInsensitive]) then
  begin
    self.memPrice.Text := FloatToStrF(qryAddChrgs.FieldByName('quotation_price').asFloat, ffFixed, 15, 2);
    self.memCost.Text := FloatToStrF(qryAddChrgs.FieldByName('amount').asFloat, ffFixed, 15, 2)
  end
  else
  begin
    self.memPrice.Text := '';
  end;
end;

procedure TPBMaintInvChgsfrm.SetAccountsPackage(const Value: string);
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

end.
