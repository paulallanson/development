unit WTRPJobRemedial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, QrCtrls;

type
  TfrmWTRPJobRemedial = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    qryReport: TQuery;
    QRLabel4: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData2: TQRSysData;
    qrsbActivity: TQRSubDetail;
    qrlblActivity: TQRLabel;
    qrlblNotes: TQRLabel;
    gtQRLabel5: TQRLabel;
    qrpQuoteHead: TQRGroup;
    gtQRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    gtQRLabel1: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRDBText2: TQRDBText;
    qrlblFitterName: TQRLabel;
    gtQRLabel4: TQRLabel;
    qrlblLogDate: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel8: TQRLabel;
    qrlblCost: TQRLabel;
    qrlblCompleted: TQRLabel;
    procedure qrsbActivityBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qrsbActivityAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    iCustomer, iCustQuotes, iQuotes, iSOrders, iSInvoices: integer;
    iTotalCustomers, iTotalCustQuotes, iTotalQuotes, iTotalSOrders, iTotalSInvoices: integer;
    rSOrders, rSInvoices: real;
    rTotalSOrders, rTotalSInvoices: real;
    TotalCount: integer;
    TotalConverted: integer;
    CustomerTotal, ReportTotal: real;
    FCustomerCategory: integer;
    function ShowNotes(TempNotes: integer): string;
    procedure SetCustomerCategory(const Value: integer);
  public
    Operator: integer;
    DateFrom, DateTo: TDateTime;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmWTRPJobRemedial: TfrmWTRPJobRemedial;

implementation

uses wtDataModule, AllCommon, wtNotesDM, wtRSJobRemedials;

{$R *.dfm}

function TfrmWTRPJobRemedial.GetDetails: integer;
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
  qryReport.parambyname('Operator').Asinteger := Operator;
  qryReport.parambyname('Date_From').Asdatetime := Datefrom;
  qryReport.parambyname('Date_To').Asdatetime := DateTo;
  qryReport.Open;
  result := qryReport.recordcount;
end;

procedure TfrmWTRPJobRemedial.ExporttoFile(filename: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Job"'
    + ',"Customer"'
    + ',"Operator"'
    + ',"Logged Date"'
    + ',"Notes"'
    + ',"Installation Date"'
    + ',"Fitter"'
    + ',"Cost"'
    + ',"Completed"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmWTRPJobRemedial.qrsbActivityBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblLogDate.caption := padatestr(qryReport.fieldbyname('Date_Raised').asdatetime);
  qrlblCost.caption := formatfloat('0.00',qryReport.fieldbyname('Installation_Price').asfloat);
  qrlblCompleted.caption := qryReport.fieldbyname('Completed').asstring;
  qrlblActivity.caption := padatestr(qryReport.fieldbyname('Installation_Date').asdatetime);
  qrlblNotes.caption := ShowNotes(qryReport.fieldbyname('Notes').asinteger);
  qrlblFitterName.caption := qryReport.fieldbyname('Fitter_Name').asstring;
end;

function TfrmWTRPJobRemedial.ShowNotes(TempNotes: integer): string;
var
  Notes: TNotes;
begin
  Result := '';
  if TempNotes = 0 then exit;
  Notes := TNotes.create;
  try
    Notes.DbKey := TempNotes;
    Notes.LoadfromDb;
    Result := Notes.Data;
  finally
    Notes.free;
  end;
end;

procedure TfrmWTRPJobRemedial.FormCreate(Sender: TObject);
begin
  dtmdlNotes := TdtmdlNotes.create(self);
end;

procedure TfrmWTRPJobRemedial.FormDestroy(Sender: TObject);
begin
  dtmdlNotes.free;
end;

procedure TfrmWTRPJobRemedial.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmWTRPJobRemedial.qrsbActivityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Job
    tempStr := '"' + qryReport.fieldbyname('Job').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Raised By
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Operator_Name').asstring + '"';

    //Event Date
    tempStr := tempStr + ',"' + qrlblLogDate.caption + '"';

    //Notes
    tempStr := tempStr + ',"' + qrlblNotes.caption + '"';

    //Install Date
    tempStr := tempStr + ',"' + qrlblActivity.caption + '"';

    //Fitter
    tempStr := tempStr + ',"' + qrlblFitterName.caption + '"';

    //Cost
    tempStr := tempStr + ',"' + qrlblCost.caption + '"';

    //Completed
    tempStr := tempStr + ',"' + qrlblCompleted.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSJobRemedials.prgbrExport.StepIt;
  end;
end;

end.
