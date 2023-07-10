unit WTMaintSupplierProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, wtPurchasesDM, CRControls,
  WTSupplierDM, DB, DBTables;

type
  TfrmWTMaintSupplierProduct = class(TForm)
    pnlFunctions: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pnlDetails: TPanel;
    pnlTop: TPanel;
    pnlCosts: TPanel;
    Label12: TLabel;
    edtUnitCost: TCREditMoney;
    Label3: TLabel;
    edtCostUnit: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    edtProductCode: TEdit;
    edtDescription: TEdit;
    Label4: TLabel;
    edtUnitPrice: TCREditMoney;
    Label5: TLabel;
    edtpriceUnit: TMemo;
    chkbxInactive: TCheckBox;
    qryCheckProduct: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FActivated: boolean;
    FMode: string;
    procedure SetPOLine(const Value: TPOLine);
    procedure SetMode(const Value: string);
    procedure ShowDetails;
    procedure SetActivated(const Value: boolean);
    function DoesProductExist: boolean;
    { Private declarations }
  public
    bOK: boolean;
    CodeID: integer;
    PricePointer: integer;
    oldUnitCost, oldUnitPrice: real;
    Supplier: integer;
    dtmdlOneSupplier: TdtmdlSuppliers;
    property Activated: boolean read FActivated write SetActivated;
    property Mode: string read FMode write SetMode;
  end;

var
  frmWTMaintSupplierProduct: TfrmWTMaintSupplierProduct;

implementation

uses wtLUMatType, wtDataModule, wtMain;

{$R *.dfm}

{ TfrmWTMaintPurchaseOrderLine }

procedure TfrmWTMaintSupplierProduct.SetMode(const Value: string);
begin
  FMode := Value;
  pnlDetails.enabled := not (FMode = 'D');
  pnlCosts.enabled := not (FMode = 'D');
end;

procedure TfrmWTMaintSupplierProduct.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin

    if Mode = 'A' then
      Caption := 'Add a Product'
    else
    if Mode = 'C' then
      Caption := 'Change a Product'
    else
      Caption := 'Delete a Product';

    ShowDetails;

    CheckOK(Self);
    FActivated := true;
  end;

end;

procedure TfrmWTMaintSupplierProduct.ShowDetails;
var
  stext: string;
begin
  if Mode <> 'A' then
    begin
      with dtmdlOneSupplier.qryGetSupplierProd do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('Supplier_Product').asinteger := CodeID;
          open;

          if recordcount <> 0 then
            begin
              edtProductCode.Text := fieldbyname('Supplier_Product_Code').asstring;
              edtDescription.Text := fieldbyname('Description').asstring;
              edtCostUnit.text := inttostr(fieldbyname('Cost_Pack_Quantity').asinteger);
              edtUnitCost.Text := formatfloat('0.00',fieldbyname('Unit_Cost').asfloat);
              edtPriceUnit.text := inttostr(fieldbyname('Sell_Pack_Quantity').asinteger);
              edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
                                                                         
              chkbxInactive.checked := (fieldbyname('inactive').asstring = 'Y');

              PricePointer := fieldbyname('Price_Pointer').asinteger;

              oldUnitCost := fieldbyname('Unit_Cost').asfloat;
              oldUnitPrice := fieldbyname('Unit_Price').asfloat;
            end;
        end
    end
  else
    begin
      oldUnitCost := 0.00;
      oldUnitPrice := 0.00;
      edtProductCode.Text := '';
      edtDescription.Text := '';
      edtCostUnit.text := '1';
      edtPriceUnit.text := '1';
      edtUnitCost.Text := formatfloat('0.00',0.00);
      edtUnitPrice.Text := formatfloat('0.00',0.00);
      PricePointer := 0;
    end;
end;

function TfrmWTMaintSupplierProduct.DoesProductExist: boolean;
begin
  result := false;
  with qryCheckProduct do
    begin
      close;
      parambyname('Supplier_Product_Code').asstring := trim(edtProductCode.text);
      parambyname('Supplier').asinteger := Supplier;
      open;

      result := (recordcount > 0);
    end;
end;

procedure TfrmWTMaintSupplierProduct.btnOKClick(Sender: TObject);
var
  inx : integer;
  UnitCost, UnitPrice: real;
begin
  UnitCost := strtofloat(edtUnitCost.text);
  UnitPrice := strtofloat(edtUnitPrice.text);

  if Mode = 'A' then
    begin
      {Check product deosn''t already exist}
      if DoesProductExist then
        begin
          MessageDlg('The product code you''re creating already exists.', mtError,
            [mbAbort], 0);
          exit;
        end;
        
      {Get Price Pointer}
      dtmdlWorktops.qryNewPrice.Close;
      dtmdlWorktops.qryNewPrice.Open;
      PricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	    dtmdlWorktops.qryAddPointer.Close;
      dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'A';
	    dtmdlWorktops.qryAddPointer.ExecSQl;

      {Add Supplier/Worktop record}
      dtmdlOneSupplier.qryAddSupplierProd.close;
      dtmdlOneSupplier.qryAddSupplierProd.parambyname('Supplier').asinteger := Supplier;
      dtmdlOneSupplier.qryAddSupplierProd.parambyname('Supplier_Product_Code').asstring := edtProductCode.text;
      dtmdlOneSupplier.qryAddSupplierProd.parambyname('Description').asstring := edtDescription.text;
      dtmdlOneSupplier.qryAddSupplierProd.parambyname('Cost_Pack_Quantity').asinteger := strtoint(edtCostUnit.text);
      dtmdlOneSupplier.qryAddSupplierProd.parambyname('Sell_Pack_Quantity').asinteger := strtoint(edtPriceUnit.text);
      if chkbxInactive.checked then
        dtmdlOneSupplier.qryAddSupplierProd.parambyname('Inactive').asstring := 'Y'
      else
        dtmdlOneSupplier.qryAddSupplierProd.parambyname('Inactive').asstring := 'N';

      dtmdlOneSupplier.qryAddSupplierProd.parambyname('Price_Pointer').asinteger := PricePointer;
      dtmdlOneSupplier.qryAddSupplierProd.execsql;
    end
  else
  if Mode = 'C' then
    begin
      {Add Supplier/Worktop record}
      dtmdlOneSupplier.qryUpdSupplierProd.close;
      dtmdlOneSupplier.qryUpdSupplierProd.parambyname('Supplier_Product').asinteger := CodeID;
      dtmdlOneSupplier.qryUpdSupplierProd.parambyname('Supplier_Product_Code').asstring := edtProductCode.text;
      dtmdlOneSupplier.qryUpdSupplierProd.parambyname('Description').asstring := edtDescription.text;
      dtmdlOneSupplier.qryUpdSupplierProd.parambyname('Cost_Pack_Quantity').asinteger := strtoint(edtCostUnit.text);
      dtmdlOneSupplier.qryUpdSupplierProd.parambyname('Sell_Pack_Quantity').asinteger := strtoint(edtPriceUnit.text);
      if chkbxInactive.checked then
        dtmdlOneSupplier.qryUpdSupplierProd.parambyname('Inactive').asstring := 'Y'
      else
        dtmdlOneSupplier.qryUpdSupplierProd.parambyname('Inactive').asstring := 'N';
      dtmdlOneSupplier.qryUpdSupplierProd.execsql;
    end;

  if ((UnitCost <> 0) and (UnitCost <> oldUnitCost)) OR ((UnitPrice <> 0) and (UnitPrice <> oldUnitPrice))then
    begin
      {Now add the cost price}
      dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'Q';
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := UnitPrice;
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := UnitCost;
	    dtmdlWorktops.qryAddPrice.execSQL;
    end;

  bOK := true;
  close;
end;

procedure TfrmWTMaintSupplierProduct.CheckOK(Sender : TObject);
begin
  btnOK.enabled :=
                    (edtDescription.text <> '') and
                    (edtUnitCost.text <> '') and
                    (edtCostUnit.text <> '');
end;

procedure TfrmWTMaintSupplierProduct.SetActivated(const Value: boolean);
begin
  FActivated := Value;
end;

procedure TfrmWTMaintSupplierProduct.SetPOLine(const Value: TPOLine);
begin

end;

procedure TfrmWTMaintSupplierProduct.FormCreate(Sender: TObject);
begin
  bOK := false;
end;

end.
