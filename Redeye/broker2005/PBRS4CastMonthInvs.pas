unit PBRS4CastMonthInvs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, Printers, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRS4CastMonthInvsFrm = class(TForm)
    TotByRadioGroup: TRadioGroup;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    Label2: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    rdgrpReportType: TRadioGroup;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    lblProcessing: TLabel;
    prgrsbrPeriodEnd: TProgressBar;
    qryGetPeriod: TFDQuery;
    qrySalesProfit: TFDQuery;
    qryDeleteAnalysis: TFDQuery;
    qryGetIntSel: TFDQuery;
    ExcOnHoldCheckBox: TCheckBox;
    chkbxincludezero: TCheckBox;
    chkbxExcludeInvoices: TCheckBox;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure DateFromEditChange(Sender: TObject);
    procedure DateToEditChange(Sender: TObject);
    procedure chkbxincludezeroClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    IntSelCode: integer;
    Analysis: integer;
    AnalysisType: integer;
    AccountManager: integer;
    AccountTeam: integer;
    Category: integer;
    Customer: integer;
    CustomerBranch: integer;
    Line: integer;
    InvoiceNumber: string;
    InvoiceRep: integer;
    JobBag: integer;
    JobBagLine: integer;
    Operator: integer;
    Period: integer;
    ProductType: integer;
    PurchaseOrder: real;
    QtyInvoiced: integer;
    Rep: integer;
    RepTeam: integer;
    RepResponsibility: real;
    SalesInvoice: integer;
    SalesOrder: integer;
    SOLine: integer;
    Supplier: integer;
    SupplierBranch: integer;
    TotalCostValue: double;
    TotalSalesValue: double;
    procedure BuildForecast;
    procedure CallReport(const bPreview: Boolean);
    procedure BuildInvoiceDetails;
    function GetTotalValue(TempQty, TempFactor: integer;
      TempValue: double): real;
    procedure DoOneAnalysisRecord(AnalysisType: integer);
    procedure GetPeriodFromAndToDates;
    procedure BuildPurchaseOrders;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure BuildJBPurchaseOrders;
    procedure BuildJobBagLines;
    procedure FixQuery(rep: Boolean);
    function BuildQueryString(rep: Boolean): string;
    procedure DeleteAnalysis;
  private
    bChanged: boolean;
  public
    icounter: integer;
    InvoiceDateFrom, InvoiceDateTo: TDateTime;
    DateFrom, DateTo: TDateTime;
  end;

var
  PBRS4CastMonthInvsFrm: TPBRS4CastMonthInvsFrm;

implementation

uses pbDatabase, CCSCommon, PBPeriodEndDM, DateSelV5, PBRP4CastMonthInvs;

{$R *.dfm}

const
  SQLByCategory =
  'SELECT 	Analysis_type, '+
	'Analysis.Category, '+
	'Category.Description, '+
	'sum(Total_Sales_Value) as Total_sales, '+
	'sum(Total_Cost_Value) as Total_Cost,  '+
	'sum(Total_Sales_Value - Total_Cost_Value) as Margin '+
  'FROM Analysis, Category '+
  'WHERE Analysis.Category = category.category ';

  SQLByRep =
  'SELECT 	Analysis_type, '+
	'Analysis.Rep, '+
	'Rep.Name as Description, '+
	'sum(Total_Sales_Value) as Total_sales, '+
	'sum(Total_Cost_Value) as Total_Cost,  '+
	'sum(Total_Sales_Value - Total_Cost_Value) as Margin '+
  'FROM Analysis, Rep '+
  'WHERE Analysis.Rep = Rep.Rep ';

  SQLByCustomer =
  'SELECT 	Analysis_type, '+
	'Analysis.Customer, '+
	'Customer.Name as Description, '+
	'sum(Total_Sales_Value) as Total_sales, '+
	'sum(Total_Cost_Value) as Total_Cost,  '+
	'sum(Total_Sales_Value - Total_Cost_Value) as Margin '+
  'FROM Analysis, Customer '+
  'WHERE Analysis.Customer = Customer.Customer ';


  SQLByAccMan =
  'SELECT 	Analysis_type, '+
	'Analysis.Office_Contact, '+
	'Operator.Name as Description, '+
	'sum(Total_Sales_Value) as Total_sales, '+
	'sum(Total_Cost_Value) as Total_Cost,  '+
	'sum(Total_Sales_Value - Total_Cost_Value) as Margin '+
  'FROM Analysis, Operator '+
  'WHERE Analysis.Office_Contact = Operator.Operator ';

  SQLCoreSalesInv =
  'SELECT 	Sales_Invoice.Sales_Invoice, '+
	'Sales_Invoice.Sales_Invoice_No, '+
	'Sales_Invoice.Invoice_Date, '+
  'Sales_invoice.Invoice_or_Credit, '+
	'Sales_Invoice.Customer, '+
	'Sales_Invoice.Branch_no as Customer_Branch, '+
	'Sales_Invoice.Sales_Invoice_Status, '+
	'Sales_Invoice.Sales_invoice_type, '+
        'Sales_Invoice.Rep, '+
	'Sales_Invoice_Line.Purchase_Order, '+
	'Sales_Invoice_Line.Line, '+
	'Sales_Invoice_Line.Qty_Invoiced, '+
	'Sales_Invoice_Line.Goods_Value, '+
	'Sales_Invoice_Line.Vat_Code, '+
	'Sales_Invoice_Line.Vat_Value, '+
	'Sales_Invoice_Line.Price_Unit, '+
	'Price_Unit.Price_Unit_Factor, '+
	'Sales_Invoice_Line.Job_Bag, '+
	'Sales_Invoice_Line.Job_Bag_Line, '+
	'Sales_Invoice_Line.Sales_order, '+
	'Sales_Invoice_Line.Sales_order_line_no, '+
  'Sales_Invoice_Line.Credit_Type, '+
  'Sales_Invoice_Line.Product_Type, '+
	'(select sum(Amount) '+
  '	 FROM Sales_invoice_Add_charge  '+
  '	 WHERE (Sales_invoice_Add_charge.Sales_invoice = Sales_invoice.Sales_invoice)) as Total_Charges '+
  'FROM Price_Unit '+
	'INNER JOIN (Customer '+
	'INNER JOIN (Customer_Branch '+
	'INNER JOIN (Sales_Invoice '+
	'INNER JOIN Sales_Invoice_Line ON '+
	'	Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
	'	(Customer_Branch.Branch_no = Sales_Invoice.Branch_no) AND '+
	'	(Customer_Branch.Customer = Sales_Invoice.Customer)) ON '+
	'	Customer.Customer = Customer_Branch.Customer) ON '+
	'	Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit ';

  SQLCorePOs =
  'SELECT '+
  'Delivery_Detail.Purchase_Order, '+
	'Delivery_Detail.Line, '+
	'Delivery_Detail.Delivery_no, '+
	'Purchase_OrderLine.Cust_Order_No, '+
	'Delivery_Detail.Date_Point AS Delivery_Date, '+
	'Delivery_Detail.Date_Deliv_Actual, '+
	'Purchase_OrderLine.Purch_Ord_Line_Status, '+
	'Purchase_OrderLine.Proof_Required, '+
	'Purchase_OrderLine.Goods_Required, '+
	'Purchase_OrderLine.Customers_Desc, '+
	'Purchase_OrderLine.Customer, '+
	'Purchase_OrderLine.Branch_no as Customer_Branch, '+
	'Purchase_OrderLine.Product_Type, '+
	'Purchase_OrderLine.On_Hold, '+
	'Purchase_OrderLine.Quantity, '+
	'Purchase_Order.Date_Point, '+
	'Form_Reference.Form_Reference_ID, '+
	'Customer.Name, Supplier_Branch.Account_Code, '+
	'Rep.Name AS Rep_Name, '+
	'Purchase_OrderLine.Rep, '+
	'Delivery_Detail.Qty_to_Deliver, '+
	'Delivery_Detail.Qty_Delivered, '+
	'Purchase_OrderLine.Selling_Price, '+
	'Price_Unit.Price_Unit_Factor, '+
	'Purchase_OrderLine.Order_Price as Cost_Price, '+
	'Cost_Unit.Price_Unit_Factor as Cost_Unit_Factor, '+
	'Purchase_order.Office_Contact, '+
	'Purchase_order.Supplier, '+
	'Purchase_order.Branch_no as Supplier_Branch, '+
	'Purchase_order.Account_Team, '+
	'Operator.Name as Account_Manager, '+
	'(select sum(Quotation_Price) '+
  '	 FROM Purch_Ord_Line_Add_Chg  '+
  '	 WHERE  (Purch_Ord_Line_Add_Chg.Purchase_Order = Purchase_OrderLine.Purchase_Order) AND '+
  '         (Purch_Ord_Line_Add_Chg.Line = Purchase_OrderLine.Line) AND '+
  '         (Purch_Ord_Line_Add_Chg.Sales_Profit is NULL)) as Total_Charges, '+
  '(select top 1 Job_Bag '+
  ' from Job_Bag_Line_dets '+
  ' where Job_Bag_Line_dets.Purchase_Order = Purchase_OrderLine.Purchase_Order) as Job_Bag, '+
  '(select top 1 Job_Bag_Line '+
  ' from Job_Bag_Line_dets '+
  ' where Job_Bag_Line_dets.Purchase_Order = Purchase_OrderLine.Purchase_Order AND '+
  '       Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as Job_Bag_Line '+
  'FROM Price_Unit AS Cost_Unit '+
	'RIGHT JOIN (Supplier_Branch '+
	'INNER JOIN (Purch_Ord_line_Status '+
	'INNER JOIN (Rep '+
	'INNER JOIN ((Customer '+
	'INNER JOIN Customer_Branch ON Customer.Customer = Customer_Branch.Customer) '+
	'INNER JOIN ((Price_Unit '+
	'INNER JOIN (Purchase_OrderLine '+
	'LEFT JOIN Form_Reference ON Purchase_OrderLine.Form_Reference = Form_Reference.Form_Reference) '+
	'	ON Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit) '+
	'INNER JOIN (Operator '+
	'INNER JOIN (Delivery_Detail '+
	'INNER JOIN Purchase_Order ON Delivery_Detail.Purchase_Order = Purchase_Order.Purchase_Order) '+
	'	ON Operator.Operator = Purchase_Order.Office_Contact) '+
	'	ON (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_Order) AND (Purchase_OrderLine.Line = Delivery_Detail.Line) AND (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_Order)) '+
	'	ON (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) AND (Customer_Branch.Customer = Purchase_OrderLine.Customer)) '+
	'	ON Rep.Rep = Purchase_OrderLine.Rep) '+
	'	ON Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_OrderLine.Purch_Ord_Line_Status) '+
	'	ON (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND (Supplier_Branch.Supplier = Purchase_Order.Supplier)) '+
	'	ON Cost_Unit.Price_Unit = Purchase_OrderLine.Order_Unit '+
  'WHERE ((Purchase_OrderLine.Purch_Ord_Line_Status>=20) And '+
	'(Purchase_OrderLine.Purch_Ord_Line_Status<=24) OR '+
  '(Purchase_OrderLine.Ready_to_Invoice = ''Y'')) AND '+
  '  ((Purchase_orderline.Inactive <> ''Y'') or '+
  '  (Purchase_orderline.Inactive is null)) and '+
  '  (not((Delivery_to_Stock = ''Y'') and '+
  '  (Delivery_Detail.Date_deliv_actual is not null) and '+
  '  ((Purchase_orderLine.Invoice_upfront <> ''Y'') or '+
  '  (Purchase_orderLine.Invoice_upfront is null)))) and '+
  '  ((Delivery_Detail.Purchase_order not in '+
	'     (SELECT DD.Purchase_order '+
  '      FROM Delivery_Detail DD, Purchase_orderLine POL '+
  '      WHERE date_Deliv_Actual is not NULL and '+
  '         Calloff_invoiced_upfront = ''Y'' and '+
  '         DD.Purchase_order = POL.Purchase_order and '+
  '         DD.Line = POL.Line))) ';

//  '   (not((Delivery_Detail.Date_deliv_actual is not null) and ' +
//  '  (Purchase_orderline.Selling_Price = 0.000))) and '+

  SQLCoreJBL =
  'SELECT 	Job_Bag_Line_Dets.Job_Bag, '+
	'Job_Bag_Line_Dets.Job_Bag_Line, '+
	'Job_Bag_Line_Dets.Job_Bag_Line_Type, '+
	'Job_Bag_Line_Dets.Job_Bag_Line_Descr, '+
	'Job_Bag_Line_Dets.Job_Bag_Line_Cost, '+
	'Job_Bag_Line_Dets.Job_Bag_Line_Sell, '+
	'Job_Bag_Line_Dets.Job_Bag_Line_Invoiced, '+
	'Job_Bag_Line_Dets.Job_Bag_Quantity as Quantity, '+
	'Job_Bag_Line_Dets.VAT_Code, '+
	'Job_Bag_Line_Dets.Supplier, '+
	'Job_Bag_Line_Dets.Branch_no as Supplier_Branch, '+
	'Job_Bag_Line_Dets.VAT_Code, '+
	'Job_Bag_Line_Dets.supp_inv_recd, '+
	'Job_Bag_Line_Dets.Product_Type, '+
	'Job_Bag_Line_Dets.works_order, '+
	'Job_Bag_Line_Dets.sales_order, '+
	'Job_Bag_Line_Dets.sales_order_line_no, '+
	'Job_Bag_Line_Dets.price_unit, '+
	'Job_Bag_Line_Dets.selling_price, '+
	'Job_Bag.Customer, '+
	'Job_Bag.Branch_No as Customer_Branch, '+
	'Job_Bag.Date_Point, '+
	'Job_Bag.Rep, '+
	'Job_Bag.Cust_Order_No, '+
	'Job_Bag.Goods_Required as Delivery_Date, '+
	'Job_Bag.InActive, '+
	'Job_Bag.Office_Contact, '+
	'Job_Bag.Account_Team, '+
	'Job_Bag.Job_Bag_Status, '+
	'Job_Bag.Job_Bag_Descr, '+
	'Customer.Name as Customer_Name, Rep.Name as Rep_Name, '+
  '(select Price_Unit_Factor '+
  'from Price_Unit '+
  'where Price_unit.Price_unit = Job_Bag_Line_Dets.Price_Unit) as Price_Unit_Factor, '+
	'Operator.Name as Account_Name, '+
  'Supplier_Branch.Account_Code, '+
	'Supplier.Name as Supplier_Name '+
  'FROM (Supplier '+
	'INNER JOIN Supplier_Branch ON Supplier.Supplier = Supplier_Branch.Supplier) '+
	'INNER JOIN (Customer '+
	'INNER JOIN ((Rep '+
	'INNER JOIN (Customer_Branch '+
	'INNER JOIN (Operator '+
	'RIGHT JOIN Job_Bag ON Operator.Operator = Job_Bag.Office_Contact) '+
	'	ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Customer_Branch.Customer = Job_Bag.Customer)) '+
	'	ON Rep.Rep = Job_Bag.Rep) '+
	'INNER JOIN Job_Bag_Line_Dets ON Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) '+
	'	ON Customer.Customer = Customer_Branch.Customer) '+
	'	ON (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_No) AND (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplier) '+
  'WHERE ((Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = ''P'') OR '+
	'	(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = ''N'')) AND '+
  '((Job_Bag.inactive = ''N'') OR (Job_Bag.inactive is NULL))';

procedure TPBRS4CastMonthInvsFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRS4CastMonthInvsFrm.CallReport(const bPreview: Boolean);
var
  PBRP4CastMonthInvsFrm: TPBRP4CastMonthInvsFrm;
  PrinterSettings: TPrinterSettings;
begin
  if bChanged then
    begin
      DeleteAnalysis;
      if not chkbxExcludeInvoices.checked then
        BuildInvoiceDetails;
      BuildPurchaseOrders;
      BuildJBPurchaseOrders;
      BuildJobBagLines;
    end;

  bChanged := false;

  qrySalesProfit.Close;
  fixquery(True);

  PBRP4CastMonthInvsFrm := TPBRP4CastMonthInvsFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRP4CastMonthInvsFrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRP4CastMonthInvsFrm.qrySalesProfit.SQL.Clear;

          PBRP4CastMonthInvsFrm.qrySalesProfit.SQL.Text := qrySalesProfit.Text;
          PBRP4CastMonthInvsFrm.qrlblTitle.caption := PBRP4CastMonthInvsFrm.qrlblTitle.caption + DateToStr(Date);
          if bPreview then
            PBRP4CastMonthInvsFrm.qckrpSalesProfit.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRP4CastMonthInvsFrm.qckrpSalesProfit.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qrySalesProfit.Open;
  end;

end;

procedure TPBRS4CastMonthInvsFrm.FixQuery(rep: Boolean);
begin
  qrySalesProfit.DisableControls;
  try
    qrySalesProfit.Close;
    qrySalesProfit.SQL.Clear;
    qrySalesProfit.SQL.text := BuildQueryString(rep);
    qrySalesProfit.Open;
  finally
    qrySalesProfit.EnableControls;
  end;
end;

function TPBRS4CastMonthInvsFrm.BuildQueryString(rep: Boolean): string;
var
  sTemp: string;
begin
  case totbyRadioGroup.ItemIndex of
  0:
    begin
      sTemp := SQLbyCategory;
      sTemp := sTemp + ' AND Operator = ' + inttostr(IntselCode);
      sTemp := sTemp + 'GROUP BY Analysis_Type, ';
	    sTemp := sTemp + 'Analysis.Category, ';
	    sTemp := sTemp + 'Category.Description ';
      sTemp := sTemp + 'ORDER BY Analysis_Type, Category.Description ';
    end;
  1:
    begin
      sTemp := SQLbyCustomer;
      sTemp := sTemp + ' AND Operator = ' + inttostr(IntselCode);
      sTemp := sTemp + 'GROUP BY Analysis_Type, ';
	    sTemp := sTemp + 'Analysis.Customer, ';
	    sTemp := sTemp + 'Customer.Name ';
      sTemp := sTemp + 'ORDER BY Analysis_Type, Customer.Name ';
    end;
  2:
    begin
      sTemp := SQLbyRep;
      sTemp := sTemp + ' AND Operator = ' + inttostr(IntselCode);
      sTemp := sTemp + 'GROUP BY Analysis_Type, ';
	    sTemp := sTemp + 'Analysis.Rep, ';
	    sTemp := sTemp + 'Rep.Name ';
      sTemp := sTemp + 'ORDER BY Analysis_Type, Rep.Name ';
    end;
  3:
    begin
      sTemp := SQLbyAccMan;
      sTemp := sTemp + ' AND Analysis.Operator = ' + inttostr(IntselCode);
      sTemp := sTemp + 'GROUP BY Analysis_Type, ';
	    sTemp := sTemp + 'Analysis.Office_Contact, ';
	    sTemp := sTemp + 'Operator.Name ';
      sTemp := sTemp + 'ORDER BY Analysis_Type, Operator.Name ';
    end;
  end;

  Result := sTemp;
end;

procedure TPBRS4CastMonthInvsFrm.BuildInvoiceDetails;
var
  sTemp : string;
{ Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
  function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
var
  iTotal, i: integer;
  TotalRepSplit: real;
begin
  {Look for Sales Invoices}
  sTemp := SQLCoreSalesInv;
  sTemp := sTemp + ' WHERE Sales_Invoice.Sales_Invoice_Status > 10 ';
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date >= ' + qDate(InvoiceDateFrom);
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(InvoiceDateTo);
  sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';

  {Used for progress bar}
  i := 0;
  icounter := 0;

  lblProcessing.caption := 'Stage 1 of 4 - Processing invoices';

  with dmPeriodEnd.qrySalesInv do
    begin
      close;
      sql.text := sTemp;
      open;
      first;

      iTotal := recordcount;
      SalesOrder := 0;

      InvoiceNumber := '';
      while eof <> true do
        begin
          inc(i);

          SalesInvoice := fieldbyname('Sales_Invoice').asinteger;

          {Convert Qty Invoiced to +ve value to calc Sales Value correctly}
          if fieldbyname('Invoice_or_Credit').asstring = 'C' then
            QtyInvoiced := fieldbyname('Qty_Invoiced').asinteger * -1
          else
            QtyInvoiced := fieldbyname('Qty_Invoiced').asinteger;


          TotalSalesValue :=
            GetTotalValue(QtyInvoiced,
                          fieldbyname('Price_unit_Factor').asinteger,
                          fieldbyname('Goods_Value').asfloat);

          if fieldbyname('Sales_invoice_no').asstring <> InvoiceNumber then
            TotalSalesValue := TotalSalesValue + fieldbyname('Total_Charges').asfloat;

          Customer := fieldbyname('Customer').asinteger;
          CustomerBranch := fieldbyname('Customer_Branch').asinteger;

          ProductType := fieldbyname('Product_Type').asinteger;
          Category := dmPeriodEnd.GetCategory(ProductType);

          PurchaseOrder := fieldbyname('Purchase_order').asfloat;
          Line := fieldbyname('Line').asinteger;

          SalesOrder := fieldbyname('Sales_order').asinteger;
          SOLine := fieldbyname('Sales_order_line_no').asinteger;

          JobBag := fieldbyname('Job_Bag').asinteger;
          JobBagLine := fieldbyname('Job_Bag_line').asinteger;

          InvoiceRep := fieldbyname('Rep').asinteger;

          if PurchaseOrder <> 0 then
            begin
              AccountManager := dmPeriodEnd.GetPOAccountMgr(PurchaseOrder);
              AccountTeam := dmPeriodEnd.GetPOAccountTeam(PurchaseOrder);
              Supplier := dmPeriodEnd.GetPOSupplier(PurchaseOrder);
              SupplierBranch := dmPeriodEnd.GetPOSupplierBR(PurchaseOrder);
//              Rep := dmPeriodEnd.GetPORep(PurchaseOrder,Line);
              TotalCostValue := dmPeriodEnd.GetPOTotalCost(PurchaseOrder,Line,fieldbyname('Qty_Invoiced').asinteger);
            end
          else
          if SalesOrder <> 0 then
            begin
              AccountManager := dmPeriodEnd.GetSOAccountMgr(SalesOrder);
              AccountTeam := dmPeriodEnd.GetSOAccountTeam(SalesOrder);
              Supplier := dmPeriodEnd.GetSOSupplier(SalesOrder);
              SupplierBranch := dmPeriodEnd.GetSOSupplierBR(SalesOrder);
//              Rep := dmPeriodEnd.GetSORep(SalesOrder);
              TotalCostValue := dmPeriodEnd.GetSOTotalCost(SalesOrder,SOLine,fieldbyname('Qty_Invoiced').asinteger);

              if fieldbyname('Sales_order').asinteger <> SalesOrder then
                TotalCostValue := TotalCostValue + dmPeriodEnd.GetTotalCostCharges(SalesOrder);
              dmPeriodEnd.SetSPOAddCharges(SalesOrder);
            end
           else
          if JobBag <> 0 then
            begin
              {need to put in the details associated with the Job Bag sundry lines}
              AccountManager := dmPeriodEnd.GetJBAccountMgr(JobBag);
              AccountTeam := dmPeriodEnd.GetJBAccountTeam(JobBag);
              Supplier := dmPeriodEnd.GetJBSupplier(JobBag,JobBagLine);
              SupplierBranch := dmPeriodEnd.GetJBSupplierBR(JobBag,JobBagLine);
              TotalCostValue := dmPeriodEnd.GetJBTotalCost(JobBag,JobBagLine);
            end;

          if (fieldbyname('Invoice_or_Credit').asstring = 'C') and
             (fieldbyname('Credit_Type').asstring <> 'Q') then
            TotalCostValue := 0.00;

// Check which reps are responsible for this customer/branch, other than the rep on the invoice
// and find the responsibility split
// If a Rep isn't setup with any split then it all goes to the invoice rep

          TotalRepSplit := 100;

          with dmPeriodEnd.qryCustomerReps do
          begin
            close;
            parambyname('Customer').asinteger := Customer;
            parambyname('Branch_no').asinteger := CustomerBranch;
            parambyname('Rep').asinteger := InvoiceRep;
            open;

            first;
            while eof <> true do
            begin
              RepResponsibility := fieldbyname('Percentage').asfloat;
              Rep := fieldbyname('Rep').asinteger;
              RepTeam := dmPeriodEnd.GetRepTeam(Rep);
//  Assume that if a specific value is not set for a Rep against the customer then
// the invoice rep is allocated the whole of the split.
              if (RepResponsibility <> 0) and (RepResponsibility <> 100) then
              begin
                inc(icounter);
                Analysis := icounter;
                doOneAnalysisRecord(1);

                TotalRepSplit := TotalRepSplit - RepResponsibility;
              end;
              next;
            end;
          end;
          RepResponsibility := TotalRepSplit;
          Rep := InvoiceRep;
          RepTeam := dmPeriodEnd.GetRepTeam(Rep);

          inc(icounter);

          Analysis := icounter;
          doOneAnalysisRecord(1);

          InvoiceNumber := fieldbyname('Sales_invoice_no').asstring;

          prgrsBrPeriodEnd.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TPBRS4CastMonthInvsFrm.BuildPurchaseOrders;
var
  sTemp : string;
{ Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
  function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
var
  iTotal, i: integer;
  TotalRepSplit: real;
  PONumber: real;
begin
  {Look for Purchase Orders not in Job Bags}
  sTemp := SQLCorePOs;

  if not chkbxIncludezero.checked then
    sTemp := sTemp + ' AND (not((Delivery_Detail.Date_deliv_actual is not null) AND ' +
                '  (Purchase_orderline.Selling_Price = 0.00)))';

  if DateFromEdit.Text <> '' then
    sTemp := sTemp + ' AND Delivery_detail.Date_Point >= ' + qDate(DateFrom);
  if DateToEdit.Text <> '' then
    sTemp := sTemp + ' AND Delivery_Detail.Date_Point <= ' + qDate(DateTo);

  if ExcOnHoldCheckBox.checked then
    sTemp := sTemp + ' AND ((Purchase_OrderLine.On_Hold <> ''Y'') or (Purchase_OrderLine.On_Hold is null)) ';

  sTemp := sTemp + ' AND (select top 1 Job_Bag ';
  sTemp := sTemp + ' from Job_Bag_Line_dets ';
  sTemp := sTemp + ' where Job_Bag_Line_dets.Purchase_Order = Purchase_OrderLine.Purchase_Order) is NULL ';
  sTemp := sTemp + ' ORDER BY Purchase_OrderLine.Purchase_Order ';

  {Used for progress bar}
  i := 0;
  lblProcessing.caption := 'Stage 2 of 4 - Processing purchase orders not in job bags';

  with dmPeriodEnd.qry4Cast do
    begin
      close;
      sql.text := sTemp;
      open;
      first;

      iTotal := recordcount;
      SalesOrder := 0;

      PONumber := 0;
      while eof <> true do
        begin
          inc(i);

          SalesInvoice := 0;

          if fieldbyname('Purch_ord_line_status').asinteger <> 30 then
          begin
            if fieldByName('Date_Deliv_Actual').AsString  = '' then
              QtyInvoiced := fieldByName('Qty_to_Deliver').Asinteger
            else
              QtyInvoiced := fieldByName('Qty_Delivered').Asinteger;

            TotalSalesValue :=
              GetTotalValue(QtyInvoiced,
                          fieldbyname('Price_unit_Factor').asinteger,
                          fieldbyname('Selling_Price').asfloat);

            if fieldbyname('Purchase_Order').asfloat <> PONumber then
              TotalSalesValue := TotalSalesValue + fieldbyname('Total_Charges').asfloat;

            Customer := fieldbyname('Customer').asinteger;
            CustomerBranch := fieldbyname('Customer_Branch').asinteger;

            ProductType := fieldbyname('Product_Type').asinteger;
            Category := dmPeriodEnd.GetCategory(ProductType);

            PurchaseOrder := fieldbyname('Purchase_order').asfloat;
            Line := fieldbyname('Line').asinteger;

            SalesOrder := 0;
            SOLine := 0;

            JobBag := fieldbyname('Job_Bag').asinteger;
            JobBagLine := fieldbyname('Job_Bag_Line').asinteger;

            InvoiceRep := fieldbyname('Rep').asinteger;

            AccountManager := fieldbyname('Office_Contact').asinteger;
            AccountTeam := fieldbyname('Account_Team').asinteger;
            Supplier := fieldbyname('Supplier').asinteger;
            SupplierBranch := fieldbyname('Supplier_Branch').asinteger;
            Rep := fieldbyname('Rep').asinteger;
            RepResponsibility := 100;

            TotalCostValue := dmPeriodEnd.GetPOTotalCost(PurchaseOrder,Line,QtyInvoiced);

            RepTeam := dmPeriodEnd.GetRepTeam(Rep);

            inc(icounter);

            Analysis := icounter;
            doOneAnalysisRecord(2);

            PONumber := PurchaseOrder;
          end;
          prgrsBrPeriodEnd.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TPBRS4CastMonthInvsFrm.BuildJBPurchaseOrders;
var
  sTemp : string;
{ Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
  function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
var
  iTotal, i: integer;
  TotalRepSplit: real;
  PONumber: real;
begin
  {Look for Sales Invoices}
  sTemp := SQLCorePOs;

  if not chkbxIncludezero.checked then
    sTemp := sTemp + ' AND (not((Delivery_Detail.Date_deliv_actual is not null) AND ' +
                '  (Purchase_orderline.Selling_Price = 0.00)))';

  if DateFromEdit.Text <> '' then
    sTemp := sTemp + ' AND Delivery_detail.Date_Point >= ' + qDate(DateFrom);
  if DateToEdit.Text <> '' then
    sTemp := sTemp + ' AND Delivery_Detail.Date_Point <= ' + qDate(DateTo);

  if ExcOnHoldCheckBox.checked then
    sTemp := sTemp + ' AND ((Purchase_OrderLine.On_Hold <> ''Y'') or (Purchase_OrderLine.On_Hold is null)) ';

  sTemp := sTemp + ' AND (select top 1 Job_Bag ';
  sTemp := sTemp + ' from Job_Bag_Line_dets ';
  sTemp := sTemp + ' where Job_Bag_Line_dets.Purchase_Order = Purchase_OrderLine.Purchase_Order) <> NULL ';
  sTemp := sTemp + ' ORDER BY Purchase_OrderLine.Purchase_Order ';

  {Used for progress bar}
  i := 0;
  lblProcessing.caption := 'Stage 3 of 4 - Processing purchase orders IN job bags';

  with dmPeriodEnd.qry4Cast do
    begin
      close;
      sql.text := sTemp;
      open;
      first;

      iTotal := recordcount;
      SalesOrder := 0;

      PONumber := 0;
      while eof <> true do
        begin
          inc(i);

          if fieldbyname('Purch_ord_line_status').asinteger <> 30 then
          begin
            SalesInvoice := 0;

            if fieldByName('Date_Deliv_Actual').AsString  = '' then
              QtyInvoiced := fieldByName('Qty_to_Deliver').Asinteger
            else
              QtyInvoiced := fieldByName('Qty_Delivered').Asinteger;

            TotalSalesValue :=
              GetTotalValue(QtyInvoiced,
                          fieldbyname('Price_unit_Factor').asinteger,
                          fieldbyname('Selling_Price').asfloat);

            if fieldbyname('Purchase_Order').asfloat <> PONumber then
              TotalSalesValue := TotalSalesValue + fieldbyname('Total_Charges').asfloat;


            Customer := fieldbyname('Customer').asinteger;
            CustomerBranch := fieldbyname('Customer_Branch').asinteger;

            ProductType := fieldbyname('Product_Type').asinteger;
            Category := dmPeriodEnd.GetCategory(ProductType);

            PurchaseOrder := fieldbyname('Purchase_order').asfloat;
            Line := fieldbyname('Line').asinteger;

            SalesOrder := 0;
            SOLine := 0;

            JobBag := fieldbyname('Job_Bag').asinteger;
            JobBagLine := fieldbyname('Job_Bag_Line').asinteger;

            InvoiceRep := fieldbyname('Rep').asinteger;

            AccountManager := fieldbyname('Office_Contact').asinteger;
            AccountTeam := fieldbyname('Account_Team').asinteger;
            Supplier := fieldbyname('Supplier').asinteger;
            SupplierBranch := fieldbyname('Supplier_Branch').asinteger;
            Rep := fieldbyname('Rep').asinteger;
            RepResponsibility := 100;

            TotalCostValue := dmPeriodEnd.GetPOTotalCost(PurchaseOrder,Line,QtyInvoiced);

            RepTeam := dmPeriodEnd.GetRepTeam(Rep);

            inc(icounter);

            Analysis := icounter;
            doOneAnalysisRecord(3);

            PONumber := PurchaseOrder;
          end;

          prgrsBrPeriodEnd.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TPBRS4CastMonthInvsFrm.BuildJobBagLines;
var
  sTemp : string;
{ Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
  function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
var
  iTotal, i: integer;
  TotalRepSplit: real;
begin
  {Look for Sales Invoices}
  sTemp := SQLCoreJBL;

//  sTemp := sTemp + ' AND ((Job_Bag_Line_Dets.Job_Bag_Line_Type = ''A'') or (Job_Bag_Line_Dets.Job_Bag_Line_Type = ''S'') or (Job_Bag_Line_Dets.Job_Bag_Line_Type is NULL)) ';
  sTemp := sTemp + ' AND ((Job_Bag_Line_Dets.Job_Bag_Line_Type = ''A'') or (Job_Bag_Line_Dets.Job_Bag_Line_Type is NULL)) ';

  if DateFromEdit.Text <> '' then
    sTemp := sTemp + ' AND Job_Bag.Goods_Required >= ' + qDate(DateFrom);
  if DateToEdit.Text <> '' then
    sTemp := sTemp + ' AND Job_Bag.Goods_Required <= ' + qDate(DateTo);

  {Used for progress bar}
  i := 0;
  lblProcessing.caption := 'Stage 4 of 4 - Processing job bags';

  with dmPeriodEnd.qry4Cast do
    begin
      close;
      sql.text := sTemp;
      open;
      first;

      iTotal := recordcount;
      SalesOrder := 0;

      InvoiceNumber := '';
      while eof <> true do
        begin
          inc(i);

          SalesInvoice := 0;

          QtyInvoiced := fieldByName('Quantity').Asinteger;

(*          if fieldbyname('Sales_invoice_no').asstring <> InvoiceNumber then
            TotalSalesValue := TotalSalesValue + fieldbyname('Total_Charges').asfloat;
*)
          Customer := fieldbyname('Customer').asinteger;
          CustomerBranch := fieldbyname('Customer_Branch').asinteger;

          ProductType := fieldbyname('Product_Type').asinteger;
          Category := dmPeriodEnd.GetCategory(ProductType);

          PurchaseOrder := 0;
          Line := 0;

          if fieldbyname('Job_Bag_Line_Type').asstring = 'S' then
            begin
              SalesOrder := fieldbyname('Sales_Order').asinteger;
              SOLine := fieldbyname('Sales_Order_Line_no').asinteger;
              TotalCostValue := fieldbyname('Job_Bag_Line_Cost').asfloat;
              TotalSalesValue := fieldbyname('Job_Bag_Line_Sell').asfloat;
            end
          else
            begin
              JobBag := fieldbyname('Job_Bag').asinteger;
              JobBagLine := fieldbyname('Job_Bag_Line').asinteger;
              TotalCostValue := 0.00;
              TotalSalesValue := GetTotalValue(QtyInvoiced,
                                        fieldbyname('Price_unit_Factor').asinteger,
                                        fieldbyname('Selling_Price').asfloat);
            end;

          InvoiceRep := fieldbyname('Rep').asinteger;

          AccountManager := fieldbyname('Office_Contact').asinteger;
          AccountTeam := fieldbyname('Account_Team').asinteger;
          Supplier := fieldbyname('Supplier').asinteger;
          SupplierBranch := fieldbyname('Supplier_Branch').asinteger;
          Rep := fieldbyname('Rep').asinteger;
          RepResponsibility := 100;

//          TotalCostValue := dmPeriodEnd.GetPOTotalCost(PurchaseOrder,Line,QtyInvoiced);

          RepTeam := dmPeriodEnd.GetRepTeam(Rep);

          inc(icounter);

          Analysis := icounter;
          doOneAnalysisRecord(4);

          prgrsBrPeriodEnd.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

procedure TPBRS4CastMonthInvsFrm.FormActivate(Sender: TObject);
begin
  Period := dmBroker.GetCurrentPeriod;

  GetPeriodFromAndToDates;
end;

procedure TPBRS4CastMonthInvsFrm.GetPeriodFromAndToDates;
begin
  with qryGetPeriod do
    begin
      close;
      parambyname('Period').asinteger := Period;
      open;
      InvoiceDateFrom := fieldbyname('Last_Period_End_Date').asdatetime + 1;
      InvoiceDateTo := fieldbyname('Period_End_Date').asdatetime;
    end;
end;

procedure TPBRS4CastMonthInvsFrm.DoOneAnalysisRecord(AnalysisType: integer);
var
  i: integer;
begin
  with dmPeriodEnd.qryAddAnalysis do
    begin
      for i := 0 to pred(params.count) do
        params[i].clear;
      close;
      parambyname('Operator').asinteger := IntSelCode;
      parambyname('Analysis').asinteger := Analysis;
      parambyname('Analysis_Type').asinteger := AnalysisType;      {Analysis type set to 1 which is for Invoice}
      parambyname('Sales_Invoice').asinteger := SalesInvoice;
      parambyname('Total_Sales_Value').asfloat := TotalSalesValue * (RepResponsibility/100);
      parambyname('Total_Cost_Value').asfloat := TotalCostValue * (RepResponsibility/100);
      parambyname('Customer').asinteger := Customer;
      parambyname('Branch_no0').asinteger := CustomerBranch;
      parambyname('Rep').asinteger := Rep;
      parambyname('Supplier').asinteger := Supplier;
      parambyname('Branch_no').asinteger := SupplierBranch;

      if ProductType = 0 then
        parambyname('Product_Type').clear
      else
        parambyname('Product_Type').asinteger := ProductType;

      if Category = 0 then
        parambyname('Category').clear
      else
        parambyname('Category').asinteger := Category;

      if RepTeam = 0 then
        parambyname('Rep_Team').clear
      else
        parambyname('Rep_Team').asinteger := RepTeam;

      if AccountManager = 0 then
        parambyname('Office_Contact').clear
      else
        parambyname('Office_Contact').asinteger := AccountManager;

      if AccountTeam = 0 then
        parambyname('Account_Team').clear
      else
        parambyname('Account_Team').asinteger := AccountTeam;

      if PurchaseOrder = 0 then
        begin
          parambyname('Purchase_order').clear;
          parambyname('Line').clear;
        end
      else
        begin
          parambyname('Purchase_order').asfloat := PurchaseOrder;
          parambyname('Line').asinteger := Line;
        end;

      if SalesOrder = 0 then
        parambyname('sales_order').clear
      else
        parambyname('sales_order').asinteger := SalesOrder;

      if JobBag = 0 then
        begin
          parambyname('Job_Bag').clear;
          parambyname('Job_Bag_Line').clear;
        end
      else
        begin
          parambyname('Job_Bag').asfloat := JobBag;
          parambyname('Job_Bag_Line').asinteger := JobBagLine;
        end;

      execsql;
    end;
end;

procedure TPBRS4CastMonthInvsFrm.BuildForecast;
begin

end;

procedure TPBRS4CastMonthInvsFrm.FormCreate(Sender: TObject);
begin
  dmPeriodEnd := TdmPeriodEnd.create(self);
  with qryGetIntSel do
     begin
      Close ;
      Open ;
      Intselcode := FieldByName('Operator').AsInteger;
     end;
  bChanged := true;
end;

procedure TPBRS4CastMonthInvsFrm.DeleteAnalysis;
begin
  with qryDeleteAnalysis do
     begin
      Close ;
      ParamByName('Operator').AsInteger := IntSelCode ;
      ExecSQL ;
     end;
end;

function TPBRS4CastMonthInvsFrm.GetTotalValue(TempQty, TempFactor: integer; TempValue: double) : real;
begin
  if TempFactor = 0 then
    result := TempValue
  else
    begin
      result := ((TempQty/TempFactor) * TempValue);
    end;
end;

procedure TPBRS4CastMonthInvsFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

function TPBRS4CastMonthInvsFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRS4CastMonthInvsFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRS4CastMonthInvsFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRS4CastMonthInvsFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateFromEdit.Text <> '' then
  begin
    try
      NewDate := StrToDate(DatefromEdit.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        DateFromEdit.SetFocus;
        Exit;
      end;
    end;
    DateFromEdit.Text := PBDatestr(NewDate);
    DateFrom := NewDate;
  end;
end;

procedure TPBRS4CastMonthInvsFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateToEdit.Text <> '' then
  begin
  try
    NewDate := StrToDate(DateToEdit.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        DateToEdit.SetFocus;
        Exit;
      end;
    end;
    DateToEdit.Text := PBDatestr(NewDate);
    DateTo := NewDate;
  end;
end;

procedure TPBRS4CastMonthInvsFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRS4CastMonthInvsFrm.DateFromEditChange(Sender: TObject);
begin
  bChanged := true;
end;

procedure TPBRS4CastMonthInvsFrm.DateToEditChange(Sender: TObject);
begin
  bChanged := true;
end;

procedure TPBRS4CastMonthInvsFrm.chkbxincludezeroClick(Sender: TObject);
begin
  bChanged := true;
end;

procedure TPBRS4CastMonthInvsFrm.FormDestroy(Sender: TObject);
begin
  DeleteAnalysis;
  dmPeriodEnd.free;
end;

end.
