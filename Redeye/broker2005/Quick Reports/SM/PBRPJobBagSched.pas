unit PBRPJobBagSched;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, QuickRpt, QRCtrls, gtQrCtrls, gtQrExport, Printers,
  CCSPrint, qrprntr, CCSCommon;

type
  TfrmPBRPJobBagSched = class(TForm)
    qryReport: TQuery;
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblQuoteCaption: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    qrgJobBag: TQRGroup;
    QRLabel1: TgtQRLabel;
    dtsReport: TDataSource;
    gtQRFilters1: TgtQRFilters;
    QRLabel6: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRDBText3: TgtQRDBText;
    QRBand1: TQRBand;
    gtQRDBText9: TgtQRDBText;
    QRShape1: TgtQRShape;
    gtQRLabel1: TgtQRLabel;
    gtQRDBText1: TgtQRDBText;
    ReportImage: TgtQRImage;
    QRShape5: TgtQRShape;
    QRLabel8: TgtQRLabel;
    QRLabel9: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    QRLabel13: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    QRLabel15: TgtQRLabel;
    QRLabel16: TgtQRLabel;
    QRLabel17: TgtQRLabel;
    QRLabel18: TgtQRLabel;
    QRLabel19: TgtQRLabel;
    QRLabel20: TgtQRLabel;
    QRLabel21: TgtQRLabel;
    QRShape9: TgtQRShape;
    QRShape11: TgtQRShape;
    QRShape12: TgtQRShape;
    QRShape14: TgtQRShape;
    QRShape7: TgtQRShape;
    QRShape15: TgtQRShape;
    QRShape16: TgtQRShape;
    QRShape6: TgtQRShape;
    QRShape8: TgtQRShape;
    QRShape17: TgtQRShape;
    QRShape10: TgtQRShape;
    QRShape18: TgtQRShape;
    QRShape13: TgtQRShape;
    qrlblArtworkDue: TgtQRLabel;
    qrlblArtworkProof: TgtQRLabel;
    qrlblArtworkApproval: TgtQRLabel;
    qrlblDataRequired: TgtQRLabel;
    qrlblBriefRequired: TgtQRLabel;
    qrlblTextRequired: TgtQRLabel;
    qrlblBriefAvailable: TgtQRLabel;
    qrlblTextAvailable: TgtQRLabel;
    qrlblSEPClient: TgtQRLabel;
    qrlblSEPApproval: TgtQRLabel;
    qrlblTextProof: TgtQRLabel;
    qrlblProofRequired: TgtQRLabel;
    qrlblProofApproval: TgtQRLabel;
    qrgfJobBag: TQRBand;
    gtQRLabel12: TgtQRLabel;
    memoNotes: TgtQRMemo;
    GetNarrSQL: TQuery;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    qrlblDataAvailable: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRShape3: TgtQRShape;
    qrlblPDFProofArtwork: TgtQRLabel;
    qrlblPDFProofRequired: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    gtQRShape4: TgtQRShape;
    qrlblPDFProofApproval: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRDBText2: TgtQRDBText;
    gtQRLabel7: TgtQRLabel;
    procedure qrgJobBagBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrGrpProcessesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BuildNotes(aQuery: TQuery; const iNarrative: integer);
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

  BuildNotes(qryReport, qryReport.fieldbyname('Narrative').asinteger);

  if memoNotes.lines.text = '' then
    qrgfJobBag.enabled := false
  else
    qrgfJobBag.enabled := true;
end;

procedure TfrmPBRPJobBagSched.BuildNotes(aQuery: TQuery;
  const iNarrative : integer);
var
  aStr : string;
begin
  with aQuery do
  begin  {If any notes then get then}
    if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Narrative_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
    MemoNotes.Lines.Clear;
    MemoNotes.Lines.Text := aStr;
  end;
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
  qrlblDataAvailable.Caption := pbdatestr(qryReport.fieldbyname('Data_Available_Date').asdatetime);
  qrlblTextAvailable.Caption := pbdatestr(qryReport.fieldbyname('Text_Available_Date').asdatetime);
  qrlblTextProof.Caption := pbdatestr(qryReport.fieldbyname('Text_Proof_Date').asdatetime) ;

  qrlblPDFProofArtwork.Caption := pbdatestr(qryReport.fieldbyname('PDF_Proof_Artwork_Date').asdatetime);
  qrlblPDFProofRequired.Caption := pbdatestr(qryReport.fieldbyname('PDF_Proof_Required_Date').asdatetime);
  qrlblPDFProofApproval.Caption := pbdatestr(qryReport.fieldbyname('PDF_Proof_Approval_Date').asdatetime);

  qrlblProofRequired.Caption := pbdatestr(qryReport.fieldbyname('Proof_Required_Date').asdatetime);
  qrlblProofApproval.Caption := pbdatestr(qryReport.fieldbyname('Proof_Approval_Date').asdatetime);
  qrlblSEPClient.Caption := pbdatestr(qryReport.fieldbyname('Sample_To_Client').asdatetime);
  qrlblSEPApproval.Caption := pbdatestr(qryReport.fieldbyname('Sample_Approval').asdatetime);
end;

end.
