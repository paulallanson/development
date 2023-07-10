unit WTContractSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WTContractsDM;

type
  TfrmWTContractSearch = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lblMaterial: TLabel;
    Label3: TLabel;
    edtDescription: TEdit;
    edtDeveloper: TEdit;
    btnSearch: TButton;
    edtSiteLocation: TEdit;
    ClearButton: TButton;
    chkbxShowLive: TCheckBox;
    chkbxShowinactive: TCheckBox;
    Label4: TLabel;
    edtOfficeContact: TEdit;
    Label5: TLabel;
    edtOperatorName: TEdit;
    Label6: TLabel;
    edtQuoteReference: TEdit;
    procedure btnSearchClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlContract: TdtmdlContract;
  end;

var
  frmWTContractSearch: TfrmWTContractSearch;

implementation

{$R *.dfm}

procedure TfrmWTContractSearch.btnSearchClick(Sender: TObject);
begin
  dtmdlContract.Description := Trim(edtDescription.Text);
  dtmdlContract.SiteLocation := Trim(edtSiteLocation.Text);
  dtmdlContract.Developer := Trim(edtDeveloper.Text);
  dtmdlContract.OfficeContact := Trim(edtOfficeContact.Text);
  dtmdlContract.OperatorName := Trim(edtOperatorName.Text);
  dtmdlContract.ShowLive := chkbxShowLive.checked;
  dtmdlContract.QuoteReference := Trim(edtQuoteReference.Text);
  if chkbxShowInactive.checked then
    dtmdlContract.ShowInactive := 'Y'
  else
    dtmdlContract.ShowInactive := 'N';

  dtmdlContract.refreshAlldata;
  close;
end;

procedure TfrmWTContractSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  btnsearchclick(self);
end;

end.
