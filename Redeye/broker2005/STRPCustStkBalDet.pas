unit STRPCustStkBalDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Db, DBTables, CCSPrint, Qrctrls;

type
  TSTRPCustStkBalDetfrm = class(TForm)
    QuickReport: TQuickRep;
    qryReport: TQuery;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrbCustHeader: TQRGroup;
    QRSysData1: TQRSysData;
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
    ChildBand1: TQRChildBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    FormRefQRLabel: TQRLabel;
    QRLabel5: TQRLabel;
    DescQRLabel: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel3: TQRLabel;
    StkQRLabel: TQRLabel;
    QRLabel2: TQRLabel;
    lblPONumber: TQRLabel;
    lblDeliveryDate: TQRLabel;
    qrlblQuantity: TQRLabel;
    lblCustOrderNo: TQRLabel;
    qryLastDetails: TQuery;
    qryOrders: TQuery;
    qryGetOnOrd: TQuery;
    QRLblQtyOnOrd: TQRLabel;
    qryOrdersCust_Order_No: TStringField;
    qryOrdersPurchase_Order: TFloatField;
    qryOrdersQty_in_Stock: TFloatField;
    qryOrdersQuantity: TFloatField;
    qryOrdersForms_per_Box: TStringField;
    qryOrdersLast_Delivery: TDateTimeField;
    dtsReport: TDataSource;
    qryGetLastSO: TQuery;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    qrlblReorder: TQRLabel;
    qrlblTotalOrder: TQRLabel;
    qryLevels: TQuery;
    qryReportPart: TStringField;
    qryReportPart_Description: TStringField;
    qryReportCustomer: TIntegerField;
    qryReportName: TStringField;
    qryReportNot_In_Use: TStringField;
    qryReportProduct_Class: TStringField;
    qryReportFree_Stock: TIntegerField;
    function Getdetails(Sender: TObject): integer;
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
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
  STRPCustStkBalDetfrm: TSTRPCustStkBalDetfrm;

implementation

uses STRSCustStkBal;

var
  rCustTotal: real;
  
{$R *.DFM}

function TSTRPCustStkBalDetfrm.Getdetails(Sender: TObject): integer;
begin
  with qryReport do
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

procedure TSTRPCustStkBalDetfrm.QuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rCustTotal := 0.00;
  qryOrders.open;
//  qrbCustHeader.enabled := (qrlblSelection.caption = '');
  with quickreport.PrinterSettings do
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
end;

procedure TSTRPCustStkBalDetfrm.qrsdtlNumbersBeforePrint(Sender: TQRCustomBand;
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

procedure TSTRPCustStkBalDetfrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
lastdate : TDatetime;
 tempStr: string;
begin
  bserialnos := true;
  childband1.enabled := false;
  with GetSerNosSQl do
  begin
    close;
    paramByName('Part').AsString := qryReport.fieldByName('Part').AsString;
//    paramByName('Upfront').AsString := qryReport.fieldByName('Invoice_Upfront').AsString;
    open;
  end;
  lblCustOrderNo.caption := '';
  lblPONumber.caption := '';
  lblDeliveryDate.caption := '';
  QRLblTotalOrder.Caption := '';
  
  if qryOrdersQty_in_Stock.asstring = '' then
    begin
      with qryLastDetails do
        begin
          close;
          parambyname('Form_reference').asstring := qryreport.fieldbyname('Part').asstring;
          Open;
          lblCustOrderNo.caption := fieldbyname('Cust_Order_no').asstring;
          lblPONumber.caption := fieldbyname('Original_order').asstring;
          lastdate := fieldByName('Date_Deliv_Actual').asDateTime;
          lblDeliveryDate.caption := fieldbyname('Date_Deliv_Actual').asstring;
          QRLblTotalOrder.Caption := FormatFloat('#,##0',fieldByName('Quantity').asfloat);
        end;
    end
  else
    begin
      lblCustOrderNo.caption := qryOrdersCust_Order_no.asstring;
      lblPONumber.caption := qryOrdersPurchase_order.asstring;
      lastdate := qryOrdersLast_delivery.asDatetime;
      lblDeliveryDate.caption := qryOrdersLast_Delivery.asstring;
      QRLblTotalOrder.Caption := formatfloat('#,##0',qryOrdersQuantity.asfloat);
    end;
  if qryreport.fieldbyname('Free_stock').asstring = '' then
    qrlblQuantity.Caption := '0'
  else
    qrlblQuantity.Caption := formatfloat('#,##0',qryReport.fieldbyname('Free_stock').asfloat);
  with qryGetLastSO do
  begin
    close;
    ParamByName('Part').asString := qryreport.fieldbyname('Part').asString;
    Open;
    if fieldByName('Last_Sales_Date').asstring <> '' then
      if fieldByname('Last_Sales_Date').asDatetime > lastDate then
          lblDeliveryDate.Caption := fieldByname('Last_Sales_Date').asString;
  end;
  with qryGetOnOrd do
   begin
    close;
    parambyname('part').asstring := qryreport.fieldbyname('Part').asstring;
    Open;
   end;
  if qryGetOnOrd.fieldbyname('Quantity_On_Order').asstring = '' then
    qrlblQtyOnOrd.Caption := '0'
  else
    qrlblQtyOnOrd.Caption := formatfloat('#,##0',qryGetOnOrd.fieldbyname('Quantity_On_Order').asfloat);

  if (qryGetOnOrd.fieldbyname('Quantity_On_Order').asstring <> '0') and
    (qryGetOnOrd.fieldbyname('Quantity_On_Order').asstring <> '') then
    begin
      QRlblTotalOrder.caption := formatFloat('#,##0',qryGetOnOrd.fieldbyname('Total_on_order').asfloat);
    end;
  with qryLevels do
    begin
      close;
      parambyname('part').asstring := qryreport.fieldbyname('Part').asstring;
      open;
      qrlblReorder.caption := formatfloat('#,##0',fieldbyname('Reorder_level').asfloat);
    end;
    
  if self.exporting then
  begin
    tempStr := '"' + qryReport.FieldByName('Part').asString + '"';
    tempStr := tempStr+ ',"' + lblCustOrderNo.caption + '"';
    tempStr := tempStr+ ',"' + qryReport.FieldByName('Part_Description').asString + '"';
//    tempStr := tempStr+ ',"' + qryReport.fieldbyname('Invoice_upfront').asstring + '"';
    tempStr := tempStr+ ',"' + lblPONumber.caption + '"';
    tempStr := tempStr+ ',"' + lblDeliveryDate.caption + '"';
    tempStr := tempStr+ ',"' + qrlblQuantity.caption + '"';
    tempStr := tempStr+ ',"' + qrlblQtyOnOrd.caption + '"';
    writeln(self.exportFile, tempStr);
    STRSCustStkBalfrm.prgbrExport.StepIt;
  end;
end;

procedure TSTRPCustStkBalDetfrm.qrbCustHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 childband1.enabled := false;
end;

procedure TSTRPCustStkBalDetfrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Customer Order Ref"'
    + ',"Description"'
    + ',"Paid For"'
    + ',"Our Order"'
    + ',"LastDelivery"'
    + ',"In Stock"'
    + ',"On Order"';
  writeLn(self.exportFile, tempStr);
  self.QuickReport.Prepare;
  
  CloseFile(self.exportFile);
end;

end.
