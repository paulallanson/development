unit PBRPPEndRepsCatComm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, DBTables, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects;

type
  TPBRPPEndRepsCatCommFrm = class(TForm)
    qckrpSalesByInv: TQuickRep;
    qrySalesComm: TQuery;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    RepGrpFoot: TQRBand;
    RepQRGroup: TQRGroup;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    RepTotGoodsQRLbl: TQRLabel;
    GrpByQRDBText: TQRDBText;
    RepTotCostQRLbl: TQRLabel;
    MarginQRLabel: TQRLabel;
    RepMargQRLbl: TQRLabel;
    QRLabel6: TQRLabel;
    RepTotCommLbl: TQRLabel;
    QRShape4: TQRShape;
    QRDtlBnd: TQRBand;
    ChildBand1: TQRChildBand;
    QRGroupProdCat: TQRGroup;
    QRBndProdCatGrpFoot: TQRBand;
    QRGrpInv: TQRGroup;
    QRBndInvGrpFoot: TQRBand;
    qrdbtxtCustomer: TQRDBText;
    qrdbtxtCustsDesc: TQRDBText;
    qrdbtxtAccCode: TQRDBText;
    TotGoodsQRLbl: TQRLabel;
    TotCstQRLbl: TQRLabel;
    MargQRLbl: TQRLabel;
    qrdbtxtInvDate: TQRDBText;
    Commissionlbl: TQRLabel;
    lblCommission: TQRLabel;
    GetCommRtQuery: TQuery;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    QRLabel4: TQRLabel;
    QRLblTotPrdGoods: TQRLabel;
    QRLblTotPrdCst: TQRLabel;
    QRLblTotPrdMrg: TQRLabel;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    QRLabel18: TQRLabel;
    TotalGoodsLbl: TQRLabel;
    TotalCostLbl: TQRLabel;
    GrpMargQRLbl: TQRLabel;
    TotalCommLbl: TQRLabel;
    QRShape3: TQRShape;
    QRChldBndCatSumm: TQRChildBand;
    QRChldBndRepSumm: TQRChildBand;
    QRLblCat: TQRLabel;
    QRLblTotPrdGoodsSumm: TQRLabel;
    QRLblTotPrdCstSumm: TQRLabel;
    QRLblTotPrdMrgSumm: TQRLabel;
    TotalCommLblProdSumm: TQRLabel;
    TotalGoodsLblRepSumm: TQRLabel;
    TotalCostLblRepSumm: TQRLabel;
    GrpMargQRLblRepSumm: TQRLabel;
    TotalCommLblRepSumm: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRLabelComm: TQRLabel;
    qrlblCommSplit: TQRLabel;
    qryRepFinance: TQuery;
    qryGetRepCatComm: TQuery;
    qrlblInvoice: TQRLabel;
    qrlblCommRate: TQRLabel;
    QRLabel1: TQRLabel;
    TotCatCommLbl: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel19: TQRLabel;
    qrlblBonus: TQRLabel;
    TotalBonusProdSumm: TQRLabel;
    qryGetRepCatBudget: TQuery;
    qrlblBudgetTO: TQRLabel;
    qrlblBudgetProfit: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape8: TQRShape;
    qrlblTODiff: TQRLabel;
    qrlblProfitDiff: TQRLabel;
    QRLabel24: TQRLabel;
    qrlblTODiffPerc: TQRLabel;
    QRLabel25: TQRLabel;
    qrlblProfitDiffPerc: TQRLabel;
    QRLabel22: TQRLabel;
    qrlblCommType: TQRLabel;
    QRChldBndCatSumm1: TQRChildBand;
    qrlblCommType1: TQRLabel;
    QRLblCat1: TQRLabel;
    QRLblTotPrdGoodsSumm1: TQRLabel;
    QRLblTotPrdCstSumm1: TQRLabel;
    QRLblTotPrdMrgSumm1: TQRLabel;
    TotalCommLblProdSumm1: TQRLabel;
    QRLabelComm1: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRChldBndRepSumm1: TQRChildBand;
    QRLabel23: TQRLabel;
    qrlblBudgetTO1: TQRLabel;
    qrlblBudgetProfit1: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    qrlblTODiff1: TQRLabel;
    qrlblTODiffPerc1: TQRLabel;
    qrlblProfitDiff1: TQRLabel;
    qrlblProfitDiffPerc1: TQRLabel;
    QRShape9: TQRShape;
    qryGetRepBudget: TQuery;
    QRLabel26: TQRLabel;
    procedure qckrpSalesByInvBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure RepGrpFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepGrpFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBndProdCatGrpFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBndInvGrpFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupProdCatBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBndInvGrpFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBndProdCatGrpFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure RepQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    fTotalByRep: Boolean;
    fTotalByCust: Boolean;
    FtotalBySupp: Boolean;
    fCommbycat: Boolean;
    fIsSummary: Boolean;
    fRepPgBrk: Boolean;
    procedure setTotalByCust(const Value: Boolean);
    procedure setTotalByRep(const Value: Boolean);
    procedure SettotalBySupp(const Value: Boolean);
    procedure SetcommbyCat(const Value: Boolean);
    procedure setIsSummary(const Value: Boolean);
    procedure setRepPgBrk(const Value: Boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    RepsCommOnPaidInvs: boolean;
    FinancialYear: integer;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    property commbycat: Boolean read fCommbycat write SetcommbyCat;
    property IsSummary: Boolean read fIsSummary write setIsSummary;
    property RepPgBrk: Boolean read fRepPgBrk write setRepPgBrk;
  end;

var
  PBRPPEndRepsCatCommFrm: TPBRPPEndRepsCatCommFrm;

implementation

uses PBRSSalesComm, pbDatabase;

var
  rTotalGoods4Rep, rTotalCost4Rep, rTotalComm4Rep, rInvCost, rInvGoods, rCatCost, rCatGoods, rcatcomm: real;
  RepTotal_Sell, RepTotal_Cost, RepTotal_Comm, comm_Rate: real;
  commBasis, commType: string;

{$R *.DFM}

procedure TPBRPPEndRepsCatCommFrm.qckrpSalesByInvBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rTotalGoods4Rep := 0;
  rTotalCost4Rep := 0;
  rTotalComm4Rep := 0;
  RepTotal_Sell := 0;
  RepTotal_Cost := 0;
  RepTotal_Comm := 0;
  rCatComm := 0;
  if IsSummary then
    begin
      ChildBand2.ParentBand := nil;
      ChildBand3.ParentBand := nil;
      RepQRGroup.ForceNewPage := RepPgBrk;
      Qrlabel2.Caption := '';
      QRLabel5.caption := 'Rep';
      QRLabel3.caption := '';
      QRLabel15.caption := '';
      QRLabel16.caption := '';
      QRLabel17.caption := '';
      QRLabel9.caption := '';
      QRLabel14.caption := '';
      QRGroupprodcat.height := 0;
      QRBndInvGrpFoot.Height := 0;
    end
  else
      begin
        QRChldBndCatSumm.ParentBand := nil;
        QRChldBndRepSumm.ParentBand := nil;
        QRShape7.enabled := false;
        QRLabel7.caption := '% Customer Responsibility';
//        QRLabelComm.enabled := false;
      end;

   with qckrpSalesByInv.PrinterSettings do
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
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}
  qrySalesComm.Open;
  if TotalByRep then
    begin
      RepGrpFoot.enabled := True;
      RepQRGroup.Expression := 'QRYSalesComm.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
      end;
  if dmBroker.GetFYBudgetType(FinancialYear) = 'C' then
    begin
      QRChldBndCatSumm.parentband := QRBndProdCatGrpFoot;
      QRChldBndCatSumm1.parentband := nil;
    end
  else
    begin
      QRChldBndCatSumm.parentband := nil;
      QRChldBndCatSumm1.parentband := QRBndProdCatGrpFoot;
    end;
end;

procedure TPBRPPEndRepsCatCommFrm.RepGrpFootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  BudgetTO, BudgetProfit, DiffTO, DiffProfit, DiffTOPerc, DiffProfitPerc: real;
begin
  if not IsSummary then
    begin
      TotalGoodsLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep));
      TotalCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalCost4Rep));
      GrpMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep)-rTotalCost4Rep);
      TotalCommLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalComm4Rep));
    end
  else
    begin
      TotalGoodsLblRepSumm.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep));
      TotalCostLblRepSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalCost4Rep));
      GrpMargQRLblRepSumm.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep)-rTotalCost4Rep);
      TotalCommLblRepSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalComm4Rep));


      with qryGetRepBudget do
        begin
          close;
          parambyname('Rep').asinteger := qrysalesComm.FieldByName('Rep').AsInteger;
          parambyname('Period').asinteger := qrysalesComm.FieldByName('Period').AsInteger;
          open;
        end;

      BudgetTO := qryGetRepBudget.fieldbyname('Turnover_Value').asfloat;
      BudgetProfit := qryGetRepBudget.fieldbyname('Profit_Value').asfloat;

      qrlblBudgetTO1.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',BudgetTO);
      qrlblBudgetProfit1.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',BudgetProfit);

      DiffTO := rTotalGoods4Rep-BudgetTO;
      DiffProfit := (rTotalGoods4Rep-rTotalCost4Rep)-BudgetProfit;
      try
        DiffTOPerc := (DiffTO/BudgetTO)*100;
      except
        DiffTOPerc := 999.99;
      end;

      try
        DiffProfitPerc := (DiffProfit/BudgetProfit)*100;
      except
        DiffProfitPerc := 999.99;
      end;

      qrlblTODiff1.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(DiffTO));
      qrlblProfitDiff1.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(DiffProfit));
      qrlblTODiffPerc1.Caption := formatfloat('###,##0.00%;(#,###,##0.00%)',(DiffTOPerc));
      qrlblProfitDiffPerc1.Caption := formatfloat('###,##0.00%;(#,###,##0.00%)',(DiffProfitPerc));
    end
end;

procedure TPBRPPEndRepsCatCommFrm.FormCreate(Sender: TObject);
begin
  rTotalGoods4Rep := 0;
  rTotalCost4Rep := 0;
  rTotalComm4Rep := 0;
  RepTotal_Sell := 0;
  RepTotal_Cost := 0;
  RepTotal_Comm := 0;
end;

procedure TPBRPPEndRepsCatCommFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepTotGoodsQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(RepTotal_Sell));
  RepTotCostQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Cost);
   RepMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
  RepTotCommLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Comm);
   end;

procedure TPBRPPEndRepsCatCommFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPPEndRepsCatCommFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPPEndRepsCatCommFrm.RepGrpFootAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
RepTotal_Sell := RepTotal_Sell + rTotalGoods4Rep;
RepTotal_Cost := RepTotal_Cost + rTotalCost4Rep;
RepTotal_Comm := RepTotal_Comm + rTotalComm4Rep;
rTotalGoods4Rep := 0;
rTotalCost4Rep := 0;
rTotalComm4Rep := 0;
end;

procedure TPBRPPEndRepsCatCommFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPPEndRepsCatCommFrm.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rCost :real;
  rComm :real;
  rGoods : real;
  iQty: integer;
  raddcost: real;
  rResponsibility: real;
begin
  rCost := qrySalesComm.fieldbyname('Total_Cost_Value').asfloat;
  rGoods := qrySalesComm.fieldbyname('Total_Sales_Value').asfloat;

  if qrySalesComm.FieldByName('Rep_Responsibility').asfloat = 0 then
    rResponsibility := 100
  else
    rResponsibility := qrySalesComm.FieldByName('Rep_Responsibility').asfloat;

  qrlblCommSplit.caption := formatfloat('0',rResponsibility);

  rCost := rCost * (rResponsibility/100);
  rGoods := rGoods * (rResponsibility/100);

  rInvCost := rInvCost + rCost;
  rInvGoods := rInvGoods + rGoods;
end;

procedure TPBRPPEndRepsCatCommFrm.QRBndProdCatGrpFootBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  BudgetTO, BudgetProfit, DiffTO, DiffProfit, DiffTOPerc, DiffProfitPerc: real;
begin
  if not IsSummary then
  begin
    QRLblTotPrdGoods.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rCatGoods));
    QRLblTotPrdCst.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatCost));
    QRLblTotPrdMrg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rCatGoods)-rCatCost);
    TotCatCommLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatComm));
    TotalCommLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatComm));
  end
  else
  begin
    QRLblTotPrdGoodsSumm.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rCatGoods));
    QRLblTotPrdCstSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatCost));
    QRLblTotPrdMrgSumm.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rCatGoods)-rCatCost);
    TotalCommLblProdSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatComm));

    QRLblTotPrdGoodsSumm1.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rCatGoods));
    QRLblTotPrdCstSumm1.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatCost));
    QRLblTotPrdMrgSumm1.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rCatGoods)-rCatCost);
    TotalCommLblProdSumm1.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatComm));

    BudgetTO := qryGetRepCatBudget.fieldbyname('Turnover_Value').asfloat;
    BudgetProfit := qryGetRepCatBudget.fieldbyname('Profit_Value').asfloat;

    qrlblBudgetTO.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',BudgetTO);
    qrlblBudgetProfit.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',BudgetProfit);

    DiffTO := rCatGoods-BudgetTO;
    DiffProfit := (rCatGoods-rCatCost)-BudgetProfit;
    try
      DiffTOPerc := (DiffTO/BudgetTO)*100;
    except
      DiffTOPerc := 999.99;
    end;

    try
      DiffProfitPerc := (DiffProfit/BudgetProfit)*100;
    except
      DiffProfitPerc := 999.99;
    end;

    qrlblTODiff.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(DiffTO));
    qrlblProfitDiff.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(DiffProfit));
    qrlblTODiffPerc.Caption := formatfloat('###,##0.00%;(#,###,##0.00%)',(DiffTOPerc));
    qrlblProfitDiffPerc.Caption := formatfloat('###,##0.00%;(#,###,##0.00%)',(DiffProfitPerc));
  end;
end;

procedure TPBRPPEndRepsCatCommFrm.SetcommbyCat(const Value: Boolean);
begin
  fCommbycat := Value;
end;

procedure TPBRPPEndRepsCatCommFrm.QRBndInvGrpFootBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
rcomm : real;
begin
  printband := not(issummary);
  if qrySalesComm.fieldbyname('Sales_invoice_no').asstring = 'C' then
    qrlblInvoice.caption := 'CN/'+qrySalesComm.fieldbyname('Sales_invoice_no').asstring
  else
    qrlblInvoice.caption := qrySalesComm.fieldbyname('Sales_invoice_no').asstring;
    
  TotGoodsQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvGoods);
  TotCstQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvCost);
  MargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rInvGoods - rInvCost);

  {Work out commission based on either Gross Profit or Turnover}
  if commBasis = 'P' then
    rComm := ((rInvGoods - rInvCost)*(comm_rate/100))  // based on Gross Profit
  else
    rComm := ((rInvGoods)*(comm_rate/100));  // based on turnover

  CommissionLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rComm);
  rCatComm := rCatComm + rcomm;
end;

procedure TPBRPPEndRepsCatCommFrm.QRGroupProdCatBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  CatDescription: string;
begin
  printband := not(issummary);

  if qrysalesComm.FieldByName('Description').Asstring = '' then
    CatDescription := 'No Category'
  else
    CatDescription := qrysalesComm.FieldByName('Description').Asstring;

  lblCommission.caption := CatDescription;

  QRLblCat.Caption := CatDescription;
  QRLblCat1.Caption := CatDescription;

  with qryGetRepCatComm do
    begin
      close;
      parambyname('Rep').asinteger := qrysalesComm.FieldByName('Rep').AsInteger;
      parambyname('Financial_year').asinteger := FinancialYear;
      parambyname('Category').asinteger := qrysalesComm.FieldByName('Category').AsInteger;
      open;

      comm_rate := fieldbyname('Commission_Rate').asfloat;
      if commType = 'V' then
        begin
          if fieldbyname('Commission_Basis').AsString = 'T' then
            commBasis := 'T'
          else
            commBasis := 'P';
        end
      else
        commBasis := 'P';

      qrlblCommRate.Caption := formatfloat('0.00',comm_rate) + '%';
      qrlabelComm.Caption := formatfloat('0.00',comm_rate) + '%';

      qrlabelComm1.Caption := formatfloat('0.00',comm_rate) + '%';
      if CommBasis = 'T' then
        qrlblCommType.Caption := 'Turnover'
      else
        qrlblCommType.Caption := 'Profit';
      qrlblCommType1.caption := qrlblCommType.Caption;
    end;

  with qryGetRepCatBudget do
    begin
      close;
      parambyname('Rep').asinteger := qrysalesComm.FieldByName('Rep').AsInteger;
      parambyname('Period').asinteger := qrysalesComm.FieldByName('Period').AsInteger;
      parambyname('Category').asinteger := qrysalesComm.FieldByName('Category').AsInteger;
      open;
    end;
end;

procedure TPBRPPEndRepsCatCommFrm.QRBndInvGrpFootAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rCatCost := rCatCost + rInvCost;
  rCatGoods := rCatGoods + rInvGoods;
  rInvGoods := 0.;
  rInvCost := 0.;
end;

procedure TPBRPPEndRepsCatCommFrm.QRBndProdCatGrpFootAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
rTotalGoods4Rep := rTotalGoods4Rep + rCatGoods;
rTotalCost4Rep := rTotalCost4Rep + rCatCost;
rTotalComm4Rep := rTotalComm4Rep + rCatComm;
rCatComm := 0;
rCatGoods := 0;
rCatCost := 0;
end;

procedure TPBRPPEndRepsCatCommFrm.setIsSummary(const Value: Boolean);
begin
  fIsSummary := Value;
end;

procedure TPBRPPEndRepsCatCommFrm.setRepPgBrk(const Value: Boolean);
begin
  fRepPgBrk := Value;
end;

procedure TPBRPPEndRepsCatCommFrm.RepQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  with qryRepFinance do
    begin
      close;
      parambyname('rep').asinteger := qrySalesComm.fieldbyname('Rep').asinteger;
      parambyname('financial_year').asinteger  := FinancialYear;
      open;
      CommType := fieldbyname('Commission_type').asstring;
    end;
end;

end.
