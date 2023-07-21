unit WtRPJobFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, AllCommon, gtQrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPJobFitting = class(TForm)
    qrpJobSheet: TQuickRep;
    qryReport: TFDQuery;
    dtsReport: TDataSource;
    qryJElements: TFDQuery;
    qrgJob: TQRGroup;
    qrsdElement: TQRSubDetail;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    qrlblCount: TQRLabel;
    qrlblDescription: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrygetNotes: TFDQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblDateRequired: TQRLabel;
    qrlblJobNumber: TQRLabel;
    qrlblSalesOrder: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRShape35: TQRShape;
    qrrchTextInstallAddress: TQRRichText;
    QRLabel75: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel76: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    qryUpJStatus: TFDQuery;
    QRBand2: TQRBand;
    qrlblCustomerSignature: TQRLabel;
    qrshpSignature: TQRShape;
    qrlblterms3: TQRRichText;
    qrlblterms1: TQRLabel;
    qrlblterms2: TQRLabel;
    qrlblDeliveryComplete: TQRLabel;
    qrlblNoComponents: TQRLabel;
    grfjob: TQRBand;
    qrlblDate: TQRLabel;
    qrshpNoComponents: TQRShape;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgJobBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdElementBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgJobAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure grfjobBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    function BuildNotes(const iNotes: integer): string;
    { Private declarations }
  public
    bPreview: boolean;
    Job: integer;
    bAccountsCopy: boolean;
    function Getdetails: integer;
  end;

var
  frmWTRPJobFitting: TfrmWTRPJobFitting;

implementation

var
  ElementNo: integer;
  
{$R *.dfm}

function TfrmWTRPJobFitting.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmWTRPJobFitting.qrpJobSheetBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with qryJElements do
    begin
      close;
      open;
    end;

  qrrchTextInstallAddress.lines.Clear;
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));
end;

function TfrmWTRPJobFitting.BuildNotes(const iNotes: integer): string;
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

procedure TfrmWTRPJobFitting.qrgJobBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ElementNo := 0;
  qrlblJobNumber.caption := 'Job Number: '+ qryreport.fieldbyname('job').AsString;
  qrlblDateRequired.caption := 'Fitting Date: '+ paDateStr(qryreport.fieldbyname('Installation_Date').Asdatetime);
  qrlblSalesOrder.caption := 'Sales Order: '+ qryreport.fieldbyname('sales_order').AsString;
end;

procedure TfrmWTRPJobFitting.qrsdElementBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inc(ElementNo);
  if qryJElements.fieldbyname('Element_Number').asinteger > 1000 then
    qrlblDescription.caption := 'Upstand'
  else
    qrlblDescription.caption := 'Worktop';
  qrlblCount.Caption := inttostr(Elementno);
end;

procedure TfrmWTRPJobFitting.qrgJobAfterPrint(Sender: TQRCustomBand;
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

procedure TfrmWTRPJobFitting.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblDeliveryComplete.Enabled := false;
  qrlblNoComponents.enabled := false;
  qrlblCustomerSignature.enabled := false;
  qrlblTerms1.enabled := false;
  qrlblTerms2.enabled := false;
  qrlblTerms3.enabled := false;
  qrlblDate.caption := 'PAGE TO FOLLOW';
  qrshpSignature.Enabled := false;
  qrshpNoComponents.Enabled := false;
end;

procedure TfrmWTRPJobFitting.grfjobBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblDeliveryComplete.Enabled := true;
  qrlblNoComponents.enabled  := true;
  qrlblCustomerSignature.enabled := true;
  qrlblTerms1.enabled := true;
  qrlblTerms2.enabled := true;
  qrlblTerms3.enabled := true;
  qrlblDate.caption := 'DATE:';
  qrshpSignature.Enabled := true;
  qrshpNoComponents.Enabled := true;
end;

end.
