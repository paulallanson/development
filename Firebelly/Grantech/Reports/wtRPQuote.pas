unit wtRPQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrExport, gtQrCtrls,
  jpeg;

type
  TfrmwtRPQuote = class(TForm)
    qrpDetails: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TQuery;
    qrbPageHeader: TQRBand;
    qryQElements: TQuery;
    dtsReport: TDataSource;
    qrsdQElements: TQRSubDetail;
    lblWorktopSize: TgtQRLabel;
    lblWorktopArea: TgtQRLabel;
    qrsdQEdges: TQRSubDetail;
    qryQCutOuts: TQuery;
    qrsdQCutOuts: TQRSubDetail;
    qrsdQExtras: TQRSubDetail;
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
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qryUpQuote: TQuery;
    qrcbNotes: TQRChildBand;
    qrlNotes: TgtQRLabel;
    qrlblQuoteCaption: TgtQRLabel;
    qrrchTextNotes: TgtQRRichText;
    qrrchTextAvailability: TgtQRRichText;
    QRDBText5: TgtQRDBText;
    qryEndUser: TQuery;
    gtQRFilters1: TgtQRFilters;
    lblWorktopTotal: TgtQRLabel;
    lblExtraTotal: TgtQRLabel;
    qriHeadLogo: TgtQRImage;
    qrcbDiscount: TQRBand;
    lblDiscount: TgtQRLabel;
    qrlblDiscountValue: TgtQRLabel;
    qrcbTotal: TQRChildBand;
    QRShape4: TgtQRShape;
    QRLabel18: TgtQRLabel;
    qrlblGross: TgtQRLabel;
    qrmemCompanyAdd: TgtQRMemo;
    qrmAddress: TgtQRMemo;
    gtQRShape6: TgtQRShape;
    gtQRShape8: TgtQRShape;
    QRLabel2: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    gtQRShape13: TgtQRShape;
    gtQRShape2: TgtQRShape;
    gtQRShape3: TgtQRShape;
    QRLabel5: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    gtQRShape7: TgtQRShape;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    qrcbPriceMatch: TQRChildBand;
    qrcbAcceptanceHeader: TQRChildBand;
    QRLabel26: TgtQRLabel;
    QRLabel27: TgtQRLabel;
    QRDBText7: TgtQRDBText;
    QRDBText8: TgtQRDBText;
    QRLabel29: TgtQRLabel;
    QRDBText9: TgtQRDBText;
    QRLabel30: TgtQRLabel;
    QRDBText10: TgtQRDBText;
    qrcbSignature: TQRChildBand;
    QRShape8: TgtQRShape;
    QRShape9: TgtQRShape;
    QRLabel13: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    QRLabel15: TgtQRLabel;
    QRShape1: TgtQRShape;
    QRShape2: TgtQRShape;
    QRShape3: TgtQRShape;
    QRLabel12: TgtQRLabel;
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
    QRLabel24: TgtQRLabel;
    QRShape6: TgtQRShape;
    QRShape7: TgtQRShape;
    QRLabel25: TgtQRLabel;
    QRLabel28: TgtQRLabel;
    QRShape10: TgtQRShape;
    QRLabel11: TgtQRLabel;
    QRShape11: TgtQRShape;
    qrcbTerms: TQRChildBand;
    QRLabel10: TgtQRLabel;
    qrrchtextTerms: TgtQRRichText;
    qrbPageFooter: TQRBand;
    qrlblYourPhone: TgtQRLabel;
    qrlblYourEmail: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel5: TgtQRLabel;
    qrlblTotalArea: TgtQRLabel;
    qrlblTotalAreaCaption: TgtQRLabel;
    qrlblTotalArea1: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    qrlblQuantity: TgtQRLabel;
    lblCutOutTotal: TgtQRLabel;
    qrlblLength: TgtQRLabel;
    lblEdgeTotal: TgtQRLabel;
    qrlblExtraDescription: TgtQRLabel;
    qrlblExtraQuantity: TgtQRLabel;
    qrlblEdgeDescription: TgtQRLabel;
    qrlblCutOut: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    qrcbSubTotal: TQRChildBand;
    qrlblVatRate: TgtQRLabel;
    qrlblVAT: TgtQRLabel;
    qrlblNett: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    qrcbNotesDirection: TQRChildBand;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRShape15: TgtQRShape;
    gtQRShape16: TgtQRShape;
    qrlblPriceMatch: TgtQRLabel;
    gtQRShape11: TgtQRShape;
    gtQRShape4: TgtQRShape;
    gtQRShape5: TgtQRShape;
    gtQRShape10: TgtQRShape;
    gtQRLabel9: TgtQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrsdQElementsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
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
    procedure qrcbPriceMatchBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbSubTotalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
    function GetCompanyAddress: string;
  public
    Quote: integer;
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
    bApplyEndUserMarkup: boolean;
    bHideAllPrices: boolean;
    function Getdetails: integer;
    function PrintToFile(QuoteNo: integer; attachmentType: string): TStringList;
  end;

var
  frmwtRPQuote: TfrmwtRPQuote;

implementation

uses AllCommon, wtDataModule;

var
  rGrossTotal, rTotalArea: real;

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

  lblWorktoptotal.Enabled := bprintDetail;
  lblEdgetotal.Enabled := bprintDetail;
  lblCutOuttotal.Enabled := bprintDetail;
  lblExtratotal.Enabled := bprintDetail;

  qrcbDiscount.Enabled := bPrintDetail or bPrintDiscount;

  qrbPageHeader.Enabled := true;
  qriHeadLogo.enabled := bPrintLogo;
  qrmemCompanyAdd.Enabled := qriHeadLogo.enabled;

  with qryCompany do
    begin
      close;
      open;
    end;

  getCompanyAddress;

  qrrchTextAvailability.lines.clear;
  qrrchtextTerms.lines.Clear;
  qrrchTextAvailability.lines.add(BuildNotes(qryCompany.fieldbyname('Availability').asinteger));
  qrrchtextTerms.lines.Add(BuildNotes(qryCompany.fieldbyname('Payment_Terms').asinteger));

  qrcbAvailability.enabled := (trim(qrrchtextAvailability.lines[0]) <> '') and bPrintTotals;

  if (bPrintLogo = false) and (bPrintDetail = false) and (bPrintAcceptance = false) and (bPrintTotals = false) then
    begin
      qrlblQuoteCaption.caption := 'Works Copy';
      qrcbNotesDirection.Enabled := true;
      qrcbPriceMatch.height := 25;
    end;
end;

procedure TfrmwtRPQuote.FormCreate(Sender: TObject);
var
  LocalDir: string;
begin
  try
    LocalDir := extractfilepath(application.exename);
    qriHeadlogo.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
    qriHeadLogo.Picture.Bitmap.PixelFormat := pfDevice;
  except
  end;
  bPrintAcceptance := true;
  bPrintTotals := true;
end;

procedure TfrmwtRPQuote.qrsdQElementsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rArea, rUnitPrice, rTotalPrice, rPolishedPrice: real;
  sUpstand, sDescription, sElementLabel: string;
begin
  lblWorktopSize.caption := '';
  lblWorktopArea.caption := '';

  sElementLabel := trim(qryQElements.fieldbyname('Element_Description').asstring);
  if sElementLabel <> '' then
    sElementLabel := sElementLabel + ' - ';

  if qryQElements.fieldbyname('Description').asstring <> sWorktop then
    begin
      sWorktop := qryQElements.fieldbyname('Description').asstring;
      sDescription := qryQElements.fieldbyname('Thickness_mm').asstring + ' ' +
                      qryQElements.fieldbyname('Description').asstring;
    end
  else
    sDescription := '';

  if qryQElements.fieldbyname('Element_number').asinteger > 1000 then
    begin
      sElementLabel := '';
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

  lblWorktopSize.caption := sElementLabel + sDescription + sUpstand +
                            qryQElements.fieldbyname('Length').asstring + ' x ' +
                            qryQElements.fieldbyname('Depth').asstring + ' x ' +
                            qryQElements.fieldbyname('Quantity').asstring;
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

//  if qryQElements.fieldbyname('Element_number').asinteger < 1000 then
  rTotalArea := rTotalArea + rArea;
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

procedure TfrmwtRPQuote.qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblQuantity.caption := qryQCutOuts.fieldbyname('Quantity').asstring;
  qrlblCutOut.caption := qryQCutOuts.fieldbyname('Description').asstring;

  rUnitPrice := qryQCutOuts.fieldbyname('Unit_Price').asfloat;
  if bUseMArkup then
    rTotalPrice := (rUnitPrice * qryQCutOuts.fieldbyname('Quantity').asinteger) * (1 + qryReport.FieldByName('Markup_Rate').Asfloat/100.0000)
  else
    rTotalPrice := (rUnitPrice * qryQCutOuts.fieldbyname('Quantity').asinteger);
  lblCutOutTotal.caption := formatfloat('##0.00',rTotalPrice);

end;

procedure TfrmwtRPQuote.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  sText: string;
begin
  qrbPageHeader.Enabled := true;
  
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
  rTotalArea := 0.00;

  qrlblTotalArea.caption := '0.00';
  qrlblTotalArea1.caption := '0.00';

  qrmAddress.Lines.Clear;

  bRetail := (qryReport.FieldByName('Address').AsInteger <> 0);

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
      qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[1].asstring));
      if (trim(qryReport.FieldByName('Contact_Name').AsString) <> trim(qryReport.FieldByName('Customer_Name').AsString)) AND (trim(qryReport.FieldByName('Contact_Name').AsString) <> '') then
        qrmAddress.Lines.Add(qryReport.FieldByName('Contact_Name').AsString);
      for i := 2 to 6 do
        begin
          if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
            qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
        end;

      qrlblYourEmail.caption := dtsAddress.DataSet.fieldbyname('Email_Address').asstring;
      qrlblYourPhone.caption := dtsAddress.DataSet.fieldbyname('Telephone_Number').asstring;

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

  qrlblPriceMatch.Enabled := bRetail;
end;

procedure TfrmwtRPQuote.qrbQFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rVat, rMarkup: real;
begin
  if bApplyEndUserMarkup then
    rMarkup := qryCustomer.fieldbyname('End_User_Markup_percentage').asfloat
  else
    rMarkup := 0.00;

  rTotal := (qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat + qryReport.FieldByName('Markup_Value').Asfloat) * (1 + (rMarkup/100.0000));

  qrlblGrossPrice.Caption := formatfloat('#,##0.00',rTotal);

  qrlblInstallation.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Installation_Price').Asfloat * (1 + (rMarkup/100.0000)));
  qrlblSurvey.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Survey_Price').Asfloat * (1 + (rMarkup/100.0000)));
  qrlblDelivery.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Delivery_Price').Asfloat * (1 + (rMarkup/100.0000)));

  rNettTotal := (qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat + qryReport.FieldByName('Markup_Value').Asfloat)
                + qryReport.FieldByName('Installation_Price').Asfloat
                + qryReport.FieldByName('Survey_Price').Asfloat
                + qryReport.FieldByName('Delivery_Price').Asfloat;

  rNettTotal := rNettTotal * (1 + (rMarkup/100.0000));

  rVat := rNettTotal * (qryReport.fieldbyname('VAT_Rate').asfloat/100);
  rGrossTotal := rVAT + rNettTotal;
  qrlblNett.caption := formatfloat('#,##0.00',rNettTotal);
  qrlblVat.Caption := formatfloat('#,##0.00',rVAT);
  qrlblGross.Caption := formatfloat('#,##0.00',rGrossTotal);
  qrlblTotalArea.Caption := formatfloat('#,##0.00',rTotalArea);
  qrlblVatRate.Caption := formatfloat('0.00%',qryReport.fieldbyname('VAT_Rate').asfloat) + ' VAT';
  PrintBand := not self.bOnlyGrandTotal and not self.bExcludeTemplate;
end;

procedure TfrmwtRPQuote.qrcbAvailabilityBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
begin
(*  qrrchTextAvailability.lines.clear;
  qrcbAvailability.height := 47;
  if trim(qrrchTextAvailability.lines[0]) = '' then
    qrrchTextAvailability.lines.Add(BuildNotes(qryCompany.fieldbyname('Availability').asinteger));
  iLines := qrrchTextAvailability.lines.count;
  qrrchTextAvailability.Height := iLines * 15;
  qrcbAvailability.height := qrrchTextAvailability.height + 30;
*)
end;

procedure TfrmwtRPQuote.qrcbTermsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
begin
  qrcbTerms.height := 42;
  if trim(qrrchtextTerms.lines[0]) = '' then
    begin
      if bRetail then
        qrrchtextTerms.Lines.add(BuildNotes(qryCompany.fieldbyname('Retail_Payment_Terms').asinteger))
      else
        qrrchtextTerms.Lines.add(BuildNotes(qryCompany.fieldbyname('Payment_Terms').asinteger));
    end;
//  iLines := qrrchtextTerms.lines.count;
//  qrrchtextTerms.Height := iLines * 16;
//  qrcbTerms.height := qrrchtextTerms.height + 26;
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
(*  qrcbNotes.height := 43;
  if trim(qrrchtextNotes.lines[0]) = '' then
    qrlNotes.Caption := '';
  iLines := qrrchTextNotes.lines.count;
  qrrchTextNotes.Height := iLines * 17;
  qrcbNotes.height := qrrchTextNotes.height + 26;
*)
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
  sText: string;
begin
  qrmemCompanyAdd.lines.clear;
  sText := qryCompany.Fields[19].asstring;
  for i := 20 to 22 do
    begin
      if qryCompany.Fields[i].asstring = '' then
        continue
      else
        stext := stext + ', ' + Trim(qryCompany.Fields[i].asstring) ;
    end;
  qrmemCompanyAdd.Lines.Append(sText);
      {Finally, add the phone number} ;
  qrmemCompanyAdd.Lines.Append('Tel: ' + Trim(qryCompany.fieldbyname('Telephone_number').asstring));
  if Trim(qryCompany.fieldbyname('Fax_Number').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append('Fax: ' + Trim(qryCompany.fieldbyname('Fax_Number').asstring));
  if Trim(qryCompany.fieldbyname('Email_Address').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append('Email: ' + Trim(qryCompany.fieldbyname('Email_Address').asstring));
  if Trim(qryCompany.fieldbyname('Web_Address').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append('Web: ' + Trim(qryCompany.fieldbyname('Web_Address').asstring));
(*  qrmemCompanyAdd.lines.clear;
  for i := 19 to 22 do
    begin
      if qryCompany.Fields[i].asstring = '' then
        continue
      else
        qrmemCompanyAdd.Lines.Append(Trim(qryCompany.Fields[i].asstring)) ;
    end;
      {Finally, add the phone number} ;
  qrmemCompanyAdd.Lines.Append('Tel: ' + Trim(qryCompany.fieldbyname('Telephone_number').asstring));
  if Trim(qryCompany.fieldbyname('Fax_Number').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append('Fax: ' + Trim(qryCompany.fieldbyname('Fax_Number').asstring));
  if Trim(qryCompany.fieldbyname('Email_Address').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append(Trim(qryCompany.fieldbyname('Email_Address').asstring));
  if Trim(qryCompany.fieldbyname('Web_Address').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append(Trim(qryCompany.fieldbyname('Web_Address').asstring));
*)
end;

procedure TfrmwtRPQuote.qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblExtraQuantity.caption := qryQExtras.fieldbyname('Quantity').asstring;
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

procedure TfrmwtRPQuote.qrcbPriceMatchBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotalArea1.Caption := formatfloat('#,##0.00',rTotalArea) + 'm2';
  qrlblTotalAreaCaption.enabled := not bPrintTotals;
  qrlblTotalArea1.enabled := not bPrintTotals;

//  qriPriceMatch.enabled := bPrintLogo;
end;

procedure TfrmwtRPQuote.qrcbSubTotalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := not self.bOnlyGrandTotal;
end;

end.
