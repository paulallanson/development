(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  A description of the unit here

VSS Info:
$Header: /PBL D5/Quick Reports/PMS/PBRPCustState.pas 1     18/07/:2 15:01 Paul $
$History: PBRPCustState.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 18/07/:2   Time: 15:01
 * Created in $/PBL D5/Quick Reports/PMS
 * Initial takeon of Print Management Systems documents
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 28/03/:2   Time: 12:51
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Error in statement total calculation, need to accumulate as each line
 * is printed, not in the sql.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 26/03/:2   Time: 11:10
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Added new column "Unit Price"
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 19/03/:2   Time: 16:14
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Changed to set the labels from Statements to Invoices
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 21/02/:2   Time: 14:05
 * Created in $/PBL D5/Quick Reports/Nexus
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
    QRLabel1: TQRLabel;
    lblInvoiceNo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    CustomerAddMemo: TQRMemo;
    QRDBText4: TQRDBText;
    lblVAT: TQRLabel;
    lblGoods: TQRLabel;
    lblPage: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText3: TQRDBText;
    UpSalesInvSQL: TFDQuery;
    UpCustSQL: TFDQuery;
    QRLabel17: TQRLabel;
    lblUnitPrice: TQRLabel;
    TotGoodsQRLbl: TQRLabel;
    TotVatQRLbl: TQRLabel;
    InvTotQrLbl: TQRLabel;
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

uses PBImages;

var
  ipage: integer;

{$R *.DFM}

procedure TPBRPCustStateFrm.InvoiceReportBeforePrint(Sender:
  TCustomQuickRep;
  var PrintReport: Boolean);
begin
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
      rGoods := rGoods + StrToFloatDef(LblGoods.Caption, 0, FormatSettings);
      rvat := rVat + StrToFloatDef(LblVat.Caption, 0, FormatSettings);
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
          parambyname('Statement_from').asdatetime := DateFrom;
          parambyname('Statement_to').asdatetime := DateTo;
          execsql;
        end;
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
  InvTotQRLbl.Caption := FormatFloat('0.00',(StrToFloatDef(TotGoodsQRLbl.Caption, 0, FormatSettings)+StrToFloatDef(TotVatQRlbl.caption)), 0, FormatSettings);
end;

procedure TPBRPCustStateFrm.GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
rvat := 0.00;
rgoods := 0.00;
end;

end.
