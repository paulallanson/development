unit WTMaintAddress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, WTContractsDM;

type
  TfrmWTMaintAddress = class(TForm)
    Label4: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label20: TLabel;
    Label6: TLabel;
    edtTelephone: TEdit;
    edtEmail: TEdit;
    Telephone: TLabel;
    Email: TLabel;
    Label24: TLabel;
    edtCustomerName: TEdit;
    edtStreet: TEdit;
    edtlocale: TEdit;
    edtTown: TEdit;
    edtPostcode: TEdit;
    edtCounty: TEdit;
    edtContact: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
  private
    { Private declarations }
  public
    Contract: TContract
    { Public declarations }
  end;

var
  frmWTMaintAddress: TfrmWTMaintAddress;

implementation

{$R *.dfm}

end.
