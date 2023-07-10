unit STRPStockReturns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables, qrprntr, Printers, CCSCommon;

type
  TSTRPStockReturnsFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblSelection: TQRLabel;
    qryReport: TQuery;
    qrGroup: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    qrlblGroupHeader: TQRLabel;
    qrdbtext: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qryDummy: TQuery;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
  public
    SelCode: integer;
    function GetDetails: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPStockReturnsFrm: TSTRPStockReturnsFrm;

implementation

uses STRSStockReturns;


{$R *.dfm}

function TSTRPStockReturnsFrm.GetDetails: integer;
var
  temp: string;
begin
  qryReport.sql.clear;
  qryReport.sql.Text := qryDummy.sql.Text;

  temp := temp + 'ORDER BY Production_Location_Name, Store_Stock.Part';

  qryReport.SQL.Add(temp);
  with qryReport do
    begin
      close;
      parambyname('Production_Location').AsInteger := SelCode;
      open;
      result := recordcount;
    end;
end;

procedure TSTRPStockReturnsFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  qrGroup.Enabled := true;
  qrGroup.Expression := 'Production_Location_Name';
  qrlblGroupHeader.caption := 'Production Location: ';
  qrdbtext.DataField := 'Production_Location_Name'
end;

procedure TSTRPStockReturnsFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempstr := '"Production Location"'
              + ',"Product"'
              + ',"Description"'
              + ',"Free Stock"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TSTRPStockReturnsFrm.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Production Location
    tempStr := '"' + qryReport.fieldbyname('Production_Location_Name').asstring + '"';

    //Part
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part').asstring + '"';

    //Decsription
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part_Description').asstring + '"';

    //Stock
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Free_Stock').asstring + '"';

    writeln(self.exportFile, tempStr);

    STRSStockReturnsfrm.prgbrExport.StepIt;
  end;
end;

end.
