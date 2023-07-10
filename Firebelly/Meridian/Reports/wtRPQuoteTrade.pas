unit wtRPQuoteTrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrExport, gtQrCtrls;

type
  TfrmwtRPQuoteTrade = class(TForm)
    qrpDetails: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TQuery;
    qrbPageHeader: TQRBand;
    qrbPageFooter: TQRBand;
    qryQElements: TQuery;
    dtsReport: TDataSource;
    qrsdQElements: TQRSubDetail;
    lblWorktopSize: TgtQRLabel;
    lblWorktopArea: TgtQRLabel;
    qrsdQCutOuts: TQRSubDetail;
    qryQCutOuts: TQuery;
    qrlblCutOutDescription: TgtQRDBText;
    qrlblQuantity: TgtQRLabel;
    qrsdQEdges: TQRSubDetail;
    qrlblLength: TgtQRLabel;
    qrsdQExtras: TQRSubDetail;
    qrlblExtraDescription: TgtQRDBText;
    qryQEdges: TQuery;
    qryQExtras: TQuery;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qrbQFooter: TQRBand;
    lblGrossSupply: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    qrlblGrossPrice: TgtQRLabel;
    qrlblInstallation: TgtQRLabel;
    qrlblSurvey: TgtQRLabel;
    qrlblDelivery: TgtQRLabel;
    qrcbAvailability: TQRChildBand;
    QRLabel9: TgtQRLabel;
    qrcbTerms: TQRChildBand;
    QRLabel10: TgtQRLabel;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qryUpQuote: TQuery;
    qrcbNotes: TQRChildBand;
    qrlNotes: TgtQRLabel;
    qrcbSignature: TQRChildBand;
    QRLabel13: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    QRLabel15: TgtQRLabel;
    QRShape1: TgtQRShape;
    QRShape2: TgtQRShape;
    QRShape3: TgtQRShape;
    qrlblQuoteCaption: TgtQRLabel;
    qrmAddress: TgtQRMemo;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRLabel5: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    qrrchTextNotes: TgtQRRichText;
    qrrchTextAvailability: TgtQRRichText;
    qrrchtextTerms: TgtQRRichText;
    QRLabel16: TgtQRLabel;
    QRDBText6: TgtQRDBText;
    QRLabel17: TgtQRLabel;
    QRLabel18: TgtQRLabel;
    qrlblVAT: TgtQRLabel;
    qrlblGross: TgtQRLabel;
    QRShape5: TgtQRShape;
    QRLabel1: TgtQRLabel;
    QRLabel19: TgtQRLabel;
    QRLabel20: TgtQRLabel;
    QRLabel21: TgtQRLabel;
    qrlblDepositReqd: TgtQRLabel;
    qrlblBalanceDue: TgtQRLabel;
    qrlblNettAcc: TgtQRLabel;
    qrlblVatAcc: TgtQRLabel;
    qrlblGrossAcc: TgtQRLabel;
    qrlblDeposit: TgtQRLabel;
    qrlblBalance: TgtQRLabel;
    qrlblNett: TgtQRLabel;
    QRLabel24: TgtQRLabel;
    QRShape6: TgtQRShape;
    QRShape7: TgtQRShape;
    QRLabel25: TgtQRLabel;
    qrcbAcceptanceHeader: TQRChildBand;
    QRLabel26: TgtQRLabel;
    QRLabel27: TgtQRLabel;
    QRDBText7: TgtQRDBText;
    QRDBText8: TgtQRDBText;
    QRShape8: TgtQRShape;
    QRShape9: TgtQRShape;
    QRLabel28: TgtQRLabel;
    QRShape10: TgtQRShape;
    QRLabel29: TgtQRLabel;
    QRDBText9: TgtQRDBText;
    QRLabel30: TgtQRLabel;
    QRDBText10: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    qryEndUser: TQuery;
    QRLabel11: TgtQRLabel;
    QRShape11: TgtQRShape;
    gtQRFilters1: TgtQRFilters;
    memAddress: TgtQRRichText;
    qriHeadLogo: TgtQRImage;
    qrlblEdgeDescription: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRShape2: TgtQRShape;
    gtQRShape3: TgtQRShape;
    gtQRShape4: TgtQRShape;
    gtQRShape5: TgtQRShape;
    gtQRShape6: TgtQRShape;
    gtQRShape7: TgtQRShape;
    gtQRShape8: TgtQRShape;
    gtQRShape9: TgtQRShape;
    gtQRShape10: TgtQRShape;
    gtQRShape11: TgtQRShape;
    gtQRShape12: TgtQRShape;
    gtQRShape14: TgtQRShape;
    gtQRShape15: TgtQRShape;
    gtQRShape13: TgtQRShape;
    qryTrade: TQuery;
    lblWorktopTotal: TgtQRLabel;
    lblCutOutTotal: TgtQRLabel;
    lblEdgeTotal: TgtQRLabel;
    lblExtraTotal: TgtQRDBText;
    qrcbDiscount: TQRChildBand;
    lblDiscount: TgtQRLabel;
    qrlblDiscountValue: TgtQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrsdQElementsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbQFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbAvailabilityBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbTermsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbQFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrcbNotesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbSignatureBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrcbAcceptanceHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbDiscountBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
    function GetCompanyAddress: string;
    function GetTradeAddress: string;
  public
    Quote: integer;
    bPreview: boolean;
    bPrintDetail: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bEndUser: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPQuoteTrade: TfrmwtRPQuoteTrade;

implementation

var
  rGrossTotal: real;

{$R *.dfm}

function TfrmwtRPQuoteTrade.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Quote').asinteger := self.Quote;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPQuoteTrade.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  lblWorktoptotal.Enabled := bprintDetail;
  lblEdgetotal.Enabled := bprintDetail;
  lblCutOuttotal.Enabled := bprintDetail;
  lblExtratotal.Enabled := bprintDetail;
  qrcbDiscount.Enabled := bPrintDetail;

  qrbPageHeader.Enabled := true;
  qriHeadLogo.enabled := bPrintLogo;
//  qriFootLogo.enabled := qriHeadLogo.enabled;
//  qrlblCompanyAdd.Enabled := qriHeadLogo.enabled;

  sWorktop := '';
  with qryCompany do
    begin
      close;
      open;
    end;

  with qryTrade do
    begin
      close;
      open;
    end;

//  getCompanyAddress;

  getTradeAddress;

  with qryQElements do
    begin
      close;
      open;
      qrsdQElements.Enabled := (recordcount > 0)
    end;
  with qryQCutOuts do
    begin
      close;
      open;
      qrsdQCutOuts.Enabled := (recordcount > 0)
    end;
  with qryQEdges do
    begin
      close;
      open;
      qrsdQEdges.Enabled := (recordcount > 0)
    end;
  with qryQExtras do
    begin
      close;
      open;
      qrsdQExtras.Enabled := (recordcount > 0)
    end;
  qrrchTextNotes.lines.clear;
  qrrchTextAvailability.lines.clear;
  qrrchtextTerms.lines.Clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Extra_Notes').asinteger));
  qrrchTextAvailability.lines.add(BuildNotes(qryReport.fieldbyname('Availability').asinteger));
  qrrchtextTerms.lines.Add(BuildNotes(qryReport.fieldbyname('Payment_Terms').asinteger));
end;

procedure TfrmwtRPQuoteTrade.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadTrade.bmp');
//    qriFootlogo.picture.loadfromfile('wtFootLogo.bmp');
  except
  end;
end;

procedure TfrmwtRPQuoteTrade.qrsdQElementsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rArea, rUnitPrice, rTotalPrice: real;
  sUpstand, sDescription: string;
begin
  lblWorktopSize.caption := '';
  lblWorktopArea.caption := '';

  if qryQElements.fieldbyname('Description').asstring <> sWorktop then
    begin
      sWorktop := qryQElements.fieldbyname('Description').asstring;
      sDescription := qryQElements.fieldbyname('Thickness_mm').asstring + ' ' +
                      qryQElements.fieldbyname('Description').asstring;
    end
  else
    sDescription := '';

  if qryQElements.fieldbyname('Element_number').asinteger > 1000 then
    sUpstand := ' (Upstand) '
  else
    sUpstand := ' ';
  lblWorktopSize.caption := sDescription + sUpstand +
                            qryQElements.fieldbyname('Length').asstring + ' x ' +
                            qryQElements.fieldbyname('Depth').asstring + ' x ' +
                            qryQElements.fieldbyname('Quantity').asstring;
  rArea :=  ((qryQElements.fieldbyname('Length').asinteger *
            qryQElements.fieldbyname('Depth').asinteger *
            qryQElements.fieldbyname('Quantity').asinteger)/1000000);
  lblWorktopArea.caption := formatfloat('0.00',rArea) + ' ' + 'm2';
  rUnitPrice := qryQElements.fieldbyname('Unit_Price').asinteger;
  rTotalPrice := rUnitPrice * rArea;
  lblWorktopTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuoteTrade.qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblQuantity.caption := qryQCutOuts.fieldbyname('Quantity').asstring + ' ' + 'No.';

  rUnitPrice := qryQCutOuts.fieldbyname('Unit_Price').asinteger;
  rTotalPrice := rUnitPrice * qryQCutOuts.fieldbyname('Quantity').asinteger;
  lblCutOutTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuoteTrade.qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblEdgeDescription.caption := qryQEdges.fieldbyname('Description').asstring;
  qrlblLength.caption := formatfloat('0.0',(qryQEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';

  rUnitPrice := qryQEdges.fieldbyname('Unit_Price').asinteger;
  rTotalPrice := rUnitPrice * (qryQEdges.fieldbyname('Length').asfloat/1000);
  lblEdgeTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuoteTrade.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  rGrossTotal := 0.00;
  
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
      qrlblDepositReqd.enabled := (qryCustomer.FieldByName('Credit_Status').AsString <> 'L');
      qrlblDeposit.enabled := (qryCustomer.FieldByName('Credit_Status').AsString <> 'L');
      qrlblBalance.enabled := (qryCustomer.FieldByName('Credit_Status').AsString <> 'L');
      qrlblBalanceDue.enabled := (qryCustomer.FieldByName('Credit_Status').AsString <> 'L');
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
      qrlblDepositReqd.enabled := false;
      qrlblDeposit.enabled := false;
      qrlblBalance.enabled := false;
      qrlblBalanceDue.enabled := false;
    end;

end;

procedure TfrmwtRPQuoteTrade.qrbQFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rVat: real;
begin
  rTotal := qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat;
  qrlblGrossPrice.Caption := formatfloat('#,##0.00',rTotal);
  qrlblInstallation.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Installation_Price').Asfloat);
  qrlblSurvey.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Survey_Price').Asfloat);
  qrlblDelivery.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Delivery_Price').Asfloat);

  rNettTotal := (qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat)
                + qryReport.FieldByName('Installation_Price').Asfloat
                + qryReport.FieldByName('Survey_Price').Asfloat
                + qryReport.FieldByName('Delivery_Price').Asfloat;
  rVat := rNettTotal * (qryCustomer.fieldbyname('VAT_Rate').asfloat/100);
  rGrossTotal := rVAT + rNettTotal;
  qrlblNett.caption := formatfloat('#,##0.00',rNettTotal);
  qrlblVat.Caption := formatfloat('#,##0.00',rVAT);
  qrlblGross.Caption := formatfloat('#,##0.00',rGrossTotal);
end;

procedure TfrmwtRPQuoteTrade.qrcbAvailabilityBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
begin
  qrcbAvailability.height := 52;
  if trim(qrrchTextAvailability.lines[0]) = '' then
    qrrchTextAvailability.lines.Add(BuildNotes(qryCompany.fieldbyname('Availability').asinteger));
  iLines := qrrchTextAvailability.lines.count;
  qrrchTextAvailability.Height := iLines * 18;
  qrcbAvailability.height := qrrchTextAvailability.height + 32;
end;

procedure TfrmwtRPQuoteTrade.qrcbTermsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
begin
  qrcbTerms.height := 52;
  if trim(qrrchtextTerms.lines[0]) = '' then
    qrrchtextTerms.Lines.add(BuildNotes(qryCompany.fieldbyname('Payment_Terms').asinteger));
  iLines := qrrchtextTerms.lines.count;
  qrrchtextTerms.Height := iLines * 18;
  qrcbTerms.height := qrrchtextTerms.height + 32;
end;

function TfrmwtRPQuoteTrade.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPQuoteTrade.qrbQFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if not bPreview and (qryReport.FieldByName('Quote_Status').asinteger < 20) then
    begin
      with qryUpQuote do
        begin
          close;
          parambyname('Quote').asinteger := qryReport.fieldbyname('Quote').asinteger;
          parambyname('Quote_Status').asinteger := 20;
          execsql
        end;
    end;
end;

procedure TfrmwtRPQuoteTrade.qrcbNotesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
begin
  qrcbNotes.height := 52;
  if trim(qrrchtextNotes.lines[0]) = '' then
    qrlNotes.Caption := '';
  iLines := qrrchTextNotes.lines.count;
  qrrchTextNotes.Height := iLines * 18;
  qrcbNotes.height := qrrchTextNotes.height + 32;
end;

procedure TfrmwtRPQuoteTrade.qrcbSignatureBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rBalance, rdeposit: real;
begin

  qrlblNettAcc.caption := qrlblNett.caption;
  qrlblVATAcc.caption := qrlblVAT.caption;
  qrlblGrossAcc.caption := qrlblGross.caption;
  rdeposit := rGrossTotal*(qryReport.fieldbyname('Deposit_terms').asfloat/100.00);
  qrlblDeposit.caption := formatfloat('#,##0.00',rdeposit);
  rBalance := rGrossTotal - rDeposit;

  qrlblBalance.caption := formatfloat('#,##0.00',rBalance);

end;

procedure TfrmwtRPQuoteTrade.qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrbPageHeader.Enabled := false;
end;

procedure TfrmwtRPQuoteTrade.qrcbAcceptanceHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
//  qrbPageFooter.Enabled := false;
  memAddress.enabled := false;
end;

function TfrmwtRPQuoteTrade.GetCompanyAddress: string;
var
  i: integer;
  tempaddress: string;
begin
  memAddress.lines.clear;
  tempaddress := '';
  for i := 19 to 22 do
    begin
      if qryCompany.Fields[i].asstring = '' then
        continue
      else
        tempAddress := tempAddress + qryCompany.Fields[i].AsString;

      if i <> 22 then
        tempAddress := tempAddress + ', '
    end;
  tempAddress := tempAddress + #13#10;

  tempAddress := tempAddress + 'Tel:  ' + qryCompany.Fieldbyname('Telephone_number').AsString;
  tempAddress := tempAddress + '  Fax:  ' + qryCompany.Fieldbyname('Fax_Number').AsString;

  memAddress.lines.add(tempAddress);
end;

function TfrmwtRPQuoteTrade.GetTradeAddress: string;
var
  i: integer;
  tempaddress: string;
begin
  memAddress.lines.clear;
  tempaddress := '';
  for i := 2 to 6 do
    begin
      if qryTrade.Fields[i].asstring = '' then
        continue
      else
        tempAddress := tempAddress + qryTrade.Fields[i].AsString;

      if i <> 6 then
        tempAddress := tempAddress + ', '
    end;
  tempAddress := tempAddress + #13#10;

  tempAddress := tempAddress + 'Tel:  ' + qryTrade.Fieldbyname('Telephone_number').AsString;
  tempAddress := tempAddress + '  Fax:  ' + qryTrade.Fieldbyname('Fax_Number').AsString;

  memAddress.lines.add(tempAddress);
end;

procedure TfrmwtRPQuoteTrade.qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  rUnitPrice := qryQExtras.fieldbyname('Unit_Price').asinteger;
  rTotalPrice := rUnitPrice * (qryQExtras.fieldbyname('Quantity').asinteger);
  lblExtraTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuoteTrade.qrcbDiscountBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblDiscountValue.Caption := formatfloat('##0.00',qryReport.FieldByName('Discount_Value').Asfloat);
  PrintBand := (qryReport.FieldByName('Discount_Value').Asfloat <> 0);
end;

end.
