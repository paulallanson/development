unit PBRPPEndCatPerform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QuickRpt, Qrctrls, ExtCtrls, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPPEndCatPerformfrm = class(TForm)
    quickreport: TQuickRep;
    QRBand1: TQRBand;
    qrgReps: TQRGroup;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    qryCategories: TFDQuery;
    QRSubDetail1: TQRSubDetail;
    QRBand2: TQRBand;
    qrySortBy: TFDQuery;
    qrsubPeriods: TQRSubDetail;
    QRLabel2: TQRLabel;
    qryReport: TFDQuery;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrbGrpCatFooter: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    qrlblMonth1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrbGrpRepFooter: TQRBand;
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
    qrlblActTO8: TQRLabel;
    qrlblActProf8: TQRLabel;
    qrlblActTO9: TQRLabel;
    qrlblActProf9: TQRLabel;
    qrlblActTO10: TQRLabel;
    qrlblActProf10: TQRLabel;
    qrlblActTO11: TQRLabel;
    qrlblActProf11: TQRLabel;
    qrlblActTO12: TQRLabel;
    qrlblActProf12: TQRLabel;
    qrlblCatActTOTotal: TQRLabel;
    qrlblCatActProfTotal: TQRLabel;
    qrlblRepActTO1: TQRLabel;
    qrlblRepActProf1: TQRLabel;
    qrlblRepActTO2: TQRLabel;
    qrlblRepActProf2: TQRLabel;
    qrlblRepActTO3: TQRLabel;
    qrlblRepActProf3: TQRLabel;
    qrlblRepActTO4: TQRLabel;
    qrlblRepActProf4: TQRLabel;
    qrlblRepActTO5: TQRLabel;
    qrlblRepActProf5: TQRLabel;
    qrlblRepActTO6: TQRLabel;
    qrlblRepActProf6: TQRLabel;
    qrlblRepActTO7: TQRLabel;
    qrlblRepActProf7: TQRLabel;
    qrlblRepActTO8: TQRLabel;
    qrlblRepActProf8: TQRLabel;
    qrlblRepActTO9: TQRLabel;
    qrlblRepActProf9: TQRLabel;
    qrlblRepActTO10: TQRLabel;
    qrlblRepActProf10: TQRLabel;
    qrlblRepActTO11: TQRLabel;
    qrlblRepActProf11: TQRLabel;
    qrlblRepActTO12: TQRLabel;
    qrlblRepActProf12: TQRLabel;
    qrlblRepActTOTotal: TQRLabel;
    qrlblRepActProfTotal: TQRLabel;
    qryPeriods: TFDQuery;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    qrlblActTotalTO1: TQRLabel;
    qrlblActTotalProf1: TQRLabel;
    qrlblActTotalTO2: TQRLabel;
    qrlblActTotalProf2: TQRLabel;
    qrlblActTotalTO3: TQRLabel;
    qrlblActTotalProf3: TQRLabel;
    qrlblActTotalTO4: TQRLabel;
    qrlblActTotalProf4: TQRLabel;
    qrlblActTotalTO5: TQRLabel;
    qrlblActTotalProf5: TQRLabel;
    qrlblActTotalTO6: TQRLabel;
    qrlblActTotalProf6: TQRLabel;
    qrlblActTotalTO7: TQRLabel;
    qrlblActTotalProf7: TQRLabel;
    qrlblActTotalTO8: TQRLabel;
    qrlblActTotalProf8: TQRLabel;
    qrlblActTotalTO9: TQRLabel;
    qrlblActTotalProf9: TQRLabel;
    qrlblActTotalTO10: TQRLabel;
    qrlblActTotalProf10: TQRLabel;
    qrlblActTotalTO11: TQRLabel;
    qrlblActTotalProf11: TQRLabel;
    qrlblActTotalTO12: TQRLabel;
    qrlblActTotalProf12: TQRLabel;
    qrlblActTotalTO: TQRLabel;
    qrlblActTotalProf: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qryDummy: TFDQuery;
    qrySalesProfit: TFDQuery;
    qrytmpConsolidate: TFDQuery;
    qrytmpCategories: TFDQuery;
    qryDummyConsolidate: TFDQuery;
    qryDummyCustomer: TFDQuery;
    qryDummyCategory: TFDQuery;
    qrySalesProfitLoc: TFDQuery;
    qrySalesProfitCust: TFDQuery;
    qryDummyCust: TFDQuery;
    qryDummyConsolidateCust: TFDQuery;
    qryCustRep: TFDQuery;
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
    procedure qrbGrpCatFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbGrpRepFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    SortBy: integer;
    Category: integer;
    SortBySales: array [1..24] of real;
    SortByProfit: array [1..24] of real;
    SortBySalesBudget: array [1..24] of real;
    SortByProfitBudget: array [1..24] of real;
    RepSales: array [1..24] of real;
    RepProfit: array [1..24] of real;
    RepSalesBudget: array [1..24] of real;
    RepProfitBudget: array [1..24] of real;
    TotalSales: array [1..24] of real;
    TotalProfit: array [1..24] of real;
    TotalComm: array [1..24] of real;
    TotalSalesBudget: array [1..24] of real;
    TotalProfitBudget: array [1..24] of real;
    PeriodHeaders: array [1..24] of string;
    function GetCurrentRep(tempCode: integer): string;
  public
    bConsolidate, bShowRep: boolean;
    totbyLoc, TotbyCust: boolean;
    exporting: boolean;
    exportFile: textFile;
    PrinterSettings: TPrinterSettings;
    SelRepCode: integer;
    FinancialYear: integer;
    StartPeriod, FinishPeriod: integer;
    function GetDetails(Sender: TObject): integer;
    function GetSalesDetails(Sender: TObject): integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPPEndCatPerformfrm: TPBRPPEndCatPerformfrm;

implementation

{$R *.DFM}

uses PBRSPEndCatPerform;

function TPBRPPEndCatPerformfrm.GetDetails(Sender: TObject): integer;
begin
  if bConsolidate then
    begin
      with qryCategories do
        begin
          close;
          sql.Clear;
          sql.Text := qrytmpConsolidate.SQL.Text;
          parambyname('Start').asinteger := StartPeriod;
          parambyname('Finish').asinteger := FinishPeriod;
          open;
          result := recordcount;
        end;
    end
  else
    begin
      with qryCategories do
        begin
          close;
          sql.Clear;
          sql.Text := qrytmpCategories.SQL.Text;
          parambyname('Category').asinteger := SelRepCode;
          parambyname('Start').asinteger := StartPeriod;
          parambyname('Finish').asinteger := FinishPeriod;
          open;
          result := recordcount;
        end;
    end;

  if TotbyLoc then
    begin
      with qrySortBy do
        begin
          close;
          open;
        end;
    end
  else
    begin
      with qrySortBy do
        begin
          close;
          sql.Text := qryDummyCustomer.SQL.Text;
          parambyname('Category').asinteger := SelRepCode;
          parambyname('Start').asinteger := StartPeriod;
          parambyname('Finish').asinteger := FinishPeriod;
          open;
        end;
    end
end;

function TPBRPPEndCatPerformfrm.GetSalesDetails(Sender: TObject): integer;
begin
  with qrySalesProfit do
    begin
      close;
      if TotbyLoc then
        sql.Text := qrySalesProfitLoc.sql.Text
      else
        sql.Text := qrySalesProfitCust.sql.Text;

      parambyname('Category').asinteger := SelRepCode;
      parambyname('Start').asinteger := StartPeriod;
      parambyname('Finish').asinteger := FinishPeriod;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPPEndCatPerformfrm.quickreportBeforePrint(
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
      TotalComm[i] := 0;
      TotalSalesBudget[i] := 0;
      TotalProfitBudget[i] := 0;
    end;
end;

procedure TPBRPPEndCatPerformfrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Category := qryCategories.fieldbyname('Category').asinteger;
end;

procedure TPBRPPEndCatPerformfrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: integer;
begin
  for i := 1 to 24 do
    begin
      SortBySales[i] := 0;
      SortByProfit[i] := 0;
      SortBySalesBudget[i] := 0;
      SortByProfitBudget[i] := 0;
    end;

  SortBy := qrySortBy.fieldbyname('SortBy_Code').asinteger;

  // Get the sales figures
  if bConsolidate then
    begin
      with qryReport do
        begin
          close;
          if TotByLoc then
            sql.Text := qryDummyConsolidate.SQL.Text
          else
            sql.Text := qryDummyConsolidateCust.SQL.Text;
          parambyname('Sortby').asinteger := Sortby;
          parambyname('Start').asinteger := StartPeriod;
          parambyname('Finish').asinteger := FinishPeriod;
          open;
          qrSubPeriods.enabled := (recordcount > 0);
        end;
    end
  else
    begin
      with qryReport do
        begin
          close;
          if TotbyLoc then
            sql.Text := qryDummy.SQL.Text
          else
            sql.Text := qryDummyCust.SQL.Text;
          parambyname('SortBy').asinteger := SortBy;
          parambyname('Category').asinteger := Category;
          parambyname('Start').asinteger := StartPeriod;
          parambyname('Finish').asinteger := FinishPeriod;
          open;
          qrSubPeriods.enabled := (recordcount > 0);
        end;
    end;

  QRSubDetail1.height := 0;
  QRSubPeriods.height := 0;
end;

procedure TPBRPPEndCatPerformfrm.qrsubPeriodsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempPeriod: integer;
begin
  tempperiod := (qryReport.fieldbyname('Period').asinteger - startPeriod) + 1;
  SortBySales[tempPeriod] := SortBySales[tempPeriod] + qryReport.fieldbyname('Total_Sales').asfloat;
  SortByProfit[tempPeriod] := SortByProfit[tempPeriod] + (qryReport.fieldbyname('Total_Sales').asfloat - qryReport.fieldbyname('Total_Cost').asfloat);
end;

procedure TPBRPPEndCatPerformfrm.qrgRepsBeforePrint(Sender: TQRCustomBand;
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

procedure TPBRPPEndCatPerformfrm.qrbGrpCatFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: integer;
  rActualSalesTotal, rActualProfitTotal, rBudgetSalesTotal, rBudgetProfitTotal, rNewSalesTotal, rNewProfitTotal: real;
  templbl: TQRLabel;
begin
  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblActTO' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',SortBySales[i]);
      except
      end;
    end;


  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblActProf' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',SortByProfit[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblBudTO' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',SortBySalesBudget[i]);
      except
      end;
    end;

  for i := 1 to 24 do
    begin
      templbl := ((FindComponent('qrlblBudProf' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',SortByProfitBudget[i]);
      except
      end;
    end;

// Show Sort by total Sales
  rActualSalesTotal := 0;
  for i := 1 to 24 do
    begin
      rActualSalesTotal := rActualSalesTotal + SortBySales[i];
      qrlblCatActTOTotal.caption := formatfloat('#,##0',rActualSalesTotal);
    end;

// Show sort by total profit
  rActualProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rActualProfitTotal := rActualProfitTotal + SortByProfit[i];
      qrlblCatActProfTotal.caption := formatfloat('#,##0',rActualProfitTotal);
    end;

// Show sort by Budget Sales
  rBudgetSalesTotal := 0;
  for i := 1 to 24 do
    begin
      rBudgetSalesTotal := rBudgetSalesTotal + SortBySalesBudget[i];
//      qrlblCatBudTOTotal.caption := formatfloat('#,##0',rBudgetSalesTotal);
    end;

// Show sort by total Sales
  rBudgetProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rBudgetProfitTotal := rBudgetProfitTotal + SortByProfitBudget[i];
//      qrlblCatBudProfTotal.caption := formatfloat('#,##0',rBudgetProfitTotal);
    end;

    // Create Actual sales Totals for the Rep
  for i := 1 to 24 do
    begin
      RepSales[i] := RepSales[i] + SortBySales[i];
    end;

// Create Actual profit Totals for the Rep
  for i := 1 to 24 do
    begin
      RepProfit[i] := RepProfit[i] + SortByProfit[i];
    end;
end;

procedure TPBRPPEndCatPerformfrm.QRBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TPBRPPEndCatPerformfrm.qrbGrpRepFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: integer;
  templbl: TQRLabel;
  tempValue: real;
  rRepActualSalesTotal, rRepActualProfitTotal, rRepBudgetSalesTotal, rRepBudgetProfitTotal, rRepActualCommTotal: real;
  rCommission: real;
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
      templbl := ((FindComponent('qrlblComm' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',(RepProfit[i]*(rCommission/100)));
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

// Show Rep total profit
  rRepActualProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rRepActualProfitTotal := rRepActualProfitTotal + RepProfit[i];
      qrlblRepActProfTotal.caption := formatfloat('#,##0',rRepActualProfitTotal);
    end;

// Show Rep total Sales
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

// Create Actual profit Report Totals
  for i := 1 to 24 do
    begin
      TotalComm[i] := TotalComm[i] + (RepProfit[i]*(rCommission/100));
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

procedure TPBRPPEndCatPerformfrm.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  templbl: TQRLabel;
  tempValue: real;
  rActualSalesTotal, rActualProfitTotal, rBudgetSalesTotal, rBudgetProfitTotal, rActualCommTotal: real;
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
      templbl := ((FindComponent('qrlblTotalComm' + IntToStr(i))) as TQRLabel);
      try
        templbl.Caption := formatfloat('#,##0',TotalComm[i]);
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
    end;
  qrlblActTotalTO.caption := formatfloat('#,###,##0',rActualSalesTotal);

// Show total profit
  rActualProfitTotal := 0;
  for i := 1 to 24 do
    begin
      rActualProfitTotal := rActualProfitTotal + TotalProfit[i];
    end;
  qrlblActTotalProf.caption := formatfloat('#,##0',rActualProfitTotal);

end;

procedure TPBRPPEndCatPerformfrm.ExportToFile(fileName: string);
var
  tempStr: string;
  i: integer;
  tmpLabel: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

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

  tempstr := tempstr + '""' + ',""';

  for i := 1 to 12 do
    begin
      tempStr := tempstr + ',"' + PeriodHeaders[i] + '","' + PeriodHeaders[i]+ '"';
    end;
  tempstr := tempstr + ',"Total YTD"' + ',"Total YTD"';
  if TotbyCust then
    tempstr := tempstr + ',"Rep"';
  writeLn(self.exportFile, tempStr);

  if TotbyLoc then
    tmpLabel := ',"Revenue Centre"'
  else
    tmpLabel := ',"Customer"';

  tempstr := '"Category"' + tmpLabel;
  for i := 0 to 12 do
    begin
      tempStr := tempstr + ',"Turnover"' + ',"Profit"';
    end;

  writeLn(self.exportFile, tempStr);
  quickreport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPPEndCatPerformfrm.qrbGrpCatFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
  templbl: TQRLabel;
  i: integer;
begin
  if self.exporting then
  begin
    //Category
    tempStr := '"' + qryCategories.fieldbyname('Category_Description').asstring + '"';

    //Sort by
    tempStr := tempStr + ',"' + qrySortBy.fieldByName('Sortby_Description').asString + '"';

    for i := 1 to 12 do
      begin
        //turnover
        templbl := ((FindComponent('qrlblActTO' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',SortBySales[i]);
        except
        end;

        tempStr := tempStr + ',"' + templbl.caption + '"';

        //Profit
        templbl := ((FindComponent('qrlblActProf' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',SortByProfit[i]);
        except
        end;
        tempStr := tempStr + ',"' + templbl.caption + '"';
      end;

    tempStr := tempStr + ',"' + qrlblCatActTOTotal.caption + '"';
    tempStr := tempStr + ',"' + qrlblCatActProfTotal.caption + '"';

    if TotbyCust then
      tempstr := tempstr + ',"' + GetCurrentRep(qrySortBy.fieldbyname('Sortby_Code').asinteger) + '"';

    writeln(self.exportFile, tempStr);
    PBRSPEndCatPerformfrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPPEndCatPerformfrm.qrbGrpRepFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
  templbl: TQRLabel;
  i: integer;
begin
  if self.exporting then
  begin
    //Category
    tempStr := '"' + qryCategories.fieldbyname('Category_Description').asstring + ' Totals"';

    //Selection Type
    tempStr := tempStr + ',"' + '' + '"';

    for i := 1 to 12 do
      begin
        //turnover
        templbl := ((FindComponent('qrlblRepActTO' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',RepSales[i]);
        except
        end;

        tempStr := tempStr + ',"' + templbl.caption + '"';

        //Profit
        templbl := ((FindComponent('qrlblRepActProf' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',RepProfit[i]);
        except
        end;
        tempStr := tempStr + ',"' + templbl.caption + '"';
      end;

    tempStr := tempStr + ',"' + qrlblRepActTOTotal.caption + '"';
    tempStr := tempStr + ',"' + qrlblRepActProfTotal.caption + '"';

    writeln(self.exportFile, tempStr);

    tempStr := '';
    writeln(self.exportFile, tempStr);
  end;
end;

procedure TPBRPPEndCatPerformfrm.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr: string;
  templbl: TQRLabel;
  i: integer;
begin
  if self.exporting then
  begin
    //category
    tempStr := '"' + 'Company Totals' + '"';

    //Sort by
    tempStr := tempStr + ',"' + '' + '"';

    for i := 1 to 12 do
      begin
        //turnover
        templbl := ((FindComponent('qrlblActTotalTO' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',TotalSales[i]);
        except
        end;

        tempStr := tempStr + ',"' + templbl.caption + '"';

        //Profit
        templbl := ((FindComponent('qrlblActTotalProf' + IntToStr(i))) as TQRLabel);
        try
          templbl.Caption := formatfloat('#,##0',TotalProfit[i]);
        except
        end;
        tempStr := tempStr + ',"' + templbl.caption + '"';
      end;

    tempStr := tempStr + ',"' + qrlblActTotalTO.caption + '"';
    tempStr := tempStr + ',"' + qrlblActTotalProf.caption + '"';

    writeln(self.exportFile, tempStr);
  end;
end;

procedure TPBRPPEndCatPerformfrm.FormCreate(Sender: TObject);
begin
  TotbyCust := false;
  TotbyLoc := false;
end;

function TPBRPPEndCatPerformfrm.GetCurrentRep(tempCode: integer): string;
begin
  with qryCustRep do
    begin
      close;
      parambyname('Customer').asinteger := tempCode;
      open;
      result := fieldbyname('Rep_Name').asstring;
    end;
end;

end.
