unit PBLUDeliveriesDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlDeliveries = class(TDataModule)
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    SupplierSQL: TFDQuery;
    CompSQL: TFDQuery;
    CustomerSQL: TFDQuery;
    qryPODetails: TFDQuery;
    qryPODetailsPurchase_Order: TFloatField;
    qryPODetailsLine: TIntegerField;
    qryPODetailsDelivery_no: TIntegerField;
    qryPODetailsAd_hoc_Address: TIntegerField;
    qryPODetailsSupplier: TIntegerField;
    qryPODetailsBranch_no: TIntegerField;
    qryPODetailsRep: TIntegerField;
    qryPODetailsQty_to_Deliver: TFloatField;
    qryPODetailsQty_Delivered: TFloatField;
    qryPODetailsQty_Invoiced: TFloatField;
    qryPODetailsDate_Point: TDateTimeField;
    qryPODetailsBranch_No0: TIntegerField;
    qryPODetailsCustomer: TIntegerField;
    qryPODetailsNo_Of_Boxes: TIntegerField;
    qryPODetailsDelivery_Instructions: TStringField;
    qryPODetailsDeliver_via_Company: TStringField;
    qryPODetailsDate_Deliv_Actual: TDateTimeField;
    qryPODetailsDelivery_to_Stock: TStringField;
    qryPODetailsDelivery_note_printed: TStringField;
    qryPODetailsSuppliers_Desc: TStringField;
    qryPODetailsOrder_Customer: TIntegerField;
    qryPODetailsCustomer_Branch: TIntegerField;
    qryPODetailsForms_Per_Box: TStringField;
    qryPODetailsNo_of_Sets: TStringField;
    qryPODetailsCust_order_no: TStringField;
    qryPODetailsPurch_Ord_Line_Status: TIntegerField;
    qryPODetailsOrig_Ord_Qty: TFloatField;
    qryPODetailsSupplier_1: TIntegerField;
    qryPODetailsSupplier_Branch: TIntegerField;
    qryPODetailsSupplier_Name: TStringField;
    qryPODetailsCustomer_Name: TStringField;
    qryPODetailsOrder_Status: TStringField;
    qryPODetailsForm_Reference: TIntegerField;
    qryPODetailsOriginal_Order: TFloatField;
    qryPODetailsOriginal_OrderLine: TFloatField;
    qryPODetailsNumber_Instructions: TStringField;
    dtsDetails: TDataSource;
    qrySODetails: TFDQuery;
    qryPODetailsDeliveryName: TStringField;
    qryUpDelivDate: TFDQuery;
    qryUpDelivPrinted: TFDQuery;
    qryCheckDeliv: TFDQuery;
    qryGetPOLine: TFDQuery;
    qryUpPOLine: TFDQuery;
    qryGetPOLines: TFDQuery;
    qryUpPOHead: TFDQuery;
    qryUpDelivery: TFDQuery;
    qryAddDelivLocs: TFDQuery;
    qryUpDelivLocs: TFDQuery;
    qryDelPickLocs: TFDQuery;
    qryUpDelivLocsAlloc: TFDQuery;
    qryAddPickDtls: TFDQuery;
    qryGetNextPickNo: TFDQuery;
    qryUpPOLineFormRef: TFDQuery;
    qryGetStock: TFDQuery;
    qryGetCallOff: TFDQuery;
    qryUpPOStock: TFDQuery;
    qrySODetailsSales_Order: TIntegerField;
    qrySODetailsSales_order_delivery_no: TIntegerField;
    qrySODetailsDelivery_Date: TDateTimeField;
    qrySODetailsDespatch_note_No: TStringField;
    qrySODetailsCust_Order_No: TStringField;
    qrySODetailsDelivery_Customer: TIntegerField;
    qrySODetailsDelivery_Branch: TIntegerField;
    qrySODetailsAd_hoc_Address: TIntegerField;
    qrySODetailsReplenish_ID: TStringField;
    qrySODetailsReplenish_Source_Descr: TStringField;
    qrySODetailsSupplier: TIntegerField;
    qrySODetailsBranch_no0: TIntegerField;
    qrySODetailsDeliveryName: TStringField;
    dtsSODetails: TDataSource;
    qrySODetailsDate_Required: TDateTimeField;
    qrySODetailsCustomer_Name: TStringField;
    qrySODetailsSales_Order_Head_Status: TIntegerField;
    qrySODetailsReplenish_Source: TIntegerField;
    qrySODetailsDate_Ordered: TDateTimeField;
    qryUpPOLineInvUpfront: TFDQuery;
    qryPODetailsGoods_reqd_by_customer: TDateTimeField;
    qryPODetailsInvoice_upfront: TStringField;
    qryPODetailsOrder_Price: TCurrencyField;
    qryPODetailsOrder_Unit: TIntegerField;
    qryPODetailsPrice_unit_description: TStringField;
    qryPODetailsPrice_Unit_Factor: TFloatField;
    qrySODetailsDelivery_Type: TStringField;
    qrySODetailsDate_Picked: TDateTimeField;
    qrySODetailsDelivery_Weight_kilos: TIntegerField;
    qrySODetailsNo_Of_Boxes: TIntegerField;
    qrySODetailsDelivery_Instructions: TStringField;
    qrySODetailsConsignment_number: TStringField;
    qrySODetailsCourier: TIntegerField;
    qrySODetailsService_no: TIntegerField;
    qrySODetailsConfirm_Filename: TStringField;
    qrySODetailsConfirm_Filename_no: TIntegerField;
    qrySODetailsBranch_Name: TStringField;
    qryPODetailsContact_Name: TStringField;
    qryPODetailsorder_contact_name: TStringField;
    qryPODetailsReady_to_Invoice: TStringField;
    qryPODetailsCompany_Branch: TIntegerField;
    qryPODetailsCourier: TIntegerField;
    qryPODetailsService_no: TIntegerField;
    qryPODetailsPackage_Type: TIntegerField;
    qryPODetailsSupplier_Courier: TIntegerField;
    qryPODetailsDelivery_Weight_Kilos: TIntegerField;
    procedure qryPODetailsCalcFields(DataSet: TDataSet);
    procedure qrySODetailsCalcFields(DataSet: TDataSet);
  private
    FOrderNumber: real;
    procedure SetOrderNumber(const Value: real);
    { Private declarations }
  public
    property OrderNumber: real read FOrderNumber write SetOrderNumber;
    procedure RefreshPOData;
    procedure RefreshSOData;
    procedure SavePurchaseOrder(rPONumber: real; iLine: integer);
    function GetNextPickNumber(TempOrd: real; TempLine, TempDel,
      TempLoc: integer): integer;
    procedure SavePurchaseOrderFormRef(rPONumber: real; iLine,
      iFormRef: integer);
    procedure SavePOInvoiceupfront(rPONumber: real; iLine: integer;
      sInvUpfront: string);
    procedure UpdateCallOffStock(rCallOffNumber: real;
      iCallOffLine: integer);
    procedure UpdateStock(rPONumber: real; iLine: integer);
  end;

var
  dtmdlDeliveries: TdtmdlDeliveries;

implementation

{$R *.DFM}

{ TdtmdlDeliveries }

procedure TdtmdlDeliveries.SetOrderNumber(const Value: real);
begin
  FOrderNumber := Value;
end;

procedure TdtmdlDeliveries.RefreshPOData;
begin
  with qryPODetails do
    begin
      close;
      parambyname('Purchase_order').asfloat := OrderNumber;
      open;
    end;
  dtsDetails.dataset := qryPODetails;
end;

procedure TdtmdlDeliveries.RefreshSOData;
begin
  with qrySODetails do
    begin
      close;
      parambyname('Sales_order').asfloat := OrderNumber;
      open;
    end;
  dtsSODetails.dataset := qrySODetails;
end;

procedure TdtmdlDeliveries.qryPODetailsCalcFields(DataSet: TDataSet);
begin
  if qryPODetails.FieldByName('Customer').AsString <> '' then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        qryPODetails.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        qryPODetails.FieldByName('Branch_no0').AsInteger;
      Open;
    qryPODetails.Fieldbyname('DeliveryName').asstring := 'Cust/Br: '+fieldbyname('Customer_Name').asstring;
    end;
  end
  else
    if qryPODetails.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          qryPODetails.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
        qryPODetails.Fieldbyname('DeliveryName').asstring := 'AdHoc: '+fieldbyname('Name').asstring;
      end;
    end
    else
      if qryPODetails.FieldByName('Rep').AsString <> '' then
      begin
        with RepSQl do
        begin
          Close;
          ParamByName('Rep').AsInteger :=
            qryPODetails.FieldByName('Rep').AsInteger;
          Open;
          qryPODetails.Fieldbyname('DeliveryName').asstring := 'Rep: '+fieldbyname('Name').asstring;
        end;
      end
      else
        if qryPODetails.FieldByName('Supplier').AsString <> '' then
        begin
          with SupplierSQl do
          begin
            Close;
            ParamByName('Supplier').AsInteger :=
              qryPODetails.FieldByName('Supplier').AsInteger;
            ParamByName('Branch_no').AsInteger :=
              qryPODetails.FieldByName('Branch_no').AsInteger;
            Open;
            qryPODetails.Fieldbyname('DeliveryName').asstring := 'Supp/Br: '+fieldbyname('Supplier_Name').asstring;
          end;
        end
        else
        begin
          with CompSQL do
          begin
            Close;
            Open;
            qryPODetails.Fieldbyname('DeliveryName').asstring := 'Comp: '+fieldbyname('Company_Name').asstring;
          end;
        end;


end;

procedure TdtmdlDeliveries.SavePurchaseOrder(rPONumber: real; iLine: integer);
var
  istatus: integer;
  iDelivered, iStock, icount: integer;
  sReadytoInvoice: string;
begin
  {Check whether all Delivery Lines have been delivered}
  with qryCheckDeliv do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      parambyname('Line').asinteger := iLine;
      open;

      icount := recordcount;
      iDelivered := 0;
      iStock := 0;
      first;
      while not(eof) do
        begin
          if fieldbyname('Date_Deliv_Actual').asstring <> '' then
            begin
              inc(iDelivered);
              if fieldbyname('Delivery_to_Stock').asstring = 'Y' then
                inc(iStock);
            end;
          next;
        end;
      if iDelivered = icount then
        istatus := 22   {Fully Delivered}
      else
      if iDelivered = 0 then
        istatus := 20   {Sent to Supplier}
      else
        istatus := 21;  {Part Delivered}
    end;

  {Check the Purchase Order line status}
  with qryGetPOLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      parambyname('Line').asinteger := iLine;
      open;
    end;

  if iStatus < 22 then
    sReadytoInvoice := qryGetPOLine.fieldbyname('Ready_to_Invoice').asstring
  else
    sReadytoInvoice := 'N';

  if qryGetPOLine.fieldbyname('Purch_Ord_Line_Status').asinteger > 22 then
    istatus := qryGetPOLine.fieldbyname('Purch_Ord_Line_Status').asinteger;

  {If delivered and invoiced upfront then set to complete}
  if  (iStatus > 21) and (iStatus < 25) and
      (qryGetPOLine.fieldbyname('Invoice_Upfront').asstring = 'N') and
      (iStock > 0) then iStatus := 50;

  {Update the Purchase Order line}
  with qryUpPOLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      parambyname('Line').asinteger := iLine;
      parambyname('Purch_Ord_Line_Status').asinteger := iStatus;
      parambyname('Ready_to_Invoice').asstring := sReadyToInvoice;
      execsql;
    end;

  {Get Purchase Order lines}
  with qryGetPOLines do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      open;

//      istatus := 22;  {Fully Delivered}
      istatus := 50;  {Complete - Invoiced on call off}

      first;
      while not (EOF) do
        begin
          if fieldbyname('Purch_ord_line_status').asinteger < istatus then
            istatus := fieldbyname('Purch_ord_line_status').asinteger;
          next;
        end;
    end;

  {Update Purchase Order Header}
  with qryUpPOHead do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      parambyname('Purch_ord_head_Status').asinteger := istatus;
      execsql;
    end;
end;

function TdtmdlDeliveries.GetNextPickNumber(TempOrd: real; TempLine, TempDel, TempLoc: integer): integer;
begin
  with qryGetnextPickNo do
    begin
      close;
      parambyname('Purchase_order').asfloat := TempOrd;
      parambyname('Line').asinteger := TempLine;
      parambyname('Delivery_no').asinteger := TempDel;
      parambyname('Location_no').asinteger := TempLoc;
      open;
      Result := fieldbyname('Last_Pick_Number').asinteger + 1;
    end;
end;

procedure TdtmdlDeliveries.SavePOInvoiceupfront(rPONumber: real; iLine: integer; sInvUpfront: string);
begin
  with qryUpPOLineInvUpfront do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      parambyname('Line').asinteger := iLine;
      parambyname('Invoice_upfront').asstring := sInvUpfront;
      execsql;
    end;
end;

procedure TdtmdlDeliveries.SavePurchaseOrderFormRef(rPONumber: real; iLine: integer; iFormRef: integer);
begin
  with qryUpPOLineFormRef do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      parambyname('Line').asinteger := iLine;
      if iFormRef = 0 then
        parambyname('Form_Reference').clear
      else
        parambyname('Form_Reference').asinteger := iFormRef;
      execsql;
    end;
end;

procedure TdtmdlDeliveries.UpdateStock(rPONumber: real; iLine: integer);
var
  iQtyinStock, iQtyCallOff: integer;
begin
  with qryGetStock do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      parambyname('Line').asinteger := iLine;
      open;

      iQtyinStock := fieldbyname('Qty_in_Stock').asinteger;
    end;

  {Get total of all call off orders}
  with qryGetCallOff do
    begin
      close;
      parambyname('Original_Order').asfloat := rPONumber;
      parambyname('Original_line').asinteger := iLine;
      open;

      iQtyCallOff := fieldbyname('Qty_Called_off').asinteger;
    end;

  with qryUpPOStock do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      parambyname('Line').asinteger := iLine;
      parambyname('Qty_in_Stock').asinteger := iQtyinStock - iQtyCallOff;
      execsql;
    end;
end;

procedure TdtmdlDeliveries.UpdateCallOffStock(rCallOffNumber: real; iCallOffLine: integer);
var
  rPONumber: real;
  iLine: integer;
  iQtyinStock, iQtyCallOff: integer;
begin
  with qryGetPOLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rCallOffNumber;
      parambyname('Line').asinteger := iCallOffLine;
      open;
      first;

      rPONumber := fieldbyname('Original_Order').asfloat;
      iLine := fieldbyname('Original_Orderline').asinteger;
    end;

  {Get total stock}
  with qryGetStock do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      parambyname('Line').asinteger := iLine;
      open;

      iQtyinStock := fieldbyname('Qty_in_Stock').asinteger;
    end;

  {Get total of all call off orders}
  with qryGetCallOff do
    begin
      close;
      parambyname('Original_Order').asfloat := rPONumber;
      parambyname('Original_line').asinteger := iLine;
      open;

      iQtyCallOff := fieldbyname('Qty_Called_off').asinteger;
    end;

  with qryUpPOStock do
    begin
      close;
      parambyname('Purchase_Order').asfloat := rPONumber;
      parambyname('Line').asinteger := iLine;
      parambyname('Qty_in_Stock').asinteger := iQtyinStock - iQtyCallOff;
      execsql;
    end;
end;

procedure TdtmdlDeliveries.qrySODetailsCalcFields(DataSet: TDataSet);
begin
  if qrySODetails.FieldByName('Delivery_Customer').AsString <> '' then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        qrySODetails.FieldByName('Delivery_Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        qrySODetails.FieldByName('Delivery_Branch').AsInteger;
      Open;
    qrySODetails.Fieldbyname('DeliveryName').asstring := 'Cust/Br: '+fieldbyname('Customer_Name').asstring;
    end;
  end
  else
    if qrySODetails.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          qrySODetails.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
        qrySODetails.Fieldbyname('DeliveryName').asstring := 'AdHoc: '+fieldbyname('Name').asstring;
      end;
    end;
end;

end.
