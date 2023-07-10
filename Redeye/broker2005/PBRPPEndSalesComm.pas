unit PBRPPEndSalesComm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, DBTables, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects;

type
  TPBRPPEndSalesCommFrm = class(TForm)
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
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    RepGrpFoot: TQRBand;
    RepQRGroup: TQRGroup;
    qrbSummary: TQRBand;
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
    qrgrpCategory: TQRGroup;
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
    GetCommRtQuery: TQuery;
    qrbCategoryFooter: TQRChildBand;
    qrbRepTotals: TQRChildBand;
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
    qrbRepSummary: TQRChildBand;
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
    qryGetRepComm: TQuery;
    qrlblInvoice: TQRLabel;
    qrlblCommRate: TQRLabel;
    QRLabel1: TQRLabel;
    TotCatCommLbl: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel19: TQRLabel;
    qrlblBonus: TQRLabel;
    TotalBonusProdSumm: TQRLabel;
    qryGetRepBudget: TQuery;
    qrlblBudgetTO: TQRLabel;
    qrlblBudgetProfit: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    qrlblTODiff: TQRLabel;
    qrlblTODiffPerc: TQRLabel;
    qrlblProfitDiff: TQRLabel;
    qrlblProfitDiffPerc: TQRLabel;
    QRShape8: TQRShape;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    qrdbtxtCategory: TQRDBText;
    qrdbTxtCategoryFooter: TQRDBText;
    procedure qckrpSalesByInvBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure RepGrpFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrbSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepGrpFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBndProdCatGrpFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBndInvGrpFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpCategoryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBndInvGrpFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBndProdCatGrpFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure RepQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbRepSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbRepSummaryAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRChldBndCatSummAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    fTotalByRep: Boolean;
    fTotalByCust: Boolean;
    FtotalBySupp: Boolean;
    fCommbycat: Boolean;
    fIsSummary: Boolean;
    fRepPgBrk: Boolean;
    FBudgetType: integer;
    FRepType: integer;
    FExcludeJBCosts: boolean;
    FSortBy: integer;
    FtotalByCategory: Boolean;
    procedure setTotalByCust(const Value: Boolean);
    procedure setTotalByRep(const Value: Boolean);
    procedure SettotalBySupp(const Value: Boolean);
    procedure SetcommbyCat(const Value: Boolean);
    procedure setIsSummary(const Value: Boolean);
    procedure setRepPgBrk(const Value: Boolean);
    procedure SetBudgetType(const Value: integer);
    procedure SetRepType(const Value: integer);
    procedure SetExcludeJBCosts(const Value: boolean);
    procedure SetSortBy(const Value: integer);
    procedure SettotalByCategory(const Value: Boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    RepsCommOnPaidInvs: boolean;
    FinancialYear: integer;
    property BudgetType: integer read FBudgetType write SetBudgetType;
    property ExcludeJBCosts: boolean read FExcludeJBCosts write SetExcludeJBCosts;
    property RepType: integer read FRepType write SetRepType;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalByCategory : Boolean read FtotalByCategory write SettotalByCategory;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    property commbycat: Boolean read fCommbycat write SetcommbyCat;
    property IsSummary: Boolean read fIsSummary write setIsSummary;
    property RepPgBrk: Boolean read fRepPgBrk write setRepPgBrk;
    property SortBy: integer read FSortBy write SetSortBy;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPPEndSalesCommFrm: TPBRPPEndSalesCommFrm;

implementation

uses PBRSSalesComm, PBRSPEndRepsCommission;

var
  rTotalGoods4Rep, rTotalCost4Rep, rTotalComm4Rep, rInvCost, rInvGoods, rCost, rGoods, rComm: real;
  RepTotal_Sell, RepTotal_Cost, RepTotal_Comm, comm_Rate: real;
  commBasis, commType: string;

{$R *.DFM}

procedure TPBRPPEndSalesCommFrm.qckrpSalesByInvBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rTotalGoods4Rep := 0;
  rTotalCost4Rep := 0;
  rTotalComm4Rep := 0;
  RepTotal_Sell := 0;
  RepTotal_Cost := 0;
  RepTotal_Comm := 0;
  rComm := 0;
  if IsSummary then
    begin
      qrbCategoryFooter.ParentBand := nil;
      qrbRepTotals.ParentBand := nil;
      RepQRGroup.ForceNewPage := RepPgBrk;
      Qrlabel2.Caption := '';
      QRLabel5.caption := 'Rep';
      QRLabel3.caption := '';
      QRLabel15.caption := '';
      QRLabel16.caption := '';
      QRLabel17.caption := '';
      QRLabel9.caption := '';
      QRLabel14.caption := '';
      qrgrpCategory.height := 0;
      QRBndInvGrpFoot.Height := 0;
      qrdbTxtCategoryFooter.DataField:= 'Description';
    end
  else
    begin
      QRChldBndCatSumm.ParentBand := nil;
      qrbRepSummary.ParentBand := qrbRepTotals;
      QRShape7.enabled := false;
      QRLabel7.caption := '% Customer Responsibility';
//        QRLabelComm.enabled := false;

      if TotalByCust then
        begin
          qrgrpCategory.enabled := True;
          qrbCategoryFooter.enabled := True;
          qrgrpCategory.Expression := 'QRYSalesComm.Name';
          qrdbtxtCategory.DataField:= 'Name';
          qrdbTxtCategoryFooter.DataField:= 'Name';
        end
      else
      if TotalByCategory then
        begin
          qrgrpCategory.enabled := True;
          qrbCategoryFooter.enabled := True;
          qrgrpCategory.Expression := 'QRYSalesComm.Description';
          qrdbtxtCategory.DataField:= 'Description';
          qrdbTxtCategoryFooter.DataField:= 'Description';
        end
      else
        begin
          qrgrpCategory.enabled := false;
          qrbCategoryFooter.enabled := false;
          qrgrpCategory.Expression := 'QRYSalesComm.Sales_invoice_Number';
          qrdbtxtCategory.DataField:= '';
          qrdbTxtCategoryFooter.DataField:= '';
        end;

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

  qrySalesComm.Open;

  if TotalByRep then
    begin
      RepGrpFoot.enabled := True;
      RepQRGroup.Expression := 'QRYSalesComm.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
    end;
end;

procedure TPBRPPEndSalesCommFrm.RepGrpFootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
(*  if not IsSummary then
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
    end
*)
  TotalGoodsLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep));
  TotalCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalCost4Rep));
  GrpMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep)-rTotalCost4Rep);
  TotalCommLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalComm4Rep));

  TotalGoodsLblRepSumm.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep));
  TotalCostLblRepSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalCost4Rep));
  GrpMargQRLblRepSumm.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep)-rTotalCost4Rep);
  TotalCommLblRepSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalComm4Rep));
end;

procedure TPBRPPEndSalesCommFrm.FormCreate(Sender: TObject);
begin
  rTotalGoods4Rep := 0;
  rTotalCost4Rep := 0;
  rTotalComm4Rep := 0;
  RepTotal_Sell := 0;
  RepTotal_Cost := 0;
  RepTotal_Comm := 0;
end;

procedure TPBRPPEndSalesCommFrm.qrbSummaryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepTotGoodsQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(RepTotal_Sell));
  RepTotCostQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Cost);
   RepMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
  RepTotCommLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Comm);
   end;

procedure TPBRPPEndSalesCommFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPPEndSalesCommFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPPEndSalesCommFrm.RepGrpFootAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  RepTotal_Sell := RepTotal_Sell + rTotalGoods4Rep;
  RepTotal_Cost := RepTotal_Cost + rTotalCost4Rep;
  RepTotal_Comm := RepTotal_Comm + rTotalComm4Rep;
end;

procedure TPBRPPEndSalesCommFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPPEndSalesCommFrm.ChildBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TPBRPPEndSalesCommFrm.QRBndProdCatGrpFootBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if not IsSummary then
  begin
    QRLblTotPrdGoods.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rGoods));
    QRLblTotPrdCst.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCost));
    QRLblTotPrdMrg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rGoods)-rCost);
    TotCatCommLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rComm));
    TotalCommLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rComm));
  end
  else
  begin
    QRLblTotPrdGoodsSumm.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rGoods));
    QRLblTotPrdCstSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCost));
    QRLblTotPrdMrgSumm.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rGoods)-rCost);
    TotalCommLblProdSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rComm));
  end;

end;

procedure TPBRPPEndSalesCommFrm.SetcommbyCat(const Value: Boolean);
begin
  fCommbycat := Value;
end;

procedure TPBRPPEndSalesCommFrm.QRBndInvGrpFootBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rInvComm : real;
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
    rInvComm := ((rInvGoods - rInvCost)*(comm_rate/100))  // based on Gross Profit
  else
    rInvComm := ((rInvGoods)*(comm_rate/100));  // based on turnover

  CommissionLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rInvComm);
  rComm := rComm + rInvcomm;
end;

procedure TPBRPPEndSalesCommFrm.qrgrpCategoryBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  CatDescription: string;
begin
  printband := not(issummary);

(*  if qrysalesComm.FieldByName('Description').Asstring = '' then
    CatDescription := 'No Category'
  else
    CatDescription := qrysalesComm.FieldByName('Description').Asstring;

  lblCommission.caption := CatDescription;

  QRLblCat.Caption := CatDescription;
*)
end;

procedure TPBRPPEndSalesCommFrm.QRBndInvGrpFootAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
begin
  if self.exporting  and not IsSummary then
  begin
    //repName
    tempStr := '"' + qrySalesComm.fieldbyname('Rep_Name').asString + '"';

    //customer name
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Name').asstring + '"';

    //Category
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Description').asstring + '"';

    //invoice description
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Invoice_Description').asstring + '"';

    //invoice no
    if qrySalesComm.fieldbyname('Invoice_or_Credit').asstring = 'C' then
      tempStr := tempStr + ',"CN/'+ qrySalesComm.fieldbyname('Sales_invoice_no').asstring + '"'
    else
      tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Sales_invoice_no').asstring + '"';

    //invoice date
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Invoice_Date').asString + '"';

    //account code
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Account_Code').asString + '"';

    //selling price
    tempStr := tempStr + ',"' + TotGoodsqrlbl.caption + '"';

    //cost price
    tempStr := tempStr + ',"' + TotCstQRLbl.Caption + '"';

    //gross profit margin
    tempStr := tempStr + ',"' + MargQRLbl.Caption + '"';

    //Commission %
    tempStr := tempStr + ',"' + qrlblCommRate.Caption + '"';

    //Commission Value
    tempStr := tempStr + ',"' + CommissionLbl.Caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSPEndRepsCommissionFrm.prgbrExport.StepIt;
  end;

  rCost := rCost + rInvCost;
  rGoods := rGoods + rInvGoods;
  rInvGoods := 0.;
  rInvCost := 0.;
end;

procedure TPBRPPEndSalesCommFrm.QRBndProdCatGrpFootAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rTotalGoods4Rep := rTotalGoods4Rep + rGoods;
  rTotalCost4Rep := rTotalCost4Rep + rCost;
  rTotalComm4Rep := rTotalComm4Rep + rComm;
  rComm := 0;
  rGoods := 0;
  rCost := 0;
end;

procedure TPBRPPEndSalesCommFrm.setIsSummary(const Value: Boolean);
begin
  fIsSummary := Value;
end;

procedure TPBRPPEndSalesCommFrm.setRepPgBrk(const Value: Boolean);
begin
  fRepPgBrk := Value;
end;

procedure TPBRPPEndSalesCommFrm.RepQRGroupBeforePrint(
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

  with qryGetRepComm do
    begin
      close;
      parambyname('Rep').asinteger := qrysalesComm.FieldByName('Rep').AsInteger;
      parambyname('Financial_year').asinteger := FinancialYear;
      open;

      comm_rate := fieldbyname('Commission_Rate').asfloat;
      commBasis := 'P';

      qrlblCommRate.Caption := formatfloat('0.00',comm_rate) + '%';
      qrlabelComm.Caption := formatfloat('0.00',comm_rate) + '%';
    end;

  with qryGetRepBudget do
    begin
      close;
      parambyname('Rep').asinteger := qrysalesComm.FieldByName('Rep').AsInteger;
      parambyname('Period').asinteger := qrysalesComm.FieldByName('Period').AsInteger;
      open;
    end;
end;

procedure TPBRPPEndSalesCommFrm.qrbRepSummaryBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  BudgetTO, BudgetProfit, DiffTO, DiffProfit, DiffTOPerc, DiffProfitPerc: real;
begin
    BudgetTO := qryGetRepBudget.fieldbyname('Turnover_Value').asfloat;

    case BudgetType of
      0:  BudgetProfit := qryGetRepBudget.fieldbyname('Operating_Profit_Value').asfloat;
      1:  BudgetProfit := qryGetRepBudget.fieldbyname('Profit_Value').asfloat;
    end;

    qrlblBudgetTO.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',BudgetTO);
    qrlblBudgetProfit.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',BudgetProfit);

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

    qrlblTODiff.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(DiffTO));
    qrlblProfitDiff.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(DiffProfit));
    qrlblTODiffPerc.Caption := formatfloat('£###,##0.00%;(£#,###,##0.00%)',(DiffTOPerc));
    qrlblProfitDiffPerc.Caption := formatfloat('£###,##0.00%;(£#,###,##0.00%)',(DiffProfitPerc));

end;

procedure TPBRPPEndSalesCommFrm.qrbRepSummaryAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rTotalGoods4Rep := 0;
  rTotalCost4Rep := 0;
  rTotalComm4Rep := 0;
end;

procedure TPBRPPEndSalesCommFrm.SetBudgetType(const Value: integer);
begin
  FBudgetType := Value;
end;

procedure TPBRPPEndSalesCommFrm.SetRepType(const Value: integer);
begin
  FRepType := Value;
end;

procedure TPBRPPEndSalesCommFrm.SetExcludeJBCosts(const Value: boolean);
begin
  FExcludeJBCosts := Value;
end;

procedure TPBRPPEndSalesCommFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if isSummary then
    tempStr := '"Rep"'
    + ',"Category"'
    + ',"Goods Total"'
    + ',"Cost Price"'
    + ',"Gross Profit"'
    + ',"Commission %"'
    + ',"Commission Value"'
  else
    tempStr := '"Rep"'
    + ',"Customer"'
    + ',"Category"'
    + ',"Description"'
    + ',"Inv. No."'
    + ',"Inv. Date"'
    + ',"Account Code"'
    + ',"Goods Total"'
    + ',"Cost Price"'
    + ',"Gross Profit"'
    + ',"Commission %"'
    + ',"Commission Value"';

  writeLn(self.exportFile, tempStr);
  self.qckrpSalesByInv.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPPEndSalesCommFrm.SetSortBy(const Value: integer);
begin
  FSortBy := Value;
end;

procedure TPBRPPEndSalesCommFrm.SettotalByCategory(const Value: Boolean);
begin
  FtotalByCategory := Value;
end;

procedure TPBRPPEndSalesCommFrm.QRChldBndCatSummAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
begin
  if self.exporting and IsSummary then
  begin
    //repName
    tempStr := '"' + qrySalesComm.fieldbyname('Rep_Name').asString + '"';

    //Category
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Description').asstring + '"';

    //selling price
    tempStr := tempStr + ',"' + QRLblTotPrdGoodsSumm.caption + '"';

    //cost price
    tempStr := tempStr + ',"' + QRLblTotPrdCstSumm.Caption + '"';

    //gross profit margin
    tempStr := tempStr + ',"' + QRLblTotPrdMrgSumm.Caption + '"';

    //Commission %
    tempStr := tempStr + ',"' + QRLabelComm.Caption + '"';

    //Commission Value
    tempStr := tempStr + ',"' + TotalCommLblProdSumm.Caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSPEndRepsCommissionFrm.prgbrExport.StepIt;
  end;
end;

end.
