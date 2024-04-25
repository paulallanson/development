unit WTRPQuoteReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPQuoteReason = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    qryQuotes: TFDQuery;
    qrgCustomerHead: TQRGroup;
    qrsbDetails: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel1: TQRLabel;
    qryQuotesQuote: TIntegerField;
    qryQuotesDate_Required: TDateTimeField;
    qryQuotesDate_Raised: TDateTimeField;
    qryQuotesCustomer: TIntegerField;
    qryQuotesDescription: TWideStringField;
    qryQuotesOperator: TIntegerField;
    qryQuotesInstallation_price: TFloatField;
    qryQuotesDelivery_Price: TFloatField;
    qryQuotesSurvey_price: TFloatField;
    qryQuotesExtra_Notes: TIntegerField;
    qryQuotesAvailability: TIntegerField;
    qryQuotesPayment_terms: TIntegerField;
    qryQuotesReference: TWideStringField;
    qryQuotesQuote_Status: TIntegerField;
    qryQuotesNett_Price: TFloatField;
    qryQuotesInactive: TWideStringField;
    qryQuotesInactive_reason: TIntegerField;
    qryQuotesMaterial_Type: TIntegerField;
    qryQuotesAddress: TIntegerField;
    qryQuotesContact_Name: TWideStringField;
    qryQuotesVat: TIntegerField;
    qryQuotesDiscount_Rate: TFloatField;
    qryQuotesDiscount_Value: TFloatField;
    qryQuotesCustomer_Name: TWideStringField;
    qryQuotesTemplate_Date: TDateTimeField;
    qryQuotesTemplate_Date_Actual: TDateTimeField;
    qryQuotesDeposit_Terms: TFloatField;
    qryQuotesDeposit_Amount: TFloatField;
    qryQuotesInstall_Address: TIntegerField;
    qryQuotesDate_Accepted: TDateTimeField;
    qryQuotesCustomer_Name_Actual: TWideStringField;
    qryQuotesQuote_Status_Description: TWideStringField;
    QRLabel12: TQRLabel;
    qrlTotal: TQRLabel;
    qrbCustomerFooter: TQRBand;
    QRLabel13: TQRLabel;
    qrlblCustTotal: TQRLabel;
    QRShape1: TQRShape;
    qrlComplete: TQRLabel;
    QRLabel14: TQRLabel;
    qrlVat: TQRLabel;
    qryQuotesVat_Rate: TFloatField;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRShape2: TQRShape;
    qrlblDateRange: TQRLabel;
    qryQuotestelephone_number: TWideStringField;
    QRDBText9: TQRDBText;
    QRLabel15: TQRLabel;
    qrlblCount: TQRLabel;
    qryQuotesSales_Lead_Source_Descr: TWideStringField;
    QRDBText7: TQRDBText;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    qryQuotesMarkup_Value: TFloatField;
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
    exporting: boolean;
    exportFile: textFile;
    CustomerTotal, ReportTotal: real;
    QuoteCount: integer;
  public
    customer, code: integer;
    DateFrom, DateTo: TDateTime;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPQuoteReason: TfrmwtRPQuoteReason;

implementation

uses wtDataModule, wtRSQuoteSalesLead;

{$R *.dfm}

procedure TfrmwtRPQuoteReason.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QuoteCount := 0;
  CustomerTotal := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPQuoteReason.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CompleteTotal, QuoteTotal, VATTotal: real;

begin
  CompleteTotal := qryQuotes.fieldbyname('Nett_Price').asfloat -
                      qryQuotes.fieldbyname('Discount_Value').asfloat + qryQuotes.fieldbyname('Markup_Value').asfloat;


  QuoteTotal := CompleteTotal +
                      qryQuotes.fieldbyname('Installation_Price').asfloat +
                      qryQuotes.fieldbyname('Survey_Price').asfloat +
                      qryQuotes.fieldbyname('Delivery_Price').asfloat;

  VATTotal := QuoteTotal * (qryQuotes.fieldbyname('VAT_Rate').asfloat/100);

  qrlComplete.caption := formatfloat('0.00',CompleteTotal);
  qrlTotal.caption := formatfloat('0.00',(QuoteTotal+VATTotal));
  qrlVAT.caption := formatfloat('0.00',VATTotal);

  CustomerTotal := CustomerTotal + QuoteTotal+VATTotal;
  QuoteCount := QuoteCount + 1;
end;

procedure TfrmwtRPQuoteReason.qrbCustomerFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerTotal := 0.00;
  QuoteCount := 0;
end;

procedure TfrmwtRPQuoteReason.qrbCustomerFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  ReportTotal := ReportTotal + CustomerTotal;
  qrlblCustTotal.caption := formatfloat('0.00',CustomerTotal);
  qrlblCount.caption := inttostr(QuoteCount);
end;

function TfrmwtRPQuoteReason.GetDetails: integer;
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
  qryQuotes.Close;
  qryQuotes.parambyname('Customer').asinteger := Customer;
  qryQuotes.parambyname('Code').asinteger := Code;
  qryQuotes.parambyname('Date_From').Asdatetime := Datefrom;
  qryQuotes.parambyname('Date_To').Asdatetime := DateTo;
  qryQuotes.Open;
end;

procedure TfrmwtRPQuoteReason.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportTotal.caption := formatfloat('0.00',ReportTotal);
end;

procedure TfrmwtRPQuoteReason.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPQuoteReason.ExporttoFile(filename: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Quote"'
    + ',"Date"'
    + ',"Customer"'
    + ',"Category"'
    + ',"Lead Source"'
    + ',"Telephone"'
    + ',"Description"'
    + ',"Reference"'
    + ',"Complete"'
    + ',"Install"'
    + ',"Survey"'
    + ',"Delivery"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Status"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPQuoteReason.qrsbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Job
    tempStr := '"' + qryQuotes.fieldbyname('Quote').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Date_Raised').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Customer_Name').asstring + '"';

    //Category
    if qryQuotes.fieldbyname('Is_Retail_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Retail' + '"'
    else
      tempStr := tempStr + ',"' + 'Trade' + '"';

    //lead source
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Sales_lead_Source_Descr').asstring + '"';

    //telephone
    if qryQuotes.fieldbyname('Address').asinteger <> 0 then
      tempStr := tempStr + ',"' + dtmdlWorktops.GetAddressTelephone(qryQuotes.fieldbyname('Address').asinteger) + '"'
    else
      tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Telephone_Number').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Description').asstring + '"';

    //Refernce
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Reference').asstring + '"';

    //Total Complete
    tempStr := tempStr + ',"' + qrlComplete.caption + '"';

    //Instalklation Price
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Installation_Price').asstring + '"';

    //Survey price
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Survey_Price').asstring + '"';

    //Delivery Price
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Delivery_Price').asstring + '"';

    //VAT
    tempStr := tempStr + ',"' + qrlVat.caption + '"';

    //Total Value
    tempStr := tempStr + ',"' + qrlTotal.caption + '"';

    //Status
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Quote_Status_Description').asstring + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSQuoteSalesLead.prgbrExport.StepIt;
  end;
end;

end.
