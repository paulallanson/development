unit wtRPQuoteSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, StdCtrls, QrExport, QrCtrls,
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
    qrcbAvailability: TQRChildBand;
    QRLabel9: TQRLabel;
    qrcbTerms: TQRChildBand;
    QRLabel10: TQRLabel;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qriFootLogo: TQRImage;
    qrlblCompanyAdd: TQRLabel;
    qryUpQuote: TFDQuery;
    qrcbNotes: TQRChildBand;
    qrlNotes: TQRLabel;
    qriHeadLogo: TQRImage;
    qrlblQuoteCaption: TQRLabel;
    qrmAddress: TQRMemo;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    qrrchTextNotes: TQRRichText;
    qrrchTextAvailability: TQRRichText;
    qrrchtextTerms: TQRRichText;
    QRLabel16: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    qryEndUser: TFDQuery;
    qrlblExtraDescription: TQRLabel;
    qrlblExtraQuantity: TQRLabel;
    qrlblEdgeDescription: TQRLabel;
    qrlblCutOut: TQRLabel;
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
    gtQRLabel4: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel8: TQRLabel;
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
    procedure qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
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
    bPrintAcceptance: boolean;
    bPrintTotals: boolean;
    bOnlyGrandTotal: boolean;
    bShowOffer: boolean;
    function Getdetails: integer;
    function PrintToFile(QuoteNo: integer; attachmentType: string): TStringList;
  end;

var
  frmwtRPQuoteSummary: TfrmwtRPQuoteSummary;

implementation

uses
  AllCommon, Printer.Tools;

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
  qrbQFooter.enabled := bPrintTotals;
  qrcbNotes.enabled := bPrintTotals;
  qrcbTerms.enabled := bPrintTotals;
  qrcbAvailability.enabled := bPrintTotals;
   
  qrbPageHeader.Enabled := true;
  qriHeadLogo.enabled := bPrintLogo;
  qriFootLogo.enabled := qriHeadLogo.enabled;
  qrlblCompanyAdd.Enabled := qriHeadLogo.enabled;

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
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
    qriFootlogo.picture.loadfromfile('wtFootLogo.bmp');
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

end;

procedure TfrmwtRPQuoteSummary.qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblQuantity.caption := qryQCutOuts.fieldbyname('Quantity').asstring + ' ' + 'No.';
  qrlblCutOut.caption := qryQCutOuts.fieldbyname('Description').asstring;
end;

procedure TfrmwtRPQuoteSummary.qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblEdgeDescription.caption := qryQEdges.fieldbyname('Description').asstring;
  qrlblLength.caption := formatfloat('0.0',(qryQEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';
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
//      qrsdQExtras.Enabled := (recordcount > 0)
    end;
  with qryQOptions do
    begin
      close;
      open;
      qrsdQOptions.Enabled := (recordcount > 0)
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

end;

procedure TfrmwtRPQuoteSummary.qrbQFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rVat: real;
begin
  rTotal := qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat;
  qrlblInstallation.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Installation_Price').Asfloat);
  qrlblSurvey.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Survey_Price').Asfloat);
  qrlblDelivery.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Delivery_Price').Asfloat);

  rNettTotal := (qryReport.FieldByName('Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat)
                + qryReport.FieldByName('Installation_Price').Asfloat
                + qryReport.FieldByName('Survey_Price').Asfloat
                + qryReport.FieldByName('Delivery_Price').Asfloat;

  rVat := rNettTotal * (qryReport.fieldbyname('VAT_Rate').asfloat/100);
  rGrossTotal := rVAT + rNettTotal;
  PrintBand := not bOnlyGrandTotal;
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

function TfrmwtRPQuoteSummary.GetCompanyAddress: string;
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
end;

procedure TfrmwtRPQuoteSummary.qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblExtraQuantity.caption := qryQExtras.fieldbyname('Quantity').asstring + ' ' + 'No.';
  qrlblExtraDescription.caption := qryQExtras.fieldbyname('Description').asstring;
end;

function TfrmwtRPQuoteSummary.PrintToFile(QuoteNo: integer; attachmentType: string): TStringList;
begin
  TPrinterTools.New.PrintToFileQuote(qrpDetails, Result, QuoteNo, attachmentType);
end;

(* GDK ToDo: Remove after tests
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
