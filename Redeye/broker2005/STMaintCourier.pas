unit STMaintCourier;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, DBCtrls, DB, DBTables;

type
  TSTMaintCourierFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DelLabel: TLabel;
    CheckExistsSQL: TQuery;
    GetLastOpSQL: TQuery;
    AddOpSQL: TQuery;
    UpdOpSQL: TQuery;
    DelOpSQL: TQuery;
    qryZero: TQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    NameEdit: TEdit;
    AccountEdit: TEdit;
    Label2: TLabel;
    edtFileType: TEdit;
    Label3: TLabel;
    chkbxAddressRequired: TCheckBox;
    chkbxAccountCodeMandatory: TCheckBox;
    chkbxActive: TCheckBox;
    chkbxReturnAddress: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure AccountEditChange(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    function CheckIfExists(sTempLogin: string; iTempOpCode: Integer): ByteBool;
  private
    { Private declarations }
    procedure AddZero;
    function GetLastOp : integer;
    procedure DeleteZero;
  public
    { Public declarations }
    sFuncMode: string[1];
    iSelCode, iCode: Integer;
  end;

var
  STMaintCourierFrm: TSTMaintCourierFrm;

implementation

uses ComObj,ActiveX, pbDatabase;
{$R *.DFM}

procedure TSTMaintCourierFrm.FormActivate(Sender: TObject);
begin
  NameEdit.Enabled := (sFuncMode <> 'D');
  AccountEdit.Enabled := (sFuncMode <> 'D');
  edtFileType.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  if sFuncMode = 'A' then
    begin
      NameEdit.Text := '';
      AccountEdit.Text := '';
      chkbxAddressRequired.checked := true;
      chkbxReturnAddress.checked := false;
      ChkBxActive.Checked := True;
      icode := 0;
    end
  else
    begin
      iSelCode := 0;
    end;
  CheckOK(Self);
end;

procedure TSTMaintCourierFrm.AccountEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintCourierFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintCourierFrm.CheckOK(Sender: TObject);
begin
  OKBitBtn.Enabled := (AccountEdit.Text <> '') and (NameEdit.Text <> '');
end;

procedure TSTMaintCourierFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if CheckIfExists(NameEdit.Text, iCode) then
      Exit;
    if sFuncMode = 'A' then
      iCode :=  GetLastOp;
    with UpdOpSQL do
    begin
      ParamByName('Courier').AsInteger := iCode;
      ParamByName('Courier_Name').AsString := NameEdit.Text;
      ParamByName('Our_Account_Code').AsString := AccountEdit.Text;
      if edtFileType.Text <> '' then
        ParamByName('courier_file_type').asString := edtFileType.Text
      else
        ParamByName('courier_file_type').clear;
      if chkbxAddressRequired.checked then
        Parambyname('Delivery_Address_req').AsString := 'Y'
      else
        Parambyname('Delivery_Address_req').AsString := 'N';

      if chkbxReturnAddress.checked then
        Parambyname('Return_Address_Required').AsString := 'Y'
      else
        Parambyname('Return_Address_Required').AsString := 'N';
        
      if chkbxAccountCodeMandatory.checked then
        Parambyname('Customer_Account_Mandatory').AsString := 'Y'
      else
        Parambyname('Customer_Account_Mandatory').AsString := 'N';

      if chkbxActive.checked then
        Parambyname('Inactive').AsString := 'N'
      else
        Parambyname('Inactive').AsString := 'Y';
      ExecSQL;
    end;
    iSelCode := iCode;
  end
  else
  if sFuncMode = 'D' then
  begin
    with DelOpSQL do
    begin
      Close;
      ParamByName('Courier').AsInteger := iCode;
      ExecSQL;
    end;
    iSelCode := iCode;
  end;
  {If replicating Courier details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(10, iCode, 0, 0, sFuncMode);
    end;

  Close;
end;

function TSTMaintCourierFrm.CheckIfExists(sTempLogin: string; iTempOpCode:
  Integer): ByteBool;
begin
  with CheckExistsSQL do
  begin
    Close;
    ParamByName('Courier_Name').AsString := sTempLogin;
    ParamByName('Courier').AsInteger := iTempOpCode;
    Open;
    Result := (RecordCount > 0);
    if RecordCount > 0 then
      MessageDlg('This Courier Name already exists', mtError, [mbOK], 0);
  end;
end;

function TSTMaintCourierFrm.GetLastOp: integer;
var
  aGuid : TGuid;
begin
  { Get the next available slot in the Courier table using the unconditional
    GUID insert technique. }
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddOpSQL do
    begin
      ParamByname('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastOpSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Courier').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TSTMaintCourierFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO Courier (Courier, Courier_Name, Our_Account_Code)' +
            'VALUES(0, ''Dummy'', ''0'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TSTMaintCourierFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Courier WHERE Courier=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
