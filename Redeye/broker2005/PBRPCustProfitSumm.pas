unit PBRPCustProfitSumm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QuickRpt, Qrctrls, ExtCtrls, CCSPrint;

type
  TPBRPCustProfitSummFrm = class(TForm)
    qrpDetails: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    qryCustProfSumm: TQuery;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    qrlblCustomer: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    qrlblTotCost: TQRLabel;
    qrlblTotSale: TQRLabel;
    qrlblTotProf: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qryPeriods: TQuery;
    qrlblCost: TQRLabel;
    qrlblSale: TQRLabel;
    qrlblProf: TQRLabel;
    QRLabel6: TQRLabel;
    qrlblProfPerc: TQRLabel;
    qrlblTotProfPerc: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    exporting: boolean;
    exportfile: textfile;
    totCost: currency;
    totSale: currency;
  public
    { Public declarations }
    PrinterSettings: TPrinterSettings;
    Cust: integer;
    CustomerName: string;
    selperiod: integer;
    procedure ExportToFile(fileName: string);
    function GetDetails: integer;
  end;

var
  PBRPCustProfitSummFrm: TPBRPCustProfitSummFrm;

implementation

uses PBRSPEndCustPerform;

{$R *.DFM}

{ TPBRPCustProfitSummFrm }

function TPBRPCustProfitSummFrm.GetDetails: integer;
begin
  result := 0;
  self.qryPeriods.Active := false;
  //self.qryCustProfSumm.ParamByName('customer').asInteger := self.Cust;
  self.qryPeriods.ParamByName('period').asInteger := selperiod;
  self.qryPeriods.Active := true;

  result := self.qryPeriods.RecordCount;
end;

procedure TPBRPCustProfitSummFrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  self.qryCustProfSumm.Active := false;

  self.qryCustProfSumm.ParamByName('customer').asInteger := self.Cust;
  self.qryCustProfSumm.ParamByName('period').asInteger :=
    self.qryPeriods.FieldByName('period').asInteger;
  self.qryCustProfSumm.Active := true;

  self.qrlblCost.Caption := FloatToStrF(
    (self.qryCustProfSumm.FieldByName('Total_Cost').asFloat), ffCurrency, 15, 2);

  self.qrlblSale.Caption := FloatToStrF(
    (self.qryCustProfSumm.FieldByName('Total_Sales').asFloat), ffCurrency, 15, 2);

  self.qrlblProf.Caption := FloatToStrF(
    (self.qryCustProfSumm.FieldByName('Total_Sales').asFloat -
    self.qryCustProfSumm.FieldByName('Total_Cost').asFloat), ffCurrency, 15, 2);

  try
    self.qrlblProfPerc.caption := FloatToStrF(
      ((self.qryCustProfSumm.FieldByName('Total_Sales').asFloat - self.qryCustProfSumm.FieldByName('Total_Cost').asFloat)
      /self.qryCustProfSumm.FieldByName('Total_Sales').asFloat * 100), ffFixed, 15, 2) + '%';
  except
    if  (qryCustProfSumm.FieldByName('Total_Sales').asFloat = 0) and
        (qryCustProfSumm.FieldByName('Total_Cost').asFloat = 0) then
      self.qrlblProfPerc.caption := FloatToStrF(0.00, ffFixed, 15, 2) + '%'
    else
      self.qrlblProfPerc.caption := FloatToStrF(-999.99, ffFixed, 15, 2) + '%';
  end;

  self.totCost := self.totCost + self.qryCustProfSumm.FieldByName('Total_Cost').asFloat;
  self.totSale := self.totSale + self.qryCustProfSumm.FieldByName('Total_Sales').asFloat;
end;

procedure TPBRPCustProfitSummFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.qrlblTotCost.caption := FloatToStrF(self.totCost, ffCurrency, 15, 2);
  self.qrlblTotSale.Caption := FloatToStrF(self.totSale, ffCurrency, 15, 2);
  self.qrlblTotProf.caption :=
    FloatToStrF(self.totSale - self.totCost, ffCurrency, 15 ,2);

  try
    self.qrlblTotProfPerc.caption := FloatToStrF(
      ((self.totSale - self.totCost)/ self.totSale * 100), ffFixed, 15, 2) + '%';
  except
    if  (totSale = 0) and
        (totCost = 0) then
      self.qrlblTotProfPerc.caption := FloatToStrF(0.00, ffFixed, 15, 2) + '%'
    else
      self.qrlblTotProfPerc.caption := FloatToStrF(-999.99, ffFixed, 15, 2) + '%';
  end;
end;

procedure TPBRPCustProfitSummFrm.ExportToFile(fileName: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Customer"'
    + ',"Period"'
    + ',"Sales"'
    + ',"Cost"'
    + ',"Profit"'
    + ',"Profit %"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPCustProfitSummFrm.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Customer
    tempStr := '"' + CustomerName + '"';

    //Period
    tempStr := tempStr + ',"' + qryPeriods.fieldbyname('Period_Description').asstring + '"';

    //Sales
    tempStr := tempStr + ',"' + qrlblSale.caption + '"';

    //Cost
    tempStr := tempStr + ',"' + qrlblCost.caption + '"';

    //Profit
    tempStr := tempStr + ',"' + qrlblProf.caption + '"';

    //Profit %
    tempStr := tempStr + ',"' + qrlblProfPerc.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSPEndCustPerformFrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPCustProfitSummFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  self.totCost := 0.00;
  self.totSale := 0.00;
end;

end.
