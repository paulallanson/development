unit PBAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TPBAboutFrm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    VersionLabel: TLabel;
    BitBtn1: TBitBtn;
    DataBaseLabel: TLabel;
    UserLabel: TLabel;
    procedure FormActivate(Sender: TObject);
  end;

var
  PBAboutFrm: TPBAboutFrm;

implementation

uses PBMainMenu;

{$R *.DFM}

procedure TPBAboutFrm.FormActivate(Sender: TObject);
var
  s : string;
  x : integer;
begin
  VersionLabel.Caption := 'Version ' + frmPBMainMenu.sSoft_Version + frmPBMainMenu.sSoft_subVersion;
  s := 'Logged in as: ' + frmPBMainMenu.sOperator_Name;
  x := Userlabel.Canvas.TextWidth(s);
  UserLabel.Left := Self.ClientWidth - x - 6;
  UserLabel.Caption := s;
end;

end.
