unit STRPUnpaidStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Db, Qrctrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPUnpaidStockFrm = class(TForm)
    qrReport: TQuickRep;
    qryReport: TFDQuery;
    qrySalesInvDets: TFDQuery;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    MarginQRLabel: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel18: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel19: TQRLabel;
    qryReportDate_Point: TDateTimeField;
    qryReportpurchase_order: TFloatField;
    qryReportLine: TIntegerField;
    qryReportDelivery_no: TIntegerField;
    qryReportmoveInRef: TWideStringField;
    qryReportpart: TWideStringField;
    qryReportrepName: TWideStringField;
    qryReportcustName: TWideStringField;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qryReportPart_Description: TWideStringField;
    QRDBText7: TQRDBText;
    qryReportorder_price: TCurrencyField;
    qryReportorder_unit: TWideStringField;
    qryReportTotalQty: TIntegerField;
    qrlblTCost: TQRLabel;
    qrlblInvQty: TQRLabel;
    qrlblInvVal: TQRLabel;
    qryReportPrice_Unit_Factor: TFloatField;
    qrbndCustFooter: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qrlblCustTotVal: TQRLabel;
    qrlblCustTotCost: TQRLabel;
    qrbndRepFooter: TQRBand;
    qrlblRepTotCost: TQRLabel;
    qrlblRepTotVal: TQRLabel;
    QRShape4: TQRShape;
    qrbndReportFooter: TQRBand;
    qrlblReportTotCost: TQRLabel;
    QRShape5: TQRShape;
    qrlblReportTotVal: TQRLabel;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape7: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrlblStockQty: TQRLabel;
    qrlblCustTotStckVal: TQRLabel;
    qrlblStockVal: TQRLabel;
    qrlblRepTotStckVal: TQRLabel;
    qrlblReportTotStckVal: TQRLabel;
    qryReportPart_Cost_Cat: TCurrencyField;
    qryReportSell_Pack_Quantity: TIntegerField;
    QRShape8: TQRShape;
    qryReportQuantity: TFloatField;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndCustFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndCustFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndRepFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndRepFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndReportFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    customer, branch, rep: integer;
    dateFrom, dateTo: TDateTime;
    preview: boolean;
    CustTotCost, CustTotVal, CustTotStck: double;
    RepTotCost, RepTotVal, RepTotStck: double;
    ReportTotCost, ReportTotVal, ReportTotStck: double;
    function prepareQuery: boolean;
  public
    { Public declarations }
    function runReport(customer, branch, rep: integer;
      dateFrom, dateTo: TDateTime; preview: boolean):  boolean;
  end;

var
  STRPUnpaidStockFrm: TSTRPUnpaidStockFrm;

implementation

{$R *.DFM}

{ TSTRPUnpaidStockFrm }

function TSTRPUnpaidStockFrm.prepareQuery: boolean;
begin
  qryReport.ParamByName('customer').asInteger := customer;
  qryReport.ParamByName('branch').asInteger := branch;
  qryReport.ParamByName('rep').asInteger := rep;
  qryReport.ParamByName('dateFrom').asDateTime := dateFrom;
  qryReport.ParamByName('dateTo').asDateTime := dateTo;

  qryReport.open;

  if qryReport.RecordCount = 0 then
    Result := false
  else
    Result := true;
end;

function TSTRPUnpaidStockFrm.runReport(customer, branch, rep: integer;
 dateFrom, dateTo: TDateTime; preview: boolean):  boolean;
begin
  self.customer := customer;
  self.branch := branch;
  self.rep := rep;
  self.dateFrom := dateFrom;
  self.dateTo := dateTo;
  self.preview := preview;

  if prepareQuery = false then
  begin
    Result := false;
    exit;
  end;

  qrlblTitle.Caption := 'Unpaid Stock Report - Run Date: ' + DateToStr(trunc(now));
  qrlblDateRange.caption := 'Orders Delivered between: '
    + DateToStr(dateFrom) + ' - ' + DateToStr(DateTo);

  self.qrReport.Preview;
  Result := true;
end;

procedure TSTRPUnpaidStockFrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempVal1, tempVal2, stckVal: double;
  tempQty: double;
begin
  if qryReportPrice_Unit_Factor.asFloat <> 0 then
  begin
    //not a per job price unit
    tempVal1 := ((qryReportTotalQty.asFloat * qryReportorder_price.asFloat)
               / qryReportPrice_Unit_Factor.asFloat)
  end
  else
  begin
    //price unit must be per job so calculate the deliveries' value as a proportion
    //of the POLine order qty
    tempVal1 := ((qryReportTotalQty.asFloat * qryReportorder_price.asFloat)
               / qryReportQuantity.asFloat)
  end;

  qrlblTCost.caption := FloatToStrF(tempVal1, ffFixed, 15, 2);

  qrySalesInvDets.close;
  qrySalesInvDets.ParamByName('moveRef').asString :=
    qryReportmoveInRef.AsString;
  qrySalesInvDets.open;
  
  tempVal2 := 0.00;
  tempQty := 0.00;
  while not self.qrySalesInvDets.eof do
  begin
    if qrySalesInvDets.FieldByName('Price_unit_Factor').asfloat <> 0 then
    tempVal2 := tempVal2 +
      ((qrySalesInvDets.FieldByName('Store_Quantity').asFloat * qrySalesInvDets.FieldByName('goods_value').asFloat)
       / qrySalesInvDets.FieldByName('Price_Unit_Factor').asFloat)
    else
      tempval2 := tempval2 +
        ((qrySalesInvDets.fieldbyname('store_quantity').asfloat * qrySalesInvDets.fieldbyname('Goods_Value').asfloat));
    tempQty := tempQty + qrySalesInvDets.FieldByName('Store_Quantity').asFloat;
    qrySalesInvDets.Next;
  end;

  if  qryReportTotalQty.asFloat = tempQty then
  begin
    //dont print if all of the stock delivered has since been invoiced
    PrintBand := false;
  end
  else
  begin
    qrlblInvQty.Caption := FloatToStrF(tempQty, ffFixed, 15, 0);
    qrlblInvVal.Caption := FloatToStrF(tempVal2, ffFixed, 15, 2);
    qrlblStockQty.caption := FloatToStrF(qryReportTotalQty.asFloat - tempQty, ffFixed, 15, 0);

    
    if tempQty <> 0 then
    begin
      //if there have been sales work out the value of the remaining stock based
      //on the invoiced price
      stckVal := (qryReportTotalQty.asFloat - tempQty) * (tempVal2/tempQty)
    end
    else
    begin
      //otherwise work out the value of the remaining stock based on the
      //part record
      if qryReportSell_Pack_Quantity.asFloat <> 0 then
        stckVal := self.qryReportTotalQty.asFloat * (round(qryReportPart_cost_Cat.asFloat*100)/100)
           / qryReportSell_Pack_Quantity.asFloat
      else
        stckVal := 0.00;
    end;

    qrlblStockVal.caption := FloatToStrF(stckVal, ffFixed, 15, 2);

    //keep track of group totals
    CustTotCost := CustTotCost + tempVal1;
    CustTotVal := CustTotVal + tempVal2;
    CustTotStck := CustTotStck + stckVal;
  end;

  self.qrySalesInvDets.close;
end;

procedure TSTRPUnpaidStockFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  CustTotCost   := 0.00;
  CustTotVal    := 0.00;
  CustTotStck   := 0.00;
  RepTotCost    := 0.00;
  RepTotVal     := 0.00;
  RepTotStck    := 0.00;
  ReportTotCost := 0.00;
  ReportTotVal  := 0.00;
  ReportTotStck := 0.00;
end;

procedure TSTRPUnpaidStockFrm.qrbndCustFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustTotCost.caption := FloatToStrF(CustTotCost, ffFixed, 15, 2);
  qrlblCustTotVal.caption := FloatToStrF(CustTotVal, ffFixed, 15, 2);
  qrlblCustTotStckVal.caption := FloatToStrF(CustTotStck, ffFixed, 15, 2);
end;

procedure TSTRPUnpaidStockFrm.qrbndCustFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  RepTotCost := RepTotCost + CustTotCost;
  RepTotVal := RepTotVal + CustTotVal;
  RepTotStck := RepTotStck + CustTotStck;

  CustTotCost := 0.00;
  CustTotVal := 0.00;
  CustTotStck := 0.00;
end;

procedure TSTRPUnpaidStockFrm.qrbndRepFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblRepTotCost.caption := FloatToStrF(RepTotCost, ffFixed, 15, 2);
  qrlblRepTotVal.caption := FloatToStrF(RepTotVal, ffFixed, 15, 2);
  qrlblRepTotStckVal.caption := FloatToStrF(RepTotStck, ffFixed, 15, 2);
end;

procedure TSTRPUnpaidStockFrm.qrbndRepFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ReportTotCost := ReportTotCost + RepTotCost;
  ReportTotVal := ReportTotVal + RepTotVal;
  ReportTotStck := ReportTotStck + RepTotStck;

  RepTotCost := 0.00;
  RepTotVal := 0.00;
  RepTotStck := 0.00;
end;

procedure TSTRPUnpaidStockFrm.qrbndReportFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblReportTotCost.caption := FloatToStrF(ReportTotCost, ffFixed, 15, 2);
  qrlblReportTotVal.caption := FloatToStrF(ReportTotVal, ffFixed, 15, 2);
  qrlblReportTotStckVal.caption := FloatToStrF(ReportTotStck, ffFixed, 15, 2);
end;

end.
