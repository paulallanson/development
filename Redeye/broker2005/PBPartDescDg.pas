(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Set Part Description.

VSS Info:
$Header: /PBL D5/PBPartDescDg.pas 1     15/03/:0 11:13 Roddym $
$History: PBPartDescDg.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 15/03/:0   Time: 11:13
 * Created in $/PBL D5
 * Allow users to give parts descriptions rather than just "Part N"

*******************************************************************************)
unit PBPartDescDg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TPBPartDescDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    lblDescription: TLabel;
    edtDescription: TEdit;
    procedure OKBtnClick(Sender: TObject);
  private
    FDescription: string;
    procedure SetDescription(const Value: string);
  public
    property Description : string read FDescription write SetDescription;
  end;

implementation

{$R *.DFM}

{ TOKBottomDlg }

procedure TPBPartDescDlg.SetDescription(const Value: string);
begin
  FDescription := Value;
  edtDescription.Text := Value;
end;

procedure TPBPartDescDlg.OKBtnClick(Sender: TObject);
begin
  if Trim(edtDescription.Text) <> FDescription then
    FDescription := Trim(edtDescription.Text);
end;

end.
