unit WtRPJobSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, StdCtrls, gtQrCtrls;

type
  TfrmwtRPJobSheet = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgJob: TQRGroup;
    qryReport: TQuery;
    qrbPageHeader: TQRBand;
    dtsReport: TDataSource;
    qryAddress: TQuery;
    qryCustomer: TQuery;
    dtsAddress: TDataSource;
    qryCompany: TQuery;
    qrygetNotes: TQuery;
    qrlblSOCaption: TgtQRLabel;
    qryEndUser: TQuery;
    QRLabel1: TgtQRLabel;
    qrsdJElements: TQRSubDetail;
    lblWorktopSize: TgtQRLabel;
    lblWorktopArea: TgtQRLabel;
    qrsdJCutOuts: TQRSubDetail;
    qrlblQuantity: TgtQRLabel;
    qrsdJEdges: TQRSubDetail;
    qrlblLength: TgtQRLabel;
    qrsdJExtras: TQRSubDetail;
    qryJElements: TQuery;
    qryJCutOuts: TQuery;
    qryJEdges: TQuery;
    qryJExtras: TQuery;
    qrsdJRemedials: TQRSubDetail;
    qrmRemedials: TgtQRMemo;
    QRDBText3: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText7: TgtQRDBText;
    qrgJRemedials: TQRGroup;
    QRLabel22: TgtQRLabel;
    QRLabel23: TgtQRLabel;
    QRLabel24: TgtQRLabel;
    qrlblRemedial: TgtQRLabel;
    gtQRShape3: TgtQRShape;
    gtQRShape5: TgtQRShape;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    Query1: TQuery;
    qrmAddress: TgtQRMemo;
    QRLabel5: TgtQRLabel;
    QRDBText4: TgtQRDBText;
    gtQRLabel7: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    QRShape2: TgtQRShape;
    QRShape3: TgtQRShape;
    gtQRShape1: TgtQRShape;
    QRLabel3: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRLabel2: TgtQRLabel;
    QRDBText1: TgtQRDBText;
    gtQRLabel1: TgtQRLabel;
    qrmSiteAddress: TgtQRMemo;
    gtQRShape2: TgtQRShape;
    gtQRShape4: TgtQRShape;
    gtQRShape6: TgtQRShape;
    gtQRShape7: TgtQRShape;
    gtQRLabel2: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    qrlblShowroomLabel: TgtQRLabel;
    qrlblShowroom: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    qrlblFitter: TgtQRLabel;
    QRDBText9: TgtQRDBText;
    qrlblFitterNumber: TgtQRLabel;
    QRDBText12: TgtQRDBText;
    gtQRLabel6: TgtQRLabel;
    gtQRDBText4: TgtQRDBText;
    qryJRemedials: TQuery;
    qriHeadLogo: TgtQRImage;
    qrcbNotes: TQRChildBand;
    qrrchTextNotes: TgtQRRichText;
    qrbJobFooter: TQRBand;
    qryReportSO: TQuery;
    qrlblCutOut: TgtQRLabel;
    qrlblEdgeDescription: TgtQRLabel;
    qrlblExtraDescription: TgtQRLabel;
    gtQRLabel12: TgtQRLabel;
    gtQRShape8: TgtQRShape;
    gtQRLabel8: TgtQRLabel;
    gtQRShape27: TgtQRShape;
    memApplianceDetails: TgtQRRichText;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
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
    procedure qrsdJExtrasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    sWorktop: string;
    function BuildNotes(const iNotes: integer): string;
  public
    Job: integer;
    bPreview: boolean;
    bPrintLogo: boolean;
    bPrintAcceptance: boolean;
    bEndUser: boolean;
    function Getdetails: integer;
  end;

var
  frmwtRPJobSheet: TfrmwtRPJobSheet;

implementation

uses allCommon;

var
  rLineTotal, rInstallTotal, rSurveyTotal, rDeliveryTotal, rGrossTotal: real;

{$R *.dfm}

function TfrmwtRPJobSheet.Getdetails: integer;
var
  iSalesOrder: integer;
begin
  iSalesOrder := 0;

  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;

      iSalesOrder := FieldByName('Sales_Order').asinteger;
      result := recordcount;
    end;

  if iSalesOrder <> 0 then
    begin
      with qryReport do
        begin
          Close;
          sql.Text := qryReportSO.sql.Text;
          parambyname('Sales_Order').asinteger := iSalesOrder;
          open;

          result := recordcount;
        end;
    end;
end;

procedure TfrmwtRPJobSheet.qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with qryCompany do
    begin
      close;
      open;
    end;
end;

procedure TfrmwtRPJobSheet.qrgJobBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  sWorktop := '';

  rGrossTotal := 0.00;
  rLineTotal := 0.00;
  rInstallTotal := 0.00;
  rSurveyTotal := 0.00;
  rDeliveryTotal := 0.00;

  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('SO_Extra_Notes').asinteger));

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

procedure TfrmwtRPJobSheet.qrbJobFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal, rNettTotal, rBalance: real;
  rInstallTotal, rSurveyTotal, rDeliveryTotal, rDiscount, rVat: real;
  sNett, sVat: string;
begin
end;

function TfrmwtRPJobSheet.BuildNotes(const iNotes: integer): string;
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

procedure TfrmwtRPJobSheet.qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrbPageHeader.Enabled := false;
end;

procedure TfrmwtRPJobSheet.qrsdJElementsBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPJobSheet.qrsdJCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblQuantity.caption := qryJCutOuts.fieldbyname('Quantity').asstring + ' ' + 'No.';
  qrlblCutOut.caption := qryJCutOuts.fieldbyname('Description').asstring;
end;

procedure TfrmwtRPJobSheet.qrsdJEdgesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblEdgeDescription.caption := qryJEdges.fieldbyname('Description').asstring;
  qrlblLength.caption := formatfloat('0.0',(qryJEdges.fieldbyname('Length').asfloat/1000)) + ' ' + 'LiM';
end;

procedure TfrmwtRPJobSheet.qrsdJRemedialsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrmRemedials.lines.clear;
  qrmRemedials.lines.add(BuildNotes(qryJRemedials.fieldbyname('Notes').asinteger));
end;

procedure TfrmwtRPJobSheet.qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
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

procedure TfrmwtRPJobSheet.qrcbNotesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iLines: integer;
begin
  memApplianceDetails.Lines.clear;
  memApplianceDetails.Lines.add(qryReport.fieldbyname('Appliance_Details').asstring);
//  qrcbNotes.height := 60;
//  if trim(qrrchtextNotes.lines[0]) = '' then
//    PrintBand := false;

//  iLines := qrrchTextNotes.lines.count;
//  qrrchTextNotes.Height := iLines * 18;
//  qrcbNotes.height := qrrchTextNotes.height + 40;
end;

procedure TfrmwtRPJobSheet.FormCreate(Sender: TObject);
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

procedure TfrmwtRPJobSheet.qrsdJExtrasBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblExtraDescription.caption := qryJExtras.fieldbyname('Description').asstring;
end;

end.

