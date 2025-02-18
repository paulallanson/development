unit WTMaintSalesOrderAssociateCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, wtSalesOrderDM;

type
  TfrmWTMaintSalesOrderAssociateCharge = class(TForm)
    pnlFunctions: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    edtProduct: TEdit;
    btnLUProducts: TButton;
    edtDescription: TEdit;
    edtPackSize: TEdit;
    memSellPrice: TMemo;
    Button1: TButton;
    edtCustomerName: TEdit;
    Button2: TButton;
    grpbxInvoiced: TGroupBox;
    chkbxInvoiced: TCheckBox;
    lblInvoiceNumber: TLabel;
    dblkpVat: TDBLookupComboBox;
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
    procedure Button2Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    sOldValue: string;
    FActivated: boolean;
    FSOCharge: TSOCharge;
    FMode: TsocMode;
    FChangeAll: boolean;
    FSOrder: TSOrder;
    FCustomer: integer;
    procedure SetChangeAll(const Value: boolean);
    procedure SetMode(const Value: TsocMode);
    procedure SetSOCharge(const Value: TSOCharge);
    procedure SetSOrder(const Value: TSOrder);
    procedure ShowDetails;
    procedure SetCustomer(const Value: integer);
    { Private declarations }
  public
    property Customer: integer read FCustomer write SetCustomer;
    property ChangeAll: boolean read FChangeAll write SetChangeAll;
    property Mode: TsocMode read FMode write SetMode;
    property SOCharge: TSOCharge read FSOCharge write SetSOCharge;
    property SOrder: TSOrder read FSOrder write SetSOrder;
  end;


var
  frmWTMaintSalesOrderAssociateCharge: TfrmWTMaintSalesOrderAssociateCharge;

implementation

uses wtStockDM, wtLUProducts, Allcommon, wtLUVat, wtSrchCustomer,
  wtDataModule, wtMain;

{$R *.dfm}

procedure TfrmWTMaintSalesOrderAssociateCharge.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    SOCharge.Parent.DataModule.qryVAT.Close;
    SOCharge.Parent.DataModule.qryVAT.open;

    case Mode of
    socAdd     : Caption := 'Add an associate charge';
    socChange  : Caption := 'Change an associate charge';
    socDelete  : Caption := 'Delete an associate charge';
    end;  { case }
    if Mode = socAdd then
      sTemp := ' New associate charge '
    else
      sTemp := ' Associate charge ' + IntToStr(SOCharge.Parent.DbKey) + ' ';

    ShowDetails;

    if Mode <> socdelete then
      pnlDetails.enabled := (Mode <> socView);

    btnOk.visible := (Mode <> socView);

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.ShowDetails;
begin
  if Mode <> socAdd then
  begin
    Customer := SOCharge.AssociateCustomer;
    edtCustomerName.Text := SOCharge.AssociateCustomerName;
    edtProduct.text := SOCharge.ProductCode;
    edtDescription.text := SOCharge.ProductDescription;
    edtPackSize.text := floattostr(SOCharge.SellUnit);
    memSellPrice.Text := formatfloat('0.00',SOCharge.UnitPrice);
    dblkpVat.KeyValue := SOCharge.Vat;
    chkbxInvoiced.Checked := (SOCharge.Invoiced = 'Y');
    lblInvoiceNumber.caption := SOCharge.InvoiceNumber;
  end
  else
  begin
    edtCustomerName.Text := '';
    edtProduct.Text := '';
    edtDescription.text := '';
    memSellPrice.Text := '0.00';
    edtPackSize.Text := '1';
    dblkpVat.KeyValue := 0;
    chkbxInvoiced.Checked := false;
    lblInvoiceNumber.caption := '';
  end;
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=  (edtCustomerName.text <> '') and
                    (edtProduct.Text <> '') and
                    (memSellPrice.text <> '');
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.edtProductKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if dtmdlStock.CheckProductExists(edtProduct.text) then
        begin
          SOCharge.Product := dtmdlStock.GetProduct(edtProduct.text);
          SOCharge.ProductCode := edtProduct.text;
          edtDescription.text := dtmdlStock.GetProductdescription(edtProduct.text);
          memSellPrice.text := formatfloat('0.00',dtmdlStock.GetProductPrice(edtProduct.text));
          dblkpVat.keyvalue := dtmdlStock.GetProductVat(edtProduct.text);
          edtPackSize.text := '1';
        end
      else
        begin
          MessageDlg('Invalid Product Code', mtError, [mbOk], 0);
          SOCharge.Product := 0;
          SOCharge.ProductCode := '';
          dblkpVat.KeyValue := 0;
          edtProduct.clear;
          edtProduct.setfocus;
        end;
    end;

end;

procedure TfrmWTMaintSalesOrderAssociateCharge.FormCreate(Sender: TObject);
begin
  dtmdlStock := TdtmdlStock.Create(self);
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.FormDestroy(Sender: TObject);
begin
  dtmdlStock.Free;
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.btnLUProductsClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtLUProducts := TfrmwtLUProducts.create(self);
  try
    frmwtLUProducts.Product := SOCharge.Product;
    frmwtLUProducts.ProductCode := SOCharge.ProductCode;
    frmwtLUProducts.isLookup := true;
    frmwtLUProducts.showmodal;
    if frmwtLUProducts.modalresult = idOK then
      begin
        if frmwtLUProducts.dbgDetails.SelectedRows.Count = 1 then
          begin
            SOCharge.Product := frmwtLUProducts.Product;
            SOCharge.ProductCode := frmwtLUProducts.ProductCode;
            edtProduct.Text := SOCharge.ProductCode;
            edtDescription.text := dtmdlStock.GetProductdescription(edtProduct.text);
            memSellPrice.text := formatfloat('0.00',dtmdlStock.GetProductPrice(edtProduct.text));
            dblkpVat.KeyValue := dtmdlStock.GetProductVat(edtProduct.text);
            edtPackSize.text := '1';
          end
        else
          begin
            if MessageDlg('Do you want to add the selected products to the order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                SOCharge.free;
                for iCount := 0 to (frmwtLUProducts.dbgDetails.SelectedRows.Count - 1) do
                  begin
                    frmwtLUProducts.dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(frmwtLUProducts.dbgDetails.SelectedRows[iCount])) ;

                    SOCharge := TSOCharge.Create(SOrder);
                    try
                      SOCharge.AssociateCustomer := self.Customer;
                      SOCharge.AssociateCustomerName := edtCustomerName.Text;
                      SOCharge.Product := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Product').asinteger;
                      SOCharge.ProductCode := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Product_Code').asstring;
                      SOCharge.UnitPrice := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Unit_Price').asfloat;
                      SOCharge.SellUnit := 1;
                      SOCharge.Quantity := 1;
                      SOCharge.ProductDescription := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Product_Description').asstring;
                      SOCharge.VAT := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('VAT').asinteger;
                      SOCharge.VATRate := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('VAT_Rate').asfloat;
                      SOCharge.VATDescription := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('VAT_Description').asstring;
                      SOCharge.Invoiced := 'N';
                      SOCharge.ParentID := 0;
                      SOCharge.SOLNumber := 0;

                      SOCharge.SOCNumber := SOCharge.Parent.Charges.MaxLineNo + 1;
//                      SOCharge.Mode := 'A';
                      SOCharge.Parent.Charges.Add(SOCharge);
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
  CheckOK(self);
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.btnOKClick(Sender: TObject);
var
  inx : integer;
  iLine: integer;
  iCount: integer;
begin
  SOCharge.AssociateCustomer := Customer;
  SOCharge.UnitPrice := strtofloat(memSellPrice.text);
  SOCharge.SellUnit := strtoint(edtPackSize.text);
  SOCharge.Quantity := 1;
  SOCharge.ProductDescription := edtDescription.Text;
  SOCharge.VAT := dblkpVat.keyvalue;
  SOCharge.VATRate := SOCharge.parent.datamodule.dtsVAT.dataset.fieldbyname('Vat_Rate').asfloat;
  SOCharge.VATDescription := SOCharge.parent.datamodule.dtsVAT.dataset.fieldbyname('Description').asstring;

  if Mode = socAdd then
  begin
    SOCharge.SOCNumber := SOCharge.Parent.Charges.MaxLineNo + 1;
    SOCharge.Invoiced := 'N';
//    SOCharge.Mode := 'A';
    SOCharge.Parent.Charges.Add(SOCharge);
  end
  else
  if Mode = socDelete then
  begin
    inx := SOCharge.Parent.Charges.IndexOf(SOCharge.SOCNumber);
    SOCharge.DeletefromDB;

    if SOCharge.SOLNumber > 0 then
      begin
        iLine := SOCharge.SOLNumber;
        for icount := 0 to pred(SOCharge.parent.Lines.count) do
          begin
            if SOCharge.parent.Lines[iCount].SOLNumber = iLine then
              SOCharge.parent.Lines[iCount].Quantity := SOCharge.parent.Lines[iCount].Quantity - 1;
          end;
//        SOCharge.parent.Lines[iLine-1].Quantity := SOCharge.parent.Lines[iLine-1].Quantity - 1;
      end;
    SOCharge.Parent.Charges.Delete(inx);

  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.ValidateQty(Sender: TObject);
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

procedure TfrmWTMaintSalesOrderAssociateCharge.ValidateMoney(Sender: TObject);
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

procedure TfrmWTMaintSalesOrderAssociateCharge.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.Button1Click(Sender: TObject);
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

procedure TfrmWTMaintSalesOrderAssociateCharge.SetChangeAll(const Value: boolean);
begin
  FChangeAll := Value;
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.Button2Click(Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        Customer := frmwtSrchCustomer.CodeSelected;
        SOCharge.AssociateCustomer := frmwtSrchCustomer.CodeSelected;
        SOCharge.AssociateCustomerName := frmwtSrchCustomer.NameSelected;
        edtCustomerName.text := frmwtSrchCustomer.NameSelected;
      end;
  finally
    frmwtSrchCustomer.free;
  end;
  CheckOK(self);
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.SetMode(const Value: TsocMode);
begin
  FMode := Value;
  lblDelete.visible := (FMode = socDelete);
  pnlDetails.enabled := not (FMode = socDelete);
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.SetSOCharge(
  const Value: TSOCharge);
begin
  FSOCharge := Value;
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.SetSOrder(
  const Value: TSOrder);
begin
  FSOrder := Value;
end;

procedure TfrmWTMaintSalesOrderAssociateCharge.SetCustomer(
  const Value: integer);
begin
  FCustomer := Value;
end;

end.
