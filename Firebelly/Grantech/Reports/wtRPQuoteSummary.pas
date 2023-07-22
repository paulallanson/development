unit wtRPQuoteSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, QrExport, 
  jpeg,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPQuoteSummary = class(TForm)
    qrpDetails: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TFDQuery;
    qrbPageHeader: TQRBand;
    qryQElements: TFDQuery;
    dtsReport: TDataSource;
    qrsdQElements: TQRSubDetail;
    lblWorktopSize: TQRLabel;
    lblWorktopArea: TQRLabel;
    qrsdQEdges: TQRSubDetail;
    qryQCutOuts: TFDQuery;
    qrsdQCutOuts: TQRSubDetail;
    qrsdQExtras: TQRSubDetail;
    qryQEdges: TFDQuery;
    qryQExtras: TFDQuery;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qrbQFooter: TQRBand;
    qrcbAvailability: TQRChildBand;
    QRLabel9: TQRLabel;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qryUpQuote: TFDQuery;
    qrcbNotes: TQRChildBand;
    qrlNotes: TQRLabel;
    qrlblQuoteCaption: TQRLabel;
    qrrchTextNotes: TQRRichText;
    qrrchTextAvailability: TQRRichText;
    QRDBText5: TQRDBText;
    qryEndUser: TFDQuery;
    qriHeadLogo: TQRImage;
    qrmemCompanyAdd: TQRMemo;
    qrmAddress: TQRMemo;
    gtQRShape6: TQRShape;
    gtQRShape9: TQRShape;
    gtQRShape8: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    gtQRShape13: TQRShape;
    gtQRShape2: TQRShape;
    gtQRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    gtQRShape4: TQRShape;
    gtQRShape7: TQRShape;
    gtQRShape10: TQRShape;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRShape5: TQRShape;
    gtQRLabel4: TQRLabel;
    qrcbPriceMatch: TQRChildBand;
    qrcbTerms: TQRChildBand;
    QRLabel10: TQRLabel;
    qrrchtextTerms: TQRRichText;
    qrbPageFooter: TQRBand;
    qrlblYourPhone: TQRLabel;
    qrlblYourEmail: TQRLabel;
    gtQRDBText1: TQRDBText;
    qrlblTotalAreaCaption: TQRLabel;
    qrlblTotalArea1: TQRLabel;
    gtQRShape12: TQRShape;
    gtQRShape14: TQRShape;
    gtQRLabel6: TQRLabel;
    qriPriceMatch: TQRImage;
    qrlblQuantity: TQRLabel;
    qrlblLength: TQRLabel;
    qrlblExtraDescription: TQRLabel;
    qrlblExtraQuantity: TQRLabel;
    qrlblEdgeDescription: TQRLabel;
    qrlblCutOut: TQRLabel;
    gtQRDBText2: TQRDBText;
    qrcbNotesDirection: TQRChildBand;
    gtQRLabel7: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    qryQOptions: TFDQuery;
    qrsdQOptions: TQRSubDetail;
    lblOptionDescription: TQRLabel;
    lblQuoteOption: TQRLabel;
    lblOptionComplete: TQRLabel;
    lblOptionVAT: TQRLabel;
    lblOptionTotal: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlblInstallation: TQRLabel;
    qrlblSurvey: TQRLabel;
    qrlblDelivery: TQRLabel;
    gtQRLabel9: TQRLabel;
    qrcbDiscount: TQRBand;
    gtQRLabel1: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRLabel10: TQRLabel;
    gtQRLabel11: TQRLabel;
    gtQRLabel12: TQRLabel;
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
    procedure qrsdQOptionsBeforePrint(Sender: TQRCustomBand;
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
    function Getdetails: integer;
    function PrintToFile(QuoteNo: integer; attachmentType: string): TStringList;
  end;

var
  frmwtRPQuoteSummary: TfrmwtRPQuoteSummary;

implementation

uses
  AllCommon, wtDataModule, Printer.Tools;

var
  rGrossTotal, rTotalArea: real;

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
  qrbQFooter.enabled := bPrintTotals;
  qrcbNotes.enabled := bPrintTotals;
  qrcbTerms.enabled := bPrintTotals;
  qrcbAvailability.enabled := bPrintTotals;

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
  rTotalArea := rTotalArea + rArea;
end;

procedure TfrmwtRPQuoteSummary.qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblEdgeDescription.caption := qryQEdges.fieldbyname('Description').asstring;
  qrlblLength.caption := formatfloat('0.0',(qryQEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';
end;

procedure TfrmwtRPQuoteSummary.qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblQuantity.caption := qryQCutOuts.fieldbyname('Quantity').asstring + ' ' + 'No.';
  qrlblCutOut.caption := qryQCutOuts.fieldbyname('Description').asstring;

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
  with qryQOptions do
    begin
      close;
      open;
      qrsdQOptions.Enabled := (recordcount > 0)
    end;

  rGrossTotal := 0.00;
  rTotalArea := 0.00;

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

  {Payment Terms notes are dependant on the type of customer. Retail or Trade}
  qrrchtextTerms.lines.Clear;
  if bRetail then
    qrrchtextTerms.lines.Add(BuildNotes(qryCompany.fieldbyname('Retail_Payment_Terms').asinteger))
  else
    qrrchtextTerms.lines.Add(BuildNotes(qryCompany.fieldbyname('Payment_Terms').asinteger));
end;

procedure TfrmwtRPQuoteSummary.qrbQFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rVat: real;
begin
  rTotal := qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat + qryReport.FieldByName('Markup_Value').Asfloat;
  qrlblInstallation.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Installation_Price').Asfloat);
  qrlblSurvey.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Survey_Price').Asfloat);
  qrlblDelivery.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Delivery_Price').Asfloat);

  rNettTotal := (qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat + qryReport.FieldByName('Markup_Value').Asfloat)
                + qryReport.FieldByName('Installation_Price').Asfloat
                + qryReport.FieldByName('Survey_Price').Asfloat
                + qryReport.FieldByName('Delivery_Price').Asfloat;

  rVat := rNettTotal * (qryReport.fieldbyname('VAT_Rate').asfloat/100);
  rGrossTotal := rVAT + rNettTotal;
  PrintBand := not self.bOnlyGrandTotal and not self.bExcludeTemplate;
end;

procedure TfrmwtRPQuoteSummary.qrcbAvailabilityBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
begin
  qrrchTextAvailability.lines.clear;
  qrcbAvailability.height := 47;
  if trim(qrrchTextAvailability.lines[0]) = '' then
    qrrchTextAvailability.lines.Add(BuildNotes(qryCompany.fieldbyname('Availability').asinteger));
  iLines := qrrchTextAvailability.lines.count;
  qrrchTextAvailability.Height := iLines * 15;
  qrcbAvailability.height := qrrchTextAvailability.height + 30;
end;

procedure TfrmwtRPQuoteSummary.qrcbTermsBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPQuoteSummary.qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblExtraQuantity.caption := qryQExtras.fieldbyname('Quantity').asstring + ' ' + 'No.';
  qrlblExtraDescription.caption := qryQExtras.fieldbyname('Description').asstring;
end;

procedure TfrmwtRPQuoteSummary.qrcbDiscountBeforePrint(Sender: TQRCustomBand;
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
      PrintBand := (qryReport.FieldByName('Discount_Value').Asfloat <> 0);
    end;
end;

function TfrmwtRPQuoteSummary.PrintToFile(QuoteNo: integer; attachmentType: string): TStringList;
begin
  PrinterTools.New.PrintToFileQuote(qrpDetails, Result, QuoteNo, attachmentType);
end;

(* GDK ToDo: remove after tests
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
*)

procedure TfrmwtRPQuoteSummary.qrcbPriceMatchBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotalArea1.Caption := formatfloat('#,##0.00',rTotalArea) + 'm2';
  qrlblTotalAreaCaption.enabled := not bPrintTotals;
  qrlblTotalArea1.enabled := not bPrintTotals;

  qriPriceMatch.enabled := bPrintLogo;
end;

procedure TfrmwtRPQuoteSummary.qrcbSubTotalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := not self.bOnlyGrandTotal;
end;

procedure TfrmwtRPQuoteSummary.qrsdQOptionsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rTotal, rGrossTotal, rVat: real;
begin
  rTotal := qryReport.FieldByName('Nett_Price').Asfloat - qryQOptions.FieldByName('Discount_Value').Asfloat + qryReport.FieldByName('Markup_Value').Asfloat;
  rTotal := rTotal + qryQOptions.FieldByName('Installation_Price').Asfloat + qryQOptions.FieldByName('Survey_Price').Asfloat  + qryQOptions.FieldByName('Delivery_Price').Asfloat;
  lblOptionComplete.Caption := formatfloat('#,##0.00',rTotal);

  rVat := rTotal * (qryQOptions.fieldbyname('VAT_Rate').asfloat/100);
  rGrossTotal := rVAT + rTotal;

  lblOptionVat.Caption := formatfloat('#,##0.00',rVAT);
  lblOptionTotal.Caption := formatfloat('#,##0.00',rGrossTotal);

  lblQuoteOption.Caption := formatfloat('00',(frac(qryQOptions.fieldbyname('Quote_Number').asfloat)) * 100);

  if lblQuoteOption.Caption = '00' then
    lblQuoteOption.Caption := 'Original';

  lblOptionDescription.caption := qryQOptions.fieldbyname('Worktop_Description').asstring + ' ' + qryQOptions.fieldbyname('Material_Description').asstring
end;

end.
