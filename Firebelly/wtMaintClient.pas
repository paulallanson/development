unit wtMaintClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, DBCtrls, Inifiles, gtQrCtrls;

type
  TfrmWTMaintClient = class(TForm)
    AttachDirecEdit: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    CancelBitBtn: TBitBtn;
    ApplicDBLCB: TDBLookupComboBox;
    TypeDBLCB: TDBLookupComboBox;
    GetApplicQuery: TQuery;
    GetTypQuery: TQuery;
    GepApplicDataSource: TDataSource;
    GetDefTypDataSource: TDataSource;
    ApplicClrBitBtn: TBitBtn;
    AttachClrBitBtn: TBitBtn;
    DirectClrBitBtn: TBitBtn;
    Label4: TLabel;
    edtEMailAccount: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ApplicDBLCBClick(Sender: TObject);
    procedure TypeDBLCBClick(Sender: TObject);
    procedure AttachDirecEditChange(Sender: TObject);
    procedure ApplicClrBitBtnClick(Sender: TObject);
    procedure AttachClrBitBtnClick(Sender: TObject);
    procedure DirectClrBitBtnClick(Sender: TObject);
  private
    fAttachType: string;
    fDirec: string;
    fApplic: string;
    FAccountName: string;
    procedure setApplic(const Value: string);
    procedure setAttachType(const Value: string);
    procedure setDirec(const Value: string);
    procedure SetAccountName(const Value: string);
  private
    procedure getEmailDefaults;
    procedure WriteEmailDefaults;
    property AccountName: string read FAccountName write SetAccountName;
    property AttachType: string read fAttachType write setAttachType;
    property Applic: string read fApplic write setApplic;
    property Direc: string read fDirec write setDirec;
  { Private declarations }
  public
    { Public declarations }
    end;

var
  frmWTMaintClient: TfrmWTMaintClient;

implementation

uses  AllCommon, wtDataModule, wtMain;

{$R *.DFM}

procedure TfrmWTMaintClient.BitBtn1Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := AttachDirecEdit.Text;
    if DirDlg.Execute then
      AttachDirecEdit.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TfrmWTMaintClient.FormCreate(Sender: TObject);
begin
  GetEmailDefaults;
  GetTypQuery.Close;
  GetTypQuery.Open;
  GetApplicQuery.Close;
  GetApplicQuery.Open;

  AttachDirecEdit.Text := Direc;
end;

procedure TfrmWTMaintClient.getEmailDefaults;
var
  TempArray: array[0..255] of Char;
  sAliasName: string;
begin
  GetPrivateProfileString('Email', 'Application', '', TempArray,
    sizeof(TempArray), 'myworktops.ini');

  Applic := TempArray;

  GetPrivateProfileString('Email', 'DEF Attachment Type', '', TempArray,
    sizeof(TempArray), 'myworktops.ini');

  AttachType := TempArray;
  GetPrivateProfileString('Fax', 'DEF Fax Directory', '', TempArray,
    sizeof(TempArray), 'myworktops.ini');

  Direc := TempArray;

  sAliasName := dtmdlWorktops.dtbsWorktops.AliasName;

  GetPrivateProfileString('Email',  pchar(sAliasName + ' Email Account'), '', TempArray,
    sizeof(TempArray), frmWTMain.AppIniFile);

  AccountName := TempArray;

  AttachDirecEdit.Text := Direc;
  TypeDBLCB.Keyvalue := AttachType;
  ApplicDBLCB.KeyValue := Applic;
  edtEmailAccount.text := AccountName;
end;

procedure TfrmWTMaintClient.WriteEmailDefaults;
var
  IniFile : TIniFile;
  sAliasName: string;
begin
  sAliasName := dtmdlWorktops.dtbsWorktops.AliasName;

  IniFile := TIniFile.Create('myworktops.ini');

  with IniFile do
    begin
      WriteString('Email', 'Application',Applic);
      WriteString('Email', 'Def Attachment Type',AttachType);
      WriteString('Fax', 'Def Fax Directory',Direc);
      WriteString('Email', pchar(sAliasName + ' Email Account'), AccountName);
      Free;
    end;
end;


procedure TfrmWTMaintClient.BitBtn2Click(Sender: TObject);
begin
  AccountName := edtEmailAccount.Text;
  writeEmailDefaults;
end;

procedure TfrmWTMaintClient.setApplic(const Value: string);
begin
  fApplic := Value;
end;

procedure TfrmWTMaintClient.setAttachType(const Value: string);
begin
  fAttachType := Value;
end;

procedure TfrmWTMaintClient.setDirec(const Value: string);
begin
  fDirec := Value;
end;

procedure TfrmWTMaintClient.ApplicDBLCBClick(Sender: TObject);
begin
  Applic := ApplicDBLCB.keyvalue;
end;

procedure TfrmWTMaintClient.TypeDBLCBClick(Sender: TObject);
begin
  AttachType := TypeDBLCB.KeyValue;
end;

procedure TfrmWTMaintClient.AttachDirecEditChange(Sender: TObject);
begin
  Direc := AttachDirecEdit.Text
end;

procedure TfrmWTMaintClient.ApplicClrBitBtnClick(Sender: TObject);
begin
  ApplicDBLCB.KeyValue := 0;
  Applic := '';
end;

procedure TfrmWTMaintClient.AttachClrBitBtnClick(Sender: TObject);
begin
  TypeDBLCB.KeyValue := 0;
  AttachType := '';
end;

procedure TfrmWTMaintClient.DirectClrBitBtnClick(Sender: TObject);
begin
  AttachDirecEdit.Text := '';
end;

procedure TfrmWTMaintClient.SetAccountName(const Value: string);
begin
  FAccountName := Value;
end;

end.
