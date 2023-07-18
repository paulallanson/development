unit STRPStockUsage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, QuickRpt, CCSPrint, Qrctrls, printers, ccscommon,
  qrprntr;

type
  TSTRPStockUsagefrm = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblselection: TQRLabel;
    qrbCustHeader: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrpCustFooter: TQRBand;
    QRSysData1: TQRSysData;
    qrlblDateSelection: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlblClosing: TQRLabel;
    qryPartStore: TQuery;
    qryReport: TQuery;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRSysData2: TQRSysData;
    function Getdetails(Sender: TObject): integer;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    ReportArray: array[1..100, 1..3] of string;
    exporting: boolean;
    exportFile: textFile;
    procedure BuildReportArray(ProductList: string);
  public
    Printersettings: TPrintersettings;
    Customer: integer;
    Branch: integer;
    NotInUse: boolean;
    Product, ProductFrom, ProductTo: string;
    PartFrom: string;
    PartTo: string;
    DateFrom: TDateTime;
    DateTo: TDateTime;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPStockUsagefrm: TSTRPStockUsagefrm;

implementation

uses STRSStockUsage;

var
  rCustTotal: real;

{$R *.DFM}

function TSTRPStockUsagefrm.Getdetails(Sender: TObject): integer;
var
  suffixFrom, suffixTo, maintext: string;
  iRange: integer;
  i, iStart, iSublength: integer;
begin
  if trim(Product) <> '' then
    BuildReportArray(Product);

  with qryReport do
    begin
      sql.Text := sql.Text + ' AND (';
      for i := 1 to 100 do
        begin
          if reportarray[i,1] = '' then continue;
          if i = 1 then
            sql.Text := sql.Text + '(Part.Part like ''' + reportArray[i,1] + '%' + reportArray[i,2] + ''')'
          else
            sql.Text := sql.Text + reportArray[i,3] + '(Part.Part like ''' + reportArray[i,1] + '%' + reportArray[i,2] + ''')'
        end;
      if reportarray[1,1] = '' then
        sql.Text := sql.Text + '(Part.Part like ''%'')';
      sql.Text := sql.Text + ')';

      sql.Text := sql.Text + ' Order by Customer.Name, Part.Part ';

      ProductFrom := sql.Text;
      close;
      parambyname('Customer').asinteger := Customer;

      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      paramByname('Branch').asinteger := Branch;

      if NotinUse then
        parambyname('Not_in_Use').asstring := 'N'
      else
        parambyname('Not_in_Use').asstring := 'Y';
      open;
      result := recordcount;
    end;
end;

procedure TSTRPStockUsagefrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  qty: integer;
  tempStr: string;
begin
  qty := qryReport.fieldbyname('Opening_Balance').asinteger
          + qryReport.fieldbyname('Receipts').asinteger
          - qryReport.fieldbyname('Despatches').asinteger
          - qryReport.fieldbyname('Wastage').asinteger;


  qrlblClosing.caption := inttostr(qty);

  if exporting then
  begin
    //product
    tempStr := '"' + qryReport.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + qryReport.fieldByName('part_description').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldByName('Name').asString + '"';

    //Opening Balance
    tempStr := tempStr + ',"' + qryReport.fieldByName('Opening_Balance').asString + '"';

    //Receipts
    tempStr := tempStr + ',"' + qryReport.fieldByName('Receipts').asString + '"';

    //Despatches
    tempStr := tempStr + ',"' + qryReport.fieldByName('Despatches').asString + '"';

    //Wastage
    tempStr := tempStr + ',"' + qryReport.fieldByName('Wastage').asString + '"';

    //Closing Balance
    tempStr := tempStr + ',"' + qrlblClosing.caption + '"';

    //Minimum stock
    tempStr := tempStr + ',"' + qryReport.fieldByName('Minimum_Stock').asString + '"';

    writeln(self.exportFile, tempStr);
    STRSStockUsagefrm.prgbrExport.StepIt;
  end;
end;

procedure TSTRPStockUsagefrm.qrpDetailsBeforePrint(
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

  rCustTotal := 0.00;
  qrbCustHeader.enabled := (qrlblSelection.caption = '');
  if qrlblSelection.caption = '' then
    qrlblDateSelection.top := qrlblSelection.top;
end;

procedure TSTRPStockUsagefrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Description"'
    + ',"Customer"'
    + ',"Opening"'
    + ',"Receipts"'
    + ',"Usage"'
    + ',"Wastage"'
    + ',"Closing"'
    + ',"Minimum"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TSTRPStockUsagefrm.FormCreate(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 3 do
      ReportArray[icount, icount1] := '';
end;

procedure TSTRPStockUsagefrm.BuildReportArray(ProductList: string);
var
  sProduct, suffix, maintext: string;
  istart, ilength, irange, isuffix, isublength, iposition: integer;
  irow: integer;
begin
  istart := 1;
  ilength := length(productList);
  irange := 0;
  irow := 1;

  {Check if individual selections have been made}
  if copy(ProductList,ilength,1) <> ',' then
  	ProductList := ProductList + ',';

  ilength := length(ProductList);

  while pos(',',copy(ProductList,istart,(ilength-irange))) > 0  do
    begin
      iposition := irange;
      irange := pos(',',copy(ProductList,istart,(ilength-iposition)));
      sProduct := copy(ProductList,istart,irange-1);

      {Do the first part of the range}
      isuffix := pos('>',sProduct);
      iSublength := length(sProduct) - (isuffix);

      suffix := '';
      maintext := sProduct;

      if isuffix > 0 then
        begin
          suffix := copy(sProduct,isuffix+1,iSublength);
          maintext := copy(sProduct,1,(isuffix-1));
        end;
      reportarray[irow,1] := maintext;
      reportarray[irow,2] := suffix;
      reportarray[irow,3] := ' or ';
      istart := istart + irange;
      irow := irow + 1;
    end;
end;

end.
