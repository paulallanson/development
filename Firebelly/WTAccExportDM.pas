unit WTAccExportDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmAccExport = class(TDataModule)
    SalesInvNarrSQL: TFDQuery;
    SalesInvAddSQL: TFDQuery;
    UpCompanyAccSQL: TFDQuery;
    oldPurchaseInvSQL: TFDQuery;
    UpSupplierInvSQL: TFDQuery;
    UpCustomerSQL: TFDQuery;
    POCustomerSQL: TFDQuery;
    POSupplierSQL: TFDQuery;
    UpSupplierSQL: TFDQuery;
    UpSalesInvHeadSQL: TFDQuery;
    UpSupplierInvHeadSQL: TFDQuery;
    UpInvSupplierSQL: TFDQuery;
    UpPOCustomerSQL: TFDQuery;
    UpPOSupplierSQL: TFDQuery;
    BranchSQL: TFDQuery;
    UpStockSQL: TFDQuery;
    UpCurrSQL: TFDQuery;
    CurrencySQL: TFDQuery;
    UpCustSQL: TFDQuery;
    StockSQL: TFDQuery;
    MaxStockSQL: TFDQuery;
    UpCompanyInvSQL: TFDQuery;
    UpCompanySQL: TFDQuery;
    PurchaseInvAddSQL: TFDQuery;
    GetFormRefSQL: TFDQuery;
    UpCompanyExpSQL: TFDQuery;
    InvSupplierSQL: TFDQuery;
    qryDelSageInvs: TFDQuery;
    qryUpSageInvs: TFDQuery;
    SalesInvChgsSQL: TFDQuery;
    qryGetSageImport: TFDQuery;
    PurchaseInvSQL: TFDQuery;
    PurchaseInvChgsSQL: TFDQuery;
    qryGetSalesInvoice: TFDQuery;
    qryGetSupplierInvoice: TFDQuery;
    qryVATCode: TFDQuery;
    qryUpdPendingSI: TFDQuery;
    qryUpdPendingPI: TFDQuery;
    CompanySQL: TFDQuery;
    CustPendingSQL: TFDQuery;
    SuppPendingSQL: TFDQuery;
    SalesPendingSQl: TFDQuery;
    PurchPendingSQL: TFDQuery;
    UpInvCustomerSQL: TFDQuery;
    customerSQL: TFDQuery;
    SupplierSQL: TFDQuery;
    InvCustomerSQL: TFDQuery;
    SalesInvSQL: TFDQuery;
    qrySOHead: TFDQuery;
    qryDelXeroInvs: TFDQuery;
    qryUpXeroInvs: TFDQuery;
    qryGetXeroImport: TFDQuery;
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
