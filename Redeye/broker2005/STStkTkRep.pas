unit STStkTkRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QuickRpt, Qrctrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TStStkTkRepFrm = class(TForm)
    StkTkQuickReport: TQuickRep;
    QRBand: TQRBand;
    QRGroup1: TQRGroup;
    GrpFootQRBand: TQRBand;
    PageFootQRBand: TQRBand;
    TitleQRLabel: TQRLabel;
    SeqByQRLabel: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel13: TQRLabel;
    BinQRLabel: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    Seq2QRDBText: TQRDBText;
    DescQRDBText: TQRDBText;
    QRDBText1: TQRDBText;
    GetDetsDataSource: TDataSource;
    GetDetsQuery: TFDQuery;
    CountQRLabel: TQRLabel;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    GetAllBinQuery: TFDQuery;
    AddCountDetQuery: TFDQuery;
    GetNextRefQuery: TFDQuery;
    QRShape8: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    ReprintQuery: TFDQuery;
    ReprintQRLabel: TQRLabel;
    QRDBText3: TQRDBText;
    DateQRLabel: TQRLabel;
    OptionQRLabel: TQRLabel;
    RngQRLabel: TQRLabel;
    QRShape1: TQRShape;
    GetByPartSQL: TFDQuery;
    QRLblQty: TQRLabel;
    QRDBTxtPackSize: TQRDBText;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
  function GetDetails(Sender: TObject): Integer;
  procedure StkTkQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
   procedure AddStock(Sender: TObject);
   procedure CheckIfReprint(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
   private
    exporting: boolean;
    exportFile: textFile;
  public
    paidFor: string;
    bByPart, bBins, bQtys, bReprint: ByteBool;
    StockRef, sFrom, STo: String;
    selStore : Integer;
    selCust, selBranch: integer;
    selCustName: string;
    procedure ExportToFile(fileName: string);
  end;

var
  StStkTkRepFrm: TStStkTkRepFrm;

implementation

uses CCSCommon, pbImages, STpacks, STStkTkSl;

{$R *.DFM}

var
  iTempNextStock: Integer;

function TStStkTkRepFrm.GetDetails(Sender: TObject): Integer;
begin
  if bByPart then
    getdetsquery.sql := getByPartSql.sql;
  if bbins then
    getdetsquery.sql := getallbinquery.sql;
  CheckifReprint(Self);
  with GetdetsQuery do
  begin
    Close;
    if bReprint then
      begin
        ParamByName('Ref').Asstring := Stockref+'%';
        if bByPart then
          sql.add('order by part_store.Part_store_name,Stock_Take.Part,Stock_Take.Part_Bin,Stock_Take.Part_store_lot')
        else
          sql.add('order by Part_Store.Part_Store_Name,Stock_Take.Part_Bin,Stock_Take.Part,Stock_Take.Part_Store_Lot');
      end
    else
      begin
      ParamByName('Part_Store').AsInteger :=selStore;
      ParamByName('Customer').AsInteger := SelCust;
      if not bbins then
        begin
          ParamByName('RngFrom').AsString := sFrom;
          ParamByName('RngTo').AsString := sTo;
          if paidfor = 'U' then
            ParamByName('Invoice_upfront').Asstring := 'N'
          else
          if paidfor = 'P' then
            ParamByName('Invoice_upfront').Asstring := 'Y'
          else
            ParamByName('Invoice_upfront').Asstring := 'X';
        end;

      if bByPart then
        if bbins then
          sql.add('order by part_store.Part_store_name,Part_store_Bin.Part_Bin,Store_Stock.Part, Store_Stock.Part_Store_Lot')
        else
        sql.add('order by part_store.Part_store_name,Store_Stock.Part,Store_Stock.Part_Bin, Store_Stock.Part_Store_Lot')
      else
      if bbins then
          sql.add('order by part_store.Part_store_name,Part_store_Bin.Part_Bin,Store_Stock.Part, Store_Stock.Part_Store_Lot')
        else
        sql.add('order by Part_Store.Part_Store_Name,Store_Stock.Part_Bin,Store_Stock.Part, Store_Stock.Part_Store_Lot');
      end;
    Open;
    Result := RecordCount;
  end;
end;

procedure TStStkTkRepFrm.StkTkQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  RngQRlabel.Caption := 'Range From ';
  if sfrom = '' then
    RngQRLabel.Caption := RngQRLabel.Caption + 'First '
  else
    RngQRLabel.Caption := RngQRLabel.Caption + sfrom;
  if sTo = '' then
    RngQRLabel.Caption := RngQRLabel.Caption + ' to Last'
  else
    RngQRLabel.Caption := RngQRLabel.Caption + ' to '+sTo;

  if paidfor = 'P' then
    OptionQRLabel.Caption := OptionQRLabel.Caption + ' Print paid stock only '
  else
  if paidfor = 'U' then
    OptionQRLabel.Caption := OptionQRLabel.Caption + ' Print unpaid stock only'
  else
    OptionQRLabel.Caption := OptionQRLabel.Caption + ' Print all paid/unpaid stock ';

//  LogoQRImage.Picture := STImagesFrm.ReportImage.Picture;
  QRLabel1.Caption := stockref ;
  QRLblQty.Enabled := bqtys ;
  DateQRLabel.Caption := 'Run Date: ' + DateTimeToStr(Now);
  if bByPart then
      TitleQRLabel.Caption := 'Stock Count Listing By Product'
  else
      TitleQRLabel.Caption := 'Stock Count Listing By Bin';
  end;

procedure TStStkTkRepFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr: string;
begin
  if (not bReprint) and (Stockref <> 'Preview') then
    AddStock(Self);

  if self.exporting then
  begin
    //stocktake ref
    tempStr := '"' + inttostr(itempNextStock) + '"';

    //Bin
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Bin').asstring + '"';

    //Product
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Description').asstring + '"';

    //Lot Reference
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Store_Lot').asstring + '"';

    //Pack Size
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Stock_Pack_Quantity').asstring + '"';

    //Quantity
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Stock_Qty').asstring + '"';

    //Count
    tempStr := tempStr + ',"' + '' + '"';

    writeln(self.exportFile, tempStr);
    stStkTkSlFrm.prgbrExport.StepIt;
  end;
end;

procedure TStStkTkRepFrm.AddStock(Sender: TObject);
begin
With GetNextRefQuery do
     begin
      Close ;
      Open ;
      First ;
       iTempNextStock := FieldByName('Last_Code').AsInteger + 1 ;
    end;
With AddCountDetQuery do
     begin
     Close ;
     ParamByName('Stock_Take').AsInteger := iTempNextStock ;
     ParamByName('Date_Received').AsDateTime := GetDetsQuery.FieldByName('Date_Received').AsDateTime;
     ParamByName('Store_Cost').AsFloat := GetDetsQuery.FieldByName('Store_Cost').AsFloat ;
     ParamByName('Stock_Take_Prior_Qty').AsInteger := GetDetsQuery.FieldByName('Stock_Qty').AsInteger ;
     ParamByName('Stock_Take_Qty').AsInteger := 0 ;
     ParamByName('Part_Store').AsInteger := GetDetsQuery.FieldByName('Part_Store').AsInteger ;
     ParamByName('Stock_Take_Status').AsString :='B' ;
     ParamByName('Stock_Take_Ref').AsString := StockRef;
     ParamByName('Stock_Take_Pack_Qty').AsInteger := GetDetsQuery.FieldByName('Stock_Pack_Quantity').AsInteger;

     ParamByName('Invoice_upfront').asstring := GetDetsQuery.FieldByName('Invoice_upfront').Asstring ;
     ParamByName('Store_Stock_Description').Asstring := GetDetsQuery.FieldByName('Store_Stock_Description').asstring ;

     if getdetsQuery.FieldByName('Part').AsString <> '' then
       ParamByName('Part').AsString := GetDetsQuery.FieldByName('Part').AsString
     else
      ParamByName('Part').clear;

     if GetDetsQuery.FieldByName('Part_Store_Lot').asString <> '' then
      ParamByName('Part_Store_Lot').asString := GetDetsQuery.FieldByName('Part_store_Lot').AsString
     else
      ParamByName('Part_Store_Lot').clear ;
     if GetDetsQuery.FieldByName('Part_Bin').asString <> '' then
      ParamByName('Part_Bin').asString := GetDetsQuery.FieldByName('Part_Bin').AsString
     else
     ParamByName('Part_Bin').clear;
     ExecSQL ;
     end;
end;

procedure TStStkTkRepFrm.CheckIfReprint(Sender: TObject);
begin
  If bReprint then
    begin
      GetDetsQuery.SQL := ReprintQuery.SQL;
      ReprintQRLabel.Caption := 'REPRINT';
    end
  else
      ReprintQRLabel.Caption := '';
  end;

procedure TStStkTkRepFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if GetDetsQuery.FieldByName('Stock_qty').AsInteger = 0 then
    QRLblQty.Caption := '0'
  else
    QrLblQty.caption := ShowInPacks(GetDetsQuery.FieldByName('Stock_Qty').AsInteger, GetDetsQuery.FieldByName('Stock_Pack_Quantity').AsInteger);

end;

procedure TStStkTkRepFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr :=
      '"Stocktake Ref"'
    + ',"Bin"'
    + ',"Product"'
    + ',"Description"'
    + ',"Lot Reference"'
    + ',"Pack Size"'
    + ',"Quantity"'
    + ',"Count"';

  writeLn(self.exportFile, tempStr);
  stktkQuickReport.Prepare;

  CloseFile(self.exportFile);
end;

end.

