unit WTRPJobCutSched;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, AllCommon, gtQrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPJobCutSched = class(TForm)
    qrpCutSchedule: TQuickRep;
    qryReport: TFDQuery;
    dtsReport: TDataSource;
    qryJElements: TFDQuery;
    qrgJob: TQRGroup;
    qrsdElement: TQRSubDetail;
    QRShape1: TgtQRShape;
    QRShape2: TgtQRShape;
    QRShape3: TgtQRShape;
    QRShape4: TgtQRShape;
    QRShape6: TgtQRShape;
    QRShape8: TgtQRShape;
    qrlblCount: TgtQRLabel;
    qrlblDescription: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText4: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    qryUpJStatus: TFDQuery;
    qryUpSOStatus: TFDQuery;
    qrygetNotes: TFDQuery;
    QRBand1: TQRBand;
    QRLabel1: TgtQRLabel;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    qrlblDateRequired: TgtQRLabel;
    qrlblJobNumber: TgtQRLabel;
    qrlblSalesOrder: TgtQRLabel;
    QRLabel13: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRShape2: TgtQRShape;
    gtQRShape3: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRShape15: TgtQRShape;
    gtQRShape16: TgtQRShape;
    gtQRLabel5: TgtQRLabel;
    qrlblContact: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    qrlblYourPhone: TgtQRLabel;
    gtQRShape17: TgtQRShape;
    gtQRLabel7: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    gtQRShape19: TgtQRShape;
    gtQRShape9: TgtQRShape;
    gtQRLabel8: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    QRBand2: TQRBand;
    QRSysData1: TgtQRSysData;
    gtQRShape4: TgtQRShape;
    QRShape35: TgtQRShape;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryAddress: TFDQuery;
    gtQRLabel4: TgtQRLabel;
    qrmSiteAddress: TgtQRMemo;
    gtQRShape5: TgtQRShape;
    gtQRShape6: TgtQRShape;
    gtQRLabel9: TgtQRLabel;
    qrrchTextNotes: TgtQRRichText;
    procedure qrpCutScheduleBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgJobBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdElementBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgJobAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    function BuildNotes(const iNotes: integer): string;
    { Private declarations }
  public
    bPreview: boolean;
    Job: integer;
    function Getdetails: integer;
  end;

var
  frmWTRPJobCutSched: TfrmWTRPJobCutSched;

implementation

var
  ElementNo: integer;
  
{$R *.dfm}

function TfrmWTRPJobCutSched.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmWTRPJobCutSched.qrpCutScheduleBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with qryJElements do
    begin
      close;
      open;
    end;

//  qrrchTextInstallAddress.lines.Clear;
//  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));
end;

function TfrmWTRPJobCutSched.BuildNotes(const iNotes: integer): string;
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

procedure TfrmWTRPJobCutSched.qrgJobBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ElementNo := 0;
  qrlblJobNumber.caption := qryreport.fieldbyname('job').AsString;
  qrlblDateRequired.caption := paDateStr(qryreport.fieldbyname('Installation_Date').Asdatetime);
  qrlblSalesOrder.caption := qryreport.fieldbyname('sales_order').AsString;

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

  qrlblYourPhone.caption := dtsAddress.DataSet.fieldbyname('Telephone_Number').asstring;

  qrmSiteAddress.Lines.Clear;
  if qryReport.fieldbyname('Install_name').asstring <> '' then
    qrmSiteAddress.lines.add(qryReport.fieldbyname('Install_name').asstring);

  qrmSiteAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  if qryReport.fieldbyname('Install_Phone').asstring <> '' then
    qrmSiteAddress.lines.add('Telephone: '+qryReport.fieldbyname('Install_Phone').asstring);

  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Sales_Order_Extra_Notes').asinteger));
end;

procedure TfrmWTRPJobCutSched.qrsdElementBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmWTRPJobCutSched.qrgJobAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if (qryReport.fieldbyname('Job_status').asinteger < 30) and not bPreview then
    with qryUpJStatus do
      begin
        close;
        parambyname('Job').asinteger := qryReport.fieldbyname('Job').asinteger;
        parambyname('Job_Status').asinteger := 30;
        execsql;
      end;
end;

end.
