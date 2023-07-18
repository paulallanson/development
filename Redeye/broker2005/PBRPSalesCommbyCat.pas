unit PBRPSalesCommbyCat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, DBTables, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects, qrprntr,
  printers;

type
  TPBRPSalesCommbyCatFrm = class(TForm)
    qckrpSalesByInv: TQuickRep;
    qrySalesComm: TQuery;
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
    RepGrpFoot: TQRBand;
    RepQRGroup: TQRGroup;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    RepTotGoodsQRLbl: TQRLabel;
    GrpByQRDBText: TQRDBText;
    AddCostsQuery: TQuery;
    GetCostsQuery: TQuery;
    RepTotCostQRLbl: TQRLabel;
    MarginQRLabel: TQRLabel;
    RepMargQRLbl: TQRLabel;
    lblPayment: TQRLabel;
    QRLabel6: TQRLabel;
    RepTotCommLbl: TQRLabel;
    QRShape4: TQRShape;
    qrySalesCommCustomer: TIntegerField;
    qrySalesCommBranch_no: TIntegerField;
    qrySalesCommSales_Invoice: TIntegerField;
    qrySalesCommAccount_Code: TStringField;
    qrySalesCommName: TStringField;
    qrySalesCommRep_Name: TStringField;
    qrySalesCommSales_Invoice_No: TStringField;
    qrySalesCommGoods_Value: TCurrencyField;
    qrySalesCommVat_Value: TCurrencyField;
    qrySalesCommGoods_Total: TCurrencyField;
    qrySalesCommInvoice_Date: TDateTimeField;
    qrySalesCommInvoice_or_Credit: TStringField;
    qrySalesCommPaid_Date: TDateTimeField;
    qrySalesCommPaid_Amount: TCurrencyField;
    qrySalesCommPaid_Status: TStringField;
    qrySalesCommCommission_Rate: TFloatField;
    qrySalesCommReference: TStringField;
    qrySalesCommInvoice_Description: TStringField;
    qrySalesCommInvoiceRef: TStringField;
    qryGetPOCosts: TQuery;
    qryGetSOCosts: TQuery;
    qryAddPOCosts: TQuery;
    oldqryGetJBCosts: TQuery;
    qrySalesCommSales_Invoice_type: TStringField;
    qryGetJBCosts: TQuery;
    qryGetProdCosts: TQuery;
    qryCreditLines: TQuery;
    qryGetJBCrCosts: TQuery;
    qryGetSOCrCosts: TQuery;
    qryGetPOCrCosts: TQuery;
    QRDtlBnd: TQRBand;
    ChildBand1: TQRChildBand;
    QRGroupProdCat: TQRGroup;
    QRBndProdCatGrpFoot: TQRBand;
    QRGrpInv: TQRGroup;
    QRBndInvGrpFoot: TQRBand;
    qrySalesCommInvoice_Line_No: TIntegerField;
    qrySalesCommCategory: TIntegerField;
    qrySalesCommPrice_Unit_Factor: TFloatField;
    qrySalesCommQty_Invoiced: TFloatField;
    qrdbtxtCustomer: TQRDBText;
    qrdbtxtCustsDesc: TQRDBText;
    QRDBText2: TQRDBText;
    qrdbtxtAccCode: TQRDBText;
    TotGoodsQRLbl: TQRLabel;
    TotCstQRLbl: TQRLabel;
    MargQRLbl: TQRLabel;
    qrdbtxtInvDate: TQRDBText;
    lblPaidDate: TQRDBText;
    Commissionlbl: TQRLabel;
    lblCommission: TQRLabel;
    GetCommRtQuery: TQuery;
    QryInvAddChrg: TQuery;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    QRLabel4: TQRLabel;
    QRLblTotPrdGoods: TQRLabel;
    QRLblTotPrdCst: TQRLabel;
    QRLblTotPrdMrg: TQRLabel;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    QRLabel18: TQRLabel;
    TotalGoodsLbl: TQRLabel;
    TotalCostLbl: TQRLabel;
    GrpMargQRLbl: TQRLabel;
    TotalCommLbl: TQRLabel;
    QRShape3: TQRShape;
    QRChldBndCatSumm: TQRChildBand;
    QRChldBndRepSumm: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLblCat: TQRLabel;
    QRLblTotPrdGoodsSumm: TQRLabel;
    QRLblTotPrdCstSumm: TQRLabel;
    QRLblTotPrdMrgSumm: TQRLabel;
    QRlblNoOfInv: TQRLabel;
    QRLblNoOfCreds: TQRLabel;
    TotalCommLblProdSumm: TQRLabel;
    TotalGoodsLblRepSumm: TQRLabel;
    TotalCostLblRepSumm: TQRLabel;
    GrpMargQRLblRepSumm: TQRLabel;
    QRLblInvRep: TQRLabel;
    QRlblCredRep: TQRLabel;
    TotalCommLblRepSumm: TQRLabel;
    QRShape6: TQRShape;
    QRLblTotInv: TQRLabel;
    QRLblTotCred: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRLabelComm: TQRLabel;
    qrySalesCommRep_Responsibility: TFloatField;
    qrlblCommSplit: TQRLabel;
    qryGetRepCatComm: TQuery;
    qrySalesCommRep: TIntegerField;
    qryRepFinance: TQuery;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabelCommType: TQRLabel;
    procedure qckrpSalesByInvBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure RepGrpFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepGrpFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrySalesCommInvoiceRefGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBndProdCatGrpFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBndInvGrpFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupProdCatBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBndInvGrpFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBndProdCatGrpFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRChldBndCatSummAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRChldBndCatSummBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChldBndRepSummAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRChldBndRepSummBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    fTotalByRep: Boolean;
    fTotalByCust: Boolean;
    FtotalBySupp: Boolean;
    fCommbycat: Boolean;
    fIsSummary: Boolean;
    fRepPgBrk: Boolean;
    procedure setTotalByCust(const Value: Boolean);
    procedure setTotalByRep(const Value: Boolean);
    procedure SettotalBySupp(const Value: Boolean);
    procedure SetcommbyCat(const Value: Boolean);
    procedure setIsSummary(const Value: Boolean);
    procedure setRepPgBrk(const Value: Boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    RepsCommOnPaidInvs: boolean;
    FinancialYear: integer;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    property commbycat: Boolean read fCommbycat write SetcommbyCat;
    property IsSummary: Boolean read fIsSummary write setIsSummary;
    property RepPgBrk: Boolean read fRepPgBrk write setRepPgBrk;
  end;

var
  PBRPSalesCommbyCatFrm: TPBRPSalesCommbyCatFrm;

implementation

uses PBRSSalesComm;

var
  rTotalGoods4Rep, rTotalCost4Rep, rTotalComm4Rep, rInvCost, rInvGoods, rCatCost, rCatGoods, rcatcomm: real;
  RepTotal_Sell, RepTotal_Cost, RepTotal_Comm, comm_Rate: real;
  iNoofinv, iNoOfCred, iTotInv, iTotCred, iTotInvRep, iTotCredRep: integer;
  commBasis, commType: string;


{$R *.DFM}

procedure TPBRPSalesCommbyCatFrm.qckrpSalesByInvBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  lblPayment.enabled := RepsCommOnPaidInvs;
  lblPaidDate.enabled := RepsCommOnPaidInvs;
  
  rTotalGoods4Rep := 0;
  rTotalCost4Rep := 0;
  rTotalComm4Rep := 0;
  RepTotal_Sell := 0;
  RepTotal_Cost := 0;
  RepTotal_Comm := 0;
  rCatComm := 0;
    iNoOfInv := 0;
  iNoofCred := 0;
  if IsSummary then
    begin
      ChildBand2.ParentBand := nil;
      ChildBand3.ParentBand := nil;
      RepQRGroup.ForceNewPage := RepPgBrk;
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
      QRGroupprodcat.height := 0;
      QRBndInvGrpFoot.Height := 0;
    end
  else
      begin
        QRChldBndCatSumm.ParentBand := nil;
        QRChldBndRepSumm.ParentBand := nil;
        QRLabel1.enabled := false;
        QRLblTotinv.enabled := false;
        QRLblTotCred.enabled := false;
        QRShape7.enabled := false;
        QRLabel7.caption := '% Customer Responsibility';
        QRLabelComm.enabled := false;
      end;

  {set the printer to what the user selected}
  qckrpSalesByInv.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qckrpSalesByInv.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qckrpSalesByInv.PrinterSettings.Copies := Copies;   {set the output bin the }
(*   with qckrpSalesByInv.PrinterSettings do
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
*)
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}
  qrySalesComm.Open;
  if TotalByRep then
    begin
      RepGrpFoot.enabled := True;
      RepQRGroup.Expression := 'QRYSalesComm.Rep_Name';
      GrpByQRDBText.DataField:= 'Rep_Name';
      end;
  end;

procedure TPBRPSalesCommbyCatFrm.RepGrpFootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not IsSummary then
    begin
      TotalGoodsLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep));
      TotalCostLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalCost4Rep));
      GrpMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep)-rTotalCost4Rep);
      TotalCommLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalComm4Rep));
    end
  else
    begin
      TotalGoodsLblRepSumm.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep));
      TotalCostLblRepSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalCost4Rep));
      GrpMargQRLblRepSumm.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rTotalGoods4Rep)-rTotalCost4Rep);
      TotalCommLblRepSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rTotalComm4Rep));
    end
  end;

procedure TPBRPSalesCommbyCatFrm.FormCreate(Sender: TObject);
begin
  rTotalGoods4Rep := 0;
  rTotalCost4Rep := 0;
  rTotalComm4Rep := 0;
  RepTotal_Sell := 0;
  RepTotal_Cost := 0;
  RepTotal_Comm := 0;
end;

procedure TPBRPSalesCommbyCatFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRlblTotinv.Caption := IntToStr(itotinv);
  QRLblTotCred.Caption := IntToStr(itotcred);
  RepTotGoodsQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(RepTotal_Sell));
  RepTotCostQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Cost);
   RepMargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
  RepTotCommLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Comm);
   end;

procedure TPBRPSalesCommbyCatFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPSalesCommbyCatFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRPSalesCommbyCatFrm.RepGrpFootAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
RepTotal_Sell := RepTotal_Sell + rTotalGoods4Rep;
RepTotal_Cost := RepTotal_Cost + rTotalCost4Rep;
RepTotal_Comm := RepTotal_Comm + rTotalComm4Rep;
rTotalGoods4Rep := 0;
rTotalCost4Rep := 0;
rTotalComm4Rep := 0;
end;

procedure TPBRPSalesCommbyCatFrm.SettotalBySupp(const Value: Boolean);
begin
  FtotalBySupp := Value;
end;

procedure TPBRPSalesCommbyCatFrm.qrySalesCommInvoiceRefGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesCommInvoice_or_Credit.asstring = 'C' then
    text := 'CN/'+ qrySalesCommSales_invoice_no.asstring
  else
    text := qrySalesCommSales_invoice_no.asstring;

end;

procedure TPBRPSalesCommbyCatFrm.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rCost :real;
  rComm :real;
  rGoods : real;
  iQty: integer;
  raddcost: real;
  rResponsibility: real;
begin

  rAddCost := 0;
  rCost := 0;
  rGoods := 0;

  if (qrySalesCommInvoice_or_Credit.asstring = 'I') or
     (qrySalesCommInvoice_or_Credit.asstring = '') then
    begin
    if qrySalesCommSales_Invoice_type.asstring = '' then
      begin
      with getCostsQuery do
        begin
          Close;
          ParamByName('Invoice_No').AsInteger :=qrySalesCommSales_Invoice.asInteger;
          ParamByName('Line_No').AsInteger := qrySalesCommInvoice_Line_No.asinteger;
          Open;
          First;
          while not eof do
            begin
            if FieldByName('Qty_Invoiced').asfloat < 0 then
//              iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
              iQty := PostoNegQty(FieldByName('Quantity').asinteger)
            else
//              iQty := FieldByName('Qty_Invoiced').asinteger;
              iQty := FieldByName('Quantity').asinteger;

            if FieldByName('Order_Unit_Factor').asfloat <> 0 then
              rCost := rCost + (iQty / FieldByName('Order_Unit_Factor').asinteger)
                      * FieldByName('Order_Price').asfloat
            else
            try
              rCost := rCost + ((FieldByName('Order_Price').asfloat / FieldByName('Quantity').asfloat)*iqty) ;
            except
              rCost := rCost + 0.00;
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
      rCost := rCost + rAddcost;
      end
    else
    if qrySalesCommSales_Invoice_type.asstring = 'S' then
      begin
      with qryGetPOCosts do
        begin
        Close;
        ParamByName('Sales_Invoice').AsInteger := qrySalesCommSales_Invoice.asInteger;
        ParamByName('Line_No').AsInteger := qrySalesCommInvoice_Line_No.asinteger;
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
              ParamByName('Line_No').AsInteger := qrySalesCommInvoice_Line_No.asinteger;
              Open;
              First;
              rCost := fieldbyname('Total_Cost').asfloat;
              end;
          end
        else
          begin
            qryGetPOCosts.First;
            rCost := qryGetPOCosts.fieldbyname('Total_Cost').asfloat;
            with qryAddPOCosts do
              begin
              Close;
              ParamByName('Purch_Ord').AsInteger := qryGetPOCosts.fieldbyname('Purch_ord').asInteger;
              Open;
              First;
              rCost := rCost + fieldbyname('Total_Cost').asfloat;
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
          ParamByName('Line_No').AsInteger := qrySalesCommInvoice_Line_No.asinteger;
          Open;
          First;
          while not eof do
            begin
            if FieldByName('Purchase_order').asstring = '' then
              rCost := rCost + FieldByName('Job_Bag_Line_Cost').asfloat
            else
              begin
              if FieldByName('Qty_Invoiced').asfloat < 0 then
                 iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
              else
                 iQty := FieldByName('Qty_Invoiced').asinteger;

              if FieldByName('Price_Unit_Factor').asfloat <> 0 then
                 rCost := rCost + (iQty / FieldByName('Price_Unit_Factor').asinteger)
                       * FieldByName('Order_Price').asfloat
              else
                begin
                  try
                    rCost := rCost + ((FieldByName('Order_Price').asfloat / FieldByName('Quantity').asfloat)*iqty) ;
                  except
                    rCost := rCost + 0;
                  end;
                end;

              rCost := rCost + FieldByName('Extra_Cost').asfloat;
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
        parambyname('Invoice_No').asinteger := qrySalesCommSales_Invoice.asInteger;
        ParamByName('Line_No').AsInteger := qrySalesCommInvoice_Line_No.asinteger;
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
                  rCost := rCost + (iQty / FieldByName('Invoice_Unit_Factor').asinteger)
                      * FieldByName('Cost_Price').asfloat
                else
                  rCost := rCost + FieldByName('Cost_Price').asfloat;
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
                      rCost := rCost + ((iQty / qryGetProdCosts.FieldByName('Order_Unit_Factor').asinteger)
                        * qryGetProdCosts.FieldByName('Order_Price').asfloat)*-1
                    else
                      try
                        rCost := rCost + (((qryGetProdCosts.FieldByName('Order_Price').asfloat / qryGetProdCosts.FieldByName('Quantity').asfloat)*iqty)*-1) ;
                      except
                        rCost := rCost + 0
                      end;
                  end
                else
                  rCost := rCost + 0;
              end
            else
            if fieldbyname('Job_Bag').asinteger <> 0 then
              begin
                qryGetJBCrCosts.close;
                qryGetJBCrCosts.parambyname('Job_Bag').asinteger := fieldbyname('Job_Bag').asinteger;
                qryGetJBCrCosts.parambyname('Job_bag_line').asinteger := fieldbyname('Job_Bag_Line').asinteger;
                qryGetJBCrCosts.open;

                if  (FieldbyName('Credit_Type').asstring = 'Q') then
                  rCost := rCost + (qryGetJBCrCosts.FieldByName('Job_Bag_Line_Cost').asfloat*-1)
                else
                  rCost := rCost + 0;
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

                        rCost := rCost + ((iQty / qryGetSOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                          * qryGetSOCrCosts.FieldByName('Part_Cost').asfloat)*-1;
                      end
                    else
                      rCost := rCost + (((iQty / qryGetPOCrCosts.FieldByName('Purch_Pack_Quantity').asinteger)
                          * qryGetPOCrCosts.FieldByName('Purchase_Price').asfloat))*-1;
                  end
                else
                  rCost := rCost + 0.00;
              end;
            next;
          end;
      end;
    end;

//  rCost := rCost + rAddcost;
  rGoods := qrySalesCommGoods_Value.asfloat;
  if (qrySalesCommInvoice_or_Credit.asstring = 'I') or
     (qrySalesCommInvoice_or_Credit.asstring = '') then
        iqty := qrySalesCommQty_Invoiced.asinteger
  else
      iqty := PosToNegQty(qrySalesCommQty_Invoiced.asinteger);
  if qrySalesCommPrice_Unit_Factor.AsInteger <> 0 then
    rGoods := (iqty/qrySalesCommPrice_Unit_Factor.asInteger)  * rGoods;

  if qrySalesCommInvoice_Line_No.asinteger = 1 then
  begin
    with qryInvAddChrg do
    begin
      close;
      ParamByName('Sales_invoice').AsInteger :=qrySalesCommSales_Invoice.asInteger;
      open;
      if recordcount > 0 then
        rGoods := rGoods + fieldByName('Total_Add_Chrg').AsFloat;
    end;
  end;

  if qrySalesCommRep_Responsibility.asfloat = 0 then
    rResponsibility := 100
  else
    rResponsibility := qrySalesCommRep_Responsibility.asfloat;

  qrlblCommSplit.caption := formatfloat('0',rResponsibility);

  rCost := rCost * (rResponsibility/100);
  rGoods := rGoods * (rResponsibility/100);

  rInvCost := rInvCost + rCost;
  rInvGoods := rInvGoods + rGoods;
end;

procedure TPBRPSalesCommbyCatFrm.QRBndProdCatGrpFootBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if not IsSummary then
  begin
    QRLblTotPrdGoods.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rCatGoods));
    QRLblTotPrdCst.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatCost));
    QRLblTotPrdMrg.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rCatGoods)-rCatCost);
    TotalCommLbl.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatComm));
  end
  else
  begin
    QRLblTotPrdGoodsSumm.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(rCatGoods));
    QRLblTotPrdCstSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatCost));
    QRLblTotPrdMrgSumm.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',(rCatGoods)-rCatCost);
    TotalCommLblProdSumm.Caption := FormatFloat('£#,###,##0.00;(£#,###,##0.00)',(rCatComm));
  end;
end;

procedure TPBRPSalesCommbyCatFrm.SetcommbyCat(const Value: Boolean);
begin
  fCommbycat := Value;
end;

procedure TPBRPSalesCommbyCatFrm.QRBndInvGrpFootBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
rcomm : real;
begin
  printband := not(issummary);
  TotGoodsQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvGoods);
  TotCstQRLbl.Caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',rInvCost);
  MargQRLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rInvGoods - rInvCost);

  {Work out commission based on either Gross Profit or Turnover}
  if commBasis = 'P' then
    rComm := ((rInvGoods - rInvCost)*(comm_rate/100))  // based on Gross Profit
  else
    rComm := ((rInvGoods)*(comm_rate/100));  // based on turnover

  CommissionLbl.Caption := formatfloat('£###,##0.00;(£#,###,##0.00)',rComm);
  rCatComm := rCatComm + rcomm;
end;

procedure TPBRPSalesCommbyCatFrm.QRGroupProdCatBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  CatDescription: string;
begin
  printband := not(issummary);

  with GetCommRtQuery do
  begin
    close;
    ParamByName('Category').AsInteger := qrysalesComm.FieldByName('Category').AsInteger;
    open;
    if recordcount = 0 then
    begin
      lblCommission.caption := 'No Product Type - Commission rate: ' + formatfloat('0.00',qrySalesComm.fieldbyname('Commission_Rate').asfloat) + '%';
      QRLblCat.Caption := 'No Product Type';
//      comm_rate := qrysalesComm.fieldbyname('Commission_Rate').asfloat;
    end
    else
    begin
      lblCommission.caption := fieldByName('Description').AsString + ' - Commission rate: ' + formatfloat('0.00',fieldbyname('Commission_Rate').asfloat) + '%';
      QRLblCat.Caption := fieldByName('Description').AsString;
//      comm_Rate := fieldbyname('Commission_Rate').asfloat;
    end;
//    QRLabelcomm.Caption := formatfloat('0.00',comm_rate) + '%';
  end;

  with qryGetRepCatComm do
    begin
      close;
      parambyname('Rep').asinteger := qrysalesComm.FieldByName('Rep').AsInteger;
      parambyname('Financial_year').asinteger := FinancialYear;
      parambyname('Category').asinteger := qrysalesComm.FieldByName('Category').AsInteger;
      open;

      comm_rate := fieldbyname('Commission_Rate').asfloat;
      if commType = 'V' then
        begin
          if fieldbyname('Commission_Basis').AsString = 'T' then
            commBasis := 'T'
          else
            commBasis := 'P';
        end
      else
        commBasis := 'P';

//      qrlblCommRate.Caption := formatfloat('0.00',comm_rate) + '%';
      qrlabelComm.Caption := formatfloat('0.00',comm_rate) + '%';
      if CommBasis = 'T' then
        QRLabelCommType.Caption := 'Turnover'
      else
        QRLabelCommType.Caption := 'Profit';
    end;

  if GetCommRtQuery.fieldbyname('Description').asstring = '' then
    lblCommission.caption := 'No Product Type - Commission rate: ' + formatfloat('0.00',comm_rate) + '%'
  else
    lblCommission.caption := GetCommRtQuery.fieldbyname('Description').asstring + ' - Commission rate: ' + formatfloat('0.00',comm_rate) + '%';
end;

procedure TPBRPSalesCommbyCatFrm.QRBndInvGrpFootAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  rCatCost := rCatCost + rInvCost;
  rCatGoods := rCatGoods + rInvGoods;
  rInvGoods := 0.;
  rInvCost := 0.;
  if qrySalesComm.fieldByName('Invoice_Or_Credit').asString = 'C' then
    iNoOfCred := iNoOfCred+1
  else
    iNoofInv := iNoOfInv + 1;
end;

procedure TPBRPSalesCommbyCatFrm.QRBndProdCatGrpFootAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
rTotalGoods4Rep := rTotalGoods4Rep + rCatGoods;
rTotalCost4Rep := rTotalCost4Rep + rCatCost;
rTotalComm4Rep := rTotalComm4Rep + rCatComm;
rCatComm := 0;
rCatGoods := 0;
rCatCost := 0;
end;

procedure TPBRPSalesCommbyCatFrm.setIsSummary(const Value: Boolean);
begin
  fIsSummary := Value;
end;

procedure TPBRPSalesCommbyCatFrm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 iTotinv := 0;
  iTotCred := 0;
end;

procedure TPBRPSalesCommbyCatFrm.QRChldBndCatSummAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
itotinv := itotinv + inoofinv;
itotcred := itotcred + inoofcred;
itotinvRep := iTotinvRep + inoofinv;
iTotcredRep := itotcredRep + inoofcred;
iNoOfInv := 0;
iNoofCred := 0;
end;

procedure TPBRPSalesCommbyCatFrm.QRChldBndCatSummBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
QRlblNoOfInv.Caption := IntToStr(inoofinv);
QRLblNoofcreds.Caption := intToStr(iNoofcred);
end;

procedure TPBRPSalesCommbyCatFrm.QRChldBndRepSummAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
itotinvRep := 0;
 iTotcredRep := 0;
end;

procedure TPBRPSalesCommbyCatFrm.QRChldBndRepSummBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
QRlblInvRep.Caption := IntToStr(itotinvRep);
QRLblCredRep.Caption := intToStr(itotcredRep);
end;

procedure TPBRPSalesCommbyCatFrm.setRepPgBrk(const Value: Boolean);
begin
  fRepPgBrk := Value;
end;

procedure TPBRPSalesCommbyCatFrm.RepQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  with qryRepFinance do
    begin
      close;
      parambyname('rep').asinteger := qrySalesComm.fieldbyname('Rep').asinteger;
      parambyname('financial_year').asinteger  := FinancialYear;
      open;
      CommType := fieldbyname('Commission_type').asstring;
    end;
end;

end.
