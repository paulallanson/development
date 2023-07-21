unit wtRPSalesInvoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, DB, ExtCtrls, AllCommon, Math,
  QrExport, qrprntr, printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPSalesInvoice = class(TForm)
    InvoiceReport: TQuickRep;
    InvHeadSRC: TDataSource;
    InvLineSQL: TFDQuery;
    InvLineSRC: TDataSource;
    InvoiceFooter: TQRBand;
    qryComp: TFDQuery;
    qrsdQElements: TQRSubDetail;
    qrsdQEdges: TQRSubDetail;
    qrsdQExtras: TQRSubDetail;
    qrsdQCutOuts: TQRSubDetail;
    UpInvHeadSQL: TFDQuery;
    UpInvLineSQL: TFDQuery;
    NotesSQL: TFDQuery;
    InvoiceGroupHeader: TQRGroup;
    VatTotalLbl: TQRLabel;
    Dummy06: TQRLabel;
    CreditHeadSQL: TFDQuery;
    QtyInvoicedLbl: TQRLabel;
    GetNarrSQL: TFDQuery;
    AddChargesFooter: TQRBand;
    memoNotes: TQRMemo;
    lblDescription: TQRLabel;
    qrySOLine: TFDQuery;
    InvoiceLine: TQRSubDetail;
    qrySOHead: TFDQuery;
    QRBand1: TQRBand;
    CustomerAddMemo: TQRMemo;
    InvoiceNumberLbl: TQRLabel;
    InvoiceDateLbl: TQRLabel;
    lblCustOrderNo: TQRLabel;
    QRBand2: TQRBand;
    GoodsValueLbl: TQRLabel;
    VATValueLbl: TQRLabel;
    lblReference: TQRLabel;
    qrySIHead: TFDQuery;
    CustomerSQL: TFDQuery;
    qryAddress: TFDQuery;
    qrlblInvoice: TQRLabel;
    qrlblCompanyName: TQRLabel;
    QRShape1: TQRShape;
    qrlblInvoiceLabel: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    GoodsLbl: TQRLabel;
    qrlblVatReg: TQRLabel;
    qryCompanyAddress: TFDQuery;
    memAddress: TQRRichText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape9: TQRShape;
    qrLoopB: TQRLoopBand;
    qrlblAccountCode: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRShape2: TQRShape;
    gtQRShape3: TQRShape;
    gtQRShape4: TQRShape;
    qrlblDepositPaid: TQRLabel;
    DepositLbl: TQRLabel;
    TotalValueLbl: TQRLabel;
    qrlblInvoiceTotal: TQRLabel;
    qrshpPayment: TQRShape;
    memPayment: TQRMemo;
    gtQRShape5: TQRShape;
    qrlblToPay: TQRLabel;
    ToPayLbl: TQRLabel;
    lblWorktopSize: TQRLabel;
    lblWorktopArea: TQRLabel;
    qryQCutOuts: TFDQuery;
    qryQEdges: TFDQuery;
    qryQExtras: TFDQuery;
    qrlblQuantity: TQRLabel;
    qrlblLength: TQRLabel;
    qrlblExtraQuantity: TQRDBText;
    qrlblCutOut: TQRLabel;
    qrlblEdgeDescription: TQRLabel;
    qrlblExtraDescription: TQRLabel;
    qryQElements: TFDQuery;
    qrlblPaymentTerms: TQRLabel;
    InvOneHeadSQL: TFDQuery;
    InvRHeadSQL: TFDQuery;
    InvHeadSQL: TFDQuery;
    qriHeadLogo: TQRImage;
    qryQLabour: TFDQuery;
    qrsdQLabour: TQRSubDetail;
    qrlblLabourVAT: TQRLabel;
    qrlblLabourUTR: TQRLabel;
    qrlblLabourCharge: TQRLabel;
    qryGetReverseCharge: TFDQuery;
    qrlblReverseCharge: TQRLabel;
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
    procedure VatTotalLblPrint(sender: TObject; var Value: String);
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
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InvoiceLineAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure AddChargesFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure lblDescriptionPrint(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure qrsdQElementsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQCutOutsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQExtrasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdQLabourBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FInvoiceNo : integer;
    FLoops: integer;
    FLines: integer;
    rReverseChargeVatRate: real;
    sReverseChargeText: string;
    sWorktop: string;
    sUTR: string;
    procedure GetSODeliveryDetails(tempCode: string);
    function GetSOCustOrderNo(tempCode: string): string;
    function GetSOLineDesc(tempCode: integer; tempLine: integer): string;
    function GetSOLineProduct(tempCode: integer; tempLine: integer): string;
    function GetSOLinePUnit(tempCode: integer; tempLine: integer): string;
    procedure GetCompanyInfo(const iNoOfInvoices : integer);
    procedure LockCompanyRecord;
    procedure FreeCompanyRecord;
    function  GetLastInvoiceNo : integer;
    function  GetLastCreditNoteNo : integer;
    procedure UpdateInvoiceNumber(const iNo : integer);
    procedure UpdateCreditNoteNumber(const iNo : integer);
    procedure BuildInvoiceNotes(aQuery : TFDQuery; const iNarrative : integer);
    function GetSIReference(tempCode: string): string;
    function GetSIType(tempCode: string): string;
    procedure GetAddressDetails(tempCode: integer);
    procedure BuildPaymentNotes(const iNarrative: integer);
  public
    bInvoice: boolean;
    bDetailed: boolean;
    bUpdate: boolean;
    bReprint: boolean;
    bShowLabour: boolean;
    bAll: boolean;
    bLineUp : Boolean;
    bReverseCharge: boolean;
    SelCode: Integer;
    function GetInvoiceData: integer;
  end;

var
  frmWTRPSalesInvoice: TfrmWTRPSalesInvoice;

implementation

uses wtMain, wtDataModule;

var
  iGoods, iVAT: Real;

{$R *.DFM}

procedure TfrmWTRPSalesInvoice.InvoiceReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
  icount: integer;
  TempAddress: string;
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
      qrlblInvoice.caption := 'CREDIT NOTE';
      qrlblInvoiceLabel.Caption := 'Credit No.';
      qrlblInvoiceTotal.Caption := 'Credit Total';
      qrlblDepositPaid.enabled := false;
      DepositLbl.enabled := false;
      qrlblToPay.enabled := false;
      ToPayLbl.enabled := false;
      memPayment.Enabled := False;
      qrshpPayment.Enabled := False;
    end
  else
    begin
      qrlblInvoice.caption := 'INVOICE';
      qrlblInvoiceLabel.Caption := 'Invoice No.';
      qrlblInvoiceTotal.Caption := 'Invoice Total';
      qrlblDepositPaid.Enabled := true;
      DepositLbl.enabled := true;
      qrlblToPay.enabled := true;
      ToPayLbl.enabled := true;
    end;

  InvoiceGroupHeader.Height := 0;

  if bDetailed then
    begin
      qrsdQElements.enabled := true;
      qrsdQCutOuts.enabled := true;
      qrsdQEdges.enabled := true;
      qrsdQExtras.enabled := true;
    end;

  if bLineUp then
  begin
    InvoiceReport.OnNeedData := InvoiceReportNeedData;
    InvoiceReport.DataSet := nil;
  end
  else
  begin
    InvoiceReport.OnNeedData := nil;
    Dummy06.Enabled := false;
    GetCompanyInfo(InvoiceReport.DataSet.RecordCount);

    CustomerSQl.active := True;
    InvLineSQL.active := True;

    InvoiceNumberLbl.Caption := IntToStr(FInvoiceNo);
  end;

  tempAddress := '';

  with qryCompanyAddress do
    begin
      close;
      open;
    end;

//  qrlblCompanyName.caption := qryCompanyAddress.fieldbyname('Company_Name').asstring;
  qrlblCompanyName.caption := '';

  qrlblVATReg.caption := 'VAT Registration No. ' + qryCompanyAddress.fieldbyname('VAT_Number').asstring;

  for icount := 0 to 4 do
  begin
    if qryCompanyAddress.Fields[icount].AsString = '' then Continue;
    tempAddress := tempAddress + ', ' + qryCompanyAddress.Fields[icount].AsString;
  end;

  memAddress.lines.clear;
  
  tempAddress := tempAddress + #13#10;

  tempAddress := tempAddress + 'Telephone  ' + qryCompanyAddress.Fields[5].AsString;
  tempAddress := tempAddress + '  Fax  ' + qryCompanyAddress.Fields[6].AsString;

  tempAddress := trim(StringReplace(tempAddress,',','',[]));
  memAddress.lines.add(tempAddress);
end;

procedure TfrmWTRPSalesInvoice.InvoiceFooterBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  iTotal, iDeposit, iToPay: Real;
  rVatValue: real;
begin
  if bInvoice then
    begin
      if InvHeadSRC.DataSet.fieldbyname('Payment_Terms_Description').asstring <> '' then
        qrlblPaymentTerms.Caption := 'Payment Terms: ' + InvHeadSRC.DataSet.fieldbyname('Payment_Terms_Description').asstring
      else
        qrlblPaymentTerms.Caption := '';
    end
  else
    qrlblPaymentTerms.Caption := '';

  lblReference.caption := '';

  if (not bInvoice) and (trim(InvHeadSRC.Dataset.FieldByName('Reference').asstring) <> '') then
    lblReference.caption := 'Original Invoice Number: '+InvHeadSRC.Dataset.FieldByName('Reference').asstring;

  iDeposit := InvHeadSRC.Dataset.FieldByName('Deposit_Amount').asfloat;

  DepositLbl.Caption := formatfloat('0.00', iDeposit);
  GoodsValueLbl.Caption := formatfloat('0.00', iGoods);
  VatValueLbl.Caption := formatfloat('0.00', ivat);

  itotal := strtofloat(GoodsValueLbl.Caption) + strtofloat(VatValueLbl.Caption);
  TotalValueLbl.Caption := formatfloat('0.00', iTotal);

  iToPay := iTotal - iDeposit;
  ToPayLbl.Caption := formatfloat('0.00', iToPay);

  qrlblReverseCharge.enabled := bReverseCharge;
  qrlblReverseCharge.caption := sReverseChargeText;

  rVatValue := (iGoods * (rReverseChargeVatRate/100));
  qrlblReverseCharge.caption := stringreplace(qrlblReverseCharge.caption, '<Vat Rate>', formatfloat('0.00%', rReverseChargeVatRate), [rfIgnoreCase]);
  qrlblReverseCharge.caption := stringreplace(qrlblReverseCharge.caption, '<Vat Value>', formatfloat('£0.00', rVatValue), [rfIgnoreCase]);
  PrintBand := bReverseCharge;
end;

procedure TfrmWTRPSalesInvoice.BuildInvoiceNotes(aQuery: TFDQuery;
  const iNarrative : integer);
var
  aStr : string;
begin
  with aQuery do
  begin  {If any notes then get then}
    if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Notes_Code').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Notes_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Notes_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
    MemoNotes.Lines.Clear;
    MemoNotes.Lines.Text := aStr;
  end;
end;

procedure TfrmWTRPSalesInvoice.InvoiceFooterAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
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

function TfrmWTRPSalesInvoice.GetInvoiceData: integer;
begin
  if bLineUp or (not bAll) then
  begin
    InvOneHeadSQL.Close;
    InvOneHeadSQL.ParamByName('Sales_Invoice').AsInteger := selcode;
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
  result := invoiceReport.Dataset.recordcount;
end;

procedure TfrmWTRPSalesInvoice.InvoiceLineBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rGoodsTotal, rVatValue, rFittingValue, rFittingVat: Real;
  sPriceUnit: string;
begin
  if bLineUp then
    Exit;

  qrLoopB.PrintCount := qrLoopB.PrintCount - 1;
  
  sWorktop := '';
  
  rFittingValue := 0.00;

  if bDetailed then
    begin
      with qryQElements do
        begin
          close;
          open;
          qrsdQElements.Enabled := (recordcount > 0)
        end;
      with qryQCutOuts do
        begin
          close;
          open;
          qrsdQCutOuts.Enabled := (recordcount > 0)
        end;
      with qryQEdges do
        begin
          close;
          open;
          qrsdQEdges.Enabled := (recordcount > 0)
        end;
      with qryQExtras do
        begin
          close;
          open;
          qrsdQExtras.Enabled := (recordcount > 0)
        end;

      if bShowLabour then
        begin
          with qryQLabour do
            begin
              close;
              parambyname('Sales_Order').asinteger := InvLineSRC.Dataset.FieldByName('Sales_Order').Asinteger;
              parambyname('Sales_Order_Line_no').asinteger := InvLineSRC.Dataset.FieldByName('Sales_Order_Line_no').Asinteger;
              open;
              rFittingValue := fieldbyname('Installation_price').asfloat
            end;

          qrlblLabourCharge.Caption := formatfloat('0.00', rFittingValue);
          rFittingVat := StrToFloat(qrlblLabourCharge.Caption) * (InvLineSRC.Dataset.FieldByName('Vat_Rate').AsFloat / 100);
          qrlblLabourVAT.Caption := formatfloat('0.00', rFittingVat);
        end;
    end;

  rGoodsTotal := (InvLineSRC.Dataset.FieldByName('Quantity_Invoiced').Asinteger/InvLineSRC.Dataset.fieldbyname('Sell_unit').asinteger)
                * (InvLineSRC.Dataset.FieldByName('Unit_Price').AsFloat - rFittingValue);

  {Get the associated line description}
  lblDescription.caption := InvLineSRC.Dataset.FieldByName('Description').Asstring;
  sPriceUnit := InvLineSRC.Dataset.fieldbyname('Sell_unit').asstring;

  if not bInvoice then
    begin
      QtyInvoicedLbl.Caption := IntToStr(PosToNegQty(InvLineSRC.Dataset.FieldByName('Quantity_Invoiced').Asinteger));
      GoodsLbl.Caption := formatfloat('0.00',(rGoodsTotal)) ;
    end
  else
    begin
      QtyInvoicedLbl.Caption := InvLineSRC.Dataset.FieldByName('Quantity_Invoiced').Asstring;
      GoodsLbl.Caption := formatfloat('0.00',(rGoodsTotal));
    end;

  rGoodsTotal := (strtofloat(QtyInvoicedLbl.Caption) /
      InvLineSRC.Dataset.FieldByName('Sell_Unit').AsInteger)
      * rGoodsTotal;

  iGoods := iGoods + StrToFloat(GoodsLbl.Caption);

  if InvLineSRC.Dataset.FieldByName('Vat_Value').AsFloat <> 0.00 then
    begin
      if bInvoice then
        rVatValue := InvLineSRC.Dataset.FieldByName('Vat_Value').AsFloat
      else
        rVatValue := InvLineSRC.Dataset.FieldByName('Vat_Value').AsFloat * -1
    end
  else
    rVatValue := StrToFloat(GoodsLbl.Caption) * (InvLineSRC.Dataset.FieldByName('Vat_Rate').AsFloat / 100);

  VatTotalLbl.Caption := formatfloat('0.00', rVatValue);

  ivat := ivat + rVatValue;

  BuildInvoiceNotes((InvoiceReport.DataSet as TFDQuery),InvoiceReport.DataSet.fieldbyname('Notes').asinteger);

  if memoNotes.lines.text = '' then
    AddChargesFooter.enabled := false
  else
    AddChargesFooter.enabled := true;
end;

procedure TfrmWTRPSalesInvoice.FreeCompanyRecord;
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

procedure TfrmWTRPSalesInvoice.LockCompanyRecord;
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
  MySelf := frmwtMain.Operator;
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

procedure TfrmWTRPSalesInvoice.UpdateInvoiceNumber(const iNo : integer);
begin
  if bLineUp then
    Exit;
  with qryComp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set Last_Invoice_Number = ' + IntToStr(iNo) +
            ' Where Company=1');
    ExecSQL;
  end;
end;

procedure TfrmWTRPSalesInvoice.UpdateCreditNoteNumber(const iNo : integer);
begin
  if bLineUp then
    Exit;
  with qryComp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set Last_Credit_Note_Number = ' + IntToStr(iNo) +
            ' Where Company=1');
    ExecSQL;
  end;
end;

function TfrmWTRPSalesInvoice.GetLastInvoiceNo: integer;
begin
  Result := 0;
  if bLineUp then
    Exit;
  with qryComp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select Last_Invoice_Number From Company Where Company=1');
    Open;
    Result := FieldByName('Last_Invoice_Number').AsInteger;
    Close;
  end;
end;

function TfrmWTRPSalesInvoice.GetLastCreditNoteNo: integer;
begin
  Result := 0;
  if bLineUp then
    Exit;
  with qryComp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select Last_Credit_Note_Number From Company Where Company=1');
    Open;
    Result := FieldByName('Last_Credit_Note_Number').AsInteger;
    Close;
  end;
end;

procedure TfrmWTRPSalesInvoice.GetCompanyInfo(const iNoOfInvoices : integer);
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

procedure TfrmWTRPSalesInvoice.CustAccountPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'XXXXXXXXXX';
end;

procedure TfrmWTRPSalesInvoice.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'XXXXXXXXXX';
end;

procedure TfrmWTRPSalesInvoice.OurJobLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'XXXXXXXXXX';
end;

procedure TfrmWTRPSalesInvoice.InvoiceDateLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'DD/MM/YYYY';
end;

procedure TfrmWTRPSalesInvoice.InvoiceNumberLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNNNNN/NN';
end;

procedure TfrmWTRPSalesInvoice.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
end;

procedure TfrmWTRPSalesInvoice.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'PER NNNN';
end;

procedure TfrmWTRPSalesInvoice.VatTotalLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNNN.NN';
end;

procedure TfrmWTRPSalesInvoice.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'XXXXXXXXXXXXXXXXXXXXXXXX';
end;

procedure TfrmWTRPSalesInvoice.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNN.NN';
end;

procedure TfrmWTRPSalesInvoice.GoodsValueLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNNN.NN';
end;

procedure TfrmWTRPSalesInvoice.VATValueLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNN.NN';
end;

procedure TfrmWTRPSalesInvoice.TotalValueLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNNN.NN';
end;

procedure TfrmWTRPSalesInvoice.InvoiceGroupHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  icount: Integer;
  sInvType: string;
  JobReference: string;
begin
  if bLineUp then
    Exit;
  {initialise the Goods and VAT values}
  iGoods := 0.00;
  iVat := 0.00;

  FLines := 0;

  bReverseCharge := false;
  sReverseChargeText := '';
  qrlblReverseCharge.Caption := '';

  with qryGetReverseCharge do
    begin
      close;
      parambyname('sales_invoice').asinteger := InvHeadSRC.DataSet.fieldbyname('Sales_invoice').asinteger;
      open;
      bReverseCharge := (FieldByName('Reverse_Charge').Asstring = 'Y');
      sReverseChargeText := FieldByName('Invoice_Text').Asstring;
      rReverseChargeVatRate := FieldByName('Reverse_Charge_Vat_Rate').Asfloat;
    end;

//  qrlblVatAmountLabel.Enabled := not bReverseCharge;
//  VatTotallbl.Enabled := not bReverseCharge;
//  qrlblLabourVat.enabled := not bReverseCharge;

  CustomerAddMemo.Lines.Clear;
//  BranchAddMemo.Lines.Clear;

  {Get Delivery Details}
  if bInvoice then
   GetSODeliveryDetails(InvHeadSRC.Dataset.FieldByName('Reference').Asstring);

(*  {Create the Delivery Address details memo}
  for icount := 1 to 5 do
  begin
    if qryAddress.Fields[icount].AsString = '' then Continue;
    BranchAddMemo.Lines.Add(qryAddress.Fields[icount].AsString);
  end;
*)
  bShowLabour := (InvHeadSRC.DataSet.fieldbyname('Separate_Labour_Invoice_Value').asstring = 'Y') AND bInvoice;
  qrsdQLabour.Enabled := bShowLabour and bDetailed;

  qrlblAccountCode.Caption := InvHeadSRC.DataSet.fieldbyname('Account_Code').asstring;
  {Create the Customer Address details memo}
  if InvHeadSRC.DataSet.fieldbyname('Is_Retail_Customer').AsString = 'Y' then
    begin
      GetAddressDetails(InvHeadSRC.DataSet.fieldbyname('Invoice_Address').asinteger);
      for icount := 0 to 5 do
        begin
          if qryAddress.Fields[icount].AsString = '' then Continue;
            CustomerAddMemo.Lines.Add(qryAddress.Fields[icount].AsString);
        end
    end
  else
    begin
      for icount := 1 to 6 do
        begin
          if CustomerSQL.Fields[icount].AsString = '' then Continue;
            CustomerAddMemo.Lines.Add(CustomerSQL.Fields[icount].AsString);
        end
    end;

  {Find the Next Invoice Number}
  if bReprint then
  begin
    InvoiceNumberLbl.Caption :=
      InvHeadSRC.Dataset.FieldByName('invoice_no').AsString;
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

  {Show Payemnt details}
  memPayment.Lines.clear;
  
  if InvHeadSRC.DataSet.fieldbyname('Is_Retail_Customer').AsString = 'Y' then
    BuildPaymentNotes(dtmdlWorktops.GetRetailPaymentNotes);

  if memPayment.lines.text = '' then
    BuildPaymentNotes(dtmdlWorktops.GetCompanyPaymentNotes);

  if trim(memPayment.lines.text) = '' then
    begin
      memPayment.enabled := false;
      qrshpPayment.enabled := false;
    end
  else
    begin
      memPayment.enabled := true;
      qrshpPayment.enabled := true;
    end;

  if bInvoice then
    begin
//      OurJobLbl.Caption := InvHeadSRC.Dataset.FieldByName('Reference').Asstring;

      lblCustOrderNo.caption := GetSOCustOrderNo(InvHeadSRC.Dataset.FieldByName('Reference').Asstring)
    end
  else
    begin
      JobReference := GetSIReference(InvHeadSRC.Dataset.FieldByName('Reference').AsString);
//      sInvType := GetSIType(InvHeadSRC.Dataset.FieldByName('Reference').Asstring);
      lblCustOrderNo.caption := GetSOCustOrderNo(JobReference);
      qrlblInvoice.font.color := clRed;
      qrlblInvoice.font.size := 26;
    end;

//  InvoiceFooter.Height := 0;
  qrLoopB.PrintCount := 0;
end;

procedure TfrmWTRPSalesInvoice.GetAddressDetails(tempCode: integer);
begin
  with qryAddress do
    begin
      close;
      parambyname('Address').asinteger := tempCode;
      open;
    end;
end;

procedure TfrmWTRPSalesInvoice.GoodsLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNN.NN';
end;

procedure TfrmWTRPSalesInvoice.QtyInvoicedLblPrint(sender: TObject;
  var Value: String);
begin
  if bLineUp then
    Value := 'NNNNNNNN';
end;

procedure TfrmWTRPSalesInvoice.AddChargesFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  AddChargesFooter.height := memoNotes.height + 13;
//  qrshpLeft.Height := AddChargesFooter.height;
//  qrshpRight.Height := AddChargesFooter.height;
//  qrshp1.Height := AddChargesFooter.height;
//  qrshp2.Height := AddChargesFooter.height;

  qrLoopB.PrintCount := qrLoopB.PrintCount - (AddChargesFooter.height div 29);
end;

procedure TfrmWTRPSalesInvoice.InvoiceReportNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  if FLoops > 0 then
    MoreData := false
  else
    MoreData := true;
  Inc(FLoops);
end;

function TfrmWTRPSalesInvoice.GetSOLineDesc(tempCode, tempLine: integer): string;
begin
  result := '';
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

function TfrmWTRPSalesInvoice.GetSOLinePUnit(tempCode: integer;
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

function TfrmWTRPSalesInvoice.GetSOCustOrderNo(tempCode: string): string;
begin
  result := '';
  with qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := strtoint(trim(tempcode));
      open;
      result := fieldbyname('Order_Ref_no').asstring;
    end;
end;

function TfrmWTRPSalesInvoice.GetSOLineProduct(tempCode,
  tempLine: integer): string;
begin
  result := '';
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Product_Code').asstring;
    end;
end;

procedure TfrmWTRPSalesInvoice.GetSODeliveryDetails(tempCode: string);
begin
  with qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := strtoint(trim(tempcode));
      open;
      first;
    end;
  with qryAddress do
    begin
      close;
      parambyname('Address').asinteger := qrySOHead.fieldbyname('install_Address').asinteger;
      open;
    end;

end;

procedure TfrmWTRPSalesInvoice.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GoodsValueLbl.Caption := '';
  VatValueLbl.Caption := '';
  TotalValueLbl.Caption := 'Page to Follow';
  lblReference.caption := '';
  DepositLbl.caption := '';
  ToPayLbl.caption := '';
end;

function TfrmWTRPSalesInvoice.GetSIReference(tempCode: string): string;
begin
  result := '';
  with qrySIHead do
    begin
      close;
      parambyname('Invoice_no').asstring := tempcode;
      open;
      result := fieldbyname('Reference').asstring;
    end;
end;

function TfrmWTRPSalesInvoice.GetSIType(tempCode: string): string;
begin
  result := '';
  with qrySIHead do
    begin
      close;
      parambyname('Invoice_no').asstring := tempcode;
      open;
      result := fieldbyname('Sales_invoice_type').asstring;
    end;
end;

procedure TfrmWTRPSalesInvoice.InvoiceLineAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inc(FLines);
  qrLoopB.PrintCount := qrLoopB.PrintCount - (InvoiceLine.Height div 29);
end;

procedure TfrmWTRPSalesInvoice.AddChargesFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  qrLoopB.PrintCount := qrLoopB.PrintCount - (AddChargesfooter.Height div 29);
end;

procedure TfrmWTRPSalesInvoice.lblDescriptionPrint(sender: TObject;
  var Value: String);
begin
  InvoiceLine.height := lblDescription.height + 10;
end;

procedure TfrmWTRPSalesInvoice.FormCreate(Sender: TObject);
var
  LocalDir: string;
begin
  try
    LocalDir := extractfilepath(application.exename);
    qriHeadlogo.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
//    qriFootlogo.picture.loadfromfile(LocalDir+'wtFootLogo.bmp');
    qriHeadLogo.Picture.Bitmap.PixelFormat := pfDevice;
  except
  end;
end;

procedure TfrmWTRPSalesInvoice.BuildPaymentNotes(const iNarrative : integer);
var
  aStr : string;
begin
  if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Notes_Code').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Notes_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Notes_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
  memPayment.Lines.Clear;
  memPayment.Lines.Text := aStr;
end;


procedure TfrmWTRPSalesInvoice.qrsdQElementsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rArea, rUnitPrice, rTotalPrice: real;
  sUpstand, sDescription: string;
begin
  lblWorktopSize.caption := '';
  lblWorktopArea.caption := '';

  if qryQElements.fieldbyname('Description').asstring <> sWorktop then
    begin
      sWorktop := qryQElements.fieldbyname('Description').asstring;
      sDescription := qryQElements.fieldbyname('Thickness_mm').asstring + ' ' +
                      qryQElements.fieldbyname('Description').asstring;
    end
  else
    sDescription := '';

  if qryQElements.fieldbyname('Element_number').asinteger > 1000 then
    begin
      if qryQElements.fieldbyname('Use_Description').asstring <> '' then
        begin
          if qryQElements.fieldbyname('Upstand_Polish_Price').asfloat <> 0 then
            sUpstand := '(Polished ' + qryQElements.fieldbyname('Use_Description').asstring + ') '
          else
            sUpstand := '(' + qryQElements.fieldbyname('Use_Description').asstring + ') '
        end
      else
        begin
          if qryQElements.fieldbyname('Upstand_Polish_Price').asfloat <> 0 then
            sUpstand := ' (Polished Upstand) '
          else
            sUpstand := ' (Upstand) ';
        end;
    end
  else
    sUpstand := ' ';

  lblWorktopSize.caption := sDescription + sUpstand +
                            qryQElements.fieldbyname('Length').asstring + ' x ' +
                            qryQElements.fieldbyname('Depth').asstring + ' x ' +
                            qryQElements.fieldbyname('Quantity').asstring;
  rArea :=  ((qryQElements.fieldbyname('Length').asinteger *
            qryQElements.fieldbyname('Depth').asinteger *
            qryQElements.fieldbyname('Quantity').asinteger)/1000000);
  lblWorktopArea.caption := formatfloat('0.00',rArea) + ' ' + 'm2';

  rUnitPrice := qryQElements.fieldbyname('Unit_Price').asinteger;
  rTotalPrice := rUnitPrice * rArea;
//  lblWorktopTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmWTRPSalesInvoice.qrsdQCutOutsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblQuantity.caption := qryQCutOuts.fieldbyname('Quantity').asstring + ' ' + 'No.';
  qrlblCutOut.caption := qryQCutOuts.fieldbyname('Description').asstring;

  rUnitPrice := qryQCutOuts.fieldbyname('Unit_Price').asinteger;
  rTotalPrice := rUnitPrice * qryQCutOuts.fieldbyname('Quantity').asinteger;
//  lblCutOutTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmWTRPSalesInvoice.qrsdQEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblEdgeDescription.caption := qryQEdges.fieldbyname('Description').asstring;
  qrlblLength.caption := formatfloat('0.0',(qryQEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';

  rUnitPrice := qryQEdges.fieldbyname('Unit_Price').asinteger;
  rTotalPrice := rUnitPrice * (qryQEdges.fieldbyname('Length').asfloat/1000);
//  lblEdgeTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmWTRPSalesInvoice.qrsdQExtrasBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rUnitPrice, rTotalPrice: real;
begin
  qrlblExtraDescription.caption := qryQExtras.fieldbyname('Description').asstring;

  rUnitPrice := qryQExtras.fieldbyname('Unit_Price').asinteger;
  rTotalPrice := rUnitPrice * (qryQExtras.fieldbyname('Quantity').asfloat);
//  lblExtraTotal.caption := formatfloat('##0.00',rTotalPrice);
end;

procedure TfrmWTRPSalesInvoice.qrsdQLabourBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iGoods := iGoods + StrToFloat(qrlblLabourCharge.Caption);
  ivat := ivat + StrToFloat(qrlblLabourVAT.Caption);
end;

end.
