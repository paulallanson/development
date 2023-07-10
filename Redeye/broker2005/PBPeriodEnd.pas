unit PBPeriodEnd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, CCSCommon, DateSelV5, ComCtrls;

type
  TPBPeriodEndfrm = class(TForm)
    GroupBox1: TGroupBox;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    edtNextEndDate: TEdit;
    btnNextDate: TBitBtn;
    Label1: TLabel;
    lblLastEndDate: TLabel;
    edtCurrEndDate: TEdit;
    btnCurrDate: TBitBtn;
    lblProcessing: TLabel;
    prgrsbrPeriodEnd: TProgressBar;
    procedure FormActivate(Sender: TObject);
    procedure edtNextEndDateExit(Sender: TObject);
    procedure btnNextDateClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtCurrEndDateExit(Sender: TObject);
    procedure btnCurrDateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    DateNext, DateCurrent, DateLast: TDateTime;
    AccountManager: integer;
    AccountTeam: integer;
    Category: integer;
    Customer: integer;
    CustomerBranch: integer;
    Line: integer;
    InvoiceNumber: string;
    InvoiceRep: integer;
    SubRep: integer;
    InvoiceLocation: integer;
    JobBag: integer;
    JobBagLine: integer;
    NextPeriod: integer;
    Period: integer;
    ProductType: integer;
    PurchaseOrder: real;
    QtyInvoiced: integer;
    Rep: integer;
    RepTeam: integer;
    RepResponsibility: real;
    SalesInvoice: integer;
    SalesOrder: integer;
    SalesProfit: integer;
    SOLine: integer;
    Supplier: integer;
    SupplierBranch: integer;
    TotalCostValue: double;
    TotalInvCostValue: double;
    TotalSalesValue: double;
    procedure BuildSalesProfit;
    procedure DoOneSalesInvoice;
    function GetLastSalesProfit: integer;
    procedure GetPeriodDates;
    function GetTotalValue(TempQty, TempFactor: integer; TempValue: double) : real;
    function InputDate(TempDate: TDateTime): TDateTime;
    function setMonthEnd(TempDate: TDateTime): TDateTime;
    procedure GetCurrentPeriodDates;
    procedure SetPeriodDates;
    function qDate(const aDate : TDateTime) : string;
    procedure SetCurrentPeriodDates;
    procedure GetNextPeriodDates;
  public
  end;

var
  PBPeriodEndfrm: TPBPeriodEndfrm;

implementation

uses PBDatabase, PBPeriodEndDM, pbMainMenu;

{$R *.DFM}

const
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
  'Sales_Invoice.Sub_Rep, '+
  'Sales_Invoice.Invoice_Location, '+
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
  'Sales_Invoice_Line.Cost_Price, '+
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

procedure TPBPeriodEndfrm.FormActivate(Sender: TObject);
begin
//  GetPeriodDates;
  GetCurrentPeriodDates;
  if trim(edtCurrEndDate.text) = '' then
    begin
      MessageDlg('No period details are currently setup, ' +
                'enter the current financial year details through the ' +
                'database module.', mtInformation, [mbOk], 0);
      PostMessage(Handle, WM_Close, 0, 0);
      Exit;
    end;
  GetNextPeriodDates;
  if NextPeriod = 0 then
    begin
      MessageDlg('This is the last period of this financial year, ' +
                'in order to run this period end you must first ' +
                'create the next financial year', mtInformation, [mbOk], 0);
      PostMessage(Handle, WM_Close, 0, 0);
      Exit;
    end;
  dmBroker.ScreenAccessControl(Self,'mnuPeriodEnd',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBPeriodEndfrm.GetNextPeriodDates;
begin
  with dmPeriodEnd.qryGetPeriod do
    begin
      close;
      parambyname('Period').asinteger := period + 1;
      open;

      NextPeriod := fieldbyname('Period').asinteger
    end;
end;

procedure TPBPeriodEndfrm.GetPeriodDates;
begin
  with dmPeriodEnd.qryPeriod do
    begin
      close;
      open;
      Period := fieldbyname('Period').asinteger;
      edtCurrEndDate.text := PBDateStr(fieldbyname('Period_End_Date').asdatetime);
      DateCurrent := fieldbyname('Period_End_Date').asdatetime;

      lblLastEndDate.caption := PBDateStr(fieldbyname('Last_Period_End_Date').asdatetime);
      DateLast := fieldbyname('Last_Period_End_Date').asdatetime;

      edtNextEndDate.text := PBDateStr(setMonthEnd(fieldbyname('Period_End_Date').asdatetime));
      DateNext := setMonthEnd(fieldbyname('Period_End_Date').asdatetime);
    end;

end;

procedure TPBPeriodEndfrm.GetCurrentPeriodDates;
begin
  with dmPeriodEnd.qryCompany do
    begin
      close;
      open;
    end;

  with dmPeriodEnd.qryGetPeriod do
    begin
      close;
      parambyname('Period').asinteger := dmPeriodEnd.qryCompany.fieldbyname('Period').asinteger;
      open;
      Period := fieldbyname('Period').asinteger;
      edtCurrEndDate.text := PBDateStr(fieldbyname('Period_End_Date').asdatetime);
      DateCurrent := fieldbyname('Period_End_Date').asdatetime;

      lblLastEndDate.caption := PBDateStr(fieldbyname('Last_Period_End_Date').asdatetime);
      DateLast := fieldbyname('Last_Period_End_Date').asdatetime;

      edtNextEndDate.text := PBDateStr(setMonthEnd(fieldbyname('Period_End_Date').asdatetime));
      DateNext := setMonthEnd(fieldbyname('Period_End_Date').asdatetime);
    end;
end;

function TPBPeriodEndfrm.setMonthEnd(TempDate: TDateTime): TDateTime;
var
  Newdate: Tdatetime;
  Year, Month, Day, NewYear, NewMonth, NewDay: Word;
  i: integer;
begin
  NewDate := incMonth(TempDate,1);
  DecodeDate(NewDate, Year, Month, Day);
  for i := 1 to 31 do
    begin
      NewDate := NewDate + 1;
      DecodeDate(NewDate, NewYear, NewMonth, NewDay);
      if NewMonth <> Month then
        begin
          NewDate := NewDate - 1;
          break;
        end;
    end;
  result := NewDate
end;

procedure TPBPeriodEndfrm.setPeriodDates;
var
  iPeriod: integer;
  Year, Month, Day: Word;
begin
  with dmPeriodEnd.qryNextPeriod do
    begin
      close;
      open;
      iPeriod := fieldbyname('Last_Period').asinteger + 1;
    end;

  DecodeDate(DateNext, Year, Month, Day);

  with dmPeriodEnd.qryUpdPeriod do
    begin
      close;
      parambyname('Period').asinteger := iperiod;
      parambyname('Period_Year').asinteger := Year;
      parambyname('Period_no').asinteger := Month;
      parambyname('Description').asstring := FormatDateTime('mmmm yyyy',DateNext);
      parambyname('Period_End_Date').asdatetime := DateNext;
      parambyname('Last_period_end_date').asdatetime := DateCurrent;

      execsql;
    end;

end;

procedure TPBPeriodEndfrm.SetCurrentPeriodDates;
begin
  with dmPeriodEnd.qryGetPeriod do
    begin
      close;
      parambyname('Period').asinteger := NextPeriod;
      open;
    end;

  with dmPeriodEnd.qryUpCompany do
    begin
      close;
      parambyname('Period').asinteger := dmPeriodEnd.qryGetPeriod.fieldbyname('Period').asinteger;
      parambyname('Financial_year').asinteger := dmPeriodEnd.qryGetPeriod.fieldbyname('Financial_year').asinteger;
      execsql;
    end;
end;

procedure TPBPeriodEndfrm.edtNextEndDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(EdtNextEndDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      EdtNextEndDate.SetFocus;
      Exit;
    end;
  end;

  EdtNextEndDate.Text := PBDatestr(NewDate);
  DateNext := NewDate;
end;

function TPBPeriodEndfrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBPeriodEndfrm.btnNextDateClick(Sender: TObject);
begin
  DateNext := InputDate(DateNext);
  EdtNextEndDate.Text := PBDatestr(DateNext);
end;

procedure TPBPeriodEndfrm.btnOKClick(Sender: TObject);
begin
  if MessageDlg('Process period ending ' + edtCurrEndDate.text +'?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    prgrsBrPeriodEnd.show;
    lblProcessing.show;
    BuildSalesProfit;
//    SetPeriodDates;
    SetCurrentPeriodDates;
    MessageDlg('Period End update completed successfully.', mtInformation,
      [mbOk], 0);
    close;
  end;

end;

procedure TPBPeriodEndfrm.BuildSalesProfit;
var
  sTemp: string;
  icounter, iTotal, i: integer;
  TotalRepSplit: real;
begin
  {Look for Sales Invoices}
  sTemp := SQLCoreSalesInv;
  sTemp := sTemp + ' WHERE Sales_Invoice.Sales_Invoice_Status > 10 ';
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date > ' + qDate(DateLast);
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(DateCurrent);
//  sTemp := sTemp + ' AND Sales_Invoice.Sales_Invoice_Type is null ';
  sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';

  icounter:= GetLastSalesProfit;

  {Used for progress bar}
  i := 0;

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

(*          if fieldbyname('Sales_order').asinteger <> SalesOrder then
            TotalSalesValue := TotalSalesValue + dmPeriodEnd.GetTotalAddCharges(SalesInvoice);
*)
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
          SubRep := fieldbyname('Sub_Rep').asinteger;
          InvoiceLocation := fieldbyname('Invoice_Location').asinteger;

          if PurchaseOrder <> 0 then
            begin
              AccountManager := dmPeriodEnd.GetPOAccountMgr(PurchaseOrder);
              AccountTeam := dmPeriodEnd.GetPOAccountTeam(PurchaseOrder);
              Supplier := dmPeriodEnd.GetPOSupplier(PurchaseOrder);
              SupplierBranch := dmPeriodEnd.GetPOSupplierBR(PurchaseOrder);
//              Rep := dmPeriodEnd.GetPORep(PurchaseOrder,Line);
              TotalCostValue := dmPeriodEnd.GetPOTotalCost(PurchaseOrder,Line,fieldbyname('Qty_Invoiced').asinteger);
              TotalInvCostValue := dmPeriodEnd.GetPOTotalInvCost(PurchaseOrder,Line,fieldbyname('Qty_Invoiced').asinteger);
              dmPeriodEnd.SetPOAddCharges(PurchaseOrder,Line,SalesProfit);
              dmPeriodEnd.SetPurchInvoices(PurchaseOrder,Line,SalesProfit);
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
              TotalInvCostValue := 0;
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
              TotalInvCostValue := 0;
            end;

          if (fieldbyname('Invoice_or_Credit').asstring = 'C') and (fieldbyname('Cost_Price').asfloat <> 0) then
            begin
              TotalCostValue := GetTotalValue(QtyInvoiced,
                                fieldbyname('Price_unit_Factor').asinteger,
                                fieldbyname('Cost_Price').asfloat);
              TotalInvCostValue := 0;
            end;

          if ((fieldbyname('Invoice_or_Credit').asstring = 'C') and (fieldbyname('Credit_Type').asstring = 'P')) or
             ((fieldbyname('Invoice_or_Credit').asstring = 'C') and (fieldbyname('Credit_Type').asstring = 'V')) or
             ((fieldbyname('Invoice_or_Credit').asstring = 'I') and (fieldbyname('Credit_Type').asstring = 'V')) then
            begin
              TotalCostValue := 0;
              TotalInvCostValue := 0;
            end;

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
              RepTeam := dmPeriodEnd.GetRepTeamMember(Rep);
//  Assume that if a specific value is not set for a Rep against the customer then
// the invoice rep is allocated the whole of the split.
              if (RepResponsibility <> 0) and (RepResponsibility <> 100) then
              begin
                inc(icounter);
                SalesProfit := icounter;
                doOneSalesInvoice;

                TotalRepSplit := TotalRepSplit - RepResponsibility;
              end;
              next;
            end;
          end;
          RepResponsibility := TotalRepSplit;
          Rep := InvoiceRep;
          RepTeam := dmPeriodEnd.GetRepTeamMember(Rep);

          inc(icounter);
          SalesProfit := icounter;

          doOneSalesInvoice;

          InvoiceNumber := fieldbyname('Sales_invoice_no').asstring;

          prgrsBrPeriodEnd.Position := Round( i / itotal * 100);
          Application.ProcessMessages;
          next;
        end;
    end;
end;

function TPBPeriodEndfrm.qDate(const aDate : TDateTime) : string;
begin
  if dmBroker.IsSQL then
    Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
  else
    Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
end;

procedure TPBPeriodEndfrm.DoOneSalesInvoice;
var
  i: integer;
begin
  with dmPeriodEnd.qryAddSalesProfit do
    begin
      for i := 0 to pred(params.count) do
        params[i].clear;
      close;
      parambyname('Sales_Profit').asinteger := SalesProfit;
      parambyname('Sales_Invoice').asinteger := SalesInvoice;
      parambyname('Total_Sales_Value').asfloat := TotalSalesValue * (RepResponsibility/100);
      parambyname('Total_Cost_Value').asfloat := TotalCostValue * (RepResponsibility/100);
      parambyname('Total_Invoiced_Cost_Value').asfloat := TotalInvCostValue * (RepResponsibility/100);
      parambyname('Customer').asinteger := Customer;
      parambyname('Branch_no0').asinteger := CustomerBranch;
      parambyname('Rep').asinteger := Rep;

      if SubRep = 0 then
        parambyname('Sub_Rep').Clear
      else
        parambyname('Sub_Rep').asinteger := SubRep;

      if InvoiceLocation = 0 then
        parambyname('Invoice_Location').Clear
      else
        parambyname('Invoice_Location').asinteger := InvoiceLocation;
        
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

      parambyname('Period').asinteger := Period;
      execsql;
    end;
end;

function TPBPeriodEndfrm.GetTotalValue(TempQty, TempFactor: integer; TempValue: double) : real;
begin
  if TempFactor = 0 then
    result := TempValue
  else
    begin
      result := ((TempQty/TempFactor) * TempValue);
    end;
end;

function TPBPeriodEndfrm.GetLastSalesProfit: integer;
begin
  with dmPeriodEnd.qryGetLastSProfit do
    begin
      close;
      open;
      result := fieldbyname('Last_Sales_Profit').asinteger;
    end;
end;


procedure TPBPeriodEndfrm.edtCurrEndDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(EdtCurrEndDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      EdtCurrEndDate.SetFocus;
      Exit;
    end;
  end;

  EdtCurrEndDate.Text := PBDatestr(NewDate);
  DateCurrent := NewDate;
end;

procedure TPBPeriodEndfrm.btnCurrDateClick(Sender: TObject);
begin
  DateCurrent := InputDate(DateCurrent);
  EdtCurrEndDate.Text := PBDatestr(DateCurrent);
end;

procedure TPBPeriodEndfrm.FormCreate(Sender: TObject);
begin
  dmPeriodEnd := TdmPeriodEnd.create(self);
end;

procedure TPBPeriodEndfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPeriodEnd.free;
end;

end.
