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
    memAddress: TQRRichText;
    qrchdSatisfaction: TQRChildBand;
    QRLabel11: TQRLabel;
    memAddress1: TQRRichText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel48: TQRLabel;
    QRMemo3: TQRMemo;
    QRLabel49: TQRLabel;
    QRMemo4: TQRMemo;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape6: TQRShape;
    QRLabel51: TQRLabel;
    qrchdSnagging: TQRChildBand;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    qryJRemedials: TQuery;
    QRBand1: TQRBand;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel71: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRShape48: TQRShape;
    QRLabel74: TQRLabel;
    qriHeadLogo: TQRImage;
    qrlblSOCaption: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRDBText2: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRShape2: TQRShape;
    gtQRShape3: TQRShape;
    gtQRShape5: TQRShape;
    QRLabel24: TQRLabel;
    gtQRShape6: TQRShape;
    gtQRLabel4: TQRLabel;
    gtQRShape7: TQRShape;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRShape23: TQRShape;
    gtQRShape8: TQRShape;
    gtQRShape9: TQRShape;
    gtQRShape10: TQRShape;
    gtQRShape11: TQRShape;
    gtQRShape12: TQRShape;
    gtQRShape13: TQRShape;
    gtQRShape14: TQRShape;
    QRShape35: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText5: TQRDBText;
    gtQRLabel8: TQRLabel;
    gtQRLabel9: TQRLabel;
    qrlblUpstandLabel: TQRLabel;
    qrlblCillsLabel: TQRLabel;
    qrlblSlashbackLabel: TQRLabel;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    gtQRShape17: TQRShape;
    gtQRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    gtQRShape19: TQRShape;
    gtQRLabel16: TQRLabel;
    gtQRShape18: TQRShape;
    gtQRShape20: TQRShape;
    qrrchTextInstallAddress: TQRRichText;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    gtQRShape22: TQRShape;
    gtQRShape21: TQRShape;
    gtQRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel15: TQRLabel;
    gtQRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    qrlblContact: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    gtQRShape24: TQRShape;
    gtQRShape25: TQRShape;
    gtQRDBText3: TQRDBText;
    qriheadlogo1: TQRImage;
    memAddress2: TQRRichText;
    qriHeadLogo2: TQRImage;
    gtQRRichText1: TQRRichText;
    gtQRShape4: TQRShape;
    gtQRShape26: TQRShape;
    gtQRLabel1: TQRLabel;
    qrlblEdgeDetail: TQRLabel;
    qrlblThickness: TQRLabel;
    qrlblUpstand: TQRLabel;
    qrlblWindowCill: TQRLabel;
    qrlblSplashback: TQRLabel;
    qryJobEdge: TQuery;
    qryJobThickness: TQuery;
    qryJobUpstand: TQuery;
    gtQRLabel10: TQRLabel;
    gtQRDBText6: TQRDBText;
    gtQRLabel11: TQRLabel;
    gtQRLabel12: TQRLabel;
    gtQRShape27: TQRShape;
    gtQRLabel17: TQRLabel;
    gtQRDBText5: TQRDBText;
    qrbAdditionalItemsHeader: TQRBand;
    gtQRLabel37: TQRLabel;
    gtQRLabel38: TQRLabel;
    qrsdSOLines: TQRSubDetail;
    gtQRDBText9: TQRDBText;
    gtQRDBText10: TQRDBText;
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
    qrmRemedials: TQRMemo;
    QRDBText9: TQRDBText;
    qrshpRemedialLine: TQRShape;
    gtQRLabel19: TQRLabel;
    qriHeadLogo3: TQRImage;
    memAddress3: TQRRichText;
    gtQRShape28: TQRShape;
    gtQRShape29: TQRShape;
    gtQRLabel20: TQRLabel;
    gtQRDBText7: TQRDBText;
    gtQRLabel21: TQRLabel;
    gtQRDBText8: TQRDBText;
    gtQRShape30: TQRShape;
    gtQRShape31: TQRShape;
    gtQRShape32: TQRShape;
    gtQRLabel23: TQRLabel;
    gtQRDBText11: TQRDBText;
    qrlblAdditionalItems: TQRLabel;
    gtQRMemo1: TQRMemo;
    memApplianceDetails: TQRMemo;
    qrrchTextNotes: TQRMemo;
    qrrchTextInstallAddress1: TQRMemo;
    gtQRShape33: TQRShape;
    gtQRLabel22: TQRLabel;
    gtQRDBText12: TQRDBText;
    qryRevenueCentre: TQuery;
    QRLabel70: TQRLabel;
    QRDBText10: TQRDBText;
    gtQRLabel3: TQRLabel;
    gtQRDBText4: TQRDBText;
    gtQRLabel18: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRLabel24: TQRLabel;
    gtQRDBText13: TQRDBText;
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
  qrpJobSheet.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
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
