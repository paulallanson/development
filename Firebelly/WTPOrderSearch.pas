unit WTPOrderSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wtPurchasesDM, QrCtrls;

type
  TfrmWTPOrderSearch = class(TForm)
    Label2: TLabel;
    edtReference: TEdit;
    btnSearch: TButton;
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
    procedure btnSearchClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlPurchaseOrder: TdtmdlPurchaseOrder;
  end;

var
  frmWTPOrderSearch: TfrmWTPOrderSearch;

implementation

{$R *.dfm}

procedure TfrmWTPOrderSearch.btnSearchClick(Sender: TObject);
begin
  dtmdlPurchaseOrder.Description := Trim(edtDescription.Text);
  dtmdlPurchaseOrder.Reference := Trim(edtReference.Text);
  dtmdlPurchaseOrder.status := Trim(edtStatus.Text);
  dtmdlPurchaseOrder.OfficeContact := Trim(edtOfficeContact.Text);
  dtmdlPurchaseOrder.OperatorName := Trim(edtOperatorName.Text);
  dtmdlPurchaseOrder.ShowLive := chkbxShowLive.checked;
  dtmdlPurchaseOrder.ShowInactive := chkbxShowInactive.checked;
  dtmdlPurchaseOrder.refreshAlldata;
  close;
end;

procedure TfrmWTPOrderSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  btnsearchclick(self);
end;

end.
