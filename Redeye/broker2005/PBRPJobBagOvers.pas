unit PBRPJobBagOvers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, DBTables, qrprntr, Printers, CCSCommon;

type
  TPBRPJobBagOversFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlblDateRange: TQRLabel;
    qryReport: TQuery;
    qrCustGroup: TQRGroup;
    qrsubParts: TQRSubDetail;
    qrlblGroupHeader: TQRLabel;
    qrdbtext: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    qryDummy: TQuery;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qryJobBags: TQuery;
    dtsReport: TDataSource;
    qrPartGroup: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsubPartsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrPartGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
  public
    AccManager, Customer: integer;
    DateFrom, DateTo: TDateTime;
    SortbyDate, SortbyJob, SortbyAccMgr, SortbyCustomer: boolean;
    function GetDetails: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPJobBagOversFrm: TPBRPJobBagOversFrm;

implementation

uses PBRSJobBagOvers;

{$R *.dfm}

function TPBRPJobBagOversFrm.GetDetails: integer;
var
  temp: string;
begin
  qryReport.sql.clear;
  qryReport.sql.Text := qryDummy.sql.Text;

  temp := temp + 'ORDER BY Customer.Name, Part.Part';

  qryReport.SQL.Add(temp);
  with qryReport do
    begin
      close;
      parambyname('Customer').AsInteger := Customer;
      parambyname('Date_from').AsDateTime := datefrom;
      parambyname('Date_to').asdatetime := dateto;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPJobBagOversFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
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

  qrCustGroup.Enabled := true;
  qrCustGroup.Expression := 'Customer_Name';
  qrlblGroupHeader.caption := 'Customer: ';
  qrdbtext.DataField := 'Customer_Name';

end;

procedure TPBRPJobBagOversFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempstr := '"Customer"'
              + ',"Part"'
              + ',"Description"'
              + ',"Quantity"'
              + ',"Warehouse"'
              + ',"Bin"'
              + ',"Date Received"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPJobBagOversFrm.qrsubPartsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //customer
    tempStr := '"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //part
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part').asstring + '"';

    //Part decsription
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part_Description').asstring + '"';

    //Quantity
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Store_Quantity').asstring + '"';

    //Part Store
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part_Store_Name').asstring + '"';

    //Bin
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part_Bin').asstring + '"';

    //date received
    tempStr := tempStr + ',"' + PBDateStr(qryReport.fieldbyname('Date_Received').asdatetime) + '"';

    writeln(self.exportFile, tempStr);

    PBRSJobBagOversfrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPJobBagOversFrm.qrPartGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with qryJobBags do
    begin
      close;
      parambyname('Part').AsString := qryReport.fieldbyname('Part').asstring;
      parambyname('Date_To').AsDateTime := dateFrom;
      parambyname('Date_From').asdatetime := dateTo;
      open;
    end;
end;

end.
