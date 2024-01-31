(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Broker work in progress report.

VSS Info:
$Header: /Broker Stock/STRPWorkIP.pas 1     17/06/:3 13:51 Janiner $
$History: STRPWorkIP.pas $
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 17/06/:3   Time: 13:51
 * Created in $/Broker Stock
 * Work in progress report
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 28/02/:3   Time: 11:22
 * Updated in $/PBL D5
 * Printersettings.OutputBin is set based on user selection
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 15/01/:3   Time: 14:52
 * Updated in $/PBL D5
 * Changed to allow valuation by Customer, rep etc
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 13/01/:3   Time: 16:12
 * Updated in $/PBL D5
 * Added 2 new columns, Delivery Qty and Sales Value. Added page breaks by
 * Customer, Supplier and rep
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 10/01/:2   Time: 13:21
 * Updated in $/PBL D5
 * Add flag to show on hold if appropriate
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 19/06/:1   Time: 10:13
 * Updated in $/PBL D5
 * Add new procedure for formatting of purchase order no , line no.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 2/05/:1    Time: 13:01
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 1/12/:0    Time: 16:10
 * Updated in $/PBL D5
 * Changed to base the WIP Enquiry and Report on Delivery Details rather
 * than individual order lines
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 5/07/:0    Time: 17:02
 * Branched in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 14/03/:0   Time: 14:55
 * Created in $/PBL D5/Quick Reports/BroadSword

*******************************************************************************)
unit STRPWorkIP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, QuickRpt, Qrctrls, CCSPrint, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPWorkIPfrm = class(TForm)
    QuickReport: TQuickRep;
    qryReport: TFDQuery;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    RepQRGroup: TQRGroup;
    GrpByQRDBText: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    qrlblSalesValue: TQRLabel;
    lblValue: TQRLabel;
    RepQRFooter: TQRBand;
    Totals: TQRLabel;
    lblGrpTotal: TQRLabel;
    qrSummary: TQRBand;
    QRLabel15: TQRLabel;
    lblReportTotal: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    qryReportSales_Order: TIntegerField;
    qryReportOffice_Contact: TIntegerField;
    qryReportOperator: TIntegerField;
    qryReportDate_Required: TDateTimeField;
    qryReportDate_Ordered: TDateTimeField;
    qryReportCust_Order_No: TStringField;
    qryReportCustomer: TIntegerField;
    qryReportBranch_no: TIntegerField;
    qryReportContact_no: TIntegerField;
    qryReportCost_Centre: TStringField;
    qryReportCustomer0: TIntegerField;
    qryReportOrder_Type: TStringField;
    qryReportSales_order_Head_Status: TIntegerField;
    qryReportNarrative: TIntegerField;
    qryReportPart_Store: TIntegerField;
    qryReportDelivery_Customer: TIntegerField;
    qryReportDelivery_Branch: TIntegerField;
    qryReportDiscount: TFloatField;
    qryReportAd_hoc_Address: TIntegerField;
    qryReportDelivery_Notes: TStringField;
    qryReportReplenish_Source: TIntegerField;
    qryReportSupplier: TIntegerField;
    qryReportBranch_no0: TIntegerField;
    qryReportSupp_order_type: TStringField;
    qryReportName: TStringField;
    qryReportPart: TStringField;
    qryReportSell_Pack_Quantity: TIntegerField;
    qryReportQuantity_Ordered: TIntegerField;
    qryReportQuantity_Delivered: TIntegerField;
    qryReportQty_Outstanding: TIntegerField;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QrLblCst: TQRLabel;
    QRDBText6: TQRDBText;
    qryReportRep_Name: TWideStringField;
    qryReportPart_Description: TStringField;
    qryReportPart_Cost: TCurrencyField;
    qryReportPart_Sales_Price: TCurrencyField;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    qryReportPurch_Pack_Quantity: TIntegerField;
    DateQRLabel: TQRLabel;
    QRSysData1: TQRSysData;
    QRLblSeqBy: TQRLabel;
    QRLblDt: TQRLabel;
    QRLblGrpCst: TQRLabel;
    QRLblRepCst: TQRLabel;
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepQRFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepQRFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrSummaryAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    FBreakOnRep: boolean;
    rGroupTotal, rReportTotal: real;
    rGroupCst, rReportCst: real;
    procedure SetBreakOnRep(const Value: boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    TotalbyCust, TotalbySupp, TotalbyRep: bytebool;
    ShowSalesValue: bytebool;
    property BreakOnRep: boolean read FBreakOnRep write SetBreakOnRep;
    procedure ExportToFile(fileName: string);
  end;

implementation

uses STRSWorkIP;

{$R *.DFM}

procedure TSTRPWorkIPfrm.QuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qrlblSalesValue.Enabled := ShowSalesValue;
  lblValue.Enabled := ShowSalesValue;
  qrSummary.Enabled := ShowSalesValue;
  repQrFooter.Enabled := ShowSalesValue;

  with QuickReport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;  
    OutputBin := PrinterSettings.OutputBin;
  end;
  qryReport.Open;
  if BreakOnRep then
    begin
      RepQRGroup.Expression := 'qryReport.Rep';
      GrpByQRDBText.DataField := 'Rep_Name';
      end;

  if TotalByCust then
    begin
      RepQRFooter.enabled := True;
      RepQRGroup.Expression := 'qryReport.Name';
      GrpByQRDBText.DataField := 'Name';
      end;
  if TotalBySupp then
    begin
      RepQRFooter.enabled := True;
      RepQRGroup.Expression := 'qryReport.Account_Code';
      GrpByQRDBText.DataField := 'Account_Code';
      end;
  if TotalByRep then
    begin
      RepQRFooter.enabled := True;
      RepQRGroup.Expression := 'qryReport.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
      end;
  DateQRLabel.Caption := 'Run Date: ' + DateToStr(Now);
end;

procedure TSTRPWorkIPfrm.SetBreakOnRep(const Value: boolean);
begin
  FBreakOnRep := Value;
end;

procedure TSTRPWorkIPfrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rValue: real;
begin
  rValue := RoundFloat((qryReport.Fieldbyname('Part_Sales_Price').asfloat/QryReport.FieldByname('Sell_Pack_Quantity').AsInteger) *
  QryReport.FieldByName('Qty_Outstanding').AsFloat,2);
  lblValue.caption := formatfloat('#,##0.00',rValue);
  rGroupTotal := rGroupTotal +rValue;
  rReportTotal := rReportTotal + rvalue;
  rValue := RoundFloat((qryReport.Fieldbyname('Part_Cost').asfloat/QryReport.FieldByname('Purch_Pack_Quantity').AsInteger) *
  QryReport.FieldByName('Qty_Outstanding').AsFloat,2);
  QrlblCst.caption := formatfloat('#,##0.00',rValue);
  rGroupCst := rGroupCst + rValue;
  rReportCst := rReportCst + rValue;
end;

procedure TSTRPWorkIPfrm.RepQRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  rGroupTotal := 0.00;
  rGroupCst := 0.00;
end;

procedure TSTRPWorkIPfrm.RepQRFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblGrpTotal.caption := formatfloat('#,##0.00',rGroupTotal);
  QRLblGrpCst.Caption := formatfloat('#,##0.00',rGroupCst);
end;

procedure TSTRPWorkIPfrm.qrSummaryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblReportTotal.caption := formatfloat('#,##0.00',rReportTotal);
  QRLblRepCst.Caption := formatfloat('#,##0.00',rReportCst);
end;

procedure TSTRPWorkIPfrm.RepQRFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
rGroupTotal := 0.00;
rGroupCst := 0.00;
end;

procedure TSTRPWorkIPfrm.qrSummaryAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
rReportTotal := 0.00;
rReportCst := 0.00;
end;

procedure TSTRPWorkIPfrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempstr := '"SO Number"'
              + ',"Order Date"'
              + ',"Customer"'
              + ',"Rep Name"'
              + ',"Product"'
              + ',"Description"'
              + ',"Sales Pack"'
              + ',"Purchase Pack"'
              + ',"Delivery Date"'
              + ',"Customer Order Ref"'
              + ',"Order Qty"'
              + ',"Delivery Qty"'
              + ',"Outstanding Qty"'
              + ',"Sales Value"'
              + ',"Cost Value"';

  writeLn(self.exportFile, tempStr);
  self.quickreport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TSTRPWorkIPfrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    tempStr := '"' + qryReport.fieldbyname('Sales_Order').asstring + '"';

    //delivery date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Ordered').asstring + '"';

    //customer name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Name').asstring + '"';

    //repName
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asString + '"';

    //Preoduct
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part').asstring + '"';

    //Preoduct
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part_Description').asstring + '"';

    //Sales Pack
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Sell_Pack_Quantity').asstring + '"';

    //Purchase Pack
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Purch_Pack_Quantity').asstring + '"';

    //Date Required
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Required').asString + '"';

    //Customer order no
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Cust_Order_No').asstring + '"';

    //Quantity Ordered
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Quantity_Ordered').asstring + '"';

    //Quantity Delivered
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Quantity_Delivered').asstring + '"';

    //Quantity Outstanding
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Qty_Outstanding').asstring + '"';

    //Sales Value
    tempStr := tempStr + ',"' + lblValue.caption + '"';

    //Cost
    tempStr := tempStr + ',"' + qrlblCst.caption + '"';

    writeln(self.exportFile, tempStr);

    STRSWorkIPfrm.prgbrExport.StepIt;
  end;

end;

end.
