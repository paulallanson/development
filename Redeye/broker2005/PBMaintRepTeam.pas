unit PBMaintRepTeam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintRepTeamFrm = class(TForm)
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
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: integer;
  end;

var
  PBMaintRepTeamFrm: TPBMaintRepTeamFrm;

implementation

uses UITypes, ComObj, ActiveX, PBDatabase, pbMainMenu, PBLUAccountTeam, PBLURepTeam;

{$R *.DFM}

procedure TPBMaintRepTeamFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Rep Team';
  if sFuncMode = 'C' then
    Caption := 'Change a Rep Team';
  if sFuncMode = 'D' then
    Caption := 'Delete a Rep Team';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
  end
  else
  begin
    with PBLURepTeamFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Rep_Team').AsInteger;
      DescrEdit.Text := FieldByName('Rep_Team_Name').AsString;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuReps',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintRepTeamFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintRepTeamFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintRepTeamFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintRepTeamFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintRepTeamFrm.OKBitBtnClick(Sender: TObject);
begin
if sFuncMode[1] in ['A','C'] then
  begin
    with CheckAccTeamSQL do
    begin
      Close;
      ParamByName('Rep_Team_Name').AsString := Trim(DescrEdit.Text) + '';
      Open;
      if RecordCount > 0 then
      begin
        if (icode <> fieldbyname('Rep_Team').asinteger) then
           begin
           MessageDlg('There is already an Rep Team with this ' +
           'name', mtConfirmation, [mbOK], 0);
           Exit;
           end;
      end;
    end;
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      ParamByName('Rep_Team').AsInteger := iCode;
      ParamByName('Rep_Team_Name').AsString := DescrEdit.Text + '';
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
        ParamByName('Rep_Team').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintRepTeamFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Rep_Team ' +
            '(Rep_Team,Rep_Team_Name) ' +
            'VALUES(''0'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintRepTeamFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Rep_Team Where Rep_Team=''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintRepTeamFrm.GetNextKey: integer;
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
      Result := FieldByName('Rep_Team').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
