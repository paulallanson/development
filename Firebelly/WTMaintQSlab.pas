unit wtMaintQSlab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtQuotesDM, StdCtrls, Buttons, CRControls, DBCtrls, DB, Spin, ExtCtrls, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintQSlab = class(TForm)
    qryWorktops: TFDQuery;
    qryWTThickness: TFDQuery;
    dtsWorktops: TDataSource;
    dtsWTThickness: TDataSource;
    qryOneWTThickness: TFDQuery;
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edtDepth: TCREditInt;
    edtLength: TCREditInt;
    dblkpWTThickness: TDBLookupComboBox;
    dblkpWorktop: TDBLookupComboBox;
    edtUnitCost: TCREditMoney;
    Label4: TLabel;
    Label7: TLabel;
    edtTotalCost: TCREditMoney;
    dblkpMaterial: TDBLookupComboBox;
    qryMaterial: TFDQuery;
    dtsMaterial: TDataSource;
    Label8: TLabel;
    dblkpSupplier: TDBLookupComboBox;
    qrySupplier: TFDQuery;
    dtsSupplier: TDataSource;
    Label9: TLabel;
    qrySlabSize: TFDQuery;
    dtsSlabSize: TDataSource;
    Label10: TLabel;
    edtWastePercentage: TCREditInt;
    Label11: TLabel;
    spnWasteMultiplier: TSpinEdit;
    Label12: TLabel;
    edtTotalWasteCost: TCREditMoney;
    SpeedButton1: TSpeedButton;
    Label13: TLabel;
    qryMTSlabSize: TFDQuery;
    dblkpSlabSize: TDBLookupComboBox;
    edtSlabCost: TCREditMoney;
    Label14: TLabel;
    pnlFooter: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryContractWorktops: TFDQuery;
    qryContractPrice: TFDQuery;
    qryGetContractSupplier: TFDQuery;
    pnlAdhesive: TPanel;
    Label19: TLabel;
    pnlPrices: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edtMarkupPercentage: TCREditInt;
    edtUnitPrice: TCREditMoney;
    edtSlabPrice: TCREditMoney;
    edtTotalPrice: TCREditMoney;
    Label20: TLabel;
    spnAdhesiveQuantity: TSpinEdit;
    Label21: TLabel;
    edtAdhesiveCost: TCREditMoney;
    btnLUProducts: TSpeedButton;
    edtAdhesiveDescription: TMemo;
    Label22: TLabel;
    edtAdhesiveTotalCost: TCREditMoney;
    pnlTotal: TPanel;
    Label23: TLabel;
    edtTotalOverallCost: TCREditMoney;
    edtAdhesiveProduct: TMemo;
    btnClear: TBitBtn;
    Label24: TLabel;
    edtAdhesiveCostUnit: TMemo;
    Label25: TLabel;
    qryGetSupplierWorktop: TFDQuery;
    edtQuantity: TCREditFloat;
    Label26: TLabel;
    edtSlabArea: TCREditMoney;
    procedure FormActivate(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure dblkpWorktopClick(Sender: TObject);
    procedure dblkpWTThicknessClick(Sender: TObject);
    procedure edtDepthChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnWorktopsClick(Sender: TObject);
    procedure dblkpSlabSizeClick(Sender: TObject);
    procedure edtWastePercentageChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dblkpMaterialClick(Sender: TObject);
    procedure dblkpSupplierClick(Sender: TObject);
    procedure edtSlabCostChange(Sender: TObject);
    procedure edtSlabCostEnter(Sender: TObject);
    procedure edtSlabCostExit(Sender: TObject);
    procedure edtMarkupPercentageChange(Sender: TObject);
    procedure edtUnitPriceEnter(Sender: TObject);
    procedure edtUnitPriceExit(Sender: TObject);
    procedure edtUnitPriceChange(Sender: TObject);
    procedure edtMarkupPercentageEnter(Sender: TObject);
    procedure edtMarkupPercentageExit(Sender: TObject);
    procedure edtSlabPriceChange(Sender: TObject);
    procedure edtSlabPriceEnter(Sender: TObject);
    procedure edtSlabPriceExit(Sender: TObject);
    procedure edtUnitCostEnter(Sender: TObject);
    procedure edtUnitCostExit(Sender: TObject);
    procedure btnLUProductsClick(Sender: TObject);
    procedure spnAdhesiveQuantityChange(Sender: TObject);
    procedure cmbProductsKeyPress(Sender: TObject; var Key: Char);
    procedure cmbProductsEnter(Sender: TObject);
    procedure cmbProductsExit(Sender: TObject);
    procedure edtTotalCostChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure edtAdhesiveTotalCostChange(Sender: TObject);
    procedure edtAdhesiveCostUnitChange(Sender: TObject);
    procedure edtQuantityChange(Sender: TObject);
    procedure edtLengthEnter(Sender: TObject);
    procedure edtLengthExit(Sender: TObject);
    procedure edtDepthEnter(Sender: TObject);
    procedure edtDepthExit(Sender: TObject);
    procedure edtQuantityEnter(Sender: TObject);
    procedure edtQuantityExit(Sender: TObject);
  private
    bCodeChecked: boolean;
    FChangeLength: boolean;
    FChangeDepth: boolean;
    FChangeQuantity: boolean;
    FChangeCost: boolean;
    FChangeSlab: boolean;
    FChangeSlabPrice: boolean;
    FChangePrice: boolean;
    FChangeMarkupRate: boolean;
    FActivated: boolean;
    FMode: TqslMode;
    FMaterialType: string;
    FMaterial: integer;
    FWorktop: integer;
    FThickness: integer;
    FQSlab: TQSlab;
    FWorktops: integer;
    FSupplier: integer;
    function GetContractSupplier: integer;
    procedure SetMode(const Value: TqslMode);
    procedure ShowDetails;
    procedure SetMaterialType(const Value: string);
    procedure GetMarkupPercentage;
    procedure GetTotalAdhesiveCost;
    procedure GetTotalArea;
    procedure GetTotalCost;
    procedure GetTotalPrice;
    procedure GetTotalWasteCost;
    procedure GetUnitCost;
    procedure GetUnitPrice;
    procedure SetQSlab(const Value: TQSlab);
    procedure SetMaterial(const Value: integer);
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure RefreshWorktops;
    procedure RefreshThickness;
    procedure EnableButtons;
    procedure SetSupplier(const Value: integer);
    procedure RefreshSuppliers;
    procedure RefreshSlabSizes;
    procedure RefreshMaterialSlabSizes;
    function GetProduct: boolean;
    procedure TotalOverallCost;
    procedure GetAdhesiveDetails;
    { Private declarations }
  public
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property Mode: TqslMode read FMode write SetMode;
    property Worktop: integer read FWorktop write SetWorktop;
    property QSlab: TQSlab read FQSlab write SetQSlab;
    property Supplier: integer read FSupplier write SetSupplier;
    property Thickness: integer read FThickness write SetThickness;
  end;

var
  frmWTMaintQSlab: TfrmWTMaintQSlab;

implementation

uses UITypes, wtLUworktops, wtMain, wtDataModule, wtLUSlabSizes, wtLUMatType,
  WTLUSupplierProduct;

{$R *.dfm}

{ TfrmWTMaintQElement }

procedure TfrmWTMaintQSlab.SetMode(const Value: TqslMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> qslDelete);
  lblDelete.visible := (FMode = qslDelete);
end;

procedure TfrmWTMaintQSlab.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    pnlPrices.visible := (dtmdlWorktops.UseSlabContractQuoting and QSlab.Parent.ContractQuote) OR (dtmdlWorktops.UseSlabContractQuoting and (QSlab.Parent.ContractQuoteNumber <> 0));
    case Mode of
    qslAdd     : Caption := 'Add an Slab';
    qslChange  : Caption := 'Change an Slab';
    qslDelete  : Caption := 'Delete an Slab';
    end;  { case }
    if Mode = qslAdd then
      sTemp := ' New Slab '
    else
      sTemp := ' slab ' + IntToStr(QSlab.Parent.DbKey) + ' ';

    with qryMaterial do
      begin
        close;
        open;
      end;

    {Refresh slab sizes based on Material Type}
//    RefreshMaterialSlabSizes;

    {Set default to Material Type - Prefered Supplier}
    RefreshSuppliers;

    if frmWTMain.bEndUSer then
      EnableButtons;

    edtUnitCost.Enabled := not frmWTMain.bEndUser;

    ShowDetails;

    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintQSlab.EnableButtons;
begin
end;

function TfrmWTMaintQSlab.GetContractSupplier: integer;
begin
  with qryGetContractSupplier do
    begin
      close;
      parambyname('Customer').AsInteger := QSlab.Parent.Customer;
      parambyname('Group_Number').AsInteger := QSlab.Parent.ContractGroup;
      open;

      result := fieldbyname('Supplier').asinteger
    end;
end;

procedure TfrmWTMaintQSlab.RefreshWorktops;
begin
  if QSlab.Parent.ContractQuote then
    begin
      with qryContractWorktops do
        begin
          close;
          parambyname('Customer').AsInteger := QSlab.Parent.Customer;
          parambyname('Group_Number').AsInteger := QSlab.Parent.ContractGroup;
          parambyname('Worktop').asinteger := QSlab.worktop;
          open;
        end;
      dtsWorktops.dataset := qryContractWorktops;
    end
  else
    begin
      with qryWorktops do
        begin
          close;
          parambyname('Material_Type').asinteger := Material;
          parambyname('Worktop').asinteger := QSlab.worktop;
          open;
        end;
      dtsWorktops.dataset := qryWorktops;
    end;
  enableok(self);
end;

procedure TfrmWTMaintQSlab.RefreshSuppliers;
begin
  with qrySupplier do
    begin
      close;
      parambyname('Supplier').asinteger := QSlab.Supplier;
      open;
      if recordcount = 1 then
        dblkpSupplier.KeyValue := fieldbyname('Supplier').asinteger
      else
        dblkpSupplier.KeyValue := Supplier;
    end;
end;

procedure TfrmWTMaintQSlab.RefreshSlabSizes;
begin
  with qrySlabSize do
    begin
      close;
      open;
    end;
end;

procedure TfrmWTMaintQSlab.RefreshMaterialSlabSizes;
var
  iCount: integer;
  sText: string;
begin
  with qryMTSlabSize do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'CSTR(', 'CONVERT(nvarchar(10), ', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Material_Type').asinteger := Material;
      open;

      iCount := recordcount;
    end;
end;

procedure TfrmWTMaintQSlab.RefreshThickness;
begin
  with qryWTThickness do
    begin
      close;
      open;
    end;

  if QSlab.Parent.ContractQuote then
    begin
      dblkpWTThickness.keyvalue := QSlab.Parent.thickness;
    end;
    
  enableok(self);
end;

procedure TfrmWTMaintQSlab.ShowDetails;
begin
  if Mode <> qslAdd then
  begin
    dblkpMaterial.keyvalue := QSlab.Material;

    dblkpSupplier.keyvalue := QSlab.Supplier;

    RefreshMaterialSlabSizes;

    RefreshWorktops;
    dblkpWorktop.keyvalue := QSlab.worktop;

    with qryWTThickness do
      begin
        close;
        open;
      end;
    dblkpWTThickness.keyvalue := QSlab.Thickness;

    dblkpSlabSize.KeyValue := QSlab.SlabSize;
    
    edtQuantity.Value := QSlab.Quantity;
    edtDepth.text := formatfloat('0',QSlab.Depth);
    edtLength.text := formatfloat('0',QSlab.Length);
    edtunitCost.text := formatfloat('0.00',QSlab.UnitCost);
    edtWastePercentage.text := inttostr(QSlab.WastePercentage);
    spnWasteMultiplier.Value := QSlab.WasteMultiplier;
    edtTotalWasteCost.Text := formatfloat('0.00',QSlab.TotalWasteCost);
    GetTotalCost;

    {Now show the price details}
    edtMarkupPercentage.text := formatfloat('0.00',QSlab.MarkupPercentage);
    edtUnitPrice.Text := formatfloat('0.00',QSlab.UnitPrice);
    GetTotalPrice;

    {Show the adhesive details}
    edtAdhesiveProduct.text := QSlab.AdhesiveProductCode;
    edtAdhesiveDescription.Text := QSlab.AdhesiveDescription;
    edtAdhesiveCost.text := formatfloat('0.00',QSlab.AdhesiveUnitCost);
    edtAdhesiveCostUnit.text := inttostr(QSlab.AdhesiveCostPackQuantity);
    spnAdhesiveQuantity.Value := QSlab.AdhesiveQuantity;

  end
  else
  begin
    dblkpMaterial.keyvalue := Material;
    dblkpMaterialClick(self);

    dblkpSupplier.keyvalue := Supplier;

    RefreshWorktops;
    dblkpWorktop.keyvalue := Self.Worktop;

    with qryWTThickness do
      begin
        close;
        open;
      end;

    dblkpWTThickness.keyvalue := Self.Thickness;
    dblkpWTThicknessClick(self);
    
    edtQuantity.text := '1';
    edtDepth.text := '';
    edtLength.text := '';
    edtWastePercentage.Text := '0';
    spnWasteMultiplier.value := dtmdlWorktops.GetWasteMultiplier;
    edtunitCost.text := formatfloat('0.00',QSlab.UnitCost);
    GetTotalCost;

    edtMarkupPercentage.text := formatfloat('0.00',0.00);
    GetTotalPrice;

    {Show the adhesive details}
    GetAdhesiveDetails;

    if QSlab.Parent.Slabs.count > 0 then
      edtLength.setfocus
    else
      dblkpSupplier.SetFocus;
  end;
  TotalOverallCost;
end;

procedure TfrmWTMaintQSlab.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpWorktop.text <> '') and
                    (dblkpSupplier.text <> '') and
                    (edtDepth.text <> '') and
                    (edtLength.Text <> '') and
                    (edtUnitCost.Text <> '') and
                    (dblkpWTThickness.KeyValue <> 0);
end;

procedure TfrmWTMaintQSlab.GetAdhesiveDetails;
var
  sText: string;
begin
  with qryGetSupplierWorktop do
    begin
      close;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Supplier').asinteger := self.supplier;
      parambyname('Worktop').asinteger := self.worktop;
      open;
      if recordcount > 0 then
        begin
          edtAdhesiveProduct.text := fieldbyname('Adhesive_Product_Code').asstring;
          edtAdhesiveDescription.Text := fieldbyname('Adhesive_Description').asstring;
          edtAdhesiveCost.text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);
          edtAdhesiveCostUnit.text := inttostr(fieldbyname('Cost_Pack_Quantity').asinteger);
          spnAdhesiveQuantity.Value := ceil((fieldbyname('Adhesive_Quantity_Per_Slab').asinteger *
                                       StrToFloatDef(edtQuantity.text, 0, FormatSettings)));
        end
      else
        begin
          edtAdhesiveProduct.text := '';
          edtAdhesiveDescription.Text := '';
          edtAdhesiveCost.text := formatfloat('0.00',0.00);
          edtAdhesiveCostUnit.text := '1';
          spnAdhesiveQuantity.Value := 0;
        end;
    end;
end;

procedure TfrmWTMaintQSlab.GetTotalAdhesiveCost;
var
  rUnitCost, rTotal: real;
  iQuantity, iCostUnit: integer;
begin
  try
    iQuantity := spnAdhesiveQuantity.Value;
  except
    iQuantity := 1;
  end;

  try
    rUnitCost := StrToFloatDef(edtAdhesiveCost.text, 0, FormatSettings);
  except
    rUnitCost := 0.00;
  end;

  try
    iCostUnit := strtoint(edtAdhesiveCostUnit.text);
  except
    iCostUnit := 1;
  end;

  rTotal := (rUnitCost)*(iQuantity/iCostUnit) ;

  edtAdhesiveTotalCost.text := formatfloat('0.00',rTotal);
end;

procedure TfrmWTMaintQSlab.GetTotalArea;
var
  idepth,iLength: integer;
  rSlabArea: real;
  rQuantity: real;
begin
  try
    rQuantity := edtQuantity.Value;
  except
    rQuantity := 1;
  end;

  try
    iDepth := strtoint(edtDepth.text);
  except
    iDepth := 0
  end;

  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  rSlabArea := roundTo((((idepth * iLength)/1000000)*rQuantity),-2) ;

  edtSlabArea.text := formatfloat('0.00',rSlabArea);
end;

procedure TfrmWTMaintQSlab.GetTotalCost;
var
  rUnitCost, rTotal, rSlabTotal: real;
  idepth,iLength: integer;
  rQuantity: real;
begin
  try
    rQuantity := edtQuantity.Value;
  except
    rQuantity := 1;
  end;

  try
    iDepth := strtoint(edtDepth.text);
  except
    iDepth := 0
  end;

  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  try
    rUnitCost := StrToFloatDef(edtUnitCost.text, 0, FormatSettings);
  except
    rUnitCost := 0.00;
  end;

  rSlabTotal := roundTo((((idepth * iLength)/1000000)*rUnitCost),-2) ;
  rTotal := (rSlabTotal)*rQuantity ;

  edtSlabCost.text := formatfloat('0.00',rSlabTotal);
  edtTotalCost.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintQSlab.GetTotalWasteCost;
var
  rUnitCost, rTotal: real;
  idepth,iLength: integer;
  rQuantity: real;
  iWastePercentage, iWasteMultiplier: integer;
begin
  try
    rQuantity := edtQuantity.Value;
  except
    rQuantity := 1;
  end;

  try
    iDepth := strtoint(edtDepth.text);
  except
    iDepth := 0
  end;

  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  try
    iWastePercentage := strtoint(edtWastePercentage.text);
  except
    iWastePercentage := 0;
  end;

  iWasteMultiplier := spnWasteMultiplier.value;

  try
    rUnitCost := StrToFloatDef(edtUnitCost.text, 0, FormatSettings);
  except
    rUnitCost := 0.00;
  end;

  rTotal := roundTo(((((idepth * iLength)/1000000)*rUnitCost)*rQuantity) * ((iWastePercentage / 100.0000) * iWasteMultiplier),-2);
  edtTotalWasteCost.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintQSlab.GetTotalPrice;
var
  rUnitPrice, rUnitCost, rTotal, rSlabTotal: real;
  idepth, iLength: integer;
  rQuantity: real;
  rMarkupPercentage: real;
begin
  try
    rQuantity := edtQuantity.Value;
  except
    rQuantity := 1;
  end;

  try
    iDepth := strtoint(edtDepth.text);
  except
    iDepth := 0
  end;

  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  try
    rMarkupPercentage := StrToFloatDef(edtMarkupPercentage.text, 0, FormatSettings);
  except
    rMarkupPercentage := 0;
  end;

  try
    rUnitCost := StrToFloatDef(edtUnitCost.text, 0, FormatSettings);
  except
    rUnitCost := 0.00;
  end;

  rUnitPrice := roundTo(rUnitCost * (1 + (rMarkupPercentage/100)),-2);

  rSlabTotal := roundTo((((idepth * iLength)/1000000)*rUnitPrice),-2) ;
  rTotal := (rSlabTotal)*rQuantity;

  edtSlabPrice.text := formatfloat('0.00',rSlabTotal);
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintQSlab.GetUnitPrice;
var
  rUnitPrice, rUnitCost, rTotal, rSlabTotal: real;
  idepth, iLength, iQuantity: integer;
  rMarkupPercentage: real;
begin
  try
    rMarkupPercentage := StrToFloatDef(edtMarkupPercentage.text, 0, FormatSettings);
  except
    rMarkupPercentage := 0;
  end;

  try
    rUnitCost := StrToFloatDef(edtUnitCost.text, 0, FormatSettings);
  except
    rUnitCost := 0.00;
  end;

  rUnitPrice := roundTo(rUnitCost * (1 + (rMarkupPercentage/100)),-2);

  edtUnitPrice.text := formatfloat('0.00',rUnitPrice);
  enableOK(self)
end;

procedure TfrmWTMaintQSlab.GetMarkupPercentage;
var
  rUnitPrice, rUnitCost, rTotal, rSlabTotal: real;
  idepth, iLength: integer;
  rQuantity: real;
  rMarkupPercentage: real;
begin
  try
    rQuantity := edtQuantity.Value;
  except
    rQuantity := 1;
  end;

  try
    iDepth := strtoint(edtDepth.text);
  except
    iDepth := 0
  end;

  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  try
    rUnitprice := StrToFloatDef(edtUnitPrice.text, 0, FormatSettings) ;
  except
    rUnitprice := 0;
  end;

  rMarkupPercentage := 0;
  var Value := StrToFloatDef(edtUnitCost.text, 0, FormatSettings);
  if Value <> 0 then
    rMarkupPercentage := ((StrToFloatDef(edtUnitPrice.text, 0, FormatSettings) / Value) - 1) * 100;

  edtMarkupPercentage.text := formatfloat('0.00',rMarkupPercentage);
  enableOK(self)
end;

procedure TfrmWTMaintQSlab.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintQSlab.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
//  QSlab.Material := FMaterial;
end;

procedure TfrmWTMaintQSlab.dblkpWorktopClick(Sender: TObject);
begin
  QSlab.worktop := dblkpWorktop.KeyValue;
  RefreshThickness;
  GetUnitCost;
  GetAdhesiveDetails;
  enableOK(self);
end;

procedure TfrmWTMaintQSlab.dblkpWTThicknessClick(Sender: TObject);
begin
  
  GetUnitCost;
  enableOK(self);
end;

procedure TfrmWTMaintQSlab.GetUnitCost;
var
  sText: string;
begin
  if QSlab.Parent.ContractQuote then
    begin
      with qryContractPrice do
        begin
          close;

          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('Customer').AsInteger := QSlab.Parent.Customer;
          parambyname('Group_Number').AsInteger := QSlab.Parent.ContractGroup;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;
          edtUnitCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);
          edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QSlab.UnitCost := fieldbyname('Unit_Cost').asfloat;
          QSlab.UnitPrice := fieldbyname('Unit_Price').asfloat;
        end;
    end
  else
    begin
      with qryOneWTThickness do
        begin
          close;

          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyName('supplier').asinteger := dblkpSupplier.keyvalue;
          parambyName('worktop').asinteger := dblkpWorktop.keyvalue;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;

          edtUnitCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);

//      QSlab.CostUnit := fieldbyname('Price_Unit').asinteger;
          QSlab.UnitCost := fieldbyname('Unit_Cost').asfloat;
        end;
    end;
end;

procedure TfrmWTMaintQSlab.edtDepthChange(Sender: TObject);
begin
  if FChangeSlab then exit;
  GetTotalArea;
  GetTotalCost;
  GetUnitPrice;
  GetTotalPrice;
  GetTotalWasteCost;
  enableOK(self);
end;

procedure TfrmWTMaintQSlab.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  QSlab.Supplier := dblkpSupplier.KeyValue;
  Qslab.SupplierName := dblkpSupplier.Text;
  QSlab.Material := dblkpMaterial.KeyValue;
  QSlab.Worktop := dblkpWorktop.KeyValue;
  QSlab.worktopDesc := dblkpWorktop.Text;
  QSlab.thickness := dblkpWTThickness.keyvalue;
  QSlab.thicknessDesc := dblkpWTThickness.Text;
  QSlab.Depth := strtoint(edtDepth.text);
  QSlab.Length := strtoint(edtLength.text);
  QSlab.UnitCost := StrToFloatDef(edtUnitCost.text, 0, FormatSettings);
  QSlab.Quantity := StrToFloatDef(edtQuantity.text, 0, FormatSettings);
  QSlab.WasteMultiplier := spnWasteMultiplier.Value;
  QSlab.WastePercentage := Strtoint(edtWastePercentage.text);
  QSlab.WasteValue := StrToFloatDef(edtTotalWasteCost.text, 0, FormatSettings);

  QSlab.AdhesiveProductCode := edtAdhesiveProduct.Text;
  QSlab.AdhesiveDescription := edtAdhesiveDescription.Text;
  QSlab.AdhesiveQuantity := spnAdhesiveQuantity.value;
  QSlab.AdhesiveUnitCost := StrToFloatDef(edtAdhesiveCost.text, 0, FormatSettings);
  QSlab.AdhesiveCostPackQuantity := strtoint(edtAdhesiveCostUnit.text);

//  if dtmdlWorktops.UseSlabContractQuoting then
  if pnlPrices.visible then
    begin
      QSlab.MarkupPercentage := StrToFloatDef(edtMarkupPercentage.text, 0, FormatSettings);
      QSlab.UnitPrice := StrToFloatDef(edtUnitPrice.text, 0, FormatSettings);

      if dblkpSlabSize.Text <> '' then
        QSlab.SlabSize := dblkpSlabSize.KeyValue
      else
        QSlab.SlabSize := 0;
    end
  else
    begin
      QSlab.MarkupPercentage := 0;
      QSlab.UnitPrice := 0;
      QSlab.SlabSize := 0;
    end;

  if Mode = qslAdd then
  begin
    QSlab.QSlabNo := QSlab.Parent.Slabs.Count + 1;
    QSlab.Parent.Slabs.Add(QSlab);
    QSlab.PriceUnit := 1;
  end
  else
  if Mode = qslDelete then
  begin
    inx := QSlab.Parent.Slabs.IndexOf(QSlab.QSlabNo);
    QSlab.Parent.Slabs.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintQSlab.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintQSlab.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintQSlab.FormCreate(Sender: TObject);
begin
  self.Worktop := 0;
  self.Thickness := 0;
end;

procedure TfrmWTMaintQSlab.btnWorktopsClick(Sender: TObject);
begin
  frmWTLUWorktops := TfrmWTLUWorktops.create(self);
  try
    frmWTLUWorktops.dblkpMaterialType.keyvalue := Material;
    frmWTLUWorktops.showmodal;
  finally
    frmWTLUWorktops.free;
  end;

  RefreshWorktops;
  RefreshThickness;
end;

procedure TfrmWTMaintQSlab.SetQSlab(const Value: TQSlab);
begin
  FQSlab := Value;
end;

procedure TfrmWTMaintQSlab.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TfrmWTMaintQSlab.dblkpSlabSizeClick(Sender: TObject);
begin
  edtLength.Text := inttostr(qryMTSlabSize.fieldbyname('Length').asinteger);
  edtdepth.Text := inttostr(qryMTSlabSize.fieldbyname('Depth').asInteger);
end;

procedure TfrmWTMaintQSlab.edtWastePercentageChange(Sender: TObject);
begin
  GetTotalWasteCost;
end;

procedure TfrmWTMaintQSlab.SpeedButton1Click(Sender: TObject);
begin
  frmwtLUMatType := TfrmwtLUMatType.create(self);
  try
    frmwtLUMatType.showmodal;
  finally
    frmwtLUMatType.free;
  end;

(*  frmWTLUSlabSizes := TfrmWTLUSlabSizes.create(self);
  try
    frmWTLUSlabSizes.showmodal;
  finally
    frmWTLUSlabSizes.free;
  end;
*)
  RefreshMaterialSlabSizes;
end;

procedure TfrmWTMaintQSlab.dblkpMaterialClick(Sender: TObject);
begin
  Material := qryMaterial.fieldbyname('Material_Type').asinteger;

  if QSlab.parent.ContractQuote then
    begin
      if Supplier = 0 then
        begin
          QSlab.Supplier := GetContractSupplier;
        end;
    end
  else
    begin
      QSlab.Supplier := qryMaterial.fieldbyname('Preferred_Supplier').asinteger;
    end;

  Supplier := QSlab.Supplier;

  RefreshSuppliers;

  RefreshMaterialSlabSizes;
  RefreshWorktops;
end;

procedure TfrmWTMaintQSlab.edtQuantityChange(Sender: TObject);
begin
  GetTotalCost;
  GetTotalPrice;
  GetTotalWasteCost;
end;

procedure TfrmWTMaintQSlab.dblkpSupplierClick(Sender: TObject);
begin
  QSlab.Supplier := dblkpSupplier.KeyValue;
  GetUnitCost;
  GetAdhesiveDetails;
  EnableOK(self);
end;

procedure TfrmWTMaintQSlab.edtSlabCostChange(Sender: TObject);
var
  iDepth, iLength: integer;
  rQuantity: real;
  rSlabCost, rUnitCost, rTotal: real;
begin
  if FChangeCost or FChangeLength or FChangeDepth or FChangeQuantity then exit;
  
  try
    rQuantity := StrToFloatDef(edtQuantity.text, 0, FormatSettings);
  except
    rQuantity := 1;
  end;

  try
    iDepth := strtoint(edtDepth.text);
  except
    iDepth := 0
  end;

  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  try
    rSlabCost := StrToFloatDef(edtSlabCost.text, 0, FormatSettings);
  except
    rSlabCost := 0.00;
  end;

  try
    rUnitCost := roundTo(rSlabCost/((idepth * iLength)/1000000),-2) ;
  except
    rUnitCost := 0.00;
  end;

  rTotal := (rSlabCost)*rQuantity ;

  edtUnitCost.text := formatfloat('0.00',rUnitCost);
  edtTotalCost.text := formatfloat('0.00',rTotal);

  GetUnitPrice;
  GetTotalPrice;
end;

procedure TfrmWTMaintQSlab.edtSlabCostEnter(Sender: TObject);
begin
  FChangeSlab := true;
end;

procedure TfrmWTMaintQSlab.edtSlabCostExit(Sender: TObject);
begin
  FChangeSlab := false;

end;

procedure TfrmWTMaintQSlab.edtMarkupPercentageChange(Sender: TObject);
begin
  if FChangePrice  or FChangeSlabPrice then exit;
  GetUnitPrice;
  GetTotalPrice;
end;

procedure TfrmWTMaintQSlab.edtUnitPriceEnter(Sender: TObject);
begin
  FChangePrice := true;
end;

procedure TfrmWTMaintQSlab.edtUnitPriceExit(Sender: TObject);
begin
  FChangePrice := false;
end;

procedure TfrmWTMaintQSlab.edtUnitPriceChange(Sender: TObject);
begin
  if FChangeMarkupRate or FChangeSlabPrice or FChangeSlab then exit;
  GetMarkupPercentage;
  GetTotalPrice;
end;

procedure TfrmWTMaintQSlab.edtMarkupPercentageEnter(Sender: TObject);
begin
  FChangeMarkupRate := true;
end;

procedure TfrmWTMaintQSlab.edtMarkupPercentageExit(Sender: TObject);
begin
  FChangeMarkupRate := false;
end;

procedure TfrmWTMaintQSlab.edtSlabPriceChange(Sender: TObject);
var
  iDepth, iLength: integer;
  rQuantity: real;
  rSlabPrice, rUnitPrice, rTotal: real;
begin
  if FChangeMarkupRate or FChangePrice or FChangeSlab then exit;

  try
    rQuantity := StrToFloatDef(edtQuantity.text, 0, FormatSettings);
  except
    rQuantity := 1;
  end;

  try
    iDepth := strtoint(edtDepth.text);
  except
    iDepth := 0
  end;

  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  try
    rSlabPrice := StrToFloatDef(edtSlabPrice.text, 0, FormatSettings);
  except
    rSlabPrice := 0.00;
  end;

  try
    rUnitPrice := roundTo(rSlabPrice/((idepth * iLength)/1000000),-2) ;
  except
    rUnitPrice := 0.00;
  end;

  rTotal := (rSlabPrice)*rQuantity ;

  edtUnitPrice.text := formatfloat('0.00',rUnitPrice);
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  GetMarkupPercentage;
end;

procedure TfrmWTMaintQSlab.edtSlabPriceEnter(Sender: TObject);
begin
  FChangeSlabPrice := true;
end;

procedure TfrmWTMaintQSlab.edtSlabPriceExit(Sender: TObject);
begin
  FChangeSlabPrice := false;
end;

procedure TfrmWTMaintQSlab.edtUnitCostEnter(Sender: TObject);
begin
  FChangeCost := true;
end;

procedure TfrmWTMaintQSlab.edtUnitCostExit(Sender: TObject);
begin
  FChangeCost := false;
end;

procedure TfrmWTMaintQSlab.btnLUProductsClick(Sender: TObject);
begin
  frmWTLUSupplierProduct := TfrmWTLUSupplierProduct.create(self);

  try
    frmWTLUSupplierProduct.supplier := QSlab.supplier;
    frmWTLUSupplierProduct.CodeSelected := QSlab.AdhesiveProductCode;
    frmWTLUSupplierProduct.showmodal;
    if frmWTLUSupplierProduct.ModalResult = mrOK then
      begin
//        edtProductCode.Text := frmWTLUSupplierProduct.CodeSelected;
        edtAdhesiveProduct.Text := frmWTLUSupplierProduct.CodeSelected;
        edtAdhesiveDescription.Text := frmWTLUSupplierProduct.DescriptionSelected;
        edtAdhesiveCost.Text := formatfloat('0.00',frmWTLUSupplierProduct.UnitCost);
        edtAdhesiveCostUnit.Text := inttostr(frmWTLUSupplierProduct.CostPackQuantity);
      end;
  finally
    frmWTLUSupplierProduct.free;
  end;

end;

procedure TfrmWTMaintQSlab.spnAdhesiveQuantityChange(Sender: TObject);
begin
  GetTotalAdhesiveCost;
end;

procedure TfrmWTMaintQSlab.cmbProductsKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then { if it's an enter key }
    begin
      if GetProduct then
        edtAdhesiveDescription.SetFocus
      else
        edtAdhesiveProduct.setfocus;
    end;
end;

procedure TfrmWTMaintQSlab.cmbProductsEnter(Sender: TObject);
begin
  bCodeChecked := false;
end;

procedure TfrmWTMaintQSlab.cmbProductsExit(Sender: TObject);
begin
  if not FActivated or bCodeChecked or (edtAdhesiveProduct.text = '') then exit;

  if GetProduct then
    edtAdhesiveDescription.SetFocus
  else
    edtAdhesiveProduct.setfocus;
end;

function TfrmWTMaintQSlab.GetProduct: boolean;
begin
  result := false;
  bCodeChecked := false;

  {Don't check if product code is empty}
  
  if trim(edtAdhesiveProduct.text) = '' then
    exit;

  with QSlab.Parent.DataModule.qryGetProduct do
    begin
      close;
      parambyname('Supplier').asinteger := QSlab.supplier;
      parambyname('Supplier_Product_Code').asstring := edtAdhesiveProduct.text;
      open;

      if recordcount > 0 then
        begin
          edtAdhesiveProduct.Text := fieldbyname('Description').asstring;
          edtAdhesiveCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);
          spnAdhesiveQuantity.setfocus;
          result := true;
        end
      else
        begin
          if MessageDlg('The product entered doesn''t exist, Do you want to add this product?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              edtAdhesiveDescription.enabled := true;
              result := true;
            end
          else
            result := false;
        end;
    end;
  bCodeChecked := true;
end;

procedure TfrmWTMaintQSlab.edtTotalCostChange(Sender: TObject);
begin
  TotalOverallCost;
end;

procedure TfrmWTMaintQSlab.TotalOverallCost;
var
  rTotal: real;
begin
  try
    rTotal := StrToFloatDef(edtTotalCost.text, 0, FormatSettings) + StrToFloatDef(edtAdhesiveTotalCost.text, 0, FormatSettings)
  except
    rTotal := 0;
  end;

  edtTotalOverallCost.text := formatfloat('0.00',rTotal);
end;

procedure TfrmWTMaintQSlab.btnClearClick(Sender: TObject);
begin
  edtAdhesiveProduct.clear;
  edtAdhesiveDescription.clear;
  edtAdhesiveCost.Text := '0.00';
  edtAdhesiveCostUnit.Text := '1';
  spnAdhesiveQuantity.Value := 0;
end;

procedure TfrmWTMaintQSlab.edtAdhesiveTotalCostChange(Sender: TObject);
begin
  TotalOverallCost;
end;

procedure TfrmWTMaintQSlab.edtAdhesiveCostUnitChange(Sender: TObject);
begin
  GetTotalAdhesiveCost;
end;

procedure TfrmWTMaintQSlab.edtLengthEnter(Sender: TObject);
begin
  FChangeLength := true;
end;

procedure TfrmWTMaintQSlab.edtLengthExit(Sender: TObject);
begin
  FChangeLength := false;
end;

procedure TfrmWTMaintQSlab.edtDepthEnter(Sender: TObject);
begin
  FChangeDepth := true;
end;

procedure TfrmWTMaintQSlab.edtDepthExit(Sender: TObject);
begin
  FChangeDepth := false;
end;

procedure TfrmWTMaintQSlab.edtQuantityEnter(Sender: TObject);
begin
  FChangeQuantity := true;
end;

procedure TfrmWTMaintQSlab.edtQuantityExit(Sender: TObject);
begin
  FChangeQuantity := false;
end;

end.
