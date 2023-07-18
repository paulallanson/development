unit WtRPJobFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, gtQrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPJobFitting = class(TForm)
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
    qryUpJStatus: TFDQuery;
    qryCompanyAddress: TFDQuery;
    QRShape26: TgtQRShape;
    QRShape27: TgtQRShape;
    QRShape28: TgtQRShape;
    QRShape29: TgtQRShape;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRShape7: TgtQRShape;
    QRLabel13: TgtQRLabel;
    QRShape4: TgtQRShape;
    QRShape9: TgtQRShape;
    QRLabel24: TgtQRLabel;
    QRShape12: TgtQRShape;
    QRLabel26: TgtQRLabel;
    QRLabel27: TgtQRLabel;
    QRLabel28: TgtQRLabel;
    QRShape13: TgtQRShape;
    QRShape19: TgtQRShape;
    QRLabel6: TgtQRLabel;
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
    QRShape30: TgtQRShape;
    QRShape31: TgtQRShape;
    QRShape32: TgtQRShape;
    QRShape33: TgtQRShape;
    memAddress: TgtQRRichText;
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
    QRShape14: TgtQRShape;
    QRShape15: TgtQRShape;
    QRShape16: TgtQRShape;
    QRShape17: TgtQRShape;
    QRShape18: TgtQRShape;
    QRSysData1: TgtQRSysData;
    QRLabel29: TgtQRLabel;
    QRShape20: TgtQRShape;
    QRShape25: TgtQRShape;
    QRShape34: TgtQRShape;
    QRShape35: TgtQRShape;
    QRLabel14: TgtQRLabel;
    QRLabel35: TgtQRLabel;
    QRLabel36: TgtQRLabel;
    QRShape36: TgtQRShape;
    QRShape37: TgtQRShape;
    QRShape38: TgtQRShape;
    QRShape39: TgtQRShape;
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
    qriHeadLogo: TgtQRImage;
    QRLabel51: TgtQRLabel;
    qrchdSnagging: TQRChildBand;
    QRLabel53: TgtQRLabel;
    QRLabel54: TgtQRLabel;
    QRLabel55: TgtQRLabel;
    QRLabel56: TgtQRLabel;
    QRLabel57: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRDBText7: TgtQRDBText;
    QRShape8: TgtQRShape;
    QRShape10: TgtQRShape;
    QRLabel58: TgtQRLabel;
    QRLabel59: TgtQRLabel;
    qryJRemedials: TFDQuery;
    qrsubRemedial: TQRSubDetail;
    qrmRemedials: TgtQRMemo;
    QRDBText9: TgtQRDBText;
    QRShape11: TgtQRShape;
    QRBand1: TQRBand;
    QRLabel60: TgtQRLabel;
    QRLabel61: TgtQRLabel;
    QRLabel62: TgtQRLabel;
    QRLabel63: TgtQRLabel;
    QRLabel64: TgtQRLabel;
    QRLabel65: TgtQRLabel;
    QRLabel66: TgtQRLabel;
    QRLabel67: TgtQRLabel;
    QRLabel68: TgtQRLabel;
    qrshpRemedialLine: TgtQRShape;
    QRLabel69: TgtQRLabel;
    QRShape47: TgtQRShape;
    QRLabel70: TgtQRLabel;
    QRDBText10: TgtQRDBText;
    QRLabel71: TgtQRLabel;
    QRDBText11: TgtQRDBText;
    QRLabel72: TgtQRLabel;
    QRLabel73: TgtQRLabel;
    QRShape48: TgtQRShape;
    QRLabel74: TgtQRLabel;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgQuoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgQuoteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrchdSatisfactionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsubRemedialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
  public
    Job: integer;
    bIncludeVoucher: boolean;
    bRetail: boolean;
    bPreview: boolean;
    bPrintLogo: boolean;
    bAccountsCopy: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPJobFitting: TfrmwtRPJobFitting;

implementation

{$R *.dfm}

function TfrmwtRPJobFitting.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPJobFitting.qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
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
  memAddress.lines.add(tempAddress);
  memAddress1.lines.add(tempAddress);

  with qryJRemedials do
    begin
      close;
      open;
      qrsubRemedial.Enabled := (recordcount > 0);
    end;
end;

procedure TfrmwtRPJobFitting.qrgQuoteBeforePrint(Sender: TQRCustomBand;
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

  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

(*  for i := 1 to 6 do
    begin
      if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
    end;
*)
end;

function TfrmwtRPJobFitting.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPJobFitting.qrgQuoteAfterPrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPJobFitting.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
//    qriFootlogo.picture.loadfromfile('wtFootLogo.bmp');
  except
  end;

end;

procedure TfrmwtRPJobFitting.qrchdSatisfactionBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrmemo1.lines.text := stringreplace(qrMemo1.lines.text,'<Company>',qryCompanyAddress.fieldbyname('Company_Name').AsString, [rfReplaceAll]);
end;

procedure TfrmwtRPJobFitting.qrsubRemedialBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmRemedials.lines.clear;
  qrmRemedials.lines.add(BuildNotes(qryJRemedials.fieldbyname('Notes').asinteger));
  qrshpRemedialLine.Height := (sender as TQRCustomBand).Height;
end;

end.
