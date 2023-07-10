(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Delivery Notes Form

VSS Info:
$Header: /PBL D5/PBDelivNotes.pas 3     12/07/02 15:58 Andrewh $
$History: PBDelivNotes.pas $
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 12/07/02   Time: 15:58
 * Updated in $/PBL D5
 * Add new NOTES and ENQUIRY mode to program.
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
unit PBDelivNotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, DB, Buttons, DBTables;

type
  TPBDelivNotesFrm = class(TForm)
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
  public
    { Public declarations }
    bAllow_Upd: ByteBool ;
    iNarr: Integer ;
    bMemoUpd: ByteBool ;
  end;

var
  PBDelivNotesFrm: TPBDelivNotesFrm;

implementation

uses PBNarrativeDM, PBDatabase;

{$R *.DFM}

procedure TPBDelivNotesFrm.FormActivate(Sender: TObject);
begin
  bMemoUpd := False ;
  If dmBroker.iAccCtrl = 3 then
        bAllow_Upd := False ;
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

procedure TPBDelivNotesFrm.LoadMemoData(NarrNo: Integer);
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
      DataMemo.Text := Narrative.Data;
      DispMemo.Text := Narrative.Data;
    finally
      Narrative.Free;
    end;
  end;
end;

procedure TPBDelivNotesFrm.OkBitBtnClick(Sender: TObject);
begin
DataMemo.Text := DispMemo.Text ;
bMemoUpd := True ;
end;

procedure TPBDelivNotesFrm.UpdMemoData(Sender: TObject);
var
  Narrative: TNarrative;
begin
  {If OK wasn't pressed it hasn't been updated};
  if (not bMemoUpd) then Exit;
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarr;
    Narrative.Data := DataMemo.Text;
    Narrative.SaveToDB;
    iNarr := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
  if DataMemo.Lines.Count = 0 then
    iNarr := 0;
end;

procedure TPBDelivNotesFrm.DelMemoData(Sender: TObject);
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

procedure TPBDelivNotesFrm.FormCreate(Sender: TObject);
begin
iNarr := 0 ;
end;

function TPBDelivNotesFrm.CheckNotes(Sender: TObject): ByteBool ;
begin
Result := DataMemo.Text <> '' ;
end;

procedure TPBDelivNotesFrm.ClearBitBtnClick(Sender: TObject);
begin
DispMemo.Lines.Clear ;
end;

end.
