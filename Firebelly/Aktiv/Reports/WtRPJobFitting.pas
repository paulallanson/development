unit WtRPJobFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, AllCommon, gtQrCtrls,
  jpeg,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPJobFitting = class(TForm)
    qrpJobSheet: TQuickRep;
    qryReport: TFDQuery;
    dtsReport: TDataSource;
    qrgJob: TQRGroup;
    qrsdElement: TQRSubDetail;
    qrygetNotes: TFDQuery;
    QRBand1: TQRBand;
    QRLabel1: TgtQRLabel;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRSysData1: TgtQRSysData;
    qrlblDateRequired: TgtQRLabel;
    qrlblJobNumber: TgtQRLabel;
    qrlblSalesOrder: TgtQRLabel;
    QRLabel22: TgtQRLabel;
    QRDBText7: TgtQRDBText;
    QRLabel7: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    QRLabel9: TgtQRLabel;
    QRShape35: TgtQRShape;
    qrrchTextInstallAddress: TgtQRRichText;
    QRLabel75: TgtQRLabel;
    QRDBText9: TgtQRDBText;
    QRLabel76: TgtQRLabel;
    QRDBText10: TgtQRDBText;
    QRLabel13: TgtQRLabel;
    qryUpJStatus: TFDQuery;
    grfjob: TQRBand;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRDBText6: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText2: TgtQRDBText;
    QRShape1: TgtQRShape;
    QRShape2: TgtQRShape;
    QRShape3: TgtQRShape;
    QRShape4: TgtQRShape;
    QRShape6: TgtQRShape;
    QRShape8: TgtQRShape;
    qrlblCount: TgtQRLabel;
    qrlblDescription: TgtQRLabel;
    qryJElements: TFDQuery;
    qrlblCustomerSignature: TgtQRLabel;
    qrshpSignature: TgtQRShape;
    qrlblterms3: TgtQRRichText;
    qrlblterms1: TgtQRLabel;
    qrlblterms2: TgtQRLabel;
    qrlblDeliveryComplete: TgtQRLabel;
    qrlblNoComponents: TgtQRLabel;
    qrlblDate: TgtQRLabel;
    qrshpNoComponents: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRLabel2: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRLabel3: TgtQRLabel;
    qrmemRiskNotes: TgtQRRichText;
    qrVoucher: TQRChildBand;
    gtQRImage1: TgtQRImage;
    gtQRImage2: TgtQRImage;
    gtQRShape3: TgtQRShape;
    gtQRDBText1: TgtQRDBText;
    gtQRDBText2: TgtQRDBText;
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
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    function BuildNotes(const iNotes: integer): string;
    { Private declarations }
  public
    bIncludeVoucher: boolean;
    bRetail: boolean;
    bPreview: boolean;
    bPrintLogo: boolean;
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
    begin
      if qryJElements.fieldbyname('Use_Description').asstring <> '' then
        qrlblDescription.caption := qryJElements.fieldbyname('Use_Description').asstring
      else
        qrlblDescription.caption := 'Upstand';
    end
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
  qrrchTextInstallAddress.lines.Clear;
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  qrmemRiskNotes.lines.Clear;
  qrmemRiskNotes.lines.add(BuildNotes(qryReport.fieldbyname('Risk_Notes').asinteger));

  qrVoucher.enabled := bRetail and bIncludeVoucher;

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

procedure TfrmWTRPJobFitting.qrpJobSheetBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with qryJElements do
    begin
      close;
      open;
    end;
end;

end.
