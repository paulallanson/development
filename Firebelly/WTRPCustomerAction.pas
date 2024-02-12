unit WTRPCustomerAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPCustomerAction = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    qryReport: TFDQuery;
    qrgCustomerHead: TQRGroup;
    qrsbDetails: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRDBText9: TQRDBText;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
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
    FExporting: Boolean;
    FExportFile: TextFile;
    FCustomerTotal, FReportTotal: Real;
    FQuoteCount: Integer;
    FCode, FOperator: Integer;
    FDateFrom, FDateTo: TDateTime;
  public
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);

    property Code: Integer read FCode write FCode;
    property &Operator: Integer read FOperator write FOperator;
    property DateFrom: TDateTime read FDateFrom write FDateFrom;
    property DateTo: TDateTime read FDateTo write FDateTo;
  end;

var
  frmwtRPCustomerAction: TfrmwtRPCustomerAction;

implementation

uses wtDataModule, WTRSCustomerAction;

{$R *.dfm}

procedure TfrmwtRPCustomerAction.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  FQuoteCount := 0;
  FCustomerTotal := 0.00;
  FReportTotal := 0.00;
end;

procedure TfrmwtRPCustomerAction.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Inc(FQuoteCount, 1);
end;

procedure TfrmwtRPCustomerAction.qrbCustomerFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  FCustomerTotal := 0.00;
  FQuoteCount := 0;
end;

procedure TfrmwtRPCustomerAction.qrbCustomerFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  FReportTotal := FReportTotal + FCustomerTotal;
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
  qryReport.parambyname('Operator').asinteger := FOperator;
  qryReport.parambyname('Code').asinteger := FCode;
  qryReport.parambyname('Date_From').Asdatetime := FDateFrom;
  qryReport.parambyname('Date_To').Asdatetime := FDateTo;
  qryReport.Open;
  Result := qryReport.RecordCount;
end;

procedure TfrmwtRPCustomerAction.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  FReportTotal := 0.00;
end;

procedure TfrmwtRPCustomerAction.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  FExporting := True;
  AssignFile(FExportFile, fileName);
  try
    rewrite(FExportFile);

    tempStr := '"Customer"'
      + ',"Type"'
      + ',"Rep"'
      + ',"Action"'
      + ',"Contact"'
      + ',"Action Date"'
      + ',"by Whom"'
      + ',"Telephone"';

    WriteLn(FExportFile, tempStr);

    qrpdetails.Prepare;
  finally
    CloseFile(FExportFile);
  end;
end;

procedure TfrmwtRPCustomerAction.qrsbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if FExporting then
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

    writeln(FExportFile, tempStr);
    frmWTRSCustomerAction.prgbrExport.StepIt;
  end;
end;

end.
