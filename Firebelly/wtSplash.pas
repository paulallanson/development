unit wtSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, jpeg;

type
  TfrmWTSplash = class(TForm)
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTSplash: TfrmWTSplash;

implementation

{$R *.DFM}

procedure TfrmWTSplash.FormActivate(Sender: TObject);
begin
(*  if (FindWindow('TfrmWTSendFax', 'Fax Send Form') <> 0) then
  begin
    MessageDlg('The Firebelly program is already running', mtError,
      [mbAbort], 0);
    Application.Terminate;
    exit;
  end;
*)
end;

end.




