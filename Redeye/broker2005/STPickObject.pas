unit STPickObject;

interface

uses
  classes, forms;

type
  TLotNumber = class
  private
    FLotNumberRef: string;
    FQtyPicked: integer;
    fQtyPickedinPacks: String;
    procedure SetLotNumberRef(const Value: string);
    procedure SetQtyPicked(const Value: integer);
    procedure SetQtyPickedinPacks(const Value: String);
  public
    function Clone: TLotNumber;
    procedure Assign(aDetail: TLotNumber);
    property LotNumberRef: string read FLotNumberRef write SetLotNumberRef;
    property QtyPicked: integer read FQtyPicked write SetQtyPicked;
    property QtyPickedinPacks: String read fQtyPickedinPacks write SetQtyPickedinPacks;
  end;

  TLotNumbers = class;

  TPickLine = class
  private
    FQtyAlloc: integer;
    FLine: integer;
    FPartBin: string;
    FPartStoreLot: string;
    FPartsForJob: string;
    FJob: string;
    FPart: string;
    FStoreStock: integer;
    FPurchaseOrderLine: integer;
    FPurchaseOrder: integer;
    FQtyPicked: integer;
    FSerialNumbers: boolean;
    FLotNumbers: TLotNumbers;
    FPickBin: string;
    FPickLot: string;
    fSalesOrder: integer;
    FSalesOrderLine: integer;
    fQtyAllocInPacks: string;
    fQtyPickedInPacks: string;
    fPacksize: integer;
    FLotDate: TDateTime;
    FLotDescription: string;
    FSetsPerPad: integer;
    FPaidStock: boolean;
    FPickCost: double;
    FOrigPurchaseOrder: real;
    FProductID: integer;
    FPalletID: integer;
    FOvers: string;
    procedure SetJob(const Value: string);
    procedure SetLine(const Value: integer);
    procedure SetPart(const Value: string);
    procedure SetPartBin(const Value: string);
    procedure SetPartsForJob(const Value: string);
    procedure SetPartStoreLot(const Value: string);
    procedure SetQtyAlloc(const Value: integer);
    procedure SetStoreStock(const Value: integer);
    procedure SetPurchaseOrder(const Value: integer);
    procedure SetPurchaseOrderLine(const Value: integer);
    procedure SetQtyPicked(const Value: integer);
    procedure SetSerialNumbers(const Value: boolean);
    procedure SetPickBin(const Value: string);
    procedure SetPickLot(const Value: string);
    procedure setSalesOrder(const Value: integer);
    procedure setSalesOrderLine(const Value: integer);
    procedure setQtyAllocInPacks(const Value: string);
    procedure setQtyPickedinPacks(const Value: string);
    procedure setPacksize(const Value: integer);
    procedure SetLotDate(const Value: TDateTime);
    procedure SetLotDescription(const Value: string);
    procedure SetSetsPerPad(const Value: integer);
    procedure SetPaidStock(const Value: boolean);
    procedure SetPickCost(const Value: double);
    procedure SetOrigPurchaseOrder(const Value: real);
    procedure SetOvers(const Value: string);
    procedure SetPalletID(const Value: integer);
    procedure SetProductID(const Value: integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(aLine: TPickLine);
    function Clone: TPickLine;
    property Line: integer read FLine write SetLine;
    property PartsForJob: string read FPartsForJob write SetPartsForJob;
    property StoreStock: integer read FStoreStock write SetStoreStock;
    property PartBin: string read FPartBin write SetPartBin;
    property PartStoreLot: string read FPartStoreLot write SetPartStoreLot;
    property QtyAlloc: integer read FQtyAlloc write SetQtyAlloc;
    property Part: string read FPart write SetPart;
    property Job: string read FJob write SetJob;
    property PurchaseOrder: integer read FPurchaseOrder write SetPurchaseOrder;
    property PurchaseOrderLine: integer read FPurchaseOrderLine write SetPurchaseOrderLine;
    property SalesOrderLine: integer read FSalesOrderLine write setSalesOrderLine;
    property SalesOrder: integer read fSalesOrder write setSalesOrder;
    property QtyPicked: integer read FQtyPicked write SetQtyPicked;
    property SerialNumbers: boolean read FSerialNumbers write SetSerialNumbers;
    property LotNumbers: TLotNumbers read FLotNumbers;
    property LotDate: TDateTime read FLotDate write SetLotDate;
    property LotDescription: string read FLotDescription write SetLotDescription;
    property OrigPurchaseOrder: real read FOrigPurchaseOrder write SetOrigPurchaseOrder;
    property Overs: string read FOvers write SetOvers;
    property PalletID: integer read FPalletID write SetPalletID;
    property ProductID: integer read FProductID write SetProductID;
    property PickBin: string read FPickBin write SetPickBin;
    property PickLot: string read FPickLot write SetPickLot;
    property QtyAllocInPacks: string read fQtyAllocInPacks write setQtyAllocInPacks;
    property QtyPickedInPacks: string read fQtyPickedInPacks write setQtyPickedinPacks;
    property PaidStock: boolean read FPaidStock write SetPaidStock;
    property Packsize: integer read fPacksize write setPacksize;
    property SetsPerPad: integer read FSetsPerPad write SetSetsPerPad;
    property PickCost: double read FPickCost write SetPickCost;
  end;

  TLotNumbers = class
  private
    FLots: TList;
    function GetLots(Index: Integer): TLotNumber;
    procedure SetLots(Index: Integer; const Value: TLotNumber);
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aLots: TLotNumber);
    procedure Clear;
    procedure Delete(const Index: Integer);
    function Clone: TLotNumbers;
    property Lots[Index: Integer]: TLotNumber
      read GetLots write SetLots; default;
    property Count: integer read GetCount;
  end;

  TPickLines = class
  private
    FLines: TList;
    FMaxLines: Integer;
    function GetCount: Integer;
    function GetLines(Index: Integer): TPickLine;
    procedure SetLines(Index: Integer; const Value: TPickLine);
  public
    constructor Create;
    destructor Destroy; override;
    function Clone: TPickLines;
    procedure Add(aLine: TPickLine);
    procedure Delete(const Index: Integer);
    procedure Clear;
    property Count: Integer read GetCount;
    property Lines[Index: Integer]: TPickLine read GetLines write SetLines;
    default;
    property MaxLines: Integer read FMaxLines;
  end;

  TPickingList = class
  private
    FPickingListRef: string;
    FPickLines: TPickLines;
    FPartStore: integer;
    FBinsInUSe: boolean;
    FLotsInUSe: boolean;
    procedure SetPickingListRef(const Value: string);
    procedure SetPickLines(const Value: TPickLines);
    procedure SetPartStore(const Value: integer);
    procedure SetBinsInUSe(const Value: boolean);
    procedure SetLotsInUSe(const Value: boolean);
    function GetTotalUnPaidPickQty: integer;
    function GetTotalUnPaidAllocQty: integer;
  public
    constructor Create(DataMod: TDataModule);
    destructor Destroy; override;
    function Clone: TPickingList;
    procedure Clear;
    property PickingListRef: string read FPickingListRef write SetPickingListRef;
    property PartStore: integer read FPartStore write SetPartStore;
    property BinsInUSe: boolean read FBinsInUSe write SetBinsInUSe;
    property LotsInUSe: boolean read FLotsInUSe write SetLotsInUSe;
    property PickLines: TPickLines read FPickLines write SetPickLines;
    property TotalUnPaidPickQty: integer read GetTotalUnPaidPickQty;
    property TotalUnPaidAllocQty: integer read GetTotalUnPaidAllocQty;
 end;

var
  PickingList               : TPickingList;

implementation

{ TPickingList }

procedure TPickingList.Clear;
begin
  FPickLines.Clear;
  FPickingListRef := '';
end;

procedure TPickingList.SetPickingListRef(const Value: string);
begin
  FPickingListRef := Value;
end;

function TPickLines.GetCount: Integer;
begin
  Result := FLines.Count;
end;

function TPickLines.GetLines(Index: Integer): TPickLine;
begin
  Result := FLines[Index];
end;

procedure TPickLines.SetLines(Index: Integer; const Value: TPickLine);
begin
  FLines[Index] := Value;
end;

procedure TPickingList.SetPickLines(const Value: TPickLines);
begin
  FPickLines := Value;
end;

function TPickingList.Clone: TPickingList;
begin
  Result := TPickingList.Create(nil);
  Result.PickLines.Free;
  Result.PickLines := Self.PickLines.Clone;
  Result.PickingListRef := Self.PickingListRef;
  Result.PartStore := Self.PartStore;
  Result.BinsInUse := Self.BinsInUse;
  Result.LotsInUse := Self.LotsInUse;
end;

constructor TPickingList.Create(DataMod : TDataModule);
begin
  FPickLines := TPickLines.Create;
end;

destructor TPickingList.Destroy;
begin
  FPickLines.Free;
  FPickLines := nil;
  inherited;
end;

procedure TPickingList.SetPartStore(const Value: integer);
begin
  FPartStore := Value;
end;

procedure TPickingList.SetBinsInUSe(const Value: boolean);
begin
  FBinsInUSe := Value;
end;

procedure TPickingList.SetLotsInUSe(const Value: boolean);
begin
  FLotsInUSe := Value;
end;

function TPickingList.GetTotalUnPaidPickQty: integer;
var
  i: integer;
begin
  result := 0;
  for i := 0 to pred(FPickLines.count) do
    begin
      if not FPickLines[i].PaidStock then
        result := result + FPickLines[i].Qtypicked
    end
end;

function TPickingList.GetTotalUnPaidAllocQty: integer;
var
  i: integer;
begin
  result := 0;
  for i := 0 to pred(FPickLines.count) do
    begin
      if not FPickLines[i].PaidStock then
        result := result + FPickLines[i].QtyAlloc;
    end
end;

{ TPickLine }

procedure TPickLine.Assign(aLine: TPickLine);
begin
  FLotNumbers.free;
  FLotNumbers := aLine.FLotNumbers.Clone;
  LotDate := aLine.LotDate;
  LotDescription := aLine.LotDescription;
  Line := aLine.Line;
  OrigPurchaseOrder := aLine.OrigPurchaseOrder;
  PartsForJob := aLine.PartsForJob;
  StoreStock := aLine.StoreStock;
  PaidStock := aLine.PaidStock;
  PartBin := aLine.PartBin;
  PartStoreLot := aLine.PartStoreLot;
  PickBin := aLine.PickBin;
  PickLot := aLine.PickLot;
  QtyAlloc := aLine.QtyAlloc;
  QtyPicked := aLine.QtyPicked;
  QtyPickedinPacks := aLine.QtyPickedinPacks;
  QtyAllocInPacks := aLine.QtyAllocinPacks;
  Packsize := aLine.Packsize;
  Part := aLine.Part;
  Job := aLine.Job;
  Overs := aLine.Overs;
  PalletID := aline.PalletID;
  ProductID := aLine.ProductID;
  PurchaseOrder := aLine.PurchaseOrder;
  PurchaseOrderLine := aLine.PurchaseOrderLine;
  SerialNumbers := aLine.SerialNumbers;
  SalesOrder := aLine.SalesOrder;
  SalesOrderLine := aLine.SalesOrderLine;
  SetsPerPad := aLine.SetsPerPad;
  PickCost := aLine.PickCost;
end;

function TPickLine.Clone: TPickLine;
begin
  Result := TPickLine.Create;
  Result.Assign(Self);
end;

constructor TPickLine.Create;
begin
  FLotNumbers := TLotNumbers.Create;
end;

destructor TPickLine.Destroy;
begin
  FLotNumbers.Free;
  FLotNumbers := nil;
  inherited;
end;

procedure TPickLine.SetJob(const Value: string);
begin
  FJob := Value;
end;

procedure TPickLine.SetLine(const Value: integer);
begin
  FLine := Value;
end;

procedure TPickLine.SetLotDate(const Value: TDateTime);
begin
  FLotDate := Value;
end;

procedure TPickLine.SetLotDescription(const Value: string);
begin
  FLotDescription := Value;
end;

procedure TPickLine.SetOrigPurchaseOrder(const Value: real);
begin
  FOrigPurchaseOrder := Value;
end;

procedure TPickLine.SetOvers(const Value: string);
begin
  FOvers := Value;
end;

procedure TPickLine.setPacksize(const Value: integer);
begin
  fPacksize := Value;
end;

procedure TPickLine.SetPaidStock(const Value: boolean);
begin
  FPaidStock := Value;
end;

procedure TPickLine.SetPalletID(const Value: integer);
begin
  FPalletID := Value;
end;

procedure TPickLine.SetPart(const Value: string);
begin
  FPart := Value;
end;

procedure TPickLine.SetPartBin(const Value: string);
begin
  FPartBin := Value;
end;

procedure TPickLine.SetPartsForJob(const Value: string);
begin
  FPartsForJob := Value;
end;

procedure TPickLine.SetPartStoreLot(const Value: string);
begin
  FPartStoreLot := Value;
end;

procedure TPickLine.SetPickBin(const Value: string);
begin
  FPickBin := Value;
end;

procedure TPickLine.SetPickCost(const Value: double);
begin
  FPickCost := Value;
end;

procedure TPickLine.SetPickLot(const Value: string);
begin
  FPickLot := Value;
end;

procedure TPickLine.SetProductID(const Value: integer);
begin
  FProductID := Value;
end;

procedure TPickLine.SetPurchaseOrder(const Value: integer);
begin
  FPurchaseOrder := Value;
end;

procedure TPickLine.SetPurchaseOrderLine(const Value: integer);
begin
  FPurchaseOrderLine := Value;
end;

procedure TPickLine.SetQtyAlloc(const Value: integer);
begin
  FQtyAlloc := Value;
end;

procedure TPickLine.setQtyAllocInPacks(const Value: string);
begin
  fQtyAllocInPacks := Value;
end;

procedure TPickLine.SetQtyPicked(const Value: integer);
begin
  FQtyPicked := Value;
end;

procedure TPickLine.setQtyPickedinPacks(const Value: string);
begin
  fQtyPickedInPacks := Value;
end;

procedure TPickLine.setSalesOrder(const Value: integer);
begin
  fSalesOrder := Value;
end;

procedure TPickLine.setSalesOrderLine(const Value: integer);
begin
  FSalesOrderLine := Value;
end;

procedure TPickLine.SetSerialNumbers(const Value: boolean);
begin
  FSerialNumbers := Value;
end;

procedure TPickLine.SetSetsPerPad(const Value: integer);
begin
  FSetsPerPad := Value;
end;

procedure TPickLine.SetStoreStock(const Value: integer);
begin
  FStoreStock := Value;
end;

{ TPickLines}

function CompareLineNo(Item1, Item2: Pointer): Integer;
begin
  { Compare returns < 0 if Item1 is less and Item2, 0 if they are equal
    and > 0 if Item1 is greater than Item2.}
  if (Item1 = nil) and (Item2 = nil) then
    Result := 0
  else
  if (Item1 = nil) then
    Result := -1
  else
  if (Item2 = nil) then
    Result := 1
  else
  if TPickLine(Item1).Line = TPickLine(Item2).Line then
    Result := 0
  else
    if TPickLine(Item1).Line < TPickLine(Item2).Line then
    Result := -1
  else
    Result := 1;
end;

function TPickLines.Clone: TPickLines;
var
  i: Integer;
begin
  Result := TPickLines.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Lines[i].Clone);
end;

constructor TPickLines.Create;
begin
  FLines := TList.Create;
end;

destructor TPickLines.Destroy;
begin
  Clear;
  FLines.Free;
  FLines := nil;
  inherited;
end;

procedure TPickLines.Clear;
var
  i: Integer;
begin
  for i := 0 to Pred(FLines.Count) do
  begin
    TPickLine(FLines[i]).Free;
    FLines[i] := nil;
  end;
  FLines.Clear;
end;

procedure TPickLines.Add(aLine: TPickLine);
begin
  FLines.Add(aLine);
  FLines.Sort(CompareLineNo);
end;

procedure TPickLines.Delete(const Index: Integer);
begin
  FLines.Delete(Index);
end;

{ TLotNumbers }

constructor TLotNumbers.Create;
begin
  FLots := TList.Create;
end;

procedure TLotNumbers.Delete(const Index: Integer);
begin
  Flots.Delete(Index);
end;

destructor TLotNumbers.Destroy;
begin
  Clear;
  FLots.Free;
  FLots := nil;
  inherited;
end;

procedure TLotNumbers.Add(aLots: TLotNumber);
begin
  FLots.Add(aLots);
end;

procedure TLotNumbers.Clear;
var
  i                           : Integer;
begin
  for i := 0 to Pred(FLots.Count) do
  begin
    TLotNumber(FLots[i]).Free;
    FLots[i] := nil;
  end;
  FLots.Clear;
end;

function TLotNumbers.Clone: TLotNumbers;
var
  i                           : Integer;
begin
  Result := TLotNumbers.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Lots[i].Clone);
end;

function TLotNumbers.GetCount: Integer;
begin
  Result := FLots.Count;
end;

function TLotNumbers.GetLots(Index: Integer): TLotNumber;
begin
  Result := TLotNumber(FLots[Index]);
end;

procedure TLotNumbers.SetLots(Index: Integer; const Value: TLotNumber);
begin
  FLots[Index] := Value;
end;

{ TLotNumber }

procedure TLotNumber.Assign(aDetail: TLotNumber);
begin
  LotNumberRef := aDetail.LotNumberRef;
end;

function TLotNumber.Clone: TLotNumber;
begin
  Result := TLotNumber.Create;
  Result.Assign(Self);
end;


procedure TLotNumber.SetLotNumberRef(const Value: string);
begin
  FLotNumberRef := Value;
end;

procedure TLotNumber.SetQtyPicked(const Value: integer);
begin
  FQtyPicked := Value;
end;

procedure TLotNumber.SetQtyPickedinPacks(const Value: String);
begin
  fQtyPickedinPacks := Value;
end;

end.
