unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, shellapi;

type
  TAboutBox = class(TForm)
    OKBtn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

procedure TAboutBox.Label1Click(Sender: TObject);
begin
  ShellExecute (0,'open','http://www.zornsoftware.com', nil, nil, SW_SHOWNORMAL);
end;

end.
