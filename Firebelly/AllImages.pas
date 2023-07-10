unit AllImages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, gtQrCtrls, jpeg, ExtCtrls;

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
  TempArray: array[0..255] of Char;
  sgList: TStringList;
  sDatabase, LocalDrive, LocalDir: string;
  AppIniFile: Array [0..255] of char;
begin
  try
    ReportImage.Picture.LoadFromFile(LocalDir+sDatabase+'\wtHeadLogo.bmp');
    DefaultLogo := LocalDir+sDatabase+'\wtHeadLogo.bmp';
  except
    ReportImage.Picture.LoadFromFile('wtHeadLogo.bmp');
    DefaultLogo := 'wtHeadLogo.bmp';
  end;
end;

procedure TfrmAllImages.SetDefaultLogo(const Value: string);
begin
  FDefaultLogo := Value;
end;

end.
