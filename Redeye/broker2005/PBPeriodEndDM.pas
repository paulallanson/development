unit PBPeriodEndDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmPeriodEnd = class(TDataModule)
    qryUpdPeriod: TQuery;
    qryPeriod: TQuery;
    qryNextPeriod: TQuery;
    qrySalesInv: TQuery;
    qryAddSalesProfit: TQuery;
    qryGetPO: TQuery;
    qryGetLastSProfit: TQuery;
    qryPO: TQuery;
    qryPOLine: TQuery;
    qrySO: TQuery;
    qrySORep: TQuery;
    qryCompany: TQuery;
    qrySOLine: TQuery;
    qryPurchOrd: TQuery;
    qrySinvAddChgs: TQuery;
    qryUpPOLineChgs: TQuery;
    qrySPOAddChgs: TQuery;
    qryUpSPOchgs: TQuery;
    qryJB: TQuery;
    qryJBLine: TQuery;
    qryGetPeriod: TQuery;
    qryUpCompany: TQuery;
    qryCustomerReps: TQuery;
    qryRep: TQuery;
    qryProductType: TQuery;
    qryAddAnalysis: TQuery;
    qry4Cast: TQuery;
    qryPOLineCost: TQuery;
    qryPOInvLine: TQuery;
    qryUpPOInvAddChgs: TQuery;
    qryUpPurchInvLine: TQuery;
    qryGetRepTeam: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetCategory(TempCode: integer): integer;
    function GetJBAccountMgr(TempCode: integer): integer;
    function GetJBAccountTeam(TempCode: integer): integer;
    function GetJBSupplier(TempCode: integer; TempLine: integer): integer;
    function GetJBSupplierBR(TempCode: integer; TempLine: integer): integer;
    function GetJBTotalCost(TempCode, TempLine: integer): real;
    function GetPORep(TempCode: real; TempLine: integer):integer;
    function GetPOAccountMgr(TempCode: real): integer;
    function GetPOAccountTeam(TempCode: real): integer;
    function GetPOSupplier(TempCode: real):integer;
    function GetPOSupplierBR(TempCode: real):integer;
    function GetPOTotalCost(TempCode: real; TempLine: integer; TempQty: integer):real;
    function GetPOTotalInvCost(TempCode: real; TempLine, TempQty: integer): real;
    function GetPOLineTotalCost(TempCode: real; TempLine, TempQty: integer): real;
    function GetRepTeam(TempCode: integer): integer;
    function GetRepTeamMember(TempCode: integer): integer;
    function GetSOAccountMgr(TempCode: integer): integer;
    function GetSOAccountTeam(TempCode: integer): integer;
    function GetSORep(TempCode: integer):integer;
    function GetSOReplen(TempCode: integer):string;
    function GetSOSupplier(TempCode: integer):integer;
    function GetSOSupplierBR(TempCode: integer):integer;
    function GetSOTotalCost(TempCode: integer; TempLine: integer; TempQty: integer):real;
    function GetTotalAddCharges(TempCode: integer):real;
    function GetTotalCostCharges(TempCode: integer):real;
    procedure SetPOAddCharges(TempCode: real; TempLine: integer; TempProfit: integer);
    procedure SetSPOAddCharges(TempCode: integer);
    procedure SetPurchInvoices(TempCode: real; TempLine, TempProfit: integer);
  end;

var
  dmPeriodEnd: TdmPeriodEnd;

implementation

{$R *.DFM}

function TdmPeriodEnd.GetCategory(TempCode: integer):integer;
begin
  with qryProductType do
    begin
      close;
      parambyname('Product_Type').asinteger := TempCode;
      open;

      result := fieldbyname('Category').asinteger;
    end;
end;

function TdmPeriodEnd.GetRepTeamMember(TempCode: integer):integer;
begin
  with qryGetRepTeam do
    begin
      close;
      parambyname('Rep').asinteger := TempCode;
      open;
      result := fieldbyname('Rep_Team').asinteger;
    end;
end;

function TdmPeriodEnd.GetRepTeam(TempCode: integer):integer;
begin
  with qryRep do
    begin
      close;
      parambyname('Rep').asinteger := TempCode;
      open;

      result := fieldbyname('Rep_Team').asinteger;
    end;
end;

function TdmPeriodEnd.GetJBAccountMgr(TempCode: integer):integer;
begin
  with qryJB do
    begin
      close;
      parambyname('Job_Bag').asinteger := TempCode;
      open;

      result := fieldbyname('Office_Contact').asinteger;
    end;
end;

function TdmPeriodEnd.GetJBAccountTeam(TempCode: integer):integer;
begin
  with qryJB do
    begin
      close;
      parambyname('Job_Bag').asinteger := TempCode;
      open;

      result := fieldbyname('Account_Team').asinteger;
    end;
end;

function TdmPeriodEnd.GetJBSupplier(TempCode: integer; TempLine: integer):integer;
begin
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := TempCode;
      parambyname('Job_bag_Line').asinteger := TempLine;
      open;

      result := fieldbyname('Supplier').asinteger;
    end;
end;

function TdmPeriodEnd.GetJBSupplierBR(TempCode: integer; TempLine: integer):integer;
begin
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := TempCode;
      parambyname('Job_bag_Line').asinteger := TempLine;
      open;

      result := fieldbyname('Branch_no').asinteger;
    end;
end;

function TdmPeriodEnd.GetJBTotalCost(TempCode: integer; TempLine: integer):real;
begin
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := TempCode;
      parambyname('Job_bag_Line').asinteger := TempLine;
      open;

      result := fieldbyname('Job_Bag_Line_Cost').asfloat;
    end;
end;

function TdmPeriodEnd.GetPOAccountMgr(TempCode: real):integer;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      open;
      result := fieldbyname('Office_Contact').asinteger;
    end;
end;

function TdmPeriodEnd.GetPOAccountTeam(TempCode: real):integer;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      open;
      result := fieldbyname('Account_Team').asinteger;
    end;
end;

function TdmPeriodEnd.GetPOSupplier(TempCode: real):integer;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      open;
      result := fieldbyname('Supplier').asinteger;
    end;
end;

function TdmPeriodEnd.GetPOSupplierBR(TempCode: real):integer;
begin
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      open;
      result := fieldbyname('Branch_no').asinteger;
    end;
end;

function TdmPeriodEnd.GetPORep(TempCode: real; TempLine: integer):integer;
begin
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      parambyname('Line').asinteger := TempLine;
      open;
      result := fieldbyname('Rep').asinteger;
    end;
end;

function TdmPeriodEnd.GetPOTotalCost(TempCode: real; TempLine: integer; TempQty: integer):real;
var
  unitCost: real;
begin
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      parambyname('Line').asinteger := TempLine;
      open;

      if fieldbyname('Price_unit_Factor').asinteger = 0 then
        begin
          try
            unitcost := fieldbyname('Order_price').asfloat / fieldbyname('Quantity').AsInteger;
          except
            unitcost := 0.00;
          end;
          result := (unitcost * tempQty) + fieldbyname('Total_Charges').asfloat
        end
      else
        begin
          result := ((TempQty/fieldbyname('Price_unit_Factor').asinteger) * fieldbyname('Order_price').asfloat)
                    + fieldbyname('Total_Charges').asfloat;
        end;
    end;
end;

function TdmPeriodEnd.GetPOTotalInvCost(TempCode: real; TempLine: integer; TempQty: integer):real;
var
  unitCost: real;
  rTotal: real;
  iInvoice: integer;
begin
  result := 0;
  rTotal := 0;
  with qryPOInvLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      parambyname('Line').asinteger := TempLine;
      open;
      first;

      iInvoice := 0;

      while eof <> true do
        begin
          if fieldbyname('Price_unit_Factor').asinteger = 0 then
            begin
              rTotal := rTotal + fieldbyname('Goods_Value').asfloat
            end
          else
            begin
              rTotal := rTotal + ((fieldbyname('Qty_Invoiced').asinteger/fieldbyname('Price_unit_Factor').asinteger) * fieldbyname('Goods_Value').asfloat);
            end;
          if iInvoice <> fieldbyname('Supplier_invoice').asinteger then
            rTotal := rTotal +  + fieldbyname('Total_Charges').asfloat;

          iInvoice := fieldbyname('Supplier_invoice').asinteger;
          next;
        end;
      result := rTotal;
    end;
end;

function TdmPeriodEnd.GetPOLineTotalCost(TempCode: real; TempLine: integer; TempQty: integer):real;
var
  unitCost: real;
begin
  with qryPOLineCost do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      parambyname('Line').asinteger := TempLine;
      open;

      if fieldbyname('Price_unit_Factor').asinteger = 0 then
        begin
          try
            unitcost := fieldbyname('Order_price').asfloat / fieldbyname('Quantity').AsInteger;
          except
            unitcost := 0.00;
          end;
          result := (unitcost * tempQty) + fieldbyname('Total_Charges').asfloat
        end
      else
        begin
          result := ((TempQty/fieldbyname('Price_unit_Factor').asinteger) * fieldbyname('Order_price').asfloat)
                    + fieldbyname('Total_Charges').asfloat;
        end;
    end;
end;

function TdmPeriodEnd.GetSOAccountMgr(TempCode: integer): integer;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_order').asfloat := TempCode;
      open;

      result := fieldbyname('Office_Contact').asinteger
    end;
end;

function TdmPeriodEnd.GetSOAccountTeam(TempCode: integer): integer;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_order').asfloat := TempCode;
      open;

      result := fieldbyname('Account_Team').asinteger
    end;
end;

function TdmPeriodEnd.GetSOReplen(TempCode: integer):string;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_order').asfloat := TempCode;
      open;

      result := fieldbyname('Replenish_ID').asstring
    end;
end;

function TdmPeriodEnd.GetSOSupplier(TempCode: integer):integer;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_order').asfloat := TempCode;
      open;

      if fieldbyname('Replenish_ID').asstring = 'S' then
        result := fieldbyname('Supplier').asinteger
      else
        begin
          qrycompany.close;
          qrycompany.open;
          result := qrycompany.fieldbyname('Supplier').asinteger;
        end;
    end;
end;

function TdmPeriodEnd.GetSOSupplierBR(TempCode: integer):integer;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asinteger := TempCode;
      open;

      if fieldbyname('Replenish_ID').asstring = 'S' then
        result := fieldbyname('Branch_no0').asinteger
      else
        begin
          qrycompany.close;
          qrycompany.open;
          result := qrycompany.fieldbyname('Branch_no').asinteger;
        end;
    end;
end;

function TdmPeriodEnd.GetSORep(TempCode: integer):integer;
begin
  with qrySORep do
    begin
      close;
      parambyname('Sales_Order').asinteger := TempCode;
      open;
      result := fieldbyname('Rep').asinteger;
    end;
end;

function TdmPeriodEnd.GetSOTotalCost(TempCode: integer; TempLine: integer; TempQty: integer):real;
begin
  with qrySO do
    begin
      close;
      parambyname('Sales_Order').asinteger := TempCode;
      open;

      if fieldbyname('Replenish_ID').asstring = 'S' then
        begin
          {Get Purchase Order line details}
          qryPurchOrd.close;
          qryPurchOrd.parambyname('Sales_order').asinteger := TempCode;
          qryPurchOrd.parambyname('Purch_ord_line_no').asinteger := TempLine;
          qryPurchOrd.open;

          try
            result := (TempQty/qryPurchOrd.fieldbyname('Purch_Pack_Quantity').asinteger)
                    * qryPurchOrd.fieldbyname('Purchase_Price').asfloat;
          except
            result := 0.00;
          end;
        end
      else
        begin
          {Get Call off details}
          qrySOLine.close;
          qrySOLine.parambyname('Sales_order').asinteger := TempCode;
          qrySOLine.parambyname('Sales_order_line_no').asinteger := TempLine;
          qrySOLine.open;

          try
            result := (TempQty/qrySOLine.fieldbyname('Purch_Pack_Quantity').asinteger)
                    * qrySOLine.fieldbyname('Part_Cost').asfloat;
          except
            result := 0.00;
          end;
        end;
    end;
end;

function TdmPeriodEnd.GetTotalAddCharges(TempCode: integer): real;
begin
  with qrySinvAddChgs do
    begin
      close;
      parambyname('Sales_Invoice').asinteger := TempCode;
      open;

      result := fieldbyname('Total_Charges').asfloat;
    end;
end;

function TdmPeriodEnd.GetTotalCostCharges(TempCode: integer): real;
begin
  with qrySPOAddChgs do
    begin
      close;
      parambyname('Sales_Order').asinteger := TempCode;
      open;

      result := fieldbyname('Total_Charges').asfloat;
    end;
end;

procedure TdmPeriodEnd.SetPurchInvoices(TempCode: real; TempLine: integer; TempProfit: integer);
begin
  with qryUpPurchInvLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      parambyname('Line').asinteger := TempLine;
      parambyname('Sales_profit').asinteger := TempProfit;
      execsql;
    end;
end;

procedure TdmPeriodEnd.SetPOAddCharges(TempCode: real; TempLine: integer; TempProfit: integer);
begin
  with qryUpPOLineChgs do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      parambyname('Line').asinteger := TempLine;
      parambyname('Sales_profit').asinteger := TempProfit;
      execsql;
    end;

  {Update Purchase Invoice add charges to indcate they've been included in period end}
  with qryUpPOInvAddChgs do
    begin
      close;
      parambyname('Purchase_Order').asfloat := TempCode;
      parambyname('Line').asinteger := TempLine;
      parambyname('Sales_profit').asinteger := TempProfit;
      execsql;
    end;
end;

procedure TdmPeriodEnd.SetSPOAddCharges(TempCode: integer);
begin
  with qryUpSPOChgs do
    begin
      close;
      parambyname('sales_Order').asinteger := TempCode;
      execsql;
    end;
end;

end.
