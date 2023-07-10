unit PBRPQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, gtQrCtrls, gtQrExport, Printers,
  CCSPrint, qrprntr, CCSCommon, jpeg;

type
  TfrmPBRPQuote = class(TForm)
    qryReport: TQuery;
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblQuoteCaption: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    qrgQuote: TQRGroup;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryContact: TQuery;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    qryReportlines: TQuery;
    dtsReport: TDataSource;
    qrygetNotes: TQuery;
    gtQRFilters1: TgtQRFilters;
    qrmAddress: TgtQRMemo;
    QRLabel4: TgtQRLabel;
    qrlblContactName: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    qrgfQuote: TQRBand;
    GetNarrSQL: TQuery;
    gtQRLabel2: TgtQRLabel;
    gtQRDBText7: TgtQRDBText;
    ReportImage: TgtQRImage;
    gtQRLabel5: TgtQRLabel;
    qrbOvers: TQRChildBand;
    gtQRLabel13: TgtQRLabel;
    gtQRLabel14: TgtQRLabel;
    gtQRLabel15: TgtQRLabel;
    gtQRLabel16: TgtQRLabel;
    gtQRLabel17: TgtQRLabel;
    gtQRLabel18: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRShape2: TgtQRShape;
    gtQRShape3: TgtQRShape;
    gtQRLabel19: TgtQRLabel;
    gtQRLabel20: TgtQRLabel;
    gtQRLabel21: TgtQRLabel;
    qrbPostage: TQRChildBand;
    qryProspect: TQuery;
    QRBand1: TQRBand;
    qryReportSupply: TQuery;
    oldqryReportSupply: TQuery;
    qryReportDepts: TQuery;
    qrbDeptHeader: TQRGroup;
    gtQRDBText8: TgtQRDBText;
    qrbDeptDetail: TQRSubDetail;
    qrbDeptFooter: TQRBand;
    gtQRLabel11: TgtQRLabel;
    gtlblQuantity: TgtQRLabel;
    gtlblUnitPrice: TgtQRLabel;
    gtlblTotalPrice: TgtQRLabel;
    qrbLineHeader: TQRGroup;
    gtQRDBText5: TgtQRDBText;
    qrbLineDetail: TQRSubDetail;
    gtlblQuoteQuantity: TgtQRDBText;
    gtlblQuoteUnitPrice: TgtQRDBText;
    gtQRDBText1: TgtQRDBText;
    gtlblQuoteTotalPrice: TgtQRLabel;
    qrbSupplyHeader: TQRBand;
    gtQRLabel9: TgtQRLabel;
    qrbSupplyLines: TQRSubDetail;
    gtQRDBText6: TgtQRDBText;
    gtlblSupplyQuantity: TgtQRDBText;
    gtlblSupplyUnitPrice: TgtQRDBText;
    gtlblSupplyTotalPrice: TgtQRLabel;
    SpecMemo: TgtQRMemo;
    gtlblVat: TgtQRLabel;
    gtlblQuoteVat: TgtQRLabel;
    gtlblSupplyVat: TgtQRLabel;
    gtlblPriceUnit: TgtQRLabel;
    gtlblQuotePriceUnit: TgtQRDBText;
    gtlblSupplyPriceUnit: TgtQRDBText;
    qrbPageFooter: TQRBand;
    gtQRLabel10: TgtQRLabel;
    gtlblTotalSales: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtlblTotalVat: TgtQRLabel;
    gtlblTotalGross: TgtQRLabel;
    gtlblPackPriceUnit: TgtQRLabel;
    gtlblPackUnitPrice: TgtQRLabel;
    gtlblPackVat: TgtQRLabel;
    gtlblPackPriceVat: TgtQRLabel;
    gtlblPackPriceGross: TgtQRLabel;
    gtlblPackTotalGross: TgtQRLabel;
    gtNotesShape: TgtQRShape;
    memPayment: TgtQRMemo;
    qrbNotes: TQRChildBand;
    memNotes: TgtQRMemo;
    gtQRLabel12: TgtQRLabel;
    QRMemoCmpnyNm: TgtQRMemo;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel32: TgtQRLabel;
    gtQRLabel33: TgtQRLabel;
    gtQRLabel34: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    CompSQL: TQuery;
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
    procedure qrbPageFooterBeforePrint(Sender: TQRCustomBand;
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
    procedure BuildNotes(aQuery : TQuery; const iNarrative : integer);
    procedure BuildQuoteNotes(aQuery : TQuery; const iNarrative : integer);
    procedure SetShowBreakdown(const Value: boolean);
    { Private declarations }
  public
    EndUserVersion: boolean;
    ForceNewPage: boolean;
    Key: real;
    bPrintLogo: boolean;
    bPreview: boolean;
    PrinterSettings: TPrinterSettings;
    function Getdetails: integer;
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
  {Get the customer address details}

  qrmAddress.Lines.Clear;

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
  qrpDetails.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  ReportImage.enabled := bPrintLogo;
  ReportImage.Picture := pbImagesFrm.ReportImage.Picture;
//  imgISO.Enabled := ReportImage.enabled;
//  imgDeliveryMan.Enabled := ReportImage.enabled;

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
  rTotalPrice: real;
  rVatRate, rVat: real;
begin
  if qryReportLines.fieldbyname('price_unit_factor').asfloat = 0 then
    rTotalPrice := qryReportLines.fieldbyname('unit_price').asfloat
  else
    rTotalPrice := (qryReportLines.fieldbyname('unit_price').asfloat*(qryReportLines.fieldbyname('quantity').asfloat/qryReportLines.fieldbyname('price_unit_factor').asfloat));

  gtlblQuoteTotalPrice.Caption  := formatfloat('£#,###,##0.00',rTotalPrice);

  rVatRate := qryReportLines.fieldbyname('Vat_Rate').asfloat;
  rVat := rTotalPrice * rVatRate/100.00;

  gtlblQuoteVat.Caption  := formatfloat('£##,###,##0.00',rVat);

  rTotalSell := rTotalSell + rTotalPrice;
  rTotalVat := rTotalVat + rVat;
end;

procedure TfrmPBRPQuote.qrbPageFooterBeforePrint(Sender: TQRCustomBand;
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

end.
