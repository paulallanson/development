unit STStoreStockDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, STStoreStockObj,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMStoreStock = class(TDataModule)
    qrySelStoreStock: TFDQuery;
    qryUpdStoreStock: TFDQuery;
    qrySelPartStore: TFDQuery;
  private
    { Private declarations }
  public
    procedure Load(storeStock: TStoreStock);overload;
    procedure Load(partStore: TPartStore);overload;
    procedure Save(storeStock: TStoreStock);
  end;

var
  DMStoreStock: TDMStoreStock;

implementation

{$R *.DFM}

{ TDMStoreStock }

procedure TDMStoreStock.Load(storeStock: TStoreStock);
begin
  //load the store stock details
  with qrySelStoreStock do
  begin
    close;
    paramByName('store_stock').asInteger := storeStock.id;
    open;

    storeStock.quantityAllocated := FieldByName('quantity_allocated').asInteger;
    storeStock.storeQuantity := FieldByName('store_quantity').asInteger;
    storeStock.storeCost := FieldByName('store_cost').asCurrency;
    storeStock.dateReceived := FieldByName('date_received').asDateTime;
    storeStock.part := FieldByName('part').asString;
    storeStock.partStoreLot := FieldByName('part_store_lot').asString;
    storeStock.partStore.id := FieldByName('part_store').asInteger;
    storeStock.partBin := FieldByName('Part_Bin').asString;
    storeStock.stockPackQuantity := FieldByName('stock_pack_quantity').asInteger;
    storeStock.storeStockDescription := FieldByName('store_stock_description').asString;
    storeStock.invoiceUpfront := (FieldByName('invoice_upfront').asString = 'Y');
    storeStock.SetsperPad := FieldByName('Sets_per_pad').asInteger;

    close;
  end;

  //load the part store details.
  self.Load(storeStock.partStore);
end;

procedure TDMStoreStock.Load(partStore: TPartStore);
begin
  with qrySelPartStore do
  begin
    close;
    paramByName('part_store').asInteger := partStore.id;
    open;

    partStore.partStoreName := FieldByName('part_store_name').asString;
    close;
  end;
end;

procedure TDMStoreStock.Save(storeStock: TStoreStock);
begin
  with qryUpdStoreStock do
  begin
    ParamByName('quantity_allocated').asInteger := storeStock.quantityAllocated;
    ParamByName('store_quantity').asInteger := storeStock.storeQuantity;
    ParamByName('store_cost').asCurrency := storeStock.storeCost;
    ParamByName('date_received').asDateTime := storeStock.dateReceived;
    ParamByName('part').asString := storeStock.part;
    ParamByName('part_store_lot').asString  := storeStock.partStoreLot;
    ParamByName('part_store').asInteger := storeStock.partStore.id;
    ParamByName('Part_Bin').asString := storeStock.partBin;
    ParamByName('stock_pack_quantity').asInteger := storeStock.stockPackQuantity;
    ParamByName('store_stock_description').asString := storeStock.storeStockDescription;
    ParamByName('Sets_per_pad').asinteger := StoreStock.SetsPerPad;
    if storeStock.invoiceUpfront then
    begin
      ParamByName('invoice_upfront').asString := 'Y';
    end
    else
    begin
      ParamByName('invoice_upfront').asString := 'N';
    end;
    paramByName('store_stock').asInteger := storeStock.id;

    execSQL;
  end;
end;

end.
