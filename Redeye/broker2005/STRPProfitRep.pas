unit STRPProfitRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, DBTables, QuickRpt, Qrctrls;

type
  TSTRPProfitRepfrm = class(TForm)
    qrProfitRep: TQuickRep;
    qryProfitRepAll: TQuery;
    qrbndPageHeader: TQRBand;
    qrgrpHeader: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    qrbndGrpFooter: TQRBand;
    qrlblCostSubTotal: TQRLabel;
    qrlblPriceSubTotal: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    qrlblMarginSubTotal: TQRLabel;
    qrlblMarginPercSubTotal: TQRLabel;
    qrbndSummary: TQRBand;
    QRLabel13: TQRLabel;
    qrlblCostGrandTotal: TQRLabel;
    qrlblPriceGrandTotal: TQRLabel;
    qrlblMarginGrandTotal: TQRLabel;
    qrlblMarginPercGrandTotal: TQRLabel;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    qrlblTitle: TQRLabel;
    qrbndDetail: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    qrlblMargPerc: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    qrlblSortby: TQRLabel;
    qrdbtxtSortBy: TQRDBText;
    lblSortSequence: TQRLabel;
    lbldbSortField: TQRDBText;
    QRShape3: TQRShape;
    qrlblMargin: TQRLabel;
    qrlblTotalSell: TQRLabel;
    qrlblTotalCost: TQRLabel;
    lblDescription: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblReplenishSource: TQRLabel;
    qryPartStore: TQuery;
    qrySupplier: TQuery;
    function GetDetails(Sender: TObject): Integer;
    procedure qrbndDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndGrpFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndGrpFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbndSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FCustomerCode: integer;
    FSortFieldName: string;
    FDateTo: TDate;
    FDateFrom: TDate;
    FPriceSubTotal: currency;
    FCostSubTotal: currency;
    FPriceGrandTotal: currency;
    FCostGrandTotal: currency;
    FExcludeCallOffs: string;
    procedure SetCustomerCode(const Value: integer);
    procedure SetDateFrom(const Value: TDate);
    procedure SetDateTo(const Value: TDate);
    procedure SetSortFieldName(const Value: string);
    procedure SetCostSubTotal(const Value: currency);
    procedure SetPriceSubTotal(const Value: currency);
    procedure SetCostGrandTotal(const Value: currency);
    procedure SetPriceGrandTotal(const Value: currency);
    procedure SetExcludeCallOffs(const Value: string);
    { Private declarations }
  public
    property SortFieldName: string read FSortFieldName write SetSortFieldName;
    property DateFrom: TDate read FDateFrom write SetDateFrom;
    property DateTo: TDate read FDateTo write SetDateTo;
    property CustomerCode: integer read FCustomerCode write SetCustomerCode;
    property CostSubTotal: currency read FCostSubTotal write SetCostSubTotal;
    property PriceSubTotal: currency read FPriceSubTotal write SetPriceSubTotal;
    property CostGrandTotal: currency read FCostGrandTotal write SetCostGrandTotal;
    property PriceGrandTotal: currency read FPriceGrandTotal write SetPriceGrandTotal;
    property ExcludeCallOffs: string read FExcludeCallOffs write SetExcludeCallOffs;
    { Public declarations }
  end;

var
  STRPProfitRepfrm: TSTRPProfitRepfrm;

implementation

{$R *.DFM}

{ TSTRPProfitRepfrm }

function TSTRPProfitRepfrm.GetDetails(Sender: TObject): Integer;
begin
  qrlblSortBy.Caption := SortFieldName;
  qrdbtxtSortBy.DataField := SortFieldName;
  lbldbSortField.datafield := SortFieldName;
  qrlblTitle.Caption := 'Sales Order Margin Report - Run Date: ' + DateToStr(Date());
  qrlbldateRange.Caption := 'Dated Between: ' + DateToStr(DateFrom) + ' - To: ' + DateToStr(DateTo);

  with qryProfitRepAll do
  begin
    if CustomerCode <> -1 then
    begin
      SQL.Add(' and (Sales_order.Customer = ' + IntToStr(CustomerCode) + ') ');
    end;

    if ExcludeCalloffs = 'Y' then
    begin
      SQL.Add(' and (Replenish_Source.Replenish_ID = ''S'') ');
    end;

    if SortFieldName = 'Customer_Name' then
    begin
      SQL.Add(' Order By Customer.Name, Sales_order.sales_order');
    end
    else
    if SortFieldName = 'Rep_Name' then
    begin
      SQL.Add(' Order By Sales_OrderRep.Rep, sales_order.sales_order');
    end;

    qrgrpHeader.Expression := 'qryProfitRepAll.'+SortFieldName;
    close;
    open;
    Result := RecordCount;
  end;
end;

procedure TSTRPProfitRepfrm.SetCustomerCode(const Value: integer);
begin
  FCustomerCode := Value;
end;

procedure TSTRPProfitRepfrm.SetDateFrom(const Value: TDate);
begin
  FDateFrom := Value;
end;

procedure TSTRPProfitRepfrm.SetDateTo(const Value: TDate);
begin
  FDateTo := Value;
end;

procedure TSTRPProfitRepfrm.SetSortFieldName(const Value: string);
begin
  FSortFieldName := Value;
end;

procedure TSTRPProfitRepfrm.qrbndDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with qryProfitRepAll do
  begin
    if fieldbyname('Replenish_ID').asstring = 'S' then
      lblDescription.caption := 'Stationery Sales Order'
    else
      lblDescription.caption := 'Print Call off';

    {Get the replenishment source}
    if fieldbyname('Supplier').isnull then
      begin
        qryPartStore.close;
        qryPartStore.parambyname('Part_Store').asinteger := fieldbyname('Part_store').asinteger;
        qryPartStore.open;

        qrlblReplenishsource.caption := 'Warehouse: '+ qryPartStore.fieldbyname('Part_Store_Name').asstring;
      end
    else
      begin
        qrySupplier.close;
        qrySupplier.parambyname('Supplier').asinteger := fieldbyname('Supplier').asinteger;
        qrySupplier.open;

        qrlblReplenishsource.caption := 'Supplier: '+ qrySupplier.fieldbyname('Name').asstring;
      end;

    qrlblTotalCost.caption := formatfloat('0.00',fieldbyname('Total_Cost').asfloat);
    qrlblTotalSell.caption := formatfloat('0.00',fieldbyname('Total_Sell').asfloat);
    qrlblMargin.Caption := FloatToStrF(((FieldByName('Total_Sell').AsFloat) - (FieldByName('Total_cost').AsFloat)),ffFixed,4,2);
    if FieldByName('Total_cost').AsFloat <> 0.00 then
      qrlblMargPerc.Caption := FloatToStrF(((FieldByName('Total_Sell').AsFloat) - (FieldByName('Total_cost').AsFloat))/FieldByName('Total_cost').AsFloat*100,ffFixed,4,2)
    else
      qrlblMargPerc.Caption := '0';
  end;
end;

procedure TSTRPProfitRepfrm.qrbndDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  CostSubTotal := CostSubTotal + qryProfitRepAll.FieldByName('Total_cost').AsFloat;
  PriceSubTotal := PriceSubTotal + qryProfitRepAll.FieldByName('Total_Sell').AsFloat;
end;

procedure TSTRPProfitRepfrm.SetCostSubTotal(const Value: currency);
begin
  FCostSubTotal := Value;
end;

procedure TSTRPProfitRepfrm.SetPriceSubTotal(const Value: currency);
begin
  FPriceSubTotal := Value;
end;

procedure TSTRPProfitRepfrm.qrbndGrpFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  CostGrandTotal := CostGrandTotal + StrToCurr(CurrToStrF(CostSubTotal, ffFixed, 2));
  PriceGrandTotal := PriceGrandTotal + StrToCurr(CurrToStrF(PriceSubTotal, ffFixed, 2));
  CostSubTotal := 0.00;
  PriceSubTotal := 0.00;
end;

procedure TSTRPProfitRepfrm.qrbndGrpFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCostSubTotal.Caption := '£' + CurrToStrF(CostSubTotal, ffFixed, 2);
  qrlblPriceSubTotal.Caption  := '£' + CurrToStrF(PriceSubTotal, ffFixed, 2);
  qrlblMarginSubTotal.Caption := '£' + CurrToStrF((PriceSubTotal - CostSubTotal), ffFixed, 2);
  if CostSubTotal <> 0.00 then
    qrlblMarginPercSubTotal.Caption := FloatToStrF( ((PriceSubTotal - CostSubTotal)/CostSubTotal)*100,ffFixed,4 ,2)
  else
    qrlblMarginPercSubTotal.Caption := '0';
end;

procedure TSTRPProfitRepfrm.SetCostGrandTotal(const Value: currency);
begin
  FCostGrandTotal := Value;
end;

procedure TSTRPProfitRepfrm.SetPriceGrandTotal(const Value: currency);
begin
  FPriceGrandTotal := Value;
end;

procedure TSTRPProfitRepfrm.qrbndSummaryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblCostGrandTotal.Caption := '£'+ CurrToStrF(CostGrandTotal, ffFixed, 2);
  qrlblPriceGrandTotal.Caption  := '£' + CurrToStrF(PriceGrandTotal, ffFixed, 2);
  qrlblMarginGrandTotal.Caption := '£' + CurrToStrF((PriceGrandTotal - CostGrandTotal), ffFixed, 2);
  if CostGrandTotal <> 0.00 then
    qrlblMarginPercGrandTotal.Caption := FloatToStrF( ((PriceGrandTotal - CostGrandTotal)/CostGrandTotal)*100,ffFixed,4,2)
  else
    qrlblMarginPercGrandTotal.Caption := '0';
end;

procedure TSTRPProfitRepfrm.SetExcludeCallOffs(const Value: string);
begin
  FExcludeCallOffs := Value;
end;

end.
