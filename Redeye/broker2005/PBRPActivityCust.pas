unit PBRPActivityCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, CCSPrint, gtQrCtrls, DateUtils;

type
  TPBRPActivityCustFrm = class(TForm)
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
    QRShape4: TQRShape;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrChildSummary: TQRChildBand;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    qrlblGroupCount: TQRLabel;
    qrlblTotalCount: TQRLabel;
    qryDummy: TQuery;
    QRLabel22: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel7: TQRLabel;
    qrlblDueDate: TgtQRLabel;
    qrlblEnteredDate: TgtQRLabel;
    procedure qrReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndGrpFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndGrpHdrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    iGroupCount, iTotalCount: integer;
    exportFile: textFile;
    exporting: boolean;
  public
    PrinterSettings: TPrinterSettings;
    Totalby: integer;
    ShowOnlyLive: boolean;
    procedure ExportToFile(fileName: string);
    function PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, AssignedTo, ActivityType: integer; CustomerName: string): integer;
  end;

var
  PBRPActivityCustFrm: TPBRPActivityCustFrm;

implementation

uses PBDatabase, CCSCommon, PBRSActivityCust;

{$R *.DFM}

function TPBRPActivityCustFrm.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; customer, AssignedTo, ActivityType: integer; CustomerName: string): integer;
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
    self.qryReport.SQL.add('  AND Activity.due_date_time >= ' + qDate(dateof(tmpDateFrom)));
  end;

  if tmpdateTo <> 0 then
  begin
    self.qryReport.SQL.Add('  AND Activity.due_date_time <= '+ qDate(dateof(tmpDateTo+1)));
  end;

  if ShowOnlyLive then
    begin
      self.qryReport.SQL.Add(' AND (Activity.Activity_Status < 30) ');
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
      self.qryReport.SQL.Add(' AND Activity.Customer_Name like ''' + trim(CustomerName) + '''')
    else
      self.qryReport.SQL.Add(' AND Activity.customer = ' + IntToStr(Customer) + ')');
  end;

  if AssignedTo <> 0 then
  begin
    self.qryReport.SQL.Add('  and (Activity.Assigned_To = ' + IntToStr(AssignedTo) + ')');
  end;

  if ActivityType <> 0 then
  begin
    self.qryReport.SQL.Add('  and (Activity.Activity_Type = ' + IntToStr(ActivityType) + ')');
  end;

  if totalby = 0 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Assigned_To_Name, Activity.Due_Date_Time');
      qrbndgrphdr.expression := 'qryReport.Assigned_To_Name';
      QRDBText6.DataField := 'qryReport.Assigned_To_Name';
      qrlblGroupHeader.Caption := 'Assigned To:';
    end
  else
  if totalby = 1 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Operator_Name, Activity.Due_Date_Time');
      qrbndgrphdr.expression := 'qryReport.Operator_Name';
      QRDBText6.DataField := 'qryReport.Operator_Name';
      qrlblGroupHeader.caption:= 'Operator:';
    end
  else
  if totalby = 2 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Customer_Name, Activity.Due_Date_Time');
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'qryReport.Customer_Name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
  if totalby = 3 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Activity_Type_Description, Activity.Due_Date_Time');
      qrbndgrphdr.expression := 'qryReport.Activity_Type_Description';
      QRDBText6.DataField := 'qryReport.Activity_Type_Description';
      qrlblGroupHeader.caption:= 'Activity Type:';
    end
  else
    begin
      self.qryReport.SQL.Add(' ORDER BY Activity.Due_Date_Time');
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 4);
  qrbndgrpftr.enabled := (totalby < 4);

  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);
end;

procedure TPBRPActivityCustFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
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
      qrbndgrphdr.expression := 'qryReport.Assigned_To_Name';
      QRDBText6.DataField := 'Assigned_To_Name';
      QRbDataFooter.DataField := 'Assigned_To_Name';
      qrlblGroupHeader.Caption := 'Assigned To:';
    end
  else
  if totalby = 1 then
    begin
      qrbndgrphdr.expression := 'qryReport.Operator_Name';
      QRDBText6.DataField := 'Operator_Name';
      QRbDataFooter.DataField := 'Operator_Name';
      qrlblGroupHeader.Caption := 'Operator:';
    end
  else
  if totalby = 2 then
    begin
      qrbndgrphdr.expression := 'qryReport.Customer_Name';
      QRDBText6.DataField := 'Customer_name';
      QrbDataFooter.DataField := 'Customer_name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
  if totalby = 3 then
    begin
      qrbndgrphdr.expression := 'qryReport.Activity_Type_Description';
      QRDBText6.DataField := 'Activity_Type_Description';
      QrbDataFooter.DataField := 'Activity_Type_Description';
      qrlblGroupHeader.caption:= 'Activity Type:';
    end
  else
    begin
      qrbndgrphdr.expression := '';
      QRDBText6.DataField := '';
      QrbDataFooter.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrChildSummary.ParentBand := qrbndPageHeader;

  iGroupCount := 0;
  iTotalCount := 0;
end;

procedure TPBRPActivityCustFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Due Date"'
        + ',"Assigned To"'
        + ',"Customer"'
        + ',"Subject"'
        + ',"Type"'
        + ',"Priority"'
        + ',"Operator"'
        + ',"Date Entered"'
        + ',"Status"';

  writeLn(self.exportFile, tempStr);

  qrReport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPActivityCustFrm.qrbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if exporting then
    begin
      tempStr := '"' + qrlblDueDate.caption + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Assigned_To_Name').asstring + '"';;
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';;
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Activity_Subject').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Activity_Type_Description').asstring  + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Activity_Priority_Description').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Operator_Name').asstring + '"';
      tempStr := tempStr + ',"' + qrlblEnteredDate.caption + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Activity_Status_Description').asstring + '"';
      writeln(self.exportFile, tempStr);
    end;
end;

procedure TPBRPActivityCustFrm.qrbndGrpFtrBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblGroupCount.Caption := inttostr(iGroupCount);
end;

procedure TPBRPActivityCustFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotalCount.Caption := inttostr(iTotalCount);
end;

procedure TPBRPActivityCustFrm.qrbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblDueDate.caption := PBDateStr(qryReport.fieldbyname('Due_Date_Time').asdatetime);
  qrlblEnteredDate.caption := PBDateStr(qryReport.fieldbyname('Date_Time_Entered').asdatetime);

  iGroupCount := iGroupCount + 1;
  iTotalCount := iTotalCount + 1;
end;

procedure TPBRPActivityCustFrm.qrbndGrpHdrBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iGroupCount := 0;
end;

end.
