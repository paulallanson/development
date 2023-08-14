unit PBRPSalesInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, DB, ExtCtrls, CCSPrint,
  CCSCommon, PBPOObjects, qrprntr, printers, PBDatabase,
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
    Dummy03: TQRLabel;
    Dummy05: TQRLabel;
    Dummy06: TQRLabel;
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
    GoodsVatLbl: TQRLabel;
    lblDescription: TQRLabel;
    qryPOLine: TFDQuery;
    qrySOLine: TFDQuery;
    qryJBLine: TFDQuery;
    qryInvCharges: TFDQuery;
    lblPriceUnit: TQRLabel;
    InvoiceLine: TQRSubDetail;
    qryJBHead: TFDQuery;
    qrySOHead: TFDQuery;
    qrySIHead: TFDQuery;
    chldbndFormRef: TQRChildBand;
    lblFormRef: TQRLabel;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    InvoiceNumberLbl: TQRLabel;
    InvoiceDateLbl: TQRLabel;
    OurJobLbl: TQRLabel;
    lblCustOrderNo: TQRLabel;
    CustAccount: TQRDBText;
    QRLabel10: TQRLabel;
    CustomerAddMemo: TQRMemo;
    qrlblQuantity: TQRLabel;
    qrlblDescription: TQRLabel;
    qrlblUniTSize: TQRLabel;
    qrlblUnitPrice: TQRLabel;
    qrlblValue: TQRLabel;
    qrlblVat: TQRLabel;
    QRBand2: TQRBand;
    qrlblTotalGoods: TQRLabel;
    GoodsValueLbl: TQRLabel;
    VATValueLbl: TQRLabel;
    qrlblTotalVat: TQRLabel;
    qrlblInvoiceTotal: TQRLabel;
    TotalValueLbl: TQRLabel;
    lblReference: TQRLabel;
    imgReport: TQRImage;
    gtQRShape2: TQRShape;
    gtQRShape1: TQRShape;
    gtQRShape4: TQRShape;
    gtQRShape5: TQRShape;
    gtQRShape3: TQRShape;
    qrshpPaymentNotes: TQRShape;
    qrHeadersShape: TQRShape;
    qrFootShape: TQRShape;
    gtQRShape9: TQRShape;
    gtQRShape10: TQRShape;
    gtQRShape11: TQRShape;
    qrHeadShape: TQRShape;
    gtQRShape13: TQRShape;
    gtQRShape14: TQRShape;
    gtQRShape15: TQRShape;
    qrlblInvoiceNo: TQRLabel;
    qrlblInvoiceDate: TQRLabel;
    qrlblJobNumber: TQRLabel;
    qrlblOrdernumber: TQRLabel;
    memPayment: TQRMemo;
    qrlblCompanyReg: TQRMemo;
    qryInvLineCharges: TFDQuery;
    LineCharges: TQRSubDetail;
    qrlblDetails: TQRLabel;
    qrlblAmount: TQRLabel;
    qrlblExtrasVat: TQRLabel;
    AddChargesFooter: TQRChildBand;
    qrlblCompanyPort: TQRMemo;
    qrlblVatNo: TQRLabel;
    memoNotes: TQRMemo;
    qrlblPaymentTerms: TQRLabel;
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
    procedure InvoiceReportNeedData(Sender: TObject;
      var MoreData: Boolean);
    procedure InvoiceLineAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure LineChargesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure AddChargesFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FInvoiceNo : integer;
    FLoops: integer;
    sVersion: string;
    function GetPOCustOrderNo(tempCode: string): string;
    function GetSOCustOrderNo(tempCode: string): string;
    function GetJBCustOrderNo(tempCode: string): string;
    function GetFormRefDesc(tempCode: real; tempLine: integer): string;
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
    function GetSIReference(tempCode: string): string;
    function GetSIType(tempCode: string): string;
    procedure BuildPaymentNotes(const iNarrative: integer);
  public
    bCustomerIsReseller: boolean;
    bInvoice: boolean;
    bUpdate: boolean;
    bReprint: boolean;
    bPreview: boolean;
    bPrintLogo: boolean;
    bAll: boolean;
    bLineUp : Boolean;
    SelCode: Integer;
    ShowZeroValues: string;
    PrinterSettings: TPrinterSettings;
    function GetPOLineDesc(tempCode: real; tempLine: integer): string;
    function GetSOLineDesc(tempCode: integer; tempLine: integer): string;
    function GetJBLineDesc(tempCode: integer; tempLine: integer): string;
    procedure GetInvoiceData;
  end;

var
  PBRPSalesInvFrm: TPBRPSalesInvFrm;

implementation

uses PBMainMenu, PBImages;

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
      QRLabel3.Caption := 'Credit';
      qrlblInvoiceNo.Caption := 'Credit Number';
      qrlblInvoiceDate.Caption := 'Credit / Tax Date';
      qrlblInvoiceTotal.caption := 'Credit TOTAL';
    end
  else
    begin
      QRLabel3.Caption := 'Invoice';
      qrlblInvoiceNo.Caption := 'Invoice Number';
      qrlblInvoiceDate.Caption := 'Invoice / Tax Date';
      qrlblInvoiceTotal.caption := 'Invoice TOTAL';
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

    CustomerSQl.active := false;
    CustomerSQl.active := True;

    InvLineSQL.active := false;
    InvLineSQL.parambyname('Show_Zero_Values').AsString := ShowZeroValues;
    InvLineSQL.active := True;

    qryInvCharges.active := false;
    qryInvCharges.active := true;

    InvoiceNumberLbl.Caption := IntToStr(FInvoiceNo);
  end;

  imgReport.Picture := PBImagesFrm.ReportImage.Picture;
//  imgReport.Picture := PBImagesFrm.ReportInvoiceImage.Picture;
  imgReport.Enabled := true;
end;

procedure TPBRPSalesInvFrm.InvoiceFooterBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  iTotal: Real;
  sGoods, sVat: string;
begin
  if bLineUp then
    Exit;

  lblReference.caption := '';

  if (not bInvoice) and (trim(InvHeadSRC.Dataset.FieldByName('Reference').asstring) <> '') then
    lblReference.caption := 'Original Invoice Number: '+InvHeadSRC.Dataset.FieldByName('Reference').asstring;

  sGoods := formatfloat('0.00', iGoods);
  sVat := formatfloat('0.00', iVat);

  GoodsValueLbl.Caption := formatfloat('?0.00', iGoods);
  VatValueLbl.Caption := formatfloat('?0.00', ivat);

  itotal := StrToFloatDef(sGoods) + StrToFloatDef(sVat, 0, FormatSettings);
  TotalValueLbl.Caption := formatfloat('?0.00', iTotal);

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

  if InvLineSQL.fieldbyname('Invoice_line_no').asinteger = 0 then
    begin
      PrintBand := false;
      exit;
    end;

  rUnitPrice := InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat;
  {Get the associated line description}
  if InvLineSQL.fieldbyname('Purchase_Order').asfloat <> 0 then
    begin
      lblDescription.caption := GetPOLineDesc(InvLineSQL.fieldbyname('Purchase_Order').asfloat,
                                              InvLineSQL.fieldbyname('Line').asinteger);
      lblFormRef.caption := GetFormRefDesc(InvLineSQL.fieldbyname('Purchase_Order').asfloat,
                                              InvLineSQL.fieldbyname('Line').asinteger);
      lblPriceUnit.caption := InvLineSQl.Fieldbyname('Sales_unit_Desc').asstring;
    end
  else
  if InvLineSRC.Dataset.fieldbyname('Sales_Order').asinteger <> 0 then
    begin
      lblDescription.caption := GetSOLineDesc(InvLineSQL.fieldbyname('Sales_Order').asinteger,
                                              InvLineSQL.fieldbyname('Sales_order_Line_no').asinteger);
      lblFormRef.caption := '';
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
      lblDescription.caption := GetJBLineDesc(InvLineSQL.fieldbyname('Job_Bag').asinteger,
                                              InvLineSQL.fieldbyname('Job_Bag_Line').asinteger);
      lblFormRef.caption := '';
      lblPriceUnit.caption := InvLineSQl.Fieldbyname('Sales_unit_Desc').asstring;
    end;

  if not bInvoice then
    begin
    QtyInvoicedLbl.Caption := IntToStr(PosToNegQty(InvLineSRC.Dataset.FieldByName('Qty_Invoiced').Asinteger));
//    GoodsLbl.Caption := formatfloat('0.00',(PosToNegMoney(InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat))) ;
    GoodsLbl.Caption := formatfloat('0.00',(PosToNegMoney(rUnitPrice))) ;
    rGoodsTotal := PosToNegMoney(InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat);
    end
  else
    begin
    QtyInvoicedLbl.Caption := InvLineSRC.Dataset.FieldByName('Qty_Invoiced').Asstring;
//    GoodsLbl.Caption := formatfloat('0.00',(InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat));
    GoodsLbl.Caption := formatfloat('0.00',(rUnitPrice));
    rGoodsTotal := InvLineSRC.Dataset.FieldByName('Goods_Value').AsFloat;
    end;

  if InvLineSRC.Dataset.FieldByName('Price_Unit_Factor').AsInteger = 0 then
    rGoodsTotal := rGoodsTotal
  else
    rGoodsTotal := (StrToFloatDef(QtyInvoicedLbl.Caption, 0, FormatSettings) /
      InvLineSRC.Dataset.FieldByName('Price_Unit_Factor').AsInteger)
      * rGoodsTotal;

  GoodsTotalLbl.Caption := formatfloat('0.00', rGoodsTotal);
  iGoods := iGoods + StrToFloatDef(GoodsTotalLbl.Caption, 0, FormatSettings);
  if InvLineSRC.Dataset.FieldByName('Vat_Value').AsFloat <> 0.00 then
    begin
      if bInvoice then
        rVatValue := InvLineSRC.Dataset.FieldByName('Vat_Value').AsFloat
      else
        rVatValue := InvLineSRC.Dataset.FieldByName('Vat_Value').AsFloat * -1
    end
  else
    rVatValue := StrToFloatDef(GoodsTotalLbl.Caption, 0, FormatSettings) * (InvLineSRC.Dataset.FieldByName('Vat_Rate').AsFloat / 100);

  ivat := ivat + rVatValue;

  GoodsVATLbl.Caption := formatfloat('0.00',(rVATValue));

  BuildInvoiceNotes((InvoiceReport.DataSet as TFDQuery),InvoiceReport.DataSet.fieldbyname('Narrative').asinteger);

(*  if memoNotes.lines.text = '' then
    AddChargesFooter.enabled := false
  else
    AddChargesFooter.enabled := true;
*)
  if trim(lblFormRef.caption) = '' then
    chldbndFormRef.enabled := false
  else
    chldbndFormRef.enabled := True;
    
  {Now get the line additional charges}
   with qryInvLineCharges do
      begin
        close;
        parambyname('Sales_invoice').asinteger := InvLineSRC.Dataset.FieldByName('Sales_Invoice').asinteger;
        parambyname('Invoice_Line_no').asinteger := InvLineSRC.Dataset.FieldByName('Invoice_Line_no').asinteger;
        open;
        LineCharges.enabled := recordcount > 0;
      end;
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
  sInvType, stemp: string;
  iPos: integer;
begin
  if bLineUp then
    Exit;
  {initialise the Goods and VAT values}
  iGoods := 0.00;
  iVat := 0.00;

  LineCharges.enabled := false;

  CustomerAddMemo.Lines.Clear;

  {Get Delivery Details}
  GetDetails;

(*  {Create the Branch Address details memo}
  for icount := 0 to 5 do
  begin
    if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
    BranchAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
  end;
*)
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
    if bPreview then
      InvoiceNumberLbl.Caption := 'PREVIEW'
    else
      begin
        Inc(FInvoiceNo);
        InvoiceNumberLbl.Caption := IntToStr(FInvoiceNo);
        InvoiceDateLbl.Caption := FormatDateTime('dd"/"mm"/"yyyyy',
            InvHeadSRC.Dataset.FieldByName('invoice_date').AsDateTime);
      end;
  end;

  if bInvoice then
    begin
      sTemp := InvHeadSRC.Dataset.FieldByName('Reference').Asstring + '0000';
      ipos := pos('.',sTemp);
      if iPos > 0 then
        OurJobLbl.Caption := copy(stemp,1,iPos+2)
      else
        OurJobLbl.Caption := InvHeadSRC.Dataset.FieldByName('Reference').Asstring;

      if InvHeadSRC.Dataset.FieldByName('Sales_Invoice_type').Asstring = 'S' then
        lblCustOrderNo.caption := GetSOCustOrderNo(InvHeadSRC.Dataset.FieldByName('Reference').Asstring)
      else
      if InvHeadSRC.Dataset.FieldByName('Sales_Invoice_type').Asstring = 'J' then
        lblCustOrderNo.caption := GetJBCustOrderNo(InvHeadSRC.Dataset.FieldByName('Reference').Asstring)
      else
        lblCustOrderNo.caption := GetPOCustOrderNo(InvHeadSRC.Dataset.FieldByName('Reference').Asstring);

    end
  else
    begin
      OurJobLbl.Caption := GetSIReference(InvHeadSRC.Dataset.FieldByName('Reference').Asstring);
      sInvType := GetSIType(InvHeadSRC.Dataset.FieldByName('Reference').Asstring);
      if sInvType = 'S' then
        lblCustOrderNo.caption := GetSOCustOrderNo(OurJobLbl.Caption)
      else
      if sInvType = 'J' then
        lblCustOrderNo.caption := GetJBCustOrderNo(OurJobLbl.Caption)
      else
        lblCustOrderNo.caption := GetPOCustOrderNo(OurJobLbl.Caption);

    end;

//  lblCustOrderNo.caption := InvHeadSRC.Dataset.FieldByName('Cust_Order_no').Asstring;

  memPayment.lines.clear;
  BuildPaymentNotes(dmBroker.GetCompanyPaymentNotes);
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
      result := fieldbyname('Part').asstring + ' ' + fieldbyname('Part_Description').asstring;
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
      parambyname('Purchase_order').asfloat := StrToFloatDef(trim(tempcode), 0, FormatSettings);
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

function TPBRPSalesInvFrm.GetSIReference(tempCode: string): string;
begin
  result := '';
  with qrySIHead do
    begin
      close;
      parambyname('Sales_Invoice_no').asstring := tempcode;
      open;
      result := fieldbyname('Reference').asstring;
    end;
end;

function TPBRPSalesInvFrm.GetSIType(tempCode: string): string;
begin
  result := '';
  with qrySIHead do
    begin
      close;
      parambyname('Sales_Invoice_no').asstring := tempcode;
      open;
      result := fieldbyname('Sales_invoice_type').asstring;
    end;
end;

procedure TPBRPSalesInvFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GoodsValueLbl.Caption := '';
  VatValueLbl.Caption := '';
  TotalValueLbl.Caption := 'Page to Follow';
  lblReference.caption := '';
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
  if sVersion = 'Portako' then
    memPayment.Height := 75;
end;

procedure TPBRPSalesInvFrm.FormCreate(Sender: TObject);
var
  icount: integer;
begin
  sVersion := dmBroker.GetDocumentVersion;

  if (sVersion = 'Portako') or (sVersion = 'PMS') then
    begin
      for iCount := 0 to ComponentCount-1 do
        begin
          if Components[icount] is TQRShape then
            begin
              if TQRShape(Components[icount]).tag = 1 then
                TQRShape(Components[icount]).brush.color := $00E8E3E4;
            end
          else
          if Components[icount] is TQRLabel then
            begin
              if (TQRLabel(Components[icount]).tag = 1) or (TQRLabel(Components[icount]).tag = 3) then
                begin
                  TQRLabel(Components[icount]).color := $00E8E3E4;
                end;
            end;
        end;

      {Display the Vat No.}
//      qrlblVatNo.Enabled := true;

      {format the logo}
      self.imgReport.top := 1;
      self.imgReport.left := 138;
      qrlblCompanyReg.Enabled := false;

      {format the Payment Notes}
      qrshpPaymentNotes.Top := 144;
      qrshpPaymentNotes.Height := 79;
      memPayment.Top := 146;
      
      with qrlblCompanyPort do
        begin
          Enabled := true;
          top := qrlblCompanyReg.top;
        end;
    end;
end;

procedure TPBRPSalesInvFrm.LineChargesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rVatValue: real;
begin
  if bLineUp then
    Exit;

  rVatValue := (qryInvLineCharges.Fieldbyname('Amount').asfloat
     * (qryInvLineCharges.FieldByName('Vat_Rate').AsFloat / 100));

  if not bInvoice then
    qrlblAmount.Caption := formatfloat('0.00',(PosToNegMoney(qryInvLineCharges.Fieldbyname('Amount').asfloat)))
  else
    qrlblAmount.Caption := formatfloat('0.00',(qryInvLineCharges.Fieldbyname('Amount').asfloat));

  if not bInvoice then
    qrlblExtrasVAT.Caption := formatfloat('0.00',(PosToNegMoney(rVATValue)))
  else
    qrlblExtrasVAT.Caption := formatfloat('0.00',(rVATValue));

  iGoods := iGoods + StrToFloatDef(qrlblAmount.Caption, 0, FormatSettings);
  ivat := ivat + StrToFloatDef(qrlblExtrasVAT.Caption, 0, FormatSettings);
  qrlblDetails.caption := qryInvLineCharges.fieldbyname('Details').asstring;
end;

procedure TPBRPSalesInvFrm.AddChargesFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//  AddChargesFooter.height := memoNotes.height + 13;
  if trim(CustomerSQL.fieldbyname('Payment_Terms_Description').asstring) = '' then
    qrlblPaymentTerms.caption := ''
  else
    qrlblPaymentTerms.caption := 'Payment Terms: ' + CustomerSQL.fieldbyname('Payment_Terms_Description').asstring;
end;

end.
