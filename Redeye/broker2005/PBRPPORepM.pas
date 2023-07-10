(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
A description of the unit here

VSS Info:
$Header: /PBL D5/PBRPPORepM.pas 13    9/09/:3 14:46 Janiner $
$History: PBRPPORepM.pas $
 * 
 * *****************  Version 13  *****************
 * User: Janiner      Date: 9/09/:3    Time: 14:46
 * Updated in $/PBL D5
 * Allow the facility to show only cancelled orders if required.
 * 
 * *****************  Version 12  *****************
 * User: Paul         Date: 28/02/:3   Time: 11:22
 * Updated in $/PBL D5
 * Printersettings.OutputBin is set based on user selection
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 27/03/:2   Time: 11:18
 * Updated in $/PBL D5
 * Changed to allow the excluding of Call Offs from the reports, had to
 * create constants and change the queries.
 * 
 * *****************  Version 10  *****************
 * User: Janiner      Date: 2/08/:1    Time: 11:17
 * Updated in $/PBL D5
 * take out supplier group header, even if it is disabled, it is still
 * causing a change of group detail.
 * This is confusing when running account type product type as the groups
 * have changed, but the user is unaware of the supplier grouping.
 * 
 * *****************  Version 9  *****************
 * User: Janiner      Date: 1/08/:1    Time: 14:56
 * Updated in $/PBL D5
 * New routine to allow printing of all customer records if all customer
 * branches if customer radio button selected, or subtotal of branches for
 * selected customer, if Customer branch is selected.
 * 
 * *****************  Version 8  *****************
 * User: Janiner      Date: 13/06/:1   Time: 15:54
 * Updated in $/PBL D5
 * Incorporate new functionailty for formatting the purchase order number.
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 2/05/:1    Time: 13:00
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 8/02/:1    Time: 16:29
 * Updated in $/PBL D5
 * Add option to include additional charges to reports.  default is no.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 13/12/:0   Time: 14:38
 * Updated in $/PBL D5
 * Changed to provide extra sort funtionality
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 17/10/:0   Time: 12:55
 * Updated in $/PBL D5
 * Amend options heading to show possible selection of a customer, in
 * addition to supplier.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 5/07/:0    Time: 17:01
 * Branched in $/PBL D5
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 16/03/:0   Time: 15:44
 * Updated in $/PBL D5/Quick Reports/BroadSword
 * Improve format of report allow more space for purchase order number etc
 * and line columns up.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 9/03/:0    Time: 10:01
 * Created in $/PBL D5/QuickReports/Forms Technology
 * Move the Quick Report units from the main project path into a
 * sub-project so we can customise the reports for customers.
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 8/03/:0    Time: 14:43
 * Updated in $/PBL D5
 * Problem with report totals if have more than one sub total , now ok.
 * Ensure SQL's do not go to enquiry file i.e. make all radio button
 * options report the same data in different sequences.
 * 
 * *****************  Version 6  *****************
 * User: Debbies      Date: 7/01/:0    Time: 16:01
 * Updated in $/PBL D5
 * Sort Total/Margin problems & general redesign
 * 
 * *****************  Version 5  *****************
 * User: Debbies      Date: 17/12/99   Time: 11:43
 * Updated in $/PBL D5
 * Delete List Value & fix Margin Value.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:17
 * Updated in $/PBL D5
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 * 
 * *****************  Version 3  *****************
 * User: Debbies      Date: 14/12/99   Time: 13:23
 * Updated in $/PBL D5
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 9/12/99    Time: 16:30
 * Updated in $/PBL D5
 * QuickReport conversions.  Get rid of semicolons after comments.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBRPPORepM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, DBTables, CCSPrint;

type
  TPBRPPORepMFrm = class(TForm)
    PrintPOsQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    DatesQRLabel: TQRLabel;
    SelSuppsQRLabel: TQRLabel;
    FooterQRBand: TQRBand;
    PageNoQRLabel: TQRLabel;
    SequenceQRLabel: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    SequenceNameQRLabel: TQRLabel;
    SeqDescQRDBText: TQRDBText;
    SeqFootQRBand: TQRBand;
    SeqTotalDescQRLabel: TQRLabel;
    Seq2FootQRBand: TQRBand;
    ST2MargPercQRLabel: TQRLabel;
    MarginQRLabel: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    STMarginQRLabel: TQRLabel;
    STMargPercQRLabel: TQRLabel;
    RepTotsQRBand: TQRBand;
    QRLabel11: TQRLabel;
    RTMarginQRLabel: TQRLabel;
    RTMargPercQRLabel: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    SeqQRGroup: TQRGroup;
    Seq2QRGroup: TQRGroup;
    RepTotsQRGroup: TQRGroup;
    QRBand1: TQRBand;
    ReportCostLbl: TQRLabel;
    ReportSellLbl: TQRLabel;
    SeqTotalCostLbl: TQRLabel;
    SeqTotalSellLbl: TQRLabel;
    Seq2TotalCostLbl: TQRLabel;
    Seq2TotalSellLbl: TQRLabel;
    TotalCostLbl: TQRLabel;
    TotalSellLbl: TQRLabel;
    QuantityLbl: TQRLabel;
    POrderLbl: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBQuantityText1: TQRDBText;
    MarginQRBLabel: TQRLabel;
    QRBMargPercQRLabel: TQRLabel;
    QRShape8: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape11: TQRShape;
    Seq2TotalDescQRLabel: TQRLabel;
    SequenceName2QRLabel: TQRLabel;
    SeqDesc2QRDBText: TQRDBText;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    CustQRLabel: TQRLabel;
    Seq3QRGroup: TQRGroup;
    SequenceName3QRLabel: TQRLabel;
    SeqDesc3QRLabel: TQRLabel;
    AddCostsDataSource: TDataSource;
    AddCostsQuery: TQuery;
    QRLabel3: TQRLabel;
    RunDateQRLabel: TQRLabel;
    ReportSelectionLbl: TQRLabel;
    AdditionalCostLbl: TQRLabel;
    QRShape1: TQRShape;
    OrderLbl: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    TotalAddCostLbl: TQRLabel;
    TotalAddSellLbl: TQRLabel;
    AddChargesLbl: TQRLabel;
    AddMarg: TQRLabel;
    AddPerc: TQRLabel;
    procedure PrintPOsQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure Seq2FootQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure SeqFootQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure RepTotsQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SeqFootQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure RepTotsQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Seq2FootQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Seq3QRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
    SeqName1, SeqName2: string;
    rGroup1Cost, rGroup1Sell, rReportCost, rReportSell,
    rGroup2Sell, rGroup2Cost, rTotalSell, rTotalCost,
    TempMargin:Real;
    procedure FixDataset;
  public
    SupplierNo, BranchNo, CustomerNo, CustBranchNo, SeqNo, SeqNo2: Integer;
    Preview: ByteBool;
    AdditCosts : ByteBool;
    ExcludeCallOffs, ExcludeJobBags: ByteBool;
    OnlyInvOnCallOff: ByteBool;
    bActive: ByteBool;
    SupplierName, CustomerName, SeqName: string;
    DateFrom, DateTo: TDate;
    PrinterSettings : TPrinterSettings;
  end;

var
  PBRPPORepMFrm: TPBRPPORepMFrm;

implementation

uses PBRDPORep, PBImages, CCSCommon;

{$R *.DFM}

procedure TPBRPPORepMFrm.PrintPOsQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  TempPos: Integer;
begin
  with PrintPOsQuickReport.PrinterSettings do
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

  RunDateQRLabel.Caption := '- Run Date: ' + DateToStr(Now);

  Seq3QRGroup.Enabled := False ;
  {Split the sequence name into 1 and 2}
  TempPos := Pos('+', SeqName);
  if TempPos = 0 then
  begin
    SeqName2 := SeqName;
    SeqName1 := '';
    SeqQRGroup.Enabled := False ;
    SeqFootQrBand.Enabled := False;
    Seq3QRGroup.Enabled := False ;
  end
  else
  begin
    SeqName2 := Trim(Copy(SeqName, 1, TempPos - 2));
    SeqName1 := Trim(Copy(SeqName, TempPos + 2, 99));
    SeqQRGroup.Enabled := True ;
    SeqFootQrBand.Enabled := True;
  end;

  if SeqNo2 = 2 then
  begin
    SeqQRGroup.Enabled := False ;
    SeqFootQrBand.Enabled := False;
    Seq3QRGroup.Enabled := True ;
  end;

  DatesQRLabel.Caption := 'Dated Between: ' + DateToStr(DateFrom) + ' and ' +
    DateToStr(DateTo);
  if SupplierNo = 0 then
    SelSuppsQRLabel.Caption := 'All Suppliers'
  else
    SelSuppsQRLabel.Caption := 'For Supplier/Branch: ' + SupplierName;
  if CustomerNo = 0 then
    CustQRLabel.Caption := 'All Customers'
  else
    CustQRLabel.Caption := 'For Customer: ' + CustomerName;
  SequenceQRLabel.Caption := 'Sequenced By: ' + SeqName;
  SequenceNameQRLabel.Caption := Trim(SeqName1) + ':';
  SequenceName2QRLabel.Caption := Trim(SeqName2);
  SequenceName3QRLabel.Caption := Trim(SeqName1) + ':';
  SeqDescQRDBText.Left := SequenceNameQRLabel.Left + SequenceNameQRLabel.Width + 10;
  SeqDesc3QRLabel.Left := SequenceName3QRLabel.Left + SequenceName3QRLabel.Width + 10;
  SeqTotalDescQrLabel.Caption := Trim(SeqName1) + ' Totals:';
  Seq2TotalDescQrLabel.Caption := Trim(SeqName2) + ' Totals:';
  if AdditCosts then
    begin
      AdditionalCostLbl.Caption := 'ADDITIONAL CHARGES INCLUDED';
      if not bActive then
        AdditionalCostLbl.Caption := 'ADDITIONAL CHARGES INCLUDED (Cancelled Orders Only)';
    end
  else
    begin
      AdditionalCostLbl.Caption := 'ADDITIONAL CHARGES EXCLUDED';
      if not bActive then
        AdditionalCostLbl.Caption := 'ADDITIONAL CHARGES EXCLUDED (Cancelled Orders Only) ';
    end;

  ReportselectionLbl.Caption := DatesQRLabel.Caption + ' ' + SequenceQRLabel.Caption + ', ' +
                                SelSuppsQRLabel.Caption + ', ' + CustQRLabel.Caption;
end;

function TPBRPPORepMFrm.GetDetails(Sender: TObject): Integer;
var
  TempName: string;
begin
  {Setup the report, primary sequence}
  Case SeqNo of
       0:    Seq2QRGroup.Expression := 'Prod_Type_Desc' ;
       1:    Seq2QRGroup.Expression := 'Name'; {Supplier}
       2:    Seq2QRGroup.Expression := 'Name'; {Customer}
       3:    Seq2QRGroup.Expression := 'Name'; {Rep}
       4:    Seq2QRGroup.Expression := 'Name'; {Estimator}
       5:    Seq2QRGroup.Expression := 'Cust_Type_Desc'; {Acc Type}
       6:    Seq2QRGroup.Expression := 'Cust_Name';{customer branch}
  end;
  Case SeqNo2 of
       0:    SeqQRGroup.Expression := 'Purchase_Order' ;
       1:    SeqQRGroup.Expression := 'Prod_Type_Desc' ;
       2:    SeqQRGroup.Expression := 'Customers_Desc';
       end;
  SeqDescQRDBText.Datafield := SeqQRGroup.Expression ;
  SeqDesc2QRDBText.Datafield := Seq2QRGroup.Expression ;
  TempName := 'GetPOsSeq' + IntToStr(SeqNo)+ IntToStr(SeqNo2) + 'SQL';
  PrintPOsQuickReport.DataSet := (PBRDPORepDataMod.FindComponent(TempName) as TQuery);
  FixDataSet;
  {Activate the main report query}
  with (PBRDPORepDataMod.FindComponent(TempName) as TQuery) do
  begin
    SQL.text := SQL.text + PBRDPORepDataMod.GetCriteria(ExcludeCallOffs);
    SQL.text := SQL.text + PBRDPORepDataMod.GetJobBags(ExcludeJobBags);
    SQL.Text := SQL.text + PBRDPORepDataMod.GetActive(bActive);
    SQL.Text := SQL.text + PBRDPORepDataMod.GetInvoiceOnCallOff(OnlyInvOnCallOff);
    SQL.text := SQL.text + PBRDPORepDataMod.GetOrderBy(SeqNo, SeqNo2);
    Close;
    ParamByName('Supplier').AsInteger := SupplierNo;
    ParamByName('Branch_No').AsInteger := BranchNo;
    ParamByName('Customer').AsInteger := CustomerNo;
    ParamByName('Cust_Branch_No').AsInteger := CustBranchNo;
    ParamByName('Date_From').AsDateTime := DateFrom;
    ParamByName('Date_To').AsDateTime := DateTo;
    Open;
    Result := RecordCount;
  end;
end;

procedure TPBRPPORepMFrm.FooterQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  PageNoQRLabel.Caption := 'Page: ' + IntToStr(PrintPOsQuickReport.PageNumber);
end;


procedure TPBRPPORepMFrm.Seq2FootQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  TempMargin: Real;
begin
  Seq2TotalCostLbl.Caption := formatfloat('0.00',rGroup2Cost);
  Seq2TotalSellLbl.Caption := formatfloat('0.00',rGroup2Sell);
   rReportCost := rReportCost + rGroup2Cost;
   rReportSell := rReportSell + rGroup2Sell;

   {Calculate the margin %Age}
  TempMargin := rGroup2Sell - rGroup2Cost ;
  MarginQRLabel.Caption := FormatFloat('######0.00', TempMargin);
  if rGroup2Sell = 0 then
    ST2MargPercQRLabel.Caption := ''
  else
    ST2MargPercQRLabel.Caption := FormatFloat('###0.00', (TempMargin /
     rGroup2Sell) * 100.00);
end;

procedure TPBRPPORepMFrm.Seq2FootQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rGroup2Cost := 0;
  rGroup2Sell := 0;
end;

procedure TPBRPPORepMFrm.SeqFootQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
   SeqTotalCostLbl.Caption := formatfloat('0.00',rGroup1Cost);
   SeqTotalSellLbl.Caption := formatfloat('0.00',rGroup1Sell);

   {Calculate the margin %Age}

  TempMargin := rTotalSell - rTotalCost;
  STMarginQRLabel.Caption := FormatFloat('######0.00', TempMargin);
  if rTotalSell = 0 then
    RTMargPercQRLabel.Caption := ''
  else
    STMargPercQRLabel.Caption := FormatFloat('###0.00', (TempMargin /
      rTotalSell) * 100.00);
end;

procedure TPBRPPORepMFrm.SeqFootQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rGroup1Cost := 0;
  rGroup1Sell := 0;
end;


procedure TPBRPPORepMFrm.RepTotsQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  ReportCostLbl.Caption := FormatFloat('0.00', rReportCost);
  ReportSellLbl.Caption := FormatFloat('0.00',rReportSell);
  {Calculate the margin %Age}
  TempMargin  := rReportSell - rReportCost;
  RTMarginQRLabel.Caption := FormatFloat('######0.00', TempMargin);
  if rReportSell = 0 then
    RTMargPercQRLabel.Caption := ''
  else
    RTMargPercQRLabel.Caption := FormatFloat('###0.00', (TempMargin /
      rReportSell) * 100.00);
end;

procedure TPBRPPORepMFrm.RepTotsQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rReportCost := 0;
  rReportSell := 0;
end;


procedure TPBRPPORepMFrm.FixDataset;
var
  i : integer;
begin
  for i := 0 to Pred(ComponentCount) do
    if Components[i] is TQRDBText then
      TQRDBText(Components[i]).DataSet := PrintPOsQuickReport.DataSet;
end;

procedure TPBRPPORepMFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 raddcost, raddSell: real;
 begin
    with PrintPOsQuickReport.DataSet do
    begin
      OrderLbl.caption := PBFormatPONum(fieldbyname('Purchase_Order').asFloat,fieldbyname('Line').asinteger);
      raddCost := 0;
      rAddSell := 0;
      if FieldByName('Order_Unit_Factor').asfloat <> 0 then
        rTotalCost := (FieldByName('Quantity').asfloat / FieldByName('Order_Unit_Factor').asfloat)
                      * FieldByName('Order_Price').asfloat
      else
        rTotalCost := FieldByName('Order_Price').asfloat ;


     if FieldByName('Sell_Unit_Factor').asfloat <> 0 then
        rTotalSell := (FieldByName('Quantity').asfloat / FieldByName('Sell_Unit_Factor').asfloat)
                      * FieldByName('Selling_Price').asfloat
      else
        rTotalSell := FieldByName('Selling_Price').asfloat ;

      If AdditCosts then
        begin
        AddChargesLbl.enabled := true;
        TotalAddCostLbl.enabled := true;
        TotalAddSellLbl.enabled := true;
        AddMarg.enabled := true;
        AddPerc.enabled := true;
        with AddCostsQuery do
          begin
          Close;
          ParamByName('PurchOrder').AsFloat := PrintPOsQuickReport.DataSet.FieldByName('Purchase_Order').AsFloat;
          ParamByName('Purch_OrdLine').AsInteger := PrintPOsQuickReport.DataSet.FieldByName('Line').AsInteger;
          open;
          rAddCost := fieldByName('Add_cost').AsFloat;
          rAddSell := FieldByName('Add_Price').AsFloat;

          {Calculate the Additional Charges margin %Age}
          TempMargin := rAddSell - rAddCost ;
          AddMarg.Caption := FormatFloat('######0.00', TempMargin);
          if rAddSell = 0 then
            AddPerc.Caption := ''
          else
            AddPerc.Caption := FormatFloat('###0.00', (TempMargin /
              rAddSell) * 100.00);
          end;
        end;
  TotalCostLbl.Caption := formatfloat('0.00',rTotalCost);
  TotalSellLbl.Caption := formatfloat('0.00',rTotalSell);

  TotalAddCostLbl.Caption := formatfloat('0.00',rAddCost);
  TotalAddSellLbl.Caption := formatfloat('0.00',rAddSell);

  {Calculate the margin %Age}
  TempMargin := rTotalSell - rTotalCost ;
  MarginQRBLabel.Caption := FormatFloat('######0.00', TempMargin);
  if rTotalSell = 0 then
    QRBMargPercQRLabel.Caption := ''
  else
    QRBMargPercQRLabel.Caption := FormatFloat('###0.00', (TempMargin /
     rTotalSell) * 100.00);

  rTotalCost := rTotalCost + rAddcost;
  rTotalSell := rTotalSell + rAddsell;

  {Total Group Cost and Sell Values}
  rGroup1Cost := rGroup1Cost + rTotalCost;
  rGroup1Sell := rGroup1Sell + rTotalSell;
  rGroup2Cost := rGroup2Cost + rTotalCost;
  rGroup2Sell := rGroup2Sell + rTotalSell;

 end;
end;

procedure TPBRPPORepMFrm.Seq3QRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    with PBRDPORepDataMod.FormRefSQl do
    begin
      close;
      parambyname('Form_Reference').asinteger := PrintPOsQuickReport.DataSet.fieldbyname('Form_Reference').asinteger;
      open;
      first;
      if recordcount < 1 then
        SeqDesc3QRLabel.caption := PrintPOsQuickReport.DataSet.fieldbyname('Customers_Desc').asstring
      else
        SeqDesc3QRLabel.caption := PrintPOsQuickReport.DataSet.fieldbyname('Customers_Desc').asstring
                            + ' - ' + fieldbyname('Form_Reference_ID').asstring;
    end;
end;

end.













