unit PBMaintJobBagLineDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PBJobBagDM;

type
  TPBMaintJobBagLineDetailsFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Label1: TLabel;
    memDescription: TMemo;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    FActivated: boolean;
    FMode: TJBMode;
    FJobBagLine: TJobBagLine;
    procedure SetJobBagLine(const Value: TJobBagLine);
    procedure SetMode(const Value: TJBMode);
  public
    property JobBagLine : TJobBagLine read FJobBagLine write SetJobBagLine;
    property Mode : TJBMode read FMode write SetMode;
  end;

var
  PBMaintJobBagLineDetailsFrm: TPBMaintJobBagLineDetailsFrm;

implementation

{$R *.dfm}

procedure TPBMaintJobBagLineDetailsFrm.FormActivate(Sender: TObject);
var
  sJobBag : string;
begin
  if not FActivated then
  begin
    sJobBag := IntToStr(JobBagLine.Parent.DbKey);
    if Mode = jbAdd then
      Caption := 'Add a works order charge: ' + sJobBag;
    if Mode = jbChange then
      Caption := 'Change a works order charge: ' + sJobBag;
    if Mode = jbDelete then
      Caption := 'Delete a works order charge: ' + sJobBag;

    memDescription.Text := JobBagLine.JBLineDescr;

    OKBitBtn.Visible := not(Mode = jbView);

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintJobBagLineDetailsFrm.SetJobBagLine(
  const Value: TJobBagLine);
begin
  FJobBagLine := Value;
end;

procedure TPBMaintJobBagLineDetailsFrm.SetMode(const Value: TJBMode);
begin
  FMode := Value;
end;

procedure TPBMaintJobBagLineDetailsFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  OKBitBtn.Enabled := (Trim(memDescription.Text) <> '');
end;

procedure TPBMaintJobBagLineDetailsFrm.OKBitBtnClick(Sender: TObject);
begin
  JobBagLine.JBLineDescr := Trim(memDescription.Text);

  JobBagLine.Parent.SaveToDB(false);
  ModalResult := mrOK;
end;

end.
