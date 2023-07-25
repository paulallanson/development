unit PBMaintQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pbQuotesDM, ComCtrls, Grids, StdCtrls, DBCtrls, Buttons,
  ExtCtrls, Spin, ShellAPI, IniFiles, DB, ADODB, ActiveX,
  Menus, ImgList, Clipbrd, ToolWin, System.ImageList;

type
  TPBMaintQuoteFrm = class(TForm)
    pnlTop: TPanel;
    lblQuoteNo: TLabel;
    Label4: TLabel;
    edtQuote: TEdit;
    edtDate: TEdit;
    btnDate: TBitBtn;
    pnlHeader: TPanel;
    pgDetails: TPageControl;
    tsCharges: TTabSheet;
    tsSupply: TTabSheet;
    sgSupply: TStringGrid;
    Panel18: TPanel;
    btnDeleteSupply: TBitBtn;
    btnInsertSupply: TBitBtn;
    tsIntNotes: TTabSheet;
    Panel6: TPanel;
    Panel7: TPanel;
    lblDocumentDir: TLabel;
    pnlFooter: TPanel;
    stsbrDetails: TStatusBar;
    lblAccountManager: TLabel;
    edtOfficeContact: TEdit;
    btnAccountManager: TButton;
    Label5: TLabel;
    edtQuoteReqDate: TEdit;
    BitBtn9: TBitBtn;
    Panel2: TPanel;
    pnlBottom: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    FlashTimer: TTimer;
    lblDeletePrompt: TLabel;
    Label10: TLabel;
    spnConversionRate: TSpinEdit;
    DocOpenDialog: TOpenDialog;
    svDlgOfficeDoc: TSaveDialog;
    Panel3: TPanel;
    btnAddCharge: TBitBtn;
    btnChgCharge: TBitBtn;
    btnDelCharge: TBitBtn;
    Panel1: TPanel;
    Panel4: TPanel;
    sgLines: TStringGrid;
    Label12: TLabel;
    edtEstimateFile: TEdit;
    btnOpen: TButton;
    btnImport: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    tsGeneralSpec: TTabSheet;
    Panel8: TPanel;
    btnPrintSpec: TBitBtn;
    memSpec: TMemo;
    btnBrowse: TButton;
    btnOKEstimate: TBitBtn;
    chkbxDeclined: TCheckBox;
    lblReason: TLabel;
    dblkpReason: TDBLookupComboBox;
    btnReason: TButton;
    Panel9: TPanel;
    Label8: TLabel;
    Label25: TLabel;
    Label3: TLabel;
    memQuantity: TMemo;
    BitBtn6: TBitBtn;
    edtStartDate: TEdit;
    edtDateReq: TEdit;
    BitBtn2: TBitBtn;
    Panel10: TPanel;
    Panel11: TPanel;
    rdgType: TRadioGroup;
    Panel12: TPanel;
    Panel13: TPanel;
    Label1: TLabel;
    Label9: TLabel;
    edtDescription: TEdit;
    btnReps: TBitBtn;
    edtRep: TEdit;
    lblCustomer: TLabel;
    Label6: TLabel;
    edtCustomer: TEdit;
    BitBtn1: TBitBtn;
    btnContact: TBitBtn;
    dblkpCustomerContact: TDBLookupComboBox;
    Label11: TLabel;
    edtEmail: TEdit;
    Label13: TLabel;
    edtPhone: TEdit;
    edtContactName: TEdit;
    btnAddSupply: TBitBtn;
    btnChangeSupply: TBitBtn;
    tsSpecification: TTabSheet;
    Panel15: TPanel;
    BitBtn3: TBitBtn;
    btnNotes: TBitBtn;
    lstvwDocuments: TListView;
    imgDocuments: TImageList;
    imgIcons: TImageList;
    ToolBar1: TToolBar;
    btnExcel: TToolButton;
    btnWord: TToolButton;
    btnEmail: TToolButton;
    btnAttach: TToolButton;
    pmnuDocuments: TPopupMenu;
    CreateExcelDocument1: TMenuItem;
    CreateWordDocument1: TMenuItem;
    Email1: TMenuItem;
    Adddocument1: TMenuItem;
    N1: TMenuItem;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    N2: TMenuItem;
    pmnuSelectAll: TMenuItem;
    btnExcelCharge: TBitBtn;
    lblGDPRSignedStatement: TLabel;
    pnlSubReps: TPanel;
    Label2: TLabel;
    edtSubRep: TEdit;
    btnSubReps: TBitBtn;
    pnlEndUSer: TPanel;
    Label14: TLabel;
    edtEndUser: TEdit;
    btnEndUser: TBitBtn;
    pnlOurTotals: TPanel;
    labCosts: TLabel;
    labSales: TLabel;
    labMargin: TLabel;
    LabMarginPerc: TLabel;
    labTotalCost: TLabel;
    labTotalSell: TLabel;
    LabTotalMargin: TLabel;
    labTotalMarginPerc: TLabel;
    lblCompany: TLabel;
    Panel5: TPanel;
    pnlReseller: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    reselTotalCost: TLabel;
    reselTotalSell: TLabel;
    reselTotalMargin: TLabel;
    reselTotalMarginPerc: TLabel;
    Label23: TLabel;
    pnlPackPrice: TPanel;
    Label7: TLabel;
    labUnitSell: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    bitbtnPriceUnitClear: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure memQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure memQuantityEnter(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtDateReqExit(Sender: TObject);
    procedure edtStartDateExit(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnContactClick(Sender: TObject);
    procedure btnRepsClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure edtQuoteReqDateExit(Sender: TObject);
    procedure btnAccountManagerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNotesClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure spnConversionRateChange(Sender: TObject);
    procedure dblkpPriceUnitClick(Sender: TObject);
    procedure dblkpCustomerContactClick(Sender: TObject);
    procedure btnChgChargeClick(Sender: TObject);
    procedure btnAddChargeClick(Sender: TObject);
    procedure btnDelChargeClick(Sender: TObject);
    procedure memQuantityChange(Sender: TObject);
    procedure sgLinesDblClick(Sender: TObject);
    procedure btnInsertSupplyClick(Sender: TObject);
    procedure sgLinesDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgSupplyDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnDeleteSupplyClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure edtEstimateFileChange(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure memSpecChange(Sender: TObject);
    procedure btnOKEstimateClick(Sender: TObject);
    procedure chkbxDeclinedClick(Sender: TObject);
    procedure btnReasonClick(Sender: TObject);
    procedure rdgTypeClick(Sender: TObject);
    procedure btnAddSupplyClick(Sender: TObject);
    procedure btnChangeSupplyClick(Sender: TObject);
    procedure sgSupplyDblClick(Sender: TObject);
    procedure SpecificationChange(Sender: TObject);
    procedure sgLinesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgLinesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgLinesRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure bitbtnPriceUnitClearClick(Sender: TObject);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure btnExcelChargeClick(Sender: TObject);
    procedure btnSubRepsClick(Sender: TObject);
    procedure btnEndUserClick(Sender: TObject);
  private
    Descending: Boolean;
    SortedColumn: Integer;
    FEmailApplication: string;
    bOK, bOKClose: boolean;
    bNotesFlash: ByteBool;
    bUseProspects: boolean;
    FActivated:  boolean;
    FMode: TQMode;
    FQuote: TQuote;
    sOldValue: string;
    FOriginalQuoteFromReQuote: real;
    procedure SetLineHeaders;
    procedure SetMode(const Value: TQMode);
    procedure SetQuote(const Value: TQuote);
    procedure BuildDocumentGrid;
    procedure BuildLineGrid;
    procedure BuildSpecification;
    procedure BuildSupplyGrid;
    procedure CheckNotes(Sender: TObject);
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure ShowDetails;
    procedure ShowLines;
    procedure ShowSpecification;
    procedure ShowSupplies;
    procedure ShowTotals;
    procedure ShowUnitPrice;
    procedure ShowDocuments(rQuote: real);
    procedure GetCustomerContacts(tempno: integer);
    procedure CallMaintLines(aMode: TqlMode);
    procedure CallMaintSupplies(aMode: TqlMode);
    procedure CallMaintDocuments(const aMode: TqdocMode);
    procedure SendAndSaveEmail(sTo, sSubject: string);
    procedure CallInsertEnqScreen;
    procedure CopyEstimateFile;
    procedure CopyQuoteFile;
    procedure ConnectToExcel;
    procedure DisConnectFromExcel;
    procedure FetchData;
    procedure ParseMessage(const AFileName: string; var ATo, AFrom,
      ASubject, ADate, ABody: string);
    procedure SetChargesProperties;
    procedure SetNotesProperties;
    procedure SetDocsProperties;
    procedure SetSupplyProperties;
    procedure LoadContactDetails;
    procedure SetOriginalQuoteFromReQuote(const Value: real);
    procedure ShowListViewDocuments(strPath: string; ListView: TListView;
      ImageList: TImageList);
    function ParseDocumentFrom(tmpFrom: string): string;
    function FormatDateasDateTime(sDate: string): TDateTime;
    procedure MoveOriginalQuoteDocuments;
    procedure UpdateInternalCost;
    procedure CheckForCustomerNotes;
  public
    property Mode: TQMode read FMode write SetMode;
    property OriginalQuoteFromReQuote: real read FOriginalQuoteFromReQuote write SetOriginalQuoteFromReQuote;
    property Quote: TQuote read FQuote write SetQuote;
  end;

var
  PBMaintQuoteFrm: TPBMaintQuoteFrm;

implementation

uses pbDatabase, pbMainMenu, CCSCommon, PBImages, DateSelV5, PBLUCust,
  PBLUCConta, PBLUCRep, PBLUOps, PBDBMemo, PBMaintQuoteLines, PBWordOLE,
  PBExcelOLE, PBDocObjects, PBMaintEmail, PBMaintQuoteDoc, PBLUQuoteEnqsQty,
  PBLUQuoteReason, ComObj, AxCtrls, taoMapi, PBLUAdHoc, PBLURep, PBMaintQuoteSupply,
  PBSendtoExcel;

{$R *.dfm}

{ TPBMaintQuoteFrm }

var
  oldCursor: TCursor;

procedure TPBMaintQuoteFrm.SetMode(const Value: TQMode);
begin
  FMode := Value;
  if FMode = qDelete then
    btnOK.Caption := 'Delete';
end;

procedure TPBMaintQuoteFrm.SetQuote(const Value: TQuote);
begin
  FQuote := Value;
end;

procedure TPBMaintQuoteFrm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TPBMaintQuoteFrm.FormActivate(Sender: TObject);
var
  sTemp : string;
  bHasGDPRBeenSigned: boolean;
begin
  if not FActivated then
  begin
    bOK := false;
    bOKClose := true;

    with Quote.DataModule do
    begin
      qryPriceUnit.close;
      qryPriceUnit.open;
      qryPriceUnit.First;

      qryQReason.close;
      qryQReason.open;
      qryQReason.First;
    end;

    bUseProspects := dmBroker.UseProspects;

    dblkpCustomerContact.listsource := Quote.DataModule.srcCustContact;
    dblkpPriceUnit.listsource := Quote.DataModule.dtsPriceUnit;
    dblkpReason.listsource := Quote.DataModule.dtsQReason;

    case Mode of
    qAdd     : Caption := 'Add a Quote';
    qChange  : Caption := 'Change a Quote';
    qCopy  : Caption := 'Copy a Quote';
    qDelete  : Caption := 'Delete a Quote';
    qView    : Caption := 'View Quote details';
    qRequote   : Caption := 'Re-Quote ';

    end;  { case }

    lblDocumentDir.Caption := lblDocumentDir.Caption + ' ' + dmBroker.GetCompanyQuoteDirectory;

    if (Mode = qAdd) or (Mode = qCopy) or (Mode = qRepeat)  or (Mode = qReQuote) then
      sTemp := ' New Quote '
    else
      sTemp := ' Quote ' + floatToStr(Quote.DbKey) + ' ';

    if (Mode = qRepeat) or (Mode = qCopy) or (Mode = qReQuote) then
      begin
        Quote.DbKey := 0;
        Quote.Date := date;
        Quote.OfficeContact := frmPBMainMenu.iOperator;
        Quote.Operator := frmPBMainMenu.iOperator;
        Quote.OperatorName := frmPBMainMenu.sOperator_Name;
        Quote.Inactive := 'N';
        Quote.Narrative := 0;
        Quote.JobBag := 0;
      end;

    pnlTop.enabled := not(Mode = qView) and not(Mode = qDelete);
    pnlHeader.enabled := not(Mode = qView) and not(Mode = qDelete);
    pnlFooter.enabled := not(Mode = qView) and not(Mode = qDelete);

    SetChargesProperties;
    SetNotesProperties;
    SetDocsProperties;
    SetSupplyProperties;

    if (Mode = qAdd) then
      pgDetails.Visible := false;

    ShowSpecification;
    ShowDetails;

    UpdateInternalCost;
    ShowLines;
    ShowSupplies;

    if (Mode = qRequote) then
      ShowDocuments(OriginalQuoteFromReQuote)
    else
      ShowDocuments(Quote.dbKey);

    ShowTotals;

    Checknotes(Self);
    CheckOK(Self);

    pgDetails.Visible := true;

    FActivated := true;

    if dmBroker.UseGDPR and (lblGDPRSignedStatement.visible = false) then
      begin
        lblGDPRSignedStatement.visible := false;
        bHasGDPRBeenSigned := dmBroker.GetCustomerGDPRSigned(Quote.Customer);
        if not bHasGDPRBeenSigned and (Quote.Customer <> 0) then
        begin
          MessageDlg('The GDPR Policy has not been signed by this customer!!!', mtWarning,[mbOk], 0);
          lblGDPRSignedStatement.visible := true;
        end;
      end;

    if (Mode = qRequote) or (Mode = qCopy) or (Mode = qAdd) then
      begin
        self.CheckForCustomerNotes;
      end;

    dmBroker.ScreenAccessControl(Self,'',frmPBMainMenu.iOperator,0,0) ;
  end;
end;

procedure TPBMaintQuoteFrm.ShowDetails;
var
  DateReq: TDateTime;
  DateStart: TDateTime;
begin
  pgDetails.Pages[0].TabVisible := (mode <> qAdd);
  pgDetails.Pages[1].TabVisible := (mode <> qAdd);
  pgDetails.Pages[2].TabVisible := (mode <> qAdd);

//  pgDetails.Pages[3].TabVisible := (not dmBroker.UseProduction);
  pgDetails.Pages[3].TabVisible := false;
  pgDetails.Pages[4].TabVisible := not pgDetails.Pages[3].TabVisible;


  btnOKEstimate.Visible := (mode = qAdd) or (mode = qCopy) or (mode = qRepeat) or (mode = qReQuote);

  DateReq := date + 1;
  DateStart := date + 7;

  if Mode = qAdd then
    begin
      edtQuote.text := '<New Quote>';
      edtQuoteReqDate.Text := PBDateStr(DateReq);
      edtDateReq.Text := PBDatestr(DateStart);
      edtStartDate.Text := PBDatestr(DateStart);
      edtDate.text := PBDateStr(Date);
      edtCustomer.text := '';
      edtEmail.text := '';
      edtPhone.text := '';
      edtContactName.text := '';
      edtDescription.text := '';
      memQuantity.text := '';
      edtRep.Text := '';
      edtSubRep.Text := '';
      spnConversionRate.Value := 50;
      dblkpPriceUnit.keyvalue := 1;
      edtEstimateFile.Text := '';
      memSpec.Lines.Clear;
      chkbxDeclined.Visible := false;
      chkbxDeclined.Checked := false;
      edtEndUser.Text := '';
    end
  else
    begin
      if Quote.DbKey = 0 then
        begin
          edtQuote.text := '<New Quote>';
        end
      else
        begin
          edtQuote.text := floatToStr(Quote.DbKey);
          dmBroker.CreateQuoteDocDirectory(floattostr(Quote.dbKey));
        end;

      edtDate.text := PBDateStr(Quote.Date);
      if trim(Quote.AdhocName) <> '' then
        begin
          edtCustomer.Text := Quote.AdhocName;
          rdgType.ItemIndex := 1;
        end
      else
        begin
          edtCustomer.text := Quote.CustomerName+'/'+Quote.BranchName;
          rdgType.ItemIndex := 0;
        end;

      if (trim(Quote.AdhocName) <> '') or (Quote.ProspectQuote) then
        rdgType.Itemindex := 1;
        
      if Quote.AcquiredCustomer then
        begin
          pnlEndUser.Visible := true;
          edtEndUser.text := Quote.EndUserCustomerName; {Put Edn USer name here}
          pnlReseller.Visible := true;
          sgLines.ColWidths[6] := 80;
        end
      else
        begin
          pnlEndUser.Visible := false;
          edtEndUser.text := '';
          pnlReseller.Visible := false;
          sgLines.ColWidths[6] := -1;
        end;

      edtEmail.text := Quote.Email;
      edtPhone.text := Quote.Phone;
      edtContactName.text := Quote.ContactName;
      edtDescription.text := Quote.Description;
//      edtDescriptiveRef.Text := Quote.DescriptiveRef;
      memQuantity.text := inttostr(Quote.Quantity);
      spnConversionRate.Value := round(Quote.ConvertPercentage);
      dblkpPriceUnit.keyvalue := Quote.PriceUnit;
      memSpec.text := Quote.NarrativeText;

      if (Mode = qRepeat) or (Mode = qCopy) or (mode = qReQuote) then
        begin
          edtQuoteReqDate.Text := PBDateStr(DateReq);
          edtDateReq.Text := PBDatestr(DateStart);
          edtStartDate.Text := PBDatestr(DateStart);
          edtEstimateFile.Text := '';
          chkbxDeclined.Checked := false;
//          Quote.OfficeContact := frmPBMainMenu.iOperator;
//          edtOfficeContact.text := frmPBMainMenu.sOperator_Name;
        end
      else
        begin
          edtDateReq.Text := PBDateStr(Quote.DateRequired);
          edtStartDate.Text := pbDateStr(Quote.StartDate);
          edtQuoteReqDate.text := PBDateStr(Quote.DateQuoteRequired);
          edtEstimateFile.Text := Quote.EstimateFile;
          chkbxDeclined.Checked := (Quote.Inactive = 'Y');
          dblkpReason.KeyValue := Quote.QuoteReason;
          edtOfficeContact.text := Quote.OfficeContactName;
        end;

      if (rdgType.ItemIndex = 0) or (Quote.Adhoc = 0) then
        GetCustomerContacts(Quote.ContactNo);
      edtRep.Text := Quote.DataModule.GetRepName(Quote.rep);
      edtSubRep.Text := Quote.DataModule.GetRepName(Quote.SubRep);

      stsbrDetails.Panels[0].Text := 'Created by: ' + Quote.OperatorName;
      if Quote.JobBag <> 0 then
        stsbrDetails.Panels[2].Text := 'Job Bag: ' + inttostr(Quote.JobBag);
    end;

  btnOpen.enabled := (trim(edtEstimateFile.Text) <> '');
  btnImport.enabled := (trim(edtEstimateFile.Text) <> '');

  lbldeleteprompt.visible := (Mode = qDelete);
  btnOK.Visible := not(dmBroker.iAccCtrlMenu = 3) and not(Mode = qView);
end;

procedure TPBMaintQuoteFrm.UpdateInternalCost;
var
  iCount: integer;
begin
  for icount := 0 to pred(Quote.lines.count) do
    begin
      if Quote.Lines[iCount].InternalCostLine then
        begin
          Quote.Lines[iCount].UnitCost := (Quote.TotalNonInternalCost * (Quote.Lines[iCount].InternalCostMarkupPercentage/100));
          break;
        end;
    end;
end;

procedure TPBMaintQuoteFrm.ShowTotals;
begin
  labTotalCost.Caption := FloatToStrF(Quote.TotalCost, ffCurrency, 15, 2);
  labTotalSell.Caption := FloatToStrF(Quote.TotalSell, ffCurrency, 15, 2);
  labTotalMargin.Caption := FloatToStrF(Quote.TotalMargin, ffCurrency, 15, 2);
  labTotalMarginPerc.Caption := FloatToStrF(Quote.TotalMarginPerc, ffFixed, 15, 2);
  labUnitSell.Caption := FloatToStrF(Quote.UnitSell, ffCurrency, 15, 3);

  {Show total reseller values}
  reselTotalCost.Caption := FloatToStrF(Quote.TotalSell, ffCurrency, 15, 2);
  reselTotalSell.Caption := FloatToStrF(Quote.TotalReseller, ffCurrency, 15, 2);
  reselTotalMargin.Caption := FloatToStrF(Quote.TotalResellerMargin, ffCurrency, 15, 2);
  reselTotalMarginPerc.Caption := FloatToStrF(Quote.TotalResellerMarginPerc, ffFixed, 15, 2);
end;

procedure TPBMaintQuoteFrm.ShowSpecification;
var
//  icount: integer;
  myScrollbox: TScrollbox;
begin
  LockWindowUpdate(Handle);
  try
(*    {Remove any existing process tabs}
    for icount := pred(scrlbxSpec.ComponentCount) downto 0 do
      begin
        if scrlbxSpec.Components[icount].Tag = 999 then
          scrlbxSpec.Components[icount].Free;
      end;
*)

    myScrollBox := (findcomponent('scrlbxSpec') as TScrollBox);
    myScrollbox.free;
  finally
    LockWindowUpdate(0);
  end;

  BuildSpecification;
end;

procedure TPBMaintQuoteFrm.ShowLines;
begin
  ClearGrid(sgLines);  {Clear contents of Line grid}
  Quote.Lines.ReSequence;
  BuildLineGrid;
end;

procedure TPBMaintQuoteFrm.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
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

procedure TPBMaintQuoteFrm.ShowDocuments(rQuote: real);
var
  sPath: string;
begin
  sPath := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(rQuote) + '\';
  // Assign a Imagelist to the ListView
  lstvwDocuments.Clear;
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
end;

procedure TPBMaintQuoteFrm.SetOriginalQuoteFromReQuote(const Value: real);
begin
  FOriginalQuoteFromReQuote := Value;
end;

procedure TPBMaintQuoteFrm.ShowSupplies;
begin
  ClearGrid(sgSupply);  {Clear contents of supply grid}
  BuildSupplyGrid;
end;

procedure TPBMaintQuoteFrm.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
//    rowcount := 2;
    end;
end;

procedure TPBMaintQuoteFrm.BuildDocumentGrid;
begin
end;

procedure TPBMaintQuoteFrm.BuildLineGrid;
var
  i, icount, iLine, iChecked: integer;
  irow: integer;
begin
  icount := 0;

  with sgLines, Quote.datamodule do
    begin
      for i := 0 to pred(Quote.Lines.count) do
        begin
          irow := Quote.Lines[i].Sequence;
          cells[0,irow] := inttostr(Quote.Lines[i].Sequence);
//          cells[1,irow] := Quote.Lines[i].ProductTypeDesc;
          cells[1,irow] := Quote.Lines[i].ProcessDesc;
          cells[2,irow] := Quote.Lines[i].Description;
          cells[3,irow] := floattostr(Quote.Lines[i].Quantity);
          cells[4,irow] := Quote.Lines[i].PriceUnitDesc;
          cells[5,irow] := formatfloat('0.0000',Quote.lines[i].TotalCost);
          cells[6,irow] := formatfloat('0.0000',Quote.lines[i].TotalSSP);
          cells[7,irow] := formatfloat('0.0000',Quote.lines[i].TotalASP);
          cells[8,irow] := formatfloat('0.0000',Quote.lines[i].TotalRSP);
          icount := icount + 1;
        end;

      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
//  btnAddCharge.enabled := (Mode <> qAdd) and (Mode <> qRepeat);
  btnChgCharge.enabled := not (Quote.Lines.count = 0) and (Mode <> qRepeat);
  btnDelCharge.enabled := not (Quote.Lines.count = 0) and (Mode <> qRepeat);
  btnExcelCharge.enabled := not (Quote.Lines.count = 0) and (Mode <> qRepeat);
  if Quote.Lines.Count > 0 then
    tsCharges.Caption := 'Charges' + ' (' + inttostr(Quote.Lines.count) + ')'
  else
    tsCharges.Caption := 'Charges';
end;

procedure TPBMaintQuoteFrm.BuildSpecification;
var
  icount: integer;
  myScrollBox: TScrollBox;
  stempname: string;
  myPanel1, myPanel2: TPanel;
  myMemo: TMemo;
begin
  myScrollBox := TScrollBox.create(self);
  myScrollBox.Name := 'scrlbxSpec';
  myScrollBox.parent := tsSpecification;
  myScrollBox.align := alClient;

  for icount := 0 to pred(Quote.Departments.count) do
    begin
      with Quote.Departments[icount] do
        begin
          myPanel1 := TPanel.Create(Self);
          stempname := 'pnlHead' + Copy((IntToStr(1000 + QDepartmentNo)),2,3);
          myPanel1.Name := stempname;
          myPanel1.Caption := ' ' + DepartmentName;
//          myPanel1.Parent := scrlbxSpec;
          myPanel1.Parent := myScrollbox;
          myPanel1.Tag := 999;
          myPanel1.Align := alTop;
          myPanel1.Alignment := taLeftJustify;
          myPanel1.Font.Size := 8;
          myPanel1.Font.Style := [fsBold];
          myPanel1.Height := 17;
          myPanel1.bevelOuter := bvNone;

          {Add second panel to hold Memo component for specification}
          myPanel2 := TPanel.Create(Self);
          stempname := 'pnlDet' + Copy((IntToStr(1000 + QDepartmentNo)),2,3);
          myPanel2.Name := stempname;
          myPanel2.Caption := '';
//          myPanel2.Parent := scrlbxSpec;
          myPanel2.Parent := myScrollbox;
          myPanel2.Tag := 999;
          myPanel2.Align := alTop;
          myPanel2.Font.Size := 8;
          myPanel2.Height := 80;
          myPanel2.bevelOuter := bvNone;

          {Add Memo component to hold specification}
          mymemo := TMemo.Create(Self);
          stempname := 'mem' + Copy((IntToStr(1000 + QDepartmentNo)),2,3);
          myMemo.Name := stempname;
          myMemo.text := Specification;
          myMemo.Parent :=  myPanel2;
          myMemo.Tag := icount;
          myMemo.Align := alClient;
          myMemo.ScrollBars := ssVertical;
          myMemo.OnChange := SpecificationChange;
          myMemo.Font.Size := 8;
        end;
    end;
  tsSpecification.Visible := true;
end;

procedure TPBMaintQuoteFrm.BuildSupplyGrid;
var
  i, icount, iLine, iChecked, irow: integer;
  myImage: TImage;
begin
  icount := 0;
  irow := 1;

  with sgSupply, Quote.datamodule do
    begin
      for i := 0 to pred(Quote.Supplies.count) do
        begin
          cells[0,irow] := inttostr(Quote.Supplies[i].QSupplyNo);
          cells[1,irow] := Quote.Supplies[i].Description;
          cells[2,irow] := floattostr(Quote.Supplies[i].Quantity);
          cells[3,irow] := formatfloat('0.00',Quote.Supplies[i].TotalCost);
          cells[4,irow] := formatfloat('0.00',Quote.Supplies[i].TotalSell);
//          cells[5,irow] := Quote.Supplies[i].PriceUnitDesc;
          if Quote.Supplies[i].Enquiry = 0 then
            begin
              cells[5,irow] := '';
              cells[6,irow] := '';
            end
          else
            begin
              cells[5,irow] := inttostr(Quote.Supplies[i].Enquiry);
              cells[6,irow] := inttostr(Quote.Supplies[i].EnquiryLine);
            end;

          inc(irow);
          icount := icount + 1;
        end;

      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeSupply.enabled := not (Quote.Supplies.count = 0) and (Mode <> qRepeat);
  btnDeleteSupply.enabled := not (Quote.Supplies.count = 0) and (Mode <> qRepeat);
  if Quote.Supplies.Count > 0 then
    tsSupply.Caption := 'Supply' + ' (' + inttostr(Quote.Supplies.count) + ')'
  else
    tsSupply.Caption := 'Supply';
end;

procedure TPBMaintQuoteFrm.CheckNotes(Sender: TObject);
begin
  if trim(Quote.NarrativeText) <> '' then
  begin
    FlashTimer.Enabled := True;
    btnNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    btnNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintQuoteFrm.CheckOK(Sender : TObject);
begin
  if rdgType.ItemIndex = 0 then
    begin
      btnOK.enabled := (Trim(edtDescription.Text) <> '') and
        (Trim(memQuantity.Text) <> '') and
        (Trim(edtCustomer.Text) <> '') and
        (Trim(edtOfficeContact.Text) <> '') and
        (Trim(edtDateReq.Text) <> '') and
        (Trim(edtQuoteReqDate.Text) <> '') and
        (Trim(edtStartDate.Text) <> '') and
        (dblkpCustomerContact.text <> '') and
//        (dblkpPriceUnit.text <> '') and
        (edtRep.text <> '');
    end
  else
    begin
      if Quote.Adhoc <> 0 then
        begin
          btnOK.enabled := (Trim(edtDescription.Text) <> '') and
            (Trim(memQuantity.Text) <> '') and
            (Trim(edtCustomer.Text) <> '') and
            (Trim(edtOfficeContact.Text) <> '') and
            (Trim(edtDateReq.Text) <> '') and
            (Trim(edtQuoteReqDate.Text) <> '') and
            (Trim(edtStartDate.Text) <> '') and
            (edtContactName.text <> '') and
//            (dblkpPriceUnit.text <> '') and
            (edtRep.text <> '');
        end
      else
        begin
          btnOK.enabled := (Trim(edtDescription.Text) <> '') and
            (Trim(memQuantity.Text) <> '') and
            (Trim(edtCustomer.Text) <> '') and
            (Trim(edtOfficeContact.Text) <> '') and
            (Trim(edtDateReq.Text) <> '') and
            (Trim(edtQuoteReqDate.Text) <> '') and
            (Trim(edtStartDate.Text) <> '') and
            (dblkpCustomerContact.text <> '') and
//        (dblkpPriceUnit.text <> '') and
            (edtRep.text <> '');
        end;
    end;

  btnOKEstimate.enabled := btnOK.Enabled;
end;

procedure TPBMaintQuoteFrm.GetCustomerContacts(tempno: integer);
begin
  with Quote.Datamodule.qryCustContact do
    begin
      close;
      parambyname('Customer').asinteger := Quote.Customer;
      parambyname('Branch_no').asinteger := Quote.Branch;
      open;

      if (recordcount = 1) then
        begin
         if tempno = 0 then
           dblkpCustomerContact.keyvalue := fieldbyname('Contact_no').asinteger
         else
           dblkpCustomerContact.keyvalue := tempno
        end
      else
        begin
          if tempno = 0 then
            dblkpCustomerContact.keyvalue := 0
          else
            dblkpCustomerContact.keyvalue := tempno
        end;

      Quote.ContactNo := dblkpCustomerContact.keyvalue;
      LoadContactDetails;
    end;
end;

procedure TPBMaintQuoteFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    btnNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintQuoteFrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
    exit;
  end
  else
    (Sender as TMemo).Text := TempStr;
  dblkpPriceUnitClick(self);
end;

procedure TPBMaintQuoteFrm.memQuantityKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintQuoteFrm.memQuantityEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintQuoteFrm.BitBtn6Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtStartDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtStartDate.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintQuoteFrm.BitBtn2Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateReq.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDateReq.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintQuoteFrm.edtDateReqExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If edtDateReq.Text = '' then
    Exit;
    try
    NewDate := StrToDate(edtDateReq.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDateReq.SetFocus;
      Exit;
    end;
  end;

  edtDateReq.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintQuoteFrm.edtStartDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtStartDate.Text = '' then
    Exit;

  try
    NewDate := StrToDate(edtStartDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtStartDate.SetFocus;
      Exit;
    end;
  end;

  edtStartDate.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintQuoteFrm.btnDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDate.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintQuoteFrm.edtDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtDate.Text = '' then
    Exit;

  try
    NewDate := StrToDate(edtDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDate.SetFocus;
      Exit;
    end;
  end;

  edtDate.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintQuoteFrm.BitBtn1Click(Sender: TObject);
var
  bHasGDPRBeenSigned: boolean;
  Result, bOverride: boolean;
  rMarkup: real;
  iCount: integer;
begin
  if rdgType.ItemIndex = 0 then
    begin
      PBLUCustFrm := TPBLUCustFrm.Create(Self);
      try
        PBLUCustFrm.bIs_Lookup := True;
        PBLUCustFrm.bAllow_Upd := True;
        PBLUCustFrm.bSel_Branch := True;
        PBLUCustFrm.SelCode := Quote.Customer;
        PBLUCustFrm.SelBranch := Quote.Branch;
        PBLUCustFrm.ShowModal;
        if PBLUCustFrm.Selected then
        begin
          if dmBroker.UseGDPR then
            begin
              lblGDPRSignedStatement.visible := false;
              bHasGDPRBeenSigned := dmBroker.GetCustomerGDPRSigned(PBLUCustFrm.SelCode);
              if not bHasGDPRBeenSigned then
                begin
                  MessageDlg('The GDPR Policy has not been signed by this customer!!!', mtWarning,[mbOk], 0);
                  lblGDPRSignedStatement.visible := true;
                end;
            end;

          {Check for Acquired customer}
          Quote.AcquiredCustomer := PBLUCustFrm.AcquiredCustomer;
          if Quote.AcquiredCustomer then
            begin
              pnlEndUser.Visible := true;
              pnlReseller.Visible := true;
              sgLines.ColWidths[6] := 80;
            end
          else
            begin
              pnlEndUser.Visible := false;
              edtEndUser.text := '';
              pnlReseller.Visible := false;
              sgLines.ColWidths[6] := -1;
            end;

          Quote.Customer := PBLUCustFrm.SelCode;
          Quote.Branch := PBLUCustFrm.SelBranch;
          edtCustomer.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
          Quote.CustomerName := PBLUCustFrm.SelName;
          Quote.BranchName := PBLUCustFrm.SelBranchName;

          Quote.Rep := Quote.DataModule.GetCustomerRep(Quote.customer,Quote.Branch);
          Quote.SubRep := Quote.DataModule.GetCustomerSubRep(Quote.customer,Quote.Branch);

          edtRep.Text := Quote.DataModule.GetRepName(Quote.Rep);
          edtSubRep.Text := Quote.DataModule.GetRepName(Quote.SubRep);

          if dblkpCustomerContact.keyvalue = null then
            GetCustomerContacts(0)
          else
            GetCustomerContacts(dblkpCustomerContact.keyvalue);

          {Check if this customer overrides the production cost markup}
          rMarkup := Quote.GetCompanyMarkup;
          Result := Quote.GetCustomerMarkup(Quote.Customer,bOverride,rMarkup);
          for icount := 0 to pred(Quote.lines.count) do
            begin
              if Quote.lines[iCount].InternalCostLine then
                begin
                  Quote.lines[iCount].InternalCostMarkupPercentage := rMarkup;
                  Quote.lines[iCount].UnitCost := (Quote.TotalNonInternalCost * (Quote.lines[iCount].InternalCostMarkupPercentage/100));
                end;
              break;
            end;
          UpdateInternalCost;
          ShowLines;
          ShowTotals;
        end;
      finally
        PBLUCustFrm.Free;
      end;
    end
  else
    begin
      if dmBroker.UseProspects then
        begin
          PBLUCustFrm := TPBLUCustFrm.Create(Self);
          try
            PBLUCustFrm.bIs_Lookup := True;
            PBLUCustFrm.bAllow_Upd := True;
            PBLUCustFrm.bSel_Branch := true;
            PBLUCustFrm.SelCode := Quote.Customer;
            PBLUCustFrm.SelBranch := Quote.Branch;
            PBLUCustFrm.bProspects := true;
            PBLUCustFrm.ShowModal;
            if PBLUCustFrm.Selected then
            begin
              if dmBroker.UseGDPR then
                begin
                  lblGDPRSignedStatement.visible := false;
                  bHasGDPRBeenSigned := dmBroker.GetCustomerGDPRSigned(PBLUCustFrm.SelCode);
                  if not bHasGDPRBeenSigned then
                    begin
                      MessageDlg('The GDPR Policy has not been signed by this customer!!!', mtWarning,[mbOk], 0);
                      lblGDPRSignedStatement.visible := true;
                    end;
                end;

              {Check for Acquired customer}
              Quote.AcquiredCustomer := PBLUCustFrm.AcquiredCustomer;
              if Quote.AcquiredCustomer then
                begin
                  pnlEndUser.Visible := true;
                  pnlReseller.Visible := true;
                  sgLines.ColWidths[6] := 80;
                end
              else
                begin
                  pnlEndUser.Visible := false;
                  edtEndUser.text := '';
                  pnlReseller.Visible := false;
                  sgLines.ColWidths[6] := -1;
                end;

              Quote.Customer := PBLUCustFrm.SelCode;
              Quote.Branch := PBLUCustFrm.SelBranch;
              edtCustomer.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
              Quote.CustomerName := PBLUCustFrm.SelName;
              Quote.BranchName := PBLUCustFrm.SelBranchName;

              Quote.Rep := Quote.DataModule.GetCustomerRep(Quote.customer,Quote.Branch);
              Quote.SubRep := Quote.DataModule.GetCustomerSubRep(Quote.customer,Quote.Branch);

              edtRep.Text := Quote.DataModule.GetRepName(Quote.Rep);
              edtSubRep.Text := Quote.DataModule.GetRepName(Quote.SubRep);

              if dblkpCustomerContact.keyvalue = null then
                GetCustomerContacts(0)
              else
                GetCustomerContacts(dblkpCustomerContact.keyvalue);
            end;
          finally
            PBLUCustFrm.Free;
          end;
        end
      else
        begin
          PBLUAdhocFrm := TPBLUAdhocFrm.Create(Self);
          try
            PBLUAdhocFrm.bIs_Lookup := True;
            PBLUAdhocFrm.bAllow_Upd := True;
            PBLUAdhocFrm.SelCode := Quote.Adhoc;
            PBLUAdhocFrm.ShowModal;
            if PBLUAdhocFrm.Selected then
            begin
              Quote.Customer := 0;
              Quote.Branch := 0;
              Quote.Adhoc := PBLUAdhocFrm.SelCode;
              Quote.AdhocName := PBLUAdhocFrm.SelName;
              edtCustomer.Text := PBLUAdhocFrm.SelName;
              Quote.CustomerName := '';
              Quote.BranchName := '';
            end;
          finally
            PBLUAdhocFrm.Free;
          end;
        end;
    end;

  CheckOK(Self);
end;

procedure TPBMaintQuoteFrm.btnContactClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := true;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := Quote.Customer;
    PBLUCContaFrm.iBranch := Quote.Branch;
    if dblkpCustomerContact.keyvalue = null then
      PBLUCContaFrm.SelCode := 0
    else
      PBLUCContaFrm.SelCode := dblkpCustomerContact.keyvalue;
    PBLUCContaFrm.sCustName := Quote.CustomerName;
    PBLUCContaFrm.sBranchName := Quote.BranchName;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      GetCustomerContacts(PBLUCContaFrm.SelCode);
    end;
  finally
    PBLUCContaFrm.Free;
  end;
  CheckOK(self);

end;

procedure TPBMaintQuoteFrm.btnRepsClick(Sender: TObject);
begin
  if rdgType.itemindex = 0 then
    begin
      PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
      try
        PBLUCRepFrm.bIs_Lookup := True;
        if dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator) then
          PBLUCRepFrm.bAllow_Upd := false
        else
          PBLUCRepFrm.bAllow_Upd := True;
        PBLUCRepFrm.bOnlyShowSubReps := False;

        PBLUCRepFrm.iCust := Quote.Customer;
        PBLUCRepFrm.iBranch := Quote.Branch;
        PBLUCRepFrm.sCustName := Quote.CustomerName;
        PBLUCRepFrm.sBranchName := Quote.BranchName;
        PBLUCRepFrm.SelCode := Quote.Rep;
        PBLUCRepFrm.ShowModal;
        if PBLUCRepFrm.bselected then
        begin
          Quote.Rep := PBLUCRepFrm.selcode;
          edtRep.Text := PBLUCRepFrm.SelName;
//        GetCustomerReps(PBLUCRepFrm.SelCode);
        end;
      finally
        PBLUCRepFrm.Free;
      end;
    end
  else
    begin
      PBLURepFrm := TPBLURepFrm.Create(Owner);
      try
        PBLURepFrm.bIs_Lookup := True;
        PBLURepFrm.bAllow_Upd := True;

        PBLURepFrm.SelCode := Quote.Rep;
        PBLURepFrm.ShowModal;
        if PBLURepFrm.Selected then
        begin
          Quote.Rep := PBLURepFrm.selcode;
          edtRep.Text := PBLURepFrm.SelName;
        end;
      finally
        PBLURepFrm.Free;
      end;
    end;
  CheckOK(self);

end;

procedure TPBMaintQuoteFrm.BitBtn9Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtQuoteReqDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtQuoteReqDate.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintQuoteFrm.edtQuoteReqDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtQuoteReqDate.Text = '' then
    Exit;

  try
    NewDate := StrToDate(edtQuoteReqDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtQuoteReqDate.SetFocus;
      Exit;
    end;
  end;

  edtQuoteReqDate.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintQuoteFrm.btnAccountManagerClick(Sender: TObject);
begin
  PBLUOpsFrm := TPBLUOpsFrm.Create(self);
  try
    PBLUOpsFrm.bIs_Lookup := True;
    PBLUOpsFrm.bAllow_Upd := True;

    PBLUOpsFrm.SelCode := Quote.OfficeContact;
    PBLUOpsFrm.ShowModal;
    if PBLUOpsFrm.selected then
      begin
        Quote.OfficeContact := PBLUOpsFrm.SelCode;
        edtOfficeContact.Text := PBLUOpsFrm.SelName;
        CheckOK(self);
      end;
  finally
    PBLUOpsFrm.Free;
  end;
end;

procedure TPBMaintQuoteFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  if Mode = qView then exit;

  TempWord := MessageDlg('Do you want to save these quote details?', mtConfirmation,
      [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
    begin
      Exit;
    end
  else
  if TempWord = mrCancel then
    Action := caNone
  else
    begin
      btnOKClick(self);
    end;
end;

procedure TPBMaintQuoteFrm.btnNotesClick(Sender: TObject);
var
  PBDBInvMemoFrm: TPBDBMemoFrm;
begin
  PBDBInvMemofrm := TPBDBMemoFrm.create(self);
  try
    if Mode = qView then
      PBDBInvMemoFrm.bAllow_Upd := false
    else
      PBDBInvMemoFrm.bAllow_Upd := true;

    PBDBInvMemoFrm.Datamemo.text := Quote.NarrativeText;
    PBDBInvMemoFrm.ShowModal;
    Quote.Narrativetext := PBDBInvMemofrm.Datamemo.text;
  finally
    PBDBInvMemofrm.free;
  end;
  checknotes(Self);
end;

procedure TPBMaintQuoteFrm.btnOKClick(Sender: TObject);
var
  i, inx: integer;
begin
  if Mode = qDelete then
    begin
      if messagedlg('Are you sure you want to delete this quote?', mtConfirmation, [mbYes, mbNo], 1) = mrYes then
        Quote.DeleteFromDB
      else
        exit;
    end;

  if (Mode = qAdd) or (Mode = qChange) or (Mode = qCopy) or (Mode = qReQuote) then
    begin
      if trim(edtEstimateFile.Text) <> '' then
        begin
          try
            if (FileDateToDateTime(FileAge(edtEstimateFile.text)) > Quote.LastEstimateDate) then
              begin
                if messagedlg('The estimate could be different to the quote, do you want to delete all lines and recalculate the quote?',
                    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                  begin
                    for inx := pred(Quote.lines.count) downto 0 do
                      begin
                        if Quote.Lines[inx].CostingToolFlag then
                          Quote.Lines.Delete(inx);
                      end;
                    FetchData;
                    Quote.LastEstimateDate := now;
                  end;
              end;
          except
            Quote.EstimateFile := '';
            Quote.LastEstimateDate := 0;
          end;
        end;

      for i := 0 to pred(Quote.lines.count) do
        begin
          if Quote.Lines[i].PriceUnit = 0 then
            begin
              messagedlg('A price unit for all lines must be entered', mtError, [mbOk], 0);
              exit
            end;
        end;
    end;

  if (Mode = qAdd) or (Mode = qChange) or (Mode = qCopy) or (Mode = qReQuote)  then
    begin
      if Quote.AcquiredCustomer and (trim(edtEndUSer.Text) = '') then
        begin
          if messagedlg('This quote is for an acquired customer, do you want to enter the End User details?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              btnEndUserClick(self);
              exit;
            end;
        end;
    end;

  if (Mode = qChange) then
    begin
      if chkbxDeclined.Checked and (dblkpReason.Text = '') then
        begin
          messagedlg('If the quote is to be declined then please select a reason', mtError, [mbOk], 0);
          exit;
        end;
    end;
  Quote.date := PBDateStr(edtDate.text);
  Quote.DateQuoteRequired := PBDateStr(edtQuoteReqDate.text);
  Quote.StartDate := PBDateStr(edtStartDate.text);
  Quote.DateRequired := PBDateStr(edtDateReq.text);
  Quote.Quantity := strtoint(memQuantity.text);
  Quote.ContactName := Trim(edtContactName.Text);
  Quote.Email := Trim(edtEmail.Text);
  Quote.Phone := Trim(edtPhone.Text);
  Quote.Description := Trim(edtDescription.Text);
//  Quote.DescriptiveRef := Trim(edtDescriptiveRef.text);
  Quote.OfficeContactName := edtOfficeContact.Text;
  if chkbxDeclined.checked then
    Quote.Inactive := 'Y'
  else
    Quote.Inactive := 'N';

  {Set whether this is a Prospect Quote}
  Quote.ProspectQuote := (rdgType.itemindex = 1);

  try
    Quote.QuoteReason := dblkpReason.KeyValue;
  except
    Quote.QuoteReason := 0;
  end;

  if (Mode = qAdd) or (Mode = qCopy) or (Mode = qRepeat) or (Mode = qRequote) then
    begin
      Quote.QuoteStatus := 10;
    end;

  bOK := true;
  if (Mode = qAdd) or (Mode = qCopy) or (Mode = qRepeat) or (Mode = qChange) or (Mode = qRequote) then
    begin
      Quote.SaveToDB(true);

      if Mode = qRequote then
        begin
          MoveOriginalQuoteDocuments;
        end;

      if (Mode = qAdd) or (Mode = qChange) then
        CopyEstimateFile
      else
        CopyQuoteFile;

      if (Mode <> qChange) then
        begin
          try
            Quote.LastEstimateDate := FileDateToDateTime(FileAge(Quote.EstimateFile));
          except
            Quote.LastEstimateDate := now;
          end;
          Quote.SaveLastEstimateDate;
        end;
      Quote.SaveEstimateFile;
    end
  else
  if (Mode = qDelete) then
    begin
      Quote.Inactive := 'Y';
      Quote.DeleteFromDB;
    end;

  if (Mode = qAdd) or (Mode = qCopy) or (Mode = qRepeat) or (Mode = qRequote) then
    begin
      MessageDlg('The quote number is : ' + floatToStr(Quote.dbKey), mtInformation, [mbOK], 0);
    end;

  if bOKClose then
    ModalResult := mrOK
  else
    begin
      Mode := qChange;
      Factivated := false;
      FormActivate(self);
      pgDetails.ActivePage := tsCharges;
      exit;
    end;
end;

procedure TPBMaintQuoteFrm.MoveOriginalQuoteDocuments;
var
  sSource, sDest: string;
  ListItem: TListItem;
  irow: integer;
begin

  sSource := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(self.OriginalQuoteFromReQuote) + '\' ;
  sDest :=  dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(Quote.dbkey) + '\' ;

  for irow := 0 to pred(lstvwDocuments.items.count) do
    begin
      ListItem := lstvwDocuments.items[irow];
      //copy the file
      try
        filecopy(sSource+ListItem.Caption, sDest+ListItem.Caption);
      except
      end;
    end;
end;

procedure TPBMaintQuoteFrm.FormCreate(Sender: TObject);
begin
  pgDetails.ActivePage := tsCharges;

  {Show pack pricing option is using Pack Prices}
  pnlPackPrice.Visible := dmBroker.UsePackPricing;

  pnlSubReps.Visible := dmBroker.UseSubReps;

  SetLineHeaders;

  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintQuoteFrm.SetLineHeaders;
begin
  {Invoice Line header}
  sgLines.cells[0,0] := 'Line';
//  sgLines.cells[1,0] := 'Product Type';
  sgLines.cells[1,0] := 'Process';
  sgLines.cells[2,0] := 'Description';
  sgLines.cells[3,0] := 'Quantity';
  sgLines.cells[4,0] := 'Price Unit';
  sgLines.cells[5,0] := 'Total Cost';
  sgLines.cells[6,0] := 'Total SSP';
  sgLines.cells[7,0] := 'Total ASP';
  sgLines.cells[8,0] := 'Total RSP';
  sgLines.cells[9,0] := 'Status';

  sgSupply.cells[0,0] := 'Line';
  sgSupply.cells[1,0] := 'Description';
  sgSupply.cells[2,0] := 'Quantity';
  sgSupply.cells[3,0] := 'Total Cost';
  sgSupply.cells[4,0] := 'Total Sell';
  sgSupply.cells[5,0] := 'Enquiry';
  sgSupply.cells[6,0] := 'Enq Line';
end;

procedure TPBMaintQuoteFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintQuoteFrm.spnConversionRateChange(Sender: TObject);
begin
  Quote.ConvertPercentage := spnConversionRate.Value;
end;

procedure TPBMaintQuoteFrm.dblkpPriceUnitClick(Sender: TObject);
begin
  Quote.PriceUnit := dblkpPriceUnit.KeyValue;
  Quote.PriceUnitFactor := Quote.DataModule.getPriceUnitFactor(Quote.PriceUnit);
  ShowUnitPrice;
  CheckOK(self);
end;

procedure TPBMaintQuoteFrm.dblkpCustomerContactClick(Sender: TObject);
begin
  Quote.ContactNo := (Sender as TDBLookupComboBox).keyvalue;
  LoadContactDetails;
  CheckOK(self);
end;

procedure TPBMaintQuoteFrm.btnChgChargeClick(Sender: TObject);
begin
  CallMaintLines(qlChange);
end;

procedure TPBMaintQuoteFrm.LoadContactDetails;
begin
  with Quote.DataModule.qryGetCustContact do
    begin
      close;
      parambyname('Customer').asinteger := Quote.Customer;
      parambyname('branch_no').asinteger := Quote.Branch;
      parambyname('Contact_no').asinteger := Quote.ContactNo;
      open;

      edtPhone.text := fieldbyname('Phone').asstring;
      edtEmail.text := fieldbyname('Email').asstring;
    end;
end;

procedure TPBMaintQuoteFrm.CallMaintLines(aMode: TqlMode);
var
  inx : integer;
  irow: integer;
  QuoteLine : TQuoteLIne;
  PBMaintQuoteLinesFrm: TPBMaintQuoteLinesFrm;
begin
  try
    inx := strtoint(sgLines.cells[0,sgLines.row]);
  except
    inx := 1;
  end;

  irow := inx;

  if aMode = qlAdd then
    begin
      QuoteLine := TQuoteLine.Create(Quote);
      if Quote.Lines.count > 0 then
        begin
          QuoteLine.ProcessGroup := Quote.Lines[pred(Quote.Lines.count)].ProcessGroup;
          QuoteLine.Process := Quote.Lines[pred(Quote.Lines.count)].Process;
          QuoteLine.ProductType := Quote.Lines[pred(Quote.Lines.count)].ProductType;
        end;
    end
  else
    begin
      inx := Quote.Lines.IndexOfSequence(inx);
      QuoteLine := Quote.Lines[inx];
    end;

  if (aMode = qlChange) then
    begin
      if QuoteLine.InternalCostLine and (not dmBroker.OperatorCanDeleteQuoteCosts(frmPBMainMenu.iOperator)) then
        begin
          MessageDlg('This line is an internal cost and cannot be changed.', mtInformation,
            [mbOk], 0);
          exit;
        end
    end
  else
  if (aMode = qlDelete) and (not dmBroker.OperatorCanDeleteQuoteCosts(frmPBMainMenu.iOperator)) then
    begin
      if QuoteLine.InternalCostLine then
        begin
          MessageDlg('This line is an internal cost and cannot be changed.', mtInformation,
            [mbOk], 0);
          exit;
        end
    end;

  PBMaintQuoteLinesFrm := TPBMaintQuoteLinesFrm.Create(Self);
  try
    PBMaintQuoteLinesFrm.QuoteLine := QuoteLine;

    if Mode = qView then
      aMode := qlView;

    PBMaintQuoteLinesFrm.InternalCostLine := QuoteLine.InternalCostLine;
    PBMaintQuoteLinesFrm.Mode := aMode;
    PBMaintQuoteLinesFrm.ShowModal;
    if (aMode = qlAdd) and (PBMaintQuoteLinesFrm.ModalResult <> mrOK) then
      QuoteLine.Free;
    if (PBMaintQuoteLinesFrm.ModalResult = mrOK) then
      begin
        if Mode <> qView then
          begin
            UpDateInternalCost;
            ShowLines;
            ShowTotals;
          end;

        if aMode = qlAdd then
          begin
            irow := Quote.Lines.count;
            if irow <= 0 then irow := 1;
          end
        else
        if aMode = qlDelete then
          begin
            irow := irow-1;
            if irow <= 0 then irow := 1;
          end;
        sgLines.row := irow;
      end;
  finally
    PBMaintQuoteLinesFrm.Free;
  end;
end;

procedure TPBMaintQuoteFrm.CallMaintSupplies(aMode: TqlMode);
var
  inx : integer;
  irow: integer;
  QuoteSupply : TQuoteSupply;
  PBMaintQuoteSupplyFrm: TPBMaintQuoteSupplyFrm;
begin
  try
    inx := strtoint(sgSupply.cells[0,sgSupply.row]);
  except
    inx := 1;
  end;

  irow := inx;

  if aMode = qlAdd then
    begin
      QuoteSupply := TQuoteSupply.Create(Quote);
    end
  else
    begin
      inx := Quote.Supplies.IndexOf(inx);
      QuoteSupply := Quote.Supplies[inx];
    end;

  PBMaintQuoteSupplyFrm := TPBMaintQuoteSupplyFrm.Create(Self);
  try
    PBMaintQuoteSupplyFrm.QuoteSupply := QuoteSupply;

    if Mode = qView then
      aMode := qlView;

    PBMaintQuoteSupplyFrm.Mode := aMode;
    PBMaintQuoteSupplyFrm.ShowModal;
    if (aMode = qlAdd) and (PBMaintQuoteSupplyFrm.ModalResult <> mrOK) then
      QuoteSupply.Free;
    if (PBMaintQuoteSupplyFrm.ModalResult = mrOK) then
      begin
        if Mode <> qView then
          begin
            ShowSupplies;
            ShowTotals;
          end;

        if aMode = qlAdd then
          begin
            irow := Quote.Supplies.count;
            if irow <= 0 then irow := 1;
          end
        else
        if aMode = qlDelete then
          begin
            irow := irow-1;
            if irow <= 0 then irow := 1;
          end;
        sgSupply.row := irow;
      end;
  finally
    PBMaintQuoteSupplyFrm.Free;
  end;
end;

procedure TPBMaintQuoteFrm.btnAddChargeClick(Sender: TObject);
begin
  CallMaintLines(qlAdd);
end;

procedure TPBMaintQuoteFrm.btnDelChargeClick(Sender: TObject);
begin
  CallMaintLines(qlDelete);
end;

procedure TPBMaintQuoteFrm.ShowUnitPrice;
begin
  labUnitSell.Caption := FloatToStrF(Quote.UnitSell, ffCurrency, 15, 3);
end;

procedure TPBMaintQuoteFrm.CallMaintDocuments(const aMode: TqdocMode);
begin
end;

procedure TPBMaintQuoteFrm.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docdir, compdir, docExt: string;
  document: TDocument;
  QuoteDoc: TQuoteDoc;
  inx: integer;
begin
  docDir := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(Quote.DbKey);
  compDir := dmBroker.GetCompanyQuoteDirectory;

  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    FEmailApplication := ReadString('Email', 'Application', 'None');

  sBody := '';
  sfilePath := docdir;
  okToSave := false;

  EmailAndSaveViaOutlook(sTo,sSubject,sBody,sFilePath,okToSave, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

  if okToSave then
    begin
      ShowDocuments(Quote.dbkey)
    end;
end;

procedure TPBMaintQuoteFrm.memQuantityChange(Sender: TObject);
begin
  try
    Quote.Quantity := strtoint(memQuantity.text)
  except
    Quote.Quantity := 0;
  end;

  CheckOK(self);
end;

procedure TPBMaintQuoteFrm.sgLinesDblClick(Sender: TObject);
begin
  if sgLines.cells[0,sgLines.row] <> '' then
    btnChgChargeClick(self);
end;

procedure TPBMaintQuoteFrm.btnInsertSupplyClick(Sender: TObject);
begin
  CallInsertEnqScreen;
end;

procedure TPBMaintQuoteFrm.CallInsertEnqScreen;
var
  inx: integer;
  QuoteSupply: TQuoteSupply;
  Selected : Boolean;
begin
  QuoteSupply := TQuoteSupply.Create(Quote);

  PBLUQuoteEnqsQtyFrm := TPBLUQuoteEnqsQtyFrm.Create(Self);
  try
    PBLUQuoteEnqsQtyFrm.Customer := Quote.Customer;
    PBLUQuoteEnqsQtyFrm.Branch := Quote.Branch;
    PBLUQuoteEnqsQtyFrm.QuoteSupply := QuoteSupply;
    PBLUQuoteEnqsQtyFrm.CustomerName :=
      Trim(Quote.CustomerName) + '/' + Trim(Quote.BranchName);
    PBLUQuoteEnqsQtyFrm.ShowModal;
    Selected := PBLUQuoteEnqsQtyFrm.Selected;
    if Selected then
      begin
        ShowSupplies;
        ShowTotals;

        inx := pred(Quote.Supplies.count);
        if inx < 0 then
          inx := 0;
        sgSupply.row := inx+1;
      end
    else
      QuoteSupply.Free;
  finally
    PBLUQuoteEnqsQtyFrm.Free;
  end;
end;

procedure TPBMaintQuoteFrm.sgLinesDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
begin
  if Quote.Lines.Count > 0 then
  begin
    if (vCol = 0) or (vCol = 1) or (vCol = 2) or (vCol = 4) then
  	begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);

    end
    else
  	begin
			{Display the Columns Right justified in the cells}
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
  end;

end;

procedure TPBMaintQuoteFrm.sgSupplyDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
begin
  if Quote.Supplies.Count > 0 then
  begin
    if (vCol = 0) or (vCol = 1) then
  	begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);

    end
    else
  	begin
			{Display the Columns Right justified in the cells}
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
  end;
end;

procedure TPBMaintQuoteFrm.btnDeleteSupplyClick(Sender: TObject);
var
  QuoteSupply: TQuoteSupply;
  inx: integer;
begin
  try
    inx := strtoint(sgSupply.cells[0,sgSupply.row]);
  except
    inx := 1;
  end;

  inx := Quote.Supplies.IndexOf(inx);
  QuoteSupply := Quote.Supplies[inx];

  if QuoteSupply.LineConverted = 'Y' then
    begin
      MessageDlg('This enquiry cannot be deleted, this has already been converted to a job as part of this quote', mtInformation, [mbOk], 0);
      exit;
    end;

  if messagedlg('Delete the selected enquiry from the Quote', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      QuoteSupply.Parent.Supplies.Delete(inx);
      ShowSupplies;
      ShowTotals;
      inx := inx - 1;
      if inx < 0 then inx := 0;
      sgSupply.row := inx + 1;
    end;
end;

procedure TPBMaintQuoteFrm.btnBrowseClick(Sender: TObject);
var
  docDir, tempStr, tempStr2: string;
  iLength, iPos: integer;
  icount: integer;
begin
  iLength := length(trim(Quote.EstimateFile));

  docdir := Quote.EstimateFile;

  while pos('\',docdir) <> 0 do
    begin
      iPos := pos('\',docdir);
      docdir := stringreplace(docdir,'\','*',[]);
    end;

  tempstr := copy(Quote.EstimateFile,(ipos+1),(iLength-iPos));

  tempStr2 := copy(Quote.EstimateFile,1,iPos);

  {Find a document} ;
  with DocOpenDialog do
  begin
    
    InitialDir := tempStr2;
    FileName := tempStr;
    ForceCurrentDirectory := false;
    if Execute then
    begin
      for icount := 0 to pred(Files.Count) do
        begin
          edtEstimateFile.text := Files.Strings[icount];
        end;
    end;
  end;
end;

procedure TPBMaintQuoteFrm.edtEstimateFileChange(Sender: TObject);
begin
  Quote.EstimateFile := edtEstimateFile.text;
  btnOpen.Enabled := (edtEstimateFile.Text <> '');
  btnImport.Enabled := (edtEstimateFile.Text <> '');
end;

procedure TPBMaintQuoteFrm.CopyEstimateFile;
var
  s,t: tfilestream;
  BytesToCopy: Integer ;
  sourcefilename, targetfilename: string;
  docdir, docname: string;
  iLength, ipos: integer;
  LocalDir, LocalDrive: String;
begin
  if (dmBroker.GetCompanyQuoteDirectory = '')
    then exit;

  LocalDrive := copy(GetWinSysDir,1,2);
	LocalDir := extractfilepath(application.ExeName);

  if trim(Quote.EstimateFile) = '' then
    begin
      docdir := LocalDir + 'costingtool.xls';
//      docdir := LocalDrive + '\Program Files\Centrereed Ltd\Broker\costingtool.xls';
      Quote.EstimateFile := docdir;
    end
  else
    docdir := Quote.EstimateFile;

  iLength := length(trim(Quote.EstimateFile));

  while pos('\',docdir) <> 0 do
    begin
      iPos := pos('\',docdir);
      docdir := stringreplace(docdir,'\','*',[]);
    end;

  docname := copy(Quote.EstimateFile,(ipos+1),(iLength-iPos));

  sourcefilename := Quote.EstimateFile;
  targetfilename := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(Quote.DbKey)+'\'+docname;

  if sourcefilename = targetfilename then
    exit;

  Quote.EstimateFile := targetfilename;

//  progressbar1.position := 0 ;
//  progressbar1.visible := True ;
  if fileexists(targetfilename) = true then
    if deletefile(targetfilename) = false then
      messagedlg('Problem deleting quote global copy',mterror,[mbok],0) ;
  try
    s := tfilestream.create(sourcefilename,fmOpenread);

    try
      t:=tfilestream.create(targetfilename,fmcreate);
      try
        while s.position < s.size do
          begin
//          progressbar1.position := Trunc(s.position / 10000);
//          BrokerVersFrm.refresh ;
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
  except
  end;
end;

procedure TPBMaintQuoteFrm.CopyQuoteFile;
var
  s,t: tfilestream;
  BytesToCopy: Integer ;
  sourcefilename, targetfilename: string;
  docdir, docname: string;
  iLength, ipos: integer;
  LocalDir, LocalDrive: String;
begin
  if (dmBroker.GetCompanyQuoteDirectory = '')
    then exit;

  LocalDrive := copy(GetWinSysDir,1,2);
	LocalDir := extractfilepath(application.ExeName);

  if trim(Quote.EstimateFile) = '' then
    begin
      docdir := LocalDir + 'costingtool.xls';
//      docdir := LocalDrive + '\Program Files\Centrereed Ltd\Broker\costingtool.xls';
      Quote.EstimateFile := docdir;
    end
  else
    docdir := Quote.EstimateFile;

  iLength := length(trim(Quote.EstimateFile));

  while pos('\',docdir) <> 0 do
    begin
      iPos := pos('\',docdir);
      docdir := stringreplace(docdir,'\','*',[]);
    end;

  docname := copy(Quote.EstimateFile,(ipos+1),(iLength-iPos));

  sourcefilename := Quote.EstimateFileOrig;
  targetfilename := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(Quote.DbKey)+'\'+docname;

  if sourcefilename = targetfilename then
    exit;

  Quote.EstimateFile := targetfilename;

//  progressbar1.position := 0 ;
//  progressbar1.visible := True ;
  if fileexists(targetfilename) = true then
    if deletefile(targetfilename) = false then
      messagedlg('Problem deleting quote global copy',mterror,[mbok],0) ;

  try
    s := tfilestream.create(sourcefilename,fmOpenread);

    try
      t:=tfilestream.create(targetfilename,fmcreate);
      try
        while s.position < s.size do
          begin
//          progressbar1.position := Trunc(s.position / 10000);
//          BrokerVersFrm.refresh ;
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
  except
  end;
end;

procedure TPBMaintQuoteFrm.btnOpenClick(Sender: TObject);
var
  FiName, Params: Array [0..255] of char ;
  iTempResult: integer;
  sTempError: string;
begin
  if edtEstimateFile.text = '' then
    exit;

  Params := '' ;
  StrPCopy(FiName, edtEstimateFile.text) ;

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

procedure TPBMaintQuoteFrm.FetchData;
var
  sTemp, sWorkCentre: string;
  rFactor: real;
  iProductType, iProcess: integer;
  QuoteLine: TQuoteLine;
begin

  ConnectToExcel;

  AdoQuery1.Close;
  try
  try
    iProductType := 0;
    iProcess := 0;
    AdoQuery1.Open;
    while AdoQuery1.Eof <> true do
      begin
//        ShowMessage('Process '+AdoQuery1.fields[2].AsString+','+AdoQuery1.fields[10].AsString+','+AdoQuery1.fields[11].AsString+','+AdoQuery1.fields[12].AsString+','+AdoQuery1.fields[13].AsString+','+AdoQuery1.fields[14].AsString+','+trim(AdoQuery1.fields[18].AsString)+','+trim(AdoQuery1.fields[19].AsString));
        if (AdoQuery1.fields[1].AsString = 'y') or (AdoQuery1.fields[1].AsString = 'Y') then
          begin
//            ShowMessage('Process '+AdoQuery1.fields[2].AsString+','+AdoQuery1.fields[10].AsString+','+AdoQuery1.fields[11].AsString+','+AdoQuery1.fields[12].AsString+','+AdoQuery1.fields[13].AsString+','+AdoQuery1.fields[14].AsString+','+trim(AdoQuery1.fields[18].AsString));
            if (AdoQuery1.fields[2].AsString <> '') then
              begin
                sWorkCentre := trim(AdoQuery1.fields[0].AsString);
                if trim(AdoQuery1.fields[2].AsString) = 'To supply' then
                  begin
                    iProductType := 0;
                    iProcess := 0;
                  end;

                {this must be a Product Type}
                if trim(AdoQuery1.fields[10].Asstring) = '' then
//                  iProductType := Quote.Datamodule.GetNewProductTypeCode(AdoQuery1.fields[2].AsString,iProductType)
                    iProcess := Quote.Datamodule.GetNewProcessCode(AdoQuery1.fields[2].AsString,iProcess)
                else
                  begin
//                    if (iProductType <> 0) and (AdoQuery1.fields[10].AsString <> '') then
                    if (iProcess <> 0) and (AdoQuery1.fields[10].AsString <> '') and (AdoQuery1.fields[10].AsString <> '0') then
                    begin
                    {create the quote charges here}
                    QuoteLine := TQuoteLine.Create(Quote);
                    QuoteLine.Description := Trim(AdoQuery1.fields[2].AsString);
                    QuoteLine.Quantity := strtoint(AdoQuery1.fields[10].AsString);

                    QuoteLine.Process := iProcess;
                    QuoteLine.ProcessDesc := Quote.DataModule.GetProcessDescription(iProcess);
                    QuoteLine.ProcessGroup := Quote.Datamodule.GetProcessGroup(iProcess);
                    iProductType := Quote.Datamodule.GetProcessProductType(iProcess);
                    QuoteLine.ProductType := iProductType;
                    QuoteLine.ProductTypeDesc := Quote.DataModule.GetProductType(iProductType);

                    rFactor := strtofloat(AdoQuery1.fields[12].AsString) / strtofloat(AdoQuery1.fields[11].AsString);
                    QuoteLine.PriceUnitFactor := round(strtoint(AdoQuery1.fields[10].AsString)/rFactor);
                    QuoteLine.PriceUnit := Quote.DataModule.GetPriceUnitFromFactor(QuoteLine.PriceUnitFactor);

                    if QuoteLine.PriceUnit = 0 then
                      begin
                        QuoteLine.PriceUnitFactor := 0;
                        QuoteLine.PriceUnit := Quote.DataModule.GetPriceUnitFromFactor(QuoteLine.PriceUnitFactor);
                      end;
                    QuoteLine.PriceUnitDesc := Quote.DataModule.GetPriceUnit(QuoteLine.PriceUnit);

                    // Number of hours
                    try
                      QuoteLine.NoOfHours := strtofloat(trim(AdoQuery1.fields[18].asstring))
                    except
                      QuoteLine.NoOfHours := 0
                    end;

                    // Staff Count/Team Count
                    try
                      QuoteLine.TeamCount := strtoint(trim(AdoQuery1.fields[19].asstring))
                    except
                      QuoteLine.TeamCount := 0
                    end;

                    // Actual Selling Price
                    try
                      QuoteLine.UnitSell := strtofloat(AdoQuery1.fields[11].AsString);
                    except
                      QuoteLine.UnitSell := 0;
                    end;

                    // Direct Cost
                    try
                      QuoteLine.UnitCost := strtofloat(AdoQuery1.fields[16].AsString)/rFactor;
                    except
                      QuoteLine.UnitCost := 0;
                    end;

                    // SSP
                    try
                      QuoteLine.UnitSSP := strtofloat(AdoQuery1.fields[14].AsString)/rFactor;
                    except
                      QuoteLine.UnitSSP := 0;
                    end;

                    // Direct Cost plus Overhead
                    try
                      QuoteLine.UnitCostOHD := strtofloat(AdoQuery1.fields[15].AsString)/rFactor;
                    except
                      QuoteLine.UnitCostOHD := 0;
                    end;

                    // SSP original
                    try
                      QuoteLine.UnitSSPOrig := strtofloat(AdoQuery1.fields[17].AsString)/rFactor;
                    except
                      QuoteLine.UnitSSPOrig := 0;
                    end;

//                    QuoteLine.WorkCentre := Quote.DataModule.GetWorkCentre(sWorkCentre);
                    QuoteLine.WorkCentre := Quote.DataModule.GetWorkCentrebyEstName(sWorkCentre);

                    if QuoteLine.WorkCentre = 0 then
                      QuoteLine.WorkCentreGroup := Quote.DataModule.GetWorkCentreGroupbyName(sWorkCentre)
                    else
                      QuoteLine.WorkCentreGroup := Quote.DataModule.GetWorkCentreGroupbyWC(QuoteLine.WorkCentre);

                    QuoteLine.CostingToolFlag := true;
                    QuoteLine.QuoteLineNo := QuoteLine.Parent.Lines.MaxLineNo + 1;
                    QuoteLine.Sequence := QuoteLine.Parent.Lines.count+1;
                    QuoteLine.Parent.Lines.Add(QuoteLine);
                    end;
                  end;
              end;
          end;
        AdoQuery1.Next;
      end;
    AdoQuery1.Close;
    UpdateInternalCost;
    ShowLines;
    ShowTotals;
    if Quote.lines.count > 0 then
      ShowMessage(inttostr(Quote.lines.count) + ' estimate charges imported successfully!')
    else
      ShowMessage('No estimate charges imported!')
  except
    ShowMessage('Unable to read data from Excel, '
                + ' make sure the query ' + edtEstimateFile.Text +
                 ' is meaningful!');
    raise;
  end;
  finally
    DisConnectFromExcel;
  end;
end;

procedure TPBMaintQuoteFrm.DisConnectFromExcel;
begin
  try
    AdoConnection1.Close;
  except
    ShowMessage('Unable to close '
                + ' the workbook in ' + edtEstimateFile.Text);
    raise;
  end;
end;

procedure TPBMaintQuoteFrm.ConnectToExcel;
var
  strConn :  widestring;
begin
  strConn :=  'Provider=Microsoft.Jet.OLEDB.4.0;' +
              'Data Source=' + edtEstimateFile.Text + ';' +
              'Extended Properties=Excel 8.0;Jet OLEDB:Engine Type=35;HDR=NO;';


  AdoConnection1.Connected := False;
  AdoConnection1.ConnectionString := strConn;
  try
    AdoConnection1.Open;
    stsbrDetails.Panels[1].Text := 'Connected OK';
  except
    ShowMessage('Unable to connect to Excel, make sure '
                + ' the workbook ' + edtEstimateFile.Text + ' exist!');
    raise;
  end;
end;(*ConnectToExcel*)

procedure TPBMaintQuoteFrm.btnImportClick(Sender: TObject);
var
  inx: integer;
begin
  if messagedlg('Do you want to import the selected estimate file and delete all existing charges?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            for inx := pred(Quote.lines.count) downto 0 do
              begin
                Quote.Lines.Delete(inx);
              end;
            FetchData;
            Quote.LastEstimateDate := now;
          end;
end;

procedure TPBMaintQuoteFrm.memSpecChange(Sender: TObject);
begin
//  Quote.NarrativeText := memSpec.Text;
end;

procedure TPBMaintQuoteFrm.btnOKEstimateClick(Sender: TObject);
begin
  bOKClose := false;
  btnOKClick(self);
end;

procedure TPBMaintQuoteFrm.chkbxDeclinedClick(Sender: TObject);
begin
  dblkpReason.visible := chkbxDeclined.Checked;
  lblReason.visible := chkbxDeclined.Checked;
  btnReason.visible := chkbxDeclined.Checked;
end;

procedure TPBMaintQuoteFrm.btnReasonClick(Sender: TObject);
begin
  PBLUQuoteReasonFrm := TPBLUQuoteReasonFrm.Create(Self);
  try
    PBLUQuoteReasonFrm.bIs_Lookup := False;
    PBLUQuoteReasonFrm.bAllow_Upd := True;
    PBLUQuoteReasonFrm.ShowModal;

    with Quote.DataModule do
      begin
        qryQReason.Close;
        qryQReason.Open;
      end;

  finally
    PBLUQuoteReasonFrm.Free;
  end;
end;

procedure TPBMaintQuoteFrm.ParseMessage(const AFileName: string; var ATo, AFrom,
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

function TPBMaintQuoteFrm.ParseDocumentFrom(tmpFrom: string): string;
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

function TPBMaintQuoteFrm.FormatDateasDateTime(sDate: string): TDateTime;
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

procedure TPBMaintQuoteFrm.SetChargesProperties;
begin
  btnAddCharge.visible := not (Mode = qView);
  btnChgCharge.visible := not (Mode = qView);
  btnDelCharge.visible := not (Mode = qView);
  btnExcelCharge.visible := not (Mode = qView);
  btnBrowse.visible := not (Mode = qView);
  btnOpen.visible := not (Mode = qView);
  btnImport.visible := not (Mode = qView);
end;

procedure TPBMaintQuoteFrm.SetNotesProperties;
begin
  memSpec.enabled := not (Mode = qView);
end;

procedure TPBMaintQuoteFrm.SetDocsProperties;
begin
  btnAttach.visible := not (Mode = qView);
  btnWord.visible := not (Mode = qView);
  btnExcel.visible := not (Mode = qView);
  btnEmail.visible := not (Mode = qView);
end;

procedure TPBMaintQuoteFrm.SetSupplyProperties;
begin
  btnInsertSupply.visible := not (Mode = qView);
  btnDeleteSupply.visible := not (Mode = qView);
end;

procedure TPBMaintQuoteFrm.rdgTypeClick(Sender: TObject);
begin
  with (sender as TRadioGroup) do
    begin
      if Mode in [qAdd, qCopy] then
        begin
          lblCustomer.caption := items[itemindex];
          dblkpCustomerContact.Visible := (itemindex = 0) or bUseProspects;
          btnContact.Visible := (itemindex = 0) or bUseProspects;
          edtContactName.visible := (itemindex = 1) and not bUseProspects;
        end
      else
        begin
          lblCustomer.caption := items[itemindex];
          dblkpCustomerContact.Visible := (itemindex = 0) or ((itemindex = 1) and (Quote.adhoc = 0));
          btnContact.Visible := (itemindex = 0) or ((itemindex = 1) and (Quote.adhoc = 0));
          edtContactName.visible := (itemindex = 1) and (Quote.adhoc <> 0);
        end
    end;
  CheckOK(self);
end;

procedure TPBMaintQuoteFrm.btnAddSupplyClick(Sender: TObject);
begin
  CallMaintSupplies(qlAdd);
end;

procedure TPBMaintQuoteFrm.btnChangeSupplyClick(Sender: TObject);
begin
  CallMaintSupplies(qlChange);
end;

procedure TPBMaintQuoteFrm.sgSupplyDblClick(Sender: TObject);
begin
  if sgLines.cells[0,sgSupply.row] <> '' then
    btnChangeSupplyClick(self);

end;

procedure TPBMaintQuoteFrm.SpecificationChange(Sender: TObject);
var
  inx: integer;
begin
  inx := (Sender as TMemo).Tag;
  Quote.Departments[inx].Specification := (Sender as TMemo).Text;
end;

procedure TPBMaintQuoteFrm.sgLinesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssRight in Shift then
    sgLines.row := (Y div 19) + (sgLines.TopRow - 1);

  if X <= sgLines.DefaultColWidth then
    begin
      OldCursor := screen.cursor;
      screen.cursor := crMultiDrag;
    end;

end;

procedure TPBMaintQuoteFrm.sgLinesMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  screen.cursor := oldcursor;
end;

procedure TPBMaintQuoteFrm.sgLinesRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  inx, icount: integer;
  iLine: integer;
  NewSequence: integer;
  QuoteLine: TQuoteLine;
  NewQuoteLine: TQuoteLine;
begin
  inx := FromIndex;
  inx := Quote.Lines.IndexOfSequence(inx);
  NewQuoteLine := Quote.Lines[inx];

  NewQuoteLine.JustMoved := true;
  NewQuoteLine.Sequence := ToIndex;
  sgLines.Cells[0,ToIndex] := inttostr(NewQuoteLine.sequence);

  if FromIndex > ToIndex then
    begin
    NewSequence := ToIndex;

    for icount := 0 to pred(Quote.lines.count) do
      begin
        iLine := Quote.Lines[icount].QuoteLineNo;
//        inx := Quote.Lines.IndexOf(icount+1);
        inx := Quote.Lines.IndexOf(iLine);
        QuoteLine := Quote.Lines[inx];

        if QuoteLine.JustMoved then
          continue;

        if (QuoteLine.sequence < Toindex) or (QuoteLine.sequence > Fromindex) then
          continue
        else
          begin
            QuoteLine.sequence := QuoteLine.sequence + 1;
            sgLines.Cells[0,QuoteLine.sequence] := inttostr(QuoteLine.sequence);
          end;
      end;
    end
  else
    begin
    NewSequence := FromIndex;

    for icount := 0 to pred(Quote.lines.count) do
      begin
        iLine := Quote.Lines[icount].QuoteLineNo;
//        inx := Quote.Lines.IndexOf(icount+1);
        inx := Quote.Lines.IndexOf(iLine);
        QuoteLine := Quote.Lines[inx];

        if QuoteLine.JustMoved then
          continue;

        if (QuoteLine.sequence < Fromindex) or (QuoteLine.sequence > Toindex) then
          continue
        else
          begin
            QuoteLine.sequence := QuoteLine.sequence - 1;
            sgLines.Cells[0,QuoteLine.sequence] := inttostr(QuoteLine.sequence);
          end;
      end;
    end;
  sgLines.Row := ToIndex;
  NewQuoteLine.JustMoved := false;

end;

procedure TPBMaintQuoteFrm.bitbtnPriceUnitClearClick(Sender: TObject);
begin
  dblkpPriceUnit.KeyValue := 0;
  Quote.PriceUnit := dblkpPriceUnit.KeyValue;
  Quote.PriceUnitFactor := 0;
  labUnitSell.Caption := FloatToStrF(Quote.UnitSell, ffCurrency, 15, 3);
end;

procedure TPBMaintQuoteFrm.lstvwDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
  sPath := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(Quote.dbKey) + '\';
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

procedure TPBMaintQuoteFrm.btnExcelClick(Sender: TObject);
var
  compdir, docdir, jobBagDir, docExt, sPAth: string;
  sFullFile, sFileName: string;
  iLength, ipos, i: integer;
  okToSave, userCancelled, docsaved: boolean;
begin
  docDir := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(Quote.dbKey);
  compDir := dmBroker.GetCompanyQuoteDirectory;

  okToSave := false;
  userCancelled := false;
  docsaved := false;

  if (Sender as TToolButton) = btnWord then
  begin
    docExt := '.doc';
    svDlgOfficeDoc.Filter := 'Word Document(*.doc; *.docx)|*.doc; *.docx';
    svDlgOfficeDoc.FileName := 'New Document';
  end
  else if (Sender as TToolButton) = btnExcel then
  begin
    docExt := '.xls';
    svDlgOfficeDoc.Filter := 'Excel Worksheet(*.xls)|*.xls';
    svDlgOfficeDoc.FileName := 'New Book';
  end
  else
  begin
    exit; //go no further
  end;

  svDlgOfficeDoc.InitialDir := docDir;
  svDlgOfficeDoc.DefaultExt := copy(docExt, 2, 3);

  while (okToSave = false) and (userCancelled = false) do
    begin
      //prompt user for file name
      if svDlgOfficeDoc.execute then
      begin
        //is file in default directory
        if (copy(svDlgOfficeDoc.FileName, 1, length(docDir)) = docDir) then
        begin
          //does file exists
          if fileExists(svDlgOfficeDoc.FileName) then
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
          MessageDlg('You can''t save a document outside the Job Document Directory',
                                                mtError,[mbOK],0) ;
          svDlgOfficeDoc.FileName := '';
          svDlgOfficeDoc.InitialDir := docDir;
          okToSave := false;
        end;
      end
      else
      begin
        userCancelled := true;  //the user cancelled the save dialogue
      end;
    end;

  if (userCancelled = false) then
    begin
      sPath := copy(svDlgOfficeDoc.FileName, length(compdir)+1, length(svDlgOfficeDoc.FileName));

      {get file name}
      sfullFile := sPath;

      iLength := length(sFullFile);

      while i <> 0 do
        begin
          ipos := pos('\',sFullFile);
          sFullFile := stringreplace(sFullFile, '\', '!', []);

          i := pos('\',sFullFile);
        end;

      sFileName := copy(sPath, ipos+1, (iLength - ipos));

      if docExt = '.doc' then
      begin
        try
          PBWordOLEFrm := TPBWordOLEFrm.Create(self);
          PBWordOLEFrm.SaveAsDocument(compDir+sPath);
          docSaved := true;
        finally
          PBWordOLEFrm.Free;
        end;
      end
      else
      begin
        try
          PBExcelOLEFrm := TPBExcelOLEFrm.Create(self);
          PBExcelOLEFrm.SaveAsDocument(compDir+sPath);
          docSaved := true;
        finally
          PBExcelOLEFrm.Free;
        end;
      end;

      ShowDocuments(Quote.dbKey);

      if docSaved then
      begin
        lstvwDocuments.itemindex := -1;
        for i := 0 to pred(lstvwDocuments.Items.count) do
          begin
            if lstvwDocuments.Items[i].caption = sFileName then
              lstvwDocuments.itemindex := i;
          end;
        if lstvwDocuments.itemindex >= 0 then
          lstvwDocumentsDblClick(self);
      end;
    end
    else
    begin
    end;
end;

procedure TPBMaintQuoteFrm.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  PBMaintEmailFrm := TPBMaintEmailFrm.create(self);
  try
    PBMaintEmailFrm.Supplier := 0;
    PBMaintEmailFrm.SupplierBranch := 0;
    PBMaintEmailFrm.SupplierContact := 0;
    PBMaintEmailFrm.AddressType := 0;
    PBMaintEmailFrm.Customer := Quote.customer;
    PBMaintEmailFrm.CustomerBranch := 0;
    PBMaintEmailFrm.CustomerContact := 0;
    PBMaintEmailFrm.showmodal;
    if PBMaintEmailFrm.modalresult = idOK then
      begin
        sTo := PBMaintEmailFrm.edtEmail.text;
        sSubject := PBMaintEmailFrm.edtSubject.text;
        SendAndSaveEmail(sTo, sSubject);
      end;
  finally
    PBMaintEmailFrm.free;
  end;
end;

procedure TPBMaintQuoteFrm.btnAttachClick(Sender: TObject);
var
  i, ipos, ilength, icount: integer;
  sFile, sFullFile, docDir: string;
begin
  docDir := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(Quote.dbKey);
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

            i := 1;

            while i <> 0 do
              begin
                ipos := pos('\',sFullFile);

                sFullFile := stringreplace(sFullFile, '\', '!', []);

                i := pos('\',sFullFile);
              end;

            sFile := copy(DocOpenDialog.Files.Strings[icount], ipos+1, (iLength - ipos));

            FileCopy(DocOpenDialog.Files.Strings[icount], docDir + '\' + sfile) ;
          end;
        ShowDocuments(Quote.dbkey);
      end;
  end;
end;

procedure TPBMaintQuoteFrm.pmnuPasteClick(Sender: TObject);
var
  f: THandle;
  buffer: Array [0..MAX_PATH] of Char;
  i, numFiles: Integer;
  sFile, sFullFile, docdir: string;
  iCount, iPos, iLength: integer;
begin
  docDir := dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(Quote.dbkey);
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
  ShowDocuments(Quote.dbkey);
end;

procedure TPBMaintQuoteFrm.pmnuDeleteClick(Sender: TObject);
var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
begin
  sPath :=  dmBroker.GetCompanyQuoteDirectory + '\' + floattostr(Quote.dbkey) + '\';
  if (lstvwDocuments.selcount = 1) then
    begin
      iRow := lstvwDocuments.ItemIndex;
      if iRow = -1 then
        exit;
      if messagedlg('Delete the selected document?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          ListItem := lstvwDocuments.items[irow];
          sFileName := ListItem.caption;

          lstvwDocuments.Items.Delete(iRow);
          deletefile(sPath+sfileName);
        end
    end
  else
    begin
      for iRow := pred(lstvwDocuments.items.count) downto 0 do
        begin
          if lstvwDocuments.items[iRow].Selected then
            begin
              ListItem := lstvwDocuments.items[irow];
              sFileName := ListItem.caption;

              lstvwDocuments.Items.Delete(iRow);
              deletefile(sPath+sfileName);
            end;

        end;
    end;
end;

procedure TPBMaintQuoteFrm.pmnuSelectAllClick(Sender: TObject);
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

procedure TPBMaintQuoteFrm.lstvwDocumentsCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else
  if SortedColumn <> 0 then
    Compare := CompareText(Item1.SubItems[SortedColumn-1], Item2.SubItems[SortedColumn-1]);

  if Descending then
    Compare := -Compare;
end;

procedure TPBMaintQuoteFrm.lstvwDocumentsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> SortedColumn then
    begin
      SortedColumn := Column.Index;
      Descending := False;
    end
  else
    Descending := not Descending;

  TListView(Sender).SortType := stText;
end;

procedure TPBMaintQuoteFrm.btnExcelChargeClick(Sender: TObject);
begin
  {export the details to Excel}
  frmPBSendtoExcel := TfrmPBSendtoExcel.create(self);
  try
    frmPBSendtoExcel.ExportType := 'S';
    frmPBSendtoExcel.ExportStrGrid := sgLines;
    frmPBSendtoExcel.ExportFormCaption := 'Quote ' +  floattostr(Quote.dbKey) + ' - Charges';
    frmPBSendtoExcel.show;
  finally
    frmPBSendtoExcel.free;
  end;

end;

procedure TPBMaintQuoteFrm.btnSubRepsClick(Sender: TObject);
begin
  if rdgType.itemindex = 0 then
    begin
      PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
      try
        PBLUCRepFrm.bIs_Lookup := True;
        if dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator) then
          PBLUCRepFrm.bAllow_Upd := false
        else
          PBLUCRepFrm.bAllow_Upd := True;
        PBLUCRepFrm.bOnlyShowSubReps := True;

        PBLUCRepFrm.iCust := Quote.Customer;
        PBLUCRepFrm.iBranch := Quote.Branch;
        PBLUCRepFrm.sCustName := Quote.CustomerName;
        PBLUCRepFrm.sBranchName := Quote.BranchName;
        PBLUCRepFrm.SelCode := Quote.SubRep;
        PBLUCRepFrm.ShowModal;
        if PBLUCRepFrm.bselected then
        begin
          Quote.SubRep := PBLUCRepFrm.selcode;
          edtSubRep.Text := PBLUCRepFrm.SelName;
//        GetCustomerReps(PBLUCRepFrm.SelCode);
        end;
      finally
        PBLUCRepFrm.Free;
      end;
    end
  else
    begin
      PBLURepFrm := TPBLURepFrm.Create(Owner);
      try
        PBLURepFrm.bIs_Lookup := True;
        PBLURepFrm.bAllow_Upd := True;

        PBLURepFrm.chkbxIncludeSubReps.Checked := True;

        PBLURepFrm.SelCode := Quote.SubRep;
        PBLURepFrm.ShowModal;
        if PBLURepFrm.Selected then
        begin
          Quote.SubRep := PBLURepFrm.selcode;
          edtSubRep.Text := PBLURepFrm.SelName;
        end;
      finally
        PBLURepFrm.Free;
      end;
    end;
  CheckOK(self);
end;

procedure TPBMaintQuoteFrm.CheckForCustomerNotes;
begin
  if edtCustomer.text <> '' then
  begin
    PBLUCustFrm := TPBLUCustFrm.Create(Self);
    try
      PBLUCustFrm.SelCode := Quote.Customer;
      PBLUCustFrm.SelBranch := Quote.Branch;
      PBLUCustFrm.ShowCustomerData;
      if PBLUCustFrm.dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
        PBLUCustFrm.ShowNotes(self);
    finally
      PBLUCustFrm.Free;
    end;
  end;
end;

procedure TPBMaintQuoteFrm.btnEndUserClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.SelCode := Quote.EndUserCustomer;
    PBLUCustFrm.SelBranch := Quote.EndUserBranch;
    PBLUCustFrm.bEndUsers := true;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
      begin
        Quote.EndUserCustomer := PBLUCustFrm.SelCode;
        Quote.EndUserBranch := PBLUCustFrm.SelBranch;
        Quote.EndUserCustomerName := PBLUCustFrm.SelName;
        edtEndUser.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
      end;
  finally
    PBLUCustFrm.Free;
  end;
end;

end.
