unit WTMaintBranch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, DB, DBCtrls,
  ComCtrls, ExtCtrls, ToolWin, ImgList, SHELLAPI, Activex, AxCtrls, Clipbrd, ComObj, Menus, CRControls,
  System.ImageList, taoMAPI, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DragDrop, DropTarget, DragDropFile, DropComboTarget;

type
  TfrmWTMaintBranch = class(TForm)
    lblName: TLabel;
    edtName: TEdit;
    qryGetLastNo: TFDQuery;
    qryAdd: TFDQuery;
    qryUpd: TFDQuery;
    qryDel: TFDQuery;
    Label34: TLabel;
    edtStreet: TEdit;
    edtLocale: TEdit;
    edtTown: TEdit;
    Label35: TLabel;
    Label37: TLabel;
    edtPostcode: TEdit;
    Label39: TLabel;
    edtCounty: TEdit;
    qryGetBranch: TFDQuery;
    qryGetAddress: TFDQuery;
    qryAddAddress: TFDQuery;
    qryUpAddress: TFDQuery;
    qryGetNextAdd: TFDQuery;
    dblkpQSContact: TDBLookupComboBox;
    Label1: TLabel;
    qryContacts: TFDQuery;
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
    pmnuDocuments: TPopupMenu;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    N2: TMenuItem;
    pmnuSelectAll: TMenuItem;
    DocOpenDialog: TOpenDialog;
    chkbxInactive: TCheckBox;
    dtsSiteQS: TDataSource;
    qrySiteQS: TFDQuery;
    DropComboTarget1: TDropComboTarget;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnClearGroupClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
  private
    iInstallationNotes: integer;
    FCustomerName: string;
    function GetFilesPath: string;
    procedure GetAddress(iAddress: integer);
    function GetNotes(TempNotes: integer): string;
    function UpdateInstallationNotes: Integer;
    procedure SetCustomerName(const Value: string);
    procedure ShowDocuments;
    procedure ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
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

uses UITypes, wtNotesDM, wtDataModule, WTSrchCustContacts, AllCommon, wtMain, Shared.DragDrop.Helper;

{$R *.dfm}

procedure TfrmWTMaintBranch.FormActivate(Sender: TObject);
begin
  with qryContacts do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      open;
    end;

  with qrySiteQS do
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
      chkbxInactive.Checked := false;
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
          chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');

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
  if CharInSet(sFuncMode[1], ['A']) then
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

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';
          execsql;
        end;
      dtmdlWorktops.CreateCustomerSiteDocDirectory(self.CustomerName, edtName.Text);
    end
  else
  if CharInSet(sFuncMode[1], ['C']) then
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

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';
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

procedure TfrmWTMaintBranch.DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint;
  var Effect: Integer);
begin
  var TargetPath := GetFilesPath;
  DropComboTarget1.SaveDroppedFiles(TargetPath, ShowDocuments);
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

function TfrmWTMaintBranch.GetFilesPath: string;
begin
  Result := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + edtName.text + '\';
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
    Result := Notes.DataInfo;
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
    Notes.DataInfo := memInstallationNotes.Text;
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
  sPath := GetFilesPath;

  lstvwDocuments.Clear;
  // Assign a Imagelist to the ListView
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
end;

procedure TfrmWTMaintBranch.ShowListViewDocuments(strPath: string; ListView: TListView;
      ImageList: TImageList);
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
  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintBranch.FormDestroy(Sender: TObject);
begin
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintBranch.pmnuPasteClick(Sender: TObject);
var
  DocDir: string;
begin
  DocDir := dtmdlWorktops.GetCompanyCustomerDirectory;
  DocDir := IncludeTrailingPathDelimiter(DocDir) + CustomerName;
  DocDir := IncludeTrailingPathDelimiter(DocDir) + edtName.Text;

  {Find a document}
  CopyDocumentsFromClipboard(DocDir,
    procedure
    begin
      ShowDocuments;
    end);
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
  DocDir: string;
begin
  DocDir := dtmdlWorktops.GetCompanyCustomerDirectory;
  DocDir := IncludeTrailingPathDelimiter(docDir) + CustomerName;
  DocDir := IncludeTrailingPathDelimiter(docDir) + edtName.Text;

  {Find a document}
  CopyDocuments(DocOpenDialog, DocDir,
    procedure
    begin
      ShowDocuments;
    end);
end;

end.
