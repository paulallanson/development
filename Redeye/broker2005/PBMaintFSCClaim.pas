unit PBMaintFSCClaim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls;

type
  TPBMaintFSCClaimFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TQuery;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    DetsSRC: TDataSource;
    qryZero: TQuery;
    chkbxMixedClaim: TCheckBox;
    edtShortDescription: TEdit;
    Label2: TLabel;
    rdgrpClaimtype: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UnitFactorEditChange(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: integer;
  end;

var
  PBMaintFSCClaimFrm: TPBMaintFSCClaimFrm;

implementation

uses ComObj, ActiveX, PBLUFSCClaim, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintFSCClaimFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new FSC Material Claim';
  if sFuncMode = 'C' then
    Caption := 'Change a FSC Material Claim';
  if sFuncMode = 'D' then
    Caption := 'Delete a FSC Material Claim';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    chkbxMixedClaim.Checked := false;
    edtShortDescription.Text := '';
    rdgrpClaimType.itemindex := 0;
  end
  else
  begin
    with PBLUFSCClaimFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('FSC_Material_Claim').AsInteger;
      DescrEdit.Text := FieldByName('Claim_Description').AsString;
      chkbxMixedClaim.checked := (fieldByName('Mixed_Claim').AsString = 'Y');
      edtShortDescription.Text := fieldByName('Short_description').AsString;
      if fieldByName('Claim_Type').AsString = 'FSC' then
        rdgrpClaimType.itemindex := 0
      else
        rdgrpClaimType.itemindex := 1;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuFSCClaim',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintFSCClaimFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
                      (edtShortDescription.Text <> '');
end;

procedure TPBMaintFSCClaimFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintFSCClaimFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintFSCClaimFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      ParamByName('FSC_Material_Claim').AsInteger := iCode;
      ParamByName('Claim_Description').AsString := DescrEdit.Text + '';
      ParamByName('Short_Description').AsString := edtShortDescription.Text + '';
      if rdgrpClaimType.ItemIndex = 0 then
        parambyname('Claim_Type').AsString := 'FSC'
      else
        parambyname('Claim_Type').AsString := 'PEFC';

      if ChkBxMixedClaim.checked then
        ParamByName('Mixed_Claim').AsString := 'Y'
      else
        ParamByName('Mixed_Claim').AsString := 'N';

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
        ParamByName('FSC_Material_Claim').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintFSCClaimFrm.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintFSCClaimFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into FSC_Material_Claim ' +
            '(FSC_Material_Claim,Claim_Description) ' +
            'VALUES(''0'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintFSCClaimFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From FSC_Material_Claim Where FSC_Material_Claim =''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintFSCClaimFrm.GetNextKey: integer;
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
      Result := FieldByName('FSC_Material_Claim').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
