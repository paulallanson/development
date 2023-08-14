unit PBMaintProcessGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintProcessGroupFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    qryZero: TFDQuery;
    Label7: TLabel;
    EMailEdit: TEdit;
    ccEmailEdit: TEdit;
    Label5: TLabel;
    Label2: TLabel;
    memHourlyRate: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure CheckKeyIsFloat(Sender: TObject; var Key: Char);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney2DP(Sender: TObject);
  private
    FOldValue : string;
    bNotesFlash: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    procedure DoDelete;
  public
    sFuncMode: string[1];
    iCode: Integer;
    iProductType: integer;
  end;

var
  PBMaintProcessGroupFrm: TPBMaintProcessGroupFrm;

implementation

uses pbDatabase, pbMainMenu, ComObj, ActiveX, PBLUProcessGroup, CCSCommon;

{$R *.DFM}

procedure TPBMaintProcessGroupFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new process group';
  if sFuncMode = 'C' then
    Caption := 'Change a process group';
  if sFuncMode = 'D' then
    Caption := 'Delete a process group';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    memHourlyRate.Text := '0.00';
    EmailEdit.Text := '';
    ccEmailEdit.Text := '';
  end
  else
  begin
    with PBLUProcessGroupFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Process_Group').AsInteger;
      DescrEdit.Text := FieldByName('Process_Group_Description').AsString;
      memHourlyRate.Text := formatfloat('#,##0.00',fieldbyname('Hourly_Rate').asfloat);
      EmailEdit.Text := FieldByName('Email').AsString;
      ccEmailEdit.Text := FieldByName('cc_Email').AsString;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProcessGroups',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintProcessGroupFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
                      (memHourlyRate.Text <> '');
end;

procedure TPBMaintProcessGroupFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintProcessGroupFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProcessGroupFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProcessGroupFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with UpdSQL do
    begin
      Close;
      ParamByName('Process_Group').AsInteger := iCode;
      ParamByName('Process_Group_Description').AsString := DescrEdit.Text + '';
      ParamByName('Email').AsString := EmailEdit.Text + '';
      ParamByName('Hourly_Rate').Asfloat := StrToFloatDef(memHourlyRate.Text, 0, FormatSettings);
      ParamByName('cc_Email').AsString := ccEmailEdit.Text + '';
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      DoDelete;
  end;
end;

procedure TPBMaintProcessGroupFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Process_Group ' +
            '(Process_Group,Process_Group_Description) ' +
            'VALUES(0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintProcessGroupFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Process_Group Where Process_group=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintProcessGroupFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert product type record
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
      Result := FieldByName('Process_Group').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintProcessGroupFrm.DoDelete;
begin
  with DelSQL do
  begin
    SQL.Clear;
    SQL.Add('Delete From Process_Group ' +
            'Where Process_Group=' + IntToStr(iCode));
    ExecSQL;
  end;
end;

procedure TPBMaintProcessGroupFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintProcessGroupFrm.ValidateMoney2DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintProcessGroupFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
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
    '-':;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

end.
