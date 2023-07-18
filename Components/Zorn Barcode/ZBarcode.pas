unit ZBarcode;

{************************************************************************

Generic (non-visual) Barcode Component for Delphi
© 1996-2000 Zorn Software, Amsterdam, The Netherlands
No part of this code may be copied or used in other programs.

*************************************************************************}

// The following define only makes sense if you have purchased the
// registered version which includes the barcoreg.obj file

{$define BARCOMPREG}

interface

uses
  windows, classes, sysutils, graphics, dialogs;

const
{$ifdef BARCOMPREG}
  CVersion = '3.0 Registered';
{$else}
  CVersion = '3.0 Demo';
{$endif}

type
  TBarType = (btCode39, btCode39wCheck, btEAN13, btEAN8, btCode128,
              btITF, btITFwCheck, btPostnet, btUPCA);
  TRatio   = (r10to20, r10to25, r10to30);

  TZBarCode = class(TComponent)
  private
    FBarType: TBarType;
    FPrefix, FText, FAddOn: string;
    FfgColor, FbgColor: TColor;
    FTransparent: boolean;
    FHeight, FWidth: integer;
    FRatio: TRatio;
    FVersion: string;
    FFont: TFont;
    Picture: TMetafile;
    FAtom: integer;
    StringDummy: string;
    IntDummy: integer;
    procedure SetHeight (Value: integer);
    procedure SetRatio (Value: TRatio);
    procedure SetfgColor (Value: TColor);
    procedure SetbgColor (Value: TColor);
    procedure SetBarType (Value: TBarType);
    procedure SetPrefix (Value: string);
    procedure SetAddOn (Value: string);
    procedure SetText (Value: string);
    procedure SetTransparent (Value: boolean);
    procedure Redraw;
    procedure SetAtom (Value: integer);
    procedure SetEnhanced (Value: boolean);
    procedure SetFont (Value: TFont);
    function GetEnhanced: boolean;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    property Barcode: TMetafile read Picture;
  published
    property BarType: TBarType read FBarType write SetBarType;
    property Text: string read FText write SetText;
    property Prefix: string read FPrefix write SetPrefix;
    property AddOn: string read FAddOn write SetAddOn;
    property Font: TFont read FFont write SetFont;
    property bgColor: TColor read FbgColor write SetbgColor default clWhite;
    property fgColor: TColor read FfgColor write SetfgColor default clBlack;
    property Transparent: boolean read FTransparent write SetTransparent default False;
    property Ratio: TRatio read FRatio write SetRatio default r10to25;
    property Version: string read FVersion write StringDummy;
    property Height: integer read FHeight write SetHeight;
    property Width: integer read FWidth write IntDummy;
    property Atom: integer read FAtom write SetAtom;
    property Enhanced: boolean read GetEnhanced write SetEnhanced;
  end;

procedure Register;

implementation

{$R *.DCR}

function Paint_Barcode (hdc: HDC; Prefix, Text, AddOn: Pchar; BarType,
         bPaint, height, smal, leth, iRatio: integer; brush: THandle): integer;
         stdcall; external;

{$ifdef BARCOMPREG}
{$L 'barcoreg.obj'}
{$else}
{$L 'barcomp.obj'}
{$endif}

procedure TZBarcode.Redraw;
begin
  FWidth := Paint_Barcode (0, PChar (FPrefix), Pchar (FText), Pchar (FAddOn), ord (FBarType), 0, 0, Atom, 0, ord (FRatio), 0);
  if FWidth < 0 then FWidth := -FWidth;
  Picture.Width := FWidth;
  Picture.Height := FHeight;

  with TMetafileCanvas.Create (Picture, 0) do
  try
    if not FTransparent then
    begin
      Brush.Color := FbgColor;
      FillRect (Rect(0, 0, FWidth, FHeight));
    end;
    Brush.Color := fgColor;
    Font.Assign (FFont);
    Font.Size := abs (Font.Size * Atom);
    Paint_Barcode (Handle, Pchar (Prefix), Pchar (Text), Pchar (Addon), ord (FBarType), 1, FHeight,
          Atom, (abs (Font.Size) + abs (Font.Height)) div 2, ord (FRatio), Brush.Handle);
  finally
    free;
  end;
end;

constructor TZBarcode.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  Picture := TMetafile.Create;
  FFont := TFont.Create;
  FFont.Name := 'Arial';
  FFont.Size := 8;
  FHeight := 60;
  FbgColor := clWhite;
  FfgColor := clBlack;
  FRatio := r10to25;
  FVersion := CVersion;
  FAtom := 4;
  Redraw;
end;

destructor TZBarcode.Destroy;
begin
  Picture.Free;
  Font.Free;
  inherited Destroy;
end;

procedure Register;
begin
  RegisterComponents('Zorn Software', [TZBarcode]);
end;

procedure TZBarcode.SetEnhanced (Value: boolean);
begin
  if Value <> Picture.Enhanced then
  begin
    Picture.Enhanced := Value;
    Redraw;
  end;
end;

function TZBarcode.GetEnhanced: boolean;
begin
  Result := Picture.Enhanced;
end;

procedure TZBarcode.SetBarType (Value: TBarType);
begin
  if Value <> FBarType then
  begin
    FBarType := Value;
    Redraw;
  end;
end;

procedure TZBarcode.SetFont (Value: TFont);
begin
  FFont.Assign (Value);
  Redraw;
end;

procedure TZBarcode.SetHeight (Value: integer);
begin
  if Value <> FHeight then
  begin
    FHeight := Value;
    Redraw;
  end;
end;

procedure TZBarcode.SetRatio (Value: TRatio);
begin
  if Value <> FRatio then
  begin
    FRatio := Value;
    Redraw;
  end;
end;

procedure TZBarcode.SetAtom (Value: integer);
begin
  if Value <> FAtom then
  begin
    FAtom := Value;
    Redraw;
  end;
end;

procedure TZBarcode.SetTransparent (Value: boolean);
begin
  if Value <> FTransparent then
  begin
    FTransparent := Value;
    Redraw;
  end;
end;

procedure TZBarcode.SetfgColor (Value: TColor);
begin
  if Value <> FfgColor then
  begin
    FfgColor := Value;
    Redraw;
  end;
end;

procedure TZBarcode.SetbgColor (Value: TColor);
begin
  if Value <> FbgColor then
  begin
    FbgColor := Value;
    Redraw;
  end;
end;

procedure TZBarcode.SetPrefix (Value: string);
begin
  if Value <> FPrefix then
  begin
    FPrefix := Value;
    Redraw;
  end;
end;

procedure TZBarcode.SetAddOn (Value: string);
begin
  if Value <> FAddOn then
  begin
    FAddOn := Value;
    Redraw;
  end;
end;

procedure TZBarcode.SetText (Value: string);
begin
  if Value <> FText then
  begin
    FText := Value;
    Redraw;
  end;
end;

{$ifndef BARCOMPREG}
initialization
  if Paint_Barcode (0, '', '1', '', 1, 0, 0, 2, 0, 0, 0) < 0 then
    ShowMessage
      ('This demo version can only be used while Delphi is running');
{$endif}
end.
