unit WTMaintContractAddress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, WTContractsDM;

type
  TfrmWTMaintContractAddress = class(TForm)
    Label4: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label20: TLabel;
    Label6: TLabel;
    Telephone: TLabel;
    Email: TLabel;
    Label24: TLabel;
    edtTelephone: TEdit;
    edtEmail: TEdit;
    edtCustomerName: TEdit;
    edtStreet: TEdit;
    edtlocale: TEdit;
    edtTown: TEdit;
    edtPostcode: TEdit;
    edtCounty: TEdit;
    edtContact: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FContract: TContract;
    procedure SetContract(const Value: TContract);
    { Private declarations }
  public
    bOK: boolean;
    property Contract: TContract read FContract write SetContract;
    { Public declarations }
  end;

var
  frmWTMaintContractAddress: TfrmWTMaintContractAddress;

implementation

{$R *.dfm}

{ TfrmWTMaintContractAddress }

procedure TfrmWTMaintContractAddress.SetContract(const Value: TContract);
begin
  FContract := Value;
end;

procedure TfrmWTMaintContractAddress.FormActivate(Sender: TObject);
begin
  With Contract do
    begin
      edtCustomerName.text := CustomerName;
      edtContact.Text := ContactName;
      edtStreet.text := Street;
      edtLocale.text := Locality;
      edtTown.text := TownCity;
      edtPostcode.text := Postcode;
      edtCounty.text := County;
      edtTelephone.text := TelephoneNumber;
      edtEmail.text := EmailAddress;
    end;
  CheckOK(self);
end;

procedure TfrmWTMaintContractAddress.btnOKClick(Sender: TObject);
begin
  with Contract do
    begin
      CustomerName := edtCustomerName.Text;
      ContactName := edtContact.Text;
      Street := edtStreet.Text;
      Locality := edtLocale.Text;
      TownCity := edtTown.Text;
      Postcode := edtPostcode.text;
      County := edtCounty.Text;
      TelephoneNumber := edtTelephone.Text;
      EmailAddress := edtEmail.Text;
    end;
  bOK := true;
end;

procedure TfrmWTMaintContractAddress.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTMaintContractAddress.FormCreate(Sender: TObject);
begin
  bOK := false;
end;

procedure TfrmWTMaintContractAddress.CheckOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtCustomerName.Text <> '') and
                    (edtStreet.Text <> '') and
                    (edtTown.Text <> '') and
                    (edtPostcode.text <> '') and
                    (edtTelephone.text <> '');
end;

end.
