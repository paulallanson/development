unit STRPBarCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables, CCSCommon, printers, qrprntr,
  QBarcode;

type
  TSTRPBarCodeFrm = class(TForm)
    qrpDetails: TQuickRep;
    qryReport: TQuery;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    qryUpdCompany: TQuery;
    barcodeNo: TBarCode;
    qrlblType: TQRLabel;
    qrlblFoot: TQRDBText;
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    LastPallet: integer;
    FLabelType: string;
    procedure SetLabelType(const Value: string);
  public
    bPreview: boolean;
    SelCode: integer;
    bNewPallets: boolean;
    property LabelType: string read FLabelType write SetLabelType;
    function GetDetails: integer;
  end;

var
  STRPBarCodeFrm: TSTRPBarCodeFrm;

implementation

{$R *.dfm}


{ TSTRPBarCodeFrm }

function TSTRPBarCodeFrm.GetDetails: integer;
begin
  with qryreport do
    begin
      close;
      parambyname('Int_Sel_Code').asinteger := SelCode;
      open;
      result := recordcount;
    end;
end;

procedure TSTRPBarCodeFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if bNewPallets and not bPreview then
    begin
      LastPallet := strtoint(qryReport.fieldbyname('Text100').asstring);
      with qryUpdCompany do
        begin
          close;
          parambyname('Last_Pallet').asinteger := LastPallet;
          execsql;
        end;
    end;
end;

procedure TSTRPBarCodeFrm.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  qrpDetails.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }
end;

procedure TSTRPBarCodeFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  barcodeNo.Text := qryReport.fieldbyname('text100').asstring;
end;

procedure TSTRPBarCodeFrm.SetLabelType(const Value: string);
begin
  FLabelType := Value;
  if FLabelType = 'B' then
    begin
      qrlblType.caption := 'Bin Location';
//      qrlblFoot.visible := false;
      qrlblFoot.enabled := false;
    end
  else
    begin
      qrlblType.caption := 'Pallet';
//      qrlblFoot.visible := true;
      qrlblFoot.enabled := true;
    end;
end;

end.
