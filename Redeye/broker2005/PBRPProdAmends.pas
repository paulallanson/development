unit PBRPProdAmends;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, CCSPrint, DB, DBTables;

type
  TPBRPProdAmendsFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qryReport: TQuery;
    qryDummy: TQuery;
    qrbndGrpHdr: TQRGroup;
    qrlblGroupHeader: TQRLabel;
    QRDBText6: TQRDBText;
    qrbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    qrbndGrpFtr: TQRBand;
    QRLabel20: TQRLabel;
    qrbdataFooter: TQRDBText;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    qrlblLabourHours: TQRLabel;
    qrlblOvertimeHours: TQRLabel;
    qrlblMachineHours: TQRLabel;
    qrlblGrpLabour: TQRLabel;
    qrlblGrpOvertime: TQRLabel;
    qrlblGrpMachine: TQRLabel;
    qrlblTotLabour: TQRLabel;
    qrlblTotOvertime: TQRLabel;
    qrlblTotMachine: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    qrlblGrpVolume: TQRLabel;
    qrlblTotVolume: TQRLabel;
    qrlblQuantity: TQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
  public
    DateFrom, DateTo: TdateTime;
    PrinterSettings: TPrinterSettings;
    OnlyRechargeables: boolean;
    Preview: boolean;
    Totalby: integer;
    procedure ExportToFile(fileName: string);
    function PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, Department: integer): integer;
  end;

var
  PBRPProdAmendsFrm: TPBRPProdAmendsFrm;

implementation

uses pbDatabase, CCSCommon, PBRSProdAmends;

{$R *.dfm}

var
  rLabour, rOvertime, rMachine: double;
  rgrpLabour, rgrpOvertime, rGrpMachine, rGrpVolume: double;
  rTotLabour, rTotOvertime, rTotMachine, rTotVolume: double;

function TPBRPProdAmendsFrm.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, Department: integer): integer;
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
    self.qryReport.SQL.add('  AND Job_Bag_Time_log.Date_Point >= ' + qDate(tmpDateFrom));
  end;

  if tmpdateTo <> 0 then
  begin
    self.qryReport.SQL.Add('  AND Job_Bag_Time_log.Date_Point <= '+ qDate(tmpDateTo));
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

  if department <> 0 then
  begin
    self.qryReport.SQL.Add('  and (Job_Bag_Time_log.Process_Group = ' + IntToStr(department) + ')');
  end;

  if customer <> 0 then
  begin
    self.qryReport.SQL.Add('  and (Job_Bag_Time_log.Customer = ' + IntToStr(customer) + ')');
  end;

  if OnlyReChargeables then
  begin
    self.qryReport.SQL.Add('  and (Process_Operation.ReChargeable = ''Y'')');
  end;

  if totalby = 0 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Customer.Name, Job_Bag_Time_log.Date_Point, job_Bag_Time_log.job_Bag_Time_log');
    end
  else
  if totalby = 1 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Work_Centre_Operator.Name, Job_Bag_Time_log.Date_Point, job_Bag_Time_log.job_Bag_Time_log');
    end
  else
  if totalby = 2 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Job_Bag_Time_log.Job_Bag, Job_Bag_Time_log.Date_Point, job_Bag_Time_log.job_Bag_Time_log');
    end
  else
  if totalby = 3 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Work_Centre.Work_Centre_Name, Job_Bag_Time_log.Date_Point, job_Bag_Time_log.job_Bag_Time_log');
    end
  else
    begin
      self.qryReport.SQL.Add(' ORDER BY Job_Bag_Time_log.Date_Point, job_Bag_Time_log.job_Bag_Time_log');
    end;

  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);
end;

procedure TPBRPProdAmendsFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Date"'
        + ',"Job Bag"'
        + ',"Customer"'
        + ',"Job Name"'
        + ',"Non Job Bag Code"'
        + ',"Operator"'
        + ',"Department"'
        + ',"Operation"'
        + ',"Work Centre"'
        + ',"Quantity"'
        + ',"Labour"'
        + ',"Overtime"'
        + ',"Machine"';

  writeLn(self.exportFile, tempStr);

  qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPProdAmendsFrm.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with qrpDetails.PrinterSettings do
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
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'Customer_name';
      QRbDataFooter.DataField := 'Customer_name';
      qrlblGroupHeader.Caption := 'Customer:';
    end
  else
  if totalby = 1 then
    begin
      qrbndgrphdr.expression := 'qryReport.WC_Operator_Name';
      QRDBText6.DataField := 'WC_Operator_name';
      QRbDataFooter.DataField := 'WC_Operator_name';
      qrlblGroupHeader.Caption := 'Operator:';
    end
  else
  if totalby = 2 then
    begin
      qrbndgrphdr.expression := 'qryReport.Job_Bag';
      QRDBText6.DataField := 'Job_Bag';
      QRbDataFooter.DataField := 'Job_Bag';
      qrlblGroupHeader.Caption := 'Job Bag:';
    end
  else
  if totalby = 3 then
    begin
      qrbndgrphdr.expression := 'qryReport.Work_Centre_Name';
      QRDBText6.DataField := 'Work_Centre_Name';
      QRbDataFooter.DataField := 'Work_Centre_Name';
      qrlblGroupHeader.Caption := 'Work Centre:';
    end
  else
    begin
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      QRbDataFooter.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 4);
  qrbndgrpftr.enabled := (totalby < 4);

  rGrpLabour := 0;
  rGrpOvertime := 0;
  rGrpMachine := 0;
  rGrpVolume := 0;

  rTotLabour := 0;
  rTotOvertime := 0;
  rTotMachine := 0;
  rTotVolume := 0;
end;

procedure TPBRPProdAmendsFrm.qrbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iQuantity: integer;
begin
  with qryReport do
    begin
      qrlblLabourHours.Caption := formatfloat('##0.00',fieldbyname('Labour_Hours').asfloat);
      qrlblOvertimeHours.Caption := formatfloat('##0.00',fieldbyname('Labour_Overtime_Hours').asfloat);
      qrlblMachineHours.Caption := formatfloat('##0.00',fieldbyname('Machine_Hours').asfloat);
      if fieldbyname('Work_Centre_Assistant').asstring = 'Y' then
        begin
          iQuantity := 0;
          qrlblQuantity.Caption := formatfloat('##0',iQuantity);
        end
      else
        begin
          iQuantity := fieldbyname('Quantity').asinteger;
          qrlblQuantity.Caption := formatfloat('##0',iQuantity);
        end;

      rGrpLabour := rGrpLabour + strtofloat(qrlblLabourHours.Caption);
      rGrpOvertime := rGrpOvertime + strtofloat(qrlblOvertimeHours.Caption);
      rGrpMachine := rGrpMachine + strtofloat(qrlblMachineHours.Caption);
      rGrpVolume := rGrpVolume + iQuantity;

      rTotLabour := rTotLabour + strtofloat(qrlblLabourHours.Caption);
      rTotOvertime := rTotOvertime + strtofloat(qrlblOvertimeHours.Caption);
      rTotMachine := rTotMachine + strtofloat(qrlblMachineHours.Caption);
      rTotVolume := rTotVolume + iQuantity;

    end;
end;

procedure TPBRPProdAmendsFrm.qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblGrpLabour.Caption := formatfloat('##0.00',rGrpLabour);
  qrlblGrpOvertime.Caption := formatfloat('##0.00',rGrpOvertime);
  qrlblGrpMachine.Caption := formatfloat('##0.00',rGrpMachine);
  qrlblGrpVolume.Caption := formatfloat('##0',rGrpVolume);
end;

procedure TPBRPProdAmendsFrm.qrbndGrpFtrAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rGrpLabour := 0;
  rGrpOvertime := 0;
  rGrpMachine := 0;
  rGrpVolume := 0;
end;

procedure TPBRPProdAmendsFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotLabour.Caption := formatfloat('##0.00',rTotLabour);
  qrlblTotOvertime.Caption := formatfloat('##0.00',rTotOvertime);
  qrlblTotMachine.Caption := formatfloat('##0.00',rTotMachine);
  qrlblTotVolume.Caption := formatfloat('##0',rTotVolume);

end;

procedure TPBRPProdAmendsFrm.qrbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if exporting then
    begin
      tempStr := '"' + pbDateStr(qryReport.fieldbyname('Date_Point').asdateTime)+ '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_bag').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Descr').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Activity').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('WC_Operator_Name').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Process_Group_Description').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Operation_Description').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Work_Centre_Name').asstring + '"';
      if qryReport.fieldbyname('Work_Centre_Assistant').asstring = 'Y' then
        begin
          tempStr := tempStr + ',"' + formatfloat('0',0) + '"';
        end
      else
        begin
          tempStr := tempStr + ',"' + formatfloat('0',qryReport.fieldbyname('Quantity').asfloat) + '"';
        end;
      tempStr := tempStr + ',"' + formatfloat('0.00',qryReport.fieldbyname('Labour_Hours').asfloat) + '"';
      tempStr := tempStr + ',"' + formatfloat('0.00',qryReport.fieldbyname('Labour_Overtime_Hours').asfloat) + '"';
      tempStr := tempStr + ',"' + formatfloat('0.00',qryReport.fieldbyname('Machine_Hours').asfloat) + '"';
      writeln(self.exportFile, tempStr);
      PBRSProdAmendsfrm.prgbrExport.StepIt;
    end;

end;

end.

