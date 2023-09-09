unit PBRSCustInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DB, PBSalesInvoiceDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSCustInvoiceFrm = class(TForm)
    Label1: TLabel;
    edtCustomer: TEdit;
    ContTypeMaintBitBtn: TBitBtn;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    edtDateFrom: TEdit;
    btnDateFrom: TSpeedButton;
    edtDateTo: TEdit;
    btnDateTo: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryGetSalesOrders: TFDQuery;
    procedure ContTypeMaintBitBtnClick(Sender: TObject);
    procedure btnDateFromClick(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    aInvoice: TSalesInvoice;
    Customer, Branch, InvToCustomer, InvToBranch, Rep: integer;
    VatCode, ProductType, PriceUnit, SONumber, SOLine: integer;
    TotalGoodsValue, TotalCostValue, VatRate, InvoiceGoodsTotal, InvoiceVATTotal, InvoiceCostTotal: real;
    QtyInvoiced: integer;
    Reference, CustOrderNo, InvoiceDescription, Nominal, sPriceUnit: string;
    DateFrom, DateTo: TDateTime;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CreateSalesInvoice;
    procedure CreateInvoiceHeader;
    procedure CreateInvoiceDetails;
    procedure CreateInvoiceSundry;
    procedure UpdateSalesOrder;
    procedure UpdateSalesOrderLine;
  public
    dbKey: integer;
    bOK: boolean;
  end;

var
  PBRSCustInvoiceFrm: TPBRSCustInvoiceFrm;

implementation

uses
  System.UITypes,
  PBLUCust, DateSelV5, CCSCommon, pbMainMenu;

{$R *.dfm}

procedure TPBRSCustInvoiceFrm.ContTypeMaintBitBtnClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := Customer;
    PBLUCustFrm.bSel_Branch := false;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      Customer := PBLUCustFrm.SelCode;
      edtCustomer.text := PBLUCustFrm.SelName;
      enableOK(self);
    end;
  finally
    PBLUCustFrm.Free;
  end;

end;

procedure TPBRSCustInvoiceFrm.btnDateFromClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
  enableOK(self);
end;

procedure TPBRSCustInvoiceFrm.btnDateToClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(DateTo);
  enableOK(self);
end;

procedure TPBRSCustInvoiceFrm.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  dmSalesInvoice := TdmSalesInvoice.Create(Self);
  If edtDateFrom.Text <> '' then
  begin
    try
      NewDate := StrToDate(edtDateFrom.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        edtDateFrom.SetFocus;
        Exit;
      end;
    end;
    edtDateFrom.Text := PBDatestr(NewDate);
    DateFrom := NewDate;
  end;
  enableOK(self);
end;

procedure TPBRSCustInvoiceFrm.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateTo.Text <> '' then
  begin
  try
    NewDate := StrToDate(edtDateTo.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        edtDateTo.SetFocus;
        Exit;
      end;
    end;
    edtDateTo.Text := PBDatestr(NewDate);
    DateTo := NewDate;
  end;
  enableOK(self);
end;

function TPBRSCustInvoiceFrm.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBRSCustInvoiceFrm.FormCreate(Sender: TObject);
begin
  DateFrom := (Date-30);
  DateTo := (Date);
end;

procedure TPBRSCustInvoiceFrm.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtCustomer.text <> '') and
                   (edtDateFrom.text <> '') and
                   (edtDateto.text <> ''); 
end;

procedure TPBRSCustInvoiceFrm.FormActivate(Sender: TObject);
begin
  if edtDateFrom.Text = '' then
  begin
    DateFrom := Date-30;
    edtDateFrom.Text := PBDatestr(DateFrom);
  end;
  if edtDateTo.Text = '' then
  begin
    DateTo := Date;
    edtDateTo.Text := PBDatestr(DateTo);
  end;
end;

procedure TPBRSCustInvoiceFrm.btnOKClick(Sender: TObject);
begin
  if MessageDlg('Create Sales Invoices for the selected Period?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    CreateSalesInvoice;
  end;
end;

procedure TPBRSCustInvoiceFrm.CreateSalesInvoice;
var
  icount: integer;
begin
  aInvoice := TSalesInvoice.Create(dmSalesInvoice);

  {get records based on selection}
  with qryGetSalesOrders do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      open;

      icount := 0;
      InvoiceGoodsTotal := 0.00;
      InvoiceCostTotal := 0.00;
      InvoiceVATTotal := 0.00;

      while eof <> true do
        begin
          icount := icount + 1;

          VATCode := fieldbyname('Vat_Code').asinteger;
          VATRate := fieldbyname('VAT_Rate').asfloat;
          Nominal := fieldbyname('Sales_Nominal').asstring;
          SONumber := fieldbyname('Sales_Order').asinteger;
          SOLine := fieldbyname('Sales_Order_Line_no').asinteger;
          QtyInvoiced := fieldbyname('Quantity_Delivered').asinteger;

          TotalGoodsValue := ((fieldbyname('Quantity_Delivered').asinteger/fieldbyname('Sell_Pack_Quantity').asinteger) * fieldbyname('Part_Sales_Price').asfloat);
          TotalCostValue := ((fieldbyname('Quantity_Delivered').asinteger/fieldbyname('Purch_Pack_Quantity').asinteger) * fieldbyname('Part_Cost').asfloat);

          if icount = 1 then
            begin
              CustOrderNo := '';
              Reference := fieldbyname('Sales_order').asstring;
              InvoiceDescription := 'Orders between '+ edtDateFrom.Text + ' to ' + edtDateTo.Text;
              Rep := fieldbyname('Rep').asinteger;
              ProductType := fieldbyname('Product_type').asinteger;

              {Create the Invoice Header and a basic invoice line}
              CreateInvoiceHeader;
            end;
          {Update the sales order line with the invoice quantity}
          UpdateSalesOrderLine;

          {Create an invoice detail line for each record}
          CreateInvoiceDetails;

          InvoiceGoodsTotal := InvoiceGoodsTotal + TotalGoodsValue;
          InvoiceCostTotal := InvoiceCostTotal + TotalCostValue;
          next;
          if fieldbyname('Sales_Order').asinteger <> SONumber then
            UpdateSalesOrder;
        end;
      if icount > 0 then
        {Create an invoice sundry line with all the totals}
        CreateInvoiceSundry;
    end;
  bOK := (icount > 0);

  if bOK then
    begin
      MessageDlg('Sales invoice created for the selected period', mtInformation, [mbOK], 0);
      close;
    end
  else
    begin
      MessageDlg('No invoices created for the selected period, please modify your selection.', mtInformation, [mbOK], 0);
    end;
end;

procedure TPBRSCustInvoiceFrm.UpdateSalesOrderLine;
var
  NewSILine: integer;
begin
  with aInvoice.Datamodule.qrySOUpLine do
  begin
    close;
    ParamByName('Sales_Order').Asinteger := SONumber;
    ParamByName('Sales_Order_Line').AsInteger := SOLine;
    ParamByName('Quantity_Invoiced').Asfloat := QtyInvoiced;
    ExecSQL;
  end;
end;

procedure TPBRSCustInvoiceFrm.CreateInvoiceHeader;
var
  NewSILine: integer;
begin

//  aInvoice := TSalesInvoice.Create(dmSalesInvoice);

  DbKey := aInvoice.Datamodule.GetNextSINumber;

  {Add the sales invoice header}
  with aInvoice.Datamodule.qrySIAddHeader do
    begin
      close;
      ParamByName('Sales_Invoice').AsInteger := DbKey;
      ParambyName('Invoice_Date').asdatetime := date;
      ParamByName('Customer').AsInteger := Customer;
      ParamByName('Branch_no').AsInteger := 0;
      Parambyname('Cust_Order_No').AsString := CustOrderNo;
      ParamByName('Goods_Value').Asfloat := 0.00;
      ParamByName('Vat_Value').Asfloat := 0.00;
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      ParambyName('Sales_Invoice_no').asstring := '';
      ParamByName('Sales_invoice_Status').AsInteger := 10;
      ParamByName('Currency_Code').clear;
      ParamByName('Inv_to_Customer').Asinteger := Customer;
      ParamByName('Inv_to_Branch').Asinteger := 0;
      ParamByName('Invoice_or_Credit').Asstring := 'I';
      ParambyName('Paid_Status').asstring := 'N';
      ParamByName('Paid_Amount').Asfloat := 0;
      ParamByName('Paid_Date').clear;
      ParamByName('Sales_invoice_type').Asstring := 'S';
      ParamByName('Inactive').clear;
      ParambyName('Period_End_run').clear;
      Parambyname('Invoice_Location').clear;
      Parambyname('Reference').asstring := Reference;
      Parambyname('Rep').asinteger := Rep;
      Parambyname('Invoice_Description').asstring := InvoiceDescription;

      Parambyname('Electronic_Invoice').asstring := 'N';

      ParamByName('Cash_Sales').asString := 'N';
      ParamByName('Account_Number').Clear;
      ParamByName('Account_Month').Clear;
      ParamByName('Account_Year').Clear;
      ParamByName('Contact_no').Clear;
      ParamByName('Contact_Name').Clear;

      ParambyName('Category').clear;
      ParambyName('Credit_Note_Reason').clear;
      Parambyname('Print_as_Delivery_Note').asstring := 'N';
      ExecSQL;
    end;
  {Add the Sales Invoice line}
  with aInvoice.Datamodule.qrySIAddLine do
  begin
    ParamByName('Sales_invoice').AsInteger := DbKey;

    NewSILine := aInvoice.DataModule.GetNextSILNumber(DbKey);
    ParamByName('Invoice_Line_no').AsInteger := NewSILine;

    ParamByName('Purchase_order').clear;
    ParamByName('Line').clear;
    ParambyName('Cost_Price').asfloat := 0;
    ParambyName('Credit_Type').asstring := '';
    ParamByName('Qty_Invoiced').Asfloat := 0;
    ParamByName('Goods_Value').Asfloat := 0;
    ParamByName('Vat_Code').asinteger := VatCode;
    ParamByName('Vat_Value').asfloat := 0.00;

    if ProductType = 0 then
      ParamByName('Product_Type').clear
    else
      ParamByName('Product_Type').AsInteger := ProductType;
    if PriceUnit = 0 then
      ParamByName('Price_Unit').AsInteger := aInvoice.DataModule.GetDefPriceUnit
    else
      ParamByName('Price_Unit').AsInteger := PriceUnit;
    if Nominal = '' then
      ParamByName('Nominal').AsString := aInvoice.DataModule.GetDefSalesNominal
    else
      ParamByName('Nominal').AsString := Nominal;
    ParamByName('Not_Printed').asstring := 'Y';
    ParamByName('Job_Bag').clear;
    ParamByName('Job_Bag_Line').clear;
    ParamByName('Narrative').clear;
    ParamByName('Reference').asstring := '';
    ParamByName('Internal_Narrative').clear;
    ParamByName('Sales_order').asfloat := SONumber;
    ParamByName('Sales_Order_Line_no').asinteger := SOLine;
    ParamByName('Sales_Invoice_Status').asinteger := 10;
    ExecSQL;
  end;

(*  with aInvoice.Datamodule.qrySOUpLine do
  begin
    close;
    ParamByName('Sales_Order').Asinteger := SONumber;
    ParamByName('Sales_Order_Line').AsInteger := SOLine;
    ParamByName('Quantity_Invoiced').Asfloat := QtyInvoiced;
    ExecSQL;
  end;
*)
end;

procedure TPBRSCustInvoiceFrm.UpdateSalesOrder;
var
  orderStatus: integer;
begin
  {Check the status of SO Lines}
  with aInvoice.Datamodule.qrySOChkStatus do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      open;

      if FieldByName('Qty_Inv').AsInteger = 0 then
        orderstatus := 150
      else
      if FieldByName('Qty_Not_Inv').AsInteger > 0 then
        orderstatus := 200
      else
        orderstatus := 250;
    end;

  {Update the SO Status}
  with aInvoice.Datamodule.qrySOUpHead do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      ParamByName('Sales_Order_Head_Status').AsInteger := orderstatus;
      execsql;
    end;
end;

procedure TPBRSCustInvoiceFrm.CreateInvoiceDetails;
var
  NewSIDetail: integer;
begin
  {Add the Sales Invoice Details}
  with aInvoice.Datamodule.qrySIAddDetail do
  begin
    ParamByName('Sales_invoice').AsInteger := DbKey;

    NewSIDetail := aInvoice.DataModule.GetNextSIDNumber(DbKey);
    ParamByName('Sales_Invoice_Detail_no').AsInteger := NewSIDetail;

    ParamByName('Sales_order').asfloat := SONumber;
    ParamByName('Sales_Order_Line_no').asinteger := SOLine;
    ParamByName('Qty_Invoiced').Asfloat := QtyInvoiced;
    ParamByName('Total_Goods_Value').asfloat := TotalGoodsValue;
    ParamByName('Total_Vat_Value').asfloat := (TotalGoodsValue * (VATRate/100));
    ParambyName('Total_Cost_Value').asfloat := TotalCostValue;
    ParamByName('Vat_Code').asinteger := VatCode;
    ExecSQL;
  end;
end;

procedure TPBRSCustInvoiceFrm.CreateInvoiceSundry;
var
  NewSIDetail: integer;
  OrderStatus: integer;
begin
  {Add the Sales Invoice Details}
  with aInvoice.DataModule.qrySIAddCharge do
  begin
    ParamByName('Sales_invoice').AsInteger := DbKey;
    ParamByName('Additional_Charge').AsInteger := 1;
    ParamByName('Details').Asstring := InvoiceDescription;
    ParamByName('Amount').Asfloat := InvoiceGoodsTotal;
    ParamByName('Nominal').Asstring := aInvoice.DataModule.GetDefSalesNominal;
    ParamByName('Vat_Code').Asinteger := VatCode;
    ParamByName('Invoice_Line_no').asinteger := 1;
    ParamByName('cost_price').asFloat := InvoiceCostTotal;
    ExecSQL;
  end;

  {Add the sales invoice header}
  with aInvoice.Datamodule.qrySIUpHeader do
    begin
      close;
      ParamByName('Sales_Invoice').AsInteger := DbKey;
      ParamByName('Invoice_date').Asdatetime := date;
      ParamByName('Customer').AsInteger := Customer;
      ParamByName('Branch_no').AsInteger := 0;
      Parambyname('Cust_Order_No').AsString := CustOrderNo;
      ParamByName('Goods_Value').Asfloat := InvoiceGoodsTotal;
      ParamByName('Vat_Value').Asfloat := (InvoiceGoodsTotal*(VatRate/100));
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      ParambyName('Sales_Invoice_no').asstring := '';
      ParamByName('Sales_invoice_Status').AsInteger := 10;
      ParamByName('Currency_Code').clear;
      ParamByName('Inv_to_Customer').Asinteger := Customer;
      ParamByName('Inv_to_Branch').Asinteger := 0;
      ParamByName('Invoice_or_Credit').Asstring := 'I';
      ParambyName('Paid_Status').asstring := 'N';
      ParamByName('Paid_Amount').Asfloat := 0;
      ParamByName('Paid_Date').clear;
      ParamByName('Sales_invoice_type').Asstring := 'S';
      ParamByName('Inactive').clear;
      ParambyName('Period_End_run').clear;
      Parambyname('Invoice_Location').clear;
      Parambyname('Reference').asstring := Reference;
      Parambyname('Rep').asinteger := Rep;
      Parambyname('Invoice_Description').asstring := InvoiceDescription;

      Parambyname('Electronic_Invoice').asstring := 'N';

      ParamByName('Cash_Sales').asString := 'N';
      ParamByName('Account_Number').Clear;
      ParamByName('Account_Month').Clear;
      ParamByName('Account_Year').Clear;
      ParamByName('Contact_no').Clear;
      ParamByName('Contact_Name').Clear;

      ParambyName('Category').clear;
      ParambyName('Credit_Note_Reason').clear;
      Parambyname('Print_as_Delivery_Note').asstring := 'N';
      ExecSQL;
    end;

  {Update the final Sales Order}
  {Check the status of SO Lines}
  with aInvoice.Datamodule.qrySOChkStatus do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      open;

      if FieldByName('Qty_Inv').AsInteger = 0 then
        orderstatus := 150
      else
      if FieldByName('Qty_Not_Inv').AsInteger > 0 then
        orderstatus := 200
      else
        orderstatus := 250;
    end;

  {Update the SO Status}
  with aInvoice.Datamodule.qrySOUpHead do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      ParamByName('Sales_Order_Head_Status').AsInteger := orderstatus;
      execsql;
    end;
end;

end.
