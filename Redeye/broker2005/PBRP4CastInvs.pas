unit PBRP4CastInvs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Qrctrls, QuickRpt, ExtCtrls, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRP4CastInvsFrm = class(TForm)
    qry4CastInvs: TFDQuery;
    qrReport: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    RepQRGroup: TQRGroup;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    qry4CastInvspurchase_order: TFloatField;
    qry4CastInvsline: TIntegerField;
    qry4CastInvsqty_to_deliver: TFloatField;
    qry4CastInvsdate_point: TDateTimeField;
    qry4CastInvsdelivery_to_stock: TWideStringField;
    qry4CastInvsinvoice_upfront: TWideStringField;
    qry4CastInvsinactive: TWideStringField;
    qry4CastInvsorder_price: TCurrencyField;
    qry4CastInvsselling_price: TCurrencyField;
    qry4CastInvscust_order_no: TWideStringField;
    qry4CastInvscustomers_desc: TWideStringField;
    qry4CastInvsorder_date: TDateTimeField;
    qry4CastInvssell_unit_factor: TFloatField;
    qry4CastInvsorder_unit_factor: TFloatField;
    qry4CastInvscust_name: TWideStringField;
    qry4CastInvsrep: TIntegerField;
    qry4CastInvsrep_name: TWideStringField;
    qry4CastInvsform_reference_descr: TWideStringField;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    qrlblTotalCost: TQRLabel;
    qrlblTotalSell: TQRLabel;
    QRLabel14: TQRLabel;
    qrlblProfit: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText4: TQRDBText;
    qry4CastInvsdate_deliv_actual: TDateTimeField;
    qrbndGrpHdr: TQRGroup;
    qrbndGrpFtr: TQRBand;
    qrlblGroupHeader: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    qrlblRepTotalCost: TQRLabel;
    qrlblRepTotalSell: TQRLabel;
    qrlblRepTotalProf: TQRLabel;
    QRDBText8: TQRDBText;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    qrlblGrandTotalCost: TQRLabel;
    qrlblGrandTotalSell: TQRLabel;
    qrlblGrandTotalProf: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qry4CastInvsform_reference_id: TWideStringField;
    qry4CastInvsstock_reference: TWideStringField;
    oldqryDummy: TFDQuery;
    qryBackup: TFDQuery;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    lblInvoiceUpfront: TQRLabel;
    qryDummy: TFDQuery;
    qry4CastInvsAdditional_Cost: TFloatField;
    qry4CastInvsAdditional_Sell: TFloatField;
    qry4CastInvsQuantity: TFloatField;
    procedure qrReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Public declarations }
    repTotalCost: double;
    repTotalSell: double;
    repTotalProf: double;
    grandTotalCost: double;
    grandTotalSell: double;
    grandTotalProf: double;
  public
    PrinterSettings: TPrinterSettings;
    Totalby: integer;
    function PrepareReport(dateFrom, dateTo: TDate; customer, branch,
        rep: integer; bShowZero, b2bInvoiced: bytebool; bHideCosts: boolean): boolean;
  end;

var
  PBRP4CastInvsFrm: TPBRP4CastInvsFrm;

implementation

uses PBDatabase;

{$R *.DFM}

function TPBRP4CastInvsFrm.PrepareReport(dateFrom, dateTo: TDate; customer, branch,
  rep: integer; bShowZero, b2bInvoiced: bytebool; bHideCosts: boolean): boolean;
var
  sTemp : string;
{ Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
  function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  self.qry4CastInvs.Active := false;

  qry4CastInvs.SQL.clear;
  qry4CastInvs.SQL.text := qryDummy.SQL.text;
  if dateFrom <> 0 then
  begin
    self.qry4CastInvs.SQL.add('  AND delivery_detail.date_point >= ' + qDate(DateFrom));
//    self.qry4CastInvs.ParamByName('DateFrom').asDate := dateFrom;
  end;

  if dateTo <> 0 then
  begin
    self.qry4CastInvs.SQL.Add('  AND delivery_detail.date_point <= '+ qDate(DateTo));
//    self.qry4CastInvs.ParamByName('DateTo').asDate := dateTo;
  end;

  if (dateFrom = 0) and (dateTo = 0) then
  begin
    qrlblDateRange.caption := 'Unlimited Date Range';
  end
  else if (dateFrom = 0) then
  begin
    qrlblDateRange.caption := 'Dated upto: ' + dateToStr(dateTo);
  end
  else if (dateTo = 0) then
  begin
    qrlblDateRange.caption := 'Dated from: ' + dateToStr(dateFrom);
  end
  else
  begin
    qrlblDateRange.caption := 'Dated from: ' + dateToStr(dateFrom) +
      ' Upto: ' + dateToStr(dateTo);
  end;

  if customer <> 0 then
  begin
    self.qry4CastInvs.SQL.Add('  and ((purchase_orderline.customer = ' + IntToStr(Customer) + ')' +
      '  and (purchase_orderline.branch_no = ' +IntToStr(branch) + '))');
  end;

  if rep <> 0 then
  begin
    self.qry4CastInvs.SQL.Add('  and (purchase_orderline.rep = ' + IntToStr(rep) + ')');
  end;
  self.qrlblTitle.Caption := self.qrlblTitle.Caption + DateToStr(date());

  if not bShowZero then
  begin
    qry4CastInvs.SQL.Add(' AND (purchase_orderline.selling_price <> 0.00)')
  end;

  if b2bInvoiced then
  begin
    qry4CastInvs.SQL.Add(' AND (delivery_detail.date_deliv_actual <> NULL)')
  end;

  if totalby = 0 then
    begin
      self.qry4CastInvs.SQL.Add(' ORDER BY Rep.Name, delivery_detail.Purchase_Order');
      qrbndgrphdr.expression := 'qry4CastInvs.rep_Name';
      QRDBText6.DataField := 'qry4CastInvs.rep_name';
      qrlblGroupHeader.Caption := 'Rep:';
    end
  else
  if totalby = 1 then
    begin
      self.qry4CastInvs.SQL.Add(' ORDER BY Customer.Name, delivery_detail.Purchase_Order');
      qrbndgrphdr.expression := 'qry4CastInvs.Cust_Name';
      QRDBText6.DataField := 'qry4CastInvs.Cust_name';
      qrlblGroupHeader.caption:= 'Customer:';
    end;

  if bHideCosts then
  begin
    QRLabel9.enabled := false;
    QRLabel19.enabled := false;
    QRLabel14.enabled := false;
    qrlblTotalCost.enabled := false;
    qrlblRepTotalCost.enabled := false;
    qrlblGrandTotalCost.enabled := false;
    qrlblProfit.enabled := false;
    qrlblRepTotalProf.enabled := false;
    qrlblGrandTotalProf.enabled := false;
    QRShape1.width := 71;
    QRShape2.width := 71;
    QRShape3.width := 71;
  end
  else
  begin
    QRLabel9.enabled := true;
    QRLabel19.enabled := true;
    QRLabel14.enabled := true;
    qrlblTotalCost.enabled := true;
    qrlblRepTotalCost.enabled := true;
    qrlblGrandTotalCost.enabled := true;
    qrlblProfit.enabled := true;
    qrlblRepTotalProf.enabled := true;
    qrlblGrandTotalProf.enabled := true;
    QRShape1.width := 206;
    QRShape2.width := 206;
    QRShape3.width := 206;
  end;

  self.qry4CastInvs.Active := true;
  Result := (self.qry4CastInvs.RecordCount > 0);
end;

procedure TPBRP4CastInvsFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with qrReport.PrinterSettings do
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

  if totalby = 0 then
    begin
      qrbndgrphdr.expression := 'qry4CastInvs.rep_Name';
      QRDBText6.DataField := 'rep_name';
      qrlblGroupHeader.Caption := 'Rep:';
    end
  else
  if totalby = 1 then
    begin
      qrbndgrphdr.expression := 'qry4CastInvs.Cust_Name';
      QRDBText6.DataField := 'Cust_name';
      qrlblGroupHeader.caption:= 'Customer:';
    end;

  repTotalCost := 0.00;
  repTotalSell := 0.00;
  repTotalProf := 0.00;

  grandTotalCost := 0.00;
  grandTotalSell := 0.00;
  grandTotalProf := 0.00;
end;

procedure TPBRP4CastInvsFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  costTot: double;
  sellTot: double;
begin
  if qry4CastInvsorder_unit_factor.asfloat = 0.00 then
  begin
    costTot :=  qry4CastInvsorder_price.asFloat;
//    qrlblTotalCost.Caption := '£' + FloatToStrF(qry4CastInvsorder_price.asFloat, ffFixed, 15, 2);
  end
  else
  begin
    costTot := (qry4CastInvsorder_price.asFloat * qry4CastInvsqty_to_deliver.asFloat) / qry4CastInvsorder_unit_factor.asfloat;
//    qrlblTotalCost.Caption := '£' + FloatToStrF(costTot, ffFixed, 15, 2);
  end;

  {Add the additional Cost}
  costTot := costTot + qry4CastInvsAdditional_Cost.asFloat;
  qrlblTotalCost.Caption := '£' + FloatToStrF(costTot, ffFixed, 15, 2);

  if qry4CastInvssell_unit_factor.asfloat = 0.00 then
  begin
    sellTot := (qry4CastInvsselling_price.asFloat/qry4CastInvsQuantity.asFloat)*qry4CastInvsqty_to_deliver.asFloat;
//    qrlblTotalSell.Caption := '£' + FloatToStrF(qry4CastInvsselling_price.asFloat, ffFixed, 15, 2);
  end
  else
  begin
    sellTot := (qry4CastInvsselling_price.asFloat * qry4CastInvsqty_to_deliver.asFloat) / qry4CastInvssell_unit_factor.asfloat;
//    qrlblTotalSell.Caption := '£' + FloatToStrF(sellTot, ffFixed, 15, 2);
  end;
  
  {Add the additional Sell Price}
  sellTot := sellTot + qry4CastInvsAdditional_Sell.asFloat;
  qrlblTotalSell.Caption := '£' + FloatToStrF(sellTot, ffFixed, 15, 2);

  if qry4CastInvsInvoice_Upfront.asstring = 'Y' then
    lblInvoiceUpfront.caption := '***'
  else
    lblInvoiceUpfront.caption := '';
  
  qrlblProfit.caption := '£' + FloatToStrF((sellTot - costTot), ffFixed, 15, 2);

  repTotalCost := repTotalCost + costTot;
  repTotalSell := repTotalSell + sellTot;
  repTotalProf := repTotalProf + (sellTot - costTot);

  grandTotalCost := grandTotalCost + costTot;
  grandTotalSell := grandTotalSell + sellTot;
  grandTotalProf := grandTotalProf + (sellTot - costTot);
end;

procedure TPBRP4CastInvsFrm.qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.qrlblRepTotalCost.caption := FloatToStrF(self.repTotalCost, ffCurrency, 15, 2);
  self.qrlblRepTotalSell.caption := FloatToStrF(self.repTotalSell, ffCurrency, 15, 2);
  self.qrlblRepTotalProf.caption := FloatToStrF(self.repTotalProf, ffCurrency, 15, 2);
end;

procedure TPBRP4CastInvsFrm.qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  self.repTotalCost := 0.00;
  self.repTotalSell := 0.00;
  self.repTotalProf := 0.00;
end;

procedure TPBRP4CastInvsFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.qrlblGrandTotalCost.caption := FloatToStrF(self.grandTotalCost, ffCurrency, 15, 2);
  self.qrlblGrandTotalSell.caption := FloatToStrF(self.grandTotalSell, ffCurrency, 15, 2);
  self.qrlblGrandTotalProf.caption := FloatToStrF(self.grandTotalProf, ffCurrency, 15, 2);
end;

end.
