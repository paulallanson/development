unit wtMaintPurchaseOrderReceipts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBCtrls, StdCtrls, Buttons, ComCtrls,
  DB, IniFiles, wtPurchasesDM;

type
  TfrmWTMaintPurchaseOrderReceipts = class(TForm)
    stsbrDetails: TStatusBar;
    Panel2: TPanel;
    btbtnClose: TBitBtn;
    Panel3: TPanel;
    dbgLines: TStringGrid;
    tmrSearch: TTimer;
    btnOK: TBitBtn;
    Label3: TLabel;
    dtTransaction: TDateTimePicker;
    edtGRN: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    edtDeliveryNote: TEdit;
    Label4: TLabel;
    edtSupplierName: TEdit;
    Label6: TLabel;
    edtNumber: TEdit;
    Label7: TLabel;
    edtReference: TEdit;
    procedure CheckOK(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure dblkpProductionLocationClick(Sender: TObject);
    procedure dbgLinesDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure dbgLinesSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure dbgLinesKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Warehouse: integer;
    BinLocation: string;
    FDisableNameChangeEvent: boolean;
    FPOrder: TPOrder;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure BuildStockUsageGrid;
    procedure FindStockandDeAllocate(tmpPart: string; tmpQty: integer);
    procedure FindStockandWaste(tmpPart: string; tmpQty: integer);
    procedure SetGridHeaders;
    procedure ShowDetails;
    procedure ShowLineDetails;
    procedure BuildLineGrid;
    procedure SetPOrder(const Value: TPOrder);
  private
    FActivated: boolean;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    bOK: boolean;
    property POrder: TPOrder read FPOrder write SetPOrder;
  end;

var
  frmWTMaintPurchaseOrderReceipts: TfrmWTMaintPurchaseOrderReceipts;

implementation

uses
  AllCommon, wtMain, System.UITypes;

{$R *.dfm}

procedure TfrmWTMaintPurchaseOrderReceipts.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try
    with IniFile do
    begin
(*      try
        WriteString('Centrereed Broker', 'Bench Stock Area', inttostr(dblkpProductionlocation.KeyValue));
      except
        WriteString('Centrereed Broker', 'Bench Stock Area', '0');
      end;
*)  end;
  finally
    IniFile.Free;
  end;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.FormCreate(Sender: TObject);
begin
  bOK := false;
  SetGridHeaders;

  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintPurchaseOrderReceipts.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin

    ShowDetails;
    ShowLineDetails;
    CheckOK(Self);

    FActivated := true;
  end;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.ShowDetails;
begin
  edtNumber.text := inttostr(POrder.dbKey);
  dtTransaction.Date := date;

  edtSupplierName.text := POrder.SupplierName;
  edtDeliveryNote.Text := POrder.Lines[0].DELNoteNumber ;
  edtGRN.Text := POrder.Lines[0].GRNNumber;
  edtReference.Text := POrder.Reference;

  stsbrDetails.Panels[0].Text := 'Created by: ' + POrder.OperatorName;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.ShowLineDetails;
begin
  BuildLineGrid;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.BuildLineGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with dbgLines, POrder.datamodule do
    begin
      for i := 0 to pred(POrder.Lines.count) do
        begin
        cells[0,i+1] := inttostr(POrder.Lines[i].POLNumber);
        cells[1,i+1] := POrder.Lines[i].Description;
        cells[2,i+1] := POrder.Lines[i].SupplierStockCode;
        cells[3,i+1] := inttostr(POrder.Lines[i].SlabLength) + 'mm x ' + inttostr(POrder.Lines[i].SlabDepth) + 'mm ' + POrder.Lines[i].SlabDescription;
        cells[4,i+1] := floattostr(POrder.Lines[i].Quantity);

        if POrder.Lines[i].GRNNumber <> '' then
          cells[5,i+1] := floattostr(POrder.Lines[i].QtyDelivered)
        else
          cells[5,i+1] := floattostr(POrder.Lines[i].Quantity);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.SetButtons(Sender: TObject; Field: TField);
begin
(*  with dtmdlStockUsage do
  begin
    btnOK.Enabled := (PartCount > 0);
    btnExcel.Enabled := (PartCount > 0);
    stsBrDetails.panels[0].text := inttostr(PartCount) + ' records displayed';
  end;
*)
end;

procedure TfrmWTMaintPurchaseOrderReceipts.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
//  ShowStockUsage;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.dblkpProductionLocationClick(Sender: TObject);
begin
(*  with dtmdlStockUsage.qryGetProductionLocation do
    begin
      close;
      parambyname('Production_Location').asinteger := dblkpProductionLocation.keyvalue;
      open;
      Warehouse := fieldbyname('Part_Store').asinteger;
      BinLocation := fieldbyname('Part_bin').asstring;
      lblBinLocation.caption := 'Associated Bin: ' + BinLocation;
    end;

*)
  if DisableNameChangeEvent then
    exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.ClearGrid(TempGrid: TStringGrid);
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

procedure TfrmWTMaintPurchaseOrderReceipts.BuildStockUsageGrid;
var
  icount: integer;
begin
  icount := 0;
(*  dtmdlStockUsage.RefreshStockUsage;
  with sgDetails, dtmdlStockUsage.qryStockUsage do
    begin
      while eof <> true do
        begin
        cells[0,icount+1] := fieldbyname('Part').asstring;
        cells[1,icount+1] := fieldbyname('Part_Description').asstring;
        cells[2,icount+1] := fieldbyname('Customer_Name').asstring;
        cells[3,icount+1] := formatfloat('###0',fieldbyname('Quantity_Allocated').asfloat);
        cells[4,icount+1] := '0';
        cells[5,icount+1] := '0';
        icount := icount + 1;
        next;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
*)
end;

procedure TfrmWTMaintPurchaseOrderReceipts.dbgLinesDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (vRow <> 0) and (vCol <> 0) then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[vCol, vRow]);
    end;
  end;

  {If Heading Display Left justified in the cells}
  with dbgLines do
  begin
    if vCol < 3 then
    begin
      StrPCopy(Txt, Cells[vCol, vRow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_RIGHT or TA_CENTER) or TA_LEFT);
      ExtTextOut(Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
    else
    begin
      {Display the Columns Right justified in the cells}
      StrPCopy(Txt, Cells[vCol, vRow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
      ExtTextOut(Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
  end;

  with Sender as TStringGrid, Canvas do
  begin
(*    if (gdselected in State) then
    begin
      //draw a box around the selected cell
//      pen.Color := clHighlight;
      pen.Color := clred;
      pen.Width := 2;
      polyline([point(rect.left+1,rect.top+1),
                point(rect.right-2,rect.top+1),
                point(rect.right-2,rect.bottom-2),
                point(rect.left+1,rect.bottom-2),
                point(rect.left+1,rect.top+1)]);
    end;
*)
    if (vRow = 0) then
    begin
      //default drawing has been switched off in the grid so we have
      //to draw the highlight and shadow on 3d boxes
      pen.color := clBtnHighlight;
      polyline([point(rect.left,rect.bottom-1),
                point(rect.left,rect.top),
                point(rect.right,rect.top)]);
      pen.color := clBtnShadow;
      polyline([point(rect.right-1,rect.top+1),
                point(rect.right-1,rect.bottom-1),
                point(rect.left,rect.bottom-1)]);
    end;
  end;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.dbgLinesSelectCell(Sender: TObject; Col,
  Row: Integer; var CanSelect: Boolean);
begin
	if (Col = 5) then
    dbgLines.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    dbgLines.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TfrmWTMaintPurchaseOrderReceipts.dbgLinesKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      with TStringGrid(ActiveControl) do
        begin
          if Col = 5 then
          begin
            col := 5;
            if row = pred(rowcount) then
              row := 1
            else
              row := row + 1;
            Exit;
          end
          else
          begin
            col := col + 1;
            Exit;
          end
        end;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.btnOKClick(Sender: TObject);
var
  irow: integer;
  sPart: string;
  iQty: integer;
  aLine: TPOLine;
begin
  // Check whether a futire date has been input
  if dtTransaction.Date > now then
    begin
      messagedlg('The Delivery date entered cannot be a future date, please enter an alternative date', mtError, [mbOk], 0);
      dtTransaction.SetFocus;
      exit;
    end;

  // Go and update the various files with the qtys input
  // store_stock, part_movement, sales_orders, part_store_allocation, part_transfer, sales_order_picking
  with POrder, dbgLines do
    begin
      for irow := 0 to pred(lines.count) do
        begin
          POrder.Lines[irow].DateReceived := dtTransaction.Date;
          POrder.Lines[irow].GRNNumber := edtGRN.text;
          POrder.Lines[irow].DELNoteNumber := edtDeliveryNote.text;
          POrder.Lines[irow].QtyDelivered := strtoint(cells[5, iRow+1]);
        end;
    end;

  POrder.SaveToDB(true);
  close;
  bOK := true;

end;

procedure TfrmWTMaintPurchaseOrderReceipts.FindStockandDeAllocate(tmpPart: string; tmpQty: integer);
var
  NewQty, MoveQty, AllocQty: integer;
  iStoreStock, iPackSize, iPalletID, iProductID: integer;
  iSalesOrder, iSalesOrderLine, iJobBagNumber: integer;
  rCost, rPurchaseOrder: real;
  sLot, sMoveType, sReference, sOvers: string;
  txnDate: TDateTime;
begin
(*  NewQty := tmpQty;
  with dtmdlStockUsage.qryGetStoreStock do
    begin
      close;
      parambyname('Part').asstring := tmpPart;
      parambyname('Part_Store').asinteger := Warehouse;
      parambyname('Part_bin').asstring := BinLocation;
      open;

      while eof <> true do
        begin
          if NewQty > fieldbyname('Quantity_allocated').asinteger then
            begin
              MoveQty := fieldbyname('Quantity_allocated').asinteger;
              NewQty := NewQty - MoveQty;
            end
          else
            begin
              MoveQty := NewQty;
              NewQty := NewQty - MoveQty;
            end;

          iStoreStock := fieldbyname('Store_stock').asinteger;
          iPackSize := fieldbyname('Stock_Pack_Quantity').asinteger;
          iPalletID := fieldbyname('Pallet_ID').asinteger;
          iProductID := fieldbyname('Product_ID').asinteger;
//          rCost := stPickDM.GetStoreStockCost(iStoreStock)*MoveQty;
          rPurchaseOrder := fieldbyname('Purchase_Order').asfloat;
          sOvers := fieldbyname('Stock_is_Overs').asstring;
          sLot := fieldbyname('Part_Store_Lot').asstring;
          sMoveType := 'J';
          txnDate := dtTransaction.Date;

// using the store_stock code get the part_store_allocation
          dtmdlStockUsage.qryGetPartAllocation.Close;
          dtmdlStockUsage.qryGetPartAllocation.parambyname('Store_Stock').asinteger := fieldbyname('Store_Stock').asinteger;
          dtmdlStockUsage.qryGetPartAllocation.Open;

          AllocQty := MoveQty;

          while dtmdlStockUsage.qryGetPartAllocation.eof <> true do
            begin
              if AllocQty > dtmdlStockUsage.qryGetPartAllocation.fieldbyname('Quantity_allocated').asinteger then
                begin
                  MoveQty := dtmdlStockUsage.qryGetPartAllocation.fieldbyname('Quantity_allocated').asinteger;
                  AllocQty := AllocQty - MoveQty;
                end
              else
                begin
                  MoveQty := AllocQty;
                  AllocQty := AllocQty - MoveQty;
                end;

              iSalesOrder := dtmdlStockUsage.qryGetPartAllocation.fieldbyname('Sales_Order').asinteger;
              iSalesOrderLine := dtmdlStockUsage.qryGetPartAllocation.Fieldbyname('Sales_order_line_no').asinteger;

              dtmdlStockUsage.qryGetJobNumber.Close;
              dtmdlStockUsage.qryGetJobNumber.parambyname('Sales_Order').asinteger := iSalesOrder;
              dtmdlStockUsage.qryGetJobNumber.Open;

              iJobBagNumber := dtmdlStockUsage.qryGetJobNumber.fieldbyname('Job_Bag').asinteger;

              sReference := 'Job Bag: ' + inttoStr(iJobBagNumber) + '  (SO/' + inttoStr(iSalesOrder) +')';

//          dtmdlStockMoves.DeAllocStock(iSalesOrder, MoveQty, 1, iSalesOrderLine) ;
              dtmdlStockMoves.DeAllocForwardStock(iStoreStock, iSalesOrder, MoveQty, 1, iSalesOrderLine) ;

              {Update the Sales Order status}
              dtmdlPicking.UpdateOrderStatus(iSalesOrder);

              {Update the job bag status}
              dtmdlPicking.UpdateJobBag(iSalesOrder);

              bReturns := true;
              if AllocQty <= 0 then
                break;
              dtmdlStockUsage.qryGetPartAllocation.next;
            end;

          if NewQty <= 0 then
            break;
          next;
        end;
    end;
*)
end;

procedure TfrmWTMaintPurchaseOrderReceipts.FindStockandWaste(tmpPart: string; tmpQty: integer);
var
  NewQty, MoveQty, AllocQty: integer;
  iStoreStock, iPackSize, iPalletID, iProductID: integer;
  iSalesOrder, iSalesOrderLine, iJobBagNumber: integer;
  rCost, rPurchaseOrder: real;
  sLot, sMoveType, sReference, sOvers: string;
  txnDate: TDateTime;
begin
(*  NewQty := tmpQty;
  with dtmdlStockUsage.qryGetStoreStock do
    begin
      close;
      parambyname('Part').asstring := tmpPart;
      parambyname('Part_Store').asinteger := Warehouse;
      parambyname('Part_bin').asstring := BinLocation;
      open;

      while eof <> true do
        begin
          if NewQty > fieldbyname('Quantity_allocated').asinteger then
            begin
              MoveQty := fieldbyname('Quantity_allocated').asinteger;
              NewQty := NewQty - MoveQty;
            end
          else
            begin
              MoveQty := NewQty;
              NewQty := NewQty - MoveQty;
            end;

          iStoreStock := fieldbyname('Store_stock').asinteger;
          iPackSize := fieldbyname('Stock_Pack_Quantity').asinteger;
          iPalletID := fieldbyname('Pallet_ID').asinteger;
          iProductID := fieldbyname('Product_ID').asinteger;
//          rCost := stPickDM.GetStoreStockCost(iStoreStock)*MoveQty;
          rPurchaseOrder := fieldbyname('Purchase_Order').asfloat;
          sOvers := fieldbyname('Stock_is_Overs').asstring;
          sLot := fieldbyname('Part_Store_Lot').asstring;
          sMoveType := 'W';
          txnDate := dtTransaction.Date;

// using the store_stock code get the part_store_allocation
          dtmdlStockUsage.qryGetPartAllocation.Close;
          dtmdlStockUsage.qryGetPartAllocation.parambyname('Store_Stock').asinteger := fieldbyname('Store_Stock').asinteger;
          dtmdlStockUsage.qryGetPartAllocation.Open;

          AllocQty := MoveQty;

          while dtmdlStockUsage.qryGetPartAllocation.eof <> true do
            begin
              if AllocQty > dtmdlStockUsage.qryGetPartAllocation.fieldbyname('Quantity_allocated').asinteger then
                begin
                  MoveQty := dtmdlStockUsage.qryGetPartAllocation.fieldbyname('Quantity_allocated').asinteger;
                  AllocQty := AllocQty - MoveQty;
                end
              else
                begin
                  MoveQty := AllocQty;
                  AllocQty := AllocQty - MoveQty;
                end;

              iSalesOrder := dtmdlStockUsage.qryGetPartAllocation.fieldbyname('Sales_Order').asinteger;
              iSalesOrderLine := dtmdlStockUsage.qryGetPartAllocation.Fieldbyname('Sales_order_line_no').asinteger;

              dtmdlStockUsage.qryGetJobNumber.Close;
              dtmdlStockUsage.qryGetJobNumber.parambyname('Sales_Order').asinteger := iSalesOrder;
              dtmdlStockUsage.qryGetJobNumber.Open;

              iJobBagNumber := dtmdlStockUsage.qryGetJobNumber.fieldbyname('Job_Bag').asinteger;

              sReference := 'Job Bag: ' + inttoStr(iJobBagNumber) + '  (SO/' + inttoStr(iSalesOrder) +')';

              {Update the store stock record - downdate allocated and stock quantity}
              dtmdlStockMoves.UpdStock(istorestock,tmpPart,Warehouse,BinLocation,sLot,sMoveType,sReference,txnDate,txnDate,(MoveQty*-1),0,iPackSize,(rCost*-1),rPurchaseOrder,iPalletID,iProductID,sOvers);

              {Update the sales order line delivery qty}
              dtmdlPicking.UpdateSalesOrder(iSalesOrder,iSalesOrderLine,MoveQty);

              {Update the sales order line invoice qty}
              dtmdlPicking.UpdateSalesOrderQtyInv(iSalesOrder,iSalesOrderLine,MoveQty);

              {Deallocate the stock on the sales order}
              dtmdlStockMoves.DeAllocForwardStock(iStoreStock, iSalesOrder, MoveQty, 1, iSalesOrderLine);

              {Update the Sales Order status}
              dtmdlPicking.UpdateOrderStatus(iSalesOrder);

              {Update the job bag status}
              dtmdlPicking.UpdateJobBag(iSalesOrder);
              if AllocQty <= 0 then
                break;
              dtmdlStockUsage.qryGetPartAllocation.next;
            end;

          if NewQty <= 0 then
            break;
          next;
        end;
    end;
*)
end;

procedure TfrmWTMaintPurchaseOrderReceipts.SetGridHeaders;
begin
  {Purchase Order header}
  dbgLines.cells[0,0] := 'Line';
  dbgLines.cells[1,0] := 'Description';
  dbgLines.cells[2,0] := 'Part Code';
  dbgLines.cells[3,0] := 'Slab Size (mm)';
  dbgLines.cells[4,0] := 'Quantity';
  dbgLines.cells[5,0] := 'Received';
end;

procedure TfrmWTMaintPurchaseOrderReceipts.CheckOK(Sender : TObject);
begin
  btnOK.enabled := (edtSupplierName.Text <> '') and
                    (edtDeliveryNote.Text <> '') and
                    (edtGRN.Text <> '') and
                    (edtReference.Text <> '');
end;

procedure TfrmWTMaintPurchaseOrderReceipts.SetPOrder(const Value: TPOrder);
begin
  FPOrder := Value;
end;

procedure TfrmWTMaintPurchaseOrderReceipts.FormShow(Sender: TObject);
begin
  edtDeliveryNote.SetFocus;
end;

end.
