unit PBRPJobBagSched;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, QrExport, Printers,
  CCSPrint, qrprntr, CCSCommon;

type
  TfrmPBRPJobBagSched = class(TForm)
    qryReport: TQuery;
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblQuoteCaption: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    qrgJobBag: TQRGroup;
    QRLabel1: TQRLabel;
    dtsReport: TDataSource;
    gtQRFilters1: TgtQRFilters;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    gtQRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    ReportImage: TQRImage;
    QRShape5: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape7: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape17: TQRShape;
    QRShape10: TQRShape;
    QRShape18: TQRShape;
    QRShape13: TQRShape;
    qrlblArtworkDue: TQRLabel;
    qrlblArtworkProof: TQRLabel;
    qrlblArtworkApproval: TQRLabel;
    qrlblDataRequired: TQRLabel;
    qrlblBriefRequired: TQRLabel;
    qrlblTextRequired: TQRLabel;
    qrlblBriefAvailable: TQRLabel;
    qrlblTextAvailable: TQRLabel;
    qrlblSEPClient: TQRLabel;
    qrlblSEPApproval: TQRLabel;
    qrlblTextProof: TQRLabel;
    qrlblProofRequired: TQRLabel;
    qrlblProofApproval: TQRLabel;
    procedure qrgJobBagBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrGrpProcessesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    rTotalCost, rTotalSell: real;
    ipage: integer;
  public
    ForceNewPage: boolean;
    Key: real;
    bPreview: boolean;
    PrinterSettings: TPrinterSettings;
    function Getdetails: integer;
  end;

var
  frmPBRPJobBagSched: TfrmPBRPJobBagSched;

implementation

uses PBImages;

{$R *.dfm}

function TfrmPBRPJobBagSched.Getdetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Job_Bag').asfloat := self.key;
      open;
      result := recordcount;
    end;
end;

procedure TfrmPBRPJobBagSched.qrgJobBagBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: integer;
begin
  {Get the customer address details}

end;

procedure TfrmPBRPJobBagSched.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }


  ReportImage.Picture := PBImagesFrm.ReportImage.Picture;

  iPage := 0;
end;

procedure TfrmPBRPJobBagSched.qrGrpProcessesBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inc(iPage);

end;

procedure TfrmPBRPJobBagSched.qrbPageHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblArtworkDue.Caption := pbdatestr(qryReport.fieldbyname('Artwork_Due_Date').asdatetime);
  qrlblArtworkProof.Caption := pbdatestr(qryReport.fieldbyname('Artwork_Proof_Date').asdatetime);
  qrlblArtworkApproval.Caption := pbdatestr(qryReport.fieldbyname('Artwork_Approval_Date').asdatetime);
  qrlblDataRequired.Caption := pbdatestr(qryReport.fieldbyname('Data_Required_Date').asdatetime);
  qrlblBriefRequired.Caption := pbdatestr(qryReport.fieldbyname('Brief_Required_Date').asdatetime);
  qrlblTextRequired.Caption := pbdatestr(qryReport.fieldbyname('Text_Required_Date').asdatetime);
  qrlblBriefAvailable.Caption := pbdatestr(qryReport.fieldbyname('Brief_Available_Date').asdatetime);
  qrlblTextAvailable.Caption := pbdatestr(qryReport.fieldbyname('Text_Available_Date').asdatetime);
  qrlblTextProof.Caption := pbdatestr(qryReport.fieldbyname('Text_Proof_Date').asdatetime) ;
  qrlblProofRequired.Caption := pbdatestr(qryReport.fieldbyname('Proof_Required_Date').asdatetime);
  qrlblProofApproval.Caption := pbdatestr(qryReport.fieldbyname('Proof_Approval_Date').asdatetime);
  qrlblSEPClient.Caption := pbdatestr(qryReport.fieldbyname('Sample_To_Client').asdatetime);
  qrlblSEPApproval.Caption := pbdatestr(qryReport.fieldbyname('Sample_Approval').asdatetime);
end;

end.
