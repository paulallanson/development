unit PBLUSalesInvoiceCustJB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, PBSalesInvoiceDM, ExtCtrls, DB;

type
  TPBLUSalesInvoiceCustJBfrm = class(TForm)
    Panel2: TPanel;
    lblCustomer: TLabel;
    Panel1: TPanel;
    btnSelect: TBitBtn;
    btnCancel: TBitBtn;
    dbgJB: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgJBDblClick(Sender: TObject);
    procedure dbgJBCellClick(Column: TColumn);
    procedure btnSelectClick(Sender: TObject);
  private
    FSalesInvoiceLine: TSalesInvoiceLine;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetSalesInvoiceLine(const Value: TSalesInvoiceLine);
    procedure LoadFromJBL;
    { Private declarations }
  public
    Customer: integer;
    property SalesInvoiceLine: TSalesInvoiceLine read FSalesInvoiceLine write SetSalesInvoiceLine;
  end;

var
  PBLUSalesInvoiceCustJBfrm: TPBLUSalesInvoiceCustJBfrm;

implementation

uses UITypes;
{$R *.dfm}

procedure TPBLUSalesInvoiceCustJBfrm.FormCreate(Sender: TObject);
begin
  dmSalesInvoice := TdmSalesInvoice.Create(Self);
  dmSalesInvoice.dsCustJBL.OnDataChange := SetButtons;
end;

procedure TPBLUSalesInvoiceCustJBfrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSalesInvoice do
  begin
    btnSelect.enabled := (qryCustJBL.recordcount > 0);
  end;
end;

procedure TPBLUSalesInvoiceCustJBfrm.FormShow(Sender: TObject);
begin
  dmSalesInvoice.iCustomer := Customer;
  dmSalesInvoice.refreshCustJBdata;
  dbgJB.datasource := dmSalesInvoice.dsCustJBL;
end;

procedure TPBLUSalesInvoiceCustJBfrm.dbgJBDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TPBLUSalesInvoiceCustJBfrm.dbgJBCellClick(Column: TColumn);
begin
  with dbgJB do
   if SelectedRows.count > 0 then
    btnSelect.enabled := true;
end;

procedure TPBLUSalesInvoiceCustJBfrm.btnSelectClick(Sender: TObject);
begin
  if MessageDlg('Do you want to add an invoice line for this job bag line?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      LoadfromJBL;
      ModalResult := mrOK;
    end;
end;

procedure TPBLUSalesInvoiceCustJBfrm.SetSalesInvoiceLine(
  const Value: TSalesInvoiceLine);
begin
  FSalesInvoiceLine := Value;
end;

procedure TPBLUSalesInvoiceCustJBfrm.LoadFromJBL;
var
  sellPrice: real;
  PackSize: integer;
begin
  with SalesInvoiceLine, dbgJB.Datasource.dataset do
    begin
      SILine := Parent.Lines.Count + 1;
      CreditType := '';
      Description := fieldbyname('Job_Bag_Line_Descr').asstring;
      PONumber := FieldByName('Purchase_Order').Asfloat;
      POLine := FieldByName('Line').Asinteger;
      VatCode := FieldByName('VAT_Code').Asinteger;
      VatRate := FieldByName('VAT_Rate').Asfloat;
      VatValue := 0.00;
      ProductType := FieldByName('Product_Type').Asinteger;
      if ProductType = 0 then
        ProductType := Fieldbyname('JB_Product_Type').AsInteger;
      SONumber := FieldByName('Sales_Order').Asinteger;
      SOLine := FieldByName('Sales_Order_line_no').Asinteger;
      PackQty := dmSalesInvoice.GetPackQty(SONumber, SOLine);

      if (fieldbyname('sell_unit').asstring = '') and (SONumber <> 0) then    {this line must be a sales order call off line}
        begin
        PriceUnit := dmSalesInvoice.GetPartPriceUnit(SONumber, SOLine);
        if PriceUnit = 0 then
          PriceUnit := 1;       {If no price unit exists then set to default of 'per 1000'}
        PriceUnitDescr := dmSalesInvoice.GetPUnitDescription(PriceUnit);
        PriceUnitFactor := dmSalesInvoice.GetPUnitFactor(PriceUnit);
        Quantity := dmSalesInvoice.GetSOLineOutQty(SONumber,SOLine);
        OriginalQty := 0;
        QtyOutstanding := dmSalesInvoice.GetSOLineOutQty(SONumber,SOLine);
        SellPrice := dmSalesInvoice.GetSOLineSellPrice(SONumber,SOLine);
        PackSize  := dmSalesInvoice.GetSOPackQty(SONumber, SOLine);
        if PriceUnitFactor = 0 then
          GoodsValue := SellPrice
        else
          GoodsValue := (SellPrice/PackSize) * PriceUnitFactor;
        ProductType := dmSalesInvoice.GetPartProductType(SONumber,SOLine);
        end
      else
      if (fieldbyname('price_unit').asinteger <> 0) then
        begin
        PriceUnit := fieldbyname('price_unit').asinteger;
        PriceUnitDescr := dmSalesInvoice.GetPUnitDescription(PriceUnit);
        PriceUnitFactor := dmSalesInvoice.GetPUnitFactor(PriceUnit);
        Quantity := Fieldbyname('JB_Qty_To_Invoice').asinteger;
        OriginalQty := 0;
        QtyOutstanding := Fieldbyname('JB_Qty_To_Invoice').asinteger;
        GoodsValue := (fieldbyname('unit_price').asfloat)
        end
      else
      if (fieldbyname('sell_unit').asstring = '') then
        begin
        PriceUnit := dmSalesInvoice.GetDefPriceUnit;
        PriceUnitDescr := dmSalesInvoice.GetPUnitDescription(PriceUnit);
        PriceUnitFactor := dmSalesInvoice.GetPUnitFactor(PriceUnit);
        Quantity := Fieldbyname('Job_Bag_Quantity').asinteger;
        OriginalQty := 0;
        QtyOutstanding := Fieldbyname('Job_Bag_Quantity').asinteger;
        GoodsValue := (fieldbyname('Job_Bag_line_Sell').asfloat)
        end
      else
        begin
        PriceUnit := FieldByName('Sell_Unit').Asinteger;
        PriceUnitDescr := dmSalesInvoice.GetPUnitDescription(PriceUnit);
        PriceUnitFactor := dmSalesInvoice.GetPUnitFactor(PriceUnit);
        Quantity := Fieldbyname('Invoice_Qty').asinteger;
        OriginalQty := 0;
        QtyOutstanding := Fieldbyname('Invoice_Qty').asinteger;
        GoodsValue := FieldByName('Selling_Price').Asfloat
        end;

      if ProductType = 0 then
        ProductType := dmSalesInvoice.GetDefProductType;

      ProductTypeDesc := dmSalesInvoice.GetPTypeDesc(ProductType);

      if ProductType = 0 then
        Nominal := dmSalesInvoice.GetDefSalesNominal
      else
        begin
          if dmSalesInvoice.GetNominalType = 'COMPANY' then
            Nominal := dmSalesInvoice.GetDefSalesNominal
          else
          if dmSalesInvoice.GetNominalType = 'REP' then
            Nominal := dmSalesInvoice.GetRepNominal(FieldByName('Rep').Asinteger)
          else
            Nominal := dmSalesInvoice.GetPTypeNominal(ProductType);
        end;

      JBNumber := FieldByName('Job_Bag').Asinteger;
      JBLine := FieldByName('Job_Bag_Line').Asinteger;
      Narrative := 0;
      NarrativeText := '';
      NotPrinted := 'N';
      Reference := '';
      IntNarr := 0;
      IntNarrText := '';
      SalesInvoiceLine.Parent.Lines.Add(SalesInvoiceLine);
    end;
end;
end.
