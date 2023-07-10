unit PBRPOSSInvPInvRecd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, CCSPrint, CCSCommon, PBSalesInvoiceDM,
  printers, qrprntr;

type
  TPBRPOSSInvPInvRecdFrm = class(TForm)
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
    qryOSInvs: TQuery;
    QRLabel6: TQRLabel;
    QRLabel3: TQRLabel;
    oldqryDummy: TQuery;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    repQRGroup1: TQRGroup;
    qrlblGroupTitle: TQRLabel;
    qrdbGroupName: TQRDBText;
    qrGroupFooter: TQRBand;
    QRLabel15: TQRLabel;
    qryDummy: TQuery;
    qrlblGroupTotal: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    qrlblFooter: TQRLabel;
    QRLabel4: TQRLabel;
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
    SQLGetStkInv: TQuery;
    SQLGetStkInv_access: TQuery;
    SQLGetRepName: TQuery;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    qrlblSelection: TQRLabel;
    qrlblInclude: TQRLabel;
    QRSysData2: TQRSysData;
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
    ShowJobBags: integer;
    ExcludeZeroValues: boolean;
    function PrepareReport(customer, branch, rep, status: integer; orderBy: string): boolean;
    function GetPackQty(tempCode, tempLine: integer): integer;
  end;

var
  PBRPOSSInvPInvRecdFrm: TPBRPOSSInvPInvRecdFrm;

implementation

uses PBDatabase;

var
  grouptotal, reporttotal: real;
  
{$R *.DFM}

function TPBRPOSSInvPInvRecdFrm.PrepareReport(customer,
  branch, rep, status: integer; orderBy: string): boolean;
begin
  self.qryOSInvs.Active := false;
  self.qryOSInvs.SQL.Clear;

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
  if orderBy = 'SUPPLIER' then
    begin
      self.qryOSInvs.SQL.Add(' ORDER BY Supplier.name, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line');
      repQRGroup1.expression := 'qryOSInvs.Supplier_Name';
      qrdbGroupName.DataField := 'Supplier_Name';
      qrlblGroupTitle.caption := 'Supplier: ';
    end
  else
  if orderBy = 'ACCOUNTMAN' then
    begin
      self.qryOSInvs.SQL.Add(' ORDER BY Operator.name, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line');
      repQRGroup1.expression := 'qryOSInvs.Account_Manager';
      qrdbGroupName.DataField := 'Account_Manager';
      qrlblGroupTitle.caption := 'A/C Manager: ';
    end
  else
    begin
      self.qryOSInvs.SQL.Add(' ORDER BY Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line');
      repQRGroup1.expression := '';
      qrdbGroupName.DataField := '';
      qrlblGroupTitle.caption := '';
      repqrGroup1.height := 8;
    end ;
  qryOSInvs.parambyname('status').asinteger := status;
  if self.ExcludeZeroValues then
    qryOSInvs.parambyname('Selling_Price').asfloat := 0.001
  else
    qryOSInvs.parambyname('Selling_Price').asfloat := 0.000;
    
  self.qryOSInvs.Active := true;
  Result := (self.qryOSInvs.RecordCount > 0);
end;

procedure TPBRPOSSInvPInvRecdFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
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

  GroupTotal := GroupTotal + salesVal;
end;

procedure TPBRPOSSInvPInvRecdFrm.qrGroupFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblgrouptotal.caption := FloatToStrF(grouptotal, ffCurrency, 15, 2);
  reporttotal := reporttotal + grouptotal;
  printBand := (qrlblFooter.caption <> '');
end;

procedure TPBRPOSSInvPInvRecdFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    qrlblreporttotal.caption := FloatToStrF(reporttotal, ffCurrency, 15, 2);
end;

procedure TPBRPOSSInvPInvRecdFrm.qrGroupFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  grouptotal := 0.00;
end;

procedure TPBRPOSSInvPInvRecdFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrReport.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
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

procedure TPBRPOSSInvPInvRecdFrm.repQRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (qrdbGroupName.Datafield <> '') and (qrdbGroupName.Datafield <> 'qrdbGroupName') then
    qrlblFooter.caption := 'Totals for: '+ qryOSInvs.fieldbyname(qrdbGroupName.Datafield).asstring
  else
    qrlblFooter.caption := '';
end;

function TPBRPOSSInvPInvRecdFrm.GetPackQty(tempCode, tempLine: integer): integer;
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

procedure TPBRPOSSInvPInvRecdFrm.FormCreate(Sender: TObject);
begin
  dmSalesInvoice := TdmSalesInvoice.Create(Self);
end;

procedure TPBRPOSSInvPInvRecdFrm.FormDestroy(Sender: TObject);
begin
  dmSalesInvoice.free;
end;

end.
