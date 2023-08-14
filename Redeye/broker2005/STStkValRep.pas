unit STStkValRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QuickRpt, Qrctrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTStkValRepFrm = class(TForm)
    StkValQuickReport: TQuickRep;
    QRBand: TQRBand;
    QRGroup1: TQRGroup;
    GrpFootQRBand: TQRBand;
    TitleQRLabel: TQRLabel;
    Group1TotalQRLabel: TQRLabel;
    Seq2QRDBText: TQRDBText;
    DescQRDBText: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    GetStoreStkDataSource: TDataSource;
    GetStoreStkQuery: TFDQuery;
    GetCountStkQuery: TFDQuery;
    GetDetsQuery: TFDQuery;
    TotCostQRLabel: TQRLabel;
    SeqByQRLabel: TQRLabel;
    NameQRLabel: TQRLabel;
    StockQtyQRLabel: TQRLabel;
    ValueQRLabel: TQRLabel;
    AVCstQRLbl: TQRLabel;
    CstQRLbl: TQRLabel;
    QRlblPck: TQRLabel;
    QRLblInUse: TQRLabel;
    DateQRLabel: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblRange: TQRLabel;
    QRLblCust: TQRLabel;
    QRDBTxtCust: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRShape2: TQRShape;
    QRDBText3: TQRDBText;
    qrlblPaid: TQRLabel;
    rbSummary: TQRBand;
    qrlblGrandTotalValue: TQRLabel;
    QRLabel10: TQRLabel;
    QRMemoRepName: TQRMemo;
    GetTopRepSQL: TFDQuery;
    QRGroup2: TQRGroup;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel9: TQRLabel;
    LatCostQRLabel: TQRLabel;
    BinQRLabel: TQRLabel;
    LotQRLabel: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLblTotBinCst: TQRLabel;
    QRShape3: TQRShape;
    qrlblStockTakeRef: TQRLabel;
    qryGetPOs: TFDQuery;
    qryGetPurchOrds: TFDQuery;
  function GetDetails(Sender: TObject): Integer;
  procedure StkValQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure rbSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    fTotalCost: Real;
    gtValue: real;
    BinValue : real;
    function GetPOHistory(tempPart: string): string;
    { Private declarations }
  public
    ByStore, AtActual,bIs_Stocktake, ByBin: ByteBool;
    PartFrom, PartTo, PaidFor, selFrmBin, selToBin: string;
    bexcProd: Bytebool;
    RepNo, CustNo, CustBranchNo, selstore: Integer;
    RepName, CustomerName: string;
    procedure ExportToFile(fileName: string);
  end;

var
  STStkValRepFrm: TSTStkValRepFrm;

implementation

uses STStkValSl, CCSCommon, STRSStkVal;

{$R *.DFM}

{ TForm1 }
var
  rTotal: real;

function TSTStkValRepFrm.GetDetails(Sender: TObject): Integer;
begin
  QRLabel1.enabled := not bExcProd;
//  QRLabel7.enabled := not bExcProd;
//  QRLabel6.enabled := not bExcProd;
  If qrGroup2.enabled then
    begin
      qrSubDetail1.linkband := QRBand2;
      QRBand2.enabled := true;
    end
  else
      QRGroup1.linkBand := QRSubdetail1;
  if bIs_Stocktake = False then
    begin
      GetDetsQuery.SQL := GetStoreStkQuery.SQL;
      QRDBTxtCust.enabled := True;
      QRMemoRepName.enabled := True;
    end
  else
    begin
      GetDetsQuery.SQL := GetCountStkQuery.SQL;
      QRDBTxtCust.Enabled := True;
      QRDBTxtCust.DataField := 'Part_Description';
      DescQRDBText.Enabled := False;
      QRLabel3.Enabled := false;
      QRLabel4.enabled := False;
      QRLabel8.caption := 'Description';
    end;

  if bIs_Stocktake then
    begin
      QRLabel1.enabled := False;
      QRLabel7.enabled := False;
      QRLabel6.enabled := False;
    end;
  with GetDetsQuery do
  begin
    Close;
    if ByStore = true then
      begin
        If bIs_Stocktake then
        begin
         sql.add('AND (Stock_Take.Part >= ''' + PartFrom + ''') AND (Stock_Take.Part <= ''' + PartTo + ''')');
         sql.add('AND (Stock_Take.Stock_Take_Ref = ''' + STStkValSlFrm.StockTakeRef +''')');
         sql.add('order by part_store.Part_store_name,Stock_Take.Part,Stock_Take.Part_Bin')
        end
      else
        begin
         sql.add('AND (Store_Stock.Part >= ''' + PartFrom + ''') AND (Store_Stock.Part <= ''' + PartTo + ''')');
         if selstore <> 0 then
            sql.add('and part_store.part_store = '+inttostr(selstore));
         if selFrmBin <> '' then
            sql.add('and (store_stock.part_bin >= ''' + selFrmbin +''')');
         if selToBin <> '' then
            sql.add('and (store_stock.part_bin <= ''' + selToBin +''')');
         if bExcProd then
            sql.add('and (part.not_in_use <> ''Y'')');
         If paidfor = 'P' then
            sql.add('and (store_stock.Invoice_Upfront = ''Y'')');
         if paidfor = 'U' then
            sql.add('and (store_stock.Invoice_Upfront <> ''Y'')');
         if ByBin then
           sql.add('order by part_store.Part_store_name,Store_Stock.Part_Bin,Store_Stock.Part')
         else
            sql.add('order by part_store.Part_store_name,Store_Stock.Part,Store_Stock.Part_Bin');
        end
      end
    else
      begin
        If bIs_Stocktake then
        begin
         sql.add('AND (Stock_Take.Part >= ''' + PartFrom + ''') AND (Stock_Take.Part <= ''' + PartTo + ''')');
         sql.add('AND (Stock_Take.Stock_Take_Ref = ''' + STStkValSlFrm.StockTakeRef +''')');
         sql.add('order by Stock_Take.Part,part_store.Part_store_name,Stock_Take.Part_Bin')
        end
      else
        begin
         sql.add('AND (Store_Stock.Part >= ''' + PartFrom + ''') AND (Store_Stock.Part <= ''' + PartTo + ''')');
         if bExcProd then
           sql.add('and (part.not_in_use <> ''Y'')');
         if selstore <> 0 then
            sql.add('and part_store.part_store = '+inttostr(selstore));
         if selFrmBin <> '' then
            sql.add('and (store_stock.part_bin >= ''' + selFrmbin +''')');
         if selToBin <> '' then
            sql.add('and (store_stock.part_bin <= ''' + selToBin + ''')');
         sql.add('order by Store_Stock.Part,part_store.Part_store_name,Store_Stock.Part_Bin') ;
         end
      end;
    If not bIs_Stocktake then
    begin
      ParamByName('Customer').AsInteger := CustNo;
//      ParamByName('CustBranch').AsInteger := CustBranchNo;
//      ParamByName('Rep').AsInteger := RepNo;
    end;
    Open;
    Result := RecordCount;
  end;
end;

procedure TSTStkValRepFrm.StkValQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
//  LogoQRImage.Picture := STImagesFrm.ReportImage.Picture;
  self.gtValue := 0.00;
  rTotal := 0.00;
  if bIs_Stocktake then
    TitleQRLabel.Caption :='Stocktake Valuation Report'
  else
    TitleQRLabel.Caption :='Stock Valuation Report';

  DateQRLabel.Caption := 'Run Date: ' + DateTimeToStr(Now);

  if AtActual then
    ValueQRLabel.Caption := 'Valued at Actual Cost'
  else
    ValueQRLabel.Caption := 'Valued at Current Cost';

  if ByStore then
    begin
      Seq2QRDBText.DataSet := GetDetsQuery;
      Seq2QRDBText.DataField := 'Part';
      DescQRDBText.DataSet := GetDetsQuery;
      DescQRDBText.DataField := 'Part_Description';
      QRGroup1.Expression := 'GetDetsQuery.Part_Store_Name';
      TitleQRLabel.Caption := TitleQRLabel.Caption+' By Store.';
    end
  else
    begin
      QRLabel2.Caption := 'Store';
      SeqByQRLabel.Caption := 'Part';
      Seq2QRDBText.DataSet := GetDetsQuery;
      Seq2QRDBText.DataField := 'Store';
      Seq2QRDBText.Datafield := 'Part_Store_Name';
      DescQRDBText.DataSet := GetDetsQuery;
      DescQRDBText.DataField := 'Part_Store_Name';
      DescQRDBText.enabled := false;
      QRGroup1.Expression := 'GetDetsQuery.Part';
      QRGroup1.ForceNewPage := False;
      TitleQRLabel.Caption := TitleQRLabel.Caption+' By Product.';
    end;
  if bIs_Stocktake then
    qrlblStocktakeRef.Caption := 'Stock Count Ref: '+STStkValSlFrm.StockTakeRef
  else
    qrlblStocktakeRef.Caption := '';
end;

procedure TSTStkValRepFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
(* if AtActual then
         ftotalCost := fTotalCost +  StrToFloatDef(formatfloat('######0.00', GetDetsQuery.fieldbyname('Store_Cost').asFloat))
  else
          ftotalCost := fTotalCost +  StrToFloatDef(formatfloat('######0.00', GetDetsQuery.FieldByName('Part_Purchase_Price').AsFloat* GetDetsQuery.FieldByName('Store_Quantity').AsInteger / GetDetsQuery.FieldByName('Stock_Pack_Quantity').AsInteger));
*)
end;

procedure TSTStkValRepFrm.GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  fTotalCost := 0.00;
  rTotal := 0.00
end;

procedure TSTStkValRepFrm.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if ByStore = true then
    NameQrLabel.Caption := GetDetsQuery.fieldByName('part_Store_Name').asString
  else
    NameQrLabel.Caption := GetDetsQuery.fieldbyname('Part').asString +
          ' - '+GetDetsQuery.fieldbyName('Part_Description').asString;
end;

procedure TSTStkValRepFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rCost: real;
  loop : integer;
  tempStr: string;
begin
  QRLblInUse.Enabled := getDetsQuery.fieldByName('Not_In_Use').AsString = 'Y';
  QRMemoRepName.Lines.clear;
  if not bIs_Stocktake then
  begin
  with GetTopRepSQL do
  begin
    close;
    paramByName('Part').AsString := getDetsQuery.FieldByname('Part').AsString;
    ParamByName('Rep').AsInteger := RepNo;
    open;
    first;
    for loop := 0 to pred(recordcount) do
      begin
      QRMemoRepName.Lines.append(GetTopRepSQL.FieldByName('Rep_Name').AsString);
    next;
    end;
  end;
  end;
  If bIs_Stocktake then
    begin
      QRLblInUse.Enabled := False;
      QRSubDetail1.height := 24;
      qrlblPaid.enabled := False;
    end
  else
    qrlblPaid.enabled := getDetsQuery.fieldByName('Invoice_upfront').AsString = 'Y';


  rCost := 0.00;
  if getdetsquery.fieldByName('Store_Quantity').asInteger = 0 then
  begin
    StockQTyQRLabel.Caption := '0';
    CstQRLbl.Caption := '?0.00';
    AVCstQRLbl.Caption := '?0.000';
  end
  else
 begin
  if ATActual then
    begin
      StockQtyQRLabel.Caption := ShowInPacks(getdetsquery.FieldByName('Store_Quantity').AsInteger,
                                       getdetsquery.FieldByName('Stock_Pack_Quantity').AsInteger);
      QRLblPck.Caption := intToStr(getdetsquery.FieldByName('Stock_Pack_Quantity').AsInteger);
    end
  else
    begin
      StockQtyQRLabel.Caption := ShowInPacks(getdetsquery.FieldByName('Store_Quantity').AsInteger,
                                       getdetsquery.FieldByName('Purch_Pack_Quantity').AsInteger);
      QRLblPck.Caption := intToStr(getdetsquery.FieldByName('Purch_Pack_Quantity').AsInteger);
    end;
   if AtActual then
      begin
        ValueQRLabel.Caption := 'Valued at Actual';
        If bIs_Stocktake then
          begin
            if (getdetsquery.FieldByName('Stock_Take_Prior_Qty').AsInteger = 0)  then
              begin
                 rCost := 0.00;
                 CstQRLbl.Caption := formatfloat('?######0.00',0.00)
              end
            else
              begin
                 rCost := (getdetsquery.FieldByName('Store_Cost').AsFloat / (getdetsquery.FieldByName('Stock_Take_Prior_Qty').AsInteger) *
                                      GetDetsQuery.FieldByName('Store_quantity').AsInteger);
                 CstQRLbl.Caption := formatfloat('?######0.00',rCost);
              end;
            if ((getdetsquery.FieldByName('Stock_Take_Prior_Qty').AsInteger = 0) or (GetDetsQuery.FieldByName('Stock_Pack_Quantity').AsInteger = 0)) then
              AvCstQRLbl.Caption :=  formatfloat('?######0.000',0.00)
            else
              AvCstQRLbl.Caption := formatfloat('?######0.000',(getdetsquery.FieldByName('Store_Cost').AsFloat / (getdetsquery.FieldByName('Stock_Take_Prior_Qty').AsInteger /
                                      GetDetsQuery.FieldByName('Stock_Pack_Quantity').AsInteger)));
          end
        else
         begin
           rCost := GetDetsQuery.FieldByName('Store_Cost').AsFloat;
          CstQRLbl.Caption := formatfloat('?######0.00',rCost);
          AvCstQRLbl.Caption := formatfloat('?######0.000',(getdetsquery.FieldByName('Store_Cost').AsFloat / (getdetsquery.FieldByName('Store_Quantity').AsInteger /
            GetDetsQuery.FieldByName('Stock_Pack_Quantity').AsInteger)));
         end;
      end
  else
      begin
        ValueQRLabel.Caption := 'Valued at Current';
        rCost := (GetDetsQuery.FieldByName('Part_Purchase_Price').AsFloat * GetDetsQuery.FieldByName('store_quantity').AsInteger
                 / GetDetsQuery.FieldByName('Purch_Pack_Quantity').ASInteger);
        CstQRLbl.Caption := formatfloat('?######0.00',rCost);
        AvCstQRLbl.Caption := formatfloat('?######0.000',(GetDetsQuery.FieldByName('Part_Purchase_Price').AsFloat));
      end;
  end;

  if (getDetsQuery.fieldByName('Invoice_upfront').AsString = 'Y') then
    begin
      rCost := 0;
      cstQrlbl.caption := formatfloat('?######0.00',0);
    end;

  rTotal := rTotal + rCost;
  binvalue := binValue + rCost;

  if self.exporting then
  begin
    //Warehouse
    tempStr := '"' + GetDetsQuery.fieldByName('part_Store_Name').asString + '"';

    //product
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('part_description').asString + '"';

    if not bis_stocktake then
    begin
      //Customer
      tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Cust_Name').asString + '"';

      //Rep Name
      if QRMemoRepName.lines.Count > 0 then
        tempStr := tempStr + ',"' + QRMemoRepName.Lines[0] + '"'
      else
        tempStr := tempStr + ',""';
    end;

    //Box Size
    tempStr := tempStr + ',"' + qrlblPck.caption + '"';

(*    //Box Count
    if pos(':', qrlblBoxCountVal.caption) = 0 then
      tempStr := tempStr + ',' + qrlblBoxCountVal.caption
    else
      tempStr := tempStr + ',' + StringReplace(qrlblBoxCountVal.caption, ':', ';', [rfReplaceAll]);
*)
    //In Stock
    if GetDetsQuery.fieldByName('Store_Quantity').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Store_Quantity').asString + '"';

    // cost
    if ATActual then
    begin
      rCost := GetDetsQuery.FieldByName('Store_Cost').AsFloat;
      tempStr := tempStr + ',"' + formatfloat('?######0.00',rCost) + '"';
    end
    else
    begin
      rCost := (GetDetsQuery.FieldByName('Part_Purchase_Price').AsFloat * GetDetsQuery.FieldByName('store_quantity').AsInteger
                 / GetDetsQuery.FieldByName('Purch_Pack_Quantity').ASInteger);
      tempStr := tempStr + ',"' + formatfloat('?######0.00',rCost) + '"';
    end;

    //Bin Location
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Bin').asString + '"';

    //Lot Code
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Store_lot').asString + '"';

    //Lot Reference
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Store_Stock_Description').asString + '"';

    //Paid stock
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Invoice_upfront').asString + '"';

    //do we buy this product
    if not bis_stocktake then
      begin
        tempStr := tempStr + ',"' + GetPOHistory(GetDetsQuery.fieldByName('Part').asString) + '"';
      end;

    //Product active
    tempStr := tempStr + ',"' + getDetsQuery.fieldByName('Not_In_Use').AsString + '"';

    writeln(self.exportFile, tempStr);
    if self.bIs_Stocktake then
      STStkValSlfrm.prgbrExport.StepIt
    else
      STRSStkValfrm.prgbrExport.StepIt;
  end;

end;

procedure TSTStkValRepFrm.GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
// TotCostQRlabel.Caption := formatfloat('?######0.00',fTotalCost)
  TotCostQRlabel.Caption := formatfloat('?######0.00',rTotal);
  self.gtValue := self.gtValue + rTotal;
end;

procedure TSTStkValRepFrm.rbSummaryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.qrlblGrandTotalValue.Caption := formatfloat('?######0.00',self.gtValue);
end;

procedure TSTStkValRepFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLblTotBinCst.Caption := formatfloat('?######0.00',binValue)
end;

procedure TSTStkValRepFrm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
Binvalue := 0.;
end;

procedure TSTStkValRepFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if bIs_Stocktake then
    begin
      tempStr := '"Warehouse"'
      + ',"Product"'
      + ',"Description"'
      + ',"Box Size"'
      + ',"Quantity"'
      + ',"Cost"'
      + ',"Bin Location"'
      + ',"Lot"'
      + ',"Lot Reference"'
      + ',"Paid Stock"'
      + ',"Product Not In Use"';
    end
  else
    begin
      tempStr := '"Warehouse"'
      + ',"Product"'
      + ',"Description"'
      + ',"Customer"'
      + ',"Rep"'
      + ',"Box Size"'
      + ',"Quantity"'
      + ',"Cost"'
      + ',"Bin Location"'
      + ',"Lot"'
      + ',"Lot Reference"'
      + ',"Paid Stock"'
      + ',"We Buy"'
      + ',"Product Not In Use"';
    end;

  writeLn(self.exportFile, tempStr);
  self.StkValQuickReport.Prepare;

  CloseFile(self.exportFile);
end;

function TSTStkValRepFrm.GetPOHistory(tempPart: string): string;
begin
  with qryGetPOs do
    begin
      close;
      parambyname('Stock_Reference').asstring := tempPart;
      open;
      if recordcount > 0 then
        begin
          result := 'Y';
          exit;
        end;
    end;

  with qryGetPurchOrds do
    begin
      close;
      parambyname('Part').asstring := tempPart;
      open;
      if recordcount > 0 then
        begin
          result := 'Y';
          exit;
        end;
    end;
  result := 'N';
end;

end.
