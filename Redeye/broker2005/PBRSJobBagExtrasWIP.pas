unit PBRSJobBagExtrasWIP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, Grids, DBGrids, PBPOObjects, CCSCommon,
  ComCtrls, OleCtnrs, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSJobBagExtrasWIPfrm = class(TForm)
    qryReport: TFDQuery;
    dsReport: TDataSource;
    pnlControl: TPanel;
    pnlDetail: TPanel;
    DBGrid: TDBGrid;
    pnlSelections: TPanel;
    rgCustomer: TRadioGroup;
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
    pnlDates: TPanel;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    Label2: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    TotByRadioGroup: TRadioGroup;
    CancelBitBtn: TBitBtn;
    chkbxBranches: TCheckBox;
    rgRep: TRadioGroup;
    RepPanel: TPanel;
    lblRep: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    rdgrpRepType: TRadioGroup;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btnExcel: TBitBtn;
    qryRepName: TFDQuery;
    chkbxPageBreak: TCheckBox;
    chkbxShowAllLines: TCheckBox;
    chkbxShowSales: TCheckBox;
    chkbxExcludeOnHold: TCheckBox;
    chkbxComplete: TCheckBox;
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure TotByRadioGroupClick(Sender: TObject);
    procedure chkbxIncludeJBClick(Sender: TObject);
    procedure chkbxShowAllLinesClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure rgRepClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkbxReadyToInvoiceClick(Sender: TObject);
    procedure chkbxExcludeOnHoldClick(Sender: TObject);
    procedure chkbxCompleteClick(Sender: TObject);
  private
    FActivated : Boolean;
    DateFrom, DateTo : TDateTime;
    SelCustCode, SelRepCode: integer;
    SelCustBranch: integer;
    SelCustText, SelRepText: string;
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
  PBRSJobBagExtrasWIPfrm: TPBRSJobBagExtrasWIPfrm;

implementation

uses
  DateSelV5, PBLUCust, PBLUSupp, CCSPrint, Printers, PBDatabase, PBRPJobBagExtrasWIP,
  PBLURep, pbMainMenu;

{$R *.DFM}

const
  StartSQL1 =
  'SELECT '+
	'Job_Bag.Job_Bag, '+
	'Job_Bag.Job_Bag_Descr, '+
	'Job_Bag.Customer, '+
	'Job_Bag.Date_Point, '+
	'Job_Bag.Rep, '+
	'Job_Bag.Cust_Order_No, '+
	'Job_Bag.Goods_Required as Delivery_Date, '+
	'Job_Bag.Quantity as Job_Bag_Quantity, '+
	'Job_Bag.InActive, '+
	'Job_Bag.Office_Contact, '+
	'Job_Bag.Job_Bag_Status, '+
	'NULL as Job_Bag_Line, '+
	'NULL as Job_Bag_Line_Type, '+
	'NULL as Purchase_Order, '+
	'NULL as Line, '+
	'NULL as Supplier, '+
	'NULL as Branch_No, '+
	''''' as Job_Bag_Line_Descr, '+
	'0 as Job_Bag_Line_Cost, '+
	'0 as Job_Bag_Line_Sell, '+
	''''' as Job_Bag_Line_Invoiced, '+
	'0 as JB_Line_Quantity, '+
	'NULL as sales_order, '+
	'NULL as sales_order_line_no, '+
	'NULL as price_unit, '+
	'NULL as selling_price, '+
	'0 as Unit_Cost, '+
	'Operator.Name as Account_Manager, '+
	'Customer.Name as Customer_Name, '+
	'NULL as works_order, '+
	''''' as Supplier_Name, '+
	''''' as Account_Code, '+
	''''' as Price_Unit_Description, '+
	'0 as Price_Unit_Factor, '+
  'Rep.Name as Rep_Name, '+
	'0 as Qty_Invoiced, '+
	'0 as Quantity, '+
	'Job_Bag.On_Hold, '+
	''''' as Cash_Sale, '+
	''''' as Invoice_upfront, '+
  '0 AS Qty_Delivered, '+
	'Operator.Name as Account_Manager, '+
	'Job_Bag_Status.Job_Bag_Status_Descr, '+
	'Job_Bag.Ready_for_Invoicing '+
  'FROM Operator '+
	'RIGHT JOIN (Job_Bag_Status '+
	'INNER JOIN (Rep '+
	'INNER JOIN (Customer '+
	'INNER JOIN (Customer_Branch '+
	'INNER JOIN Job_Bag '+
	'	ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Customer_Branch.Customer = Job_Bag.Customer)) '+
	'	ON Customer.Customer = Customer_Branch.Customer) '+
	'	ON Rep.Rep = Job_Bag.Rep) '+
	'	ON Job_Bag_Status.Job_Bag_Status = Job_Bag.Job_Bag_Status) '+
	'	ON Operator.Operator = Job_Bag.Office_Contact '+
  'WHERE '+
	'(Job_Bag.Job_Bag_Status = 10) AND '+
	'((Job_Bag.Inactive is null) OR (Job_Bag.inactive <> ''Y'')) ';

  StartSQL =
  'SELECT 	Job_Bag.Job_Bag, '+
	'Job_Bag.Job_Bag_Descr, '+
	'Job_Bag.Customer, '+
	'Job_Bag.Date_Point, '+
	'Job_Bag.Rep, '+
	'Job_Bag.Cust_Order_No, '+
	'Job_Bag.Goods_Required as Delivery_Date, '+
	'Job_Bag.Quantity as Job_Bag_Quantity, '+
	'Job_Bag.InActive, '+
	'Job_Bag.Office_Contact, '+
	'Job_Bag.Job_Bag_Status, '+
	'Job_Bag_Line_Dets.Job_Bag_Line, '+
	'Job_Bag_Line_Dets.Job_Bag_Line_Type, '+
	'Job_Bag_Line_Dets.Purchase_Order, '+
	'Job_Bag_Line_Dets.Line, '+
	'Job_Bag_Line_Dets.Supplier, '+
	'Job_Bag_Line_Dets.Branch_No, '+
	'Job_Bag_Line_Dets.Job_Bag_Line_Descr, '+
	'Job_Bag_Line_Dets.Job_Bag_Line_Cost, '+
	'Job_Bag_Line_Dets.Job_Bag_Line_Sell, '+
	'Job_Bag_Line_Dets.Job_Bag_Line_Invoiced, '+
	'Job_Bag_Line_Dets.Job_Bag_Quantity as JB_Line_Quantity, '+
	'Job_Bag_Line_Dets.sales_order, '+
	'Job_Bag_Line_Dets.sales_order_line_no, '+
	'Job_Bag_Line_Dets.price_unit, '+
	'Job_Bag_Line_Dets.selling_price, '+
	'Job_Bag_Line_Dets.Unit_Cost, '+
	'Operator.Name as Account_Manager, '+
	'Customer.Name as Customer_Name,  '+
	'Job_Bag_Line_Dets.works_order, '+
	'(select Supplier.Name '+
	'from Supplier '+
	'where Supplier.supplier = Job_Bag_Line_Dets.Supplier) as Supplier_Name, '+
	'(select Account_Code '+
	'from Supplier_Branch '+
	'where Supplier_Branch.supplier = Job_Bag_Line_Dets.Supplier and  '+
	'	Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_no) as Account_Code, '+
	'Price_Unit.Description as Price_Unit_Description, '+
	'Price_Unit.Price_Unit_Factor, '+
  'Rep.Name as Rep_Name, '+
	'Purchase_OrderLine.Qty_Invoiced, '+
	'Purchase_OrderLine.Quantity, '+
	'Job_Bag.On_Hold, '+
	'Purchase_OrderLine.Cash_Sale, '+
	'Purchase_OrderLine.Invoice_upfront, '+
  'ISNULL((select Sum(Delivery_Detail.Qty_Delivered) '+
  'from delivery_detail '+
  'where Delivery_detail.Purchase_order = Purchase_Orderline.Purchase_order and '+
  '      Delivery_Detail.Qty_Delivered > 0 AND '+
	'((Delivery_to_stock <> ''Y'') OR '+
	' ((Delivery_to_stock = ''Y'') AND (Purchase_Orderline.Invoice_upfront = ''Y'')))),0) AS Qty_Delivered, '+
	'Operator.Name as Account_Manager, '+
	'Job_Bag_Status.Job_Bag_Status_Descr, '+
	'Job_Bag.Ready_for_Invoicing '+
  'FROM Rep '+
	'INNER JOIN (Job_Bag_Status '+
	'INNER JOIN (Operator '+
	'INNER JOIN (Price_Unit '+
	'RIGHT JOIN (Customer '+
	'INNER JOIN (Purchase_OrderLine '+
	'RIGHT JOIN ((Customer_Branch '+
	'INNER JOIN Job_Bag '+
	'	ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Customer_Branch.Customer = Job_Bag.Customer)) '+
	'INNER JOIN Job_Bag_Line_Dets '+
	'	ON Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) '+
	'	ON (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Purchase_Order)) '+
	'	ON Customer.Customer = Customer_Branch.Customer) '+
	'	ON Price_Unit.Price_Unit = Job_Bag_Line_Dets.price_unit) '+
	'	ON Operator.Operator = Job_Bag.Office_Contact) '+
	'	ON Job_Bag_Status.Job_Bag_Status = Job_Bag.Job_Bag_Status) '+
	'	ON Rep.Rep = Job_Bag.Rep '+
  'WHERE 	(Job_Bag.Job_Bag = Job_Bag_Line_dets.Job_Bag) AND '+
	'(Job_Bag.Job_Bag_Status <= 25) AND '+
	'((Job_Bag.Inactive is null) OR (Job_Bag.inactive = ''N'')) AND '+
	'((Job_Bag_line_Dets.Inactive is null) OR (Job_Bag_Line_Dets.inactive = ''N'')) AND '+
	'((Job_Bag_Line_dets.Job_Bag_Line_Invoiced = ''N'') or (Job_Bag_Line_dets.Job_Bag_Line_Invoiced = ''P'')) AND '+
  '((Purchase_OrderLine.Inactive <> ''Y'') OR '+
  '    (Purchase_OrderLine.Inactive Is Null)) AND '+
	'( '+
  '    ((Purchase_OrderLine.Purch_Ord_Line_Status >= 20) OR (Purchase_OrderLine.Purch_Ord_Line_Status IS NULL)) AND '+
  '    ((Purchase_OrderLine.Purch_Ord_Line_Status < 30) OR (Purchase_OrderLine.Purch_Ord_Line_Status IS NULL)) '+
	')';

procedure TPBRSJobBagExtrasWIPfrm.Canprint;
begin
  {Check if can print}
  PrintBitBtn.Enabled := (qryReport.RecordCount > 0) and
    (
    ((rgRep.ItemIndex = 0) and (rgCustomer.ItemIndex = 0)) or
    ((rgRep.ItemIndex = 1) and (edtRep.Text <> '')) or
    ((rgCustomer.ItemIndex = 1) and (edtCustomer.Text <> ''))
    );
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
end;

procedure TPBRSJobBagExtrasWIPfrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
  SomethingChanged;
end;

procedure TPBRSJobBagExtrasWIPfrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
  SomethingChanged;
end;

procedure TPBRSJobBagExtrasWIPfrm.DispSelection;
begin
  {Display selection}
  if SelRepCode <> 0 then
    edtRep.Text := SelRepText
  else
    edtRep.Text := '';
  if SelCustCode <> 0 then
    edtCustomer.Text := SelCustText
  else
    edtCustomer.Text := '';
end;

function TPBRSJobBagExtrasWIPfrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSJobBagExtrasWIPfrm.btnCustomerClick(Sender: TObject);
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

procedure TPBRSJobBagExtrasWIPfrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    rgCustomer.ItemIndex := 0;
    rgCustomerClick(nil);
    cbSort1.ItemIndex := 2;
    cbSort2.ItemIndex := -1;
    cbSort3.ItemIndex := -1;
    SomethingChanged;
    FActivated := true;
  end;
end;

procedure TPBRSJobBagExtrasWIPfrm.rgCustomerClick(Sender: TObject);
begin
  CustomerPanel.Visible := rgCustomer.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

function TPBRSJobBagExtrasWIPfrm.BuildQueryString: string;
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
  Result := StartSQL1;

  if DateFromEdit.Text <> '' then
    Result := Result + ' AND Job_Bag.Goods_Required >= ' + qDate(DateFrom);
  if DateToEdit.Text <> '' then
    Result := Result + ' AND Job_Bag.Goods_Required <= ' + qDate(DateTo);

// Show only Jobs Fully despatched
  if chkbxComplete.checked then
    Result := Result + ' AND (Job_Bag.Job_Bag_Production_Status = 3000)';

// Exclude On Hold jobs
  if chkbxExcludeOnHold.checked then
    Result := Result + ' AND ((Job_Bag.On_Hold = ''N'') or (Job_Bag.On_Hold = ''P'') or (Job_Bag.On_Hold is NULL))';

  if (rgRep.ItemIndex = 1) and (SelRepCode <> 0) then
  begin
    Result := Result + ' AND Job_Bag.Rep = ' + IntToStr(SelRepCode);
  end;
  if (rgCustomer.ItemIndex = 1) and (SelCustCode <> 0) then
  begin
    Result := Result + ' AND Customer_Branch.Customer = ' + IntToStr(SelCustCode);
    if not chkbxBranches.checked then
      Result := Result + ' AND Customer_Branch.Branch_No = ' + IntToStr(SelCustBranch);
  end;

  Result := Result + ' UNION ';

  Result := Result + StartSQL;

  if not chkbxShowAllLines.checked then
    Result := Result + ' AND ((Job_Bag_Line_Dets.Job_Bag_Line_Type = ''A'') or (Job_Bag_Line_Dets.Job_Bag_Line_Type is NULL))';

  if DateFromEdit.Text <> '' then
    Result := Result + ' AND Job_Bag.Goods_Required >= ' + qDate(DateFrom);
  if DateToEdit.Text <> '' then
    Result := Result + ' AND Job_Bag.Goods_Required <= ' + qDate(DateTo);

// Show only Jobs Fully despatched
  if chkbxComplete.checked then
    Result := Result + ' AND (Job_Bag.Job_Bag_Production_Status = 3000)';

// Exclude On Hold jobs
  if chkbxExcludeOnHold.checked then
    Result := Result + ' AND ((Job_Bag.On_Hold = ''N'') or (Job_Bag.On_Hold = ''P'') or (Job_Bag.On_Hold is NULL))';

(*  if not chkbxReadyToInvoice.checked then
    Result := Result + ' AND ((Job_Bag.Ready_for_Invoicing <> ''Y'') or (Job_Bag.Ready_for_Invoicing is NULL))';
*)

  if (rgRep.ItemIndex = 1) and (SelRepCode <> 0) then
  begin
    Result := Result + ' AND Job_Bag.Rep = ' + IntToStr(SelRepCode);
  end;
  if (rgCustomer.ItemIndex = 1) and (SelCustCode <> 0) then
  begin
    Result := Result + ' AND Customer_Branch.Customer = ' + IntToStr(SelCustCode);
    if not chkbxBranches.checked then
      Result := Result + ' AND Customer_Branch.Branch_No = ' + IntToStr(SelCustBranch);
  end;

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

procedure TPBRSJobBagExtrasWIPfrm.FixQuery;
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

procedure TPBRSJobBagExtrasWIPfrm.SomethingChanged;
begin
  FixQuery;
  DispSelection;
  CanPrint;
end;

procedure TPBRSJobBagExtrasWIPfrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSJobBagExtrasWIPfrm.CallReport(const bPreview: Boolean);
var
  PBRPJobBagExtrasWIPfrm: TPBRPJobBagExtrasWIPfrm;
  PrinterSettings: TPrinterSettings;
begin
  qryReport.Close;
  PBRPJobBagExtrasWIPfrm := TPBRPJobBagExtrasWIPfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
//          PBRPJobBagExtrasWIPfrm.PrinterSettings := PrinterSettings;
          PBRPJobBagExtrasWIPfrm.qryReport.SQL.Clear;
          if TotByRadioGroup.itemIndex >= 0 then
            begin
            if TotByRadioGroup.ItemIndex = 0 then
              PBRPJobBagExtrasWIPfrm.TotalByCust := True
            else
            if TotByRadioGroup.ItemIndex = 1 then
              PBRPJobBagExtrasWIPfrm.TotalBySupp := True
            else
            if TotByRadioGroup.ItemIndex = 2 then
              PBRPJobBagExtrasWIPfrm.TotalByRep := True
            else
            if TotByRadioGroup.ItemIndex = 3 then
              PBRPJobBagExtrasWIPfrm.TotalByAccMgr := True
            else
              begin
                PBRPJobBagExtrasWIPfrm.TotalByCust := False;
                PBRPJobBagExtrasWIPfrm.TotalBySupp := False;
                PBRPJobBagExtrasWIPfrm.TotalByRep := False;
                PBRPJobBagExtrasWIPfrm.TotalByAccMgr := False;
              end;
            end;
(*          if chkPageBreak.checked then
              PBRPJobBagExtrasWIPfrm.BreakOnRep := true
          else
            PBRPJobBagExtrasWIPfrm.BreakOnRep := false;
*)
          PBRPJobBagExtrasWIPfrm.ShowSalesValue := not chkbxShowSales.checked;
          PBRPJobBagExtrasWIPfrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
          PBRPJobBagExtrasWIPfrm.qryReport.SQL.Text := qryReport.SQL.Text;
          if (rdgrpRepType.itemindex = 0) then
            PBRPJobBagExtrasWIPfrm.qrlblTitle.Caption := 'Work in Progress Summary Report - Job Bag production charges'
          else
            PBRPJobBagExtrasWIPfrm.qrlblTitle.Caption := 'Work in Progress Detail Report - Job Bag production charges';

          PBRPJobBagExtrasWIPfrm.qrlblselection.caption := 'Report Selection: ';
          PBRPJobBagExtrasWIPfrm.qrlblInclude.caption := 'Including: ';

          if chkbxShowallLines.checked then
            PBRPJobBagExtrasWIPfrm.qrlblInclude.caption := PBRPJobBagExtrasWIPfrm.qrlblInclude.caption + ' All Job Bag Lines'
          else
            PBRPJobBagExtrasWIPfrm.qrlblInclude.caption := PBRPJobBagExtrasWIPfrm.qrlblInclude.caption + ' Only Production Charges';

          if Selcustcode = 0 then
            PBRPJobBagExtrasWIPfrm.qrlblselection.caption := PBRPJobBagExtrasWIPfrm.qrlblselection.caption + 'All Customers, '
          else
            PBRPJobBagExtrasWIPfrm.qrlblselection.caption := PBRPJobBagExtrasWIPfrm.qrlblselection.caption + edtCustomer.text + ', ';

          if Selrepcode = 0 then
            PBRPJobBagExtrasWIPfrm.qrlblselection.caption := PBRPJobBagExtrasWIPfrm.qrlblselection.caption + 'All Reps '
          else
            PBRPJobBagExtrasWIPfrm.qrlblselection.caption := PBRPJobBagExtrasWIPfrm.qrlblselection.caption + edtRep.text;

          PBRPJobBagExtrasWIPfrm.Summary := (rdgrpRepType.itemindex = 0);
          if bPreview then
            PBRPJobBagExtrasWIPfrm.QuickReport.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPJobBagExtrasWIPfrm.QuickReport.Print;
          PBRPJobBagExtrasWIPfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryReport.Open;
  end;
end;

procedure TPBRSJobBagExtrasWIPfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

function TPBRSJobBagExtrasWIPfrm.Ordering(aBox: TComboBox): string;
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
  2:   Result := ' Job_Bag.Job_Bag, Job_Bag_Line,';
  3:   Result := ' Job_Bag.Date_Point,';
  4:   Result := ' Job_Bag.Goods_Required,';
  5:    begin
         if TotByRadioGroup.itemindex = 2 then
          Result := ''
         else
          Result := ' Rep.Name,';
        end;
  6:   Result := ' Job_Bag_Status.Job_Bag_Status_Descr,';
  else
    Result := '';
  end;
end;

procedure TPBRSJobBagExtrasWIPfrm.cbSortChange(Sender: TObject);
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

procedure TPBRSJobBagExtrasWIPfrm.DateFromEditExit(Sender: TObject);
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

procedure TPBRSJobBagExtrasWIPfrm.DateToEditExit(Sender: TObject);
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

procedure TPBRSJobBagExtrasWIPfrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.enabled := TotByRadioGroup.itemindex <> 4;
  if TotByRadioGroup.itemindex = 4 then
    chkbxPageBreak.checked := false;

  SomethingChanged;
end;

procedure TPBRSJobBagExtrasWIPfrm.chkbxIncludeJBClick(Sender: TObject);
begin
  somethingchanged;
end;

procedure TPBRSJobBagExtrasWIPfrm.chkbxShowAllLinesClick(Sender: TObject);
begin
  somethingchanged;
end;

procedure TPBRSJobBagExtrasWIPfrm.btnRepClick(Sender: TObject);
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
    SomethingChanged;
  finally
    PBLURepFrm.Free;
  end;

end;

procedure TPBRSJobBagExtrasWIPfrm.rgRepClick(Sender: TObject);
begin
  RepPanel.Visible := rgRep.ItemIndex = 1;
  if Assigned(Sender) then
    SomethingChanged;
end;

procedure TPBRSJobBagExtrasWIPfrm.btnExcelClick(Sender: TObject);
var
  tempFileName: string;
  PBRPJobBagExtrasWIPfrm: TPBRPJobBagExtrasWIPfrm;
begin
//  qryReport.Close;
  PBRPJobBagExtrasWIPfrm := TPBRPJobBagExtrasWIPfrm.Create(Self);
  try
    PBRPJobBagExtrasWIPfrm.qryReport.SQL.Clear;
    if TotByRadioGroup.itemIndex >= 0 then
      begin
        if TotByRadioGroup.ItemIndex = 0 then
          PBRPJobBagExtrasWIPfrm.TotalByCust := True
        else
        if TotByRadioGroup.ItemIndex = 1 then
          PBRPJobBagExtrasWIPfrm.TotalBySupp := True
        else
        if TotByRadioGroup.ItemIndex = 2 then
          PBRPJobBagExtrasWIPfrm.TotalByRep := True
        else
        if TotByRadioGroup.ItemIndex = 3 then
          PBRPJobBagExtrasWIPfrm.TotalByAccMgr := True
        else
          begin
            PBRPJobBagExtrasWIPfrm.TotalByCust := False;
            PBRPJobBagExtrasWIPfrm.TotalBySupp := False;
            PBRPJobBagExtrasWIPfrm.TotalByRep := False;
            PBRPJobBagExtrasWIPfrm.TotalByAccMgr := False;
          end;
      end;

    PBRPJobBagExtrasWIPfrm.ShowSalesValue := not chkbxShowSales.checked;
    PBRPJobBagExtrasWIPfrm.qryReport.SQL.Text := qryReport.SQL.Text;
    if (rdgrpRepType.itemindex = 0) then
      PBRPJobBagExtrasWIPfrm.qrlblTitle.Caption := 'Work in Progress Summary Report - Job Bag production charges'
    else
      PBRPJobBagExtrasWIPfrm.qrlblTitle.Caption := 'Work in Progress Detail Report - Job Bag production charges';

    PBRPJobBagExtrasWIPfrm.qrlblselection.caption := 'Report Selection: ';
    PBRPJobBagExtrasWIPfrm.qrlblInclude.caption := 'Including: ';

    if chkbxShowallLines.checked then
      PBRPJobBagExtrasWIPfrm.qrlblInclude.caption := PBRPJobBagExtrasWIPfrm.qrlblInclude.caption + ' All Job Bag Lines'
    else
      PBRPJobBagExtrasWIPfrm.qrlblInclude.caption := PBRPJobBagExtrasWIPfrm.qrlblInclude.caption + ' Only Production Charges';

    if rgCustomer.itemindex = 0 then
      PBRPJobBagExtrasWIPfrm.qrlblselection.caption := PBRPJobBagExtrasWIPfrm.qrlblselection.caption + 'All Customers, '
    else
      PBRPJobBagExtrasWIPfrm.qrlblselection.caption := PBRPJobBagExtrasWIPfrm.qrlblselection.caption + edtCustomer.text + ', ';

    if rgRep.itemindex = 0 then
      PBRPJobBagExtrasWIPfrm.qrlblselection.caption := PBRPJobBagExtrasWIPfrm.qrlblselection.caption + 'All Reps '
    else
      PBRPJobBagExtrasWIPfrm.qrlblselection.caption := PBRPJobBagExtrasWIPfrm.qrlblselection.caption + edtRep.text;

    PBRPJobBagExtrasWIPfrm.Summary := (rdgrpRepType.itemindex = 0);

    self.prgbrExport.Max := qryReport.RecordCount;
    tempFileName := getWinTempDir+'temp.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    PBRPJobBagExtrasWIPfrm.ExportToFile(tempFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tempFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    PBRPJobBagExtrasWIPfrm.Free;
    Application.ProcessMessages;
//    qryReport.Open;
  end;
end;

procedure TPBRSJobBagExtrasWIPfrm.FormCreate(Sender: TObject);
begin
  If dmBroker.iAccCtrlMenu = 4 then
    begin
      btnRep.enabled := false;
      selRepCode := dmBroker.GetOperatorRep(frmPBMainMenu.iOperator);
      rgRep.ItemIndex := 1;
      rgRep.Enabled := false;
      with qryRepName do
      begin
        close;
        paramByName('Sel_rep').asInteger := selrepcode;
        open;
        if not eof then
          begin
            edtRep.Text := qryRepName.fieldByName('Name').asString;
            selreptext := edtRep.Text;
          end;
      end;
     end
  else
    begin
      rgRep.itemindex := 0;
      rgRepClick(nil);
      selRepCode := 0 ;
      btnRep.enabled := True;
    end;
end;

procedure TPBRSJobBagExtrasWIPfrm.chkbxReadyToInvoiceClick(
  Sender: TObject);
begin
  Somethingchanged;
end;

procedure TPBRSJobBagExtrasWIPfrm.chkbxExcludeOnHoldClick(Sender: TObject);
begin
  somethingChanged;
end;

procedure TPBRSJobBagExtrasWIPfrm.chkbxCompleteClick(Sender: TObject);
begin
  somethingChanged;
end;

end.
