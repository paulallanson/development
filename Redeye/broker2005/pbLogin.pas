unit PBLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, ExtCtrls, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmpbLogin = class(TForm)
    UserEdit: TEdit;
    Label1: TLabel;
    PasswordEdit: TEdit;
    Label2: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetOperatorSQL: TFDQuery;
    Edit1: TEdit;
    lblLogInto: TLabel;
    cmbAliasList: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UserEditChange(Sender: TObject);
    procedure PasswordEditChange(Sender: TObject);
    procedure ShowDataBase(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    iLoginTries: Integer;
    sDBase: string[1];
    FOK: Boolean;
    FOperator: Integer;
    FOperator_Name, FsFaxSystem: string;
    fRep: Integer;
    FOperator_Email: string;
    procedure SetOK(const Value: Boolean);
    procedure SetOperator(const Value: Integer);
    procedure SetOperator_Name(const Value: string);
    procedure SetsFax_System(const Value: string);
    procedure setRep(const Value: Integer);
    procedure SetOperator_Email(const Value: string);
  public
    property OK: Boolean read FOK write SetOK;
    property Operator: Integer read FOperator write SetOperator;
    property Operator_Email: string read FOperator_Email write SetOperator_Email;
    property Operator_Name: string read FOperator_Name write SetOperator_Name;
    property sFaxSystem: string read FsFaxSystem write SetsFax_System;
    property Rep: Integer read fRep write setRep;
  end;

var
  frmpbLogin: TfrmpbLogin;

implementation

uses
  pbMainMenu, PBDatabase, System.UITypes, CCSCommon;

{$R *.DFM}

procedure TfrmpbLogin.FormActivate(Sender: TObject);
var
  TempArray: array[0..255] of Char;
  iAliasList: integer;
  sgList: TStringList;
begin
  GetPrivateProfileString('Centrereed Broker', 'LoginAlias', 'Broker', TempArray, SizeOf(TempArray), TfrmpbMainMenu.AppIniFile);

  cmbAliasList.clear;
  sgList := TStringList.Create;
  try
    FDManager.GetConnectionDefNames(sgList);
    { fill a list box with alias names for the user to select from }
    for iAliasList := 0 to sgList.Count - 1 do
      if ((pos('Redeye',sgList[iAliasList]) > 0) or (pos('Redeye',sgList[iAliasList]) > 0) or
          (pos('Broker',sgList[iAliasList]) > 0) or (pos('broker',sgList[iAliasList]) > 0)) and
          (pos('ADO',sgList[iAliasList]) = 0) then
        cmbAliasList.Items.Add(sgList[iAliasList]);

    {$IFDEF PRINTGUY}
      cmbAliasList.clear;
      cmbAliasList.Items.Add('Redeye_Printguy');
    {$ENDIF}

    cmbAliasList.Sorted := true;
    cmbAliasList.ItemIndex := cmbAliasList.items.indexof(temparray);
    if cmbAliasList.ItemIndex < 0 then
      cmbAliasList.ItemIndex := 0;
    cmbAliasList.visible := (cmbAliasList.Items.Count > 1);
    lblLoginto.visible := (cmbAliasList.Items.Count > 1);
  finally
    sgList.Free;
  end;

  GetPrivateProfileString('Centrereed Broker', 'Fax System', 'S', TempArray, sizeof(TempArray), TfrmpbMainMenu.AppIniFile);
  Edit1.Text := TempArray;
  FsFaxSystem := Edit1.Text;

  OK := False;
  iLoginTries := 0;
  PassWordEdit.SetFocus;
end;

procedure TfrmpbLogin.OKBitBtnClick(Sender: TObject);
begin
(*  if sDBase = 'L' then
    dmBroker.PBLDatabase.ConnectionDefName := 'Broker'
  else
  if sDBase = 'T' then
    dmBroker.PBLDatabase.ConnectionDefName := 'BrokerTest';
*)
  if cmbAliasList.Text = '' then
    dmBroker.PBLDatabase.ConnectionDefName := 'Broker'
  else
    dmBroker.PBLDatabase.ConnectionDefName := cmbAliasList.Text;

  try
    with GetOperatorSQL do
    begin
//    Un-comment following two lines to test exception handling
//      if UserEdit.Text = 'FAIL' then
//        Raise Exception.Create('Interface mismatch. Engine version different.');
      Close;
      ParamByName('Login_Name').AsString := UserEdit.Text;
      Open;
      Operator := FieldByName('Operator').AsInteger;
      Operator_Name := FieldByName('Name').AsString;
      Operator_Email := FieldByName('Email').AsString;
      try
        Rep := FieldByName('Rep').AsInteger;
      except
        Rep := 0;
      end;

      if FieldByName('Operator_Can_Login').AsString <> 'Y' then
      begin
        MessageDlg('Sorry - your Broker account is disabled', mtError, [mbOK], 0);
        Close;
        Application.Terminate;
        Exit;
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

procedure TfrmpbLogin.UserEditChange(Sender: TObject);
begin
  OKBitBtn.Enabled := (UserEdit.Text <> '') and (PasswordEdit.Text <> '');
end;

procedure TfrmpbLogin.PasswordEditChange(Sender: TObject);
begin
  OKBitBtn.Enabled := (UserEdit.Text <> '') and (PasswordEdit.Text <> '');
end;

procedure TfrmpbLogin.ShowDataBase(Sender: TObject);
begin
  if sDBase = 'L' then
    Caption := 'Login To Live DataBase'
  else
  if sDBase = 'T' then
    Caption := 'Login To Test DataBase';
end;

procedure TfrmpbLogin.SetOK(const Value: Boolean);
begin
  FOK := Value;
end;

procedure TfrmpbLogin.SetOperator(const Value: Integer);
begin
  FOperator := Value;
end;

procedure TfrmpbLogin.SetOperator_Name(const Value: string);
begin
  FOperator_Name := Value;
end;

procedure TfrmpbLogin.SetsFax_System(const Value: string);
begin
  FsFaxSystem := Value;
end;

procedure TfrmpbLogin.setRep(const Value: Integer);
begin
  fRep := Value;
end;

procedure TfrmpbLogin.FormDeactivate(Sender: TObject);
var
  IniFile: TIniFile;
begin
  {$IFDEF PRINTGUY}
  exit;
  {$ENDIF}

  IniFile := TIniFile.Create(TfrmpbMainMenu.AppIniFile);
  try
    IniFile.WriteString('Centrereed Broker', 'LoginAlias', cmbAliasList.text);
  finally
    IniFile.Free;
  end;
end;

procedure TfrmpbLogin.FormShow(Sender: TObject);
begin
  {$IF DEFINED(GDK) AND DEFINED(DEBUG)}
  UserEdit.Text := 'sa';
  PasswordEdit.Text := ' ';
  {$ENDIF}
end;

procedure TfrmpbLogin.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbLogin.SetOperator_Email(const Value: string);
begin
  FOperator_Email := Value;
end;

end.
