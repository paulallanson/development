unit WTAccExportDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Math, gtQrCtrls;

type
  TdmAccExport = class(TDataModule)
    SalesInvNarrSQL: TQuery;
    SalesInvAddSQL: TQuery;
    UpCompanyAccSQL: TQuery;
    oldPurchaseInvSQL: TQuery;
    UpSupplierInvSQL: TQuery;
    UpCustomerSQL: TQuery;
    POCustomerSQL: TQuery;
    POSupplierSQL: TQuery;
    UpSupplierSQL: TQuery;
    UpSalesInvHeadSQL: TQuery;
    UpSupplierInvHeadSQL: TQuery;
    UpInvSupplierSQL: TQuery;
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
    PurchaseInvSQL: TQuery;
    PurchaseInvChgsSQL: TQuery;
    qryGetSalesInvoice: TQuery;
    qryGetSupplierInvoice: TQuery;
    qryVATCode: TQuery;
    qryUpdPendingSI: TQuery;
    qryUpdPendingPI: TQuery;
    CompanySQL: TQuery;
    CustPendingSQL: TQuery;
    SuppPendingSQL: TQuery;
    SalesPendingSQl: TQuery;
    PurchPendingSQL: TQuery;
    UpInvCustomerSQL: TQuery;
    customerSQL: TQuery;
    SupplierSQL: TQuery;
    InvCustomerSQL: TQuery;
    SalesInvSQL: TQuery;
    qrySOHead: TQuery;
    qryDelXeroInvs: TQuery;
    qryUpXeroInvs: TQuery;
    qryGetXeroImport: TQuery;
  private
    { Private declarations }
  public
    function GetInvoiceAccount(InvoiceNo: integer; InvoiceType: string): string;
    function GetInvoiceDescription(InvoiceNo: integer; InvoiceType: string): string;
    function GetInvoiceNettTotal(InvoiceNo: integer; InvoiceType: string): double;
    function GetInvoiceGrossTotal(InvoiceNo: integer; InvoiceType: string): double;
    function GetInvoiceVatTotal(InvoiceNo: integer; InvoiceType: string): double;
    function GetSOCustomerOrderNo(tempCode: string): string;
    function GetVATRate(VATCode: integer): double;
    function GetVATRef(VATCode: integer): string;
    procedure SetCompanyExportDir(sTemp: string);
    procedure UpdatePIFilename(sTempName: string);
    procedure UpdateSIFilename(sTempName: string);
end;

var
  dmAccExport: TdmAccExport;

implementation

uses AllCommon;

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

function TdmAccExport.GetSOCustomerOrderNo(tempCode: string): string;
begin
  result := '';
  if trim(tempcode) = '' then exit;
  with qrySOHead do
    begin
      close;
      parambyname('Sales_order').asinteger := strtoint(trim(tempcode));
      open;
      result := fieldbyname('Reference').asstring;
    end;
end;

end.
