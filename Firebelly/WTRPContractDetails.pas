unit WTRPContractDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, gtQrCtrls;

type
  TfrmwtRPContractDetails = class(TForm)
    qrpDetails: TQuickRep;
    qryReport: TQuery;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortBy: TgtQRLabel;
    qrGroupbyText: TgtQRDBText;
    qrbGroupFooter: TQRBand;
    qrlblCustTotal4: TgtQRLabel;
    QRShape1: TgtQRShape;
    QRBand2: TQRBand;
    QRLabel10: TgtQRLabel;
    qrlblReportTotal1: TgtQRLabel;
    QRShape2: TgtQRShape;
    QRBand1: TQRBand;
    qrlblCaption: TgtQRLabel;
    QRSysData1: TgtQRSysData;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    qrlblDateRange: TgtQRLabel;
    qrGroupbyFootText: TgtQRDBText;
    QRLabel2: TgtQRLabel;
    QRSysData2: TgtQRSysData;
    qrlblSelection: TgtQRLabel;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    qrbQuoteHeader: TQRGroup;
    qrbQuoteFooter: TQRBand;
    QRDBText3: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRDBText8: TgtQRDBText;
    QRDBText10: TgtQRDBText;
    gtQRDBText1: TgtQRDBText;
    qrlblOption1: TgtQRLabel;
    qrlblOption4: TgtQRLabel;
    qrlblOption5: TgtQRLabel;
    qrlblOption6: TgtQRLabel;
    qrlblOption2: TgtQRLabel;
    qrlblOption3: TgtQRLabel;
    qrlblOption7: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    gtQRDBText2: TgtQRDBText;
    gtQRDBText3: TgtQRDBText;
    qrlblCustTotal5: TgtQRLabel;
    qrlblCustTotal6: TgtQRLabel;
    qrlblCustTotal1: TgtQRLabel;
    qrlblCustTotal2: TgtQRLabel;
    qrlblCustTotal3: TgtQRLabel;
    qrlblCustTotal7: TgtQRLabel;
    qrlblReportTotal7: TgtQRLabel;
    qrlblReportTotal2: TgtQRLabel;
    qrlblReportTotal3: TgtQRLabel;
    qrlblReportTotal4: TgtQRLabel;
    qrlblReportTotal5: TgtQRLabel;
    qrlblReportTotal6: TgtQRLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qrbQuoteFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbQuoteHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbQuoteFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    FCustomerCategory: integer;
    procedure SetCustomerCategory(const Value: integer);
  public
    SortBy: integer;
    customer, rep: integer;
    customerList: TstringList;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    OptionValues: array[1..8] of real;
    CustomerValues: array[1..8] of real;
    ReportValues: array[1..8] of real;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPContractDetails: TfrmwtRPContractDetails;

implementation

uses wtDataModule, WTRSContractDetails;

{$R *.dfm}

procedure TfrmwtRPContractDetails.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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
        qrbGroupHeader.Expression := 'qryReport.Contract_Date';
        qrGroupByText.DataField := 'Contract_Date';
        qrlblSortBy.Caption := 'Contract Date';
      end;
    2:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryReport.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
      end;
    3:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryReport.Rep_Name';
        qrGroupByText.DataField := 'Rep_Name';
        qrlblSortBy.Caption := 'Rep';
      end;
  end;

  qrGroupByFootText.DataField := qrGroupByText.DataField;
end;

procedure TfrmwtRPContractDetails.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qryReport.FieldByName('Number_of_units').asinteger = 0 then
    OptionValues[qryReport.FieldByName('Option_Number').asinteger] := OptionValues[qryReport.FieldByName('Option_Number').asinteger]
                                                                    + ((qryReport.FieldByName('Nett_Price').asfloat
                                                                    - qryReport.FieldByName('Discount_Value').asfloat
                                                                    + qryReport.FieldByName('Markup_Value').asfloat
                                                                    + qryReport.FieldByName('Installation_Price').asfloat
                                                                    + qryReport.FieldByName('Delivery_Price').asfloat
                                                                    + qryReport.FieldByName('Survey_Price').asfloat) * 1)
  else
    OptionValues[qryReport.FieldByName('Option_Number').asinteger] := OptionValues[qryReport.FieldByName('Option_Number').asinteger]
                                                                    + ((qryReport.FieldByName('Nett_Price').asfloat
                                                                    - qryReport.FieldByName('Discount_Value').asfloat
                                                                    + qryReport.FieldByName('Markup_Value').asfloat
                                                                    + qryReport.FieldByName('Installation_Price').asfloat
                                                                    + qryReport.FieldByName('Delivery_Price').asfloat
                                                                    + qryReport.FieldByName('Survey_Price').asfloat) * qryReport.FieldByName('Number_of_units').asinteger);

  printband := false;
end;

procedure TfrmwtRPContractDetails.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  icount: integer;
begin
  for icount := 1 to 8 do
    CustomerValues[icount] := 0.00;
end;

procedure TfrmwtRPContractDetails.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustTotal1.Caption := formatfloat('£#,##0.00',CustomerValues[1]);
  qrlblCustTotal2.Caption := formatfloat('£#,##0.00',CustomerValues[2]);
  qrlblCustTotal3.Caption := formatfloat('£#,##0.00',CustomerValues[3]);
  qrlblCustTotal4.Caption := formatfloat('£#,##0.00',CustomerValues[4]);
  qrlblCustTotal5.Caption := formatfloat('£#,##0.00',CustomerValues[5]);
  qrlblCustTotal6.Caption := formatfloat('£#,##0.00',CustomerValues[6]);
  qrlblCustTotal7.Caption := formatfloat('£#,##0.00',CustomerValues[7]);
end;

function TfrmwtRPContractDetails.GetDetails: integer;
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
            qryReport.SQL.Add('(Contract_Quote.Customer = ' + customerList[iCount] + ')')
          else
            qryReport.SQL.Add(' OR (Contract_Quote.Customer = ' + customerList[iCount] + ')')
        end;
      qryReport.SQL.Add(')');
    end;

  case sortby of
    0:begin
        qryReport.SQL.Add('ORDER BY Contract_Quote.Quote_Number, Contract_Quote_Line.Line_Number, Contract_Quote_Line_Option.Option_Number');
      end;
    1:begin
        qryReport.SQL.Add('ORDER BY Contract_Quote.Contract_Date, Contract_Quote.Quote_Number, Contract_Quote_Line.Line_Number, Contract_Quote_Line_Option.Option_Number');
      end;
    2:begin
        qryReport.SQL.Add('ORDER BY Contract_Quote.Customer_Name, Contract_Quote.Quote_Number, Contract_Quote_Line.Line_Number, Contract_Quote_Line_Option.Option_Number');
      end;
    3:begin
        qryReport.SQL.Add('ORDER BY Rep.Rep_Name, Contract_Quote.Quote_Number, Contract_Quote_Line.Line_Number, Contract_Quote_Line_Option.Option_Number');
      end;
  end;

  qryReport.Close;

(*  case CustomerCategory of
    0: qryReport.parambyname('TradeRetail').asstring := 'A';
    1: qryReport.parambyname('TradeRetail').asstring := 'N';
    2: qryReport.parambyname('TradeRetail').asstring := 'Y';
  end;
*)

  qryReport.parambyname('Rep').asinteger := rep;
  qryReport.parambyname('Date_From').Asdatetime := Datefrom;
  qryReport.parambyname('Date_To').Asdatetime := DateTo;
  qryReport.Open;
  result := qryReport.recordcount;
end;

procedure TfrmwtRPContractDetails.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportTotal1.Caption := formatfloat('£#,##0.00',ReportValues[1]);
  qrlblReportTotal2.Caption := formatfloat('£#,##0.00',ReportValues[2]);
  qrlblReportTotal3.Caption := formatfloat('£#,##0.00',ReportValues[3]);
  qrlblReportTotal4.Caption := formatfloat('£#,##0.00',ReportValues[4]);
  qrlblReportTotal5.Caption := formatfloat('£#,##0.00',ReportValues[5]);
  qrlblReportTotal6.Caption := formatfloat('£#,##0.00',ReportValues[6]);
  qrlblReportTotal7.Caption := formatfloat('£#,##0.00',ReportValues[7]);
end;

procedure TfrmwtRPContractDetails.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  icount: integer;
begin
  for icount := 1 to 8 do
    ReportValues[icount] := 0.00;
end;

procedure TfrmwtRPContractDetails.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Quote"'
    + ',"Contract Date"'
    + ',"Expiry Date"'
    + ',"Customer"'
    + ',"Rep"'
    + ',"Developer"'
    + ',"Site Location"'
    + ',"Option 1"'
    + ',"Option 2"'
    + ',"Option 3"'
    + ',"Option 4"'
    + ',"Option 5"'
    + ',"Option 6"'
    + ',"Option 7"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPContractDetails.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmwtRPContractDetails.FormCreate(Sender: TObject);
begin
  customerList := TStringList.Create;
end;

procedure TfrmwtRPContractDetails.FormDestroy(Sender: TObject);
begin
  customerList.Free;
end;

procedure TfrmwtRPContractDetails.qrbQuoteFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  iCount: integer;
begin
  qrlblOption1.Caption := formatfloat('£#,##0.00',OptionValues[1]);
  qrlblOption2.Caption := formatfloat('£#,##0.00',OptionValues[2]);
  qrlblOption3.Caption := formatfloat('£#,##0.00',OptionValues[3]);
  qrlblOption4.Caption := formatfloat('£#,##0.00',OptionValues[4]);
  qrlblOption5.Caption := formatfloat('£#,##0.00',OptionValues[5]);
  qrlblOption6.Caption := formatfloat('£#,##0.00',OptionValues[6]);
  qrlblOption7.Caption := formatfloat('£#,##0.00',OptionValues[7]);

  for iCount := 0 to 8 do
    begin
      CustomerValues[iCount] := CustomerValues[iCount] + OptionValues[iCount];
      ReportValues[iCount] := ReportValues[iCount] + OptionValues[iCount];
    end;
end;

procedure TfrmwtRPContractDetails.qrbQuoteHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  iCount: integer;
begin
  for icount := 1 to 7 do
    OptionValues[icount] := 0.00;
end;

procedure TfrmwtRPContractDetails.qrbQuoteFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  icount: integer;
  tempstr: string;
begin
  if self.exporting then
  begin
    //Quote
    tempStr := '"' + qryReport.fieldbyname('Quote_Number').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Contract_Date').asstring + '"';

    //expiry date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Expiry_Date').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Rep
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring + '"';

    //Developer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Developer').asstring + '"';

    //Location
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Site_Location').asstring + '"';

    //Option 1
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',OptionValues[1]) + '"';

    //Option 2
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',OptionValues[2]) + '"';

    //Option 3
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',OptionValues[3]) + '"';

    //Option 4
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',OptionValues[4]) + '"';

    //Option 5
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',OptionValues[5]) + '"';

    //Option 6
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',OptionValues[6]) + '"';

    //Option 7
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',OptionValues[7]) + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSContractDetails.prgbrExport.StepIt;
  end;

  for icount := 1 to 8 do
    OptionValues[icount] := 0.00;
end;

end.
