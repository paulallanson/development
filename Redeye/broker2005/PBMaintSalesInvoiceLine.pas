unit PBMaintSalesInvoiceLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, PBPOObjects, PBSalesInvoiceDM, DBCtrls, Db, CCSCommon,
  Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSalesInvoiceLinefrm = class(TForm)
    Panel1: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    lblOrderType: TLabel;
    lblOrderNumber: TLabel;
    Label1: TLabel;
    qryVAT: TFDQuery;
    qryPriceUnit: TFDQuery;
    dsVAT: TDataSource;
    dsPriceUnit: TDataSource;
    qryNominal: TFDQuery;
    dsNominal: TDataSource;
    pnlDetails: TPanel;
    Label2: TLabel;
    memQuantity: TMemo;
    Label4: TLabel;
    memPrice: TMemo;
    Label16: TLabel;
    dblkpNominal: TDBLookupComboBox;
    dblkpPriceUnit: TDBLookupComboBox;
    lblPriceUnit: TLabel;
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
    Label3: TLabel;
    cmbInvoiceType: TComboBox;
    memDescription: TMemo;
    edtProductType: TEdit;
    btnProductType: TBitBtn;
    edtNominal: TMaskEdit;
    memResellerPrice: TMemo;
    lblResellerPrice: TLabel;
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure memQuantityChange(Sender: TObject);
    procedure memPriceChange(Sender: TObject);
    procedure edtNominalChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cmbCreditTypeChange(Sender: TObject);
    procedure cmbInvoiceTypeChange(Sender: TObject);
    procedure btnProductTypeClick(Sender: TObject);
    procedure memQuantityKeyPress(Sender: TObject; var Key: Char);
  private
    sOldValue: string;
    FActivated: boolean;
    FMode: TsilMode;
    FSalesInvoiceLine: TSalesInvoiceLine;
    FOrderType: string;
    FNominalType: string;
    FAccountsPackage: string;
    procedure SetMode(const Value: TsilMode);
    procedure CheckOK(Sender: TObject);
    procedure SetSalesInvoiceLine(const Value: TSalesInvoiceLine);
    procedure ShowDetails;
    procedure SetOrderType(const Value: string);
    procedure SetNominalType(const Value: string);
    procedure SetComponentColours;
    procedure SetAccountsPackage(const Value: string);
    { Private declarations }
  public
    property AccountsPackage: string read FAccountsPackage write SetAccountsPackage;
    property Mode: TsilMode read FMode write SetMode;
    property NominalType: string read FNominalType write SetNominalType;
    property OrderType: string read FOrderType write SetOrderType;
    property SalesInvoiceLine: TSalesInvoiceLine read FSalesInvoiceLine write SetSalesInvoiceLine;
  end;

var
  PBMaintSalesInvoiceLinefrm: TPBMaintSalesInvoiceLinefrm;

implementation

uses PBLUPrdTyp;

{$R *.DFM}

{ TPBMaintSalesInvoiceLinefrm }

procedure TPBMaintSalesInvoiceLinefrm.SetMode(const Value: TsilMode);
begin
  FMode := Value;
  lblDelete.visible := (FMode = silDelete);
  pnlDetails.enabled := not (FMode = silDelete);
end;

procedure TPBMaintSalesInvoiceLinefrm.FormActivate(Sender: TObject);
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

    lblResellerPrice.Visible := SalesInvoiceLine.Parent.AcquiredCustomer;
    memResellerPrice.Visible := lblResellerPrice.Visible;

    qryVAT.active := false;
    qryVAT.active := true;

    qryPriceUnit.active := false;
    qryPriceUnit.active := true;

    qryNominal.active := false;
    qryNominal.parambyname('Rep').asinteger := SalesInvoiceLine.Parent.rep;
    qryNominal.active := true;

    ShowDetails;
    pnlDetails.enabled := (Mode <> silView);
    btnOk.visible := (Mode <> silView);
    
    if SalesInvoiceLine.Parent.InvoiceorCredit = 'C' then
      SetComponentColours;

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintSalesInvoiceLinefrm.ShowDetails;
begin
  if Mode <> silAdd then
  begin
    if SalesInvoiceLine.PONumber <> 0 then
      begin
        lblOrderType.caption := 'Purchase Order: ';
        lblOrderNumber.caption := floattostr(SalesInvoiceLine.PONumber);
      end
    else
    if SalesInvoiceLine.sONumber <> 0 then
      begin
        lblOrderType.caption := 'Sales Order: ';
        lblOrderNumber.caption := inttostr(SalesInvoiceLine.SONumber);
      end
    else
    if SalesInvoiceLine.JBNumber <> 0 then
      begin
        lblOrderType.caption := 'Job Bag No: ';
        lblOrderNumber.caption := inttostr(SalesInvoiceLine.JBNumber);
      end;

    if SalesInvoiceLine.CreditType = 'Q' then
      cmbCreditType.itemindex := 1
    else
    if SalesInvoiceLine.CreditType = 'V' then
      begin
        cmbCreditType.itemindex := 2;
        cmbInvoiceType.ItemIndex := 1;
      end
    else
      begin
        cmbCreditType.itemindex := 0;
        cmbInvoiceType.itemindex := 0;
      end;

    if SalesInvoiceLine.PackQty = 0 then
      begin
        memQuantity.text := floattostr(SalesInvoiceLine.Quantity);
        memPrice.Text := formatfloat('0.0000',SalesInvoiceLine.GoodsValue);
        memResellerPrice.Text := formatfloat('0.0000',SalesInvoiceLine.ResellerPrice);
        memCost.Text := formatfloat('0.0000',SalesInvoiceLine.CostPrice);
      end
    else
      begin
        memQuantity.text := showinpacks(round(SalesInvoiceLine.Quantity),SalesInvoiceLine.PackQty);
        memPrice.Text := formatfloat('0.0000',SalesInvoiceLine.GoodsValue*SalesInvoiceLine.PackQty);
        memResellerPrice.Text := formatfloat('0.0000',SalesInvoiceLine.ResellerPrice*SalesInvoiceLine.PackQty);
        memCost.Text := formatfloat('0.0000',SalesInvoiceLine.CostPrice*SalesInvoiceLine.PackQty);
      end;

    lblPacks.caption := 'Pack Size: '+ inttostr(SalesInvoiceLine.PackQty);
    memDescription.text := SalesInvoiceLine.Description;
    edtProductType.text := SalesinvoiceLine.ProductTypeDesc;
    edtNominal.text := SalesInvoiceLine.Nominal;
    dblkpVAT.KeyValue := SalesInvoiceLine.VatCode;
    dbLkpPriceUnit.KeyValue := SalesInvoiceLine.PriceUnit;
    dbLkpPriceUnit.visible := SalesInvoiceLine.PackQty = 0;
    lblPriceUnit.visible := SalesInvoiceLine.PackQty = 0;
    lblPacks.visible := SalesInvoiceLine.PackQty > 0;
    memVatValue.text := formatfloat('0.00',SalesInvoiceLine.VatValue);
  end
  else
  begin
    edtProductType.text := '';
    memQuantity.Text := '';
    memPrice.Text := '';
    memResellerPrice.Text := '';
    memCost.text := '';
    edtNominal.text := '';
    dblkpVAT.KeyValue := 1;
    dblkpPriceUnit.KeyValue := 0;
    cmbCreditType.ItemIndex := 1;
  end;
  if SalesInvoiceLine.Parent.InvoiceOrCredit <> 'C' then
    begin
      cmbInvoiceType.Visible := true;
      cmbInvoiceType.Left := cmbCreditType.left;
      cmbInvoiceType.Top := cmbCreditType.Top;
      lblCreditType.Caption := 'Invoice Line Type';
    end;

//  lblCreditType.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C');
  cmbCreditType.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C');
  cmbInvoiceType.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit <> 'C');
  lblCost.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C');
  memCost.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C');
//  lblVatValue.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C') and (SalesInvoiceLine.CreditType = 'V');
//  memVatValue.visible := (SalesInvoiceLine.Parent.InvoiceOrCredit = 'C') and (SalesInvoiceLine.CreditType = 'V');
  lblVatValue.visible := (SalesInvoiceLine.CreditType = 'V');
  memVatValue.visible := (SalesInvoiceLine.CreditType = 'V');
end;

procedure TPBMaintSalesInvoiceLinefrm.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (memQuantity.text <> '') and
                    (memPrice.text <> '') and
                    ((edtNominal.text <> '') or (dblkpNominal.text <> ''));
end;

procedure TPBMaintSalesInvoiceLinefrm.SetSalesInvoiceLine(
  const Value: TSalesInvoiceLine);
begin
  FSalesInvoiceLine := Value;
end;

procedure TPBMaintSalesInvoiceLinefrm.memQuantityChange(Sender: TObject);
begin
  checkOK(self);
end;

procedure TPBMaintSalesInvoiceLinefrm.memPriceChange(Sender: TObject);
begin
  checkOK(self);
end;

procedure TPBMaintSalesInvoiceLinefrm.edtNominalChange(Sender: TObject);
begin
  checkok(self);
end;

procedure TPBMaintSalesInvoiceLinefrm.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  if SalesInvoiceLine.PackQty = 0 then
    begin
      SalesInvoiceLine.Quantity := strtofloat(Trim(memQuantity.Text));
      SalesInvoiceLine.GoodsValue := StrTofloat(memPrice.Text);
      SalesInvoiceLine.ResellerPrice := StrTofloat(memResellerPrice.Text);
      SalesInvoiceLine.CostPrice := StrTofloat(memCost.Text);
    end
  else
    begin
      SalesInvoiceLine.Quantity := InpToSing(Trim(memQuantity.Text),SalesInvoiceLine.packQty);
      SalesInvoiceLine.GoodsValue := (StrTofloat(memPrice.Text)/SalesInvoiceLine.PackQty);
      SalesInvoiceLine.ResellerPrice := (StrTofloat(memResellerPrice.Text)/SalesInvoiceLine.PackQty);
      SalesInvoiceLine.CostPrice := (StrTofloat(memCost.Text)/SalesInvoiceLine.PackQty);
    end;

  if  (NominalType = 'P') or
      (NominalType = 'C') then
    SalesInvoiceLine.Nominal := edtNominal.Text
  else
    SalesInvoiceLine.Nominal := dblkpNominal.keyvalue;

  SalesInvoiceLine.LineChecked := true;
  SalesInvoiceLine.ProductTypeDesc := edtProductType.Text;
  SalesInvoiceLine.Description := memDescription.Text;
  SalesInvoiceLine.PriceUnit := dblkpPriceUnit.keyvalue;
  SalesInvoiceLine.PriceUnitDescr := SalesInvoiceLine.Parent.DataModule.GetPUnitDescription(SalesInvoiceLine.PriceUnit);
  SalesInvoiceLine.PriceUnitFactor := SalesInvoiceLine.Parent.DataModule.GetPUnitFactor(SalesInvoiceLine.PriceUnit);
  SalesInvoiceLine.VATCode := dblkpVAT.keyvalue;
  SalesInvoiceLine.VATRate := SalesInvoiceLine.Parent.DataModule.GetVatRate(SalesInvoiceLine.VATCode);
  SalesInvoiceLine.VatValue := StrTofloat(memVatValue.Text);
  if SalesInvoiceLine.TotalGoods <> 0 then
    SalesInvoiceLine.NotPrinted := 'N';
    
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

procedure TPBMaintSalesInvoiceLinefrm.SetOrderType(const Value: string);
begin
  FOrderType := Value;
end;

procedure TPBMaintSalesInvoiceLinefrm.SetNominalType(const Value: string);
begin
  FNominalType := Value;

  edtNominal.Visible := (FNominalType = 'C') or (FNominalType = 'P');
  dblkpNominal.visible := (FNominalType = 'R');
end;

procedure TPBMaintSalesInvoiceLinefrm.ValidateQty(Sender: TObject);
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
*)
end;

procedure TPBMaintSalesInvoiceLinefrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyto4DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintSalesInvoiceLinefrm.SaveValue(Sender: TObject);
begin
//  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintSalesInvoiceLinefrm.cmbCreditTypeChange(Sender: TObject);
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
            memPrice.Text := '0.0000';
            memResellerPrice.Text := '0.0000';
            SalesInvoiceLine.CreditType := 'V';
          end;
      end;
    end;
end;

procedure TPBMaintSalesInvoiceLinefrm.SetComponentColours;
var
  i: integer;
begin
  for i := 0 to pred(componentcount) do
    begin
      if Components[i] is TEdit then
        TEdit(Components[i]).Font.color := clred
      else
      if Components[i] is TMaskEdit then
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
procedure TPBMaintSalesInvoiceLinefrm.cmbInvoiceTypeChange(
  Sender: TObject);
begin
  with cmbInvoiceType do
    begin
      case itemindex of
      0:  begin
            lblVatValue.visible := false;
            memVatValue.visible := false;
            memVatValue.Text := '0.00';
            SalesInvoiceLine.CreditType := '';
          end;
      1:  begin
            lblVatValue.visible := true;
            memVatValue.visible := true;
            memPrice.Text := '0.0000';
            memResellerPrice.Text := '0.0000';
            SalesInvoiceLine.CreditType := 'V';
          end;
      end;
    end;

end;

procedure TPBMaintSalesInvoiceLinefrm.btnProductTypeClick(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.SelCode := SalesInvoiceLine.ProductType;
    PBLUPrdTypFrm.Category := 0;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.Selected then
    begin
      edtProductType.Text := PBLUPrdTypFrm.SelName;
      if SalesInvoiceLine.ProductType <> PBLUPrdTypFrm.SelCode then
        begin
          edtNominal.Text := SalesInvoiceLine.parent.DataModule.GetPTypeNominal(PBLUPrdTypFrm.SelCode);
        end;
      SalesInvoiceLine.ProductType := PBLUPrdTypFrm.SelCode;
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintSalesInvoiceLinefrm.SetAccountsPackage(
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

procedure TPBMaintSalesInvoiceLinefrm.memQuantityKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if SalesInvoiceLine.PackQty <> 0 then
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
