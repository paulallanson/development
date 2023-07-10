unit wtRPSODeliveryNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, gtQrCtrls, QRCtrls, QuickRpt, ExtCtrls, AllCommon;

type
  TfrmWTRPSODeliveryNote = class(TForm)
    qrpDetails: TQuickRep;
    qrbdetails: TQRSubDetail;
    QRGroup1: TQRGroup;
    qryReport: TQuery;
    dtsReport: TDataSource;
    qryGetNotes: TQuery;
    gtQRDBText8: TgtQRDBText;
    gtQRDBText9: TgtQRDBText;
    qrbSignature: TQRBand;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRLabel8: TgtQRLabel;
    QRBand1: TQRBand;
    gtQRLabel28: TgtQRLabel;
    qriheadlogo: TgtQRImage;
    gtQRLabel31: TgtQRLabel;
    gtQRLabel32: TgtQRLabel;
    qrrchTextInstallAddress: TgtQRRichText;
    gtQRLabel34: TgtQRLabel;
    gtQRLabel33: TgtQRLabel;
    gtQRDBText10: TgtQRDBText;
    gtQRLabel1: TgtQRLabel;
    qrlblDeliveryDate: TgtQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbdetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    function BuildNotes(const iNotes: integer): string;
    { Private declarations }
  public
    SalesOrder: integer;
    bPreview: boolean;
  end;

var
  frmWTRPSODeliveryNote: TfrmWTRPSODeliveryNote;

implementation

{$R *.dfm}

procedure TfrmWTRPSODeliveryNote.FormCreate(Sender: TObject);
begin
  try
    qriHeadlogo.picture.loadfromfile('wtHeadLogo.bmp');
  except
  end;
end;

procedure TfrmWTRPSODeliveryNote.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {Installation Address Details}
  qrrchTextInstallAddress.lines.clear;
  qrrchTextInstallAddress.lines.add(BuildNotes(qryReport.fieldbyname('Install_Address').asinteger));

  qrlblDeliveryDate.Caption := padatestr(qryReport.fieldbyname('Date_Required').asdatetime);
end;

procedure TfrmWTRPSODeliveryNote.qrbdetailsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rArea: real;
  sUpstand, sDescription: string;
begin
end;

function TfrmWTRPSODeliveryNote.BuildNotes(const iNotes: integer): string;
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
          astr := aStr + trimleft(qryGetNotes.fieldbyname('Notes_text').asstring);
          if Length(qryGetNotes.fieldbyname('Notes_text').asstring) < 100 then
            aStr := aStr + ' ';
          qryGetNotes.next;
        end;
      qryGetNotes.close;
    end;
  result := aStr;
end;


end.
