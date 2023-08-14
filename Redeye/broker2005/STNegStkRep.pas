unit STNegStkRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QuickRpt, Qrctrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTNegStkRepFrm = class(TForm)
    NegStkQuickReport: TQuickRep;
    QRBand: TQRBand;
    QRGroup1: TQRGroup;
    GrpFootQRBand: TQRBand;
    TitleQRLabel: TQRLabel;
    SeqByQRLabel: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    BinQRLabel: TQRLabel;
    LotQRLabel: TQRLabel;
    Group1TotalQRLabel: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    Seq2QRDBText: TQRDBText;
    DescQRDBText: TQRDBText;
    PackSizeQRDBText: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    GetDetsDataSource: TDataSource;
    GetDetsQuery: TFDQuery;
    QRDBText3: TQRDBText;
    LatCostQRExpr: TQRExpr;
    TotCostQRLabel: TQRLabel;
    NameQRLabel: TQRLabel;
    DateQRLabel: TQRLabel;
    GetDetsQueryStore_Stock: TIntegerField;
    GetDetsQueryQuantity_Allocated: TIntegerField;
    GetDetsQueryStore_Quantity: TIntegerField;
    GetDetsQueryStore_Cost: TCurrencyField;
    GetDetsQueryDate_Received: TDateTimeField;
    GetDetsQueryPart: TStringField;
    GetDetsQueryPart_Store_Lot: TStringField;
    GetDetsQueryPart_Store: TIntegerField;
    GetDetsQueryPart_Bin: TStringField;
    GetDetsQueryStock_Pack_Quantity: TIntegerField;
    GetDetsQueryPart_Description: TStringField;
    GetDetsQueryPurch_Pack_Quantity: TIntegerField;
    GetDetsQueryPart_Purchase_Price: TCurrencyField;
    GetDetsQueryPart_Store_Name: TStringField;
    GetDetsQueryStore_Quantity_Pos: TIntegerField;
    GetDetsQueryStore_Cost_Pos: TCurrencyField;
    QRShape1: TQRShape;
    PageQRSysData: TQRSysData;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLblInUse: TQRLabel;
    GetDetsQueryNot_In_Use: TStringField;
    QRLblSel: TQRLabel;
  function GetDetails(Sender: TObject): Integer;
  procedure NegStkQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GetDetsQueryStore_Quantity_PosGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    private
    fTotalCost : Real;
    { Private declarations }
  public
    bSeqBy: ByteBool;
    bexcProd: Bytebool;
    { Public declarations }
  end;

var
  STNegStkRepFrm: TSTNegStkRepFrm;

implementation

uses CCSCommon;

{$R *.DFM}

function TSTNegStkRepFrm.GetDetails(Sender: TObject): Integer;
begin
  with GetdetsQuery do
  begin
    Close;
    if bExcProd then
      sql.add('and (part.not_in_use <> ''Y'')'); 
    if bseqBy = false then
      sql.add('order by part_store.Part_store_name,Store_Stock.Part,Store_Stock.Part_Bin')
    else
     sql.add('order by Store_Stock.part,Part_Store.Part_Store_Name,Store_Stock.Part_Bin');
    Open;
    Result := RecordCount;
  end;
end;

procedure TSTNegStkRepFrm.NegStkQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
//  LogoQRImage.Picture := STImagesFrm.ReportImage.Picture;
  if bExcProd then
   begin
    DateQRLabel.Caption := 'Run Date : ' + DateTimeToStr(Now);
    QRLblSel.Caption := 'Excluding Products not in use';
   end
  else
   begin
    DateQRLabel.Caption := 'Run Date : ' + DateTimeToStr(Now);
    QRlblSel.Caption := 'Including Products not in use';
   end;
  QRLabel1.enabled := not bExcProd;
  if bSeqBy = False then
    begin
      Seq2QRDBText.DataSet := GetdetsQuery;
      Seq2QRDBText.DataField := 'Part';
      DescQRDBText.DataSet := GetdetsQuery;
      DescQRDBText.DataField := 'Part_Description';
      QRGroup1.Expression := 'GetdetsQuery.Part_Store_Name';
      TitleQRLabel.Caption := 'Negative Stock Report By Store';
    end
  else
    begin
      QRLabel2.Caption := 'Store';
      SeqByQRLabel.Caption := 'Product';
      Seq2QRDBText.DataSet := GetdetsQuery;
      Seq2QRDBText.DataField := 'Store';
      DescQRDBText.DataSet := GetdetsQuery;
      DescQRDBText.DataField := 'Part_Store_Name';
      QRGroup1.Expression := 'GetdetsQuery.Part';
      QRGroup1.ForceNewPage := False;
      TitleQRLabel.Caption := 'Negative Stock Report By Product';
    end;
  end;

procedure TSTNegStkRepFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  fTotalCost := fTotalCost+
  StrToFloatDef(formatfloat('######0.00', GetdetsQuery.fieldbyname('Part_Purchase_Price').AsFloat *
                                          GetdetsQuery.fieldByName('Store_Quantity_Pos').AsFloat /
                                          GetdetsQuery.fieldByName('Purch_Pack_Quantity').asFloat), 0, FormatSettings);
end;

procedure TSTNegStkRepFrm.GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  fTotalCost := 0;
end;

procedure TSTNegStkRepFrm.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if bseqBy = false then
    NameQrLabel.Caption := GetdetsQuery.fieldByName('part_Store_Name').asString
  else
    NameQrLabel.Caption := GetdetsQuery.fieldbyname('Part').asString +
          ' - '+GetdetsQuery.fieldbyName('Part_Description').asString;
end;

procedure TSTNegStkRepFrm.GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotCostQRlabel.Caption := formatfloat('£######0.00',fTotalCost)
end;

procedure TSTNegStkRepFrm.GetDetsQueryStore_Quantity_PosGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
{Convert the quantity to packs and singles} ;
Text := ShowInPacks(Sender.AsInteger,GetDetsQuery.FieldByName('Stock_Pack_Quantity').AsInteger) ;
end;

procedure TSTNegStkRepFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLblInUse.Enabled := GetDetsQuery.fieldByName('Not_In_Use').AsString = 'Y';
end;

end.
