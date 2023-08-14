unit PBRPCustState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, CCSPrint,
  PBPOObjects, CCSCommon, QrExport, qrprntr, printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPCustStateFrm = class(TForm)
    InvoiceReport: TQuickRep;
    SalesInvDataSource: TDataSource;
    CompDataSource: TDataSource;
    GetCompSQL: TFDQuery;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    CustBranchQRGroup: TQRGroup;
    InvDetailBand: TQRSubDetail;
    QRBand1: TQRBand;
    lblAccountCode: TQRLabel;
    lblRundate: TQRLabel;
    SalesInvSQL: TFDQuery;
    QRDBText1: TQRDBText;
    GrpFootQRBand: TQRBand;
    lblInvoiceNo: TQRLabel;
    QRLabel2: TQRLabel;
    CustomerAddMemo: TQRMemo;
    lblVAT: TQRLabel;
    lblGoods: TQRLabel;
    lblPage: TQRLabel;
    QRLabel16: TQRLabel;
    UpSalesInvSQL: TFDQuery;
    lblDateRange: TQRLabel;
    lblTotal: TQRLabel;
    UpCustSQL: TFDQuery;
    qrlblGoods: TQRLabel;
    qrlblVatTot: TQRLabel;
    qrlblTotal: TQRLabel;
    OldSalesInvSQL: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    DateTimeField1: TDateTimeField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    IntegerField3: TIntegerField;
    StringField13: TStringField;
    StringField14: TStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    FloatField3: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    lblCustomerRef: TQRLabel;
    QRDBText2: TQRDBText;
    lblDescription: TQRLabel;
    qryGetJB: TFDQuery;
    qryGetPO: TFDQuery;
    qryGetSO: TFDQuery;
    qryJBLine: TFDQuery;
    qryPOLine: TFDQuery;
    qrySOLine: TFDQuery;
    QRDBText3: TQRDBText;
    lblDeliveryLocation: TQRLabel;
    qryGetSODeliv: TFDQuery;
    qryGetPOLineDeliv: TFDQuery;
    procedure InvoiceReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InvDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CustBranchQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InvDetailBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure InvoiceReportAfterPrint(Sender: TObject);
    procedure GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    FReprint: boolean;
    GTValue, GTVat, GTTotal: currency;
    procedure SetReprint(const Value: boolean);
    function GetJBReference(sTemp: string): string;
    function GetPOLineDelivery(tempCode: real; tempLine: integer): string;
    function GetPOLineDesc(tempCode: real; tempLine: integer): string;
    function GetPOReference(sTemp: string): string;
    function GetSODelivery(iTemp: integer): string;
    function GetSOLineDesc(tempCode, tempLine: integer): string;
    function GetSOReference(sTemp: string): string;
    function GetJBLineDesc(tempCode, tempLine: integer): string;
  public
    CustomerNo, BranchNo, iIntSel: Integer;
    Preview: ByteBool;
    CustomerName: string;
    StatementNo: string;
    DateFrom, DateTo, InvDate: TDateTime;
    PrinterSettings : TPrinterSettings;
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
  InvoiceReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  InvoiceReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  InvoiceReport.PrinterSettings.copies := Copies;   {set the number of copies }
  InvoiceReport.PrinterSettings.PaperSize := Size;   {set the number of copies }

  self.GTValue := 0.00;
  self.GTVat   := 0.00;
  self.GTTotal := 0.00;

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
  for icount := 25 to 30 do
  begin
    if SalesInvSQL.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(SalesInvSQL.Fields[icount].AsString);
  end;
  lblInvoiceNo.caption := StatementNo;
  lblRundate.caption := PBDatestr(InvDate);
  lblAccountCode.caption := SalesInvSQL.fieldbyname('Account_Code').asstring;
  lblDateRange.caption := 'Period: '+PBdateStr(Datefrom)+' to '+PBDateStr(DateTo);

  inc(iPage);
  lblPage.caption := inttostr(iPage);

end;

procedure TPBRPCustStateFrm.InvDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rGoods, rVat, rTotal: real;
begin
  with SalesInvSQL do
    begin
      if fieldbyname('Invoice_or_Credit').asstring = 'C' then
        begin
          lblCustomerRef.caption := 'Credit';
          lblDescription.caption := 'Credit';
          lblDeliveryLocation.caption := 'Credit';
        end
      else
      if fieldbyname('Sales_invoice_type').asstring = '' then
        begin
          lblCustomerRef.caption := GetPOReference(fieldbyname('Reference').asstring);
          lblDescription.caption := GetPOLineDesc(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
          lblDeliveryLocation.caption := GetPOLineDelivery(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
        end
      else
      if fieldbyname('Sales_invoice_type').asstring = 'S' then
        begin
          lblCustomerRef.caption := GetSOReference(fieldbyname('Reference').asstring);
          lblDescription.caption := GetSOLineDesc(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_Order_line_no').asinteger);
          lblDeliveryLocation.caption := GetSODelivery(fieldbyname('Sales_Order').asinteger);
        end
      else
      if fieldbyname('Sales_invoice_type').asstring = 'J' then
        begin
          lblCustomerRef.caption := GetJBReference(fieldbyname('Reference').asstring);
          lblDescription.caption := GetJBLineDesc(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
          lblDeliveryLocation.caption := '';
        end
      else
        begin
          lblCustomerRef.caption := '';
          lblDescription.caption := '';
          lblDeliveryLocation.caption := '';
        end;

      if fieldbyname('Price_Unit_Factor').asinteger = 0 then
        rGoods := fieldbyname('Goods_value').asfloat
      else
        rGoods := fieldbyname('Goods_value').asfloat * (fieldbyname('Qty_Invoiced').asinteger / fieldbyname('Price_Unit_Factor').asinteger);

      rVat := rGoods * (fieldbyname('Vat_Rate').asfloat/100.0000);

      rTotal := rGoods + rVat;

      lblGoods.caption := formatfloat('0.00',rGoods);
      lblVAT.caption := formatfloat('0.00',rVat);
      lblTotal.caption := formatfloat('0.00',rTotal);
    end;
end;

function TPBRPCustStateFrm.GetPOReference(sTemp: string): string;
begin
  with qryGetPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := StrToFloatDef(sTemp, 0, FormatSettings);
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Cust_Order_no').asstring;
    end;
end;

function TPBRPCustStateFrm.GetSOReference(sTemp: string): string;
begin
  with qryGetSO do
    begin
      close;
      parambyname('Sales_Order').asinteger := strtoint(sTemp);
      open;
      result := fieldbyname('Cust_Order_no').asstring;
    end;
end;

function TPBRPCustStateFrm.GetSODelivery(iTemp: integer): string;
begin
  with qryGetSODeliv do
    begin
      close;
      parambyname('Sales_Order').asinteger := iTemp;
      open;

      if fieldbyname('Ad_Hoc_Address_Name').asstring <> '' then
        Result := fieldbyname('Ad_Hoc_Address_Name').asstring
      else
        result := fieldbyname('Branch_Name').asstring;
    end;
end;

function TPBRPCustStateFrm.GetJBReference(sTemp: string): string;
begin
  with qryGetJB do
    begin
      close;
      parambyname('Job_Bag').asinteger := strtoint(sTemp);
      open;
      result := fieldbyname('Cust_Order_no').asstring;
    end;
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

function TPBRPCustStateFrm.GetPOLineDelivery(tempCode: real;
  tempLine: integer): string;
begin
  result := '';
  with qryGetPOLineDeliv do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempcode;
      parambyname('Line').asinteger := tempLine;
      open;

      if fieldbyname('Branch_Name').asstring <> '' then
        Result := fieldbyname('Branch_Name').asstring
      else
      if fieldbyname('Supplier_Branch_Name').asstring <> '' then
        Result := fieldbyname('Supplier_Name').asstring
      else
      if fieldbyname('Ad_Hoc_Address_Name').asstring <> '' then
        Result := fieldbyname('Ad_Hoc_Address_Name').asstring
      else
      if fieldbyname('Rep_Name').asstring <> '' then
        Result := fieldbyname('Rep_Name').asstring
      else
        result := 'Broadsword UK';
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

procedure TPBRPCustStateFrm.CustBranchQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iPage := 0;
end;

procedure TPBRPCustStateFrm.InvDetailBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
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
          parambyname('Statement_from').asdatetime := Datefrom;
          parambyname('Statement_to').asdatetime := DateTo;
          execsql;
        end;
    end;

  if exporting then
    begin
      tempStr := '"' + SalesInvSQL.fieldbyname('Customer_Name').asstring + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Account_Code').asstring + '"';
      tempStr := tempStr + ',"' + lblRunDate.caption + '"';
      tempStr := tempStr + ',"' + lblInvoiceNo.caption + '"';
      tempStr := tempStr + ',"' + lblCustomerRef.caption + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Reference').asstring + '"';
      tempStr := tempStr + ',"' + lblDescription.caption + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Sales_Invoice_no').asstring + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Invoice_Date').asstring + '"';
      tempStr := tempStr + ',"' + lblGoods.caption + '"';
      tempStr := tempStr + ',"' + lblVat.caption + '"';
      tempStr := tempStr + ',"' + lblTotal.caption + '"';
      tempStr := tempStr + ',"' + lblDeliveryLocation.caption + '"';
      writeln(self.exportFile, tempStr);
      PBRSCustStateFrm.prgbrExport.StepIt;
    end;

  GTValue := GTValue + StrToFloatDef(lblGoods.caption, 0, FormatSettings);
  GTVat := GTVat + StrToFloatDef(lblVAT.caption, 0, FormatSettings);
  GTTotal := GTTotal + StrToFloatDef(lblTotal.caption, 0, FormatSettings);
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
  qrlblGoods.caption := FloatToStrF(GTValue, ffFixed, 15, 2);
  qrlblVatTot.caption := FloatToStrF(GTVat, ffFixed, 15, 2);
  qrlblTotal.caption := FloatToStrF(GTTotal, ffFixed, 15, 2);
end;

procedure TPBRPCustStateFrm.GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  GTValue := 0.00;
  GTVat := 0.00;
  GTTotal := 0.00;
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
        + ',"Statement No"'
        + ',"Order Reference"'
        + ',"Job Number"'
        + ',"Description"'
        + ',"Invoice No"'
        + ',"Invoice Date"'
        + ',"Goods"'
        + ',"VAT"'
        + ',"Total"'
        + ',"Delivery Location"';

  writeLn(self.exportFile, tempStr);

  InvoiceReport.Prepare;

  CloseFile(self.exportFile);
end;

end.
