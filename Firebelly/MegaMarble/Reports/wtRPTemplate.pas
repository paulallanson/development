unit wtRPTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, gtQrExport, gtQrCtrls,
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
    qrlblTemplate: TgtQRLabel;
    qryEndUser: TFDQuery;
    gtQRFilters1: TgtQRFilters;
    QRLabel14: TgtQRLabel;
    QRLabel15: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    qrmSiteAddress: TgtQRMemo;
    qryQuote: TFDQuery;
    QRLabel16: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    QRLabel17: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRLabel6: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel7: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    gtQRShape3: TgtQRShape;
    qrlblSalesOrder: TgtQRLabel;
    qrlblSalesOrderNo: TgtQRDBText;
    gtQRShape4: TgtQRShape;
    gtQRShape5: TgtQRShape;
    gtQRShape6: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRShape7: TgtQRShape;
    gtQRLabel9: TgtQRLabel;
    gtQRLabel10: TgtQRLabel;
    QRShape7: TgtQRShape;
    gtQRLabel11: TgtQRLabel;
    QRShape1: TgtQRShape;
    gtQRLabel12: TgtQRLabel;
    gtQRShape8: TgtQRShape;
    gtQRLabel13: TgtQRLabel;
    gtQRShape9: TgtQRShape;
    gtQRLabel2: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    gtQRShape10: TgtQRShape;
    gtQRShape11: TgtQRShape;
    gtQRLabel14: TgtQRLabel;
    gtQRLabel15: TgtQRLabel;
    gtQRShape13: TgtQRShape;
    gtQRShape18: TgtQRShape;
    gtQRLabel20: TgtQRLabel;
    gtQRShape19: TgtQRShape;
    gtQRShape20: TgtQRShape;
    gtQRShape21: TgtQRShape;
    gtQRLabel21: TgtQRLabel;
    gtQRShape22: TgtQRShape;
    gtQRShape23: TgtQRShape;
    gtQRShape24: TgtQRShape;
    gtQRShape25: TgtQRShape;
    gtQRShape26: TgtQRShape;
    gtQRLabel22: TgtQRLabel;
    gtQRLabel23: TgtQRLabel;
    gtQRLabel24: TgtQRLabel;
    gtQRLabel25: TgtQRLabel;
    gtQRShape27: TgtQRShape;
    gtQRLabel26: TgtQRLabel;
    gtQRShape28: TgtQRShape;
    gtQRLabel27: TgtQRLabel;
    gtQRLabel28: TgtQRLabel;
    gtQRShape29: TgtQRShape;
    gtQRShape30: TgtQRShape;
    gtQRLabel29: TgtQRLabel;
    gtQRLabel30: TgtQRLabel;
    gtQRShape31: TgtQRShape;
    gtQRLabel31: TgtQRLabel;
    gtQRShape32: TgtQRShape;
    gtQRShape33: TgtQRShape;
    gtQRShape34: TgtQRShape;
    gtQRLabel32: TgtQRLabel;
    gtQRLabel34: TgtQRLabel;
    gtQRShape36: TgtQRShape;
    gtQRShape37: TgtQRShape;
    gtQRLabel35: TgtQRLabel;
    gtQRShape38: TgtQRShape;
    gtQRLabel37: TgtQRLabel;
    gtQRShape39: TgtQRShape;
    gtQRShape35: TgtQRShape;
    gtQRShape40: TgtQRShape;
    gtQRShape41: TgtQRShape;
    gtQRLabel36: TgtQRLabel;
    gtQRLabel38: TgtQRLabel;
    gtQRLabel33: TgtQRLabel;
    gtQRShape42: TgtQRShape;
    gtQRShape43: TgtQRShape;
    gtQRShape44: TgtQRShape;
    gtQRShape45: TgtQRShape;
    gtQRLabel39: TgtQRLabel;
    gtQRShape46: TgtQRShape;
    gtQRLabel40: TgtQRLabel;
    gtQRShape47: TgtQRShape;
    gtQRLabel41: TgtQRLabel;
    gtQRShape48: TgtQRShape;
    gtQRLabel42: TgtQRLabel;
    gtQRShape49: TgtQRShape;
    gtQRShape50: TgtQRShape;
    gtQRShape51: TgtQRShape;
    gtQRShape53: TgtQRShape;
    gtQRShape54: TgtQRShape;
    gtQRShape55: TgtQRShape;
    gtQRShape56: TgtQRShape;
    gtQRLabel43: TgtQRLabel;
    gtQRLabel44: TgtQRLabel;
    gtQRShape52: TgtQRShape;
    gtQRLabel45: TgtQRLabel;
    gtQRLabel46: TgtQRLabel;
    gtQRShape57: TgtQRShape;
    gtQRShape58: TgtQRShape;
    gtQRLabel47: TgtQRLabel;
    gtQRShape59: TgtQRShape;
    gtQRShape60: TgtQRShape;
    gtQRLabel49: TgtQRLabel;
    gtQRLabel50: TgtQRLabel;
    gtQRShape63: TgtQRShape;
    gtQRShape64: TgtQRShape;
    gtQRLabel51: TgtQRLabel;
    gtQRShape65: TgtQRShape;
    gtQRShape66: TgtQRShape;
    gtQRLabel52: TgtQRLabel;
    gtQRLabel53: TgtQRLabel;
    gtQRShape67: TgtQRShape;
    gtQRShape68: TgtQRShape;
    gtQRShape69: TgtQRShape;
    gtQRShape70: TgtQRShape;
    gtQRLabel54: TgtQRLabel;
    gtQRLabel55: TgtQRLabel;
    gtQRShape61: TgtQRShape;
    gtQRShape62: TgtQRShape;
    gtQRShape71: TgtQRShape;
    gtQRLabel48: TgtQRLabel;
    gtQRLabel56: TgtQRLabel;
    qrmAddress: TgtQRMemo;
    gtQRShape72: TgtQRShape;
    QRLabel4: TgtQRLabel;
    gtQRShape73: TgtQRShape;
    gtQRLabel5: TgtQRLabel;
    gtQRLabel57: TgtQRLabel;
    gtQRShape74: TgtQRShape;
    gtQRShape12: TgtQRShape;
    gtQRLabel16: TgtQRLabel;
    gtQRShape14: TgtQRShape;
    qrlblQuoteLabel: TgtQRLabel;
    qrlblQuote: TgtQRDBText;
    gtQRSysData1: TgtQRSysData;
    qrlblEdgeDetail: TgtQRLabel;
    qrlblThickness: TgtQRLabel;
    qrlblUpstand: TgtQRLabel;
    qrlblOfficeContact: TgtQRLabel;
    qryQuoteEdge: TFDQuery;
    qryQuoteThickness: TFDQuery;
    qryQuoteUpstand: TFDQuery;
    gtQRLabel17: TgtQRLabel;
    gtQRShape15: TgtQRShape;
    gtQRLabel18: TgtQRLabel;
    gtQRShape16: TgtQRShape;
    qrrchTextNotes: TgtQRRichText;
    gtQRLabel19: TgtQRLabel;
    gtQRLabel58: TgtQRLabel;
    gtQRShape17: TgtQRShape;
    gtQRShape75: TgtQRShape;
    gtQRLabel59: TgtQRLabel;
    gtQRShape76: TgtQRShape;
    gtQRLabel60: TgtQRLabel;
    gtQRLabel61: TgtQRLabel;
    gtQRShape77: TgtQRShape;
    gtQRShape78: TgtQRShape;
    gtQRLabel62: TgtQRLabel;
    gtQRLabel63: TgtQRLabel;
    gtQRLabel64: TgtQRLabel;
    gtQRLabel65: TgtQRLabel;
    gtQRShape79: TgtQRShape;
    gtQRShape80: TgtQRShape;
    gtQRShape81: TgtQRShape;
    qriHeadLogo: TgtQRImage;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
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
  sWorktop := '';
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

  qrlblEdgeDetail.caption := qryQuoteEdge.fieldbyname('Description').asstring;
  qrlblThickness.caption := qryQuoteThickness.fieldbyname('Thickness_mm').asstring;
  qrlblUpstand.caption := qryQuoteUpstand.fieldbyname('Thickness_mm').asstring;
  qrlblOfficeContact.caption := qryReport.fieldbyname('Account_Manager_Name').asstring;

  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Extra_Notes').asinteger));
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
