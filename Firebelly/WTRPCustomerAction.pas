unit WTRPCustomerAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, gtQrCtrls;

type
  TfrmwtRPCustomerAction = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblCaption: TgtQRLabel;
    qryReport: TQuery;
    qrgCustomerHead: TQRGroup;
    qrsbDetails: TQRSubDetail;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    qrlblDateRange: TgtQRLabel;
    QRDBText9: TgtQRDBText;
    QRSysData2: TgtQRSysData;
    QRSysData1: TgtQRSysData;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText11: TgtQRDBText;
    QRDBText12: TgtQRDBText;
    QRLabel1: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbCustomerFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbCustomerFooterBeforePrint(Sender: TQRCustomBand;
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
    code, operator: integer;
    DateFrom, DateTo: TDateTime;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPCustomerAction: TfrmwtRPCustomerAction;

implementation

uses wtDataModule, WTRSCustomerAction;

{$R *.dfm}

procedure TfrmwtRPCustomerAction.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QuoteCount := 0;
  CustomerTotal := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPCustomerAction.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QuoteCount := QuoteCount + 1;
end;

procedure TfrmwtRPCustomerAction.qrbCustomerFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerTotal := 0.00;
  QuoteCount := 0;
end;

procedure TfrmwtRPCustomerAction.qrbCustomerFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  ReportTotal := ReportTotal + CustomerTotal;
end;

function TfrmwtRPCustomerAction.GetDetails: integer;
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
  qryReport.Close;
  qryReport.parambyname('Operator').asinteger := operator;
  qryReport.parambyname('Code').asinteger := Code;
  qryReport.parambyname('Date_From').Asdatetime := Datefrom;
  qryReport.parambyname('Date_To').Asdatetime := DateTo;
  qryReport.Open;
end;

procedure TfrmwtRPCustomerAction.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPCustomerAction.ExporttoFile(filename: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Customer"'
    + ',"Type"'
    + ',"Rep"'
    + ',"Action"'
    + ',"Contact"'
    + ',"Action Date"'
    + ',"by Whom"'
    + ',"Telephone"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPCustomerAction.qrsbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Customer Name
    tempStr := '"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Customer Type
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Type_Description').asstring + '"';

    //Rep Name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring + '"';

    //Prospect Action
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Prospect_Action_Description').asstring + '"';

    //Contact Name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Contact_Name').asstring + '"';

    //Action Date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Prospect_Action_Next_Date').asstring + '"';

    //LOperator
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Operator_Name').asstring + '"';

    //Telephone Number
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Telephone_Number').asstring + '"';


    writeln(self.exportFile, tempStr);
    frmWTRSCustomerAction.prgbrExport.StepIt;
  end;
end;

end.
