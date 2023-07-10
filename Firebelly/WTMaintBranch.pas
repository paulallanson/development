unit WTMaintBranch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, gtQrCtrls, DBCtrls, ComCtrls,
  ExtCtrls, ToolWin, ImgList, SHELLAPI, taoFrmts, taoCntrr, taoMapi, Activex, AxCtrls, Clipbrd, ComObj, Menus,
  CRControls;

type
  TfrmWTMaintBranch = class(TForm)
    lblName: TLabel;
    edtName: TEdit;
    qryGetLastNo: TQuery;
    qryAdd: TQuery;
    qryUpd: TQuery;
    qryDel: TQuery;
    Label34: TLabel;
    edtStreet: TEdit;
    edtLocale: TEdit;
    edtTown: TEdit;
    Label35: TLabel;
    Label37: TLabel;
    edtPostcode: TEdit;
    Label39: TLabel;
    edtCounty: TEdit;
    qryGetBranch: TQuery;
    qryGetAddress: TQuery;
    qryAddAddress: TQuery;
    qryUpAddress: TQuery;
    qryGetNextAdd: TQuery;
    dblkpQSContact: TDBLookupComboBox;
    Label1: TLabel;
    qryContacts: TQuery;
    dtsContacts: TDataSource;
    Label2: TLabel;
    dblkpInstallationContact: TDBLookupComboBox;
    pgDetails: TPageControl;
    pnlFooter: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    memInstallationNotes: TMemo;
    Panel12: TPanel;
    Label44: TLabel;
    imgDocuments: TImageList;
    imgIcons: TImageList;
    ToolBar1: TToolBar;
    btnAttach: TToolButton;
    lstvwDocuments: TListView;
    SpeedButton3: TSpeedButton;
    btnClearGroup: TSpeedButton;
    SpeedButton1: TSpeedButton;
    StatusBar1: TStatusBar;
    taoWinControl1: TtaoWinControl;
    taoWinControl1In1: TtaoInFileContents;
    taoWinControl1In2: TtaoInCells;
    taoWinControl1In3: TtaoInBiff8;
    taoWinControl1In4: TtaoInBiff5;
    taoWinControl1In5: TtaoInUnicodeText;
    taoWinControl1In6: TtaoInText;
    taoWinControl1In7: TtaoInHDrop;
    taoWinControl1In8: TtaoInShellIDList;
    taoWinControl1In9: TtaoInFileContentsW;
    taoWinControl1In10: TtaoInOEMessage;
    taoWinControl1In11: TtaoInURL;
    taoWinControl1In12: TtaoInURLNetscape4;
    taoWinControl1Out1: TtaoOutBiff8;
    taoWinControl1Out2: TtaoOutRtf;
    taoWinControl1Out3: TtaoOutUnicodeText;
    taoWinControl1Out4: TtaoOutText;
    taoWinControl1Out5: TtaoOutCells;
    taoWinControl1Out6: TtaoOutHDrop;
    taoWinControl1Out7: TtaoOutFileNameMap;
    taoWinControl1Out8: TtaoOutShellIDList;
    taoWinControl1Out9: TtaoOutFileDescriptor;
    taoWinControl1Out10: TtaoOutFileDescriptorW;
    taoWinControl1Out11: TtaoOutFileContents;
    taoWinControl1Out12: TtaoOutPreferredEffect;
    taoWinControl1Out13: TtaoOutURL;
    taoWinControl1Out14: TtaoOutURLShortcut;
    taoWinControl1Out15: TtaoOutURLShortcutTitle;
    pmnuDocuments: TPopupMenu;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    N2: TMenuItem;
    pmnuSelectAll: TMenuItem;
    DocOpenDialog: TOpenDialog;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnClearGroupClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure taoWinControl1SetDataPaste(Sender: TObject;
      Data: IInterface);
    procedure taoWinControl1SetDataTarget(Sender: TObject;
      Data: IInterface; X, Y: Integer);
    procedure taoWinControl1UpdateAction(Sender: TObject;
      Action: TtaoUpdateAction; var Enable: Boolean);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
  private
    iInstallationNotes: integer;
    FCustomerName: string;
    procedure GetAddress(iAddress: integer);
    function GetNotes(TempNotes: integer): string;
    function UpdateInstallationNotes: Integer;
    procedure SetCustomerName(const Value: string);
    procedure ShowDocuments;
    procedure ShowListViewDocuments(strPath: string; ListView: TListView;
      ImageList: TImageList);
    procedure MyWinControlSetData(const Data: IInterface);
    function ParseDocumentFrom(tmpFrom: string): string;
    procedure ParseMessage(const AFileName: string; var ATo, AFrom,
      ASubject, ADate, ABody: string);
    function FormatDateasDateTime(sDate: string): TDateTime;
    { Private declarations }
  public
    bOK: boolean;
    iCustomer, iBranch, iAddress: integer;
    sFuncMode: string;
    sName: string;
    property CustomerName: string read FCustomerName write SetCustomerName;
  end;

var
  frmWTMaintBranch: TfrmWTMaintBranch;

implementation

uses wtNotesDM, wtDataModule, WTSrchCustContacts, AllCommon;

{$R *.dfm}

procedure TfrmWTMaintBranch.FormActivate(Sender: TObject);
begin
  with qryContacts do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      open;
    end;
    
  if sFuncMode = 'A' then
    begin
      {Empty details};
      edtName.Text := '';
      edtName.SetFocus;
      iAddress := 0;
    end
  else
    begin
      with qryGetBranch do
        begin
          close;
          parambyname('Customer').asinteger := iCustomer;
          parambyname('Branch_no').asinteger := iBranch;
          open;
          edtName.Text := fieldbyname('Branch_Name').asstring;
          iAddress := fieldbyname('Address').asinteger;

          dblkpInstallationContact.KeyValue := fieldbyname('Installation_Contact').asinteger;
          dblkpQSContact.KeyValue := fieldbyname('Site_QS_Contact').asinteger;

          GetAddress(iAddress);
          memInstallationNotes.text := GetNotes(fieldbyname('Special_Instructions').asinteger);
        end;

      dtmdlWorktops.CreateCustomerSiteDocDirectory(self.CustomerName, edtName.Text);

      ShowDocuments;
      edtName.setfocus;
    end;

  edtName.Enabled := (sFuncMode <> 'D');
  enableok(self);
end;

procedure TfrmWTMaintBranch.btnOKClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A'] then
    begin
      if iBranch = 0 then
        begin
          with qryGetLastNo do
            begin
              close;
              parambyname('Customer').asinteger := iCustomer;
              open;
              iBranch := fieldbyname('Last_no').asinteger + 1
            end;
        end;

      with qryGetNextAdd do
        begin
          close;
          open;
          iAddress := fieldbyname('Last_Address').asinteger + 1;
        end;

      with qryAddAddress do
        begin
          close;
          parambyname('Address').asinteger := iAddress;
          parambyname('Address_Name').asstring := edtName.text;
          parambyname('Street').asstring := edtStreet.text;
          parambyname('Locale').asstring := edtlocale.text;
          parambyname('Town_City').asstring := edtTown.text;
          parambyname('Postcode').asstring := edtPostcode.text;
          parambyname('County_State').asstring := edtCounty.text;
          parambyname('Email_address').asstring := '';
          parambyname('Telephone_number').asstring:= '';
          parambyname('Installation_Address').asstring := 'Y';
          execsql;
        end;

      with qryAdd do
        begin
          close;
          parambyname('Customer').asinteger := iCustomer;
          parambyname('Branch_no').asinteger := iBranch;
          parambyname('Branch_Name').asstring := edtName.text;
          parambyname('Address').asinteger := iAddress;

          iInstallationNotes := UpdateInstallationNotes;
          if iInstallationNotes = 0 then
            parambyname('Special_Instructions').clear
          else
            parambyname('Special_Instructions').asinteger := iInstallationNotes;

          if dblkpInstallationContact.KeyValue > 0 then
            parambyname('Installation_Contact').asinteger := dblkpInstallationContact.KeyValue
          else
            parambyname('Installation_Contact').clear;

          if dblkpQSContact.KeyValue > 0 then
            parambyname('Site_QS_Contact').asinteger := dblkpQSContact.KeyValue
          else
            parambyname('Site_QS_Contact').clear;
          execsql;
        end;
      dtmdlWorktops.CreateCustomerSiteDocDirectory(self.CustomerName, edtName.Text);
    end
  else
  if sFuncMode[1] in ['C'] then
    begin
      if iAddress = 0 then
        begin
          with qryGetNextAdd do
            begin
              close;
              open;
              iAddress := fieldbyname('Last_Address').asinteger + 1;
            end;
          with qryAddAddress do
            begin
              close;
              parambyname('Address').asinteger := iAddress;
              parambyname('Address_Name').asstring := edtName.text;
              parambyname('Street').asstring := edtStreet.text;
              parambyname('Locale').asstring := edtlocale.text;
              parambyname('Town_City').asstring := edtTown.text;
              parambyname('Postcode').asstring := edtPostcode.text;
              parambyname('County_State').asstring := edtCounty.text;
              parambyname('Email_address').asstring := '';
              parambyname('Telephone_number').asstring:= '';
              parambyname('Installation_Address').asstring := 'Y';
              execsql;
            end;
        end
      else
        begin
          with qryUpAddress do
            begin
              close;
              parambyname('Address').asinteger := iAddress;
              parambyname('Address_Name').asstring := edtName.text;
              parambyname('Street').asstring := edtStreet.text;
              parambyname('Locale').asstring := edtlocale.text;
              parambyname('Town_City').asstring := edtTown.text;
              parambyname('Postcode').asstring := edtPostcode.text;
              parambyname('County_State').asstring := edtCounty.text;
              parambyname('Email_address').asstring := '';
              parambyname('Telephone_number').asstring := '';
              execsql;
            end;
        end;
      with qryUpd do
        begin
          close;
          parambyname('Customer').asinteger := iCustomer;
          parambyname('Branch_no').asinteger := iBranch;
          parambyname('Branch_Name').asstring := edtName.text;
          parambyname('Address').asinteger := iAddress;

          iInstallationNotes := UpdateInstallationNotes;
          if iInstallationNotes = 0 then
            parambyname('Special_Instructions').clear
          else
            parambyname('Special_Instructions').asinteger := iInstallationNotes;

          if dblkpInstallationContact.KeyValue > 0 then
            parambyname('Installation_Contact').asinteger := dblkpInstallationContact.KeyValue
          else
            parambyname('Installation_Contact').clear;

          if dblkpQSContact.KeyValue > 0 then
            parambyname('Site_QS_Contact').asinteger := dblkpQSContact.KeyValue
          else
            parambyname('Site_QS_Contact').clear;
          execsql;
        end;
    end
  else
    begin
      with qryDel do
        begin
          close;
          parambyname('Customer').asinteger := iCustomer;
          parambyname('Branch_no').asinteger := iBranch;
          execsql;
        end;
    end;


  bOK := true;
end;

procedure TfrmWTMaintBranch.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtName.Text <> '') and
                    (edtStreet.Text <> '') and
                    (edtPostcode.Text <> '');
end;

procedure TfrmWTMaintBranch.GetAddress(iAddress: integer);
begin
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := iAddress;
      open;

      edtstreet.text := fieldbyname('Street').asstring;
      edtlocale.text := fieldbyname('Locale').asstring;
      edttown.text := fieldbyname('Town_City').asstring;
      edtpostcode.text := fieldbyname('Postcode').asstring;
      edtcounty.text := fieldbyname('County_State').asstring;
    end;
end;

function TfrmWTMaintBranch.GetNotes(TempNotes: integer): string;
var
  Notes: TNotes;
begin
  Result := '';
  if TempNotes = 0 then exit;
  Notes := TNotes.create;
  try
    Notes.DbKey := TempNotes;
    Notes.LoadfromDb;
    Result := Notes.Data;
  finally
    Notes.free;
  end;
end;

function TfrmWTMaintBranch.UpdateInstallationNotes: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iInstallationNotes;
    Notes.Data := memInstallationNotes.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;


procedure TfrmWTMaintBranch.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
  self.Caption := self.Caption + ' ' + FCustomerName;
end;

procedure TfrmWTMaintBranch.SpeedButton3Click(Sender: TObject);
begin
  frmWTSrchCustContacts := TfrmWTSrchCustContacts.create(self);
  try
    frmwtSrchCustContacts.Customer := iCustomer;
    frmwtSrchCustContacts.isLookup := false;
    frmWTSrchCustContacts.showmodal
  finally
    frmWTSrchCustContacts.free;
  end;

  with qryContacts do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      open;
    end;
end;

procedure TfrmWTMaintBranch.btnClearGroupClick(Sender: TObject);
begin
  dblkpInstallationContact.KeyValue := 0;
end;

procedure TfrmWTMaintBranch.SpeedButton1Click(Sender: TObject);
begin
  dblkpQSContact.KeyValue := 0;

end;

procedure TfrmWTMaintBranch.ShowDocuments;
var
  sPath: string;
begin
  sPath := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + edtName.text + '\';

  lstvwDocuments.Clear;
  // Assign a Imagelist to the ListView
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
end;

procedure TfrmWTMaintBranch.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
var
  i: Integer;
  Icon: TIcon;
  SearchRec: TSearchRec;
  ListItem: TListItem;
  FileInfo: SHFILEINFO;
begin
  // Create a temporary TIcon
  Icon := TIcon.Create;
  ListView.Items.BeginUpdate;
  try
    // search for the first file
    i := FindFirst(strPath + '*.*', faArchive, SearchRec);
    while i = 0 do
    begin
      with ListView do
      begin
        // On directories and volumes
        if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
          (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          ListItem := ListView.Items.Add;
          //Get The DisplayName
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_DISPLAYNAME);
//          Listitem.Caption := FileInfo.szDisplayName;
          Listitem.Caption := SearchRec.Name;
          // Get The TypeName
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_TYPENAME);
          ListItem.SubItems.Add(FileInfo.szTypeName);
          // Get The DateModified
          try
            ListItem.SubItems.Add(DatetimeToStr(FileDateToDateTime(fileage(strPath + ListItem.Caption))));
          except
            ListItem.SubItems.Add('');
          end;

          //Get The Icon That Represents The File
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_ICON or SHGFI_SMALLICON);
          icon.Handle := FileInfo.hIcon;
          ListItem.ImageIndex := ImageList.AddIcon(Icon);
          // Destroy the Icon
          DestroyIcon(FileInfo.hIcon);
        end;
      end;
      i := FindNext(SearchRec);
    end;
  finally
    Icon.Free;
    ListView.Items.EndUpdate;
  end;
end;


procedure TfrmWTMaintBranch.lstvwDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
  sPath := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + edtName.text + '\';
  if sPath = '' then
    exit;

  if lstvwDocuments.ItemIndex = -1 then
    begin
      sDoc := '';
      exit;
    end
  else
    begin
      sDoc := lstvwDocuments.Items[lstvwDocuments.ItemIndex].caption;
    end;

  Params := '' ;
  StrPCopy(FiName, sPath + sDoc) ;

  {Use the WINDOWS SHELL to open the document};
  iTempResult := ShellExecute(0,'open',FiName,Params, '', 1) ;
  If iTempResult <= 32 then
  begin
    {There was an error} ;
    sTempError := 'An error occured opening the document - (' + IntToStr(iTempResult) + ')' ;
    Case iTempResult of
      ERROR_FILE_NOT_FOUND : sTempError := 'Document not found' ;
      ERROR_PATH_NOT_FOUND: sTempError := 'Document directory not found' ;
      ERROR_BAD_FORMAT: sTempError := 'The document format is corrupt' ;
      SE_ERR_ACCESSDENIED: sTempError := 'You''re not allowed to access the document' ;
      SE_ERR_ASSOCINCOMPLETE: sTempError := 'The document association is incomplete' ;
      SE_ERR_DDEBUSY: sTempError := 'The document is being used (DDE)' ;
      SE_ERR_DDEFAIL: sTempError :=  'Could not access the document (DDE)' ;
      SE_ERR_DDETIMEOUT: sTempError :=  'Accessing the document took too long (DDE)' ;
      SE_ERR_DLLNOTFOUND: sTempError :=  'A missing DDE is required to access the document' ;
      SE_ERR_NOASSOC: sTempError := 'There is no application on your PC that can open this document' ;
      SE_ERR_OOM: sTempError := 'Your PC does not have enough memory to open this document' ;
      SE_ERR_SHARE: sTempError := 'The document is being accessed by someone else' ;
    end;
    MessageDlg(sTempError,mtError,[mbOK],0) ;
  end;
end;

procedure TfrmWTMaintBranch.FormCreate(Sender: TObject);
begin
  AllCommon.LoadFormLayout('myWorktops.ini', self);
end;

procedure TfrmWTMaintBranch.FormDestroy(Sender: TObject);
begin
  AllCommon.SaveFormLayout('myWorktops.ini', self);
end;

procedure TfrmWTMaintBranch.taoWinControl1SetDataPaste(Sender: TObject;
  Data: IInterface);
begin
  MyWinControlSetData(Data);
end;

procedure TfrmWTMaintBranch.taoWinControl1SetDataTarget(Sender: TObject;
  Data: IInterface; X, Y: Integer);
begin
{ Ignore the drop point. So we can handle drag-and-drop and clipboard operations in uniform way. }
  MyWinControlSetData(Data);

end;

procedure TfrmWTMaintBranch.taoWinControl1UpdateAction(Sender: TObject;
  Action: TtaoUpdateAction; var Enable: Boolean);
begin
 { The Paste sub-item in the Edit menu is linked to an Action object. Enable is False on enter. }
  Enable := True;

end;

procedure TfrmWTMaintBranch.MyWinControlSetData(const Data: IUnknown);
const
  cExtensionOutlook = '.msg';
  cExtensionOutlookExpress = '.eml';
  cNotOutlookWarning = 'This file doesn''t come from Microsoft Outlook.';
  cOutlookExpressWarning = #13#10'Apparently the file comes from MS Outlook Express.';
var
  MyData: ItaoCells;
  i: Integer;
  MyPath, MyFileName, MyFilePath, MyExtension, MyWarning: string;
  MyTo, MyFrom, MySubject, MyDate, MyBody: string;
  myNewDate: TDateTime;
  MyFileStream: TStream;
  NewFilePath: string;
  sFile, sFullFile: string;
  iLength, iPos, icount: integer;
begin
  if Supports(Data, ItaoCells, MyData) then
    begin
      MyPath := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + edtName.text + '\';

      if not DirectoryExists(MyPath) then
  	    begin
     	    CreateDirectory(MyPath);
  	    end;

      for i := 0 to MyData.RowCount - 1 do
        begin
          MyFileName := MyData[0, i];
          MyExtension := LowerCase(ExtractFileExt(MyFileName));
          if MyExtension = cExtensionOutlook then
            begin

{ Store the contents as a file on the disk. }
              MyFilePath := MyPath + MyFileName;

{If the file name already exists then increase the number}
              icount := 0;
              NewFilePath := MyFilePath;
              while FileExists(NewFilePath) = true do
                begin
                  inc(icount);
                  NewFilePath := copy(MyFilePath, 1, length(MyFilePath)-4) + '(' + inttostr(icount) + ')' + MyExtension;
                end;

              MyFilePath := NewFilePath;

              MyFileStream := TFileStream.Create(MyFilePath, fmCreate or fmShareDenyWrite);
              try
                TextToStream(MyData[1, i], MyFileStream);
              finally
                MyFileStream.Free;
              end;
{ GUI }
              try
                ParseMessage((MyPath+MyFileName), MyTo, MyFrom, MySubject, MyDate, MyBody);
                if trim(MyDate) = '' then
                  myNewDate := date
                else
                  myNewDate := FormatDateasDateTime(MyDate);
              except
                myNewdate := date
              end;
//  This is where we add the data into the grid and to the document component

              ShowDocuments;
            end
          else
            begin
              sFullFile := myFileName;
              iLength := length(sFullFile);

              iCount := 1;

              while iCount <> 0 do
                begin
                  ipos := pos('\',sFullFile);

                  sFullFile := stringreplace(sFullFile, '\', '!', []);

                  iCount := pos('\',sFullFile);
                end;

              sFile := copy(myFileName, ipos+1, (iLength - ipos));

              FileCopy(myFileName, myPath + sfile) ;
              ShowDocuments;
            end;
        end;
    end;
end;

procedure TfrmWTMaintBranch.ParseMessage(const AFileName: string; var ATo, AFrom,
  ASubject, ADate, ABody: string);
var
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
    MyStrings.Text := MyHeader;
    ATo := MyStrings.Values['To'];
    AFrom := MyStrings.Values['From'];
    AFrom := ParseDocumentFrom(AFrom);
    ASubject := MyStrings.Values['Subject'];
    ADate := MyStrings.Values['Date'];
  finally
    MyStrings.Free;
  end;
{ Trancate the body text and remove line-ends }
  ABody := StringReplace(Copy(ABody, 0, 64), #13, ' ', [rfReplaceAll]);
  ABody := StringReplace(ABody, #10, ' ', [rfReplaceAll]) + ' ...';
end;

function TfrmWTMaintBranch.ParseDocumentFrom(tmpFrom: string): string;
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

function TfrmWTMaintBranch.FormatDateasDateTime(sDate: string): TDateTime;
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

procedure TfrmWTMaintBranch.pmnuPasteClick(Sender: TObject);
var
  f: THandle;
  buffer: Array [0..MAX_PATH] of Char;
  i, numFiles: Integer;
  sFile, sFullFile, docdir: string;
  iCount, iPos, iLength: integer;
begin
  docDir := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + edtName.Text;
  {Find a document} ;

  if not DirectoryExists(docDir) then
  	begin
     	CreateDirectory(docDir);
  	end;

  Clipboard.Open;
  try
    f := Clipboard.GetAsHandle(CF_HDROP);
    if f <> 0 then
    begin
      numFiles := DragQueryFile(f, $FFFFFFFF, nil, 0);
//      memo1.Clear;
      for i:= 0 to numfiles - 1 do
      begin
        buffer[0] := #0;
        DragQueryFile( f, i, buffer, sizeof(buffer));

        sfullFile := buffer;
        iLength := length(sFullFile);

        iCount := 1;

        while iCount <> 0 do
          begin
            ipos := pos('\',sFullFile);

            sFullFile := stringreplace(sFullFile, '\', '!', []);

            iCount := pos('\',sFullFile);
          end;

        sFile := copy(buffer, ipos+1, (iLength - ipos));

        FileCopy(buffer, docDir + '\' + sfile) ;
      end;
    end;
  finally
    Clipboard.close;
  end;
  ShowDocuments;
end;

procedure TfrmWTMaintBranch.pmnuDeleteClick(Sender: TObject);
var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
begin
  iRow := lstvwDocuments.ItemIndex;
  if iRow = -1 then exit;
  if messagedlg('Delete the selected document?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ListItem := lstvwDocuments.items[irow];
      sFileName := ListItem.caption;

      lstvwDocuments.Items.Delete(iRow);

      //Delete the actual file only if not Converting or adding as we don't know the directory name
      if (sFuncMode <> 'A') then
        begin
          sPath := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + edtName.text + '\';

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;

end;

procedure TfrmWTMaintBranch.pmnuSelectAllClick(Sender: TObject);
var
  icount: integer;
begin
  with lstvwDocuments do
    begin
      Items.BeginUpdate;
      for icount := 0 to pred(items.count) do
        begin
          items[icount].selected := true ;
        end;
      Items.EndUpdate;
    end;
end;

procedure TfrmWTMaintBranch.btnAttachClick(Sender: TObject);
var
  i, ipos, ilength, icount: integer;
  sFile, sFullFile, docDir: string;
begin
  docDir := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + edtName.Text;
  {Find a document} ;

  if not DirectoryExists(docDir) then
  	begin
     	CreateDirectory(docDir);
  	end;

  DocOpenDialog.Files.Clear;
  if DocOpenDialog.Execute then
  begin
    if DocOpenDialog.Files.Count > 0 then
      begin
        for icount := 0 to pred(DocOpenDialog.Files.Count) do
          begin
            sfullFile := DocOpenDialog.Files.Strings[icount];
            iLength := length(sFullFile);

            while i <> 0 do
              begin
                ipos := pos('\',sFullFile);

                sFullFile := stringreplace(sFullFile, '\', '!', []);

                i := pos('\',sFullFile);
              end;

            sFile := copy(DocOpenDialog.Files.Strings[icount], ipos+1, (iLength - ipos));

            FileCopy(DocOpenDialog.Files.Strings[icount], docDir + '\' + sFile) ;
          end;
        ShowDocuments;
      end;
  end;
end;

end.
