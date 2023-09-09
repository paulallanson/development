unit PBRSSalesByInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls, Buttons,
  Printers, CCSPrint, DateSelV5, PBPOObjects, OleCtnrs, CCSCommon, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSSalesByInvFrm = class(TForm)
    qrySalesByInv: TFDQuery;
    dtsrcSalesByInv: TDataSource;
    pnlDisplay: TPanel;
    pnlControls: TPanel;
    rgCustomer: TRadioGroup;
    pnlCustSearch: TPanel;
    lblCustBran: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    pnlPrintControl: TPanel;
    Panel1: TPanel;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    cbSort1: TComboBox;
    cbSort2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    DateFromEdit: TEdit;
    DateToButton: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    TotByRadioGroup: TRadioGroup;
    Label5: TLabel;
    cbValues: TComboBox;
    chkbxPageBreak: TCheckBox;
    qrySalesByInvCustomer: TIntegerField;
    qrySalesByInvBranch_no: TIntegerField;
    qrySalesByInvSales_Invoice: TIntegerField;
    qrySalesByInvAccount_Code: TStringField;
    qrySalesByInvName: TStringField;
    qrySalesByInvSales_Invoice_No: TStringField;
    qrySalesByInvGoods_Value: TCurrencyField;
    qrySalesByInvVat_Value: TCurrencyField;
    qrySalesByInvGoods_Total: TCurrencyField;
    qrySalesByInvInvoice_Date: TDateTimeField;
    qrySalesByInvInvoice_or_Credit: TStringField;
    qrySalesByInvRep: TIntegerField;
    qrySalesByInvSales_Invoice_type: TStringField;
    qrySalesByInvInactive: TStringField;
    qrySalesByInvReference: TStringField;
    qrySalesByInvSupplier_Name: TStringField;
    qrySalesByInvRep_Name: TStringField;
    qrySalesByInvInvoice_Description: TStringField;
    qrySalesByInvSupplier_Desc: TStringField;
    qrySalesByInvOrderDesc: TStringField;
    chkbxCustomer: TCheckBox;
    DateToEdit: TEdit;
    chkbxBranches: TCheckBox;
    rgRep: TRadioGroup;
    RepPanel: TPanel;
    lblRep: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    SQLRep: TFDQuery;
    RdGrpRepTyp: TRadioGroup;
    btbtnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    stbrDetails: TStatusBar;
    dbgDetails: TDBGrid;
    DateFromButton: TSpeedButton;
    chkbxExcludePaid: TCheckBox;
    chkbxSubReps: TCheckBox;
    qrySalesByInvAccount_Manager_Name: TStringField;
    chkbxExcludeJBCosts: TCheckBox;
    qrySalesByInvQuantity: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
    procedure DateToEditChange(Sender: TObject);
    procedure DateFromEditChange(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure cbValuesChange(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure TotByRadioGroupClick(Sender: TObject);
    procedure qrySalesByInvSupplier_DescGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesByInvCalcFields(DataSet: TDataSet);
    procedure chkbxCustomerClick(Sender: TObject);
    procedure chkbxBranchesClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure rgRepClick(Sender: TObject);
    procedure ForceRep(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
    procedure chkbxExcludePaidClick(Sender: TObject);
    procedure chkbxSubRepsClick(Sender: TObject);
  private
    SelCustCode, SelCustBranch : integer;
    SelCustText : string;
    DateFrom, DateTo: TDateTime;
    SelRepCode: integer;
    SelRepText : string;
    procedure FixQuery(rep: Boolean);
    function BuildQueryString(rep: Boolean): string;
    procedure CallReport(const bPreview : Boolean);
    function Ordering(aBox: TComboBox): string;
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  PBRSSalesByInvFrm: TPBRSSalesByInvFrm;

implementation

uses pbDatabase, PBLUCust, PBLURep, PBRPSalesByInv, PBRPSalesByInvDet,
  pbMainMenu;

{$R *.DFM}

const
  SQLCore =
   'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer, '+
	 'Sales_Invoice.Inv_to_Branch AS Branch_no, '+
   'Sales_Invoice.Sales_Invoice, '+
	 'Customer_Branch.Account_Code, '+
	 'Customer_Branch.Name as Branch_Name, '+
	 'Customer.Name, '+
	 'Sales_Invoice.Sales_Invoice_No, '+
	 'Sales_Invoice.Goods_Value, '+
	 'Sales_Invoice.Vat_Value, '+
	 '(Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Total, '+
	 'Sales_Invoice.Invoice_Date, '+
	 'Sales_Invoice.Invoice_or_Credit, '+
   'Sales_Invoice.Rep, '+
   '	Sales_Invoice.Sales_Invoice_type, '+
   '	Sales_Invoice.Inactive, '+
	 'Sales_Invoice.Reference, '+
	 'Sales_Invoice.Invoice_Description, '+
   'Sales_Invoice.Cust_Order_no, '+
	 '(case sales_invoice_type '+
	 'when ''S'' then (select distinct Supplier.Name '+
	 '		from Purch_ord, Supplier '+
	 '		where Purch_Ord.Sales_order = Sales_invoice.Reference and '+
   '      Purch_Ord.Sales_order <> NULL and '+
	 '			Purch_Ord.Supplier = Supplier.Supplier) '+
	 'when ''J'' then ''Multiple Suppliers'' '+
	 'else (select Supplier.Name '+
	 '	from Purchase_order, Supplier, Supplier_Branch '+
	 '	where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purchase_Order and '+
	 '	((Purchase_Order.Supplier = Supplier_Branch.Supplier) and '+
	 '	(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and '+
	 '	(Supplier_Branch.Supplier = Supplier.Supplier)) '+
	 'end) as Supplier_Name, '+
   '(case invoice_or_credit '+
   '  when ''I'' then '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (select distinct Operator.Name '+
	 '		from Sales_Order, Operator '+
	 '		where   Sales_Order.Sales_order = Sales_invoice.Reference and '+
	 '				Sales_Order.Office_Contact = Operator.Operator) '+
	 'when ''J'' then (select distinct Operator.Name '+
	 '		from Job_Bag, Operator '+
	 '		where	Job_Bag.Job_Bag = Sales_invoice.Reference and '+
	 '				Job_Bag.Office_Contact = Operator.Operator) '+
	 'else (select distinct Operator.Name '+
	 '	from Purchase_order, Operator '+
	 '		where	Purchase_Order.Purchase_Order = Sales_invoice.Reference and '+
	 '				Purchase_Order.Office_Contact = Operator.Operator) '+
	 'end)) else '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (select distinct Operator.Name '+
	 '		from Sales_invoice SI, Sales_Order, Operator '+
	 '		where   Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Sales_Order.Sales_order = CAST(SI.Reference AS DECIMAL) and '+
	 '				Sales_Order.Office_Contact = Operator.Operator) '+
	 'when ''J'' then (select distinct Operator.Name '+
	 '		from Sales_Invoice SI, Job_Bag, Operator '+
	 '		where	Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Job_Bag.Job_Bag = CAST(SI.Reference AS DECIMAL) and '+
	 '				Job_Bag.Office_Contact = Operator.Operator) '+
	 'else (select distinct Operator.Name '+
	 '	from Sales_Invoice SI, Purchase_order, Operator  '+
	 '		where	Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Purchase_Order.Purchase_Order = CAST(SI.Reference AS DECIMAL) and '+
	 '				Purchase_Order.Office_Contact = Operator.Operator) '+
	 'end)) '+
	 'end) as Account_Manager_Name, '+
   '(case invoice_or_credit '+
   '  when ''I'' then '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (0) '+
	 'when ''J'' then (select distinct Job_Bag.Quantity '+
	 '		from Job_Bag '+
	 '		where	Job_Bag.Job_Bag = Sales_invoice.Reference) '+
	 'else (select distinct Purchase_OrderLine.Quantity '+
	 '	from Purchase_order, Purchase_OrderLine '+
	 '		where	(Purchase_Order.Purchase_Order = Sales_invoice.Reference) and '+
	 '				((Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Order) AND '+
	 '				(Purchase_OrderLine.Line = 1))) '+
	 'end)) else '+
	 '(	 (0)) '+
	 'end) as Quantity, '+
	 'Rep.Name as Rep_Name, '+
	 'Customer_Type.Description as Customer_Type_Description '+
   'FROM Customer_Type '+
	 '	INNER JOIN (Customer '+
	 '	INNER JOIN (Customer_Branch '+
	 '	INNER JOIN ((Sales_Invoice '+
	 '	INNER JOIN Rep '+
	 '		ON Sales_Invoice.Rep = Rep.Rep) '+
	 '	INNER JOIN Sales_Invoice_Line '+
	 '		ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) '+
	 '		ON (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch) AND (Customer_Branch.Customer = Sales_Invoice.Inv_To_Customer)) '+
	 '		ON Customer.Customer = Customer_Branch.Customer) '+
	 '		ON Customer_Type.Customer_Type = Customer.Customer_Type ';

  SQLCoreSubReps =
   'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer, '+
	 'Sales_Invoice.Inv_to_Branch AS Branch_no, '+
   'Sales_Invoice.Sales_Invoice, '+
	 'Customer_Branch.Account_Code, '+
	 'Customer_Branch.Name as Branch_Name, '+
	 'Customer.Name, '+
	 'Sales_Invoice.Sales_Invoice_No, '+
	 'Sales_Invoice.Goods_Value, '+
	 'Sales_Invoice.Vat_Value, '+
	 '(Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Total, '+
	 'Sales_Invoice.Invoice_Date, '+
	 'Sales_Invoice.Invoice_or_Credit, '+
   'Sales_Invoice.Rep, '+
   'Sales_Invoice.Sub_Rep, '+
   '	Sales_Invoice.Sales_Invoice_type, '+
   '	Sales_Invoice.Inactive, '+
	 'Sales_Invoice.Reference, '+
	 'Sales_Invoice.Invoice_Description, '+
   'Sales_Invoice.Cust_Order_no, '+
	 '(case sales_invoice_type '+
	 'when ''S'' then (select distinct Supplier.Name '+
	 '		from Purch_ord, Supplier '+
	 '		where Purch_Ord.Sales_order = Sales_invoice.Reference and '+
   '      Purch_Ord.Sales_order <> NULL and '+
	 '			Purch_Ord.Supplier = Supplier.Supplier) '+
	 'when ''J'' then ''Multiple Suppliers'' '+
	 'else (select Supplier.Name '+
	 '	from Purchase_order, Supplier, Supplier_Branch '+
	 '	where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purchase_Order and '+
	 '	((Purchase_Order.Supplier = Supplier_Branch.Supplier) and '+
	 '	(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and '+
	 '	(Supplier_Branch.Supplier = Supplier.Supplier)) '+
	 'end) as Supplier_Name, '+
   '(case invoice_or_credit '+
   '  when ''I'' then '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (select distinct Operator.Name '+
	 '		from Sales_Order, Operator '+
	 '		where   Sales_Order.Sales_order = Sales_invoice.Reference and '+
	 '				Sales_Order.Office_Contact = Operator.Operator) '+
	 'when ''J'' then (select distinct Operator.Name '+
	 '		from Job_Bag, Operator '+
	 '		where	Job_Bag.Job_Bag = Sales_invoice.Reference and '+
	 '				Job_Bag.Office_Contact = Operator.Operator) '+
	 'else (select distinct Operator.Name '+
	 '	from Purchase_order, Operator '+
	 '		where	Purchase_Order.Purchase_Order = Sales_invoice.Reference and '+
	 '				Purchase_Order.Office_Contact = Operator.Operator) '+
	 'end)) else '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (select distinct Operator.Name '+
	 '		from Sales_invoice SI, Sales_Order, Operator '+
	 '		where   Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Sales_Order.Sales_order = CAST(SI.Reference AS DECIMAL) and '+
	 '				Sales_Order.Office_Contact = Operator.Operator) '+
	 'when ''J'' then (select distinct Operator.Name '+
	 '		from Sales_Invoice SI, Job_Bag, Operator '+
	 '		where	Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Job_Bag.Job_Bag = CAST(SI.Reference AS DECIMAL) and '+
	 '				Job_Bag.Office_Contact = Operator.Operator) '+
	 'else (select distinct Operator.Name '+
	 '	from Sales_Invoice SI, Purchase_order, Operator  '+
	 '		where	Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Purchase_Order.Purchase_Order = CAST(SI.Reference AS DECIMAL) and '+
	 '				Purchase_Order.Office_Contact = Operator.Operator) '+
	 'end)) '+
	 'end) as Account_Manager_Name, '+
   '(case invoice_or_credit '+
   '  when ''I'' then '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (0) '+
	 'when ''J'' then (select distinct Job_Bag.Quantity '+
	 '		from Job_Bag '+
	 '		where	Job_Bag.Job_Bag = Sales_invoice.Reference) '+
	 'else (select distinct Purchase_OrderLine.Quantity '+
	 '	from Purchase_order, Purchase_OrderLine '+
	 '		where	(Purchase_Order.Purchase_Order = Sales_invoice.Reference) and '+
	 '				((Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Order) AND '+
	 '				(Purchase_OrderLine.Line = 1))) '+
	 'end)) else '+
	 '(	 (0)) '+
	 'end) as Quantity, '+
	 'Rep.Name as Rep_Name, '+
	 'Customer_Type.Description as Customer_Type_Description '+
   'FROM Customer_Type '+
	 '	INNER JOIN (Customer '+
	 '	INNER JOIN (Customer_Branch '+
	 '	INNER JOIN ((Sales_Invoice '+
	 '	INNER JOIN Rep '+
	 '		ON Sales_Invoice.Sub_Rep = Rep.Rep) '+
	 '	INNER JOIN Sales_Invoice_Line '+
	 '		ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) '+
	 '		ON (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch) AND (Customer_Branch.Customer = Sales_Invoice.Inv_To_Customer)) '+
	 '		ON Customer.Customer = Customer_Branch.Customer) '+
	 '		ON Customer_Type.Customer_Type = Customer.Customer_Type ';

  SQLCoreCust =
   'SELECT DISTINCT Sales_Invoice.Customer, '+
	 'Sales_Invoice.Branch_no, '+
   'Sales_Invoice.Sales_Invoice, '+
	 'Customer_Branch.Account_Code, '+
	 'Customer_Branch.Name as Branch_Name, '+
	 'Customer.Name, '+
	 'Sales_Invoice.Sales_Invoice_No, '+
	 'Sales_Invoice.Goods_Value, '+
	 'Sales_Invoice.Vat_Value, '+
	 '(Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Total, '+
	 'Sales_Invoice.Invoice_Date, '+
	 'Sales_Invoice.Invoice_or_Credit, '+
   'Sales_Invoice.Rep, '+
   '	Sales_Invoice.Sales_Invoice_type, '+
   '	Sales_Invoice.Inactive, '+
	 'Sales_Invoice.Reference, '+
	 'Sales_Invoice.Invoice_Description, '+
   'Sales_Invoice.Cust_Order_no, '+
	 '(case sales_invoice_type '+
	 'when ''S'' then (select distinct Supplier.Name '+
	 '		from Purch_ord, Supplier '+
	 '		where Purch_Ord.Sales_order = Sales_invoice.Reference and '+
   '      Purch_Ord.Sales_order <> NULL and '+
	 '			Purch_Ord.Supplier = Supplier.Supplier) '+
	 'when ''J'' then ''Multiple Suppliers'' '+
	 'else (select Supplier.Name '+
	 '	from Purchase_order, Supplier, Supplier_Branch '+
	 '	where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purchase_Order and '+
	 '	((Purchase_Order.Supplier = Supplier_Branch.Supplier) and '+
	 '	(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and '+
	 '	(Supplier_Branch.Supplier = Supplier.Supplier)) '+
	 'end) as Supplier_Name, '+
   '(case invoice_or_credit '+
   '  when ''I'' then '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (select distinct Operator.Name '+
	 '		from Sales_Order, Operator '+
	 '		where   Sales_Order.Sales_order = Sales_invoice.Reference and '+
	 '				Sales_Order.Office_Contact = Operator.Operator) '+
	 'when ''J'' then (select distinct Operator.Name '+
	 '		from Job_Bag, Operator '+
	 '		where	Job_Bag.Job_Bag = Sales_invoice.Reference and '+
	 '				Job_Bag.Office_Contact = Operator.Operator) '+
	 'else (select distinct Operator.Name '+
	 '	from Purchase_order, Operator '+
	 '		where	Purchase_Order.Purchase_Order = Sales_invoice.Reference and '+
	 '				Purchase_Order.Office_Contact = Operator.Operator) '+
	 'end)) else '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (select distinct Operator.Name '+
	 '		from Sales_invoice SI, Sales_Order, Operator '+
	 '		where   Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Sales_Order.Sales_order = CAST(SI.Reference AS DECIMAL) and '+
	 '				Sales_Order.Office_Contact = Operator.Operator) '+
	 'when ''J'' then (select distinct Operator.Name '+
	 '		from Sales_Invoice SI, Job_Bag, Operator '+
	 '		where	Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Job_Bag.Job_Bag = CAST(SI.Reference AS DECIMAL) and '+
	 '				Job_Bag.Office_Contact = Operator.Operator) '+
	 'else (select distinct Operator.Name '+
	 '	from Sales_Invoice SI, Purchase_order, Operator  '+
	 '		where	Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Purchase_Order.Purchase_Order = CAST(SI.Reference AS DECIMAL) and '+
	 '				Purchase_Order.Office_Contact = Operator.Operator) '+
	 'end)) '+
	 'end) as Account_Manager_Name, '+
   '(case invoice_or_credit '+
   '  when ''I'' then '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (0) '+
	 'when ''J'' then (select distinct Job_Bag.Quantity '+
	 '		from Job_Bag '+
	 '		where	Job_Bag.Job_Bag = Sales_invoice.Reference) '+
	 'else (select distinct Purchase_OrderLine.Quantity '+
	 '	from Purchase_order, Purchase_OrderLine '+
	 '		where	(Purchase_Order.Purchase_Order = Sales_invoice.Reference) and '+
	 '				((Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Order) AND '+
	 '				(Purchase_OrderLine.Line = 1))) '+
	 'end)) else '+
	 '(	 (0)) '+
	 'end) as Quantity, '+
	 'Rep.Name as Rep_Name, '+
	 'Customer_Type.Description as Customer_Type_Description '+
   'FROM Customer_Type '+
	 '	INNER JOIN (Customer '+
	 '	INNER JOIN (Customer_Branch '+
	 '	INNER JOIN ((Sales_Invoice '+
	 '	INNER JOIN Rep '+
	 '		ON Sales_Invoice.Rep = Rep.Rep) '+
	 '	INNER JOIN Sales_Invoice_Line '+
	 '		ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) '+
	 '		ON (Customer_Branch.Branch_no = Sales_Invoice.Branch_no) AND (Customer_Branch.Customer = Sales_Invoice.Customer)) '+
	 '		ON Customer.Customer = Customer_Branch.Customer) '+
	 '		ON Customer_Type.Customer_Type = Customer.Customer_Type ';

  SQLCoreCustSubReps =
   'SELECT DISTINCT Sales_Invoice.Customer, '+
	 'Sales_Invoice.Branch_no, '+
   'Sales_Invoice.Sales_Invoice, '+
	 'Customer_Branch.Account_Code, '+
	 'Customer_Branch.Name as Branch_Name, '+
	 'Customer.Name, '+
	 'Sales_Invoice.Sales_Invoice_No, '+
	 'Sales_Invoice.Goods_Value, '+
	 'Sales_Invoice.Vat_Value, '+
	 '(Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Total, '+
	 'Sales_Invoice.Invoice_Date, '+
	 'Sales_Invoice.Invoice_or_Credit, '+
   'Sales_Invoice.Rep, '+
   'Sales_Invoice.Sub_Rep, '+
   '	Sales_Invoice.Sales_Invoice_type, '+
   '	Sales_Invoice.Inactive, '+
	 'Sales_Invoice.Reference, '+
	 'Sales_Invoice.Invoice_Description, '+
   'Sales_Invoice.Cust_Order_no, '+
	 '(case sales_invoice_type '+
	 'when ''S'' then (select distinct Supplier.Name '+
	 '		from Purch_ord, Supplier '+
	 '		where Purch_Ord.Sales_order = Sales_invoice.Reference and '+
   '      Purch_Ord.Sales_order <> NULL and '+
	 '			Purch_Ord.Supplier = Supplier.Supplier) '+
	 'when ''J'' then ''Multiple Suppliers'' '+
	 'else (select Supplier.Name '+
	 '	from Purchase_order, Supplier, Supplier_Branch '+
	 '	where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purchase_Order and '+
	 '	((Purchase_Order.Supplier = Supplier_Branch.Supplier) and '+
	 '	(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and '+
	 '	(Supplier_Branch.Supplier = Supplier.Supplier)) '+
	 'end) as Supplier_Name, '+
   '(case invoice_or_credit '+
   '  when ''I'' then '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (select distinct Operator.Name '+
	 '		from Sales_Order, Operator '+
	 '		where   Sales_Order.Sales_order = Sales_invoice.Reference and '+
	 '				Sales_Order.Office_Contact = Operator.Operator) '+
	 'when ''J'' then (select distinct Operator.Name '+
	 '		from Job_Bag, Operator '+
	 '		where	Job_Bag.Job_Bag = Sales_invoice.Reference and '+
	 '				Job_Bag.Office_Contact = Operator.Operator) '+
	 'else (select distinct Operator.Name '+
	 '	from Purchase_order, Operator '+
	 '		where	Purchase_Order.Purchase_Order = Sales_invoice.Reference and '+
	 '				Purchase_Order.Office_Contact = Operator.Operator) '+
	 'end)) else '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (select distinct Operator.Name '+
	 '		from Sales_invoice SI, Sales_Order, Operator '+
	 '		where   Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Sales_Order.Sales_order = CAST(SI.Reference AS DECIMAL) and '+
	 '				Sales_Order.Office_Contact = Operator.Operator) '+
	 'when ''J'' then (select distinct Operator.Name '+
	 '		from Sales_Invoice SI, Job_Bag, Operator '+
	 '		where	Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Job_Bag.Job_Bag = CAST(SI.Reference AS DECIMAL) and '+
	 '				Job_Bag.Office_Contact = Operator.Operator) '+
	 'else (select distinct Operator.Name '+
	 '	from Sales_Invoice SI, Purchase_order, Operator  '+
	 '		where	Si.Sales_Invoice_No = Sales_Invoice.Reference and '+
	 '				Purchase_Order.Purchase_Order = CAST(SI.Reference AS DECIMAL) and '+
	 '				Purchase_Order.Office_Contact = Operator.Operator) '+
	 'end)) '+
	 'end) as Account_Manager_Name, '+
   '(case invoice_or_credit '+
   '  when ''I'' then '+
	 '(	 (case sales_invoice_type '+
	 'when ''S'' then (0) '+
	 'when ''J'' then (select distinct Job_Bag.Quantity '+
	 '		from Job_Bag '+
	 '		where	Job_Bag.Job_Bag = Sales_invoice.Reference) '+
	 'else (select distinct Purchase_OrderLine.Quantity '+
	 '	from Purchase_order, Purchase_OrderLine '+
	 '		where	(Purchase_Order.Purchase_Order = Sales_invoice.Reference) and '+
	 '				((Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Order) AND '+
	 '				(Purchase_OrderLine.Line = 1))) '+
	 'end)) else '+
	 '(	 (0)) '+
	 'end) as Quantity, '+
	 'Rep.Name as Rep_Name, '+
	 'Customer_Type.Description as Customer_Type_Description '+
   'FROM Customer_Type '+
	 '	INNER JOIN (Customer '+
	 '	INNER JOIN (Customer_Branch '+
	 '	INNER JOIN ((Sales_Invoice '+
	 '	INNER JOIN Rep '+
	 '		ON Sales_Invoice.Sub_Rep = Rep.Rep) '+
	 '	INNER JOIN Sales_Invoice_Line '+
	 '		ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) '+
	 '		ON (Customer_Branch.Branch_no = Sales_Invoice.Branch_no) AND (Customer_Branch.Customer = Sales_Invoice.Customer)) '+
	 '		ON Customer.Customer = Customer_Branch.Customer) '+
	 '		ON Customer_Type.Customer_Type = Customer.Customer_Type ';

  SQLCoreAccess =
  'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer, '+
	' Sales_Invoice.Inv_to_Branch AS Branch_no, '+
  ' Sales_Invoice.Sales_Invoice, '+
	' Customer_Branch.Account_Code, '+
	 'Customer_Branch.Name as Branch_Name, '+
	' Customer.Name, '+
	' Sales_Invoice.Sales_Invoice_No, '+
	' Sales_Invoice.Goods_Value, '+
	' Sales_Invoice.Vat_Value, '+
	' (Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Total, '+
	' Sales_Invoice.Invoice_Date, '+
	' Sales_Invoice.Invoice_or_Credit, '+
  ' Sales_Invoice.Rep, '+
  '	Sales_Invoice.Sales_Invoice_type, '+
  '	Sales_Invoice.Inactive, '+
	' Sales_Invoice.Reference, '+
	' Sales_Invoice.Invoice_Description, '+
   'Sales_Invoice.Cust_Order_no, '+
	' (select Supplier.Name '+
	'   from Purchase_order, Supplier, Supplier_Branch '+
	'   where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purchase_Order and '+
	'	    ((Sales_invoice.Sales_invoice_type <> ''J'') or '+
	'	    (Sales_invoice.Sales_invoice_type is null)) and '+
	'	    ((Purchase_Order.Supplier = Supplier_Branch.Supplier) and '+
	'	    (Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and '+
	'	    (Supplier_Branch.Supplier = Supplier.Supplier)) AS Supplier_Name, '+
	' Rep.Name as Rep_Name '+
  'FROM (Customer '+
	' INNER JOIN ((Customer_Branch '+
	' INNER JOIN Sales_Invoice ON '+
	' 	(Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer) AND '+
	' 	(Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch)) '+
	' INNER JOIN Sales_Invoice_Line ON '+
	' 	Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
	'	  Customer.Customer = Customer_Branch.Customer) '+
	' INNER JOIN Rep ON '+
	' 	Sales_Invoice.Rep = Rep.Rep ';


  SQLCoreCustAccess =
  'SELECT DISTINCT Sales_Invoice.Customer, '+
	' Sales_Invoice.Branch_no, '+
  ' Sales_Invoice.Sales_Invoice, '+
	' Customer_Branch.Account_Code, '+
	 'Customer_Branch.Name as Branch_Name, '+
	' Customer.Name, '+
	' Sales_Invoice.Sales_Invoice_No, '+
	' Sales_Invoice.Goods_Value, '+
	' Sales_Invoice.Vat_Value, '+
	' (Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Total, '+
	' Sales_Invoice.Invoice_Date, '+
	' Sales_Invoice.Invoice_or_Credit, '+
  ' Sales_Invoice.Rep, '+
  '	Sales_Invoice.Sales_Invoice_type, '+
  '	Sales_Invoice.Inactive, '+
	' Sales_Invoice.Reference, '+
	' Sales_Invoice.Invoice_Description, '+
   'Sales_Invoice.Cust_Order_no, '+
	' (select Supplier.Name '+
	'   from Purchase_order, Supplier, Supplier_Branch '+
	'   where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purchase_Order and '+
	'	    ((Sales_invoice.Sales_invoice_type <> ''J'') or '+
	'	    (Sales_invoice.Sales_invoice_type is null)) and '+
	'	    ((Purchase_Order.Supplier = Supplier_Branch.Supplier) and '+
	'	    (Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and '+
	'	    (Supplier_Branch.Supplier = Supplier.Supplier)) AS Supplier_Name, '+
	' Rep.Name as Rep_Name '+
  'FROM (Customer '+
	' INNER JOIN ((Customer_Branch '+
	' INNER JOIN Sales_Invoice ON '+
	' 	(Customer_Branch.Customer = Sales_Invoice.Customer) AND '+
	' 	(Customer_Branch.Branch_no = Sales_Invoice.Branch_no)) '+
	' INNER JOIN Sales_Invoice_Line ON '+
	' 	Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
	'	  Customer.Customer = Customer_Branch.Customer) '+
	' INNER JOIN Rep ON '+
	' 	Sales_Invoice.Rep = Rep.Rep ';

procedure TPBRSSalesByInvFrm.FormCreate(Sender: TObject);
begin
//  dmBroker.ScreenAccessControl(Self,'PBSalesByInvBitBtn',PBMenuMainfrm.iOperator,0,PBMenuMainfrm.iRep) ;
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  cbSort1.ItemIndex := 0;
  cbvalues.ItemIndex := 3;
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);

  If dmBroker.iAccCtrlMenu = 4 then
    begin
      rgRep.ItemIndex := 2;
      rgRep.Enabled := false;
      repPanel.Enabled := false;
      selRepCode := dmBroker.GetOperatorRep(frmPBMainMenu.iOperator);
      with sqlRep do
      begin
        close;
        paramByName('Rep').asInteger := selrepcode;
        open;
        if not eof then
          begin
            self.caption := 'Sales by Invoice Report (Rep Access) - ' + sqlRep.fieldByName('Name').asString;
            edtRep.Text := sqlRep.fieldByName('Name').asString;
          end;
      end;

     end
  else
    begin
      selRepCode := 0 ;
    end;

  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.rgCustomerClick(Sender: TObject);
begin
{hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rgCustomer.ItemIndex = 0) then
  begin
    pnlCustSearch.Visible := False;
    EdtCustomer.Text := '';
    qrySalesByInvName.visible := True;
  end
  else
  begin
    pnlCustSearch.Visible := True;
  end;
  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.btnCustomerClick(Sender: TObject);
{creates the Cust look up form, stores the cust and branch number, displays the cust name and branch name in the Cust edit box}
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
    qrySalesByInvName.visible := False;
  end;
end;

procedure TPBRSSalesByInvFrm.FormShow(Sender: TObject);
begin
  if pos('Rep only',PBRSSalesByInvFrm.caption) > 0 then
    ForceRep(self);
  qrySalesByInv.Active := True;
end;

procedure TPBRSSalesByInvFrm.CallReport(const bPreview: Boolean);
var
  PBRPSalesByInvFrm: TPBRPSalesByInvFrm;
  PBRPSalesByInvDetFrm: TPBRPSalesByInvDetFrm;
  PrinterSettings: TPrinterSettings;
begin
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;

  qrySalesByInv.Close;
  fixquery(True);
  {add total order by clause to report query}
  if RDGrpRepTyp.ItemIndex = 1 then
  begin
    PBRPSalesByInvfrm := TPBRPSalesByInvfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPSalesByInvfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPSalesByInvfrm.qrySalesByInv.SQL.Clear;
        if TotByRadioGroup.itemIndex >= 0 then
        begin
          if TotByRadioGroup.ItemIndex = 0 then
            PBRPSalesByInvFrm.TotalByCust := True
          else
            if TotByRadioGroup.ItemIndex = 1 then
              PBRPSalesByInvFrm.TotalBySupp := True
            else
            if TotByRadioGroup.ItemIndex = 2 then
              PBRPSalesByInvFrm.TotalByRep := True
            else
            if TotByRadioGroup.ItemIndex = 3 then
              PBRPSalesByInvFrm.TotalByAM := True
            else
              begin
              PBRPSalesByInvFrm.TotalByCust := False;
              PBRPSalesByInvFrm.TotalBySupp := False;
              PBRPSalesByInvFrm.TotalByRep := False;
              PBRPSalesByInvFrm.TotalByAM := false;
              end;
        end;
        PBRPSalesByInvfrm.qrySalesByInv.SQL.Text := qrySalesByInv.Text;
        PBRPSalesByInvfrm.qrlblTitle.caption := PBRPSalesByInvfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPSalesByInvfrm.qrlblDateRange.caption :=
        PBRPSalesByInvfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPSalesByInvfrm.qrlblDateRange.caption :=
        PBRPSalesByInvfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPSalesByInvfrm.qrlblDateRange.caption :=
          PBRPSalesByInvfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;
        if TotByRadioGroup.Itemindex < 4 then
          PBRPSalesByInvfrm.qrlblTotalBy.caption := 'Total Report ' + TotByRadioGroup.Items[TotByRadioGroup.Itemindex]
        else
          PBRPSalesByInvfrm.qrlblTotalBy.caption := '';

        PBRPSalesByInvfrm.UseSubReps := chkbxSubReps.Checked;
        PBRPSalesByInvfrm.ExcludeJBCosts := chkbxExcludeJBCosts.Checked;

        PBRPSalesByInvfrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
        if bPreview then
          PBRPSalesByInvfrm.qckrpSalesByInv.Preview
        else
          if SetUpPrinter(PrinterSettings) then
            PBRPSalesByInvfrm.qckrpSalesByInv.Print;
      finally
        PrinterSettings.Free;
      end;
    finally
     Application.ProcessMessages;
     qrySalesByInv.Open;
  end;
  end
  else
  begin
   PBRPSalesByInvDetfrm := TPBRPSalesByInvDetfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPSalesByInvDetfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPSalesByInvDetfrm.qrySalesByInv.SQL.Clear;
        if TotByRadioGroup.itemIndex >= 0 then
        begin
          if TotByRadioGroup.ItemIndex = 0 then
            PBRPSalesByInvDetFrm.TotalByCust := True
          else
            if TotByRadioGroup.ItemIndex = 1 then
              PBRPSalesByInvDetFrm.TotalBySupp := True
            else
            if TotByRadioGroup.ItemIndex = 2 then
              PBRPSalesByInvDetFrm.TotalByRep := True
            else
            if TotByRadioGroup.ItemIndex = 3 then
              PBRPSalesByInvDetFrm.TotalByAM := True
            else
              begin
              PBRPSalesByInvDetFrm.TotalByCust := False;
              PBRPSalesByInvDetFrm.TotalBySupp := False;
              PBRPSalesByInvDetFrm.TotalByRep := False;
              PBRPSalesByInvDetFrm.TotalByAM := false;
              end;
        end;
        PBRPSalesByInvDetfrm.qrySalesByInv.SQL.text := qrySalesByInv.Text;
        PBRPSalesByInvDetfrm.qrlblTitle.caption := PBRPSalesByInvDetfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPSalesByInvDetfrm.qrlblDateRange.caption :=
        PBRPSalesByInvDetfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPSalesByInvDetfrm.qrlblDateRange.caption :=
        PBRPSalesByInvDetfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPSalesByInvDetfrm.qrlblDateRange.caption :=
          PBRPSalesByInvDetfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;

        if TotByRadioGroup.Itemindex < 4 then
          PBRPSalesByInvDetfrm.qrlblTotalBy.caption := 'Total Report ' + TotByRadioGroup.Items[TotByRadioGroup.Itemindex]
        else
          PBRPSalesByInvDetfrm.qrlblTotalBy.caption := '';

        PBRPSalesByInvDetfrm.UseSubReps := chkbxSubReps.Checked;
        PBRPSalesByInvDetfrm.ExcludeJBCosts := chkbxExcludeJBCosts.Checked;

        PBRPSalesByInvDetfrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
        if bPreview then
          PBRPSalesByInvDetfrm.qckrpSalesByInv.Preview
        else
          if SetUpPrinter(PrinterSettings) then
            PBRPSalesByInvDetfrm.qckrpSalesByInv.Print;
      finally
        PrinterSettings.Free;
      end;
    finally
     Application.ProcessMessages;
     qrySalesByInv.Open;
  end;
  end;
end;

function TPBRSSalesByInvFrm.BuildQueryString(rep: Boolean): string;
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
    if chkbxSubReps.checked then
      sTemp := SQLCoreCustSubReps
    else
      sTemp := SQLCoreCust;
  end
  else
  begin
    if chkbxSubReps.checked then
      sTemp := SQLCoreSubReps
    else
      sTemp := SQLCore;
  end;

  sTemp := sTemp + ' WHERE Sales_Invoice.Sales_Invoice_Status > 10 ';
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date >= ' + qDate(DateFrom);
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(DateTo);
  sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';
  if (edtCustomer.Text <> '') then
  begin
    if chkbxCustomer.Checked then
    begin
      sTemp := sTemp + ' AND Sales_Invoice.Customer = ' + IntToStr(SelCustCode);
      if not chkbxBranches.checked then
        sTemp := sTemp + ' AND Sales_Invoice.Branch_no = ' + IntToStr(SelCustBranch);
    end
    else
    begin
      sTemp := sTemp + ' AND Sales_Invoice.Inv_to_Customer = ' + IntToStr(SelCustCode);
      if not chkbxBranches.checked then
        sTemp := sTemp + ' AND Sales_Invoice.Inv_to_Branch = ' + IntToStr(SelCustBranch);
    end;
  end;

  {Exclude any Paid invoices}
  if chkbxExcludePaid.Checked then
    begin
      sTemp := sTemp + ' AND (Sales_Invoice.Paid_Status <> ''Y'')';
    end;

  if (edtRep.Text <> '') then
  begin
    if chkbxSubReps.Checked then
      sTemp := sTemp + ' AND Sales_Invoice.Sub_Rep = ' + IntToStr(SelRepCode) + ' '
    else
      sTemp := sTemp + ' AND Sales_Invoice.Rep = ' + IntToStr(SelRepCode) + ' ';
  end;

  {Exclude zero values}
  if cbValues.itemindex = 0 then
  begin
    sTemp := sTemp + ' AND Sales_Invoice.Goods_Value > 0.00 ';
  end;

  {Zero values only}
  if cbValues.itemindex = 1 then
  begin
    sTemp := sTemp + ' AND Sales_Invoice.Goods_Value = 0.00 ';
  end;

  {Credit values only}
  if cbValues.itemindex = 2 then
  begin
    sTemp := sTemp + ' AND Sales_Invoice.Goods_Value < 0.00 ';
  end;

  sTemp := sTemp + 'ORDER BY ';

  if (Rep) and (totByRadioGroup.ItemIndex >= 0) then
  begin
    IF TotByRadioGroup.ItemIndex = 0 then
      sTemp := sTemp + 'Customer.Name, Sales_Invoice.Invoice_or_Credit,'
    else
    IF TotByRadioGroup.ItemIndex = 1 then
      sTemp := sTemp + 'Supplier_Name, Sales_Invoice.Invoice_or_Credit,'
    else
    IF TotByRadioGroup.ItemIndex = 2 then
      sTemp := sTemp + 'Rep.Name, Sales_Invoice.Invoice_or_Credit,'
    else
    IF TotByRadioGroup.ItemIndex = 3 then
      sTemp := sTemp + 'Account_Manager_Name, Sales_Invoice.Invoice_or_Credit,'
    else
      sTemp := sTemp + 'Sales_Invoice.Invoice_or_Credit,';

    if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end;
  end
  else
  begin
    if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end;
  end;
  Result := sTemp;
end;

procedure TPBRSSalesByInvFrm.FixQuery(rep: Boolean);
begin
  qrySalesByInv.DisableControls;
  try
    qrySalesByInv.Close;
    qrySalesByInv.SQL.Clear;
    qrySalesByInv.SQL.text := BuildQueryString(rep);
    qrySalesByInv.Open;
    stbrDetails.Panels[0].text := IntToStr(qrySalesByInv.RecordCount)+ ' records displayed';
  finally
    qrySalesByInv.EnableControls;
  end;
end;

function TPBRSSalesByInvFrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' Sales_Invoice.Sales_Invoice_No,';
  1:   Result := ' Sales_Invoice.Invoice_Date,';
  2:   Result := ' Customer.Name,';
  3:   Result := ' Sales_Invoice.Reference,';
  else Result := '';
  end;
end;

procedure TPBRSSalesByInvFrm.cbSortChange(Sender: TObject);
begin
  {Don't allow Customer selection as well as Total by Customer}
  if ((Sender as TComboBox).itemindex = 2) and
     (TotByRadioGroup.itemindex = 0) then
     (Sender as TComboBox).itemindex := 0;

  { Don't allow duplicate selections }
  if cbSort1.ItemIndex >= 0 then
  begin
    if cbSort2.ItemIndex = cbSort1.ItemIndex then
      cbSort2.ItemIndex := -1;
  end;
  { Shuffle up any gaps }
  if (cbSort2.ItemIndex >= 0) and (cbSort1.ItemIndex < 0) then
  begin
    cbSort1.ItemIndex := cbSort2.ItemIndex;
    cbSort2.ItemIndex := -1;
  end;
  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSSalesByInvFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSSalesByInvFrm.DateToEditChange(Sender: TObject);
begin
//  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.DateFromEditChange(Sender: TObject);
begin
//  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
  FixQuery(False);
end;

function TPBRSSalesByInvFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSSalesByInvFrm.DateFromEditExit(Sender: TObject);
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

procedure TPBRSSalesByInvFrm.DateToEditExit(Sender: TObject);
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

procedure TPBRSSalesByInvFrm.cbValuesChange(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.dbgDetailsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  if dtsrcSalesbyInv.dataset.fieldbyname('Invoice_or_credit').asstring = 'C' then
    begin
      (Sender as TDBGrid).Canvas.font.Color := clRed;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  if  (Column.Title.Caption <> 'Order') and
      (Column.Title.Caption <> 'Value') and
      (Column.Title.Caption <> 'VAT') and
      (Column.Title.Caption <> 'Total')then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
     end
  else
  	begin
      WITH Sender AS TDBGrid DO
        BEGIN
          if  (Column.Title.Caption <> 'Order') and
              (Column.Title.Caption <> 'Value') and
              (Column.Title.Caption <> 'VAT') and
              (Column.Title.Caption <> 'Total') then
            begin
              Canvas.Brush.Color := Color;
              Canvas.Font.Color  := Font.Color;
              Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2, Column.field.asstring);
            end;
        END;
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Value') or
          (Column.Title.Caption = 'VAT') or
          (Column.Title.Caption = 'Total') then
        begin
          TNumericField(Column.Field).DisplayFormat := '£#,###,##0.00';
        end;

        Column.Alignment := taRightJustify;
     end;
end;

procedure TPBRSSalesByInvFrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.enabled := TotByRadioGroup.itemindex <> 4;
  if TotByRadioGroup.itemindex = 4 then
    begin
      chkbxPageBreak.checked := false;
      chkbxPageBreak.caption := 'Page break by total';
    end
  else
    chkbxPageBreak.caption := 'Page break ' + TotByRadioGroup.items[TotByRadioGroup.itemindex];

  if (TotByRadioGroup.ItemIndex = 0) and (cbSort1.ItemIndex = 2) then
  begin
    if cbSort2.ItemIndex = 0 then
      cbSort1.ItemIndex := 1
    else
      cbSort1.ItemIndex := 0;
  end;

  if (TotByRadioGroup.ItemIndex = 0) and (cbSort2.ItemIndex = 2) then
  begin
    if cbSort1.ItemIndex = 0 then
      cbSort2.ItemIndex := 1
    else
      cbSort2.ItemIndex := 0;
  end;

  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.qrySalesByInvSupplier_DescGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if trim(qrySalesByInvSupplier_Name.asstring) = '' then
    if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
      text := 'Stock Warehouse'
    else
      text := 'Multiple Suppliers'
  else
    text := qrySalesByInvSupplier_Name.asstring;
end;

procedure TPBRSSalesByInvFrm.qrySalesByInvCalcFields(DataSet: TDataSet);
begin
  if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
    qrySalesByInvOrderDesc.asstring := 'SO/'+qrySalesByInvReference.asstring
  else
  if qrySalesByInvSales_Invoice_Type.asstring = 'J' then
    qrySalesByInvOrderDesc.asstring := 'JB/'+qrySalesByInvReference.asstring
  else
    qrySalesByInvOrderDesc.asstring := qrySalesByInvReference.asstring;

  if qrySalesByInvInvoice_or_credit.asstring = 'C' then
    qrySalesByInvOrderDesc.asstring := 'INV/'+qrySalesByInvReference.asstring
end;

procedure TPBRSSalesByInvFrm.chkbxCustomerClick(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.chkbxBranchesClick(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.btnRepClick(Sender: TObject);
begin
 PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := SelRepCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      SelrepCode := PBLURepFrm.SelCode;
      SelrepText := PBLURepFrm.SelName;
    end;
    edtRep.Text := SelRepText;
    FixQuery(False);
  finally
    PBLURepFrm.Free;
  end;
end;

procedure TPBRSSalesByInvFrm.rgRepClick(Sender: TObject);
begin
  if (rgRep.ItemIndex = 0) then
  begin
    RepPanel.Visible := False;
    EdtRep.Text := '';
    qrySalesByInvName.visible := True;
  end
  else
  begin
    RepPanel.Visible := True;
  end;
  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.ForceRep(Sender: TObject);
begin
  rgRep.ItemIndex := 1;
  rgRep.enabled := False;
  RepPanel.enabled := False;
  with SQLRep do
  begin
    close;
    ParamByName('Rep').Asinteger :=  frmpbMainMenu.iRep;
    Open;
    SelrepCode :=  frmpbMainMenu.iRep;
    SelrepText := fieldByName('Name').AsString;
    edtRep.Text := SelRepText;
    FixQuery(False);
  end;
end;

procedure TPBRSSalesByInvFrm.btbtnExcelClick(Sender: TObject);
var
  PBRPSalesByInvFrm: TPBRPSalesByInvFrm;
  PBRPSalesByInvDetFrm: TPBRPSalesByInvDetFrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
begin
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;

  qrySalesByInv.Close;
  fixquery(True);

  {add total order by clause to report query}
  if RDGrpRepTyp.ItemIndex = 1 then
  begin
    PBRPSalesByInvfrm := TPBRPSalesByInvfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPSalesByInvfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPSalesByInvfrm.qrySalesByInv.SQL.Clear;
        if TotByRadioGroup.itemIndex >= 0 then
        begin
          if TotByRadioGroup.ItemIndex = 0 then
            PBRPSalesByInvFrm.TotalByCust := True
          else
            if TotByRadioGroup.ItemIndex = 1 then
              PBRPSalesByInvFrm.TotalBySupp := True
            else
            if TotByRadioGroup.ItemIndex = 2 then
              PBRPSalesByInvFrm.TotalByRep := True
            else
            if TotByRadioGroup.ItemIndex = 3 then
              PBRPSalesByInvFrm.TotalByRep := True
            else
              begin
              PBRPSalesByInvFrm.TotalByCust := False;
              PBRPSalesByInvFrm.TotalBySupp := False;
              PBRPSalesByInvFrm.TotalByRep := False;
              PBRPSalesByInvFrm.TotalByAM := False;
              end;
        end;
        PBRPSalesByInvfrm.qrySalesByInv.SQL.Text := qrySalesByInv.Text;
        PBRPSalesByInvfrm.qrlblTitle.caption := PBRPSalesByInvfrm.qrlblTitle.caption + ' ' + DateToStr(Date);
        PBRPSalesByInvfrm.qrlblDateRange.caption :=
        PBRPSalesByInvfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPSalesByInvfrm.qrlblDateRange.caption :=
        PBRPSalesByInvfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPSalesByInvfrm.qrlblDateRange.caption :=
          PBRPSalesByInvfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;

        PBRPSalesByInvfrm.ExcludeJBCosts := chkbxExcludeJBCosts.Checked;
        PBRPSalesByInvfrm.UseSubReps := chkbxSubReps.Checked;

        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;


        PBRPSalesByInvfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      finally
        PrinterSettings.Free;
      end;
    finally
      PBRPSalesByInvfrm.free;
      Application.ProcessMessages;
      qrySalesByInv.Open;
    end;
  end
  else
  begin
   PBRPSalesByInvDetfrm := TPBRPSalesByInvDetfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPSalesByInvDetfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPSalesByInvDetfrm.qrySalesByInv.SQL.Clear;
        if TotByRadioGroup.itemIndex >= 0 then
        begin
          if TotByRadioGroup.ItemIndex = 0 then
            PBRPSalesByInvDetFrm.TotalByCust := True
          else
            if TotByRadioGroup.ItemIndex = 1 then
              PBRPSalesByInvDetFrm.TotalBySupp := True
            else
            if TotByRadioGroup.ItemIndex = 2 then
              PBRPSalesByInvDetFrm.TotalByRep := True
            else
            if TotByRadioGroup.ItemIndex = 3 then
              PBRPSalesByInvDetFrm.TotalByAM := True
            else
              begin
              PBRPSalesByInvDetFrm.TotalByCust := False;
              PBRPSalesByInvDetFrm.TotalBySupp := False;
              PBRPSalesByInvDetFrm.TotalByRep := False;
              PBRPSalesByInvDetFrm.TotalByAM := False;
              end;
        end;
        PBRPSalesByInvDetfrm.qrySalesByInv.SQL.text := qrySalesByInv.Text;
        PBRPSalesByInvDetfrm.qrlblTitle.caption := PBRPSalesByInvDetfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPSalesByInvDetfrm.qrlblDateRange.caption :=
        PBRPSalesByInvDetfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPSalesByInvDetfrm.qrlblDateRange.caption :=
        PBRPSalesByInvDetfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPSalesByInvDetfrm.qrlblDateRange.caption :=
          PBRPSalesByInvDetfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;

        PBRPSalesByInvDetfrm.ExcludeJBCosts := chkbxExcludeJBCosts.Checked;
        PBRPSalesByInvDetfrm.UseSubReps := chkbxSubReps.Checked;

        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPSalesByInvDetfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      finally
        PrinterSettings.Free;
      end;
    finally
      PBRPSalesByInvDetfrm.free;
      Application.ProcessMessages;
      qrySalesByInv.Open;
    end;
  end;
end;

procedure TPBRSSalesByInvFrm.chkbxExcludePaidClick(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesByInvFrm.chkbxSubRepsClick(Sender: TObject);
begin
  if (Sender as TCheckbox).checked then
    begin
      rgRep.Caption := 'By Sub-Rep ';
      lblRep.Caption := 'Sub Rep Name';
      totbyRadioGroup.Items[2] := 'by Sub-Rep';
    end
  else
    begin
      rgRep.Caption := 'By Rep ';
      lblRep.Caption := 'Rep Name';
      totbyRadioGroup.Items[2] := 'by Rep';
    end;

  FixQuery(False);
end;

end.
