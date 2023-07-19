unit wtRPQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrExport, gtQrCtrls;

type
  TfrmwtRPQuote = class(TForm)
    qrpDetails: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TQuery;
    qrbPageHeader: TQRBand;
    qrbPageFooter: TQRBand;
    qryQElements: TQuery;
    dtsReport: TDataSource;
    qrsdQElements: TQRSubDetail;
    lblWorktopSize: TQRLabel;
    lblWorktopArea: TQRLabel;
    qrsdQCutOuts: TQRSubDetail;
    qryQCutOuts: TQuery;
    qrlblQuantity: TQRLabel;
    qrsdQEdges: TQRSubDetail;
    qrlblLength: TQRLabel;
    qrsdQExtras: TQRSubDetail;
    qryQEdges: TQuery;
    qryQExtras: TQuery;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qrbQFooter: TQRBand;
    lblGrossSupply: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlblGrossPrice: TQRLabel;
    qrlblInstallation: TQRLabel;
    qrlblSurvey: TQRLabel;
    qrlblDelivery: TQRLabel;
    qrcbAvailability: TQRChildBand;
    QRLabel9: TQRLabel;
    qrcbTerms: TQRChildBand;
    QRLabel10: TQRLabel;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qryUpQuote: TQuery;
    qrcbNotes: TQRChildBand;
    qrlNotes: TQRLabel;
    qrcbSignature: TQRChildBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qrlblQuoteCaption: TQRLabel;
    qrmAddress: TQRMemo;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    qrlblReturnDetails: TQRLabel;
    qrrchTextNotes: TQRRichText;
    qrrchTextAvailability: TQRRichText;
    qrrchtextTerms: TQRRichText;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    qrlblDepositReqd: TQRLabel;
    qrlblBalanceDue: TQRLabel;
    qrlblNettAcc: TQRLabel;
    qrlblVatAcc: TQRLabel;
    qrlblGrossAcc: TQRLabel;
    qrlblDeposit: TQRLabel;
    qrlblBalance: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel25: TQRLabel;
    qrcbAcceptanceHeader: TQRChildBand;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    qryEndUser: TQuery;
    QRLabel11: TQRLabel;
    QRShape11: TQRShape;
    gtQRFilters1: TgtQRFilters;
    lblWorktopTotal: TQRLabel;
    lblCutOutTotal: TQRLabel;
    lblEdgeTotal: TQRLabel;
    lblExtraTotal: TQRLabel;
    qriHeadLogo: TQRImage;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRShape2: TQRShape;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRShape3: TQRShape;
    gtQRShape4: TQRShape;
    gtQRShape5: TQRShape;
    gtQRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    gtQRShape7: TQRShape;
    gtQRShape8: TQRShape;
    gtQRShape9: TQRShape;
    qrlblCompanyAdd: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRLabel5: TQRLabel;
    lblCost: TQRLabel;
    qriHeadLogo1: TQRImage;
    qrlblCompanyAdd1: TQRLabel;
    qrcbDiscount: TQRBand;
    lblDiscount: TQRLabel;
    qrlblDiscountValue: TQRLabel;
    qrcbTotal: TQRChildBand;
    QRShape4: TQRShape;
    qrlblTotal: TQRLabel;
    qrlblGross: TQRLabel;
    qrlblCutOut: TQRLabel;
    qrlblEdgeDescription: TQRLabel;
    qrlblExtraDescription: TQRLabel;
    qrlblExtraQuantity: TQRLabel;
    qrcbSubTotal: TQRChildBand;
    gtQRShape10: TQRShape;
    gtQRLabel8: TQRLabel;
    qrlblNett: TQRLabel;
    qrlblVat: TQRLabel;
    qrlblVatRate: TQRLabel;
    qrlblQuoteNumber: TQRLabel;
    gtQRLabel1: TQRLabel;
    lblUsedFor: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    gtQRLabel11: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRShape11: TQRShape;
    gtQRShape12: TQRShape;
    qryRevenueCentre: TQuery;
    qryGetCustMaterialType: TQuery;
    qrlblNumberOfUnitsLabel: TQRLabel;
    qrlblNumberOfUnits: TQRLabel;
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
    procedure qrbExtraFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbSubTotalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbTotalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
    function GetCompanyAddress: string;
    function GetRevenueCentreAddress: string;
    function GetCustomerMaterialTypeMultiplier(tmpCustomer,
      tmpMatType: integer): real;
  public
    Quote: integer;
    bApplyEndUserMarkup: boolean;
    bEndUser: boolean;
    bExcludeTemplate: boolean;
    bPreview: boolean;
    bPrintDetail: boolean;
    bPrintDiscount: boolean;
    bPrintLogo: boolean;
    bShowOffer: boolean;
    bPrintAcceptance: boolean;
    bPrintTotals: boolean;
    bRetail: boolean;
    bUseMarkup: boolean;
    bOnlyGrandTotal: boolean;
    bHideAllPrices: boolean;
    function Getdetails: integer;
    function PrintToFile(QuoteNo: integer; attachmentType: string): TStringList;
  end;

var
  frmwtRPQuote: TfrmwtRPQuote;

implementation

uses wtDataModule, AllCommon;

var
  rGrossTotal: real;

{$R *.dfm}

function TfrmwtRPQuote.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Quote').asinteger := self.Quote;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPQuote.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qrcbAcceptanceHeader.Enabled := bPrintAcceptance;
  qrcbSignature.enabled := bPrintAcceptance;

  qrcbSubTotal.enabled := bPrintTotals;
  qrcbTotal.enabled := bPrintTotals;
  qrbQFooter.enabled := bPrintTotals;
  qrcbNotes.enabled := bPrintTotals;
  qrcbTerms.enabled := bPrintTotals;
  qrcbAvailability.enabled := bPrintTotals;

  lblWorktoptotal.Enabled := bprintDetail and not bApplyEndUserMarkup;
  lblEdgetotal.Enabled := bprintDetail and not bApplyEndUserMarkup;
  lblCutOuttotal.Enabled := bprintDetail and not bApplyEndUserMarkup;
  lblExtratotal.Enabled := bprintDetail and not bApplyEndUserMarkup;
  lblCost.enabled := bPrintDetail and not bApplyEndUserMarkup;

  qrcbDiscount.Enabled := (bPrintDetail or bPrintDiscount) and not bApplyEndUserMarkup;

  qrbPageHeader.Enabled := true;
  qriHeadLogo.enabled := bPrintLogo;
  qrlblCompanyAdd.Enabled := qriHeadLogo.enabled;

  qriHeadLogo1.enabled := qriHeadLogo.enabled;
  qrlblCompanyAdd1.Enabled := qrlblCompanyAdd.Enabled;

  with qryCompany do
    begin
      close;
      open;
    end;

  getCompanyAddress;
  qrlblCompanyAdd1.caption := '';
  qrlblCompanyAdd1.caption := qrlblCompanyAdd.caption;

  qrlblReturnDetails.caption := qrlblReturnDetails.caption + ' fax to ' + qryCompany.fieldbyname('Fax_Number').asstring +
                                ' or send an email to ' + qryCompany.fieldbyname('Email_Address').asstring;

  {Availability Notes}
  qrrchTextAvailability.lines.clear;
  qrrchTextAvailability.lines.add(BuildNotes(qryCompany.fieldbyname('Availability').asinteger));

  qrcbAvailability.enabled := (trim(qrrchtextAvailability.lines[0]) <> '') and bPrintTotals;
end;

procedure TfrmwtRPQuote.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
    qriHeadlogo1.picture.loadfromfile('wtHeadLogo.bmp');
  except
  end;
  bPrintAcceptance := true;
  bPrintTotals := true;
end;

procedure TfrmwtRPQuote.qrsdQElementsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rArea, rUnitPrice, rTotalPrice, rPolishedPrice: real;
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
    sDescription := qryQElements.fieldbyname('Thickness_mm').asstring + ' ' +
                      qryQElements.fieldbyname('Description').asstring;

  if qryQElements.fieldbyname('Element_number').asinteger > 1000 then
    begin
      if qryQElements.fieldbyname('Use_Description').asstring <> '' then
        begin
          if qryQElements.fieldbyname('Upstand_Polish_Price').asfloat <> 0 then
            sUpstand := '(Polished ' + qryQElements.fieldbyname('Use_Description').asstring + ') '
          else
            sUpstand := '(' + qryQElements.fieldbyname('Use_Description').asstring + ') '
        end
      else
        begin
          if qryQElements.fieldbyname('Upstand_Polish_Price').asfloat <> 0 then
            sUpstand := ' (Polished Upstand) '
          else
            sUpstand := ' (Upstand) ';
        end;
    end
  else
    sUpstand := ' ';

  lblWorktopSize.caption := sDescription + sUpstand +
                            qryQElements.fieldbyname('Length').asstring + ' x ' +
                            qryQElements.fieldbyname('Depth').asstring + ' mm ' +
                            qryQElements.fieldbyname('Quantity').asstring + ' No';
  rArea :=  ((qryQElements.fieldbyname('Length').asinteger *
            qryQElements.fieldbyname('Depth').asinteger *
            qryQElements.fieldbyname('Quantity').asinteger)/1000000);

  lblWorktopArea.caption := formatfloat('0.00',rArea) + ' ' + 'm2';

  rPolishedPrice := (((qryQElements.fieldbyname('Length').asinteger/1000) * qryQElements.fieldbyname('No_of_Polished_Lengths').asinteger) * qryQElements.fieldbyname('Upstand_Polish_Price').asfloat)
                  + (((qryQElements.fieldbyname('Depth').asinteger/1000) * qryQElements.fieldbyname('No_of_Polished_Depths').asinteger) * qryQElements.fieldbyname('Upstand_Polish_Price').asfloat);

  rUnitPrice := qryQElements.fieldbyname('Unit_Price').asfloat;
  if bUseMarkup then
    rTotalPrice := ((rUnitPrice * rArea) + rPolishedPrice) * (1 + qryReport.FieldByName('Markup_Rate').Asfloat/100.0000)
  else
    rTotalPrice := (rUnitPrice * rArea) + rPolishedPrice;
  lblWorktopTotal.caption := formatfloat('##0.00',rTotalPrice);
  lblUsedFor.Caption := qryQElements.fieldbyname('Element_Description').asstring;
end;

procedure TfrmwtRPQuote.qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblQuantity.caption := qryQCutOuts.fieldbyname('Quantity').asstring + ' ' + 'No.';
  qrlblCutOut.caption := qryQCutOuts.fieldbyname('Description').asstring;

  rUnitPrice := qryQCutOuts.fieldbyname('Unit_Price').asfloat;
  if bUseMArkup then
    rTotalPrice := (rUnitPrice * qryQCutOuts.fieldbyname('Quantity').asinteger) * (1 + qryReport.FieldByName('Markup_Rate').Asfloat/100.0000)
  else
    rTotalPrice := (rUnitPrice * qryQCutOuts.fieldbyname('Quantity').asinteger);
    
  lblCutOutTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuote.qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblEdgeDescription.caption := qryQEdges.fieldbyname('Description').asstring;
  qrlblLength.caption := formatfloat('0.0',(qryQEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';

  rUnitPrice := qryQEdges.fieldbyname('Unit_Price').asfloat;
  
  if bUseMarkup then
    rTotalPrice := (rUnitPrice * (qryQEdges.fieldbyname('Length').asfloat/1000)) * (1 + qryReport.FieldByName('Markup_Rate').Asfloat/100.0000)
  else
    rTotalPrice := rUnitPrice * (qryQEdges.fieldbyname('Length').asfloat/1000);

  lblEdgeTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuote.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  sNewLogo: string;
begin
  qrbPageHeader.Enabled := true;
  qrlblQuoteNumber.caption := qryReport.fieldbyname('Quote').asstring;
  
  sWorktop := '';

  {Extra Notes}
  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Extra_Notes').asinteger));

  qrcbNotes.Enabled := (trim(qrrchTextNotes.Lines[0]) <> '') and bPrintTotals;

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

  rGrossTotal := 0.00;

  qrmAddress.Lines.Clear;

  if dtmdlWorktops.UseRevenueCentres then
    begin
      if qryReport.FieldByName('Revenue_Centre').AsInteger <> 0 then
        begin
          sNewLogo := dtmdlWorktops.LoadRevenueCentreLogo(qryReport.FieldByName('Revenue_Centre').AsInteger);
          qriHeadlogo.picture.loadfromfile(sNewLogo);
          qriHeadlogo1.picture.loadfromfile(sNewLogo);
          GetRevenueCentreAddress;
        end
      else
        begin
          qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
          qriHeadlogo1.picture.loadfromfile('wtHeadLogo.bmp');
          GetCompanyAddress;
        end;
    end;

  bRetail := (qryReport.FieldByName('Address').AsInteger <> 0) and (qryReport.FieldByName('Customer_Is_Speculative').AsString <> 'Y');

  bUseMarkup := bRetail and dtmdlWorktops.PricesAreTrade;

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

  {Payment Terms notes are dependant on the type of customer. Retail or Trade}
  qrrchtextTerms.lines.Clear;
  if bRetail then
    qrrchtextTerms.lines.Add(BuildNotes(qryCompany.fieldbyname('Retail_Payment_Terms').asinteger))
  else
    qrrchtextTerms.lines.Add(BuildNotes(qryCompany.fieldbyname('Payment_Terms').asinteger));
end;

procedure TfrmwtRPQuote.qrbQFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rVat, rMarkup, rUnitCost, rNumberOfUnits: real;
begin
  qrlblNumberOfUnits.enabled := false;
  qrlblNumberOfUnitsLabel.enabled := false;

  if bApplyEndUserMarkup then
    begin
      if qryCustomer.fieldbyname('End_User_Price_Factor').asstring = 'M' then
        begin
          rMarkup := qryCustomer.fieldbyname('End_User_Markup_Percentage').asfloat;

          rMarkup := (1 + (rMarkup/100.0000));
        end
      else
      if qryCustomer.fieldbyname('End_User_Price_Factor').asstring = 'X' then
        begin
          rMarkup := GetCustomerMaterialTypeMultiplier(qryCustomer.fieldbyname('Customer').asinteger, qryReport.fieldbyname('Material_Type').asinteger);
          qrlblNumberOfUnits.enabled := true;
          qrlblNumberOfUnitsLabel.enabled := true;
        end
      else
        rMarkup := 1.000000;
    end
  else
    rMarkup := 1.000000;

(*  rTotal := (qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat + qryReport.FieldByName('Markup_Value').Asfloat) * (1 + (rMarkup/100.0000));

  qrlblGrossPrice.Caption := formatfloat('#,##0.00',rTotal);
  qrlblInstallation.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Installation_Price').Asfloat * (1 + (rMarkup/100.0000)));
  qrlblSurvey.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Survey_Price').Asfloat * (1 + (rMarkup/100.0000)));
  qrlblDelivery.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Delivery_Price').Asfloat * (1 + (rMarkup/100.0000)));
*)
  rUnitCost := qryCustomer.fieldbyname('Unit_Cost').asfloat;

  rTotal := (qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat + qryReport.FieldByName('Markup_Value').Asfloat) * rMarkup;

  qrlblGrossPrice.Caption := formatfloat('#,##0.00',rTotal);
  qrlblInstallation.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Installation_Price').Asfloat * rMarkup);
  qrlblSurvey.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Survey_Price').Asfloat * rMarkup);
  qrlblDelivery.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Delivery_Price').Asfloat * rMarkup);

  rNettTotal := (qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat + qryReport.FieldByName('Markup_Value').Asfloat)
                + qryReport.FieldByName('Installation_Price').Asfloat
                + qryReport.FieldByName('Survey_Price').Asfloat
                + qryReport.FieldByName('Delivery_Price').Asfloat;

  if rUnitCost > 0 then
    rNumberOfUnits := (rNettTotal / rUnitCost);

  rNettTotal := rNettTotal * rMarkup;

  rVat := rNettTotal * (qryReport.fieldbyname('VAT_Rate').asfloat/100);
  rGrossTotal := rVAT + rNettTotal;

  qrlblNumberOfUnits.caption := formatfloat('#,##0',rNumberOfUnits);

  qrlblNett.caption := formatfloat('#,##0.00',rNettTotal);
  qrlblVat.Caption := formatfloat('#,##0.00',rVAT);
  qrlblGross.Caption := formatfloat('#,##0.00',rGrossTotal);
  qrlblVatRate.Caption := formatfloat('0.00%',qryReport.fieldbyname('VAT_Rate').asfloat) + ' VAT';
  PrintBand := not self.bOnlyGrandTotal and not self.bExcludeTemplate and not self.bHideAllPrices and not bApplyEndUserMarkup;
end;

procedure TfrmwtRPQuote.qrcbAvailabilityBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPQuote.qrcbTermsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
begin
  qrcbTerms.height := 52;
  if trim(qrrchtextTerms.lines[0]) = '' then
    begin
      if bRetail then
        qrrchtextTerms.Lines.add(BuildNotes(qryCompany.fieldbyname('Retail_Payment_Terms').asinteger))
      else
        qrrchtextTerms.Lines.add(BuildNotes(qryCompany.fieldbyname('Payment_Terms').asinteger));
    end;
  iLines := qrrchtextTerms.lines.count;
  qrrchtextTerms.Height := iLines * 18;
  qrcbTerms.height := qrrchtextTerms.height + 32;
end;

function TfrmwtRPQuote.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPQuote.qrbQFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if not bPreview and (qryReport.FieldByName('Quote_Status').asinteger = 10) then
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

procedure TfrmwtRPQuote.qrcbNotesBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPQuote.qrcbSignatureBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPQuote.qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrbPageHeader.Enabled := false;
end;

procedure TfrmwtRPQuote.qrcbAcceptanceHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
//  qrbPageFooter.Enabled := false;
end;

function TfrmwtRPQuote.GetCompanyAddress: string;
var
  i: integer;
begin
  qrlblCompanyAdd.caption := '';
  for i := 19 to 22 do
    begin
      if qryCompany.Fields[i].asstring = '' then
        continue
      else
        qrlblCompanyAdd.caption := qrlblCompanyAdd.caption + qryCompany.Fields[i].AsString;
      if i <> 22 then
        qrlblCompanyAdd.caption := qrlblCompanyAdd.caption + ', '
    end;
  qrlblCompanyAdd1.caption := qrlblCompanyAdd.caption;
end;

procedure TfrmwtRPQuote.qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblExtraQuantity.caption := qryQExtras.fieldbyname('Quantity').asstring + ' ' + 'No.';
  qrlblExtraDescription.caption := qryQExtras.fieldbyname('Description').asstring;

  rUnitPrice := qryQExtras.fieldbyname('Unit_Price').asfloat;
  if bUseMarkup then
    rTotalPrice := (rUnitPrice * (qryQExtras.fieldbyname('Quantity').asfloat)) * (1 + qryReport.FieldByName('Markup_Rate').Asfloat/100.0000)
  else
    rTotalPrice := rUnitPrice * (qryQExtras.fieldbyname('Quantity').asfloat);
  lblExtraTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuote.qrcbDiscountBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if bUseMarkup then
    begin
      PrintBand := false;
      exit;
(*      if qryReport.FieldByName('Markup_Rate').Asfloat = 0 then
        PrintBand := false;
      lblDiscount.caption := formatfloat('##0.00%',qryReport.FieldByName('Markup_Rate').Asfloat) + ' MARKUP';
      qrlblDiscountValue.Caption := formatfloat('##0.00',qryReport.FieldByName('Markup_Value').Asfloat);
      PrintBand := (qryReport.FieldByName('Markup_Value').Asfloat <> 0);
*)
    end
  else
    begin
      if qryReport.FieldByName('Discount_Rate').Asfloat = 0 then
        PrintBand := false;
      lblDiscount.caption := formatfloat('##0.00%',qryReport.FieldByName('Discount_Rate').Asfloat) + ' DISCOUNT';
      qrlblDiscountValue.Caption := formatfloat('##0.00',qryReport.FieldByName('Discount_Value').Asfloat);
      PrintBand := (qryReport.FieldByName('Discount_Value').Asfloat <> 0);
    end;
end;

procedure TfrmwtRPQuote.qrbExtraFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if bUseMarkup then
    begin
      PrintBand := false;
      exit;
(*      if qryReport.FieldByName('Markup_Rate').Asfloat = 0 then
        PrintBand := false;
      lblDiscount.caption := formatfloat('##0.00%',qryReport.FieldByName('Markup_Rate').Asfloat) + ' MARKUP';
      qrlblDiscountValue.Caption := formatfloat('##0.00',qryReport.FieldByName('Markup_Value').Asfloat);
      PrintBand := (qryReport.FieldByName('Markup_Value').Asfloat <> 0);
*)
    end
  else
    begin
      if qryReport.FieldByName('Discount_Rate').Asfloat = 0 then
        PrintBand := false;
      lblDiscount.caption := formatfloat('##0.00%',qryReport.FieldByName('Discount_Rate').Asfloat) + ' DISCOUNT';
      qrlblDiscountValue.Caption := formatfloat('##0.00',qryReport.FieldByName('Discount_Value').Asfloat);
      PrintBand := (qryReport.FieldByName('Discount_Value').Asfloat <> 0);
    end;
end;

function TfrmwtRPQuote.PrintToFile(QuoteNo: integer; attachmentType: string): TStringList;
var
  fileName, fileLocation: string;
  AFilters: TGtQRFilters;
  RTFFilter: TGtQRRTFFilter;
  HTMLFilter: TGtQRHTMLFilter;
  PDFFilter: TGtQRPDFFilter;
  BMPFilter: TGtQRBMPFilter;
  GIFFilter: TGtQRGIFFilter;
  JPEGFilter: TGtQRJPEGFilter;
  i: integer;
begin
  Result := TStringList.Create;
  self.Quote := QuoteNo;
  self.bPreview := false;
  if self.GetDetails = 0 then
    exit;
    
  qrpDetails.Prepare;

  fileLocation := GetWinTempDir;
  fileName := fileLocation + 'Q' + FloatToStr(QuoteNo) + '.' + attachmentType;

  AFilters := TGtQRFilters.Create(self);
  if AnsiLowerCase(attachmentType) = 'pdf' then
  begin
    PDFFilter := TGtQRPDFFilter.Create(fileName);
    try
      qrpDetails.ExportToFilter(PDFFilter);
      Result.add(fileName);
    finally
      qrpDetails.QRPrinter.Free;
      qrpDetails.QRPrinter := nil;
      PDFFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'rtf' then
  begin
    RTFFilter := TGtQRRTFFilter.Create(fileName);
    try
      qrpDetails.ExportToFilter(RTFFilter);
      Result.add(fileName);
    finally
      qrpDetails.QRPrinter.Free;
      qrpDetails.QRPrinter := nil;
      RTFFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'gif' then
  begin
    GIFFilter := TGtQRGIFFilter.Create(fileName);
    try
      qrpDetails.Prepare;
      qrpDetails.ExportToFilter(GIFFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      qrpDetails.QRPrinter.Free;
      qrpDetails.QRPrinter := nil;
      GIFFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'bmp' then
  begin
    BMPFilter := TGtQRBMPFilter.Create(fileName);
    try
      qrpDetails.Prepare;
      qrpDetails.ExportToFilter(BMPFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      qrpDetails.QRPrinter.Free;
      qrpDetails.QRPrinter := nil;
      BMPFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'html' then
  begin
    HTMLFilter := TGtQRHTMLFilter.Create(fileName);
    try
      qrpDetails.Prepare;
      qrpDetails.ExportToFilter(HTMLFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      qrpDetails.QRPrinter.Free;
      qrpDetails.QRPrinter := nil;
      HTMLFilter.Free;
    end;
  end
  else if AnsiLowerCase(attachmentType) = 'jpeg' then
  begin
    JPEGFilter := TGtQRJPEGFilter.Create(fileName);
    try
      qrpDetails.Prepare;
      qrpDetails.ExportToFilter(JPEGFilter);

      //Assign all the Filenames to the Attachment list
      for i := 0 to pred(AFilters.RepFileCount) do
        Result.add(fileLocation + AFilters.RepFileNames[i]);
    finally
      qrpDetails.QRPrinter.Free;
      qrpDetails.QRPrinter := nil;
      JPEGFilter.Free;
    end;
  end;

  AFilters.free;
end;

procedure TfrmwtRPQuote.qrcbSubTotalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := not self.bOnlyGrandTotal and not self.bHideAllPrices and not bApplyEndUserMarkup;
end;

procedure TfrmwtRPQuote.qrcbTotalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if bApplyEndUserMarkup then
    qrlblTotal.caption := 'Total incl VAT';
  PrintBand := not self.bHideAllPrices;

end;

function TfrmwtRPQuote.GetRevenueCentreAddress: string;
var
  i: integer;
begin
  qrlblCompanyAdd.caption := '';
  with qryRevenueCentre do
    begin
      close;
      parambyname('Revenue_Centre').asinteger := qryReport.FieldByName('Revenue_Centre').AsInteger;
      open;

      qrlblCompanyAdd.caption := trim(fieldbyname('Registered_Address').asstring);
      qrlblCompanyAdd1.caption := trim(fieldbyname('Registered_Address').asstring);
    end;
end;

function TfrmwtRPQuote.GetCustomerMaterialTypeMultiplier(tmpCustomer, tmpMatType: integer): real;
begin
  Result := 0.00;

  with qryGetCustMaterialType do
    begin
      close;
      parambyname('Customer').asinteger := tmpCustomer;
      parambyname('Material_Type').asinteger := tmpMatType;
      open;
      result := fieldbyname('Retail_Multiplier').asfloat
    end;
end;

end.
