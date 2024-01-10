unit WTMaintSalesOrderLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Data.DB, wtSalesOrderDM, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TfrmWTMaintSalesOrderLine = class(TForm)
    pnlFunctions: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pnlDetails: TPanel;
    Label1: TLabel;
    edtProduct: TEdit;
    btnLUProducts: TButton;
    Label3: TLabel;
    memPrice: TMemo;
    edtDescription: TEdit;
    Label2: TLabel;
    edtPackSize: TEdit;
    OrdqtyLbl: TLabel;
    memSellPrice: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    dblkpVAT: TDBLookupComboBox;
    edtQtyPacks: TMemo;
    Button1: TButton;
    lblQtyDelivered: TLabel;
    edtDelivered: TMemo;
    Label7: TLabel;
    lblQtyInvoiced: TLabel;
    edtInvoiced: TMemo;
    Label6: TLabel;
    edtJobNumber: TMemo;
    Label8: TLabel;
    edtAllocated: TMemo;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtProductKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLUProductsClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    sOldValue: string;
    FActivated: boolean;
    FSOLine: TSOLine;
    FMode: TsolMode;
    FChangeAll: boolean;
    FSOrder: TSOrder;
    procedure SetSOLine(const Value: TSOLine);
    procedure SetMode(const Value: TsolMode);
    procedure ShowDetails;
    procedure SetChangeAll(const Value: boolean);
    procedure SetSOrder(const Value: TSOrder);
    { Private declarations }
  public
    property ChangeAll: boolean read FChangeAll write SetChangeAll;
    property Mode: TsolMode read FMode write SetMode;
    property SOLine: TSOLine read FSOLine write SetSOLine;
    property SOrder: TSOrder read FSOrder write SetSOrder;
  end;

var
  frmWTMaintSalesOrderLine: TfrmWTMaintSalesOrderLine;

implementation

uses UITypes, wtStockDM, wtLUProducts, Allcommon, wtLUVat;

{$R *.dfm}

{ TfrmWTMaintSalesOrderLine }

procedure TfrmWTMaintSalesOrderLine.SetMode(const Value: TsolMode);
begin
  FMode := Value;
  lblDelete.visible := (FMode = solDelete);
  pnlDetails.enabled := not (FMode = solDelete);
end;

procedure TfrmWTMaintSalesOrderLine.SetSOLine(const Value: TSOLine);
begin
  FSOLine := Value;
end;

procedure TfrmWTMaintSalesOrderLine.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    SOLine.Parent.DataModule.qryVAT.Close;
    SOLine.Parent.DataModule.qryVAT.open;

    case Mode of
    solAdd     : Caption := 'Add a Sales Order Line';
    solChange  : Caption := 'Change a Sales Order line';
    solDelete  : Caption := 'Delete a Sales Order Line';
    end;  { case }
    if Mode = solAdd then
      sTemp := ' New Sales Invoice '
    else
      sTemp := ' Sales Invoice ' + IntToStr(SOLine.Parent.DbKey) + ' ';

    ShowDetails;
    pnlDetails.enabled := (Mode <> solView);
    btnOk.visible := (Mode <> solView);

    CheckOK(Self);
    FActivated := true;
  end;

end;

procedure TfrmWTMaintSalesOrderLine.ShowDetails;
begin
  if Mode <> solAdd then
  begin
    edtProduct.text := SOLine.StockCode;
    edtDescription.text := SOLine.Description;
    edtQtyPacks.text := floattostr(SOLine.Quantity);
    edtAllocated.text := floattostr(SOLine.QtyAllocated);
    edtDelivered.text := floattostr(SOLine.QtyDelivered);
    edtInvoiced.text := floattostr(SOLine.QtyInvoiced);
    edtPackSize.text := floattostr(SOLine.SellUnit);
    memPrice.Text := formatfloat('0.00',SOLine.UnitPrice);
    memSellPrice.Text := formatfloat('0.00',SOLine.UnitPrice);
    dblkpVat.KeyValue := SOLine.Vat;
    edtJobNumber.text := floattostr(SOLine.Job);
  end
  else
  begin
    edtProduct.text := '';
    edtDescription.text := '';
    edtQtyPacks.text := '';
    edtAllocated.text := '0';
    edtDelivered.text := '0';
    edtInvoiced.text := '0';
    edtPackSize.text := '';
    memPrice.Text := formatfloat('0.00',0.00);
    memSellPrice.Text := formatfloat('0.00',0.00);
    dblkpVat.KeyValue := 0;
    edtJObNumber.text := '';
  end;
end;

procedure TfrmWTMaintSalesOrderLine.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (edtQtyPacks.text <> '') and
                    (memSellPrice.text <> '');
end;
procedure TfrmWTMaintSalesOrderLine.edtProductKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if dtmdlStock.CheckProductExists(edtProduct.text) then
        begin
          SOLine.Product := dtmdlStock.GetProduct(edtProduct.text);
          SOLine.StockCode := edtProduct.text;
          edtDescription.text := dtmdlStock.GetProductdescription(edtProduct.text);
          memPrice.text := formatfloat('0.00',dtmdlStock.GetProductPrice(edtProduct.text));
          memSellPrice.text := formatfloat('0.00',dtmdlStock.GetProductPrice(edtProduct.text));
          dblkpVat.keyvalue := dtmdlStock.GetProductVat(edtProduct.text);
          edtPackSize.text := '1';
          edtQtyPacks.setfocus;
        end
      else
        begin
          MessageDlg('Invalid Product Code', mtError, [mbOk], 0);
          SOLine.Product := 0;
          SOLine.StockCode := '';
          dblkpVat.KeyValue := 0;
          edtProduct.clear;
          edtProduct.setfocus;
        end;
    end;
end;

procedure TfrmWTMaintSalesOrderLine.FormCreate(Sender: TObject);
begin
  dtmdlStock := TdtmdlStock.Create(self);
end;

procedure TfrmWTMaintSalesOrderLine.FormDestroy(Sender: TObject);
begin
  dtmdlStock.Free;
end;

procedure TfrmWTMaintSalesOrderLine.btnLUProductsClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtLUProducts := TfrmwtLUProducts.create(self);
  try
    frmwtLUProducts.Product := SOLine.Product;
    frmwtLUProducts.ProductCode := SOLine.StockCode;
    frmwtLUProducts.isLookup := true;
    frmwtLUProducts.showmodal;
    if frmwtLUProducts.modalresult = idOK then
      begin
        if frmwtLUProducts.dbgDetails.SelectedRows.Count = 1 then
          begin
            SOLine.Product := frmwtLUProducts.Product;
            SOLine.StockCode := frmwtLUProducts.ProductCode;
            edtProduct.Text := SOLine.StockCode;
            edtDescription.text := dtmdlStock.GetProductdescription(edtProduct.text);
            memPrice.text := formatfloat('0.00',dtmdlStock.GetProductPrice(edtProduct.text));
            memSellPrice.text := formatfloat('0.00',dtmdlStock.GetProductPrice(edtProduct.text));
            dblkpVat.KeyValue := dtmdlStock.GetProductVat(edtProduct.text);
            edtPackSize.text := '1';
            edtQtyPacks.setfocus;
          end
        else
          begin
            if MessageDlg('Do you want to add the selected products to the order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                SOLine.free;
                for iCount := 0 to (frmwtLUProducts.dbgDetails.SelectedRows.Count - 1) do
                  begin
                    frmwtLUProducts.dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(frmwtLUProducts.dbgDetails.SelectedRows[iCount])) ;

                    SOLine := TSOLine.Create(SOrder);
                    try
                      SOLine.Product := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Product').asinteger;
                      SOLine.StockCode := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Product_Code').asstring;
                      SOLine.UnitPrice := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Unit_Price').asfloat;
                      SOLine.SellUnit := 1;
                      SOLine.Quantity := 1;
                      SOLine.QtyDelivered := 0;
                      SOLine.QtyInvoiced := 0;
                      SOLine.Description := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Product_Description').asstring;
                      SOLine.VAT := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('VAT').asinteger;
                      SOLine.VATRate := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('VAT_Rate').asfloat;
                      SOLine.VATDescription := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('VAT_Description').asstring;
                      SOLine.Job := 0;

                      SOLine.SOLNumber := SOLine.Parent.Lines.MaxLineNo + 1;
                      SOLine.Mode := 'A';
                      SOLine.Parent.Lines.Add(SOLine);
                    finally
                    end;
                  end;
                ModalResult := mrOK;
              end;
          end;
      end
  finally
    frmwtLUProducts.free;
  end;
end;

procedure TfrmWTMaintSalesOrderLine.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  SOLine.UnitPrice := StrToFloatDef(memSellPrice.text, 0, FormatSettings);
  SOLine.SellUnit := strtoint(edtPackSize.text);
  SOLine.Quantity := strtoint(edtQtyPacks.text) * SOLine.SellUnit;
  SOLine.QtyAllocated := strtoint(edtAllocated.text) * SOLine.SellUnit;
  SOLine.QtyDelivered := strtoint(edtDelivered.text) * SOLine.SellUnit;
  SOLine.QtyInvoiced := strtoint(edtInvoiced.text) * SOLine.SellUnit;
  SOLine.Description := edtDescription.Text;
  SOLine.VAT := dblkpVat.keyvalue;
  SOLine.VATRate := SOLine.parent.datamodule.dtsVAT.dataset.fieldbyname('Vat_Rate').asfloat;
  SOLine.VATDescription := SOLine.parent.datamodule.dtsVAT.dataset.fieldbyname('Description').asstring;
  if edtJobNumber.text <> '' then
    SOLine.Job := StrToFloatDef(edtJobNumber.text, 0, FormatSettings)
  else
    SOLine.Job := 0;

  if Mode = solAdd then
  begin
    SOLine.SOLNumber := SOLine.Parent.Lines.MaxLineNo + 1;
    SOLine.Mode := 'A';
    SOLine.Parent.Lines.Add(SOLine);
  end
  else
  if Mode = solDelete then
  begin
    inx := SOLine.Parent.Lines.IndexOf(SOLine.SOLNumber);
    SOLine.DeletefromDB;
    SOLine.Parent.Lines.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintSalesOrderLine.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TfrmWTMaintSalesOrderLine.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TfrmWTMaintSalesOrderLine.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmWTMaintSalesOrderLine.Button1Click(Sender: TObject);
begin
  frmWTLUVat := TfrmWTLUVat.create(self);
  try
    frmWTLUVat.showmodal;
  finally
    frmWTLUVat.free;
  end;

  dtmdlSalesOrder.dtsVAT.DataSet.close;
  dtmdlSalesOrder.dtsVAT.DataSet.open;

end;

procedure TfrmWTMaintSalesOrderLine.SetChangeAll(const Value: boolean);
begin
  FChangeAll := Value;
  lblQtyDelivered.Visible := FChangeAll;
  lblQtyInvoiced.Visible := FChangeAll;
  edtDelivered.visible := FChangeAll;
  edtInvoiced.Visible := FChangeAll
end;

procedure TfrmWTMaintSalesOrderLine.SetSOrder(const Value: TSOrder);
begin
  FSOrder := Value;
end;

end.
