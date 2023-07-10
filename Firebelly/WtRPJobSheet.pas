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
    QRShape26: TgtQRShape;
    QRShape27: TgtQRShape;
    QRShape28: TgtQRShape;
    QRShape29: TgtQRShape;
    QRLabel1: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    QRLabel2: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    QRLabel5: TgtQRLabel;
    QRShape1: TgtQRShape;
    QRLabel4: TgtQRLabel;
    QRShape2: TgtQRShape;
    QRLabel9: TgtQRLabel;
    qrrchTextInstallAddress: TgtQRRichText;
    QRLabel12: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    QRLabel15: TgtQRLabel;
    QRLabel16: TgtQRLabel;
    QRLabel19: TgtQRLabel;
    QRLabel20: TgtQRLabel;
    QRLabel21: TgtQRLabel;
    QRShape3: TgtQRShape;
    QRShape5: TgtQRShape;
    QRLabel22: TgtQRLabel;
    qrlblContact: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRShape7: TgtQRShape;
    QRLabel13: TgtQRLabel;
    QRShape8: TgtQRShape;
    QRShape4: TgtQRShape;
    QRLabel11: TgtQRLabel;
    QRLabel17: TgtQRLabel;
    QRLabel18: TgtQRLabel;
    QRShape6: TgtQRShape;
    QRShape9: TgtQRShape;
    QRLabel23: TgtQRLabel;
    QRShape10: TgtQRShape;
    QRLabel24: TgtQRLabel;
    QRLabel25: TgtQRLabel;
    QRShape12: TgtQRShape;
    QRLabel26: TgtQRLabel;
    QRLabel27: TgtQRLabel;
    QRLabel28: TgtQRLabel;
    QRShape13: TgtQRShape;
    QRShape14: TgtQRShape;
    QRShape15: TgtQRShape;
    QRShape16: TgtQRShape;
    QRShape17: TgtQRShape;
    QRShape18: TgtQRShape;
    QRSysData1: TgtQRSysData;
    QRLabel31: TgtQRLabel;
    QRLabel32: TgtQRLabel;
    QRShape22: TgtQRShape;
    QRLabel33: TgtQRLabel;
    QRShape23: TgtQRShape;
    QRLabel34: TgtQRLabel;
    QRShape24: TgtQRShape;
    QRShape25: TgtQRShape;
    QRShape30: TgtQRShape;
    QRShape31: TgtQRShape;
    QRShape32: TgtQRShape;
    QRShape33: TgtQRShape;
    memAddress: TgtQRRichText;
    QRShape34: TgtQRShape;
    QRShape35: TgtQRShape;
    qrlblGrossPrice: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    QRShape36: TgtQRShape;
    QRLabel35: TgtQRLabel;
    QRShape37: TgtQRShape;
    QRLabel6: TgtQRLabel;
    QRShape19: TgtQRShape;
    QRLabel36: TgtQRLabel;
    QRShape38: TgtQRShape;
    QRLabel10: TgtQRLabel;
    QRShape20: TgtQRShape;
    QRLabel29: TgtQRLabel;
    QRShape21: TgtQRShape;
    QRLabel30: TgtQRLabel;
    QRLabel37: TgtQRLabel;
    QRShape39: TgtQRShape;
    QRShape40: TgtQRShape;
    QRLabel38: TgtQRLabel;
    QRLabel39: TgtQRLabel;
    QRShape41: TgtQRShape;
    qriHeadLogo: TgtQRImage;
    QRShape42: TgtQRShape;
    QRLabel40: TgtQRLabel;
    QRShape43: TgtQRShape;
    QRShape44: TgtQRShape;
    QRShape45: TgtQRShape;
    QRLabel41: TgtQRLabel;
    QRShape46: TgtQRShape;
    QRLabel42: TgtQRLabel;
    QRShape11: TgtQRShape;
    QRLabel43: TgtQRLabel;
    QRShape47: TgtQRShape;
    QRLabel44: TgtQRLabel;
    QRShape48: TgtQRShape;
    QRLabel45: TgtQRLabel;
    QRShape49: TgtQRShape;
    qryCompanyAddress: TQuery;
    QRLabel75: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRLabel76: TgtQRLabel;
    QRDBText6: TgtQRDBText;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
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
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  tempAddress := '';

  with qryCompanyAddress do
    begin
      close;
      open;
    end;

  for icount := 0 to 4 do
  begin
    if qryCompanyAddress.Fields[icount].AsString = '' then Continue;
    tempAddress := tempAddress + ', ' + qryCompanyAddress.Fields[icount].AsString;
  end;

  tempAddress := tempAddress + #13#10;

  tempAddress := tempAddress + 'Telephone  ' + qryCompanyAddress.Fields[6].AsString;
  tempAddress := tempAddress + '  Fax  ' + qryCompanyAddress.Fields[7].AsString;

  tempAddress := trim(StringReplace(tempAddress,',','',[]));
  memAddress.lines.add(tempAddress);
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

  rTotal := qryReport.FieldByName('Quote_Nett_Price').Asfloat - qryReport.FieldByName('Discount_Value').Asfloat;
  qrlblGrossPrice.Caption := formatfloat('#,##0.00',rTotal);
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

procedure TfrmwtRPJobSheet.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
//    qriFootlogo.picture.loadfromfile('wtFootLogo.bmp');
  except
  end;

end;

end.
