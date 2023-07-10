unit WTJobSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wtJobsDM, gtQrCtrls, Spin;

type
  TfrmWTJobSearch = class(TForm)
    Label3: TLabel;
    Label1: TLabel;
    edtDescription: TEdit;
    edtReference: TEdit;
    Label2: TLabel;
    lblMaterial: TLabel;
    edtMaterial: TEdit;
    btnSearch: TButton;
    Label4: TLabel;
    edtOrderRef: TEdit;
    ClearButton: TButton;
    chkbxShowWIP: TCheckBox;
    Label5: TLabel;
    edtProjectReference: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    spnedtRecords: TSpinEdit;
    chkbxShowInactive: TCheckBox;
    procedure btnSearchClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlJob: TdtmdlJob;
  end;

var
  frmWTJobSearch: TfrmWTJobSearch;

implementation

{$R *.dfm}

procedure TfrmWTJobSearch.btnSearchClick(Sender: TObject);
begin
  dtmdlJob.Description := Trim(edtDescription.Text);
  dtmdlJob.ProjectReference := Trim(edtProjectReference.Text);
  dtmdlJob.Reference := Trim(edtReference.Text);
  dtmdlJob.Material := Trim(edtMaterial.Text);
  dtmdlJob.OrderRef := Trim(edtOrderRef.Text);
  dtmdlJob.Showrecords := spnedtRecords.value;
  dtmdlJob.ShowWIP := chkbxShowWIP.checked;
  if chkbxShowInactive.checked then
    dtmdlJob.ShowInactive := 'Y'
  else
    dtmdlJob.ShowInactive := '';

  dtmdlJob.refreshAlldata;
  close;
end;

procedure TfrmWTJobSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  btnsearchclick(self);
end;

end.
