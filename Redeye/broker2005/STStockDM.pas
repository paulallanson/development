unit STStockDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, STPickObject;

type
  TSTStockDataMod = class(TDataModule)
    AddMoveSQL: TQuery;
    GetNextMoveSQL: TQuery;
    GetMoveTypesSQL: TQuery;
    MoveTypesDataSource: TDataSource;
    GetStoresSQL: TQuery;
    StoresDataSource: TDataSource;
    GetStoreStocksSQL: TQuery;
    GetPartSQL: TQuery;
    UpdLastLotSQL: TQuery;
    AddStockSQL: TQuery;
    GetNextStockSQL: TQuery;
    UpdStockSQL: TQuery;
    DelStockSQL: TQuery;
    GetMoveTypeSQL: TQuery;
    GetStoreSQL: TQuery;
    GetFreeStoreStockSQL: TQuery;
    AddAllocSQL: TQuery;
    GetNextAllocSQL: TQuery;
    GetStoreStockIntSQL: TQuery;
    GetAllocStockByRefSQL: TQuery;
    UpdAllocSQL: TQuery;
    DelAllocSQL: TQuery;
    AddTransferSQL: TQuery;
    NextTransfer: TQuery;
    UpdSOAllocSQL: TQuery;
    GetStoreStockSQL: TQuery;
    GetStoreBinSQL: TQuery;
    AddStoreBinSQL: TQuery;
    GetDefPartStoreSQL: TQuery;
    GetLastIntSelSQL: TQuery;
    AddWorkSQL: TQuery;
    DelWorkSQL: TQuery;
    UpdSalesOrderAllocSQL: TQuery;
    GetPriceUnitSQL: TQuery;
    dtSrcPriceUnit: TDataSource;
    AddStoreStockSQL: TQuery;
    GetCouriersSQL: TQuery;
    CouriersDataSource: TDataSource;
    DelStockSNSQL: TQuery;
    GetStkSerialSQL: TQuery;
    ResetStockSNSQl: TQuery;
    qryUpdStockBin: TQuery;
    GetSalesOrderLineSQL: TQuery;
    qryGetTransferStStk: TQuery;
    qryGetNonTransferStStk: TQuery;
    qryGetStoreStock: TQuery;
    qryGetJobBagRtn: TQuery;
    qryAddJobBagRtn: TQuery;
    qryGetReturns: TQuery;
    qryPartInactive: TQuery;
    GetAllocStockbyStoreStockSQL: TQuery;
    qryGetJobBag: TQuery;
    qryAddSO: TQuery;
    qryGetBin: TQuery;
    UpdLastSQL: TQuery;
    qryCompany: TQuery;
    GetLastSQL: TQuery;
    qryAddSORep: TQuery;
    qryAddSOLine: TQuery;
    qryGetPart: TQuery;
    qryAddJobBagRequest: TQuery;
    qryGetSalesOrderLines: TQuery;
    qryUpdSOStatus: TQuery;
    qryGetNextPickNo: TQuery;
    qryGetSOAlloc: TQuery;
    qryAddSOPick: TQuery;
    qryAddSODelivNote: TQuery;
    qryAddSODelivLine: TQuery;
    qryGetPickNote: TQuery;
    qryUpdPartStoreBin: TQuery;
  procedure AddMovement(sTempPart: String; iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; rPO: real; iPalletID, iProductID: integer);
  procedure AddStock(sTempPart: String; iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate,dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; rPO: real; iPalletID: integer; sOvers: string);
  procedure AddJobBagReturn(iStoreStock, iQuantity, iJobBag: integer; sPart: string);
  procedure AddStoreStock(sTempPart: String; iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate,dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvupfront: string; itempSetsinpad: integer;
                                          rPO: real; iPalletID: integer; sOvers: string);
  function AddAndGetStoreStock(sTempPart: String; iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate,dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvupfront: string; itempSetsinpad: integer;
                                          rPO: real; iPalletID: integer; sOvers: string): integer;
  procedure AllocateSalesOrder(SONumber: integer; tempStore: integer; tempBin: string);
  procedure ConfirmPicking(SONumber: integer);
  function CreateSalesOrder(iTempCode: Integer; sTempPart: String; iTempStore: Integer; sTempBin,sTempLot, sTempType, sTempRef: String; dTempDate, dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvUpfront: string; itempSetsinpad: integer; rPO: real;
                                         iPalletID, iProductID: integer; sOvers: string; JobBag: integer): integer;
  procedure CreateDeliveryNote(SONumber: integer);
  procedure CreatePickNote(SONumber: integer);
  function GetNextLot(sTempPart: String): String;
  function GetProductID(sTempPart: string): integer;
  procedure UpdateSOStatus(SONUmber, SOStatus: integer);
  procedure UpdStoreStockBin(iTempCode: integer; sTempBin: string);
  procedure UpdStock(iTempCode: Integer; sTempPart: String; iTempStore: Integer; sTempBin,sTempLot, sTempType, sTempRef: String; dTempDate,dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; rPO: real; iPalletID, iProductID: integer; sOvers: string);
  procedure UpdStoreStock(iTempCode: Integer; sTempPart: String; iTempStore: Integer; sTempBin,sTempLot, sTempType, sTempRef: String; dTempDate,dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvupfront: string; itempSetsinpad: integer;
                                         rPO: real; iPalletID, iProductID: integer; sOvers: string);
  Function CheckFreeStoreStock(iTempStore: Integer; sTempPart, sTempCanPick: String): Integer;
  Function AllocStock(iTempStore: Integer; sTempPart: String; iTempItem: Integer;
                    iTempReqdQty, iTempType, iTempItemLine: Integer; sAllocBy, sBin: string): Integer;
  Function CheckFreeStock(iTempStore: Integer; sTempPart: String): Integer;
  Function CheckFreePickStock(iTempStore: Integer; sTempPart: String): Integer;
  procedure DeAllocForwardStock(iStoreStock, iTempItem, iTempReqdQty, iTempType, iTempItemLine: Integer);
  Procedure DeAllocStock(iTempItem: Integer; iTempReqdQty, iTempType, iTempItemLine: Integer);
  procedure DeAllocProductionStock(iTempItem, iTempReqdQty, iTempType, iTempItemLine: Integer);
  procedure DeAllocWasteStock(iTempItem, iTempReqdQty, iTempType, iTempItemLine: Integer);
  procedure AddStockTransfer(sStoreLot, sPart: String; iSalesOrder,
          iPO: Integer; iStoreFrom: Integer; sBin: String;
          iStore, iOrderLine, iQuantity, iTempPackSize: integer;
                      dDate: TDateTime; rCost: real; iTempStoreStock: integer; bInvUpfront: boolean);
  Procedure AllocStoreStock(iTempStoreStock, iTempItem: Integer;
                    iTempReqdQty, iTempType, iTempItemLine: Integer; iTempOvers, iTempOverPicked: integer);
  procedure DataModuleCreate(Sender: TObject);
  Function GetDefaultStore(Sender: TObject): Integer;
  Function GetNextIntSelCode(Sender: TObject): Integer;
  Procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
  private
    SalesOrderNo: integer;
    UseForwardStock: boolean;
    FSelectedLotIndex: integer;
    FSelectedLineIndex: Integer;
    function GetPartNumbered(TempPart: string):Boolean;
    function GetTotalStock(tempStore: integer; tempPart: string): real;
    function GetTotalAllocatedStock(tempStore: integer; tempPart: string): real;
    function GetTotalStockValue(tempStore: integer; tempPart: string): real;
    procedure FreeCompanyRecord;
    function GetNextSONumber: Integer;
    procedure LockCompanyRecord;
    procedure TransferToProduction;
    procedure UpdateProduction;
    procedure UpdateTransfers;
    function GetSelectedLine: TPickLine;
    function GetSelectedLot: TLotNumber;
    function GetTotalPartAllocated(tempPart: string): integer;
    function GetTotalPartPicked(tempPart: string): integer;
    procedure UpdateBinPickStatus(iPartStore: integer; sBin,
      sPicking: string);
  public
    IsSalesOrder: boolean;
    JobBagNumber: integer;
    ToDestroy: boolean;
    sFreeStockDets: String ;
    iNewStoreStock: Integer;
    bPrintOnAudit: ByteBool;
    property SelectedLine: TPickLine read GetSelectedLine;
    property SelectedLineIndex: Integer read FSelectedLineIndex;
    property SelectedLot: TLotNumber read GetSelectedLot;
    property SelectedLotIndex: integer read FSelectedLotIndex;
  end;

var
  STStockDataMod: TSTStockDataMod;

implementation

uses pbMainMenu, CCSCommon, stPickingDM;

const
  FreeStockSQL =
  'Select * '+
  'From Store_Stock Left Join Part_Store_Bin '+
  '                  on ((Store_Stock.Part_Bin = Part_Store_Bin.Part_Bin) and '+
  '                      (Part_Store_Bin.Part_Store = Store_Stock.Part_Store)) '+
  'Where (Store_Stock.Part_Store = :Part_Store) and '+
  '    (Store_Stock.Part = :Part) and '+
  '    (Store_Stock.Store_Quantity > Store_Stock.Quantity_Allocated) and '+
  '    (Store_Stock.Store_Quantity > 0) and '+
  '    (((Part_Store_Bin.Bin_Can_Pick = ''Y'') or (Part_Store_Bin.Bin_Can_Pick = Null)) or '+
  '                                   (:Pick_Only <> ''Y'')) ';

  FreeSerialStockSQL =
  'SELECT Store_Stock.Store_Stock, '+
  '        Store_Stock.Quantity_Allocated, '+
  '        Store_Stock.Store_Quantity, '+
  '        Store_Stock.Store_Cost, '+
  '        Store_Stock.Date_Received, '+
  '        Store_Stock.Part, '+
  '        Store_Stock.Part_Store, '+
  '        Store_Stock.Part_Store_Lot, '+
  '        Store_Stock.Part_Bin, '+
  '        Store_Stock.Stock_Pack_Quantity, '+
  '        Store_Stock.Store_Stock_Description, '+
  '        Store_Stock.Invoice_Upfront, '+
  '        Part_Store_Bin.Bin_Can_Pick, '+
  '        (select distinct sales_order from store_stock_serial_item '+
  '          where store_stock_serial_item.store_stock = Store_Stock.Store_Stock and '+
  '                sales_order <> NULL) as Sales_order '+
  'FROM Part_Store_Bin '+
  '        INNER JOIN Store_Stock ON '+
  '          (Part_Store_Bin.Part_Bin = Store_Stock.Part_Bin) AND '+
  '          (Part_Store_Bin.Part_Store = Store_Stock.Part_Store) '+
  'WHERE (Store_Stock.Part_Store = :Part_Store) and '+
  '    (Store_Stock.Part = :Part) and '+
  '    (Store_Stock.Store_Quantity > Store_Stock.Quantity_Allocated) and '+
  '    (Store_Stock.Store_Quantity > 0) and '+
  '    (((Part_Store_Bin.Bin_Can_Pick = ''Y'') or (Part_Store_Bin.Bin_Can_Pick = Null)) or '+
  '                                 (:Pick_Only <> ''Y'')) and '+
  '    (select distinct sales_order from store_stock_serial_item '+
  '      where store_stock_serial_item.store_stock = Store_Stock.Store_Stock and '+
  '            sales_order <> NULL) = :Sales_Order ';

{$R *.DFM}


procedure TSTStockDataMod.AddMovement(sTempPart: String; iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; rPO: real; iPalletID, iProductID: integer);
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
     ParamByName('Audit_Workstation').AsString := frmpbMainMenu.sCompName ;
     If bPrintOnAudit then
        ParamByName('Print_On_Audit').AsString := 'Y'
     else
        ParamByName('Print_On_Audit').AsString := 'N' ;
     Parambyname('Purchase_Order').asfloat := rPO;
     Parambyname('Pallet_Id').asinteger := iPalletID;
     Parambyname('Product_ID').asinteger := iProductID;
     ParambyName('Part_Store_Total_Quantity').AsFloat := (GetTotalStock(iTempStore, sTempPart));
     ParambyName('Part_Store_Total_Allocated').AsFloat := (GetTotalAllocatedStock(iTempStore, sTempPart));
     ParambyName('Part_Store_Total_Value').AsFloat := (GetTotalStockValue(iTempStore, sTempPart));
     ExecSQL ;
  end;
  {If the movement is D, J or X, Despatch to Sales Order or Used for Job or Destroyed then check if product should become inactive}
  if (sTempType = 'D') or (sTempType = 'J') or (sTempType = 'X') then
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

function TSTStockDataMod.GetTotalStock(tempStore: integer; tempPart: string): real;
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

function TSTStockDataMod.GetTotalAllocatedStock(tempStore: integer; tempPart: string): real;
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

function TSTStockDataMod.GetTotalStockValue(tempStore: integer; tempPart: string): real;
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

procedure TSTStockDataMod.AddStock(sTempPart: String; iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate,dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; rPO: real; iPalletID: integer; sOvers: string);
Var
iTempNextStock, iProductID: Integer;
begin
iProductID := getProductID(sTempPart);
If (iTempQty = 0) and (iTempAlloc = 0) then
   exit ;
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
                  sTempLot,sTempType,sTempRef,dTempDate,dMoveDate,
                  iTempQty, iTempAlloc, iTempPackSize, fTempCost, rPO, iPalletID, iProductID, sOvers);
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
//      ParamByName('Store_Stock_Description').Asstring := sTempDesc;
//      ParamByName('Invoice_Upfront').AsString := sInvUpfront;
//      ParamByName('Sets_Per_Pad').AsInteger := iTempSetsInPad;
      ParamByName('Purchase_Order').Asfloat := rPO;
      ParamByName('Pallet_ID').Asinteger := iPalletID;
      ParamByName('Product_Id').Asinteger := iProductID;
      ParamByName('Stock_is_Overs').Asstring := sOvers;
     ExecSQL ;
     end;
    {Add a movement to the movement file} ;
    AddMovement(sTempPart, iTempStore, sTempBin ,sTempLot, sTempType, sTempRef, dMoveDate,iTempQty,
                        iTempAlloc, iTempPackSize, fTempCost, rPO, iPalletID, iProductID);
end;

procedure TSTStockDataMod.AddStoreStock(sTempPart: String; iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate,dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvupfront: string; itempSetsinpad: integer; rPO: real;
                                         iPalletID: integer; sOvers: string);
Var
  iTempNextStock, iProductID: Integer;
begin
{New procedure added to eventually replace the AddStock procedure, this includes adding the Store Stock Description}
{pra - 31/5/02}
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
     If (EOF = False) and (sOvers <> 'Y') then
        begin
        {Add the stock to an existing store stock record} ;
        iNewStoreStock := FieldByName('Store_Stock').AsInteger ;
        UpdStock(FieldByName('Store_Stock').AsInteger, sTempPart,iTempStore,sTempBin,
                  sTempLot,sTempType,sTempRef,dTempDate,dMoveDate,
                  iTempQty, iTempAlloc, iTempPackSize, fTempCost, rPO, iPalletID, iProductID, sOvers);
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
  With AddStoreStockSQL do
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
      ParamByName('Store_Stock_Description').Asstring := sTempDesc;
      ParamByName('Invoice_Upfront').AsString := sInvUpfront;
      ParamByName('Sets_Per_Pad').AsInteger := iTempSetsInPad;
      ParamByName('Purchase_Order').Asfloat := rPO;
      ParamByName('Pallet_ID').Asinteger := iPalletID;
      ParamByName('Product_Id').Asinteger := iProductID;
      ParamByName('Stock_is_Overs').Asstring := sOvers;
      ExecSQL ;
    end;
  {Add a movement to the movement file} ;
  AddMovement(sTempPart, iTempStore, sTempBin ,sTempLot, sTempType, sTempRef, dMoveDate,iTempQty,
                        iTempAlloc, iTempPackSize, fTempCost, rPO, iPalletID, iProductID);
end;

function TSTStockDataMod.AddandGetStoreStock(sTempPart: String; iTempStore: Integer; sTempBin, sTempLot, sTempType, sTempRef: String; dTempDate,dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvupfront: string; itempSetsinpad: integer; rPO: real;
                                         iPalletID: integer; sOvers: string): integer;
Var
iTempNextStock, iProductID: Integer;
begin
  {New procedure added to eventually replace the AddStock procedure, this includes adding the Store Stock Description}
  {pra - 31/5/02}
  result := 0;
If (iTempQty = 0) and (iTempAlloc = 0) then
   exit ;
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
                  sTempLot,sTempType,sTempRef,dTempDate,dMoveDate,
                  iTempQty, iTempAlloc, iTempPackSize, fTempCost, rPO, iPalletID, iProductID, sOvers);
        Result := iNewStoreStock;
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
iProductID := GetProductID(sTempPart);
With AddStoreStockSQL do
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
     ParamByName('Store_Stock_Description').Asstring := sTempDesc;
     ParamByName('Invoice_Upfront').AsString := sInvUpfront;
     ParamByName('Sets_Per_Pad').AsInteger := iTempSetsInPad;
     ParambyName('Purchase_Order').asfloat := rPO;
     ParamByName('Pallet_ID').Asinteger := iPalletID;
     ParamByName('Product_Id').Asinteger := iProductID;
     ParamByName('Stock_is_Overs').Asstring := sOvers;
     ExecSQL ;
     end;
  {Add a movement to the movement file} ;
  AddMovement(sTempPart, iTempStore, sTempBin ,sTempLot, sTempType, sTempRef, dMoveDate,iTempQty,
                        iTempAlloc, iTempPackSize, fTempCost, rPO, iPalletID, iProductID);
  Result := iTempNextStock;
end;

function TSTStockDataMod.GetNextLot(sTempPart: String): String;
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

procedure TSTStockDataMod.UpdStock(iTempCode: Integer; sTempPart: String; iTempStore: Integer; sTempBin,sTempLot, sTempType, sTempRef: String; dTempDate, dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; rPO: real; iPalletID, iProductID: integer; sOvers: string);
Var
bAllowNeg, bBins, bLots: ByteBool ;
iUpdQty, iQty: Integer ;
rUpdCost, rCost: Real ;
sNegBin, sNegLot: String ;
iSalesOrder: integer;
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
        AddMovement(sTempPart,iTempStore,sNegBin,sNegLot, 'R', sTempRef, dMoveDate, 0 - (iTempQty + iQty),
                        0, iTempPackSize, 0 - ((iTempQty / (iTempQty + iQty)) * fTempCost), rPO, iPalletID, iProductID);
        {Then move it back out again} ;
        AddMovement(sTempPart,iTempStore,sNegBin,sNegLot, sTempType, sTempRef, dMoveDate, iTempQty + iQty,
                        0, iTempPackSize, ((iTempQty / (iTempQty + iQty)) * fTempCost), rPO, iPalletID, iProductID);
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
           AddStock(sTempPart, iTempStore, sNegBin, sNegLot, sTempType, sTempRef, dTempDate,dMoveDate,
                                iTempQty, iTempAlloc, iTempPackSize, fTempCost, rPO, iPalletID, sOvers) ;
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
     ExecSQL ;
     end;
if (sTempType = 'D') and (iUpdQty <> 0) then
  begin
    iSalesOrder := strtoint(trim(copy(sTempRef,10,10)));
    with DelStockSNSQL do
      begin
        close;
        parambyname('Store_Stock').asinteger := iTempCode;
        parambyname('Sales_order').asinteger := iSalesOrder;
        execsql;
      end;
  end
else
if (sTempType = 'D') and (iUpdQty = 0) then
  begin
    iSalesOrder := strtoint(trim(copy(sTempRef,10,10)));
    with ResetStockSNSQL do
      begin
        close;
        parambyname('Store_Stock').asinteger := iTempCode;
        parambyname('Sales_order').asinteger := iSalesOrder;
        execsql;
      end;
  end;

With DelStockSQL do
     begin
     Close ;
     ParamByName('Store_Stock').AsInteger := iTempCode ;
     ExecSQL ;
     end;
AddMovement(sTempPart,iTempStore,sTempBin,sTempLot, sTempType, sTempRef, dMoveDate,iUpdQty,
                        iTempAlloc, iTempPackSize, rUpdCost, rPO, iPalletID, iProductID);
end;

procedure TSTStockDataMod.UpdStoreStock(iTempCode: Integer; sTempPart: String; iTempStore: Integer; sTempBin,sTempLot, sTempType, sTempRef: String; dTempDate, dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvUpfront: string; itempSetsinpad: integer; rPO: real;
                                         iPalletID, iProductID: integer; sOvers: string);
Var
bAllowNeg, bBins, bLots: ByteBool ;
iUpdQty, iQty: Integer ;
rUpdCost, rCost: Real ;
sNegBin, sNegLot: String ;
begin
{New procedure added to eventually replace the UpdStock procedure, this includes adding the Store Stock Description}
{pra - 31/5/02}
  if iProductID = 0 then
    iProductID := GetProductID(sTempPart);

  if iTempCode <> 0 then
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
  if (iTempQty >= 0) or (iQty + iTempQty >= 0)  then
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
        AddMovement(sTempPart,iTempStore,sNegBin,sNegLot, 'R', sTempRef, dMoveDate, 0 - (iTempQty + iQty),
                        0, iTempPackSize, 0 - ((iTempQty / (iTempQty + iQty)) * fTempCost), rPO, iPalletID, iProductID);
        {Then move it back out again} ;
        AddMovement(sTempPart,iTempStore,sNegBin,sNegLot, sTempType, sTempRef, dMoveDate, iTempQty + iQty,
                        0, iTempPackSize, ((iTempQty / (iTempQty + iQty)) * fTempCost), rPO, iPalletID, iProductID);
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
           AddStoreStock(sTempPart, iTempStore, sNegBin, sNegLot, sTempType, sTempRef, dTempDate, dMoveDate,
                                iTempQty, iTempAlloc, iTempPackSize, fTempCost, sTempDesc, sInvUpfront, iTempSetsInPad, rPO, iPalletID, sOvers) ;
           exit;
           end;
        end;
    end;

(*  if (sOvers = 'Y') then
    begin
      {} ;
      AddStoreStock(sTempPart, iTempStore, sTempBin, sTempLot, sTempType, sTempRef, dTempDate, dMoveDate,
                                iTempQty, iTempAlloc, iTempPackSize, fTempCost, sTempDesc, sInvUpfront, iTempSetsInPad, rPO, iPalletID, sOvers) ;
      exit;
    end;
*)

{Update a stock record, also check for zeroes (for deletions)} ;
  With UpdStockSQL do
     begin
     Close ;
     ParamByName('Store_Stock').AsInteger := iTempCode ;
     ParamByName('Store_Cost_Adj').AsFloat := rUpdCost ;
     ParamByName('Store_Quantity_Adj').AsInteger := iUpdQty ;
     ParamByName('Quantity_Allocated_Adj').AsInteger := iTempAlloc ;
     ExecSQL ;
     end;
  With DelStockSQL do
     begin
     Close ;
     ParamByName('Store_Stock').AsInteger := iTempCode ;
     ExecSQL ;
     end;
  AddMovement(sTempPart,iTempStore,sTempBin,sTempLot, sTempType, sTempRef, dMoveDate,iUpdQty,
                        iTempAlloc, iTempPackSize, rUpdCost, rPO, iPalletID, iProductID);
end;

Function TSTStockDataMod.CheckFreeStoreStock(iTempStore: Integer; sTempPart, sTempCanPick: String): Integer;
Var
iTempQty: Integer;
sTempComma: String ;
begin
{This checks stock availablity}
{Inputs are (in order):
{        Store code     - To allocate stock from}
{        Part code      - Pretty obvious}
{        It returns the free stock quantity} ;
{        The sFreeStockDets PUBLIC string has a description of and bins and lots found} ;
iTempQty := 0 ;
sFreeStockDets := '' ;
With GetFreeStoreStockSQL do
     begin
     SQL.clear;
     SQL.text := FreeStockSQL + 'ORDER BY Date_Received';
     Close ;
     ParamByName('Part_Store').AsInteger := iTempStore ;
     ParamByName('Part').AsString := sTempPart ;
     ParamByName('Pick_Only').AsString := sTempCanPick ;
     Open ;
     First ;
     While EOF = False do
           begin
           iTempQty := iTempQty + FieldByName('Store_Quantity').AsInteger -
                                  FieldByName('Quantity_Allocated').AsInteger ;
           If FieldByName('Store_Quantity').AsInteger -
                                  FieldByName('Quantity_Allocated').AsInteger > 0 then
                begin
                sTempComma := '' ;
                If FieldByName('Part_Bin').AsString <> '' then
                   begin
                   sFreeStockDets := sFreeStockDets + 'Bin:' + FieldByName('Part_Bin').AsString ;
                   sTempComma := ',' ;
                   end;
                If FieldByName('Part_Store_Lot').AsString <> '' then
                   begin
                   sFreeStockDets := sFreeStockDets + sTempComma + 'Lot:' +
                                  FieldByName('Part_Store_Lot').AsString ;
                   sTempComma := ',' ;
                   end;
                If sTempComma <> '' then
                   sFreeStockDets := sFreeStockDets + sTempComma + 'Qty:' +
                                  IntToStr(FieldByName('Store_Quantity').AsInteger -
                                  FieldByName('Quantity_Allocated').AsInteger)
                else
                   sFreeStockDets := sFreeStockDets + 'Store Qty:' +
                                  IntToStr(FieldByName('Store_Quantity').AsInteger -
                                  FieldByName('Quantity_Allocated').AsInteger) ;
                sFreeStockDets := sFreeStockDets + '.  ' ;
                end;
            Next ;
           end;
     end;
Result := iTempQty ;
end;

Function TSTStockDataMod.AllocStock(iTempStore: Integer; sTempPart: String; iTempItem: Integer;
                    iTempReqdQty, iTempType, iTempItemLine: Integer; sAllocBy, sBin: string): Integer;
Var
iTempQty, iTempQtyThisRec,iTempQtyNumbered, iTempQtyOvers, iTempQtyOversThisRec: Integer;
iTempNextAlloc: Integer;
sText: string;
bNumbered: boolean;
begin
{This function allocates stock.}
{Inputs are (in order):
{        Store code     - To allocate stock from}
{        Part code      - Pretty obvious}
{        Item           - Needs to be a job number or a sales order}
{        Quantity       - The quantity to allocate}
{        Alloc type     - 1 = Job, 2 = Store order}
{        Item line      - A store order line number ( if above item is 2}
if sAllocby = 'P' then
  sText := 'ORDER BY Invoice_upfront DESC, Date_Received'
else
if sAllocby = 'U' then
  sText := 'ORDER BY Invoice_upfront, Date_Received'
else
if sAllocby = 'B' then
  stext := 'AND (Store_Stock.Part_Bin = ''' + sBin + ''')'
else
  sText := 'ORDER BY Date_Received';

bNumbered := GetPartNumbered(sTempPart);

iTempQty := iTempReqdQty ;
iTempQtyNumbered := 0;
iTempQtyOvers := 0;

{Check what quantity of overs are associated with the sales order line}
with GetSalesOrderLineSQL do
  begin
    close;
    parambyname('Sales_order').asinteger := iTempItem;
    parambyname('Sales_order_line_no').asinteger := iTempItemLine;
    open;
    iTempQtyOvers := fieldbyname('Quantity_Overs').asinteger;
  end;

With GetFreeStoreStockSQL do
     begin
     SQL.clear;
     SQL.Text := FreeStockSQL + sText;
     Close ;
     ParamByName('Part_Store').AsInteger := iTempStore ;
     ParamByName('Part').AsString := sTempPart ;
     ParamByName('Pick_Only').AsString := 'Y' ;

     Open ;
     First ;
     While (EOF = False) and (iTempQty > 0) do
           begin
           {If this is a numbered product then get the store_stock record which the serial numbers have been allocated to}
           if bNumbered then
            begin
              iTempQtyNumbered := 0;
              GetStkSerialSQL.close;
              GetStkSerialSQL.Parambyname('Store_Stock').asinteger := GetFreeStoreStockSQL.fieldbyname('Store_stock').asinteger;
              GetStkSerialSQL.Parambyname('Sales_Order').asinteger := iTempItem;
              GetStkSerialSQL.Parambyname('Sales_Order_line_no').asinteger := iTempItemLine;
              GetStkSerialSQL.open;

              {if there are no serial numbers for this store_stock record then get next one}
              if GetStkSerialSQL.recordcount = 0 then
                begin
                  GetFreeStoreStockSQL.next;
                  continue;
                end
              else
                begin
                  while GetStkSerialSQL.eof <> true do
                    begin
                      if GetFreeStoreStockSQL.FieldByName('Sets_per_pad').asInteger = 0 then
                        iTempQtyNumbered := iTempQtyNumbered
                                    + strtoint64(GetStkSerialSQL.fieldbyname('serial_item_to').asstring)
                                    - strtoint64(GetStkSerialSQL.fieldbyname('serial_item_from').asstring)
                                    + 1
                      else
                        iTempQtyNumbered := iTempQtyNumbered
                                    + trunc((strtoint64(GetStkSerialSQL.fieldbyname('serial_item_to').asstring)
                                       - strtoint64(GetStkSerialSQL.fieldbyname('serial_item_from').asstring))/
                                       GetFreeStoreStockSQL.FieldByName('Sets_per_pad').asInteger)
                                    + 1;

                      GetStkSerialSQL.next;
                    end;
                end;
            end;
           if iTempQtyNumbered > 0 then
              iTempQtyThisRec := iTempQtyNumbered
            else
              iTempQtyThisRec :=  FieldByName('Store_Quantity').AsInteger -
                                  FieldByName('Quantity_Allocated').AsInteger;
           If iTempQtyThisRec > iTempQty then
                iTempQtyThisRec := iTempQty ;

          if iTempQtyOvers > 0 then
            begin
              if iTempQtyThisRec > iTempQtyOvers then
                iTempQtyOversThisRec := iTempQtyOvers
               else
                iTempQtyOversThisRec := iTempQtyThisRec;
            end
           else
            iTempQtyOversThisRec := 0;

           With GetNextAllocSQL do
                begin
                Close ;
                Open ;
                First ;
                If FieldByName('Last_Code').AsInteger = 0 then
                   iTempNextAlloc := 1
                else
                   iTempNextAlloc := FieldByName('Last_Code').AsInteger+1 ;
                end;
           With UpdStockSQL do
                begin
                Close ;
                ParamByName('Store_Stock').AsString := GetFreeStoreStockSQL.FieldByName('Store_Stock').AsString ;
                ParamByName('Store_Cost_Adj').AsFloat := 0 ;
                ParamByName('Store_Quantity_Adj').AsInteger := 0 ;
                ParamByName('Quantity_Allocated_Adj').AsInteger := iTempQtyThisRec ;
                ExecSQL ;
                end;
           With AddAllocSQL do
                begin
                Close ;
                ParamByName('Part_Store_Allocation').AsInteger := iTempNextAlloc ;
                ParamByName('Store_Stock').AsInteger := GetFreeStoreStockSQL.FieldByName('Store_Stock').AsInteger ;
                ParamByName('Quantity_Allocated').AsInteger := iTempQtyThisRec ;
                ParamByName('Quantity_Overs').AsInteger := iTempQtyOversThisRec ;
                ParamByName('Quantity_Over_Picked').AsInteger := 0 ;
                Case iTempType of
                     1:     begin
                            ParamByName('Sales_order').AsInteger := iTempItem ;
                            ParamByName('Sales_order_Line_no').AsInteger := iTempItemLine ;
                            ParamByName('Purch_Ord').Clear ;
                            ParamByName('Purch_Ord_Line_No').Clear ;
                            end;
                     2:     begin
                            ParamByName('Sales_order').Clear ;
                            ParamByName('Sales_order_Line_no').Clear ;
                            ParamByName('Purch_Ord').AsInteger := iTempItem ;
                            ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
                            end;
                     end;
                ParamByName('Part').Asstring := sTempPart ;
                ExecSQL ;
                end;
           iTempQty := iTempQty - iTempQtyThisRec ;
           iTempQtyOvers := iTempQtyOvers - iTempQtyOversThisRec;
           Next ;
           end;
     end;
If iTempType = 1 then
   begin
   {Add the quantity allocated into the allocated quantity on the sales order}
   {line} ;
   With UpdSalesOrderAllocSQL do
        begin
        Close ;
        ParamByName('Sales_Order').AsInteger := iTempItem ;
        ParamByName('Sales_order_Line_No').AsInteger := iTempItemLine ;
        ParamByName('Qty_Alloc').AsInteger := iTempReqdQty - iTempQty ;
        ExecSQL ;
        end;
   end;
If iTempType = 2 then
   begin
   {Add the quantity allocated into the allocated quantity on the store order}
   {line} ;
   With UpdSOAllocSQL do
        begin
        Close ;
        ParamByName('Purch_Ord').AsInteger := iTempItem ;
        ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
        ParamByName('Qty_Alloc').AsInteger := iTempReqdQty - iTempQty ;
        ExecSQL ;
        end;
   end;
 Result := iTempQty ;
end;

Function TSTStockDataMod.CheckFreeStock(iTempStore: Integer; sTempPart: String): Integer;
begin
{Set the last param to "N" to check all free stock whether pickable or not}
Result := CheckFreeStoreStock(iTempStore, sTempPart, 'N')
end;

Function TSTStockDataMod.CheckFreePickStock(iTempStore: Integer; sTempPart: String): Integer;
begin
{Set the last param to "Y" to check only pickable free stock}
Result := CheckFreeStoreStock(iTempStore, sTempPart, 'Y')
end;

procedure TSTStockDataMod.DeAllocStock(iTempItem: Integer;
                    iTempReqdQty, iTempType, iTempItemLine: Integer);
Var
iTempQty, iTempQtyThisRec, iTempQtyOversThisRec, iTempQtyOverPickedThisRec: Integer;
begin
{This function de-allocates stock.}
{Inputs are (in order):
{        Item           - Needs to be a Parts For Job Reference or a store order}
{        Quantity       - The quantity to de-allocate}
{        Alloc type     - 1 = Sales Order, 2 = Store order}
{        Item line      - A store order line number ( if above item is 2}
{NOTE:   You can set the quantity to a very big number to de-allocate everything} ;
iTempQty := iTempReqdQty ;
With GetAllocStockByRefSQL do
     begin
     Close ;
     Case iTempType of
          1:     begin
                 ParamByName('Sales_order').AsInteger := iTempItem ;
                 ParamByName('Sales_order_Line_no').AsInteger := iTempItemLine ;
                 ParamByName('Purch_Ord').Asinteger := 0 ;
                 ParamByName('Purch_Ord_Line_No').Clear ;
                 end;
          2:     begin
                 ParamByName('Sales_Order').Asinteger := 0 ;
                 ParamByName('Sales_order_Line_no').clear;
                 ParamByName('Purch_Ord').AsInteger := iTempItem ;
                 ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
                 end;
          end;
     Open ;
     Last ;
     While (BOF = False) and (iTempQty > 0) do
           begin
           iTempQtyThisRec := FieldByName('Quantity_Allocated').AsInteger ;
           iTempQtyOversThisRec := FieldByName('Quantity_Overs').AsInteger ;
           iTempQtyOverPickedThisRec := FieldByName('Quantity_Over_Picked').AsInteger ;
           If iTempQtyThisRec > iTempQty then
                begin
                {Only de-allocate part of the allocation record} ;
                iTempQtyThisRec := iTempQty ;
                With UpdAllocSQL do
                     begin
                     Close ;
                     ParamByName('Part_Store_Allocation').AsString := GetAllocStockByRefSQL.FieldByName('Part_Store_Allocation').AsString ;
                     ParamByName('Quantity_Allocated').AsInteger := 0 - iTempQtyThisRec ;
                     ParamByName('Quantity_Overs').AsInteger := 0 - iTempQtyOversThisRec ;
                     ParamByName('Quantity_Over_Picked').AsInteger := 0 - iTempQtyOverPickedThisRec ;
                     ExecSQL ;
                     end;
                end
           else
                begin
                With DelAllocSQL do
                     begin
                     {Delete the allocation record} ;
                     Close ;
                     ParamByName('Part_Store_Allocation').AsString := GetAllocStockByRefSQL.FieldByName('Part_Store_Allocation').AsString ;
                     ExecSQL ;
                     end;
                end;
           With GetStoreStockIntSQL do
                begin
                Close ;
                ParamByName('Store_Stock').AsString := GetAllocStockByRefSQL.FieldByName('Store_Stock').AsString ;
                Open ;
                First ;
                end;
                With UpdStockSQL do
                     begin
                     {Downdate the allocation on the store_stock record} ;
                     Close ;
                     ParamByName('Store_Stock').AsString := GetAllocStockByRefSQL.FieldByName('Store_Stock').AsString ;
                     ParamByName('Store_Cost_Adj').AsFloat := 0 ;
                     ParamByName('Store_Quantity_Adj').AsInteger := 0 ;
                     ParamByName('Quantity_Allocated_Adj').AsInteger := 0 - iTempQtyThisRec ;
                     ExecSQL ;
                     end;
                With DelStockSQL do
                     begin
                     {Delete an empty store_stock record} ;
                     Close ;
                     ParamByName('Store_Stock').AsString := GetAllocStockByRefSQL.FieldByName('Store_Stock').AsString ;
                     ExecSQL ;
                     end;
           iTempQty := iTempQty - iTempQtyThisRec ;
           Prior ;
           end;
     end;
If iTempType = 1 then
   begin
   {Remove the quantity allocated from the allocated quantity on the store order}
   {line} ;
   With UpdSalesOrderAllocSQL do
        begin
        Close ;
        ParamByName('Sales_Order').AsInteger := iTempItem ;
        ParamByName('Sales_order_Line_No').AsInteger := iTempItemLine ;
        ParamByName('Qty_Alloc').AsInteger := 0 - (iTempReqdQty - iTempQty) ;
        ExecSQL ;
        end;
   end;
If iTempType = 2 then
   begin
   {Remove the quantity allocated from the allocated quantity on the store order}
   {line} ;
   With UpdSOAllocSQL do
        begin
        Close ;
        ParamByName('Purch_Ord').AsInteger := iTempItem ;
        ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
        ParamByName('Qty_Alloc').AsInteger := 0 - (iTempReqdQty - iTempQty) ;
        ExecSQL ;
        end;
   end;
end;

procedure TSTStockDataMod.DeAllocForwardStock(iStoreStock, iTempItem: Integer;
                    iTempReqdQty, iTempType, iTempItemLine: Integer);
var
  iTempQty, iTempQtyThisRec, iTempQtyOversThisRec, iTempQtyOverPickedThisRec: Integer;
begin
{This function de-allocates stock.}
{Inputs are (in order):
{        Item           - Needs to be a Parts For Job Reference or a store order}
{        Quantity       - The quantity to de-allocate}
{        Alloc type     - 1 = Sales Order, 2 = Store order}
{        Item line      - A store order line number ( if above item is 2}
{NOTE:   You can set the quantity to a very big number to de-allocate everything} ;
  iTempQty := iTempReqdQty ;
  with GetAllocStockByStoreStockSQL do
    begin
      close ;
      ParamByName('Store_Stock').AsInteger := iStoreStock;
      open;

      if recordcount = 0 then
        exit;

      iTempQtyThisRec := FieldByName('Quantity_Allocated').AsInteger ;
      iTempQtyOversThisRec := FieldByName('Quantity_Overs').AsInteger ;
      iTempQtyOverPickedThisRec := FieldByName('Quantity_Over_Picked').AsInteger ;
      if iTempQtyThisRec > iTempQty then
        begin
          {Only de-allocate part of the allocation record} ;
          iTempQtyThisRec := iTempQty ;
          with UpdAllocSQL do
            begin
              Close ;
              ParamByName('Part_Store_Allocation').AsString := GetAllocStockByStoreStockSQL.FieldByName('Part_Store_Allocation').AsString ;
              ParamByName('Quantity_Allocated').AsInteger := 0 - iTempQtyThisRec ;
              ParamByName('Quantity_Overs').AsInteger := 0 - iTempQtyOversThisRec ;
              ParamByName('Quantity_Over_Picked').AsInteger := 0 - iTempQtyOverPickedThisRec ;
              ExecSQL ;
            end;
        end
      else
        begin
          with DelAllocSQL do
            begin
              {Delete the allocation record} ;
              close ;
              ParamByName('Part_Store_Allocation').AsString := GetAllocStockByStoreStockSQL.FieldByName('Part_Store_Allocation').AsString ;
              ExecSQL ;
            end;
        end;

      with GetStoreStockIntSQL do
        begin
          close ;
          paramByName('Store_Stock').AsString := GetAllocStockByStoreStockSQL.FieldByName('Store_Stock').AsString ;
          open ;
          first ;
        end;

      with UpdStockSQL do
        begin
          {Downdate the allocation on the store_stock record} ;
          Close ;
          ParamByName('Store_Stock').AsString := GetAllocStockByStoreStockSQL.FieldByName('Store_Stock').AsString ;
          ParamByName('Store_Cost_Adj').AsFloat := 0 ;
//        ParamByName('Store_Quantity_Adj').AsInteger := (iTempQtyOversThisRec + iTempQtyOverPickedThisRec);
          ParamByName('Store_Quantity_Adj').AsInteger := 0;
          ParamByName('Quantity_Allocated_Adj').AsInteger := 0 - iTempQtyThisRec ;
          ExecSQL ;
        end;

      with DelStockSQL do
        begin
          {Delete an empty store_stock record} ;
          close ;
          ParamByName('Store_Stock').AsString := GetAllocStockByStoreStockSQL.FieldByName('Store_Stock').AsString ;
          ExecSQL ;
        end;

      iTempQty := iTempQty - iTempQtyThisRec ;
    end;

  if iTempType = 1 then
    begin
      {Remove the quantity allocated from the allocated quantity on the store order}
      {line} ;
      with UpdSalesOrderAllocSQL do
        begin
          Close ;
          ParamByName('Sales_Order').AsInteger := iTempItem ;
          ParamByName('Sales_order_Line_No').AsInteger := iTempItemLine ;
          ParamByName('Qty_Alloc').AsInteger := 0 - (iTempReqdQty - iTempQty) ;
          ExecSQL ;
        end;
    end;

  if iTempType = 2 then
    begin
      {Remove the quantity allocated from the allocated quantity on the store order}
      {line} ;
      with UpdSOAllocSQL do
        begin
          Close ;
          ParamByName('Purch_Ord').AsInteger := iTempItem ;
          ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
          ParamByName('Qty_Alloc').AsInteger := 0 - (iTempReqdQty - iTempQty) ;
          ExecSQL ;
        end;
    end;
end;

procedure TSTStockDataMod.DeAllocProductionStock(iTempItem: Integer;
                    iTempReqdQty, iTempType, iTempItemLine: Integer);
Var
iTempQty, iTempQtyThisRec, iTempQtyOversThisRec, iTempQtyOverPickedThisRec: Integer;
begin
{This function de-allocates stock.}
{Inputs are (in order):
{        Item           - Needs to be a Parts For Job Reference or a store order}
{        Quantity       - The quantity to de-allocate}
{        Alloc type     - 1 = Sales Order, 2 = Store order}
{        Item line      - A store order line number ( if above item is 2}
{NOTE:   You can set the quantity to a very big number to de-allocate everything} ;
iTempQty := iTempReqdQty ;
With GetAllocStockByRefSQL do
     begin
     Close ;
     Case iTempType of
          1:     begin
                 ParamByName('Sales_order').AsInteger := iTempItem ;
                 ParamByName('Sales_order_Line_no').AsInteger := iTempItemLine ;
                 ParamByName('Purch_Ord').Asinteger := 0 ;
                 ParamByName('Purch_Ord_Line_No').Clear ;
                 end;
          2:     begin
                 ParamByName('Sales_Order').Asinteger := 0 ;
                 ParamByName('Sales_order_Line_no').clear;
                 ParamByName('Purch_Ord').AsInteger := iTempItem ;
                 ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
                 end;
          end;
     Open ;
     Last ;
     While (BOF = False) and (iTempQty > 0) do
           begin
           iTempQtyThisRec := FieldByName('Quantity_Allocated').AsInteger ;
           iTempQtyOversThisRec := FieldByName('Quantity_Overs').AsInteger ;
           iTempQtyOverPickedThisRec := FieldByName('Quantity_Over_Picked').AsInteger ;
           If iTempQtyThisRec > iTempQty then
                begin
                {Only de-allocate part of the allocation record} ;
                iTempQtyThisRec := iTempQty ;
                With UpdAllocSQL do
                     begin
                     Close ;
                     ParamByName('Part_Store_Allocation').AsString := GetAllocStockByRefSQL.FieldByName('Part_Store_Allocation').AsString ;
                     ParamByName('Quantity_Allocated').AsInteger := 0 - iTempQtyThisRec ;
                     ParamByName('Quantity_Overs').AsInteger := 0 - iTempQtyOversThisRec ;
                     ParamByName('Quantity_Over_Picked').AsInteger := 0 - iTempQtyOverPickedThisRec ;
                     ExecSQL ;
                     end;
                end
           else
                begin
                With DelAllocSQL do
                     begin
                     {Delete the allocation record} ;
                     Close ;
                     ParamByName('Part_Store_Allocation').AsString := GetAllocStockByRefSQL.FieldByName('Part_Store_Allocation').AsString ;
                     ExecSQL ;
                     end;
                end;
           With GetStoreStockIntSQL do
                begin
                Close ;
                ParamByName('Store_Stock').AsString := GetAllocStockByRefSQL.FieldByName('Store_Stock').AsString ;
                Open ;
                First ;
                end;
                With UpdStockSQL do
                     begin
                     {Downdate the allocation on the store_stock record} ;
                     Close ;
                     ParamByName('Store_Stock').AsString := GetAllocStockByRefSQL.FieldByName('Store_Stock').AsString ;
                     ParamByName('Store_Cost_Adj').AsFloat := 0 ;
//                     ParamByName('Store_Quantity_Adj').AsInteger := (iTempQtyOversThisRec + iTempQtyOverPickedThisRec);
                     ParamByName('Store_Quantity_Adj').AsInteger := 0;
                     ParamByName('Quantity_Allocated_Adj').AsInteger := 0 - iTempQtyThisRec ;
                     ExecSQL ;
                     end;
                With DelStockSQL do
                     begin
                     {Delete an empty store_stock record} ;
                     Close ;
                     ParamByName('Store_Stock').AsString := GetAllocStockByRefSQL.FieldByName('Store_Stock').AsString ;
                     ExecSQL ;
                     end;
           iTempQty := iTempQty - iTempQtyThisRec ;
           Prior ;
           end;
     end;
If iTempType = 1 then
   begin
   {Remove the quantity allocated from the allocated quantity on the store order}
   {line} ;
   With UpdSalesOrderAllocSQL do
        begin
        Close ;
        ParamByName('Sales_Order').AsInteger := iTempItem ;
        ParamByName('Sales_order_Line_No').AsInteger := iTempItemLine ;
        ParamByName('Qty_Alloc').AsInteger := 0 - (iTempReqdQty - iTempQty) ;
        ExecSQL ;
        end;
   end;
If iTempType = 2 then
   begin
   {Remove the quantity allocated from the allocated quantity on the store order}
   {line} ;
   With UpdSOAllocSQL do
        begin
        Close ;
        ParamByName('Purch_Ord').AsInteger := iTempItem ;
        ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
        ParamByName('Qty_Alloc').AsInteger := 0 - (iTempReqdQty - iTempQty) ;
        ExecSQL ;
        end;
   end;
end;

procedure TSTStockDataMod.DeAllocWasteStock(iTempItem: Integer;
                    iTempReqdQty, iTempType, iTempItemLine: Integer);
Var
iTempQty, iTempQtyThisRec, iTempQtyOversThisRec, iTempQtyOverPickedThisRec: Integer;
begin
{This function de-allocates stock.}
{Inputs are (in order):
{        Item           - Needs to be a Parts For Job Reference or a store order}
{        Quantity       - The quantity to de-allocate}
{        Alloc type     - 1 = Sales Order, 2 = Store order}
{        Item line      - A store order line number ( if above item is 2}
{NOTE:   You can set the quantity to a very big number to de-allocate everything} ;
iTempQty := iTempReqdQty ;
With GetAllocStockByRefSQL do
     begin
     Close ;
     Case iTempType of
          1:     begin
                 ParamByName('Sales_order').AsInteger := iTempItem ;
                 ParamByName('Sales_order_Line_no').AsInteger := iTempItemLine ;
                 ParamByName('Purch_Ord').Asinteger := 0 ;
                 ParamByName('Purch_Ord_Line_No').Clear ;
                 end;
          2:     begin
                 ParamByName('Sales_Order').Asinteger := 0 ;
                 ParamByName('Sales_order_Line_no').clear;
                 ParamByName('Purch_Ord').AsInteger := iTempItem ;
                 ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
                 end;
          end;
     Open ;
     Last ;
     While (BOF = False) and (iTempQty > 0) do
           begin
           iTempQtyThisRec := FieldByName('Quantity_Allocated').AsInteger ;
           iTempQtyOversThisRec := FieldByName('Quantity_Overs').AsInteger ;
           iTempQtyOverPickedThisRec := FieldByName('Quantity_Over_Picked').AsInteger ;
           If iTempQtyThisRec > iTempQty then
                begin
                {Only de-allocate part of the allocation record} ;
                iTempQtyThisRec := iTempQty ;
                With UpdAllocSQL do
                     begin
                     Close ;
                     ParamByName('Part_Store_Allocation').AsString := GetAllocStockByRefSQL.FieldByName('Part_Store_Allocation').AsString ;
                     ParamByName('Quantity_Allocated').AsInteger := 0 - iTempQtyThisRec ;
                     ParamByName('Quantity_Overs').AsInteger := 0 - iTempQtyThisRec ;
                     ParamByName('Quantity_Over_Picked').AsInteger := 0;
                     ExecSQL ;
                     end;
                end
           else
                begin
                With DelAllocSQL do
                     begin
                     {Delete the allocation record} ;
                     Close ;
                     ParamByName('Part_Store_Allocation').AsString := GetAllocStockByRefSQL.FieldByName('Part_Store_Allocation').AsString ;
                     ExecSQL ;
                     end;
                end;
           With GetStoreStockIntSQL do
                begin
                Close ;
                ParamByName('Store_Stock').AsString := GetAllocStockByRefSQL.FieldByName('Store_Stock').AsString ;
                Open ;
                First ;
                end;
                With UpdStockSQL do
                     begin
                     {Downdate the allocation on the store_stock record} ;
                     Close ;
                     ParamByName('Store_Stock').AsString := GetAllocStockByRefSQL.FieldByName('Store_Stock').AsString ;
                     ParamByName('Store_Cost_Adj').AsFloat := 0 ;
//                     ParamByName('Store_Quantity_Adj').AsInteger := (iTempQtyOversThisRec + iTempQtyOverPickedThisRec);
                     ParamByName('Store_Quantity_Adj').AsInteger := 0;
                     ParamByName('Quantity_Allocated_Adj').AsInteger := 0 - iTempQtyThisRec ;
                     ExecSQL ;
                     end;
                With DelStockSQL do
                     begin
                     {Delete an empty store_stock record} ;
                     Close ;
                     ParamByName('Store_Stock').AsString := GetAllocStockByRefSQL.FieldByName('Store_Stock').AsString ;
                     ExecSQL ;
                     end;
           iTempQty := iTempQty - iTempQtyThisRec ;
           Prior ;
           end;
     end;
If iTempType = 1 then
   begin
   {Remove the quantity allocated from the allocated quantity on the store order}
   {line} ;
   With UpdSalesOrderAllocSQL do
        begin
        Close ;
        ParamByName('Sales_Order').AsInteger := iTempItem ;
        ParamByName('Sales_order_Line_No').AsInteger := iTempItemLine ;
        ParamByName('Qty_Alloc').AsInteger := 0 - (iTempReqdQty - iTempQty) ;
        ExecSQL ;
        end;
   end;
If iTempType = 2 then
   begin
   {Remove the quantity allocated from the allocated quantity on the store order}
   {line} ;
   With UpdSOAllocSQL do
        begin
        Close ;
        ParamByName('Purch_Ord').AsInteger := iTempItem ;
        ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
        ParamByName('Qty_Alloc').AsInteger := 0 - (iTempReqdQty - iTempQty) ;
        ExecSQL ;
        end;
   end;
end;


procedure TSTStockDataMod.AddJobBagReturn(iStoreStock, iQuantity, iJobBag: integer; sPart: string);
var
  iReturn: integer;
begin
  with qryGetJobBagRtn do
    begin
      close;
      open;
      iReturn := fieldbyname('Last_Return').asinteger;
    end;

  with qryAddJobBagRtn do
    begin
      close;
      parambyname('Job_Bag_Return').asinteger := iReturn + 1;
      parambyname('Job_Bag').asinteger := iJobBag;
      if istorestock = 0 then
        parambyname('Store_Stock').clear
      else
        parambyname('Store_Stock').asinteger := istorestock;
      parambyname('Quantity').asinteger := iQuantity;
      parambyname('Part').asstring := sPart;
      execsql;
    end;
end;


procedure TSTStockDataMod.AddStockTransfer(sStoreLot, sPart: String; iSalesOrder, iPO: Integer; iStoreFrom: Integer; sBin: String;
          iStore, iOrderLine, iQuantity, iTempPackSize: integer; dDate: TDateTime; rCost: real; iTempStoreStock: integer; bInvUpfront: boolean);
var
  iCode: integer;
begin
  {Don't update if transfer qty is zero}
  if iQuantity = 0 then exit;

  {Get the next Part Transfer code}
  with NextTransfer do
    begin
      close;
      open;
      first;
      iCode:= fieldbyname('Max_Part_Transfer').asInteger;
    end;

  {Update the Part Transfer table}
  with AddTransferSQL do
    begin
      close;
      parambyname('Part_Transfer').asInteger := iCode + 1;
      If sStoreLot <> '' then
         parambyname('Part_Store_lot').asstring := sStoreLot
      else
         parambyname('Part_Store_lot').clear ;
      parambyname('Part').asstring := sPart;

      if iSalesOrder = 0 then
        begin
        parambyname('Sales_order').clear;
        parambyname('Sales_order_line_no').clear;
        end
      else
        begin
        parambyname('Sales_order').AsInteger := isalesOrder;
        parambyname('Sales_order_line_no').AsInteger := iOrderLine;
        end;

      if iPO = 0 then
        begin
        parambyname('Purch_ord').clear;
        parambyname('Purch_Ord_Line_No').clear;
        end
      else
        begin
        parambyname('Purch_ord').AsInteger := iPO;
        parambyname('Purch_Ord_Line_No').asinteger := iOrderLine;
        end;

      parambyname('Part_Store_from').AsInteger := iStoreFrom;
      parambyname('Store_Quantity').asinteger := iQuantity;
      parambyname('Date_Received').asdatetime := dDate;
      parambyname('Store_Cost').asfloat := rCost;
      If sBin <> '' then
         parambyname('Part_Bin').asstring := sBin
      else
         parambyname('Part_Bin').clear ;
      parambyname('Part_Store').AsInteger := iStore;
      parambyname('Stock_Pack_Quantity').AsInteger := iTempPackSize;
      parambyname('Store_stock').AsInteger := iTempStoreStock;
      if bInvUpFront then
        parambyname('Invoice_Upfront').asstring := 'Y'
      else
        parambyname('Invoice_Upfront').asstring := 'N';
      execsql;
    end;
end;

Procedure TSTStockDataMod.AllocStoreStock(iTempStoreStock, iTempItem: Integer;
                    iTempReqdQty, iTempType, iTempItemLine: Integer; iTempOvers, iTempOverPicked: integer);
Var
  iTempNextAlloc: Integer;
  sTempPart: string;
begin
{This function allocates stock from a specific store stock item} ;
{Inputs (in order) are:    } ;
{       StoreStock  -   The unique code from the store stock record} ;
{       Item        -   A PFJ code for a job or a store order code} ;
{       Quantity    -   The quantity to allocate} ;
{       Alloc Type  -   1=Job, 2=Store Order} ;
{       Order Line  -   For alloc type 2's this is the order line} ;
With GetNextAllocSQL do
     begin
     Close ;
     Open ;
     First ;
     iTempNextAlloc := FieldByName('Last_Code').AsInteger + 1 ;
     end;

  if iTempType = 1 then
    begin
      with GetSalesOrderLineSQL do
        begin
          close;
          parambyname('Sales_Order').asinteger := iTempItem;
          parambyname('Sales_Order_line_no').asinteger := iTempItemLine;
          open;
          sTempPart := fieldbyname('Part').asstring;
        end;
    end
  else
    sTempPart := '';

With AddAllocSQL do
     begin
     Close ;
     ParamByName('Part_Store_Allocation').AsInteger := iTempNextAlloc ;
     ParamByName('Store_Stock').AsInteger := iTempStoreStock ;
     ParamByName('Quantity_Allocated').AsInteger := iTempReqdQty ;
     ParamByName('Quantity_Overs').AsInteger := iTempOvers ;
     ParamByName('Quantity_Over_Picked').AsInteger := iTempOverPicked ;
     Case iTempType of
          1:     begin
                 ParamByName('Sales_order').AsInteger := iTempItem ;
                 ParamByName('Sales_order_line_no').AsInteger := iTempItemLine ;
                 ParamByName('Purch_Ord').Clear ;
                 ParamByName('Purch_Ord_Line_No').Clear ;
                 end;
          2:     begin
                 ParamByName('Sales_order').Clear ;
                 ParamByName('Sales_order_line_no').clear ;
                 ParamByName('Purch_Ord').AsInteger := iTempItem ;
                 ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
                 end;
          end;
     ParamByName('Part').Asstring := sTempPart ;
     ExecSQL ;
     end;
With UpdStockSQL do
     begin
     Close ;
     ParamByName('Store_Stock').AsInteger := iTempStoreStock ;
     ParamByName('Store_Cost_Adj').AsFloat := 0 ;
     ParamByName('Store_Quantity_Adj').AsInteger := 0 ;
     ParamByName('Quantity_Allocated_Adj').AsInteger := iTempReqdQty;
     ExecSQL ;
     end;
If iTempType = 1 then
   begin
   {Add the quantity allocated into the allocated quantity on the sales order}
   {line} ;
   With UpdSalesOrderAllocSQL do
        begin
        Close ;
        ParamByName('Sales_Order').AsInteger := iTempItem ;
        ParamByName('Sales_order_Line_No').AsInteger := iTempItemLine ;
        ParamByName('Qty_Alloc').AsInteger := iTempReqdQty ;
        ExecSQL ;
        end;
   end;
If iTempType = 2 then
   begin
   {Add the quantity allocated into the allocated quantity on the store order}
   {line} ;
   With UpdSOAllocSQL do
        begin
        Close ;
        ParamByName('Purch_Ord').AsInteger := iTempItem ;
        ParamByName('Purch_Ord_Line_No').AsInteger := iTempItemLine ;
        ParamByName('Qty_Alloc').AsInteger := iTempReqdQty ;
        ExecSQL ;
        end;
   end;
end;

procedure TSTStockDataMod.DataModuleCreate(Sender: TObject);
begin
bPrintOnAudit := False ;
end;

Function TSTStockDataMod.GetDefaultStore(Sender: TObject): Integer;
Var
iTempPartStore: Integer;
begin
{This function looks for a default Part Store (as opposed to a Van)} ;
{If there is 1 non-van part store it returns the code for the store}
{otherwise it returns ""} ;
Result := 0 ;
With GetDefPartStoreSQL do
     begin
     Close ;
     Open ;
     First ;
     If not EOF then
        begin
        iTempPartStore := FieldByName('Part_Store').AsInteger ;
        Next ;
        If EOF then
           Result := iTempPartStore ;
        end;
     end;
end;

Function TSTStockDataMod.GetNextIntSelCode(Sender: TObject): Integer;
Var
iIntSelCode: Integer ;
begin
{Get the next int_sel_code to use} ;
With GetLastIntSelSQL do
     begin
     Close ;
     Open ;
     First;
     iIntSelCode := FieldByName('Last_Code').AsInteger + 1 ;
     end;
{Reserve it on the int_sel file} ;
With AddWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iIntSelCode ;
     ParamByName('Text100').AsString := ' ' ;
     ExecSQL ;
     end;
Result := iIntSelCode ;
end;

Procedure TSTStockDataMod.DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
begin
{Delete ALL entries on the workfile for the int_sel_code} ;
With DelWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
     ExecSQL ;
     end;
{Add the reserving one back in} ;
If not bTempDelCode then
     begin
     With AddWorkSQL do
          begin
          Close ;
          ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
          ParamByName('Text100').AsString := ' ' ;
          ExecSQL ;
          end;
     end;
end;

function TSTStockDataMod.GetPartNumbered(TempPart: string): Boolean;
begin
  with GetPartSQL do
    begin
      close;
      parambyname('Part').asstring := tempPart;
      open;
      Result := (fieldbyname('Numbered').asstring = 'Y');
    end;
end;

procedure TSTStockDataMod.UpdStoreStockBin(iTempCode: integer;
  sTempBin: string);
begin
  with qryUpdStockBin do
    begin
      close;
      parambyname('Store_Stock').asinteger := iTempCode;
      parambyname('Part_Bin').asstring := sTempBin;
      execsql;
    end;
end;

function TSTStockDataMod.GetProductID(sTempPart: string): integer;
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

function TSTStockDataMod.CreateSalesOrder(iTempCode: Integer; sTempPart: String; iTempStore: Integer; sTempBin,sTempLot, sTempType, sTempRef: String; dTempDate, dMoveDate: TDateTime;
                                         iTempQty, iTempAlloc, iTempPackSize: Integer; fTempCost: Real; sTempDesc, sInvUpfront: string; itempSetsinpad: integer; rPO: real;
                                         iPalletID, iProductID: integer; sOvers: string; JobBag: integer): integer;
var
  Customer, BranchNo, Contact, OfficeContact, Rep, AccountTeam: integer;
  SONumber, ProductionLocation: integer;
  PartCost, SellPrice: real;
  PurchPackQuantity, SellPackQuantity, VatCode: integer;
  CustOrderNo: string;
begin
  result := 0;
  {Get the Job Bag to find the customer details}
  with qryGetJobBag do
    begin
      close;
      parambyname('Job_bag').asinteger := JobBag;
      open;

      if recordcount > 0 then
        begin
          Customer := fieldbyname('Customer').asinteger;
          BranchNo := fieldbyname('Branch_no').asinteger;
          Contact := fieldbyname('Contact_no').asinteger;
          OfficeContact := fieldbyname('Office_Contact').asinteger;
          Rep := fieldbyname('Rep').asinteger;
          CustOrderNo := fieldbyname('Cust_Order_No').asstring;
          AccountTeam := fieldbyname('Account_Team').asinteger;
        end
      else
        exit;
    end;

  {Get the Production Location based on the Bin Code}
  with qryGetBin do
    begin
      close;
      parambyname('Part_Bin').asstring := sTempBin;
      open;

      if recordcount > 0 then
        ProductionLocation := fieldbyname('Production_Location').asinteger
      else
        exit;
    end;

  {Get the Part details}
  with qryGetPart do
    begin
      close;
      parambyname('Part').asstring := sTempPart;
      open;
      if recordcount > 0 then
        begin
          PartCost := fieldbyname('Part_Purchase_Price').asfloat;
          PurchPackQuantity := fieldbyname('Purch_pack_Quantity').asinteger;
          SellPrice := fieldbyname('Part_Cost_Cat').asfloat;
          SellPackQuantity := fieldbyname('Sell_pack_Quantity').asinteger;
          VatCode := fieldbyname('Vat_Code').asinteger;
        end
      else
        exit;
    end;

  {Add the Sales Order Header}
  SONumber := GetNextSONumber;
  with qryAddSO do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Office_Contact').AsInteger := OfficeContact;

      ParambyName('Account_Team').asinteger := AccountTeam;
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      ParamByName('Date_Reqd').AsDateTime := date;
      ParamByName('Date_Ordrd').AsDateTime := date;
      ParamByName('Cust_Order_No').AsString := CustOrderNo;

      ParamByName('Delivery_Contact_Name').Asstring := '';
      ParamByName('Customer').AsInteger := Customer;
      ParamByName('Branch_No').AsInteger := BranchNo;

      ParamByName('Cost_Centre').clear;
      ParamByName('Customer0').clear;

      ParamByName('Ad_Hoc_Address').clear;

      ParamByName('Production_Location').AsInteger := ProductionLocation;

      Parambyname('Cash_Sales').asstring := 'N';
      Parambyname('inactive').asstring := 'N';

      ParamByName('Order_Type').AsString := 'J';

      ParamByName('Sales_Order_Head_Status').AsInteger := 10;

      ParamByName('Narrative').Clear;
      ParamByName('Contact_No').AsInteger := Contact;
      ParamByName('Delivery_Notes').Asstring := '';
      ParamByName('Delivery_Customer').Asinteger := 0;
      ParamByName('Delivery_Branch').Asinteger := 0;

      Parambyname('Replenish_source').asinteger := 2;
      parambyname('Part_Store').asinteger := iTempStore;
      Parambyname('Supplier').clear;
      Parambyname('Branch_no0').clear;
      Parambyname('Supp_Order_type').clear;
      ExecSQL;
  end;

  {Add the Rep associated with this order}
  with qryAddSORep do
    begin
      close;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Rep').AsInteger := Rep;
      ParamByName('Rep_Percentage').Asinteger := 0;
      execsql;
    end;

  {Now add the one line}
  with qryAddSOLine do
    begin
      close;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Line').AsInteger := 1;
      ParamByName('Part').AsString := sTempPart;
      ParamByName('Part_Cost').AsFloat := PartCost;
      ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;
      ParamByName('Part_Sales_Price').AsFloat := SellPrice;
      ParamByName('Sell_Pack_Quantity').AsInteger := SellPackQuantity;
      ParamByName('Quantity_Ordered').AsInteger := iTempQty;
      ParambyName('Quantity_Overs').asinteger := 0;
      Parambyname('Line_iS_sample').asstring := 'N';

      ParamByName('Quantity_Allocated').AsInteger := 0;
      ParamByName('Quantity_Delivered').AsInteger := 0;
      ParamByName('Contract').Clear;
      ParamByName('Contract_Line_No').Clear;
      ParamByName('Sales_Order_Line_Status').AsInteger := 10;
      ParamByName('Quantity_Invoiced').AsInteger := 0;
      ParamByName('Discount_Type').asString := '';
      ParamByName('Discount_Value').asFloat := 0.00;
      ParamByName('Vat_Code').asinteger := VatCode;
      ParambyName('Original_Sell_Price').asfloat := SellPrice;
      ParamByName('Markup_Type').clear;
      ParamByName('Markup_Value').asfloat := 0.00;
      ExecSQL;
  end;

  {Now add the the order into the Job Bag Request table}
  with qryAddJobBagRequest do
    begin
      close;
      parambyname('Job_bag').asinteger := JobBag;
      parambyname('Sales_Order').asinteger := SONumber;
      parambyname('Sales_order_line_no').asinteger := 1;
      execsql;
    end;
  result := SONumber;
end;

procedure TSTStockDataMod.AllocateSalesOrder(SONumber: integer; tempStore: integer; tempBin: string);
var
  iTempQty: integer;
begin
  {Update the Bin to allow Picking}
  UpdateBinPickStatus(tempStore, tempBin, 'Y');

  try
    with qryGetSalesOrderLines do
      begin
        close;
        parambyname('Sales_Order').asinteger := SONumber;
        open;
        while EOF <> true do
          begin
            iTempQty := (fieldbyname('Quantity_Ordered').asinteger + fieldbyname('Quantity_Overs').asinteger - fieldbyname('Quantity_Delivered').asinteger - fieldbyname('Quantity_Allocated').asinteger);
            {allocate as much stock as required/available} ;
            if iTempQty <= STStockDataMod.CheckFreePickStock(fieldbyname('Part_Store').asinteger, fieldbyname('Part').asstring) then
              begin
                {Actually do the stock allocation} ;
                STStockDataMod.AllocStock(fieldbyname('Part_Store').asinteger, fieldbyname('Part').asstring, SONumber, iTempQty, 1, fieldbyname('Sales_Order_line_no').asinteger, 'B',tempBin) ;
              end
            else
              begin
                STStockDataMod.AllocStock(fieldbyname('Part_Store').asinteger, fieldbyname('Part').asstring, SONumber,
                STStockDataMod.CheckFreePickStock(fieldbyname('Part_Store').asinteger, fieldbyname('Part').asstring), 1, fieldbyname('Sales_Order_line_no').asinteger,  'B',tempBin) ;
              end;
            next;
          end;
      end;
    UpdateSOStatus(SONumber, 50);
  finally
    {Update the Bin to NOT allow Picking}
    UpdateBinPickStatus(tempStore, tempBin, 'N');
   end;
end;

procedure TSTStockDataMod.UpdateBinPickStatus(iPartStore: integer; sBin, sPicking: string);
begin
  with qryUpdPartStoreBin do
    begin
      close;
      parambyname('Part_Store').asinteger := iPartStore;
      parambyname('Part_bin').asstring := sBin;
      parambyname('Bin_Can_Pick').asstring := sPicking;
      execsql;
    end;
end;

procedure TSTStockDataMod.CreateDeliveryNote(SONumber: integer);
begin
  {Add the Delivery Note header}
  with qryAddSODelivNote do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Sales_Order_Deliv').AsInteger := 1;
      ParamByName('Del_Dt').AsDateTime := date;
      ParamByName('Desp_Note_No').AsString := IntToStr(SONumber) + '01';
      ParamByName('Delivery_Instructions').asstring := '';
      ParamByName('Del_Type').clear;
      ParamByname('Courier').clear;
      ExecSQL;
    end;

  with qryGetSalesOrderLines do
    begin
      close;
      parambyname('Sales_order').asinteger := SONumber;
      open;

      while eof <> true do
        begin
          qryAddSODelivLine.Close;
          qryAddSODelivLine.ParamByName('Sales_Order').AsInteger := SONumber;
          qryAddSODelivLine.ParamByName('Sales_order_Line_No').AsInteger := fieldbyname('Sales_Order_line_no').asinteger;
          qryAddSODelivLine.ParamByName('Sales_Order_Deliv').AsInteger := 1;
          qryAddSODelivLine.ExecSQL;
          next;
        end;
    end;
  UpdateSOStatus(SONumber, 100);
end;

procedure TSTStockDataMod.ConfirmPicking(SONumber: integer);
begin
  SalesOrderNo := SONumber;
  isSalesOrder := true;
  toDestroy := false;

  stPickDM := TstpickDm.Create(self);
  PickingList := TPickingList.Create(stPickDM);
  try
//    ForwardStock; {Check whether the location for this order is forward stock}

    with qryGetPickNote do
      begin
        close;
        parambyname('Sales_order').asinteger := SONumber;
        open;

        if recordcount > 0 then
          pickingList.PickingListRef := inttostr(fieldbyname('Sales_Order_Picking').asinteger)
        else
          exit;
      end;

    stPickDM.LoadSOPickingListfromDB(PickingList);
    JobBagNumber := stPickDM.GetJobBagNumber(PickingList.PickLines[0].SalesOrder);
    UpdateTransfers;
    if JobBagNumber <> 0 then
      begin
        TransferToProduction;
        if not UseForwardStock then
          UpdateProduction;
      end;
  finally
    PickingList.Free;
    stPickDM.free;
  end;
end;

procedure TSTStockDataMod.CreatePickNote(SONumber: integer);
var
  iPickNote: integer;
  icount: integer;
begin
  {Get the Picking Note code}
  with qryGetNextPickNo do
    begin
      close;
      open;
      iPickNote := fieldbyname('Last_Picking').asinteger + 1;
    end;

  {Get the Allocated order details}
  with qryGetSOAlloc do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      open;

      icount := 1;

      while eof <> true do
        begin
          if fieldbyname('Quantity_To_Pick').asinteger = 0 then
            begin
              next;
              continue;
            end;

          {Add the Pick Note}
          qryAddSOPick.close;
          qryAddSOPick.ParamByName('Sales_Order_Picking').asInteger := iPickNote;
          qryAddSOPick.ParamByName('Picking_No').asinteger := icount;
          qryAddSOPick.ParamByName('Sales_Order').asinteger := SONumber;
          qryAddSOPick.ParamByName('Sales_Order_Line_No').asinteger := fieldbyname('Sales_Order_Line_no').asinteger;

          qryAddSOPick.ParamByName('Quantity_To_Pick').asinteger := fieldbyname('Quantity_To_Pick').asinteger;
          qryAddSOPick.ParamByName('Picking_List_Ref').asstring := inttostr(SONumber)+'/'+inttostr(100+1);

          qryAddSOPick.ParamByName('Date_Picked').asdatetime := date;
          qryAddSOPick.ParamByName('Part_Bin').asstring := fieldbyname('Part_Bin').asstring;
          qryAddSOPick.ParamByName('Part_Store_Lot').asstring := fieldbyname('Part_Store_Lot').asstring;

          qryAddSOPick.ParamByName('Stock_Pack_Quantity').asinteger := fieldbyname('Stock_Pack_Quantity').asinteger;
          qryAddSOPick.ParamByName('Part_Store').asinteger := fieldbyname('Part_Store').asinteger;
          qryAddSOPick.ParamByName('Invoice_upfront').asstring := fieldbyname('Invoice_upfront').asstring;
          qryAddSOPick.ParamByName('Part_Store_Allocation').asinteger := fieldbyname('Part_Store_Allocation').asinteger;
          qryAddSOPick.Parambyname('Pick_Note_Confirmed').clear;

          qryAddSOPick.ParamByName('Date_Received').asdatetime := fieldbyname('Date_Received').asdatetime;

          try
            qryAddSOPick.ParamByName('Sets_per_Pad').asinteger := fieldbyname('Sets_per_Pad').asinteger;
          except
            qryAddSOPick.ParamByName('Sets_per_Pad').asinteger := 1;
          end;

          try
            qryAddSOPick.ParamByName('Purchase_Order').asfloat := fieldbyname('Purchase_Order').asfloat;
          except
            qryAddSOPick.ParamByName('Purchase_Order').asfloat := 0;
          end;

          qryAddSOPick.ExecSQL;

          icount := icount + 1;
          next;
        end;
    end;
end;

procedure TSTStockDataMod.UpdateSOStatus(SONUmber, SOStatus: integer);
begin
  with qryUpdSOStatus do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      parambyname('Sales_Order_Head_Status').asinteger := SOStatus;
      execsql;
    end;
end;

procedure TSTStockDataMod.LockCompanyRecord;
var
  StartTime : TDateTime;
  EndTime : TDateTime;
  InUseBy : integer;
  Myself : integer;
const
  LockTime = ((1/24) * (5/3600));  { Allow 5 seconds for lock attempts }
begin
  StartTime := Time;
  EndTime := StartTime + LockTime;
  InUseBy := 0;
  MySelf := frmPBMainMenu.iOperator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qryCompany do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
              'Where Company=1 and In_Use_By is null');
      ExecSQL;
      SQL.Clear;
      SQL.Add('Select In_Use_By From Company Where Company = 1');
      Open;
      InUseBy := FieldByName('In_Use_By').AsInteger;
      Close;
      if (InUseBy <> MySelf) and (Time > EndTime) then
      begin { Assume the other locker has died and grab record unconditionally }
        SQL.Clear;
        SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
                'Where Company=1');
        ExecSQL;
      end;
    end;
end;

procedure TSTStockDataMod.FreeCompanyRecord;
begin
  with qryCompany do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

function TSTStockDataMod.GetNextSONumber: Integer;
begin
  LockCompanyRecord;
  try
    try
      with GetLastSQL do
      begin
        Close;
        Open;
        Result := FieldByName('Last_SO_Number').AsInteger + 1;
        Close;
      end;
      with UpdLastSQL do
      begin
        ParamByName('Last_SO_Number').AsInteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next SO number:' + #13 + E.Message);
    end;
    end;
  finally
    FreeCompanyRecord;
  end;
end;

procedure TSTStockDataMod.UpdateTransfers;
var
  iType, ilots, icount: integer;
  PickLine: TPickLine;
  LotNumber: TLotNumber;
  sReference, sMoveType: string;
  iStoreStock, iItem: integer;
  rCost: real;
  bInvupfront: boolean;
  sInvUpFront: string;
begin
  bInvUpfront := false;
  for icount := 0 to Pred(PickingList.PickLines.count) do
    with PickingList.PickLines[iCount] do
      begin
        FSelectedLineIndex := icount;
        PickLine := SelectedLine.Clone;
        {Set up the reference depending on whether a Stock Order or for a job}
        if IsSalesOrder then
          begin
            if JobBagNumber = 0 then
              begin
                if toDestroy then
                  sMoveType := 'X'
                else
                  sMoveType := 'D';
                sReference := 'SalesOrd: ' + inttoStr(PickLine.SalesOrder);
                iItem := PickLine.SalesOrder;
                iType := 1;
              end
            else
              begin
                if toDestroy then
                  sMoveType := 'X'
                else
                  sMoveType := 'U';
                sReference := 'Job Bag: ' + inttoStr(JobBagNumber) + '  (SO/' + inttoStr(PickLine.SalesOrder) +')';
                iItem := PickLine.SalesOrder;
                iType := 1;
              end;
          end
        else
          begin
            sMoveType := 'F';
            sReference := 'SO: ' + inttoStr(PickLine.PurchaseOrder);
            iItem := PickLine.PurchaseOrder;
            iType := 2;
          end;

        if PickLine.LotNumbers.count > 0 then
          begin
            for iLots := 0 to pred(PickLine.LotNumbers.count) do
              begin
                FSelectedLotIndex := iLots;
                LotNumber := SelectedLot.clone;

                iStoreStock := stPickDM.GetStoreStock(PickingList.PickingListRef, pickLine.Part, PickLine.PartBin, LotNumber.LotNumberRef);
                rCost := stPickDM.GetStoreStockCost(iStoreStock)*1;

//                bInvUpfront := stpickDM.CheckInvUpFront(iStoreStock);
                bInvUpFront := pickLine.PaidStock;

                {Update/Downdate the Stock}
                STStockDataMod.updstock(iStoreStock,PickLine.Part,PickingList.PartStore,
                    PickLine.PickBin,LotNumber.LotNumberRef,smoveType,sreference,date,date,-1,0,1,(rCost*-1),PickLine.OrigPurchaseOrder,PickLine.PalletID,PickLine.ProductID,PickLine.Overs);
(*
                if PickLine.QtyPicked > 0 then
                  {Update the Transfer details}
                  begin
                  if itype = 1 then
                    STStockDataMod.AddStockTransfer(LotNumber.LotNumberRef,PickLine.Part,PickLine.SalesOrder,PickLine.PurchaseOrder,
                      PickingList.PartStore,PickLine.PickBin,PickingList.PartStore,PickLine.SalesOrderLine,
                        1,1,date,rCost, iStoreStock, bInvUpFront) ;
                  if itype =2 then
                    STStockDataMod.AddStockTransfer(LotNumber.LotNumberRef,PickLine.Part,PickLine.SalesOrder,PickLine.PurchaseOrder,
                      PickingList.PartStore,PickLine.PickBin,PickingList.PartStore,PickLine.PurchaseOrderLine,
                        1,1,date,rCost, iStoreStock, bInvUpFront)
                  end;
*)
              end;
          end
        else
          begin
            if (pickline.pickbin <> pickline.PartBin) or (pickline.picklot <>pickline.partStorelot) then
            begin
              iStoreStock := stPickDM.GetStoreStockdiff(PickingList.PartStore, pickLine.Part, PickLine.PickBin,Pickline.PickLot);
              rCost := stPickDM.GetStoreStockCost(iStoreStock)*PickLine.QtyPicked;
            end
            else
             begin
              istorestock := Pickline.StoreStock;
              rCost := stPickDM.GetStoreStockCost(PickLine.StoreStock)*PickLine.QtyPicked;
             end ;

//            bInvUpfront := stpickDM.CheckInvUpFront(iStoreStock);
            bInvUpFront := pickLine.PaidStock;
            PickLine.PickCost := rCost;
            {Update/Downdate the Stock}
            STStockDataMod.updstock(istorestock,PickLine.Part,PickingList.PartStore,
                PickLine.PickBin,PickLine.PickLot,smoveType,sreference,date,date,(PickLine.QtyPicked*-1),0,PickLine.PackSize,(rCost*-1),Pickline.OrigPurchaseOrder,PickLine.PalletID,PickLine.ProductID,PickLine.Overs);

          end;

        {De-allocate the stock details}
        {If Purchase Order then update the Qty Sent on the Purchase Order}
        if iType = 2 then
          begin
            stPickDM.UpdatePurchOrder(PickLine.PurchaseOrder,PickLine.PurchaseOrderLine,PickLine.QtyPicked);
            STStockDataMod.DeAllocStock(iItem, PickLine.QtyAlloc, iType, PickLine.PurchaseOrderLine);

(*            STStockDataMod.AddStockTransfer(PickLine.PickLot,PickLine.Part,PickLine.SalesOrder,PickLine.PurchaseOrder,
                                    PickingList.PartStore,PickLine.PickBin,PickingList.PartStore,PickLine.PurchaseOrderLine,
                                    PickLine.QtyPicked,PickLine.PackSize,date,rCost,iStoreStock,bInvUpFront)
*)
          end
        else
        if iType = 1 then
          begin
            if not UseForwardStock then
              begin
                stPickDM.UpdateSalesOrder(PickLine.SalesOrder,PickLine.SalesOrderLine,PickLine.QtyPicked);
                if bInvUpfront then
                  stPickDM.UpdateSalesOrderQtyInv(PickLine.SalesOrder,PickLine.SalesOrderLine,PickLine.QtyPicked);
              end;
            STStockDataMod.DeAllocStock(iItem, PickLine.QtyAlloc, iType, PickLine.SalesOrderLine);

            if icount = Pred(PickingList.PickLines.count) then
              begin
                stPickDM.UpdateOrderStatus(PickLine.SalesOrder);
                stPickDM.UpdateJobBag(PickLine.SalesOrder);
              end;
          end;
        stPickDM.UpdatePickingStatus(PickingList.PickingListRef);
        PickingList.PickLines[iCount].Assign(PickLine);
      end;
end;

procedure TSTStockDataMod.TransferToProduction;
var
  iType, ilots, icount: integer;
  PickLine: TPickLine;
  LotNumber: TLotNumber;
  sReference, sMoveType: string;
  iStoreStock, iItem: integer;
  rCost: real;
  bInvupfront: boolean;
  sInvUpFront: string;
  iMoveStore: integer;
  sMoveBin: string;
  iQtyOvers, iQtyOversThisRec, iQtyOverPicked, iQtyOverPickedThisRec: integer;
  sPart: string;
begin
  iQtyOversThisRec := 0;
  iQtyOvers := 0;
  iQtyOverPicked := 0;
  iQtyOverPickedThisRec := 0;

  bInvUpfront := false;
  for icount := 0 to Pred(PickingList.PickLines.count) do
    with PickingList.PickLines[iCount] do
      begin
        FSelectedLineIndex := icount;
        PickLine := SelectedLine.Clone;

        if PickLine.Part <> sPart then
          begin
            iQtyOvers := STPickDM.GetSalesOrderOvers(PickLine.SalesOrder, PickLine.SalesOrderLine);
            iQtyOverPicked := GetTotalPartPicked(PickLine.Part) - GetTotalPartAllocated(PickLine.Part);
            sPart := PickLine.Part;
          end;

        {Set up the reference depending on whether a Stock Order or for a job}
        sMoveType := 'V';
        iMoveStore := stPickDM.GetProductionStore(PickLine.SalesOrder);
        if iMoveStore = 0 then
          iMoveStore := PickingList.PartStore;

        sMoveBin := stPickDM.GetProductionBin(PickLine.SalesOrder);
        if sMoveBin = '' then
          sMoveBin := PickLine.PickBin;

        sReference := 'Job Bag: ' + inttoStr(JobBagNumber) + '  (SO/' + inttoStr(PickLine.SalesOrder) +')';
        iItem := PickLine.SalesOrder;
        iType := 1;

        if (pickline.pickbin <> pickline.PartBin) or (pickline.picklot <> pickline.partStorelot) then
          begin
            iStoreStock := stPickDM.GetStoreStockdiff(PickingList.PartStore, pickLine.Part, PickLine.PickBin,Pickline.PickLot);
//            rCost := stPickDM.GetStoreStockCost(iStoreStock)*PickLine.QtyPicked;
            rCost := PickLine.PickCost;
          end
        else
          begin
            istorestock := Pickline.StoreStock;
//            rCost := stPickDM.GetStoreStockCost(PickLine.StoreStock)*PickLine.QtyPicked;
            rCost := PickLine.PickCost;
          end ;

        //        bInvUpfront := stpickDM.CheckTransferInvUpFront(iStoreStock,PickLine.SalesOrder,PickLine.SalesOrderLine);
        bInvUpFront := pickLine.PaidStock;

        if bInvUpFront then
          sInvUpFront := 'Y'
        else
          sInvUpFront := 'N';

        iStoreStock :=  STStockDataMod.AddandGetStoreStock(PickLine.Part,iMoveStore,sMoveBin,PickLine.PickLot,smoveType,sreference,
                        PickLine.LotDate,date,PickLine.QtyPicked,0,PickLine.PackSize,rCost,PickLine.LotDescription, sInvUpFront,PickLine.SetsPerPad, PickLine.OrigPurchaseOrder,PickLine.PalletID,PickLine.Overs);

        if iQtyOvers > 0 then
          begin
            if PickLine.QtyPicked > iQtyOvers then
              iQtyOversThisRec := iQtyOvers
            else
              iQtyOversThisRec := PickLine.QtyPicked;
          end
        else
          iQtyOversThisRec := 0;

        if iQtyOverPicked > 0 then
          begin
            if (PickLine.QtyPicked - PickLine.QtyAlloc) > iQtyOverPicked then
              iQtyOverPickedThisRec := iQtyOverPicked
            else
            if (PickLine.QtyPicked - PickLine.QtyAlloc) > 0 then
              iQtyOverPickedThisRec := (PickLine.QtyPicked - PickLine.QtyAlloc)
            else
              iQtyOverPickedThisRec := 0;
          end
        else
          iQtyOverPickedThisRec := 0;

        if iStoreStock > 0 then
          begin
            STStockDataMod.AllocStoreStock(iStoreStock, PickLine.SalesOrder, PickLine.QtyPicked, 1, PickLine.SalesOrderLine, iQtyOversThisRec, iQtyOverPickedThisRec);

            STStockDataMod.AddStockTransfer(PickLine.PickLot,PickLine.Part,PickLine.SalesOrder,PickLine.PurchaseOrder,
                iMoveStore,sMoveBin,iMoveStore,PickLine.SalesOrderLine, PickLine.QtyPicked,PickLine.PackSize,date,rCost,iStoreStock, binvUpFront);

          end;

        stPickDM.UpdateSalesOrderStatus(PickLine.SalesOrder,120);
        iQtyOvers := iQtyOvers - iQtyOversThisRec;
        iQtyOverPicked := iQtyOverPicked - iQtyOverPickedThisRec;
      end;
end;

procedure TSTStockDataMod.UpdateProduction;
var
  iType, ilots, icount: integer;
  PickLine: TPickLine;
  LotNumber: TLotNumber;
  sReference, sMoveType: string;
  iStoreStock, iItem: integer;
  rCost: real;
  bInvupfront: boolean;
  sInvUpFront: string;
begin
  bInvUpfront := false;
  stPickDM.LoadSOProductionDets(PickingList,SalesOrderNo);

  for icount := 0 to Pred(PickingList.PickLines.count) do
    with PickingList.PickLines[iCount] do
      begin
        FSelectedLineIndex := icount;
        PickLine := SelectedLine.Clone;
        {Set up the reference depending on whether a Stock Order or for a job}
        sMoveType := 'J';
        sReference := 'Job Bag: ' + inttoStr(JobBagNumber) + '  (SO/' + inttoStr(PickLine.SalesOrder) +')';
        iItem := PickLine.SalesOrder;
        iType := 1;

        if (pickline.pickbin <> pickline.PartBin) or (pickline.picklot <>pickline.partStorelot) then
          begin
            iStoreStock := stPickDM.GetStoreStockdiff(PickingList.PartStore, pickLine.Part, PickLine.PickBin,Pickline.PickLot);
            rCost := stPickDM.GetStoreStockCost(iStoreStock)*PickLine.QtyPicked;
//            rCost := PickLine.PickCost;
          end
        else
          begin
            istorestock := Pickline.StoreStock;
            rCost := stPickDM.GetStoreStockCost(iStoreStock)*PickLine.QtyPicked;
//            rCost := PickLine.PickCost;
          end ;

        bInvUpFront := pickLine.PaidStock;
        PickLine.PickCost := rCost;

        {Update/Downdate the Stock}
        STStockDataMod.updstock(istorestock,PickLine.Part,PickingList.PartStore,
               PickLine.PickBin,PickLine.PickLot,smoveType,sreference,date,date,(PickLine.QtyPicked*-1),0,PickLine.PackSize,(rCost*-1),PickLine.OrigPurchaseOrder,PickLine.PalletID,PickLine.ProductID,PickLine.Overs);

        STStockDataMod.DeAllocStock(iItem, PickLine.QtyAlloc, iType, PickLine.SalesOrderLine);

(*        if icount = Pred(PickingList.PickLines.count) then
          begin
            stPickDM.UpdateOrderStatus(PickLine.SalesOrder);
            stPickDM.UpdateJobBag(PickLine.SalesOrder);
          end;
*)
        stPickDM.UpdateSalesOrder(PickLine.SalesOrder,PickLine.SalesOrderLine,(PickLine.QtyAlloc-PickLine.QtyPicked)*-1);
        if bInvUpfront then
          stPickDM.UpdateSalesOrderQtyInv(PickLine.SalesOrder,PickLine.SalesOrderLine,(PickLine.QtyAlloc-PickLine.QtyPicked)*-1);

        stPickDM.UpdatePickingStatus(PickingList.PickingListRef);
        PickingList.PickLines[iCount].Assign(PickLine);
      end;
  stPickDM.UpdateOrderStatus(SalesOrderNo);
  stPickDM.UpdateJobBag(SalesOrderNo);
end;

function TSTStockDataMod.GetSelectedLine: TPickLine;
begin
  if FSelectedLineIndex < 0 then
    Result := nil
  else
    Result := PickingList.PickLines[FSelectedLineIndex];
end;

function TSTStockDataMod.GetSelectedLot: TLotNumber;
begin
  if (SelectedLine = nil) or (FSelectedLotIndex < 0) then
    Result := nil
  else
    Result := SelectedLine.LotNumbers[FSelectedLotIndex];
end;

function TSTStockDataMod.GetTotalPartAllocated(tempPart: string): integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(PickingList.PickLines.Count) do
    begin
      if tempPart = PickingList.PickLines[i].Part then
        Result := Result + PickingList.PickLines[i].QtyAlloc
    end;
end;

function TSTStockDataMod.GetTotalPartPicked(tempPart: string): integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(PickingList.PickLines.Count) do
    begin
      if tempPart = PickingList.PickLines[i].Part then
        Result := Result + PickingList.PickLines[i].QtyPicked;
    end;
end;

end.
