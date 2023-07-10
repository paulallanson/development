unit PBRPPurchByInvDets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, CCSPrint, DB, DBTables, QRCtrls;

type
  TPBRPPurchByInvDetsFrm = class(TForm)
    qrDetails: TQuickRep;
    qrbndPageHeader: TQRBand;
    qryReport: TQuery;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    repQRGroup: TQRGroup;
    GrpByQRDBText: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel19: TQRLabel;
    MarginQRLabel: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrlblPO: TQRLabel;
    QRLabel2: TQRLabel;
    qrlblPOTotal: TQRLabel;
    QRLabel6: TQRLabel;
    qrlblPOCharges: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    qrlblInvCharges: TQRLabel;
    qrlblInvTotal: TQRLabel;
    qrlblDiff: TQRLabel;
    qrlblDescription: TQRLabel;
    QRLabel11: TQRLabel;
    qryGetPO: TQuery;
    qrlblOrderPrice: TQRLabel;
    qrlblOrderUnit: TQRLabel;
    qrlblCostPrice: TQRLabel;
    repQRFooter: TQRBand;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    qrlblSuppPOTotal: TQRLabel;
    qrlblSuppInvTotal: TQRLabel;
    QRShape1: TQRShape;
    qrlblSuppDiffTotal: TQRLabel;
    QRBand2: TQRBand;
    qrlblSupplierTotals: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRShape2: TQRShape;
    qrlblReportPOTotal: TQRLabel;
    qrlblReportInvTotal: TQRLabel;
    qrlblReportDiffTotal: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText3: TQRDBText;
    procedure qrDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure repQRFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure repQRFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure repQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    FtotalBySupp: Boolean;
    PONumber: real;
    InvNumber: string;
    function GetPOCost(tempPO, tempLine: integer): real;
    function GetPODescription(tempPO, tempLine: integer): string;
    function GetPONumber(tempPO, tempLine: integer): string;
    procedure SettotalBySupp(const Value: Boolean);
    function GetPOCostUnit(tempPO, tempLine: integer): integer;
    function GetPOQty(tempPO, tempLine: integer): integer;
    function CalcTotalValue(TempQty, TempFactor: integer; TempValue: double; tempOrigQty: integer): real;
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    procedure ExportToFile(fileName: string);
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
  end;

var
  PBRPPurchByInvDetsFrm: TPBRPPurchByInvDetsFrm;

implementation

uses PBRSPurchByInv;

var
  rPOTotal, rInvTotal, rRepPOTotal, rRepInvTotal: real;

{$R *.dfm}

procedure TPBRPPurchByInvDetsFrm.qrDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rPOTotal := 0;
  rRepPOTotal := 0;
  rInvTotal := 0;
  rRepInvTotal := 0;

  with qrDetails.PrinterSettings do
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

  qryReport.close;
  qryReport.Open;
  PBRSPurchByInvFrm.prgbrExport.Max := qryReport.recordcount;
  if not totalBySupp then
  begin
    RepQRGroup.enabled := false;
    repqrfooter.enabled := false;
    Grpbyqrdbtext.Enabled := false;
  end
  else
  begin
    RepQRGroup.enabled := true;
    repqrfooter.enabled := true;
    Grpbyqrdbtext.Enabled := true;
  end;

end;

procedure TPBRPPurchByInvDetsFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPPurchByInvDetsFrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  POTotal, InvTotal: real;
  rCost: real;
  iCostUnit, iQuantity: integer;
  multiplier: integer;
  tempStr: string;
begin
  if qryReport.FieldByName('Invoice_or_credit').asstring = 'C' then
    multiplier := -1
  else
    multiplier := 1;

  if qryReport.FieldByName('Purchase_Order').asstring <> '' then
    begin
      qrlblPO.caption := qryReport.FieldByName('Purchase_Order').asstring;
      qrlblDescription.caption := qryReport.FieldByName('Suppliers_Desc').asstring;
      qrlblOrderPrice.caption := formatfloat('0.00',(qryReport.FieldByName('Order_Price').asfloat*multiplier));
      qrlblOrderUnit.caption := qryReport.FieldByName('Order_Unit_Description').asstring;

      POTotal := CalcTotalValue(qryReport.FieldByName('Qty_Invoiced').asinteger,
                                qryReport.FieldByName('Order_unit_Factor').asinteger,
                                (qryReport.FieldByName('Order_Price').asfloat*multiplier), qryReport.fieldbyname('Quantity').asinteger);
    end
  else
    begin
      rCost := GetPOCost(qryReport.FieldByName('Purch_Ord').asinteger, qryReport.FieldByName('Purch_Ord_Line_no').asinteger);
      iCostUnit := GetPOCostUnit(qryReport.FieldByName('Purch_Ord').asinteger, qryReport.FieldByName('Purch_Ord_Line_no').asinteger);

      iQuantity := qryReport.FieldByName('Qty_Invoiced').asinteger;

      qrlblPO.caption := GetPONumber(qryReport.FieldByName('Purch_Ord').asinteger, qryReport.FieldByName('Purch_Ord_Line_no').asinteger);
      qrlblDescription.caption := GetPODescription(qryReport.FieldByName('Purch_Ord').asinteger, qryReport.FieldByName('Purch_Ord_Line_no').asinteger);
      qrlblOrderPrice.caption := formatfloat('0.00',(rCost*multiplier));
      qrlblOrderUnit.caption := inttostr(iCostUnit);

      POTotal := CalcTotalValue(iQuantity, iCostUnit, (rCost*multiplier), GetPOQty(qryReport.FieldByName('Purch_Ord').asinteger, qryReport.FieldByName('Purch_Ord_Line_no').asinteger));

    end;

  qrlblCostprice.Caption := formatfloat('0.00',qryReport.FieldByName('Goods_Value').asfloat);

  if PONumber <> strtoint(qrlblPO.Caption) then
    begin
      qrlblPOCharges.caption := formatfloat('0.00',(qryReport.FieldByName('Order_Additional_Charges').asfloat*multiplier));
      POTotal := (POTotal + qryReport.FieldByName('Order_Additional_Charges').asfloat)*multiplier;
    end
  else
    begin
      qrlblPOCharges.caption := formatfloat('0.00',0);
      POTotal := (POTotal)*multiplier;
    end;

  InvTotal := CalcTotalValue(qryReport.FieldByName('Qty_Invoiced').asinteger,
                             (qryReport.FieldByName('Price_unit_Factor').asinteger*multiplier),
                             (qryReport.FieldByName('Goods_Value').asfloat),
                             qryReport.FieldByName('Qty_Invoiced').asinteger);

  if InvNumber <> qryReport.FieldByName('Supplier_invoice_no').asstring then
    begin
      qrlblInvCharges.caption := formatfloat('0.00',qryReport.FieldByName('Invoice_Additional_Charges').asfloat);
      InvTotal := (InvTotal + qryReport.FieldByName('Invoice_Additional_Charges').asfloat);
    end
  else
    begin
      qrlblInvCharges.caption := formatfloat('0.00',0);
    end;

  qrlblPOTotal.caption := formatfloat('#,##0.00',POTotal);
  qrlblInvTotal.caption := formatfloat('#,##0.00',InvTotal);

  qrlblDiff.caption := formatfloat('#,##0.00',InvTotal-POTotal);

  rPOTotal := rPOTotal + POTotal;
  rInvTotal := rInvTotal + InvTotal;

  rRepPOTotal := rRepPOTotal + POTotal;
  rRepInvTotal := rRepInvTotal + InvTotal;

  if self.exporting then
    begin
      //Supplier Name
      tempStr := '"'+ qryReport.fieldbyname('Supplier_name').asstring + '"';
      //Account Code
      tempStr := tempStr + ',"' + qryreport.fieldbyname('Account_Code').asString + '"';
      // PIN Reference
      tempstr := tempstr+ ',"' + qryreport.fieldbyname('Supp_inv_alt_ref').asstring + '"';
      if qryReport.fieldbyname('Invoice_or_Credit').asstring = 'C' then
        tempstr := tempstr + ',"' + 'CN/'+ qryreport.fieldbyname('Supplier_invoice_no').asstring + '"'
      else
        tempstr := tempstr+ ',"' + qryreport.fieldbyname('Supplier_invoice_no').asstring + '"';
      //invoice date
      tempStr := tempStr + ',"' + qryreport.fieldbyname('Invoice_Date').asString + '"';
      //po number
      tempStr := tempStr + ',"' + qrlblPO.caption + '"';
      //customer name
      tempStr := tempStr + ',"' + qryreport.fieldbyname('Customer_Name').asString + '"';
      //Description
      tempStr := tempStr + ',"' + qrlblDescription.caption + '"';
      //qty invoiced
      tempStr := tempStr + ',"' + qryreport.fieldbyname('Qty_Invoiced').asstring + '"';
      // order price
      tempStr := tempStr + ',"' + qrlblOrderPrice.caption + '"';
      //Order unit
      tempStr := tempStr + ',"' + qrlblOrderUnit.caption + '"';
      //po extra charges
      tempStr := tempStr + ',"' + qrlblPOCharges.caption + '"';
      //po total
      tempStr := tempStr + ',"' + qrlblPOTotal.caption + '"';
      //invoice cost
      tempStr := tempStr + ',"' + qrlblCostPrice.caption + '"';
      //invoice price unit
      tempStr := tempStr + ',"' + qryreport.fieldbyname('Price_Unit_Description').asstring + '"';
      //Invoice extra charges
      tempStr := tempStr + ',"' + qrlblInvCharges.caption + '"';
      //Invoice total
      tempStr := tempStr + ',"' + qrlblInvTotal.caption + '"';
      //Difference
      tempStr := tempStr + ',"' + qrlblDiff.caption + '"';

      writeln(self.exportFile, tempStr);
      PBRSPurchByInvFrm.prgbrExport.StepIt;
    end;
end;

procedure TPBRPPurchByInvDetsFrm.FormCreate(Sender: TObject);
begin
  PONumber := 0;
  InvNumber := '';
end;

function TPBRPPurchByInvDetsFrm.GetPODescription(tempPO, tempLine:integer): string;
begin
  with qryGetPO do
    begin
      close;
      parambyname('Purch_Ord').asinteger := tempPO;
      parambyname('Purch_ord_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_Description').asstring
    end;
end;

function TPBRPPurchByInvDetsFrm.GetPONumber(tempPO, tempLine: integer): string;
begin
  with qryGetPO do
    begin
      close;
      parambyname('Purch_Ord').asinteger := tempPO;
      parambyname('Purch_ord_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Purch_Ord_No').asstring
    end;
end;

function TPBRPPurchByInvDetsFrm.GetPOCost(tempPO, tempLine: integer): real;
begin
  with qryGetPO do
    begin
      close;
      parambyname('Purch_Ord').asinteger := tempPO;
      parambyname('Purch_ord_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Purchase_Price').asfloat;
    end;
end;

function TPBRPPurchByInvDetsFrm.GetPOCostUnit(tempPO, tempLine: integer): integer;
begin
  with qryGetPO do
    begin
      close;
      parambyname('Purch_Ord').asinteger := tempPO;
      parambyname('Purch_ord_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Purch_Pack_Quantity').asinteger;
    end;
end;

function TPBRPPurchByInvDetsFrm.GetPOQty(tempPO, tempLine: integer): integer;
begin
  with qryGetPO do
    begin
      close;
      parambyname('Purch_Ord').asinteger := tempPO;
      parambyname('Purch_ord_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Quantity_Received').asinteger;
    end;
end;

procedure TPBRPPurchByInvDetsFrm.repQRFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblSuppPOTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rPOTotal);
  qrlblSuppInvTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvTotal);
  qrlblSuppDiffTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rInvTotal-rPOTotal));
end;

procedure TPBRPPurchByInvDetsFrm.repQRFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rPOTotal := 0.00;
  rInvTotal := 0.00;
end;

procedure TPBRPPurchByInvDetsFrm.repQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblSupplierTotals.caption := 'Totals for '+qryReport.fieldbyname('Supplier_name').asstring;
end;

procedure TPBRPPurchByInvDetsFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportPOTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rRepPOTotal);
  qrlblReportInvTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rRepInvTotal);
  qrlblReportDiffTotal.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rRepInvTotal-rRepPOTotal));
end;

function TPBRPPurchByInvDetsFrm.CalcTotalValue(TempQty, TempFactor: integer; TempValue: double; tempOrigQty: integer) : real;
begin
  if TempFactor = 0 then
    begin
      try
        result := (TempValue/tempOrigQty)*tempQty;
      except
        result := TempValue;
      end;
    end
  else
    begin
      result := ((TempQty/TempFactor) * TempValue);
    end;
end;

procedure TPBRPPurchByInvDetsFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Supplier"'
    + ',"Account Code"'
    + ',"PIN. No."'
    + ',"Inv. No."'
    + ',"Inv. Date"'
    + ',"PO No."'
    + ',"Customer"'
    + ',"Description"'
    + ',"Inv. Qty"'
    + ',"Order Price"'
    + ',"Order Unit"'
    + ',"PO Extras"'
    + ',"Order Total"'
    + ',"Inv. Cost"'
    + ',"Cost Unit"'
    + ',"Inv. Extras"'
    + ',"Inv. Total"'
    + ',"Diff"';

  writeLn(self.exportFile, tempStr);
  self.qrDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPPurchByInvDetsFrm.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  PONumber := strtoint(qrlblPO.Caption);
  InvNumber := qryReport.FieldByName('Supplier_invoice_no').asstring;
end;

end.
