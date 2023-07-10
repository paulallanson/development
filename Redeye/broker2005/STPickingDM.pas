unit stPickingDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, stPickObject, stSOObjects, STPacks;

type
  TSTPickDM = class(TDataModule)
    PickListSQL: TQuery;
    PickListSRC: TDataSource;
    PickDtlsSQL: TQuery;
    PartSQL: TQuery;
    PickDtlsSRC: TDataSource;
    PickPartDtlsSQL: TQuery;
    StoreStockSQL: TQuery;
    PickHeadSQL: TQuery;
    ClearPickSQL: TQuery;
    UpdPurchOrdSQL: TQuery;
    CheckPickBinSQL: TQuery;
    CheckPickLotSQL: TQuery;
    UpdPFJSQL: TQuery;
    PartStoreSQL: TQuery;
    UpdSalesOrdSQL: TQuery;
    UpdSalesOrdHeadSQL: TQuery;
    UpdDirectSalesOrdSQL: TQuery;
    CheckPickBinLotSQL: TQuery;
    GetStoreStockSQL: TQuery;
    UpdSalesOrderInvQty: TQuery;
    CheckSOStatusSQL: TQuery;
    UpdOrderStatusSQL: TQuery;
    UpdSalesOrdDelivSQL: TQuery;
    qrySOAddCharge: TQuery;
    qryGetSalesOrder: TQuery;
    qryGetSalesOrderLines: TQuery;
    qryUpdJobBagLine: TQuery;
    qrySalesOrderJB: TQuery;
    qryJBChkStatus: TQuery;
    qryJBUpHead: TQuery;
    qryGetProductionLoc: TQuery;
    PartTransferSQL: TQuery;
    qryGetSalesOrderLine: TQuery;
    qrySOPickHead: TQuery;
    qrySOPickLines: TQuery;
    qryUpdSOPicking: TQuery;
    qrySOPicking: TQuery;
    qrySOProductionLines: TQuery;
    qrySalesOrderJBReq: TQuery;
    qryJBChkStockReq: TQuery;
    GetSalesOrderHeadSQL: TQuery;
    qryDeleteSODelivLine: TQuery;
    qryDeleteSODeliv: TQuery;
    qryDeleteSOPicking: TQuery;
  private
    procedure LoadSOPickingList(var PickingList: TPickingList);
    procedure LoadSOPickingLineDets(var PickingList: TPickingList);
    { Private declarations }
  public
    procedure LoadSOProductionDets(var PickingList: TPickingList; tempCode: integer);
    procedure LoadSOPickingListFromDB(var PickingList: TPickingList);
    procedure LoadPickingListFromDB(var PickingList: TPickingList);
    procedure LoadPickingList(var PickingList: TPickingList);
    procedure LoadLineDets(var PickingList: TPickingList);
    procedure LoadSerialNumbers(aPickingList: TPickingList; tLine: TPickLine; dsPickLine: TDataset; iQtyAlloc: integer);
    function GetPartDescription(TempRef: string): string;
    function GetStoreStockCost(TempRef: integer): real;
    function GetProductionBin(tempSalesOrder: integer): string;
    function GetProductionStore(tempSalesOrder: integer): integer;
    function GetSalesOrderOvers(tempSalesOrder, tempLine: integer): integer;
    function CheckInvUpFront(TempRef: integer): boolean;
    function CheckTransferInvUpFront(TempRef, TempSO,
      tempLine: integer): boolean;
    procedure ClearPickingRef(sPickRef: string);
    function GetPickingLists: integer;
    procedure UpdatePurchOrder(iPOrder, iLine: integer; iQty: integer);
    procedure UpdateSOStatus(iSorder: integer);
    procedure UpdateSalesOrder(iSOrder, iLine: integer; iQty: integer);
    procedure UpdateSalesOrderStatus(iSorder, tempStatus: integer);
    procedure UpdateSalesOrderQtyInv(iSOrder, iLine: integer; iQty: integer);
    procedure UpdateDirectSalesOrder(iSOrder, iLine: integer; iQty: integer);
    procedure UpdateSalesOrderHead(iSOrder: integer);
    procedure UpdateJobBag(iSorder: integer);
    procedure UpdateOrderStatus(iSorder: integer);
    procedure UpdatePickingStatus(sPickRef: string);
    function ValidPickBin(iStore: integer; sBin: string): boolean;
    function ValidPickBinLot(iStore: integer; sBin, sLot, sPart: string): boolean;
    function ValidPickLot(sPart, sLot: string): boolean;
    function GetJobBagNumber(iCode: integer): integer;
    function GetPartStore(iCode: integer): integer;
    function GetPartStoreName(iCode: integer): string;
    function GetStoreStock(sPickList, sPart, sBin, sLot: string): integer;
    function GetStoreStockdiff(iStore:integer; sPart, sBin, sLot: string): integer;
    { Public declarations }
  end;

var
  STPickDM: TSTPickDM;

implementation

{$R *.DFM}

procedure TSTPickDM.LoadPickingListFromDB(var PickingList: TPickingList);
begin
  LoadPickingList(PickingList);
  LoadLineDets(PickingList);
end;

procedure TSTPickDM.LoadPickingList(var PickingList: TPickingList);
begin
  with PickHeadSQL do
  begin
    Close;
    ParamByName('Picking_List_Ref').AsString := PickingList.PickingListRef;
    Open;
    PickingList.PartStore := fieldbyname('Part_Store').Asinteger;
    PickingList.BinsInUse := fieldbyname('Stock_Bins_in_Use').asboolean;
    PickingList.LotsInUse := fieldbyname('Stock_Lots_in_Use').asboolean;
    Close;
  end;
end;

procedure TSTPickDM.LoadLineDets(var PickingList: TPickingList);
var
  aLine: TPickLine;
  iLine: integer;
begin
  PickingList.PickLines.Clear;
  {Load the line details for order number TempOrd}
  with stPickDM.PickDtlsSQL do
  begin
    Close;
    ParamByName('Picking_List_Ref').AsString := PickingList.PickingListRef;
    Open;
    iLine:=0;
    while not EOF do
    begin
      {If the Part is Serial Numbered and is the same as previous and
      from the same Bin then this must create serial numbers}
      if  (iLine <> 0) and
          (aLine.Part = FieldByName('Part').AsString) and
          (aLine.PartBin = FieldByName('Part_Bin').AsString) and
          (aLine.SerialNumbers = true) then
        begin
          LoadSerialNumbers(PickingList,aLine,stPickDM.PickDtlsSQL,FieldByName('Qty_Alloc').AsInteger);
        end
      else
        begin
          aLine := TPickLine.Create;
          with aLine do
            begin
            inc(iLine);
            Line := iLine;
            LotDate := FieldByName('Date_Received').Asdatetime;
            LotDescription := FieldByName('Store_Stock_Description').Asstring;
            StoreStock := FieldByName('Store_Stock').AsInteger;
            SetsPerPad := FieldByName('Sets_per_Pad').AsInteger;
            PaidStock := (FieldByName('Invoice_Upfront').Asstring = 'Y');
            PartBin := FieldByName('Part_Bin').Asstring;
            PickBin := FieldByName('Part_Bin').Asstring;
            PartStoreLot := FieldByName('Part_Store_Lot').Asstring;
            PackSize := FieldByname('Stock_Pack_Quantity').AsInteger;
            PickLot := FieldByName('Part_Store_Lot').Asstring;
            QtyAlloc := FieldByName('Qty_Alloc').AsInteger;
            QtyAllocinPacks := ShowInPacks(QtyAlloc,Packsize);
            Part := FieldByName('Part').AsString;
            PurchaseOrder := FieldByName('Purch_Ord').asinteger;
            PurchaseOrderLine := FieldByName('Purch_Ord_Line_no').Asinteger;
            QtyPicked := FieldByName('Qty_Alloc').AsInteger;
            QtyPickedinPacks := ShowInPacks(QtyPicked,Packsize);
            SerialNumbers := fieldbyname('Track_Serial_No').asboolean;
            salesorder := fieldByName('Sales_Order').AsInteger;
            SalesOrderLine := FieldByName('Sales_order_Line_No').AsInteger;
            end;
          PickingList.PickLines.Add(aLine);
          if aline.serialnumbers then
            LoadSerialNumbers(PickingList,aLine,stPickDM.PickDtlsSQL,0)
        end;
      Next;
    end;
    Close;
  end;
end;

procedure TSTPickDM.LoadSOPickingListFromDB(var PickingList: TPickingList);
begin
  LoadSOPickingList(PickingList);
  LoadSOPickingLineDets(PickingList);
end;

procedure TSTPickDM.LoadSOPickingList(var PickingList: TPickingList);
begin
  with qrySOPickHead do
  begin
    Close;
    ParamByName('Sales_Order_Picking').Asinteger := strtoint(PickingList.PickingListRef);
    Open;
    PickingList.PartStore := fieldbyname('Part_Store').Asinteger;
    PickingList.BinsInUse := fieldbyname('Stock_Bins_in_Use').asboolean;
    PickingList.LotsInUse := fieldbyname('Stock_Lots_in_Use').asboolean;
    Close;
  end;
end;

procedure TSTPickDM.LoadSOPickingLineDets(var PickingList: TPickingList);
var
  aLine: TPickLine;
  iLine: integer;
begin
  PickingList.PickLines.Clear;
  {Load the line details for order number TempOrd}
  with qrySOPickLines do
  begin
    Close;
    ParamByName('Sales_order_Picking').Asinteger := strtoint(PickingList.PickingListRef);
    Open;
    iLine:=0;
    while not EOF do
    begin
      {If the Part is Serial Numbered and is the same as previous and
      from the same Bin then this must create serial numbers}
      if  (iLine <> 0) and
          (aLine.Part = FieldByName('Part').AsString) and
          (aLine.PartBin = FieldByName('Part_Bin').AsString) and
          (aLine.SerialNumbers = true) then
        begin
          LoadSerialNumbers(PickingList,aLine,qrySOPickLines,FieldByName('Qty_Alloc').AsInteger);
        end
      else
        begin
          aLine := TPickLine.Create;
          with aLine do
            begin
            inc(iLine);
            Line := iLine;
            LotDate := FieldByName('Date_Received').Asdatetime;
            LotDescription := FieldByName('Store_Stock_Description').Asstring;
            StoreStock := FieldByName('Store_Stock').AsInteger;
            SetsPerPad := FieldByName('Sets_per_Pad').AsInteger;
            PaidStock := (FieldByName('Invoice_Upfront').Asstring = 'Y');
            PartBin := FieldByName('Part_Bin').Asstring;
            PickBin := FieldByName('Part_Bin').Asstring;
            PartStoreLot := FieldByName('Part_Store_Lot').Asstring;
            PackSize := FieldByname('Stock_Pack_Quantity').AsInteger;
            PickLot := FieldByName('Part_Store_Lot').Asstring;
            QtyAlloc := FieldByName('Qty_Alloc').AsInteger;
            QtyAllocinPacks := ShowInPacks(QtyAlloc,Packsize);
            Part := FieldByName('Part').AsString;
            OrigPurchaseOrder := FieldByName('Purchase_Order').asfloat;
            Overs := Fieldbyname('Stock_is_Overs').asstring;
            PalletID := Fieldbyname('Pallet_ID').asinteger;
            ProductID := Fieldbyname('Product_ID').asinteger;
            PurchaseOrder := FieldByName('Purch_Ord').asinteger;
            PurchaseOrderLine := FieldByName('Purch_Ord_Line_no').Asinteger;
            QtyPicked := FieldByName('Qty_Alloc').AsInteger;
            QtyPickedinPacks := ShowInPacks(QtyPicked,Packsize);
            SerialNumbers := fieldbyname('Track_Serial_No').asboolean;
            salesorder := fieldByName('Sales_Order').AsInteger;
            SalesOrderLine := FieldByName('Sales_order_Line_No').AsInteger;
            end;
          PickingList.PickLines.Add(aLine);
          if aline.serialnumbers then
            LoadSerialNumbers(PickingList,aLine,qrySOPickLines,0)
        end;
      Next;
    end;
    Close;
  end;
end;

procedure TSTPickDM.LoadSOProductionDets(var PickingList: TPickingList; tempCode: integer);
var
  aLine: TPickLine;
  iLine: integer;
begin
  PickingList.PickLines.Clear;
  {Load the line details for order number TempOrd}
  with qrySOProductionLines do
  begin
    Close;
    ParamByName('Sales_order').Asinteger := tempCode;
    Open;
    iLine:=0;
    while not EOF do
    begin
       aLine := TPickLine.Create;
          with aLine do
            begin
            inc(iLine);
            Line := iLine;
            LotDate := FieldByName('Date_Received').Asdatetime;
            LotDescription := FieldByName('Store_Stock_Description').Asstring;
            StoreStock := FieldByName('Store_Stock').AsInteger;
            SetsPerPad := FieldByName('Sets_per_Pad').AsInteger;
            PaidStock := (FieldByName('Invoice_Upfront').Asstring = 'Y');
            PartBin := FieldByName('Part_Bin').Asstring;
            PickBin := FieldByName('Part_Bin').Asstring;
            PartStoreLot := FieldByName('Part_Store_Lot').Asstring;
            PackSize := FieldByname('Stock_Pack_Quantity').AsInteger;
            PickLot := FieldByName('Part_Store_Lot').Asstring;
            QtyAlloc := FieldByName('Quantity_Allocated').AsInteger;
            QtyAllocinPacks := ShowInPacks(QtyAlloc,Packsize);
            OrigPurchaseOrder := FieldByName('Purchase_Order').Asfloat;
            Overs := Fieldbyname('Stock_is_Overs').asstring;
            Part := FieldByName('Part').AsString;
            PalletID := Fieldbyname('Pallet_ID').asinteger;
            ProductID := Fieldbyname('Product_ID').asinteger;
            PurchaseOrder := FieldByName('Purch_Ord').asinteger;
            PurchaseOrderLine := FieldByName('Purch_Ord_Line_no').Asinteger;
            QtyPicked := FieldByName('Quantity_Allocated').AsInteger - FieldByName('Quantity_Overs').AsInteger
                                                                     - FieldByName('Quantity_Over_Picked').AsInteger;
            QtyPickedinPacks := ShowInPacks(QtyPicked,Packsize);
            SerialNumbers := fieldbyname('Track_Serial_No').asboolean;
            salesorder := fieldByName('Sales_Order').AsInteger;
            SalesOrderLine := FieldByName('Sales_order_Line_No').AsInteger;
            end;
          PickingList.PickLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TSTPickDM.LoadSerialNumbers(aPickingList: TPickingList; tLine: TPickLine; dsPickLine: TDataset; iQtyAlloc: integer);
var
  LotNumber: TLotNumber;
begin
  {Insert records into the Pick Line Serial Number list}
  tLine.QtyAlloc := tLine.QtyAlloc + iQtyAlloc;
  tLine.QtyPicked := tLine.QtyAlloc;
  tLine.QtyAllocInPacks := ShowinPacks(tline.QtyAlloc, tLine.Packsize);
  tLine.QtyPickedinPacks := ShowinPacks(tline.QtyPicked, tline.Packsize);
  LotNumber := TLotNumber.create;
  LotNumber.LotNumberRef := dsPickLine.fieldbyname('Part_Store_Lot').Asstring;
  tLine.LotNumbers.Add(LotNumber);
end;

function TSTPickDM.GetPartDescription(TempRef: string): string;
begin
  with PartSQL do
    begin
      close;
      parambyname('Part').asstring := TempRef;
      open;
      result := fieldbyname('Part_Description').asstring;
      close;
    end
end;

function TSTPickDM.GetStoreStockCost(TempRef: integer): real;
begin
  with StoreStockSQL do
    begin
      close;
      parambyname('Store_Stock').asinteger := TempRef;
      open;
       try
        Result := fieldbyname('Store_Cost').asfloat / fieldbyname('Store_quantity').asinteger;
      except
        result := 0.00;
      end;
    end
end;

procedure TSTPickDM.ClearPickingRef(sPickRef: string);
begin
  with ClearPickSQL do
    begin
      close;
      parambyname('Picking_List_Ref').asstring := sPickRef;
      execsql;
    end;
end;

function TSTPickDM.GetPickingLists: integer;
begin
  with PickListSQL do
    begin
      close;
      open;
      Result := recordcount;
      first;
    end;
end;

function TSTPickDM.GetStoreStock(sPickList, sPart, sBin, sLot: string): integer;
begin
  with PickPartDtlsSQL do
    begin
      close;
      parambyname('Picking_List_ref').asstring := sPickList;
      parambyname('Part').asstring := sPart;
      parambyname('Part_Bin').asstring := sBin;
      parambyname('Part_Store_Lot').asstring := sLot;
      open;
      Result := fieldbyname('Store_Stock').asinteger;
    end;
end;

function TSTPickDM.GetPartStoreName(iCode: integer): string;
begin
  with PartStoreSQL do
    begin
      close;
      parambyname('Part_Store').asinteger := iCode;
      open;
      Result := fieldbyname('Part_Store_Name').asstring;
    end;
end;

function TSTPickDM.GetPartStore(iCode: integer): integer;
begin
  with qryGetSalesOrder do
    begin
      close;
      parambyname('Sales_order').asinteger := iCode;
      open;
      Result := fieldbyname('Part_Store').asinteger;
    end;
end;

function TSTPickDM.GetJobBagNumber(iCode: integer): integer;
begin
  Result := 0;
  with qrySalesOrderJB do
    begin
      close;
      parambyname('Sales_order').asinteger := iCode;
      open;

      if recordcount > 0 then
        begin
          if fieldbyname('Order_type').asstring = 'J' then
            Result := fieldbyname('Job_Bag').asinteger
          else
            Result := 0;
          exit;
        end;
    end;

  with qrySalesOrderJBReq do
    begin
      close;
      parambyname('Sales_order').asinteger := iCode;
      open;

      if fieldbyname('Order_type').asstring = 'J' then
        Result := fieldbyname('Job_Bag').asinteger
      else
        Result := 0;
    end;
end;

procedure TSTPickDM.UpdatePurchOrder(iPOrder, iLine: integer; iQty: integer);
begin
  with UpdPurchOrdSQL do
    begin
      close;
      parambyname('Purch_ord').asInteger := iPorder;
      parambyname('Purch_ord_Line_no').asinteger := iLine;
      parambyname('Quantity_Sent').asinteger := iQty;
      execsql;
    end;
end;

function TSTPickDM.ValidPickBin(iStore: integer; sBin: string): boolean;
begin
  with CheckPickBinSQL do
    begin
      close;
      parambyname('Part_Store').asInteger := iStore;
      parambyname('Part_Bin').asstring := sBin;
      open;
      if recordcount > 0 then
        result := true
      else
        result := false;
    end;
end;

function TSTPickDM.ValidPickLot(sPart, sLot: string): boolean;
begin
  with CheckPicklotSQL do
    begin
      close;
      parambyname('Part').asstring := sPart;
      parambyname('Part_Store_Lot').asstring := sLot;
      open;
      if recordcount > 0 then
        result := true
      else
        result := false;
    end;
end;

procedure TSTPickDM.UpdateSalesOrder(iSOrder, iLine, iQty: integer);
begin
  with UpdSalesOrdSQL do
    begin
      close;
      parambyname('Sales_order').asInteger := iSorder;
      parambyname('Sales_order_Line_no').asinteger := iLine;
      parambyname('Quantity_Delivered').asinteger := iQty;
      execsql;
    end;
   with UpdSalesOrdDelivSQL do
    begin
      close;
      parambyname('Sales_order').asInteger := iSorder;
      parambyname('Sales_order_Line_no').asinteger := iLine;
      parambyname('Deliv_Qty').asinteger := iQty;
      execsql;
    end;
end;

procedure TSTPickDM.UpdateSalesOrderHead(iSOrder: integer);
var
  iOldStatus, iStatus: integer;
begin
  with GetSalesOrderHeadSQL do
    begin
      Close;
      parambyname('Sales_order').asInteger := iSorder;
      open;

      iOldStatus := fieldbyname('Sales_Order_Head_Status').asinteger;

      if fieldbyname('Replenish_Source').asinteger = 1 then
        begin
          iStatus := shDespConfirmed
        end
      else
        begin
          if (fieldbyname('Total_Delivered').asinteger >= fieldbyname('Total_Lines').asinteger) then
            iStatus := shDespConfirmed
          else
          if (fieldbyname('Total_allocated').asinteger > 0) and (fieldbyname('Total_delivered').asinteger > 0) then
            iStatus := shPODelivered
          else
          if (fieldbyname('Total_allocated').asinteger >= fieldbyname('Total_Lines').asinteger) then
            iStatus := shAllocated;
        end;
      {Don't change the status if the status has been calculated to be less than the original}
      if iOldStatus > iStatus then
        iStatus := iOldStatus;
    end;
    
  with UpdSalesOrdHeadSql do
    begin
      Close;
      parambyname('Sales_order').asInteger := iSorder;
      ParamByName('Status').AsInteger := iStatus;
      execsql;
    end;
end;

procedure TSTPickDM.UpdateDirectSalesOrder(iSOrder, iLine, iQty: integer);
begin
  with UpdDirectSalesOrdSQL do
    begin
      close;
      parambyname('Sales_order').asInteger := iSorder;
      parambyname('Sales_order_Line_no').asinteger := iLine;
      parambyname('Quantity_Delivered').asinteger := iQty;
//      paramByName('Quantity_Allocated').AsInteger := iQty;
      paramByName('Quantity_Allocated').AsInteger := 0;
      execsql;
    end;
end;

function TSTPickDM.ValidPickBinLot(iStore: integer; sBin,
  sLot, sPart: string): boolean;
begin
  with CheckPickBinLotSQL do
    begin
      close;
      parambyname('Part').asstring := sPart;
      parambyname('Part_Store').asInteger := iStore;
      parambyname('Part_Bin').asstring := sBin;
      parambyname('Part_Store_Lot').asstring := sLot;
      open;
      if recordcount > 0 then
        result := true
      else
        result := false;
    end;
end;

function TSTPickDM.GetStoreStockdiff(iStore: integer; sPart, sBin,
  sLot: string): integer;
begin
result := 0;
With GetStoreStockSQL do
     begin
     Close ;
     ParamByName('Part_Store_Lot').AsString := sLot ;
     ParamByName('Part').AsString := sPart ;
     ParamByName('Part_Store').AsInteger := iStore ;
     ParamByName('Part_Bin').AsString := sBin ;
     Open ;
     First ;
     If EOF = False then
        begin
        {Add the stock to an existing store stock record} ;
        Result := FieldByName('Store_Stock').AsInteger ;
        end;
     end;
end;

procedure TSTPickDM.UpdateSalesOrderQtyInv(iSOrder, iLine, iQty: integer);
begin
  with UpdSalesOrderInvQty do
    begin
      close;
      parambyname('Sales_order').asInteger := iSorder;
      parambyname('Sales_order_Line_no').asinteger := iLine;
      parambyname('Quantity_Invoiced').asinteger := iQty;
      execsql;
    end;
end;

procedure TSTPickDM.UpdateJobBag(iSorder: integer);
var
  tempJobBag: integer;
  tempLine: integer;
  tempQty, tempQtyDelivered: integer;
  tempCost: real;
  tempSell: real;
  tempCostPack, tempSellPack: integer;
  bReconcile: boolean;
  iStkReqLines, orderstatus: integer;
begin
  {Find out if this order is Job}
  with qryGetSalesOrder do
    begin
      close;
      parambyname('Sales_Order').asinteger := iSOrder;
      open;
      if fieldbyname('Order_Type').asstring <> 'J' then
        exit;
    end;

  with qryGetSalesOrderLines do
    begin
      close;
      parambyname('Sales_Order').asinteger := iSorder;
      open;

      first;

      while eof <> true do
        begin
          tempLine := fieldbyname('Sales_Order_line_no').asinteger;
          tempQty := fieldbyname('Quantity_Delivered').asinteger - fieldbyname('Quantity_invoiced').asinteger;
          tempCost := fieldbyname('Part_Cost').asfloat;
          tempSell := fieldbyname('Part_Sales_Price').asfloat;
          tempCostPack := fieldbyname('Purch_Pack_Quantity').asinteger;
          tempSellPack := fieldbyname('Sell_Pack_Quantity').asinteger;

          tempQtyDelivered := fieldbyname('Quantity_Delivered').asinteger;

          {Update the job bag with the price info}
          qryUpdJobBagLine.close;
          qryUpdJobBagLine.parambyname('Sales_Order').asinteger := iSorder;
          qryUpdJobBagLine.parambyname('Sales_Order_line_no').asinteger := tempLine;
          qryUpdJobBagLine.parambyname('Job_Bag_Line_Cost').asfloat := (tempQty/tempCostPack)*tempCost;
          qryUpdJobBagLine.parambyname('Job_Bag_Line_Sell').asfloat := (tempQty/tempSellPack)*tempSell;
          qryUpdJobBagLine.parambyname('Job_Bag_Quantity').asinteger := tempQtyDelivered;
(*          if (tempQty = 0) or (tempSell = 0) then
            qryUpdJobBagLine.parambyname('Job_Bag_Line_Invoiced').asstring := 'Y'
          else
*)        qryUpdJobBagLine.parambyname('Job_Bag_Line_Invoiced').asstring := 'N';

          qryUpdJobBagLine.execsql;

          next;
        end;
    end;

  {Get the job bag number}
  with qrySalesOrderJB do
    begin
      close;
      parambyname('sales_order').asinteger := iSOrder;
      open;

      tempJobBag := fieldbyname('Job_Bag').asinteger
    end;

  with qryJBChkStockReq do
  begin
    close;
    parambyname('Job_Bag').asinteger := tempJobBag;
    open;
//    bReconcile := (FieldByName('Invoiced_Lines').AsInteger <> Fieldbyname('Total_lines').asinteger);
    bReconcile := (FieldByName('Unreconciled_Lines').AsInteger <> 0);
    iStkReqLines := Fieldbyname('Total_lines').asinteger;
  end;

  {Update the Job Bag header}
  with qryJBChkStatus do
  begin
    close;
    parambyname('Job_Bag').asinteger := tempJobBag;
    open;
    if FieldByName('Lines_not_Invoiced').AsInteger = Fieldbyname('Total_lines').asinteger then
      begin
        if (FieldByName('Total_SOs').AsInteger > 0) or (iStkReqLines > 0) then
          orderstatus := 20
        else
        if FieldByName('Total_POs').AsInteger > 0 then
          orderstatus := 12
        else
        if FieldByName('Total_Sundries').AsInteger > 0 then
          orderstatus := 11
        else
          orderstatus := 10
      end
    else
    if FieldByName('Lines_not_Invoiced').AsInteger <> 0 then
      begin
        if (FieldByName('Total_SOs').AsInteger > 0) or (iStkReqLines > 0) then
          orderstatus := 24
        else
        if FieldByName('Total_POs').AsInteger > 0 then
          orderstatus := 23
        else
          orderstatus := 25
      end
    else
    if (FieldByName('Lines_not_Invoiced').AsInteger = 0) and bReconcile then
      orderstatus := 24
    else
      orderstatus := 30;
  end;

  {Update the SI Status}
  with qryJBUpHead do
  begin
    close;
    parambyname('Job_Bag').asinteger := tempJobBag;
    parambyname('Job_Bag_status').asinteger := orderstatus;
    execsql;
  end;
end;

procedure TSTPickDM.UpdateSalesOrderStatus(iSorder, tempStatus: integer);
begin
  with UpdOrderStatusSQL do
    begin
      close;
      ParamByName('OrderNo').AsFloat := isorder;
      ParamByName('Status').AsInteger := tempStatus;
      execsql;
    end;
end;

procedure TSTPickDM.UpdateSOStatus(iSorder: integer);
var
  tempStatus: integer;
begin
  with qrySOPicking do
    begin
      close;
      parambyname('Sales_Order').asinteger := iSOrder;
      open;

      if fieldbyname('Pick_Lines').asinteger > fieldbyname('Pick_Confirmed').asinteger then
        tempStatus := 140
      else
        tempstatus := 150;
    end;

  with UpdOrderStatusSQL do
    begin
      close;
      ParamByName('OrderNo').AsFloat := isorder;
      ParamByName('Status').AsInteger := tempStatus;
      execsql;
    end;
end;

procedure TSTPickDM.UpdateOrderStatus(iSorder: integer);
var
  AddChargeLines: integer;
  bStartAgain: boolean;
begin
// new routine to update order status will eventually replace update sales order
  qrySOAddCharge.ParamByName('sales_order').asInteger := iSorder;
  qrySOAddCharge.open;

  AddChargeLines := qrySOAddCharge.fieldByName('LineCount').asInteger;
  qrySOAddCharge.close;

  bStartAgain := false;

  With CheckSOStatusSQL do
  begin
    Close ;
    ParamByName('Sales_Order').AsInteger := iSorder;
    Open ;
    First ;
    with UpdOrderStatusSQL do
    begin
      Close;
      ParamByName('OrderNo').AsFloat := isorder;
      if CheckSOStatusSQL.FieldByName('Qty_Alloc').AsInteger <> 0 then
        ParamByName('Status').AsInteger := shPartConfirmed
      else
      if CheckSOStatusSQL.FieldByName('Qty_Deliv').AsInteger = 0 then
        begin
          ParamByName('Status').AsInteger := shCreated;
          bStartAgain := true;
        end
      else
        begin
          If CheckSOStatusSQL.FieldByName('Qty_Inv').AsInteger = 0 then
           ParamByName('Status').AsInteger := shDespConfirmed
          else
            If CheckSOStatusSQL.FieldByName('Qty_Not_Inv').AsInteger > 0 then
              ParamByName('Status').AsInteger := shPartlyInvoiced
            else
            ParamByName('Status').AsInteger := ShFullyInvoiced;
        end;

      if (ParamByName('Status').AsInteger = shFullyInvoiced)
      and (AddChargeLines > 0 ) then
        ParamByName('Status').AsInteger := shPartlyInvoiced;

      ExecSql;
    end;
  end;

  {If setting status back to created then lets start again}
  if bStartAgain then
    begin
      {Delete Delivery Line}
      with qryDeleteSODelivLine do
        begin
          close;
          parambyname('Sales_Order').asinteger := iSorder;
          execsql;
        end;

      with qryDeleteSODeliv do
        begin
          close;
          parambyname('Sales_Order').asinteger := iSorder;
          execsql;
        end;

      with qryDeleteSOPicking do
        begin
          close;
          parambyname('Sales_Order').asinteger := iSorder;
          execsql;
        end;

    end;
end;

function TSTPickDM.CheckInvUpFront(TempRef: integer): boolean;
begin
 with StoreStockSQL do
    begin
      close;
      parambyname('Store_Stock').asinteger := TempRef;
      open;
       try
        Result := fieldbyname('Invoice_Upfront').asString = 'Y';
      except
        result := False;
      end;
    end
end;

function TSTPickDM.CheckTransferInvUpFront(TempRef, TempSO, tempLine: integer): boolean;
begin
 with PartTransferSQL do
    begin
      close;
      parambyname('Store_Stock').asinteger := TempRef;
      parambyname('Sales_order').asinteger := TempSO;
      parambyname('Sales_order_line_no').asinteger := TempLine;
      open;
       try
        Result := fieldbyname('Invoice_Upfront').asString = 'Y';
      except
        result := False;
      end;
    end
end;

function TSTPickDM.GetProductionBin(tempSalesOrder: integer): string;
begin
 with qryGetProductionLoc do
    begin
      close;
      parambyname('Sales_order').asinteger := TempSalesOrder;
      open;
      result := fieldbyname('Part_Bin').asstring;
    end
end;

function TSTPickDM.GetProductionStore(tempSalesOrder: integer): integer;
begin
 with qryGetProductionLoc do
    begin
      close;
      parambyname('Sales_order').asinteger := TempSalesOrder;
      open;
      result := fieldbyname('Part_Store').asinteger;
    end
end;

function TSTPickDM.GetSalesOrderOvers(tempSalesOrder: integer; tempLine: integer): integer;
begin
 with qryGetSalesOrderLine do
    begin
      close;
      parambyname('Sales_order').asinteger := TempSalesOrder;
      parambyname('Sales_order_line_no').asinteger := TempLine;
      open;
      result := fieldbyname('Quantity_Overs').asinteger;
    end
end;
procedure TSTPickDM.UpdatePickingStatus(sPickRef: string);
begin
  with qryUpdSOPicking do
    begin
      close;
      parambyname('Sales_Order_picking').asinteger := strtoint(sPickRef);
      execsql;
    end;
end;

end.
