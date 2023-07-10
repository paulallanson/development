unit PBMaintSuppInvoicePass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, PBSupplierInvoiceDm;

type
  TPBMaintSuppInvoicePassFrm = class(TForm)
    rdgrpSelection: TRadioGroup;
    CloseBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FMode: string;
    FSupplierInvoice: TSuppInvoice;
    FInvoiceorCredit: string;
    procedure SetMode(const Value: string);
    procedure SetSupplierInvoice(const Value: TSuppInvoice);
    procedure SetInvoiceorCredit(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property InvoiceorCredit: string read FInvoiceorCredit write SetInvoiceorCredit;
    property Mode: string read FMode write SetMode;
    property SupplierInvoice: TSuppInvoice read FSupplierInvoice write SetSupplierInvoice;
  end;

var
  PBMaintSuppInvoicePassFrm: TPBMaintSuppInvoicePassFrm;

implementation

{$R *.DFM}

{ TPBMaintSuppInvoicePassFrm }

procedure TPBMaintSuppInvoicePassFrm.SetMode(const Value: string);
begin
  FMode := Value;
  if FMode = 'P' then
    rdGrpSelection.caption := 'Passing Invoices'
  else
  if FMode = 'R' then
    rdGrpSelection.caption := 'Reset Invoices'
  else
  if FMode = 'Q' then
    rdGrpSelection.caption := 'Query Invoices';
end;

procedure TPBMaintSuppInvoicePassFrm.OKBitBtnClick(Sender: TObject);
begin
  if Mode = 'P' then
    begin
      case rdgrpSelection.itemindex of
        0: SupplierInvoice.SaveStatus(20);
        1: dmSupplierInvoice.SaveStatusAll(10,20,InvoiceorCredit);
      end;
    end
  else
  if Mode = 'R' then
    begin
      case rdgrpSelection.itemindex of
        0: SupplierInvoice.SaveStatus(10);
        1: dmSupplierInvoice.SaveStatusAll(20,10,InvoiceorCredit);
      end;
    end;
end;

procedure TPBMaintSuppInvoicePassFrm.SetSupplierInvoice(
  const Value: TSuppInvoice);
begin
  FSupplierInvoice := Value;
end;

procedure TPBMaintSuppInvoicePassFrm.FormCreate(Sender: TObject);
begin
  dmSupplierInvoice := TdmSupplierInvoice.create(self);
end;

procedure TPBMaintSuppInvoicePassFrm.FormDestroy(Sender: TObject);
begin
  dmSupplierInvoice.free;
end;

procedure TPBMaintSuppInvoicePassFrm.SetInvoiceorCredit(
  const Value: string);
begin
  FInvoiceorCredit := Value;
  if FInvoiceorCredit = 'C' then
    caption := 'Pass/Revoke Supplier Credits';
end;

end.
