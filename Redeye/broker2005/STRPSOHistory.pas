unit STRPSOHistory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TSTRPSOHistoryFrm = class(TForm)
    qckrpSalesByProd: TQuickRep;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    Description: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    qrlblCost: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrdbtxtCost: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
  public
    { Public declarations }
    procedure ExportToFile(fileName: string);
  end;

var
  STRPSOHistoryFrm: TSTRPSOHistoryFrm;

implementation

uses STLUSordDM, STRSSOHistory;

{$R *.DFM}

procedure TSTRPSOHistoryFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Description"'
    + ',"Order No"'
    + ',"Order Date"'
    + ',"Customer Ref"'
    + ',"Qty Ordered"'
    + ',"Qty Delivered"'
    + ',"Sell Price"'
    + ',"Cost Price"'
    + ',"Discount"'
    + ',"Pack Size"'
    + ',"Total Sell Price"'
    + ',"Delivery Location"';

  writeLn(self.exportFile, tempStr);
  self.qckrpSalesByProd.Prepare;

  CloseFile(self.exportFile);
end;

procedure TSTRPSOHistoryFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Product
    tempStr := '"' + DmLookupSOrd.qrySalesHistory.fieldbyname('Part').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('Part_Description').asstring + '"';

    //Order
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('Sales_order').asstring + '"';

    //Order Date
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('date_ordered').asstring + '"';

    //Customer Ref
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('cust_order_no').asstring + '"';

    //Qty Ordered
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('Quantity_ordered').asstring + '"';

    //Qty Delivered
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('Quantity_delivered').asstring + '"';

    //sell price
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('part_sales_price').asstring + '"';

    //cost price
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('part_cost').asstring + '"';

    //discount
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('discount_value').asstring + '"';

    //Pack Size
    if DmLookupSOrd.qrySalesHistory.fieldbyname('Sell_Pack_Quantity').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldByName('Sell_Pack_Quantity').asString + '"';

    //total price
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('sales_value').asstring + '"';

    //delivery location
    tempStr := tempStr + ',"' + DmLookupSOrd.qrySalesHistory.fieldbyname('delivery_location').asstring + '"';

    writeln(self.exportFile, tempStr);
    STRSSOHistoryfrm.prgbrExport.StepIt;
  end;

end;

end.
