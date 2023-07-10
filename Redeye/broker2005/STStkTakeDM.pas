unit STStkTakeDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, STStkTkObject;

type
  TSTStkTkDM = class(TDataModule)
    PartSQL: TQuery;
    CountListSQL: TQuery;
    CountListSRC: TDataSource;
    CheckValidBinSQL: TQuery;
    CheckValidLotSQL: TQuery;
    PartStoreSQL: TQuery;
    CountHeadSQL: TQuery;
    CountDtlsSQL: TQuery;
    CountDtlsSRC: TDataSource;
    CountPartDtlsSQL: TQuery;
    GetCountStkSQL: TQuery;
    FreezeCountSQL: TQuery;
    UpdCountSql: TQuery;
    NextStockTakeSQL: TQuery;
    AddStockTakeSQL: TQuery;
    DelCountSQL: TQuery;
    UpdStatusSQL: TQuery;
    StoreStockSQL: TQuery;
    GetStoreStockNoSQL: TQuery;
    DelCountRecSQl: TQuery;
    GetCountQtySQL: TQuery;
    GetPartSQL: TQuery;
    GetStockDescSQL: TQuery;
    qryGetLastLot: TQuery;
    qryGetCustomer: TQuery;
  procedure AddStockTake(iStockTake, iStore: integer; sBin, sLot,
    sStatus, sRef, sPart, sOrigBin, sOrigLot: String; iPriorQty, iCountQty, iPackQty, iPriorPackQty: integer; dDate: TDateTime; rCost: real);
  private
    { Private declarations }
  public
    procedure LoadSerialNumbers(aCountingList: TCountingList; tLine: TCountLine; dsCountLine: TDataset; iQtyCount: integer);
    procedure LoadcountinglistFromDB(var countinglist: Tcountinglist);
    procedure Loadcountinglist(var countinglist: Tcountinglist);
    procedure freezeCount(Sender: Tobject);
    procedure UpdateCount(Sender: TObject);
    procedure UpdateCountRec(Sender: TObject);
    function validBin(iStore: integer; sBin: string): boolean;
    function GetcountingLists: integer;
    function GetPartDescription(TempRef: string): string;
    function GetStockDescription(iPartStore: integer; sPart, sBin, sLot: string): string;
    function GetInvupfront(iPartStore: integer; sPart, sBin, sLot: string): string;
    function GetSetsInPad(iPartStore: integer; sPart, sBin, sLot: string): integer;
    function GetStockPO(iPartStore: integer; sPart, sBin, sLot: string): integer;
    procedure LoadLineDets(var countinglist: Tcountinglist);
    function GetSerial(TempRef:string): boolean;
    Function GetPacksize(TempRef: string): integer;
    function validlot(sPart, sLot: string): boolean;
    function GetPartStoreName(iCode: integer): string;
    function GetStoreStockCost(TempRef: integer): real;
    function GetNewStoreStockCost(TempRef: integer; TempPart: string): real;
    function CheckDiffBinLot(OrigBin, countBin, OrigLot, CountLot: string): boolean;
    function GetStoreStock(iPartStore: integer; sPart, sBin, sLot: string): integer;
     { Public declarations }
  end;

var
  STStkTkDM: TSTStkTkDM;

implementation

Uses CCSCommon, STStockDM;

{$R *.DFM}

{ TClStkTkDM }

procedure TSTStkTkDM.AddStockTake(iStockTake, iStore: Integer; sBin, sLot, sStatus,
  sRef, sPart, sOrigBin, sOrigLot: String; iPriorQty, iCountQty, iPackqty, iPriorPackQty: integer; dDate: TDateTime;
  rCost: real);
var
  iCode: integer;
begin
  {Don't update if transfer qty is zero}
  if iCountQty = 0 then exit;

  {Get the next StockTake  code}
  with NextStockTakeSQL do
    begin
      close;
      open;
      first;
      icode := FieldByName('Max_Stock_Take').AsInteger + 1 ;
    end;

  {Update the StockTake table}
  with AddStockTakeSQL do
    begin
      close;
      parambyname('Stock_Take').asinteger := icode;
      If sLot <> '' then
         parambyname('lot').asstring := sLot
      else
         parambyname('lot').clear ;
      If sOrigLot <> '' then
         parambyname('Origlot').asstring := sLot
      else
         parambyname('Origlot').clear ;

      parambyname('Part').asstring := sPart;
      parambyname('Store').asinteger := iStore;
      parambyname('PriorQty').asinteger := iPriorQty;
      parambyname('Date_Received').asdatetime := dDate;
      parambyname('Store_Cost').asfloat := 0.00;
      parambyname('Ref').asString := sRef;
      parambyname('Stock_take_Pack_qty').AsInteger := iPackQty;
      ParamByName('Stock_Take_Pack_Qty_orig').AsInteger := iPriorPackQty;

      If sBin <> '' then
         parambyname('Bin').asstring := sBin
      else
         parambyname('Bin').clear ;

      If sOrigBin <> '' then
         parambyname('OrigBin').asstring := sBin
      else
         parambyname('OrigBin').clear ;
      parambyname('status').asstring := 'H';
      parambyname('CountQty').asfloat := icountqty;
      parambyname('Invoice_upfront').asstring := GetInvupfront(iStore,sPart,sBin,sLot);
      parambyname('Store_Stock_Description').asstring := GetStockDescription(iStore,sPart,sBin,sLot);
      execsql;
    end;
end;

function TSTStkTkDM.CheckDiffBinLot(OrigBin, countBin, OrigLot, CountLot: string): boolean;
begin
    Result := ((OrigBin <> CountBin) or (OrigLot <> CountLot))
end;

procedure TSTStkTkDM.freezeCount(Sender: Tobject);
begin
  With GetCountQtySQL do
  begin
  Close;
  ParamByName('Stock_Take_Ref').asString := STStkTkDM.CountListSRC.dataset.fieldbyname('Stock_Take_Ref').asstring;
  Open;
  First;
  While not eof do
    begin
      with FreezeCountSql do
      begin
        Close;
        ParamByName('Stock_Take').asInteger := GetCountQtySQL.FieldByName('Stock_Take').asInteger;
        ParamByName('Date_Received').asDateTime := Date;
        ParamByName('Store_Quantity').asinteger := GetCountQtySQl.FieldByName('Store_Quantity').asinteger;
        ParamByName('Store_Cost').asFloat := GetCountQtySQL.FieldByName('Store_Cost').asFloat;
        ExecSQL;
        end;
      next;
    end;
  end;
  end;

function TSTStkTkDM.GetcountingLists: integer;
begin
    with CountListSQL do
    begin
      close;
      open;
      Result := recordcount;
      first;
    end;
end;

function TSTStkTkDM.GetInvupfront(iPartStore: integer; sPart, sBin,
  sLot: string): string;
begin
  with GetStockDescSQL do
    begin
      close;
      parambyname('Part_Store').asInteger := iPartStore;
      parambyname('Part').asstring := sPart;
      if sBin = '' then
        parambyname('Part_Bin').clear
      else
        paramByname('Part_Bin').asstring := sBin;

      if sLot = '' then
        parambyname('Part_Store_Lot').clear
      else
        parambyname('Part_Store_Lot').AsString := sLot;
      open;

      try
        Result := fieldbyname('Invoice_Upfront').AsString;
      except
        result := '';
      end;
    end;

// get last lot invoice upfront flag
  if result = '' then
    begin
      with qryGetLastLot do
        begin
          close;
          parambyname('Part_Store').asInteger := iPartStore;
          parambyname('Part').asstring := sPart;
          open;

          result := fieldbyname('Invoice_upfront').asstring;
        end;
    end;

// if isn't one then get customer default flag
  if result = '' then
    begin
      with qryGetCustomer do
        begin
          close;
          parambyname('Part').asstring := sPart;
          open;

          result := fieldbyname('Invoice_upfront').asstring;
        end;
    end;
  if result = '' then
    result := 'Y';

end;

function TSTStkTkDM.GetNewStoreStockCost(TempRef: integer; TempPart: string): real;
begin
   With GetPartSQL do
       begin
       Close ;
       ParamByName('Part').AsString := TempPart ;
       Open ;
       try
       if FieldByName('Purch_Pack_Quantity').AsInteger = 0 then
        Result := 0.00
       else
        Result := (FieldByName('Part_Purchase_Price').AsFloat  /
                                FieldByName('Purch_Pack_Quantity').AsInteger) ;
       except
        Result := 0.00
       end;
  end
end;

function TSTStkTkDM.GetPacksize(TempRef: string): integer;
begin
 with PartSQL do
    begin
      close;
      parambyname('Part').asstring := TempRef;
      open;
      result := fieldbyname('Purch_pack_Quantity').asInteger;
      close;
    end
end;

function TSTStkTkDM.GetPartDescription(TempRef: string): string;
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

function TSTStkTkDM.GetPartStoreName(iCode: integer): string;
begin
 with PartStoreSQL do
    begin
      close;
      parambyname('Part_Store').asinteger := iCode;
      open;
      Result := fieldbyname('Part_Store_Name').asstring;
    end;
end;

function TSTStkTkDM.GetSerial(TempRef: string): boolean;
begin
  with PartSQL do
    begin
      close;
      parambyname('Part').asstring := TempRef;
      open;
      result := fieldbyname('Track_serial_No').asstring = 'Y';
      close;
    end
end;

function TSTStkTkDM.GetSetsInPad(iPartStore: integer; sPart, sBin,
  sLot: string): integer;
begin
  with GetStoreStockNoSQL do
    begin
      close;
      parambyname('Part_Store').asInteger := iPartStore;
      parambyname('Part').asstring := sPart;
      if sBin = '' then
        parambyname('Part_Bin').clear
      else
        paramByname('Part_Bin').asstring := sBin;

      if sLot = '' then
        parambyname('Part_Store_Lot').clear
      else
        parambyname('Part_Store_Lot').AsString := sLot;
      open;

      try
        Result := fieldbyname('Sets_Per_Pad').AsInteger;
      except
        result := 1;
      end;
    end
end;

function TSTStkTkDM.GetStockPO(iPartStore: integer; sPart, sBin,
  sLot: string): integer;
begin
with GetStoreStockNoSQL do
    begin
      close;
      parambyname('Part_Store').asInteger := iPartStore;
      parambyname('Part').asstring := sPart;
      if sBin = '' then
        parambyname('Part_Bin').clear
      else
        paramByname('Part_Bin').asstring := sBin;

      if sLot = '' then
        parambyname('Part_Store_Lot').clear
      else
        parambyname('Part_Store_Lot').AsString := sLot;
      open;

      try
        Result := fieldbyname('Purchase_Order').AsInteger;
      except
        result := 0;
      end;
    end
end;

function TSTStkTkDM.GetStockDescription(iPartStore: integer; sPart, sBin,
  sLot: string): string;
begin
  with GetStockDescSQL do
    begin
      close;
      parambyname('Part_Store').asInteger := iPartStore;
      parambyname('Part').asstring := sPart;
      if sBin = '' then
        parambyname('Part_Bin').clear
      else
        paramByname('Part_Bin').asstring := sBin;

      if sLot = '' then
        parambyname('Part_Store_Lot').clear
      else
        parambyname('Part_Store_Lot').AsString := sLot;
      open;

      try
        Result := fieldbyname('Store_Stock_Description').AsString;
      except
        result := '';
      end;
    end;


// get last lot invoice stock reference
  if result = '' then
    begin
      with qryGetLastLot do
        begin
          close;
          parambyname('Part_Store').asInteger := iPartStore;
          parambyname('Part').asstring := sPart;
          open;

          result := fieldbyname('Store_Stock_Description').asstring;
        end;
    end;
end;

function TSTStkTkDM.GetStoreStock(iPartStore: integer; sPart, sBin,
  sLot: string): integer;
begin
 with GetStoreStockNoSQL do
    begin
      close;
      parambyname('Part_Store').asInteger := iPartStore;
      parambyname('Part').asstring := sPart;
      if sBin = '' then
        parambyname('Part_Bin').clear
      else
        paramByname('Part_Bin').asstring := sBin;

      if sLot = '' then
        parambyname('Part_Store_Lot').clear
      else
        parambyname('Part_Store_Lot').AsString := sLot;
      open;

      try
        Result := fieldbyname('Store_Stock').AsInteger;
      except
        result := 0;
      end;
    end
end;

function TSTStkTkDM.GetStoreStockCost(TempRef: integer): real;
begin
  with StoreStockSQL do
    begin
      close;
      parambyname('Store_Stock').asinteger := TempRef;
      open;
      try
         if fieldbyname('Store_quantity').asinteger = 0 then
         Result := 0.00
      else
        Result := fieldbyname('Store_Cost').asfloat / fieldbyname('Store_quantity').asinteger;
      except
        result := 0.00;
      end;
    end
 end;

procedure TSTStkTkDM.Loadcountinglist(var countinglist: Tcountinglist);
begin
  with CountHeadSQL do
  begin
    Close;
    ParamByName('Stock_Take_Ref').AsString := countinglist.countinglistRef;
    Open;
    countinglist.PartStore := fieldbyname('Part_Store').asinteger;
    countinglist.BinsInUse := fieldbyname('Stock_Bins_in_Use').asboolean;
    countinglist.LotsInUse := fieldbyname('Stock_Lots_in_Use').asboolean;
    Close;
  end;
end;

procedure TSTStkTkDM.LoadcountinglistFromDB(var countinglist: Tcountinglist);
begin
  Loadcountinglist(countinglist);
  LoadLineDets(countinglist);
end;

procedure TSTStkTkDM.LoadLineDets(var countinglist: Tcountinglist);
var
  aLine: TCountLine;
  iLine: integer;
begin
  countinglist.CountLines.Clear;
  {Load the line details for stocktake ref}
  with STStkTkDM.CountDtlsSQL do
  begin
    Close;
    ParamByName('Stock_Take_Ref').AsString := countinglist.countinglistRef;
    Open;
    iLine:=0;
    while not EOF do
    begin
    aLine := TCountLine.Create;
    with aLine do
      begin
      inc(iLine);
      Line := iLine;
      PartBin := FieldByName('Part_Bin_Orig').Asstring;
      CountBin := FieldByName('Part_Bin').Asstring;
      PartStoreLot := FieldByName('Part_Store_Lot_Orig').Asstring;
      CountLot := FieldByName('Part_Store_Lot').Asstring;
      QtyPrior := FieldByName('Stock_Take_Prior_Qty').AsInteger;
      Part := FieldByName('Part').AsString;
      QtyCounted := FieldByName('Stock_Take_Qty').AsInteger;
      BinPrior := FieldByName('Part_Bin_Orig').AsString;
      LotPrior := FieldByName('Part_Store_Lot_Orig').AsString;
      ActionTkn := '';
      PriorPackQty := FieldByName('Stock_Take_pack_qty_Orig').AsInteger;
      PackQty := FieldByName('Stock_Take_Pack_Qty').AsInteger;
      LineStatus := FieldByName('Stock_Take_Status').AsString;
      If (QtyCounted = 0) and (LineStatus <> 'H') then
      begin
        QtyCounted := QtyPrior;
        ActionTkn := 'C';
      end;
            { if qty counted =0 then default to prior qty and set action taken to c , as if
             the user has amended each line}
      SerialNumbers := fieldbyname('Track_Serial_No').asboolean;
      StockTakeNo := fieldbyName('Stock_Take').asinteger;
      end;
      countinglist.CountLines.Add(aLine);
         {if aline.serialnumbers then
            LoadSerialNumbers(CountingList,aLine,STStkTkDM.CountDtlsSQL,0) }
      Next;
    end;
    Close;
  end;
end;

procedure TSTStkTkDM.LoadSerialNumbers(aCountingList: TCountingList;
  tLine: TCountLine; dsCountLine: TDataset; iQtyCount: integer);
var
  LotNumber: TLotNumber;
begin
  {Insert records into the Pick Line Serial Number list}
  tLine.QtyCounted := tLine.QtyCounted + iQtyCount;
  tLine.QtyPrior := tLine.QtyCounted;

  LotNumber := TLotNumber.create;
  LotNumber.LotNumberRef := dsCountLine.fieldbyname('Part_Store_Lot').Asstring;
  LotNumber.stockTakeNo := dsCountline.fieldbyName('Stock_Take').asInteger;
  tLine.LotNumbers.Add(LotNumber);

end;

procedure TSTStkTkDM.UpdateCount(Sender: TObject);
var
  sTempPart, sTempBin, sTempLot, sTempType, sTempRef, sOrigBin, sOrigLot, sTempStockDesc, sTempInvUpfront : String ;
  iTempStore, iTempCode, iTempQty, iTempAlloc, iTempPackSize, iTempNewPackSize, iTempSetsInPad : Integer;
  fTempCost : Real;
  rPO: real;
  bChanged: Boolean ;
begin
  STStockDataMod := TSTStockDataMod.Create(self);
    With GetCountStkSQL do
    begin
    Close;
    ParamByName('Stock_Take_Ref').asString := STStkTkDM.CountListSRC.dataset.fieldbyname('Stock_Take_Ref').asstring;
    Open;
    First;
    While not eof do
      begin
        sTempPart := FieldByName('Part').AsString;
        iTempStore := FieldByName('Part_Store').AsInteger;
        sTempBin := FieldByName('Part_Bin').AsString;
        sTempLot := FieldByName('Part_Store_Lot').AsString;
        sTempRef := 'Stock Count: '+FieldByName('Stock_Take_Ref').AsString;
        sOrigBin := FieldByName('Part_Bin_Orig').AsString;
        sOrigLot := FieldByName('Part_Store_Lot_Orig').AsString;
        iTempPackSize := FieldByName('Stock_Take_Pack_qty_orig').AsInteger;
        iTempNewPackSize := FieldByName('Stock_Take_Pack_qty').AsInteger;
        sTempStockDesc := GetStockDescription(iTempStore,sTempPart, sOrigBin, sOrigLot);
        sTempInvUpfront := GetInvupfront(iTempStore,sTempPart, sOrigBin, sOrigLot);
        iTempSetsInPad := GetSetsinPad(iTempStore,sTempPart, sOrigBin, sOrigLot);
        rPO := GetStockPO(iTempStore,sTempPart, sOrigBin, sOrigLot);

        if iTempPacksize <> iTempNewPackSize then
        begin
          sTempType :='B';
          iTempQty := FieldByName('Stock_Take_Prior_Qty').AsInteger * -1;
          sTempBin := FieldByName('Part_Bin_Orig').AsString;
          sTempLot := FieldByName('Part_Store_Lot_Orig').AsString;
          iTempCode := GetStoreStock(iTempStore, sTempPart, sTempBin, sTempLot);

          if iTempQty <>0 then
          begin
            fTempCost := GetStoreStockCost(iTempCode)*iTempQty;
            STStockDataMod.UpdStoreStock(iTempCode,sTempPart,iTempStore,sTempBin,sTempLot,
              sTempType, sTempRef, Date, Date, iTempQty, iTempAlloc, iTempPacksize, fTempcost, sTempStockDesc, sTempInvupfront, iTempSetsInPad, rPO, 0, 0,'N');
          end;
            {Adj out prior bin }

          sTempBin := FieldByName('Part_Bin').AsString;
          sTempLot := fieldByName('Part_store_Lot').AsString;
          iTempCode := GetStoreStock(iTempStore, sTempPart, sTempBin, sTempLot);
          iTempQty := (FieldByName('Stock_Take_Qty').AsInteger) ;
          sTempType:= 'A';
          if iTempQty <> 0 then
          begin
            fTempCost := GetStoreStockCost(iTempCode)*iTempQty;
            if iTempCode <> 0 then
              STStockDataMod.UpdStoreStock(iTempCode,sTempPart,iTempStore,sTempBin,sTempLot,
                sTempType, sTempRef, Date, Date, iTempQty, iTempAlloc, iTempNewPacksize, fTempcost, sTempStockDesc, sTempInvupfront, iTempSetsInPad, rPO, 0, 0, 'N')
            else
            begin
              fTempCost := GetNewStoreStockCost(iTempCode, sTempPart)* iTempQty;
              STStockDataMod.AddStoreStock(sTempPart,iTempStore,sTempBin,sTempLot,
                sTempType, sTempRef, Date, Date, iTempQty, iTempAlloc, iTempNewPacksize, fTempcost, sTempStockDesc, sTempInvupfront, iTempSetsInPad, rPO, 0, 'N');
          end;
        end;
            {Adjust in new qty to Bins Lots}
      end
      else
        begin
          bChanged := CheckDiffBinLot(sOrigBin, sTempBin, sOrigLot, sTempLot);
          iTempAlloc := 0;
          fTempCost := 0.00;
          if (fieldbyname('Stock_Take_Status').AsString <> 'K') or
              (fieldbyname('Part').asstring <> '') then
          begin
            if not bchanged then
            begin
              iTempQty := (((FieldByName('Stock_Take_Prior_Qty').AsInteger)* -1 ) +
                  (FieldByName('Stock_Take_Qty').AsInteger));
              iTempCode := GetStoreStock(iTempStore, sTempPart, sTempBin, sTempLot);
              if iTempQty <> 0 then
                fTempCost := GetStoreStockCost(iTempCode)* iTempQty;

              if iTempQty > 0 then
                sTempType := 'A'
              else
                sTempType := 'B';

              if iTempQty <> 0 then
              begin
                if iTempCode<> 0 then
                  STStockDataMod.UpdStoreStock(iTempCode,sTempPart,iTempStore,sTempBin,sTempLot,
                    sTempType, sTempRef, Date, Date, iTempQty, iTempAlloc,iTempPackSize, fTempcost, sTempStockDesc, sTempInvupfront, iTempSetsInPad, rPO, 0, 0, 'N')
                else
                  begin
                    fTempCost := GetNewStoreStockCost(iTempCode, sTempPart)* iTempQty;
                    STStockDataMod.AddStoreStock(sTempPart,iTempStore,sTempBin,sTempLot,
                     sTempType, sTempRef, Date, Date, iTempQty, iTempAlloc,iTempPacksize, fTempCost, sTempStockDesc, sTempInvupfront, iTempSetsInPad, rPO, 0, 'N');
                  end;
              end;
            end
          else
            begin
              sTempType :='B';
              iTempQty :=FieldByName('Stock_Take_Qty').AsInteger;
              if iTempQty > FieldByName('Stock_Take_Prior_Qty').AsInteger then
                iTempQty := FieldByName('Stock_Take_Prior_Qty').AsInteger;

              iTempQty := iTempQty * -1 ;
              sTempBin := FieldByName('Part_Bin_Orig').AsString;
              sTempLot := FieldByName('Part_Store_Lot_Orig').AsString;
              iTempCode := GetStoreStock(iTempStore, sTempPart, sTempBin, sTempLot);

              if iTempQty <>0 then
              begin
                fTempCost := GetStoreStockCost(iTempCode)*iTempQty;
                STStockDataMod.UpdStoreStock(iTempCode,sTempPart,iTempStore,sTempBin,sTempLot,
                  sTempType, sTempRef, Date, Date, iTempQty, iTempAlloc, iTempPacksize, fTempcost, sTempStockDesc, sTempInvupfront, iTempSetsInPad, rPO, 0, 0, 'N');
              end;
            {Adj out prior bin }

              sTempBin := FieldByName('Part_Bin').AsString;
              sTempLot := fieldByName('Part_store_Lot').AsString;
              iTempCode := GetStoreStock(iTempStore, sTempPart, sTempBin, sTempLot);
              iTempQty := (FieldByName('Stock_Take_Qty').AsInteger) ;
              sTempType:= 'A';
              if iTempQty <> 0 then
              begin
                fTempCost := GetStoreStockCost(iTempCode)*iTempQty;
                if iTempCode <> 0 then
                  STStockDataMod.UpdStoreStock(iTempCode,sTempPart,iTempStore,sTempBin,sTempLot,
                  sTempType, sTempRef, Date, Date, iTempQty, iTempAlloc, iTempPacksize, fTempcost, sTempStockDesc, sTempInvupfront, iTempSetsInPad, rPO, 0, 0, 'N')
                else
                begin
                  fTempCost := GetNewStoreStockCost(iTempCode, sTempPart)* iTempQty;
                  STStockDataMod.AddStoreStock(sTempPart,iTempStore,sTempBin,sTempLot,
                  sTempType, sTempRef, Date, Date, iTempQty, iTempAlloc, iTempPacksize, fTempcost, sTempStockDesc, sTempInvupfront, iTempSetsInPad, rPO, 0, 'N');
                end;
              end;
            {Adjust in new qty to Bins Lots}

              end;
            end;
          end;
      UpdateCountRec(Self);
      next;
    end;
  end;
end;

procedure TSTStkTkDM.UpdateCountRec(Sender: TObject);
begin
  with UpdStatusSQL do
    begin
      Close;
      parambyname('stock_take').AsInteger := getcountstkSQL.fieldbyname('stock_take').asInteger;
      parambyname('status').AsString := 'K';
      execSQL;
    end;
 end;

function TSTStkTkDM.validBin(iStore: integer; sBin: string): boolean;
begin
  with CheckvalidBinSQL do
    begin
      close;
      parambyname('Part_Store').asinteger := iStore;
      parambyname('Part_Bin').asstring := sBin;
      open;
      if recordcount > 0 then
        result := true
      else
        result := false;
    end;
end;

function TSTStkTkDM.validlot(sPart, sLot: string): boolean;
begin
 with CheckvalidlotSQL do
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

end.


