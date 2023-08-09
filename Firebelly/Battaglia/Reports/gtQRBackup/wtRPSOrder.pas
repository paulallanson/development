unit wtRPSOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPSOrder = class(TForm)
    qrpDetails: TQuickRep;
    qrgSalesOrder: TQRGroup;
    qryReport: TFDQuery;
    qrbPageHeader: TQRBand;
    dtsReport: TDataSource;
    qrsdSOLines: TQRSubDetail;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qrbSOFooter: TQRBand;
    lblGrossSupply: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlblGrossPrice: TQRLabel;
    qrlblInstallation: TQRLabel;
    qrlblSurvey: TQRLabel;
    qrlblDelivery: TQRLabel;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qryUpQuote: TFDQuery;
    qrlblSOCaption: TQRLabel;
    qrmAddress: TQRMemo;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrlblVAT: TQRLabel;
    qrlblGross: TQRLabel;
    QRShape4: TQRShape;
    qrlblNett: TQRLabel;
    qryEndUser: TFDQuery;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    qrmSiteAddress: TQRMemo;
    QRDBText3: TQRDBText;
    qrySOLine: TFDQuery;
    QRDBText7: TQRDBText;
    qrySOLineSales_Order: TIntegerField;
    qrySOLineSales_order_Line_no: TIntegerField;
    qrySOLineJob: TFloatField;
    qrySOLineUnit_price: TFloatField;
    qrySOLineQuantity: TIntegerField;
    qrySOLineSell_Unit: TIntegerField;
    qrySOLineTotal_Price: TFloatField;
    qrySOLineNett_Price: TFloatField;
    qrySOLineDiscount_Value: TFloatField;
    qrySOLineInstallation_price: TFloatField;
    qrySOLineSurvey_price: TFloatField;
    qrySOLineDelivery_Price: TFloatField;
    qrySOLineDescription: TStringField;
    qrySOLineProduct: TIntegerField;
    qrySOLineVat: TIntegerField;
    qrySOLineVat_Rate: TFloatField;
    qrySOLineVAT_Description: TStringField;
    QRBand1: TQRBand;
    qrlblUnitPrice: TQRLabel;
    qrlblTotalPrice: TQRLabel;
    qrySOLineQuote: TIntegerField;
    QRLabel11: TQRLabel;
    qrlblDeposit: TQRLabel;
    QRLabel13: TQRLabel;
    qrlblBalance: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgSalesOrderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbSOFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdSOLinesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
  public
    SalesOrder: integer;
    bPreview: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bEndUser: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPSOrder: TfrmwtRPSOrder;

implementation

var
  rLineTotal, rInstallTotal, rSurveyTotal, rDeliveryTotal, rGrossTotal, rVATTotal: real;

{$R *.dfm}

function TfrmwtRPSOrder.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Sales_order').asinteger := self.SalesOrder;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPSOrder.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  sWorktop := '';
  with qryCompany do
    begin
      close;
      open;
    end;

  with qrySOLine do
    begin
      close;
      open;
    end;
end;

procedure TfrmwtRPSOrder.qrgSalesOrderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  rGrossTotal := 0.00;
  rLineTotal := 0.00;
  rInstallTotal := 0.00;
  rSurveyTotal := 0.00;
  rDeliveryTotal := 0.00;
  rVatTotal := 0.00;
  
  qrmAddress.Lines.Clear;

  if qryReport.FieldByName('Address').AsInteger <> 0 then
    begin
//    read customer details first to get vat rate
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;

      qryAddress.close;
      qryAddress.parambyname('Address').asinteger := qryReport.FieldByName('Address').AsInteger;
      qryAddress.open;
      dtsAddress.dataset := qryAddress;
    end
  else
    begin
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;
      dtsAddress.dataset := qryCustomer;
    end;
  if not bEndUser then
    begin
      if trim(qryReport.FieldByName('Contact_Name').AsString) <> '' then
        qrmAddress.Lines.Add(qryReport.FieldByName('Contact_Name').AsString);
      for i := 1 to 6 do
        begin
          if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
            qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
        end;
    end
  else
    begin
      qryEndUser.close;
      qryEndUser.parambyname('End_User').asinteger := qryReport.FieldByName('End_User').AsInteger;
      qryEndUser.open;
      dtsAddress.dataset := qryEndUser;

      for i := 1 to 6 do
        begin
          if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
            qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
        end;
    end;

  qrmSiteAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

end;

procedure TfrmwtRPSOrder.qrbSOFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rBalance: real;
  sNett, sVat: string;
begin
(*  rTotal := qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat;
  qrlblGrossPrice.Caption := formatfloat('#,##0.00',rTotal);
  qrlblInstallation.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Installation_Price').Asfloat);
  qrlblSurvey.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Survey_Price').Asfloat);
  qrlblDelivery.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Delivery_Price').Asfloat);

  rNettTotal := (qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat)
                + qryReport.FieldByName('Installation_Price').Asfloat
                + qryReport.FieldByName('Survey_Price').Asfloat
                + qryReport.FieldByName('Delivery_Price').Asfloat;
  rVat := rNettTotal * (qryCustomer.fieldbyname('VAT_Rate').asfloat/100);
*)

  qrlblGrossPrice.Caption := formatfloat('#,##0.00',rLineTotal);
  qrlblInstallation.Caption := formatfloat('#,##0.00',rInstallTotal);
  qrlblSurvey.Caption := formatfloat('#,##0.00',rSurveyTotal);
  qrlblDelivery.Caption := formatfloat('#,##0.00',rDeliveryTotal);

  rNettTotal := rLineTotal
                + rInstallTotal
                + rDeliveryTotal
                + rSurveyTotal;

  sNett := formatfloat('0.00',rNettTotal);
  sVat := formatfloat('0.00',rVATTotal);

  qrlblNett.caption := formatfloat('#,##0.00',rNettTotal);
  qrlblVat.Caption := formatfloat('#,##0.00',rVATTotal);

  rGrossTotal := StrToFloatDef(sNett) + strtofloat(sVat, 0, FormatSettings);
  qrlblGross.Caption := formatfloat('#,##0.00',rGrossTotal);

  rBalance := rGrosstotal - qryReport.FieldByName('Deposit_amount').Asfloat;

  qrlblDeposit.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Deposit_amount').Asfloat);
  qrlblBalance.caption := formatfloat('#,##0.00',rBalance);;
end;

function TfrmwtRPSOrder.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPSOrder.qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrbPageHeader.Enabled := false;
end;

procedure TfrmwtRPSOrder.qrsdSOLinesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  unitPrice, totalPrice, fullLineTotal: real;
begin
  unitPrice  := 0.00;
  totalPrice := 0.00;

  if qrySOLine.FieldByName('Quote').Asinteger <> 0 then
    unitPrice := ((qrySOLine.FieldByName('Nett_Price').Asfloat) - qrySOLine.FieldByName('Discount_Value').Asfloat)
  else
    unitPrice := qrySOLine.FieldByName('Unit_Price').Asfloat;

  totalPrice := unitPrice/qrySOLine.FieldByName('Sell_Unit').Asinteger * qrySOLine.FieldByName('Quantity').Asinteger;

  fullLineTotal := totalPrice + qrySOLine.FieldByName('Installation_Price').Asfloat
                              + qrySOLine.FieldByName('Survey_Price').Asfloat
                              + qrySOLine.FieldByName('Delivery_Price').Asfloat;

  qrlblUnitPrice.caption := formatfloat('0.00',unitPrice);
  qrlblTotalPrice.caption := formatfloat('0.00',totalPrice);

  rLineTotal := rLineTotal + totalPrice;
  rInstallTotal := rInstallTotal + qrySOLine.FieldByName('Installation_Price').Asfloat;
  rSurveyTotal := rSurveyTotal + qrySOLine.FieldByName('Survey_Price').Asfloat;
  rDeliveryTotal := rDeliveryTotal + qrySOLine.FieldByName('Delivery_Price').Asfloat;

  rVatTotal := rVatTotal + (fullLineTotal * (qrySOLine.FieldByName('Vat_Rate').Asfloat/100.00));
end;

end.
