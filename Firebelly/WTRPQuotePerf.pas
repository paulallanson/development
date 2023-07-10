unit WTRPQuotePerf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, gtQrCtrls;

type
  TfrmwtRPQuotePerf = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblCaption: TgtQRLabel;
    QRSysData1: TgtQRSysData;
    qryQuotes: TQuery;
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
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRLabel1: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    qrlTotal: TgtQRLabel;
    qrbCustomerFooter: TQRBand;
    QRLabel13: TgtQRLabel;
    qrlblCustTotal: TgtQRLabel;
    QRShape1: TgtQRShape;
    qrlComplete: TgtQRLabel;
    QRBand2: TQRBand;
    QRLabel10: TgtQRLabel;
    qrlblReportTotal: TgtQRLabel;
    QRShape2: TgtQRShape;
    qrlblDateRange: TgtQRLabel;
    QRLabel15: TgtQRLabel;
    QRLabel16: TgtQRLabel;
    qrlblCount: TgtQRLabel;
    QRLabel17: TgtQRLabel;
    qrlblConverted: TgtQRLabel;
    QRLabel18: TgtQRLabel;
    qrlblRate: TgtQRLabel;
    QRSysData2: TgtQRSysData;
    QRDBText9: TgtQRDBText;
    QRLabel19: TgtQRLabel;
    qrlblTotalCount: TgtQRLabel;
    QRLabel21: TgtQRLabel;
    qrlblTotalConverted: TgtQRLabel;
    QRLabel23: TgtQRLabel;
    qrlblTotalRate: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    qrlblTelephone: TgtQRLabel;
    qrlInstallationPrice: TgtQRLabel;
    qrlSurveyPrice: TgtQRLabel;
    qrlDeliveryPrice: TgtQRLabel;
    qrlblRequote: TgtQRLabel;
    gtQRLabel1: TgtQRLabel;
    qryReQuote: TQuery;
    qrlblStatus: TgtQRLabel;
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
    procedure qrgCustomerHeadBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    QuoteCount: integer;
    QuoteConverted: integer;
    TotalCount: integer;
    TotalConverted: integer;
    CustomerTotal, ReportTotal: real;
    FCustomerCategory: integer;
    procedure SetCustomerCategory(const Value: integer);
  public
    customer, Operator: integer;
    DateFrom, DateTo: TDateTime;
    OriginalQuote: integer;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPQuotePerf: TfrmwtRPQuotePerf;

implementation

uses wtDataModule, wtRSQuotePerf;

{$R *.dfm}

procedure TfrmwtRPQuotePerf.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QuoteCount := 0;
  QuoteConverted := 0;
  TotalCount := 0;
  TotalConverted := 0;
  CustomerTotal := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPQuotePerf.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
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
                      qryQuotes.fieldbyname('Discount_Value').asfloat + qryQuotes.fieldbyname('Markup_Value').asfloat + qryQuotes.fieldbyname('Waste_Value').asfloat;

  CompleteTotal := (CompleteTotal + RequoteCompleteTotal);

  QuoteTotal := CompleteTotal + ReQuoteTotal +
                      qryQuotes.fieldbyname('Installation_Price').asfloat +
                      qryQuotes.fieldbyname('Survey_Price').asfloat +
                      qryQuotes.fieldbyname('Delivery_Price').asfloat;

  CompleteTotal := CompleteTotal/(RequoteCount + 1);
  QuoteTotal := QuoteTotal/(RequoteCount + 1);

  VATTotal := QuoteTotal * (qryQuotes.fieldbyname('VAT_Rate').asfloat/100);

  qrlInstallationPrice.caption := formatfloat('0.00',(qryQuotes.fieldbyname('Installation_Price').asfloat+ReQuoteInstall)/(RequoteCount + 1));
  qrlSurveyPrice.caption := formatfloat('0.00',(qryQuotes.fieldbyname('Survey_Price').asfloat+ReQuoteSurvey)/(RequoteCount + 1));
  qrlDeliveryPrice.caption := formatfloat('0.00',(qryQuotes.fieldbyname('Delivery_Price').asfloat+ReQuoteDelivery)/(RequoteCount + 1));
  qrlComplete.caption := formatfloat('0.00',CompleteTotal);
  qrlTotal.caption := formatfloat('0.00',(QuoteTotal));

  qrlblrequote.caption := formatfloat('0',qryQuotes.fieldbyname('Requote_Count').asfloat);

  CustomerTotal := CustomerTotal + QuoteTotal;
  QuoteCount := QuoteCount + 1;
  TotalCount := TotalCount + 1;
  if (qryQuotes.fieldbyname('Quote_Status').asinteger > 20) or (RequoteStatus > 20) then
    begin
      if RequoteStatus > 20 then
        qrlblStatus.caption := 'Requote Converted'
      else
        qrlblStatus.caption := qryQuotes.fieldbyname('Quote_Status_description').asstring;

      QuoteConverted := QuoteConverted + 1;
      TotalConverted := TotalConverted + 1;
    end
  else
    qrlblStatus.caption := qryQuotes.fieldbyname('Quote_Status_description').asstring;

  if qryQuotes.fieldbyname('inactive').asstring = 'Y' then
    qrlblStatus.caption := 'Quote Declined';
end;

procedure TfrmwtRPQuotePerf.qrbCustomerFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerTotal := 0.00;
  QuoteCount := 0;
  QuoteConverted := 0;
end;

procedure TfrmwtRPQuotePerf.qrbCustomerFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rRate: real;
begin
  ReportTotal := ReportTotal + CustomerTotal;
  qrlblCustTotal.caption := formatfloat('0.00',CustomerTotal);

  rRate := (QuoteConverted/QuoteCount)*100;

  qrlblCount.caption := inttostr(QuoteCount);
  qrlblConverted.caption := inttostr(QuoteConverted);
  qrlblRate.caption := formatfloat('##0.00',rRate);
end;

function TfrmwtRPQuotePerf.GetDetails: integer;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
var
  stext: string;
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
      parambyname('Operator').asinteger := operator;
      parambyname('Date_From').Asdatetime := Datefrom;
      parambyname('Date_To').Asdatetime := DateTo;
      stext := SQL.text;
      Open;
    end;
end;

procedure TfrmwtRPQuotePerf.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rRate: real;
begin
  qrlblReportTotal.caption := formatfloat('0.00',ReportTotal);

  rRate := (TotalConverted/TotalCount)*100;

  qrlblTotalCount.caption := inttostr(TotalCount);
  qrlblTotalConverted.caption := inttostr(TotalConverted);
  qrlblTotalRate.caption := formatfloat('##0.00',rRate);
end;

procedure TfrmwtRPQuotePerf.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPQuotePerf.ExporttoFile(filename: string);
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
    + ',"Telephone"'
    + ',"Office Contact"'
    + ',"Description"'
    + ',"Reference"'
    + ',"Complete"'
    + ',"Install"'
    + ',"Survey"'
    + ',"Delivery"'
    + ',"Total"'
    + ',"Status"'
    + ',"Requotes"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPQuotePerf.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
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
    if qryQuotes.fieldbyname('Is_Retail_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Retail_Telephone').asstring + '"'
    else
      tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Telephone_Number').asstring + '"';

    //Office Contact
    tempStr := tempStr + ',"' + qryQuotes.fieldbyname('Operator_Name').asstring + '"';

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

    //Total Value
    tempStr := tempStr + ',"' + qrlTotal.caption + '"';

    //Status
    tempStr := tempStr + ',"' + qrlblStatus.caption + '"';

    //Requote Count
    tempStr := tempStr + ',"' + qrlblRequote.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSQuotePerf.prgbrExport.StepIt;
  end;
end;

procedure TfrmwtRPQuotePerf.qrgCustomerHeadBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  OriginalQuote := 0;

  if qryQuotes.fieldbyname('Is_Retail_Customer').asstring = 'Y' then
    qrlblTelephone.Caption := qryQuotes.fieldbyname('Retail_Telephone').asstring
  else
    qrlblTelephone.Caption := qryQuotes.fieldbyname('Telephone_Number').asstring;

end;

procedure TfrmwtRPQuotePerf.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

end.
