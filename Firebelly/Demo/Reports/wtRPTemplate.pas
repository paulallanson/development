unit wtRPTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, QrExport, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPTemplate = class(TForm)
    qrpDetails: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TFDQuery;
    qrbPageHeader: TQRBand;
    dtsReport: TDataSource;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qrlblTemplate: TQRLabel;
    qryEndUser: TFDQuery;
    gtQRFilters1: TgtQRFilters;
    gtQRLabel4: TQRLabel;
    qrmSiteAddress: TQRMemo;
    qryQuote: TFDQuery;
    gtQRLabel6: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRLabel7: TQRLabel;
    gtQRDBText3: TQRDBText;
    gtQRShape3: TQRShape;
    qrlblSalesOrder: TQRLabel;
    qrlblSalesOrderNo: TQRDBText;
    gtQRShape4: TQRShape;
    gtQRShape5: TQRShape;
    gtQRShape6: TQRShape;
    gtQRLabel1: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRShape7: TQRShape;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    QRShape7: TQRShape;
    gtQRLabel11: TQRLabel;
    QRShape1: TQRShape;
    gtQRShape9: TQRShape;
    gtQRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    gtQRShape10: TQRShape;
    gtQRLabel14: TQRLabel;
    gtQRShape20: TQRShape;
    gtQRLabel21: TQRLabel;
    gtQRShape22: TQRShape;
    gtQRShape23: TQRShape;
    gtQRShape24: TQRShape;
    gtQRShape25: TQRShape;
    gtQRShape26: TQRShape;
    gtQRLabel22: TQRLabel;
    gtQRLabel23: TQRLabel;
    gtQRLabel24: TQRLabel;
    gtQRLabel25: TQRLabel;
    gtQRShape27: TQRShape;
    gtQRLabel26: TQRLabel;
    gtQRShape28: TQRShape;
    gtQRLabel27: TQRLabel;
    gtQRLabel28: TQRLabel;
    gtQRShape29: TQRShape;
    gtQRShape30: TQRShape;
    gtQRLabel29: TQRLabel;
    gtQRLabel30: TQRLabel;
    gtQRShape31: TQRShape;
    gtQRLabel31: TQRLabel;
    gtQRShape32: TQRShape;
    gtQRShape33: TQRShape;
    gtQRShape34: TQRShape;
    gtQRLabel32: TQRLabel;
    gtQRLabel34: TQRLabel;
    gtQRShape36: TQRShape;
    gtQRShape37: TQRShape;
    gtQRLabel35: TQRLabel;
    gtQRShape38: TQRShape;
    gtQRLabel37: TQRLabel;
    gtQRShape39: TQRShape;
    gtQRShape35: TQRShape;
    gtQRLabel36: TQRLabel;
    gtQRShape42: TQRShape;
    qrmAddress: TQRMemo;
    gtQRShape12: TQRShape;
    gtQRLabel16: TQRLabel;
    qrlblQuoteLabel: TQRLabel;
    qrlblQuote: TQRDBText;
    gtQRSysData1: TQRSysData;
    qrlblEdgeDetail: TQRLabel;
    qrlblThickness: TQRLabel;
    qrlblUpstand: TQRLabel;
    qrlblOfficeContact: TQRLabel;
    qryQuoteEdge: TFDQuery;
    qryQuoteThickness: TFDQuery;
    qryQuoteUpstand: TFDQuery;
    gtQRShape8: TQRShape;
    gtQRShape45: TQRShape;
    gtQRShape1: TQRShape;
    gtQRLabel5: TQRLabel;
    gtQRShape2: TQRShape;
    gtQRShape11: TQRShape;
    gtQRLabel12: TQRLabel;
    qrlblColour: TQRLabel;
    qryQuoteElement: TFDQuery;
    gtQRShape13: TQRShape;
    gtQRLabel13: TQRLabel;
    gtQRLabel15: TQRLabel;
    qrlblCustomerPhone: TQRLabel;
    qrlblCustomerEmail: TQRLabel;
    qriHeadLogo: TQRImage;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
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
  qrbPageHeader.Enabled := true;

  with qryCompany do
    begin
      close;
      open;
    end;

end;

procedure TfrmwtRPTemplate.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  with qryQuoteElement do
    begin
      close;
      parambyname('Quote').asinteger := qryReport.fieldbyname('Quote').asinteger;
      open;
    end;

  with qryQuoteEdge do
    begin
      close;
      parambyname('Quote').asinteger := qryReport.fieldbyname('Quote').asinteger;
      open;
    end;

  with qryQuoteThickness do
    begin
      close;
      parambyname('Quote').asinteger := qryReport.fieldbyname('Quote').asinteger;
      open;
    end;

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

      qrlblCustomerPhone.caption := qryAddress.fieldbyname('Telephone_Number').asstring;
      qrlblCustomerEmail.caption := qryAddress.fieldbyname('Email_Address').asstring;
    end
  else
    begin
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;
      dtsAddress.dataset := qryCustomer;

      qrlblCustomerPhone.caption := qryCustomer.fieldbyname('Telephone_Number').asstring;
      qrlblCustomerEmail.caption := qryCustomer.fieldbyname('Email_Address').asstring;
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

procedure TfrmwtRPTemplate.qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qryReport.fieldbyname('Sales_order').asinteger = 0 then
    begin
      qrlblSalesOrder.Enabled := false;
      qrlblSalesOrderNo.enabled := qrlblSalesOrder.Enabled;

      qrlblQuoteLabel.Left := 15;
      qrlblQuote.Left := 156;
    end;

  qrlblColour.caption := qryQuoteElement.fieldbyname('Colour').asstring + ' ' + qryQuoteElement.fieldbyname('Material_Type_Desc').asstring;
  qrlblEdgeDetail.caption := qryQuoteEdge.fieldbyname('Description').asstring;
  qrlblThickness.caption := qryQuoteThickness.fieldbyname('Thickness_mm').asstring;
  qrlblUpstand.caption := qryQuoteUpstand.fieldbyname('Thickness_mm').asstring;
  qrlblOfficeContact.caption := qryReport.fieldbyname('Account_Manager_Name').asstring;

end;

procedure TfrmwtRPTemplate.FormCreate(Sender: TObject);
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

end.
