unit PBMaintWCOperator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, StdCtrls, Buttons, Spin,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintWCOperatorFrm = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    AddSQL: TFDQuery;
    qryProcessGroup: TFDQuery;
    dtsProcessGroup: TDataSource;
    DelLabel: TLabel;
    detsgrpbox: TGroupBox;
    Label1: TLabel;
    btnOperators: TBitBtn;
    edtEmployeeNo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    dblkpProcessGroup: TDBLookupComboBox;
    chkbxActive: TCheckBox;
    UpdSQL: TFDQuery;
    qryZero: TFDQuery;
    DelSQL: TFDQuery;
    GetLastSQL: TFDQuery;
    Label4: TLabel;
    dblkpProcess: TDBLookupComboBox;
    qryProcess: TFDQuery;
    dtsProcess: TDataSource;
    btnProcessClear: TBitBtn;
    edtEmployeeName: TEdit;
    qryGetOperator: TFDQuery;
    Label5: TLabel;
    memHourlyRate: TMemo;
    Label6: TLabel;
    spnNoOperators: TSpinEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CheckKeyIsFloat(Sender: TObject; var Key: Char);
    procedure btnOperatorsClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnProcessClearClick(Sender: TObject);
    procedure dblkpProcessGroupClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
  private
    FOldValue: string;
    procedure AddZero;
    procedure DelZero;
    function GetNextDbKey: integer;
    function GetOperatorNo(tmpName: string): integer;
  public
    iCode: integer;
    iOperator: integer;
    sFuncMode: string;
  end;

var
  PBMaintWCOperatorFrm: TPBMaintWCOperatorFrm;

implementation

uses pbDatabase, ComObj, ActiveX, pbMainMenu, PBLUWCOperator, PBLUOps;

{$R *.dfm}

procedure TPBMaintWCOperatorFrm.FormActivate(Sender: TObject);
begin
  qryProcessGroup.Active := false;
  qryprocessGroup.Active := true;

  iOperator := 0;

  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Operator';
  if sFuncMode = 'C' then
    Caption := 'Change an Operator';
  if sFuncMode = 'D' then
    Caption := 'Delete an Operator';
  if sFuncMode = 'A' then
    begin
      edtEmployeeName.text := '';
      edtEmployeeNo.Text := '';
      dblkpProcessGroup.KeyValue := 0;
      dblkpProcess.KeyValue := 0;
      chkbxActive.Checked := true;
      memHourlyRate.text := '0.00';
      spnNoOperators.Value := 1;
    end
  else
    begin
      with PBLUWCOperatorfrm.DetsSRC.DataSet do
        begin
          iCode := FieldByName('Work_Centre_Operator').AsInteger;
          iOperator := fieldbyname('Operator').asinteger;
          edtEmployeeName.Text := FieldByName('Name').Asstring;
          edtEmployeeNo.Text := fieldbyname('Employee_Number').asstring;
          dblkpProcessGroup.KeyValue := fieldbyname('Process_Group').asinteger;
          dblkpProcessGroupClick(self);
          dblkpProcess.KeyValue := fieldbyname('Process').asinteger;
          memHourlyRate.text := formatfloat('0.00',fieldbyname('Hourly_rate').asfloat);
          ChkBxActive.Checked := not (fieldByName('InActive').AsString = 'Y');
          spnNoOperators.value := fieldbyname('Operator_Count').asinteger;
          btnOK.Default := true;
        end;
    end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuWCOperators',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintWCOperatorFrm.CheckOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtEmployeename.Text <> '') and (memHourlyRate.Text <> '');
end;

procedure TPBMaintWCOperatorFrm.btnOperatorsClick(Sender: TObject);
begin
  PBLUOpsFrm := TPBLUOpsFrm.Create(Self);
  try
    PBLUOpsFrm.bIs_Lookup := False;
    PBLUOpsFrm.bAllow_Upd := True;
    PBLUOpsFrm.SelCode := iOperator;
    PBLUOpsFrm.ShowModal;
    if PBLUOpsFrm.Selected then
    begin
      edtEmployeeName.text := PBLUOpsFrm.SelName;
    end;
  finally
    PBLUOpsFrm.Free;
  end;

end;

procedure TPBMaintWCOperatorFrm.btnOKClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextDbKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Work_Centre_Operator').AsInteger := iCode;
//      ParamByName('Name').AsString := trim(cmbName.Text);
      ParamByName('Name').AsString := trim(edtEmployeeName.Text);
      ParamByName('Employee_number').AsString := trim(edtEmployeeNo.Text);
      if dblkpProcessGroup.text <> '' then
        ParamByName('Process_Group').Asinteger := dblkpProcessGroup.keyvalue
      else
        ParamByName('Process_Group').clear;

      if dblkpProcess.text <> '' then
        ParamByName('Process').Asinteger := dblkpProcess.keyvalue
      else
        ParamByName('Process').clear;

      iOperator := GetOperatorNo(edtEmployeeName.text);
      if iOperator <> 0 then
        ParamByName('Operator').Asinteger := iOperator
      else
        ParamByName('Operator').clear;

      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';

      parambyname('Hourly_Rate').asfloat := strtofloat(memHourlyRate.text);
      parambyname('Operator_Count').asinteger := spnNoOperators.Value;

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
      ParamByName('Work_Centre_Operator').AsInteger := iCode;
      ExecSQL;
    end;
  end;
end;

procedure TPBMaintWCOperatorFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Work_Centre_Operator (Work_Centre_Operator, Name) VALUES (0,'' '') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintWCOperatorFrm.DelZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Work_Centre_Operator Where Work_Centre_Operator = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintWCOperatorFrm.GetOperatorNo(tmpName: string): integer;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Name').asstring := tmpName;
      open;
      if recordcount > 0 then
        result := fieldbyname('Operator').asinteger
      else
        result := 0;
    end;
end;

function TPBMaintWCOperatorFrm.GetNextDbKey: integer;
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
      Result := FieldByName('Work_Centre_Operator').AsInteger;
      Close;
    end;
  finally
    DelZero;
  end;
end;

procedure TPBMaintWCOperatorFrm.btnProcessClearClick(Sender: TObject);
begin
  dblkpProcess.KeyValue := 0;
end;

procedure TPBMaintWCOperatorFrm.dblkpProcessGroupClick(Sender: TObject);
begin
  qryProcess.Active := false;
  qryprocess.Active := true;
  checkOK(self);
end;

procedure TPBMaintWCOperatorFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintWCOperatorFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
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
