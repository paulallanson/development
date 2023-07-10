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
    QRDBText2: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    QRLabel15: TgtQRLabel;
    qryCompanyAddress: TQuery;
    QRShape2: TgtQRShape;
    gtQRShape1: TgtQRShape;
    gtQRShape3: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    gtQRShape15: TgtQRShape;
    gtQRShape17: TgtQRShape;
    gtQRLabel13: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRShape19: TgtQRShape;
    gtQRLabel16: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    qrlblContact: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    gtQRDBText4: TgtQRDBText;
    gtQRShape9: TgtQRShape;
    QRLabel22: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    QRShape35: TgtQRShape;
    gtQRLabel2: TgtQRLabel;
    gtQRShape4: TgtQRShape;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel9: TgtQRLabel;
    gtQRLabel10: TgtQRLabel;
    gtQRShape7: TgtQRShape;
    gtQRShape18: TgtQRShape;
    gtQRLabel11: TgtQRLabel;
    gtQRShape8: TgtQRShape;
    gtQRLabel12: TgtQRLabel;
    gtQRShape6: TgtQRShape;
    gtQRShape11: TgtQRShape;
    gtQRShape12: TgtQRShape;
    gtQRShape13: TgtQRShape;
    gtQRLabel14: TgtQRLabel;
    gtQRShape14: TgtQRShape;
    gtQRShape22: TgtQRShape;
    gtQRLabel15: TgtQRLabel;
    gtQRShape23: TgtQRShape;
    gtQRShape24: TgtQRShape;
    gtQRShape26: TgtQRShape;
    gtQRLabel17: TgtQRLabel;
    gtQRLabel18: TgtQRLabel;
    gtQRLabel19: TgtQRLabel;
    gtQRShape27: TgtQRShape;
    gtQRShape28: TgtQRShape;
    gtQRShape29: TgtQRShape;
    gtQRShape30: TgtQRShape;
    gtQRShape31: TgtQRShape;
    gtQRShape32: TgtQRShape;
    gtQRShape5: TgtQRShape;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel20: TgtQRLabel;
    gtQRShape35: TgtQRShape;
    gtQRShape37: TgtQRShape;
    gtQRShape38: TgtQRShape;
    gtQRShape40: TgtQRShape;
    gtQRLabel21: TgtQRLabel;
    gtQRShape41: TgtQRShape;
    gtQRShape42: TgtQRShape;
    gtQRShape43: TgtQRShape;
    gtQRShape44: TgtQRShape;
    gtQRLabel22: TgtQRLabel;
    gtQRLabel23: TgtQRLabel;
    gtQRLabel24: TgtQRLabel;
    gtQRLabel25: TgtQRLabel;
    gtQRShape49: TgtQRShape;
    gtQRShape50: TgtQRShape;
    gtQRShape51: TgtQRShape;
    gtQRShape54: TgtQRShape;
    gtQRShape55: TgtQRShape;
    gtQRLabel26: TgtQRLabel;
    gtQRLabel27: TgtQRLabel;
    gtQRShape56: TgtQRShape;
    gtQRShape57: TgtQRShape;
    gtQRShape58: TgtQRShape;
    gtQRShape60: TgtQRShape;
    gtQRShape61: TgtQRShape;
    gtQRShape63: TgtQRShape;
    gtQRLabel28: TgtQRLabel;
    gtQRShape64: TgtQRShape;
    gtQRShape65: TgtQRShape;
    gtQRShape67: TgtQRShape;
    gtQRLabel29: TgtQRLabel;
    gtQRShape68: TgtQRShape;
    gtQRShape71: TgtQRShape;
    gtQRLabel30: TgtQRLabel;
    gtQRLabel31: TgtQRLabel;
    gtQRLabel32: TgtQRLabel;
    gtQRShape72: TgtQRShape;
    gtQRShape73: TgtQRShape;
    gtQRShape74: TgtQRShape;
    gtQRShape75: TgtQRShape;
    gtQRShape76: TgtQRShape;
    gtQRShape77: TgtQRShape;
    gtQRLabel33: TgtQRLabel;
    gtQRShape78: TgtQRShape;
    gtQRShape79: TgtQRShape;
    gtQRLabel34: TgtQRLabel;
    gtQRLabel35: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel36: TgtQRLabel;
    gtQRShape10: TgtQRShape;
    gtQRLabel37: TgtQRLabel;
    gtQRShape20: TgtQRShape;
    gtQRLabel38: TgtQRLabel;
    gtQRShape21: TgtQRShape;
    gtQRLabel39: TgtQRLabel;
    gtQRShape25: TgtQRShape;
    gtQRShape80: TgtQRShape;
    gtQRLabel40: TgtQRLabel;
    gtQRLabel41: TgtQRLabel;
    gtQRLabel42: TgtQRLabel;
    gtQRLabel43: TgtQRLabel;
    gtQRShape36: TgtQRShape;
    gtQRLabel44: TgtQRLabel;
    gtQRLabel45: TgtQRLabel;
    gtQRShape33: TgtQRShape;
    gtQRLabel46: TgtQRLabel;
    gtQRShape34: TgtQRShape;
    gtQRLabel47: TgtQRLabel;
    gtQRShape39: TgtQRShape;
    gtQRShape81: TgtQRShape;
    gtQRShape45: TgtQRShape;
    gtQRLabel48: TgtQRLabel;
    gtQRShape46: TgtQRShape;
    gtQRLabel49: TgtQRLabel;
    gtQRShape47: TgtQRShape;
    gtQRShape48: TgtQRShape;
    gtQRShape52: TgtQRShape;
    gtQRLabel50: TgtQRLabel;
    gtQRLabel51: TgtQRLabel;
    gtQRLabel52: TgtQRLabel;
    gtQRLabel53: TgtQRLabel;
    gtQRLabel54: TgtQRLabel;
    gtQRShape53: TgtQRShape;
    gtQRLabel55: TgtQRLabel;
    gtQRShape59: TgtQRShape;
    gtQRShape62: TgtQRShape;
    gtQRShape66: TgtQRShape;
    gtQRShape69: TgtQRShape;
    gtQRShape16: TgtQRShape;
    gtQRShape70: TgtQRShape;
    gtQRShape82: TgtQRShape;
    gtQRShape83: TgtQRShape;
    gtQRLabel56: TgtQRLabel;
    gtQRShape84: TgtQRShape;
    gtQRShape85: TgtQRShape;
    gtQRLabel57: TgtQRLabel;
    gtQRShape86: TgtQRShape;
    gtQRLabel58: TgtQRLabel;
    gtQRShape87: TgtQRShape;
    gtQRLabel59: TgtQRLabel;
    gtQRLabel60: TgtQRLabel;
    gtQRShape88: TgtQRShape;
    gtQRLabel61: TgtQRLabel;
    gtQRShape89: TgtQRShape;
    gtQRLabel62: TgtQRLabel;
    gtQRShape90: TgtQRShape;
    gtQRShape91: TgtQRShape;
    gtQRShape92: TgtQRShape;
    gtQRShape93: TgtQRShape;
    gtQRShape2: TgtQRShape;
    gtQRLabel63: TgtQRLabel;
    gtQRShape94: TgtQRShape;
    qrlblYourPhone: TgtQRLabel;
    QRLabel1: TgtQRLabel;
    gtQRShape95: TgtQRShape;
    gtQRLabel64: TgtQRLabel;
    gtQRShape96: TgtQRShape;
    gtQRLabel65: TgtQRLabel;
    gtQRLabel66: TgtQRLabel;
    gtQRShape97: TgtQRShape;
    gtQRShape98: TgtQRShape;
    gtQRLabel67: TgtQRLabel;
    gtQRLabel68: TgtQRLabel;
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
