(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Reps.

VSS Info:
$Header: /CCSCommon/CSMaintRep.pas 1     23/05/:2 8:02 Pahome $
$History: CSMaintRep.pas $
 * 
 * *****************  Version 1  *****************
 * User: Pahome       Date: 23/05/:2   Time: 8:02
 * Created in $/CCSCommon
 * Initial take on of common Rep LU and Maintenance units
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
unit CSMaintRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls, Spin;

type
  TCSMaintRepFrm = class(TForm)
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
  private
    bNotesFlash: ByteBool;
    function GetNextDbKey : integer;
    procedure AddZero;
    procedure DelZero;
  public
    sFuncMode: string[1];
    iCode, iCust: Integer;
    sCustName: string;
  end;

var
  CSMaintRepFrm: TCSMaintRepFrm;

implementation

uses CSDBMemo, CSLURep, CSImages, ComObj, ActiveX, CSLURepNom;

{$R *.DFM}

procedure TCSMaintRepFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  CSDBMemoFrm.bAllow_Upd := True;

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
    PrefixEdit.Text := '';
    spnCommission.Value := 0;
    NominalBitBTn.Enabled := false;

  end
  else
  begin
    with CSLURepFrm.DetsSRC.DataSet do
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
      spnCommission.Value := FieldByName('Commission_Rate').Asinteger;
      PrefixEdit.Text := FieldByName('Rep_Suffix_or_Prefix').AsString;
      CSDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
       NominalBitBTn.Enabled := true;
      {Run Nominal SQL}
      with RepNomSQL do
      begin
        Close;
        ParamByName('Rep').AsInteger := icode;
        Open;
      end;
      if FieldByName('Product_Nominal_Def').isnull then
        ProdNomDBLookupComboBox.KeyValue := Null
      else
        ProdNomDBLookupComboBox.KeyValue :=
          FieldByName('Product_Nominal_Def').AsString;

      if FieldByName('Additional_Dtls_Nominal_Def').isnull then
        AddNomDBLookupComboBox.KeyValue := Null
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
end;

procedure TCSMaintRepFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (PhoneEdit.Text <> '');
end;

procedure TCSMaintRepFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintRepFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintRepFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    {Add/change the rep narrative}
    CSDBMemoFrm.UpdMemoData(Self);
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
      ParamByName('Commission_Rate').Asfloat := spnCommission.value;
      ParamByName('Rep_Suffix_or_Prefix').AsString := PrefixEdit.Text + '';
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      if AddNomDBLookupComboBox.KeyValue = Null then
        ParamByName('Additional_Dtls_Nominal_Def').clear
      else
        ParamByName('Additional_Dtls_Nominal_Def').asstring := AddNomDBLookupComboBox.KeyValue;

      if ProdNomDBLookupComboBox.KeyValue = Null then
        ParamByName('Product_Nominal_Def').clear
      else
        ParamByName('Product_Nominal_Def').AsString := ProdNomDBLookupComboBox.KeyValue;
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
      Close;
      ParamByName('Rep').AsInteger := iCode;
      ExecSQL;
    end;
    {Delet the rep narrative}
    CSDBMemoFrm.DelMemoData(Self);
  end;
end;

procedure TCSMaintRepFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintRepFrm.NotesBitBtnClick(Sender: TObject);
begin
  CSDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDBMemoFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintRepFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CSDBMemoFrm.Free;
end;

procedure TCSMaintRepFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TCSMaintRepFrm.CheckNotes(Sender: TObject);
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

procedure TCSMaintRepFrm.AddZero;
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

procedure TCSMaintRepFrm.DelZero;
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

function TCSMaintRepFrm.GetNextDbKey: integer;
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

procedure TCSMaintRepFrm.NominalBitBtnClick(Sender: TObject);
begin
  CSLURepNomFrm := TCSLURepNomFrm.Create(Self);
  try
    CSLURepNomFrm.bIs_Lookup := False;
    CSLURepNomFrm.bAllow_Upd := True;
    CSLURepNomFrm.SelCode := icode;
    CSLURepNomFrm.SelName := NameEdit.text;
    CSLURepNomFrm.ShowModal;

    {Run Nominal SQL}
    with RepNomSQL do
       begin
         Close;
         ParamByName('Rep').AsInteger := icode;
         Open;
         end;
  finally
    CSLURepNomFrm.Free;
  end;

end;

end.
