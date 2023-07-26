(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Ad-Hoc Addresses.

VSS Info:
$Header: /CCSCommon/CSMaintAdHoc.pas 1     4/07/:2 12:37 Janiner $
$History: CSMaintAdHoc.pas $
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 4/07/:2    Time: 12:37
 * Created in $/CCSCommon
 * Ad hoc address look up and maintenance.
 *
*******************************************************************************)
unit CSMaintAdHoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSMaintAdHocFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    NameEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PostCodeEdit: TEdit;
    FlashTimer: TTimer;
    FlashDelivTimer: TTimer;
    NotesBitBtn: TBitBtn;
    DelivNotesBitBtn: TBitBtn;
    qryZero: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure DelivNotesBitBtnClick(Sender: TObject);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure FlashDelivTimerTimer(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    bDelivNotesFlash, bNotesFlash: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function GetDbKey: Integer;
  public
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  CSMaintAdHocFrm: TCSMaintAdHocFrm;

implementation

uses CSLUAdHoc, CSDBMemo, CSDelivNotes, CSImages, ComObj, ActiveX;

{$R *.DFM}

procedure TCSMaintAdHocFrm.FormActivate(Sender: TObject);
begin
  {Create the delivery narrative form}
  CSDelivNotesFrm := TCSDelivNotesFrm.Create(Self);
  CSDelivNotesFrm.bAllow_Upd := True;
  {Create the memo form}
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  CSDBMemoFrm.bAllow_Upd := True;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Ad-Hoc Address';
  if sFuncMode = 'C' then
    Caption := 'Change an Ad-Hoc Address';
  if sFuncMode = 'D' then
    Caption := 'Delete an Ad-Hoc Address';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    NameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PostCodeEdit.Text := '';
  end
  else
  begin
    with CSLUAdHocFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Ad_Hoc_Address').AsInteger;
      NameEdit.Text := FieldByName('Name').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      CSDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      CSDelivNotesFrm.LoadMemoData(FieldByName('Delivery_Narrative').AsInteger);
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckNotes(Self);
  CheckOK(Self);
end;

procedure TCSMaintAdHocFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '');
end;

procedure TCSMaintAdHocFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintAdHocFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintAdHocFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    CSDBMemoFrm.UpdMemoData(Self);
    CSDelivNotesFrm.UpdMemoData(Self);
    if sFuncMode = 'A' then
      iCode := GetDbKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Ad_Hoc_Address').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      if CSDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := CSDelivNotesFrm.iNarr;
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    with DelSQL do
    begin
      ParamByName('Ad_Hoc_Address').AsInteger := iCode;
      ExecSQL;
    end;
    // end;
    CSDBMemoFrm.DelMemoData(Self);
    CSDelivNotesFrm.DelMemoData(Self);
  end;
end;

procedure TCSMaintAdHocFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintAdHocFrm.DelivNotesBitBtnClick(Sender: TObject);
begin
  CSDelivNotesFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDelivNotesFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintAdHocFrm.NotesBitBtnClick(Sender: TObject);
begin
  CSDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDBMemoFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintAdHocFrm.CheckNotes(Sender: TObject);
begin
  if CSDBMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  end;
  if CSDelivNotesFrm.CheckNotes(Self) then
  begin
    FlashDelivTimer.Enabled := True;
    DelivNotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashDelivTimer.Enabled := False;
    DelivNotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TCSMaintAdHocFrm.FlashDelivTimerTimer(Sender: TObject);
begin
  if bDelivNotesFlash then
    DelivNotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    DelivNotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  bDelivNotesFlash := (not (bDelivNotesFlash));
end;

procedure TCSMaintAdHocFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TCSMaintAdHocFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CSDBMemoFrm.Free;
  CSDelivNotesFrm.Free;
end;

function TCSMaintAdHocFrm.GetDbKey: Integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Ad_Hoc_Address').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TCSMaintAdHocFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Ad_Hoc_Address ' +
            '(Ad_Hoc_Address,Name,Building_No_Name,Street,' +
            'Locale,Town,PostCode,Narrative,Delivery_Narrative) ' +
            'VALUES(0, '' '', NULL, '''', NULL, '''', '''',' +
            'NULL, NULL)');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TCSMaintAdHocFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Ad_Hoc_Address WHERE Ad_Hoc_Address=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.

