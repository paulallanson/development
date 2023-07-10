(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  The CCS Printer's Devil.

  From Merriam-Webster Dictionary
    Main Entry: printer's devil: an apprentice in a printing office
    Function: noun
    Date: 1763


VSS Info:
$Header: /CCSCommon/CCSDevil.pas 8     21/03/:0 14:37 Roddym $
$History: CCSDevil.pas $
 * 
 * *****************  Version 8  *****************
 * User: Roddym       Date: 21/03/:0   Time: 14:37
 * Updated in $/CCSCommon
 * Fix bug, BufferZone was being set to twice text height.  This was
 * moronic.
 * 
 * *****************  Version 7  *****************
 * User: Roddym       Date: 15/03/:0   Time: 9:54
 * Updated in $/CCSCommon
 * Minor fixes to ensure FT printouts are correct after all the changes
 * made to letter printing.
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:11
 * Updated in $/CCSCommon
 * Infinitely configurable printing layouts (well, almost).
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 7/01/:0    Time: 16:41
 * Updated in $/CCSCommon
 * Changes for new letter printing mechanism, driven by the
 * tb_LetterLayout and tb_LetterElement tables.  New Letter object, also
 * hard-coded version to make switch transparent to Forms Technology.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 20/12/99   Time: 11:09
 * Updated in $/CCSCommon
 * Fix bug where continuation text on multiple letters/faxes was always
 * that of the last letter/fax to be printed.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:16
 * Updated in $/CCSCommon
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 8/12/99    Time: 16:16
 * Updated in $/CCSCommon
 * First conversion of Enquiry and Purchase Order fax/letters.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 10:15
 * Created in $/CCSCommon
 * First check-in of new printing routines for Broker as well as some
 * useful objects and functions.

*******************************************************************************)
unit CCSDevil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Compositor, CCSDataBroker,
  CCSPrint;

type
  TDevil  = class
  private
    FKeepTogether : Boolean;
    FPrintRecord : TPrintRecord;
    FCompositor1 : TCompositor;
    FCompositor2 : TCompositor;
    FCompositor3 : TCompositor;
    FNewLetter: Boolean;
    FDataBroker: TDataBroker;
    procedure AdjustWidth(Compositor : TCompositor);
    function ComposeData : Boolean;
    function GetDataReady : Boolean;
    function GetLineHeight : integer;
    function GetSpaceNeeded : integer;
    function HandleEnd : Boolean;
    function HandleBlank : Boolean;
    function HandleContinuedText : Boolean;
    function HandleText : Boolean;
    function HandleKeepTogether : Boolean;
    function HandleUpdateInfo : Boolean;
    procedure GiveToCompositor(Column : TColumnRecord; Compositor : TCompositor);
    procedure SetNewLetter(const Value: Boolean);
    procedure SetDataBroker(const Value: TDataBroker);
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdjustWidths;
    property Compositor1 : TCompositor read FCompositor1;
    property Compositor2 : TCompositor read FCompositor2;
    property Compositor3 : TCompositor read FCompositor3;
    property DataBroker : TDataBroker read FDataBroker write SetDataBroker;
    property DataReady : Boolean read GetDataReady;
    property LineHeight : integer read GetLineHeight;
    property NewLetter : Boolean read FNewLetter write SetNewLetter;
    property PrintRecord : TPrintRecord read FPrintRecord;
    property SpaceNeeded : integer read GetSpaceNeeded;
  end;

implementation
uses
{$IFDEF DEBUG}
  CCSDebug,
{$ENDIF}
  Forms, Math;

{ TDevil }

function TDevil.ComposeData: Boolean;
begin
  FKeepTogether := false;
  case FPrintRecord.RecordType of
    rtEnd           : Result := HandleEnd;
    rtBlank         : Result := HandleBlank;
    rtText          : Result := HandleText;
    rtKeepTogether  : Result := HandleKeepTogether;
    rtUpdateInfo    : Result := HandleUpdateInfo;
    rtContinuedText : Result := HandleContinuedText;
    else  Result := false;
  end;  { case }
end;

constructor TDevil.Create;
begin
  FCompositor1 := TCompositor.Create(nil);
  FCompositor2 := TCompositor.Create(nil);
  FCompositor3 := TCompositor.Create(nil);
end;

destructor TDevil.Destroy;
begin
  if Assigned(FCompositor1) then
    FCompositor1.Free;
  if Assigned(FCompositor2) then
    FCompositor2.Free;
  if Assigned(FCompositor3) then
    FCompositor3.Free;
  inherited;
end;

function TDevil.GetDataReady: Boolean;
begin
  if (FCompositor1.HaveData)
  or (FCompositor2.HaveData)
  or (FCompositor3.HaveData) then
    Result := true
  else
  begin
    FPrintRecord := DataBroker.GetNext;
    if Assigned(FPrintRecord) then
      Result := ComposeData
    else
      Result := false;
  end;
end;

function TDevil.GetSpaceNeeded: integer;
var
  c1, c2, c3 : integer;
begin
  if FKeepTogether then
  begin
    c1 := Compositor1.TextHeight * Compositor1.Container.Lines.Count;
    c2 := Compositor2.TextHeight * Compositor2.Container.Lines.Count;
    c3 := Compositor3.TextHeight * Compositor3.Container.Lines.Count;
  end
  else
  begin
    c1 := Compositor1.TextHeight;
    c2 := Compositor2.TextHeight;
    c3 := Compositor3.TextHeight;
  end;
  Result := Max(c1, Max(c2, c3));
end;

function TDevil.HandleBlank: Boolean;
begin
  Compositor1.RawData := ' ';
  Compositor1.Font.Style := [];
  Result := true;
end;

function TDevil.HandleEnd: Boolean;
begin
  NewLetter := true;
  Result := GetDataReady;
end;

function TDevil.HandleKeepTogether: Boolean;
begin
  Result := HandleText;
  FKeepTogether := Result;
end;

function TDevil.HandleText: Boolean;
begin
  with FPrintRecord do
  begin
    if Assigned(Column1) then
      GiveToCompositor(Column1, Compositor1);
    if Assigned(Column2) then
    begin
      GiveToCompositor(Column2, Compositor2);
      if Column2.PrintAsLastLine then
        Compositor2.Neighbour := Compositor1
      else
        Compositor2.Neighbour := nil;
    end;
    if Assigned(Column3) then
      GiveToCompositor(Column3, Compositor3);
    Compositor1.SpecialFont.Assign(SpecialFont);
    Compositor2.SpecialFont.Assign(SpecialFont);
    Compositor3.SpecialFont.Assign(SpecialFont);
  end;
  Result := true;
end;

function TDevil.GetLineHeight : integer;
var
  c1, c2, c3 : integer;
begin
  c1 := Compositor1.TextHeight;
  c2 := Compositor2.TextHeight;
  c3 := Compositor3.TextHeight;
  Result := Max(c1, Max(c2, c3));
  DataBroker.PageLayout.VBuffer := 2*Result;
end;

procedure TDevil.SetNewLetter(const Value: Boolean);
begin
  FNewLetter := Value;
end;

procedure TDevil.GiveToCompositor(Column: TColumnRecord;
  Compositor: TCompositor);
begin
  Compositor.Font.Assign(Column.Font);
  Compositor.LeftMargin := Column.LeftMargin;
  Compositor.Alignment := Column.Alignment;
  Compositor.OriginalWidth := Column.Width;  { if zero, wants the whole available width }
  AdjustWidth(Compositor);
  Compositor.SpecialLine := Column.SpecialLine;
  Compositor.RawData := Column.Text;
end;

procedure TDevil.SetDataBroker(const Value: TDataBroker);
begin
  FDataBroker := Value;
end;

procedure TDevil.AdjustWidth(Compositor : TCompositor);
begin
  if Compositor.OriginalWidth = 0 then
    Compositor.LineWidth := DataBroker.PageLayout.CurrentWidth - Compositor.LeftMargin
  else
    Compositor.LineWidth := Compositor.OriginalWidth;
end;

procedure TDevil.AdjustWidths;
begin
  AdjustWidth(Compositor1);
  AdjustWidth(Compositor2);
  AdjustWidth(Compositor3);
end;

function TDevil.HandleUpdateInfo: Boolean;
begin
  with FPrintRecord do
  begin
    DataBroker.UpdateStatus(UpdateInfo);
  end;
  Result := GetDataReady;
end;

function TDevil.HandleContinuedText: Boolean;
begin
  DataBroker.ContinuedText := FPrintRecord.ContinuedText;
  DataBroker.ContinuedFont.Assign(FPrintRecord.Column1.Font);
  Result := GetDataReady;
end;

end.
