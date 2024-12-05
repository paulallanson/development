(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Notes/Memo form.

VSS Info:
$Header: /CCSCommon/CSDBMemo.pas 2     27/03/:1 10:00 Janiner $
$History: CSDBMemo.pas $
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 27/03/:1   Time: 10:00
 * Updated in $/CCSCommon
 * bug with check on line count property of data tmemo component, causes
 * new records not to be added !
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 12:57
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
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
unit CSDBMemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, DB, Buttons;

type
  TCSDBMemoFrm = class(TForm)
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
    bMemoUpd: ByteBool;
  public
    { Public declarations }
    bAllow_Upd: ByteBool;
    iNarr: Integer;
    procedure DelMemoData(Sender: TObject);
  end;

var
  CSDBMemoFrm: TCSDBMemoFrm;

implementation

uses CSNarrativeDM;

{$R *.DFM}

procedure TCSDBMemoFrm.FormActivate(Sender: TObject);
begin
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

procedure TCSDBMemoFrm.LoadMemoData(NarrNo: Integer);
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
      Narrative.FDbKey := NarrNo;
      Narrative.LoadFromDB;
      DataMemo.Text := Narrative.FDataInfo;
      DispMemo.Text := Narrative.FDataInfo;
    finally
      Narrative.Free;
    end;
  end;
end;

procedure TCSDBMemoFrm.OKBitBtnClick(Sender: TObject);
begin
  DataMemo.Text := DispMemo.Text;
  bMemoUpd := True;
end;

procedure TCSDBMemoFrm.UpdMemoData(Sender: TObject);
var
  Narrative: TNarrative;
begin
  {If OK wasn't pressed it hasn't been updated};
  if (not bMemoUpd) then Exit;
  Narrative := TNarrative.Create;
  try
    Narrative.FDbKey := iNarr;
    Narrative.FDataInfo := DataMemo.Text;
    Narrative.SaveToDB;
    iNarr := Narrative.FDbKey;
  finally
    Narrative.Free;
  end;
  if DispMemo.Lines.Count = 0 then
    iNarr := 0;
end;

procedure TCSDBMemoFrm.FormCreate(Sender: TObject);
begin
  iNarr := 0;
end;

function TCSDBMemoFrm.CheckNotes(Sender: TObject): ByteBool;
begin
  Result := DataMemo.Text <> '';
end;

procedure TCSDBMemoFrm.ClearBitBtnClick(Sender: TObject);
begin
  DispMemo.Lines.Clear;
end;

procedure TCSDBMemoFrm.DelMemoData(Sender: TObject);
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.FDbKey := iNarr;
    Narrative.Delete;
  finally
    Narrative.Free;
  end;
end;

end.
