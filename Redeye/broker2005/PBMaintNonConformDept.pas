unit PBMaintNonConformDept;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintNonConformDeptFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    qryZero: TFDQuery;
    Label1: TLabel;
    edtDescription: TEdit;
    chkbxActive: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
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
  PBMaintNonConformDeptFrm: TPBMaintNonConformDeptFrm;

implementation

uses UITypes, pbDatabase, pbMainMenu, PBLUNonConformDept, ActiveX;

{$R *.DFM}

procedure TPBMaintNonConformDeptFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Non Conformance Department';
  if sFuncMode = 'C' then
    Caption := 'Change a Non Conformance Department';
  if sFuncMode = 'D' then
    Caption := 'Delete a Non Conformance Department';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    edtDescription.Text := '';
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLUNonConformDeptFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Non_Conform_Dept').AsInteger;
      edtDescription.Text := FieldByName('Non_Conform_Dept_Descr').AsString;
      chkBxActive.Checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;
  {Enable or disable the buttons}
  if sFuncMode <> 'D' then
    edtDescription.setfocus ;

  edtDescription.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuNonConformance',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintNonConformDeptFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtDescription.Text <> '');
end;

procedure TPBMaintNonConformDeptFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintNonConformDeptFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintNonConformDeptFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintNonConformDeptFrm.OKBitBtnClick(Sender: TObject);
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
      ParamByName('Non_Conform_Dept').AsInteger := iCode;
      ParamByName('Non_Conform_Dept_Descr').AsString := edtDescription.Text + '';
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
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      DoDelete;
  end;
end;

procedure TPBMaintNonConformDeptFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Non_Conform_Dept ' +
            '(Non_Conform_Dept,Non_Conform_Dept_Descr) ' +
            'VALUES(0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintNonConformDeptFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Non_Conform_Dept Where Non_Conform_Dept=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintNonConformDeptFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert Non Conformance Department record
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
      Result := FieldByName('Non_Conform_Dept').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintNonConformDeptFrm.DoDelete;
begin
  try
    with DelSQL do
    begin
      SQL.Clear;
      SQL.Add('Delete From Non_Conform_Dept ' +
            'Where Non_Conform_Dept=' + IntToStr(iCode));
      ExecSQL;
    end;
  except
    {set to inactive and save}
    with UpdSQL do
    begin
      Close;
      ParamByName('Non_Conform_Dept').AsInteger := iCode;
      ParamByName('Non_Conform_Dept_Descr').AsString := edtDescription.Text + '';
      ParamByName('InActive').AsString := 'Y';
      ExecSQL;
    end;
  end;
end;

end.
