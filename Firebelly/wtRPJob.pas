unit wtRPJob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrCtrls;

type
  TfrmwtRPJob = class(TForm)
    qrpDetails: TQuickRep;
    qrgJob: TQRGroup;
    qryReport: TQuery;
    qrbPageHeader: TQRBand;
    dtsReport: TDataSource;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qrbJobFooter: TQRBand;
    lblGrossSupply: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    qrlblGrossPrice: TgtQRLabel;
    qrlblInstallation: TgtQRLabel;
    qrlblSurvey: TgtQRLabel;
    qrlblDelivery: TgtQRLabel;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qrlblSOCaption: TgtQRLabel;
    qrmAddress: TgtQRMemo;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    QRLabel5: TgtQRLabel;
    qrlblVatRate: TgtQRLabel;
    QRLabel18: TgtQRLabel;
    qrlblVAT: TgtQRLabel;
    qrlblGross: TgtQRLabel;
    QRShape4: TgtQRShape;
    qrlblNett: TgtQRLabel;
    qryEndUser: TQuery;
    QRShape1: TgtQRShape;
    QRLabel1: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    qrmSiteAddress: TgtQRMemo;
    QRLabel10: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    QRLabel15: TgtQRLabel;
    qrsdJElements: TQRSubDetail;
    lblWorktopSize: TgtQRLabel;
    lblWorktopArea: TgtQRLabel;
    qrsdJCutOuts: TQRSubDetail;
    qrlblCutOutDescription: TgtQRDBText;
    qrlblQuantity: TgtQRLabel;
    qrsdJEdges: TQRSubDetail;
    qrlblLength: TgtQRLabel;
    qrlblEdgeDescription: TgtQRDBText;
    qrsdJExtras: TQRSubDetail;
    qrlblExtraDescription: TgtQRDBText;
    qryJElements: TQuery;
    qryJCutOuts: TQuery;
    qryJEdges: TQuery;
    qryJExtras: TQuery;
    lblWTPrice: TgtQRLabel;
    lblWTTotal: TgtQRLabel;
    lblCOPrice: TgtQRLabel;
    lblEdgePrice: TgtQRLabel;
    lblCOTotal: TgtQRLabel;
    lblEdgeTotal: TgtQRLabel;
    qrlblWorktop: TgtQRLabel;
    qrlblCutOuts: TgtQRLabel;
    qrlblEdgeDetails: TgtQRLabel;
    qrsdJRemedials: TQRSubDetail;
    qrlblExtraCharges: TgtQRLabel;
    qrmRemedials: TgtQRMemo;
    lblRemTotal: TgtQRLabel;
    qryJRemedials: TQuery;
    qrsdJEvents: TQRSubDetail;
    qrmEventNotes: TgtQRMemo;
    lblExtraTotal: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    lblExtraPrice: TgtQRLabel;
    qryJEvents: TQuery;
    lblDiscount: TgtQRLabel;
    qrlblDiscountValue: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    QRDBText7: TgtQRDBText;
    QRDBText8: TgtQRDBText;
    QRLabel19: TgtQRLabel;
    QRLabel20: TgtQRLabel;
    QRLabel21: TgtQRLabel;
    qrlblTelephone: TgtQRLabel;
    qrlblFax: TgtQRLabel;
    qrlblEmail: TgtQRLabel;
    qrgJRemedials: TQRGroup;
    QRLabel22: TgtQRLabel;
    QRLabel23: TgtQRLabel;
    QRLabel24: TgtQRLabel;
    QRLabel25: TgtQRLabel;
    qrlblRemedial: TgtQRLabel;
    qrgJEvents: TQRGroup;
    qrlblEvents: TgtQRLabel;
    QRLabel26: TgtQRLabel;
    QRLabel27: TgtQRLabel;
    QRLabel28: TgtQRLabel;
    QRLabel29: TgtQRLabel;
    qrlblFitter: TgtQRLabel;
    QRDBText9: TgtQRDBText;
    QRDBText12: TgtQRDBText;
    qrlblFitterNumber: TgtQRLabel;
    qrlblShowroomLabel: TgtQRLabel;
    qrlblShowroom: TgtQRLabel;
    gtQRLabel2: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    qrlbldesignerLabel: TgtQRLabel;
    qrlblDesigner: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    qrlblTemplateDate: TgtQRLabel;
    qrlblProductionDate: TgtQRLabel;
    qrlblFittingDate: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgJobBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbJobFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdJElementsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdJCutOutsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdJEdgesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdJElementsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdJCutOutsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdJEdgesAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdJExtrasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdJExtrasAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdJRemedialsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdJEventsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdJRemedialsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgJRemedialsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrgJEventsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdJEventsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
  public
    Job: integer;
    bPreview: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bEndUser: boolean;
    bRetail: boolean;
    bUseMarkup: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPJob: TfrmwtRPJob;

implementation

uses allCommon, wtDataModule;

var
  rLineTotal, rInstallTotal, rSurveyTotal, rDeliveryTotal, rGrossTotal: real;

{$R *.dfm}

function TfrmwtRPJob.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPJob.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  sWorktop := '';

  with qryCompany do
    begin
      close;
      open;
    end;

  with qryJElements do
    begin
      close;
      open;
      qrsdJElements.Enabled := (recordcount > 0)
    end;
  with qryJCutOuts do
    begin
      close;
      open;
      qrsdJCutOuts.Enabled := (recordcount > 0)
    end;
  with qryJEdges do
    begin
      close;
      open;
      qrsdJEdges.Enabled := (recordcount > 0)
    end;
  with qryJExtras do
    begin
      close;
      open;
      qrsdJExtras.Enabled := (recordcount > 0)
    end;
  with qryJRemedials do
    begin
      close;
      open;
      qrsdJRemedials.Enabled := (recordcount > 0)
    end;
  with qryJEvents do
    begin
      close;
      open;
      qrsdJEvents.Enabled := (recordcount > 0)
    end;
end;

procedure TfrmwtRPJob.qrgJobBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  rGrossTotal := 0.00;
  rLineTotal := 0.00;
  rInstallTotal := 0.00;
  rSurveyTotal := 0.00;
  rDeliveryTotal := 0.00;

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

  qrmSiteAddress.Lines.Clear;
  if qryReport.fieldbyname('Install_name').asstring <> '' then
    qrmSiteAddress.lines.add(qryReport.fieldbyname('Install_name').asstring);

  qrmSiteAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  if qryReport.fieldbyname('Install_Phone').asstring <> '' then
    qrmSiteAddress.lines.add('Telephone: '+qryReport.fieldbyname('Install_Phone').asstring);

  qrlblTelephone.Caption := dtsAddress.dataset.fieldbyname('Telephone_number').asstring;
  qrlblFax.Caption := dtsAddress.dataset.fieldbyname('Fax_number').asstring;
  qrlblEmail.Caption := dtsAddress.dataset.fieldbyname('email_address').asstring;
end;

procedure TfrmwtRPJob.qrbJobFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rBalance: real;
  rInstallTotal, rSurveyTotal, rDeliveryTotal, rDiscount, rVat, rMarkup: real;
  sNett, sVat: string;
begin
  qrlblGrossPrice.Caption := formatfloat('#,##0.00',rLineTotal);
  rInstallTotal := qryReport.FieldByName('Installation_Price').Asfloat;
  rSurveyTotal := qryReport.FieldByName('Survey_Price').Asfloat;
  rDeliveryTotal := qryReport.FieldByName('Delivery_Price').Asfloat;
  rDiscount := qryReport.FieldByName('Discount_Value').Asfloat;
  rMarkup := qryReport.FieldByName('Markup_Value').Asfloat;

  if bUseMarkup then
    begin
      lblDiscount.caption := formatfloat('##0.00%',qryReport.FieldByName('Markup_Rate').Asfloat) + ' MARKUP';
      qrlblDiscountValue.Caption := formatfloat('##0.00',qryReport.FieldByName('Markup_Value').Asfloat);
    end
  else
    begin
      lblDiscount.caption := formatfloat('##0.00%',qryReport.FieldByName('Discount_Rate').Asfloat) + ' DISCOUNT';
      qrlblDiscountValue.Caption := formatfloat('##0.00',qryReport.FieldByName('Discount_Value').Asfloat);
    end;

  qrlblInstallation.Caption := formatfloat('#,##0.00',rInstallTotal);
  qrlblSurvey.Caption := formatfloat('#,##0.00',rSurveyTotal);
  qrlblDelivery.Caption := formatfloat('#,##0.00',rDeliveryTotal);

  rNettTotal := rLineTotal
                - rDiscount
                + rInstallTotal
                + rDeliveryTotal
                + rSurveyTotal
                + rMarkup;

  rVat := rNettTotal * (qryreport.fieldbyname('VAT_Rate').asfloat/100);
  sNett := formatfloat('0.00',rNettTotal);
  sVat := formatfloat('0.00',rVAT);

  qrlblNett.caption := formatfloat('#,##0.00',rNettTotal);
  qrlblVat.Caption := formatfloat('#,##0.00',rVAT);

  rGrossTotal := strtofloat(sNett) + strtofloat(sVat);
  qrlblGross.Caption := formatfloat('#,##0.00',rGrossTotal);

  rBalance := rGrosstotal - qryReport.FieldByName('Deposit_amount').Asfloat;

//  qrlblDeposit.Caption := formatfloat('#,##0.00',qryReport.FieldByName('Deposit_amount').Asfloat);
  qrlblVatRate.Caption := formatfloat('0.00%',qryReport.fieldbyname('VAT_Rate').asfloat) + ' VAT';
//  qrlblBalance.caption := formatfloat('#,##0.00',rBalance);;
end;

function TfrmwtRPJob.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPJob.qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrbPageHeader.Enabled := false;
end;

procedure TfrmwtRPJob.qrsdJElementsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rArea, rPolished, rUnitPrice, rTotalPrice: real;
  sUpstand, sDescription: string;
begin
  lblWorktopSize.caption := '';
  lblWorktopArea.caption := '';

  rPolished := 0;

  if qryJElements.fieldbyname('Description').asstring <> sWorktop then
    begin
      sWorktop := qryJElements.fieldbyname('Description').asstring;
      sDescription := qryJElements.fieldbyname('Thickness_mm').asstring + ' ' +
                      qryJElements.fieldbyname('Description').asstring;
    end
  else
    sDescription := '';

  if qryJElements.fieldbyname('Element_number').asinteger > 1000 then
    begin
      if qryJElements.fieldbyname('Use_Description').asstring <> '' then
        begin
          if qryJElements.fieldbyname('Upstand_Polish_Price').asfloat <> 0 then
            sUpstand := '(Polished ' + qryJElements.fieldbyname('Use_Description').asstring + ') '
          else
            sUpstand := '(' + qryJElements.fieldbyname('Use_Description').asstring + ') '
        end
      else
        begin
          if qryJElements.fieldbyname('Upstand_Polish_Price').asfloat <> 0 then
            sUpstand := ' (Polished Upstand) '
          else
            sUpstand := ' (Upstand) ';
        end;
    end
  else
    sUpstand := ' ';

  lblWorktopSize.caption := sDescription + sUpstand +
                            qryJElements.fieldbyname('Length').asstring + ' x ' +
                            qryJElements.fieldbyname('Depth').asstring + ' x ' +
                            qryJElements.fieldbyname('Quantity').asstring;
  rArea :=  ((qryJElements.fieldbyname('Length').asinteger *
            qryJElements.fieldbyname('Depth').asinteger *
            qryJElements.fieldbyname('Quantity').asinteger)/1000000);


  lblWorktopArea.caption := formatfloat('0.00',rArea) + ' ' + 'm2';

  rPolished      := (((qryJElements.fieldbyname('Length').asinteger/1000) * qryJElements.fieldbyname('No_of_Polished_Lengths').asinteger) * qryJElements.fieldbyname('Upstand_Polish_Price').asfloat)
                  + (((qryJElements.fieldbyname('Depth').asinteger/1000) * qryJElements.fieldbyname('No_of_Polished_Depths').asinteger) * qryJElements.fieldbyname('Upstand_Polish_Price').asfloat);

  rUnitPrice := qryJElements.fieldbyname('Unit_Price').asfloat;

  if bUseMarkup then
    rTotalPrice := ((rUnitPrice * rArea) + rPolished) * (1 + qryReport.FieldByName('Markup_Rate').Asfloat/100.0000)
  else
    rTotalPrice := (rUnitPrice * rArea) + rPolished;

  lblWTPrice.caption := formatfloat('##0.00',rUnitPrice);
  lblWTTotal.caption := formatfloat('##0.00',rTotalPrice);
  rLineTotal := rLineTotal + rTotalPrice;
end;

procedure TfrmwtRPJob.qrsdJCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblQuantity.caption := qryJCutOuts.fieldbyname('Quantity').asstring + ' ' + 'No.';
  lblCOPrice.caption := formatfloat('##0.00',qryJCutOuts.fieldbyname('Unit_Price').asfloat);
  lblCOTotal.caption := formatfloat('##0.00',(qryJCutOuts.fieldbyname('Unit_Price').asfloat*qryJCutOuts.fieldbyname('Quantity').asinteger));
  rLineTotal := rLineTotal + (qryJCutOuts.fieldbyname('Unit_Price').asfloat*qryJCutOuts.fieldbyname('Quantity').asinteger);
end;

procedure TfrmwtRPJob.qrsdJEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblLength.caption := formatfloat('0.0',(qryJEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';
  lblEdgePrice.caption := formatfloat('##0.00',qryJEdges.fieldbyname('Unit_Price').asfloat);
  lblEdgeTotal.caption := formatfloat('##0.00',(qryJEdges.fieldbyname('Unit_Price').asfloat*(qryJEdges.fieldbyname('Length').asfloat/1000)));
  rLineTotal := rLineTotal + (qryJEdges.fieldbyname('Unit_Price').asfloat*(qryJEdges.fieldbyname('Length').asfloat/1000));
end;

procedure TfrmwtRPJob.qrsdJElementsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrlblWorktop.Enabled := false;
end;

procedure TfrmwtRPJob.qrsdJCutOutsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrlblCutOuts.Enabled := false;
end;

procedure TfrmwtRPJob.qrsdJEdgesAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrlblEdgeDetails.Enabled := false;
end;

procedure TfrmwtRPJob.qrsdJExtrasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblExtraPrice.caption := formatfloat('##0.00',(qryJExtras.fieldbyname('Unit_Price').asfloat));
  lblExtraTotal.caption := formatfloat('##0.00',(qryJExtras.fieldbyname('Unit_Price').asfloat*qryJExtras.fieldbyname('Quantity').asfloat));
  rLineTotal := rLineTotal + (qryJExtras.fieldbyname('Unit_Price').asfloat*qryJExtras.fieldbyname('Quantity').asfloat);
end;

procedure TfrmwtRPJob.qrsdJExtrasAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrlblExtraCharges.enabled := false;
end;

procedure TfrmwtRPJob.qrsdJRemedialsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrlblRemedial.Enabled := false;
end;

procedure TfrmwtRPJob.qrsdJEventsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrlblEvents.Enabled := false;
end;

procedure TfrmwtRPJob.qrsdJRemedialsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmRemedials.lines.clear;
  qrmRemedials.lines.add(BuildNotes(qryJRemedials.fieldbyname('Notes').asinteger));
  lblRemTotal.Caption := formatfloat('##0.00',(qryJRemedials.fieldbyname('Installation_Price').asfloat));
end;

procedure TfrmwtRPJob.qrgJRemedialsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrgJRemedials.Enabled := false;
end;

procedure TfrmwtRPJob.qrgJEventsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrgJEvents.Enabled := false;
end;

procedure TfrmwtRPJob.qrsdJEventsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmEventNotes.lines.clear;
  qrmEventNotes.lines.add(BuildNotes(qryJEvents.fieldbyname('Narrative').asinteger));
end;

procedure TfrmwtRPJob.qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {Show the fitter details}
  qrlblfitter.Enabled := (qryReport.FieldByName('Fitter_Name').asstring <> '');
  qrlblFitterNumber.Enabled := (qryReport.FieldByName('Fitter_Number').asstring <> '');

  {Show the showroom details}
  qrlblShowroomLabel.Enabled := (qryReport.FieldByName('Showroom_Name').asstring <> '');
  qrlblShowroom.Enabled := (qryReport.FieldByName('Showroom_Name').asstring <> '');
  qrlblShowroom.Caption := qryReport.FieldByName('Showroom_Name').asstring;

  {Show the designer details}
  qrlblDesignerLabel.Enabled := (qryReport.FieldByName('Designer_Name').asstring <> '');
  qrlblDesigner.Enabled := (qryReport.FieldByName('Designer_Name').asstring <> '');
  qrlblDesigner.Caption := qryReport.FieldByName('Designer_Name').asstring;

(*  qrlblActualTemplate.caption := 'Actual: ' + padatestr(qryReport.fieldbyname('Template_date_actual').asdatetime);
  qrlblActualFitting.caption := 'Actual: ' + padatestr(qryReport.fieldbyname('Installation_date_actual').asdatetime);
  qrlblActualProduction.caption := 'Actual: ' + padatestr(qryReport.fieldbyname('Production_date_actual').asdatetime);
*)
  qrlblTemplateDate.caption := padatestr(qryReport.fieldbyname('Template_date').asdatetime);
  qrlblFittingDate.caption := padatestr(qryReport.fieldbyname('Installation_date').asdatetime);
  qrlblProductionDate.caption := padatestr(qryReport.fieldbyname('Production_date').asdatetime);
end;

end.

