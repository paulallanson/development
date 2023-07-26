unit PBMaintAdHoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, PBDelivNotes, PBDBMemo,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintAdHocFrm = class(TForm)
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
    qryGetAdhoc: TFDQuery;
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
    PBAdHocDelivNotesFrm: TPBDelivNotesFrm;
    PBAdHocDBMemoFrm: TPBDBMemoFrm;
    procedure AddZero;
    procedure DeleteZero;
    function GetDbKey: Integer;
  public
    sFuncMode: string[1];
    iAdHoc: integer;
    iCode: Integer;
  end;

var
  PBMaintAdHocFrm: TPBMaintAdHocFrm;

implementation

uses PBLUAdHoc, PBImages, ComObj, ActiveX,
  PBDatabase, pbMainMenu, CCSPrint;

{$R *.DFM}

procedure TPBMaintAdHocFrm.FormActivate(Sender: TObject);
begin
  {Create the delivery narrative form}
  PBAdHocDelivNotesFrm := TPBDelivNotesFrm.Create(Self);
  PBAdHocDelivNotesFrm.bAllow_Upd := True;
  {Create the memo form}
  PBAdHocDBMemoFrm := TPBDBMemoFrm.Create(Self);
  PBAdHocDBMemoFrm.bAllow_Upd := True;
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
    with qryGetAdhoc do
    begin
      close;
      parambyname('Ad_Hoc_Address').asinteger := iAdhoc;
      open;
      iCode := FieldByName('Ad_Hoc_Address').AsInteger;
      NameEdit.Text := FieldByName('Name').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      PBAdHocDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      PBAdHocDelivNotesFrm.LoadMemoData(FieldByName('Delivery_Narrative').AsInteger);
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  PrintBitBtn.Visible := (sFuncMode= 'C');
  CheckNotes(Self);
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuAdHoc',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintAdHocFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '');
end;

procedure TPBMaintAdHocFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintAdHocFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintAdHocFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    PBAdHocDBMemoFrm.UpdMemoData(Self);
    PBAdHocDelivNotesFrm.UpdMemoData(Self);
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
      if PBLUAdHocFrm.Customer = 0 then
        ParamByName('Customer').clear
      else
        ParamByName('Customer').Asinteger := PBLUAdHocFrm.Customer;
      if PBAdHocDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBAdHocDBMemoFrm.iNarr;
      if PBAdHocDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := PBAdHocDelivNotesFrm.iNarr;
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
    PBAdHocDBMemoFrm.DelMemoData(Self);
    PBAdHocDelivNotesFrm.DelMemoData(Self);
  end;
end;

procedure TPBMaintAdHocFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintAdHocFrm.DelivNotesBitBtnClick(Sender: TObject);
begin
  PBAdHocDelivNotesFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBAdHocDelivNotesFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBAdHocDelivNotesFrm.bMemoUpd) then
        begin
        PBAdHocDelivNotesFrm.UpdMemoData(Self) ;
        With UpdDelivNotesOnlySQL do
                begin
                Close ;
                ParamByName('Ad_Hoc_Address').AsInteger := iCode;
                if PBAdHocDelivNotesFrm.iNarr = 0 then
                        ParamByName('Delivery_Narrative').Clear
                else
                        ParamByName('Delivery_Narrative').AsInteger := PBAdHocDelivNotesFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintAdHocFrm.NotesBitBtnClick(Sender: TObject);
begin
  PBAdHocDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBAdHocDBMemoFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBAdHocDBMemoFrm.bMemoUpd) then
        begin
        PBAdHocDBMemoFrm.UpdMemoData(Self) ;
        With UpdNotesOnlySQL do
                begin
                Close ;
                ParamByName('Ad_Hoc_Address').AsInteger := iCode;
                if PBAdHocDBMemoFrm.iNarr = 0 then
                        ParamByName('Narrative').Clear
                else
                        ParamByName('Narrative').AsInteger := PBAdHocDBMemoFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintAdHocFrm.CheckNotes(Sender: TObject);
begin
  if PBAdHocDBMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
  if PBAdHocDelivNotesFrm.CheckNotes(Self) then
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

procedure TPBMaintAdHocFrm.FlashDelivTimerTimer(Sender: TObject);
begin
  if bDelivNotesFlash then
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bDelivNotesFlash := (not (bDelivNotesFlash));
end;

procedure TPBMaintAdHocFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintAdHocFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBAdHocDBMemoFrm.Free;
  PBAdHocDelivNotesFrm.Free;
end;

function TPBMaintAdHocFrm.GetDbKey: Integer;
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

procedure TPBMaintAdHocFrm.AddZero;
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

procedure TPBMaintAdHocFrm.DeleteZero;
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

procedure TPBMaintAdHocFrm.PrintBitBtnClick(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
    PrinterSettings := TPrinterSettings.Create;
    if SetUpPrinter(PrinterSettings) then
        PBMaintAdHocFrm.print;
      PrinterSettings.Free;
end;

end.

