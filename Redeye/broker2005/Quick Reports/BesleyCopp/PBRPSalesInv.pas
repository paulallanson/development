unit PBRPSalesInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, DB, ExtCtrls, CCSPrint,
  CCSCommon, PBPOObjects, QrExport, qrprntr, printers, jpeg,
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
    GoodsTotalLbl: TQRLabel;
    DeliverySQL: TFDQuery;
    DeliverySRC: TDataSource;
    AddressSRC: TDataSource;
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    SupplierSQL: TFDQuery;
    CompSQL: TFDQuery;
    CustSQL: TFDQuery;
    CreditHeadSQL: TFDQuery;
    GoodsLbl: TQRLabel;
    QtyInvoicedLbl: TQRLabel;
    GetNarrSQL: TFDQuery;
    AddChargesFooter: TQRBand;
    lblDescription: TQRLabel;
    qryPOLine: TFDQuery;
    qrySOLine: TFDQuery;
    qryJBLine: TFDQuery;
    qryInvCharges: TFDQuery;
    QRDBText3: TQRDBText;
    lblAmount: TQRLabel;
    lblPriceUnit: TQRLabel;
    InvoiceLine: TQRSubDetail;
    InvoiceCharges: TQRSubDetail;
    qryJBHead: TFDQuery;
    qrySOHead: TFDQuery;
    lblProduct: TQRLabel;
    QRBand1: TQRBand;
    CustomerAddMemo: TQRMemo;
    InvoiceNumberLbl: TQRLabel;
    InvoiceDateLbl: TQRLabel;
    OurJobLbl: TQRLabel;
    lblCustOrderNo: TQRLabel;
    CustAccount: TQRDBText;
    QRBand2: TQRBand;
    ExtrasVatLbl: TQRLabel;
    qrlblInvoiceLabel: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    lblJobNumber: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrshpPayment: TQRShape;
    memPayment: TQRMemo;
    QRMemoCmpnyNm: TQRMemo;
    lblInvoiceDescription: TQRLabel;
    QRLabel18: TQRLabel;
    lblReference: TQRLabel;
    QRLabel8: TQRLabel;
    GoodsVatLbl: TQRLabel;
    qryCompCat: TFDQuery;
    qryUniqueInv: TFDQuery;
    qryCategory: TFDQuery;
    
    imgReport: TQRImage;
    gtNotesShape: TQRShape;
    RichmemoNotes: TQRRichText;
    memoNotes: TQRMemo;
    memDefPayment: TQRMemo;
    GetCustHOSQL: TFDQuery;
    gtQRLabel2: TQRLabel;
    VatPerclbl: TQRLabel;
    qryUpCustomer: TFDQuery;
    qryUpInvoicePay: TFDQuery;
    QRLabel16: TQRLabel;
    BranchAddMemo: TQRMemo;
    GoodsValueLbl: TQRLabel;
    TotalValueLbl: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    VATValueLbl: TQRLabel;
    qryGetCustomerPaymentTerms: TFDQuery;
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
    procedure GoodsLblPrint(sender: TObject; var Value: String);
    procedure QtyInvoicedLblPrint(sender: TObject; var Value: String);
    procedure AddChargesFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InvoiceReportNeedData(Sender: TObject;
      var MoreData: Boolean);
    procedure InvoiceLineAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure InvoiceChargesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure InvoiceHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FInvoiceNo : integer;
    FLoops: integer;
    FCategory: integer;
    FSuffix: boolean;
    FSuffixValue: string;
    FPrePayAmount: double;
    function GetCategoryPayNotes(tempCode: integer): integer;
    procedure GetSODeliveryDetails(tempCode: string);
    function GetPOCustOrderNo(tempCode: string): string;
    function GetSOCustOrderNo(tempCode: string): string;
    function GetJBCustOrderNo(tempCode: string): string;
    function GetSOLineProduct(tempCode: integer; tempLine: integer): string;
    function GetSOLineQuantity(tempCode, tempLine: integer): integer;
    function GetFormRefDesc(tempCode: real; tempLine: integer): string;
    function GetSOLinePUnit(tempCode: integer; tempLine: integer): string;
    procedure GetCompanyCategoryInfo(const iNoOfInvoices: integer);
    procedure GetCompanyInfo(const iNoOfInvoices : integer);
    procedure LockCompanyRecord;
    procedure FreeCompanyRecord;
    function  GetLastInvoiceNo : integer;
    function  GetLastCategoryInvoiceNo: integer;
    function  GetLastCreditNoteNo : integer;
    function UseSeparateInvoice(tempCode: integer): boolean;
    procedure UpdateCategoryInvoiceNumber(const iNo: integer);
    procedure UpdateInvoiceNumber(const iNo : integer);
    procedure UpdateCreditNoteNumber(const iNo : integer);
    procedure GetDetails;
    procedure BuildInvoiceNotes(aQuery : TFDQuery; const iNarrative : integer);
    procedure BuildPaymentNotes(const iNarrative: integer);
    procedure SetPrePayAmount(const Value: double);
    function DirectDebitCustomer(tempCode: integer): boolean;
  public
    bCustomerisReseller : boolean;
    bInvoice: boolean;
    bPrintLogo: boolean;
    bUpdate: boolean;
    bPreview: boolean;
    bReprint: boolean;
    bAll: boolean;
    bLineUp : Boolean;
    SelCode: Integer;
    ShowZeroValues: string;
    PrinterSettings: TPrinterSettings;
    function GetPOLineDesc(tempCode: real; tempLine: integer): string;
    function GetSOLineDesc(tempCode: integer; tempLine: integer): string;
    function GetJBLineDesc(tempCode: integer; tempLine: integer): string;
    procedure GetInvoiceData;
    property PrePayAmount: double read FPrePayAmount write SetPrePayAmount;
  end;

var
  PBRPSalesInvFrm: TPBRPSalesInvFrm;

implementation

uses pbMainMenu, PBImages, pbDatabase;

var
  iGoods, iVAT: Real;

{$R *.DFM}

procedure TPBRPSalesInvFrm.InvoiceReportBeforePrint(Sender: TCustomQuickRep;
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

  if not bInvoice then
    begin
      qrlblInvoiceLabel.Caption := 'Credit';
      QRLabel4.Caption := 'Credit No.';
      QRLabel5.Caption := 'Credit Date';
      QRLabel15.Caption := 'Credit Total';
      memPayment.Enabled := False;
      qrshpPayment.Enabled := False;
    end
  else
    begin
      qrlblInvoiceLabel.Caption := 'Invoice';
      QRLabel4.Caption := 'Invoice No.';
      QRLabel5.Caption := 'Invoice Date';
      QRLabel15.Caption := 'Invoice Total';
    end;

  if bLineUp then
  begin
    InvoiceReport.OnNeedData := InvoiceReportNeedData;
    InvoiceReport.DataSet := nil;
  end
  else
  begin
    with QRMemoCmpnyNm do
    begin
      CompSQL.close;
      CompSQL.open;
      Lines.Clear;
      for irow := 1 to 5 do
        begin
        if Trim(CompSQL.Fields[irow].AsString) <> '' then
        Lines.Append(Trim(CompSQL.Fields[irow].AsString)) ;
      end;
  {Finally, add the phone number} ;
    Lines.Append(' ');
    Lines.Append('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString));
    Lines.Append('Fax: ' + Trim(CompSQL.FieldByName('Fax_Number').AsString));
    Lines.Append('Email: ' + Trim(CompSQL.FieldByName('Email').AsString));
    end;
    InvoiceReport.OnNeedData := nil;
//    GetCompanyInfo(InvoiceReport.DataSet.RecordCount);

    CustomerSQl.active := false;
    CustomerSQl.active := True;

    InvLineSQL.active := false;
    InvLineSQL.parambyname('Show_Zero_Values').AsString := ShowZeroValues;
    InvLineSQL.active := True;

    qryInvCharges.active := false;
    qryInvCharges.active := true;

    InvoiceNumberLbl.Caption := IntToStr(FInvoiceNo);
  end;

  if bPrintLogo then
  begin
    imgReport.Picture := PBImagesFrm.ReportImage.Picture;
    imgReport.Enabled := true;
//    imgISO.Enabled := true;
//    imgDeliveryMan.Enabled := true;
//    imgPayments.Enabled := true;
//    qrlblPayments.Enabled := true;
//    qrmRegOffice.Enabled := true;
//    QRMemoCmpnyNm.Enabled := true;
  end
  else
  begin
    imgReport.Picture := PBImagesFrm.ReportImage.Picture;
    imgReport.Enabled := false;
//    imgISO.Enabled := false;
//    imgDeliveryMan.Enabled := false;
//    imgPayments.Enabled := false;
//    qrlblPayments.Enabled := false;
//    qrmRegOffice.Enabled := false;
//    QRMemoCmpnyNm.Enabled := false;
  end;
end;

procedure TPBRPSalesInvFrm.InvoiceFooterBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  iTotal: Real;
  sGoods, sVat: string;
  iCount: integer;
begin
  if bLineUp then
    Exit;

  PrePayAmount := 0;

  if bInvoice then
  begin
    sGoods := formatfloat('#00.00',InvHeadSRC.Dataset.fieldbyname('Goods_Value').asfloat);
    sVat := formatfloat('#00.00',InvHeadSRC.Dataset.fieldbyname('Vat_Value').asfloat);
    GoodsValueLbl.Caption := FloatToStrF(InvHeadSRC.Dataset.fieldbyname('Goods_Value').asfloat, ffCurrency, 15, 2);
    VatValueLbl.Caption := FloatToStrF(InvHeadSRC.Dataset.fieldbyname('Vat_Value').asfloat, ffCurrency, 15, 2);
    PrePayAmount := strtofloat(sGoods) + strtofloat(sVat);
    TotalValueLbl.Caption := FloatToStrF((strtofloat(sGoods) + strtofloat(sVat)), ffCurrency, 15, 2);
  end
  else
  begin
    sGoods := formatfloat('#00.00',InvHeadSRC.Dataset.fieldbyname('Goods_Value').asfloat);
    sVat := formatfloat('#00.00',InvHeadSRC.Dataset.fieldbyname('Vat_Value').asfloat);
    GoodsValueLbl.Caption := FloatToStrF((InvHeadSRC.Dataset.fieldbyname('Goods_Value').asfloat*-1), ffCurrency, 15, 2);
    VatValueLbl.Caption := FloatToStrF((InvHeadSRC.Dataset.fieldbyname('Vat_Value').asfloat*-1), ffCurrency, 15, 2);
    PrePayAmount := (strtofloat(sGoods) + strtofloat(sVat))*-1;
    TotalValueLbl.Caption := FloatToStrF((strtofloat(sGoods) + strtofloat(sVat))*-1, ffCurrency, 15, 2);
  end;

//  PrintBand := (InvHeadSRC.Dataset.FieldByName('Price_Unit').asinteger <> 0)
end;

procedure TPBRPSalesInvFrm.BuildInvoiceNotes(aQuery: TFDQuery;
  const iNarrative : integer);
var
  aStr : string;
  i: integer;
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
    for i := pred(MemoNotes.Lines.Count) downto 0 do
      RichMemoNotes.Lines.Delete(i);
    MemoNotes.Lines.clear;
    MemoNotes.Lines.Text := aStr;
    RichMemoNotes.Lines.Text := aStr;
  end;
end;

procedure TPBRPSalesInvFrm.BuildPaymentNotes(const iNarrative : integer);
var
  aStr : string;
begin
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
  memPayment.Lines.Clear;
  memPayment.Lines.Text := aStr;
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
    if InvHeadSRC.DataSet.FieldByName('Electronic_Invoice').AsString = 'Y' then
      Parambyname('status').AsInteger := 15
    else
      ParambyName('status').AsInteger := 20;
    ParamByName('Invoice_Date').AsDateTime := StrToDate(InvoiceDateLbl.Caption);
    ParamByName('Sales_Invoice_No').AsString := InvoiceNumberLbl.Caption;
//    ParamByName('Sales_Invoice_No').AsString := IntToStr(FInvoiceNo);
    ExecSQL;
  end;

  {get customer payment details and update with invoice value}
  if (CustomerSQL.FieldByName('Pre_pay_Balance').AsFloat < PrePayAmount) then exit;

  {Downdate Pre_pay_Balance}
  if CustomerSQL.FieldByName('Pre_pay_Balance').AsFloat > 0 then
    begin
      {update the customer pree-pay amount}
      with qryUpCustomer do
        begin
          close;
          parambyname('Customer').asinteger := InvHeadSRC.dataset.FieldByName('Customer').AsInteger;
          parambyname('Invoice_Amount').asfloat := PrePayAmount;
          execsql;
        end;
      {update the invoice payment status}
      with qryUpInvoicePay do
        begin
          close;
          ParamByName('Sales_Invoice').AsInteger := InvHeadSRC.dataset.FieldByName('Sales_Invoice').AsInteger;
          ParamByName('Paid_Status').Asstring := 'Y';
          ParamByName('Cash_Sales').Asstring := 'Y';
          ParamByName('Paid_Amount').Asfloat := PrePayAmount;
          ParamByName('Paid_Date').Asdatetime := StrToDate(InvoiceDateLbl.Caption);
          ParamByName('Payment_Method').Asinteger := 1; {direct debit}
          execsql;
        end;
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
  iQuantity: integer;
  sPriceUnit: string;
begin
  if InvLineSQL.fieldbyname('Sales_Invoice').asinteger = 0 then
    PrintBand := false;

  rUnitPrice := InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat;
  iQuantity := InvLineSRC.Dataset.FieldByName('Qty_Invoiced').Asinteger;
  {Get the associated line description}
  if InvLineSQL.fieldbyname('Purchase_Order').asfloat <> 0 then
    begin
  //    lblProduct.caption := '';
      lblProduct.Enabled := false;
      lblDescription.left := LblProduct.left;
//      lblDescription.width := lblDescription.width + lblProduct.width;
      lblDescription.width := 355;
      lblDescription.caption := GetPOLineDesc(InvLineSQL.fieldbyname('Purchase_Order').asfloat,
                                              InvLineSQL.fieldbyname('Line').asinteger);
(*      lblFormRef.caption := GetFormRefDesc(InvLineSQL.fieldbyname('Purchase_Order').asfloat,
                                              InvLineSQL.fieldbyname('Line').asinteger);
*)      lblPriceUnit.caption := InvLineSQl.Fieldbyname('Sales_unit_Desc').asstring;
    end
  else
  if InvLineSRC.Dataset.fieldbyname('Sales_Order').asinteger <> 0 then
    begin
      if InvLineSRC.Dataset.fieldbyname('Job_Bag').asinteger <> 0 then
        begin
          lblProduct.Enabled := false;
          lblDescription.left := LblProduct.left;
//          lblDescription.width := 225 + lblProduct.width;
          lblDescription.width := 355;
          lblDescription.caption := GetJBLineDesc(InvLineSQL.fieldbyname('Job_Bag').asinteger,
                                              InvLineSQL.fieldbyname('Job_Bag_Line').asinteger);
        end
      else
        begin
          iQuantity := GetSOLineQuantity(InvLineSQL.fieldbyname('Sales_Order').asinteger,
                                              InvLineSQL.fieldbyname('Sales_order_Line_no').asinteger);
          lblProduct.caption := GetSOLineProduct(InvLineSQL.fieldbyname('Sales_Order').asinteger,
                                              InvLineSQL.fieldbyname('Sales_order_Line_no').asinteger);
          lblDescription.caption := GetSOLineDesc(InvLineSQL.fieldbyname('Sales_Order').asinteger,
                                              InvLineSQL.fieldbyname('Sales_order_Line_no').asinteger);
        end;
//      lblFormRef.caption := '';
      sPriceUnit := GetSOLinePUnit(InvLineSQL.fieldbyname('Sales_Order').asinteger,
                                              InvLineSQL.fieldbyname('Sales_order_Line_no').asinteger);
      if sPriceUnit = '' then
        lblPriceUnit.caption := InvLineSQl.Fieldbyname('Sales_unit_Desc').asstring
      else
        begin
          lblPriceUnit.caption := sPriceUnit;
          rUnitPrice := strtoint(sPriceUnit) * rUnitPrice;
        end;
    end
  else
    begin
 //     lblProduct.caption := '';
      lblProduct.Enabled := false;
      lblDescription.left := LblProduct.left;
//          lblDescription.width := 225 + lblProduct.width;
      lblDescription.width := 355;
      lblDescription.caption := GetJBLineDesc(InvLineSQL.fieldbyname('Job_Bag').asinteger,
                                              InvLineSQL.fieldbyname('Job_Bag_Line').asinteger);
//      lblFormRef.caption := '';
      lblPriceUnit.caption := InvLineSQl.Fieldbyname('Sales_unit_Desc').asstring;
    end;

  if not bInvoice then
    begin
    QtyInvoicedLbl.Caption := IntToStr(PosToNegQty(InvLineSRC.Dataset.FieldByName('Qty_Invoiced').Asinteger));
//    GoodsLbl.Caption := formatfloat('0.00',(PosToNegMoney(InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat))) ;
    GoodsLbl.Caption := formatfloat('0.000',(PosToNegMoney(rUnitPrice))) ;
    rGoodsTotal := PosToNegMoney(InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat);
    end
  else
    begin
    if InvHeadSRC.DataSet.FieldByName('Print_as_Delivery_Note').AsString = 'Y' then
      QtyInvoicedLbl.Caption := inttostr(iQuantity)
    else
      QtyInvoicedLbl.Caption := InvLineSRC.Dataset.FieldByName('Qty_Invoiced').Asstring;

//    GoodsLbl.Caption := formatfloat('0.00',(InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat));
    GoodsLbl.Caption := formatfloat('0.000',(rUnitPrice));
    rGoodsTotal := InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat;
    end;

  if InvLineSRC.Dataset.FieldByName('Price_Unit_Factor').AsInteger = 0 then
    rGoodsTotal := rGoodsTotal
  else
    rGoodsTotal := (strtofloat(QtyInvoicedLbl.Caption) /
      InvLineSRC.Dataset.FieldByName('Price_Unit_Factor').AsInteger)
      * rGoodsTotal;

  GoodsTotalLbl.Caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr(rGoodsTotal));
  iGoods := iGoods + StrToFloat(GoodsTotalLbl.Caption);
  if InvLineSRC.Dataset.FieldByName('Vat_Value').AsFloat <> 0.00 then
    begin
      if bInvoice then
        rVatValue := InvLineSRC.Dataset.FieldByName('Vat_Value').AsFloat
      else
        rVatValue := InvLineSRC.Dataset.FieldByName('Vat_Value').AsFloat * -1
    end
  else
    rVatValue := StrToFloat(GoodsTotalLbl.Caption) * (InvLineSRC.Dataset.FieldByName('Vat_Rate').AsFloat / 100);

  ivat := ivat + rVatValue;

  if not bInvoice then
    GoodsVATLbl.Caption := formatfloat('0.00',(rVATValue))
  else
    GoodsVATLbl.Caption := formatfloat('0.00',(rVATValue));

  BuildInvoiceNotes((InvoiceReport.DataSet as TFDQuery),InvoiceReport.DataSet.fieldbyname('Narrative').asinteger);

  if memoNotes.lines.text = '' then
    AddChargesFooter.enabled := false
  else
    AddChargesFooter.enabled := true;

  if lblProduct.Caption = '' then
    begin
      lblDescription.left := 88;
      lblDescription.width := 370;
    end;

  VatPerclbl.caption := formatfloat('0.00',(InvLineSRC.Dataset.FieldByName('Vat_Rate').AsFloat));

  InvoiceLine.height := lblDescription.height + 3;
(*  if trim(lblFormRef.caption) = '' then
    InvoiceLine.height := lblDescription.height + 3
  else
    InvoiceLine.height := lblDescription.height + 5 + lblFormRef.height;
*)
  PrintBand := not (InvLineSRC.Dataset.fieldbyname('Not_Printed').asstring = 'Y');
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
  MySelf := frmpbMainMenu.iOperator;
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

procedure TPBRPSalesInvFrm.UpdateCategoryInvoiceNumber(const iNo : integer);
begin
  if bLineUp then
    Exit;
  with qryCompCat do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company_Category Set Last_Invoice_No = ' + IntToStr(iNo) +
            ' Where Company=1 and Category = ' + inttostr(FCategory));
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

function TPBRPSalesInvFrm.GetLastCategoryInvoiceNo: integer;
begin
  Result := 0;
  if bLineUp then
    Exit;

  with qryCompCat do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select Last_Invoice_No, Suffix_or_Prefix, Suffix_or_Prefix_Value From Company_Category Where Company=1 AND Category = '+inttostr(FCategory));
    Open;
    Result := FieldByName('Last_Invoice_No').AsInteger;

    FSuffix :=  (FieldByName('Suffix_or_Prefix').asstring = 'Suffix');
    FSuffixValue := (FieldByName('Suffix_or_Prefix_Value').asstring);
    Close;
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

procedure TPBRPSalesInvFrm.GetCompanyCategoryInfo(const iNoOfInvoices : integer);
begin
  if bLineUp then
    Exit;

  {Check for Invoice or Credit Note}
  if bInvoice then
    FInvoiceNo := GetLastCategoryInvoiceNo
  else
    FInvoiceNo := GetLastCreditNoteNo;

  if bUpdate then
    {Check for Invoice or Credit Note}
    if bInvoice then
      UpdateCategoryInvoiceNumber(FInvoiceNo + iNoOfInvoices)
    else
      UpdateCreditNoteNumber(FInvoiceNo + iNoOfInvoices);
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

    {not for a purchase order so just get the ordering branch}
    if recordcount = 0 then
      begin
        with CustSQl do
        begin
          Close;
          ParamByName('Customer').AsInteger := InvHeadSrc.dataset.FieldByName('Customer').AsInteger;
          ParamByName('Branch_no').AsInteger := InvHeadSrc.dataset.FieldByName('Branch_no').AsInteger;
          Open;
        end;
        AddressSRC.Dataset := CustSQL;
        exit;
      end;
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
  UseBranchName: boolean;
begin
  {initialise the Goods and VAT values}
  iGoods := 0.00;
  iVat := 0.00;

  CustomerAddMemo.Lines.Clear;

  {Create the Customer Address details memo}
  UseBranchName := CustomerSQL.FieldByName('Use_Branch_Name').AsString = 'Y';

  if UseBranchName then
    CustomerAddMemo.Lines.Add(CustomerSQL.fieldbyname('Branch_Name').AsString)
  else
    CustomerAddMemo.Lines.Add(CustomerSQL.fieldbyname('Customer_Name').AsString);

  for icount := 2 to 6 do
  begin
    if CustomerSQL.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(CustomerSQL.Fields[icount].AsString);
  end;

  lblReference.caption := '';

  FSuffix := false;
  FSuffixValue := '';

  if (not bInvoice) and (trim(InvHeadSRC.Dataset.fieldbyname('Reference').asstring) <> '') then
    lblJobNumber.caption := 'Original Invoice';

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
    if bPreview then
      InvoiceNumberLbl.Caption := 'PREVIEW'
    else
      begin
        if UseSeparateInvoice(InvHeadSRC.Dataset.FieldByName('Category').asinteger) then
          GetCompanyCategoryInfo(1)
        else
          GetCompanyInfo(1);

        Inc(FInvoiceNo);
        if FSuffix then
          InvoiceNumberLbl.Caption := IntToStr(FInvoiceNo) + trim(FSuffixValue)
        else
          InvoiceNumberLbl.Caption := trim(FSuffixValue) + IntToStr(FInvoiceNo);
      end;

    InvoiceDateLbl.Caption := FormatDateTime('dd"/"mm"/"yyyyy',
      InvHeadSRC.Dataset.FieldByName('invoice_date').AsDateTime);
  end;

  {Set the default Payment Terms}
  BuildPaymentNotes(dmBroker.GetCompanyPaymentNotes);
  memDefPayment.lines.Text := memPayment.lines.Text;

  if InvHeadSRC.Dataset.FieldByName('Category').asinteger <> 0 then
    begin
      BuildPaymentNotes(getCategoryPayNotes(InvHeadSRC.Dataset.FieldByName('Category').asinteger))
    end
  else
    memPayment.lines.Text := memDefPayment.lines.Text;

  if trim(memPayment.lines.text) = '' then
    memPayment.lines.Text := memDefPayment.lines.Text;

  {Check whether payment terms are Direct Debit .... if so, clear payment details}
  if DirectDebitCustomer(InvHeadSRC.Dataset.FieldByName('Customer').asinteger) then
    begin
      memPayment.lines.Clear;
      qrshpPayment.enabled := false;
    end
  else
    begin
      if bInvoice then
        qrshpPayment.enabled := true;
    end;

  lblInvoiceDescription.caption := InvHeadSRC.Dataset.Fieldbyname('Invoice_Description').asstring;

  OurJobLbl.Caption := InvHeadSRC.Dataset.FieldByName('Reference').Asstring;

  if trim(InvHeadSRC.Dataset.FieldByName('Cust_Order_No').Asstring) <> '' then
    lblCustOrderNo.caption := InvHeadSRC.Dataset.FieldByName('Cust_Order_No').Asstring
  else
    begin
      if InvHeadSRC.Dataset.FieldByName('Sales_Invoice_type').Asstring = 'S' then
        lblCustOrderNo.caption := GetSOCustOrderNo(InvHeadSRC.Dataset.FieldByName('Reference').Asstring)
      else
      if InvHeadSRC.Dataset.FieldByName('Sales_Invoice_type').Asstring = 'J' then
        lblCustOrderNo.caption := GetJBCustOrderNo(InvHeadSRC.Dataset.FieldByName('Reference').Asstring)
      else
        lblCustOrderNo.caption := GetPOCustOrderNo(InvHeadSRC.Dataset.FieldByName('Reference').Asstring);
    end;

  if qryInvCharges.recordcount = 0 then
    begin
      InvoiceCharges.enabled := false;
    end
  else
    begin
      InvoiceCharges.enabled := true;
    end;

//  qrlblInvoiceNumber.caption := InvoiceNumberLbl.Caption;

  PrintBand := false
end;

function TPBRPSalesInvFrm.DirectDebitCustomer(tempCode: integer): boolean;
begin
  with qryGetCustomerPaymentTerms do
    begin
      close;
      parambyname('Customer').asinteger := tempCode;
      open;

      result := (fieldbyname('Payment_Type').asstring = 'DD');
    end;
end;

function TPBRPSalesInvFrm.GetCategoryPayNotes(tempCode: integer): integer;
begin
  Result := 0;

  with qryCategory do
    begin
      close;
      parambyname('Category').asinteger := tempCode;
      open;

      result := fieldbyname('Payment_Narrative').asinteger;
    end;
end;

function TPBRPSalesInvFrm.UseSeparateInvoice(tempCode: integer): boolean;
begin
  if tempCode = 0 then
    result := false;

  with qryUniqueInv do
    begin
      close;
      parambyname('Category').asinteger := tempCode;
      open;

      result := (fieldbyname('Use_Separate_Invoice_Seq').asstring = 'Y');

      FCategory := fieldbyname('Category').asinteger;
    end;
end;

procedure TPBRPSalesInvFrm.GoodsLblPrint(sender: TObject;
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
//  AddChargesFooter.height := memoNotes.height + 13;
  AddChargesFooter.height := ((richmemoNotes.lines.count) * 23) + 52;
  gtNotesShape.Height := ((richmemoNotes.lines.count) * 23) + 24;

(*  {Set the top property for the pack price details}
  gtlblPackPriceUnit.top := gtNotesShape.top + gtNotesShape.Height + 20;
  gtlblPackPriceVat.top := gtlblPackPriceUnit.top;
  gtlblPackPriceGross.top := gtlblPackPriceUnit.top;
  gtlblPackUnitPrice.top := gtlblPackPriceUnit.top;
  gtlblPackVat.top := gtlblPackPriceUnit.top;
  gtlblPackTotalGross.top := gtlblPackPriceUnit.top;

  {Default the Pack pricing labels to not be visible}
  gtlblPackPriceUnit.enabled := false;
  gtlblPackPriceVat.enabled := false;
  gtlblPackPriceGross.enabled := false;
  gtlblPackUnitPrice.enabled := false;
  gtlblPackVat.enabled := false;
  gtlblPackTotalGross.enabled := false;

  if bInvoice then
  begin
    {Show the Pack Price if selected}
    if (InvHeadSRC.Dataset.FieldByName('Price_Unit').asinteger <> 0) and (dmBroker.UsePackPricing) then
      begin
        gtlblPackPriceUnit.enabled := true;
        gtlblPackPriceVat.enabled := true;
        gtlblPackPriceGross.enabled := true;
        gtlblPackUnitPrice.enabled := true;
        gtlblPackVat.enabled := true;
        gtlblPackTotalGross.enabled := true;

        gtlblPackPriceUnit.caption := 'Total Price ' + InvHeadSRC.Dataset.fieldbyname('Price_Unit_Description').asstring;
        if InvHeadSRC.Dataset.FieldByName('Price_Unit_Factor').asinteger = 0 then
          begin
            gtlblPackUnitPrice.caption := formatfloat('£##,###,##0.00',InvHeadSRC.Dataset.fieldbyname('Goods_Value').asfloat);
            gtlblPackVat.caption := formatfloat('£##,###,##0.00',InvHeadSRC.Dataset.fieldbyname('Vat_Value').asfloat);
            gtlblPackTotalGross.caption := formatfloat('£##,###,##0.00',(InvHeadSRC.Dataset.fieldbyname('Goods_Value').asfloat+InvHeadSRC.Dataset.fieldbyname('Vat_Value').asfloat));
          end
        else
          begin
            gtlblPackUnitPrice.caption := formatfloat('£##,###,##0.00',(InvHeadSRC.Dataset.fieldbyname('Goods_Value').asfloat/(InvHeadSRC.Dataset.fieldbyname('quantity').asinteger/InvHeadSRC.Dataset.fieldbyname('Price_Unit_Factor').asinteger)));
            gtlblPackVat.caption := formatfloat('£##,###,##0.00',(InvHeadSRC.Dataset.fieldbyname('Vat_Value').asfloat/(InvHeadSRC.Dataset.fieldbyname('quantity').asinteger/InvHeadSRC.Dataset.fieldbyname('Price_Unit_Factor').asinteger)));
            gtlblPackTotalGross.caption := formatfloat('£##,###,##0.00',(InvHeadSRC.Dataset.fieldbyname('Goods_Value').asfloat+InvHeadSRC.Dataset.fieldbyname('Vat_Value').asfloat)/(InvHeadSRC.Dataset.fieldbyname('quantity').asinteger/InvHeadSRC.Dataset.fieldbyname('Price_Unit_Factor').asinteger));
          end;
      end;
  end;
*)
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
  lblDescription.width := 225;
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

  if not bInvoice then
    ExtrasVATLbl.Caption := formatfloat('0.00',(PosToNegMoney(rVATValue)))
  else
    ExtrasVATLbl.Caption := formatfloat('0.00',(rVATValue));

  iGoods := iGoods + strtofloat(lblAmount.caption);
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
  if not bInvoice then exit;
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
  if not bInvoice then exit;
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
  if not bInvoice then exit;
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

function TPBRPSalesInvFrm.GetSOLineQuantity(tempCode, tempLine: integer): integer;
begin
  result := 0;
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Quantity_Delivered').asinteger;
    end;
end;

procedure TPBRPSalesInvFrm.GetSODeliveryDetails(tempCode: string);
begin
  with qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := strtoint(trim(tempcode));
      open;
      first;
    end;

  if qrySOHead.FieldByName('Ad_Hoc_Address').AsString <> '' then
  begin
    with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger := qrySOHead.FieldByName('Ad_Hoc_Address').AsInteger;
        Open;
      end;
    AddressSRC.Dataset := AdhocSQL;
  end
  else
  if (qrySOHead.FieldByName('Delivery_Customer').AsString <> '') and
      (qrySOHead.FieldByName('Delivery_Customer').AsString <> '0') then
  begin
    with CustSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger := qrySOHead.FieldByName('Delivery_Customer').AsInteger;
      ParamByName('Branch_no').AsInteger := qrySOHead.FieldByName('Delivery_Branch').AsInteger;
      Open;
      AddressSRC.Dataset := CustSQL;
    end;
//  if head Office department then get head Office address
    if CustSQl.fieldbyname('HO_Department').asinteger = 1 then
      begin
        GetCustHOSQL.Close;
        GetCustHOSQL.ParamByName('Customer').AsInteger := qrySOHead.FieldByName('Delivery_Customer').AsInteger;
        GetCustHOSQL.ParamByName('Branch_no').AsInteger := qrySOHead.FieldByName('Delivery_Branch').AsInteger;
        GetCustHOSQL.Open;
        AddressSRC.Dataset := GetCustHOSQL;
      end;
  end
end;

procedure TPBRPSalesInvFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GoodsValueLbl.Caption := '';
  VatValueLbl.Caption := '';
  TotalValueLbl.Caption := 'Page to Follow';
//  lblReference.caption := '';
end;

procedure TPBRPSalesInvFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
icount: integer;
begin
  BranchAddMemo.Lines.Clear;

  {Get Delivery Details}
  if InvHeadSRC.Dataset.FieldByName('Sales_Invoice_type').Asstring = 'S' then
    begin
      if InvHeadSRC.Dataset.FieldByName('Invoice_or_Credit').Asstring = 'C' then
        GetSODeliveryDetails(InvLineSQL.fieldbyname('Sales_Order').asstring)
      else
        GetSODeliveryDetails(InvHeadSRC.Dataset.FieldByName('Reference').Asstring)
    end
  else
    GetDetails;

  {Create the Branch Address details memo}
  for icount := 0 to 5 do
  begin
    if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
    BranchAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
  end;
end;

procedure TPBRPSalesInvFrm.InvoiceHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ivat := 0.00;
  PrintBand := false;
end;

procedure TPBRPSalesInvFrm.FormCreate(Sender: TObject);
begin
  bPrintLogo := true;
end;

procedure TPBRPSalesInvFrm.SetPrePayAmount(const Value: double);
begin
  FPrePayAmount := Value;
end;

end.
