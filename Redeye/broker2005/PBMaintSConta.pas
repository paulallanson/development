unit PBMaintSConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSContaFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SuppNameEdit: TEdit;
    NameEdit: TEdit;
    GetBranchNameSQL: TFDQuery;
    Label4: TLabel;
    TypeDBLCB: TDBLookupComboBox;
    GetContTypesSQL: TFDQuery;
    ContTypesSRC: TDataSource;
    PhoneEdit: TEdit;
    EMailEdit: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    SalutationEdit: TEdit;
    Label8: TLabel;
    QryZero: TFDQuery;
    Label5: TLabel;
    FaxEdit: TEdit;
    MobileEdit: TEdit;
    Label9: TLabel;
    ContTypeMaintBitBtn: TBitBtn;
    Label10: TLabel;
    FileTypDBLCB: TDBLookupComboBox;
    GetFileTypeSQL: TFDQuery;
    FileTypSRC: TDataSource;
    NotesBitBtn: TBitBtn;
    FlashTimer: TTimer;
    UpdNotesOnlySQL: TFDQuery;
    qryGetContact: TFDQuery;
    dblkpBranchName: TDBLookupComboBox;
    qryBranch: TFDQuery;
    dtsBranch: TDataSource;
    chkbxActive: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure TypeDBLCBClick(Sender: TObject);
    procedure ContTypeMaintBitBtnClick(Sender: TObject);
    procedure FileTypDBLCBClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    bNotesFlash : ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextDbKey : integer;  
  public
    sFuncMode: string[1];
    iCode, iSupp, iBranch: Integer;
    sSuppName, sBranchName: string;
  end;

var
  PBMaintSContaFrm: TPBMaintSContaFrm;

implementation

uses UITypes, PBLUSupp, PBLUSConta, ComObj, ActiveX, PBMaintGroups, PBDBMemo,
  PBImages, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintSContaFrm.FormActivate(Sender: TObject);
begin
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  PBDBMemoFrm.bAllow_Upd := True;
  {Re-activate the list SQL}
  GetContTypesSQL.Close;
  GetContTypesSQL.Open;

  qryBranch.close;
  qryBranch.ParamByName('Supplier').asinteger := iSupp;
  qryBranch.open;

  GetFileTypeSQL.Close;
  GetFileTypeSQL.Open;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new contact';
  if sFuncMode = 'C' then
    Caption := 'Change a contact';
  if sFuncMode = 'D' then
    Caption := 'Delete a contact';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    NameEdit.Text := '';
    SalutationEdit.Text := '';
    TypeDBLCB.KeyValue := 0;
    FileTypDBLCB.KeyValue := 0;
    ChkBxActive.Checked := True;
    if qryBranch.recordcount = 1 then
      dblkpBranchName.KeyValue := qryBranch.fieldbyname('Branch_no').asinteger
    else
      dblkpBranchName.KeyValue := 0;
    dblkpBranchName.setfocus;
    end
  else
  begin
    with qryGetContact do
    begin
      close;
      parambyname('Supplier').asinteger := iSupp;
      parambyname('Branch_no').asinteger := iBranch;
      parambyname('Contact_no').asinteger := iCode;
      open;
//      iCode := FieldByName('Contact_No').AsInteger;
      dblkpBranchName.keyvalue := iBranch;
      dblkpBranchName.enabled := false;
      NameEdit.Text := FieldByName('Name').AsString;
      PhoneEdit.Text := FieldByName('Phone').AsString;
      EmailEdit.Text := FieldByName('Email').AsString;
      SalutationEdit.Text := FieldByName('Salutation').AsString;
      PBDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      TypeDBLCB.KeyValue := FieldByName('Contact_Type').AsInteger;
      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      if fieldByName('ExportFilter').AsString = '' then
        FileTypDBLCB.KeyValue := 0
      else
        FileTypDBLCB.KeyValue := FieldByName('ExportFilter').AsString;
      MobileEdit.Text := FieldByName('Mobile_No').AsString;
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
    end;
    if sFuncMode <> 'D' then
      NameEdit.SetFocus;
  end;
  SuppNameEdit.Text := sSuppName;
//  BranchNameEdit.Text := sBranchName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckNotes(Self);
  CheckOK(Self);
//  dmBroker.ScreenAccessControl(Self,'mnuSuppliers',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintSContaFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (TypeDBLCB.KeyValue <> 0);
end;

procedure TPBMaintSContaFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintSContaFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSContaFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextDbKey;
    PBDBMemoFrm.UpdMemoData(Self);
    with UpdSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Email').AsString := EmailEdit.Text + '';
      ParamByName('Salutation').AsString := SalutationEdit.Text + '';
      ParamByName('Contact_Type').AsInteger := TypeDBLCB.KeyValue;
      if (FileTypDBLCB.text = '') then
        ParamByName('ExportFilter').Clear
      else
        ParamByName('ExportFilter').AsString := FileTypDBLCB.KeyValue;
      ParamByName('Fax_Number').AsString := FaxEdit.Text;
      ParamByName('Mobile_No').AsString := MobileEdit.Text;
      if PBDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
      if ChkBxActive.checked then
        ParamByName('inactive').AsString := 'N'
      else
        ParamByName('inactive').AsString := 'Y';
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
    PBDBMemoFrm.DelMemoData(Self);
    with DelSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iCode;
      ExecSQL;
    end;
  end;

  {If replicating Supplier details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(4, iSupp, iBranch, iCode, sFuncMode);
    end;
end;

procedure TPBMaintSContaFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSContaFrm.TypeDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSContaFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Supplier_BranchContacts ' +
            '(Supplier,Branch_No,Contact_No,Name,Contact_Type) ' +
            'VALUES(' + IntToStr(iSupp) + ',' + IntToStr(iBranch) +
            ',0,''Dummy'',' + IntToStr(TypeDBLCB.KeyValue) + ')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintSContaFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Supplier_BranchContacts ' +
            'Where Supplier=' + IntToStr(iSupp) + ' and Branch_No=' +
            IntToStr(iBranch) + ' and Contact_No=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintSContaFrm.GetNextDbKey: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('Guid').AsString := GuidToString(aGuid);
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Branch_no').AsInteger := iBranch;
      ParamByName('Contact_Type').AsInteger := TypeDBLCB.KeyValue;
      if (FileTypDBLCB.text = '') then
        ParamByName('ExportFilter').Clear
      else
        ParamByName('ExportFilter').AsString := FileTypDBLCB.KeyValue;
      if PBDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('Guid').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Contact_No').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintSContaFrm.ContTypeMaintBitBtnClick(Sender: TObject);
begin
  PBMaintGroupsFrm := TPBMaintGroupsFrm.Create(self) ;
    try
      PBMaintGroupsFrm.iGroupselect := 3;
      PBMaintGroupsFrm.ShowModal ;
    Finally;
    PBMaintGroupsFrm.Free ;
    end;
  GetContTypesSQL.Active := False;
  GetContTypesSQL.Active := True;
end;

procedure TPBMaintSContaFrm.FileTypDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSContaFrm.NotesBitBtnClick(Sender: TObject);
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
                ParamByName('Supplier').AsInteger := iSupp;
                ParamByName('Branch_No').AsInteger := iBranch;
                ParamByName('Contact_No').AsInteger := iCode;
                if PBDBMemoFrm.iNarr = 0 then
                        ParamByName('Narrative').Clear
                else
                        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        PBMaintSContaFrm.ModalResult := mrOK ;
        end;
end;

procedure TPBMaintSContaFrm.CheckNotes(Sender: TObject);
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
end;

procedure TPBMaintSContaFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintSContaFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
PBDBMemoFrm.Free;
end;

end.
