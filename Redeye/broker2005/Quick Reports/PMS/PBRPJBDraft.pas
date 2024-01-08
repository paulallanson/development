unit PBRPJBDraft;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, StdCtrls, qrprntr,
  printers, QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPJBDraftFrm = class(TForm)
    qrpDetails: TQuickRep;
    PageHeaderQRBand: TQRBand;
    FooterQRBand: TQRBand;
    GetDetsDataSource: TDataSource;
    qrsbdJBLines: TQRSubDetail;
    pogroupheader: TQRGroup;
    GetDetsQuery: TFDQuery;
    GetOrdHedQuery: TFDQuery;
    lblDescription: TQRLabel;
    lblSellPrice: TQRLabel;
    lblSellUnit: TQRLabel;
    lblValue: TQRLabel;
    GetSOAddQuery: TFDQuery;
    CompSRC: TDataSource;
    GetCompSQL: TFDQuery;
    CustSQL: TFDQuery;
    AddressSRC: TDataSource;
    QRLabel14: TQRLabel;
    GoodsValueLbl: TQRLabel;
    QRLabel15: TQRLabel;
    VATValueLbl: TQRLabel;
    TotalValueLbl: TQRLabel;
    QRLabel16: TQRLabel;
    lblVat: TQRLabel;
    GetContactSQL: TFDQuery;
    GetNarrSQL: TFDQuery;
    ReportTitleQRLabel: TQRLabel;
    OrdNumQRLabel: TQRLabel;
    OrdDateQRLabel: TQRLabel;
    SalesOrdDateQRLabel: TQRLabel;
    CustomerAddmemo: TQRMemo;
    QRLblWho: TQRLabel;
    QRLblCntct: TQRLabel;
    QRLblCustRef: TQRLabel;
    QRLblRef: TQRLabel;
    QRLblReqDt: TQRLabel;
    QRLblDtReq: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel7: TQRLabel;
    OrdQtyQRLabel: TQRLabel;
    QRLabel3: TQRLabel;
    DescQRLabel: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel2: TQRLabel;
    qrySOLinePart: TFDQuery;
    qryGetPriceUnit: TFDQuery;
    qrySOLine: TFDQuery;
    QRLabel1: TQRLabel;
    lblJobBagDescription: TQRLabel;
    qrsbdAddCharges: TQRSubDetail;
    lblAddDescription: TQRLabel;
    lblAddValue: TQRLabel;
    lblAddVAT: TQRLabel;
    qryJBLineChgs: TFDQuery;
    lblQuantity: TQRLabel;
    qrmDescription: TQRRichText;
    qryPOLineChgs: TFDQuery;
    
    qrlblRevenueCentre: TQRLabel;
    qrlblRevenueCentreData: TQRLabel;
    qryGetProductType: TFDQuery;
    gtQRLabel1: TQRLabel;
    imgReport: TQRImage;
    qrlblReportTitle: TQRLabel;
    function GetDetails(Sender: TObject): Integer;
    function RunReport(Sender: TObject): Integer;
    procedure StartReport(Sender: TObject);
    procedure GetAddDetails(Cust,Branch :integer);
    procedure CreateMemo (TempRef: string);
    procedure qrsbdJBLinesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure pogroupheaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FooterQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsbdAddChargesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure BuildSpecialNotes(iNarrative: integer);
    function GetPartPriceUnit(tempCode, tempLine: integer): integer;
    function GetPUnitDescription(tempCode: integer): string;
    function GetPUnitFactor(tempCode: integer): integer;
    function GetSOLineSellPrice(tempCode, tempLine: integer): double;
    function GetSOLinePackSize(tempCode, tempLine: integer): integer;
    function GetDefPriceUnit: integer;
    function GetSOLineOutQty(tempCode, tempLine: integer): integer;
    function GetProductType(POCode, JBCode: integer): string;
    { Private declarations }
  public
    { Public declarations }
    RePRint, Preview, FaxIt, bPrintLogo, FinanceVers: ByteBool;
    SuppName, SuppFax : String;
    PackSize, QtyOrd : Integer;
    iIntSelCode: Integer ;
    TotOrdVal : Real;
    JBNumber: integer;
    ShowZeroValues: string;
    end;

var
  PBRPJBDraftFrm: TPBRPJBDraftFrm;

implementation

uses UITypes, PBSendFax, pbMainMenu, CCSCommon, PBImages;

var
  iGoods, iVAT: Real;


{$R *.DFM}

{ TClPurOrdRepForm }

function TPBRPJBDraftFrm.GetDetails(Sender: TObject): Integer;
begin
  with GetOrdHedQuery do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    Open;
    Result := RecordCount;
  end;
end;

function TPBRPJBDraftFrm.RunReport(Sender: TObject): Integer;
var
  FaxFound: ByteBool;
begin
  Result := 0;
  If not FaxIt then
  begin
    StartReport(Self)
  end
  else
    {Faxing to all Customers};
    with GetOrdHedQuery do
    begin
      Close;
      Open;
      First;
      while not EOF do
      begin
        if GetDetails(Self) > 0 then
        begin
          GetSOAddQuery.Close;
          GetSOAddQuery.ParamByName('Sel1').AsString := GetOrdHedQuery.FieldByName('Text100').AsString;
          GetSOAddQuery.Open;
          FaxFound :=
            PBSendFaxFrm.OutToFax(GetSOAddQuery.FieldByname('CustAdd6').AsString,
            'SO: ' + GetSOAddQuery.FieldByName('CustNam').AsString, '');
          if not FaxFound then
            begin
              MessageDlg('No fax system installed', mtError, [mbOK], 0);
              Exit;
            end;
//          SalesOrdQuickReport.PrinterSettings.PrinterIndex := FaxFound;
          StartReport(Self);
        end;
        Next;
      end;
end;
end;

procedure TPBRPJBDraftFrm.StartReport(Sender: TObject);
begin
if Preview then
  begin
     qrpDetails.Preview;
  end
  else
  begin
    if not FaxIt then
    begin
      {Select the printer};
      qrpDetails.PrinterSetup;
      if qrpdetails.Tag <> 0 then
        Exit;
    end;
    qrpDetails.Print;
  end;
end;

procedure TPBRPJBDraftFrm.qrsbdJBLinesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
  rvatvalue : real;
  Quantity: integer;
  PriceUnit, PriceUnitFactor: integer;
  PriceUnitDescr: string;
  sellPrice: real;
  PackSize: integer;
  i: integer;
begin
  iLines := 0;
  qrmDescription.Height := 16;
  for i := pred(qrmDescription.Lines.Count) downto 0 do
    qrmDescription.Lines.Delete(i);

  lblDescription.Caption := '';

  With GetDetsQuery do
   begin
    Quantity := FieldByName('Job_Bag_Quantity').AsInteger;
//    lblDescription.Caption := FieldByName('Job_Bag_line_Descr').AsString;
    if FinanceVers then
      qrmDescription.lines.add(Fieldbyname('Job_Bag_line_descr').asstring + '  (' + GetProductType(Fieldbyname('Product_Type').asinteger,Fieldbyname('JB_Product_Type').asinteger) + ')')
    else
      qrmDescription.lines.add(Fieldbyname('Job_Bag_line_descr').asstring);
    if (fieldbyname('sell_unit').asstring = '') and (fieldbyname('Sales_Order').asinteger <> 0) then
      begin
        PriceUnit := GetPartPriceUnit(fieldbyname('Sales_order').asinteger, fieldbyname('sales_order_line_no').asinteger);
        PriceUnitDescr := GetPUnitDescription(PriceUnit);
        PriceUnitFactor := GetPUnitFactor(PriceUnit);
        Quantity := GetSOLineOutQty(fieldbyname('Sales_order').asinteger, fieldbyname('sales_order_line_no').asinteger);
        SellPrice := GetSOLineSellPrice(fieldbyname('Sales_order').asinteger, fieldbyname('sales_order_line_no').asinteger);
        PackSize := GetSOLinePackSize(fieldbyname('Sales_order').asinteger, fieldbyname('sales_order_line_no').asinteger);
        if PriceUnitFactor = 0 then
          SellPrice := SellPrice
        else
          SellPrice := (SellPrice/PackSize) * PriceUnitFactor;
      end
    else
    if (fieldbyname('price_unit').asinteger <> 0) then
      begin
        PriceUnit := fieldbyname('price_unit').asinteger;
        PriceUnitDescr := GetPUnitDescription(PriceUnit);
        PriceUnitFactor := GetPUnitFactor(PriceUnit);
        Quantity := fieldbyname('Job_Bag_Quantity').asinteger;
        SellPrice := (fieldbyname('unit_price').asfloat);
      end
    else
    if (fieldbyname('sell_unit').asstring = '') then
      begin
        PriceUnit := GetDefPriceUnit;
        PriceUnitDescr := GetPUnitDescription(PriceUnit);
        PriceUnitFactor := GetPUnitFactor(PriceUnit);
        Quantity := fieldbyname('Job_Bag_Quantity').asinteger;
        SellPrice := (fieldbyname('Job_Bag_line_Sell').asfloat);
      end
    else
      begin
        PriceUnit := FieldByName('Sell_Unit').Asinteger;
        PriceUnitDescr := GetPUnitDescription(PriceUnit);
        PriceUnitFactor := GetPUnitFactor(PriceUnit);
        Quantity := Fieldbyname('Invoice_Qty').asinteger;;
        SellPrice := (fieldbyname('selling_price').asfloat);
      end;

    lblQuantity.Caption := inttostr(Quantity);
//    lblSellPrice.Caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr(SellPrice));

    lblSellPrice.Caption := formatfloat('0.000',SellPrice);
    lblSellUnit.Caption := PriceUnitDescr;
    if PriceUnitFactor = 0 then
      lblValue.Caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr(SellPrice))
    else
      lblValue.Caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr((Quantity * SellPrice)/PriceUnitFactor));
    iGoods := iGoods + StrToFloatDef(lblValue.Caption, 0, FormatSettings);
    rVatValue := StrToFloatDef(lblValue.Caption, 0, FormatSettings) * (FieldByName('Vat_Rate').AsFloat / 100);
    lblVat.Caption := formatFloat('0.00',rVatValue);
    ivat := ivat + rVatValue;
  end;
  iLines := qrmDescription.Lines.count;
  qrmDescription.Height := (iLines * 16);
  qrsbdJBLines.Height := qrmDescription.Height + 4;
  if iLines > 1 then
    begin
      lblQuantity.Top := (qrmDescription.Height - (lblQuantity.height + 3));
      lblSellPrice.top := lblQuantity.Top;
      lblSellUnit.Top := lblQuantity.Top;
      lblValue.Top := lblQuantity.Top;
      lblVat.Top := lblQuantity.Top;
    end
  else
    begin
      lblQuantity.Top := 1;
      lblSellPrice.top := lblQuantity.Top;
      lblSellUnit.Top := lblQuantity.Top;
      lblValue.Top := lblQuantity.Top;
      lblVat.Top := lblQuantity.Top;
    end;

  with qryPOLineChgs do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger :=  GetDetsQuery.FieldByName('Job_Bag').Asinteger;
    ParamByName('Job_Bag_Line').Asinteger :=  GetDetsQuery.FieldByName('Job_Bag_Line').Asinteger;
    Open;
    qrsbdAddCharges.Enabled := (recordcount > 0);
  end;
end;

function TPBRPJBDraftFrm.GetProductType(POCode, JBCode: integer): string;
var
  tempCode: integer;
begin
  if POCode <> 0 then
    tempCode := POCode
  else
    tempCode := JBCode;

  with qryGetProductType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := fieldbyname('Category_Description').asstring + '/' + fieldbyname('Description').asstring;
    end;
end;

procedure TPBRPJBDraftFrm.pogroupheaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  icount,Cust,Branch: Integer;
begin
  iGoods := 0.00;
  iVat := 0.00;

  with GetDetsQuery do
  begin
    Close;
    ParamByName('Sel1').AsString :=  GetOrdHedQuery.FieldByName('Text100').AsString;
    ParamByName('Show_Zero_Values').AsString :=  ShowZeroValues;
    Open;
  end;

(*  with qryJBLineChgs do
  begin
    Close;
    ParamByName('Job_Bag').Asinteger :=  strtoint(GetOrdHedQuery.FieldByName('Text100').AsString);
    Open;
    qrsbdAddCharges.Enabled := (recordcount > 0);
  end;
*)

  CustomerAddMemo.Lines.Clear;

  {Get invoice address Details}
  Cust :=  GetDetsQuery.FieldByName('customer').AsInteger;
  Branch := GetDetsQuery.FieldByName('branch_no').AsInteger;

  GetAddDetails(Cust,Branch);

  for icount := 0 to 5 do
  begin
    if AddressSRC.dataset.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(Trim(AddressSRC.dataset.Fields[icount].AsString));
  end;
//  sPhoneQrLabel.Caption := addressSrc.Dataset.fields[6].AsString;
//  sFaxQRLabel.Caption := addressSrc.Dataset.fields[7].AsString;
//  sEmailQRLabel.Caption := addressSrc.Dataset.fields[8].AsString;
  qrLblCntct.Caption := '';
  with getcontactSQL do
  begin
    close;
    paramByname('Customer').asInteger := Cust;
    ParamByName('Branch_No').asInteger := Branch;
    ParamByname('Contact_No').asInteger := GetDetsQuery.fieldByName('Contact_No').Asinteger;
    open;
    QrLblCntct.Caption := GetContactSQL.FieldByName('Contact_Name').asString;
  end;

  With GetDetsQuery do
    begin
    OrdNumQRLabel.Caption := FieldByName('Job_Bag').AsString;
    SalesOrdDateQRLabel.Caption := DateToStr(FieldByName('Date_Point').AsDateTime);
    QRLblReqDT.Caption := DateToStr(FieldByName('Date_Required').AsDateTime);
    QRLblRef.Caption := fieldByName('Cust_Order_No').AsString;
    lblJobBagDescription.caption := fieldbyname('Job_Bag_Descr').asstring;
    qrlblRevenueCentreData.caption := fieldbyname('Revenue_Centre').asstring;
  end;
end;

procedure TPBRPJBDraftFrm.FooterQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iTotal: Real;
begin
  GoodsValueLbl.Caption := formatfloat('0.00', iGoods);
  VatValueLbl.Caption := formatfloat('0.00', ivat);

  itotal := StrToFloatDef(GoodsValueLbl.Caption, 0, FormatSettings) + StrToFloatDef(VatValueLbl.Caption, 0, FormatSettings);
  TotalValueLbl.Caption := formatfloat('0.00', iTotal);
end;

procedure TPBRPJBDraftFrm.FooterQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 Totordval := 0.
end;

procedure TPBRPJBDraftFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
   irow: integer;
begin
  qrpdetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;   {set
the printer to what the user selected}
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpdetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpdetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  {Activate the company SQL}
  qrlblRevenueCentre.enabled := (FinanceVers);
  qrlblRevenueCentreData.enabled := (FinanceVers);

  with GetCompSQL do
  begin
    Close;
    Open;
    First;
  end;

  if bPrintLogo then
  begin
    imgReport.Picture := PBImagesFrm.ReportImage.Picture;
    imgReport.Enabled := true;
  end;
(*  lblCompanyName.Caption := GetCompSQL.fieldbyname('Name').AsString;

  QRMemoAddress.lines.Clear;
  {Get the Phone details}
      for irow := 4 to 8 do
        begin
          if Trim(GetCompSQl.Fields[irow].AsString) = '' then Continue;
          QRMemoAddress.Lines.Append(Trim(GetCompSQl.Fields[irow].AsString));
        end;
        {Do phone numbers}
        QRMemoAddress.Lines.Append('');
        if Trim(GetCompSQl.Fields[9].AsString) <> '' then
          QRMemoAddress.Lines.Append('Tel: ' + Trim(GetCompSQl.Fields[9].AsString));

        if Trim(GetCompSQl.Fields[10].AsString) <> '' then
          QRMemoAddress.Lines.Append('Fax: ' + Trim(GetCompSQl.Fields[10].AsString));

        if Trim(GetCompSQl.Fields[11].AsString) <> '' then
          QRMemoAddress.Lines.Append('Email: ' + Trim(GetCompSQl.Fields[11].AsString));
*)
end;

procedure TPBRPJBDraftFrm.GetAddDetails(Cust, Branch: integer);
begin
      with CustSQl do
      begin
        Close;
        ParamByName('Customer').AsInteger := Cust;
        ParamByName('Branch_no').AsInteger := Branch;
        Open;
      end;
      AddressSRC.Dataset := CustSQL;
end;

procedure TPBRPJBDraftFrm.CreateMemo(TempRef: string);
var
sAddLine: String;
begin
  sAddLine := '' ;
  sAddLine := Trim(TempRef);
end;

procedure TPBRPJBDraftFrm.BuildSpecialNotes(iNarrative : integer);
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
end;

function TPBRPJBDraftFrm.GetPartPriceUnit(tempCode, tempLine: integer): integer;
begin
  with qrySOLinePart do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;

      if fieldbyname('Price_Unit').asstring = '' then
        result := self.GetDefPriceUnit
      else
        result := fieldbyname('Price_Unit').asinteger;
    end;
end;

function TPBRPJBDraftFrm.GetPUnitDescription(tempCode: integer): string;
begin
  result := '';
  with qryGetPriceUnit do
    begin
      close;
      parambyname('Price_Unit').asinteger := tempCode;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

function TPBRPJBDraftFrm.GetPUnitFactor(tempCode: integer): integer;
begin
  with qryGetPriceUnit do
    begin
      close;
      parambyname('Price_UNit').asinteger := tempCode;
      open;
      result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

function TPBRPJBDraftFrm.GetSOLineSellPrice(tempCode, tempLine: integer): double;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asfloat := tempcode;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_Sales_Price').asfloat;
    end;
end;

function TPBRPJBDraftFrm.GetDefPriceUnit: integer;
begin
  with GetCompSQL do
    begin
      close;
      open;
      result := fieldbyname('Price_unit').asinteger;
    end;
end;

function TPBRPJBDraftFrm.GetSOLineOutQty(tempCode, tempLine: integer): integer;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asfloat := tempcode;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Qty_Outstanding').asinteger;
    end;
end;

procedure TPBRPJBDraftFrm.qrsbdAddChargesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  sellPrice, rVatValue: real;
begin
(*  lblAddDescription.caption := qryJBLineChgs.fieldbyname('Details').asstring;
  lblAddValue.caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr(qryJBLineChgs.fieldbyname('Quotation_Price').asfloat));
  if qryJBLineChgs.FieldByName('Vat_Rate').Asstring = '' then
    rVatValue := StrToFloatDef(lblAddValue.Caption, 0, FormatSettings) * (qryJBLineChgs.FieldByName('Customer_Vat_Rate').AsFloat / 100)
  else
    rVatValue := StrToFloatDef(lblAddValue.Caption, 0, FormatSettings) * (qryJBLineChgs.FieldByName('Vat_Rate').AsFloat / 100);
*)
  lblAddDescription.caption := qryPOLineChgs.fieldbyname('Details').asstring;
  lblAddValue.caption := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr(qryPOLineChgs.fieldbyname('Quotation_Price').asfloat));
  if qryPOLineChgs.FieldByName('Vat_Rate').Asstring = '' then
    rVatValue := StrToFloatDef(lblAddValue.Caption, 0, FormatSettings) * (qryPOLineChgs.FieldByName('Customer_Vat_Rate').AsFloat / 100)
  else
    rVatValue := StrToFloatDef(lblAddValue.Caption, 0, FormatSettings) * (qryPOLineChgs.FieldByName('Vat_Rate').AsFloat / 100);

  lblAddVat.Caption := formatFloat('0.00',rVatValue);
  iGoods := iGoods + StrToFloatDef(lblAddValue.Caption, 0, FormatSettings);
  ivat := ivat + rVatValue;
end;

function TPBRPJBDraftFrm.GetSOLinePackSize(tempCode,
  tempLine: integer): integer;
begin
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asfloat := tempcode;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Sell_Pack_Quantity').asinteger;
    end;

end;

end.
