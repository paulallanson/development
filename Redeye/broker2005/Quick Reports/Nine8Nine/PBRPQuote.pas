unit PBRPQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, QuickRpt, QRCtrls, QrExport, Printers,
  CCSPrint, qrprntr, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBRPQuote = class(TForm)
    qryReport: TFDQuery;
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblQuoteCaption: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    qrgQuote: TQRGroup;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryContact: TFDQuery;
    gtQRLabel1: TQRLabel;
    gtQRDBText2: TQRDBText;
    qryReportlines: TFDQuery;
    dtsReport: TDataSource;
    qrygetNotes: TFDQuery;
    qrmAddress: TQRMemo;
    QRLabel4: TQRLabel;
    qrlblContactName: TQRLabel;
    QRDBText3: TQRDBText;
    qrbPageFooter: TQRBand;
    qrgfQuote: TQRBand;
    GetNarrSQL: TFDQuery;
    qryReportSupply: TFDQuery;
    gtQRLabel2: TQRLabel;
    gtQRDBText7: TQRDBText;
    ReportImage: TQRImage;
    gtQRLabel8: TQRLabel;
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
    qryProspect: TFDQuery;
    oldqryReportSupply: TFDQuery;
    qryReportDepts: TFDQuery;
    qrbDeptDetail: TQRSubDetail;
    qrbLineDetail: TQRSubDetail;
    gtQRDBText3: TQRDBText;
    gtQRDBText4: TQRDBText;
    gtQRDBText1: TQRDBText;
    gtlblTotalPrice: TQRLabel;
    qrbSupplyHeader: TQRBand;
    gtQRLabel9: TQRLabel;
    qrbSupplyLines: TQRSubDetail;
    gtQRDBText6: TQRDBText;
    gtQRDBText9: TQRDBText;
    gtQRDBText10: TQRDBText;
    gtlblSupplyPrice: TQRLabel;
    qrbDeptFooter: TQRBand;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel11: TQRLabel;
    gtQRDBText12: TQRDBText;
    gtQRDBText13: TQRDBText;
    gtQRLabel36: TQRLabel;
    qryCosts: TFDQuery;
    gtlblReference: TQRLabel;
    gtQRLabel5: TQRLabel;
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
    gtQRDBText8: TQRDBText;
    qrbLineHeader: TQRGroup;
    gtQRDBText5: TQRDBText;
    qrbLineQFooter: TQRBand;
    gtQRLabel10: TQRLabel;
    gtlblTotalSales: TQRLabel;
    gtlblUnitPrice: TQRLabel;
    gtlblPriceUnit: TQRLabel;
    gtQRLabel37: TQRLabel;
    gtlblQuoteTotalSales: TQRLabel;
    qrbSupplyFooter: TQRBand;
    gtQRLabel38: TQRLabel;
    gtlblTotalSupplied: TQRLabel;
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
    SpecMemo: TQRMemo;
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
    FEndUserVersion: Boolean;
    procedure BuildNotes(aQuery : TFDQuery; const iNarrative : integer);
    procedure SetShowBreakdown(const Value: boolean);
    procedure SetEndUserVersion(const Value: Boolean);
    { Private declarations }
  public
    ForceNewPage: boolean;
    Key: real;
    bPrintLogo: boolean;
    bPreview: boolean;
    PrinterSettings: TPrinterSettings;
    function Getdetails: integer;
    property ShowBreakdown: boolean read FShowBreakdown write SetShowBreakdown;
    { EndUserVersion added by GDK }
    property EndUserVersion: Boolean read FEndUserVersion write SetEndUserVersion;
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

procedure TfrmPBRPQuote.BuildNotes(aQuery: TFDQuery;
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

procedure TfrmPBRPQuote.SetEndUserVersion(const Value: Boolean);
begin
  FEndUserVersion := Value;
end;

procedure TfrmPBRPQuote.SetShowBreakdown(const Value: boolean);
begin
  FShowBreakdown := Value;
end;

end.

