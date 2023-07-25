unit STRPSalesByCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, STLUSordDM,
  printers, QrExport;

type
  TSTRPSalesByCustFrm = class(TForm)
    qckrpSalesByProd: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    PsQRLabel1: TQRLabel;
    PsQRLabel4: TQRLabel;
    PsQRLabel10: TQRLabel;
    PsQRLabel3: TQRLabel;
    PsQRLabel2: TQRLabel;
    PsQRLabel5: TQRLabel;
    qrlblGoodsValue: TQRLabel;
    qrlblGoodsTotal: TQRLabel;
    qrbGroupFooter: TQRBand;
    PsQRLabel8: TQRLabel;
    qrbRepTotal: TQRBand;
    PsQRLabel9: TQRLabel;
    psqrlblCustTotal: TQRLabel;
    psqrlblSalesTotal: TQRLabel;
    PsQRShape2: TQRShape;
    PsQRShape3: TQRShape;
    PsQRLabel12: TQRLabel;
    PsQRLabel13: TQRLabel;
    qrlblDelivery: TQRLabel;
    PsQRShape4: TQRShape;
    QRSubDetail1: TQRSubDetail;
    PsQRDBText11: TQRDBText;
    PsQRDBText10: TQRDBText;
    PsQRDBText2: TQRDBText;
    PsQRDBText3: TQRDBText;
    PsQRDBText8: TQRDBText;
    qrlblBoxes: TQRLabel;
    PsQRDBText4: TQRDBText;
    PsQRDBText13: TQRDBText;
    qrdbGoodsValue: TQRDBText;
    qrdbGoodsTotal: TQRDBText;
    qrdbDeliveryLocation: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    lblSerialNos: TQRLabel;
    lblSerialNoRange: TQRLabel;
    qrlblOrderedBy: TQRLabel;
    qrbRepGroupFtr: TQRBand;
    PsQRLabel6: TQRLabel;
    qrdbRepName: TQRDBText;
    PsQRLabel7: TQRLabel;
    psqrlblRepTotal: TQRLabel;
    PsQRShape1: TQRShape;
    PsQRLabel11: TQRLabel;
    qrDelToFooter: TQRBand;
    qrlblDelTo: TQRLabel;
    PsQRShape5: TQRShape;
    PsQRShape6: TQRShape;
    PsQRLabel14: TQRLabel;
    psqrlblCust2Total: TQRLabel;
    qrOrdByGroup: TQRGroup;
    qrDelToGroup: TQRGroup;
    qrRepGroup: TQRGroup;
    procedure qrOrdByGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbRepTotalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrOrdByGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qckrpSalesByProdBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrRepGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbRepGroupFtrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrRepGroupAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrOrdByGroupAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrDelToGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDelToFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    bSerialNos: boolean;
    SerialNoBandNo: integer;
    SalesTotal: Currency;
    CustomerTotal: Currency;
    RepTotal: Currency;
  public
    ShowGoodsValue, ShowListPrices, ShowClientCodes: boolean;
    TotalByOrder: boolean;
    TotalbyDelivery: boolean;
    pagePerCust: boolean;
    procedure ExportToFile(fileName: string);
  end;

var
  STRPSalesByCustFrm: TSTRPSalesByCustFrm;

implementation

uses STRSSalesByCust;

{$R *.DFM}

procedure TSTRPSalesByCustFrm.qrOrdByGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tempFloat: double;
begin
  self.SerialNoBandNo := 0;
  self.SalesTotal := self.SalesTotal +
    DmLookupSOrd.qryProdSalesbyCustSalesValue.AsCurrency;
  self.CustomerTotal := self.CustomerTotal +
    DmLookupSOrd.qryProdSalesbyCustSalesValue.AsCurrency;

  if DmLookupSOrd.qryProdSalesbyCustsell_pack_quantity.asFloat = 0.00 then
  begin
    self.qrlblBoxes.Caption := 'INF';
  end
  else
  begin
    tempFloat := DmLookupSOrd.qryProdSalesbyCustQuantity_Delivered.asFloat /
      DmLookupSOrd.qryProdSalesbyCustSell_Pack_Quantity.asFloat;
    self.qrlblBoxes.Caption := FloatToStrF(tempFloat, ffFixed, 15, 0);
  end;
end;

procedure TSTRPSalesByCustFrm.qrbRepTotalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.psqrlblSalesTotal.Caption := CurrToStrF(self.SalesTotal, ffCurrency, 2);
end;

procedure TSTRPSalesByCustFrm.qrOrdByGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.CustomerTotal := 0.00;
  qrlblOrderedBy.caption := DmLookupSOrd.qryProdSalesbyCust.fieldbyname('OrderedBy').asstring;

end;

procedure TSTRPSalesByCustFrm.qrbGroupFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PsQRLabel8.caption := 'Total Sales Value: ' + qrlblOrderedBy.caption;

  PsQRShape2.Left := PsQRLabel8.left;
  PsQRShape2.width := psqrlblCustTotal.left + psqrlblCustTotal.width - PsQRShape2.Left;
  PsQRShape4.left := PsQRShape2.Left;
  PsQRShape4.width := PsQRShape2.width;

  self.psqrlblCustTotal.Caption := CurrToStrF(self.CustomerTotal, ffCurrency, 2);
end;

procedure TSTRPSalesByCustFrm.qckrpSalesByProdBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckrpSalesbyProd.Page.orientation := poLandscape;
  SalesTotal := 0.00;

  qrOrdByGroup.enabled := TotalbyOrder;
  qrbGroupFooter.enabled := TotalbyOrder and showGoodsValue;
  qrDelToGroup.enabled := not TotalbyOrder;
  qrDelToFooter.enabled := (not TotalbyOrder) and showGoodsValue;

  qrlblGoodsValue.enabled := showGoodsValue;
  qrlblGoodsTotal.enabled := showGoodsValue;
  qrdbGoodsValue.enabled := showGoodsValue;
  qrdbGoodsTotal.enabled := showGoodsValue;

  qrbRepGroupFtr.Enabled := showGoodsValue;
  qrbRepTotal.enabled := showGoodsValue;

  if not showGoodsValue then
    begin
      qrdbDeliveryLocation.left := 725;
      qrlblDelivery.left := 725;
    end;
end;

procedure TSTRPSalesByCustFrm.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tempFloat: double;
  tempCurr: Currency;
begin
  self.SerialNoBandNo := 0;
  tempCurr := DmLookupSOrd.qryProdSalesbyCustSalesValue.AsCurrency;

  self.SalesTotal    := self.SalesTotal    + tempCurr;
  self.CustomerTotal := self.CustomerTotal + tempCurr;
  self.RepTotal      := self.RepTotal      + tempCurr;

  if DmLookupSOrd.qryProdSalesbyCustsell_pack_quantity.asFloat = 0.00 then
  begin
    self.qrlblBoxes.Caption := 'INF';
  end
  else
  begin
    tempFloat := DmLookupSOrd.qryProdSalesbyCustQuantity_Delivered.asFloat /
      DmLookupSOrd.qryProdSalesbyCustSell_Pack_Quantity.asFloat;
    self.qrlblBoxes.Caption := FloatToStrF(tempFloat, ffFixed, 15, 0);
  end;
end;

procedure TSTRPSalesByCustFrm.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if DmLookupSOrd.qrySalesSerialNos.fieldbyname('serial_item_from').asstring = '' then
    PrintBand := false;
  if bSerialNos then
    lblSerialNos.Enabled := false;
  lblSerialNoRange.caption := DmLookupSOrd.qrySalesSerialNos.fieldbyname('serial_item_from').asstring + ' to ' +
                              DmLookupSOrd.qrySalesSerialNos.fieldbyname('serial_item_to').asstring;
  bserialNos := true;
end;

procedure TSTRPSalesByCustFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
  rVatValue, rTotalRetail: real;
begin
  bserialnos := false;

  if self.exporting then
  begin
    if ShowClientCodes then
    begin
      with DmLookupSOrd.qryGetCustomerDetails do
        begin
          close;
          parambyname('Customer').asinteger := DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Customer').asinteger;
          parambyname('Part').asstring := DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Part').asstring;
          open;
        end;
    end;

    //Customer/Branch
    if TotalbyOrder then
//      tempStr := '"' + qrlblOrderedBy.caption + '"'
     tempStr := '"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Customer_Name').asstring + '"'
    else
      tempStr := '"' + qrlblDelTo.caption + '"';

    //Rep
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('RepName').asstring + '"';

    //Order
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Sales_order').asstring + '"';

    //Order Date
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('date_ordered').asstring + '"';

    //Customer Ref
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('cust_order_no').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Part_Description').asstring + '"';

    //Product
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Part').asstring + '"';

    //get Customer Product details
    if ShowClientCodes then
      tempstr := tempstr + ',"' + DmLookupSOrd.qryGetCustomerDetails.fieldbyname('Customer_Part_Code').asstring + '"';

    //Qty Delivered
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Quantity_delivered').asstring + '"';

    //Branch Name
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Branch_Name').asstring + '"';

    //Short code
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Short_Code').asstring + '"';

    //Box Count
    if pos(':', qrlblBoxes.caption) = 0 then
      tempStr := tempStr + ',' + qrlblBoxes.caption
    else
      tempStr := tempStr + ',' + StringReplace(qrlblBoxes.caption, ':', ';', [rfReplaceAll]);

    //Pack Size
    if DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Sell_Pack_Quantity').asString = '' then
      tempStr := tempStr + ',"0"'
    else
      tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldByName('Sell_Pack_Quantity').asString + '"';

    //delivery Date
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('delivery_date').asstring + '"';

    if ShowListprices then
      begin
        //Cost
        tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Part_Cost_Cat').asstring + '"';

        //Vat Value and Rate
        rVatValue := DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Part_Cost_cat').asfloat * (DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Vat_Rate').asfloat/100);
        tempStr := tempStr + ',"' + floattostr(rVatValue) + '"';

        //Total Cost
        tempStr := tempStr + ',"' + floattostr(DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Part_Cost_cat').asfloat + rVatValue) + '"';
      end;

    //unit price
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('part_sales_price').asstring + '"';

    //total price
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('salesvalue').asstring + '"';

    if ShowClientCodes then
      begin
        //Retail price
        tempStr := tempStr + ',"' + DmLookupSOrd.qryGetCustomerDetails.fieldbyname('Sell_Price').asstring + '"';

        //Total Retail Price
        if DmLookupSOrd.qryGetCustomerDetails.fieldbyname('Sell_Pack_Quantity').asinteger = 0 then
          rTotalRetail := DmLookupSOrd.qryGetCustomerDetails.fieldbyname('Sell_Price').asfloat *
                        (DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Quantity_delivered').asfloat/1)
        else
          rTotalRetail := DmLookupSOrd.qryGetCustomerDetails.fieldbyname('Sell_Price').asfloat *
                        (DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Quantity_delivered').asfloat/DmLookupSOrd.qryGetCustomerDetails.fieldbyname('Sell_Pack_Quantity').asfloat);

        tempStr := tempStr + ',"' + floattostr(rTotalRetail) + '"';
      end;

    //delivery location
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('deliverylocation').asstring + '"';

    //cost centre
    tempStr := tempStr + ',"' + DmLookupSOrd.qryProdSalesbyCust.fieldbyname('Cost_Centre').asstring + '"';

    writeln(self.exportFile, tempStr);
    STRSSalesbyCustfrm.prgbrExport.StepIt;
  end;
end;

procedure TSTRPSalesByCustFrm.FormCreate(Sender: TObject);
begin
  TotalbyOrder:= false;
  TotalbyDelivery:= false;
end;

procedure TSTRPSalesByCustFrm.qrRepGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  self.RepTotal := 0.00;
  self.qrOrdByGroup.ForceNewPage := false;
end;

procedure TSTRPSalesByCustFrm.qrbRepGroupFtrBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PsQRLabel7.caption := 'Total Sales Value: ' + DmLookupSOrd.qryProdSalesbyCustRepName.asString;

  PsQRShape1.Left := PsQRLabel7.left;
  PsQRShape1.width := psqrlblRepTotal.left + psqrlblRepTotal.width - PsQRShape1.Left;

  self.psqrlblRepTotal.Caption := CurrToStrF(self.RepTotal, ffCurrency, 2);
end;

procedure TSTRPSalesByCustFrm.qrRepGroupAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  self.qrRepGroup.ForceNewPage := self.pagePerCust;
end;

procedure TSTRPSalesByCustFrm.qrOrdByGroupAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  self.qrOrdByGroup.ForceNewPage := self.pagePerCust;
end;

procedure TSTRPSalesByCustFrm.qrDelToGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  self.CustomerTotal := 0.00;
  if DmLookupSOrd.qryProdSalesbyCust.fieldbyname('DeliveryCustName').asstring <> '' then
    qrlblDelTo.caption := DmLookupSOrd.qryProdSalesbyCust.fieldbyname('DeliveryCustName').asstring + '/' +
                              DmLookupSOrd.qryProdSalesbyCust.fieldbyname('DeliveryBranchName').asstring
  else
    qrlblDelTo.caption := DmLookupSOrd.qryProdSalesbyCustDeliveryLocation.asstring;
end;

procedure TSTRPSalesByCustFrm.qrDelToFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PsQRLabel14.caption := 'Total Sales Value: ' + qrlblDelTo.caption;

  PsQRShape5.Left := PsQRLabel8.left;
  PsQRShape5.width := psqrlblCustTotal.left + psqrlblCustTotal.width - PsQRShape5.Left;
  PsQRShape6.left := PsQRShape2.Left;
  PsQRShape6.width := PsQRShape2.width;

  self.psqrlblCust2Total.Caption := CurrToStrF(self.CustomerTotal, ffCurrency, 2);

end;

procedure TSTRPSalesByCustFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Customer"'
    + ',"Rep"'
    + ',"Order No"'
    + ',"Order Date"'
    + ',"Customer Ref"'
    + ',"Description"'
    + ',"Product"';

  if ShowClientCodes then
    tempstr := tempstr + ',"Client Code"';

  tempstr := tempstr
    + ',"Quantity"'
    + ',"Branch Name"'
    + ',"Short Code"'
    + ',"No of boxes"'
    + ',"Pack Size"'
    + ',"Date Delivered"';

  if ShowListPrices then
    tempstr := tempstr + ',"List Price"' + ',"VAT"' + ',"Total List"';

  tempStr := tempstr
    + ',"Unit price"'
    + ',"Total Price"';

  if ShowClientCodes then
    tempstr := tempstr + ',"Retail Price"' +  ',"Total Retail"';

  tempstr := tempstr
    + ',"Delivery Location"'
    + ',"Cost Centre"';

  writeLn(self.exportFile, tempStr);
  self.qckrpSalesByProd.Prepare;

  CloseFile(self.exportFile);
end;

end.
