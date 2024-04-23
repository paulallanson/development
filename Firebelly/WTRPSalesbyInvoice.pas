unit WTRPSalesbyInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPSalesbyInvoice = class(TForm)
    qrpDetails: TQuickRep;
    qryReport: TFDQuery;
    qrbGroupHeader: TQRGroup;
    qrlblSortBy: TQRLabel;
    qrGroupbyText: TQRDBText;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData2: TQRSysData;
    qrsbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrdbDescription: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qryReportSales_invoice: TIntegerField;
    qryReportInactive: TWideStringField;
    qryReportCustomer: TIntegerField;
    qryReportAccount_code: TWideStringField;
    qryReportInvoice_No: TWideStringField;
    qryReportInvoice_date: TDateTimeField;
    qryReportGoods_value: TFloatField;
    qryReportVat_Value: TFloatField;
    qryReportTotal_Value: TFloatField;
    qryReportSales_invoice_status: TIntegerField;
    qryReportInvoice_Or_Credit: TWideStringField;
    qryReportDescription: TWideStringField;
    qryReportRep: TIntegerField;
    qryReportReference: TWideStringField;
    qryReportCustomer_Name: TWideStringField;
    qryReportInvoice_Status_Description: TWideStringField;
    qryReportCustomer_Type_Description: TWideStringField;
    qryReportRep_Name: TWideStringField;
    qrbGroupFooter: TQRBand;
    qrGroupbyFooter: TQRDBText;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    qrlblCustTotal: TQRLabel;
    qrlblCustVat: TQRLabel;
    qrlblCustSell: TQRLabel;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRShape2: TQRShape;
    qrlblReportVat: TQRLabel;
    qrlblReportSell: TQRLabel;
    qryReportAccount_Manager: TIntegerField;
    qryReportAccount_Manager_Name: TWideStringField;
    gtQRLabel1: TQRLabel;
    gtQRLabel2: TQRLabel;
    qryReportTotal_Materials: TFloatField;
    qrlblCost: TQRLabel;
    qrlblMargin: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRDBText1: TQRDBText;
    qrlblCustCost: TQRLabel;
    qrlblCustMargin: TQRLabel;
    qrlblReportCost: TQRLabel;
    qrlblReportMargin: TQRLabel;
    gtQRLabel3: TQRLabel;
    qrlblCostPerc: TQRLabel;
    qrlblCustCostPerc: TQRLabel;
    qrlblReportCostPerc: TQRLabel;
    qryReportIs_Retail_Customer: TWideStringField;
    qryReportIs_Commercial_customer: TWideStringField;
    qryReportOld: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TWideStringField;
    IntegerField2: TIntegerField;
    StringField2: TWideStringField;
    StringField3: TWideStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    IntegerField3: TIntegerField;
    StringField4: TWideStringField;
    StringField5: TWideStringField;
    IntegerField4: TIntegerField;
    StringField6: TWideStringField;
    StringField7: TWideStringField;
    StringField8: TWideStringField;
    StringField9: TWideStringField;
    StringField10: TWideStringField;
    IntegerField5: TIntegerField;
    StringField11: TWideStringField;
    FloatField4: TFloatField;
    StringField12: TWideStringField;
    StringField13: TWideStringField;
    qryReportRevenue_Centre_Descr: TWideStringField;
    qryReportRequires_App_For_Payment: TWideStringField;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    CustomerSell, CustomerCost, CustomerMargin, CustomerVat, CustomerTotal, ReportSell, ReportCost, ReportMargin, ReportVat, ReportTotal: real;
    FCustomerCategory: integer;
    FChargeType: integer;
    procedure SetCustomerCategory(const Value: integer);
    procedure SetChargeType(const Value: integer);
  public
    bOnlyShowAFP: boolean;
    SortBy: integer;
    customer, rep: integer;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    property ChargeType: integer read FChargeType write SetChargeType;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPSalesbyInvoice: TfrmwtRPSalesbyInvoice;

implementation

uses wtDataModule, AllCommon, WTRSSalesbyInvoice;

{$R *.dfm}

procedure TfrmwtRPSalesbyInvoice.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  case sortby of
    0:begin
        qrbGroupHeader.Expression := '';
        qrGroupByText.DataField := '';
        qrlblSortBy.Caption := '';
        qrbGroupFooter.enabled := false;
      end;
    1:begin
        qrbGroupHeader.Expression := 'qryReport.Invoice_date';
        qrGroupByText.DataField := 'Invoice_Date';
        qrlblSortBy.Caption := 'Invoice Date';
        qrbGroupFooter.enabled := true;
      end;
    2:begin
        qrbGroupHeader.Expression := 'qryReport.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
        qrbGroupFooter.enabled := true;
      end;
    3:begin
        qrbGroupHeader.Expression := 'qryReport.Rep_Name';
        qrGroupByText.DataField := 'Rep_Name';
        qrlblSortBy.Caption := 'Rep Name';
        qrbGroupFooter.enabled := true;
      end;
    4:begin
        qrbGroupHeader.Expression := 'qryReport.Customer_Type_Description';
        qrGroupByText.DataField := 'Customer_Type_Description';
        qrlblSortBy.Caption := 'Customer Type';
        qrbGroupFooter.enabled := true;
      end;
    5:begin
        qrbGroupHeader.Expression := 'qryReport.Account_Manager_Name';
        qrGroupByText.DataField := 'Account_Manager_Name';
        qrlblSortBy.Caption := 'Account Manager';
        qrbGroupFooter.enabled := true;
      end;
  end;

  qrGroupByFooter.DataField := qrGroupByText.DataField;
  CustomerSell := 0.00;
  CustomerCost := 0.00;
  CustomerMargin := 0.00;
  CustomerVat := 0.00;
  CustomerTotal := 0.00;

  ReportSell := 0.00;
  ReportCost := 0.00;
  ReportMargin := 0.00;
  ReportVat := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPSalesbyInvoice.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rMargin, rCostPerc, rCost: real;
begin
  if qryReport.fieldbyname('Invoice_or_Credit').asstring = 'C' then
    rCost := (qryReport.fieldbyname('Total_Materials').asfloat * -1)
  else
    rCost := qryReport.fieldbyname('Total_Materials').asfloat;

  qrlblCost.Caption := formatfloat('#,##0.00', rCost);
  rMargin := qryReport.fieldbyname('Goods_Value').asfloat - qryReport.fieldbyname('Total_Materials').asfloat;
  qrlblMargin.Caption := formatfloat('#,##0.00', rMargin);

  if qryReport.fieldbyname('Goods_Value').asfloat = 0 then
    rCostPerc := 100
  else
    rCostPerc := (qryReport.fieldbyname('Total_Materials').asfloat/qryReport.fieldbyname('Goods_Value').asfloat)*100;
    
  qrlblCostPerc.caption := formatfloat('0.00%',rCostPerc);

  CustomerSell := CustomerSell + qryReport.fieldbyname('Goods_Value').asfloat;
  CustomerCost := CustomerCost + qryReport.fieldbyname('Total_Materials').asfloat;
  CustomerMargin := CustomerMargin + rMargin;
  CustomerVat := CustomerVat + qryReport.fieldbyname('Vat_Value').asfloat;
  CustomerTotal := CustomerTotal + qryReport.fieldbyname('Total_Value').asfloat;

  ReportSell := ReportSell + qryReport.fieldbyname('Goods_Value').asfloat;
  ReportCost := ReportCost +  qryReport.fieldbyname('Total_Materials').asfloat;
  ReportMargin := ReportMargin +  rMargin;
  ReportVat := ReportVat + qryReport.fieldbyname('Vat_Value').asfloat;
  ReportTotal := ReportTotal + qryReport.fieldbyname('Total_Value').asfloat;
end;

function TfrmwtRPSalesbyInvoice.GetDetails: integer;
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
  case sortby of
    0:begin
        qryReport.SQL.Add('ORDER BY Sales_Invoice.Invoice_no');
      end;
    1:begin
        qryReport.SQL.Add('ORDER BY Sales_Invoice.Invoice_Date, Sales_Invoice.Invoice_no');
      end;
    2:begin
        qryReport.SQL.Add('ORDER BY Sales_Invoice.Customer_Name, Sales_Invoice.Invoice_no');
      end;
    3:begin
        qryReport.SQL.Add('ORDER BY Rep.Rep_Name, Sales_Invoice.Invoice_no');
      end;
    4:begin
        qryReport.SQL.Add('ORDER BY Customer_Type.Description, Sales_Invoice.Invoice_no');
      end;
    5:begin
        qryReport.SQL.Add('ORDER BY Operator.Operator_Name, Sales_Invoice.Invoice_no');
      end;
  end;

  qryReport.Close;
  case CustomerCategory of
        0:  begin
              qryReport.Parambyname('Is_Retail_Customer').asstring := 'A';
              qryReport.Parambyname('Is_Commercial_Customer').asstring := 'A';
            end;
        1:  begin
              qryReport.ParambyName('Is_Retail_Customer').asstring := 'N';
              qryReport.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        2:  begin
              qryReport.Parambyname('Is_Retail_Customer').asstring := 'Y';
              qryReport.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        3:  begin
              qryReport.Parambyname('Is_Retail_Customer').asstring := 'N';
              qryReport.Parambyname('Is_Commercial_Customer').asstring := 'Y';
            end;
  end;

  case ChargeType of
        0:  begin
              qryReport.Parambyname('Is_Retail_Customer').asstring := 'A';
              qryReport.Parambyname('Is_Commercial_Customer').asstring := 'A';
              qryReport.Parambyname('Requires_App_For_Payment').asstring := 'A';
            end;
        1:  begin
              qryReport.Parambyname('Is_Retail_Customer').asstring := 'N';
              qryReport.Parambyname('Is_Commercial_Customer').asstring := 'N';
              qryReport.Parambyname('Requires_App_For_Payment').asstring := 'N';
            end;
        2:  begin
              qryReport.ParambyName('Is_Retail_Customer').asstring := 'N';
              qryReport.Parambyname('Is_Commercial_Customer').asstring := 'N';
              qryReport.Parambyname('Requires_App_For_Payment').asstring := 'Y';
            end;
        3:  begin
              qryReport.Parambyname('Is_Retail_Customer').asstring := 'Y';
              qryReport.Parambyname('Is_Commercial_Customer').asstring := 'N';
              qryReport.Parambyname('Requires_App_For_Payment').asstring := 'N';
            end;
  end;

  qryReport.parambyname('Customer').asinteger := customer;
  qryReport.parambyname('Rep').asinteger := Rep;
  qryReport.parambyname('Date_From').Asdatetime := Datefrom;
  qryReport.parambyname('Date_To').Asdatetime := DateTo;
  qryReport.Open;
  result := qryReport.recordcount;
end;

procedure TfrmwtRPSalesbyInvoice.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPSalesbyInvoice.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerSell := 0.00;
  CustomerCost := 0.00;
  CustomerMargin := 0.00;
  CustomerVat := 0.00;
  CustomerTotal := 0.00;
end;

procedure TfrmwtRPSalesbyInvoice.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rCostPerc: real;
begin
  rCostPerc := (CustomerCost/CustomerSell)*100;
  qrlblCustCostPerc.caption := formatfloat('0.00%',rCostPerc);

  qrlblCustSell.caption := formatfloat('#,##0.00',CustomerSell);
  qrlblCustCost.caption := formatfloat('#,##0.00',CustomerCost);
  qrlblCustMargin.caption := formatfloat('#,##0.00',CustomerMargin);
  qrlblCustVat.caption := formatfloat('#,##0.00',CustomerVat);
  qrlblCustTotal.caption := formatfloat('#,##0.00',CustomerTotal);
end;

procedure TfrmwtRPSalesbyInvoice.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rCostPerc: real;
begin
  rCostPerc := (ReportCost/ReportSell)*100;
  qrlblReportCostPerc.caption := formatfloat('0.00%',rCostPerc);

  qrlblReportSell.caption := formatfloat('#,##0.00',ReportSell);
  qrlblReportCost.caption := formatfloat('#,##0.00',ReportCost);
  qrlblReportMargin.caption := formatfloat('#,##0.00',ReportMargin);
  qrlblReportVat.caption := formatfloat('#,##0.00',ReportVat);
  qrlblReportTotal.caption := formatfloat('#,##0.00',ReportTotal);
end;

procedure TfrmwtRPSalesbyInvoice.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Invoice No"'
    + ',"Date"'
    + ',"Customer"'
    + ',"Account Code"'
    + ',"Category"'
    + ',"Office Contact"'
    + ',"Customer Type"'
    + ',"Rep"'
    + ',"Sales Order"'
    + ',"Description"'
    + ',"Sales Value"'
    + ',"Vat Value"'
    + ',"Total"'
    + ',"Cost"'
    + ',"Margin"'
    + ',"Cost Percentage"'
    + ',"Revenue Centre"'
    + ',"Charge Type"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPSalesbyInvoice.qrsbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Invoice
    tempStr := '"' + qryReport.fieldbyname('Invoice_no').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Invoice_Date').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Account Code
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Code').asstring + '"';

    //Category
    if qryReport.fieldbyname('Is_Retail_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Retail' + '"'
    else
    if qryReport.fieldbyname('Is_Commercial_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Commercial' + '"'
    else
      tempStr := tempStr + ',"' + 'Trade' + '"';


    //Account Manager/Office Contact
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Manager_Name').asstring + '"';

    //Customer Type
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Type_Description').asstring + '"';

    //Rep
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring + '"';

    //Order Number
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Reference').asstring + '"';

    //Job Description
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Description').asstring + '"';

    //Goods Value
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Goods_Value').asstring + '"';

    //VAT Value
    tempStr := tempStr + ',"' + qryReport.fieldbyname('VAT_Value').asstring + '"';

    //Total Value
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Total_Value').asstring + '"';

    //Cost
    tempStr := tempStr + ',"' + qrlblCost.caption + '"';

    //Margin
    tempStr := tempStr + ',"' + qrlblMargin.caption + '"';

    //Cost Perc
    tempStr := tempStr + ',"' + qrlblCostPerc.caption + '"';

    //Revenue Centre
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Revenue_Centre_Descr').asstring + '"';

    //Charge Type
    if qryReport.fieldbyname('Is_Retail_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Retail' + '"'
    else
    if qryReport.fieldbyname('Requires_App_For_Payment').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Application for Payment' + '"'
    else
      tempStr := tempStr + ',"' + 'Invoice' + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSalesbyInvoice.prgbrExport.StepIt;
  end;
end;

procedure TfrmwtRPSalesbyInvoice.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmwtRPSalesbyInvoice.SetChargeType(const Value: integer);
begin
  FChargeType := Value;
end;

end.
