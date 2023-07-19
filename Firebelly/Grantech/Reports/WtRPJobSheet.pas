unit wtRPJobSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrCtrls;

type
  TfrmwtRPJobSheet = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TQuery;
    qryQElements: TQuery;
    dtsReport: TDataSource;
    qryQCutOuts: TQuery;
    qryQEdges: TQuery;
    qryQExtras: TQuery;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qrbPageHeader: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel15: TQRLabel;
    qryCompanyAddress: TQuery;
    QRShape2: TQRShape;
    gtQRShape1: TQRShape;
    gtQRShape3: TQRShape;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRShape15: TQRShape;
    gtQRShape17: TQRShape;
    gtQRLabel13: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRShape19: TQRShape;
    gtQRLabel16: TQRLabel;
    gtQRLabel3: TQRLabel;
    qrlblContact: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRDBText3: TQRDBText;
    gtQRDBText4: TQRDBText;
    gtQRShape9: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape35: TQRShape;
    gtQRLabel2: TQRLabel;
    gtQRShape4: TQRShape;
    gtQRLabel4: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    gtQRShape7: TQRShape;
    gtQRShape18: TQRShape;
    gtQRLabel11: TQRLabel;
    gtQRShape8: TQRShape;
    gtQRLabel12: TQRLabel;
    gtQRShape6: TQRShape;
    gtQRShape11: TQRShape;
    gtQRShape12: TQRShape;
    gtQRShape13: TQRShape;
    gtQRLabel14: TQRLabel;
    gtQRShape14: TQRShape;
    gtQRShape22: TQRShape;
    gtQRLabel15: TQRLabel;
    gtQRShape23: TQRShape;
    gtQRShape24: TQRShape;
    gtQRShape26: TQRShape;
    gtQRLabel17: TQRLabel;
    gtQRLabel18: TQRLabel;
    gtQRLabel19: TQRLabel;
    gtQRShape27: TQRShape;
    gtQRShape28: TQRShape;
    gtQRShape29: TQRShape;
    gtQRShape30: TQRShape;
    gtQRShape31: TQRShape;
    gtQRShape32: TQRShape;
    gtQRShape5: TQRShape;
    gtQRLabel6: TQRLabel;
    gtQRLabel20: TQRLabel;
    gtQRShape35: TQRShape;
    gtQRShape37: TQRShape;
    gtQRShape38: TQRShape;
    gtQRShape40: TQRShape;
    gtQRLabel21: TQRLabel;
    gtQRShape41: TQRShape;
    gtQRShape42: TQRShape;
    gtQRShape43: TQRShape;
    gtQRShape44: TQRShape;
    gtQRLabel22: TQRLabel;
    gtQRLabel23: TQRLabel;
    gtQRLabel24: TQRLabel;
    gtQRLabel25: TQRLabel;
    gtQRShape49: TQRShape;
    gtQRShape50: TQRShape;
    gtQRShape51: TQRShape;
    gtQRShape54: TQRShape;
    gtQRShape55: TQRShape;
    gtQRLabel26: TQRLabel;
    gtQRLabel27: TQRLabel;
    gtQRShape56: TQRShape;
    gtQRShape57: TQRShape;
    gtQRShape58: TQRShape;
    gtQRShape60: TQRShape;
    gtQRShape61: TQRShape;
    gtQRShape63: TQRShape;
    gtQRLabel28: TQRLabel;
    gtQRShape64: TQRShape;
    gtQRShape65: TQRShape;
    gtQRShape67: TQRShape;
    gtQRLabel29: TQRLabel;
    gtQRShape68: TQRShape;
    gtQRShape71: TQRShape;
    gtQRLabel30: TQRLabel;
    gtQRLabel31: TQRLabel;
    gtQRLabel32: TQRLabel;
    gtQRShape72: TQRShape;
    gtQRShape73: TQRShape;
    gtQRShape74: TQRShape;
    gtQRShape75: TQRShape;
    gtQRShape76: TQRShape;
    gtQRShape77: TQRShape;
    gtQRLabel33: TQRLabel;
    gtQRShape78: TQRShape;
    gtQRShape79: TQRShape;
    gtQRLabel34: TQRLabel;
    gtQRLabel35: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRLabel36: TQRLabel;
    gtQRShape10: TQRShape;
    gtQRLabel37: TQRLabel;
    gtQRShape20: TQRShape;
    gtQRLabel38: TQRLabel;
    gtQRShape21: TQRShape;
    gtQRLabel39: TQRLabel;
    gtQRShape25: TQRShape;
    gtQRShape80: TQRShape;
    gtQRLabel40: TQRLabel;
    gtQRLabel41: TQRLabel;
    gtQRLabel42: TQRLabel;
    gtQRLabel43: TQRLabel;
    gtQRShape36: TQRShape;
    gtQRLabel44: TQRLabel;
    gtQRLabel45: TQRLabel;
    gtQRShape33: TQRShape;
    gtQRLabel46: TQRLabel;
    gtQRShape34: TQRShape;
    gtQRLabel47: TQRLabel;
    gtQRShape39: TQRShape;
    gtQRShape81: TQRShape;
    gtQRShape45: TQRShape;
    gtQRLabel48: TQRLabel;
    gtQRShape46: TQRShape;
    gtQRLabel49: TQRLabel;
    gtQRShape47: TQRShape;
    gtQRShape48: TQRShape;
    gtQRShape52: TQRShape;
    gtQRLabel50: TQRLabel;
    gtQRLabel51: TQRLabel;
    gtQRLabel52: TQRLabel;
    gtQRLabel53: TQRLabel;
    gtQRLabel54: TQRLabel;
    gtQRShape53: TQRShape;
    gtQRLabel55: TQRLabel;
    gtQRShape59: TQRShape;
    gtQRShape62: TQRShape;
    gtQRShape66: TQRShape;
    gtQRShape69: TQRShape;
    gtQRShape16: TQRShape;
    gtQRShape70: TQRShape;
    gtQRShape82: TQRShape;
    gtQRShape83: TQRShape;
    gtQRLabel56: TQRLabel;
    gtQRShape84: TQRShape;
    gtQRShape85: TQRShape;
    gtQRLabel57: TQRLabel;
    gtQRShape86: TQRShape;
    gtQRLabel58: TQRLabel;
    gtQRShape87: TQRShape;
    gtQRLabel59: TQRLabel;
    gtQRLabel60: TQRLabel;
    gtQRShape88: TQRShape;
    gtQRLabel61: TQRLabel;
    gtQRShape89: TQRShape;
    gtQRLabel62: TQRLabel;
    gtQRShape90: TQRShape;
    gtQRShape91: TQRShape;
    gtQRShape92: TQRShape;
    gtQRShape93: TQRShape;
    gtQRShape2: TQRShape;
    gtQRLabel63: TQRLabel;
    gtQRShape94: TQRShape;
    qrlblYourPhone: TQRLabel;
    QRLabel1: TQRLabel;
    gtQRShape95: TQRShape;
    gtQRLabel64: TQRLabel;
    gtQRShape96: TQRShape;
    gtQRLabel65: TQRLabel;
    gtQRLabel66: TQRLabel;
    gtQRShape97: TQRShape;
    gtQRShape98: TQRShape;
    gtQRLabel67: TQRLabel;
    gtQRLabel68: TQRLabel;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
  public
    Job: integer;
    bPreview: boolean;
    bPrintLogo: boolean;
    bAccountsCopy: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPJobSheet: TfrmwtRPJobSheet;

implementation

{$R *.dfm}

function TfrmwtRPJobSheet.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPJobSheet.qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  icount: integer;
  TempAddress: string;
begin
  sWorktop := '';
  with qryCompany do
    begin
      close;
      open;
    end;
end;

procedure TfrmwtRPJobSheet.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal: real;
  i: integer;
begin
  if qryReport.FieldByName('Address').AsInteger <> 0 then
    begin
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
  if trim(qryReport.FieldByName('Contact_Name').AsString) <> '' then
    qrlblContact.caption := qryReport.FieldByName('Contact_Name').AsString
  else
    qrlblContact.caption := '';

  qrlblYourPhone.caption := dtsAddress.DataSet.fieldbyname('Telephone_Number').asstring;
end;

function TfrmwtRPJobSheet.BuildNotes(const iNotes: integer): string;
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

end.
