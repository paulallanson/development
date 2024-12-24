unit STRPSalesHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, QuickRpt, QRCtrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPSalesHistoryFrm = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    gtQRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    qrlblDateSelection: TQRLabel;
    qrlblDelivery: TQRLabel;
    QRSysData1: TQRSysData;
    gtQRLabel4: TQRLabel;
    qryReport: TFDQuery;
    qrlblSelection: TQRLabel;
    qrbCustHeader: TQRGroup;
    QRDBText1: TQRDBText;
    qrbPartHeader: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    dtsReport: TDataSource;
    qryUsage: TFDQuery;
    QRDBText4: TQRDBText;
    qryBranches: TFDQuery;
    qrpPartFooter: TQRBand;
    qrlblTotalUsage: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    qrshpBottom: TQRShape;
    qrshpTop: TQRShape;
    qrdbPart: TQRDBText;
    qrdbPartDescription: TQRDBText;
    qrlblTotalUsageLabel: TQRLabel;
    qrlblDeliveryLocation: TQRLabel;
    gtQRLabel5: TQRLabel;
    qrlblInactive: TQRLabel;
    qrlblTotalInactive: TQRLabel;
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
  STRPSalesHistoryFrm: TSTRPSalesHistoryFrm;

implementation

uses STRSSalesHistory;

{$R *.dfm}

const
  SQLOrderBy = ' ORDER BY Customer_Branch.Name';

  SQLOrderByAsc = ' ORDER BY Sum(Sales_Order_line.Quantity_Delivered) ASC, Customer_Branch.Name';

  SQLOrderByDesc = ' ORDER BY Sum(Sales_Order_line.Quantity_Delivered) DESC, Customer_Branch.Name';

function TSTRPSalesHistoryFrm.GetDetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Product_type').asinteger := ProdType;
      parambyname('Part_From').asstring := PartFrom;
      parambyname('Part_To').asstring := PartTo;
      if IncludeInactive then
        parambyname('Not_in_Use').asstring := 'Y'
      else
        parambyname('Not_in_Use').asstring := 'N';
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
      ParamByName('Date_From').AsDateTime := DateFrom;
      ParamByName('Date_To').AsDateTime := DateTo;
      //ParamByName('Record_List').asinteger := RecordList;
      open;
    end;
end;

procedure TSTRPSalesHistoryFrm.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempStr: string;
begin
  iTotalUsage := iTotalUsage + qryUsage.fieldbyname('Usage').asinteger;

  if qryReport.fieldbyname('Customer_Name').asstring = '' then
    qrlblDeliveryLocation.Caption := qryUsage.fieldbyname('Customer_Name').asstring + '/'+ qryUsage.fieldbyname('Delivery_Name').asstring
  else
    qrlblDeliveryLocation.Caption := qryUsage.fieldbyname('Delivery_Name').asstring;

  if qryReport.fieldbyname('Not_in_Use').asstring = 'Y' then
    qrlblInactive.caption := 'Y'
  else
    qrlblInactive.caption := '';

  qrDbPart.Enabled  := (iUsageLine = 1);
  qrDbPartDescription.enabled := (iUsageLine = 1);

  iUsageLine := iUsageLine + 1;
  PrintBand := (qryUsage.fieldbyname('Usage').asinteger > 0);

  if exporting and PrintBand then
  begin
    //product
    tempStr := '"' + qryReport.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + qryReport.fieldByName('part_description').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldByName('Customer_Name').asString + '"';

    //Product Type
    tempStr := tempStr + ',"' + qryReport.fieldByName('Product_type_Description').asString + '"';

    //Delivery Location
    tempStr := tempStr + ',"' + qrlblDeliveryLocation.Caption + '"';

    //Usage
    tempStr := tempStr + ',"' + qryUsage.fieldbyname('Usage').asstring + '"';

    //Inactive
    tempStr := tempStr + ',"' + qrlblInactive.caption + '"';

    writeln(self.exportFile, tempStr);
  end;

end;

procedure TSTRPSalesHistoryFrm.qrbPartHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iTotalUsage := 0;
  iUsageLine := 1;
  if exporting then
    STRSSalesHistoryFrm.prgbrExport.StepIt;
end;

procedure TSTRPSalesHistoryFrm.qrpPartFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempStr: string;
begin
  qrlblTotalUsage.caption := inttostr(iTotalUsage);
  qrlblTotalUsageLabel.Enabled := (iTotalUsage > 0);
  qrshpTop.Enabled := (iTotalUsage > 0);
  qrshpBottom.enabled := (iTotalUsage > 0);

  if qryReport.fieldbyname('Not_in_Use').asstring = 'Y' then
    qrlblTotalInactive.caption := 'Y'
  else
    qrlblTotalInactive.caption := '';

  if exporting then
  begin
    //product
    tempStr := '"' + qryReport.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + qryReport.fieldByName('part_description').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldByName('Customer_Name').asString + '"';

    //Product Type
    tempStr := tempStr + ',"' + qryReport.fieldByName('Product_type_Description').asString + '"';

    //Delivery Location
    if iTotalUsage > 0 then
      tempStr := tempStr + ',"' +  qrlblTotalUsageLabel.caption + '"'
    else
      tempStr := tempStr + ',"' +  '' + '"';

    //Usage
    tempStr := tempStr + ',"' + qrlblTotalUsage.caption + '"';

    //Inactive
    tempStr := tempStr + ',"' + qrlblTotalInactive.caption + '"';

    writeln(self.exportFile, tempStr);
  end;
end;

procedure TSTRPSalesHistoryFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Description"'
    + ',"Customer"'
    + ',"Product Type"'
    + ',"Branch"'
    + ',"Usage"'
    + ',"Inactive"';

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

end.
