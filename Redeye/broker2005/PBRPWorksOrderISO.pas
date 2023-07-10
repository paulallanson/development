unit PBRPWorksOrderISO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, CCSPrint, DB, DBTables, CCSCommon, PBPOObjects,
  gtQrCtrls, gtQrExport, qrprntr, printers, QRCtrls;
type
  TPBRPWorksOrderISOFrm = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    CompSQL: TQuery;
    qryReport: TQuery;
    qrlblQuoteCaption: TgtQRLabel;
    QRDBText5: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    gtQRLabel14: TgtQRLabel;
    gtQRDBText3: TgtQRDBText;
    gtQRLabel15: TgtQRLabel;
    gtQRDBText4: TgtQRDBText;
    gtQRShape4: TgtQRShape;
    gtQRShape5: TgtQRShape;
    gtQRShape6: TgtQRShape;
    gtQRShape7: TgtQRShape;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    gtQRShape10: TgtQRShape;
    QRLabel9: TgtQRLabel;
    QRLabel10: TgtQRLabel;
    gtQRShape11: TgtQRShape;
    gtQRShape12: TgtQRShape;
    gtQRShape13: TgtQRShape;
    gtQRShape14: TgtQRShape;
    gtQRShape15: TgtQRShape;
    gtQRShape16: TgtQRShape;
    gtQRShape17: TgtQRShape;
    gtQRShape18: TgtQRShape;
    gtQRShape19: TgtQRShape;
    gtQRShape20: TgtQRShape;
    gtQRShape21: TgtQRShape;
    gtQRShape22: TgtQRShape;
    gtQRShape23: TgtQRShape;
    gtQRShape26: TgtQRShape;
    gtQRShape27: TgtQRShape;
    gtQRShape28: TgtQRShape;
    QRLabel11: TgtQRLabel;
    gtQRShape29: TgtQRShape;
    QRLabel12: TgtQRLabel;
    QRLabel13: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    gtQRShape1: TgtQRShape;
    QRLabel17: TgtQRLabel;
    QRLabel18: TgtQRLabel;
    QRLabel19: TgtQRLabel;
    QRLabel20: TgtQRLabel;
    QRLabel21: TgtQRLabel;
    QRLabel22: TgtQRLabel;
    QRLabel23: TgtQRLabel;
    QRLabel24: TgtQRLabel;
    QRLabel25: TgtQRLabel;
    QRLabel26: TgtQRLabel;
    QRLabel27: TgtQRLabel;
    QRLabel28: TgtQRLabel;
    QRLabel29: TgtQRLabel;
    QRLabel30: TgtQRLabel;
    gtQRShape3: TgtQRShape;
    QRLabel32: TgtQRLabel;
    QRLabel33: TgtQRLabel;
    QRLabel34: TgtQRLabel;
    gtQRShape24: TgtQRShape;
    QRLabel35: TgtQRLabel;
    QRLabel36: TgtQRLabel;
    QRLabel37: TgtQRLabel;
    QRLabel38: TgtQRLabel;
    gtQRLabel1: TgtQRLabel;
    gtQRLabel2: TgtQRLabel;
    gtQRLabel4: TgtQRLabel;
    gtQRLabel5: TgtQRLabel;
    gtQRLabel6: TgtQRLabel;
    gtQRLabel7: TgtQRLabel;
    gtQRShape8: TgtQRShape;
    gtQRLabel8: TgtQRLabel;
    gtQRLabel9: TgtQRLabel;
    gtQRLabel10: TgtQRLabel;
    gtQRLabel11: TgtQRLabel;
    gtQRLabel12: TgtQRLabel;
    gtQRShape2: TgtQRShape;
    gtQRLabel3: TgtQRLabel;
    gtQRLabel13: TgtQRLabel;
    gtQRLabel16: TgtQRLabel;
    gtQRLabel17: TgtQRLabel;
    gtQRLabel18: TgtQRLabel;
    gtQRLabel19: TgtQRLabel;
    gtQRLabel20: TgtQRLabel;
    gtQRLabel21: TgtQRLabel;
    gtQRLabel22: TgtQRLabel;
    gtQRLabel23: TgtQRLabel;
    gtQRLabel24: TgtQRLabel;
    gtQRLabel25: TgtQRLabel;
    gtQRLabel26: TgtQRLabel;
    gtQRLabel27: TgtQRLabel;
    gtQRLabel28: TgtQRLabel;
    gtQRLabel29: TgtQRLabel;
    gtQRLabel30: TgtQRLabel;
    gtQRLabel31: TgtQRLabel;
    gtQRShape9: TgtQRShape;
    gtQRShape25: TgtQRShape;
    gtQRShape30: TgtQRShape;
    gtQRShape31: TgtQRShape;
    gtQRShape32: TgtQRShape;
    gtQRShape33: TgtQRShape;
    gtQRShape34: TgtQRShape;
    gtQRShape35: TgtQRShape;
    gtQRShape36: TgtQRShape;
    gtQRShape37: TgtQRShape;
    gtQRShape38: TgtQRShape;
    gtQRShape39: TgtQRShape;
    gtQRShape40: TgtQRShape;
    gtQRShape41: TgtQRShape;
    gtQRShape42: TgtQRShape;
    gtQRShape43: TgtQRShape;
    gtQRShape44: TgtQRShape;
    gtQRShape45: TgtQRShape;
    gtQRShape46: TgtQRShape;
    gtQRShape47: TgtQRShape;
    gtQRShape48: TgtQRShape;
    gtQRShape49: TgtQRShape;
    gtQRShape50: TgtQRShape;
    gtQRShape51: TgtQRShape;
    gtQRShape52: TgtQRShape;
    gtQRShape53: TgtQRShape;
    gtQRShape54: TgtQRShape;
    gtQRShape55: TgtQRShape;
    gtQRShape56: TgtQRShape;
    gtQRShape58: TgtQRShape;
    gtQRShape59: TgtQRShape;
    gtQRShape61: TgtQRShape;
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
  qrpDetails.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
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
