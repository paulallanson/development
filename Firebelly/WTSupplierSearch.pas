unit WTSupplierSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmWTSupplierSearch = class(TForm)
    Label1: TLabel;
    edtStreet: TEdit;
    Label2: TLabel;
    edtlocale: TEdit;
    btnSearch: TButton;
    lblMaterial: TLabel;
    edtTown: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtPostcode: TEdit;
    ClearButton: TButton;
    Label5: TLabel;
    edtCounty: TEdit;
    Label6: TLabel;
    edtPhone: TEdit;
    procedure btnSearchClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frmWTSupplierSearch: TfrmWTSupplierSearch;

implementation

uses wtLUSupplier, AllCommon, DateSelV5;

{$R *.dfm}

procedure TfrmWTSupplierSearch.btnSearchClick(Sender: TObject);
begin
  frmWTLUSupplier.Street := Trim(edtStreet.Text);
  frmWTLUSupplier.Town := Trim(edtTown.Text);
  frmWTLUSupplier.County := Trim(edtCounty.Text);
  frmWTLUSupplier.Postcode := Trim(edtPostcode.Text);
  frmWTLUSupplier.TownLocale := Trim(edtLocale.Text);
  frmWTLUSupplier.Phone := Trim(edtPhone.Text);

  frmWTLUSupplier.refreshdata;
  close;
end;

procedure TfrmWTSupplierSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  btnsearchclick(self);
end;

end.
