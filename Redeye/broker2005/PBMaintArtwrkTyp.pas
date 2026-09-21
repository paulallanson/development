unit PBMaintArtwrkTyp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintArtwrkTypFrm = class(TForm)
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
    DetsSRC: TDataSource;
    qryZero: TFDQuery;
    CheckArtwrkTypSQL: TFDQuery;
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
  PBMaintArtwrkTypFrm: TPBMaintArtwrkTypFrm;

implementation

uses UITypes, PBLUArtwrkTyp, ComObj, ActiveX, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintArtwrkTypFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Artwork Type';
  if sFuncMode = 'C' then
    Caption := 'Change Artwork Types';
  if sFuncMode = 'D' then
    Caption := 'Delete an Artwork Type';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
  end
  else
  begin
    with PBLUArtwrkTypFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Artwork_Type').AsInteger;
      DescrEdit.Text := FieldByName('Artwork_Instructions').AsString;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuArtworkTypes',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintArtwrkTypFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintArtwrkTypFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintArtwrkTypFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintArtwrkTypFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintArtwrkTypFrm.OKBitBtnClick(Sender: TObject);
begin
if sFuncMode[1] in ['A','C'] then
  begin
    with CheckArtwrkTypSQL do
    begin
      Close;
      ParamByName('Artwork_Instructions').AsString := Trim(DescrEdit.Text) + '';
      Open;
      if RecordCount > 0 then
      begin
        if (icode <> fieldbyname('Artwork_type').asinteger) then
           begin
           MessageDlg('There is already an Artwork Type with this ' +
           'Instruction', mtConfirmation, [mbOK], 0);
           Exit;
           end;
      end;
    end;
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      ParamByName('Artwork_Type').AsInteger := iCode;
      ParamByName('Artwork_Instructions').AsString := DescrEdit.Text + '';
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
        ParamByName('Artwork_Type').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintArtwrkTypFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Artwork_Type ' +
            '(Artwork_Type,Artwork_Instructions) ' +
            'VALUES(''0'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintArtwrkTypFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Artwork_Type Where Artwork_Type=''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintArtwrkTypFrm.GetNextKey: integer;
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
      Result := FieldByName('Artwork_Type').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
