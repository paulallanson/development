unit AllImages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TfrmAllImages = class(TForm)
    OffBitBtn: TBitBtn;
    OnBitBtn: TBitBtn;
    ReportImage: TImage;
  private
    FDefaultLogo: string;
    procedure SetDefaultLogo(const Value: string);
    { Private declarations }
  public
    procedure LoadReportLogo(Sender: TObject);
    property DefaultLogo: string read FDefaultLogo write SetDefaultLogo;
  end;

var
  frmAllImages: TfrmAllImages;

implementation

{$R *.dfm}

procedure TfrmAllImages.LoadReportLogo(Sender: TObject);
var
  FileName, LocalDir: string;
begin
  LocalDir := ExtractFileDir(Application.ExeName);
  try
    FileName := LocalDir + '\wtHeadLogo.bmp';
    if FileExists(FileName) then
    begin
      ReportImage.Picture.LoadFromFile(FileName);
      DefaultLogo := FileName;
    end else
    begin
      FileName := '\wtHeadLogo.bmp';
      ReportImage.Picture.LoadFromFile(FileName);
      DefaultLogo := FileName;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Head logo image file not found. ' + E.Message);
    end;
  end;
end;

procedure TfrmAllImages.SetDefaultLogo(const Value: string);
begin
  FDefaultLogo := Value;
end;

end.
