unit PBRSSalesByPrdCat;

(**********************************************************************

VSS Info:
$Header:  $
$History: $
***********************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls, Buttons,
  Printers, CCSPrint, DateSelV5, PBPOObjects, OleCtnrs, CCSCommon, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSSalesByPrdCatFrm = class(TForm)
    qrySalesByPrdCat: TFDQuery;
    dtsrcSalesByInv: TDataSource;
    pnlDisplay: TPanel;
    pnlControls: TPanel;
    pnlPrintControl: TPanel;
    Panel1: TPanel;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    dbgDetails: TDBGrid;
    lblRecordCount: TLabel;
    CancelBitBtn: TBitBtn;
    cbSort1: TComboBox;
    cbSort2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    cbValues: TComboBox;
    chkbxPageBreak: TCheckBox;
    qrySalesByPrdCatInvoice_Description: TStringField;
    qrySalesByPrdCatSupplier_Desc: TStringField;
    qrySalesByPrdCatOrderDesc: TStringField;
    DateToEdit: TEdit;
    rgPrdCat: TRadioGroup;
    RepPanel: TPanel;
    lblPrdCat: TLabel;
    edtPrdCat: TEdit;
    btnRep: TButton;
    SQLRep: TFDQuery;
    RdGrpRepTyp: TRadioGroup;
    btbtnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    qrySalesByPrdCatCustomer: TIntegerField;
    qrySalesByPrdCatBranch_no: TIntegerField;
    qrySalesByPrdCatSales_Invoice: TIntegerField;
    qrySalesByPrdCatAccount_Code: TStringField;
    qrySalesByPrdCatName: TStringField;
    qrySalesByPrdCatSales_Invoice_No: TStringField;
    qrySalesByPrdCatGoods_Value: TCurrencyField;
    qrySalesByPrdCatVat_Value: TCurrencyField;
    qrySalesByPrdCatGoods_Total: TCurrencyField;
    qrySalesByPrdCatInvoice_Date: TDateTimeField;
    qrySalesByPrdCatInvoice_or_Credit: TStringField;
    qrySalesByPrdCatRep: TIntegerField;
    qrySalesByPrdCatSales_invoice_type: TStringField;
    qrySalesByPrdCatInactive: TStringField;
    qrySalesByPrdCatReference: TStringField;
    qrySalesByPrdCatSupplier_Name: TStringField;
    qrySalesByPrdCatRep_Name: TStringField;
    qrySalesByPrdCatDescription: TStringField;
    qrySalesByPrdCatName_1: TStringField;
    chkbxTotalByProduct: TCheckBox;
    rgCustomer: TRadioGroup;
    pnlCustSearch: TPanel;
    lblCustBran: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    chkbxBranches: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure cbValuesChange(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrySalesByPrdCatSupplier_DescGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesByPrdCatCalcFields(DataSet: TDataSet);
    procedure btnRepClick(Sender: TObject);
    procedure rgPrdCatClick(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
    procedure RdGrpRepTypClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
  private
    DateFrom, DateTo: TDateTime;
    SelCode: string;
    SelText : string;
    SelCustCode, SelCustBranch : integer;
    SelCustText : string;
    procedure FixQuery(rep: Boolean);
    function BuildQueryString(rep: Boolean): string;
    procedure CallReport(const bPreview : Boolean);
    function Ordering(aBox: TComboBox): string;
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  PBRSSalesByPrdCatFrm: TPBRSSalesByPrdCatFrm;

implementation

uses
  System.UITypes,
  PBRPSalesByPrdCatDet, PBRPSalesByPrdCat, PBDatabase, PBMaintGroups,
  PBLUCust;

{$R *.DFM}

const
  SQLCore =
  'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer, ' +
  'Sales_Invoice.Inv_to_Branch AS Branch_no, Sales_Invoice.Sales_Invoice, '+
  'Customer_Branch.Account_Code, Customer.Name, Sales_Invoice.Sales_Invoice_No, '+
  'Sales_Invoice.Goods_Value, Sales_Invoice.Vat_Value, '+
  '(Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Total, '+
  'Sales_Invoice.Invoice_Date, Sales_Invoice.Invoice_or_Credit, '+
  'Sales_Invoice.Rep, Sales_Invoice.Sales_invoice_type, '+
  'Sales_Invoice.Inactive, Sales_Invoice.Reference, '+
  'Sales_Invoice.Invoice_Description, '+
  'Sales_invoice.Invoice_Location, '+
  'Invoice_Location.Invoice_Location_Descr, '+
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
    'Rep.Name AS Rep_Name, Rep.Name, ' +
    'Category.Category, '+
    'Category.description, '+
    'Sales_Invoice_Line.Product_type, '+
    'Sales_invoice_Line.Invoice_Line_No, '+
    'Product_Type.Description as Product_Type_Description '+
'FROM (Customer INNER JOIN Customer_Branch ON Customer.Customer = Customer_Branch.Customer) '+
  ' INNER JOIN (Category '+
  ' INNER JOIN (Product_Type '+
  ' INNER JOIN (((Invoice_Location '+
  ' RIGHT JOIN Sales_Invoice ON Invoice_Location.Invoice_Location=Sales_Invoice.Invoice_Location) '+
  ' INNER JOIN Rep ON Sales_Invoice.Rep = Rep.Rep) '+
  ' INNER JOIN Sales_Invoice_Line ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) '+
  '     ON Product_Type.Product_Type=Sales_Invoice_Line.Product_Type) ON Category.Category=Product_Type.Category) '+
  '     ON (Customer_Branch.Branch_no=Sales_Invoice.Inv_to_Branch) AND (Customer_Branch.Customer=Sales_Invoice.Inv_to_Customer)';

  oldSQLCore =
  'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer, ' +
  'Sales_Invoice.Inv_to_Branch AS Branch_no, Sales_Invoice.Sales_Invoice, '+
  'Customer_Branch.Account_Code, Customer.Name, Sales_Invoice.Sales_Invoice_No, '+
  'Sales_Invoice.Goods_Value, Sales_Invoice.Vat_Value, '+
  '(Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Total, '+
  'Sales_Invoice.Invoice_Date, Sales_Invoice.Invoice_or_Credit, '+
  'Sales_Invoice.Rep, Sales_Invoice.Sales_invoice_type, '+
  'Sales_Invoice.Inactive, Sales_Invoice.Reference, '+
  'Sales_Invoice.Invoice_Description, '+
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
    'Rep.Name AS Rep_Name, Rep.Name, ' +
    'Category.Category, '+
    'Category.description, '+
    'Sales_Invoice_Line.Product_type, '+
    'Sales_invoice_Line.Invoice_Line_No, '+
    'Product_Type.Description as Product_Type_Description '+
'FROM Category inner join Product_Type on (category.category = product_type.category) '+
'right JOIN (Customer INNER JOIN (((Customer_Branch  '+
'INNER JOIN Sales_Invoice ON (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch) '+
'AND (Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer)) '+
'INNER JOIN Rep ON Sales_Invoice.Rep = Rep.Rep) '+
'right JOIN Sales_Invoice_Line ON '+
    'Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
    'Customer.Customer = Customer_Branch.Customer) ON '+
    'Product_Type.Product_Type = Sales_Invoice_Line.Product_Type ';

  SQLCoreAccess =
  'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer, '+
  '  Sales_Invoice.Inv_to_Branch AS Branch_no, '+
  '  Sales_Invoice.Sales_Invoice, '+
  '  Customer_Branch.Account_Code, '+
  '  Customer.Name, Sales_Invoice.Sales_Invoice_No, '+
  '  Sales_Invoice.Goods_Value, Sales_Invoice.Vat_Value, '+
  ' (Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Total, '+
  ' Sales_Invoice.Invoice_Date, Sales_Invoice.Invoice_or_Credit, '+
  ' Sales_Invoice.Rep, Sales_Invoice.Sales_invoice_type, '+
  ' Sales_Invoice.Inactive, Sales_Invoice.Reference, '+
  ' Sales_Invoice.Invoice_Description, '+
  '(select Supplier.Name '+
  '   from Purchase_order, Supplier, Supplier_Branch '+
  '   where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purchase_Order and '+
  '   ((Purchase_Order.Supplier = Supplier_Branch.Supplier) and '+
  '   (Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and '+
  '   (Supplier_Branch.Supplier = Supplier.Supplier)) AS Supplier_Name, '+
  ' Category.Category, Category.Description, Sales_Invoice_Line.Product_Type, '+
  ' Sales_Invoice_Line.Invoice_Line_No, '+
  ' Rep.Name as Rep_Name, Rep.Name '+
  'FROM (Customer '+
  ' INNER JOIN (Category '+
  ' INNER JOIN (Product_Type '+
  ' INNER JOIN ((Customer_Branch '+
  ' INNER JOIN Sales_Invoice ON '+
  ' (Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer) AND '+
  ' (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch)) '+
  ' INNER JOIN Sales_Invoice_Line ON '+
  ' Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ON '+
  ' Product_Type.Product_Type = Sales_Invoice_Line.Product_Type) ON '+
  ' Category.Category = Product_Type.Category) ON '+
  ' Customer.Customer = Customer_Branch.Customer) '+
  ' INNER JOIN Rep ON Sales_Invoice.Rep = Rep.Rep ';

procedure TPBRSSalesByPrdCatFrm.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  cbSort1.ItemIndex := 0;
  cbvalues.ItemIndex := 3;
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSSalesByPrdCatFrm.FormShow(Sender: TObject);
begin
  qrySalesByPrdCat.Active := True;
end;

procedure TPBRSSalesByPrdCatFrm.CallReport(const bPreview: Boolean);
var
  PBRPSalesByPrdCatFrm: TPBRPSalesByPrdCatFrm;
  PBRPSalesByPrdCatDetFrm: TPBRPSalesByPrdCatDetFrm;
  PrinterSettings: TPrinterSettings;
begin
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;

  qrySalesByPrdCat.Close;
  fixquery(True);
  {Summary version}
  if RDGrpRepTyp.ItemIndex = 0 then
  begin
    PBRPSalesByPrdCatfrm := TPBRPSalesByPrdCatfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPSalesByPrdCatfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPSalesByPrdCatfrm.qrySalesByPrdCat.SQL.Clear;
        PBRPSalesByPrdCatFrm.TotalByCust := False;
        PBRPSalesByPrdCatFrm.TotalBySupp := False;
        PBRPSalesByPrdCatFrm.TotalByRep := False;
        PBRPSalesByPrdCatFrm.TotalByProduct := chkbxTotalByProduct.checked;
        PBRPSalesByPrdCatfrm.qrySalesByPrdCat.SQL.Text := qrySalesByPrdCat.Text;
        PBRPSalesByPrdCatfrm.qrlblTitle.caption := PBRPSalesByPrdCatfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPSalesByPrdCatfrm.qrlblDateRange.caption := PBRPSalesByPrdCatfrm.qrlblDateRange.caption + trim(edtCustomer.text);
        PBRPSalesByPrdCatfrm.qrlblDateRange.caption := PBRPSalesByPrdCatfrm.qrlblDateRange.caption + DateFromEdit.Text +
                                                        ' to: ' + DateToEdit.Text;
        PBRPSalesByPrdCatfrm.qrlblDateRange.caption := PBRPSalesByPrdCatfrm.qrlblDateRange.caption + ' Ordered by: ' +
                                                        cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPSalesByPrdCatfrm.qrlblDateRange.caption :=
          PBRPSalesByPrdCatfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;
        PBRPSalesByPrdCatfrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
        if bPreview then
          PBRPSalesByPrdCatfrm.qckrpSalesByPrdCat.Preview
        else
          if SetUpPrinter(PrinterSettings) then
            PBRPSalesByPrdCatfrm.qckrpSalesByPrdCat.Print;
      finally
        PrinterSettings.Free;
      end;
    finally
     Application.ProcessMessages;
     qrySalesByPrdCat.Open;
  end;
  end
  else
  begin
   PBRPSalesByPrdCatDetfrm := TPBRPSalesByPrdCatDetfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPSalesByPrdCatDetfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPSalesByPrdCatDetfrm.qrySalesByPrdCat.SQL.Clear;
        PBRPSalesByPrdCatDetFrm.TotalByCust := False;
        PBRPSalesByPrdCatDetFrm.TotalBySupp := False;
        PBRPSalesByPrdCatDetFrm.TotalByRep := False;
        PBRPSalesByPrdCatDetfrm.qrySalesByPrdCat.SQL.text := qrySalesByPrdCat.Text;
        PBRPSalesByPrdCatDetfrm.qrlblTitle.caption := PBRPSalesByPrdCatDetfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption :=
        PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption :=
        PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption :=
          PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;
        PBRPSalesByPrdCatDetfrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
        if bPreview then
          PBRPSalesByPrdCatDetfrm.qckrpSalesByPrdCat.Preview
        else
          if SetUpPrinter(PrinterSettings) then
            PBRPSalesByPrdCatDetfrm.qckrpSalesByPrdCat.Print;
      finally
        PrinterSettings.Free;
      end;
    finally
     Application.ProcessMessages;
     qrySalesByPrdCat.Open;
  end;
  end;
end;

function TPBRSSalesByPrdCatFrm.BuildQueryString(rep: Boolean): string;
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
  if dmBroker.IsSQL then
    sTemp := SQLCore
  else
    sTemp := SQLCoreAccess;

  sTemp := sTemp + ' WHERE Sales_Invoice.Sales_Invoice_Status > 10 ';
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date >= ' + qDate(DateFrom);
  sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(DateTo);
  sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';

  if (edtCustomer.Text <> '') then
  begin
    sTemp := sTemp + ' AND Sales_Invoice.Inv_to_Customer = ' + IntToStr(SelCustCode);
    if not chkbxBranches.checked then
      sTemp := sTemp + ' AND Sales_Invoice.Inv_to_Branch = ' + IntToStr(SelCustBranch);
  end;

  if (edtPrdCat.Text <> '') then
  begin
    sTemp := sTemp + ' AND Category.Category = ' + SelCode + ' ';
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

  sTemp := sTemp + ' ORDER BY ';

  sTemp := sTemp + 'Invoice_Location.Invoice_Location_Descr,';
  sTemp := sTemp + 'Category.Description,';

  if chkbxTotalByProduct.checked then
    sTemp := sTemp + 'Product_Type.Description,';

  if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
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

procedure TPBRSSalesByPrdCatFrm.FixQuery(rep: Boolean);
begin
  qrySalesByPrdCat.DisableControls;
  try
    qrySalesByPrdCat.Close;
    qrySalesByPrdCat.SQL.Clear;
    qrySalesByPrdCat.SQL.text := BuildQueryString(rep);
    qrySalesByPrdCat.Open;
    lblRecordCount.Caption:=IntToStr(qrySalesByPrdCat.RecordCount);
  finally
    qrySalesByPrdCat.EnableControls;
  end;
end;

function TPBRSSalesByPrdCatFrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' Sales_Invoice.Sales_Invoice_No,';
  1:   Result := ' Customer.Name,';
  2:   Result := ' Supplier_Name,';
  3:   Result := ' Rep.Name';
  else Result := '';
  end;
end;

procedure TPBRSSalesByPrdCatFrm.cbSortChange(Sender: TObject);
begin
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

procedure TPBRSSalesByPrdCatFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSSalesByPrdCatFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSSalesByPrdCatFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSSalesByPrdCatFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
  FixQuery(False);
end;

function TPBRSSalesByPrdCatFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSSalesByPrdCatFrm.DateFromEditExit(Sender: TObject);
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

procedure TPBRSSalesByPrdCatFrm.DateToEditExit(Sender: TObject);
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

procedure TPBRSSalesByPrdCatFrm.cbValuesChange(Sender: TObject);
begin
  FixQuery(False);
end;

procedure TPBRSSalesByPrdCatFrm.dbgDetailsDrawColumnCell(
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

procedure TPBRSSalesByPrdCatFrm.qrySalesByPrdCatSupplier_DescGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if trim(qrySalesByPrdCatSupplier_Name.asstring) = '' then
    if qrySalesByPrdCatSales_Invoice_Type.asstring = 'S' then
      text := 'Stock Warehouse'
    else
      text := 'Multiple Suppliers'
  else
    text := qrySalesByPrdCatSupplier_Name.asstring;
end;

procedure TPBRSSalesByPrdCatFrm.qrySalesByPrdCatCalcFields(DataSet: TDataSet);
begin
  if qrySalesByPrdCatSales_Invoice_Type.asstring = 'S' then
    qrySalesByPrdCatOrderDesc.asstring := 'SO/'+qrySalesByPrdCatReference.asstring
  else
  if qrySalesByPrdCatSales_Invoice_Type.asstring = 'J' then
    qrySalesByPrdCatOrderDesc.asstring := 'JB/'+qrySalesByPrdCatReference.asstring
  else
    qrySalesByPrdCatOrderDesc.asstring := qrySalesByPrdCatReference.asstring;

  if qrySalesByPrdCatInvoice_or_credit.asstring = 'C' then
    qrySalesByPrdCatOrderDesc.asstring := 'INV/'+qrySalesByPrdCatReference.asstring
end;

procedure TPBRSSalesByPrdCatFrm.btnRepClick(Sender: TObject);
begin
 PBMaintGroupsFrm := TPBMaintGroupsFrm.Create(Self);
  try
    PBMaintGroupsFrm.bIs_Lookup := True;
    PBMaintGroupsFrm.SelCode := SelCode;
    PBMaintGroupsFrm.igroupselect := 2;
    PBMaintGroupsFrm.ShowModal;
    if PBMaintGroupsFrm.Selected then
    begin
      SelCode := PBMaintGroupsFrm.SelCode;
      SelText := PBMaintGroupsFrm.SelName;
    end;
    edtprdCat.Text := SelText;
    FixQuery(False);
  finally
    PBMaintGroupsFrm.Free;
  end;
end;

procedure TPBRSSalesByPrdCatFrm.rgPrdCatClick(Sender: TObject);
begin
  if (rgPrdCat.ItemIndex = 0) then
  begin
    RepPanel.Visible := False;
    edtprdCat.Text := '';
    qrySalesByPrdCatName.visible := True;
  end
  else
  begin
    RepPanel.Visible := True;
  end;
  FixQuery(False);
end;

procedure TPBRSSalesByPrdCatFrm.btbtnExcelClick(Sender: TObject);
var
  PBRPSalesByPrdCatFrm: TPBRPSalesByPrdCatFrm;
  PBRPSalesByPrdCatDetFrm: TPBRPSalesByPrdCatDetFrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
begin
  if dbgDetails.datasource.dataset.recordcount <= 0 then
    begin
      MessageDlg('No records to process', mtError,
        [mbAbort], 0);
      exit;
    end;

  qrySalesByPrdCat.Close;
  fixquery(True);
  {Summary Version}
  if RDGrpRepTyp.ItemIndex = 0 then
  begin
    PBRPSalesByPrdCatfrm := TPBRPSalesByPrdCatfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPSalesByPrdCatfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPSalesByPrdCatfrm.qrySalesByPrdCat.SQL.Clear;
        PBRPSalesByPrdCatFrm.TotalByCust := False;
        PBRPSalesByPrdCatFrm.TotalBySupp := False;
        PBRPSalesByPrdCatFrm.TotalByRep := False;
        PBRPSalesByPrdCatFrm.TotalByProduct := chkbxTotalByProduct.checked;
        PBRPSalesByPrdCatfrm.qrySalesByPrdCat.SQL.Text := qrySalesByPrdCat.Text;
        PBRPSalesByPrdCatfrm.qrlblTitle.caption := PBRPSalesByPrdCatfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPSalesByPrdCatfrm.qrlblDateRange.caption :=
        PBRPSalesByPrdCatfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPSalesByPrdCatfrm.qrlblDateRange.caption :=
        PBRPSalesByPrdCatfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPSalesByPrdCatfrm.qrlblDateRange.caption :=
          PBRPSalesByPrdCatfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;

        tempFileName := getWinTempDir+'temp.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;


        PBRPSalesByPrdCatfrm.ExportToFile(tempFileName);
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
     qrySalesByPrdCat.Open;
  end;
  end
  else
  begin
   PBRPSalesByPrdCatDetfrm := TPBRPSalesByPrdCatDetfrm.Create(Self);
    try
      PrinterSettings := TPrinterSettings.Create;
      try
        PBRPSalesByPrdCatDetfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
        PBRPSalesByPrdCatDetfrm.qrySalesByPrdCat.SQL.Clear;
        PBRPSalesByPrdCatDetFrm.TotalByCust := False;
        PBRPSalesByPrdCatDetFrm.TotalBySupp := False;
        PBRPSalesByPrdCatDetFrm.TotalByRep := False;
        PBRPSalesByPrdCatDetfrm.qrySalesByPrdCat.SQL.text := qrySalesByPrdCat.Text;
        PBRPSalesByPrdCatDetfrm.qrlblTitle.caption := PBRPSalesByPrdCatDetfrm.qrlblTitle.caption + DateToStr(Date);
        PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption :=
        PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;
        PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption :=
        PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption + ' Ordered by: ' +
          cbSort1.Text;
        if (cbSort2.Text <>'') then
        begin
          PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption :=
          PBRPSalesByPrdCatDetfrm.qrlblDateRange.caption + ' then by: ' +
            cbSort2.Text;
        end;

        tempFileName := getWinTempDir+'temp.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPSalesByPrdCatDetfrm.ExportToFile(tempFileName);
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
     qrySalesByPrdCat.Open;
  end;
  end;
end;

procedure TPBRSSalesByPrdCatFrm.RdGrpRepTypClick(Sender: TObject);
begin
  chkbxPageBreak.enabled := rdgrpReptyp.ItemIndex > 0;
end;

procedure TPBRSSalesByPrdCatFrm.btnCustomerClick(Sender: TObject);
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

procedure TPBRSSalesByPrdCatFrm.rgCustomerClick(Sender: TObject);
begin
{hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rgCustomer.ItemIndex = 0) then
  begin
    pnlCustSearch.Visible := False;
    EdtCustomer.Text := '';
//    qrySalesByInvName.visible := True;
  end
  else
  begin
    pnlCustSearch.Visible := True;
  end;
  FixQuery(False);
end;

end.
