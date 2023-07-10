unit WTRPSalesOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, gtQrCtrls;

type
  TfrmwtRPSalesOrder = class(TForm)
    qrpDetails: TQuickRep;
    qrySalesOrders: TQuery;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortBy: TgtQRLabel;
    qrGroupbyText: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    qrbGroupFooter: TQRBand;
    qrlblCustTotal: TgtQRLabel;
    QRShape1: TgtQRShape;
    QRBand2: TQRBand;
    QRLabel10: TgtQRLabel;
    qrlblReportTotal: TgtQRLabel;
    QRShape2: TgtQRShape;
    QRBand1: TQRBand;
    qrlblCaption: TgtQRLabel;
    QRSysData1: TgtQRSysData;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    qrlblDateRange: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    qrGroupbyFootText: TgtQRDBText;
    QRLabel2: TgtQRLabel;
    QRSysData2: TgtQRSysData;
    QRDBText1: TgtQRDBText;
    QRLabel9: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    qrlblCustGoods: TgtQRLabel;
    qrlblCustVAT: TgtQRLabel;
    qrlblReportVAT: TgtQRLabel;
    qrlblReportGoods: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    QRDBText7: TgtQRDBText;
    QRDBText9: TgtQRDBText;
    QRDBText10: TgtQRDBText;
    QRLabel1: TgtQRLabel;
    qrySalesOrdersSales_Order: TIntegerField;
    qrySalesOrdersDate_Raised: TDateTimeField;
    qrySalesOrdersSales_Order_Status: TIntegerField;
    qrySalesOrdersSales_Order_Status_Desc: TStringField;
    qrySalesOrdersTemplate_Date: TDateTimeField;
    qrySalesOrdersInstall_Address: TIntegerField;
    qrySalesOrdersCustomer_Name: TStringField;
    qrySalesOrdersReference: TStringField;
    qrySalesOrdersTelephone_number: TStringField;
    qrySalesOrdersGoods_Value: TFloatField;
    qrySalesOrdersVAT_Value: TFloatField;
    qrySalesOrdersTotal_Value: TFloatField;
    qrySalesOrdersRep: TIntegerField;
    qrySalesOrdersRep_Name: TStringField;
    qrlblSelection: TgtQRLabel;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    qrySalesOrdersDate_Required: TDateTimeField;
    qrySalesOrdersIs_Retail_Customer: TStringField;
    qrySalesOrdersIs_Commercial_Customer: TStringField;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CustomerGoods, CustomerVAT, CustomerTotal, ReportGoods, ReportVAT, ReportTotal: real;
    FCustomerCategory: integer;
    procedure SetCustomerCategory(const Value: integer);
  public
    SortBy: integer;
    customer, rep: integer;
    customerList: TstringList;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPSalesOrder: TfrmwtRPSalesOrder;

implementation

uses wtDataModule, WTRSSalesOrder;

{$R *.dfm}

procedure TfrmwtRPSalesOrder.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  case sortby of
    0:begin
        qrbGroupFooter.enabled := false;
        qrbGroupHeader.Expression := '';
        qrGroupByText.DataField := '';
        qrlblSortBy.Caption := '';
      end;
    1:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Template_Date';
        qrGroupByText.DataField := 'Template_Date';
        qrlblSortBy.Caption := 'Template Date';
      end;
    2:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
      end;
    3:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Sales_Order_Status';
        qrGroupByText.DataField := 'Sales_Order_Status_Desc';
        qrlblSortBy.Caption := 'Status';
      end;
    4:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Rep_Name';
        qrGroupByText.DataField := 'Rep_Name';
        qrlblSortBy.Caption := 'Rep';
      end;
  end;

  qrGroupByFootText.DataField := qrGroupByText.DataField;
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;

  ReportGoods := 0.00;
  ReportVAT := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPSalesOrder.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  CustomerGoods := CustomerGoods + qrySalesOrders.fieldbyname('Goods_Value').asfloat;
  CustomerVAT := CustomerVat + qrySalesOrders.fieldbyname('Vat_Value').asfloat;
  CustomerTotal := CustomerTotal + qrySalesOrders.fieldbyname('Total_Value').asfloat;

  ReportGoods := ReportGoods +  qrySalesOrders.fieldbyname('Goods_Value').asfloat;
  ReportVAT := ReportVAT +  qrySalesOrders.fieldbyname('Vat_Value').asfloat;
  ReportTotal := ReportTotal +  qrySalesOrders.fieldbyname('Total_Value').asfloat;
end;

procedure TfrmwtRPSalesOrder.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;
end;

procedure TfrmwtRPSalesOrder.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustGoods.caption := formatfloat('0.00',CustomerGoods);
  qrlblCustVAT.caption := formatfloat('0.00',CustomerVAT);
  qrlblCustTotal.caption := formatfloat('0.00',CustomerTotal);
end;

function TfrmwtRPSalesOrder.GetDetails: integer;
var
  iCount: integer;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  if customerList.Count > 0 then
    begin
      qrySalesOrders.SQL.Add(' AND (');
      for icount := 0 to pred(customerList.Count) do
        begin
          if iCount = 0 then
            qrySalesOrders.SQL.Add('(Sales_Order.Customer = ' + customerList[iCount] + ')')
          else
            qrySalesOrders.SQL.Add(' OR (Sales_Order.Customer = ' + customerList[iCount] + ')')
        end;
      qrySalesOrders.SQL.Add(')');
    end;

  case sortby of
    0:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Sales_Order');
      end;
    1:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Template_Date, Sales_Order.Sales_Order');
      end;
    2:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Customer_Name, Sales_Order.Sales_Order');
      end;
    3:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Sales_Order_Status, Sales_Order.Sales_Order');
      end;
    4:begin
        qrySalesOrders.SQL.Add('ORDER BY Rep.Rep_Name, Sales_Order.Sales_Order');
      end;
  end;

  qrySalesOrders.Close;

  case CustomerCategory of
        0:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'A';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'A';
            end;
        1:  begin
              qrySalesOrders.ParambyName('Is_Retail_Customer').asstring := 'N';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        2:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'Y';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        3:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'N';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'Y';
            end;
  end;

//  qrySalesOrders.parambyname('Customer_List').asstring := customerList;
//  qrySalesOrders.parambyname('Customer').asinteger := customer;
  qrySalesOrders.parambyname('Rep').asinteger := rep;
  qrySalesOrders.parambyname('Date_From').Asdatetime := Datefrom;
  qrySalesOrders.parambyname('Date_To').Asdatetime := DateTo;
  qrySalesOrders.Open;
  result := qrySalesOrders.recordcount;
end;

procedure TfrmwtRPSalesOrder.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportGoods.caption := formatfloat('0.00',ReportGoods);
  qrlblReportVAT.caption := formatfloat('0.00',ReportVAT);
  qrlblReportTotal.caption := formatfloat('0.00',ReportTotal);
end;

procedure TfrmwtRPSalesOrder.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPSalesOrder.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Sales Order"'
    + ',"Date"'
    + ',"Customer"'
    + ',"Category"'
    + ',"Template Date"'
    + ',"Date Required"'
    + ',"Reference"'
    + ',"Rep"'
    + ',"Goods"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Status"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPSalesOrder.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Job
    tempStr := '"' + qrySalesOrders.fieldbyname('Sales_Order').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Date_Raised').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Customer_Name').asstring + '"';

    //Category
    if qrySalesOrders.fieldbyname('Is_Retail_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Retail' + '"'
    else
    if qrySalesOrders.fieldbyname('Is_Commercial_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Commercial' + '"'
    else
      tempStr := tempStr + ',"' + 'Trade' + '"';

    //Template Date
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Template_Date').asstring + '"';

    //Date Required
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Date_Required').asstring + '"';

    //Date Required
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Reference').asstring + '"';

    //Job Number
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Rep_Name').asstring + '"';

    //Goods Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Goods_Value').asstring + '"';

    //VAT Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Vat_Value').asstring + '"';

    //Total Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Total_Value').asstring + '"';

    //Status
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Sales_Order_Status_Desc').asstring + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSalesOrder.prgbrExport.StepIt;
  end;
end;

procedure TfrmwtRPSalesOrder.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmwtRPSalesOrder.FormCreate(Sender: TObject);
begin
  customerList := TStringList.Create;
end;

procedure TfrmwtRPSalesOrder.FormDestroy(Sender: TObject);
begin
  customerList.Free;
end;

end.
