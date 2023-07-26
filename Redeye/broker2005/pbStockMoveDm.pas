unit pbStockMoveDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlStockMove = class(TDataModule)
    GetStoresSQL: TFDQuery;
    StoresDataSource: TDataSource;
    CheckValidBinSQL: TFDQuery;
    GetPartSql: TFDQuery;
    UpdLastLotSQL: TFDQuery;
    GetStoreStockIntSQL: TFDQuery;
    GetStoreSQL: TFDQuery;
    UpdStockSQL: TFDQuery;
    DelStockSQL: TFDQuery;
    GetStoreStockSQL: TFDQuery;
    GetStoreBinSQL: TFDQuery;
    AddStoreBinSQL: TFDQuery;
    GetNextStockSQL: TFDQuery;
    AddStockSQL: TFDQuery;
    GetNextMoveSQL: TFDQuery;
    AddMoveSQL: TFDQuery;
    GetStoreStockNoSQL: TFDQuery;
    CheckPartExistsQuery: TFDQuery;
    AddPartQuery: TFDQuery;
    UpdPartQuery: TFDQuery;
    PriceUnitSQL: TFDQuery;
    AddStStkSerial: TFDQuery;
    qryGetStoreStock: TFDQuery;
    qryPartInactive: TFDQuery;
  function validBin(iStore: integer; sBin: string): boolean;
  function GetPackSize(iTempPart: string): integer;
  procedure AddStock(sTempPart: String; iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvUpFront, sNumberFrom, sNumberTo: string;
                                         iNoSets: integer; rPO: real; iPalletID: integer; sOvers: string);
  procedure AddMovement(sTempPart: String; iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sMoveText: string; rPO: real; iPalletID, iProductID: integer);
  function GetProductID(sTempPart: string): integer;
  function GetNextLot(sTempPart: String): String;
  function GetStoreStock(iPartStore: integer; sPart, sBin, sLot: string): integer;
  procedure UpdStock(iTempCode: Integer; sTempPart: String; iTempStore: Integer; sTempBin,sTempLot, sTempType, sTempRef: String; dTempDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvUpFront, sNumberFrom, sNumberTo: string;
                                         iNoSets: integer; rPO: real; iPalletID, iProductID: integer; sOvers: string);
  private
    function GetTotalStock(tempStore: integer; tempPart: string): real;
    function GetTotalAllocatedStock(tempStore: integer; tempPart: string): real;
    function GetTotalStockValue(tempStore: integer; tempPart: string): real;
    { Private declarations }
  public
    { Public declarations }
    sFreeStockDets: String ;
    iNewStoreStock: Integer;
    bPrintOnAudit: ByteBool;
  end;

var
  dtmdlStockMove: TdtmdlStockMove;

implementation

uses pbMainMenu, ccscommon;

{$R *.DFM}

{ TPBStockDataMod }

procedure TdtmdlStockMove.AddMovement(sTempPart: String;
  iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String;
  dTempDate: TDateTime; iTempQty, iTempAlloc, iTempPackSize: Integer;
  fTempCost: Real; sMoveText: string; rPO: real; iPalletID, iProductID: integer);
Var
iTempNextMove: Integer;
begin
  {Don't add movements with no cost and no quantity} ;
  If (iTempQty = 0) and (fTempCost = 0) then
     exit ;
  With GetNextMoveSQL do
     begin
     Close ;
     Open ;
     First ;
     iTempNextMove := FieldByName('Last_Code').AsInteger + 1 ;
     end;
  {Add a movement to the movement file} ;
  With AddMoveSQL do
  begin
     Close ;
     ParamByName('Part_Movement').AsInteger := iTempNextMove ;
     ParamByName('Part').AsString := sTempPart ;
     ParamByName('Date_Received').AsDateTime := Trunc(dTempDate) ;
     ParamByName('Part_Movement_Type').AsString := sTempType ;
     ParamByName('Part_Movement_Store').AsInteger := iTempStore ;
     ParamByName('Part_Movement_Reference').AsString := sTempRef ;
     If Trim(sTempBin) = '' then
        ParamByName('Part_Movement_Bin').Clear
     else
        ParamByName('Part_Movement_Bin').AsString := sTempBin ;
     If Trim(sTempLot) = '' then
        ParamByName('Part_Store_Lot').Clear
     else
        ParamByName('Part_Store_Lot').AsString := sTempLot ;
     ParamByName('Store_Cost').AsFloat := fTempCost ;
     ParamByName('Store_Quantity').AsInteger := iTempQty ;
     ParamByName('Stock_Pack_Quantity').AsInteger := iTempPackSize ;
     ParamByName('Audit_User').AsString := frmpbMainMenu.sOperator_Name ;
     ParamByName('Audit_Workstation').AsString := frmPbMainMenu.sCompName ;
     If bPrintOnAudit then
        ParamByName('Print_On_Audit').AsString := 'Y'
     else
        ParamByName('Print_On_Audit').AsString := 'N' ;
     Parambyname('Part_Movement_Notes').asstring := sMoveText;
     Parambyname('Purchase_Order').asfloat := rPO;
     Parambyname('Pallet_Id').asinteger := iPalletID;
     Parambyname('Product_ID').asinteger := iProductID;
     ParambyName('Part_Store_Total_Quantity').AsFloat := (GetTotalStock(iTempStore, sTempPart));
     ParambyName('Part_Store_Total_Allocated').AsFloat := (GetTotalAllocatedStock(iTempStore, sTempPart));
     ParambyName('Part_Store_Total_Value').AsFloat := (GetTotalStockValue(iTempStore, sTempPart));
     ExecSQL ;
  end;

  {If the movement is D or J Despatch to Sales Order or Used for Job then check if product should become inactive}
  if (sTempType = 'D') or (sTempType = 'J') then
    begin
      with GetPartSQL do
        begin
          close;
          parambyname('Part').asstring := sTempPart;
          open;
          if (fieldbyname('Inactive_when_balance_zero').AsString = 'Y') and (GetTotalStock(0, sTempPart) = 0) then
            begin
              qryPartInactive.close;
              qryPartInactive.parambyname('Part').asstring := sTempPart;
              qryPartInactive.execsql;
            end;
        end;
    end;
end;

function TdtmdlStockMove.GetTotalStock(tempStore: integer; tempPart: string): real;
begin
  with qryGetStoreStock do
    begin
      close;
      parambyname('Part_Store').asinteger := tempStore;
      parambyname('Part').asstring := tempPart;
      open;

      result := fieldbyname('Total_Stock').asfloat;
    end;
end;

function TdtmdlStockMove.GetTotalAllocatedStock(tempStore: integer; tempPart: string): real;
begin
  with qryGetStoreStock do
    begin
      close;
      parambyname('Part_Store').asinteger := tempStore;
      parambyname('Part').asstring := tempPart;
      open;

      result := fieldbyname('Total_Allocated_Stock').asfloat;
    end;
end;

function TdtmdlStockMove.GetTotalStockValue(tempStore: integer; tempPart: string): real;
begin
  with qryGetStoreStock do
    begin
      close;
      parambyname('Part_Store').asinteger := tempStore;
      parambyname('Part').asstring := tempPart;
      open;

      result := fieldbyname('Total_Stock_Value').asfloat;
    end;
end;

procedure TdtmdlStockMove.AddStock(sTempPart: String; iTempStore: Integer;
  sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate: TDateTime;
  iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvUpfront, sNumberFrom, sNumberTo: string;
  iNoSets: integer; rPO: real; iPalletID: integer; sOvers: string);
Var
  iTempNextStock, iProductID: Integer;
  sMovetext: string;
begin
  sMovetext := '';
  If (iTempQty = 0) and (iTempAlloc = 0) then
    exit ;
  iProductID := GetProductID(sTempPart);
  With GetStoreStockSQL do
     begin
     Close ;
     ParamByName('Part_Store_Lot').AsString := sTempLot ;
     ParamByName('Part').AsString := sTempPart ;
     ParamByName('Part_Store').AsInteger := iTempStore ;
     ParamByName('Part_Bin').AsString := sTempBin ;
     Open ;
     First ;
     If EOF = False then
        begin
        {Add the stock to an existing store stock record} ;
        iNewStoreStock := FieldByName('Store_Stock').AsInteger ;
        UpdStock(FieldByName('Store_Stock').AsInteger, sTempPart,iTempStore,sTempBin,
                  sTempLot, sTempType, sTempRef, dTempDate, iTempQty, iTempAlloc, iTempPackSize,
                  fTempCost, sTempDesc, sInvupFront, sNumberFrom, sNumberTo, iNoSets, rPO, iPalletID, iProductID, 'N');
        exit ;
        end;
     end;
If sTempBin <> '' then
     begin
     {Check if the bin exists in the store} ;
     With GetStoreBinSQL do
          begin
          Close ;
          ParamByName('Part_Store').AsInteger := iTempStore ;
          ParamByName('Part_Bin').AsString := sTempBin ;
          Open ;
          First ;
          If EOF then
             begin
             {If the bin doesn't exist, create it} ;
             With AddStoreBinSQL do
                  begin
                  Close ;
                  ParamByName('Part_Store').AsInteger := iTempStore ;
                  ParamByName('Part_Bin').AsString := sTempBin ;
                  ParamByName('Bin_Can_Pick').AsString := 'Y' ;
                  ExecSQL ;
                  end;
             end;
          end;
     end;
With GetNextStockSQL do
     begin
     Close ;
     Open ;
     First ;
     iTempNextStock := FieldByName('Last_Code').AsInteger + 1 ;
     end;
{Save the new Store_Stock code} ;
iNewStoreStock := iTempNextStock ;
With AddStockSQL do
     begin
     Close ;
     ParamByName('Store_Stock').AsInteger := iTempNextStock ;
     If Trim(sTempLot) = '' then
        ParamByName('Part_Store_Lot').Clear
     else
        ParamByName('Part_Store_Lot').AsString := sTempLot ;
     ParamByName('Date_Received').AsDateTime := Trunc(dTempDate) ;
     ParamByName('Store_Cost').AsFloat := fTempCost ;
     ParamByName('Store_Quantity').AsInteger := iTempQty ;
     ParamByName('Quantity_Allocated').AsInteger := iTempAlloc ;
     ParamByName('Stock_Pack_Quantity').AsInteger := iTempPackSize ;
     ParamByName('Part').AsString := sTempPart ;
     ParamByName('Part_Store').AsInteger := iTempStore ;
     If Trim(sTempBin) = '' then
        ParamByName('Part_Bin').Clear
     else
        ParamByName('Part_Bin').AsString := sTempBin ;
     if Trim(sInvUpfront) = '' then
        ParamByName('Up_front').clear
     else
        ParamByName('Up_Front').AsString := sInvUpfront;
     ParamByName('Store_Stock_Description').Asstring := sTempDesc;
     ParambyName('Sets_per_pad').asinteger := iNoSets;
     ParambyName('Purchase_Order').asfloat := rPO;
     ParamByName('Pallet_ID').Asinteger := iPalletID;
     ParamByName('Product_Id').Asinteger := iProductID;
     ParamByName('Stock_is_Overs').Asstring := sOvers;
     ExecSQL ;
     end;

  if trim(sNumberFrom) <> '' then
  begin
    {Add store stock serial item}
    with AddStStkSerial do
      begin
        close;
        parambyname('store_stock').asinteger := itempnextstock;
        parambyname('serial_item_no').asinteger := 1;
        parambyname('serial_item_from').asstring := sNumberFrom;
        parambyname('serial_item_to').asstring := sNumberTo;
        execsql;
      end;
    sMoveText := 'Numbers: '+ sNumberfrom + ' to ' + sNumberTo;
  end;
  {Add a movement to the movement file} ;
  AddMovement(sTempPart, iTempStore, sTempBin ,sTempLot, sTempType, sTempRef, dTempDate,iTempQty,
                        iTempAlloc, iTempPackSize, fTempCost, sMoveText, rPO, iPalletID, iProductID);

end;

function TdtmdlStockMove.GetNextLot(sTempPart: String): String;
begin
With GetPartSQL do
     begin
     Close ;
     ParamByName('Part').AsString := sTempPart ;
     Open ;
     First ;
     If Trim(FieldByName('Last_Store_Lot').AsString) = '' then
        Result := '0000000001'
     else
        Result := IncrementNo(FieldByName('Last_Store_Lot').AsString) ;
     end;
With UpdLastLotSQL do
     begin
     Close ;
     ParamByName('Part').AsString := sTempPart ;
     ParamByName('Last_Store_Lot').AsString := Result ;
     ExecSQL ;
     end;
end;

function TdtmdlStockMove.GetPackSize(iTempPart: string): integer ;
begin
with GetPartSQL do
begin
  Close;
  ParamByName('Part').AsString := iTempPart;
  Open;
  if RecordCount > 0 then
    result := fieldByName('Purch_Pack_Quantity').AsInteger
  else
    result := 0;
  end;
end;

function TdtmdlStockMove.GetStoreStock(iPartStore: integer; sPart, sBin,
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

procedure TdtmdlStockMove.UpdStock(iTempCode: Integer; sTempPart: String;
  iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String;
  dTempDate: TDateTime; iTempQty, iTempAlloc, iTempPackSize: Integer;
  fTempCost: Real; sTempDesc, sInvUpFront, sNumberFrom, sNumberTo: string;
  iNoSets: integer; rPO: real; iPalletID, iProductID: integer; sOvers: string);
Var
bAllowNeg, bBins, bLots: ByteBool ;
iUpdQty, iQty: Integer ;
rUpdCost, rCost: Real ;
sNegBin, sNegLot: String ;
begin
If iTempCode <> 0 then
   begin
   {Find out if the record has enough stock, and if the store allows negatives} ;
   With GetStoreStockIntSQL do
        begin
        Close ;
        ParamByName('Store_Stock').AsInteger := iTempCode ;
        Open ;
        First ;
        iQty := FieldByName('Store_Quantity').AsInteger ;
        rCost := FieldByName('Store_Cost').AsFloat ;
        end;
   end
else
   begin
   iQty := 0 ;
   rCost := 0 ;
   end;
{There is a negative stock situation if:} ;
{      The quantity to move is less than zero (movement out) AND} ;
{      Tre qty on the stock record + the qty to move is < 0 (not enqough stock) AND} ;
If (iTempQty >= 0) or (iQty + iTempQty >= 0)  then
     begin
     iUpdQty := iTempQty ;
     rUpdCost := fTempCost ;
     end
else
     begin
     {This is a negative stock situation. Check how the store is supposed to} ;
     {handle -ve stock} ;
     With GetStoreSQL do
          begin
          Close ;
          ParamByName('Part_Store').AsInteger := iTempStore ;
          Open ;
          First ;
          bAllowNeg := (FieldByName('Allow_Neg_Stock').AsString = 'Y') ;
          bBins := (FieldByName('Stock_Bins_In_Use').AsString = 'Y') ;
          bLots := (FieldByName('Stock_Lots_In_Use').AsString = 'Y') ;
          end;
          if bBins then
             sNegBin := 'NegStock'
          else
             sNegBin := '' ;
          if bLots then
             sNegLot := 'NegStock'
          else
             sNegLot := '' ;
      {Now handle the missing stock} ;
     If bAllowNeg = False then
        begin
        {There is negative stock but negative stock is NOT allowed} ;
        {Set the quantites to adjust any existing stock record to zero} ;
        iUpdQty := 0 - iQty ;
        rUpdCost := 0 - rCost ;
        {Adjust the missing stock into the negative stock bin/lot} ;
        AddMovement(sTempPart,iTempStore,sNegBin,sNegLot, 'R', sTempRef, dTempDate, 0 - (iTempQty + iQty),
                        0, iTempPackSize, 0 - ((iTempQty / (iTempQty + iQty)) * fTempCost),'',rPO,iPalletID, iProductID);
        {Then move it back out again} ;
        AddMovement(sTempPart,iTempStore,sNegBin,sNegLot, sTempType, sTempRef, dTempDate, iTempQty + iQty,
                        0, iTempPackSize, (iTempQty / (iTempQty + iQty)) * fTempCost,'',rPO,iPalletID, iProductID);
        end
     else
        begin
        {There is negative stock AND negative stock is allowed} ;
        If iTempCode <> 0 then
           begin
           {There is an existing stock record so just send it -ve} ;
           iUpdQty := iTempQty ;
           rUpdCost := fTempCost ;
           end
        else
           begin
           {There is NO existing stock record so create a new -ve stock record} ;
           AddStock(sTempPart, iTempStore, sNegBin, sNegLot, sTempType, sTempRef, dTempDate,
                                iTempQty, iTempAlloc, iTempPackSize, fTempCost, STempDesc, sInvUpFront,
                                sNumberFrom, sNumberTo, iNoSets, rPO, iPalletID, sOvers) ;
           exit;
           end;
        end;
     end;
{Update a stock record, also check for zeroes (for deletions)} ;
  With UpdStockSQL do
     begin
     Close ;
     ParamByName('Store_Stock').AsInteger := iTempCode ;
     ParamByName('Store_Cost_Adj').AsFloat := rUpdCost ;
     ParamByName('Store_Quantity_Adj').AsInteger := iUpdQty ;
     ParamByName('Quantity_Allocated_Adj').AsInteger := iTempAlloc ;
     ParamByName('Invoice_Upfront').AsString := sInvUpfront;
     ParamByName('Store_Stock_Description').AsString := sTempDesc;
     ExecSQL ;
     end;
  With DelStockSQL do
     begin
     Close ;
     ParamByName('Store_Stock').AsInteger := iTempCode ;
     ExecSQL ;
     end;
  AddMovement(sTempPart,iTempStore,sTempBin,sTempLot, sTempType, sTempRef, dTempDate,iUpdQty,
                        iTempAlloc, iTempPackSize, rUpdCost,'',rPO,iPalletID, iProductID);

end;

function TdtmdlStockMove.validBin(iStore: integer; sBin: string): boolean;
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

function TdtmdlStockMove.GetProductID(sTempPart: string): integer;
begin
  with GetPartSQL do
    begin
      Close ;
      ParamByName('Part').AsString := sTempPart ;
      Open ;
      First ;
      result := fieldbyname('Product_Id').asinteger;
    end;
end;

end.
