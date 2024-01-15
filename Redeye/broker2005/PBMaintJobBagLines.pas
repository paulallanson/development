unit PBMaintJobBagLines;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, DB, PBJobBagDM, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintJobBagLinesFrm = class(TForm)
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    grpbxDetails: TGroupBox;
    Label2: TLabel;
    memQuantity: TMemo;
    memSellPrice: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    dblkpVat: TDBLookupComboBox;
    Label5: TLabel;
    qryVat: TFDQuery;
    qryPriceUnit: TFDQuery;
    qryProductCat: TFDQuery;
    dtsProductCat: TDataSource;
    dtsPriceUnit: TDataSource;
    dtsVat: TDataSource;
    qryGetPUnit: TFDQuery;
    edtDescription: TRichEdit;
    qryGetProductType: TFDQuery;
    qryWOProcess: TFDQuery;
    dtsWOProcess: TDataSource;
    qryGetProcess: TFDQuery;
    memCostPrice: TMemo;
    lblCostPrice: TLabel;
    chkbxInactive: TCheckBox;
    grpbxInternalCost: TGroupBox;
    Label6: TLabel;
    memMarkupPerc: TMemo;
    lblResellerPrice: TLabel;
    memResellerPrice: TMemo;
    chkbxInternalCost: TCheckBox;
    grpbxHeader: TGroupBox;
    Label7: TLabel;
    dblkpProductCat: TDBLookupComboBox;
    Label8: TLabel;
    edtProductType: TEdit;
    Label1: TLabel;
    btnProducts: TButton;
    btnProdType: TButton;
    procedure btnProdTypeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure QtyMemoExit(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateMoney3DP(Sender: TObject);
    procedure ValidateMoney4DP(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure memSellPriceChange(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure CheckKeyIsFloat(Sender: TObject; var Key: Char);
    procedure dblkpProductCatClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProductsClick(Sender: TObject);
    procedure chkbxInternalCostClick(Sender: TObject);
  private
    FActivated: boolean;
    ProductType: integer;
    FMode: TJBLMode;
    FOldValue : string;
    FJobBagLine: TJobBagLine;
    FInternalCostLine: boolean;
    procedure ShowDetails;
    procedure SetJobBagLine(const Value: TJobBagLine);
    procedure SetMode(const Value: TJBLMode);
    function CalculateSellPrice(tempQty, tempUnit: integer;
      tempValue: real): real;
    function GetProductTypeCat(tempCode: integer): integer;
    procedure GetProcessDetails(tempcode: integer);
    procedure SetInternalCostLine(const Value: boolean);
    { Private declarations }
  public
    WONumber: integer;
    WorksOrderNumber: double;
    property InternalCostLine: boolean read FInternalCostLine write SetInternalCostLine;
    property JobBagLine : TJobBagLine read FJobBagLine write SetJobBagLine;
    property Mode : TJBLMode read FMode write SetMode;
  end;

var
  PBMaintJobBagLinesFrm: TPBMaintJobBagLinesFrm;

implementation

uses PBLUPrdTyp, CCSCommon, pbDatabase, PBLUProcessCost, pbMainMenu;

const

  PriceUnit =
  'SELECT * '+
  'FROM Price_unit '+
  'WHERE ((Price_unit_Inactive is NULL) or (Price_unit_inactive = ''N'')) '+
  'ORDER BY Description ';


  OrigPriceUnit =
  'SELECT * '+
  'FROM Price_unit '+
  'ORDER BY Description ';
  
{$R *.dfm}

function TPBMaintJobBagLinesFrm.GetProductTypeCat(tempCode: integer): integer;
begin
  with qryGetProductType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := fieldbyname('Category').asinteger;
    end;
end;

function TPBMaintJobBagLinesFrm.CalculateSellPrice(tempQty, tempUnit: integer; tempValue: real): real;
var
  unitFactor: integer;
begin
  with qryGetPUnit do
    begin
      close;
      parambyname('Price_Unit').asinteger := tempunit;
      open;

      UnitFactor := fieldbyname('Price_unit_Factor').asinteger;
    end;
  if UnitFactor = 0 then
    result := tempValue
  else
    result := ((tempQty/UnitFactor)*tempValue);
end;

procedure TPBMaintJobBagLinesFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  OKBitBtn.Enabled := (Trim(edtDescription.Text) <> '') and
    (dblkpProductCat.Text <> '') and
    (edtProductType.Text <> '') and
    (Trim(memSellPrice.Text) <> '') and
    (Trim(memQuantity.Text) <> '') and
    (dblkpVat.text <> '') and
    (dblkpPriceUnit.text <> '');
end;

procedure TPBMaintJobBagLinesFrm.btnProdTypeClick(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.SelCode := ProductType;
    PBLUPrdTypFrm.Category := dblkpProductCat.KeyValue;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.Selected then
    begin
      ProductType := PBLUPrdTypFrm.SelCode;
      edtProductType.Text := PBLUPrdTypFrm.SelName;
      btnProducts.Enabled := (ProductType <> 0);
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintJobBagLinesFrm.FormActivate(Sender: TObject);
var
  sJobBag : string;
  icount: integer;
begin
  if not FActivated then
  begin
    sJobBag := IntToStr(JobBagLine.Parent.DbKey);
    if Mode = jblAdd then
      Caption := 'Add a production charge: ' + sJobBag;
    if Mode = jblCopy then
      Caption := 'Copy a production charge: ' + sJobBag;
    if Mode = jblChange then
      Caption := 'Change a production charge: ' + sJobBag;
    if Mode = jblDelete then
      Caption := 'Delete a production charge: ' + sJobBag;

    lblResellerPrice.Visible := JobBagLine.Parent.AcquiredCustomer;
    memResellerPrice.Visible := lblResellerPrice.Visible;

    with qryVAT do
      begin
        Close;
        Open;
      end;

    with qryPriceUnit do
      begin
        close;
        open;
      end;

    with qryProductCat do
      begin
        close;
        open;
      end;

    with qryWOProcess do
      begin
        close;
        parambyname('Works_Order').asinteger := WONumber;
        open;
      end;

    if (mode = jblAdd) or (mode = jblCopy) then
      jobBagLine.JBLineInvoiced := 'N';

    ShowDetails;

    grpbxDetails.Enabled := (Mode <> jblDelete) and (Mode <> jblView) and (not self.InternalCostLine);
    grpbxInternalCost.enabled := not grpbxDetails.Enabled;

    DelLabel.Visible := (Mode = jblDelete);

    OKBitBtn.Visible := not(Mode = jblView);

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintJobBagLinesFrm.ShowDetails;
begin
  if Mode = jblAdd then
  begin
    if JobBagLine.ProductType <> 0 then
      begin
        dblkpProductCat.keyvalue := GetProductTypeCat(JobBagLine.ProductType);
        ProductType := JobBagLine.ProductType;
        edtProductType.Text := JobBagLine.ProductTypeDesc;
      end
    else
      begin
        dblkpProductCat.keyvalue := 0;
        ProductType := 0;
        edtProductType.Text := '';
      end;
    dblkpPriceUnit.KeyValue := 0;
    dblkpVat.KeyValue := dmBroker.GetCompanyVatCode;
    edtDescription.Text := '';
    memQuantity.Text := '1';
    memCostPrice.Text := '0.0000';
    memSellPrice.Text := '0.0000';
    memReSellerPrice.Text := '0.0000';
    memMarkupPerc.Text := '0.00';
  end
  else
  begin
    dblkpProductCat.keyvalue := GetProductTypeCat(JobBagLine.ProductType);
    dblkpPriceUnit.KeyValue := JobBagLine.PriceUnit;
    dblkpVat.KeyValue := JobBagLine.VatCode;
    edtDescription.Text := JobBagLine.JBLineDescr;
    edtProductType.Text := JobBagLine.ProductTypeDesc;
    ProductType := JobBagLine.ProductType;
    memQuantity.Text := FormatQty(JobBagLine.JBQuantity);
    memCostPrice.Text := Formatfloat('##0.0000',(JobBagLine.CostPrice));
    memSellPrice.Text := Formatfloat('##0.0000',(JobBagLine.SellPrice));
    memReSellerPrice.Text := Formatfloat('##0.0000',(JobBagLine.ResellerPrice));
    chkbxInactive.Checked := JobBagLine.JBLineInactive;
    chkbxInternalCost.Checked := JobBagLine.InternalCostLine;
    
//    memTotalPrice.Text := FormatMoney(Floattostr(CalculateSellPrice(JobBagLine.JBQuantity,JobBagLine.PriceUnit,Jobbagline.SellPrice)));
    memMarkupPerc.Text := Formatfloat('##0.00',(JobBagLine.InternalCostMarkupPercentage));
  end;
  btnProducts.Enabled := (ProductType <> 0);
end;

procedure TPBMaintJobBagLinesFrm.OKBitBtnClick(Sender: TObject);
var
  inx : integer;
begin
  JobBagLine.WONumber := WONumber;

  JobBagLine.WorksOrderNumber := 0;
  JobBagLine.Process := 0;
  JobBagLine.JBLineDescr := Trim(edtDescription.Text);
  JobBagLine.JBQuantity := strtoint(memQuantity.text);
  JobBagLine.CostPrice := StrToFloatDef(memCostPrice.text, 0, FormatSettings);
  JobBagLine.SellPrice := StrToFloatDef(memSellPrice.text, 0, FormatSettings);
  JobBagLine.ReSellerPrice := StrToFloatDef(memResellerPrice.text, 0, FormatSettings);
  JobBagLine.PriceUnit := dblkpPriceUnit.KeyValue;
//  JobBagLine.JBLineCost := 0.00;
  JobBagLine.JBLineCost := CalculateSellPrice(JobBagLine.JBQuantity, JobBagLine.PriceUnit, JobBagLine.CostPrice);
  JobBagLine.JBLineSell := CalculateSellPrice(JobBagLine.JBQuantity, JobBagLine.PriceUnit, JobBagLine.SellPrice);
  JobBagLine.JBLineReseller := CalculateSellPrice(JobBagLine.JBQuantity, JobBagLine.PriceUnit, JobBagLine.ResellerPrice);
  JobBagLine.JBLineType := 'A';

  JobBagLine.InternalCostMarkupPercentage := StrToFloatDef(memMarkupPerc.text, 0, FormatSettings);
  JobBagLine.JBLineInactive := chkbxInactive.checked;

  if (Mode <> jblRestrict) and (Mode <> jblView) then
    begin
      if JobBagLine.JBLineInactive then
        JobbagLine.JBLineStatusText := '*Deleted*'
      else
        JobbagLine.JBLineStatusText := 'Sundry Created';
    end;
    
//  JobBagLine.JBLineInvoiced := 'N';
  if VarIsEmpty(dblkpVat.KeyValue) or VarIsNull(dblkpVat.KeyValue) then
    JobBagLine.VatCode := -1
  else
    JobBagLine.VatCode := dblkpVat.KeyValue;

  JobBagLine.InternalCostLine := chkbxInternalCost.checked;
  
  JobBagLine.CurrencyCode := 0;
  JobBagLine.ProductType := ProductType;
  if (Mode = jblAdd) or (Mode = jblCopy) then
  begin
    JobBagLine.JBLine := JobBagLine.Parent.Lines.MaxLineNo + 1;
    JobBagLine.JBLineMode := 'N';
    JobBagLine.Sequence := JobBagLine.Parent.Lines.count+1;
    JobBagLine.Parent.Lines.Add(JobBagLine);
  end
  else
  if Mode = jblDelete then
  begin
    inx := JobBagLine.Parent.Lines.IndexOf(JobBagLine.JBLine);
    JobBagLine.DeletefromDB;
    JobBagLine.Parent.Lines.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintJobBagLinesFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintJobBagLinesFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintJobBagLinesFrm.ValidateMoney3DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo4DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintJobBagLinesFrm.ValidateMoney4DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo4DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintJobBagLinesFrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintJobBagLinesFrm.QtyMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintJobBagLinesFrm.SetJobBagLine(const Value: TJobBagLine);
begin
  FJobBagLine := Value;
end;

procedure TPBMaintJobBagLinesFrm.SetMode(const Value: TJBLMode);
begin
  FMode := Value;
  memQuantity.enabled := FMode <> jblRestrict;
  memSellPrice.enabled := FMode <> jblRestrict;
  memResellerPrice.enabled := FMode <> jblRestrict;
  dblkpPriceUnit.enabled := FMode <> jblRestrict;
  dblkpVat.enabled := FMode <> jblRestrict;
  btnProdType.enabled := FMode <> jblRestrict;
  dblkpProductCat.enabled := FMode <> jblRestrict;
  chkbxInactive.Enabled := FMode <> jblRestrict;
end;

procedure TPBMaintJobBagLinesFrm.memSellPriceChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintJobBagLinesFrm.GetProcessDetails(tempcode: integer);
begin
  with qryGetProcess do
    begin
      close;
      parambyname('Process').asinteger := tempCode;
      open;

      ProductType := fieldbyname('Product_Type').asinteger;
      dblkpProductCat.keyvalue := fieldbyname('Category').asinteger;
      edtProductType.Text := fieldbyname('Product_Type_Description').asstring;
      dblkpPriceUnit.KeyValue := fieldbyname('Price_unit').asinteger;
    end;
end;

procedure TPBMaintJobBagLinesFrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
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

procedure TPBMaintJobBagLinesFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;
procedure TPBMaintJobBagLinesFrm.dblkpProductCatClick(Sender: TObject);
begin
  edtProductType.Text := '';
  productType := 0;
  checkOK(self);
end;

procedure TPBMaintJobBagLinesFrm.FormCreate(Sender: TObject);
begin
  lblCostPrice.Visible := dmBroker.UseJobBagCosts;
  memCostPrice.visible := dmBroker.UseJobBagCosts;

  chkbxInternalCost.Visible := dmBroker.OperatorCanDeleteQuoteCosts(frmPBMainMenu.iOperator);
end;

procedure TPBMaintJobBagLinesFrm.btnProductsClick(Sender: TObject);
begin
  PBLUProcessCostfrm := TPBLUProcessCostfrm.create(self);

  try
    PBLUProcessCostFrm.bIs_Lookup := true;
    PBLUProcessCostFrm.bAllow_Upd := true;
    if JobBagLine.Parent.CustomerHasPrices then
      begin
        PBLUProcessCostFrm.CustomerName := JobBagLine.Parent.CustomerName;
        PBLUProcessCostFrm.SelCustCode := JobBagLine.Parent.Customer;
        PBLUProcessCostFrm.Customer := JobBagLine.Parent.Customer;
      end;
      
    PBLUProcessCostFrm.ProductType := ProductType;
    PBLUProcessCostFrm.SelectProcess := true;
    PBLUProcessCostFrm.showmodal;
    if PBLUProcessCostFrm.Selected then
      begin
        edtDescription.Text := PBLUProcessCostFrm.SelDescription;
        memCostPrice.Text := formatfloat('0.0000',PBLUProcessCostFrm.selUnitCost);
        memSellPrice.Text := formatfloat('0.0000',PBLUProcessCostFrm.selUnitSell);
        memResellerPrice.Text := formatfloat('0.0000',PBLUProcessCostFrm.selUnitSell);
        dblkpPriceUnit.KeyValue := PBLUProcessCostFrm.SelPriceUnit;
        checkok(self);
      end;
  finally
    PBLUProcessCostFrm.free;
  end;

end;

procedure TPBMaintJobBagLinesFrm.SetInternalCostLine(const Value: boolean);
begin
  FInternalCostLine := Value;
end;

procedure TPBMaintJobBagLinesFrm.chkbxInternalCostClick(Sender: TObject);
begin
  grpbxInternalCost.enabled := (Sender as TCheckBox).checked;
  grpbxDetails.Enabled := not grpbxInternalCost.enabled ;
end;

end.
