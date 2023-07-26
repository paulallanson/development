unit PBRPRepsCatPerform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QuickRpt, Qrctrls, ExtCtrls, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPRepsCatPerformfrm = class(TForm)
    quickreport: TQuickRep;
    QRBand1: TQRBand;
    qrgReps: TQRGroup;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    qryReps: TFDQuery;
    QRSubDetail1: TQRSubDetail;
    QRBand2: TQRBand;
    qryCategory: TFDQuery;
    qrsubPeriods: TQRSubDetail;
    QRLabel2: TQRLabel;
    qryReport: TFDQuery;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrbGrpCatFooter: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    qrlblMonth1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrbGrpRepFooter: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    qrlblActTO1: TQRLabel;
    qrlblActProf1: TQRLabel;
    qrlblActTO2: TQRLabel;
    qrlblActProf2: TQRLabel;
    qrlblMonth2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlblMonth3: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrlblMonth4: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrlblMonth5: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    qrlblMonth6: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    qrlblMonth7: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    qrlblMonth8: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    qrlblMonth9: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    qrlblMonth10: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    qrlblMonth11: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    qrlblMonth12: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    qrlblActTO3: TQRLabel;
    qrlblActProf3: TQRLabel;
    qrlblActTO4: TQRLabel;
    qrlblActProf4: TQRLabel;
    qrlblActTO5: TQRLabel;
    qrlblActProf5: TQRLabel;
    qrlblActTO6: TQRLabel;
    qrlblActProf6: TQRLabel;
    qrlblActProf7: TQRLabel;
    qrlblActTO7: TQRLabel;
    qrlblBudTO1: TQRLabel;
    qrlblBudProf1: TQRLabel;
    qrlblBudTO2: TQRLabel;
    qrlblBudProf2: TQRLabel;
    qrlblBudTO3: TQRLabel;
    qrlblBudProf3: TQRLabel;
    qrlblBudTO4: TQRLabel;
    qrlblBudProf4: TQRLabel;
    qrlblBudTO5: TQRLabel;
    qrlblBudProf5: TQRLabel;
    qrlblBudTO6: TQRLabel;
    qrlblBudProf6: TQRLabel;
    qrlblBudTO7: TQRLabel;
    qrlblBudProf7: TQRLabel;
    qrlblActTO8: TQRLabel;
    qrlblBudTO8: TQRLabel;
    qrlblActProf8: TQRLabel;
    qrlblBudProf8: TQRLabel;
    qrlblActTO9: TQRLabel;
    qrlblBudTO9: TQRLabel;
    qrlblActProf9: TQRLabel;
    qrlblBudProf9: TQRLabel;
    qrlblActTO10: TQRLabel;
    qrlblBudTO10: TQRLabel;
    qrlblActProf10: TQRLabel;
    qrlblBudProf10: TQRLabel;
    qrlblActTO11: TQRLabel;
    qrlblBudTO11: TQRLabel;
    qrlblActProf11: TQRLabel;
    qrlblBudProf11: TQRLabel;
    qrlblActTO12: TQRLabel;
    qrlblActProf12: TQRLabel;
    qrlblBudTO12: TQRLabel;
    qrlblBudProf12: TQRLabel;
    qrlblCatActTOTotal: TQRLabel;
    qrlblCatBudTOTotal: TQRLabel;
    qrlblCatActProfTotal: TQRLabel;
    qrlblCatBudProfTotal: TQRLabel;
    qrlblRepActTO1: TQRLabel;
    qrlblRepBudTO1: TQRLabel;
    qrlblRepActProf1: TQRLabel;
    qrlblRepBudProf1: TQRLabel;
    qrlblRepActTO2: TQRLabel;
    qrlblRepBudTO2: TQRLabel;
    qrlblRepActProf2: TQRLabel;
    qrlblRepBudProf2: TQRLabel;
    qrlblRepActTO3: TQRLabel;
    qrlblRepBudTO3: TQRLabel;
    qrlblRepActProf3: TQRLabel;
    qrlblRepBudProf3: TQRLabel;
    qrlblRepActTO4: TQRLabel;
    qrlblRepBudTO4: TQRLabel;
    qrlblRepActProf4: TQRLabel;
    qrlblRepBudProf4: TQRLabel;
    qrlblRepActTO5: TQRLabel;
    qrlblRepBudTO5: TQRLabel;
    qrlblRepActProf5: TQRLabel;
    qrlblRepBudProf5: TQRLabel;
    qrlblRepActTO6: TQRLabel;
    qrlblRepBudTO6: TQRLabel;
    qrlblRepActProf6: TQRLabel;
    qrlblRepBudProf6: TQRLabel;
    qrlblRepActTO7: TQRLabel;
    qrlblRepBudTO7: TQRLabel;
    qrlblRepActProf7: TQRLabel;
    qrlblRepBudProf7: TQRLabel;
    qrlblRepActTO8: TQRLabel;
    qrlblRepBudTO8: TQRLabel;
    qrlblRepActProf8: TQRLabel;
    qrlblRepBudProf8: TQRLabel;
    qrlblRepActTO9: TQRLabel;
    qrlblRepBudTO9: TQRLabel;
    qrlblRepActProf9: TQRLabel;
    qrlblRepBudProf9: TQRLabel;
    qrlblRepActTO10: TQRLabel;
    qrlblRepBudTO10: TQRLabel;
    qrlblRepActProf10: TQRLabel;
    qrlblRepBudProf10: TQRLabel;
    qrlblRepActTO11: TQRLabel;
    qrlblRepBudTO11: TQRLabel;
    qrlblRepActProf11: TQRLabel;
    qrlblRepBudProf11: TQRLabel;
    qrlblRepActTO12: TQRLabel;
    qrlblRepBudTO12: TQRLabel;
    qrlblRepActProf12: TQRLabel;
    qrlblRepBudProf12: TQRLabel;
    qrlblRepActTOTotal: TQRLabel;
    qrlblRepBudTOTotal: TQRLabel;
    qrlblRepActProfTotal: TQRLabel;
    qrlblRepBudProfTotal: TQRLabel;
    qryRepCatBudgets: TFDQuery;
    qryPeriods: TFDQuery;
    qrlblTODiff1: TQRLabel;
    qrlblProfDiff1: TQRLabel;
    qrlblTODiff2: TQRLabel;
    qrlblProfDiff2: TQRLabel;
    qrlblTODiff3: TQRLabel;
    qrlblProfDiff3: TQRLabel;
    qrlblTODiff4: TQRLabel;
    qrlblProfDiff4: TQRLabel;
    qrlblTODiff5: TQRLabel;
    qrlblProfDiff5: TQRLabel;
    qrlblTODiff6: TQRLabel;
    qrlblProfDiff6: TQRLabel;
    qrlblTODiff7: TQRLabel;
    qrlblProfDiff7: TQRLabel;
    qrlblTODiff8: TQRLabel;
    qrlblProfDiff8: TQRLabel;
    qrlblTODiff9: TQRLabel;
    qrlblProfDiff9: TQRLabel;
    qrlblTODiff10: TQRLabel;
    qrlblProfDiff10: TQRLabel;
    qrlblTODiff11: TQRLabel;
    qrlblProfDiff11: TQRLabel;
    qrlblTODiff12: TQRLabel;
    qrlblProfDiff12: TQRLabel;
    qrlblTODiffTotal: TQRLabel;
    qrlblProfDiffTotal: TQRLabel;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    qrlblActTotalTO1: TQRLabel;
    qrlblBudTotalTO1: TQRLabel;
    qrlblTotalTODiff1: TQRLabel;
    qrlblActTotalProf1: TQRLabel;
    qrlblBudTotalProf1: TQRLabel;
    qrlblTotalProfDiff1: TQRLabel;
    qrlblActTotalTO2: TQRLabel;
    qrlblBudTotalTO2: TQRLabel;
    qrlblTotalTODiff2: TQRLabel;
    qrlblActTotalProf2: TQRLabel;
    qrlblBudTotalProf2: TQRLabel;
    qrlblTotalProfDiff2: TQRLabel;
    qrlblActTotalTO3: TQRLabel;
    qrlblBudTotalTO3: TQRLabel;
    qrlblTotalTODiff3: TQRLabel;
    qrlblActTotalProf3: TQRLabel;
    qrlblBudTotalProf3: TQRLabel;
    qrlblTotalProfDiff3: TQRLabel;
    qrlblActTotalTO4: TQRLabel;
    qrlblBudTotalTO4: TQRLabel;
    qrlblTotalTODiff4: TQRLabel;
    qrlblActTotalProf4: TQRLabel;
    qrlblBudTotalProf4: TQRLabel;
    qrlblTotalProfDiff4: TQRLabel;
    qrlblActTotalTO5: TQRLabel;
    qrlblActTotalProf5: TQRLabel;
    qrlblBudTotalProf5: TQRLabel;
    qrlblBudTotalTO5: TQRLabel;
    qrlblTotalTODiff5: TQRLabel;
    qrlblTotalProfDiff5: TQRLabel;
    qrlblActTotalTO6: TQRLabel;
    qrlblActTotalProf6: TQRLabel;
    qrlblBudTotalTO6: TQRLabel;
    qrlblBudTotalProf6: TQRLabel;
    qrlblTotalTODiff6: TQRLabel;
    qrlblTotalProfDiff6: TQRLabel;
    qrlblActTotalTO7: TQRLabel;
    qrlblActTotalProf7: TQRLabel;
    qrlblBudTotalProf7: TQRLabel;
    qrlblBudTotalTO7: TQRLabel;
    qrlblTotalTODiff7: TQRLabel;
    qrlblTotalProfDiff7: TQRLabel;
    qrlblActTotalTO8: TQRLabel;
    qrlblActTotalProf8: TQRLabel;
    qrlblBudTotalProf8: TQRLabel;
    qrlblBudTotalTO8: TQRLabel;
    qrlblTotalTODiff8: TQRLabel;
    qrlblTotalProfDiff8: TQRLabel;
    qrlblActTotalTO9: TQRLabel;
    qrlblBudTotalTO9: TQRLabel;
    qrlblTotalTODiff9: TQRLabel;
    qrlblActTotalProf9: TQRLabel;
    qrlblBudTotalProf9: TQRLabel;
    qrlblTotalProfDiff9: TQRLabel;
    qrlblActTotalTO10: TQRLabel;
    qrlblActTotalProf10: TQRLabel;
    qrlblBudTotalProf10: TQRLabel;
    qrlblBudTotalTO10: TQRLabel;
    qrlblTotalTODiff10: TQRLabel;
    qrlblTotalProfDiff10: TQRLabel;
    qrlblActTotalTO11: TQRLabel;
    qrlblActTotalProf11: TQRLabel;
    qrlblBudTotalProf11: TQRLabel;
    qrlblBudTotalTO11: TQRLabel;
    qrlblTotalTODiff11: TQRLabel;
    qrlblTotalProfDiff11: TQRLabel;
    qrlblActTotalTO12: TQRLabel;
    qrlblActTotalProf12: TQRLabel;
    qrlblBudTotalProf12: TQRLabel;
    qrlblBudTotalTO12: TQRLabel;
    qrlblTotalTODiff12: TQRLabel;
    qrlblTotalProfDiff12: TQRLabel;
    qrlblActTotalTO: TQRLabel;
    qrlblBudTotalTo: TQRLabel;
    qrlblTotalTODiff: TQRLabel;
    qrlblActTotalProf: TQRLabel;
    qrlblBudTotalProf: TQRLabel;
    qrlblTotalProfDiff: TQRLabel;
    procedure quickreportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsubPeriodsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgRepsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGrpCatFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGrpRepFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Rep: integer;
    Category: integer;
    categorySales: array [1..24] of real;
    categoryProfit: array [1..24] of real;
    categorySalesBudget: array [1..24] of real;
    categoryProfitBudget: array [1..24] of real;
    RepSales: array [1..24] of real;
    RepProfit: array [1..24] of real;
    RepSalesBudget: array [1..24] of real;
    RepProfitBudget: array [1..24] of real;
    TotalSales: array [1..24] of real;
    TotalProfit: array [1..24] of real;
    TotalSalesBudget: array [1..24] of real;
    TotalProfitBudget: array [1..24] of real;
    PeriodHeaders: array [1..24] of string;
  public
    PrinterSettings: TPrinterSettings;
    SelRepCode: integer;
    StartPeriod, FinishPeriod: integer;
    procedure GetDetails(Sender: TObject);
  end;

var
  PBRPRepsCatPerformfrm: TPBRPRepsCatPerformfrm;

implementation

{$R *.DFM}

procedure TPBRPRepsCatPerformfrm.GetDetails(Sender: TObject);
begin
  with qryReps do
    begin
      close;
      parambyname('Rep').asinteger := SelRepCode;
      open;
    end;

  with qryCategory do
    begin
      close;
      open;
    end;

end;

procedure TPBRPRepsCatPerformfrm.quickreportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  i: integer;
begin
   with quickreport.PrinterSettings do
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
  with qryPeriods do
    begin
      close;
      parambyname('Start_Period').asinteger := StartPeriod;
      parambyname('Finish_Period').asinteger := FinishPeriod;
      open;
      first;
      while eof <> true do
        begin
          i := (fieldbyname('Period').asinteger - startPeriod) + 1;
          PeriodHeaders[i] := fieldbyname('Description').asstring;
          next;
        end;
    end;

  for i := 1 to 24 do
    begin
      TotalSales[i] := 0;
      TotalProfit[i] := 0;
      TotalSalesBudget[i] := 0;
      TotalProfitBudget[i] := 0;
    end;


end;

procedure TPBRPRepsCatPerformfrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Rep := qryReps.fieldbyname('Rep').asinteger;
end;

procedure TPBRPRepsCatPerformfrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: integer;
begin
  for i := 1 to 24 do
    begin
      categorySales[i] := 0;
      categoryProfit[i] := 0;
      categorySalesBudget[i] := 0;
      categoryProfitBudget[i] := 0;
    end;

  Category := qryCategory.fieldbyname('Category').asinteger;
// Get the budgets for this rep and category

  with qryRepCatBudgets do
    begin
      close;
      parambyname('Rep').asinteger := Rep;
      parambyname('Category').asinteger := Category;
      parambyname('Start_Period').asinteger := StartPeriod;
      parambyname('Finish_Period').asinteger := FinishPeriod;
      open;
      first;
      while eof <> true do
        begin
          i := (fieldbyname('Period').asinteger - startPeriod) + 1;
          categorySalesBudget[i] := fieldbyname('Turnover_Value').asfloat;
          categoryProfitBudget[i] := fieldbyname('Profit_Value').asfloat;
          next;
        end;
    end;
// Get the sales figures
  with qryReport do
    begin
      close;
      parambyname('Rep').asinteger := Rep;
      parambyname('Category').asinteger := Category;
      open;
      qrSubPeriods.enabled := (recordcount > 0);
    end;
  QRSubDetail1.height := 0;
  QRSubPeriods.height := 0;
end;

procedure TPBRPRepsCatPerformfrm.qrsubPeriodsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempPeriod: integer;
begin
  tempperiod := (qryReport.fieldbyname('Sel2').asinteger - startPeriod) + 1;
  categorySales[tempPeriod] := categorySales[tempPeriod] + qryReport.fieldbyname('sel4').asfloat;
  categoryProfit[tempPeriod] := categoryProfit[tempPeriod] + (qryReport.fieldbyname('sel4').asfloat - qryReport.fieldbyname('sel5').asfloat);
end;

procedure TPBRPRepsCatPerformfrm.qrgRepsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  for i := 1 to 24 do
    begin
      RepSales[i] := 0;
      RepProfit[i] := 0;
      RepSalesBudget[i] := 0;
      RepProfitBudget[i] := 0;
    end;

end;

procedure TPBRPRepsCatPerformfrm.qrbGrpCatFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: integer;
  rActualSalesTotal, rActualProfitTotal, rBudgetSalesTotal, rBudgetProfitTotal: real;
  templbl: TQRLabel;
begin
  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblActTO' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',categorySales[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblActProf' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',categoryProfit[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblBudTO' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',categorySalesBudget[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblBudProf' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',categoryProfitBudget[i]);
      except
      end;
    end;

// Show Category total Sales
  rActualSalesTotal := 0;
  for i := 1 to 24 do
    begin
      rActualSalesTotal := rActualSalesTotal + categorySales[i];
      qrlblCatActTOTotal.caption := formatfloat('#,##0',rActualSalesTotal);
    end;

// Show Category total profit
  rActualProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rActualProfitTotal := rActualProfitTotal + categoryProfit[i];
      qrlblCatActProfTotal.caption := formatfloat('#,##0',rActualProfitTotal);
    end;

// Show Category Budget Sales
  rBudgetSalesTotal := 0;
  for i := 1 to 24 do
    begin
      rBudgetSalesTotal := rBudgetSalesTotal + categorySalesBudget[i];
      qrlblCatBudTOTotal.caption := formatfloat('#,##0',rBudgetSalesTotal);
    end;
// Show Category total Sales
  rBudgetProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rBudgetProfitTotal := rBudgetProfitTotal + categoryProfitBudget[i];
      qrlblCatBudProfTotal.caption := formatfloat('#,##0',rBudgetProfitTotal);
    end;

// Create Actual sales Totals for the Rep
  for i := 1 to 24 do
    begin
      RepSales[i] := RepSales[i] + categorySales[i];
    end;

// Create Actual profit Totals for the Rep
  for i := 1 to 24 do
    begin
      RepProfit[i] := RepProfit[i] + categoryProfit[i];
    end;

// Create Budget sales Totals for the Rep
  for i := 1 to 24 do
    begin
      RepSalesBudget[i] := RepSalesBudget[i] + categorySalesBudget[i];
    end;

// Create Budget profit Totals for the Rep
  for i := 1 to 24 do
    begin
      RepProfitBudget[i] := RepProfitBudget[i] + categoryProfitBudget[i];
    end;
end;

procedure TPBRPRepsCatPerformfrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  templbl: TQRLabel;
begin
  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblMonth' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := PeriodHeaders[i];
      except
      end;
    end;

end;

procedure TPBRPRepsCatPerformfrm.qrbGrpRepFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: integer;
  templbl: TQRLabel;
  tempValue: real;
  rRepActualSalesTotal, rRepActualProfitTotal, rRepBudgetSalesTotal, rRepBudgetProfitTotal: real;
begin
  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblRepActTO' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',RepSales[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblRepActProf' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',RepProfit[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblRepBudTO' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',RepSalesBudget[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblRepBudProf' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',RepProfitBudget[i]);
      except
      end;
    end;

// Show % Difference in Actual Sales and Budget sales
  TempValue := 0;
  for i := 1 to 24 do
    begin
      try
        TempValue := ((RepSales[i] - RepSalesBudget[i])/RepSalesBudget[i])*100;
      except
        TempValue := 0;
      end;
      templbl := ((FindComponent('qrlblTODiff' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TempValue);
      except
      end;
    end;

// Show % Difference in Actual Profit and Budget Profit
  TempValue := 0;
  for i := 1 to 24 do
    begin
      try
        TempValue := ((RepProfit[i] - RepProfitBudget[i])/RepProfitBudget[i])*100;
      except
        TempValue := 0;
      end;
      templbl := ((FindComponent('qrlblProfDiff' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TempValue);
      except
      end;
    end;

// Show Category total profit
  rRepActualProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rRepActualProfitTotal := rRepActualProfitTotal + RepProfit[i];
      qrlblRepActProfTotal.caption := formatfloat('#,##0',rRepActualProfitTotal);
    end;


// Show Category total Sales
  rRepActualSalesTotal := 0;
  for i := 1 to 24 do
    begin
      rRepActualSalesTotal := rRepActualSalesTotal + RepSales[i];
      qrlblRepActTOTotal.caption := formatfloat('#,##0',rRepActualSalesTotal);
    end;

// Show Category total profit
  rRepActualProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rRepActualProfitTotal := rRepActualProfitTotal + RepProfit[i];
      qrlblRepActProfTotal.caption := formatfloat('#,##0',rRepActualProfitTotal);
    end;

// Show Category Budget Sales
  rRepBudgetSalesTotal := 0;
  for i := 1 to 24 do
    begin
      rRepBudgetSalesTotal := rRepBudgetSalesTotal + RepSalesBudget[i];
      qrlblRepBudTOTotal.caption := formatfloat('#,##0',rRepBudgetSalesTotal);
    end;
// Show Category total Sales
  rRepBudgetProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rRepBudgetProfitTotal := rRepBudgetProfitTotal + RepProfitBudget[i];
      qrlblRepBudProfTotal.caption := formatfloat('#,##0',rRepBudgetProfitTotal);
    end;

// Show TOTAL % Difference in Actual Sales and Budget sales
  TempValue := 0;
  try
    TempValue := ((rRepActualSalesTotal - rRepBudgetSalesTotal)/rRepBudgetSalesTotal)*100;
  except
    TempValue := 0;
  end;

  qrlblTODiffTotal.Caption := formatfloat('#,##0',TempValue);

// Show TOTAL % Difference in Actual Sales and Budget sales
  TempValue := 0;
  try
    TempValue := ((rRepActualProfitTotal - rRepBudgetProfitTotal)/rRepBudgetProfitTotal)*100;
  except
    TempValue := 0;
  end;

  qrlblProfDiffTotal.Caption := formatfloat('#,##0',TempValue);

// Create Actual sales Report Totals
  for i := 1 to 24 do
    begin
      TotalSales[i] := TotalSales[i] + RepSales[i];
    end;

// Create Actual profit Report Totals
  for i := 1 to 24 do
    begin
      TotalProfit[i] := TotalProfit[i] + RepProfit[i];
    end;

// Create Budget sales Report Totals
  for i := 1 to 24 do
    begin
      TotalSalesBudget[i] := TotalSalesBudget[i] + RepSalesBudget[i];
    end;

// Create Budget profit Report Totals
  for i := 1 to 24 do
    begin
      TotalProfitBudget[i] := TotalProfitBudget[i] + RepProfitBudget[i];
    end;
end;

procedure TPBRPRepsCatPerformfrm.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  templbl: TQRLabel;
  tempValue: real;
  rActualSalesTotal, rActualProfitTotal, rBudgetSalesTotal, rBudgetProfitTotal: real;
begin
  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblActTotalTO' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TotalSales[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblActTotalProf' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TotalProfit[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblBudTotalTO' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TotalSalesBudget[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblBudTotalProf' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TotalProfitBudget[i]);
      except
      end;
    end;

// Show % Difference in Actual Sales and Budget sales
  TempValue := 0;
  for i := 1 to 24 do
    begin
      try
        TempValue := ((TotalSales[i] - TotalSalesBudget[i])/TotalSalesBudget[i])*100;
      except
        TempValue := 0;
      end;
      templbl := ((FindComponent('qrlblTotalTODiff' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TempValue);
      except
      end;
    end;

// Show % Difference in Actual Profit and Budget Profit
  TempValue := 0;
  for i := 1 to 24 do
    begin
      try
        TempValue := ((TotalProfit[i] - TotalProfitBudget[i])/TotalProfitBudget[i])*100;
      except
        TempValue := 0;
      end;
      templbl := ((FindComponent('qrlblTotalProfDiff' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TempValue);
      except
      end;
    end;

// Show total Sales
  rActualSalesTotal := 0;
  for i := 1 to 24 do
    begin
      rActualSalesTotal := rActualSalesTotal + TotalSales[i];
      qrlblActTotalTO.caption := formatfloat('#,##0',rActualSalesTotal);
    end;

// Show total profit
  rActualProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rActualProfitTotal := rActualProfitTotal + TotalProfit[i];
      qrlblActTotalProf.caption := formatfloat('#,##0',rActualProfitTotal);
    end;

// Show Budget Sales
  rBudgetSalesTotal := 0;
  for i := 1 to 24 do
    begin
      rBudgetSalesTotal := rBudgetSalesTotal + TotalSalesBudget[i];
      qrlblBudTotalTO.caption := formatfloat('#,##0',rBudgetSalesTotal);
    end;

// Show total Sales
  rBudgetProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rBudgetProfitTotal := rBudgetProfitTotal + TotalProfitBudget[i];
      qrlblBudTotalProf.caption := formatfloat('#,##0',rBudgetProfitTotal);
    end;

// Show TOTAL % Difference in Actual Sales and Budget sales
  TempValue := 0;
  try
    TempValue := ((rActualSalesTotal - rBudgetSalesTotal)/rBudgetSalesTotal)*100;
  except
    TempValue := 0;
  end;

  qrlblTotalTODiff.Caption := formatfloat('#,##0',TempValue);

// Show TOTAL % Difference in Actual Sales and Budget sales
  TempValue := 0;
  try
    TempValue := ((rActualProfitTotal - rBudgetProfitTotal)/rBudgetProfitTotal)*100;
  except
    TempValue := 0;
  end;

  qrlblTotalProfDiff.Caption := formatfloat('#,##0',TempValue);
end;

end.
