unit wtAboutBox;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, gtQrCtrls;

type
  TfrmwtAboutBox = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    lblVersion: TLabel;
    Copyright: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwtAboutBox: TfrmwtAboutBox;

implementation

uses wtMain;

{$R *.DFM}

procedure TfrmwtAboutBox.FormActivate(Sender: TObject);
begin
  lblVersion.Caption := 'Version Number: ' + frmWTMain.SWVersion + frmWTMain.SWSubVersion;

end;

end.

