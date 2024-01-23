unit pbOrdersDm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlOrders = class(TDataModule)
    qryOrders: TFDQuery;
    dtsOrders: TDataSource;
    qrySOrders: TFDQuery;
    qryPOrders: TFDQuery;
    qryperiodEnd: TFDQuery;
    qryOnHold: TFDQuery;
    qryCompany: TFDQuery;
    qrySOHead: TFDQuery;
    GetPickRefSQL: TFDQuery;
    qryInvoicePO: TFDQuery;
    qryInvoiceSO: TFDQuery;
    qryJBOrders: TFDQuery;
    qrySelectedPO: TFDQuery;
    dtsCallOffs: TDataSource;
    qryCallOffs: TFDQuery;
    qryCust: TFDQuery;
    qrySOHeaders: TFDQuery;
    qrySelectedSO: TFDQuery;
    qryOperator: TFDQuery;
    qrySOPicking: TFDQuery;
    qryGetSInvoice: TFDQuery;
    qryPOProofStatus: TFDQuery;
    qrySetSOInvoice: TFDQuery;
    qrySOLines: TFDQuery;
    qryOrdersCustomer: TIntegerField;
    qryOrdersName: TWideStringField;
    qryOrdersSales_order: TFloatField;
    qryOrdersLine: TIntegerField;
    qryOrdersOrder_date: TDateTimeField;
    qryOrdersCust_Order_No: TStringField;
    qryOrdersDescription: TStringField;
    qryOrdersQuantity: TFloatField;
    qryOrdersOrder_Price: TCurrencyField;
    qryOrdersOrder_unit: TFloatField;
    qryOrdersSelling_Price: TCurrencyField;
    qryOrdersSelling_unit: TFloatField;
    qryOrdersStock_Reference: TWideStringField;
    qryOrdersForm_Reference_ID: TWideStringField;
    qryOrdersGoods_Required: TDateTimeField;
    qryOrdersOrder_type: TStringField;
    qryOrdersOrder_Status: TIntegerField;
    qryOrdersStatus_Description: TWideStringField;
    qryOrdersBranch_Name: TWideStringField;
    qryOrdersOn_Hold: TWideStringField;
    qryOrdersProof_Revision: TWideStringField;
    qryOrdersSupplier: TIntegerField;
    qryOrdersSupplier_Name: TWideStringField;
    qryOrdersjob_bag: TIntegerField;
    qryOrdersDescription_Reference: TWideStringField;
    qryOrdersRep: TIntegerField;
    qryOrdersRep_Name: TWideStringField;
    qryOrdersOperator: TIntegerField;
    qryOrdersOperator_Name: TWideStringField;
    qryOrdersOriginal_order: TFloatField;
    qryOrdersInactive: TWideStringField;
    qryOrdersSupp_Inv_Recd: TWideStringField;
    qryOrdersNeeds_Authorising: TWideStringField;
    qryOrdersOrder_Number: TFloatField;
    qryOrdersAuthorised_By: TIntegerField;
    qryOrdersNCA_Live_lines: TIntegerField;
    qryOrdersNCA_Signed_Off: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryOrdersStatus_textGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryCallOffsStatus_TextGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryOrdersSales_orderGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryOrdersStatus_DescriptionGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    function GetHeaderCount: integer;
    function GetCalloffHeaderCount: integer;
  public
    AccountMgr: string;
    AltPurchaseOrder: string;
    BranchName: string;
    Branch: integer;
    Customer: integer;
    CustomerName: string;
    CustomerRef: string;
    Description: string;
    DescriptiveRef: string;
    ExistingOrders: string;
    FormReference: string;
    JobNumber: string;
    Operator: integer;
    OperatorName: string;
    OrdQtyDesc: string;
    OrderDate: TDateTime;
    PONumber: string;
    ProductCode: string;
    Rep: integer;
    RepName: string;
    RepIsSubRep: boolean;
    SupplierName: string;
    Status: string;
    ShowInvoiced: boolean;
    StockinUse: boolean;
    NotinJobBag: boolean;
    ShowInactive: boolean;
    ShowWIP: boolean;
    ShowOnlyUnAuthorised: boolean;
    ShowOrderLines: boolean;
    function GetPickingRef(TempSO: integer): string;
    function GetSoPartStore(tempCode: integer): integer;
    function GetSOType(tempCode: integer): string;
    function GetSoReplenSource(tempCode: integer): integer;
    function GetSOInvoiceStatus(tempCode: integer): string;
    function PeriodEndRun(TempType: string; TempPO: real; TempLine: integer): boolean;
    function ProofApproved(tempCode: real; tempLine: integer): boolean;
    function IsCustomerOnStop(iTempCode: integer): boolean;
    function IsNewPicking(tempCode: integer): boolean;
    function IsPOAuthorised(tempCode: real): boolean;
    function UsingSearch: boolean;
    procedure RefreshData;
    procedure RefreshJBData;
    procedure RefreshPOData;
    procedure RefreshSOData;
    function SetSOInvoiceStatus(tempCode: integer): string;
    function SOInvoiced(SOrder: integer): boolean;
    property HeaderCount: integer read GetHeaderCount;
    property CalloffHeaderCount: integer read GetCalloffHeaderCount;
  end;

var
  dtmdlOrders: TdtmdlOrders;

implementation

uses pbDatabase;

{$R *.DFM}

function TdtmdlOrders.GetHeaderCount: integer;
begin
  Result := qryOrders.RecordCount;
end;

procedure TdtmdlOrders.qryCallOffsStatus_TextGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if  (dtsCallOffs.Dataset.fieldbyname('Order_status').asinteger = 250) then
    begin
      qryInvoiceSO.close;
      qryInvoiceSO.parambyname('Sales_Order').asinteger := dtsCallOffs.Dataset.fieldbyname('Sales_Order').asinteger;
      qryInvoiceSO.open;

      if qryInvoiceSO.recordcount > 0 then
        if (qryInvoiceSO.FieldByName('Sales_invoice_no').asstring <> '') then
          begin
            text := qryInvoiceSO.fieldbyname('Sales_invoice_no').asstring;
            exit;
          end;
      text := dtsCallOffs.Dataset.fieldbyname('Status_description').asstring;
    end
  else
    text := dtsCallOffs.Dataset.fieldbyname('Status_description').asstring;
end;

procedure TdtmdlOrders.RefreshData;
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
  qryOrders.close;
  qryOrders.SQL.Clear;

  if stockinUse then
    begin
      {Add the Sales Order query details}
      sTemp := '';
      qryOrders.SQL := qrySOrders.SQL;

      if CustomerName <> '' then
        sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                       + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';
      if BranchName <> '' then
        sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
      if ProductCode <> '' then
        sTemp := sTemp + ' AND (Part.Part LIKE ''' + ProductCode + '%'')';
      if SupplierName <> '' then
        sTemp := sTemp + ' AND ((select Supplier.Name'
                       + ' from Supplier'
                       + ' where Sales_order.Supplier = Supplier.Supplier)'
                       + ' LIKE ''%' + SupplierName + '%'')';
      if FormReference <> '' then
        sTemp := sTemp + ' AND ((select top 1 form_Reference.Form_Reference_ID'
                       + ' from Form_Reference'
                       + ' where Form_Reference.stock_reference = sales_order_line.part)'
                       + '  LIKE ''%' + FormReference + '%'')';
      if CustomerRef <> '' then
        sTemp := sTemp + ' AND (Sales_order.Cust_Order_no LIKE ''%' + CustomerRef + '%'')';
      if OrdQtyDesc <> '' then
        sTemp := sTemp + ' AND (sales_order_line.quantity_ordered = ' + OrdQtyDesc + ')';
      if JobNumber <> '' then
        sTemp := sTemp + ' AND (0 = ' + JobNumber + ')';
      if DescriptiveRef <> '' then
        sTemp := sTemp + ' AND (Part.Part_Description LIKE ''%' + DescriptiveRef + '%'')';
      if Rep <> 0 then
        sTemp := sTemp + ' AND (Sales_OrderRep.Rep = ' + inttostr(Rep) + ')';
      if Operator <> 0 then
        sTemp := sTemp + ' AND (Sales_OrderRep.Operator = ' + inttostr(Operator) + ')';

      sTemp := sTemp + ' AND Sales_Order.Date_Ordered >= ' + qDate(OrderDate);
      qryOrders.SQL.text := qryOrders.SQL.text + sTemp;
      qryOrders.SQL.text := qryOrders.SQL.text + 'UNION ALL ';
    end;
  {Add the Purchase Order query details}
  sTemp := '';
  qryOrders.SQL.text := qryOrders.SQL.text + qryPOrders.SQL.text;
  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if SupplierName <> '' then
    sTemp := sTemp + ' AND (Supplier.Name LIKE ''%' + SupplierName + '%'')';
  if ProductCode <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Stock_Reference LIKE ''' + ProductCode + '%'')';
  if FormReference <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Form_Reference_ID LIKE ''%' + FormReference + '%'')';
  if CustomerRef <> '' then
    sTemp := sTemp + ' AND (Purchase_OrderLine.Cust_Order_no LIKE ''' + CustomerRef + '%'')';
  if OrdQtyDesc <> '' then
    sTemp := sTemp + ' AND (Purchase_OrderLine.Quantity = ' + OrdQtyDesc + ')';
  if DescriptiveRef <> '' then
    sTemp := sTemp + ' AND (Purchase_OrderLine.Description_Reference LIKE ''%' + DescriptiveRef + '%'')';
  if JobNumber <> '' then
    sTemp := sTemp + ' AND (job_bag_line_dets.job_bag = ' + JobNumber + ')';
  if ShowInactive then
    sTemp := sTemp + ' AND ((Purchase_OrderLine.inactive is NULL) OR (Purchase_OrderLine.inactive = ''N'') '
                    + ' OR (Purchase_OrderLine.inactive = ''Y''))'
  else
    sTemp := sTemp + ' AND ((Purchase_OrderLine.inactive is NULL) OR (Purchase_OrderLine.inactive = ''N''))';
  if ShowWIP then
    sTemp := sTemp + ' AND ((Purchase_OrderLine.purch_ord_line_status <> 30) AND (Purchase_OrderLine.purch_ord_line_status <> 50))';

  if Rep <> 0 then
    begin
      if RepIsSubRep then
        sTemp := sTemp + ' AND (Purchase_OrderLine.Sub_Rep = ' + inttostr(Rep) + ')'
      else
        sTemp := sTemp + ' AND (Purchase_OrderLine.Rep = ' + inttostr(Rep) + ')';
    end;

  if Operator <> 0 then
    sTemp := sTemp + ' AND (Purchase_Order.Operator = ' + inttostr(Operator) + ')';
    
  sTemp := sTemp + ' AND Purchase_Order.Date_Point >= ' + qDate(OrderDate);
  qryOrders.SQL.text := qryOrders.SQL.text + sTemp;

  if stockinUse then
    sTemp := 'ORDER BY sales_order.date_ordered desc, Sales_Order_line.Sales_Order desc '
  else
    sTemp := 'ORDER BY Purchase_order.date_point desc, Sales_Order desc ';

  qryOrders.SQL.text := qryOrders.SQL.text + sTemp;

  with qryOrders do
  begin
    Close;
    {order date greater than 1/1/1990}
    if OrderDate > 32874 then
      parambyname('Records').asinteger := 100000000
    else
      parambyname('Records').asinteger := 1000;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;

end;

procedure TdtmdlOrders.RefreshSOData;
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
  qryCallOffs.close;
  qryCallOffs.SQL.Clear;

  {Add the Sales Order query details}
  sTemp := '';

  {Decide whether to show lines or just headers}
  if ShowOrderLines then
    qryCallOffs.SQL := qrySOLines.SQL
  else
    qryCallOffs.SQL := qrySOHeaders.SQL;

  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if Status <> '' then
    sTemp := sTemp + ' AND (Sales_order_Head_status.Description LIKE ''%' + Status + '%'')';
(*  if SupplierName <> '' then
    sTemp := sTemp + ' AND ((select Supplier.Name'
                       + ' from Supplier'
                       + ' where Sales_order.Supplier = Supplier.Supplier)'
                       + ' LIKE ''%' + SupplierName + '%'')';
*)
  if JobNumber <> '' then
    sTemp := sTemp + ' AND (select top 1 job_bag_line_dets.job_bag '
                   + ' FROM job_bag_line_dets '
                   + ' WHERE sales_order.sales_order = job_bag_line_dets.sales_order) = ' + JobNumber ;
  if CustomerRef <> '' then
    sTemp := sTemp + ' AND (Sales_order.Cust_Order_no LIKE ''%' + CustomerRef + '%'')';

  if RepName <> '' then
    sTemp := sTemp + ' AND (Rep.Name LIKE ''%' + RepName + '%'')';
  if accountMgr <> '' then
    sTemp := sTemp + ' AND (Office_Contact.Name LIKE ''%' + AccountMgr + '%'')';
  if OperatorName <> '' then
    sTemp := sTemp + ' AND (Operator.Name LIKE ''%' + OperatorName + '%'')';

  if ShowInactive then
    sTemp := sTemp + ' AND ((Sales_Order.inactive is NULL) OR (Sales_Order.inactive = ''N'') '
                    + ' OR (Sales_Order.inactive = ''Y''))'
  else
    sTemp := sTemp + ' AND ((Sales_Order.inactive is NULL) OR (Sales_Order.inactive = ''N''))';

  if ShowWIP then
    sTemp := sTemp + ' AND (Sales_Order.Sales_Order_Head_Status < 250)';

  if ShowOrderLines then
    begin
      if OrdQtyDesc <> '' then
        sTemp := sTemp + ' AND (Sales_Order_Line.Quantity_Ordered = ' + OrdQtyDesc + ')';
      if ProductCode <> '' then
        sTemp := sTemp + ' AND (Sales_order_line.Part LIKE ''' + ProductCode + '%'')';
      if FormReference <> '' then
        sTemp := sTemp + ' AND (select top 1 form_Reference.Form_Reference_ID '
                       + ' FROM Form_Reference '
                       + ' WHERE Form_Reference.stock_reference = sales_order_line.part) LIKE ''%' + FormReference + '%'')';
    end;

  sTemp := sTemp + ' AND Sales_Order.Date_Ordered >= ' + qDate(OrderDate);

  if ShowOrderLines then
    begin
      sTemp := sTemp + ' ORDER BY sales_order.sales_order desc, sales_order_Line.sales_order_Line_no';

      qryCallOffs.SQL.text := qryCallOffs.SQL.text + sTemp;

      qryCallOffs.Close;
      {order date greater than 1/1/1990}
      if OrderDate > 32874 then
        qryCallOffs.parambyname('Records').asinteger := 100000000
      else
        qryCallOffs.parambyname('Records').asinteger := 2000;
      qryCallOffs.parambyname('Description').asstring := '%' + Description + '%';
      qryCallOffs.parambyname('Customer').asinteger := Customer;
      qryCallOffs.Open;
    end
  else
    begin
      sTemp := sTemp + ' ORDER BY sales_order.sales_order desc ';

      qryCallOffs.SQL.text := qryCallOffs.SQL.text + sTemp;

      qryCallOffs.Close;
      {order date greater than 1/1/1990}
      if OrderDate > 32874 then
        qryCallOffs.parambyname('Records').asinteger := 100000000
      else
        qryCallOffs.parambyname('Records').asinteger := 2000;
      qryCallOffs.parambyname('Customer').asinteger := Customer;
      qryCallOffs.Open;
    end;
end;

procedure TdtmdlOrders.RefreshPOData;
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
  qryOrders.close;
  qryOrders.SQL.Clear;

  {Add the Purchase Order query details}
  sTemp := '';
  qryOrders.SQL.text := qryOrders.SQL.text + qryPOrders.SQL.text;
  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if SupplierName <> '' then
    sTemp := sTemp + ' AND (Supplier.Name LIKE ''%' + SupplierName + '%'')';
  if ProductCode <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Stock_Reference LIKE ''' + ProductCode + '%'')';
  if FormReference <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Form_Reference_ID LIKE ''%' + FormReference + '%'')';
  if AltPurchaseOrder <> '' then
    sTemp := sTemp + ' AND (Purchase_OrderLine.Alt_Purchase_Order LIKE ''%' + AltPurchaseOrder + '%'')';
  if CustomerRef <> '' then
    sTemp := sTemp + ' AND (Purchase_OrderLine.Cust_Order_no LIKE ''%' + CustomerRef + '%'')';
  if OrdQtyDesc <> '' then
    sTemp := sTemp + ' AND (Purchase_OrderLine.Quantity = ' + OrdQtyDesc + ')';
  if DescriptiveRef <> '' then
    sTemp := sTemp + ' AND (Purchase_OrderLine.Description_Reference LIKE ''%' + DescriptiveRef + '%'')';

  if RepName <> '' then
    sTemp := sTemp + ' AND (Rep.Name LIKE ''%' + RepName + '%'')';
  if accountMgr <> '' then
    sTemp := sTemp + ' AND (Office_Contact.Name LIKE ''%' + AccountMgr + '%'')';
  if OperatorName <> '' then
    sTemp := sTemp + ' AND (Operator.Name LIKE ''%' + OperatorName + '%'')';

  if Status <> '' then
    begin
      if Status = 'on hold' then
        sTemp := sTemp + ' AND (Purchase_OrderLine.On_Hold = ''Y'')'
      else
        sTemp := sTemp + ' AND (Purch_Ord_Line_Status.Description LIKE ''%' + Status + '%'')';
    end;
  if JobNumber <> '' then
    sTemp := sTemp + ' AND (job_bag_line_dets.job_bag = ' + JobNumber + ')';
  if customer = 0 then
    begin
      if Rep <> 0 then
        sTemp := sTemp + ' AND ((Purchase_orderline.Rep = ' + inttostr(Rep) + ') OR ' +
                         '((SELECT Top 1 Rep FROM Reps_Branches WHERE Reps_Branches.customer = Purchase_OrderLine.Customer and ' +
                         'Reps_Branches.branch_no = Purchase_OrderLine.branch_no) = ' + inttostr(Rep) + '))';
      if Operator <> 0 then
        sTemp := sTemp + ' AND (Purchase_order.Operator = ' + inttostr(Operator) + ')';
    end;

  if ShowInactive then
    sTemp := sTemp + ' AND ((Purchase_OrderLine.inactive is NULL) OR (Purchase_OrderLine.inactive = ''N'') '
                    + ' OR (Purchase_OrderLine.inactive = ''Y''))'
  else
    sTemp := sTemp + ' AND ((Purchase_OrderLine.inactive is NULL) OR (Purchase_OrderLine.inactive = ''N''))';

  if ShowWIP then
    sTemp := sTemp + ' AND ((Purchase_OrderLine.purch_ord_line_status <> 30) AND (Purchase_OrderLine.purch_ord_line_status <> 50))';

  if ShowOnlyUnAuthorised then
    sTemp := sTemp + ' AND (Purchase_Order.Needs_Authorising = ''Y'')';

  sTemp := sTemp + ' AND Purchase_Order.Date_Point >= ' + qDate(OrderDate);
  qryOrders.SQL.text := qryOrders.SQL.text + sTemp;

  sTemp := 'ORDER BY Purchase_order.Purchase_Order desc, Sales_Order desc ';

  qryOrders.SQL.text := qryOrders.SQL.text + sTemp;

  with qryOrders do
  begin
    Close;
    {order date greater than 1/1/1990}
    if OrderDate > 32874 then
      parambyname('Records').asinteger := 100000000
    else
      parambyname('Records').asinteger := 2000;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

procedure TdtmdlOrders.RefreshJBData;
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
  qryOrders.close;
  qryOrders.SQL.Clear;

  {Add the Purchase Order query details}
  sTemp := '';
  qryOrders.SQL.text := qryJBOrders.SQL.text;
  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if SupplierName <> '' then
    sTemp := sTemp + ' AND (Supplier.Name LIKE ''%' + SupplierName + '%'')';
  if ProductCode <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Stock_Reference LIKE ''' + ProductCode + '%'')';
  if FormReference <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Form_Reference_ID LIKE ''%' + FormReference + '%'')';
  if CustomerRef <> '' then
    sTemp := sTemp + ' AND (Purchase_OrderLine.Cust_Order_no LIKE ''%' + CustomerRef + '%'')';
  if not ShowInvoiced then
    sTemp := sTemp + ' AND (Purchase_OrderLine.purch_ord_line_status <= 25)';
  if NotInJobBag then
    begin
      sTemp := sTemp + ' AND (Purchase_Order.Purchase_Order Not In (Select Purchase_Order From Job_Bag_Line_Dets '
                     + ' WHERE (Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLine.Purchase_Order) AND '
                     + '       (Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line)))';
    end;
  if ShowInactive then
    sTemp := sTemp + ' AND ((Purchase_OrderLine.inactive is NULL) OR (Purchase_OrderLine.inactive = ''N'') '
                    + ' OR (Purchase_OrderLine.inactive = ''Y''))'
  else
    sTemp := sTemp + ' AND ((Purchase_OrderLine.inactive is NULL) OR (Purchase_OrderLine.inactive = ''N''))';

  if ExistingOrders <> '' then
    sTemp := sTemp + ' AND (Purchase_OrderLine.Purchase_Order NOT IN (' + ExistingOrders + '))';
    
  qryOrders.SQL.text := qryOrders.SQL.text + sTemp;

  sTemp := 'ORDER BY Purchase_order.date_point desc ';

  qryOrders.SQL.text := qryOrders.SQL.text + sTemp;

  with qryOrders do
  begin
    Close;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
//    parambyname('Branch_no').asinteger := Branch;
    Open;
  end;
end;

function TdtmdlOrders.PeriodEndRun(TempType: string; TempPO: real; TempLine: integer): boolean;
begin
  Result := false;
  with qryPeriodEnd do
  begin
    close;
    ParamByName('Purchase_Order').Asfloat := TempPO;
    ParamByName('Line').Asinteger := TempLine;
    open;
    if (recordcount > 0) and (fieldbyname('Qty_Invoiced').AsInteger > 0) then
    begin
      Result := true;
    end;
    close;
  end;
end;

procedure TdtmdlOrders.DataModuleCreate(Sender: TObject);
begin
  with qryCompany do
    begin
      close;
      open;
      try
        stockinUse := (fieldbyname('Use_stock_system').asstring = 'Y');
      except
        stockinuse := false;
      end;
    end;
end;

function TdtmdlOrders.GetSoPartStore(tempCode: integer): integer;
begin
  with qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      open;
      result := fieldbyname('Part_Store').asinteger;
    end;
end;

function TdtmdlOrders.IsNewPicking(tempCode: integer): boolean;
begin
  result := false;
  try
    with qrySOPicking do
      begin
        close;
        parambyname('Sales_order').asinteger := tempcode;
        open;
        result := (recordcount > 0);
      end;
  except
    result := false;
  end;

end;

function TdtmdlOrders.GetSoReplenSource(tempCode: integer): integer;
begin
  with qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      open;
      result := fieldbyname('Replenish_source').asinteger;
    end;

end;

function TdtmdlOrders.GetPickingRef(TempSO: integer): string;
begin
  with GetPickRefSQL do
    begin
      close;
      parambyname('Sales_Order').asinteger := TempSO;
      open;
      result := fieldbyname('Picking_List_Ref').asstring;
    end;
end;

procedure TdtmdlOrders.qryOrdersStatus_textGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if  (dtsOrders.Dataset.fieldbyname('Order_status').asinteger = 30) and
      (dtsOrders.Dataset.fieldbyname('Order_type').asstring = 'PO') then
    begin
      qryInvoicePO.close;
      qryInvoicePO.parambyname('Purchase_Order').asfloat := dtsOrders.Dataset.fieldbyname('Sales_Order').asfloat;
      qryInvoicePO.parambyname('Line').asinteger := dtsOrders.Dataset.fieldbyname('Line').asinteger;
      qryInvoicePO.open;

      if qryInvoicePO.recordcount > 0 then
        if (qryInvoicePO.FieldByName('Sales_invoice_no').asstring <> '') then
          begin
            text := qryInvoicePO.fieldbyname('Sales_invoice_no').asstring;
            exit;
          end;
      text := dtsOrders.Dataset.fieldbyname('Status_description').asstring;
    end
  else
  if  (dtsOrders.Dataset.fieldbyname('Order_status').asinteger = 250) then
    begin
      qryInvoiceSO.close;
      qryInvoiceSO.parambyname('Sales_Order').asinteger := dtsOrders.Dataset.fieldbyname('Sales_Order').asinteger;
      qryInvoiceSO.open;

      if qryInvoiceSO.recordcount > 0 then
        if (qryInvoiceSO.FieldByName('Sales_invoice_no').asstring <> '') then
          begin
            text := qryInvoiceSO.fieldbyname('Sales_invoice_no').asstring;
            exit;
          end;
      text := dtsOrders.Dataset.fieldbyname('Status_description').asstring;
    end
  else
  if (dtsOrders.Dataset.fieldbyname('On_Hold').asstring = 'Y') then
    text := 'ON HOLD'
  else
    text := dtsOrders.Dataset.fieldbyname('Status_description').asstring;
end;

function TdtmdlOrders.GetCalloffHeaderCount: integer;
begin
  result := qryCallOffs.recordcount;
end;

function TdtmdlOrders.IsCustomerOnStop(iTempCode: integer): boolean;
begin
  with qryCust do
    begin
      close;
      parambyname('Customer').asinteger := iTempcode;
      open;
      result := (fieldbyname('Credit_Status').asstring = 'S');
      close;
    end;
end;

function TdtmdlOrders.IsPOAuthorised(tempCode: real): boolean;
begin
  with qrySelectedPO do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempCode;
      open;

      result := fieldbyname('Authorised_by').asinteger <> 0
    end;
end;

function TdtmdlOrders.ProofApproved(tempCode: real; tempLine: integer): boolean;
begin
  with qryPOProofStatus do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;

      result := (fieldbyname('Proof_Approved').asstring = 'Y');
    end;
end;

function TdtmdlOrders.GetSOInvoiceStatus(tempCode: integer): string;
begin
  with qrySelectedSO do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      open;

      if fieldbyname('Sales_order_head_status').asinteger < 200 then
        result := 'N'
      else
      if fieldbyname('Sales_order_head_status').asinteger = 200 then
        result := 'P'
      else
        result := 'Y';
    end;
end;
function TdtmdlOrders.GetSOType(tempCode: integer): string;
begin
  with qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      open;
      result := fieldbyname('Order_Type').asstring;
    end;
end;

function TdtmdlOrders.SOInvoiced(SOrder: integer): boolean;
begin
  with qryGetSInvoice do
    begin
      close;
      parambyname('Sales_Order').asinteger := SOrder;
      open;
      result := (recordcount > 0);
    end;
end;

procedure TdtmdlOrders.qryOrdersStatus_DescriptionGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if  (dtsOrders.Dataset.fieldbyname('Order_status').asinteger = 30) and
      (dtsOrders.Dataset.fieldbyname('Order_type').asstring = 'PO') then
    begin
      qryInvoicePO.close;
      qryInvoicePO.parambyname('Purchase_Order').asfloat := dtsOrders.Dataset.fieldbyname('Sales_Order').asfloat;
      qryInvoicePO.parambyname('Line').asinteger := dtsOrders.Dataset.fieldbyname('Line').asinteger;
      qryInvoicePO.open;

      if qryInvoicePO.recordcount > 0 then
        if (qryInvoicePO.FieldByName('Sales_invoice_no').asstring <> '') then
          begin
            text := qryInvoicePO.fieldbyname('Sales_invoice_no').asstring;
            exit;
          end;
      text := dtsOrders.Dataset.fieldbyname('Status_description').asstring;
    end
  else
  if  (dtsOrders.Dataset.fieldbyname('Order_status').asinteger = 250) then
    begin
      qryInvoiceSO.close;
      qryInvoiceSO.parambyname('Sales_Order').asinteger := dtsOrders.Dataset.fieldbyname('Sales_Order').asinteger;
      qryInvoiceSO.open;

      if qryInvoiceSO.recordcount > 0 then
        if (qryInvoiceSO.FieldByName('Sales_invoice_no').asstring <> '') then
          begin
            text := qryInvoiceSO.fieldbyname('Sales_invoice_no').asstring;
            exit;
          end;
      text := dtsOrders.Dataset.fieldbyname('Status_description').asstring;
    end
  else
  if (dtsOrders.Dataset.fieldbyname('On_Hold').asstring = 'Y') then
    text := 'ON HOLD'
  else
    text := dtsOrders.Dataset.fieldbyname('Status_description').asstring;
end;

procedure TdtmdlOrders.qryOrdersSales_orderGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryorders.fieldbyname('Needs_Authorising').asstring = 'Y' then
    text := 'N/A'
  else
    text := qryorders.fieldbyname('Sales_Order').asstring;
end;

function TdtmdlOrders.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (BranchName <> '') or
            (RepName <> '') or
            (AccountMgr <> '') or
            (OperatorName <> '') or
            (SupplierName <> '') or
            (ProductCode <> '') or
            (FormReference <> '') or
            (Status <> '') or
            (CustomerRef <> '') or
            (OrdQtyDesc <> '') or
            (DescriptiveRef <> '') or
            (Description <> '') or
            (JobNumber <> '') or
            (ShowInactive) or
            (ShowOnlyUnAuthorised) then
    result := true
  else
    result := false;
end;

function TdtmdlOrders.SetSOInvoiceStatus(tempCode: integer): string;
begin
  with qrySetSOInvoice do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      execsql;
    end;
end;

end.
