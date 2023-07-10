unit BrokerVers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ShellAPI, ComCtrls, CCSCommon;

type
  TBrokerVersFrm = class(TForm)
    StatusLabel: TLabel;
    Edit1: TEdit;
    ProgressBar1: TProgressBar;
    procedure FormActivate(Sender: TObject);
    procedure StatusNarr(Narr: String);
    procedure BackupIfNewer(FName, FDesc: String);
    procedure CopyIfNewer(FName, FDesc: String);
    procedure filecopy(const sourcefilename,targetfilename :string);
    procedure CreateBrokerDir(DirName: String);
  private
    { Private declarations }
    BackupDir, ServDir, LocalDir, LocalDrive, WindowsDir: String;
  public
    { Public declarations }
  end;

var
  BrokerVersFrm: TBrokerVersFrm;

implementation

{$R *.DFM}

procedure TBrokerVersFrm.FormActivate(Sender: TObject);
Var
FiName, DiName: Array [0..255] of char ;
begin
  if (FindWindow('TPBSendFaxFrm', 'Fax Send Form') <> 0) then
  begin
    MessageDlg('The Redeye application is already running', mtError,
      [mbAbort], 0);
    Application.Terminate;
    exit;
  end;

	{Setup the directories}
	ServDir := '\\GBRLON05AST040.eu.xerox.net\Redeye' ;

  {[User Specific]\Application Data}
	LocalDir := GetSpecialFolderPath(2)+'\Redeye';

  WindowsDir := GetWinDir;

  {Test that the Directory exists, if not then contruct}
  if not DirectoryExists(LocalDir) then
  	begin
     	CreateBrokerDir(LocalDir);
  	end;

	BrokerVersFrm.Refresh ;

	{Copy logo bitmaps} ;
	StatusNarr('Checking Logos') ;
	CopyIfNewer('PBRepLogo.Bmp', 'Report Logo') ;

	StatusNarr('Checking Logos') ;
	CopyIfNewer('PBRepLogo1.Bmp', 'Report Logo 1') ;

	StatusNarr('Checking Logos') ;
	CopyIfNewer('PBRepLogo2.Bmp', 'Report Logo 2') ;

	StatusNarr('Checking Logos') ;
	CopyIfNewer('PBRepLogo3.Bmp', 'Report Logo 3') ;

	StatusNarr('Checking Fax Viewer') ;
	CopyIfNewer('csFax.exe', 'Fax Viewer') ;

	StatusNarr('Checking Page Designer') ;
	CopyIfNewer('pagedesigner.exe', 'Page Designer') ;

	{Do the actual program} ;
	StatusNarr('Checking Redeye Program') ;
	CopyIfNewer('Redeye.exe', 'Redeye Program') ;

	StrPCopy(FiName, LocalDir + '\Redeye.exe') ;
	StrPCopy(DiName ,LocalDir) ;
	ShellExecute(0,nil,FiName,'', DiName, sw_Restore) ;
	Application.Terminate ;
end;

procedure TBrokerVersFrm.StatusNarr(Narr: String);
begin
StatusLabel.Caption := Narr + '...' ;
StatusLabel.Refresh ;
end;

procedure TBrokerVersFrm.CreateBrokerDir(DirName: String);
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

procedure TBrokerVersFrm.CopyIfNewer(FName, FDesc: String);
begin
  {Check if server version of file is older or same. If it is don't copy it} ;
  if FileAge(ServDir + '\' + FName) <= FileAge(LocalDir + '\' + FName) then exit ;
  {If the local directory does not exist, create it} ;
  If DirectoryExists(LocalDir) = False then
          CreateDir(LocalDir) ;
  StatusNarr('Upgrading ' + FDesc + ' - Please wait...') ;
  FileCopy(ServDir + '\' + FName, LocalDir + '\' + FName) ;
end;

procedure TBrokerVersFrm.BackupIfNewer(FName, FDesc: String);
begin
  {Check if server version of file is older or same. If it is don't copy it} ;
  if FileAge(LocalDir + '\' + FName) <= FileAge(BackupDir + '\' + FName) then exit ;
  {If the local directory does not exist, create it} ;
  If DirectoryExists(BackupDir) = False then
          CreateDir(BackupDir) ;
  StatusNarr('Backing up ' + FDesc + ' - Please wait...') ;
  FileCopy(LocalDir + '\' + FName, BackupDir + '\' + FName) ;
end;

procedure TBrokerVersFrm.filecopy(const sourcefilename,targetfilename :string);
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
                 BrokerVersFrm.refresh ;
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
