unit WtRPJobFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPJobFitting = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgQuote: TQRGroup;
    qryReport: TFDQuery;
    qrbPageHeader: TQRBand;
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
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    qrrchTextInstallAddress: TQRRichText;
    QRLabel12: TQRLabel;
    qryUpJStatus: TFDQuery;
    QRDBText8: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRLabel22: TQRLabel;
    qrlblContact: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape7: TQRShape;
    QRLabel13: TQRLabel;
    QRShape8: TQRShape;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRLabel23: TQRLabel;
    QRShape10: TQRShape;
    QRLabel24: TQRLabel;
    QRShape12: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRSysData1: TQRSysData;
    QRShape19: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape20: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape21: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape22: TQRShape;
    QRLabel33: TQRLabel;
    QRShape23: TQRShape;
    QRLabel34: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    qriHeadLogo: TQRImage;
    memAddress: TQRRichText;
    qryCompanyAddress: TFDQuery;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel37: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape44: TQRShape;
    QRRichText1: TQRRichText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel75: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel76: TQRLabel;
    QRDBText6: TQRDBText;
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
    bAccountsCopy: boolean;
    bIncludeVoucher: boolean;
    bPreview: boolean;
    bPrintLogo: boolean;
    bRetail: boolean;
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

end.
