unit PBRPOSSInvJobBags;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, CCSPrint, CCSCommon, PBSalesInvoiceDM,
  printers, qrprntr;

type
  TPBRPOSSInvJobBagsFrm = class(TForm)
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
    qrlblFooter: TQRLabel;
    QRChildBandProd: TQRChildBand;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    qrlblQtyToInv: TQRLabel;
    qrlblSalesValue: TQRLabel;
    SQLGetStkInv: TQuery;
    SQLGetStkInv_access: TQuery;
    SQLGetRepName: TQuery;
    qrlblSelection: TQRLabel;
    qrlblInclude: TQRLabel;
    qryPO: TQuery;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    qrlblSellUnit: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    qrlblSellingPrice: TQRLabel;
    QRGroup1: TQRGroup;
    qrJBGroupFooter: TQRBand;
    qrlblJBFooter: TQRLabel;
    qrlblJBTotal: TQRLabel;
    QRShape2: TQRShape;
    qrySO: TQuery;
    qrlblOrderNo: TQRLabel;
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
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrJBGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    function GetPOPriceUnitFactor(tempPO: real): integer;
    function GetPOPriceUnitDescription(tempPO: real): string;
    function GetPOSellingPrice(tempPO: real): integer;
    function GetSOSellingPrice(tempSO, tempLine: integer): real;
    function GetSOPackSize(tempSO, tempLine: integer): integer;
    { Private declarations }
  public
    IncludePOs: boolean;
    IncludeNotReady: boolean;
    ExcludeZeroValues: boolean;
    PrinterSettings: TPrinterSettings;
    function PrepareReport(customer, branch, rep: integer; orderBy: string): boolean;
    function GetPackQty(tempCode, tempLine: integer): integer;
  end;

var
  PBRPOSSInvJobBagsFrm: TPBRPOSSInvJobBagsFrm;

implementation

uses PBDatabase;

var
  grouptotal, reporttotal, JBTotal: real;
  
{$R *.DFM}

function TPBRPOSSInvJobBagsFrm.PrepareReport(customer,
  branch, rep: integer; orderBy: string): boolean;
begin
  self.qryOSInvs.Active := false;
  self.qryOSInvs.SQL.Clear;

  self.qryOSInvs.SQL.Text := self.qryDummy.SQL.Text;
  if customer <> 0 then
    self.qryOSInvs.SQL.Add(' and (Job_Bag.customer = ' + IntToStr(Customer) + ') ');

  if rep <> -99 then
    self.qryOSInvs.SQL.Add(' and (Job_Bag.rep = ' + IntToStr(rep) + ') ');


  {Show only those job bags ready for invoicing}
	if not IncludeNotReady then
    self.qryOSInvs.SQL.Add(' and (Job_Bag.Ready_For_Invoicing = ''Y'') ');

  {Exclude all zero value lines}
  self.qryOSInvs.SQL.Add(' and (Job_Bag_line_dets.Job_Bag_Line_Sell > 0) ');

  if not IncludePOs then
    self.qryOSInvs.SQL.Add(' and ((Job_Bag_line_dets.Job_Bag_Line_Type = ''S'') or (Job_Bag_line_dets.Job_Bag_Line_Type = ''A'') or (Job_Bag_line_dets.Job_Bag_Line_Type = ''R'')) ');

  if orderBy = 'REP' then
    begin
      self.qryOSInvs.SQL.Add(' ORDER BY rep.name, Job_Bag.Job_Bag, Job_Bag_line_dets.Job_Bag_line');
      repQRGroup1.expression := 'qryOSInvs.rep_name';
      qrdbGroupName.DataField := 'rep_name';
      qrlblGroupTitle.caption := 'Rep: ';
    end
  else
  if orderBy = 'CUSTOMER' then
    begin
      self.qryOSInvs.SQL.Add(' ORDER BY customer.name, Job_Bag.Job_Bag, Job_Bag_line_dets.Job_Bag_line');
      repQRGroup1.expression := 'qryOSInvs.Customer_Name';
      qrdbGroupName.DataField := 'Customer_Name';
      qrlblGroupTitle.caption := 'Customer: ';
    end
  else
    begin
      self.qryOSInvs.SQL.Add(' ORDER BY Job_Bag.Job_Bag, Job_Bag_line_dets.Job_Bag_line');
      repQRGroup1.expression := '';
      qrdbGroupName.DataField := '';
      qrlblGroupTitle.caption := '';
      repqrGroup1.height := 8;
    end ;

  self.qryOSInvs.Active := true;
  self.qrlblTitle.Caption := 'Outstanding Job Bag Invoicing Report - ' + DateToStr(date());
  Result := (self.qryOSInvs.RecordCount > 0);
end;

function TPBRPOSSInvJobBagsFrm.GetSOPackSize(tempSO, tempLine: integer): integer;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempSO;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Sell_Pack_Quantity').asinteger;
    end;
end;

function TPBRPOSSInvJobBagsFrm.GetSOSellingPrice(tempSO, tempLine: integer): real;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asinteger := tempSO;
      parambyname('Sales_Order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part_Sales_Price').asfloat;
    end;
end;

function TPBRPOSSInvJobBagsFrm.GetPOSellingPrice(tempPO: real): integer;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Selling_Price').asinteger;
    end;
end;

function TPBRPOSSInvJobBagsFrm.GetPOPriceUnitFactor(tempPO: real): integer;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

function TPBRPOSSInvJobBagsFrm.GetPOPriceUnitDescription(tempPO: real): string;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Price_Unit_Description').asstring;
    end;
end;

procedure TPBRPOSSInvJobBagsFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  qtyToInv: integer;
  salesVAL: double;
  packqty: integer;
  PriceUnit: integer;
  PriceUnitDescr: string;
  PriceUnitFactor: integer;
  PackSize: integer;
  SellPrice: real;
begin
  SalesVal := 0;
  if self.qryOSInvs.FieldByName('Job_Bag_Line_Type').asstring = 'P' then
    begin
      qtyToInv := self.qryOSInvs.FieldByName('Qty_Delivered').asInteger - self.qryOSInvs.FieldByName('Qty_Invoiced').asInteger;
      qrlblQtyToInv.Caption := FloatToStrF(qtyToInv, ffFixed, 15, 0);

      PriceUnitFactor := GetPOPriceUnitFactor(qryOSInvs.FieldByName('Purchase_Order').asfloat);
      SellPrice := GetPOSellingPrice(qryOSInvs.FieldByName('Purchase_Order').asfloat);
      qrlblSellingPrice.caption := FloatToStrF(sellPrice, ffCurrency, 15, 3);
      if PriceUnitFactor = 0 then
        begin
          salesVAL := (SellPrice/qryOSInvs.FieldByName('Quantity').asFloat)
                      * qtytoinv;
        end
      else
        salesVAL := (qtyToInv/PriceUnitFactor) * sellPrice;

      qrlblSalesValue.caption := FloatToStrF(salesVAL, ffCurrency, 15, 2);

      qrlblSellUnit.caption := GetPOPriceUnitDescription(qryOSInvs.FieldByName('Purchase_Order').asfloat);

      qrlblOrderNo.Caption := 'PO/'+qryOSInvs.FieldByName('Purchase_Order').asstring;

    end
  else
  if (self.qryOSInvs.FieldByName('Job_Bag_Line_Type').asstring = 'A') then
    begin
      qtyToInv := self.qryOSInvs.FieldByName('Job_Bag_Quantity').asInteger;
      qrlblQtyToInv.Caption := FloatToStrF(qtyToInv, ffFixed, 15, 0);

      qrlblSellingPrice.caption := FloatToStrF(qryOSInvs.FieldByName('Selling_Price').asFloat, ffCurrency, 15, 3);
      if qryOSInvs.FieldByName('Price_Unit_Factor').asFloat = 0 then
        salesVAL := qryOSInvs.FieldByName('Selling_Price').asFloat
      else
        salesVAL := (qtyToInv/self.qryOSInvs.FieldByName('Price_Unit_Factor').asFloat) * self.qryOSInvs.FieldByName('Selling_Price').asFloat;

      qrlblSalesValue.caption := FloatToStrF(salesVAL, ffCurrency, 15, 2);

      qrlblSellUnit.caption := self.qryOSInvs.FieldByName('Price_Unit_Description').AsString;

      qrlblOrderNo.Caption := '';
    end
  else
  if (self.qryOSInvs.FieldByName('Job_Bag_Line_Type').asstring = 'R') then
    begin
      qtyToInv := self.qryOSInvs.FieldByName('Job_Bag_Quantity').asInteger;
      qrlblQtyToInv.Caption := FloatToStrF(qtyToInv, ffFixed, 15, 0);

      qrlblSellingPrice.caption := FloatToStrF(qryOSInvs.FieldByName('Job_Bag_Line_Sell').asFloat, ffCurrency, 15, 3);
      salesVAL := qryOSInvs.FieldByName('Job_Bag_Line_Sell').asFloat;

      qrlblSalesValue.caption := FloatToStrF(salesVAL, ffCurrency, 15, 2);

      qrlblSellUnit.caption := self.qryOSInvs.FieldByName('Price_Unit_Description').AsString;

      qrlblOrderNo.Caption := '';
    end
  else
  if self.qryOSInvs.FieldByName('Job_Bag_Line_Type').asstring = 'S' then
    begin
      qtyToInv := self.qryOSInvs.FieldByName('Job_Bag_Quantity').asInteger;
      qrlblQtyToInv.Caption := FloatToStrF(qtyToInv, ffFixed, 15, 0);

      PackSize := GetSOPackSize(qryOSInvs.FieldByName('Sales_Order').asinteger,qryOSInvs.FieldByName('Sales_Order_Line_no').asinteger );
      SellPrice := GetSOSellingPrice(qryOSInvs.FieldByName('Sales_Order').asinteger,qryOSInvs.FieldByName('Sales_Order_Line_no').asinteger);
      qrlblSellingPrice.caption := FloatToStrF(sellPrice, ffCurrency, 15, 3);

      salesVAL := (qtyToInv/PackSize) * sellPrice;

      qrlblSalesValue.caption := FloatToStrF(salesVAL, ffCurrency, 15, 2);

      qrlblSellUnit.caption := inttostr(PackSize);

      qrlblOrderNo.Caption := 'SO/'+qryOSInvs.FieldByName('Sales_Order').asstring;

    end;

  JBTotal := JBTotal + salesVal;
  GroupTotal := GroupTotal + salesVal;
end;

procedure TPBRPOSSInvJobBagsFrm.qrGroupFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblgrouptotal.caption := FloatToStrF(grouptotal, ffCurrency, 15, 2);
  reporttotal := reporttotal + grouptotal;
  printBand := (qrlblFooter.caption <> '');
end;

procedure TPBRPOSSInvJobBagsFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    qrlblreporttotal.caption := FloatToStrF(reporttotal, ffCurrency, 15, 2);
end;

procedure TPBRPOSSInvJobBagsFrm.qrGroupFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  grouptotal := 0.00;
end;

procedure TPBRPOSSInvJobBagsFrm.qrReportBeforePrint(Sender: TCustomQuickRep;
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

procedure TPBRPOSSInvJobBagsFrm.repQRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (qrdbGroupName.Datafield <> '') and (qrdbGroupName.Datafield <> 'qrdbGroupName') then
    qrlblFooter.caption := 'Totals for: '+ qryOSInvs.fieldbyname(qrdbGroupName.Datafield).asstring
  else
    qrlblFooter.caption := '';
end;

function TPBRPOSSInvJobBagsFrm.GetPackQty(tempCode, tempLine: integer): integer;
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

procedure TPBRPOSSInvJobBagsFrm.FormCreate(Sender: TObject);
begin
  dmSalesInvoice := TdmSalesInvoice.Create(Self);
end;

procedure TPBRPOSSInvJobBagsFrm.FormDestroy(Sender: TObject);
begin
  dmSalesInvoice.free;
end;

procedure TPBRPOSSInvJobBagsFrm.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  JBTotal := 0;
  qrlblJBFooter.caption := 'Totals for Job Bag: ' + qryOSInvs.fieldbyname('Job_Bag').asstring;
  PrintBand := false;
end;

procedure TPBRPOSSInvJobBagsFrm.qrJBGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblJBTotal.caption := FloatToStrF(JBtotal, ffCurrency, 15, 2);
end;

end.
