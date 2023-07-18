unit WtRPJobRemedialSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, gtQrCtrls,
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
    qryCompanyAddress: TFDQuery;
    qryJRemedials: TFDQuery;
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
    gtQRShape15: TgtQRShape;
    gtQRShape16: TgtQRShape;
    gtQRShape17: TgtQRShape;
    gtQRLabel13: TgtQRLabel;
    QRDBText8: TgtQRDBText;
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
    gtQRShape4: TgtQRShape;
    gtQRShape26: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    qryJobEdge: TFDQuery;
    qryJobThickness: TFDQuery;
    qryJobUpstand: TFDQuery;
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
    gtQRSysData1: TgtQRSysData;
    gtQRShape12: TgtQRShape;
    gtQRLabel18: TgtQRLabel;
    gtQRShape13: TgtQRShape;
    gtQRShape14: TgtQRShape;
    gtQRLabel19: TgtQRLabel;
    gtQRLabel20: TgtQRLabel;
    memAddress: TgtQRMemo;
    qriHeadLogo: TgtQRImage;
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

end.
