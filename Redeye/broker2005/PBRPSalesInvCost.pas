unit PBRPSalesInvCost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QuickRpt, Qrctrls, ExtCtrls, CCSPrint, DateUtils;

type
  TPBRPSalesInvCostFrm = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrgHeadCustomer: TQRGroup;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qryReport: TQuery;
    qrlblDept1: TQRLabel;
    qrlblDept2: TQRLabel;
    qrlblDept3: TQRLabel;
    qryDepartments: TQuery;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrDbRepSortBy: TQRDBText;
    qryDummy: TQuery;
    QRDBText1: TQRDBText;
    qryDataCollect: TQuery;
    dtsReport: TDataSource;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    qrlblDept4: TQRLabel;
    qrlblDept5: TQRLabel;
    qrlblDept6: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    qrlblDept7: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel29: TQRLabel;
    qrlblAnalysis1: TQRLabel;
    qrlblAnalysis2: TQRLabel;
    qrlblAnalysis3: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    qrlblReptCost1: TQRLabel;
    qrlblReptEstCost1: TQRLabel;
    qrlblReptCost2: TQRLabel;
    qrlblReptEstCost2: TQRLabel;
    qrlblReptCost3: TQRLabel;
    qrlblReptEstCost3: TQRLabel;
    qrlblReptCost4: TQRLabel;
    qrlblReptEstCost4: TQRLabel;
    qrlblReptCost5: TQRLabel;
    qrlblReptEstCost5: TQRLabel;
    qrlblReptCost6: TQRLabel;
    qrlblReptEstCost6: TQRLabel;
    qrlblReptCost7: TQRLabel;
    qrlblReptEstCost7: TQRLabel;
    qrlblTotalReptCost: TQRLabel;
    qrlblTotalReptEstCost: TQRLabel;
    qrlblReptAnalysis1: TQRLabel;
    qrlblReptAnalysis2: TQRLabel;
    qrlblReptAnalysis3: TQRLabel;
    qrlblReptActContrib: TQRLabel;
    qrlblReptEstContrib: TQRLabel;
    QRLabel1: TQRLabel;
    qrgFootCustomer: TQRBand;
    QRDBText6: TQRDBText;
    qrlblCustCost1: TQRLabel;
    qrlblCustEstCost1: TQRLabel;
    qrlblCustCost2: TQRLabel;
    qrlblCustEstCost2: TQRLabel;
    qrlblCustCost3: TQRLabel;
    qrlblCustEstCost3: TQRLabel;
    qrlblCustCost4: TQRLabel;
    qrlblCustEstCost4: TQRLabel;
    qrlblCustCost5: TQRLabel;
    qrlblCustEstCost5: TQRLabel;
    qrlblCustCost6: TQRLabel;
    qrlblCustEstCost6: TQRLabel;
    qrlblCustCost7: TQRLabel;
    qrlblCustEstCost7: TQRLabel;
    qrlblTotalCustCost: TQRLabel;
    qrlblTotalCustEstCost: TQRLabel;
    qrlblCustAnalysis1: TQRLabel;
    qrlblCustAnalysis2: TQRLabel;
    qrlblCustAnalysis3: TQRLabel;
    qrlblCustActContrib: TQRLabel;
    qrlblCustEstContrib: TQRLabel;
    QRShape1: TQRShape;
    QRSubDetail2: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel2: TQRLabel;
    QRSubDetail3: TQRSubDetail;
    qrlblCost1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    qrlblestCost1: TQRLabel;
    qrlblCost2: TQRLabel;
    qrlblestCost2: TQRLabel;
    qrlblCost3: TQRLabel;
    qrlblestCost3: TQRLabel;
    qrlblCost4: TQRLabel;
    qrlblestCost4: TQRLabel;
    qrlblCost5: TQRLabel;
    qrlblestCost5: TQRLabel;
    qrlblCost6: TQRLabel;
    qrlblestCost6: TQRLabel;
    qrlblCost7: TQRLabel;
    qrlblestCost7: TQRLabel;
    qrlblTotalCost: TQRLabel;
    qrlblTotalEstCost: TQRLabel;
    qrlblTotalAnalysis1: TQRLabel;
    qrlblTotalAnalysis2: TQRLabel;
    qrlblTotalAnalysis3: TQRLabel;
    qrlblActContrib: TQRLabel;
    qrlblEstContrib: TQRLabel;
    qrlblEstQuantity: TQRLabel;
    qryGetInvoiced: TQuery;
    qryCatAnalysis: TQuery;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgFootCustomerBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgFootCustomerAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    JobCost: array[1..10, 1..3] of Real;
    CustCost: array[1..10, 1..3] of Real;
    ReportTotals: array[1..10, 1..3] of Real;
    ProcessHeaders: array [1..10] of string;
    Process: array [1..10] of integer;
    AnalysisHeaders: array [1..10] of string;
    Analysis: array [1..10] of real;
    CustAnalysis: array [1..10] of real;
    ReportAnalysis: array [1..10] of real;
  public
    exporting: boolean;
    exportFile: textFile;
    PrinterSettings: TPrinterSettings;
    SelRepCode: integer;
    iPeriod: integer;
    function GetDetails(Sender: TObject): integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPSalesInvCostFrm: TPBRPSalesInvCostFrm;

implementation

{$R *.DFM}

uses PBRSSalesInvCost;

function TPBRPSalesInvCostFrm.GetDetails(Sender: TObject): integer;
begin
  with qryReport do
    begin
      close;
      sql.Clear;
      sql.Text := qryDummy.SQL.Text;
      parambyname('Period').asinteger := iPeriod;
      parambyname('Customer').asinteger := SelRepCode;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPSalesInvCostFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  icount: integer;
  i, j: integer;
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

// Build the list of periods for this year;
  icount := 0;
  with qryDepartments do
    begin
      close;
      open;
      first;
      while eof <> true do
        begin
          icount := icount + 1;
          ProcessHeaders[icount] := fieldbyname('Process_group_Description').asstring;
          Process[icount] := fieldbyname('Process_Group').asinteger;
          next;
        end;
    end;

  icount := 0;
  with qryCatAnalysis do
    begin
      close;
      open;
      first;
      while eof <> true do
        begin
          icount := icount + 1;
          AnalysisHeaders[icount] := fieldbyname('Analysis_Code').asstring;
          next;
        end;
    end;

  for i := 1 to 10 do
    for j := 1 to 3 do
      JobCost[i, j] := 0;

  qryDataCollect.Active := true;
end;

procedure TPBRPSalesInvCostFrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  Printband := false;
end;

procedure TPBRPSalesInvCostFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  templbl: TQRLabel;
begin
  {Display the department header}
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblDept' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := ProcessHeaders[i];
      except
      end;
    end;

  {Display the Analysis headers}
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblAnalysis' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := AnalysisHeaders[i];
      except
      end;
    end;
end;

procedure TPBRPSalesInvCostFrm.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  rTotal, rTotalActual, rTotalEstimated: real;
  templbl: TQRLabel;
begin
  {Show the Cost}
  rTotal := 0;
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblReptCost' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',ReportTotals[i,2]);
        rTotal := rTotal + ReportTotals[i,2];
      except
      end;
    end;
  rTotalActual := rTotal;
  qrlblTotalReptcost.caption := formatfloat('#,##0',rTotalActual);

  {Show the Est Cost}
  rTotal := 0;
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblReptEstCost' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',ReportTotals[i,3]);
        rTotal := rTotal + ReportTotals[i,3];
      except
      end;
    end;
  rTotalEstimated := rTotal;
  qrlblTotalReptEstCost.caption := formatfloat('#,##0',rTotalEstimated);

  {Show the Report Analysis details}
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblReptAnalysis' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',ReportAnalysis[i]);
      except
      end;
    end;

  {Show Actual Contribution}
  qrlblReptActContrib.caption := formatfloat('#,##0',(ReportAnalysis[3] - rTotalActual));


  {Show Estimated Contribution}
  qrlblReptEstContrib.caption := formatfloat('#,##0',(ReportAnalysis[3] - rTotalEstimated));
end;

procedure TPBRPSalesInvCostFrm.ExportToFile(fileName: string);
var
  tempStr: string;
  icount: integer;
  tmpLabel: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

// Build the list of periods for this year;
  icount := 0;
  with qryDepartments do
    begin
      close;
      open;
      first;
      while eof <> true do
        begin
          icount := icount + 1;
          ProcessHeaders[icount] := fieldbyname('Process_group_Description').asstring;
          Process[icount] := fieldbyname('Process_Group').asinteger;
          next;
        end;
    end;

// Build the list of Analysis codes
  icount := 0;
  with qryCatAnalysis do
    begin
      close;
      open;
      first;
      while eof <> true do
        begin
          icount := icount + 1;
          AnalysisHeaders[icount] := fieldbyname('Analysis_Code').asstring;
          next;
        end;
    end;

  tempStr := '"Customer"'
          + ',"Job Bag"'
          + ',"Description"'
          + ',"Job Quantity"'
          + ',"Est Quantity"';

  for icount := 1 to 10 do
    begin
      if ProcessHeaders[icount] <> '' then
        begin
          tempStr := tempstr + ',"' + ProcessHeaders[icount] + ' - Cost' + '"';
          tempStr := tempstr + ',"' + ProcessHeaders[icount] + ' - Est Cost' + '"';
        end;
    end;

  tempstr := tempstr + ',"Total Cost"';
  tempstr := tempstr + ',"Total Est Cost"';

  for icount := 1 to 10 do
    begin
      if AnalysisHeaders[icount] <> '' then
        begin
          tempStr := tempstr + ',"' + AnalysisHeaders[icount] + ' GP' + '"';
        end;
    end;

  tempstr := tempstr + ',"Act Contribution"';
  tempstr := tempstr + ',"Est Contribution"';

  writeLn(self.exportFile, tempStr);
  qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPSalesInvCostFrm.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  iDept, icount: integer;
begin
  iDept := qryDataCollect.fieldbyname('Process_Group').asinteger;
  for icount := 1 to 10 do
    begin
      if iDept = Process[icount] then
        begin
          JobCost[icount,1] := JobCost[icount,1] + 0;
          JobCost[icount,2] := JobCost[icount,2] + qryDataCollect.fieldbyname('Total_Production_Cost').asfloat;
          JobCost[icount,3] := JobCost[icount,3] + qryDataCollect.fieldbyname('Total_Estimated_Cost').asfloat;
        end;
    end;
  Printband := false;
end;

procedure TPBRPSalesInvCostFrm.qrgFootCustomerBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: integer;
  rTotal, rTotalEstimated, rTotalActual: real;
  templbl: TQRLabel;
begin
(*  {Display the Hours}
  rTotal := 0;
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblCustHours' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',CustCost[i,1]);
        rTotal := rTotal + CustCost[i,1];
        ReportTotals[i,1] := ReportTotals[i,1] + CustCost[i,1];
      except
      end;
    end;
  qrlblTotalCustHours.Caption := formatfloat('#,##0',rTotal);
*)

  {Display the Cost details}
  rTotal := 0;
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblCustCost' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',CustCost[i,2]);
        rTotal := rTotal + CustCost[i,2];
        ReportTotals[i,2] := ReportTotals[i,2] + CustCost[i,2];
      except
      end;
    end;
  rTotalActual := rTotal;
  qrlblTotalCustCost.Caption := formatfloat('#,##0',rTotalActual);

  {Display the Estimated Cost details}
  rTotal := 0;
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblCustEstCost' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',CustCost[i,3]);
        rTotal := rTotal + CustCost[i,3];
        ReportTotals[i,3] := ReportTotals[i,3] + CustCost[i,3];
      except
      end;
    end;
  rTotalEstimated := rTotal;
  qrlblTotalCustEstCost.Caption := formatfloat('#,##0',rTotalEstimated);

  {Display the Analysis Values}
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblCustAnalysis' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',CustAnalysis[i]);
        ReportAnalysis[i] := ReportAnalysis[i] + CustAnalysis[i];
      except
      end;
    end;

  {Show the total customer Actual contribution}
  qrlblCustActContrib.Caption := formatfloat('#,##0',(CustAnalysis[3] - rTotalActual));

  {Show the total customer Estimated contribution}
  qrlblCustEstContrib.Caption := formatfloat('#,##0',(CustAnalysis[3] - rTotalEstimated));
end;

procedure TPBRPSalesInvCostFrm.qrgFootCustomerAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  i,j: integer;
begin
  for i := 1 to 10 do
    for j := 1 to 3 do
      CustCost[i,j] := 0;

  for i := 1 to 10 do
    CustAnalysis[i] := 0;
end;

procedure TPBRPSalesInvCostFrm.QRSubDetail3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: integer;
  idept: integer;
  rTotal, rEstCost, rTotalActual, rTotalEstimated: real;
  sAnalysis: string;
  templbl: TQRLabel;
begin
(*  {Display the Hours}
  rTotal := 0;
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblHours' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',JobCost[i,1]);
        rTotal := rTotal + JobCost[i,1];
        CustCost[i,1] := CustCost[i,1] + JobCost[i,1];
      except
      end;
    end;
  qrlblTotalHours.Caption := formatfloat('#,##0',rTotal);
*)

  {Display the Cost details}
  rTotal := 0;
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblCost' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',JobCost[i,2]);
        rTotal := rTotal + JobCost[i,2];
        CustCost[i,2] := CustCost[i,2] + JobCost[i,2];
      except
      end;
    end;
  rTotalActual := rTotal;
  qrlblTotalCost.Caption := formatfloat('#,##0',rTotalActual);

  {Now display the Estimated Cost details}
  rTotal := 0;
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblEstCost' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',JobCost[i,3]);
        rTotal := rTotal + JobCost[i,3];
        CustCost[i,3] := CustCost[i,3] + JobCost[i,3];
      except
      end;
    end;
  rTotalEstimated := rTotal;
  qrlblTotalEstCost.Caption := formatfloat('#,##0',rTotalEstimated);

  if qryReport.fieldbyname('Quote_Quantity').asinteger = 0 then
    qrlblEstQuantity.caption := ''
  else
    qrlblEstQuantity.caption := inttostr(qryReport.fieldbyname('Quote_Quantity').asinteger);

  {get the Invoiced GP values}
  with qryGetInvoiced do
    begin
      close;
      parambyname('Job_Bag').asinteger := qryReport.fieldbyname('Job_Bag').asinteger;
      open;

      while eof <> true do
        begin
          sAnalysis := fieldbyname('Analysis_Code').asstring;
          for i := 1 to 10 do
            begin
              if sAnalysis = AnalysisHeaders[i] then
                begin
                  Analysis[i] := Analysis[i] + fieldbyname('Gross_Profit').asfloat;
                end;
            end;

          next;
        end;
    end;

  {Now display the Analysis Totals}
  rTotal := 0;
  for i := 1 to 10 do
    begin
      templbl := ((FindComponent('qrlblTotalAnalysis' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',Analysis[i]);
//        rTotal := rTotal + JobCost[i,3];
        CustAnalysis[i] := CustAnalysis[i] + Analysis[i];
      except
      end;
    end;

  {Show the Actual contribution}
  qrlblActContrib.Caption := formatfloat('#,##0',(Analysis[3]-rTotalActual));

  {Show the Estimated contribution}
  qrlblEstContrib.Caption := formatfloat('#,##0',(Analysis[3]-rTotalEstimated));
end;

procedure TPBRPSalesInvCostFrm.QRSubDetail3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
  templbl: TQRLabel;
  i, j: integer;
begin
  if self.exporting then
  begin
    {Customer}
    tempStr := '"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    {Job Bag}
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag').asstring + '"';

    {Job Bag Description}
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Description').asstring + '"';

    {Quantity}
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Quantity').asstring + '"';

    {Estimate Qty}
    tempStr := tempStr + ',"' + qrlblEstQuantity.caption + '"';

    for i := 1 to 10 do
      begin
        //Actual Cost
        templbl := ((FindComponent('qrlblCost' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',JobCost[i,2]);
        except
          continue;
        end;
        tempStr := tempStr + ',"' + templbl.caption + '"';

        //Estimated Cost
        templbl := ((FindComponent('qrlblEstCost' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',JobCost[i,3]);
        except
          continue;
        end;
        tempStr := tempStr + ',"' + templbl.caption + '"';
      end;

    {Total Cost}
    tempStr := tempStr + ',"' + qrlblTotalCost.caption + '"';

    {Total Est Cost}
    tempStr := tempStr + ',"' + qrlblTotalEstCost.caption + '"';

    for i := 1 to 10 do
      begin
        //Analysis GP
        templbl := ((FindComponent('qrlblTotalAnalysis' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',Analysis[i]);
        except
          continue;
        end;
        tempStr := tempStr + ',"' + templbl.caption + '"';
      end;

    {Total Cost}
    tempStr := tempStr + ',"' + qrlblActContrib.caption + '"';

    {Total Est Cost}
    tempStr := tempStr + ',"' + qrlblEstContrib.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSSalesInvCostfrm.prgbrExport.StepIt;
  end;

  {Clear down the job totals}
  for i := 1 to 10 do
    for j := 1 to 3 do
      JobCost[i,j] := 0;

  {Clear down the Analysis totals}
  for i := 1 to 10 do
    Analysis[i] := 0;

end;

end.
