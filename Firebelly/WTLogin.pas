unit WTLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, ExtCtrls, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLogin = class(TForm)
    UserEdit: TEdit;
    Label1: TLabel;
    PasswordEdit: TEdit;
    Label2: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetOperatorSQL: TFDQuery;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    lblLogInto: TLabel;
    cmbAliasList: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UserEditChange(Sender: TObject);
    procedure PasswordEditChange(Sender: TObject);
    procedure CompLogoImageDblClick(Sender: TObject);
    procedure ShowDataBase(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    iLoginTries: Integer;
    sDBase: string[1];
    FOK: Boolean;
    FOperator: Integer;
    FOperator_Name, FsFaxSystem: string;
    fRep: Integer;
    FEndUser: boolean;
    FOperator_Email: string;
    FOperator_Revenue_Centre: integer;
    procedure SetOK(const Value: Boolean);
    procedure SetOperator(const Value: Integer);
    procedure SetOperator_Name(const Value: string);
    procedure SetsFax_System(const Value: string);
    procedure setRep(const Value: Integer);
    procedure SetEndUser(const Value: boolean);
    procedure SetOperator_Email(const Value: string);
    procedure SetOperator_Revenue_Centre(const Value: integer);
  public
    property EndUser: boolean read FEndUser write SetEndUser;
    property OK: Boolean read FOK write SetOK;
    property Operator: Integer read FOperator write SetOperator;
    property Operator_Email: string read FOperator_Email write SetOperator_Email;
    property Operator_Name: string read FOperator_Name write SetOperator_Name;
    property Operator_Revenue_Centre: integer read FOperator_Revenue_Centre write SetOperator_Revenue_Centre;
    property sFaxSystem: string read FsFaxSystem write SetsFax_System;
    property Rep: Integer read fRep write setRep;
  end;

var
  frmWTLogin: TfrmWTLogin;

implementation

uses wtDataModule, WTEnvSel;

{$R *.DFM}

procedure TfrmWTLogin.FormActivate(Sender: TObject);
var
  TempArray: array[0..255] of Char;
  iAliasList: integer;
  sgList: TStringList;
begin
  GetPrivateProfileString('Quaystone', 'LoginAlias', 'myWorktops', TempArray,
    sizeof(TempArray), 'myworktops.ini');

  cmbAliasList.clear;
  sgList := TStringList.Create;
  try
    FDManager.GetConnectionDefNames(sgList);
    { fill a list box with alias names for the user to select from }
    for iAliasList := 0 to sgList.Count - 1 do
      if (pos('Worktop',sgList[iAliasList]) > 0) or (pos('worktop',sgList[iAliasList]) > 0) then
        cmbAliasList.Items.Add(sgList[iAliasList]);

    cmbAliasList.Sorted := true;
    cmbAliasList.ItemIndex := cmbAliasList.items.indexof(temparray);
    if cmbAliasList.ItemIndex < 0 then
      cmbAliasList.ItemIndex := 0;
    cmbAliasList.visible := (cmbAliasList.Items.Count > 1);
    lblLoginto.visible := (cmbAliasList.Items.Count > 1);
  finally
    sgList.Free;
  end;

  Edit1.Text := TempArray;
  sDBase := Edit1.Text;
  ShowDataBAse(Self);
  GetPrivateProfileString('Quaystone', 'Fax System', 'S', TempArray,
    sizeof(TempArray), 'myworktops.ini');
  Edit1.Text := TempArray;
  FsFaxSystem := Edit1.Text;
  OK := False;
  iLoginTries := 0;
  PassWordEdit.SetFocus;
end;

procedure TfrmWTLogin.OKBitBtnClick(Sender: TObject);
begin
(*  if sDBase = 'L' then
    dtmdlWorktops.dtbsWorktops.ConnectionDefName := 'Worktop'
  else
  if sDBase = 'T' then
    dtmdlWorktops.dtbsWorktops.ConnectionDefName := 'Worktop';
*)
  dtmdlWorktops.dtbsWorktops.Connected := false;
  if cmbAliasList.Text = '' then
    dtmdlWorktops.dtbsWorktops.ConnectionDefName := 'Worktop'
  else
    dtmdlWorktops.dtbsWorktops.ConnectionDefName := cmbAliasList.Text;

  try
    with GetOperatorSQL do
    begin
//    Un-comment following two lines to test exception handling
//      if UserEdit.Text = 'FAIL' then
//        Raise Exception.Create('Interface mismatch. Engine version different.');
      Close;
      ParamByName('Login_Name').AsString := UserEdit.Text;
      Open;

      if FieldByName('Operator_Can_Login').AsString <> 'Y' then
      begin
        MessageDlg('Sorry - your user account is disabled', mtError, [mbOK], 0);
        Close;
        Application.Terminate;
        Exit;
      end;

      {Check that password field exists}
      try
        if (trim(FieldByName('Login_Password').AsString) <> '') and (trim(FieldByName('Login_Password').AsString) <> PasswordEdit.text) then
          begin
            MessageDlg('The logon name and password entered are not recognised', mtError, [mbOK], 0);
            PasswordEdit.Text := '';
            PassWordEdit.SetFocus;
            Exit;
          end;
      except
      end;

      Operator := FieldByName('Operator').AsInteger;
      Operator_Name := FieldByName('Operator_Name').AsString;
      Operator_Email := FieldByName('Email_Address').AsString;
      
      try
        Operator_Revenue_Centre := FieldByName('Revenue_Centre').Asinteger;
      except
        Operator_Revenue_Centre := 0;
      end;

      try
        EndUser := (FieldByName('End_User').AsString = 'Y');
      except
        EndUser := false;
      end;
    end;
  except
    on E: Exception do
    begin
      if Pos('INTERFACE MISMATCH', UpperCase(E.Message)) > 0 then
      begin
        MessageDlg('The version of software you are using is incompatible ' +#13
          + 'with this program.  Contact your vendor for more information ' +#13
          + 'on upgrading to the latest release(s).' + #13+#13
          + 'Error detected was: ' + E.Message,
          mtError, [mbAbort], 0);
        Close;
        Exit;
      end;
      MessageDlg('Invalid login', mtError, [mbOK], 0);
      PassWordEdit.SetFocus;
      iLoginTries := iLoginTries + 1;
      if iLoginTries > 3 then
      begin
        MessageDlg('You have exceeded the maximum number of login tries',
          mtError, [mbAbort], 0);
        Close;
      end;
      Exit;
    end;
  end;
  OK := True;
  Close;
end;

procedure TfrmWTLogin.UserEditChange(Sender: TObject);
begin
  OKBitBtn.Enabled := (UserEdit.Text <> '') and (PasswordEdit.Text <> '');
end;

procedure TfrmWTLogin.PasswordEditChange(Sender: TObject);
begin
  OKBitBtn.Enabled := (UserEdit.Text <> '') and (PasswordEdit.Text <> '');
end;

procedure TfrmWTLogin.CompLogoImageDblClick(Sender: TObject);
var
  TempAlias: array[0..255] of Char;
begin
  {Database change};
  frmWTEnvSel := TfrmWTEnvSel.Create(Self);
  try
  if sDBase = 'L' then
    frmWTEnvSel.DBRadioGroup.ItemIndex := 0
  else
  if sDBase = 'T' then
    frmWTEnvSel.DBRadioGroup.ItemIndex := 1;
  frmWTEnvSel.FaxSystemRadioGroup.ItemIndex := Pos(FsFaxSystem,'SW') - 1 ;
  frmWTEnvSel.ShowModal;
  if frmWTEnvSel.ModalResult = mrOK then
  begin
    case frmWTEnvSel.DBRadioGroup.ItemIndex of
      0: TempAlias := 'L';
      1: TempAlias := 'T';
    end;
    Edit1.Text := TempAlias;
    sDBase := Edit1.Text;
    ShowDataBase(Self);
    WritePrivateProfileString('Quaystone', 'DBAlias', TempAlias,
      'myworktops.ini');
    case frmWTEnvSel.FaxSystemRadioGroup.ItemIndex of
      0: TempAlias := 'S';
      1: TempAlias := 'W';
    end;
    Edit1.Text := TempAlias;
    FsFaxSystem := Edit1.Text;
    WritePrivateProfileString('Quaystone', 'Fax System', TempAlias,
      'myworktops.ini');
  end;
  finally
    frmWTEnvSel.Free;
  end;
end;

procedure TfrmWTLogin.ShowDataBase(Sender: TObject);
begin
  if sDBase = 'L' then
    Caption := 'Login To Live DataBase'
  else
  if sDBase = 'T' then
    Caption := 'Login To Test DataBase';
end;

procedure TfrmWTLogin.SetOK(const Value: Boolean);
begin
  FOK := Value;
end;

procedure TfrmWTLogin.SetOperator(const Value: Integer);
begin
  FOperator := Value;
end;

procedure TfrmWTLogin.SetOperator_Name(const Value: string);
begin
  FOperator_Name := Value;
end;

procedure TfrmWTLogin.SetsFax_System(const Value: string);
begin
  FsFaxSystem := Value;
end;

procedure TfrmWTLogin.setRep(const Value: Integer);
begin
  fRep := Value;
end;

procedure TfrmWTLogin.FormDeactivate(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      WriteString('Quaystone', 'LoginAlias', cmbAliasList.text);
    end;

end;

procedure TfrmWTLogin.SetEndUser(const Value: boolean);
begin
  FEndUser := Value;
end;

procedure TfrmWTLogin.SetOperator_Email(const Value: string);
begin
  FOperator_Email := Value;
end;

procedure TfrmWTLogin.SetOperator_Revenue_Centre(const Value: integer);
begin
  FOperator_Revenue_Centre := Value;
end;

end.
