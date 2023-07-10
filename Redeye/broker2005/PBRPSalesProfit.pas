unit PBRPSalesProfit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, DBTables, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects;

type
  TPBRPSalesProfitFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrySalesProfit: TQuery;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    qrdbtxtGoodsValue: TQRDBText;
    QRBand1: TQRBand;
    QRLabel18: TQRLabel;
    TotalSellLbl: TQRLabel;
    QRShape1: TQRShape;
    RepQRGroup: TQRGroup;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    RepTotSellQRLbl: TQRLabel;
    GrpByQRDBText: TQRDBText;
    TotalCostLbl: TQRLabel;
    RepTotCostQRLbl: TQRLabel;
    MarginQRLabel: TQRLabel;
    MargQRLbl: TQRLabel;
    GrpMargQRLbl: TQRLabel;
    RepMargQRLbl: TQRLabel;
    qrdbtxtCostValue: TQRDBText;
    qrdbCustomer: TQRDBText;
    qrdbSupplier: TQRDBText;
    qrlblOrder: TQRLabel;
    qrlblDescription: TQRLabel;
    QRSysData2: TQRSysData;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrySalesProfitCost_ValueGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesProfitSales_ValueGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportfile: textfile;
    fTotalByRep: Boolean;
    fTotalByCust: Boolean;
    FtotalBySupp: Boolean;
    FtotalByAccTeam: Boolean;
    procedure setTotalByCust(const Value: Boolean);
    procedure setTotalByRep(const Value: Boolean);
    procedure SettotalBySupp(const Value: Boolean);
    procedure SettotalByAccTeam(const Value: Boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    PeriodName: string;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property totalByAccTeam: Boolean read FtotalByAccTeam write SettotalByAccTeam;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    function GetDetails: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPSalesProfitFrm: TPBRPSalesProfitFrm;

implementation

uses
  PBPeriodEndDM, PBRSPEndRepsProfit;
  
var
  iTotal_Sell, iTotal_vat, iTotal_Cost: real;
  RepTotal_Sell, RepTotal_vat, RepTotal_Cost: real;

{$R *.DFM}

procedure TPBRPSalesProfitFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;
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
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}
  qrySalesProfit.Open;
  if TotalByCust then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesProfit.Customer';
      GrpByQRDBText.DataField := 'Name';
      end;
  if TotalBySupp then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesProfit.Supplier_Name';
      GrpByQRDBText.DataField := 'Supplier_Name';
      end;
  if TotalByRep then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'qrySalesProfit.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
      end;
  if TotalByAccTeam then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'qrySalesProfit.Account_Team_Name';
      GrpByQRDBText.DataField:= 'Account_Team_Name';
      end;
  end;

procedure TPBRPSalesProfitFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (qrySalesProfit.fieldbyname('Job_Bag').asstring <> '') then
    begin
      qrlblOrder.caption := qrySalesProfit.fieldbyname('Job_Bag').asstring;
      if (qrySalesProfit.fieldbyname('Purchase_order').asstring <> '') then
        qrlblDescription.caption := 'Purchase Order: '+qrySalesProfit.fieldbyname('Purchase_order').asstring
      else
        qrlblDescription.caption := 'Job bag sundry';
    end
  else
  if (qrySalesProfit.fieldbyname('Purchase_order').asstring <> '') then
    begin
      qrlblOrder.caption := qrySalesProfit.fieldbyname('purchase_order').asstring ;
      if frac(qrySalesProfit.fieldbyname('purchase_order').asfloat) <> 0 then
        qrlblDescription.caption := 'Print Call Off'
      else
        qrlblDescription.caption := 'Direct Supplied Print Job';
    end
  else
  if (qrySalesProfit.fieldbyname('Sales_order').asstring <> '') then
    begin
      qrlblOrder.caption := qrySalesProfit.fieldbyname('sales_order').asstring;
      if dmPeriodEnd.GetSOReplen(qrySalesProfit.fieldbyname('sales_order').asinteger) = 'S' then
        qrlblDescription.caption := 'Stationery Order'
      else
        qrlblDescription.caption := 'Print Call Off';
    end;

  iTotal_Sell := iTotal_Sell + qrySalesProfit.fieldbyname('Sales_Value').asfloat;
  RepTotal_Sell := RepTotal_Sell + qrySalesProfit.fieldbyname('Sales_Value').asfloat;

  itotal_Cost := itotal_Cost + qrySalesProfit.fieldbyname('Cost_Value').asfloat;
  repTotal_Cost := RepTotal_Cost + qrySalesProfit.fieldbyname('Cost_Value').asfloat;

  MargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',qrySalesProfit.fieldbyname('Sales_Value').asfloat - qrySalesProfit.fieldbyname('Cost_Value').asfloat);
end;

procedure TPBRPSalesProfitFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalSellLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Sell);
  TotalCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Cost));
  GrpMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(iTotal_Sell)-iTotal_Cost);
  end;

procedure TPBRPSalesProfitFrm.FormCreate(Sender: TObject);
begin
  dmPeriodEnd := TdmPeriodEnd.create(self);
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0
end;

procedure TPBRPSalesProfitFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepTotSellQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Sell);
  RepTotCostQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Cost);
   RepMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
   end;

procedure TPBRPSalesProfitFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPSalesProfitFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPSalesProfitFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
iTotal_Sell := 0;
iTotal_Vat := 0;
iTotal_Cost := 0;
end;

procedure TPBRPSalesProfitFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPSalesProfitFrm.qrySalesProfitCost_ValueGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qrySalesProfit.fieldbyname('Cost_Value').asstring = '' then
    text := '0.00'
  else
    text := formatfloat('0.00',qrySalesProfit.fieldbyname('Cost_Value').asfloat);
end;

procedure TPBRPSalesProfitFrm.qrySalesProfitSales_ValueGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qrySalesProfit.fieldbyname('Sales_Value').asstring = '' then
    text := '0.00'
  else
    text := formatfloat('0.00',qrySalesProfit.fieldbyname('Sales_Value').asfloat);
end;

procedure TPBRPSalesProfitFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPeriodEnd.free;
end;

function TPBRPSalesProfitFrm.GetDetails: integer;
begin
  with qrySalesProfit do
    begin
      close;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPSalesProfitFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Period"';

  if TotalByRep then
    tempstr := tempstr + ',"Rep"'
  else
    tempstr := tempstr + ',"Account Team"';

  tempstr := tempstr
    + ',"Job/Order"'
    + ',"Customer"'
    + ',"Description"'
    + ',"Sales"'
    + ',"Cost"'
    + ',"Profit"'
    + ',"Profit %"'
    + ',"Supplier"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPSalesProfitFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Period
    tempStr := '"' + PeriodName + '"';

    //Rep
    if totalbyRep then
      tempStr := tempStr + ',"' + qrySalesProfit.fieldbyname('Rep_Name').asstring + '"'
    else
      tempStr := tempStr + ',"' + qrySalesProfit.fieldbyname('Account_Team_Name').asstring + '"';

    //job Bag Order
    tempStr := tempStr + ',"' + qrlblOrder.caption + '"';

    //Customer
    tempStr := tempStr + ',"' + qrySalesProfit.fieldbyname('Customer_Name').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + qrlblDescription.caption + '"';

    //Sales
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',qrySalesProfit.fieldbyname('Sales_Value').asfloat) + '"';

    //Cost
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',qrySalesProfit.fieldbyname('Cost_Value').asfloat) + '"';

    //Profit
    tempStr := tempStr + ',"' + MargQRLbl.caption + '"';

    //Supplier
    tempStr := tempStr + ',"' + qrySalesProfit.fieldbyname('Supplier_Name').asstring + '"';

    writeln(self.exportFile, tempStr);
    PBRSPEndRepsProfitFrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPSalesProfitFrm.SettotalByAccTeam(const Value: Boolean);
begin
  FtotalByAccTeam := Value;
end;

end.
