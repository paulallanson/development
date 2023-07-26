unit wtMaintSpecialInstruction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintSpecialInstruction = class(TForm)
    DataMemo: TMemo;
    DispMemo: TMemo;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    ClearBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    qryZero: TFDQuery;
    Label1: TLabel;
    edtDescription: TEdit;
    DelSQL: TFDQuery;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LoadMemoData(NarrNo: Integer);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UpdMemoData(Sender: TObject);
    function CheckNotes(Sender: TObject): ByteBool;
    procedure ClearBitBtnClick(Sender: TObject);
    procedure DelMemoData(Sender: TObject);
    procedure DispMemoChange(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure edtDescriptionExit(Sender: TObject);
  private
    bMemoUpd: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    bAllow_Upd: ByteBool;
    iNarr, icode: Integer;
    sFuncMode: string[1];
    sDescription: string;
  end;

var
  frmWTMaintSpecialInstruction           : TfrmWTMaintSpecialInstruction;

implementation

uses ComObj, ActiveX, wtNotesDM;

{$R *.DFM}

procedure TfrmWTMaintSpecialInstruction.EnableOK(Sender: TObject);
begin
  OKbitbtn.enabled := (DispMemo.text <> '') and (edtDescription.text <> '');
end;

procedure TfrmWTMaintSpecialInstruction.FormActivate(Sender: TObject);
begin
  if bAllow_Upd = True then
  begin
    DispMemo.ReadOnly := False;
    OKBitBtn.Visible := True;
    ClearBitBtn.Visible := True;
    CancelBitBtn.Visible := True;

  end
  else
    {Reset the display memo to the data memo}
    DispMemo.Text := DataMemo.Text;
  if sFuncMode = 'A' then
    begin
      iNarr := 0;
      edtDescription.Text := '';
    end;
  LoadMemoData(inarr);
  sDescription := edtDescription.Text;
end;

procedure TfrmWTMaintSpecialInstruction.LoadMemoData(NarrNo: Integer);
var
  Narrative: TNotes;
begin
  {Set the flag to say OK button not pressed yet}
  bMemoUpd := False;
  {Put the file data into the memo}
  DispMemo.Clear;
  DataMemo.Clear;
  if NarrNo <> 0 then
  begin
    Narrative := TNotes.Create;
    try
      Narrative.DbKey := NarrNo;
      Narrative.LoadFromDB;
      DataMemo.Text := Narrative.DataInfo;
      DispMemo.Text := Narrative.DataInfo;
    finally
      Narrative.Free;
    end;
  end;;
end;

procedure TfrmWTMaintSpecialInstruction.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    UpdMemoData(Self);
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Narrative').AsInteger := iNarr;
      ParamByName('Special_instruction').AsInteger := iCode;
      ParamByName('Description').AsString := edtDescription.Text;
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    UpdMemoData(Self);
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    with DelSQL do
    begin
      Close;
      ParamByName('Special_Instruction').AsInteger := icode;
      ExecSQL;
    end;
    DelMemoData(Self);
  end;
end;

procedure TfrmWTMaintSpecialInstruction.UpdMemoData(Sender: TObject);
var
  Narrative: TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarr;
    Narrative.DataInfo := DispMemo.Text;
    Narrative.SaveToDB;
    iNarr := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
  if DispMemo.Lines.Count = 0 then
    iNarr := 0;
end;

function TfrmWTMaintSpecialInstruction.CheckNotes(Sender: TObject): ByteBool;
begin
  Result := DataMemo.Text <> '';
end;

procedure TfrmWTMaintSpecialInstruction.ClearBitBtnClick(Sender: TObject);
begin
  DispMemo.Lines.Clear;
  edtDescription.clear;
end;

procedure TfrmWTMaintSpecialInstruction.DelMemoData(Sender: TObject);
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

procedure TfrmWTMaintSpecialInstruction.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Special_Instruction ' +
            'VALUES(0, ' + IntToStr(iNarr) + ', ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintSpecialInstruction.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Special_Instruction Where Special_Instruction=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TfrmWTMaintSpecialInstruction.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByname('Narrative').AsInteger := iNarr;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Special_Instruction').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintSpecialInstruction.DispMemoChange(Sender: TObject);
begin
  if sDescription = '' then
    edtDescription.Text := dispMemo.Text;
  enableOK(self);
end;

procedure TfrmWTMaintSpecialInstruction.edtDescriptionChange(
  Sender: TObject);
begin
  enableOK(self);
end;

procedure TfrmWTMaintSpecialInstruction.edtDescriptionExit(
  Sender: TObject);
begin
  sDescription := (sender as TEdit).text;
end;

end.

