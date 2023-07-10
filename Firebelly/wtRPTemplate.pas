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
    qryEndUser: TQuery;
    gtQRFilters1: TgtQRFilters;
    qryQuote: TQuery;
    qrlblTemplate: TgtQRLabel;
    QRShape1: TgtQRShape;
    gtQRLabel8: TgtQRLabel;
    gtQRShape3: TgtQRShape;
    QRLabel6: TgtQRLabel;
    gtQRShape4: TgtQRShape;
    gtQRShape5: TgtQRShape;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    gtQRShape6: TgtQRShape;
    QRShape14: TgtQRShape;
    gtQRLabel9: TgtQRLabel;
    QRShape2: TgtQRShape;
    qrmAddress: TgtQRMemo;
    QRLabel2: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    QRLabel5: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    gtQRLabel1: TgtQRLabel;
    QRShape12: TgtQRShape;
    QRShape13: TgtQRShape;
    gtQRLabel2: TgtQRLabel;
    QRLabel1: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    QRLabel13: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    QRLabel15: TgtQRLabel;
    QRShape3: TgtQRShape;
    QRShape4: TgtQRShape;
    QRShape5: TgtQRShape;
    QRShape6: TgtQRShape;
    QRShape7: TgtQRShape;
    QRShape8: TgtQRShape;
    QRShape9: TgtQRShape;
    QRShape10: TgtQRShape;
    QRShape11: TgtQRShape;
    qrlblSalesOrder: TgtQRLabel;
    qrlblSalesOrderNo: TgtQRDBText;
    gtQRLabel4: TgtQRLabel;
    qrmSiteAddress: TgtQRMemo;
    gtQRLabel5: TgtQRLabel;
    qrlblTelephone: TgtQRLabel;
    QRLabel16: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    QRLabel17: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRLabel6: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel7: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    qrrchTextNotes: TgtQRRichText;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
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

  sWorktop := '';
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
      if trim(qryReport.FieldByName('Contact_Name').AsString) <> '' then
        qrmAddress.Lines.Add(qryReport.FieldByName('Contact_Name').AsString);
      for i := 1 to 6 do
        begin
          if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
            qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
        end;
      qrlblTelephone.caption := dtsAddress.DataSet.fieldbyname('Telephone_Number').asstring
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
    end;

  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Extra_Notes').asinteger));
end;

end.
