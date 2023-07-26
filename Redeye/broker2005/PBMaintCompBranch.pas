unit PBMaintCompBranch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCompBranchFrm = class(TForm)
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
    UpdNotesOnlySQL: TFDQuery;
    UpdDelivNotesOnlySQL: TFDQuery;
    PrintBitBtn: TBitBtn;
    chkbxActive: TCheckBox;
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
    procedure PrintBitBtnClick(Sender: TObject);
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
  PBMaintCompBranchFrm: TPBMaintCompBranchFrm;

implementation

uses PBLUCompBranch, PBDBMemo, PBImages, PBDelivNotes, ComObj, ActiveX,
  PBDatabase, pbMainMenu, CCSPrint;

{$R *.DFM}

procedure TPBMaintCompBranchFrm.FormActivate(Sender: TObject);
begin
  {Create the delivery narrative form}
  PBDelivNotesFrm := TPBDelivNotesFrm.Create(Self);
  PBDelivNotesFrm.bAllow_Upd := True;
  {Create the memo form}
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  PBDBMemoFrm.bAllow_Upd := True;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Branch';
  if sFuncMode = 'C' then
    Caption := 'Change an Branch';
  if sFuncMode = 'D' then
    Caption := 'Delete an Branch';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    NameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PostCodeEdit.Text := '';
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLUCompBranchFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Branch_no').AsInteger;
      NameEdit.Text := FieldByName('Name').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      PBDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      PBDelivNotesFrm.LoadMemoData(FieldByName('Delivery_Narrative').AsInteger);
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  PrintBitBtn.Visible := (sFuncMode= 'C');
  CheckNotes(Self);
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuCompanyBranch',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintCompBranchFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '');
end;

procedure TPBMaintCompBranchFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintCompBranchFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCompBranchFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    PBDBMemoFrm.UpdMemoData(Self);
    PBDelivNotesFrm.UpdMemoData(Self);
    if sFuncMode = 'A' then
      iCode := GetDbKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Branch_no').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      if PBDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
      if PBDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := PBDelivNotesFrm.iNarr;
      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';
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
      close;
      ParamByName('Branch_no').AsInteger := iCode;
      ExecSQL;
    end;
    // end;
    PBDBMemoFrm.DelMemoData(Self);
    PBDelivNotesFrm.DelMemoData(Self);
  end;
end;

procedure TPBMaintCompBranchFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCompBranchFrm.DelivNotesBitBtnClick(Sender: TObject);
begin
  PBDelivNotesFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBDelivNotesFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBDelivNotesFrm.bMemoUpd) then
        begin
        PBDelivNotesFrm.UpdMemoData(Self) ;
        With UpdDelivNotesOnlySQL do
                begin
                Close ;
                ParamByName('Branch_no').AsInteger := iCode;
                if PBDelivNotesFrm.iNarr = 0 then
                        ParamByName('Delivery_Narrative').Clear
                else
                        ParamByName('Delivery_Narrative').AsInteger := PBDelivNotesFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintCompBranchFrm.NotesBitBtnClick(Sender: TObject);
begin
  PBDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBDBMemoFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBDBMemoFrm.bMemoUpd) then
        begin
        PBDBMemoFrm.UpdMemoData(Self) ;
        With UpdNotesOnlySQL do
                begin
                Close ;
                ParamByName('Branch_no').AsInteger := iCode;
                if PBDBMemoFrm.iNarr = 0 then
                        ParamByName('Narrative').Clear
                else
                        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintCompBranchFrm.CheckNotes(Sender: TObject);
begin
  if PBDBMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
  if PBDelivNotesFrm.CheckNotes(Self) then
  begin
    FlashDelivTimer.Enabled := True;
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashDelivTimer.Enabled := False;
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintCompBranchFrm.FlashDelivTimerTimer(Sender: TObject);
begin
  if bDelivNotesFlash then
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bDelivNotesFlash := (not (bDelivNotesFlash));
end;

procedure TPBMaintCompBranchFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintCompBranchFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBDBMemoFrm.Free;
  PBDelivNotesFrm.Free;
end;

function TPBMaintCompBranchFrm.GetDbKey: Integer;
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
      Result := FieldByName('Branch_no').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintCompBranchFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Company_Branch ' +
            '(Company,Branch_no,Name,Building_No_Name,Street,' +
            'Locale,Town,PostCode,Narrative,Delivery_Narrative) ' +
            'VALUES(1,0, '' '', NULL, '''', NULL, '''', '''',' +
            'NULL, NULL)');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCompBranchFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Company_Branch WHERE Branch_no=0 and Company = 1');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCompBranchFrm.PrintBitBtnClick(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
    PrinterSettings := TPrinterSettings.Create;
    if SetUpPrinter(PrinterSettings) then
        PBLUCompBranchFrm.print;
      PrinterSettings.Free;
end;

end.

