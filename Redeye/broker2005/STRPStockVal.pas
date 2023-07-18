unit STRPStockVal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, QuickRpt, CCSPrint, Qrctrls, printers, ccscommon,
  qrprntr, gtQrCtrls;

type
  TSTRPStockValfrm = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblselection: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrpGroupFooter: TQRBand;
    QRSysData1: TQRSysData;
    qrlblDateSelection: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qryPartStore: TQuery;
    qryReport: TQuery;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    qrbGroupHeader: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand2: TQRBand;
    QRDBText10: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    qrlblGroupOpening: TQRLabel;
    qrlblGroupReceipts: TQRLabel;
    qrlblGroupUsage: TQRLabel;
    qrlblGroupWastage: TQRLabel;
    qrlblGroupClosing: TQRLabel;
    qrlblTotalOpening: TQRLabel;
    qrlblTotalReceipts: TQRLabel;
    qrlblTotalUsage: TQRLabel;
    qrlblTotalWastage: TQRLabel;
    qrlblTotalClosing: TQRLabel;
    OldqryReport: TQuery;
    QRDBText4: TQRDBText;
    qrlblOpeningValue: TgtQRLabel;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    function Getdetails(Sender: TObject): integer;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrpGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    ReportArray: array[1..100, 1..3] of string;
    exporting: boolean;
    exportFile: textFile;
    procedure BuildReportArray(ProductList: string);
  public
    Printersettings: TPrintersettings;
    Customer: integer;
    Branch: integer;
    Store: integer;
    NotInUse: boolean;
    Product, ProductFrom, ProductTo: string;
    PartFrom: string;
    PartTo: string;
    DateFrom: TDateTime;
    DateTo: TDateTime;
    rGroupClosing, rGroupReceipts, rGroupUsage, rGroupWastage: real;
    rTotalClosing, rTotalReceipts, rTotalUsage, rTotalWastage: real;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPStockValfrm: TSTRPStockValfrm;

implementation

uses STRSStockVal;

var
  rGroupTotal: real;

{$R *.DFM}

function TSTRPStockValfrm.Getdetails(Sender: TObject): integer;
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

      sql.Text := sql.text + 'GROUP BY part_movement.Part, part.Part_Description, Part.Not_In_Use, Customer.Name, part_movement.Part_movement_Store, part_store.part_store_name';

      sql.Text := sql.Text + ' Order by Part_Store.Part_Store_Name, Part_Movement.Part ';

      ProductFrom := sql.Text;
      close;
      parambyname('Customer').asinteger := Customer;

      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      paramByname('Branch').asinteger := Branch;
      parambyname('Part_Movement_Store').asinteger := Store;

      if NotinUse then
        parambyname('Not_in_Use').asstring := 'N'
      else
        parambyname('Not_in_Use').asstring := 'Y';
      open;
      result := recordcount;
    end;
end;

procedure TSTRPStockValfrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rValue: real;
  tempStr: string;
begin
  rValue := qryReport.fieldbyname('Closing_Value').asfloat
          - qryReport.fieldbyname('Receipts').asfloat
          + qryReport.fieldbyname('Despatches').asfloat
          + qryReport.fieldbyname('Wastage').asfloat;

  rGroupClosing := rGroupClosing + qryReport.fieldbyname('Closing_Value').asfloat;
  rGroupReceipts := rGroupReceipts + qryReport.fieldbyname('Receipts').asfloat;
  rGroupUsage := rGroupUsage + qryReport.fieldbyname('Despatches').asfloat;
  rGroupWastage := rGroupWastage + qryReport.fieldbyname('Wastage').asfloat;

  qrlblOpeningValue.caption := formatfloat('?0.00',rValue);
//  qrlblOpeningStock.caption := formatfloat('?0.00',rValue);

  if exporting then
  begin
    //product
    tempStr := '"' + qryReport.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + qryReport.fieldByName('part_description').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldByName('Customer_Name').asString + '"';

    //Store
    tempStr := tempStr + ',"' + qryReport.fieldByName('Part_Store_Name').asString + '"';

    //Opening Value
    tempStr := tempStr + ',"' + qrlblOpeningValue.caption + '"';

    //Opening Balance
    tempStr := tempStr + ',"' + qryReport.fieldByName('Opening_Balance').asString + '"';

    //Receipts
    tempStr := tempStr + ',"' + qryReport.fieldByName('Receipts').asString + '"';

    //Despatches
    tempStr := tempStr + ',"' + qryReport.fieldByName('Despatches').asString + '"';

    //Wastage
    tempStr := tempStr + ',"' + qryReport.fieldByName('Wastage').asString + '"';

    //Closing Value
    tempStr := tempStr + ',"' + qryReport.fieldByName('Closing_Value').asString + '"';

    //Closing Balance
    tempStr := tempStr + ',"' + qryReport.fieldByName('Closing_Balance').asString + '"';

    writeln(self.exportFile, tempStr);
    STRSStockValfrm.prgbrExport.StepIt;
  end;
end;

procedure TSTRPStockValfrm.qrpDetailsBeforePrint(
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

  rGroupTotal := 0.00;
  qrbGroupHeader.enabled := (Store = 0);
  if qrlblSelection.caption = '' then
    qrlblDateSelection.top := qrlblSelection.top;

  rGroupClosing := 0;
  rGroupReceipts := 0;
  rGroupUsage := 0;
  rGroupWastage := 0;
end;

procedure TSTRPStockValfrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Description"'
    + ',"Customer"'
    + ',"Store"'
    + ',"Opening Value"'
    + ',"Opening Stock"'
    + ',"Receipts"'
    + ',"Usage"'
    + ',"Wastage"'
    + ',"Closing Value"'
    + ',"Closing Stock"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TSTRPStockValfrm.FormCreate(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 3 do
      ReportArray[icount, icount1] := '';
end;

procedure TSTRPStockValfrm.BuildReportArray(ProductList: string);
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

procedure TSTRPStockValfrm.qrpGroupFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  rTotalClosing := rTotalClosing + rGroupClosing;
  rTotalReceipts := rTotalReceipts + rGroupReceipts;
  rTotalUsage := rTotalUsage + rGroupUsage;
  rTotalWastage := rTotalWastage + rGroupWastage;

  qrlblGroupClosing.caption := formatfloat('?0.00',rGroupClosing);
  qrlblGroupReceipts.caption := formatfloat('?0.00',rGroupReceipts);
  qrlblGroupUsage.caption := formatfloat('?0.00',rGroupUsage);
  qrlblGroupWastage.caption := formatfloat('?0.00',rGroupWastage);
  qrlblGroupOpening.caption := formatfloat('?0.00',(rGroupClosing-rGroupReceipts+rGroupUsage+rGroupWastage));
end;

procedure TSTRPStockValfrm.qrpGroupFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rGroupClosing := 0;
  rGroupReceipts := 0;
  rGroupUsage := 0;
  rGroupWastage := 0;
end;

procedure TSTRPStockValfrm.QRBand2Beforeprint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotalClosing.caption := formatfloat('?0.00',rTotalClosing);
  qrlblTotalReceipts.caption := formatfloat('?0.00',rTotalReceipts);
  qrlblTotalUsage.caption := formatfloat('?0.00',rTotalUsage);
  qrlblTotalWastage.caption := formatfloat('?0.00',rTotalWastage);
  qrlblTotalOpening.caption := formatfloat('?0.00',(rTotalClosing-rTotalReceipts+rTotalUsage+rTotalWastage));
end;

end.
