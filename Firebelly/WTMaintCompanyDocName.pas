unit WTMaintCompanyDocName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmWTMaintCompanyDocName = class(TForm)
    btnOK: TBitBtn;
    CancelBitBtn: TBitBtn;
    edtName: TEdit;
    Label1: TLabel;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
  private
    FMode: string;
    procedure SetMode(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    bOK: boolean;
    sName: string;
    property Mode: string read FMode write SetMode;
  end;

var
  frmWTMaintCompanyDocName: TfrmWTMaintCompanyDocName;

implementation

{$R *.dfm}

procedure TfrmWTMaintCompanyDocName.FormActivate(Sender: TObject);
begin
  if Mode = 'A' then
    edtName.text := ''
  else
    edtName.text := sName;

  EnableOK(self);
  edtName.SetFocus;
end;

procedure TfrmWTMaintCompanyDocName.SetMode(const Value: string);
begin
  FMode := Value;
  if Value = 'A' then
    caption := 'Add Folder Name'
  else
    caption := 'Chnage Folder Name';
end;

procedure TfrmWTMaintCompanyDocName.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (trim(edtName.Text) <> '');
end;

procedure TfrmWTMaintCompanyDocName.btnOKClick(Sender: TObject);
begin
  bOK := true;
  sName := edtName.Text;
end;

procedure TfrmWTMaintCompanyDocName.CancelBitBtnClick(Sender: TObject);
begin
  bOK := false;
end;

end.
