(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  A description of the unit here

VSS Info:
$Header: /PBL D5/Quick Reports/SOS/PBRPSalesInv.pas 9     26/09/03 10:35 Paul $
$History: PBRPSalesInv.pas $
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 26/09/03   Time: 10:35
 * Updated in $/PBL D5/Quick Reports/SOS
 * Changed to use the Times New Roman font size 11
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 13/06/:3   Time: 15:08
 * Updated in $/PBL D5/Quick Reports/SOS
 * Had to call the roundfloat function to get resolve rounding problem
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 13/06/:3   Time: 12:10
 * Updated in $/PBL D5/Quick Reports/SOS
 * Changed to correct VAT rounding problem, didn't actually do anything
 * just removed the code and re-entered.
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 12/06/03   Time: 16:50
 * Updated in $/PBL D5/Quick Reports/SOS
 * Move terms down slightly
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 12/06/:3   Time: 14:40
 * Updated in $/PBL D5/Quick Reports/SOS
 * Check in Customer changes
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 12/06/03   Time: 13:21
 * Updated in $/PBL D5/Quick Reports/SOS
 * checked in by janine
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 17/03/:3   Time: 17:16
 * Updated in $/PBL D5/Quick Reports/SOS
 * Changed printing of additional charges to reflect credit note values
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 5/03/:3    Time: 15:58
 * Updated in $/PBL D5/Quick Reports/SOS
 * Initial check-in to customers invoice layout.
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 5/03/:3    Time: 9:31
 * Created in $/PBL D5/Quick Reports/SOS
 * Initial takeon of spectrum specific reports
 * 
 * *****************  Version 13  *****************
 * User: Paul         Date: 28/02/:3   Time: 14:43
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * sets PrinterSettings.outputbin to user selected details 
 * 
 * *****************  Version 12  *****************
 * User: Paul         Date: 26/02/:3   Time: 9:13
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed to correctly calculate the VAT values
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 17/01/:3   Time: 17:01
 * Updated in $/PBL D5/Quick Reports/PMS
 * Changed to get the Customer Order number
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 23/12/:2   Time: 16:31
 * Updated in $/PBL D5/Quick Reports/PMS
 * New revised Invoice print
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 3/12/:2    Time: 17:14
 * Updated in $/PBL D5/Quick Reports/La Fenice
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 2/12/:2    Time: 16:54
 * Updated in $/PBL D5/Quick Reports/La Fenice
 * Changed to print multiple lines
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 3/10/02    Time: 11:45
 * Updated in $/PBL D5/Quick Reports/PMS
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 11/09/02   Time: 13:28
 * Updated in $/PBL D5/Quick Reports/PMS
 * Layout adjusted to match PMS pre-printed invoices.
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 18/07/:2   Time: 15:01
 * Created in $/PBL D5/Quick Reports/PMS
 * Initial takeon of Print Management Systems documents
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 31/01/:2   Time: 13:34
 * Updated in $/PBL D5/Quick Reports/Nexus
 * For Nexus for credit note print, change titles and print everything in
 * red.  Also bug in vat calculation.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 17/01/:2   Time: 11:11
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Added Form Reference to invoice
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 12/11/:1   Time: 16:33
 * Updated in $/PBL D5/Quick Reports/Nexus
 * Designed format for Nexus Invoices
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 30/10/:1   Time: 15:01
 * Created in $/PBL D5/Quick Reports/Nexus
 * Initial takeon of Nexus forms
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 3/10/:1    Time: 12:59
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Recompiled to resolve unusual invoice printing problems.
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 26/07/:1   Time: 10:52
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Added property to switch between printing invoices and printing credit
 * notes
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 29/11/:0   Time: 17:13
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Corrected calculation of VAT
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 16/11/:0   Time: 12:22
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed to print the correct delivery address on the invoice
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 13/11/:0   Time: 15:39
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed the print to show the Nominal Code
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 13/04/:0   Time: 16:39
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Changed to allow reprint of all invocies
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 14/03/:0   Time: 14:57
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Broadsword's version of the sales invoice printout.
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
 * *****************  Version 8  *****************
 * User: Paul         Date: 21/02/:0   Time: 13:15
 * Updated in $/PBL D5
 * Changes made to the Invoice Line query to work for Access database
 * 
 * *****************  Version 7  *****************
 * User: Roddym       Date: 8/02/:0    Time: 15:56
 * Updated in $/PBL D5
 * New insert method to ensure unique keys on adding.  Locking convention
 * for the Company record to ensure no double updates on Last_PO_Number,
 * Last_Enquiry_Number and Last_Invoice_No fields.  
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 25/01/:0   Time: 14:29
 * Updated in $/PBL D5
 * Don't add VAT to Additional Charges, it's already included in the
 * amount.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 20/12/99   Time: 17:17
 * Updated in $/PBL D5
 * Changed to display the Additional Charges on the Invoice Print
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:17
 * Updated in $/PBL D5
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 13/12/99   Time: 14:30
 * Updated in $/PBL D5
 * Set QuickReport's printerindex to that of the global printer.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 10/12/99   Time: 10:00
 * Updated in $/PBL D5
 * Changes made to convert Quick Report to Delphi V5
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBRPSalesInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, DB, ExtCtrls, CCSPrint,
  CCSCommon, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPSalesInvFrm = class(TForm)
    InvoiceReport: TQuickRep;
    InvHeadSQL: TFDQuery;
    InvHeadSRC: TDataSource;
    InvLineSQL: TFDQuery;
    InvLineSRC: TDataSource;
    CustomerSQL: TFDQuery;
    InvoiceFooter: TQRBand;
    qryComp: TFDQuery;
    InvOneHeadSQL: TFDQuery;
    UpInvHeadSQL: TFDQuery;
    UpInvLineSQL: TFDQuery;
    InvRHeadSQL: TFDQuery;
    NotesSQL: TFDQuery;
    InvoiceGroupHeader: TQRGroup;
    InvAddChgSQL: TFDQuery;
    OldInvLineSQL: TFDQuery;
    DeliverySQL: TFDQuery;
    DeliverySRC: TDataSource;
    AddressSRC: TDataSource;
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    SupplierSQL: TFDQuery;
    CompSQL: TFDQuery;
    CustSQL: TFDQuery;
    CreditHeadSQL: TFDQuery;
    GetNarrSQL: TFDQuery;
    AddChargesFooter: TQRBand;
    memoNotes: TQRMemo;
    qryPOLine: TFDQuery;
    qrySOLine: TFDQuery;
    qryJBLine: TFDQuery;
    qryInvCharges: TFDQuery;
    QRDBText3: TQRDBText;
    lblAmount: TQRLabel;
    qryJBHead: TFDQuery;
    qrySOHead: TFDQuery;
    QRBndPgHead: TQRBand;
    CustomerAddMemo: TQRMemo;
    InvoiceNumberLbl: TQRLabel;
    InvoiceDateLbl: TQRLabel;
    OurJobLbl: TQRLabel;
    lblCustOrderNo: TQRLabel;
    CustAccount: TQRDBText;
    QRBand2: TQRBand;
    GoodsValueLbl: TQRLabel;
    VATValueLbl: TQRLabel;
    TotalValueLbl: TQRLabel;
    lblReference: TQRLabel;
    QRLblInvno: TQRLabel;
    QRLblInvDt: TQRLabel;
    QRLblAcc: TQRLabel;
    QRLblCustRef: TQRLabel;
    QRLblOurRef: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    ExtrasVatlbl: TQRLabel;
    QRlblinv: TQRLabel;
    ChldBndDtl: TQRChildBand;
    QtyInvoicedLbl: TQRLabel;
    Dummy03: TQRLabel;
    lblProduct: TQRLabel;
    lblDescription: TQRLabel;
    GoodsTotalLbl: TQRLabel;
    GoodsVATLbl: TQRLabel;
    Dummy05: TQRLabel;
    Dummy06: TQRLabel;
    QRSordChldbnd: TQRChildBand;
    QRLblQtyInv: TQRLabel;
    QRLblDescription: TQRLabel;
    QRlblPrcUnt: TQRLabel;
    QRLblTotGoods: TQRLabel;
    QRLblGoodsVat: TQRLabel;
    QRLblLn: TQRLabel;
    QRLblProduct: TQRLabel;
    ChldBndHead: TQRChildBand;
    QRLblDesc: TQRLabel;
    QRLblNet: TQRLabel;
    QRLblVat: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    OrdQtyQRLabel: TQRLabel;
    QRLabel5: TQRLabel;
    DescQRLabel: TQRLabel;
    PartQRLabel: TQRLabel;
    LineQrLabel: TQRLabel;
    QRLblGoods: TQRLabel;
    InvoiceCharges: TQRSubDetail;
    ChldBndSOHead: TQRChildBand;
    InvoiceLine: TQRSubDetail;
    ChldBndFormRef: TQRChildBand;
    qrlblFormRef: TQRLabel;
    CompanyAddMemo: TQRMemo;
    qryCompany: TFDQuery;
    qrlblCompanyName: TQRLabel;
    procedure InvoiceReportBeforePrint(Sender: TCustomQuickRep; var PrintReport:
      Boolean);
    procedure InvoiceFooterBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure InvoiceFooterAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure InvoiceLineBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CustAccountPrint(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure OurJobLblPrint(sender: TObject; var Value: String);
    procedure InvoiceDateLblPrint(sender: TObject; var Value: String);
    procedure InvoiceNumberLblPrint(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure GoodsTotalLblPrint(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure GoodsValueLblPrint(sender: TObject; var Value: String);
    procedure VATValueLblPrint(sender: TObject; var Value: String);
    procedure TotalValueLblPrint(sender: TObject; var Value: String);
    procedure InvoiceGroupHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GoodsVATLblPrint(sender: TObject; var Value: String);
    procedure QtyInvoicedLblPrint(sender: TObject; var Value: String);
    procedure AddChargesFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InvoiceReportNeedData(Sender: TObject;
      var MoreData: Boolean);
    procedure InvoiceLineAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure InvoiceChargesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBndPgHeadBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSordChldbndBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FInvoiceNo : integer;
    FLoops: integer;
    function GetPOCustOrderNo(tempCode: string): string;
    function GetSOCustOrderNo(tempCode: string): string;
    function GetJBCustOrderNo(tempCode: string): string;
    function GetPOLineDesc(tempCode: real; tempLine: integer): string;
    function GetSOLineDesc(tempCode: integer; tempLine: integer): string;
    function GetJBLineDesc(tempCode: integer; tempLine: integer): string;
    function GetSOLineProduct(tempCode: integer; tempLine: integer): string;
    function GetFormRefDesc(tempCode: real; tempLine: integer): string;
    function GetStockRef(tempCode: real; tempLine: integer): string;
    function GetSOLinePUnit(tempCode: integer; tempLine: integer): string;
    procedure GetCompanyInfo(const iNoOfInvoices : integer);
    procedure LockCompanyRecord;
    procedure FreeCompanyRecord;
    function  GetLastInvoiceNo : integer;
    function  GetLastCreditNoteNo : integer;
    procedure UpdateInvoiceNumber(const iNo : integer);
    procedure UpdateCreditNoteNumber(const iNo : integer);
    procedure GetDetails;
    procedure BuildInvoiceNotes(aQuery : TFDQuery; const iNarrative : integer);
  public
    bInvoice: boolean;
    bUpdate: boolean;
    bReprint: boolean;
    bAll: boolean;
    bLineUp : Boolean;
    SelCode: Integer;
    PrinterSettings: TPrinterSettings;
    procedure GetInvoiceData;
  end;

var
  PBRPSalesInvFrm: TPBRPSalesInvFrm;

implementation

uses PBMenuMain;

var
  iGoods, iVAT: Real;

{$R *.DFM}

procedure TPBRPSalesInvFrm.InvoiceReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if not bInvoice then
    begin
      QRLabel3.Caption := 'Credit Value';
      QRLblInvNo.Caption := 'Credit No';
      QRLblInvDt.Caption := 'Credit Date';
      QRLblInv.Caption := 'CREDIT';
    end;
  with InvoiceReport.PrinterSettings do
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
  if bLineUp then
  begin
    InvoiceReport.OnNeedData := InvoiceReportNeedData;
    InvoiceReport.DataSet := nil;
  end
  else
  begin
    InvoiceReport.OnNeedData := nil;
    Dummy03.Enabled := false;
    Dummy05.Enabled := false;
    Dummy06.Enabled := false;
    GetCompanyInfo(InvoiceReport.DataSet.RecordCount);

    CustomerSQl.active := True;
    InvLineSQL.active := True;

    qryInvCharges.active := true;

    qryCompany.active := true;

    InvoiceNumberLbl.Caption := IntToStr(FInvoiceNo);
  if InvHeadSRC.Dataset.FieldByName('Sales_Invoice_type').Asstring = 'S' then
  begin
    ChldBndHead.ParentBand := nil;
    ChldBndDtl.ParentBand := nil;
    QRSordChldBnd.Parentband := InvoiceLine;
    ChldBndSOHead.ParentBand := QRBndpgHead;
    GoodsValuelbl.left := GoodsValueLbl.left + 27;
    VatValueLbl.left := VatValuelbl.left + 27;
    TotalValueLbl.Left := TotalValueLbl.Left + 27;
  end
  else
  begin
    QRSordChldBnd.ParentBand := nil;
    ChldBndSOHead.ParentBand := nil;
    ChldBndHead.ParentBand := QRBndPgHead;
    ChldBndDtl.ParentBand := InvoiceLine;
  end;
  end;

end;

procedure TPBRPSalesInvFrm.InvoiceFooterBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  iTotal: Real;
begin
  if bLineUp then
    Exit;

  lblReference.caption := '';

  if (not bInvoice) and (trim(InvLineSQL.fieldbyname('Reference').asstring) <> '') then
    lblReference.caption := 'Original Invoice Number: '+InvLineSQL.fieldbyname('Reference').asstring;

  if bInvoice then
    lblReference.caption := 'Terms: Strictly 30 days from date of invoice';

  GoodsValueLbl.Caption := formatfloat('0.00', iGoods);

  iVat := roundfloat(iVat,2);
  VatValueLbl.Caption := formatfloat('0.00', ivat);

  itotal := strtofloat(GoodsValueLbl.Caption) + strtofloat(VatValueLbl.Caption);
  TotalValueLbl.Caption := formatfloat('0.00', iTotal);

end;

procedure TPBRPSalesInvFrm.BuildInvoiceNotes(aQuery: TFDQuery;
  const iNarrative : integer);
var
  aStr : string;
begin
  with aQuery do
  begin  {If any notes then get then}
    if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Narrative_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
    MemoNotes.Lines.Clear;
    MemoNotes.Lines.Text := aStr;
  end;
end;

procedure TPBRPSalesInvFrm.InvoiceFooterAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if bLineUp or (not bUpdate) then Exit;
  {update the status on the Sales Invoice Header}
  with UpInvHeadSQL do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger :=
      InvHeadSRC.dataset.FieldByName('Sales_Invoice').AsInteger;
    ParamByName('status').AsInteger := 20;
    ParamByName('Invoice_Date').AsDateTime := StrToDate(InvoiceDateLbl.Caption);
    ParamByName('Sales_Invoice_No').AsString := InvoiceNumberLbl.Caption;
    ExecSQL;
  end;
end;

procedure TPBRPSalesInvFrm.GetInvoiceData;
begin
  if bLineUp or (not bAll) then
  begin
    InvOneHeadSQL.Close;
    InvOneHeadSQL.ParamByName('Sales_Invoice').AsInteger :=
      selcode;
    InvOneHeadSQL.Open;
    InvHeadSRC.dataset := InvOneHeadSQL;
    InvoiceGroupHeader.Expression := 'InvOneHeadSQL.Sales_invoice';
  end
  else
  begin
    InvHeadSQL.Close;
    if not bInvoice then
      InvHeadSQL.SQL := CreditHeadSQL.SQL;
    InvHeadSQL.Open;
    InvHeadSRC.dataset := InvHeadSQL;
    InvoiceGroupHeader.Expression := 'InvHeadSQL.Sales_invoice';
  end;
  InvoiceReport.DataSet := InvHeadSRC.DataSet;
end;

procedure TPBRPSalesInvFrm.InvoiceLineBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rGoodsTotal, rVatValue: Real;
  sPriceUnit: string;
begin
  if bLineUp then
    Exit;

  rUnitPrice := InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat;
  {Get the associated line description}
  if InvLineSQL.fieldbyname('Purchase_Order').asfloat <> 0 then
    begin
      lblProduct.caption := '';
      lblDescription.caption := GetPOLineDesc(InvLineSQL.fieldbyname('Purchase_Order').asfloat,
                                              InvLineSQL.fieldbyname('Line').asinteger);
      qrlblFormRef.caption := GetStockRef(InvLineSQL.fieldbyname('Purchase_Order').asfloat,
                                             InvLineSQL.fieldbyname('Line').asinteger);
    //  lblPriceUnit.caption := InvLineSQl.Fieldbyname('Sales_unit_Desc').asstring;
    end
  else
 if InvLineSRC.Dataset.fieldbyname('Sales_Order').asinteger <> 0 then
    begin
      QRLblLn.caption := IntToStr(InvLineSRC.Dataset.FieldByName('Invoice_Line_No').Asinteger);
      QRlblProduct.caption := GetSOLineProduct(InvLineSQL.fieldbyname('Sales_Order').asinteger,
                                              InvLineSQL.fieldbyname('Sales_order_Line_no').asinteger);
      QRlblDescription.caption := GetSOLineDesc(InvLineSQL.fieldbyname('Sales_Order').asinteger,
                                              InvLineSQL.fieldbyname('Sales_order_Line_no').asinteger);
      sPriceUnit := GetSOLinePUnit(InvLineSQL.fieldbyname('Sales_Order').asinteger,
                                              InvLineSQL.fieldbyname('Sales_order_Line_no').asinteger);
      if sPriceUnit = '' then
        QRlblPrcUnt.caption := InvLineSQl.Fieldbyname('Sales_unit_Desc').asstring
      else
        begin
          QRlblPrcUnt.caption := sPriceUnit;
          rUnitPrice := strtoint(sPriceUnit) * rUnitPrice;
        end;
    end
  else
    begin
      lblProduct.caption := '';
      lblDescription.caption := GetJBLineDesc(InvLineSQL.fieldbyname('Job_Bag').asinteger,
                                              InvLineSQL.fieldbyname('Job_Bag_Line').asinteger);
//      lblFormRef.caption := '';
 //     lblPriceUnit.caption := InvLineSQl.Fieldbyname('Sales_unit_Desc').asstring;
    end;

  if not bInvoice then
    begin
    QtyInvoicedLbl.Caption := IntToStr(PosToNegQty(InvLineSRC.Dataset.FieldByName('Qty_Invoiced').Asinteger));
    QRLblQtyInv.Caption := IntToStr(PosToNegQty(InvLineSRC.Dataset.FieldByName('Qty_Invoiced').Asinteger));
//    GoodsLbl.Caption := formatfloat('0.00',(PosToNegMoney(InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat))) ;
    QRLblGoods.Caption := formatfloat('0.00',(PosToNegMoney(rUnitPrice))) ;
    rGoodsTotal := PosToNegMoney(InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat);
    end
  else
    begin
    QtyInvoicedLbl.Caption := InvLineSRC.Dataset.FieldByName('Qty_Invoiced').Asstring;
    QRLblQtyInv.Caption := InvLineSRC.Dataset.FieldByName('Qty_Invoiced').Asstring;
//    GoodsLbl.Caption := formatfloat('0.00',(InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat));
    QRLblGoods.Caption := formatfloat('0.00',(rUnitPrice));
    rGoodsTotal := InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat;
    end;

  if InvLineSRC.Dataset.FieldByName('Price_Unit_Factor').AsInteger = 0 then
    rGoodsTotal := rGoodsTotal
  else
    rGoodsTotal := (strtofloat(QtyInvoicedLbl.Caption) /
      InvLineSRC.Dataset.FieldByName('Price_Unit_Factor').AsInteger)
      * rGoodsTotal;

  GoodsTotalLbl.Caption := formatfloat('0.00', rGoodsTotal);
  QRLblTotGoods.Caption := formatfloat('0.00', rGoodsTotal);
  iGoods := iGoods + StrToFloat(GoodsTotalLbl.Caption);
  rVatValue := StrToFloat(GoodsTotalLbl.Caption) *
    (InvLineSRC.Dataset.FieldByName('Vat_Rate').AsFloat / 100);
  ivat := ivat + rVatValue;

  rVatValue := roundfloat(rVatValue,2);
  GoodsVATLbl.Caption := formatfloat('0.00',(rVATValue));
  QRLblGoodsVat.Caption := formatfloat('0.00',(rVATValue));

  BuildInvoiceNotes((InvoiceReport.DataSet as TFDQuery),InvoiceReport.DataSet.fieldbyname('Narrative').asinteger);

  if memoNotes.lines.text = '' then
    AddChargesFooter.enabled := false
  else
    AddChargesFooter.enabled := true;

// InvoiceLine.height := lblDescription.height + 3
  if trim(qrlblFormRef.caption) = '' then
    ChldBndFormRef.enabled := false
  else
    ChldBndFormRef.enabled := True;
end;

procedure TPBRPSalesInvFrm.FreeCompanyRecord;
begin
  if bLineUp then
    Exit;
  with qryComp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

procedure TPBRPSalesInvFrm.LockCompanyRecord;
var
  StartTime : TDateTime;
  EndTime : TDateTime;
  InUseBy : integer;
  Myself : integer;
const
  LockTime = ((1/24) * (5/3600));  { Allow 5 seconds for lock attempts }
begin
  if bLineUp then
    Exit;
  StartTime := Time;
  EndTime := StartTime + LockTime;
  InUseBy := 0;
  MySelf := PBMenuMainFrm.iOperator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qryComp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
              'Where Company=1 and In_Use_By is null');
      ExecSQL;
      SQL.Clear;
      SQL.Add('Select In_Use_By From Company Where Company = 1');
      Open;
      InUseBy := FieldByName('In_Use_By').AsInteger;
      Close;
      if (InUseBy <> MySelf) and (Time > EndTime) then
      begin { Assume the other locker has died and grab record unconditionally }
        SQL.Clear;
        SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
                'Where Company=1');
        ExecSQL;
      end;
    end;
end;

procedure TPBRPSalesInvFrm.UpdateInvoiceNumber(const iNo : integer);
begin
  if bLineUp then
    Exit;
  with qryComp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set Last_Invoice_No = ' + IntToStr(iNo) +
            ' Where Company=1');
    ExecSQL;
  end;
end;

procedure TPBRPSalesInvFrm.UpdateCreditNoteNumber(const iNo : integer);
begin
  if bLineUp then
    Exit;
  with qryComp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set Last_Credit_Note_No = ' + IntToStr(iNo) +
            ' Where Company=1');
    ExecSQL;
  end;
end;

function TPBRPSalesInvFrm.GetLastInvoiceNo: integer;
begin
  Result := 0;
  if bLineUp then
    Exit;
  with qryComp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select Last_Invoice_No From Company Where Company=1');
    Open;
    Result := FieldByName('Last_Invoice_No').AsInteger;
    Close;
  end;
end;

function TPBRPSalesInvFrm.GetLastCreditNoteNo: integer;
begin
  Result := 0;
  if bLineUp then
    Exit;
  with qryComp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select Last_Credit_Note_No From Company Where Company=1');
    Open;
    Result := FieldByName('Last_Credit_Note_No').AsInteger;
    Close;
  end;
end;

procedure TPBRPSalesInvFrm.GetCompanyInfo(const iNoOfInvoices : integer);
begin
  if bLineUp then
    Exit;
  LockCompanyRecord;
  try
    {Check for Invoice or Credit Note}
    if bInvoice then
      FInvoiceNo := GetLastInvoiceNo
    else
      FInvoiceNo := GetLastCreditNoteNo;

    if bUpdate then
      {Check for Invoice or Credit Note}
      if bInvoice then
        UpdateInvoiceNumber(FInvoiceNo + iNoOfInvoices)
      else
        UpdateCreditNoteNumber(FInvoiceNo + iNoOfInvoices)
  finally
    FreeCompanyRecord;
  end;
end;

procedure TPBRPSalesInvFrm.GetDetails;
begin
  {Activate the main report SQL}
  with DeliverySQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := InvLineSQL.fieldbyname('Purchase_Order').asfloat;
    ParamByName('Line').AsInteger := InvLineSQL.fieldbyname('Line').asinteger;
    Open;
  end;

  if DeliverySQL.FieldByName('Customer').AsString <> '' then
    begin
      with CustSQl do
      begin
        Close;
        ParamByName('Customer').AsInteger :=
          DeliverySQL.FieldByName('Customer').AsInteger;
        ParamByName('Branch_no').AsInteger :=
          DeliverySQL.FieldByName('Branch_no0').AsInteger;
        Open;
      end;
      AddressSRC.Dataset := CustSQL;
    end
  else
  if DeliverySQL.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          DeliverySQL.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
      end;
      AddressSRC.Dataset := AdhocSQL;
    end
  else
  if DeliverySQL.FieldByName('Rep').AsString <> '' then
    begin
      with RepSQl do
      begin
        Close;
        ParamByName('Rep').AsInteger :=
          DeliverySQL.FieldByName('Rep').AsInteger;
        Open;
      end;
      AddressSRC.Dataset := RepSQL;
    end
  else
  if DeliverySQL.FieldByName('Supplier').AsString <> '' then
    begin
      with SupplierSQl do
        begin
          Close;
          ParamByName('Supplier').AsInteger :=
            DeliverySQL.FieldByName('Supplier').AsInteger;
          ParamByName('Branch_no').AsInteger :=
            DeliverySQL.FieldByName('Branch_no').AsInteger;
          Open;
        end;
        AddressSRC.Dataset := SupplierSQL;
    end
  else
    begin
      with CompSQL do
        begin
          Close;
          Open;
        end;
        AddressSRC.Dataset := CompSQL;
    end;
end;

procedure TPBRPSalesInvFrm.CustAccountPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'XXXXXXXXXX';
end;

procedure TPBRPSalesInvFrm.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'XXXXXXXXXX';
end;

procedure TPBRPSalesInvFrm.OurJobLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'XXXXXXXXXX';
end;

procedure TPBRPSalesInvFrm.InvoiceDateLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'DD/MM/YYYY';
end;

procedure TPBRPSalesInvFrm.InvoiceNumberLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNNNNN/NN';
end;

procedure TPBRPSalesInvFrm.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
end;

procedure TPBRPSalesInvFrm.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'PER NNNN';
end;

procedure TPBRPSalesInvFrm.GoodsTotalLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNNN.NN';
end;

procedure TPBRPSalesInvFrm.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'XXXXXXXXXXXXXXXXXXXXXXXX';
end;

procedure TPBRPSalesInvFrm.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNN.NN';
end;

procedure TPBRPSalesInvFrm.GoodsValueLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNNN.NN';
end;

procedure TPBRPSalesInvFrm.VATValueLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNN.NN';
end;

procedure TPBRPSalesInvFrm.TotalValueLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNNN.NN';
end;

procedure TPBRPSalesInvFrm.InvoiceGroupHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  icount: Integer;
begin
  if bLineUp then
    Exit;
  {initialise the Goods and VAT values}
  iGoods := 0.00;
  iVat := 0.00;

  CustomerAddMemo.Lines.Clear;
  CompanyAddMemo.Lines.Clear;

  {Get Delivery Details}
  GetDetails;

  {Create the Company Address details memo}
  qrlblCompanyName.Caption := qryCompany.Fields[0].AsString;
  for icount := 1 to 5 do
  begin
    if qryCompany.Fields[icount].AsString = '' then Continue;
    CompanyAddMemo.Lines.Add(Trim(qryCompany.Fields[icount].AsString));
  end;

  {Create the Customer Address details memo}
  for icount := 1 to 6 do
  begin
    if CustomerSQL.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(CustomerSQL.Fields[icount].AsString);
  end;

  {Find the Next Invoice Number}
  if bReprint then
  begin
    InvoiceNumberLbl.Caption :=
      InvHeadSRC.Dataset.FieldByName('Sales_invoice_no').AsString;
    InvoiceDateLbl.Caption := FormatDateTime('dd"/"mm"/"yyyyy',
      InvHeadSRC.Dataset.FieldByName('invoice_date').AsDateTime);
  end
  else
  begin
    Inc(FInvoiceNo);
    InvoiceNumberLbl.Caption := IntToStr(FInvoiceNo);
    InvoiceDateLbl.Caption := FormatDateTime('dd"/"mm"/"yyyyy',
      InvHeadSRC.Dataset.FieldByName('invoice_date').AsDateTime);
  end;

  OurJobLbl.Caption := InvHeadSRC.Dataset.FieldByName('Reference').Asstring;

  if InvHeadSRC.Dataset.FieldByName('Sales_Invoice_type').Asstring = 'S' then
      lblCustOrderNo.caption := GetSOCustOrderNo(InvHeadSRC.Dataset.FieldByName('Reference').Asstring);
  if InvHeadSRC.Dataset.FieldByName('Sales_Invoice_type').Asstring = 'J' then
    lblCustOrderNo.caption := GetJBCustOrderNo(InvHeadSRC.Dataset.FieldByName('Reference').Asstring)
  else
    lblCustOrderNo.caption := GetPOCustOrderNo(InvHeadSRC.Dataset.FieldByName('Reference').Asstring);

  if qryInvCharges.recordcount = 0 then
    begin
      InvoiceCharges.enabled := false;
    end
  else
    begin
      InvoiceCharges.enabled := true;
    end 
end;

procedure TPBRPSalesInvFrm.GoodsVATLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNN.NN';
end;

procedure TPBRPSalesInvFrm.QtyInvoicedLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNNNNNNN';
end;

procedure TPBRPSalesInvFrm.AddChargesFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  AddChargesFooter.height := memoNotes.height + 13;
end;

procedure TPBRPSalesInvFrm.InvoiceReportNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if FLoops > 0 then
    MoreData := false
  else
    MoreData := true;
  Inc(FLoops);
end;

function TPBRPSalesInvFrm.GetJBLineDesc(tempCode, tempLine: integer): string;
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

function TPBRPSalesInvFrm.GetPOLineDesc(tempCode: real;
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

function TPBRPSalesInvFrm.GetSOLineDesc(tempCode, tempLine: integer): string;
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

function TPBRPSalesInvFrm.GetFormRefDesc(tempCode: real;
  tempLine: integer): string;
begin
  result := '';
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempcode;
      parambyname('Line').asinteger := tempLine;
      open;
      if trim(fieldbyname('Form_Reference_id').asstring) <> '' then
        result := fieldbyname('Form_Reference_id').asstring
      else
        exit;

      if trim(fieldbyname('Form_Reference_Descr').asstring) <> '' then
        result := result + ' - ' + fieldbyname('Form_Reference_Descr').asstring;
    end;
end;

procedure TPBRPSalesInvFrm.InvoiceLineAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if bLineUp or (not bUpdate) then Exit;
  {update the status on the Sales Invoice Header}
  with UpInvLineSQL do
  begin
    Close;
    ParamByName('Sales_Invoice').AsInteger :=
      InvLineSRC.dataset.FieldByName('Sales_Invoice').AsInteger;
    ParamByName('Line').AsInteger :=
      InvLineSRC.dataset.FieldByName('Invoice_Line_no').AsInteger;
    ParamByName('status').AsInteger := 20;
    ExecSQL;
  end;
end;

procedure TPBRPSalesInvFrm.InvoiceChargesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 rAddTotal, rVatValue: real;
begin
  if bLineUp then
    Exit;

  rVatValue := (qryInvCharges.Fieldbyname('Amount').asfloat
     * (qryInvCharges.FieldByName('Vat_Rate').AsFloat / 100));

  rAddTotal := qryInvCharges.Fieldbyname('Amount').asfloat;
  if not bInvoice then
    lblAmount.Caption := formatfloat('0.00',(PosToNegMoney(qryInvCharges.Fieldbyname('Amount').asfloat)))
  else
    lblAmount.Caption := formatfloat('0.00',(qryInvCharges.Fieldbyname('Amount').asfloat));

  rVatValue := roundfloat(rVatValue,2);
  if not bInvoice then
    ExtrasVATLbl.Caption := formatfloat('0.00',(PosToNegMoney(rVATValue)))
  else
    ExtrasVATLbl.Caption := formatfloat('0.00',(rVATValue));

  iGoods := iGoods + strtofloat(lblAmount.Caption);
  ivat := ivat + strtofloat(ExtrasVATLbl.Caption);
end;

function TPBRPSalesInvFrm.GetSOLinePUnit(tempCode: integer;
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

function TPBRPSalesInvFrm.GetJBCustOrderNo(tempCode: string): string;
begin
  result := '';
  with qryJBHead do
    begin
      close;
      parambyname('Job_Bag').asinteger := strtoint(trim(tempcode));
      open;
      result := fieldbyname('Cust_Order_no').asstring;
    end;
end;

function TPBRPSalesInvFrm.GetPOCustOrderNo(tempCode: string): string;
begin
  result := '';
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_order').asfloat := strtofloat(trim(tempcode));
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Cust_Order_no').asstring;
    end;
end;

function TPBRPSalesInvFrm.GetSOCustOrderNo(tempCode: string): string;
begin
  result := '';
  with qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := strtoint(trim(tempcode));
      open;
      result := fieldbyname('Cust_Order_no').asstring;
    end;
end;

function TPBRPSalesInvFrm.GetSOLineProduct(tempCode,
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

procedure TPBRPSalesInvFrm.QRBndPgHeadBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GoodsValueLbl.Caption := '';
  VatValueLbl.Caption := '';
  TotalValueLbl.Caption := 'Page to Follow';
  lblReference.caption := '';
end;

function TPBRPSalesInvFrm.GetStockRef(tempCode: real;
  tempLine: integer): string;
begin
  result := '';
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempcode;
      parambyname('Line').asinteger := tempLine;
      open;
      if trim(fieldbyname('Stock_reference').asstring) <> '' then
        result := fieldbyname('Stock_reference').asstring
    end;
end;

procedure TPBRPSalesInvFrm.QRSordChldbndBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
sPriceUnit : string;
rUnitPrice, rGoodsTotal, rVatValue: Real;
begin
end;

end.
