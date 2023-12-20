unit WTMaintCustomer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Mask, ComCtrls, Grids, DBGrids, DB, ExtCtrls, wtCustomerDM, Variants, WTQuotesDM, WTJobsDM, WTSalesOrderDM,
  WTSalesInvoiceDM, ImgList, ShellAPI, ToolWin, Inifiles,
  Activex, AxCtrls, Clipbrd, ComObj, Menus, taoMAPI,
  CRControls, System.ImageList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWtMaintCustomer = class(TForm)
    dtsOneCustomer: TDataSource;
    qryCompany: TFDQuery;
    Panel1: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    pgDetails: TPageControl;
    tsGeneral: TTabSheet;
    tsShowrooms: TTabSheet;
    dbgBranches: TDBGrid;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblDiscountRate: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    SpeedButton3: TSpeedButton;
    Label17: TLabel;
    dblkpCustomerType: TDBLookupComboBox;
    dblkpVat: TDBLookupComboBox;
    dblkpCreditStatus: TDBLookupComboBox;
    chkbxOnline: TCheckBox;
    dblkpRep: TDBLookupComboBox;
    tbsQuotes: TTabSheet;
    tbsSOrders: TTabSheet;
    tbsJobs: TTabSheet;
    tbsInvoices: TTabSheet;
    Panel2: TPanel;
    dbgQuotes: TDBGrid;
    btnChangeQ: TBitBtn;
    btnDeleteQ: TBitBtn;
    btnAddQ: TBitBtn;
    tbsActivity: TTabSheet;
    Panel3: TPanel;
    btnChangeEv: TBitBtn;
    btnDeleteEv: TBitBtn;
    btnAddEv: TBitBtn;
    dbgEvents: TDBGrid;
    stsbrDetails: TStatusBar;
    Panel4: TPanel;
    Label19: TLabel;
    edtQuoteDesc: TEdit;
    tmrDetails: TTimer;
    dbgSOrders: TDBGrid;
    Panel5: TPanel;
    btnChangeSO: TBitBtn;
    btnDeleteSO: TBitBtn;
    btnAddSO: TBitBtn;
    Panel6: TPanel;
    Label20: TLabel;
    edtSOrderDesc: TEdit;
    Panel7: TPanel;
    btnChangeJob: TBitBtn;
    btnDeleteJob: TBitBtn;
    btnAddJob: TBitBtn;
    Panel8: TPanel;
    Label21: TLabel;
    edtJobDesc: TEdit;
    dbgJobs: TDBGrid;
    dbgInvoices: TDBGrid;
    Panel9: TPanel;
    btnPrintInv: TBitBtn;
    btnViewInv: TBitBtn;
    Panel10: TPanel;
    Label22: TLabel;
    edtInvoiceDesc: TEdit;
    btnPrintQ: TBitBtn;
    btnCopyQ: TBitBtn;
    BitBtn1: TBitBtn;
    chkbxInactive: TCheckBox;
    Label23: TLabel;
    GroupBox1: TGroupBox;
    dblkpProspectAction: TDBLookupComboBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dblkpProspectContact: TDBLookupComboBox;
    Label27: TLabel;
    dblkpProspectOperator: TDBLookupComboBox;
    edtActionDate: TEdit;
    btnActionDate: TBitBtn;
    SpeedButton4: TSpeedButton;
    chkbxProspect: TCheckBox;
    Label28: TLabel;
    dblkpProspectStatus: TDBLookupComboBox;
    Label29: TLabel;
    DBText2: TDBText;
    SpeedButton5: TSpeedButton;
    BitBtn3: TBitBtn;
    tbsDocuments: TTabSheet;
    Panel11: TPanel;
    lstvwDocuments: TListView;
    Panel12: TPanel;
    Label44: TLabel;
    imgDocuments: TImageList;
    ToolBar1: TToolBar;
    btnExcel: TToolButton;
    btnWord: TToolButton;
    btnEmail: TToolButton;
    btnAttach: TToolButton;
    imgIcons: TImageList;
    DocOpenDialog: TOpenDialog;
    svDlgOfficeDoc: TSaveDialog;
    Label18: TLabel;
    dblkpPaymentTerms: TDBLookupComboBox;
    SpeedButton6: TSpeedButton;
    Label30: TLabel;
    Label11: TLabel;
    cmbCustomerCategory: TComboBox;
    NotesBitBtn: TBitBtn;
    tmrNotes: TTimer;
    qryUpdNotesOnly: TFDQuery;
    TabSheet1: TTabSheet;
    Panel14: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    lblTemplatingDiscount: TLabel;
    lblFittingDiscount: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Panel16: TPanel;
    chkbxSpeculative: TCheckBox;
    btnClearGroup: TSpeedButton;
    chkbxFactored: TCheckBox;
    Label35: TLabel;
    dblkpLevelofImportance: TDBLookupComboBox;
    SpeedButton7: TSpeedButton;
    chkbxShowLabourCharges: TCheckBox;
    chkbxUseforGeneralQuoting: TCheckBox;
    pmnuDocuments: TPopupMenu;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    N2: TMenuItem;
    pmnuSelectAll: TMenuItem;
    Label36: TLabel;
    qryOneCustomer: TFDQuery;
    edtCustomerName: TEdit;
    edtStreet: TEdit;
    edtLocale: TEdit;
    edtTownCity: TEdit;
    edtPostcode: TEdit;
    edtCountyState: TEdit;
    edtTelephoneNumber: TEdit;
    edtFaxNumber: TEdit;
    edtEmailAddress: TEdit;
    edtWebAddress: TEdit;
    edtDiscountRate: TCREditFloat;
    edtDepositTerms: TCREditFloat;
    edtAccountCode: TEdit;
    edtCreditLimit: TCREditMoney;
    edtInvoiceLabel: TEdit;
    edtNoOfEmployees: TCREditInt;
    edtEndUserMarkup: TCREditFloat;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryDelete: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    edtCutoutDiscount: TCREditFloat;
    edtEdgeDiscount: TCREditFloat;
    edtWorktopDiscount: TCREditFloat;
    edtSurveyPrice: TCREditMoney;
    edtInstallationPrice: TCREditMoney;
    edtDeliveryPrice: TCREditMoney;
    dbgAccountCodes: TDBGrid;
    qryGetAccountCodes: TFDQuery;
    qryCheckCustAccExists: TFDQuery;
    dtsGetAccountCodes: TDataSource;
    cmbbxEndUserPriceFactor: TComboBox;
    Label37: TLabel;
    Label38: TLabel;
    edtUnitCost: TCREditMoney;
    Panel13: TPanel;
    Panel15: TPanel;
    pnlMaterialTypeFunctions: TPanel;
    btnMTAdd: TBitBtn;
    btnMTChange: TBitBtn;
    btnMTDelete: TBitBtn;
    dbgMaterialTypes: TDBGrid;
    pnlMaterialTypeFooter: TPanel;
    chkbxShowInactiveMaterialTypes: TCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tblOneCustomerNewRecord(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgBranchesDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddEvClick(Sender: TObject);
    procedure btnChangeEvClick(Sender: TObject);
    procedure btnDeleteEvClick(Sender: TObject);
    procedure tmrDetailsTimer(Sender: TObject);
    procedure edtQuoteDescChange(Sender: TObject);
    procedure dbgEventsDblClick(Sender: TObject);
    procedure btnAddQClick(Sender: TObject);
    procedure btnChangeQClick(Sender: TObject);
    procedure dbgQuotesDblClick(Sender: TObject);
    procedure tbsSOrdersShow(Sender: TObject);
    procedure edtSOrderDescChange(Sender: TObject);
    procedure btnAddSOClick(Sender: TObject);
    procedure btnChangeSOClick(Sender: TObject);
    procedure dbgSOrdersDblClick(Sender: TObject);
    procedure edtJobDescChange(Sender: TObject);
    procedure tbsJobsShow(Sender: TObject);
    procedure dbgJobsDblClick(Sender: TObject);
    procedure btnAddJobClick(Sender: TObject);
    procedure btnChangeJobClick(Sender: TObject);
    procedure btnDeleteJobClick(Sender: TObject);
    procedure tbsInvoicesShow(Sender: TObject);
    procedure btnPrintQClick(Sender: TObject);
    procedure btnCopyQClick(Sender: TObject);
    procedure btnDeleteQClick(Sender: TObject);
    procedure btnDeleteSOClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtActionDateExit(Sender: TObject);
    procedure btnActionDateClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnPrintInvClick(Sender: TObject);
    procedure btnViewInvClick(Sender: TObject);
    procedure dbgInvoicesDblClick(Sender: TObject);
    procedure edtInvoiceDescChange(Sender: TObject);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure btnWordClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure mnuOpenDocumentClick(Sender: TObject);
    procedure mnuDeleteDocumentClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure cmbCustomerCategoryChange(Sender: TObject);
    procedure tmrNotesTimer(Sender: TObject);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure cmbTemplatingDisctypeChange(Sender: TObject);
    procedure cmbFittingDiscTypeChange(Sender: TObject);
    procedure btnAddWorktopGroupClick(Sender: TObject);
    procedure btnClearGroupClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure pmnuDocumentsPopup(Sender: TObject);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure edtAccountCodeEnter(Sender: TObject);
    procedure edtAccountCodeChange(Sender: TObject);
    procedure edtAccountCodeExit(Sender: TObject);
    procedure dbgMaterialTypesDblClick(Sender: TObject);
    procedure btnMTAddClick(Sender: TObject);
    procedure btnMTChangeClick(Sender: TObject);
    procedure btnMTDeleteClick(Sender: TObject);
    procedure dbgMaterialTypesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure chkbxShowInactiveMaterialTypesClick(Sender: TObject);
  private
    Descending: Boolean;
    SortedColumn: Integer;
    bNotesFlash: boolean;
    bOK: boolean;
    sOldValue: string;
    FFunctionMode: string;
    FCustomer: integer;
    FDefaultCustomerCategory: integer;
    FGroup: integer;
    FGroupDescription: string;
    FMaterialType: integer;
    FGroupInactive: boolean;
    procedure SetFunctionMode(const Value: string);
    procedure ShowDetails;
    procedure SetCustomer(const Value: integer);
    procedure CallMaintBranches(FuncMode: string);
    procedure ShowBranches;
    procedure RefreshInvoices;
    procedure RefreshJobs;
    procedure RefreshQuotes;
    procedure RefreshSOrders;
    procedure ShowEvents;
    procedure CallMaintWorktopGroup(sTempFuncMode: string);
    procedure CallMaintEventScreen(sTempFuncMode: string);
    procedure CallQuoteMaint(aMode: TqMode);
    procedure CallSOrderMaint(aMode: TsopMode);
    procedure CallJobMaint(aMode: TjMode);
    procedure ConvertToSalesOrder;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure GetContacts;
    procedure CallSInvoiceMaint(aMode: TsiMode);
    procedure ShowDocuments;
    procedure ShowListViewDocuments(strPath: string; ListView: TListView;
      ImageList: TImageList);
    procedure SendAndSaveEmail(sTo, sSubject: string);
    procedure SetDefaultCustomerCategory(const Value: integer);
    procedure CheckNotes(Sender: TObject);
    procedure SetGroup(const Value: integer);
    procedure SetGroupDescription(const Value: string);
    procedure SetMaterialType(const Value: integer);
    procedure SetGroupInactive(const Value: boolean);
    procedure ParseMessage(const AFileName: string; var ATo, AFrom,
      ASubject, ADate, ABody: string);
    function FormatDateasDateTime(sDate: string): TDateTime;
    function ParseDocumentFrom(tmpFrom: string): string;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    procedure CallMaintMaterialTypes(FuncMode: string);
    procedure ShowMaterialTypes;
  public
    procedure ConvertAddressToCustomer;
    procedure GetAddress(iAddress: integer);
    procedure GetRecord(Key: integer);
    property Customer: integer read FCustomer write SetCustomer;
    property DefaultCustomerCategory: integer read FDefaultCustomerCategory write SetDefaultCustomerCategory;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property Group: integer read FGroup write SetGroup;
    property GroupDescription: string read FGroupDescription write SetGroupDescription;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property GroupInactive: boolean read FGroupInactive write SetGroupInactive;
  end;

var
  frmWtMaintCustomer: TfrmWtMaintCustomer;
  dtmdlOneCustomer: TdtmdlCustomers;

implementation

uses
  System.UITypes, System.Types,
  wtLUCustType, wtLUVat, wtLUReps, wtMain, WTMaintBranch,
  wtDataModule, AllCommon, WTMaintContactEvents, WTEventsDM,
  WtMaintQuote, WtMaintSalesOrder, WtMaintJob, wtRSQuote, DateSelV5,
  wtLUProspectAction, wtMaintCustomerConts, WTSrchCustContacts, WTDBMemo,
  WTMaintContApp, WtMaintSalesInvoice, WTRSSalesInvoiceReprint,
  WTMaintEmail, WTWordOLE, WTExcelOLE, WTLUPaymentTerms, AllImages,
  WTMaintCustWorkGroup, wtLULevelofImportance, WTMaintCustMaterialType;

{$R *.DFM}

{ TForm1 }

procedure TfrmWtMaintCustomer.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
  lblDelete.Visible := false;
  if (Value = 'A') or (Value = 'S') then
    begin
//    chkbxinactive.checked := false;
//    tsShowrooms.tabvisible := false;
//    tblOneCustomer.Insert;
    end
  else
  if Value = 'C' then
    begin
//    tblOneCustomer.edit;
    end
  else
  if FunctionMode = 'D' then
    begin
      pnldetails.enabled := false;
      lblDelete.Visible := true;
    end;
end;

procedure TfrmWtMaintCustomer.btnOKClick(Sender: TObject);
begin
  bOK := true;

  if FunctionMode <> 'D' then
    begin
      SaveToDB;
    end;

  if (FunctionMode = 'A') or (FunctionMode = 'S') then
    dtmdlWorktops.CreateCustomerDocDirectory(edtCustomerName.text);

end;

procedure TfrmWtMaintCustomer.GetRecord(Key: integer);
begin
  qryOneCustomer.Close;
  qryOneCustomer.parambyname('Customer').asinteger := key;
  qryOneCustomer.Open;

(*  tblOneCustomer.Active := false;
  tblOneCustomer.Filter := 'Customer = ' + inttostr(Key);
  tblOneCustomer.Active := true;
*)
  Customer := key;
end;

procedure TfrmWtMaintCustomer.GetAddress(iAddress: integer);
begin
  with dtmdlOneCustomer.qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := iAddress;
      open;
    end;
end;

procedure TfrmWtMaintCustomer.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWtMaintCustomer.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtCustomerName.Text <> '') and
                    (edtStreet.text <> '') and
                    (edtPostcode.text <> '') and
                    (edtTelephoneNumber.text <> '') and
                    (edtDiscountRate.text <> '') and
                    (cmbCustomerCategory.text <> '') and
                    (dblkpCustomerType.keyvalue <> 0) and
                    (dblkpRep.keyvalue <> 0) and
                    (dblkpvat.keyvalue <> 0);
end;

procedure TfrmWtMaintCustomer.FormShow(Sender: TObject);
begin
  if FunctionMode <> 'D' then
    edtCustomerName.setfocus;
end;

procedure TfrmWtMaintCustomer.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  dtmdlEvents := TdtmdlEvents.create(self);
  dbgEvents.DataSource := dtmdlEvents.dtsEvents;

  dtmdlOneCustomer := TdtmdlCustomers.create(application);

  {Create the memo form}
  frmWTDBMemo := TfrmWTDBMemo.Create(Self);
  frmWTDBMemo.bAllow_Upd := True;

  pgDetails.ActivePageIndex := 0;
//  pgdetails.Pages[2].TabVisible := false;
  pgdetails.Pages[3].TabVisible := pgdetails.Pages[2].TabVisible;
  pgdetails.Pages[4].TabVisible := pgdetails.Pages[2].TabVisible;
  pgdetails.Pages[5].TabVisible := pgdetails.Pages[2].TabVisible;
  pgdetails.Pages[6].TabVisible := pgdetails.Pages[2].TabVisible;

  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWtMaintCustomer.ShowDetails;
begin
  dtmdlOneCustomer.lkpCreditStatus.Close;
  dtmdlOneCustomer.lkpCreditStatus.open;

  dtmdlOneCustomer.qryProspectStatus.Close;
  dtmdlOneCustomer.qryProspectStatus.open;

  if (FunctionMode = 'A') or (FunctionMode = 'S') then
    begin
      edtCustomerName.Text := '';
      edtStreet.Text := '';
      edtLocale.Text := '';
      edtTownCity.Text := '';
      edtPostcode.Text := '';

      edtCountyState.Text := '';
      edtTelephoneNumber.Text := '';
      edtFaxNumber.Text := '';
      edtWebAddress.Text := '';
      edtEmailAddress.Text := '';

      dblkpRep.KeyValue := 0;
      cmbCustomerCategory.itemindex := self.DefaultCustomerCategory;

      {Load speculative address details to customer address details!}
      if FunctionMode = 'S' then
        begin
          self.ConvertAddressToCustomer;
          self.Caption := self.Caption + ' - ' + edtCustomerName.text;
        end;

      dblkpCustomerType.keyvalue := 0;
      dblkpLevelOfImportance.keyvalue := 0;

      edtDiscountRate.Text := '0.00';
      dblkpVat.keyvalue := 0;
      dblkpPaymentTerms.keyvalue := 0;

      edtDepositTerms.Text := formatfloat('#,##0.00',qrycompany.fieldbyname('Deposit_Terms').asfloat);
      edtAccountCode.Text := '';

      dblkpCreditStatus.keyvalue := 0;

      edtCreditLimit.Text := '0';
      edtInvoiceLabel.Text := '';

      edtNoOfEmployees.Text := '0';

      cmbbxEndUserPriceFactor.ItemIndex := -1;
      edtEndUserMarkup.Text := '';

      chkbxProspect.Checked := true;

      chkbxSpeculative.Checked := false;
      chkbxFactored.Checked := false;
      chkbxShowLabourCharges.Checked := false;
      chkbxOnline.Checked := false;

      chkbxInactive.Checked := false;

      edtCutOutDiscount.Text := '0.00';
      edtEdgeDiscount.Text := '0.00';
      edtWorktopDiscount.Text := '0.00';
      edtSurveyPrice.Text := '0.00';
      edtInstallationPrice.Text := '0.00';
      edtDeliveryPrice.Text := '0.00';
      edtUnitCost.Text := '0.00';

      dblkpProspectStatus.KeyValue := 0;
      dblkpProspectAction.KeyValue := 0;
      dblkpProspectContact.KeyValue := 0;
      dblkpProspectOperator.KeyValue := 0;

      if (dtmdlOneCustomer.dtsRep.DataSet.RecordCount = 1) then
        dblkpRep.keyvalue := dtmdlOneCustomer.dtsRep.DataSet.fieldbyname('rep').asinteger;
    end
  else
    begin
      if (FunctionMode = 'C') then
        self.Caption := self.Caption + ' - ' + qryOneCustomer.fieldbyname('Customer_Name').asstring;

      edtCustomerName.Text := qryOneCustomer.fieldbyname('Customer_Name').asstring;
      edtStreet.Text := qryOneCustomer.fieldbyname('Street').asstring;
      edtLocale.Text := qryOneCustomer.fieldbyname('Locale').asstring;
      edtTownCity.Text := qryOneCustomer.fieldbyname('Town_City').asstring;
      edtPostcode.Text := qryOneCustomer.fieldbyname('Postcode').asstring;

      edtCountyState.Text := qryOneCustomer.fieldbyname('County_State').asstring;
      edtTelephoneNumber.Text := qryOneCustomer.fieldbyname('Telephone_Number').asstring;
      edtFaxNumber.Text := qryOneCustomer.fieldbyname('Fax_Number').asstring;

      edtWebAddress.Text := qryOneCustomer.fieldbyname('Web_Address').asstring;
      edtEmailAddress.Text := qryOneCustomer.fieldbyname('Email_Address').asstring;

      if qryOneCustomer.fieldbyname('Is_retail_customer').asstring = 'Y' then
        cmbCustomerCategory.itemindex := 1
      else
      if qryOneCustomer.fieldbyname('Is_Commercial_customer').asstring = 'Y' then
        cmbCustomerCategory.itemindex := 2
      else
        cmbCustomerCategory.itemindex := 0;

      dblkpRep.KeyValue := qryOneCustomer.fieldbyname('Rep').asinteger;

      dblkpCustomerType.keyvalue := qryOneCustomer.fieldbyname('Customer_Type').asinteger;
      dblkpLevelOfImportance.keyvalue := qryOneCustomer.fieldbyname('Level_of_Importance').asinteger;

      edtDiscountRate.Text := formatfloat('#,##0.00',qryOneCustomer.fieldbyname('Discount_Rate').asfloat);
      dblkpVat.keyvalue := qryOneCustomer.fieldbyname('Vat').asinteger;
      dblkpPaymentTerms.keyvalue := qryOneCustomer.fieldbyname('Payment_Terms').asinteger;

      edtDepositTerms.Text := formatfloat('#,##0.00',qryOneCustomer.fieldbyname('Deposit_Terms').asfloat);
      edtAccountCode.Text := qryOneCustomer.fieldbyname('Account_Code').asstring;

      dblkpCreditStatus.keyvalue := qryOneCustomer.fieldbyname('Credit_Status').asstring;

      edtCreditLimit.Text := qryOneCustomer.fieldbyname('Credit_Limit').asstring;
      edtInvoiceLabel.Text := qryOneCustomer.fieldbyname('Invoice_Label').asstring;

      edtNoOfEmployees.Text := qryOneCustomer.fieldbyname('No_of_Employees').asstring;

      if qryOneCustomer.fieldbyname('End_User_Price_Factor').asstring = 'M' then
        cmbbxEndUserPriceFactor.itemindex := 1
      else
      if qryOneCustomer.fieldbyname('End_User_Price_Factor').asstring = 'X' then
        cmbbxEndUserPriceFactor.itemindex := 2
      else
        cmbbxEndUserPriceFactor.itemindex := -1;

      edtEndUserMarkup.Text := formatfloat('#,##0.0000',qryOneCustomer.fieldbyname('End_User_Markup_Percentage').asfloat);

      frmWTDBMemo.LoadMemoData(qryOneCustomer.FieldByName('Narrative').AsInteger);
      chkbxOnline.Checked := (qryOneCustomer.fieldbyname('Use_Online_Ordering').asstring = 'Y');
      chkbxUseforGeneralQuoting.Checked := (qryOneCustomer.fieldbyname('Use_for_General_Quoting').asstring = 'Y');

      chkbxShowLabourCharges.Checked := (qryOneCustomer.fieldbyname('Separate_Labour_Invoice_Value').asstring = 'Y');
      chkbxSpeculative.Checked := (qryOneCustomer.fieldbyname('Customer_is_Speculative').asstring = 'Y');
      chkbxSpeculative.enabled := (cmbCustomerCategory.itemindex = 0) or (cmbCustomerCategory.itemindex = 2);

      chkbxFactored.Checked := (qryOneCustomer.fieldbyname('Account_Is_Factored').asstring = 'Y');
      chkbxFactored.enabled := (cmbCustomerCategory.itemindex = 0) or (cmbCustomerCategory.itemindex = 2);

      chkbxProspect.Checked := (qryOneCustomer.fieldbyname('Prospect').asstring = 'Y');

      if qryOneCustomer.fieldbyname('Prospect_Action_Next_Date').asdatetime = 0 then
        edtActionDate.text := ''
      else
        edtActionDate.text := paDateStr(qryOneCustomer.fieldbyname('Prospect_Action_Next_Date').asdatetime);

      chkbxInactive.Checked := (qryOneCustomer.fieldbyname('Not_Active').asstring = 'Y');

      edtCutOutDiscount.Text := formatfloat('#,##0.00', qryOneCustomer.fieldbyname('CutOut_Discount').asfloat);
      edtEdgeDiscount.Text := formatfloat('#,##0.00', qryOneCustomer.fieldbyname('Edge_Discount').asfloat);
      edtWorktopDiscount.Text := formatfloat('#,##0.00', qryOneCustomer.fieldbyname('Worktop_Discount').asfloat);
      edtSurveyPrice.Text := formatfloat('#,##0.00', qryOneCustomer.fieldbyname('Survey_Price').asfloat);
      edtInstallationPrice.Text := formatfloat('#,##0.00', qryOneCustomer.fieldbyname('Installation_Price').asfloat);
      edtDeliveryPrice.Text := formatfloat('#,##0.00', qryOneCustomer.fieldbyname('Delivery_Price').asfloat);

      edtUnitCost.Text := formatfloat('#,##0.00', qryOneCustomer.fieldbyname('Unit_Cost').asfloat);

      dblkpProspectStatus.KeyValue := qryOneCustomer.fieldbyname('Prospect_Status').asinteger;
      dblkpProspectAction.KeyValue := qryOneCustomer.fieldbyname('Prospect_Action').asinteger;
      dblkpProspectContact.KeyValue := qryOneCustomer.fieldbyname('Contact_no').asinteger;
      dblkpProspectOperator.KeyValue := qryOneCustomer.fieldbyname('Prospect_Action_Operator').asinteger;

      if (FunctionMode <> 'A') and (FunctionMode <> 'S') then
        begin
          ShowBranches;
          ShowMaterialTypes;
          RefreshQuotes;
          ShowEvents;
          dtmdlWorktops.CreateCustomerDocDirectory(edtCustomerName.text);
        end;
      stsbrDetails.Panels[0].Text := 'Date Created: ' + paDateStr(qryOneCustomer.fieldbyname('Date_Created').asdatetime);
    end;
end;

procedure TfrmWtMaintCustomer.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWtMaintCustomer.SpeedButton1Click(Sender: TObject);
begin
  frmWTLUCustType := TfrmWTLUCustType.create(self);
  try
    frmWTLUCustType.showmodal;
  finally
    frmWTLUCustType.free;
  end;

  dtmdlOneCustomer.lkpCustomerType.close;
  dtmdlOneCustomer.lkpCustomerType.open;
end;

procedure TfrmWtMaintCustomer.SpeedButton2Click(Sender: TObject);
begin
  frmWTLUVat := TfrmWTLUVat.create(self);
  try
    frmWTLUVat.showmodal;
  finally
    frmWTLUVat.free;
  end;

  dtmdlOneCustomer.dtsVAT.DataSet.active := false;
  dtmdlOneCustomer.dtsVAT.DataSet.active := true;
end;

procedure TfrmWtMaintCustomer.tblOneCustomerNewRecord(DataSet: TDataSet);
begin
(*  qryCompany.close;
  qryCompany.open;

	qryNewCust.Close;
  qryNewCust.Open;

  tblOneCustomer.FieldByName('Customer').asinteger := qryNewCust.Fields[0].asinteger + 1;
  tblOneCustomer.FieldByName('Discount_Rate').asfloat := 0.00;
  tblOneCustomer.FieldByName('Credit_Limit').asfloat := 0;
  tblOneCustomer.FieldByName('credit_status').asstring := 'U';
  tblOneCustomer.FieldByName('Customer_type').asinteger := 0;
  tblOneCustomer.FieldByName('vat').asinteger := 0;
  tblOneCustomer.FieldByName('Prospect_Status').asinteger := 1;
  tblOneCustomer.FieldByName('Date_Created').asdatetime := date;
  tblOneCustomer.FieldByName('deposit_terms').asfloat := qrycompany.fieldbyname('Deposit_Terms').asfloat;
*)
end;

procedure TfrmWtMaintCustomer.SpeedButton3Click(Sender: TObject);
begin
  frmWTLUReps := TfrmWTLUReps.create(self);
  try
    frmWTLUReps.showmodal;
  finally
    frmWTLUReps.free;
  end;

  dtmdlOneCustomer.dtsRep.DataSet.active := false;
  dtmdlOneCustomer.dtsRep.DataSet.active := true;

end;

procedure TfrmWtMaintCustomer.FormActivate(Sender: TObject);
begin
  bOK := false;

  edtDiscountRate.Enabled := not frmWTMain.bEndUSer;

  qryCompany.close;
  qryCompany.open;

  dtmdlOneCustomer.lkpCustomerType.close;
  dtmdlOneCustomer.lkpCustomerType.open;

  dtmdlOneCustomer.qryLevelofImportance.close;
  dtmdlOneCustomer.qryLevelofImportance.open;

  dtmdlOneCustomer.lkpVat.close;
  dtmdlOneCustomer.lkpVat.open;

  dtmdlOneCustomer.dtsRep.DataSet.active := false;
  dtmdlOneCustomer.dtsRep.DataSet.active := true;

  dtmdlOneCustomer.dtsAction.DataSet.active := false;
  dtmdlOneCustomer.dtsAction.DataSet.active := true;

  dtmdlOneCustomer.dtsOperator.DataSet.active := false;
  dtmdlOneCustomer.dtsOperator.DataSet.active := true;

  dtmdlOneCustomer.dtsPaymentTerms.DataSet.active := false;
  dtmdlOneCustomer.dtsPaymentTerms.Dataset.active := true;

  dtmdlOneCustomer.dtsLevelofImportance.Dataset.close;
  dtmdlOneCustomer.dtsLevelofImportance.Dataset.open;

  GetContacts;

  dblkpRep.ListSource := dtmdlOneCustomer.dtsRep;
  dblkpProspectStatus.ListSource := dtmdlOneCustomer.dtsProspectStatus;
  dblkpProspectAction.ListSource := dtmdlOneCustomer.dtsAction;
  dblkpProspectContact.ListSource := dtmdlOneCustomer.dtsCustContact;
  dblkpProspectOperator.ListSource := dtmdlOneCustomer.dtsOperator;
  dblkpPaymentTerms.ListSource := dtmdlOneCustomer.dtsPaymentTerms;
  dblkpLevelofImportance.ListSource := dtmdlOneCustomer.dtsLevelofImportance;
  dblkpCustomerType.ListSource := dtmdlOneCustomer.dtsCustomerType;
  dblkpVAT.ListSource := dtmdlOneCustomer.dtsVAT;
  dblkpCreditStatus.listSource := dtmdlOneCustomer.dtsCreditStatus;

  dbgBranches.DataSource := dtmdlOneCustomer.dtsBranches;
  dbgEvents.DataSource := dtmdlOneCustomer.dtsEvents;
  dbgQuotes.DataSource := dtmdlOneCustomer.dtsQuotes;
  dbgSOrders.DataSource := dtmdlOneCustomer.dtsSOrders;
  dbgJobs.DataSource := dtmdlOneCustomer.dtsJobs;
  dbgInvoices.DataSource := dtmdlOneCustomer.dtsInvoices;
  dbgMaterialTypes.DataSource := dtmdlOneCustomer.dtsMaterialTypes;

  ShowDetails;
  ShowDocuments;

  tmrDetails.enabled := false;
  CheckNotes(Self);
  enableOK(self);
end;

procedure TfrmWtMaintCustomer.btnAddClick(Sender: TObject);
begin
  CallMaintBranches('A');
end;

procedure TfrmWtMaintCustomer.ShowBranches;
begin
  with dtmdlOneCustomer.qryBranches do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;

      btnChange.enabled := (recordcount > 0);
      btnDelete.Enabled := btnChange.enabled;
    end;
end;

procedure TfrmWtMaintCustomer.ShowMaterialTypes;
begin
  with dtmdlOneCustomer.qryMaterialTypes do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      if not chkbxShowInactiveMaterialTypes.Checked then
        begin
          parambyname('inactive').asstring := 'N';
        end
      else
        begin
          parambyname('inactive').asstring := 'Y';
        end;

      open;

      btnMTChange.enabled := (recordcount > 0);
      btnMTDelete.Enabled := btnMTChange.enabled;
    end;
end;

procedure TfrmWtMaintCustomer.ShowEvents;
begin
  with dtmdlOneCustomer.qryEvents do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;

      btnChangeEv.enabled := (recordcount > 0);
      btnDeleteEv.Enabled := btnChangeEv.enabled;
    end;
end;

procedure TfrmWtMaintCustomer.GetContacts;
begin
  dtmdlOneCustomer.qryCustContact.close ;
  dtmdlOneCustomer.qryCustContact.parambyname('Customer').asinteger := customer;
  dtmdlOneCustomer.qryCustContact.open;
end;

procedure TfrmWtMaintCustomer.RefreshQuotes;
begin
  with dtmdlOneCustomer.qryQuotes do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Description').asstring := '%' + edtQuoteDesc.text + '%';
      open;

      btnChangeQ.enabled := (recordcount > 0);
      btnCopyQ.Enabled := btnChangeQ.enabled;
      btnDeleteQ.Enabled := btnChangeQ.enabled;
      btnPrintQ.Enabled := btnChangeQ.enabled;
    end;
end;

procedure TfrmWtMaintCustomer.RefreshSOrders;
begin
  with dtmdlOneCustomer.qrySOrders do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Description').asstring := '%' + edtSOrderDesc.text + '%';
      open;

      btnChangeSO.enabled := (recordcount > 0);
      btnDeleteSO.Enabled := btnChangeSO.enabled;
    end;
end;

procedure TfrmWtMaintCustomer.RefreshJobs;
begin
  with dtmdlOneCustomer.qryJobs do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Description').asstring := '%' + edtJobDesc.text + '%';
      open;

      btnChangeJob.enabled := (recordcount > 0);
      btnDeleteJOb.Enabled := btnChangeJOb.enabled;
    end;
end;

procedure TfrmWtMaintCustomer.RefreshInvoices;
begin
  with dtmdlOneCustomer.qryInvoices do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Description').asstring := '%' + edtInvoiceDesc.text + '%';
      parambyname('inactive').asstring := 'N';
      open;

      btnViewInv.enabled := (recordcount > 0);
      btnPrintInv.Enabled := btnViewInv.enabled;
    end;
end;

procedure TfrmWtMaintCustomer.CallMaintBranches(FuncMode: string);
begin
  frmWTMaintBranch := TfrmWTMaintBranch.create(self);
  try
    if FuncMode = 'A' then
      begin
        frmWTMaintBranch.iCustomer := Customer;
      end
    else
      begin
        frmWTMaintBranch.iCustomer := Customer;
        frmWTMaintBranch.CustomerName := edtCustomerName.Text;
        frmWTMaintBranch.iBranch := dbgBranches.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
        frmWTMaintBranch.sName := dbgBranches.DataSource.DataSet.fieldbyname('Branch_Name').asstring;
      end;

    frmWTMaintBranch.sFuncMode := FuncMode;
    frmWTMaintBranch.showmodal;
    if frmWTMaintBranch.bOK then
      begin
        ShowBranches;
        if frmWTMaintBranch.sFuncMode <> 'D' then
          begin
            dbgBranches.DataSource.DataSet.Locate('Branch_no', Variant(inttostr(frmWTMaintBranch.iBranch)),[lopartialKey]) ;
          end;
      end;
  finally
    frmWTMaintBranch.free;
  end;
end;

procedure TfrmWtMaintCustomer.CallMaintMaterialTypes(FuncMode: string);
begin
  frmWTMaintCustMaterialType := TfrmWTMaintCustMaterialType.create(self);
  try
    if FuncMode = 'A' then
      begin
        frmWTMaintCustMaterialType.iCustomer := Customer;
      end
    else
      begin
        frmWTMaintCustMaterialType.iCustomer := Customer;
        frmWTMaintCustMaterialType.CustomerName := edtCustomerName.Text;
        frmWTMaintCustMaterialType.iCode := dbgMaterialTypes.DataSource.DataSet.fieldbyname('ID').asinteger;
      end;

    frmWTMaintCustMaterialType.FunctionMode := FuncMode;
    frmWTMaintCustMaterialType.showmodal;
    if frmWTMaintCustMaterialType.bOK then
      begin
        ShowMaterialTypes;
        if frmWTMaintCustMaterialType.FunctionMode <> 'D' then
          begin
            dbgMaterialTypes.DataSource.DataSet.Locate('ID', Variant(inttostr(frmWTMaintCustMaterialType.iCode)),[lopartialKey]) ;
          end;
      end;
  finally
    frmWTMaintCustMaterialType.free;
  end;
end;

procedure TfrmWtMaintCustomer.btnChangeClick(Sender: TObject);
begin
  CallMaintBranches('C');
end;

procedure TfrmWtMaintCustomer.btnDeleteClick(Sender: TObject);
begin
  CallMaintBranches('D');
end;

procedure TfrmWtMaintCustomer.dbgBranchesDblClick(Sender: TObject);
begin
  if dbgbranches.DataSource.DataSet.FieldByName('Branch_Name').asstring <> '' then
    btnChangeClick(self);
end;

procedure TfrmWtMaintCustomer.FormDestroy(Sender: TObject);
begin
  frmWTDBMemo.Free;
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWtMaintCustomer.btnAddEvClick(Sender: TObject);
begin
  CallMaintEventScreen('A');
end;

procedure TfrmWtMaintCustomer.CallMaintEventScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iCustomer, iContact, iTempSel: Integer;
begin
  frmWTMaintContactEvents := TfrmWTMaintContactEvents.Create(Self);
  try
    frmWTMaintContactEvents.sFuncMode := AnsiString(sTempFuncMode);
    frmWTMaintContactEvents.iCust := Customer;
    if sTempFuncMode <> 'A' then
      begin
        frmWTMaintContactEvents.iCode :=
          dbgEvents.datasource.DataSet.FieldByName('Customer_Event_No').AsInteger;
        frmWTMaintContactEvents.iContact :=
          dbgEvents.datasource.DataSet.FieldByName('Contact_no').AsInteger;
      end
    else
      begin
        frmWTMaintContactEvents.iCode := 0;
        frmWTMaintContactEvents.iContact := 0;
        try
          frmWTMaintContactEvents.iAction := dblkpProspectAction.KeyValue;
        except
          frmWTMaintContactEvents.iAction := 0;
        end;
      end;
    frmWTMaintContactEvents.sCustName := edtCustomerName.text;
    frmWTMaintContactEvents.ShowModal;
    bTempOK := (frmWTMaintContactEvents.ModalResult = mrOK);

    iCustomer := frmWTMaintContactEvents.iCust;
    iContact := frmWTMaintContactEvents.iContact;
    iTempSel := frmWTMaintContactEvents.iCode;
  finally
    frmWTMaintContactEvents.Free;
    GetContacts;
  end;
  if bTempOK then
  begin
    ShowEvents;

    if sTempFuncMode <> 'D' then
      dbgEvents.datasource.DataSet.locate('Customer;Contact_no;Customer_Event_No', VarArrayOf([inttostr(iCustomer),inttostr(iContact),inttostr(iTempSel)]),[lopartialKey]) ;
  end;
end;

procedure TfrmWtMaintCustomer.btnChangeEvClick(Sender: TObject);
begin
  CallMaintEventScreen('C');
end;

procedure TfrmWtMaintCustomer.btnDeleteEvClick(Sender: TObject);
begin
  CallMaintEventScreen('D');
end;

procedure TfrmWtMaintCustomer.tmrDetailsTimer(Sender: TObject);
begin
  with tmrDetails do
    begin
      Enabled := False;
      case tag of
        0: RefreshQuotes;
        1: RefreshSOrders;
        2: RefreshJobs;
        3: RefreshInvoices;
      end;
    end;
end;

procedure TfrmWtMaintCustomer.edtQuoteDescChange(Sender: TObject);
begin
  tmrDetails.Tag := 0;
  tmrDetails.Enabled := False;
  tmrDetails.Enabled := True;
end;

procedure TfrmWtMaintCustomer.dbgEventsDblClick(Sender: TObject);
begin
  btnChangeEvClick(self);
end;

procedure TfrmWtMaintCustomer.btnAddQClick(Sender: TObject);
begin
  CallQuoteMaint(qAdd);
end;

procedure TfrmWtMaintCustomer.btnChangeQClick(Sender: TObject);
begin
  CallQuoteMaint(qChange);
end;

procedure TfrmWtMaintCustomer.CallQuoteMaint(aMode : TqMode);
var
  Key : integer;
  frm : TfrmWtMaintQuote;
  aQuote : TQuote;
  dtmdlCustQuote: TdtmdlQuote;
begin
  dtmdlCustQuote := TdtmdlQuote.create(Application);

  if aMode = qAdd then
    Key := 0
  else
  if aMode = qChange then
    begin
      if (dbgQuotes.DataSource.DataSet.FieldByName('Quote_status').asinteger > 10) and
         (dbgQuotes.DataSource.DataSet.FieldByName('Quote_status').asinteger <= 24)  then
        begin
          if MessageDlg('This quote is '+ dbgQuotes.DataSource.DataSet.FieldByName('Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end
      else
      if (dbgQuotes.DataSource.DataSet.FieldByName('Quote_status').asinteger > 24) then
        begin
          if MessageDlg('This quote is '+ dbgQuotes.DataSource.DataSet.FieldByName('Status_Description').asstring + ', you cannot change any of the details, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit
          else
            aMode := qView;
        end;
      Key := dbgQuotes.DataSource.DataSet.FieldByName('Quote').asinteger ;
    end
  else
    Key := dbgQuotes.DataSource.DataSet.FieldByName('Quote').asinteger;

  try
    aQuote := TQuote.Create(dtmdlCustQuote);
    try
      aQuote.DbKey := key;
      aQuote.LoadFromDB;
      Frm := TfrmwtMaintQuote.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.Quote := aQuote;
        Frm.ShowModal;
        Key := aQuote.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aQuote.Free;
    end;
  finally
    dbgQuotes.DataSource.DataSet.Close;
    dbgQuotes.DataSource.DataSet.Open;
    dbgQuotes.DataSource.DataSet.Locate('Quote', Variant(inttostr(Key)),[lopartialKey]) ;
  end;

  dtmdlCustQuote.Free;
end;

procedure TfrmWtMaintCustomer.dbgQuotesDblClick(Sender: TObject);
begin
  btnChangeQClick(self);
end;

procedure TfrmWtMaintCustomer.tbsSOrdersShow(Sender: TObject);
begin
  RefreshSOrders;
end;

procedure TfrmWtMaintCustomer.edtSOrderDescChange(Sender: TObject);
begin
  tmrDetails.Tag := 1;
  tmrDetails.Enabled := False;
  tmrDetails.Enabled := True;

end;

procedure TfrmWtMaintCustomer.btnAddSOClick(Sender: TObject);
begin
  CallSOrderMaint(sopAdd);
end;

procedure TfrmWtMaintCustomer.btnChangeSOClick(Sender: TObject);
begin
  CallSOrderMaint(sopChange);
end;

procedure TfrmWtMaintCustomer.CallSOrderMaint(aMode : TsopMode);
var
  Key : integer;
  frm : TfrmWtMaintSalesOrder;
  aSOrder : TSOrder;
  dtmdlCustSales: TdtmdlSalesOrder;
begin
  dtmdlCustSales := TdtmdlSalesOrder.create(application);
  if aMode = sopAdd then
    Key := 0
  else
  if (aMode = sopChange) or (aMode = sopDelete) then
    begin
      Key := dbgSOrders.DataSource.DataSet.FieldByName('sales_order').asinteger;
(*      if dbgdetails.DataSource.DataSet.FieldByName('sales_order_status').asinteger = 100 then
        begin
          aMode := sopView;
          if MessageDlg('This order is '+ dbgdetails.DataSource.DataSet.FieldByName('Sales_order_Status_Desc').asstring + ', therefore cannot be changed, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end
      else
*)
      if dbgSOrders.DataSource.DataSet.FieldByName('sales_order_status').asinteger > 10 then
        begin
          if MessageDlg('This order is '+ dbgSOrders.DataSource.DataSet.FieldByName('Sales_order_Status_Desc').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end;
//      Key := dbgSOrders.DataSource.DataSet.FieldByName('sales_order').asinteger
    end
  else
    key := dbgSOrders.DataSource.DataSet.FieldByName('sales_order').asinteger;


  try
    aSOrder := TSOrder.Create(dtmdlCustSales);
    try
      aSOrder.DbKey := key;
      aSOrder.LoadFromDB;
      Frm := TfrmwtMaintSalesOrder.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.SOrder := aSOrder;
        Frm.ShowModal;
        Key := aSOrder.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aSOrder.Free;
    end;
  finally
    dbgSOrders.DataSource.DataSet.Close;
    dbgSOrders.DataSource.DataSet.Open;
    dbgSOrders.DataSource.DataSet.Locate('Sales_Order', Variant(inttostr(Key)),[lopartialKey]) ;
    dtmdlCustSales.Free;
  end;
end;

procedure TfrmWtMaintCustomer.dbgSOrdersDblClick(Sender: TObject);
begin
  btnChangeSOClick(self);
end;

procedure TfrmWtMaintCustomer.edtJobDescChange(Sender: TObject);
begin
  tmrDetails.Tag := 2;
  tmrDetails.Enabled := False;
  tmrDetails.Enabled := True;
end;

procedure TfrmWtMaintCustomer.tbsJobsShow(Sender: TObject);
begin
  RefreshJobs;
end;

procedure TfrmWtMaintCustomer.dbgJobsDblClick(Sender: TObject);
begin
  btnChangeJobClick(self);
end;

procedure TfrmWtMaintCustomer.btnAddJobClick(Sender: TObject);
begin
  CallJobMaint(jAdd);
end;

procedure TfrmWtMaintCustomer.btnChangeJobClick(Sender: TObject);
begin
  CallJobMaint(jChange);

end;

procedure TfrmWtMaintCustomer.btnDeleteJobClick(Sender: TObject);
begin
  CallJobMaint(jdelete);
end;

procedure TfrmWtMaintCustomer.CallJobMaint(aMode : TjMode);
var
  Key : integer;
  frm : TfrmWtMaintJob;
  aJob : TJob;
  dtmdlCustJob : TdtmdlJob;
begin
  dtmdlCustJob := TdtmdlJob.create(application);

  if aMode = jAdd then
    Key := 0
  else
  if aMode = jChange then
    begin
      if dbgJobs.DataSource.DataSet.FieldByName('Job_status').asinteger >= 50 then
        begin
          if MessageDlg('This job is '+ dbgJobs.DataSource.DataSet.FieldByName('Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
          aMode := jRestrict;
        end
      else
      if dbgJobs.DataSource.DataSet.FieldByName('Job_status').asinteger > 10 then
        begin
          if MessageDlg('This job is '+ dbgJobs.DataSource.DataSet.FieldByName('Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end;
      Key := dbgJobs.DataSource.DataSet.FieldByName('Job').asinteger
    end
  else
    Key := dbgJobs.DataSource.DataSet.FieldByName('Job').asinteger;

  try
    aJob := TJob.Create(dtmdlCustJob);
    try
      aJob.DbKey := key;
      aJob.LoadFromDB;
      Frm := TfrmwtMaintJob.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.Job := aJob;
        Frm.ShowModal;
        Key := aJob.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aJob.Free;
    end;
  finally
    dbgJobs.DataSource.DataSet.Close;
    dbgJobs.DataSource.DataSet.Open;
    dbgJobs.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) ;
    dtmdlCustJob.Free;
  end;
end;

procedure TfrmWtMaintCustomer.tbsInvoicesShow(Sender: TObject);
begin
  RefreshInvoices;
end;

procedure TfrmWtMaintCustomer.btnPrintQClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
  dtmdlCustQuote: TdtmdlQuote;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  dtmdlCustQuote := TdtmdlQuote.create(Application);
  frmWTRSQuote := TfrmWTRSQuote.Create( Application );
  try
    Key := dbgQuotes.DataSource.DataSet.FieldByName('Quote').asinteger ;
    frmWTRSQuote.bRetail := (dbgQuotes.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'Y');
    frmWTRSQuote.memSelection.text := inttostr(Key);
    frmWTRSQuote.showmodal;
  finally
    frmWTRSQuote.free;
    dtmdlCustQuote.free;
    dbgQuotes.DataSource.DataSet.Close;
    dbgQuotes.DataSource.DataSet.Open;
    Screen.Cursor := OldCursor;
  end;
  dbgQuotes.DataSource.DataSet.Locate('Quote', Variant(inttostr(Key)),[lopartialKey]) ;
end;

procedure TfrmWtMaintCustomer.btnCopyQClick(Sender: TObject);
begin
  CallQuoteMaint(qCopy);
end;

procedure TfrmWtMaintCustomer.btnDeleteQClick(Sender: TObject);
begin
  CallQuoteMaint(qDelete);
end;

procedure TfrmWtMaintCustomer.btnDeleteSOClick(Sender: TObject);
var
  dtmdlCustSales: TdtmdlSalesOrder;
begin
  dtmdlCustSales := TdtmdlSalesOrder.create(application);
  try
    if dtmdlCustSales.GetSOrderDetails(dbgSOrders.DataSource.DataSet.FieldByName('sales_order').asinteger) = true then
    begin
      if MessageDlg('Related details exist for this sales order, you cannot delete. Do you want to make this order inactive?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            dtmdlCustSales.SetSOrderInactive(dbgSOrders.DataSource.DataSet.FieldByName('sales_order').asinteger);
            dtmdlCustSales.RefreshAlldata;
            exit;
          end;
    end;
    CallSOrderMaint(sopDelete);
  finally
    dtmdlCustSales.free;
  end;

end;

procedure TfrmWtMaintCustomer.BitBtn1Click(Sender: TObject);
begin
  ConvertToSalesOrder
end;

procedure TfrmWtMaintCustomer.ConvertToSalesOrder;
var
  Key, iQuoteNo : integer;
  frm : TfrmWtMaintSalesOrder;
  aSOrder : TSOrder;
  dtmdlCustSales: TdtmdlSalesOrder;
  dtmdlCustQuote: TdtmdlQuote;
begin
  if dbgQuotes.DataSource.DataSet.FieldByName('Quote_status').asinteger >=30 then
    begin
      MessageDlg('Cannot convert this quote, the quote has already been converted to a sales order', mtError,
        [mbAbort], 0);
      exit;
    end
  else
  if dbgQuotes.DataSource.DataSet.FieldByName('Quote_status').asinteger >= 24 then
    begin
      MessageDlg('This quote has already been confirmed as a sales order', mtError,
        [mbAbort], 0);
      exit;
    end;

  if MessageDlg('Do you want to confirm quote ' + dbgQuotes.DataSource.DataSet.FieldByName('Quote').asstring + ', as a new sales order?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;

  dtmdlCustQuote := TdtmdlQuote.create(Application);
  dtmdlCustSales := TdtmdlSalesOrder.create(application);

  iQuoteNo := 0;
  Key := 0;
  try
    aSOrder := TSOrder.Create(dtmdlCustSales);
    try
      iQuoteNo := dbgQuotes.DataSource.DataSet.FieldByName('Quote').asinteger;
      aSOrder.DataModule.QuoteNo := dbgQuotes.DataSource.DataSet.FieldByName('Quote').asinteger;
      aSOrder.DbKey := key;
      aSOrder.LoadFromQuote;
      Frm := TfrmwtMaintSalesOrder.Create(Self);
      try
        Frm.Mode := sopConvert;
        Frm.SOrder := aSOrder;
        Frm.ShowModal;
        if Frm.ModalResult = idOK then
          dtmdlCustQuote.UpdateQStatusSO(aSOrder.DataModule.QuoteNo, 24);
      finally
        Frm.Free;
      end;
    finally
      aSOrder.Free;
    end;
  finally
    dtmdlCustSales.free;
    dtmdlCustQuote.free;
    dbgQuotes.DataSource.DataSet.Close;
    dbgQuotes.DataSource.DataSet.Open;
    dbgQuotes.DataSource.DataSet.Locate('Quote', Variant(inttostr(iQuoteNo)),[lopartialKey]) ;
  end;
end;

procedure TfrmWtMaintCustomer.edtActionDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;

  (Sender as TEdit).Text := paDatestr(NewDate);
end;

procedure TfrmWtMaintCustomer.btnActionDateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtActionDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtActionDate.text;

  edtActionDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWtMaintCustomer.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmWtMaintCustomer.SpeedButton4Click(Sender: TObject);
begin
  frmWTLUProspectAction := TfrmWTLUProspectAction.create(self);
  try
    frmWTLUProspectAction.showmodal;
  finally
    frmWTLUProspectAction.free;
  end;

  dblkpProspectAction.ListSource := nil;
  dtmdlOneCustomer.qryAction.close;
  dtmdlOneCustomer.qryAction.open;
  dblkpProspectAction.ListSource := dtmdlOneCustomer.dtsAction;
end;

procedure TfrmWtMaintCustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  TempWord := MessageDlg('Do you want to save these details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
    begin
//      tblOneCustomer.cancel;
      Exit
    end
  else
  if TempWord = mrCancel then
    begin
      Action := caNone;
    end
  else
    btnOKClick(self);
end;

procedure TfrmWtMaintCustomer.SpeedButton5Click(Sender: TObject);
begin
  frmWTSrchCustContacts := TfrmWTSrchCustContacts.create(self);
  try
    frmWTSrchCustContacts.Customer := Customer;
    frmWTSrchCustContacts.Caption := 'Customer '+ frmWTSrchCustContacts.Caption + ' - ' + edtCustomerName.text;
    frmWTSrchCustContacts.showmodal;

    Getcontacts;
  finally
    frmWTSrchCustContacts.free;
  end;
end;

procedure TfrmWtMaintCustomer.BitBtn3Click(Sender: TObject);
var
  sSubject, sBody: string;
  AppDateTime: TDateTime;
  Hour, Min, Sec, MSec: Word;
  WTAppMemoFrm: TfrmWTDBMemo;
begin
  WTMaintContAppfrm := TWTMaintContAppfrm.create(self);
  try
    if edtActionDate.Text <> '' then
      begin
        if paDateStr(edtActionDate.text) > date then
          WTMaintContAppfrm.DateTimePicker.Date := paDateStr(edtActionDate.text);
      end;
      
    WTMaintContAppfrm.showmodal;
    if WTMaintContAppfrm.modalresult = idOK then
      begin
        sSubject := 'Action: ' + dblkpProspectAction.Text +
                    ' to ' + dblkpProspectContact.text + ' of ' + edtCustomerName.text;

        sBody := 'Phone no: ' + dtsOneCustomer.dataset.fieldbyname('Telephone_Number').asstring + #13#10 + #13#10;

        {Get the details for the memo display} ;
        WTAppMemoFrm := TfrmWTDBMemo.Create(Self);
        try
          WTAppMemoFrm.bAllow_Upd := False;
          WTAppMemoFrm.LoadMemoData(dbgEvents.DataSource.Dataset.FieldByName('Narrative').AsInteger);
          if trim(WTAppMemoFrm.DispMemo.Text) = '' then
            sBody := sBody + ''
          else
            sBody := sBody + 'Last event details: ' + #13#10 + #13#10 + WTAppMemoFrm.DispMemo.Text ;
        finally
          WTAppMemoFrm.Free;
        end;
        decodetime(WTMaintContAppfrm.dtpckAppTime.time,Hour,Min,Sec,Msec);
//        AppDatetime := WTMaintContAppfrm.mnthCalApp.date + encodetime(Hour,Min,Sec,Msec);
        AppDatetime := WTMaintContAppfrm.DateTimePicker.date + encodetime(Hour,Min,Sec,Msec);
        AddAppViaOutLook('',sSubject,sBody,AppDateTime,true,20);
      end;
  finally
    WTMaintContAppfrm.free;
  end;
end;

procedure TfrmWtMaintCustomer.CallSInvoiceMaint(aMode : TsiMode);
var
  Key : integer;
  frm : TfrmWtMaintSalesInvoice;
  aInvoice : TSalesInvoice;
  dtmdlCustInvoices: TdtmdlSalesInvoice;
begin
  dtmdlCustInvoices := TdtmdlSalesInvoice.create(application);
  if aMode = siAdd then
    Key := 0
  else
    begin
      Key := dbgInvoices.Datasource.dataset.FieldByName('Sales_invoice').AsInteger;
    end;

  try
    aInvoice := TSalesInvoice.Create(dtmdlCustInvoices);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TfrmWTMaintSalesInvoice.Create(Self);
      try
        Frm.Mode := aMode;
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
    dbgInvoices.DataSource.DataSet.Close;
    dbgInvoices.DataSource.DataSet.Open;
    dbgInvoices.DataSource.DataSet.Locate('Sales_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;
    dtmdlCustInvoices.Free;
  end;
end;

procedure TfrmWtMaintCustomer.btnPrintInvClick(Sender: TObject);
var
  key: integer;
  SINumber: integer;
  frm : TfrmwtRSSalesInvoiceReprint;
begin
  SINumber := dbgInvoices.Datasource.Dataset.FieldByName('Invoice_no').AsInteger;
  Key := dbgInvoices.Datasource.Dataset.FieldByName('sales_invoice').AsInteger;

  Frm := TfrmWTRSSalesInvoiceReprint.Create(Self);

  try
    Frm.icode := Key;
    Frm.memSelection.text := inttostr(SINumber);
    Frm.InvoicePrint := true;
    Frm.ShowModal;
  finally
    Frm.Free;
  end;
end;

procedure TfrmWtMaintCustomer.btnViewInvClick(Sender: TObject);
begin
  CallSInvoiceMaint(siView);
end;

procedure TfrmWtMaintCustomer.dbgInvoicesDblClick(Sender: TObject);
begin
  btnViewInvClick(self);
end;

procedure TfrmWtMaintCustomer.edtInvoiceDescChange(Sender: TObject);
begin
  tmrDetails.Tag := 3;
  tmrDetails.Enabled := False;
  tmrDetails.Enabled := True;

end;

procedure TfrmWtMaintCustomer.ShowDocuments;
var
  sPath: string;
begin
  sPath := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + edtCustomerName.text + '\';

  lstvwDocuments.Clear;
  // Assign a Imagelist to the ListView
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
end;

procedure TfrmWtMaintCustomer.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
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

procedure TfrmWtMaintCustomer.lstvwDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
  sPath := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + edtCustomerName.text + '\';
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

procedure TfrmWtMaintCustomer.btnWordClick(Sender: TObject);
var
  compdir, docdir, docExt, sPAth: string;
  sFullFile, sFileName: string;
  iLength, ipos, i: integer;
  okToSave, userCancelled, docsaved: boolean;
begin
  i := 0;
  docDir := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + edtCustomerName.text;
  compDir := dtmdlWorktops.GetCompanyCustomerDirectory;

  okToSave := false;
  userCancelled := false;
  docsaved := false;

  if ((Sender as TToolButton) = btnWord) then
  begin
    docExt := '.doc';
    svDlgOfficeDoc.Filter := 'Word Document(*.doc; *.docx)|*.doc; *.docx';
    svDlgOfficeDoc.FileName := 'New Document';
  end
  else if ((Sender as TToolButton) = btnExcel) then
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
          MessageDlg('You can''t save a document outside the Customer Document Directory',
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
          WTWordOLEFrm := TWTWordOLEFrm.Create(self);
          WTWordOLEFrm.SaveAsDocument(compDir+sPath);
          docSaved := true;
        finally
          WTWordOLEFrm.Free;
        end;
      end
      else
      begin
        try
          WTExcelOLEFrm := TWTExcelOLEFrm.Create(self);
          WTExcelOLEFrm.SaveAsDocument(compDir+sPath);
          docSaved := true;
        finally
          WTExcelOLEFrm.Free;
        end;
      end;

      ShowDocuments;
      
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

procedure TfrmWtMaintCustomer.btnAttachClick(Sender: TObject);
var
  i, ipos, ilength, icount: integer;
  sFile, sFullFile, docDir: string;
begin
  i := 0;
  docDir := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + edtCustomerName.text;
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

procedure TfrmWtMaintCustomer.mnuOpenDocumentClick(Sender: TObject);
begin
  lstvwDocumentsDblClick(self);
end;

procedure TfrmWtMaintCustomer.mnuDeleteDocumentClick(Sender: TObject);
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
      if (FunctionMode <> 'A') then
        begin
          sPath :=  dtmdlWorktops.GetCompanyCustomerDirectory + '\' + edtCustomerName.Text + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;

end;

procedure TfrmWtMaintCustomer.btnEmailClick(Sender: TObject);
var
  sTo, sSubject: string;
begin
  WTMaintEmailFrm := TWTMaintEmailFrm.create(self);
  try
    WTMaintEmailFrm.Supplier := 0;
    WTMaintEmailFrm.SupplierBranch := 0;
    WTMaintEmailFrm.SupplierContact := 0;
    WTMaintEmailFrm.AddressType := 0;
    WTMaintEmailFrm.Customer := Customer;
    WTMaintEmailFrm.CustomerBranch := 0;
    WTMaintEmailFrm.CustomerContact := 0;
    WTMaintEmailFrm.showmodal;
    if WTMaintEmailFrm.modalresult = idOK then
      begin
        sTo := WTMaintEmailFrm.edtEmail.text;
        sSubject := WTMaintEmailFrm.edtSubject.text;
        SendAndSaveEmail(sTo, sSubject);
      end;
  finally
    WTMaintEmailFrm.free;
  end;
end;

procedure TfrmWtMaintCustomer.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docdir, compdir, docExt: string;
begin
  docDir := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + edtCustomerName.text;
  compDir := dtmdlWorktops.GetCompanyCustomerDirectory;

  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try

  finally
    IniFile.Free;
  end;

  sBody := '';
  sfilePath := docdir;
  okToSave := false;

  EmailAndSaveViaOutlook(sTo, sSubject, sBody, sFilePath, okToSave, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

  if okToSave then
    begin
       ShowDocuments;
    end;
end;

procedure TfrmWtMaintCustomer.SpeedButton6Click(Sender: TObject);
begin
  frmWTLUPaymentTerms := TfrmWTLUPaymentTerms.create(self);
  try
    frmWTLUPaymentTerms.showmodal;
  finally
    frmWTLUPaymentTerms.free;
  end;

  dtmdlOneCustomer.qryPaymentTerms.close;
  dtmdlOneCustomer.qryPaymentTerms.open;

end;

procedure TfrmWtMaintCustomer.cmbCustomerCategoryChange(Sender: TObject);
begin
  if (cmbCustomerCategory.ItemIndex = 1) and dtmdlWorktops.PricesAreTrade then
    lblDiscountRate.Caption := 'Markup Rate'
  else
    lblDiscountRate.Caption := 'Discount Rate';

  if (cmbCustomerCategory.itemindex = 0) or (cmbCustomerCategory.itemindex = 2) then
    begin
      chkbxSpeculative.Enabled := true;
      chkbxFactored.Enabled := true;
    end
  else
    begin
      chkbxSpeculative.Enabled := false;
      chkbxSpeculative.checked := false;

      chkbxFactored.Enabled := false;
      chkbxFactored.checked := false;
    end;

  EnableOK(self);
end;

procedure TfrmWtMaintCustomer.SetDefaultCustomerCategory(
  const Value: integer);
begin
  FDefaultCustomerCategory := Value;
  cmbCustomerCategory.itemindex := FDefaultCustomerCategory;
end;

procedure TfrmWtMaintCustomer.tmrNotesTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := frmAllImages.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := frmAllImages.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TfrmWtMaintCustomer.NotesBitBtnClick(Sender: TObject);
var
  itemp: integer;
begin
  frmWTDBMemo.bAllow_Upd := (FunctionMode <> 'D');
  frmWTDBMemo.ShowModal;

  itemp := frmWTDBMemo.iNarr;
  CheckNotes(Self);
end;

procedure TfrmWTMaintCustomer.CheckNotes(Sender: TObject);
begin
  if frmWTDBMemo.CheckNotes(Self) then
  begin
    tmrNotes.Enabled := True;
    NotesBitBtn.Glyph := frmAllImages.OnBitBtn.Glyph;
  end
  else
  begin
    tmrNotes.Enabled := False;
    NotesBitBtn.Glyph := frmAllImages.OffBitBtn.Glyph;
  end;
end;

procedure TfrmWtMaintCustomer.cmbTemplatingDisctypeChange(Sender: TObject);
begin
  lblTemplatingDiscount.caption := (Sender as TComboBox).Items[(Sender as TComboBox).itemindex];
end;

procedure TfrmWtMaintCustomer.cmbFittingDiscTypeChange(Sender: TObject);
begin
  lblFittingDiscount.caption := (Sender as TComboBox).Items[(Sender as TComboBox).itemindex];
end;

procedure TfrmWtMaintCustomer.btnAddWorktopGroupClick(Sender: TObject);
begin
  CallMaintWorktopGroup('A');
end;

procedure TfrmWtMaintCustomer.CallMaintWorktopGroup(sTempFuncMode: string);
begin
end;

procedure TfrmWtMaintCustomer.SetGroup(const Value: integer);
begin
  FGroup := Value;
end;

procedure TfrmWtMaintCustomer.SetGroupDescription(const Value: string);
begin
  FGroupDescription := Value;
end;

procedure TfrmWtMaintCustomer.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWtMaintCustomer.SetGroupInactive(const Value: boolean);
begin
  FGroupInactive := Value;
end;

procedure TfrmWtMaintCustomer.ConvertAddressToCustomer;
begin
  edtCustomerName.Text := dtmdlOneCustomer.qryGetAddress.fieldbyname('Address_Name').asstring;
  edtStreet.Text := dtmdlOneCustomer.qryGetAddress.fieldbyname('Street').asstring;
  edtLocale.Text := dtmdlOneCustomer.qryGetAddress.fieldbyname('Locale').asstring;
  edtTownCity.Text := dtmdlOneCustomer.qryGetAddress.fieldbyname('Town_City').asstring;
  edtPostcode.Text := dtmdlOneCustomer.qryGetAddress.fieldbyname('Postcode').asstring;
  edtCountyState.Text := dtmdlOneCustomer.qryGetAddress.fieldbyname('County_State').asstring;
  edtTelephoneNumber.Text := dtmdlOneCustomer.qryGetAddress.fieldbyname('Telephone_Number').asstring;
  edtFaxNumber.Text := dtmdlOneCustomer.qryGetAddress.fieldbyname('Fax_Number').asstring;
  edtWebAddress.Text := dtmdlOneCustomer.qryGetAddress.fieldbyname('Web_Address').asstring;
  edtEmailAddress.Text := dtmdlOneCustomer.qryGetAddress.fieldbyname('Email_Address').asstring;

  cmbCustomerCategory.Enabled := false;
  chkbxSpeculative.Visible := false;
end;

procedure TfrmWtMaintCustomer.btnClearGroupClick(Sender: TObject);
begin
  dblkpRep.KeyValue := 0;
end;

procedure TfrmWtMaintCustomer.SpeedButton7Click(Sender: TObject);
begin
  frmWTLULevelofImportance := TfrmWTLULevelofImportance.create(self);
  try
    frmWTLULevelofImportance.showmodal;
  finally
    frmWTLULevelofImportance.free;
  end;

  dtmdlOneCustomer.qryLevelofImportance.close;
  dtmdlOneCustomer.qryLevelofImportance.open;

end;

procedure TfrmWtMaintCustomer.ParseMessage(const AFileName: string; var ATo, AFrom,
  ASubject, ADate, ABody: string);
var
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

function TfrmWtMaintCustomer.ParseDocumentFrom(tmpFrom: string): string;
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

function TfrmWtMaintCustomer.FormatDateasDateTime(sDate: string): TDateTime;
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

procedure TfrmWtMaintCustomer.lstvwDocumentsColumnClick(Sender: TObject;
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

procedure TfrmWtMaintCustomer.lstvwDocumentsCompare(Sender: TObject; Item1,
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

procedure TfrmWtMaintCustomer.pmnuDocumentsPopup(Sender: TObject);
begin
  if FunctionMode = 'A' then
    exit
  else
    begin
      pmnuDelete.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuOpen.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuSelectAll.Enabled := (lstvwDocuments.Items.count > 0);
    end;
end;

procedure TfrmWtMaintCustomer.pmnuPasteClick(Sender: TObject);
var
  f: THandle;
  buffer: Array [0..MAX_PATH] of Char;
  i, numFiles: Integer;
  sFile, sFullFile, docdir: string;
  iCount, iPos, iLength: integer;
begin
  iPos := 0;
  docDir := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + edtCustomerName.text;
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

procedure TfrmWtMaintCustomer.pmnuDeleteClick(Sender: TObject);
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
      if (FunctionMode <> 'A') then
        begin
          sPath :=  dtmdlWorktops.GetCompanyCustomerDirectory + '\' + edtCustomerName.Text + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;

end;

procedure TfrmWtMaintCustomer.pmnuSelectAllClick(Sender: TObject);
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

procedure TfrmWtMaintCustomer.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if CharInSet(FunctionMode[1], ['A', 'C', 'S']) then
  begin
    if (FunctionMode = 'A') or (FunctionMode = 'S') then
    begin
      Customer := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Customer_Name').asstring := edtCustomerName.Text;
      parambyname('Street').asstring := edtStreet.Text;
      parambyname('Locale').asstring := edtLocale.Text;
      parambyname('Town_City').asstring := edtTownCity.Text;
      parambyname('Postcode').asstring := edtPostcode.Text;

      parambyname('County_State').asstring := edtCountyState.Text;
      parambyname('Telephone_Number').asstring := edtTelephoneNumber.Text;
      parambyname('Fax_Number').asstring := edtFaxNumber.Text;

      parambyname('Web_Address').asstring := edtWebAddress.Text;
      parambyname('Email_Address').asstring := edtEmailAddress.Text;

      parambyname('Rep').asinteger := dblkpRep.KeyValue;

      if cmbCustomerCategory.itemindex = 1 then
        begin
          parambyname('Is_retail_customer').asstring := 'Y';
          parambyname('Is_Commercial_customer').asstring := 'N';
        end
      else
      if cmbCustomerCategory.itemindex = 2 then
        begin
          parambyname('Is_retail_customer').asstring := 'N';
          parambyname('Is_Commercial_customer').asstring := 'Y';
        end
      else
        begin
          parambyname('Is_retail_customer').asstring := 'N';
          parambyname('Is_Commercial_customer').asstring := 'N';
        end;

      parambyname('Customer_Type').asinteger := dblkpCustomerType.keyvalue;

      if dblkpLevelOfImportance.keyvalue = 0 then
        parambyname('Level_of_Importance').clear
      else
        parambyname('Level_of_Importance').asinteger := dblkpLevelOfImportance.keyvalue;

      parambyname('Discount_Rate').asfloat := StrToFloatDef(edtDiscountRate.Text, 0, FormatSettings);
      parambyname('Deposit_Terms').asfloat := StrToFloatDef(edtDepositTerms.Text, 0, FormatSettings);
      parambyname('Vat').asinteger := dblkpVat.keyvalue;

      if dblkpPaymentTerms.keyvalue = 0 then
        parambyname('Payment_Terms').clear
      else
        parambyname('Payment_Terms').asinteger := dblkpPaymentTerms.keyvalue;

      parambyname('Account_Code').asstring := edtAccountCode.Text;

      if dblkpCreditStatus.text = '' then
        parambyname('Credit_Status').clear
      else
        parambyname('Credit_Status').asstring := dblkpCreditStatus.keyvalue;

      if trim(edtCreditLimit.Text) = '' then
        parambyname('Credit_Limit').asstring := '0'
      else
        parambyname('Credit_Limit').asfloat := StrToFloatDef(edtCreditLimit.Text, 0, FormatSettings);

      parambyname('Invoice_Label').asstring := edtInvoiceLabel.Text;

      If edtNoOfEmployees.Text = '' then
        parambyname('No_of_Employees').asinteger := 0
      else
        parambyname('No_of_Employees').asinteger := strtoint(edtNoOfEmployees.Text);

      case cmbbxEndUserPriceFactor.itemindex of
        1: parambyname('End_User_Price_Factor').asstring := 'M';
        2: parambyname('End_User_Price_Factor').asstring := 'X';
      else
        parambyname('End_User_Price_Factor').asstring := '';
      end;


      if trim(edtEndUserMarkup.Text) = '' then
        parambyname('End_User_Markup_Percentage').asfloat := 0.00
      else
        parambyname('End_User_Markup_Percentage').asfloat := StrToFloatDef(edtEndUserMarkup.Text, 0, FormatSettings);

      if chkbxInactive.Checked then
        parambyname('Not_Active').asstring := 'Y'
      else
        parambyname('Not_Active').asstring := 'N';

      if chkbxOnline.checked then
        parambyname('Use_Online_Ordering').asstring := 'Y'
      else
        parambyname('Use_Online_Ordering').asstring := 'N';

      if chkbxUseforGeneralQuoting.checked then
        parambyname('Use_For_General_Quoting').asstring := 'Y'
      else
        parambyname('Use_For_General_Quoting').asstring := 'N';

      if chkbxShowLabourCharges.checked then
        parambyname('Separate_Labour_Invoice_Value').asstring := 'Y'
      else
        parambyname('Separate_Labour_Invoice_Value').asstring := 'N';

      if chkbxFactored.checked then
        parambyname('Account_Is_Factored').asstring := 'Y'
      else
        parambyname('Account_Is_Factored').asstring := 'N';

      if chkbxSpeculative.checked then
        parambyname('Customer_is_Speculative').asstring := 'Y'
      else
        parambyname('Customer_is_Speculative').asstring := 'N';

      if chkbxProspect.checked then
        parambyname('Prospect').asstring := 'Y'
      else
        parambyname('Prospect').asstring := 'N';

      if trim(edtActionDate.Text) <> '' then
        parambyname('Prospect_Action_Next_Date').asdatetime := paDatestr(edtActionDate.Text)
      else
        parambyname('Prospect_Action_Next_Date').clear;

      frmWTDBMemo.UpdMemoData(Self);
      if frmWTDBMemo.iNarr = 0 then
        parambyname('Narrative').Clear
      else
        parambyname('Narrative').AsInteger := frmWTDBMemo.iNarr;

      parambyname('CutOut_Discount').asfloat := StrToFloatDef(edtCutOutDiscount.Text, 0, FormatSettings);
      parambyname('Edge_Discount').asfloat := StrToFloatDef(edtEdgeDiscount.Text, 0, FormatSettings);
      parambyname('Worktop_Discount').asfloat := StrToFloatDef(edtWorktopDiscount.Text, 0, FormatSettings);
      parambyname('Survey_Price').asfloat := StrToFloatDef(edtSurveyPrice.Text, 0, FormatSettings);
      parambyname('Installation_Price').asfloat := StrToFloatDef(edtInstallationPrice.Text, 0, FormatSettings);
      parambyname('Delivery_Price').asfloat := StrToFloatDef(edtDeliveryPrice.Text, 0, FormatSettings);

      parambyname('Unit_Cost').asfloat := StrToFloatDef(edtUnitCost.Text, 0, FormatSettings);

      if dblkpProspectStatus.keyvalue = 0 then
        parambyname('Prospect_Status').clear
      else
        parambyname('Prospect_Status').asinteger := dblkpProspectStatus.KeyValue;

      if dblkpProspectAction.keyvalue = 0 then
        parambyname('Prospect_Action').clear
      else
        parambyname('Prospect_Action').asinteger := dblkpProspectAction.KeyValue;

      if dblkpProspectContact.keyvalue = 0 then
        parambyname('Contact_no').clear
      else
        parambyname('Contact_no').asinteger := dblkpProspectContact.KeyValue;

      if dblkpProspectOperator.keyvalue = 0 then
        parambyname('Prospect_Action_Operator').clear
      else
        parambyname('Prospect_Action_Operator').asinteger := dblkpProspectOperator.KeyValue;

      execsql;
    end;
  end;
end;

function TfrmWtMaintCustomer.GetNextKey: integer;
var
  aGuid: TGuid;
  sText: string;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert customer record
    with qryAdd do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Customer').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWtMaintCustomer.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer ' +
            '(Customer, Customer_Type, Vat, Customer_Name) ' +
            'VALUES(0, 1, 2, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintCustomer.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer Where Customer = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;


procedure TfrmWtMaintCustomer.edtAccountCodeEnter(Sender: TObject);
begin
  sOldValue := edtAccountCode.Text;
  dbgAccountCodes.Visible := true;
  btnOK.default := false;
end;

procedure TfrmWtMaintCustomer.edtAccountCodeChange(Sender: TObject);
begin
  with qryGetAccountCodes do
    begin
      close;
      parambyname('Account_Code').asstring := (Sender as TEdit).text + '%';
      parambyname('Customer').asinteger := Customer;
      open;
    end;

end;

procedure TfrmWtMaintCustomer.edtAccountCodeExit(Sender: TObject);
begin
  if (Sender as TEdit).Text = '' then
    begin
      dbgAccountCodes.Visible := false;
      btnOK.Default := true;
      exit;
    end;

  with qryCheckCustAccExists do
  begin
    Close;
    ParamByName('Account_Code').AsString := (Sender as TEdit).Text;
    ParamByName('Customer').AsInteger := Customer;
    Open;
    First;
    if (not EOF) then
      begin
        MessageDlg('The account code: ' + (Sender as TEdit).Text + ' is already in use on customer: ' + FieldByName('Customer_Name').AsString, mtError, [mbOK], 0);
       (Sender as TEdit).Text := sOldValue;
       (Sender as TEdit).SetFocus;
      end
    else
      dbgAccountCodes.Visible := false;
  end;

  btnOK.Default := true;
end;

procedure TfrmWtMaintCustomer.dbgMaterialTypesDblClick(Sender: TObject);
begin
  if dbgMaterialTypes.DataSource.DataSet.FieldByName('Description').asstring <> '' then
    btnMTChangeClick(self);

end;

procedure TfrmWtMaintCustomer.btnMTAddClick(Sender: TObject);
begin
  CallMaintMaterialTypes('A');
end;

procedure TfrmWtMaintCustomer.btnMTChangeClick(Sender: TObject);
begin
  CallMaintMaterialTypes('C');

end;

procedure TfrmWtMaintCustomer.btnMTDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Customer_Material_Type WHERE ID = ' + inttostr(dbgMaterialTypes.DataSource.dataset.fieldbyname('ID').asinteger);
            execsql;
          end;
        ShowMaterialTypes;
      except
        messagedlg(dbgMaterialTypes.DataSource.dataset.fieldbyname('Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWtMaintCustomer.dbgMaterialTypesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgMaterialTypes.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).Canvas.Font.Color := clNavy;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmWtMaintCustomer.chkbxShowInactiveMaterialTypesClick(Sender: TObject);
begin
  ShowMaterialTypes;
end;

end.
