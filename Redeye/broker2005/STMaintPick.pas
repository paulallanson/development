unit STMaintPick;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, DBCtrls, Buttons, STPickObject,
  CCSCommon, ComCtrls, ExtCtrls, STPacks,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintPickFrm = class(TForm)
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
    sgDetails: TStringGrid;
    Label3: TLabel;
    LblOrderNo: TLabel;
    cmbPickingNote: TComboBox;
    qryPickNotes: TFDQuery;
    qryProdLocation: TFDQuery;
    CancelBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ChangebtnClick(Sender: TObject);
    procedure sgDetailsDblClick(Sender: TObject);
    procedure ConfirmBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgDetailsSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure UpdateTransfers;
    procedure UpdateProduction;
    procedure TransferToProduction;
    procedure FormatGrid;
    procedure sgDetailsClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure DeleteBitBtnClick(Sender: TObject);
    procedure DeleteRow(iRowNo: integer);
    procedure InsertRow(iRowNo: integer);
    procedure ReNumberLines(iRowNo: integer);
    procedure EnableButtons(iRow: integer);
    procedure SplitAllocation(aLine: TPickLine; iQtyPicked: integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbPickingNoteClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    UseForwardStock: boolean;
    FPickListNumber: string;
    FSelectedLineIndex: Integer;
    FSelectedLotIndex: integer;
    fIsSalesOrder: boolean;
    FJobBagNumber: integer;
    FtoDestroy: boolean;
    function OverPicked: string;
    procedure SetPickListNumber(const Value: string);
    procedure LoadPickingList;
    procedure LoadSOPickingList(tmpSOPick: integer);
    procedure PickLoop;
    function GetSelectedLine: TPickLine;
    function GetSelectedLot: TLotNumber;
    procedure setIsSalesOrder(const Value: boolean);
    procedure GetNextDespNote;
    procedure SetJobBagNumber(const Value: integer);
    function GetTotalPartAllocated(tempPart: string): integer;
    function GetTotalPartPicked(tempPart: string): integer;
    procedure ShowPickingNotes;
    procedure ShowHeader;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure ShowPickingDetails;
    procedure BuildLineGrid;
    procedure ForwardStock;
    procedure SettoDestroy(const Value: boolean);
  public
    iIntSelCode: Integer;
    SalesOrder: integer;
    PartStore: integer;
    bOK: bytebool;
    property JobBagNumber: integer read FJobBagNumber write SetJobBagNumber;
    property PickListNumber: string read FPickListNumber write SetPickListNumber;
    property SelectedLine: TPickLine read GetSelectedLine;
    property SelectedLineIndex: Integer read FSelectedLineIndex;
    property SelectedLot: TLotNumber read GetSelectedLot;
    property SelectedLotIndex: integer read FSelectedLotIndex;
    property IsSalesOrder: boolean read fIsSalesOrder write setIsSalesOrder;
    property toDestroy: boolean read FtoDestroy write SettoDestroy;
    { Public declarations }
  end;

var
  STMaintPickFrm: TSTMaintPickFrm;

implementation

uses Types, UITypes, stPickItem, ststockdm, STPickingDM, pbDatabase;

{$R *.DFM}

procedure TSTMaintPickFrm.SetPickListNumber(const Value: string);
begin
  FPickListNumber := Value;
end;

procedure TSTMaintPickFrm.FormShow(Sender: TObject);
begin
(*if not IsSalesOrder then
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
//  LoadPickingList;
  pickingGrid.setfocus;
  end
  else
  pickloop;
*)
end;

procedure TSTMaintPickFrm.FormatGrid;
begin
  with sgDetails do
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
  lblOrderNo.Caption := IntToStr(PickingList.PickLines[0].SalesOrder);
  JobBagNumber := stPickDM.GetJobBagNumber(PickingList.PickLines[0].SalesOrder);
end;

procedure TSTMaintPickFrm.LoadPickingList;
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
          sgDetails.cells[0,icount+1] := Part;
          sgDetails.cells[1,icount+1] := stPickDM.GetPartDescription(Part);
          sgDetails.cells[2,icount+1] := intToStr(Packsize);
          sgDetails.cells[3,icount+1] := PartBin;
          sgDetails.cells[4,icount+1] := PartStoreLot;
          sgDetails.cells[5,icount+1] := QtyAllocinPacks;
          sgDetails.cells[6,icount+1] := QtyPickedinPacks;
          sgDetails.cells[7,icount+1] := PickBin;
          sgDetails.cells[8,icount+1] := PickLot;
      end;
  sgDetails.rowcount := PickingList.PickLines.count+1;
end;

procedure TSTMaintPickFrm.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TSTMaintPickFrm.ChangebtnClick(Sender: TObject);
var
  irow, icount: integer;
  PickLine: TPickLine;
  LotNumber: TLotNumber;
begin
  PickLine := SelectedLine.Clone;

  with sgDetails do
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
            sgDetails.cells[6,irow] := PickQtyinpacks;
            sgDetails.cells[7,irow] := PickBin;
            sgDetails.cells[8,irow] := PickLot;
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

procedure TSTMaintPickFrm.sgDetailsDblClick(Sender: TObject);
begin
  ChangeBtnClick(self);
end;

procedure TSTMaintPickFrm.ConfirmBtnClick(Sender: TObject);
var
  ProdCode: string;
begin
  if MessageDlg('Complete the Picking confirmation?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
// Check that no over picking has been done
      prodCode := OverPicked;
      if (prodCode <> '') and (not dmBroker.AllowOverPicking) then
        begin
          messagedlg('The quantity picked for product ' + prodCode + ' is greater than the quantity allocated, '
                    + ' over-picking is not allowed', mtError, [mbOk], 0);
          exit;
        end;

(*      if PickingList.TotalUnPaidPickQty > pickingList.TotalUnPaidAllocQty then
        begin
          if messagedlg('The Quantity Picked is greater than the Quantity Allocated, you should NOT over pick for this product. '
                      + 'This stock has NOT been paid for by the client, do you want to continue confirming this order!?',
            mtWarning, [mbYes, mbNo], 0) <> mrYes then

          exit;
        end;
*)
      UpdateTransfers;
      if JobBagNumber <> 0 then
        begin
          TransferToProduction;
          if not UseForwardStock then
            UpdateProduction;
        end;
      bOK := true;
      close;
    end;
//  GetNextDespNote;
end;

procedure TSTMaintPickFrm.FormCreate(Sender: TObject);
begin
  bOK := false;
  stPickDM := TstpickDm.Create(self);
  stStockDataMod := TstStockDataMod.Create(self);
  PickingList := TPickingList.Create(stPickDM);

  with sgDetails do
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

  for var i := 0 to sgDetails.ColCount-1 do
  begin
    if not (i in [2,5,6]) then
      sgDetails.ColAlignments[i] := taRightJustify;
  end;
end;

function TSTMaintPickFrm.GetSelectedLine: TPickLine;
begin
  if FSelectedLineIndex < 0 then
    Result := nil
  else
    Result := PickingList.PickLines[FSelectedLineIndex];
end;

procedure TSTMaintPickFrm.sgDetailsSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  EnableButtons(ARow);
  if FSelectedLineIndex = ARow - 1 then Exit;
  FSelectedLineIndex := ARow - 1;
end;

procedure TSTMaintPickFrm.FormDestroy(Sender: TObject);
begin
  PickingList.Free;
  stStockDataMod.free;
  stPickDM.free;
end;

function TSTMaintPickFrm.OverPicked: string;
var
  icount: integer;
  iQtyAlloc, iQtyPicked: integer;
  tempCode: string;
  PickLine: TPickLine;
begin
  result := '';
  tempCode := '';
  iQtyAlloc := 0;
  iQtyPicked := 0;

  for icount := 0 to Pred(PickingList.PickLines.count) do
    with PickingList.PickLines[iCount] do
      begin
        FSelectedLineIndex := icount;
        PickLine := SelectedLine.Clone;
        if tempCode <> PickLine.Part then
          begin
            if iQtyPicked > iQtyAlloc then
              begin
                result := tempCode;
                exit;
              end
            else
              begin
                tempCode := PickLine.Part;
                iQtyAlloc := 0;
                iQtyPicked := 0
              end;
          end;
        iQtyAlloc := iQtyAlloc + PickLine.QtyAlloc;
        iQtyPicked := iQtyPicked + PickLine.QtyPicked;
      end;

  if iQtyPicked > iQtyAlloc then
    begin
      result := tempCode;
    end;
end;

procedure TSTMaintPickFrm.UpdateTransfers;
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

procedure TSTMaintPickFrm.UpdateProduction;
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
  stPickDM.LoadSOProductionDets(PickingList,SalesOrder);

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
  stPickDM.UpdateOrderStatus(SalesOrder);
  stPickDM.UpdateJobBag(SalesOrder);
end;

procedure TSTMaintPickFrm.TransferToProduction;
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

function TSTMaintPickFrm.GetSelectedLot: TLotNumber;
begin
  if (SelectedLine = nil) or (FSelectedLotIndex < 0) then
    Result := nil
  else
    Result := SelectedLine.LotNumbers[FSelectedLotIndex];
end;


procedure TSTMaintPickFrm.sgDetailsClick(Sender: TObject);
begin
  with sgDetails do
    begin
      {Display what has been picked}
      stMaintPickFrm.Hint := 'Quantity of: '+ cells[6, row] +
                              ' Picked from '+ cells[7,row] +
                              ' ' + cells[8,row];
    end;
end;

procedure TSTMaintPickFrm.AddBitBtnClick(Sender: TObject);
var
  irow, icount: integer;
  PickLine: TPickLine;
  aPickLine: TPickLine;
  LotNumber: TLotNumber;
begin
  PickLine := SelectedLine.Clone;

  with sgDetails do
    begin
      irow := row;
    end;

  stPickItemFrm := TstPickItemFrm.create(self);
  with stPickItemFrm do
    begin
      try
        MaintMode := 'A'; {Change}
        partcode := PickLine.Part;
        packsize := PickLine.Packsize;
        AllocatedBin := PickLine.PartBin;
        AllocatedQty := PickLine.QtyAlloc-PickLine.QtyPicked;
        AllocatedQtyInPacks := ShowinPacks(AllocatedQty,Packsize);
        PickQty := AllocatedQty;
        PickQtyinPacks := ShowinPacks(pickQty,Packsize);
        PickBin := '';
//        PickLot:= PickLine.PickLot;
        PickLot:= '';
        AllocatedLot := PickLine.PartStoreLot;
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
            aPickLine.PaidStock := PaidStock;

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
            sgDetails.cells[0,irow+1] := sgDetails.cells[0,irow];
            sgDetails.cells[1,irow+1] := sgDetails.cells[1,irow];
            sgDetails.cells[2,irow+1] := sgDetails.cells[2,irow];
            sgDetails.cells[3,irow+1] := sgDetails.cells[3,irow];
            sgDetails.cells[4,irow+1] := sgDetails.cells[4,irow];
            sgDetails.cells[5,irow+1] := PickQtyinPacks;
            sgDetails.cells[6,irow+1] := PickQtyinPacks;
            sgDetails.cells[7,irow+1] := PickBin;
            sgDetails.cells[8,irow+1] := PickLot;

            {Split the original Allocated qty}
            SplitAllocation(PickLine,aPickLine.QtyPicked);
            sgDetails.row := irow+1;
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

procedure TSTMaintPickFrm.DeleteBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Delete selected picking item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PickingList.PickLines.Delete(FSelectedLineIndex);
      DeleteRow(sgDetails.Row);
    end;
end;

procedure TSTMaintPickFrm.SplitAllocation(aLine: TPickLine; iQtyPicked: integer);
begin
  with aLine do
    begin
      aLine.QtyAlloc := aLine.QtyAlloc-iQtyPicked;
      aline.qtyallocinPacks := showinpacks(aline.qtyAlloc, aline.Packsize);
      PickingList.PickLines[aLine.Line-1].Assign(aLine);
      sgDetails.cells[5,aLine.Line] := aLine.QtyAllocinPacks;
    end;
end;

procedure TSTMaintPickFrm.DeleteRow(iRowno: integer);
var
  irow, icol: integer;
begin
    {Delete row from grid and move everything up}
    with sgDetails do
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

procedure TSTMaintPickFrm.InsertRow(iRowNo: integer);
var
  irow, icol: integer;
begin
    {Insert new row from grid and move everything up}
    with sgDetails do
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

procedure TSTMaintPickFrm.ReNumberLines(iRowNo: integer);
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

procedure TSTMaintPickFrm.EnableButtons(iRow: integer);
begin
  with sgDetails do
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

procedure TSTMaintPickFrm.setIsSalesOrder(const Value: boolean);
begin
  fIsSalesOrder := Value;
end;

procedure TSTMaintPickFrm.PickLoop;
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
        with sgDetails do
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
      sgDetails.setfocus;
  end;
end;
end;

procedure TSTMaintPickFrm.GetNextDespNote;
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
        with sgDetails do
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
      sgDetails.setfocus;
   end;
end;

procedure TSTMaintPickFrm.BitBtn2Click(Sender: TObject);
begin
//  getnextdespNote;
  close;
end;

procedure TSTMaintPickFrm.SetJobBagNumber(const Value: integer);
begin
  FJobBagNumber := Value;
end;

function TSTMaintPickFrm.GetTotalPartAllocated(tempPart: string): integer;
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

function TSTMaintPickFrm.GetTotalPartPicked(tempPart: string): integer;
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

procedure TSTMaintPickFrm.FormActivate(Sender: TObject);
begin
  ShowHeader;
  ShowPickingNotes;
  ForwardStock;
end;

procedure TSTMaintPickFrm.ShowHeader;
begin
  lblOrderNo.caption := inttostr(SalesOrder);

  PartStore := stPickDM.GetPartStore(SalesOrder);
  StoreNameLbl.Caption := stPickDM.GetPartStoreName(PartStore);

end;

procedure TSTMaintPickFrm.ShowPickingNotes;
begin
  cmbPickingNote.Clear;

  with qryPickNotes do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder;
      open;

      while eof <> true do
        begin
          cmbPickingNote.items.Add(fieldbyname('Picking_List_Ref').asstring + ' - ' + pbDateStr(fieldbyname('Date_Picked').asdatetime));
          next;
        end;
    end;
  cmbPickingNote.ItemIndex := 0;

  cmbPickingNoteClick(self);
end;

procedure TSTMaintPickFrm.cmbPickingNoteClick(Sender: TObject);
begin
  ShowPickingDetails;
end;

procedure TSTMaintPickFrm.ShowPickingDetails;
begin
  qryPickNotes.First;
  qryPickNotes.MoveBy(cmbPickingNote.ItemIndex);

  LoadSOPickingList(qryPickNotes.fieldbyname('Sales_Order_Picking').asinteger);
  ClearGrid(sgDetails);
  BuildlineGrid;
end;

procedure TSTMaintPickFrm.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
    rowcount := 2;
    end;
end;

procedure TSTMaintPickFrm.BuildLineGrid;
var
  i, icount: integer;
begin
  icount := 0;

  for i := 0 to pred(PickingList.PickLines.count) do
    begin
      sgDetails.cells[0,i+1] := PickingList.PickLines[i].Part;
      sgDetails.cells[1,i+1] := stPickDM.GetPartDescription(PickingList.PickLines[i].Part);
      sgDetails.cells[2,i+1] := intToStr(PickingList.PickLines[i].Packsize);
      sgDetails.cells[3,i+1] := PickingList.PickLines[i].PartBin;
      sgDetails.cells[4,i+1] := PickingList.PickLines[i].PartStoreLot;
      sgDetails.cells[5,i+1] := PickingList.PickLines[i].QtyAllocinPacks;
      sgDetails.cells[6,i+1] := PickingList.PickLines[i].QtyPickedinPacks;
      sgDetails.cells[7,i+1] := PickingList.PickLines[i].PickBin;
      sgDetails.cells[8,i+1] := PickingList.PickLines[i].PickLot;
      icount := icount + 1;
    end;

  if icount = 0 then
    sgDetails.rowcount := 2
  else
    sgDetails.rowcount := icount + 1;

  Changebtn.enabled := not (PickingList.PickLines.count = 0);
  Cancelbtn.enabled := not (PickingList.PickLines.count = 0);
end;

procedure TSTMaintPickFrm.LoadSOPickingList(tmpSOPick: integer);
begin
  pickingList.PickingListRef := inttostr(tmpSOPick);
  stPickDM.LoadSOPickingListfromDB(PickingList);
  JobBagNumber := stPickDM.GetJobBagNumber(PickingList.PickLines[0].SalesOrder);
end;

procedure TSTMaintPickFrm.ForwardStock;
begin
  with qryProdLocation do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder;
      open;
      UseForwardStock := (fieldbyname('Receive_Forward_Stock').asstring = 'Y');
    end;
end;

procedure TSTMaintPickFrm.SettoDestroy(const Value: boolean);
begin
  FtoDestroy := Value;
end;

procedure TSTMaintPickFrm.CancelBtnClick(Sender: TObject);
var
  icount: integer;
  tempPickLine: TPickLine;
begin
  if MessageDlg('Do you want to cancel picking for ALL lines and zero the pick quantity?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      For icount := 0 to pred(PickingList.PickLines.Count) do
        begin
          FSelectedLineIndex := icount;
          tempPickLine := SelectedLine.Clone;

          try
            sgDetails.cells[6,(icount+1)] := '0';
            tempPickLine.QtyPicked := 0;
            tempPickLine.QtyPickedinPacks := '0';
            PickingList.PickLines[icount].Assign(tempPickLine);
          finally
            tempPickLine.free;
          end;
        end;
    end;
end;

end.
