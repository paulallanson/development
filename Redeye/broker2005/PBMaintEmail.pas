unit PBMaintEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, DBCtrls, ExtCtrls;

type
  TPBMaintEmailFrm = class(TForm)
    grpbxContact: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtEmail: TEdit;
    dblkpContacts: TDBLookupComboBox;
    qrySContacts: TQuery;
    qryCContacts: TQuery;
    dtsContacts: TDataSource;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtSubject: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure dtsContactsDataChange(Sender: TObject; Field: TField);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  PBMaintEmailFrm: TPBMaintEmailFrm;

const
  atCustomerOnly = 0;
  atSupplierOnly = 1;
  atCustomerAndSupplier = 2;

implementation

{$R *.DFM}

procedure TPBMaintEmailFrm.GetSupplierContacts;
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

procedure TPBMaintEmailFrm.GetCustomerContacts;
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

procedure TPBMaintEmailFrm.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TPBMaintEmailFrm.SetSupplierContact(const Value: integer);
begin
  FSupplierContact := Value;
end;

procedure TPBMaintEmailFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TPBMaintEmailFrm.SetCustomerContact(const Value: integer);
begin
  FCustomerContact := Value;
end;

procedure TPBMaintEmailFrm.SetCustomerBranch(const Value: integer);
begin
  FCustomerBranch := Value;
end;

procedure TPBMaintEmailFrm.SetSupplierBranch(const Value: integer);
begin
  FSupplierBranch := Value;
end;

procedure TPBMaintEmailFrm.dtsContactsDataChange(Sender: TObject;
  Field: TField);
begin
  edtEmail.text := dtsContacts.dataset.fieldbyname('Email').asstring;
end;

procedure TPBMaintEmailFrm.FormShow(Sender: TObject);
begin
  case self.AddressType of
    atCustomerOnly:
    begin
      GetCustomerContacts;
    end;
    atSupplierOnly:
    begin
      GetSupplierContacts;
    end;
  end;
  enableok(self);
  edtSubject.setfocus;
end;

procedure TPBMaintEmailFrm.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtEmail.text <> '') and
                    (edtSubject.text <> '');
end;

procedure TPBMaintEmailFrm.SetAddressType(const Value: integer);
begin
  FAddressType := Value;
end;

end.
