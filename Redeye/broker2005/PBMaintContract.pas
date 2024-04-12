unit PBMaintContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, PBContractDM, ComCtrls, StdCtrls,
  DBCtrls, Buttons, ExtCtrls, DBGrids, Grids, ToolWin, ImgList, DB, ShellAPI, PBJobBagDM, pbOrdersdm, PBPOObjects,
  Clipbrd, ComObj, AxCtrls, taoMapi, ActiveX, Menus, DateUtils, IniFiles, Spin, pbSalesInvoiceDM, printers, pbJobsDM,
  System.ImageList, FireDAC.Stan.Param, DragDrop, DropTarget, DragDropFile, DropComboTarget;

type
  TPBMaintContractFrm = class(TForm)
    stsbrDetails: TStatusBar;
    pnlTop: TPanel;
    lblQuoteNo: TLabel;
    Label4: TLabel;
    lblAccountManager: TLabel;
    edtContract: TEdit;
    edtDate: TEdit;
    btnDate: TBitBtn;
    edtOfficeContact: TEdit;
    btnAccountManager: TButton;
    Panel2: TPanel;
    pnlBottom: TPanel;
    lblDeletePrompt: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pnlHeader: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TBitBtn;
    BitBtn4: TBitBtn;
    dblkpContact: TDBLookupComboBox;
    memQuantity: TMemo;
    btnRep: TBitBtn;
    edtRep: TEdit;
    pnlSubReps: TPanel;
    Label52: TLabel;
    edtSubRep: TEdit;
    btnSubRep: TBitBtn;
    pgDetails: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label3: TLabel;
    memMinVolume: TMemo;
    Label10: TLabel;
    dblkpDurationType: TDBLookupComboBox;
    Label11: TLabel;
    memNoticePeriod: TMemo;
    dblkpNoticeType: TDBLookupComboBox;
    Label12: TLabel;
    memTermPeriod: TMemo;
    dblkpTermType: TDBLookupComboBox;
    Label13: TLabel;
    dblkpPaymentTerms: TDBLookupComboBox;
    Label14: TLabel;
    memReviewPeriod: TMemo;
    dblkpReviewType: TDBLookupComboBox;
    btnTerms: TBitBtn;
    BitBtn1: TBitBtn;
    imgDocuments: TImageList;
    Panel6: TPanel;
    Panel7: TPanel;
    lblDocumentDir: TLabel;
    lstvwDocuments: TListView;
    ToolBar1: TToolBar;
    btnExcel: TToolButton;
    btnWord: TToolButton;
    btnEmail: TToolButton;
    btnAttach: TToolButton;
    imgIcons: TImageList;
    Panel1: TPanel;
    btnPOAdd: TBitBtn;
    btnPOChange: TBitBtn;
    btnPODelete: TBitBtn;
    btnPOExcel: TBitBtn;
    dbgJobDetails: TDBGrid;
    Panel3: TPanel;
    btnJobAdd: TBitBtn;
    btnJobChange: TBitBtn;
    btnJobDelete: TBitBtn;
    btnJobExcel: TBitBtn;
    btnJobRepeat: TBitBtn;
    btnJobInsert: TBitBtn;
    stsBrJobDetails: TStatusBar;
    lblGDPRSignedStatement: TLabel;
    pnlFooter: TPanel;
    btnNotes: TBitBtn;
    chkbxInactive: TCheckBox;
    FlashTimer: TTimer;
    edtDescription: TMemo;
    pmnuDocuments: TPopupMenu;
    CreateExcelDocument1: TMenuItem;
    CreateWordDocument1: TMenuItem;
    Email1: TMenuItem;
    Adddocument1: TMenuItem;
    MenuItem1: TMenuItem;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    MenuItem2: TMenuItem;
    pmnuSelectAll: TMenuItem;
    svDlgOfficeDoc: TSaveDialog;
    DocOpenDialog: TOpenDialog;
    dbgPODetails: TDBGrid;
    stsBrPODetails: TStatusBar;
    btnPORepeat: TBitBtn;
    Label5: TLabel;
    edtEffectiveDate: TEdit;
    BitBtn9: TBitBtn;
    Label7: TLabel;
    dblkpFrequencyType: TDBLookupComboBox;
    spnDuration: TSpinEdit;
    spnFrequency: TSpinEdit;
    btnSave: TBitBtn;
    TabSheet1: TTabSheet;
    dbgSalesInvoices: TDBGrid;
    Panel8: TPanel;
    btnViewSI: TBitBtn;
    btnRePrintSI: TBitBtn;
    Panel19: TPanel;
    Label42: TLabel;
    memTotalSI: TMemo;
    DropComboTarget1: TDropComboTarget;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAccountManagerClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure btnSubRepClick(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure memQuantityChange(Sender: TObject);
    procedure memQuantityEnter(Sender: TObject);
    procedure memQuantityExit(Sender: TObject);
    procedure memMinVolumeKeyPress(Sender: TObject; var Key: Char);
    procedure memMinVolumeChange(Sender: TObject);
    procedure memQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure memDurationChange(Sender: TObject);
    procedure memNoticePeriodChange(Sender: TObject);
    procedure memTermPeriodChange(Sender: TObject);
    procedure memReviewPeriodChange(Sender: TObject);
    procedure dblkpDurationTypeClick(Sender: TObject);
    procedure dblkpNoticeTypeClick(Sender: TObject);
    procedure dblkpTermTypeClick(Sender: TObject);
    procedure dblkpReviewTypeClick(Sender: TObject);
    procedure edtEffectiveDateExit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure dblkpPaymentTermsClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure btnTermsClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnJobAddClick(Sender: TObject);
    procedure btnJobChangeClick(Sender: TObject);
    procedure btnJobRepeatClick(Sender: TObject);
    procedure btnJobInsertClick(Sender: TObject);
    procedure dblkpContactClick(Sender: TObject);
    procedure btnJobDeleteClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure btnPOAddClick(Sender: TObject);
    procedure btnPOChangeClick(Sender: TObject);
    procedure btnPODeleteClick(Sender: TObject);
    procedure btnPORepeatClick(Sender: TObject);
    procedure memFrequencyChange(Sender: TObject);
    procedure dblkpFrequencyTypeClick(Sender: TObject);
    procedure spnDurationChange(Sender: TObject);
    procedure spnFrequencyChange(Sender: TObject);
    procedure btnJobExcelClick(Sender: TObject);
    procedure btnPOExcelClick(Sender: TObject);
    procedure btnNotesClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure dbgJobDetailsDblClick(Sender: TObject);
    procedure dbgPODetailsDblClick(Sender: TObject);
    procedure dbgSalesInvoicesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnViewSIClick(Sender: TObject);
    procedure btnRePrintSIClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
  private
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    procedure AddPOToContract(iJobBag: integer);
    procedure AddToContract(iJobBag: integer);
  private
    Descending: Boolean;
    SortedColumn: Integer;
    bNotesFlash: ByteBool;
    bOK: boolean;
    dtmdlCustJobs: TdtmdlJobs;
    dtmdlJobBag: TdmJobBag;
    dtmdlCustOrders: TdtmdlOrders;
    FActivated : Boolean;
    FEmailApplication: string;
    FMode: TConMode;
    FContract: TContract;
    sOldValue: string;
    procedure ProcessDragAndDrop(FilesList: TUnicodeStrings);
    function GetFilesPath: string;
    procedure SetMode(const Value: TConMode);
    procedure SetContract(const Value: TContract);
    procedure ShowDetails;
    procedure ShowJobBags;
    procedure ShowPurchaseOrders;
    procedure ShowNotes(iNotes: integer);
    procedure SetJobButtons(Sender: TObject; Field: TField);
    procedure SetPOButtons(Sender: TObject; Field: TField);
    procedure CallJobMaintScreen(aMode: TJBMode);
    procedure CallOrderMaintScreen(sTempFuncMode: Char);
    procedure CheckNotes(Sender: TObject);
    procedure CheckForCustomerNotes;
    procedure GetBranchContacts;
    procedure ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
    procedure SendAndSaveEmail(sTo, sSubject: string);
    procedure ShowDocuments(rContract: real);
    procedure ShowSalesInvoices;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  public
    property Mode: TConMode read FMode write SetMode;
    property Contract: TContract read FContract write SetContract;
  end;

var
  PBMaintContractFrm: TPBMaintContractFrm;

implementation

uses
  System.UITypes, System.Types,
  PBLUOps, pbMainMenu, PBLUCust, CCSCommon, PBDBMemo, PBLUCConta, PBDocObjects,
  PBLUCRep, pbDatabase, DateSelV5, PBLUPaymentTerms, PBMaintJobBag,
  PBLUContractCustomerJobs, PBImages, PBWordOLE, PBExcelOLE, PBMaintEmail,
  PBMaintPOrd, PBMaintPOrdInactive, PBSendtoExcel, PBMaintSalesInvoice, PBSalesInvrPrint;

{$R *.dfm}

{ TPBMaintContractFrm }

procedure TPBMaintContractFrm.SetContract(const Value: TContract);
begin
  FContract := Value;
end;

procedure TPBMaintContractFrm.SetMode(const Value: TConMode);
begin
  FMode := Value;
end;

procedure TPBMaintContractFrm.FormActivate(Sender: TObject);
var
  sTemp : string;
  bHasGDPRBeenSigned: boolean;
begin
  if not FActivated then
    begin
    if Mode = conAdd then
      Caption := 'Add contract details';
    if Mode = conChange then
      Caption := 'Change contract details ';
    if Mode = condelete then
      Caption := 'Delete contract details ';

    lblDocumentDir.Caption := lblDocumentDir.Caption + ' ' + dmBroker.GetCompanyContractDirectory;

    with Contract.DataModule.qryPeriodType do
      begin
        close;
        open;
      end;

    with Contract.DataModule.qryPaymentTerms do
      begin
        close;
        open;
      end;

    dblkpContact.listsource := Contract.DataModule.dtsContacts;
    dblkpFrequencyType.listsource := Contract.DataModule.dtsPeriodType;
    dblkpDurationType.listsource := Contract.DataModule.dtsPeriodType;
    dblkpNoticeType.listsource := Contract.DataModule.dtsPeriodType;
    dblkpTermType.listsource := Contract.DataModule.dtsPeriodType;
    dblkpReviewType.listsource := Contract.DataModule.dtsPeriodType;
    dblkpPaymentTerms.listsource := Contract.DataModule.dtsPaymentTerms;

    Contract.Datamodule.dtsJobBags.OnDataChange := SetJobButtons;
    Contract.Datamodule.dtsPurchaseOrders.OnDataChange := SetPOButtons;

    ShowDetails;
    ShowJobBags;
    ShowPurchaseOrders;
    ShowSalesInvoices;

    if (Mode = conRequote) then
//      ShowDocuments(OriginalQuoteFromReQuote)
    else
      ShowDocuments(Contract.ContractNumber);

    Checknotes(Self);
    CheckOK(Self);

    if dmBroker.UseGDPR and (lblGDPRSignedStatement.visible = false) then
      begin
        lblGDPRSignedStatement.visible := false;
        bHasGDPRBeenSigned := dmBroker.GetCustomerGDPRSigned(Contract.Customer);
        if not bHasGDPRBeenSigned and (Contract.Customer <> 0) then
        begin
          MessageDlg('The GDPR Policy has not been signed by this customer!!!', mtWarning,[mbOk], 0);
          lblGDPRSignedStatement.visible := true;
        end;
      end;

    if (Mode = conRequote) or (Mode = conCopy) or (Mode = conAdd) then
      begin
        self.CheckForCustomerNotes;
      end;

    lblDeletePrompt.Visible := (Mode = conDelete);
    pnlHeader.Enabled := (Mode <> conDelete);

    btnOK.Visible := not(Mode = conView);

    dmBroker.ScreenAccessControl(Self,'',frmPBMainMenu.iOperator,0,0) ;

    FActivated := true;
    end;
end;

procedure TPBMaintContractFrm.btnAccountManagerClick(Sender: TObject);
begin
  PBLUOpsFrm := TPBLUOpsFrm.create(self);
  try
    PBLUOpsFrm.bIs_Lookup := true;
    PBLUOpsFrm.bAllow_Upd := false;
    PBLUOpsFrm.showmodal;
    if PBLUOpsFrm.Selected then
      begin
        Contract.OfficeContact := PBLUOpsFrm.SelCode;
        edtOfficeContact.Text := PBLUOpsFrm.SelName;
      end;
  finally
    PBLUOpsFrm.free;
    checkOK(self);
  end;
end;

procedure TPBMaintContractFrm.ShowDetails;
begin
  if Mode = conAdd then
    begin
      edtContract.Text := '<New Contract>';
      edtDate.text := pbdatestr(now);
      edtCustomer.text := '';
      edtRep.Text := '';
      edtSubRep.Text := '';
      edtOfficeContact.text := '';
      edtDescription.Text := '';
      memQuantity.text := '';
      memMinVolume.text := '';

      edtEffectivedate.text := '';
      spnFrequency.value := 1;
      dblkpFrequencyType.keyvalue := 0;
      spnDuration.value := 1;
      dblkpDurationType.keyvalue := 0;
      memNoticePeriod.Text := '';
      dblkpNoticeType.keyvalue := 0;
      memTermPeriod.Text := '';
      dblkpTermType.keyvalue := 0;
      memReviewPeriod.Text := '';
      dblkpReviewType.keyvalue := 0;

      dblkpPaymentTerms.KeyValue := 0;
      chkbxInactive.checked := false;
    end
  else
    begin
      if Contract.dbkey = 0 then
        begin
          edtContract.text := '<New Contract>';
        end
      else
        begin
          edtContract.text := floatToStr(Contract.ContractNumber);
          dmBroker.CreateContractDocDirectory(floattostr(Contract.ContractNumber));
        end;

      edtDate.text := pbDateStr(Contract.Date);
      edtEffectivedate.text := pbDateStr(Contract.EffectiveDate);
      edtCustomer.text := Contract.CustomerName + '/' + Contract.BranchName;

      GetBranchContacts;
      dblkpContact.keyvalue := Contract.ContactNo;

      edtRep.Text := Contract.RepName;
      edtSubRep.Text := Contract.SubRepName;
      edtOfficeContact.text := Contract.OfficeContactName;
      edtDescription.Text := Contract.Description;

      memQuantity.text := inttostr(Contract.Quantity);
      memMinVolume.text := inttostr(Contract.MinimumQuantity);

      if Contract.Frequency = 0 then
        spnFrequency.value := 1
      else
        spnFrequency.value := Contract.Frequency;
      dblkpFrequencyType.keyvalue := Contract.FrequencyPeriodType;

      if Contract.Duration = 0 then
        spnDuration.value := 1
      else
        spnDuration.value := Contract.Duration;
      dblkpDurationType.keyvalue := Contract.DurationPeriodType;

      if Contract.TerminationNoticePeriod = 0 then
        memNoticePeriod.Text := '0'
      else
        memNoticePeriod.Text := inttostr(Contract.TerminationNoticePeriod);
      dblkpNoticeType.keyvalue := Contract.TerminationNoticePeriodType;

      if Contract.TermAfterInitialPeriod = 0 then
        memTermPeriod.Text := '0'
      else
        memTermPeriod.Text := inttostr(Contract.TermAfterInitialPeriod);
      dblkpTermType.keyvalue := Contract.TermAfterInitialPeriodType;

      if Contract.ReviewPeriod = 0 then
        memReviewPeriod.Text := '0'
      else
        memReviewPeriod.Text := inttostr(Contract.ReviewPeriod);
      dblkpReviewType.keyvalue := Contract.ReviewPeriodType;

      dblkpPaymentTerms.KeyValue := Contract.PaymentTerms;
      chkbxInactive.checked := (Contract.inactive = 'Y');
    end;
  btnSave.Visible := (Mode = conAdd) or (Mode = conCopy) or (Mode = conRequote);

  CheckOk(self);
end;

procedure TPBMaintContractFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  btnOK.enabled :=
        (Trim(edtDescription.Text) <> '') and
        (Trim(memQuantity.Text) <> '') and
        (Trim(dblkpDurationType.Text) <> '') and
        (Trim(dblkpFrequencyType.Text) <> '') and
        (Trim(edtCustomer.Text) <> '') and
        (Trim(edtEffectiveDate.Text) <> '') and
        (dblkpContact.text <> '') and
        (edtRep.text <> '') and
        (edtOfficeContact.Text <> '');
  btnSave.enabled := btnOK.enabled;
end;

procedure TPBMaintContractFrm.btnOKClick(Sender: TObject);
begin
  btnSaveClick(Self);
  if bOK then
    begin
      ModalResult := mrOK;
    end;
end;

procedure TPBMaintContractFrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustfrm := TPBLUCustfrm.Create(self);
  try
    PBLUCustfrm.bIs_Lookup := true;
    PBLUCustfrm.bSel_Branch := True;
    PBLUCustfrm.bAllow_upd := true;

    PBLUCustfrm.Selcode := Contract.Customer;
    PBLUCustfrm.SelBranch := Contract.Branch;

    PBLUCustfrm.SelName := Contract.CustomerName;
    PBLUCustfrm.SelBranchName := Contract.BranchName;

    PBLUCustFrm.ShowModal;
    if PBLUCustfrm.selected then
    begin
      Contract.Customer := PBLUCustfrm.Selcode;
      Contract.CustomerName := PBLUCustfrm.SelName;
      Contract.Branch := PBLUCustfrm.SelBranch;
      Contract.BranchName := PBLUCustfrm.SelBranchName;

      edtCustomer.text := Contract.CustomerName + '/' + Contract.BranchName;

      Contract.Rep := dmBroker.GetCustomerRep(Contract.customer,Contract.Branch);
      Contract.SubRep := dmBroker.GetCustomerSubRepCode(Contract.customer,Contract.Branch);
      edtRep.Text := dmBroker.GetRepName(Contract.Rep);
      edtSubRep.Text := dmBroker.GetRepName(Contract.SubRep);

      GetBranchContacts;

      Contract.PaymentTerms := dmBroker.GetcustomerPaymentTerms(Contract.Customer);
      dblkpPaymentTerms.KeyValue := Contract.PaymentTerms;

      CheckOK(self);
    end;
  finally
    PBLUCustfrm.Free;
  end;

end;

procedure TPBMaintContractFrm.GetBranchContacts;
var
  iNarrative: integer;
begin
  with Contract.DataModule.qryContacts do
    begin
      close;
      parambyname('Customer').asinteger := Contract.Customer;
      parambyname('Branch_no').asinteger := Contract.Branch;
      open;
      if recordcount = 1 then
        begin
          dblkpContact.keyvalue := fieldbyname('Contact_no').asinteger;
          Contract.ContactNo := dblkpContact.keyvalue;

          iNarrative := FieldByName('Narrative').AsInteger;

          if (iNarrative <> 0) and FActivated then
            ShowNotes(iNarrative);
        end
      else
        dblkpContact.keyvalue := Contract.ContactNo;
    end;
end;

function TPBMaintContractFrm.GetFilesPath: string;
var
  DocDir: string;
begin
  DocDir := dmBroker.GetCompanyContractDirectory;
  DocDir := IncludeTrailingPathDelimiter(DocDir) + floattostr(Contract.ContractNumber);

  Result := DocDir;
end;

procedure TPBMaintContractFrm.ShowNotes(iNotes: integer);
var
  PBLUDBMemoFrm: TPBDBMemoFrm;
begin
  PBLUDBMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBLUDBMemoFrm.bAllow_Upd := False;
    PBLUDBMemoFrm.LoadMemoData(iNotes);
    PBLUDBMemoFrm.ShowModal;
  finally
    PBLUDBMemoFrm.Free;
  end;
end;

procedure TPBMaintContractFrm.BitBtn4Click(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := true;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := Contract.Customer;
    PBLUCContaFrm.iBranch := Contract.Branch;
    if dblkpContact.keyvalue = null then
      PBLUCContaFrm.SelCode := 0
    else
      PBLUCContaFrm.SelCode := dblkpContact.keyvalue;
    PBLUCContaFrm.sCustName := Contract.CustomerName;
    PBLUCContaFrm.sBranchName := Contract.BranchName;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      GetBranchContacts;
      Contract.ContactNo := PBLUCContaFrm.SelCode;
    end;
  finally
    PBLUCContaFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintContractFrm.btnRepClick(Sender: TObject);
begin
  PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
  try
    PBLUCRepFrm.bIs_Lookup := True;
    if dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator) then
      PBLUCRepFrm.bAllow_Upd := false
    else
      PBLUCRepFrm.bAllow_Upd := True;

    PBLUCRepFrm.iCust := Contract.Customer;
    PBLUCRepFrm.iBranch := Contract.Branch;
    PBLUCRepFrm.sCustName := Contract.CustomerName;
    PBLUCRepFrm.sBranchName := Contract.BranchName;
    PBLUCRepFrm.SelCode := Contract.Rep;
    PBLUCRepFrm.ShowModal;
    if PBLUCRepFrm.bselected then
    begin
      Contract.Rep := PBLUCRepFrm.selcode;
      edtRep.Text := PBLUCRepFrm.SelName;
    end;
  finally
    PBLUCRepFrm.Free;
  end;
  CheckOK(self);

end;

procedure TPBMaintContractFrm.btnSubRepClick(Sender: TObject);
begin
  PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
  try
    PBLUCRepFrm.bIs_Lookup := True;
    if dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator) then
      PBLUCRepFrm.bAllow_Upd := false
    else
      PBLUCRepFrm.bAllow_Upd := True;
    PBLUCRepFrm.bOnlyShowSubReps := True;

    PBLUCRepFrm.iCust := Contract.Customer;
    PBLUCRepFrm.iBranch := Contract.Branch;
    PBLUCRepFrm.sCustName := Contract.CustomerName;
    PBLUCRepFrm.sBranchName := Contract.BranchName;
    PBLUCRepFrm.SelCode := Contract.SubRep;
    PBLUCRepFrm.ShowModal;
    if PBLUCRepFrm.bselected then
      begin
        Contract.SubRep := PBLUCRepFrm.selcode;
        edtSubRep.Text := PBLUCRepFrm.SelName;
      end;
  finally
    PBLUCRepFrm.Free;
  end;
end;

procedure TPBMaintContractFrm.btnDateClick(Sender: TObject);
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

procedure TPBMaintContractFrm.edtDateExit(Sender: TObject);
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

procedure TPBMaintContractFrm.memQuantityChange(Sender: TObject);
begin
  try
    Contract.Quantity := strtoint(memQuantity.text)
  except
    Contract.Quantity := 0;
  end;

  CheckOK(self);
end;

procedure TPBMaintContractFrm.memQuantityEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintContractFrm.memQuantityExit(Sender: TObject);
var
  TempStr: string;
begin
  if trim((Sender as TMemo).Text) = '' then exit;

  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintContractFrm.memMinVolumeKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintContractFrm.memMinVolumeChange(Sender: TObject);
begin
  try
    Contract.MinimumQuantity := strtoint(memMinVolume.text)
  except
    Contract.MinimumQuantity := 0;
  end;

  CheckOK(self);
end;

procedure TPBMaintContractFrm.memQuantityKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintContractFrm.memDurationChange(Sender: TObject);
begin
  try
    Contract.Duration := strtoint((Sender as TMemo).text)
  except
    Contract.Duration := 0;
  end;

  CheckOK(self);
end;

procedure TPBMaintContractFrm.memNoticePeriodChange(Sender: TObject);
begin
  try
    Contract.TerminationNoticePeriod := strtoint((Sender as TMemo).text)
  except
    Contract.TerminationNoticePeriod := 0;
  end;

  CheckOK(self);

end;

procedure TPBMaintContractFrm.memTermPeriodChange(Sender: TObject);
begin
  try
    Contract.TermAfterInitialPeriod := strtoint((Sender as TMemo).text)
  except
    Contract.TermAfterInitialPeriod := 0;
  end;

  CheckOK(self);

end;

procedure TPBMaintContractFrm.memReviewPeriodChange(Sender: TObject);
begin
  try
    Contract.ReviewPeriod := strtoint((Sender as TMemo).text)
  except
    Contract.ReviewPeriod := 0;
  end;

  CheckOK(self);
end;

procedure TPBMaintContractFrm.dblkpDurationTypeClick(Sender: TObject);
begin
  try
    Contract.DurationPeriodType := dblkpDurationType.KeyValue;
  except
    Contract.DurationPeriodType := 0;
  end;

  CheckOK(self);

end;

procedure TPBMaintContractFrm.dblkpNoticeTypeClick(Sender: TObject);
begin
  try
    Contract.TerminationNoticePeriodType := dblkpNoticeType.keyvalue;
  except
    Contract.TerminationNoticePeriodType := 0;
  end;

  CheckOK(self);

end;

procedure TPBMaintContractFrm.dblkpTermTypeClick(Sender: TObject);
begin
  try
    Contract.TermAfterInitialPeriodType := dblkpTermType.keyvalue;
  except
    Contract.TermAfterInitialPeriodType := 0;
  end;

  CheckOK(self);

end;

procedure TPBMaintContractFrm.DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint;
  var Effect: Integer);
var
  FilesList: TUnicodeStrings;
begin
  FilesList := DropComboTarget1.Files;
  ProcessDragAndDrop(FilesList);
end;

procedure TPBMaintContractFrm.dblkpReviewTypeClick(Sender: TObject);
begin
  try
    Contract.ReviewPeriodType := dblkpReviewType.keyvalue;
  except
    Contract.ReviewPeriodType := 0;
  end;

  CheckOK(self);

end;

procedure TPBMaintContractFrm.edtEffectiveDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtEffectiveDate.Text = '' then
    Exit;

  try
    NewDate := StrToDate(edtEffectiveDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtEffectiveDate.SetFocus;
      Exit;
    end;
  end;

  edtEffectiveDate.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintContractFrm.BitBtn9Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtEffectiveDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtEffectiveDate.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintContractFrm.dblkpPaymentTermsClick(Sender: TObject);
begin
  Contract.PaymentTerms := dblkpPaymentTerms.KeyValue;
end;

procedure TPBMaintContractFrm.edtDescriptionChange(Sender: TObject);
begin
  Contract.Description := (Sender as TMemo).text;
  CheckOK(Self);
end;

procedure TPBMaintContractFrm.btnTermsClick(Sender: TObject);
begin
  PBLUPaymentTermsFrm := TPBLUPaymentTermsFrm.Create(self) ;
  try
    PBLUPaymentTermsFrm.bIs_Lookup := False ;
    PBLUPaymentTermsFrm.bAllow_Upd := True ;
    PBLUPaymentTermsFrm.SelCode := dblkpPaymentTerms.keyvalue ;
    PBLUPaymentTermsFrm.ShowModal ;
  Finally;
    PBLUPaymentTermsFrm.Free ;
  end;

  with Contract.DataModule.qryPaymentTerms do
    begin
      close;
      open;
    end;
end;

procedure TPBMaintContractFrm.BitBtn1Click(Sender: TObject);
begin
  dblkpPaymentTerms.KeyValue := 0;
  Contract.PaymentTerms := 0;
end;

procedure TPBMaintContractFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  if Mode = conView then exit;


  TempWord := MessageDlg('Do you want to save these contract details?', mtConfirmation,
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

procedure TPBMaintContractFrm.ShowJobBags;
begin
  dbgJobDetails.DataSource := Contract.DataModule.dtsJobBags;
  with Contract.DataModule.qryJobBags do
    begin
      close;
      parambyname('Contract').asinteger := Contract.dbkey;
      open;
    end;
end;

procedure TPBMaintContractFrm.ShowSalesInvoices;
var
  rTotalSI: real;
begin
  dbgSalesInvoices.DataSource := Contract.DataModule.dtsSalesInvoices;
  with Contract.DataModule.qrySalesInvoices do
    begin
      close;
      parambyname('Contract').asinteger := Contract.dbkey;
      open;

      btnViewSI.enabled := not (recordcount = 0);
      btnRePrintSI.enabled := not (recordcount = 0);
    end;

  rTotalSI := Contract.DataModule.GetJobBagTotalSalesInvoiced(Contract.dbKey);
  memTotalSI.text := formatfloat('£#,###,##0.00',rTotalSI);
end;

procedure  TPBMaintContractFrm.SetJobButtons(Sender: TObject; Field: TField);
begin
  with Contract.Datamodule do
  begin
    btnJobInsert.enabled := (Mode <> conAdd);
    btnJobAdd.enabled := (Mode <> conAdd);
    btnJobChange.Enabled := HeaderJobCount > 0;
    btnJobRepeat.Enabled := HeaderJobCount > 0;
    btnJobDelete.Enabled := HeaderJobCount > 0;
    btnJobExcel.Enabled := HeaderJobCount > 0;

    stsBrJobDetails.panels[0].text := inttostr(HeaderJobCount) + ' records displayed';
  end;
end;

procedure  TPBMaintContractFrm.SetPOButtons(Sender: TObject; Field: TField);
begin
  with Contract.Datamodule do
  begin
    btnPOChange.Enabled := HeaderPOCount > 0;
    btnPORepeat.Enabled := HeaderPOCount > 0;
    btnPODelete.Enabled := HeaderPOCount > 0;
    btnPOExcel.Enabled := HeaderPOCount > 0;

    stsBrPODetails.panels[0].text := inttostr(HeaderPOCount) + ' records displayed';
  end;
end;

procedure TPBMaintContractFrm.CallJobMaintScreen(aMode: TJBMode);
var
  Key : integer;
  frm : TPBMaintJobBagFrm;
  aBag : TJobBag;
  OrigAccCtrlMenu: integer;
begin
  if (aMode = jbChange) and (dbgJobDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      if MessageDlg('This job bag has been cancelled, you cannot maintain the details - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
      aMode := jbView;
    end
  else
  if (aMode = jbChange) and (dbgJobDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status').asinteger >= 25) then
    begin
      if MessageDlg('This job bag has been ' +
        dbgJobDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring +
        ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
    end;

  OrigAccCtrlMenu := dmBroker.iAccCtrlMenu;
  dtmdlJobBag := TdmJobBag.Create(Self);

  if aMode = jbAdd then
    Key := 0
  else
    begin
  //    Key := dmContract.CurrentContract;  { Get it before we close dataset }
      Key := dbgJobDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;
    end;

  try
    aBag := TJobBag.Create(dtmdlJobBag);
    try
      aBag.DbKey := key;
      aBag.JBMode := aMode;
      aBag.LoadFromDB;
      Frm := TPBMaintJobBagFrm.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.JobBag := aBag;

        // if not in View mode, check is this record is locked, if not then lock it
        // 0  not locked
        // 1  locked but want to view
        // 2  locked and don't want to view
        if (dmBroker.iAccCtrlMenu <> 3) and (aMode = jbChange) then
          begin
            case dmBroker.LockRecord(inttostr(aBag.DbKey),'','','','','Job Bag',Frm.caption,frmPBMainMenu.Workstation,true) of
              0:;
              1: dmBroker.iAccCtrlMenu := 3;
              2: exit
            end
          end;

        Frm.ShowModal;
        if (Frm.ModalResult = mrok)
         then
          begin
            Key := aBag.DbKey;

            if (aMode = jbRepeat) or (aMode = jbAdd) then
              begin
                try
                  dtmdlCustJobs := TdtmdlJobs.create(self);

                  AddToContract(key);
                  AddPOToContract(key);
                finally
                  dtmdlCustJobs.free;
                end;
              end;

            ShowJobBags;
            dbgJobDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(Key)),[lopartialKey]) ;
          end;

      finally
        Frm.Free;
      end;
    finally
      dmBroker.UnlockRecord(inttostr(aBag.DbKey),'','','','','Job Bag',frmPBMainMenu.Workstation);
      aBag.Free;
    end;
  finally
    dtmdlJobBag.Free;
    dmBroker.iAccCtrlMenu := OrigAccCtrlMenu;
  end;
end;

procedure TPBMaintContractFrm.CallOrderMaintScreen(sTempFuncMode: Char);
var
  bCanChangeInvoicedOrders: boolean;
  bTempOK: Boolean;
  rTempSel: real;
  iPordHeadStatus: integer;
  SelCode: real;
  SelLine: integer;
begin
  {Determine if the Operator can change sales values after invoicing}
   bCanChangeInvoicedOrders := dmBroker.OperatorCanChangeInvoicedOrders(frmPBMainMenu.iOperator);

  {If adding order then set status to Order Created}
  if sTempFuncMode = 'A' then
    begin
      iPOrdHeadStatus := 10;
      SelCode := 0;
      SelLine := 0;
    end
  else
    begin
      SelCode := dbgPODetails.datasource.DataSet.FieldByName('Purchase_Order').asfloat;
      SelLine := 1;
      iPOrdHeadStatus := dbgPODetails.datasource.DataSet.FieldByName('Order_status').AsInteger;
    end
  {for the view, set the access level to view. Otherwise, give full access} ;
  If sTempFuncMode = 'V' then
    dmBroker.iAccCtrlMenu := 3;

  dtmdlCustOrders := TdtmdlOrders.create(self);

  try
  {Check whether the Purchase Order has been included in a invoice Period End}
  if dtmdlCustOrders.PeriodEndRun('PO',dbgPODetails.datasource.dataset.FieldByName('Purchase_order').Asfloat,selline) and
                        (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
    begin
    if MessageDlg('This order has been included in a Period end, the cost and sales values cannot be modified' +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
    sTempFuncMode := 'T';
    end
  else if ((iPOrdHeadStatus = 25) or (iPOrdHeadStatus = 30)) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) and (not bCanChangeInvoicedOrders) then
  begin
    if MessageDlg('This order has been invoiced, the sales values cannot be modified' +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
    sTempFuncMode := 'I';
  end
  else
  if (iPOrdHeadStatus >= 10) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) and
          (dbgPODetails.datasource.dataset.FieldByName('Authorised_by').asinteger <> 0) then
  begin
    if (dbgPODetails.datasource.dataset.FieldByName('Authorised_by').asinteger <> frmPBMainMenu.iOperator) then
      begin
        if MessageDlg('This order has been authorised, you cannot change the cost and sales values' +
          ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
          Exit;
      end;
  end
  else
  if (iPOrdHeadStatus > 10) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
  begin
    if MessageDlg('This order has been ' +
      dbgPODetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
  end;

  PBMaintPOrdfrm := TPBMaintPOrdfrm.Create(Self);
  try
    if (sTempFuncMode = 'A') or (sTempFuncMode = 'M') or (sTempFuncMode = 'P') then
      begin
        PBMaintPOrdfrm.myMaxOrderLimit := 0.00;
        PBMaintPOrdfrm.myOrderLimit := dmBroker.AuthorisedOrderLimit(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.mySellLimit := dmBroker.MinimumSalesValue(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.rOrderLimit := PBMaintPOrdfrm.myOrderLimit;
        PBMaintPOrdfrm.rSellLimit := PBMaintPOrdfrm.mySellLimit;
        PBMaintPOrdfrm.SellLimitType := dmBroker.MinimumSalesValueType(frmpbMainMenu.iOperator);
      end
    else
      begin
        PBMaintPOrdfrm.myMaxOrderLimit := dmBroker.AuthorisedMaxOrderLimit(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.myOrderLimit := dmBroker.AuthorisedOrderLimit(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.mySellLimit := dmBroker.MinimumSalesValue(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.rOrderLimit := dmBroker.AuthorisedOrderLimit(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.rSellLimit := dmBroker.MinimumSalesValue(frmpbMainMenu.iOperator);
        PBMaintPOrdfrm.SellLimitType := dmBroker.MinimumSalesValueType(frmpbMainMenu.iOperator);
      end;
    PBMaintPOrdFrm.bCanChangeInvoicedOrders := bCanChangeInvoicedOrders;
    PBMaintPOrdfrm.FuncMode := sTempFuncMode;
    PBMaintPOrdfrm.PurchaseOrderNo := SelCode;
    PurchaseOrder.POHeadStatus := iPOrdHeadStatus;
    PBMaintPOrdfrm.SetupDetails(Self);
    PBMaintPOrdfrm.ShowModal;
    bTempOK := PBMaintPOrdfrm.bOK;
    rTempSel := PurchaseOrder.PONumber;
  finally
    PBMaintPOrdfrm.Free;
  end;
  if bTempOK then
  begin
    ShowPurchaseOrders;
    if sTempFuncMode <> 'D' then
    begin
      dbgPODetails.datasource.DataSet.locate('Purchase_order', Variant(floattostr(rTempSel)),[lopartialKey]) ;
    end;
  end;
  finally
    dtmdlCustOrders.Free;
  end;
end;

procedure TPBMaintContractFrm.btnJobAddClick(Sender: TObject);
begin
  CallJobMaintScreen(jbAdd);
end;

procedure TPBMaintContractFrm.btnJobChangeClick(Sender: TObject);
begin
  CallJobMaintScreen(jbChange);
end;

procedure TPBMaintContractFrm.btnJobRepeatClick(Sender: TObject);
begin
  if dmBroker.GetCustomerStatus(dbgJobDetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Jobs cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  CallJobMaintScreen(jbRepeat);
end;

procedure TPBMaintContractFrm.btnJobInsertClick(Sender: TObject);
var
  Selected: boolean;
begin
  PBLUContractCustomerJobsFrm := TPBLUContractCustomerJobsFrm.Create(Self);
  try
    PBLUContractCustomerJobsFrm.Contract := Contract.dbKey;
    PBLUContractCustomerJobsFrm.Customer := Contract.Customer;
    PBLUContractCustomerJobsFrm.Branch := Contract.Branch;
    PBLUContractCustomerJobsFrm.CustomerName := Trim(Contract.CustomerName);
    PBLUContractCustomerJobsFrm.ShowModal;
    Selected := PBLUContractCustomerJobsFrm.Selected;
    if Selected then
      begin
        ShowJobBags;
        ShowPurchaseOrders;
      end;
  finally
    PBLUContractCustomerJobsFrm.Free;
  end;
end;

procedure TPBMaintContractFrm.dblkpContactClick(Sender: TObject);
begin
  Contract.ContactNo := dblkpContact.keyvalue;
  CheckOK(self);
end;

procedure TPBMaintContractFrm.btnJobDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected job bag from this contract?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with Contract.DataModule.qryDeleteJobBag do
        begin
          close;
          parambyname('Contract').asinteger := Contract.dbKey;
          parambyname('Job_Bag').asinteger := dbgJobDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;
          execsql;
        end;
      ShowJobBags;
    end;
end;

procedure TPBMaintContractFrm.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
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

procedure TPBMaintContractFrm.ShowDocuments(rContract: real);
var
  sPath: string;
begin
  sPath := dmBroker.GetCompanyContractDirectory + '\' + floattostr(rContract) + '\';
  // Assign a Imagelist to the ListView
  lstvwDocuments.Clear;
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
end;

procedure TPBMaintContractFrm.CheckNotes(Sender: TObject);
begin
  if trim(Contract.NarrativeText) <> '' then
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

procedure TPBMaintContractFrm.CheckForCustomerNotes;
begin
  if edtCustomer.text <> '' then
  begin
    PBLUCustFrm := TPBLUCustFrm.Create(Self);
    try
      PBLUCustFrm.SelCode := Contract.Customer;
      PBLUCustFrm.SelBranch := Contract.Branch;
      PBLUCustFrm.ShowCustomerData;
      if PBLUCustFrm.dbgDetails.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
        PBLUCustFrm.ShowNotes(self);
    finally
      PBLUCustFrm.Free;
    end;
  end;
end;

procedure TPBMaintContractFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    btnNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintContractFrm.btnExcelClick(Sender: TObject);
var
  compdir, docdir, ContractDir, docExt, sPAth: string;
  sFullFile, sFileName: string;
  iLength, ipos, i: integer;
  okToSave, userCancelled, docsaved: boolean;
begin
  docDir := GetFilesPath;
  compDir := dmBroker.GetCompanyContractDirectory;

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
          MessageDlg('You can''t save a document outside the Contract Document Directory',
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

      ShowDocuments(Contract.ContractNumber);

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

procedure TPBMaintContractFrm.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  PBMaintEmailFrm := TPBMaintEmailFrm.create(self);
  try
    PBMaintEmailFrm.Supplier := 0;
    PBMaintEmailFrm.SupplierBranch := 0;
    PBMaintEmailFrm.SupplierContact := 0;
    PBMaintEmailFrm.AddressType := 0;
    PBMaintEmailFrm.Customer := Contract.customer;
    PBMaintEmailFrm.CustomerBranch := Contract.Branch;
    PBMaintEmailFrm.CustomerContact := Contract.ContactNo;
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

procedure TPBMaintContractFrm.btnAttachClick(Sender: TObject);
var
  DocDir: string;
begin
  DocDir := GetFilesPath;

  {Find a document}
  CopyDocuments(DocOpenDialog, DocDir,
    procedure
    begin
      ShowDocuments(Contract.ContractNumber);
    end);
end;

procedure TPBMaintContractFrm.lstvwDocumentsColumnClick(Sender: TObject;
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

  if SortedColumn = 2 then
    TListView(Sender).SortType := stData
  else
    TListView(Sender).SortType := stText;

end;

procedure TPBMaintContractFrm.lstvwDocumentsCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
  dtDate1, dtDate2: TDateTime;
  sTest: string;
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else
  if SortedColumn = 2 then
    begin
      sTest := DateTimeToStr(now);
      dtDate1 := strtoDateTime(trim(Item1.SubItems[SortedColumn-1]));
      dtDate2 := strtoDateTime(trim(Item2.SubItems[SortedColumn-1]));

      Compare := CompareDateTime(dtDate1, dtDate2);
    end
  else
    Compare := CompareText(Item1.SubItems[SortedColumn-1], Item2.SubItems[SortedColumn-1]) ;

  if Descending then
    Compare := -Compare;
end;

procedure TPBMaintContractFrm.lstvwDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
  sPath := dmBroker.GetCompanyContractDirectory + '\' + floattostr(Contract.ContractNumber) + '\';
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

procedure TPBMaintContractFrm.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docdir, compdir, docExt: string;
  document: TDocument;
  inx: integer;
begin
  docDir := GetFilesPath;
  compDir := dmBroker.GetCompanyContractDirectory;

  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    FEmailApplication := IniFile.ReadString('Email', 'Application', 'None');
  finally
    IniFile.Free;
  end;

  sBody := '';
  sfilePath := docdir;
  okToSave := false;

  EmailAndSaveViaOutlook(sTo,sSubject,sBody,sFilePath,okToSave, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

  if okToSave then
    begin
      ShowDocuments(Contract.ContractNumber);
    end;
end;

procedure TPBMaintContractFrm.pmnuPasteClick(Sender: TObject);
var
  DocDir: string;
begin
  DocDir := GetFilesPath;

  {Find a document}
  CopyDocumentsFromClipboard(DocDir,
    procedure
    begin
      ShowDocuments(Contract.ContractNumber);
    end);
end;

procedure TPBMaintContractFrm.pmnuDeleteClick(Sender: TObject);
var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
begin
  sPath :=  dmBroker.GetCompanyContractDirectory + '\' + floattostr(Contract.ContractNumber) + '\';
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

procedure TPBMaintContractFrm.pmnuSelectAllClick(Sender: TObject);
var
  icount: integer;
begin
  with lstvwDocuments do
  begin
    Items.BeginUpdate;
    try
      for icount := 0 to pred(items.count) do
      begin
        items[icount].selected := true ;
      end;
    finally
      Items.EndUpdate;
    end;
  end;
end;

procedure TPBMaintContractFrm.ProcessDragAndDrop(FilesList: TUnicodeStrings);
var
  Path: string;
begin
  Path := GetFilesPath;
  MyWinControlSetData(FilesList, Path,
    procedure
    begin
      ShowDocuments(Contract.ContractNumber);
    end);
end;

procedure TPBMaintContractFrm.ShowPurchaseOrders;
begin
  dbgPODetails.DataSource := Contract.DataModule.dtsPurchaseOrders;
  with Contract.DataModule.qryPurchaseOrders do
    begin
      close;
      parambyname('Contract').asinteger := Contract.dbkey;
      open;
    end;
end;

procedure TPBMaintContractFrm.btnPOAddClick(Sender: TObject);
begin
  CallOrderMaintScreen('A');
end;

procedure TPBMaintContractFrm.btnPOChangeClick(Sender: TObject);
begin
  CallOrderMaintScreen('C');
end;

procedure TPBMaintContractFrm.btnPODeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected purchase order from this contract?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with Contract.DataModule.qryDeletePO do
        begin
          close;
          parambyname('Contract').asinteger := Contract.dbKey;
          parambyname('Purchase_Order').asinteger := dbgPODetails.DataSource.DataSet.fieldbyname('Purchase_Order').asinteger;
          execsql;
        end;
      ShowPurchaseOrders;
    end;
end;

procedure TPBMaintContractFrm.btnPORepeatClick(Sender: TObject);
var
  bAuthorised: boolean;
begin
  if dmBroker.GetCustomerStatus(dbgPODetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Orders cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  bAuthorised := not (dbgPODetails.datasource.dataset.fieldByName('Needs_Authorising').AsString = 'Y');
  if not bAuthorised then
    begin
      MessageDlg('This purchase order is unauthorised, please obtain the necessary authorisation before this order can be '
                  + 'processed any further', mterror, [mbOk], 0);
      exit;
    end;

  CallOrderMaintScreen('M');
end;

procedure TPBMaintContractFrm.memFrequencyChange(Sender: TObject);
begin
  try
    Contract.Frequency := strtoint((Sender as TMemo).text)
  except
    Contract.Frequency := 0;
  end;

  CheckOK(self);
end;

procedure TPBMaintContractFrm.dblkpFrequencyTypeClick(Sender: TObject);
begin
  try
    Contract.FrequencyPeriodType := dblkpFrequencyType.KeyValue;
  except
    Contract.FrequencyPeriodType := 0;
  end;

  CheckOK(self);

end;

procedure TPBMaintContractFrm.spnDurationChange(Sender: TObject);
begin
  Contract.Duration := (Sender as TspinEdit).value;
end;

procedure TPBMaintContractFrm.spnFrequencyChange(Sender: TObject);
begin
  Contract.Frequency := (Sender as TspinEdit).value;
end;

procedure TPBMaintContractFrm.btnJobExcelClick(Sender: TObject);
begin
  {export the details to Excel}
  frmPBSendtoExcel := TfrmPBSendtoExcel.create(self);
  try
    frmPBSendtoExcel.ExportDBGrid := dbgJobDetails;
    frmPBSendtoExcel.ExportFormCaption := 'Contract ' +  floattostr(Contract.ContractNumber) + ' - Job Bags';
    frmPBSendtoExcel.show;
  finally
    frmPBSendtoExcel.free;
  end;

end;

procedure TPBMaintContractFrm.btnPOExcelClick(Sender: TObject);
begin
  {export the details to Excel}
  frmPBSendtoExcel := TfrmPBSendtoExcel.create(self);
  try
    frmPBSendtoExcel.ExportDBGrid := dbgPODetails;
    frmPBSendtoExcel.ExportFormCaption := 'Contract ' +  floattostr(Contract.ContractNumber) + ' - Purchase Orders';
    frmPBSendtoExcel.show;
  finally
    frmPBSendtoExcel.free;
  end;
end;

procedure TPBMaintContractFrm.btnNotesClick(Sender: TObject);
var
  PBDBInvMemoFrm: TPBDBMemoFrm;
begin
  PBDBInvMemofrm := TPBDBMemoFrm.create(self);
  try
    if Mode = conView then
      PBDBInvMemoFrm.bAllow_Upd := false
    else
      PBDBInvMemoFrm.bAllow_Upd := true;

    PBDBInvMemoFrm.Datamemo.text := Contract.NarrativeText;
    PBDBInvMemoFrm.ShowModal;
    Contract.Narrativetext := PBDBInvMemofrm.Datamemo.text;
  finally
    PBDBInvMemofrm.free;
  end;
  checknotes(Self);
end;

procedure TPBMaintContractFrm.btnSaveClick(Sender: TObject);
begin
  bOK := false;
  if dblkpDurationType.Text = '' then
    begin
      messagedlg('The Duration Period must be selected', mtError,[mbOk], 0);
      dblkpDurationType.setfocus;
      exit;
    end;

  if dblkpFrequencyType.Text = '' then
    begin
      messagedlg('The Frequency Period must be selected', mtError,[mbOk], 0);
      dblkpFrequencyType.setfocus;
      exit;
    end;

  if Mode = conDelete then
    begin
      if messagedlg('Are you sure you want to delete this contract?', mtConfirmation, [mbYes, mbNo], 1) = mrYes then
        begin
          Contract.DeleteFromDB;
          bOK := true;
          exit;
        end
      else
        exit;
    end
  else
    begin
      Contract.OfficeContactName := edtOfficeContact.Text;
      Contract.RepName := edtRep.Text;
      Contract.SubRepName := edtSubRep.Text;

      Contract.EffectiveDate := PBDateStr(edtEffectiveDate.Text);

      Contract.Duration := spnDuration.Value;
      Contract.Frequency := spnFrequency.Value;

      Contract.Date := PBDateStr(edtDate.Text);
      Contract.SaveToDB(true);

      bOK := true;
      if (Mode = conAdd) or (Mode = conCopy) or (Mode = conRequote)  then
        begin
          Contract.Status := 10;
          messagedlg('Contract number '+ floattostr(Contract.ContractNumber)+ ' created', mtInformation, [mbOk], 0);

          Mode := conChange;
          FActivated := false;
          FormActivate(Self);
        end;
    end;

end;

procedure TPBMaintContractFrm.Panel3Click(Sender: TObject);
begin
  if Contract.dbkey = 0 then
    begin
      MessageDlg('Please save the contract details before adding any jobs or orders', mtInformation, [mbOk], 0);
      exit;
    end;

end;

procedure TPBMaintContractFrm.Panel1Click(Sender: TObject);
begin
  if Contract.dbkey = 0 then
    begin
      MessageDlg('Please save the contract details before adding any jobs or orders', mtInformation, [mbOk], 0);
      exit;
    end;

end;

procedure TPBMaintContractFrm.dbgJobDetailsDblClick(Sender: TObject);
begin
  if btnJobChange.Enabled then
    btnJobChangeClick(self);
end;

procedure TPBMaintContractFrm.dbgPODetailsDblClick(Sender: TObject);
begin
  if btnPOChange.Enabled then
    btnPOChangeClick(self);
end;

procedure TPBMaintContractFrm.dbgSalesInvoicesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgSalesInvoices.datasource.dataset.fieldbyname('Invoice_or_credit').asstring = 'C') then
    begin
      (Sender as TDBGrid).Canvas.font.Color := clRed;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'Total') and
      (Column.Title.Caption <> 'Goods') and
      (Column.Title.Caption <> 'Vat') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
     end
  else
  	begin
      WITH Sender AS TDBGrid DO
        BEGIN
          if (Column.Title.Caption <> 'Goods') and
             (Column.Title.Caption <> 'Total') and
             (Column.Title.Caption <> 'Vat') then
              begin
                Canvas.Brush.Color := Color;
                Canvas.Font.Color  := Font.Color;
                Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2, Column.field.asstring);
                (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
              end;
        END;
			{Display the Columns Right justified in the cells}
      if Assigned(Column.Field) then
      begin
        if  (Column.Title.Caption = 'Goods') or
            (Column.Title.Caption = 'Total') or
            (Column.Title.Caption = 'Vat') then
        begin
          TNumericField(Column.Field).DisplayFormat := '£#,###,##0.00';
        end;

        Column.Alignment := taRightJustify;
      end;
    end;
end;

procedure TPBMaintContractFrm.btnViewSIClick(Sender: TObject);
var
  Key : integer;
  frm : TPBMaintSalesInvoicefrm;
  aInvoice : TSalesInvoice;
  dmJBSalesInvoice: TdmSalesInvoice;
begin
  Key := dbgSalesInvoices.DataSource.DataSet.fieldbyname('Sales_Invoice').asinteger;
  if MessageDlg('You only have access to view the selected invoice, continue?', mtConfirmation,
    [mbOk,mbCancel], 0) = mrCancel then exit;

  dmJBSalesInvoice := TdmSalesInvoice.create(self);
  try
  aInvoice := TSalesInvoice.Create(dmJBSalesInvoice);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TPBMaintSalesInvoicefrm.Create(Self);
      try
        Frm.Mode := siView;
        Frm.SalesInvoice := aInvoice;
        Frm.ShowModal;
        Key := aInvoice.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aInvoice.Free;
    end;
  finally
    dmJBSalesInvoice.free;
  end;
end;

procedure TPBMaintContractFrm.btnRePrintSIClick(Sender: TObject);
var
  key: string;
begin
  key := dbgSalesInvoices.datasource.dataset.fieldbyname('Sales_invoice_no').asstring;

  PBSalesInvrPrintFrm := TPBSalesInvrPrintFrm.Create(Self);
  try
    PBSalesInvRPrintFrm.selectionMemo.Text := Key;
    PBSalesInvrPrintFrm.InvoicePrint := true;
    PBSalesInvrPrintFrm.ShowModal;
  finally
    DefaultPrinter := Printer.Printers[Printer.Printerindex];
    DefaultBin := GetBinSelection;
    PBSalesInvrPrintFrm.Free;
  end;
end;

procedure TPBMaintContractFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBMaintContractFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TPBMaintContractFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintContractFrm.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
  CCSCommon.LoadFormLayout(TfrmpbMainMenu.AppIniFile, self);
end;

procedure TPBMaintContractFrm.AddToContract(iJobBag: integer);
begin
  with dtmdlCustJobs.qryAddToContract do
    begin
      close;
      parambyname('Contract').asinteger := Contract.dbkey;
      parambyname('Job_Bag').asinteger := iJobBag;
      execsql;
    end;
end;

procedure TPBMaintContractFrm.AddPOToContract(iJobBag: integer);
begin
  with dtmdlCustJobs.qryGetJobBagPOs do
    begin
      close;
      parambyname('Contract').asinteger := Contract.dbkey;
      parambyname('Job_Bag').asinteger := iJobBag;
      open;

      if recordcount > 0 then
        begin
          first;
          while eof <> true do
            begin
              dtmdlCustJobs.qryAddPOtoContract.close;
              dtmdlCustJobs.qryAddPOtoContract.parambyname('Contract').asinteger := Contract.dbkey;
              dtmdlCustJobs.qryAddPOtoContract.parambyname('Purchase_Order').asfloat := dtmdlCustJobs.qryGetJobBagPOs.fieldbyname('Purchase_Order').asfloat;
              dtmdlCustJobs.qryAddPOtoContract.execsql;
              next;
            end;
        end;
    end;
end;

end.
