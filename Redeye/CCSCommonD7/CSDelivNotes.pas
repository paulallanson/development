(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Delivery Notes Form

VSS Info:
$Header: /CCSCommon/CSDelivNotes.pas 1     10/01/:1 12:57 Paul $
$History: CSDelivNotes.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 12:57
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 31/10/:0   Time: 15:37
 * Updated in $/PBL D5
 * Changed to update the Narrative_line file correctly
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSDelivNotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, DB, Buttons;

type
  TCSDelivNotesFrm = class(TForm)
    DispMemo: TMemo;
    CancelBitBtn: TBitBtn;
    OkBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    DataMemo: TMemo;
    ClearBitBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure LoadMemoData(NarrNo: Integer);
    procedure OkBitBtnClick(Sender: TObject);
    procedure UpdMemoData(Sender: TObject);
    procedure DelMemoData(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function CheckNotes(Sender: TObject): ByteBool ;
    procedure ClearBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    bMemoUpd: ByteBool ;
  public
    { Public declarations }
    bAllow_Upd: ByteBool ;
    iNarr: Integer ;
  end;

var
  CSDelivNotesFrm: TCSDelivNotesFrm;

implementation

uses CSNarrativeDM;

{$R *.DFM}

procedure TCSDelivNotesFrm.FormActivate(Sender: TObject);
begin
If bAllow_Upd then
   begin
   DispMemo.ReadOnly := False ;
   OKBitBtn.Visible := True ;
   ClearBitBtn.Visible := True ;
   CancelBitBtn.Visible := True ;
   CloseBitBtn.Visible := False ;
   end
else
   begin
   DispMemo.ReadOnly := True ;
   OKBitBtn.Visible := False ;
   ClearBitBtn.Visible := False ;
   CancelBitBtn.Visible := False ;
   CloseBitBtn.Visible := True ;
   end;
{Reset the display memo to the data memo} ;
DispMemo.Text := DataMemo.Text ;
end;

procedure TCSDelivNotesFrm.LoadMemoData(NarrNo: Integer);
var
  Narrative: TNarrative;
begin
  {Remember the narrative number};
  iNarr := NarrNo;
  {Set the flag to say OK button not pressed yet};
  bMemoUpd := False;
  {Put the file data into the memo};
  DispMemo.Clear;
  DataMemo.Clear;
  if NarrNo <> 0 then
  begin
    Narrative := TNarrative.Create;
    try
      Narrative.DbKey := NarrNo;
      Narrative.LoadFromDB;
      DataMemo.Text := Narrative.DataInfo;
      DispMemo.Text := Narrative.DataInfo;
    finally
      Narrative.Free;
    end;
  end;
end;

procedure TCSDelivNotesFrm.OkBitBtnClick(Sender: TObject);
begin
DataMemo.Text := DispMemo.Text ;
bMemoUpd := True ;
end;

procedure TCSDelivNotesFrm.UpdMemoData(Sender: TObject);
var
  Narrative: TNarrative;
begin
  {If OK wasn't pressed it hasn't been updated};
  if (not bMemoUpd) then Exit;
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarr;
    Narrative.DataInfo := DataMemo.Text;
    Narrative.SaveToDB;
    iNarr := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
  if DataMemo.Lines.Count = 0 then
    iNarr := 0;
end;

procedure TCSDelivNotesFrm.DelMemoData(Sender: TObject);
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarr;
    Narrative.Delete;
  finally
    Narrative.Free;
  end;
end;

procedure TCSDelivNotesFrm.FormCreate(Sender: TObject);
begin
iNarr := 0 ;
end;

function TCSDelivNotesFrm.CheckNotes(Sender: TObject): ByteBool ;
begin
Result := DataMemo.Text <> '' ;
end;

procedure TCSDelivNotesFrm.ClearBitBtnClick(Sender: TObject);
begin
DispMemo.Lines.Clear ;
end;

end.
