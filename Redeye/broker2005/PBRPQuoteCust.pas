unit PBRPQuoteCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, CCSPrint;

type
  TPBRPQuoteCustFrm = class(TForm)
    qryReport: TQuery;
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
    OldqryDummy: TQuery;
    QRShape1: TQRShape;
    qrbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    qrbndReasFtr: TQRBand;
    QRDBText7: TQRDBText;
    qrlblTotalFull: TQRLabel;
    qrlblTotalPart: TQRLabel;
    qrlblTotalVAT: TQRLabel;
    qrlblTotal: TQRLabel;
    QRShape4: TQRShape;
    QRDBText1: TQRDBText;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrChildSummary: TQRChildBand;
    qrChildDetail: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    qrlblMarginPerc: TQRLabel;
    qrlblRepMarginPerc: TQRLabel;
    qrlblGrandTotalMarginPerc: TQRLabel;
    qrlblStatus: TQRLabel;
    QRLabel19: TQRLabel;
    qrlblVers: TQRLabel;
    qryDummy: TQuery;
    QRLabel22: TQRLabel;
    QRDBText9: TQRDBText;
    procedure qrReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbReasonsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndReasFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
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
  PBRPQuoteCustFrm: TPBRPQuoteCustFrm;

implementation

uses PBDatabase, CCSCommon, PBRSQuoteCust;

{$R *.DFM}

var
  repCost, repSSP, repASP: double;
  repTotalCost, repTotalSSP, repTotalASP: double;
  grandTotalCost, grandTotalSSP, grandTotalASP: double;

function TPBRPQuoteCustFrm.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, branch, rep: integer; CustomerName: string): integer;
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
    self.qryReport.SQL.add('  AND Quote.date_point >= ' + qDate(tmpDateFrom));
  end;

  if tmpdateTo <> 0 then
  begin
    self.qryReport.SQL.Add('  AND Quote.date_point <= '+ qDate(tmpDateTo));
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
      self.qryReport.SQL.Add(' ORDER BY Rep.Name, Quote.Quote');
      qrbndgrphdr.expression := 'qryReport.rep_Name';
      QRDBText6.DataField := 'qryReport.rep_name';
      qrlblGroupHeader.Caption := 'Rep:';
    end
  else
  if totalby = 1 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Quote.Customer_Name, Quote.Quote');
      qrbndgrphdr.expression := 'qryReport.Customer_Name_new';
      QRDBText6.DataField := 'qryReport.Customer_name_new';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
    begin
      self.qryReport.SQL.Add(' ORDER BY Quote.Quote');
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 2);
  qrbndgrpftr.enabled := (totalby < 2);

  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);
end;

procedure TPBRPQuoteCustFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
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
      qrbndgrphdr.expression := 'qryReport.Customer_Name_new';
      QRDBText6.DataField := 'Customer_name_new';
      QrbDataFooter.DataField := 'Customer_name_new';
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
      qrChildSummary.ParentBand := qrbndPageHeader;
      qrChildDetail.ParentBand := nil;
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
  grandTotalASp := 0.00;
end;

procedure TPBRPQuoteCustFrm.qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  margPerc: double;
begin
  if  (repTotalASP = 0) and
      (repTotalSSP = 0) then
    qrlblRepMarginPerc.caption := '0.00%'
  else if (repTotalASP = 0) then
    qrlblMarginPerc.caption := '-999.99%'
  else
    begin
      margPerc := ((repTotalASP - repTotalSSP)/
                  repTotalASP) * 100;
      qrlblRepMarginPerc.caption := formatfloat('0.00%',margPerc);
    end;
    
  self.qrlblRepTotalCost.caption := FloatToStrF(repTotalCost, ffCurrency, 15, 2);
  self.qrlblRepTotalSSP.caption := FloatToStrF(repTotalSSP, ffCurrency, 15, 2);
  self.qrlblRepTotalASP.caption := FloatToStrF(repTotalASP, ffCurrency, 15, 2);
end;

procedure TPBRPQuoteCustFrm.qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  repTotalCost := 0.00;
  repTotalSSP := 0.00;
  repTotalASP := 0.00;
end;

procedure TPBRPQuoteCustFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  margPerc: double;
begin
  if  (grandTotalSSP = 0) and
      (grandTotalASP = 0) then
    qrlblGrandTotalMarginPerc.caption := '0.00%'
  else if (grandTotalASP = 0) then
    qrlblGrandTotalMarginPerc.caption := '-999.99%'
  else
    begin
      margPerc := ((grandTotalASP - grandTotalSSP)/
                  grandTotalASP) * 100;
      qrlblGrandTotalMarginPerc.caption := formatfloat('0.00%',margPerc);
    end;

  self.qrlblGrandTotalCost.caption := FloatToStrF(grandTotalCost, ffCurrency, 15, 2);
  self.qrlblGrandTotalSSP.caption := FloatToStrF(grandTotalSSP, ffCurrency, 15, 2);
  self.qrlblGrandTotalASP.caption := FloatToStrF(grandTotalASP, ffCurrency, 15, 2);
end;

procedure TPBRPQuoteCustFrm.qrbReasonsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not bSummary;
end;

procedure TPBRPQuoteCustFrm.qrbndReasFtrAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
begin

  tempstr := '';

  if exporting then
    begin
      if totalby < 2 then
        begin
          tempStr := '"' + qryReport.fieldbyname('Rep_Name').asstring + '"';
          tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name_new').asstring + '"';
          tempStr := tempStr + ',"' + qryReport.fieldbyname('Credit_Note_Reason_Descr').asstring + '"';
          tempStr := tempStr + ',"' + qrlblTotalFull.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalPart.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalVAT.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotal.caption + '"';
        end
      else
        begin
          tempStr := '"' + qryReport.fieldbyname('Credit_Note_Reason_Descr').asstring + '"';
          tempStr := tempStr + ',"' + qrlblTotalFull.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalPart.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotalVAT.caption + '"';
          tempStr := tempStr + ',"' + qrlblTotal.caption + '"';
        end;
      writeln(self.exportFile, tempStr);
      PBRSQuoteCustFrm.prgbrExport.StepIt;
    end;
end;

procedure TPBRPQuoteCustFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Quote"'
        + ',"Date"'
        + ',"Required"'
        + ',"Rep"'
        + ',"Customer"'
        + ',"Description"'
        + ',"Total Cost"'
        + ',"Total SSP"'
        + ',"Total ASP"'
        + ',"Status"'
        + ',"Versions"';

  writeLn(self.exportFile, tempStr);

  qrReport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPQuoteCustFrm.qrbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  margPerc: double;
begin
  if (qryReport.fieldbyname('Inactive').asstring = 'Y') then
    qrlblStatus.caption := 'Quote Declined'
  else
    qrlblStatus.caption := qryReport.fieldbyname('Quote_status_Description').asstring;

  if  (qryReport.fieldbyname('Total_Sales_Value').asfloat = 0) and
      (qryReport.fieldbyname('Total_Suggested_Value').asfloat = 0) then
    qrlblMarginPerc.caption := '0.00%'
  else if (qryReport.fieldbyname('Total_Sales_Value').asfloat = 0) then
    qrlblMarginPerc.caption := '-999.99%'
  else
    begin
      margPerc := ((qryReport.fieldbyname('Total_Sales_Value').asfloat - qryReport.fieldbyname('Total_Suggested_Value').asfloat)/
                  qryReport.fieldbyname('Total_Sales_Value').asfloat) * 100;
      qrlblMarginPerc.caption := formatfloat('0.00%',margPerc);
    end;

  if (qryReport.fieldbyname('Version_Count').asinteger > 0) then
    qrlblVers.caption := qryReport.fieldbyname('Version_Count').asstring
  else
    qrlblVers.caption := '';

  repTotalCost := repTotalCost + qryReport.fieldbyname('Total_Cost_Value').asfloat;
  repTotalSSP := repTotalSSP + qryReport.fieldbyname('Total_Suggested_Value').asfloat;
  repTotalASP := repTotalASP + qryReport.fieldbyname('Total_Sales_Value').asfloat;

  grandTotalCost := grandTotalCost + qryReport.fieldbyname('Total_Cost_Value').asfloat;
  grandTotalSSP := grandTotalSSP + qryReport.fieldbyname('Total_Suggested_Value').asfloat;
  grandTotalASP := grandTotalASP + qryReport.fieldbyname('Total_Sales_Value').asfloat;
end;

procedure TPBRPQuoteCustFrm.qrbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if exporting then
    begin
      tempStr := '"' + qryReport.fieldbyname('Quote').asstring + '"';
      tempStr := tempStr + ',"' + PBDateStr(qryReport.fieldbyname('Date_Point').asdatetime) + '"';
      tempStr := tempStr + ',"' + PBDateStr(qryReport.fieldbyname('Date_Required').asdatetime) + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name_New').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Description').asstring + '"';
      tempStr := tempStr + ',"' + formatfloat('0.00',qryReport.fieldbyname('Total_Cost_Value').asfloat) + '"';
      tempStr := tempStr + ',"' + formatfloat('0.00',qryReport.fieldbyname('Total_Suggested_Value').asfloat) + '"';
      tempStr := tempStr + ',"' + formatfloat('0.00',qryReport.fieldbyname('Total_Sales_Value').asfloat) + '"';
      tempStr := tempStr + ',"' + qrlblStatus.caption + '"';
      tempStr := tempStr + ',"' + qrlblVers.caption + '"';
      writeln(self.exportFile, tempStr);
    end;
end;

end.
