unit WTMaintCustAssociateCharge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmWTMaintCustAssociateCharge = class(TForm)
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtProduct: TEdit;
    btnLUProducts: TButton;
    edtDescription: TEdit;
    edtPackSize: TEdit;
    memSellPrice: TMemo;
    dblkpVAT: TDBLookupComboBox;
    Button1: TButton;
    pnlFunctions: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label3: TLabel;
    edtCustomerName: TEdit;
    Button2: TButton;
    qryGetCharge: TFDQuery;
    lkpVat: TFDQuery;
    dtsVat: TDataSource;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    chkbxInactive: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtProductKeyPress(Sender: TObject; var Key: Char);
    procedure btnLUProductsClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    sOldValue: string;
    FActivated: boolean;
    FChangeAll: boolean;
    FCostPrice: currency;
    FPricePointer: integer;
    FSellPrice: currency;
    FfunctionMode: string;
    procedure SetChangeAll(const Value: boolean);
    procedure SetCostPrice(const Value: currency);
    procedure SetfunctionMode(const Value: string);
    procedure SetPricePointer(const Value: integer);
    procedure SetSellPrice(const Value: currency);
    function GetLastKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    bOK: boolean;
    CustomerName: string;
    iAssociatedCustomer: integer;
    iCustomer: integer;
    iCode: integer;
    iProduct: integer;
    iVat: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
    property ChangeAll: boolean read FChangeAll write SetChangeAll;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property PricePointer: integer read FPricePointer write SetPricePointer;
  end;

var
  frmWTMaintCustAssociateCharge: TfrmWTMaintCustAssociateCharge;

implementation

uses wtStockDM, wtLUProducts, Allcommon, wtLUVat, wtSrchCustomer,
  wtDataModule, wtMain;

{$R *.dfm}

{ TfrmWTMaintCustAssociateCharge }

procedure TfrmWTMaintCustAssociateCharge.FormActivate(Sender: TObject);
var
  stext: string;
begin
  bOK := false;

  with lkpVat do
    begin
      close;
      open;
    end;

  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtCustomerName.Text := '';
      edtProduct.Text := '';
      edtDescription.text := '';
//      memPrice.Text := '0.00';
      memSellPrice.Text := '0.00';
      edtPackSize.Text := '1';
      dblkpVat.KeyValue := 0;
      chkbxInactive.Checked := false;
    end
  else
      with qryGetCharge do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('ID').asinteger := iCode;
          open;

          edtCustomerName.Text := fieldbyname('Associate_Customer_Name').asstring;
          edtProduct.Text := fieldbyname('Product_Code').asstring;
          edtDescription.text := fieldbyname('Product_Description').asstring;
          PricePointer := fieldbyname('Price_Pointer').asinteger;
          SellPrice := fieldbyname('Unit_Price').asfloat;
          edtPackSize.Text := '1';
          dblkpVat.KeyValue := fieldbyname('Vat').asinteger;
          chkbxInactive.Checked := false;
        end;
  EnableOK(self);
end;

procedure TfrmWTMaintCustAssociateCharge.EnableOK(Sender : TObject);
begin
  btnOK.enabled :=  (edtCustomerName.text <> '') and
                    (edtProduct.Text <> '') and
                    (memSellPrice.text <> '');
end;

procedure TfrmWTMaintCustAssociateCharge.edtProductKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if dtmdlStock.CheckProductExists(edtProduct.text) then
        begin
          iProduct := dtmdlStock.GetProduct(edtProduct.text);
          edtDescription.text := dtmdlStock.GetProductdescription(edtProduct.text);
//          memPrice.text := formatfloat('0.00',dtmdlStock.GetProductPrice(edtProduct.text));
          memSellPrice.text := formatfloat('0.00',dtmdlStock.GetProductPrice(edtProduct.text));
          dblkpVat.keyvalue := dtmdlStock.GetProductVat(edtProduct.text);
          edtPackSize.text := '1';
          memSellPrice.setfocus;
        end
      else
        begin
          MessageDlg('Invalid Product Code', mtError, [mbOk], 0);
          iProduct := 0;
          dblkpVat.KeyValue := 0;
          edtProduct.clear;
          edtProduct.setfocus;
        end;
    end;

end;

procedure TfrmWTMaintCustAssociateCharge.FormCreate(Sender: TObject);
begin
  dtmdlStock := TdtmdlStock.Create(self);
end;

procedure TfrmWTMaintCustAssociateCharge.FormDestroy(Sender: TObject);
begin
  dtmdlStock.Free;
end;

procedure TfrmWTMaintCustAssociateCharge.btnLUProductsClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtLUProducts := TfrmwtLUProducts.create(self);
  try
    frmwtLUProducts.Product := iProduct;
    frmwtLUProducts.ProductCode := edtProduct.Text;
    frmwtLUProducts.isLookup := true;
    frmwtLUProducts.showmodal;
    if frmwtLUProducts.modalresult = idOK then
      begin
        if frmwtLUProducts.dbgDetails.SelectedRows.Count = 1 then
          begin
            iProduct := frmwtLUProducts.Product;
            edtProduct.text := frmwtLUProducts.ProductCode;
            edtDescription.text := dtmdlStock.GetProductdescription(edtProduct.text);
//            memPrice.text := formatfloat('0.00',dtmdlStock.GetProductPrice(edtProduct.text));
            memSellPrice.text := formatfloat('0.00',dtmdlStock.GetProductPrice(edtProduct.text));
            dblkpVat.KeyValue := dtmdlStock.GetProductVat(edtProduct.text);
            edtPackSize.text := '1';
            memSellPrice.setfocus;
          end
        else
          begin
            if MessageDlg('Do you want to add the selected products to the charges?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                for iCount := 0 to (frmwtLUProducts.dbgDetails.SelectedRows.Count - 1) do
                  begin
                    frmwtLUProducts.dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(frmwtLUProducts.dbgDetails.SelectedRows[iCount])) ;
//                    frmwtLUProducts.dbgDetails.datasource.DataSet.GotoBookmark(Pointer(frmwtLUProducts.dbgDetails.SelectedRows[iCount])) ;

                    try
                      dtmdlWorktops.qryNewPrice.Close;
                      dtmdlWorktops.qryNewPrice.Open;
                      PricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

                      dtmdlWorktops.qryAddPointer.Close;
                      dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := PricePointer;
                      dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'E';
                                   dtmdlWorktops.qryAddPointer.ExecSQl;

                      with qryAdd do
                        begin
                          Close;
                          parambyname('Customer').asinteger := iCustomer;
                          parambyname('Associate_Customer').asinteger := iAssociatedCustomer;
                          parambyname('Product').asinteger := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Product').asinteger;
                          parambyname('Price_Pointer').asinteger := PricePointer;
                          parambyname('Vat').asinteger := frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('VAT').asinteger;

                          if chkbxInactive.Checked then
                            ParamByName('inActive').asstring := 'Y'
                          else
                            ParamByName('inActive').asstring := 'N';

                          ExecSQL;
                        end;

                        {Action Price Change if there has been a change to cost or sell}
                        dtmdlWorktops.qryAddPrice.Close;
                        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
                        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
                        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
                        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := dtmdlStock.GetProductPrice(frmwtLUProducts.dbgDetails.datasource.DataSet.fieldbyname('Product_Code').asstring);
                        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := 0.00;
                        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
                        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
                        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
                                     dtmdlWorktops.qryAddPrice.execSQL;

                    finally
                    end;
                  end;
                bOK := true;
                ModalResult := mrOK;
              end;
          end;
      end
  finally
    frmwtLUProducts.free;
  end;
end;

procedure TfrmWTMaintCustAssociateCharge.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  SaveToDB;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintCustAssociateCharge.ValidateQty(Sender: TObject);
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

procedure TfrmWTMaintCustAssociateCharge.ValidateMoney(Sender: TObject);
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

procedure TfrmWTMaintCustAssociateCharge.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmWTMaintCustAssociateCharge.Button1Click(Sender: TObject);
begin
  frmWTLUVat := TfrmWTLUVat.create(self);
  try
    frmWTLUVat.showmodal;
  finally
    frmWTLUVat.free;
  end;
end;

procedure TfrmWTMaintCustAssociateCharge.SetChangeAll(const Value: boolean);
begin
  FChangeAll := Value;
end;

procedure TfrmWTMaintCustAssociateCharge.Button2Click(Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := iCustomer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        iAssociatedCustomer := frmwtSrchCustomer.CodeSelected;
        edtCustomerName.text := frmwtSrchCustomer.NameSelected;
      end;
  finally
    frmwtSrchCustomer.free;
  end;
end;

procedure TfrmWTMaintCustAssociateCharge.SaveToDB;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
                   dtmdlWorktops.qryNewPrice.Close;
      dtmdlWorktops.qryNewPrice.Open;
      PricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

      dtmdlWorktops.qryAddPointer.Close;
      dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'E';
                   dtmdlWorktops.qryAddPointer.ExecSQl;

      with qryAdd do
        begin
          Close;
          parambyname('Customer').asinteger := iCustomer;
          parambyname('Associate_Customer').asinteger := iAssociatedCustomer;
          parambyname('Product').asinteger := iProduct;
          parambyname('Price_Pointer').asinteger := PricePointer;
          parambyname('Vat').asinteger := dblkpVat.KeyValue;

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
          iCode := GetLastKey;
        end;
    end
    else
    begin
      with qryUpdate do
        begin
          Close;
          parambyname('ID').asinteger := iCode;

          parambyname('Customer').asinteger := iCustomer;
          parambyname('Associate_Customer').asinteger := iAssociatedCustomer;
          parambyname('Product').asinteger := iProduct;
          parambyname('Vat').asinteger := dblkpVat.KeyValue;

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
        end;
    end;

    {Action Price Change if there has been a change to cost or sell}
    if (strtofloat(memSellPrice.text) <> SellPrice) then
      begin
                     dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(memSellPrice.text);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := 0.00;
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
                     dtmdlWorktops.qryAddPrice.execSQL;
      end;
  end;

  bOK := true;
end;

function TfrmWTMaintCustAssociateCharge.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('ID').AsInteger;
    end;
end;

procedure TfrmWTMaintCustAssociateCharge.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintCustAssociateCharge.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmWTMaintCustAssociateCharge.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
end;

procedure TfrmWTMaintCustAssociateCharge.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintCustAssociateCharge.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  memSellPrice.Text := formatfloat('0.00',FSellPrice);
end;

end.
