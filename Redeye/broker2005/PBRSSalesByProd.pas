unit PBRSSalesByProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Db, Grids, DBGrids, Buttons, StdCtrls,
  CCSPrint, DateSelV5, PBPOObjects, QrExport, OleCtnrs, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSSalesByProdFrm = class(TForm)
    stsDetails: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    rgCustomer: TRadioGroup;
    chkbxCustomer: TCheckBox;
    pnlCustSearch: TPanel;
    lblCustBran: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    PrintReportBitBtn: TBitBtn;
    PreviewReportBitBtn: TBitBtn;
    dbgDetails: TDBGrid;
    dtsSalesByProd: TDataSource;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    Label2: TLabel;
    DateToButton: TSpeedButton;
    DateToEdit: TEdit;
    CancelBitBtn: TBitBtn;
    chkbxBranches: TCheckBox;
    chkbxTotalbyBranch: TCheckBox;
    chkbxTotalbyProduct: TCheckBox;
    qrySalesbyProd: TFDQuery;
    qrySalesbyProdSales_Invoice: TIntegerField;
    qrySalesbyProdInvoice_Line_No: TIntegerField;
    qrySalesbyProdPurchase_Order: TFloatField;
    qrySalesbyProdLine: TIntegerField;
    qrySalesbyProdQty_Invoiced: TFloatField;
    qrySalesbyProdGoods_Value: TFloatField;
    qrySalesbyProdVat_Code: TIntegerField;
    qrySalesbyProdVat_Value: TFloatField;
    qrySalesbyProdPrice_Unit: TIntegerField;
    qrySalesbyProdsales_Order: TIntegerField;
    qrySalesbyProdSales_Order_Line_no: TIntegerField;
    qrySalesbyProdJob_Bag: TIntegerField;
    qrySalesbyProdJob_Bag_Line: TIntegerField;
    qrySalesbyProdCredit_type: TStringField;
    qrySalesbyProdInvoice_Date: TDateTimeField;
    qrySalesbyProdSales_Invoice_No: TStringField;
    qrySalesbyProdCustomer: TIntegerField;
    qrySalesbyProdBranch_no: TIntegerField;
    qrySalesbyProdCustomer_Name: TStringField;
    qrySalesbyProdBranch_Name: TStringField;
    qrySalesbyProdPrice_Unit_Factor: TFloatField;
    qrySalesbyProdDescription: TStringField;
    qrySalesbyProdOrder: TStringField;
    qrySalesbyProdQuantity: TIntegerField;
    qrySalesbyProdTotal_Goods: TFloatField;
    ChkBxShwVl: TCheckBox;
    ChkBxExcCsts: TCheckBox;
    OleContainer1: TOleContainer;
    btbtnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    chkbxShowFormRefs: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qrySalesbyProdTotal_GoodsGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure cbValuesChange(Sender: TObject);
    procedure cbSort1Change(Sender: TObject);
    procedure qrySalesbyProdQuantityGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure chkbxCustomerClick(Sender: TObject);
    procedure chkbxBranchesClick(Sender: TObject);
    procedure qrySalesbyProdOrderGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ChkBxShwVlClick(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    SelCustCode, SelCustBranch : integer;
    SelCustText : string;
    DateFrom, DateTo: TDateTime;
    procedure FixQuery(rep: Boolean);
    function BuildQueryString(rep: Boolean): string;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview: Boolean); overload;
    procedure CallReport(func: string); overload;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBRSSalesByProdFrm: TPBRSSalesByProdFrm;

implementation

uses
  System.UITypes,
  PBDatabase, PBLUCust, PBRPSalesbyProd;

{$R *.DFM}

const
  SQLCore =
    'SELECT '+
    ' 	Sales_Invoice_Line.Sales_Invoice, '+
	  '   Sales_Invoice_Line.Invoice_Line_No, '+
	  '   Sales_Invoice_Line.Purchase_Order, '+
	  '   Sales_Invoice_Line.Line, '+
	  '   Sales_Invoice_Line.Qty_Invoiced, '+
	  '   Sales_Invoice_Line.Goods_Value, '+
	  '   Sales_Invoice_Line.Vat_Code, '+
	  '   Sales_Invoice_Line.Vat_Value, '+
	  '   Sales_Invoice_Line.Price_Unit, '+
	  '   Sales_Invoice_Line.sales_Order, '+
	  '   Sales_Invoice_Line.Sales_Order_Line_no, '+
	  '   Sales_Invoice_Line.Job_Bag, '+
	  '   Sales_Invoice_Line.Job_Bag_Line, '+
	  '   Sales_Invoice_Line.Credit_type, '+
	  '   Sales_Invoice.Invoice_Date, '+
	  '   Sales_Invoice.Sales_Invoice_No, '+
	  '   Sales_Invoice.Inv_to_Customer, '+
	  '   Sales_Invoice.Inv_to_Branch, '+
	  '   Sales_Invoice.Inv_to_Customer AS Customer, '+
	  '   Sales_Invoice.Inv_to_Branch AS Branch_no, '+
    '   Sales_Invoice.Invoice_Or_Credit, '+
    '   Sales_Invoice.Sales_Invoice_Type, '+
    '   Sales_Invoice.Reference,' +
	  '   Customer.Name AS Customer_Name, '+
	  '   Customer_Branch.Name AS Branch_Name, '+
	  '   Price_Unit.Price_Unit_Factor, '+
	  '   (case sales_invoice_type '+
	  '     when ''S'' then '+
		'     (select distinct Part.Part_Description '+
	 	'       from Sales_order_Line, Part '+
	 	'       where ((Sales_order_line.Sales_order = Sales_invoice_Line.Sales_Order) and  '+
   	'		          (Sales_order_Line.Sales_Order_Line_no = Sales_invoice_Line.Sales_order_line_no)) and '+
		'	            (Part.Part = Sales_order_Line.Part)) '+
	  '     when ''J'' then '+
		'     (select distinct Job_bag_line_dets.Job_Bag_Line_Descr '+
	 	'       from Job_bag_Line_dets '+
	 	'       where ((Job_bag_Line_dets.Job_Bag = Sales_invoice_Line.Job_Bag) and  '+
   	'		          (Job_bag_Line_dets.Job_bag_Line = Sales_invoice_Line.Job_Bag_Line))) '+
	  '     else '+
		'     (select distinct Customers_Desc '+
	 	'       from Purchase_orderline '+
	 	'       where Purchase_Orderline.Purchase_Order = Sales_Invoice_Line.Purchase_Order and '+
		'       	Purchase_orderLine.Line = Sales_invoice_line.Line) '+
	  '   end) as Description '+
    ' FROM Customer '+
	  '   INNER JOIN (Price_Unit '+
	  '   INNER JOIN ((Customer_Branch  '+
	  '   INNER JOIN Sales_Invoice ON '+
		'   (Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer) AND '+
		'   (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch)) '+
	  '   INNER JOIN Sales_Invoice_Line ON '+
		'   Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
    '   Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) ON '+
		'   Customer.Customer = Customer_Branch.Customer ';

  SQLCoreCust =
    'SELECT '+
    ' 	Sales_Invoice_Line.Sales_Invoice, '+
	  '   Sales_Invoice_Line.Invoice_Line_No, '+
	  '   Sales_Invoice_Line.Purchase_Order, '+
	  '   Sales_Invoice_Line.Line, '+
	  '   Sales_Invoice_Line.Qty_Invoiced, '+
	  '   Sales_Invoice_Line.Goods_Value, '+
	  '   Sales_Invoice_Line.Vat_Code, '+
	  '   Sales_Invoice_Line.Vat_Value, '+
	  '   Sales_Invoice_Line.Price_Unit, '+
	  '   Sales_Invoice_Line.sales_Order, '+
	  '   Sales_Invoice_Line.Sales_Order_Line_no, '+
	  '   Sales_Invoice_Line.Job_Bag, '+
	  '   Sales_Invoice_Line.Job_Bag_Line, '+
	  '   Sales_Invoice_Line.Credit_type, '+
	  '   Sales_Invoice.Invoice_Date, '+
	  '   Sales_Invoice.Sales_Invoice_No, '+
    '   Sales_Invoice.Inv_to_Customer, '+
    '   Sales_Invoice.Inv_to_Branch, '+
	  '   Sales_Invoice.Customer, '+
	  '   Sales_Invoice.Branch_no, '+
    '   Sales_Invoice.Invoice_Or_Credit, '+
    '   Sales_Invoice.Sales_Invoice_Type, '+
    '   Sales_Invoice.Reference,' +
	  '   Customer.Name AS Customer_Name, '+
	  '   Customer_Branch.Name AS Branch_Name, '+
	  '   Price_Unit.Price_Unit_Factor, '+
	  '   (case sales_invoice_type '+
	  '     when ''S'' then '+
		'     (select distinct Part.Part_Description '+
	 	'       from Sales_order_Line, Part '+
	 	'       where ((Sales_order_line.Sales_order = Sales_invoice_Line.Sales_Order) and  '+
   	'		          (Sales_order_Line.Sales_Order_Line_no = Sales_invoice_Line.Sales_order_line_no)) and '+
		'	            (Part.Part = Sales_order_Line.Part)) '+
	  '     when ''J'' then '+
		'     (select distinct Job_bag_line_dets.Job_Bag_Line_Descr '+
	 	'       from Job_bag_Line_dets '+
	 	'       where ((Job_bag_Line_dets.Job_Bag = Sales_invoice_Line.Job_Bag) and  '+
   	'		          (Job_bag_Line_dets.Job_bag_Line = Sales_invoice_Line.Job_Bag_Line))) '+
	  '   else '+
		'     (select distinct Customers_Desc '+
	 	'       from Purchase_orderline '+
	 	'       where Purchase_Orderline.Purchase_Order = Sales_Invoice_Line.Purchase_Order and '+
		'       	Purchase_orderLine.Line = Sales_invoice_line.Line) '+
	  '   end) as Description '+
    ' FROM Customer '+
	  '   INNER JOIN (Price_Unit '+
	  '   INNER JOIN ((Customer_Branch  '+
	  '   INNER JOIN Sales_Invoice ON '+
		'   (Customer_Branch.Customer = Sales_Invoice.Customer) AND '+
		'   (Customer_Branch.Branch_no = Sales_Invoice.Branch_no)) '+
	  '   INNER JOIN Sales_Invoice_Line ON '+
		'   Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
    '   Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) ON '+
		'   Customer.Customer = Customer_Branch.Customer ';

  SQLCoreAccess =
    'SELECT  Sales_Invoice_Line.Sales_Invoice, '+
    '    Sales_Invoice_Line.Invoice_Line_No, '+
    '    Sales_Invoice_Line.Purchase_Order, '+
    '    Sales_Invoice_Line.Line, '+
    '    Sales_Invoice_Line.Qty_Invoiced, '+
    '    Sales_Invoice_Line.Goods_Value, '+
    '    Sales_Invoice_Line.Vat_Code, '+
    '    Sales_Invoice_Line.Vat_Value, '+
    '    Sales_Invoice_Line.Price_Unit, '+
    '    Sales_Invoice_Line.sales_Order, '+
    '    Sales_Invoice_Line.Sales_Order_Line_no, '+
    '    Sales_Invoice_Line.Job_Bag, '+
    '    Sales_Invoice_Line.Job_Bag_Line, '+
    '    Sales_Invoice_Line.Credit_type, '+
    '    Sales_Invoice.Invoice_Date, '+
    '    Sales_Invoice.Sales_Invoice_No, '+
    '    Sales_Invoice.Inv_to_Customer, '+
    '    Sales_Invoice.Inv_to_Branch, '+
    '    Sales_Invoice.Inv_to_Customer as Customer, '+
    '    Sales_Invoice.Inv_to_Branch as Branch_no, '+
    '   Sales_Invoice.Invoice_Or_Credit, '+
    '   Sales_Invoice.Sales_Invoice_Type, '+
    '   Sales_Invoice.Reference,' +
    '    Customer.Name as Customer_Name, '+
    '    Customer_Branch.Name as Branch_Name, '+
    '    Purchase_OrderLine.Customers_Desc as Description, '+
    '    Price_Unit.Price_Unit_Factor '+
    'FROM Price_Unit '+
    'INNER JOIN (Purchase_OrderLine '+
    'INNER JOIN (Customer '+
    'INNER JOIN (Customer_Branch '+
    'INNER JOIN (Sales_Invoice '+
    'INNER JOIN Sales_Invoice_Line ON '+
    '  Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
    '   (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch) AND '+
    ' (Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer)) ON '+
    '  Customer.Customer = Customer_Branch.Customer) ON '+
    '  (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND '+
    '  (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Purchase_Order)) ON '+
    '  Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit ';

  SQLCoreCustAccess =
    'SELECT  Sales_Invoice_Line.Sales_Invoice, '+
    '    Sales_Invoice_Line.Invoice_Line_No, '+
    '    Sales_Invoice_Line.Purchase_Order, '+
    '    Sales_Invoice_Line.Line, '+
    '    Sales_Invoice_Line.Qty_Invoiced, '+
    '    Sales_Invoice_Line.Goods_Value, '+
    '    Sales_Invoice_Line.Vat_Code, '+
    '    Sales_Invoice_Line.Vat_Value, '+
    '    Sales_Invoice_Line.Price_Unit, '+
    '    Sales_Invoice_Line.sales_Order, '+
    '    Sales_Invoice_Line.Sales_Order_Line_no, '+
    '    Sales_Invoice_Line.Job_Bag, '+
    '    Sales_Invoice_Line.Job_Bag_Line, '+
    '    Sales_Invoice_Line.Credit_type, '+
    '    Sales_Invoice.Invoice_Date, '+
    '    Sales_Invoice.Sales_Invoice_No, '+
    '    Sales_Invoice.Inv_to_Customer, '+
    '    Sales_Invoice.Inv_to_Branch, '+
    '    Sales_Invoice.Customer, '+
    '    Sales_Invoice.Branch_no, '+
    '   Sales_Invoice.Invoice_Or_Credit, '+
    '   Sales_Invoice.Sales_Invoice_Type, '+
    '   Sales_Invoice.Reference,' +
    '    Customer.Name as Customer_Name, '+
    '    Customer_Branch.Name as Branch_Name, '+
    '    Purchase_OrderLine.Customers_Desc as Description, '+
    '    Price_Unit.Price_Unit_Factor '+
    'FROM Price_Unit '+
    'INNER JOIN (Purchase_OrderLine '+
    'INNER JOIN (Customer '+
    'INNER JOIN (Customer_Branch '+
    'INNER JOIN (Sales_Invoice '+
    'INNER JOIN Sales_Invoice_Line ON '+
    '  Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
    '   (Customer_Branch.Branch_no = Sales_Invoice.Branch_no) AND '+
    ' (Customer_Branch.Customer = Sales_Invoice.Customer)) ON '+
    '  Customer.Customer = Customer_Branch.Customer) ON '+
    '  (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND '+
    '  (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Purchase_Order)) ON '+
    '  Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit ';

procedure TPBRSSalesByProdFrm.FormCreate(Sender: TObject);
begin
  stsDetails.Top := Screen.Height - stsDetails.Height;
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSSalesByProdFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
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
  FixQuery(False);
end;

procedure TPBRSSalesByProdFrm.FixQuery(rep: Boolean);
begin
  qrySalesByProd.DisableControls;
  try
    qrySalesByProd.Close;
    qrySalesByProd.SQL.Clear;
    qrySalesByProd.SQL.text := BuildQueryString(rep);
    qrySalesByProd.Open;
    stsDetails.panels[0].Text :=IntToStr(qrySalesByProd.RecordCount) + ' records displayed in list';
  finally
    qrySalesByProd.EnableControls;
  end;
end;

function TPBRSSalesByProdFrm.BuildQueryString(rep: Boolean): string;
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


begin
{rebuilds the query string depending on the sort selections}
  if chkbxCustomer.Checked then
    begin
      if dmBroker.IsSQL then
        sTemp := SQLCoreCust
      else
        sTemp := SQLCoreCustAccess;
    end
  else
    begin
      if dmBroker.IsSQL then
        sTemp := SQLCore
      else
        sTemp := SQLCoreAccess;
    end;

  sTemp := sTemp + ' WHERE Sales_Invoice.Sales_Invoice_Status > 10 ';
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date >= ' + qDate(DateFrom);
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(DateTo);
  sTemp := sTemp + ' AND Sales_Invoice_Line.qty_invoiced > 0';
  sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';
  if (edtCustomer.Text <> '') then
  begin
    if chkbxCustomer.Checked then
    begin
      if pos('%',trim(edtCustomer.Text)) > 0 then
        sTemp := sTemp + ' AND Customer.Name like ''' + trim(edtCustomer.Text) + ''''
      else
        sTemp := sTemp + ' AND Sales_Invoice.Customer = ' + IntToStr(SelCustCode);
      if not chkbxBranches.checked then
        sTemp := sTemp + ' AND Sales_Invoice.Branch_no = ' + IntToStr(SelCustBranch);
    end
    else
    begin
      if pos('%',trim(edtCustomer.Text)) > 0 then
        sTemp := sTemp + ' AND Customer.Name like ''' + trim(edtCustomer.Text) + ''''
      else
        sTemp := sTemp + ' AND Sales_Invoice.Inv_to_Customer = ' + IntToStr(SelCustCode);
      if not chkbxBranches.checked then
        sTemp := sTemp + ' AND Sales_Invoice.Inv_to_Branch = ' + IntToStr(SelCustBranch);
    end;
  end;
  {Exclude zero values}

  sTemp := sTemp + ' ORDER BY Customer.Name, Description, Sales_invoice.Sales_invoice_no,';

  if sTemp[Length(sTemp)] = ',' then
    sTemp[Length(sTemp)] := ' ';

  Result := sTemp;
end;

procedure TPBRSSalesByProdFrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := SelCustCode;
    PBLUCustFrm.SelBranch := SelCustBranch;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      SelCustCode := PBLUCustFrm.SelCode;
      SelCustBranch := PBLUCustFrm.SelBranch;
      SelCustText := PBLUCustFrm.SelName + ' / ' + PBLUCustFrm.SelBranchName;
    end;
    edtCustomer.Text := SelCustText;
    FixQuery(False);
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TPBRSSalesByProdFrm.FormShow(Sender: TObject);
begin
  qrySalesByProd.Active := True;
end;

procedure TPBRSSalesByProdFrm.qrySalesbyProdTotal_GoodsGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
var
  rTotal: real;
begin
  if qrySalesByProdPrice_Unit_Factor.asinteger = 0 then
    text := formatfloat('£#,###,##0.00;(£#,###,##0.00)',qrySalesByProdGoods_Value.asfloat)
  else
    begin
      rTotal :=  (qrySalesByProdQty_Invoiced.asinteger / qrySalesByProdPrice_Unit_Factor.asinteger)
                  *  qrySalesByProdGoods_Value.asfloat;
      if qrySalesByProdQty_Invoiced.asinteger < 0 then
        rTotal := rTotal * -1;
      text := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotal);
    end;
  if qrySalesbyProdDescription.asstring = '' then
    text := '';

end;

procedure TPBRSSalesByProdFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSSalesByProdFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
  FixQuery(False);
end;

procedure TPBRSSalesByProdFrm.rgCustomerClick(Sender: TObject);
begin
{hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rgCustomer.ItemIndex = 0) then
  begin
    pnlCustSearch.Visible := False;
    EdtCustomer.Text := '';
    qrySalesByProdCustomer_Name.visible := True;
  end
  else
  begin
    pnlCustSearch.Visible := True;
  end;
  FixQuery(False);
end;

procedure TPBRSSalesByProdFrm.cbValuesChange(Sender: TObject);
begin
  FixQuery(False);
end;

function TPBRSSalesByProdFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSSalesByProdFrm.cbSort1Change(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesByProdFrm.qrySalesbyProdQuantityGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByProdQty_Invoiced.asinteger < 0 then
    text := inttostr(qrySalesByProdQty_Invoiced.asinteger * -1)
  else
    text := inttostr(qrySalesByProdQty_Invoiced.asinteger);
  if qrySalesByProdDescription.asstring = '' then
    text := '';
end;

procedure TPBRSSalesByProdFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSSalesByProdFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSSalesByProdFrm.CallReport(const bPreview: Boolean);
var
  PBRPSalesByProdFrm: TPBRPSalesByProdFrm;
  PrinterSettings: TPrinterSettings;
begin
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;

  qrySalesByProd.Close;
  fixquery(True);
  {add total order by clause to report query}

  PBRPSalesByProdfrm := TPBRPSalesByProdfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesByProdfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPSalesByProdfrm.qrySalesByProd.SQL.Clear;
      PBRPSalesByProdfrm.qrySalesByProd.SQL.Text := qrySalesByProd.text;

      if chkbxCustomer.Checked then
      begin
        PBRPSalesByProdfrm.qryInvAddChrgs.SQL.Text :=
          PBRPSalesByProdfrm.qryInvAddChrgsbyOrdCust.SQL.Text;
        PBRPSalesByProdfrm.orderingCustomer := true;
      end
      else
      begin
        PBRPSalesByProdfrm.qryInvAddChrgs.SQL.Text :=
          PBRPSalesByProdfrm.qryInvAddChrgsbyInvCust.SQL.Text;
        PBRPSalesByProdfrm.orderingCustomer := false;
      end;

      PBRPSalesByProdfrm.qrlblTitle.caption := PBRPSalesByProdfrm.qrlblTitle.caption + DateToStr(Date);
      PBRPSalesByProdfrm.qrlblDateRange.caption :=
      PBRPSalesByProdfrm.qrlblDateRange.caption + DateFromEdit.Text +
        ' to: ' + DateToEdit.Text;
      PBRPSalesByProdfrm.qrlblDateRange.caption :=
      PBRPSalesByProdfrm.qrlblDateRange.caption + ' Sorted by: Customer and Product Description';

      PBRPSalesByProdfrm.dateFrom := dateFrom;
      PBRPSalesByProdfrm.dateTo := dateTo;
      PBRPSalesByProdfrm.TotalbyBranch := chkbxTotalbyBranch.checked;
      PBRPSalesByProdfrm.TotalbyProduct := chkbxTotalbyProduct.checked;
      PBRPSalesBYProdFrm.PrintGoods := not chkbxShwVl.checked;
      PBRPSalesBYProdFrm.PrintCosts := not chkbxExcCsts.checked;
      PBRPSalesBYProdFrm.ShowFormRefs := chkbxShowFormRefs.Checked;
      if bPreview then
        PBRPSalesByProdfrm.qckrpSalesByProd.Preview
      else
        if SetUpPrinter(PrinterSettings) then
          PBRPSalesByProdfrm.qckrpSalesByProd.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qrySalesByProd.Open;
  end;

end;
procedure TPBRSSalesByProdFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
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
  FixQuery(False);
end;

procedure TPBRSSalesByProdFrm.chkbxCustomerClick(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesByProdFrm.chkbxBranchesClick(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesByProdFrm.qrySalesbyProdOrderGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByProdJob_Bag.asstring <> '' then
    text := 'JB/'+qrySalesByProdJob_Bag.Asstring
  else
  if qrySalesByProdSales_Order.asstring <> '' then
    text := 'SO/'+qrySalesByProdSales_Order.Asstring
  else
  if qrySalesByProdPurchase_Order.asstring <> '' then
    text := qrySalesByProdPurchase_Order.asstring;
end;

procedure TPBRSSalesByProdFrm.ChkBxShwVlClick(Sender: TObject);
begin
If ChkBxShwVl.checked = True then
  begin
(*    chkBxTotalByProduct.enabled := false;
    chkBxTotalByProduct.checked := false;
    ChkBxTotalByBranch.enabled := false;
    ChkBxTotalByBranch.checked := false;
*)
    ChkBxExcCsts.checked := True;
    ChkBxExcCsts.enabled := False;
  end
else
  begin
(*    chkBxTotalByProduct.enabled := True;
    chkBxTotalByBranch.enabled := true;
*)
    ChkBxExcCsts.enabled := True;
  end;
end;

procedure TPBRSSalesByProdFrm.CallReport(func: string);
begin

end;

procedure TPBRSSalesByProdFrm.btbtnExcelClick(Sender: TObject);
var
  PBRPSalesByProdFrm: TPBRPSalesByProdFrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
begin
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;

  qrySalesByProd.Close;
  fixquery(True);
  {add total order by clause to report query}

  PBRPSalesByProdfrm := TPBRPSalesByProdfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesByProdfrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPSalesByProdfrm.qrySalesByProd.SQL.Clear;
      PBRPSalesByProdfrm.qrySalesByProd.SQL.Text := qrySalesByProd.text;

      if chkbxCustomer.Checked then
      begin
        PBRPSalesByProdfrm.qryInvAddChrgs.SQL.Text :=
          PBRPSalesByProdfrm.qryInvAddChrgsbyOrdCust.SQL.Text;
        PBRPSalesByProdfrm.orderingCustomer := true;
      end
      else
      begin
        PBRPSalesByProdfrm.qryInvAddChrgs.SQL.Text :=
          PBRPSalesByProdfrm.qryInvAddChrgsbyInvCust.SQL.Text;
        PBRPSalesByProdfrm.orderingCustomer := false;
      end;

      PBRPSalesByProdfrm.qrlblTitle.caption := PBRPSalesByProdfrm.qrlblTitle.caption + DateToStr(Date);

      PBRPSalesByProdfrm.qrlblDateRange.caption :=
      PBRPSalesByProdfrm.qrlblDateRange.caption + DateFromEdit.Text +
        ' to: ' + DateToEdit.Text;
      PBRPSalesByProdfrm.qrlblDateRange.caption :=
      PBRPSalesByProdfrm.qrlblDateRange.caption + ' Sorted by: Customer and Product Description';

      PBRPSalesByProdfrm.dateFrom := dateFrom;
      PBRPSalesByProdfrm.dateTo := dateTo;
      PBRPSalesByProdfrm.TotalbyBranch := chkbxTotalbyBranch.checked;
      PBRPSalesByProdfrm.TotalbyProduct := chkbxTotalbyProduct.checked;
      PBRPSalesBYProdFrm.PrintGoods := not chkbxShwVl.checked;
      PBRPSalesBYProdFrm.PrintCosts := not chkbxExcCsts.checked;
      PBRPSalesBYProdFrm.ShowFormRefs := chkbxShowFormRefs.Checked;

      tempFileName := getWinTempDir+'temp.csv';
      self.pnlExportPrgrss.Visible := true;
      self.pnlExportPrgrss.Repaint;

      PBRPSalesBYProdFrm.ExportToFile(tempFileName);
      self.pnlExportPrgrss.visible := false;
      self.Repaint;
      self.prgbrExport.Position := 0;
      
      self.OleContainer1.CreateLinkToFile(tempFileName, false);
      self.OleContainer1.DoVerb(0);
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qrySalesByProd.Open;
  end;
end;

end.
