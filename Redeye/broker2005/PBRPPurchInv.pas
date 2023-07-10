unit PBRPPurchInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, DBTables, ExtCtrls, CCSPrint,CCScommon, printers, qrprntr;

type
  TPBRPPurchInvFrm = class(TForm)
    qckrpPurchInv: TQuickRep;
    qryPurchInv: TQuery;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    qrdbtxtPOLine: TQRDBText;
    qrdbtxtCustomer: TQRDBText;
    qrdbtxtCustsDesc: TQRDBText;
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
    AddCostsQuery: TQuery;
    TotalCostLbl: TQRLabel;
    RepTotCostQRLbl: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel16: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qryPurchInvSupplier_Invoice: TIntegerField;
    qryPurchInvInvoice_Line_No: TIntegerField;
    qryPurchInvPurchase_Order: TFloatField;
    qryPurchInvLine: TIntegerField;
    qryPurchInvCustomer_Name: TStringField;
    qryPurchInvCustomers_Desc: TStringField;
    qryPurchInvSales_Qty: TFloatField;
    qryPurchInvSell_Price: TCurrencyField;
    qryPurchInvSales_Invoice_No: TStringField;
    qryPurchInvSales_Invoice_Date: TDateTimeField;
    qryPurchInvSupplier_Name: TStringField;
    qryPurchInvSupplier_Invoice_no: TStringField;
    qryPurchInvSupplier_Invoice_Date: TDateTimeField;
    qryPurchInvPurchase_Qty: TFloatField;
    qryPurchInvPurchase_Price: TCurrencyField;
    qryPurchInvRep_Name: TStringField;
    qrlblExtras: TQRLabel;
    qryPurchInvPOLine: TStringField;
    qryPurchInvCost_Unit_Factor: TFloatField;
    qryPurchInvPrice_Unit_Factor: TFloatField;
    qryPurchInvTotal_sell: TFloatField;
    qryPurchInvTotal_Purch: TFloatField;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel15: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    qryPurchInvDate_Point: TDateTimeField;
    qryPurchInvSP_Goods_Val: TCurrencyField;
    qryPurchInvSP_Qty_Invoiced: TFloatField;
    qryPurchInvSI_Goods_Val: TFloatField;
    qryPurchInvSI_Qty_Invoiced: TFloatField;
    qryPurchInvSP_Cost_Unit_Factor: TFloatField;
    qryPurchInvSI_Cost_Unit_Factor: TFloatField;
    qrlblSell: TQRLabel;
    qrlblPurchase: TQRLabel;
    qrlblOrderCost: TQRLabel;
    QRLabel17: TQRLabel;
    qrlblInvoiceCost: TQRLabel;
    QRLabel19: TQRLabel;
    qrlblSuppInvNo: TQRLabel;
    qrlblSuppInvDate: TQRLabel;
    qrlblSuppInvQty: TQRLabel;
    qrlblSuppName: TQRLabel;
    qrlblSalesInvNo: TQRLabel;
    qrlblSalesInvDate: TQRLabel;
    qrlblSalesInvQty: TQRLabel;
    procedure qryPurchInvPOLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qckrpPurchInvBeforePrint(Sender: TCustomQuickRep;
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
    procedure qryPurchInvTotal_PurchGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryPurchInvTotal_sellGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndPageHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    fPurchaseOrder: real;
    fSalesInvoice: string;
    fSalesInvoiceNoCaption: string;
    fTotalByRep: Boolean;
    fTotalBySupp: Boolean;
    exporting: boolean;
    exportFile: textFile;
    procedure setTotalBySupp(const Value: Boolean);
    procedure setTotalByRep(const Value: Boolean);
    function GetTotalValue(iFactor,iQty: integer; rValue: real): real;
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property totalBySupp: Boolean read fTotalBySupp write setTotalBySupp;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPPurchInvFrm: TPBRPPurchInvFrm;

implementation

uses PBRSPurchInv;

var
  iTotal_Sell, iTotal_vat, iTotal_Cost: real;
  RepTotal_Sell, RepTotal_vat, RepTotal_Cost: real;

{$R *.DFM}

procedure TPBRPPurchInvFrm.qryPurchInvPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPurchInvPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryPurchInvPurchase_Order.Asfloat,qryPurchInvLine.AsInteger);

end;

procedure TPBRPPurchInvFrm.qckrpPurchInvBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;
  {set the printer to what the user selected}
  qckrpPurchInv.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qckrpPurchInv.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qckrpPurchInv.PrinterSettings.Copies := Copies;   {set the output bin the }
(*   with qckrpPurchInv.PrinterSettings do
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
*)
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}
  qryPurchInv.Open;
  RepQRGroup.enabled := false;
  if TotalBySupp then
    begin
      RepQRGroup.enabled := True;
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'qryPurchInv.Supplier_name';
      GrpByQRDBText.DataField := 'Supplier_Name';
      end;
  if TotalByRep then
    begin
      RepQRGroup.enabled := True;
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'qryPurchInv.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
      end;
end;

procedure TPBRPPurchInvFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  raddcost: real;
begin
  {Set the sales invocie details}
  if (fSalesInvoice <> qryPurchInv.fieldbyname('Sales_Invoice_no').asstring) OR (fPurchaseOrder <> qryPurchInv.fieldbyname('Purchase_Order').asfloat) OR (fSalesInvoice = '') then
    begin
      qrlblSalesInvNo.caption := qryPurchInv.fieldbyname('Sales_Invoice_no').asstring;
      qrlblSalesInvDate.caption := PBDateStr(qryPurchInv.fieldbyname('Sales_Invoice_Date').asdatetime);
      qrlblSalesInvQty.caption := qryPurchInv.fieldbyname('SI_Qty_Invoiced').asstring;
      fSalesInvoiceNoCaption := qryPurchInv.fieldbyname('Sales_Invoice_no').asstring;
    end
  else
    begin
      fSalesInvoiceNoCaption := '';
    end;

  qrlblSuppName.caption := qryPurchInv.fieldbyname('Supplier_Name').asstring;
  qrlblSuppInvNo.caption := qryPurchInv.fieldbyname('Supplier_Invoice_no').asstring;
  qrlblSuppInvDate.caption := PBDateStr(qryPurchInv.fieldbyname('Supplier_Invoice_Date').asdatetime);
  qrlblSuppInvQty.caption := qryPurchInv.fieldbyname('Purchase_Qty').asstring;

  {Set Sales Invoice Details}
  if qryPurchInvSales_Invoice_No.isNull then
  begin
    qrlblSell.Caption := formatfloat('£#,###,##0.00',GetTotalValue(qryPurchInvPrice_unit_Factor.asinteger,
                                qryPurchInvSales_Qty.asinteger,qryPurchInvSell_Price.asfloat));

    iTotal_Sell := iTotal_Sell + GetTotalValue(qryPurchInvPrice_unit_Factor.asinteger,
                                qryPurchInvSales_Qty.asinteger,qryPurchInvSell_Price.asfloat);
    RepTotal_Sell := RepTotal_Sell + GetTotalValue(qryPurchInvPrice_unit_Factor.asinteger,
                                qryPurchInvSales_Qty.asinteger,qryPurchInvSell_Price.asfloat);
  end
  else
  if fSalesInvoiceNoCaption = '' then
    begin
      qrlblSell.Caption := '';
    end
  else
    begin
    qrlblSell.Caption := formatfloat('£#,###,##0.00',GetTotalValue(qryPurchInvSI_Cost_unit_Factor.asinteger,
                                qryPurchInvSI_Qty_Invoiced.asinteger,qryPurchInvSI_Goods_Val.asfloat));

    iTotal_Sell := iTotal_Sell + GetTotalValue(qryPurchInvSI_Cost_unit_Factor.asinteger,
                                qryPurchInvSI_Qty_Invoiced.asinteger,qryPurchInvSI_Goods_Val.asfloat);
    RepTotal_Sell := RepTotal_Sell + GetTotalValue(qryPurchInvSI_Cost_unit_Factor.asinteger,
                                qryPurchInvSI_Qty_Invoiced.asinteger,qryPurchInvSI_Goods_Val.asfloat);
  end;

  qrlblOrderCost.caption := formatfloat('£#,###,##0.00',GetTotalValue(qryPurchInvCost_unit_Factor.asinteger,
                                qryPurchInvSI_Qty_Invoiced.asinteger,qryPurchInvPurchase_Price.asfloat));

  qrlblInvoiceCost.caption := formatfloat('£#,###,##0.00',0);

  {Set Purchase Invoice Details}
  if (qrlblSuppInvNo.caption = '') OR (qryPurchInv.fieldbyname('Supplier_Invoice_Date').asdatetime < qryPurchInv.fieldbyname('Sales_Invoice_Date').asdatetime) then
  begin
    qrlblSuppName.caption := '';
    qrlblSuppInvNo.caption := '';
    qrlblSuppInvDate.caption := '';
    qrlblSuppInvQty.caption := '';

    qrlblPurchase.caption := qrlblOrderCost.caption;

    itotal_Cost := itotal_Cost + GetTotalValue(qryPurchInvCost_unit_Factor.asinteger,
                                qryPurchInvSales_Qty.asinteger,qryPurchInvPurchase_Price.asfloat);

    repTotal_Cost := RepTotal_Cost + GetTotalValue(qryPurchInvCost_unit_Factor.asinteger,
                                qryPurchInvSales_Qty.asinteger,qryPurchInvPurchase_Price.asfloat);
  end
  else
  begin
    qrlblPurchase.caption := formatfloat('£#,###,##0.00',GetTotalValue(qryPurchInvSP_Cost_unit_Factor.asinteger,
                                qryPurchInvSP_Qty_Invoiced.asinteger,qryPurchInvSP_Goods_Val.asfloat));

    qrlblInvoiceCost.caption := qrlblPurchase.caption;

    iTotal_Cost := iTotal_Cost + GetTotalValue(qryPurchInvSP_Cost_unit_Factor.asinteger,
                                qryPurchInvSP_Qty_Invoiced.asinteger,qryPurchInvSP_Goods_Val.asfloat);
    RepTotal_Cost := RepTotal_Cost + GetTotalValue(qryPurchInvSP_Cost_unit_Factor.asinteger,
                                qryPurchInvSP_Qty_Invoiced.asinteger,qryPurchInvSP_Goods_Val.asfloat);
  end;


  with AddCostsQuery do
  begin
    Close;
    ParamByName('Supplier_invoice').Asinteger := qryPurchInvSupplier_invoice.Asinteger;
 //   ParamByName('Invoice_line_no').Asinteger := qryPurchInvInvoice_line_no.Asinteger;
    open;
    rAddCost := fieldByName('Add_cost').AsFloat;
  end;

  qrlblExtras.Caption := formatfloat('£###,##0.00',rAddCost);

end;

procedure TPBRPPurchInvFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalSellLbl.caption := formatfloat('£#,###,##0.00',iTotal_Sell);
  TotalCostLbl.Caption := FormatFloat('£#,###,##0.00',(iTotal_Cost));
end;

procedure TPBRPPurchInvFrm.FormCreate(Sender: TObject);
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0
end;

procedure TPBRPPurchInvFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepTotSellQRLbl.caption := formatfloat('£#,###,##0.00',RepTotal_Sell);
  RepTotCostQRLbl.Caption := formatfloat('£#,###,##0.00',RepTotal_Cost);
end;

procedure TPBRPPurchInvFrm.setTotalBySupp(const Value: Boolean);
begin
  fTotalBySupp := Value;
end;

procedure TPBRPPurchInvFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPPurchInvFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
iTotal_Sell := 0;
iTotal_Vat := 0;
iTotal_Cost := 0;
end;

procedure TPBRPPurchInvFrm.qryPurchInvTotal_PurchGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  rTotal: real;
begin
  if qryPurchInvSupplier_Invoice_No.isNull then
  begin
    if qryPurchInvCost_unit_Factor.asinteger = 0 then
      text := formatfloat('0.00',qryPurchInvPurchase_Price.asfloat)
    else
      begin
         rTotal := (qryPurchInvSales_qty.asinteger / qryPurchInvCost_unit_Factor.asinteger)*
              qryPurchInvPurchase_Price.asfloat;
      text := formatfloat('0.00',rTotal);
      end;
  end
else
  begin
   if qryPurchInvSP_Cost_unit_Factor.asinteger = 0 then
      text := formatfloat('0.00',qryPurchInvSP_Goods_Val.asfloat)
    else
      begin
         rTotal := (qryPurchInvSP_Qty_Invoiced.asinteger / qryPurchInvSP_Cost_unit_Factor.asinteger)*
              qryPurchInvSP_Goods_Val.asfloat;
      text := formatfloat('0.00',rTotal);
      end;
  end
end;

procedure TPBRPPurchInvFrm.qryPurchInvTotal_sellGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  rTotal: real;
begin
  if qryPurchInvSales_Invoice_No.isnull then
  begin
    if qryPurchInvPrice_unit_Factor.asinteger = 0 then
      text := formatfloat('0.00',qryPurchInvSell_Price.asfloat)
    else
    begin
      rTotal := (qryPurchInvSales_qty.asinteger / qryPurchInvPrice_unit_Factor.asinteger)*
              qryPurchInvSell_Price.asfloat;
      text := formatfloat('0.00',rTotal);
    end;
  end
  else
  begin
  if qryPurchInvSI_Cost_unit_Factor.asinteger = 0 then
      text := formatfloat('0.00',qryPurchInvSI_Goods_Val.asfloat)
    else
      begin
         rTotal := (qryPurchInvSI_Qty_Invoiced.asinteger / qryPurchInvSI_Cost_unit_Factor.asinteger)*
              qryPurchInvSI_Goods_Val.asfloat;
      text := formatfloat('0.00',rTotal);
      end;
  end
end;

function TPBRPPurchInvFrm.GetTotalValue(iFactor,iQty: integer; rValue: real): real;
var
  rTotal: real;
begin
  if iFactor = 0 then
    result := rValue
  else
    begin
    rTotal := (iQty / iFactor)* rValue;
    Result := rTotal;
    end;
end;

procedure TPBRPPurchInvFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Order"'
    + ',"Order Date"'
    + ',"Customer"'
    + ',"Description"'
    + ',"Order Qty"'
    + ',"Invoice Qty"'
    + ',"Sales Value"'
    + ',"Sales Invoice No"'
    + ',"Sales Invoice Date"'
    + ',"Supplier"'
    + ',"Supplier Invoice No."'
    + ',"Supplier Invoice Date"'
    + ',"Supplier Invoice Qty"'
    + ',"Supplier Invoice Value"'
    + ',"Expected Value"'
    + ',"PO Cost"'
    + ',"Rep Name"'
    + ',"Extras"';

  writeLn(self.exportFile, tempStr);
  self.qckrpPurchInv.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPPurchInvFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr: string;
begin
  fSalesInvoice := qryPurchInvSales_Invoice_no.asstring;
  fPurchaseOrder := qryPurchInvPurchase_Order.asfloat;

  if self.exporting then
  begin
    //order number
    tempStr := '"' + qryPurchInvPurchase_Order.asstring + '"';

    //Order date
    tempStr := tempStr + ',"' + qryPurchInvDate_Point.asstring + '"';

    //customer name
    tempStr := tempStr + ',"' + qryPurchInvCustomer_Name.asstring + '"';

    //description
    tempStr := tempStr + ',"' + qryPurchInvCustomers_Desc.asstring + '"';

    //sales qty
    tempStr := tempStr + ',"' + qryPurchInvSales_Qty.asstring + '"';

    //invoice qty
    tempStr := tempStr + ',"' + qrlblSalesInvQty.caption + '"';

    //sales value
    tempStr := tempStr + ',"' + qrlblSell.caption + '"';

    //sales invoice No
    tempStr := tempStr + ',"' + qrlblSalesInvNo.caption + '"';

    //sales invoice date
    tempStr := tempStr + ',"' + qrlblSalesInvDate.caption + '"';

    //supplier Name
    tempStr := tempStr + ',"' + qrlblSuppName.caption + '"';

    //purchase invoice no
    tempStr := tempStr + ',"' + qrlblSuppInvNo.caption + '"';

    //purchase invoice date
    tempStr := tempStr + ',"' + qrlblSuppInvDate.caption + '"';

    //purchase invoice quantity
    tempStr := tempStr + ',"' + qrlblSuppInvQty.caption + '"';

    //Invoice cost Value
//    tempStr := tempStr + ',"' + formatfloat('£#,###,##0.00',qryPurchInvTotal_Purch.asfloat) + '"';
    tempStr := tempStr + ',"' + qrlblInvoiceCost.caption + '"';

    //purchase cost
//    tempStr := tempStr + ',"' + formatfloat('£#,###,##0.00',qryPurchInvTotal_Purch.asfloat) + '"';
    tempStr := tempStr + ',"' + qrlblPurchase.caption + '"';

    //Order Cost
//    tempStr := tempStr + ',"' + formatfloat('£#,###,##0.00',qryPurchInvTotal_Purch.asfloat) + '"';
    tempStr := tempStr + ',"' + qrlblOrderCost.caption + '"';

    //Rep Name
    tempStr := tempStr + ',"' + qryPurchInvRep_Name.asstring + '"';

    //additional cost
    tempStr := tempStr + ',"' + qrlblExtras.caption + '"';
    writeln(self.exportFile, tempStr);
    PBRSPurchInvFrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPPurchInvFrm.qrbndPageHeaderAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if self.exporting then
  begin
    PBRSPurchInvFrm.prgbrExport.Max :=
      qckrpPurchInv.DataSet.RecordCount;
  end;

end;

end.
