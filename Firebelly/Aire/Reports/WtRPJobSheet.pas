unit wtRPJobSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPJobSheet = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TFDQuery;
    qryQElements: TFDQuery;
    dtsReport: TDataSource;
    qryQCutOuts: TFDQuery;
    qryQEdges: TFDQuery;
    qryQExtras: TFDQuery;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qrbPageHeader: TQRBand;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    qrrchTextInstallAddress: TQRRichText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape5: TQRShape;
    QRLabel22: TQRLabel;
    qrlblContact: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape7: TQRShape;
    QRLabel13: TQRLabel;
    QRShape8: TQRShape;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRLabel23: TQRLabel;
    QRShape10: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape12: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape22: TQRShape;
    QRLabel33: TQRLabel;
    QRShape23: TQRShape;
    QRLabel34: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    memAddress: TQRRichText;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    qrlblGrossPrice: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape36: TQRShape;
    QRLabel35: TQRLabel;
    QRShape37: TQRShape;
    QRLabel6: TQRLabel;
    QRShape19: TQRShape;
    QRLabel36: TQRLabel;
    QRShape38: TQRShape;
    QRLabel10: TQRLabel;
    QRShape20: TQRShape;
    QRLabel29: TQRLabel;
    QRShape21: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel41: TQRLabel;
    QRShape46: TQRShape;
    QRLabel42: TQRLabel;
    QRShape11: TQRShape;
    QRLabel43: TQRLabel;
    QRShape47: TQRShape;
    QRLabel44: TQRLabel;
    QRShape48: TQRShape;
    QRLabel45: TQRLabel;
    QRShape49: TQRShape;
    qryCompanyAddress: TFDQuery;
    QRLabel75: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel76: TQRLabel;
    QRDBText6: TQRDBText;
    qriHeadLogo: TQRImage;
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

  tempAddress := qryCompanyAddress.fieldbyname('Company_Name').AsString + #13#10;

  for icount := 1 to 5 do
  begin
    if qryCompanyAddress.Fields[icount].AsString = '' then Continue;
    tempAddress := tempAddress + ', ' + qryCompanyAddress.Fields[icount].AsString;
  end;

  tempAddress := tempAddress + #13#10;

  tempAddress := tempAddress + 'Telephone  ' + qryCompanyAddress.Fields[6].AsString;
  tempAddress := tempAddress + '  Email  ' + qryCompanyAddress.Fields[7].AsString;

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
