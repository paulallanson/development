unit PBMaintQAOperator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, StdCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintQAOperatorFrm = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    AddSQL: TFDQuery;
    DelLabel: TLabel;
    detsgrpbox: TGroupBox;
    Label1: TLabel;
    chkbxActive: TCheckBox;
    UpdSQL: TFDQuery;
    qryZero: TFDQuery;
    DelSQL: TFDQuery;
    GetLastSQL: TFDQuery;
    btnProcessClear: TBitBtn;
    edtEmployeeName: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FOldValue: string;
    procedure AddZero;
    procedure DelZero;
    function GetNextDbKey: integer;
  public
    iCode: integer;
    iOperator: integer;
    sFuncMode: string;
  end;

var
  PBMaintQAOperatorFrm: TPBMaintQAOperatorFrm;

implementation

uses pbDatabase, ComObj, ActiveX, pbMainMenu, PBLUQAOperator, PBLUOps;

{$R *.dfm}

procedure TPBMaintQAOperatorFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add new Quality Assurance details';
  if sFuncMode = 'C' then
    Caption := 'Change Quality Assurance details';
  if sFuncMode = 'D' then
    Caption := 'Delete Quality Assurance details';
  if sFuncMode = 'A' then
    begin
      edtEmployeeName.text := '';
      chkbxActive.Checked := true;
      edtEmployeeName.setfocus;
    end
  else
    begin
      with PBLUQAOperatorfrm.DetsSRC.DataSet do
        begin
          iCode := FieldByName('QA_Operator').AsInteger;
          edtEmployeeName.Text := FieldByName('QA_Operator_Name').Asstring;
          ChkBxActive.Checked := not (fieldByName('InActive').AsString = 'Y');
          btnOK.Default := true;
        end;
    end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuNonConformance',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintQAOperatorFrm.CheckOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtEmployeename.Text <> '');
end;

procedure TPBMaintQAOperatorFrm.btnOKClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextDbKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('QA_Operator').AsInteger := iCode;
//      ParamByName('Name').AsString := trim(cmbName.Text);
      ParamByName('QA_Operator_Name').AsString := trim(edtEmployeeName.Text);
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
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    with DelSQL do
    begin
      Close;
      ParamByName('QA_Operator').AsInteger := iCode;
      ExecSQL;
    end;
  end;
end;

procedure TPBMaintQAOperatorFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into QA_Operator (QA_Operator, QA_Operator_Name) VALUES (0,'' '') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintQAOperatorFrm.DelZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From QA_Operator Where QA_Operator = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintQAOperatorFrm.GetNextDbKey: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
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
      Result := FieldByName('QA_Operator').AsInteger;
      Close;
    end;
  finally
    DelZero;
  end;
end;

end.
