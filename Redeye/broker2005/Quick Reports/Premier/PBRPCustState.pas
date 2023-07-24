(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  A description of the unit here

VSS Info:
$Header: /PBL D5/Quick Reports/BroadSword/PBRPCustState.pas 1     21/02/:2 14:04 Paul $
$History: PBRPCustState.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 21/02/:2   Time: 14:04
 * Created in $/PBL D5/Quick Reports/BroadSword
 * Created Customer specific format
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:34
 * Updated in $/PBL D5
 * Changed report to allow date range selection and to format the report
 * as specified by Broadsword.
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 18/07/:1   Time: 14:44
 * Created in $/PBL D5
 * New Customer Statement print
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 14/06/:1   Time: 11:19
 * Updated in $/PBL D5
 * Amended to use new purchase order number / line number format.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 2/05/:1    Time: 13:00
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 17/10/:0   Time: 14:42
 * Updated in $/PBL D5
 * Amend report to force page break on change of customer.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 5/07/:0    Time: 17:02
 * Branched in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 9/03/:0    Time: 10:02
 * Created in $/PBL D5/QuickReports/BroadSword
 * Move the Quick Report units from the main project path into a
 * sub-project so we can customise the reports for customers.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 9/03/:0    Time: 10:01
 * Created in $/PBL D5/QuickReports/Forms Technology
 * Move the Quick Report units from the main project path into a
 * sub-project so we can customise the reports for customers.
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:17
 * Updated in $/PBL D5
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 * 
 * *****************  Version 4  *****************
 * User: Debbies      Date: 14/12/99   Time: 10:58
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 13/12/99   Time: 14:03
 * Updated in $/PBL D5
 * Set QuickReports printer index to any selected in the global Printer
 * object.  Use the CCSPrinterSetup dialog when Print button clicked.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 9/12/99    Time: 16:30
 * Updated in $/PBL D5
 * QuickReport conversions.  Get rid of semicolons after comments.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBRPCustState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, DBTables, CCSPrint,
  PBPOObjects, CCSCommon, gtQrCtrls;

type
  TPBRPCustStateFrm = class(TForm)
    InvoiceReport: TQuickRep;
    SalesInvDataSource: TDataSource;
    CompDataSource: TDataSource;
    GetCompSQL: TQuery;
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
    SalesInvSQL: TQuery;
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
    UpSalesInvSQL: TQuery;
    lblDateRange: TQRLabel;
    QRDBText5: TQRDBText;
    lblTotal: TQRLabel;
    UpCustSQL: TQuery;
    SalesInvSQLCustomer: TIntegerField;
    SalesInvSQLBranch_no: TIntegerField;
    SalesInvSQLAccount_Code: TStringField;
    SalesInvSQLCustomers_Desc: TStringField;
    SalesInvSQLSales_Invoice_No: TStringField;
    SalesInvSQLGoods_Value: TCurrencyField;
    SalesInvSQLVat_Value: TCurrencyField;
    SalesInvSQLGoods_Total: TCurrencyField;
    SalesInvSQLInvoice_Date: TDateTimeField;
    SalesInvSQLName: TStringField;
    SalesInvSQLBuilding_No_name: TStringField;
    SalesInvSQLStreet: TStringField;
    SalesInvSQLLocale: TStringField;
    SalesInvSQLTown: TStringField;
    SalesInvSQLPostcode: TStringField;
    SalesInvSQLPhone: TStringField;
    SalesInvSQLFax_Number: TStringField;
    SalesInvSQLCust_Order_No: TStringField;
    SalesInvSQLForm_Reference: TIntegerField;
    SalesInvSQLForm_Reference_Descr: TStringField;
    SalesInvSQLForm_Reference_ID: TStringField;
    SalesInvSQLSales_Invoice: TIntegerField;
    SalesInvSQLInvoice_Line_No: TIntegerField;
    SalesInvSQLQty_Invoiced: TFloatField;
    SalesInvSQLPurchase_Order: TFloatField;
    SalesInvSQLLine: TIntegerField;
    SalesInvSQLInt_Sel_Code: TIntegerField;
    SalesInvSQLSel1: TFloatField;
    SalesInvSQLText100: TStringField;
    SalesInvSQLOrder: TStringField;
    SalesInvSQLsales_Order: TIntegerField;
    SalesInvSQLSales_Order_Line_no: TIntegerField;
    SalesInvSQLJob_Bag: TIntegerField;
    SalesInvSQLJob_Bag_Line: TIntegerField;
    SalesInvSQLSOCustRef: TStringField;
    SalesInvSQLJBCustRef: TStringField;
    SalesInvSQLJob_Bag_Descr: TStringField;
    SalesInvSQLCustRef: TStringField;
    SalesInvSQLCustDesc: TStringField;
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

  GTValue := GTValue + StrToFloat(lblGoods.caption);
  GTVat := GTVat + StrToFloat(lblVAT.caption);
  GTTotal := GTTotal + StrToFloat(lblTotal.caption);
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
