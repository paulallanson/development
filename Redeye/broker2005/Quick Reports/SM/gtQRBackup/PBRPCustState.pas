(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  A description of the unit here

VSS Info:
$Header: /PBL D5/Quick Reports/Formpro/PBRPCustState.pas 1     27/05/03 12:33 Paul $
$History: PBRPCustState.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 27/05/03   Time: 12:33
 * Created in $/PBL D5/Quick Reports/Formpro
 * Initial takeon of Formpro document prints
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
    CustStateQuickReport: TQuickRep;
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
    lblRundate: TQRLabel;
    SalesInvSQL: TFDQuery;
    QRDBText1: TQRDBText;
    GrpFootQRBand: TQRBand;
    QRLabel1: TQRLabel;
    lblInvoiceNo: TQRLabel;
    QRLabel2: TQRLabel;
    lblGoods: TQRLabel;
    lblPage: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    UpSalesInvSQL: TFDQuery;
    UpCustSQL: TFDQuery;
    QRLabel17: TQRLabel;
    LblTotal: TQRLabel;
    TotGoodsQRLbl: TQRLabel;
    TotVatQRLbl: TQRLabel;
    InvTotQrLbl: TQRLabel;
    QRMemoCmpnyNm: TQRMemo;
    QRLabel3: TQRLabel;
    CustomerAddMemo: TQRMemo;
    QRLabel18: TQRLabel;
    LblAccountCode: TQRDBText;
    QRLabel19: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel14: TQRLabel;
    lblVat: TQRLabel;
    QRMemo1: TQRMemo;
    QRShape1: TQRShape;
    lblCustomerRef: TQRLabel;
    qryGetPO: TFDQuery;
    qryGetSO: TFDQuery;
    qryGetJB: TFDQuery;
    procedure CustStateQuickReportBeforePrint(Sender: TCustomQuickRep;
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
    procedure CustStateQuickReportAfterPrint(Sender: TObject);
    procedure GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    FReprint: boolean;
    procedure SetReprint(const Value: boolean);
    function GetPOReference(sTemp: string): string;
    function GetJBReference(sTemp: string): string;
    function GetSOReference(sTemp: string): string;
  public
    CustomerNo, BranchNo, iIntSel: Integer;
    Preview: ByteBool;
    CustomerName: string;
    StatementNo: string;
    DateFrom, DateTo, InvDate: TDateTime;
    PrinterSettings : TPrinterSettings;
    rvat, rGoods: Real;
    property Reprint: boolean read FReprint write SetReprint;
  end;

var
  PBRPCustStateFrm: TPBRPCustStateFrm;

implementation

uses PBImages;

var
  ipage: integer;

{$R *.DFM}

procedure TPBRPCustStateFrm.CustStateQuickReportBeforePrint(Sender:
  TCustomQuickRep;
  var PrintReport: Boolean);
  var irow:integer;
begin
  with CustStateQuickReport.PrinterSettings do
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
  with QRMemoCmpnyNm do
    begin
      GetCompSQL.close;
      GetCompSQL.open;
      Lines.Clear;
      for irow := 1 to 5 do
        begin
        if Trim(GetCompSQL.Fields[irow].AsString) <> '' then
        Lines.Append(Trim(GetCompSQL.Fields[irow].AsString)) ;
      end;
  {Finally, add the phone number} ;
    Lines.Append(' ');
    Lines.Append('Tel: ' + Trim(GetCompSQL.FieldByName('Phone').AsString));
    Lines.Append('Fax: ' + Trim(GetCompSQL.FieldByName('Fax_Number').AsString));
    Lines.Append('Email: ' + Trim(GetCompSQL.FieldByName('Email').AsString));
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
      if fieldbyname('Sales_invoice_type').asstring = '' then
        begin
          lblCustomerRef.caption := GetPOReference(fieldbyname('Reference').asstring)
        end
      else
      if fieldbyname('Sales_invoice_type').asstring = 'S' then
        begin
          lblCustomerRef.caption := GetSOReference(fieldbyname('Reference').asstring)
        end
      else
      if fieldbyname('Sales_invoice_type').asstring = 'J' then
        begin
          lblCustomerRef.caption := GetJBReference(fieldbyname('Reference').asstring)
        end
      else
        lblCustomerRef.caption := '';

      lblGoods.caption := formatfloat('0.00',fieldbyname('Goods_value').asfloat);
      lblVAT.caption := formatfloat('0.00',fieldbyname('vat_value').asfloat);
 //     lblUnitPrice.caption := formatfloat('0.00',fieldbyname('unit_price').asfloat);
      lblTotal.caption := formatfloat('0.00',fieldbyname('Goods_value').asfloat +
         fieldbyname('vat_value').asfloat);
      rGoods := rGoods + StrToFloatDef(LblGoods.Caption, 0, FormatSettings);
      rvat := rVat + fieldbyname('vat_value').asfloat;
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

procedure TPBRPCustStateFrm.CustStateQuickReportAfterPrint(
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
