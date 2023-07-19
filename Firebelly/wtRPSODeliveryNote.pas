unit wtRPSODeliveryNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, QRCtrls, QuickRpt, ExtCtrls, AllCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPSODeliveryNote = class(TForm)
    qrpDetails: TQuickRep;
    qrbdetails: TQRSubDetail;
    QRGroup1: TQRGroup;
    qryReport: TFDQuery;
    dtsReport: TDataSource;
    qryGetNotes: TFDQuery;
    gtQRDBText8: TQRDBText;
    gtQRDBText9: TQRDBText;
    qrbSignature: TQRBand;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel8: TQRLabel;
    QRBand1: TQRBand;
    gtQRLabel28: TQRLabel;
    qriheadlogo: TQRImage;
    gtQRLabel31: TQRLabel;
    gtQRLabel32: TQRLabel;
    qrrchTextInstallAddress: TQRRichText;
    gtQRLabel34: TQRLabel;
    gtQRLabel33: TQRLabel;
    gtQRDBText10: TQRDBText;
    gtQRLabel1: TQRLabel;
    qrlblDeliveryDate: TQRLabel;
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
