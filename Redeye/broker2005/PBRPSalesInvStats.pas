unit PBRPSalesInvStats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, DBTables, QRCtrls, printers, qrprntr, CCSCommon;

type
  TPBRPSalesInvStatsFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    QRLabel1: TQRLabel;
    qrgrpRepHeader: TQRGroup;
    qryReport: TQuery;
    qrDetails: TQRSubDetail;
    qrbPeriodFooter: TQRBand;
    qrlblSalesInvoiceCount: TQRLabel;
    qrlblSalesCreditCount: TQRLabel;
    qrlblPurchaseOrderCount: TQRLabel;
    qrlblJobBagCount: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    qrlblSalesInvoiceValue: TQRLabel;
    qrlblSalesCreditValue: TQRLabel;
    qryGetPOs: TQuery;
    qryGetJobBags: TQuery;
    QRLabel14: TQRLabel;
    qrlblNewClientCount: TQRLabel;
    qryGetNewClients: TQuery;
    qrgrpPeriodHeader: TQRGroup;
    qryDummy: TQuery;
    qrlblName: TQRLabel;
    qrdbTextName: TQRDBText;
    qrbRepFooter: TQRBand;
    QRLabel17: TQRLabel;
    QRShape1: TQRShape;
    qrlblRepInvoiceCount: TQRLabel;
    qrlblRepInvoiceValue: TQRLabel;
    qrlblRepCreditCount: TQRLabel;
    qrlblRepCreditValue: TQRLabel;
    qrlblRepPOCount: TQRLabel;
    qrlblRepJobBagCount: TQRLabel;
    qrlblRepClientCount: TQRLabel;
    qrbReportTotal: TQRBand;
    QRLabel16: TQRLabel;
    QRShape2: TQRShape;
    qrlblTotalInvoiceCount: TQRLabel;
    qrlblTotalInvoiceValue: TQRLabel;
    qrlblTotalCreditCount: TQRLabel;
    qrlblTotalCreditValue: TQRLabel;
    qrlblTotalPOCount: TQRLabel;
    qrlblTotalJobBagCount: TQRLabel;
    qrlblTotalClientCount: TQRLabel;
    procedure qrDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpRepHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPeriodFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgrpPeriodHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrbRepFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbReportTotalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    iInvoices, iCredits, iPOs, iJobBags, iClients: integer;
    iRepInvoices, iRepCredits, iRepPOs, iRepJobBags, iRepClients: integer;
    iTotalInvoices, iTotalCredits, iTotalPOs, iTotalJobBags, iTotalClients: integer;
    iInvoiceValue, iCreditValue: real;
    iRepInvoiceValue, iRepCreditValue: real;
    iTotalInvoiceValue, iTotalCreditValue: real;
    iRep, iCustomer: integer;
  public
    FirstPeriod, LastPeriod: integer;
    SortBy: integer;
    function GetDetails: integer;
  end;

var
  PBRPSalesInvStatsFrm: TPBRPSalesInvStatsFrm;

implementation

{$R *.dfm}

procedure TPBRPSalesInvStatsFrm.qrDetailsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
// don't count if not a record
  if qryReport.FieldByName('Sales_Invoice').asstring = '' then
    begin
      printBand := false;
      exit;
    end;

  if qryReport.FieldByName('Invoice_or_Credit').asstring = 'C' then
    begin
      inc(iCredits);
      iCreditValue := iCreditValue + qryReport.FieldByName('Total_Invoice_Value').asinteger;
    end
  else
    begin
      inc(iInvoices);
      iInvoiceValue := iInvoiceValue + qryReport.FieldByName('Total_Invoice_Value').asinteger;
    end;

  printBand := false;
end;

procedure TPBRPSalesInvStatsFrm.qrgrpRepHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  iRepInvoices := 0;
  iRepCredits := 0;
  iRepPOs := 0;
  iRepJobBags := 0;
  iRepClients := 0;

  iRepInvoiceValue := 0.00;
  iRepCreditValue := 0.00;

  case SortBy of
    0:    begin
            iRep := 0;
            iCustomer := 0;
          end;
    1:    begin
            iRep := qryReport.fieldbyname('Rep').asinteger;
            icustomer := 0;
          end;
    2:    begin
            iRep := 0;
            icustomer := qryReport.fieldbyname('Customer').asinteger;
          end;
  end;
end;

function TPBRPSalesInvStatsFrm.GetDetails: integer;
var
  temptext: string;
begin
  case sortby of
    0:  temptext := ' ORDER BY Period.Period, Customer_Name, Rep_Name';
    1:  temptext := ' ORDER BY Rep_Name, Period.Period';
    2:  temptext := ' ORDER BY Customer_Name, Period.Period';
  end;

  with qryReport do
    begin
      close;
      sql.Clear;
      sql.Text := qryDummy.SQL.Text;
      sql.Add(temptext);
      parambyname('Rep').asinteger := 0;
      parambyname('First_Period').asinteger := FirstPeriod;
      parambyname('Last_Period').asinteger := LastPeriod;
      open;

      result := recordcount;
    end;
end;

procedure TPBRPSalesInvStatsFrm.qrbPeriodFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with qryGetPOs do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Rep').asinteger := iRep;
      parambyname('Date_From').asdatetime := qryReport.fieldbyname('Start_Date').asdatetime;
      parambyname('Date_To').asdatetime := qryReport.fieldbyname('Period_End_Date').asdatetime;
      open;

      iPOs := fieldbyname('Purchase_Order_Count').asinteger
    end;

  with qryGetJobBags do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      parambyname('Rep').asinteger := iRep;
      parambyname('Date_From').asdatetime := qryReport.fieldbyname('Start_Date').asdatetime;
      parambyname('Date_To').asdatetime := qryReport.fieldbyname('Period_End_Date').asdatetime;
      open;

      iJobBags := fieldbyname('Job_Bag_Count').asinteger
    end;

  with qryGetNewClients do
    begin
      close;
      parambyname('Rep').asinteger := iRep;
      parambyname('Date_From').asdatetime := qryReport.fieldbyname('Start_Date').asdatetime;
      parambyname('Date_To').asdatetime := qryReport.fieldbyname('Period_End_Date').asdatetime;
      open;

      iClients := fieldbyname('customer_Count').asinteger
    end;

// Set Rep/Customer values
  iRepInvoices := iRepInvoices + iInvoices;
  iRepCredits := iRepCredits + iCredits;
  iRepPOs := iRepPOs + iPOs;
  iRepJobBags := iRepJobBags + iJobBags;
  iRepClients := iRepClients + iClients;

  iRepInvoiceValue := iRepInvoiceValue + iInvoiceValue;
  iRepCreditValue := iRepCreditValue + iCreditValue;

// Set Report total values
  iTotalInvoices := iTotalInvoices + iInvoices;
  iTotalCredits := iTotalCredits + iCredits;
  iTotalPOs := iTotalPOs + iPOs;
  iTotalJobBags := iTotalJobBags + iJobBags;
  iTotalClients := iTotalClients + iClients;

  iTotalInvoiceValue := iTotalInvoiceValue + iInvoiceValue;
  iTotalCreditValue := iTotalCreditValue + iCreditValue;

  qrlblSalesInvoiceCount.caption := inttostr(iInvoices);
  qrlblSalesCreditCount.caption := inttostr(iCredits);
  qrlblPurchaseOrderCount.caption := inttostr(iPOs);
  qrlblJobBagCount.caption := inttostr(iJobBags);
  qrlblNewClientCount.caption := inttostr(iClients);

  qrlblSalesInvoiceValue.caption := formatfloat('£#,###,##0',iInvoiceValue);
  qrlblSalesCreditValue.caption := formatfloat('£#,###,##0',iCreditValue);
end;

procedure TPBRPSalesInvStatsFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  case sortby of
    0:  begin
          qrgrpRepHeader.Expression := '';
          qrgrpRepHeader.Enabled := false;
          qrbRepFooter.Enabled := false;
        end;
    1:  begin
          qrgrpRepHeader.Expression := 'qryReport.Rep_Name';
          qrdbtextname.datafield := 'Rep_Name';
          qrlblname.caption := 'Rep: ';
          qrgrpRepHeader.Enabled := true;
          qrbRepFooter.Enabled := true;
        end;
    2:  begin
          qrgrpRepHeader.Expression := 'qryReport.Customer_Name';
          qrdbtextname.datafield := 'Customer_Name';
          qrlblname.caption := 'Customer: ';
          qrgrpRepHeader.Enabled := true;
          qrbRepFooter.Enabled := true;
        end;
  end;

  iTotalInvoices := 0;
  iTotalCredits := 0;
  iTotalPOs := 0;
  iTotalJobBags := 0;
  iTotalClients := 0;

  iTotalInvoiceValue := 0.00;
  iTotalCreditValue := 0.00;

end;

procedure TPBRPSalesInvStatsFrm.qrgrpPeriodHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iInvoices := 0;
  iCredits := 0;
  iPOs := 0;
  iJobBags := 0;
  iClients := 0;

  iInvoiceValue := 0.00;
  iCreditValue := 0.00;
end;

procedure TPBRPSalesInvStatsFrm.FormCreate(Sender: TObject);
begin
  iRep := 0;
  iCustomer := 0;
end;

procedure TPBRPSalesInvStatsFrm.qrbRepFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblRepInvoiceCount.caption := inttostr(iRepInvoices);
  qrlblRepCreditCount.caption := inttostr(iRepCredits);
  qrlblRepPOCount.caption := inttostr(iRepPOs);
  qrlblRepJobBagCount.caption := inttostr(iRepJobBags);
  qrlblRepClientCount.caption := inttostr(iRepClients);

  qrlblRepInvoiceValue.caption := formatfloat('£#,###,##0',iRepInvoiceValue);
  qrlblRepCreditValue.caption := formatfloat('£#,###,##0',iRepCreditValue);
end;

procedure TPBRPSalesInvStatsFrm.qrbReportTotalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotalInvoiceCount.caption := inttostr(iTotalInvoices);
  qrlblTotalCreditCount.caption := inttostr(iTotalCredits);
  qrlblTotalPOCount.caption := inttostr(iTotalPOs);
  qrlblTotalJobBagCount.caption := inttostr(iTotalJobBags);
  qrlblTotalClientCount.caption := inttostr(iTotalClients);

  qrlblTotalInvoiceValue.caption := formatfloat('£#,###,##0',iTotalInvoiceValue);
  qrlblTotalCreditValue.caption := formatfloat('£#,###,##0',iTotalCreditValue);
end;

end.
