unit PBRPQuoteReason;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, CCSPrint;

type
  TPBRPQuoteReasonFrm = class(TForm)
    qryReport: TQuery;
    qrReport: TQuickRep;
    qrbndGrpHdr: TQRGroup;
    qrbndGrpFtr: TQRBand;
    qrlblGroupHeader: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    qrlblRepTotalCount: TQRLabel;
    qrbdataFooter: TQRDBText;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    qrlblGrandTotalSSP: TQRLabel;
    qrlblGrandTotalCost: TQRLabel;
    qrlblGrandTotalASP: TQRLabel;
    QRShape3: TQRShape;
    qryDummy: TQuery;
    qrlblGrandTotalCount: TQRLabel;
    QRShape1: TQRShape;
    qrbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    qrbReasons: TQRGroup;
    qrbndReasFtr: TQRBand;
    QRDBText7: TQRDBText;
    qrlblTotalCount: TQRLabel;
    QRShape4: TQRShape;
    QRDBText1: TQRDBText;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText9: TQRDBText;
    qrChildSummary: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrChildDetail: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    qrlblRepTotalCost: TQRLabel;
    qrlblRepTotalSSP: TQRLabel;
    qrlblRepTotalASP: TQRLabel;
    qrlblRepTotalMarkup: TQRLabel;
    qrlblTotalCost: TQRLabel;
    qrlblTotalSSP: TQRLabel;
    qrlblTotalASP: TQRLabel;
    qrlblTotalMarkup: TQRLabel;
    qrlblGrandTotalMarkup: TQRLabel;
    qrlblMarkup: TQRLabel;
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
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    iInvoice: integer;
  public
    PrinterSettings: TPrinterSettings;
    Totalby: integer;
    bSummary: boolean;
    procedure ExportToFile(fileName: string);
    function PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, branch, rep: integer; CustomerName: string): integer;
  end;

var
  PBRPQuoteReasonFrm: TPBRPQuoteReasonFrm;

implementation

uses PBDatabase, CCSCommon, PBRSQuoteReason;

{$R *.DFM}

var
  repCost, repSSP, repASP: double;
  repTotalCost, repTotalSSP, repTotalASP: double;
  grandTotalCost, grandTotalSSP, grandTotalASP: double;
  repCount, repTotalCount, grandTotalCount: integer;

function TPBRPQuoteReasonFrm.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, branch, rep: integer; CustomerName: string): integer;
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
      self.qryReport.SQL.Add(' ORDER BY Rep.Name, Quote_Reason_Description, Quote.Quote');
      qrbndgrphdr.expression := 'qryReport.rep_Name';
      QRDBText6.DataField := 'qryReport.rep_name';
      qrlblGroupHeader.Caption := 'Rep:';
    end
  else
  if totalby = 1 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Quote.Customer_Name, Quote_Reason_Description, Quote.Quote');
      qrbndgrphdr.expression := 'qryReport.Customer_Name_New';
      QRDBText6.DataField := 'qryReport.Customer_Name_New';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
    begin
      self.qryReport.SQL.Add(' ORDER BY Quote_Reason_Description, Quote.Quote');
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 2);
  qrbndgrpftr.enabled := (totalby < 2);

  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);
end;

procedure TPBRPQuoteReasonFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
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
      qrbndgrphdr.expression := 'qryReport.Customer_Name_New';
      QRDBText6.DataField := 'Customer_name_New';
      QrbDataFooter.DataField := 'Customer_name_New';
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
      qrChildDetail.ParentBand := nil;
    end
  else
    begin
      qrChildSummary.ParentBand := nil;
      qrChildDetail.ParentBand := qrbndPageHeader;
    end;

  iInvoice := 0;

  repCost := 0.00;
  repSSP := 0.00;
  repASP := 0.00;
  repCount := 0;

  repTotalCost := 0.00;
  repTotalSSP := 0.00;
  repTotalASP := 0.00;
  repTotalCount := 0;

  grandTotalCost := 0.00;
  grandTotalSSP := 0.00;
  grandTotalASP := 0.00;
  grandTotalCount := 0;
end;

procedure TPBRPQuoteReasonFrm.qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  margPerc: real;
begin
  self.qrlblRepTotalCost.caption := FloatToStrF(repTotalCost, ffCurrency, 15, 2);
  self.qrlblRepTotalSSP.caption := FloatToStrF(repTotalSSP, ffCurrency, 15, 2);
  self.qrlblRepTotalASP.caption := FloatToStrF(repTotalASP, ffCurrency, 15, 2);
  self.qrlblRepTotalCount.caption := inttostr(repTotalCount);

  if  (repTotalASP = 0) and (repTotalSSP = 0) then
    qrlblTotalMarkup.caption := '0.00%'
  else if (repTotalASP = 0) then
    qrlblTotalMarkup.caption := '-999.99%'
  else
    begin
      margPerc := ((repTotalASP - repTotalSSP)/repTotalASP) * 100;
      qrlblRepTotalMarkup.caption := formatfloat('0.00%',margPerc);
    end;
end;

procedure TPBRPQuoteReasonFrm.qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  repTotalCost := 0.00;
  repTotalSSP := 0.00;
  repTotalASP := 0.00;
  repTotalCount := 0;
end;

procedure TPBRPQuoteReasonFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  margPerc: real;
begin
  self.qrlblGrandTotalCost.caption := FloatToStrF(grandTotalCost, ffCurrency, 15, 2);
  self.qrlblGrandTotalSSP.caption := FloatToStrF(grandTotalSSP, ffCurrency, 15, 2);
  self.qrlblGrandTotalASP.caption := FloatToStrF(grandTotalASP, ffCurrency, 15, 2);
  self.qrlblGrandTotalCount.caption := inttostr(grandTotalCount);

  if  (grandTotalASP = 0) and (grandTotalSSP = 0) then
    qrlblTotalMarkup.caption := '0.00%'
  else if (grandTotalASP = 0) then
    qrlblTotalMarkup.caption := '-999.99%'
  else
    begin
      margPerc := ((grandTotalASP - grandTotalSSP)/grandTotalASP) * 100;
      qrlblGrandTotalMarkup.caption := formatfloat('0.00%',margPerc);
    end;
end;

procedure TPBRPQuoteReasonFrm.qrbDetailsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  margPerc: real;
begin
  inc(repCount);
  repCost := repCost + qryReport.fieldbyname('Total_Cost_Value').AsFloat;
  repSSP := repSSP + qryReport.fieldbyname('Total_Suggested_Value').AsFloat;
  repASP := repASP + qryReport.fieldbyname('Total_Sales_Value').AsFloat;

  if  (qryReport.fieldbyname('Total_Sales_Value').asfloat = 0) and
      (qryReport.fieldbyname('Total_Suggested_Value').asfloat = 0) then
    qrlblMarkup.caption := '0.00%'
  else if (qryReport.fieldbyname('Total_Sales_Value').asfloat = 0) then
    qrlblMarkup.caption := '-999.99%'
  else
    begin
      margPerc := ((qryReport.fieldbyname('Total_Sales_Value').asfloat - qryReport.fieldbyname('Total_Suggested_Value').asfloat)/
                  qryReport.fieldbyname('Total_Sales_Value').asfloat) * 100;
      qrlblMarkup.caption := formatfloat('0.00%',margPerc);
    end;

  PrintBand := not bSummary;
end;

procedure TPBRPQuoteReasonFrm.qrbReasonsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not bSummary;
end;

procedure TPBRPQuoteReasonFrm.qrbndReasFtrBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  MargPerc: real;
begin
  self.qrlblTotalCost.caption := FloatToStrF(repCost, ffCurrency, 15, 2);
  self.qrlblTotalSSP.caption := FloatToStrF(repSSP, ffCurrency, 15, 2);
  self.qrlblTotalASP.caption := FloatToStrF(repASP, ffCurrency, 15, 2);
  self.qrlblTotalCount.caption := inttostr(repCount);

  if  (repASP = 0) and (repSSP = 0) then
    qrlblTotalMarkup.caption := '0.00%'
  else if (repASP = 0) then
    qrlblTotalMarkup.caption := '-999.99%'
  else
    begin
      margPerc := ((repASP - repSSP)/repASP) * 100;
      qrlblTotalMarkup.caption := formatfloat('0.00%',margPerc);
    end;

  repTotalCost := repTotalCost + repCost;
  repTotalSSP := repTotalSSP + repSSP;
  repTotalASP := repTotalASP + repASP;
  repTotalCount := repTotalCount + repCount;

  grandTotalCost := grandTotalCost + repCost;
  grandTotalSSP := grandTotalSSP + repSSP;
  grandTotalASP := grandTotalASP + repASP;
  grandTotalCount := grandTotalCount + repCount;
end;

procedure TPBRPQuoteReasonFrm.qrbndReasFtrAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
begin
  repCost := 0.00;
  repSSP := 0.00;
  repASP := 0.00;
  repCount := 0;

  tempstr := '';

  if exporting then
    begin
      if totalby < 2 then
        begin
          tempStr := '"' + qryReport.fieldbyname('Rep_Name').asstring + '"';
          tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name_New').asstring + '"';
          tempStr := tempStr + ',"' + qryReport.fieldbyname('Quote_Reason_Description').asstring + '"';
          tempStr := tempStr + ',"' + qrlblTotalCost.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalSSP.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalASP.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalMarkup.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalCount.caption + '"';
        end
      else
        begin
          tempStr := '"' + qryReport.fieldbyname('Quote_Reason_Description').asstring + '"';
          tempStr := tempStr + ',"' + qrlblTotalCost.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalSSP.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalASP.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalMarkup.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalCount.caption + '"';
        end;
      writeln(self.exportFile, tempStr);
      PBRSQuoteReasonFrm.prgbrExport.StepIt;
    end;
end;

procedure TPBRPQuoteReasonFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if totalby < 2 then
    begin
      tempStr := '"Rep"'
        + ',"Customer"'
        + ',"Reason"'
        + ',"Total Cost"'
        + ',"Total SSP"'
        + ',"Total ASP"'
        + ',"Markup %"'
        + ',"Count"';
    end
  else
    begin
      tempStr := '"Reason"'
        + ',"Total Cost"'
        + ',"Total SSP"'
        + ',"Total ASP"'
        + ',"Markup %"'
        + ',"Count"';
    end;

  writeLn(self.exportFile, tempStr);

  qrReport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPQuoteReasonFrm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if exporting then
    begin
      tempstr := '';
      writeln(self.exportFile, tempStr);
      if totalby < 2 then
        begin
          tempStr := '"' + 'Report Totals' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + '' + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalCost.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalSSP.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalASP.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalMarkup.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalCount.caption + '"';
        end
      else
        begin
          tempStr := '"' + 'Report Totals' + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalCost.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalSSP.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalASP.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalMarkup.caption + '"';
          tempStr := tempStr + ',"' + qrlblGrandTotalCount.caption + '"';
        end;

      writeln(self.exportFile, tempStr);
    end;

end;

end.
