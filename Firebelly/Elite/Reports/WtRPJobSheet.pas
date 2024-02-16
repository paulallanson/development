unit WtRPJobSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmwtRPJobSheet = class(TForm)
    qrpJobSheet: TQuickRep;
    qrgJob: TQRGroup;
    qryReport: TFDQuery;
    qrbPageHeader: TQRBand;
    dtsReport: TDataSource;
    qryCustomer: TFDQuery;
    qryCompany: TFDQuery;
    qrygetNotes: TFDQuery;
    qrlblSOCaption: TQRLabel;
    qryEndUser: TFDQuery;
    qryQElements: TFDQuery;
    qryQCutOuts: TFDQuery;
    qryQEdges: TFDQuery;
    qryJExtras: TFDQuery;
    Query1: TFDQuery;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    gtQRDBText3: TQRDBText;
    qryJRemedials: TFDQuery;
    qriHeadLogo: TQRImage;
    QRDBText4: TQRDBText;
    QRShape6: TQRShape;
    gtQRShape10: TQRShape;
    gtQRShape11: TQRShape;
    gtQRLabel4: TQRLabel;
    gtQRShape12: TQRShape;
    gtQRLabel5: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    gtQRLabel11: TQRLabel;
    gtQRLabel12: TQRLabel;
    gtQRLabel13: TQRLabel;
    gtQRShape13: TQRShape;
    gtQRShape14: TQRShape;
    gtQRLabel14: TQRLabel;
    gtQRLabel15: TQRLabel;
    gtQRLabel16: TQRLabel;
    gtQRLabel17: TQRLabel;
    gtQRLabel18: TQRLabel;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    gtQRShape17: TQRShape;
    gtQRShape18: TQRShape;
    gtQRLabel20: TQRLabel;
    gtQRLabel21: TQRLabel;
    gtQRLabel22: TQRLabel;
    gtQRLabel23: TQRLabel;
    gtQRLabel24: TQRLabel;
    gtQRLabel25: TQRLabel;
    gtQRShape19: TQRShape;
    gtQRShape20: TQRShape;
    gtQRLabel26: TQRLabel;
    gtQRLabel27: TQRLabel;
    gtQRShape1: TQRShape;
    qrlNotes: TQRLabel;
    qrrchTextNotes: TQRRichText;
    gtQRDBText1: TQRDBText;
    qrlblBrand: TQRLabel;
    qrlblThickness: TQRLabel;
    qrlblColour: TQRLabel;
    qrlblSlabSize: TQRLabel;
    qrlblNoOfSlabs: TQRLabel;
    qrlblEdgeProfile: TQRLabel;
    qryQUpstand: TFDQuery;
    qrlblUpstands: TQRLabel;
    qrlblCills: TQRLabel;
    qrlblBacksplash: TQRLabel;
    qrlblPolishedCutOuts: TQRLabel;
    qrlblUnPolishedCutOuts: TQRLabel;
    qrlblDrainerGrooves: TQRLabel;
    qrlblTapHoles: TQRLabel;
    gtQRShape2: TQRShape;
    gtQRLabel1: TQRLabel;
    qrrchApplianceDetails: TQRRichText;
    qrlblSockets: TQRLabel;
    qrlblPopUpSockets: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRShape3: TQRShape;
    procedure qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrgJobBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbJobFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrcbAvailabilityAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
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
begin
  with qryReport do
    begin
      close;
      parambyname('Job').asinteger := self.Job;
      open;
      result := recordcount;
    end;
end;

procedure TfrmwtRPJobSheet.qrpJobSheetBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  sWorktop := '';

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
  rGrossTotal := 0.00;
  rLineTotal := 0.00;
  rInstallTotal := 0.00;
  rSurveyTotal := 0.00;
  rDeliveryTotal := 0.00;
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

procedure TfrmwtRPJobSheet.qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iPolishedCount, iUnPolishedCount, iTapHolesCount: integer;
begin
  with qryQElements do
    begin
      close;
      open;
      qrlblBrand.caption := fieldbyname('Material_Description').AsString;
      qrlblThickness.caption := fieldbyname('Thickness_mm').AsString;
      qrlblColour.caption := fieldbyname('Worktop_Description').AsString;
      qrlblSlabSize.caption := fieldbyname('Length').AsString + 'mm x ' + fieldbyname('Depth').AsString + 'mm';
      qrlblNoOfSlabs.caption := formatfloat('0.00',fieldbyname('Quantity').Asfloat);
    end;

  with qryQEdges do
    begin
      close;
      open;
      qrlblEdgeProfile.caption := fieldbyname('Edge_Description').AsString;
    end;

  qrlblUpstands.caption := 'NO';
  qrlblCills.caption := 'NO';
  qrlblBackSplash.caption := 'NO';

  with qryQUpstand do
    begin
      close;
      open;

      while eof <> true do
        begin
          if (pos('upstand',fieldbyname('Use_Description').AsString) > 0) or (pos('Upstand',fieldbyname('Use_Description').AsString) > 0) or (fieldbyname('Use_Description').AsString = '') then
            begin
              qrlblUpstands.caption := 'YES';
            end
          else
          if (pos('Sill',fieldbyname('Use_Description').AsString) > 0) or (pos('sill',fieldbyname('Use_Description').AsString) > 0) or (pos('downstand',fieldbyname('Use_Description').AsString) > 0) or (pos('Downstand',fieldbyname('Use_Description').AsString) > 0) then
            qrlblCills.caption := 'YES'
          else
          if (pos('Splash',fieldbyname('Use_Description').AsString) > 0) or (pos('splash',fieldbyname('Use_Description').AsString) > 0) then
            qrlblBackSplash.caption := 'YES';
          next;
        end;
    end;

  iPolishedCount := 0;
  iUnPolishedCount := 0;
  iTapHolesCount := 0;
  
  qrlblDrainerGrooves.caption := 'NO';
  qrlblSockets.caption := 'NO';
  qrlblPopUpSockets.caption := 'NO';

  with qryQCutOuts do
    begin
      close;
      open;

      while eof <> true do
        begin
          if (pos('Polished',fieldbyname('Description').AsString) > 0) then
            begin
              iPolishedCount := iPolishedCount + 1;
            end
          else
          if (pos('unpolished',fieldbyname('Description').AsString) > 0) or (pos('Unpolished',fieldbyname('Description').AsString) > 0) then
            begin
              iUnPolishedCount := iunPolishedCount + 1;
            end
          else
          if (pos('tap',fieldbyname('Description').AsString) > 0) or (pos('Tap',fieldbyname('Description').AsString) > 0) then
            begin
              iTapHolesCount := iTapHolesCount + fieldbyname('Quantity').AsInteger;
            end
          else
          if (pos('grooves',fieldbyname('Description').AsString) > 0) or (pos('Grooves',fieldbyname('Description').AsString) > 0) then
            begin
              qrlblDrainerGrooves.caption := 'YES';
            end
          else
          if (pos('Socket',fieldbyname('Description').AsString) > 0) then
            begin
              qrlblSockets.caption := 'YES';
            end
          else
          if (pos('Pop Up socket',fieldbyname('Description').AsString) > 0) then
            begin
              qrlblPopUpSockets.caption := 'YES';
            end;
          next;
        end;
    end;

  qrlblPolishedCutOuts.caption := inttostr(iPolishedCount);
  qrlblUnPolishedCutOuts.caption := inttostr(iUnPolishedCount);
  qrlblTapHoles.caption := inttostr(iTapHolesCount);

  qrrchApplianceDetails.lines.clear;
  qrrchApplianceDetails.lines.add(qryReport.fieldbyname('Appliance_Details').asstring);
  
  qrrchTextNotes.lines.clear;
  qrrchTextNotes.lines.add(BuildNotes(qryReport.fieldbyname('Extra_Notes').asinteger));
end;

end.

