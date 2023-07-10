(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Dialog to confirm the width of an element that has just been moved.

VSS Info:
$Header: /PageDesigner/PDConfirmWidth.pas 1     30/03/:0 10:33 Roddym $
$History: PDConfirmWidth.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 30/03/:0   Time: 10:33
 * Created in $/PageDesigner
 * First check in.

*******************************************************************************)
unit PDConfirmWidth;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, PDLetter, LetterDM;

type
  TdlgConfirmWidth = class(TForm)
    btnKeepCurrent: TButton;
    btnUseColumn: TButton;
    Bevel1: TBevel;
    lblInstruct: TLabel;
    lblUnit: TLabel;
    lblCurrent: TLabel;
    lblColumnWidth: TLabel;
    cbUnits: TComboBox;
    edtCurrent: TEdit;
    edtColumn: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure btnKeepCurrentClick(Sender: TObject);
    procedure edtKeyPress(Sender: TObject; var Key: Char);
    procedure btnUseColumnClick(Sender: TObject);
    procedure cbUnitsChange(Sender: TObject);
  private
    FActive : Boolean;
    FElement: TElement;
    procedure SetElement(const Value: TElement);
    { Private declarations }
  public
    property Element : TElement read FElement write SetElement;
  end;

implementation

{$R *.DFM}

{ TdlgIndentWidth }

procedure TdlgConfirmWidth.SetElement(const Value: TElement);
begin
  FElement := Value;
end;

procedure TdlgConfirmWidth.FormActivate(Sender: TObject);
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

procedure TdlgConfirmWidth.btnKeepCurrentClick(Sender: TObject);
begin
  { Keep current means no change, just set modal result }
  ModalResult := mrOK;
end;

procedure TdlgConfirmWidth.edtKeyPress(Sender: TObject;
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

procedure TdlgConfirmWidth.btnUseColumnClick(Sender: TObject);
begin
  { Set the element width to be that of its column }
  case element.Column of
  0, 3 : element.Width := 0;
  1    : element.Width := element.Parent.TabStop1Pixels;
  2    : element.Width := element.Parent.TabStop2Pixels;
  end;  { case }
  Modalresult := mrOK;
end;

procedure TdlgConfirmWidth.cbUnitsChange(Sender: TObject);
var
  ColWidth : double;
begin
  { The indent and width are held in the element in pixels.  Convert to
    and set edit boxes and combo accordingly. }
  if cbUnits.ItemIndex = 0 then  { inches }
  begin
    edtCurrent.Text :=
      FloatToStrF(element.Width / Screen.PixelsPerInch , ffFixed, 6,2);
    case element.Column of
    1    : ColWidth := element.Parent.TabStop1Pixels;
    2    : ColWidth := element.Parent.TabStop2Pixels;
    else   ColWidth := 0;
    end;  { case }
    edtColumn.Text :=
      FloatToStrF(ColWidth / Screen.PixelsPerInch , ffFixed, 6,2);
  end
  else
  if cbUnits.ItemIndex = 1 then  { millimetres }
  begin
    edtCurrent.Text :=
      FloatToStrF(element.Width * InchesToCm / Screen.PixelsPerInch , ffFixed, 6,2);
    case element.Column of
    1    : ColWidth := element.Parent.TabStop1Pixels;
    2    : ColWidth := element.Parent.TabStop2Pixels;
    else   ColWidth := 0;
    end;  { case }
    edtColumn.Text :=
      FloatToStrF(ColWidth * InchesToCm / Screen.PixelsPerInch , ffFixed, 6,2);
  end
  else
  if cbUnits.ItemIndex = 2 then  { pixels }
  begin
    edtCurrent.Text :=
      FloatToStrF(element.Width , ffFixed, 6,2);
    case element.Column of
    1    : ColWidth := element.Parent.TabStop1Pixels;
    2    : ColWidth := element.Parent.TabStop2Pixels;
    else   ColWidth := 0;
    end;  { case }
    edtColumn.Text :=
      FloatToStrF(ColWidth, ffFixed, 6,2);
  end;
end;

end.


