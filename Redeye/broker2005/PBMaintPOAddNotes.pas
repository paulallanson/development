unit PBMaintPOAddNotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TPBMaintPOAddNotesFrm = class(TForm)
    AddNotesMemo: TMemo;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    FText: string;
    FFuncMode: Char;
  public
    property FuncMode: Char read FFuncMode write FFuncMode;
    property Text: string read FText write FText;
  end;

var
  PBMaintPOAddNotesFrm: TPBMaintPOAddNotesFrm;

implementation

uses UITypes, 
  PBPODatamod, PBPOObjects;

{$R *.DFM}

procedure TPBMaintPOAddNotesFrm.FormShow(Sender: TObject);
begin
  case FuncMode of
    poAdd: Caption := 'Add Additional Notes to Purchase Order';
    poChange: Caption := 'Change Additional Notes on Purchase Order';
    poDelete:
      begin
        Caption := 'Delete Additional Notes from Purchase Order';
        OKBitBtn.Caption := 'Delete';
        DelLabel.Show;
      end;
  end; { case }
  AddNotesMemo.Text := FText;
end;

procedure TPBMaintPOAddNotesFrm.OKBitBtnClick(Sender: TObject);
begin
  if FuncMode = poDelete then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation,
      [mbNo, mbYes], 0) <> mrYes then
      ModalResult := mrCancel;
  end
  else
    FText := Trim(AddNotesMemo.Text);
end;

end.
