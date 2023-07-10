unit STRPStockUsageDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, QuickRpt, CCSPrint, Qrctrls, printers, ccscommon,
  qrprntr;

type
  TSTRPStockUsageDetfrm = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblselection: TQRLabel;
    qrbCustHeader: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    qrpCustFooter: TQRBand;
    QRSysData1: TQRSysData;
    qrlblDateSelection: TQRLabel;
    qryPartStore: TQuery;
    qryStoreBal: TQuery;
    qrbPartHeader: TQRGroup;
    qrpPartFooter: TQRBand;
    dtsReport: TDataSource;
    qrlblTotClosing: TQRLabel;
    qryReport: TQuery;
    qryPartMoves: TQuery;
    QRDBText10: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRSubDetail2: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    qrlblReceipts: TQRLabel;
    qrlblUsage: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    qrlblOpening: TQRLabel;
    qrlblBalances: TQRLabel;
    qrlblClosing: TQRLabel;
    qrlblTotReceipts: TQRLabel;
    qrlblTotUsage: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    qrlblWastage: TQRLabel;
    qrlblTotWastage: TQRLabel;
    QRDBText6: TQRDBText;
    function Getdetails(Sender: TObject): integer;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrpPartFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpPartFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    iOpening, iUsage, iReceipts, iWastage: integer;
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
  STRPStockUsageDetfrm: TSTRPStockUsageDetfrm;

implementation

uses STRSStockUsage;

var
  rCustTotal: real;

{$R *.DFM}

function TSTRPStockUsageDetfrm.Getdetails(Sender: TObject): integer;
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
//      parambyname('Date_To').asdatetime := DateTo;
      paramByname('Branch').asinteger := Branch;

      if NotinUse then
        parambyname('Not_in_Use').asstring := 'N'
      else
        parambyname('Not_in_Use').asstring := 'Y';
      open;
      result := recordcount;
    end;
  qryPartMoves.close;
  qryPartMoves.ParamByName('Date_From').AsDateTime := DateFrom;
  qryPartMoves.ParamByName('Date_To').AsDateTime := DateTo;
  qryPartMoves.open;
end;

procedure TSTRPStockUsageDetfrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblOpening.caption := '0';
  qrlblClosing.caption := '0';
  qrlblReceipts.caption := '0';
  qrlblWastage.caption := '0';
  qrlblUsage.caption := '0';

  iOpening := qryReport.fieldbyname('Opening_Balance').asinteger;
  iUsage := 0;
  iReceipts := 0;
  iWastage := 0;

end;

procedure TSTRPStockUsageDetfrm.qrpDetailsBeforePrint(
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

  rCustTotal := 0.00;
  qrbCustHeader.enabled := (qrlblSelection.caption = '');
  if qrlblSelection.caption = '' then
    qrlblDateSelection.top := qrlblSelection.top;
end;

procedure TSTRPStockUsageDetfrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Description"'
    + ',"Customer"'
    + ',"Date"'
    + ',"Movement Type"'
    + ',"Movement Ref"'
    + ',"Opening"'
    + ',"Receipts"'
    + ',"Usage"'
    + ',"Wastage"'
    + ',"Closing"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TSTRPStockUsageDetfrm.FormCreate(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 3 do
      ReportArray[icount, icount1] := '';
end;

procedure TSTRPStockUsageDetfrm.BuildReportArray(ProductList: string);
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

procedure TSTRPStockUsageDetfrm.qrpPartFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  qty: integer;
begin
  qty := qryReport.fieldbyname('Opening_Balance').asinteger
          + iReceipts
          - iUsage
          - iWastage;

  qrlblTotReceipts.caption := inttostr(iReceipts);
  qrlblTotUsage.caption := inttostr(iUsage);
  qrlblTotWastage.caption := inttostr(iWastage);
  qrlblTotClosing.caption := inttostr(qty);

  qrlblBalances.caption := 'Balances for ' + qryReport.fieldbyname('Part').asstring;

end;

procedure TSTRPStockUsageDetfrm.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempStr: string;
begin
  {This is Wastage total}
  if (qryPartMoves.fieldbyname('Store_Quantity').asinteger < 0) and (qryPartMoves.fieldbyname('Part_Movement_Type').asstring = 'W') then
    begin
      qrlblOpening.caption := inttostr(iOpening);
      qrlblClosing.caption := qryPartMoves.fieldbyname('Part_Store_Total_Quantity').asstring;
      qrlblWastage.caption := inttostr(qryPartMoves.fieldbyname('Store_quantity').asinteger * -1);
      qrlblUsage.caption := '0';
      qrlblReceipts.caption := '0';
      iWastage := iWastage + (qryPartMoves.fieldbyname('Store_Quantity').asinteger * -1);
    end
  else
  if qryPartMoves.fieldbyname('Store_Quantity').asinteger < 0 then
    begin
      qrlblOpening.caption := inttostr(iOpening);
      qrlblClosing.caption := qryPartMoves.fieldbyname('Part_Store_Total_Quantity').asstring;
      qrlblUsage.caption := inttostr(qryPartMoves.fieldbyname('Store_quantity').asinteger * -1);
      qrlblWastage.caption := '0';
      qrlblReceipts.caption := '0';
      iUsage := iUsage + (qryPartMoves.fieldbyname('Store_Quantity').asinteger * -1);
    end
  else
  if qryPartMoves.fieldbyname('Store_Quantity').asinteger > 0 then
    begin
      qrlblOpening.caption := inttostr(iOpening);
      qrlblClosing.caption := qryPartMoves.fieldbyname('Part_Store_Total_quantity').asstring;
      qrlblWastage.caption := '0';
      qrlblUsage.caption := '0';
      qrlblReceipts.caption := qryPartMoves.fieldbyname('Store_Quantity').asstring;
      iReceipts := iReceipts + qryPartMoves.fieldbyname('Store_Quantity').asinteger;
    end
  else
    begin
      qrlblOpening.caption := inttostr(iOpening);
      qrlblClosing.caption := inttostr(iOpening);
      qrlblWastage.caption := '0';
      qrlblUsage.caption := '0';
      qrlblReceipts.caption := '0';
    end;

  iOpening := iOpening + qryPartMoves.fieldbyname('Store_quantity').asinteger;

  if exporting then
  begin
    //product
    tempStr := '"' + qryReport.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + qryReport.fieldByName('part_description').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldByName('Name').asString + '"';

    //move date
    tempStr := tempStr + ',"' + pbdatestr(qryPartMoves.fieldByName('Date_Received').asdatetime) + '"';

    //move type
    tempStr := tempStr + ',"' + qryPartMoves.fieldByName('Part_Move_Type_descr').asString + '"';

    //move description
    tempStr := tempStr + ',"' + qryPartMoves.fieldByName('Part_Movement_Reference').asString + '"';

    //Opening Balance
    tempStr := tempStr + ',"' + qrlblOpening.caption + '"';

    //Receipts
    tempStr := tempStr + ',"' + qrlblReceipts.caption + '"';

    //Despatches
    tempStr := tempStr + ',"' + qrlblUsage.caption + '"';

    //Wastage
    tempStr := tempStr + ',"' + qrlblWastage.caption + '"';

    //Closing Balance
    tempStr := tempStr + ',"' + qrlblClosing.caption + '"';

    writeln(self.exportFile, tempStr);
  end;

end;

procedure TSTRPStockUsageDetfrm.qrpPartFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  STRSStockUsagefrm.prgbrExport.StepIt;
end;

end.
