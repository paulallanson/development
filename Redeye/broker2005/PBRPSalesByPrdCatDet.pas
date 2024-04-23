unit PBRPSalesByPrdCatDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPSalesByPrdCatDetFrm = class(TForm)
    qckrpSalesByPrdCat: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrdbtxtPOLine: TQRDBText;
    qrdbtxtAccCode: TQRDBText;
    qrdbtxtInvDate: TQRDBText;
    QRBand1: TQRBand;
    qrlblCategory: TQRLabel;
    TotalSellLbl: TQRLabel;
    TotalVatlbl: TQRLabel;
    TotalGoodsLbl: TQRLabel;
    QRShape1: TQRShape;
    RepQRGroup: TQRGroup;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    RepTotSellQRLbl: TQRLabel;
    RepTotVatQRLbl: TQRLabel;
    RepTotGoodsQRLbl: TQRLabel;
    GrpByQRDBText: TQRDBText;
    AddCostsQuery: TFDQuery;
    GetCostsQuery: TFDQuery;
    TotalCostLbl: TQRLabel;
    RepTotCostQRLbl: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    MarginQRLabel: TQRLabel;
    GrpMargQRLbl: TQRLabel;
    RepMargQRLbl: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel19: TQRLabel;
    qrySalesbyPrdCat: TFDQuery;
    qryGetPOCosts: TFDQuery;
    qryGetSOCosts: TFDQuery;
    qryAddPOCosts: TFDQuery;
    oldqryGetJBCosts: TFDQuery;
    lblCstmr: TQRLabel;
    qryGetJBCosts: TFDQuery;
    qryCreditLines: TFDQuery;
    QRSubDetInvlns: TQRSubDetail;
    qrygetinvline: TFDQuery;
    qrySalesbyPrdCatCustomer: TIntegerField;
    qrySalesbyPrdCatBranch_no: TIntegerField;
    qrySalesbyPrdCatSales_Invoice: TIntegerField;
    qrySalesbyPrdCatAccount_Code: TWideStringField;
    qrySalesbyPrdCatName: TWideStringField;
    qrySalesbyPrdCatSales_Invoice_No: TWideStringField;
    qrySalesbyPrdCatGoods_Value: TCurrencyField;
    qrySalesbyPrdCatVat_Value: TCurrencyField;
    qrySalesbyPrdCatGoods_Total: TCurrencyField;
    qrySalesbyPrdCatInvoice_Date: TDateTimeField;
    qrySalesbyPrdCatInvoice_or_Credit: TWideStringField;
    qrySalesbyPrdCatRep: TIntegerField;
    qrySalesbyPrdCatSales_Invoice_type: TWideStringField;
    qrySalesbyPrdCatInactive: TWideStringField;
    qrySalesbyPrdCatReference: TWideStringField;
    qrySalesbyPrdCatSupplier_Name: TWideStringField;
    qrySalesbyPrdCatRep_Name: TWideStringField;
    qrySalesbyPrdCatInvoiceRef: TWideStringField;
    qrySalesbyPrdCatInvoice_Description: TWideStringField;
    qrySalesbyPrdCatSupplier_Desc: TWideStringField;
    qrySalesbyPrdCatOrderDesc: TWideStringField;
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
    qrygetinvlineNominal: TWideStringField;
    qrygetinvlineJob_Bag: TIntegerField;
    qrygetinvlineJob_Bag_Line: TIntegerField;
    qrygetinvlineNarrative: TIntegerField;
    qrygetinvlineReference: TWideStringField;
    qrygetinvlineInternal_Narrative: TIntegerField;
    qrygetinvlineSales_Order: TIntegerField;
    qrygetinvlineSales_Order_line_no: TIntegerField;
    qrygetinvlineCredit_type: TWideStringField;
    qrygetinvlineNot_Printed: TWideStringField;
    qrygetinvlinecost_price: TFloatField;
    qrygetinvlinePrice_Unit_1: TIntegerField;
    qrygetinvlineSales_Unit_Desc: TWideStringField;
    qrygetinvlinePrice_Unit_Factor: TFloatField;
    qrygetinvlineVat_Rate: TFloatField;
    qrygetinvlineDescription: TWideStringField;
    qrygetinvlineVAT_Ref: TWideStringField;
    QRSbDtlChrg: TQRSubDetail;
    qryInvCharges: TFDQuery;
    QRLblChrg: TQRLabel;
    QRLblChrgVat: TQRLabel;
    QRLblChrgTot: TQRLabel;
    QRDBText1: TQRDBText;
    LblDesc: TQRLabel;
    QRSbDtlInvTot: TQRSubDetail;
    QRShape5: TQRShape;
    QRlblQty: TQRLabel;
    QtyInvoicedLbl: TQRLabel;
    qrlblSupplier: TQRLabel;
    qryJBLine: TFDQuery;
    qrySOLine: TFDQuery;
    qryPOLine: TFDQuery;
    TotCstQRLbl: TQRLabel;
    MargQRLbl: TQRLabel;
    QRLblInvTotCst: TQRLabel;
    QRLblInvTotMarg: TQRLabel;
    qryPO: TFDQuery;
    qryGetProdCosts: TFDQuery;
    qryGetPOCrCosts: TFDQuery;
    qryGetSOCrCosts: TFDQuery;
    qryGetJBCrCosts: TFDQuery;
    qrlblChrgCost: TQRLabel;
    qrlblChrgMarg: TQRLabel;
    qryGetInvAddChrg: TFDQuery;
    qrySalesbyPrdCatDescription: TWideStringField;
    qrySalesbyPrdCatInvoice_Line_No: TIntegerField;
    QRLblInvGoods: TQRLabel;
    QRLblInvVat: TQRLabel;
    QRLblInvSell: TQRLabel;
    qrySalesbyPrdCatProduct_Type_Description: TWideStringField;
    qryGetPO: TFDQuery;
    qryGetJB: TFDQuery;
    qryGetSO: TFDQuery;
    qrySalesbyPrdCatInvoice_Location: TIntegerField;
    qrySalesbyPrdCatInvoice_Location_Descr: TWideStringField;
    qrlblOrderNo: TQRLabel;
    procedure qckrpSalesByPrdCatBeforePrint(Sender: TCustomQuickRep;
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
    procedure qrySalesbyPrdCatInvoiceRefGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesbyPrdCatSupplier_DescGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesbyPrdCatCalcFields(DataSet: TDataSet);
    procedure QRSubDetInvlnsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSbDtlChrgBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSbDtlInvTotBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSbDtlInvTotAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetInvlnsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSbDtlChrgAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndPageHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    fTotalByRep: Boolean;
    fTotalByCust: Boolean;
    FtotalBySupp: Boolean;
    exporting: boolean;
    exportFile: textFile;
    lastInv: string;
    procedure setTotalByCust(const Value: Boolean);
    procedure setTotalByRep(const Value: Boolean);
    procedure SettotalBySupp(const Value: Boolean);
    function GetPOLineDesc(tempCode: real; tempLine: integer): string;
    function GetSOLineDesc(tempCode: integer; tempLine: integer): string;
    function GetJBLineDesc(tempCode: integer; tempLine: integer): string;
    function GetPOSupplier(tempCode: real): string;
    function GetJBLineSupplier(tempCode, tempLine: integer): string;
    function GetAccountManager(tempType: string): string;
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPSalesByPrdCatDetFrm: TPBRPSalesByPrdCatDetFrm;

implementation

uses PBRSSalesByPrdCat, pbDatabase;

var
  iTotal_Sell, iTotal_vat, iTotal_Cost: real;
  RepTotal_Sell, RepTotal_vat, RepTotal_Cost: real;
  rInvTotal_Cost,rInvTotal_Sell, rInvTotal_Vat: real;

{$R *.DFM}

procedure TPBRPSalesByPrdCatDetFrm.qckrpSalesByPrdCatBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
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
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}
  qrySalesByPrdCat.Open;
  qrygetinvline.Open;
  qryInvCharges.Open;
 { if TotalByCust then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByPrdCat.Customer';
      GrpByQRDBText.DataField := 'Name';
      end;
  if TotalBySupp then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByPrdCat.Supplier_Name';
      GrpByQRDBText.DataField := 'Supplier_Desc';
      end;
  if TotalByRep then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByPrdCat.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
      end; }
  end;

procedure TPBRPSalesByPrdCatDetFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
iheight : integer;
begin
  if totalByCust then
    LblCstmr.caption := ''
  else
    LblCstmr.Caption := qrySalesByPrdCatName.asstring;

  qrlblSupplier.caption := '';
  iheight := lblCstmr.height + 1;
  if iHeight > 25 then
    qrsubdetail1.height := iheight
  else
    qrsubdetail1.height := 25;
end;

procedure TPBRPSalesByPrdCatDetFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblCategory.caption := 'Total for ' + qrySalesbyPrdCatDescription.asString;
  TotalSellLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',iTotal_Sell);
  TotalVatLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',iTotal_Vat);
  TotalGoodsLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',(iTotal_Sell+iTotal_VAT));
  TotalCostLbl.Caption := FormatFloat('£###,###,##0.00;(£###,###,##0.00)',(iTotal_Cost));
  GrpMargQRLbl.Caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',(iTotal_Sell)-iTotal_Cost);
end;

procedure TPBRPSalesByPrdCatDetFrm.FormCreate(Sender: TObject);
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

procedure TPBRPSalesByPrdCatDetFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepTotSellQRLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',RepTotal_Sell);
  RepTotVatQRLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',RepTotal_Vat);
  RepTotGoodsQRLbl.caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',(RepTotal_Sell+RepTotal_VAT));
  RepTotCostQRLbl.Caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',RepTotal_Cost);
  RepMargQRLbl.Caption := formatfloat('£###,###,##0.00;(£###,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
end;

procedure TPBRPSalesByPrdCatDetFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPSalesByPrdCatDetFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPSalesByPrdCatDetFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
iTotal_Sell := 0;
iTotal_Vat := 0;
iTotal_Cost := 0;
end;

procedure TPBRPSalesByPrdCatDetFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPSalesByPrdCatDetFrm.qrySalesbyPrdCatInvoiceRefGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByPrdCatInvoice_or_Credit.asstring = 'C' then
    text := 'CN/'+ qrySalesByPrdCatSales_invoice_no.asstring
  else
    text := qrySalesByPrdCatSales_invoice_no.asstring;

end;

procedure TPBRPSalesByPrdCatDetFrm.qrySalesbyPrdCatSupplier_DescGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if trim(qrySalesByPrdCatSupplier_Name.asstring) = '' then
    if qrySalesByPrdCatSales_Invoice_Type.asstring = 'S' then
      text := 'Stock Warehouse'
    else
      text := 'Multiple Suppliers'
  else
    text := qrySalesByPrdCatSupplier_Name.asstring;
end;

procedure TPBRPSalesByPrdCatDetFrm.qrySalesbyPrdCatCalcFields(DataSet: TDataSet);
begin
  if qrySalesByPrdCatSales_Invoice_Type.asstring = 'S' then
    qrySalesByPrdCatOrderDesc.asstring := 'SO/'+qrySalesByPrdCatReference.asstring
  else
  if qrySalesByPrdCatSales_Invoice_Type.asstring = 'J' then
    qrySalesByPrdCatOrderDesc.asstring := 'JB/'+qrySalesByPrdCatReference.asstring
  else
    qrySalesByPrdCatOrderDesc.asstring := qrySalesByPrdCatReference.asstring;

  if qrySalesByPrdCatInvoice_or_credit.asstring = 'C' then
    qrySalesByPrdCatOrderDesc.asstring := 'INV/'+qrySalesByPrdCatReference.asstring
end;

procedure TPBRPSalesByPrdCatDetFrm.QRSubDetInvlnsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rGoodsTotal, rVatValue: Real;
  rTotalCost :real;
  iQty: integer;
  raddcost: real;
  iHeight: integer;
begin
  if qryGetInvLine.fieldbyname('Job_Bag').asinteger <> 0 then
    begin
      lblDesc.caption := GetJBLineDesc(qryGetInvLine.fieldbyname('Job_Bag').asinteger,
                                              qryGetInvLine.fieldbyname('Job_Bag_Line').asinteger);
      qrlblOrderNo.caption := 'JB/'+ floattostr(qryGetInvLine.fieldbyname('Job_Bag').asinteger);
    end
  else
  if qryGetInvLine.fieldbyname('Purchase_Order').asfloat <> 0 then
    begin
       lblDesc.caption := GetPOLineDesc(qryGetInvLine.fieldbyname('Purchase_Order').asfloat,
                                              qryGetInvLine.fieldbyname('Line').asinteger);
       qrlblOrderNo.caption := 'PO/'+ floattostr(qryGetInvLine.fieldbyname('Purchase_Order').asfloat);
    end
  else
//  if qryGetInvLine.fieldbyname('Sales_Order').asinteger <> 0 then
    begin
      lblDesc.caption := GetSOLineDesc(qryGetInvLine.fieldbyname('Sales_Order').asinteger,
                                              qryGetInvLine.fieldbyname('Sales_order_Line_no').asinteger);
       qrlblOrderNo.caption := 'SO/'+ floattostr(qryGetInvLine.fieldbyname('Sales_Order').asinteger);
    end;

  QtyInvoicedLbl.Caption := qryGetInvLine.fieldByName('Qty_Invoiced').Asstring;
  rGoodsTotal := qryGetInvLine.fieldByName('Goods_Value').AsFloat;

  if qryGetInvLine.fieldByname('Price_Unit_Factor').AsInteger = 0 then
    rGoodsTotal := rGoodsTotal
  else
    rGoodsTotal := (abs(qryGetInvLine.fieldByname('Qty_Invoiced').AsFloat) /
     (qryGetInvLine.fieldByname('Price_Unit_Factor').AsInteger))
      * rGoodsTotal;
  QRLblGoods.Caption := formatfloat('0.00', rGoodsTotal);
  rInvtotal_sell := rInvtotal_sell + rGoodsTotal;

  if qryGetInvLineVat_Value.asFloat <> 0.00 then
  begin
    rVatValue := qryGetInvLineVat_Value.AsFloat;
  end
  else
  begin
    rVatValue := StrToFloatDef(QRLblGoods.Caption, 0, FormatSettings) *
      (qryGetInvLine.fieldByname('Vat_Rate').AsFloat / 100);
  end;
  
  QRLblVat.Caption := formatfloat('0.00',(rVATValue));
  rInvTotal_vat := rInvTotal_vat + rVatValue;
  QRLblTot.Caption := formatFloat('0.00',(rgoodsTotal+rVatValue));
   rTotalCost := 0;

{*  with qryGetInvAddChrg do
  begin
    close;
    ParamByName('sales_invoice').asInteger := qrySalesByPrdCatSales_Invoice.asInteger;
    open;

    while not eof do
    begin
      rTotalCost := rTotalCost + FieldByName('cost_price').asFloat;
      next;
    end;
    close;
  end;    *}

  {only get the costs if invoice}
  if (qrySalesByPrdCatInvoice_or_Credit.asstring = 'I') or
     (qrySalesByPrdCatInvoice_or_Credit.asstring = '') then
    begin
    if qrySalesByPrdCatSales_Invoice_type.asstring = '' then
      begin
      qrlblSupplier.caption := GetPOSupplier(qryGetInvLine.fieldbyname('Purchase_Order').asfloat);
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
            qrlblSupplier.caption := 'Stock Warehouse';
            with qryGetSOCosts do
              begin
              Close;
              ParamByName('Sales_order').AsInteger := qrySalesByPrdCatReference.asInteger;
              ParamByName('Sales_Order_Line').AsInteger := qryGetInvLineSales_order_Line_no.asInteger;
              ParamByName('Qty_Invoiced').AsInteger := qryGetInvLineQty_Invoiced.asInteger;
              Open;
              First;
              rTotalCost := fieldbyname('Total_Cost').asfloat;
              end;
          end
        else
          begin
            qrlblSupplier.caption := qryGetPOCosts.fieldbyname('Name').asstring;
            qryGetPOCosts.First;

            rTotalCost := qryGetPOCosts.fieldbyname('Total_Cost').asfloat;
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
      end
    else
    if qrySalesByPrdCatSales_Invoice_type.asstring = 'J' then
      begin
      qrlblSupplier.Caption := GetJBLineSupplier(qryGetInvLine.fieldbyname('Job_Bag').asinteger,
                                              qryGetInvLine.fieldbyname('Job_Bag_Line').asinteger);

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
          end;
      end;
    end;

  TotCstQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotalCost);
  rInvTotal_cost := rInvTotal_Cost + rTotalCost;

  MargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rGoodsTotal - rTotalCost);

  iheight := lblDesc.height + 1;
  if iHeight > 25 then
    qrsubdetail1.height := iheight
  else
    qrsubdetail1.height := 25;

end;

procedure TPBRPSalesByPrdCatDetFrm.QRSbDtlChrgBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rVatValue: real;
begin
PrintBand := qryInvCharges.Fieldbyname('Amount').asfloat <> 0;

  rVatValue := (qryInvCharges.Fieldbyname('Amount').asfloat
     * (qryInvCharges.FieldByName('Vat_Rate').AsFloat / 100));
    QRLblChrg.Caption := formatfloat('0.00',(qryInvCharges.Fieldbyname('Amount').asfloat));
    QRLblChrgVat.Caption := formatfloat('0.00',(rVATValue));
    QRLblChrgTot.Caption := formatfloat('0.00',(rVATValue + qryInvCharges.Fieldbyname('Amount').asfloat));

if qrySalesByPrdCatInvoice_or_Credit.asstring = 'C' then
    QRLblChrgCost.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',qryInvCharges.Fieldbyname('cost_price').asfloat)
  else
    QRLblChrgCost.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(qryInvCharges.Fieldbyname('cost_price').asfloat));

if qrySalesByPrdCatInvoice_or_Credit.asstring = 'C' then
    QRLblChrgMarg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',qryInvCharges.Fieldbyname('Amount').asfloat-
                                                               qryInvCharges.Fieldbyname('cost_price').asfloat)
  else
    QRLblChrgMarg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(qryInvCharges.Fieldbyname('Amount').asfloat-
                                             qryInvCharges.Fieldbyname('cost_price').asfloat));

  rInvTotal_Sell := rInvTotal_sell + qryInvCharges.Fieldbyname('Amount').asfloat;
  rInvTotal_Vat := rInvTotal_Vat + rVatValue;
  rInvTotal_cost := rInvTotal_Cost + qryInvCharges.Fieldbyname('cost_price').asfloat;
end;

procedure TPBRPSalesByPrdCatDetFrm.QRSbDtlInvTotBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iTotal_Sell := iTotal_Sell + rInvTotal_sell;
  iTotal_Vat := iTotal_Vat + rInvTotal_Vat;
  iTotal_Cost := iTotal_Cost + rInvTotal_Cost;

  RepTotal_Sell := RepTotal_Sell + rInvTotal_Sell;
  RepTotal_Vat := RepTotal_Vat + rinvTotal_Vat;
  RepTotal_Cost := RepTotal_Cost + rInvTotal_Cost;

  QRLblInvTotCst.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvTotal_Cost);
  QRLblInvSell.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvTotal_Sell);
  QRLblInvVat.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvTotal_Vat);
  QRLblInvGoods.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvTotal_Sell+rInvTotal_Vat);

  QRLblInvTotMarg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rInvTotal_Sell - rInvTotal_Cost);
end;

function TPBRPSalesByPrdCatDetFrm.GetJBLineDesc(tempCode,
  tempLine: integer): string;
begin
  result := '';
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempcode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      open;
      result := fieldbyname('Job_Bag_Line_Descr').asstring;
    end;
end;

function TPBRPSalesByPrdCatDetFrm.GetJBLineSupplier(tempCode,
  tempLine: integer): string;
begin
  result := '';
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempcode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      open;
      result := fieldbyname('Name').asstring;
    end;
end;

function TPBRPSalesByPrdCatDetFrm.GetPOLineDesc(tempCode: real;
  tempLine: integer): string;
begin
  result := '';
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempcode;
      parambyname('Line').asinteger := tempLine;
      open;
      result := fieldbyname('Customers_Desc').asstring;
    end;
end;

function TPBRPSalesByPrdCatDetFrm.GetPOSupplier(tempCode: real): string;
begin
  result := '';
  with qryPO do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempcode;
      open;
      result := fieldbyname('Name').asstring;
    end;
end;

function TPBRPSalesByPrdCatDetFrm.GetSOLineDesc(tempCode,
  tempLine: integer): string;
begin
 result := '';
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part').asstring + ' ' + fieldbyname('Part_Description').asstring;
    end;
end;

procedure TPBRPSalesByPrdCatDetFrm.QRSbDtlInvTotAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
rInvTotal_Cost := 0;
rInvTotal_sell := 0;
rInvTotal_vat := 0;
end;

procedure TPBRPSalesByPrdCatDetFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Inv. No."'
    + ',"Inv. Date"'
    + ',"Customer"';

    if dmBroker.UseRevenueCentres then
      tempstr := tempStr + ',"Revenue Centre"';

    tempStr := tempStr
    + ',"Category"'
    + ',"Product Type"'
    + ',"Description"'
    + ',"Account Code"'
    + ',"Order"'
    + ',"Quantity"'
    + ',"Selling Price"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Cost Price"'
    + ',"Gross Profit Margin"'
    + ',"Supplier Name"'
    + ',"Account Manager"'
    + ',"Rep Name"';

  writeLn(self.exportFile, tempStr);
  self.qckrpSalesByPrdCat.Prepare;
  
  CloseFile(self.exportFile);
end;

procedure TPBRPSalesByPrdCatDetFrm.QRSubDetInvlnsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
  incProgBar: boolean;
begin
  if self.exporting then
  begin
    //invoice no
    if qrySalesByPrdCatInvoice_or_Credit.asstring = 'C' then
      tempStr := '"CN/'+ qrySalesByPrdCatSales_invoice_no.asstring + '"'
    else
      tempStr := '"' + qrySalesByPrdCatSales_invoice_no.asstring + '"';

    if tempStr <> self.lastInv then
      incProgBar := true
    else
      incProgBar := false;

    self.lastInv := tempStr;

    //invoice date
    tempStr := tempStr + ',"' + qrySalesByPrdCatInvoice_Date.asString + '"';

    //customer name
    tempStr := tempStr + ',"' + qrySalesByPrdCatName.asstring + '"';

    //Revenue Centre
    if dmBroker.UseRevenueCentres then
      tempstr := tempStr + ',"' + qrySalesByPrdCat.fieldbyname('Invoice_Location_Descr').asstring + '"';

    //category Name
    tempStr := tempStr + ',"' + qrySalesByPrdCatDescription.asstring + '"';

    //Product Type
    tempStr := tempStr + ',"' + qrySalesByPrdCatProduct_Type_Description.asstring + '"';

    //invoice description
    tempStr := tempStr + ',"' + formatstring(lblDesc.caption) + '"';

    //account code
    tempStr := tempStr + ',"' + qrySalesByPrdCatAccount_Code.asString + '"';

    //order No
    if qrySalesByPrdCatInvoice_or_credit.asstring = 'C' then
    begin
      tempStr := tempStr + ',"INV/' + qrySalesByPrdCatReference.asstring + '"'
    end
    else
    begin
      tempStr := tempStr + ',"' + qrlblOrderNo.caption + '"';
(*      if qrySalesByPrdCatSales_Invoice_Type.asstring = 'S' then
        tempStr := tempStr + ',"SO/' + qrySalesByPrdCatReference.asstring + '"'
      else if qrySalesByPrdCatSales_Invoice_Type.asstring = 'J' then
        tempStr := tempStr + ',"JB/' + qrySalesByPrdCatReference.asstring + '"'
      else
        tempStr := tempStr + ',"' + qrySalesByPrdCatReference.asstring + '"';
*)    end;

    //quantity
    tempStr := tempStr + ',"' + IntToStr(qryGetInvLine.FieldByName('Qty_Invoiced').Asinteger) + '"';
    //selling price
    tempStr := tempStr + ',"£' + QRLblGoods.caption + '"';
    //vat
    tempStr := tempStr + ',"£' + QRLblVat.caption + '"';
    //total
    tempStr := tempStr + ',"£' + QRLblTot.caption + '"';
    //cost price
    tempStr := tempStr + ',"' + TotCstQRLbl.Caption + '"';
    //gross profit margin
    tempStr := tempStr + ',"' + MargQRLbl.Caption + '"';
    //supplier name
    tempStr := tempStr + ',"' + qrlblSupplier.Caption + '"';

    // Account Manager
    if qrySalesByPrdCatInvoice_or_credit.asstring = 'C' then
    begin
      tempStr := tempStr + ',""'
    end
    else
    begin
      if qrySalesByPrdCatSales_Invoice_Type.asstring = 'S' then
        tempStr := tempStr + ',"' + GetAccountManager('S') + '"'
      else
      if qrySalesByPrdCatSales_Invoice_Type.asstring = 'J' then
        tempStr := tempStr + ',"' + GetAccountManager('J') + '"'
      else
        tempStr := tempStr + ',"' + GetAccountManager('P') + '"';
    end;

    //repName
    tempStr := tempStr + ',"' + qrySalesByPrdCatRep_Name.asString + '"';

    writeln(self.exportFile, tempStr);
    if incProgBar then
      PBRSSalesByPrdCatFrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPSalesByPrdCatDetFrm.QRSbDtlChrgAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
  rVatValue: real;
begin
  if (self.exporting)
    and (qryInvCharges.Fieldbyname('Amount').asfloat <> 0) then
  begin
    rVatValue := (qryInvCharges.Fieldbyname('Amount').asfloat
      * (qryInvCharges.FieldByName('Vat_Rate').AsFloat / 100));

    //invoice no
    if qrySalesByPrdCatInvoice_or_Credit.asstring = 'C' then
      tempStr := '"CN/'+ qrySalesByPrdCatSales_invoice_no.asstring + '"'
    else
      tempStr := '"' + qrySalesByPrdCatSales_invoice_no.asstring + '"';

    //invoice date
    tempStr := tempStr + ',"' + qrySalesByPrdCatInvoice_Date.asString + '"';

    //customer name
    tempStr := tempStr + ',"' + qrySalesByPrdCatName.asstring + '"';

    if dmBroker.UseRevenueCentres then
      tempstr := tempStr + ',"' + qrySalesByPrdCat.fieldbyname('Invoice_Location_Descr').asstring + '"';

    //category Name
    tempStr := tempStr + ',"' + qrySalesByPrdCatDescription.asstring + '"';

    //Product Type
    tempStr := tempStr + ',"' + qrySalesByPrdCatProduct_Type_Description.asstring + '"';

    //job description
    tempStr := tempStr + ',"' + formatstring(qryInvCharges.FieldByName('Details').asstring) + '"';

    //account code
    tempStr := tempStr + ',"' + qrySalesByPrdCatAccount_Code.asString + '"';

    //order No
    if qrySalesByPrdCatInvoice_or_credit.asstring = 'C' then
    begin
      tempStr := tempStr + ',"INV/' + qrySalesByPrdCatReference.asstring + '"'
    end
    else
    begin
      if qrySalesByPrdCatSales_Invoice_Type.asstring = 'S' then
        tempStr := tempStr + ',"SO/' + qrySalesByPrdCatReference.asstring + '"'
      else if qrySalesByPrdCatSales_Invoice_Type.asstring = 'J' then
        tempStr := tempStr + ',"JB/' + qrySalesByPrdCatReference.asstring + '"'
      else
        tempStr := tempStr + ',"' + qrySalesByPrdCatReference.asstring + '"';
    end;

    //quantity
    tempStr := tempStr + ',""';

    //selling price
    tempStr := tempStr + ',"£' + formatfloat('0.00',(qryInvCharges.Fieldbyname('Amount').asfloat)) + '"';

    //vat
    tempStr := tempStr + ',"£' + formatfloat('0.00',(rVATValue)) + '"';

    //total
    tempStr := tempStr + ',"£' + formatfloat('0.00',(rVATValue + qryInvCharges.Fieldbyname('Amount').asfloat)) + '"';

    //cost price
    tempStr := tempStr + ',"£' + formatfloat('0.00',(qryInvCharges.Fieldbyname('cost_price').asfloat)) + '"';

    //gross profit margin
    tempStr := tempStr + ',"£'
      + formatfloat('0.00',(qryInvCharges.Fieldbyname('Amount').asfloat -
      qryInvCharges.Fieldbyname('cost_price').asfloat)) + '"';

    //supplier name
    tempStr := tempStr + ',"' + qrlblSupplier.Caption + '"';

    // Account Manager
    if qrySalesByPrdCatInvoice_or_credit.asstring = 'C' then
    begin
      tempStr := tempStr + ',""'
    end
    else
    begin
      if qrySalesByPrdCatSales_Invoice_Type.asstring = 'S' then
        tempStr := tempStr + ',"' + GetAccountManager('S') + '"'
      else
      if qrySalesByPrdCatSales_Invoice_Type.asstring = 'J' then
        tempStr := tempStr + ',"' + GetAccountManager('J') + '"'
      else
        tempStr := tempStr + ',"' + GetAccountManager('P') + '"';
    end;


    //repName
    tempStr := tempStr + ',"' + qrySalesByPrdCatRep_Name.asString + '"';

    writeln(self.exportFile, tempStr);
  end;
end;

procedure TPBRPSalesByPrdCatDetFrm.qrbndPageHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if self.exporting then
  begin
    PBRSSalesByPrdCatFrm.prgbrExport.Max :=
      self.qckrpSalesByPrdCat.dataset.RecordCount;
  end;
end;

function TPBRPSalesByPrdCatDetFrm.GetAccountManager(tempType: string): string;
begin
  result := '';
  if tempType = 'S' then
    begin
      qryGetSO.close;
      qryGetSO.parambyname('Sales_Order').asinteger := qryGetInvLine.fieldbyname('Sales_Order').asinteger;
      qryGetSO.open;
      result := qryGetSO.fieldbyname('Account_Manager').asstring;
    end
  else
  if tempType = 'J' then
    begin
      qryGetJB.close;
      qryGetJB.parambyname('Job_Bag').asinteger := qryGetInvLine.fieldbyname('Job_Bag').asinteger;
      qryGetJB.open;
      result := qryGetJB.fieldbyname('Account_Manager').asstring;
    end
  else
  if tempType = 'P' then
    begin
      qryGetPO.close;
      qryGetPO.parambyname('Purchase_Order').asfloat := qryGetInvLine.fieldbyname('Purchase_Order').asfloat;
      qryGetPO.open;
      result := qryGetPO.fieldbyname('Account_Manager').asstring;
    end;
end;

end.
