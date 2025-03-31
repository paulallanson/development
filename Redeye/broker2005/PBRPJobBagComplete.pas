unit PBRPJobBagComplete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, QuickRpt, Qrctrls, CCSPrint, CCSCommon, printers, qrprntr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPJobBagCompleteFrm = class(TForm)
    qrpDetails: TQuickRep;
    qryReport: TFDQuery;
    QRBand2: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel3: TQRLabel;
    RunDateQRLabel: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    RepQRFooter: TQRBand;
    Totals: TQRLabel;
    QRLblGroupSales: TQRLabel;
    qrSummary: TQRBand;
    QRLabel15: TQRLabel;
    QRLblReportSales: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QuantityLbl: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    RepQRGroup: TQRGroup;
    QRDBQuantityText1: TQRDBText;
    TotalCostLbl: TQRLabel;
    TotalSellLbl: TQRLabel;
    MarginQRBLabel: TQRLabel;
    MargPercQRLabel: TQRLabel;
    QRDBText1: TQRDBText;
    JobQRGroup: TQRGroup;
    JobQRFooter: TQRBand;
    qrshapeJobBag: TQRShape;
    qrlblJobBagTotal: TQRLabel;
    QRLblJobSales: TQRLabel;
    GrpByQRDBText: TQRDBText;
    QRLblJobCost: TQRLabel;
    QRLblGroupCost: TQRLabel;
    QRLblReportCost: TQRLabel;
    QRLblTotBy: TQRLabel;
    QRSysData1: TQRSysData;
    QRLblCust: TQRLabel;
    QRLblDesc: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRlblMargin: TQRLabel;
    QRlblMarginPerc: TQRLabel;
    QRlblGroupMargin: TQRLabel;
    QRlblGroupMarginPerc: TQRLabel;
    QRlblReportMargin: TQRLabel;
    QRlblReportMarginPerc: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    qrdbJobNumber: TQRDBText;
    qrdbJobCustomer: TQRDBText;
    qrdbJobDate: TQRDBText;
    qrdbJobDescription: TQRDBText;
    qrdbJobQuantity: TQRDBText;
    qryGetPOLine: TFDQuery;
    qryGetProdType: TFDQuery;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qryGetSuppInvoice: TFDQuery;
    qryGetSalesInvoice: TFDQuery;
    qryGetSuppPOInvoice: TFDQuery;
    qryGetPO: TFDQuery;
    qryDummy: TFDQuery;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepQRFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure JobQRFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure JobQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure JobQRFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    exporting: boolean;
    exportFile: textFile;
    FBreakOnRep: boolean;
    rGroup1Cost, rGroup1Sell, rReportCost, rReportSell,
    rGroup2Sell, rGroup2Cost, TempMargin, rTotalCost, rTotalSell:Real;
    sAnalysis1, sAnalysis2: string;
    procedure SetBreakOnRep(const Value: boolean);
    function GetProductType(tempProdType: integer; tempPO: real): string;
    function GetInvoicedCost: double;
    function GetInvoicedSell: double;
    function GetJBLineCost: double;
    function GetJBLineSell: double;
    { Private declarations }
  public
    bSummary, bInvoicedValues: boolean;
    PrinterSettings: TPrinterSettings;
    TotalbyCust, TotalbySupp, TotalbyRep, TotalbyAccManager: bytebool;
    ShowComplete, ShowInvThisWeek, ShowSalesValue: bytebool;
    SortBy: integer;
    AccMgr, Customer: integer;
    DateFrom, DateTo: TDateTime;
    function GetDetails: integer;
    property BreakOnRep: boolean read FBreakOnRep write SetBreakOnRep;
    procedure ExportToFile(fileName: string);
  end;

implementation

uses PBRSJobBagComplete, pbDatabase;

{$R *.DFM}


procedure TPBRPJobBagCompleteFrm.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
//  qrlblSalesValue.Enabled := ShowSalesValue;
 // lblValue.Enabled := ShowSalesValue;
//  qrSummary.Enabled := ShowSalesValue;
    repQrFooter.Enabled := ShowSalesValue;
    rGroup1Cost := 0;
    rGroup1Sell := 0;
    rReportCost := 0;
    rReportSell := 0;
    rGroup2Sell := 0;
    rGroup2Cost := 0;

  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

(*  with qrpDetails.PrinterSettings do
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
      Totals.caption := 'Totals for Customer';
      QRSubDetail1.height := 21;
      end;
(*  if TotalBySupp then
    begin
      RepQRFooter.enabled := True;
      RepQRGroup.Expression := 'qryReport.Supplier_Name';
      GrpByQRDBText.DataField := 'Supplier_Name';
      Totals.Caption := 'Totals for Supplier';
      end;
  if TotalByRep then
    begin
      RepQRFooter.enabled := True;
      RepQRGroup.Expression := 'qryReport.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
      Totals.Caption := 'Totals for Rep';
      end;
*)
  if TotalByAccManager then
    begin
      RepQRFooter.enabled := True;
      RepQRGroup.Expression := 'qryReport.Account_Manager';
      GrpByQRDBText.DataField:= 'Account_Manager';
      Totals.Caption := 'Totals for Account Manager';
      end;
  RunDateQRLabel.Caption := 'Run Date: ' + DateToStr(Now);
end;

function TPBRPJobBagCompleteFrm.GetDetails: integer;
begin
  with qryReport do
    begin
      SQL.Text := qryDummy.SQL.text;
      if TotalByCust then
        SQL.Text := SQL.Text + 'ORDER BY Customer_Name, Job_bag.Job_bag'
      else
      if TotalByAccManager then
        SQL.Text := SQL.Text + 'ORDER BY Account_Manager, Job_bag.Job_bag'
      else
        SQL.Text := SQL.Text + 'ORDER BY Job_bag.Job_bag';
        
      close;
      ParamByname('Customer').Asinteger := Customer;
      ParamByname('Office_Contact').Asinteger := AccMgr;
      ParamByname('Date_From').Asdatetime := DateFrom;
      ParamByname('Date_To').Asdatetime := DateTo;
      if ShowInvThisWeek then
        ParamByname('Invoice_this_Week').Asstring := 'Y'
      else
        ParamByname('Invoice_this_Week').Asstring := 'A';
      if ShowComplete then
        ParamByname('Production_Complete').Asstring := 'Y'
      else
        ParamByname('Production_Complete').Asstring := 'A';
      open;
      result := recordcount;
    end;
end;

procedure TPBRPJobBagCompleteFrm.SetBreakOnRep(const Value: boolean);
begin
  FBreakOnRep := Value;
end;

procedure TPBRPJobBagCompleteFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with qrpDetails.DataSet do
    begin
//    OrderLbl.caption := PBFormatPONum(fieldbyname('Purchase_Order').asFloat,fieldbyname('Line').asinteger);
      if bInvoicedValues then
        begin
          rTotalCost := GetInvoicedCost;
          rTotalSell := GetInvoicedSell;
        end
      else
        begin
//          rTotalCost := FieldByName('Job_Bag_Line_Cost').asfloat;
//          rTotalSell := FieldByName('Job_Bag_Line_Sell').asfloat;
          rTotalCost := GetJBLineCost;
          rTotalSell := GetJBLineSell;
        end;

      TotalCostLbl.Caption := formatfloat('0.00',rTotalCost);
      TotalSellLbl.Caption := formatfloat('0.00',rTotalSell);

      {Calculate the margin %Age}
      TempMargin := rTotalSell - rTotalCost ;
      MarginQRBLabel.Caption := FormatFloat('######0.00', TempMargin);
      if rTotalSell = 0 then
        MargPercQRLabel.Caption := ''
      else
        MargPercQRLabel.Caption := FormatFloat('###0.00', (TempMargin /
          rTotalSell) * 100.00);

      {Total Group Cost and Sell Values}
      rGroup1Cost := rGroup1Cost + rTotalCost;
      rGroup1Sell := rGroup1Sell + rTotalSell;
      rGroup2Cost := rGroup2Cost + rTotalCost;
      rGroup2Sell := rGroup2Sell + rTotalSell;
      rReportCost := rReportCost + rTotalCost;
      rReportSell := rReportSell + rTotalSell;
      QRLblCust.Caption := FieldByName('Customer_Name').AsString;
      if totalbyCust then
        QRLblCust.Caption := FieldByName('Job_Bag_Line_Descr').AsString
      else
        QRLblDesc.Caption := FieldByName('Job_Bag_Line_Descr').AsString;

    end;
  printBand := not bSummary;
end;

function  TPBRPJobBagCompleteFrm.GetInvoicedCost: double;
begin
  result := 0;
  if qrpDetails.DataSet.fieldbyname('Purchase_order').asfloat <> 0 then
    begin
      with qryGetSuppPOInvoice do
        begin
          close;
          parambyname('Purchase_order').asfloat := qrpDetails.DataSet.fieldbyname('Purchase_order').asfloat;
          parambyname('Line').asinteger := qrpDetails.DataSet.fieldbyname('Line').asinteger;
          open;

          first;
          while eof <> true do
            begin
              if fieldbyname('Price_Unit_Factor').asinteger = 0 then
                result := result + fieldbyname('Goods_Value').asfloat
              else
                begin
                  if fieldbyname('Qty_Invoiced').asinteger >= 0 then
                    result := result + ((fieldbyname('Qty_Invoiced').asinteger / fieldbyname('Price_unit_Factor').asinteger)*fieldbyname('Goods_Value').asfloat)
                  else
                    result := result + ((fieldbyname('Qty_Invoiced').asinteger / fieldbyname('Price_unit_Factor').asinteger)*fieldbyname('Goods_Value').asfloat)*-1
                end;
              result := result + fieldbyname('Total_Charges').asfloat;
              next;
            end;

        end;
    end
  else
    begin
      with qryGetSuppInvoice do
        begin
          close;
          parambyname('Job_Bag').asinteger := qrpDetails.DataSet.fieldbyname('Job_Bag').asinteger;
          parambyname('Job_Bag_Line').asinteger := qrpDetails.DataSet.fieldbyname('Line').asinteger;
          open;

          first;
          while eof <> true do
            begin
              if fieldbyname('Price_Unit_Factor').asinteger = 0 then
                result := result + fieldbyname('Goods_Value').asfloat
              else
                begin
                  if fieldbyname('Qty_Invoiced').asinteger >= 0 then
                    result := result + ((fieldbyname('Qty_Invoiced').asinteger / fieldbyname('Price_unit_Factor').asinteger)*fieldbyname('Goods_Value').asfloat)
                  else
                    result := result + ((fieldbyname('Qty_Invoiced').asinteger / fieldbyname('Price_unit_Factor').asinteger)*fieldbyname('Goods_Value').asfloat)*-1
                end;
              next;
            end;
        end;
    end
end;

function  TPBRPJobBagCompleteFrm.GetInvoicedSell: double;
begin
  result := 0;
  with qryGetSalesInvoice do
    begin
      close;
      parambyname('Job_Bag').asinteger := qrpDetails.DataSet.fieldbyname('Job_Bag').asinteger;
      parambyname('Job_bag_Line').asinteger := qrpDetails.DataSet.fieldbyname('Job_Bag_Line').asinteger;
      open;

      first;

      while eof <> true do
        begin
          if fieldbyname('Price_Unit_Factor').asinteger = 0 then
            result := result + fieldbyname('Goods_Value').asfloat
          else
            begin
              if fieldbyname('Qty_Invoiced').asinteger >= 0 then
                result := result + ((fieldbyname('Qty_Invoiced').asinteger / fieldbyname('Price_unit_Factor').asinteger)*fieldbyname('Goods_Value').asfloat)
              else
                result := result + ((fieldbyname('Qty_Invoiced').asinteger / fieldbyname('Price_unit_Factor').asinteger)*fieldbyname('Goods_Value').asfloat)*-1
            end;
          result := result + fieldbyname('Total_Charges').asfloat;
          next;
        end;
    end;
end;

function  TPBRPJobBagCompleteFrm.GetJBLineCost: double;
var
  iQuantity: integer;
begin
  result := 0.000000;
  iQuantity := qrpDetails.DataSet.fieldbyname('Job_Bag_Quantity').asinteger - qrpDetails.DataSet.fieldbyname('Qty_Invoiced').asinteger;
  if iQuantity <= 0 then
    exit;

  if qrpDetails.DataSet.fieldbyname('Line_Is_Internal_Cost').asstring = 'Y' then
    result := qrpDetails.DataSet.fieldbyname('Job_Bag_Line_Cost').asfloat
  else
  if qrpDetails.DataSet.fieldbyname('Purchase_order').asfloat <> 0 then
    begin
      if qrpDetails.DataSet.fieldbyname('PO_Order_Unit_Factor').asinteger = 0 then
        result := qrpDetails.DataSet.fieldbyname('PO_Order_Price').asfloat
      else
        result := qrpDetails.DataSet.fieldbyname('PO_Order_Price').asfloat * (iQuantity/qrpDetails.DataSet.fieldbyname('PO_Order_Unit_Factor').asinteger);
    end
  else
    begin
      if qrpDetails.DataSet.fieldbyname('JB_Price_Unit_Factor').asinteger = 0 then
        result := qrpDetails.DataSet.fieldbyname('Unit_Cost').asfloat
      else
        result := qrpDetails.DataSet.fieldbyname('Unit_Cost').asfloat * (iQuantity/qrpDetails.DataSet.fieldbyname('JB_Price_Unit_Factor').asinteger);
    end
end;

function  TPBRPJobBagCompleteFrm.GetJBLineSell: double;
var
  iQuantity: integer;
begin
  result := 0.000000;
  iQuantity := qrpDetails.DataSet.fieldbyname('Job_Bag_Quantity').asinteger - qrpDetails.DataSet.fieldbyname('Qty_Invoiced').asinteger;
  if iQuantity <= 0 then
    exit;

  if qrpDetails.DataSet.fieldbyname('Purchase_order').asfloat <> 0 then
    begin
      if qrpDetails.DataSet.fieldbyname('PO_Sell_Unit_Factor').asinteger = 0 then
        result := qrpDetails.DataSet.fieldbyname('PO_Selling_Price').asfloat
      else
        result := qrpDetails.DataSet.fieldbyname('PO_Selling_Price').asfloat * (iQuantity/qrpDetails.DataSet.fieldbyname('PO_Order_Unit_Factor').asinteger);
    end
  else
    begin
      if qrpDetails.DataSet.fieldbyname('JB_Price_Unit_Factor').asinteger = 0 then
        result := qrpDetails.DataSet.fieldbyname('Selling_Price').asfloat
      else
        result := qrpDetails.DataSet.fieldbyname('Selling_Price').asfloat * (iQuantity/qrpDetails.DataSet.fieldbyname('JB_Price_Unit_Factor').asinteger);
    end
end;

procedure TPBRPJobBagCompleteFrm.RepQRFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   {Calculate the margin %Age}
  TempMargin := rGroup2Sell - rGroup2Cost ;
  QRlblGroupMargin.Caption := FormatFloat('#,###,##0.00', TempMargin);
  if rGroup2Sell = 0 then
    QRlblGroupMarginPerc.Caption := ''
  else
    QRlblGroupMarginPerc.Caption := FormatFloat('###0.00', (TempMargin /
     rGroup2Sell) * 100.00);

  QRLblGroupCost.caption := formatfloat('#,###,##0.00',rGroup2Cost);
  QRLblGroupSales.Caption := FormatFloat('#,###,##0.00',rGroup2Sell);
  rGroup2Cost := 0 ;
  rGroup2Sell := 0;
end;

procedure TPBRPJobBagCompleteFrm.qrSummaryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   {Calculate the margin %Age}
  TempMargin := rReportSell - rReportCost ;
  QRlblReportMargin.Caption := FormatFloat('#,###,##0.00', TempMargin);
  if rReportSell = 0 then
    QRlblReportMarginPerc.Caption := ''
  else
    QRlblReportMarginPerc.Caption := FormatFloat('###0.00', (TempMargin /
     rReportSell) * 100.00);

  QRLblReportCost.caption := formatfloat('#,###,##0.00',rReportCost);
  QRLblReportSales.Caption := FormatFloat('#,###,##0.00',rReportSell);
end;

procedure TPBRPJobBagCompleteFrm.JobQRFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tempMargin: real;
begin
  qrdbJobNumber.Enabled := bSummary;
  qrdbJobDate.enabled := bSummary;
  qrdbJobCustomer.enabled := bSummary;
  qrdbJobDescription.enabled := bSummary;
  qrdbJobQuantity.enabled := bSummary;
  qrlblJobBagTotal.Enabled := not bSummary;
  qrshapeJobBag.Enabled := not bSummary;

   {Calculate the margin %Age}
  TempMargin := rGroup1Sell - rGroup1Cost ;
  QRlblMargin.Caption := FormatFloat('######0.00', TempMargin);
  if rGroup1Sell = 0 then
    QRlblMarginPerc.Caption := ''
  else
    QRlblMarginPerc.Caption := FormatFloat('###0.00', (TempMargin /
     rGroup1Sell) * 100.00);

  QRLblJobCost.caption := formatfloat('#,##0.00',rGroup1Cost);
  QRLblJobSales.Caption := FormatFloat('#,##0.00',rGroup1Sell);
  rGroup1Cost := 0;
  rGroup1Sell := 0;
end;

procedure TPBRPJobBagCompleteFrm.JobQRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 printBand := not bSummary;
end;

procedure TPBRPJobBagCompleteFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if self.bSummary then
    begin
      tempstr := '"Job Number"'
              + ',"Date Raised"'
              + ',"Start Date"'
              + ',"Date Required"'
              + ',"Customer"'
              + ',"Account Code"'
              + ',"Description"'
              + ',"Customer Order No."'
              + ',"Quantity"'
              + ',"Cost Value"'
              + ',"Sales Value"'
              + ',"Margin"'
              + ',"Margin %age"'
              + ',"Account Manager"'
              + ',"Rep Name"'
              + ',"On Hold"';
    end
  else
    begin
      tempstr := '"Job Number"'
              + ',"Date Raised"'
              + ',"Start Date"'
              + ',"Date Required"'
              + ',"Customer"'
              + ',"Account Code"'
              + ',"Description"'
              + ',"Customer Order No."'
              + ',"Line No"'
              + ',"Line Description"'
              + ',"Product Type"'
              + ',"Quantity"'
              + ',"Cost Value"'
              + ',"Sales Value"'
              + ',"Margin"'
              + ',"Margin %age"'
              + ',"Account Manager"'
              + ',"Rep Name"';
    end;

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPJobBagCompleteFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting and not self.bSummary then
  begin
    //Job Bag
    tempStr := '"' + qryReport.fieldbyname('Job_Bag').asstring + '"';

    //job bag date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Point').asstring + '"';

    //start date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Start').asstring + '"';

    //mailing date/required date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Goods_Required').asstring + '"';

    //customer name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //customer Code
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Code').asstring + '"';

    //Job Bag description
    tempStr := tempStr + ',"' + copy(qryReport.fieldbyname('Job_Bag_Descr').asstring,1,100) + '"';

    //Customer order no
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Cust_Order_No').asstring + '"';

    //Job Bag line Number
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Line').asstring + '"';

    //Job Bag description
    tempStr := tempStr + ',"' + copy(qryReport.fieldbyname('Job_Bag_Line_Descr').asstring,1,100) + '"';

    //Product Type
    tempStr := tempStr + ',"' + GetProductType(qryReport.fieldbyname('Product_Type').asinteger,qryReport.fieldbyname('Purchase_Order').asfloat) + '"';

    //Quantity
    tempStr := tempStr + ',"' + qryReport.fieldbyname('job_bag_quantity').asstring + '"';

    //cost price
    tempStr := tempStr + ',"' + totalcostlbl.caption + '"';

    //selling price
    tempStr := tempStr + ',"' + totalselllbl.caption + '"';

    //margin
    tempStr := tempStr + ',"' + MarginQRBlabel.caption + '"';

    //margin Perc
    tempStr := tempStr + ',"' + MargPercQRLabel.caption + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Manager').asString + '"';

    //rep Name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asString + '"';

    //On Hold
    tempStr := tempStr + ',"' + qryReport.fieldbyname('On_Hold').asString + '"';

    writeln(self.exportFile, tempStr);
    PBRSJobBagCompletefrm.prgbrExport.StepIt;
  end;
end;

function TPBRPJobBagCompleteFrm.GetProductType(tempProdType: integer; tempPO: real): string;
begin
  if tempPO <> 0 then
    begin
      with qryGetPOLine do
        begin
          close;
          parambyname('Purchase_Order').asfloat := tempPO;
          open;

          result := fieldbyname('Description').asstring;
        end;
    end
  else
    begin
      with qryGetProdType do
        begin
          close;
          parambyname('Product_Type').asinteger := tempProdType;
          open;

          result := fieldbyname('Description').asstring;
        end;
    end
end;

procedure TPBRPJobBagCompleteFrm.JobQRFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting and bSummary then
  begin
    tempStr := '"' + qryReport.fieldbyname('Job_Bag').asstring + '"';

    //job bag date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Point').asstring + '"';

    //start date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Start').asstring + '"';

    //delivery date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Goods_Required').asstring + '"';

    //customer name
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //customer account
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Code').asstring + '"';

    //Job Bag description
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Descr').asstring + '"';

    //Customer order no
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Cust_Order_No').asstring + '"';

    //Quantity
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Job_Bag_Quantity').asString + '"';

    //cost price
    tempStr := tempStr + ',"£' + qrlbljobcost.caption + '"';

    //selling price
    tempStr := tempStr + ',"£' + qrlbljobsales.caption + '"';

    //Margin
    tempStr := tempStr + ',"£' + qrlblMargin.caption + '"';

    //Margin %
    tempStr := tempStr + ',"' + qrlblMarginPerc.caption + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Account_Manager').asString + '"';

    //repName
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asString + '"';

    writeln(self.exportFile, tempStr);

    PBRSJobBagCompletefrm.prgbrExport.StepIt;
  end;

end;

procedure TPBRPJobBagCompleteFrm.FormCreate(Sender: TObject);
begin
  sAnalysis1 := dmBroker.GetAnalysisCode1;
  sAnalysis2 := dmBroker.GetAnalysisCode2;
end;

end.
