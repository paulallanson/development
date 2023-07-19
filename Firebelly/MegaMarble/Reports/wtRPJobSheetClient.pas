unit wtRPJobSheetClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrCtrls,
  gtQrExport, qrprntr, printers, AllCommon;

type
  TfrmwtRPJobSheetClient = class(TForm)
    qrpDetails: TQuickRep;
    qrgSalesOrder: TQRGroup;
    qryReport: TQuery;
    qrbPageHeader: TQRBand;
    dtsReport: TDataSource;
    qrsdSOLines: TQRSubDetail;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qrbSOFooter: TQRBand;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qryUpQuote: TQuery;
    qrmAddress: TQRMemo;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel18: TQRLabel;
    qrlblGross: TQRLabel;
    qryEndUser: TQuery;
    QRLabel1: TQRLabel;
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
    qrlblFitDateLabel: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRShape6: TQRShape;
    QRShape3: TQRShape;
    gtQRShape1: TQRShape;
    QRShape1: TQRShape;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRShape2: TQRShape;
    qrmSiteAddress: TQRMemo;
    gtQRShape3: TQRShape;
    gtQRShape4: TQRShape;
    gtQRShape5: TQRShape;
    gtQRShape6: TQRShape;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    QRShape7: TQRShape;
    gtQRShape8: TQRShape;
    qrVertLine3: TQRShape;
    qrVertLine1: TQRShape;
    qrVertLine2: TQRShape;
    qrHorzLine1: TQRShape;
    qryCompanyAddress: TQuery;
    GetNarrSQL: TQuery;
    qrlblDescription: TQRLabel;
    qrlblDateRequired: TQRLabel;
    qrySOLineMarkup_Value: TFloatField;
    dtsSOLine: TDataSource;
    qriHeadLogo: TQRImage;
    memAddress: TQRMemo;
    qrlblSOCaption: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRShape46: TQRShape;
    gtQRShape13: TQRShape;
    gtQRMemo3: TQRMemo;
    gtQRMemo1: TQRMemo;
    gtQRMemo2: TQRMemo;
    gtQRShape12: TQRShape;
    gtQRShape14: TQRShape;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    gtQRShape17: TQRShape;
    gtQRShape7: TQRShape;
    gtQRShape18: TQRShape;
    gtQRShape19: TQRShape;
    gtQRShape20: TQRShape;
    gtQRShape21: TQRShape;
    gtQRShape22: TQRShape;
    gtQRShape27: TQRShape;
    gtQRLabel4: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRLabel10: TQRLabel;
    gtQRLabel11: TQRLabel;
    gtQRShape23: TQRShape;
    gtQRShape24: TQRShape;
    gtQRShape25: TQRShape;
    gtQRShape26: TQRShape;
    gtQRLabel12: TQRLabel;
    gtQRLabel13: TQRLabel;
    QRBand1: TQRBand;
    QRChildBand1: TQRChildBand;
    gtQRSysData1: TgtQRSysData;
    qrlNotes: TQRLabel;
    gtQRShape9: TQRShape;
    gtQRLabel14: TQRLabel;
    gtQRDBText2: TQRDBText;
    qrrchTextNotes: TQRRichText;
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
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
  public
    Job: integer;
    SalesOrder: integer;
    bDetailed: boolean;
    bPreview: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bEndUser: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPJobSheetClient: TfrmwtRPJobSheetClient;

implementation

uses wtDataModule;

var
  rLineTotal, rInstallTotal, rSurveyTotal, rDeliveryTotal, rGrossTotal, rVATTotal: real;

{$R *.dfm}

function TfrmwtRPJobSheetClient.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPJobSheetClient.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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
      if recordcount > 1 then
        begin
          qrVertLine1.Height := qrVertLine1.Height + (30 * (recordcount - 1));
          qrVertLine2.Height := qrVertLine1.Height;
          qrVertLine3.Height := qrVertLine1.Height;
        end;
    end;

  memAddress.lines.clear;
  with qryCompanyAddress do
    begin
      close;
      open;
      for iCount := 0 to 4 do
        begin
          if qryCompanyAddress.Fields[iCount].asstring = '' then
            continue
          else
            memAddress.Lines.Append(Trim(qryCompanyAddress.Fields[iCount].asstring)) ;
        end;

      {Finally, add the phone number} ;
      memAddress.Lines.Append('Tel: ' + Trim(qryCompanyAddress.fieldbyname('Telephone_number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring) <> '' then
        memAddress.Lines.Append('Fax: ' + Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring) <> '' then
        memAddress.Lines.Append(Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring) <> '' then
        memAddress.Lines.Append(Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring));
    end;

  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryCompany.fieldbyname('Order_Confirmation_Notes').asinteger));

end;

procedure TfrmwtRPJobSheetClient.qrgSalesOrderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  rGrossTotal := 0.00;
  rLineTotal := 0.00;
  rInstallTotal := 0.00;
  rSurveyTotal := 0.00;
  rDeliveryTotal := 0.00;
  rVatTotal := 0.00;
  
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
      if trim(dtsAddress.DataSet.FieldByName('Telephone_Number').AsString) <> '' then
        qrmAddress.Lines.Add('Telephone: ' + dtsAddress.DataSet.FieldByName('Telephone_Number').AsString);
      if trim(dtsAddress.DataSet.FieldByName('Email_Address').AsString) <> '' then
        qrmAddress.Lines.Add('Email: ' + dtsAddress.DataSet.FieldByName('Email_Address').AsString);
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
end;

procedure TfrmwtRPJobSheetClient.qrbSOFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rBalance, rToPay, rDeposit: real;
  sNett, sVat: string;
begin

  rNettTotal := qryReport.fieldbyname('Goods_Value').asfloat;
  rVATTotal := qryReport.fieldbyname('Vat_Value').asfloat;

  sNett := formatfloat('0.00',rNettTotal);
  sVat := formatfloat('0.00',rVATTotal);

  rGrossTotal := strtofloat(sNett) + strtofloat(sVat);
  qrlblGross.Caption := formatfloat('£#,##0.00',rGrossTotal);

end;

function TfrmwtRPJobSheetClient.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPJobSheetClient.qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrbPageHeader.Enabled := false;
end;

procedure TfrmwtRPJobSheetClient.qrsdSOLinesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qrySOLine.FieldByName('Quote').Asinteger <> 0 then
    begin
      qrlblDescription.caption := qrySOLine.fieldbyname('Description').asstring + ' Quote: ' + qrySOLine.FieldByName('Quote').Asstring;
    end
  else
    begin
      qrlblDescription.caption := qrySOLine.fieldbyname('Description').asstring;
    end;
end;

procedure TfrmwtRPJobSheetClient.FormCreate(Sender: TObject);
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

procedure TfrmwtRPJobSheetClient.qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {Set the labels depending on the date type}
  if qryReport.fieldbyname('Date_Type').asstring = 'C' then
    begin
      qrlblFitDateLabel.caption := 'Confirmed Fitting Date';
    end
  else
  if qryReport.fieldbyname('Date_Type').asstring = 'P' then
    begin
      qrlblFitDateLabel.caption := 'Provisional Fitting Date';
    end
  else
    begin
      qrlblFitDateLabel.caption := 'Proposed Fitting Date';
    end;

(*  {Set the Template and Fitting Dates}
  if qryReport.fieldbyname('template_Date').asdatetime = 0 then
    qrlblTemplateDate.caption := 'TBC'
  else
    qrlblTemplateDate.caption := paDateStr(qryReport.fieldbyname('template_Date').asdatetime);
*)

  if qryReport.fieldbyname('Date_Required').asdatetime = 0 then
    qrlblDateRequired.caption := 'TBC'
  else
    qrlblDateRequired.caption := paDateStr(qryReport.fieldbyname('Date_Required').asdatetime);
end;

end.
