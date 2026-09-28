unit Compositor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CCSPrint, StdCtrls;

type
  TCompositor = class(TForm)
    Container: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FSavedFont : TFont;
    FSwitchFont : Boolean;
    FLineNumber : integer;
    FLineWidth : integer;
    FMemoText : string;
    FLeftMargin: integer;
    FAlignment: TAlignment;
    FSpecialLine: integer;
    FOriginalWidth: integer;
    FSpecialFont: TFont;
    FNeighbour: TCompositor;
    procedure ResizeContainer;
    procedure SetLineWidth(const Value : integer);
    function  GetHaveData : Boolean;
    function  GetLine : string;
    procedure SetRawData(const Value: string);
    function  GetTextHeight : integer;
    procedure SetAlignment(const Value: TAlignment);
    procedure SetLeftMargin(const Value: integer);
    procedure SetSpecialLine(const Value: integer);
    procedure SetOriginalWidth(const Value: integer);
    procedure SetNeighbour(const Value: TCompositor);
  public
    property Alignment : TAlignment read FAlignment write SetAlignment;
    property HaveData : Boolean read GetHaveData;
    property LeftMargin : integer read FLeftMargin write SetLeftMargin;
    property Line : string read GetLine;
    property LineWidth : integer read FLineWidth write SetLineWidth;
    property OriginalWidth : integer read FOriginalWidth write SetOriginalWidth;
    property Neighbour: TCompositor read FNeighbour write SetNeighbour;
    property RawData : string write SetRawData;
    property SpecialFont : TFont read FSpecialFont;
    property SpecialLine : integer read FSpecialLine write SetSpecialLine;
    property TextHeight : integer read GetTextHeight;
  end;

implementation
{$IFDEF DEBUG}
uses
  CCSDebug;
{$ENDIF}

{$R *.DFM}

{ TCompositor }

procedure TCompositor.ResizeContainer;
begin
{$IFDEF DEBUG}
    Trace('ResizeContainer to ' + IntToStr(LineWidth));
{$ENDIF}
  FMemoText := Container.Text;
  Container.Text := '';
  Container.Width := LineWidth;
  Container.Text := FMemoText;
end;

procedure TCompositor.SetLineWidth(const Value: integer);
begin
  FLineWidth := Value;
  ResizeContainer;
end;

procedure TCompositor.FormCreate(Sender: TObject);
begin
  FSavedFont := TFont.Create;
  FSpecialFont := TFont.Create;
  Container.Lines.Clear;
  FMemoText := '';
end;

function TCompositor.GetHaveData : Boolean;
begin
  if Assigned(Neighbour) then
  begin
  { This is a kludge to handle the purchase order "Signed for and on
    behalf of" line at the end. The company name is in column 2 which will
    overprint the first lines of the postamble. So we flag the column as
    PrintAsLastLine.  By checking the Neighbour property, we can tell if
    we have to wait for Neighbour to reach his last line before we feed
    out our data. This is the only use of Neighbour. }
    if Neighbour.HaveData then
    begin
      Result := false;
      Exit;
    end;
  end;
  if FSwitchFont then
  begin
    Self.Font.Assign(FSavedFont);
    FSwitchFont := false;
  end;
  Result := (Container.Lines.Count <> 0);
  if Result then
    if SpecialLine <> 0 then
      if FLineNumber = SpecialLine then
      begin
        FSavedFont.Assign(Self.Font);
        Self.Font.Assign(FSpecialFont);
        FSwitchFont := true;
      end;
end;

function TCompositor.GetLine : string;
begin
  if Container.Lines.Count <> 0 then
  begin
    Result := Container.Lines[0];
    Container.Lines.Delete(0);
    Inc(FLineNumber);
  end
  else
    Result := '';
{$IFDEF DEBUG}
    Trace('GetLine=' + Result + ', FLineNumber=' + IntToStr(FLineNumber));
{$ENDIF}
end;

procedure TCompositor.SetRawData(const Value: string);
begin
  Container.Lines.Clear;
  FMemoText := Value;
  Container.Text := FMemoText;
  FLineNumber := 1;
end;

function TCompositor.GetTextHeight : integer;
begin
  { See how high we need to make our print line by getting height
    of text with ascenders and descenders }
  Result := Self.Canvas.TextHeight('WjygtAq');
{$IFDEF DEBUG}
  Trace('TextHeight=' + IntToStr(Result));
{$ENDIF}
end;

procedure TCompositor.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
end;

procedure TCompositor.SetLeftMargin(const Value: integer);
begin
  FLeftMargin := Value;
end;

procedure TCompositor.SetSpecialLine(const Value: integer);
begin
  FSpecialLine := Value;
end;

procedure TCompositor.SetOriginalWidth(const Value: integer);
begin
  FOriginalWidth := Value;
end;

procedure TCompositor.FormDestroy(Sender: TObject);
begin
  FSavedFont.Free;
  FSpecialFont.Free;
end;

procedure TCompositor.SetNeighbour(const Value: TCompositor);
begin
  FNeighbour := Value;
end;

end.
