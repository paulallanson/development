unit WTRPJobCutSched;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, AllCommon, gtQrCtrls;

type
  TfrmWTRPJobCutSched = class(TForm)
    qrpCutSchedule: TQuickRep;
    qryReport: TQuery;
    dtsReport: TDataSource;
    qryJElements: TQuery;
    qrgJob: TQRGroup;
    qrsdElement: TQRSubDetail;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    qrlblCount: TQRLabel;
    qrlblDescription: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qryUpJStatus: TQuery;
    qryUpSOStatus: TQuery;
    qrygetNotes: TQuery;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape35: TQRShape;
    qrrchTextInstallAddress: TQRRichText;
    QRLabel75: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    qriHeadLogo: TQRImage;
    qrmemCompanyAdd: TQRMemo;
    qryCompany: TQuery;
    gtQRShape1: TQRShape;
    gtQRShape2: TQRShape;
    gtQRShape3: TQRShape;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRLabel3: TQRLabel;
    gtQRDBText3: TQRDBText;
    gtQRShape4: TQRShape;
    gtQRLabel4: TQRLabel;
    gtQRShape5: TQRShape;
    qrmAddress: TQRMemo;
    gtQRLabel5: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRShape6: TQRShape;
    gtQRShape7: TQRShape;
    gtQRShape8: TQRShape;
    gtQRShape9: TQRShape;
    gtQRLabel8: TQRLabel;
    gtQRDBText6: TQRDBText;
    qrlblShowroomLabel: TQRLabel;
    qrlblShowroom: TQRLabel;
    qrlblFitterNumber: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRDBText8: TQRDBText;
    qryAddress: TQuery;
    dtsAddress: TDataSource;
    qryCustomer: TQuery;
    procedure qrpCutScheduleBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgJobBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdElementBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgJobAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    function BuildNotes(const iNotes: integer): string;
    function GetCompanyAddress: string;
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
var
  i: integer;
begin
  with qryCompany do
    begin
      close;
      open;
    end;

  with qryJElements do
    begin
      close;
      open;
    end;

  getCompanyAddress;

  qrmAddress.Lines.Clear;

  if qryReport.FieldByName('Address').AsInteger <> 0 then
    begin
//    read customer details first to get vat rate
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
        qrmAddress.Lines.Add(qryReport.FieldByName('Contact_Name').AsString);

  for i := 1 to 6 do
    begin
      if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
        qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
    end;

  qrrchTextInstallAddress.lines.Clear;
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));
end;

function TfrmWTRPJobCutSched.GetCompanyAddress: string;
var
  i: integer;
begin
  qrmemCompanyAdd.lines.clear;
  for i := 19 to 22 do
    begin
      if qryCompany.Fields[i].asstring = '' then
        continue
      else
        qrmemCompanyAdd.Lines.Append(Trim(qryCompany.Fields[i].asstring)) ;
    end;
      {Finally, add the phone number} ;
  qrmemCompanyAdd.Lines.Append('Tel: ' + Trim(qryCompany.fieldbyname('Telephone_number').asstring));
  if Trim(qryCompany.fieldbyname('Fax_Number').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append('Fax: ' + Trim(qryCompany.fieldbyname('Fax_Number').asstring));
  if Trim(qryCompany.fieldbyname('Email_Address').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append(Trim(qryCompany.fieldbyname('Email_Address').asstring));
  if Trim(qryCompany.fieldbyname('Web_Address').asstring) <> '' then
    qrmemCompanyAdd.Lines.Append(Trim(qryCompany.fieldbyname('Web_Address').asstring));
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
(*  qrlblJobNumber.caption := 'Job Number: '+ qryreport.fieldbyname('job').AsString;
  qrlblDateRequired.caption := 'Fitting Date: '+ paDateStr(qryreport.fieldbyname('Installation_Date').Asdatetime);
  qrlblSalesOrder.caption := 'Sales Order: '+ qryreport.fieldbyname('sales_order').AsString;
*)
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

procedure TfrmWTRPJobCutSched.FormCreate(Sender: TObject);
var
  LocalDir: string;
begin
  try
    LocalDir := extractfilepath(application.exename);
    qriHeadlogo.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
    qriHeadLogo.Picture.Bitmap.PixelFormat := pfDevice;
  except
  end;
end;

procedure TfrmWTRPJobCutSched.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {Show the showroom details}
  qrlblShowroomLabel.Enabled := (qryReport.FieldByName('Showroom_Name').asstring <> '');
  qrlblShowroom.Enabled := (qryReport.FieldByName('Showroom_Name').asstring <> '');
  qrlblShowroom.Caption := qryReport.FieldByName('Showroom_Name').asstring;
end;

end.
