(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Notes/Memo form.

VSS Info:
$Header: /PBL D5/PBDBMemo.pas 4     12/07/02 15:58 Andrewh $
$History: PBDBMemo.pas $
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 12/07/02   Time: 15:58
 * Updated in $/PBL D5
 * Add new NOTES and ENQUIRY mode to program.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 2/05/:1    Time: 12:49
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 31/01/:0   Time: 13:04
 * Updated in $/PBL D5
 * New TNarrative object to centralise all accesses to the Narrative_Line
 * table.  Also improved SQL to allocate next key value.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBDBMemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, DB, Buttons;

type
  TPBDBMemoFrm = class(TForm)
    DispMemo: TMemo;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    DataMemo: TMemo;
    ClearBitBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure LoadMemoData(NarrNo: Integer);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UpdMemoData(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function CheckNotes(Sender: TObject): ByteBool;
    procedure ClearBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bAllow_Upd: ByteBool;
    iNarr: Integer;
    bMemoUpd: ByteBool;
    procedure DelMemoData(Sender: TObject);
  end;

var
  PBDBMemoFrm: TPBDBMemoFrm;

implementation

uses PBNarrativeDM, PBDatabase;

{$R *.DFM}

procedure TPBDBMemoFrm.FormActivate(Sender: TObject);
begin
  bMemoUpd := False ;
  If dmBroker.iAccCtrl = 3 then
        bAllow_Upd := False ;
  if bAllow_Upd then
  begin
    DispMemo.ReadOnly := False;
    OKBitBtn.Visible := True;
    ClearBitBtn.Visible := True;
    CancelBitBtn.Visible := True;
    CloseBitBtn.Visible := False;
  end
  else
  begin
    DispMemo.ReadOnly := True;
    OKBitBtn.Visible := False;
    ClearBitBtn.Visible := False;
    CancelBitBtn.Visible := False;
    CloseBitBtn.Visible := True;
  end;
  {Reset the display memo to the data memo};
  DispMemo.Text := DataMemo.Text;
end;

procedure TPBDBMemoFrm.LoadMemoData(NarrNo: Integer);
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

procedure TPBDBMemoFrm.OKBitBtnClick(Sender: TObject);
begin
  DataMemo.Text := DispMemo.Text;
  bMemoUpd := True;
end;

procedure TPBDBMemoFrm.UpdMemoData(Sender: TObject);
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
  if DispMemo.Lines.Count = 0 then
    iNarr := 0;
end;

procedure TPBDBMemoFrm.FormCreate(Sender: TObject);
begin
  iNarr := 0;
end;

function TPBDBMemoFrm.CheckNotes(Sender: TObject): ByteBool;
begin
  Result := DataMemo.Text <> '';
end;

procedure TPBDBMemoFrm.ClearBitBtnClick(Sender: TObject);
begin
  DispMemo.Lines.Clear;
end;

procedure TPBDBMemoFrm.DelMemoData(Sender: TObject);
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


end.
