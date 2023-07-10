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
    QRLabel24: TgtQRLabel;
    QRLabel26: TgtQRLabel;
    QRLabel27: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel30: TgtQRLabel;
    QRShape21: TgtQRShape;
    memAddress: TgtQRRichText;
    QRShape43: TgtQRShape;
    QRLabel40: TgtQRLabel;
    QRLabel41: TgtQRLabel;
    QRLabel42: TgtQRLabel;
    QRShape44: TgtQRShape;
    QRRichText1: TgtQRRichText;
    QRShape46: TgtQRShape;
    QRLabel1: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    QRLabel2: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    QRLabel5: TgtQRLabel;
    QRShape1: TgtQRShape;
    QRLabel4: TgtQRLabel;
    qrrchTextInstallAddress: TgtQRRichText;
    QRLabel12: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    QRLabel22: TgtQRLabel;
    QRSysData1: TgtQRSysData;
    qrchdSatisfaction: TQRChildBand;
    QRLabel11: TgtQRLabel;
    memAddress1: TgtQRRichText;
    QRLabel17: TgtQRLabel;
    QRLabel18: TgtQRLabel;
    QRMemo1: TgtQRMemo;
    QRLabel23: TgtQRLabel;
    QRLabel25: TgtQRLabel;
    QRMemo2: TgtQRMemo;
    QRLabel48: TgtQRLabel;
    QRMemo3: TgtQRMemo;
    QRLabel49: TgtQRLabel;
    QRMemo4: TgtQRMemo;
    QRLabel50: TgtQRLabel;
    QRLabel52: TgtQRLabel;
    QRShape6: TgtQRShape;
    QRLabel51: TgtQRLabel;
    QRShape11: TgtQRShape;
    QRLabel70: TgtQRLabel;
    QRDBText10: TgtQRDBText;
    QRShape48: TgtQRShape;
    QRLabel74: TgtQRLabel;
    QRLabel75: TgtQRLabel;
    QRLabel76: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRLabel6: TgtQRLabel;
    QRShape2: TgtQRShape;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRShape5: TgtQRShape;
    QRShape3: TgtQRShape;
    QRShape4: TgtQRShape;
    QRLabel13: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    QRShape7: TgtQRShape;
    QRLabel15: TgtQRLabel;
    QRShape8: TgtQRShape;
    QRShape9: TgtQRShape;
    qriHeadLogo: TgtQRImage;
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
