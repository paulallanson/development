unit STRPSalesHistoryLoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, QuickRpt, QRCtrls, ExtCtrls;

type
  TSTRPSalesHistoryLocFrm = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    gtQRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    qrlblDateSelection: TQRLabel;
    qrlblDelivery: TQRLabel;
    QRSysData1: TQRSysData;
    gtQRLabel4: TQRLabel;
    qryReport: TQuery;
    qrlblSelection: TQRLabel;
    qrbCustHeader: TQRGroup;
    QRDBText1: TQRDBText;
    qrbPartHeader: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    dtsReport: TDataSource;
    qryUsage: TQuery;
    QRDBText4: TQRDBText;
    qrpPartFooter: TQRBand;
    qrlblTotalUsage: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    qrshpBottom: TQRShape;
    qrshpTop: TQRShape;
    qrdbPart: TQRDBText;
    qrdbPartDescription: TQRDBText;
    qrlblTotalUsageLabel: TQRLabel;
    qrdbLocation: TQRDBText;
    QRDBText3: TQRDBText;
    gtQRLabel5: TQRLabel;
    qrlblInactive: TQRLabel;
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbPartHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpPartFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    iTotalUsage: integer;
    iUsageLine: integer;
    exporting: boolean;
    exportFile: textFile;
  public
    Customer, ProdType: integer;
    DateFrom, DateTo: TDateTime;
    IncludeInactive: boolean;
    PartFrom, PartTo: string;
    ShowRecords, RecordList: integer;
    function GetDetails: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPSalesHistoryLocFrm: TSTRPSalesHistoryLocFrm;

implementation

uses STRSSalesHistory;

{$R *.dfm}

const
  SQLOrderBy = ' ORDER BY Part.Part';

  SQLOrderByAsc = ' ORDER BY Sum(Sales_Order_line.Quantity_Delivered) ASC, Part.Part';

  SQLOrderByDesc = ' ORDER BY Sum(Sales_Order_line.Quantity_Delivered) DESC, Part.Part';

function TSTRPSalesHistoryLocFrm.GetDetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;
      result := recordcount;
    end;

  with qryUsage do
    begin
      Case ShowRecords of
          0: SQL.text := SQL.text + SQLOrderBy;
          1: SQL.text := SQL.text + SQLOrderByDESC;
          2: SQL.text := SQL.text + SQLOrderByASC;
      end;

      close;
      parambyname('Product_type').asinteger := ProdType;
      parambyname('Part_From').asstring := PartFrom;
      parambyname('Part_To').asstring := PartTo;
      if IncludeInactive then
        parambyname('Not_in_Use').asstring := 'Y'
      else
        parambyname('Not_in_Use').asstring := 'N';

      ParamByName('Date_From').AsDateTime := DateFrom;
      ParamByName('Date_To').AsDateTime := DateTo;
      ParamByName('Record_List').asinteger := RecordList;
      open;
    end;
end;

procedure TSTRPSalesHistoryLocFrm.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempStr: string;
begin
  iTotalUsage := iTotalUsage + qryUsage.fieldbyname('Usage').asinteger;

  qrDbLocation.Enabled  := (iUsageLine = 1);

  if qryUsage.fieldbyname('Not_in_Use').asstring = 'Y' then
    qrlblInactive.caption := 'Y'
  else
    qrlblInactive.caption := '';

  iUsageLine := iUsageLine + 1;
  PrintBand := (qryUsage.fieldbyname('Usage').asinteger > 0);

  if exporting and PrintBand then
  begin
    //Customer
    tempStr := '"' + qryReport.fieldByName('Customer_Name').asString + '"';

    //Delivery Location
    tempStr := tempStr + ',"' + qryReport.fieldByName('Delivery_Name').asString + '"';

    //product
    tempStr := tempStr + ',"' + qryUsage.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + qryUsage.fieldByName('part_description').asString + '"';

    //Product Type
    tempStr := tempStr + ',"' + qryUsage.fieldByName('Product_type_Description').asString + '"';

    //Usage
    tempStr := tempStr + ',"' + qryUsage.fieldbyname('Usage').asstring + '"';

    //Inactive
    tempStr := tempStr + ',"' + qrlblInactive.caption + '"';

    writeln(self.exportFile, tempStr);
  end;

end;

procedure TSTRPSalesHistoryLocFrm.qrbPartHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iTotalUsage := 0;
  iUsageLine := 1;
  if exporting then
    STRSSalesHistoryFrm.prgbrExport.StepIt;
end;

procedure TSTRPSalesHistoryLocFrm.qrpPartFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempStr: string;
begin
  qrlblTotalUsage.caption := inttostr(iTotalUsage);
  qrlblTotalUsageLabel.Enabled := (iTotalUsage > 0);
  qrshpTop.Enabled := (iTotalUsage > 0);
  qrshpBottom.enabled := (iTotalUsage > 0);

  PrintBand := (iTotalUsage = 0);
  
  if exporting and PrintBand then
  begin
    //Customer
    tempStr := '"' + qryReport.fieldByName('Customer_Name').asString + '"';

    //Delivery Location
    tempStr := tempStr + ',"' + qryReport.fieldByName('Delivery_Name').asString + '"';

    //Product
    tempStr := tempStr + ',"' + '' + '"';

    //Description
    tempStr := tempStr + ',"' + '' + '"';

    //Product Type
    tempStr := tempStr + ',"' + '' + '"';

    //Usage
    tempStr := tempStr + ',"' + qrlblTotalUsage.caption + '"';

    //Inactive
    tempStr := tempStr + ',"' + '' + '"';

    writeln(self.exportFile, tempStr);
  end;
end;

procedure TSTRPSalesHistoryLocFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr :=
    '"Customer"'
    + ',"Delivery Location"'
    + ',"Product"'
    + ',"Description"'
    + ',"Product Type"'
    + ',"Usage"'
    + ',"Inactive"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

end.
