unit PBRPPORep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, DBTables, CCSPrint;

type
  TPBRPPORepFrm = class(TForm)
    PrintPOsQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    POsDataSource: TDataSource;
    DetailQRBand: TQRBand;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    DatesQRLabel: TQRLabel;
    SelSuppsQRLabel: TQRLabel;
    QRLabel9: TQRLabel;
    VF1QRDBText: TQRDBText;
    VF1and2QRLabel: TQRLabel;
    FooterQRBand: TQRBand;
    PageNoQRLabel: TQRLabel;
    QtyQRLabel: TQRLabel;
    QtyQRDBCalc: TQRExpr;
    SequenceQRLabel: TQRLabel;
    OrdDateQRDBText: TQRDBText;
    QRLabel1: TQRLabel;
    qrlblCostPriceLabel: TQRLabel;
    QRLabel4: TQRLabel;
    SequenceNameQRLabel: TQRLabel;
    SeqDescQRDBText: TQRDBText;
    SeqFootQRBand: TQRBand;
    SeqTotalDescQRLabel: TQRLabel;
    RepTotsQRBand: TQRBand;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    Seq2FootQRBand: TQRBand;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    Seq2TotalDescQRLabel: TQRLabel;
    SequenceName2QRLabel: TQRLabel;
    SeqDesc2QRDBText: TQRDBText;
    SeqQRGroup: TQRGroup;
    Seq2QRGroup: TQRGroup;
    RepTotsQRGroup: TQRGroup;
    TotalCostLbl: TQRLabel;
    TotalSellLbl: TQRLabel;
    SeqTotalCostLbl: TQRLabel;
    SeqTotalSellLbl: TQRLabel;
    ReportCostLbl: TQRLabel;
    ReportSellLbl: TQRLabel;
    Seq2TotalCostLbl: TQRLabel;
    Seq2TotalSellLbl: TQRLabel;
    VF3QRLabel: TQRLabel;
    VF3QRDBText: TQRDBText;
    CustQRLabel: TQRLabel;
    Seq3QRGroup: TQRGroup;
    SequenceName3QRLabel: TQRLabel;
    SeqDesc3QRLabel: TQRLabel;
    AddCostsQuery: TQuery;
    AddCostsDataSource: TDataSource;
    QRLabel3: TQRLabel;
    RunDateQRLabel: TQRLabel;
    ReportSelectionLbl: TQRLabel;
    QRShape7: TQRShape;
    OrderLbl: TQRLabel;
    AdditionalCostLbl: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlblSupplierLabel: TQRLabel;
    SupplierNamelbl: TQRDBText;
    TotalAddCostLbl: TQRLabel;
    TotalAddSellLbl: TQRLabel;
    AddChargesLbl: TQRLabel;
    procedure PrintPOsQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure DetailQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SeqFootQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SeqFootQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure RepTotsQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepTotsQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Seq2FootQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Seq2FootQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Seq3QRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    SeqName1, SeqName2: string;
    exporting: boolean;
    exportFile: textFile;
    procedure FixDataSet;
  public
    SupplierNo, BranchNo, CustomerNo, CustBranchNo, SeqNo, SeqNo2: Integer;
    Preview: ByteBool;
    AdditCosts : ByteBool;
    ExcludeCallOffs, ExcludeJobBags, ExcludeCosts: ByteBool;
    OnlyInvOnCallOff: ByteBool;
    bActive: ByteBool;
    SupplierName, CustomerName, SeqName: string;
    DateFrom, DateTo: TDate;
    IncludeFields: Byte;
    PrinterSettings: TPrinterSettings;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPPORepFrm: TPBRPPORepFrm;
  rGroup1Cost, rGroup1Sell, rReportCost, rReportSell,
  rGroup2Sell, rGroup2Cost:real;

implementation

uses PBRDPORep, PBImages, Printers, CCSCommon, PBRSPORep;

{$R *.DFM}

procedure TPBRPPORepFrm.PrintPOsQuickReportBeforePrint(Sender: TCustomQuickRep;
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
    SeqName1 := SeqName;
    SeqName2 := '';
    Seq2QRGroup.Enabled := False ;
    Seq2FootQrBand.Enabled := False;
    Seq3QRGroup.Enabled := False ;
  end
  else
  begin
    SeqName1 := Trim(Copy(SeqName, 1, TempPos - 2));
    SeqName2 := Trim(Copy(SeqName, TempPos + 2, 99));
    Seq2QRGroup.Enabled := True ;
    Seq2FootQrBand.Enabled := True;
  end;
  if SeqNo2 = 2 then
  begin
    Seq2QRGroup.Enabled := False ;
    Seq2FootQrBand.Enabled := False;
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
    CustQRLabel.Caption := 'For Customer ' + CustomerName;
  SequenceQRLabel.Caption := 'Sequenced By: ' + SeqName;
  SequenceNameQRLabel.Caption := Trim(SeqName1) + ':';
  SequenceName2QRLabel.Caption := Trim(SeqName2) + ':';
  SequenceName3QRLabel.Caption := Trim(SeqName2) + ':';
  SeqDescQRDBText.Left := SequenceNameQRLabel.Left + SequenceNameQRLabel.Width + 10;
  SeqDesc2QRDBText.Left := SequenceName2QRLabel.Left + SequenceName2QRLabel.Width + 10;
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

  {Decide whether to show Cost details}
  totalCostLbl.enabled := not ExcludeCosts;
  if AdditCosts then
    totalAddCostlbl.enabled := totalCostlbl.enabled;
  seq2totalCostlbl.enabled := totalCostlbl.enabled;
  seqtotalCostlbl.enabled := totalCostlbl.enabled;
  reportCostlbl.enabled := totalCostlbl.enabled;
  qrShape2.enabled := totalCostlbl.enabled;
  qrShape1.enabled := totalCostlbl.enabled;
  qrShape6.enabled := totalCostlbl.enabled;
  SupplierNamelbl.enabled := totalCostlbl.enabled;
  qrlblSupplierLabel.enabled := totalCostlbl.enabled;
  qrlblCostPricelabel.enabled := totalCostlbl.enabled;


  ReportselectionLbl.Caption := DatesQRLabel.Caption + ' ' + SequenceQRLabel.Caption + ', ' +
                                SelSuppsQRLabel.Caption + ', ' + CustQRLabel.Caption;
end;

function TPBRPPORepFrm.GetDetails(Sender: TObject): Integer;
var
  TempName: string;

begin
  {Setup the report, primary sequence} ;
  Case SeqNo of
       0:    SeqQRGroup.Expression := 'Prod_Type_Desc' ;
       1:    SeqQRGroup.Expression := 'Name'; {Supplier}
       2:    SeqQRGroup.Expression := 'Name'; {Customer}
       3:    SeqQRGroup.Expression := 'Name'; {Rep}
       4:    SeqQRGroup.Expression := 'Name'; {Operator}
       5:    SeqQRGroup.Expression := 'Cust_Type_Desc'; {Acc Type}
       6:    SeqQRGroup.Expression := 'Cust_Name';
       7:    SeqQRGroup.Expression := 'Name'; {Office Contact}
       end;
  Case SeqNo2 of
       0:    Seq2QRGroup.Expression := 'Purchase_Order' ;
       1:    Seq2QRGroup.Expression := 'Prod_Type_Desc' ;
       2:    Seq2QRGroup.Expression := 'Customers_Desc';
       end;
  SeqDescQRDBText.DataField := SeqQRGroup.Expression ;
  SeqDesc2QRDBText.DataField := Seq2QRGroup.Expression ;
  TempName := 'GetPOsSeq' + IntToStr(SeqNo) + IntToStr(SeqNo2)+ 'SQL';
  POsDataSource.DataSet := (PBRDPORepDataMod.FindComponent(TempName) as TQuery);
  PrintPOsQuickReport.DataSet := POsDataSource.DataSet;
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

procedure TPBRPPORepFrm.FooterQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  PageNoQRLabel.Caption := 'Page: ' + IntToStr(PrintPOsQuickReport.PageNumber);
end;

procedure TPBRPPORepFrm.FixDataSet;
var
  i : integer;
begin
  for i := 0 to Pred(ComponentCount) do
    if Components[i] is TQRDBText then
      TQRDBText(Components[i]).DataSet := PrintPOsQuickReport.DataSet;
end;

procedure TPBRPPORepFrm.DetailQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotalCost, rTotalSell:real;
  raddcost, raddSell: real;
  tempstr: string;
begin
  with POsDataSource.DataSet do
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
    end;

    If AdditCosts then
        begin
        AddChargesLbl.enabled := true;
        if not ExcludeCosts then
          TotalAddCostLbl.enabled := true;
        TotalAddSellLbl.enabled := true;
        with AddCostsQuery do
          begin
          Close;
          ParamByName('PurchOrder').AsFloat := POsDataSource.DataSet.FieldByName('Purchase_Order').AsFloat;
          ParamByName('Purch_OrdLine').AsInteger := POsDataSource.DataSet.FieldByName('Line').AsInteger;
          open;
          rAddCost := fieldByName('Add_cost').AsFloat;
          rAddSell := FieldByName('Add_Price').AsFloat;
       end;
     end;

  TotalCostLbl.Caption := formatfloat('0.00',rTotalCost);
  TotalSellLbl.Caption := formatfloat('0.00',rTotalSell);

  TotalAddCostLbl.Caption := formatfloat('0.00',rAddCost);
  TotalAddSellLbl.Caption := formatfloat('0.00',rAddSell);

  rTotalCost := rTotalCost + rAddcost;
  rTotalSell := rTotalSell + rAddsell;

  {Total Group Cost and Sell Values}
  rGroup1Cost := rGroup1Cost + rTotalCost;
  rGroup1Sell := rGroup1Sell + rTotalSell;
  rGroup2Cost:= rGroup2Cost + rTotalCost;
  rGroup2Sell:= rGroup2Sell + rTotalSell;

  if self.exporting then
  begin
    if ExcludeCosts then
      begin
        tempStr := '"' + POsDataSource.DataSet.FieldByName('Purchase_order').asString + '"';
        tempStr := tempStr+ ',"' + pbdatestr(POsDataSource.DataSet.FieldByName('Date_Point').asdatetime) + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Cust_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Contact_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Customers_Desc').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Prod_Type_Desc').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Cust_Order_No').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Quantity').asstring + '"';
        tempStr := tempStr+ ',"' + TotalSellLbl.caption + '"';
        tempStr := tempStr+ ',"' + TotalAddSellLbl.caption + '"';
        tempStr := tempStr+ ',"' + pbdatestr(POsDataSource.DataSet.FieldByName('Goods_Required').asdatetime) + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Rep_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Operator_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Account_Manager_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Job_Bag').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Purch_stat_Desc').asstring + '"';
      end
    else
      begin
        tempStr := '"' + POsDataSource.DataSet.FieldByName('Purchase_order').asString + '"';
        tempStr := tempStr+ ',"' + pbdatestr(POsDataSource.DataSet.FieldByName('Date_Point').asdatetime) + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Cust_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Contact_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Customers_Desc').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Prod_Type_Desc').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Cust_Order_No').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Quantity').asstring + '"';
        tempStr := tempStr+ ',"' + TotalCostLbl.caption + '"';
        tempStr := tempStr+ ',"' + TotalSellLbl.caption + '"';
        tempStr := tempStr+ ',"' + TotalAddCostLbl.caption + '"';
        tempStr := tempStr+ ',"' + TotalAddSellLbl.caption + '"';
        tempStr := tempStr+ ',"' + pbdatestr(POsDataSource.DataSet.FieldByName('Goods_Required').asdatetime) + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Supplier_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Rep_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Operator_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Account_Manager_Name').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Job_Bag').asstring + '"';
        tempStr := tempStr+ ',"' + POsDataSource.DataSet.fieldbyname('Purch_stat_Desc').asstring + '"';
      end;

    writeln(self.exportFile, tempStr);
    PBRSPORepFrm.prgbrExport.StepIt;
  end;
end;


procedure TPBRPPORepFrm.SeqFootQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   SeqTotalCostLbl.Caption := formatfloat('0.00',rGroup1Cost);
   SeqTotalSellLbl.Caption := formatfloat('0.00',rGroup1Sell);

   rReportCost := rReportCost + rGroup1Cost;
   rReportSell := rReportSell + rGroup1Sell;
end;

procedure TPBRPPORepFrm.SeqFootQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   rGroup1Cost := 0;
   rGroup1Sell := 0;
end;

procedure TPBRPPORepFrm.RepTotsQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ReportCostLbl.Caption := FormatFloat('0.00', rReportCost);
  ReportSellLbl.Caption := FormatFloat('0.00',rReportSell);
end;

procedure TPBRPPORepFrm.RepTotsQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rReportCost := 0;
  rReportSell := 0;
end;

procedure TPBRPPORepFrm.Seq2FootQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Seq2TotalCostLbl.Caption := formatfloat('0.00',rGroup2Cost);
   Seq2TotalSellLbl.Caption := formatfloat('0.00',rGroup2Sell);
 end;

procedure TPBRPPORepFrm.Seq2FootQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rGroup2Cost := 0;
  rGroup2Sell := 0;
end;

procedure TPBRPPORepFrm.Seq3QRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with PBRDPORepDataMod.FormRefSQl do
    begin
      close;
      parambyname('Form_Reference').asinteger := POsDataSource.DataSet.fieldbyname('Form_Reference').asinteger;
      open;
      first;
      if recordcount < 1 then
        SeqDesc3QRLabel.caption := POsDataSource.DataSet.fieldbyname('Customers_Desc').asstring
      else
        SeqDesc3QRLabel.caption := POsDataSource.DataSet.fieldbyname('Customers_Desc').asstring
                            + ' - ' + fieldbyname('Form_Reference_ID').asstring;
    end;
end;

procedure TPBRPPORepFrm.ExportToFile(fileName: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if ExcludeCosts then
    tempStr := '"PO Number"'
              + ',"Date"'
              + ',"Customer"'
              + ',"Customer Contact"'
              + ',"Description"'
              + ',"Product Type"'
              + ',"Order Reference"'
              + ',"Quantity"'
              + ',"Total Sell"'
              + ',"Additional Sell"'
              + ',"Date Required"'
              + ',"Rep"'
              + ',"Operator"'
              + ',"Account Manager"'
              + ',"Job Bag"'
              + ',"Status"'
  else
    tempStr := '"PO Number"'
              + ',"Date"'
              + ',"Customer"'
              + ',"Customer Contact"'
              + ',"Description"'
              + ',"Product Type"'
              + ',"Order Reference"'
              + ',"Quantity"'
              + ',"Total Cost"'
              + ',"Total Sell"'
              + ',"Additional Cost"'
              + ',"Additional Sell"'
              + ',"Date Required"'
              + ',"Supplier"'
              + ',"Rep"'
              + ',"Operator"'
              + ',"Account Manager"'
              + ',"Job Bag"'
              + ',"Status"';

  writeLn(self.exportFile, tempStr);

  TempName := 'GetPOsSeq' + IntToStr(SeqNo) + IntToStr(SeqNo2)+ 'SQL';
  POsDataSource.DataSet := (PBRDPORepDataMod.FindComponent(TempName) as TQuery);
  PrintPOsQuickReport.DataSet := POsDataSource.DataSet;

  PrintPOsQuickReport.Prepare;

  CloseFile(self.exportFile);
end;

end.

