unit WTRPSalesInvoicePayments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, DateUtils, gtQrCtrls;

type
  TfrmWTRPSalesInvoicePayments = class(TForm)
    qrpDetails: TQuickRep;
    qryReport: TQuery;
    qrbGroupHeader: TQRGroup;
    qrlblSortBy: TgtQRLabel;
    qrGroupbyText: TgtQRDBText;
    QRBand1: TQRBand;
    qrlblCaption: TgtQRLabel;
    QRSysData1: TgtQRSysData;
    QRLabel3: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    qrlblDateRange: TgtQRLabel;
    QRSysData2: TgtQRSysData;
    qrsbDetails: TQRSubDetail;
    QRDBText2: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    qrdbDescription: TgtQRDBText;
    QRLabel2: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText7: TgtQRDBText;
    QRDBText8: TgtQRDBText;
    qryReportSales_invoice: TIntegerField;
    qryReportInactive: TStringField;
    qryReportCustomer: TIntegerField;
    qryReportAccount_code: TStringField;
    qryReportInvoice_no: TStringField;
    qryReportInvoice_date: TDateTimeField;
    qryReportGoods_value: TFloatField;
    qryReportVat_Value: TFloatField;
    qryReportTotal_Value: TFloatField;
    qryReportSales_invoice_status: TIntegerField;
    qryReportInvoice_or_Credit: TStringField;
    qryReportdescription: TStringField;
    qryReportRep: TIntegerField;
    qryReportReference: TStringField;
    qryReportCustomer_Name: TStringField;
    qryReportInvoice_Status_description: TStringField;
    qryReportCustomer_Type_Description: TStringField;
    qryReportRep_Name: TStringField;
    qrbGroupFooter: TQRBand;
    qrGroupbyFooter: TgtQRDBText;
    QRLabel13: TgtQRLabel;
    QRShape1: TgtQRShape;
    qrlblCustTotal: TgtQRLabel;
    qrlblCustVat: TgtQRLabel;
    qrlblCustSell: TgtQRLabel;
    QRBand2: TQRBand;
    QRLabel10: TgtQRLabel;
    qrlblReportTotal: TgtQRLabel;
    QRShape2: TgtQRShape;
    qrlblReportVat: TgtQRLabel;
    qrlblReportSell: TgtQRLabel;
    qryReportAccount_Manager: TIntegerField;
    qryReportAccount_Manager_Name: TStringField;
    gtQRLabel2: TgtQRLabel;
    qrlblMargin: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    qrlblCustCost: TgtQRLabel;
    qrlblCustMargin: TgtQRLabel;
    qrlblReportCost: TgtQRLabel;
    qrlblReportMargin: TgtQRLabel;
    qryReportIs_Retail_Customer: TStringField;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    qryReportPaid_Amount: TFloatField;
    gtQRLabel3: TgtQRLabel;
    qryReportFitting_Date: TDateTimeField;
    gtQRDBText3: TgtQRDBText;
    gtQRLabel5: TgtQRLabel;
    qrlblDays: TgtQRLabel;
    qryReportIs_Commercial_Customer: TStringField;
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
    procedure SetCustomerCategory(const Value: integer);
  public
    OnlyUnPaid: boolean;
    SortBy: integer;
    customer, rep: integer;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmWTRPSalesInvoicePayments: TfrmWTRPSalesInvoicePayments;

implementation

uses wtDataModule, AllCommon, WTRSSalesInvoicePayments;

{$R *.dfm}

procedure TfrmWTRPSalesInvoicePayments.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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

procedure TfrmWTRPSalesInvoicePayments.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rMargin, rCostPerc, rCost: real;
  iDays: integer;
begin
//  qrlblFittingDate.caption := paDatestr(qryReport.fieldbyname('Fitting_Date').asdatetime);
//  qrlblFittingDate.caption := qryReport.fieldbyname('Fitting_Date').asString;
  if qryReport.fieldbyname('Fitting_Date').asDatetime <> 0 then
    iDays := DaysBetween(now, qryReport.fieldbyname('Fitting_Date').asDateTime)
  else
    iDays := 0;
  qrlblDays.caption := inttostr(iDays);

  qrlblMargin.Caption := formatfloat('#,##0.00', rCost);
  rMargin := qryReport.fieldbyname('Total_Value').asfloat - qryReport.fieldbyname('Paid_Amount').asfloat;

  qrlblMargin.Caption := formatfloat('#,##0.00', rMargin);

  if (qrlblMargin.Caption = '0.00') and OnlyUnPaid then
    begin
      PrintBand := false;
      exit;
    end;

  CustomerSell := CustomerSell + qryReport.fieldbyname('Goods_Value').asfloat;
  CustomerMargin := CustomerMargin + rMargin;
  CustomerVat := CustomerVat + qryReport.fieldbyname('Vat_Value').asfloat;
  CustomerTotal := CustomerTotal + qryReport.fieldbyname('Total_Value').asfloat;

  ReportSell := ReportSell + qryReport.fieldbyname('Goods_Value').asfloat;
  ReportMargin := ReportMargin +  rMargin;
  ReportVat := ReportVat + qryReport.fieldbyname('Vat_Value').asfloat;
  ReportTotal := ReportTotal + qryReport.fieldbyname('Total_Value').asfloat;
end;

function TfrmWTRPSalesInvoicePayments.GetDetails: integer;
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

  qryReport.parambyname('Customer').asinteger := customer;
  qryReport.parambyname('Rep').asinteger := Rep;
  qryReport.parambyname('Date_From').Asdatetime := Datefrom;
  qryReport.parambyname('Date_To').Asdatetime := DateTo;
  qryReport.Open;
  result := qryReport.recordcount;
end;

procedure TfrmWTRPSalesInvoicePayments.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmWTRPSalesInvoicePayments.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerSell := 0.00;
  CustomerCost := 0.00;
  CustomerMargin := 0.00;
  CustomerVat := 0.00;
  CustomerTotal := 0.00;
end;

procedure TfrmWTRPSalesInvoicePayments.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rCostPerc: real;
begin
  qrlblCustSell.caption := formatfloat('#,##0.00',CustomerSell);
  qrlblCustCost.caption := formatfloat('#,##0.00',CustomerCost);
  qrlblCustMargin.caption := formatfloat('#,##0.00',CustomerMargin);
  qrlblCustVat.caption := formatfloat('#,##0.00',CustomerVat);
  qrlblCustTotal.caption := formatfloat('#,##0.00',CustomerTotal);
end;

procedure TfrmWTRPSalesInvoicePayments.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rCostPerc: real;
begin
  rCostPerc := (ReportCost/ReportSell)*100;

  qrlblReportSell.caption := formatfloat('#,##0.00',ReportSell);
  qrlblReportCost.caption := formatfloat('#,##0.00',ReportCost);
  qrlblReportMargin.caption := formatfloat('#,##0.00',ReportMargin);
  qrlblReportVat.caption := formatfloat('#,##0.00',ReportVat);
  qrlblReportTotal.caption := formatfloat('#,##0.00',ReportTotal);
end;

procedure TfrmWTRPSalesInvoicePayments.ExporttoFile(filename: string);
var
  TempName: string;
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
    + ',"Amount Paid"'
    + ',"Unpaid"'
    + ',"Days Since Fit"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmWTRPSalesInvoicePayments.qrsbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting and BandPrinted then
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

    //Amount
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Paid_Amount').asstring + '"';

    //Unpaid
    tempStr := tempStr + ',"' + qrlblMargin.caption + '"';

    //Days since fit
    tempStr := tempStr + ',"' + qrlblDays.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSalesInvoicePayments.prgbrExport.StepIt;
  end;
end;

procedure TfrmWTRPSalesInvoicePayments.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

end.
