unit wtDBMemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, DB, Buttons, DBTables;

type
  TfrmwtDBMemo = class(TForm)
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
  frmwtDBMemo: TfrmwtDBMemo;

implementation

uses wtNotesDM, wtDatabase;

{$R *.DFM}

procedure TfrmwtDBMemo.FormActivate(Sender: TObject);
begin
  bMemoUpd := False ;
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

procedure TfrmwtDBMemo.LoadMemoData(NarrNo: Integer);
var
  Narrative: TNotes;
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
    Narrative := TNotes.Create;
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

procedure TfrmwtDBMemo.OKBitBtnClick(Sender: TObject);
begin
  DataMemo.Text := DispMemo.Text;
  bMemoUpd := True;
end;

procedure TfrmwtDBMemo.UpdMemoData(Sender: TObject);
var
  Narrative: TNotes;
begin
  {If OK wasn't pressed it hasn't been updated};
  if (not bMemoUpd) then Exit;
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarr;
    Narrative.Data := DataMemo.Text;
    Narrative.SaveToDB;
    iNarr := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
  if DispMemo.Lines.Count = 0 then
    iNarr := 0;
end;

procedure TfrmwtDBMemo.FormCreate(Sender: TObject);
begin
  iNarr := 0;
end;

function TfrmwtDBMemo.CheckNotes(Sender: TObject): ByteBool;
begin
  Result := DataMemo.Text <> '';
end;

procedure TfrmwtDBMemo.ClearBitBtnClick(Sender: TObject);
begin
  DispMemo.Lines.Clear;
end;

procedure TfrmwtDBMemo.DelMemoData(Sender: TObject);
var
  Narrative: TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarr;
    Narrative.Delete;
  finally
    Narrative.Free;
  end;
end;


end.
