unit WTRPJobCutSched;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, AllCommon, gtQrCtrls;

type
  TfrmWTRPJobCutSched = class(TForm)
    qrpCutSchedule: TQuickRep;
    qryReport: TQuery;
    dtsReport: TDataSource;
    qryJElements: TQuery;
    qrgJob: TQRGroup;
    qrsdElement: TQRSubDetail;
    QRShape1: TgtQRShape;
    QRShape2: TgtQRShape;
    QRShape3: TgtQRShape;
    QRShape4: TgtQRShape;
    QRShape6: TgtQRShape;
    QRShape8: TgtQRShape;
    QRShape9: TgtQRShape;
    qrlblCount: TgtQRLabel;
    qrlblDescription: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    qryUpJStatus: TQuery;
    qryUpSOStatus: TQuery;
    qrygetNotes: TQuery;
    QRBand1: TQRBand;
    QRLabel1: TgtQRLabel;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    QRSysData1: TgtQRSysData;
    qrlblDateRequired: TgtQRLabel;
    qrlblJobNumber: TgtQRLabel;
    qrlblSalesOrder: TgtQRLabel;
    QRLabel22: TgtQRLabel;
    QRDBText7: TgtQRDBText;
    QRLabel7: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    QRLabel9: TgtQRLabel;
    QRShape35: TgtQRShape;
    qrrchTextInstallAddress: TgtQRRichText;
    QRLabel75: TgtQRLabel;
    QRDBText9: TgtQRDBText;
    QRLabel76: TgtQRLabel;
    QRDBText10: TgtQRDBText;
    QRLabel13: TgtQRLabel;
    procedure qrpCutScheduleBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgJobBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdElementBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgJobAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    function BuildNotes(const iNotes: integer): string;
    { Private declarations }
  public
    bPreview: boolean;
    Job: integer;
    function Getdetails: integer;
  end;

var
  frmWTRPJobCutSched: TfrmWTRPJobCutSched;

implementation

var
  ElementNo: integer;
  
{$R *.dfm}

function TfrmWTRPJobCutSched.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmWTRPJobCutSched.qrpCutScheduleBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with qryJElements do
    begin
      close;
      open;
    end;

  qrrchTextInstallAddress.lines.Clear;
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));
end;

function TfrmWTRPJobCutSched.BuildNotes(const iNotes: integer): string;
var
  aStr: string;
begin
  if iNotes > 0 then
    begin
      qryGetNotes.parambyname('Notes_Code').asinteger := iNotes;
      qryGetNotes.open;
      aStr := '';
      while (not qryGetNotes.eof) do
        Begin
          astr := aStr + qryGetNotes.fieldbyname('Notes_text').asstring;
          if Length(qryGetNotes.fieldbyname('Notes_text').asstring) < 100 then
            aStr := aStr + ' ';
          qryGetNotes.next;
        end;
      qryGetNotes.close;
    end;
  result := aStr;
end;

procedure TfrmWTRPJobCutSched.qrgJobBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ElementNo := 0;
  qrlblJobNumber.caption := 'Job Number: '+ qryreport.fieldbyname('job').AsString;
  qrlblDateRequired.caption := 'Fitting Date: '+ paDateStr(qryreport.fieldbyname('Installation_Date').Asdatetime);
  qrlblSalesOrder.caption := 'Sales Order: '+ qryreport.fieldbyname('sales_order').AsString;
end;

procedure TfrmWTRPJobCutSched.qrsdElementBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inc(ElementNo);
  if qryJElements.fieldbyname('Element_Number').asinteger > 1000 then
    qrlblDescription.caption := 'Upstand'
  else
    qrlblDescription.caption := 'Worktop';
  qrlblCount.Caption := inttostr(Elementno);
end;

procedure TfrmWTRPJobCutSched.qrgJobAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if (qryReport.fieldbyname('Job_status').asinteger < 30) and not bPreview then
    with qryUpJStatus do
      begin
        close;
        parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
        parambyname('Job_Status').asinteger := 30;
        execsql;
      end;
end;

end.
