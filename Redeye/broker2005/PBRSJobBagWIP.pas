unit PBRSJobBagWIP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, Grids, DBGrids, PBPOObjects, CCSCommon,
  ComCtrls, OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSJobBagWIPfrm = class(TForm)
    qryReport: TFDQuery;
    dsReport: TDataSource;
    qryReportPurchase_Order: TFloatField;
    qryReportLine: TIntegerField;
    qryReportCust_Order_No: TWideStringField;
    qryReportGoods_Required: TDateTimeField;
    qryReportPurch_Ord_Line_Status: TIntegerField;
    qryReportProof_Required: TWideStringField;
    qryReportCustomers_Desc: TWideStringField;
    qryReportDate_Point: TDateTimeField;
    qryReportForm_Reference_ID: TWideStringField;
    qryReportName: TWideStringField;
    qryReportAccount_code: TWideStringField;
    qryReportPOLine: TWideStringField;
    pnlControl: TPanel;
    pnlDetail: TPanel;
    DBGrid: TDBGrid;
    pnlSelections: TPanel;
    rgSupplier: TRadioGroup;
    rgCustomer: TRadioGroup;
    SupplierPanel: TPanel;
    lblSupplier: TLabel;
    edtSupplier: TEdit;
    btnSupplier: TButton;
    CustomerPanel: TPanel;
    lblCustomer: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    cbSort1: TComboBox;
    Label3: TLabel;
    cbSort2: TComboBox;
    Label4: TLabel;
    cbSort3: TComboBox;
    Label5: TLabel;
    pnlRightControl: TPanel;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    qryReportDelivery_no: TIntegerField;
    qryReportDelivery_Date: TDateTimeField;
    qryReportDate_Deliv_Actual: TDateTimeField;
    pnlDates: TPanel;
    chkbxPageBreak: TCheckBox;
    qryReportOn_Hold: TWideStringField;
    qryReportQuantity: TFloatField;
    qryReportRep_Name: TWideStringField;
    qryReportRep: TIntegerField;
    qryReportQty_to_Deliver: TFloatField;
    qryReportQty_Delivered: TFloatField;
    qryReportSelling_Price: TCurrencyField;
    qryReportPrice_Unit_Factor: TFloatField;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    Label2: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    TotByRadioGroup: TRadioGroup;
    CancelBitBtn: TBitBtn;
    chkbxBranches: TCheckBox;
    ExcOnHoldCheckBox: TCheckBox;
    chkbxShowSales: TCheckBox;
    chkbxShowCosts: TCheckBox;
    btnExcel: TBitBtn;
    qryExcel: TFDQuery;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    chkbxincludezero: TCheckBox;
    procedure rgSupplierClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure qryReportPOLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure TotByRadioGroupClick(Sender: TObject);
    procedure chkbxIncludeJBClick(Sender: TObject);
    procedure chkbxShowSalesClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure ExcOnHoldCheckBoxClick(Sender: TObject);
  private
    FActivated : Boolean;
    DateFrom, DateTo : TDateTime;
    SelSuppCode, SelCustCode: integer;
    SelSuppBranch, SelCustBranch: integer;
    SelSuppText, SelCustText: string;
    function BuildQueryString : string;
    function Ordering(aBox : TComboBox) : string;
    procedure CanPrint;
    procedure DispSelection;
    procedure FixQuery;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview : Boolean);
    procedure SomethingChanged;
  public
    { Public declarations }
  end;

var
  PBRSJobBagWIPfrm: TPBRSJobBagWIPfrm;

implementation

uses UITypes, 
  DateSelV5, PBLUCust, PBLUSupp, CCSPrint, Printers, PBDatabase,
  PBRPJobBagWIP;

{$R *.DFM}

const

(*  StartSQL =
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
	'Purch_ord_Line_Status.Description as Status_Description, '+
	'Operator.Name as Account_Manager, '+
  '(select top 1 Job_Bag '+
  ' from Job_Bag_Line_dets '+
  ' where Job_Bag_Line_dets.Purchase_Order = Purchase_OrderLine.Purchase_Order) as Job_Bag '+
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
*)

  StartSQL =
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
	'Purch_ord_Line_Status.Description as Status_Description, '+
	'Operator.Name as Account_Manager, '+
  '(select sum(Quotation_Price) '+
  ' from Purch_Ord_Line_Add_Chg '+
  ' where Purch_Ord_Line_Add_Chg.Purchase_Order = Purchase_OrderLine.Purchase_Order and '+
  '       Purch_Ord_Line_Add_Chg.Line = Purchase_OrderLine.Line and '+
  '       Purch_Ord_Line_Add_Chg.Sales_Profit is NULL) as Extra_Sales, '+
  '(select sum(Amount) '+
  ' from Purch_Ord_Line_Add_Chg '+
  ' where Purch_Ord_Line_Add_Chg.Purchase_Order = Purchase_OrderLine.Purchase_Order and '+
  '       Purch_Ord_Line_Add_Chg.Line = Purchase_OrderLine.Line and '+
  '       Purch_Ord_Line_Add_Chg.Sales_Profit is NULL) as Extra_Costs, '+
  '(select top 1 Job_Bag '+
  ' from Job_Bag_Line_dets '+
  ' where Job_Bag_Line_dets.Purchase_Order = Purchase_OrderLine.Purchase_Order) as Job_Bag '+
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

procedure TPBRSJobBagWIPfrm.rgSupplierClick(Sender: TObject);
begin
  SupplierPanel.Visible := rgSupplier.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TPBRSJobBagWIPfrm.Canprint;
begin
  {Check if can print}
  PrintBitBtn.Enabled := (qryReport.RecordCount > 0) and
    (
    ((rgSupplier.ItemIndex = 0) and (rgCustomer.ItemIndex = 0)) or
    ((rgSupplier.ItemIndex = 1) and (edtSupplier.Text <> '')) or
    ((rgCustomer.ItemIndex = 1) and (edtCustomer.Text <> ''))
    );
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
end;

procedure TPBRSJobBagWIPfrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  SomethingChanged;
end;

procedure TPBRSJobBagWIPfrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
  SomethingChanged;
end;

procedure TPBRSJobBagWIPfrm.DispSelection;
begin
  {Display selection}
  if SelSuppCode <> 0 then
    edtSupplier.Text := SelSuppText
  else
    edtSupplier.Text := '';
  if SelCustCode <> 0 then
    edtCustomer.Text := SelCustText
  else
    edtCustomer.Text := '';
end;

function TPBRSJobBagWIPfrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSJobBagWIPfrm.btnCustomerClick(Sender: TObject);
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
      SomethingChanged;
    end;
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TPBRSJobBagWIPfrm.btnSupplierClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.SelCode := SelSuppCode;
    PBLUSuppFrm.SelBranch := SelSuppBranch;
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      SelSuppCode := PBLUSuppFrm.SelCode;
      SelSuppBranch := PBLUSuppFrm.SelBranch;
      SelSuppText := PBLUSuppFrm.SelName + ' / ' + PBLUSuppFrm.SelBranchName;
      SomethingChanged;
    end;
  finally
    PBLUSuppFrm.Free;
  end;
end;

procedure TPBRSJobBagWIPfrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    rgSupplier.itemindex := 0;
    rgCustomer.ItemIndex := 0;
    rgSupplierClick(nil);
    rgCustomerClick(nil);
    cbSort1.ItemIndex := 0;
    cbSort2.ItemIndex := 1;
    cbSort3.ItemIndex := 2;
    SomethingChanged;
    FActivated := true;
  end;
end;

procedure TPBRSJobBagWIPfrm.rgCustomerClick(Sender: TObject);
begin
  CustomerPanel.Visible := rgCustomer.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TPBRSJobBagWIPfrm.qryReportPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReportPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryReportPurchase_Order.Asfloat,qryReportLine.AsInteger);
end;

function TPBRSJobBagWIPfrm.BuildQueryString: string;
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
  Result := StartSQL;

  if not chkbxIncludezero.checked then
    Result := Result + ' AND (not((Delivery_Detail.Date_deliv_actual is not null) AND ' +
                '  (Purchase_orderline.Selling_Price = 0.00)))';

  if DateFromEdit.Text <> '' then
    Result := Result + ' AND Delivery_detail.Date_Point >= ' + qDate(DateFrom);
  if DateToEdit.Text <> '' then
    Result := Result + ' AND Delivery_Detail.Date_Point <= ' + qDate(DateTo);

  if (rgSupplier.ItemIndex = 1) and (SelSuppCode <> 0) then
  begin
    Result := Result + ' AND Supplier_Branch.Supplier = ' +
      IntToStr(SelSuppCode) + ' AND Supplier_Branch.Branch_No = ' +
      IntToStr(SelSuppBranch);
  end;
  if (rgCustomer.ItemIndex = 1) and (SelCustCode <> 0) then
  begin
    Result := Result + ' AND Customer_Branch.Customer = ' + IntToStr(SelCustCode);
    if not chkbxBranches.checked then
      Result := Result + ' AND Customer_Branch.Branch_No = ' + IntToStr(SelCustBranch);
  end;
  if ExcOnHoldCheckBox.checked then
    Result := Result + ' AND ((Purchase_OrderLine.On_Hold <> ''Y'') or (Purchase_OrderLine.On_Hold is null)) ';

  Result := Result + ' AND (select top 1 Job_Bag ';
  Result := Result + ' from Job_Bag_Line_dets ';
  Result := Result + ' where Job_Bag_Line_dets.Purchase_Order = Purchase_OrderLine.Purchase_Order) <> NULL ';

  if (totByRadioGroup.ItemIndex >= 0 ) and (totByRadioGroup.ItemIndex < 4)then
    begin
      if TotByRadioGroup.ItemIndex = 0 then
        sTemp := sTemp + ' ORDER BY Customer.Name,'
      else
      if TotByRadioGroup.ItemIndex = 1 then
        sTemp := sTemp + ' ORDER BY Supplier_Branch.Account_Code,'
      else
      if TotByRadioGroup.ItemIndex = 2 then
        sTemp := sTemp + ' ORDER BY Rep.Name,'
      else
      if TotByRadioGroup.ItemIndex = 3 then
        sTemp := sTemp + ' ORDER BY Operator.Name,';

      sTemp := sTemp + Ordering(cbSort1) + Ordering(cbSort2) +
            Ordering(cbSort3);
      if sTemp[Length(sTemp)] = ',' then
        sTemp[Length(sTemp)] := ' ';
    end
  else
    begin
      if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0)
      or (cbSort3.ItemIndex >= 0) then
        begin
          sTemp := ' ORDER BY ' + Ordering(cbSort1) + Ordering(cbSort2) +
            Ordering(cbSort3);
          if sTemp[Length(sTemp)] = ',' then
            sTemp[Length(sTemp)] := ' ';
        end
      else
        sTemp := '';
    end;
  Result := Result + sTemp;
end;

procedure TPBRSJobBagWIPfrm.FixQuery;
begin
  qryReport.DisableControls;
  try
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.Text := BuildQueryString;
    qryReport.Open;
  finally
    qryReport.EnableControls;
  end;
end;

procedure TPBRSJobBagWIPfrm.SomethingChanged;
begin
  FixQuery;
  DispSelection;
  CanPrint;
end;

procedure TPBRSJobBagWIPfrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSJobBagWIPfrm.CallReport(const bPreview: Boolean);
var
  PBRPJobBagWIPfrm: TPBRPJobBagWIPfrm;
  PrinterSettings: TPrinterSettings;
begin
  qryReport.Close;
  PBRPJobBagWIPfrm := TPBRPJobBagWIPfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
//          PBRPJobBagWIPfrm.PrinterSettings := PrinterSettings;
          PBRPJobBagWIPfrm.qryReport.SQL.Clear;
          PBRPJobBagWIPfrm.HoldQRLabel.Caption := 'ON HOLD';
          if TotByRadioGroup.itemIndex >= 0 then
            begin
            if TotByRadioGroup.ItemIndex = 0 then
              PBRPJobBagWIPfrm.TotalByCust := True
            else
            if TotByRadioGroup.ItemIndex = 1 then
              PBRPJobBagWIPfrm.TotalBySupp := True
            else
            if TotByRadioGroup.ItemIndex = 2 then
              PBRPJobBagWIPfrm.TotalByRep := True
            else
            if TotByRadioGroup.ItemIndex = 3 then
              PBRPJobBagWIPfrm.TotalByAccMgr := True
            else
              begin
                PBRPJobBagWIPfrm.TotalByCust := False;
                PBRPJobBagWIPfrm.TotalBySupp := False;
                PBRPJobBagWIPfrm.TotalByRep := False;
                PBRPJobBagWIPfrm.TotalByAccMgr := False;
              end;
            end;
(*          if chkPageBreak.checked then
              PBRPJobBagWIPfrm.BreakOnRep := true
          else
            PBRPJobBagWIPfrm.BreakOnRep := false;
*)
          PBRPJobBagWIPfrm.ShowSalesValue := not chkbxShowSales.checked;
          PBRPJobBagWIPfrm.ShowCostValue := not chkbxShowCosts.checked;
          PBRPJobBagWIPfrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
          PBRPJobBagWIPfrm.qryReport.SQL.Text := qryReport.SQL.Text;
          if ExcOnHoldCheckBox.Checked then
            begin
              PBRPJobBagWIPfrm.QRLabel1.caption := 'Work in Progress - Purchase Orders in Job Bags (excl on hold items)';
              PBRPJobBagWIPfrm.HoldQRLabel.Caption := '  ';
            end
          else
              PBRPJobBagWIPfrm.QRLabel1.Caption := 'Work in Progress - Purchase Orders in Job Bags (incl on hold items)';

          if bPreview then
            PBRPJobBagWIPfrm.QuickReport.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPJobBagWIPfrm.QuickReport.Print;
          PBRPJobBagWIPfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryReport.Open;
  end;
end;

procedure TPBRSJobBagWIPfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

function TPBRSJobBagWIPfrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:    begin
         if TotByRadioGroup.itemindex = 0 then
          Result := ''
         else
          Result := ' Customer.Name,'
        end;
  1:    begin
         if TotByRadioGroup.itemindex = 1 then
          Result := ''
         else
          Result := ' Supplier_Branch.Account_Code,';
        end;
  2:   Result := ' Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line,';
  3:   Result := ' Purchase_Order.Date_Point,';
  4:   Result := ' Purchase_OrderLine.Goods_Required,';
  5:    begin
         if TotByRadioGroup.itemindex = 2 then
          Result := ''
         else
          Result := ' Rep.Name,';
        end;
  6:  Result := ' Job_Bag, '
  else
    Result := '';
  end;
end;

procedure TPBRSJobBagWIPfrm.cbSortChange(Sender: TObject);
begin
  { Don't allow duplicate selections }
  if cbSort1.ItemIndex >= 0 then
  begin
    if cbSort3.ItemIndex = cbSort1.ItemIndex then
      cbSort3.ItemIndex := -1;
    if cbSort2.ItemIndex = cbSort1.ItemIndex then
      cbSort2.ItemIndex := -1;
    if cbSort3.ItemIndex = cbSort2.ItemIndex then
      cbSort3.ItemIndex := -1;      
  end
  else
  if cbSort2.ItemIndex >= 0 then
  begin
    if cbSort3.ItemIndex = cbSort2.ItemIndex then
      cbSort3.ItemIndex := -1;
  end;
  { Shuffle up any gaps }
  if (cbSort3.ItemIndex >= 0) and (cbSort2.ItemIndex < 0) then
  begin
    cbSort2.ItemIndex := cbSort3.ItemIndex;
    cbSort3.ItemIndex := -1;
  end;
  if (cbSort2.ItemIndex >= 0) and (cbSort1.ItemIndex < 0) then
  begin
    cbSort1.ItemIndex := cbSort2.ItemIndex;
    cbSort2.ItemIndex := -1;
  end;
  SomethingChanged;
end;

procedure TPBRSJobBagWIPfrm.DateFromEditExit(Sender: TObject);
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
  SomethingChanged;
end;

procedure TPBRSJobBagWIPfrm.DateToEditExit(Sender: TObject);
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
  SomethingChanged;
end;

procedure TPBRSJobBagWIPfrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.enabled := TotByRadioGroup.itemindex <> 4;
  if TotByRadioGroup.itemindex = 4 then
    chkbxPageBreak.checked := false;

  SomethingChanged;
end;

procedure TPBRSJobBagWIPfrm.chkbxIncludeJBClick(Sender: TObject);
begin
  somethingchanged;
end;

procedure TPBRSJobBagWIPfrm.chkbxShowSalesClick(Sender: TObject);
begin
  if (Sender as TCheckbox).checked then
    begin
      chkbxShowCosts.Checked := true;
      chkbxShowCosts.Enabled := false;
    end
  else
    chkbxShowCosts.Enabled := true;
end;

procedure TPBRSJobBagWIPfrm.btnExcelClick(Sender: TObject);
var
  tempFileName: string;
  PBRPJobBagWIPfrm: TPBRPJobBagWIPfrm;
begin
  PBRPJobBagWIPfrm := TPBRPJobBagWIPfrm.Create(Self);
  try
    PBRPJobBagWIPfrm.qryReport.SQL.Clear;
    PBRPJobBagWIPfrm.HoldQRLabel.Caption := 'On Hold';

    if TotByRadioGroup.itemIndex >= 0 then
      begin
        if TotByRadioGroup.ItemIndex = 0 then
          PBRPJobBagWIPfrm.TotalByCust := True
        else
        if TotByRadioGroup.ItemIndex = 1 then
          PBRPJobBagWIPfrm.TotalBySupp := True
        else
        if TotByRadioGroup.ItemIndex = 2 then
          PBRPJobBagWIPfrm.TotalByRep := True
        else
        if TotByRadioGroup.ItemIndex = 3 then
          PBRPJobBagWIPfrm.TotalByAccMgr := True
        else
          begin
            PBRPJobBagWIPfrm.TotalByCust := False;
            PBRPJobBagWIPfrm.TotalBySupp := False;
            PBRPJobBagWIPfrm.TotalByRep := False;
            PBRPJobBagWIPfrm.TotalByAccMgr := False;
          end;
      end;

    PBRPJobBagWIPfrm.ShowSalesValue := not chkbxShowSales.checked;
    PBRPJobBagWIPfrm.ShowCostValue := not chkbxShowCosts.checked;
    PBRPJobBagWIPfrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
    PBRPJobBagWIPfrm.qryReport.SQL.Text := qryReport.SQL.Text;

    if ExcOnHoldCheckBox.Checked then
      begin
        PBRPJobBagWIPfrm.QRLabel1.caption := PBRPJobBagWIPfrm.QRLabel1.caption + '(excl on hold items)';
        PBRPJobBagWIPfrm.HoldQRLabel.Caption := '  ';
      end
    else
      PBRPJobBagWIPfrm.QRLabel1.Caption := PBRPJobBagWIPfrm.QRLabel1.caption + '(incl on hold items)';

    self.prgbrExport.Max := qryReport.RecordCount;
    tempFileName := getWinTempDir+'temp.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    PBRPJobBagWIPfrm.ExportToFile(tempFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tempFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    PBRPJobBagWIPfrm.free;
  end;
end;

procedure TPBRSJobBagWIPfrm.ExcOnHoldCheckBoxClick(Sender: TObject);
begin
  somethingchanged;
end;

end.
