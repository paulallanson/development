unit WTRPQuoteEvent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPQuoteEvent = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    qryReport: TFDQuery;
    qrgOperatorHead: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData2: TQRSysData;
    qrsbActivity: TQRSubDetail;
    qrlblActivity: TQRLabel;
    qrlblNotes: TQRLabel;
    qrlblOperatorName: TQRLabel;
    gtQRLabel5: TQRLabel;
    qrpQuoteHead: TQRGroup;
    gtQRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    gtQRLabel1: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
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
  frmWTRPQuoteEvent: TfrmWTRPQuoteEvent;

implementation

uses wtDataModule, AllCommon, wtNotesDM, wtRSQuoteEvent;

{$R *.dfm}

function TfrmWTRPQuoteEvent.GetDetails: integer;
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
  with qryReport do
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

      parambyname('Operator').asinteger := operator;
      parambyname('Date_From').Asdatetime := Datefrom;
      parambyname('Date_To').Asdatetime := DateTo;
      Open;
      result := recordcount;
    end;
end;

procedure TfrmWTRPQuoteEvent.ExporttoFile(filename: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Quote"'
    + ',"Account Manager"'
    + ',"Customer"'
    + ',"Category"'
    + ',"Date"'
    + ',"Notes"'
    + ',"Operator"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmWTRPQuoteEvent.qrsbActivityBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblActivity.caption := padatestr(qryReport.fieldbyname('Date_Time_Entered').asdatetime);
  qrlblOperatorName.caption := qryReport.fieldbyname('Operator_Name').asstring;
  qrlblNotes.caption := ShowNotes(qryReport.fieldbyname('Narrative').asinteger);
end;

function TfrmWTRPQuoteEvent.ShowNotes(TempNotes: integer): string;
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

procedure TfrmWTRPQuoteEvent.FormCreate(Sender: TObject);
begin
  dtmdlNotes := TdtmdlNotes.create(self);
end;

procedure TfrmWTRPQuoteEvent.FormDestroy(Sender: TObject);
begin
  dtmdlNotes.free;
end;

procedure TfrmWTRPQuoteEvent.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmWTRPQuoteEvent.qrsbActivityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Quote
    tempStr := '"' + qryReport.fieldbyname('Quote').asstring + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Manager_Name').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Category
    if qryReport.fieldbyname('Is_Retail_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Retail' + '"'
    else
    if qryReport.fieldbyname('Is_Commercial_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Commercial' + '"'
    else
      tempStr := tempStr + ',"' + 'Trade' + '"';

    //Event Date
    tempStr := tempStr + ',"' + qrlblActivity.caption + '"';

    //Notes
    tempStr := tempStr + ',"' + qrlblNotes.caption + '"';

    //Operator
    tempStr := tempStr + ',"' + qrlblOperatorName.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSQuoteEvent.prgbrExport.StepIt;
  end;
end;

end.
