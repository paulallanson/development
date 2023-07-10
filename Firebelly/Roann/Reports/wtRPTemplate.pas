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
    qrlblTemplate: TgtQRLabel;
    qryEndUser: TQuery;
    gtQRFilters1: TgtQRFilters;
    qrmSiteAddress: TgtQRMemo;
    qryQuote: TQuery;
    gtQRLabel6: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel7: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    gtQRShape3: TgtQRShape;
    gtQRShape4: TgtQRShape;
    gtQRShape5: TgtQRShape;
    gtQRShape6: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRShape7: TgtQRShape;
    gtQRLabel9: TgtQRLabel;
    gtQRLabel10: TgtQRLabel;
    QRShape7: TgtQRShape;
    gtQRLabel11: TgtQRLabel;
    gtQRShape9: TgtQRShape;
    gtQRLabel2: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    gtQRShape10: TgtQRShape;
    gtQRLabel14: TgtQRLabel;
    gtQRShape22: TgtQRShape;
    gtQRShape23: TgtQRShape;
    gtQRShape24: TgtQRShape;
    gtQRShape25: TgtQRShape;
    gtQRShape26: TgtQRShape;
    gtQRLabel22: TgtQRLabel;
    gtQRLabel23: TgtQRLabel;
    gtQRLabel24: TgtQRLabel;
    gtQRLabel25: TgtQRLabel;
    gtQRShape35: TgtQRShape;
    gtQRLabel36: TgtQRLabel;
    qrmAddress: TgtQRMemo;
    qrlblQuoteLabel: TgtQRLabel;
    qrlblQuote: TgtQRDBText;
    gtQRSysData1: TgtQRSysData;
    qrlblEdgeDetail: TgtQRLabel;
    qrlblUpstand: TgtQRLabel;
    qrlblOfficeContact: TgtQRLabel;
    qryQuoteEdge: TQuery;
    qryQuoteThickness: TQuery;
    qryQuoteUpstand: TQuery;
    gtQRShape45: TgtQRShape;
    gtQRShape1: TgtQRShape;
    gtQRLabel5: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRShape11: TgtQRShape;
    gtQRLabel12: TgtQRLabel;
    qrlblColour: TgtQRLabel;
    qryQuoteElement: TQuery;
    gtQRShape13: TgtQRShape;
    gtQRLabel13: TgtQRLabel;
    gtQRLabel15: TgtQRLabel;
    qrlblCustomerPhone: TgtQRLabel;
    qrlblCustomerEmail: TgtQRLabel;
    gtQRShape14: TgtQRShape;
    gtQRShape15: TgtQRShape;
    gtQRShape16: TgtQRShape;
    qrlblSalesOrder: TgtQRLabel;
    qrlblSalesOrderNo: TgtQRDBText;
    gtQRLabel4: TgtQRLabel;
    gtQRShape17: TgtQRShape;
    gtQRLabel17: TgtQRLabel;
    gtQRLabel18: TgtQRLabel;
    gtQRLabel19: TgtQRLabel;
    gtQRShape19: TgtQRShape;
    gtQRLabel20: TgtQRLabel;
    gtQRLabel33: TgtQRLabel;
    gtQRLabel38: TgtQRLabel;
    gtQRShape21: TgtQRShape;
    gtQRShape40: TgtQRShape;
    gtQRShape41: TgtQRShape;
    gtQRLabel39: TgtQRLabel;
    gtQRLabel40: TgtQRLabel;
    gtQRLabel41: TgtQRLabel;
    gtQRShape42: TgtQRShape;
    gtQRLabel43: TgtQRLabel;
    gtQRLabel44: TgtQRLabel;
    gtQRLabel45: TgtQRLabel;
    gtQRShape43: TgtQRShape;
    gtQRShape44: TgtQRShape;
    gtQRLabel46: TgtQRLabel;
    gtQRLabel47: TgtQRLabel;
    gtQRShape12: TgtQRShape;
    gtQRLabel16: TgtQRLabel;
    gtQRShape18: TgtQRShape;
    gtQRShape33: TgtQRShape;
    gtQRShape34: TgtQRShape;
    gtQRShape36: TgtQRShape;
    gtQRShape37: TgtQRShape;
    gtQRShape38: TgtQRShape;
    gtQRShape39: TgtQRShape;
    gtQRLabel32: TgtQRLabel;
    gtQRLabel34: TgtQRLabel;
    gtQRShape47: TgtQRShape;
    gtQRShape46: TgtQRShape;
    gtQRLabel35: TgtQRLabel;
    gtQRShape8: TgtQRShape;
    gtQRShape20: TgtQRShape;
    gtQRLabel21: TgtQRLabel;
    gtQRLabel26: TgtQRLabel;
    gtQRLabel27: TgtQRLabel;
    gtQRShape27: TgtQRShape;
    gtQRShape28: TgtQRShape;
    gtQRShape29: TgtQRShape;
    gtQRShape30: TgtQRShape;
    gtQRLabel28: TgtQRLabel;
    gtQRLabel29: TgtQRLabel;
    gtQRLabel30: TgtQRLabel;
    gtQRLabel31: TgtQRLabel;
    gtQRLabel37: TgtQRLabel;
    gtQRShape31: TgtQRShape;
    gtQRLabel42: TgtQRLabel;
    gtQRShape32: TgtQRShape;
    gtQRMemo1: TgtQRMemo;
    gtQRLabel48: TgtQRLabel;
    gtQRShape48: TgtQRShape;
    gtQRLabel49: TgtQRLabel;
    gtQRLabel50: TgtQRLabel;
    qrlblTemplateDate: TgtQRLabel;
    qrlblFittingDate: TgtQRLabel;
    qryGetSalesOrder: TQuery;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel51: TgtQRLabel;
    qrlblColour2: TgtQRLabel;
    gtQRLabel53: TgtQRLabel;
    qryQuoteMaterial: TQuery;
    qryQuoteSlabs: TQuery;
    qrlblSlab: TgtQRLabel;
    qrlblSlab2: TgtQRLabel;
    qrlblUpstandHeight: TgtQRLabel;
    qryCustomerContact: TQuery;
    gtQRLabel52: TgtQRLabel;
    gtQRLabel54: TgtQRLabel;
    qrlblCustomerName: TgtQRLabel;
    qrlblCustomerMobile: TgtQRLabel;
    qrrchTextNotes: TgtQRMemo;
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

      qrlblCustomerName.caption := qryReport.fieldbyname('Contact_Name').asstring;
      qrlblCustomerMobile.caption := '';
      qrlblCustomerPhone.caption := qryAddress.fieldbyname('Telephone_Number').asstring;
      qrlblCustomerEmail.caption := qryAddress.fieldbyname('Email_Address').asstring;
    end
  else
    begin
      qryCustomer.close;
      qryCustomer.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
      qryCustomer.open;
      dtsAddress.dataset := qryCustomer;

      qrlblCustomerName.caption := qryReport.fieldbyname('Contact_Name').asstring;
      qrlblCustomerMobile.caption := '';
      qrlblCustomerPhone.caption := qryCustomer.fieldbyname('Telephone_Number').asstring;
      qrlblCustomerEmail.caption := qryCustomer.fieldbyname('Email_Address').asstring;

      if qryReport.FieldByName('Contact_no').asinteger <> 0 then
        begin
          qryCustomerContact.close;
          qryCustomerContact.parambyname('Customer').asinteger := qryReport.FieldByName('Customer').AsInteger;
          qryCustomerContact.parambyname('Contact_no').asinteger := qryReport.FieldByName('Contact_No').AsInteger;
          qryCustomerContact.open;

          qrlblCustomerName.caption := qryCustomerContact.fieldbyname('Contact_Name').asstring;
          qrlblCustomerMobile.caption := qryCustomerContact.fieldbyname('Mobile_Number').asstring;
          qrlblCustomerPhone.caption := qryCustomerContact.fieldbyname('Telephone_Number').asstring;
          qrlblCustomerEmail.caption := qryCustomerContact.fieldbyname('Email_Address').asstring;
        end
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
  qrlblColour2.caption := '';

  qrlblSlab.Caption := '';
  qrlblSlab2.caption := '';

  with qryQuotematerial do
    begin
      icount := 1;
      while EOF <> true do
        begin
          {Get Slab detail for this material and thickness}
          qryQuoteSlabs.close;
          qryQuoteSlabs.parambyname('Quote').asinteger := qryQuoteMaterial.fieldbyname('Quote').asinteger;
          qryQuoteSlabs.parambyname('Worktop').asinteger := qryQuoteMaterial.fieldbyname('Worktop').asinteger;
          qryQuoteSlabs.parambyname('Thickness').asinteger := qryQuoteMaterial.fieldbyname('Thickness').asinteger;
          qryQuoteSlabs.Open;

          if qryQuoteSlabs.recordcount > 0 then
            begin
              if iCount = 1 then
                begin
                  qrlblColour.caption := qryQuoteMaterial.fieldbyname('Thickness_mm').asstring + ' ' + qryQuoteMaterial.fieldbyname('Colour').asstring
                      + ' ' + qryQuoteMaterial.fieldbyname('Material_Type_Desc').asstring;

                  if qryQuoteSlabs.fieldbyname('Quantity').asinteger > 0 then
                    qrlblSlab.caption := inttostr(qryQuoteSlabs.fieldbyname('Quantity').asinteger) + ' No. (' + inttostr(qryQuoteSlabs.fieldbyname('Length').asinteger)
                      + 'mm x ' + inttostr(qryQuoteSlabs.fieldbyname('Depth').asinteger) + 'mm)'
                  else
                    qrlblSlab.caption := '';
                end
              else
                begin
                  qrlblColour2.caption := qryQuoteMaterial.fieldbyname('Thickness_mm').asstring + ' ' + qryQuoteMaterial.fieldbyname('Colour').asstring
                      + ' ' + qryQuoteMaterial.fieldbyname('Material_Type_Desc').asstring;

                  if qryQuoteSlabs.fieldbyname('Quantity').asinteger > 0 then
                    qrlblSlab2.caption := inttostr(qryQuoteSlabs.fieldbyname('Quantity').asinteger) + ' No. (' + inttostr(qryQuoteSlabs.fieldbyname('Length').asinteger)
                      + 'mm x ' + inttostr(qryQuoteSlabs.fieldbyname('Depth').asinteger) + 'mm)'
                  else
                    qrlblSlab2.caption := '';
                end;

              iCount := icount + 1;

              if iCount = 3 then
                break;
            end
          else
            begin
              qrlblColour2.caption := qryQuoteMaterial.fieldbyname('Thickness_mm').asstring + ' ' + qryQuoteMaterial.fieldbyname('Colour').asstring
                      + ' ' + qryQuoteMaterial.fieldbyname('Material_Type_Desc').asstring;
            end;
          next;
        end;
    end;

//  qrlblColour.caption := qryQuoteThickness.fieldbyname('Thickness_mm').asstring + ' ' + qryQuoteElement.fieldbyname('Colour').asstring
//                      + ' ' + qryQuoteElement.fieldbyname('Material_Type_Desc').asstring;
  qrlblEdgeDetail.caption := qryQuoteEdge.fieldbyname('Description').asstring;
//  qrlblThickness.caption := qryQuoteThickness.fieldbyname('Thickness_mm').asstring;
  qrlblUpstand.caption := qryQuoteUpstand.fieldbyname('Thickness_mm').asstring;

  if qryQuoteUpstand.fieldbyname('Depth').asstring = '' then
    qrlblUpstandHeight.caption := ''
  else
    qrlblUpstandHeight.caption := qryQuoteUpstand.fieldbyname('Depth').asstring + 'mm';

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
//    qriHeadlogo.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
//    qriHeadLogo.Picture.Bitmap.PixelFormat := pfDevice;
  except
  end;
end;

end.
