unit STRPCustProdUsage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, QuickRpt, CCSPrint, Qrctrls;

type
  TSTRPCustProdUsagefrm = class(TForm)
    QuickReport: TQuickRep;
    qryReport: TQuery;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblselection: TQRLabel;
    qrbCustHeader: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrlblQuantity: TQRLabel;
    qrlblValue: TQRLabel;
    qrpCustFooter: TQRBand;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    qrlblTotalCustValue: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblDateSelection: TQRLabel;
    qrySOReport: TQuery;
    function Getdetails(Sender: TObject): integer;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpCustFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpCustFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
  public
    Printersettings: TPrintersettings;
    Customer: integer;
    Branch: integer;
    NotInUse: boolean;
    PartFrom: string;
    PartTo: string;
    DateFrom: TDateTime;
    DateTo: TDateTime;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPCustProdUsagefrm: TSTRPCustProdUsagefrm;

implementation

uses STRSCustProdUsage;

var
  rCustTotal: real;

{$R *.DFM}

function TSTRPCustProdUsagefrm.Getdetails(Sender: TObject): integer;
begin
  if Customer <> 0 then
    begin
    with qryReport do
      begin
        sql.clear;
        sql.text := qrySOReport.sql.text;
        close;
        parambyname('Customer').asinteger := Customer;
        parambyname('Part_From').asstring := PartFrom;
        parambyname('Part_To').asstring := PartTo;
        parambyname('Date_From').asdatetime := DateFrom;
        parambyname('Date_To').asdatetime := DateTo;
        paramByName('Branch').asinteger := Branch;

        if NotinUse then
          parambyname('Not_in_Use').asstring := 'N'
        else
          parambyname('Not_in_Use').asstring := 'Y';
        open;
        result := recordcount;
      end;
    end
  else
    with qryReport do
      begin
        close;
        parambyname('Customer').asinteger := Customer;
        parambyname('Part_From').asstring := PartFrom;
        parambyname('Part_To').asstring := PartTo;
        parambyname('Date_From').asdatetime := DateFrom;
        parambyname('Date_To').asdatetime := DateTo;
        paramByname('Branch').asinteger := Branch;

        if NotinUse then
          parambyname('Not_in_Use').asstring := 'N'
        else
          parambyname('Not_in_Use').asstring := 'Y';
        open;
        result := recordcount;
      end;
end;

procedure TSTRPCustProdUsagefrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rvalue: real;
begin
  if qryReport.fieldbyname('Quantity').asstring = '' then
    qrlblQuantity.caption := '0'
  else
    qrlblQuantity.caption := formatfloat('#,##0',qryReport.fieldbyname('Quantity').asfloat);

  if qryReport.fieldbyname('Order_Value').asstring = '' then
    qrlblValue.caption := '0.00'
  else
    qrlblValue.caption := formatfloat('#,##0.00',qryReport.fieldbyname('Order_Value').asfloat);

  rValue := qryReport.fieldbyname('Order_Value').asfloat;

  rCustTotal := rCustTotal + rValue;
end;

procedure TSTRPCustProdUsagefrm.qrpCustFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblTotalCustValue.caption := formatfloat('#,##0.00',rCustTotal);
end;

procedure TSTRPCustProdUsagefrm.qrpCustFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rCustTotal := 0.00;
end;

procedure TSTRPCustProdUsagefrm.QuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rCustTotal := 0.00;
  qrbCustHeader.enabled := (qrlblSelection.caption = '');
  if qrlblSelection.caption = '' then
    qrlblDateSelection.top := qrlblSelection.top;
end;

procedure TSTRPCustProdUsageFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Description"'
    + ',"Customer"'
    + ',"Quantity"'
    + ',"Total Value"';

  writeLn(self.exportFile, tempStr);
  self.QuickReport.Prepare;

  CloseFile(self.exportFile);
end;


procedure TSTRPCustProdUsagefrm.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
begin
  if self.exporting then
  begin
    tempStr := '"' + qryReport.FieldByName('Part').asString + '"';
    tempStr := tempStr+ ',"' + qryReport.FieldByName('Part_Description').asString + '"';
    tempStr := tempStr+ ',"' + qryReport.FieldByName('Name').asString + '"';
    tempStr := tempStr+ ',"' + qrlblQuantity.caption + '"';
    tempStr := tempStr+ ',"' + qrlblValue.caption + '"';

    writeln(self.exportFile, tempStr);
    STRSCustProdUsagefrm.prgbrExport.StepIt;
  end;

end;

end.
