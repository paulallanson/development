unit WTMaintSupplierWorktop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CRControls, Buttons, Spin, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintSupplierWorktop = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    lblWorktop: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    lblSupplierName: TLabel;
    Label1: TLabel;
    spnAdhesiveQuantity: TSpinEdit;
    edtAdhesiveProduct: TEdit;
    Label3: TLabel;
    edtAdhesiveDescription: TEdit;
    btnLUProducts: TSpeedButton;
    btnClear: TBitBtn;
    qryUpdSupplierWorktop: TFDQuery;
    qryGetSupplierWorktop: TFDQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnLUProductsClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FSupplier: integer;
    FWorktop: integer;
    procedure SetSupplier(const Value: integer);
    procedure SetWorktop(const Value: integer);
    { Private declarations }
  public
    bOK: boolean;
    property Supplier: integer read FSupplier write SetSupplier;
    property Worktop: integer read FWorktop write SetWorktop;
  end;

var
  frmWTMaintSupplierWorktop: TfrmWTMaintSupplierWorktop;

implementation

uses wtDataModule, wtMain, WTLUSupplierProduct;

{$R *.dfm}

procedure TfrmWTMaintSupplierWorktop.BitBtn2Click(Sender: TObject);
begin
  bOK := false;
end;

procedure TfrmWTMaintSupplierWorktop.btnLUProductsClick(Sender: TObject);
begin
  frmWTLUSupplierProduct := TfrmWTLUSupplierProduct.create(self);

  try
    frmWTLUSupplierProduct.supplier := Supplier;
    frmWTLUSupplierProduct.CodeSelected := edtAdhesiveProduct.text;
    frmWTLUSupplierProduct.showmodal;
    if frmWTLUSupplierProduct.ModalResult = mrOK then
      begin
//        edtProductCode.Text := frmWTLUSupplierProduct.CodeSelected;
        edtAdhesiveProduct.Text := frmWTLUSupplierProduct.CodeSelected;
        edtAdhesiveDescription.Text := frmWTLUSupplierProduct.DescriptionSelected;
      end;
  finally
    frmWTLUSupplierProduct.free;
  end;

end;

procedure TfrmWTMaintSupplierWorktop.btnClearClick(Sender: TObject);
begin
  edtAdhesiveProduct.clear;
  edtAdhesiveDescription.clear;
end;

procedure TfrmWTMaintSupplierWorktop.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TfrmWTMaintSupplierWorktop.btnOKClick(Sender: TObject);
begin
  with qryUpdSupplierWorktop do
    begin
      close;
      parambyname('Supplier').asinteger := supplier;
      parambyname('Worktop').asinteger := worktop;
      parambyname('Adhesive_Product_Code').asstring := edtAdhesiveProduct.text;
      parambyname('Adhesive_Quantity_Per_Slab').asinteger := spnAdhesiveQuantity.value;
      execsql;
    end;
  bOK := true;
end;

procedure TfrmWTMaintSupplierWorktop.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintSupplierWorktop.FormActivate(Sender: TObject);
begin
  with qryGetSupplierWorktop do
    begin
      close;
      parambyname('Supplier').asinteger := supplier;
      parambyname('Worktop').asinteger := worktop;
      open;

      edtAdhesiveProduct.text := fieldbyname('Adhesive_Product_Code').asstring;
      edtAdhesiveDescription.text := fieldbyname('Adhesive_Description').asstring;
      spnAdhesiveQuantity.value := fieldbyname('Adhesive_Quantity_Per_Slab').asinteger;

    end;
end;

end.
