unit wtRPPOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrCtrls,
  gtQrExport, qrprntr, printers, AllCommon;

type
  TfrmwtRPPOrder = class(TForm)
    qrpDetails: TQuickRep;
    qrgPurchaseOrder: TQRGroup;
    qryReport: TQuery;
    qrbPageHeader: TQRBand;
    dtsReport: TDataSource;
    qrsdPOLines: TQRSubDetail;
    qrySupplier: TQuery;
    qrbPOFooter: TQRBand;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qrlblSOCaption: TQRLabel;
    qrmAddress: TQRMemo;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    qrlblNett: TQRLabel;
    QRLabel1: TQRLabel;
    qryPOLine: TQuery;
    QRDBText7: TQRDBText;
    qrlblTotalLineCost: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    memAddress: TQRRichText;
    QRShape2: TQRShape;
    QRShape6: TQRShape;
    QRShape3: TQRShape;
    gtQRShape1: TQRShape;
    QRShape1: TQRShape;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRLabel2: TQRLabel;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    gtQRShape9: TQRShape;
    gtQRShape10: TQRShape;
    gtQRShape11: TQRShape;
    gtQRLabel4: TQRLabel;
    QRShape9: TQRShape;
    memDeliveryNotes: TQRMemo;
    qrshpPayment: TQRShape;
    qryCompanyAddress: TQuery;
    GetNarrSQL: TQuery;
    dtsPOLine: TDataSource;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    dtsAddress: TDataSource;
    gtQRShape3: TQRShape;
    gtQRLabel11: TQRLabel;
    gtQRDBText6: TQRDBText;
    gtQRDBText7: TQRDBText;
    gtQRLabel12: TQRLabel;
    gtQRShape4: TQRShape;
    gtQRShape5: TQRShape;
    gtQRShape6: TQRShape;
    gtQRLabel13: TQRLabel;
    gtQRShape7: TQRShape;
    gtQRLabel14: TQRLabel;
    gtlblLineCount: TQRLabel;
    gtQRDBText8: TQRDBText;
    gtQRLabel16: TQRLabel;
    gtQRShape2: TQRShape;
    qrmDeliveryAddress: TQRMemo;
    gtQRLabel3: TQRLabel;
    gtQRDBText10: TQRDBText;
    qrlblSlabDescription: TQRLabel;
    gtQRShape8: TQRShape;
    gtQRShape12: TQRShape;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    gtQRShape17: TQRShape;
    gtQRDBText2: TQRDBText;
    gtQRShape18: TQRShape;
    qrlblUnitCost: TQRLabel;
    qrlblLineCost: TQRLabel;
    qrlblDiscountValue: TQRLabel;
    qryUpPO: TQuery;
    qrlblDescription: TQRLabel;
    gtQRShape13: TQRShape;
    ChildBand1: TQRChildBand;
    qrlblCustomerReference: TQRLabel;
    qriHeadLogo: TQRImage;
    qrbPurchaseOrderFooter: TQRBand;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgPurchaseOrderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdPOLinesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPurchaseOrderFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPurchaseOrderFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    function BuildNotes(const iNotes: integer): string;
    procedure BuildDeliveryNotes(const iNarrative: integer);
  public
    iLineCount: integer;
    bDetailed: boolean;
    bPreview: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bEndUser: boolean;
    PurchaseOrder: integer;
    function Getdetails: integer;
  end;

var
  frmwtRPPOrder: TfrmwtRPPOrder;

implementation

uses wtDataModule;

var
  rLineTotal, rGrossTotal, rVATTotal: real;

{$R *.dfm}

function TfrmwtRPPOrder.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Purchase_order').asinteger := self.PurchaseOrder;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPPOrder.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.copies := Copies;   {set the number of copies }
  qrpDetails.PrinterSettings.PaperSize := Size;   {set the number of copies }

  qriHeadLogo.enabled := bPrintLogo;
  memAddress.enabled := bPrintLogo;

  with qryCompany do
    begin
      close;
      open;
    end;

  with qryPOLine do
    begin
      close;
      open;
    end;

  with qryCompanyAddress do
    begin
      close;
      open;
    end;

  for icount := 0 to 4 do
  begin
    if qryCompanyAddress.Fields[icount].AsString = '' then Continue;
    tempAddress := tempAddress + ', ' + qryCompanyAddress.Fields[icount].AsString;
  end;

  tempAddress := tempAddress + #13#10;

  tempAddress := tempAddress + 'Telephone  ' + qryCompanyAddress.Fields[5].AsString;
  tempAddress := tempAddress + '  Fax  ' + qryCompanyAddress.Fields[6].AsString;

  tempAddress := trim(StringReplace(tempAddress,',','',[]));
  memAddress.lines.add(tempAddress);

  {Show Payemnt details}
  memDeliveryNotes.Lines.clear;
  memDeliveryNotes.Lines.add(qryCompany.fieldbyname('Delivery_Narrative').asstring);
end;

procedure TfrmwtRPPOrder.qrgPurchaseOrderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iCount: integer;
  TempAddress: string;
begin
  iLineCount := 0;
  
  rGrossTotal := 0.00;
  rLineTotal := 0.00;
  rVatTotal := 0.00;

  qrmAddress.Lines.Clear;

  qrySupplier.close;
  qrySupplier.parambyname('Supplier').asinteger := qryReport.FieldByName('Supplier').AsInteger;
  qrySupplier.open;
  dtsAddress.dataset := qrySupplier;

  if trim(qryReport.FieldByName('Contact_Name').AsString) <> '' then
      qrmAddress.Lines.Add(qryReport.FieldByName('Contact_Name').AsString);

  for iCount := 1 to 6 do
    begin
      if trim(dtsAddress.DataSet.fields[iCount].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[iCount].asstring))
    end;

  qrmDeliveryAddress.Lines.clear;
  qrmDeliveryAddress.Lines.Add(trim(qryCompanyAddress.fieldbyname('Company_Name').asstring));

  for icount := 0 to 4 do
    begin
      if trim(qryCompanyAddress.fields[iCount].asstring) <> '' then
        qrmDeliveryAddress.Lines.Add(trim(qryCompanyAddress.fields[iCount].asstring))
    end;
end;

function TfrmwtRPPOrder.BuildNotes(const iNotes: integer): string;
var
  aStr: string;
begin
  if iNotes > 0 then
    begin
      qryGetNotes.parambyname('Notes_Code').asinteger := iNotes;
      qryGetNotes.open;
      aStr := '';
      while (not qryGetNotes.eof) do
        Begin
          astr := aStr + qryGetNotes.fieldbyname('Notes_text').asstring;
          if Length(qryGetNotes.fieldbyname('Notes_text').asstring) < 100 then
            aStr := aStr + ' ';
          qryGetNotes.next;
        end;
      qryGetNotes.close;
    end;
  result := aStr;
end;

procedure TfrmwtRPPOrder.qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrbPageHeader.Enabled := false;
end;

procedure TfrmwtRPPOrder.qrsdPOLinesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  unitCost, totalCost, fullLineTotal, discountValue, NettLineTotal: real;
begin
  inc(iLineCount);

  gtlblLineCount.Caption := inttostr(iLineCount);

  if qryPOLine.FieldByName('Worktop').AsInteger = 0 then
    begin
      if trim(qryPOLine.FieldByName('Supplier_Product_Code').Asstring) <> '' then
        qrlblDescription.caption := trim(qryPOLine.FieldByName('Supplier_Product_Code').Asstring) + ' - ' +
                                  qryPOLine.FieldByName('Description').Asstring
      else
        qrlblDescription.caption := qryPOLine.FieldByName('Description').Asstring;

      qrlblSlabDescription.caption := '';
    end
  else
    begin
      qrlblDescription.caption := qryPOLine.FieldByName('Description').Asstring;
      qrlblSlabDescription.caption := qryPOLine.FieldByName('Slab_Length').Asstring + ' x ' + qryPOLine.FieldByName('Slab_Depth').Asstring
                                  + ' ' + qryPOLine.FieldByName('Slab_Description').Asstring;
    end;

  qrlblUnitCost.caption := formatfloat('0.00',qryPOLine.FieldByName('Unit_Cost').Asfloat);

//  qrlblCostUnit.caption := qryPOLine.FieldByName('Cost_Pack_Quantity').Asstring;

  unitCost := qryPOLine.FieldByName('Unit_Cost').Asfloat;

  totalCost := (unitCost/qryPOLine.FieldByName('Cost_Pack_Quantity').Asinteger) * qryPOLine.FieldByName('Quantity').Asfloat;

  fullLineTotal := totalCost;

  qrlblLineCost.caption := formatfloat('0.00',fullLineTotal);

  {Discount}
  discountValue :=  fullLineTotal * (qryPOLine.FieldByName('Discount_Percentage').Asfloat/100);
  qrlblDiscountValue.caption := formatfloat('0.00', discountValue);

  NettLineTotal := fullLineTotal - discountValue;

  qrlblTotalLineCost.caption := formatfloat('0.00', NettLineTotal);

  rLineTotal := rLineTotal + NettLineTotal;

  rVatTotal := rVatTotal + (fullLineTotal * (qryPOLine.FieldByName('Vat_Rate').Asfloat/100.00));
end;

procedure TfrmwtRPPOrder.FormCreate(Sender: TObject);
var
  LocalDir: string;
begin
  try
    LocalDir := extractfilepath(application.exename);
    qriHeadlogo.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
    qriHeadLogo.Picture.Bitmap.PixelFormat := pfDevice;
  except
  end;
end;

procedure TfrmwtRPPOrder.BuildDeliveryNotes(const iNarrative : integer);
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
  memDeliveryNotes.Lines.Clear;
  memDeliveryNotes.Lines.Text := aStr;
end;

procedure TfrmwtRPPOrder.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (qryPOLine.FieldByName('Sales_Order').Asinteger <> 0);

  if qryPOLine.FieldByName('Reference').Asstring <> '' then
    qrlblCustomerReference.caption := qryPOLine.FieldByName('Customer_Name').Asstring + ' - Reference: ' + qryPOLine.FieldByName('Reference').Asstring
  else
    qrlblCustomerReference.caption := qryPOLine.FieldByName('Customer_Name').Asstring;
end;

procedure TfrmwtRPPOrder.qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblNett.Caption := 'Page to Follow';

end;

procedure TfrmwtRPPOrder.qrbPurchaseOrderFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rNettTotal: double;
  sNett, sVat: string;
begin
  rNettTotal := rLineTotal;

  sNett := formatfloat('0.00',rNettTotal);
  sVat := formatfloat('0.00',rVATTotal);

  qrlblNett.caption := formatfloat('#,##0.00',rNettTotal);
end;

procedure TfrmwtRPPOrder.qrbPurchaseOrderFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if not bPreview and (qryReport.FieldByName('Purchase_Order_Status').asinteger < 20) then
    begin
      with qryUpPO do
        begin
          close;
          parambyname('Purchase_Order').asinteger := qryReport.fieldbyname('Purchase_Order').asinteger;
          parambyname('Purchase_Order_Status').asinteger := 20;
          execsql
        end;
    end;

end;

end.
