unit wtLicence;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, QrCtrls;

type
  TfrmWTLicence = class(TForm)
    Label1: TLabel;
    CodeEdit: TEdit;
    ReplyEdit: TEdit;
    Label2: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    sReply: string;
  public
    { Public declarations }
    bOK: ByteBool;
  end;

var
  frmWTLicence: TfrmWTLicence;

implementation

uses
  System.UITypes,
  wtMain;

{$R *.DFM}

procedure TfrmWTLicence.FormActivate(Sender: TObject);
var
  sTempTime, sTempCode, sDecode: string;
  icount, iTempNo1, iTempNo2: Integer;
begin
  bOK := False;
  {Generate a code};
  sTempTime := FloatToStr(Time);
  sTempCode := '';
  for icount := Length(sTempTime) - 1 downto Length(sTempTime) - 11 do
    sTempCode := sTempCode + Copy(sTempTime, icount, 1);
  CodeEdit.Text := sTempCode;
  {Work out the reply code};
  sDecode := 'MNBVCXZASDFGHJKLPOIUYTREWQ';
  sReply := '';
  for icount := 1 to 5 do
  begin
    iTempNo1 := StrToInt(Copy(CodeEdit.Text, icount, 1)) * 2 +
      StrToInt(Copy(CodeEdit.Text, icount + 5, 1)) * 3;
    while (iTempNo1 > 26) do
      iTempNo1 := iTempNo1 - 26;
    iTempNo2 := StrToInt(Copy(CodeEdit.Text, icount, 1)) * 4 +
      StrToInt(Copy(CodeEdit.Text, icount + 5, 1)) * 3;
    while (iTempNo2 > 26) do
      iTempNo2 := iTempNo2 - 26;
    sReply := sReply + Copy(sDecode, iTempNo1, 1) + Copy(sDecode, iTempNo2, 1);
  end;
end;

procedure TfrmWTLicence.OKBitBtnClick(Sender: TObject);
begin
  if ReplyEdit.Text <> sReply then
  begin
    MessageDlg('Invalid Reply Code - Licence NOT Updated', mtError, [mbOK], 0);
  end
  else
  begin
    if frmWTMain.bEndUser then
      MessageDlg('Licence will expire 3 months from now', mtInformation, [mbOK], 0)
    else
      MessageDlg('Licence will expire 30 days from now', mtInformation, [mbOK], 0);
    bOK := True;
  end
end;

end.
