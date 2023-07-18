unit STPrtAllocStStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, ExtCtrls, Menus;

type
  TSTPrtAllocStStockFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgDetails: TDBGrid;
    qryStoreStock: TQuery;
    srcStoreStock: TDataSource;
    lblProduct: TLabel;
    lblPartStore: TLabel;
    BitBtn2: TBitBtn;
    qryStoreStockStore_Stock: TIntegerField;
    qryStoreStockQuantity_Allocated: TIntegerField;
    qryStoreStockStore_Quantity: TIntegerField;
    qryStoreStockStore_Cost: TCurrencyField;
    qryStoreStockDate_Received: TDateTimeField;
    qryStoreStockPart: TStringField;
    qryStoreStockPart_Store_Lot: TStringField;
    qryStoreStockPart_Store: TIntegerField;
    qryStoreStockPart_Bin: TStringField;
    qryStoreStockStock_Pack_Quantity: TIntegerField;
    qryStoreStockStore_Stock_Description: TStringField;
    qryStoreStockinvoice_upfront: TStringField;
    qryStoreStockFree_Stock: TIntegerField;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    lblQtyOrdered: TLabel;
    UpdSOHeadSQL: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FPartStore: integer;
    FPartStoreName: string;
    FPart: string;
    FSOrder: integer;
    FSOrderLine: integer;
    procedure SetPart(const Value: string);
    procedure SetPartStore(const Value: integer);
    procedure SetPartStoreName(const Value: string);
    procedure SetSOrder(const Value: integer);
    procedure SetSOrderLine(const Value: integer);
    { Private declarations }
  public
    bOK: boolean;
    iQtyOrdered, iQtyDelivered, iQtyAllocated: integer;
    property SOrder: integer read FSOrder write SetSOrder;
    property SOrderLine: integer read FSOrderLine write SetSOrderLine;
    property Part: string read FPart write SetPart;
    property PartStore: integer read FPartStore write SetPartStore;
    property PartStoreName: string read FPartStoreName write SetPartStoreName;
  end;

var
  STPrtAllocStStockFrm: TSTPrtAllocStStockFrm;

implementation

uses STStockDM, STSOObjects;

{$R *.DFM}

{ TSTPrtAllocStStockFrm }

procedure TSTPrtAllocStStockFrm.SetPart(const Value: string);
begin
  FPart := Value;
  lblProduct.caption := lblProduct.Caption + ' ' + FPart;
end;

procedure TSTPrtAllocStStockFrm.SetPartStore(const Value: integer);
begin
  FPartStore := Value;
end;

procedure TSTPrtAllocStStockFrm.SetPartStoreName(const Value: string);
begin
  FPartStoreName := Value;
  lblPartStore.caption := lblPartStore.Caption + ' ' + FPartStoreName;
end;

procedure TSTPrtAllocStStockFrm.FormActivate(Sender: TObject);
begin
  lblQtyOrdered.caption := inttostr(iQtyOrdered);
  with qryStoreStock do
    begin
      close;
      parambyname('Part').asstring := Part;
      parambyname('Part_Store').asinteger := PartStore;
      open;
      if recordcount = 1 then
        dbgDetails.SelectedRows.CurrentRowSelected := True
      else
        dbgDetails.SelectedRows.CurrentRowSelected := false;
    end;
end;

procedure TSTPrtAllocStStockFrm.BitBtn1Click(Sender: TObject);
var
  iQtyFreeToPick: integer;
  iTempQty, iTempCount: integer;
begin
  iQtyFreeToPick := 0;
  if dbgDetails.SelectedRows.count = 0 then
    begin
      messagedlg('No bin have been selected, select the bin or bins you want to use to allocate the stock.',mtInformation,
                [mbOk], 0);
      exit;
    end;

  {Determine how much is needed}
  iTempQty := iQtyOrdered - iQtyDelivered - iQtyAllocated;
  {Process the allocations} ;
  for iTempCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
  begin
    dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iTempCount])) ;
    with qryStoreStock do
      begin
        iQtyFreetoPick := ((qryStoreStock.fieldbyname('Store_Quantity').asinteger) - (qryStoreStock.fieldbyname('Quantity_Allocated').asinteger));
        {allocate as much stock as required/available} ;
        if iTempQty <= iQtyFreeToPick then
          begin
            {Actually do the stock allocation} ;
            STStockDataMod.AllocStock(PartStore, FieldByName('Part').AsString, SOrder, iTempQty, 1, SOrderLine,'B',fieldbyname('Part_Bin').asstring) ;
            with updSOHeadSQL do
              begin
                Close;
                ParamByName('Sales_Order').AsInteger := SOrder;
                ParamByName('Status').AsInteger := shAllocated;
                ExecSQL;
              end;

            iTempQty := 0;
          end
        else
          begin
            STStockDataMod.AllocStock(PartStore, FieldByName('Part').AsString, SOrder, ((fieldbyname('Store_quantity').asinteger) - (fieldbyname('Quantity_Allocated').asinteger)), 1, SOrderLine,'B',fieldbyname('Part_Bin').asstring) ;
            with updSOHeadSQL do
              begin
                Close;
                ParamByName('Sales_Order').AsInteger := SOrder;
                ParamByName('Status').AsInteger := shAllocated;
                ExecSQL;
              end;
            iTempQty := iTempQty - ((fieldbyname('Store_quantity').asinteger) - (fieldbyname('Quantity_Allocated').asinteger));
          end;

        if iTempQty <= 0 then
          break;
        Next ;
      end;
  end;
  bOK := True ;
  close;
end;

procedure TSTPrtAllocStStockFrm.SetSOrder(const Value: integer);
begin
  FSOrder := Value;
end;

procedure TSTPrtAllocStStockFrm.SetSOrderLine(const Value: integer);
begin
  FSOrderLine := Value;
end;

end.
