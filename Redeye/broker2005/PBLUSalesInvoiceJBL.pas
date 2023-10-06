unit PBLUSalesInvoiceJBL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, PBSalesInvoiceDM, StdCtrls, Grids, DBGrids, Buttons, DB;

type
  TPBLUSalesInvoiceJBLfrm = class(TForm)
    Panel1: TPanel;
    btnSelect: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    dbgJBLines: TDBGrid;
    lblCustomer: TLabel;
    lblJobBag: TLabel;
    lblDescription: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
  private
    FSalesInvoiceLine: TSalesInvoiceLine;
    procedure SetSalesInvoiceLine(const Value: TSalesInvoiceLine);
    procedure LoadFromJBL;
    procedure SetButtons(Sender: TObject; Field: TField);
    { Private declarations }
  public
    { Public declarations }
    JBNumber: integer;
    property SalesInvoiceLine: TSalesInvoiceLine read FSalesInvoiceLine write SetSalesInvoiceLine;
  end;

var
  PBLUSalesInvoiceJBLfrm: TPBLUSalesInvoiceJBLfrm;

implementation

uses UITypes;
{$R *.DFM}

procedure TPBLUSalesInvoiceJBLfrm.FormShow(Sender: TObject);
begin
  dmSalesInvoice.JBNumber := JBNumber;
  dmSalesInvoice.refreshJBLdata;
  dbgJBLines.datasource := dmSalesInvoice.dsJBLines;
end;

procedure TPBLUSalesInvoiceJBLfrm.FormCreate(Sender: TObject);
begin
  dmSalesInvoice := TdmSalesInvoice.Create(Self);
  dmSalesInvoice.dsJBLines.OnDataChange := SetButtons;
end;

procedure TPBLUSalesInvoiceJBLfrm.FormDestroy(Sender: TObject);
begin
  dmSalesInvoice.free;
end;

procedure TPBLUSalesInvoiceJBLfrm.SetSalesInvoiceLine(
  const Value: TSalesInvoiceLine);
begin
  FSalesInvoiceLine := Value;
end;

procedure TPBLUSalesInvoiceJBLfrm.btnSelectClick(Sender: TObject);
begin
  if MessageDlg('Do you want to add an invoice line for this job bag line?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      LoadfromJBL;
      ModalResult := mrOK;
    end;
end;

procedure TPBLUSalesInvoiceJBLfrm.LoadFromJBL;
var
  sellPrice: real;
  PackSize: integer;
begin
  with SalesInvoiceLine, dbgJBLines.Datasource.dataset do
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

procedure TPBLUSalesInvoiceJBLfrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSalesInvoice do
  begin
    btnSelect.enabled := (qryJBLines.recordcount > 0);
  end;
end;

end.
