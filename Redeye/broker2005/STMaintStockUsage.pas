unit STMaintStockUsage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Grids,
  DBCtrls, StdCtrls, Buttons, ComCtrls, pbStockDM, stStockDM, Vcl.Themes, DB, stPickingDM, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintStockUsageFrm = class(TForm)
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
    Panel1: TPanel;
    btnChange: TBitBtn;
    qryAddPartAlloc: TFDQuery;
    qryGetStoreStock: TFDQuery;
    btnInsert: TBitBtn;
    btnMovements: TBitBtn;
    btnExcel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkpProductionLocationClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgdetailsDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sgdetailsSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);
    procedure sgdetailsKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnMovementsClick(Sender: TObject);
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
    procedure FindStockandMove(tmpPart: string; tmpQty: integer);
    procedure FindStockandAdjustOut(tmpPart: string; tmpQty, Line: integer);
    procedure CallMaintScreen(tempMode: string);
    procedure UpdateStockLevel(tempPart: string; MoveQty: integer; line: integer);
  private
    iSelectedRow: integer;
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
  STMaintStockUsageFrm: TSTMaintStockUsageFrm;

implementation

uses UITypes, Types, PBDatabase, CCSCommon, STMaintStockUsageLine, STLUStkMvmnts,
  pbMainMenu;

{$R *.dfm}

procedure TSTMaintStockUsageFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  IniFile : TIniFile;
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

procedure TSTMaintStockUsageFrm.FormCreate(Sender: TObject);
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
  SetColumnHeaders;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TSTMaintStockUsageFrm.FormActivate(Sender: TObject);
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

procedure TSTMaintStockUsageFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TSTMaintStockUsageFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlStockUsage do
  begin
    btnOK.Enabled := (PartCount > 0);
    btnChange.Enabled := (PartCount > 0);
    btnMovements.Enabled := (PartCount > 0);
    btnExcel.Enabled := (PartCount > 0);
    stsBrDetails.panels[0].text := inttostr(PartCount) + ' records displayed';
  end;
end;

procedure TSTMaintStockUsageFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlStockUsage.Warehouse := Warehouse;
  dtmdlStockUsage.BinLocation := BinLocation;
//dtmdlStockUsage.RefreshStockUsage;
  ShowStockUsage;
end;

procedure TSTMaintStockUsageFrm.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlStockUsage.ProductCode := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSTMaintStockUsageFrm.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TSTMaintStockUsageFrm.dblkpProductionLocationClick(Sender: TObject);
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
  iSelectedRow := 0;
  if DisableNameChangeEvent then
    exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSTMaintStockUsageFrm.FormDestroy(Sender: TObject);
begin
  dtmdlPicking.free;
  dtmdlStockUsage.free;
  dtmdlStockMoves.free;
end;

procedure TSTMaintStockUsageFrm.SetColumnHeaders;
begin
  with sgDetails do
    begin
      cells[0,0] := 'Product';
      cells[1,0] := 'Description';
      cells[2,0] := 'In Stock';
      cells[3,0] := 'On Order';
      cells[4,0] := 'Usage';
    end;
end;

procedure TSTMaintStockUsageFrm.ShowStockUsage;
begin
  ClearGrid(sgDetails);  {Clear contents of Line grid}
  BuildStockUsageGrid;
end;

procedure TSTMaintStockUsageFrm.ClearGrid(TempGrid: TStringGrid);
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

procedure TSTMaintStockUsageFrm.BuildStockUsageGrid;
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
        cells[2,icount+1] := formatfloat('###0',fieldbyname('Quantity_Allocated').asfloat);
        cells[3,icount+1] := formatfloat('###0',fieldbyname('Quantity_On_Order').asfloat);
        cells[4,icount+1] := '0';
        icount := icount + 1;
        next;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
end;

procedure TSTMaintStockUsageFrm.sgdetailsDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
const
  CELL_PADDING = 4;
var
  Grid: TStringGrid;
  Content: string;
  TextFormat: TTextFormat;
  CellRect: TRect;
begin
  if not (Sender is TStringGrid) then
    Exit;

  Grid := Sender as TStringGrid;
  Content := Grid.Cells[ACol, ARow];
  CellRect := Rect;

  // Header row handling (row 0)
  if ARow = 0 then
  begin
    // Header background
    Grid.Canvas.Brush.Color := clBtnFace;
    Grid.Canvas.FillRect(Rect);

    // Header text style
    Grid.Canvas.Font.Color := clWindowText;
    Grid.Canvas.Font.Style := [fsBold];

    // Text alignment and drawing
    TextFormat := [tfVerticalCenter, tfSingleLine, tfEndEllipsis];
    if ACol < 2 then
      TextFormat := TextFormat + [tfLeft]
    else
      TextFormat := TextFormat + [tfRight];

    InflateRect(CellRect, -CELL_PADDING, -CELL_PADDING);
    Grid.Canvas.TextRect(CellRect, Content, TextFormat);

    // 3D border effect
    Grid.Canvas.Pen.Width := 1;

    // Top and left highlight
    Grid.Canvas.Pen.Color := clBtnHighlight;
    Grid.Canvas.MoveTo(Rect.Left, Rect.Bottom - 1);
    Grid.Canvas.LineTo(Rect.Left, Rect.Top);
    Grid.Canvas.LineTo(Rect.Right, Rect.Top);

    // Bottom and right shadow
    Grid.Canvas.Pen.Color := clBtnShadow;
    Grid.Canvas.MoveTo(Rect.Right - 1, Rect.Top);
    Grid.Canvas.LineTo(Rect.Right - 1, Rect.Bottom - 1);
    Grid.Canvas.LineTo(Rect.Left - 1, Rect.Bottom - 1);

    Exit;
  end;

  // Normal cell handling
  begin
    // Background
    Grid.Canvas.Brush.Color := clWindow;
    Grid.Canvas.FillRect(Rect);

    // Text properties
    Grid.Canvas.Font.Color := clWindowText;
    Grid.Canvas.Font.Style := [];

    // Text alignment and drawing
    TextFormat := [tfVerticalCenter, tfSingleLine, tfEndEllipsis];
    if ACol < 2 then
      TextFormat := TextFormat + [tfLeft]
    else
      TextFormat := TextFormat + [tfRight];

    InflateRect(CellRect, -CELL_PADDING, -CELL_PADDING);
    Grid.Canvas.TextRect(CellRect, Content, TextFormat);
  end;

  // Selection handling
  if (gdSelected in State) and (ARow > 0) then
  begin
    Grid.Canvas.Pen.Color := clHighlight;
    Grid.Canvas.Pen.Width := 2;
    Grid.Canvas.Pen.Style := psSolid;

    Grid.Canvas.Rectangle(
      Rect.Left + 1,
      Rect.Top + 1,
      Rect.Right - 1,
      Rect.Bottom - 1
    );
  end;
end;

procedure TSTMaintStockUsageFrm.sgdetailsSelectCell(Sender: TObject; Col,
  Row: Integer; var CanSelect: Boolean);
begin
	if (Col = 4) then
    sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TSTMaintStockUsageFrm.sgdetailsKeyPress(Sender: TObject;
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

procedure TSTMaintStockUsageFrm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      with TStringGrid(ActiveControl) do
        begin
          if Col = 4 then
          begin
            if row = pred(rowcount) then
              row := 1
            else
              row := row + 1;
            Exit;
          end;
        end;
end;

procedure TSTMaintStockUsageFrm.btnOKClick(Sender: TObject);
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
          if strtoint(cells[4,irow]) > 0 then
          if strtoint(cells[4,irow]) > (strtoint(cells[2,irow]) + strtoint(cells[3,irow])) then
            begin
              messagedlg('The usage quantity entered for product ' + cells[0,irow] + ' is greater than the available quantity!', mtError, [mbOk], 0);
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
          if (cells[4,irow] = '0') or (cells[4,irow] = '') then
            continue;
          sPart := cells[0,irow];
          iQty := strtoint(cells[4,irow]);
          FindStockandMove(sPart, iQty);
        end;
    end;
  close;
  bOK := true;
end;

procedure TSTMaintStockUsageFrm.FindStockandMove(tmpPart: string; tmpQty: integer);
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
          rCost := 0;
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

procedure TSTMaintStockUsageFrm.FindStockandAdjustOut(tmpPart: string; tmpQty, Line: integer);
var
  NewQty, MoveQty, AllocQty: integer;
  iStoreStock, iPackSize, iPalletID, iProductID: integer;
  iSalesOrder, iSalesOrderLine, iJobBagNumber: integer;
  rCost, rPurchaseOrder: real;
  sLot, sMoveType, sReference, sOvers: string;
  txnDate: TDateTime;
  iNewTotal: integer;
begin
  NewQty := tmpQty;
  MoveQty := 0;
  with dtmdlStockUsage do
  begin
    qryGetStoreStock.close;
    qryGetStoreStock.parambyname('Part').asstring := tmpPart;
    qryGetStoreStock.parambyname('Part_Store').asinteger := Warehouse;
    qryGetStoreStock.parambyname('Part_bin').asstring := BinLocation;
    qryGetStoreStock.open;

    while not qryGetStoreStock.Eof do
    begin
      if NewQty > qryGetStoreStock.fieldbyname('Quantity_allocated').asinteger then
      begin
        MoveQty := qryGetStoreStock.fieldbyname('Quantity_allocated').asinteger;
        NewQty := NewQty - MoveQty;
      end
      else
      begin
        MoveQty := NewQty;
        NewQty := NewQty - MoveQty;
      end;

      iStoreStock := qryGetStoreStock.fieldbyname('Store_stock').asinteger;
      iPackSize := qryGetStoreStock.fieldbyname('Stock_Pack_Quantity').asinteger;
      iPalletID := qryGetStoreStock.fieldbyname('Pallet_ID').asinteger;
      iProductID := qryGetStoreStock.fieldbyname('Product_ID').asinteger;
//          rCost := stPickDM.GetStoreStockCost(iStoreStock)*MoveQty;
      rPurchaseOrder := qryGetStoreStock.fieldbyname('Purchase_Order').asfloat;
      sOvers := qryGetStoreStock.fieldbyname('Stock_is_Overs').asstring;
      sLot := qryGetStoreStock.fieldbyname('Part_Store_Lot').asstring;
      sMoveType := 'B';
      txnDate := dtTransaction.Date;

// using the store_stock code get the part_store_allocation
      dtmdlStockUsage.qryGetPartAllocation.Close;
      dtmdlStockUsage.qryGetPartAllocation.parambyname('Store_Stock').asinteger := qryGetStoreStock.fieldbyname('Store_Stock').asinteger;
      dtmdlStockUsage.qryGetPartAllocation.Open;

      AllocQty := MoveQty;

      while not dtmdlStockUsage.qryGetPartAllocation.Eof do
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

        sReference := 'Bench Stock Adjustment';

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
      qryGetStoreStock.Next;
    end;

    if line = 0 then
    begin
      edtSearch.Text := tmpPart;
    end
    else
    begin
      iNewTotal := strtoint(sgDetails.cells[2,line]) - MoveQty;
      sgDetails.cells[2,line] := inttostr(iNewTotal);
    end;
  end;
end;

procedure TSTMaintStockUsageFrm.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TSTMaintStockUsageFrm.CallMaintScreen(tempMode: string);
var
  inx: integer;
  sPart: string;
begin
  inx := sgDetails.row;
  sPart := '';

  STMaintStockUsageLinefrm := TSTMaintStockUsageLinefrm.create(self);
  try
    if tempMode = 'A' then
      begin
        inx := 0;
        STMaintStockUsageLinefrm.edtProduct.text := '';
        STMaintStockUsageLinefrm.lblDescription.caption := '';
      end;
    if tempMode = 'C' then
      begin
        STMaintStockUsageLinefrm.edtProduct.text := sgDetails.cells[0,inx];
        STMaintStockUsageLinefrm.lblDescription.caption := sgDetails.cells[1,inx];
        STMaintStockUsageLinefrm.memNewStock.text := sgDetails.cells[2,inx];
        STMaintStockUsageLinefrm.memInStock.text := sgDetails.cells[2,inx];
      end;
    STMaintStockUsageLinefrm.Mode := tempMode;
    STMaintStockUsageLinefrm.showmodal;
    sPart := trim(STMaintStockUsageLineFrm.edtProduct.text);
    if STMaintStockUsageLinefrm.bOK then
      if STMaintStockUsageLinefrm.DiffValue > 0 then
        UpdateStockLevel(sPart,STMaintStockUsageLinefrm.DiffValue, inx)
      else
        FindStockandAdjustOut(sPart, STMaintStockUsageLinefrm.DiffValue*-1, inx);
  finally
    STMaintStockUsageLinefrm.free;
  end;
end;

procedure TSTMaintStockUsageFrm.UpdateStockLevel(tempPart: string; MoveQty: integer; line: integer);
var
  sTempRef, sDescription, sTempLot, sTempType: string;
  sTempDate: TDateTime;
  iStoreStock: integer;
  iNewTotal: integer;
begin
  sTempRef := 'Bench Adjustment';
  sDescription := 'Bench Adjustment';
  sTempLot := '';
  sTempDate := date;

// add the stock details
  if MoveQty <> 0 then
    begin
      if MoveQty > 0 then
        sTempType := 'A'
      else
        sTempType := 'B';

      sTempLot := dtmdlStockMoves.GetNextLot(tempPart);

      dtmdlStockMoves.AddStoreStock(tempPart, Warehouse, BinLocation, sTempLot,
          sTempType, sTempRef, sTempDate, sTempDate, MoveQty, MoveQty, 1, 0, sDescription, 'Y', 1, 0, 0, 'N');

      {Get the latest Store Stock record}
      with qryGetStoreStock do
        begin
          close;
          parambyname('Part').asstring := tempPart;
          parambyname('Part_Store').asinteger := Warehouse;
          parambyname('Part_Bin').asstring := BinLocation;
          parambyname('Part_Store_Lot').asstring := sTempLot;
          parambyname('Store_Quantity').asinteger := MoveQty;
          parambyname('Date_Received').asdatetime := sTempDate;
          open;

          iStoreStock := fieldbyname('Store_Stock').asinteger;
        end;

      {insert Part_Allocation record}
      with qryAddPartAlloc do
        begin
          close;
          parambyname('Store_Stock').AsInteger := iStoreStock;
          parambyname('Part').asstring := tempPart;
          parambyname('Quantity_Allocated').Asinteger := MoveQty;
          execsql;
        end;

      if line = 0 then
        begin
          edtSearch.Text := tempPart;
        end
      else
        begin
          iNewTotal := strtoint(sgDetails.cells[2,line]) + MoveQty;
          sgDetails.cells[2,line] := inttostr(iNewTotal);
        end;
    end;
end;

procedure TSTMaintStockUsageFrm.btnInsertClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TSTMaintStockUsageFrm.btnMovementsClick(Sender: TObject);
var
  inx: integer;
  sPart, sPartDesc: string;
begin
  inx := sgDetails.row;
  sPart := sgDetails.Cells[0,inx];
  sPartDesc := sgDetails.Cells[1,inx];
  try
    with dtmdlStockUsage.qryPartMvmnts do
    begin
      close;
      paramByName('Part').AsString := sPart;
      open;
    end;
    STLUStkMvmntsFrm := TSTLUStkMvmntsFrm.Create(self);
    STLUStkMvmntsFrm.dtmdlStockEnquiry := dtmdlStockUsage;

    if dtmdlStockUsage.qryPartMvmnts.RecordCount = 0 then
    begin
      MessageDlg('There are no movements for this product', mtInformation, [mbOk], 0);
      dtmdlStockUsage.qryPartMvmnts.close;
      exit;
    end;

    STLUStkMvmntsFrm.lblPartCode.Caption := sPart;
    STLUStkMvmntsFrm.lblPartDesc.Caption := sPartDesc;
    STLUStkMvmntsFrm.lblTotalStock.Caption := '';
    STLUStkMvmntsFrm.lblFreeStock.Caption := '';

    STLUStkMvmntsFrm.ShowModal;
  finally
    STLUStkMvmntsFrm.Free;
  end;
  dtmdlStockUsage.qryPartMvmnts.close;

end;

procedure TSTMaintStockUsageFrm.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportGridToExcel(STMaintStockUsageFrm);
end;

end.
