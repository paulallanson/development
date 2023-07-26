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
unit PBRPJobBagExtrasWIP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, QuickRpt, Qrctrls, CCSPrint, CCSCommon, qrprntr,
  printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPJobBagExtrasWIPfrm = class(TForm)
    QuickReport: TQuickRep;
    qryReport: TFDQuery;
    qrbPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    RunDateQRLabel: TQRLabel;
    RepQRGroup: TQRGroup;
    GrpByQRDBText: TQRDBText;
    qrsubJobBagline: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    lblQuantity: TQRLabel;
    lblValue: TQRLabel;
    RepQRFooter: TQRBand;
    qrlblTotals: TQRLabel;
    lblGrpTotal: TQRLabel;
    qrSummary: TQRBand;
    QRLabel15: TQRLabel;
    lblReportTotal: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrgJobBag: TQRGroup;
    qrdbJobBagNo: TQRDBText;
    qrFooterJobBag: TQRBand;
    QRShape3: TQRShape;
    qrlblJobBagTotal: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    lblJobBagTotal: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    qrlblOrderNo: TQRLabel;
    qrySO: TFDQuery;
    qryPO: TFDQuery;
    qrFooterJobBagSummary: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qrchildDetailed: TQRChildBand;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    qrlblSalesValue: TQRLabel;
    QRLabel13: TQRLabel;
    qrChildsummary: TQRChildBand;
    QRLabel26: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    qrlblSummaryValue: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qrlblSelection: TQRLabel;
    qrlblInclude: TQRLabel;
    qrlblJBStatus1: TQRLabel;
    lblCostValue: TQRLabel;
    QRLabel1: TQRLabel;
    lblJobBagCostTotal: TQRLabel;
    lblGrpCostTotal: TQRLabel;
    lblReportCostTotal: TQRLabel;
    qrlblSummaryCostValue: TQRLabel;
    QRLabel20: TQRLabel;
    lblReportMargin: TQRLabel;
    lblGrpMargin: TQRLabel;
    lblJobBagMargin: TQRLabel;
    qrlblSummaryMargin: TQRLabel;
    lblMargin: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblJBStatus2: TQRLabel;
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsubJobBaglineBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepQRFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgJobBagBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFooterJobBagBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFooterJobBagSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsubJobBaglineAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    lastJob: string;
    FBreakOnRep: boolean;
    rJobBagTotal, rGroupTotal, rReportTotal: real;
    rJobBagCostTotal, rGroupCostTotal, rReportCostTotal: real;
    FSummary: boolean;
    procedure SetBreakOnRep(const Value: boolean);
    function GetPOCostUnitDescription(tempPO: real): string;
    function GetPOCostUnitFactor(tempPO: real): integer;
    function GetPOCostPrice(tempPO: real): real;
    function GetPOPriceUnitDescription(tempPO: real): string;
    function GetPOPriceUnitFactor(tempPO: real): integer;
    function GetPOSellingPrice(tempPO: real): real;
    function GetSOPackSize(tempSO, tempLine: integer): integer;
    function GetSOSellingPrice(tempSO, tempLine: integer): real;
    function GetSOPurchPackSize(tempSO, tempLine: integer): integer;
    function GetSOPurchPrice(tempSO, tempLine: integer): real;
    procedure SetSummary(const Value: boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    TotalbyCust, TotalbySupp, TotalbyRep, TotalByAccMgr: bytebool;
    ShowSalesValue: bytebool;
    property BreakOnRep: boolean read FBreakOnRep write SetBreakOnRep;
    property Summary: boolean read FSummary write SetSummary;
    procedure ExportToFile(fileName: string);
  end;

implementation

uses PBRSJobBagExtrasWIP;

{$R *.DFM}

procedure TPBRPJobBagExtrasWIPfrm.QuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  rReportTotal := 0.00;
  rGroupTotal := 0.00;
  rJobBagTotal := 0.00;

  rReportCostTotal := 0.00;
  rGroupCostTotal := 0.00;
  rJobBagCostTotal := 0.00;

  {set the printer to what the user selected}
  QuickReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  QuickReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  QuickReport.PrinterSettings.Copies := Copies;   {set the output bin the }

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
      RepQRGroup.Expression := 'qryReport.Customer_Name';
      GrpByQRDBText.DataField := 'Customer_Name';
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

  qrlblSalesValue.Enabled := ShowSalesValue;
  lblValue.Enabled := ShowSalesValue;
  qrSummary.Enabled := ShowSalesValue;
  repQrFooter.Enabled := ShowSalesValue;
  qrFooterJobBag.Enabled := ShowSalesValue;

  RunDateQRLabel.Caption := 'Run Date: ' + DateToStr(Now);
end;

procedure TPBRPJobBagExtrasWIPfrm.SetBreakOnRep(const Value: boolean);
begin
  FBreakOnRep := Value;
end;

procedure TPBRPJobBagExtrasWIPfrm.qrsubJobBaglineBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rValue, rCostValue: real;
  qtyToInv: integer;
  packqty: integer;
  PriceUnit: integer;
  PriceUnitDescr: string;
  PriceUnitFactor: integer;
  PackSize: integer;
  SellPrice, CostPrice: real;
begin
  rValue := 0;
  rCostValue := 0;
  if qryReport.FieldByName('Job_Bag_Line_Type').asstring = 'P' then
    begin
      qtyToInv := qryReport.FieldByName('Quantity').asInteger - qryReport.FieldByName('Qty_Invoiced').asInteger;
      lblQuantity.Caption := FloatToStrF(qtyToInv, ffFixed, 15, 0);

//  Get the Sales value
      PriceUnitFactor := GetPOPriceUnitFactor(qryReport.FieldByName('Purchase_Order').asfloat);
      SellPrice := GetPOSellingPrice(qryReport.FieldByName('Purchase_Order').asfloat);
      if PriceUnitFactor = 0 then
        begin
          rValue := (SellPrice/qryReport.FieldByName('Quantity').asFloat)
                      * qtytoinv;
        end
      else
        rValue := (qtyToInv/PriceUnitFactor) * sellPrice;

      lblValue.caption := FloatToStrF(rValue, ffCurrency, 15, 2);

//  Get the Cost value
      PriceUnitFactor := GetPOCostUnitFactor(qryReport.FieldByName('Purchase_Order').asfloat);
      CostPrice := GetPOCostPrice(qryReport.FieldByName('Purchase_Order').asfloat);
      if PriceUnitFactor = 0 then
        begin
          rCostValue := (CostPrice/qryReport.FieldByName('Quantity').asFloat)
                      * qtytoinv;
        end
      else
        rCostValue := (qtyToInv/PriceUnitFactor) * CostPrice;

      lblCostValue.caption := FloatToStrF(rCostValue, ffCurrency, 15, 2);

      qrlblOrderNo.Caption := 'PO/'+ qryREport.FieldByName('Purchase_Order').asstring;
    end
  else
  if qryReport.FieldByName('Job_Bag_Line_Type').asstring = 'A' then
    begin
      qtyToInv := qryReport.FieldByName('JB_Line_Quantity').asInteger;
      lblQuantity.Caption := FloatToStrF(qtyToInv, ffFixed, 15, 0);

      if qryReport.FieldByName('Price_Unit_Factor').asFloat = 0 then
        rValue := qryReport.FieldByName('Selling_Price').asFloat
      else
        rValue := (qtyToInv/qryReport.FieldByName('Price_Unit_Factor').asFloat) * qryReport.FieldByName('Selling_Price').asFloat;

      lblValue.caption := FloatToStrF(rValue, ffCurrency, 15, 2);

//  Get the Cost value
      if qryReport.FieldByName('Price_Unit_Factor').asFloat = 0 then
        rCostValue := qryReport.FieldByName('Unit_Cost').asFloat
      else
        rCostValue := (qtyToInv/qryReport.FieldByName('Price_Unit_Factor').asFloat) * qryReport.FieldByName('Unit_Cost').asFloat;

      lblCostValue.caption := FloatToStrF(rCostValue, ffCurrency, 15, 2);
      qrlblOrderNo.Caption := '';
    end
  else
  if qryReport.FieldByName('Job_Bag_Line_Type').asstring = 'S' then
    begin
      qtyToInv := qryReport.FieldByName('JB_Line_Quantity').asInteger;
      lblQuantity.Caption := FloatToStrF(qtyToInv, ffFixed, 15, 0);

//  Get Sales Value
      PackSize := GetSOPackSize(qryReport.FieldByName('Sales_Order').asinteger,qryReport.FieldByName('Sales_Order_Line_no').asinteger );
      SellPrice := GetSOSellingPrice(qryReport.FieldByName('Sales_Order').asinteger,qryReport.FieldByName('Sales_Order_Line_no').asinteger);

      rValue := (qtyToInv/PackSize) * sellPrice;

      lblValue.caption := FloatToStrF(rValue, ffCurrency, 15, 2);

//  Get Cost Value
      PackSize := GetSOPurchPackSize(qryReport.FieldByName('Sales_Order').asinteger,qryReport.FieldByName('Sales_Order_Line_no').asinteger );
      CostPrice := GetSOPurchPrice(qryReport.FieldByName('Sales_Order').asinteger,qryReport.FieldByName('Sales_Order_Line_no').asinteger);

      rCostValue := (qtyToInv/PackSize) * CostPrice;
      lblCostValue.caption := FloatToStrF(rCostValue, ffCurrency, 15, 2);

      qrlblOrderNo.Caption := 'SO/'+ qryReport.FieldByName('Sales_Order').asstring;
    end
  else
    begin
      qtyToInv := qryReport.FieldByName('JB_Line_Quantity').asInteger;
      lblQuantity.Caption := FloatToStrF(qtyToInv, ffFixed, 15, 0);

      PackSize := 1;
      SellPrice := qryReport.FieldByName('Job_Bag_Line_Sell').asfloat;
      rValue := (qtyToInv/PackSize) * sellPrice;

      lblValue.caption := FloatToStrF(rValue, ffCurrency, 15, 2);

      lblCostValue.caption := FloatToStrF(rCostValue, ffCurrency, 15, 2);
      qrlblOrderNo.Caption := 'Sundry';
    end;

  lblMargin.caption := FloatToStrF((rValue-rCostValue), ffCurrency, 15, 2);
  rjobBagTotal := rjobBagTotal + rValue;
  rGroupTotal := rGroupTotal + rValue;
  rReportTotal := rReportTotal + rValue;

  rjobBagCostTotal := rjobBagCostTotal + rCostValue;
  rGroupCostTotal := rGroupCostTotal + rCostValue;
  rReportCostTotal := rReportCostTotal + rCostValue;
  PrintBand := not Summary;
end;

procedure TPBRPJobBagExtrasWIPfrm.RepQRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  rGroupTotal := 0.00;
  rGroupCostTotal := 0.00;
  if (GrpByQRDBText.Datafield <> '') and (GrpByQRDBText.Datafield <> 'GrpByQRDBText') then
    qrlblTotals.caption := 'Totals for: '+ qryReport.fieldbyname(GrpByQRDBText.Datafield).asstring
  else
    qrlblTotals.caption := '';
end;

procedure TPBRPJobBagExtrasWIPfrm.RepQRFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblGrpTotal.caption := formatfloat('#,##0.00',rGroupTotal);
  lblGrpCostTotal.caption := formatfloat('#,##0.00',rGroupCostTotal);
  lblGrpMargin.caption := formatfloat('#,##0.00',(rGroupTotal-rGroupCostTotal));
end;

procedure TPBRPJobBagExtrasWIPfrm.qrSummaryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblReportTotal.caption := formatfloat('#,##0.00',rReportTotal);
  lblReportCostTotal.caption := formatfloat('#,##0.00',rReportCostTotal);
  lblReportMargin.caption := formatfloat('#,##0.00',(rReportTotal-rReportCostTotal));
end;

procedure TPBRPJobBagExtrasWIPfrm.qrgJobBagBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  rJobBagTotal := 0.00;
  rJobBagCostTotal := 0.00;

  qrlblJobBagTotal.caption := 'Totals for Job Bag: '+ qryReport.fieldbyname(qrdbJobBagNo.Datafield).asstring;

  if qryReport.fieldbyname('On_Hold').asstring = 'Y' then
    qrlblJBStatus1.caption := 'ON HOLD'
  else
  if qryReport.fieldbyname('On_Hold').asstring = 'P' then
    qrlblJBStatus1.caption := 'Postage Pay Reqd'
  else
  if qryReport.fieldbyname('Ready_for_invoicing').asstring = 'Y' then
    qrlblJBStatus1.caption := 'Ready to Invoice'
  else
    qrlblJBStatus1.caption := qryReport.fieldbyname('Job_Bag_Status_Descr').asstring;

  PrintBand := not Summary;
end;

procedure TPBRPJobBagExtrasWIPfrm.qrFooterJobBagBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lblJobBagTotal.caption := formatfloat('#,##0.00',rJobBagTotal);
  lblJobBagCostTotal.caption := formatfloat('#,##0.00',rJobBagCostTotal);
  lblJobBagMargin.caption := formatfloat('#,##0.00',(rJobBagTotal-rJobBagCostTotal));
end;

function TPBRPJobBagExtrasWIPfrm.GetSOPackSize(tempSO, tempLine: integer): integer;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempSO;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Sell_Pack_Quantity').asinteger;
    end;
end;

function TPBRPJobBagExtrasWIPfrm.GetSOPurchPackSize(tempSO, tempLine: integer): integer;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempSO;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Purch_Pack_Quantity').asinteger;
    end;
end;

function TPBRPJobBagExtrasWIPfrm.GetSOSellingPrice(tempSO, tempLine: integer): real;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempSO;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_Sales_Price').asfloat;
    end;
end;

function TPBRPJobBagExtrasWIPfrm.GetSOPurchPrice(tempSO, tempLine: integer): real;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempSO;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_Cost').asfloat;
    end;
end;

function TPBRPJobBagExtrasWIPfrm.GetPOSellingPrice(tempPO: real): real;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Selling_Price').asfloat;
    end;
end;

function TPBRPJobBagExtrasWIPfrm.GetPOCostPrice(tempPO: real): real;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Order_Price').asfloat;
    end;
end;

function TPBRPJobBagExtrasWIPfrm.GetPOPriceUnitFactor(tempPO: real): integer;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

function TPBRPJobBagExtrasWIPfrm.GetPOCostUnitFactor(tempPO: real): integer;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Order_Unit_Factor').asinteger;
    end;
end;

function TPBRPJobBagExtrasWIPfrm.GetPOPriceUnitDescription(tempPO: real): string;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Price_Unit_Description').asstring;
    end;
end;

function TPBRPJobBagExtrasWIPfrm.GetPOCostUnitDescription(tempPO: real): string;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Order_Unit_Description').asstring;
    end;
end;

procedure TPBRPJobBagExtrasWIPfrm.SetSummary(const Value: boolean);
begin
  FSummary := Value;
  qrFooterJobBagSummary.enabled := FSummary;
  qrchildSummary.ParentBand := nil;
  qrchildDetailed.ParentBand := nil;
  
  if FSummary then
    begin
      qrchildSummary.ParentBand := qrbPageHeader;
      qrgJobBag.FooterBand := qrFooterJobBagSummary;
    end
  else
    begin
      qrchildDetailed.ParentBand := qrbPageHeader;

    end;
end;

procedure TPBRPJobBagExtrasWIPfrm.qrFooterJobBagSummaryBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempStr: string;
begin
  qrlblsummaryValue.caption := formatfloat('#,##0.00',rJobBagTotal);
  qrlblsummaryCostValue.caption := formatfloat('#,##0.00',rJobBagCostTotal);
  qrlblsummaryMargin.caption := formatfloat('#,##0.00',(rJobBagTotal-rJobBagCostTotal));

  if qryReport.fieldbyname('On_Hold').asstring = 'Y' then
    qrlblJBStatus2.caption := 'ON HOLD'
  else
  if qryReport.fieldbyname('On_Hold').asstring = 'P' then
    qrlblJBStatus2.caption := 'Postage Pay Reqd'
  else
  if qryReport.fieldbyname('Ready_for_invoicing').asstring = 'Y' then
    qrlblJBStatus2.caption := 'Ready to Invoice'
  else
    qrlblJBStatus2.caption := qryReport.fieldbyname('Job_Bag_Status_Descr').asstring;

  if self.exporting then
  begin
    tempStr := '"' + qryReport.fieldbyname('Job_Bag').asstring + '"';

    //delivery date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Delivery_Date').asstring + '"';

    //customer name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Job Bag description
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Descr').asstring + '"';

    //Customer order no
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Cust_Order_No').asstring + '"';

    //Quantity
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Quantity').asString + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Manager').asString + '"';

    //repName
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asString + '"';

    //cost price
    tempStr := tempStr + ',"£' + qrlblsummaryCostValue.caption + '"';

    //selling price
    tempStr := tempStr + ',"£' + qrlblsummaryValue.caption + '"';

    //margin
    tempStr := tempStr + ',"£' + qrlblsummaryMargin.caption + '"';

    //Status
    if qryReport.fieldbyname('Ready_for_invoicing').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Ready to Invoice' + '"'
    else
      tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Status_Descr').asstring + '"';

    writeln(self.exportFile, tempStr);

    PBRSJobBagExtrasWIPfrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPJobBagExtrasWIPfrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if self.Summary then
    begin
      tempstr := '"Job Number"'
              + ',"Date Required"'
              + ',"Customer"'
              + ',"Description"'
              + ',"Order Reference"'
              + ',"Quantity"'
              + ',"Account Manager"'
              + ',"Rep Name"'
              + ',"Cost Value"'
              + ',"Sales Value"'
              + ',"Margin"'
              + ',"Status"';
    end
  else
    begin
      tempstr := '"Job Number"'
              + ',"Date Required"'
              + ',"Customer"'
              + ',"Description"'
              + ',"Order Reference"'
              + ',"Status"'
              + ',"Line No"'
              + ',"Line Description"'
              + ',"Delivery Date"'
              + ',"Supplier"'
              + ',"Order No"'
              + ',"Quantity"'
              + ',"Account Manager"'
              + ',"Rep Name"'
              + ',"Cost Value"'
              + ',"Sales Value"'
              + ',"Margin"';
    end;

  writeLn(self.exportFile, tempStr);
  self.quickreport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPJobBagExtrasWIPfrm.qrsubJobBaglineAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempStr: string;
  incProgBar: boolean;
begin
  if self.exporting and not self.Summary then
  begin
    //Job Bag
    tempStr := '"' + qryReport.fieldbyname('Job_Bag').asstring + '"';

    if tempStr <> self.lastJob then
      incProgBar := true
    else
      incProgBar := false;

    self.lastJob := tempStr;

    //delivery date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Delivery_Date').asstring + '"';

    //customer name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Job Bag description
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Descr').asstring + '"';

    //Customer order no
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Cust_Order_No').asstring + '"';

    //Status
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Status_Descr').asstring + '"';

    //Job Bag line Number
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Line').asstring + '"';

    //Job Bag description
    tempStr := tempStr + ',"' + copy(qryReport.fieldbyname('Job_Bag_Line_Descr').asstring,1,100) + '"';

    //delivery date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Delivery_Date').asstring + '"';

    //Supplier
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Code').asstring + '"';

    //Order No
    tempStr := tempStr + ',"' + qrlblOrderNo.caption + '"';

    //Quantity
    tempStr := tempStr + ',"' + lblQuantity.caption + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Manager').asString + '"';

    //rep Name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asString + '"';

    //cost price
    tempStr := tempStr + ',"' + lblCostValue.caption + '"';

    //selling price
    tempStr := tempStr + ',"' + lblValue.caption + '"';

    //margin
    tempStr := tempStr + ',"' + lblMargin.caption + '"';

    writeln(self.exportFile, tempStr);
    if incProgBar then
      PBRSJobBagExtrasWIPfrm.prgbrExport.StepIt;
  end;
end;

end.
