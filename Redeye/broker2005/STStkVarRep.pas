unit STStkVarRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QuickRpt, Qrctrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTStkVarRepFrm = class(TForm)
    StkVarQuickReport: TQuickRep;
    QRBand: TQRBand;
    QRGroup1: TQRGroup;
    GrpFootQRBand: TQRBand;
    PageFootQRBand: TQRBand;
    TitleQRLabel: TQRLabel;
    Group1TotalQRLabel: TQRLabel;
    PageQRSysData: TQRSysData;
    Seq2QRDBText: TQRDBText;
    DescQRDBText: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    GetStoreStkDataSource: TDataSource;
    GetDetsQuery: TFDQuery;
    DateQRLabel: TQRLabel;
    QRDBText5: TQRDBText;
    SeqByQRLabel: TQRLabel;
    NameQRLabel: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    LatCostQRLabel: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    BinQRLabel: TQRLabel;
    LotQRLabel: TQRLabel;
    QRLblPriorQty: TQRLabel;
    QRLblCountQty: TQRLabel;
    QRLblRef: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLblVarqtycap: TQRLabel;
    QRLblvarqty: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlblCountCost: TQRLabel;
    qrlblVarianceCost: TQRLabel;
    qrlblTotalCost: TQRLabel;
    qryGetLastLot: TFDQuery;
  function GetDetails(Sender: TObject): Integer;
  procedure StkVarQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    rTotalCost : Real;
    exporting: boolean;
    exportFile: textFile;
    function GetStockCost(tempstore: integer; tempPart: string; tempCost: real; tempPack: integer): real;
  public
    ByStore: ByteBool;
    atActual: ByteBool;
    procedure ExportToFile(fileName: string);
  end;

var
  STStkVarRepFrm: TSTStkVarRepFrm;

implementation

uses STStkValSl, CCSCommon;

{$R *.DFM}

{ TForm1 }

function TSTStkVarRepFrm.GetDetails(Sender: TObject): Integer;
begin
  with GetDetsQuery do
  begin
    Close;
    If STStkValSlFrm.bIs_Stocktake then
      begin
        sql.add('AND (Stock_Take.Stock_Take_Ref = ''' + STStkValSlFrm.StockTakeRef +''')');
      end;
    if ByStore = True then
      sql.add('order by part_store.Part_store_name,Part.Part,Part_Bin')
    else
     sql.add('order by Part.Part,Part_Store_Name,Part_Bin');
    Open;
    Result := RecordCount;
  end;
end;

procedure TSTStkVarRepFrm.StkVarQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  TitleQRLabel.Caption := 'Stock Count Variance Report';
//  LogoQRImage.Picture := STImagesFrm.ReportImage.Picture;
  DateQRLabel.Caption := 'Run Date : ' + DateTimeToStr(Now);
  QRLblRef.Caption := 'Count Ref: '+STStkValSlFrm.StockTakeRef;
  if ByStore = true then
    begin
      Seq2QRDBText.DataSet := GetDetsQuery;
      Seq2QRDBText.DataField := 'Part';
      DescQRDBText.DataSet := GetDetsQuery;
      DescQRDBText.DataField := 'Part_Description';
      QRGroup1.Expression := 'GetDetsQuery.Part_Store_Name';
      TitleQRLabel.Caption := TitleQRLabel.Caption+' By Store';
    end
  else
    begin
      QRLabel2.Caption := 'Store';
      SeqByQRLabel.Caption := 'Part';
      Seq2QRDBText.DataSet := GetDetsQuery;
      Seq2QRDBText.DataField := 'Store';
      DescQRDBText.DataSet := GetDetsQuery;
      DescQRDBText.DataField := 'Part_Store_Name';
      QRGroup1.Expression := 'GetDetsQuery.Part';
      QRGroup1.ForceNewPage := False;
      TitleQRLabel.Caption := TitleQRLabel.Caption+' By Product';
    end;
  end;

procedure TSTStkVarRepFrm.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  rTotalCost := 0.00;
  if ByStore = true then
    NameQrLabel.Caption := GetDetsQuery.fieldByName('part_Store_Name').asString
  else
    NameQrLabel.Caption := GetDetsQuery.fieldbyname('Part').asString +
          ' - '+GetDetsQuery.fieldbyName('Part_Description').asString;
end;

procedure TSTStkVarRepFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tempStr: string;
  rCost, rOrigCost: real;
begin
  If GetDetsQuery.FieldByName('Stock_Take_Prior_Qty').AsInteger = 0 then
    QrLblPriorQty.Caption := '0'
  else
    QRLblPriorQty.Caption := ShowInPacks(GetDetsQuery.FieldByName('Stock_Take_Prior_Qty').AsInteger, GetDetsQuery.FieldByname('Stock_Take_Pack_qty_Orig').AsInteger);

  If GetDetsQuery.FieldByName('Stock_Take_Qty').AsInteger = 0 then
    QrLblCountQty.Caption := '0'
  else
    QRLblCountQty.Caption := ShowInPacks(GetDetsQuery.FieldByName('Stock_Take_Qty').AsInteger, GetDetsQuery.FieldByname('Stock_Take_Pack_qty').AsInteger);

  QRLblVarQty.Caption := ShowInPacks((GetDetsQuery.FieldByName('Stock_Take_Qty').AsInteger - GetDetsQuery.FieldByName('Stock_Take_Prior_Qty').AsInteger), GetDetsQuery.FieldByname('Stock_Take_Pack_qty').AsInteger);

  // Calculate Cost
  if GetDetsQuery.FieldByName('Stock_Take_Prior_Qty').AsInteger = 0 then
    begin
      rCost := GetStockCost(GetDetsQuery.FieldByName('Part_Store').asinteger,GetDetsQuery.FieldByName('Part').asstring,
                            GetDetsQuery.FieldByName('Part_Purchase_Price').AsFloat, GetDetsQuery.FieldByName('Purch_Pack_Quantity').Asinteger);
      rCost := rCost * GetDetsQuery.FieldByName('Stock_Take_Qty').AsInteger;
      qrlblCountCost.Caption := formatfloat('£######0.00',rCost);
    end
  else
    begin
      rCost := (GetDetsQuery.FieldByName('Store_Cost').AsFloat / GetDetsQuery.FieldByName('Stock_Take_Prior_Qty').AsInteger)
                * GetDetsQuery.FieldByName('Stock_Take_Qty').AsInteger;
      qrlblCountCost.Caption := formatfloat('£######0.00',rCost)
    end;

  rOrigCost := GetDetsQuery.FieldByName('Store_Cost').AsFloat;
  qrlblVarianceCost.Caption := formatfloat('£######0.00',(rCost-rOrigCost));

  if self.exporting then
  begin
    //Warehouse
    tempStr := '"' + GetDetsQuery.fieldByName('part_Store_Name').asString + '"';

    //product
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('part').asString + '"';

    //Description
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('part_description').asString + '"';

    //Box Size
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('stock_take_pack_qty_orig').asString + '"';

    //In Stock
    tempStr := tempStr + ',"' + QRLblPriorQty.caption + '"';

    // cost
    if atActual then
    begin
      tempStr := tempStr + ',"' + formatfloat('£######0.00',rOrigCost) + '"';
    end
    else
    begin
      try
        rOrigCost := (GetDetsQuery.FieldByName('Part_Purchase_Price').AsFloat * GetDetsQuery.FieldByName('Stock_take_Prior_qty').AsInteger
                 / GetDetsQuery.FieldByName('stock_take_pack_qty_orig').ASInteger);
      finally
        rOrigCost := 0.00;
      end;
      tempStr := tempStr + ',"' + formatfloat('£######0.00',rOrigCost) + '"';
    end;

    //Box Size
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('stock_take_pack_qty').asString + '"';

    //In Stock
    tempStr := tempStr + ',"' + QrLblCountQty.Caption + '"';

    // cost
    tempStr := tempStr + ',"' + qrlblCountCost.Caption + '"';

    // Qty Variance
    tempStr := tempStr + ',"' + QRLblVarQty.Caption + '"';

    // Cost Variance
    tempStr := tempStr + ',"' + formatfloat('£######0.00',(rCost-rOrigCost)) + '"';

    //Bin Location
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Bin').asString + '"';

    //Lot Code
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Store_lot').asString + '"';

    //Lot Reference
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Store_Stock_Description').asString + '"';

    //Lot Reference
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Invoice_upfront').asString + '"';

    writeln(self.exportFile, tempStr);
    STStkValSlfrm.prgbrExport.StepIt;
  end;

  rTotalCost := rTotalCost + (rCost-rOrigCost);
end;

procedure TSTStkVarRepFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Warehouse"'
    + ',"Product"'
    + ',"Description"'
    + ',"Orig Pack Size"'
    + ',"Orig Qty"'
    + ',"Orig Cost"'
    + ',"Count Pack Size"'
    + ',"Count Qty"'
    + ',"Count Cost"'
    + ',"Qty Variance"'
    + ',"Cost Variance"'
    + ',"Bin Location"'
    + ',"Lot"'
    + ',"Lot Reference"'
    + ',"Paid Stock"';

  writeLn(self.exportFile, tempStr);
  self.StkVarQuickReport.Prepare;

  CloseFile(self.exportFile);
end;

procedure TSTStkVarRepFrm.GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotalCost.caption := formatfloat('£######0.00',rTotalCost);
end;
function TSTStkVarRepFrm.GetStockCost(tempstore: integer; tempPart: string; tempCost: real; tempPack: integer): real;
begin
  result := 0.00;
  with qryGetLastLot do
    begin
      close;
      parambyname('Part_Store').asinteger := tempStore;
      parambyname('Part').asstring := tempPart;
      open;

      if recordcount > 0 then
        begin
          try
            result := (fieldbyname('Store_Cost').asfloat/fieldbyname('Store_quantity').asinteger);
          except
            result := 0.00;
          end;
        end
      else
        begin
          try
            result := tempCost / tempPack;
          except
            result := 0.00;
          end;
        end;
    end;
end;

end.
