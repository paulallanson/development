unit CCSCommon;

interface

uses
  Classes, SysUtils, Windows, ShellAPI, ShlObj, Controls, Messages, Registry, COMobj, ActiveX, Math, strUtils,
  DBGrids, Grids, IniFiles, Forms, Variants, qrprntr, Printers, DB, shFolder, Outlook_TLB, Dialogs, DragDropFile,
  FireDAC.Comp.Client, FireDAC.Stan.Error, DBCtrls, Generics.Collections;

{Quick Reports Printer settings}
procedure GetPrinterMargins(var TopMar, BottomMar, LeftMar, RightMar: Double);
procedure GetPrinterValues(var Copies: Integer; var Bin: TQRBin; var Size: TQRPaperSize; var Duplex: Boolean);
function GetBinSelection: integer;

{dbGrid Routines}
procedure ResetGridCols(grid: TDBGrid);
procedure SetDBGridCols(formName, sectionName, iniFileName: string; dbGrid: TDBGrid);
procedure SaveDBGridCols(formName, sectionName, iniFileName: string; dbGrid: TDBGrid);
procedure DeleteColSettings(sectionName, iniFileName: string);

{TStringGrid Routines}
procedure AlignColumns(AlignLeftList: TList<Integer>; Grid: TStringGrid; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState; AlignToRight: Boolean = False; CallBack: TProc = nil);

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

{ Standard XML export}
procedure CreateNewXMLfile(filename: string);
procedure OpenXMLProperty(filename, tempField: string);
procedure CloseXMLProperty(filename, tempField: string);
procedure WriteXMLLine(filename, tempField, tempValue: string);
procedure WriteXMLProperty(filename, tempField: string);

{ Technique XML export}
procedure CreateTechCustXMLFile(filename: string);
procedure WriteTechCustXMLHead(filename: string; tempField: TField);
procedure WriteTechCustTypeXMLHead(filename: string);
procedure WriteTechAddrXMLHead(filename: string; tempField: TField);
procedure WriteTechContactXMLHead(filename: string; tempField: TField);
procedure WriteTechContactXMLFoot(filename: string);
procedure WriteTechAddrXMLFoot(filename: string);
procedure CloseTechCustXMLFile(filename: string);


procedure CreateTechXMLFile(filename: string);
procedure WriteTechXMLHead(filename: string; tempField: TField);
procedure WriteTechXMLMasterHead(filename: string);
procedure WriteTechXMLMasterFoot(filename: string);
procedure WriteTechXMLMasterLine(filename: string; tempField: TField);
procedure WriteTechXMLPostPressHead(filename: string);
procedure WriteTechXMLPostPressFoot(filename: string);
procedure WriteTechXMLPostPressLine(filename: string; tempField: TField);
procedure CloseTechXMLFile(filename: string);

{PDF Functions}
function MergePDFs(firstFilePath, secondFilePath, outputFilePath, contactName, date, estimateNumber, jobDescription: string): integer;

{ Utility functions }
function BoolToStr(const aBool : Boolean) : string;
function CrystalDate(const aDate : TDateTime) : string;
function PBFormatPONum(const aReal: Real; aLineNo: integer): string;
function PBDateStr(const vIn: variant): variant;
function IncrementNo(StartStr: string): string;
function CurrencyDisp(DisplayMask, CurrVal: string): string;
function PadWithZeros(const iNumber: real; iLength: integer): string;
function RoundFloat(TempVal: real; DecPlaces: integer): real;
{ If passed a string or a float, PostoNegQty will return a string.  An
  error message will be displayed if the value is invalid. }
function PostoNegQty(const Qty: variant): integer;
function ShowInPacks(iSinglesQty, iPackSize: Integer): String;
function InpToSing(sInpStr: String; iPackSize: Integer): Integer;
function FormatMoney(const Money: variant): string;
function FormatMoneyTo3DP(const Money: variant): string;
function FormatMoneyTo4DP(const Money: variant): string;
function FormatQty(const Qty: variant): string;
function FormatQtyto2DP(const Qty: variant): string;
function FormatQtyto3DP(const Qty: variant): string;
function FormatXMLString(tempData: string): string;
function FormatString(tempData: string): string;
function CalcTotalValue(TempQty, TempFactor: integer; TempValue: double): real;
function ConverttoWideString(tempFile: string): widestring;
function CountTextFileLines(var theTextFile: TextFile): integer;
procedure FileCopy(const SourceFileName, DestinationFileName: string);

{Retreive Windows stuff}
function GetWinDir : string;
function GetWinSysDir : string;
function GetWinTempDir : string;
procedure CreateDirectory(DirName: string);
function DirectoryExists(const Name: string): Boolean;
function GetSpecialFolderPath(folder: integer): string;

{Email Sending}
procedure EmailViaOutlook(sRecipient, sSubject, sBody: string; sAttachment: Tstrings; EmailApplication, EmailAccount: string);
procedure EmailBlindViaOutlook(sRecipient, sSubject, sBody: string; sAttachment: Tstrings; EmailApplication, EmailAccount: string);
procedure EmailandSaveViaOutlook(var sRecipient, sSubject, sBody, sFilepath: string; var okToSave: boolean; EmailApplication, EmailAccount: string);
procedure EmailandSaveBlindViaOutlook(var sRecipient, sSubject, sBody, sFilepath: string; var okToSave: boolean; EmailApplication, EmailAccount: string);

{Adding appointment Sending}
procedure AddAppViaOutlook(sLocation, sSubject, sBody: string; start: Tdatetime; bReminder: bytebool;
                          iminutesbefore: integer);
procedure AddAppBlindViaOutlook(sLocation, sSubject, sBody: string; start: Tdatetime; bReminder: bytebool;
                          iminutesbefore: integer);

{ Registry Stuff }
function GetRegKey(const TempPath, TempKey: string): string;
procedure SetRegKey(const TempPath, TempKey, TempValue: string);

{ FireDAC }
procedure ConfigureFDConnection(const Connection: TFDConnection);
procedure ParseException(AException: System.SysUtils.Exception);
function GetMSSQLID: string;

{ TOpenDialog }
procedure CopyDocuments(const FilesDialog: TOpenDialog; const Folder: string; const ExecuteBlock: TProc);
procedure CopyDocumentsFromClipboard(const Folder: string; const ExecuteBlock: TProc);

{ WinControl WinControlSetData }
procedure MyWinControlSetData(const FilesList: TUnicodeStrings; const Path: string; ShowDocuments: TProc);
procedure ProcessDroppedFile(const FileName, Path: string; ShowDocuments: TProc);

function GetAppIniFile: string;

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

  TProcessDroppedFiles = reference to procedure(var FileName: string);

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

  TDBLookupComboBoxHelper = class helper for TDBLookupComboBox
  public
    function ListValue: Variant;
  end;

resourcestring
  SOFTWARE_KEY = 'Software\'; { where we put our entries  }
  CCS_KEY = 'Centrereed Ltd\'; { the Company specific node }

  BASE_KEY = 'Base'; { Base settings		}
  SCRIBE_KEY = 'Scribe'; { Scribe settings	}
  BROKER_KEY = 'Broker'; { Broker settings  }

  BDE_KEY = 'Software\Borland\Database Engine'; { path to BDE settings }

implementation

uses
  System.UITypes, System.IOUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, Vcl.Clipbrd, taoMAPI, Vcl.AxCtrls,
  Vcl.Graphics;

type
  TVerInfo = (tVersion, tBuild, tModule, tDesc, tCopyright, tShortName);

const
  myRedeye_INIFILE = 'Redeye.ini';

  KEY_PREFIX = '\StringFileInfo\040904E4\';
  KEYS: array[TVerInfo] of string =
    ('FileVersion',
    'ProductVersion',
    'ModuleName',
    'FileDescription',
    'LegalCopyright',
    'ShortName'
    );

  xmlTab1 = #9;
  xmlTab2 = #9 + #9;
  xmlTab3 = #9 + #9 + #9;

  KFXMLHeadLine1 = '<?xml version="1.0"?>';
  KFXMLHeadLine2 = '<?xml-stylesheet type="text/xsl" href="order.xslt"?>';

  KFXMLOrderHeader = '<Order xsl:schemaLocation=''urn:schemas-basda-org:2000:purchaseOrder:xdr:3.01 order-v3.xsd '
                    + 'urn:schemas-bossfed-co-uk@OP=Order-v1 OP-Order-v1.xsd'
                    + ' xmlns:xsi=''http://www.w3.org/2001/XMLSchema-instance'''
                    + ' xmlns=''urn:schemas-basda-org:2000:purchaseOrder:xdr:3.01''>';

  TechXMLCustHeadLine1 = '<?xml version="1.0" encoding="utf-8"?>';
  TechXMLCustHeader = '<tg:companies xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
                      + ' xmlns:tg="http://www.technique-group.com"'
                      + ' xsi:schemaLocation="http://www.technique-group.com/schemas TGCompanyImport_v1.3.xsd" tg:version="1.2">';
  TechXMLCustType = xmlTab1 + '<tg:company_type tg:description="Customer" tg:customer="true"'
                      + ' tg:prospect="false" tg:supplier="false" tg:competitor="false"/>';
  TechXMLContactFooter = xmlTab3 + '</tg:contact>';
  TechXMLAddrFooter = xmlTab2 + '</tg:address>';
  TechXMLCompanyFooter = xmlTab1 + '</tg:company>';
  TechXMLCompaniesFooter = '</tg:companies>';

  TechXMLHeadLine1 = '<?xml version="1.0"?>';
  TechXMLHeadLine2 = '<?xml-stylesheet type="text/xsl" href="TGScheduleImport_v1.2.7.xsl"?>';
  TechXMLOrderHeader = '<tg:orders xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
                      + ' xmlns:tg="http://www.technique-group.com"'
                      + ' xsi:schemaLocation="http://www.technique-group.com/schemas TGScheduleImport_v1.2.8.xsd" tg:version="1.2">';
  TechXMLMasterHeader = xmlTab2 + '<tg:master_version>';
  TechXMLMasterFooter = xmlTab2 + '</tg:master_version>';
  TechXMLPostPressHeader = xmlTab2 + '<tg:post_press_version>';
  TechXMLPostPressFooter = xmlTab2 + '</tg:post_press_version>';
  TechXMLTaskInfoHeader = '<tg:task_info tg:confirmed="true" tg:maintenance="false" tg:provisional="false">';
  TechXMLTaskInfoFooter = xmlTab3 + '</tg:task_info>';
  TechXMLOrderFooter = xmlTab1 + '</tg:order>';
  TechXMLOrdersFooter = '</tg:orders>';

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
*)end;

function CCSGetBuild(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tBuild);
  except on E: Exception do
      Result := 'GetBuild error: ' + E.Message;
  end;
*)end;

function CCSGetModule(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tModule);
  except on E: Exception do
      Result := 'GetModule error: ' + E.Message;
  end;
*)end;

function CCSGetDescription(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tDesc);
  except on E: Exception do
      Result := 'GetDescription error: ' + E.Message;
  end;
*)end;

function CCSGetCopyRight(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tCopyRight);
  except on E: Exception do
      Result := 'GetCopyRight error: ' + E.Message;
  end;
*)end;

function CCSGetShortName(const FileName: string): string;
begin
(*  try
    Result := CCSReadCodeFile(FileName, tShortName);
  except on E: Exception do
      Result := 'GetShortName error: ' + E.Message;
  end;
*)end;

procedure EmailViaOutlook(sRecipient, sSubject, sBody: string; sAttachment: Tstrings; EmailApplication, EmailAccount: string);
var
	Outlook		 : OutlookApplication;
	Unknown		 : IUnknown;
	Result		 : HResult;
	MI			 : MailItem;
  bOutlookRunning: boolean;
  i: integer;
//  iPos: integer;
//  sHTML: string;
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
	else begin
		// make sure no other error occurred during GetActiveObject
		OleCheck(Result);
		OleCheck(Unknown.QueryInterface(OutlookApplication, Outlook));
	end;

	MI := Outlook.CreateItem(olMailItem) as MailItem;

  if (EmailApplication = 'OUT2007') or (EmailApplication = 'OUT2010') or (EmailApplication = 'OUT2013') then
    begin
      if EmailAccount <> '' then
        MI.SendUsingAccount := Outlook.Session.accounts.item(EmailAccount);
    end;

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

procedure EmailBlindViaOutlook(sRecipient, sSubject, sBody: string; sAttachment: Tstrings; EmailApplication, EmailAccount: string);
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
	else begin
		// make sure no other error occurred during GetActiveObject
		OleCheck(Result);
		OleCheck(Unknown.QueryInterface(OutlookApplication, Outlook));
	end;

	MI := Outlook.CreateItem(olMailItem) as MailItem;

  if (EmailApplication = 'OUT2007') or (EmailApplication = 'OUT2010') or (EmailApplication = 'OUT2013') then
    begin
      if EmailAccount <> '' then
        MI.SendUsingAccount := Outlook.Session.accounts.item(EmailAccount);
    end;

  MI.Bodyformat := olFormatHTML;
  MI.GetInspector;

//  if trim(sRecipient) <> '' then
//	  MI.Recipients.Add(sRecipient);

  if trim(sRecipient) <> '' then
    MI.To_ := sRecipient;

	try
    for i := 0 to pred(sAttachment.count) do
      MI.Attachments.Add(sAttachment[i],EmptyParam, EmptyParam, EmptyParam);
  except
  end;

	MI.Subject := sSubject;
  MI.HTMLBody := '<HTML><BODY>'+sBody+'</BODY></HTML>' + MI.HTMLBody;
//	MI.Body := sBody;

  try
    MI.send;
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

  if (EmailApplication = 'OUT2007') or (EmailApplication = 'OUT2010') or (EmailApplication = 'OUT2013') then
    begin
      if EmailAccount <> '' then
        MI.SendUsingAccount := Outlook.Session.accounts.item(EmailAccount);
    end;

  MI.Bodyformat := olFormatHTML;
  MI.GetInspector;

//  if trim(sRecipient) <> '' then
//	  MI.Recipients.Add(sRecipient);

  if trim(sRecipient) <> '' then
    MI.To_ := sRecipient;

  MI.Subject := sSubject;
  MI.HTMLBody := '<HTML><BODY>'+sBody+'</BODY></HTML>' + MI.HTMLBody;
//	MI.Body := sBody;

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
      if (copy(svDlgOfficeDoc.FileName, 1, length(sFilePath)) = sFilePath) then
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
          MessageDlg('You can''t save a document outside the Company Document Directory',
                                                mtError,[mbOK],0) ;
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

procedure EmailandSaveBlindViaOutlook(var sRecipient, sSubject, sBody, sFilepath: string; var okToSave: boolean; EmailApplication, EmailAccount: string);
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
  {userCancelled,} saveIT: boolean;
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

  if (EmailApplication = 'OUT2007') or (EmailApplication = 'OUT2010') or (EmailApplication = 'OUT2013') then
    begin
      if EmailAccount <> '' then
        MI.SendUsingAccount := Outlook.Session.accounts.item(EmailAccount);
    end;

  MI.Bodyformat := olFormatHTML;
  MI.GetInspector;

//  if trim(sRecipient) <> '' then
//	  MI.Recipients.Add(sRecipient);

  if trim(sRecipient) <> '' then
    MI.To_ := sRecipient;

  MI.Subject := sSubject;
  MI.HTMLBody := '<HTML><BODY>'+sBody+'</BODY></HTML>' + MI.HTMLBody;
//	MI.Body := sBody;

  try
    MI.Display(EmptyParam);
  except
  end;

  if messageDlg('Click OK to move the email into the Documents section.', mtConfirmation, [mbOK, mbCancel], 0) = mrOK then
    begin
      sleep(2000);
      SaveIT := false;
      okToSave := true;

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
//              createTime := temp_MI.creationTime;
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
//          userCancelled := true;
          okToSave := false;
        end;
      end
      else
      begin
        Save_MI.SaveAs(sFilePath+'\'+sSubject+'.msg',olMSG);
      end;
    end;
end;

procedure AddAppBlindViaOutlook(sLocation, sSubject, sBody: string; start: Tdatetime; bReminder: bytebool;
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

  {Check if Outlook is already running, this uses Outlook 2000 upwards}
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
  AI.Location := sLocation;
  AI.ReminderSet := bReminder;
  AI.ReminderMinutesBeforeStart := iMinutesBefore;
  AI.Body := sBody;
  AI.Save;

  if not(bOutlookRunning) then
    begin
	    Showmessage('Please click OK when the appointment has been made');
      Outlook.Quit;
      Outlook := nil;
    end;
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

  {Check if Outlook is already running, this uses Outlook 2000 upwards}
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
      StartStr := Copy(StartStr, 1, (Count - 1)) + string(Copy(Numbers, (Id + 1), 1)) +
        Copy(StartStr, (Count + 1), (StrLength - Count));
      IncrementNo := StartStr;
      if Id < 10 then Exit;
    end
    else
    begin
      Id := Pos(CurrChar, Alphas);
      if Id > 0 then
      begin
        StartStr := Copy(StartStr, 1, (Count - 1)) + string(Copy(Alphas, (Id + 1), 1)) +
          Copy(StartStr, (Count + 1), (StrLength - Count));
        IncrementNo := StartStr;
        if Id < 27 then Exit;
      end;
    end;
  end;
end;

function PadWithZeros(const iNumber: real; iLength: integer): string;
var
  itempNo: real;
  sTempStr: string;
begin
  {iNumber = number you want padding with zeros}
  {sWhere = pad with leading or trailing zeros}
  {         L - leading, T - Trailing}
  itempNo := power(10,iLength);
  itempNo := iNumber+itempNo;
  sTempStr := floattostr(itempNo);

  Result := copy(sTempStr,2,iLength);

end;

function RoundFloat(TempVal: real; DecPlaces: integer): real;
var
  rMulti: real;
  rTemp: real;
  iTemp: integer;
begin
  rMulti := power(10,(Decplaces));

  rtemp := (TempVal + 0.0001) * rMulti;

  iTemp := round(rTemp);

  if (frac(rtemp) = 0.5) and ((iTemp mod 2) = 0) then
    rTemp := rTemp + 0.1;

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

function CalcTotalValue(TempQty, TempFactor: integer; TempValue: double) : real;
begin
  if TempFactor = 0 then
    result := TempValue
  else
    begin
      result := ((TempQty/TempFactor) * TempValue);
    end;
end;

function FormatQtyTo2DP(const Qty: variant): string;
begin
  if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
  begin
    if Trim(Qty) = '' then
    begin
      MessageDlg('Quantity must be entered', mtError, [mbOK], 0);
      Result := 'X';
      Exit;
    end;
  end;
  try
    begin
      if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
        Result := FormatFloat('######0.00', StrToFloatDef(Qty, 0, FormatSettings))
      else
        Result := FormatFloat('######0.00', Qty);
    end;
  except
    if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
      MessageDlg('Invalid entry - ' + Qty, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid entry ', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function FormatQtyTo3DP(const Qty: variant): string;
begin
  if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
  begin
    if Trim(Qty) = '' then
    begin
      MessageDlg('Quantity must be entered', mtError, [mbOK], 0);
      Result := 'X';
      Exit;
    end;
  end;
  try
    begin
      if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
        Result := FormatFloat('######0.000', StrToFloatDef(Qty, 0, FormatSettings))
      else
        Result := FormatFloat('######0.000', Qty);
    end;
  except
    if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
      MessageDlg('Invalid entry - ' + Qty, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid entry ', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function FormatQty(const Qty: variant): string;
begin
  if (VarType(Qty) = VarString) or (VarType(Qty) = VarUString) then
  begin
    if Trim(Qty) = '' then
    begin
      MessageDlg('Quantity must be entered', mtError, [mbOK], 0);
      Result := 'X';
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
      MessageDlg('Invalid entry - ' + Qty, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid entry', mtError, [mbOK], 0);
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

function FormatMoneyTo3DP(const Money: variant): string;
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
        Result := FormatFloat('######0.000', StrToFloatDef(Money, 0, FormatSettings))
      else
        Result := FormatFloat('######0.000', Money);
    end;
  except
    if (VarType(Money) = VarString) or (VarType(Money) = VarUString) then
      MessageDlg('Invalid financial value - ' + Money, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid financial value', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function FormatMoneyTo4DP(const Money: variant): string;
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
        Result := FormatFloat('######0.0000', StrToFloatDef(Money, 0, FormatSettings))
      else
        Result := FormatFloat('######0.0000', Money);
    end;
  except
    if (VarType(Money) = VarString) or (VarType(Money) = VarUString) then
      MessageDlg('Invalid financial value - ' + Money, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid financial value', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

procedure FileCopy(const SourceFileName, DestinationFileName: string);
begin
  TFile.Copy(SourceFileName, DestinationFileName);
end;

function CurrencyDisp(DisplayMask,CurrVal: string): string;
begin
  if CurrVal = '' then CurrVal := '0';
  try
    CurrencyDisp := FormatFloat(DisplayMask, StrToFloatDef(CurrVal, 0, FormatSettings));
  except
    on EConvertError do
    begin
      MessageDlg('Invalid financial value', mtError, [mbAbort], 0);
      CurrencyDisp := 'X';
    end;
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
procedure ParseException(AException: System.SysUtils.Exception);
var
  Exc: EFDDBEngineException;
begin
  try
    if AException is EFDDBEngineException then
    begin
      Exc := (AException as EFDDBEngineException);
      case Exc.Kind of
        ekUKViolated:
          MessageDlg('This code has already been used.', mtError, [mbOk], 0);
        ekUserPwdInvalid:
          MessageDlg('Invalid username or password.', mtError, [mbOk], 0);
        ekInvalidParams:
          MessageDlg('Invalid params. Please contact technical support.', mtError, [mbOk], 0);
      end;
    end;
  except
  end;
end;

function GetMSSQLID: string;
begin
  Result := 'MSSQL';
end;

procedure ConfigureFDConnection(const Connection: TFDConnection);
begin
  Connection.FormatOptions.OwnMapRules := True;
  Connection.FormatOptions.MapRules.Clear;
  Connection.FormatOptions.MapRules.Add(dtDateTimeStamp, dtDateTime);
  Connection.FormatOptions.MapRules.Add(dtBCD, dtDouble);
  Connection.FormatOptions.MapRules.Add(dtAnsiString, dtWideString);
  Connection.FetchOptions.Mode := fmAll;
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
  result := pbdatestr(copy(trim(tmpDate),1,10));
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
    if not MySucceeded then begin
{ Turn MyUnicode over }
      MyUnicode := not MyUnicode;
      MyStreamName := Format('__substg1.0_%.4x%.4x', [AProperty, MyTString[MyUnicode]]);
      MySucceeded := Succeeded(AStorage.OpenStream(PWideChar(MyStreamName), nil,
        STGM_READ or STGM_SHARE_EXCLUSIVE, 0, MyIStream));
    end;
    if MySucceeded then begin
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

function GetAppIniFile: string;
begin
  Result := myRedeye_INIFILE;
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

function PBFormatPONum(const aReal: Real; aLineNo: integer): string;
begin
  if aLineNo = 1 then
    Result := FloatToStr(aReal)
  else
    Result := FloatToStr(aReal)+'/'+inttostr(aLineNo);
end;

function PBDateStr(const vIn: variant): variant;
begin
  if VarType(vIn) = VarDate then
  begin
    if vIn = 0 then
      Result := ''
    else
      Result := DateToStr(vIn);
  end
  else
    if (VarType(vIn) = VarString) or (VarType(vIn) = VarUString) then
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
  IniFile := TIniFile.Create(iniFileName);
  try
    IniFile.EraseSection(sectionName);
  finally
    IniFile.Free;
  end;
end;

procedure AlignColumns(AlignLeftList: TList<Integer>; Grid: TStringGrid; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState; AlignToRight: Boolean = False; CallBack: TProc = nil);
var
  Text: string;
  TextFormat: TTextFormat;
  SavedColor: TColor;
  SavedStyle: TBrushStyle;
begin
  Text := Grid.Cells[ACol, ARow];

  if Assigned(CallBack) then
    CallBack;

  SavedColor := Grid.Canvas.Font.Color;
  SavedStyle := Grid.Canvas.Brush.Style;

  if (gdFixed in State) then
  begin
    Grid.Canvas.Brush.Color := clBtnFace;
    Grid.Canvas.Font.Color := clWindowText;
    Grid.Canvas.Font.Style := [fsBold];
  end

  else if (gdSelected in State) or (gdFocused in State) then
  begin
    Grid.Canvas.Brush.Color := clHighlight;
    Grid.Canvas.Font.Color := clHighlightText;
    Grid.Canvas.Font.Style := [];
  end
  else
  begin
    Grid.Canvas.Brush.Color := Grid.Color;
    Grid.Canvas.Font.Color := Grid.Font.Color;
  end;

  Grid.Canvas.FillRect(Rect);

  TextFormat := [tfVerticalCenter, tfSingleLine];
  if AlignToRight then
  begin
    if AlignLeftList.Contains(ACol) then
      TextFormat := TextFormat + [tfRight]
    else
      TextFormat := TextFormat + [tfLeft];
  end
  else
  begin
    if AlignLeftList.Contains(ACol) then
      TextFormat := TextFormat + [tfLeft]
    else
      TextFormat := TextFormat + [tfRight];
  end;

  Rect.Left := Rect.Left + 2;
  Rect.Right := Rect.Right - 2;

  Grid.Canvas.TextRect(Rect, Text, TextFormat);

  Grid.Canvas.Font.Color := SavedColor;
  Grid.Canvas.Brush.Style := SavedStyle;
end;

{get window's system directory}
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

{get window's directory}
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

function GetSpecialFolderPath(folder : integer) : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  specialFolder : integer;
  path: array [0..MAX_PATH] of char;
begin
  specialFolder := CSIDL_PERSONAL;
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
  end;

  if SUCCEEDED(SHGetFolderPath(0,specialfolder,0,SHGFP_TYPE_CURRENT,@path[0])) then
    Result := path
  else
    Result := '';
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

procedure CreateDirectory(DirName: string);
begin
  SysUtils.ForceDirectories(DirName);
end;

function DirectoryExists(const Name: string): Boolean;
begin
  Result := SysUtils.DirectoryExists(Name);
end;

{formLayout Routines}
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
      Supported := (DevMode^.dmFields and Setting) = Setting;
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

procedure CreateNewXMLfile(filename: string);
var
  exportfile: textFile;
//  tempstr: string;
begin
  assignFile(exportFile, filename);
  rewrite(exportFile);

  CloseFile(exportFile);
end;

procedure OpenXMLProperty(filename, tempField: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := '<' + tempField + '>';
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteXMLProperty(filename, tempField: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := tempField;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure CloseXMLProperty(filename, tempField: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := '</' + tempField + '>';
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteXMLLine(filename, tempField, tempValue: string);
var
  exportfile: textFile;
  tempstr: string;
  sDataString: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  sDataString := formatXMLstring(tempvalue);

  tempstr := xmlTab3 + '<' + tempField + '>' + sDataString + '</' + tempField + '>';
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

{Technique XML Routines}
procedure CreateTechCustXMLfile(filename: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  rewrite(exportFile);

  tempstr := TechXMLCustHeadLine1;
  writeLn(exportFile, tempStr);

  tempstr := TechXMLCustHeader;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechCustXMLHead(filename: string; tempField: TField);
var
  exportfile: textFile;
  tempstr: string;
  sDataString: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  sDataString := formatXMLstring(tempField.AsString);

  if tempField.FieldNo = 1 then
    tempstr := xmlTab1 + '<tg:company ' + tempField.FieldName + '="' + sDataString + '" tg:hold="false" tg:live="true">'
  else
    if pos('AT_',tempField.FieldName) > 0 then
      tempstr := xmlTab2 + '<' + copy(tempField.FieldName,4,(length(tempField.FieldName)-3)) + ' ' + sDataString + '/>'
    else
      tempstr := xmlTab2 + '<' + tempField.FieldName + '>' + sDataString + '</' + tempField.FieldName + '>';
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechCustTypeXMLHead(filename: string);
var
  exportfile: textFile;
  tempstr: string;
//  sDataString: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := xmlTab1 + TechXMLCustType;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechAddrXMLHead(filename: string; tempField: TField);
var
  exportfile: textFile;
  tempstr: string;
  sDataString: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  sDataString := formatXMLstring(tempField.AsString);

  if tempField.FieldNo = 3 then
    tempstr := xmlTab1 + '<tg:address tg:code="' + sDataString + '" tg:invoice_address="true" tg:despatch_address="true">'
  else
    if pos('AT_',tempField.FieldName) > 0 then
      tempstr := xmlTab2 + '<' + copy(tempField.FieldName,4,(length(tempField.FieldName)-3)) + ' ' + sDataString + '/>'
    else
      tempstr := xmlTab2 + '<' + tempField.FieldName + '>' + sDataString + '</' + tempField.FieldName + '>';
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechContactXMLHead(filename: string; tempField: TField);
var
  exportfile: textFile;
  tempstr: string;
  sDataString: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  sDataString := formatXMLstring(tempField.AsString);

  if tempField.FieldNo = 1 then
    tempstr := xmlTab2 + '<tg:contact ' + tempField.FieldName + '="' + sDataString + '">'
  else
    if pos('AT_',tempField.FieldName) > 0 then
      tempstr := xmlTab3 + '<' + copy(tempField.FieldName,4,(length(tempField.FieldName)-3)) + ' ' + sDataString + '/>'
    else
      tempstr := xmlTab3 + '<' + tempField.FieldName + '>' + sDataString + '</' + tempField.FieldName + '>';
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechContactXMLFoot(filename: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := TechXMLContactFooter;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechAddrXMLFoot(filename: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := TechXMLAddrFooter;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure CloseTechCustXMLfile(filename: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := TechXMLCompanyFooter;
  writeLn(exportFile, tempStr);

  tempstr := TechXMLCompaniesFooter;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure CreateTechXMLfile(filename: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  rewrite(exportFile);

  tempstr := TechXMLHeadLine1;
  writeLn(exportFile, tempStr);

  tempstr := TechXMLHeadLine2;
  writeLn(exportFile, tempStr);

  tempstr := TechXMLOrderHeader;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechXMLHead(filename: string; tempField: TField);
var
  exportfile: textFile;
  tempstr: string;
  sDataString: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  sDataString := formatXMLstring(tempField.AsString);

  if tempField.FieldNo = 1 then
    tempstr := xmlTab1 + '<tg:order ' + tempField.FieldName + '="' + sDataString + '" tg:site_code="BR">'
  else
    if pos('AT_',tempField.FieldName) > 0 then
      tempstr := xmlTab2 + '<' + copy(tempField.FieldName,4,(length(tempField.FieldName)-3)) + ' ' + sDataString + '/>'
    else
      tempstr := xmlTab2 + '<' + tempField.FieldName + '>' + sDataString + '</' + tempField.FieldName + '>';
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechXMLMasterHead(filename: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := TechXMLMasterHeader;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechXMLMasterFoot(filename: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := TechXMLMasterFooter;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechXMLMasterLine(filename: string; tempField: TField);
var
  exportfile: textFile;
  tempstr: string;
  sDataString: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  sDataString := formatXMLstring(tempField.AsString);

  tempstr := xmlTab3 + '<' + tempField.FieldName + '>' + sDataString + '</' + tempField.FieldName + '>';
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechXMLPostPressHead(filename: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := TechXMLPostPressHeader;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechXMLPostPressFoot(filename: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := TechXMLTaskInfoFooter;
  writeLn(exportFile, tempStr);

  tempstr := TechXMLPostPressFooter;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure WriteTechXMLPostPressLine(filename: string; tempField: TField);
var
  exportfile: textFile;
  tempstr: string;
  sDataString: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  sDataString := formatXMLstring(tempField.AsString);

  if tempField.FieldName = 'tg:task_info' then
    tempstr := xmlTab3 + TechXMLTaskInfoHeader
  else
    tempstr := xmlTab3 + '<' + tempField.FieldName + '>' + sDataString + '</' + tempField.FieldName + '>';
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

procedure CloseTechXMLfile(filename: string);
var
  exportfile: textFile;
  tempstr: string;
begin
  assignFile(exportFile, filename);
  append(exportfile);

  tempstr := TechXMLOrderFooter;
  writeLn(exportFile, tempStr);

  tempstr := TechXMLOrdersFooter;
  writeLn(exportFile, tempStr);

  CloseFile(exportFile);
end;

function FormatXMLString(tempData: string): string;
begin
  result := tempData;
  if pos('&',result) > 0 then
    result := stringreplace(result,'&','and',[rfReplaceAll]);
  if pos('>',result) > 0 then
    result := stringreplace(result,'>','>gt;',[rfReplaceAll]);
  if pos('<',result) > 0 then
    result := stringreplace(result,'<','<lt;',[rfReplaceAll]);
  if pos('%',result) > 0 then
    result := stringreplace(result,'%','#37;',[rfReplaceAll]);
  if pos('''',result) > 0 then
    result := stringreplace(result,'''','',[rfReplaceAll]);
end;

function FormatString(tempData: string): string;
begin
  result := tempData;
  if pos('&',result) > 0 then
    result := stringreplace(result,'&','and',[rfReplaceAll]);
  if pos('"',result) > 0 then
    result := stringreplace(result,'"',' inch',[rfReplaceAll]);
end;

function CountTextFileLines(var theTextFile: TextFile): integer;
var
  tempCount : integer;
begin
  tempCount := 0;
  while not EOF(theTextFile) do
  begin
    ReadLn(theTextFile);
    tempCount := tempCount + 1;
  end;
  CountTextFileLines := tempCount;
end;

function ConverttoWideString(tempFile: string): widestring;
var
  fs: TFileStream;
  w: Word;
  ws: WideString;
  S: string;
  i: Integer;
  intsize: int64;
begin
  {open file}
  fs := TFileStream.Create(tempFile, fmOpenRead);
  intSize := fs.size;
  {stream can contain unicode characters - we must check before parse}
  fs.Read(w, SizeOf(w));
  case w of
    $FEFF, {UTF-16 little endian}
    $FFFE: {UTF-16 big  endian}
      begin
        if (fs.Size > fs.Position) then
          begin
            i := fs.Size - fs.Position;
            SetLength(ws, i div 2);
            fs.Read(ws[1], i);
            if (w = $FFFE) then
              begin
                for i := 1 to Length(ws) do
                  ws[i] := WideChar(Swap(Word(ws[i])));
              end;
          end;
      end;
    else
      {restore position}
      fs.Seek(-SizeOf(w), soFromCurrent);
      SetString(S, nil, intSize);
      fs.Read(Pointer(S)^, intSize);
      ws := S
  end;
  {close file}
  fs.Free;
  result := ws;
end;

function MergePDFs(firstFilePath, secondFilePath, outputFilePath, contactName, date, estimateNumber, jobDescription: string): integer;
var
  dll_handle: THandle;
  myFunction: function(firstFilePath, secondFilePath, outputFilePath, contactName, date, estimateNumber, jobDescription: string): integer stdcall;
begin
  result := 0;

  dll_handle := Loadlibrary('Quaystone.PdfMerger.dll');

  if (0 <> dll_handle) then
    begin
      @MyFunction := GetProcAddress(dll_handle, 'MergePdfs');

      if (NIL <> @MyFunction) then
        begin
          result := MyFunction('D:\tmp\Quotation.pdf', 'D:\tmp\Price Guide.pdf', 'D:\tmp\Calderstone.pdf', 'Paul Allanson', '18/04/2019', '860025', 'Leeds United Fixture List');
        end;

      FreeLibrary(dll_Handle);
    end;
end;

{ TDBLookupComboBoxHelper }

function TDBLookupComboBoxHelper.ListValue: Variant;
begin
  Result := Self.ListSource.DataSet.FieldByName(Self.KeyField).Value;
end;

end.

