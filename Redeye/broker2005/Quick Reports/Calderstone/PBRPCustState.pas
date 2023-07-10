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
    CustBranchQRGroup: TQRGroup;
    InvDetailBand: TQRSubDetail;
    CustRefQRDBText: TgtQRDBText;
    QRBand1: TQRBand;
    lblAccountCode: TgtQRLabel;
    lblRundate: TgtQRLabel;
    SalesInvSQL: TQuery;
    QRDBText1: TgtQRDBText;
    GrpFootQRBand: TQRBand;
    QRLabel1: TgtQRLabel;
    lblInvoiceNo: TgtQRLabel;
    QRShape1: TgtQRShape;
    QRLabel2: TgtQRLabel;
    CustomerAddMemo: TgtQRMemo;
    QRDBText4: TgtQRDBText;
    lblVAT: TgtQRLabel;
    lblGoods: TgtQRLabel;
    lblPage: TgtQRLabel;
    QRDBText2: TgtQRDBText;
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
    QRShape2: TgtQRShape;
    QRLabel11: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    UpSalesInvSQL: TQuery;
    UpCustSQL: TQuery;
    QRLabel17: TgtQRLabel;
    lblUnitPrice: TgtQRLabel;
    TotGoodsQRLbl: TgtQRLabel;
    TotVatQRLbl: TgtQRLabel;
    InvTotQrLbl: TgtQRLabel;
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
    procedure SetReprint(const Value: boolean);
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

procedure TPBRPCustStateFrm.InvDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with SalesInvSQL do
    begin
      lblGoods.caption := formatfloat('0.00',fieldbyname('Goods_value').asfloat);
      lblVAT.caption := formatfloat('0.00',fieldbyname('vat_value').asfloat);
      lblUnitPrice.caption := formatfloat('0.00',fieldbyname('unit_price').asfloat)+ ' '+fieldbyname('Price_Descr').asstring;
      rGoods := rGoods + StrToFloat(LblGoods.Caption);
      rvat := rVat + StrToFloat(LblVat.Caption);
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

  if exporting then
    begin
      tempStr := '"' + SalesInvSQL.fieldbyname('Name').asstring + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Account_Code').asstring + '"';
      tempStr := tempStr + ',"' + lblRunDate.caption + '"';
      tempStr := tempStr + ',"' + lblInvoiceNo.caption + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Cust_Order_No').asstring + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Customers_Desc').asstring + '"';
      tempStr := tempStr + ',"' + lblGoods.caption + '"';
      tempStr := tempStr + ',"' + lblVat.caption + '"';
      tempStr := tempStr + ',"' + lblUnitPrice.caption + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Sales_Invoice_no').asstring + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Reference').asstring + '"';
      writeln(self.exportFile, tempStr);
      PBRSCustStateFrm.prgbrExport.StepIt;
    end;
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
        + ',"Unit Price"'
        + ',"Invoice No"'
        + ',"Job Number"';

  writeLn(self.exportFile, tempStr);

  InvoiceReport.Prepare;

  CloseFile(self.exportFile);
end;

end.
