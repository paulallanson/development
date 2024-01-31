unit PBRPStkMove;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, CCSPrint, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPStkMovefrm = class(TForm)
    QuickReport: TQuickRep;
    PageTitle: TQRBand;
    CustGroup: TQRGroup;
    QRSysData1: TQRSysData;
    QRLabel13: TQRLabel;
    qrlblTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    OrderDetail: TQRSubDetail;
    QRDBText1: TQRDBText;
    qryReport: TFDQuery;
    qryReportPurchase_Order: TFloatField;
    qryReportLine: TIntegerField;
    qryReportDelivery_no: TIntegerField;
    qryReportAd_hoc_Address: TIntegerField;
    qryReportSupplier: TIntegerField;
    qryReportBranch_no: TIntegerField;
    qryReportRep: TIntegerField;
    qryReportQty_to_Deliver: TFloatField;
    qryReportQty_Delivered: TFloatField;
    qryReportQty_Invoiced: TFloatField;
    qryReportDate_Point: TDateTimeField;
    qryReportBranch_No0: TIntegerField;
    qryReportCustomer: TIntegerField;
    qryReportDeliver_via_Company: TStringField;
    qryReportDate_Deliv_Actual: TDateTimeField;
    qryReportDelivery_to_Stock: TStringField;
    qryReportDelivery_note_printed: TStringField;
    qryReportOrder_Customer: TIntegerField;
    qryReportCustomer_Branch: TIntegerField;
    qryReportCust_order_no: TStringField;
    qryReportPurch_Ord_Line_Status: TIntegerField;
    qryReportSupplier_1: TIntegerField;
    qryReportSupplier_Branch: TIntegerField;
    qryReportSupplier_Name: TStringField;
    qryReportCustomer_Name: TWideStringField;
    qryReportOrder_Status: TStringField;
    qryReportQty_In: TIntegerField;
    qryReportQty_Out: TIntegerField;
    qryReportDeliveryName: TStringField;
    qryReportCustomers_Desc: TStringField;
    qryReportForm_Reference_ID: TStringField;
    qryReportPOrder: TStringField;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    FormRefGroup: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    qrdbQtyOut: TQRDBText;
    qryReportSelling_Price: TCurrencyField;
    qryReportSell_Unit: TIntegerField;
    qryReportSell_Unit_Descr: TStringField;
    qryReportPrice_Unit_Factor: TFloatField;
    QRDBText11: TQRDBText;
    lblSellValueIn: TQRLabel;
    FormRefFooter: TQRBand;
    CustFooter: TQRBand;
    QRLabel12: TQRLabel;
    lblFormSellTotalIn: TQRLabel;
    QRLabel14: TQRLabel;
    lblCustSellTotalIn: TQRLabel;
    QRShape2: TQRShape;
    AdhocSQL: TFDQuery;
    RepSQL: TFDQuery;
    SupplierSQL: TFDQuery;
    CompSQL: TFDQuery;
    CustomerSQL: TFDQuery;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel16: TQRLabel;
    qrdbDeliveryName: TQRDBText;
    lblCostValueIn: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QRLabel11: TQRLabel;
    QRShape6: TQRShape;
    lblSellValueOut: TQRLabel;
    lblCostValueOut: TQRLabel;
    lblFormCostTotalIn: TQRLabel;
    lblFormSellTotalOut: TQRLabel;
    lblFormCostTotalOut: TQRLabel;
    lblCustCostTotalIn: TQRLabel;
    lblCustSellTotalOut: TQRLabel;
    lblCustCostTotalOut: TQRLabel;
    qryReportOrder_Price: TCurrencyField;
    ReportGroup: TQRGroup;
    ReportGroupFooter: TQRBand;
    QRLabel5: TQRLabel;
    lblRepSellIn: TQRLabel;
    lblRepCostIn: TQRLabel;
    lblRepSellOut: TQRLabel;
    lblRepCostOut: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qryReportStock_Reference: TStringField;
    qrlblStockReference: TQRLabel;
    qryReportForm_Reference_Descr: TStringField;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    qrlblDateRange: TQRLabel;
    QRLabel19: TQRLabel;
    qrlblType: TQRLabel;
    qrlblTotalQtyIn: TQRLabel;
    qrlblTotalQtyOut: TQRLabel;
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qryReportPOrderGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryReportQty_OutGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryReportQty_InGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure OrderDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormRefFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormRefFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CustFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure CustFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qryReportCalcFields(DataSet: TDataSet);
    procedure ReportGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormRefGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    rFormTotalSellIn, rFormTotalCostIn, rCustTotalSellIn, rCustTotalCostIn: real;
    rFormTotalSellOut, rFormTotalCostOut, rCustTotalSellOut, rCustTotalCostOut: real;
    rrepTotalSellin, rrepTotalCostin, rrepTotalSellOut, rrepTotalCostOut: real;
    FormTotalQtyin, FormTotalQtyOut: integer;
  public
    { Public declarations }
    PrinterSettings: TPrinterSettings;
    hideCosts: boolean;
    hideSell: boolean;
    oneCustomer: boolean;
  end;

var
  PBRPStkMovefrm: TPBRPStkMovefrm;

implementation

{$R *.DFM}

procedure TPBRPStkMovefrm.QuickReportBeforePrint(Sender: TCustomQuickRep;
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
  end;
  CustGroup.Expression := 'qryReport.Customer_Name';
  FormRefGroup.Expression := 'qryReport.Form_Reference_ID';
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}

  if self.hideCosts then
  begin
    QRLabel10.enabled := false;
    lblCostValueIn.enabled := false;
    lblFormCostTotalIn.enabled := false;
    lblCustCostTotalIn.enabled := false;
    lblRepCostIn.enabled := false;

    QRLabel18.enabled := false;
    lblCostValueOut.enabled := false;
    lblFormCostTotalOut.enabled := false;
    lblCustCostTotalOut.enabled := false;
    lblRepCostOut.enabled := false;

    qrshape3.enabled := false;
    qrshape6.enabled := false;
  end;

  if self.hideSell then
  begin
    QRLabel6.enabled := false;
    lblSellValueIn.enabled := false;
    lblFormSellTotalIn.enabled := false;
    lblCustSellTotalIn.enabled := false;
    lblRepSellIn.enabled := false;

    QRLabel17.enabled := false;
    lblSellValueOut.enabled := false;
    lblFormSellTotalOut.enabled := false;
    lblCustSellTotalOut.enabled := false;
    lblRepSellOut.enabled := false;

    qrShape3.Enabled := false;
    qrShape4.Enabled := false;
    qrShape5.Enabled := false;
    qrShape6.Enabled := false;

    QRLabel11.enabled := false;
    QRLabel15.enabled := false;

    qrlabel7.caption := 'Quantity In';
    qrlabel9.caption := 'Quantity Out';

// move the quantity fields in
    qrlabel9.left := 452;
    qrlabel16.left := 566;
    qrdbDeliveryName.left := 566;
    qrdbQtyOut.left := 478;
    qrlblTotalQtyOut.caption := 'qrlblTotalQtyOut';
    qrlblTotalQtyOut.left := 426;
    qrshape8.width := 200;
    custfooter.Enabled := false;
    reportgroupfooter.enabled := false;

  end;

  rrepTotalSellin := 0.00;
  rrepTotalCostin := 0.00;
  rrepTotalSellOut := 0.00;
  rrepTotalCostOut := 0.00;

  FormTotalQtyOut := 0;
  FormTotalQtyIn := 0;

  qryReport.Open;
end;

procedure TPBRPStkMovefrm.qryReportPOrderGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReportPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryReportPurchase_Order.Asfloat,qryReportLine.AsInteger);
end;

procedure TPBRPStkMovefrm.qryReportQty_OutGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReport.fieldbyname('Delivery_to_Stock').asstring <> 'Y' then
    text := qryReport.fieldbyname('Qty_Delivered').asstring
  else
    text := '0';

end;

procedure TPBRPStkMovefrm.qryReportQty_InGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReport.fieldbyname('Delivery_to_Stock').asstring = 'Y' then
    text := qryReport.fieldbyname('Qty_Delivered').asstring
  else
    text := '0';

end;

procedure TPBRPStkMovefrm.OrderDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotalSell, rTotalCost: real;
begin
  with qryReport do
    begin
      if fieldbyname('Price_Unit_Factor').asinteger = 0 then
        rTotalSell := fieldbyname('Selling_Price').asfloat
      else
        rTotalSell := (fieldbyname('Qty_Delivered').asinteger / fieldbyname('Price_Unit_Factor').asinteger)
                      * fieldbyname('Selling_Price').asfloat;

      if fieldbyname('Price_Unit_Factor').asinteger = 0 then
        rTotalCost := fieldbyname('Order_Price').asfloat
      else
        rTotalCost := (fieldbyname('Qty_Delivered').asinteger / fieldbyname('Price_Unit_Factor').asinteger)
                      * fieldbyname('Order_Price').asfloat;

      {Delivery in to stock}
      if (fieldbyname('Delivery_to_Stock').asstring = 'Y') then
        begin
        lblSellValueIn.caption := formatfloat('0.00',rTotalSell);
        lblSellValueOut.caption := '0.00';
        lblCostValueIn.caption := formatfloat('0.00',rTotalCost);
        lblCostValueOut.caption := '0.00';
        rFormTotalSellIn := rFormTotalSellIn + rTotalSell;
        rFormTotalCostIn := rFormTotalCostIn + rTotalCost;
        FormTotalQtyIn := FormTotalQtyIn + fieldbyname('Qty_Delivered').asinteger;
        qrlblType.caption := 'Receipt into stock';
        end
      else
        begin
        lblSellValueOut.caption := formatfloat('0.00',rTotalSell);
        lblSellValueIn.caption := '0.00';
        lblCostValueOut.caption := formatfloat('0.00',rTotalCost);
        lblCostValueIn.caption := '0.00';
        rFormTotalSellOut := rFormTotalSellOut + rTotalSell;
        rFormTotalCostOut := rFormTotalCostOut + rTotalCost;
        FormTotalQtyOut := FormTotalQtyOut + fieldbyname('Qty_Delivered').asinteger;
        qrlblType.caption := 'Call off from stock';
        end;
    end;
end;

procedure TPBRPStkMovefrm.FormRefFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rCustTotalSellIn := rCustTotalSellIn + rFormTotalSellIn;
  rCustTotalCostIn := rCustTotalCostIn + rFormTotalCostIn;
  rFormTotalSellIn := 0;
  rFormTotalCostIn := 0;

  rCustTotalSellOut := rCustTotalSellout + rFormTotalSellout;
  rCustTotalCostout := rCustTotalCostout + rFormTotalCostout;
  rFormTotalSellout := 0;
  rFormTotalCostout := 0;
  FormTotalQtyin := 0;
  FormTotalQtyOut := 0;
end;

procedure TPBRPStkMovefrm.FormRefFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblFormSellTotalIn.caption := formatfloat('0.00',rFormTotalSellIn);
  lblFormCostTotalIn.caption := formatfloat('0.00',rFormTotalCostIn);

  lblFormSellTotalOut.caption := formatfloat('0.00',rFormTotalSellOut);
  lblFormCostTotalOut.caption := formatfloat('0.00',rFormTotalCostOut);

  qrlblTotalQtyIn.caption := inttostr(FormTotalQtyIn);
  qrlblTotalQtyOut.caption := inttostr(FormTotalQtyOut);
end;

procedure TPBRPStkMovefrm.CustFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rRepTotalSellIn := rRepTotalSellIn + rCustTotalSellIn;
  rRepTotalCostIn := rRepTotalCostIn + rCustTotalCostIn;

  rRepTotalSellOut := rRepTotalSellOut + rCustTotalSellOut;
  rRepTotalCostout := rRepTotalCostout + rCustTotalCostOut;

  rCustTotalSellIn := 0;
  rCustTotalCostIn := 0;

  rCustTotalSellOut := 0;
  rCustTotalCostOut := 0;
end;

procedure TPBRPStkMovefrm.CustFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblCustSellTotalIn.caption := formatfloat('0.00',rCustTotalSellIn);
  lblCustCostTotalIn.caption := formatfloat('0.00',rCustTotalCostIn);

  lblCustSellTotalOut.caption := formatfloat('0.00',rCustTotalSellOut);
  lblCustCostTotalOut.caption := formatfloat('0.00',rCustTotalCostOut);
end;

procedure TPBRPStkMovefrm.FormCreate(Sender: TObject);
begin
  rFormTotalSellIn := 0;
  rCustTotalSellIn := 0;
  rFormTotalCostIn := 0;
  rCustTotalCostIn := 0;

  rFormTotalSellOut := 0;
  rCustTotalSellOut := 0;
  rFormTotalCostOut := 0;
  rCustTotalCostOut := 0;

end;

procedure TPBRPStkMovefrm.qryReportCalcFields(DataSet: TDataSet);
begin
  if qryReport.FieldByName('Customer').AsString <> '' then
  begin
    with CustomerSQl do
    begin
      Close;
      ParamByName('Customer').AsInteger :=
        qryReport.FieldByName('Customer').AsInteger;
      ParamByName('Branch_no').AsInteger :=
        qryReport.FieldByName('Branch_no0').AsInteger;
      Open;

      qryReport.Fieldbyname('DeliveryName').asstring := fieldbyname('Branch_Name').asstring
(*      if onecustomer then
        qryReport.Fieldbyname('DeliveryName').asstring := fieldbyname('Branch_Name').asstring
      else
        qryReport.Fieldbyname('DeliveryName').asstring := fieldbyname('Customer_Name').asstring + '/' +
                                                      fieldbyname('Branch_Name').asstring;
*)
    end;
  end
  else
    if qryReport.FieldByName('Ad_hoc_Address').AsString <> '' then
    begin
      with AdhocSQl do
      begin
        Close;
        ParamByName('Ad_hoc_Address').AsInteger :=
          qryReport.FieldByName('Ad_hoc_Address').AsInteger;
        Open;
        qryReport.Fieldbyname('DeliveryName').asstring := fieldbyname('Name').asstring;
      end;
    end
    else
      if qryReport.FieldByName('Rep').AsString <> '' then
      begin
        with RepSQl do
        begin
          Close;
          ParamByName('Rep').AsInteger :=
            qryReport.FieldByName('Rep').AsInteger;
          Open;
          qryReport.Fieldbyname('DeliveryName').asstring := fieldbyname('Name').asstring;
        end;
      end
      else
        if qryReport.FieldByName('Supplier').AsString <> '' then
        begin
          with SupplierSQl do
          begin
            Close;
            ParamByName('Supplier').AsInteger :=
              qryReport.FieldByName('Supplier').AsInteger;
            ParamByName('Branch_no').AsInteger :=
              qryReport.FieldByName('Branch_no').AsInteger;
            Open;
            qryReport.Fieldbyname('DeliveryName').asstring := 'Held in Stock';
          end;
        end
        else
        begin
          with CompSQL do
          begin
            Close;
            Open;
            qryReport.Fieldbyname('DeliveryName').asstring := 'Held in Stock';
          end;
        end;
end;

procedure TPBRPStkMovefrm.ReportGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lblrepSellIn.caption := formatfloat('0.00',rrepTotalSellIn);
  lblrepCostIn.caption := formatfloat('0.00',rrepTotalCostIn);

  lblrepSellOut.caption := formatfloat('0.00',rrepTotalSellOut);
  lblrepCostOut.caption := formatfloat('0.00',rrepTotalCostOut);

end;

procedure TPBRPStkMovefrm.FormRefGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblStockReference.caption := '';
  if trim(qryReport.fieldbyname('Form_Reference_Descr').asstring) = '' then
    qrlblStockReference.caption := qryReport.fieldbyname('Stock_Reference').asstring
  else
    qrlblStockReference.caption := qryReport.fieldbyname('Stock_Reference').asstring + ' - '
                                  + qryReport.fieldbyname('Form_Reference_Descr').asstring;
end;

end.
