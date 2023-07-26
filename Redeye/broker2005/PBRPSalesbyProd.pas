unit PBRPSalesbyProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Db, Qrctrls, CCSPrint, CCSCommon,
  QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPSalesbyProdFrm = class(TForm)
    qckrpSalesByProd: TQuickRep;
    repQRGroup: TQRGroup;
    qrySalesbyProd: TFDQuery;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel6: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrdbtxtPOLine: TQRDBText;
    QRDBText2: TQRDBText;
    qrdbtxtInvDate: TQRDBText;
    QRDBText1: TQRDBText;
    qrdbtxtGoodsValue: TQRDBText;
    qrDBGrpText: TQRDBText;
    repQRGroup1: TQRGroup;
    repQRGroupFooter: TQRBand;
    repQRGroup1Footer: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrySalesbyProdSales_Invoice: TIntegerField;
    qrySalesbyProdInvoice_Line_No: TIntegerField;
    qrySalesbyProdPurchase_Order: TFloatField;
    qrySalesbyProdLine: TIntegerField;
    qrySalesbyProdQty_Invoiced: TFloatField;
    qrySalesbyProdGoods_Value: TFloatField;
    qrySalesbyProdVat_Code: TIntegerField;
    qrySalesbyProdVat_Value: TFloatField;
    qrySalesbyProdPrice_Unit: TIntegerField;
    qrySalesbyProdsales_Order: TIntegerField;
    qrySalesbyProdSales_Order_Line_no: TIntegerField;
    qrySalesbyProdJob_Bag: TIntegerField;
    qrySalesbyProdJob_Bag_Line: TIntegerField;
    qrySalesbyProdCredit_type: TStringField;
    qrySalesbyProdInvoice_Date: TDateTimeField;
    qrySalesbyProdSales_Invoice_No: TStringField;
    qrySalesbyProdCustomer: TIntegerField;
    qrySalesbyProdBranch_no: TIntegerField;
    qrySalesbyProdInv_to_Customer: TIntegerField;
    qrySalesbyProdInv_to_Branch: TIntegerField;
    qrySalesbyProdCustomer_Name: TStringField;
    qrySalesbyProdBranch_Name: TStringField;
    qrySalesbyProdDescription: TStringField;
    qrySalesbyProdPrice_Unit_Factor: TFloatField;
    qrySalesbyProdQuantity: TIntegerField;
    qrySalesbyProdTotal_Goods: TCurrencyField;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblQtyTotal: TQRLabel;
    qrlblGoodsTotal: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlblGoodsGrpTotal: TQRLabel;
    qrySalesbyProdInvoiceRef: TStringField;
    repQRGroup2: TQRGroup;
    repQRGroup2Footer: TQRBand;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    qrlblCustomerBr: TQRLabel;
    qrlblQtyGrp2Total: TQRLabel;
    qrlblGoodsGrp2Total: TQRLabel;
    QRBand2: TQRBand;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    qrlblGoodsRepTotal: TQRLabel;
    qrySalesbyProdOrder: TStringField;
    qrmmAddChrg: TQRMemo;
    qrmmAddChrgPrice: TQRMemo;
    qryInvAddChrgs: TFDQuery;
    qryInvAddChrgsdetails: TStringField;
    qryInvAddChrgsamount: TCurrencyField;
    qryInvAddChrgsbyInvCust: TFDQuery;
    qryInvAddChrgsbyOrdCust: TFDQuery;
    qrlblAddChrgs: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape6: TQRShape;
    qrlblAddChrgeTot: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRlblCst: TQRLabel;
    QRLblPrft: TQRLabel;
    qrySalesbyProdInvoice_Or_Credit: TStringField;
    qrySalesbyProdSales_Invoice_Type: TStringField;
    qrySalesbyProdReference: TStringField;
    GetCostsQuery: TFDQuery;
    qryAddPOCosts: TFDQuery;
    qryGetSOCosts: TFDQuery;
    AddCostsQuery: TFDQuery;
    qryGetPOCosts: TFDQuery;
    qryGetJBCosts: TFDQuery;
    qryCreditLines: TFDQuery;
    QRLblCstGrp2Total: TQRLabel;
    QRLblPrftGrp2Total: TQRLabel;
    QRLblCstTotal: TQRLabel;
    QRlblPrftTotal: TQRLabel;
    QRLblCstRepTotal: TQRLabel;
    QRLblPrftRepTotal: TQRLabel;
    QRLblCstGrpTotal: TQRLabel;
    QRLblPrftGrpTotal: TQRLabel;
    QRLabel11: TQRLabel;
    QRLblPerc: TQRLabel;
    QRLblPercGrp2Total: TQRLabel;
    QRLblPercTotal: TQRLabel;
    QRLblPercGrpTotal: TQRLabel;
    QRLblPercRepTotal: TQRLabel;
    QRLabel12: TQRLabel;
    qrmmAddChrgCost: TQRMemo;
    qryInvAddChrgsCost_Price: TFloatField;
    qrlblAddChrgeCostTot: TQRLabel;
    qrmmAddChrgProfit: TQRMemo;
    qrlblAddChrgeProfitTot: TQRLabel;
    qrlblDescription: TQRLabel;
    qryPOLineFormRef: TFDQuery;
    qryJBLineFormRef: TFDQuery;
    qrySOLinePart: TFDQuery;
    qryGetPO: TFDQuery;
    qryGetJB: TFDQuery;
    qryGetSO: TFDQuery;
    qrlblFormReference: TQRLabel;
    procedure qrySalesbyProdTotal_GoodsGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesbyProdQuantityGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qckrpSalesByProdBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure repQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure repQRGroup1FooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure repQRGroup1FooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure repQRGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure repQRGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrySalesbyProdInvoiceRefGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure repQRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure repQRGroup2FooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure repQRGroup2FooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrySalesbyProdOrderGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    FtotalByBranch: Boolean;
    FtotalbyProduct: Boolean;
    exportFile: textFile;
    LineDescr: string;
    sContact, sOrderRef, sStartDate, sDeliveryDate, sApprovalDate: string;
    function GetFormReferenceIDDesc(const POnum: double;
      const POLine, JobBag, JBLine, SONum, SOLine: integer): string;
    function GetPOLineFormRefIDDesc(const PONum: double; Line: integer): string;
    function GetJBLineFormRefIDDesc(const JobBag, Line: integer): string;
    function GetSOLinePartDesc(const SalesOrder, Line: integer): string;
    procedure SettotalByBranch(const Value: Boolean);
    procedure SettotalbyProduct(const Value: Boolean);
    procedure GetPOrderInfo(const POrder: real; const Line: integer);
    procedure GetJobBagInfo(const JobBag: integer);
    procedure GetSOrderInfo(const SOrder: integer);
    { Private declarations }
  public
    dateFrom, dateTo: TDateTime;
    orderingCustomer: boolean;
    PrintCosts: Boolean;
    PrintGoods: Boolean;
    PrinterSettings: TPrinterSettings;
    exporting: boolean;
    ShowFormRefs: boolean;
    property totalByBranch: Boolean read FtotalByBranch write SettotalByBranch;
    property totalbyProduct: Boolean read FtotalbyProduct write SettotalbyProduct;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPSalesbyProdFrm: TPBRPSalesbyProdFrm;

implementation

uses PBRSSalesByProd;

var
  rSellGrpTotal, rSellRepTotal, rSellGrp1Total,
  rCstGrpTotal, rCstRepTotal, rCstGrp1Total, rCstGrp2Total,
  rQtyGrp1Total, rSellGrp2Total, rQtyGrp2Total: real;
  
{$R *.DFM}

procedure TPBRPSalesbyProdFrm.qrySalesbyProdTotal_GoodsGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
var
  rTotal: real;
begin
  if qrySalesByProdPrice_Unit_Factor.asinteger = 0 then
    text := formatfloat('£#,###,##0.00;(£#,###,##0.00)',qrySalesByProdGoods_Value.asfloat)
  else
    begin
      rTotal :=  (qrySalesByProdQty_Invoiced.asinteger / qrySalesByProdPrice_Unit_Factor.asinteger)
                  *  qrySalesByProdGoods_Value.asfloat;
      if qrySalesByProdQty_Invoiced.asinteger < 0 then
        rTotal := rTotal * -1;
      text := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotal);
    end;
end;

procedure TPBRPSalesbyProdFrm.qrySalesbyProdQuantityGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByProdDescription.asstring <> '' then
    text := formatfloat('#,###,##0;(#,###,##0)',qrySalesByProdQty_Invoiced.asfloat)
  else
    text := '';
end;

procedure TPBRPSalesbyProdFrm.qckrpSalesByProdBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rSellGrpTotal := 0;
  rSellGrp1Total := 0;
  rQtyGrp1Total := 0;
  rSellRepTotal := 0;
  rCstGrpTotal := 0;
  rCstRepTotal := 0;

  with qckrpSalesByProd.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
  end;
  if PrintGoods = false then
  begin
    RepQRGroupFooter.enabled := false;
    QRBand2.enabled := False;
    QRLabel6.enabled := False;
    QRLabel9.enabled := false;
    QRlabel10.enabled := False;
    QRLabel11.enabled := False;
    QRLabel12.enabled := False;
    QRDBTxtGoodsValue.Enabled := False;
    QRLblCst.enabled := False;
    QRLblPrft.enabled := False;
    QRLblPerc.enabled := False;
    QRDBText2.left := 330;
    QRLabel15.left := 320;
    QRLabel14.left := 390;
    QRDBTxtInvDate.Left := 390;
    QRLabel20.left := 490;
    QRDBtext1.left := 490;
    qrlblQtyGrp2Total.left := 446;
    qrlblQtyTotal.left := 471;
    qrshape1.width := 121;
    qrshape2.width := 121;
    qrshape3.width := 121;
    qrshape1.left := 410;
    qrshape2.left := 410;
    qrshape3.left := 410;
    repQRGroupFooter.enabled := false;
    qrlblGoodsGrp2Total.enabled := false;
    qrlblCstGrp2Total.enabled := false;
    qrlblPrftGrp2Total.enabled := false;
    qrlblPercGrp2Total.enabled := false;
    qrlblGoodsTotal.enabled := false;
    qrlblCstTotal.enabled := false;
    qrlblPrftTotal.enabled := false;
    qrlblPercTotal.enabled := false;
    qrlblGoodsTotal.enabled := false;
  end
  else
    begin
      if PrintCosts = False then
      begin
        QRLabel9.enabled := false;
        QRlabel10.enabled := False;
        QRLabel11.enabled := False;
        QRLabel12.enabled := False;
        QRLblCst.enabled := False;
        QRLblPrft.enabled := False;
        QRLblPerc.enabled := False;
        QRLblCstGrpTotal.enabled := False;
        QRLblPrftGrpTotal.enabled := False;
        QRLblPercGrpTotal.enabled := False;
        QRlblCstRepTotal.enabled := False;
        QRlblPrftRepTotal.enabled := False;
        QRlblPercRepTotal.enabled := False;
        QRLblCstTotal.enabled := False;
        QRLblPrftTotal.enabled := False;
        QRlblPercTotal.enabled := False;
        QRLblCstGrp2Total.enabled := False;
        QRLblPrftGrp2Total.enabled := False;
        QRLblPercGrp2Total.enabled := False;
        QRShape1.width := 170;
        QRShape2.width := 170;
        QRShape3.width := 170;
        QRShape4.width := 170;
        QRShape5.width := 170;
        QRShape6.width := 170;
      end;
    end;


  qrySalesByProd.Open;
  RepQRGroup.Expression := 'QRYSalesByProd.Customer_Name';
  RepQRGroup1.Expression := 'QRYSalesByProd.Description';
  RepQRGroup2.Expression := 'QRYSalesByProd.Branch_Name';

  if TotalbyBranch then
    begin
      repQRGroup2.enabled := true;
      repQRGroup2Footer.enabled := true;
    end;

  if TotalbyProduct then
    begin
      repQRGroup1.enabled := true;
      repQRGroup1Footer.enabled := true;
    end;
end;

procedure TPBRPSalesbyProdFrm.repQRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  qrdbGrptext.DataField := qrySalesByProdCustomer_Name.asstring;
end;

procedure TPBRPSalesbyProdFrm.repQRGroup1FooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrLblGoodsTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rSellGrp1Total);
  qrLblCstTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rCstGrp1Total);
  qrLblPrftTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)', rSellGrp1Total - rCstGrp1Total);

  if rSellGrp1Total - rCstGrp1Total = 0 then
    QRLblPercTotal.Caption := formatFloat('##0%',0.00)
  else
    begin
      try
        QRLblPercTotal.Caption := formatFloat('##0%',((rSellGrp1Total - rCstGrp1Total)*100)/rSellGrp1Total);
      except
        QRLblPercTotal.Caption := formatFloat('##0%',-999.00);
      end;
    end;
  qrLblQtyTotal.caption := formatfloat('#,###,##0;(#,###,##0)',rQtyGrp1Total);
end;

procedure TPBRPSalesbyProdFrm.repQRGroup1FooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rQtyGrp1Total := 0;
  rSellGrp1Total := 0;
  rCstGrp1Total := 0;
end;

procedure TPBRPSalesbyProdFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  rSell: real;
  tempStr, tempStr2: string;
  rTotal: real;
begin
  if qrySalesByProdPrice_Unit_Factor.asinteger = 0 then
    rsell := qrySalesByProdGoods_Value.asfloat
  else
    begin
      rsell :=  (qrySalesByProdQty_Invoiced.asinteger / qrySalesByProdPrice_Unit_Factor.asinteger)
                  *  qrySalesByProdGoods_Value.asfloat;
      if qrySalesByProdQty_Invoiced.asinteger < 0 then
        rSell := rSell * -1;
    end;

  rSellGrpTotal := rSellGrpTotal + rSell;
  rSellRepTotal := rSellRepTotal + rSell;
  rSellGrp1Total := rSellGrp1Total + rSell;
  rQtyGrp1Total := rQtyGrp1Total + qrySalesByProdQty_Invoiced.asfloat;
  rSellGrp2Total := rSellGrp2Total + rSell;
  rQtyGrp2Total := rQtyGrp2Total + qrySalesByProdQty_Invoiced.asfloat;

  if self.exporting then
  begin
    tempstr := '';

    if qrySalesByProdJob_Bag.asstring <> '' then
      tempStr2 := '"' + 'JB/'+qrySalesByProdJob_Bag.asstring + '"'
    else if qrySalesByProdSales_Order.asstring <> '' then
      tempStr2 := '"' + 'SO/'+qrySalesByProdSales_Order.asstring + '"'
    else if qrySalesByProdPurchase_Order.asstring <> '' then
      tempStr2 := '"' + qrySalesByProdPurchase_Order.asstring + '"';
    tempStr := tempStr + tempStr2;

    tempStr := tempStr + ',"' + sContact + '"';

    tempStr := tempStr + ',"' + qrySalesbyProdCustomer_Name.AsString + '"';

    tempStr := tempStr + ',"' + sOrderRef + '"';

    tempStr := tempStr + ',"' + sStartDate + '"';

    tempStr := tempStr + ',"' + qrlblFormReference.Caption + '"';

    tempStr := tempStr + ',"' + qrySalesbyProdDescription.asString + '"';

    tempStr := tempStr + ',"' + sApprovalDate + '"';

    tempStr := tempStr + ',"' + sDeliveryDate + '"';

    if qrySalesByProdQty_Invoiced.asinteger < 0 then
      tempStr2 := ',"' + 'CN/' + qrySalesByProdSales_Invoice_no.asstring + '"'
    else
      tempStr2 := ',"' + qrySalesByProdSales_Invoice_no.asstring + '"';
    tempStr := tempStr + tempStr2;

    tempStr := tempStr + ',"' + qrySalesbyProdInvoice_Date.asString + '"';

    if qrySalesByProdDescription.asstring <> '' then
      tempStr2 := ',"' + formatfloat('###0;(###0)',qrySalesByProdQty_Invoiced.asfloat) + '"'
    else
      tempStr2 := ',';
    tempStr := tempStr + tempStr2;

    if self.PrintGoods then
    begin
      if qrySalesByProdPrice_Unit_Factor.asinteger = 0 then
        tempStr2 := ',"' + formatfloat('£#,###,##0.00;(£#,###,##0.00)',qrySalesByProdGoods_Value.asfloat) + '"'
      else
      begin
        rTotal :=  (qrySalesByProdQty_Invoiced.asinteger / qrySalesByProdPrice_Unit_Factor.asinteger)
                  *  qrySalesByProdGoods_Value.asfloat;
        if qrySalesByProdQty_Invoiced.asinteger < 0 then
          rTotal := rTotal * -1;
        tempStr2 := ',"' + formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotal) + '"';
      end;
      tempStr := tempStr + tempStr2;

      if self.PrintCosts then
      begin
        tempStr := tempStr + ',"' + QRLblCst.Caption + '"'
          + ',"' + QRLblPrft.Caption + '"'
          + ',"' + QRLblPerc.Caption + '"';
      end;
    end;
    writeln(self.exportFile, tempStr);
    PBRSSalesByProdFrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPSalesbyProdFrm.repQRGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  addChrgTot, addChrgCostTot, addChrgProfitTot: double;
  tempstr, tempstr1, tempstr2: string;
begin
  self.qryInvAddChrgs.Active := false;

  if self.orderingCustomer then
  begin
    self.qryInvAddChrgs.ParamByName('customer').asInteger :=
      qrySalesbyProdCustomer.AsInteger;
  end
  else
  begin
    self.qryInvAddChrgs.ParamByName('customer').asInteger :=
      qrySalesbyProdInv_To_Customer.AsInteger;
  end;
  self.qryInvAddChrgs.ParamByName('dateFrom').AsDateTime :=
    dateFrom;
  self.qryInvAddChrgs.ParamByName('dateTo').AsDateTime :=
    dateTo;

  self.qryInvAddChrgs.Active := true;
  self.qryInvAddChrgs.First;

  self.qrmmAddChrg.Lines.Clear;
  self.qrmmAddChrgPrice.Lines.Clear;
  self.qrmmAddChrgCost.Lines.Clear;
  self.qrmmAddChrgProfit.Lines.Clear;
  addChrgTot := 0.00;
  addChrgCostTot := 0.00;

  if self.qryInvAddChrgs.RecordCount > 0 then
  begin
    qrlblAddChrgs.Enabled := true;
    qrmmAddChrg.enabled := true;
    qrmmAddChrgPrice.enabled := true;
    qrmmAddChrgCost.enabled := true;
    qrmmAddChrgProfit.enabled := true;
    QRShape6.enabled := true;
    QRLabel8.enabled := true;
    qrlblAddChrgeTot.enabled := true;
    qrlblAddChrgeCostTot.enabled := true;
    qrlblAddChrgeProfitTot.enabled := true;

    self.repQRGroupFooter.Height := 74 + ((self.qryInvAddChrgs.RecordCount-1) * 15);

    self.qrmmAddChrg.Height := (self.qryInvAddChrgs.RecordCount * 14) + 2;
    self.qrmmAddChrgPrice.Height := (self.qryInvAddChrgs.RecordCount * 14) + 2;
    self.qrmmAddChrgCost.Height := self.qrmmAddChrgPrice.Height;
    self.qrmmAddChrgProfit.Height := self.qrmmAddChrgPrice.Height;

    while not self.qryInvAddChrgs.Eof do
    begin
      self.qrmmAddChrg.Lines.Add(self.qryInvAddChrgsdetails.AsString);
      self.qrmmAddChrgPrice.Lines.Add('£'+FloatToStrF(self.qryInvAddChrgsamount.AsFloat, ffFixed, 15, 2));
      self.qrmmAddChrgCost.Lines.Add('£'+FloatToStrF(self.qryInvAddChrgsCost_price.AsFloat, ffFixed, 15, 2));
      self.qrmmAddChrgProfit.Lines.Add('£'+FloatToStrF((self.qryInvAddChrgsamount.AsFloat-self.qryInvAddChrgsCost_price.AsFloat), ffFixed, 15, 2));
      rSellGrpTotal := rSellGrpTotal + self.qryInvAddChrgsamount.AsFloat;
      rCstGrpTotal := rCstGrpTotal + self.qryInvAddChrgsCost_Price.AsFloat;
      rSellRepTotal := rSellRepTotal + self.qryInvAddChrgsamount.AsFloat;
      rCstRepTotal := rCstRepTotal + self.qryInvAddChrgsCost_Price.AsFloat;
      addChrgTot := addChrgTot + self.qryInvAddChrgsamount.AsFloat;
      addChrgCostTot := addChrgCostTot + self.qryInvAddChrgsCost_Price.AsFloat;
      addChrgProfitTot := addChrgProfitTot + (self.qryInvAddChrgsamount.AsFloat-self.qryInvAddChrgsCost_Price.AsFloat);

      if self.exporting then
      begin
        tempstr := '';

        tempStr2 := '"' + '' + '"';
        tempStr := tempStr + tempStr2;

        tempStr := tempStr + ',"' + '' + '"';

        tempStr := tempStr + ',"' + qrySalesbyProdCustomer_Name.AsString + '"';

        tempStr := tempStr + ',"' + '' + '"';

        tempStr := tempStr + ',"' + '' + '"';

        tempStr := tempStr + ',"' + '' + '"';

        tempStr := tempStr + ',"' + self.qryInvAddChrgsdetails.AsString + '"';

        tempStr := tempStr + ',"' + '' + '"';

        tempStr := tempStr + ',"' + '' + '"';

        tempStr2 := ',"' + '' + '"';
        tempStr := tempStr + tempStr2;

        tempStr := tempStr + ',"' + '' + '"';

        tempStr2 := ',';
        tempStr := tempStr + tempStr2;

        if self.PrintGoods then
          begin
            tempStr2 := ',"' + formatfloat('£#,###,##0.00;(£#,###,##0.00)',self.qryInvAddChrgsamount.AsFloat) + '"';
            tempStr := tempStr + tempStr2;

            if self.PrintCosts then
            begin
              tempStr := tempStr + ',"' + formatfloat('£#,###,##0.00;(£#,###,##0.00)',self.qryInvAddChrgsCost_price.AsFloat) + '"'
                      + ',"' + formatfloat('£#,###,##0.00;(£#,###,##0.00)',self.qryInvAddChrgsamount.AsFloat-self.qryInvAddChrgsCost_price.AsFloat) + '"'
                      + ',"' + '' + '"';
            end;
          end;
        writeln(self.exportFile, tempStr);
      end;
      self.qryInvAddChrgs.next;
    end;
    qrlblAddChrgeTot.Caption := '£' + FloatToStrF(addChrgTot, ffFixed, 15, 2);
    qrlblAddChrgeCostTot.Caption := '£' + FloatToStrF(addChrgCostTot, ffFixed, 15, 2);
    qrlblAddChrgeProfitTot.Caption := '£' + FloatToStrF(addChrgProfitTot, ffFixed, 15, 2);

    //the memo components vary in size so we need to push the other components in the band
    //further down to allow for this.
    QRLabel8.top := qrmmAddChrg.Top + (self.qryInvAddChrgs.RecordCount * 14) + 7;
    qrlblAddChrgeTot.top := qrmmAddChrg.Top + (self.qryInvAddChrgs.RecordCount * 14) + 7;
    qrlblAddChrgeCostTot.top := qrlblAddChrgeTot.top;
    qrlblAddChrgeProfitTot.top := qrlblAddChrgeTot.top;
    
    QRShape6.top := qrmmAddChrg.Top + (self.qryInvAddChrgs.RecordCount * 14);



    QRLabel2.top := qrmmAddChrg.Top + (self.qryInvAddChrgs.RecordCount * 14) + 39;
    qrlblGoodsGrpTotal.top := qrmmAddChrg.Top + (self.qryInvAddChrgs.RecordCount * 14) + 39;
    QRShape2.top := qrmmAddChrg.Top + (self.qryInvAddChrgs.RecordCount * 14) + 32;
  end
  else
  begin
    qrlblAddChrgs.Enabled := false;
    qrmmAddChrg.enabled := false;
    qrmmAddChrgPrice.enabled := false;
    qrmmAddChrgCost.enabled := false;
    QRShape6.enabled := false;
    QRLabel8.enabled := false;
    qrlblAddChrgeTot.enabled := false;
    qrlblAddChrgeCostTot.enabled := false;
    qrlblAddChrgeProfitTot.enabled := false;
    QRLabel2.top := 6;
    qrlblGoodsGrpTotal.top := 6;
    QRShape2.top := 2;
  end;
  QRlblCstGrpTotal.top := qrLblGoodsGrpTotal.Top;
  QRLblPrftGrpTotal.top := QRLblGoodsGrpTotal.top;
  QRLblPercGrpTotal.top := QRLblGoodsGrpTotal.top;
  qrLblGoodsGrpTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rSellGrpTotal);
  qrLblCstGrpTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rCstGrpTotal);
  qrLblPrftGrpTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rSellGrpTotal - rCstGrpTotal);

  if rSellGrpTotal - rCstGrpTotal = 0 then
    QRLblPercGrpTotal.Caption := formatFloat('##0%',0.00)
  else
  begin
    try
      QRLblPercGrpTotal.Caption := formatFloat('##0%',((rSellGrpTotal - rCstGrpTotal)*100)/rSellGrpTotal);
    except
      QRLblPercGrpTotal.Caption := formatFloat('##0%',-999.00);
    end;
  end;
end;

procedure TPBRPSalesbyProdFrm.repQRGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr, tempStr2: string;
  inx: integer;
begin
  rSellGrpTotal := 0;
  rcstGrpTotal := 0;
end;

procedure TPBRPSalesbyProdFrm.qrySalesbyProdInvoiceRefGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qrySalesByProdQty_Invoiced.asinteger < 0 then
    text := 'CN/'+ qrySalesByProdSales_Invoice_no.asstring
  else
    text := qrySalesByProdSales_Invoice_no.asstring;
end;

procedure TPBRPSalesbyProdFrm.repQRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblCustomerBr.caption := qrySalesByProdCustomer_name.asstring + ' - ' +
                             qrySalesByProdBranch_name.asstring;
end;

procedure TPBRPSalesbyProdFrm.repQRGroup2FooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rQtyGrp2Total := 0;
  rSellGrp2Total := 0;
  rCstGrp2Total := 0;

end;

procedure TPBRPSalesbyProdFrm.repQRGroup2FooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrLblGoodsGrp2Total.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rSellGrp2Total);
  qrLblQtyGrp2Total.caption := formatfloat('#,###,##0;(#,###,##0)',rQtyGrp2Total);
  qrLblCstGrp2Total.caption :=  formatfloat('£#,###,##0.00;(£#,###,##0.00)',rCstGrp2Total);
  qrLblPrftGrp2Total.caption :=  formatfloat('£#,###,##0.00;(£#,###,##0.00)',rSellGrp2Total - rCstGrp2Total);

  if rSellGrp2Total - rCstGrp2Total = 0 then
    QRLblPercGrp2Total.Caption := formatFloat('##0%',0.00)
  else
    begin
      try
        QRLblPercGrp2Total.Caption := formatFloat('##0%',((rSellGrp2Total - rCstGrp2Total)*100)/rSellGrp2Total);
      except
        QRLblPercGrp2Total.Caption := formatFloat('##0%',-999.00);
      end;
    end;
end;

procedure TPBRPSalesbyProdFrm.SettotalByBranch(const Value: Boolean);
begin
  FtotalByBranch := Value;
end;

procedure TPBRPSalesbyProdFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblGoodsRepTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rSellRepTotal);
  qrlblCstRepTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rCstRepTotal);
  qrlblPrftRepTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rSellRepTotal - rCstRepTotal);

  if rSellRepTotal - rCstRepTotal = 0 then
    QRLblPercRepTotal.Caption := formatFloat('##0%',0.00)
  else
  begin
    try
      QRLblPercRepTotal.Caption := formatFloat('##0%',((rSellRepTotal - rCstRepTotal)*100)/rSellRepTotal);
    except
      QRLblPercRepTotal.Caption := formatFloat('##0%',-999.00);
    end;
  end;
end;

procedure TPBRPSalesbyProdFrm.SettotalbyProduct(const Value: Boolean);
begin
  FtotalbyProduct := Value;
end;

procedure TPBRPSalesbyProdFrm.qrySalesbyProdOrderGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByProdJob_Bag.asstring <> '' then
    text := 'JB/'+qrySalesByProdJob_Bag.asstring
  else
  if qrySalesByProdSales_Order.asstring <> '' then
    text := 'SO/'+qrySalesByProdSales_Order.asstring
  else
  if qrySalesByProdPurchase_Order.asstring <> '' then
    text := qrySalesByProdPurchase_Order.asstring;
end;

procedure TPBRPSalesbyProdFrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rTotalCost :real;
  rgoods: real;
  iQty: integer;
  raddcost: real;
begin
  rTotalCost := 0;
  self.LineDescr := '';
  qrlblFormReference.caption := '';

  {only get the costs if invoice}
  if (qrySalesByProdInvoice_or_Credit.asstring = 'I') or
     (qrySalesByProdInvoice_or_Credit.asstring = '') then
    begin
    if qrySalesByProdSales_Invoice_type.asstring = '' then
      begin
      with getCostsQuery do
        begin
          Close;
          ParamByName('Invoice_No').AsInteger :=qrySalesByProdSales_Invoice.asInteger;
          ParamByName('Line_No').AsInteger := qrySalesByProdInvoice_Line_No.asInteger;
          Open;
          First;

          if self.ShowFormRefs then
          begin
            self.LineDescr := FieldByName('Form_reference_id').asString + ' - ' + FieldByName('Form_reference_descr').asString;
            qrlblFormReference.caption := FieldByName('Form_reference_id').asString;
          end;

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
          ParamByName('PurchOrder').AsFloat := qrySalesByProdReference.AsFloat;
          open;
          rAddCost := fieldByName('Add_cost').AsFloat;
        end;
      rTotalCost := rTotalCost + rAddcost;
      end
    else
    if qrySalesByProdSales_Invoice_type.asstring = 'S' then
      begin
      with qryGetPOCosts do
        begin
        Close;
        ParamByName('Sales_Invoice').AsInteger := qrySalesByProdSales_Invoice.asInteger;
        ParamByName('Line_No').AsInteger := qrySalesByProdInvoice_Line_No.asInteger;
        Open;

        {either no Purchase Order exists for the stationery order or this is a Stock
        Call Off order}
        if recordcount = 0 then
          begin
            with qryGetSOCosts do
              begin
              Close;
              ParamByName('Sales_order').AsInteger := qrySalesByProdReference.asInteger;
              ParamByName('Sales_Order_Line').AsInteger := qrySalesByProdSales_order_Line_no.asInteger;
              Open;
              First;
              rTotalCost := fieldbyname('Total_Cost').asfloat;
              end;
          end
        else
          begin
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
        qrlblFormReference.caption := '';

        end;
      end
    else
    if qrySalesByProdSales_Invoice_type.asstring = 'J' then
      begin
      with qryGetJBCosts do
        begin
          Close;
          ParamByName('Sales_invoice').AsInteger :=qrySalesByProdSales_Invoice.asInteger;
          ParamByName('Line_No').AsInteger := qrySalesByProdInvoice_Line_No.asInteger;
          Open;
          First;

          if self.ShowFormRefs then
          begin
            self.LineDescr := FieldByName('Form_reference_id').asString + ' - ' + FieldByName('Form_reference_descr').asString;
            qrlblFormReference.caption := FieldByName('Form_reference_id').asString;
          end;

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
          parambyname('Sales_invoice').asinteger := qrySalesByProdSales_Invoice.asInteger;
          ParamByName('Line_No').AsInteger := qrySalesByProdInvoice_Line_No.asInteger;
          open;
          first;
          if self.ShowFormRefs then
          begin
            self.LineDescr := self.GetFormReferenceIDDesc(
              FieldByName('Purchase_order').asFloat,
              FieldByName('Line').asInteger,
              FieldByName('Job_bag').asInteger,
              FieldByName('Job_Bag_Line').asInteger,
              FieldByName('Sales_order').asInteger,
              FieldByName('Sales_Order_line_no').asInteger);
          end;

          while eof <> true do
            begin
            if FieldByName('Qty_Invoiced').asfloat < 0 then
              iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
            else
              iQty := FieldByName('Qty_Invoiced').asinteger;

            if FieldByName('Price_Unit_Factor').asfloat <> 0 then
              rTotalCost := rTotalCost + (iQty / FieldByName('Price_Unit_Factor').asinteger)
                      * FieldByName('Cost_Price').asfloat
            else
              rTotalCost := rTotalCost + FieldByName('Cost_Price').asfloat;
            next;
            end;
        end;
    end;

  QRLblCst.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotalCost);

  rCstGrpTotal := rCstGrpTotal + rTotalCost;
  rCstRepTotal := rCstRepTotal + rTotalCost;
  rCstGrp1Total := rCstGrp1Total + rTotalCost;
  rCstGrp2Total := rCstGrp2Total + rTotalCost;
  if qrySalesByProdPrice_Unit_Factor.asinteger = 0 then
    rgoods := qrySalesByProdGoods_Value.asfloat
  else
    begin
      rgoods :=  (qrySalesByProdQty_Invoiced.asinteger / qrySalesByProdPrice_Unit_Factor.asinteger)
                  *  qrySalesByProdGoods_Value.asfloat;
      if qrySalesByProdQty_Invoiced.asinteger < 0 then
        rgoods := rgoods * -1;
    end;

  QRLblPrft.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rgoods - rTotalCost);

  if rGoods - rTotalCost = 0 then
    QRLblPerc.Caption := formatFloat('##0%',0.00)
  else
    begin
      try
        QRLblPerc.Caption := formatFloat('##0%',((rgoods - rTotalCost)*100)/rgoods);
      except
        QRLblPerc.Caption := formatFloat('##0%',-999.00);
      end;
    end;

  //self.LineDescr = ' - ' when showFormRefs is TRUE, BUT the line doesn't link to a form ref
  //self.LineDescr = '' when showFormRefs is FALSE OR if the Line relates to a Sales Order Line
  //in either case resort to showing the POLine or JBLine or PART Description
  if (self.LineDescr <> '') and (self.LineDescr <> ' - ') then
    self.qrlblDescription.Caption := self.LineDescr
  else
    self.qrlblDescription.Caption := qrySalesbyProdDescription.AsString;

  {get all the details about the PO, Job Bag etc}
  if qrySalesByProd.fieldbyname('Purchase_Order').asfloat <> 0 then
    GetPOrderInfo(qrySalesByProd.fieldbyname('Purchase_Order').asfloat,qrySalesByProd.fieldbyname('Line').asinteger)
  else
  if qrySalesByProd.fieldbyname('Job_Bag').asinteger <> 0 then
    GetJobBagInfo(qrySalesByProd.fieldbyname('Job_Bag').asinteger)
  else
    GetSOrderInfo(qrySalesByProd.fieldbyname('Sales_Order').asinteger)
end;

procedure TPBRPSalesbyProdFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Order No"'
    + ',"Ordered By"'
    + ',"Customer"'
    + ',"Your Ref"'
    + ',"Start Date"'
    + ',"Form Reference"'
    + ',"Description"'
    + ',"Approval Date"'
    + ',"Delivery Date"'
    + ',"Inv Reference"'
    + ',"Inv Date"'
    + ',"Quantity"';

  if self.PrintGoods then
  begin
    tempStr := tempStr + ',"Sell"';
    if self.PrintCosts then
    begin
      tempStr := tempStr + ',"Cost"'
        + ',"Margin"'
        + ',"Margin %"';
    end;
  end;
  writeLn(self.exportFile, tempStr);
  self.qckrpSalesByProd.Prepare;
  
  CloseFile(self.exportFile);
end;

procedure TPBRPSalesbyProdFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if self.exporting then
  begin
    PBRSSalesByProdFrm.prgbrExport.Max :=
      qckrpSalesByProd.DataSet.RecordCount;
  end;
end;

function TPBRPSalesbyProdFrm.GetFormReferenceIDDesc(const POnum: double;
  const POLine, JobBag, JBLine, SONum, SOLine: integer): string;
begin
  if PONum <> 0.00 then
    Result := self.GetPOLineFormRefIDDesc(PONum, POLine)
  else if JobBag <> 0 then
    Result := self.GetJBLineFormRefIDDesc(JobBag, JBLine)
  else if SONum <> 0 then
    Result := self.GetSOLinePartDesc(SONum, SOLine)
  else
    Result := '';
end;

function TPBRPSalesbyProdFrm.GetJBLineFormRefIDDesc(const JobBag,
  Line: integer): string;
begin
  qryJBLineFormRef.close;
  qryJBLineFormRef.paramByName('job_bag').asInteger := JobBag;
  qryJBLineFormRef.ParamByName('Line').asInteger := Line;
  qryJBLineFormRef.open;

  Result := qryJBLineFormRef.FieldByName('form_reference_id').asString
    + ' - ' + qryJBLineFormRef.FieldByName('form_reference_descr').asString;

  qryJBLineFormRef.close;
end;

function TPBRPSalesbyProdFrm.GetPOLineFormRefIDDesc(const PONum: double;
  Line: integer): string;
begin
  qryPOLineFormRef.close;
  qryPOLineFormRef.paramByName('Purchase_order').asFloat := PONum;
  qryPOLineFormRef.ParamByName('Line').asInteger := Line;
  qryPOLineFormRef.open;

  Result := qryPOLineFormRef.FieldByName('form_reference_id').asString
    + ' - ' + qryPOLineFormRef.FieldByName('form_reference_descr').asString;

  qryPOLineFormRef.close;
end;

function TPBRPSalesbyProdFrm.GetSOLinePartDesc(const SalesOrder,
  Line: integer): string;
begin
  qrySOLinePart.close;
  qrySOLinePart.paramByName('Sales_order').asFloat := SalesOrder;
  qrySOLinePart.ParamByName('Line').asInteger := Line;
  qrySOLinePart.open;

  Result := qrySOLinePart.FieldByName('part').asString
    + ' - ' + qrySOLinePart.FieldByName('part_description').asString;

  qrySOLinePart.close;
end;

procedure TPBRPSalesbyProdFrm.GetPOrderInfo(const POrder: real; const Line: integer);
begin
  with qryGetPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := POrder;
      parambyname('Line').asinteger := Line;
      open;

      sContact := fieldbyname('Contact_Name').asstring;
      sOrderRef := fieldbyname('Cust_Order_no').asstring;
      sStartDate := pbDateStr(fieldbyname('Start_Date').asdatetime);
      sDeliveryDate := pbDateStr(fieldbyname('Date_Deliv_Actual').asdatetime);
      sApprovalDate := pbDateStr(fieldbyname('Date_approved').asdatetime);
    end;
end;

procedure TPBRPSalesbyProdFrm.GetJobBagInfo(const JobBag: integer);
begin
  with qryGetJB do
    begin
      close;
      parambyname('Job_Bag').asinteger := JobBag;
      open;

      sContact := fieldbyname('Contact_Name').asstring;
      sOrderRef := fieldbyname('Cust_Order_no').asstring;
      sStartDate := pbDateStr(fieldbyname('Start_Date').asdatetime);
      sDeliveryDate := pbDateStr(fieldbyname('Date_Deliv_Actual').asdatetime);
      sApprovalDate := '';
    end;
end;

procedure TPBRPSalesbyProdFrm.GetSOrderInfo(const SOrder: integer);
begin
  with qryGetSO do
    begin
      close;
      parambyname('Sales_Order').asinteger := SOrder;
      open;

      sContact := fieldbyname('Contact_Name').asstring;
      sOrderRef := fieldbyname('Cust_Order_no').asstring;
      sStartDate := pbDateStr(fieldbyname('Start_Date').asdatetime);
      sDeliveryDate := pbDateStr(fieldbyname('Date_Deliv_Actual').asdatetime);
      sApprovalDate := '';
    end;
end;

end.
