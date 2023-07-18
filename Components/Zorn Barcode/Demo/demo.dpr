program demo;

uses
  Forms,
  Tstmain in 'Tstmain.pas' {Form1},
  EnterText in 'EnterText.pas' {TextDlg},
  About in 'About.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TTextDlg, TextDlg);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
