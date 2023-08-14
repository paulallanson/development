unit PBRPQuoteProduction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Qrctrls, QuickRpt, ExtCtrls, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPQuoteProductionFrm = class(TForm)
    qryReport: TFDQuery;
    qrReport: TQuickRep;
    qrbndGrpHdr: TQRGroup;
    qrbndGrpFtr: TQRBand;
    qrlblGroupHeader: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    qrlblRepTotalSSP: TQRLabel;
    qrlblRepTotalCost: TQRLabel;
    qrlblRepTotalASP: TQRLabel;
    qrbdataFooter: TQRDBText;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    qrlblGrandTotalSSP: TQRLabel;
    qrlblGrandTotalCost: TQRLabel;
    qrlblGrandTotalASP: TQRLabel;
    QRShape3: TQRShape;
    qryDummy: TFDQuery;
    QRShape1: TQRShape;
    qrbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    qrbReasons: TQRGroup;
    qrbndReasFtr: TQRBand;
    qrlblDBQuote: TQRDBText;
    qrlblTotalCost: TQRLabel;
    qrlblTotalSSP: TQRLabel;
    qrlblTotalASP: TQRLabel;
    QRShape4: TQRShape;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText9: TQRDBText;
    qrChildSummary: TQRChildBand;
    qrlblDBDate: TQRDBText;
    qrlblDBCustomer: TQRDBText;
    qrlblDBRep: TQRDBText;
    qrlblDBDescription: TQRDBText;
    QRDBText1: TQRDBText;
    qrlblCost: TQRLabel;
    qrlblSSP: TQRLabel;
    qrlblASP: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlblStatus: TQRLabel;
    qrshapeTotal: TQRShape;
    qrlblMarkup: TQRLabel;
    qrlblTotalMarkup: TQRLabel;
    qrlblRepTotalMarkup: TQRLabel;
    qrlblGrandTotalMarkup: TQRLabel;
    QRDBText5: TQRDBText;
    procedure qrReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbReasonsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndReasFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndReasFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    iInvoice: integer;
  public
    PrinterSettings: TPrinterSettings;
    Totalby: integer;
    ShowOnlyOut: boolean;
    bSummary: boolean;
    procedure ExportToFile(fileName: string);
    function PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, branch, rep: integer; CustomerName: string): integer;
  end;

var
  PBRPQuoteProductionFrm: TPBRPQuoteProductionFrm;

implementation

uses PBDatabase, CCSCommon, PBRSQuoteCust;

{$R *.DFM}

var
  repCost, repSSP, repASP: double;
  repTotalCost, repTotalSSP, repTotalASP: double;
  grandTotalCost, grandTotalSSP, grandTotalASP: double;

function TPBRPQuoteProductionFrm.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, branch, rep: integer; CustomerName: string): integer;
{ Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
  function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  self.qryReport.Active := false;

  qryReport.SQL.clear;
  qryReport.SQL.text := qryDummy.SQL.text;
  if tmpdateFrom <> 0 then
  begin
    self.qryReport.SQL.add('  AND Quote.Date_Point >= ' + qDate(tmpDateFrom));
  end;

  if tmpdateTo <> 0 then
  begin
    self.qryReport.SQL.Add('  AND Quote.Date_Point <= '+ qDate(tmpDateTo));
  end;

  if ShowOnlyOut then
    begin
      self.qryReport.SQL.Add(' AND (Quote.Inactive = ''N'') OR (Quote.Inactive = '''')');
      self.qryReport.SQL.Add(' AND (Quote.Quote_Status < 100) ');
    end;

  if (tmpdateFrom = 0) and (tmpdateTo = 0) then
  begin
    qrlblDateRange.caption := 'Unlimited Date Range';
  end
  else if (tmpdateFrom = 0) then
  begin
    qrlblDateRange.caption := 'Dated upto: ' + dateToStr(tmpdateTo);
  end
  else if (tmpdateTo = 0) then
  begin
    qrlblDateRange.caption := 'Dated from: ' + dateToStr(tmpdateFrom);
  end
  else
  begin
    qrlblDateRange.caption := 'Dated from: ' + dateToStr(tmpdateFrom) +
      ' up to: ' + dateToStr(tmpdateTo);
  end;

  if (CustomerName <> '') then
  begin
    if pos('%',trim(CustomerName)) > 0 then
      self.qryReport.SQL.Add(' AND Quote.Customer_Name like ''' + trim(CustomerName) + '''')
    else
      self.qryReport.SQL.Add(' AND ((Quote.customer = ' + IntToStr(Customer) + ')' +
        '  and (Quote.Branch_no = ' +IntToStr(branch) + '))');
  end;

  if rep <> 0 then
  begin
    self.qryReport.SQL.Add('  and (Quote.rep = ' + IntToStr(rep) + ')');
  end;

  if totalby = 0 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Rep.Name, Quote.Quote, Quote_Line.Quote_Line_No');
      qrbndgrphdr.expression := 'qryReport.rep_Name';
      QRDBText6.DataField := 'qryReport.rep_name';
      qrlblGroupHeader.Caption := 'Rep:';
    end
  else
  if totalby = 1 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Quote.Customer_Name, Quote.Quote, Quote_Line.Quote_Line_No');
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'qryReport.Customer_name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
    begin
      self.qryReport.SQL.Add(' ORDER BY Quote.Quote, Quote_Line.Quote_Line_No');
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 2);
  qrbndgrpftr.enabled := (totalby < 2);

  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);
end;

procedure TPBRPQuoteProductionFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with qrReport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    OutputBin := PrinterSettings.OutputBin;
  end;

  if totalby = 0 then
    begin
      qrbndgrphdr.expression := 'qryReport.rep_Name';
      QRDBText6.DataField := 'rep_name';
      QRbDataFooter.DataField := 'rep_name';
      qrlblGroupHeader.Caption := 'Rep:';
    end
  else
  if totalby = 1 then
    begin
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'Customer_name';
      QrbDataFooter.DataField := 'Customer_name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
    begin
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      QrbDataFooter.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  if bSummary then
    begin
      qrChildSummary.ParentBand := qrbndPageHeader;
      qrlblDBQuote.Enabled := true;
      qrlblDBDate.Enabled := true;
      qrlblDBDescription.Enabled := true;
      qrlblDBRep.Enabled := true;
      qrlblDBCustomer.Enabled := true;
      qrshapeTotal.Enabled := false;
    end
  else
    begin
      qrChildSummary.ParentBand := qrbndPageHeader;
      qrlblDBQuote.Enabled := false;
      qrlblDBDate.Enabled := false;
      qrlblDBDescription.Enabled := false;
      qrlblDBRep.Enabled := false;
      qrlblDBCustomer.Enabled := false;
      qrshapeTotal.Enabled := true;
    end;

  iInvoice := 0;

  repCost := 0.00;
  repSSP := 0.00;
  repASP := 0.00;

  repTotalCost := 0.00;
  repTotalSSP := 0.00;
  repTotalASP := 0.00;

  grandTotalCost := 0.00;
  grandTotalSSP := 0.00;
  grandTotalASP := 0.00;
end;

procedure TPBRPQuoteProductionFrm.qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rMarkup: real;
begin
  self.qrlblRepTotalCost.caption := FloatToStrF(repTotalCost, ffCurrency, 15, 2);
  self.qrlblRepTotalSSP.caption := FloatToStrF(repTotalSSP, ffCurrency, 15, 2);
  self.qrlblRepTotalASP.caption := FloatToStrF(repTotalASP, ffCurrency, 15, 2);

  if  (repTotalASP = 0) and
      (repTotalSSP = 0) then
    qrlblRepTotalMarkup.caption := '0.00%'
  else if (repTotalASP = 0) then
    qrlblRepTotalMarkup.caption := '-999.99%'
  else
    begin
      rMarkup := ((repTotalASP - repTotalSSP)/ repTotalASP) * 100;
      qrlblRepTotalMarkup.caption := formatfloat('0.00%',rMarkup);
    end;
end;

procedure TPBRPQuoteProductionFrm.qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  repTotalCost := 0.00;
  repTotalSSP := 0.00;
  repTotalASP := 0.00;
end;

procedure TPBRPQuoteProductionFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rMarkup: real;
begin
  self.qrlblGrandTotalCost.caption := FloatToStrF(grandTotalCost, ffCurrency, 15, 2);
  self.qrlblGrandTotalSSP.caption := FloatToStrF(grandTotalSSP, ffCurrency, 15, 2);
  self.qrlblGrandTotalASP.caption := FloatToStrF(grandTotalASP, ffCurrency, 15, 2);

  if  (grandTotalASP = 0) and
      (grandTotalSSP = 0) then
    qrlblGrandTotalMarkup.caption := '0.00%'
  else if (grandTotalASP = 0) then
    qrlblGrandTotalMarkup.caption := '-999.99%'
  else
    begin
      rMarkup := ((grandTotalASP - grandTotalSSP)/ grandTotalASP) * 100;
      qrlblGrandTotalMarkup.caption := formatfloat('0.00%',rMarkup);
    end;
end;

procedure TPBRPQuoteProductionFrm.qrbDetailsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rCost, rSSP, rASP, rMarkup: real;
begin
  self.qrlblCost.caption := FloatToStrF(0.00, ffCurrency, 15, 2);
  self.qrlblSSP.caption := FloatToStrF(0.00, ffCurrency, 15, 2);
  self.qrlblASP.caption := FloatToStrF(0.00, ffCurrency, 15, 2);

// Total Cost
  rCost := CalcTotalValue((qryReport.fieldbyname('Quantity').asinteger*-1),
                           qryReport.fieldbyname('Price_Unit_Factor').asinteger,
                           (qryReport.fieldbyname('Unit_Cost').asfloat*-1));
  repCost := repCost + rCost;
  qrlblCost.caption := FloatToStrF(rCost, ffCurrency, 15, 2);

// Total SSP
  rSSP := CalcTotalValue((qryReport.fieldbyname('Quantity').asinteger*-1),
                           qryReport.fieldbyname('Price_Unit_Factor').asinteger,
                           (qryReport.fieldbyname('Unit_SSP').asfloat*-1));

  repSSP := repSSP + rSSP;
  qrlblSSP.caption := FloatToStrF(rSSP, ffCurrency, 15, 2);

// Total ASP
  rASP := CalcTotalValue((qryReport.fieldbyname('Quantity').asinteger*-1),
                           qryReport.fieldbyname('Price_Unit_Factor').asinteger,
                           (qryReport.fieldbyname('Unit_Price').asfloat*-1));
  repASP := repASP + rASP;
  qrlblASP.caption := FloatToStrF(rASP, ffCurrency, 15, 2);

  if  (rASP = 0) and
      (rSSP = 0) then
    qrlblMarkup.caption := '0.00%'
  else if (rASP = 0) then
    qrlblMarkup.caption := '-999.99%'
  else
    begin
      rMarkup := ((rASP - rSSP)/ rASP) * 100;
      qrlblMarkup.caption := formatfloat('0.00%',rMarkup);
    end;

  PrintBand := not bSummary;
end;

procedure TPBRPQuoteProductionFrm.qrbReasonsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not bSummary;

  if (qryReport.fieldbyname('Inactive').asstring = 'Y') then
    qrlblStatus.caption := 'Quote Declined'
  else
    qrlblStatus.caption := qryReport.fieldbyname('Quote_status_Description').asstring;
end;

procedure TPBRPQuoteProductionFrm.qrbndReasFtrBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rMarkup: real;
begin
  self.qrlblTotalCost.caption := FloatToStrF(repCost, ffCurrency, 15, 2);
  self.qrlblTotalSSP.caption := FloatToStrF(repSSP, ffCurrency, 15, 2);
  self.qrlblTotalASP.caption := FloatToStrF(repASP, ffCurrency, 15, 2);

  if  (repASP = 0) and
      (repSSP = 0) then
    qrlblTotalMarkup.caption := '0.00%'
  else if (repASP = 0) then
    qrlblTotalMarkup.caption := '-999.99%'
  else
    begin
      rMarkup := ((repASP - repSSP)/ repASP) * 100;
      qrlblTotalMarkup.caption := formatfloat('0.00%',rMarkup);
    end;

  repTotalCost := repTotalCost + StrToFloatDef(formatfloat('0.00',repCost), 0, FormatSettings);
  repTotalSSP := repTotalSSP + StrToFloatDef(formatfloat('0.00',repSSP), 0, FormatSettings);
  repTotalASP := repTotalASP + StrToFloatDef(formatfloat('0.00',repASP), 0, FormatSettings);

  grandTotalCost := grandTotalCost + StrToFloatDef(formatfloat('0.00',repCost), 0, FormatSettings);
  grandTotalSSP := grandTotalSSP + StrToFloatDef(formatfloat('0.00',repSSP), 0, FormatSettings);
  grandTotalASP := grandTotalASP + StrToFloatDef(formatfloat('0.00',repASP), 0, FormatSettings);
end;

procedure TPBRPQuoteProductionFrm.qrbndReasFtrAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
begin
  repCost := 0.00;
  repSSP := 0.00;
  repASP := 0.00;

  tempstr := '';

  if exporting and bSummary then
    begin
      tempStr := '"' + qryReport.fieldbyname('Quote').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Point').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Description').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';
      tempStr := tempStr + ',"' + qrlblTotalCost.caption + '"';
      tempStr := tempStr + ',"' + qrlblTotalSSP.caption + '"';
      tempStr := tempStr + ',"' + qrlblTotalASP.caption + '"';
      tempStr := tempStr + ',"' + qrlblTotalMarkup.caption + '"';
      tempStr := tempStr + ',"' + qrlblStatus.caption + '"';

      writeln(self.exportFile, tempStr);
      PBRSQuoteCustFrm.prgbrExport.StepIt;
    end;
end;

procedure TPBRPQuoteProductionFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if bSummary then
    begin
      tempStr := '"Quote"'
        + ',"Date"'
        + ',"Job Title"'
        + ',"Rep"'
        + ',"Customer"'
        + ',"Total Cost"'
        + ',"Total SSP"'
        + ',"Total ASP"'
        + ',"Markup"'
        + ',"Status"';
    end
  else
    begin
      tempStr := '"Quote"'
        + ',"Date"'
        + ',"Job Title"'
        + ',"Line"'
        + ',"Product Type"'
        + ',"Description"'
        + ',"Rep"'
        + ',"Customer"'
        + ',"Cost"'
        + ',"SSP"'
        + ',"ASP"'
        + ',"Markup"'
        + ',"Status"';
    end;

  writeLn(self.exportFile, tempStr);

  qrReport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPQuoteProductionFrm.qrbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
begin
  tempstr := '';

  if exporting and not bSummary then
    begin
      tempStr := '"' + qryReport.fieldbyname('Quote').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Point').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Description').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Quote_line_no').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Product_Type_Description').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Quote_Line_Description').asstring + '"';
      tempStr := tempStr + ',"' + qrlblCost.caption + '"';
      tempStr := tempStr + ',"' + qrlblSSP.caption + '"';
      tempStr := tempStr + ',"' + qrlblASP.caption + '"';
      tempStr := tempStr + ',"' + qrlblMarkup.caption + '"';
      tempStr := tempStr + ',"' + qrlblStatus.caption + '"';

      writeln(self.exportFile, tempStr);
      PBRSQuoteCustFrm.prgbrExport.StepIt;
    end;
end;

end.
