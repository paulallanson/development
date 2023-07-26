unit PBMaintSalesInvoiceDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, StdCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSalesInvoiceDetailFrm = class(TForm)
    pnlBottom: TPanel;
    DBGrid1: TDBGrid;
    qrySIAllDetails: TFDQuery;
    dtsSIAllDetails: TDataSource;
    btnExcel: TBitBtn;
    pnlButton: TPanel;
    btbtnClose: TBitBtn;
    qrySIAllDetailsSales_Order: TIntegerField;
    qrySIAllDetailssales_order_line_no: TIntegerField;
    qrySIAllDetailspart: TStringField;
    qrySIAllDetailspart_cost: TCurrencyField;
    qrySIAllDetailsPurch_Pack_Quantity: TIntegerField;
    qrySIAllDetailspart_sales_price: TCurrencyField;
    qrySIAllDetailssell_pack_quantity: TIntegerField;
    qrySIAllDetailsquantity_ordered: TIntegerField;
    qrySIAllDetailsquantity_delivered: TIntegerField;
    qrySIAllDetailsdate_ordered: TDateTimeField;
    qrySIAllDetailscust_order_no: TStringField;
    qrySIAllDetailsdelivery_customer: TIntegerField;
    qrySIAllDetailsdelivery_branch: TIntegerField;
    qrySIAllDetailsad_hoc_address: TIntegerField;
    qrySIAllDetailscustomer: TIntegerField;
    qrySIAllDetailsdelivery_customer_1: TIntegerField;
    qrySIAllDetailspart_description: TStringField;
    qrySIAllDetailsPart_Cost_Cat: TCurrencyField;
    qrySIAllDetailsCustomer_Name: TStringField;
    qrySIAllDetailsBranch_Name: TStringField;
    qrySIAllDetailsShort_Code: TStringField;
    qrySIAllDetailsOrderedBy: TStringField;
    qrySIAllDetailsDeliveryCustName: TStringField;
    qrySIAllDetailsDeliveryBranchName: TStringField;
    qrySIAllDetailsdate_required: TDateTimeField;
    qrySIAllDetailsDelivery_Date: TDateTimeField;
    qrySIAllDetailscost_centre: TStringField;
    qrySIAllDetailsVat_Rate: TFloatField;
    qrySIAllDetailsDeliveryLocation: TStringField;
    qryAdhoc: TFDQuery;
    qrySIAllDetailsSalesValue: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure btbtnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure qrySIAllDetailsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    SINumber: integer;
  end;

var
  PBMaintSalesInvoiceDetailFrm: TPBMaintSalesInvoiceDetailFrm;

implementation

uses pbMainMenu;

{$R *.dfm}

procedure TPBMaintSalesInvoiceDetailFrm.FormActivate(Sender: TObject);
begin
  with qrySIAllDetails do
    begin
      close;
      parambyname('Sales_invoice').asinteger := SINumber;
      open;

      btnExcel.Enabled := (RecordCount > 0);
    end;
end;

procedure TPBMaintSalesInvoiceDetailFrm.btbtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPBMaintSalesInvoiceDetailFrm.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportToExcel(PBMaintSalesInvoiceDetailFrm);
end;

procedure TPBMaintSalesInvoiceDetailFrm.qrySIAllDetailsCalcFields(
  DataSet: TDataSet);
begin
  if qrySIAllDetailsDeliveryBranchName.asstring <> '' then
    begin
      qrySIAllDetailsDeliveryLocation.text := qrySIAllDetailsDeliveryBranchName.asstring;
    end
  else
    begin
      with qryAdhoc do
        begin
          close;
          parambyname('Ad_hoc_address').asinteger := qrySIAllDetailsAd_hoc_Address.asinteger;
          open;
          qrySIAllDetailsDeliveryLocation.text := fieldbyname('Name').asstring;
        end;
    end;

  qrySIAllDetailsSalesValue.value :=
    (qrySIAllDetailsquantity_ordered.value / qrySIAllDetailssell_pack_quantity.value) *
     qrySIAllDetailspart_sales_price.value;

end;

end.
