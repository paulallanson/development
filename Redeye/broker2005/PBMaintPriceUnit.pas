unit PBMaintPriceUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables;

type
  TPBMaintPriceUnitFrm = class(TForm)
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
    UnitFactorEdit: TEdit;
    Label2: TLabel;
    DetsSRC: TDataSource;
    ShowOnDocsCheckBox: TCheckBox;
    qryZero: TQuery;
    chkbxActive: TCheckBox;
    chkbxEstimating: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UnitFactorEditChange(Sender: TObject);
    procedure UnitFactorEditKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: integer;
  end;

var
  PBMaintPriceUnitFrm: TPBMaintPriceUnitFrm;

implementation

uses PBLUPriceUnit, ComObj, ActiveX, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintPriceUnitFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new price unit';
  if sFuncMode = 'C' then
    Caption := 'Change a price unit';
  if sFuncMode = 'D' then
    Caption := 'Delete a price unit';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    UnitFactorEdit.Text := '';
    ChkBxActive.Checked := True;
    chkbxEstimating.Checked := True;
  end
  else
  begin
    with PBLUPriceUnitFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Price_Unit').AsInteger;
      DescrEdit.Text := FieldByName('Description').AsString;
      UnitFactorEdit.Text := FieldByName('Price_Unit_Factor').AsString;
      ChkBxActive.checked := not (fieldByName('Price_unit_InActive').AsString = 'Y');
      ChkBxEstimating.checked := (fieldByName('Use_For_Estimating').AsString = 'Y');
      ShowOnDocsCheckBox.Checked := (FieldByName('Show_On_Report').AsString = 'Y');
    end;
  end;
  {Enable or disable the buttons}
  DescrEdit.Enabled := (iCode <> 1) and (iCode <> 2);
  UnitFactorEdit.Enabled := (iCode <> 1) and (iCode <> 2);
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuPriceUnits',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintPriceUnitFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
    (UnitFactorEdit.Text <> '');
end;

procedure TPBMaintPriceUnitFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPriceUnitFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPriceUnitFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPriceUnitFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      if ShowOnDocsCheckBox.Checked then
        ParamByName('Show_On_Report').AsString := 'Y'
      else
        ParamByName('Show_On_Report').AsString := 'N';
      ParamByName('Price_Unit').AsInteger := iCode;
      ParamByName('Description').AsString := DescrEdit.Text + '';
      ParamByName('Price_Unit_Factor').AsFloat :=
        StrToFloat(UnitFactorEdit.Text);
      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';

      if ChkBxEstimating.checked then
        ParamByName('Use_For_Estimating').AsString := 'Y'
      else
        ParamByName('Use_For_Estimating').AsString := 'N';

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
        ParamByName('Price_unit').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;

  {If replicating Price Unit details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(5, iCode, 0, 0, sFuncMode);
    end;

end;

procedure TPBMaintPriceUnitFrm.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPriceUnitFrm.UnitFactorEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBMaintPriceUnitFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Price_Unit ' +
            '(Price_Unit,Description,Price_Unit_Factor,Show_On_Report) ' +
            'VALUES(''0'',''Dummy'',0,''N'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintPriceUnitFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Price_Unit Where Price_Unit=''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintPriceUnitFrm.GetNextKey: integer;
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
      Result := FieldByName('Price_Unit').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
