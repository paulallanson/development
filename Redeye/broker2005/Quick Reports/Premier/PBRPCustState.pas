unit PBRPCustState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, CCSPrint,
  PBPOObjects, CCSCommon,
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
    CustRefQRDBText: TQRDBText;
    QRBand1: TQRBand;
    lblAccountCode: TQRLabel;
    lblRundate: TQRLabel;
    SalesInvSQL: TFDQuery;
    QRDBText1: TQRDBText;
    GrpFootQRBand: TQRBand;
    lblInvoiceNo: TQRLabel;
    QRLabel2: TQRLabel;
    CustomerAddMemo: TQRMemo;
    QRDBText4: TQRDBText;
    lblVAT: TQRLabel;
    lblGoods: TQRLabel;
    lblPage: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    UpSalesInvSQL: TFDQuery;
    lblDateRange: TQRLabel;
    QRDBText5: TQRDBText;
    lblTotal: TQRLabel;
    UpCustSQL: TFDQuery;
    SalesInvSQLCustomer: TIntegerField;
    SalesInvSQLBranch_no: TIntegerField;
    SalesInvSQLAccount_Code: TWideStringField;
    SalesInvSQLCustomers_Desc: TWideStringField;
    SalesInvSQLSales_Invoice_No: TWideStringField;
    SalesInvSQLGoods_Value: TCurrencyField;
    SalesInvSQLVat_Value: TCurrencyField;
    SalesInvSQLGoods_Total: TCurrencyField;
    SalesInvSQLInvoice_Date: TDateTimeField;
    SalesInvSQLName: TWideStringField;
    SalesInvSQLBuilding_No_name: TWideStringField;
    SalesInvSQLStreet: TWideStringField;
    SalesInvSQLLocale: TWideStringField;
    SalesInvSQLTown: TWideStringField;
    SalesInvSQLPostcode: TWideStringField;
    SalesInvSQLPhone: TWideStringField;
    SalesInvSQLFax_Number: TWideStringField;
    SalesInvSQLCust_Order_No: TWideStringField;
    SalesInvSQLForm_Reference: TIntegerField;
    SalesInvSQLForm_Reference_Descr: TWideStringField;
    SalesInvSQLForm_Reference_ID: TWideStringField;
    SalesInvSQLSales_Invoice: TIntegerField;
    SalesInvSQLInvoice_Line_No: TIntegerField;
    SalesInvSQLQty_Invoiced: TFloatField;
    SalesInvSQLPurchase_Order: TFloatField;
    SalesInvSQLLine: TIntegerField;
    SalesInvSQLInt_Sel_Code: TIntegerField;
    SalesInvSQLSel1: TFloatField;
    SalesInvSQLText100: TWideStringField;
    SalesInvSQLOrder: TWideStringField;
    SalesInvSQLsales_Order: TIntegerField;
    SalesInvSQLSales_Order_Line_no: TIntegerField;
    SalesInvSQLJob_Bag: TIntegerField;
    SalesInvSQLJob_Bag_Line: TIntegerField;
    SalesInvSQLSOCustRef: TWideStringField;
    SalesInvSQLJBCustRef: TWideStringField;
    SalesInvSQLJob_Bag_Descr: TWideStringField;
    SalesInvSQLCustRef: TWideStringField;
    SalesInvSQLCustDesc: TWideStringField;
    qrlblGoods: TQRLabel;
    qrlblVatTot: TQRLabel;
    qrlblTotal: TQRLabel;
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
    procedure SalesInvSQLOrderGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure SalesInvSQLCustRefGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure SalesInvSQLCustDescGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
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

uses PBImages;

var
  ipage: integer;

{$R *.DFM}

procedure TPBRPCustStateFrm.InvoiceReportBeforePrint(Sender:
  TCustomQuickRep;
  var PrintReport: Boolean);
begin
  self.GTValue := 0.00;
  self.GTVat   := 0.00;
  self.GTTotal := 0.00;

  with InvoiceReport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
  end;

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
  lblDateRange.caption := 'Period: '+PBdateStr(Datefrom)+' to '+PBDateStr(DateTo);

  inc(iPage);
  lblPage.caption := inttostr(iPage);

end;

procedure TPBRPCustStateFrm.InvDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with SalesInvSQL do
    begin
      lblGoods.caption := formatfloat('0.00',fieldbyname('Goods_value').asfloat);
      lblVAT.caption := formatfloat('0.00',fieldbyname('vat_value').asfloat);
      lblTotal.caption := formatfloat('0.00',(fieldbyname('Goods_value').asfloat + fieldbyname('vat_value').asfloat));
      if fieldbyname('Form_reference_id').asstring = '' then
        InvDetailBand.height := 19
      else
        InvDetailBand.height := 41;
    end;
end;

procedure TPBRPCustStateFrm.CustBranchQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iPage := 0;
end;

procedure TPBRPCustStateFrm.InvDetailBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
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

procedure TPBRPCustStateFrm.SalesInvSQLOrderGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if SalesInvSQLJob_Bag.asstring <> '' then
    text := 'JB/'+SalesInvSQLJob_Bag.asstring
  else
  if SalesInvSQLSales_Order.asstring <> '' then
    text := 'SO/'+SalesInvSQLSales_Order.asstring
  else
  if SalesInvSQLPurchase_Order.asstring <> '' then
    text := 'PO/'+SalesInvSQLPurchase_Order.asstring;
end;

procedure TPBRPCustStateFrm.SalesInvSQLCustRefGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if SalesInvSQLJBCustRef.asstring <> '' then
    text := SalesInvSQLJBCustRef.asstring
  else
  if SalesInvSQLSOCustRef.asstring <> '' then
    text := SalesInvSQLSOCustRef.asstring
  else
  if SalesInvSQLCust_Order_No.asstring <> '' then
    text := SalesInvSQLCust_Order_No.asstring;
end;

procedure TPBRPCustStateFrm.SalesInvSQLCustDescGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if SalesInvSQLJob_Bag_Descr.asstring <> '' then
  begin
    text := SalesInvSQLJob_Bag_Descr.asstring;
    QRDBText2.Enabled := false;
  end
  else
  if SalesInvSQLCustomers_Desc.asstring <> '' then
  begin
    text := SalesInvSQLCustomers_Desc.asstring;
    QRDBText2.Enabled := true;
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
