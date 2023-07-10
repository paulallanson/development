(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Reps.

VSS Info:
$Header: /PBL D5/PBMaintRep.pas 13    20/06/03 9:53 Andrewh $
$History: PBMaintRep.pas $
 * 
 * *****************  Version 13  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 26/10/:1   Time: 17:01
 * Updated in $/PBL D5
 * Added maintenance of Rep Commission field
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 21/11/:0   Time: 15:10
 * Updated in $/PBL D5
 * Corrected problem when adding the first new Rep
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 9/03/:0    Time: 12:11
 * Updated in $/PBL D5
 * Changed to move the Nominal Code selection from the lookup to the
 * actual Rep maintenance screen.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 8/02/:0    Time: 15:56
 * Updated in $/PBL D5
 * New insert method to ensure unique keys on adding.  Locking convention
 * for the Company record to ensure no double updates on Last_PO_Number,
 * Last_Enquiry_Number and Last_Invoice_No fields.  
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 9:03
 * Updated in $/PBL D5
 * New insert method using GUIDs to guarantee unique new keys.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBMaintRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls, Spin;

type
  TPBMaintRepFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TQuery;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    NotesBitBtn: TBitBtn;
    NameEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PhoneEdit: TEdit;
    FaxEdit: TEdit;
    EMailEdit: TEdit;
    PostCodeEdit: TEdit;
    MobileEdit: TEdit;
    Label4: TLabel;
    FlashTimer: TTimer;
    Label1: TLabel;
    PrefixEdit: TEdit;
    PosEdit: TEdit;
    Label5: TLabel;
    ProdNomlbl: TLabel;
    AdditDestslbl: TLabel;
    RepNomSQL: TQuery;
    ProdNomDBLookupComboBox: TDBLookupComboBox;
    AddNomDBLookupComboBox: TDBLookupComboBox;
    RepNomSRC: TDataSource;
    Label6: TLabel;
    NominalBitBtn: TBitBtn;
    qryZero: TQuery;
    Label11: TLabel;
    spnCommission: TSpinEdit;
    UpdNotesOnlySQL: TQuery;
    Label12: TLabel;
    dblkpRepTeam: TDBLookupComboBox;
    qryRepTeam: TQuery;
    dtsRepTeam: TDataSource;
    btnRepTeam: TBitBtn;
    GroupClearBitBtn: TBitBtn;
    chkbxActive: TCheckBox;
    pnlSubReps: TPanel;
    Label13: TLabel;
    CompanyEdit: TEdit;
    Label14: TLabel;
    AreaEdit: TEdit;
    chkbxSubRep: TCheckBox;
    qryGetRepTeam: TQuery;
    qryAddRepTeamMember: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure NominalBitBtnClick(Sender: TObject);
    procedure btnRepTeamClick(Sender: TObject);
    procedure GroupClearBitBtnClick(Sender: TObject);
  private
    bNotesFlash: ByteBool;
    function GetNextDbKey : integer;
    procedure AddZero;
    procedure DelZero;
    function GetRepTeam: integer;
    procedure UpdateRepTeamMember;
  public
    sFuncMode: string[1];
    iCode, iCust: Integer;
    sCustName: string;
  end;

var
  PBMaintRepFrm: TPBMaintRepFrm;

implementation

uses PBDBMemo, PBLURep, PBImages, ComObj, ActiveX, PBLURepNom, PBDatabase,
  pbMainMenu, PBLURepTeam;

{$R *.DFM}

procedure TPBMaintRepFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  PBDBMemoFrm.bAllow_Upd := True;

  pnlSubReps.visible := dmBroker.UseSubReps;

  with qryRepTeam do
    begin
      close;
      open;
    end;

  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new rep';
  if sFuncMode = 'C' then
    Caption := 'Change a rep';
  if sFuncMode = 'D' then
    Caption := 'Delete a rep';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    NameEdit.Text := '';
    PosEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PostCodeEdit.Text := '';
    PhoneEdit.Text := '';
    FaxEdit.Text := '';
    EMailEdit.Text := '';
    MobileEdit.Text := '';
    CompanyEdit.Text := '';
    AreaEdit.Text := '';
    PrefixEdit.Text := '';
    spnCommission.Value := 0;
    NominalBitBTn.Enabled := false;
    dblkpRepTeam.KeyValue := 0;
    ChkBxActive.Checked := True;
    chkbxSubRep.checked := false;
  end
  else
  begin
    with PBLURepFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Rep').AsInteger;
      NameEdit.Text := FieldByName('Name').AsString;
      PosEdit.Text := FieldByName('Position').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PhoneEdit.Text := FieldByName('Phone').AsString;
      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      EMailEdit.Text := FieldByName('EMail').AsString;
      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      MobileEdit.Text := FieldByName('Mobile_No').AsString;
      CompanyEdit.Text := FieldByName('Company_Name').AsString;
      AreaEdit.Text := FieldByName('Sales_Area').AsString;
      spnCommission.Value := FieldByName('Commission_Rate').Asinteger;
      PrefixEdit.Text := FieldByName('Rep_Suffix_or_Prefix').AsString;
      PBDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);

      dblkpRepTeam.KeyValue := GetRepTeam;
//      dblkpRepTeam.KeyValue := Fieldbyname('Rep_Team').asinteger;

      NominalBitBTn.Enabled := true;
      ChkBxActive.Checked := not (fieldByName('InActive').AsString = 'Y');
      chkbxSubRep.checked := (fieldByName('Rep_Is_Sub_Rep').AsString = 'Y');
      {Run Nominal SQL}
      with RepNomSQL do
      begin
        Close;
        ParamByName('Rep').AsInteger := icode;
        Open;
      end;
      if FieldByName('Product_Nominal_Def').isnull then
        ProdNomDBLookupComboBox.KeyValue := 0
      else
        ProdNomDBLookupComboBox.KeyValue :=
          FieldByName('Product_Nominal_Def').AsString;

      if FieldByName('Additional_Dtls_Nominal_Def').isnull then
        AddNomDBLookupComboBox.KeyValue := 0
      else
        AddNomDBLookupComboBox.KeyValue :=
          FieldByName('Additional_Dtls_Nominal_Def').AsString;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckNotes(Self);
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuReps',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintRepFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (PhoneEdit.Text <> '');
end;

procedure TPBMaintRepFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintRepFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintRepFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    {Add/change the rep narrative}
    PBDBMemoFrm.UpdMemoData(Self);
    if sFuncMode = 'A' then
      iCode := GetNextDbKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Rep').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Position').AsString := PosEdit.Text;
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      ParamByName('Mobile_No').AsString := MobileEdit.Text + '';
      ParamByName('Company_Name').AsString := CompanyEdit.Text + '';
      ParamByName('Sales_Area').AsString := AreaEdit.Text + '';
      ParamByName('Commission_Rate').Asfloat := spnCommission.value;
      ParamByName('Rep_Suffix_or_Prefix').AsString := PrefixEdit.Text + '';

      if dblkpRepTeam.Text = '' then
        Parambyname('Rep_Team').clear
      else
        Parambyname('Rep_Team').asinteger := dblkpRepTeam.KeyValue;

      if PBDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
      if AddNomDBLookupComboBox.text = '' then
        ParamByName('Additional_Dtls_Nominal_Def').clear
      else
        ParamByName('Additional_Dtls_Nominal_Def').asstring := AddNomDBLookupComboBox.KeyValue;

      if ProdNomDBLookupComboBox.text = '' then
        ParamByName('Product_Nominal_Def').clear
      else
        ParamByName('Product_Nominal_Def').AsString := ProdNomDBLookupComboBox.KeyValue;

      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';

      if ChkBxSubRep.checked then
        ParamByName('Rep_Is_Sub_Rep').AsString := 'Y'
      else
        ParamByName('Rep_Is_Sub_Rep').AsString := 'N';

      ExecSQL;
    end;
    UpdateRepTeamMember;
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
      Close;
      ParamByName('Rep').AsInteger := iCode;
      ExecSQL;
    end;
    {Delet the rep narrative}
    PBDBMemoFrm.DelMemoData(Self);
  end;
end;

procedure TPBMaintRepFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintRepFrm.NotesBitBtnClick(Sender: TObject);
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
                ParamByName('Rep').AsInteger := iCode;
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

procedure TPBMaintRepFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBDBMemoFrm.Free;
end;

procedure TPBMaintRepFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintRepFrm.CheckNotes(Sender: TObject);
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

procedure TPBMaintRepFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Rep (Rep, Name, Building_no_Name, Street, Locale, Town, Postcode, Phone) VALUES (0,'' '','' '','' '','' '','' '','' '','' '') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintRepFrm.DelZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Rep Where Rep = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintRepFrm.GetNextDbKey: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
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
      Result := FieldByName('Rep').AsInteger;
      Close;
    end;
  finally
    DelZero;
  end;
end;

procedure TPBMaintRepFrm.NominalBitBtnClick(Sender: TObject);
begin
  PBLURepNomFrm := TPBLURepNomFrm.Create(Self);
  try
    PBLURepNomFrm.bIs_Lookup := False;
    PBLURepNomFrm.bAllow_Upd := True;
    PBLURepNomFrm.SelCode := icode;
    PBLURepNomFrm.SelName := NameEdit.text;
    PBLURepNomFrm.ShowModal;

    {Run Nominal SQL}
    with RepNomSQL do
       begin
         Close;
         ParamByName('Rep').AsInteger := icode;
         Open;
         end;
  finally
    PBLURepNomFrm.Free;
  end;

end;

procedure TPBMaintRepFrm.btnRepTeamClick(Sender: TObject);
begin
  pbluRepTeamfrm := TPBLURepTeamfrm.create(self);
  try
    PBLURepTeamFrm.bAllow_Upd := true;
    PBLURepTeamFrm.bIs_Lookup := false;
    PBLURepTeamFrm.showmodal;
  finally
    PBLURepTeamFrm.free;
  end;

  qryRepTeam.close;
  qryRepTeam.Open;
end;

procedure TPBMaintRepFrm.GroupClearBitBtnClick(Sender: TObject);
begin
  dblkpRepTeam.KeyValue := 0;
end;

function TPBMaintRepFrm.GetRepTeam: integer;
begin
  with qryGetRepTeam do
    begin
      close;
      parambyname('Rep').asinteger := iCode;
      open;

      result := fieldbyname('Rep_Team').asinteger;
    end;
end;

procedure TPBMaintRepFrm.UpdateRepTeamMember;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Rep_Team_Member Where Rep = ' + inttostr(iCode));
    try
      ExecSQL;
    except
    end;
  end;

  if dblkpRepTeam.text <> '' then
    begin
      with qryAddRepTeamMember do
        begin
          close;
          parambyname('Rep_Team').asinteger := dblkpRepTeam.keyvalue;
          parambyname('Rep').asinteger := iCode;
          execsql;
        end;
    end;
end;

end.
