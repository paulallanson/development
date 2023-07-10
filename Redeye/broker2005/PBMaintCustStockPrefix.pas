unit PBMaintCustStockPrefix;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, pbCustomerDM, Grids, DBGrids;

type
  TPBMaintCustStockPrefixFrm = class(TForm)
    Label1: TLabel;
    edtProdPrefix: TEdit;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Label12: TLabel;
    DBGrid1: TDBGrid;
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtProdPrefixChange(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
  private
    procedure RefreshPrefixList;
    { Private declarations }
  public
    dtmdlOneCustomer: TdtmdlCustomers;
    iCustomer: integer;
    sPrefix: string;
  end;

var
  PBMaintCustStockPrefixFrm: TPBMaintCustStockPrefixFrm;

implementation

{$R *.dfm}

procedure TPBMaintCustStockPrefixFrm.OKBitBtnClick(Sender: TObject);
begin
  with dtmdlOneCustomer.UpdPrefixSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := icustomer;
      ParamByName('Product_Code_Prefix').Asstring := edtProdPrefix.text;
      execsql;
    end;
  modalResult := mrok;
end;

procedure TPBMaintCustStockPrefixFrm.FormActivate(Sender: TObject);
begin
  with dtmdlOneCustomer.qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      open;
      edtProdPrefix.text := FieldByName('Product_Code_Prefix').Asstring;
    end;
  dbgrid1.DataSource := dtmdlOneCustomer.dtsrcCustProdPrefix;
end;

procedure TPBMaintCustStockPrefixFrm.FormCreate(Sender: TObject);
begin
  dtmdlOneCustomer := TdtmdlCustomers.create(self);
end;

procedure TPBMaintCustStockPrefixFrm.edtProdPrefixChange(Sender: TObject);
begin
  if edtProdPrefix.Text <> '' then
    self.RefreshPrefixList;

end;

procedure TPBMaintCustStockPrefixFrm.RefreshPrefixList;
begin
  dtmdlOneCustomer.qryCustProdPrefix.close;
  dtmdlOneCustomer.qryCustProdPrefix.paramByName('Product_Code_Prefix').asString := edtProdPrefix.text + '%';
  dtmdlOneCustomer.qryCustProdPrefix.open;
end;

procedure TPBMaintCustStockPrefixFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

end.
