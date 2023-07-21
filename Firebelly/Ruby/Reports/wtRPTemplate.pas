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
    qrlblTemplate: TQRLabel;
    qryEndUser: TFDQuery;
    gtQRFilters1: TgtQRFilters;
    qrmSiteAddress: TQRMemo;
    qryQuote: TFDQuery;
    gtQRLabel6: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRLabel7: TQRLabel;
    gtQRDBText3: TQRDBText;
    gtQRShape3: TQRShape;
    gtQRShape4: TQRShape;
    gtQRShape5: TQRShape;
    gtQRShape6: TQRShape;
    gtQRLabel1: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRShape7: TQRShape;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    QRShape7: TQRShape;
    gtQRLabel11: TQRLabel;
    gtQRShape9: TQRShape;
    gtQRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    gtQRShape10: TQRShape;
    gtQRLabel14: TQRLabel;
    gtQRShape22: TQRShape;
    gtQRShape23: TQRShape;
    gtQRShape24: TQRShape;
    gtQRShape25: TQRShape;
    gtQRShape26: TQRShape;
    gtQRLabel22: TQRLabel;
    gtQRLabel23: TQRLabel;
    gtQRLabel24: TQRLabel;
    gtQRLabel25: TQRLabel;
    gtQRShape35: TQRShape;
    gtQRLabel36: TQRLabel;
    qrmAddress: TQRMemo;
    qrlblQuoteLabel: TQRLabel;
    qrlblQuote: TQRDBText;
    gtQRSysData1: TQRSysData;
    qrlblEdgeDetail: TQRLabel;
    qrlblUpstand: TQRLabel;
    qrlblOfficeContact: TQRLabel;
    qryQuoteEdge: TFDQuery;
    qryQuoteThickness: TFDQuery;
    qryQuoteUpstand: TFDQuery;
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
    gtQRShape14: TQRShape;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    qrlblSalesOrder: TQRLabel;
    qrlblSalesOrderNo: TQRDBText;
    gtQRLabel4: TQRLabel;
    gtQRShape17: TQRShape;
    gtQRLabel17: TQRLabel;
    gtQRLabel18: TQRLabel;
    gtQRLabel19: TQRLabel;
    gtQRShape19: TQRShape;
    gtQRLabel20: TQRLabel;
    gtQRLabel33: TQRLabel;
    gtQRLabel38: TQRLabel;
    gtQRShape21: TQRShape;
    gtQRShape40: TQRShape;
    gtQRShape41: TQRShape;
    gtQRLabel39: TQRLabel;
    gtQRLabel40: TQRLabel;
    gtQRLabel41: TQRLabel;
    gtQRShape42: TQRShape;
    gtQRLabel43: TQRLabel;
    gtQRLabel44: TQRLabel;
    gtQRLabel45: TQRLabel;
    gtQRShape43: TQRShape;
    gtQRShape44: TQRShape;
    gtQRLabel46: TQRLabel;
    gtQRLabel47: TQRLabel;
    gtQRShape12: TQRShape;
    gtQRLabel16: TQRLabel;
    gtQRShape18: TQRShape;
    gtQRShape33: TQRShape;
    gtQRShape34: TQRShape;
    gtQRShape36: TQRShape;
    gtQRShape37: TQRShape;
    gtQRShape38: TQRShape;
    gtQRShape39: TQRShape;
    gtQRLabel32: TQRLabel;
    gtQRLabel34: TQRLabel;
    gtQRShape47: TQRShape;
    gtQRShape46: TQRShape;
    gtQRLabel35: TQRLabel;
    gtQRLabel49: TQRLabel;
    gtQRLabel50: TQRLabel;
    qrlblTemplateDate: TQRLabel;
    qrlblFittingDate: TQRLabel;
    qryGetSalesOrder: TFDQuery;
    gtQRLabel8: TQRLabel;
    gtQRShape49: TQRShape;
    qryQuoteMaterial: TFDQuery;
    gtQRLabel51: TQRLabel;
    gtQRShape50: TQRShape;
    gtQRLabel52: TQRLabel;
    gtQRLabel53: TQRLabel;
    gtQRShape51: TQRShape;
    gtQRLabel54: TQRLabel;
    gtQRLabel55: TQRLabel;
    qrlblSplashback: TQRLabel;
    gtQRLabel57: TQRLabel;
    gtQRShape52: TQRShape;
    gtQRLabel58: TQRLabel;
    gtQRLabel59: TQRLabel;
    gtQRShape53: TQRShape;
    gtQRLabel60: TQRLabel;
    gtQRShape54: TQRShape;
    gtQRLabel56: TQRLabel;
    gtQRShape8: TQRShape;
    gtQRShape20: TQRShape;
    gtQRLabel21: TQRLabel;
    gtQRShape27: TQRShape;
    gtQRLabel26: TQRLabel;
    gtQRShape28: TQRShape;
    gtQRShape29: TQRShape;
    gtQRShape30: TQRShape;
    gtQRMemo1: TQRMemo;
    gtQRShape55: TQRShape;
    gtQRLabel27: TQRLabel;
    gtQRShape56: TQRShape;
    gtQRLabel28: TQRLabel;
    gtQRShape57: TQRShape;
    gtQRShape58: TQRShape;
    gtQRLabel29: TQRLabel;
    gtQRShape31: TQRShape;
    gtQRShape32: TQRShape;
    gtQRLabel30: TQRLabel;
    gtQRShape48: TQRShape;
    gtQRShape59: TQRShape;
    gtQRLabel31: TQRLabel;
    gtQRShape60: TQRShape;
    gtQRLabel37: TQRLabel;
    gtQRShape61: TQRShape;
    gtQRShape62: TQRShape;
    gtQRLabel42: TQRLabel;
    gtQRLabel48: TQRLabel;
    gtQRShape63: TQRShape;
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

uses AllCommon;

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
  with qryQuoteMaterial do
    begin
      close;
      parambyname('Quote').asinteger := qryReport.fieldbyname('Quote').asinteger;
      open;
    end;

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
var
  iCount: integer;
begin
  if qryReport.fieldbyname('Sales_order').asinteger = 0 then
    begin
      qrlblSalesOrder.Enabled := false;
      qrlblSalesOrderNo.enabled := qrlblSalesOrder.Enabled;

      qrlblQuoteLabel.Left := 15;
      qrlblQuote.Left := 156;
    end;

  {This code has been added because there seems to be some corruption in the qryReport and couldn't get the Date_Required field}
  with qryGetSalesOrder do
    begin
      close;
      parambyname('Sales_order').asinteger := qryReport.fieldbyname('Sales_Order').asinteger;
      open;
      if recordcount > 0 then
        begin
          qrlblTemplateDate.caption := padateStr(fieldbyname('Template_date').asdatetime);
          qrlblFittingDate.caption := padateStr(fieldbyname('Date_Required').asdatetime);
        end
      else
        begin
          qrlblTemplateDate.caption := '';
          qrlblFittingDate.caption := '';
        end
    end;

  qrlblColour.Caption := '';
(*  with qryQuotematerial do
    begin
      icount := 1;
      while EOF <> true do
        begin
          if iCount = 1 then
            qrlblColour.caption := qryQuoteMaterial.fieldbyname('Thickness_mm').asstring + ' ' + qryQuoteMaterial.fieldbyname('Colour').asstring
                      + ' ' + qryQuoteMaterial.fieldbyname('Material_Type_Desc').asstring
          else
            qrlblColour2.caption := qryQuoteMaterial.fieldbyname('Thickness_mm').asstring + ' ' + qryQuoteMaterial.fieldbyname('Colour').asstring
                      + ' ' + qryQuoteMaterial.fieldbyname('Material_Type_Desc').asstring;
          next;
          iCount := icount + 1;
          if iCount = 3 then
            break;
        end;
    end;
*)
  qrlblColour.caption := qryQuoteThickness.fieldbyname('Thickness_mm').asstring + ' ' + qryQuoteElement.fieldbyname('Colour').asstring
                      + ' ' + qryQuoteElement.fieldbyname('Material_Type_Desc').asstring;
  qrlblEdgeDetail.caption := qryQuoteEdge.fieldbyname('Description').asstring;
//  qrlblThickness.caption := qryQuoteThickness.fieldbyname('Thickness_mm').asstring;
  qrlblUpstand.caption := qryQuoteUpstand.fieldbyname('Thickness_mm').asstring;
  qrlblOfficeContact.caption := qryReport.fieldbyname('Account_Manager_Name').asstring;
  qrlblSplashback.caption := '';

end;

procedure TfrmwtRPTemplate.FormCreate(Sender: TObject);
var
  LocalDir: string;
begin
  try
    LocalDir := extractfilepath(application.exename);
//    qriHeadlogo.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
//    qriHeadLogo.Picture.Bitmap.PixelFormat := pfDevice;
  except
  end;
end;

end.
