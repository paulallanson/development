unit PBRPJobBagWIPStkReq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, CCSPrint, QRCtrls, DB, DBTables, qrprntr, printers;

type
  TPBRPJobBagWIPStkReqfrm = class(TForm)
    qrpDetails: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    repGrpHeader: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    qryReport: TQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    GrpByQRDBText: TQRDBText;
    qryDummy: TQuery;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    repgrpFooter: TQRBand;
    qrdbTextFooter: TQRDBText;
    qrlblGrpTotal: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    qrlblRepTotal: TQRLabel;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    qrlblSellPrice: TQRLabel;
    qrlblTotalPrice: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure repgrpFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure repgrpFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
  public
    AccMgr, Customer: integer;
    DateFrom, DateTo: TDateTime;
    PrinterSettings: TPrinterSettings;
    SortBy: integer;
    function GetDetails: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPJobBagWIPStkReqfrm: TPBRPJobBagWIPStkReqfrm;

implementation

uses PBRSJobBagWIPStkReq, CCSCommon;

var
  rGrpTotal, rRepTotal: real;

{$R *.dfm}

function TPBRPJobBagWIPStkReqFrm.GetDetails: integer;
var
  temptext: string;
begin
  case sortby of
    0:  temptext := ' ORDER BY Operator.Name, Job_Bag_Stock_Request.Job_Bag ';
    1:  temptext := ' ORDER BY Customer.Name, Job_Bag_Stock_Request.Job_Bag ';
    2:  temptext := ' ORDER BY job_bag_stock_request.Job_Bag ';
  end;

  with qryReport do
    begin
      close;
      sql.Clear;
      sql.Text := qryDummy.SQL.Text;
      sql.Add(temptext);
      parambyname('Account_Manager').asinteger := AccMgr;
      parambyname('Customer').asinteger := Customer;
      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      open;

      result := recordcount;
    end;
end;

procedure TPBRPJobBagWIPStkReqfrm.qrpDetailsBeforePrint(
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

  rGrpTotal := 0.000;
  rRepTotal := 0.000;
  case sortby of
    0:
    begin
      RepgrpFooter.enabled := True;
      RepgrpHeader.Enabled := true;
      RepgrpHeader.Expression := 'qryReport.Account_Manager';
      GrpByQRDBText.DataField:= 'Account_Manager';
      qrdbtextFooter.DataField := GrpByQRDBText.DataField;
    end;
    1:
    begin
      RepgrpFooter.enabled := True;
      RepgrpHeader.Enabled := true;
      RepgrpHeader.Expression := 'qryReport.Customer_Name';
      GrpByQRDBText.DataField := 'Customer_Name';
      qrdbtextFooter.DataField := GrpByQRDBText.DataField;
    end;
    2:
    begin
      RepgrpFooter.enabled := false;
      RepgrpHeader.Enabled := false;
      RepgrpHeader.Expression := '';
      GrpByQRDBText.DataField := '';
      qrdbtextFooter.DataField := GrpByQRDBText.DataField;
    end;
  end;
end;

procedure TPBRPJobBagWIPStkReqfrm.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rGrpTotal := rGrpTotal + qryReport.FieldByName('Total_Value').AsFloat;
end;

procedure TPBRPJobBagWIPStkReqfrm.repgrpFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rGrpTotal := 0.000;
end;

procedure TPBRPJobBagWIPStkReqfrm.repgrpFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblGrpTotal.caption := formatfloat('0.00',rGrpTotal);
end;

procedure TPBRPJobBagWIPStkReqfrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblRepTotal.caption := formatfloat('0.00',rRepTotal);

end;

procedure TPBRPJobBagWIPStkReqfrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempstr: string;
begin
  qrlblSellPrice.caption  := formatfloat('#,##0.000',qryReport.FieldByName('Part_Sales_Price').AsFloat);
  qrlblTotalPrice.caption  := formatfloat('#,##0.00',qryReport.FieldByName('Total_Value').AsFloat);
  rRepTotal := rRepTotal + qryReport.FieldByName('Total_Value').AsFloat;
  if self.exporting then
  begin
    //product
    tempStr := '"' + qryReport.fieldByName('Job_Bag').asString + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldByName('Customer_Name').asString + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qryReport.fieldByName('Account_Manager').asString + '"';

    //Job Description
    tempStr := tempStr + ',"' + qryReport.fieldByName('Job_Bag_Descr').asString + '"';

    //Start Date
    tempStr := tempStr + ',"' + pbdatestr(qryReport.fieldByName('Date_Start').asdatetime) + '"';

    //End Date
    tempStr := tempStr + ',"' + pbdatestr(qryReport.fieldByName('goods_Required').asdatetime) + '"';

    //Product
    tempStr := tempStr + ',"' + qryReport.fieldByName('Part').asString + '"';

    //Product  Descr
    tempStr := tempStr + ',"' + qryReport.fieldByName('Part_Description').asString + '"';

    //Product  Descr
    tempStr := tempStr + ',"' + qryReport.fieldByName('Quantity_Outstanding').asString + '"';

    //Sell Pack Qty
    tempStr := tempStr + ',"' + qryReport.fieldByName('Sell_Pack_Quantity').asString + '"';

    //Sell Price
    tempStr := tempStr + ',"' + qrlblSellPrice.caption + '"';

    //Total Price
    tempStr := tempStr + ',"' + qrlblTotalPrice.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSJobBagWIPStkReqfrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPJobBagWIPStkReqfrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Job Bag"'
    + ',"Customer"'
    + ',"Acc Manager"'
    + ',"Description"'
    + ',"Start Date"'
    + ',"End Date"'
    + ',"Product Code"'
    + ',"Product Description"'
    + ',"Quantity"'
    + ',"Pack Qty"'
    + ',"Sell Price"'
    + ',"Total Price"';

  writeLn(self.exportFile, tempStr);
  qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

end.
