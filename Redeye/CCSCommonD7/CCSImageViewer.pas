unit CCSImageViewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TCCSImageViewerFrm = class(TForm)
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CCSImageViewerFrm: TCCSImageViewerFrm;

implementation

{$R *.DFM}

procedure TCCSImageViewerFrm.FormShow(Sender: TObject);
var
  scale: double;
  tempHeight, tempWidth: integer;
  scaleLbl: double;
begin
  scaleLbl := 1;
  tempHeight := self.Image1.picture.Height + 27;
  tempWidth := self.Image1.picture.Width + 8;

  if (tempHeight  > screen.height)
  or (tempWidth > screen.width) then
  begin
    self.Image1.Stretch := true;
    if (tempHeight  > screen.height)then
    begin
      scale := (screen.height*0.95) / tempHeight;
      tempHeight := trunc(scale * tempHeight);
      tempWidth := trunc(scale * tempWidth);
      scaleLbl := scale;
    end;

    if (tempWidth > screen.width) then
    begin
      scale := (screen.width*0.95) / tempWidth;
      tempHeight := trunc(scale * tempHeight);
      tempWidth := trunc(scale * tempWidth);
      scaleLbl := scaleLbl * scale;
    end;
    self.Caption := self.Caption + ' (Scaled by '+FloatToStrF(scaleLbl*100,ffFixed, 15, 2)+'%)';
  end;

  self.Top := 1;
  self.Left := 1;
  self.Height := tempHeight;
  self.Width := tempWidth;
end;

end.
