(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Special Instructions.

VSS Info:
$Header: /PBL D5/PBMaintSpecIns.pas 12    20/06/03 9:53 Andrewh $
$History: PBMaintSpecIns.pas $
 * 
 * *****************  Version 12  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 21/03/:0   Time: 12:51
 * Updated in $/PBL D5
 * Cleared the NarrativeEdit field when creating a new Special Instruction
 * record.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 21/03/:0   Time: 12:32
 * Updated in $/PBL D5
 * Changed to allow maintenance of short special instructions
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 9/02/:0    Time: 10:22
 * Updated in $/PBL D5
 * Use new insert method and GUIDs to ensure unique keys when adding. 

*******************************************************************************)
unit PBMaintSpecIns;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSpecInsFrm = class(TForm)
    DataMemo: TMemo;
    DispMemo: TMemo;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    ClearBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    qryZero: TFDQuery;
    Label1: TLabel;
    NarrativeEdit: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure LoadMemoData(NarrNo: Integer);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UpdMemoData(Sender: TObject);
    function CheckNotes(Sender: TObject): ByteBool;
    procedure ClearBitBtnClick(Sender: TObject);
    procedure DelMemoData(Sender: TObject);
  private
    bMemoUpd: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;    
  public
    bAllow_Upd: ByteBool;
    iNarr, icode: Integer;
    sFuncMode: string[1];
  end;

var
  PBMaintSpecInsFrm           : TPBMaintSpecInsFrm;

implementation

uses PBLUSpecIns, PBNarrativeDM, ComObj, ActiveX, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintSpecInsFrm.FormActivate(Sender: TObject);
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
      NarrativeEdit.Text := '';
    end;

  LoadMemoData(inarr);
  dmBroker.ScreenAccessControl(Self,'mnuSpecialInst',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintSpecInsFrm.LoadMemoData(NarrNo: Integer);
var
  Narrative: TNarrative;
begin
  {Set the flag to say OK button not pressed yet}
  bMemoUpd := False;
  {Put the file data into the memo}
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
  end;;
end;

procedure TPBMaintSpecInsFrm.OKBitBtnClick(Sender: TObject);
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
      ParamByName('Description').AsString := NarrativeEdit.Text;
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

procedure TPBMaintSpecInsFrm.UpdMemoData(Sender: TObject);
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
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

function TPBMaintSpecInsFrm.CheckNotes(Sender: TObject): ByteBool;
begin
  Result := DataMemo.Text <> '';
end;

procedure TPBMaintSpecInsFrm.ClearBitBtnClick(Sender: TObject);
begin
  DispMemo.Lines.Clear;
end;

procedure TPBMaintSpecInsFrm.DelMemoData(Sender: TObject);
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

procedure TPBMaintSpecInsFrm.AddZero;
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

procedure TPBMaintSpecInsFrm.DeleteZero;
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

function TPBMaintSpecInsFrm.GetNextKey: integer;
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

end.

