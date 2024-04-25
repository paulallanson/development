unit pbFormReferenceDM;

interface

uses
  SysUtils, Classes, DB, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlForms = class(TDataModule)
    qryForms: TFDQuery;
    dtsForms: TDataSource;
    old_qryDummy: TFDQuery;
    qryDummy: TFDQuery;
    qryLocations: TFDQuery;
    qryLocationsForm_Reference: TIntegerField;
    qryLocationsForm_Reference_ID: TWideStringField;
    qryLocationsForm_Reference_Descr: TWideStringField;
    qryLocationsStocked_Item: TWideStringField;
    qryLocationsPurchase_Order: TFloatField;
    qryLocationsLine: TIntegerField;
    qryLocationsForms_Per_Box: TWideStringField;
    qryLocationsStock_Location_Desc: TWideStringField;
    qryLocationsDelivery_to_Stock: TWideStringField;
    qryLocationsLocation_no: TIntegerField;
    qryLocationsDescription: TWideStringField;
    qryLocationsQuantity: TIntegerField;
    qryLocationsQuantity_Allocated: TIntegerField;
    qryLocationsQty_in_Stock: TIntegerField;
    qryLocationsBoxQty: TIntegerField;
    dtsLocations: TDataSource;
    dtsHistory: TDataSource;
    dtsNull: TDataSource;
    qryCustomer: TFDQuery;
    qryBranch: TFDQuery;
    qryGetTotalStock: TFDQuery;
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    SupplierSQL: TFDQuery;
    CompSQL: TFDQuery;
    CustomerSQL: TFDQuery;
    qryHistory: TFDQuery;
    qryHistoryPurchase_Order: TFloatField;
    qryHistoryLine: TIntegerField;
    qryHistoryDelivery_no: TIntegerField;
    qryHistoryAd_hoc_Address: TIntegerField;
    qryHistorySupplier: TIntegerField;
    qryHistoryBranch_no: TIntegerField;
    qryHistoryRep: TIntegerField;
    qryHistoryQty_to_Deliver: TFloatField;
    qryHistoryQty_Delivered: TFloatField;
    qryHistoryQty_Invoiced: TFloatField;
    qryHistoryDate_Point: TDateTimeField;
    qryHistoryBranch_No0: TIntegerField;
    qryHistoryCustomer: TIntegerField;
    qryHistoryNo_Of_Boxes: TIntegerField;
    qryHistoryDelivery_Instructions: TWideStringField;
    qryHistoryDeliver_via_Company: TWideStringField;
    qryHistoryDate_Deliv_Actual: TDateTimeField;
    qryHistoryDelivery_to_Stock: TWideStringField;
    qryHistoryDelivery_note_printed: TWideStringField;
    qryHistorySuppliers_Desc: TWideStringField;
    qryHistoryOrder_Customer: TIntegerField;
    qryHistoryCustomer_Branch: TIntegerField;
    qryHistoryForms_Per_Box: TWideStringField;
    qryHistoryNo_of_sets: TWideStringField;
    qryHistoryCust_Order_No: TWideStringField;
    qryHistoryPurch_Ord_Line_Status: TIntegerField;
    qryHistorySupplier_1: TIntegerField;
    qryHistorySupplier_Branch: TIntegerField;
    qryHistorySupplier_Name: TWideStringField;
    qryHistoryCustomer_Name: TWideStringField;
    qryHistoryOrder_Status: TWideStringField;
    qryHistoryQty_in_Stock: TFloatField;
    qryHistoryOriginal_Order: TFloatField;
    qryHistoryOriginal_Orderline: TFloatField;
    qryHistoryForm_Reference: TIntegerField;
    qryHistoryForm_Reference_Descr: TWideStringField;
    qryHistoryForm_Reference_ID: TWideStringField;
    qryHistoryDeliveryName: TWideStringField;
    qryHistoryQty_in: TIntegerField;
    qryHistoryQty_out: TIntegerField;
    qryHistoryPONumber: TWideStringField;
    qryHistoryInactive: TWideStringField;
    qryHistoryGoods_reqd_by_Customer: TDateTimeField;
    qryHistoryInvoice_upfront: TWideStringField;
    qryHistoryOrder_Price: TCurrencyField;
    qryHistoryOrder_Unit: TIntegerField;
    qryHistoryPrice_unit_description: TWideStringField;
    qryHistoryPrice_Unit_Factor: TFloatField;
    qryHistoryOrig_Ord_Qty: TFloatField;
    procedure qryHistoryPONumberGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryHistoryQty_inGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryHistoryQty_outGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryLocationsBoxQtyGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryHistoryCalcFields(DataSet: TDataSet);
  private
    function GetHeaderCount: integer;
    { Private declarations }
  public
    CustomerName: string;
    BranchName: string;
    Customer: integer;
    Description: string;
    ShowNonStocked: boolean;
    function GetTotalStock(TempForm: integer): integer;
    procedure RefreshData;
    procedure RefreshStockLocs(iTempCode: integer);
    procedure RefreshStock(iTempCode: integer);
    property HeaderCount: integer read GetHeaderCount;
  end;

var
  dtmdlForms: TdtmdlForms;

implementation

uses CCSCommon;

{$R *.dfm}

{ TdtmdlForms }

function TdtmdlForms.GetHeaderCount: integer;
begin
  result := qryForms.recordcount;
end;

procedure TdtmdlForms.RefreshData;
var
  sTemp: string;
begin
  qryForms.sql.clear;
  qryForms.sql.text := qryDummy.sql.text;

  sTemp := '';
  if CustomerName <> '' then
    sTemp := sTemp + ' AND (Customer.Name LIKE ''%' + CustomerName + '%'')';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if not ShowNonStocked then
    sTemp := sTemp + ' AND (Form_Reference.Stocked_Item = ''Y'')';

  sTemp := sTemp + ' ORDER BY Customer.Name, Form_reference_id';

  qryForms.SQL.text := qryForms.SQL.text + sTemp;


  with qryForms do
  begin
    Close;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

procedure TdtmdlForms.RefreshStockLocs(iTempCode: integer);
begin
  dtsLocations.Dataset := qryLocations;
  with qryLocations do
    begin
      close;
      parambyname('Form_Reference').asinteger := iTempCode;
      Open;
    end;
end;

procedure TdtmdlForms.RefreshStock(iTempCode: integer);
begin
  dtsHistory.Dataset := qryHistory;
  with qryHistory do
    begin
      close;
      parambyname('Form_Reference').asinteger := iTempCode;
      Open;
    end;
end;

function TdtmdlForms.GetTotalStock(TempForm: integer): integer;
begin
  with qryGetTotalStock do
    begin
      close;
      parambyname('Form_Reference').asinteger := TempForm;
      open;
      first;
      Result := fieldbyname('Total_Stock').asinteger;
    end;
end;

procedure TdtmdlForms.qryHistoryPONumberGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryHistoryPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryHistoryPurchase_Order.Asfloat,qryHistoryLine.AsInteger);
end;

procedure TdtmdlForms.qryHistoryQty_inGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if  (qryHistory.fieldbyname('Delivery_to_Stock').asstring = 'Y') and
      (qryHistory.fieldbyname('Date_Deliv_Actual').asstring <> '') then
    text := qryHistory.fieldbyname('Qty_Delivered').asstring
  else
    text := '0';

end;

procedure TdtmdlForms.qryHistoryQty_outGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryHistory.fieldbyname('Delivery_to_Stock').asstring <> 'Y' then
    text := qryHistory.fieldbyname('Qty_Delivered').asstring
  else
    text := '0';

end;

procedure TdtmdlForms.qryLocationsBoxQtyGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  rCount: real;
begin
  try
    rcount := qryLocationsQty_in_Stock.asfloat / qryLocationsForms_per_box.asfloat;
  except
    rcount := 1
  end;
  Text := inttostr(ceil(rcount));
end;

procedure TdtmdlForms.qryHistoryCalcFields(DataSet: TDataSet);
begin
  if qryHistory.FieldByName('Customer').AsString <> '' then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        qryHistory.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        qryHistory.FieldByName('Branch_no0').AsInteger;
      Open;
    qryHistory.Fieldbyname('DeliveryName').asstring := 'Cust/Br: '+fieldbyname('Customer_Name').asstring;
    end;
  end
  else
    if qryHistory.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          qryHistory.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
        qryHistory.Fieldbyname('DeliveryName').asstring := 'AdHoc: '+fieldbyname('Name').asstring;
      end;
    end
    else
      if qryHistory.FieldByName('Rep').AsString <> '' then
      begin
        with RepSQl do
        begin
          Close;
          ParamByName('Rep').AsInteger :=
            qryHistory.FieldByName('Rep').AsInteger;
          Open;
          qryHistory.Fieldbyname('DeliveryName').asstring := 'Rep: '+fieldbyname('Name').asstring;
        end;
      end
      else
        if qryHistory.FieldByName('Supplier').AsString <> '' then
        begin
          with SupplierSQl do
          begin
            Close;
            ParamByName('Supplier').AsInteger :=
              qryHistory.FieldByName('Supplier').AsInteger;
            ParamByName('Branch_no').AsInteger :=
              qryHistory.FieldByName('Branch_no').AsInteger;
            Open;
            qryHistory.Fieldbyname('DeliveryName').asstring := 'Supp/Br: '+fieldbyname('Supplier_Name').asstring;
          end;
        end
        else
        begin
          with CompSQL do
          begin
            Close;
            Open;
            qryHistory.Fieldbyname('DeliveryName').asstring := 'Comp: '+fieldbyname('Company_Name').asstring;
          end;
        end;

end;

end.
