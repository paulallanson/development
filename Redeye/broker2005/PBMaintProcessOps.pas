unit PBMaintProcessOps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, variants;

type
  TPBMaintProcessOpsFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TQuery;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    TextEdit: TEdit;
    PrdTypDescrEdit: TEdit;
    Label2: TLabel;
    qryZero: TQuery;
    chkbxInactive: TCheckBox;
    chkbxReChargeable: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure TextEditChange(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode, iProcess: Integer;
    sProcessDesc: string;
  end;

var
  PBMaintProcessOpsFrm: TPBMaintProcessOpsFrm;

implementation

uses ComObj, ActiveX, pbDatabase, pbMainMenu, PBLUProcessOps;

{$R *.DFM}

procedure TPBMaintProcessOpsFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new process Operation';
  if sFuncMode = 'C' then
    Caption := 'Change a process Operation';
  if sFuncMode = 'D' then
    Caption := 'Delete a process Operation';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    TextEdit.Text := '';
  end
  else
  begin
    with PBLUProcessOpsFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Operation').AsInteger;
      TextEdit.Text := FieldByName('Operation_Description').AsString;
      chkbxInactive.Checked := (fieldbyname('Inactive').asstring = 'Y');
      chkbxReChargeable.Checked := (fieldbyname('ReChargeable').asstring = 'Y');
    end;
  end;
  PrdTypDescrEdit.Text := sProcessDesc;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');

  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProcesses',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintProcessOpsFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (TextEdit.Text <> '');
end;

procedure TPBMaintProcessOpsFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintProcessOpsFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Process').AsInteger := iProcess;
      ParamByName('Operation').AsInteger := iCode;
      ParamByName('Operation_Description').AsString := TextEdit.Text + '';
      try
        ParamByName('Sequence_no').asinteger := 1
      except
        ParamByName('Sequence_no').asinteger := 0
      end;

      if chkbxInactive.checked then
        ParamByName('Inactive').AsString := 'Y'
      else
        ParamByName('Inactive').AsString := 'N';

      if chkbxReChargeable.checked then
        ParamByName('ReChargeable').AsString := 'Y'
      else
        ParamByName('ReChargeable').AsString := 'N';

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
        ParamByName('Process').AsInteger := iProcess;
        ParamByName('Operation').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintProcessOpsFrm.TextEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProcessOpsFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Process_Operation ' +
            '(Process,Operation,Operation_Description) ' +
            'VALUES(' + IntToStr(iProcess) + ', 0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintProcessOpsFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Process_Operation Where Process=' +
            IntToStr(iProcess) + ' And Operation=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintProcessOpsFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByname('Process').AsInteger := iProcess;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Operation').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.

