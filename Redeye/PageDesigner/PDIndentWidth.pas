(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Dialog to allow an element's indent and width to be changed.

VSS Info:
$Header: /PageDesigner/PDIndentWidth.pas 2     30/03/:0 10:34 Roddym $
$History: PDIndentWidth.pas $
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 30/03/:0   Time: 10:34
 * Updated in $/PageDesigner
 * Changes to the way column widths and indents are handled.  New dialog
 * to confirm column width changes.  Propagate letter font changes to the
 * elements.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:09
 * Created in $/PageDesigner
 * Infinitely configurable printing layouts (well, almost).

*******************************************************************************)
unit PDIndentWidth;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, PDLetter, LetterDM;

type
  TdlgIndentWidth = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    lblInstruct: TLabel;
    lblUnit: TLabel;
    lblIndent: TLabel;
    lblWidth: TLabel;
    cbUnits: TComboBox;
    edtIndent: TEdit;
    edtWidth: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure edtKeyPress(Sender: TObject; var Key: Char);
    procedure cbUnitsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FActive : Boolean;
    FElement: TElement;
    FUnitIndex : integer;
    procedure SetElement(const Value: TElement);
  public
    property Element : TElement read FElement write SetElement;
  end;

implementation

{$R *.DFM}

{ TdlgIndentWidth }

procedure TdlgIndentWidth.SetElement(const Value: TElement);
begin
  FElement := Value;
end;

procedure TdlgIndentWidth.FormActivate(Sender: TObject);
begin
  { The indent and width are held in the element in pixels.  Convert to
    inches and set edit boxes and combo accordingly. }
  if not FActive then
  begin
    cbUnits.ItemIndex := 0;   { inches }
    cbUnitsChange(nil);
    FActive := true;
  end;
end;

procedure TdlgIndentWidth.OKBtnClick(Sender: TObject);
var
  rIndent, rWidth : double;
  iIndent, iWidth : integer;
begin
  if Trim(edtIndent.Text) = '' then
    rIndent := 0
  else
    rIndent := StrToFloat(edtIndent.Text);
  if Trim(edtWidth.Text) = '' then
    rWidth := 0
  else
    rWidth := StrToFloat(edtWidth.Text);
  if cbUnits.ItemIndex = 0 then   { inches }
  begin
    iIndent := Trunc(rIndent * Screen.PixelsPerInch);
    iWidth := Trunc(rWidth * Screen.PixelsPerInch);
  end
  else
  if cbUnits.ItemIndex = 1 then   { centimetres }
  begin
    iIndent := Trunc(rIndent / InchesToCm * Screen.PixelsPerInch);
    iWidth := Trunc(rWidth / InchesToCm  * Screen.PixelsPerInch);
  end
  else  { pixels }
  begin
    iIndent := Trunc(rIndent);
    iWidth := Trunc(rWidth);
  end;
  element.Left := iIndent;
  element.Width := iWidth;
end;

procedure TdlgIndentWidth.edtKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
    P := Pos('.', Text);
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TdlgIndentWidth.cbUnitsChange(Sender: TObject);
var
  dIndent, dWidth : double;
begin
  try
    dIndent := StrToFloat(edtIndent.Text);
  except
    dIndent := 0;
  end;
  try
    dWidth := StrToFloat(edtWidth.Text);
  except
    dWidth := 0;
  end;
  if FUnitIndex = -1 then  { First change from creation }
  begin
  end
  else
  if (FUnitIndex = 0) and (cbUnits.ItemIndex = 1) then
  begin  { convert from inches to centimetres }
    dIndent := dIndent * InchesToCm;
    dWidth := dWidth * InchesToCm;
  end
  else
  if (FUnitIndex = 1) and (cbUnits.ItemIndex = 0) then
  begin  { convert from centimetres to inches}
    dIndent := dIndent / InchesToCm;
    dWidth := dWidth / InchesToCm;
  end
  else
  if (FUnitIndex = 0) and (cbUnits.ItemIndex = 2) then
  begin  { convert from inches to pixels }
    dIndent := dIndent * Screen.PixelsPerInch;
    dWidth := dWidth * Screen.PixelsPerInch;
  end
  else
  if (FUnitIndex = 2) and (cbUnits.ItemIndex = 0) then
  begin  { convert from pixels to inches }
    dIndent := dIndent / Screen.PixelsPerInch;
    dWidth := dWidth / Screen.PixelsPerInch;
  end
  else
  if (FUnitIndex = 1) and (cbUnits.ItemIndex = 2) then
  begin  { convert from centimetres to pixels}
    dIndent := dIndent / InchesToCm * Screen.PixelsPerInch;
    dWidth := dWidth / InchesToCm * Screen.PixelsPerInch;
  end
  else
  if (FUnitIndex = 2) and (cbUnits.ItemIndex = 1) then
  begin  { convert from pixels to centimetres }
    dIndent := dIndent * InchesToCm / Screen.PixelsPerInch;
    dWidth := dWidth * InchesToCm / Screen.PixelsPerInch;
  end;

  edtIndent.Text := FloatToStrF(dIndent, ffFixed, 6,2);
  edtWidth.Text := FloatToStrF(dWidth, ffFixed, 6,2);

  FUnitIndex := cbUnits.ItemIndex;
end;

procedure TdlgIndentWidth.FormCreate(Sender: TObject);
begin
  FUnitIndex := -1;
end;

end.
