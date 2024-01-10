unit WTSOrderSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wtSalesOrderDM, QrCtrls, Spin;

type
  TfrmWTSOrderSearch = class(TForm)
    Label2: TLabel;
    edtReference: TEdit;
    btnSearch: TButton;
    lblMaterial: TLabel;
    edtCustomerOrder: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtStatus: TEdit;
    ClearButton: TButton;
    chkbxShowLive: TCheckBox;
    chkbxShowInactive: TCheckBox;
    Label1: TLabel;
    edtDescription: TEdit;
    Label5: TLabel;
    edtOfficeContact: TEdit;
    Label6: TLabel;
    edtOperatorName: TEdit;
    Label7: TLabel;
    edtProjectReference: TEdit;
    Label8: TLabel;
    edtQuote: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    spnedtRecords: TSpinEdit;
    Label11: TLabel;
    edtSiteName: TEdit;
    procedure btnSearchClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlSalesOrder: TdtmdlSalesOrder;
  end;

var
  frmWTSOrderSearch: TfrmWTSOrderSearch;

implementation

{$R *.dfm}

procedure TfrmWTSOrderSearch.btnSearchClick(Sender: TObject);
begin
  dtmdlSalesOrder.CustomerOrder := Trim(edtCustomerOrder.Text);
  dtmdlSalesOrder.Description := Trim(edtDescription.Text);
  dtmdlSalesOrder.ProjectReference := Trim(edtProjectReference.Text);
  dtmdlSalesOrder.SiteName := Trim(edtSiteName.Text);
  dtmdlSalesOrder.Reference := Trim(edtReference.Text);
  dtmdlSalesOrder.QuoteReference := Trim(edtQuote.Text);
  dtmdlSalesOrder.status := Trim(edtStatus.Text);
  dtmdlSalesOrder.OfficeContact := Trim(edtOfficeContact.Text);
  dtmdlSalesOrder.OperatorName := Trim(edtOperatorName.Text);
  dtmdlSalesOrder.Showrecords := spnedtRecords.value;
  dtmdlSalesOrder.ShowLive := chkbxShowLive.checked;
  dtmdlSalesOrder.ShowInactive := chkbxShowInactive.checked;
  dtmdlSalesOrder.refreshAlldata;
  close;
end;

procedure TfrmWTSOrderSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  btnsearchclick(self);
end;

end.
