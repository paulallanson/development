(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Send A Fax Form.

VSS Info:
$Header: /PBL D5/PBSendFax.pas 12    3/07/:3 14:55 Paul $
$History: PBSendFax.pas $
 * 
 * *****************  Version 12  *****************
 * User: Paul         Date: 3/07/:3    Time: 14:55
 * Updated in $/PBL D5
 * Not changed anything
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 9/06/:3    Time: 15:32
 * Updated in $/PBL D5
 * Changed the PMS unit to use the old Print to Fax routines in PBSendFax
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 6/06/:3    Time: 17:06
 * Updated in $/PBL D5
 * Now using the new print driver
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 15/01/03   Time: 12:34
 * Updated in $/PBL D5
 * Now uses new version of fax drivers.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 14/01/03   Time: 12:05
 * Updated in $/PBL D5
 * New Fax Drivers - Put in a "dummy" WaitForFaxFinish procedure into PB
 * sendFaxFrm.
 *
 * *****************  Version 7  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:24
 * Updated in $/PBL D5
 * Changed to use the Z: drive if directory not specified in Client
 * parameters
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 18/05/:1   Time: 11:43
 * Updated in $/PBL D5
 * Changed to use the Fax directory from the Broker.ini file rather than
 * the Z: hardcoded setting.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 20/09/:0   Time: 12:01p
 * Updated in $/PBL D5
 * Remove restriction on temp fax filename.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 20/09/:0   Time: 11:46a
 * Updated in $/PBL D5
 * Make form use PBMenuMainForm's sFaxSystem (instead of the one on
 * PBLoginForm).
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 18/09/:0   Time: 3:11p
 * Updated in $/PBL D5
 * Make fax send routine support faxing from workstation.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:43
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBSendFax;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, oomisc, printers, ShellAPI, DB, Inifiles,
  AdFaxCtl,syncobjs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait;

type
  TPBSendFaxFrm = class(TForm)
    Label1: TLabel;
    WaitForFaxFinishTimer: TTimer;
    AddFaxSQL: TFDQuery;
    GetOldFaxesQuery: TFDQuery;
    DelFaxQuery: TFDQuery;
    FaxDatabase: TFDConnection;
    ApdFaxDriverInterface1: TApdFaxDriverInterface;
    function OutToFax(FaxNo, FaxDescr: string; TempFaxTime: AnsiString): ByteBool;
    procedure WaitForFaxFinishTimerTimer(Sender: TObject);
    procedure WriteLogLine(TempText: string);
    function WinExecAndWait32(Filename: string; Visibility: Integer): Integer;
    procedure WaitForFaxFinish(Sender: TObject);
    procedure SendFax(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ApdFaxDriverInterface1DocEnd(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FaxDatabaseBeforeConnect(Sender: TObject);
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
  PBSendFaxFrm: TPBSendFaxFrm;

implementation

uses
  UITypes, pbMainMenu, PBLogin, AnsiStrings, CCSCommon;

{$R *.DFM}

function TPBSendFaxFrm.OutToFax(FaxNo, FaxDescr: string; TempFaxTime: AnsiString): ByteBool;
var
  TempLoop: Byte;
  TempArray, TempArray2, TempArray3: array[0..255] of Char;
  TempPrintName, TempPrintDevice, TempPrintPort: array[0..255] of char;
  TempPrintDevMode: THandle ;
begin
{Reset the end of fax event} ;
FaxFinishedEvent.ReSetEvent;
  {Force the printer select to be the fax system};
  Result := False;
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
      Printers.Printer.PrinterIndex := TempLoop;
      Printer.GetPrinter(TempPrintDevice, TempPrintName, TempPrintPort, TempPrintDevMode) ;
      Printer.SetPrinter(TempPrintDevice, TempPrintName, TempPrintPort, 0) ;
      Result := True;
      Break;
   end;
  end;
  if Result then
    begin
    If frmpbMainMenu.sFaxSystem <> 'S' then
       begin
       GetPrivateProfileString('Fax Server Config', 'Sender Program', 'NA',
                                    TempArray, sizeof(TempArray), 'FaxSrvV3.ini');
       If FindExecutable(TempArray,TempArray2, TempArray3) <= 32 then
          begin
          MessageDlg('Can''t execute the Fax Send program: ' + TempArray, mtError,[mbOK],0) ;
          Result := False ;
          exit ;
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
end;

procedure TPBSendFaxFrm.SendFax(Sender: TObject);
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
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      sFaxDir := ReadString('Email', 'Def Attach Direc', 'Z:');
      if trim(sFaxDir) = '' then sFaxDir := 'Z:';
      strPCopy(zFaxDir, sFaxDir);
      Free;
    end;
  sJunk := FaxFileName;
  If frmpbMainMenu.sFaxSystem = 'S' then
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
        MessageDlg('Can''t move document into fax que - FAX NOT SENT !!!', mtError, [mbOK], 0);
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
        AddFaxSQL.ParamByName('LastTried').AsDateTime := Date + StrToTime(string(FaxTime));
     AddFaxSQL.ParamByName('Description').AsString := FaxRef;
     AddFaxSQL.ParamByName('UserName').AsString := frmpbMainMenu.stsbrMainMenu.panels[0].Text;
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

procedure TPBSendFaxFrm.WaitForFaxFinishTimerTimer(Sender: TObject);
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
  TempResult := AnsiString(sConvertLabel);
  if AnsiStrings.Trim(TempResult) = '' then
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

procedure TPBSendFaxFrm.WriteLogLine(TempText: string);
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

function TPBSendFaxFrm.WinExecAndWait32(Filename: string; Visibility: Integer):
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

procedure TPBSendFaxFrm.FaxDatabaseBeforeConnect(Sender: TObject);
begin
  SetConnectionMapRules(FaxDatabase);
  {Get user and password from login screen};
  FaxDatabase.Params.UserName := 'faxes';
  FaxDatabase.Params.Password := 'rabbit';
end;

procedure TPBSendFaxFrm.WaitForFaxFinish(Sender: TObject);
begin
{Wait for the FaxFinishEvent to trigger - happens in the ApdFaxDriverInterfaceDocEnd procedure} ;
{Wait for 1 second} ;
  while (FaxFinishedEvent.WaitFor(1000) <> wrSignaled) do
  begin
    {If the event does not trigger, try to take a message from the message que and wait again} ;
    Application.HandleMessage;
  end;
end;

procedure TPBSendFaxFrm.FormDestroy(Sender: TObject);
begin
{Destroy the fax finish event} ;
FaxFinishedEvent.Destroy;
end;

procedure TPBSendFaxFrm.ApdFaxDriverInterface1DocEnd(Sender: TObject);
begin
{Trigger the FaxFinsihed event} ;
FaxFinishedEvent.SetEvent;
{Move the fax onto the server and trigger the finished event} ;
SendFax(Self) ;
end;

procedure TPBSendFaxFrm.FormCreate(Sender: TObject);
begin
  {Create the event used to detect end of fax} ;
  {DO NOT correct the spelling error!} ;
  FaxFinishedEvent := TEvent.Create(Nil,False,False,'FaxHasFinsihed') ;
end;

end.
