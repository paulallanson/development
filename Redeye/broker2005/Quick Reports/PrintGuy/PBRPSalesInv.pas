unit PBRPSalesInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, DB, ExtCtrls, CCSPrint,
  CCSCommon, PBPOObjects, QrExport, qrprntr, printers,
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
    CustSQL: TFDQuery;
    CreditHeadSQL: TFDQuery;
    GoodsLbl: TQRLabel;
    QtyInvoicedLbl: TQRLabel;
    GetNarrSQL: TFDQuery;
    AddChargesFooter: TQRBand;
    memoNotes: TQRMemo;
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
    BranchAddMemo: TQRMemo;
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
    ExtrasVatLbl: TQRLabel;
    qrySIHead: TFDQuery;
    qrlblInvoiceTotal: TQRLabel;
    qrlblVatTotal: TQRLabel;
    qrlblNetTotal: TQRLabel;
    qrlblAccount: TQRLabel;
    qrlblOrderRef: TQRLabel;
    qrlblJobNumber: TQRLabel;
    qrlblInvoiceDate: TQRLabel;
    qrlblInvoiceNo: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel9: TQRLabel;
    qrmemCompanyReg: TQRMemo;
    CompSQL: TFDQuery;
    memPayment: TQRMemo;
    gtQRShape1: TQRShape;
    qrlblInvoiceLabel: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRDBText3: TQRDBText;
    qrmemCompanyAddress: TQRMemo;
    imgReport: TQRImage;
    QRLabel12: TQRLabel;
    gtQRLabel7: TQRLabel;
    VatPerclbl: TQRLabel;
    ExtrasVatPerclbl: TQRLabel;
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
  private
    FInvoiceNo : integer;
    FLoops: integer;
    FbCustomerisReseller: Boolean;
    procedure BuildPaymentNotes(const iNarrative: integer);
    procedure GetSODeliveryDetails(tempCode: string);
    function GetPOCustOrderNo(tempCode: string): string;
    function GetSOCustOrderNo(tempCode: string): string;
    function GetJBCustOrderNo(tempCode: string): string;
    function GetSOLineProduct(tempCode: integer; tempLine: integer): string;
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
    procedure SetbCustomerisReseller(const Value: Boolean);
  public
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
    { bCustomerisReseller added by GDK }
    property bCustomerisReseller: Boolean read FbCustomerisReseller write SetbCustomerisReseller;
    procedure GetInvoiceData;
    function GetPOLineDesc(tempCode: real; tempLine: integer): string;
    function GetSOLineDesc(tempCode: integer; tempLine: integer): string;
    function GetJBLineDesc(tempCode: integer; tempLine: integer): string;
  end;

var
  PBRPSalesInvFrm: TPBRPSalesInvFrm;

implementation

uses pbMainMenu, pbDatabase, PBImages;

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
  irow, icount: integer;
begin
  {set the printer to what the user selected}
  InvoiceReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  InvoiceReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  InvoiceReport.PrinterSettings.copies := Copies;   {set the number of copies }
  InvoiceReport.PrinterSettings.PaperSize := Size;   {set the number of copies }

  if bLineUp then
  begin
    InvoiceReport.OnNeedData := InvoiceReportNeedData;
    InvoiceReport.DataSet := nil;
  end
  else
  begin
    with qrmemCompanyAddress do
      begin
        CompSQL.close;
        CompSQL.open;
        Lines.Clear;
//        Lines.Append('Solutions 23 Limited, ' + Trim(CompSQL.Fields[1].AsString));
        Lines.Append(Trim(CompSQL.Fields[0].AsString) + ' | ' + Trim(CompSQL.Fields[1].AsString) + ' | ' + Trim(CompSQL.Fields[2].AsString) + ' | ' + Trim(CompSQL.Fields[3].AsString) + ' | ' + Trim(CompSQL.Fields[4].AsString) + ' | ' + Trim(CompSQL.Fields[5].AsString)) ;

        {Finally, add the phone number} ;
        Lines.Append('Tel: ' + Trim(CompSQL.FieldByName('Phone').AsString) + ' | ' + 'Email: ' + 'theguys@printguy.co.uk'  + ' | '  + ' Web: ' + Trim(CompSQL.FieldByName('Web_Address').AsString));
      end;
    InvoiceReport.OnNeedData := nil;
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

  if bPrintLogo then
  begin
    imgReport.Picture := PBImagesFrm.ReportImage.Picture;
    imgReport.Enabled := true;
  end
  else
    begin
      imgReport.height := 0;
    end;

  if bPrintLogo <> true then exit;

  {Change the labels if credit note}
  if not bInvoice then
    begin
      qrlblInvoiceLabel.caption := 'CREDIT NOTE';
      qrlblInvoiceNo.caption := 'CREDIT NOTE';
      qrlblInvoiceDate.caption := 'CREDIT NOTE DATE'
    end;

  {Determine if we show the boxes and labels for emailing}
  for iCount := 0 to ComponentCount-1 do
    begin
      if Components[icount] is TQRShape then
        begin
          if TQRShape(Components[icount]).tag = 1 then
            begin
              TQRShape(Components[icount]).enabled := true;
              if not bInvoice then
                TQRShape(Components[icount]).pen.color := clRed;
            end;
        end
      else
      if Components[icount] is TQRLabel then
        begin
          if (TQRLabel(Components[icount]).tag = 1) then
            begin
              TQRLabel(Components[icount]).enabled := true;
              if not bInvoice then
                TQRLabel(Components[icount]).font.color := clRed;
            end;
        end
      else
      if Components[icount] is TQRMemo then
        begin
          if (TQRMemo(Components[icount]).tag = 1) then
            begin
              TQRMemo(Components[icount]).enabled := true;
              if not bInvoice then
                TQRMemo(Components[icount]).font.color := clRed;
            end;
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

  if (not bInvoice) and (trim(InvHeadSRC.Dataset.FieldByName('Reference').asstring) <> '') then
    lblReference.caption := 'Original Invoice Number: '+InvHeadSRC.Dataset.FieldByName('Reference').asstring;

  GoodsValueLbl.Caption := formatfloat('0.00', iGoods);
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
(*      lblFormRef.caption := GetFormRefDesc(InvLineSQL.fieldbyname('Purchase_Order').asfloat,
                                              InvLineSQL.fieldbyname('Line').asinteger);
*)      lblPriceUnit.caption := InvLineSQl.Fieldbyname('Sales_unit_Desc').asstring;
    end
  else
  if InvLineSRC.Dataset.fieldbyname('Sales_Order').asinteger <> 0 then
    begin
      lblProduct.caption := GetSOLineProduct(InvLineSQL.fieldbyname('Sales_Order').asinteger,
                                              InvLineSQL.fieldbyname('Sales_order_Line_no').asinteger);
      lblDescription.caption := GetSOLineDesc(InvLineSQL.fieldbyname('Sales_Order').asinteger,
                                              InvLineSQL.fieldbyname('Sales_order_Line_no').asinteger);
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
      lblProduct.caption := '';
      lblDescription.caption := GetJBLineDesc(InvLineSQL.fieldbyname('Job_Bag').asinteger,
                                              InvLineSQL.fieldbyname('Job_Bag_Line').asinteger);
//      lblFormRef.caption := '';
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
    rGoodsTotal := (strtofloat(QtyInvoicedLbl.Caption) /
      InvLineSRC.Dataset.FieldByName('Price_Unit_Factor').AsInteger)
      * rGoodsTotal;

  GoodsTotalLbl.Caption := formatfloat('0.00', rGoodsTotal);
  iGoods := iGoods + StrToFloat(GoodsTotalLbl.Caption);

  if invlineSRC.DataSet.fieldbyname('Vat_Value').asfloat <> 0.00 then
    begin
      if bInvoice then
        rVatValue := invlineSRC.DataSet.fieldbyname('Vat_Value').asfloat
      else
        rVatValue := invlineSRC.DataSet.fieldbyname('Vat_Value').asfloat * -1
    end
  else
    rVatValue := StrToFloat(GoodsTotalLbl.Caption) * (InvLineSRC.Dataset.FieldByName('Vat_Rate').AsFloat / 100);

  ivat := ivat + rVatValue;

//  if not bInvoice then
//    GoodsVATLbl.Caption := formatfloat('0.00',(PosToNegMoney(rVATValue)))
//  else
//    GoodsVATLbl.Caption := formatfloat('0.00',(rVATValue));

  BuildInvoiceNotes((InvoiceReport.DataSet as TFDQuery),InvoiceReport.DataSet.fieldbyname('Narrative').asinteger);

  if memoNotes.lines.text = '' then
    AddChargesFooter.enabled := false
  else
    AddChargesFooter.enabled := true;

  if lblProduct.Caption = '' then
    begin
      lblDescription.BringToFront;
      lblDescription.left := 58;
      lblDescription.width := 420;
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
  MySelf := frmPBMainMenu.iOperator;
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
  sInvType: string;
begin
  if bLineUp then
    Exit;
  {initialise the Goods and VAT values}
  iGoods := 0.00;
  iVat := 0.00;

  CustomerAddMemo.Lines.Clear;
  BranchAddMemo.Lines.Clear;

  {Get Delivery Details}
  if InvHeadSRC.Dataset.FieldByName('Sales_Invoice_type').Asstring = 'S' then
    GetSODeliveryDetails(InvHeadSRC.Dataset.FieldByName('Reference').Asstring)
  else
    GetDetails;

  {Create the Branch Address details memo}
  for icount := 0 to 5 do
  begin
    if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
    BranchAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
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

  if bInvoice then
    begin
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
      OurJobLbl.Caption := GetSIReference(InvHeadSRC.Dataset.FieldByName('Reference').AsString);
      sInvType := GetSIType(InvHeadSRC.Dataset.FieldByName('Reference').Asstring);
      if sInvType = 'S' then
        lblCustOrderNo.caption := GetSOCustOrderNo(OurJobLbl.Caption)
      else
      if sInvType = 'J' then
        lblCustOrderNo.caption := GetJBCustOrderNo(OurJobLbl.Caption)
      else
        lblCustOrderNo.caption := GetPOCustOrderNo(OurJobLbl.Caption);
    end;

  memPayment.lines.clear;
  BuildPaymentNotes(dmBroker.GetCompanyPaymentNotes);

  if qryInvCharges.recordcount = 0 then
    begin
      InvoiceCharges.enabled := false;
    end
  else
    begin
      InvoiceCharges.enabled := true;
    end
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

procedure TPBRPSalesInvFrm.SetbCustomerisReseller(const Value: Boolean);
begin
  FbCustomerisReseller := Value;
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

  if not bInvoice then
    ExtrasVATLbl.Caption := formatfloat('0.00',(PosToNegMoney(rVATValue)))
  else
    ExtrasVATLbl.Caption := formatfloat('0.00',(rVATValue));

  ExtrasVATPercLbl.Caption := formatfloat('0.00',(qryInvCharges.FieldByName('Vat_Rate').AsFloat));

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

procedure TPBRPSalesInvFrm.GetSODeliveryDetails(tempCode: string);
begin
  with qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := strtoint(trim(tempcode));
      open;
      first;
    end;

  with CustSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger := qrySOHead.fieldbyname('Delivery_Customer').asinteger;
      ParamByName('Branch_no').AsInteger := qrySOHead.fieldbyname('Delivery_Branch').asinteger;
      Open;
    end;
  AddressSRC.Dataset := CustSQL;
end;

procedure TPBRPSalesInvFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GoodsValueLbl.Caption := '';
  VatValueLbl.Caption := '';
  TotalValueLbl.Caption := 'Page to Follow';
  lblReference.caption := '';
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

end.
