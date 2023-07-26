unit wtRPPOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls,
  QrExport, qrprntr, printers, AllCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPPOrder = class(TForm)
    qrpDetails: TQuickRep;
    qrgPurchaseOrder: TQRGroup;
    qryReport: TFDQuery;
    qrbPageHeader: TQRBand;
    dtsReport: TDataSource;
    qrsdPOLines: TQRSubDetail;
    qrySupplier: TFDQuery;
    qrbPOFooter: TQRBand;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qrlblSOCaption: TQRLabel;
    qrmAddress: TQRMemo;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    qrlblNett: TQRLabel;
    QRLabel1: TQRLabel;
    qryPOLine: TFDQuery;
    QRDBText7: TQRDBText;
    qrlblTotalCost: TQRLabel;
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
    gtQRShape2: TQRShape;
    qrmSiteAddress: TQRMemo;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    gtQRShape9: TQRShape;
    gtQRShape10: TQRShape;
    gtQRShape11: TQRShape;
    gtQRLabel4: TQRLabel;
    QRShape9: TQRShape;
    memDeliveryNotes: TQRMemo;
    qrshpPayment: TQRShape;
    qryCompanyAddress: TFDQuery;
    GetNarrSQL: TFDQuery;
    qriHeadLogo: TQRImage;
    dtsPOLine: TDataSource;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRLabel9: TQRLabel;
    gtQRDBText3: TQRDBText;
    gtQRDBText4: TQRDBText;
    gtQRLabel10: TQRLabel;
    gtQRDBText5: TQRDBText;
    dtsAddress: TDataSource;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgPurchaseOrderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPOFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdPOLinesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    function BuildNotes(const iNotes: integer): string;
    procedure BuildDeliveryNotes(const iNarrative: integer);
  public
    PurchaseOrder: integer;
    bDetailed: boolean;
    bPreview: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bEndUser: boolean;
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

  qrmSiteAddress.Lines.clear;
  tempAddress := '';

  for icount := 0 to 4 do
    begin
      if trim(dtsAddress.DataSet.fields[iCount].asstring) <> '' then
        qrmSiteAddress.Lines.Add(trim(qryCompanyAddress.fields[iCount].asstring))
    end;
end;

procedure TfrmwtRPPOrder.qrbPOFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rBalance, rToPay, rDeposit: real;
  sNett, sVat: string;
begin
  rNettTotal := rLineTotal;

  sNett := formatfloat('0.00',rNettTotal);
  sVat := formatfloat('0.00',rVATTotal);

  qrlblNett.caption := formatfloat('#,##0.00',rNettTotal);

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
  unitPrice, totalPrice, fullLineTotal: real;
begin
  unitPrice  := 0.00;
  totalPrice := 0.00;

  totalPrice := unitPrice/qryPOLine.FieldByName('Cost_Unit').Asinteger * qryPOLine.FieldByName('Quantity').Asinteger;

  fullLineTotal := totalPrice;

  qrlblTotalCost.caption := formatfloat('0.00',fullLineTotal);

  rLineTotal := rLineTotal + totalPrice;

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

end.
