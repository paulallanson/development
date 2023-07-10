unit STRPCustStkBal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Db, DBTables, CCSPrint, Qrctrls;

type
  TSTRPCustStkBalfrm = class(TForm)
    QuickReport: TQuickRep;
    qryStkBalRep: TQuery;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qryGetLastSO: TQuery;
    oldqryStkBalRep: TQuery;
    qrbCustFooter: TQRBand;
    qrbCustHeader: TQRGroup;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    qrlblTotalCustValue: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblSelection: TQRLabel;
    QRDBText3: TQRDBText;
    GetSerNosSQL: TQuery;
    GetSerNosSQLSerial_item_from: TStringField;
    GetSerNosSQLSerial_item_to: TStringField;
    QRBand2: TQRBand;
    qrsdtlNumbers: TQRSubDetail;
    lblSerialNos: TQRLabel;
    lblSerialNoRange: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlblQuantity: TQRLabel;
    qrlblPrice: TQRLabel;
    qrlblPriceUnit: TQRLabel;
    qrlblTotalValue: TQRLabel;
    qrlblLastDate: TQRLabel;
    ChildBand1: TQRChildBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrlblPaid: TQRLabel;
    function Getdetails(Sender: TObject): integer;
    procedure qrbCustFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbCustFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsdtlNumbersBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbCustHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    bSerialNos: boolean;
    exporting: boolean;
    exportFile: textFile;
  public
    PrinterSettings: TPrinterSettings;
    Customer: integer;
    NotInUse: boolean;
    PartFrom: string;
    PartTo: string;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPCustStkBalfrm: TSTRPCustStkBalfrm;

implementation

uses STRSCustStkBal;

var
  rCustTotal: real;
  
{$R *.DFM}

function TSTRPCustStkBalfrm.Getdetails(Sender: TObject): integer;
begin
  with qryStkBalRep do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Part_From').asstring := PartFrom;
      parambyname('Part_To').asstring := PartTo;
      if NotinUse then
        parambyname('Not_in_Use').asstring := 'N'
      else
        parambyname('Not_in_Use').asstring := 'Y';
      open;
      result := recordcount;
    end;
end;

procedure TSTRPCustStkBalfrm.qrbCustFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblTotalCustValue.caption := formatfloat('#,##0.00',rCustTotal);
end;

procedure TSTRPCustStkBalfrm.QuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rCustTotal := 0.00;
  qrbCustHeader.enabled := (qrlblSelection.caption = '');
end;

procedure TSTRPCustStkBalfrm.qrbCustFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rCustTotal := 0.00;
end;

procedure TSTRPCustStkBalfrm.qrsdtlNumbersBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 childband1.enabled := true;
 if GetSerNosSQL.fieldbyname('serial_item_from').asstring = '' then
    PrintBand := false;
  lblSerialNos.Enabled := bserialNos;
  lblSerialNoRange.caption := GetSerNosSQL.fieldbyname('serial_item_from').asstring + ' to ' +
                              GetSerNosSQL.fieldbyname('serial_item_to').asstring;
  if printband then
    bserialNos := false;
end;

procedure TSTRPCustStkBalfrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rprice, rValue: real;
  tempStr: string;
begin
  bserialnos := true;
  childband1.enabled := false;
  with GetSerNosSQl do
  begin
    close;
    paramByName('Part').AsString := qrystkBalRep.fieldByName('Part').AsString;
    paramByName('Upfront').AsString := qrystkBalRep.fieldByName('Invoice_Upfront').AsString;
    open;
  end;
   if qryStkBalRep.fieldbyname('Free_stock').asstring = '' then
    qrlblQuantity.Caption := '0'
  else
    qrlblQuantity.Caption := formatfloat('#,##0',qryStkBalRep.fieldbyname('Free_stock').asfloat);

  if qryStkBalRep.fieldbyname('Invoice_upfront').asstring = 'Y' then
    qrlblPaid.caption := 'Paid For'
  else
    qrlblPaid.caption := '';

  if qryStkBalRep.fieldbyname('Price_unit_description').asstring = '' then
    qrlblPriceUnit.Caption := qryStkBalRep.fieldbyname('sell_pack_quantity').asstring
  else
    qrlblPriceUnit.Caption := qryStkBalRep.fieldbyname('Price_unit_factor').asstring;

  if qryStkBalRep.fieldbyname('Invoice_upfront').asstring = 'Y' then
    begin
      rvalue := 0.00;
      qrlblPrice.Caption := '0.00';
    end
  else
    begin
      if qryStkBalRep.fieldbyname('Price_unit_factor').asinteger = 0 then
        begin
          qrlblPriceUnit.Caption := qryStkBalRep.fieldbyname('sell_pack_quantity').asstring;
          rprice := qryStkBalRep.fieldbyname('Part_Cost_cat').asfloat;
          qrlblPrice.caption := formatfloat('#,##0.00',rprice);
          rvalue := (
                (qryStkBalRep.fieldbyname('Free_Stock').asfloat/qryStkBalRep.fieldbyname('sell_pack_quantity').asfloat)*
                qryStkBalRep.fieldbyname('Part_Cost_Cat').asfloat);
        end
      else
        begin
          rprice := ((qryStkBalRep.fieldbyname('Price_unit_factor').asinteger/qryStkBalRep.fieldbyname('sell_pack_quantity').asinteger)*
                  qryStkBalRep.fieldbyname('Part_Cost_cat').asfloat);
          qrlblPrice.caption := formatfloat('#,##0.00',rprice);
          rValue := ((qryStkBalRep.fieldbyname('Free_Stock').asinteger/qryStkBalRep.fieldbyname('Price_unit_factor').asinteger)*
                rprice);
        end;
    end;
  qrlblTotalValue.caption := formatfloat('#,##0.00',rValue);
  rCustTotal := rCustTotal + rValue;
  {Get last sales order date}
  with qryGetLastSO do
    begin
      close;
      parambyname('Part').asstring := qryStkBalRep.fieldbyname('Part').asstring;
      open;
      qrlblLastDate.caption := fieldbyname('Last_Sales_Date').asstring;
    end;

  if self.exporting then
  begin
    tempStr := '"' + qryStkBalRep.FieldByName('Part').asString + '"';
    tempStr := tempStr+ ',"' + qryStkBalRep.FieldByName('Part_Description').asString + '"';
    tempStr := tempStr+ ',"' + qryStkBalRep.fieldbyname('Invoice_upfront').asstring + '"';
    tempStr := tempStr+ ',"' + qrlblQuantity.caption + '"';
    tempStr := tempStr+ ',"' + qrlblPrice.caption + '"';
    tempStr := tempStr+ ',"' + qrlblPriceUnit.caption + '"';
    tempStr := tempStr+ ',"' + qrlblTotalValue.caption + '"';
    tempStr := tempStr+ ',"' + qrlblLastDate.caption + '"';

    writeln(self.exportFile, tempStr);
    STRSCustStkBalfrm.prgbrExport.StepIt;
  end;
end;

procedure TSTRPCustStkBalfrm.qrbCustHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 childband1.enabled := false;
end;

procedure TSTRPCustStkBalfrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Description"'
    + ',"Paid For"'
    + ',"Quantity"'
    + ',"Price"'
    + ',"Price Unit"'
    + ',"Total Value"'
    + ',"Last Order"';

  writeLn(self.exportFile, tempStr);
  self.QuickReport.Prepare;
  
  CloseFile(self.exportFile);
end;

end.
