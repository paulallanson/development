(*******************************************************************************

Copyright (c) Centrereed Ltd 2000

Comments
--------
  Commonly used data entry controls.

VSS Info:
$Header: /CRPackage/CRControls.pas 1     22/03/:0 9:23 Roddym $
$History: CRControls.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 22/03/:0   Time: 9:23
 * Created in $/CRPackage
 * Example Delphi components for Centrereed

*******************************************************************************)
unit CRControls;

interface

uses
  Classes, StdCtrls;

type

  TCREdit         = class(TEdit)
    constructor Create(AOwner: TComponent); override;
    procedure KeyPressed(Sender: TObject; var Key : char); virtual; abstract;
  end;

  TCREditInt      = class(TCREdit)
    procedure KeyPressed(Sender: TObject; var Key : char); override;
  private
    function GetValue: integer;
    procedure SetValue(const Value: integer);
  public
    property Value : integer read GetValue write SetValue;
  end;

  TCREditFloat    = class(TCREdit)
    procedure KeyPressed(Sender: TObject; var Key : char); override;
  private
    function GetValue: double;
    procedure SetValue(const Value: double);
  public
    property Value : double read GetValue write SetValue;
  end;

  TCREditMoney    = class(TCREdit)
    procedure KeyPressed(Sender: TObject; var Key : char); override;
  private
    function GetValue: currency;
    procedure SetValue(const Value: currency);
  public
    property Value : currency read GetValue write SetValue;
  end;

procedure Register;

implementation

uses
  Windows, SysUtils;

{ TCREdit }

constructor TCREdit.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  OnKeyPress := KeyPressed;
end;

{ TCREditInt }

function TCREditInt.GetValue: integer;
begin
  if Text = '' then
    Result := 0
  else
  try
    Result := StrToInt(Text);
  except
    Result := 0;
  end;
end;

procedure TCREditInt.KeyPressed(Sender: TObject; var Key : char);
begin
  if not (Key < #32) then  { not a control character }
    if not (Key in ['0'..'9']) then
    begin
      MessageBeep(0);
      Key := #0;
    end;
end;

procedure TCREditInt.SetValue(const Value: integer);
begin
  Text := IntToStr(Value);
end;

{ TCREditFloat }

function TCREditFloat.GetValue: double;
begin
  if Text = '' then
    Result := 0
  else
  try
    Result := StrToFloat(Text);
  except
    Result := 0;
  end;
end;

procedure TCREditFloat.KeyPressed(Sender: TObject; var Key : char);
var
  decPlace : integer;
begin
  if Sender is TEdit then
  begin
    decPlace := Pos('.', TEdit(Sender).Text);
    if not (Key < #32) then  { not a control character }
      if (not (Key in ['0'..'9', '.'])) or ((decPlace > 0) and (Key = '.')) then
      begin
        MessageBeep(0);
        Key := #0;
      end;
  end;
end;

procedure TCREditFloat.SetValue(const Value: double);
begin
  Text := FloatToStrF(Value, ffFixed, 15, 2);
end;

{ TCREditMoney }

function TCREditMoney.GetValue: currency;
begin
  if Text = '' then
    Result := 0
  else
  try
    Result := StrToFloat(Text);
  except
    Result := 0;
  end;
end;

procedure TCREditMoney.KeyPressed(Sender: TObject; var Key : char);
var
  decPlace : integer;
begin
  if Sender is TEdit then
  begin
    decPlace := Pos('.', TEdit(Sender).Text);
    if not (Key < #32) then  { not a control character }
      if (not (Key in ['0'..'9', '.'])) or ((decPlace > 0) and (Key = '.')) then
      begin
        MessageBeep(0);
        Key := #0;
      end;
  end;
end;

procedure TCREditMoney.SetValue(const Value: currency);
begin
  Text := FloatToStrF(Value, ffFixed, 15, 2);
end;

{ Register the components on the palette }

procedure Register;
begin
  RegisterComponents('Centrereed', [TCREditInt, TCREditFloat, TCREditMoney]);
end;

end.
