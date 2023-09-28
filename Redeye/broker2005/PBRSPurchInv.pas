unit PBRSPurchInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls, Buttons,
  Printers, CCSPrint, DateSelV5, PBPOObjects, CCSCommon, OleCtnrs, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSPurchInvFrm = class(TForm)
    OldqryPurchInv: TFDQuery;
    dtsrcPurchInv: TDataSource;
    pnlDisplay: TPanel;
    pnlControls: TPanel;
    rgSupplier: TRadioGroup;
    pnlSuppSearch: TPanel;
    lblCustBran: TLabel;
    edtSupplier: TEdit;
    btnSupplier: TButton;
    pnlPrintControl: TPanel;
    Panel1: TPanel;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    dbgrdProofStatus: TDBGrid;
    lblRecordCount: TLabel;
    CancelBitBtn: TBitBtn;
    cbSort1: TComboBox;
    cbSort2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    TotByRadioGroup: TRadioGroup;
    OldqryPurchInvSupplier_Invoice: TIntegerField;
    OldqryPurchInvInvoice_Line_No: TIntegerField;
    OldqryPurchInvPurchase_Order: TFloatField;
    OldqryPurchInvLine: TIntegerField;
    OldqryPurchInvCustomer_Name: TStringField;
    OldqryPurchInvCustomers_Desc: TStringField;
    OldqryPurchInvSales_Qty: TFloatField;
    OldqryPurchInvSell_Price: TCurrencyField;
    OldqryPurchInvSales_Invoice_No: TStringField;
    OldqryPurchInvSales_Invoice_Date: TDateTimeField;
    OldqryPurchInvSupplier_Name: TStringField;
    OldqryPurchInvSupplier_Invoice_no: TStringField;
    OldqryPurchInvSupplier_Invoice_Date: TDateTimeField;
    OldqryPurchInvPurchase_Qty: TFloatField;
    OldqryPurchInvPurchase_Price: TCurrencyField;
    OldqryPurchInvRep_Name: TStringField;
    OldqryPurchInvPOLine: TStringField;
    OldqryPurchInvTotal_sell: TFloatField;
    OldqryPurchInvTotal_Purch: TFloatField;
    OldqryPurchInvCost_Unit_Factor: TFloatField;
    OldqryPurchInvPrice_Unit_Factor: TFloatField;
    OldqryPurchInvDate_Point: TDateTimeField;
    qryPurchInv: TFDQuery;
    qryPurchInvPurchase_Order: TFloatField;
    qryPurchInvLine: TIntegerField;
    qryPurchInvDate_Point: TDateTimeField;
    qryPurchInvCustomer_Name: TStringField;
    qryPurchInvCustomers_Desc: TStringField;
    qryPurchInvSales_Qty: TFloatField;
    qryPurchInvSell_Price: TCurrencyField;
    qryPurchInvPurchase_Price: TCurrencyField;
    qryPurchInvPurchase_qty: TFloatField;
    qryPurchInvSupplier_Name: TStringField;
    qryPurchInvSales_invoice_no: TStringField;
    qryPurchInvSales_invoice_date: TDateTimeField;
    qryPurchInvSupplier_invoice_no: TStringField;
    qryPurchInvSupplier_invoice_date: TDateTimeField;
    qryPurchInvRep_Name: TStringField;
    qryPurchInvPOLine: TStringField;
    qryPurchInvTotal_sell: TFloatField;
    qryPurchInvTotal_Purch: TFloatField;
    qryPurchInvPrice_Unit_Factor: TFloatField;
    qryPurchInvCost_Unit_Factor: TFloatField;
    qryPurchInvSupplier_Invoice: TIntegerField;
    qryPurchInvInvoice_Line_No: TIntegerField;
    qryPurchInvSP_Goods_Val: TCurrencyField;
    qryPurchInvSP_Qty_Invoiced: TFloatField;
    qryPurchInvSI_Goods_Val: TFloatField;
    qryPurchInvSI_Qty_Invoiced: TFloatField;
    qryPurchInvSP_Cost_Unit_Factor: TFloatField;
    qryPurchInvSI_Cost_Unit_Factor: TFloatField;
    chkbxUnmatchedOnly: TCheckBox;
    chkbxExcludeZero: TCheckBox;
    chkbxInvoiced: TCheckBox;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    btbtnExcel: TBitBtn;
    GroupBox1: TGroupBox;
    lblDatefrom: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    lblDateto: TLabel;
    DateToButton: TSpeedButton;
    DateToEdit: TEdit;
    chkbxbyInvoice: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure rgSupplierClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
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
    procedure OldqryPurchInvPOLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure OldqryPurchInvTotal_sellGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure OldqryPurchInvTotal_PurchGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPurchInvTotal_sellGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPurchInvPOLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryPurchInvTotal_PurchGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btbtnExcelClick(Sender: TObject);
    procedure chkbxbyInvoiceClick(Sender: TObject);
  private
    SelSuppCode, SelSuppBranch : integer;
    SelSuppText : string;
    DateFrom, DateTo: TDateTime;
    procedure FixQuery(rep: Boolean);
    function BuildQueryString(rep: Boolean): string;
    procedure CallReport(const bPreview : Boolean);
    function Ordering(aBox: TComboBox): string;
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  PBRSPurchInvFrm: TPBRSPurchInvFrm;

implementation

uses UITypes, PBLUSupp, PBRPPurchInv, PBDatabase;

{$R *.DFM}

const
  SQLCore =
  'SELECT DISTINCT '+
  'Purchase_OrderLine.Purchase_Order, '+
  'Purchase_OrderLine.Line, '+
  'Purchase_Order.Date_Point, '+
  'Customer.Name AS Customer_Name, '+
  'Purchase_OrderLine.Customers_Desc, '+
  'Purchase_OrderLine.Quantity AS Sales_Qty, '+
  'Purchase_OrderLine.Selling_Price AS Sell_Price, '+
  'Purchase_OrderLine.Order_Price AS Purchase_Price, '+
  'Supplier_Invoice_Line.Qty_Invoiced AS Purchase_qty, '+
  'Supplier_Invoice_Line.Supplier_Invoice, '+
  'Supplier_Invoice_Line.Invoice_Line_No, '+
  'Supplier_Invoice_Line.Goods_Value as SP_Goods_Val, '+
  'Supplier_Invoice_Line.Qty_Invoiced as SP_Qty_Invoiced, '+
  'Sales_Invoice_Line.Goods_Value as SI_Goods_Val, '+
  'Sales_Invoice_Line.Qty_Invoiced as SI_Qty_Invoiced, '+
  'Supplier.Supplier, '+
  'Supplier.Name AS Supplier_Name, '+
  '(select distinct Sales_invoice_no '+
  ' from Sales_invoice '+
  ' where Sales_Invoice = Sales_invoice_Line.Sales_Invoice) AS Sales_invoice_no, '+
  '(select distinct Invoice_Date '+
  ' from Sales_invoice '+
  ' where Sales_Invoice = Sales_invoice_Line.Sales_Invoice) AS Sales_invoice_date, '+
  '(select distinct Supplier_invoice_no '+
  ' from Supplier_invoice '+
  ' where Supplier_Invoice = Supplier_invoice_Line.Supplier_Invoice) AS Supplier_invoice_no, '+
  '(select distinct Invoice_Date '+
  ' from Supplier_invoice '+
  ' where Supplier_Invoice = Supplier_invoice_Line.Supplier_Invoice) AS Supplier_invoice_date, '+
  '(select Price_unit_factor '+
  ' from Price_unit '+
  ' where Price_Unit = Purchase_orderLine.Sell_Unit) AS Price_Unit_Factor, '+
  '(select Price_unit_factor '+
  ' from Price_unit '+
  ' where Price_Unit = Purchase_orderLine.Order_Unit) AS Cost_Unit_Factor, '+
  '(select Price_unit_factor '+
  ' from Price_unit '+
  ' where Price_Unit = Supplier_Invoice_Line.Price_Unit) AS SP_Cost_Unit_Factor, '+
  '(select Price_unit_factor '+
  ' from Price_unit '+
  ' where Price_Unit = Sales_Invoice_Line.Price_Unit) AS SI_Cost_Unit_Factor, '+
  'Rep.Name as Rep_Name, '+
  'Sales_Invoice_Line.Goods_Value ' +
  'FROM Rep '+
  '  INNER JOIN ((Supplier '+
  '  INNER JOIN Purchase_Order ON '+
  '    Supplier.Supplier = Purchase_Order.Supplier) '+
  '  INNER JOIN (((Purchase_OrderLine '+
  '  INNER JOIN Customer ON '+
  '    Purchase_OrderLine.Customer = Customer.Customer) '+
  '    LEFT JOIN Sales_Invoice_Line ON '+
  '    (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND '+
  '    (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Purchase_Order)) '+
  '    LEFT JOIN Supplier_Invoice_Line ON '+
  '    (Purchase_OrderLine.Line = Supplier_Invoice_Line.Line) AND '+
  '    (Purchase_OrderLine.Purchase_Order = Supplier_Invoice_Line.Purchase_Order)) ON '+
  '    Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_Order) ON '+
  '    Rep.Rep = Purchase_OrderLine.Rep ';

  SQLSICore =
  'SELECT DISTINCT '+
  'Purchase_OrderLine.Purchase_Order, '+
  'Purchase_OrderLine.Line, '+
  'Purchase_Order.Date_Point, '+
  'Customer.Name AS Customer_Name, '+
  'Purchase_OrderLine.Customers_Desc, '+
  'Purchase_OrderLine.Quantity AS Sales_Qty, '+
  'Purchase_OrderLine.Selling_Price AS Sell_Price, '+
  'Purchase_OrderLine.Order_Price AS Purchase_Price, '+
  'Supplier_Invoice_Line.Qty_Invoiced AS Purchase_qty, '+
  'Supplier_Invoice_Line.Supplier_Invoice, '+
  'Supplier_Invoice_Line.Invoice_Line_No, '+
  'Supplier_Invoice_Line.Goods_Value as SP_Goods_Val, '+
  'Supplier_Invoice_Line.Qty_Invoiced as SP_Qty_Invoiced, '+
  'Sales_Invoice_Line.Goods_Value as SI_Goods_Val, '+
  'Sales_Invoice_Line.Qty_Invoiced as SI_Qty_Invoiced, '+
  'Supplier.Supplier, '+
  'Supplier.Name AS Supplier_Name, '+
  'Sales_invoice.Sales_invoice_no, '+
  'Sales_invoice.Invoice_Date as Sales_Invoice_Date, '+
  '(select distinct Supplier_invoice_no '+
  ' from Supplier_invoice '+
  ' where Supplier_Invoice = Supplier_invoice_Line.Supplier_Invoice) AS Supplier_invoice_no, '+
  '(select distinct Invoice_Date '+
  ' from Supplier_invoice '+
  ' where Supplier_Invoice = Supplier_invoice_Line.Supplier_Invoice) AS Supplier_invoice_date, '+
  '(select Price_unit_factor '+
  ' from Price_unit '+
  ' where Price_Unit = Purchase_orderLine.Sell_Unit) AS Price_Unit_Factor, '+
  '(select Price_unit_factor '+
  ' from Price_unit '+
  ' where Price_Unit = Purchase_orderLine.Order_Unit) AS Cost_Unit_Factor, '+
  '(select Price_unit_factor '+
  ' from Price_unit '+
  ' where Price_Unit = Supplier_Invoice_Line.Price_Unit) AS SP_Cost_Unit_Factor, '+
  '(select Price_unit_factor '+
  ' from Price_unit '+
  ' where Price_Unit = Sales_Invoice_Line.Price_Unit) AS SI_Cost_Unit_Factor, '+
  'Rep.Name as Rep_Name, '+
  'Sales_Invoice_Line.Goods_Value ' +
  'FROM Rep ' +
	' INNER JOIN ((Supplier ' +
	' INNER JOIN Purchase_Order ' +
	' 	ON Supplier.Supplier = Purchase_Order.Supplier) ' +
	' INNER JOIN (((Customer ' +
	' INNER JOIN Purchase_OrderLine ' +
	' 	ON Customer.Customer = Purchase_OrderLine.Customer) ' +
	' INNER JOIN (Sales_Invoice ' +
	' INNER JOIN Sales_Invoice_Line ' +
	' 	ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice) ' +
	' 	ON (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Purchase_Order)) ' +
	' LEFT JOIN Supplier_Invoice_Line ' +
	' 	ON (Purchase_OrderLine.Line = Supplier_Invoice_Line.Line) AND (Purchase_OrderLine.Purchase_Order = Supplier_Invoice_Line.Purchase_Order)) ' +
	' 	ON Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_Order) ' +
	' 	ON Rep.Rep = Purchase_OrderLine.Rep ';


procedure TPBRSPurchInvFrm.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  cbSort1.ItemIndex := 0;
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSPurchInvFrm.rgSupplierClick(Sender: TObject);
begin
{hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rgSupplier.ItemIndex = 0) then
  begin
    pnlSuppSearch.Visible := False;
    EdtSupplier.Text := '';
    qryPurchInvSupplier_Name.visible := True;
  end
  else
  begin
    pnlSuppSearch.Visible := True;
  end;
  FixQuery(False);
end;

procedure TPBRSPurchInvFrm.btnSupplierClick(Sender: TObject);
{creates the Supplier look up form, stores the Supplier and branch number, displays the cust name and branch name in the Cust edit box}
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bAllow_Upd := False;
    PBLUSuppFrm.SelCode := SelSuppCode;
    PBLUSuppFrm.SelBranch := SelSuppBranch;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      SelSuppCode := PBLUSuppFrm.SelCode;
      SelSuppBranch := PBLUSuppFrm.SelBranch;
      SelSuppText := PBLUSuppFrm.SelName + ' / ' + PBLUSuppFrm.SelBranchName;
    end;
    edtSupplier.Text := SelSuppText;
    FixQuery(False);
  finally
    PBLUSuppFrm.Free;
    qryPurchInvSupplier_Name.visible := False;
  end;
end;

procedure TPBRSPurchInvFrm.FormShow(Sender: TObject);
begin
  qryPurchInv.Active := True;
end;

procedure TPBRSPurchInvFrm.CallReport(const bPreview: Boolean);
var
  PBRPPurchInvFrm: TPBRPPurchInvFrm;
  PrinterSettings: TPrinterSettings;
begin
  qryPurchInv.Close;
  fixquery(True);
  {add total order by clause to report query}

  PBRPPurchInvfrm := TPBRPPurchInvfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPPurchInvfrm.PrinterSettings := PrinterSettings;
          {this part copies the query and values from the report selection form to the report print form}
          PBRPPurchInvfrm.qryPurchInv.SQL.Clear;
          if TotByRadioGroup. itemIndex >= 0 then
            begin
            if TotByRadioGroup.ItemIndex = 0 then
              PBRPPurchInvfrm.TotalBySupp := True
            else
              PBRPPurchInvfrm.TotalByRep := True;
            end;
          PBRPPurchInvfrm.qryPurchInv.SQL.Text := qryPurchInv.Text;
          PBRPPurchInvfrm.qrlblTitle.caption := PBRPPurchInvfrm.qrlblTitle.caption + DateToStr(Date);
          PBRPPurchInvfrm.qrlblDateRange.caption :=
            PBRPPurchInvfrm.qrlblDateRange.caption + DateFromEdit.Text +
            ' to: ' + DateToEdit.Text;
          PBRPPurchInvfrm.qrlblDateRange.caption :=
            PBRPPurchInvfrm.qrlblDateRange.caption + ' Ordered by: ' +
            cbSort1.Text;
          if (cbSort2.Text <>'') then
          begin
            PBRPPurchInvfrm.qrlblDateRange.caption :=
              PBRPPurchInvfrm.qrlblDateRange.caption + ' then by: ' +
              cbSort2.Text;
          end;
          if bPreview then
            PBRPPurchInvfrm.qckrpPurchInv.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPPurchInvfrm.qckrpPurchInv.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     PBRPPurchInvfrm.free;
     qryPurchInv.Open;
  end;

end;

function TPBRSPurchInvFrm.BuildQueryString(rep: Boolean): string;
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
  if chkbxbyInvoice.checked then
    begin
      sTemp := SQLSICore;
      sTemp := sTemp + ' WHERE Sales_Invoice.Invoice_Date >= ' + qDate(DateFrom);
      sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(DateTo);
      sTemp := sTemp + ' AND Sales_Invoice.Invoice_or_Credit = ''I'' ';
    end
  else
    begin
      sTemp := SQLCore;
      sTemp := sTemp + ' WHERE Purchase_order.Purch_ord_head_Status >= 10 ';
      sTemp := sTemp + ' AND Purchase_order.Date_point >= ' + qDate(DateFrom);
      sTemp := sTemp + ' AND Purchase_order.Date_point <= ' + qDate(DateTo);
      sTemp := sTemp + ' AND ((Sales_Invoice_Line.Goods_Value >= 0) OR (Sales_Invoice_Line.Goods_Value Is Null))';
    end;

  if (edtSupplier.Text <> '') then
  begin
    sTemp := sTemp + ' AND Purchase_Order.Supplier = ' + IntToStr(SelSuppCode);
    sTemp := sTemp + ' AND Purchase_Order.Branch_No = ' + IntToStr(SelSuppBranch);
  end;
  if chkbxUnmatchedOnly.checked then
    begin
      sTemp := sTemp + ' AND ((Purchase_OrderLine.Quantity - (Purchase_OrderLine.Qty_Supp_Inv '
                     + '       + Purchase_OrderLine.Qty_Supp_Inv_Pend)) > 0)';
    end;
  if chkbxInvoiced.checked then
    begin
      stemp := sTemp + ' AND ((Purchase_orderLine.purch_ord_line_status >= 25)) ';
    end;

  if chkbxExcludeZero.checked then
    begin
      stemp := sTemp + ' AND ((Purchase_orderLine.order_price > 0)) ';
    end;
  if (Rep) and (totByRadioGroup.ItemIndex >= 0 )then
    begin
    IF TotByRadioGroup.ItemIndex = 0 then
      sTemp := sTemp + ' ORDER BY Supplier.Name, '
    else
      sTemp := sTemp + ' ORDER BY Rep.Name, ';

    if (((cbSort1.ItemIndex >= 0) and ((cbSort1.ItemIndex <> 2) or (TotByRadioGroup.ItemIndex = 1))) or
        ((cbSort2.ItemIndex >= 0) and ((cbSort2.ItemIndex <> 2) or (TotByRadioGroup.ItemIndex = 1)))) then
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
      sTemp := sTemp + ' ORDER BY ' + Ordering(cbSort1) + Ordering(cbSort2);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end;
    end;
    Result := sTemp;
end;

procedure TPBRSPurchInvFrm.FixQuery(rep: Boolean);
begin
  qryPurchInv.DisableControls;
  try
    qryPurchInv.Close;
    qryPurchInv.SQL.Clear;
    qryPurchInv.SQL.text := BuildQueryString(rep);
    qryPurchInv.Open;
    lblRecordCount.Caption:=IntToStr(qryPurchInv.RecordCount);
  finally
    qryPurchInv.EnableControls;
  end;
end;

function TPBRSPurchInvFrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' Purchase_OrderLine.Purchase_Order,';
  1:   Result := ' Purchase_Order.Date_Point,';
  2:   Result := ' Sales_Invoice_Line.Sales_invoice,';
  3:   Result := ' Supplier.Name,';
  else Result := '';
  end;
end;

procedure TPBRSPurchInvFrm.cbSortChange(Sender: TObject);
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

procedure TPBRSPurchInvFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSPurchInvFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSPurchInvFrm.DateToEditChange(Sender: TObject);
begin
//  FixQuery(False);
end;

procedure TPBRSPurchInvFrm.DateFromEditChange(Sender: TObject);
begin
//  FixQuery(False);
end;

procedure TPBRSPurchInvFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  FixQuery(False);
end;

procedure TPBRSPurchInvFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
  FixQuery(False);
end;

function TPBRSPurchInvFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSPurchInvFrm.DateFromEditExit(Sender: TObject);
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

procedure TPBRSPurchInvFrm.DateToEditExit(Sender: TObject);
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

procedure TPBRSPurchInvFrm.OldqryPurchInvPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPurchInvPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryPurchInvPurchase_Order.Asfloat,qryPurchInvLine.AsInteger);
end;

procedure TPBRSPurchInvFrm.OldqryPurchInvTotal_sellGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  rTotal: real;
begin
  if qryPurchInvPrice_unit_Factor.asinteger = 0 then
    text := formatfloat('0.00',qryPurchInvSell_Price.asfloat)
  else
    begin
    rTotal := (qryPurchInvSales_qty.asinteger / qryPurchInvPrice_unit_Factor.asinteger)*
              qryPurchInvSell_Price.asfloat;
    text := formatfloat('0.00',rTotal);
    end;
end;

procedure TPBRSPurchInvFrm.OldqryPurchInvTotal_PurchGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  rTotal: real;
begin
  if qryPurchInvCost_unit_Factor.asinteger = 0 then
    text := formatfloat('0.00',qryPurchInvPurchase_Price.asfloat)
  else
    begin
    rTotal := (qryPurchInvPurchase_qty.asinteger / qryPurchInvCost_unit_Factor.asinteger)*
              qryPurchInvPurchase_Price.asfloat;
    text := formatfloat('0.00',rTotal);
    end;
end;

procedure TPBRSPurchInvFrm.qryPurchInvTotal_sellGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  rTotal: real;
begin
  if qryPurchInvSales_Invoice_No.isnull then
  begin
    if qryPurchInvPrice_unit_Factor.asinteger = 0 then
      text := formatfloat('0.00',qryPurchInvSell_Price.asfloat)
    else
    begin
      rTotal := (qryPurchInvSales_qty.asinteger / qryPurchInvPrice_unit_Factor.asinteger)*
              qryPurchInvSell_Price.asfloat;
      text := formatfloat('0.00',rTotal);
    end;
  end
  else
  begin
  if qryPurchInvSI_Cost_unit_Factor.asinteger = 0 then
      text := formatfloat('0.00',qryPurchInvSI_Goods_Val.asfloat)
    else
      begin
         rTotal := (qryPurchInvSI_Qty_Invoiced.asinteger / qryPurchInvSI_Cost_unit_Factor.asinteger)*
              qryPurchInvSI_Goods_Val.asfloat;
      text := formatfloat('0.00',rTotal);
      end;
  end
end;

procedure TPBRSPurchInvFrm.qryPurchInvPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPurchInvPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryPurchInvPurchase_Order.Asfloat,qryPurchInvLine.AsInteger);
end;

procedure TPBRSPurchInvFrm.qryPurchInvTotal_PurchGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  rTotal: real;
begin
  if qryPurchInvSupplier_Invoice_No.isNull then
  begin
    if qryPurchInvCost_unit_Factor.asinteger = 0 then
      text := formatfloat('0.00',qryPurchInvPurchase_Price.asfloat)
    else
      begin
         rTotal := (qryPurchInvSales_qty.asinteger / qryPurchInvCost_unit_Factor.asinteger)*
              qryPurchInvPurchase_Price.asfloat;
      text := formatfloat('0.00',rTotal);
      end;
  end
else
  begin
   if qryPurchInvSP_Cost_unit_Factor.asinteger = 0 then
      text := formatfloat('0.00',qryPurchInvSP_Goods_Val.asfloat)
    else
      begin
         rTotal := (qryPurchInvSP_Qty_Invoiced.asinteger / qryPurchInvSP_Cost_unit_Factor.asinteger)*
              qryPurchInvSP_Goods_Val.asfloat;
      text := formatfloat('0.00',rTotal);
      end;
  end
end;

procedure TPBRSPurchInvFrm.btbtnExcelClick(Sender: TObject);
var
  PBRPPurchInvFrm: TPBRPPurchInvFrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
begin
  qryPurchInv.Close;
  fixquery(True);
  {add total order by clause to report query}

  PBRPPurchInvfrm := TPBRPPurchInvfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      {this part copies the query and values from the report selection form to the report print form}
      PBRPPurchInvfrm.qryPurchInv.SQL.Clear;
      if TotByRadioGroup. itemIndex >= 0 then
        begin
          if TotByRadioGroup.ItemIndex = 0 then
            PBRPPurchInvfrm.TotalBySupp := True
          else
            PBRPPurchInvfrm.TotalByRep := True;
        end;
      PBRPPurchInvfrm.qryPurchInv.SQL.Text := qryPurchInv.Text;
      PBRPPurchInvfrm.qrlblTitle.caption := PBRPPurchInvfrm.qrlblTitle.caption + DateToStr(Date);
      PBRPPurchInvfrm.qrlblDateRange.caption :=
        PBRPPurchInvfrm.qrlblDateRange.caption + DateFromEdit.Text +
            ' to: ' + DateToEdit.Text;
      PBRPPurchInvfrm.qrlblDateRange.caption :=
        PBRPPurchInvfrm.qrlblDateRange.caption + ' Ordered by: ' +
            cbSort1.Text;
      if (cbSort2.Text <>'') then
        begin
          PBRPPurchInvfrm.qrlblDateRange.caption :=
            PBRPPurchInvfrm.qrlblDateRange.caption + ' then by: ' +
              cbSort2.Text;
        end;

//      tempFileName := getWinTempDir+'temp.csv';
      tempFileName := getWinTempDir + formatdatetime('yymmddhhmmss',now)+'.csv';
      self.pnlExportPrgrss.Visible := true;
      self.pnlExportPrgrss.Repaint;

      PBRPPurchInvfrm.ExportToFile(tempFileName);
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
    PBRPPurchInvfrm.Free;
    qryPurchInv.Open;
  end;

end;

procedure TPBRSPurchInvFrm.chkbxbyInvoiceClick(Sender: TObject);
begin
  if (sender as TCheckbox).checked then
    begin
      lblDatefrom.Caption := 'From Invoice Date:';
      lblDateTo.caption := 'To Invoice Date:'
    end
  else
    begin
      lblDatefrom.Caption := 'From Order Date:';
      lblDateTo.caption := 'To Order Date:'
    end;
  FixQuery(false);
end;

end.
