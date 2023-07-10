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
    QRLabel1: TgtQRLabel;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    QRLabel13: TgtQRLabel;
    qrsdElement: TQRSubDetail;
    QRShape1: TgtQRShape;
    QRShape2: TgtQRShape;
    QRShape3: TgtQRShape;
    QRShape4: TgtQRShape;
    QRShape5: TgtQRShape;
    QRShape6: TgtQRShape;
    QRShape7: TgtQRShape;
    QRShape8: TgtQRShape;
    QRShape9: TgtQRShape;
    QRShape10: TgtQRShape;
    qrlblCount: TgtQRLabel;
    qrlblDescription: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRSysData1: TgtQRSysData;
    qrlblDateRequired: TgtQRLabel;
    qrlblJobNumber: TgtQRLabel;
    qryUpJStatus: TQuery;
    qryUpSOStatus: TQuery;
    qrlblSalesOrder: TgtQRLabel;
    procedure qrpCutScheduleBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgJobBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdElementBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgJobAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
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

end;

procedure TfrmWTRPJobCutSched.qrgJobBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ElementNo := 0;
  qrlblJobNumber.caption := 'Job Number: '+ qryreport.fieldbyname('job').AsString;
  qrlblDateRequired.caption := 'Date Required: '+ paDateStr(qryreport.fieldbyname('Date_Required').Asdatetime);
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
