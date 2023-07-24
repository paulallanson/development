unit PBRPSalesProfitSumm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, DBTables, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects,
  gtQrCtrls;

type
  TPBRPSalesProfitSummFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrySalesProfit: TQuery;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    qrdbtxtGoodsValue: TQRDBText;
    QRBand1: TQRBand;
    QRLabel18: TQRLabel;
    TotalSellLbl: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    RepTotSellQRLbl: TQRLabel;
    TotalCostLbl: TQRLabel;
    RepTotCostQRLbl: TQRLabel;
    MarginQRLabel: TQRLabel;
    MargQRLbl: TQRLabel;
    GrpMargQRLbl: TQRLabel;
    RepMargQRLbl: TQRLabel;
    qrdbtxtCostValue: TQRDBText;
    QRDBText3: TQRDBText;
    qrdbName: TQRDBText;
    qrlblName: TQRLabel;
    gtQRSysData1: TQRSysData;
    gtQRSysData2: TQRSysData;
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
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalByAccTeam: Boolean read FtotalByAccTeam write SettotalByAccTeam;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    function GetDetails: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPSalesProfitSummFrm: TPBRPSalesProfitSummFrm;

implementation

uses
  PBPeriodEndDM, PBRSPEndRepsProfit;

var
  iTotal_Sell, iTotal_vat, iTotal_Cost: real;
  RepTotal_Sell, RepTotal_vat, RepTotal_Cost: real;

{$R *.DFM}

procedure TPBRPSalesProfitSummFrm.qrpDetailsBeforePrint(
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
  if TotalbyRep then
    begin
      qrdbName.DataField := 'Rep_Name';
      qrlblName.caption := 'Rep';
    end
  else
  if TotalbyAccTeam then
    begin
      qrdbName.DataField := 'Team_Name';
      qrlblName.caption := 'Account Team';
    end;

  qrySalesProfit.Close;
  qrySalesProfit.Open;
end;

procedure TPBRPSalesProfitSummFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  iTotal_Sell := iTotal_Sell + qrySalesProfit.fieldbyname('Sales_Value').asfloat;
  RepTotal_Sell := RepTotal_Sell + qrySalesProfit.fieldbyname('Sales_Value').asfloat;

  itotal_Cost := itotal_Cost + qrySalesProfit.fieldbyname('Cost_Value').asfloat;
  repTotal_Cost := RepTotal_Cost + qrySalesProfit.fieldbyname('Cost_Value').asfloat;

  MargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',qrySalesProfit.fieldbyname('Sales_Value').asfloat - qrySalesProfit.fieldbyname('Cost_Value').asfloat);
end;

procedure TPBRPSalesProfitSummFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalSellLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Sell);
  TotalCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Cost));
  GrpMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(iTotal_Sell)-iTotal_Cost);
  end;

procedure TPBRPSalesProfitSummFrm.FormCreate(Sender: TObject);
begin
  dmPeriodEnd := TdmPeriodEnd.create(self);
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0
end;

procedure TPBRPSalesProfitSummFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepTotSellQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Sell);
  RepTotCostQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Cost);
   RepMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
   end;

procedure TPBRPSalesProfitSummFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPSalesProfitSummFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPSalesProfitSummFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
iTotal_Sell := 0;
iTotal_Vat := 0;
iTotal_Cost := 0;
end;

procedure TPBRPSalesProfitSummFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPSalesProfitSummFrm.qrySalesProfitCost_ValueGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qrySalesProfit.fieldbyname('Cost_Value').asstring = '' then
    text := '0.00'
  else
    text := formatfloat('0.00',qrySalesProfit.fieldbyname('Cost_Value').asfloat);
end;

procedure TPBRPSalesProfitSummFrm.qrySalesProfitSales_ValueGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qrySalesProfit.fieldbyname('Sales_Value').asstring = '' then
    text := '0.00'
  else
    text := formatfloat('0.00',qrySalesProfit.fieldbyname('Sales_Value').asfloat);
end;

procedure TPBRPSalesProfitSummFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPeriodEnd.free;
end;

function TPBRPSalesProfitSummFrm.GetDetails: integer;
begin
  with qrySalesProfit do
    begin
      close;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPSalesProfitSummFrm.ExportToFile(fileName: string);
var
  TempName: string;
  tempStr: string;
begin
  exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Period"';

  if totalbyRep then
    tempstr := tempstr + ',"Rep"'
  else
    tempstr := tempstr + ',"Account Team"';

  tempstr := tempstr + ',"Sales"'
    + ',"Cost"'
    + ',"Profit"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPSalesProfitSummFrm.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
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
      tempStr := tempStr + ',"' + qrySalesProfit.fieldbyname('Team_Name').asstring + '"';

    //Sales
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',qrySalesProfit.fieldbyname('Sales_Value').asfloat) + '"';

    //Cost
    tempStr := tempStr + ',"' + formatfloat('£#,##0.00',qrySalesProfit.fieldbyname('Cost_Value').asfloat) + '"';

    //Profit
    tempStr := tempStr + ',"' + MargQRLbl.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSPEndRepsProfitFrm.prgbrExport.StepIt;
  end;


end;

procedure TPBRPSalesProfitSummFrm.SettotalByAccTeam(const Value: Boolean);
begin
  FtotalByAccTeam := Value;
end;

end.
