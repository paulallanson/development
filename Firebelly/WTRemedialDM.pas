unit WTRemedialDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TrMode   = (rAdd, rChange, rDelete);
  TrslMode   = (rslAdd, rslChange, rslDelete, rslView);

  TdtmdlRemedial = class(TDataModule)
    qryGetProduct: TFDQuery;
    qryRHeader: TFDQuery;
    qryRAddSlab: TFDQuery;
    qryRAllSlabs: TFDQuery;
    qryZero: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TRemedial = class;

  TRSlab  = class
  private
    FParent: TRemedial;
    FUnitCost: currency;
    FPriceUnit: integer;
    FSupplier: integer;
    Fworktop: integer;
    FDepth: integer;
    Fthickness: integer;
    FLength: integer;
    FthicknessDesc: string;
    FSupplierName: string;
    Fworktopdesc: string;
    FRSlabNo: integer;
    FMaterial: integer;
    FWasteValue: double;
    FWastePercentage: integer;
    FWasteMultiplier: integer;
    FQuantity: double;
    FUnitPrice: currency;
    FMarkupPercentage: double;
    FSlabSize: integer;
    FAdhesiveUnitCost: currency;
    FAdhesiveQuantity: integer;
    FAdhesiveProductCode: string;
    FAdhesiveDescription: string;
    FAdhesiveCostPackQuantity: integer;
    function GetTotalArea: double;
    function GetTotalCost: double;
    function GetTotalPrice: double;
    function GetTotalWasteCost: double;
    procedure SetParent(const Value: TRemedial);
    procedure SetDepth(const Value: integer);
    procedure SetLength(const Value: integer);
    procedure SetPriceUnit(const Value: integer);
    procedure SetSupplier(const Value: integer);
    procedure SetSupplierName(const Value: string);
    procedure Setthickness(const Value: integer);
    procedure SetthicknessDesc(const Value: string);
    procedure SetUnitCost(const Value: currency);
    procedure Setworktop(const Value: integer);
    procedure Setworktopdesc(const Value: string);
    procedure SetRSlabNo(const Value: integer);
    procedure SetMaterial(const Value: integer);
    procedure SetWastePercentage(const Value: integer);
    procedure SetWasteValue(const Value: double);
    procedure SetWasteMultiplier(const Value: integer);
    procedure SetQuantity(const Value: double);
    procedure SetMarkupPercentage(const Value: double);
    procedure SetSlabSize(const Value: integer);
    procedure SetUnitPrice(const Value: currency);
    procedure SetAdhesiveProductCode(const Value: string);
    procedure SetAdhesiveQuantity(const Value: integer);
    procedure SetAdhesiveUnitCost(const Value: currency);
    procedure SetAdhesiveDescription(const Value: string);
    procedure SetAdhesiveCostPackQuantity(const Value: integer);
  public
    constructor Create(Remedial : TRemedial);
    destructor Destroy; override;
    function Clone : TRSlab;
    procedure SaveToDB;
    property AdhesiveProductCode: string read FAdhesiveProductCode write SetAdhesiveProductCode;
    property AdhesiveDescription: string read FAdhesiveDescription write SetAdhesiveDescription;
    property AdhesiveQuantity: integer read FAdhesiveQuantity write SetAdhesiveQuantity;
    property AdhesiveCostPackQuantity: integer read FAdhesiveCostPackQuantity write SetAdhesiveCostPackQuantity;
    property AdhesiveUnitCost: currency read FAdhesiveUnitCost write SetAdhesiveUnitCost;
    property Depth: integer read FDepth write SetDepth;
    property MarkupPercentage: double read FMarkupPercentage write SetMarkupPercentage;
    property Material: integer read FMaterial write SetMaterial;
    property Length: integer read FLength write SetLength;
    property Parent: TRemedial read FParent write SetParent;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property RSlabNo: integer read FRSlabNo write SetRSlabNo;
    property Quantity: double read FQuantity write SetQuantity;
    property SlabSize: integer read FSlabSize write SetSlabSize;
    property Supplier: integer read FSupplier write SetSupplier;
    property SupplierName: string read FSupplierName write SetSupplierName;
    property thickness: integer read Fthickness write Setthickness;
    property thicknessDesc: string read FthicknessDesc write SetthicknessDesc;
    property UnitCost: currency read FUnitCost write SetUnitCost;
    property UnitPrice: currency read FUnitPrice write SetUnitPrice;
    property worktop: integer read Fworktop write Setworktop;
    property worktopdesc: string read Fworktopdesc write Setworktopdesc;
    property TotalArea: double read GetTotalArea;
    property TotalCost: double read GetTotalCost;
    property TotalPrice: double read GetTotalPrice;
    property TotalWasteCost: double read GetTotalWasteCost;
    property WasteMultiplier: integer read FWasteMultiplier write SetWasteMultiplier;
    property WastePercentage: integer read FWastePercentage write SetWastePercentage;
    property WasteValue: double read FWasteValue write SetWasteValue;
  end;

  TRSlabs = class;

  TRSlabs  = class
  private
    FParent: TRemedial;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TRSlab;
    procedure SetItems(Index: integer; const Value: TRSlab);
    function GetTotalArea: double;
    function GetTotalCosts: double;
    function GetTotalWasteCosts: double;
  public
    constructor Create(Remedial : TRemedial);
    destructor Destroy; override;
    procedure Add(aSlab : TRSlab);
    procedure Clear;
    function  Clone : TRSlabs;
    procedure Delete(const Index : integer);
    function  IndexOf(const SlabNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TRSlab read GetItems write SetItems;
      default;
    property Parent : TRemedial read FParent;
    property TotalArea: double read GetTotalArea;
    property TotalCosts: double read GetTotalCosts;
    property TotalWasteCosts: double read GetTotalWasteCosts;
  end;

  TRemedial = class
  private
    FProductionRequired: boolean;
    FSalesOrder: integer;
    FCategory: integer;
    FDepartment: integer;
    FJob: integer;
    FRemedialType: integer;
    FdbKey: integer;
    FOperator: integer;
    FRemedialNo: integer;
    FDateRaised: TDateTime;
    FDataModule: TdtmdlRemedial;
    FRSlabs: TRSlabs;
    procedure SetCategory(const Value: integer);
    procedure SetDateRaised(const Value: TDateTime);
    procedure SetdbKey(const Value: integer);
    procedure SetDepartment(const Value: integer);
    procedure SetJob(const Value: integer);
    procedure SetOperator(const Value: integer);
    procedure SetProductionRequired(const Value: boolean);
    procedure SetRemedialNo(const Value: integer);
    procedure SetRemedialType(const Value: integer);
    procedure SetSalesOrder(const Value: integer);
  public
    constructor Create(DataModule : TdtmdlRemedial);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TRemedial;
    procedure DeleteSlabs;
    procedure LoadFromDB;
    procedure LoadSlabs;
    procedure SaveToDB(TempAll: boolean);
    procedure SaveSlabs;
    property DataModule: TdtmdlRemedial read FDataModule;
    property DateRaised: TDateTime read FDateRaised write SetDateRaised;
    property dbKey: integer read FdbKey write SetdbKey;
    property Category: integer read FCategory write SetCategory;
    property Department: integer read FDepartment write SetDepartment;
    property Job: integer read FJob write SetJob;
    property Operator: integer read FOperator write SetOperator;
    property ProductionRequired: boolean read FProductionRequired write SetProductionRequired;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
    property Slabs: TRSlabs read FRSlabs;
    property RemedialNo: integer read FRemedialNo write SetRemedialNo;
    property RemedialType: integer read FRemedialType write SetRemedialType;
  end;
var
  dtmdlRemedial: TdtmdlRemedial;

implementation

uses wtDataModule;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TRemedial }

procedure TRemedial.Clear;
begin
  DateRaised :=           0;
  FRSlabs.Clear;
end;

function TRemedial.Clone: TRemedial;
begin
  Result := TRemedial.Create(FDataModule);
  Result.DateRaised :=  self.DateRaised;
  Result.FRSlabs.Free;
  Result.FRSlabs :=  Self.FRSlabs.Clone;
end;

constructor TRemedial.Create(DataModule: TdtmdlRemedial);
begin
  FDataModule := DataModule;
  FRSlabs := TRSlabs.Create(Self);
end;

destructor TRemedial.Destroy;
begin
  FRSlabs.Free;
  inherited;
end;

procedure TRemedial.LoadFromDB;
begin
  { Load the header record then all lines belonging to the Remedial }
  Clear;
  with FDataModule.qryRHeader do
  begin
    Close;
    ParamByName('ID').AsInteger := DbKey;
    Open;
    DateRaised := fieldbyname('Date_Raised').asdatetime;
    Operator := fieldbyname('Operator').asinteger;
    SalesOrder := fieldbyname('Sales_Order').asinteger;
    RemedialType := fieldbyname('Remedial_type').asinteger;
    Department := fieldbyname('Remedial_Dept').asinteger;
    Category := fieldbyname('Remedial_Category').asinteger;
    RemedialNo := fieldbyname('Remedial_Number').asinteger;
    ProductionRequired := (fieldbyname('Production_Required').asstring = 'Y');
    Close;
  end;
  LoadSlabs;
end;

procedure TRemedial.SaveToDB(TempAll: boolean);
begin
  SaveSlabs;
end;

procedure TRemedial.LoadSlabs;
var
  aSlab : TRSlab;
  sText : string;
begin
  FRSlabs.Clear;
  with FDataModule.qryRAllSlabs do
  begin
    Close;

    if dtmdlWorktops.IsSQL then
      begin
        sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
        SQL.Text := sText;
      end;

    ParamByName('Remedial_ID').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aSlab := TRSlab.Create(Self);
      aSlab.RSlabNo := FieldByName('Slab_Number').AsInteger;
      aSlab.Material := fieldbyname('Material_Type').asinteger;
      aSlab.Worktop := FieldByName('Worktop').AsInteger;
      aSlab.WorktopDesc := FieldByName('Worktop_Description').Asstring;
      aSlab.Thickness := FieldByName('Thickness').asinteger;
      aSlab.ThicknessDesc := FieldByName('Thickness_Description').Asstring;
      aSlab.Supplier := fieldbyname('Supplier').asinteger;
      aSlab.SupplierName := fieldbyname('Supplier_Name').asstring;
      aSlab.length := fieldbyname('Length').asinteger;
      aSlab.Depth := fieldbyname('Depth').asinteger;
      if fieldbyname('Quantity').asfloat = 0 then
        aSlab.Quantity := 1
      else
        aSlab.Quantity := fieldbyname('Quantity').asfloat;
      aSlab.UnitCost := FieldByName('Unit_Cost').asfloat;
      aSlab.PriceUnit := FieldByName('Price_unit').asinteger;
      aSlab.WasteMultiplier := FieldByName('Waste_Cost_Multiplier').asinteger;
      aSlab.WastePercentage := FieldByName('Waste_Percentage').asinteger;
      aSlab.WasteValue := FieldByName('Waste_Value').asfloat;

      aSlab.MarkupPercentage := fieldbyname('Markup_Percentage').asfloat;
      aSlab.UnitPrice := fieldbyname('Unit_Price').asfloat;
      aSlab.SlabSize := fieldbyname('Slab_Size').asinteger;

      aSlab.AdhesiveProductCode := fieldbyname('Adhesive_Product_Code').asstring;
      aSlab.AdhesiveDescription := fieldbyname('Adhesive_Description').asstring;
      aSlab.AdhesiveQuantity := fieldbyname('Adhesive_Quantity').asinteger;
      aSlab.AdhesiveCostPackQuantity := fieldbyname('Adhesive_Cost_Pack_Quantity').asinteger;
      if aSlab.AdhesiveCostPackQuantity = 0 then
        aSlab.AdhesiveCostPackQuantity := 1;
      aSlab.AdhesiveUnitCost := fieldbyname('Adhesive_Unit_Cost').asfloat;

      FRSlabs.Add(aSlab);
      Next;
    end;
    Close;
  end;
end;

procedure TRemedial.SaveSlabs;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteSlabs;  { Get rid of any already in database }
  FRSlabs.Renumber;
  for i := 0 to Pred(FRSlabs.Count) do
    begin
      FRSlabs[i].SaveToDB;
    end;
end;

procedure TRemedial.DeleteSlabs;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Remedial_Slab WHERE Remedial_ID =' + IntToStr(DbKey));
    ExecSQL;
  end;

end;
procedure TRemedial.SetCategory(const Value: integer);
begin
  FCategory := Value;
end;

procedure TRemedial.SetDateRaised(const Value: TDateTime);
begin
  FDateRaised := Value;
end;

procedure TRemedial.SetdbKey(const Value: integer);
begin
  FdbKey := Value;
end;

procedure TRemedial.SetDepartment(const Value: integer);
begin
  FDepartment := Value;
end;

procedure TRemedial.SetJob(const Value: integer);
begin
  FJob := Value;
end;

procedure TRemedial.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TRemedial.SetProductionRequired(const Value: boolean);
begin
  FProductionRequired := Value;
end;

procedure TRemedial.SetRemedialNo(const Value: integer);
begin
  FRemedialNo := Value;
end;

procedure TRemedial.SetRemedialType(const Value: integer);
begin
  FRemedialType := Value;
end;

procedure TRemedial.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
end;

{ TRSlabs }

procedure TRSlabs.Add(aSlab: TRSlab);
begin
  FItems.Add(aSlab);
end;

procedure TRSlabs.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TRSlab(FItems[i]).Free;
end;

function TRSlabs.Clone: TRSlabs;
var
  i : integer;
begin
  Result := TRSlabs.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TRSlab(FItems[i]).Clone);
end;

constructor TRSlabs.Create(Remedial: TRemedial);
begin
  FParent := Remedial;
  FItems := TList.Create;
end;

procedure TRSlabs.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TRSlabs.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TRSlab(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TRSlabs.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TRSlabs.GetItems(Index: integer): TRSlab;
begin
  Result := TRSlab(FItems[Index]);
end;

function TRSlabs.GetTotalArea: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TRSlab(FItems[i]).TotalArea;
end;

function TRSlabs.GetTotalCosts: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TRSlab(FItems[i]).TotalCost;

end;

function TRSlabs.GetTotalWasteCosts: double;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(FItems.Count) do
    Result := Result + TRSlab(FItems[i]).TotalWasteCost;
end;

function TRSlabs.IndexOf(const SlabNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TRSlab(FItems[i]).RSlabNo = SlabNo then
      Result := i;
end;

procedure TRSlabs.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TRSlab(FItems[i]).RSlabNo:= i+1;
end;

procedure TRSlabs.SetItems(Index: integer; const Value: TRSlab);
begin
  FItems[Index] := Value;
end;

{ TRSlab }

function TRSlab.Clone: TRSlab;
begin
  Result := TRSlab.Create(FParent);

  Result.AdhesiveProductCode := self.AdhesiveProductCode;
  Result.AdhesiveDescription := self.AdhesiveDescription;
  Result.AdhesiveQuantity :=    self.AdhesiveQuantity;
  Result.AdhesiveCostPackQuantity
                          :=    self.AdhesiveCostPackQuantity;
  Result.AdhesiveUnitCost :=    self.AdhesiveUnitCost;
  Result.Material       :=      self.Material;
  Result.MarkupPercentage :=    self.MarkupPercentage;
  Result.Worktop        :=      self.worktop;
  Result.WorktopDesc    :=      self.worktopdesc;
  Result.Thickness      :=      self.thickness;
  Result.thicknessDesc  :=      self.thicknessDesc;
  Result.SlabSize       :=      self.SlabSize;
  Result.Supplier       :=      self.Supplier;
  Result.SupplierName   :=      self.SupplierName;
  Result.Length         :=      self.Length;
  Result.Depth          :=      self.Depth;
  Result.UnitCost       :=      self.UnitCost;
  Result.UnitPrice      :=      self.UnitPrice;
  Result.PriceUnit      :=      self.PriceUnit;
  Result.RSlabNo        :=      self.RSlabNo;
  Result.Quantity        :=      self.Quantity;
  Result.WasteMultiplier :=     self.WasteMultiplier;
  Result.WastePercentage :=     self.WastePercentage;
  Result.WasteValue      :=      self.WasteValue;
end;

constructor TRSlab.Create(Remedial: TRemedial);
begin
  FParent := Remedial;
end;

destructor TRSlab.Destroy;
begin

  inherited;
end;

function TRSlab.GetTotalArea: double;
begin
  Result := ((Length * Depth)/1000000)*Quantity;
end;

function TRSlab.GetTotalCost: double;
begin
  Result := ((((Length * Depth)/1000000) * UnitCost)*Quantity) + (AdhesiveUnitCost * (AdhesiveQuantity/self.AdhesiveCostPackQuantity));
end;

function TRSlab.GetTotalPrice: double;
begin
  Result := (((Length * Depth)/1000000) * UnitPrice)*Quantity;
end;

function TRSlab.GetTotalWasteCost: double;
begin
  Result := ((((Length * Depth)/1000000) * UnitCost) * ((WastePercentage/100.0000) * WasteMultiplier))*Quantity;
end;

procedure TRSlab.SaveToDB;
var
//  dtmdlRemedialSupplier: TdtmdlSuppliers;
  iCount, iPricePointer: integer;
  stext: string;
begin
  with FParent.FDataModule.qryRAddSlab do
  begin
    ParamByName('Remedial_ID').AsInteger := FParent.DbKey;
    ParamByName('Slab_Number').AsInteger := RSlabNo;
    Parambyname('Worktop').AsInteger := Worktop;
    Parambyname('Thickness').AsInteger := Thickness;
    Parambyname('Supplier').AsInteger := Supplier;
    Parambyname('Length').AsInteger := Length;
    Parambyname('Depth').AsInteger := Depth;
    Parambyname('Unit_Cost').Asfloat := UnitCost;
    Parambyname('Quantity').Asfloat := Quantity;
    Parambyname('Price_Unit').Asinteger := PriceUnit;
    Parambyname('Waste_Percentage').Asinteger := WastePercentage;
    Parambyname('Waste_Value').Asfloat := WasteValue;
    Parambyname('Waste_Cost_Multiplier').AsInteger := WasteMultiplier;
    Parambyname('Markup_Percentage').Asfloat := MarkupPercentage;
    Parambyname('Unit_Price').Asfloat := UnitPrice;
    if SlabSize = 0 then
      Parambyname('Slab_Size').clear
    else
      Parambyname('Slab_Size').AsInteger := SlabSize;

    Parambyname('Adhesive_Product_Code').Asstring := AdhesiveProductCode;
    Parambyname('Adhesive_Quantity').Asinteger := AdhesiveQuantity;
    Parambyname('Adhesive_Unit_Cost').Asfloat := AdhesiveUnitCost;
    Parambyname('Adhesive_Cost_Pack_Quantity').Asfloat := AdhesiveCostPackQuantity;

    execsql;
  end;
(*
  {Create the prices in the supplier}
  if UnitCost > 0 then
    begin
      dtmdlRemedialSupplier := TdtmdlSuppliers.create(application);
      try
        {Check Supplier/Worktop}
        dtmdlRemedialSupplier.qryChkSupplierWT.close;
        dtmdlRemedialSupplier.qryChkSupplierWT.parambyname('Supplier').asinteger := Supplier;
        dtmdlRemedialSupplier.qryChkSupplierWT.parambyname('Worktop').asinteger := Worktop;
        dtmdlRemedialSupplier.qryChkSupplierWT.open;

        if dtmdlRemedialSupplier.qryChkSupplierWT.recordcount = 0 then
          begin
            {Add Supplier/Worktop record}
            dtmdlRemedialSupplier.qryAddSupplierWT.close;
            dtmdlRemedialSupplier.qryAddSupplierWT.parambyname('Supplier').asinteger := Supplier;
            dtmdlRemedialSupplier.qryAddSupplierWT.parambyname('Worktop').asinteger := Worktop;
            dtmdlRemedialSupplier.qryAddSupplierWT.execsql;
          end;

        {Check for Supplier/Worktop/Thickness}

        dtmdlRemedialSupplier.qryChkSupplierWTThickness.close;

        if dtmdlWorktops.IsSQL then
          begin
            sText := stringreplace(dtmdlRemedialSupplier.qryChkSupplierWTThickness.SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
            dtmdlRemedialSupplier.qryChkSupplierWTThickness.SQL.Text := sText;
          end;

        dtmdlRemedialSupplier.qryChkSupplierWTThickness.parambyname('Supplier').asinteger := Supplier;
        dtmdlRemedialSupplier.qryChkSupplierWTThickness.parambyname('Worktop').asinteger := Worktop;
        dtmdlRemedialSupplier.qryChkSupplierWTThickness.parambyname('Thickness').asinteger := Thickness;
        dtmdlRemedialSupplier.qryChkSupplierWTThickness.open;

        {If the worktop and thickness already exists for this supplier then don't add}
        if dtmdlRemedialSupplier.qryChkSupplierWTThickness.recordcount = 0 then
          begin
            {Get Price Pointer}
            dtmdlWorktops.qryNewPrice.Close;
            dtmdlWorktops.qryNewPrice.Open;
            iPricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

                         dtmdlWorktops.qryAddPointer.Close;
            dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := iPricePointer;
            dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
                         dtmdlWorktops.qryAddPointer.ExecSQl;

            {Add Supplier/Worktop/Thickness record}
            dtmdlRemedialSupplier.qryAddSupplierWTThickness.close;
            dtmdlRemedialSupplier.qryAddSupplierWTThickness.parambyname('Supplier').asinteger := Supplier;
            dtmdlRemedialSupplier.qryAddSupplierWTThickness.parambyname('Worktop').asinteger := Worktop;
            dtmdlRemedialSupplier.qryAddSupplierWTThickness.parambyname('Thickness').asinteger := Thickness;
            dtmdlRemedialSupplier.qryAddSupplierWTThickness.parambyname('Price_Pointer').asinteger := iPricePointer;
            dtmdlRemedialSupplier.qryAddSupplierWTThickness.execsql;
          end
        else
          begin
            if dtmdlRemedialSupplier.qryChkSupplierWTThickness.fieldbyname('Unit_Cost').asfloat > 0 then
              exit
            else
              iPricePointer := dtmdlRemedialSupplier.qryChkSupplierWTThickness.fieldbyname('Price_Pointer').asinteger;
          end;

        {Now add the cost price}
        dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := iPricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := 0.00;
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := UnitCost;
                     dtmdlWorktops.qryAddPrice.execSQL;

      finally
        dtmdlRemedialSupplier.Free;
      end;
    end;
*)
end;

procedure TRSlab.SetAdhesiveCostPackQuantity(const Value: integer);
begin
  FAdhesiveCostPackQuantity := Value;
end;

procedure TRSlab.SetAdhesiveDescription(const Value: string);
begin
  FAdhesiveDescription := Value;
end;

procedure TRSlab.SetAdhesiveProductCode(const Value: string);
begin
  FAdhesiveProductCode := Value;
end;

procedure TRSlab.SetAdhesiveQuantity(const Value: integer);
begin
  FAdhesiveQuantity := Value;
end;

procedure TRSlab.SetAdhesiveUnitCost(const Value: currency);
begin
  FAdhesiveUnitCost := Value;
end;

procedure TRSlab.SetDepth(const Value: integer);
begin
  FDepth := Value;
end;

procedure TRSlab.SetLength(const Value: integer);
begin
  FLength := Value;
end;

procedure TRSlab.SetMarkupPercentage(const Value: double);
begin
  FMarkupPercentage := Value;
end;

procedure TRSlab.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
end;

procedure TRSlab.SetParent(const Value: TRemedial);
begin
  FParent := Value;
end;

procedure TRSlab.SetPriceUnit(const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TRSlab.SetRSlabNo(const Value: integer);
begin
  FRSlabNo := Value;
end;

procedure TRSlab.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TRSlab.SetSlabSize(const Value: integer);
begin
  FSlabSize := Value;
end;

procedure TRSlab.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TRSlab.SetSupplierName(const Value: string);
begin
  FSupplierName := Value;
end;

procedure TRSlab.Setthickness(const Value: integer);
begin
  Fthickness := Value;
end;

procedure TRSlab.SetthicknessDesc(const Value: string);
begin
  FthicknessDesc := Value;
end;

procedure TRSlab.SetUnitCost(const Value: currency);
begin
  FUnitCost := Value;
end;

procedure TRSlab.SetUnitPrice(const Value: currency);
begin
  FUnitPrice := Value;
end;

procedure TRSlab.SetWasteMultiplier(const Value: integer);
begin
  FWasteMultiplier := Value;
end;

procedure TRSlab.SetWastePercentage(const Value: integer);
begin
  FWastePercentage := Value;
end;

procedure TRSlab.SetWasteValue(const Value: double);
begin
  FWasteValue := Value;
end;

procedure TRSlab.Setworktop(const Value: integer);
begin
  Fworktop := Value;
end;

procedure TRSlab.Setworktopdesc(const Value: string);
begin
  Fworktopdesc := Value;
end;

end.
