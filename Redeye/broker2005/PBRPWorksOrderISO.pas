unit PBRPWorksOrderISO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, CCSPrint, DB, DBTables, CCSCommon, PBPOObjects,
  QrExport, qrprntr, printers, QRCtrls;
type
  TPBRPWorksOrderISOFrm = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    CompSQL: TQuery;
    qryReport: TQuery;
    qrlblQuoteCaption: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    gtQRLabel14: TQRLabel;
    gtQRDBText3: TQRDBText;
    gtQRLabel15: TQRLabel;
    gtQRDBText4: TQRDBText;
    gtQRShape4: TQRShape;
    gtQRShape5: TQRShape;
    gtQRShape6: TQRShape;
    gtQRShape7: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    gtQRShape10: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    gtQRShape11: TQRShape;
    gtQRShape12: TQRShape;
    gtQRShape13: TQRShape;
    gtQRShape14: TQRShape;
    gtQRShape15: TQRShape;
    gtQRShape16: TQRShape;
    gtQRShape17: TQRShape;
    gtQRShape18: TQRShape;
    gtQRShape19: TQRShape;
    gtQRShape20: TQRShape;
    gtQRShape21: TQRShape;
    gtQRShape22: TQRShape;
    gtQRShape23: TQRShape;
    gtQRShape26: TQRShape;
    gtQRShape27: TQRShape;
    gtQRShape28: TQRShape;
    QRLabel11: TQRLabel;
    gtQRShape29: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    gtQRShape1: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    gtQRShape3: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    gtQRShape24: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRLabel5: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRShape8: TQRShape;
    gtQRLabel8: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    gtQRLabel11: TQRLabel;
    gtQRLabel12: TQRLabel;
    gtQRShape2: TQRShape;
    gtQRLabel3: TQRLabel;
    gtQRLabel13: TQRLabel;
    gtQRLabel16: TQRLabel;
    gtQRLabel17: TQRLabel;
    gtQRLabel18: TQRLabel;
    gtQRLabel19: TQRLabel;
    gtQRLabel20: TQRLabel;
    gtQRLabel21: TQRLabel;
    gtQRLabel22: TQRLabel;
    gtQRLabel23: TQRLabel;
    gtQRLabel24: TQRLabel;
    gtQRLabel25: TQRLabel;
    gtQRLabel26: TQRLabel;
    gtQRLabel27: TQRLabel;
    gtQRLabel28: TQRLabel;
    gtQRLabel29: TQRLabel;
    gtQRLabel30: TQRLabel;
    gtQRLabel31: TQRLabel;
    gtQRShape9: TQRShape;
    gtQRShape25: TQRShape;
    gtQRShape30: TQRShape;
    gtQRShape31: TQRShape;
    gtQRShape32: TQRShape;
    gtQRShape33: TQRShape;
    gtQRShape34: TQRShape;
    gtQRShape35: TQRShape;
    gtQRShape36: TQRShape;
    gtQRShape37: TQRShape;
    gtQRShape38: TQRShape;
    gtQRShape39: TQRShape;
    gtQRShape40: TQRShape;
    gtQRShape41: TQRShape;
    gtQRShape42: TQRShape;
    gtQRShape43: TQRShape;
    gtQRShape44: TQRShape;
    gtQRShape45: TQRShape;
    gtQRShape46: TQRShape;
    gtQRShape47: TQRShape;
    gtQRShape48: TQRShape;
    gtQRShape49: TQRShape;
    gtQRShape50: TQRShape;
    gtQRShape51: TQRShape;
    gtQRShape52: TQRShape;
    gtQRShape53: TQRShape;
    gtQRShape54: TQRShape;
    gtQRShape55: TQRShape;
    gtQRShape56: TQRShape;
    gtQRShape58: TQRShape;
    gtQRShape59: TQRShape;
    gtQRShape61: TQRShape;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    FWorksOrder: double;
    FPreview: boolean;
    procedure SetWorksOrder(const Value: double);
    procedure SetPreview(const Value: boolean);
  public
    bPrintLogo: boolean;
    iCustomer, iOperator: integer;
    sOperatorName, sOperatorPosition, sOperatorPhone, sOperatorJobTitle: string;
    PrinterSettings: TPrinterSettings;
    function GetDetails: integer;
    property Preview: boolean read FPreview write SetPreview;
    property WorksOrder: double read FWorksOrder write SetWorksOrder;
  end;

var
  PBRPWorksOrderISOFrm: TPBRPWorksOrderISOFrm;

implementation

uses PBImages;

{$R *.dfm}

function TPBRPWorksOrderISOFrm.GetDetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Works_Order_Number').asfloat := self.WorksOrder;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPWorksOrderISOFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  icount: Integer;
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
  irow: integer;
begin

  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.copies := Copies;   {set the number of copies }
  qrpDetails.PrinterSettings.PaperSize := Size;   {set the number of copies }
end;

procedure TPBRPWorksOrderISOFrm.SetWorksOrder(const Value: double);
begin
  FWorksOrder := Value;
end;

procedure TPBRPWorksOrderISOFrm.SetPreview(const Value: boolean);
begin
  FPreview := Value;
end;

end.
