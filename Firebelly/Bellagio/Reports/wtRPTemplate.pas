unit wtRPTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrExport, gtQrCtrls;

type
  TfrmwtRPTemplate = class(TForm)
    qrpDetails: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TQuery;
    dtsReport: TDataSource;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qryEndUser: TQuery;
    gtQRFilters1: TgtQRFilters;
    qryQuote: TQuery;
    qryQuoteEdge: TQuery;
    qryQuoteThickness: TQuery;
    qryQuoteUpstand: TQuery;
    QRBand1: TQRBand;
    gtQRSysData1: TgtQRSysData;
    gtQRShape14: TgtQRShape;
    QRShape1: TgtQRShape;
    qrlblTemplate: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    qrmSiteAddress: TgtQRMemo;
    gtQRLabel6: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel7: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    qriHeadLogo: TgtQRImage;
    gtQRShape9: TgtQRShape;
    QRLabel5: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    qrmAddress: TgtQRMemo;
    gtQRShape73: TgtQRShape;
    qrlblSalesOrder: TgtQRLabel;
    qrlblSalesOrderNo: TgtQRDBText;
    gtQRShape4: TgtQRShape;
    gtQRRichText1: TgtQRRichText;
    gtQRLabel11: TgtQRLabel;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    gtQRShape3: TgtQRShape;
    gtQRShape5: TgtQRShape;
    gtQRShape6: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel15: TgtQRLabel;
    gtQRShape13: TgtQRShape;
    qrlblEdgeDetail: TgtQRLabel;
    qrlblColour: TgtQRLabel;
    gtQRShape8: TgtQRShape;
    gtQRLabel9: TgtQRLabel;
    gtQRLabel10: TgtQRLabel;
    gtQRRichText2: TgtQRRichText;
    gtQRShape33: TgtQRShape;
    gtQRShape7: TgtQRShape;
    gtQRLabel12: TgtQRLabel;
    gtQRLabel13: TgtQRLabel;
    qrySalesOrder: TQuery;
    qrsdSOLines: TQRSubDetail;
    qrySOLine: TQuery;
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
    gtQRLabel33: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    gtQRLabel34: TgtQRLabel;
    gtQRLabel35: TgtQRLabel;
    gtQRDBText4: TgtQRDBText;
    gtQRLabel36: TgtQRLabel;
    qriHeadlogo1: TgtQRImage;
    gtQRShape42: TgtQRShape;
    gtQRShape43: TgtQRShape;
    gtQRShape44: TgtQRShape;
    gtQRLabel37: TgtQRLabel;
    gtQRLabel38: TgtQRLabel;
    gtQRDBText5: TgtQRDBText;
    gtQRDBText6: TgtQRDBText;
    qrlblCustomerName: TgtQRLabel;
    qrbAdditionalItemsFooter: TQRBand;
    qrrchApplianceDetails: TgtQRMemo;
    qrrchTextNotes: TgtQRMemo;
    qrlblAdditionalItems: TgtQRLabel;
    gtQRMemo6: TgtQRMemo;
    gtQRLabel40: TgtQRLabel;
    qrlblInstallEmail: TgtQRLabel;
    qryQuoteMaterial: TQuery;
    gtQRRichText9: TgtQRRichText;
    gtQRRichText12: TgtQRRichText;
    gtQRRichText10: TgtQRRichText;
    gtQRLabel39: TgtQRLabel;
    gtQRMemo4: TgtQRMemo;
    gtQRMemo5: TgtQRMemo;
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

uses wtDataModule;

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
begin
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
