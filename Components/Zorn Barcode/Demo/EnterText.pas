unit EnterText;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TTextDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute (var s: string): boolean;
  end;

var
  TextDlg: TTextDlg;

implementation

{$R *.DFM}

function TTextDlg.Execute (var s: string): boolean;
begin
  Edit1.Text := s;
  if ShowModal = mrOK then
  begin
    s := Edit1.Text;
    Result := true;
  end else
    Result := false;
end;

procedure TTextDlg.FormShow(Sender: TObject);
begin
  ActiveControl := Edit1;
end;

end.
