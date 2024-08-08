unit AllCommon;

interface

uses
  Classes, SysUtils, Windows, ShellAPI, ShlObj, Controls, Messages, Registry, Outlook_TLB, COMobj, ActiveX,
  Math, DBGrids, IniFiles, Forms, Variants, qrprntr, Printers, DB, shFolder, wtDataModule, DBCtrls, Dialogs,
  DragDropFile, FireDAC.Comp.Client, FireDAC.Stan.Error;

type
  TDBLookupComboBoxHelper = class helper for TDBLookupComboBox
  public
    function ListValue: Variant;
  end;

  TPrinterSettings = class
  private
    FFromPage: integer;
    FCopies: integer;
    FToPage: integer;
    FOutputBin: TQRBin;
    function  GetPrinterIndex : integer;
    procedure SetCopies(const Value: integer);
    procedure SetFromPage(const Value: integer);
    procedure SetToPage(const Value: integer);
    procedure SetOutputBin(const Value: TQRBin);
  public
    constructor Create;
    property Copies: integer read FCopies write SetCopies;
    property FromPage: integer read FFromPage write SetFromPage;
    property PrinterIndex: integer read GetPrinterIndex;
    property ToPage: integer read FToPage write SetToPage;
    property OutputBin : TQRBin read FOutputBin write SetOutputBin;
  end;

  TProcessDroppedFiles = reference to procedure(var FileName: string);

{Quick Reports Printer settings}
procedure GetPrinterMargins(var TopMar, BottomMar, LeftMar, RightMar: Double);
procedure GetPrinterValues(var Copies: Integer; var Bin: TQRBin; var Size: TQRPaperSize; var Duplex: Boolean);
function GetBinSelection: integer;

{dbGrid Routines}
procedure ResetGridCols(grid: TDBGrid);
procedure SetDBGridCols(formName, sectionName, iniFileName: string; dbGrid: TDBGrid);
procedure SaveDBGridCols(formName, sectionName, iniFileName: string; dbGrid: TDBGrid);
procedure DeleteColSettings(sectionName, iniFileName: string);

{formLayout Routines}
procedure SaveFormLayout(iniFileName: string; theForm: TForm);
procedure LoadFormLayout(iniFileName: string; theForm: TForm);

{ Version gathering functions }
function CCSGetVersion(const FileName: string): string;
function CCSGetBuild(const FileName: string): string;
function CCSGetModule(const FileName: string): string;
function CCSGetDescription(const FileName: string): string;
function CCSGetCopyRight(const FileName: string): string;
function CCSGetShortName(const FileName: string): string;

{ Printer setup routine }
function CCSPrinterSetup : Boolean;
function SetUpPrinter(PrinterSettings : TPrinterSettings) : Boolean;

{ Utility functions }
function BoolToStr(const aBool : Boolean) : string;
function CrystalDate(const aDate : TDateTime) : string;
function paDateStr(const vIn: variant): variant;
function IncrementNo(StartStr: string): string;
function RoundFloat(TempVal: real; DecPlaces: integer): real;
{ If passed a string or a float, PostoNegQty will return a string.  An
  error message will be displayed if the value is invalid. }
function PostoNegQty(const Qty: variant): integer;
function PosToNegMoney(const Money: variant): double;
function ShowInPacks(iSinglesQty, iPackSize: Integer): String;
function InpToSing(sInpStr: String; iPackSize: Integer): Integer;
function FormatDoubleTo2DP(const Value: variant): string;
function FormatQty(const Qty: variant): string;
function FormatMoney(const Money: variant): string;
function ShellFileOperation(const fromFileOrFolder, toFileOrFolder: string; Flag: Integer): boolean;
procedure DirectoryCopy(asource, atarget: string);
procedure FileCopy(const sourcefilename,targetfilename :string);

{Retreive Windows stuff}
function GetComputerNetName: string;
function GetUserFromWindows: string;
function GetWinDir : string;
function GetWinSysDir : string;
function GetWinTempDir : string;
function GetSpecialFolderPath(folder : integer) : string;
function DirectoryExists(const Name: string): boolean;
procedure CreateDirectory(DirName: String);

{Email Sending}
procedure EmailViaOutlook(sRecipient, sSubject, sBody: string; sAttachment: Tstrings; EmailApplication, EmailAccount: string);
procedure EmailandSaveViaOutlook(var sRecipient, sSubject, sBody, sFilepath: string; var okToSave: boolean; EmailApplication, EmailAccount: string);

{Adding appointment Sending}
procedure AddMorawareAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
procedure AddAppViaOutlook(sLocation, sSubject, sBody: string; start: Tdatetime; bReminder: bytebool;
                          iminutesbefore: integer);
procedure AddOutlookDeliveryAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
procedure AddOutlookFittingAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
procedure AddOutlookRemedialNoProductionAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
procedure AddOutlookRemedialProductionAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
procedure AddOutlookTemplateAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
procedure UpdateOutlookDeliveryAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
procedure UpdateOutlookTemplateAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
procedure UpdateOutlookFittingAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
procedure UpdateOutlookRemedialNoProductionAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
procedure UpdateOutlookRemedialProductionAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);

{ Registry Stuff }
function GetRegKey(const TempPath, TempKey: string): string;
procedure SetRegKey(const TempPath, TempKey, TempValue: string);

{ FireDAC }
procedure ConfigureFDConnection(const Connection: TFDConnection);
procedure ParseException(Exc: EFDDBEngineException);

{ TOpenDialog }
procedure CopyDocuments(const FilesDialog: TOpenDialog; const Folder: string; const ExecuteBlock: TProc);
procedure CopyDocumentsFromClipboard(const Folder: string; const ExecuteBlock: TProc);

{ WinControl WinControlSetData }
procedure MyWinControlSetData(const FilesList: TUnicodeStrings; const Path: string; ShowDocuments: TProc); overload;
procedure ProcessDroppedFile(const FileName, Path: string; ShowDocuments: TProc);

{ TCCSRegistry }
type
  TCCSRegistry = class(TRegistry)
  public
    function ReadBoolEx(const Name: string; Default: boolean): Boolean;
    function ReadIntegerEx(const Name: string; Default: Integer): Integer;
    function ReadCurrencyEx(const Name: string; Default: Currency): Currency;
    function ReadStringEx(const Name: string; const Default: string): string;
  end;

{ Directory dialog, a wrapper for ShBrowseForFolder }
type
  TDirDlgOption = (shbBrowseForComputer, shbBrowseForPrinter,
    shbDontGoBelowDomain, shbReturnFSAncestors,
    shbReturnOnlyFSDirs, shbStatusText);
  TDirDlgOptions = set of TDirDlgOption;

  TSelChangeEvent = procedure(Sender: TObject; NewFolder: string; IsDisplayName: boolean) of object;

  TDirDlg = class(TComponent)
  private
    fOnInitialize: TNotifyEvent;
    fOnSelChange: TSelChangeEvent;
    fPrompt: string;
    fRootPath: string;
    fInitialPath: string;
    fPathName: string;
    fDisplayName: string;
    fStatusText: string;
    fCaption: string;
    fOptions: TDirDlgOptions;
    fDialogWnd: HWND;
    function BrowserCallback(Wnd: HWND; Msg: UINT; lParam: LPARAM): integer;
    procedure SetStatusText(const Value: string);
    procedure SetCaption(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
    function Execute: boolean;
    procedure EnableOK(Enable: boolean);
    procedure SetSelection(const Value: string);
    property DialogWnd: HWND read fDialogWnd;
    property PathName: string read fPathName;
    property DisplayName: string read fDisplayName;
    property InitialPath: string read fInitialPath write fInitialPath;
    property RootPath: string read fRootPath write fRootPath;
    property Prompt: string read fPrompt write fPrompt;
    property Caption: string read fCaption write SetCaption;
    property StatusText: string read fStatusText write SetStatusText;
    property Options: TDirDlgOptions read fOptions write fOptions;
    property OnInitialize: TNotifyEvent read fOnInitialize write fOnInitialize;
    property OnSelChange: TSelChangeEvent read fOnSelChange write fOnSelChange;
  end;

resourcestring
  SOFTWARE_KEY = 'Software\'; { where we put our entries  }
  CCS_KEY = 'Company Ltd\'; { the Company specific node }

  WORKTOPS_KEY = 'Broker'; { Broker settings  }

  BDE_KEY = 'Software\Borland\Database Engine'; { path to BDE settings }

const
  myWorktops_INIFILE = 'myWorktops.ini';

implementation

uses
  System.UITypes, FireDAC.Stan.Intf, FireDAC.Stan.Option, Vcl.Clipbrd, taoMAPI, Vcl.AxCtrls;

type
  TVerInfo = (tVersion, tBuild, tModule, tDesc, tCopyright, tShortName);

const
  KEY_PREFIX = '\StringFileInfo\040904E4\';
  KEYS: array[TVerInfo] of string =
    ('FileVersion',
    'ProductVersion',
    'ModuleName',
    'FileDescription',
    'LegalCopyright',
    'ShortName'
    );

function CCSPrinterSetup : Boolean;
var
  PSDialog : TPrinterSetupDialog;
begin
  PSDialog := TPrinterSetupDialog.Create(nil);
  try
    Result := PSDialog.Execute;
  finally
    PSDialog.Free;
  end;
end;

function BoolToStr(const aBool : Boolean) : string;
begin
  if aBool then
    Result := 'true'
  else
    Result := 'false';
end;

function CrystalDate(const aDate : TDateTime) : string;
begin
  { Crystal Reports expects date parameters to be passed in as
    strings in the format "YYYY,MM,DD" }
  Result := FormatDateTime('YYYY,MM,DD', aDate);
end;

function CCSReadCodeFile(const FileName: string; const VerKey: TVerInfo): string;
var
  aName: array[0..127] of byte;
  VerLen: DWORD;
  Dummy: DWORD;
  pInfo: Pointer;
  pVerInfo: Pointer;
  VerInfoLen: cardinal;
begin
  Result := EmptyStr;
  FillChar(aName, SizeOf(aName), 0);
  StrPCopy(@aName, FileName);
  VerLen := GetFileVersionInfoSize(@aName, Dummy);
  if VerLen > 0 then
  begin
    GetMem(pInfo, VerLen);
    try
      if GetFileVersionInfo(@aName, 0, VerLen, pInfo) then
      begin
        StrPCopy(@aName, KEY_PREFIX + KEYS[VerKey]);
        if VerQueryValue(pInfo, @aName, pVerInfo, VerInfoLen) then
          Result := StrPas(PWideChar(pVerInfo));
      end;
    finally
      FreeMem(pInfo, VerLen);
    end;
  end;
end;

function CCSGetVersion(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tVersion);
  except on E: Exception do
      Result := 'GetVersion error: ' + E.Message;
  end;
*)
end;

function CCSGetBuild(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tBuild);
  except on E: Exception do
      Result := 'GetBuild error: ' + E.Message;
  end;
*)
end;

function CCSGetModule(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tModule);
  except on E: Exception do
      Result := 'GetModule error: ' + E.Message;
  end;
*)
end;

function CCSGetDescription(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tDesc);
  except on E: Exception do
      Result := 'GetDescription error: ' + E.Message;
  end;
*)
end;

function CCSGetCopyRight(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tCopyRight);
  except on E: Exception do
      Result := 'GetCopyRight error: ' + E.Message;
  end;
*)
end;

function CCSGetShortName(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tShortName);
  except on E: Exception do
      Result := 'GetShortName error: ' + E.Message;
  end;
*)
end;

procedure EmailViaOutlook(sRecipient, sSubject, sBody: string; sAttachment: Tstrings; EmailApplication, EmailAccount: string);
var
	Outlook		 : OutlookApplication;
	Unknown		 : IUnknown;
	Result		 : HResult;
	MI			 : MailItem;
  bOutlookRunning: boolean;
  i: integer;
//	Insp		 : Inspector;
//  NmSpace: NameSpace;
//  Folder: MAPIFolder;
const
	olMailItem = 0;
begin
	// via early binding:
	Result := GetActiveObject(CLASS_OutlookApplication, nil, Unknown);

  {Check if Outlook is already running, this uses Outlook 2000}
  if FindWindow('mspim_wnd32','Microsoft Outlook') <> 0 then
    bOutlookRunning := true
  else
    bOutlookRunning := false;

  if not bOutlookRunning then
    begin
      Showmessage('Outlook is not running. Click OK, start Outlook and resend the email');
      exit;
    end                                                           ;

	if Result = MK_E_UNAVAILABLE then
		begin
      Outlook := CoOutlookApplication.Create as _Application;
    end
	else
    begin
		  // make sure no other error occurred during GetActiveObject
		  OleCheck(Result);
		  OleCheck(Unknown.QueryInterface(OutlookApplication, Outlook));
	  end;

	MI := Outlook.CreateItem(olMailItem) as MailItem;
(*  if (EmailApplication = 'OUT2007') or (EmailApplication = 'OUT2010') or (EmailApplication = 'OUT2013') or (EmailApplication = 'OUT2016') then
    begin
      if EmailAccount <> '' then
        MI.SendUsingAccount := Outlook.Session.accounts.item(EmailAccount);
    end;

*)
  MI.Bodyformat := olFormatHTML;
  MI.GetInspector;

//  if trim(sRecipient) <> '' then
//	  MI.Recipients.Add(sRecipient);

  if trim(sRecipient) <> '' then
    MI.To_ := sRecipient;

	for i := 0 to pred(sAttachment.count) do
    MI.Attachments.Add(sAttachment[i],EmptyParam, EmptyParam, EmptyParam);

	MI.Subject := sSubject;

  sBody := stringreplace(sBody,AnsiString(#13#10),'<BR>',[rfReplaceAll]);
  MI.HTMLBody := '<HTML><BODY>'+sBody+'</BODY></HTML>' + MI.HTMLBody;

//	MI.Body := sBody;

  try
    MI.Display(EmptyParam);
  except
  end;
end;

procedure EmailandSaveViaOutlook(var sRecipient, sSubject, sBody, sFilepath: string; var okToSave: boolean; EmailApplication, EmailAccount: string);
var
  Outlook: OutlookApplication;
  Unknown: IUnknown;
  Result: HResult;
  MI, temp_MI, Save_MI : MailItem;
  MF: MAPIFolder;
  bOutlookRunning: boolean;
  i: integer;
  Disp: IDispatch;
  NmSpace: NameSpace;
  svDlgOfficeDoc: TSaveDialog;
  userCancelled, saveIT: boolean;
  createTime, tempTime: TDateTime;
const
  olMailItem = 0;
begin
  // via early binding:
  Result := GetActiveObject(CLASS_OutlookApplication, nil, Unknown);

  {Check if Outlook is already running, this uses Outlook 2000}
  if FindWindow('mspim_wnd32','Microsoft Outlook') <> 0 then
    bOutlookRunning := true
  else
    bOutlookRunning := false;

  if not bOutlookRunning then
    begin
      Showmessage('Outlook is not running. Click OK, start Outlook and resend the email');
      exit;
    end                                                           ;

  if Result = MK_E_UNAVAILABLE then
  begin
    Outlook := CoOutlookApplication.Create as _Application;
  end
  else begin
    // make sure no other error occurred during GetActiveObject
    OleCheck(Result);
    OleCheck(Unknown.QueryInterface(OutlookApplication, Outlook));
  end;

  createTime := now;
  MI := Outlook.CreateItem(olMailItem) as MailItem;

(*  if (EmailApplication = 'OUT2007') or (EmailApplication = 'OUT2010') or (EmailApplication = 'OUT2013') or (EmailApplication = 'OUT2016') then
    begin
      if EmailAccount <> '' then
        MI.SendUsingAccount := Outlook.Session.accounts.item(EmailAccount);
    end;
*)
  MI.Bodyformat := olFormatHTML;
  MI.GetInspector;

//  if trim(sRecipient) <> '' then
//	  MI.Recipients.Add(sRecipient);

  if trim(sRecipient) <> '' then
    MI.To_ := sRecipient;

  MI.Subject := sSubject;
  MI.HTMLBody := '<HTML><BODY>'+sBody+'</BODY></HTML>' + MI.HTMLBody;
//  MI.Body := sBody;

  try
    MI.Display(EmptyParam);
  except
  end;

// prompt to save the email
  svDlgOfficeDoc := TSaveDialog.create(application);
  svDlgOfficeDoc.Files.Clear;
  svDlgOfficeDoc.InitialDir := sFilePath;
  svDlgOfficeDoc.FileName := stringreplace(sSubject,':','-',[rfReplaceAll, rfIgnoreCase]);
  svDlgOfficeDoc.Filter := 'Outlook Email Document (*.msg)|*.msg';
  svDlgOfficeDoc.Title := 'Save Email As';

  userCancelled := false;

  while (okToSave = false) and (userCancelled = false) do
  begin
  //prompt user for file name
    if svDlgOfficeDoc.Execute then
    begin
      if (copy(trim(svDlgOfficeDoc.FileName), 1, length(sFilePath)) = sFilePath) then
      begin
        //does file exists
        if fileExists(svDlgOfficeDoc.FileName+'.msg') then
        begin
            MessageDlg('This file name already exists, please choose another file name.', mtWarning, [mbOK], 0);
            okToSave := false;
        end
        else
        begin
            okToSave := true;
        end;
      end
      else
      begin
          MessageDlg('You can''t save a document outside the Company Document Directory', mtError,[mbOK],0) ;
          svDlgOfficeDoc.FileName := sSubject;
          svDlgOfficeDoc.InitialDir := sFilePath;
          okToSave := false;
      end;
    end
    else
    begin
        userCancelled := true;  //the user cancelled the save dialogue
    end;
  end;

  saveIT := false;
  while (userCancelled = false) and (SaveIT = false) do
  begin
    if svDlgOfficeDoc.Files.Count > 0 then
    begin
      okToSave := true;
      sFilePath := svDlgOfficeDoc.Files[svDlgOfficeDoc.Files.count - 1];
      NmSpace := Outlook.GetNameSpace('MAPI');
      MF := NmSpace.GetDefaultFolder(olFolderOutbox);
      for i := MF.Items.Count downto 1 do
        begin
          Disp := MF.Items.Item(i);
          if (Disp.QueryInterface(MailItem, temp_MI) = S_OK) then
          begin
            sSubject := temp_MI.Subject;
            if temp_MI.creationTime > createTime then
            begin
              createTime := temp_MI.creationTime;
              SAVE_MI := temp_MI;
              saveIT := true;
              break;
            end;
          end;
        end;

      //if the message hasn't made it the the outbox items folder check the sent items
      if saveIT = false then
      begin
        MF := NmSpace.GetDefaultFolder(olFolderSentMail);
        for i := MF.Items.Count downto 1 do
        begin
          Disp := MF.Items.Item(i);
          if (Disp.QueryInterface(MailItem, temp_MI) = S_OK) then
          begin
            sSubject := temp_MI.subject;
            tempTime := temp_MI.creationTime;
            if tempTime >= createTime then
            begin
              createTime := temp_MI.creationTime;
              SAVE_MI := temp_MI;
              saveIT := true;
              break;
            end;
          end;
        end;
      end;

      if saveIT = false then
      begin
        //ask the user to send the message or cancel the process
        if messageDlg('The Message could not be located in either the Sent Items or the Outbox folders.' +#10#13
                +'Click OK when you have sent the message or click Cancel if you do not want to save the message.', mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
        begin
          userCancelled := true;
          okToSave := false;
        end;
      end
      else
      begin
        Save_MI.SaveAs(sFilePath+'.msg',olMSG);
      end;
    end;
  end;

  svDlgOfficeDoc.free;
end;

procedure AddAppViaOutlook(sLocation, sSubject, sBody: string; start: Tdatetime; bReminder: bytebool;
                          iminutesbefore: integer);
var
	Outlook		 : OutlookApplication;
	Unknown		 : IUnknown;
	Result		 : HResult;
	AI			 : AppointmentItem;
  bOutlookRunning: boolean;
const
	olMailItem = 0;
begin
	// via early binding:
	Result := GetActiveObject(CLASS_OutlookApplication, nil, Unknown);

  {Check if Outlook is already running, this uses Outlook 2000}
  if FindWindow('mspim_wnd32','Microsoft Outlook') <> 0 then
    bOutlookRunning := true
  else
    bOutlookRunning := false;

	if Result = MK_E_UNAVAILABLE then
		begin
    Outlook := CoOutlookApplication.Create as _Application;
    end
	else begin
		// make sure no other error occurred during GetActiveObject
		OleCheck(Result);
		OleCheck(Unknown.QueryInterface(OutlookApplication, Outlook));
	end;

	AI := Outlook.CreateItem(olAppointmentItem) as AppointmentItem;

	AI.Subject := sSubject;
	AI.Start := start;
//  AI.End;
  AI.Location := sLocation;
  AI.ReminderSet := bReminder;
  AI.ReminderMinutesBeforeStart := iMinutesBefore;
  AI.Body := sBody;
  AI.Display(EmptyParam);

  if not(bOutlookRunning) then
    begin
	    Showmessage('Please click OK when the appointment has been made');
      Outlook.Quit;
      Outlook := nil;
    end;
end;

procedure AddMorawareAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  FiName, DiName, OrderNo: Array [0..255] of char ;
  LocalDir: string;
begin
	LocalDir := extractfilepath(application.ExeName);
	StrPCopy(FiName, LocalDir + 'MsmqSend.exe') ;
	StrPCopy(DiName ,LocalDir) ;

  StrPCopy(OrderNo, inttostr(SalesOrder));

//  messagedlg('Going to call the MSMQSend program', mtInformation, [mbOk], 0);
	ShellExecute(0, nil, FiName, OrderNo, DiName, sw_HIDE) ;
end;

procedure AddOutlookTemplateAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  res: integer;
  dll_handle: THandle;
  myFunction: function(param: integer; param1: boolean): integer stdcall;
  myFunctionTS: function(param: integer; param1: integer; param2: boolean): integer stdcall;
begin
  if dtmdlWorktops.SchedulingSystem = 'Outlook' then
    begin
      dll_handle := Loadlibrary('FirebellyScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunction := GetProcAddress(dll_handle, 'AddTemplateAppointment');

          if (NIL <> @MyFunction) then
            begin
              res := MyFunction(SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end
  else
    begin
      dll_handle := Loadlibrary('FirebellyTeamScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunctionTS := GetProcAddress(dll_handle, 'AddTemplateAppointment');

          if (NIL <> @MyFunctionTS) then
            begin
              res := MyFunctionTS(Team, SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end;

end;

procedure AddOutlookFittingAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  res: integer;
  dll_handle: THandle;
  myFunction: function(param: integer; param1: boolean): integer stdcall;
  myFunctionTS: function(param: integer; param1: integer; param2: boolean): integer stdcall;
begin
  res := 0;

  if dtmdlWorktops.SchedulingSystem = 'Outlook' then
    begin
      dll_handle := Loadlibrary('FirebellyScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunction := GetProcAddress(dll_handle, 'AddFittingAppointment');

          if (NIL <> @MyFunction) then
            begin
              res := MyFunction(SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end
  else
    begin
      dll_handle := Loadlibrary('FirebellyTeamScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunctionTS := GetProcAddress(dll_handle, 'AddFittingAppointment');

          if (NIL <> @MyFunctionTS) then
            begin
              res := MyFunctionTS(Team, SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end;
end;

procedure AddOutlookDeliveryAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  res: integer;
  dll_handle: THandle;
  myFunction: function(param: integer; param1: boolean): integer stdcall;
  myFunctionTS: function(param: integer; param1: integer; param2: boolean): integer stdcall;
begin
  res := 0;

  if dtmdlWorktops.SchedulingSystem = 'Outlook' then
    begin
      dll_handle := Loadlibrary('FirebellyScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunction := GetProcAddress(dll_handle, 'AddDeliveryAppointment');

          if (NIL <> @MyFunction) then
            begin
              res := MyFunction(SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end
  else
    begin
      dll_handle := Loadlibrary('FirebellyTeamScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunctionTS := GetProcAddress(dll_handle, 'AddDeliveryAppointment');

          if (NIL <> @MyFunctionTS) then
            begin
              res := MyFunctionTS(Team, SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end;
end;

procedure AddOutlookRemedialNoProductionAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  res: integer;
  dll_handle: THandle;
  myFunction: function(param: integer; param1: boolean): integer stdcall;
  myFunctionTS: function(param: integer; param1: integer; param2: boolean): integer stdcall;
begin
  res := 0;

  if dtmdlWorktops.SchedulingSystem = 'Outlook' then
    begin
      dll_handle := Loadlibrary('FirebellyScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunction := GetProcAddress(dll_handle, 'AddRemedialNoProductionAppointment');

          if (NIL <> @MyFunction) then
            begin
              res := MyFunction(SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end
  else
    begin
      dll_handle := Loadlibrary('FirebellyTeamScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunctionTS := GetProcAddress(dll_handle, 'AddRemedialNoProductionAppointment');

          if (NIL <> @MyFunctionTS) then
            begin
              res := MyFunctionTS(Team, SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end;
end;

procedure AddOutlookRemedialProductionAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  res: integer;
  dll_handle: THandle;
  myFunction: function(param: integer; param1: boolean): integer stdcall;
  myFunctionTS: function(param: integer; param1: integer; param2: boolean): integer stdcall;
begin
  res := 0;

  if dtmdlWorktops.SchedulingSystem = 'Outlook' then
    begin
      dll_handle := Loadlibrary('FirebellyScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunction := GetProcAddress(dll_handle, 'AddRemedialProductionAppointment');

          if (NIL <> @MyFunction) then
            begin
              res := MyFunction(SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end
  else
    begin
      dll_handle := Loadlibrary('FirebellyTeamScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunctionTS := GetProcAddress(dll_handle, 'AddRemedialProductionAppointment');

          if (NIL <> @MyFunctionTS) then
            begin
              res := MyFunctionTS(Team, SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end;
end;

procedure UpdateOutlookTemplateAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  res: integer;
  dll_handle: THandle;
  myFunction: function(param: integer; param1: boolean): integer stdcall;
  myFunctionTS: function(param: integer; param1: integer; param2: boolean): integer stdcall;
begin
  res := 0;

  if dtmdlWorktops.SchedulingSystem = 'Outlook' then
    begin
      dll_handle := Loadlibrary('FirebellyScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunction := GetProcAddress(dll_handle, 'UpdateTemplateAppointment');

          if (NIL <> @MyFunction) then
            begin
              res := MyFunction(SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end
  else
    begin
      dll_handle := Loadlibrary('FirebellyTeamScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunctionTS := GetProcAddress(dll_handle, 'UpdateTemplateAppointment');

          if (NIL <> @MyFunctionTS) then
            begin
              res := MyFunctionTS(Team, SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end;

end;

procedure UpdateOutlookFittingAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  res: integer;
  dll_handle: THandle;
  myFunction: function(param: integer; param1: boolean): integer stdcall;
  myFunctionTS: function(param: integer; param1: integer; param2: boolean): integer stdcall;
begin
  res := 0;

  if dtmdlWorktops.SchedulingSystem = 'Outlook' then
    begin
      dll_handle := Loadlibrary('FirebellyScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunction := GetProcAddress(dll_handle, 'UpdateFittingAppointment');

          if (NIL <> @MyFunction) then
            begin
              res := MyFunction(SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end
  else
    begin
      dll_handle := Loadlibrary('FirebellyTeamScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunctionTS := GetProcAddress(dll_handle, 'UpdateFittingAppointment');

          if (NIL <> @MyFunctionTS) then
            begin
              res := MyFunctionTS(Team, SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end;
end;

procedure UpdateOutlookDeliveryAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  res: integer;
  dll_handle: THandle;
  myFunction: function(param: integer; param1: boolean): integer stdcall;
  myFunctionTS: function(param: integer; param1: integer; param2: boolean): integer stdcall;
begin
  res := 0;

  if dtmdlWorktops.SchedulingSystem = 'Outlook' then
    begin
      dll_handle := Loadlibrary('FirebellyScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunction := GetProcAddress(dll_handle, 'UpdateDeliveryAppointment');

          if (NIL <> @MyFunction) then
            begin
              res := MyFunction(SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end
  else
    begin
      dll_handle := Loadlibrary('FirebellyTeamScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunctionTS := GetProcAddress(dll_handle, 'UpdateDeliveryAppointment');

          if (NIL <> @MyFunctionTS) then
            begin
              res := MyFunctionTS(Team, SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end;
end;

procedure UpdateOutlookRemedialNoProductionAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  res: integer;
  dll_handle: THandle;
  myFunction: function(param: integer; param1: boolean): integer stdcall;
  myFunctionTS: function(param: integer; param1: integer; param2: boolean): integer stdcall;
begin
  res := 0;

  if dtmdlWorktops.SchedulingSystem = 'Outlook' then
    begin
      dll_handle := Loadlibrary('FirebellyScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunction := GetProcAddress(dll_handle, 'UpdateRemedialNoProductionAppointment');

          if (NIL <> @MyFunction) then
            begin
              res := MyFunction(SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end
  else
    begin
      dll_handle := Loadlibrary('FirebellyTeamScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunctionTS := GetProcAddress(dll_handle, 'UpdateRemedialNoProductionAppointment');

          if (NIL <> @MyFunctionTS) then
            begin
              res := MyFunctionTS(Team, SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end;
end;

procedure UpdateOutlookRemedialProductionAppointment(Team, SalesOrder: integer; ShowAppointment: boolean);
var
  res: integer;
  dll_handle: THandle;
  myFunction: function(param: integer; param1: boolean): integer stdcall;
  myFunctionTS: function(param: integer; param1: integer; param2: boolean): integer stdcall;
begin
  if dtmdlWorktops.SchedulingSystem = 'Outlook' then
    begin
      dll_handle := Loadlibrary('FirebellyScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunction := GetProcAddress(dll_handle, 'UpdateRemedialProductionAppointment');

          if (NIL <> @MyFunction) then
            begin
              res := MyFunction(SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end
  else
    begin
      dll_handle := Loadlibrary('FirebellyTeamScheduler.dll');

      if (0 <> dll_handle) then
        begin
          @MyFunctionTS := GetProcAddress(dll_handle, 'UpdateRemedialProductionAppointment');

          if (NIL <> @MyFunctionTS) then
            begin
              res := MyFunctionTS(Team, SalesOrder, ShowAppointment);
            end;

          FreeLibrary(dll_Handle);
        end;
    end;
end;

function IncrementNo(StartStr: string): string;
var
  StrLength, Count, Id: Integer;
  Alphas: string[27];
  Numbers: string[11];
  CurrChar: string[1];
begin
  Alphas := 'ABCDEFGHIJKLMNOPQRSTUVWXYZA';
  Numbers := '01234567890';
  {Increment a string value by 1}
  StrLength := Length(StartStr);
  for Count := StrLength downto 1 do
  begin
    CurrChar := ShortString(Copy(StartStr, Count, 1));
    Id := Pos(CurrChar, Numbers);
    if Id > 0 then
    begin
      StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(string(Numbers), (Id + 1), 1) +
        Copy(StartStr, (Count + 1), (StrLength - Count));
      IncrementNo := StartStr;
      if Id < 10 then Exit;
    end
    else
    begin
      Id := Pos(CurrChar, Alphas);
      if Id > 0 then
      begin
        StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(string(Alphas), (Id + 1), 1) +
          Copy(StartStr, (Count + 1), (StrLength - Count));
        IncrementNo := StartStr;
        if Id < 27 then Exit;
      end;
    end;
  end;
end;

function RoundFloat(TempVal: real; DecPlaces: integer): real;
var
  rMulti: real;
  rTemp: real;
begin
  rMulti := power(10,(Decplaces));

  rtemp := TempVal * rMulti;

  rTemp := round(rTemp);

  rTemp := rTemp / rMulti;

  result := rtemp;
end;

function PosToNegQty(const Qty: variant): integer;
begin
  try
    begin
      if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
        Result := (StrToInt(Qty)*-1)
      else
        Result := (Qty*-1);
    end;
  except
    if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
      MessageDlg('Invalid quantity - ' + Qty, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid quantity', mtError, [mbOK], 0);
    Result := 0;
  end;
end;

function PosToNegMoney(const Money: variant): double;
begin
  try
    begin
      if (VarType(Money) = VarString) or (VarType(Money) = VarUString) then
        Result := (StrToFloatDef(Money, 0, FormatSettings)*-1)
      else
        Result := (Money*-1);
    end;
  except
    if (VarType(Money) = VarString) or (VarType(Money) = VarUString) then
      MessageDlg('Invalid financial value - ' + Money, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid financial value', mtError, [mbOK], 0);
    Result := 0.00;
  end;
end;

Function ShowInPacks(iSinglesQty, iPackSize: Integer): String;
Var
iNoOfPacks: Integer;
begin
iNoofPacks := 0;
{Display output as <noofpacks> or <noofpacks>/<noofsingles>} ;
Try
        iNoOfPacks := Trunc(iSinglesQty/iPackSize) ;
Except
        Result := '' ;
        MessageDlg('Invalid Pack Size',mtError,[mbOK],0) ;
        end;
If iSinglesQty = (iPackSize*iNoOfPacks) then
        Result := IntToStr(iNoOfPacks)
else
        Result := IntToStr(iNoOfPacks) + ':' + IntToStr(iSinglesQty - (iPackSize*iNoOfPacks)) ;
end;

Function InpToSing(sInpStr: String; iPackSize: Integer): Integer;
Var
iSlashPos: Integer;
begin
{Convert <noofpacks> or <noofpacks>/<noofsingles> to singles quantity} ;
{Note that a -999999 is an error} ;
iSlashPos := Pos(':',sInpStr);
Try
        If iSlashPos > 0 then
                Result := (StrToInt(Copy(sInpStr,1,iSlashPos-1))*iPackSize) +
                                (StrToInt(Copy(sInpStr,iSlashPos+1, Length(sInpStr)-iSlashPos)))
        else
                Result := (StrToInt(sInpStr)*iPackSize) ;
Except
        MessageDlg('Quantity must be entered as <packs> or <packs>:<singles', mtError,[mbOK],0) ;
        Result := -99999 ;
        end;
end;

function FormatQty(const Qty: variant): string;
begin
  if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
  begin
    if Trim(Qty) = '' then
    begin
      Result := '';
      Exit;
    end;
  end;
  try
    begin
      if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
        Result := FormatFloat('######0', StrToFloatDef(Qty, 0, FormatSettings))
      else
        Result := FormatFloat('######0', Qty);
      if StrToFloatDef(Result, 0, FormatSettings) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except
    if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
      MessageDlg('Invalid quantity - ' + Qty, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid quantity', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function FormatDoubleTo2DP(const Value: variant): string;
begin
  if (VarType(Value) = VarString) or (VarType(Value) = VarUString) then
  begin
    if Trim(Value) = '' then
    begin
      MessageDlg('Value must be entered', mtError, [mbOK], 0);
      Result := 'X';
      Exit;
    end;
  end;
  try
    begin
      if (VarType(Value) = VarString) or (VarType(Value) = VarUString) then
        Result := FormatFloat('######0.00', StrToFloatDef(Value, 0, FormatSettings))
      else
        Result := FormatFloat('######0.00', Value);
    end;
  except
    if (VarType(Value) = VarString) or (VarType(Value) = VarUString) then
      MessageDlg('Invalid entry - ' + Value, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid entry ', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function FormatMoney(const Money: variant): string;
begin
  if (VarType(Money) = VarString) or (VarType(Money) = VarUString) then
  begin
    if Trim(Money) = '' then
    begin
      Result := '';
      Exit;
    end;
  end;
  try
    begin
      if (VarType(Money) = VarString) or (VarType(Money) = VarUString) then
        Result := FormatFloat('######0.00', StrToFloatDef(Money, 0, FormatSettings))
      else
        Result := FormatFloat('######0.00', Money);
    end;
  except
    if (VarType(Money) = VarString) or (VarType(Money) = VarUString) then
      MessageDlg('Invalid financial value - ' + Money, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid financial value', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function ShellFileOperation(const fromFileOrFolder, toFileOrFolder: string; Flag: Integer): boolean;
var
   shellinfo: TSHFileOpStruct;
begin
   FillChar(shellinfo, sizeof(shellinfo), 0);
   with shellinfo do
   begin
     wnd   := Application.Handle;
     wFunc := Flag; //FO_MOVE, FO_COPY, FO_DELETE or FO_RENAME
     pFrom := PWideChar(fromFileOrFolder);
     pTo   := PWideChar(toFileOrFolder);
   end;
   result := SHFileOperation(shellinfo) = 0;
end;

procedure DirectoryCopy(asource, atarget: string);
var
  s,t:tfilestream;
  BytesToCopy: Integer ;
  SearchRec: TSearchRec;
  iCount: integer;
begin
  // search for the first file
  aSource := aSource + '\';
  aTarget := aTarget + '\';

  if not DirectoryExists(aTarget) then
    CreateDir(aTarget);

  icount := FindFirst(aSource + '*.*', faArchive, SearchRec);

  while iCount = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          s := tfilestream.create(aSource + SearchRec.Name,fmOpenread);

          try
            t := tfilestream.create(aTarget + SearchRec.Name,fmcreate);
            try
              While s.position < s.size do
                begin
                  if (s.size - s.position) < 10000 then
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
      iCount := FindNext(SearchRec);
    end;
end;

procedure FileCopy(const sourcefilename,targetfilename: string);
var
  s,t:tfilestream;
  BytesToCopy: Integer ;
begin
  s:=tfilestream.create(sourcefilename,fmOpenread);

  try
    t:=tfilestream.create(targetfilename,fmcreate);
    try
      While s.position < s.size do
        begin
          if (s.size - s.position) < 10000 then
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

{ TCCSRegistry }

function TCCSRegistry.ReadBoolEx(const Name: string; Default: boolean): Boolean;
begin
  if ValueExists(Name) then
    Result := ReadBool(Name)
  else
    Result := Default;
end;

function TCCSRegistry.ReadIntegerEx(const Name: string; Default: Integer): Integer;
begin
  if ValueExists(Name) then
    Result := ReadInteger(Name)
  else
    Result := Default;
end;

function TCCSRegistry.ReadCurrencyEx(const Name: string; Default: Currency): Currency;
begin
  if ValueExists(Name) then
    Result := ReadCurrency(Name)
  else
    Result := Default;
end;

function TCCSRegistry.ReadStringEx(const Name: string; const Default: string): string;
begin
  if ValueExists(Name) then
    Result := ReadString(Name)
  else
    Result := Default;
end;

function GetRegKey(const TempPath, TempKey: string): string;
var
  Reg: TRegistry;
begin
  result := '';
  Reg := TRegistry.create;
  try
    Reg.rootkey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey(TempPath,False) then
      result := Reg.Readstring(TempKey);
  finally
    Reg.free;
  end;
end;

procedure SetRegKey(const TempPath, TempKey, TempValue: string);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.create;
  try
    Reg.rootkey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey(TempPath,true);
    Reg.WriteString(TempKey,TempValue);
  finally
    Reg.free;
  end;
end;

{ FireDAC }
procedure ParseException(Exc: EFDDBEngineException);
begin
  case Exc.Kind of
    ekUKViolated:
      MessageDlg('Unique Key violation. This record cannot be deleted.', mtError, [mbOk], 0);
    ekFKViolated:
      MessageDlg('Foreign Key violation. This record cannot be deleted.', mtError, [mbOk], 0);
  else
    MessageDlg(Exc.Message, mtError, [mbOk], 0);
  end;
end;

procedure ConfigureFDConnection(const Connection: TFDConnection);
begin
  Connection.FetchOptions.Mode := fmAll;
  Connection.FormatOptions.OwnMapRules := True;
  Connection.FormatOptions.MapRules.Clear;
  Connection.FormatOptions.MapRules.Add(dtDateTimeStamp, dtDateTime);
  Connection.FormatOptions.MapRules.Add(dtBCD, dtDouble);
  Connection.FormatOptions.MapRules.Add(dtAnsiString, dtWideString);
end;

procedure CopyDocuments(const FilesDialog: TOpenDialog; const Folder: string; const ExecuteBlock: TProc);
var
  SourceFileName, DestFileName: string;
begin
  if not DirectoryExists(Folder) then
   	CreateDirectory(Folder);

  FilesDialog.Files.Clear;
  if FilesDialog.Execute then
  begin
    for SourceFileName in FilesDialog.Files do
    begin
      DestFileName := Folder;
      DestFileName := IncludeTrailingPathDelimiter(DestFileName) + ExtractFileName(SourceFileName);

      FileCopy(SourceFileName, DestFileName);
    end;

    if FilesDialog.Files.Count > 0 then
      ExecuteBlock;
  end;
end;

procedure CopyDocumentsFromClipboard(const Folder: string; const ExecuteBlock: TProc);
var
  Handle: THandle;
  Buff: array [0..MAX_PATH] of Char;
  Index, NumberOfFiles: Integer;
  SourceFileName, DestFileName: string;
begin
  if not DirectoryExists(Folder) then
    CreateDirectory(Folder);

  Clipboard.Open;
  try
    Handle := Clipboard.GetAsHandle(CF_HDROP);
    if Handle <> 0 then
    begin
      NumberOfFiles := DragQueryFile(Handle, $FFFFFFFF, nil, 0);
      for Index := 0 to NumberOfFiles - 1 do
      begin
        Buff[0] := #0;
        DragQueryFile(Handle, Index, Buff, SizeOf(Buff));

        SourceFileName := Buff;

        DestFileName := Folder;
        DestFileName := IncludeTrailingPathDelimiter(DestFileName) + ExtractFileName(SourceFileName);

        FileCopy(SourceFileName, DestFileName);
      end;
    end;
  finally
    Clipboard.Close;
  end;

  ExecuteBlock;
end;

{ WinControl WinControlSetData }
function FormatDateasDateTime(sDate: string): TDateTime;
var
  icount, iStart, iLength: integer;
  tmpDate: string;
  Months: array [1..2,1..12] of string;
begin
  iStart := pos(',',sDate)+1;
  iLength := length(sDate);
  tmpDate := copy(sDate,iStart,21);

  Months[1,1] := '01';
  Months[1,2] := '02';
  Months[1,3] := '03';
  Months[1,4] := '04';
  Months[1,5] := '05';
  Months[1,6] := '06';
  Months[1,7] := '07';
  Months[1,8] := '08';
  Months[1,9] := '09';
  Months[1,10] := '10';
  Months[1,11] := '11';
  Months[1,12] := '12';

  Months[2,1] := 'Jan';
  Months[2,2] := 'Feb';
  Months[2,3] := 'Mar';
  Months[2,4] := 'Apr';
  Months[2,5] := 'May';
  Months[2,6] := 'Jun';
  Months[2,7] := 'Jul';
  Months[2,8] := 'Aug';
  Months[2,9] := 'Sep';
  Months[2,10] := 'Oct';
  Months[2,11] := 'Nov';
  Months[2,12] := 'Dec';

  for icount := 1 to 12 do
    begin
      if pos(' '+Months[2,icount]+' ',tmpDate) > 0 then
        begin
          tmpDate := stringreplace(tmpDate,' '+Months[2,icount]+' ','/'+Months[1,icount]+'/',[]);
          break;
        end;
    end;
  iLength := length(tmpDate);
  result := padatestr(copy(trim(tmpDate),1,10));
end;

function ParseDocumentFrom(tmpFrom: string): string;
var
  icount: integer;
  Alphas, Numbers: string;
begin
  Alphas := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ';
  Numbers := '01234567890.';

  Result := '';

  if pos('@',tmpFrom) = 0 then
    begin
      for icount := 1 to length(tmpFrom) do
        begin
          if pos(copy(tmpFrom,icount,1),Alphas) > 0 then
            begin
              Result := Result + copy(tmpFrom,icount,1);
              continue;
            end;
          if pos(copy(tmpFrom,icount,1),Numbers) > 0 then
            begin
              Result := Result + copy(tmpFrom,icount,1);
              continue;
            end;
        end;
    end
  else
    result := trim(stringreplace(tmpFrom,'"', ' ',[rfReplaceAll]));
end;

procedure ParseMessage(const AFileName: string; var ATo, AFrom, ASubject, ADate, ABody: string);
var
  Lines: TArray<string>;
  iLength: integer;
  MyUnicode: Boolean;
  MyFileStream: TFileStream;
  MyFileSize: Integer;
  MyDataHandle: HGlobal;
  MyBuffer: Pointer;
  MyLockBytes: ILockBytes;
  MyStorage: IStorage;
  MyHeader: string;
  MyStrings: TStrings;

  function MyGetProperty(const AStorage: IStorage; AProperty: Word): string;
  const
    MyTString: array[Boolean] of Word = (PT_STRING8, PT_UNICODE);
  var
    MyIStream: IStream;
    MyStreamName: WideString;
    MyOleStream: TOleStream;
    MyStream: TMemoryStream;
    MySucceeded: Boolean;
  begin
    { Construct the predefined stream name }
    MyStreamName := Format('__substg1.0_%.4x%.4x', [AProperty, MyTString[MyUnicode]]);
    { Read a stream, if present, within the storage. }
    MySucceeded := Succeeded(AStorage.OpenStream(PWideChar(MyStreamName), nil,
      STGM_READ or STGM_SHARE_EXCLUSIVE, 0, MyIStream));
    if not MySucceeded then
    begin
      { Turn MyUnicode over }
      MyUnicode := not MyUnicode;
      MyStreamName := Format('__substg1.0_%.4x%.4x', [AProperty, MyTString[MyUnicode]]);
      MySucceeded := Succeeded(AStorage.OpenStream(PWideChar(MyStreamName), nil,
        STGM_READ or STGM_SHARE_EXCLUSIVE, 0, MyIStream));
    end;
    if MySucceeded then
    begin
      MyOleStream := TOleStream.Create(MyIStream);
      try
        MyStream := TMemoryStream.Create;
        try
          MyStream.CopyFrom(MyOleStream, 0);
          if MyUnicode then
            Result := PWideChar(MyStream.Memory)
          else
            Result := PChar(MyStream.Memory);
          SetLength(Result, StrLen(PChar(Result))); //  Remove the final #0
        finally
          MyStream.Free;
        end;
      finally
        MyOleStream.Free;
      end;
    end;
  end;

  procedure FetchLines(Source: TArray<string>; Destination: TStrings);
  var
    Content: string;
  begin
    for Content in Source do
      Destination.Add(Content);
  end;

begin
{ Open the copy of the message stored in the project directory }
  MyFileStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    MyFileSize := MyFileStream.Size;
{ Open the file as a Structured Storage }
    MyDataHandle := GlobalAlloc(GMEM_MOVEABLE, MyFileSize);
    try
      MyBuffer := GlobalLock(MyDataHandle);
      try
        MyFileStream.ReadBuffer(MyBuffer^, MyFileSize);
      finally
        GlobalUnlock(MyDataHandle);
      end;

      OleCheck(CreateILockBytesOnHGlobal(MyDataHandle, True, MyLockBytes));
      OleCheck(StgOpenStorageOnILockBytes(MyLockBytes, nil, STGM_READWRITE or
        STGM_SHARE_EXCLUSIVE, nil, 0, MyStorage));

{ Outlook 97/2000 return ANSI strings, Outlook XP/2003 return Unicode strings.
 MyUnicode will be turned on/off in MyGetProperty automatically. }
      MyUnicode := True;
{ If the message came from the Internet, it has got a RFC-compliant header }
      MyHeader := MyGetProperty(MyStorage, PR_TRANSPORT_MESSAGE_HEADERS);
{ Otherwise, construct a simple substitute from internal properties. }
      if MyHeader = '' then begin
        MyHeader :=
          'To: ' + MyGetProperty(MyStorage, PR_DISPLAY_TO) +
          ' ' + MyGetProperty(MyStorage, PR_DISPLAY_CC) +
          ' ' + MyGetProperty(MyStorage, PR_DISPLAY_BCC) + #13#10 +
          'From: ' + MyGetProperty(MyStorage, PR_SENDER_NAME) +
          ' ' + MyGetProperty(MyStorage, PR_SENDER_EMAIL_ADDRESS) + #13#10 +
          'Subject: ' + MyGetProperty(MyStorage, PR_SUBJECT) + #13#10 +
          'Date: ' + MyGetProperty(MyStorage, PR_LAST_MODIFICATION_TIME);
      end;
      ABody := MyGetProperty(MyStorage, PR_BODY);

    finally
      GlobalFree(MyDataHandle);
    end;
  finally
    MyFileStream.Free;
  end;

  { Parse the header as an RFC-compliant header. Exploit INI-files support buil-in in TStrings }
  MyHeader := StringReplace(MyHeader, 'To: ', 'To=', [rfReplaceAll, rfIgnoreCase]);
  MyHeader := StringReplace(MyHeader, 'From: ', 'From=', [rfReplaceAll, rfIgnoreCase]);
  MyHeader := StringReplace(MyHeader, 'Subject: ', 'Subject=', [rfReplaceAll, rfIgnoreCase]);
  MyHeader := StringReplace(MyHeader, 'Date: ', 'Date=', [rfReplaceAll, rfIgnoreCase]);
  MyStrings := TStringList.Create;
  try
    Lines := MyHeader.Split([sLineBreak]);
    FetchLines(Lines, MyStrings);
    ATo := MyStrings.Values['To'];
    AFrom := MyStrings.Values['From'];
    AFrom := ParseDocumentFrom(AFrom);
    ASubject := MyStrings.Values['Subject'];
    ADate := MyStrings.Values['Date'];
  finally
    MyStrings.Free;
    Lines := nil;
  end;
{ Trancate the body text and remove line-ends }
  ABody := StringReplace(Copy(ABody, 0, 64), #13, ' ', [rfReplaceAll]);
  ABody := StringReplace(ABody, #10, ' ', [rfReplaceAll]) + ' ...';
end;

procedure IterateFilesDropped(const FilesList: TUnicodeStrings; Process: TProcessDroppedFiles); overload;
var
  I: Integer;
  FileName: string;
begin
  for I := 0 to Pred(FilesList.Count) do
  begin
    FileName := FilesList[I];
    Process(FileName);
  end;
end;

procedure ProcessDroppedFile(const FileName, Path: string; ShowDocuments: TProc);
const
  cExtensionOutlook = '.msg';
  cExtensionOutlookExpress = '.eml';
  cNotOutlookWarning = 'This file doesn''t come from Microsoft Outlook.';
  cOutlookExpressWarning = #13#10'Apparently the file comes from MS Outlook Express.';
var
  i: Integer;
  MyPath, MyFileName, MyFilePath, MyExtension, MyWarning: string;
  MyTo, MyFrom, MySubject, MyDate, MyBody: string;
  myNewDate: TDateTime;
  MyFileStream: TStream;
  NewFilePath: string;
  sFile, sFullFile: string;
  iLength, iPos, icount: integer;
begin
  MyPath := Path;
  if not DirectoryExists(MyPath) then
    CreateDirectory(MyPath);

  MyFileName := FileName;

  MyExtension := LowerCase(ExtractFileExt(MyFileName));

  if MyExtension = cExtensionOutlook then
  begin
    { Store the contents as a file on the disk. }
    MyFilePath := IncludeTrailingPathDelimiter(MyPath) + ExtractFileName(MyFileName);

    {If the file name already exists then increase the number}
    icount := 0;
    NewFilePath := MyFilePath;
    while FileExists(NewFilePath) = true do
    begin
      inc(icount);
      NewFilePath := copy(MyFilePath, 1, length(MyFilePath)-4) + '(' + inttostr(icount) + ')' + MyExtension;
    end;

    MyFilePath := NewFilePath;

    FileCopy(FileName, MyFilePath);

    { GUI }
    try
      ParseMessage(MyFilePath, MyTo, MyFrom, MySubject, MyDate, MyBody);
      if trim(MyDate).IsEmpty then
        myNewDate := date
      else
        myNewDate := FormatDateasDateTime(MyDate);
    except
      myNewDate := date
    end;

    //  This is where we add the data into the grid and to the document component
    ShowDocuments;
  end
  else
  begin
    sFile := IncludeTrailingPathDelimiter(MyPath) + ExtractFileName(MyFileName);

    FileCopy(myFileName, sFile) ;

    ShowDocuments;
  end;
end;

procedure MyWinControlSetData(const FilesList: TUnicodeStrings; const Path: string; ShowDocuments: TProc);
begin
  IterateFilesDropped(FilesList,
    procedure(var FileName: string)
    begin
      ProcessDroppedFile(FileName, Path, ShowDocuments);
    end);
end;

{ TDirDlg }
function ItemIDListToPath(PIDL: PItemIDList): string;
var
  szPath: array[0..MAX_PATH] of char;
begin
  if ShGetPathFromIDList(PIDL, @szPath) then
    Result := string(szPath)
  else
    Result := '';
end;

function ItemIDListToDisplayName(PIDL: PItemIDList): string;
var
  pDesktopFolder: ISHELLFOLDER;
  STRRET: TSTRRET;
begin
  if Succeeded(SHGetDesktopFolder(pDesktopFolder)) then
  try
    pDesktopFolder.GetDisplayNameOf(PIDL, SHGDN_NORMAL, STRRET);
    case STRRET.uType of
      STRRET_CSTR: Result := string(STRRET.cStr);
      STRRET_WSTR: Result := WideCharToString(STRRET.pOLEStr);
      STRRET_OFFSET: Result := StrPas(Pchar(PIDL) + STRRET.uOffset);
    end;
  finally
    pDesktopFolder._Release;
  end
  else
    Result := '';
end;

function PathToItemIDList(APath: string): PItemIDList;
var
  pidl: PITEMIDLIST;
  pDesktopFolder: ISHELLFOLDER;
  olePath: array[0..MAX_PATH] of TOLECHAR;
  chEaten: ULONG;
  dwAttributes: ULONG;
  AnsiPath: AnsiString;
begin
  if Succeeded(SHGetDesktopFolder(pDesktopFolder)) then
  try
    AnsiPath := AnsiString(APath);
    MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, PAnsiChar(AnsiPath), -1, olePath, MAX_PATH);
    if Succeeded(pDesktopFolder.ParseDisplayName(0, nil, olePath, chEaten, pidl, dwAttributes)) then
      Result := pidl
    else
      Result := nil;
  finally
    pDesktopFolder._Release;
  end
  else
    Result := nil;
end;

function glBrowseCallback(Wnd: HWND; Msg: UINT; lParam: LPARAM; lData: TDirDlg): integer; stdcall;
begin
  Result := lData.BrowserCallback(Wnd, Msg, lParam);
end;

function OptionsToFlags(AOptions: TDirDlgOptions): UINT;
var
  SBO: TDirDlgOption;
const
  SBOArray: array[TDirDlgOption] of UINT = (
    BIF_BROWSEFORCOMPUTER, BIF_BROWSEFORPRINTER, BIF_DONTGOBELOWDOMAIN,
    BIF_RETURNFSANCESTORS, BIF_RETURNONLYFSDIRS, BIF_STATUSTEXT);
begin
  Result := 0;
  for SBO := Low(TDirDlgOption) to High(TDirDlgOption) do
    if SBO in AOptions then
      Result := Result or SBOArray[SBO];
end;

constructor TDirDlg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fOptions := [shbReturnFSAncestors, shbReturnOnlyFSDirs];
end;

function TDirDlg.Execute: boolean;
var
  BI: TBrowseInfo;
  RootPIDL: PItemIDList;
  IDList: PItemIDList;
  Malloc: IMalloc;
  PathSelected: array[0..MAX_PATH] of char;
begin
  FillChar(BI, Sizeof(BI), #00);
  with BI do begin
    if Owner is TWinControl then
      hwndOwner := TWinControl(Owner).Handle
    else
      hwndOwner := 0;
    if RootPath <> '' then
      if lowercase(RootPath) = 'mycomputer' then
      begin
        SHGetSpecialFolderLocation(hwndOwner, CSIDL_DRIVES, RootPIDL);
        pidlRoot := RootPIDL;
      end
      else
      begin
        RootPIDL := PathToItemIDList(RootPath);
        pidlRoot := RootPIDL;
      end
    else
      RootPIDL := nil;
    ulFlags := OptionsToFlags(fOptions);
    pszDisplayName := @PathSelected;
    if fPrompt <> '' then
      lpszTitle := Pchar(fPrompt);
    lpfn := @glBrowseCallback;
    lParam := longint(Self);
  end;
  Result := true;
  IDList := SHBrowseForFolder(BI); // display the dialog modally
  if RootPIDL <> nil then
  begin
    SHGetMalloc(Malloc);
    Malloc.Free(RootPIDL);
  end;
  fDialogWnd := 0;
  if IDList <> nil then
  begin
    fPathName := ItemIDListToPath(IDList);
    { Next line omitted, causes access violation after three calls in a row }
    { fDisplayName := ItemIDListToDisplayName(IDList); }
    SHGetMalloc(Malloc);
    Malloc.Free(IDList);
  end
  else
  begin
    fPathName := '';
    fDisplayName := '';
    Result := false;
  end;
end;

function TDirDlg.BrowserCallback(Wnd: HWND; Msg: UINT; lParam: LPARAM): integer;
var
  Temp: string;
begin
  Result := 0;
  if Msg = BFFM_INITIALIZED then
  begin
    fDialogWnd := Wnd;
    if InitialPath <> '' then
      SetSelection(fInitialPath);
    if fStatusText <> '' then
      SetStatusText(fStatusText);
    if fCaption <> '' then
      Caption := fCaption;
    if Assigned(fOnInitialize) then
      fOnInitialize(Self);
  end
  else
    if Msg = BFFM_SELCHANGED then
      if fDialogWnd <> 0 then
        if Assigned(fOnSelChange) then
        begin
          Temp := ItemIDListToPath(PItemIDLIST(lParam));
          if Temp = '' then
          begin
            Temp := ItemIDListToDisplayName(PItemIDLIST(lParam));
            fOnSelChange(Self, Temp, true);
          end
          else
            fOnSelChange(Self, Temp, false);
        end;
end;

procedure TDirDlg.SetCaption;
begin
  fCaption := Value;
  if fDialogWnd <> 0 then
    SendMessage(DialogWnd, WM_SETTEXT, 0, longint(PChar(fCaption)));
end;

procedure TDirDlg.EnableOK(Enable: boolean);
var
  wParam: Cardinal;
begin
  if Enable then
    wParam := 1
  else
    wParam := 0;
  if DialogWnd <> 0 then
    SendMessage(DialogWnd, BFFM_ENABLEOK, wParam, wPAram);
end;

procedure TDirDlg.SetSelection(const Value: string);
begin
  if DialogWnd <> 0 then
    SendMessage(DialogWnd, BFFM_SETSELECTION, 1, longint(Pchar(fInitialPath)));
end;

procedure TDirDlg.SetStatusText;
begin
  fStatusText := Value;
  if DialogWnd <> 0 then
    SendMessage(DialogWnd, BFFM_SETSTATUSTEXT, 0, longint(Pchar(fStatusText)));
end;

function paDateStr(const vIn: variant): variant;
begin
  if VarType(vIn) = VarDate then
  begin
    if vIn = 0 then
      Result := ''
    else
      Result := DateToStr(vIn);
  end
  else
    if (VarType(vIn) = VarUString) or (VarType(vIn) = VarString) or (VarType(vIn) = VarUString) then
  begin
    if Trim(vIn) = '' then
      Result := 0
    else
      Result := StrToDate(vIn);
  end
  else
    Result := Unassigned;
end;

procedure ResetGridCols(Grid: TDBGrid);
var
  fieldInx: integer;
begin
//Used to redisplay dbgrid cols based on the visibility specified by the underlying
//fields. Needed because col widths are sometimes written to inifiles and if new
//fields are added to queries behind the grid, the inifiles will have no record
//of the width or visibility of the new field.
  grid.Columns.RebuildColumns;

  for fieldInx := (grid.DataSource.DataSet.FieldCount - 1) downto 0 do
  begin
    if grid.DataSource.DataSet.Fields[fieldInx].Visible then
    begin
      grid.Columns[fieldInx].Width := 80;
    end
    else
    begin
      grid.Columns.Delete(fieldInx);
    end;
  end;
end;

procedure SetDBGridCols(formName, sectionName, iniFileName: string; dbGrid: TDBGrid);
//sectionName - eg 'StockLU Col Order' is used because past versions of the program
//created section names in the ini file in this format

//in future pass the form name to the function and an empty string as the section 
//name, then the different sections of the ini file will use the form names
var
  IniFile: TIniFile;
  userPrefExist, colMatched: boolean;
  tempGrid: TDBGrid;
  colOrder, colName, colAlignment: String;
  colInx, tempColInx: integer;
begin
  if formName <> '' then
    sectionName := formName;

  IniFile := TIniFile.Create(iniFileName);
  try
    userPrefExist := IniFile.ReadBool(sectionName, 'UserPrefs', false);
    if (userPrefExist=true) then
    begin
      tempGrid := TDBGrid.Create(nil);
      tempGrid.Visible := false;
      try
        //first read all the col settings from the ini file into a temporary grid
        tempColInx := 0;
        colOrder := 'Col'+IntToStr(tempColInx);
        colName := IniFile.ReadString(sectionName, colOrder + 'Field', '');
        while colName <> '' do
        begin
          with tempGrid.Columns.Add do
          begin
            fieldname := colName;
            title.caption := IniFile.ReadString(sectionName, colOrder + 'Caption', '');
            width := IniFile.ReadInteger(sectionName, colOrder + 'Width', 40);

            colAlignment := IniFile.ReadString(sectionName, colOrder + 'Alignment', '');
            if colAlignment = 'left' then
              Alignment := taLeftJustify
            else if colAlignment = 'right' then
              Alignment := taRightJustify
            else if colAlignment = 'center' then
              Alignment := taCenter;
          end;

          inc(tempColInx);
          colOrder := 'Col'+IntToStr(tempColInx);
          colName := IniFile.ReadString(sectionName, colOrder + 'Field', '');
        end;

        //second remove fields from the temp grid that have been removed from the
        //designed grid
        for tempColInx := tempGrid.Columns.Count - 1 downto 0 do
        begin
          colMatched := false;
          for colInx := 0 to dbGrid.Columns.count - 1 do
          begin
            if (uppercase(tempGrid.Columns[tempColInx].FieldName)) =
               (uppercase(dbGrid.Columns[colInx].FieldName)) then
            begin
              tempGrid.Columns[tempColInx].Alignment :=
                dbGrid.Columns[colInx].Alignment;
              tempGrid.Columns[tempColInx].Title.Alignment :=
                dbGrid.Columns[colInx].Title.Alignment;
              colMatched := true;
              break;
            end;
          end;
          if colMatched = false then
          begin
            tempGrid.Columns.Delete(tempColInx);
          end;
        end;

        //third add new columns to tempgrid
        for colInx := 0 to dbGrid.Columns.count - 1 do
        begin
          colMatched := false;
          for tempColInx := 0 to tempGrid.Columns.Count - 1 do
          begin
            if (uppercase(tempGrid.Columns[tempColInx].FieldName)) =
               (uppercase(dbGrid.Columns[colInx].FieldName)) then
            begin
              colMatched := true;
              break;
            end;
          end;
          if colMatched = false then
          begin
            with tempGrid.Columns.add() do
            begin
              FieldName := dbGrid.Columns[colInx].FieldName;
              title.caption := dbGrid.Columns[colInx].title.caption;
              width := dbGrid.Columns[colInx].width;
              alignment := dbGrid.Columns[colInx].alignment;
            end;
          end;
        end;

        //fourth reset grid cols equal to temp grid cols
        for colInx := 0 to tempGrid.Columns.Count - 1 do
        begin
          dbGrid.Columns[colInx].FieldName := tempGrid.Columns[colInx].FieldName;
          dbGrid.Columns[colInx].title.caption :=
            tempGrid.Columns[colInx].title.caption;
          dbGrid.Columns[colInx].width := tempGrid.Columns[colInx].width;
          dbGrid.Columns[colInx].Alignment := tempGrid.Columns[colInx].Alignment;
          dbGrid.Columns[colInx].Title.Alignment :=
            tempGrid.Columns[colInx].Title.Alignment;
        end;
      finally
        tempGrid.Free;
      end;
    end;
  finally
    IniFile.Free;
  end;
end;

procedure SaveDBGridCols(formName, sectionName, iniFileName: string; dbGrid: TDBGrid);
var
  colInx, colWidth : integer;
  colOrder : String;
  colName, colCaption, colAlignment : String;
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create (iniFileName);
  try
    IniFile.EraseSection(sectionName);
    IniFile.WriteBool(sectionName, 'UserPrefs', true);
    for colInx := 0 to Pred(dbGrid.columns.count) do
    begin
      colOrder := 'Col' + IntToStr(colInx);
      colName := dbGrid.columns[colInx].fieldname;
      colCaption := dbGrid.columns[colInx].Title.caption;
      colWidth :=  dbGrid.columns[colInx].width;

      if dbGrid.columns[colInx].Alignment = taLeftJustify then
        colAlignment := 'left'
      else if dbGrid.columns[colInx].Alignment = taRightJustify then
        colAlignment := 'right'
      else
        colAlignment := 'center';

      IniFile.WriteString(sectionName, colOrder + 'Field', colName);
      IniFile.WriteString(sectionName, colOrder + 'Caption', colCaption);
      IniFile.WriteInteger(sectionName, colOrder + 'Width', colWidth);
      IniFile.WriteString(sectionName, colOrder + 'Alignment', colAlignment);
    end;
  finally
    IniFile.Free;
  end;
end;

procedure DeleteColSettings(sectionName, iniFileName: string);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create (iniFileName);
  try
    IniFile.EraseSection(sectionName);
  finally
    IniFile.Free;
  end;
end;

procedure SaveFormLayout(iniFileName: string; theForm: TForm);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create (iniFileName);
  try
    IniFile.WriteInteger('FormPositions', theForm.Name + 'Top', theForm.Top);
    IniFile.WriteInteger('FormPositions', theForm.Name + 'Left', theForm.Left);
    IniFile.WriteInteger('FormPositions', theForm.Name + 'Height', theForm.Height);
    IniFile.WriteInteger('FormPositions', theForm.Name + 'Width', theForm.Width);
  finally
    IniFile.Free;
  end;
end;

procedure LoadFormLayout(iniFileName: string; theForm: TForm);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(iniFileName);

  try
    if IniFile.ReadInteger('FormPositions', theForm.Name+'Top', -1) <> -1 then
    begin
      theForm.Position := poDesigned;
      theForm.Top := IniFile.ReadInteger('FormPositions', theForm.Name+'Top', theForm.Top);
      theForm.Left := IniFile.ReadInteger('FormPositions', theForm.Name+'Left', theForm.Left);
      theForm.Height := IniFile.ReadInteger('FormPositions', theForm.Name+'Height', theForm.Height);
      theForm.Width := IniFile.ReadInteger('FormPositions', theForm.Name+'Width', theForm.Width);
    end;
  finally
    IniFile.Free;
  end;
end;

function GetComputerNetName: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

function GetUserFromWindows: string;
var
   UserName : string;
   UserNameLen : Dword;
begin
   UserNameLen := 255;
   SetLength(userName, UserNameLen) ;
   If GetUserName(PChar(UserName), UserNameLen) Then
     Result := Copy(UserName,1,UserNameLen - 1)
   Else
     Result := 'Unknown';
end;

function GetWinDir : string;
var
   PathLen, BuffLen : integer;
begin
   PathLen := MAX_PATH + 1;
   SetLength(Result, PathLen);
   repeat
    BuffLen := PathLen;
     PathLen := GetWindowsDirectory(PChar(Result), BuffLen);
     if PathLen > 0 then
       SetLength(Result, PathLen)
     else
       raise EOSError.Create('Cannot get Windows directory');
   until PathLen <= BuffLen;
end;

function GetWinSysDir : string;
var
   PathLen, BuffLen : integer;
begin
   PathLen := MAX_PATH + 1;
   SetLength(Result, PathLen);
   repeat
    BuffLen := PathLen;
     PathLen := GetSystemDirectory(PChar(Result), BuffLen);
     if PathLen > 0 then
       SetLength(Result, PathLen)
     else
       raise EOSError.Create('Cannot get Windows System directory');
   until PathLen <= BuffLen;
end;

function GetWinTempDir : string;
var
  PathLen, BuffLen : integer;
begin
   PathLen := MAX_PATH + 1;
   SetLength(Result, PathLen);
   repeat
    BuffLen := PathLen;
     PathLen := GetTempPath(PathLen, @result[1]);
     if PathLen > 0 then
       SetLength(Result, PathLen)
     else
       raise EOSError.Create('Cannot get Windows temp directory');
   until PathLen <= BuffLen;
end;

procedure CreateDirectory(DirName: String);
begin
  SysUtils.ForceDirectories(DirName);
end;

function DirectoryExists(const Name: string): Boolean;
begin
  Result := SysUtils.DirectoryExists(Name);
end;

function GetSpecialFolderPath(folder : integer) : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  specialFolder : integer;
  Path: array [0..MAX_PATH] of Char;
begin
  Result := EmptyStr;

  case folder of
    //[Current User]\My Documents
    0: specialFolder := CSIDL_PERSONAL;
    //All Users\Application Data
    1: specialFolder := CSIDL_COMMON_APPDATA;
    //[User Specific]\Application Data
    2: specialFolder := CSIDL_LOCAL_APPDATA;
    //Program Files
    3: specialFolder := CSIDL_PROGRAM_FILES;
    //All Users\Documents
    4: specialFolder := CSIDL_COMMON_DOCUMENTS;
    else
      specialFolder := SHGFP_TYPE_CURRENT;
  end;

  if SUCCEEDED(SHGetFolderPath(0,specialfolder,0,SHGFP_TYPE_CURRENT,@path[0])) then
    Result := Path;

end;

procedure GetPrinterValues(var Copies: Integer; var Bin: TQRBin; var Size:
TQRPaperSize; var Duplex: Boolean);
var
   FDevice: PChar;
   FDriver: PChar;
   FPort: PChar;
   DeviceMode: THandle;
   DevMode: PDevMode;


   function Supported(Setting: Cardinal): Boolean;
   begin
      Result := (DevMode^.dmFields and Setting) = Setting;
   end;


   procedure GCopies; { Number of copies }
   begin
      if Supported(dm_copies) then
         Copies := DevMode^.dmCopies
      else
         Copies := 1;
   end;


   procedure GBin; { Paper bin }
   var
      aBin : integer;
      I : TQRBin;
   begin
      Bin := First;
      if Supported(dm_defaultsource) then
      begin
         aBin := DevMode^.dmDefaultSource;
         for I := First to Last do
         begin
            if cQRBinTranslate[I] = aBin then
            begin
               Bin := I;
               exit;
            end
         end
      end
   end;


   procedure GDuplex; { Duplex }
   begin
      if Supported(dm_duplex) and (DevMode^.dmDuplex <> dmdup_simplex) then
         Duplex := True
      else
         Duplex := False;
   end;


   procedure GPaperSize;
   var
      aSize : integer;
      I : TQRPaperSize;
   begin
      Size := Default;
      if Supported(dm_papersize) then
      begin
         aSize := DevMode^.dmPaperSize;
         for I := Default to Custom do
         begin
            if aSize = cQRPaperTranslate[I] then
            begin
               Size := I;
               exit;
            end
         end
      end
   end;


begin
   GetMem(FDevice, 128);
   GetMem(FDriver, 128);
   GetMem(FPort, 128);


   Printer.GetPrinter(FDevice, FDriver, FPort, DeviceMode);
   if DeviceMode = 0 then
      Printer.GetPrinter(FDevice, FDriver, FPort, DeviceMode);
   DevMode := GlobalLock(DeviceMode);


   GCopies;
   GBin;
   GDuplex;
   GPaperSize;


   GlobalUnlock(DeviceMode);
   FreeMem(FDevice, 128);
   FreeMem(FDriver, 128);
   FreeMem(FPort, 128);
end; {GetPrinterValues}

procedure GetPrinterMargins(var TopMar, BottomMar, LeftMar, RightMar:
Double);
var
   PixelsPerInch: TPoint;
   PhysPageSize: TPoint;
   OffsetStart: TPoint;
   PageRes: TPoint;
begin
   PixelsPerInch.y := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
   PixelsPerInch.x := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
   Escape(Printer.Handle, GETPHYSPAGESIZE, 0, Nil, @PhysPageSize);
   Escape(Printer.Handle, GETPRINTINGOFFSET, 0, Nil, @OffsetStart);
   PageRes.y := GetDeviceCaps(Printer.Handle, VERTRES);
   PageRes.x := GetDeviceCaps(Printer.Handle, HORZRES);


   TopMar := OffsetStart.y / PixelsPerInch.y;
   LeftMar := OffsetStart.x / PixelsPerInch.x;
   BottomMar := ((PhysPageSize.y - PageRes.y) / PixelsPerInch.y) -
(OffsetStart.y / PixelsPerInch.y);
   RightMar := ((PhysPageSize.x - PageRes.x) / PixelsPerInch.x) -
(OffsetStart.x / PixelsPerInch.x);
end; {GetPrinterMargins}

function GetBinSelection: integer;
var
  hDevMode: THandle;
  Device,Driver,Port: array [0..1024] of Char;
  bin: integer;
  DevMode : PDevMode;
begin
  Printer.GetPrinter (Device,Driver,Port,hDevMode);
  bin := -1;
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        bin := DevMode^.DMDEFAULTSOURCE;
        GlobalUnlock (hDevMode);
  end;
  result := bin;
end;

function SetUpPrinter(PrinterSettings : TPrinterSettings) : Boolean;
var
  PSDialog : TPrintDialog;
begin
  PSDialog := TPrintDialog.Create(nil);
  try

    PSDialog.Options := [poPageNums];
    PSDialog.Copies := 1;
    PSDialog.FromPage := 1;
    PSDialog.MinPage := 1;
    PSDialog.ToPage := 10000;
    PSDialog.MaxPage := 10000;
    Result := PSDialog.Execute;
    if Result then
    begin
      PrinterSettings.Copies := PSDialog.Copies;
      if PSDialog.PrintRange = prPageNums then
      begin
        PrinterSettings.FromPage := PSDialog.FromPage;
        PrinterSettings.ToPage := PSDialog.ToPage;
      end;
//      PrinterSettings.OutputBin := GetOutputBin;
    end;
  finally
    PSDialog.Free;
  end;

end;

{ TPrinterSettings }

constructor TPrinterSettings.Create;
begin

end;

function TPrinterSettings.GetPrinterIndex: integer;
begin
  Result := Printers.Printer.PrinterIndex;
end;

procedure TPrinterSettings.SetCopies(const Value: integer);
begin
  FCopies := Value;
end;

procedure TPrinterSettings.SetFromPage(const Value: integer);
begin
  FFromPage := Value;
end;

procedure TPrinterSettings.SetOutputBin(const Value: TQRBin);
begin
  FOutputBin := Value;
end;

procedure TPrinterSettings.SetToPage(const Value: integer);
begin
  FToPage := Value;
end;

{ TDBLookupComboBoxHelper }

function TDBLookupComboBoxHelper.ListValue: Variant;
begin
  Result := Self.ListSource.DataSet.FieldByName(Self.KeyField).Value;
end;

end.
