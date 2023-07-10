unit WTRPJobValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, gtQrCtrls;

type
  TfrmWTRPJobValue = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblCaption: TgtQRLabel;
    QRSysData1: TgtQRSysData;
    qryJobs: TQuery;
    qrgCustomerHead: TQRGroup;
    qrsbDetails: TQRSubDetail;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRDBText8: TgtQRDBText;
    QRDBText10: TgtQRDBText;
    QRDBText11: TgtQRDBText;
    QRLabel1: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    qrlTotal: TgtQRLabel;
    qrbCustomerFooter: TQRBand;
    QRLabel13: TgtQRLabel;
    qrlblCustTotal: TgtQRLabel;
    QRShape1: TgtQRShape;
    qrlComplete: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    qrlVat: TgtQRLabel;
    QRBand2: TQRBand;
    QRLabel10: TgtQRLabel;
    qrlblReportTotal: TgtQRLabel;
    QRShape2: TgtQRShape;
    qrlblDateRange: TgtQRLabel;
    QRLabel15: TgtQRLabel;
    QRDBText7: TgtQRDBText;
    QRSysData2: TgtQRSysData;
    qryJobsJob: TFloatField;
    qryJobsJob_Status: TIntegerField;
    qryJobsQuote: TIntegerField;
    qryJobsCustomer: TIntegerField;
    qryJobsContact_name: TStringField;
    qryJobsOrder_ref_no: TStringField;
    qryJobsDate_Raised: TDateTimeField;
    qryJobsDate_Required: TDateTimeField;
    qryJobsPayment_due: TDateTimeField;
    qryJobsProduction_date: TDateTimeField;
    qryJobsTemplate_date: TDateTimeField;
    qryJobsInstallation_date: TDateTimeField;
    qryJobsDeposit_amount: TFloatField;
    qryJobsDelivery_Price: TFloatField;
    qryJobsInstallation_price: TFloatField;
    qryJobsSurvey_price: TFloatField;
    qryJobsOperator: TIntegerField;
    qryJobsProduction_date_Actual: TDateTimeField;
    qryJobsTemplate_date_actual: TDateTimeField;
    qryJobsInstallation_date_actual: TDateTimeField;
    qryJobsDescription: TStringField;
    qryJobsMaterial_Type: TIntegerField;
    qryJobsExtra_Notes: TIntegerField;
    qryJobsAvailability: TIntegerField;
    qryJobsPayment_Terms: TIntegerField;
    qryJobsReference: TStringField;
    qryJobsNett_Price: TFloatField;
    qryJobsInactive: TStringField;
    qryJobsInactive_Reason: TIntegerField;
    qryJobsAddress: TIntegerField;
    qryJobsDiscount_Rate: TFloatField;
    qryJobsDiscount_Value: TFloatField;
    qryJobsCustomer_Name: TStringField;
    qryJobsInstall_Address: TIntegerField;
    qryJobsDeposit_Terms: TFloatField;
    qryJobsVAT: TIntegerField;
    qryJobsQuote_Nett_Price: TFloatField;
    qryJobsFitter: TIntegerField;
    qryJobsInstall_Name: TStringField;
    qryJobsInstall_Phone: TStringField;
    qryJobsCustomer_Name_Actual: TStringField;
    qryJobstelephone_number: TStringField;
    qryJobsJob_Status_Description: TStringField;
    qryJobsVat_Rate: TFloatField;
    qrlNetttotal: TgtQRLabel;
    QRLabel17: TgtQRLabel;
    qrlblCustNett: TgtQRLabel;
    qrlblReportNett: TgtQRLabel;
    qrlblCustVat: TgtQRLabel;
    qrlblReportVat: TgtQRLabel;
    qryJobsMarkup_Value: TFloatField;
    gtQRLabel1: TgtQRLabel;
    qrlCost: TgtQRLabel;
    qrlblCustCost: TgtQRLabel;
    qrlblReportCost: TgtQRLabel;
    qryJobsTotal_Materials: TFloatField;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbCustomerFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbCustomerFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    CustomerTotal, ReportTotal, CustomerNett, ReportNett, CustomerVat, ReportVat, CustomerCost, ReportCost: real;
    exporting: boolean;
    exportFile: textFile;
  public
    customer, rep: integer;
    DateFrom, DateTo: TDateTime;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmWTRPJobValue: TfrmWTRPJobValue;

implementation

uses wtDataModule, WTRSJobValue;

{$R *.dfm}

procedure TfrmWTRPJobValue.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  CustomerTotal := 0.00;
  ReportTotal := 0.00;
  CustomerNett := 0.00;
  ReportNett := 0.00;
  CustomerVAT := 0.00;
  ReportVAT := 0.00;
  CustomerCost := 0.00;
  ReportCost := 0.00;
end;

procedure TfrmWTRPJobValue.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CompleteTotal, JobTotal, VATTotal, CostTotal: real;

begin
  CostTotal := qryJobs.fieldbyname('Total_Materials').asfloat;

  CompleteTotal := qryJobs.fieldbyname('Nett_Price').asfloat -
                      qryJobs.fieldbyname('Discount_Value').asfloat + qryJobs.fieldbyname('Markup_Value').asfloat;


  JobTotal := CompleteTotal +
                      qryJobs.fieldbyname('Installation_Price').asfloat +
                      qryJobs.fieldbyname('Survey_Price').asfloat +
                      qryJobs.fieldbyname('Delivery_Price').asfloat;

  VATTotal := JobTotal * (qryJobs.fieldbyname('VAT_Rate').asfloat/100);

  qrlComplete.caption := formatfloat('0.00',CompleteTotal);
  qrlNettTotal.caption := formatfloat('0.00',jobTotal);
  qrlTotal.caption := formatfloat('0.00',(JobTotal+VATTotal));
  qrlVAT.caption := formatfloat('0.00',VATTotal);
  qrlCost.caption := formatfloat('0.00',CostTotal);

  CustomerTotal := CustomerTotal + JobTotal+VATTotal;
  CustomerNett := CustomerNett + JobTotal;
  CustomerVat := CustomerVat + VATTotal;
  CustomerCost := CustomerCost + strtofloat(qrlCost.caption);
end;

procedure TfrmWTRPJobValue.qrbCustomerFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerTotal := 0.00;
  CustomerNett := 0.00;
  CustomerVat := 0.00;
  CustomerCost := 0.00;
end;

procedure TfrmWTRPJobValue.qrbCustomerFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  ReportTotal := ReportTotal + CustomerTotal;
  ReportNett := ReportNett + CustomerNett;
  ReportVat := ReportVat + CustomerVat;
  ReportCost := ReportCost + CustomerCost;

  qrlblCustTotal.caption := formatfloat('0.00',CustomerTotal);
  qrlblCustNett.caption := formatfloat('0.00',CustomerNett);
  qrlblCustVAT.caption := formatfloat('0.00',CustomerVat);
  qrlblCustCost.caption := formatfloat('0.00',CustomerCost);
end;

function TfrmWTRPJobValue.GetDetails: integer;
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
  qryJobs.Close;
  qryJobs.parambyname('Customer').asinteger := customer;
  qryJobs.parambyname('Date_From').Asdatetime := Datefrom;
  qryJobs.parambyname('Date_To').Asdatetime := DateTo;
  qryJobs.Open;
  result := qryJobs.recordcount;
end;

procedure TfrmWTRPJobValue.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportNett.caption := formatfloat('0.00',ReportNett);
  qrlblReportTotal.caption := formatfloat('0.00',ReportTotal);
  qrlblReportVat.caption := formatfloat('0.00',ReportVat);
  qrlblReportCost.caption := formatfloat('0.00',ReportCost);
end;

procedure TfrmWTRPJobValue.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmWTRPJobValue.ExporttoFile(filename: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Job"'
    + ',"Date"'
    + ',"Customer"'
    + ',"Description"'
    + ',"Reference"'
    + ',"Complete"'
    + ',"Install"'
    + ',"Survey"'
    + ',"Delivery"'
    + ',"Nett"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Material Cost"'
    + ',"Status"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmWTRPJobValue.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Job
    tempStr := '"' + qryJobs.fieldbyname('Job').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qryJobs.fieldbyname('Date_Raised').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryJobs.fieldbyname('Customer_Name_Actual').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + qryJobs.fieldbyname('Description').asstring + '"';

    //Refernce
    tempStr := tempStr + ',"' + qryJobs.fieldbyname('Reference').asstring + '"';

    //Total Complete
    tempStr := tempStr + ',"' + qrlComplete.caption + '"';

    //Instalklation Price
    tempStr := tempStr + ',"' + qryJobs.fieldbyname('Installation_Price').asstring + '"';

    //Survey price
    tempStr := tempStr + ',"' + qryJobs.fieldbyname('Survey_Price').asstring + '"';

    //Delivery Price
    tempStr := tempStr + ',"' + qryJobs.fieldbyname('Delivery_Price').asstring + '"';

    //Nett
    tempStr := tempStr + ',"' + qrlNettTotal.caption + '"';

    //VAT
    tempStr := tempStr + ',"' + qrlVat.caption + '"';

    //Total Value
    tempStr := tempStr + ',"' + qrlTotal.caption + '"';

    //Material Cost
    tempStr := tempStr + ',"' + qrlCost.caption + '"';

    //Status
    tempStr := tempStr + ',"' + qryJobs.fieldbyname('Job_Status_Description').asstring + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSJobValue.prgbrExport.StepIt;
  end;
end;

end.
