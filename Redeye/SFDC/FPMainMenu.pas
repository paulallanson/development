unit FPMainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, DBTables, Grids, DBGrids;

type
  TfrmFPMainMenu = class(TForm)
    stsbrMainMenu: TStatusBar;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
  private
    FActivated: boolean;
    MaxUsers: integer;
    LocalDir, LocalDrive: string;
    sSoft_Version, sSoft_subVersion: string;
    UserName: string;
  public
    ioperator: integer;
    sCompName, sOperator_name, sDataBaseDescr: string;
    AppIniFile: Array [0..255] of char;
    procedure ExportToExcel(tmpForm: TForm);
  end;

var
  frmFPMainMenu: TfrmFPMainMenu;

implementation

uses PBLogin, PBImages, PBDatabase, SFMaintJobLog, SFLUJobLog,
  PBSendtoExcel, CCSCommon, SFMaintSettings;

{$R *.dfm}

procedure TfrmFPMainMenu.FormActivate(Sender: TObject);
var
  LoginFormOK                 : ByteBool;
  TempLogin, TempComputer                     : array[0..255] of Char;
  TempLoginSize, TempComputerSize             : DWORD;
begin
  MaxUsers := 100;
  if not FActivated then
    begin
      LocalDrive := copy(GetWinSysDir,1,2);
      frmPBLogin := TfrmPBLogin.Create(Self);
      try
        frmPBLogin.UserEdit.Text := stsbrMainMenu.Panels[0].Text;
        frmPBLogin.ShowModal;
        LoginFormOK := frmPBLogin.OK;
        if LoginFormOK then
        begin
          UserName := frmPBLogin.UserEdit.Text;
          stsbrMainMenu.Panels[0].Text := UserName;
          ioperator := frmPBLogin.Operator;
          sOperator_name := frmPBLogin.Operator_name;
          sDataBaseDescr := frmPBLogin.Caption;

          TempComputerSize := SizeOf(TempComputer);
          GetComputerName(Addr(TempComputer), TempComputerSize);
          sCompName := TempComputer;

        end;
      finally
        frmPBLogin.Free;
      end;
      if not LoginFormOK then
        Application.Terminate
      else
        begin
          {Get user and password from login screen}
          TempLoginSize := SizeOf(TempLogin);
          GetUserName(Addr(TempLogin), TempLoginSize);
          stsbrMainMenu.Panels[0].Text := TempLogin;
          {Check Database Version}
//          CheckDBVersion;
          Factivated := true;
        end;
    end;
end;

procedure TfrmFPMainMenu.FormCreate(Sender: TObject);
var
  TempUser                    : array[0..255] of Char;
  TempUserSize                : DWORD;
begin
  LocalDrive := copy(GetWinSysDir,1,2);
	LocalDir := extractfilepath(application.ExeName);

  if pos('Application Data',LocalDir) > 0 then
    StrPCopy(AppIniFile,LocalDir+'datacollect.ini')
  else
    StrPCopy(AppIniFile,'datacollect.ini');

  TempUserSize := SizeOf(TempUser);
  GetUserName(Addr(TempUser), TempUserSize);
  stsbrMainMenu.Panels[0].Text := TempUser;

  sSoft_Version := '2009';
  sSoft_subVersion := '/Nov26b';
  stsbrMainMenu.Panels[1].text := 'Version: '+sSoft_Version+sSoft_subversion;
end;

procedure TfrmFPMainMenu.Button1Click(Sender: TObject);
begin
  SFMaintJobLogFrm := TSFMaintJobLogFrm.create(self);
  try
    SFMaintJobLogFrm.sFuncMode := 'A';
    SFMaintJobLogFrm.showmodal;
  finally
    SFMaintJobLogFrm.free;
  end;
end;

procedure TfrmFPMainMenu.Button2Click(Sender: TObject);
begin
  SFLUJobLogFrm := TSFLUJobLogFrm.create(self);
  try
    SFLUJobLogFrm.showmodal;
  finally
    SFLUJobLogFrm.free;
  end;

end;

procedure TfrmFPMainMenu.ExportToExcel(tmpForm: TForm);
var
  icount: integer;
  tmpGrid: TDBGrid;
begin
  for icount := 0 to pred(tmpForm.ComponentCount) do
    begin
      if tmpForm.Components[icount] is TDBGrid then
        begin
          tmpGrid := (tmpForm.Components[icount] as TDBGrid);

          frmPBSendtoExcel := TfrmPBSendtoExcel.create(self);
          try
            frmPBSendtoExcel.ExportDBGrid := tmpGrid;
            frmPBSendtoExcel.ExportFormCaption := tmpForm.caption;
            frmPBSendtoExcel.show;
          finally
            frmPBSendtoExcel.free;
          end;
          exit;
        end;
    end;
end;
procedure TfrmFPMainMenu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
(*
  if MessageDlg('Close the application?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      Action := caFree;

    end
  else
    Action := caNone;
*)
end;

procedure TfrmFPMainMenu.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TfrmFPMainMenu.FormDblClick(Sender: TObject);
begin
  SFMaintSettingsFrm := TSFMaintSettingsFrm.create(self);

  try
    SFMaintSettingsFrm.showmodal;
  finally
    SFMaintSettingsFrm.free;
  end;
end;

end.
