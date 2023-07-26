unit PBRPOSSInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Qrctrls, QuickRpt, ExtCtrls, CCSPrint, CCSCommon, PBSalesInvoiceDM,
  printers, qrprntr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPOSSInvFrm = class(TForm)
    qrReport: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    RepQRGroup: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    QRShape3: TQRShape;
    qryOSInvs: TFDQuery;
    QRLabel6: TQRLabel;
    QRLabel3: TQRLabel;
    oldqryDummy: TFDQuery;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    repQRGroup1: TQRGroup;
    qrlblGroupTitle: TQRLabel;
    qrdbGroupName: TQRDBText;
    qrGroupFooter: TQRBand;
    QRLabel15: TQRLabel;
    qryDummy: TFDQuery;
    qrlblGroupTotal: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    qrlblFooter: TQRLabel;
    QRLabel4: TQRLabel;
    QRChildBandStk: TQRChildBand;
    QRChildBandProd: TQRChildBand;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    qrlblQtyToInv: TQRLabel;
    QRDBText5: TQRDBText;
    qrlblInvUpfront: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrlblSalesValue: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLblQtyToInv2: TQRLabel;
    QRDBText14: TQRDBText;
    QRlblSalesValue2: TQRLabel;
    SQLGetStkInv: TFDQuery;
    QRLblQtyOrd: TQRLabel;
    QRLblPrcUnit: TQRLabel;
    QRLblSellPrc: TQRLabel;
    SQLGetStkInv_access: TFDQuery;
    SQLGetRepName: TFDQuery;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    qrlblSelection: TQRLabel;
    qrlblInclude: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure repQRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PrinterSettings: TPrinterSettings;
    bIs_Stock: Boolean;
    ShowJobBags: integer;
    function PrepareReport(customer, branch, rep, status: integer; orderBy: string): boolean;
    function GetPackQty(tempCode, tempLine: integer): integer;
  end;

var
  PBRPOSSInvFrm: TPBRPOSSInvFrm;

implementation

uses PBDatabase;

var
  grouptotal, reporttotal: real;
  
{$R *.DFM}

function TPBRPOSSInvFrm.PrepareReport(customer,
  branch, rep, status: integer; orderBy: string): boolean;
begin
  if bIs_Stock then
    QRChildBandProd.Parent := Nil
  else
    QRChildBandStk.Parent := Nil;

  self.qryOSInvs.Active := false;
  self.qryOSInvs.SQL.Clear;
  if not bIs_Stock then
    begin
      self.qryOSInvs.SQL.Text := self.qryDummy.SQL.Text;
      if customer <> 0 then
        self.qryOSInvs.SQL.Add(' and (purchase_orderline.customer = ' + IntToStr(Customer) + ') ');
      if rep <> -99 then
        self.qryOSInvs.SQL.Add(' and (purchase_orderline.rep = ' + IntToStr(rep) + ') ');

      if ShowJobBags = 1 then
        self.qryOSInvs.SQL.Add(' and (select Job_Bag from Job_Bag_Line_Dets '
                             + ' WHERE Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLine.Purchase_Order) is NULL ')
      else
      if ShowJobBags = 2 then
        self.qryOSInvs.SQL.Add(' and (select Job_Bag from Job_Bag_Line_Dets '
                             + ' WHERE Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLine.Purchase_Order) <> NULL ');

      if orderBy = 'REP' then
      begin
        self.qryOSInvs.SQL.Add(' ORDER BY rep.name, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line');
        repQRGroup1.expression := 'qryOSInvs.rep_name';
        qrdbGroupName.DataField := 'rep_name';
        qrlblGroupTitle.caption := 'Rep: ';
      end
      else
      if orderBy = 'CUSTOMER' then
      begin
        self.qryOSInvs.SQL.Add(' ORDER BY customer.name, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line');
        repQRGroup1.expression := 'qryOSInvs.Customer_Name';
        qrdbGroupName.DataField := 'Customer_Name';
        qrlblGroupTitle.caption := 'Customer: ';
      end
      else
      if orderBy = 'STATUS' then
      begin
        self.qryOSInvs.SQL.Add(' ORDER BY Purchase_OrderLine.Purch_Ord_Line_Status, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line');
        repQRGroup1.expression := 'qryOSInvs.Purch_ord_Line_Status';
        qrdbGroupName.DataField := 'Status_Description';
        qrlblGroupTitle.caption := 'Status: ';
      end
      else
      begin
        self.qryOSInvs.SQL.Add(' ORDER BY Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line');
        repQRGroup1.expression := '';
        qrdbGroupName.DataField := '';
        qrlblGroupTitle.caption := '';
        repqrGroup1.height := 8;
      end ;

      self.qryOSInvs.parambyname('Status').AsInteger := Status;

    end
    else
    begin
      if not dmBroker.isSQL then
        begin
          self.qryOSInvs.sql.Clear;
          self.qryOSInvs.sql.text := self.sqlGetStkInv_access.sql.text;
        end
      else
        self.qryOSInvs.SQL.Text := self.SQLGetStkInv.SQL.Text;
      QRLabel10.enabled := false;
//      QRLabel4.left := 688;
//      QRLabel12.left := 800;
      QRLabel3.caption := 'Price Unit';

      if customer <> 0 then
        self.qryOSInvs.SQL.Add(' and (Sales_Order.customer = ' + IntToStr(Customer) + ') ');
      if rep <> -99 then
        self.qryOSInvs.SQL.Add(' and (Sales_orderRep.rep = ' + IntToStr(rep) + ') ');
      if orderBy = 'REP' then
      begin
        self.qryOSInvs.SQL.Add(' ORDER BY rep_name, Sales_order.Sales_Order, Sales_Order_Line.Sales_Order_Line_No');
        repQRGroup1.expression := 'qryOSInvs.rep_name';
        qrdbGroupName.DataField := 'rep_name';
        qrlblGroupTitle.caption := 'Rep: ';
      end
      else
      if orderBy = 'CUSTOMER' then
      begin
        self.qryOSInvs.SQL.Add(' ORDER BY customer.name, Sales_order.Sales_Order, Sales_Order_Line.Sales_Order_Line_No');
        repQRGroup1.expression := 'qryOSInvs.Customer_Name';
        qrdbGroupName.DataField := 'Customer_Name';
        qrlblGroupTitle.caption := 'Customer: ';
      end
      else
      if orderBy = 'STATUS' then
      begin
        self.qryOSInvs.SQL.Add(' ORDER BY Sales_Order.Sales_Order_Head_Status, Sales_order.Sales_Order, Sales_Order_Line.Sales_Order_Line_No');
        repQRGroup1.expression := 'qryOSInvs.Sales_Order_Head_Status';
        qrdbGroupName.DataField := 'Status_Description';
        qrlblGroupTitle.caption := 'Status: ';
      end
      else
      begin
        self.qryOSInvs.SQL.Add(' ORDER BY Sales_order.Sales_Order, Sales_Order_Line.Sales_Order_Line_No');
        repQRGroup1.expression := '';
        qrdbGroupName.DataField := '';
        qrlblGroupTitle.caption := '';
        repqrGroup1.height := 8;
      end ;
    end;

  if bis_stock then
    self.qrlblTitle.Caption := 'Outstanding Stock CallOff/Invoice Report - ' + DateToStr(date())
  else
    self.qrlblTitle.Caption := 'Outstanding Buy Print/Invoice Report - ' + DateToStr(date());

  self.qryOSInvs.Active := true;
  Result := (self.qryOSInvs.RecordCount > 0);
end;

procedure TPBRPOSSInvFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  qtyToInv: integer;
  salesVAL: double;
  packqty: integer;
  PriceUnit: integer;
  PriceUnitDescr: string;
  PriceUnitFactor: integer;
  SellPrice: real;
begin
  if bIs_Stock then
    begin
    packqty := GetPackQty(self.qryOSInvs.FieldByName('Sales_order').asinteger,self.qryOSInvs.FieldByName('Sales_order_Line_No').asinteger);
    qtyToInv := self.qryOSInvs.FieldByName('Quantity_Delivered').asinteger - self.qryOSInvs.FieldByName('Quantity_Invoiced').asinteger;
    if self.qryOSInvs.fieldbyname('Price_unit').asstring = '' then
        begin
        PriceUnit := dmSalesInvoice.GetDefPriceUnit;
        PriceUnitDescr := dmSalesInvoice.GetPUnitDescription(PriceUnit);
        PriceUnitFactor := dmSalesInvoice.GetPUnitFactor(PriceUnit);
        end
      else
        begin
        PriceUnit := self.qryOSInvs.FieldByName('Price_Unit').Asinteger;
        PriceUnitDescr := self.qryOSInvs.FieldByName('Price_Unit_Description').AsString;
        PriceUnitFactor := self.qryOSInvs.FieldByName('Price_Unit_Factor').Asinteger;
        end;

    if PriceUnitFactor = 0 then
      begin
        SellPrice := self.qryOSInvs.FieldByName('Part_Sales_Price').Asfloat;
        SalesVal := SellPrice;
      end
    else
      begin
        SellPrice := (self.qryOSInvs.FieldByName('Part_Sales_Price').Asfloat / self.qryOSInvs.FieldByName('Sell_pack_Quantity').AsInteger) *
          PriceUnitFactor;
        SalesVal := (QtyToInv/PriceUnitFactor) * SellPrice;
      end;
    if packqty = 0 then
    begin
      qrlblQtyToInv2.Caption := FloatToStrF(qtyToInv, ffFixed, 15, 0);
      qrlblQtyord.Caption := self.qryOSInvs.FieldByName('Quantity_Ordered').asstring;
      qrlblPrcUnit.Caption := PriceUnitDescr;
      qrlblSellPrc.caption := FloatToStrF(SellPrice, ffCurrency, 15, 2);
    end
    else
    begin
      qrlblQtyToInv2.Caption := showinpacks(qtyToInv, Packqty);
      qrlblPrcUnit.Caption := IntToStr(packQty);
      qrlblQtyord.Caption := showinpacks(self.qryOSInvs.FieldByName('Quantity_Ordered').asInteger,Packqty);
      qrlblSellPrc.caption := FloatToStrF(SellPrice * PackQty, ffCurrency, 15, 2);
    end;
  QRLblSalesValue2.caption:= FloatToStrf(SalesVal, ffCurrency, 15, 2);
  end
  else
  begin
    if self.qryOSInvs.FieldByName('Ready_to_Invoice').asstring = 'Y' then
      qtyToInv := self.qryOSInvs.FieldByName('Quantity').asInteger - self.qryOSInvs.FieldByName('Qty_Invoiced').asInteger
    else
      qtyToInv := self.qryOSInvs.FieldByName('Qty_Delivered').asInteger - self.qryOSInvs.FieldByName('Qty_Invoiced').asInteger;

    qrlblQtyToInv.Caption := FloatToStrF(qtyToInv, ffFixed, 15, 0);

    if qryOSInvs.FieldByName('Price_Unit_Factor').asFloat = 0 then
      salesVAL := qryOSInvs.FieldByName('Selling_Price').asFloat
    else
      salesVAL := (qtyToInv/self.qryOSInvs.FieldByName('Price_Unit_Factor').asFloat) * self.qryOSInvs.FieldByName('Selling_Price').asFloat;

    qrlblSalesValue.caption := FloatToStrF(salesVAL, ffCurrency, 15, 2);

    if qryOSInvs.FieldByName('invoice_upfront').asstring = 'Y' then
      qrlblInvUpfront.caption := '***'
    else
      qrlblInvUpfront.caption := '';
  end;

  GroupTotal := GroupTotal + salesVal;
end;

procedure TPBRPOSSInvFrm.qrGroupFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblgrouptotal.caption := FloatToStrF(grouptotal, ffCurrency, 15, 2);
  reporttotal := reporttotal + grouptotal;
  printBand := (qrlblFooter.caption <> '');
end;

procedure TPBRPOSSInvFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    qrlblreporttotal.caption := FloatToStrF(reporttotal, ffCurrency, 15, 2);
end;

procedure TPBRPOSSInvFrm.qrGroupFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  grouptotal := 0.00;
end;

procedure TPBRPOSSInvFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrReport.PrinterSettings.Copies := Copies;   {set the output bin the }

  grouptotal := 0.00;
  reporttotal := 0.00;
(*  with qrReport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    Outputbin := PrinterSettings.OutputBin;
  end;
*)
end;

procedure TPBRPOSSInvFrm.repQRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (qrdbGroupName.Datafield <> '') and (qrdbGroupName.Datafield <> 'qrdbGroupName') then
    qrlblFooter.caption := 'Totals for: '+ qryOSInvs.fieldbyname(qrdbGroupName.Datafield).asstring
  else
    qrlblFooter.caption := '';
end;

function TPBRPOSSInvFrm.GetPackQty(tempCode, tempLine: integer): integer;
begin
 with dmSalesInvoice.qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      open;
      {if replenish from warehouse then PackQty set to 0}
      if fieldbyname('Replenish_source').asinteger = 2 then
        begin
          result := 0;
          exit;
        end;
    end;

  with dmSalesInvoice.qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempCode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Sell_Pack_Quantity').asinteger;
    end;
end;

procedure TPBRPOSSInvFrm.FormCreate(Sender: TObject);
begin
  dmSalesInvoice := TdmSalesInvoice.Create(Self);
end;

procedure TPBRPOSSInvFrm.FormDestroy(Sender: TObject);
begin
  dmSalesInvoice.free;
end;

end.
