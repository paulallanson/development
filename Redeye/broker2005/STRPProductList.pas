unit STRPProductList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, DB, QRCtrls, ExtCtrls, CCSCommon, printers, qrprntr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRPProductListFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrpPageheader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLblSelection: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    qrbndgrphdr: TQRGroup;
    qryReport: TFDQuery;
    qrsubdetails: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrlblGroupHeader: TQRLabel;
    GrpByQRDBText: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    qrlblCostPrice: TQRLabel;
    qrlblCostSize: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    qrdbCostPrice: TQRDBText;
    QRDBText6: TQRDBText;
    qrdbCostSize: TQRDBText;
    QRDBText8: TQRDBText;
    qrlblGroupSel: TQRLabel;
    qryDummy: TFDQuery;
    FloatField1: TFloatField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TWideStringField;
    StringField2: TWideStringField;
    IntegerField3: TIntegerField;
    StringField3: TWideStringField;
    StringField4: TWideStringField;
    IntegerField4: TIntegerField;
    StringField5: TWideStringField;
    IntegerField5: TIntegerField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    QRLabel2: TQRLabel;
    qrlblDiscPrice: TQRLabel;
    QRLabel4: TQRLabel;
    qrlblUnitPrice: TQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsubdetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsubdetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
  public
    bIncludeinactive: boolean;
    bIncludeCosts: boolean;
    sClaimType: string;
    sPartFrom, sPartTo: string;
    iPartGroup: integer;
    totalby: integer;
    bSummary: boolean;
    DateFrom, DateTo: TDateTime;
    iCode, iProductType: integer;
    rDiscount, rDiscountPrice: real;
    procedure ExportToFile(fileName: string);
    function PrepareReport(sPartFrom, sDateTo: string; Group, customer: integer): integer;
  end;

var
  STRPProductListFrm: TSTRPProductListFrm;

implementation

uses PBRSFSCClaim, STRSProductList;

var
  rReceived, rInStock, rDespatched: double;
  rFSCReceived, rFSCInStock, rFSCDespatched: double;

{$R *.dfm}

function TSTRPProductListFrm.PrepareReport(sPartFrom, sDateTo: string; Group, customer: integer): integer;
begin
  self.qryReport.Active := false;

  qryReport.SQL.clear;
  qryReport.SQL.text := qryDummy.SQL.text;

  qryreport.parambyname('Part_From').asstring := sPartFrom;
  qryReport.parambyname('Part_To').asstring := sPartTo;

  if bIncludeInactive then
    qryreport.parambyname('inactive').asstring := 'Y'
  else
    qryreport.parambyname('inactive').asstring := 'N';

  if Group <> 0 then
  begin
    self.qryReport.SQL.Add('  and (Part.Part_group = ' + IntToStr(Group) + ')');
  end;

  if totalby = 0 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Part_Group.Part_Group_Descr, Part.Part');
      qrbndgrphdr.expression := 'Part_Group_Descr';
      GrpByQRDBText.DataField := 'Part_Group_Descr';
      qrlblGroupHeader.Caption := 'Product Group:';
    end
  else
  if totalby = 1 then
    begin
      self.qryReport.SQL.Add(' ORDER BY Customer.Name, Part.Part');
      qrbndgrphdr.expression := 'Customer_Name';
      GrpByQRDBText.DataField := 'Customer_name';
      qrlblGroupHeader.caption:= 'Customer:';
    end
  else
    begin
      self.qryReport.SQL.Add(' ORDER BY Part.Part');
      qrbndgrphdr.expression := '';
      GrpByQRDBText.DataField := '';
      qrlblGroupHeader.caption:= '';
    end;

  qrbndgrphdr.enabled := (totalby < 2);

  self.qryReport.Active := true;
  Result := (self.qryReport.RecordCount);
end;

procedure TSTRPProductListFrm.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  qrbndgrphdr.enabled := (totalby < 2);
  qrdbCostPrice.Enabled := bIncludeCosts;
  qrdbCostSize.enabled := bIncludeCosts;
  qrlblCostSize.enabled := bIncludeCosts;
  qrlblCostprice.enabled := bIncludeCosts;
end;

procedure TSTRPProductListFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempstr := '"Product Code"'
              + ',"Description"'
              + ',"Product group"'
              + ',"VAT Rate"'
              + ',"Sell Pack Size"'
              + ',"Sell Price"'
              + ',"Discount Price"'
              + ',"Unit Price"';

  if bIncludeCosts then
    begin
      tempstr := tempstr
              + ',"Cost Pack Size"'
              + ',"Cost Price"'
              + ',"Unit Cost"';
    end;

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TSTRPProductListFrm.qrsubdetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting and not self.bSummary then
  begin
    //product Code
    tempStr := '"' + qryReport.fieldbyname('Part').asstring + '"';

    //description
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part_Description').asstring + '"';

    //Product group
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part_group_Descr').asstring + '"';

    //VAT Rate
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Vat_Rate').asstring + '"';

    //Sell Pack Qty
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Sell_Pack_Quantity').asstring + '"';

    //Sell price
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Part_Cost_Cat').asstring + '"';

    //Discounted Price
    tempStr := tempStr + ',"' + formatfloat('#0.00',rDiscountPrice) + '"';

    //Unit Sell Price
    tempStr := tempStr + ',"' + formatfloat('0.000',(rDiscountPrice/qryReport.fieldbyname('Sell_Pack_Quantity').asfloat)) + '"';

    if bIncludeCosts then
      begin
        //Purchase Pack Qty
        tempStr := tempStr + ',"' + qryReport.fieldbyname('Purch_Pack_Quantity').asstring + '"';

        //Cost price
        tempStr := tempStr + ',"' + qryReport.fieldbyname('Part_Purchase_Price').asstring + '"';

        //Unit Cost Price
        tempStr := tempStr + ',"' + formatfloat('0.000',(qryReport.fieldbyname('Part_Purchase_Price').asfloat/qryReport.fieldbyname('Purch_Pack_Quantity').asfloat)) + '"';
      end;

    writeln(self.exportFile, tempStr);
    STRSProductListFrm.prgbrExport.StepIt;
  end;
end;

procedure TSTRPProductListFrm.qrsubdetailsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  rDiscountPrice := (qryReport.fieldbyname('part_cost_cat').asfloat*(1-(rDiscount/100)));
  qrlblDiscPrice.Caption := formatfloat('£#0.00',(qryReport.fieldbyname('part_cost_cat').asfloat*(1-(rDiscount/100))));
  qrlblUnitPrice.Caption := formatfloat('£#0.00',(rDiscountPrice/qryReport.fieldbyname('Sell_Pack_Quantity').asfloat));
end;

end.
