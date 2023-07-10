(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Supplier/Branch Contacts form.

VSS Info:
$Header: /CCSCommon/CSMaintSConta.pas 2     31/01/:1 15:06 Janiner $
$History: CSMaintSConta.pas $
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 31/01/:1   Time: 15:06
 * Updated in $/CCSCommon
 * Make changes as per PB versions re e-mail file type
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:01
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 18/10/00   Time: 10:50
 * Updated in $/PBL D5
 * Amending tab order and adding a maintain contact types bit button to
 * the form which creates instance of the MaintainGroups form.
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 17/10/00   Time: 9:51
 * Updated in $/PBL D5
 * Adding the mobile number field and allowing maintenance thereof.
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 13/10/00   Time: 12:03
 * Updated in $/PBL D5
 * Added edit field to hold fax number from the Supplier_BranchContact
 * table.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 9:53
 * Updated in $/PBL D5
 * Use new insert method and Guids to ensure new keys are unique.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintSConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls;

type
  TCSMaintSContaFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SuppNameEdit: TEdit;
    NameEdit: TEdit;
    BranchNameEdit: TEdit;
    GetBranchNameSQL: TQuery;
    Label4: TLabel;
    TypeDBLCB: TDBLookupComboBox;
    GetContTypesSQL: TQuery;
    ContTypesSRC: TDataSource;
    PhoneEdit: TEdit;
    EMailEdit: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    SalutationEdit: TEdit;
    Label8: TLabel;
    QryZero: TQuery;
    Label5: TLabel;
    FaxEdit: TEdit;
    MobileEdit: TEdit;
    Label9: TLabel;
    ContTypeMaintBitBtn: TBitBtn;
    Label10: TLabel;
    FileTypDBLCB: TDBLookupComboBox;
    GetFileTypeSQL: TQuery;
    FileTypSRC: TDataSource;
    ChkBxActive: TCheckBox;
    NotesBitBtn: TBitBtn;
    FlashTimer: TTimer;
    UpdNotesOnlySQL: TQuery;
    UpdSQL: TQuery;
    AddSQL: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure TypeDBLCBClick(Sender: TObject);
    procedure ContTypeMaintBitBtnClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
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
  CSMaintSContaFrm: TCSMaintSContaFrm;

implementation

uses CSLUSupp, CSLUSConta, ComObj, ActiveX, CSMaintGroups, CSDBMemo,
  STImages;

{$R *.DFM}

procedure TCSMaintSContaFrm.FormActivate(Sender: TObject);
begin
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  CSDBMemoFrm.bAllow_Upd := True;
  {Re-activate the list SQL}
  GetContTypesSQL.Close;
  GetContTypesSQL.Open;
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
    TypeDBLCB.KeyValue := Null;
    FileTypDBLCB.KeyValue := Null;
    ChkBxActive.Checked := True;
  end
  else
  begin
    with CSLUSContaFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Contact_No').AsInteger;
      NameEdit.Text := FieldByName('Name').AsString;
      PhoneEdit.Text := FieldByName('Phone').AsString;
      EmailEdit.Text := FieldByName('Email').AsString;
      SalutationEdit.Text := FieldByName('Salutation').AsString;
      CSDBMemoFrm.LoadMemodata(FieldByName('Narrative').AsInteger);
      TypeDBLCB.KeyValue := FieldByName('Contact_Type').AsInteger;
      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      if fieldByName('ExportFilter').AsString = Null then
        FileTypDBLCB.KeyValue := Null
      else
        FileTypDBLCB.KeyValue := FieldByName('ExportFilter').AsString;
      MobileEdit.Text := FieldByName('Mobile_No').AsString;
      ChkBxActive.Checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;
  SuppNameEdit.Text := sSuppName;
  BranchNameEdit.Text := sBranchName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckNotes(Self);
  CheckOK(Self);
  if sFuncMode <> 'D' then
    NameEdit.SetFocus;
end;

procedure TCSMaintSContaFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (TypeDBLCB.KeyValue <> Null);
end;

procedure TCSMaintSContaFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintSContaFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintSContaFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextDbKey;
    CSDBMemoFrm.UpdMemoData(Self);
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
      if (FileTypDBLCB.KeyValue = null) or (FileTypDBLCB.KeyValue = '') then
        ParamByName('ExportFilter').Clear
      else
        ParamByName('ExportFilter').AsString := FileTypDBLCB.KeyValue;
      ParamByName('Fax_Number').AsString := FaxEdit.Text;
      ParamByName('Mobile_No').AsString := MobileEdit.Text;
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
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
    CSDBMemoFrm.DelMemoData(self);
    with DelSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iCode;
      ExecSQL;
    end;
  end;
end;

procedure TCSMaintSContaFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintSContaFrm.TypeDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintSContaFrm.AddZero;
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

procedure TCSMaintSContaFrm.DeleteZero;
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

function TCSMaintSContaFrm.GetNextDbKey: integer;
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
      if (FileTypDBLCB.KeyValue = null) or (FileTypDBLCB.KeyValue = '') then
        ParamByName('ExportFilter').Clear
      else
        ParamByName('ExportFilter').AsString := FileTypDBLCB.KeyValue;
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
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

procedure TCSMaintSContaFrm.ContTypeMaintBitBtnClick(Sender: TObject);
begin
  CSMaintGroupsFrm := TCSMaintGroupsFrm.Create(self) ;
    try
      CSMaintGroupsFrm.iGroupselect := 3;
      CSMaintGroupsFrm.ShowModal ;
    Finally;
    CSMaintGroupsFrm.Free ;
    end;
  GetContTypesSQL.Active := False;
  GetContTypesSQL.Active := True;
end;

procedure TCSMaintSContaFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := STImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := STImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TCSMaintSContaFrm.NotesBitBtnClick(Sender: TObject);
begin
  CSDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDBMemoFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintSContaFrm.CheckNotes(Sender: TObject);
begin
  if CSDBMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := STImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := STImagesFrm.OffBitBtn.Glyph;
  end;
end;

end.
