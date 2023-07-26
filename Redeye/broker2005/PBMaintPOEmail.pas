unit PBMaintPOEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBCtrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPOEmailFrm = class(TForm)
    rgAddressType: TRadioGroup;
    grpbxContact: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtEmail: TEdit;
    dblkpContacts: TDBLookupComboBox;
    qrySContacts: TFDQuery;
    qryCContacts: TFDQuery;
    dtsContacts: TDataSource;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtSubject: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure rgAddressTypeClick(Sender: TObject);
    procedure dtsContactsDataChange(Sender: TObject; Field: TField);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSupplier: integer;
    FSupplierContact: integer;
    FCustomer: integer;
    FCustomerContact: integer;
    FCustomerBranch: integer;
    FSupplierBranch: integer;
    FAddressType: integer;
    procedure GetSupplierContacts;
    procedure SetSupplier(const Value: integer);
    procedure SetSupplierContact(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerContact(const Value: integer);
    procedure GetCustomerContacts;
    procedure SetCustomerBranch(const Value: integer);
    procedure SetSupplierBranch(const Value: integer);
    procedure SetAddressType(const Value: integer);
    { Private declarations }
  public
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerBranch: integer read FCustomerBranch write SetCustomerBranch;
    property CustomerContact: integer read FCustomerContact write SetCustomerContact;
    property Supplier: integer read FSupplier write SetSupplier;
    property SupplierBranch: integer read FSupplierBranch write SetSupplierBranch;
    property SupplierContact: integer read FSupplierContact write SetSupplierContact;
    property AddressType: integer read FAddressType write SetAddressType;
  end;

var
  PBMaintPOEmailFrm: TPBMaintPOEmailFrm;

const
  atCustomerOnly = 0;
  atSupplierOnly = 1;
  atCustomerAndSupplier = 2;

implementation

{$R *.DFM}

procedure TPBMaintPOEmailFrm.rgAddressTypeClick(Sender: TObject);
begin
  case rgAddressType.itemindex of
    0:  GetSupplierContacts;
    1:  GetCustomerContacts;
  end;
end;

procedure TPBMaintPOEmailFrm.GetSupplierContacts;
begin
  with qrySContacts do
    begin
      close;
      parambyname('Supplier').asinteger := Supplier;
      open;
      dtsContacts.dataset := qrySContacts;
      dblkpContacts.keyvalue := SupplierContact;
      grpbxContact.Caption := 'Supplier';
    end;
end;

procedure TPBMaintPOEmailFrm.GetCustomerContacts;
begin
  with qryCContacts do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;
      dtsContacts.dataset := qryCContacts;
      dblkpContacts.keyvalue := CustomerContact;
      grpbxContact.Caption := 'Customer';
    end;
end;

procedure TPBMaintPOEmailFrm.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TPBMaintPOEmailFrm.SetSupplierContact(const Value: integer);
begin
  FSupplierContact := Value;
end;

procedure TPBMaintPOEmailFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TPBMaintPOEmailFrm.SetCustomerContact(const Value: integer);
begin
  FCustomerContact := Value;
end;

procedure TPBMaintPOEmailFrm.SetCustomerBranch(const Value: integer);
begin
  FCustomerBranch := Value;
end;

procedure TPBMaintPOEmailFrm.SetSupplierBranch(const Value: integer);
begin
  FSupplierBranch := Value;
end;

procedure TPBMaintPOEmailFrm.dtsContactsDataChange(Sender: TObject;
  Field: TField);
begin
  edtEmail.text := dtsContacts.dataset.fieldbyname('Email').asstring;
end;

procedure TPBMaintPOEmailFrm.FormShow(Sender: TObject);
begin
  case self.AddressType of
    atCustomerOnly:
    begin
      rgAddressType.ItemIndex := 1;
      rgAddressType.Enabled := false;
    end;
    atSupplierOnly:
    begin
      rgAddressType.ItemIndex := 0;
      rgAddressType.Enabled := false;
    end;
    atCustomerAndSupplier:
    begin
      rgAddressType.Enabled := true;
    end;
  end;
  rgAddressTypeClick(Self);
  enableok(self);
  edtSubject.setfocus;
end;

procedure TPBMaintPOEmailFrm.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtEmail.text <> '') and
                    (edtSubject.text <> '');
end;

procedure TPBMaintPOEmailFrm.SetAddressType(const Value: integer);
begin
  FAddressType := Value;
end;

procedure TPBMaintPOEmailFrm.FormCreate(Sender: TObject);
begin
  self.AddressType := atCustomerAndSupplier;
end;

end.
