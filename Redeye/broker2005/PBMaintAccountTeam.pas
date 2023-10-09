unit PBMaintAccountTeam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintAccountTeamFrm = class(TForm)
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    DetsSRC: TDataSource;
    qryZero: TFDQuery;
    CheckAccTeamSQL: TFDQuery;
    detsgrpbox: TGroupBox;
    chkbxactive: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    SelRep: integer;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: integer;
  end;

var
  PBMaintAccountTeamFrm: TPBMaintAccountTeamFrm;

implementation

uses UITypes, ComObj, ActiveX, PBDatabase, pbMainMenu, PBLUAccountTeam;

{$R *.DFM}

procedure TPBMaintAccountTeamFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Account Team';
  if sFuncMode = 'C' then
    Caption := 'Change an Account Team';
  if sFuncMode = 'D' then
    Caption := 'Delete an Account Team';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLUAccountTeamFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Account_Team').AsInteger;
      DescrEdit.Text := FieldByName('Account_Team_Name').AsString;
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuAccountManagers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintAccountTeamFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintAccountTeamFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintAccountTeamFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintAccountTeamFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintAccountTeamFrm.OKBitBtnClick(Sender: TObject);
begin
if sFuncMode[1] in ['A','C'] then
  begin
    with CheckAccTeamSQL do
    begin
      Close;
      ParamByName('Account_Team_Name').AsString := Trim(DescrEdit.Text) + '';
      Open;
      if RecordCount > 0 then
      begin
        if (icode <> fieldbyname('Account_Team').asinteger) then
           begin
           MessageDlg('There is already an Account Team with this ' +
           'name', mtConfirmation, [mbOK], 0);
           Exit;
           end;
      end;
    end;
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      ParamByName('Account_Team').AsInteger := iCode;
      ParamByName('Account_Team_Name').AsString := DescrEdit.Text + '';
(*      if selRep = 0 then
        ParamByName('Rep').clear
      else
        ParamByName('Rep').Asinteger := selRep;
*)
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
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with DelSQL do
      begin
        Close;
        ParamByName('Account_Team').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintAccountTeamFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Account_Team ' +
            '(Account_Team,Account_Team_Name) ' +
            'VALUES(''0'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintAccountTeamFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Account_Team Where Account_Team=''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintAccountTeamFrm.GetNextKey: integer;
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
      Result := FieldByName('Account_Team').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
