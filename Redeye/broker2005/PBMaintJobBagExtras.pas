unit PBMaintJobBagExtras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, DB, PBJobBagDM, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintJobBagExtrasFrm = class(TForm)
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    grpbxDetails: TGroupBox;
    Label7: TLabel;
    edtProductType: TEdit;
    Label8: TLabel;
    btnProdType: TButton;
    Label1: TLabel;
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
    dblkpProductCat: TDBLookupComboBox;
    qryJobBagWO: TFDQuery;
    dtsJobBagWO: TDataSource;
    procedure btnProdTypeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure QtyMemoExit(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure memSellPriceChange(Sender: TObject);
    procedure dblkpProcessClick(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure CheckKeyIsFloat(Sender: TObject; var Key: Char);
    procedure dblkpProductCatClick(Sender: TObject);
  private
    FActivated: boolean;
    ProductType: integer;
    FMode: TJBLMode;
    FOldValue : string;
    FJobBagLine: TJobBagLine;
    procedure ShowDetails;
    procedure SetJobBagLine(const Value: TJobBagLine);
    procedure SetMode(const Value: TJBLMode);
    function CalculateSellPrice(tempQty, tempUnit: integer;
      tempValue: real): real;
    function GetProductTypeCat(tempCode: integer): integer;
    procedure GetProcessDetails(tempcode: integer);
    { Private declarations }
  public
    WONumber: integer;
    property JobBagLine : TJobBagLine read FJobBagLine write SetJobBagLine;
    property Mode : TJBLMode read FMode write SetMode;
  end;

var
  PBMaintJobBagExtrasFrm: TPBMaintJobBagExtrasFrm;

implementation

uses PBLUPrdTyp, CCSCommon, pbDatabase;

{$R *.dfm}

function TPBMaintJobBagExtrasFrm.GetProductTypeCat(tempCode: integer): integer;
begin
  with qryGetProductType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := fieldbyname('Category').asinteger;
    end;
end;

function TPBMaintJobBagExtrasFrm.CalculateSellPrice(tempQty, tempUnit: integer; tempValue: real): real;
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

procedure TPBMaintJobBagExtrasFrm.CheckOK(Sender: TObject);
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

procedure TPBMaintJobBagExtrasFrm.btnProdTypeClick(Sender: TObject);
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
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintJobBagExtrasFrm.FormActivate(Sender: TObject);
var
  sJobBag : string;
begin
  if not FActivated then
  begin
    sJobBag := IntToStr(JobBagLine.Parent.DbKey);
    if Mode = jblAdd then
      Caption := 'Add a works order charge: ' + sJobBag;
    if Mode = jblChange then
      Caption := 'Change a works order charge: ' + sJobBag;
    if Mode = jblDelete then
      Caption := 'Delete a works order charge: ' + sJobBag;

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

    with qryJobBagWO do
      begin
        close;
        parambyname('Job_Bag').asinteger := JobBagLine.Parent.DbKey;
        open;
      end;

    with qryWOProcess do
      begin
        close;
        parambyname('Works_Order').asinteger := WONumber;
        open;
      end;

    if mode = jblAdd then
      jobBagLine.JBLineInvoiced := 'N';
      
    ShowDetails;

    grpbxDetails.Enabled := (Mode <> jblDelete) and (Mode <> jblView);

    DelLabel.Visible := (Mode = jblDelete);

    OKBitBtn.Visible := not(Mode = jblView);

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintJobBagExtrasFrm.ShowDetails;
begin
  if Mode = jblAdd then
  begin
//    dblkpJobBagWO.keyvalue := WONumber;
//    dblkpProcess.KeyValue := 0;
    dblkpProductCat.keyvalue := 0;
    dblkpPriceUnit.KeyValue := 0;
    dblkpVat.KeyValue := dmBroker.GetCompanyVatCode;
    edtDescription.Text := '';
    edtProductType.Text := '';
    memQuantity.Text := '1';
    memSellPrice.Text := '0.00';
    ProductType := 0;
  end
  else
  begin
//    dblkpJobBagWO.keyvalue := WONumber;
//    dblkpProcess.KeyValue := JobBagLine.Process;
    dblkpProductCat.keyvalue := GetProductTypeCat(JobBagLine.ProductType);
    dblkpPriceUnit.KeyValue := JobBagLine.PriceUnit;
    dblkpVat.KeyValue := JobBagLine.VatCode;
    edtDescription.Text := JobBagLine.JBLineDescr;
    edtProductType.Text := JobBagLine.ProductTypeDesc;
    ProductType := JobBagLine.ProductType;
    memQuantity.Text := FormatQty(JobBagLine.JBQuantity);
    memSellPrice.Text := FormatMoney(FloatToStr(JobBagLine.SellPrice));
//    memTotalPrice.Text := FormatMoney(Floattostr(CalculateSellPrice(JobBagLine.JBQuantity,JobBagLine.PriceUnit,Jobbagline.SellPrice)));
  end;
end;

procedure TPBMaintJobBagExtrasFrm.OKBitBtnClick(Sender: TObject);
var
  inx : integer;
begin
//  JobBagLine.WONumber := WONumber;
//  JobBagLine.Process := dblkpProcess.KeyValue;
  JobBagLine.JBLineDescr := Trim(edtDescription.Text);
  JobBagLine.JBQuantity := strtoint(memQuantity.text);
  JobBagLine.SellPrice := strtofloat(memSellPrice.text);
  JobBagLine.PriceUnit := dblkpPriceUnit.KeyValue;
  JobBagLine.JBLineCost := 0.00;
  JobBagLine.JBLineSell := CalculateSellPrice(JobBagLine.JBQuantity, JobBagLine.PriceUnit, JobBagLine.SellPrice);
  JobBagLine.JBLineType := 'A';
//  JobBagLine.JBLineInvoiced := 'N';
  if VarIsEmpty(dblkpVat.KeyValue) or VarIsNull(dblkpVat.KeyValue) then
    JobBagLine.VatCode := -1
  else
    JobBagLine.VatCode := dblkpVat.KeyValue;
  JobBagLine.CurrencyCode := 0;
  JobBagLine.ProductType := ProductType;
  if Mode = jblAdd then
  begin
    JobBagLine.JBLine := JobBagLine.Parent.Lines.MaxLineNo + 1;
    JobBagLine.Parent.Lines.Add(JobBagLine);
    JobBagLine.JBLineMode := 'N';
  end
  else
  if Mode = jblDelete then
  begin
    inx := JobBagLine.Parent.Lines.IndexOf(JobBagLine.JBLine);
    JobBagLine.DeletefromDB;
    JobBagLine.Parent.Lines.Delete(inx);
  end;
//  JobBagLine.Parent.SaveToDB(false);
  ModalResult := mrOK;
end;

procedure TPBMaintJobBagExtrasFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintJobBagExtrasFrm.ValidateMoney(Sender: TObject);
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

procedure TPBMaintJobBagExtrasFrm.ValidateQty(Sender: TObject);
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

procedure TPBMaintJobBagExtrasFrm.QtyMemoExit(Sender: TObject);
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

procedure TPBMaintJobBagExtrasFrm.SetJobBagLine(const Value: TJobBagLine);
begin
  FJobBagLine := Value;
end;

procedure TPBMaintJobBagExtrasFrm.SetMode(const Value: TJBLMode);
begin
  FMode := Value;
end;

procedure TPBMaintJobBagExtrasFrm.memSellPriceChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintJobBagExtrasFrm.dblkpProcessClick(Sender: TObject);
begin
//  GetProcessDetails(dblkpProcess.KeyValue);
end;

procedure TPBMaintJobBagExtrasFrm.GetProcessDetails(tempcode: integer);
begin
  with qryGetProcess do
    begin
      close;
      parambyname('Works_Order').asinteger := WONumber;
      parambyname('Process').asinteger := tempCode;
      open;

      ProductType := fieldbyname('Product_Type').asinteger;
      dblkpProductCat.keyvalue := fieldbyname('Category').asinteger;
      edtProductType.Text := fieldbyname('Product_Type_Description').asstring;
      dblkpPriceUnit.KeyValue := fieldbyname('Price_unit').asinteger;
    end;
end;

procedure TPBMaintJobBagExtrasFrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
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

procedure TPBMaintJobBagExtrasFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
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
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;
procedure TPBMaintJobBagExtrasFrm.dblkpProductCatClick(Sender: TObject);
begin
  edtProductType.Text := '';
  productType := 0;
  checkOK(self);
end;

end.
