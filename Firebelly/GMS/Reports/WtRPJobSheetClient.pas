unit WtRPJobSheetClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, gtQrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPJobSheetClient = class(TForm)
    qrpDetails: TQuickRep;
    qrgJob: TQRGroup;
    qryReport: TFDQuery;
    qrbPageHeader: TQRBand;
    dtsReport: TDataSource;
    qryAddress: TFDQuery;
    qryCustomer: TFDQuery;
    dtsAddress: TDataSource;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qrlblSOCaption: TQRLabel;
    qryEndUser: TFDQuery;
    qrsdJElements: TQRSubDetail;
    lblWorktopSize: TQRLabel;
    lblWorktopArea: TQRLabel;
    qrsdJCutOuts: TQRSubDetail;
    qrlblCutOutDescription: TQRDBText;
    qrlblQuantity: TQRLabel;
    qrsdJEdges: TQRSubDetail;
    qrlblLength: TQRLabel;
    qrlblEdgeDescription: TQRDBText;
    qrsdJExtras: TQRSubDetail;
    qrlblExtraDescription: TQRDBText;
    qryJElements: TFDQuery;
    qryJCutOuts: TFDQuery;
    qryJEdges: TFDQuery;
    qryJExtras: TFDQuery;
    qrsdJRemedials: TQRSubDetail;
    qrmRemedials: TQRMemo;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    qrgJRemedials: TQRGroup;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    qrlblRemedial: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRLabel5: TQRLabel;
    Query1: TFDQuery;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    gtQRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    qryJRemedials: TFDQuery;
    qrcbNotes: TQRChildBand;
    qrlNotes: TQRLabel;
    qrrchTextNotes: TQRRichText;
    gtQRShape8: TQRShape;
    qrbJobFooter: TQRBand;
    qrmemCompanyAdd: TQRMemo;
    gtQRShape3: TQRShape;
    gtQRShape5: TQRShape;
    qrmAddress: TQRMemo;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    gtQRLabel7: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRLabel1: TQRLabel;
    qrmSiteAddress: TQRMemo;
    gtQRShape2: TQRShape;
    gtQRShape4: TQRShape;
    gtQRShape6: TQRShape;
    gtQRShape7: TQRShape;
    gtQRLabel2: TQRLabel;
    gtQRDBText1: TQRDBText;
    qrlblShowroomLabel: TQRLabel;
    qrlblShowroom: TQRLabel;
    qrlblFitter: TQRLabel;
    QRDBText9: TQRDBText;
    qrlblFitterNumber: TQRLabel;
    QRDBText12: TQRDBText;
    gtQRLabel6: TQRLabel;
    gtQRDBText4: TQRDBText;
    QRShape1: TQRShape;
    gtQRShape9: TQRShape;
    QRShape6: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    gtQRDBText3: TQRDBText;
    qriHeadLogo: TQRImage;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgJobBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbJobFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdJElementsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdJCutOutsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdJEdgesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdJRemedialsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbNotesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
    function GetCompanyAddress: string;
  public
    Job: integer;
    bPreview: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bEndUser: boolean;
    function Getdetails: integer;
  end;

var
  frmWTRPJobSheetClient: TfrmWTRPJobSheetClient;

implementation

uses allCommon;

var
  rLineTotal, rInstallTotal, rSurveyTotal, rDeliveryTotal, rGrossTotal: real;

{$R *.dfm}

function TfrmWTRPJobSheetClient.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmWTRPJobSheetClient.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  sWorktop := '';

  with qryCompany do
    begin
      close;
      open;
    end;

  with qryJElements do
    begin
      close;
      open;
      qrsdJElements.Enabled := (recordcount > 0)
    end;
  with qryJCutOuts do
    begin
      close;
      open;
      qrsdJCutOuts.Enabled := (recordcount > 0)
    end;
  with qryJEdges do
    begin
      close;
      open;
      qrsdJEdges.Enabled := (recordcount > 0)
    end;
  with qryJExtras do
    begin
      close;
      open;
      qrsdJExtras.Enabled := (recordcount > 0)
    end;
  with qryJRemedials do
    begin
      close;
      open;
      qrsdJRemedials.Enabled := (recordcount > 0)
    end;

  getCompanyAddress;

  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Extra_Notes').asinteger));
end;

procedure TfrmWTRPJobSheetClient.qrgJobBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  rGrossTotal := 0.00;
  rLineTotal := 0.00;
  rInstallTotal := 0.00;
  rSurveyTotal := 0.00;
  rDeliveryTotal := 0.00;

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
  if not bEndUser then
    begin
      if trim(qryReport.FieldByName('Contact_Name').AsString) <> '' then
        qrmAddress.Lines.Add(qryReport.FieldByName('Contact_Name').AsString);
      for i := 1 to 6 do
        begin
          if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
            qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
        end;
    end
  else
    begin
      qryEndUser.close;
      qryEndUser.parambyname('End_User').asinteger := qryReport.FieldByName('End_User').AsInteger;
      qryEndUser.open;
      dtsAddress.dataset := qryEndUser;

      for i := 1 to 6 do
        begin
          if trim(dtsAddress.DataSet.fields[i].asstring) <> '' then
            qrmAddress.Lines.Add(trim(dtsAddress.DataSet.fields[i].asstring))
        end;
    end;

  qrmSiteAddress.Lines.Clear;
  if qryReport.fieldbyname('Install_name').asstring <> '' then
    qrmSiteAddress.lines.add(qryReport.fieldbyname('Install_name').asstring);

  qrmSiteAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  if qryReport.fieldbyname('Install_Phone').asstring <> '' then
    qrmSiteAddress.lines.add('Telephone: '+qryReport.fieldbyname('Install_Phone').asstring);
end;

procedure TfrmWTRPJobSheetClient.qrbJobFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rBalance: real;
  rInstallTotal, rSurveyTotal, rDeliveryTotal, rDiscount, rVat: real;
  sNett, sVat: string;
begin
end;

function TfrmWTRPJobSheetClient.BuildNotes(const iNotes: integer): string;
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

procedure TfrmWTRPJobSheetClient.qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrbPageHeader.Enabled := false;
end;

procedure TfrmWTRPJobSheetClient.qrsdJElementsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rArea, rPolished: real;
  sUpstand, sDescription: string;
begin
  lblWorktopSize.caption := '';
  lblWorktopArea.caption := '';

  rPolished := 0;

  if qryJElements.fieldbyname('Description').asstring <> sWorktop then
    begin
      sWorktop := qryJElements.fieldbyname('Description').asstring;
      sDescription := qryJElements.fieldbyname('Thickness_mm').asstring + ' ' +
                      qryJElements.fieldbyname('Description').asstring;
    end
  else
      sDescription := qryJElements.fieldbyname('Thickness_mm').asstring + ' ' +
                      qryJElements.fieldbyname('Description').asstring;

  if qryJElements.fieldbyname('Element_number').asinteger > 1000 then
    begin
      if qryJElements.fieldbyname('Use_Description').asstring <> '' then
        begin
          if qryJElements.fieldbyname('Upstand_Polish_Price').asfloat <> 0 then
            sUpstand := '(Polished ' + qryJElements.fieldbyname('Use_Description').asstring + ') '
          else
            sUpstand := '(' + qryJElements.fieldbyname('Use_Description').asstring + ') '
        end
      else
        begin
          if qryJElements.fieldbyname('Upstand_Polish_Price').asfloat <> 0 then
            sUpstand := ' (Polished Upstand) '
          else
            sUpstand := ' (Upstand) ';
        end;
    end
  else
    sUpstand := ' ';

  lblWorktopSize.caption := sDescription + sUpstand +
                            qryJElements.fieldbyname('Length').asstring + ' x ' +
                            qryJElements.fieldbyname('Depth').asstring + ' mm ' +
                            qryJElements.fieldbyname('Quantity').asstring + ' No';
  rArea :=  ((qryJElements.fieldbyname('Length').asinteger *
            qryJElements.fieldbyname('Depth').asinteger *
            qryJElements.fieldbyname('Quantity').asinteger)/1000000);
  lblWorktopArea.caption := formatfloat('0.00',rArea) + ' ' + 'm2';

end;

procedure TfrmWTRPJobSheetClient.qrsdJCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblQuantity.caption := qryJCutOuts.fieldbyname('Quantity').asstring + ' ' + 'No.';
end;

procedure TfrmWTRPJobSheetClient.qrsdJEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblLength.caption := formatfloat('0.0',(qryJEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';
end;

procedure TfrmWTRPJobSheetClient.qrsdJRemedialsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmRemedials.lines.clear;
  qrmRemedials.lines.add(BuildNotes(qryJRemedials.fieldbyname('Notes').asinteger));
end;

procedure TfrmWTRPJobSheetClient.qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {Show the fitter details}
  qrlblfitter.Enabled := (qryReport.FieldByName('Fitter_Name').asstring <> '');
  qrlblFitterNumber.Enabled := (qryReport.FieldByName('Fitter_Number').asstring <> '');

  {Show the showroom details}
  qrlblShowroomLabel.Enabled := (qryReport.FieldByName('Showroom_Name').asstring <> '');
  qrlblShowroom.Enabled := (qryReport.FieldByName('Showroom_Name').asstring <> '');
  qrlblShowroom.Caption := qryReport.FieldByName('Showroom_Name').asstring;
end;

procedure TfrmWTRPJobSheetClient.qrcbNotesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
begin
  qrcbNotes.height := 60;
  if trim(qrrchtextNotes.lines[0]) = '' then
    PrintBand := false;

  iLines := qrrchTextNotes.lines.count;
  qrrchTextNotes.Height := iLines * 18;
  qrcbNotes.height := qrrchTextNotes.height + 40;
end;

procedure TfrmWTRPJobSheetClient.FormCreate(Sender: TObject);
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

function TfrmwtRPJobSheetClient.GetCompanyAddress: string;
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

end.

