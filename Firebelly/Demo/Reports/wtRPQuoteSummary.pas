unit wtRPQuoteSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, QrExport, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPQuoteSummary = class(TForm)
    qrpDetails: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TFDQuery;
    qrbPageHeader: TQRBand;
    qrbPageFooter: TQRBand;
    qryQElements: TFDQuery;
    dtsReport: TDataSource;
    qrsdQElements: TQRSubDetail;
    lblWorktopSize: TQRLabel;
    lblWorktopArea: TQRLabel;
    qrsdQCutOuts: TQRSubDetail;
    qryQCutOuts: TFDQuery;
    qrlblQuantity: TQRLabel;
    qrsdQEdges: TQRSubDetail;
    qrlblLength: TQRLabel;
    qrsdQExtras: TQRSubDetail;
    qryQEdges: TFDQuery;
    qryQExtras: TFDQuery;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
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
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qryUpQuote: TFDQuery;
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
    QRLabel12: TQRLabel;
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
    QRLabel28: TQRLabel;
    QRShape10: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    qryEndUser: TFDQuery;
    QRLabel11: TQRLabel;
    QRShape11: TQRShape;
    gtQRFilters1: TgtQRFilters;
    lblWorktopTotal: TQRLabel;
    lblCutOutTotal: TQRLabel;
    lblEdgeTotal: TQRLabel;
    lblExtraTotal: TQRLabel;
    qriHeadLogo: TQRImage;
    qrcbDiscount: TQRBand;
    lblDiscount: TQRLabel;
    qrlblDiscountValue: TQRLabel;
    qrcbTotal: TQRChildBand;
    QRShape4: TQRShape;
    QRLabel18: TQRLabel;
    qrlblGross: TQRLabel;
    qrmemCompanyAdd: TQRMemo;
    qrmAddress: TQRMemo;
    gtQRShape6: TQRShape;
    gtQRShape9: TQRShape;
    gtQRShape8: TQRShape;
    gtQRShape12: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    gtQRShape13: TQRShape;
    gtQRShape2: TQRShape;
    gtQRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    qrlblCutOut: TQRLabel;
    qrlblEdgeDescription: TQRLabel;
    qrlblExtraDescription: TQRLabel;
    qrlblExtraQuantity: TQRLabel;
    qrcbSubTotal: TQRChildBand;
    qrlblVatRate: TQRLabel;
    qrlblVAT: TQRLabel;
    qrlblNett: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRLabel1: TQRLabel;
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
    bOnlyGrandTotal: boolean;
    bPreview: boolean;
    bPrintDetail: boolean;
    bPrintDiscount: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bPrintTotals: boolean;
    bShowOffer: boolean;
    bApplyEndUserMarkup: boolean;
    function Getdetails: integer;
    function PrintToFile(QuoteNo: integer; attachmentType: string): TStringList;
  end;

var
  frmwtRPQuoteSummary: TfrmwtRPQuoteSummary;

implementation

uses AllCommon;

var
  rGrossTotal: real;

{$R *.dfm}

function TfrmwtRPQuoteSummary.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Quote').asinteger := self.Quote;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPQuoteSummary.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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
end;

procedure TfrmwtRPQuoteSummary.FormCreate(Sender: TObject);
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

procedure TfrmwtRPQuoteSummary.qrsdQElementsBeforePrint(Sender: TQRCustomBand;
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
    sDescription := '';

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
                            qryQElements.fieldbyname('Depth').asstring + ' x ' +
                            qryQElements.fieldbyname('Quantity').asstring;
  rArea :=  ((qryQElements.fieldbyname('Length').asinteger *
            qryQElements.fieldbyname('Depth').asinteger *
            qryQElements.fieldbyname('Quantity').asinteger)/1000000);
  lblWorktopArea.caption := formatfloat('0.00',rArea) + ' ' + 'm2';

  rPolishedPrice := (((qryQElements.fieldbyname('Length').asinteger/1000) * qryQElements.fieldbyname('No_of_Polished_Lengths').asinteger) * qryQElements.fieldbyname('Upstand_Polish_Price').asfloat)
                  + (((qryQElements.fieldbyname('Depth').asinteger/1000) * qryQElements.fieldbyname('No_of_Polished_Depths').asinteger) * qryQElements.fieldbyname('Upstand_Polish_Price').asfloat);

  rUnitPrice := qryQElements.fieldbyname('Unit_Price').asfloat;
  rTotalPrice := (rUnitPrice * rArea) + rPolishedPrice;
  lblWorktopTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuoteSummary.qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblQuantity.caption := qryQCutOuts.fieldbyname('Quantity').asstring + ' ' + 'No.';
  qrlblCutOut.caption := qryQCutOuts.fieldbyname('Description').asstring;

  rUnitPrice := qryQCutOuts.fieldbyname('Unit_Price').asfloat;
  rTotalPrice := rUnitPrice * qryQCutOuts.fieldbyname('Quantity').asinteger;
  lblCutOutTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuoteSummary.qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblEdgeDescription.caption := qryQEdges.fieldbyname('Description').asstring;
  qrlblLength.caption := formatfloat('0.0',(qryQEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';

  rUnitPrice := qryQEdges.fieldbyname('Unit_Price').asfloat;
  rTotalPrice := rUnitPrice * (qryQEdges.fieldbyname('Length').asfloat/1000);
  lblEdgeTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuoteSummary.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
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

procedure TfrmwtRPQuoteSummary.qrbQFooterBeforePrint(Sender: TQRCustomBand;
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

  rVat := rNettTotal * (qryReport.fieldbyname('VAT_Rate').asfloat/100);
  rGrossTotal := rVAT + rNettTotal;
  qrlblNett.caption := formatfloat('#,##0.00',rNettTotal);
  qrlblVat.Caption := formatfloat('#,##0.00',rVAT);
  qrlblGross.Caption := formatfloat('#,##0.00',rGrossTotal);
  qrlblVatRate.Caption := formatfloat('0.00%',qryReport.fieldbyname('VAT_Rate').asfloat) + ' VAT';
  PrintBand := not self.bOnlyGrandTotal and not self.bExcludeTemplate;
end;

procedure TfrmwtRPQuoteSummary.qrcbAvailabilityBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPQuoteSummary.qrcbTermsBeforePrint(Sender: TQRCustomBand;
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

function TfrmwtRPQuoteSummary.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPQuoteSummary.qrbQFooterAfterPrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPQuoteSummary.qrcbNotesBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPQuoteSummary.qrcbSignatureBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPQuoteSummary.qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrbPageHeader.Enabled := false;
end;

procedure TfrmwtRPQuoteSummary.qrcbAcceptanceHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
//  qrbPageFooter.Enabled := false;
end;

function TfrmwtRPQuoteSummary.GetCompanyAddress: string;
var
  i: integer;
begin
  qrmemCompanyAdd.lines.clear;
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
end;

procedure TfrmwtRPQuoteSummary.qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblExtraQuantity.caption := qryQExtras.fieldbyname('Quantity').asstring + ' ' + 'No.';
  qrlblExtraDescription.caption := qryQExtras.fieldbyname('Description').asstring;

  rUnitPrice := qryQExtras.fieldbyname('Unit_Price').asfloat;
  rTotalPrice := rUnitPrice * (qryQExtras.fieldbyname('Quantity').asfloat);
  lblExtraTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPQuoteSummary.qrcbDiscountBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblDiscountValue.Caption := formatfloat('##0.00',qryReport.FieldByName('Discount_Value').Asfloat);
  PrintBand := (qryReport.FieldByName('Discount_Value').Asfloat <> 0);
end;

function TfrmwtRPQuoteSummary.PrintToFile(QuoteNo: integer; attachmentType: string): TStringList;
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

procedure TfrmwtRPQuoteSummary.qrcbSubTotalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := not self.bOnlyGrandTotal;
end;

end.
