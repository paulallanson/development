unit WtRPJobFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrCtrls, AllCommon, qrprntr, printers;

type
  TfrmwtRPJobFitting = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TQuery;
    dtsReport: TDataSource;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qryUpJStatus: TQuery;
    qryCompanyAddress: TQuery;
    memAddress: TgtQRRichText;
    qrchdSatisfaction: TQRChildBand;
    QRLabel11: TgtQRLabel;
    memAddress1: TgtQRRichText;
    QRLabel17: TgtQRLabel;
    QRLabel18: TgtQRLabel;
    QRMemo1: TgtQRMemo;
    QRLabel23: TgtQRLabel;
    QRLabel25: TgtQRLabel;
    QRMemo2: TgtQRMemo;
    QRLabel48: TgtQRLabel;
    QRMemo3: TgtQRMemo;
    QRLabel49: TgtQRLabel;
    QRMemo4: TgtQRMemo;
    QRLabel50: TgtQRLabel;
    QRLabel52: TgtQRLabel;
    QRShape6: TgtQRShape;
    QRLabel51: TgtQRLabel;
    qrchdSnagging: TQRChildBand;
    QRLabel53: TgtQRLabel;
    QRLabel54: TgtQRLabel;
    QRLabel55: TgtQRLabel;
    QRLabel56: TgtQRLabel;
    QRLabel57: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRDBText7: TgtQRDBText;
    QRShape8: TgtQRShape;
    QRShape10: TgtQRShape;
    QRLabel58: TgtQRLabel;
    QRLabel59: TgtQRLabel;
    qryJRemedials: TQuery;
    QRBand1: TQRBand;
    QRLabel60: TgtQRLabel;
    QRLabel61: TgtQRLabel;
    QRLabel62: TgtQRLabel;
    QRLabel63: TgtQRLabel;
    QRLabel64: TgtQRLabel;
    QRLabel65: TgtQRLabel;
    QRLabel66: TgtQRLabel;
    QRLabel67: TgtQRLabel;
    QRLabel68: TgtQRLabel;
    QRLabel69: TgtQRLabel;
    QRLabel71: TgtQRLabel;
    QRDBText11: TgtQRDBText;
    QRLabel72: TgtQRLabel;
    QRLabel73: TgtQRLabel;
    QRShape48: TgtQRShape;
    QRLabel74: TgtQRLabel;
    qriHeadLogo: TgtQRImage;
    qrlblSOCaption: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRShape3: TgtQRShape;
    gtQRShape5: TgtQRShape;
    QRLabel24: TgtQRLabel;
    gtQRShape6: TgtQRShape;
    gtQRLabel4: TgtQRLabel;
    gtQRShape7: TgtQRShape;
    gtQRLabel5: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRShape23: TgtQRShape;
    gtQRShape8: TgtQRShape;
    gtQRShape9: TgtQRShape;
    gtQRShape10: TgtQRShape;
    gtQRShape11: TgtQRShape;
    gtQRShape12: TgtQRShape;
    gtQRShape13: TgtQRShape;
    gtQRShape14: TgtQRShape;
    QRShape35: TgtQRShape;
    QRLabel22: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel9: TgtQRLabel;
    qrlblUpstandLabel: TgtQRLabel;
    qrlblCillsLabel: TgtQRLabel;
    qrlblSlashbackLabel: TgtQRLabel;
    gtQRShape15: TgtQRShape;
    gtQRShape16: TgtQRShape;
    gtQRShape17: TgtQRShape;
    gtQRLabel13: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    gtQRShape19: TgtQRShape;
    gtQRLabel16: TgtQRLabel;
    gtQRShape18: TgtQRShape;
    gtQRShape20: TgtQRShape;
    qrrchTextInstallAddress: TgtQRRichText;
    QRLabel4: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    gtQRShape22: TgtQRShape;
    gtQRShape21: TgtQRShape;
    gtQRLabel14: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRLabel15: TgtQRLabel;
    gtQRLabel15: TgtQRLabel;
    QRDBText6: TgtQRDBText;
    qrlblContact: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    gtQRShape24: TgtQRShape;
    gtQRShape25: TgtQRShape;
    gtQRDBText3: TgtQRDBText;
    qriheadlogo1: TgtQRImage;
    memAddress2: TgtQRRichText;
    qriHeadLogo2: TgtQRImage;
    gtQRRichText1: TgtQRRichText;
    gtQRShape4: TgtQRShape;
    gtQRShape26: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    qrlblEdgeDetail: TgtQRLabel;
    qrlblThickness: TgtQRLabel;
    qrlblUpstand: TgtQRLabel;
    qrlblWindowCill: TgtQRLabel;
    qrlblSplashback: TgtQRLabel;
    qryJobEdge: TQuery;
    qryJobThickness: TQuery;
    qryJobUpstand: TQuery;
    gtQRLabel10: TgtQRLabel;
    gtQRDBText6: TgtQRDBText;
    gtQRLabel11: TgtQRLabel;
    gtQRLabel12: TgtQRLabel;
    gtQRShape27: TgtQRShape;
    gtQRLabel17: TgtQRLabel;
    gtQRDBText5: TgtQRDBText;
    qrbAdditionalItemsHeader: TQRBand;
    gtQRLabel37: TgtQRLabel;
    gtQRLabel38: TgtQRLabel;
    qrsdSOLines: TQRSubDetail;
    gtQRDBText9: TgtQRDBText;
    gtQRDBText10: TgtQRDBText;
    qrbAdditionalItemsFooter: TQRBand;
    qrySOLine: TQuery;
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
    qrySOLineQuote: TIntegerField;
    qrySOLineMarkup_Value: TFloatField;
    dtsSOLine: TDataSource;
    qrsubRemedial: TQRSubDetail;
    qrmRemedials: TgtQRMemo;
    QRDBText9: TgtQRDBText;
    qrshpRemedialLine: TgtQRShape;
    gtQRLabel19: TgtQRLabel;
    qriHeadLogo3: TgtQRImage;
    memAddress3: TgtQRRichText;
    gtQRShape28: TgtQRShape;
    gtQRShape29: TgtQRShape;
    gtQRLabel20: TgtQRLabel;
    gtQRDBText7: TgtQRDBText;
    gtQRLabel21: TgtQRLabel;
    gtQRDBText8: TgtQRDBText;
    gtQRShape30: TgtQRShape;
    gtQRShape31: TgtQRShape;
    gtQRShape32: TgtQRShape;
    gtQRLabel23: TgtQRLabel;
    gtQRDBText11: TgtQRDBText;
    qrlblAdditionalItems: TgtQRLabel;
    gtQRMemo1: TgtQRMemo;
    memApplianceDetails: TgtQRMemo;
    qrrchTextNotes: TgtQRMemo;
    qrrchTextInstallAddress1: TgtQRMemo;
    gtQRShape33: TgtQRShape;
    gtQRLabel22: TgtQRLabel;
    gtQRDBText12: TgtQRDBText;
    qryRevenueCentre: TQuery;
    QRLabel70: TgtQRLabel;
    QRDBText10: TgtQRDBText;
    gtQRLabel3: TgtQRLabel;
    gtQRDBText4: TgtQRDBText;
    gtQRLabel18: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel24: TgtQRLabel;
    gtQRDBText13: TgtQRDBText;
    qryReportOld: TQuery;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgQuoteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrchdSatisfactionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsubRemedialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbAdditionalItemsFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
    procedure GetCompanyAddress;
    procedure GetRevenueCentreAddress;
  public
    Job: integer;
    bPreview: boolean;
    bPrintLogo: boolean;
    bRetail: boolean;
    bIncludeVoucher: boolean;
    bAccountsCopy: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPJobFitting: TfrmwtRPJobFitting;

implementation

uses wtDataModule;

{$R *.dfm}

function TfrmwtRPJobFitting.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPJobFitting.qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  icount: integer;
  TempAddress: string;
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpJobSheet.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpJobSheet.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpJobSheet.PrinterSettings.copies := Copies;   {set the number of copies }
  qrpJobSheet.PrinterSettings.PaperSize := Size;   {set the number of copies }

  sWorktop := '';

  with qrySOLine do
    begin
      close;
      open;
    end;

  with qryCompany do
    begin
      close;
      open;
    end;
  {Actual Company Name and address}
  GetCompanyAddress;

end;

procedure TfrmwtRPJobFitting.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  sNewLogo: string;
begin
  qrlblUpstand.caption := 'No';
  qrlblWindowCill.caption := 'No';
  qrlblSplashback.caption := 'No';

  if qryReport.FieldByName('Address').AsInteger <> 0 then
    begin
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
  if trim(qryReport.FieldByName('Contact_Name').AsString) <> '' then
    qrlblContact.caption := qryReport.FieldByName('Contact_Name').AsString
  else
    qrlblContact.caption := '';

  {Installation Address Details}
  qrrchTextInstallAddress.lines.clear;
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Order_Install_Address').asinteger));

  {Installation Address Details}
  qrrchTextInstallAddress1.lines.clear;
  qrrchTextInstallAddress1.lines.add(BuildNotes(qryReport.fieldbyname('Order_Install_Address').asinteger));

  {Get Job Worktop, edge and upstand details}
  with qryJobEdge do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;
    end;

  with qryJobThickness do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;
    end;

  with qryJobUpstand do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;

      while eof <> true do
        begin
          if (fieldbyname('Use_Description').AsString = 'Upstand') or (fieldbyname('Use_Description').AsString = '') then
            qrlblUpstand.caption := 'Yes'
          else
          if fieldbyname('Use_Description').AsString = 'Window Cill' then
            qrlblWindowCill.caption := 'Yes'
          else
          if fieldbyname('Use_Description').AsString = 'Splashback' then
            qrlblSplashback.caption := 'Yes';
          next;
        end;
    end;

  with qryJRemedials do
    begin
      close;
      open;
      qrsubRemedial.Enabled := (recordcount > 0);
    end;

  qrlblEdgeDetail.caption := qryJobEdge.fieldbyname('Description').asstring;
  qrlblThickness.caption := qryJobThickness.fieldbyname('Thickness_mm').asstring;

  memApplianceDetails.Lines.clear;
  memApplianceDetails.Lines.add(qryReport.fieldbyname('Appliance_Details').asstring);
  
  qrrchTextNotes.lines.clear;
//  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Risk_Notes').asinteger));
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Order_Extra_Notes').asinteger));

  if dtmdlWorktops.UseRevenueCentres then
    begin
      if qryReport.FieldByName('Revenue_Centre').AsInteger <> 0 then
        begin
          sNewLogo := dtmdlWorktops.LoadRevenueCentreLogo(qryReport.FieldByName('Revenue_Centre').AsInteger);
          qriHeadlogo.picture.loadfromfile(sNewLogo);
          qriHeadlogo1.picture.loadfromfile(sNewLogo);
          qriHeadlogo2.picture.loadfromfile(sNewLogo);
          qriHeadlogo3.picture.loadfromfile(sNewLogo);
          GetRevenueCentreAddress;
        end
      else
        begin
          qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
          qriHeadlogo1.picture.loadfromfile('wtHeadLogo.bmp');
          qriHeadlogo2.picture.loadfromfile('wtHeadLogo.bmp');
          qriHeadlogo3.picture.loadfromfile('wtHeadLogo.bmp');
          GetCompanyAddress;
        end;
    end;

end;

function TfrmwtRPJobFitting.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPJobFitting.qrgQuoteAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if (qryReport.fieldbyname('Job_status').asinteger < 40) and not bPreview then
    with qryUpJStatus do
      begin
        close;
        parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
        parambyname('Production_Date_Actual').asdatetime := date;
        parambyname('Job_Status').asinteger := 40;
        execsql;
      end;

end;

procedure TfrmwtRPJobFitting.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
    qriHeadlogo1.picture.loadfromfile('wtHeadLogo.bmp');
    qriHeadlogo2.picture.loadfromfile('wtHeadLogo.bmp');
    qriHeadlogo3.picture.loadfromfile('wtHeadLogo.bmp');
  except
  end;

end;

procedure TfrmwtRPJobFitting.qrchdSatisfactionBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrmemo1.lines.text := stringreplace(qrMemo1.lines.text,'<Company>',qryCompanyAddress.fieldbyname('Company_Name').AsString, [rfReplaceAll]);
end;

procedure TfrmwtRPJobFitting.qrsubRemedialBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmRemedials.lines.clear;
  qrmRemedials.lines.add(BuildNotes(qryJRemedials.fieldbyname('Notes').asinteger));
  qrshpRemedialLine.Height := (sender as TQRCustomBand).Height;
end;

procedure TfrmwtRPJobFitting.qrbAdditionalItemsFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblAdditionalItems.enabled := not (qrySOLine.recordcount > 0);
end;

procedure TfrmwtRPJobFitting.GetCompanyAddress;
var
  tempAddress: string;
  iCount: integer;
begin
  tempAddress := '';
  memAddress.lines.clear;
  memAddress1.lines.clear;
  memAddress2.lines.clear;
  memAddress3.lines.clear;

  with qryCompanyAddress do
    begin
      close;
      open;
    end;

  tempAddress := qryCompanyAddress.fieldbyname('Company_Name').AsString;

  for icount := 1 to 4 do
  begin
    if qryCompanyAddress.Fields[icount].AsString = '' then Continue;
    tempAddress := tempAddress + ', ' + qryCompanyAddress.Fields[icount].AsString;
  end;

  tempAddress := tempAddress + ' T ' + qryCompanyAddress.Fields[6].AsString;
  tempAddress := tempAddress + ' F ' + qryCompanyAddress.Fields[7].AsString;

  tempAddress := trim(StringReplace(tempAddress,',','',[]));

  memAddress.lines.add(tempAddress);
  memAddress1.lines.add(tempAddress);
  memAddress2.lines.add(tempAddress);
  memAddress3.lines.add(tempAddress);

end;

procedure TfrmwtRPJobFitting.GetRevenueCentreAddress;
var
  i: integer;
begin
  memAddress.lines.clear;
  with qryRevenueCentre do
    begin
      close;
      parambyname('Revenue_Centre').asinteger := qryReport.FieldByName('Revenue_Centre').AsInteger;
      open;

      memAddress.lines.Add(trim(fieldbyname('Registered_Address').asstring));
      memAddress1.lines.Add(trim(fieldbyname('Registered_Address').asstring));
      memAddress2.lines.Add(trim(fieldbyname('Registered_Address').asstring));
      memAddress3.lines.Add(trim(fieldbyname('Registered_Address').asstring));
    end;
end;


end.
