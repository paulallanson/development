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
    qrbPageHeader: TQRBand;
    dtsReport: TDataSource;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qrlblTemplate: TQRLabel;
    qryEndUser: TQuery;
    gtQRFilters1: TgtQRFilters;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    gtQRLabel4: TQRLabel;
    qrmSiteAddress: TQRMemo;
    qryQuote: TQuery;
    QRLabel16: TQRLabel;
    gtQRShape1: TQRShape;
    QRLabel17: TQRLabel;
    gtQRShape2: TQRShape;
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
    QRDBText5: TQRDBText;
    gtQRLabel3: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRShape7: TQRShape;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    QRShape7: TQRShape;
    gtQRLabel11: TQRLabel;
    QRShape1: TQRShape;
    gtQRLabel12: TQRLabel;
    gtQRShape8: TQRShape;
    gtQRLabel13: TQRLabel;
    gtQRShape9: TQRShape;
    gtQRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    gtQRShape10: TQRShape;
    gtQRShape11: TQRShape;
    gtQRLabel14: TQRLabel;
    gtQRLabel15: TQRLabel;
    gtQRShape13: TQRShape;
    gtQRShape18: TQRShape;
    gtQRLabel20: TQRLabel;
    gtQRShape19: TQRShape;
    gtQRShape20: TQRShape;
    gtQRShape21: TQRShape;
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
    gtQRShape40: TQRShape;
    gtQRShape41: TQRShape;
    gtQRLabel36: TQRLabel;
    gtQRLabel38: TQRLabel;
    gtQRLabel33: TQRLabel;
    gtQRShape42: TQRShape;
    gtQRShape43: TQRShape;
    gtQRShape44: TQRShape;
    gtQRShape45: TQRShape;
    gtQRLabel39: TQRLabel;
    gtQRShape46: TQRShape;
    gtQRLabel40: TQRLabel;
    gtQRShape47: TQRShape;
    gtQRLabel41: TQRLabel;
    gtQRShape48: TQRShape;
    gtQRLabel42: TQRLabel;
    gtQRShape49: TQRShape;
    gtQRShape50: TQRShape;
    gtQRShape51: TQRShape;
    gtQRShape53: TQRShape;
    gtQRShape54: TQRShape;
    gtQRShape55: TQRShape;
    gtQRShape56: TQRShape;
    gtQRLabel43: TQRLabel;
    gtQRLabel44: TQRLabel;
    gtQRShape52: TQRShape;
    gtQRLabel45: TQRLabel;
    gtQRLabel46: TQRLabel;
    gtQRShape57: TQRShape;
    gtQRShape58: TQRShape;
    gtQRLabel47: TQRLabel;
    gtQRShape59: TQRShape;
    gtQRShape60: TQRShape;
    gtQRLabel49: TQRLabel;
    gtQRLabel50: TQRLabel;
    gtQRShape63: TQRShape;
    gtQRShape64: TQRShape;
    gtQRLabel51: TQRLabel;
    gtQRShape65: TQRShape;
    gtQRShape66: TQRShape;
    gtQRLabel52: TQRLabel;
    gtQRLabel53: TQRLabel;
    gtQRShape67: TQRShape;
    gtQRShape68: TQRShape;
    gtQRShape69: TQRShape;
    gtQRShape70: TQRShape;
    gtQRLabel54: TQRLabel;
    gtQRLabel55: TQRLabel;
    gtQRShape61: TQRShape;
    gtQRShape62: TQRShape;
    gtQRShape71: TQRShape;
    gtQRLabel48: TQRLabel;
    gtQRLabel56: TQRLabel;
    qrmAddress: TQRMemo;
    gtQRShape72: TQRShape;
    QRLabel4: TQRLabel;
    gtQRShape73: TQRShape;
    gtQRLabel5: TQRLabel;
    gtQRLabel57: TQRLabel;
    gtQRShape74: TQRShape;
    gtQRShape12: TQRShape;
    gtQRLabel16: TQRLabel;
    gtQRShape14: TQRShape;
    qrlblQuoteLabel: TQRLabel;
    qrlblQuote: TQRDBText;
    gtQRSysData1: TgtQRSysData;
    qrlblEdgeDetail: TQRLabel;
    qrlblThickness: TQRLabel;
    qrlblUpstand: TQRLabel;
    qrlblOfficeContact: TQRLabel;
    qryQuoteEdge: TQuery;
    qryQuoteThickness: TQuery;
    qryQuoteUpstand: TQuery;
    gtQRLabel17: TQRLabel;
    gtQRShape15: TQRShape;
    gtQRLabel18: TQRLabel;
    gtQRShape16: TQRShape;
    qrrchTextNotes: TQRRichText;
    gtQRLabel19: TQRLabel;
    gtQRLabel58: TQRLabel;
    gtQRShape17: TQRShape;
    gtQRShape75: TQRShape;
    gtQRLabel59: TQRLabel;
    gtQRShape76: TQRShape;
    gtQRLabel60: TQRLabel;
    gtQRLabel61: TQRLabel;
    gtQRShape77: TQRShape;
    gtQRShape78: TQRShape;
    gtQRLabel62: TQRLabel;
    gtQRLabel63: TQRLabel;
    gtQRLabel64: TQRLabel;
    gtQRLabel65: TQRLabel;
    gtQRShape79: TQRShape;
    gtQRShape80: TQRShape;
    gtQRShape81: TQRShape;
    qriHeadLogo: TQRImage;
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
