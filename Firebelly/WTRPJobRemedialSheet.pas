unit WtRPJobRemedialSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrCtrls;

type
  TfrmwtRPJobRemedialSheet = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    OldqryReport: TQuery;
    dtsReport: TDataSource;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qryUpJStatus: TQuery;
    qryCompanyAddress: TQuery;
    memAddress: TgtQRRichText;
    qryJRemedials: TQuery;
    qrlblSOCaption: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRShape3: TgtQRShape;
    gtQRShape15: TgtQRShape;
    gtQRShape16: TgtQRShape;
    gtQRShape17: TgtQRShape;
    gtQRLabel13: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    gtQRShape18: TgtQRShape;
    gtQRShape20: TgtQRShape;
    QRLabel4: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    gtQRShape22: TgtQRShape;
    gtQRLabel14: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRLabel15: TgtQRLabel;
    qrlblContact: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    gtQRShape4: TgtQRShape;
    gtQRShape26: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    qryJobEdge: TQuery;
    qriHeadLogo: TgtQRImage;
    gtQRSysData1: TgtQRSysData;
    gtQRShape12: TgtQRShape;
    gtQRLabel18: TgtQRLabel;
    QRBand1: TQRBand;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel9: TgtQRLabel;
    gtQRLabel10: TgtQRLabel;
    gtQRShape32: TgtQRShape;
    gtQRShape7: TgtQRShape;
    gtQRShape8: TgtQRShape;
    gtQRShape9: TgtQRShape;
    gtQRShape10: TgtQRShape;
    gtQRShape27: TgtQRShape;
    gtQRShape11: TgtQRShape;
    gtQRLabel11: TgtQRLabel;
    gtQRLabel12: TgtQRLabel;
    gtQRLabel16: TgtQRLabel;
    gtQRLabel17: TgtQRLabel;
    qrlblCompany: TgtQRLabel;
    gtQRShape13: TgtQRShape;
    gtQRShape14: TgtQRShape;
    gtQRLabel19: TgtQRLabel;
    gtQRLabel20: TgtQRLabel;
    QRSubDetail1: TQRSubDetail;
    gtQRLabel4: TgtQRLabel;
    gtQRShape6: TgtQRShape;
    gtQRDBText1: TgtQRDBText;
    gtQRDBText3: TgtQRDBText;
    gtQRShape5: TgtQRShape;
    gtQRShape19: TgtQRShape;
    gtQRShape23: TgtQRShape;
    gtQRShape28: TgtQRShape;
    gtQRShape29: TgtQRShape;
    gtQRShape30: TgtQRShape;
    gtQRShape31: TgtQRShape;
    gtQRShape33: TgtQRShape;
    gtQRShape34: TgtQRShape;
    gtQRShape35: TgtQRShape;
    gtQRShape36: TgtQRShape;
    gtQRShape37: TgtQRShape;
    gtQRShape38: TgtQRShape;
    gtQRLabel22: TgtQRLabel;
    gtQRLabel23: TgtQRLabel;
    gtQRLabel24: TgtQRLabel;
    gtQRLabel25: TgtQRLabel;
    gtQRLabel26: TgtQRLabel;
    gtQRLabel27: TgtQRLabel;
    gtQRLabel28: TgtQRLabel;
    gtQRLabel29: TgtQRLabel;
    gtQRLabel30: TgtQRLabel;
    gtQRLabel31: TgtQRLabel;
    gtQRLabel32: TgtQRLabel;
    gtQRLabel33: TgtQRLabel;
    gtQRShape39: TgtQRShape;
    gtQRLabel35: TgtQRLabel;
    gtQRShape40: TgtQRShape;
    gtQRLabel36: TgtQRLabel;
    gtQRLabel37: TgtQRLabel;
    gtQRShape41: TgtQRShape;
    gtQRLabel44: TgtQRLabel;
    gtQRLabel34: TgtQRLabel;
    gtQRShape44: TgtQRShape;
    gtQRShape45: TgtQRShape;
    gtQRLabel45: TgtQRLabel;
    gtQRLabel46: TgtQRLabel;
    gtQRLabel38: TgtQRLabel;
    gtQRLabel39: TgtQRLabel;
    gtQRShape42: TgtQRShape;
    gtQRShape43: TgtQRShape;
    gtQRLabel40: TgtQRLabel;
    gtQRLabel41: TgtQRLabel;
    gtQRShape46: TgtQRShape;
    gtQRShape47: TgtQRShape;
    gtQRLabel42: TgtQRLabel;
    gtQRLabel43: TgtQRLabel;
    gtQRShape48: TgtQRShape;
    gtQRShape49: TgtQRShape;
    gtQRLabel47: TgtQRLabel;
    gtQRShape50: TgtQRShape;
    gtQRShape51: TgtQRShape;
    gtQRShape52: TgtQRShape;
    gtQRShape53: TgtQRShape;
    gtQRShape54: TgtQRShape;
    gtQRLabel48: TgtQRLabel;
    gtQRLabel21: TgtQRLabel;
    gtQRShape21: TgtQRShape;
    gtQRLabel15: TgtQRLabel;
    QRDBText6: TgtQRDBText;
    qrrchTextInstallAddress: TgtQRMemo;
    qrrchTextRemedialDetails: TgtQRMemo;
    qryJobWorktops: TQuery;
    gtQRLabel49: TgtQRLabel;
    gtQRDBText4: TgtQRDBText;
    qryReport: TQuery;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgQuoteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
  public
    Job: integer;
    RemedialNo: integer;
    RemedialOrder: integer;
    bAccountsCopy: boolean;
    bPreview: boolean;
    bPrintLogo: boolean;
    bRemedialTemplate: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPJobRemedialSheet: TfrmwtRPJobRemedialSheet;

implementation

{$R *.dfm}

function TfrmwtRPJobRemedialSheet.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      parambyname('Remedial_Number').asinteger := self.RemedialNo;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPJobRemedialSheet.qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  icount: integer;
  TempAddress: string;
begin
  sWorktop := '';

  with qryJobWorktops do
    begin
      close;
      open;
    end;
    
  with qryCompany do
    begin
      close;
      open;
    end;

  {Customer address details}
  if qryReport.FieldByName('Address').AsInteger <> 0 then
    begin
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

(*  {Build the address}
  for icount := 1 to 6 do
    begin
      if trim(dtsAddress.DataSet.fields[icount].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[icount].asstring))
    end;
*)

  {Installation Address Details}
  qrrchTextInstallAddress.lines.clear;
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  {Actual Company Name and address}
  tempAddress := '';
  memAddress.lines.clear;

  with qryCompanyAddress do
    begin
      close;
      open;
    end;

  tempAddress := qryCompanyAddress.fieldbyname('Company_Name').AsString;

  for icount := 1 to 4 do
  begin
    if qryCompanyAddress.Fields[icount].AsString = '' then Continue;
    tempAddress := tempAddress + ', ' + qryCompanyAddress.Fields[icount].AsString;
  end;

  tempAddress := tempAddress + ' T ' + qryCompanyAddress.Fields[6].AsString;
  tempAddress := tempAddress + ' F ' + qryCompanyAddress.Fields[7].AsString;

  tempAddress := trim(StringReplace(tempAddress,',','',[]));

  memAddress.lines.add(tempAddress);

end;

procedure TfrmwtRPJobRemedialSheet.qrgQuoteBeforePrint(Sender: TQRCustomBand;
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

end;

function TfrmwtRPJobRemedialSheet.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPJobRemedialSheet.qrgQuoteAfterPrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPJobRemedialSheet.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
  except
  end;

end;

procedure TfrmwtRPJobRemedialSheet.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  {Installation Address Details}
  qrrchTextRemedialDetails.lines.clear;
  qrrchTextRemedialDetails.lines.add(BuildNotes(qryReport.fieldbyname('Remedial_Notes').asinteger));
end;

end.
