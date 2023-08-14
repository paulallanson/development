(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Customer/Branch Contacts.

VSS Info:
$Header: /CCSCommon/CSMaintCConta.pas 2     31/01/:1 15:06 Janiner $
$History: CSMaintCConta.pas $
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 31/01/:1   Time: 15:06
 * Updated in $/CCSCommon
 * Make changes as per PB versions re e-mail file type
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:00
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 13  *****************
 * User: Paul         Date: 19/10/:0   Time: 12:29
 * Updated in $/PBL D5
 * Changed to refresh the Contact Level combo after adding new levels
 * 
 * *****************  Version 12  *****************
 * User: Davidn       Date: 18/10/00   Time: 10:54
 * Updated in $/PBL D5
 * Fixing bug in the Levels combo box (assigning a duff value to the box
 * in the cases where no contact level had been set for the contact),
 * Added a maintain contact levels bit button,
 * Amended the tab order of the components of the form. 
 * 
 * *****************  Version 11  *****************
 * User: Davidn       Date: 17/10/00   Time: 17:10
 * Updated in $/PBL D5
 * Fixed bug which occured when adding a contact that had no contact level
 * specified.
 * 
 * *****************  Version 10  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:44
 * Updated in $/PBL D5
 * Setting form position to screen centre.
 * 
 * *****************  Version 9  *****************
 * User: Davidn       Date: 17/10/00   Time: 9:55
 * Updated in $/PBL D5
 * Cosmetic changes to layout, ie alignment and sizes of text boxes,
 * matched labels to those on supplier contact maintenance.
 * 
 * *****************  Version 8  *****************
 * User: Davidn       Date: 13/10/00   Time: 12:25
 * Updated in $/PBL D5
 * Changed default setting of recvCorresCB to unchecked.
 * 
 * *****************  Version 7  *****************
 * User: Davidn       Date: 13/10/00   Time: 12:22
 * Updated in $/PBL D5
 * Changes to alignment of visible components.
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 13/10/00   Time: 12:07
 * Updated in $/PBL D5
 * Added a field, combo look up box and check box to allow the addition
 * and amintainance of a Fax number, contact level and receive mail option
 * to the customer contacts maintainance form.
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 3/10/:0    Time: 15:41
 * Updated in $/PBL D5
 * Add new maintenance facility to contact type, look-up facility.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 7/02/:0    Time: 9:36
 * Updated in $/PBL D5
 * New insert method using Guids to ensure unique new key values.
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 21/01/:0   Time: 10:42
 * Updated in $/PBL D5
 * Display 'name' etc in panel
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintCConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Mask, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSMaintCContaFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CustNameEdit: TEdit;
    NameEdit: TEdit;
    BranchNameEdit: TEdit;
    GetBranchNameSQL: TFDQuery;
    Label4: TLabel;
    TypeDBLCB: TDBLookupComboBox;
    GetContTypesSQL: TFDQuery;
    ContTypesSRC: TDataSource;
    Label6: TLabel;
    PhoneEdit: TEdit;
    Label7: TLabel;
    EMailEdit: TEdit;
    Label5: TLabel;
    SalutationEdit: TEdit;
    MobileEdt: TEdit;
    MobileLabel: TLabel;
    QryZero: TFDQuery;
    ContTypeMaintBitBtn: TBitBtn;
    LevelDBLCB: TDBLookupComboBox;
    lblcontactLevel: TLabel;
    lblFaxNo: TLabel;
    Label8: TLabel;
    RecvCorresCB: TCheckBox;
    GetContLevelsSQL: TFDQuery;
    ContLevelsSRC: TDataSource;
    FaxEdit: TEdit;
    ContLevelMaintBitBtn: TBitBtn;
    Label9: TLabel;
    FileTypDBLCB: TDBLookupComboBox;
    GetFileTypeSQL: TFDQuery;
    FileTypSRC: TDataSource;
    Label10: TLabel;
    StatusDBLCB: TDBLookupComboBox;
    Label11: TLabel;
    memMarkup: TMemo;
    ChkBxActive: TCheckBox;
    NotesBitBtn: TBitBtn;
    FlashTimer: TTimer;
    UpdNotesOnlySQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    qryStatus: TFDQuery;
    srcStatus: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure TypeDBLCBClick(Sender: TObject);
    procedure ContTypeMaintBitBtnClick(Sender: TObject);
    procedure ContLevelMaintBitBtnClick(Sender: TObject);
    procedure FileTypDBLCBClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure memMarkupEnter(Sender: TObject);
    procedure memMarkupExit(Sender: TObject);
    procedure memMarkupKeyPress(Sender: TObject; var Key: Char);
  private
    bNotesFlash : ByteBool;
    sOldValue: string;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextDbKey : integer;
  public
    sFuncMode: string[1];
    iCode, iCust, iBranch: Integer;
    sCustName, sBranchName: string;
  end;

var
  CSMaintCContaFrm: TCSMaintCContaFrm;

implementation

uses CSLUCust, CSMaintBranch, CSLUBranch, CSLUCConta, ComObj, ActiveX,
  CSMaintGroups, CSDBMemo, CSImages, STMenuMain, STDataBase, STCommon;

{$R *.DFM}

procedure TCSMaintCContaFrm.FormActivate(Sender: TObject);
begin
  {Re-activate the list SQL}
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  CSDBMemoFrm.bAllow_Upd := True;
  GetContTypesSQL.Close;
  GetContTypesSQL.Open;

  qryStatus.Close;
  qryStatus.Open;

  GetContLevelsSQL.Close;
  GetContLevelsSQL.Open;
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
    MemMarkup.Text := '0.00';
    TypeDBLCB.KeyValue := Null;
    FileTypDBLCB.KeyValue := Null;
    ChkBxActive.Checked := True;
  end
  else
  begin
    with CSLUCContaFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Contact_No').AsInteger;
      NameEdit.Text := Trim(FieldByName('Name').AsString);
      PhoneEdit.Text := Trim(FieldByName('Phone').AsString);
      MobileEdt.Text := Trim(FieldByname('Mobile_No').AsString);
      EMailEdit.Text := Trim(FieldByName('EMail').AsString);
      MemMarkup.Text := formatfloat('0.00',FieldByName('Def_Markup_perc').asFloat);
      SalutationEdit.Text := Trim(FieldByName('Salutation').AsString);
      CSDBMemoFrm.LoadMemoData(FieldByname('Narrative').AsInteger);
      TypeDBLCB.KeyValue := FieldByName('Contact_Type').AsInteger;
      if FieldByName('Contact_Level').AsInteger = 0 then
        LevelDBLCB.KeyValue := Null
      else
        LevelDBLCB.KeyValue := FieldByName('Contact_Level').AsInteger;

      if FieldByName('Contact_Status').AsInteger = 0 then
        StatusDBLCB.KeyValue := Null
      else
        StatusDBLCB.KeyValue := FieldByName('Contact_Status').AsInteger;

      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      if fieldByName('ExportFilter').AsString = Null then
        FileTypDBLCB.KeyValue := Null
      else
        FileTypDBLCB.KeyValue := FieldByName('ExportFilter').AsString;
      if ((FieldByName('Receive_Mail').AsString) = 'Y') then
      begin
        RecvCorresCB.Checked := True;
      end
      else
      begin
        RecvCorresCB.Checked := False;
      end;
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;
  CustNameEdit.Text := sCustName;
  BranchNameEdit.Text := sBranchName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  CheckNotes(Self);
  if sFuncMode <> 'D' then
    NameEdit.SetFocus;
end;

procedure TCSMaintCContaFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (TypeDBLCB.KeyValue <> Null);
end;

procedure TCSMaintCContaFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintCContaFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintCContaFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextDbKey;
    CSDBMemoFrm.UpdMemoData(Self);
    with UpdSQL do
    begin
     Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Mobile_No').AsString := MobileEdt.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      ParamByName('Salutation').AsString := SalutationEdit.Text + '';
      ParamByName('Def_Markup_Perc').Asfloat := StrToFloatDef(memMarkup.Text, 0, FormatSettings);
      ParamByName('Contact_Type').AsInteger := TypeDBLCB.KeyValue;
      if (LevelDBLCB.KeyValue = null) then
        ParamByName('Contact_Level').Clear
      else
        ParamByName('Contact_Level').AsInteger := LevelDBLCB.KeyValue;

      if (StatusDBLCB.KeyValue = null) then
        ParamByName('Contact_Status').Clear
      else
        ParamByName('Contact_Status').AsInteger := StatusDBLCB.KeyValue;

      if (FileTypDBLCB.KeyValue = null) or (FileTypDBLCB.KeyValue = '') then
        ParamByName('ExportFilter').Clear
      else
        ParamByName('ExportFilter').AsString := FileTypDBLCB.KeyValue;
        ParamByName('Fax_Number').AsString := FaxEdit.Text;
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      if (RecvCorresCB.Checked) then
      begin
        ParamByName('Receive_Mail').AsString := 'Y'
      end
      else
      begin
        ParamByName('Receive_Mail').AsString := 'N';
      end;
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
    CSDBMemoFrm.DelMemoData(self);
    with DelSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iCode;
      ExecSQL;
    end;
  end;
end;

procedure TCSMaintCContaFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintCContaFrm.TypeDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

function TCSMaintCContaFrm.GetNextDbKey: integer;
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
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_no').AsInteger := iBranch;
      ParamByName('Contact_Type').AsInteger := TypeDBLCB.KeyValue;
      If (FileTypDBLCB.KeyValue = null) or (FileTypDBLCB.KeyValue = '') then
        ParamByName('ExportFilter').clear
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

procedure TCSMaintCContaFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer_Contact ' +
            '(Customer,Branch_No,Contact_No,Name,Contact_Type) ' +
            'VALUES(' + IntToStr(iCust) + ',' + IntToStr(iBranch) +
            ',0,''Dummy'',' + IntToStr(TypeDBLCB.KeyValue) + ')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TCSMaintCContaFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer_Contact ' +
            'Where Customer=' + IntToStr(iCust) + ' and Branch_No=' +
            IntToStr(iBranch) + ' and Contact_No=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TCSMaintCContaFrm.ContTypeMaintBitBtnClick(Sender: TObject);
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

procedure TCSMaintCContaFrm.ContLevelMaintBitBtnClick(Sender: TObject);
begin
CSMaintGroupsFrm := TCSMaintGroupsFrm.Create(self) ;
  try
    CSMaintGroupsFrm.iGroupselect := 4;
    CSMaintGroupsFrm.ShowModal ;
  Finally;
  CSMaintGroupsFrm.Free ;
  end;
GetContLevelsSQL.Active := False;
GetContLevelsSQL.Active := True;
end;

procedure TCSMaintCContaFrm.FileTypDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintCContaFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TCSMaintCContaFrm.NotesBitBtnClick(Sender: TObject);
begin
  CSDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDBMemoFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintCContaFrm.CheckNotes(Sender: TObject);
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
end;

procedure TCSMaintCContaFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
CSDBMemoFrm.Free;
end;

procedure TCSMaintCContaFrm.memMarkupEnter(Sender: TObject);
begin
 sOldValue := (Sender as Tmemo).text;
end;

procedure TCSMaintCContaFrm.memMarkupExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TCSMaintCContaFrm.memMarkupKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

end.
