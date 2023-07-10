unit WorktopsVers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ShellAPI, ComCtrls, AllCommon, gtQrCtrls;

type
  TfrmWorktopsVers = class(TForm)
    StatusLabel: TLabel;
    Edit1: TEdit;
    ProgressBar1: TProgressBar;
    procedure FormActivate(Sender: TObject);
    procedure StatusNarr(Narr: String);
    procedure CopyIfNewer(FName, FDesc: String);
    procedure filecopy(const sourcefilename,targetfilename :string);
    procedure CreateBrokerDir(DirName: String);
  private
    { Private declarations }
    ServDir, LocalDir, LocalDrive: String;
  public
    { Public declarations }
  end;

var
  frmWorktopsVers: TfrmWorktopsVers;

implementation

{$R *.DFM}

procedure TfrmWorktopsVers.FormActivate(Sender: TObject);
Var
FiName, DiName: Array [0..255] of char ;
begin
	{Setup the directories}
	ServDir := '\\ADSERVER1\myWorktops' ;

  LocalDrive := copy(GetWinSysDir,1,2);
	LocalDir := LocalDrive + '\Program Files\Quaystone\myWorktops' ;

  {Test that the Directory exists, if not then contruct}
  if not DirectoryExists(LocalDir) then
  	begin
     	CreateBrokerDir(LocalDir);
  	end;
	frmWorktopsVers.Refresh ;
	{Test the bitmaps} ;
	StatusNarr('Checking Logos') ;
	CopyIfNewer('wtHeadLogo.Bmp', 'Report Logo') ;
	CopyIfNewer('wtFootLogo.Bmp', 'Report Logo') ;
	{Do the actual program} ;
	StatusNarr('Checking Worktop Program') ;
	CopyIfNewer('Worktops.exe', 'Worktop Program') ;
	CopyIfNewer('allfax.exe', 'Fax Program') ;
	StrPCopy(FiName, LocalDir + '\Worktops.exe') ;
	StrPCopy(DiName ,LocalDir) ;
	ShellExecute(0,nil,FiName,'', DiName, sw_Restore) ;
	Application.Terminate ;
end;

procedure TfrmWorktopsVers.StatusNarr(Narr: String);
begin
StatusLabel.Caption := Narr + '...' ;
StatusLabel.Refresh ;
end;

procedure TfrmWorktopsVers.CreateBrokerDir(DirName: String);
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
        if ipos = 0 then break;
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

procedure TfrmWorktopsVers.CopyIfNewer(FName, FDesc: String);
begin
{Check if server version of file is older or same. If it is don't copy it} ;
if FileAge(ServDir + '\' + FName) <= FileAge(LocalDir + '\' + FName) then exit ;
{If the local directory does not exist, create it} ;
If DirectoryExists(LocalDir) = False then
          CreateDir(LocalDir) ;
StatusNarr('Upgrading ' + FDesc + ' - Please wait...') ;
FileCopy(ServDir + '\' + FName, LocalDir + '\' + FName) ;
end;

procedure TfrmWorktopsVers.filecopy(const sourcefilename,targetfilename :string);
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
                 frmWorktopsVers.refresh ;
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
