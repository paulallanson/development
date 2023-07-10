unit PBRPNCAReason;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, CCSPrint;

type
  TPBRPNCAReasonFrm = class(TForm)
    qryReport: TQuery;
    qrReport: TQuickRep;
    qrbndGrpHdr: TQRGroup;
    qrbndGrpFtr: TQRBand;
    qrlblGroupHeader: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel20: TQRLabel;
    qrbdataFooter: TQRDBText;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    qrbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRShape4: TQRShape;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qryDummy: TQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    qrlblJobBag: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    qrlblRepTotalCost: TQRLabel;
    qrlblRepTotalClient: TQRLabel;
    qrlblGrandTotalCost: TQRLabel;
    qrlblGrandTotalClient: TQRLabel;
    qryDummyOld: TQuery;
    qrlblOrder: TQRLabel;
    qrlblCategories: TQRLabel;
    procedure qrReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbReasonsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
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
    function PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; Dept, reason, category: integer): integer;
  end;

var
  PBRPNCAReasonFrm: TPBRPNCAReasonFrm;

implementation

uses PBDatabase, CCSCommon, PBRSQuoteCust;

{$R *.DFM}

var
  repCost: double;
  repTotalCost, repTotalClient: double;
  grandTotalCost, grandTotalClient: double;

function TPBRPNCAReasonFrm.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; Dept, reason, category: integer): integer;
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
    self.qryReport.SQL.add('  AND Job_Bag_Non_Conform.date_point >= ' + qDate(tmpDateFrom));
  end;

  if tmpdateTo <> 0 then
  begin
    self.qryReport.SQL.Add('  AND Job_Bag_Non_Conform.date_point <= '+ qDate(tmpDateTo));
  end;

  if ShowOnlyOut then
    begin
      self.qryReport.SQL.Add(' AND (Job_Bag_Non_Conform.Inactive = ''N'') OR (Job_Bag_Non_Conform.Inactive = '''')');
      self.qryReport.SQL.Add(' AND (Job_Bag_Non_Conform.Non_Conform.Status < 100) ');
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

  if (Dept <> 0) then
  begin
    self.qryReport.SQL.Add('  and (Job_Bag_Non_Conform.Non_Conform_Dept = ' + IntToStr(Dept) + ')');
  end;

  if reason <> 0 then
  begin
      self.qryReport.SQL.Add('  and (Job_Bag_Non_Conform.Non_Conform_Type = ' + IntToStr(reason) + ')');
  end;

  if category <> 0 then
  begin
    self.qryReport.SQL.Add('  and (Job_Bag_Non_Conform.Non_Conform_Category = ' + IntToStr(category) + ')');
  end;

  if totalby = 0 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Non_Conform_Category.Non_Conform_Category_Descr, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryReport.Non_Conform_Category_Descr';
      QRDBText6.DataField := 'Non_Conform_Category_Descr';
      QRbDataFooter.DataField := 'Non_Conform_Category_Descr';
      qrlblGroupHeader.Caption := 'Category:';
    end
  else
  if totalby = 1 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Non_Conform_Type.Non_Conform_Type_Descr, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryReport.Non_Conform_Type_Descr';
      QRDBText6.DataField := 'Non_Conform_Type_Descr';
      QRbDataFooter.DataField := 'Non_Conform_Type_Descr';
      qrlblGroupHeader.Caption := 'Reason:';
    end
  else
  if totalby = 2 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Non_Conform_Dept.Non_Conform_Dept_Descr, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryReport.Non_Conform_Dept_Descr';
      QRDBText6.DataField := 'Non_Conform_Dept_Descr';
      QRbDataFooter.DataField := 'Non_Conform_Dept_Descr';
      qrlblGroupHeader.caption:= 'Source Dept:';
    end
  else
  if totalby = 3 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Raised_by_Dept.Non_Conform_Dept_Descr, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryReport.Raised_by_dept_Descr';
      QRDBText6.DataField := 'Raised_by_dept_Descr';
      QRbDataFooter.DataField := 'Raised_by_dept_Descr';
      qrlblGroupHeader.caption:= 'Raising Dept:';
    end
  else
  if totalby = 4 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Account_Manager, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryReport.Account_Manager';
      QRDBText6.DataField := 'Account_Manager';
      QRbDataFooter.DataField := 'Account_Manager';
      qrlblGroupHeader.caption:= 'Acc Manager:';
    end
  else
  if totalby = 5 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Rep_Name, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryReport.Rep_Name';
      QRDBText6.DataField := 'Rep_Name';
      QRbDataFooter.DataField := 'Rep_Name';
      qrlblGroupHeader.caption:= 'Rep:';
    end
  else
  if totalby = 6 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Customer_Name, Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'Customer_Name';
      QRbDataFooter.DataField := 'Customer_Name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
    begin
      self.qryReport.SQL.Add(' ORDER BY Job_Bag_Non_Conform.Job_Bag_Non_Conform');
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      QRbDataFooter.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 7);
  qrbndgrpftr.enabled := (totalby < 7);

  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);
end;

procedure TPBRPNCAReasonFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
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

  iInvoice := 0;

  repCost := 0.00;

  repTotalCost := 0.00;
  repTotalClient := 0.00;

  grandTotalCost := 0.00;
  grandTotalClient := 0.00;
end;

procedure TPBRPNCAReasonFrm.qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  repTotalCost := 0.00;
  repTotalClient := 0.00;
end;

procedure TPBRPNCAReasonFrm.qrbReasonsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not bSummary;
end;

procedure TPBRPNCAReasonFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"NCA No"'
        + ',"Date"'
        + ',"Reason"'
        + ',"Raising Dept"'
        + ',"Source Dept"'
        + ',"Job Bag"'
        + ',"Customer"'
        + ',"Job Title"'
        + ',"Rep"'
        + ',"Account Mgr"'
        + ',"Cost to Us"'
        + ',"Cost to Client"'
        + ',"Status"';

  writeLn(self.exportFile, tempStr);

  qrReport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPNCAReasonFrm.qrbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qryReport.fieldbyname('Job_Bag').asinteger <> 0 then
    qrlblOrder.caption := qryReport.fieldbyname('Job_Bag').asstring
  else
    qrlblOrder.caption := qryReport.fieldbyname('Purchase_order').asstring;

  repTotalCost := repTotalCost + qryReport.fieldbyname('Total_Cost').asfloat;
  repTotalClient := repTotalClient + qryReport.fieldbyname('Total_Cost_to_Client').asfloat;

  grandTotalCost := grandTotalCost + qryReport.fieldbyname('Total_Cost').asfloat;
  grandTotalClient := grandTotalClient + qryReport.fieldbyname('Total_Cost_to_Client').asfloat;
end;

procedure TPBRPNCAReasonFrm.qrbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if exporting then
    begin
      tempStr := '"' + qryReport.fieldbyname('Job_Bag_Non_Conform').asstring + '"';
      tempStr := tempStr + ',"' + PBDateStr(qryReport.fieldbyname('Date_Point').asdatetime) + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Non_Conform_Type_Descr').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Raised_By_Dept_Descr').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Non_Conform_Dept_Descr').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Descr').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Manager').asstring  + '"';
      tempStr := tempStr + ',"' + formatfloat('0.00',qryReport.fieldbyname('Total_Cost').asfloat) + '"';
      tempStr := tempStr + ',"' + formatfloat('0.00',qryReport.fieldbyname('Total_Cost_to_Client').asfloat) + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Non_Conform_Status_Descr').asstring + '"';
      writeln(self.exportFile, tempStr);
    end;
end;

procedure TPBRPNCAReasonFrm.qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.qrlblRepTotalCost.caption := FloatToStrF(repTotalCost, ffCurrency, 15, 2);
  self.qrlblRepTotalClient.caption := FloatToStrF(repTotalClient, ffCurrency, 15, 2);
end;

procedure TPBRPNCAReasonFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.qrlblGrandTotalCost.caption := FloatToStrF(grandTotalCost, ffCurrency, 15, 2);
  self.qrlblGrandTotalClient.caption := FloatToStrF(grandTotalClient, ffCurrency, 15, 2);
end;

end.
