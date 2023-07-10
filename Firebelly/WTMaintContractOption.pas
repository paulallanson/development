unit WTMaintContractOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, DBCtrls, WTContractsDM;

type
  TfrmWTMaintContractOption = class(TForm)
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
    btnOptions: TBitBtn;
    dblkpThickness: TDBLookupComboBox;
    Label4: TLabel;
    qryOptionThickness: TQuery;
    dtsOptionThickness: TDataSource;
    procedure EnableOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpOptionsClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure dblkpThicknessClick(Sender: TObject);
  private
    FCustomer: integer;
    FMaterialType: integer;
    FCustomerName: string;
    FMode: TcqoMode;
    procedure SetCustomer(const Value: integer);
    procedure SetMaterialType(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure GetOptions;
    procedure GetThickness;
    procedure SetMode(const Value: TcqoMode);
    { Private declarations }
  public
    bOK: boolean;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property Mode: TcqoMode read FMode write SetMode;
    { Public declarations }
  end;

var
  frmWTMaintContractOption: TfrmWTMaintContractOption;

implementation

uses WTLUCustWTGroups;

{$R *.dfm}

procedure TfrmWTMaintContractOption.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpOptions.Text <> '') and
                    (trim(edtDescription.text) <> '') and
                    (trim(edtQuoteDescription.Text) <> '');
end;

procedure TfrmWTMaintContractOption.btnOKClick(Sender: TObject);
begin
  bOK := true;
  close;
end;

procedure TfrmWTMaintContractOption.BitBtn2Click(Sender: TObject);
begin
  bOK := false;
  close;
end;

procedure TfrmWTMaintContractOption.FormActivate(Sender: TObject);
begin
  if Mode = cqoAdd then
    caption := 'Add option'
  else
  if Mode = cqoChange then
    caption := 'Change Option'
  else
  if Mode = cqoRename then
    begin
      caption := 'Rename option';
    end;

  GetOptions;
  GetThickness;
  enableok(self);
end;

procedure TfrmWTMaintContractOption.dblkpOptionsClick(Sender: TObject);
begin
  GetThickness;
  if trim(edtDescription.Text) = '' then
    edtdescription.Text := trim(dtsOptions.DataSet.fieldbyname('Group_description').asstring);
  MaterialType := dtsOptions.DataSet.fieldbyname('Material_Type').asinteger;
  enableOK(self);
end;

procedure TfrmWTMaintContractOption.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWTMaintContractOption.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintContractOption.btnOptionsClick(Sender: TObject);
begin
  frmWTLUCustWTGroups := TfrmWTLUCustWTGroups.create(self);
  try
    frmWTLUCustWTGroups.Customer := self.Customer;
    frmWTLUCustWTGroups.CustomerName := self.CustomerName;
    frmWTLUCustWTGroups.showmodal;
    GetOptions;
  finally
    frmWTLUCustWTGroups.free;
  end;
end;

procedure TfrmWTMaintContractOption.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TfrmWTMaintContractOption.GetOptions;
begin
  with qryoptions do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;
    end;
end;

procedure TfrmWTMaintContractOption.GetThickness;
begin
  with qryOptionThickness do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Group_Number').asinteger := qryOptions.fieldbyname('Group_Number').asinteger;
      open;
    end;
end;

procedure TfrmWTMaintContractOption.SetMode(const Value: TcqoMode);
begin
  FMode := Value;

  dblkpOptions.Enabled := (FMode <> cqoRename);
  btnOptions.enabled := (FMode <> cqoRename);
  dblkpThickness.Enabled := (FMode <> cqoRename);
end;

procedure TfrmWTMaintContractOption.dblkpThicknessClick(Sender: TObject);
begin
  if trim(edtDescription.Text) = trim(dtsOptions.DataSet.fieldbyname('Group_description').asstring) then
    edtdescription.Text := trim(dtsOptions.DataSet.fieldbyname('Group_description').asstring) + ' ('
                         + trim(dtsOptionThickness.DataSet.fieldbyname('Thickness_mm').asstring) + ')';
end;

end.
