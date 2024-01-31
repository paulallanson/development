unit PBRPSalesByInvDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPSalesByInvDetFrm = class(TForm)
    qckrpSalesByInv: TQuickRep;
    oldqrySalesByInv: TFDQuery;
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
    QRLabel18: TQRLabel;
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
    oldqrySalesByInvPurchase_Order: TFloatField;
    oldqrySalesByInvLine: TIntegerField;
    oldqrySalesByInvCustomer: TIntegerField;
    oldqrySalesByInvBranch_No: TIntegerField;
    oldqrySalesByInvSales_Invoice: TIntegerField;
    oldqrySalesByInvAccount_Code: TStringField;
    oldqrySalesByInvName: TStringField;
    oldqrySalesByInvCustomers_Desc: TStringField;
    oldqrySalesByInvSales_Invoice_no: TStringField;
    oldqrySalesByInvGoods_Value: TCurrencyField;
    oldqrySalesByInvVat_Value: TCurrencyField;
    oldqrySalesByInvGoods_Total: TCurrencyField;
    oldqrySalesByInvInvoice_Date: TDateTimeField;
    oldqrySalesByInvSupplier_Name: TStringField;
    oldqrySalesByInvRep_Name: TStringField;
    oldqrySalesByInvSupplier_Job_Ref: TStringField;
    oldqrySalesByInvPOLine: TStringField;
    TotalCostLbl: TQRLabel;
    RepTotCostQRLbl: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    MarginQRLabel: TQRLabel;
    GrpMargQRLbl: TQRLabel;
    RepMargQRLbl: TQRLabel;
    oldqrySalesByInvInvoiceRef: TStringField;
    oldqrySalesByInvInvoice_or_Credit: TWideStringField;
    QRDBText2: TQRDBText;
    QRLabel19: TQRLabel;
    qrySalesbyInv: TFDQuery;
    qryGetPOCosts: TFDQuery;
    qryGetSOCosts: TFDQuery;
    qryAddPOCosts: TFDQuery;
    oldqryGetJBCosts: TFDQuery;
    lblCstmr: TQRLabel;
    qryGetJBCosts: TFDQuery;
    qryCreditLines: TFDQuery;
    QRSubDetInvlns: TQRSubDetail;
    qrygetinvline: TFDQuery;
    qrySalesbyInvCustomer: TIntegerField;
    qrySalesbyInvBranch_no: TIntegerField;
    qrySalesbyInvSales_Invoice: TIntegerField;
    qrySalesbyInvAccount_Code: TStringField;
    qrySalesbyInvName: TStringField;
    qrySalesbyInvSales_Invoice_No: TStringField;
    qrySalesbyInvGoods_Value: TCurrencyField;
    qrySalesbyInvVat_Value: TCurrencyField;
    qrySalesbyInvGoods_Total: TCurrencyField;
    qrySalesbyInvInvoice_Date: TDateTimeField;
    qrySalesByInvInvoice_or_Credit: TWideStringField;
    qrySalesbyInvRep: TIntegerField;
    qrySalesbyInvSales_Invoice_type: TStringField;
    qrySalesbyInvInactive: TStringField;
    qrySalesbyInvReference: TStringField;
    qrySalesbyInvSupplier_Name: TStringField;
    qrySalesbyInvRep_Name: TStringField;
    qrySalesbyInvInvoiceRef: TStringField;
    qrySalesbyInvInvoice_Description: TStringField;
    qrySalesbyInvSupplier_Desc: TStringField;
    qrySalesbyInvOrderDesc: TStringField;
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
    QRSbDtlChrg: TQRSubDetail;
    qryInvCharges: TFDQuery;
    QRLblChrg: TQRLabel;
    QRLblChrgVat: TQRLabel;
    QRLblChrgTot: TQRLabel;
    QRDBText1: TQRDBText;
    LblDesc: TQRLabel;
    QRSbDtlInvTot: TQRSubDetail;
    qrdbtxtGoodsValue: TQRDBText;
    qrdbtxtGoodsVAT: TQRDBText;
    qrdbtxtGoodsTotal: TQRDBText;
    QRShape5: TQRShape;
    QRlblQty: TQRLabel;
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
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrlblTotPOSell: TQRLabel;
    qrlblTotPOCost: TQRLabel;
    qrlblTotProductionSell: TQRLabel;
    qrlblTotProductionCost: TQRLabel;
    qrlblTotStockSell: TQRLabel;
    qrlblTotStockCost: TQRLabel;
    qrlblTotPOVat: TQRLabel;
    qrlblTotStockVat: TQRLabel;
    qrlblTotProductionVat: TQRLabel;
    qrlblTotPO: TQRLabel;
    qrlblTotStock: TQRLabel;
    qrlblTotProduction: TQRLabel;
    qrlblTotPOMarg: TQRLabel;
    qrlblTotStockMarg: TQRLabel;
    qrlblTotProductionMarg: TQRLabel;
    QtyInvoicedLbl: TQRLabel;
    qrySalesbyInvBranch_Name: TStringField;
    qrySalesbyInvCustomer_Type_Description: TStringField;
    qrlblTotalBy: TQRLabel;
    qrlblBasedOnSubReps: TQRLabel;
    qrySalesbyInvAccount_Manager_Name: TStringField;
    procedure oldqrySalesByInvPOLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qckrpSalesByInvBeforePrint(Sender: TCustomQuickRep;
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
    procedure oldqrySalesByInvInvoiceRefGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesbyInvInvoiceRefGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesbyInvSupplier_DescGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesbyInvCalcFields(DataSet: TDataSet);
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
    bGetAddCosts: boolean;
    exporting: boolean;
    exportFile: textFile;
    lastInv: string;
    sCustOrderNo: string;
    FUseSubREps: boolean;
    FtotalbyAM: Boolean;
    FExcludeJBCosts: boolean;
    procedure setTotalByCust(const Value: Boolean);
    procedure setTotalByRep(const Value: Boolean);
    procedure SettotalBySupp(const Value: Boolean);
    function GetPOLineDesc(tempCode: real; tempLine: integer): string;
    function GetSOLineDesc(tempCode: integer; tempLine: integer): string;
    function GetJBLineDesc(tempCode: integer; tempLine: integer): string;
    function GetPOSupplier(tempCode: real): string;
    function GetJBLineSupplier(tempCode, tempLine: integer): string;
    procedure SetUseSubREps(const Value: boolean);
    procedure SettotalbyAM(const Value: Boolean);
    procedure SetExcludeJBCosts(const Value: boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    property ExcludeJBCosts: boolean read FExcludeJBCosts write SetExcludeJBCosts;
    property totalbyAM: Boolean read FtotalbyAM write SettotalbyAM;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    property UseSubREps: boolean read FUseSubREps write SetUseSubREps;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPSalesByInvDetFrm: TPBRPSalesByInvDetFrm;

implementation

uses PBRSSalesByInv, PBRSSalesByProd, PBSalesInvoiceDm;

var
  iTotal_Sell, iTotal_vat, iTotal_Cost: real;
  RepTotal_Sell, RepTotal_vat, RepTotal_Cost: real;
  rInvTotal_Cost: real;
  iLineType: integer;
  LineTypeArray: array[1..5, 1..3] of double;

{$R *.DFM}

procedure TPBRPSalesByInvDetFrm.oldqrySalesByInvPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByinvReference.IsNull then
    text := ''
  else
    text := PBFormatPONum(qrySalesByInvReference.Asfloat,1);

end;

procedure TPBRPSalesByInvDetFrm.qckrpSalesByInvBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  irow, icol: integer;
begin
iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;
  rInvTotal_Cost := 0;

  {initialise the array for storing the values associated with different invoice line types ... purchase orders, stock, production}
  for irow := 1 to 5 do
    for icol := 1 to 3 do
      LineTypeArray[irow, icol] := 0;

   with qckrpSalesByInv.PrinterSettings do
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
  qrySalesByInv.Open;
  qrygetinvline.Open;
  qryInvCharges.Open;
  if TotalByCust then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByInv.Customer';
      GrpByQRDBText.DataField := 'Name';
      end;
  if TotalBySupp then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByInv.Supplier_Name';
      GrpByQRDBText.DataField := 'Supplier_Desc';
      end;
  if TotalByRep then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByInv.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
    end;
  if TotalByAM then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByInv.Account_Manager_Name';
      GrpByQRDBText.DataField:= 'Account_Manager_Name';
    end;

  qrlblBasedOnSubReps.enabled := UseSubReps;
end;

procedure TPBRPSalesByInvDetFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
iheight : integer;
begin
  bGetAddCosts := true;

  if totalByCust then
    LblCstmr.caption := ''
  else
    LblCstmr.Caption := qrySalesByInvName.asstring;

  qrlblSupplier.caption := '';
  iheight := lblCstmr.height + 1;
  if iHeight > 25 then
    qrsubdetail1.height := iheight
  else
    qrsubdetail1.height := 25;
end;

procedure TPBRPSalesByInvDetFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalSellLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Sell);
  TotalVatLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Vat);
  TotalGoodsLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Sell+iTotal_VAT));
  TotalCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Cost));
  GrpMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(iTotal_Sell)-iTotal_Cost);
  end;

procedure TPBRPSalesByInvDetFrm.FormCreate(Sender: TObject);
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  rInvTotal_Cost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;

  dmSalesInvoice := TdmSalesInvoice.create(self);
end;

procedure TPBRPSalesByInvDetFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotPOCost.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[1,1]);
  qrlblTotPOSell.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[1,2]);
  qrlblTotPOVAT.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[1,3]);
  qrlblTotPO.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[1,2]+LineTypeArray[1,3]);
  qrlblTotPOMarg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',LineTypeArray[1,2]-LineTypeArray[1,1]);

  qrlblTotStockCost.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[2,1]);
  qrlblTotStockSell.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[2,2]);
  qrlblTotStockVAT.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[2,3]);
  qrlblTotStock.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[2,2]+LineTypeArray[2,3]);
  qrlblTotStockMarg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',LineTypeArray[2,2]-LineTypeArray[2,1]);

  qrlblTotProductionCost.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[3,1]);
  qrlblTotProductionSell.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[3,2]);
  qrlblTotProductionVAT.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[3,3]);
  qrlblTotProduction.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',LineTypeArray[3,2]+LineTypeArray[3,3]);
  qrlblTotProductionMarg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',LineTypeArray[3,2]-LineTypeArray[3,1]);

  RepTotSellQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Sell);
  RepTotVatQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Vat);
  RepTotGoodsQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(RepTotal_Sell+RepTotal_VAT));
  RepTotCostQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Cost);
  RepMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
end;

procedure TPBRPSalesByInvDetFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPSalesByInvDetFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPSalesByInvDetFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
iTotal_Sell := 0;
iTotal_Vat := 0;
iTotal_Cost := 0;
end;

procedure TPBRPSalesByInvDetFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPSalesByInvDetFrm.oldqrySalesByInvInvoiceRefGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
    text := 'CN/'+ qrySalesByinvSales_invoice_no.asstring
  else
    text := qrySalesByinvSales_invoice_no.asstring;

end;

procedure TPBRPSalesByInvDetFrm.qrySalesbyInvInvoiceRefGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
    text := 'CN/'+ qrySalesByinvSales_invoice_no.asstring
  else
    text := qrySalesByinvSales_invoice_no.asstring;

end;

procedure TPBRPSalesByInvDetFrm.qrySalesbyInvSupplier_DescGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if trim(qrySalesByInvSupplier_Name.asstring) = '' then
    if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
      text := 'Stock Warehouse'
    else
      text := 'Multiple Suppliers'
  else
    text := qrySalesByInvSupplier_Name.asstring;
end;

procedure TPBRPSalesByInvDetFrm.qrySalesbyInvCalcFields(DataSet: TDataSet);
begin
  if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
    qrySalesByInvOrderDesc.asstring := 'SO/'+qrySalesByInvReference.asstring
  else
  if qrySalesByInvSales_Invoice_Type.asstring = 'J' then
    qrySalesByInvOrderDesc.asstring := 'JB/'+qrySalesByInvReference.asstring
  else
    qrySalesByInvOrderDesc.asstring := qrySalesByInvReference.asstring;

  if qrySalesByInvInvoice_or_credit.asstring = 'C' then
    qrySalesByInvOrderDesc.asstring := 'INV/'+qrySalesByInvReference.asstring
end;

procedure TPBRPSalesByInvDetFrm.QRSubDetInvlnsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rGoodsTotal, rVatValue: Real;
  rTotalCost :real;
  iQty: integer;
  raddcost: real;
  iHeight: integer;
begin

  if qryGetInvLine.fieldbyname('Purchase_Order').asfloat <> 0 then
    begin
       lblDesc.caption := GetPOLineDesc(qryGetInvLine.fieldbyname('Purchase_Order').asfloat,
                                              qryGetInvLine.fieldbyname('Line').asinteger);
       iLineType := 1;
    end
  else
  if qryGetInvLine.fieldbyname('Sales_Order').asinteger <> 0 then
    begin
      lblDesc.caption := GetSOLineDesc(qryGetInvLine.fieldbyname('Sales_Order').asinteger,
                                              qryGetInvLine.fieldbyname('Sales_order_Line_no').asinteger);
       iLineType := 2;
    end
  else
    begin
      lblDesc.caption := GetJBLineDesc(qryGetInvLine.fieldbyname('Job_Bag').asinteger,
                                              qryGetInvLine.fieldbyname('Job_Bag_Line').asinteger);
       iLineType := 3;
    end;

//if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
//  begin
//       QtyInvoicedLbl.Caption := IntToStr(PosToNegQty(qryGetInvLine.FieldByName('Qty_Invoiced').Asinteger));
//       rGoodsTotal := PosToNegMoney(qryGetInvLine.fieldByName('Goods_Value').Asfloat);
//  end
//  else
//  begin
    QtyInvoicedLbl.Caption := qryGetInvLine.fieldByName('Qty_Invoiced').Asstring;
    rGoodsTotal := qryGetInvLine.fieldByName('Goods_Value').AsFloat;
//  end;;

  if qryGetInvLine.fieldByname('Price_Unit_Factor').AsInteger = 0 then
    rGoodsTotal := rGoodsTotal
  else
    rGoodsTotal := (abs(qryGetInvLine.fieldByname('Qty_Invoiced').AsFloat) /
     (qryGetInvLine.fieldByname('Price_Unit_Factor').AsInteger))
      * rGoodsTotal;
  QRLblGoods.Caption := formatfloat('0.00', rGoodsTotal);

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
  QRLblTot.Caption := formatFloat('0.00',(rgoodsTotal+rVatValue));
   rTotalCost := 0;

{*  with qryGetInvAddChrg do
  begin
    close;
    ParamByName('sales_invoice').asInteger := qrySalesByInvSales_Invoice.asInteger;
    open;

    while not eof do
    begin
      rTotalCost := rTotalCost + FieldByName('cost_price').asFloat;
      next;
    end;
    close;
  end;   *}

  {only get the costs if invoice}
  if (qrySalesByInvInvoice_or_Credit.asstring = 'I') or
     (qrySalesByInvInvoice_or_Credit.asstring = '') then
    begin
    if qrySalesByInvSales_Invoice_type.asstring = '' then
      begin
      qrlblSupplier.caption := GetPOSupplier(qryGetInvLine.fieldbyname('Purchase_Order').asfloat);
      with getCostsQuery do
        begin
          Close;
          ParamByName('Invoice_No').AsInteger :=qrySalesByInvSales_Invoice.asInteger;
          ParamByName('Line_No').AsInteger := qryGetInvLineInvoice_Line_No.asInteger;
          Open;
          First;
          while not eof do
            begin
            if FieldByName('Qty_Invoiced').asfloat < 0 then
//              iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
              iQty := PostoNegQty(FieldByName('Quantity').asinteger)
            else
//              iQty := FieldByName('Qty_Invoiced').asinteger;
              iQty := FieldByName('Quantity').asinteger;

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
          ParamByName('PurchOrder').AsFloat := qrySalesByInvReference.AsFloat;
          open;
          rAddCost := fieldByName('Add_cost').AsFloat;
        end;
      rTotalCost := rTotalCost + rAddcost;
      end
    else
    if qrySalesByInvSales_Invoice_type.asstring = 'S' then
      begin
        with qryGetPOCosts do
          begin
            Close;
            ParamByName('Sales_Invoice').AsInteger := qrySalesByInvSales_Invoice.asInteger;
            ParamByName('Line_No').AsInteger := qryGetInvLineInvoice_Line_No.asInteger;
            Open;
            {either no Purchase Order exists for the stationery order or this is a Stock
            Call Off order}
            if recordcount = 0 then
              begin
                qrlblSupplier.caption := 'Stock Warehouse';
              end
            else
              begin
                qrlblSupplier.caption := qryGetPOCosts.fieldbyname('Name').asstring;
              end;
          end;
        qryGetPOCosts.First;

        rTotalCost := qryGetPOCosts.fieldbyname('Total_Cost').asfloat;
        
        if bGetAddCosts and (qryGetPOCosts.fieldbyname('Purch_ord').asinteger <> 0) then
          begin
            with qryAddPOCosts do
              begin
                Close;
                ParamByName('Purch_Ord').AsInteger := qryGetPOCosts.fieldbyname('Purch_ord').asInteger;
                Open;
                First;
                rTotalCost := rTotalCost + fieldbyname('Total_Cost').asfloat;
                bGetAddCosts := false;
              end;
          end;

        with qryGetSOCosts do
          begin
            Close;
            ParamByName('Sales_order').AsInteger := qrySalesByInvReference.asInteger;
            ParamByName('Sales_Order_Line').AsInteger := qryGetInvLineSales_order_Line_no.asInteger;
            ParamByName('Qty_Invoiced').AsInteger := qryGetInvLineQty_Invoiced.asInteger;
            Open;
            First;
            rTotalCost := rTotalCost + fieldbyname('Total_Cost').asfloat;
          end;
      end
    else
    if qrySalesByInvSales_Invoice_type.asstring = 'J' then
      begin
      qrlblSupplier.Caption := GetJBLineSupplier(qryGetInvLine.fieldbyname('Job_Bag').asinteger,
                                              qryGetInvLine.fieldbyname('Job_Bag_Line').asinteger);

      with qryGetJBCosts do
        begin
          Close;
          ParamByName('Sales_invoice').AsInteger :=qrySalesByInvSales_Invoice.asInteger;
          ParamByName('Line_No').AsInteger := qryGetInvLineInvoice_Line_No.asInteger;
          if ExcludeJBCosts then
            ParamByName('Line_Is_Internal_Cost').Asstring := 'N'
          else
            ParamByName('Line_Is_Internal_Cost').Asstring := 'Y';
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
        parambyname('Sales_invoice').asinteger := qrySalesByInvSales_Invoice.asInteger;
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
                    {get an associated purchase order costs}
                    qryGetPOCrCosts.Close;
                    qryGetPOCrCosts.ParamByName('Sales_Order').AsInteger := fieldbyname('Sales_Order').asInteger;
                    qryGetPOCrCosts.ParamByName('Sales_Order_line_no').AsInteger := fieldbyname('Sales_Order_line_no').asInteger;
                    qryGetPOCrCosts.Open;

                    if qryGetPOCrCosts.recordcount > 0 then
                      begin
                        rTotalCost := rTotalCost + (((iQty / qryGetPOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                            * qryGetPOCrCosts.FieldByName('Purchase_Price').asfloat))*-1;
                      end;
                    {get any costs if this is a stock call off}
                    qryGetSOCrCosts.close;
                    qryGetSOCrCosts.ParamByName('Sales_Order').AsInteger := fieldbyname('Sales_Order').asInteger;
                    qryGetSOCrCosts.ParamByName('Sales_Order_line_no').AsInteger := fieldbyname('Sales_Order_line_no').asInteger;
                    qryGetSOCrCosts.Open;

                    if qryGetSOCrCosts.recordcount > 0 then
                      begin
                          rTotalCost := rTotalCost + ((iQty / qryGetSOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                            * qryGetSOCrCosts.FieldByName('Part_Cost').asfloat)*-1;
                      end;
                  end
            else
              rTotalCost := rTotalCost + 0.00;
          end;
      end;
    end;

  TotCstQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotalCost);
  itotal_Cost := itotal_Cost + rTotalCost;
  rInvTotal_cost := rInvTotal_Cost + rTotalCost;
  repTotal_Cost := RepTotal_Cost + rTotalCost;

  {collate the line type values}
  LineTypeArray[iLineType,1] := LineTypeArray[iLineType,1] + rTotalCost;
  LineTypeArray[iLineType,2] := LineTypeArray[iLineType,2] + rGoodsTotal;
  LineTypeArray[iLineType,3] := LineTypeArray[iLineType,3] + rVatValue;

  MargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rGoodsTotal - rTotalCost);

  iheight := lblDesc.height + 1;
  if iHeight > 25 then
    qrsubdetail1.height := iheight
  else
    qrsubdetail1.height := 25;

end;

procedure TPBRPSalesByInvDetFrm.QRSbDtlChrgBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
rVatValue: real;
begin
PrintBand := qryInvCharges.Fieldbyname('Amount').asfloat <> 0;

  rVatValue := (qryInvCharges.Fieldbyname('Amount').asfloat
     * (qryInvCharges.FieldByName('Vat_Rate').AsFloat / 100));

// rAddTotal := qryInvCharges.Fieldbyname('Amount').asfloat;

//if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
//    QRLblChrg.Caption := formatfloat('0.00',(PosToNegMoney(qryInvCharges.Fieldbyname('Amount').asfloat)))
//  else
    QRLblChrg.Caption := formatfloat('0.00',(qryInvCharges.Fieldbyname('Amount').asfloat));

//if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
//    QRLblChrgVat.Caption := formatfloat('0.00',(PosToNegMoney(rVATValue)))
//  else
    QRLblChrgVat.Caption := formatfloat('0.00',(rVATValue));

//if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
//    QRLblChrgTot.Caption := formatfloat('0.00',(PosToNegMoney(rVATValue + qryInvCharges.Fieldbyname('Amount').asfloat)))
//  else
    QRLblChrgTot.Caption := formatfloat('0.00',(rVATValue + qryInvCharges.Fieldbyname('Amount').asfloat));

if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
    QRLblChrgCost.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',qryInvCharges.Fieldbyname('cost_price').asfloat)
  else
    QRLblChrgCost.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(qryInvCharges.Fieldbyname('cost_price').asfloat));

if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
    QRLblChrgMarg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',qryInvCharges.Fieldbyname('Amount').asfloat-
                                                               qryInvCharges.Fieldbyname('cost_price').asfloat)
  else
    QRLblChrgMarg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(qryInvCharges.Fieldbyname('Amount').asfloat-
                                             qryInvCharges.Fieldbyname('cost_price').asfloat));

  {collate the line type values}
  LineTypeArray[iLineType,1] := LineTypeArray[iLineType,1] + qryInvCharges.Fieldbyname('cost_price').asfloat;
  LineTypeArray[iLineType,2] := LineTypeArray[iLineType,2] + qryInvCharges.Fieldbyname('amount').asfloat;

  rInvTotal_cost := rInvTotal_Cost + qryInvCharges.Fieldbyname('cost_price').asfloat;
  repTotal_Cost := repTotal_Cost + qryInvCharges.Fieldbyname('cost_price').asfloat;

end;

procedure TPBRPSalesByInvDetFrm.QRSbDtlInvTotBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iTotal_Sell := iTotal_Sell + qrySalesByInvGoods_Value.asfloat;
  iTotal_Vat := iTotal_Vat + qrySalesByInvVat_Value.asfloat;
  RepTotal_Sell := RepTotal_Sell + qrySalesByInvGoods_Value.asfloat;
  RepTotal_Vat := RepTotal_Vat + qrySalesByInvVat_Value.asfloat;
  QRLblInvTotCst.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvTotal_Cost);
  QRLblInvTotMarg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',qrySalesbyInvGoods_Value.asfloat - rInvTotal_Cost);
end;

function TPBRPSalesByInvDetFrm.GetJBLineDesc(tempCode,
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

function TPBRPSalesByInvDetFrm.GetJBLineSupplier(tempCode,
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

function TPBRPSalesByInvDetFrm.GetPOLineDesc(tempCode: real;
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

function TPBRPSalesByInvDetFrm.GetPOSupplier(tempCode: real): string;
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

function TPBRPSalesByInvDetFrm.GetSOLineDesc(tempCode,
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

procedure TPBRPSalesByInvDetFrm.QRSbDtlInvTotAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
rInvTotal_Cost := 0;
end;

procedure TPBRPSalesByInvDetFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if UseSubReps then
    tempStr := '"Inv. No."'
    + ',"Inv. Date"'
    + ',"Customer"'
    + ',"Branch"'
    + ',"Account Code"'
    + ',"Customer Type"'
    + ',"Description"'
    + ',"Order"'
    + ',"Line Description"'
    + ',"Quantity"'
    + ',"Selling Price"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Cost Price"'
    + ',"Gross Profit Margin"'
    + ',"Customer Order Ref"'
    + ',"Supplier Name"'
    + ',"Sub Rep Name"'
    + ',"Account Manager"'
    + ',"Line Type"'
  else
    tempStr := '"Inv. No."'
    + ',"Inv. Date"'
    + ',"Customer"'
    + ',"Branch"'
    + ',"Account Code"'
    + ',"Customer Type"'
    + ',"Description"'
    + ',"Order"'
    + ',"Line Description"'
    + ',"Quantity"'
    + ',"Selling Price"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Cost Price"'
    + ',"Gross Profit Margin"'
    + ',"Customer Order Ref"'
    + ',"Supplier Name"'
    + ',"Rep Name"'
    + ',"Account Manager"'
    + ',"Line Type"';

  writeLn(self.exportFile, tempStr);
  self.qckrpSalesByInv.Prepare;
  
  CloseFile(self.exportFile);
end;

procedure TPBRPSalesByInvDetFrm.QRSubDetInvlnsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
  incProgBar: boolean;
begin
  if self.exporting then
  begin
    //invoice no
    if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
      tempStr := '"CN/'+ qrySalesByinvSales_invoice_no.asstring + '"'
    else
      tempStr := '"' + qrySalesByinvSales_invoice_no.asstring + '"';

    if tempStr <> self.lastInv then
      incProgBar := true
    else
      incProgBar := false;

    self.lastInv := tempStr;

    //invoice date
    tempStr := tempStr + ',"' + qrySalesbyInvInvoice_Date.asString + '"';

    //customer name
    tempStr := tempStr + ',"' + qrySalesByInvName.asstring + '"';

    //customer Branch Name
    tempStr := tempStr + ',"' + qrySalesByInvBranch_Name.asstring + '"';

    //account code
    tempStr := tempStr + ',"' + qrySalesbyInvAccount_Code.asString + '"';

    //Customer Type
    tempStr := tempStr + ',"' + qrySalesbyInvCustomer_Type_Description.asString + '"';

    //invoice description
    tempStr := tempStr + ',"' + qrySalesByInvInvoice_Description.asstring + '"';

    //order No
    if qrySalesByInvInvoice_or_credit.asstring = 'C' then
    begin
      tempStr := tempStr + ',"INV/' + qrySalesByInvReference.asstring + '"'
    end
    else
    begin
      if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
        tempStr := tempStr + ',"SO/' + qrySalesByInvReference.asstring + '"'
      else if qrySalesByInvSales_Invoice_Type.asstring = 'J' then
        tempStr := tempStr + ',"JB/' + qrySalesByInvReference.asstring + '"'
      else
        tempStr := tempStr + ',"' + qrySalesByInvReference.asstring + '"';
    end;
    
    //line description
    tempStr := tempStr + ',"' + lblDesc.caption + '"';

    //quantity
    tempStr := tempStr + ',"' + QtyInvoicedlbl.caption + '"';

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

    //Customer Order Reference
    sCustOrderNo := dmSalesInvoice.GetCustomerOrderNo(qrySalesByinvSales_invoice_Type.asstring, qrySalesByInvReference.asstring);
    tempStr := tempStr + ',"' + sCustOrderNo + '"';

    //supplier name
(*    if trim(qrySalesByInvSupplier_Name.asstring) = '' then
      if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
        tempStr2 := 'Stock Warehouse'
      else
        tempStr2 := 'Multiple Suppliers'
    else
      tempStr2 := qrySalesByInvSupplier_Name.asstring;

    tempStr := tempStr + ',"' + tempStr2 + '"';
*)
    //Supplier
    tempStr := tempStr + ',"' + qrlblSupplier.caption + '"';

    //repName
    tempStr := tempStr + ',"' + qrySalesbyInvRep_Name.asString + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qrySalesbyInvAccount_Manager_Name.asString + '"';

    //Line Type
    case iLinetype of
        1: tempStr := tempStr + ',"' + 'Purchase Orders' + '"';
        2: tempStr := tempStr + ',"' + 'Stock' + '"';
        3: tempStr := tempStr + ',"' + 'Production' + '"';
    else
    end;

    writeln(self.exportFile, tempStr);
    if incProgBar then
      PBRSSalesByInvFrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPSalesByInvDetFrm.QRSbDtlChrgAfterPrint(
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
    if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
      tempStr := '"CN/'+ qrySalesByinvSales_invoice_no.asstring + '"'
    else
      tempStr := '"' + qrySalesByinvSales_invoice_no.asstring + '"';

    //invoice date
    tempStr := tempStr + ',"' + qrySalesbyInvInvoice_Date.asString + '"';

    //customer name
    tempStr := tempStr + ',"' + qrySalesByInvName.asstring + '"';

    //customer Branch Name
    tempStr := tempStr + ',"' + qrySalesByInvBranch_Name.asstring + '"';

    //account code
    tempStr := tempStr + ',"' + qrySalesbyInvAccount_Code.asString + '"';

    //Customer Type
    tempStr := tempStr + ',"' + qrySalesbyInvCustomer_Type_Description.asString + '"';

    //job description
    tempStr := tempStr + ',"' + lblDesc.caption + '"';

    //order No
    if qrySalesByInvInvoice_or_credit.asstring = 'C' then
    begin
      tempStr := tempStr + ',"INV/' + qrySalesByInvReference.asstring + '"'
    end
    else
    begin
      if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
        tempStr := tempStr + ',"SO/' + qrySalesByInvReference.asstring + '"'
      else if qrySalesByInvSales_Invoice_Type.asstring = 'J' then
        tempStr := tempStr + ',"JB/' + qrySalesByInvReference.asstring + '"'
      else
        tempStr := tempStr + ',"' + qrySalesByInvReference.asstring + '"';
    end;

    //job description
    tempStr := tempStr + ',"' + qryInvCharges.FieldByName('Details').asstring + '"';

    //quantity
    tempStr := tempStr + ',"1"';

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

    //Customer Order Reference
    tempStr := tempStr + ',"' + sCustOrderNo + '"';

    //supplier name
    tempStr := tempStr + ',"' + qrlblSupplier.Caption + '"';

    //repName
    tempStr := tempStr + ',"' + qrySalesbyInvRep_Name.asString + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qrySalesbyInvAccount_Manager_Name.asString + '"';

    //Line Type
    case iLinetype of
        1: tempStr := tempStr + ',"' + 'Purchase Orders' + '"';
        2: tempStr := tempStr + ',"' + 'Stock' + '"';
        3: tempStr := tempStr + ',"' + 'Production' + '"';
    else
    end;

    writeln(self.exportFile, tempStr);
  end;
end;

procedure TPBRPSalesByInvDetFrm.qrbndPageHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if self.exporting then
  begin
    PBRSSalesByInvFrm.prgbrExport.Max :=
      self.qckrpSalesByInv.dataset.RecordCount;
  end;
end;

procedure TPBRPSalesByInvDetFrm.SetUseSubREps(const Value: boolean);
begin
  FUseSubREps := Value;
end;

procedure TPBRPSalesByInvDetFrm.SettotalbyAM(const Value: Boolean);
begin
  FtotalbyAM := Value;
end;

procedure TPBRPSalesByInvDetFrm.SetExcludeJBCosts(const Value: boolean);
begin
  FExcludeJBCosts := Value;
end;

end.
