unit WTRPSalesOrderInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPSalesOrderInvoice = class(TForm)
    qrpDetails: TQuickRep;
    qrySalesOrders: TFDQuery;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortBy: TQRLabel;
    qrGroupbyText: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrbGroupFooter: TQRBand;
    qrlblCustTotal: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRShape2: TQRShape;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    qrlblDateRange: TQRLabel;
    qrGroupbyFootText: TQRDBText;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    qrlblCustGoods: TQRLabel;
    qrlblCustVAT: TQRLabel;
    qrlblReportVAT: TQRLabel;
    qrlblReportGoods: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
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
    qrlblSelection: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    qrySalesOrdersDate_Required: TDateTimeField;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRDBText2: TQRDBText;
    qrlblDifference: TQRLabel;
    qrySalesOrdersTotal_Invoice: TFloatField;
    qrlblCustInvoice: TQRLabel;
    qrlblReportInvoice: TQRLabel;
    qrlblCustDiff: TQRLabel;
    qrlblReportDiff: TQRLabel;
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
    CustomerGoods, CustomerVAT, CustomerTotal, CustomerInvoice, ReportGoods, ReportVAT, ReportTotal, ReportInvoice: real;
    FCustomerCategory: integer;
    procedure SetCustomerCategory(const Value: integer);
  public
    OnlyDifference: boolean;
    SortBy: integer;
    customer, rep: integer;
    customerList: TstringList;
    DateFrom, DateTo: TDateTime;
    exportLine: boolean;
    exporting: boolean;
    exportFile: textFile;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmWTRPSalesOrderInvoice: TfrmWTRPSalesOrderInvoice;

implementation

uses wtDataModule, WTRSSalesOrderInvoice;

{$R *.dfm}

procedure TfrmWTRPSalesOrderInvoice.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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

procedure TfrmWTRPSalesOrderInvoice.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rDifference: real;
begin
  rDifference := (qrySalesOrders.fieldbyname('Total_Value').asfloat - qrySalesOrders.fieldbyname('Total_Invoice').asfloat);
  qrlblDifference.caption := formatfloat('0.00',rDifference);

  if (qrlblDifference.caption = '0.00') and OnlyDifference then
    begin
      PrintBand := false;
      exit;
    end;

  CustomerGoods := CustomerGoods + qrySalesOrders.fieldbyname('Goods_Value').asfloat;
  CustomerVAT := CustomerVat + qrySalesOrders.fieldbyname('Vat_Value').asfloat;
  CustomerTotal := CustomerTotal + qrySalesOrders.fieldbyname('Total_Value').asfloat;
  CustomerInvoice := CustomerInvoice + qrySalesOrders.fieldbyname('Total_Invoice').asfloat;

  ReportGoods := ReportGoods +  qrySalesOrders.fieldbyname('Goods_Value').asfloat;
  ReportVAT := ReportVAT +  qrySalesOrders.fieldbyname('Vat_Value').asfloat;
  ReportTotal := ReportTotal +  qrySalesOrders.fieldbyname('Total_Value').asfloat;
  ReportInvoice := ReportInvoice + qrySalesOrders.fieldbyname('Total_Invoice').asfloat;
end;

procedure TfrmWTRPSalesOrderInvoice.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;
end;

procedure TfrmWTRPSalesOrderInvoice.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustGoods.caption := formatfloat('0.00',CustomerGoods);
  qrlblCustVAT.caption := formatfloat('0.00',CustomerVAT);
  qrlblCustTotal.caption := formatfloat('0.00',CustomerTotal);
  qrlblCustInvoice.caption := formatfloat('0.00',CustomerInvoice);
  qrlblCustDiff.caption := formatfloat('0.00',CustomerTotal-CustomerInvoice);
end;

function TfrmWTRPSalesOrderInvoice.GetDetails: integer;
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

procedure TfrmWTRPSalesOrderInvoice.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportGoods.caption := formatfloat('0.00',ReportGoods);
  qrlblReportVAT.caption := formatfloat('0.00',ReportVAT);
  qrlblReportTotal.caption := formatfloat('0.00',ReportTotal);
  qrlblReportInvoice.caption := formatfloat('0.00',ReportInvoice);
  qrlblReportDiff.caption := formatfloat('0.00',(ReportTotal-ReportInvoice));
end;

procedure TfrmWTRPSalesOrderInvoice.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmWTRPSalesOrderInvoice.ExporttoFile(filename: string);
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
    + ',"Total Invoiced"'
    + ',"Outstanding"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmWTRPSalesOrderInvoice.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting and BandPrinted then
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

    //Reference
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Reference').asstring + '"';

    //Job Number
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Rep_Name').asstring + '"';

    //Goods Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Goods_Value').asstring + '"';

    //VAT Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Vat_Value').asstring + '"';

    //Total Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Total_Value').asstring + '"';

    //Total Invoiced
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Total_Invoice').asstring + '"';

    //Outstanding Amount
    tempStr := tempStr + ',"' + qrlblDifference.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSalesOrderInvoice.prgbrExport.StepIt;
  end;
end;

procedure TfrmWTRPSalesOrderInvoice.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmWTRPSalesOrderInvoice.FormCreate(Sender: TObject);
begin
  customerList := TStringList.Create;
end;

procedure TfrmWTRPSalesOrderInvoice.FormDestroy(Sender: TObject);
begin
  customerList.Free;
end;

end.
