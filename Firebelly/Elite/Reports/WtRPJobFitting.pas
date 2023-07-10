unit WtRPJobFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrCtrls;

type
  TfrmwtRPJobFitting = class(TForm)
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
    qrchdSatisfaction: TQRChildBand;
    QRLabel11: TgtQRLabel;
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
    qryJRemedials: TQuery;
    qrsubRemedial: TQRSubDetail;
    qrmRemedials: TgtQRMemo;
    QRDBText9: TgtQRDBText;
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
    QRLabel70: TgtQRLabel;
    QRDBText10: TgtQRDBText;
    QRLabel71: TgtQRLabel;
    QRDBText11: TgtQRDBText;
    QRLabel72: TgtQRLabel;
    QRLabel73: TgtQRLabel;
    qrlblSOCaption: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel2: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRShape3: TgtQRShape;
    gtQRShape5: TgtQRShape;
    QRLabel24: TgtQRLabel;
    gtQRShape6: TgtQRShape;
    gtQRLabel4: TgtQRLabel;
    gtQRShape7: TgtQRShape;
    gtQRLabel5: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRShape23: TgtQRShape;
    gtQRShape8: TgtQRShape;
    gtQRShape9: TgtQRShape;
    gtQRShape10: TgtQRShape;
    gtQRShape11: TgtQRShape;
    gtQRShape12: TgtQRShape;
    gtQRShape13: TgtQRShape;
    gtQRShape14: TgtQRShape;
    QRShape35: TgtQRShape;
    QRLabel22: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel9: TgtQRLabel;
    qrlblUpstandLabel: TgtQRLabel;
    qrlblCillsLabel: TgtQRLabel;
    qrlblSlashbackLabel: TgtQRLabel;
    gtQRShape15: TgtQRShape;
    gtQRShape16: TgtQRShape;
    gtQRShape17: TgtQRShape;
    gtQRLabel13: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    gtQRShape19: TgtQRShape;
    gtQRLabel16: TgtQRLabel;
    gtQRShape18: TgtQRShape;
    gtQRShape20: TgtQRShape;
    qrrchTextInstallAddress: TgtQRRichText;
    QRLabel4: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    gtQRShape22: TgtQRShape;
    gtQRShape21: TgtQRShape;
    gtQRLabel14: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRLabel15: TgtQRLabel;
    gtQRLabel15: TgtQRLabel;
    QRDBText6: TgtQRDBText;
    qrlblContact: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    gtQRShape24: TgtQRShape;
    gtQRShape25: TgtQRShape;
    gtQRDBText3: TgtQRDBText;
    gtQRRichText1: TgtQRRichText;
    gtQRLabel3: TgtQRLabel;
    gtQRDBText4: TgtQRDBText;
    gtQRLabel17: TgtQRLabel;
    gtQRDBText5: TgtQRDBText;
    gtQRShape4: TgtQRShape;
    gtQRShape26: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel18: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    qrrchTextNotes: TgtQRRichText;
    qrlblEdgeDetail: TgtQRLabel;
    qrlblThickness: TgtQRLabel;
    qrlblUpstand: TgtQRLabel;
    qrlblWindowCill: TgtQRLabel;
    qrlblSplashback: TgtQRLabel;
    qryJobEdge: TQuery;
    qryJobThickness: TQuery;
    qryJobUpstand: TQuery;
    gtQRLabel10: TgtQRLabel;
    gtQRDBText6: TgtQRDBText;
    qrrchTextInstallAddress1: TgtQRRichText;
    gtQRLabel11: TgtQRLabel;
    memAddress: TgtQRMemo;
    qriHeadLogo: TgtQRImage;
    qriHeadLogo1: TgtQRImage;
    memAddress1: TgtQRMemo;
    qriHeadLogo2: TgtQRImage;
    memAddress2: TgtQRMemo;
    qryCompanyAddress: TQuery;
    gtQRLabel12: TgtQRLabel;
    gtQRShape27: TgtQRShape;
    gtQRLabel19: TgtQRLabel;
    gtQRLabel20: TgtQRLabel;
    gtQRLabel21: TgtQRLabel;
    gtQRShape28: TgtQRShape;
    gtQRLabel22: TgtQRLabel;
    gtQRShape29: TgtQRShape;
    gtQRShape30: TgtQRShape;
    gtQRShape31: TgtQRShape;
    gtQRShape33: TgtQRShape;
    gtQRShape32: TgtQRShape;
    gtQRShape34: TgtQRShape;
    gtQRShape35: TgtQRShape;
    gtQRShape36: TgtQRShape;
    gtQRShape37: TgtQRShape;
    gtQRMemo1: TgtQRMemo;
    gtQRMemo2: TgtQRMemo;
    gtQRMemo3: TgtQRMemo;
    gtQRMemo4: TgtQRMemo;
    gtQRMemo5: TgtQRMemo;
    gtQRMemo6: TgtQRMemo;
    gtQRShape38: TgtQRShape;
    gtQRMemo7: TgtQRMemo;
    gtQRLabel23: TgtQRLabel;
    gtQRShape39: TgtQRShape;
    QRBand2: TQRBand;
    qrlblCompanyAdd: TgtQRLabel;
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
    function GetCompanyAddress: string;
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

  GetCompanyAddress;

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

function TfrmwtRPJobFitting.GetCompanyAddress: string;
var
  i: integer;
begin
  qrlblCompanyAdd.caption := '';
  for i := 1 to 4 do
    begin
      if qryCompanyAddress.Fields[i].asstring = '' then
        continue
      else
        qrlblCompanyAdd.caption := qrlblCompanyAdd.caption + qryCompanyAddress.Fields[i].AsString;
      if i <> 4 then
        qrlblCompanyAdd.caption := qrlblCompanyAdd.caption + ', '
    end;
  qrlblCompanyAdd.caption := qrlblCompanyAdd.caption + '.  Tel: ' + qryCompanyAddress.Fieldbyname('Telephone_Number').AsString;
end;

end.
