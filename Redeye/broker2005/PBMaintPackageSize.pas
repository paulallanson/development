unit PBMaintPackageSize;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPackageSizeFrm = class(TForm)
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
    Label2: TLabel;
    memWidth: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    memDepth: TMemo;
    Label3: TLabel;
    Label6: TLabel;
    memHeight: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    memVolume: TMemo;
    chkbxActive: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UnitFactorEditChange(Sender: TObject);
    procedure UnitFactorEditKeyPress(Sender: TObject; var Key: Char);
    procedure memDepthKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: integer;
  end;

var
  PBMaintPackageSizeFrm: TPBMaintPackageSizeFrm;

implementation

uses ComObj, ActiveX, PBDatabase, pbMainMenu, PBLUPackageSize;

{$R *.DFM}

procedure TPBMaintPackageSizeFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new package size';
  if sFuncMode = 'C' then
    Caption := 'Change a package size';
  if sFuncMode = 'D' then
    Caption := 'Delete a package size';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    memDepth.Text := '0';
    memWidth.Text := '0';
    memHeight.Text := '0';
    memVolume.Text := '0';
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLUPackageSizeFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Package_Size').AsInteger;
      DescrEdit.Text := FieldByName('Package_Size_Description').AsString;
      memDepth.Text := FieldByName('Depth_mm').AsString;
      memWidth.Text := FieldByName('Width_mm').AsString;
      memHeight.Text := FieldByName('Height_mm').AsString;
      memVolume.Text := FieldByName('Quantity_per_Cage').AsString;
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;
  {Enable or disable the buttons}
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuPackageSizes',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintPackageSizeFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
                      (memDepth.Text <> '') and
                      (memWidth.Text <> '') and
                      (memHeight.text <> '') and
                      (memVolume.text <> '');
end;

procedure TPBMaintPackageSizeFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPackageSizeFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPackageSizeFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPackageSizeFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      ParamByName('Package_Size').AsInteger := iCode;
      ParamByName('Package_Size_Description').AsString := DescrEdit.Text + '';
      ParamByName('Depth_mm').Asinteger := strtoint(memDepth.text);
      ParamByName('Width_mm').Asinteger := strtoint(memWidth.text);
      ParamByName('Height_mm').Asinteger := strtoint(memHeight.text);
      ParamByName('Quantity_per_Cage').Asinteger := strtoint(memVolume.text);
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
        ParamByName('Package_Size').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintPackageSizeFrm.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPackageSizeFrm.UnitFactorEditKeyPress(Sender: TObject;
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

procedure TPBMaintPackageSizeFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Package_Size ' +
            '(Package_Size,Package_Size_Description) ' +
            'VALUES(''0'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintPackageSizeFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Package_Size Where Package_Size = ''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintPackageSizeFrm.GetNextKey: integer;
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
      Result := FieldByName('Package_Size').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintPackageSizeFrm.memDepthKeyPress(Sender: TObject;
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

end.
