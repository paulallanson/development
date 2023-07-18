unit QBarcode;

{************************************************************************

Visual QuickReport Barcode Component for Delphi
© 1996-2000 Zorn Software, Amsterdam, The Netherlands
No part of this code may be copied or used in other programs.

*************************************************************************}

interface

uses
  windows, classes, controls, QuickRPT, graphics, ZBarcode;

type
  TBarCode = class(TQRPrintable)
  private
    FZBarcode: TZBarcode;
    FAutoWidth: Boolean;
    FCharWidth: integer;
    DummyString: string;
    procedure SetCharWidth (Value: integer);
    procedure SetRatio (Value: TRatio);
    procedure SetfgColor (Value: TColor);
    procedure SetBarType (Value: TBarType);
    procedure SetPrefix (Value: string);
    procedure SetAddOn (Value: string);
    procedure SetText (Value: string);
    procedure SetColor (Value: TColor);
    procedure SetTransparent (Value: boolean);
    procedure SetAutoWidth (Value: boolean);
    procedure SetFont (Value: TFont);
    function GetFont: TFont;
    function GetVersion: string;
    function GetBarType: TBarType;
    function GetPrefix: string;
    function GetText: string;
    function GetColor: TColor;
    function GetfgColor: TColor;
    function GetAddOn: string;
    function GetTransparent: boolean;
    function GetRatio: TRatio;
  protected
    procedure Paint; override;
    procedure Print (X, Y: integer); override;
    property Cursor;
  public
    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AutoWidth: Boolean read FAutoWidth write SetAutoWidth default False;
    property BarType: TBarType read GetBarType write SetBarType;
    property Text: string read GetText write SetText;
    property Prefix: string read GetPrefix write SetPrefix;
    property AddOn: string read GetAddOn write SetAddOn;
    property Font: TFont read GetFont write SetFont;
    property Color: TColor read GetColor write SetColor default clWhite;
    property fgColor: TColor read GetfgColor write SetfgColor default clBlack;
    property Transparent: boolean read GetTransparent write SetTransparent default False;
    property Ratio: TRatio read GetRatio write SetRatio default r10to25;
    property CharWidth: integer read FCharWidth write SetCharWidth default 7;
    property Version: string read GetVersion write DummyString;
  end;

procedure Register;

implementation

{$R *.DCR}

constructor TBarCode.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  FZBarcode := TZBarcode.Create (self);
  FZBarcode.Barcode.Enhanced := true;
  ControlStyle := ControlStyle - [csSetCaption];
  Height := 60;
  Width := 80;
  CharWidth := 7;
end;

destructor TBarCode.Destroy;
begin
  FZBarcode.Free;
  inherited Destroy;
end;

function TBarCode.GetVersion: string;
begin
  Result := FZBarcode.Version;
end;

procedure Register;
begin
  RegisterComponents('Zorn Software', [TBarCode]);
end;

function TBarcode.GetFont: TFont;
begin
  result := FZBarcode.Font;
end;

procedure TBarCode.SetFont (Value: TFont);
begin
  FZBarcode.Font := Value;
  invalidate;
end;

procedure TBarCode.SetBarType (Value: TBarType);
begin
  if Value <> FZBarcode.BarType then
  begin
    FZBarcode.BarType := Value;
    invalidate;
  end;
end;

function TBarCode.GetPrefix: string;
begin
  result := FZBarcode.Prefix;
end;

function TBarCode.GetText: string;
begin
  result := FZBarcode.Text;
end;

function TBarCode.GetAddOn: string;
begin
  result := FZBarcode.AddOn;
end;

function TBarCode.GetTransparent: boolean;
begin
  result := FZBarcode.Transparent;
end;

function TBarCode.GetRatio: TRatio;
begin
  result := FZBarcode.Ratio;
end;

function TBarCode.GetColor: TColor;
begin
  result := FZBarcode.bgColor;
end;

function TBarCode.GetfgColor: TColor;
begin
  result := FZBarcode.fgColor;
end;

function TBarCode.GetBarType: TBarType;
begin
  result := FZBarcode.BarType;
end;

procedure TBarCode.SetCharWidth (Value: integer);
begin
  if Value <> FCharWidth then
  begin
    FCharWidth := Value;
    invalidate;
  end;
end;

procedure TBarCode.SetRatio (Value: TRatio);
begin
  if Value <> FZBarcode.Ratio then
  begin
    FZBarcode.Ratio := Value;
    invalidate;
  end;
end;

procedure TBarCode.SetColor (Value: TColor);
begin
  if Value <> FZBarcode.bgColor then
  begin
    FZBarcode.bgColor := Value;
    invalidate;
  end;
end;

procedure TBarCode.SetTransparent (Value: boolean);
begin
  if Value <> FZBarcode.Transparent then
  begin
    FZBarcode.Transparent := Value;
    invalidate;
  end;
end;

procedure TBarCode.SetAutoWidth (Value: boolean);
begin
  if Value <> FAutoWidth then
  begin
    FAutoWidth := Value;
    invalidate;
  end;
end;

procedure TBarCode.SetfgColor (Value: TColor);
begin
  if Value <> FZBarcode.fgColor then
  begin
    FZBarcode.fgColor := Value;
    invalidate;
  end;
end;

procedure TBarCode.SetPrefix (Value: string);
begin
  if Value <> FZBarcode.Prefix then
  begin
    FZBarcode.Prefix := Value;
    invalidate;
  end;
end;

procedure TBarCode.SetAddOn (Value: string);
begin
  if Value <> FZBarcode.AddOn then
  begin
    FZBarcode.AddOn := Value;
    invalidate;
  end;
end;

procedure TBarCode.SetText (Value: string);
begin
  if Value <> FZBarcode.Text then
  begin
    FZBarcode.Text := Value;
    invalidate;
  end;
end;

procedure TBarCode.Paint;
var
  TempInt: integer;
  nChars: integer;
begin
  nChars := 0;
  TempInt := FZBarcode.Width;
  TempInt := TempInt * Height;
  FZBarcode.Height := TempInt div Width;

  if FAutoWidth then  { variable width barcode }
  begin
     { determine # of chars }
    case BarType of
      btCode39:       nChars := 2 + Length (Prefix + Text);
      btCode39wCheck: nChars := 3 + Length (Prefix + Text);
      btITF:          nChars := 1 + (Length (Prefix + Text) + 1)div 2;
      btITFwCheck:    nChars := 1 + (Length (Prefix + Text) + 2) div 2;
      btCode128:      nChars := FZBarcode.Width div (11 * FZBarcode.Atom);
      btEAN8:         nChars := 10;
      btPostnet:      nChars := Length (Text);
      btEAN13, btUPCA:
        begin
          if Length (AddOn) = 0 then
            nChars := 14
          else
            if Length (AddOn) < 3 then nChars := 17
              else nChars := 20 ;
        end;
    end;
    Width := nChars * CharWidth;
  end;

  Canvas.StretchDraw (ClientRect, FZBarcode.Barcode);
  inherited Paint;
end;

procedure TBarCode.Print (X, Y: integer);
var
  Breedte: integer;
  TempInt: Longint;
  nChars: integer;
  Dest: TRect;
begin
  nChars := 0;
  Breedte := FZBarcode.Width;
  TempInt := Breedte;

  if AutoWidth then  { variable width barcode }
  begin
    case BarType of
    btCode39:       nChars := 2 + Length (Prefix + Text);
    btCode39wCheck: nChars := 3 + Length (Prefix + Text);
    btITF:          nChars := 1 + (Length (Prefix + Text) + 1) div 2;
    btITFwCheck:    nChars := 1 + (Length (Prefix + Text) + 2) div 2;
    btCode128:      nChars := Breedte div (11 * FZBarcode.Atom);
    btEAN8:         nChars := 10;
    btPostnet:      nChars := Length (Text);
    btEAN13, btUPCA:
      begin
        if Length (AddOn) = 0 then
          nChars := 14
        else
          if Length (AddOn) < 3 then nChars := 17
            else nChars := 20 ;
      end;
    end;
    Width := nChars * CharWidth;
  end;

  TempInt := TempInt * Height;
  FZBarcode.Height := TempInt div Width;

  Dest.Top := QRPrinter.YPos(Y + Size.Top);
  Dest.Left := QRPrinter.XPos(X + Size.Left);
  Dest.Right := QRPrinter.XPos(X + Size.Width + Size.Left);
  Dest.Bottom := QRPrinter.YPos(Y + Size.Height + Size.Top);

  QRPrinter.Canvas.StretchDraw (Dest, FZBarcode.Barcode);
  inherited Print (X, Y);
end;

end.
