(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Drag'n'Drop Letter Layout Designer for Broker.
  The reason there is so much trace/debug code in here is because
  it has been a pain to get the logic to work as required.  So BEWARE
  of idle or casual changes unless you know the implications.

VSS Info:
$Header: /PageDesigner/PDDragDrop.pas 6     10/05/:1 14:16 Paul $
$History: PDDragDrop.pas $
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 10/05/:1   Time: 14:16
 * Updated in $/PageDesigner
 * Changed to allow the setting of the 'Set data to Tab'
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 30/03/:0   Time: 14:37
 * Updated in $/PageDesigner
 * Fix bug in Collision (again), now uses a list of memos and sorts them
 * by position.  Fix access violation due to Parent of elements not being
 * set to point to new Letter when assigning clone.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 30/03/:0   Time: 13:19
 * Updated in $/PageDesigner
 * Fix algorithm in method Collide to take account of memos which are
 * touching edges.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 30/03/:0   Time: 10:34
 * Updated in $/PageDesigner
 * Changes to the way column widths and indents are handled.  New dialog
 * to confirm column width changes.  Propagate letter font changes to the
 * elements.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 10/03/:0   Time: 16:12
 * Updated in $/PageDesigner
 * Make the UsesTab attribute visible and allow users to change it.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:09
 * Created in $/PageDesigner
 * Infinitely configurable printing layouts (well, almost).

*******************************************************************************)
unit PDDragDrop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ExtCtrls, StdCtrls, LetterDM, PageDM, PDLetter, Menus, Buttons;

const
  WM_SCRUNCH       = WM_APP + 1;
  WM_WIDTHCHANGE   = WM_APP + 2;

type
  TPDMemo = class(TMemo)
    procedure MoveTo(const X, Y, NewWidth : integer; const Safe : Boolean);
  private
    FElement: TElement;
    FMoving: Boolean;
    FStaticColour : TColor;
    FMovers : TList;
    function  Collision(const X, Y, NewWidth : integer) : integer;
    procedure LoadMovers;
    procedure MemoEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure SetElement(Value : TElement);
    procedure SetMoving(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property StaticColour : TColor read FStaticColour write FStaticColour;
    property Element : TElement read FElement write SetElement;
    property Moving : Boolean read FMoving write SetMoving;
  end;

  TfrmPreview = class(TForm)
    Preview: TScrollBox;
    Tab1: TBevel;
    Tab2: TBevel;
    pumMemo: TPopupMenu;
    Fulllinewidth: TMenuItem;
    Column1: TMenuItem;
    Column2: TMenuItem;
    Column3: TMenuItem;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDebug: TBitBtn;
    lblColumn1: TLabel;
    lblColumn2: TLabel;
    lblColumn3: TLabel;
    lblInstruct: TLabel;
    Indent1: TMenuItem;
    Width1: TMenuItem;
    UseTabStop11: TMenuItem;
    procedure PreviewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure PreviewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pumMemoPopup(Sender: TObject);
    procedure FulllinewidthClick(Sender: TObject);
    procedure Column1Click(Sender: TObject);
    procedure Column2Click(Sender: TObject);
    procedure Column3Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDebugClick(Sender: TObject);
    procedure IndentWidthClick(Sender: TObject);
    procedure UseTabStop11Click(Sender: TObject);
  private
    FActive : Boolean;
    FEdge : integer;
    FLetter : TLetter;
    FCol1Left : integer;
    FCol2Left : integer;
    FCol3Left : integer;
    FCol0, FCol1, FCol2, FCol3 : integer;
    FCurrentPos : integer;
    function  AllScanned : Boolean;
    function  AssignOrder(const X, Y, iPO : integer; var Memo : TPDMemo) : Boolean;
    procedure CreateElements;
    procedure FixLeftWidth(aMemo : TPDMemo);
    procedure FreeElements;
    procedure HandlePopUp(const Left, Col, NewWidth : integer);
    procedure Idler(Sender: TObject; var Done: Boolean);
    procedure LookRight(const X, Y, iPO : integer);
    procedure ScrunchUp;
    procedure SetTabs;
  protected
    procedure WMScrunch(var Message: TMessage); message WM_SCRUNCH;
    procedure WMWidthChange(var Message: TMessage); message WM_WIDTHCHANGE;
  public
    property Letter : TLetter read FLetter write FLetter;
  end;

implementation

{$R *.DFM}

uses
{$IFDEF DEBUG}
  CCSDebug,
{$ENDIF}
  Math, PDIndentWidth, PDConfirmWidth;
const
  LineGap    = 6;
  LineHeight = LineGap * 3;  { Must be multiple of LineGap }

var
  FScans : integer;  { Needs to be global as shared between form and memos }
{$IFDEF DEBUG}
  FCounter : integer;
{$ENDIF}

function SortMemos(Item1, Item2: Pointer): Integer;
begin
  { Compare returns < 0 if Item1 is less and Item2, 0 if they are equal
    and > 0 if Item1 is greater than Item2. }
  if TPDMemo(Item1).Top < TPDMemo(Item2).Top then
    Result := -1
  else
  if TPDMemo(Item1).Top = TPDMemo(Item2).Top then
    Result := 0
  else
    Result := 1;
end;

{ TPDMemo }

constructor TPDMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMovers := TList.Create;
  DragMode := dmAutomatic;
  ReadOnly := true;
  BorderStyle := bsNone;
  OnEndDrag := MemoEndDrag;
end;

procedure TPDMemo.MemoEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  Color := StaticColour;
end;

procedure TPDMemo.MoveTo(const X, Y, NewWidth: integer;
  const Safe : Boolean);
{  Safe is true when we are creating from scratch, there's no chance of
   collisions or overlaying.  Safe is false when we're rejigging because
   something has been moved and requires checks for collisions. }
var
  iNewTop : integer;
  aMemo : TPDMemo;
  i, inx : integer;
begin
  { X, Y is the new position.  Force vertical co-ordinates to multiples of
    LineGap pixels. }
  if Y < LineGap then
    iNewTop := LineGap
  else
    iNewTop := (((Y + LineGap-1) DIV LineGap) * LineGap);
  { We're trying to move this memo to left = X, top = Y but we have
    to check if there's already something there.  If there is, move it
    and everything below it. }
{$IFDEF DEBUG}
  Trace(Element.Name + ' MoveTo ' + IntToStr(X) + ', ' +
    IntToStr(Y) + ' (' + IntToStr(iNewTop) + '), ' + IntToStr(NewWidth));
{$ENDIF}
  if not Safe then
  begin
    Moving := true;
    inx := Collision(X, iNewTop, NewWidth);
    if inx > -1 then
    begin
      for i := inx to Pred(FMovers.Count) do
      begin
        aMemo := TPDMemo(FMovers[i]);
        aMemo.Top := aMemo.Top + Self.Height;
      end;
    end;
  end;
  Left := X;
  Top := iNewTop;
  Width := NewWidth;
end;

function TPDMemo.Collision(const X, Y, NewWidth : integer): integer;
var
  aMemo : TPDMemo;
  i : integer;
  Right, Bottom,
  maxTop, maxLeft, minRight, minBottom : integer;
begin
{$IFDEF DEBUG}
  Trace('Collision called X=' + IntToStr(X) + ', Y=' +
    IntToStr(Y) + ', nW=' + IntToStr(NewWidth));
  Inc(FCounter);
  if FCounter > 500 then
    Application.Terminate;
{$ENDIF}
  { Called to see if the drag drop operation will make us collide with
    a component already in the same position.  If so, return the object's
    index in FMovers as the function result. }
  Result := -1;
  Right := X + NewWidth;
  Bottom := Y + Height;
  LoadMovers;
  for i := 0 to Pred(FMovers.Count) do
    if (TPDMemo(FMovers[i]) <> Self) and
      not TPDMemo(FMovers[i]).Moving  then
      begin
        aMemo := TPDMemo(FMovers[i]);
{$IFDEF DEBUG}
        Trace('aMemo L=' + IntToStr(aMemo.Left) + ', T=' +
              IntToStr(aMemo.Top) + ', R=' +
              IntToStr(aMemo.Left+aMemo.Width) +  ', B=' +
              IntToStr(aMemo.Top+aMemo.Height) + ' : ' +
              aMemo.Element.Name);
{$ENDIF}
        { Describe any intersection as a rectangle bounded by the
          highest top (ie furthest down), highest left (ie furthest left),
          least Right and lowest Bottom }
        maxTop := Max(Y, aMemo.Top);
        maxLeft := Max(X, aMemo.Left);
        minRight := Min(Right, aMemo.Left+aMemo.Width);
        minBottom := Min(Bottom, aMemo.Top+aMemo.Height);
{$IFDEF DEBUG}
        Trace('Right=' + IntToStr(Right) + ' ' +
              'Bottom=' + IntToStr(Bottom) + ' ' +
              'maxTop=' + IntToStr(MaxTop) +  ' ' +
              'maxLeft=' + IntToStr(MaxLeft) + ' ' +
              'minRight=' + IntToStr(MinRight) + ' ' +
              'minBottom=' + IntToStr(MinBottom));
{$ENDIF}
        { Does this describe a valid rect? or a line one pixel high for
          touching edges? }
        if (minBottom >= maxTop) and (minRight > maxLeft) then
        { Is the rectangle describing the memo we're looking at because
          we are bigger and overlaying it completely? }
        if( (maxTop = aMemo.Top) and (maxLeft = aMemo.Left) and
            (minRight = (aMemo.Left+aMemo.Width)) and
            (minBottom = (aMemo.Top+aMemo.Height)) )
        or
        { Depending on where we collide, one or more corners will match }
        (
          ((Bottom = minBottom) and (Right = minRight))
        or
          ((Bottom = minBottom) and (X = MaxLeft))
        or
          ((Y = maxTop) and (X = MaxLeft))
        or
          ((Y = maxTop) and (Right = minRight))  )
        then
        begin
          Result := i;
{$IFDEF DEBUG}
          Trace(aMemo.Element.Name + ' collided, result = ' + IntToStr(Result));
{$ENDIF}
          Break;
        end;
      end;
end;


procedure TPDMemo.SetElement(Value: TElement);
begin
  FElement := Value;
  Hint := FElement.Name;
  if Element.UsesTab <> 'N' then
    FStaticColour := clAqua
  else
    FStaticColour := clWhite;
  Color := FStaticColour;
end;

procedure TPDMemo.SetMoving(const Value: Boolean);
begin
  FMoving := Value;
end;

destructor TPDMemo.Destroy;
begin
  FMovers.Free;
  inherited;
end;

function SortMovers(Item1, Item2 : Pointer) : integer;
begin
  { Compare returns < 0 if Item1 is less and Item2, 0 if they are equal
    and > 0 if Item1 is greater than Item2. We are sorting the PDMemos
    in order of Top }
  if TPDMemo(Item1).Top < TPDMemo(Item2).Top then
    Result := -1
  else
  if TPDMemo(Item1).Top = TPDMemo(Item2).Top then
    Result := 0
  else
    Result := 1;
end;

procedure TPDMemo.LoadMovers;
var
  i : integer;
  aForm : TForm;
begin
  FMovers.Clear;
  aForm := Owner as TForm;
  if Assigned(aForm) then
  for i := 0 to Pred(aForm.ComponentCount) do
    if aForm.Components[i] is TPDMemo then
      FMovers.Add(aForm.Components[i]);
  FMovers.Sort(SortMovers);  { Sort them in order of Top }
end;

{ TfrmPreview }

procedure TfrmPreview.PreviewDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  iX : integer;
  sTemp : string;
  NewWidth : integer;
begin
  if Source is TPDMemo then
  with Source as TPDMemo do
  begin
{$IFDEF DEBUG}
    Trace('>>>>>DragDrop ' + Element.Name + ' ' + IntToStr(X) + ', ' +
      IntToStr(Y));
{$ENDIF}
    FCurrentPos := Preview.VertScrollBar.Position;
    sTemp := Lines.Text;
    if Element.Column = 0 then
    begin
      iX := FCol1Left;
      NewWidth := FCol0;
    end
    else
    if Element.UsesTab <> 'N' then
    begin
      iX := FCol1Left;
      NewWidth := FCol1;
    end
    else
    begin
      if X < Tab1.Left then
      begin
        iX := FCol1Left;
        Element.Column := 1;
        NewWidth := FCol1;
      end
      else
      if X < Tab2.Left then
      begin
        iX := FCol2Left;
        Element.Column := 2;
        NewWidth := FCol2;
      end
      else
      begin
        iX := FCol3Left;
        Element.Column := 3;
        NewWidth := FCol3;
      end;
    end;
    MoveTo(iX, Y, NewWidth, false);
    FixLeftWidth(Source as TPDMemo);
    Lines.Text := sTemp;
  end;
  { We post a message because Delphi gets confused about which TControl
    it's looking at if we Scrunch Up before the end of dragging and
    change the position of the objects. }
  PostMessage(Handle, WM_SCRUNCH, 0, 0);
end;

procedure TfrmPreview.PreviewDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TPDMemo;
  if Accept then
  begin
    Application.OnIdle := nil;
    TPDMemo(Source).DragCursor := crDrag;
    TPDMemo(Source).Color := clInfoBk;
  end;
  Application.ProcessMessages;
end;

procedure TfrmPreview.FormCreate(Sender: TObject);
begin
  FEdge := GetSystemMetrics(SM_CXVSCROLL);
{$IFDEF DEBUG}
  btnDebug.Visible := true;
{$ENDIF}  
end;

procedure TfrmPreview.FormActivate(Sender: TObject);
begin
  if not FActive then
  begin
    Preview.Hide;
    try
      SetTabs;
      CreateElements;
      FActive := true;
    finally
      Preview.Show;
    end;
  end;
end;

procedure TfrmPreview.FormDestroy(Sender: TObject);
begin
  Application.OnIdle := nil;
  FreeElements;
end;

procedure TfrmPreview.CreateElements;
var
  i : integer;
  aMemo : TPDMemo;
  iTop1, iTop2, iTop3 : integer;
  iHeight, iPrintOrder : integer;
begin
{$IFDEF DEBUG}
   Trace('Creating Elements +++++++++++++++++++++');
{$ENDIF}
  try
    FLetter.Elements.Sort;
    iTop1 := LineGap;
    iTop2 := LineGap;
    iTop3 := LineGap;
    iPrintOrder := 0;
    with FLetter do
    for i := 0 to Pred(Elements.Count) do
    if (Elements[i].Printed) and (Elements[i].Name <> sContinuation) then
    begin
      if Elements[i].PrintOrder <> iPrintOrder then
      begin
        iPrintOrder := Elements[i].PrintOrder;
        iTop1 := Max(iTop1, Max(iTop2, iTop3));
        iTop2 := iTop1;
        iTop3 := iTop1;
      end;
      aMemo := TPDMemo.Create(Self);
      aMemo.Parent := Preview;
      aMemo.PopUpMenu := pumMemo;
      aMemo.Element := Elements[i];
      aMemo.Alignment := Elements[i].Alignment;
      if aMemo.Element.Column < 2 then
      begin
        if aMemo.Element.Column = 0 then
          aMemo.MoveTo(FCol1Left, iTop1, FCol0, true)
        else
          aMemo.MoveTo(FCol1Left, iTop1, FCol1, true);
      end
      else
      if aMemo.Element.Column = 2 then
        aMemo.MoveTo(FCol2Left, iTop2, FCol2, true)
      else
        aMemo.MoveTo(FCol3Left, iTop3, FCol3, true);
      if Elements[i].Text = '' then
        aMemo.Lines.Add('Element ' + IntToStr(i))
      else
        aMemo.Lines.Text := Elements[i].Text;
      aMemo.Height := aMemo.Lines.Count * LineHeight;
      iHeight := aMemo.Height + LineGap;
  {$IFDEF DEBUG}
      with Elements[i] do
      begin
        Trace('Element ' + IntToStr(i) + ' ' + Name);
        Trace('PrintOrder = ' + IntToStr(PrintOrder) +
              ', Column = ' + IntToStr(Column));
        Trace('Top = ' + IntToStr(aMemo.Top) +
              ', Left = ' + IntToStr(aMemo.Left) +
              ', Width = ' + IntToStr(aMemo.Width) +
              ', Height = ' + IntToStr(iHeight));
        Trace('iTops are ' + IntToStr(iTop1) + ' ' +
              IntToStr(iTop2) + ' ' + IntToStr(iTop3) + ' ');
      end;
  {$ENDIF}
      case aMemo.Element.Column of
      2:   iTop2 := iTop2 + iHeight;
      3:   iTop3 := iTop3 + iHeight;
      else iTop1 := iTop1 + iHeight;
      end;  { case }
    end;
    Tab1.Height := Preview.VertScrollBar.Range;
    Tab2.Height := Preview.VertScrollBar.Range;
  except on E: Exception do
{$IFDEF DEBUG}
    Trace('Error in CreateElements: ' + E.Message);
{$ENDIF}
  end;
end;

procedure TfrmPreview.SetTabs;
{var
  iTab1, iTab2 : integer;
  cConvert : double;    }
begin
  { Use fixed values for tab stops }
  Tab1.Left := 90;
  Tab2.Left := 180;
  FCol1Left := 0;
  FCol2Left := 92;
  FCol3Left := 182;
  Preview.Width := Preview.Width + FEdge;
  FCol0 := Preview.ClientWidth - FEdge;
  FCol1 := Tab1.Left-2;
  FCol2 := Tab2.Left - Tab1.Left-2;
  FCol3 := Preview.ClientWidth - Tab2.Left-2;
(*
  The code that follows was intended to mimic the settings of Tab Stops 1 and 2
  but proved far too difficult to do convincingly.
  { Preview panel is 275 pixels wide by 390 high, representing an A4
    page at 1/3rd of 8.27 by 11.69.  Convert the tab values accordingly. }
  with FLetter do
  begin
    if TabStop1 = 0 then
    begin
      TabUnit := sInches;
      TabStop1 := 1.3;
      TabStop2 := 3;
    end;
    if TabUnit = sInches then
      cConvert := 1
    else
      cConvert := InchesToCm;
    iTab1 := Trunc(TabStop1*cConvert*100 / 3);
    iTab2 := Trunc(TabStop2*cConvert*100 / 3);
    Tab1.Left := iTab1;
    Tab2.Left := iTab2;
    FCol1 := Tab1.Left;
    FCol2 := Tab2.Left - Tab1.Left;
    FCol3 := Preview.Width - FEdge - Tab2.Left;
  end;
*)
end;

procedure TfrmPreview.FreeElements;
var
  i : integer;
begin
{$IFDEF DEBUG}
   Trace('Freeing elements ################');
{$ENDIF}
  for i := Pred(ComponentCount) downto 0 do
    if Components[i] is TPDMemo then
      TPDMemo(Components[i]).Free;
end;

procedure TfrmPreview.ScrunchUp;
var
  aMemo : TPDMemo;
  Y : integer;
  iPrintOrder : integer;
  iMid1, iMid2, iMid3 : integer;
begin
{$IFDEF DEBUG}
   Trace('Scrunching Up @@@@@@@@@@@@@@@@@@');
{$ENDIF}
  try
    Preview.VertScrollBar.Position := 0;
    { Scan each column, set the TPDMemo tag to flag we have done this }
    iPrintOrder := 1;
    iMid1 := FCol1 DIV 2;                   { Midpoint column 1 }
    iMid2 := Tab1.Left + (FCol2 DIV 2) ;    { Midpoint column 2 }
    iMid3 := Tab2.Left + (FCol3 DIV 3) ;    { Midpoint column 3 }
    Y := 0;
    FScans := 0;
    while not (AllScanned or Application.Terminated) do
    begin
      if AssignOrder(iMid1, Y, iPrintOrder, aMemo) then
      begin
        if aMemo.Element.Column <> 0 then
        while Y < (aMemo.Top + aMemo.Height) do
        begin
          LookRight(iMid2, Y, iPrintOrder);
          LookRight(iMid3, Y, iPrintOrder);
          Inc(Y);
        end;
        Inc(iPrintOrder);
      end
      else
      if AssignOrder(iMid2, Y, iPrintOrder, aMemo) then
      begin
        while Y < (aMemo.Top + aMemo.Height) do
        begin
          LookRight(iMid3, Y, iPrintOrder);
          Inc(Y);
        end;
        Inc(iPrintOrder);
      end
      else
      if AssignOrder(iMid3, Y, iPrintOrder, aMemo) then
        Inc(iPrintOrder);
      Inc(Y);
    end;
    FreeElements;
    CreateElements;
    Preview.VertScrollBar.Position := FCurrentPos;
  except on E: Exception do
{$IFDEF DEBUG}
   Trace('Error in ScrunchUp: ' + E.Message);
{$ENDIF}
  end;
end;

function TfrmPreview.AllScanned: Boolean;
var
  i : integer;
begin
  Application.ProcessMessages;
  Result := true;
  try
    for i := 0 to Pred(ComponentCount) do
      if Components[i] is TPDMemo then
        if TPDMemo(Components[i]).Tag = 0 then
        begin
          Result := false;
          Break;
        end;
   { Sometimes all the algorithms just fail to find overlaying memos.
     By limiting the iterations and breaking out, it seems the clean up and
     redraw will work it out anyway. }
   Inc(FScans);
   if FScans > 1000 then
     Result := true;
  except on E: Exception do
{$IFDEF DEBUG}
   Trace('Error in AllScanned: ' + E.Message);
{$ENDIF}
  end;
end;

function TfrmPreview.AssignOrder(const X, Y, iPO : integer;
  var Memo : TPDMemo) : Boolean;
var
  Pt : TPoint;
  aMemo : TControl;
begin
  Result := false;
  try
    Pt.X := X;
    Pt.Y := Y;
    aMemo := Preview.ControlAtPos(Pt, false, true);
    if Assigned(aMemo) and (aMemo is TPDMemo) then
      with TPDMemo(aMemo) do
        if Tag = 0 then
        begin
          Element.PrintOrder := iPO;
          Tag := iPO;
          Result := true;
          Memo := TPDMemo(aMemo);
{$IFDEF DEBUG}
          Trace('AssignOrder ' + IntToStr(X) + ', ' +
            IntToStr(Y) + ', ' + IntToStr(iPO) + ' found ' + Element.Name);
{$ENDIF}
        end;
  except on E: Exception do
{$IFDEF DEBUG}
    Trace('Error in AssignOrder: ' + E.Message);
{$ENDIF}
  end;
end;

procedure TfrmPreview.LookRight(const X, Y, iPO: integer);
var
  Pt : TPoint;
  aMemo : TControl;
begin
  try
    Pt.X := X;
    Pt.Y := Y;
    aMemo := Preview.ControlAtPos(Pt, false, true);
    if Assigned(aMemo) and (aMemo is TPDMemo) then
      with TPDMemo(aMemo) do
        if (Tag = 0) and (Element.Column <> 0) then
        begin
          Element.PrintOrder := iPO;
          Tag := iPO;
{$IFDEF DEBUG}
          Trace('LookRight ' + IntToStr(X) + ', ' +
            IntToStr(Y) + ', ' + IntToStr(iPO) + ' found ' + Element.Name);
{$ENDIF}
        end;
  except on E: Exception do
{$IFDEF DEBUG}
    Trace('Error in LookRight: ' + E.Message);
{$ENDIF}
  end;
end;

procedure TfrmPreview.WMScrunch(var Message: TMessage);
begin
{$IFDEF DEBUG}
  FCounter := 0;
{$ENDIF}
  { This has to be done outside the scope of the PreviewDragDrop method
    or else you get strange access violations within the Delphi System
    Unit, specifically in GetDynaMethod.  }
  LockWindowUpdate(Handle);
  try
    ScrunchUp;
    Application.ProcessMessages;
  finally
    LockWindowUpdate(0);
  end;
  Message.Result := 1;
end;

procedure TfrmPreview.pumMemoPopup(Sender: TObject);
var
  aMemo : TPDMemo;
begin
  FCurrentPos := Preview.VertScrollBar.Position;
  if pumMemo.PopUpComponent is TPDMemo then
  begin
    aMemo := TPDMemo(pumMemo.PopUpComponent);
    if aMemo.Element.Parent.LetterType
      in [ltPurchaseOrder, ltAcknowledgement] then
      if CompareText(aMemo.Element.Name, psDeliverTo) = 0 then
      begin
        FullLineWidth.Enabled := false;
        Column1.Enabled := false;
        Column2.Enabled := false;
        Column3.Enabled := false;
        Indent1.Enabled := false;
        Width1.Enabled := false;
      end;
    UseTabStop11.Enabled := aMemo.element.DbData and not
      aMemo.element.Fixed;
    aMemo.Color := clInfoBK;
    Application.OnIdle := Idler;
  end;
end;

procedure TfrmPreview.FulllinewidthClick(Sender: TObject);
begin
  HandlePopUp(FCol1Left, 0, FCol1);
end;

procedure TfrmPreview.Column1Click(Sender: TObject);
begin
  HandlePopUp(FCol1Left, 1, FCol1);
end;

procedure TfrmPreview.Column2Click(Sender: TObject);
begin
  HandlePopUp(FCol2Left, 2, FCol2);
end;

procedure TfrmPreview.Column3Click(Sender: TObject);
begin
  HandlePopUp(FCol3Left, 3, FCol3);
end;

procedure TfrmPreview.btnSaveClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmPreview.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPreview.HandlePopUp(const Left, Col, NewWidth : integer);
var
  aMemo : TPDMemo;
  sTemp : string;
begin
  if pumMemo.PopUpComponent is TPDMemo then
  begin
    aMemo := TPDMemo(pumMemo.PopUpComponent);
    aMemo.Element.Column := Col;
    aMemo.Element.UsesTab := 'N';
    FixLeftWidth(aMemo);
    sTemp := aMemo.Lines.Text;
    aMemo.MoveTo(Left, aMemo.Top, NewWidth, false);
    aMemo.Lines.Text := sTemp;
    aMemo.StaticColour := clWhite;
    aMemo.Color := clWhite;
    PostMessage(Handle, WM_SCRUNCH, 0, 0);
  end;
end;

procedure TfrmPreview.btnDebugClick(Sender: TObject);
begin
{$IFDEF DEBUG}
  FLetter.Dump;
{$ENDIF}
end;

procedure TfrmPreview.IndentWidthClick(Sender: TObject);
var
  dlgIndentWidth: TdlgIndentWidth;
  aMemo : TPDMemo;
  element : TElement;
begin
  if pumMemo.PopUpComponent is TPDMemo then
  begin
    dlgIndentWidth := TdlgIndentWidth.Create(Self);
    aMemo := TPDMemo(pumMemo.PopUpComponent);
    try
      element := aMemo.Element.Clone;
      try
      dlgIndentWidth.element := element;
      if dlgIndentWidth.ShowModal = mrOK then
        aMemo.Element.Assign(element);
      finally
        element.Free;
      end;
    finally
      dlgIndentWidth.Free;
    end;
    aMemo.StaticColour := clWhite;
    aMemo.Color := clWhite;
  end;
end;

procedure TfrmPreview.FixLeftWidth(aMemo: TPDMemo);
begin
  with aMemo.Element do
  case Column of
  { Column zero means unconditionally full width }
  0 : begin
        Left := 0;
        Width := 0;
      end;
  1 : begin
        Left := 0;
         if (Width <> Parent.TabStop1Pixels) and (Width <> 0) then
           PostMessage(Handle, WM_WIDTHCHANGE, aMemo.Element.Number, 0);
      end;
  2 : begin
        Left := Parent.TabStop1Pixels;
        if (Width <> Parent.TabStop2Pixels) and (Width <> 0) then
           PostMessage(Handle, WM_WIDTHCHANGE, aMemo.Element.Number, 0);
      end;
  3 : begin
        Left := Parent.TabStop2Pixels;
        if Width <> 0 then
           PostMessage(Handle, WM_WIDTHCHANGE, aMemo.Element.Number, 0);
      end;
  end;  { case }
end;

procedure TfrmPreview.Idler(Sender: TObject; var Done: Boolean);
var
  i : integer;
begin
  { The colour of memos which are being dragged or have popped up a menu
    are changed to clInfoBk to help the user identify which memo is being
    used.  However, if a user aborts the drag or hits escape to cancel the
    pop-up, we can leave coloured memos lying around.  By attaching this
    code to the Application.OnIdle event, we can wipe out any spurious
    colours. }
{$IFDEF DEBUG}
  Trace('Idler');
{$ENDIF}
  for i := 0 to Pred(ComponentCount) do
    if Components[i] is TPDMemo then
      if TPDMemo(Components[i]).Color = clInfoBk then
        TPDMemo(Components[i]).Color := TPDMemo(Components[i]).StaticColour;
end;

procedure TfrmPreview.UseTabStop11Click(Sender: TObject);
var
  aMemo : TPDMemo;
  sTemp : string;
begin
  if pumMemo.PopUpComponent is TPDMemo then
  begin
    aMemo := TPDMemo(pumMemo.PopUpComponent);
    aMemo.Element.Column := 1;
    aMemo.Element.UsesTab := '1';
    aMemo.Element.Alignment := taLeftJustify;
    aMemo.StaticColour := clAqua;
    aMemo.Color := clAqua;
    FixLeftWidth(aMemo);
    sTemp := aMemo.Lines.Text;
    aMemo.MoveTo(0, aMemo.Top, aMemo.Width, false);
    aMemo.Lines.Text := sTemp;
    PostMessage(Handle, WM_SCRUNCH, 0, 0);
  end;
end;

procedure TfrmPreview.WMWidthChange(var Message: TMessage);
var
  dlgConfirmWidth : TdlgConfirmWidth;
begin
  { An element has been moved into another column and it has a
    width incompatible with that column.  Pop up dialogue and
    ask if they want to keep current width or accept new column width. }
  dlgConfirmWidth := TdlgConfirmWidth.Create(Self);
  try
    dlgConfirmWidth.Element := FLetter.Elements.ElementByNumber[Message.wParam];
    dlgConfirmWidth.ShowModal;
  finally
    dlgConfirmWidth.Free;
  end;
  Message.Result := 1;
end;

end.
