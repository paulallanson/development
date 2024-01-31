unit PBRPStkVal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, CCSPrint, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPStkValfrm = class(TForm)
    qryReport: TFDQuery;
    QuickReport: TQuickRep;
    PageTitle: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel13: TQRLabel;
    qrlblTitle: TQRLabel;
    FormRefQRLabel: TQRLabel;
    DescQRLabel: TQRLabel;
    StkQRLabel: TQRLabel;
    ValQRLabel: TQRLabel;
    QRShape1: TQRShape;
    CstQRLabel: TQRLabel;
    RepTypeQRLabel: TQRLabel;
    OrderDetail: TQRSubDetail;
    ValueQRLabel: TQRLabel;
    CostQRLabel: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    FormTotQRBand: TQRBand;
    FooterQRBand: TQRBand;
    PageNoQRLabel: TQRLabel;
    RepTotsQRGroup: TQRGroup;
    RepTotsQRBand: TQRBand;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    ReportCostLbl: TQRLabel;
    ReportSellLbl: TQRLabel;
    CustTotQRBand: TQRBand;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    CustTotQRLabel: TQRLabel;
    CustCostQRLabel: TQRLabel;
    CustValQRLabel: TQRLabel;
    RepNameQRGroup: TQRGroup;
    QRLabel3: TQRLabel;
    RepNameQRDBText: TQRDBText;
    RepNameQRBand: TQRBand;
    RepNameTotQRLabel: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    RepSellQRLbl: TQRLabel;
    RepCostQRLbl: TQRLabel;
    CustQRGroup: TQRGroup;
    FormQRGroup: TQRGroup;
    CustnamQRLabel: TQRLabel;
    CustQRDBText: TQRDBText;
    FormIDQRDBText: TQRDBText;
    FormDescQRDBText: TQRDBText;
    qryReportOrder_Price: TCurrencyField;
    qryReportSelling_Price: TCurrencyField;
    qryReportQty_in_Stock: TFloatField;
    qryReportOrder_Unit: TIntegerField;
    qryReportForm_Reference_Descr: TStringField;
    qryReportReorder_Level: TIntegerField;
    qryReportCustomer_Name: TWideStringField;
    qryReportForm_Reference_ID: TStringField;
    qryReportOrder_Unit_Factor: TFloatField;
    qryReportsell_unit_Factor: TFloatField;
    qryReportPurchase_Order: TFloatField;
    qryReportCust_Order_No: TStringField;
    qryReportCustomers_Desc: TStringField;
    qryReportRep: TIntegerField;
    qryReportName: TStringField;
    qryReportDate_Point: TDateTimeField;
    qryReportStock_Reference: TStringField;
    qryReportPurch_Ord_Line_Status: TIntegerField;
    qryReportInvoice_Upfront: TStringField;
    qryReportQuantity: TFloatField;
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qryReportQty_OutGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryReportQty_InGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure OrderDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepTotsQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepTotsQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure CustTotQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CustTotQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure OrderDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure RepNameQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepNameQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    PrinterSettings: TPrinterSettings;
    rCost, rSell, rStock,  rCustCost, rCustSel, rCustStock, rReportCost, rReportSell, rReportStock:real;
    rRepCost, rRepSell: real;
    bIncOrdVal, bCustomerVal : ByteBool;
  end;

var
  PBRPStkValfrm: TPBRPStkValfrm;

implementation

{$R *.DFM}

procedure TPBRPStkValfrm.QuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   with quickreport.PrinterSettings do
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
  qryReport.Open;
  CstQrLabel.enabled := bIncOrdVal;
  CostQRLabel.Enabled := bIncOrdVal;
  CustCostQrLabel.Enabled := bIncOrdVal;
  QrShape7.enabled := bIncOrdVal;
  Qrshape2.enabled := bIncOrdVal;
  QrShape5.enabled := bIncOrdVal;
  RepCostQrLbl.enabled := bIncOrdVal;
  ReportCostlbl.enabled := bIncOrdVal;
end;

procedure TPBRPStkValfrm.qryReportQty_OutGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReport.fieldbyname('Delivery_to_Stock').asstring <> 'Y' then
    text := qryReport.fieldbyname('Qty_Delivered').asstring
  else
    text := '0';

end;

procedure TPBRPStkValfrm.qryReportQty_InGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReport.fieldbyname('Delivery_to_Stock').asstring = 'Y' then
    text := qryReport.fieldbyname('Qty_Delivered').asstring
  else
    text := '0';

end;

procedure TPBRPStkValfrm.OrderDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  rstock := rstock + qryReport.fieldByName('Qty_In_Stock').Asfloat;
  with qryreport do
    begin
      if FieldByName('Order_Unit_Factor').asfloat <> 0 then
        rCost := (FieldByName('Qty_In_Stock').asfloat / FieldByName('Order_Unit_Factor').asfloat)
                      * FieldByName('Order_Price').asfloat
      else
        if qryReport.fieldByName('Qty_In_Stock').Asfloat <> 0 then
          rCost := (FieldByName('Order_Price').asfloat/FieldByName('Quantity').asfloat) *
                   FieldByName('Qty_in_Stock').asfloat
        else
          rCost := 0.00;

      if FieldByName('Sell_Unit_Factor').asfloat <> 0 then
        rSell := (FieldByName('Qty_In_Stock').asfloat / FieldByName('Sell_Unit_Factor').asfloat)
                      * FieldByName('Selling_Price').asfloat
      else
          if qryReport.fieldByName('Qty_In_Stock').Asfloat <> 0 then
          rsell := (FieldByName('Selling_Price').asfloat/FieldByName('Quantity').asfloat) *
                   FieldByName('Qty_in_Stock').asfloat
          else
            rsell := 0.00;
    end;
  if not bCustomerVal then
    begin
      If (qryReport.FieldByName('Invoice_Upfront').AsString = 'Y') and
        (qryReport.FieldByName('Purch_Ord_line_Status').AsInteger >= 25) then
        begin
          rsell:= 0.00;
          rcost := 0.00;
        end;
    end;

  ValueQRLabel.Caption := formatfloat('0.00',rsell);
  CostQRLabel.Caption := formatfloat('0.00',rcost);
  rRepCost := rRepCost + rcost;
  rRepSell := rRepSell + rSell;
  rReportCost := rReportCost + StrToFloatDef(CostQRLabel.Caption, 0, FormatSettings);
  rReportSell := rReportSell + StrToFloatDef(ValueQRLabel.Caption, 0, FormatSettings);

  rCustCost := rCustCost + StrToFloatDef(CostQRLabel.Caption, 0, FormatSettings);
  rCustSel := rCustSel + StrToFloatDef(ValueQRLabel.Caption, 0, FormatSettings);
end;
procedure TPBRPStkValfrm.FooterQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PageNoQRLabel.Caption := 'Page: ' + IntToStr(QuickReport.PageNumber);
end;

procedure TPBRPStkValfrm.RepTotsQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ReportCostLbl.Caption := FormatFloat('0.00', rReportCost);
  ReportSellLbl.Caption := FormatFloat('0.00',rReportSell);
end;

procedure TPBRPStkValfrm.RepTotsQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
rReportCost := 0;
rReportSell := 0;
end;

procedure TPBRPStkValfrm.CustTotQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
CustValQRLabel.Caption := formatfloat('0.00',rcustsel);
CustCostQRLabel.Caption := formatfloat('0.00',rcustcost);
end;

procedure TPBRPStkValfrm.CustTotQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
rCustCost := 0;
rCustSel := 0;
end;

procedure TPBRPStkValfrm.OrderDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rcost := 0.;
  rsell := 0.;
  rstock := 0.;
end;

procedure TPBRPStkValfrm.RepNameQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepCostQrLbl.Caption := FormatFloat('0.00', rRepCost);
  RepSellQrLbl.Caption := FormatFloat('0.00',rRepSell);
end;

procedure TPBRPStkValfrm.RepNameQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
rRepCost := 0;
rRepSell := 0;
end;

end.
