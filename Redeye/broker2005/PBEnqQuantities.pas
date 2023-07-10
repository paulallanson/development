unit PBEnqQuantities;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, contnrs, PBEnquiryDataMod;

type
  TPBEnqQuantitiesFrm = class(TForm)
    Edit0: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    btbtnOK: TBitBtn;
    btbtnCancel: TBitBtn;
    btnReinstate1: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure FormShow(Sender: TObject);
    procedure Edit0KeyPress(Sender: TObject; var Key: Char);
    procedure Edit0Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  PBEnqQuantitiesFrm: TPBEnqQuantitiesFrm;

implementation

{$R *.DFM}

{ TPBEnqQuantitiesFrm }

procedure TPBEnqQuantitiesFrm.FormShow(Sender: TObject);
begin
  edit1.enabled := (edit0.text <> '');
  edit2.enabled := (edit1.text <> '');
  edit3.enabled := (edit2.text <> '');
  edit4.enabled := (edit3.text <> '');
  edit5.enabled := (edit4.text <> '');
  edit6.enabled := (edit5.text <> '');
  edit7.enabled := (edit6.text <> '');
  edit8.enabled := (edit7.text <> '');
  edit9.enabled := (edit8.text <> '');
end;

procedure TPBEnqQuantitiesFrm.Edit0KeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
  begin
    P := Pos('.', Text);
  end;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBEnqQuantitiesFrm.Edit0Change(Sender: TObject);
begin
  if edit1.text = '' then
    edit1.enabled := (edit0.text <> '');
end;

procedure TPBEnqQuantitiesFrm.Edit1Change(Sender: TObject);
begin
  if edit2.text = '' then
    edit2.enabled := (edit1.text <> '');
end;

procedure TPBEnqQuantitiesFrm.Edit2Change(Sender: TObject);
begin
  if edit3.text = '' then
    edit3.enabled := (edit2.text <> '');
end;

procedure TPBEnqQuantitiesFrm.Edit3Change(Sender: TObject);
begin
  if edit4.text = '' then
    edit4.enabled := (edit3.text <> '');
end;

procedure TPBEnqQuantitiesFrm.Edit4Change(Sender: TObject);
begin
  if edit5.text = '' then
    edit5.enabled := (edit4.text <> '');
end;

procedure TPBEnqQuantitiesFrm.Edit5Change(Sender: TObject);
begin
  if edit6.text = '' then
    edit6.enabled := (edit5.text <> '');
end;

procedure TPBEnqQuantitiesFrm.Edit6Change(Sender: TObject);
begin
  if edit7.text = '' then
    edit7.enabled := (edit8.text <> '');
end;

procedure TPBEnqQuantitiesFrm.Edit7Change(Sender: TObject);
begin
  if edit8.text = '' then
    edit8.enabled := (edit7.text <> '');
end;

procedure TPBEnqQuantitiesFrm.Edit8Change(Sender: TObject);
begin
  if edit9.text = '' then
     edit9.enabled := (edit8.text <> '');
end;

end.
