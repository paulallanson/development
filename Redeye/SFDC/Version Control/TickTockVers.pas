unit TickTockVers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ShellAPI, ComCtrls, CCSCommon;

type
  TTickTockVersFrm = class(TForm)
    StatusLabel: TLabel;
    Edit1: TEdit;
    ProgressBar1: TProgressBar;
    procedure FormActivate(Sender: TObject);
    procedure StatusNarr(Narr: String);
    procedure BackupIfNewer(FName, FDesc: String);
    procedure CopyIfNewer(FName, FDesc: String);
    procedure CopyIfNewerINI(FName, FNewName, FDesc: String);
    procedure filecopy(const sourcefilename,targetfilename :string);
    procedure CreateBrokerDir(DirName: String);
  private
    { Private declarations }
    BackupDir, ServDir, LocalDir, WindowsDir: String;
    procedure AppendtoINIfile(FName, FNewName: String);
    procedure CreateINIfile(FName: String);
  public
    { Public declarations }
  end;

var
  TickTockVersFrm: TTickTockVersFrm;

implementation

{$R *.DFM}

procedure TTickTockVersFrm.FormActivate(Sender: TObject);
Var
FiName, DiName: Array [0..255] of char ;
begin
  if (FindWindow('TfrmFPMainMenu', 'Shop Floor Data Collection') <> 0) then
  begin
    MessageDlg('The Data Capture application is already running', mtError,
      [mbAbort], 0);
    Application.Terminate;
    exit;
  end;

	{Setup the directories}
	ServDir := '\\FPSERVER1\MIS\FMM' ;

  {[User Specific]\Application Data}
	LocalDir := GetSpecialFolderPath(2)+'\Broker';

  WindowsDir := GetWinDir;

  {Test that the Directory exists, if not then construct}
  if not DirectoryExists(LocalDir) then
  	begin
     	CreateBrokerDir(LocalDir);
  	end;

	TickTockVersFrm.Refresh ;

	{Do the actual program} ;
	StatusNarr('Checking Data Capture Program') ;
	CopyIfNewer('ticktock.exe', 'Data Capture Program') ;

(*  {Create the INI file}
  CreateINIfile(TfrmpbMainMenu.AppIniFile);

  {Do the Broker ini file} ;
	try
    StatusNarr('Checking Broker INI File') ;
	  CopyIfNewerINI('Broker.ini', 'Broker.ini', 'Broker INI File') ;
    AppendtoINIfile('Broker.ini',TfrmpbMainMenu.AppIniFile);
  except
  end;

	{Do the data collection ini file} ;
	try
    StatusNarr('Checking Data Capture INI File') ;
	  CopyIfNewerINI('datacollect.ini', 'datacollect.ini', 'Data Capture INI File') ;
  except
  end;
*)

	StrPCopy(FiName, LocalDir + '\ticktock.exe') ;
	StrPCopy(DiName ,LocalDir) ;
	ShellExecute(0,nil,FiName,'', DiName, sw_Restore) ;
	Application.Terminate ;
end;

procedure TTickTockVersFrm.StatusNarr(Narr: String);
begin
StatusLabel.Caption := Narr + '...' ;
StatusLabel.Refresh ;
end;

procedure TTickTockVersFrm.CreateBrokerDir(DirName: String);
var
	CheckName:string;
  ipos: integer;
begin
	ipos := 0;
	CheckName := DirName;
	{Find the First element of the Directory}
  while ipos <= length(DirName) do
  	begin
			iPos := pos('\',DirName);
      if ipos = 0
        then break;
      if ipos=3 then
        begin
          delete(DirName,3,1);
          insert('~',Dirname,3);
        end
      else
        begin
  			  if not DirectoryExists(copy(CheckName,1,ipos)) then
            CreateDir(copy(CheckName,1,ipos));
          delete(DirName,ipos,1);
        	insert('~',DirName,ipos);
        end;
     end;
end;

procedure TTickTockVersFrm.CopyIfNewer(FName, FDesc: String);
begin
  {Check if server version of file is older or same. If it is don't copy it} ;
  if FileAge(ServDir + '\' + FName) <= FileAge(LocalDir + '\' + FName) then exit ;
  {If the local directory does not exist, create it} ;
  If DirectoryExists(LocalDir) = False then
          CreateDir(LocalDir) ;
  StatusNarr('Upgrading ' + FDesc + ' - Please wait...') ;
  FileCopy(ServDir + '\' + FName, LocalDir + '\' + FName) ;
end;

procedure TTickTockVersFrm.CopyIfNewerINI(FName, FNewName, FDesc: String);
begin
  {Check if server version of file is older or same. If it is don't copy it} ;
  if FileAge(WindowsDir + '\' + FName) <= FileAge(LocalDir + '\' + FNewName) then exit ;
  {If the local directory does not exist, create it} ;
  if DirectoryExists(LocalDir) = False then
          CreateDir(LocalDir) ;
  StatusNarr('Upgrading ' + FDesc + ' - Please wait...') ;
  FileCopy(WindowsDir + '\' + FName, LocalDir + '\' + FNewName) ;
end;

procedure TTickTockVersFrm.BackupIfNewer(FName, FDesc: String);
begin
  {Check if server version of file is older or same. If it is don't copy it} ;
  if FileAge(LocalDir + '\' + FName) <= FileAge(BackupDir + '\' + FName) then exit ;
  {If the local directory does not exist, create it} ;
  If DirectoryExists(BackupDir) = False then
          CreateDir(BackupDir) ;
  StatusNarr('Backing up ' + FDesc + ' - Please wait...') ;
  FileCopy(LocalDir + '\' + FName, BackupDir + '\' + FName) ;
end;

procedure TTickTockVersFrm.CreateINIfile(FName: String);
var
  tempfilename: string;
  NewIniFile: textFile;
begin
  if DirectoryExists(LocalDir) = False then
    CreateDir(LocalDir);
  tempFileName := LocalDir + '\' + FName;
  assignFile(NewIniFile, tempfileName);
  rewrite(NewIniFile);
  CloseFile(NewIniFile);
end;

procedure TTickTockVersFrm.AppendtoINIfile(FName, FNewName: String);
var
  tempfilename: string;
  NewIniFile, OldIniFile: textFile;
  IniLine: String;
begin
  tempFileName := LocalDir + '\' + FNewName;
  assignFile(NewIniFile, tempfileName);
  Reset(NewIniFile);

  tempFileName := LocalDir + '\' + FName;
  assignFile(OldIniFile, tempfileName);
  Reset(OldIniFile);

  Append(NewIniFile);
  While Not EOF(OldIniFile) do
    begin
      ReadLn(oldIniFile, IniLine);
      writeln(NewIniFile, IniLine);
      Flush(NewIniFile);  { ensures that the text was actually written to file }
    end;
  CloseFile(NewIniFile);
end;

procedure TTickTockVersFrm.filecopy(const sourcefilename,targetfilename :string);
var
s,t:tfilestream;
BytesToCopy: Integer ;
begin
progressbar1.position := 0 ;
progressbar1.visible := True ;
     if fileexists(targetfilename) = true then
        if deletefile(targetfilename) = false then
           messagedlg('Problem Deleting Local Copy',mterror,[mbok],0) ;
     s:=tfilestream.create(sourcefilename,fmOpenread);
     progressbar1.max := Trunc(s.size / 10000) ;
     try
        t:=tfilestream.create(targetfilename,fmcreate);
        try
           While s.position < s.size do
                 begin
                 progressbar1.position := Trunc(s.position / 10000);
                 TickTockVersFrm.refresh ;
                 If (s.size - s.position) < 10000 then
                    BytesToCopy := s.size - s.position
                 else
                    BytesToCopy := 10000 ;
                 t.copyfrom(s,BytesToCopy);
                 end;
        finally
               t.free;
        end;
     finally
            s.free;
     end;
end;

end.
