unit WTRPSIPayments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables;

type
  TfrmwtRPSIPayments = class(TForm)
    qrpDetails: TQuickRep;
    qryReport: TQuery;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortBy: TQRLabel;
    qrGroupbyText: TQRDBText;
    QRDBText3: TQRDBText;
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
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    qrlblSelection: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRDBText2: TQRDBText;
    gtQRDBText3: TQRDBText;
    gtQRDBText4: TQRDBText;
    qrGroupbyFootText: TQRDBText;
    QRLabel2: TQRLabel;
    qryReportPayment: TIntegerField;
    qryReportPayment_date: TDateTimeField;
    qryReportPaid_Amount: TFloatField;
    qryReportPayment_Method: TIntegerField;
    qryReportPayment_Method_Description: TStringField;
    qryReportPayment_Description: TStringField;
    qryReportSales_Order: TIntegerField;
    qryReportCustomer_Name: TStringField;
    qryReportSales_Invoice: TIntegerField;
    qryReportRep: TIntegerField;
    qryReportRep_Name: TStringField;
    qryReportIs_Retail_Customer: TStringField;
    qryReportInvoice_no: TStringField;
    gtQRLabel6: TQRLabel;
    gtQRDBText5: TQRDBText;
    qryReportAccount_Code: TStringField;
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
  frmwtRPSIPayments: TfrmwtRPSIPayments;

implementation

uses wtDataModule, WTRSSIPayments;

{$R *.dfm}

procedure TfrmwtRPSIPayments.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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
        qrbGroupHeader.Expression := 'qryReport.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
      end;
    2:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryReport.Rep_Name';
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

procedure TfrmwtRPSIPayments.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  CustomerGoods := CustomerGoods + qryReport.fieldbyname('Goods_Value').asfloat;
//  CustomerVAT := CustomerVat + qryReport.fieldbyname('Vat_Value').asfloat;
  CustomerTotal := CustomerTotal + qryReport.fieldbyname('Paid_Amount').asfloat;

//  ReportGoods := ReportGoods +  qryReport.fieldbyname('Goods_Value').asfloat;
//  ReportVAT := ReportVAT +  qryReport.fieldbyname('Vat_Value').asfloat;
  ReportTotal := ReportTotal +  qryReport.fieldbyname('Paid_Amount').asfloat;
end;

procedure TfrmwtRPSIPayments.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;
end;

procedure TfrmwtRPSIPayments.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustTotal.caption := formatfloat('£#,##0.00',CustomerTotal);
end;

function TfrmwtRPSIPayments.GetDetails: integer;
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
      qryReport.SQL.Add(' AND (');
      for icount := 0 to pred(customerList.Count) do
        begin
          if iCount = 0 then
            qryReport.SQL.Add('(Sales_Order.Customer = ' + customerList[iCount] + ')')
          else
            qryReport.SQL.Add(' OR (Sales_Order.Customer = ' + customerList[iCount] + ')')
        end;
      qryReport.SQL.Add(')');
    end;

  case sortby of
    0:begin
        qryReport.SQL.Add('ORDER BY Payment.Payment_Date, Payment.Payment');
      end;
    1:begin
        qryReport.SQL.Add('ORDER BY Sales_Order.Customer_Name, Payment.Payment_Date, Payment.Payment');
      end;
    2:begin
        qryReport.SQL.Add('ORDER BY Rep.Rep_Name, Payment.Payment_Date, Payment.Payment');
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

//  qryReport.parambyname('Customer_List').asstring := customerList;
//  qryReport.parambyname('Customer').asinteger := customer;
  qryReport.parambyname('Rep').asinteger := rep;
  qryReport.parambyname('Date_From').Asdatetime := Datefrom;
  qryReport.parambyname('Date_To').Asdatetime := DateTo;
  qryReport.Open;
  result := qryReport.recordcount;
end;

procedure TfrmwtRPSIPayments.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportTotal.caption := formatfloat('£#,##0.00',ReportTotal);
end;

procedure TfrmwtRPSIPayments.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPSIPayments.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

(*  tempStr := '"Payment Date"'
    + ',"Sales Order"'
    + ',"Invoice Number"'
    + ',"Customer"'
    + ',"Rep"'
    + ',"Description"'
    + ',"Payment Method"'
    + ',"Amount"';
*)

  tempStr := '"Date"'
    + ',"Amount"'
    + ',"Payee"'
    + ',"Description"'
    + ',"Reference"'
    + ',"Cheque Number"';

  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPSIPayments.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Date
    tempStr := '"' + qryReport.fieldbyname('Payment_Date').asstring + '"';

    //Total Value
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Paid_Amount').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Descripton
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Payment_Description').asstring + '"';

    //Sales Order
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Sales_Order').asstring + '"';

    //Cheque
    tempStr := tempStr + ',"' + '' + '"';

(*    //Date
    tempStr := '"' + qryReport.fieldbyname('Payment_Date').asstring + '"';

    //Sales Order
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Sales_Order').asstring + '"';

    //Invoice NUmber
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Invoice_No').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Job Number
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring + '"';

    //Descripton
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Payment_Description').asstring + '"';

    //Method
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Payment_Method_Description').asstring + '"';

    //Total Value
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Paid_Amount').asstring + '"';

*)
    writeln(self.exportFile, tempStr);
    frmWTRSSIPayments.prgbrExport.StepIt;
  end;
end;

procedure TfrmwtRPSIPayments.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmwtRPSIPayments.FormCreate(Sender: TObject);
begin
  customerList := TStringList.Create;
end;

procedure TfrmwtRPSIPayments.FormDestroy(Sender: TObject);
begin
  customerList.Free;
end;

end.
