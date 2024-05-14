unit STMaintStockReturns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBCtrls, StdCtrls, Buttons, ComCtrls, pbStockDM, stStockDM,
  DB, stPickingDM, IniFiles;

type
  TSTMaintStockReturnsFrm = class(TForm)
    stsbrDetails: TStatusBar;
    Panel2: TPanel;
    Label2: TLabel;
    edtSearch: TEdit;
    btbtnClose: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    dblkpProductionLocation: TDBLookupComboBox;
    sgdetails: TStringGrid;
    tmrSearch: TTimer;
    btnOK: TBitBtn;
    Label3: TLabel;
    dtTransaction: TDateTimePicker;
    lblBinLocation: TLabel;
    PrintBitBtn: TBitBtn;
    btnExcel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkpProductionLocationClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgdetailsDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgdetailsSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure sgdetailsKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    Warehouse: integer;
    BinLocation: string;
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetColumnHeaders;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure ShowStockUsage;
    procedure BuildStockUsageGrid;
    procedure FindStockandDeAllocate(tmpPart: string; tmpQty: integer);
    procedure FindStockandWaste(tmpPart: string; tmpQty: integer);
  private
    bReturns: boolean;
    iDefaultLocation: integer;
    FActivated: boolean;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    bOK: boolean;
    dtmdlStockUsage : TdtmdlStock;
    dtmdlStockMoves : TStStockDataMod;
    dtmdlPicking: TstPickDM;
  end;

var
  STMaintStockReturnsFrm: TSTMaintStockReturnsFrm;

implementation

uses UITypes, Types, FireDAC.Stan.Param, PBDatabase, CCSCommon, STRSStockReturns, pbMainMenu;

{$R *.dfm}

procedure TSTMaintStockReturnsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  iniFile: TIniFile;
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  with IniFile do
    begin
      try
        WriteString('Centrereed Broker', 'Bench Stock Area', inttostr(dblkpProductionlocation.KeyValue));
      except
        WriteString('Centrereed Broker', 'Bench Stock Area', '0');
      end;
      free;
    end;
end;

procedure TSTMaintStockReturnsFrm.FormCreate(Sender: TObject);
var
  TempArray: array[0..255] of Char;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  GetPrivateProfileString('Centrereed Broker', 'Bench Stock Area', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  try
    iDefaultLocation := strtoint(TempArray);
  except
    iDefaultLocation := 0;
  end;

  dtmdlStockMoves := TstStockDataMod.create(self);
  dtmdlStockUsage := TdtmdlStock.create(self);
  dtmdlPicking := TSTPickDM.create(self);
  dtmdlStockUsage.dtsStockUsage.OnDataChange := SetButtons;
  FActivated := false;
  bReturns := false;
  SetColumnHeaders;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TSTMaintStockReturnsFrm.FormActivate(Sender: TObject);
begin
  if not Factivated then
    begin
      dtTransaction.date := date;
      dblkpProductionLocation.listsource := dtmdlStockUsage.dtsProductionLocation;

      with dtmdlStockUsage.dtsProductionLocation.DataSet do
        begin
          close;
          open;
          if recordcount = 1 then
            begin
              dblkpProductionLocation.KeyValue := fieldbyname('Production_location').asinteger;
              dblkpProductionLocationClick(self);
            end
          else
            begin
              dblkpProductionLocation.KeyValue := iDefaultLocation;
              dblkpProductionLocationClick(self);
            end;
        end;

//      dblkpProductionLocation.KeyValue := dmBroker.GetDefaultWarehouse;
      FActivated := true;
    end;

//  ShowStockUsage;
end;

procedure TSTMaintStockReturnsFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TSTMaintStockReturnsFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlStockUsage do
  begin
    btnOK.Enabled := (PartCount > 0);
    btnExcel.Enabled := (PartCount > 0);
    stsBrDetails.panels[0].text := inttostr(PartCount) + ' records displayed';
  end;
end;

procedure TSTMaintStockReturnsFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlStockUsage.Warehouse := Warehouse;
  dtmdlStockUsage.BinLocation := BinLocation;
//dtmdlStockUsage.RefreshStockUsage;
  ShowStockUsage;
end;

procedure TSTMaintStockReturnsFrm.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlStockUsage.ProductCode := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSTMaintStockReturnsFrm.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TSTMaintStockReturnsFrm.dblkpProductionLocationClick(Sender: TObject);
begin
  with dtmdlStockUsage.qryGetProductionLocation do
    begin
      close;
      parambyname('Production_Location').asinteger := dblkpProductionLocation.keyvalue;
      open;
      Warehouse := fieldbyname('Part_Store').asinteger;
      BinLocation := fieldbyname('Part_bin').asstring;
      lblBinLocation.caption := 'Associated Bin: ' + BinLocation;
    end;

  if DisableNameChangeEvent then
    exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSTMaintStockReturnsFrm.FormDestroy(Sender: TObject);
begin
  dtmdlPicking.free;
  dtmdlStockUsage.free;
  dtmdlStockMoves.free;
end;

procedure TSTMaintStockReturnsFrm.SetColumnHeaders;
begin
  with sgDetails do
    begin
      cells[0,0] := 'Product';
      cells[1,0] := 'Description';
      cells[2,0] := 'Customer';
      cells[3,0] := 'Stock';
      cells[4,0] := 'Return';
      cells[5,0] := 'Wastage';
    end;
end;

procedure TSTMaintStockReturnsFrm.ShowStockUsage;
begin
  ClearGrid(sgDetails);  {Clear contents of Line grid}
  BuildStockUsageGrid;
end;

procedure TSTMaintStockReturnsFrm.ClearGrid(TempGrid: TStringGrid);
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

procedure TSTMaintStockReturnsFrm.BuildStockUsageGrid;
var
  icount: integer;
begin
  icount := 0;
  dtmdlStockUsage.RefreshStockUsage;
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
end;

procedure TSTMaintStockReturnsFrm.sgdetailsDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Content: string;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if vRow <> 0 then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[vCol, vRow]);
    end;
  end;

  {If Heading Display Left justified in the cells}
  with sgDetails do
  begin
    if vCol < 3 then
    begin
      Content := Cells[vCol, vRow];
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_RIGHT or TA_CENTER) or TA_LEFT);
      ExtTextOut(Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Content, Length(Content), nil);
    end
    else
    begin
      {Display the Columns Right justified in the cells}
      Content := Cells[vCol, vRow];
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
      ExtTextOut(Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Content, Length(Content), nil);
    end;
  end;

  with Sender as TStringGrid, Canvas do
  begin
    if (gdselected in State) then
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

procedure TSTMaintStockReturnsFrm.sgdetailsSelectCell(Sender: TObject; Col,
  Row: Integer; var CanSelect: Boolean);
begin
	if (Col = 4) or (Col = 5) then
    sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TSTMaintStockReturnsFrm.sgdetailsKeyPress(Sender: TObject;
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

procedure TSTMaintStockReturnsFrm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      with TStringGrid(ActiveControl) do
        begin
          if Col = 5 then
          begin
            col := 4;
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

procedure TSTMaintStockReturnsFrm.btnOKClick(Sender: TObject);
var
  irow: integer;
  sPart: string;
  iQty: integer;
begin
  // Check whether a futire date has been input
  if dtTransaction.Date > now then
    begin
      messagedlg('The Transaction date entered cannot be a future date, please enter an alternative date', mtError, [mbOk], 0);
      dtTransaction.SetFocus;
      exit;
    end;
  // Go and update the various files with the qtys input
  // store_stock, part_movement, sales_orders, part_store_allocation, part_transfer, sales_order_picking
  with sgDetails do
    begin
      for irow := 1 to pred(rowcount) do
        begin
          if (strtoint(cells[4,irow]) > 0) or (strtoint(cells[5,irow]) > 0) then
          if ((strtoint(cells[4,irow])) + (strtoint(cells[5,irow]))) > strtoint(cells[3,irow]) then
            begin
              messagedlg('The total returns and wastage quantities entered for product ' + cells[0,irow] + ' is greater than the available quantity!', mtError, [mbOk], 0);
              sgDetails.SetFocus;
              row := irow; col := 4;
              exit;
            end;
        end;
    end;

  with sgDetails do
    begin
      for irow := 1 to pred(rowcount) do
        begin
          if ((cells[4,irow] = '0') or (cells[4,irow] = '')) and ((cells[5,irow] = '0') or (cells[5,irow] = '')) then
            continue;
          sPart := cells[0,irow];
          iQty := strtoint(cells[4,irow]);
          if iqty <> 0 then
            FindStockandDeAllocate(sPart, iQty);
          iQty := strtoint(cells[5,irow]);
          if iqty <> 0 then
            FindStockandWaste(sPart, iQty);
        end;
    end;

  if bReturns then
    begin
    if MessageDlg('Do you want to print a returns report?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        STRSStockReturnsfrm := TSTRSStockReturnsfrm.Create(self);
        try
          STRSStockReturnsfrm.showmodal;
        finally
          STRSStockReturnsfrm.free;
        end
      end;
    end;

  close;
  bOK := true;
end;

procedure TSTMaintStockReturnsFrm.FindStockandDeAllocate(tmpPart: string; tmpQty: integer);
var
  NewQty, MoveQty, AllocQty: integer;
  iStoreStock, iPackSize, iPalletID, iProductID: integer;
  iSalesOrder, iSalesOrderLine, iJobBagNumber: integer;
  rCost, rPurchaseOrder: real;
  sLot, sMoveType, sReference, sOvers: string;
  txnDate: TDateTime;
begin
  NewQty := tmpQty;
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
end;

procedure TSTMaintStockReturnsFrm.FindStockandWaste(tmpPart: string; tmpQty: integer);
var
  NewQty, MoveQty, AllocQty: integer;
  iStoreStock, iPackSize, iPalletID, iProductID: integer;
  iSalesOrder, iSalesOrderLine, iJobBagNumber: integer;
  rCost, rPurchaseOrder: real;
  sLot, sMoveType, sReference, sOvers: string;
  txnDate: TDateTime;
begin
  NewQty := tmpQty;
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
end;

procedure TSTMaintStockReturnsFrm.PrintBitBtnClick(Sender: TObject);
begin
    STRSStockReturnsfrm := TSTRSStockReturnsfrm.Create(self);
    try
      STRSStockReturnsfrm.showmodal;
    finally
      STRSStockReturnsfrm.free;
    end
end;

procedure TSTMaintStockReturnsFrm.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportGridToExcel(STMaintStockReturnsFrm);
end;

end.
