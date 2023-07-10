unit WtRPJobFittingTrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrCtrls;

type
  TfrmwtRPJobFittingTrade = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TQuery;
    qrbPageHeader: TQRBand;
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
    qryUpJStatus: TQuery;
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
    QRShape19: TgtQRShape;
    QRLabel6: TgtQRLabel;
    QRLabel29: TgtQRLabel;
    QRShape20: TgtQRShape;
    QRLabel10: TgtQRLabel;
    QRLabel30: TgtQRLabel;
    QRShape21: TgtQRShape;
    QRLabel31: TgtQRLabel;
    QRLabel32: TgtQRLabel;
    QRShape22: TgtQRShape;
    QRLabel33: TgtQRLabel;
    QRShape23: TgtQRShape;
    QRLabel34: TgtQRLabel;
    QRShape24: TgtQRShape;
    QRShape25: TgtQRShape;
    QRShape26: TgtQRShape;
    QRShape27: TgtQRShape;
    QRShape28: TgtQRShape;
    QRShape29: TgtQRShape;
    QRShape30: TgtQRShape;
    QRShape31: TgtQRShape;
    QRShape32: TgtQRShape;
    QRShape33: TgtQRShape;
    qriHeadLogo: TgtQRImage;
    memAddress: TgtQRRichText;
    qryCompanyAddress: TQuery;
    QRShape34: TgtQRShape;
    QRShape35: TgtQRShape;
    QRLabel14: TgtQRLabel;
    QRLabel35: TgtQRLabel;
    QRLabel36: TgtQRLabel;
    QRShape36: TgtQRShape;
    QRShape37: TgtQRShape;
    QRShape38: TgtQRShape;
    QRShape39: TgtQRShape;
    QRLabel37: TgtQRLabel;
    QRShape40: TgtQRShape;
    QRShape41: TgtQRShape;
    QRLabel38: TgtQRLabel;
    QRLabel39: TgtQRLabel;
    QRShape42: TgtQRShape;
    QRShape43: TgtQRShape;
    QRLabel40: TgtQRLabel;
    QRLabel41: TgtQRLabel;
    QRLabel42: TgtQRLabel;
    QRShape44: TgtQRShape;
    QRRichText1: TgtQRRichText;
    QRLabel43: TgtQRLabel;
    QRLabel44: TgtQRLabel;
    QRLabel45: TgtQRLabel;
    QRLabel46: TgtQRLabel;
    QRLabel47: TgtQRLabel;
    QRShape45: TgtQRShape;
    QRShape46: TgtQRShape;
    QRLabel75: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRLabel76: TgtQRLabel;
    QRDBText6: TgtQRDBText;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgQuoteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
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
  frmwtRPJobFittingTrade: TfrmwtRPJobFittingTrade;

implementation

{$R *.dfm}

function TfrmwtRPJobFittingTrade.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPJobFittingTrade.qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
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

procedure TfrmwtRPJobFittingTrade.qrgQuoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
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

(*  for i := 1 to 6 do
    begin
      if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
    end;
*)
end;

function TfrmwtRPJobFittingTrade.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPJobFittingTrade.qrgQuoteAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if (qryReport.fieldbyname('Job_status').asinteger < 40) and not bPreview then
    with qryUpJStatus do
      begin
        close;
        parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
        parambyname('Production_Date_Actual').asdatetime := date;
        parambyname('Job_Status').asinteger := 40;
        execsql;
      end;

end;

procedure TfrmwtRPJobFittingTrade.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
//    qriFootlogo.picture.loadfromfile('wtFootLogo.bmp');
  except
  end;

end;

end.
