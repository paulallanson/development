(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Broker Letter Layout font specification frame.

VSS Info:
$Header: /PageDesigner/PDFontFrame.pas 1     6/01/:0 16:13 Roddym $
$History: PDFontFrame.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 6/01/:0    Time: 16:13
 * Created in $/PageDesigner
 * First check in. New page and letter layout designer tool for use with
 * Broker in customising enquiries, quotations, purchase orders and
 * acknowledgements.

*******************************************************************************)
unit PDFontFrame;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Spin;

type
  TfmFontInfo = class(TFrame)
    lblFont: TLabel;
    cbFontName: TComboBox;
    edtFontSize: TSpinEdit;
    btnBold: TSpeedButton;
    btnItalic: TSpeedButton;
    btnUnderline: TSpeedButton;
    procedure btnClick(Sender: TObject);
  private
    function GetFontStyle : TFontStyles;
    procedure SetFontStyle(const Value : TFontStyles);
    { Private declarations }
  public
    property FontStyle : TFontStyles read GetFontStyle write SetFontStyle;
  end;

implementation

{$R *.DFM}

{ TFrame1 }

procedure TfmFontInfo.btnClick(Sender: TObject);
begin
  with Sender as TSpeedButton do
    Down := not Down;
end;

function TfmFontInfo.GetFontStyle: TFontStyles;
begin
  Result := [];
  if btnBold.Down then
    Result := Result + [fsBold];
  if btnItalic.Down then
    Result := Result + [fsItalic];
  if btnUnderline.Down then
    Result := Result + [fsUnderline];
end;

procedure TfmFontInfo.SetFontStyle(const Value: TFontStyles);
begin
  btnBold.Down := fsBold in Value;
  btnItalic.Down := fsItalic in Value;
  btnUnderline.Down := fsUnderline in Value;
end;

end.
