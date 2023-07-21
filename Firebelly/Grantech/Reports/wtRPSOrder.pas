unit wtRPSOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, gtQrCtrls,
  gtQrExport, qrprntr, printers, AllCommon,
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
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qryEndUser: TFDQuery;
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
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape7: TQRShape;
    gtQRShape8: TQRShape;
    gtQRShape9: TQRShape;
    gtQRShape10: TQRShape;
    gtQRShape11: TQRShape;
    GetNarrSQL: TFDQuery;
    gtQRLabel7: TQRLabel;
    qrlblDescription: TQRLabel;
    gtQRDBText2: TQRDBText;
    qrsdQElements: TQRSubDetail;
    lblWorktopSize: TQRLabel;
    lblWorktopArea: TQRLabel;
    qrsdQEdges: TQRSubDetail;
    qrsdQCutOuts: TQRSubDetail;
    qrsdQExtras: TQRSubDetail;
    qrlblExtraQuantity: TQRDBText;
    qrlblExtraDescription: TQRLabel;
    qryQElements: TFDQuery;
    qryQEdges: TFDQuery;
    qryQCutOuts: TFDQuery;
    qryQExtras: TFDQuery;
    dtsSOLine: TDataSource;
    qriHeadLogo: TQRImage;
    memAddress: TQRMemo;
    gtQRShape3: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    qrlblFitDateLabel: TQRLabel;
    qrlblTemplateDateLabel: TQRLabel;
    QRShape6: TQRShape;
    QRShape3: TQRShape;
    gtQRShape1: TQRShape;
    QRShape1: TQRShape;
    qrmAddress: TQRMemo;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRShape2: TQRShape;
    qrmSiteAddress: TQRMemo;
    gtQRShape4: TQRShape;
    gtQRShape6: TQRShape;
    gtQRLabel3: TQRLabel;
    qrlblTemplateDate: TQRLabel;
    qrlblDateRequired: TQRLabel;
    qrlblSOCaption: TQRLabel;
    qryCompanyAddress: TFDQuery;
    gtQRShape13: TQRShape;
    gtQRShape14: TQRShape;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    gtQRLabel2: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel8: TQRLabel;
    qrlblYourPhone: TQRLabel;
    qrlblYourEmail: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel68: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    qrcbDiscount: TQRBand;
    lblDiscount: TQRLabel;
    qrlblDiscountValue: TQRLabel;
    qrbQFooter: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlblInstallation: TQRLabel;
    qrlblSurvey: TQRLabel;
    qrlblDelivery: TQRLabel;
    lblWorktopTotal: TQRLabel;
    lblExtraTotal: TQRLabel;
    qrySOLineMarkup_Value: TFloatField;
    qrySOLineMarkup_Rate: TFloatField;
    qrySOLineDiscount_Rate: TFloatField;
    qrlblCutOut: TQRLabel;
    qrlblQuantity: TQRLabel;
    lblCutOutTotal: TQRLabel;
    qrlblEdgeDescription: TQRLabel;
    qrlblLength: TQRLabel;
    lblEdgeTotal: TQRLabel;
    qryUpSOStatus: TFDQuery;
    qrshpPayment: TQRShape;
    memPayment: TQRMemo;
    gtQRLabel4: TQRLabel;
    qrlblNett: TQRLabel;
    qrlblVAT: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrlblGross: TQRLabel;
    qrlblToPay: TQRLabel;
    gtQRLabel5: TQRLabel;
    qrlblDepositTerms: TQRLabel;
    qrlblDepositPaid: TQRLabel;
    qrlblDeposit: TQRLabel;
    qrlblBalance: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape10: TQRShape;
    gtQRShape12: TQRShape;
    gtQRShape7: TQRShape;
    QRShape15: TQRShape;
    QRShape14: TQRShape;
    QRShape13: TQRShape;
    QRShape9: TQRShape;
    qrlblNotesLabel: TQRLabel;
    qrrchTextNotes: TQRRichText;
    qrlblVatReg: TQRLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQElementsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbDiscountBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbQFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbSOFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    sWorktop: string;
    FPrintType: string;
    function BuildNotes(const iNotes: integer): string;
    procedure BuildPaymentNotes(const iNarrative: integer);
    procedure SetPrintType(const Value: string);
    function GetCompanyAddress: string;
  public
    SalesOrder: integer;
    bDetailed: boolean;
    bPreview: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bRetail: boolean;
    bUseMarkup: boolean;
    bEndUser: boolean;
    function Getdetails: integer;
    property PrintType: string read FPrintType write SetPrintType;
  end;

var
  frmwtRPSOrder: TfrmwtRPSOrder;

implementation

uses wtDataModule;

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
var
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
  icount: integer;
  TempAddress: string;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.copies := Copies;   {set the number of copies }
  qrpDetails.PrinterSettings.PaperSize := Size;   {set the number of copies }

  sWorktop := '';

  qriHeadLogo.enabled := bPrintLogo;
  memAddress.enabled := bPrintLogo;

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

  GetCompanyAddress;

  {Show Payemnt details}
  memPayment.Lines.clear;
  
  if qryReport.FieldByName('Address').Asinteger <> 0 then
    BuildPaymentNotes(dtmdlWorktops.GetRetailPaymentNotes);

  if memPayment.lines.text = '' then
    BuildPaymentNotes(dtmdlWorktops.GetCompanyPaymentNotes);

  if trim(memPayment.lines.text) = '' then
    begin
      memPayment.enabled := false;
      qrshpPayment.enabled := false;
    end
  else
    begin
      memPayment.enabled := true;
      qrshpPayment.enabled := true;
    end;
end;

procedure TfrmwtRPSOrder.qrgSalesOrderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  qrlblNett.Caption := '';
  qrlblVAT.Caption := '';
  qrlblGross.Caption := 'Next Page';
  qrlblToPay.caption := '';
  qrlblDeposit.caption := '';
  qrlblToPay.caption := '';
  qrlblBalance.caption := '';

  rGrossTotal := 0.00;
  rLineTotal := 0.00;
  rInstallTotal := 0.00;
  rSurveyTotal := 0.00;
  rDeliveryTotal := 0.00;
  rVatTotal := 0.00;
  
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

  qrmSiteAddress.Lines.clear;

  if trim(qryReport.fieldbyname('Install_name').asstring) <> '' then
    qrmSiteAddress.lines.add(qryReport.fieldbyname('Install_name').asstring);

  qrmSiteAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  if trim(qryReport.fieldbyname('Install_Phone').asstring) <> '' then
    qrmSiteAddress.lines.add('Telephone: ' + qryReport.fieldbyname('Install_Phone').asstring);

  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Extra_Notes').asinteger));
end;

procedure TfrmwtRPSOrder.qrbSOFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rBalance, rToPay, rDeposit: real;
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

(*  qrlblGrossPrice.Caption := formatfloat('#,##0.00',rLineTotal);
  qrlblInstallation.Caption := formatfloat('#,##0.00',rInstallTotal);
  qrlblSurvey.Caption := formatfloat('#,##0.00',rSurveyTotal);
  qrlblDelivery.Caption := formatfloat('#,##0.00',rDeliveryTotal);

  rNettTotal := rLineTotal
                + rInstallTotal
                + rDeliveryTotal
                + rSurveyTotal;
*)
  qrlblNotesLabel.Enabled := (qrrchTextNotes.Lines[0] <> '');

  rNettTotal := rLineTotal;

  sNett := formatfloat('0.00',rNettTotal);
  sVat := formatfloat('0.00',rVATTotal);

  qrlblNett.caption := formatfloat('#,##0.00',rNettTotal);
  qrlblVat.Caption := formatfloat('#,##0.00',rVATTotal);

  rGrossTotal := strtofloat(sNett) + strtofloat(sVat);
  qrlblGross.Caption := formatfloat('#,##0.00',rGrossTotal);

  rBalance := rGrosstotal - qryReport.FieldByName('Deposit_amount').Asfloat;

  rdeposit := qryReport.FieldByName('Deposit_Terms').Asfloat;
  rToPay := rGrossTotal * (rDeposit/100);

  qrlblDepositTerms.caption := formatfloat('0.00%',rDeposit);
  qrlblToPay.caption := formatfloat('#,##0.00',rToPay);
  qrlblDeposit.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Deposit_amount').Asfloat);
  qrlblBalance.caption := formatfloat('#,##0.00',rBalance);

  if qryReport.FieldByName('Deposit_amount').Asfloat > 0 then
    qrlblDepositPaid.caption := 'Deposit paid with thanks'
  else
    qrlblDepositPaid.caption := 'Deposit paid' ;
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
    begin
      qrlblDescription.caption := qrySOLine.fieldbyname('Description').asstring + ' Quote: ' + qrySOLine.FieldByName('Quote').Asstring;
      unitPrice := ((qrySOLine.FieldByName('Nett_Price').Asfloat) - qrySOLine.FieldByName('Discount_Value').Asfloat) + qrySOLine.FieldByName('Installation_Price').Asfloat
                              + qrySOLine.FieldByName('Survey_Price').Asfloat
                              + qrySOLine.FieldByName('Delivery_Price').Asfloat
                              + qrySOLine.FieldByName('Markup_Value').Asfloat;
    end
  else
    begin
      qrlblDescription.caption := qrySOLine.fieldbyname('Description').asstring;
      unitPrice := qrySOLine.FieldByName('Unit_Price').Asfloat;
    end;

  totalPrice := unitPrice/qrySOLine.FieldByName('Sell_Unit').Asinteger * qrySOLine.FieldByName('Quantity').Asinteger;

  fullLineTotal := totalPrice;

  qrlblUnitPrice.caption := formatfloat('0.00',unitPrice);

  if bDetailed and (qrySOLine.FieldByName('Quote').Asinteger <> 0) then
    qrlblTotalPrice.caption := ''
  else
    qrlblTotalPrice.caption := formatfloat('0.00',fullLineTotal);

  rLineTotal := rLineTotal + totalPrice;
  rInstallTotal := rInstallTotal + qrySOLine.FieldByName('Installation_Price').Asfloat;
  rSurveyTotal := rSurveyTotal + qrySOLine.FieldByName('Survey_Price').Asfloat;
  rDeliveryTotal := rDeliveryTotal + qrySOLine.FieldByName('Delivery_Price').Asfloat;

  rVatTotal := rVatTotal + (fullLineTotal * (qrySOLine.FieldByName('Vat_Rate').Asfloat/100.00));

  if bDetailed then
    begin
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
      qrcbDiscount.enabled := true;
      qrbQFooter.Enabled := true;
    end;
end;

procedure TfrmwtRPSOrder.FormCreate(Sender: TObject);
var
  LocalDir: string;
begin
  try
    LocalDir := extractfilepath(application.exename);
    qriHeadlogo.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
//    qriFootlogo.picture.loadfromfile(LocalDir+'wtFootLogo.bmp');
    qriHeadLogo.Picture.Bitmap.PixelFormat := pfDevice;
  except
  end;
end;

procedure TfrmwtRPSOrder.BuildPaymentNotes(const iNarrative : integer);
var
  aStr : string;
begin
  if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Notes_Code').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Notes_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Notes_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
  memPayment.Lines.Clear;
  memPayment.Lines.Text := aStr;
end;

procedure TfrmwtRPSOrder.qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {Set the labels depending on the date type}
  if qryReport.fieldbyname('Date_Type').asstring = 'C' then
    begin
      qrlbltemplateDateLabel.caption := 'Confirmed Template Date';
      qrlblFitDateLabel.caption := 'Confirmed Fitting Date';
    end
  else
  if qryReport.fieldbyname('Date_Type').asstring = 'P' then
    begin
      qrlbltemplateDateLabel.caption := 'Provisional Template Date';
      qrlblFitDateLabel.caption := 'Provisional Fitting Date';
    end
  else
    begin
      qrlbltemplateDateLabel.caption := 'Proposed Template Date';
      qrlblFitDateLabel.caption := 'Proposed Fitting Date';
    end;

  {Set the Template and Fitting Dates}
  if qryReport.fieldbyname('template_Date').asdatetime = 0 then
    qrlblTemplateDate.caption := 'TBC'
  else
    qrlblTemplateDate.caption := paDateStr(qryReport.fieldbyname('template_Date').asdatetime);

  if qryReport.fieldbyname('Date_Required').asdatetime = 0 then
    qrlblDateRequired.caption := 'TBC'
  else
    qrlblDateRequired.caption := paDateStr(qryReport.fieldbyname('Date_Required').asdatetime);
end;

procedure TfrmwtRPSOrder.qrsdQElementsBeforePrint(Sender: TQRCustomBand;
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
    rTotalPrice := ((rUnitPrice * rArea) + rPolishedPrice) * (1 + qrySOLine.FieldByName('Markup_Rate').Asfloat/100.0000)
  else
    rTotalPrice := (rUnitPrice * rArea) + rPolishedPrice;
  lblWorktopTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPSOrder.qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblEdgeDescription.caption := qryQEdges.fieldbyname('Description').asstring;
  qrlblLength.caption := formatfloat('0.0',(qryQEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';

  rUnitPrice := qryQEdges.fieldbyname('Unit_Price').asinteger;
  if bUseMarkup then
    rTotalPrice := (rUnitPrice * (qryQEdges.fieldbyname('Length').asfloat/1000)) * (1 + qrySOLine.FieldByName('Markup_Rate').Asfloat/100.0000)
  else
    rTotalPrice := rUnitPrice * (qryQEdges.fieldbyname('Length').asfloat/1000);
  lblEdgeTotal.caption := formatfloat('##0.00',rTotalPrice);

end;

procedure TfrmwtRPSOrder.qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblQuantity.caption := qryQCutOuts.fieldbyname('Quantity').asstring;
  qrlblCutOut.caption := qryQCutOuts.fieldbyname('Description').asstring;

  rUnitPrice := qryQCutOuts.fieldbyname('Unit_Price').asinteger;
  if bUseMArkup then
    rTotalPrice := (rUnitPrice * qryQCutOuts.fieldbyname('Quantity').asinteger) * (1 + qrySOLine.FieldByName('Markup_Rate').Asfloat/100.0000)
  else
    rTotalPrice := (rUnitPrice * qryQCutOuts.fieldbyname('Quantity').asinteger);
  lblCutOutTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPSOrder.qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblExtraDescription.caption := qryQExtras.fieldbyname('Description').asstring;

  rUnitPrice := qryQExtras.fieldbyname('Unit_Price').asfloat;
  if bUseMarkup then
    rTotalPrice := (rUnitPrice * (qryQExtras.fieldbyname('Quantity').asfloat)) * (1 + qrySOLine.FieldByName('Markup_Rate').Asfloat/100.0000)
  else
    rTotalPrice := rUnitPrice * (qryQExtras.fieldbyname('Quantity').asfloat);
  lblExtraTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmwtRPSOrder.qrcbDiscountBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if bUseMarkup then
    begin
      PrintBand := false;
      exit;
    end
  else
    begin
      if qrySOLine.FieldByName('Discount_Rate').Asfloat = 0 then
        PrintBand := false;
      lblDiscount.caption := formatfloat('##0.00%',qrySOLine.FieldByName('Discount_Rate').Asfloat) + ' DISCOUNT';
      qrlblDiscountValue.Caption := formatfloat('-##0.00',qrySOLine.FieldByName('Discount_Value').Asfloat);
      PrintBand := (qrySOLine.FieldByName('Discount_Value').Asfloat <> 0);
    end;
end;

procedure TfrmwtRPSOrder.qrbQFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblInstallation.Caption := formatfloat('#,##0.00',qrySOLine.FieldByName('Installation_Price').Asfloat);
  qrlblSurvey.Caption := formatfloat('#,##0.00',qrySOLine.FieldByName('Survey_Price').Asfloat);
  qrlblDelivery.Caption := formatfloat('#,##0.00',qrySOLine.FieldByName('Delivery_Price').Asfloat);
end;

procedure TfrmwtRPSOrder.SetPrintType(const Value: string);
begin
  FPrintType := Value;
  if FPrintType = 'I' then
    begin
      frmwtRPSOrder.caption := 'Proforma Invoice Print';
      qrlblSOCaption.Caption := 'PROFORMA INVOICE';
    end;
end;

procedure TfrmwtRPSOrder.qrbSOFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if not bPreview and (qryReport.FieldByName('Sales_Order_Status').asinteger = 10) then
    begin
      with qryUpSOStatus do
        begin
          close;
          parambyname('Sales_Order').asinteger := qryReport.fieldbyname('Sales_Order').asinteger;
          parambyname('Sales_Order_Status').asinteger := 14;
          execsql
        end;
    end;
end;

function TfrmwtRPSOrder.GetCompanyAddress: string;
var
  iCount: integer;
  sText: string;
begin
  {Actual Company Name and address}
  memAddress.lines.clear;
  with qryCompanyAddress do
    begin
      close;
      open;
      sText := Fields[0].asstring;
      for iCount := 1 to 4 do
        begin
          if Fields[icount].asstring = '' then
            continue
          else
            stext := stext + ', ' + Trim(Fields[icount].asstring) ;
        end;
      memAddress.Lines.Append(sText);

      {Finally, add the phone number} ;
      memAddress.Lines.Append('Tel: ' + Trim(qryCompanyAddress.fieldbyname('Telephone_number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring) <> '' then
        memAddress.Lines.Append('Fax: ' + Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring) <> '' then
        memAddress.Lines.Append('Email: ' + Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring) <> '' then
        memAddress.Lines.Append('Web: ' + Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring));


      qrlblVATReg.caption := 'VAT Registration No. ' + qryCompanyAddress.fieldbyname('VAT_Number').asstring;
    end;
end;

end.
