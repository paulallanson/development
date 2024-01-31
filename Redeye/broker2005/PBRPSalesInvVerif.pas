unit PBRPSalesInvVerif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPSalesInvVerifFrm = class(TForm)
    qckrpSalesByInv: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel1: TQRLabel;
    qrlblCustomer: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrdbtxtPOLine: TQRDBText;
    qrdbtxtGoodsValue: TQRDBText;
    qrdbtxtGoodsVAT: TQRDBText;
    qrdbtxtGoodsTotal: TQRDBText;
    qrdbtxtInvDate: TQRDBText;
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
    TotalCostLbl: TQRLabel;
    RepTotCostQRLbl: TQRLabel;
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
    qrySalesbyInvAccount_Code: TStringField;
    qrySalesbyInvName: TStringField;
    qrySalesbyInvSales_Invoice_No: TStringField;
    qrySalesbyInvGoods_Value: TCurrencyField;
    qrySalesbyInvVat_Value: TCurrencyField;
    qrySalesbyInvGoods_Total: TCurrencyField;
    qrySalesbyInvInvoice_Date: TDateTimeField;
    qrySalesByInvInvoice_or_Credit: TWideStringField;
    qrySalesbyInvRep: TIntegerField;
    qrySalesbyInvSales_Invoice_type: TStringField;
    qrySalesbyInvInactive: TStringField;
    qrySalesbyInvReference: TStringField;
    qrySalesbyInvRep_Name: TStringField;
    qrySalesbyInvInvoiceRef: TStringField;
    qrySalesbyInvInvoice_Description: TStringField;
    qryGetPOCrCosts: TFDQuery;
    qryGetSOCosts: TFDQuery;
    qryAddPOCosts: TFDQuery;
    qrySalesbyInvOrderDesc: TStringField;
    lblDescription: TQRLabel;
    qryGetJBCrCosts: TFDQuery;
    qryGetInvLine: TFDQuery;
    qryGetPOCosts: TFDQuery;
    qryGetSOCrCosts: TFDQuery;
    qryGetProdCosts: TFDQuery;
    qryGetInvAddChrg: TFDQuery;
    GetCostsQuery: TFDQuery;
    qryGetJbCosts: TFDQuery;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    qrySalesbyInvBranch_Name: TStringField;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    qrlblDaysToRaise: TQRLabel;
    qrySalesbyInvCust_Order_no: TStringField;
    qryDummy: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    DateTimeField1: TDateTimeField;
    StringField4: TStringField;
    IntegerField4: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    qrySalesbyInvDate_Required: TDateTimeField;
    qrySalesbyInvAccount_Manager_Name: TStringField;
    qrySalesbyInvDate_Created: TDateTimeField;
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
    procedure qrySalesbyInvInvoiceRefGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySalesbyInvCalcFields(DataSet: TDataSet);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndPageHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    fTotalByCust: Boolean;
    exporting: boolean;
    exportFile: textFile;
    FTotalbyAccMgr: boolean;
    procedure setTotalByCust(const Value: Boolean);
    procedure SetTotalbyAccMgr(const Value: boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    customer, AccManager: integer;
    DateFrom, DateTo: TDateTime;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property TotalbyAccMgr: boolean read FTotalbyAccMgr write SetTotalbyAccMgr;
    procedure ExportToFile(fileName: string);
    function GetDetails: integer;
  end;

var
  PBRPSalesInvVerifFrm: TPBRPSalesInvVerifFrm;

implementation

uses PBRSSalesInvVerif, PBSalesInvoiceDm;

var
  iTotal_Sell, iTotal_vat, iTotal_Cost, iTotal_InvCost: real;
  RepTotal_Sell, RepTotal_vat, RepTotal_Cost, RepTotal_InvCost: real;

{$R *.DFM}

function TPBRPSalesInvVerifFrm.GetDetails: integer;
begin
  Result := 0;
  with qrySalesbyInv do
    begin
      SQL.Clear;
      SQL.Text := qryDummy.SQL.Text;

      if TotalbyCust then
        SQL.Text := SQl.Text + ' ORDER BY Customer.Name, Sales_Invoice.Sales_Invoice_no'
      else
      if TotalbyAccMgr then
        SQL.Text := SQl.Text + ' ORDER BY Account_Manager_Name, Sales_Invoice.Sales_Invoice_no'
      else
        SQL.Text := SQl.Text + ' ORDER BY Sales_Invoice.Sales_Invoice_no';
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Account_Manager').asinteger := AccManager;
      parambyname('Date_From').asdatetime := Datefrom;
      parambyname('Date_To').asdatetime := Dateto;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPSalesInvVerifFrm.qckrpSalesByInvBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  iTotal_InvCost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;
  RepTotal_InvCost := 0;
   with qckrpSalesByInv.PrinterSettings do
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

  if TotalByCust then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByInv.Customer';
      GrpByQRDBText.DataField := 'Name';
      qrlblCustomer.caption := 'Account Manager';
      end;
  if TotalByAccMgr then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesByInv.Account_Manager_Name';
      GrpByQRDBText.DataField:= 'Account_Manager_Name';
      qrlblCustomer.caption := 'Customer';
      end;
  end;

procedure TPBRPSalesInvVerifFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotalCost, rTotalInvCost :real;
  iQty, iLineNo: integer;
  raddcost: real;
  iHeight: integer;
  iDays, iNewDays: integer;
begin
  iTotal_Sell := iTotal_Sell + qrySalesByInvGoods_Value.asfloat;
  iTotal_Vat := iTotal_Vat + qrySalesByInvVat_Value.asfloat;
  RepTotal_Sell := RepTotal_Sell + qrySalesByInvGoods_Value.asfloat;
  RepTotal_Vat := RepTotal_Vat + qrySalesByInvVat_Value.asfloat;

  if TotalByCust then
    lblDescription.caption := qrySalesByInvAccount_Manager_Name.asstring
  else
  if TotalbyAccMgr then
    lblDescription.caption := qrySalesByInvName.asstring
  else
    lblDescription.caption := qrySalesByInvName.asstring;

  {Work out the number of days to raise the invoice}
  if qrySalesbyInvDate_Created.asDatetime <> 0 then
    iDays := DaysBetween(qrySalesbyInvDate_Created.asDateTime, qrySalesbyInvDate_Required.asDateTime)
  else
    iDays := 0;

  if qrySalesbyInvDate_Required.asDateTime > qrySalesbyInvDate_Created.asDateTime then
    iDays := iDays * -1;

  qrlblDaysToRaise.caption := inttostr(iDays);

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
                  iQty := PostoNegQty(FieldByName('Qty_Invoiced').asinteger)
                else
                  iQty := FieldByName('Qty_Invoiced').asinteger;

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
          ParamByName('Sales_invoice').AsInteger :=qrySalesByInvSales_Invoice.asInteger;
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

procedure TPBRPSalesInvVerifFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalSellLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',iTotal_Sell);
  TotalVatLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',iTotal_Vat);
  TotalGoodsLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',(iTotal_Sell+iTotal_VAT));
  TotalCostLbl.Caption := FormatFloat('#,###,##0.00;(#,###,##0.00)',(iTotal_Cost));
  GrpMargQRLbl.Caption := formatfloat('#,###,##0.00;(#,###,##0.00)',(iTotal_Sell)-iTotal_Cost);
  end;

procedure TPBRPSalesInvVerifFrm.FormCreate(Sender: TObject);
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  iTotal_InvCost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;
  RepTotal_InvCost := 0;
end;

procedure TPBRPSalesInvVerifFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepTotSellQRLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',RepTotal_Sell);
  RepTotVatQRLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',RepTotal_Vat);
  RepTotGoodsQRLbl.caption := formatfloat('#,###,##0.00;(#,###,##0.00)',(RepTotal_Sell+RepTotal_VAT));
  RepTotCostQRLbl.Caption := formatfloat('#,###,##0.00;(#,###,##0.00)',RepTotal_Cost);
  RepMargQRLbl.Caption := formatfloat('#,###,##0.00;(#,###,##0.00)',RepTotal_Sell-RepTotal_Cost);
end;

procedure TPBRPSalesInvVerifFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPSalesInvVerifFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  iTotal_InvCost := 0;
end;

procedure TPBRPSalesInvVerifFrm.qrySalesbyInvInvoiceRefGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrySalesByinvInvoice_or_Credit.asstring = 'C' then
    text := 'CN/'+ qrySalesByinvSales_invoice_no.asstring
  else
    text := qrySalesByinvSales_invoice_no.asstring;

end;

procedure TPBRPSalesInvVerifFrm.qrySalesbyInvCalcFields(DataSet: TDataSet);
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

procedure TPBRPSalesInvVerifFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Invoice No."'
    + ',"Invoice Date"'
    + ',"Customer"'
    + ',"Account Mgr"'
    + ',"Job/Order No"'
    + ',"Date Required"'
    + ',"Date Raised"'
    + ',"Days Taken"'
    + ',"Selling Price"'
    + ',"VAT"'
    + ',"Total"'
    + ',"Cost Price"'
    + ',"Gross Profit Margin"';

  writeLn(self.exportFile, tempStr);
  self.qckrpSalesByInv.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPSalesInvVerifFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr, tempStr2: string;
begin
  if self.exporting then
  begin
    //invoice no
    tempStr := '"' + qrySalesByinvSales_invoice_no.asstring + '"';
    //invoice date
    tempStr := tempStr + ',"' + qrySalesbyInvInvoice_Date.asString + '"';
    //customer name
    tempStr := tempStr + ',"' + qrySalesByInvName.asstring + '"';
    //Account Manager
    tempStr := tempStr + ',"' + qrySalesByInvAccount_Manager_Name.asstring + '"';
    //order No
    if qrySalesByInvSales_Invoice_Type.asstring = 'S' then
      tempStr := tempStr + ',"SO/' + qrySalesByInvReference.asstring + '"'
    else if qrySalesByInvSales_Invoice_Type.asstring = 'J' then
      tempStr := tempStr + ',"JB/' + qrySalesByInvReference.asstring + '"'
    else
      tempStr := tempStr + ',"' + qrySalesByInvReference.asstring + '"';
    //Date Required
    tempStr := tempStr + ',"' + qrySalesbyInvDate_Required.asString + '"';
    //Date Raised
    tempStr := tempStr + ',"' + qrySalesbyInvDate_Created.asString + '"';
    //Days Taken
    tempStr := tempStr + ',"' + qrlblDaysToRaise.caption + '"';
    //selling price
    tempStr := tempStr + ',"' + formatfloat('#,###,##0.00;(#,###,##0.00)',qrySalesbyInvGoods_Value.asFloat) + '"';
    //vat
    tempStr := tempStr + ',"' + formatfloat('#,###,##0.00;(#,###,##0.00)',qrySalesbyInvVat_Value.asFloat) + '"';
    //total
    tempStr := tempStr + ',"' + formatfloat('#,###,##0.00;(#,###,##0.00)',qrySalesbyInvGoods_Total.asFloat) + '"';
    //cost price
    tempStr := tempStr + ',"' + TotCstQRLbl.Caption + '"';
    //gross profit margin
    tempStr := tempStr + ',"' + MargQRLbl.Caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSSalesInvVerifFrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPSalesInvVerifFrm.qrbndPageHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if self.exporting then
  begin
    PBRSSalesInvVerifFrm.prgbrExport.Max :=
      qckrpSalesByInv.DataSet.RecordCount;
  end;
end;

procedure TPBRPSalesInvVerifFrm.SetTotalbyAccMgr(const Value: boolean);
begin
  FTotalbyAccMgr := Value;
end;

end.
