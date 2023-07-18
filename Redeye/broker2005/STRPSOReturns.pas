unit STRPSOReturns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, DB, DBTables, ExtCtrls, Printers,
  CCSPrint, qrprntr, CCSCommon;

type
  TSTRPSOReturnsFrm = class(TForm)
    qrpDetails: TQuickRep;
    qryReport: TQuery;
    QRBand1: TQRBand;
    TitleQRLabel: TQRLabel;
    QRSysData1: TQRSysData;
    qrPart: TQRLabel;
    qrlblDesc: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData2: TQRSysData;
    qrbAccMgrHeader: TQRGroup;
    qrsubStock: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    qrbAccMgrFooter: TQRBand;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrlblLocations: TQRLabel;
    qryGetLocations: TQuery;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsubStockBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    AccountMgr, Customer, SalesOrder, JobBag: integer;
    bpreview: boolean;
    function GetDetails: integer;
  end;

var
  STRPSOReturnsFrm: TSTRPSOReturnsFrm;

implementation

{$R *.dfm}

function TSTRPSOReturnsFrm.GetDetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Office_Contact').asinteger := AccountMgr;
      parambyname('Customer').asinteger := Customer;
      parambyname('Job_Bag').asinteger := JobBag;
      open;
      result := recordcount;
    end;
end;

procedure TSTRPSOReturnsFrm.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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
end;

procedure TSTRPSOReturnsFrm.qrsubStockBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  sLinker: string;
begin
  qrlblLocations.Caption := '';
  with qryGetLocations do
    begin
      close;
      parambyname('Part_store').asinteger := qryReport.fieldbyname('Part_Store').asinteger;
      parambyname('Part').asstring := qryReport.fieldbyname('Part').asstring;
      parambyname('Part_Bin').asstring := qryReport.fieldbyname('Part_Bin').asstring;
      open;

      sLinker := '';
      while eof <> true do
        begin
          qrlblLocations.Caption := qrlblLocations.Caption + sLinker + qryGetLocations.fieldbyname('Part_Bin').asstring;
          sLinker := ', ';
          next;
        end;
    end;
end;

end.
