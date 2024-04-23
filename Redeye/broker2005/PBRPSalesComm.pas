unit PBRPSalesComm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPSalesCommFrm = class(TForm)
    qckrpSalesByInv: TQuickRep;
    qrySalesComm: TFDQuery;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrdbtxtCustomer: TQRDBText;
    qrdbtxtCustsDesc: TQRDBText;
    qrdbtxtAccCode: TQRDBText;
    qrdbtxtInvDate: TQRDBText;
    QRBand1: TQRBand;
    RepQRGroup: TQRGroup;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    RepTotGoodsQRLbl: TQRLabel;
    GrpByQRDBText: TQRDBText;
    AddCostsQuery: TFDQuery;
    TotCstQRLbl: TQRLabel;
    GetCostsQuery: TFDQuery;
    RepTotCostQRLbl: TQRLabel;
    MarginQRLabel: TQRLabel;
    MargQRLbl: TQRLabel;
    RepMargQRLbl: TQRLabel;
    QRDBText2: TQRDBText;
    lblPayment: TQRLabel;
    lblPaidDate: TQRDBText;
    QRLabel6: TQRLabel;
    Commissionlbl: TQRLabel;
    RepTotCommLbl: TQRLabel;
    QRShape4: TQRShape;
    qrySalesCommCustomer: TIntegerField;
    qrySalesCommBranch_no: TIntegerField;
    qrySalesCommSales_Invoice: TIntegerField;
    qrySalesCommAccount_Code: TWideStringField;
    qrySalesCommName: TWideStringField;
    qrySalesCommRep_Name: TWideStringField;
    qrySalesCommSales_Invoice_No: TWideStringField;
    qrySalesCommGoods_Value: TCurrencyField;
    qrySalesCommVat_Value: TCurrencyField;
    qrySalesCommGoods_Total: TCurrencyField;
    qrySalesCommInvoice_Date: TDateTimeField;
    qrySalesCommInvoice_or_Credit: TWideStringField;
    qrySalesCommPaid_Date: TDateTimeField;
    qrySalesCommPaid_Amount: TCurrencyField;
    qrySalesCommPaid_Status: TWideStringField;
    qrySalesCommCommission_Rate: TFloatField;
    qrySalesCommReference: TWideStringField;
    qrySalesCommInvoice_Description: TWideStringField;
    qrySalesCommInvoiceRef: TWideStringField;
    qryGetPOCosts: TFDQuery;
    qryGetSOCosts: TFDQuery;
    qryAddPOCosts: TFDQuery;
    oldqryGetJBCosts: TFDQuery;
    qrySalesCommSales_Invoice_type: TWideStringField;
    qryGetJBCosts: TFDQuery;
    lblCommission: TQRLabel;
    TotGoodsQRLbl: TQRLabel;
    qryGetProdCosts: TFDQuery;
    qryCreditLines: TFDQuery;
    qryGetJBCrCosts: TFDQuery;
    qryGetSOCrCosts: TFDQuery;
    qryGetPOCrCosts: TFDQuery;
    ChildBand1: TQRChildBand;
    QRLabel18: TQRLabel;
    TotalGoodsLbl: TQRLabel;
    TotalCostLbl: TQRLabel;
    GrpMargQRLbl: TQRLabel;
    TotalCommLbl: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRChldBndSumm: TQRChildBand;
    QRLblRep: TQRLabel;
    QRlblNoOfInv: TQRLabel;
    QRLblNoOfCreds: TQRLabel;
    TotalCommLblSumm: TQRLabel;
    GrpMargQRLblSumm: TQRLabel;
    TotalCostLblSumm: TQRLabel;
    TotalGoodsLblSumm: TQRLabel;
    QRLblNoOfJobs: TQRLabel;
    QRLblTotInv: TQRLabel;
    QRLblTotCred: TQRLabel;
    QRLblTotJobs: TQRLabel;
    QRLabel1: TQRLabel;
    qryGetNoOfJobs: TFDQuery;
    qrySalesCommRep: TIntegerField;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRLabelComm: TQRLabel;
    qrySalesCommRep_Responsibility: TFloatField;
    qrlblCommSplit: TQRLabel;
    qryRepFinance: TFDQuery;
    qrlblInvoiceNo: TQRLabel;
    qrlblJobNumber: TQRLabel;
    qryGetPOSICharges: TFDQuery;
    qryGetMainPO: TFDQuery;
    qryGetCallOffInvoices: TFDQuery;
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
    procedure qrySalesCommInvoiceRefGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure RepQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRChldBndSummBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRChldBndSummAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
    fTotalByRep: Boolean;
    fTotalByCust: Boolean;
    FtotalBySupp: Boolean;
    fIsSummary: Boolean;
    fRepPgBrk: Boolean;
    function GetSIPOChargesCosts(tempSI, tempLine: integer; tempPO: real): real;
    procedure setTotalByCust(const Value: Boolean);
    procedure setTotalByRep(const Value: Boolean);
    procedure SettotalBySupp(const Value: Boolean);
    procedure setIsSummary(const Value: Boolean);
    procedure setRepPgBrk(const Value: Boolean);
    { Private declarations }
  public
    FinancialYear: integer;
    PrinterSettings: TPrinterSettings;
    RepsCommOnPaidInvs: boolean;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    property IsSummary: Boolean read fIsSummary write setIsSummary;
    property RepPgBrk: Boolean read fRepPgBrk write setRepPgBrk;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPSalesCommFrm: TPBRPSalesCommFrm;

implementation

uses PBDatabase, PBRSSalesComm;

var
  iTotal_Sell, iTotal_vat, iTotal_Cost, iTotal_Comm: real;
  RepTotal_Sell, RepTotal_vat, RepTotal_Cost, RepTotal_Comm, Comm_Rate: real;
  iNoofinv, iNoOfCred, iTotInv, iTotCred, iTotJob: integer;
  CommType, CommBasis: string;

{$R *.DFM}

procedure TPBRPSalesCommFrm.qckrpSalesByInvBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  lblPayment.enabled := RepsCommOnPaidInvs;
  lblPaidDate.enabled := RepsCommOnPaidInvs;

  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  iTotal_Comm := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;
  RepTotal_Comm := 0;
  iNoOfInv := 0;
  iNoofCred := 0;
  if IsSummary then
    begin
      ChildBand1.ParentBand := nil;
      Qrlabel2.Caption := '';
      QRLabel5.caption := 'Rep';
      QRLabel3.caption := '';
      QRLabel15.caption := '';
      QRLabel16.caption := '';
      QRLabel17.caption := '';
      QRLabel9.caption := '';
      QRLabel14.caption := '';
      lblpayment.enabled := false;
      lblPaidDate.enabled := false;
    end
  else
      begin
        QRChldBndSumm.ParentBand := nil;
        QRLabel1.enabled := false;
        QRLblTotinv.enabled := false;
        QRLblTotCred.enabled := false;
        QRLbltotJobs.Enabled := false;
        QrShape5.enabled := false;
        QRLabel7.caption := 'Order Ref';
//        QRLabel7.caption := '% Customer Responsibility';
        QRLabelcomm.Enabled := false;
      end;
   with qckrpSalesByInv.PrinterSettings do
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
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}
  qrySalesComm.Open;
  if TotalByRep then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesComm.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
      end;
  end;

procedure TPBRPSalesCommFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotalCost : real;
  rTotalSales: real;
  rTotalComm : real;
  rAddCost : real;
  rResponsibility: real;
  rOriginalOrder: real;
  iQty: integer;
  bMain: boolean;
begin
  printband := not(issummary);

  bMain := true;
  rAddCost := 0;
  rTotalCost := 0;
  if (qrySalesCommInvoice_or_Credit.asstring = 'I') or
     (qrySalesCommInvoice_or_Credit.asstring = '') then
    begin
    if qrySalesCommSales_Invoice_type.asstring = '' then
      begin

      {If call off order then check whether this is the last call off}
      if frac(qrySalesCommReference.AsFloat) > 0 then
        begin
          with qryGetMainPO do
            begin
              close;
              parambyname('Purchase_Order').asfloat := qrySalesCommReference.AsFloat;
              open;

              rOriginalOrder := fieldbyname('Original_Order').asfloat;

              if fieldbyname('Call_Off_Cost').asfloat > 0 then
                begin
                  {let this fall through and get processed in the normal way}
                  bMain := true;
                end
              else if (fieldbyname('Total_Call_Off_Quantity').asinteger < fieldbyname('Quantity').asinteger) then
                begin
//                  printband := false;
//                  exit;
                  rTotalCost := 0.00;
                end
              else
                begin
                  {Calcualte the cost from the original stock order}
                  if FieldByName('Stock_Order_Unit_Factor').asfloat <> 0 then
                    rTotalCost := (FieldByName('Quantity').asinteger / FieldByName('Stock_Order_Unit_Factor').asinteger)
                      * FieldByName('Stock_Order_Cost').asfloat
                  else
                    rTotalCost := FieldByName('Stock_Order_Cost').asfloat;

                  {Add the main stock order additional charges cost}
                  rTotalCost := rTotalCost + FieldByName('Total_Stock_Order_Charges').asfloat;

                  {Add the total call off additional charges cost}
                  rTotalCost := rTotalCost + FieldByName('Total_Call_Off_Charges').asfloat;

                  {Get Total Call Off invoice values}
                  with qryGetCallOffInvoices do
                    begin
                      close;
                      parambyname('Original_order').asfloat := rOriginalOrder;
                      parambyname('Purchase_order').asfloat := qrySalesCommReference.AsFloat;
                      open;

                      rTotalSales := fieldbyname('Total_Goods').asfloat + fieldbyname('Total_Charges').asfloat;
                    end;

                  bMain := false
                end;
            end;
        end;

      if bMain then
        begin
          with getCostsQuery do
            begin
              Close;
              ParamByName('Invoice_No').AsInteger :=qrySalesCommSales_Invoice.asInteger;
              Open;
              First;
              while not eof do
                begin
                  if FieldByName('Qty_Invoiced').asfloat < 0 then
//                    iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
                    iQty := PostoNegQty(FieldByName('Quantity').asinteger)
                  else
//                    iQty := FieldByName('Qty_Invoiced').asinteger;
                    iQty := FieldByName('Quantity').asinteger;

                  if FieldByName('Order_Unit_Factor').asfloat <> 0 then
                    rTotalCost := rTotalCost + (iQty / FieldByName('Order_Unit_Factor').asinteger)
                      * FieldByName('Order_Price').asfloat
                  else
                  try
                    rTotalCost := rTotalCost + ((FieldByName('Order_Price').asfloat / FieldByName('Quantity').asfloat)*iqty) ;
                  except
                    rTotalCost := rTotalCost + 0.00;
                  end;
                  next;
                end;
            end;

          with AddCostsQuery do
            begin
              Close;
              ParamByName('PurchOrder').AsFloat := qrySalesCommReference.AsFloat;
              open;
              rAddCost := fieldByName('Add_cost').AsFloat;
            end;
          rTotalCost := rTotalCost + rAddcost;
        end;
      end
    else
    if qrySalesCommSales_Invoice_type.asstring = 'S' then
      begin
      with qryGetPOCosts do
        begin
        Close;
        ParamByName('Sales_Invoice').AsInteger := qrySalesCommSales_Invoice.asInteger;
        Open;
        {either no Purchase Order exists for the stationery order or this is a Stock
        Call Off order}
        if recordcount = 0 then
          begin
            with qryGetSOCosts do
              begin
              Close;
              ParamByName('Sales_order').AsInteger := qrySalesCommReference.asInteger;
              ParamByName('Sales_invoice').AsInteger := qrySalesCommSales_Invoice.asInteger;
              Open;
              First;
              rTotalCost := fieldbyname('Total_Cost').asfloat;
              end;
          end
        else
          begin
            qryGetPOCosts.First;
            rTotalCost := qryGetPOCosts.fieldbyname('Total_Cost').asfloat;
            with qryAddPOCosts do
              begin
              Close;
              ParamByName('Purch_Ord').AsInteger := qryGetPOCosts.fieldbyname('Purch_ord').asInteger;
              Open;
              First;
              rTotalCost := rTotalCost + fieldbyname('Total_Cost').asfloat;
              end;
          end;
        end;
      end
    else
    if qrySalesCommSales_Invoice_type.asstring = 'J' then
      begin
      with qryGetJBCosts do
        begin
          Close;
          ParamByName('Sales_invoice').AsInteger :=qrySalesCommSales_Invoice.asInteger;
          Open;
          First;
          while not eof do
            begin
            if FieldByName('Purchase_order').asstring = '' then
              rTotalCost := rTotalCost + FieldByName('Job_Bag_Line_Cost').asfloat
            else
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
                      rTotalCost := rTotalCost + 0;
                    end;
                  end;

                if (FieldByName('Qty_Invoiced').asfloat <> 0) or (FieldByName('Goods_Value').asfloat <> 0) then
                  rTotalCost := rTotalCost + FieldByName('Extra_Cost').asfloat;
//                else

                rTotalCost := rTotalCost + GetSIPOChargesCosts(fieldbyname('Sales_invoice').asinteger, fieldbyname('invoice_line_no').asinteger, fieldbyname('Purchase_Order').asfloat)

              end;
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
        parambyname('Sales_invoice').asinteger := qrySalesCommSales_Invoice.asInteger;
        open;

        first;
        while eof <> true do
          begin
            {Don't get costs for a VAT Only Credit}
            if FieldByName('Credit_Type').asstring = 'V' then
              begin
                next;
                continue;
              end;
              
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
                    qryGetPOCrCosts.Close;
                    qryGetPOCrCosts.ParamByName('Sales_Order').AsInteger := fieldbyname('Sales_Order').asInteger;
                    qryGetPOCrCosts.ParamByName('Sales_Order_line_no').AsInteger := fieldbyname('Sales_Order_line_no').asInteger;
                    qryGetPOCrCosts.Open;

                    if qryGetPOCrCosts.recordcount = 0 then
                      begin
                        qryGetSOCrCosts.close;
                        qryGetSOCrCosts.ParamByName('Sales_Order').AsInteger := fieldbyname('Sales_Order').asInteger;
                        qryGetSOCrCosts.ParamByName('Sales_Order_line_no').AsInteger := fieldbyname('Sales_Order_line_no').asInteger;
                        qryGetSOCrCosts.Open;

                        rTotalCost := rTotalCost + ((iQty / qryGetSOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                          * qryGetSOCrCosts.FieldByName('Part_Cost').asfloat)*-1;
                      end
                    else
                      rTotalCost := rTotalCost + (((iQty / qryGetPOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                          * qryGetPOCrCosts.FieldByName('Purchase_Price').asfloat))*-1;
                  end
                else
                  rTotalCost := rTotalCost + 0.00;
              end;
            next;
          end;
      end;
    end;

//  rTotalCost := rTotalCost + rAddcost;
//  Set the amount of rep responsibility
  if qrySalesCommRep_Responsibility.asfloat = 0 then
    rResponsibility := 100
  else
    rResponsibility := qrySalesCommRep_Responsibility.asfloat;

  rTotalCost := rTotalCost * (rResponsibility/100);

  if bMain = false then
    rTotalSales := rTotalSales * (rResponsibility/100)
  else
    rTotalSales := qrySalesCommGoods_Value.asfloat * (rResponsibility/100);

  TotCstQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotalCost);
  TotGoodsQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rTotalSales);

  MargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rTotalSales - rTotalCost);

//  rTotalComm := ((rTotalSales - rTotalCost)*(qrySalesCommCommission_Rate.asfloat/100));
  rTotalComm := ((rTotalSales - rTotalCost)*(Comm_Rate/100));

//  qrlblCommSplit.caption := formatfloat('0',rResponsibility);

  {Display the POor SAles Order or Job Bag reference}
  if qrySalesComm.fieldbyname('Sales_Invoice_type').asstring = 'J' then
    qrlblJobNumber.caption := 'JB/'+ qrySalesComm.fieldbyname('Reference').asstring
  else
  if qrySalesComm.fieldbyname('Sales_Invoice_type').asstring = 'S' then
    qrlblJobNumber.caption := 'SO/'+ qrySalesComm.fieldbyname('Reference').asstring
  else
    qrlblJobNumber.caption := 'PO/'+ qrySalesComm.fieldbyname('Reference').asstring;

  CommissionLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rTotalComm);

  itotal_Comm := itotal_Comm + rTotalComm;
  itotal_Cost := itotal_Cost + rTotalCost;
  iTotal_Sell := iTotal_Sell + rTotalSales;
//  iTotal_Vat := iTotal_Vat + qrySalesCommVat_Value.asfloat;

  RepTotal_Comm := RepTotal_Comm + rTotalComm;
  RepTotal_Cost := RepTotal_Cost + rTotalCost;
  RepTotal_Sell := RepTotal_Sell + rTotalSales;
//  RepTotal_Vat := RepTotal_Vat + qrySalesCommVat_Value.asfloat;

  if qrySalesCommInvoice_or_Credit.asstring = 'C' then
    qrlblInvoiceNo.Caption := 'CN/'+ qrySalesCommSales_invoice_no.asstring
  else
    qrlblInvoiceNo.Caption := qrySalesCommSales_invoice_no.asstring;
end;

procedure TPBRPSalesCommFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  TotalSellLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Sell);
//  TotalVatLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Vat);
  if not IsSummary then
  begin
    TotalGoodsLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Sell));
    TotalCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Cost));
    GrpMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(iTotal_Sell)-iTotal_Cost);
    TotalCommLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Comm));
  end
  else
  begin
    TotalGoodsLblSumm.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Sell));
    TotalCostLblSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Cost));
    GrpMargQRLblSumm.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(iTotal_Sell)-iTotal_Cost);
    TotalCommLblSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Comm));
  end;
end;

procedure TPBRPSalesCommFrm.FormCreate(Sender: TObject);
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  iTotal_Comm := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;
  RepTotal_Comm := 0;
end;

procedure TPBRPSalesCommFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRlblTotinv.Caption := IntToStr(itotinv);
QRLblTotCred.Caption := IntToStr(itotcred);
QRLblTotJobs.caption := IntToStr(itotjob);
//  RepTotSellQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Sell);
//  RepTotVatQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Vat);
  RepTotGoodsQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(RepTotal_Sell));
  RepTotCostQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Cost);
   RepMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
  RepTotCommLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Comm);
end;

procedure TPBRPSalesCommFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPSalesCommFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPSalesCommFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
iTotal_Sell := 0;
iTotal_Vat := 0;
iTotal_Cost := 0;
iTotal_Comm := 0;
end;

procedure TPBRPSalesCommFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPSalesCommFrm.qrySalesCommInvoiceRefGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesCommInvoice_or_Credit.asstring = 'C' then
    text := 'CN/'+ qrySalesCommSales_invoice_no.asstring
  else
    text := qrySalesCommSales_invoice_no.asstring;

end;

procedure TPBRPSalesCommFrm.RepQRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblRep.Caption := qrySalesComm.fieldbyname('Rep_Name').asstring;
  
  with qryRepFinance do
    begin
      close;
      parambyname('rep').asinteger := qrySalesComm.fieldbyname('Rep').asinteger;
      parambyname('financial_year').asinteger  := FinancialYear;
      open;

      if recordcount > 0 then
        begin
          CommType := fieldbyname('Commission_type').asstring;

          Comm_Rate := fieldbyname('Commission_Rate').asfloat;
          CommBasis := 'P';

          lblCommission.Caption := formatfloat('0.00',comm_rate) + '%';
          qrlabelComm.Caption := formatfloat('0.00',comm_rate) + '%';
        end
      else
        begin
          Comm_Rate := qrySalesComm.fieldbyname('Commission_Rate').asfloat;
          lblCommission.caption := 'Commission rate: ' + formatfloat('0.00',qrySalesComm.fieldbyname('Commission_Rate').asfloat) + '%';
          QRlabelComm.caption :=formatfloat('0.00',qrySalesComm.fieldbyname('Commission_Rate').asfloat) + '%';
        end;
    end;

  printband := not(issummary);
end;

procedure TPBRPSalesCommFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if BandPrinted = false then exit;
  
  if qrySalesComm.fieldByName('Invoice_Or_Credit').asString = 'C' then
    iNoOfCred := iNoOfCred+1
  else
    iNoofInv := iNoOfInv + 1;
  QRLblRep.caption := qrySalesComm.fieldByName('Rep_Name').asstring;

  if self.exporting and not self.fIsSummary then
  begin
    //Rep
    tempStr := '"' + qrySalesComm.fieldbyname('Rep_Name').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Name').asstring + '"';

    //Account Code
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Account_Code').asstring + '"';

    //Invoice Ref
    tempStr := tempStr + ',"' + qrlblInvoiceNo.caption + '"';

    //Invoice Description
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Invoice_Description').asstring + '"';

    //Total Goods
    tempStr := tempStr + ',"' + TotGoodsQRlbl.caption + '"';

    //Cost
    tempStr := tempStr + ',"' + TotCstQRlbl.caption + '"';

    //Margin
    tempStr := tempStr + ',"' + Margqrlbl.caption + '"';

    //Invoice Date
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Invoice_Date').asstring + '"';


    //Paid Date
    tempStr := tempStr + ',"' + qrySalesComm.fieldbyname('Paid_Date').asstring + '"';


    //Commission
    tempStr := tempStr + ',"' + CommissionLbl.caption + '"';

    //Order Reference
    tempStr := tempStr + ',"' + qrlblJobNumber.caption + '"';

    (*    //Commission Spilt
    tempStr := tempStr + ',"' + qrlblCommSplit.caption + '"';
*)
    writeln(self.exportFile, tempStr);
    PBRSSalesCommfrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPSalesCommFrm.setIsSummary(const Value: Boolean);
begin
  fIsSummary := Value;
end;

procedure TPBRPSalesCommFrm.QRChldBndSummBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
with qryGetNoOfJobs do
 begin
  close;
  ParamByname('Date_from').asdatetime := PBRSSalesCommfrm.DateFrom;
  ParamByname('Date_To').asdatetime := PBRSSalesCommfrm.DateTo;
  ParamByName('Rep').asinteger := qrysalescomm.fieldByName('Rep').asInteger;
  open;
 end;
QRLblNoofJobs.Caption :=(qryGetNoOfJobs.fieldByname('no_jobs').asstring);
iTotJob := iTotJob + qryGetNoOfJobs.fieldByname('no_jobs').asinteger;
QRlblNoOfInv.Caption := IntToStr(inoofinv);
QRLblNoofcreds.Caption := intToStr(iNoofcred);
end;

procedure TPBRPSalesCommFrm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  iTotinv := 0;
  iTotCred := 0;
  iTotjob := 0;
end;

procedure TPBRPSalesCommFrm.QRChldBndSummAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting and self.fIsSummary then
  begin
    //Rep
    tempStr := '"' + qrlblrep.caption + '"';

    //Total Goods
    tempStr := tempStr + ',"' + TotalGoodslblSumm.caption + '"';

    //Cost
    tempStr := tempStr + ',"' + TotalCostlblSumm.caption + '"';

    //Margin
    tempStr := tempStr + ',"' + GrpMargQRlblSumm.caption + '"';

    //No of Invoices
    tempStr := tempStr + ',"' + qrlblNoofInv.Caption + '"';

    //No Of Credits
    tempStr := tempStr + ',"' + qrlblNoofCreds.caption + '"';

    //No of Jobs
    tempStr := tempStr + ',"' + qrlblNoofJobs.caption + '"';

    //Commission
    tempStr := tempStr + ',"' + TotalCommLblSumm.caption + '"';

    //Commission Spilt
    tempStr := tempStr + ',"' + qrLabelComm.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSSalesCommfrm.prgbrExport.StepIt;
  end;
  itotinv := itotinv + inoofinv;
  itotcred := itotcred + inoofcred;
  iNoOfInv := 0;
  iNoofCred := 0;
end;

procedure TPBRPSalesCommFrm.setRepPgBrk(const Value: Boolean);
begin
  fRepPgBrk := Value;
end;

procedure TPBRPSalesCommFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if fISSummary then
    tempstr := '"Rep"'
              + ',"Goods Total"'
              + ',"Cost Price"'
              + ',"Profit"'
              + ',"Invoice Count"'
              + ',"Credit Count"'
              + ',"Job Count"'
              + ',"Commission"'
              + ',"Commission Rate"'
  else
    tempstr := '"Rep"'
              + ',"Customer"'
              + ',"Account Code"'
              + ',"Invoice No"'
              + ',"Description"'
              + ',"Goods Value"'
              + ',"Cost"'
              + ',"Profit"'
              + ',"Invoice Date"'
              + ',"Paid Date"'
              + ',"Commission"'
              + ',"Order Ref"';

  writeLn(self.exportFile, tempStr);
  self.qckrpSalesByInv.Prepare;

  CloseFile(self.exportFile);
end;
function TPBRPSalesCommFrm.GetSIPOChargesCosts(tempSI, tempLine: integer;
  tempPO: real): real;
begin
  with qryGetPOSICharges do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := tempSI;
      parambyname('Invoice_Line_no').asinteger := tempLine;
      parambyname('Purchase_Order').asfloat := tempPO;
      open;
      result := fieldbyname('Total_Cost').asfloat;
    end;
end;

end.
