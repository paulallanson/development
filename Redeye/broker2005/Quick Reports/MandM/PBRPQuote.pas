unit PBRPQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, QrExport, Printers,
  CCSPrint, qrprntr, CCSCommon;

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
    qrbLineDetail: TQRSubDetail;
    gtQRFilters1: TgtQRFilters;
    qrmAddress: TQRMemo;
    QRLabel4: TQRLabel;
    qrlblContactName: TQRLabel;
    QRDBText3: TQRDBText;
    gtQRDBText1: TQRDBText;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRDBText3: TQRDBText;
    gtQRDBText4: TQRDBText;
    qrbPageFooter: TQRBand;
    gtQRLabel10: TQRLabel;
    gtlblTotalSales: TQRLabel;
    qrgfQuote: TQRBand;
    GetNarrSQL: TQuery;
    gtlblUnitPrice: TQRLabel;
    gtlblPriceUnit: TQRLabel;
    gtlblTotalPrice: TQRLabel;
    qrbSupplyLines: TQRSubDetail;
    qryReportSupply: TQuery;
    gtQRDBText6: TQRDBText;
    gtQRDBText9: TQRDBText;
    gtQRDBText10: TQRDBText;
    gtlblSupplyPrice: TQRLabel;
    qrbSupplyHeader: TQRBand;
    qrbLineHeader: TQRGroup;
    gtQRDBText5: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRDBText7: TQRDBText;
    ReportImage: TQRImage;
    gtQRLabel5: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRLabel9: TQRLabel;
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
    gtQRLabel22: TQRLabel;
    gtQRLabel23: TQRLabel;
    gtQRLabel24: TQRLabel;
    gtQRLabel25: TQRLabel;
    gtQRLabel26: TQRLabel;
    gtQRLabel27: TQRLabel;
    gtQRLabel28: TQRLabel;
    gtQRLabel29: TQRLabel;
    gtQRLabel30: TQRLabel;
    gtQRLabel12: TQRLabel;
    gtQRLabel31: TQRLabel;
    gtQRLabel32: TQRLabel;
    gtQRLabel33: TQRLabel;
    gtQRLabel34: TQRLabel;
    gtQRLabel35: TQRLabel;
    qryProspect: TQuery;
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
  private
    rTotalCost, rTotalSell: real;
    ipage: integer;
    FShowBreakdown: boolean;
    procedure BuildNotes(aQuery : TQuery; const iNarrative : integer);
    procedure SetShowBreakdown(const Value: boolean);
    { Private declarations }
  public
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

uses PBImages;

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

//  BuildNotes(qryReport, qryReport.fieldbyname('Narrative').asinteger);

(*  if memoNotes.lines.text = '' then
    qrgfQuote.enabled := false
  else
    qrgfQuote.enabled := true;
*)
end;

procedure TfrmPBRPQuote.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  ReportImage.enabled := bPrintLogo;
  ReportImage.Picture := pbImagesFrm.ReportImage.Picture;

  rTotalCost := 0;
  rTotalSell := 0;

  iPage := 0;
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
begin
  if qryReportLines.fieldbyname('price_unit_factor').asfloat = 0 then
    rTotalPrice := qryReportLines.fieldbyname('unit_price').asfloat
  else
    rTotalPrice := (qryReportLines.fieldbyname('unit_price').asfloat*(qryReportLines.fieldbyname('quantity').asfloat/qryReportLines.fieldbyname('price_unit_factor').asfloat));

  gtlblTotalPrice.Caption  := formatfloat('##,###,##0.00',rTotalPrice);

  rTotalSell := rTotalSell + rTotalPrice;
end;

procedure TfrmPBRPQuote.qrbPageFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  gtlblTotalSales.caption := formatfloat('##,###,##0.00',rTotalSell);
  gtlblPriceUnit.caption := 'Price ' + qryReport.fieldbyname('Price_Unit_Description').asstring;
  if qryReport.FieldByName('Price_Unit_Factor').asinteger = 0 then
    begin
      gtlblUnitPrice.caption := formatfloat('##,###,##0.000',rTotalSell);
    end
  else
    begin
      gtlblUnitPrice.caption := formatfloat('##,###,##0.000',rTotalSell/(qryReport.fieldbyname('quantity').asinteger/qryReport.fieldbyname('Price_Unit_Factor').asinteger));
    end;
end;

procedure TfrmPBRPQuote.BuildNotes(aQuery: TQuery;
  const iNarrative : integer);
var
  aStr : string;
begin
(*  with aQuery do
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
    MemoNotes.Lines.Clear;
    MemoNotes.Lines.Text := aStr;
  end;
*)
end;

procedure TfrmPBRPQuote.qrgfQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  qrgfQuote.height := memoNotes.height + 13;
end;

procedure TfrmPBRPQuote.qrbSupplyLinesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotalPrice: real;
begin
  if qryReportSupply.fieldbyname('price_unit_factor').asfloat = 0 then
    rTotalPrice := qryReportSupply.fieldbyname('Quotation_price').asfloat
  else
    rTotalPrice := (qryReportSupply.fieldbyname('Quotation_price').asfloat*(qryReportSupply.fieldbyname('quantity').asfloat/qryReportSupply.fieldbyname('price_unit_factor').asfloat));

  gtlblSupplyPrice.Caption  := formatfloat('##,###,##0.00',rTotalPrice);

  rTotalSell := rTotalSell + rTotalPrice;

end;

procedure TfrmPBRPQuote.SetShowBreakdown(const Value: boolean);
begin
  FShowBreakdown := Value;
end;

end.
