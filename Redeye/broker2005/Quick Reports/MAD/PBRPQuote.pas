unit PBRPQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, QrExport, Printers,
  CCSPrint, qrprntr, CCSCommon, jpeg;

type
  TfrmPBRPQuote = class(TForm)
    qryReport: TQuery;
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblQuoteCaption: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    qrgQuote: TQRGroup;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryContact: TQuery;
    gtQRLabel1: TQRLabel;
    gtQRDBText2: TQRDBText;
    qryReportlines: TQuery;
    dtsReport: TDataSource;
    qrygetNotes: TQuery;
    gtQRFilters1: TgtQRFilters;
    qrmAddress: TQRMemo;
    QRLabel4: TQRLabel;
    qrlblContactName: TQRLabel;
    QRDBText3: TQRDBText;
    qrgfQuote: TQRBand;
    GetNarrSQL: TQuery;
    gtQRLabel2: TQRLabel;
    gtQRDBText7: TQRDBText;
    ReportImage: TQRImage;
    gtQRLabel5: TQRLabel;
    qrbOvers: TQRChildBand;
    gtQRLabel13: TQRLabel;
    gtQRLabel14: TQRLabel;
    gtQRLabel15: TQRLabel;
    gtQRLabel16: TQRLabel;
    gtQRLabel17: TQRLabel;
    gtQRLabel18: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRShape2: TQRShape;
    gtQRShape3: TQRShape;
    gtQRLabel19: TQRLabel;
    gtQRLabel20: TQRLabel;
    gtQRLabel21: TQRLabel;
    qrbPostage: TQRChildBand;
    qryProspect: TQuery;
    qrbPageFooter: TQRBand;
    qryReportSupply: TQuery;
    oldqryReportSupply: TQuery;
    qryReportDepts: TQuery;
    qrbDeptHeader: TQRGroup;
    gtQRDBText8: TQRDBText;
    qrbDeptDetail: TQRSubDetail;
    qrbDeptFooter: TQRBand;
    gtQRLabel11: TQRLabel;
    gtlblQuantity: TQRLabel;
    gtlblUnitPrice: TQRLabel;
    gtlblTotalPrice: TQRLabel;
    qrbLineHeader: TQRGroup;
    gtQRDBText5: TQRDBText;
    qrbLineDetail: TQRSubDetail;
    gtlblQuoteQuantity: TQRDBText;
    gtQRDBText1: TQRDBText;
    gtlblQuoteTotalPrice: TQRLabel;
    qrbSupplyHeader: TQRBand;
    gtQRLabel9: TQRLabel;
    qrbSupplyLines: TQRSubDetail;
    gtQRDBText6: TQRDBText;
    gtlblSupplyQuantity: TQRDBText;
    gtlblSupplyUnitPrice: TQRDBText;
    gtlblSupplyTotalPrice: TQRLabel;
    SpecMemo: TQRMemo;
    gtlblVat: TQRLabel;
    gtlblQuoteVat: TQRLabel;
    gtlblSupplyVat: TQRLabel;
    gtlblPriceUnit: TQRLabel;
    gtlblQuotePriceUnit: TQRDBText;
    gtlblSupplyPriceUnit: TQRDBText;
    qrbQuoteFooter: TQRBand;
    gtQRLabel10: TQRLabel;
    gtlblTotalSales: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtlblTotalVat: TQRLabel;
    gtlblTotalGross: TQRLabel;
    gtlblPackPriceUnit: TQRLabel;
    gtlblPackUnitPrice: TQRLabel;
    gtlblPackVat: TQRLabel;
    gtlblPackPriceVat: TQRLabel;
    gtlblPackPriceGross: TQRLabel;
    gtlblPackTotalGross: TQRLabel;
    gtNotesShape: TQRShape;
    memPayment: TQRMemo;
    qrbNotes: TQRChildBand;
    memNotes: TQRMemo;
    gtQRLabel12: TQRLabel;
    QRMemoCmpnyNm: TQRMemo;
    gtQRLabel6: TQRLabel;
    gtQRLabel32: TQRLabel;
    gtQRLabel33: TQRLabel;
    gtQRLabel34: TQRLabel;
    gtQRLabel4: TQRLabel;
    CompSQL: TQuery;
    gtQRImage1: TQRImage;
    gtQRLabel3: TQRLabel;
    gtQRMemo1: TQRMemo;
    gtQRImage2: TQRImage;
    imgISO: TQRImage;
    qrmRegNumber: TQRMemo;
    qrmRegOffice: TQRMemo;
    qryReportOld: TQuery;
    qrlblEndUser: TQRLabel;
    qrlblEndUserName: TQRDBText;
    gtlblQuoteUnitPrice: TQRLabel;
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsdtlProcessesAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrGrpProcessesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbLineDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbQuoteFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgfQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbSupplyLinesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDeptDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbNotesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    rTotalCost, rTotalSell, rTotalVat: real;
    ipage: integer;
    FShowBreakdown: boolean;
    FEndUserVersion: boolean;
    procedure BuildNotes(aQuery : TQuery; const iNarrative : integer);
    procedure BuildQuoteNotes(aQuery : TQuery; const iNarrative : integer);
    procedure SetShowBreakdown(const Value: boolean);
    procedure SetEndUserVersion(const Value: boolean);
    { Private declarations }
  public
    ForceNewPage: boolean;
    Key: real;
    bPrintLogo: boolean;
    bPreview: boolean;
    PrinterSettings: TPrinterSettings;
    function Getdetails: integer;
    property EndUserVersion: boolean read FEndUserVersion write SetEndUserVersion;
    property ShowBreakdown: boolean read FShowBreakdown write SetShowBreakdown;
  end;

var
  frmPBRPQuote: TfrmPBRPQuote;

implementation

uses PBImages, pbMainMenu, pbDatabase;

{$R *.dfm}

function TfrmPBRPQuote.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Quote').asfloat := self.key;
      open;
      result := recordcount;
    end;
end;

procedure TfrmPBRPQuote.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  if not EndUserVersion then
    begin
      ReportImage.enabled := bPrintLogo;
      ReportImage.Picture := pbImagesFrm.ReportImage.Picture;
      QRMemoCmpnyNm.Enabled := true;
      qrbPageFooter.Enabled := true;
      imgISO.Enabled := ReportImage.enabled;
      qrlblQuoteCaption.Caption := 'Quotation'
    end
  else
    begin
      ReportImage.enabled := false;
      ReportImage.Picture := nil;
      QRMemoCmpnyNm.Enabled := false;
      qrbPageFooter.enabled := false;
      imgISO.Enabled := false;
      qrlblQuoteCaption.Caption := 'Recommended Sales Price'
    end;

  {Get the customer address details}
  qrmAddress.Lines.Clear;

  if EndUserVersion then
    begin
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('End_User_Customer').AsInteger;
      qryCustomer.parambyname('Branch_no').asinteger := qryReport.FieldByName('End_User_Branch_no').AsInteger;
      qryCustomer.open;
      dtsAddress.dataset := qryCustomer;

      {Get the customer contact details}
      qryContact.close;
      qryContact.parambyname('Customer').asinteger := qryReport.FieldByName('End_User_Customer').AsInteger;
      qryContact.parambyname('Branch_no').asinteger := qryReport.FieldByName('End_User_Branch_no').AsInteger;
      qryContact.parambyname('Contact_no').asinteger := qryReport.FieldByName('End_User_Contact_no').AsInteger;
      qryContact.open;

      qrlblContactName.caption := qryContact.fieldbyname('Contact_Name').asstring;
    end
  else
  if qryReport.FieldByName('Customer').AsInteger <> 0 then
    begin
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.parambyname('Branch_no').asinteger := qryReport.FieldByName('Branch_no').AsInteger;
      qryCustomer.open;
      dtsAddress.dataset := qryCustomer;

      {Get the customer contact details}
      qryContact.close;
      qryContact.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryContact.parambyname('Branch_no').asinteger := qryReport.FieldByName('Branch_no').AsInteger;
      qryContact.parambyname('Contact_no').asinteger := qryReport.FieldByName('Contact_no').AsInteger;
      qryContact.open;

      qrlblContactName.caption := qryContact.fieldbyname('Contact_Name').asstring;
    end
  else
    begin
      qryProspect.close;
      qryProspect.parambyname('Ad_Hoc_Address').asinteger := qryReport.FieldByName('Ad_hoc_Address').AsInteger;
      qryProspect.open;
      dtsAddress.dataset := qryProspect;

      qrlblContactName.caption := qryReport.fieldbyname('Contact_Name').asstring;
    end;

  {Display End User details if customer is acquired}
  qrlblEndUser.Enabled := (dtsAddress.DataSet.fieldbyname('Customer_Is_Acquired').asstring = 'Y');
  qrlblEndUserName.Enabled := (dtsAddress.DataSet.fieldbyname('Customer_Is_Acquired').asstring = 'Y');

  for i := 0 to 5 do
    begin
      if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
    end;

  {determine if there are any payment terms to display}
  memPayment.lines.clear;

  if (dtsAddress.dataset.fieldbyname('Payment_Terms_Description').asstring <> '') then
    begin
      memPayment.lines.add(dtsAddress.dataset.fieldbyname('Payment_Terms_Description').asstring);
      memPayment.visible := true;
      gtNotesShape.Visible := true;
    end
  else
    begin
      memPayment.visible := false;
      gtNotesShape.Visible := false;
      gtNotesShape.enabled := false;
    end;

  {Show the notes}
  BuildQuoteNotes(qryReport, qryReport.fieldbyname('Narrative').asinteger);

  if memNotes.lines.text = '' then
    qrbNotes.enabled := false
  else
    qrbNotes.enabled := true;
end;

procedure TfrmPBRPQuote.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
   iRow: integer;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  rTotalCost := 0;
  rTotalSell := 0;
  rTotalVat := 0;

  iPage := 0;


  with QRMemoCmpnyNm do
    begin
      CompSQL.close;
      CompSQL.open;
      Lines.Clear;
      for irow := 1 to 5 do
        begin
        if Trim(CompSQL.Fields[irow].AsString) <> '' then
        Lines.Append(Trim(CompSQL.Fields[irow].AsString)) ;
      end;
      {Finally, add the phone number} ;
      Lines.Append(' ');
      Lines.Append('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString));
    end;
    
  with qryReportDepts do
    begin
      close;
      open;
      qrbDeptHeader.Enabled := (recordcount > 0);
      qrbDeptDetail.Enabled := (recordcount > 0);
    end;

  with qryReportLines do
    begin
      close;
      open;
    end;

  with qryReportSupply do
    begin
      close;
      open;
      qrbSupplyHeader.Enabled := (recordcount > 0);
      qrbSupplyLines.Enabled := (recordcount > 0);
    end;

  if qryReport.FieldByName('Price_unit').asinteger = 0 then
    begin
      gtlblUnitPrice.Enabled := false;
      gtlblPriceUnit.enabled := false;
    end;
end;

procedure TfrmPBRPQuote.qrsdtlProcessesAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
//  qrsdtlProcesses.Height := 24;
//  qrrchTextProcessNotes.Height := 16;
end;

procedure TfrmPBRPQuote.qrGrpProcessesBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inc(iPage);

end;

procedure TfrmPBRPQuote.qrbLineDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotalPrice, rUnitPrice: real;
  rVatRate, rVat: real;
begin
  {Set price based on whether End User version or normal}
  if EndUserVersion then
    rUnitPrice := qryReportLines.fieldbyname('Reseller_Price').asfloat
  else
    rUnitPrice := qryReportLines.fieldbyname('Unit_Price').asfloat;

  if qryReportLines.fieldbyname('price_unit_factor').asfloat = 0 then
    rTotalPrice := rUnitPrice
  else
    rTotalPrice := (rUnitPrice*(qryReportLines.fieldbyname('quantity').asfloat/qryReportLines.fieldbyname('price_unit_factor').asfloat));

  gtlblQuoteUnitPrice.Caption  := formatfloat('£#,###,##0.00',rUnitPrice);
  gtlblQuoteTotalPrice.Caption  := formatfloat('£#,###,##0.00',rTotalPrice);

  rVatRate := qryReportLines.fieldbyname('Vat_Rate').asfloat;
  rVat := rTotalPrice * rVatRate/100.00;

  gtlblQuoteVat.Caption  := formatfloat('£##,###,##0.00',rVat);

  rTotalSell := rTotalSell + rTotalPrice;
  rTotalVat := rTotalVat + rVat;
end;

procedure TfrmPBRPQuote.qrbQuoteFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  gtlblTotalVat.caption := formatfloat('£##,###,##0.00',rTotalVat);
  gtlblTotalSales.caption := formatfloat('£##,###,##0.00',rTotalSell);
  gtlblTotalGross.caption := formatfloat('£##,###,##0.00',rTotalSell+rTotalVat);
  gtlblPackPriceUnit.caption := 'Total Price ' + qryReport.fieldbyname('Price_Unit_Description').asstring;

  gtlblPackPriceUnit.enabled := false;
  gtlblPackPriceVat.enabled := false;
  gtlblPackPriceGross.enabled := false;
  gtlblPackUnitPrice.enabled := false;
  gtlblPackVat.enabled := false;
  gtlblPackTotalGross.enabled := false;

  if (qryReport.FieldByName('Price_Unit').asinteger <> 0) and (dmBroker.UsePackPricing) then
    begin
        gtlblPackPriceUnit.enabled := true;
        gtlblPackPriceVat.enabled := true;
        gtlblPackPriceGross.enabled := true;
        gtlblPackUnitPrice.enabled := true;
        gtlblPackVat.enabled := true;
        gtlblPackTotalGross.enabled := true;

      if qryReport.FieldByName('Price_Unit_Factor').asinteger = 0 then
        begin
          gtlblPackUnitPrice.caption := formatfloat('£##,###,##0.000',rTotalSell);
          gtlblPackVat.caption := formatfloat('£##,###,##0.000',rTotalVat);
          gtlblPackTotalGross.caption := formatfloat('£##,###,##0.000',rTotalSell+rTotalVat);
        end
      else
        begin
          gtlblPackUnitPrice.caption := formatfloat('£##,###,##0.000',rTotalSell/(qryReport.fieldbyname('quantity').asinteger/qryReport.fieldbyname('Price_Unit_Factor').asinteger));
          gtlblPackVat.caption := formatfloat('£##,###,##0.000',rTotalVat/(qryReport.fieldbyname('quantity').asinteger/qryReport.fieldbyname('Price_Unit_Factor').asinteger));
          gtlblPackTotalGross.caption := formatfloat('£##,###,##0.000',(rTotalSell+rTotalVat)/(qryReport.fieldbyname('quantity').asinteger/qryReport.fieldbyname('Price_Unit_Factor').asinteger));
        end;
    end;
end;

procedure TfrmPBRPQuote.BuildNotes(aQuery: TQuery;
  const iNarrative : integer);
var
  aStr : string;
begin
  with aQuery do
  begin  {If any notes then get then}
    if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Narrative_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
    SpecMemo.Lines.Clear;
    SpecMemo.Lines.Text := aStr;
  end;
end;

procedure TfrmPBRPQuote.BuildQuoteNotes(aQuery: TQuery;
  const iNarrative : integer);
var
  aStr : string;
begin
  with aQuery do
  begin  {If any notes then get then}
    if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Narrative_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
    memNotes.Lines.Clear;
    memNotes.Lines.Text := aStr;
  end;
end;

procedure TfrmPBRPQuote.qrgfQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  qrgfQuote.height := memoNotes.height + 13;
end;

procedure TfrmPBRPQuote.qrbSupplyLinesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotalPrice, rVatRate, rVat: real;
begin
  if qryReportSupply.fieldbyname('price_unit_factor').asfloat = 0 then
    rTotalPrice := qryReportSupply.fieldbyname('Unit_price').asfloat
  else
    rTotalPrice := (qryReportSupply.fieldbyname('Unit_price').asfloat*(qryReportSupply.fieldbyname('quantity').asfloat/qryReportSupply.fieldbyname('price_unit_factor').asfloat));

  gtlblSupplyTotalPrice.Caption  := formatfloat('£##,###,##0.00',rTotalPrice);

  rVatRate := qryReportSupply.fieldbyname('Vat_Rate').asfloat;
  rVat := rTotalPrice * rVatRate/100.00;

  gtlblSupplyVat.Caption  := formatfloat('£##,###,##0.00',rVat);

  rTotalSell := rTotalSell + rTotalPrice;
  rTotalVat := rTotalVat + rVat;
end;

procedure TfrmPBRPQuote.qrbDeptDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  SpecMemo.Lines.clear;
  if qryReportDepts.fieldbyname('Quote_Specification_id').asinteger > 0 then
    BuildNotes(qryReportDepts, qryReportDepts.fieldbyname('Quote_Specification_id').asinteger)
  else
    SpecMemo.Lines.Text := qryReportDepts.fieldbyname('Quote_Specification').asstring;
end;

procedure TfrmPBRPQuote.SetShowBreakdown(const Value: boolean);
begin
  FShowBreakdown := Value;
  gtlblUnitPrice.enabled := FShowBreakdown;
  gtlblPriceUnit.enabled := FShowBreakdown;
  gtlblTotalPrice.enabled := FShowBreakdown;
  gtlblVat.enabled := FShowBreakdown;
  gtlblQuoteUnitPrice.enabled := FShowBreakdown;
  gtlblQuotePriceUnit.enabled := FShowBreakdown;
  gtlblQuoteTotalPrice.enabled := FShowBreakdown;
  gtlblQuoteVat.enabled := FShowBreakdown;
  gtlblSupplyUnitPrice.enabled := FShowBreakdown;
  gtlblSupplyPriceUnit.enabled := FShowBreakdown;
  gtlblSupplyTotalPrice.enabled := FShowBreakdown;
  gtlblSupplyVat.enabled := FShowBreakdown;
end;

procedure TfrmPBRPQuote.qrbNotesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrbNotes.height := memNotes.height + 28;
end;

procedure TfrmPBRPQuote.SetEndUserVersion(const Value: boolean);
begin
  FEndUserVersion := Value;
end;

end.
