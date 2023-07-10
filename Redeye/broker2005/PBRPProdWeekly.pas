unit PBRPProdWeekly;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CCSPrint, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables;

type
  TPBRPProdWeeklyFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrbndHeaderPage1: TQRChildBand;
    qrbndHeaderPage2: TQRChildBand;
    qrbndHeaderPage3: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrGrpCustomerPage1: TQRGroup;
    qrbndJobsPage1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qryReport: TQuery;
    qrSubDetailPage1: TQRSubDetail;
    qrbndTotalsPage1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrGrpHeaderPage2: TQRBand;
    qrGrpCustomerPage2: TQRGroup;
    qrSubDetailPage2: TQRSubDetail;
    qrbndJobsPage2: TQRBand;
    qrbndTotalsPage2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    qrGrpHeaderPage3: TQRBand;
    qrGrpCustomerPage3: TQRGroup;
    qrSubDetailPage3: TQRSubDetail;
    qrBndJobsPage3: TQRBand;
    qrbndTotalsPage3: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qryOldWCOperators: TQuery;
    qryOldDummy: TQuery;
    qrlblSheetNo: TQRLabel;
    qrgrpHeaderFinal: TQRBand;
    qrGrpCustomerFinal: TQRGroup;
    qrSubDetailFinal: TQRSubDetail;
    qrBndJobsFinal: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrbndTotalsFinal: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    qryDummyJobs: TQuery;
    qryDummynonJobs: TQuery;
    qrlblBasicTW: TQRLabel;
    qrlblOvertimeTW: TQRLabel;
    qrlblTotalTW: TQRLabel;
    qrlblTotalTD: TQRLabel;
    qrlblChargeable: TQRLabel;
    qrlblInvoiced: TQRLabel;
    qrlblDifference: TQRLabel;
    qrlblReportBasicTW: TQRLabel;
    qrlblReportOvertimeTW: TQRLabel;
    qrlblReportTotalTW: TQRLabel;
    qrlblReportBasicTD: TQRLabel;
    qrlblReportOvertimeTD: TQRLabel;
    qrlblReportTotalTD: TQRLabel;
    qrlblReportTotalChargeable: TQRLabel;
    qrlblReportTotalInvoiced: TQRLabel;
    qrlblReportTotalDifference: TQRLabel;
    QRLabel40: TQRLabel;
    qryGetJobBag: TQuery;
    qrlblOvertimeTD: TQRLabel;
    qrlblBasicTD: TQRLabel;
    qryWCOperators: TQuery;
    QRGrpPage1: TQRGroup;
    qrGrpFinal: TQRGroup;
    qrGrpPage2: TQRGroup;
    qrGrpPage3: TQRGroup;
    qrygetJobBagCharges: TQuery;
    qryOldGetJobBagCharges: TQuery;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbndHeaderPage2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndHeaderPage3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndPageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndTotalsPage1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndTotalsPage2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrpCustomerPage1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSubDetailPage1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrpHeaderPage2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrpCustomerPage2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSubDetailPage2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndHeaderPage1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrpHeaderPage3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrpCustomerPage3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSubDetailPage3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndTotalsPage3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpHeaderFinalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrpCustomerFinalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSubDetailFinalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndJobsPage1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndJobsPage2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrBndJobsPage3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndJobsPage1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndJobsPage2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrBndJobsPage3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrBndJobsFinalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrBndJobsFinalAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndTotalsFinalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    MyPageNumber : integer;
    exportFile: textFile;
    exporting: boolean;
  public
    DateFrom, DateTo: TdateTime;
    Detail: array [0..100] of TQRLabel;
    iDepartment: integer;
    NoOfRecs: integer;
    OperatorJob: array [0..100] of double;
    OperatorJobExcel: array [0..100] of double;
    OperatorOT: array [0..100] of double;
    OperatorTotal: array [0..100] of double;
    OperatorTotalHours: array [0..100] of TQRLabel;
    OperatorTotalOT: array [0..100] of TQRLabel;
    OperatorGrandTotal: array [0..100] of TQRLabel;
    OperatorNo: array [0..100] of integer;
    OperatorName: array [0..100] of TQRLabel;
    PrinterSettings: TPrinterSettings;
    Preview: boolean;
    procedure ExportToFile(fileName: string);
    function PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; Department: integer): integer;
  end;

var
  PBRPProdWeeklyFrm: TPBRPProdWeeklyFrm;

implementation

uses pbDatabase, PBRSProdWeekly;

var
  rBasic, rOvertime: double;
  rTotalBasic, rTotalOvertime: double;
  rTotalBasicTD, rTotalOvertimeTD: double;
  rTotalChargeable, rTotalInvoiced: double;

{$R *.dfm}

{ TPBRPProdWeeklyFrm }

procedure TPBRPProdWeeklyFrm.ExportToFile(fileName: string);
var
  tempStr: string;
  icount: integer;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr :=
          '"Job Bag"'
        + ',"Customer"';
  for icount := 1 to noOfRecs do
    begin
      if OperatorName[icount].caption = '' then
        break;
      tempstr := tempstr + ',' + OperatorName[icount].caption;
    end;

  tempStr := tempstr
      + ',"Basic T/W"'
      + ',Overtime T/W"'
      + ',"Total T/W"'
      + ',"Basic T/D"'
      + ',Overtime T/D"'
      + ',"Total T/D"'
      + ',"Chargeable"'
      + ',"Invoiced"'
      + ',"Under/Over"';

  writeLn(self.exportFile, tempStr);

  qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

function TPBRPProdWeeklyFrm.PrepareReport(tmpdateFrom, tmpdateTo: TDateTime; Department: integer): integer;
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
var
  idx: integer;
begin
  with qryWCOperators do
  begin
    Close;
    ParambyName('Process_Group').asInteger := Department;
    ParambyName('DateFrom').asdatetime := tmpDateFrom;
    ParambyName('DateTo').asdatetime := tmpDateTo;
    Open;
    noofRecs := recordcount;

    First;
    idx := 0;
    while not eof do
    begin
      inc(idx);
      OperatorNo[idx] := fieldbyname('Work_Centre_Operator').AsInteger;

      {Create Operator name}
      OperatorName[idx] := TQRLabel.Create(Self);
      with OperatorName[idx] do
      begin
        AlignToBand := False;
        AutoStretch := False;
        AutoSize := False;
        WordWrap := true;
        Top := 4;
        height := 30;
        Width := 49;
        if idx < 11 then
          begin
            Left := ((idx * (width + 20))+ 280);
            Parent := qrbndHeaderPage1;
            alignment := taleftJustify;
          end
        else
        If Idx < 21 then
          begin
            Parent := qrbndHeaderPage2;
            Left := OperatorName[idx - 10].left;
            alignment := taleftJustify;
          end
        else
          begin
            Parent := qrbndHeaderPage3;
            Left := OperatorName[idx - 20].left;
            alignment := taleftJustify;
          end;
        Caption := trim(fieldByName('Name').AsString);
      end;

      {Create detail label}
      Detail[idx] := TQRLabel.Create(Self);
      with Detail[idx] do
        begin
          AlignToBand := False;
          AutoStretch := False;
          AutoSize := False;
          Alignment := taRightJustify;
          Top := 2;
          height := 15;
          Width := 45;
          name := 'Hours'+intToStr(idx);
          caption := '0.00';
          if idx < 11 then
            begin
              left := Operatorname[idx].left-10;
              Parent := qrbndJobsPage1;
            end
          else
          if idx < 21 then
            begin
              Left := OperatorName[idx - 10].left-10;
              Parent := qrbndJobsPage2;
            end
          else
            begin
              left := OperatorName[idx - 20].left-10;
              Parent := qrbndJobsPage3;
            end;
        end;

      {Create Operator Total Hours}
      OperatorTotalHours[idx] := TQRLabel.Create(Self);
      with OperatorTotalHours[idx] do
      begin
        AlignToBand := False;
        AutoStretch := False;
        AutoSize := False;
        Alignment := taRightJustify;
        Top := 5;
        height := 15;
        Width := 45;
        Name := 'OpTotalHours'+intToStr(idx);
        if idx < 11 then
          begin
            Left := Detail[idx].left;
            Parent := qrbndTotalsPage1;
          end
        else
        If Idx < 21 then
          begin
            Left := Detail[idx].left;
            Parent := qrbndTotalsPage2;
          end
        else
          begin
            Left := Detail[idx].left;
            Parent := qrbndTotalsPage3;
          end;
        Caption := '0.00';
      end;

      {Create Operator Total Overtime}
      OperatorTotalOT[idx] := TQRLabel.Create(Self);
      with OperatorTotalOT[idx] do
      begin
        AlignToBand := False;
        AutoStretch := False;
        AutoSize := False;
        Alignment := taRightJustify;
        Top := 25;
        height := 15;
        Width := 45;
        Name := 'OpTotalOvertime'+intToStr(idx);
        if idx < 11 then
          begin
            Left := Detail[idx].left;
            Parent := qrbndTotalsPage1;
          end
        else
        If Idx < 21 then
          begin
            Left := Detail[idx].left;
            Parent := qrbndTotalsPage2;
          end
        else
          begin
            Left := Detail[idx].left;
            Parent := qrbndTotalsPage3;
          end;
        Caption := '0.00';
      end;

      {Create Operator Grand Total}
      OperatorGrandTotal[idx] := TQRLabel.Create(Self);
      with OperatorGrandTotal[idx] do
      begin
        AlignToBand := False;
        AutoStretch := False;
        AutoSize := False;
        Alignment := taRightJustify;
        Top := 45;
        height := 15;
        Width := 45;
        Name := 'OpGrandTotal'+intToStr(idx);
        if idx < 11 then
          begin
            Left := Detail[idx].left;
            Parent := qrbndTotalsPage1;
          end
        else
        If Idx < 21 then
          begin
            Left := Detail[idx].left;
            Parent := qrbndTotalsPage2;
          end
        else
          begin
            Left := Detail[idx].left;
            Parent := qrbndTotalsPage3;
          end;
        Caption := '0.00';
      end;

    next;
    end;
  end;

//  CreateTotals(Self);
  if noofrecs > 10 then
  begin
    qrbndHeaderPage2.ParentBand := qrbndHeaderPage1;
    qrbndHeaderPage2.enabled := True;
    qrbndJobsPage2.enabled := True;
    qrbndTotalsPage2.enabled := True;
    QRGrpCustomerPage2.enabled := True;
    QRGrpPage2.enabled := True;
  end;
  if noofrecs > 20 then
  begin
    qrbndHeaderPage3.ParentBand := qrbndHeaderPage2;
    qrbndHeaderPage3.enabled := True;
    qrbndJobsPage3.enabled := True;
    qrbndTotalsPage3.enabled := True;
    QRGrpCustomerPage3.enabled := True;
    QRGrpPage3.enabled := True;
  end;

  {Get the actual records}
  qryReport.Active := false;

  qryReport.SQL.clear;
  qryReport.SQL.text := qryDummyJobs.SQL.text;

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
    self.qryReport.SQL.Add('  and (Job_Bag_Time_log.Process_Group = ' + IntToStr(department) + ') ');
  end;

  {Now add the non job bag records}
  self.qryReport.SQL.Add(' UNION ');

  qryReport.SQL.text := qryReport.SQL.text + qryDummyNonJobs.SQL.text;

  if tmpdateFrom <> 0 then
  begin
    self.qryReport.SQL.add('  AND Job_Bag_Time_log.Date_Point >= ' + qDate(tmpDateFrom));
  end;

  if tmpdateTo <> 0 then
  begin
    self.qryReport.SQL.Add('  AND Job_Bag_Time_log.Date_Point <= '+ qDate(tmpDateTo));
  end;

  if department <> 0 then
  begin
    self.qryReport.SQL.Add('  and (Job_Bag_Time_log.Process_Group = ' + IntToStr(department) + ')');
  end;

//  self.qryReport.SQL.Add(' ORDER BY Customer.Name, job_Bag_Time_log.job_Bag');

  self.qryReport.SQL.Add(' ORDER BY Activity_Type, Customer_Name, Job_Bag, Activity_Code');
  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);

end;

procedure TPBRPProdWeeklyFrm.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  // Then reset the page headers by using the tag property.
  qrbndHeaderPage1.Tag := 0;
  // The reset the new page number
  MyPageNumber := 0;
//  cleartotals(self);
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

  rTotalChargeable := 0.00;
  rTotalInvoiced := 0.00;

  rBasic := 0.00;
  rOvertime := 0.00;

  rTotalBasic := 0.00;
  rTotalOvertime := 0.00;

  rTotalBasicTD := 0.00;
  rTotalOvertimeTD := 0.00;
end;

procedure TPBRPProdWeeklyFrm.qrbndHeaderPage2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 PrintBand := qrbndHeaderPage1.Tag = 1;
end;

procedure TPBRPProdWeeklyFrm.qrbndHeaderPage3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 PrintBand := qrbndHeaderPage1.Tag = 2;
end;

procedure TPBRPProdWeeklyFrm.qrbndPageHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrbndHeaderPage1.Tag = 0 then
    qrlblSheetNo.Caption := 'Sheet 1'
  else
  if qrbndHeaderPage1.Tag = 1 then
    qrlblSheetNo.Caption := 'Sheet 2'
  else
  if qrbndHeaderPage1.Tag = 2 then
    qrlblSheetNo.Caption := 'Sheet 3'
  else
    qrlblSheetNo.Caption := 'Sheet 4';

  if qrbndHeaderPage1.Tag = 99 then
    qrlblSheetNo.Caption := 'Totals Sheet';

(*  if (qrbndHeaderPage1.tag = 1) and (noofrecs < 11) then
    printBand := false
  else
  if (qrbndHeaderPage1.tag = 2) and (noofrecs < 21) then
    PrintBand := false;
*)
//  inc(MyPageNumber);
//  PageNumQrl.Caption := format('Page %d', [MyPageNumber]);
end;

procedure TPBRPProdWeeklyFrm.qrbndTotalsPage1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  idx: integer;
begin
  qrbndHeaderPage1.Tag := 1;
  myPageNumber := 0;

  for idx := 1 to noOfRecs do
    begin
      if idx > 10 then
        exit;

      with TQRLabel(Findcomponent('OpTotalHours'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',OperatorTotal[idx]);
      end;

      with TQRLabel(Findcomponent('OpTotalOvertime'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',OperatorOT[idx]);
      end;

      with TQRLabel(Findcomponent('OpGrandTotal'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',(OperatorTotal[idx]+OperatorOT[idx]));
      end;
    end;
end;

procedure TPBRPProdWeeklyFrm.qrbndTotalsPage2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  idx : integer;
  toloop : integer;
begin
  qrbndHeaderPage1.Tag := 2;
  MyPageNumber := 0;

  if NoOfRecs < 11 then
    exit;
  if NoOfRecs > 20 then
    toloop := 20
  else
    toloop := noOfRecs ;

  for idx := 11 to toloop do
    begin
      with TQRLabel(Findcomponent('OpTotalHours'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',OperatorTotal[idx]);
      end;

      with TQRLabel(Findcomponent('OpTotalOvertime'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',OperatorOT[idx]);
      end;

      with TQRLabel(Findcomponent('OpGrandTotal'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',(OperatorTotal[idx]+OperatorOT[idx]));
      end;
    end;
end;

procedure TPBRPProdWeeklyFrm.qrGrpCustomerPage1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  printband := false;
end;

procedure TPBRPProdWeeklyFrm.qrSubDetailPage1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  count: integer;
  noofcols: integer;
begin
  if noofRecs > 10 then
    noofCols := 10
  else
    noofCols := noofrecs ;

  for count := 1 to noofcols do
  begin
    if OperatorNo[count] = qryReport.fieldByName('Work_Centre_Operator').AsInteger then
      begin
        OperatorJob[count] := OperatorJob[count] + (qryReport.FieldByName('Labour_Hours').AsFloat+qryReport.FieldByName('Labour_Overtime_Hours').AsFloat);
        OperatorOT[count] := OperatorOT[count] + (qryReport.FieldByName('Labour_Overtime_Hours').AsFloat);
        OperatorTotal[count] := OperatorTotal[count] + (qryReport.FieldByName('Labour_Hours').AsFloat);
      end;
  end;
  printband := false;
end;

procedure TPBRPProdWeeklyFrm.qrGrpHeaderPage2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if noofrecs > 10 then
    qrpDetails.newpage;
  printband := false;
end;

procedure TPBRPProdWeeklyFrm.qrGrpCustomerPage2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  printband := false;
end;

procedure TPBRPProdWeeklyFrm.qrSubDetailPage2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  noofcols : integer;
  count: integer;
begin
  if noOfRecs > 20 then
    noofcols := 20
  else
    noofcols := noofrecs;

  for count := 1 to noofcols do
  begin
    if OperatorNo[count] = qryReport.fieldByName('Work_Centre_Operator').AsInteger then
      begin
        OperatorJob[count] := OperatorJob[count] + (qryReport.FieldByName('Labour_Hours').AsFloat+qryReport.FieldByName('Labour_Overtime_Hours').AsFloat);
        OperatorOT[count] := OperatorOT[count] + (qryReport.FieldByName('Labour_Overtime_Hours').AsFloat);
        OperatorTotal[count] := OperatorTotal[count] + (qryReport.FieldByName('Labour_Hours').AsFloat);
      end;
  end;

  printband := false;
end;

procedure TPBRPProdWeeklyFrm.qrbndHeaderPage1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := qrbndHeaderPage1.Tag = 0;
end;

procedure TPBRPProdWeeklyFrm.qrGrpHeaderPage3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if noofrecs > 20 then
    qrpDetails.newpage;
  printband := false;
end;

procedure TPBRPProdWeeklyFrm.qrGrpCustomerPage3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  printband := false;
end;

procedure TPBRPProdWeeklyFrm.qrSubDetailPage3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  noofcols : integer;
  count: integer;
begin
  if noOfRecs > 30 then
    noofcols := 30
  else
    noofcols := noofrecs;

  for count := 1 to noofcols do
  begin
    if OperatorNo[count] = qryReport.fieldByName('Work_Centre_Operator').AsInteger then
      begin
        OperatorJob[count] := OperatorJob[count] + (qryReport.FieldByName('Labour_Hours').AsFloat+qryReport.FieldByName('Labour_Overtime_Hours').AsFloat);
        OperatorOT[count] := OperatorOT[count] + (qryReport.FieldByName('Labour_Overtime_Hours').AsFloat);
        OperatorTotal[count] := OperatorTotal[count] + (qryReport.FieldByName('Labour_Hours').AsFloat);
      end;
  end;
  printband := false;
end;

procedure TPBRPProdWeeklyFrm.qrbndTotalsPage3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  idx : integer;
begin
  qrbndHeaderPage1.Tag := 3;
  MyPageNumber := 0;

  if NoOfRecs < 21 then
    exit;

  for idx := 21 to noOfRecs do
    begin
      with TQRLabel(Findcomponent('OpTotalHours'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',OperatorTotal[idx]);
      end;

      with TQRLabel(Findcomponent('OpTotalOvertime'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',OperatorOT[idx]);
      end;

      with TQRLabel(Findcomponent('OpGrandTotal'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',(OperatorTotal[idx]+OperatorOT[idx]));
      end;
    end;
end;

procedure TPBRPProdWeeklyFrm.qrgrpHeaderFinalBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  icount: integer;
begin
  qrbndPageHeader.height := 96;
  qrbndPageHeader.Frame.DrawBottom := true;
  qrpDetails.newpage;
  qrbndHeaderPage1.Tag := 99;
  printband := false;

  for icount := 1 to noofRecs do
    OperatorJob[icount] := 0.00;
end;

procedure TPBRPProdWeeklyFrm.qrGrpCustomerFinalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  printband := false;
end;

procedure TPBRPProdWeeklyFrm.qrSubDetailFinalBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  icount: integer;
begin
  for icount := 1 to noofrecs do
  begin
    if OperatorNo[icount] = qryReport.fieldByName('Work_Centre_Operator').AsInteger then
      begin
        OperatorJob[icount] := OperatorJob[icount] + (qryReport.FieldByName('Labour_Hours').AsFloat+qryReport.FieldByName('Labour_Overtime_Hours').AsFloat);
        OperatorOT[icount] := OperatorOT[icount] + (qryReport.FieldByName('Labour_Overtime_Hours').AsFloat);
        OperatorTotal[icount] := OperatorTotal[icount] + (qryReport.FieldByName('Labour_Hours').AsFloat);
      end;
  end;
  rBasic := rbasic + qryReport.fieldbyname('Labour_Hours').asfloat;
  rOvertime := rOvertime + qryReport.fieldbyname('Labour_Overtime_Hours').asfloat;
  printband := false;
end;

procedure TPBRPProdWeeklyFrm.qrbndJobsPage1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  idx : integer;
begin
  {Total up for each Operator}
  for idx := 1 to noOfRecs do
    begin
      if idx > 10 then
        exit;

      with TQRLabel(Findcomponent('Hours'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',OperatorJob[idx]);
      end;
    end;
end;

procedure TPBRPProdWeeklyFrm.qrbndJobsPage2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  idx : integer;
  toloop : integer;
begin
  if NoOfRecs < 11 then
    exit;
  if NoOfRecs > 20 then
    toloop := 20
  else
    toloop := noOfRecs ;
  for idx := 11 to toloop do
    begin
      with tQRLabel(Findcomponent('Hours'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',OperatorJob[idx]);
      end;

(*      with TQRLabel(Findcomponent('JobBasic'+qryReport.fieldbyname('Activity_code').asstring+qryReport.fieldbyname('Customer').asstring)) do
      begin
        Caption := formatfloat('##0.00',(strtofloat(caption) + OperatorJob[idx]));
      end;

      with TQRLabel(Findcomponent('JobOvertime'+qryReport.fieldbyname('Activity_code').asstring+qryReport.fieldbyname('Customer').asstring)) do
      begin
        Caption := formatfloat('##0.00',(strtofloat(caption) + OperatorJob[idx]));
      end;

      with TQRLabel(Findcomponent('JobTotal'+qryReport.fieldbyname('Activity_code').asstring+qryReport.fieldbyname('Customer').asstring)) do
      begin
        Caption := formatfloat('##0.00',(strtofloat(caption) + OperatorJob[idx]));
      end;
*)
    end;
end;

procedure TPBRPProdWeeklyFrm.qrBndJobsPage3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  idx : integer;
begin
  if NoOfRecs < 21 then
    exit;

  for idx := 21 to noOfRecs do
    begin
      with tQRLabel(Findcomponent('Hours'+IntToStr(idx))) do
      begin
        Caption := formatfloat('##0.00',OperatorJob[idx]);
      end;

(*      with TQRLabel(Findcomponent('JobBasic'+qryReport.fieldbyname('Activity_code').asstring+qryReport.fieldbyname('Customer').asstring)) do
      begin
        Caption := formatfloat('##0.00',(strtofloat(caption) + OperatorJob[idx]));
      end;

      with TQRLabel(Findcomponent('JobOvertime'+qryReport.fieldbyname('Activity_code').asstring+qryReport.fieldbyname('Customer').asstring)) do
      begin
        Caption := formatfloat('##0.00',(strtofloat(caption) + OperatorJob[idx]));
      end;

      with TQRLabel(Findcomponent('JobTotal'+qryReport.fieldbyname('Activity_code').asstring+qryReport.fieldbyname('Customer').asstring)) do
      begin
        Caption := formatfloat('##0.00',(strtofloat(caption) + OperatorJob[idx]));
      end;
*)
    end;
end;

procedure TPBRPProdWeeklyFrm.qrbndJobsPage1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  idx: integer;
begin
  for idx := 1 to 10 do
    begin
      OperatorJobExcel[idx] := OperatorJob[idx];
      OperatorJob[idx] := 0.00;
    end;
end;

procedure TPBRPProdWeeklyFrm.qrbndJobsPage2AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  idx: integer;
begin
  for idx := 11 to 20 do
    begin
      OperatorJobExcel[idx] := OperatorJob[idx];
      OperatorJob[idx] := 0.00;
    end;
end;

procedure TPBRPProdWeeklyFrm.qrBndJobsPage3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  idx: integer;
begin
  for idx := 21 to 30 do
    begin
      OperatorJob[idx] := 0.00;
    end;
end;

procedure TPBRPProdWeeklyFrm.qrBndJobsFinalBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rTotal, rDeptBasic, rDeptOvertime, rDeptCharge: double;
begin
  if qryReport.fieldbyname('Job_Bag').asstring <> '' then
    begin
      with qryGetJobBag do
        begin
          close;
          parambyname('Job_Bag').asinteger := qryReport.fieldbyname('Job_Bag').asinteger;
          parambyname('Process_Group').asinteger := iDepartment;
          open;

          rDeptBasic := 0;
          rDeptOvertime := 0;
          rDeptCharge := 0;
          while eof <> true do
            begin
              rDeptBasic := rDeptBasic + fieldbyname('Total_Basic').asfloat;
              rDeptOvertime := rDeptOvertime + fieldbyname('Total_Overtime').asfloat;
              rDeptCharge := rDeptCharge + (fieldbyname('Total_Basic_Cost').asfloat+fieldbyname('Total_Overtime_Cost').asfloat);

              rTotalBasicTD := rTotalBasicTD + fieldbyname('Total_Basic').asfloat;
              rTotalOvertimeTD := rTotalOvertimeTD + fieldbyname('Total_Overtime').asfloat;
              rTotalChargeable := rTotalChargeable + (fieldbyname('Total_Basic_Cost').asfloat+fieldbyname('Total_Overtime_Cost').asfloat);
              next;
            end;

          qrlblBasicTD.caption := formatfloat('##0.00',rDeptBasic);
          qrlblOvertimeTD.caption := formatfloat('##0.00',rDeptOvertime);
          qrlblTotalTD.caption := formatfloat('##0.00',(rDeptBasic+rDeptOvertime));

          qrlblChargeable.caption := formatfloat('##0.00',rDeptCharge);
        end;

      with qryGetJobBagCharges do
        begin
          close;
          parambyname('Job_Bag').asinteger := qryReport.fieldbyname('Job_Bag').asinteger;
          parambyname('Process_Group').asinteger := iDepartment;
          open;

          rTotal := 0;

          while eof <> true do
            begin
              rTotal := rTotal + fieldbyname('Total_Invoiced').asfloat;
              rTotalInvoiced := rTotalInvoiced + fieldbyname('Total_Invoiced').asfloat;
              next;
            end;

          qrlblInvoiced.caption := formatfloat('##0.00',rTotal);

          {difference is between invoiced and total hours chargeable}
          qrlblDifference.caption := formatfloat('##0.00',(rTotal-rDeptCharge));
        end;
    end
  else
    begin
      rTotalBasicTD := rTotalBasicTD + 0.00;
      rTotalOvertimeTD := rTotalOvertimeTD + 0.00;
      rTotalChargeable := rTotalChargeable + 0.00;

      qrlblBasicTD.caption := '0.00';
      qrlblOvertimeTD.caption := '0.00';
      qrlblTotalTD.caption := formatfloat('##0.00',(0.00));

      rTotalInvoiced := rTotalInvoiced + 0.00;

      qrlblChargeable.caption := '0.00';
      qrlblInvoiced.caption := '0.00';
      qrlblDifference.caption := '0.00';
    end;

  qrlblBasicTW.caption := formatfloat('##0.00',rBasic);
  qrlblOvertimeTW.caption := formatfloat('##0.00',rOvertime);
  qrlblTotalTW.caption := formatfloat('##0.00',(rBasic+rOvertime));

  rTotalBasic := rTotalBasic + rBasic;
  rTotalOvertime := rTotalOvertime + rOvertime;
end;

procedure TPBRPProdWeeklyFrm.qrBndJobsFinalAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  icount: integer;
  tempstr: string;
begin
  if exporting then
    begin
      tempStr := '"' + qryReport.fieldbyname('Activity_Code').asstring + '"';
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring  + '"';
      for icount := 1 to noOfRecs do
        begin
          tempStr := tempStr + ',"' + formatfloat('#00.00',OperatorJob[icount])  + '"';
        end;
      tempStr := tempStr + ',"' + qrlblBasicTW.caption + '"';
      tempStr := tempStr + ',"' + qrlblOvertimeTW.caption + '"';
      tempStr := tempStr + ',"' + qrlblTotalTW.caption + '"';
      tempStr := tempStr + ',"' + qrlblBasicTD.caption + '"';
      tempStr := tempStr + ',"' + qrlblOvertimeTD.caption + '"';
      tempStr := tempStr + ',"' + qrlblTotalTD.caption + '"';
      tempStr := tempStr + ',"' + qrlblChargeable.caption + '"';
      tempStr := tempStr + ',"' + qrlblInvoiced.caption + '"';
      tempStr := tempStr + ',"' + qrlblDifference.caption + '"';
      writeln(self.exportFile, tempStr);
      PBRSProdWeeklyfrm.prgbrExport.StepIt;
    end;

  for icount := 1 to noofRecs do
    OperatorJob[icount] := 0.00;

  rBasic := 0.00;
  rOvertime := 0.00;
end;

procedure TPBRPProdWeeklyFrm.qrbndTotalsFinalBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblReportBasicTW.caption := formatfloat('##0.00',rTotalBasic);
  qrlblReportOvertimeTW.caption := formatfloat('##0.00',rTotalOvertime);
  qrlblReportTotalTW.caption := formatfloat('##0.00',(rTotalBasic+rTotalOvertime));

  qrlblReportBasicTD.caption := formatfloat('##0.00',rTotalBasicTD);
  qrlblReportOvertimeTD.caption := formatfloat('##0.00',rTotalOvertimeTD);
  qrlblReportTotalTD.caption := formatfloat('##0.00',(rTotalBasicTD+rTotalOvertimeTD));

  qrlblReportTotalChargeable.caption := formatfloat('##0.00',rTotalChargeable);
  qrlblReportTotalInvoiced.caption := formatfloat('##0.00',rTotalInvoiced);
  qrlblReportTotalDifference.caption := formatfloat('##0.00',(rTotalInvoiced-rTotalChargeable));
end;

end.
