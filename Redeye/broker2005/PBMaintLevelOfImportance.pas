unit PBMaintLevelOfImportance;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables;

type
  TPBMaintLevelOfImportanceFrm = class(TForm)
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
    chkbxActive: TCheckBox;
    Label2: TLabel;
    edtColor: TEdit;
    ColorDialog1: TColorDialog;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UnitFactorEditChange(Sender: TObject);
    procedure UnitFactorEditKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: integer;
  end;

var
  PBMaintLevelOfImportanceFrm: TPBMaintLevelOfImportanceFrm;

implementation

uses ComObj, ActiveX, PBDatabase, pbMainMenu, PBLULevelOfImportance;

{$R *.DFM}

procedure TPBMaintLevelOfImportanceFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a Level of Importance';
  if sFuncMode = 'C' then
    Caption := 'Change Level of Importance';
  if sFuncMode = 'D' then
    Caption := 'Delete Level of Importance';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLULevelOfImportanceFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Level_of_Importance').AsInteger;
      DescrEdit.Text := FieldByName('Importance_Description').AsString;
      if FieldByName('Color').Asinteger <> 0 then
        begin
          edtColor.color := FieldByName('Color').Asinteger;
          edtColor.font.color := FieldByName('Font_Color').Asinteger;
        end;
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuLevelOfImportance',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintLevelOfImportanceFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintLevelOfImportanceFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintLevelOfImportanceFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintLevelOfImportanceFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintLevelOfImportanceFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      ParamByName('Level_of_Importance').AsInteger := iCode;
      ParamByName('Importance_Description').AsString := DescrEdit.Text + '';
      ParamByName('Color').Asinteger := edtColor.Color;
      ParamByName('Font_Color').Asinteger := edtColor.font.color;
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
        ParamByName('Level_of_Importance').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintLevelOfImportanceFrm.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintLevelOfImportanceFrm.UnitFactorEditKeyPress(Sender: TObject;
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

procedure TPBMaintLevelOfImportanceFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Level_of_Importance ' +
            '(Level_of_Importance,Importance_Description) ' +
            'VALUES(''0'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintLevelOfImportanceFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Level_of_Importance Where Level_of_Importance=''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintLevelOfImportanceFrm.GetNextKey: integer;
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
      Result := FieldByName('Level_of_Importance').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintLevelOfImportanceFrm.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.Color := ColorDialog1.Color;
end;

procedure TPBMaintLevelOfImportanceFrm.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.font.Color := ColorDialog1.Color;

end;

end.
