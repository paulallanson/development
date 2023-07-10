unit PBRPSalesByPrdCat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, DBTables, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects;

type
  TPBRPSalesByPrdCatFrm = class(TForm)
    qckrpSalesByPrdCat: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand1: TQRBand;
    TotalSellLbl: TQRLabel;
    TotalVatlbl: TQRLabel;
    TotalGoodsLbl: TQRLabel;
    LocQRGroupHeader: TQRGroup;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotSellQRLbl: TQRLabel;
    RepTotVatQRLbl: TQRLabel;
    RepTotGoodsQRLbl: TQRLabel;
    AddCostsQuery: TQuery;
    GetCostsQuery: TQuery;
    TotalCostLbl: TQRLabel;
    RepTotCostQRLbl: TQRLabel;
    QRShape4: TQRShape;
    MarginQRLabel: TQRLabel;
    GrpMargQRLbl: TQRLabel;
    RepMargQRLbl: TQRLabel;
    QRLabel19: TQRLabel;
    qrySalesbyPrdCat: TQuery;
    qryGetPOCosts: TQuery;
    qryGetSOCosts: TQuery;
    qryAddPOCosts: TQuery;
    oldqryGetJBCosts: TQuery;
    qryGetJBCosts: TQuery;
    qryCreditLines: TQuery;
    QRSubDetInvlns: TQRSubDetail;
    qrygetinvline: TQuery;
    qrySalesbyPrdCatCustomer: TIntegerField;
    qrySalesbyPrdCatBranch_no: TIntegerField;
    qrySalesbyPrdCatSales_Invoice: TIntegerField;
    qrySalesbyPrdCatAccount_Code: TStringField;
    qrySalesbyPrdCatName: TStringField;
    qrySalesbyPrdCatSales_Invoice_No: TStringField;
    qrySalesbyPrdCatGoods_Value: TCurrencyField;
    qrySalesbyPrdCatVat_Value: TCurrencyField;
    qrySalesbyPrdCatGoods_Total: TCurrencyField;
    qrySalesbyPrdCatInvoice_Date: TDateTimeField;
    qrySalesbyPrdCatInvoice_or_Credit: TStringField;
    qrySalesbyPrdCatRep: TIntegerField;
    qrySalesbyPrdCatSales_Invoice_type: TStringField;
    qrySalesbyPrdCatInactive: TStringField;
    qrySalesbyPrdCatReference: TStringField;
    qrySalesbyPrdCatSupplier_Name: TStringField;
    qrySalesbyPrdCatRep_Name: TStringField;
    qrySalesbyPrdCatInvoiceRef: TStringField;
    qrySalesbyPrdCatInvoice_Description: TStringField;
    qrySalesbyPrdCatSupplier_Desc: TStringField;
    qrySalesbyPrdCatOrderDesc: TStringField;
    DtSrcReport: TDataSource;
    QRLblGoods: TQRLabel;
    QRLblVat: TQRLabel;
    QRLblTot: TQRLabel;
    qrygetinvlineSales_Invoice: TIntegerField;
    qrygetinvlineInvoice_Line_No: TIntegerField;
    qrygetinvlinePurchase_Order: TFloatField;
    qrygetinvlineLine: TIntegerField;
    qrygetinvlineQty_Invoiced: TFloatField;
    qrygetinvlineGoods_Value: TFloatField;
    qrygetinvlineVat_Code: TIntegerField;
    qrygetinvlineVat_Value: TFloatField;
    qrygetinvlineProduct_Type: TIntegerField;
    qrygetinvlineSales_Invoice_Status: TIntegerField;
    qrygetinvlinePrice_Unit: TIntegerField;
    qrygetinvlineNominal: TStringField;
    qrygetinvlineJob_Bag: TIntegerField;
    qrygetinvlineJob_Bag_Line: TIntegerField;
    qrygetinvlineNarrative: TIntegerField;
    qrygetinvlineReference: TStringField;
    qrygetinvlineInternal_Narrative: TIntegerField;
    qrygetinvlineSales_Order: TIntegerField;
    qrygetinvlineSales_Order_line_no: TIntegerField;
    qrygetinvlineCredit_type: TStringField;
    qrygetinvlineNot_Printed: TStringField;
    qrygetinvlinecost_price: TFloatField;
    qrygetinvlinePrice_Unit_1: TIntegerField;
    qrygetinvlineSales_Unit_Desc: TStringField;
    qrygetinvlinePrice_Unit_Factor: TFloatField;
    qrygetinvlineVat_Rate: TFloatField;
    qrygetinvlineDescription: TStringField;
    qrygetinvlineVAT_Ref: TStringField;
    qryInvCharges: TQuery;
    LblDesc: TQRLabel;
    QRSbDtlInvTot: TQRSubDetail;
    QRShape5: TQRShape;
    qryJBLine: TQuery;
    qrySOLine: TQuery;
    qryPOLine: TQuery;
    TotCstQRLbl: TQRLabel;
    MargQRLbl: TQRLabel;
    QRLblInvTotCst: TQRLabel;
    QRLblInvTotMarg: TQRLabel;
    qryPO: TQuery;
    qryGetProdCosts: TQuery;
    qryGetPOCrCosts: TQuery;
    qryGetSOCrCosts: TQuery;
    qryGetJBCrCosts: TQuery;
    qryGetInvAddChrg: TQuery;
    qrySalesbyPrdCatDescription: TStringField;
    qrySalesbyPrdCatInvoice_Line_No: TIntegerField;
    QRLblInvGoods: TQRLabel;
    QRLblInvVat: TQRLabel;
    QRLblInvSell: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    RepQRGroup: TQRGroup;
    qrySalesbyPrdCatProduct_Type_Description: TStringField;
    qrbfProdType: TQRBand;
    qrlblProductType: TQRLabel;
    ProdTotalSellLbl: TQRLabel;
    ProdTotalVatLbl: TQRLabel;
    ProdTotalGoodsLbl: TQRLabel;
    ProdTotalCostLbl: TQRLabel;
    ProdMarginLbl: TQRLabel;
    qrshpCategoryLine: TQRShape;
    qrgpProdType: TQRGroup;
    qrySalesbyPrdCatInvoice_Location: TIntegerField;
    qrySalesbyPrdCatInvoice_Location_Descr: TStringField;
    qrdbCategory: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    LocQRGroupFooter: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    LocTotalVatLbl: TQRLabel;
    LocTotalGoodsLbl: TQRLabel;
    LocTotalCostLbl: TQRLabel;
    LocMarginLbl: TQRLabel;
    QRShape1: TQRShape;
    locTotalSellLbl: TQRLabel;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    CallOffCstqrlbl: TQRLabel;
    JobCstqrLbl: TQRLabel;
    ProdJobCostlbl: TQRLabel;
    ProdCallOffCostlbl: TQRLabel;
    QRLblInvJobCst: TQRLabel;
    QRLblInvCallOffCst: TQRLabel;
    JobCostLbl: TQRLabel;
    CallOffCostLbl: TQRLabel;
    LocJobCostLbl: TQRLabel;
    LocCallOffCostLbl: TQRLabel;
    RepJobCostQRLbl: TQRLabel;
    RepCallOffCostQRLbl: TQRLabel;
    procedure qckrpSalesByPrdCatBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetInvlnsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSbDtlInvTotBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSbDtlInvTotAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndPageHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure RepQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbfProdTypeBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbfProdTypeAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrgpProdTypeBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure LocQRGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure LocQRGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    fTotalByRep: Boolean;
    fTotalByCust: Boolean;
    FtotalBySupp: Boolean;
    exporting: boolean;
    exportFile: textFile;
    lastInv: string;
    FtotalByProduct: Boolean;
    procedure setTotalByCust(const Value: Boolean);
    procedure SetTotalByProduct(const Value: Boolean);
    procedure setTotalByRep(const Value: Boolean);
    procedure SettotalBySupp(const Value: Boolean);
    function GetPOLineDesc(tempCode: real; tempLine: integer): string;
    function GetSOLineDesc(tempCode: integer; tempLine: integer): string;
    function GetJBLineDesc(tempCode: integer; tempLine: integer): string;
    function GetPOSupplier(tempCode: real): string;
    function GetJBLineSupplier(tempCode, tempLine: integer): string;
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    property totalByProduct: Boolean read FtotalByProduct write SettotalByProduct;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPSalesByPrdCatFrm: TPBRPSalesByPrdCatFrm;

implementation

uses PBRSSalesByPrdCat, pbDatabase;

var
  Loc_Total_Sell, Loc_Total_Vat, Loc_Total_Cost, Loc_CallOff_Cost: real;
  iTotal_Sell, iTotal_vat, iTotal_Cost: real;
  Prod_Total_Sell, Prod_Total_Vat, Prod_Total_Cost, Prod_CallOff_Cost: real;
  RepTotal_Sell, RepTotal_vat, RepTotal_Cost: real;
  rInvTotal_Cost,rInvTotal_Sell, rInvTotal_Vat: real;
  rTotSOCost, rInvSOCost, rRepSOCost: real;

{$R *.DFM}

procedure TPBRPSalesByPrdCatFrm.qckrpSalesByPrdCatBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rTotSOCost := 0;
  rInvSOCost := 0;
  rRepSOCost := 0;

  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;

  Loc_Total_Sell := 0;
  Loc_CallOff_Cost := 0;
  Loc_Total_Cost := 0;
  Loc_Total_Vat := 0;

  Prod_Total_Sell := 0;
  Prod_CallOff_Cost := 0;
  Prod_Total_Cost := 0;
  Prod_Total_Vat := 0;

  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;

  rInvTotal_Cost := 0;
  rInvTotal_Sell  := 0;
  rInvTotal_Vat := 0;

  with qckrpSalesByPrdCat.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    Outputbin := PrinterSettings.OutputBin;
  end;

  qrbfProdType.enabled := TotalByProduct;
  qrgpProdType.enabled := TotalByProduct;
  qrshpCategoryLine.Enabled := TotalByProduct;

  LocQRGroupHeader.enabled := dmBroker.UseRevenueCentres;
  LocQRGroupFooter.enabled := dmBroker.UseRevenueCentres;

  if TotalByProduct then
    repQRGroup.Height := 25
  else
    repQRGroup.Height := 0;

  qrySalesByPrdCat.Open;
  qrygetinvline.Open;
  qryInvCharges.Open;
end;

procedure TPBRPSalesByPrdCatFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if totalByProduct then
    begin
      qrLabel1.caption := 'Totals for ' + qrySalesbyPrdCatDescription.asString;
      qrlabel1.Alignment := taRightJustify;
    end
  else
    begin
      qrLabel1.caption := qrySalesbyPrdCatDescription.asString;
      qrlabel1.Alignment := taLeftJustify;
    end;

  CallOffCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotSOCost));
  JobCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Cost-rTotSOCost));

  TotalSellLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Sell);
  TotalVatLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Vat);
  TotalGoodsLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Sell+iTotal_VAT));
  TotalCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Cost));
  GrpMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(iTotal_Sell)-iTotal_Cost);
end;

procedure TPBRPSalesByPrdCatFrm.FormCreate(Sender: TObject);
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  rInvTotal_Cost := 0;
  rInvTotal_Sell := 0;
  rInvTotal_Vat := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0
end;

procedure TPBRPSalesByPrdCatFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepCallOffCostQRLbl.Caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',rRepSOCost);
  RepJobCostQRLbl.Caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',(RepTotal_Cost-rRepSOCost));


  RepTotSellQRLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',RepTotal_Sell);
  RepTotVatQRLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',RepTotal_Vat);
  RepTotGoodsQRLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',(RepTotal_Sell+RepTotal_VAT));
  RepTotCostQRLbl.Caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',RepTotal_Cost);
  RepMargQRLbl.Caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
end;

procedure TPBRPSalesByPrdCatFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPSalesByPrdCatFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPSalesByPrdCatFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
  var
  tempStr, tempStr2: string;
  incProgBar: boolean;
begin
  if self.exporting and not TotalbyProduct then
  begin
      tempStr := '"' + qrLabel1.caption + '"';

    if tempStr <> self.lastInv then
      incProgBar := true
    else
      incProgBar := false;

    self.lastInv := tempStr;

    if dmBroker.UseRevenueCentres then
      tempstr := tempStr + ',"' + qrySalesByPrdCat.fieldbyname('Invoice_Location_Descr').asstring + '"';

    tempStr := tempStr + ',"' + totalsellLbl.caption + '"';
    //vat
    tempStr := tempStr + ',"' + totalvatLbl.caption + '"';
    //total
    tempStr := tempStr + ',"' + totalGoodsLbl.caption + '"';
    //CallOff Costs
    tempStr := tempStr + ',"' + CallOffCostLbl.Caption + '"';
    //Job Costs
    tempStr := tempStr + ',"' + JobCostLbl.Caption + '"';
    //cost price
    tempStr := tempStr + ',"' + totalCostLbl.Caption + '"';
    //gross profit margin
    tempStr := tempStr + ',"' + GrpMargQRLbl.Caption + '"';

    writeln(self.exportFile, tempStr);
    if incProgBar then
      PBRSSalesByPrdCatFrm.prgbrExport.StepIt;
  end;
  
  rTotSOCost := 0;
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
end;

procedure TPBRPSalesByPrdCatFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPSalesByPrdCatFrm.QRSubDetInvlnsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rGoodsTotal, rVatValue: Real;
  rTotalCost, rSOCost: real;
  iQty: integer;
  raddcost: real;
  iHeight: integer;
begin
  printBand := false;
  rSOCost := 0.00;
  rGoodsTotal := qryGetInvLine.fieldByName('Goods_Value').AsFloat;

  if qryGetInvLine.fieldByname('Price_Unit_Factor').AsInteger = 0 then
    rGoodsTotal := rGoodsTotal
  else
    rGoodsTotal := (abs(qryGetInvLine.fieldByname('Qty_Invoiced').AsFloat) /
     (qryGetInvLine.fieldByname('Price_Unit_Factor').AsInteger))
      * rGoodsTotal;

  if qryGetInvLine.fieldByName('Invoice_Line_No').asInteger = 1 then
  begin
    with qryGetInvAddChrg do
    begin
      close;
      ParamByName('sales_invoice').asInteger := qrySalesByPrdCatSales_Invoice.asInteger;
      open;

      while not eof do
      begin
        rGoodsTotal := rGoodsTotal + FieldByName('Amount').asFloat;
        rVatValue := rVatValue + (FieldByName('Amount').asFloat * (FieldByName('vat_rate').asFloat/100));
        rTotalCost := rTotalCost + FieldByName('cost_price').asFloat;
        next;
      end;
      close;
    end;
  end;

  QRLblGoods.Caption := formatfloat('0.00', rGoodsTotal);
  rInvtotal_sell := rInvtotal_sell + rGoodsTotal;
  if qryGetInvLineVat_Value.asFloat <> 0.00 then
  begin
    rVatValue := qryGetInvLineVat_Value.AsFloat;
  end
  else
  begin
    rVatValue := StrToFloat(QRLblGoods.Caption) *
      (qryGetInvLine.fieldByname('Vat_Rate').AsFloat / 100);
  end;
  QRLblVat.Caption := formatfloat('0.00',(rVATValue));
  rInvTotal_vat := rInvTotal_vat + rVatValue;
  QRLblTot.Caption := formatFloat('0.00',(rgoodsTotal+rVatValue));
  //rTotalCost := 0;

  {only get the costs if invoice}
  if (qrySalesByPrdCatInvoice_or_Credit.asstring = 'I') or
     (qrySalesByPrdCatInvoice_or_Credit.asstring = '') then
    begin
    if qrySalesByPrdCatSales_Invoice_type.asstring = '' then
      begin
      with getCostsQuery do
        begin
          Close;
          ParamByName('Invoice_No').AsInteger :=qrySalesByPrdCatSales_Invoice.asInteger;
          ParamByName('Line_No').AsInteger := qryGetInvLineInvoice_Line_No.asInteger;
          Open;
          First;
          while not eof do
            begin
            if FieldByName('Qty_Invoiced').asfloat < 0 then
              iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
            else
              iQty := FieldByName('Qty_Invoiced').asinteger;

            if FieldByName('Order_Unit_Factor').asfloat <> 0 then
              rTotalCost := rTotalCost + (iQty / FieldByName('Order_Unit_Factor').asinteger)
                      * FieldByName('Order_Price').asfloat
            else
              try
                rTotalCost := rTotalCost + ((FieldByName('Order_Price').asfloat / FieldByName('Quantity').asfloat)*iqty) ;
              except
                rTotalCost := rTotalCost + 0
              end;
            next;
            end;
        end;
      with AddCostsQuery do
        begin
          Close;
          ParamByName('PurchOrder').AsFloat := qrySalesByPrdCatReference.AsFloat;
          open;
          rAddCost := fieldByName('Add_cost').AsFloat;
        end;
      rTotalCost := rTotalCost + rAddcost;
      end
    else
    if qrySalesByPrdCatSales_Invoice_type.asstring = 'S' then
      begin
      with qryGetPOCosts do
        begin
        Close;
        ParamByName('Sales_Invoice').AsInteger := qrySalesByPrdCatSales_Invoice.asInteger;
        ParamByName('Line_No').AsInteger := qryGetInvLineInvoice_Line_No.asInteger;
        Open;
        {either no Purchase Order exists for the stationery order or this is a Stock
        Call Off order}
        if recordcount = 0 then
          begin
            with qryGetSOCosts do
              begin
              Close;
              ParamByName('Sales_order').AsInteger := qrySalesByPrdCatReference.asInteger;
              ParamByName('Sales_Order_Line').AsInteger := qryGetInvLineSales_order_Line_no.asInteger;
              ParamByName('Qty_Invoiced').AsInteger := qryGetInvLineQty_Invoiced.asInteger;
              Open;
              First;
              rTotalCost := rTotalCost + fieldbyname('Total_Cost').asfloat;
              end;
          end
        else
          begin
            qryGetPOCosts.First;

            rTotalCost := rTotalCost + qryGetPOCosts.fieldbyname('Total_Cost').asfloat;
            with qryAddPOCosts do
              begin
              Close;
              ParamByName('Purch_Ord').AsInteger := qryGetPOCosts.fieldbyname('Purch_ord').asInteger;
              Open;
              First;
              rTotalCost := rTotalCost + fieldbyname('Total_Cost').asfloat;
              end;
          end;
        end;
        rSOCost := rTotalCost;
      end
    else
    if qrySalesByPrdCatSales_Invoice_type.asstring = 'J' then
      begin
      with qryGetJBCosts do
        begin
          Close;
          ParamByName('Sales_invoice').AsInteger :=qrySalesByPrdCatSales_Invoice.asInteger;
          ParamByName('Line_No').AsInteger := qryGetInvLineInvoice_Line_No.asInteger;
          Open;
          First;
          while not eof do
            begin
            if FieldByName('Purchase_order').asstring = '' then
              rTotalCost := rTotalCost + FieldByName('Job_Bag_Line_Cost').asfloat
            else
              begin
              if FieldByName('Qty_Invoiced').asfloat < 0 then
                 iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
              else
                 iQty := FieldByName('Qty_Invoiced').asinteger;

              if FieldByName('Price_Unit_Factor').asfloat <> 0 then
                 rTotalCost := rTotalCost + (iQty / FieldByName('Price_Unit_Factor').asinteger)
                       * FieldByName('Order_Price').asfloat
              else
                begin
                  try
                    rTotalCost := rTotalCost + ((FieldByName('Order_Price').asfloat / FieldByName('Quantity').asfloat)*iqty) ;
                  except
                    rTotalCost := rTotalCost + 0 ;
                  end;
                end;
              rTotalCost := rTotalCost + FieldByName('Extra_Cost').asfloat;
              end;
            next;
            end;
        end;
      end;
    end
  else
    {Credit Note costs}
    begin
    with qryCreditLines do
      begin
        close;
        parambyname('Sales_invoice').asinteger := qrySalesByPrdCatSales_Invoice.asInteger;
        ParamByName('Line_No').AsInteger := qryGetInvLineInvoice_Line_No.asInteger;
        open;

        if FieldByName('Qty_Invoiced').asfloat < 0 then
          iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
        else
          iQty := FieldByName('Qty_Invoiced').asinteger;

        if FieldbyName('Cost_Price').asfloat <> 0 then
          begin
            if FieldByName('Invoice_Unit_Factor').asfloat <> 0 then
              rTotalCost := rTotalCost + (iQty / FieldByName('Invoice_Unit_Factor').asinteger)
                * FieldByName('Cost_Price').asfloat
            else
              rTotalCost := rTotalCost + FieldByName('Cost_Price').asfloat;
          end
        else
        if fieldbyname('Purchase_order').asfloat <> 0 then
          begin
            qryGetProdCosts.close;
            qryGetProdCosts.parambyname('Purchase_order').asfloat := fieldbyname('Purchase_order').asfloat;
            qryGetProdCosts.parambyname('Line').asinteger := fieldbyname('Line').asinteger;
            qryGetProdCosts.open;

            if  (FieldbyName('Credit_Type').asstring = 'Q') then
              begin
                if qryGetProdCosts.FieldByName('Order_Unit_Factor').asfloat <> 0 then
                  rTotalCost := rTotalCost + ((iQty / qryGetProdCosts.FieldByName('Order_Unit_Factor').asinteger)
                    * qryGetProdCosts.FieldByName('Order_Price').asfloat)*-1
                else
                  try
                    rTotalCost := rTotalCost + (((qryGetProdCosts.FieldByName('Order_Price').asfloat / qryGetProdCosts.FieldByName('Quantity').asfloat)*iqty)*-1) ;
                  except
                    rTotalCost := rTotalCost + 0
                  end;
              end
            else
              rTotalCost := rTotalCost + 0;
          end
        else
        if fieldbyname('Job_Bag').asinteger <> 0 then
          begin
            qryGetJBCrCosts.close;
            qryGetJBCrCosts.parambyname('Job_Bag').asinteger := fieldbyname('Job_Bag').asinteger;
            qryGetJBCrCosts.parambyname('Job_bag_line').asinteger := fieldbyname('Job_Bag_Line').asinteger;
            qryGetJBCrCosts.open;

            if  (FieldbyName('Credit_Type').asstring = 'Q') then
              rTotalCost := rTotalCost + (qryGetJBCrCosts.FieldByName('Job_Bag_Line_Cost').asfloat*-1)
            else
              rTotalCost := rTotalCost + 0;
          end
        else
        if fieldbyname('Sales_Order').asinteger <> 0 then
          begin
            if  (FieldbyName('Credit_Type').asstring = 'Q') then
              begin
                qryGetPOCrCosts.Close;
                qryGetPOCrCosts.ParamByName('Sales_Order').AsInteger := fieldbyname('Sales_Order').asInteger;
                qryGetPOCrCosts.ParamByName('Sales_Order_line_no').AsInteger := fieldbyname('Sales_Order_line_no').asInteger;
                qryGetPOCrCosts.Open;

                if qryGetPOCrCosts.recordcount = 0 then
                  begin
                    qryGetSOCrCosts.close;
                    qryGetSOCrCosts.ParamByName('Sales_Order').AsInteger := fieldbyname('Sales_Order').asInteger;
                    qryGetSOCrCosts.ParamByName('Sales_Order_line_no').AsInteger := fieldbyname('Sales_Order_line_no').asInteger;
                    qryGetSOCrCosts.Open;

                    rTotalCost := rTotalCost + ((iQty / qryGetSOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                      * qryGetSOCrCosts.FieldByName('Part_Cost').asfloat)*-1;
                  end
                else
                  rTotalCost := rTotalCost + (((iQty / qryGetPOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                    * qryGetPOCrCosts.FieldByName('Purchase_Price').asfloat))*-1;
              end
            else
              rTotalCost := rTotalCost + 0.00;

            rSOCost := rTotalCost;
          end;
      end;
    end;

  CallOffCstQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rSOCost);
  JobCstQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalCost - rSOCost));
  TotCstQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotalCost);

  rTotSOCost := rTotSOCost + rSOCost;
  rInvSOCost := rInvSOCost + rSOCost;
  rRepSOCost := rRepSOCost + rSOCost;

  itotal_Cost := itotal_Cost + rTotalCost;
  rInvTotal_cost := rInvTotal_Cost + rTotalCost;
  repTotal_Cost := RepTotal_Cost + rTotalCost;

  MargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rGoodsTotal - rTotalCost);

  iheight := lblDesc.height + 1;
end;

procedure TPBRPSalesByPrdCatFrm.QRSbDtlInvTotBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := false;

  iTotal_Sell := iTotal_Sell + rInvTotal_sell;
  iTotal_Vat := iTotal_Vat + rInvTotal_Vat;

  Loc_Total_Sell := Loc_Total_Sell + rInvTotal_sell;
  Loc_Total_Vat := Loc_Total_Vat + rInvTotal_Vat;
  Loc_Total_Cost := Loc_Total_Cost + rInvTotal_cost;
  Loc_CallOff_Cost := Loc_CallOff_Cost + rInvSOCost;
  
  Prod_Total_Sell := Prod_Total_Sell + rInvTotal_sell;
  Prod_Total_Vat := Prod_Total_Vat + rInvTotal_Vat;
  Prod_CallOff_Cost := Prod_CallOff_Cost + rInvSOCost;
  Prod_Total_Cost := Prod_Total_Cost + rInvTotal_cost;

  RepTotal_Sell := RepTotal_Sell + rInvTotal_Sell;
  RepTotal_Vat := RepTotal_Vat + rinvTotal_Vat;

  QRLblInvCallOffCst.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvSOCost);
  QRLblInvJobCst.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rInvTotal_Cost - rInvSOCost));

  QRLblInvTotCst.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvTotal_Cost);
  QRLblInvSell.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvTotal_Sell);
  QRLblInvVat.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvTotal_Vat);
  QRLblInvGoods.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvTotal_Sell+rInvTotal_Vat);

  QRLblInvTotMarg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',qrySalesByPrdCatGoods_Value.asfloat - rInvTotal_Cost);
end;

function TPBRPSalesByPrdCatFrm.GetJBLineDesc(tempCode,
  tempLine: integer): string;
begin
end;

function TPBRPSalesByPrdCatFrm.GetJBLineSupplier(tempCode,
  tempLine: integer): string;
begin
end;

function TPBRPSalesByPrdCatFrm.GetPOLineDesc(tempCode: real;
  tempLine: integer): string;
begin
end;

function TPBRPSalesByPrdCatFrm.GetPOSupplier(tempCode: real): string;
begin
end;

function TPBRPSalesByPrdCatFrm.GetSOLineDesc(tempCode,
  tempLine: integer): string;
begin
end;

procedure TPBRPSalesByPrdCatFrm.QRSbDtlInvTotAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rInvSOCost := 0;
  rInvTotal_Cost := 0;
  rInvTotal_sell := 0;
  rInvTotal_vat := 0;
end;

procedure TPBRPSalesByPrdCatFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product Category"';

  if dmBroker.UseRevenueCentres then
      tempstr := tempStr + ',"Revenue Centre"';

  if totalbyProduct then
    tempStr := tempStr
    + ',"Product Type"'
    + ',"Selling Price"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Call Off Costs"'
    + ',"Job/PO Costs"'
    + ',"Total Costs"'
    + ',"Gross Profit Margin"'
  else
    tempStr := tempStr
    + ',"Selling Price"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Call Off Costs"'
    + ',"Job/PO Costs"'
    + ',"Total Costs"'
    + ',"Gross Profit Margin"';

  writeLn(self.exportFile, tempStr);
  self.qckrpSalesByPrdCat.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPSalesByPrdCatFrm.qrbndPageHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if self.exporting then
  begin
    PBRSSalesByPrdCatFrm.prgbrExport.Max :=
      self.qckrpSalesByPrdCat.dataset.RecordCount;
  end;
end;

procedure TPBRPSalesByPrdCatFrm.RepQRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblProductType.caption := qrySalesbyPrdCatProduct_Type_Description.asString;
end;

procedure TPBRPSalesByPrdCatFrm.SettotalByProduct(const Value: Boolean);
begin
  FtotalByProduct := Value;
end;

procedure TPBRPSalesByPrdCatFrm.qrbfProdTypeBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  ProdCallOffCostLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',Prod_CallOff_Cost);
  ProdJobCostLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(Prod_Total_Cost - Prod_CallOff_Cost));


  ProdTotalSellLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',Prod_Total_Sell);
  ProdTotalVatLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',Prod_Total_Vat);
  ProdTotalGoodsLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(Prod_Total_Sell+Prod_Total_VAT));
  ProdTotalCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(Prod_Total_Cost));
  ProdMarginLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(Prod_Total_Sell)-Prod_Total_Cost);

end;

procedure TPBRPSalesByPrdCatFrm.qrbfProdTypeAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr, tempStr2: string;
  incProgBar: boolean;
begin
  if self.exporting and TotalbyProduct then
  begin
    tempStr := '"' + qrySalesbyPrdCat.fieldbyname('Description').asstring + '"';

    if tempStr <> self.lastInv then
      incProgBar := true
    else
      incProgBar := false;

    self.lastInv := tempStr;
    if dmBroker.UseRevenueCentres then
      tempstr := tempStr + ',"' + qrySalesByPrdCat.fieldbyname('Invoice_Location_Descr').asstring + '"';
    //Product Type
    tempStr := tempStr + ',"' + qrlblProductType.caption + '"';
    //Sales value
    tempStr := tempStr + ',"' + prodtotalsellLbl.caption + '"';
    //vat
    tempStr := tempStr + ',"' + prodtotalvatLbl.caption + '"';
    //total
    tempStr := tempStr + ',"' + prodtotalGoodsLbl.caption + '"';
    //calloff cost
    tempStr := tempStr + ',"' + prodCallOffCostLbl.Caption + '"';
    //Job Cost
    tempStr := tempStr + ',"' + prodJobCostLbl.Caption + '"';
    //cost price
    tempStr := tempStr + ',"' + prodtotalCostLbl.Caption + '"';
    //gross profit margin
    tempStr := tempStr + ',"' + prodMarginLbl.Caption + '"';

    writeln(self.exportFile, tempStr);
    if incProgBar then
      PBRSSalesByPrdCatFrm.prgbrExport.StepIt;
  end;

  Prod_CallOff_Cost := 0;
  Prod_Total_Sell := 0;
  Prod_Total_Cost := 0;
  Prod_Total_Vat := 0;
end;

procedure TPBRPSalesByPrdCatFrm.qrgpProdTypeBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblProductType.caption := qrySalesbyPrdCatProduct_Type_Description.asString;
end;

procedure TPBRPSalesByPrdCatFrm.LocQRGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  LocCallOffCostLbl.Caption := FormatFloat('£###,###,##0.00;(£###,###,##0.00)',(Loc_CallOff_Cost));
  LocJobCostLbl.Caption := FormatFloat('£###,###,##0.00;(£###,###,##0.00)',(Loc_Total_Cost-Loc_CallOff_Cost));

  LocTotalSellLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',Loc_Total_Sell);
  LocTotalVatLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',Loc_Total_Vat);
  LocTotalGoodsLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',(Loc_Total_Sell+Loc_Total_VAT));
  LocTotalCostLbl.Caption := FormatFloat('£###,###,##0.00;(£###,###,##0.00)',(Loc_Total_Cost));
  LocMarginLbl.Caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',(loc_Total_Sell)-Loc_Total_Cost);
end;

procedure TPBRPSalesByPrdCatFrm.LocQRGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  Loc_Total_Sell := 0;
  Loc_Total_Cost := 0;
  Loc_Total_Vat := 0;
  Loc_CallOff_Cost := 0;
end;

end.
