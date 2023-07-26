unit PBMaintQuoteLines;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, DB, PBQuotesDM, ComCtrls,
  ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintQuoteLinesFrm = class(TForm)
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    grpbxDetails: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    btnProdType: TButton;
    Label1: TLabel;
    Label2: TLabel;
    memQuantity: TMemo;
    memCostPrice: TMemo;
    lblCostPrice: TLabel;
    Label4: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    qryPriceUnit: TFDQuery;
    qryProcessGroup: TFDQuery;
    dtsProcessGroup: TDataSource;
    dtsPriceUnit: TDataSource;
    qryGetPUnit: TFDQuery;
    qryGetProductType: TFDQuery;
    dblkpProcessGroup: TDBLookupComboBox;
    Label5: TLabel;
    memASPrice: TMemo;
    Label6: TLabel;
    memSSPrice: TMemo;
    Label9: TLabel;
    memDCOHD: TMemo;
    Label10: TLabel;
    memSSPOrig: TMemo;
    qryWCGroup: TFDQuery;
    dtsWCGroup: TDataSource;
    qryWC: TFDQuery;
    dtsWC: TDataSource;
    dblkpProcess: TDBLookupComboBox;
    qryProcess: TFDQuery;
    dtsProcess: TDataSource;
    btnProducts: TButton;
    edtDescription: TMemo;
    Label14: TLabel;
    dblkpVat: TDBLookupComboBox;
    qryVat: TFDQuery;
    dtsVat: TDataSource;
    grpbxWorkCentre: TGroupBox;
    Label3: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    memHours: TMemo;
    dblkpWorkCentreGroup: TDBLookupComboBox;
    dblkpWorkCentre: TDBLookupComboBox;
    memStaff: TMemo;
    grpbxInternalCost: TGroupBox;
    Label15: TLabel;
    memMarkupPerc: TMemo;
    memResellerPrice: TMemo;
    lblResellerPrice: TLabel;
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
    procedure memCostPriceChange(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure CheckKeyIsFloat(Sender: TObject; var Key: Char);
    procedure dblkpProcessGroupClick(Sender: TObject);
    procedure dblkpWorkCentreGroupClick(Sender: TObject);
    procedure dblkpProcessClick(Sender: TObject);
    procedure btnProductsClick(Sender: TObject);
  private
    FActivated: boolean;
    ProductType: integer;
    FOldValue : string;
    FQuoteLine: TQuoteLine;
    FMode: TQLMode;
    FProcess: integer;
    FInternalCostLine: boolean;
    procedure ShowDetails;
    function CalculateSellPrice(tempQty, tempUnit: integer;
      tempValue: real): real;
    function GetProductTypeCat(tempCode: integer): integer;
    procedure SetQuoteLine(const Value: TQuoteLine);
    procedure SetMode(const Value: TQLMode);
    procedure GetProcesses;
    function GetPriceUnit(tempUnit: integer): integer;
    procedure GetWorkCentres;
    procedure SetProcess(const Value: integer);
    procedure SetInternalCostLine(const Value: boolean);
    { Private declarations }
  public
    property InternalCostLine: boolean read FInternalCostLine write SetInternalCostLine;
    property Process: integer read FProcess write SetProcess;
    property QuoteLine : TQuoteLine read FQuoteLine write SetQuoteLine;
    property Mode: TQLMode read FMode write SetMode;
  end;

var
  PBMaintQuoteLinesFrm: TPBMaintQuoteLinesFrm;

implementation

uses PBLUPrdTyp, CCSCommon, pbDatabase, PBLUProcess, PBLUProcessCost;

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

  WorkCentreSQL =
  'SELECT work_centre_WC_Group.work_centre, work_centre.work_Centre_Name '+
  'FROM work_centre_WC_Group, work_Centre '+
  'WHERE work_centre_WC_Group.work_centre = work_centre.work_Centre and '+
  '      ((work_centre_group = :work_Centre_Group) OR (:work_Centre_Group = 0)) '+
  'ORDER BY Work_Centre_Name ';


{$R *.dfm}

function TPBMaintQuoteLinesFrm.GetProductTypeCat(tempCode: integer): integer;
begin
  with qryGetProductType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := fieldbyname('Category').asinteger;
    end;
end;

function TPBMaintQuoteLinesFrm.CalculateSellPrice(tempQty, tempUnit: integer; tempValue: real): real;
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

procedure TPBMaintQuoteLinesFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  OKBitBtn.Enabled := (Trim(edtDescription.Text) <> '') and
    (dblkpProcessGroup.Text <> '') and
    (dblkpProcess.Text <> '') and
    (Trim(memSSPrice.Text) <> '') and
    (Trim(memASPrice.Text) <> '') and
    (Trim(memResellerPrice.Text) <> '') and
    (Trim(memQuantity.Text) <> '') and
    (dblkpPriceUnit.text <> '') and
    (dblkpVat.text <> '');
end;

procedure TPBMaintQuoteLinesFrm.btnProdTypeClick(Sender: TObject);
begin
  PBLUProcessFrm := TPBLUProcessFrm.Create(Self);
  try
    PBLUProcessFrm.bIs_Lookup := True;
    PBLUProcessFrm.bAllow_Upd := True;
    PBLUProcessFrm.SelCode := Process;
    PBLUProcessFrm.ProcessGroup := dblkpProcessGroup.KeyValue;
    PBLUProcessFrm.ShowModal;
    if PBLUProcessFrm.Selected then
    begin
      Process := PBLUProcessFrm.SelCode;
      dblkpProcess.KeyValue := PBLUProcessFrm.SelCode;
      ProductType := QuoteLine.Parent.DataModule.GetProcessProductType(Process);
    end;
  finally
    PBLUProcessFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintQuoteLinesFrm.FormActivate(Sender: TObject);
var
  sQuote : string;
  icount: integer;
  tempVat: integer;
begin
  if not FActivated then
  begin
    sQuote := floatToStr(QuoteLine.Parent.DbKey);
    if Mode = qlAdd then
      Caption := 'Add a production charge: ' + sQuote;
    if Mode = qlChange then
      Caption := 'Change a production charge: ' + sQuote;
    if Mode = qlDelete then
      Caption := 'Delete a production charge: ' + sQuote;

    lblResellerPrice.Visible := QuoteLine.Parent.AcquiredCustomer;
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

    with qryWCGroup do
      begin
        close;
        open;
      end;

    with qryProcessGroup do
      begin
        close;
        open;
      end;

    ShowDetails;

    grpbxDetails.Enabled := (Mode <> qlDelete) and (Mode <> qlView) and (not self.InternalCostLine);
    grpbxWorkCentre.Enabled := grpbxDetails.Enabled;
    grpbxInternalCost.enabled := not grpbxDetails.Enabled;

    DelLabel.Visible := (Mode = qlDelete);

    OKBitBtn.Visible := not(Mode = qlView);

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintQuoteLinesFrm.ShowDetails;
begin
  if Mode = qlAdd then
  begin
    dblkpProcessGroup.keyvalue := QuoteLine.ProcessGroup;
    dblkpProcessGroupClick(self);
    dblkpPriceUnit.KeyValue := 0;
    edtDescription.Text := '';
    dblkpProcess.keyvalue := QuoteLine.Process;
    Process := QuoteLine.Process;
    memQuantity.Text := '1';
    memSSPrice.Text := '0.000';
    memASPrice.Text := '0.000';
    memResellerPrice.Text := '0.000';
    memCostPrice.Text := '0.000';
    memSSPOrig.Text := '0.000';
    memDCOHD.Text := '0.000';
    memHours.Text := '0.00';
    ProductType := QuoteLine.ProductType;
    memStaff.text := '1';
    dblkpVat.KeyValue := dmBroker.GetCustomerVATCode(QuoteLine.Parent.Customer);
    dblkpWorkCentregroup.KeyValue := NULL;
    dblkpWorkCentre.KeyValue := NULL;
    memMarkupPerc.Text := '0.00';
  end
  else
  begin
    dblkpProcessGroup.keyvalue := QuoteLine.ProcessGroup;
    dblkpProcessGroupClick(self);
    //    dblkpProductTypeCat.keyvalue := GetProductTypeCat(QuoteLine.ProcessGroup);
    dblkpPriceUnit.KeyValue := QuoteLine.PriceUnit;
    edtDescription.Text := QuoteLine.Description;
//    edtProcess.Text := QuoteLine.ProductTypeDesc;
    dblkpProcess.KeyValue := QuoteLine.Process;
    Process := QuoteLine.Process;
    ProductType := QuoteLine.ProductType;
    memQuantity.Text := FormatQty(QuoteLine.Quantity);
    memCostPrice.Text := Formatfloat('##0.0000',(QuoteLine.UnitCost));
    memASPrice.Text := Formatfloat('##0.0000',(QuoteLine.UnitSell));
    memResellerPrice.Text := Formatfloat('##0.0000',(QuoteLine.UnitResellerPrice));
    memSSPrice.Text := Formatfloat('##0.0000',(QuoteLine.UnitSSP));
    memSSPOrig.Text := Formatfloat('##0.0000',(QuoteLine.UnitSSPOrig));
    memDCOHD.Text := Formatfloat('##0.0000',(QuoteLine.UnitCostOHD));
    memHours.Text := Formatfloat('##0.00',(QuoteLine.NoOfHours));
    memStaff.Text := inttostr(QuoteLine.TeamCount);
    dblkpWorkCentreGroup.keyvalue := QuoteLine.WorkCentreGroup;
    dblkpWorkCentreGroupClick(self);
    dblkpWorkCentre.KeyValue := QuoteLine.WorkCentre;
//    memTotalPrice.Text := FormatMoney(Floattostr(CalculateSellPrice(QuoteLine.JBQuantity,QuoteLine.PriceUnit,QuoteLine.SellPrice)));

    {Set the VAT. Because VAT wasn't required originally}
    dblkpVat.keyvalue := QuoteLine.VatCode;
    memMarkupPerc.Text := Formatfloat('##0.00',(QuoteLine.InternalCostMarkupPercentage));
  end;
end;

procedure TPBMaintQuoteLinesFrm.OKBitBtnClick(Sender: TObject);
var
  inx : integer;
begin
  QuoteLine.Description := Trim(edtDescription.Text);
  QuoteLine.Quantity := strtoint(memQuantity.text);
  QuoteLine.UnitSell := strtofloat(memASPrice.text);
  QuoteLine.UnitResellerPrice := strtofloat(memResellerPrice.text);
  QuoteLine.UnitSSP := strtofloat(memSSPrice.text);
  QuoteLine.PriceUnit := dblkpPriceUnit.KeyValue;
  QuoteLine.UnitCost := strtofloat(memCostPrice.text);
  QuoteLine.UnitCostOHD := strtofloat(memDCOHD.text);
  QuoteLine.UnitSSPOrig := strtofloat(memSSPOrig.text);
  QuoteLine.Process := dblkpProcess.KeyValue;
  QuoteLine.ProcessDesc := dblkpProcess.Text;
  QuoteLine.ProcessGroup := dblkpProcessGroup.KeyValue;
  QuoteLine.ProductType := ProductType;
//  QuoteLine.ProductTypeDesc := edtProductType.text;
  QuoteLine.PriceUnitDesc := dblkpPriceUnit.Text;
  QuoteLine.PriceUnitFactor := GetPriceUnit(QuoteLine.PriceUnit);
  QuoteLine.NoOfHours := strtofloat(memHours.text);
  QuoteLine.TeamCount := strtoint(memStaff.text);
  QuoteLine.VatCode := dblkpVat.KeyValue;
  if dblkpWorkCentreGroup.Text = '' then
    QuoteLine.WorkCentreGroup := 0
  else
    QuoteLine.WorkCentreGroup := dblkpWorkCentreGroup.KeyValue;

  if dblkpWorkCentre.Text = '' then
    QuoteLine.WorkCentre := 0
  else
    QuoteLine.WorkCentre := dblkpWorkCentre.keyvalue;

  QuoteLine.InternalCostMarkupPercentage := strtofloat(memMarkupPerc.text);

  if Mode = qlAdd then
  begin
    QuoteLine.CostingToolFlag := false;
    QuoteLine.QuoteLineNo := QuoteLine.Parent.Lines.MaxLineNo + 1;
    QuoteLine.Sequence := QuoteLine.Parent.Lines.count+1;
    QuoteLine.Parent.Lines.Add(QuoteLine);
  end
  else
  if Mode = qlDelete then
  begin
    inx := QuoteLine.Parent.Lines.IndexOf(QuoteLine.QuoteLineNo);
    QuoteLine.Parent.Lines.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TPBMaintQuoteLinesFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintQuoteLinesFrm.ValidateMoney(Sender: TObject);
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

procedure TPBMaintQuoteLinesFrm.ValidateMoney3DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintQuoteLinesFrm.ValidateMoney4DP(Sender: TObject);
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

procedure TPBMaintQuoteLinesFrm.ValidateQty(Sender: TObject);
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

procedure TPBMaintQuoteLinesFrm.QtyMemoExit(Sender: TObject);
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

procedure TPBMaintQuoteLinesFrm.SetMode(const Value: TQLMode);
begin
  FMode := Value;
  memQuantity.enabled := FMode <> qlRestrict;
  memASPrice.enabled := FMode <> qlRestrict;
  memResellerPrice.enabled := FMode <> qlRestrict;
  memSSPrice.enabled := FMode <> qlRestrict;
  dblkpPriceUnit.enabled := FMode <> qlRestrict;
  btnProdType.enabled := FMode <> qlRestrict;
  dblkpProcessGroup.enabled := FMode <> qlRestrict;
end;

procedure TPBMaintQuoteLinesFrm.memCostPriceChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintQuoteLinesFrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
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

procedure TPBMaintQuoteLinesFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
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
procedure TPBMaintQuoteLinesFrm.dblkpProcessGroupClick(Sender: TObject);
begin
//  edtProcess.Text := '';
//  productType := 0;
//  process := 0;
  GetProcesses;
  checkOK(self);
end;

procedure TPBMaintQuoteLinesFrm.GetProcesses;
begin
  with qryProcess do
    begin
      close;
      open;
      if recordcount = 1 then
        begin
          dblkpProcess.keyvalue := fieldbyname('Process').asinteger;
          dblkpProcessClick(self);
          Process := fieldbyname('Process').AsInteger;
        end
      else
        begin
          dblkpProcess.keyvalue := 0;
          Process := 0;
        end;
    end;
end;

procedure TPBMaintQuoteLinesFrm.SetQuoteLine(const Value: TQuoteLine);
begin
  FQuoteLine := Value;
end;

function TPBMaintQuoteLinesFrm.GetPriceUnit(tempUnit: integer): integer;
begin
  with qryGetPUnit do
    begin
      close;
      parambyname('Price_Unit').asinteger := tempunit;
      open;
      result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

procedure TPBMaintQuoteLinesFrm.dblkpWorkCentreGroupClick(Sender: TObject);
begin
  QuoteLine.WorkCentreGroup := dblkpWorkCentreGroup.KeyValue;
  GetWorkCentres;
  checkOK(self);
end;

procedure TPBMaintQuoteLinesFrm.GetWorkCentres;
begin
  with qryWC do
    begin
      close;
      sql.clear;
      if QuoteLine.WorkCentre <> 0 then
        begin
          SQL.Text := 'select work_centre, Work_Centre_Name from Work_Centre where Work_Centre = ' + inttostr(QuoteLine.WorkCentre) + ' ';
          SQL.Text := SQL.Text + 'UNION ';
        end;
      SQL.Text := SQL.Text + WorkCentreSQL;
      parambyname('Work_Centre_Group').asinteger := QuoteLine.WorkCentreGroup;
      open;
    end;
end;

procedure TPBMaintQuoteLinesFrm.dblkpProcessClick(Sender: TObject);
begin
  Process := dblkpProcess.KeyValue;
  ProductType := QuoteLine.Parent.DataModule.GetProcessProductType(Process);
  CheckOK(self);
end;

procedure TPBMaintQuoteLinesFrm.btnProductsClick(Sender: TObject);
begin
  PBLUProcessCostfrm := TPBLUProcessCostfrm.create(self);

  try
    PBLUProcessCostFrm.bIs_Lookup := true;
    PBLUProcessCostFrm.bAllow_Upd := true;
    if QuoteLine.Parent.CustomerHasPrices then
      begin
        PBLUProcessCostFrm.CustomerName := QuoteLine.Parent.CustomerName;
        PBLUProcessCostFrm.SelCustCode := QuoteLine.Parent.Customer;
        PBLUProcessCostFrm.Customer := QuoteLine.Parent.Customer;
      end;

    PBLUProcessCostFrm.lblProcessDescription.caption := dblkpProcess.text;
    PBLUProcessCostFrm.ProductType := ProductType;
    PBLUProcessCostFrm.SelectProcess := true;
    PBLUProcessCostFrm.ProcessCode := Process;
    PBLUProcessCostFrm.showmodal;
    if PBLUProcessCostFrm.Selected then
      begin
        edtDescription.Text := PBLUProcessCostFrm.SelDescription;
        memCostPrice.Text := formatfloat('0.0000',PBLUProcessCostFrm.selUnitCost);
        memSSPrice.Text := formatfloat('0.0000',PBLUProcessCostFrm.selUnitSell);
        memASPrice.Text := formatfloat('0.0000',PBLUProcessCostFrm.selUnitSell);
        memResellerPrice.Text := formatfloat('0.0000',PBLUProcessCostFrm.selUnitSell);
        dblkpPriceUnit.KeyValue := PBLUProcessCostFrm.SelPriceUnit;
        QuoteLine.CostNumber := PBLUProcessCostFrm.SelCostNumber;
        QuoteLine.CatNumber := PBLUProcessCostFrm.SelCatNumber;
        QuoteLine.SubNumber := PBLUProcessCostFrm.SelSubNumber;
        checkok(self);
      end;
  finally
    PBLUProcessCostFrm.free;
  end;
end;

procedure TPBMaintQuoteLinesFrm.SetProcess(const Value: integer);
begin
  FProcess := Value;
  btnProducts.Enabled := (FProcess <> 0);
end;

procedure TPBMaintQuoteLinesFrm.SetInternalCostLine(const Value: boolean);
begin
  FInternalCostLine := Value;
end;

end.
