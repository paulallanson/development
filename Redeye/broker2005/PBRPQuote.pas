unit PBRPQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, gtQrCtrls, gtQrExport, Printers,
  CCSPrint, qrprntr, CCSCommon;

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
    qrbPageFooter: TQRBand;
    qrgfQuote: TQRBand;
    GetNarrSQL: TQuery;
    qryReportSupply: TQuery;
    gtQRLabel2: TgtQRLabel;
    gtQRDBText7: TgtQRDBText;
    ReportImage: TgtQRImage;
    gtQRLabel8: TgtQRLabel;
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
    gtQRLabel22: TgtQRLabel;
    gtQRLabel23: TgtQRLabel;
    gtQRLabel24: TgtQRLabel;
    gtQRLabel25: TgtQRLabel;
    gtQRLabel26: TgtQRLabel;
    gtQRLabel27: TgtQRLabel;
    gtQRLabel28: TgtQRLabel;
    gtQRLabel29: TgtQRLabel;
    gtQRLabel30: TgtQRLabel;
    gtQRLabel12: TgtQRLabel;
    gtQRLabel31: TgtQRLabel;
    gtQRLabel32: TgtQRLabel;
    gtQRLabel33: TgtQRLabel;
    gtQRLabel34: TgtQRLabel;
    gtQRLabel35: TgtQRLabel;
    qryProspect: TQuery;
    oldqryReportSupply: TQuery;
    qryReportDepts: TQuery;
    qrbDeptDetail: TQRSubDetail;
    qrbLineDetail: TQRSubDetail;
    gtQRDBText3: TgtQRDBText;
    gtQRDBText4: TgtQRDBText;
    gtQRDBText1: TgtQRDBText;
    gtlblTotalPrice: TgtQRLabel;
    qrbSupplyHeader: TQRBand;
    gtQRLabel9: TgtQRLabel;
    qrbSupplyLines: TQRSubDetail;
    gtQRDBText6: TgtQRDBText;
    gtQRDBText9: TgtQRDBText;
    gtQRDBText10: TgtQRDBText;
    gtlblSupplyPrice: TgtQRLabel;
    qrbDeptFooter: TQRBand;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel11: TgtQRLabel;
    gtQRDBText12: TgtQRDBText;
    gtQRDBText13: TgtQRDBText;
    gtQRLabel36: TgtQRLabel;
    qryCosts: TQuery;
    gtlblReference: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    qryReportlinesQuote: TFloatField;
    qryReportlinesQuote_Line_no: TIntegerField;
    qryReportlinesQuote_Line_description: TStringField;
    qryReportlinesUnit_Cost: TCurrencyField;
    qryReportlinesUnit_Price: TCurrencyField;
    qryReportlinesPrice_Unit: TIntegerField;
    qryReportlinesQuantity: TFloatField;
    qryReportlinesProduct_Type: TIntegerField;
    qryReportlinesLine_Converted: TStringField;
    qryReportlinesSequence_No: TIntegerField;
    qryReportlinesUnit_SSP: TCurrencyField;
    qryReportlinesNo_of_hours: TFloatField;
    qryReportlinesUnit_Cost_plus_OHD: TCurrencyField;
    qryReportlinesUnit_SSP_Original: TCurrencyField;
    qryReportlinesWork_Centre_Group: TIntegerField;
    qryReportlinesWork_Centre: TIntegerField;
    qryReportlinesTeam_Count: TIntegerField;
    qryReportlinesProcess: TIntegerField;
    qryReportlinesCosting_Tool_Flag: TStringField;
    qryReportlinesCost_Number: TIntegerField;
    qryReportlinesCategory_Number: TIntegerField;
    qryReportlinesSub_Category: TIntegerField;
    qryReportlinesPrice_Unit_factor: TFloatField;
    qryReportlinesPrice_unit_Description: TStringField;
    qryReportlinesProduct_Type_Description: TStringField;
    qrbLineQHeader: TQRGroup;
    qrbDeptHeader: TQRGroup;
    gtQRDBText8: TgtQRDBText;
    qrbLineHeader: TQRGroup;
    gtQRDBText5: TgtQRDBText;
    qrbLineQFooter: TQRBand;
    gtQRLabel10: TgtQRLabel;
    gtlblTotalSales: TgtQRLabel;
    gtlblUnitPrice: TgtQRLabel;
    gtlblPriceUnit: TgtQRLabel;
    gtQRLabel37: TgtQRLabel;
    gtlblQuoteTotalSales: TgtQRLabel;
    qrbSupplyFooter: TQRBand;
    gtQRLabel38: TgtQRLabel;
    gtlblTotalSupplied: TgtQRLabel;
    qryReportSupplyQuote: TFloatField;
    qryReportSupplyQuote_Supply_No: TIntegerField;
    qryReportSupplyEnquiry: TIntegerField;
    qryReportSupplyLine: TIntegerField;
    qryReportSupplyLine_Converted: TStringField;
    qryReportSupplyQuantity: TFloatField;
    qryReportSupplyQuote_Supply_Description: TStringField;
    qryReportSupplyUnit_Cost: TCurrencyField;
    qryReportSupplyUnit_Price: TCurrencyField;
    qryReportSupplyPrice_Unit: TIntegerField;
    qryReportSupplyPrice_Unit_Factor: TFloatField;
    qryReportSupplyPrice_Unit_Description: TStringField;
    qryReportSupplyForm_Description: TStringField;
    SpecMemo: TgtQRMemo;
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
    procedure qrbLineQFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbSupplyHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbSupplyFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDeptDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    rTotalCost, rTotalSell, rTotalSupplied: real;
    ipage: integer;
    FShowBreakdown: boolean;
    procedure BuildNotes(aQuery : TQuery; const iNarrative : integer);
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

uses PBImages, pbMainMenu;

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
  qrpDetails.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  ReportImage.enabled := bPrintLogo;
  ReportImage.Picture := pbImagesFrm.ReportImage.Picture;

  rTotalCost := 0;
  rTotalSell := 0;

  iPage := 0;
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
      qrbSupplyFooter.Enabled := (recordcount > 0);
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
  gtlblReference.caption := '';
  if qryReportLines.fieldbyname('Cost_number').asinteger <> 0 then
    begin
      with qryCosts do
        begin
          close;
          parambyname('Customer').asinteger := qryReport.fieldbyname('Customer').asinteger;
          parambyname('Process').asinteger := qryReportLines.fieldbyname('Process').asinteger;
          parambyname('Cost_Number').asinteger := qryReportLines.fieldbyname('Cost_Number').asinteger;
          open;
          first;
          gtlblReference.caption := fieldbyname('Price_Reference').asstring;
        end;
    end;

  if qryReportLines.fieldbyname('price_unit_factor').asfloat = 0 then
    rTotalPrice := qryReportLines.fieldbyname('unit_price').asfloat
  else
    rTotalPrice := (qryReportLines.fieldbyname('unit_price').asfloat*(qryReportLines.fieldbyname('quantity').asfloat/qryReportLines.fieldbyname('price_unit_factor').asfloat));

  gtlblTotalPrice.Caption  := formatfloat('£##,###,##0.00',rTotalPrice);
  rTotalSell := rTotalSell + rTotalPrice;
end;

procedure TfrmPBRPQuote.qrbPageFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  gtlblQuoteTotalSales.caption := formatfloat('£##,###,##0.00',rTotalSell);
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
    rTotalPrice := qryReportSupply.fieldbyname('Unit_price').asfloat
  else
    rTotalPrice := (qryReportSupply.fieldbyname('Unit_price').asfloat*(qryReportSupply.fieldbyname('quantity').asfloat/qryReportSupply.fieldbyname('price_unit_factor').asfloat));

  gtlblSupplyPrice.Caption  := formatfloat('£##,###,##0.00',rTotalPrice);

  rTotalSell := rTotalSell + rTotalPrice;
  rTotalSupplied := rTotalSupplied + rTotalPrice;

end;

procedure TfrmPBRPQuote.qrbLineQFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  gtlblTotalSales.caption := formatfloat('£##,###,##0.00',rTotalSell);
  gtlblPriceUnit.caption := 'Price ' + qryReport.fieldbyname('Price_Unit_Description').asstring;
  if qryReport.FieldByName('Price_Unit_Factor').asinteger = 0 then
    begin
      gtlblUnitPrice.caption := formatfloat('£##,###,##0.000',rTotalSell);
    end
  else
    begin
      gtlblUnitPrice.caption := formatfloat('£##,###,##0.000',rTotalSell/(qryReport.fieldbyname('quantity').asinteger/qryReport.fieldbyname('Price_Unit_Factor').asinteger));
    end;

end;

procedure TfrmPBRPQuote.qrbSupplyHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  rTotalSupplied := 0;
end;

procedure TfrmPBRPQuote.qrbSupplyFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  gtlblTotalSupplied.caption := formatfloat('£##,###,##0.00',rTotalSupplied);
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

procedure TfrmPBRPQuote.SetShowBreakdown(const Value: boolean);
begin
  FShowBreakdown := Value;
end;

end.
