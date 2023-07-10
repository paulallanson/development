(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Broker work in progress report.

VSS Info:
$Header: /PBL D5/PBRPWorkIP.pas 10    17/06/:3 11:52 Paul $
$History: PBRPWorkIP.pas $
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 17/06/:3   Time: 11:52
 * Updated in $/PBL D5
 * Initialised the report totals
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
unit PBRPJobBagWIP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, QuickRpt, Qrctrls, CCSPrint, CCSCommon, qrprntr,
  printers;

type
  TPBRPJobBagWIPfrm = class(TForm)
    QuickReport: TQuickRep;
    qryReport: TQuery;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qryReportPurchase_Order: TFloatField;
    qryReportLine: TIntegerField;
    qryReportCust_Order_No: TStringField;
    qryReportGoods_Required: TDateTimeField;
    qryReportPurch_Ord_Line_Status: TIntegerField;
    qryReportProof_Required: TStringField;
    qryReportCustomers_Desc: TStringField;
    qryReportDate_Point: TDateTimeField;
    qryReportForm_Reference_ID: TStringField;
    qryReportName: TStringField;
    qryReportAccount_Code: TStringField;
    qryReportPOLine: TStringField;
    RunDateQRLabel: TQRLabel;
    QRLabel9: TQRLabel;
    qryReportDelivery_no: TIntegerField;
    qryReportDelivery_Date: TDateTimeField;
    qryReportDate_Deliv_Actual: TDateTimeField;
    RepQRGroup: TQRGroup;
    GrpByQRDBText: TQRDBText;
    qryReportRep_Name: TStringField;
    qryReportRep: TIntegerField;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    HoldQRLabel: TQRLabel;
    OnHoldQRLabel: TQRLabel;
    qryReportOn_Hold: TStringField;
    QRLabel12: TQRLabel;
    qrlblSalesValue: TQRLabel;
    lblQuantity: TQRLabel;
    qryReportQty_to_Deliver: TFloatField;
    qryReportQty_Delivered: TFloatField;
    lblSalesValue: TQRLabel;
    qryReportSelling_Price: TCurrencyField;
    qryReportPrice_Unit_Factor: TFloatField;
    qryReportQuantity: TFloatField;
    RepQRFooter: TQRBand;
    Totals: TQRLabel;
    lblGrpSalesTotal: TQRLabel;
    qrSummary: TQRBand;
    QRLabel15: TQRLabel;
    lblReportSalesTotal: TQRLabel;
    qrshapeGroup: TQRShape;
    qrshapereport: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel13: TQRLabel;
    qrlblJobBag: TQRDBText;
    qryReportJob_Bag: TIntegerField;
    qryReportOffice_Contact: TIntegerField;
    qryReportAccount_Manager: TStringField;
    QRSysData1: TQRSysData;
    qrlblCostValue: TQRLabel;
    qrlblMarginValue: TQRLabel;
    lblCostValue: TQRLabel;
    lblMarginValue: TQRLabel;
    lblGrpCostTotal: TQRLabel;
    lblGrpMarginTotal: TQRLabel;
    lblGrpPerc: TQRLabel;
    lblReportCostTotal: TQRLabel;
    lblReportMarginTotal: TQRLabel;
    lblReportPerc: TQRLabel;
    qryReportCost_Price: TCurrencyField;
    qryReportCost_Unit_Factor: TFloatField;
    qryReportStatus_Description: TStringField;
    qryReportExtra_Costs: TFloatField;
    qryReportExtra_Sales: TFloatField;
    procedure qryReportPOLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryReportProof_RequiredGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
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
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    FBreakOnRep: boolean;
    rGroupSalesTotal, rReportSalesTotal: real;
    rGroupCostTotal, rReportCostTotal: real;
    procedure SetBreakOnRep(const Value: boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    TotalbyCust, TotalbySupp, TotalbyRep, TotalByAccMgr: bytebool;
    ShowSalesValue, ShowCostValue: bytebool;
    property BreakOnRep: boolean read FBreakOnRep write SetBreakOnRep;
    procedure ExportToFile(fileName: string);
  end;

implementation

uses PBRSJobBagWIP;

{$R *.DFM}

procedure TPBRPJobBagWIPfrm.qryReportPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReportPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryReportPurchase_Order.Asfloat,qryReportLine.AsInteger);
end;

procedure TPBRPJobBagWIPfrm.qryReportProof_RequiredGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReportProof_Required.IsNull then
    Text := ''
  else
  if qryReportProof_Required.AsString[1] = 'Y' then
    Text := 'YES'
  else
    Text := 'NO';
end;

procedure TPBRPJobBagWIPfrm.QuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  QuickReport.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  QuickReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  QuickReport.PrinterSettings.Copies := Copies;   {set the output bin the }

  rReportSalesTotal := 0.00;
  rGroupSalesTotal := 0.00;

  qrlblCostValue.Enabled := ShowCostValue;
  lblCostValue.Enabled := ShowCostValue;
  qrlblMarginValue.Enabled := ShowCostValue;
  lblMarginValue.Enabled := ShowCostValue;

  lblGrpCostTotal.Enabled := ShowCostValue;
  lblGrpMarginTotal.Enabled := ShowCostValue;
  lblGrpPerc.Enabled := ShowCostValue;

  if not showCostValue then
    begin
      qrShapeGroup.width := 85;
      qrShapeReport.width := 85;
    end;

  lblReportCostTotal.Enabled := ShowCostValue;
  lblReportMarginTotal.Enabled := ShowCostValue;
  lblReportPerc.Enabled := ShowCostValue;

  qrlblSalesValue.Enabled := ShowSalesValue;
  lblSalesValue.Enabled := ShowSalesValue;

(*  with QuickReport.PrinterSettings do
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
*)
  qryReport.Open;
(*  if BreakOnRep then
    begin
      RepQRGroup.Expression := 'qryReport.Rep';
      GrpByQRDBText.DataField := 'Rep_Name';
      end;
*)
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
  if TotalByAccMgr then
    begin
      RepQRFooter.enabled := True;
      RepQRGroup.Expression := 'qryReport.Account_Manager';
      GrpByQRDBText.DataField:= 'Account_Manager';
      end;

  qrSummary.Enabled := ShowSalesValue;
  repQrFooter.Enabled := ShowSalesValue;
  RunDateQRLabel.Caption := 'Run Date: ' + DateToStr(Now);
end;

procedure TPBRPJobBagWIPfrm.SetBreakOnRep(const Value: boolean);
begin
  FBreakOnRep := Value;
end;

procedure TPBRPJobBagWIPfrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rSalesValue, rCostValue, rMargin: real;
begin
  rSalesValue := 0;
  rCostValue := 0;

  If qryReport.fieldByName('On_Hold').AsString  = 'Y' then
    OnHoldQRLabel.Caption := '*'
  else
    OnHoldQRLabel.Caption := ' ';

  If qryReport.fieldByName('Date_Deliv_Actual').AsString  = '' then
    lblQuantity.Caption := qryReport.fieldByName('Qty_to_Deliver').AsString
  else
    lblQuantity.Caption := qryReport.fieldByName('Qty_Delivered').AsString;

  if qryReport.Fieldbyname('Price_Unit_Factor').asinteger = 0 then
    begin
      try
        rSalesValue := (qryReport.Fieldbyname('Selling_Price').asfloat/qryReport.Fieldbyname('Quantity').asfloat)
                * strtoint(lblQuantity.Caption);
        rSalesValue := rSalesValue + qryReport.Fieldbyname('Extra_Sales').asfloat;
        lblSalesValue.caption := Formatfloat('#,##0.00',rSalesValue)
      except
        rSalesValue := 0.00;
        lblSalesValue.caption := '#ERROR#';
      end
    end
  else
    begin
      rSalesValue := (strtoint(lblQuantity.Caption)/qryReport.Fieldbyname('Price_Unit_Factor').asinteger)
                * qryReport.Fieldbyname('Selling_Price').asfloat;
      rSalesValue := rSalesValue + qryReport.Fieldbyname('Extra_Sales').asfloat;
      lblSalesValue.caption := formatfloat('#,##0.00',rSalesValue);
    end;

  if qryReport.Fieldbyname('Cost_Unit_Factor').asinteger = 0 then
    begin
      try
        rCostValue := (qryReport.Fieldbyname('Cost_Price').asfloat/qryReport.Fieldbyname('Quantity').asfloat)
                * strtoint(lblQuantity.Caption);
        rCostValue := rCostValue + qryReport.Fieldbyname('Extra_Costs').asfloat;
        lblCostValue.caption := Formatfloat('#,##0.00',rCostValue)
      except
        rCostValue := 0.00;
        lblCostValue.caption := '#ERROR#';
      end;
    end
  else
    begin
      rCostValue := (strtoint(lblQuantity.Caption)/qryReport.Fieldbyname('Cost_Unit_Factor').asinteger)
                * qryReport.Fieldbyname('Cost_Price').asfloat;
      rCostValue := rCostValue + qryReport.Fieldbyname('Extra_Costs').asfloat;
      lblCostValue.caption := formatfloat('#,##0.00',rCostValue);
    end;

  if qryReport.fieldbyname('Purch_ord_line_status').asinteger = 30 then
    begin
      rSalesValue := 0;
      rCostValue := 0;
      lblSalesValue.caption := 'Invoiced';
      lblCostValue.caption := 'Invoiced';
    end;

  rMargin := rSalesValue - rCostValue;
  lblMarginValue.caption := formatfloat('#,##0.00',rMargin);

  rGroupSalesTotal := rGroupSalesTotal + rSalesValue;
  rGroupCostTotal := rGroupCostTotal + rCostValue;
  rReportSalesTotal := rReportSalesTotal + rSalesValue;
  rReportCostTotal := rReportCostTotal + rCostValue;
end;

procedure TPBRPJobBagWIPfrm.RepQRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  rGroupSalesTotal := 0.00;
  rGroupCostTotal := 0.00;
end;

procedure TPBRPJobBagWIPfrm.RepQRFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rMargin, rPerc: real;
begin
  lblGrpSalesTotal.caption := formatfloat('#,##0.00',rGroupSalesTotal);
  lblGrpCostTotal.caption := formatfloat('#,##0.00',rGroupCostTotal);
  rMargin := rGroupSalesTotal - rGroupCostTotal;
  try
    rPerc := (rMargin/rGroupCostTotal)*100;
  except
    rPerc := 999;
  end;
  lblGrpMarginTotal.caption := formatfloat('#,##0.00',rMargin);
  lblGrpPerc.caption := formatfloat('#,##0%',rPerc);
end;

procedure TPBRPJobBagWIPfrm.qrSummaryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rMargin, rPerc: real;
begin
  lblReportSalesTotal.caption := formatfloat('#,##0.00',rReportSalesTotal);
  lblReportCostTotal.caption := formatfloat('#,##0.00',rReportCostTotal);
  rMargin := rReportSalesTotal - rReportCostTotal;

  try
    rPerc := (rMargin/rReportCostTotal)*100;
  except
    rPerc := 999;
  end;
  
  lblReportMarginTotal.caption := formatfloat('#,##0.00',rMargin);
  lblReportPerc.caption := formatfloat('#,##0%',rPerc);
end;

procedure TPBRPJobBagWIPfrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempstr := '"PO Number"'
              + ',"Order Date"'
              + ',"Customer"'
              + ',"Description"'
              + ',"Customer Order Ref"'
              + ',"Form Reference"'
              + ',"Job Bag"'
              + ',"Delivery Date"'
              + ',"Actual Delivery Date"'
              + ',"Supplier"'
              + ',"Quantity"'
              + ',"Sales Value"'
              + ',"Cost Value"'
              + ',"Margin"'
              + ',"Account Manager"'
              + ',"Rep Name"'
              + ',"Status"'
              + ',"On Hold"';

  writeLn(self.exportFile, tempStr);
  self.quickreport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPJobBagWIPfrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    tempStr := '"' + qryReport.fieldbyname('Purchase_Order').asstring + '"';

    //delivery date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_point').asstring + '"';

    //customer name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Name').asstring + '"';

    //Job Bag description
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customers_Desc').asstring + '"';

    //Customer order no
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Cust_Order_No').asstring + '"';

    //Form Reference
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Form_Reference_ID').asString + '"';

    //Job Bag no
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_bag').asstring + '"';

    //Delivery Date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Delivery_Date').asString + '"';

    //Date Actually Delivered
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_deliv_Actual').asString + '"';

    //Supplier
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Code').asString + '"';

    //Quantity
    tempStr := tempStr + ',"' + lblQuantity.caption + '"';

    //Sales Value
    tempStr := tempStr + ',"' + lblSalesValue.caption + '"';

    //Cost
    tempStr := tempStr + ',"' + lblCostValue.caption + '"';

    //Margin
    tempStr := tempStr + ',"' + lblMarginValue.caption + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Manager').asString + '"';

    //repName
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asString + '"';

    //Status
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Status_Description').asstring + '"';

    //On Hold
    tempStr := tempStr + ',"' + OnholdQRLabel.caption + '"';

    writeln(self.exportFile, tempStr);

    PBRSJobBagWIPfrm.prgbrExport.StepIt;
  end;

end;

end.
