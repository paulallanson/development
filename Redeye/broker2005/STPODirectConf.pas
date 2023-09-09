unit STPODirectConf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Db, STPAcks,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPODirectConfFrm = class(TForm)
    pnlFunctions: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblCustomer: TLabel;
    lblPODate: TLabel;
    lblReqDate: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    grdDetails: TStringGrid;
    qryGetDtls: TFDQuery;
    lblPONumber: TLabel;
    Label5: TLabel;
    lblSupplier: TLabel;
    Label6: TLabel;
    lblSalesOrder: TLabel;
    qryGetHead: TFDQuery;
    UpdPOStatusSQL: TFDQuery;
    CheckPOStatusSQL: TFDQuery;
    UpdPOLineSQL: TFDQuery;
    BitBtnAdd: TBitBtn;
    qryInsPOLine: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure grdDetailsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure grdDetailsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtnAddClick(Sender: TObject);
  private
    FPONumber: integer;
    procedure SetPONumber(const Value: integer);
    procedure SetGridHeadings;
    procedure GetDetails;
    procedure UpdateDetails;
    procedure AddOrderLine;
    procedure CreateSOandPoLine(inx: integer);
    function CheckDeliveryQty: bytebool;
    { Private declarations }
  public
    { Public declarations }
    bOK: ByteBool;
    iqty: Integer;
    property PONumber: integer read FPONumber write SetPONumber;
  end;

var
  STPODirectConfFrm: TSTPODirectConfFrm;

implementation

uses
  System.UITypes,
  STpickingDM, STSOObjects, STSODataMod, STMaintSOrdLine;

{$R *.DFM}

{ TSTPODirectConfFrm }

procedure TSTPODirectConfFrm.SetPONumber(const Value: integer);
begin
  FPONumber := Value;
end;

procedure TSTPODirectConfFrm.btnOKClick(Sender: TObject);
begin
  if not CheckDeliveryQty then
    begin
      messagedlg('Delivery quantity cannot be less than the invoiced quantity for any lines',
        mtWarning, [mbOK], 0);
      exit;
    end;

  if messagedlg('Save the delivery details entered?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      updatedetails;
      bOK := true;
    end;
  close;
end;

function TSTPODirectConfFrm.CheckDeliveryQty: bytebool;
var
  i, QtyDelivered, QtyInvoiced: integer;
begin
  result := true;
  with grdDetails do
    begin
      for i := 1 to pred(rowcount) do
        begin
          QtyDelivered := inptoSing(trim(cells[5,i]),strtoint(cells[3,i]));
          QtyInvoiced := inptoSing(trim(cells[6,i]),strtoint(cells[3,i]));
          if QtyDelivered < QtyInvoiced then
            begin
            result := false;
            exit;
            end;
        end;
    end;
end;

procedure TSTPODirectConfFrm.btnCancelClick(Sender: TObject);
begin
  bOK := false;
end;

procedure TSTPODirectConfFrm.FormActivate(Sender: TObject);
begin
  SetGridHeadings;
  GetDetails;
end;

procedure TSTPODirectConfFrm.SetGridHeadings;
begin
  with grdDetails do
    begin
      cells[0,0] := 'Line';
      cells[1,0] := 'Part';
      cells[2,0] := 'Description';
      cells[3,0] := 'Pack Size';
      cells[4,0] := 'Qty Ordered';
      cells[5,0] := 'Qty Delivered';
      cells[6,0] := 'Qty Invoiced';

      colwidths[7] := -1;
    end;
end;

procedure TSTPODirectConfFrm.GetDetails;
var
  icount: integer;
  POStatus: string;
begin
  with qryGetHead do
    begin
      close;
      parambyname('Purch_ord').asinteger := PONumber;
      open;
      first;

      POStatus := fieldbyname('Purch_ord_Status').asstring;
      lblPONumber.caption := fieldbyname('Purch_Ord_no').asstring;
      lblSupplier.caption := fieldbyname('Supplier_Name').asstring;
      lblReqDate.caption := fieldbyname('Date_Required').asstring;
      lblPODate.caption := fieldbyname('Purch_Ord_Date').asstring;
      lblSalesOrder.caption := fieldbyname('Sales_Order').asstring;
      lblCustomer.caption := fieldbyname('Customer_Name').asstring;
    end;
   SalesOrder.SONumber := qryGetHead.FieldByName('Sales_Order').AsInteger;
   SalesOrder.FuncMode := SoChange;
   STSalesOrdDM.LoadSOFromDatabase(SalesOrder);
  with qryGetDtls do
    begin
      close;
      parambyname('Purch_ord').asinteger := PONumber;
      open;
      first;

      grdDetails.rowcount := recordcount + 1;
      icount := 0;
      while eof <> true do
        begin
          inc(icount);
          grdDetails.cells[0,icount] := inttostr(icount);
          grdDetails.cells[1,icount] := fieldbyname('Part').asstring;
          grdDetails.cells[2,icount] := fieldbyname('Part_Description').asstring;
          grdDetails.cells[3,icount] := fieldbyname('Purch_Pack_Quantity').asstring;
          grdDetails.cells[4,icount] := ShowInPacks(fieldbyname('Quantity_Ordered').asinteger,fieldbyname('Purch_Pack_Quantity').asinteger);
          if POStatus < 'K' then
            grdDetails.cells[5,icount] := ShowInPacks(fieldbyname('Quantity_Ordered').asinteger,fieldbyname('Purch_Pack_Quantity').asinteger)
          else
            grdDetails.cells[5,icount] := ShowInPacks(fieldbyname('Quantity_Received').asinteger,fieldbyname('Purch_Pack_Quantity').asinteger);
            
          grdDetails.cells[6,icount] := ShowInPacks(fieldbyname('Quantity_Invoiced').asinteger,fieldbyname('Purch_Pack_Quantity').asinteger);
          grdDetails.cells[7,icount] := inttostr(fieldByName('Purch_Ord_Line_No').AsInteger);
          grdDetails.cells[8,icount] := inttostr(fieldByName('Sales_Order_Line_No').AsInteger);
          next;
        end;

    end;
end;

procedure TSTPODirectConfFrm.grdDetailsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
	if (aCol = 5) then
    grdDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    grdDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing];
//   sOldValue := grddetails.cols[5].text;
end;

procedure TSTPODirectConfFrm.UpdateDetails;
var
  icount, inx, lineNo: integer;
  tempStat: string;
begin
  for icount := 1 to pred(grddetails.rowcount) do
  begin
    iqty := inpToSing(grddetails.Cells[5,icount],strToInt(grddetails.cells[3,icount]));
    if grddetails.cells[9,icount] <> 'A' then
      begin
        With UpdPOLineSQL do
        begin
          Close ;
          ParamByName('Purch_Ord').AsInteger := PONumber;
          ParamByName('Purch_Ord_Line_No').AsInteger := StrToInt(grddetails.Cells[7,Icount]);
          ParamByName('Quantity_Received').AsInteger := iqty ;
          ParamByName('Quantity_Sent').AsInteger := iqty;
          ParamByName('Date_Deliv_Actual').AsDateTime := Date ;
          if grddetails.cells[5,icount] = grddetails.cells[4,icount] then
            ParamByName('Fully_Received').AsString := 'Y'
          else
            if grddetails.cells[5,icount] = '0' then
              ParamByName('Fully_Received').AsString := 'N'
            else
              ParamByName('Fully_Received').AsString := 'P';
          ParamByName('GRN_No').AsString := 'GRN'+lblPONumber.caption;
          ExecSQL ;
       end;
      STPickDM.UpdateDirectSalesOrder(StrToInt(LblSalesOrder.caption),StrToInt(grddetails.Cells[8,Icount]),iqty);
      end
    else
      begin
        LineNo := StrToInt(grddetails.cells[7,icount]);
        inx := Salesorder.OrderLines.IndexFromLineNo(LineNo);
        CreateSOandPOLine(inx);
      end;
    next;
  end;

  with CheckPOStatusSQL do
  begin
    Close ;
    ParamByName('Purch_Ord').AsInteger := PONumber ;
    Open ;
    First ;
    if (FieldByName('Purch_Ord_Status').AsString <= 'W') then
    begin
      if fieldbyname('Qty_Invoiced').asinteger > 0 then
        begin
          if fieldbyname('Qty_Invoiced').asinteger >= fieldbyname('Qty_Received').asinteger then
            tempStat := 'W'
          else
            tempStat := 'U';
        end
      else
      if (FieldByName('No_Not_Deliv').AsInteger = 0) and
         (FieldByName('No_Part_Deliv').AsInteger = 0) and
         (FieldByName('No_Deliv').AsInteger > 0) then
        TempStat := 'N'                                       {Fully delivered}
      else
      if (FieldByName('No_Not_Deliv').AsInteger > 0) and       {None delivered}
         (FieldbyName('No_Part_Deliv').asinteger = 0) and
         (FieldByName('No_Deliv').AsInteger = 0) then
         TempStat := 'G'
      else
      if ((FieldByName('No_Not_Deliv').AsInteger > 0) and         {Some delivered}
          (FieldByName('No_Deliv').AsInteger > 0)) or
          (FieldByName('No_Part_Deliv').AsInteger > 0) then
        TempStat := 'K';

      {Update Status}
      with UpdPOStatusSQL do
        begin
          Close ;
          ParamByName('Purch_Ord').AsInteger := PONumber ;
          ParamByName('Purch_Ord_Status').AsString := TempStat ;
          ExecSQL ;
        end;
    end;
    STPickDM.UpdateSalesOrderHead(StrToInt(LblSalesOrder.caption));
  end;
end;

procedure TSTPODirectConfFrm.FormDestroy(Sender: TObject);
begin
stPickDM.free;
STSalesOrdDM.Free ;
SalesOrder.Free;
end;

procedure TSTPODirectConfFrm.FormCreate(Sender: TObject);
begin
  STPickDM := TStPickDM.Create(Self);
  STSalesOrdDM := TStSalesOrdDM.Create(Self);
  SalesOrder := TSalesOrder.Create(STSalesOrdDM);
end;

procedure TSTPODirectConfFrm.CheckKeyIsNumber(Sender: TObject;
  var Key: Char);
begin
  if Sender is TStringGrid then
  begin
{  if key = #13 then
    begin
      if grddetails.
      Cells[row, col].Text > grddetails.cols[4].text then
          grddetails.cols[5].text := sOldValue;

    end; }
  case Key of
    '0'..'9': ;
    ':':;
    #8: {backspace}
  else
    Key := #0;
  end;
  end;
end;

procedure TSTPODirectConfFrm.grdDetailsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  i: integer;
begin
  with grdDetails do
    begin
      for i := 1 to pred(rowcount) do
        begin
          if trim(cells[5,i]) = '' then
            cells[5,i] := '0';
        end;
    end;
end;

procedure TSTPODirectConfFrm.AddOrderLine;
var
  bTempOK: Boolean;
  OrderLine: TOrderLine;
  iOrder: Integer;
begin
    iOrder := SalesOrder.OrderLines.NextLineNumber;
    OrderLine := TOrderLine.Create;
    OrderLine.Line := iOrder;
    OrderLine.SOLineStatus := slNotYetSent;
    OrderLine.ActnTkn := 'A';
  STMaintSOrdLineFrm := TSTMaintSOrdLineFrm.Create(Self);
  try
    STMaintSOrdLineFrm.FuncMode := soAdd;
    STMaintSOrdLineFrm.SalesOrder := SalesOrder;
    STMaintSOrdLineFrm.SONumber := SalesOrder.SONumber;
    STMaintSOrdLineFrm.OrderLine := OrderLine;
    STMaintSOrdLineFrm.Supplier := SalesOrder.Supplier;
    STMaintSOrdLineFrm.BranchNo := SalesOrder.BranchNo0;
    STMaintSOrdLineFrm.PartStore := SalesOrder.PartStore;
    STMaintSOrdLineFrm.ReplenishSource := SalesOrder.ReplenishSource;
    STMaintSOrdLineFrm.ShowModal;
    bTempOK := STMaintSOrdLineFrm.bOK;
  finally
    STMaintSOrdLineFrm.Free;
  end;
  if bTempOK then
      begin
        with grddetails do
          begin
            rowcount := rowcount+1;
            row := rowcount-1;
            cells[0, row] := inttostr(row);
            cells[1, row] := orderline.part;
            cells[2, row] := STSalesOrdDM.GetPartDescr(orderline.Part);
            cells[3, row] := IntToStr(Orderline.PurchPackQuantity) ;
            Cells[4, row] := Orderline.OrdQtyinPacks;
            Cells[5, row] :=  Orderline.OrdQtyinPacks;
            Cells[6, row] := '0';
            cells[7, row] := intToStr(OrderLine.Line);
            cells[8, row] := intToStr(OrderLine.Line);
            cells[9, row] := 'A';
            SalesOrder.OrderLines.Add(OrderLine);
          end ;
      end
  else
  OrderLine.Free;
end;

procedure TSTPODirectConfFrm.BitBtnAddClick(Sender: TObject);
begin
AddorderLine;
end;

procedure TSTPODirectConfFrm.CreateSOandPoLine(inx :integer);
var
Orderline : TOrderline;
partprice : real;
begin
  Orderline := SalesOrder.orderlines[inx];
  with STSalesOrdDM.AddSOLineSQL, Orderline do
  begin
    PartPrice := StSalesOrdDM.GetPartCost(Part);
    ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
    ParamByName('Line').AsInteger := Line;
    ParamByName('Part').AsString := Part;
    ParamByName('Part_Cost').AsFloat := Part_Cost;
    ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;
    ParamByName('Part_Sales_Price').AsFloat := Sell_Price;
    ParamByName('Sell_Pack_Quantity').AsInteger := SellPackQuantity;
    ParamByName('Quantity_Ordered').AsInteger := iQty;
    ParamByName('Quantity_Allocated').AsInteger := 0;
    ParamByName('Quantity_Delivered').AsInteger := iQty;
//    ParamByName('Quantity_Delivered').AsInteger := OrdQty;
    ParamByName('Contract').Clear;
    ParamByName('Contract_Line_No').Clear;
    ParamByName('Sales_Order_Line_Status').AsInteger := SOLineStatus;
    ParamByName('Quantity_Invoiced').AsInteger := 0;
    ParamByName('Discount_Type').asString := Disc_Type;
    ParamByName('Discount_Value').asFloat := Disc_Val;
    ParamByName('Vat_Code').asinteger := VatCode;
    ParambyName('Original_Sell_Price').asfloat := OriginalSellPrice;
    ParamByName('Markup_Type').clear;
    ParamByName('Markup_Value').clear;
    ParamByName('Quantity_Overs').clear;
    ParamByName('Line_Is_Sample').asstring := 'N';
    ExecSQL;
  end;
  with qryInsPoLine, Orderline do
  begin
    ParamByName('Purch_Ord').AsInteger := PONumber;
    ParamByName('Purch_Ord_Line_No').AsInteger := Line;
    ParamByName('Quantity_Ordered').AsInteger := iqty;
    ParamByName('Part').AsString := Part;
    ParamByName('Quantity_Received').AsInteger := iqty;
    ParamByName('Quantity_Sent').AsInteger := iqty;
    ParamByName('Quantity_Allocated').AsInteger := 0;
     if SalesOrder.DateReq = 0 then
      ParamByName('Date_Deliv_Expected').Clear
    else
      ParamByName('Date_Deliv_Expected').AsDateTime := SalesOrder.DateReq;
    ParamByName('Date_Deliv_Actual').AsDateTime := Date;
    ParamByName('Purchase_Price').AsCurrency := Part_cost;
    ParamByname('GRN_No').Clear;
    ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;
    ParamByName('Replacement_For_Line').Clear;
    ParamByName('Cost_Price').AsCurrency := PartPrice;
    ParamByName('Discount').AsFloat := PartPrice-Part_cost;
    ParamByName('Qty_Invoiced').asFloat := 0;
    ExecSQL;
   end;
end;

end.
