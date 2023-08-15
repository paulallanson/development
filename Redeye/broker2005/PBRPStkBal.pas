unit PBRPStkBal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, CCSPrint, CCSCommon, Math,
  QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPStkBalfrm = class(TForm)
    QuickReport: TQuickRep;
    PageTitle: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel13: TQRLabel;
    qrlblTitle: TQRLabel;
    FormRefQRLabel: TQRLabel;
    DescQRLabel: TQRLabel;
    StkQRLabel: TQRLabel;
    OrderDetail: TQRSubDetail;
    CustQRDBText: TQRDBText;
    qryReport: TFDQuery;
    QRShape1: TQRShape;
    RepTypeQRLabel: TQRLabel;
    FooterQRBand: TQRBand;
    CustnamQRLabel: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    FormIDQRDBText: TQRDBText;
    FormDescQRDBText: TQRDBText;
    lblFormsperBox: TQRLabel;
    lblBoxCount: TQRLabel;
    lblQtyinStock: TQRLabel;
    lblReorderLvl: TQRLabel;
    lblQtyonOrder: TQRLabel;
    dtsReport: TDataSource;
    qryOrders: TFDQuery;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    qryOrdersCust_Order_No: TStringField;
    qryOrdersPurchase_Order: TFloatField;
    qryOrdersQty_in_Stock: TFloatField;
    qryOrdersQuantity: TFloatField;
    qryOrdersForms_per_Box: TStringField;
    qryOrdersLast_Delivery: TDateTimeField;
    qryLastDetails: TFDQuery;
    lblCustOrderNo: TQRLabel;
    lblPONumber: TQRLabel;
    lblDeliveryDate: TQRLabel;
    lblQuantity: TQRLabel;
    QRLabel7: TQRLabel;
    lblPaidStock: TQRLabel;
    qryReportForm_Reference_ID: TWideStringField;
    qryReportForm_Reference_Descr: TWideStringField;
    qryReportStock_Reference: TWideStringField;
    qryReportReorder_Level: TIntegerField;
    qryReportForm_Reference: TIntegerField;
    qryReportCustomer_Name: TWideStringField;
    qryReportCustomer: TIntegerField;
    qryReportBranch_no: TIntegerField;
    qryReportStocked_Item: TStringField;
    qryReportQuantity_on_order: TFloatField;
    qryReportTotal_on_order: TFloatField;
    qryReportQuantity_in_stock: TFloatField;
    qryReportPaid_Stock: TFloatField;
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qryReportQty_OutGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryReportQty_InGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormTotQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure OrderDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qryOrdersQty_in_StockGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    PrinterSettings: TPrinterSettings;
  end;

var
  PBRPStkBalfrm: TPBRPStkBalfrm;

implementation

{$R *.DFM}

procedure TPBRPStkBalfrm.QuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   with quickreport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    OutputBin := PrinterSettings.OutputBin;
  end;
  qryReport.Open;
  qryOrders.open;
end;

procedure TPBRPStkBalfrm.qryReportQty_OutGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReport.fieldbyname('Delivery_to_Stock').asstring <> 'Y' then
    text := qryReport.fieldbyname('Qty_Delivered').asstring
  else
    text := '0';

end;

procedure TPBRPStkBalfrm.qryReportQty_InGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReport.fieldbyname('Delivery_to_Stock').asstring = 'Y' then
    text := qryReport.fieldbyname('Qty_Delivered').asstring
  else
    text := '0';

end;

procedure TPBRPStkBalfrm.FooterQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//PageNoQRLabel.Caption := 'Page: ' + IntToStr(QuickReport.PageNumber);
end;

procedure TPBRPStkBalfrm.FormTotQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rBoxcount: real;
begin
  lblQtyinStock.caption := inttostr(qryReport.fieldbyname('Quantity_in_Stock').asinteger);
  lblReorderLvl.caption := inttostr(qryReport.fieldbyname('Reorder_Level').asinteger);

  try
    lblFormsperBox.caption := inttostr(qryReport.Fieldbyname('Forms_per_Box').asinteger);
  except
    lblFormsperBox.caption := 'TBA';
  end;

  {Count Boxes}
  try
    rBoxcount := (qryReport.fieldbyname('Quantity_in_Stock').asinteger / qryReport.Fieldbyname('Forms_per_Box').asinteger);
    lblBoxCount.caption := inttostr(ceil(rBoxCount));
  except
    lblBoxCount.caption := '';
  end;
end;

procedure TPBRPStkBalfrm.OrderDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rBoxcount: real;
begin
  lblQtyinStock.caption := inttostr(qryReport.fieldbyname('Quantity_in_Stock').asinteger);
  lblQtyonOrder.caption := inttostr(qryReport.fieldbyname('Quantity_on_order').asinteger);
  lblReorderLvl.caption := inttostr(qryReport.fieldbyname('Reorder_Level').asinteger);

  try
    lblFormsperBox.caption := inttostr(qryReport.Fieldbyname('Forms_per_Box').asinteger);
  except
    lblFormsperBox.caption := 'TBA';
  end;

  {Count Boxes}
  try
    rBoxcount := (qryReport.fieldbyname('Quantity_in_Stock').asinteger / qryReport.Fieldbyname('Forms_per_Box').asinteger);
    lblBoxCount.caption := inttostr(ceil(rBoxCount));
  except
    lblBoxCount.caption := '';
  end;

end;

procedure TPBRPStkBalfrm.qryOrdersQty_in_StockGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (Sender as TField).asstring = '' then
    text := '0'
  else
    text := formatfloat('#,##0',(Sender as TField).asfloat)

end;

procedure TPBRPStkBalfrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblCustOrderNo.caption := '';
  lblPONumber.caption := '';
  lblDeliveryDate.caption := '';
  lblQuantity.caption := '';
  lblPaidStock.caption := '';
  if qryOrdersQty_in_Stock.asstring = '' then
    begin
      with qryLastDetails do
        begin
          close;
          parambyname('Form_reference').asinteger := qryreport.fieldbyname('Form_Reference').asinteger;
          Open;
          lblCustOrderNo.caption := fieldbyname('Cust_Order_no').asstring;
          lblPONumber.caption := fieldbyname('Original_order').asstring;
          lblDeliveryDate.caption := fieldbyname('Date_Deliv_Actual').asstring;
          lblQuantity.caption := formatFloat('#,##0',fieldbyname('Quantity').asfloat);
        end;
    end
  else
    begin
      lblCustOrderNo.caption := qryOrdersCust_Order_no.asstring;
      lblPONumber.caption := qryOrdersPurchase_order.asstring;
      lblDeliveryDate.caption := qryOrdersLast_Delivery.asstring;
      lblQuantity.caption := formatFloat('#,##0',qryOrdersQuantity.asfloat);
    end;
  if (qryReportQuantity_on_Order.asstring <> '0') and (qryReportQuantity_on_Order.asstring <> '') then
    begin
      lblQuantity.caption := formatFloat('#,##0',qryReport.fieldbyname('Total_on_order').asfloat);
    end;
    
  if (qryReportPaid_Stock.asstring <> '0') and (qryReportPaid_Stock.asstring <> '') then
    begin
      lblPaidStock.caption := formatFloat('#,##0',qryReport.fieldbyname('Paid_Stock').asfloat);
    end;
end;

end.
