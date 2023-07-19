unit WtRPJobRemedialSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPJobRemedialSheet = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    OldqryReport: TFDQuery;
    dtsReport: TDataSource;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qryUpJStatus: TFDQuery;
    qryCompanyAddress: TFDQuery;
    memAddress: TQRRichText;
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
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    gtQRShape22: TQRShape;
    gtQRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel15: TQRLabel;
    qrlblContact: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    gtQRShape4: TQRShape;
    gtQRShape26: TQRShape;
    gtQRLabel1: TQRLabel;
    qryJobEdge: TFDQuery;
    qriHeadLogo: TQRImage;
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
    gtQRDBText1: TQRDBText;
    gtQRDBText3: TQRDBText;
    gtQRShape5: TQRShape;
    gtQRShape19: TQRShape;
    gtQRShape23: TQRShape;
    gtQRShape28: TQRShape;
    gtQRShape29: TQRShape;
    gtQRShape30: TQRShape;
    gtQRShape31: TQRShape;
    gtQRShape33: TQRShape;
    gtQRShape34: TQRShape;
    gtQRShape35: TQRShape;
    gtQRShape36: TQRShape;
    gtQRShape37: TQRShape;
    gtQRShape38: TQRShape;
    gtQRLabel22: TQRLabel;
    gtQRLabel23: TQRLabel;
    gtQRLabel24: TQRLabel;
    gtQRLabel25: TQRLabel;
    gtQRLabel26: TQRLabel;
    gtQRLabel27: TQRLabel;
    gtQRLabel28: TQRLabel;
    gtQRLabel29: TQRLabel;
    gtQRLabel30: TQRLabel;
    gtQRLabel31: TQRLabel;
    gtQRLabel32: TQRLabel;
    gtQRLabel33: TQRLabel;
    gtQRShape39: TQRShape;
    gtQRLabel35: TQRLabel;
    gtQRShape40: TQRShape;
    gtQRLabel36: TQRLabel;
    gtQRLabel37: TQRLabel;
    gtQRShape41: TQRShape;
    gtQRLabel44: TQRLabel;
    gtQRLabel34: TQRLabel;
    gtQRShape44: TQRShape;
    gtQRShape45: TQRShape;
    gtQRLabel45: TQRLabel;
    gtQRLabel46: TQRLabel;
    gtQRLabel38: TQRLabel;
    gtQRLabel39: TQRLabel;
    gtQRShape42: TQRShape;
    gtQRShape43: TQRShape;
    gtQRLabel40: TQRLabel;
    gtQRLabel41: TQRLabel;
    gtQRShape46: TQRShape;
    gtQRShape47: TQRShape;
    gtQRLabel42: TQRLabel;
    gtQRLabel43: TQRLabel;
    gtQRShape48: TQRShape;
    gtQRShape49: TQRShape;
    gtQRLabel47: TQRLabel;
    gtQRShape50: TQRShape;
    gtQRShape51: TQRShape;
    gtQRShape52: TQRShape;
    gtQRShape53: TQRShape;
    gtQRShape54: TQRShape;
    gtQRLabel48: TQRLabel;
    gtQRLabel21: TQRLabel;
    gtQRShape21: TQRShape;
    gtQRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    qrrchTextInstallAddress: TQRMemo;
    qrrchTextRemedialDetails: TQRMemo;
    qryJobWorktops: TFDQuery;
    gtQRLabel49: TQRLabel;
    gtQRDBText4: TQRDBText;
    qryReport: TFDQuery;
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
