unit wtRPTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, Printers, QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPTemplate = class(TForm)
    qrpDetails: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TFDQuery;
    dtsReport: TDataSource;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qryEndUser: TFDQuery;
    qryQuote: TFDQuery;
    qryQuoteEdge: TFDQuery;
    qryQuoteThickness: TFDQuery;
    qryQuoteUpstand: TFDQuery;
    QRBand1: TQRBand;
    gtQRSysData1: TQRSysData;
    gtQRShape14: TQRShape;
    QRShape1: TQRShape;
    qrlblTemplate: TQRLabel;
    gtQRLabel4: TQRLabel;
    qrmSiteAddress: TQRMemo;
    gtQRLabel6: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRLabel7: TQRLabel;
    gtQRDBText3: TQRDBText;
    qriHeadLogo: TQRImage;
    gtQRShape9: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    qrmAddress: TQRMemo;
    gtQRShape73: TQRShape;
    qrlblSalesOrder: TQRLabel;
    qrlblSalesOrderNo: TQRDBText;
    gtQRShape4: TQRShape;
    gtQRRichText1: TQRRichText;
    gtQRLabel11: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRShape3: TQRShape;
    gtQRShape5: TQRShape;
    gtQRShape6: TQRShape;
    gtQRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    gtQRLabel3: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRLabel15: TQRLabel;
    gtQRShape13: TQRShape;
    qrlblEdgeDetail: TQRLabel;
    qrlblColour: TQRLabel;
    gtQRShape8: TQRShape;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    gtQRRichText2: TQRRichText;
    gtQRShape33: TQRShape;
    gtQRShape7: TQRShape;
    gtQRLabel12: TQRLabel;
    gtQRLabel13: TQRLabel;
    qrySalesOrder: TFDQuery;
    qrsdSOLines: TQRSubDetail;
    qrySOLine: TFDQuery;
    qrySOLineSales_Order: TIntegerField;
    qrySOLineSales_order_Line_no: TIntegerField;
    qrySOLineJob: TFloatField;
    qrySOLineUnit_price: TFloatField;
    qrySOLineQuantity: TIntegerField;
    qrySOLineSell_Unit: TIntegerField;
    qrySOLineTotal_Price: TFloatField;
    qrySOLineNett_Price: TFloatField;
    qrySOLineDiscount_Value: TFloatField;
    qrySOLineInstallation_price: TFloatField;
    qrySOLineSurvey_price: TFloatField;
    qrySOLineDelivery_Price: TFloatField;
    qrySOLineDescription: TStringField;
    qrySOLineProduct: TIntegerField;
    qrySOLineVat: TIntegerField;
    qrySOLineVat_Rate: TFloatField;
    qrySOLineVAT_Description: TStringField;
    qrySOLineQuote: TIntegerField;
    qrySOLineMarkup_Value: TFloatField;
    dtsSOLine: TDataSource;
    qrbAdditionalItemsHeader: TQRBand;
    gtQRLabel33: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRLabel34: TQRLabel;
    gtQRLabel35: TQRLabel;
    gtQRDBText4: TQRDBText;
    gtQRLabel36: TQRLabel;
    qriHeadlogo1: TQRImage;
    gtQRShape42: TQRShape;
    gtQRShape43: TQRShape;
    gtQRShape44: TQRShape;
    gtQRLabel37: TQRLabel;
    gtQRLabel38: TQRLabel;
    gtQRDBText5: TQRDBText;
    gtQRDBText6: TQRDBText;
    qrlblCustomerName: TQRLabel;
    qrbAdditionalItemsFooter: TQRBand;
    qrrchApplianceDetails: TQRMemo;
    qrrchTextNotes: TQRMemo;
    qrlblAdditionalItems: TQRLabel;
    gtQRMemo6: TQRMemo;
    gtQRLabel40: TQRLabel;
    qrlblInstallEmail: TQRLabel;
    qryQuoteMaterial: TFDQuery;
    gtQRRichText9: TQRRichText;
    gtQRRichText12: TQRRichText;
    gtQRRichText10: TQRRichText;
    gtQRLabel39: TQRLabel;
    gtQRMemo4: TQRMemo;
    gtQRMemo5: TQRMemo;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrbAdditionalItemsHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgQuoteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbAdditionalItemsFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    iSalesOrder: integer;
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
  public
    SalesOrder: integer;
    Quote: integer;
    bPreview: boolean;
    bEndUser: boolean;
    function Getdetails: integer;
    function GetQuotedetails: integer;
  end;

var
  frmwtRPTemplate: TfrmwtRPTemplate;

implementation

uses wtDataModule, qrprntr, AllCommon;

{$R *.dfm}

function TfrmwtRPTemplate.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Sales_Order').asinteger := self.SalesOrder;
      open;
      result := recordcount;
    end;
end;

function TfrmwtRPTemplate.GetQuotedetails: integer;
begin
  with qryReport do
    begin
      sql.Clear;
      sql.Text := qryQuote.sql.Text;
      close;
      parambyname('Quote').asinteger := Quote;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPTemplate.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.copies := Copies;   {set the number of copies }
  qrpDetails.PrinterSettings.PaperSize := Size;   {set the number of copies }

//  qrbPageHeader.Enabled := true;
  iSalesOrder := 0;

  with qrySOLine do
    begin
      close;
      open;
    end;

  with qryCompany do
    begin
      close;
      open;
    end;

  if Quote > 0 then
    begin
      qrlblSalesOrder.caption := 'Quote';
      qrlblSalesOrderNo.DataField := 'Quote';
      qrbAdditionalItemsHeader.Enabled := false;
    end
  else
    begin
      qrlblSalesOrder.caption := 'Sales Order';
      qrlblSalesOrderNo.DataField := 'Sales_Order';
    end;
end;

procedure TfrmwtRPTemplate.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
  sNewLogo: string;
begin
  qrsdSOLines.enabled := (qryReport.fieldbyname('Sales_Order').asinteger <> iSalesOrder);

  sWorktop := '';

  with qryQuoteEdge do
    begin
      close;
      parambyname('Quote').asinteger := qryReport.fieldbyname('Quote').asinteger;
      open;
    end;

  with qryQuoteMaterial do
    begin
      close;
      parambyname('Quote').asinteger := qryReport.fieldbyname('Quote').asinteger;
      open;
    end;

(*  with qryQuoteThickness do
    begin
      close;
      parambyname('Quote').asinteger := qryReport.fieldbyname('Quote').asinteger;
      open;
    end;

*)
  with qryQuoteUpstand do
    begin
      close;
      parambyname('Quote').asinteger := qryReport.fieldbyname('Quote').asinteger;
      open;
    end;

  qrmAddress.Lines.Clear;
  qrmSiteAddress.lines.clear;

  if qryReport.FieldByName('Address').AsInteger <> 0 then
    begin
//    read customer details first to get vat rate
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;

      qryAddress.close;
      qryAddress.parambyname('Address').asinteger := qryReport.FieldByName('Address').AsInteger;
      qryAddress.open;
      dtsAddress.dataset := qryAddress;
    end
  else
    begin
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;
      dtsAddress.dataset := qryCustomer;
    end;
  if not bEndUser then
    begin
      for i := 1 to 6 do
        begin
          if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
            qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
        end;
//      qrlblTelephone.caption := dtsAddress.DataSet.fieldbyname('Telephone_Number').asstring
    end
  else
    begin
      qryEndUser.close;
      qryEndUser.parambyname('End_User').asinteger := qryReport.FieldByName('End_User').AsInteger;
      qryEndUser.open;
      dtsAddress.dataset := qryEndUser;

      for i := 1 to 6 do
        begin
          if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
            qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
        end;
    end;

  qrmSiteAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  if qryReport.fieldbyname('Sales_order').asinteger = 0 then
    begin
//      qrlblSalesOrder.Enabled := false;
//      qrlblSalesOrderNo.enabled := qrlblSalesOrder.Enabled;

//      qrlblQuoteLabel.Left := 15;
//      qrlblQuote.Left := 156;
    end;

  qrlblColour.caption := qryQuoteMaterial.fieldbyname('Thickness_mm').asstring + ' ' + qryQuoteMaterial.fieldbyname('Colour').asstring
                      + ' ' + qryQuoteMaterial.fieldbyname('Material_Type_Desc').asstring;
  qrlblEdgeDetail.caption := qryQuoteEdge.fieldbyname('Description').asstring;
//  qrlblThickness.caption := qryQuoteThickness.fieldbyname('Thickness_mm').asstring;
//  qrlblUpstand.caption := qryQuoteUpstand.fieldbyname('Thickness_mm').asstring;
//  qrlblOfficeContact.caption := qryReport.fieldbyname('Account_Manager_Name').asstring;
  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Extra_Notes').asinteger));

  with qrySalesOrder do
    begin
      close;
      parambyname('Sales_Order').asinteger := qryReport.fieldbyname('Sales_Order').AsInteger;
      open;
      qrrchApplianceDetails.lines.clear;
      qrrchApplianceDetails.Lines.add(fieldbyname('Appliance_Details').asstring);

      qrlblInstallEmail.caption := fieldbyname('Email_Address').asstring;
    end;

  if dtmdlWorktops.UseRevenueCentres then
    begin
      if qryReport.FieldByName('Revenue_Centre').AsInteger <> 0 then
        begin
          sNewLogo := dtmdlWorktops.LoadRevenueCentreLogo(qryReport.FieldByName('Revenue_Centre').AsInteger);
          qriHeadlogo.picture.loadfromfile(sNewLogo);
          qriHeadlogo1.picture.loadfromfile(sNewLogo);
        end
      else
        begin
          qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
          qriHeadlogo1.picture.loadfromfile('wtHeadLogo.bmp');
        end;
    end;
end;

function TfrmwtRPTemplate.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPTemplate.FormCreate(Sender: TObject);
var
  LocalDir: string;
begin
  try
    LocalDir := extractfilepath(application.exename);
    qriHeadlogo.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
    qriHeadLogo.Picture.Bitmap.PixelFormat := pfDevice;
    qriHeadlogo1.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
    qriHeadLogo1.Picture.Bitmap.PixelFormat := pfDevice;
  except
  end;
end;

procedure TfrmwtRPTemplate.qrbAdditionalItemsHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustomerName.caption := qrmAddress.lines.Text;
end;

procedure TfrmwtRPTemplate.qrgQuoteAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  iSalesOrder := qryReport.fieldbyname('Sales_Order').asinteger;
end;

procedure TfrmwtRPTemplate.qrbAdditionalItemsFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblAdditionalItems.enabled := not (qrySOLine.recordcount > 0);
end;

end.
