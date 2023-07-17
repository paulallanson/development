unit WTRPOutJobs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, QrCtrls;

type
  TfrmwtRPOutJobs = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortby: TQRLabel;
    qrGroupByText: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrbGroupFooter: TQRBand;
    qrlblDateRange: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    qryDetails: TQuery;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlblTotalValue: TQRLabel;
    QRDBText10: TQRDBText;
    qrlblReportTotal: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRShape2: TQRShape;
    gtQRShape3: TQRShape;
    qrlblGroupTotal: TQRLabel;
    QRSysData2: TQRSysData;
    qrGroupbyFootText: TQRDBText;
    gtQRLabel2: TQRLabel;
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
  private
    CustomerTotal, ReportTotal: real;
  public
    SortBy, ValueBy: integer;
    customer, rep: integer;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPOutJobs: TfrmwtRPOutJobs;

implementation

uses wtDataModule, wtRSOutJobs;

{$R *.dfm}

procedure TfrmwtRPOutJobs.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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
        qrbGroupHeader.Expression := 'qryDetails.Installation_Date';
        qrGroupByText.DataField := 'Installation_Date';
        qrlblSortBy.Caption := 'Fitting Date';
      end;
    2:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryDetails.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
      end;
    3:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryDetails.Job_Status';
        qrGroupByText.DataField := 'Job_Status_Description';
        qrlblSortBy.Caption := 'Status';
      end;
  end;

  qrGroupByFootText.DataField := qrGroupByText.DataField;
  CustomerTotal := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPOutJobs.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CompleteTotal, JobTotal, VATTotal: real;
begin
  if ValueBy = 0 then
    begin
      JobTotal := qryDetails.fieldbyname('Sales_Value').asfloat;
    end
  else
    begin
//      CompleteTotal := qryDetails.fieldbyname('Nett_Price').asfloat - qryDetails.fieldbyname('Discount_Value').asfloat + qryDetails.fieldbyname('Markup_Value').asfloat;

      CompleteTotal := qryDetails.fieldbyname('Nett_Price').asfloat -
                      qryDetails.fieldbyname('Discount_Value').asfloat + qryDetails.fieldbyname('Markup_Value').asfloat + qryDetails.fieldbyname('Waste_Value').asfloat;


      JobTotal := CompleteTotal +
                      qryDetails.fieldbyname('Installation_Price').asfloat +
                      qryDetails.fieldbyname('Survey_Price').asfloat +
                      qryDetails.fieldbyname('Delivery_Price').asfloat;
    end;
  qrlblTotalValue.caption := formatfloat('0.00',JobTotal);

(*  VATTotal := QuoteTotal * (qryQuotes.fieldbyname('VAT_Rate').asfloat/100);

  qrlComplete.caption := formatfloat('0.00',CompleteTotal);
  qrlTotal.caption := formatfloat('0.00',(QuoteTotal+VATTotal));
  qrlVAT.caption := formatfloat('0.00',VATTotal);

*)
  CustomerTotal := CustomerTotal + JobTotal;
  ReportTotal := ReportTotal + JobTotal;

end;

procedure TfrmwtRPOutJobs.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerTotal := 0.00;
end;

procedure TfrmwtRPOutJobs.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblGroupTotal.caption := formatfloat('0.00',CustomerTotal);
end;

function TfrmwtRPOutJobs.GetDetails: integer;
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
        qryDetails.SQL.Add('ORDER BY Job.Job');
      end;
    1:begin
        qryDetails.SQL.Add('ORDER BY Job.Installation_Date, Job.Job');
      end;
    2:begin
        qryDetails.SQL.Add('ORDER BY Job.Customer_Name, Job.Job');
      end;
    3:begin
        qryDetails.SQL.Add('ORDER BY job.Job_Status, Job.Job');
      end;
  end;

  qryDetails.Close;
  qryDetails.parambyname('Customer').asinteger := customer;
  qryDetails.parambyname('Date_From').Asdatetime := Datefrom;
  qryDetails.parambyname('Date_To').Asdatetime := DateTo;
  qryDetails.Open;
  result := qryDetails.recordcount;
end;

procedure TfrmwtRPOutJobs.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportTotal.caption := formatfloat('0.00',ReportTotal);
end;

procedure TfrmwtRPOutJobs.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPOutJobs.ExporttoFile(filename: string);
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
    + ',"Job Status"'
    + ',"Reference"'
    + ',"Order Ref No"'
    + ',"Production Date"'
    + ',"Fitting Date"'
    + ',"Sales Order"'
    + ',"Total"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;


procedure TfrmwtRPOutJobs.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Job
    tempStr := '"' + qryDetails.fieldbyname('Job').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Date_Raised').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Customer_Name').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Description').asstring + '"';

    //Refernce
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Job_Status_Description').asstring + '"';

    //Date Required
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Reference').asstring + '"';

    //Job Number
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Order_Ref_No').asstring + '"';

    //Goods Value
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Production_Date').asstring + '"';

    //VAT Value
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Installation_Date').asstring + '"';

    //Total Value
    tempStr := tempStr + ',"' + qryDetails.fieldbyname('Sales_Order').asstring + '"';

    //Total Value
    tempStr := tempStr + ',"' + qrlblTotalValue.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSOutJobs.prgbrExport.StepIt;
  end;
end;

end.
