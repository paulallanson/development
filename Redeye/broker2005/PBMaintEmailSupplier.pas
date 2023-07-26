unit PBMaintEmailSupplier;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBCtrls, ExtCtrls, PBJobBagDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintEmailSupplierFrm = class(TForm)
    grpbxContact: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtEmail: TEdit;
    qrySContacts: TFDQuery;
    dtsContacts: TDataSource;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtSubject: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label4: TLabel;
    dblkpContacts: TDBLookupComboBox;
    dblkpSuppliers: TDBLookupComboBox;
    qrySuppliers: TFDQuery;
    dtsSuppliers: TDataSource;
    qryCContacts: TFDQuery;
    procedure dtsContactsDataChange(Sender: TObject; Field: TField);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpSuppliersClick(Sender: TObject);
  private
    FSupplier: integer;
    FSupplierContact: integer;
    FCustomer: integer;
    FCustomerContact: integer;
    FCustomerBranch: integer;
    FSupplierBranch: integer;
    FAddressType: integer;
    FJobBag: TJobBag;
    procedure GetSupplierContacts;
    procedure SetSupplier(const Value: integer);
    procedure SetSupplierContact(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerContact(const Value: integer);
    procedure GetCustomerContacts;
    procedure SetCustomerBranch(const Value: integer);
    procedure SetSupplierBranch(const Value: integer);
    procedure SetAddressType(const Value: integer);
    procedure SetJobBag(const Value: TJobBag);
    { Private declarations }
  public
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerBranch: integer read FCustomerBranch write SetCustomerBranch;
    property CustomerContact: integer read FCustomerContact write SetCustomerContact;
    property Supplier: integer read FSupplier write SetSupplier;
    property SupplierBranch: integer read FSupplierBranch write SetSupplierBranch;
    property SupplierContact: integer read FSupplierContact write SetSupplierContact;
    property AddressType: integer read FAddressType write SetAddressType;
    property JobBag: TJobBag read FJobBag write SetJobBag;
  end;

var
  PBMaintEmailSupplierFrm: TPBMaintEmailSupplierFrm;

const
  atCustomerOnly = 0;
  atSupplierOnly = 1;
  atCustomerAndSupplier = 2;

implementation

{$R *.DFM}

procedure TPBMaintEmailSupplierFrm.GetSupplierContacts;
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

procedure TPBMaintEmailSupplierFrm.GetCustomerContacts;
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

procedure TPBMaintEmailSupplierFrm.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TPBMaintEmailSupplierFrm.SetSupplierContact(const Value: integer);
begin
  FSupplierContact := Value;
end;

procedure TPBMaintEmailSupplierFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TPBMaintEmailSupplierFrm.SetCustomerContact(const Value: integer);
begin
  FCustomerContact := Value;
end;

procedure TPBMaintEmailSupplierFrm.SetCustomerBranch(const Value: integer);
begin
  FCustomerBranch := Value;
end;

procedure TPBMaintEmailSupplierFrm.SetSupplierBranch(const Value: integer);
begin
  FSupplierBranch := Value;
end;

procedure TPBMaintEmailSupplierFrm.dtsContactsDataChange(Sender: TObject;
  Field: TField);
begin
  edtEmail.text := dtsContacts.dataset.fieldbyname('Email').asstring;
end;

procedure TPBMaintEmailSupplierFrm.FormShow(Sender: TObject);
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

procedure TPBMaintEmailSupplierFrm.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtEmail.text <> '') and
                    (edtSubject.text <> '');
end;

procedure TPBMaintEmailSupplierFrm.SetAddressType(const Value: integer);
begin
  FAddressType := Value;
end;

procedure TPBMaintEmailSupplierFrm.FormActivate(Sender: TObject);
var
  i: integer;
begin
  with qrySuppliers do
    begin
      close;
      sql.add('AND Supplier.Supplier IN ');
      sql.add('(0');
      for i := 0 to pred(JobBag.Lines.count) do
        begin
          sql.add(', ' + inttostr(JobBag.Lines[i].Supplier));
        end;
      sql.add(')');
      open;
      if recordcount = 1 then
        begin
          dblkpSuppliers.keyvalue := fieldbyname('Supplier').asinteger;
          Supplier := dblkpSuppliers.keyvalue;
        end;
    end;
  GetSupplierContacts;
end;

procedure TPBMaintEmailSupplierFrm.SetJobBag(const Value: TJobBag);
begin
  FJobBag := Value;
end;

procedure TPBMaintEmailSupplierFrm.dblkpSuppliersClick(Sender: TObject);
begin
  Supplier := dblkpSuppliers.KeyValue;
  GetSupplierContacts;
end;

end.
