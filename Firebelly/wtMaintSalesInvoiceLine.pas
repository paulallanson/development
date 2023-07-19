unit wtMaintSalesInvoiceLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, wtSalesInvoiceDM, DBCtrls, Db, allCommon, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintSalesInvoiceLine = class(TForm)
    Panel1: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    lblOrderType: TLabel;
    lblOrderNumber: TLabel;
    Label1: TLabel;
    qryVAT: TFDQuery;
    dsVAT: TDataSource;
    pnlDetails: TPanel;
    Label2: TLabel;
    memQuantity: TMemo;
    Label4: TLabel;
    memPrice: TMemo;
    Label16: TLabel;
    edtNominal: TEdit;
    Label5: TLabel;
    dblkpVat: TDBLookupComboBox;
    lblDelete: TLabel;
    cmbCreditType: TComboBox;
    lblCreditType: TLabel;
    lblPacks: TLabel;
    lblVatValue: TLabel;
    memVatValue: TMemo;
    lblCost: TLabel;
    memCost: TMemo;
    qryVATVat: TIntegerField;
    qryVATVat_Rate: TFloatField;
    qryVATDescription: TStringField;
    qryVATVat_Code: TStringField;
    edtDescription: TEdit;
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure memQuantityChange(Sender: TObject);
    procedure memPriceChange(Sender: TObject);
    procedure edtNominalChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cmbCreditTypeChange(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
  private
    sOldValue: string;
    FActivated: boolean;
    FMode: TsilMode;
    FSalesInvoiceLine: TSalesInvoiceLine;
    FOrderType: string;
    FNominalType: string;
    procedure SetMode(const Value: TsilMode);
    procedure CheckOK(Sender: TObject);
    procedure SetSalesInvoiceLine(const Value: TSalesInvoiceLine);
    procedure ShowDetails;
    procedure SetOrderType(const Value: string);
    procedure SetNominalType(const Value: string);
    procedure SetComponentColours;
    { Private declarations }
  public
    ProductCode: string;
    property Mode: TsilMode read FMode write SetMode;
    property NominalType: string read FNominalType write SetNominalType;
    property OrderType: string read FOrderType write SetOrderType;
    property SalesInvoiceLine: TSalesInvoiceLine read FSalesInvoiceLine write SetSalesInvoiceLine;
  end;

var
  frmWTMaintSalesInvoiceLine: TfrmWTMaintSalesInvoiceLine;

implementation

{$R *.DFM}

{ TPBMaintSalesInvoiceLinefrm }

procedure TfrmWTMaintSalesInvoiceLine.SetMode(const Value: TsilMode);
begin
  FMode := Value;
  lblDelete.visible := (FMode = silDelete);
  pnlDetails.enabled := not (FMode = silDelete);
end;

procedure TfrmWTMaintSalesInvoiceLine.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    silAdd     : Caption := 'Add a Sales Invoice Line';
    silChange  : Caption := 'Change a Sales Invoice line';
    silDelete  : Caption := 'Delete a Sales Invoice Line';
    end;  { case }
    if Mode = silAdd then
      sTemp := ' New Sales Invoice '
    else
      sTemp := ' Sales Invoice ' + IntToStr(SalesInvoiceLine.Parent.DbKey) + ' ';

    with qryVAT do
      begin
        close;
        parambyname('Vat').asinteger := SalesInvoiceLine.VatCode;
        open;
      end;

    ShowDetails;
    pnlDetails.enabled := (Mode <> silView);
    btnOk.visible := (Mode <> silView);
    
    if SalesInvoiceLine.Parent.InvoiceorCredit = 'C' then
      SetComponentColours;

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintSalesInvoiceLine.ShowDetails;
begin
  if Mode <> silAdd then
  begin
    if SalesInvoiceLine.Job <> 0 then
      begin
        lblOrderType.caption := 'Job Number: ';
        lblOrderNumber.caption := inttostr(SalesInvoiceLine.Job);
      end
    else
      begin
        lblOrderType.caption := 'Product: ';
        lblOrderNumber.caption := ProductCode;
      end;

    if SalesInvoiceLine.CreditType = 'Q' then
      cmbCreditType.itemindex := 1
    else
    if SalesInvoiceLine.CreditType = 'V' then
      cmbCreditType.itemindex := 2
    else
      cmbCreditType.itemindex := 0;

    memQuantity.text := floattostr(SalesInvoiceLine.Quantity);
    memPrice.Text := formatfloat('0.00',SalesInvoiceLine.unitPrice);
    memCost.Text := formatfloat('0.00',SalesInvoiceLine.CostPrice);

    lblPacks.caption := 'Sell Unit: '+ inttostr(SalesInvoiceLine.sellunit);
    edtDescription.text := SalesInvoiceLine.Description;
    edtNominal.text := SalesInvoiceLine.Nominal;
    dblkpVAT.KeyValue := SalesInvoiceLine.VatCode;
    lblPacks.visible := SalesInvoiceLine.sellunit > 0;
    memVatValue.text := formatfloat('0.00',SalesInvoiceLine.VatValue);
  end
  else
  begin
    memQuantity.Text := '';
    memPrice.Text := '';
    memCost.text := '0';
    memVatValue.Text := '0';
    edtNominal.text := '';
    dblkpVAT.KeyValue := 0;
    cmbCreditType.ItemIndex := 1;
  end;
  lblCreditType.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C');
  cmbCreditType.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C');
  lblCost.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C');
  memCost.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C');
  lblVatValue.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C') and (SalesInvoiceLine.CreditType = 'V');
  memVatValue.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C') and (SalesInvoiceLine.CreditType = 'V');
end;

procedure TfrmWTMaintSalesInvoiceLine.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (memQuantity.text <> '') and
                    (memPrice.text <> '') and
                    ((edtNominal.text <> ''));
end;

procedure TfrmWTMaintSalesInvoiceLine.SetSalesInvoiceLine(
  const Value: TSalesInvoiceLine);
begin
  FSalesInvoiceLine := Value;
end;

procedure TfrmWTMaintSalesInvoiceLine.memQuantityChange(Sender: TObject);
begin
  checkOK(self);
end;

procedure TfrmWTMaintSalesInvoiceLine.memPriceChange(Sender: TObject);
begin
  checkOK(self);
end;

procedure TfrmWTMaintSalesInvoiceLine.edtNominalChange(Sender: TObject);
begin
  checkok(self);
end;

procedure TfrmWTMaintSalesInvoiceLine.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  SalesInvoiceLine.SellUnit := 1;
  if SalesInvoiceLine.PackQty = 0 then
    begin
      SalesInvoiceLine.Quantity := strtofloat(Trim(memQuantity.Text));
      SalesInvoiceLine.UnitPrice := StrTofloat(memPrice.Text);
      SalesInvoiceLine.CostPrice := StrTofloat(memCost.Text);
    end
  else
    begin
      SalesInvoiceLine.Quantity := strtoint(Trim(memQuantity.Text));
      SalesInvoiceLine.UnitPrice := (StrTofloat(memPrice.Text));
      SalesInvoiceLine.CostPrice := (StrTofloat(memCost.Text));
    end;

  SalesInvoiceLine.Nominal := edtNominal.Text;
  SalesInvoiceLine.Description := edtDescription.Text;

  SalesInvoiceLine.VATCode := dblkpVAT.keyvalue;
  SalesInvoiceLine.VATDescription := dblkpVAT.Text;
  SalesInvoiceLine.VATReverseCharge := SalesInvoiceLine.Parent.DataModule.GetVatReverseCharge(SalesInvoiceLine.VATCode);
  SalesInvoiceLine.VATRate := SalesInvoiceLine.Parent.DataModule.GetVatRate(SalesInvoiceLine.VATCode);
  SalesInvoiceLine.VatValue := StrTofloat(memVatValue.Text);
  if (SalesInvoiceLine.Parent.DBKey = 0) and (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C') then
    SalesInvoiceLine.OriginalQty := 0;
  if Mode = silAdd then
  begin
    SalesInvoiceLine.SILine := SalesInvoiceLine.Parent.Lines.Count + 1;
    SalesInvoiceLine.Parent.Lines.Add(SalesInvoiceLine);
  end
  else
  if Mode = silDelete then
  begin
    inx := SalesInvoiceLine.Parent.Lines.IndexOf(SalesInvoiceLine.SILine);
    SalesInvoiceLine.Parent.Lines.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintSalesInvoiceLine.SetOrderType(const Value: string);
begin
  FOrderType := Value;
end;

procedure TfrmWTMaintSalesInvoiceLine.SetNominalType(const Value: string);
begin
  FNominalType := Value;
end;

procedure TfrmWTMaintSalesInvoiceLine.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TfrmWTMaintSalesInvoiceLine.ValidateMoney(Sender: TObject);
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

procedure TfrmWTMaintSalesInvoiceLine.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmWTMaintSalesInvoiceLine.cmbCreditTypeChange(Sender: TObject);
begin
  with cmbCreditType do
    begin
      case itemindex of
      0:  begin
            lblVatValue.visible := false;
            memVatValue.visible := false;
            memVatValue.Text := '0.00';
            SalesInvoiceLine.CreditType := 'P';
          end;
      1:  begin
            lblVatValue.visible := false;
            memVatValue.visible := false;
            memVatValue.Text := '0.00';
            SalesInvoiceLine.CreditType := 'Q';
          end;
      2:  begin
            lblVatValue.visible := true;
            memVatValue.visible := true;
            memPrice.Text := '0.00';
            SalesInvoiceLine.CreditType := 'V';
          end;
      end;
    end;
end;

procedure TfrmWTMaintSalesInvoiceLine.SetComponentColours;
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
      if Components[i] is TComboBox then
        TComboBox(Components[i]).Font.color := clred;
    end;
end;
procedure TfrmWTMaintSalesInvoiceLine.edtDescriptionChange(
  Sender: TObject);
begin
  checkOK(self);
end;

end.
