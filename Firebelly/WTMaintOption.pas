unit WTMaintOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, DBCtrls;

type
  TfrmWTMaintOption = class(TForm)
    Label1: TLabel;
    edtDescription: TEdit;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    dblkpOptions: TDBLookupComboBox;
    dtsOptions: TDataSource;
    qryOptions: TQuery;
    Label3: TLabel;
    edtQuoteDescription: TMemo;
    procedure EnableOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpOptionsClick(Sender: TObject);
  private
    FCustomer: integer;
    FMaterialType: integer;
    procedure SetCustomer(const Value: integer);
    procedure SetMaterialType(const Value: integer);
    { Private declarations }
  public
    bOK: boolean;
    property Customer: integer read FCustomer write SetCustomer;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    { Public declarations }
  end;

var
  frmWTMaintOption: TfrmWTMaintOption;

implementation

{$R *.dfm}

procedure TfrmWTMaintOption.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpOptions.Text <> '') and
                    (edtDescription.text <> '') and
                    (edtQuoteDescription.Text <> '');
end;

procedure TfrmWTMaintOption.btnOKClick(Sender: TObject);
begin
  bOK := true;
  close;
end;

procedure TfrmWTMaintOption.BitBtn2Click(Sender: TObject);
begin
  bOK := false;
  close;
end;

procedure TfrmWTMaintOption.FormActivate(Sender: TObject);
begin
  with qryoptions do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;
    end;
  enableok(self);
end;

procedure TfrmWTMaintOption.dblkpOptionsClick(Sender: TObject);
begin
  if trim(edtDescription.Text) = '' then
    edtdescription.Text := dtsOptions.DataSet.fieldbyname('Group_description').asstring;
  MaterialType := dtsOptions.DataSet.fieldbyname('Material_Type').asinteger;
  enableOK(self);
end;

procedure TfrmWTMaintOption.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWTMaintOption.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

end.
