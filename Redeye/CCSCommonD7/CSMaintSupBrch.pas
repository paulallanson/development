(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Branches form.

VSS Info:
$Header: /CCSCommon/CSMaintSupBrch.pas 2     13/02/:2 12:27 Paul $
$History: CSMaintSupBrch.pas $
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 13/02/:2   Time: 12:27
 * Updated in $/CCSCommon
 * Updated to the latest 'Broker' versions
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintSupBrch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSMaintSupBrchFrm = class(TForm)
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
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SuppNameEdit: TEdit;
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
    FlashTimer: TTimer;
    Label11: TLabel;
    AccCodeEdit: TEdit;
    GetCompSQL: TFDQuery;
    CheckSuppAccExistsSQL: TFDQuery;
    CheckCustAccExistsSQL: TFDQuery;
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
    procedure AccCodeEditChange(Sender: TObject);
    procedure AccCodeEditEnter(Sender: TObject);
    procedure AccCodeEditExit(Sender: TObject);
  private
    SOldValue: string;
    bNotesFlash: ByteBool;
  public
    sFuncMode: string[1];
    iCode, iSupp: Integer;
    sSuppName: string;
  end;

var
  CSMaintSupBrchFrm: TCSMaintSupBrchFrm;

implementation

uses CSDBMemo, CSLUSupBrch, CSImages;

{$R *.DFM}

procedure TCSMaintSupBrchFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  CSDBMemoFrm.bAllow_Upd := True;
  {Setup titles};
  if sFuncMode = 'A' then
    Caption := 'Add a new branch';
  if sFuncMode = 'C' then
    Caption := 'Change a branch';
  if sFuncMode = 'D' then
    Caption := 'Delete a branch';
  if sFuncMode = 'A' then
  begin
    {Empty details};
    NameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PostCodeEdit.Text := '';
    PhoneEdit.Text := '';
    FaxEdit.Text := '';
    EMailEdit.Text := '';
    AccCodeEdit.Text := '';
  end
  else
  begin
    with CSLUSupBrchFrm.DetsSRC.DataSet do
    begin
      NameEdit.Text := FieldByName('Name').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PhoneEdit.Text := FieldByName('Phone').AsString;
      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      EMailEdit.Text := FieldByName('EMail').AsString;
      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      CSDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      AccCodeEdit.Text := FieldByName('Account_Code').AsString;
    end;
  end;
  SuppNameEdit.Text := sSuppName;
  {Enable or disable the buttons};
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckNotes(Self);
  CheckOK(Self);
end;

procedure TCSMaintSupBrchFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (SuppNameEdit.Text <> '') and
    (NameEdit.Text <> '') and
    (PhoneEdit.Text <> '');
end;

procedure TCSMaintSupBrchFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintSupBrchFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintSupBrchFrm.OKBitBtnClick(Sender: TObject);
var
  iTempNewCode: Integer;
begin
  if sFuncMode = 'A' then
  begin
    {Add a new code};
    {Add the branch narrative};
    CSDBMemoFrm.UpdMemoData(Self);
    {Get Next code};
    with GetLastSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      Open;
      First;
      iTempNewCode := FieldByName('Last_Code').AsInteger + 1;
      Close;
    end;
    with AddSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      ParamByName('Branch_No').AsInteger := iTempNewCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      ExecSQL;
    end;
    iCode := iTempNewCode;
  end;
  if sFuncMode = 'C' then
  begin
    {Update the branch narrative};
    CSDBMemoFrm.UpdMemoData(Self);
    {Update an existing code};
    with UpdSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      ParamByName('Branch_No').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      ExecSQL;
    end;
  end;
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
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Branch_No').AsInteger := iCode;
      ExecSQL;
    end;
    {Delet the branch narrative};
    CSDBMemoFrm.DelMemoData(Self);
  end;
end;

procedure TCSMaintSupBrchFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintSupBrchFrm.NotesBitBtnClick(Sender: TObject);
begin
  CSDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDBMemoFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintSupBrchFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CSDBMemoFrm.Free;
end;

procedure TCSMaintSupBrchFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TCSMaintSupBrchFrm.CheckNotes(Sender: TObject);
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

procedure TCSMaintSupBrchFrm.AccCodeEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintSupBrchFrm.AccCodeEditEnter(Sender: TObject);
begin
  sOldValue := AccCodeEdit.Text;
end;

procedure TCSMaintSupBrchFrm.AccCodeEditExit(Sender: TObject);
begin
  if Trim(AccCodeEdit.Text) = '' then Exit;
  {Validate that the account code is unique};
  with GetCompSQL do
  begin
    Close;
    Open;
    First;
    if FieldByName('Acc_Code_Supp_Unique').AsString <> 'Y' then
      Exit;
  end;
  with CheckSuppAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    ParamByName('Supplier').AsInteger := iSupp;
    Open;
    First;
    if (not EOF) then
    begin
      MessageDlg('The account code: ' + AccCodeEdit.Text +
        ' is already in use on supplier: ' +
        FieldByName('Name').AsString, mtError, [mbOK], 0);
      AccCodeEdit.Text := sOldValue;
      AccCodeEdit.SetFocus;
    end;
  end;
  with CheckCustAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    Open;
    First;
    if (not EOF) then
    begin
      MessageDlg('The account code: ' + AccCodeEdit.Text +
        ' is already in use on customer: ' +
        FieldByName('Name').AsString, mtError, [mbOK], 0);
      AccCodeEdit.Text := sOldValue;
      AccCodeEdit.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

end.
