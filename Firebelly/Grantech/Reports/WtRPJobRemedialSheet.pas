unit WtRPJobRemedialSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPJobRemedialSheet = class(TForm)
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
    qryJRemedials: TFDQuery;
    qrlblSOCaption: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRDBText2: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRShape2: TQRShape;
    gtQRShape3: TQRShape;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    gtQRShape17: TQRShape;
    gtQRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
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
    gtQRShape4: TQRShape;
    gtQRShape26: TQRShape;
    gtQRLabel1: TQRLabel;
    qryJobEdge: TFDQuery;
    qryJobThickness: TFDQuery;
    qryJobUpstand: TFDQuery;
    gtQRSysData1: TQRSysData;
    gtQRShape12: TQRShape;
    gtQRLabel18: TQRLabel;
    QRBand1: TQRBand;
    gtQRLabel3: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    gtQRShape32: TQRShape;
    gtQRShape7: TQRShape;
    gtQRShape8: TQRShape;
    gtQRShape9: TQRShape;
    gtQRShape10: TQRShape;
    gtQRShape27: TQRShape;
    gtQRShape11: TQRShape;
    gtQRLabel11: TQRLabel;
    gtQRLabel12: TQRLabel;
    gtQRLabel16: TQRLabel;
    gtQRLabel17: TQRLabel;
    qrlblCompany: TQRLabel;
    gtQRShape13: TQRShape;
    gtQRShape14: TQRShape;
    gtQRLabel19: TQRLabel;
    gtQRLabel20: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    gtQRLabel4: TQRLabel;
    gtQRShape6: TQRShape;
    QRLabel24: TQRLabel;
    gtQRShape5: TQRShape;
    OldqryReport: TFDQuery;
    qrrchTextRemedialDetails: TQRRichText;
    gtQRDBText1: TQRDBText;
    gtQRDBText3: TQRDBText;
    gtQRDBText4: TQRDBText;
    memAddress: TQRMemo;
    qriHeadLogo: TQRImage;
    qryCompanyAddress: TFDQuery;
    gtQRShape19: TQRShape;
    gtQRLabel21: TQRLabel;
    gtQRDBText5: TQRDBText;
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
    function GetCompanyAddress: string;
  public
    Job: integer;
    bPreview: boolean;
    bPrintLogo: boolean;
    bAccountsCopy: boolean;
    bRemedialTemplate: boolean;
    RemedialNo: integer;
    RemedialOrder: integer;
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

  GetCompanyAddress;
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

function TfrmwtRPJobRemedialSheet.GetCompanyAddress: string;
var
  iCount: integer;
  sText: string;
begin
  {Actual Company Name and address}
  memAddress.lines.clear;
  with qryCompanyAddress do
    begin
      close;
      open;
      sText := Fields[1].asstring;
      for iCount := 2 to 4 do
        begin
          if Fields[icount].asstring = '' then
            continue
          else
            stext := stext + ', ' + Trim(Fields[icount].asstring) ;
        end;
      memAddress.Lines.Append(sText);

      {Finally, add the phone number} ;
      memAddress.Lines.Append('Tel: ' + Trim(qryCompanyAddress.fieldbyname('Telephone_number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring) <> '' then
        memAddress.Lines.Append('Fax: ' + Trim(qryCompanyAddress.fieldbyname('Fax_Number').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring) <> '' then
        memAddress.Lines.Append(Trim(qryCompanyAddress.fieldbyname('Email_Address').asstring));
      if Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring) <> '' then
        memAddress.Lines.Append(Trim(qryCompanyAddress.fieldbyname('Web_Address').asstring));
    end;

(*  memAddress.lines.clear;
  with qryCompanyAddress do
    begin
      close;
      open;
      for iCount := 0 to 4 do
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
*)
end;

end.
