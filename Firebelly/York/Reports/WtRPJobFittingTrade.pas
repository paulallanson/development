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
    dtsReport: TDataSource;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qryUpJStatus: TQuery;
    qryCompanyAddress: TQuery;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape21: TQRShape;
    memAddress: TQRRichText;
    QRShape43: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape44: TQRShape;
    QRRichText1: TQRRichText;
    QRShape46: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    qrrchTextInstallAddress: TQRRichText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel22: TQRLabel;
    QRSysData1: TgtQRSysData;
    qrchdSatisfaction: TQRChildBand;
    QRLabel11: TQRLabel;
    memAddress1: TQRRichText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel48: TQRLabel;
    QRMemo3: TQRMemo;
    QRLabel49: TQRLabel;
    QRMemo4: TQRMemo;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape6: TQRShape;
    qriHeadLogo: TQRImage;
    QRLabel51: TQRLabel;
    QRShape11: TQRShape;
    QRLabel70: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape48: TQRShape;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape5: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape7: TQRShape;
    QRLabel15: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgQuoteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrchdSatisfactionBeforePrint(Sender: TQRCustomBand;
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
    
  qrrchTextInstallAddress.lines.clear;
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  tempAddress := '';

  with qryCompanyAddress do
    begin
      close;
      open;
    end;

  tempAddress := qryCompanyAddress.fieldbyname('Company_Name').AsString + #13#10;

  for icount := 1 to 4 do
  begin
    if qryCompanyAddress.Fields[icount].AsString = '' then Continue;
    tempAddress := tempAddress + ', ' + qryCompanyAddress.Fields[icount].AsString;
  end;

  tempAddress := tempAddress + #13#10;

  tempAddress := tempAddress + 'Telephone  ' + qryCompanyAddress.Fields[6].AsString;
  tempAddress := tempAddress + '  Fax  ' + qryCompanyAddress.Fields[7].AsString;

  tempAddress := trim(StringReplace(tempAddress,',','',[]));

  memAddress.lines.Clear;
  memAddress1.lines.clear;
  
  memAddress.lines.add(tempAddress);
  memAddress1.lines.add(tempAddress);

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
    qriHeadlogo.picture.loadfromfile('wtHeadTrade.bmp');
//    qriFootlogo.picture.loadfromfile('wtFootLogo.bmp');
  except
  end;

end;

procedure TfrmwtRPJobFittingTrade.qrchdSatisfactionBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrmemo1.lines.text := stringreplace(qrMemo1.lines.text,'<Company>',qryCompanyAddress.fieldbyname('Company_Name').AsString, [rfReplaceAll]);
end;

end.
