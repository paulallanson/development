unit STStkTkObject;

interface

uses
  classes, forms;

type
  TLotNumber = class
  private
    FLotNumberRef: string;
    FQtyCounted: integer;
    FStock_Take_No: integer;
    procedure SetLotNumberRef(const Value: string);
    procedure SetQtyCounted(const Value: integer);
    procedure SetStockTakeNo(const Value: integer);
  public
    function Clone: TLotNumber;
    procedure Assign(aDetail: TLotNumber);
    property LotNumberRef: string read FLotNumberRef write SetLotNumberRef;
    property QtyCounted: integer read FQtyCounted write SetQtyCounted;
    property StockTakeNo: integer read FStock_Take_No write SetStockTakeNo;
    end;

  TLotNumbers = class;

  TCountLine = class
  private
    FQtyPrior: integer;
    FLine: integer;
    FPartBin: string;
    FPartStoreLot: string;
    FPart: string;
    FQtyCounted: integer;
    FSerialNumbers: boolean;
    FLotNumbers: TLotNumbers;
    FCountBin: string;
    FCountLot: string;
    fStockTakeNo: integer;
    fActionTkn: string;
    fLineStatus: string;
    fBinPrior: string;
    fLotPrior: string;
    fPackQty: integer;
    fPriorPackQty: integer;
    procedure SetLine(const Value: integer);
    procedure SetPart(const Value: string);
    procedure SetPartBin(const Value: string);
    procedure SetPartStoreLot(const Value: string);
    procedure SetQtyPrior(const Value: integer);
    procedure SetQtyCounted(const Value: integer);
    procedure SetSerialNumbers(const Value: boolean);
    procedure SetCountBin(const Value: string);
    procedure SetCountLot(const Value: string);
    procedure SetActionTkn(const Value: string);
    procedure SetStockTakeNo(const Value: integer);
    procedure SetLineStatus(const Value: string);
    procedure SetBinPrior(const Value: string);
    procedure SetLotPrior(const Value: string);
    procedure setPackQty(const Value: integer);
    procedure setPriorPackQty(const Value: integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(aLine: TCountLine);
    function Clone: TCountLine;
    property Line: integer read FLine write SetLine;
    property PartBin: string read FPartBin write SetPartBin;
    property PartStoreLot: string read FPartStoreLot write SetPartStoreLot;
    property QtyPrior: integer read FQtyPrior write SetQtyPrior;
    property Part: string read FPart write SetPart;
    property QtyCounted: integer read FQtyCounted write SetQtyCounted;
    property SerialNumbers: boolean read FSerialNumbers write SetSerialNumbers;
    property LotNumbers: TLotNumbers read FLotNumbers;
    property CountBin: string read FCountBin write SetCountBin;
    property CountLot: string read FCountLot write SetCountLot;
    property StockTakeNo: integer read fStockTakeNo write SetStockTakeNo;
    property BinPrior: string read fBinPrior write SetBinPrior;
    property LotPrior: string read fLotPrior write SetLotPrior;
    property ActionTkn: string read fActionTkn write SetActionTkn;
    property LineStatus: string read fLineStatus write SetLineStatus;
    property PackQty: integer read fPackQty write setPackQty;
    property PriorPackQty: integer read fPriorPackQty write setPriorPackQty;
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

  TCountLines = class
  private
    FLines: TList;
    FMaxLines: Integer;
    function GetCount: Integer;
    function GetLines(Index: Integer): TCountLine;
    procedure SetLines(Index: Integer; const Value: TCountLine);
  public
    constructor Create;
    destructor Destroy; override;
    function Clone: TCountLines;
    procedure Add(aLine: TCountLine);
    procedure Delete(const Index: Integer);
    procedure Clear;
    property Count: Integer read GetCount;
    property Lines[Index: Integer]: TCountLine read GetLines write SetLines;
    default;
    property MaxLines: Integer read FMaxLines;
  end;

  Tcountinglist = class
  private
    FcountinglistRef: string;
    FCountLines: TCountLines;
    FPartStore: integer;
    FBinsInUSe: boolean;
    FLotsInUSe: boolean;
    procedure SetcountinglistRef(const Value: string);
    procedure SetCountLines(const Value: TCountLines);
    procedure SetPartStore(const Value: integer);
    procedure SetBinsInUSe(const Value: boolean);
    procedure SetLotsInUSe(const Value: boolean);
  public
    constructor Create(DataMod: TDataModule);
    destructor Destroy; override;
    function Clone: Tcountinglist;
    procedure Clear;
    property countinglistRef: string read FcountinglistRef write SetcountinglistRef;
    property PartStore: integer read FPartStore write SetPartStore;
    property BinsInUSe: boolean read FBinsInUSe write SetBinsInUSe;
    property LotsInUSe: boolean read FLotsInUSe write SetLotsInUSe;
    property CountLines: TCountLines read FCountLines write SetCountLines;
 end;

var
  countinglist: Tcountinglist;

implementation

{ Tcountinglist }

procedure Tcountinglist.Clear;
begin
  FCountLines.Clear;
  FcountinglistRef := '';
end;

procedure Tcountinglist.SetcountinglistRef(const Value: string);
begin
  FcountinglistRef := Value;
end;

function TCountLines.GetCount: Integer;
begin
  Result := FLines.Count;
end;

function TCountLines.GetLines(Index: Integer): TCountLine;
begin
  Result := FLines[Index];
end;

procedure TCountLines.SetLines(Index: Integer; const Value: TCountLine);
begin
  FLines[Index] := Value;
end;

procedure Tcountinglist.SetCountLines(const Value: TCountLines);
begin
  FCountLines := Value;
end;

function Tcountinglist.Clone: Tcountinglist;
begin
  Result := Tcountinglist.Create(nil);
  Result.CountLines.Free;
  Result.CountLines := Self.CountLines.Clone;
  Result.countinglistRef := Self.countinglistRef;
  Result.PartStore := Self.PartStore;
  Result.BinsInUse := Self.BinsInUse;
  Result.LotsInUse := Self.LotsInUse;
end;

constructor Tcountinglist.Create(DataMod : TDataModule);
begin
  FCountLines := TCountLines.Create;
end;

destructor Tcountinglist.Destroy;
begin
  FCountLines.Free;
  FCountLines := nil;
  inherited;
end;

procedure Tcountinglist.SetPartStore(const Value: integer);
begin
  FPartStore := Value;
end;

procedure Tcountinglist.SetBinsInUSe(const Value: boolean);
begin
  FBinsInUSe := Value;
end;

procedure Tcountinglist.SetLotsInUSe(const Value: boolean);
begin
  FLotsInUSe := Value;
end;

{ TCountLine }

procedure TCountLine.Assign(aLine: TCountLine);
begin
  FLotNumbers.free;
  FLotNumbers := aLine.FLotNumbers.Clone;
  Line := aLine.Line;
  PartBin := aLine.PartBin;
  PartStoreLot := aLine.PartStoreLot;
  CountBin := aLine.CountBin;
  CountLot := aLine.CountLot;
  QtyPrior := aLine.QtyPrior;
  QtyCounted := aLine.QtyCounted;
  Part := aLine.Part;
  SerialNumbers := aLine.SerialNumbers;
  ActionTkn := aLine.ActionTkn;
  StockTakeNo := aLine.StockTakeNo;
  PackQty := aLine.PackQty;
  PriorPackQty := aLine.PriorPackQty;
end;

function TCountLine.Clone: TCountLine;
begin
  Result := TCountLine.Create;
  Result.Assign(Self);
end;

constructor TCountLine.Create;
begin
  FLotNumbers := TLotNumbers.Create;
end;

destructor TCountLine.Destroy;
begin
  FLotNumbers.Free;
  FLotNumbers := nil;
  inherited;
end;

procedure TCountLine.SetLine(const Value: integer);
begin
  FLine := Value;
end;

procedure TCountLine.SetPart(const Value: string);
begin
  FPart := Value;
end;

procedure TCountLine.SetPartBin(const Value: string);
begin
  FPartBin := Value;
end;

procedure TCountLine.SetPartStoreLot(const Value: string);
begin
  FPartStoreLot := Value;
end;

procedure TCountLine.SetCountBin(const Value: string);
begin
  FCountBin := Value;
end;

procedure TCountLine.SetCountLot(const Value: string);
begin
  FCountLot := Value;
end;

procedure TCountLine.SetQtyPrior(const Value: integer);
begin
  FQtyPrior := Value;
end;

procedure TCountLine.SetQtyCounted(const Value: integer);
begin
  FQtyCounted := Value;
end;

procedure TCountLine.SetSerialNumbers(const Value: boolean);
begin
  FSerialNumbers := Value;
end;


procedure TCountLine.SetActionTkn(const Value: string);
begin
  fActionTkn := Value;
end;

procedure TCountLine.SetStockTakeNo(const Value: integer);
begin
  fStockTakeNo := Value;
end;

procedure TCountLine.SetLineStatus(const Value: string);
begin
  fLineStatus := Value;
end;

procedure TCountLine.SetBinPrior(const Value: string);
begin
  fBinPrior := Value;
end;

procedure TCountLine.SetLotPrior(const Value: string);
begin
  fLotPrior := Value;
end;

procedure TCountLine.setPackQty(const Value: integer);
begin
  fPackQty := Value;
end;

procedure TCountLine.setPriorPackQty(const Value: integer);
begin
  fPriorPackQty := Value;
end;

{ TCountLines}

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
  if TCountLine(Item1).Line = TCountLine(Item2).Line then
    Result := 0
  else
    if TCountLine(Item1).Line < TCountLine(Item2).Line then
    Result := -1
  else
    Result := 1;
end;

function TCountLines.Clone: TCountLines;
var
  i: Integer;
begin
  Result := TCountLines.Create;
  for i := 0 to Pred(Count) do
    Result.Add(Lines[i].Clone);
end;

constructor TCountLines.Create;
begin
  FLines := TList.Create;
end;

destructor TCountLines.Destroy;
begin
  Clear;
  FLines.Free;
  FLines := nil;
  inherited;
end;

procedure TCountLines.Clear;
var
  i: Integer;
begin
  for i := 0 to Pred(FLines.Count) do
  begin
    TCountLine(FLines[i]).Free;
    FLines[i] := nil;
  end;
  FLines.Clear;
end;

procedure TCountLines.Add(aLine: TCountLine);
begin
  FLines.Add(aLine);
  FLines.Sort(CompareLineNo);
end;

procedure TCountLines.Delete(const Index: Integer);
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
  i: Integer;
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
  i: Integer;
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

procedure TLotNumber.SetQtyCounted(const Value: integer);
begin
  FQtyCounted := Value;
end;

procedure TLotNumber.SetStockTakeNo(const Value: integer);
begin
  FStock_Take_No := Value;
end;

end.
