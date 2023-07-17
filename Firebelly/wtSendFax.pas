unit wtSendFax;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, printers, ShellAPI, DB, DBTables, Inifiles,
  AdFaxCtl, syncobjs, QrCtrls;

type
  TfrmWTSendFax = class(TForm)
    Label1: TLabel;
    WaitForFaxFinishTimer: TTimer;
    AddFaxSQL: TQuery;
    GetOldFaxesQuery: TQuery;
    DelFaxQuery: TQuery;
    FaxDatabase: TDatabase;
    ApdFaxDriverInterface1: TApdFaxDriverInterface;
    function OutToFax(FaxNo, FaxDescr, TempFaxTime: string): integer;
    procedure WaitForFaxFinishTimerTimer(Sender: TObject);
    procedure WriteLogLine(TempText: string);
    function WinExecAndWait32(Filename: string; Visibility: Integer): Integer;
    procedure FaxDatabaseLogin(Database: TDatabase; LoginParams: TStrings);
    procedure WaitForFaxFinish(Sender: TObject);
    procedure SendFax(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ApdFaxDriverInterface1DocEnd(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   FaxFinishedEvent: TEvent;
  public
    { Public declarations }
    FaxPhoneNo, FaxRef, FaxFileName: string;
    TimedFax: ByteBool;
    FaxTime: string[5];
  end;

var
  frmWTSendFax: TfrmWTSendFax;

implementation

uses wtMain;

{$R *.DFM}

function TfrmWTSendFax.OutToFax(FaxNo, FaxDescr, TempFaxTime: string): integer;
var
  FaxFound: ByteBool;
  TempLoop: Byte;
  TempArray, TempArray2, TempArray3: array[0..255] of Char;
  TempPrintName, TempPrintDevice, TempPrintPort: array[0..255] of char;    
  TempPrintDevMode: THandle ;
begin
{Reset the end of fax event} ;
  FaxFinishedEvent.ReSetEvent;
  {Force the printer select to be the fax system};
  FaxFound := False;
{$IFDEF DEMO}
  MessageDlg('Faxing is not available on the DEMO version', mtError, [mbOK], 0);
  Exit;
{$ENDIF}
  for TempLoop := 0 to Printer.Printers.Count - 1 do
  begin
    {Try to find either the NEW or the OLD fax driver. NB: If both are installed} ;
    {if will use wichever comes 1st in the list} ;
    if (Pos('APF FAX PRINTER', UpperCase(Printer.Printers[TempLoop])) > 0) or
       (Pos('PRINTFAX', UpperCase(Printer.Printers[TempLoop])) > 0) then
    begin
      Printer.PrinterIndex := TempLoop;
      Printer.GetPrinter(TempPrintDevice, TempPrintName, TempPrintPort, TempPrintDevMode) ;
      Printer.SetPrinter(TempPrintDevice, TempPrintName, TempPrintPort, 0) ;
      FaxFound := True;
      Break;
   end;
  end;
  if FaxFound then
    begin
    If frmWTMain.FaxSystem <> 'S' then
       begin
       GetPrivateProfileString('Fax Server Config', 'Sender Program', 'NA',
                                    TempArray, sizeof(TempArray), 'FaxSrvV3.ini');
       If FindExecutable(TempArray,TempArray2, TempArray3) <= 32 then
          begin
          MessageDlg('Can''t execute the Fax Send program: ' + TempArray, mtError,[mbOK],0) ;
          FaxFound := False ;
          end;
       end;
    {Setup the fax phone number};
    FaxPhoneNo := FaxNo;
    FaxRef := FaxDescr;
    if Trim(TempFaxTime) = '' then
      TimedFax := False
    else
    begin
      TimedFax := True;
      FaxTime := TempFaxTime;
    end;
    {Get the name of the tempfile and set it into the interface component} ;
    GetTempPath(SizeOf(TempArray2),TempArray2) ;
    GetTempFileName(TempArray2, 'APF', 0, TempArray);
    FaxFileName := TempArray ;
    ApdFaxDriverInterface1.FileName := FaxFileName ;
  end;
  if FaxFound then
    Result := TempLoop
  else
    Result := -2;
end;

procedure TfrmWTSendFax.SendFax(Sender: TObject);
{Handle a message received from the fax printer driver}
var
  TempArray: array[0..255] of Char;
  zFName, zJunk, zJunk1: array[0..255] of Char;
  sJunk, sJunk1: string;
  iJunk: Integer;
  FaxFile: array[0..255] of Char;
  sSenderProgram, TempFileName: string;
  IniFile : TIniFile;
  sFaxDir: string;
  zFaxDir: array[0..255] of char;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create('myworktops.ini');

  with IniFile do
    begin
      sFaxDir := ReadString('Fax', 'Def Fax Directory', 'Z:');
      if trim(sFaxDir) = '' then sFaxDir := 'Z:';
      strPCopy(zFaxDir, sFaxDir);
      Free;
    end;
  sJunk := FaxFileName;
  If frmWTMain.FaxSystem = 'S' then
     begin
     {Send a fax via the SERVER} ;
     {Work out a unique temp file name on the server};
     GetTempFileName(zFaxDir, 'APF', 0, zFName);
     sJunk1 := zFName;
     StrPCopy(zJunk, sJunk);
     StrPCopy(zJunk1, sJunk1);
     DeleteFile(zJunk1);
     if not movefile(zJunk, zJunk1) then
        begin
        MessageDlg('Can''t move document into fax que - FAX NOT SENT !!!', mtError,
                           [mbOK], 0);
        Exit;
        end;
     AddFaxSQL.Close;
     AddFaxSQl.ParamByName('CreatedOn').AsDateTime := Now;
     AddFaxSQL.ParamByName('Filename').AsString := sJunk1;
     AddFaxSQL.ParamByName('PhoneNo').AsString := FaxPhoneNo;
     AddFaxSQL.ParamByName('Status').AsString := 'N';
     AddFaxSQL.ParamByName('NoOfRetries').AsInteger := 0;
     AddFaxSQL.ParamByName('LastTried').Clear;
     if TimedFax then
        AddFaxSQL.ParamByName('LastTried').AsDateTime := Date + StrToTime(FaxTime);
     AddFaxSQL.ParamByName('Description').AsString := FaxRef;
     AddFaxSQL.ParamByName('UserName').AsString := frmWTMain.stsbrStatus.panels[0].Text;
     AddFaxSQL.ExecSQL;
     with GetOldFaxesQuery do
          begin
          Close;
          ParamByName('Date_Before').AsDateTime := Date - 7;
          Open;
          First;
          while (not EOF) do
                begin
                TempFileName := FieldByName('FileName').AsString;
                {Delete a fax};
                with DelFaxQuery do
                     begin
                     Close;
                     ParamByName('FileName').AsString := TempFileName;
                     ExecSQL;
                     end;
                {Delete the actual file};
                FaxFile := '';
                for IJunk := 1 to Length(TempFileName) do
                    FaxFile[IJunk - 1] := TempFileName[IJunk];
                DeleteFile(FaxFile);
                Next;
          end;
     end;
  end
else
  begin
  {Send a fax via the WORKSTATION} ;  
  {*** The following code is for a LOCAL fax server};
  FaxFileName := sJunk;
   {Get fax sender program name};
  GetPrivateProfileString('Fax Server Config', 'Sender Program', 'NA',
    TempArray,
    sizeof(TempArray), 'FaxSrvV3.ini');
  sSenderProgram := TempArray;

  StrPCopy(TempArray, FaxFileName);
  {Set a fax going};
   WritePrivateProfileString('Fax Server Sending','File Name',TempArray,
                                                   'FaxSrvV3.INI') ;
   StrPCopy(TempArray, FaxPhoneNo) ;
   WritePrivateProfileString('Fax Server Sending','Phone Number',TempArray,
                                                   'FaxSrvV3.INI') ;
   WritePrivateProfileString('Fax Server Sending','Last Fax OK','',
                                                   'FaxSrvV3.INI') ;
   WriteLogLine('Send fax: ' + FaxFileName + ' to ' + FaxPhoneNo ) ;

   StrPCopy(TempArray,sSenderProgram) ;
   winexecandwait32(TempArray,SW_SHOW);
   GetPrivateProfileString('Fax Server Sending','Last Fax OK', 'N',
       TempArray, sizeof(TempArray), 'FaxSrvV3.ini');
   TempFileName := TempArray ;
   If TempFileName <> 'Y' then
      begin
      GetPrivateProfileString('Fax Server Sending','Error Message', 'Unknown',
       TempArray, sizeof(TempArray), 'FaxSrvV3.ini');
      sSenderProgram := TempArray ;
      MessageDlg('Fax was not sent - Reason: ' + sSenderProgram, mtError,[mbOK],0) ;
      end
   else
      MessageDlg('Fax successfully sent', mtInformation,[mbOK],0) ;
  end;
end;

procedure TfrmWTSendFax.WaitForFaxFinishTimerTimer(Sender: TObject);
var
  TempArray: array[0..255] of Char;
  TempResult: string[1];
  sConvertLabel: string;
begin
  WaitForFaxFinishTimer.Enabled := False;
  {Check if fax has finished};
  GetPrivateProfileString('Fax Server Sending', 'Last Fax OK', '', TempArray,
    SizeOf(TempArray), 'FaxSrvV3.ini');
  sConvertLabel := TempArray;
  TempResult := sConvertLabel;
  if Trim(TempResult) = '' then
  begin
    WaitForFaxFinishTimer.Enabled := True;
    Exit;
  end;
  {Fax has finished};
  if TempResult = 'Y' then
  begin
    WriteLogLine(FaxFileName + ' finished OK');
  end
  else
  begin
    WriteLogLine(FaxFileName + ' finished with error');
  end;

end;

procedure TfrmWTSendFax.WriteLogLine(TempText: string);
var
  TempFile: TextFile;
  sLogFileName: string;
  TempArray: array[0..255] of Char;
begin
  {Get log file name};
  GetPrivateProfileString('Fax Server Config', 'Log File', 'NA', TempArray,
    sizeof(TempArray), 'FaxSrvV3.ini');
  sLogFileName := TempArray;
  if sLogFileName = 'NA' then
  begin
    WritePrivateProfileString('Fax Server Config', 'Log File',
      'C:\FaxSrvV3.log',
      'FaxSrvV3.ini');
    TempArray := 'C:\FaxSrvV3.log';
    sLogFileName := TempArray;
  end;

  {Write a text line to the log};
  AssignFile(TempFile, sLogFileName);
  try
    Append(TempFile);
  except
    begin
      try
        ReWrite(TempFile);
      except
        MessageDlg('Can''t open the log file' + 'faxsvr4.log', mtInformation,
          [mbOk], 0);
        Exit;
      end;
    end;

  end;
  WriteLn(TempFile, DateTimeToStr(Now), '  ****  ', TempText, '  ****');
  CloseFile(TempFile);
end;

function TfrmWTSendFax.WinExecAndWait32(Filename: string; Visibility: Integer):
  Integer;
var
  zAppName: array[0..512] of Char;
  zCurDir: array[0..255] of Char;
  WorkDir: string;
  StartupInfo: TStartupinfo;
  ProcessInfo: TProcessInformation;
  dwRes: DWORD;
begin
  Screen.Cursor := crSQLWait;

  StrPCopy(zAppName, Filename);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := SizeOf(Startupinfo);

  StartupInfo.dwflags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;

  if not CreateProcess(nil, zAppName, nil, nil, False, CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo)
    then
    Result := -1
  else
  begin
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess, dwRes);
    Result := Ord(dwRes);
  end;
end;

procedure TfrmWTSendFax.FaxDatabaseLogin(Database: TDatabase;
  LoginParams: TStrings);
begin
  {Get user and password from login screen};
  LoginParams.Values['USER NAME'] := 'faxes';
  LoginParams.Values['PASSWORD'] := 'rabbit';
end;

procedure TfrmWTSendFax.WaitForFaxFinish(Sender: TObject);
begin
{Wait for the FaxFinishEvent to trigger - happens in the ApdFaxDriverInterfaceDocEnd procedure} ;
{Wait for 1 second} ;
While (FaxFinishedEvent.WaitFor(1000) <> wrSignaled) do
        begin
        {If the event does not trigger, try to take a message from the message que and wait again} ;
        Application.HandleMessage ;
        end;
end;

procedure TfrmWTSendFax.FormDestroy(Sender: TObject);
begin
{Destroy the fax finish event} ;
FaxFinishedEvent.Destroy;
end;

procedure TfrmWTSendFax.ApdFaxDriverInterface1DocEnd(Sender: TObject);
begin
{Trigger the FaxFinsihed event} ;
FaxFinishedEvent.SetEvent;
{Move the fax onto the server and trigger the finished event} ;
SendFax(Self) ;
end;

procedure TfrmWTSendFax.FormCreate(Sender: TObject);
begin
  {Create the event used to detect end of fax} ;
  {DO NOT correct the spelling error!} ;
  FaxFinishedEvent := TEvent.Create(Nil,False,False,'FaxHasFinsihed') ;
end;

end.
