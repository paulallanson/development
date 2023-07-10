unit WTSInvoiceSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wtSalesInvoiceDM, gtQrCtrls, Spin;

type
  TfrmWTSInvoiceSearch = class(TForm)
    Label2: TLabel;
    edtReference: TEdit;
    btnSearch: TButton;
    lblOrderReference: TLabel;
    edtCustomerOrder: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtStatus: TEdit;
    ClearButton: TButton;
    chkbxShowInactive: TCheckBox;
    Label1: TLabel;
    edtDescription: TEdit;
    Label5: TLabel;
    edtOfficeContact: TEdit;
    Label6: TLabel;
    edtOperatorName: TEdit;
    Label8: TLabel;
    edtRepName: TEdit;
    procedure btnSearchClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    bInvoice: boolean;
    dtmdlSalesInvoice: TdtmdlSalesInvoice;
  end;

var
  frmWTSInvoiceSearch: TfrmWTSInvoiceSearch;

implementation

{$R *.dfm}

procedure TfrmWTSInvoiceSearch.btnSearchClick(Sender: TObject);
begin
  dtmdlSalesInvoice.CustomerOrder := Trim(edtCustomerOrder.Text);
  dtmdlSalesInvoice.Description := Trim(edtDescription.Text);
//  dtmdlSalesInvoice.ProjectReference := Trim(edtProjectReference.Text);
  dtmdlSalesInvoice.Reference := Trim(edtReference.Text);
  dtmdlSalesInvoice.status := Trim(edtStatus.Text);
  dtmdlSalesInvoice.OfficeContact := Trim(edtOfficeContact.Text);
  dtmdlSalesInvoice.OperatorName := Trim(edtOperatorName.Text);
  dtmdlSalesInvoice.RepName := Trim(edtRepName.Text);
  dtmdlSalesInvoice.ShowInactive := chkbxShowInactive.checked;
  if bInvoice then
    dtmdlSalesInvoice.Refreshdata
  else
    dtmdlSalesInvoice.RefreshCreditData;
  close;
end;

procedure TfrmWTSInvoiceSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  btnsearchclick(self);
end;

procedure TfrmWTSInvoiceSearch.FormActivate(Sender: TObject);
begin
  if bInvoice then
    lblOrderReference.caption := 'Sales Order'
  else
    lblOrderReference.caption := 'Sales Invoice';
end;

end.
