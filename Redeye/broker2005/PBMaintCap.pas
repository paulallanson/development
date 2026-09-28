unit PBMaintCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCapFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    TextEdit: TEdit;
    qryZero: TFDQuery;
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
    iCode: Integer;
  end;

var
  PBMaintCapFrm: TPBMaintCapFrm;

implementation

uses
  System.UITypes,
  PBDatabase, PBLUQuestn,ComObj, ActiveX, PBLUPrdTypQuList, PBLUCap,
  pbMainMenu;

{$R *.DFM}

procedure TPBMaintCapFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Capability';
  if sFuncMode = 'C' then
    Caption := 'Change a Capability';
  if sFuncMode = 'D' then
    Caption := 'Delete a Capability';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    TextEdit.Text := '';
  end
  else
  begin
    with PBLUCapFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Capability').AsInteger;
      TextEdit.Text := FieldByName('Description').AsString;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProductTypeUtils',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintCapFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (TextEdit.Text <> '');
end;

procedure TPBMaintCapFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintCapFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Capability').AsInteger := iCode;
      ParamByName('Description').AsString := TextEdit.Text + '';
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
        ParamByName('Capability').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;


procedure TPBMaintCapFrm.TextEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCapFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Capability ' +
            '(Capability,Description) ' +
            'VALUES(0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCapFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Capability Where Capability=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintCapFrm.GetNextKey: integer;
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
      Result := FieldByName('Capability').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.

