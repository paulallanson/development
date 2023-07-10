unit STStoreStockObj;

interface

type
  TPartStore = class
  private
    Fid: integer;
    FpartStoreName: string;
    procedure Setid(const Value: integer);
    procedure SetpartStoreName(const Value: string);
  public
    property id: integer read Fid write Setid;
    property partStoreName: string read FpartStoreName write SetpartStoreName;

  end;

  TStoreStock = class
  public

  private
    Fid: integer;
    FquantityAllocated: integer;
    FstoreCost: currency;
    FdateReceived: Tdatetime;
    FstoreQuantity: integer;
    FstockPackQuantity: integer;
    FinvoiceUpfront: boolean;
    FstoreStockDescription: string;
    FpartStore: TPartStore;
    Fpart: string;
    FpartStoreLot: string;
    FpartBin: string;
    Fmodified: boolean;
    FreadOnly: boolean;
    FSetsPerPad: integer;
    procedure Setid(const Value: integer);
    procedure SetquantityAllocated(const Value: integer);
    procedure SetdateReceived(const Value: Tdatetime);
    procedure SetstoreCost(const Value: currency);
    procedure SetstoreQuantity(const Value: integer);
    procedure SetinvoiceUpfront(const Value: boolean);
    procedure Setpart(const Value: string);
    procedure SetpartStore(const Value: TPartStore);
    procedure SetpartBin(const Value: string);
    procedure SetpartStoreLot(const Value: string);
    procedure SetstockPackQuantity(const Value: integer);
    procedure SetstoreStockDescription(const Value: string);
    procedure Setmodified(const Value: boolean);
    function GetpartStore: TPartStore;
    procedure SetreadOnly(const Value: boolean);
    procedure SetSetsPerPad(const Value: integer);
  published
    property id: integer read Fid write Setid;
    property quantityAllocated: integer read FquantityAllocated write SetquantityAllocated;
    property storeQuantity: integer read FstoreQuantity write SetstoreQuantity;
    property storeCost: currency read FstoreCost write SetstoreCost;
    property dateReceived: Tdatetime read FdateReceived write SetdateReceived;
    property part: string read Fpart write Setpart;
    property partStoreLot: string read FpartStoreLot write SetpartStoreLot;
    property partStore: TPartStore read GetpartStore write SetpartStore;
    property partBin: string read FpartBin write SetpartBin;
    property SetsPerPad: integer read FSetsPerPad write SetSetsPerPad;
    property stockPackQuantity: integer read FstockPackQuantity write SetstockPackQuantity;
    property storeStockDescription: string read FstoreStockDescription write SetstoreStockDescription;
    property invoiceUpfront: boolean read FinvoiceUpfront write SetinvoiceUpfront;
    procedure load;
    procedure save;
    procedure edit;
    procedure view;
    property modified: boolean read Fmodified write Setmodified;
    property readOnly: boolean read FreadOnly write SetreadOnly;
  end;


implementation

uses
  STStoreStockDM, STStoreStock;

{ TStoreStock }

procedure TStoreStock.edit;
var
  STStoreStockFrm: TSTStoreStockFrm;
begin
  STStoreStockFrm := TSTStoreStockFrm.Create(nil);
  try
    STStoreStockFrm.storeStock := self;

    STStoreStockFrm.ShowModal;
  finally
    STStoreStockFrm.Free;
  end;
end;

procedure TStoreStock.load;
var
  DMStoreStock: TDMStoreStock;
begin
  DMStoreStock := TDMStoreStock.Create(nil);
  try
    DMStoreStock.Load(self);
  finally
    DMStoreStock.Free;
  end;
end;

procedure TStoreStock.save;
var
  DMStoreStock: TDMStoreStock;
begin
  DMStoreStock := TDMStoreStock.Create(nil);
  try
    DMStoreStock.Save(self);
  finally
    DMStoreStock.Free;
  end;
end;

procedure TStoreStock.SetdateReceived(const Value: Tdatetime);
begin
  FdateReceived := Value;
end;

procedure TStoreStock.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TStoreStock.SetinvoiceUpfront(const Value: boolean);
begin
  FinvoiceUpfront := Value;
end;

procedure TStoreStock.Setmodified(const Value: boolean);
begin
  Fmodified := Value;
end;

procedure TStoreStock.Setpart(const Value: string);
begin
  Fpart := Value;
end;

procedure TStoreStock.SetpartStore(const Value: TPartStore);
begin
  FpartStore := Value;
end;

procedure TStoreStock.SetpartBin(const Value: string);
begin
  FpartBin := Value;
end;

procedure TStoreStock.SetpartStoreLot(const Value: string);
begin
  FpartStoreLot := Value;
end;

procedure TStoreStock.SetquantityAllocated(const Value: integer);
begin
  FquantityAllocated := Value;
end;

procedure TStoreStock.SetstoreCost(const Value: currency);
begin
  FstoreCost := Value;
end;

procedure TStoreStock.SetstockPackQuantity(const Value: integer);
begin
  FstockPackQuantity := Value;
end;

procedure TStoreStock.SetstoreQuantity(const Value: integer);
begin
  FstoreQuantity := Value;
end;

procedure TStoreStock.SetstoreStockDescription(const Value: string);
begin
  FstoreStockDescription := Value;
end;

function TStoreStock.GetpartStore: TPartStore;
begin
  if not assigned(self.FpartStore) then
    FpartStore := TPartStore.Create;

  Result := self.FpartStore;
end;

procedure TStoreStock.view;
var
  STStoreStockFrm: TSTStoreStockFrm;
begin
  self.readOnly := true;
  STStoreStockFrm := TSTStoreStockFrm.Create(nil);
  try
    STStoreStockFrm.storeStock := self;

    STStoreStockFrm.ShowModal;
  finally
    STStoreStockFrm.Free;
  end;
end;

procedure TStoreStock.SetreadOnly(const Value: boolean);
begin
  FreadOnly := Value;
end;

procedure TStoreStock.SetSetsPerPad(const Value: integer);
begin
  FSetsPerPad := Value;
end;

{ TPartStore }

procedure TPartStore.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPartStore.SetpartStoreName(const Value: string);
begin
  FpartStoreName := Value;
end;

end.
 