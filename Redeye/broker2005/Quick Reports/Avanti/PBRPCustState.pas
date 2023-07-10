
unit PBRPCustState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, DBTables, CCSPrint,
  PBPOObjects, CCSCommon, gtQrCtrls, gtQrExport, qrprntr, printers;

type
  TPBRPCustStateFrm = class(TForm)
    InvoiceReport: TQuickRep;
    SalesInvDataSource: TDataSource;
    CompDataSource: TDataSource;
    GetCompSQL: TQuery;
    QRLabel6: TgtQRLabel;
    QRDBText6: TgtQRDBText;
    QRLabel7: TgtQRLabel;
    QRDBText7: TgtQRDBText;
    InvDetailBand: TQRSubDetail;
    QRBand1: TQRBand;
    lblAccountCode: TgtQRLabel;
    lblRundate: TgtQRLabel;
    SalesInvSQL_old: TQuery;
    GrpFootQRBand: TQRBand;
    QRLabel1: TgtQRLabel;
    lblInvoiceNo: TgtQRLabel;
    QRLabel2: TgtQRLabel;
    CustomerAddMemo: TgtQRMemo;
    lblPage: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel13: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    QRLabel15: TgtQRLabel;
    QRLabel16: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    UpSalesInvSQL: TQuery;
    UpCustSQL: TQuery;
    QRLabel17: TgtQRLabel;
    TotGoodsQRLbl: TgtQRLabel;
    TotVatQRLbl: TgtQRLabel;
    InvTotQrLbl: TgtQRLabel;
    gtQRFilters1: TgtQRFilters;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    SalesInvSQL: TQuery;
    qrgrpSalesInvoice: TQRGroup;
    QRDBText1: TgtQRDBText;
    gtQRDBText1: TgtQRDBText;
    lblGoods: TgtQRLabel;
    lblVAT: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    qrlblGoodsValue: TgtQRLabel;
    qrlblVatValue: TgtQRLabel;
    lblProduct: TQRLabel;
    lblDescription: TQRLabel;
    lblPriceUnit: TQRLabel;
    qrlblUnitPrice: TQRLabel;
    qryPOLine: TQuery;
    qrySOLine: TQuery;
    qryJBLine: TQuery;
    qrlblReference: TQRLabel;
    qryJBHead: TQuery;
    qrySOHead: TQuery;
    gtQRDBText3: TgtQRDBText;
    procedure InvoiceReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CustBranchQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InvoiceReportAfterPrint(Sender: TObject);
    procedure GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrgrpSalesInvoiceBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpSalesInvoiceAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure InvDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    FReprint: boolean;
    procedure SetReprint(const Value: boolean);
    function GetJBLineDesc(tempCode, tempLine: integer): string;
    function GetPOLineDesc(tempCode: real; tempLine: integer): string;
    function GetSOLineDesc(tempCode, tempLine: integer): string;
    function GetSOLineProduct(tempCode, tempLine: integer): string;
    function GetSOLinePUnit(tempCode, tempLine: integer): string;
    function GetOrderRef(tempNo: real; tempCode: string): string;
  public
    CustomerNo, BranchNo, iIntSel: Integer;
    Preview: ByteBool;
    CustomerName: string;
    StatementNo: string;
    DateFrom, DateTo, InvDate: TDateTime;
    PrinterSettings : TPrinterSettings;
    rvat, rGoods: Real;
    property Reprint: boolean read FReprint write SetReprint;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPCustStateFrm: TPBRPCustStateFrm;

implementation

uses PBImages, PBRSCustState;

var
  ipage: integer;

{$R *.DFM}

procedure TPBRPCustStateFrm.InvoiceReportBeforePrint(Sender:
  TCustomQuickRep;
  var PrintReport: Boolean);
var                         
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
  irow: integer;
begin
  {set the printer to what the user selected}
  InvoiceReport.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  InvoiceReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  InvoiceReport.PrinterSettings.copies := Copies;   {set the number of copies }
  InvoiceReport.PrinterSettings.PaperSize := Size;   {set the number of copies }

  iPage := 0;
  
  {Activate the company query}
  with GetCompSQL do
  begin
    Close;
    Open;
  end;
end;

function TPBRPCustStateFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report query}
  with SalesInvSQL do
  begin
    Close;
    parambyname('Int_Sel').asinteger := iIntSel;
    Open;
    Result := RecordCount;
  end;
end;

procedure TPBRPCustStateFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  icount: integer;
begin
  CustomerAddMemo.Lines.Clear;

  {Create the Customer Address details memo}
  for icount := 9 to 14 do
  begin
    if SalesInvSQL.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(SalesInvSQL.Fields[icount].AsString);
  end;
  lblInvoiceNo.caption := StatementNo;
  lblRundate.caption := PBDatestr(InvDate);
  lblAccountCode.caption := SalesInvSQL.fieldbyname('Account_Code').asstring;
//  lblDateRange.caption := 'Period: '+PBdateStr(Datefrom)+' to '+PBDateStr(DateTo);

  inc(iPage);
  lblPage.caption := inttostr(iPage);

end;

procedure TPBRPCustStateFrm.CustBranchQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iPage := 0;
end;

procedure TPBRPCustStateFrm.SetReprint(const Value: boolean);
begin
  FReprint := Value;
end;

procedure TPBRPCustStateFrm.InvoiceReportAfterPrint(
  Sender: TObject);
begin
  with UpCustSQL do
    begin
      close;
      parambyname('Customer').asinteger := CustomerNo;
      parambyname('Branch_no').asinteger := BranchNo;
      parambyname('Last_Statement_Ref').asstring := StatementNo;
      execsql;
    end;
end;

procedure TPBRPCustStateFrm.GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotGoodsQRLbl.caption := formatfloat('0.00',rGoods);
  TotVatQRLbl.caption := formatfloat('0.00',rVat);
  InvTotQRLbl.Caption := FormatFloat('0.00',(StrToFloat(TotGoodsQRLbl.Caption)+StrToFloat(TotVatQRlbl.caption)));
end;

procedure TPBRPCustStateFrm.GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
rvat := 0.00;
rgoods := 0.00;
end;

procedure TPBRPCustStateFrm.qrgrpSalesInvoiceBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  with SalesInvSQL do
    begin
      lblGoods.caption := formatfloat('0.00',fieldbyname('Goods_value').asfloat);
      lblVAT.caption := formatfloat('0.00',fieldbyname('vat_value').asfloat);
//      lblUnitPrice.caption := formatfloat('0.00',fieldbyname('unit_price').asfloat)+ ' '+fieldbyname('Price_Descr').asstring;
      rGoods := rGoods + StrToFloat(LblGoods.Caption);
      rvat := rVat + StrToFloat(LblVat.Caption);
      if fieldbyname('Sales_Invoice_Type').asstring = 'S' then
        qrlblReference.caption := GetOrderRef(fieldbyname('Sales_Order').asinteger,'S')
      else
      if fieldbyname('Sales_Invoice_Type').asstring = 'J' then
        qrlblReference.caption := GetOrderRef(fieldbyname('Job_Bag').asinteger,'J')
      else
        qrlblReference.caption := GetOrderRef(fieldbyname('Purchase_Order').asfloat,'P');
    end;

end;

procedure TPBRPCustStateFrm.qrgrpSalesInvoiceAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  TempStr: string;
begin
  if not Preview and
     not Reprint then
    begin
      with UpSalesInvSQL do
        begin
          close;
          parambyname('Sales_Invoice').asinteger := SalesInvSQl.fieldbyname('Sales_Invoice').asinteger;
          parambyname('Statement_reference').asstring := StatementNo;
          parambyname('Statement_Date').asdatetime := InvDate;
          parambyname('Statement_from').asdatetime := DateFrom;
          parambyname('Statement_to').asdatetime := DateTo;
          execsql;
        end;
    end;

(*  if exporting then
    begin
      tempStr := '"' + SalesInvSQL.fieldbyname('Name').asstring + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Account_Code').asstring + '"';
      tempStr := tempStr + ',"' + lblRunDate.caption + '"';
      tempStr := tempStr + ',"' + lblInvoiceNo.caption + '"';
      tempStr := tempStr + ',"' + lblCustomerRef.Caption + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Invoice_Description').asstring + '"';
      tempStr := tempStr + ',"' + lblGoods.caption + '"';
      tempStr := tempStr + ',"' + lblVat.caption + '"';
      tempStr := tempStr + ',"' + lblTotal.caption + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Sales_Invoice_no').asstring + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Reference').asstring + '"';
      writeln(self.exportFile, tempStr);
      PBRSCustStateFrm.prgbrExport.StepIt;
    end;
*)
end;

procedure TPBRPCustStateFrm.InvDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  sPriceUnit: string;
  rUnitPrice, rGoodsTotal, rVatValue: real;
begin
  rUnitPrice := SalesInvSQL.FieldByName('Unit_Price').AsFloat;
  if SalesInvSQL.fieldbyname('Purchase_Order').asfloat <> 0 then
    begin
      lblProduct.caption := '';
      lblDescription.caption := GetPOLineDesc(SalesInvSQL.fieldbyname('Purchase_Order').asfloat,
                                              SalesInvSQL.fieldbyname('Line').asinteger);
      lblPriceUnit.caption := SalesInvSQL.Fieldbyname('Price_Unit_Description').asstring;
    end
  else
  if SalesInvSQL.fieldbyname('Sales_Order').asinteger <> 0 then
    begin
      lblProduct.caption := GetSOLineProduct(SalesInvSQL.fieldbyname('Sales_Order').asinteger,
                                              SalesInvSQL.fieldbyname('Sales_order_Line_no').asinteger);
      lblDescription.caption := GetSOLineDesc(SalesInvSQL.fieldbyname('Sales_Order').asinteger,
                                              SalesInvSQL.fieldbyname('Sales_order_Line_no').asinteger);
      lblPriceUnit.caption := SalesInvSQL.Fieldbyname('Price_Unit_Description').asstring;
(*      sPriceUnit := GetSOLinePUnit(SalesInvSQL.fieldbyname('Sales_Order').asinteger,
                                              SalesInvSQL.fieldbyname('Sales_order_Line_no').asinteger);
      if sPriceUnit = '' then
        lblPriceUnit.caption := SalesInvSQL.Fieldbyname('Price_Unit_Description').asstring
      else
        begin
          lblPriceUnit.caption := sPriceUnit;
          rUnitPrice := strtoint(sPriceUnit) * rUnitPrice;
        end;
*)
    end
  else
    begin
      lblProduct.caption := '';
      lblDescription.caption := GetJBLineDesc(SalesInvSQL.fieldbyname('Job_Bag').asinteger,
                                              SalesInvSQL.fieldbyname('Job_Bag_Line').asinteger);
      lblPriceUnit.caption := SalesInvSQL.Fieldbyname('Price_Unit_Description').asstring;
    end;

  qrlblUnitPrice.Caption := formatfloat('0.000',(rUnitPrice));
  rGoodsTotal := SalesInvSQL.FieldByName('Unit_Price').AsFloat;

  if SalesInvSQL.FieldByName('Price_Unit_Factor').AsInteger = 0 then
    rGoodsTotal := rGoodsTotal
  else
    rGoodsTotal := (SalesInvSQL.fieldbyname('Qty_Invoiced').asinteger /
      SalesInvSQL.FieldByName('Price_Unit_Factor').AsInteger)
      * rGoodsTotal;

  qrlblGoodsValue.Caption := formatfloat('0.00', rGoodsTotal);
//  iGoods := iGoods + StrToFloat(qrlblGoodsValue.Caption);
  rVatValue := StrToFloat(qrlblGoodsValue.Caption) *
    (SalesInvSQL.FieldByName('Vat_Rate').AsFloat / 100);
//  ivat := ivat + rVatValue;
  qrlblVatValue.Caption := formatfloat('0.00', rVatValue);
end;

function TPBRPCustStateFrm.GetJBLineDesc(tempCode, tempLine: integer): string;
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

function TPBRPCustStateFrm.GetPOLineDesc(tempCode: real;
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

function TPBRPCustStateFrm.GetSOLineDesc(tempCode, tempLine: integer): string;
begin
  result := '';
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_Description').asstring;
    end;
end;

function TPBRPCustStateFrm.GetSOLineProduct(tempCode,
  tempLine: integer): string;
begin
  result := '';
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part').asstring;
    end;
end;

function TPBRPCustStateFrm.GetSOLinePUnit(tempCode: integer;
  tempLine: integer): string;
begin
  result := '';
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      if fieldbyname('Price_Unit').asstring = '' then
        result := fieldbyname('Sell_Pack_Quantity').asstring
      else
        result := '';
    end;
end;

function TPBRPCustStateFrm.GetOrderRef(tempNo: real; tempCode: string): string;
begin
  result := '';
  if tempCode = 'S' then
  begin
    with qrySOHead do
      begin
        close;
        parambyname('Sales_order').asinteger := round(tempNo);
        open;
        result := fieldbyname('Cust_Order_no').asstring;
      end;
  end
  else
  if tempCode = 'J' then
  begin
    with qryJBHead do
      begin
        close;
        parambyname('Job_Bag').asinteger := round(tempNo);
        open;
        result := fieldbyname('Cust_Order_no').asstring;
      end;
  end
  else
  begin
    with qryPOLine do
      begin
        close;
        parambyname('Purchase_Order').asfloat := tempNo;
        parambyname('Line').asinteger := 1;
        open;
        result := fieldbyname('Cust_Order_no').asstring;
      end;
  end;
end;

procedure TPBRPCustStateFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Customer"'
        + ',"Account Code"'
        + ',"Run Date"'
        + ',"Reference"'
        + ',"Your Reference"'
        + ',"Description"'
        + ',"Goods"'
        + ',"VAT"'
        + ',"Total"'
        + ',"Invoice No"'
        + ',"Job Number"';

  writeLn(self.exportFile, tempStr);

  InvoiceReport.Prepare;

  CloseFile(self.exportFile);
end;

end.
