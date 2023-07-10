(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  About Print Broker Page/Letter Designer

VSS Info:
$Header: /PageDesigner/PDAbout.pas 1     6/01/:0 16:13 Roddym $
$History: PDAbout.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 6/01/:0    Time: 16:13
 * Created in $/PageDesigner
 * First check in. New page and letter layout designer tool for use with
 * Broker in customising enquiries, quotations, purchase orders and
 * acknowledgements.

*******************************************************************************)
unit PDAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TPDAboutFrm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    VersionLabel: TLabel;
    BitBtn1: TBitBtn;
    UserLabel: TLabel;
    procedure FormActivate(Sender: TObject);
  end;

var
  PDAboutFrm: TPDAboutFrm;

implementation

uses PDMainMenu;

{$R *.DFM}

procedure TPDAboutFrm.FormActivate(Sender: TObject);
var
  s : string;
  x : integer;
begin
  VersionLabel.Caption := 'Version ' + PDMainMenuFrm.Version;
  s := 'Logged in as: ' + PDMainMenuFrm.UserName;
  x := Userlabel.Canvas.TextWidth(s);
  UserLabel.Left := Self.ClientWidth - x - 16;
  UserLabel.Caption := s;
end;

end.
