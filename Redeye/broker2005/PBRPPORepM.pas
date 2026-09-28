unit PBRPPORepM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    AddCostsQuery: TFDQuery;
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
  PrintPOsQuickReport.DataSet := (PBRDPORepDataMod.FindComponent(TempName) as TFDQuery);
  FixDataSet;
  {Activate the main report query}
  with (PBRDPORepDataMod.FindComponent(TempName) as TFDQuery) do
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













