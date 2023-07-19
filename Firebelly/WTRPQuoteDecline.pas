unit WTRPQuoteDecline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPQuoteDecline = class(TForm)
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
    qryQuotesDescription: TStringField;
    qryQuotesOperator: TIntegerField;
    qryQuotesInstallation_price: TFloatField;
    qryQuotesDelivery_Price: TFloatField;
    qryQuotesSurvey_price: TFloatField;
    qryQuotesExtra_Notes: TIntegerField;
    qryQuotesAvailability: TIntegerField;
    qryQuotesPayment_terms: TIntegerField;
    qryQuotesReference: TStringField;
    qryQuotesQuote_Status: TIntegerField;
    qryQuotesNett_Price: TFloatField;
    qryQuotesInactive: TStringField;
    qryQuotesInactive_reason: TIntegerField;
    qryQuotesMaterial_Type: TIntegerField;
    qryQuotesAddress: TIntegerField;
    qryQuotesContact_Name: TStringField;
    qryQuotesVat: TIntegerField;
    qryQuotesDiscount_Rate: TFloatField;
    qryQuotesDiscount_Value: TFloatField;
    qryQuotesCustomer_Name: TStringField;
    qryQuotesTemplate_Date: TDateTimeField;
    qryQuotesTemplate_Date_Actual: TDateTimeField;
    qryQuotesDeposit_Terms: TFloatField;
    qryQuotesDeposit_Amount: TFloatField;
    qryQuotesInstall_Address: TIntegerField;
    qryQuotesDate_Accepted: TDateTimeField;
    qryQuotesCustomer_Name_Actual: TStringField;
    qryQuotesQuote_Status_Description: TStringField;
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
    qryQuotestelephone_number: TStringField;
    QRDBText9: TQRDBText;
    QRLabel15: TQRLabel;
    qrlblCount: TQRLabel;
    QRDBText7: TQRDBText;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    qryQuotesMarkup_Value: TFloatField;
    qryQuotesInactive_Reason_Descr: TStringField;
    qrlblRequote: TQRLabel;
    gtQRLabel1: TQRLabel;
    qrlblStatus: TQRLabel;
    qryReQuote: TFDQuery;
    qryQuotesQuote_Number: TFloatField;
    qryQuotesOriginal_Quote: TIntegerField;
    qryQuotesRequote_Count: TIntegerField;
    qryQuotesIs_Retail_Customer: TStringField;
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
    FCustomerCategory: integer;
    procedure SetCustomerCategory(const Value: integer);
  public
    customer, code: integer;
    DateFrom, DateTo: TDateTime;
    OriginalQuote: integer;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPQuoteDecline: TfrmwtRPQuoteDecline;

implementation

uses wtDataModule, wtRSQuoteDecline;

{$R *.dfm}

procedure TfrmwtRPQuoteDecline.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QuoteCount := 0;
  CustomerTotal := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPQuoteDecline.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CompleteTotal, QuoteTotal, VATTotal: real;
  RequoteCompleteTotal, RequoteCount: real;
  RequoteTotal, RequoteInstall, RequoteSurvey, RequoteDelivery: real;
  RequoteStatus: integer;
begin
  if (qryQuotes.fieldbyname('Original_Quote').asinteger <> 0) and (qryQuotes.fieldbyname('Original_Quote').asinteger = OriginalQuote) then
    begin
      PrintBand := false;
      exit;
    end;
    
  RequoteCompleteTotal := 0.00;
  ReQuoteInstall := 0.00;
  ReQuoteSurvey := 0.00;
  ReQuoteDelivery := 0.00;
  RequoteStatus := 0;

  RequoteCount := qryQuotes.fieldbyname('Requote_Count').asfloat;
  if RequoteCount > 0 then
    begin
      with qryRequote do
        begin
          close;
          parambyname('Original_Quote').asinteger := qryQuotes.fieldbyname('Original_Quote').asinteger;
          parambyname('Quote').asinteger := qryQuotes.fieldbyname('Quote').asinteger;
          open;

          RequoteCompleteTotal := qryRequote.fieldbyname('Total_Complete').asfloat;

          ReQuoteTotal := qryReQuote.fieldbyname('Total_Install').asfloat +
                          qryReQuote.fieldbyname('Total_Survey').asfloat +
                          qryReQuote.fieldbyname('Total_Delivery').asfloat;

          ReQuoteInstall := qryReQuote.fieldbyname('Total_Install').asfloat;
          ReQuoteSurvey := qryReQuote.fieldbyname('Total_Survey').asfloat;
          ReQuoteDelivery := qryReQuote.fieldbyname('Total_Delivery').asfloat;
          RequoteStatus := qryReQuote.fieldbyname('Requote_Status').asinteger;
       end;
    end;

  CompleteTotal := qryQuotes.fieldbyname('Nett_Price').asfloat -
                      qryQuotes.fieldbyname('Discount_Value').asfloat + qryQuotes.fieldbyname('Markup_Value').asfloat;

  CompleteTotal := (CompleteTotal + RequoteCompleteTotal);

  QuoteTotal := CompleteTotal + ReQuoteTotal +
                      qryQuotes.fieldbyname('Installation_Price').asfloat +
                      qryQuotes.fieldbyname('Survey_Price').asfloat +
                      qryQuotes.fieldbyname('Delivery_Price').asfloat;

  CompleteTotal := CompleteTotal/(RequoteCount + 1);
  QuoteTotal := QuoteTotal/(RequoteCount + 1);

  VATTotal := QuoteTotal * (qryQuotes.fieldbyname('VAT_Rate').asfloat/100);

  qrlComplete.caption := formatfloat('0.00',CompleteTotal);
  qrlTotal.caption := formatfloat('0.00',(QuoteTotal+VATTotal));
  qrlVAT.caption := formatfloat('0.00',VATTotal);

  qrlblrequote.caption := formatfloat('0',qryQuotes.fieldbyname('Requote_Count').asfloat);

  CustomerTotal := CustomerTotal + QuoteTotal+VATTotal;

  if (qryQuotes.fieldbyname('Quote_Status').asinteger > 20) or (RequoteStatus > 20) then
    begin
      if RequoteStatus > 20 then
        qrlblStatus.caption := 'Requote Converted'
      else
        qrlblStatus.caption := qryQuotes.fieldbyname('Quote_Status_description').asstring;
    end
  else
    qrlblStatus.caption := qryQuotes.fieldbyname('Quote_Status_description').asstring;
  QuoteCount := QuoteCount + 1;
end;

procedure TfrmwtRPQuoteDecline.qrbCustomerFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerTotal := 0.00;
  QuoteCount := 0;
end;

procedure TfrmwtRPQuoteDecline.qrbCustomerFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  ReportTotal := ReportTotal + CustomerTotal;
  qrlblCustTotal.caption := formatfloat('0.00',CustomerTotal);
  qrlblCount.caption := inttostr(QuoteCount);
end;

function TfrmwtRPQuoteDecline.GetDetails: integer;
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
  with qryQuotes do
    begin
      close;
      case CustomerCategory of
        0:  begin
              Parambyname('Is_Retail_Customer').asstring := 'A';
              Parambyname('Is_Commercial_Customer').asstring := 'A';
            end;
        1:  begin
              ParambyName('Is_Retail_Customer').asstring := 'N';
              Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        2:  begin
              Parambyname('Is_Retail_Customer').asstring := 'Y';
              Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        3:  begin
              Parambyname('Is_Retail_Customer').asstring := 'N';
              Parambyname('Is_Commercial_Customer').asstring := 'Y';
            end;
      end;

      parambyname('Customer').asinteger := customer;
      parambyname('Code').asinteger := Code;
      parambyname('Date_From').Asdatetime := Datefrom;
      parambyname('Date_To').Asdatetime := DateTo;
      Open;
    end;
end;

procedure TfrmwtRPQuoteDecline.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportTotal.caption := formatfloat('0.00',ReportTotal);
end;

procedure TfrmwtRPQuoteDecline.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPQuoteDecline.ExporttoFile(filename: string);
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
    + ',"Decline Reason"'
    + ',"Telephone"'
    + ',"Description"'
    + ',"Reference"'
    + ',"Complete"'
    + ',"Install"'
    + ',"Survey"'
    + ',"Delivery"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Status"'
    + ',"Requotes"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPQuoteDecline.qrsbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  OriginalQuote := qryQuotes.fieldbyname('Original_Quote').asinteger;
  if self.exporting and BandPrinted then
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
    if qryQuotes.fieldbyname('Is_Commercial_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Commercial' + '"'
    else
      tempStr := tempStr + ',"' + 'Trade' + '"';

    //telephone
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Inactive_Reason_Descr').asstring + '"';

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
    tempStr := tempStr + ',"' + qrlblStatus.caption + '"';

    //Requote Count
    tempStr := tempStr + ',"' + qrlblRequote.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSQuoteDecline.prgbrExport.StepIt;
  end;
end;

procedure TfrmwtRPQuoteDecline.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

end.
