unit STPickbyPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, DBCtrls, Buttons, STPickObject,
  CCSCommon, ComCtrls, ExtCtrls, STPacks,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPickbyPartFrm = class(TForm)
    GetIntSelSQL: TFDQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    StoreNameLbl: TLabel;
    Panel2: TPanel;
    ConfirmBtn: TBitBtn;
    BitBtn2: TBitBtn;
    DeleteBitBtn: TBitBtn;
    AddBitBtn: TBitBtn;
    Changebtn: TBitBtn;
    Panel3: TPanel;
    PickingGrid: TStringGrid;
    Label3: TLabel;
    LblOrdNo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ChangebtnClick(Sender: TObject);
    procedure PickingGridDblClick(Sender: TObject);
    procedure ConfirmBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PickingGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure UpdateTransfers;
    procedure TransferToProduction;
    procedure FormatGrid;
    procedure PickingGridClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure DeleteBitBtnClick(Sender: TObject);
    procedure DeleteRow(iRowNo: integer);
    procedure InsertRow(iRowNo: integer);
    procedure ReNumberLines(iRowNo: integer);
    procedure EnableButtons(iRow: integer);
    procedure SplitAllocation(aLine: TPickLine; iQtyPicked: integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure PickingGridDrawCell(Sender: TObject; vCol, vRow: Integer; Rect: TRect; State: TGridDrawState);
  private
    FPickListNumber: string;
    FSelectedLineIndex: Integer;
    FSelectedLotIndex: integer;
    fIsSalesOrder: boolean;
    FJobBagNumber: integer;
    procedure SetPickListNumber(const Value: string);
    procedure LoadPickingList;
    procedure PickLoop;
    function GetSelectedLine: TPickLine;
    function GetSelectedLot: TLotNumber;
    procedure setIsSalesOrder(const Value: boolean);
    procedure GetNextDespNote;
    procedure SetJobBagNumber(const Value: integer);
    function GetTotalPartAllocated(tempPart: string): integer;
    function GetTotalPartPicked(tempPart: string): integer;
    { Private declarations }
  public
    iIntSelCode: Integer;
    SalesOrder: integer;
    bOK: bytebool;
    property JobBagNumber: integer read FJobBagNumber write SetJobBagNumber;
    property PickListNumber: string read FPickListNumber write SetPickListNumber;
    property SelectedLine: TPickLine read GetSelectedLine;
    property SelectedLineIndex: Integer read FSelectedLineIndex;
    property SelectedLot: TLotNumber read GetSelectedLot;
    property SelectedLotIndex: integer read FSelectedLotIndex;
    property IsSalesOrder: boolean read fIsSalesOrder write setIsSalesOrder;
    { Public declarations }
  end;

var
  STPickbyPartFrm: TSTPickbyPartFrm;

implementation

uses UITypes, stPickItem, ststockdm, STPickingDM;

{$R *.DFM}

procedure TSTPickbyPartFrm.SetPickListNumber(const Value: string);
begin
  FPickListNumber := Value;
end;

procedure TSTPickbyPartFrm.FormShow(Sender: TObject);
begin
if not IsSalesOrder then
  begin
  with PickingGrid do
    begin
      cells[0,0] := 'Part Code';
      cells[1,0] := 'Description';
      cells[2,0] := 'Pack Size';
      cells[3,0] := 'Alloc Bin'; {Allocated}
      cells[4,0] := 'Alloc Lot'; {Allocated}
      cells[5,0] := 'Alloc Qty'; {Allocated}
      cells[6,0] := 'Pick Qty'; {Picking}
      cells[7,0] := 'Pick Bin'; {Picking}
      cells[8,0] := 'Pick Lot'; {Picking}
    end;
  LoadPickingList;
  pickingGrid.setfocus;
  end
  else
  pickloop;
end;

procedure TSTPickbyPartFrm.FormatGrid;
begin
  with PickingGrid do
    begin
      {Set the Grid columns if no bins in use}
      if not PickingList.BinsInUse then
        begin
          colwidths[3] := -1;
          colwidths[7] := -1;
        end;
      {Set the Grid columns if no lots in use}
      if not PickingList.LotsInUse then
        begin
          colwidths[4] := -1;
          colwidths[8] := -1
        end;
    end;
  StoreNameLbl.Caption := stPickDM.GetPartStoreName(PickingList.PartStore);
  LblOrdNo.Caption := IntToStr(PickingList.PickLines[0].SalesOrder);
  JobBagNumber := stPickDM.GetJobBagNumber(PickingList.PickLines[0].SalesOrder);
end;

procedure TSTPickbyPartFrm.LoadPickingList;
var
  icount: integer;
begin
  pickingList.PickingListRef := PickListNumber;
  stPickDM.LoadPickingListfromDB(PickingList);

  {Set the format of the Grid}
  FormatGrid;

  for icount := 0 to Pred(PickingList.PickLines.count) do
    with PickingList.PickLines[iCount] do
      begin
          PickingGrid.cells[0,icount+1] := Part;
          PickingGrid.cells[1,icount+1] := stPickDM.GetPartDescription(Part);
          PickingGrid.cells[2,icount+1] := intToStr(Packsize);
          PickingGrid.cells[3,icount+1] := PartBin;
          PickingGrid.cells[4,icount+1] := PartStoreLot;
          PickingGrid.cells[5,icount+1] := QtyAllocinPacks;
          PickingGrid.cells[6,icount+1] := QtyPickedinPacks;
          PickingGrid.cells[7,icount+1] := PickBin;
          PickingGrid.cells[8,icount+1] := PickLot;
      end;
  PickingGrid.rowcount := PickingList.PickLines.count+1;
end;

procedure TSTPickbyPartFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then
    begin
      with TStringGrid(ActiveControl) do
      begin
        ChangeBtnClick(self);
      end;
    end;
end;

procedure TSTPickbyPartFrm.ChangebtnClick(Sender: TObject);
var
  irow, icount: integer;
  PickLine: TPickLine;
  LotNumber: TLotNumber;
begin
  PickLine := SelectedLine.Clone;

  with PickingGrid do
    begin
      irow := row;
    end;

  stPickItemFrm := TstPickItemFrm.create(self);
  with stPickItemFrm do
    begin
      try
        MaintMode := 'C'; {Change}
        partcode := PickLine.Part;
        AllocatedBin := PickLine.PartBin;
        packsize := Pickline.Packsize;
        AllocatedQty := PickLine.QtyAlloc;
        PickQty := PickLine.QtyPicked;
        AllocatedQtyinPacks := Pickline.QtyAllocinPacks;
        PickQtyInPacks := Pickline.QtyPickedinPacks;
        PickBin := PickLine.PickBin;
        AllocatedLot := PickLine.PartStoreLot;
        PickLot:= PickLine.PickLot;
        IsJob := (Pickline.Job <> '');
        for icount := 0 to pred(PickLine.LotNumbers.count) do
          begin
            FSelectedLotIndex := icount;
            LotNumber := SelectedLot.clone;
            SerialNoItems.add(LotNumber.LotNumberRef);
          end;
        {Determine if using Lots and/or Serial numbering}
        BinsInUse := PickingList.BinsInUse;
        LotsInUse := PickingList.LotsInUse;
        SerialNoInUse := PickLine.SerialNumbers;
        PartStore := PickingList.PartStore;

        showmodal;
        if modalresult = idok then
          begin
            pickingGrid.cells[6,irow] := PickQtyinpacks;
            pickingGrid.cells[7,irow] := PickBin;
            pickingGrid.cells[8,irow] := PickLot;
            PickLine.QtyPicked := PickQty;
            PickLine.PickBin := PickBin;
            PickLine.PickLot := PickLot;

            if SerialNoInUse then
              begin
                {Delete the existing Serial Numbers}
                for icount := pred(PickLine.LotNumbers.count) downto 0 do
                  begin
                    PickLine.LotNumbers.delete(icount);
                  end;

                {Add the new Serial Numbers}
                for icount := 0 to pred(SerialNoItems.count) do
                  begin
                    LotNumber := TLotNumber.create;
                    LotNumber.LotNumberRef := SerialNoItems.strings[icount];
                    PickLine.LotNumbers.Add(LotNumber);
                    PickLine.LotNumbers[icount].Assign(LotNumber);
                  end;
              end;
            EnableButtons(irow);
            PickingList.PickLines[SelectedLineIndex].Assign(PickLine);

            PickLine.Free;
          end
        else
          PickLine.Free;
      finally
        free;
      end;
    end;
end;

procedure TSTPickbyPartFrm.PickingGridDblClick(Sender: TObject);
begin
  ChangeBtnClick(self);
end;

procedure TSTPickbyPartFrm.ConfirmBtnClick(Sender: TObject);
begin
  if MessageDlg('Complete the Picking confirmation?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if PickingList.TotalUnPaidPickQty > pickingList.TotalUnPaidAllocQty then
        begin
          if messagedlg('The Quantity Picked is greater than the Quantity Allocated, you should not over pick for this product. '
                      + 'This stock has NOT been paid for by the client, do you want to cancel confirming this order!?', mtWarning, [mbYes, mbNo], 0) = mrYes then
          exit;
        end;

      UpdateTransfers;
      if JobBagNumber <> 0 then
        TransferToProduction;
      stPickDM.ClearPickingRef(PickingList.PickingListRef);
      //modalresult := mrok
      bOK := true;
    end;
  GetNextDespNote;
end;

procedure TSTPickbyPartFrm.FormCreate(Sender: TObject);
begin
  bOK := false;
  PickingList := TPickingList.Create(stPickDM);
end;

function TSTPickbyPartFrm.GetSelectedLine: TPickLine;
begin
  if FSelectedLineIndex < 0 then
    Result := nil
  else
    Result := PickingList.PickLines[FSelectedLineIndex];
end;

procedure TSTPickbyPartFrm.PickingGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  EnableButtons(ARow);
  if FSelectedLineIndex = ARow - 1 then Exit;
  FSelectedLineIndex := ARow - 1;
end;

procedure TSTPickbyPartFrm.FormDestroy(Sender: TObject);
begin
  PickingList.Free;
end;

procedure TSTPickbyPartFrm.UpdateTransfers;
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
                sMoveType := 'D';
                sReference := 'SalesOrd: ' + inttoStr(PickLine.SalesOrder);
                iItem := PickLine.SalesOrder;
                iType := 1;
              end
            else
              begin
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
                    PickLine.PickBin,LotNumber.LotNumberRef,smoveType,sreference,date,date,-1,0,1,rCost*-1,0,0,0,'N');
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
                PickLine.PickBin,PickLine.PickLot,smoveType,sreference,date,date,(PickLine.QtyPicked*-1),0,PickLine.PackSize,rCost*-1,0,0,0,'N');

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
            stPickDM.UpdateSalesOrder(PickLine.SalesOrder,PickLine.SalesOrderLine,PickLine.QtyPicked);
            if bInvUpfront then
              stPickDM.UpdateSalesOrderQtyInv(PickLine.SalesOrder,PickLine.SalesOrderLine,PickLine.QtyPicked);
            STStockDataMod.DeAllocStock(iItem, PickLine.QtyAlloc, iType, PickLine.SalesOrderLine);
            if icount = Pred(PickingList.PickLines.count) then
              begin
                stPickDM.UpdateOrderStatus(PickLine.SalesOrder);
                stPickDM.UpdateJobBag(PickLine.SalesOrder);
              end;
          end;
        PickingList.PickLines[iCount].Assign(PickLine);
      end;
end;

procedure TSTPickbyPartFrm.TransferToProduction;
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

        if (pickline.pickbin <> pickline.PartBin) or (pickline.picklot <>pickline.partStorelot) then
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
                        PickLine.LotDate,date,PickLine.QtyPicked,0,PickLine.PackSize,rCost,PickLine.LotDescription, sInvUpFront,PickLine.SetsPerPad,0,0,'N');

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

        STStockDataMod.AllocStoreStock(iStoreStock, PickLine.SalesOrder, PickLine.QtyPicked, 1, PickLine.SalesOrderLine, iQtyOversThisRec, iQtyOverPickedThisRec);

        STStockDataMod.AddStockTransfer(PickLine.PickLot,PickLine.Part,PickLine.SalesOrder,PickLine.PurchaseOrder,
          iMoveStore,sMoveBin,iMoveStore,PickLine.SalesOrderLine, PickLine.QtyPicked,PickLine.PackSize,date,rCost,iStoreStock, binvUpFront);

        stPickDM.UpdateSalesOrderStatus(PickLine.SalesOrder,120);
        iQtyOvers := iQtyOvers - iQtyOversThisRec;
        iQtyOverPicked := iQtyOverPicked - iQtyOverPickedThisRec;
      end;
end;

function TSTPickbyPartFrm.GetSelectedLot: TLotNumber;
begin
  if (SelectedLine = nil) or (FSelectedLotIndex < 0) then
    Result := nil
  else
    Result := SelectedLine.LotNumbers[FSelectedLotIndex];
end;


procedure TSTPickbyPartFrm.PickingGridClick(Sender: TObject);
begin
  with PickingGrid do
    begin
      {Display what has been picked}
      stPickbyPartFrm.Hint := 'Quantity of: '+ cells[6, row] +
                              ' Picked from '+ cells[7,row] +
                              ' ' + cells[8,row];
    end;
end;

procedure TSTPickbyPartFrm.AddBitBtnClick(Sender: TObject);
var
  irow, icount: integer;
  PickLine: TPickLine;
  aPickLine: TPickLine;
  LotNumber: TLotNumber;
begin
  PickLine := SelectedLine.Clone;

  with PickingGrid do
    begin
      irow := row;
    end;

  stPickItemFrm := TstPickItemFrm.create(self);
  with stPickItemFrm do
    begin
      try
        MaintMode := 'A'; {Add}
        partcode := PickLine.Part;
        packsize := PickLine.Packsize;
        AllocatedBin := PickLine.PartBin;
        AllocatedQty := PickLine.QtyAlloc-PickLine.QtyPicked;
        AllocatedQtyInPacks := ShowinPacks(AllocatedQty,Packsize);
        PickQty := AllocatedQty;
        PickQtyinPacks := ShowinPacks(pickQty,Packsize);
        PickBin := '';
        AllocatedLot := PickLine.PartStoreLot;
//        PickLot:= PickLine.PickLot;
        PickLot:= '';
        IsJob := (Pickline.Job <> '');

        {Determine if using Lots and/or Serial numbering}
        BinsInUse := PickingList.BinsInUse;
        LotsInUse := PickingList.LotsInUse;
        SerialNoInUse := PickLine.SerialNumbers;
        PartStore := PickingList.PartStore;

        showmodal;
        if modalresult = idok then
          begin
            {Insert row in grid}
            insertrow(irow);
            
            {Re-number all the Picklines}
            ReNumberLines(irow+1);
            aPickLine := TPickLine.create;
            aPickLine.Line := irow+1;
            aPickLine.PartsForJob := PickLine.PartsForJob;
            aPickLine.StoreStock := PickLine.StoreStock;
            aPickLine.PartStoreLot := PickLine.PartStoreLot;
            aPickLine.PickLot := PickLine.PickLot;
            aPickLine.Part := PickLine.Part;
            aPickLine.Job := PickLine.Job;
            aPickLine.SalesOrder := PickLine.SalesOrder;
            aPickLine.SalesOrderLine := PickLine.SalesOrderLine;
            aPickLine.SerialNumbers := PickLine.SerialNumbers;
            aPickLine.QtyAlloc := PickQty;
            aPickLine.QtyPicked := PickQty;
            aPickLine.QtyAllocinPacks := PickQtyinPacks;
            APickline.QtyPickedinPacks := PickQtyinPacks;
            APickLine.Packsize := Packsize;
            aPickLine.PartBin := PickLine.PartBin;
            aPickLine.PickBin := PickBin;
            aPickLine.PickLot := PickLot;

            PickingList.PickLines.Add(aPickLine);

            if SerialNoInUse then
              begin
                {Add the new Serial Numbers}
                for icount := 0 to pred(SerialNoItems.count) do
                  begin
                    LotNumber := TLotNumber.create;
                    LotNumber.LotNumberRef := SerialNoItems.strings[icount];
                    aPickLine.LotNumbers.Add(LotNumber);
                    aPickLine.LotNumbers[icount].Assign(LotNumber);
                  end;
              end;

            {Insert the relevant grid details}
            pickingGrid.cells[0,irow+1] := pickingGrid.cells[0,irow];
            pickingGrid.cells[1,irow+1] := pickingGrid.cells[1,irow];
            pickingGrid.cells[2,irow+1] := pickingGrid.cells[2,irow];
            pickingGrid.cells[3,irow+1] := pickingGrid.cells[3,irow];
            pickingGrid.cells[4,irow+1] := pickingGrid.cells[4,irow];
            pickingGrid.cells[5,irow+1] := PickQtyinPacks;
            pickingGrid.cells[6,irow+1] := PickQtyinPacks;
            pickingGrid.cells[7,irow+1] := PickBin;
            pickingGrid.cells[8,irow+1] := PickLot;

            {Split the original Allocated qty}
            SplitAllocation(PickLine,aPickLine.QtyPicked);
            pickingGrid.row := irow+1;
            EnableButtons(irow+1);
            PickLine.Free;
          end
        else
          PickLine.Free;
      finally
        free;
      end;
    end;
end;

procedure TSTPickbyPartFrm.DeleteBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Delete selected picking item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PickingList.PickLines.Delete(FSelectedLineIndex);
      DeleteRow(PickingGrid.Row);
    end;
end;

procedure TSTPickbyPartFrm.SplitAllocation(aLine: TPickLine; iQtyPicked: integer);
begin
  with aLine do
    begin
      aLine.QtyAlloc := aLine.QtyAlloc-iQtyPicked;
      aline.qtyallocinPacks := showinpacks(aline.qtyAlloc, aline.Packsize);
      PickingList.PickLines[aLine.Line-1].Assign(aLine);
      PickingGrid.cells[5,aLine.Line] := aLine.QtyAllocinPacks;
    end;
end;

procedure TSTPickbyPartFrm.DeleteRow(iRowno: integer);
var
  irow, icol: integer;
begin
    {Delete row from grid and move everything up}
    with pickingGrid do
      begin
        for irow := irowno to rowcount-2 do
          begin
            for icol := 0 to 8 do
              begin
                cells[icol,irow] := cells[icol,irow+1];
                cells[icol,irow] := cells[icol,irow+1];
              end;
          end;
        {Clear the last row down}
        for icol := 0 to 8 do
          cells[icol,rowcount-1] := '';

        if rowcount = 2 then
          rowcount := 2
        else
          rowcount := rowcount-1;
      end;
end;

procedure TSTPickbyPartFrm.InsertRow(iRowNo: integer);
var
  irow, icol: integer;
begin
    {Insert new row from grid and move everything up}
    with pickingGrid do
      begin
        Rowcount := rowcount + 1;
        for irow := rowcount-1 downto iRowNo+1 do
          begin
            for icol := 0 to 9 do
              begin
                cells[icol,irow] := cells[icol,irow-1];
                cells[icol,irow] := cells[icol,irow-1];
              end;
          end;
      end;
end;

procedure TSTPickbyPartFrm.ReNumberLines(iRowNo: integer);
var
  aLine: TPickLine;
  icount: integer;
begin
  for icount := Pred(PickingList.PickLines.count) downto iRowNo-1 do
    begin
      FSelectedLineIndex := icount;
      aLine := SelectedLine.Clone;
      with aLine do
        begin
          Line := Line+1;
          PickingList.PickLines[icount].Assign(aLine);
          Free;
        end;
    end;

end;

procedure TSTPickbyPartFrm.EnableButtons(iRow: integer);
begin
  with PickingGrid do
    begin
      if (cells[5,irow] = '0') and (cells[6,irow] = '0') then
        DeleteBitBtn.enabled := true
      else
        DeleteBitBtn.enabled := false;

      if cells[5,irow] = cells[6,irow] then
        AddBitBtn.enabled := false
      else
        AddBitBtn.enabled := true;
    end;
end;

procedure TSTPickbyPartFrm.setIsSalesOrder(const Value: boolean);
begin
  fIsSalesOrder := Value;
end;

procedure TSTPickbyPartFrm.PickLoop;
begin
    with GetIntSelSql do
    begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    Open;
    if not GetIntSelSql.eof then
      begin
        PickListnumber := fieldByName('Text100').AsString;
        label1.caption := 'Picking Note: ' + PickListNumber;
        with PickingGrid do
         begin
          cells[0,0] := 'Part Code';
          cells[1,0] := 'Description';
          cells[2,0] := 'Pack Size';
          cells[3,0] := 'Alloc Bin'; {Allocated}
          cells[4,0] := 'Alloc Lot'; {Allocated}
          cells[5,0] := 'Alloc Qty'; {Allocated}
          cells[6,0] := 'Pick Qty'; {Picking}
          cells[7,0] := 'Pick Bin'; {Picking}
          cells[8,0] := 'Pick Lot'; {Picking}
        end;
      LoadPickingList;
      pickingGrid.setfocus;
  end;
end;
end;

procedure TSTPickbyPartFrm.GetNextDespNote;
begin
if not isSalesOrder then
  close;
GetIntSelSql.Next;
  if GetIntSelSQl.eof then
    close
  else
  begin
     PickingList.Clear;
     PickListnumber := GetIntSelSql.fieldByName('Text100').AsString;
        label1.caption := 'Despatch Note: ' + PickListNumber;
        with PickingGrid do
         begin
          cells[0,0] := 'Part Code';
          cells[1,0] := 'Description';
          cells[2,0] := 'Pack Size';
          cells[3,0] := 'Alloc Bin'; {Allocated}
          cells[4,0] := 'Alloc Lot'; {Allocated}
          cells[5,0] := 'Alloc Qty'; {Allocated}
          cells[6,0] := 'Pick Qty'; {Picking}
          cells[7,0] := 'Pick Bin'; {Picking}
          cells[8,0] := 'Pick Lot'; {Picking}
        end;
      LoadPickingList;
      pickingGrid.setfocus;
   end;
end;

procedure TSTPickbyPartFrm.BitBtn2Click(Sender: TObject);
begin
getnextdespNote;
end;

procedure TSTPickbyPartFrm.PickingGridDrawCell(Sender: TObject; vCol, vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  if (vCol <> 2) and (vCol <> 5) and (vCol <>6) then
  	begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
			{Display the Columns Right justified in the cells}
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
end;

procedure TSTPickbyPartFrm.SetJobBagNumber(const Value: integer);
begin
  FJobBagNumber := Value;
end;

function TSTPickbyPartFrm.GetTotalPartAllocated(tempPart: string): integer;
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

function TSTPickbyPartFrm.GetTotalPartPicked(tempPart: string): integer;
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
