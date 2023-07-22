unit WtRPJobFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPJobFitting = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TFDQuery;
    dtsReport: TDataSource;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qryUpJStatus: TFDQuery;
    qrchdSatisfaction: TQRChildBand;
    QRLabel11: TQRLabel;
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
    QRLabel51: TQRLabel;
    qrchdSnagging: TQRChildBand;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    qryJRemedials: TFDQuery;
    qrsubRemedial: TQRSubDetail;
    qrmRemedials: TQRMemo;
    QRDBText9: TQRDBText;
    QRBand1: TQRBand;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    qrshpRemedialLine: TQRShape;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel71: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRShape48: TQRShape;
    QRLabel74: TQRLabel;
    qrlblSOCaption: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRDBText2: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRShape2: TQRShape;
    gtQRShape3: TQRShape;
    gtQRShape5: TQRShape;
    QRLabel24: TQRLabel;
    gtQRShape6: TQRShape;
    gtQRLabel4: TQRLabel;
    gtQRShape7: TQRShape;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRShape23: TQRShape;
    gtQRShape8: TQRShape;
    gtQRShape9: TQRShape;
    gtQRShape10: TQRShape;
    gtQRShape11: TQRShape;
    gtQRShape12: TQRShape;
    gtQRShape13: TQRShape;
    gtQRShape14: TQRShape;
    QRShape35: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText5: TQRDBText;
    gtQRLabel8: TQRLabel;
    gtQRLabel9: TQRLabel;
    qrlblUpstandLabel: TQRLabel;
    qrlblCillsLabel: TQRLabel;
    qrlblSlashbackLabel: TQRLabel;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    gtQRShape17: TQRShape;
    gtQRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    gtQRShape19: TQRShape;
    gtQRLabel16: TQRLabel;
    gtQRShape18: TQRShape;
    gtQRShape20: TQRShape;
    qrrchTextInstallAddress: TQRRichText;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    gtQRShape22: TQRShape;
    gtQRShape21: TQRShape;
    gtQRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel15: TQRLabel;
    gtQRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    qrlblContact: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    gtQRShape24: TQRShape;
    gtQRShape25: TQRShape;
    gtQRDBText3: TQRDBText;
    gtQRRichText1: TQRRichText;
    gtQRLabel3: TQRLabel;
    gtQRDBText4: TQRDBText;
    gtQRLabel17: TQRLabel;
    gtQRDBText5: TQRDBText;
    gtQRShape4: TQRShape;
    gtQRShape26: TQRShape;
    gtQRLabel1: TQRLabel;
    gtQRLabel18: TQRLabel;
    gtQRDBText1: TQRDBText;
    qrrchTextNotes: TQRRichText;
    qrlblEdgeDetail: TQRLabel;
    qrlblThickness: TQRLabel;
    qrlblUpstand: TQRLabel;
    qrlblWindowCill: TQRLabel;
    qrlblSplashback: TQRLabel;
    qryJobEdge: TFDQuery;
    qryJobThickness: TFDQuery;
    qryJobUpstand: TFDQuery;
    gtQRLabel10: TQRLabel;
    gtQRDBText6: TQRDBText;
    qrrchTextInstallAddress1: TQRRichText;
    gtQRLabel11: TQRLabel;
    memAddress: TQRMemo;
    qriHeadLogo: TQRImage;
    qriHeadLogo1: TQRImage;
    memAddress1: TQRMemo;
    qriHeadLogo2: TQRImage;
    memAddress2: TQRMemo;
    qryCompanyAddress: TFDQuery;
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

  {Installation Address Details}
  qrrchTextInstallAddress1.lines.clear;
  qrrchTextInstallAddress1.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  {Actual Company Name and address}
  tempAddress := '';
  memAddress.lines.clear;
  memAddress1.lines.clear;
  memAddress2.lines.clear;

  with qryCompanyAddress do
    begin
      close;
      open;
      for iCount := 1 to 4 do
        begin
          if qryCompanyAddress.Fields[iCount].asstring = '' then
            continue
          else
            memAddress.Lines.Append(Trim(qryCompanyAddress.Fields[iCount].asstring)) ;
        end;

      {Finally, add the phone number} ;
      memAddress.Lines.Append('Tel: ' + Trim(qryCompanyAddress.fieldbyname('Telephone_number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring) <> '' then
        memAddress.Lines.Append('Fax: ' + Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring) <> '' then
        memAddress.Lines.Append(Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring) <> '' then
        memAddress.Lines.Append(Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring));
    end;

  for iCount := 0 to pred(memAddress.lines.count) do
    begin
      memAddress1.Lines.Append(memAddress.Lines[iCount]);
      memAddress2.Lines.Append(memAddress.Lines[iCount]);
    end;

  {Get Job Worktop, edge and upstand details}
  with qryJobEdge do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;
    end;

  with qryJobThickness do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;
    end;

  with qryJobUpstand do
    begin
      close;
      parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
      open;

      while eof <> true do
        begin
          if (fieldbyname('Use_Description').AsString = 'Upstand') or (fieldbyname('Use_Description').AsString = '') then
            qrlblUpstand.caption := 'Yes'
          else
          if fieldbyname('Use_Description').AsString = 'Window Cill' then
            qrlblWindowCill.caption := 'Yes'
          else
          if fieldbyname('Use_Description').AsString = 'Splashback' then
            qrlblSplashback.caption := 'Yes';
          next;
        end;
    end;

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

  qrlblEdgeDetail.caption := qryJobEdge.fieldbyname('Description').asstring;
  qrlblThickness.caption := qryJobThickness.fieldbyname('Thickness_mm').asstring;

  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Risk_Notes').asinteger));
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
    qriHeadlogo1.picture.loadfromfile('wtHeadLogo.bmp');
    qriHeadlogo2.picture.loadfromfile('wtHeadLogo.bmp');
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
