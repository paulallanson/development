unit STMaintSalesOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBCtrls, StdCtrls, ComCtrls, Buttons, ExtCtrls, STSOObjects,
  STStockDM;

type
  TfrmSTMaintSalesOrder = class(TForm)
    pnlFooter: TPanel;
    btnConfirm: TBitBtn;
    CancelBitBtn: TBitBtn;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label5: TLabel;
    OrdNoLabel: TLabel;
    Label2: TLabel;
    DateEdit: TEdit;
    Label8: TLabel;
    DtReqEdit: TEdit;
    Label9: TLabel;
    edtAccountManager: TEdit;
    edtAccountTeam: TEdit;
    Label19: TLabel;
    pnlHead: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    CustNameEdit: TEdit;
    ContactEdit: TEdit;
    OrdEdit: TEdit;
    DeliveryEdit: TEdit;
    Label4: TLabel;
    Label14: TLabel;
    StoreComboBox: TDBLookupComboBox;
    Label1: TLabel;
    lblJobBagNumber: TLabel;
    sgLines: TStringGrid;
    dbLkpCmbRep: TDBLookupComboBox;
    chkbxDoNotInvc: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure sgLinesDblClick(Sender: TObject);
    procedure chkbxDoNotInvcClick(Sender: TObject);
  private
    bConfirm: boolean;
    SOStockDm: TSTStockDataMod;
    trueSOHeadStat: integer;
    FJobBagNo: integer;
    procedure SetJobBagNo(const Value: integer);
    procedure ShowHeaderDetails;
    procedure BuildLineGrid;
    procedure SetLineHeaders;
    procedure ShowLineDetails;
    function OKChanging: Boolean;
    function OKSaving: Boolean;
    procedure UpdateStoreStock;
    procedure CallMaintScreen(aMode: char);
    procedure CallMaintValuesScreen(aMode: char);
    procedure UpdateSalesOrderLines;
    procedure ReducePartAllocation(tempLine, tempQty: integer);
    procedure IncreasePartAllocation(tempLine, tempQty: integer);
    procedure UpdateJobBag;
    procedure UpdatePartTransfer;
    procedure AdjustOutWastage(tempLine, tempQty: integer);
    procedure LoadLineDetails;
    procedure DeletePartTransfer(tempCode: integer);
    procedure UpdatePartTransferQty(tempCode, tempQty: integer);
    procedure UpdateSalesOrderLineValues;
    { Private declarations }
  public
    Mode: Char;
    SalesOrderNo: integer;
    bOK: Boolean;
    property JobBagNo: integer read FJobBagNo write SetJobBagNo;
  end;

var
  frmSTMaintSalesOrder: TfrmSTMaintSalesOrder;

implementation

uses FireDAC.Stan.Param, UITypes, STSODataMod, STMaintSalesOrderLine, STMaintSalesOrderLineValues, CCSCommon;

{$R *.dfm}

{ TfrmSTMaintSalesOrder }

procedure TfrmSTMaintSalesOrder.SetJobBagNo(const Value: integer);
begin
  FJobBagNo := Value;
end;

procedure TfrmSTMaintSalesOrder.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;
  STSalesOrdDM := TStSalesOrdDM.Create(Self);
  SalesOrder := TSalesOrder.Create(STSalesOrdDM);
  SetLineHeaders;
  chkbxDoNotInvC.visible := (Mode = 'J');
end;

procedure TfrmSTMaintSalesOrder.SetLineHeaders;
begin
  sgLines.Cells[0, 0] := 'Line';
  sgLines.Cells[1, 0] := 'Part';
  sgLines.Cells[2, 0] := 'Description';
  sgLines.Cells[3, 0] := 'Ordered';
  sgLines.Cells[4, 0] := 'Overs';
  sgLines.Cells[5, 0] := 'Produced';
  sgLines.Cells[6, 0] := 'Price';
  sgLines.Cells[7, 0] := 'Price Unit';
  sgLines.Cells[8, 0] := 'Total';
  sgLines.Cells[0, 1] := '';
  sgLines.Cells[1, 1] := '';
  sgLines.Cells[2, 1] := '';
  sgLines.Cells[3, 1] := '';
  sgLines.Cells[4, 1] := '';
  sgLines.Cells[5, 1] := '';
  sgLines.Cells[6, 1] := '';
  sgLines.Cells[7, 1] := '';
  sgLines.Cells[8, 1] := '';

  sgLines.rowcount := 2;
  sgLines.colwidths[9] := -1;
end;


procedure TfrmSTMaintSalesOrder.FormActivate(Sender: TObject);
begin
  SalesOrder.SONumber := SalesOrderNo;
  SalesOrder.FuncMode := Mode;
  STSalesOrdDm.LoadSOFromDatabase(SalesOrder);

  STSalesOrdDm.StoreSQL.Close;
  STSalesOrdDm.StoreSQL.Open;
  
  STSalesOrdDm.RepSQL.Close;
  STSalesOrdDm.RepSQL.parambyname('Rep').asinteger := SalesOrder.Rep;
  STSalesOrdDm.RepSQL.Open;
  
  ShowHeaderDetails;
  LoadLineDetails;
  ShowLineDetails;
end;

procedure TfrmSTMaintSalesOrder.ShowHeaderDetails;
var
  tempStatus: integer;
begin
  DateEdit.Text := DateToStr(SalesOrder.DatePoint);
  DtReqEdit.Text := DateToStr(SalesOrder.DateReq);
  OrdNoLabel.Caption := IntToStr(SalesOrder.SONumber);
  lblJobBagNumber.caption := IntToStr(JobBagNo);

  OrdEdit.Text := SalesOrder.CustOrderNo;
  dbLkpCmbRep.keyvalue := salesOrder.RepLines[0].rep;

  CustNameEdit.Text := Salesorder.CustomerName + '/' + SalesOrder.BranchName;
  edtAccountManager.Text := SalesOrder.AccountManagerName;

  edtAccountTeam.Text := STSalesOrdDM.GetAccountTeamName(SalesOrder.AccountTeam);
  ContactEdit.Text := SalesOrder.ContactName;
  StoreComboBox.KeyValue := SalesOrder.PartStore;

  DeliveryEdit.text := STSalesOrdDM.GetProductionName(SalesOrder.ProductionLocation);

  tempStatus := STSalesOrdDM.ConfirmSOStatus(SalesOrder);
  if  (SalesOrder.SOHeadStatus >= shDespConfirmed) and
    ((SalesOrder.SOHeadStatus < shFullyInvoiced)
    or (tempStatus < 250)) then
  begin
    chkbxDoNotInvc.visible := true;
    //the status of the order has been set to fully invoiced using the Do not invoice
    //checkbox. so have to allow for the undoing of this by looking up the status
    //based on what sales invoices have been raised
    chkbxDoNotInvc.Checked := (SalesOrder.SOHeadStatus = shFullyInvoiced);
    self.trueSOHeadStat := tempStatus;
  end
  else
  begin
    chkbxDoNotInvc.visible := false;
  end;

end;

procedure TfrmSTMaintSalesOrder.ShowLineDetails;
begin
  BuildLineGrid;
end;

procedure TfrmSTMaintSalesOrder.BuildLineGrid;
var
  i, icount: integer;
  inx: integer;
begin
  inx := 0;
  for icount := 0 to Pred(SalesOrder.OrderLines.Count) do
    with SalesOrder.OrderLines[iCount] do
    begin
        with sgLines do
        begin
          Inc(inx);
          Cells[0, inx] := IntToStr(inx);     //IntToStr(Line);
          Cells[1, inx] := Part;
          Cells[2, inx] := STSalesOrdDM.GetPartDescr(Part);
          Cells[3, inx] := inttostr(OrdQty);
          Cells[4, inx] := inttostr(OversQty);
          Cells[5, inx] := inttostr(ProducedQty);
          Cells[6, inx] := FormatMoneyto3DP(Sell_Price);
          Cells[7, inx] := inttostr(SellPackQuantity);
          Cells[8, inx] := FormatMoney((ProducedQty / SellPackQuantity)*Sell_Price);
          Cells[9, inx] := 'C';
        end;
    end;
  sgLines.RowCount := SalesOrder.OrderLines.Count + 1;
end;

procedure TfrmSTMaintSalesOrder.LoadLineDetails;
var
  i, icount: integer;
  inx: integer;
begin
  for icount := 0 to Pred(SalesOrder.OrderLines.Count) do
    with SalesOrder.OrderLines[iCount] do
    begin
    if Mode = 'C' then
      begin
        if DelQty < OrdQty then
          begin
            ProducedQty := DelQty;
            ReturnsQty := 0;
          end
        else
          begin
            ProducedQty := OrdQty;
            ReturnsQty := (DelQty - OrdQty);
          end
      end
    else
      begin
        ProducedQty := DelQty;
      end;
    end;
end;

procedure TfrmSTMaintSalesOrder.FormDestroy(Sender: TObject);
begin
  SalesOrder.Free;
  STSalesOrdDM.Free ;
end;

procedure TfrmSTMaintSalesOrder.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSTMaintSalesOrder.btnConfirmClick(Sender: TObject);
begin
  if mode = 'C' then
    begin
      if messagedlg('Are you sure you want to confirm completion of production for this stock?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          bConfirm := true;
          Screen.Cursor := crHourGlass;
          try
            bOK := OKChanging
          finally
            Screen.Cursor := crDefault;
          end;
          if bOK then
            Close;
        end
      else
        exit;
    end
  else
    begin
      if messagedlg('Do you want to save these order details?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          bConfirm := true;
          Screen.Cursor := crHourGlass;
          try
            bOK := OKSaving
          finally
            Screen.Cursor := crDefault;
          end;
          if bOK then
            Close;
        end
      else
        exit;
    end;
end;

function TfrmSTMaintSalesOrder.OKChanging: Boolean;
begin
  Result := True;

   try
    UpdateSalesOrderLines;
    UpdateJobBag;

    {Update an existing code}
    with StSalesOrdDM.UpdSOHeadStatusSQL, SalesOrder do
    begin
      Close;
      ParamByName('Sales_Order').AsInteger := SONumber;
      ParamByName('Sales_Order_Head_Status').AsInteger := 170;
      execsql;
    end;

    UpdateStoreStock;
    UpdatePartTransfer;
    StSalesOrdDM.UpdateSalesOrderStatus(SalesOrder.SONumber);
   except on E: Exception do
    begin
      Result := False;
      MessageDlg('Error during update: ' + E.Message, mtError, [mbAbort], 0);
    end;
  end;

end;

function TfrmSTMaintSalesOrder.OKSaving: Boolean;
begin
  Result := True;

  try
    UpdateSalesOrderLineValues;
    UpdateJobBag;

   except on E: Exception do
    begin
      Result := False;
      MessageDlg('Error during update: ' + E.Message, mtError, [mbAbort], 0);
    end;
  end;

end;

procedure TfrmSTMaintSalesOrder.UpdateSalesOrderLines;
var
  i: integer;
  OrigDelQty, iQty: integer;
begin
  for i := 0 to pred(SalesOrder.OrderLines.count) do
    begin
      with StSalesOrdDM.UpdSalesOrderLineSQL, SalesOrder.orderLines[i] do
        begin
          OrigDelQty := DelQty;
          DelQty := ProducedQty;
          if InvQty > Delqty then
            InvQty := DelQty;
          close;
          parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
          parambyname('Sales_Order_Line_no').asinteger := Line;
          parambyname('Quantity_Delivered').asinteger := DelQty;
          parambyname('Quantity_Wastage').asinteger := WasteQty;
          if InvQty > 0 then
            parambyname('Quantity_Invoiced').asinteger := DelQty
          else parambyname('Quantity_Invoiced').asinteger := 0;
          parambyname('Part_Sales_Price').asfloat := Sell_Price;
          parambyname('Sell_Pack_Quantity').asinteger := SellPackQuantity;
          execsql;
        end;

      if OrigDelQty < SalesOrder.orderLines[i].OrdQty then
        begin
          iQty := ((SalesOrder.orderLines[i].DelQty + SalesOrder.orderLines[i].WasteQty) - OrigDelQty);
        end
      else
        begin
          iQty := ((SalesOrder.orderLines[i].DelQty + SalesOrder.orderLines[i].WasteQty) - SalesOrder.orderLines[i].OrdQty);
        end;

      if iQty > 0 then
        ReducePartAllocation(SalesOrder.orderLines[i].Line, iQty)
      else
        IncreasePartAllocation(SalesOrder.orderLines[i].Line, (iQty * -1));
    end;

end;

procedure TfrmSTMaintSalesOrder.UpdateSalesOrderLineValues;
var
  i: integer;
  iQty: integer;
begin
  with STSalesOrdDM.UpdSOHeadStatusSQL do
    begin
      close;
      parambyname('Sales_order').asinteger := SalesOrder.SONumber;
      parambyname('Sales_Order_Head_Status').asinteger := SalesOrder.SOHeadStatus;
      execsql;
    end;

  for i := 0 to pred(SalesOrder.OrderLines.count) do
    begin
      with StSalesOrdDM.UpdSOLValuesSQL, SalesOrder.orderLines[i] do
        begin
          DelQty := ProducedQty;
          close;
          parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
          parambyname('Sales_Order_Line_no').asinteger := Line;
          parambyname('Quantity_Delivered').asinteger := DelQty;
          parambyname('Quantity_Invoiced').asinteger := InvQty;
          parambyname('Part_Sales_Price').asfloat := Sell_Price;
          parambyname('Sell_Pack_Quantity').asinteger := SellPackQuantity;
          parambyname('Part_Cost').asfloat := Part_Cost;
          parambyname('Purch_Pack_Quantity').asinteger := PurchPackQuantity;
          execsql;
        end;
    end;
end;

procedure TfrmSTMaintSalesOrder.UpdateJobBag;
var
  i: integer;
  iJobBag: integer;
  orderstatus: integer;
begin
  for i := 0 to pred(SalesOrder.OrderLines.count) do
    begin
      with StSalesOrdDM.qryUpdJobBagLine, SalesOrder.OrderLines[i] do
        begin
          close;
          parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
          parambyname('Sales_Order_line_no').asinteger := Line;
          parambyname('Job_Bag_Line_Cost').asfloat := ((DelQty-InvQty)/PurchPackQuantity)*Part_Cost;
          parambyname('Job_Bag_Line_Sell').asfloat := ((DelQty-InvQty)/SellPackQuantity)*Sell_Price;
          parambyname('Job_Bag_Quantity').asinteger := DelQty;
          if ((DelQty-InvQty) = 0) or (Sell_Price = 0) then
            parambyname('Job_Bag_Line_Invoiced').asstring := 'Y'
          else
            parambyname('Job_Bag_Line_Invoiced').asstring := 'N';
          execsql;
        end;
    end;

  {Get the job bag number}
  with StSalesOrdDM.qrySalesOrderJB do
    begin
      close;
      parambyname('sales_order').asinteger := SalesOrder.SONumber;
      open;

      iJobBag := fieldbyname('Job_Bag').asinteger
    end;

  {Update the Job Bag header}
  with StSalesOrdDM.qryJBChkStatus do
  begin
    close;
    parambyname('Job_Bag').asinteger := iJobBag;
    open;
    if FieldByName('Lines_not_Invoiced').AsInteger = Fieldbyname('Total_lines').asinteger then
      begin
        if FieldByName('Total_SOs').AsInteger > 0 then
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
        if FieldByName('Total_SOs').AsInteger > 0 then
          orderstatus := 24
        else
        if FieldByName('Total_POs').AsInteger > 0 then
          orderstatus := 23
        else
          orderstatus := 25
      end
    else
      orderstatus := 30;
  end;

  {Update the JB Status}
  with StSalesOrdDM.qryJBUpHead do
  begin
    close;
    parambyname('Job_Bag').asinteger := iJobBag;
    parambyname('Job_Bag_status').asinteger := Orderstatus;
    execsql;
  end;
end;

procedure TfrmSTMaintSalesOrder.AdjustOutWastage(tempLine, tempQty: integer);
var
  iQty, iQtyThisRec: integer;
  iStoreStock, iPartStore, iPackQty: integer;
  sPart, sPartBin, sLot, sReference, sMoveType : string;
  rCost: real;
begin
  STStockDataMod := TSTStockDataMod.create(self);

  try
    iQty := tempQty;
    with StSalesOrdDM.qryGetPartAllocBySOL do
      begin
        close;
        parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
        parambyname('Sales_Order_Line_No').asinteger := tempLine;
        open;

        while EOF <> true do
        begin
          if iQty > 0 then
            begin
              if fieldbyname('Quantity_Allocated').asinteger > iQty then
                iQtyThisRec := iQty
              else
              if fieldbyname('Quantity_Allocated').asinteger <> 0 then
                iQtyThisRec := fieldbyname('Quantity_Allocated').asinteger
              else
                iQtyThisRec := iQty;
              iStoreStock := fieldbyname('Store_Stock').asinteger;
              iPartStore := fieldbyname('Part_Store').asinteger;
              sPartBin := fieldbyname('Part_Bin').asstring;
              sLot := fieldbyname('Part_Store_lot').asstring;
              sPart := fieldbyname('Part').asstring;
              iPackQty := fieldbyname('Stock_Pack_Quantity').asinteger;
              sReference := 'Job Bag: ' + lblJobBagNumber.caption + '  (SO/' + inttoStr(SalesOrder.SONumber) +')';
              sMoveType := 'W';
              rCost := (fieldbyname('Store_Cost').asfloat / fieldbyname('Store_Quantity').asinteger) * iQtyThisRec;
              STStockDataMod.updstock(istorestock, sPart, iPartStore, sPartBin, sLot, smoveType, sreference, date, date,
                                      (iQtyThisRec*-1), 0, iPackQty, (rCost*-1),0,0,0,'N');
//              STStockDataMod.DeAllocWasteStock(SalesOrder.SONumber, iQtyThisRec, 1, tempLine);
              iQty := iQty - iQtyThisRec;
            end;
          next;
        end;
      end;
  finally
    STStockDataMod.free;
  end;
end;

procedure TfrmSTMaintSalesOrder.ReducePartAllocation(tempLine, tempQty: integer);
var
  iQty, iQtyThisRec: integer;
begin
  iQty := tempQty;
  with StSalesOrdDM.qryGetPartAllocBySOL do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
      parambyname('Sales_Order_Line_No').asinteger := tempLine;
      open;

      while EOF <> true do
        begin
          if iQty > 0 then
            begin
              if fieldbyname('Quantity_Overs').asinteger > iQty then
                iQtyThisRec := iQty
              else
              if fieldbyname('Quantity_Overs').asinteger <> 0 then
                iQtyThisRec := fieldbyname('Quantity_Overs').asinteger
              else
                iQtyThisRec := iQty;
              stSalesOrdDM.qryUpdPartAlloc.close;
              stSalesOrdDM.qryUpdPartAlloc.parambyname('Part_Store_Allocation').asinteger := fieldbyname('Part_Store_Allocation').asinteger;
              stSalesOrdDM.qryUpdPartAlloc.parambyname('Quantity_Overs').asinteger := 0 - iQtyThisRec;
              stSalesOrdDM.qryUpdPartAlloc.execSQL;
              iQty := iQty - iQtyThisRec;
            end;
          next;
        end;
    end;
end;

procedure TfrmSTMaintSalesOrder.IncreasePartAllocation(tempLine, tempQty: integer);
var
  iQty, iQtyThisRec: integer;
begin
  iQty := tempQty;
  with StSalesOrdDM.qryGetPartAllocBySOL do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder.SONumber;
      parambyname('Sales_Order_Line_No').asinteger := tempLine;
      open;

      while EOF <> true do
        begin
          if iQty > 0 then
            begin
              if (fieldbyname('Quantity_Allocated').asinteger - fieldbyname('Quantity_Overs').asinteger) > iQty then
                iQtyThisRec := iQty
              else
                iQtyThisRec := (fieldbyname('Quantity_Allocated').asinteger - fieldbyname('Quantity_Overs').asinteger);
              stSalesOrdDM.qryUpdPartAlloc.close;
              stSalesOrdDM.qryUpdPartAlloc.parambyname('Part_Store_Allocation').asinteger := fieldbyname('Part_Store_Allocation').asinteger;
              stSalesOrdDM.qryUpdPartAlloc.parambyname('Quantity_Overs').asinteger := iQtyThisRec;
              stSalesOrdDM.qryUpdPartAlloc.execSQL;
              iQty := iQty - iQtyThisRec;
            end;
          next;
        end;
    end;
end;

procedure TfrmSTMaintSalesOrder.UpdateStoreStock;
var
  sReference: string;
  iMoveQty: integer;
begin
  STStockDataMod := TSTStockDataMod.create(self);
  try
    with StSalesOrdDM.GetPartAllocationSQL, SalesOrder do
    begin
      close;
      parambyname('Sales_order').asinteger := SONumber;
      open;

      first;
      while eof <> true do
        begin
          sReference := 'Job Bag: ' + inttoStr(JobBagNo) + '  (SO/' + inttoStr(SONumber) +')';
          {Update/Downdate the Stock}
          iMoveQty := StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Quantity_Allocated').asinteger
                     - StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Quantity_Overs').asinteger
                     - StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Quantity_Over_Picked').asinteger;

          STStockDataMod.updstock(StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Store_Stock').asinteger,
                                  StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Part').asstring,
                                  StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Part_Store').asinteger,
                                  StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Part_Bin').asstring,
                                  StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Part_Store_lot').asstring,
                                  'J',
                                  sReference,
                                  date,
                                  date,
                                  (iMoveQty*-1),
                                  0,
                                  StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Stock_pack_Quantity').asinteger,
                                  (StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Store_Cost').asfloat*-1), 0,0,0,'N');
          STStockDataMod.DeAllocProductionStock(SONumber, StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Store_Quantity').asinteger, 1,
                                        StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Sales_Order_line_no').asinteger);
          next;
        end;
    end;
  finally
    STStockDataMod.free;
  end;
end;

procedure TfrmSTMaintSalesOrder.sgLinesDblClick(Sender: TObject);
begin
  if Mode = 'C' then
    CallMaintScreen('C')
  else
    CallMaintValuesScreen('C')
end;

procedure TfrmSTMaintSalesOrder.CallMaintScreen(aMode: char);
var
  inx : integer;
  OrderLine : TOrderLine;
  frm: TfrmSTMaintSalesOrderLine;
begin
//  inx := sgLines.row;
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);
  try
    frm := TfrmSTMaintSalesOrderLine.Create(Self);
    try
      inx := SalesOrder.OrderLines.IndexFromLineNo(inx);
      OrderLine := SalesOrder.OrderLines[inx];

      Frm.OrderLine := OrderLine;
      Frm.Mode := aMode;
      Frm.ShowModal;
      if frm.ModalResult = mrOK then
        ShowLineDetails;
    finally
      Frm.Free;
    end;
  finally
  end;
end;

procedure TfrmSTMaintSalesOrder.CallMaintValuesScreen(aMode: char);
var
  inx : integer;
  OrderLine : TOrderLine;
  frm: TfrmSTMaintSalesOrderLineValues;
begin
//  inx := sgLines.row;
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);
  try
    frm := TfrmSTMaintSalesOrderLineValues.Create(Self);
    try
      inx := SalesOrder.OrderLines.IndexFromLineNo(inx);
      OrderLine := SalesOrder.OrderLines[inx];

      Frm.OrderLine := OrderLine;
      Frm.Mode := aMode;
      Frm.ShowModal;
      if frm.ModalResult = mrOK then
        ShowLineDetails;
    finally
      Frm.Free;
    end;
  finally
  end;
end;

procedure TfrmSTMaintSalesOrder.UpdatePartTransfer;
begin
//  Remove any Part Transfer records where the store stock record has disappeared
  with StSalesOrdDM.GetPartTransferSQL, SalesOrder do
    begin
      close;
      parambyname('Sales_order').asinteger := SONumber;
      open;

      while eof <> true do
        begin
          StSalesOrdDM.GetStoreStockSQL.close;
          StSalesOrdDM.GetStoreStockSQL.parambyname('Store_Stock').asinteger := fieldbyname('Store_Stock').asinteger;
          StSalesOrdDM.GetStoreStockSQL.open;

          {if no records exist then delete the part transfer record}
          if StSalesOrdDM.GetStoreStockSQL.recordcount = 0 then
            DeletePartTransfer(StSalesOrdDM.GetPartTransferSQL.fieldbyname('Part_transfer').asinteger)
          else
            UpdatePartTransferQty(StSalesOrdDM.GetPartTransferSQL.fieldbyname('Part_transfer').asinteger,
                               StSalesOrdDM.GetStoreStockSQL.fieldbyname('Store_Quantity').asinteger);
          next;
        end;
    end;
end;

procedure TfrmSTMaintSalesOrder.DeletePartTransfer(tempCode: integer);
begin
  with StSalesOrdDM.DeletePartTransferSQL do
    begin
      close;
      parambyname('Part_Transfer').asinteger := tempCode;
      execsql;
    end;
end;

procedure TfrmSTMaintSalesOrder.UpdatePartTransferQty(tempCode: integer; tempQty: integer);
begin
  with StSalesOrdDM.UpdatePartTransferSQL do
    begin
      close;
      parambyname('Part_Transfer').asinteger := tempCode;
      parambyname('Store_Quantity').asinteger := tempQty;
      execsql;
    end;
end;

procedure TfrmSTMaintSalesOrder.chkbxDoNotInvcClick(Sender: TObject);
begin
  if self.chkbxDoNotInvc.Checked then
  begin
    self.trueSOHeadStat := SalesOrder.SOHeadStatus;
    SalesOrder.SOHeadStatus := 250;
  end
  else
  begin
    SalesOrder.SOHeadStatus := self.trueSOHeadStat;
  end;

end;

end.
