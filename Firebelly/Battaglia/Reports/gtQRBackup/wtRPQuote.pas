unit wtRPQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, QrExport, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPQuote = class(TForm)
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
    qrlblCutOutDescription: TQRDBText;
    qrlblQuantity: TQRLabel;
    qrsdQEdges: TQRSubDetail;
    qrlblLength: TQRLabel;
    qrsdQExtras: TQRSubDetail;
    qrlblExtraDescription: TQRDBText;
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
    qrmAddress: TQRMemo;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    qrrchTextNotes: TQRRichText;
    qrrchTextAvailability: TQRRichText;
    qrrchtextTerms: TQRRichText;
    QRLabel16: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrlblVAT: TQRLabel;
    qrlblGross: TQRLabel;
    QRShape4: TQRShape;
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
    qrlblNett: TQRLabel;
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
    gtQRFilters1: TQRFilters;
    memAddress: TQRRichText;
    qriHeadLogo: TQRImage;
    qrlblEdgeDescription: TQRLabel;
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
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
    function GetCompanyAddress: string;
  public
    Quote: integer;
    bPreview: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bEndUser: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPQuote: TfrmwtRPQuote;

implementation

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

  getCompanyAddress;
  
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

procedure TfrmwtRPQuote.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
//    qriFootlogo.picture.loadfromfile('wtFootLogo.bmp');
  except
  end;
end;

procedure TfrmwtRPQuote.qrsdQElementsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rArea: real;
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

end;

procedure TfrmwtRPQuote.qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblQuantity.caption := qryQCutOuts.fieldbyname('Quantity').asstring + ' ' + 'No.';
end;

procedure TfrmwtRPQuote.qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblEdgeDescription.caption := qryQEdges.fieldbyname('Description').asstring;
  qrlblLength.caption := formatfloat('0.0',(qryQEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';
end;

procedure TfrmwtRPQuote.qrgQuoteBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPQuote.qrbQFooterBeforePrint(Sender: TQRCustomBand;
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
    qrrchtextTerms.Lines.add(BuildNotes(qryCompany.fieldbyname('Payment_Terms').asinteger));
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
  qrbPageFooter.Enabled := false;
end;

function TfrmwtRPQuote.GetCompanyAddress: string;
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

end.
