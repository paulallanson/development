unit wtMaintProduct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables, CRControls;

type
  TfrmWtMaintProduct = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    dblkpProductGroup: TDBLookupComboBox;
    Label6: TLabel;
    dblkpVatRate: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtCostPrice: TCREditMoney;
    edtSellPrice: TCREditMoney;
    qryProductGroup: TQuery;
    qryVat: TQuery;
    dtsProductGroup: TDataSource;
    dtsVAT: TDataSource;
    Label8: TLabel;
    edtPackSize: TCREditInt;
    Label7: TLabel;
    edtCostQty: TCREditInt;
    BitBtn1: TBitBtn;
    chkbxInactive: TCheckBox;
    edtProductCode: TEdit;
    edtProductDescription: TEdit;
    edtDefaultSalesNominal: TEdit;
    edtDefaultPurchaseNominal: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FFunctionMode: string;
    FSellPrice: currency;
    FCostPrice: currency;
    FPricePointer: integer;
    procedure SetFunctionMode(const Value: string);
    procedure SetCostPrice(const Value: currency);
    procedure SetPricePointer(const Value: integer);
    procedure SetSellPrice(const Value: currency);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    { Public declarations }
    iCode: integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property PricePointer: integer read FPricePointer write SetPricePointer;
  end;

var
  frmWtMaintProduct: TfrmWtMaintProduct;

implementation

uses
  wtLUProducts, wtDataModule, wtLUProductGroups, ComObj, ActiveX, wtMain;

{$R *.DFM}

procedure TfrmWtMaintProduct.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWtMaintProduct.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWtMaintProduct.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtProductCode.Text := '';
      edtProductDescription.Text := '';
      dblkpProductGroup.KeyValue := 0;
      dblkpVatRate.KeyValue := 0;
      edtCostPrice.Text := '0.00';
      edtSellPrice.Text := '0.00';
      edtCostQty.Text := '1';
      edtPackSize.Text := '1';
      edtDefaultSalesNominal.Text := '';
      edtDefaultPurchaseNominal.Text := '';
      chkbxInactive.Checked := false;
    end
  else
    with frmWTLUProducts.lkpProducts do
      begin
        iCode := fieldbyname('Product').asinteger;

        edtProductCode.Text := fieldbyname('Product_Code').asstring;
        edtProductDescription.Text := fieldbyname('Product_Description').asstring;
        dblkpProductGroup.KeyValue := fieldbyname('Product_Group').asinteger;
        dblkpVatRate.KeyValue := fieldbyname('Vat').asinteger;
        edtDefaultSalesNominal.Text := fieldbyname('Default_Sales_Nominal').asstring;
        edtDefaultPurchaseNominal.Text := fieldbyname('Default_Purchase_Nominal').asstring;
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWtMaintProduct.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtProductDescription.Text <> '') and
                    (edtProductCode.Text <> '') and
                    (dblkpVatRate.Text <> '');
end;

procedure TfrmWtMaintProduct.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
  edtCostPrice.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWtMaintProduct.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWtMaintProduct.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  edtSellPrice.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmWtMaintProduct.FormCreate(Sender: TObject);
begin
  qryProductGroup.active := false;
  qryProductGroup.active := true;

  qryVAT.active := false;
  qryVAT.active := true;
end;

procedure TfrmWtMaintProduct.BitBtn1Click(Sender: TObject);
begin
  frmwtLUProductGroups := TfrmwtLUProductGroups.create(self);
  try
    frmwtLUProductGroups.showmodal;
  finally
    frmwtLUProductGroups.free;
  end;

  qryProductGroup.active := false;
  qryProductGroup.active := true;

end;

procedure TfrmWtMaintProduct.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
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

      iCode := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('Product').asinteger := iCode;

      parambyname('Product_Code').asstring := edtProductCode.Text;
      parambyname('Product_Description').asstring := edtProductDescription.Text;

      parambyname('Default_Sales_Nominal').asstring := edtDefaultSalesNominal.Text;
      parambyname('Default_Purchase_Nominal').asstring := edtDefaultPurchaseNominal.Text;

      if dblkpProductGroup.keyvalue = 0 then
        parambyname('Product_Group').clear
      else
        parambyname('Product_Group').asinteger := dblkpProductGroup.keyvalue;

      if dblkpVatRate.keyvalue = 0 then
        parambyname('Vat').clear
      else
        parambyname('Vat').asinteger := dblkpVatRate.keyvalue;

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;

    {Action Price Change if there has been a change to cost or sell}
    if (strtofloat(edtSellPrice.text) <> SellPrice) or
         (strtofloat(edtCostPrice.text) <> CostPrice) then
      begin
	      dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := strtofloat(edtSellPrice.text);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := strtofloat(edtCostPrice.text);
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
	      dtmdlWorktops.qryAddPrice.execSQL;
      end;
  end;
end;

function TfrmWtMaintProduct.GetNextKey: integer;
var
  sText: string;
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert product record
    with qryAdd do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'Max(Product)', 'ISNULL(Max(Product),0)', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      ParamByName('GUID').AsString := GuidToString(aGuid);
      ParamByName('Price_Pointer').Asinteger := PricePointer;
      ParamByName('Vat').Asinteger := dblkpVatRate.keyvalue;
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Product').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWtMaintProduct.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Product ' +
            '(Product, Product_Code, Product_Description, Price_Pointer, VAT, inactive) ' +
            'VALUES(0, ''Code'', ''Dummy'', 1, 1, ' + inttostr(dblkpVatRate.keyvalue) + ', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintProduct.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Product Where Product = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
