unit FirebellyVers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ShellAPI, ComCtrls, AllCommon;

type
  TfrmFirebellyVers = class(TForm)
    StatusLabel: TLabel;
    Edit1: TEdit;
    ProgressBar1: TProgressBar;
    procedure FormActivate(Sender: TObject);
    procedure StatusNarr(Narr: String);
    procedure CopyIfNewer(FName, FDesc: String);
    procedure filecopy(const sourcefilename,targetfilename :string);
    procedure CreateFirebellyDir(DirName: String);
  private
    { Private declarations }
    ServDir, LocalDir, LocalDrive, WindowsDir: String;
  public
    { Public declarations }
  end;

var
  frmFirebellyVers: TfrmFirebellyVers;

implementation

uses
  System.UITypes;

{$R *.DFM}

procedure TfrmFirebellyVers.FormActivate(Sender: TObject);
Var
  FiName, DiName: Array [0..255] of char ;
begin
  if (FindWindow('TWTSendFaxFrm', 'Fax Send Form') <> 0) then
  begin
    MessageDlg('The Firebelly application is already running', mtError,
      [mbAbort], 0);
    Application.Terminate;
    exit;
  end;

	{Setup the directories}
	ServDir := 'M:\' ;

  {[User Specific]\Application Data}
	LocalDir := GetSpecialFolderPath(2)+'\Firebelly';

  WindowsDir := GetWinDir;

  {Test that the Directory exists, if not then construct}
  if not DirectoryExists(LocalDir) then
  	begin
     	CreateFirebellyDir(LocalDir);
  	end;

	frmFirebellyVers.Refresh ;

	{Test the bitmaps} ;
	StatusNarr('Checking Logos') ;
	CopyIfNewer('wtHeadLogo.Bmp', 'Report Logo') ;
	CopyIfNewer('wtFootLogo.Bmp', 'Report Logo') ;

	{Do the actual program} ;
	StatusNarr('Checking Firebelly Program') ;
	CopyIfNewer('Firebelly.exe', 'Firebelly Program') ;
	CopyIfNewer('FDConnectionDefs.ini', 'FireDAC Connection Definitions') ;
	CopyIfNewer('FDDrivers.ini', 'FireDAC Drivers');

	{Do the PDF Merge Files} ;
	StatusNarr('Checking Firebelly PDF Merge files') ;
	CopyIfNewer('PDFSplitMergeX.dll', 'PDF Split Merge Program') ;
  CopyIfNewer('PDFSplitMergeX.tlb', 'PDF Split Merge Table') ;
  CopyIfNewer('Register.bat', 'PDF Split Merge Register') ;
  CopyIfNewer('UnRegister.bat', 'PDF Split Merge UnRegister') ;

	{Do the Moraware Scheduling Files} ;
	StatusNarr('Checking Moraware Scheduling files') ;
	CopyIfNewer('msmqsend.exe', 'Scheduling Program') ;
	CopyIfNewer('msmqsend.exe.config', 'Scheduling Program') ;
	CopyIfNewer('msmqsend.pdb', 'Scheduling Program') ;

  StrPCopy(FiName, LocalDir + '\Firebelly.exe') ;
	StrPCopy(DiName ,LocalDir) ;
	ShellExecute(0,nil,FiName,'', DiName, sw_Restore) ;
	Application.Terminate ;

end;

procedure TfrmFirebellyVers.StatusNarr(Narr: String);
begin
StatusLabel.Caption := Narr + '...' ;
StatusLabel.Refresh ;
end;

procedure TfrmFirebellyVers.CreateFirebellyDir(DirName: String);
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

procedure TfrmFirebellyVers.CopyIfNewer(FName, FDesc: String);
begin
{Check if server version of file is older or same. If it is don't copy it} ;
if FileAge(ServDir + '\' + FName) <= FileAge(LocalDir + '\' + FName) then exit ;
{If the local directory does not exist, create it} ;
If DirectoryExists(LocalDir) = False then
          CreateDir(LocalDir) ;
StatusNarr('Upgrading ' + FDesc + ' - Please wait...') ;
FileCopy(ServDir + '\' + FName, LocalDir + '\' + FName) ;
end;

procedure TfrmFirebellyVers.filecopy(const sourcefilename,targetfilename :string);
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
                 frmFirebellyVers.refresh ;
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
