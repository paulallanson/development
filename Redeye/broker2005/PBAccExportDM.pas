unit PBAccExportDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Math;

type
  TdmAccExport = class(TDataModule)
    InvCustomerSQL: TQuery;
    SalesInvNarrSQL: TQuery;
    SalesInvAddSQL: TQuery;
    customerSQL: TQuery;
    SupplierSQL: TQuery;
    UpCompanyAccSQL: TQuery;
    CompanySQL: TQuery;
    oldPurchaseInvSQL: TQuery;
    UpSupplierInvSQL: TQuery;
    UpCustomerSQL: TQuery;
    POCustomerSQL: TQuery;
    POSupplierSQL: TQuery;
    UpSupplierSQL: TQuery;
    UpSalesInvSQL: TQuery;
    SalesInvSQL: TQuery;
    CustPendingSQL: TQuery;
    UpInvCustomerSQL: TQuery;
    UpSalesInvHeadSQL: TQuery;
    SuppPendingSQL: TQuery;
    SalesPendingSQl: TQuery;
    UpSupplierInvHeadSQL: TQuery;
    UpInvSupplierSQL: TQuery;
    PurchPendingSQL: TQuery;
    UpPOCustomerSQL: TQuery;
    UpPOSupplierSQL: TQuery;
    BranchSQL: TQuery;
    UpStockSQL: TQuery;
    UpCurrSQL: TQuery;
    CurrencySQL: TQuery;
    UpCustSQL: TQuery;
    StockSQL: TQuery;
    MaxStockSQL: TQuery;
    UpCompanyInvSQL: TQuery;
    UpCompanySQL: TQuery;
    PurchaseInvAddSQL: TQuery;
    GetFormRefSQL: TQuery;
    UpCompanyExpSQL: TQuery;
    InvSupplierSQL: TQuery;
    qryDelSageInvs: TQuery;
    qryUpSageInvs: TQuery;
    SalesInvChgsSQL: TQuery;
    qryGetSageImport: TQuery;
    oldSalesInvSQL: TQuery;
    oldUpSalesInvSQL: TQuery;
    PurchaseInvSQL: TQuery;
    PurchaseInvChgsSQL: TQuery;
    qryGetSalesInvoice: TQuery;
    qryGetSupplierInvoice: TQuery;
    qryVATCode: TQuery;
    qryUpdPendingSI: TQuery;
    qryUpdPendingPI: TQuery;
    DDPendingSQL: TQuery;
    DDResetSQL: TQuery;
    DDUpdateSQL: TQuery;
    qryDelXeroInvs: TQuery;
    qryUpXeroInvs: TQuery;
    qryGetXeroImport: TQuery;
    qrySOLine: TQuery;
    qryJBLine: TQuery;
    qryPOLine: TQuery;
    qryGetPaymentTerms: TQuery;
    qryGetSupplier: TQuery;
    qryPOJBLine: TQuery;
  private
    { Private declarations }
  public
    function GetInvoiceAccount(InvoiceNo: integer; InvoiceType: string): string;
    function GetInvoiceDescription(InvoiceNo: integer; InvoiceType: string): string;
    function GetInvoiceNettTotal(InvoiceNo: integer; InvoiceType: string): double;
    function GetInvoiceGrossTotal(InvoiceNo: integer; InvoiceType: string): double;
    function GetInvoiceVatTotal(InvoiceNo: integer; InvoiceType: string): double;
    function GetPaymentTermsDays(iCode: integer): integer;
    function GetJBLineDesc(tempCode, tempLine: integer): string;
    function GetPOJobNumber(tempCode: real; tempLine: integer): string;
    function GetPOLineAltPONumber(tempCode: real; tempLine: integer): string;
    function GetPOLineDesc(tempCode: real; tempLine: integer): string;
    function GetSOLineDesc(tempCode, tempLine: integer): string;
    function GetSupplierName(tempCode: integer): string;
    function GetVATRate(VATCode: integer): double;
    function GetVATRef(VATCode: integer): string;
    procedure SetCompanyExportDir(sTemp: string);
    procedure UpdatePIFilename(sTempName: string);
    procedure UpdateSIFilename(sTempName: string);
end;

var
  dmAccExport: TdmAccExport;

implementation

uses CCSCommon;

{$R *.DFM}

function TdmAccExport.GetInvoiceGrossTotal(InvoiceNo: integer;
  InvoiceType: string): double;
begin
  if (InvoiceType = 'SI') or (InvoiceType = 'SC') then
    begin
      with qryGetSalesInvoice do
        begin
          close;
          parambyname('Sales_invoice').asinteger := InvoiceNo;
          open;
          if InvoiceType = 'SC' then
            result := roundfloat((fieldbyname('Goods_Value').asfloat*-1),2) +
                      roundfloat((fieldbyname('Vat_Value').asfloat*-1),2)
          else
            result := roundfloat(fieldbyname('Goods_Value').asfloat,2) +
                      roundfloat(fieldbyname('Vat_Value').asfloat,2);
        end;
    end
  else
    begin
      with qryGetSupplierInvoice do
        begin
          close;
          parambyname('Supplier_Invoice').asinteger := InvoiceNo;
          open;
          if InvoiceType = 'PC' then
            result := roundfloat((fieldbyname('Goods_Value').asfloat*-1),2) +
                      roundfloat((fieldbyname('Vat_Value').asfloat*-1),2)
          else
            result := roundfloat(fieldbyname('Goods_Value').asfloat,2) +
                    roundfloat(fieldbyname('Vat_Value').asfloat,2);
        end;
    end;
end;

function TdmAccExport.GetVATRef(VATCode: integer): string;
begin
  with qryVatCode do
    begin
      close;
      parambyname('Vat_Code').asinteger := VATCode;
      open;
      result := fieldbyname('Vat_Ref').asstring;
    end;
end;

function TdmAccExport.GetVATRate(VATCode: integer): double;
begin
  with qryVatCode do
    begin
      close;
      parambyname('Vat_Code').asinteger := VATCode;
      open;
      result := fieldbyname('Vat_Rate').asfloat;
    end;
end;

function TdmAccExport.GetInvoiceNettTotal(InvoiceNo: integer;
  InvoiceType: string): double;
begin
  if (InvoiceType = 'SI') or (InvoiceType = 'SC') then
    begin
      with qryGetSalesInvoice do
        begin
          close;
          parambyname('Sales_invoice').asinteger := InvoiceNo;
          open;
          result := roundfloat(fieldbyname('Goods_Value').asfloat,4);
        end;
    end
  else
    begin
      with qryGetSupplierInvoice do
        begin
          close;
          parambyname('Supplier_Invoice').asinteger := InvoiceNo;
          open;
          result := roundfloat(fieldbyname('Goods_Value').asfloat,4);
        end;
    end;
end;

function TdmAccExport.GetInvoiceDescription(InvoiceNo: integer; InvoiceType: string): string;
begin
  if (InvoiceType = 'SI') or (InvoiceType = 'SC') then
    begin
      with qryGetSalesInvoice do
        begin
          close;
          parambyname('Sales_invoice').asinteger := InvoiceNo;
          open;
          result := fieldbyname('Invoice_Description').asstring;
        end;
    end
  else
    begin
      with qryGetSupplierInvoice do
        begin
          close;
          parambyname('Supplier_Invoice').asinteger := InvoiceNo;
          open;
          result := fieldbyname('Supp_Inv_Alt_Ref').asstring;
        end;
    end;
end;

function TdmAccExport.GetJBLineDesc(tempCode, tempLine: integer): string;
begin
  result := '';
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempcode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      open;
      result := fieldbyname('Job_Bag_Line_Descr').asstring;
    end;
end;

function TdmAccExport.GetPOLineDesc(tempCode: real;
  tempLine: integer): string;
begin
  result := '';
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempcode;
      parambyname('Line').asinteger := tempLine;
      open;
      result := fieldbyname('Customers_Desc').asstring;
    end;
end;

function TdmAccExport.GetPOLineAltPONumber(tempCode: real; tempLine: integer): string;
begin
  result := '';
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempcode;
      parambyname('Line').asinteger := tempLine;
      open;
      result := fieldbyname('Alt_Purchase_Order').asstring;
    end;
end;

function TdmAccExport.GetPOJobNumber(tempCode: real; tempLine: integer): string;
begin
  result := '';
  with qryPOJBLine do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempcode;
      parambyname('Line').asinteger := tempLine;
      open;

      if recordcount > 0 then
        result := fieldbyname('Job_Bag').asstring
      else
        result := '';
    end;
end;

function TdmAccExport.GetSOLineDesc(tempCode, tempLine: integer): string;
begin
  result := '';
  with qrySOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempcode;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      open;
      result := fieldbyname('Part').asstring + ' ' + fieldbyname('Part_Description').asstring;
    end;
end;

function TdmAccExport.GetInvoiceAccount(InvoiceNo: integer;
  InvoiceType: string): string;
begin
  if (InvoiceType = 'SI') or (InvoiceType = 'SC') then
    begin
      with qryGetSalesInvoice do
        begin
          close;
          parambyname('Sales_invoice').asinteger := InvoiceNo;
          open;
          result := fieldbyname('Customer_Name').asstring;

        end;
    end
  else
    begin
      with qryGetSupplierInvoice do
        begin
          close;
          parambyname('Supplier_Invoice').asinteger := InvoiceNo;
          open;
          result := fieldbyname('Supplier_Name').asstring;
        end;
    end;
end;

function TdmAccExport.GetInvoiceVatTotal(InvoiceNo: integer;
  InvoiceType: string): double;
begin
  if (InvoiceType = 'SI') or (InvoiceType = 'SC') then
    begin
      with qryGetSalesInvoice do
        begin
          close;
          parambyname('Sales_invoice').asinteger := InvoiceNo;
          open;
          if InvoiceType = 'SC' then
            result := roundfloat((fieldbyname('Vat_Value').asfloat*-1),2)
          else
            result := roundfloat(fieldbyname('Vat_Value').asfloat,2);
        end;
    end
  else
    begin
      with qryGetSupplierInvoice do
        begin
          close;
          parambyname('Supplier_Invoice').asinteger := InvoiceNo;
          open;
          if InvoiceType = 'PC' then
            result := roundfloat((fieldbyname('Vat_Value').asfloat*-1),2)
          else
            result := roundfloat(fieldbyname('Vat_Value').asfloat,2);
        end;
    end;
end;

procedure TdmAccExport.SetCompanyExportDir(sTemp: string);
begin
  with UpCompanyExpSQL do
    begin
      close;
      parambyname('Data_Export_Directory').asstring := sTemp;
      execsql;
    end;
end;

procedure TdmAccExport.UpdatePIFilename(sTempName: string);
begin
  with qryUpdPendingPI do
    begin
      close;
      parambyname('export_filename').asstring := stempName;
      execsql;
    end;
end;

procedure TdmAccExport.UpdateSIFilename(sTempName: string);
begin
  with qryUpdPendingSI do
    begin
      close;
      parambyname('export_filename').asstring := stempName;
      execsql;
    end;
end;

function TdmAccExport.GetPaymentTermsDays(iCode: integer): integer;
begin
  with qryGetPaymentTerms do
    begin
      close;
      parambyname('Payment_Terms').asinteger := iCode;
      open;

      Result := fieldbyname('Number_of_Days').asinteger;
    end;
end;

function TdmAccExport.GetSupplierName(tempCode: integer): string;
begin
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempCode;
      open;

      result := fieldbyname('Name').asstring;
    end;
end;

end.
