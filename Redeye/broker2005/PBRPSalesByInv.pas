unit PBRPSalesByInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, QuickRpt, Qrctrls, CCSCommon, qrprntr,
  printers, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPSalesByInvFrm = class(TForm)
    qckrpSalesByInv: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrdbtxtPOLine: TQRDBText;
    qrdbtxtAccCode: TQRDBText;
    qrdbtxtGoodsValue: TQRDBText;
    qrdbtxtGoodsVAT: TQRDBText;
    qrdbtxtGoodsTotal: TQRDBText;
    qrdbtxtInvDate: TQRDBText;
    qrdbtxtSupplier: TQRDBText;
    QRBand1: TQRBand;
    QRLabel18: TQRLabel;
    TotalSellLbl: TQRLabel;
    TotalVatlbl: TQRLabel;
    TotalGoodsLbl: TQRLabel;
    QRShape1: TQRShape;
    RepQRGroup: TQRGroup;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    RepTotSellQRLbl: TQRLabel;
    RepTotVatQRLbl: TQRLabel;
    RepTotGoodsQRLbl: TQRLabel;
    GrpByQRDBText: TQRDBText;
    AddCostsQuery: TFDQuery;
    TotCstQRLbl: TQRLabel;
    oldGetCostsQuery: TFDQuery;
    TotalCostLbl: TQRLabel;
    RepTotCostQRLbl: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    MarginQRLabel: TQRLabel;
    MargQRLbl: TQRLabel;
    GrpMargQRLbl: TQRLabel;
    RepMargQRLbl: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel19: TQRLabel;
    qrySalesbyInv: TFDQuery;
    qrySalesbyInvCustomer: TIntegerField;
    qrySalesbyInvBranch_no: TIntegerField;
    qrySalesbyInvSales_Invoice: TIntegerField;
    qrySalesbyInvAccount_Code: TWideStringField;
    qrySalesbyInvName: TWideStringField;
    qrySalesbyInvSales_Invoice_No: TWideStringField;
    qrySalesbyInvGoods_Value: TCurrencyField;
    qrySalesbyInvVat_Value: TCurrencyField;
    qrySalesbyInvGoods_Total: TCurrencyField;
    qrySalesbyInvInvoice_Date: TDateTimeField;
    qrySalesByInvInvoice_or_Credit: TWideStringField;
    qrySalesbyInvRep: TIntegerField;
    qrySalesbyInvSales_Invoice_type: TWideStringField;
    qrySalesbyInvInactive: TWideStringField;
    qrySalesbyInvReference: TWideStringField;
    qrySalesbyInvSupplier_Name: TWideStringField;
    qrySalesbyInvRep_Name: TWideStringField;
    qrySalesbyInvInvoiceRef: TWideStringField;
    qrySalesbyInvInvoice_Description: TWideStringField;
    qryGetPOCrCosts: TFDQuery;
    qryGetSOCosts: TFDQuery;
    qryAddPOCosts: TFDQuery;
    qrySalesbyInvSupplier_Desc: TWideStringField;
    qrySalesbyInvOrderDesc: TWideStringField;
    lblDescription: TQRLabel;
    qrlblPONumber: TQRLabel;
    oldqryGetJBCosts: TFDQuery;
    qryCreditLines: TFDQuery;
    qryGetJBCrCosts: TFDQuery;
    qryGetInvLine: TFDQuery;
    qryGetPOCosts: TFDQuery;
    qryGetSOCrCosts: TFDQuery;
    qryGetProdCosts: TFDQuery;
    qryGetInvAddChrg: TFDQuery;
    GetCostsQuery: TFDQuery;
    qryGetJbCosts: TFDQuery;
    InvCostQrLbl: TQRLabel;
    QRLabel12: TQRLabel;
    TotalInvCostlbl: TQRLabel;
    RepTotInvCostQrlbl: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    qrySalesbyInvBranch_Name: TWideStringField;
    qrySalesbyInvCust_Order_no: TWideStringField;
    qrySalesbyInvCustomer_Type_Description: TWideStringField;
    qrlblTotalBy: TQRLabel;
    qrlblBasedOnSubReps: TQRLabel;
    qrySalesbyInvAccount_Manager_Name: TWideStringField;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    qrySalesbyInvQuantity: TFloatField;
    qryGetJobBag: TFDQuery;
    procedure oldqrySalesByInvPOLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qckrpSalesByInvBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure oldqrySalesByInvInvoiceRefGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesbyInvInvoiceRefGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesbyInvSupplier_DescGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesbyInvCalcFields(DataSet: TDataSet);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndPageHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    fTotalByRep: Boolean;
    fTotalByCust: Boolean;
    FtotalBySupp: Boolean;
    exporting: boolean;
    exportFile: textFile;
    FUseSubReps: boolean;
    FtotalByAM: Boolean;
    FExcludeJBCosts: boolean;
    sPackFormat: string;
    sEnclosingType: string;
    procedure setTotalByCust(const Value: Boolean);
    procedure setTotalByRep(const Value: Boolean);
    procedure SettotalBySupp(const Value: Boolean);
    procedure SetUseSubReps(const Value: boolean);
    procedure SettotalByAM(const Value: Boolean);
    procedure SetExcludeJBCosts(const Value: boolean);
    procedure GetJobBagDetails(sJobBagNo: string);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    property ExcludeJBCosts: boolean read FExcludeJBCosts write SetExcludeJBCosts;
    property totalByAM : Boolean read FtotalByAM write SettotalByAM;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    property UseSubReps: boolean read FUseSubReps write SetUseSubReps;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPSalesByInvFrm: TPBRPSalesByInvFrm;

implementation

uses PBRSSalesByInv, PBRSSalesByProd, PBSalesInvoiceDm;

var
  iTotal_Sell, iTotal_vat, iTotal_Cost, iTotal_InvCost: real;
  RepTotal_Sell, RepTotal_vat, RepTotal_Cost, RepTotal_InvCost: real;

{$R *.DFM}

procedure TPBRPSalesByInvFrm.oldqrySalesByInvPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByinvReference.IsNull then
    text := ''
  else
    text := PBFormatPONum(qrySalesByInvReference.Asfloat,1);

end;

procedure TPBRPSalesByInvFrm.qckrpSalesByInvBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  iTotal_InvCost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;
  RepTotal_InvCost := 0;

  {set the printer to what the user selected}
  qckrpSalesByInv.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qckrpSalesByInv.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qckrpSalesByInv.PrinterSettings.Copies := Copies;   {set the output bin the }

  {if specific pages have been selected then set them up}
  with qckrpSalesByInv.PrinterSettings do
  begin
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
  end;

  qrySalesByInv.Open;
  if TotalByCust then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByInv.Customer';
      GrpByQRDBText.DataField := 'Name';
      end;
  if TotalBySupp then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByInv.Supplier_Name';
      GrpByQRDBText.DataField := 'Supplier_Desc';
      end;
  if TotalByRep then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByInv.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
    end;
  if TotalByAM then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByInv.Account_Manager_Name';
      GrpByQRDBText.DataField:= 'Account_Manager_Name';
    end;

  qrlblBasedOnSubReps.enabled := UseSubReps;
end;

procedure TPBRPSalesByInvFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotalCost, rTotalInvCost :real;
  iQty, iLineNo: integer;
  raddcost: real;
  iHeight: integer;
begin
  iTotal_Sell := iTotal_Sell + qrySalesByInvGoods_Value.asfloat;
  iTotal_Vat := iTotal_Vat + qrySalesByInvVat_Value.asfloat;
  RepTotal_Sell := RepTotal_Sell + qrySalesByInvGoods_Value.asfloat;
  RepTotal_Vat := RepTotal_Vat + qrySalesByInvVat_Value.asfloat;

  if totalByCust then
    lblDescription.caption := qrySalesByInvInvoice_Description.asstring
  else
    lblDescription.caption := qrySalesByInvName.asstring + cLFCR + qrySalesByInvInvoice_Description.asstring;

  qrlblPONumber.caption := '';

  rTotalCost := 0;
  rTotalInvCost := 0;

  with qryGetInvAddChrg do
  begin
    close;
    ParamByName('sales_invoice').asInteger := qrySalesByInvSales_Invoice.asInteger;
    open;

    while not eof do
    begin
      rTotalCost := rTotalCost + FieldByName('cost_price').asFloat;
      next;
    end;
    close;
  end;


  {only get the costs if invoice}
  if (qrySalesByInvInvoice_or_Credit.asstring = 'I') or
     (qrySalesByInvInvoice_or_Credit.asstring = '') then
    begin


    if qrySalesByInvSales_Invoice_type.asstring = '' then
      begin


      with getCostsQuery do
        begin
          Close;
          ParamByName('Sales_Invoice').AsInteger :=qrySalesByInvSales_Invoice.asInteger;
          Open;
          First;
          iLineNo := 0;
          while not eof do
            begin
            {Get the costs associated with the Purchase Order}
            if FieldByName('Invoice_Line_no').asinteger <> iLineNo then
              begin
                if FieldByName('Qty_Invoiced').asfloat < 0 then
//                  iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
                  iQty := PostoNegQty(FieldByName('Quantity').asinteger)
                else
//                  iQty := FieldByName('Qty_Invoiced').asinteger;
                  iQty := FieldByName('Quantity').asinteger;

                if FieldByName('Order_Unit_Factor').asfloat <> 0 then
                  rTotalCost := rTotalCost + (iQty / FieldByName('Order_Unit_Factor').asinteger)
                      * FieldByName('Order_Price').asfloat
                else
                  try
                    rTotalCost := rTotalCost + ((FieldByName('Order_Price').asfloat / FieldByName('Quantity').asfloat)*iqty) ;
                  except
                    rTotalCost := rTotalCost + 0
                  end;
              end;

            {Get the cost associated with the supplier invoice raised}
            if FieldByName('Qty_Purch_Invoiced').asfloat < 0 then
              iQty := PostoNegQty(FieldByName('Qty_Purch_Invoiced').asinteger)
            else
              iQty := FieldByName('Qty_Purch_Invoiced').asinteger;

            if fieldbyname('Supp_Invoice_status').AsInteger >= 20 then
              begin
                if FieldByName('Purch_Unit_Factor').asfloat <> 0 then
                  rTotalInvCost := rTotalInvCost + (iQty / FieldByName('Purch_Unit_Factor').asinteger)
                      * FieldByName('Purch_Price').asfloat
                else
                  rTotalInvCost := rTotalInvCost + (FieldByName('Purch_Price').asfloat) ;

                if iLineNo <> fieldbyname('Invoice_line_no').asinteger then
                  rTotalInvCost := rTotalInvCost + FieldByName('Purch_Extra_Cost').asfloat;
              end;

            iLineNo := FieldByName('Invoice_Line_no').asinteger;
            next;
            end;
        end;
      with AddCostsQuery do
        begin
          Close;
          ParamByName('PurchOrder').AsFloat := qrySalesByInvReference.AsFloat;
          open;
          rAddCost := fieldByName('Add_cost').AsFloat;
        end;
      rTotalCost := rTotalCost + rAddcost;
      end
    else
    if qrySalesByInvSales_Invoice_type.asstring = 'S' then
      begin
        with qryGetPOCosts do
          begin
            Close;
            ParamByName('Sales_Invoice').AsInteger := qrySalesByInvSales_Invoice.asInteger;
            Open;
            if recordcount = 0 then
              begin
                qrlblPONumber.caption := ''
              end
            else
              begin
                qrlblPONumber.caption := 'PO Number: '+qryGetPOCosts.fieldbyname('Purch_Ord_no').asstring;
              end;

            qryGetPOCosts.First;

            rTotalCost := rTotalCost + qryGetPOCosts.fieldbyname('Total_Cost').asfloat;
          end;

          with qryAddPOCosts do
            begin
              Close;
              ParamByName('Purch_Ord').AsInteger := qryGetPOCosts.fieldbyname('Purch_ord').asInteger;
              Open;
              First;
              rTotalCost := rTotalCost + fieldbyname('Total_Cost').asfloat;
            end;

          {either no Purchase Order exists for the stationery order or this is a Stock
          Call Off order}
          with qryGetSOCosts do
            begin
              Close;
              ParamByName('Sales_order').AsInteger := qrySalesByInvReference.asInteger;
              ParamByName('Sales_invoice').AsInteger := qrySalesByInvSales_Invoice.asInteger;
              Open;
              First;
              rTotalCost := rTotalCost + fieldbyname('Total_Cost').asfloat;
            end;
      end
    else
    if qrySalesByInvSales_Invoice_type.asstring = 'J' then
      begin
      with qryGetJBCosts do
        begin
          Close;
          ParamByName('Sales_invoice').AsInteger := qrySalesByInvSales_Invoice.asInteger;
          if ExcludeJBCosts then
            ParamByName('Line_Is_Internal_Cost').Asstring := 'N'
          else
            ParamByName('Line_Is_Internal_Cost').Asstring := 'Y';
          Open;
          First;
          iLineNo := 0;
          while not eof do
            begin
            if FieldByName('Purchase_order').asstring = '' then
              rTotalCost := rTotalCost + FieldByName('Job_Bag_Line_Cost').asfloat
            else
              begin
                {Get the costs associated with the Purchase Order}
                if iLineNo <> fieldbyname('Invoice_Line_no').asinteger then
                  begin
                    if FieldByName('Qty_Invoiced').asfloat < 0 then
                      iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
                    else
                      iQty := FieldByName('Qty_Invoiced').asinteger;

                    if FieldByName('Price_Unit_Factor').asfloat <> 0 then
                      rTotalCost := rTotalCost + (iQty / FieldByName('Price_Unit_Factor').asinteger)
                         * FieldByName('Order_Price').asfloat
                    else
                      begin
                        try
                          rTotalCost := rTotalCost + ((FieldByName('Order_Price').asfloat / FieldByName('Quantity').asfloat)*iqty) ;
                        except
                          rTotalCost := rTotalCost + 0 ;
                        end;
                      end;
                    rTotalCost := rTotalCost + FieldByName('Extra_Cost').asfloat;
                  end;

                {Get the costs associated with the supplier invoices raised}
                if FieldByName('Qty_Purch_Invoiced').asfloat < 0 then
                  iQty := PostoNegQty(FieldByName('Qty_Purch_Invoiced').asinteger)
                else
                  iQty := FieldByName('Qty_Purch_Invoiced').asinteger;

                if fieldbyname('Supp_Invoice_status').AsInteger >= 20 then
                  begin
                    if FieldByName('Purch_Unit_Factor').asfloat <> 0 then
                      rTotalInvCost := rTotalInvCost + (iQty / FieldByName('Purch_Unit_Factor').asinteger)
                        * FieldByName('Purch_Price').asfloat
                    else
                      rTotalInvCost := rTotalInvCost + (FieldByName('Purch_Price').asfloat);

                    if iLineNo <> fieldbyname('Invoice_line_no').asinteger then
                      rTotalInvCost := rTotalInvCost + FieldByName('Purch_Extra_Cost').asfloat;
                  end;
              end;

              iLineNo := fieldbyname('Invoice_Line_no').asinteger;
              next;
            end;
        end;
      end;
    end
  else
    {Credit Note costs}
    begin
    with qryCreditLines do
      begin
        close;
        parambyname('Sales_invoice').asinteger := qrySalesByInvSales_Invoice.asInteger;
        open;

        first;


        while eof <> true do
          begin
            if FieldByName('Qty_Invoiced').asfloat < 0 then
              iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
            else
              iQty := FieldByName('Qty_Invoiced').asinteger;

            if FieldbyName('Cost_Price').asfloat <> 0 then
              begin
                if FieldByName('Invoice_Unit_Factor').asfloat <> 0 then
                  rTotalCost := rTotalCost + (iQty / FieldByName('Invoice_Unit_Factor').asinteger)
                      * FieldByName('Cost_Price').asfloat
                else
                  rTotalCost := rTotalCost + FieldByName('Cost_Price').asfloat;
              end
            else
            if fieldbyname('Purchase_order').asfloat <> 0 then
              begin
                qryGetProdCosts.close;
                qryGetProdCosts.parambyname('Purchase_order').asfloat := fieldbyname('Purchase_order').asfloat;
                qryGetProdCosts.parambyname('Line').asinteger := fieldbyname('Line').asinteger;
                qryGetProdCosts.open;

                if  (FieldbyName('Credit_Type').asstring = 'Q') then
                  begin
                    if qryGetProdCosts.FieldByName('Order_Unit_Factor').asfloat <> 0 then
                      rTotalCost := rTotalCost + ((iQty / qryGetProdCosts.FieldByName('Order_Unit_Factor').asinteger)
                        * qryGetProdCosts.FieldByName('Order_Price').asfloat)*-1
                    else
                      try
                        rTotalCost := rTotalCost + (((qryGetProdCosts.FieldByName('Order_Price').asfloat / qryGetProdCosts.FieldByName('Quantity').asfloat)*iqty)*-1) ;
                      except
                        rTotalCost := rTotalCost + 0
                      end;
                  end
                else
                  rTotalCost := rTotalCost + 0;
              end
            else
            if fieldbyname('Job_Bag').asinteger <> 0 then
              begin
                qryGetJBCrCosts.close;
                qryGetJBCrCosts.parambyname('Job_Bag').asinteger := fieldbyname('Job_Bag').asinteger;
                qryGetJBCrCosts.parambyname('Job_bag_line').asinteger := fieldbyname('Job_Bag_Line').asinteger;
                qryGetJBCrCosts.open;

                if  (FieldbyName('Credit_Type').asstring = 'Q') then
                  rTotalCost := rTotalCost + (qryGetJBCrCosts.FieldByName('Job_Bag_Line_Cost').asfloat*-1)
                else
                  rTotalCost := rTotalCost + 0;
              end
            else
            if fieldbyname('Sales_Order').asinteger <> 0 then
              begin
                if  (FieldbyName('Credit_Type').asstring = 'Q') then
                  begin
                    {get an associated purchase order costs}
                    qryGetPOCrCosts.Close;
                    qryGetPOCrCosts.ParamByName('Sales_Order').AsInteger := fieldbyname('Sales_Order').asInteger;
                    qryGetPOCrCosts.ParamByName('Sales_Order_line_no').AsInteger := fieldbyname('Sales_Order_line_no').asInteger;
                    qryGetPOCrCosts.Open;

                    if qryGetPOCrCosts.recordcount > 0 then
                      begin
                        rTotalCost := rTotalCost + (((iQty / qryGetPOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                            * qryGetPOCrCosts.FieldByName('Purchase_Price').asfloat))*-1;
                      end;
                    {get any costs if this is a stock call off}
                    qryGetSOCrCosts.close;
                    qryGetSOCrCosts.ParamByName('Sales_Order').AsInteger := fieldbyname('Sales_Order').asInteger;
                    qryGetSOCrCosts.ParamByName('Sales_Order_line_no').AsInteger := fieldbyname('Sales_Order_line_no').asInteger;
                    qryGetSOCrCosts.Open;

                    if qryGetSOCrCosts.recordcount > 0 then
                      begin
                          rTotalCost := rTotalCost + ((iQty / qryGetSOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                            * qryGetSOCrCosts.FieldByName('Part_Cost').asfloat)*-1;
                      end;
                  end
                else
                  rTotalCost := rTotalCost + 0.00;
              end;
            next;
          end;
      end;
    end;

  InvCostQRLbl.Caption := formatfloat('#,###,##0.00;(#,###,##0.00)',rTotalInvCost);
  itotal_InvCost := itotal_InvCost + rTotalInvCost;
  repTotal_InvCost := RepTotal_InvCost + rTotalInvCost;

  TotCstQRLbl.Caption := formatfloat('#,###,##0.00;(#,###,##0.00)',rTotalCost);
  itotal_Cost := itotal_Cost + rTotalCost;
  repTotal_Cost := RepTotal_Cost + rTotalCost;

  MargQRLbl.Caption := formatfloat('###,##0.00;(#,###,##0.00)',qrySalesByInvGoods_Value.asfloat - rTotalCost);

  iheight := lblDescription.height + 1;
  if iHeight > 25 then
    qrsubdetail1.height := iheight
  else
    qrsubdetail1.height := 25;
end;

procedure TPBRPSalesByInvFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalSellLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',iTotal_Sell);
  TotalVatLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',iTotal_Vat);
  TotalGoodsLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',(iTotal_Sell+iTotal_VAT));
  TotalCostLbl.Caption := FormatFloat('#,###,##0.00;(#,###,##0.00)',(iTotal_Cost));
  TotalInvCostLbl.Caption := FormatFloat('#,###,##0.00;(#,###,##0.00)',(iTotal_InvCost));
  GrpMargQRLbl.Caption := formatfloat('#,###,##0.00;(#,###,##0.00)',(iTotal_Sell)-iTotal_Cost);
  end;

procedure TPBRPSalesByInvFrm.FormCreate(Sender: TObject);
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  iTotal_InvCost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;
  RepTotal_InvCost := 0;

  dmSalesInvoice := TdmSalesInvoice.create(self);
end;

procedure TPBRPSalesByInvFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepTotSellQRLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',RepTotal_Sell);
  RepTotVatQRLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',RepTotal_Vat);
  RepTotGoodsQRLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',(RepTotal_Sell+RepTotal_VAT));
  RepTotCostQRLbl.Caption := formatfloat('#,###,##0.00;(#,###,##0.00)',RepTotal_Cost);
  RepTotInvCostQRLbl.Caption := formatfloat('#,###,##0.00;(#,###,##0.00)',RepTotal_InvCost);
  RepMargQRLbl.Caption := formatfloat('#,###,##0.00;(#,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
end;

procedure TPBRPSalesByInvFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPSalesByInvFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPSalesByInvFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  iTotal_InvCost := 0;
end;

procedure TPBRPSalesByInvFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPSalesByInvFrm.oldqrySalesByInvInvoiceRefGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
    text := 'CN/'+ qrySalesByinvSales_invoice_no.asstring
  else
    text := qrySalesByinvSales_invoice_no.asstring;

end;

procedure TPBRPSalesByInvFrm.qrySalesbyInvInvoiceRefGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
    text := 'CN/'+ qrySalesByinvSales_invoice_no.asstring
  else
    text := qrySalesByinvSales_invoice_no.asstring;

end;

procedure TPBRPSalesByInvFrm.qrySalesbyInvSupplier_DescGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if trim(qrySalesByInvSupplier_Name.asstring) = '' then
    if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
      text := 'Stock Warehouse'
    else
      text := 'Multiple Suppliers'
  else
    text := qrySalesByInvSupplier_Name.asstring;
end;

procedure TPBRPSalesByInvFrm.qrySalesbyInvCalcFields(DataSet: TDataSet);
begin
  if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
    qrySalesByInvOrderDesc.asstring := 'SO/'+qrySalesByInvReference.asstring
  else
  if qrySalesByInvSales_Invoice_Type.asstring = 'J' then
    qrySalesByInvOrderDesc.asstring := 'JB/'+qrySalesByInvReference.asstring
  else
    qrySalesByInvOrderDesc.asstring := qrySalesByInvReference.asstring;

  if qrySalesByInvInvoice_or_credit.asstring = 'C' then
    qrySalesByInvOrderDesc.asstring := 'INV/'+qrySalesByInvReference.asstring
end;

procedure TPBRPSalesByInvFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if UseSubREps then
    tempStr := '"Order"'
    + ',"Customer"'
    + ',"Branch"'
    + ',"Description"'
    + ',"Inv. No."'
    + ',"Account Code"'
    + ',"Quantity"'
    + ',"Selling Price"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Inv. Date"'
    + ',"Cost Price"'
    + ',"Gross Profit Margin"'
    + ',"Purchase Inv Recd"'
    + ',"Customer Order Ref"'
    + ',"Supplier Name"'
    + ',"Customer Type"'
    + ',"Sub Rep Name"'
    + ',"Account Manager"'
    + ',"Pack Format"'
    + ',"Enclosing Type"'
  else
    tempStr := '"Order"'
    + ',"Customer"'
    + ',"Branch"'
    + ',"Description"'
    + ',"Inv. No."'
    + ',"Account Code"'
    + ',"Quantity"'
    + ',"Selling Price"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Inv. Date"'
    + ',"Cost Price"'
    + ',"Gross Profit Margin"'
    + ',"Purchase Inv Recd"'
    + ',"Customer Order Ref"'
    + ',"Supplier Name"'
    + ',"Customer Type"'
    + ',"Rep Name"'
    + ',"Account Manager"'
    + ',"Pack Format"'
    + ',"Enclosing Type"';

  writeLn(self.exportFile, tempStr);
  self.qckrpSalesByInv.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPSalesByInvFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr, tempStr2: string;
begin
  if self.exporting then
  begin
    //order No
    if qrySalesByInvInvoice_or_credit.asstring = 'C' then
    begin
      tempStr := '"INV/' + qrySalesByInvReference.asstring + '"'
    end
    else
    begin
      if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
        tempStr := '"SO/' + qrySalesByInvReference.asstring + '"'
      else if qrySalesByInvSales_Invoice_Type.asstring = 'J' then
        tempStr := '"JB/' + qrySalesByInvReference.asstring + '"'
      else
        tempStr := '"' + qrySalesByInvReference.asstring + '"';
    end;
    //customer name
    tempStr := tempStr + ',"' + qrySalesByInvName.asstring + '"';
    //customer Branch Name
    tempStr := tempStr + ',"' + qrySalesByInvBranch_Name.asstring + '"';
    //invoice description
    tempStr := tempStr + ',"' + qrySalesByInvInvoice_Description.asstring + '"';
    //invoice no
    if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
      tempStr := tempStr + ',"CN/'+ qrySalesByinvSales_invoice_no.asstring + '"'
    else
      tempStr := tempStr + ',"' + qrySalesByinvSales_invoice_no.asstring + '"';
    //account code
    tempStr := tempStr + ',"' + qrySalesbyInvAccount_Code.asString + '"';
    //Quantity
    tempStr := tempStr + ',"' + formatfloat('#,###,##0;(#,###,##0)',qrySalesbyInvQuantity.asFloat) + '"';
    //selling price
    tempStr := tempStr + ',"' + formatfloat('#,###,##0.00;(#,###,##0.00)',qrySalesbyInvGoods_Value.asFloat) + '"';
    //vat
    tempStr := tempStr + ',"' + formatfloat('#,###,##0.00;(#,###,##0.00)',qrySalesbyInvVat_Value.asFloat) + '"';
    //total
    tempStr := tempStr + ',"' + formatfloat('#,###,##0.00;(#,###,##0.00)',qrySalesbyInvGoods_Total.asFloat) + '"';
    //invoice date
    tempStr := tempStr + ',"' + qrySalesbyInvInvoice_Date.asString + '"';
    //cost price
    tempStr := tempStr + ',"' + TotCstQRLbl.Caption + '"';
    //gross profit margin
    tempStr := tempStr + ',"' + MargQRLbl.Caption + '"';
    //Purchase invoice received cost
    tempStr := tempStr + ',"' + invcostQRLbl.Caption + '"';
    //Customer Order Number
    tempStr := tempStr + ',"' + qrySalesbyInvCust_Order_No.asString + '"';
    //supplier name
    if trim(qrySalesByInvSupplier_Name.asstring) = '' then
      if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
        tempStr2 := 'Stock Warehouse'
      else
        tempStr2 := 'Multiple Suppliers'
    else
      tempStr2 := qrySalesByInvSupplier_Name.asstring;
    tempStr := tempStr + ',"' + tempStr2 + '"';
    //Customer Type
    tempStr := tempStr + ',"' + qrySalesbyInvCustomer_Type_Description.asString + '"';
    //repName
    tempStr := tempStr + ',"' + qrySalesbyInvRep_Name.asString + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qrySalesbyInvAccount_Manager_Name.asString + '"';

    sPackFormat := '';
    sEnclosingType := '';

    if qrySalesByInvSales_Invoice_Type.asstring = 'J' then
      begin
        GetJobBagDetails(qrySalesByInvReference.asstring);
      end;

    //Pack Format
    tempStr := tempStr + ',"' + sPackFormat + '"';

    //Enclosing Type
    tempStr := tempStr + ',"' + sEnclosingType + '"';

    writeln(self.exportFile, tempStr);
    PBRSSalesByInvFrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPSalesByInvFrm.qrbndPageHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if self.exporting then
  begin
    PBRSSalesByInvFrm.prgbrExport.Max :=
      qckrpSalesByInv.DataSet.RecordCount;
  end;
end;

procedure TPBRPSalesByInvFrm.SetUseSubReps(const Value: boolean);
begin
  FUseSubReps := Value;
end;

procedure TPBRPSalesByInvFrm.SettotalByAM(const Value: Boolean);
begin
  FtotalByAM := Value;
end;

procedure TPBRPSalesByInvFrm.SetExcludeJBCosts(const Value: boolean);
begin
  FExcludeJBCosts := Value;
end;

procedure TPBRPSalesByInvFrm.GetJobBagDetails(sJobBagNo: string);
begin
  with qryGetJobBag do
    begin
      close;
      try
        parambyname('Job_Bag').asinteger := strtoint(sJobBagNo) ;
      except
        parambyname('Job_Bag').asinteger := 0 ;
      end;
      open;

      sPackFormat := fieldbyname('Pack_Format_description').asstring;
      sEnclosingType := fieldbyname('Enclosing_Type').asstring;
    end;
end;

end.
