unit PBRP4CastMonthInvs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, CCSPrint, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRP4CastMonthInvsFrm = class(TForm)
    qckrpSalesProfit: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel19: TQRLabel;
    QRLabel4: TQRLabel;
    qrgHeaderAnalysis: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    qrgFooterAnalysis: TQRBand;
    qrySalesProfit: TFDQuery;
    QRDBText1: TQRDBText;
    qrlblAnalysisType: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrlblMarginPerc: TQRLabel;
    qrlblGroupSales: TQRLabel;
    qrlblGroupCost: TQRLabel;
    qrlblGroupMargin: TQRLabel;
    qrlblGroupPerc: TQRLabel;
    QRShape1: TQRShape;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    qrlblReportSales: TQRLabel;
    qrlblReportCost: TQRLabel;
    qrlblReportMargin: TQRLabel;
    qrlblReportPerc: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    procedure qrgHeaderAnalysisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qckrpSalesProfitBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgFooterAnalysisBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgFooterAnalysisAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    rGroupSales, rGroupCost, rGroupMargin: real;
    rReportSales, rReportCost, rReportMargin: real;
  public
    PrinterSettings: TPrinterSettings;
  end;

var
  PBRP4CastMonthInvsFrm: TPBRP4CastMonthInvsFrm;

implementation

{$R *.dfm}

procedure TPBRP4CastMonthInvsFrm.qrgHeaderAnalysisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  case qrySalesProfit.fieldbyname('Analysis_Type').AsInteger of
    1:  qrlblAnalysisType.caption := 'Invoices Raised';
    2:  qrlblAnalysisType.caption := 'Outstanding Purchase Orders NOT IN Job Bags';
    3:  qrlblAnalysisType.caption := 'Outstanding Purchase Orders IN Job Bags';
    4:  qrlblAnalysisType.caption := 'Outstanding Job Bag Production Charges ';
  end;
end;

procedure TPBRP4CastMonthInvsFrm.qckrpSalesProfitBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   with qckrpSalesProfit.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    OutputBin := PrinterSettings.OutputBin;
  end;
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}
  rGroupMargin := 0;
  rGroupSales := 0;
  rGroupCost := 0;

  rReportMargin := 0;
  rReportSales := 0;
  rReportCost := 0;

  qrySalesProfit.Open;

end;

procedure TPBRP4CastMonthInvsFrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rMargin: real;
begin
  try
    rMargin := (qrySalesProfit.fieldbyname('Margin').asfloat/qrySalesProfit.fieldbyname('Total_Sales').asfloat)*100
  except
    rMargin := 999.99;
  end;

  qrlblMarginPerc.Caption := formatfloat('##0.00;(##0.00)',rMargin);

  rGroupSales := rGroupSales + qrySalesProfit.fieldbyname('Total_Sales').asfloat;
  rGroupCost := rGroupCost + qrySalesProfit.fieldbyname('Total_Cost').asfloat;
  rGroupMargin := rGroupMargin + qrySalesProfit.fieldbyname('Margin').asfloat;

  rReportSales := rReportSales + qrySalesProfit.fieldbyname('Total_Sales').asfloat;
  rReportCost := rReportCost + qrySalesProfit.fieldbyname('Total_Cost').asfloat;
  rReportMargin := rReportMargin + qrySalesProfit.fieldbyname('Margin').asfloat;
end;

procedure TPBRP4CastMonthInvsFrm.qrgFooterAnalysisBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rMargin: real;
begin
  try
    rMargin := (rGroupMargin/rGroupSales)*100
  except
    rMargin := 999.99;
  end;

  qrlblGroupPerc.Caption := formatfloat('##0.00%;(##0.00%)',rMargin);

  qrlblGroupSales.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rGroupSales);
  qrlblGroupCost.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rGroupCost);
  qrlblGroupMargin.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rGroupMargin);
end;

procedure TPBRP4CastMonthInvsFrm.qrgFooterAnalysisAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rGroupSales := 0;
  rGroupCost := 0;
  rGroupMargin := 0;
end;

procedure TPBRP4CastMonthInvsFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rMargin: real;
begin
  try
    rMargin := (rReportMargin/rReportSales)*100
  except
    rMargin := 999.99;
  end;

  qrlblReportPerc.Caption := formatfloat('##0.00%;(##0.00%)',rMargin);

  qrlblReportSales.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rReportSales);
  qrlblReportCost.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rReportCost);
  qrlblReportMargin.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rReportMargin);
end;

end.
