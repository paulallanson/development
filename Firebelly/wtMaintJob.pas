unit wtMaintJob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons,
  Grids, DBCtrls, wtJobsDm, CRControls, AllCommon, DB, Spin, wtSalesOrderDM, ImgList, ShellAPI, QrCtrls, Menus,
  ToolWin, Inifiles, taoMapi, Activex, AxCtrls, Clipbrd, ComObj, ShellCtrls, System.ImageList, FireDAC.Stan.Param,
  PJDropFiles, DragDrop, DropTarget, DragDropFile;

type
  TfrmWTMaintJob = class(TForm)
    pnlTop: TPanel;
    stsbrDetails: TStatusBar;
    Panel2: TPanel;
    pgDetails: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    edtJobNumber: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    TabSheet5: TTabSheet;
    tbDocuments: TTabSheet;
    Label10: TLabel;
    sgElements: TStringGrid;
    sgCutOuts: TStringGrid;
    sgEdges: TStringGrid;
    sgExtras: TStringGrid;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Panel4: TPanel;
    Label11: TLabel;
    pnlCutOuts: TPanel;
    btnAddCutOuts: TBitBtn;
    btnChangeCutOuts: TBitBtn;
    btnDeleteCutOuts: TBitBtn;
    pnlEdges: TPanel;
    btnAddEdges: TBitBtn;
    btnChangeEdges: TBitBtn;
    btnDeleteEdges: TBitBtn;
    pnlExtras: TPanel;
    btnAddExtras: TBitBtn;
    btnChangeExtras: TBitBtn;
    btnDeleteExtras: TBitBtn;
    lblDeletePrompt: TLabel;
    edtNettPrice: TMemo;
    dtpckDate: TDateTimePicker;
    Label15: TLabel;
    dblkpOperator: TDBLookupComboBox;
    tbCustomer: TTabSheet;
    Label4: TLabel;
    Label18: TLabel;
    btnCustomerSearch: TBitBtn;
    Label6: TLabel;
    Label19: TLabel;
    dblkpMaterial: TDBLookupComboBox;
    Label7: TLabel;
    Label5: TLabel;
    edtReference: TEdit;
    Label20: TLabel;
    Label23: TLabel;
    pnlAddress: TPanel;
    edtCustomerName: TEdit;
    edtStreet: TEdit;
    edtlocale: TEdit;
    edtTown: TEdit;
    edtPostcode: TEdit;
    edtCounty: TEdit;
    edtContact: TEdit;
    btnContactSearch: TBitBtn;
    pnlPlanning: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    pnlElts: TPanel;
    btnAddElts: TBitBtn;
    btnChangeElts: TBitBtn;
    btnDeleteElts: TBitBtn;
    Panel12: TPanel;
    pnlUpstands: TPanel;
    btnAddUpstds: TBitBtn;
    btnChangeUpstds: TBitBtn;
    btnDeleteUpstds: TBitBtn;
    sgUpstands: TStringGrid;
    Label17: TLabel;
    edtCustomerPO: TEdit;
    TabSheet9: TTabSheet;
    Panel9: TPanel;
    Panel3: TPanel;
    Panel8: TPanel;
    pnlEvents: TPanel;
    btnAddEvents: TBitBtn;
    btnChangeEvents: TBitBtn;
    btnDeleteEvents: TBitBtn;
    sgEvents: TStringGrid;
    memEventNotes: TMemo;
    Email: TLabel;
    edtEmail: TEdit;
    edtTelephone: TEdit;
    Telephone: TLabel;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    dtpckTemplate: TDateTimePicker;
    dtpckProduction: TDateTimePicker;
    dtpckFitting: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edtTemplate: TEdit;
    btntemplate: TBitBtn;
    edtProduction: TEdit;
    BitBtn3: TBitBtn;
    edtFitting: TEdit;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    edtDescription: TMemo;
    tbInstallation: TTabSheet;
    Panel22: TPanel;
    pnlRiskNotes: TPanel;
    pnlInstall: TPanel;
    memInstallAdd: TMemo;
    Label34: TLabel;
    spnDepositTerms: TSpinEdit;
    edtDepositPaid: TCREditMoney;
    Label35: TLabel;
    TabSheet10: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    lblDiscountRate: TLabel;
    edtDiscountRate: TCREditMoney;
    lblDiscountValue: TLabel;
    Label36: TLabel;
    edtQuoted: TMemo;
    lblVatRate: TLabel;
    lblVat: TLabel;
    edtVatValue: TMemo;
    lblTotal: TLabel;
    edtGrossPrice: TMemo;
    edtQNettPrice: TMemo;
    Label37: TLabel;
    edtDifference: TMemo;
    Label38: TLabel;
    edtDeliveryPrice: TMemo;
    edtSurveyPrice: TMemo;
    edtInstallPrice: TMemo;
    edtDiscountValue: TMemo;
    btnGlobalElts: TBitBtn;
    TabSheet11: TTabSheet;
    sgRemedials: TStringGrid;
    pnlRemedials: TPanel;
    btnAddRems: TBitBtn;
    btnChangeRems: TBitBtn;
    btnDeleteRems: TBitBtn;
    Label39: TLabel;
    dblkpFitter: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    Label24: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    memNett: TMemo;
    lbldifference: TLabel;
    memVat: TMemo;
    memTotal: TMemo;
    Label42: TLabel;
    Label43: TLabel;
    lblVATRate1: TLabel;
    Label44: TLabel;
    imgDocuments: TImageList;
    edtDateRequired: TEdit;
    btnDateRequired: TBitBtn;
    memRiskNotes: TMemo;
    Panel5: TPanel;
    Panel1: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    edtInstallName: TEdit;
    edtInstallNumber: TEdit;
    Panel6: TPanel;
    svDlgOfficeDoc: TSaveDialog;
    imgIcons: TImageList;
    DocOpenDialog: TOpenDialog;
    ToolBar1: TToolBar;
    btnExcel: TToolButton;
    btnWord: TToolButton;
    btnEmail: TToolButton;
    btnAttach: TToolButton;
    edtWasteValue: TMemo;
    Label12: TLabel;
    Label63: TLabel;
    edtProject: TEdit;
    Label59: TLabel;
    Memo4: TMemo;
    lblDesigner: TLabel;
    dblkpShowroom: TDBLookupComboBox;
    dblkpDesigner: TDBLookupComboBox;
    btnDesigner: TBitBtn;
    pmnuDocuments: TPopupMenu;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    N2: TMenuItem;
    pmnuSelectAll: TMenuItem;
    chkbxDeclined: TCheckBox;
    lblReason: TLabel;
    dblkpReason: TDBLookupComboBox;
    btnReason: TButton;
    tbNotes: TTabSheet;
    Panel7: TPanel;
    Label13: TLabel;
    memNotes: TMemo;
    stvDocuments: TShellTreeView;
    slvDocuments: TShellListView;
    DropFileTarget1: TDropFileTarget;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure edtReferenceChange(Sender: TObject);
    procedure edtInstallPriceChange(Sender: TObject);
    procedure edtSurveyPriceChange(Sender: TObject);
    procedure edtDeliveryPriceChange(Sender: TObject);
    procedure btnCustomerSearchClick(Sender: TObject);
    procedure dblkpMaterialClick(Sender: TObject);
    procedure btnAddEltsClick(Sender: TObject);
    procedure btnChangeEltsClick(Sender: TObject);
    procedure btnAddCutOutsClick(Sender: TObject);
    procedure btnChangeCutOutsClick(Sender: TObject);
    procedure btnAddEdgesClick(Sender: TObject);
    procedure btnChangeEdgesClick(Sender: TObject);
    procedure btnAddExtrasClick(Sender: TObject);
    procedure btnChangeExtrasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtContactChange(Sender: TObject);
    procedure btnAddUpstdsClick(Sender: TObject);
    procedure btnChangeUpstdsClick(Sender: TObject);
    procedure btnContactSearchClick(Sender: TObject);
    procedure edtDiscountRateChange(Sender: TObject);
    procedure edtDiscountValueChange(Sender: TObject);
    procedure edtDiscountRateEnter(Sender: TObject);
    procedure edtDiscountRateExit(Sender: TObject);
    procedure edtDiscountValueEnter(Sender: TObject);
    procedure edtDiscountValueExit(Sender: TObject);
    procedure btnDeleteEltsClick(Sender: TObject);
    procedure btnDeleteCutOutsClick(Sender: TObject);
    procedure btnDeleteEdgesClick(Sender: TObject);
    procedure btnDeleteUpstdsClick(Sender: TObject);
    procedure btnDeleteExtrasClick(Sender: TObject);
    procedure edtCustomerPOChange(Sender: TObject);
    procedure sgEventsClick(Sender: TObject);
    procedure sgEventsDblClick(Sender: TObject);
    procedure btnDeleteEventsClick(Sender: TObject);
    procedure btnChangeEventsClick(Sender: TObject);
    procedure btnAddEventsClick(Sender: TObject);
    procedure dtpckTemplateChange(Sender: TObject);
    procedure dtpckProductionChange(Sender: TObject);
    procedure dtpckFittingChange(Sender: TObject);
    procedure edtTemplateExit(Sender: TObject);
    procedure btntemplateClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtInstallPriceExit(Sender: TObject);
    procedure edtCustomerNameChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtDepositPaidChange(Sender: TObject);
    procedure spnDepositTermsChange(Sender: TObject);
    procedure btnGlobalEltsClick(Sender: TObject);
    procedure sgElementsDblClick(Sender: TObject);
    procedure sgCutOutsDblClick(Sender: TObject);
    procedure sgEdgesDblClick(Sender: TObject);
    procedure sgUpstandsDblClick(Sender: TObject);
    procedure sgExtrasDblClick(Sender: TObject);
    procedure btnAddRemsClick(Sender: TObject);
    procedure btnChangeRemsClick(Sender: TObject);
    procedure btnDeleteRemsClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtInstallNameChange(Sender: TObject);
    procedure edtInstallNumberChange(Sender: TObject);
    procedure btnDesignerClick(Sender: TObject);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure btnDateRequiredClick(Sender: TObject);
    procedure edtDateRequiredExit(Sender: TObject);
    procedure mnuOpenDocumentClick(Sender: TObject);
    procedure mnuDeleteDocumentClick(Sender: TObject);
    procedure pmnuDocumentsPopup(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnWordClick(Sender: TObject);
    procedure sgRemedialsDblClick(Sender: TObject);
    procedure edtProjectChange(Sender: TObject);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure btnReasonClick(Sender: TObject);
    procedure chkbxDeclinedClick(Sender: TObject);
    procedure slvDocumentsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure stvDocumentsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure stvDocumentsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tbDocumentsShow(Sender: TObject);
    procedure DropFileTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
  private
    Descending: Boolean;
    SortedColumn: Integer;
    FRetailCustomer: bytebool;
    FJob: TJob;
    FUseMarkup: bytebool;
    FActivated: Boolean;
    FMode: TjMode;
    procedure ShowElements;
    procedure ShowUpstands;
    procedure ShowCutOuts;
    procedure ShowEdges;
    procedure ShowRemedials;
    procedure ShowExtras;
    procedure ShowDetails;
    procedure ShowEvents;
    procedure ShowTotals;
    procedure ShowDiscount;
    procedure ShowDocuments;
    procedure ShowSalesOrderDocuments;
    procedure ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
    procedure BuildElementGrid;
    procedure BuildEdgeGrid;
    procedure BuildEventGrid;
    procedure BuildExtraGrid;
    procedure BuildCutOutGrid;
    procedure BuildRemedialGrid;
    procedure BuildUpstandGrid;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure SetGridHeaders;
    procedure SetRetailCustomer(const Value: bytebool);
    procedure SetAddressFields(tempCode: integer);
    procedure ClearAddressFields;
    procedure CallMaintElement(aMode: TjelMode);
    procedure CallMaintCutOut(aMode: TjcoMode);
    procedure CallMaintEdge(aMode: TjedgMode);
    procedure CallMaintExtra(aMode: TjexMode);
    procedure CallMaintRemedials(aMode: TjremMode);
    procedure EnablePanels;
    procedure EnableAddButtons;
    function ShowNotes(TempNotes: integer): string;
    function UpdateNotes: Integer;
    procedure CallMaintUpstand(aMode: TjelMode);
    procedure SetJob(const Value: TJob);
    procedure CallMaintEvent(aMode: TjevMode);
    function InputDate(TempDate: TDateTime): TDateTime;
    function UpdateInstallAddress: Integer;
    procedure CreateSalesOrder;
    function UpdateRiskNotes: Integer;
    procedure MoveSalesDocument;
    procedure SendAndSaveEmail(sTo, sSubject: string);
    procedure SetUseMarkup(const Value: bytebool);
    procedure ProcessDragAndDrop;
    function GetFilesPath: string;
    procedure SetMode(const Value: TjMode);
  public
    bOK: boolean;
    bChangeRate: boolean;
    bChangeValue: boolean;
    property Mode: TjMode read FMode write SetMode;
    property Job: TJob read FJob write SetJob;
    property RetailCustomer: bytebool read FRetailCustomer write SetRetailCustomer;
    property UseMarkup: bytebool read FUseMarkup write SetUseMarkup;
  end;

var
  frmWTMaintJob: TfrmWTMaintJob;

implementation

uses
  wtCommon, WTSrchCustomer, wtMain, wtNotesDM, wtDataModule, WTSrchCustContacts, wtMaintJElement, WTExcelOLE,
  wtMaintJUpstand, wtMaintJEdge, wtMaintJExtra, wtMaintJCutOut, wtMaintJEvents, DateSelV5, wtLUMatType, wtLUReason,
  wtMaintJElementM, WTMaintJRemedial, wtLUFitters, WTLUDesigner, WTMaintEmail, WTWordOLE, System.UITypes;

{$R *.DFM}

{ TfrmWtMaintJob }

procedure TfrmWTMaintJob.SetMode(const Value: TjMode);
begin
  FMode := Value;
end;

procedure TfrmWTMaintJob.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    bChangeRate := false;
    bChangeValue := false;

    dtmdlWorktops.qryCompany.close;
    dtmdlWorktops.qryCompany.open;

    dblkpMaterial.listSource := Job.DataModule.dtsMaterial;
    Job.DataModule.qryMaterial.Close;
    Job.DataModule.qryMaterial.open;

    dblkpOperator.listSource := Job.DataModule.dtsOperator;
    Job.DataModule.qryOperator.Close;
    Job.DataModule.qryOperator.open;

    dblkpFitter.listSource := Job.DataModule.dtsFitter;
    Job.DataModule.qryFitter.Close;
    Job.DataModule.qryFitter.open;
    if Job.DataModule.qryFitter.recordcount = 1 then
      dblkpFitter.KeyValue := Job.DataModule.qryFitter.fieldbyname('Fitter').asinteger;

    dblkpDesigner.listSource := Job.DataModule.dtsDesigner;
    Job.DataModule.qryDesigner.close;
    Job.DataModule.qryDesigner.open;

    dblkpShowroom.listSource := Job.DataModule.dtsBranch;
    Job.DataModule.qryBranch.close;
    Job.DataModule.qryBranch.parambyname('Customer').asinteger := Job.Customer;
    job.DataModule.qryBranch.open;

    dblkpReason.listsource := Job.DataModule.dtsReason;
    Job.DataModule.qryReason.close;
    Job.DataModule.qryReason.open;
    Job.DataModule.qryReason.First;

    case Mode of
    jAdd     : Caption := 'Add a Job';
    jChange  : Caption := 'Change a Job';
    jDelete  : Caption := 'Delete a Job';
    jCopy   : Caption := 'Copy a Job';
    jConvert   : Caption := 'Convert a Quote to Job';
    end;  { case }
    if (Mode = jAdd) or (Mode = jCopy) or (Mode = jConvert) then
      sTemp := ' New Job '
    else
      sTemp := ' Job ' + IntToStr(Job.DbKey) + ' ';

    if Mode = jCopy then
      Job.DbKey := 0;

    ShowDetails;
    ShowElements;
    ShowUpstands;
    ShowCutOuts;
    ShowEdges;
    ShowExtras;
    ShowRemedials;
    ShowEvents;
    if (Mode = jConvert) and (Job.DataModule.SalesOrder <> 0) then
      ShowSalesOrderDocuments
    else
      ShowDocuments;

    ShowTotals;

    {Had to put this in because the components where losing the Listdatasource}
    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintJob.ShowDetails;
begin
  if Mode = jAdd then
    begin
      edtJobNumber.text := '<New Job>';
      dblkpOperator.keyvalue := frmWTMain.Operator;

      dtpckDate.Date := date;
      edtDateRequired.text := '';
      edtCustomerName.text := '';
      edtProject.text := '';
      edtReference.text := '';
      edtCustomerPO.text := '';
      edtContact.text := '';
      edtDescription.text := '';
      lblVatRate.caption := '';
      lblVatRate1.caption := '';
      edtInstallName.text := '';
      edtInstallNumber.text := '';

      dtpckTemplate.Date := date;
      dtpckProduction.Date := date;
      dtpckFitting.Date := Date;

      edtTemplate.text := '';
      edtProduction.text := '';
      edtFitting.text := '';

      spnDepositTerms.value := 0;
      edtNettPrice.text := formatfloat('0.00',0.00);
      edtQNettPrice.text := formatfloat('0.00',0.00);
      edtQuoted.text := formatfloat('0.00',0.00);
      edtVatValue.text := formatfloat('0.00',0.00);
      edtdepositPaid.text := formatfloat('0.00',0.00);
      edtGrossPrice.text := formatfloat('0.00',0.00);
      edtInstallPrice.text := formatfloat('0.00',dtmdlWorktops.qryCompany.fieldbyname('Install_rate').asfloat);
      edtDeliveryPrice.text := formatfloat('0.00',0.00);
      edtSurveyPrice.text := formatfloat('0.00',dtmdlWorktops.qryCompany.fieldbyname('Survey_rate').asfloat);
      edtDiscountRate.text := formatfloat('0.00',0.00);
      edtDiscountValue.text := formatfloat('0.00',0.00);
      edtWasteValue.text := formatfloat('0.00',0.00);

      memNett.Text := formatfloat('0.00',0.00);
      memVat.Text := formatfloat('0.00',0.00);
      memTotal.Text := formatfloat('0.00',0.00);

      memInstallAdd.lines.clear;
      memRiskNotes.Lines.clear;
      self.RetailCustomer := false;
      self.UseMArkup := false;

      chkbxDeclined.Visible := false;
      chkbxDeclined.Checked := false;

    end
  else
    begin
      if Job.dbKey = 0 then
        begin
          edtJobNumber.text := '<New Job>';
          dtpckDate.Date := date;
          edtDateRequired.text := '';
          edtCustomerPO.text := Job.CustomerPO;

          if Job.TemplateDate = 0 then
            dtpckTemplate.Date := date
          else
            dtpckTemplate.Date := Job.TemplateDate;

          dtpckProduction.Date := date;
          dtpckFitting.Date := Job.InstallDate;

          edtTemplate.text := '';
          edtProduction.text := '';
          edtFitting.text := '';

          chkbxDeclined.Checked := false;
        end
      else
        begin
          edtJobNumber.text := inttostr(Job.dbKey);
          dtpckDate.Date := Job.JDate;
          edtDateRequired.text := paDateStr(Job.DateRequired);
          edtCustomerPO.text := Job.CustomerPO;

          dtpckTemplate.Date := Job.TemplateDate;
          dtpckProduction.Date := Job.ProductionDate;
          dtpckFitting.Date := Job.InstallDate;

          edtTemplate.text := paDateStr(Job.ActTempDate);
          edtProduction.text := paDateStr(Job.ActProdDate);
          edtFitting.text := paDateStr(Job.ActInstallDate);
          dblkpFitter.KeyValue := Job.Fitter;

          chkbxDeclined.Checked := (Job.Inactive = 'Y');
          dblkpReason.KeyValue := Job.Reason;

          dtmdlWorktops.CreateJobDocDirectory(inttostr(job.dbKey));
        end;
      dblkpDesigner.KeyValue := Job.DesignerID;
      dblkpShowroom.KeyValue := Job.Branch;
      edtProject.Text := Job.ProjectReference;
      edtReference.text := Job.Reference;
      dblkpMaterial.keyvalue := Job.Material;
      dblkpOperator.KeyValue := Job.Operator;
      edtCustomerName.text := Job.CustomerName;
      edtDescription.text := Job.description;
      edtContact.text := Job.ContactName;
      self.RetailCustomer := (Job.Address <> 0) and (not Job.Speculative);
      self.UseMarkup := self.RetailCustomer and dtmdlWorktops.PricesAreTrade;

      if Job.Address = 0 then
        SetAddressFields(Job.Customer)
      else
        SetAddressFields(Job.Address);


      memNotes.text := ShowNotes(Job.ExtraNotes);

      memInstallAdd.Text := ShowNotes(Job.InstallAddress);

      memRiskNotes.Text := ShowNotes(Job.RiskNotes);
      
      edtInstallName.text := Job.InstallContact;
      edtInstallNumber.text := Job.InstallPhone;

      spnDepositTerms.value := round(Job.DepositTerms);
      edtdepositPaid.text := formatfloat('0.00',Job.DepositAmount);
      edtInstallPrice.Text := formatfloat('0.00',Job.InstallPrice);
      edtSurveyPrice.Text := formatfloat('0.00',Job.SurveyPrice);
      edtDeliveryPrice.Text := formatfloat('0.00',Job.DeliveryPrice);
      edtWasteValue.Text := formatfloat('0.00',Job.WasteValue);

      if self.UseMarkup then
        begin
          edtDiscountRate.Text := formatfloat('0.00',Job.MarkupRate);
          edtDiscountValue.text := formatfloat('0.00',Job.MarkupValue);
        end
      else
        begin
          edtDiscountRate.Text := formatfloat('0.00',Job.DiscountRate);
          edtDiscountValue.text := formatfloat('0.00',Job.DiscountValue);
        end;

      lblVatRate.caption := formatfloat('0.00',Job.VatRate);

      edtQNettPrice.Text := formatfloat('0.00',Job.QuoteNettPrice);
      edtQuoted.Text := formatfloat('0.00',Job.QuoteNettPrice);
      ShowTotals;
    end;

  pnlTop.enabled := not(Mode = jView) and not(Mode = jDelete) and not(Mode = jRestrict);
  EnablePanels;
  EnableAddButtons;
  btnOK.Visible := not(Mode = jView);
  lbldeleteprompt.visible := (Mode = jDelete);
  if (Mode = jView) or (Mode = jDelete) then
    begin
    end;
  CheckOK(self);

end;

function TfrmWTMaintJob.ShowNotes(TempNotes: integer): string;
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

function TfrmWTMaintJob.UpdateInstallAddress: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := Job.InstallAddress;
    Notes.DataInfo := memInstallAdd.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintJob.UpdateRiskNotes: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := Job.RiskNotes;
    Notes.DataInfo := memRiskNotes.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintJob.UpdateNotes: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := Job.ExtraNotes;
    Notes.DataInfo := memNotes.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

procedure TfrmWTMaintJob.CheckOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtCustomerName.Text <> '') and
                    (edtDescription.Text <> '') and
                    (edtReference.Text <> '') and
                    (edtCustomerPO.Text <> '') and
                    (dblkpMaterial.keyvalue <> 0);
end;

procedure TfrmWTMaintJob.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
    rowcount := 2;
    end;
end;

procedure TfrmWTMaintJob.ShowCutOuts;
begin
  if Mode = jAdd then
    begin
      ClearGrid(sgCutOuts);  {Clear contents of Line grid}
      BuildCutOutGrid;
    end
  else
    begin
      ClearGrid(sgCutOuts);  {Clear contents of Line grid}
      BuildCutOutGrid;
    end;
end;

procedure TfrmWTMaintJob.ShowEdges;
begin
  if Mode = jAdd then
    begin
      ClearGrid(sgEdges);  {Clear contents of Line grid}
      BuildEdgeGrid;
    end
  else
    begin
      ClearGrid(sgEdges);  {Clear contents of Line grid}
      BuildEdgeGrid;
    end;

end;

procedure TfrmWTMaintJob.ShowTotals;
var
  valdiff: real;
  rNett, rVat: real;
begin
  edtNettPrice.Text := formatfloat('0.00',Job.TotalPrice);
  edtVatValue.Text := formatfloat('0.00',Job.TotalVat);
  edtGrossPrice.Text := formatfloat('0.00',Job.TotalGross);

  rNett := (Job.TotalPrice-Job.DiscountValue+job.InstallPrice+job.SurveyPrice+Job.DeliveryPrice+Job.MarkupValue+Job.WasteValue);
  memNett.Text := formatfloat('0.00',rNett);

  rVat := rNett*(Job.VatRate/100);
  memVat.Text := formatfloat('0.00',rVat);

  memTotal.Text := formatfloat('0.00',rNett+rVat);
  lblVatRate1.caption := formatfloat('0.00',Job.VatRate)+'%';

  edtDifference.Text := formatfloat('0.00',(Job.TotalPrice-Job.QuoteNettPrice));
  try
    if Job.QuoteNettPrice <> 0 then
      begin
        ValDiff := ((Job.TotalPrice-Job.QuoteNettPrice)/Job.QuoteNettPrice)*100;
        lblDifference.caption := formatfloat('0.00',ValDiff) +'%'
      end
    else
      lblDifference.caption := formatfloat('0.00',0.00) +'%'
  except
    lblDifference.caption := '999.99%'
  end;
end;

procedure TfrmWTMaintJob.ShowElements;
begin
  if Mode = jAdd then
    begin
      ClearGrid(sgElements);  {Clear contents of Line grid}
      BuildElementGrid;
    end
  else
    begin
      ClearGrid(sgElements);  {Clear contents of Line grid}
      BuildElementGrid;
    end;
end;

procedure TfrmWTMaintJob.ShowUpstands;
begin
  if Mode = jAdd then
    begin
      ClearGrid(sgUpstands);  {Clear contents of Line grid}
      BuildUpstandGrid;
    end
  else
    begin
      ClearGrid(sgUpstands);  {Clear contents of Line grid}
      BuildUpstandGrid;
    end;
end;

procedure TfrmWTMaintJob.ShowExtras;
begin
  if Mode = jAdd then
    begin
      ClearGrid(sgExtras);  {Clear contents of Line grid}
      BuildExtraGrid;
    end
  else
    begin
      ClearGrid(sgExtras);  {Clear contents of Line grid}
      BuildExtraGrid;
    end;
end;

procedure TfrmWTMaintJob.ShowRemedials;
begin
  ClearGrid(sgRemedials);  {Clear contents of Line grid}
  BuildRemedialGrid;
end;

procedure TfrmWTMaintJob.BuildElementGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgElements, Job.datamodule do
    begin
      for i := 0 to pred(Job.Elements.count) do
        begin
        cells[0,i+1] := inttostr(Job.Elements[i].jENumber);
        cells[1,i+1] := Job.Elements[i].worktopDesc;
        cells[2,i+1] := Job.Elements[i].thicknessDesc;
        cells[3,i+1] := inttostr(Job.Elements[i].Length);
        cells[4,i+1] := floattostr(Job.Elements[i].depth);
        cells[5,i+1] := floattostr(Job.Elements[i].Quantity);
        cells[6,i+1] := formatfloat('0.00',Job.Elements[i].UnitPrice);
        cells[7,i+1] := formatfloat('0.00',Job.Elements[i].TotalPrice);
        cells[8,i+1] := Job.Elements[i].ElementDescription;

        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeElts.enabled := not (Job.Elements.count = 0);
  btnDeleteElts.enabled := not (Job.Elements.count = 0);
  btnGlobalElts.enabled := not (Job.Elements.count = 0);

end;

procedure TfrmWTMaintJob.BuildUpstandGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgUpstands, Job.datamodule do
    begin
      for i := 0 to pred(Job.Upstands.count) do
        begin
        cells[0,i+1] := inttostr((Job.Upstands[i].jENumber - 1000));
        cells[1,i+1] := Job.Upstands[i].worktopDesc;
        cells[2,i+1] := Job.Upstands[i].thicknessDesc;
        cells[3,i+1] := floattostr(Job.Upstands[i].depth);
        cells[4,i+1] := inttostr(Job.Upstands[i].Length);
        cells[5,i+1] := floattostr(Job.Upstands[i].Quantity);
        cells[6,i+1] := formatfloat('0.00',Job.Upstands[i].UnitPrice);
        cells[7,i+1] := formatfloat('0.00',Job.Upstands[i].TotalPolishPrice);
        cells[8,i+1] := formatfloat('0.00',Job.Upstands[i].TotalPrice);
        if trim(Job.Upstands[i].MaterialUseDescr) = '' then
          cells[9,i+1] := 'Upstand'
        else
          cells[9,i+1] := Job.Upstands[i].MaterialUseDescr;
        cells[10,i+1] := inttostr(Job.Upstands[i].TotalUpstandPieces);

        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeUpstds.enabled := not (Job.Upstands.count = 0);
  btnDeleteUpstds.enabled := not (Job.Upstands.count = 0);

end;

procedure TfrmWTMaintJob.BuildCutOutGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgCutOuts, Job.datamodule do
    begin
      for i := 0 to pred(Job.CutOuts.count) do
        begin
        cells[0,i+1] := inttostr(Job.CutOuts[i].jCONumber);
        cells[1,i+1] := Job.CutOuts[i].CutOutDesc;
        cells[2,i+1] := Job.CutOuts[i].EdgeTypeDesc;
        cells[3,i+1] := floattostr(Job.CutOuts[i].Quantity);
        cells[4,i+1] := formatfloat('0.00',Job.CutOuts[i].UnitPrice);
        cells[5,i+1] := formatfloat('0.00',Job.CutOuts[i].TotalPrice);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeCutOuts.enabled := not (Job.CutOuts.count = 0);
  btnDeleteCutOuts.enabled := not (Job.CutOuts.count = 0);
end;

procedure TfrmWTMaintJob.BuildEdgeGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgEdges, Job.datamodule do
    begin
      for i := 0 to pred(Job.Edges.count) do
        begin
        cells[0,i+1] := inttostr(Job.Edges[i].jEdgNumber);
        cells[1,i+1] := Job.Edges[i].EdgeDesc;
        cells[2,i+1] := Job.Edges[i].EdgeTypeDesc;
        cells[3,i+1] := floattostr(Job.Edges[i].Length);
        cells[4,i+1] := formatfloat('0.00',Job.Edges[i].UnitPrice);
        cells[5,i+1] := formatfloat('0.00',Job.Edges[i].TotalPrice);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeEdges.enabled := not (Job.Edges.count = 0);
  btnDeleteEdges.enabled := not (Job.Edges.count = 0);
end;

procedure TfrmWTMaintJob.BuildExtraGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgExtras, Job.datamodule do
    begin
      for i := 0 to pred(Job.Extras.count) do
        begin
        cells[0,i+1] := inttostr(Job.Extras[i].jEXNumber);
        cells[1,i+1] := Job.Extras[i].ExtraDesc;
        cells[2,i+1] := floattostr(Job.Extras[i].Quantity);
        cells[3,i+1] := formatfloat('0.00',Job.Extras[i].UnitPrice);
        cells[4,i+1] := formatfloat('0.00',Job.Extras[i].TotalPrice);
        if Job.Extras[i].DoNotDiscount then
          cells[5,i+1] := 'No'
        else
          cells[5,i+1] := 'Yes';
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeExtras.enabled := not (Job.Extras.count = 0);
  btnDeleteExtras.enabled := not (Job.Extras.count = 0);
end;

procedure TfrmWTMaintJob.BuildRemedialGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgRemedials, Job.datamodule do
    begin
      for i := 0 to pred(Job.Remedials.count) do
        begin
        cells[0,i+1] := inttostr(Job.Remedials[i].RemedialNumber);
        cells[1,i+1] := copy(Job.Remedials[i].Narrative.DataInfo,1,30);
        cells[2,i+1] := Job.Remedials[i].FitterName;
        cells[3,i+1] := padatestr(Job.Remedials[i].InstallDate);
        cells[4,i+1] := formatfloat('0.00',Job.Remedials[i].Price);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeRems.enabled := not (Job.Remedials.count = 0);
  btnDeleteRems.enabled := not (Job.Remedials.count = 0);
end;

procedure TfrmWTMaintJob.SetGridHeaders;
begin
  {Element header}
  sgElements.cells[0,0] := 'No';
  sgElements.cells[1,0] := 'Worktop';
  sgElements.cells[2,0] := 'Thick (mm)';
  sgElements.cells[3,0] := 'Length (mm)';
  sgElements.cells[4,0] := 'Depth (mm)';
  sgElements.cells[5,0] := 'Qty';
  sgElements.cells[6,0] := 'Unit Price';
  sgElements.cells[7,0] := 'Total';
  sgElements.cells[8,0] := 'Description';

  {Upstand header}
  sgUpstands.cells[0,0] := 'No';
  sgUpstands.cells[1,0] := 'Material/Colour';
  sgUpstands.cells[2,0] := 'Thick (mm)';
  sgUpstands.cells[3,0] := 'Depth (mm)';
  sgUpstands.cells[4,0] := 'Length (mm)';
  sgUpstands.cells[5,0] := 'Qty';
  sgUpstands.cells[6,0] := 'Unit Price';
  sgUpstands.cells[7,0] := 'Polish Price';
  sgUpstands.cells[8,0] := 'Total';
  sgUpstands.cells[9,0] := 'Used for';
  sgUpstands.cells[10,0] := 'No. of Pieces';

  {CutOut header}
  sgCutOuts.cells[0,0] := 'No';
  sgCutOuts.cells[1,0] := 'Cutout';
  sgCutOuts.cells[2,0] := 'Edge Type';
  sgCutOuts.cells[3,0] := 'Qty';
  sgCutOuts.cells[4,0] := 'Unit Price';
  sgCutOuts.cells[5,0] := 'Total';

  {Edge header}
  sgEdges.cells[0,0] := 'No';
  sgEdges.cells[1,0] := 'Edge';
  sgEdges.cells[2,0] := 'Edge Type';
  sgEdges.cells[3,0] := 'Length (mm)';
  sgEdges.cells[4,0] := 'Unit Price';
  sgEdges.cells[5,0] := 'Total';

  {Edge header}
  sgExtras.cells[0,0] := 'No';
  sgExtras.cells[1,0] := 'Extra Charge';
  sgExtras.cells[2,0] := 'Quantity';
  sgExtras.cells[3,0] := 'Unit Price';
  sgExtras.cells[4,0] := 'Total';
  sgExtras.cells[5,0] := 'Discounted';

  {Remedial header}
  sgRemedials.cells[0,0] := 'No';
  sgRemedials.cells[1,0] := 'Remedial Work';
  sgRemedials.cells[2,0] := 'Fitter';
  sgRemedials.cells[3,0] := 'Proposed Date';
  sgRemedials.cells[4,0] := 'Price';

  {Event header}
  sgEvents.cells[0,0] := 'No';
  sgEvents.cells[1,0] := 'Date/Time';
  sgEvents.cells[2,0] := 'Operator';
end;

procedure TfrmWTMaintJob.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  SetGridHeaders;
  dtmdlNotes := TdtmdlNotes.create(self);
  bOK := false;
  pgDetails.ActivePage := tbCustomer;

  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintJob.btnOKClick(Sender: TObject);
begin
  bOK := true;
  if Mode = jDelete then
    if MessageDlg('Are you sure you want to delete this job?',
        mtConfirmation, [mbYes, mbNo], 1) = mrNo then
      exit;

  if ((Mode = jAdd) or (Mode = jconvert) or (Mode = jcopy) or (Mode = jChange)) then
    begin
      if trim(edtDateRequired.text) = '' then
        begin
          MessageDlg('Please enter a date required for this job', mterror, [mbOk], 0);
          edtDateRequired.SetFocus;
          exit;
        end;

      if chkbxDeclined.Checked and (dblkpReason.Text = '') then
        begin
          messagedlg('If the job is to be declined then please select a reason', mtError, [mbOk], 0);
          dblkpReason.setfocus;
          exit;
        end;
    end;

  if (Mode <> jDelete) and ((trim(memInstallAdd.Text) = '') and (trim(edtInstallName.Text) = '')) then
    begin
      MessageDlg('Installation details must be specified on the Installation tab', mtInformation,
        [mbOk], 0);
      pgdetails.ActivePage := tbInstallation;
      exit;
    end;

  if (Mode = jcopy) or (Mode = jConvert) then
    begin
      job.ExtraNotes := 0;
      job.Terms := 0;
      job.Availability := 0;
      job.Address := 0;
      job.InstallAddress := 0;
    end;

  if self.UseMarkup then
    begin
      Job.DiscountRate := 0;
      Job.DiscountValue := 0;
    end
  else
    begin
      Job.MarkupRate := 0;
      Job.MarkupValue := 0;
    end;

  Job.jDate := dtpckDate.date;
  Job.TemplateDate := dtpckTemplate.Date;
  Job.ProductionDate := dtpckProduction.Date;
  Job.DateRequired := paDateStr(edtDateRequired.Text);
  Job.installDate := dtpckFitting.Date;
  Job.Retail := self.RetailCustomer;

  Job.ExtraNotes := UpdateNotes;
  Job.Terms := 0;
  Job.Availability := 0;
  Job.InstallAddress := UpdateInstallAddress;
  Job.RiskNotes := UpdateRiskNotes;

  Job.Operator := dblkpOperator.keyvalue;

  {If declined then set the reason}
  if chkbxDeclined.checked then
    Job.Inactive := 'Y'
  else
    Job.Inactive := 'N';

  try
    Job.Reason := dblkpReason.KeyValue;
  except
    Job.Reason := 0;
  end;

  if dblkpFitter.Text = '' then
    Job.Fitter := 0
  else
    Job.Fitter := dblkpFitter.KeyValue;

  Job.ActInstallDate := paDateStr(edtFitting.text);
  Job.ActProdDate := paDateStr(edtProduction.text);
  Job.ActTempDate := paDateStr(edtTemplate.text);
  
  if dblkpDesigner.Text = '' then
    Job.DesignerID := 0
  else
    Job.DesignerID := dblkpDesigner.KeyValue;

  if dblkpShowroom.Text = '' then
    Job.Branch := 0
  else
    Job.Branch := dblkpShowroom.KeyValue;

  if RetailCustomer or Job.Speculative then
    Job.Address := Job.DataModule.SetAddress(Job.Address,
                                                edtCustomerName.text,
                                                edtStreet.text,
                                                edtLocale.text,
                                                edtTown.text,
                                                edtPostcode.text,
                                                edtCounty.text,
                                                edtTelephone.text,
                                                edtEmail.text);

  if (Mode = jAdd) or (Mode = jChange) or (Mode = jCopy) or (Mode = jConvert) or (Mode = jRestrict) then
    begin
      Job.SaveToDB(true);
      if Mode = jConvert then
        begin
          MoveSalesDocument;
        end;

      if (Mode = jAdd) or (Mode = jCopy) or (Mode = jConvert) then
        messagedlg('Job number '+ floattostr(Job.dbKey)+ ' created', mtInformation, [mbOk], 0);
(*      if Mode <> jChange then
        begin
          if MessageDlg('Do you want to create a sales order?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              CreateSalesOrder;
        end;
*)
    end
  else
  if (Mode = jDelete) then
    begin
      Job.Inactive := 'Y';
      Job.DeleteFromDB;
    end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintJob.MoveSalesDocument;
var
  sSource, sDest: string;
  ListItem: TListItem;
  irow: integer;
  icount: Integer;
begin

  sSource := dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(job.datamodule.SalesOrder) + '\' ;
  sDest :=  dtmdlWorktops.GetCompanyJobDirectory + '\' + inttostr(job.dbkey) + '\' ;

  try
    for icount := 0 to pred(slvDocuments.Items.Count) do
      begin
      //selected and NOT folder
        if NOT slvDocuments.Folders[icount].IsFolder then
          begin
            try
              filecopy(slvDocuments.Folders[icount].PathName, stringReplace(slvDocuments.Folders[icount].PathName,sSource,sDest,[rfReplaceAll, rfIgnoreCase]));
            except
            end;
          end
        else
          begin
            try
              directorycopy(slvDocuments.Folders[icount].PathName, stringReplace(slvDocuments.Folders[icount].PathName,sSource,sDest,[rfReplaceAll, rfIgnoreCase]));
            except
            end;
          end;
      end;
  finally
  end;

(*  for irow := 0 to pred(lstvwDocuments.items.count) do
    begin
      ListItem := lstvwDocuments.items[irow];
      //copy the file
      try
        filecopy(sSource+ListItem.Caption, sDest+ListItem.Caption);
      except
      end;
    end;
*)
end;

procedure TfrmWTMaintJob.edtDescriptionChange(Sender: TObject);
begin
  Job.Description := edtDescription.Text;
  CheckOK(self);
end;

procedure TfrmWTMaintJob.edtReferenceChange(Sender: TObject);
begin
  Job.Reference := edtReference.Text;
  CheckOK(self);
end;

procedure TfrmWTMaintJob.edtInstallPriceChange(Sender: TObject);
begin
  try
    Job.InstallPrice := StrToFloatDef(edtInstallPrice.text, 0, FormatSettings);
  except
    Job.InstallPrice := 0.00;
  end;
  ShowTotals;
end;

procedure TfrmWTMaintJob.edtSurveyPriceChange(Sender: TObject);
begin
  try
    Job.SurveyPrice := StrToFloatDef(edtSurveyPrice.text, 0, FormatSettings);
  except
    Job.SurveyPrice := 0.00;
  end;
  ShowTotals;
end;

procedure TfrmWTMaintJob.edtDeliveryPriceChange(Sender: TObject);
begin
  try
    Job.DeliveryPrice := StrToFloatDef(edtDeliveryPrice.text, 0, FormatSettings);
  except
    Job.DeliveryPrice := 0.00;
  end;
  ShowTotals;
end;

procedure TfrmWTMaintJob.btnCustomerSearchClick(Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Job.Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        Job.Customer := frmwtSrchCustomer.CodeSelected;
        Job.CustomerName := frmwtSrchCustomer.NameSelected;
        Job.DiscountRate := frmWTSrchCustomer.DiscountRate;
        Job.DepositTerms := frmWTSrchCustomer.DepositTerms;
        spnDepositTerms.Value := round(Job.DepositTerms);
        bChangeRate := true;
        edtDiscountRate.text := formatfloat('0.00',Job.DiscountRate);
        UseMarkup := false;
        bChangeRate := false;

        Job.Vat := frmwtSrchCustomer.Vat;
        Job.VatRate := Job.DataModule.GetVatRate(Job.Vat);
        edtCustomerName.text := frmwtSrchCustomer.NameSelected;
        RetailCustomer := frmwtSrchCustomer.RetailCustomer;
        Job.Speculative := frmwtSrchCustomer.Speculative;

        if (not RetailCustomer) AND (not Job.Speculative) then
          begin
            SetAddressFields(Job.Customer);
          end
        else
          begin
            if dtmdlWorktops.PricesAreTrade then
              UseMarkup := true;
            ClearAddressFields;
            pnlAddress.Enabled := true;
          end;
        ShowTotals;
      end
  finally
    frmwtSrchCustomer.free;
  end;
end;

procedure TfrmWTMaintJob.SetAddressFields(tempCode: integer);
begin
  ClearAddressFields;
  if (not Retailcustomer) AND (not Job.Speculative) then
    begin
      edtStreet.text := Job.dataModule.GetCustomerStreet(Job.Customer);
      edtLocale.text := Job.dataModule.GetCustomerLocale(Job.Customer);
      edtTown.text := Job.dataModule.GetCustomerTown(Job.Customer);
      edtPostcode.text := Job.dataModule.GetCustomerPostcode(Job.Customer);
      edtCounty.text := Job.dataModule.GetCustomerCounty(Job.Customer);
      edtTelephone.text := Job.dataModule.GetCustomerTelephone(Job.Customer);
      edtEmail.text := Job.dataModule.GetCustomerEmail(Job.Customer);

      pnlAddress.Enabled := false;
    end
  else
    begin
      edtCustomerName.text := Job.dataModule.GetAddressName(Job.Address);
      edtStreet.text := Job.dataModule.GetAddressStreet(Job.Address);
      edtLocale.text := Job.dataModule.GetAddressLocale(Job.Address);
      edtTown.text := Job.dataModule.GetAddressTown(Job.Address);
      edtPostcode.text := Job.dataModule.GetAddressPostcode(Job.Address);
      edtCounty.text := Job.dataModule.GetAddressCounty(Job.Address);
      edtTelephone.text := Job.dataModule.GetAddressTelephone(Job.Address);
      edtEmail.text := Job.dataModule.GetAddressEmail(Job.Address);

      pnlAddress.Enabled := true;
    end;

end;

procedure TfrmWTMaintJob.ClearAddressFields;
begin
  edtStreet.Clear;
  edtLocale.Clear;
  edtTown.Clear;
  edtPostcode.Clear;
  edtCounty.Clear;
  edtTelephone.Clear;
  edtEmail.Clear;
end;


procedure TfrmWTMaintJob.SetRetailCustomer(const Value: bytebool);
begin
  FRetailCustomer := Value;
  lblVat.Visible := FRetailCustomer;
  lblVatRate.Visible := FRetailCustomer;
  edtVatValue.Visible := FRetailCustomer;
end;

procedure TfrmWTMaintJob.dblkpMaterialClick(Sender: TObject);
begin
  Job.Material := dblkpMaterial.KeyValue;
  EnableAddButtons;
end;

procedure TfrmWTMaintJob.DropFileTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint;
  var Effect: Integer);
begin
  ProcessDragAndDrop;
end;

procedure TfrmWTMaintJob.EnableAddButtons;
begin
  btnAddElts.Enabled := (Job.Material <> 0);
  btnAddUpstds.Enabled := (Job.Material <> 0);
  btnAddCutOuts.Enabled := (Job.Material <> 0);
  btnAddEdges.Enabled := (Job.Material <> 0);
  btnAddExtras.Enabled := (Job.Material <> 0);
  btnAddRems.Enabled := (Job.Material <> 0);
end;

procedure TfrmWTMaintJob.EnablePanels;
begin
  pnlElts.visible := (Mode <> jView) and (Mode <> jRestrict) and (not frmWTMain.bEndUSer);
  pnlUpstands.visible := (Mode <> jView) and (Mode <> jRestrict) and (not frmWTMain.bEndUSer);
  pnlCutOuts.visible := (Mode <> jView) and (Mode <> jRestrict) and (not frmWTMain.bEndUSer);
  pnlEdges.visible := (Mode <> jView) and (Mode <> jRestrict) and (not frmWTMain.bEndUSer);
end;

procedure TfrmWTMaintJob.btnAddEltsClick(Sender: TObject);
begin
  CallMaintElement(jelAdd);
end;

procedure TfrmWTMaintJob.CallMaintElement(aMode : TjelMode);
var
  inx : integer;
  jElement : TjElement;
  frm: TfrmWTMaintjElement;
begin
//  inx := sgElements.row;

  try
    inx := strtoint(sgElements.cells[0,sgElements.row]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintJElement.Create(Self);
    try
      if aMode = jelAdd then
        jElement := TjElement.create(Job)
      else
      begin
        inx := Job.Elements.IndexOf(inx);
        jElement := Job.Elements[inx];
      end;
      Frm.jElement := jElement;
      Frm.Mode := aMode;
      Frm.Material := dblkpMaterial.keyvalue;
      Frm.MaterialType := dblkpMaterial.Text;
      if (aMode = jelAdd) and (Job.Elements.Count > 0) then
        begin
          Frm.Worktop := Job.Elements[Job.Elements.Count - 1].worktop;
          Frm.WorktopGroup := Job.Elements[Job.Elements.Count - 1].worktopgroup;
          frm.Thickness := Job.Elements[Job.Elements.Count - 1].thickness;
          frm.Material := Job.Elements[Job.Elements.Count - 1].Material;
          frm.jElement.UnitPrice := Job.Elements[Job.Elements.Count - 1].UnitPrice;
          frm.jElement.PriceUnit := Job.Elements[Job.Elements.Count - 1].PriceUnit;
        end;
      Frm.ShowModal;
      if (aMode = jelAdd) and (Frm.ModalResult <> mrOK) then
        jElement.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowElements;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = jelAdd then
      begin
        inx := pred(Job.Elements.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = jelDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgElements.row := inx+1;
  end;
end;

procedure TfrmWTMaintJob.CallMaintUpstand(aMode : TjelMode);
var
  inx : integer;
  jUpstand : TjUpstand;
  frm: TfrmWTMaintJUpstand;
begin
//  inx := sgUpstands.row+1000;
  inx := StrToIntDef(sgUpstands.cells[0,sgUpstands.row], 1000) + 1000;

  try
    frm := TfrmWTMaintJUpstand.Create(Self);
    try
      if aMode = jelAdd then
        jUpstand := TjUpstand.create(Job)
      else
      begin
        inx := Job.Upstands.IndexOf(inx);
        jUpstand := Job.Upstands[inx];
      end;
      Frm.jUpstand := jUpstand;
      Frm.Mode := aMode;
      Frm.Material := dblkpMaterial.keyvalue;
      Frm.MaterialType := dblkpMaterial.Text;
      if (aMode = jelAdd) and (Job.Upstands.Count = 0) and (Job.Elements.count > 0) then
        begin
          Frm.Worktop := Job.Elements[0].worktop;
          frm.Thickness := dtmdlWorktops.qryCompany.fieldbyname('Underslip_thickness').asinteger;
          frm.PolishPrice := dtmdlWorktops.qryCompany.fieldbyname('Upstand_Polish_Price').asfloat;
          frm.PolishCost := dtmdlWorktops.qryCompany.fieldbyname('Upstand_Polish_Cost').asfloat;
        end
      else
      if (aMode = jelAdd) and (Job.Upstands.Count = 0) then
        begin
          frm.Thickness := dtmdlWorktops.qryCompany.fieldbyname('Underslip_thickness').asinteger;
          frm.PolishPrice := dtmdlWorktops.qryCompany.fieldbyname('Upstand_Polish_Price').asfloat;
          frm.PolishCost := dtmdlWorktops.qryCompany.fieldbyname('Upstand_Polish_Cost').asfloat;
        end
      else
      if (aMode = jelAdd) and (Job.Upstands.Count > 0) then
        begin
          Frm.Material := Job.Upstands[Job.Upstands.Count - 1].Material;
          Frm.Worktop := Job.Upstands[Job.Upstands.Count - 1].worktop;
          frm.Thickness := Job.Upstands[Job.Upstands.Count - 1].thickness;
//          frm.PolishCost := Job.Upstands[Job.Upstands.Count - 1].PolishCost;
          frm.PolishPrice := Job.Upstands[Job.Upstands.Count - 1].PolishPrice;
          Frm.MaterialUse := Job.Upstands[Job.Upstands.Count - 1].MaterialUse;
          Frm.Depth := Job.Upstands[Job.Upstands.Count - 1].Depth;
          frm.JUpstand.UnitPrice := Job.Upstands[Job.Upstands.Count - 1].UnitPrice;
          frm.JUpstand.PriceUnit := Job.Upstands[Job.Upstands.Count - 1].PriceUnit;
        end;
      Frm.ShowModal;
      if (aMode = jelAdd) and (Frm.ModalResult <> mrOK) then
        jUpstand.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowUpstands;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = jelAdd then
      begin
        inx := pred(Job.Upstands.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = jelDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgUpstands.row := inx+1;
  end;
end;

procedure TfrmWTMaintJob.btnChangeEltsClick(Sender: TObject);
begin
  CallMaintElement(jelChange);
end;

procedure TfrmWTMaintJob.btnAddCutOutsClick(Sender: TObject);
begin
  CallMaintCutOut(jcoAdd);
end;

procedure TfrmWTMaintJob.CallMaintCutOut(aMode : TjcoMode);
var
  inx : integer;
  jCutOut : TjCutOut;
  frm: TfrmWTMaintjCutOut;
begin
//  inx := sgCutOuts.row;
  inx := StrToIntDef(sgCutOuts.cells[0,sgCutOuts.row], 1);

  try
    frm := TfrmWTMaintJCutOut.Create(Self);
    try
      if aMode = jcoAdd then
        JCutOut := TJCutOut.create(Job)
      else
      begin
        inx := Job.CutOuts.IndexOf(inx);
        JCutOut := Job.CutOuts[inx];
      end;
      Frm.JCutOut := JCutOut;
      Frm.Mode := aMode;
      Frm.Material := dblkpMaterial.KeyValue;
      Frm.MaterialType := dblkpMaterial.Text;
      if (aMode = jcoAdd) and (Job.CutOuts.Count > 0) then
        begin
          frm.EdgeType := Job.CutOuts[Job.CutOuts.Count - 1].EdgeType;
        end;
      Frm.ShowModal;
      if (aMode = jcoAdd) and (Frm.ModalResult <> mrOK) then
        JCutOut.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowCutOuts;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = jcoAdd then
      begin
        inx := pred(Job.CutOuts.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = jcoDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgCutOuts.row := inx+1;
  end;
end;

procedure TfrmWTMaintJob.CallMaintEdge(aMode : TjedgMode);
var
  inx : integer;
  jEdge : TjEdge;
  frm: TfrmWTMaintjEdge;
begin
//  inx := sgEdges.row;

  try
    inx := strtoint(sgEdges.cells[0,sgEdges.row]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintjEdge.Create(Self);
    try
      if aMode = jedgAdd then
        jEdge := TjEdge.create(Job)
      else
      begin
        inx := Job.Edges.IndexOf(inx);
        jEdge := Job.Edges[inx];
      end;
      Frm.jEdge := jEdge;
      Frm.Mode := aMode;
      Frm.Material := dblkpMaterial.KeyValue;
      Frm.MaterialType := dblkpMaterial.Text;
      if (aMode = jedgAdd) and (Job.Edges.Count > 0) then
        begin
          frm.EdgeType := Job.Edges[Job.Edges.Count - 1].EdgeType;
        end;
      Frm.ShowModal;
      if (aMode = jedgAdd) and (Frm.ModalResult <> mrOK) then
        jEdge.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowEdges;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = jedgAdd then
      begin
        inx := pred(Job.Edges.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = jedgDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgEdges.row := inx+1;
  end;
end;

procedure TfrmWTMaintJob.CallMaintExtra(aMode : TjexMode);
var
  inx : integer;
  jExtra : TjExtra;
  frm: TfrmWTMaintjExtra;
begin
//  inx := sgExtras.row;

  inx := StrToIntDef(sgExtras.cells[0,sgExtras.row], 1);

  try
    frm := TfrmWTMaintjExtra.Create(Self);
    try
      if aMode = jexAdd then
        jExtra := TjExtra.create(Job)
      else
      begin
        inx := Job.Extras.IndexOf(inx);
        jExtra := Job.Extras[inx];
      end;
      Frm.jExtra := jExtra;
      Frm.Mode := aMode;
      Frm.ShowModal;
      if (aMode = jexAdd) and (Frm.ModalResult <> mrOK) then
        jExtra.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowExtras;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = jexAdd then
      begin
        inx := pred(Job.Extras.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = jexDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgExtras.row := inx+1;
  end;
end;

procedure TfrmWTMaintJob.CallMaintEvent(aMode : TjevMode);
var
  inx : integer;
  JEvent : TJEvent;
  frm: TfrmWTMaintJEvents;
begin
//  inx := sgEvents.row;

  try
    inx := strtoint(sgEvents.cells[0,sgEvents.row]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintJEvents.Create(Self);
    try
      if aMode = jevAdd then
        JEvent := TJEvent.create(Job)
      else
      begin
        inx := Job.Events.IndexOf(inx);
        JEvent := Job.Events[inx];
      end;
      Frm.JEvent := JEvent;
      Frm.Mode := aMode;
      Frm.OperatorName := dblkpOperator.Text;
      Frm.Operator := dblkpOperator.keyvalue;
      Frm.ShowModal;
      if (aMode = jevAdd) and (Frm.ModalResult <> mrOK) then
        JEvent.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowEvents;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = jevAdd then
      begin
        inx := pred(Job.Events.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = jevDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgEvents.row := inx+1;
  end;
end;

procedure TfrmWTMaintJob.CallMaintRemedials(aMode : TjremMode);
var
  inx : integer;
  jRemedial : TjRemedial;
  frm: TfrmWTMaintJRemedial;
begin
//  inx := sgRemedials.row;
  inx := StrToIntDef(sgRemedials.cells[0,sgRemedials.row], 1);

  try
    frm := TfrmWTMaintjRemedial.Create(Self);
    try
      if aMode = jremAdd then
        jRemedial := TjRemedial.create(Job)
      else
      begin
        inx := Job.Remedials.IndexOf(inx);
        jRemedial := Job.Remedials[inx];
      end;
      Frm.jRemedial := jRemedial;
      Frm.Mode := aMode;
      Frm.ShowModal;
      if (aMode = jremAdd) and (Frm.ModalResult <> mrOK) then
        jRemedial.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowRemedials;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = jremAdd then
      begin
        inx := pred(Job.Remedials.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = jremDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgRemedials.row := inx+1;
  end;
end;

procedure TfrmWTMaintJob.btnChangeCutOutsClick(Sender: TObject);
begin
  CallMaintCutOut(jcoChange);
end;

procedure TfrmWTMaintJob.btnAddEdgesClick(Sender: TObject);
begin
  CallMaintEdge(jedgAdd);
end;

procedure TfrmWTMaintJob.btnChangeEdgesClick(Sender: TObject);
begin
  CallMaintEdge(jedgChange);
end;

procedure TfrmWTMaintJob.btnAddExtrasClick(Sender: TObject);
begin
  CallMaintExtra(jexAdd);
end;

procedure TfrmWTMaintJob.btnChangeExtrasClick(Sender: TObject);
begin
  CallMaintExtra(jexChange);
end;

procedure TfrmWTMaintJob.FormDestroy(Sender: TObject);
begin
  dtmdlNotes.free;
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintJob.edtContactChange(Sender: TObject);
begin
  Job.ContactName := edtContact.text;
end;

procedure TfrmWTMaintJob.btnAddUpstdsClick(Sender: TObject);
begin
  CallMaintUpstand(jelAdd);
end;

procedure TfrmWTMaintJob.btnChangeUpstdsClick(Sender: TObject);
begin
  CallMaintUpstand(jelChange);
end;

procedure TfrmWTMaintJob.btnContactSearchClick(Sender: TObject);
begin
  frmwtSrchCustContacts := TfrmwtSrchCustContacts.create(self);
  try
    frmwtSrchCustContacts.Customer := Job.Customer;
    frmwtSrchCustContacts.showmodal;
    if frmwtSrchCustContacts.modalresult = idOK then
      begin
        Job.ContactName := frmwtSrchCustContacts.ContactName;
        edtContact.Text := Job.ContactName;
      end
  finally
    frmwtSrchCustContacts.free;
  end;

end;

procedure TfrmWTMaintJob.edtDiscountRateChange(Sender: TObject);
var
  rDiscount: real;
begin
  if (Sender as TEdit).Text = '' then
    (Sender as TEdit).Text := '0.00';
  if bChangeRate then
    begin
      Job.DiscountRate := StrToFloatDef(edtDiscountRate.text, 0, FormatSettings);
      rDiscount := Job.TotalPrice * (Job.DiscountRate/100);
      edtDiscountValue.text := formatfloat('0.00',rDiscount);
      Job.DiscountValue := rDiscount;
      ShowTotals;
    end;
end;

procedure TfrmWTMaintJob.edtDiscountValueChange(Sender: TObject);
var
  rDiscount: real;
begin
  if (Sender as TMemo).Text = '' then
    (Sender as TMemo).Text := '0.00';
  if bChangeValue then
    begin
      Job.DiscountValue := StrToFloatDef(edtDiscountValue.text, 0, FormatSettings);
      rDiscount := ((Job.DiscountValue / Job.TotalPrice)*100);
      edtDiscountRate.text := formatfloat('0.00',rDiscount);
      Job.DiscountRate := rDiscount;
      ShowTotals;
    end;
end;

procedure TfrmWTMaintJob.edtDiscountRateEnter(Sender: TObject);
begin
  bChangeRate := true;
end;

procedure TfrmWTMaintJob.edtDiscountRateExit(Sender: TObject);
begin
  bChangeRate := false;
end;

procedure TfrmWTMaintJob.edtDiscountValueEnter(Sender: TObject);
begin
  bChangeValue := true;
end;

procedure TfrmWTMaintJob.edtDiscountValueExit(Sender: TObject);
begin
  bChangeValue := false;
end;

procedure TfrmWTMaintJob.btnDeleteEltsClick(Sender: TObject);
begin
  CallMaintElement(jelDelete);
end;

procedure TfrmWTMaintJob.btnDeleteCutOutsClick(Sender: TObject);
begin
  CallMaintCutOut(jcoDelete);
end;

procedure TfrmWTMaintJob.btnDeleteEdgesClick(Sender: TObject);
begin
  CallMaintEdge(jedgDelete);
end;

procedure TfrmWTMaintJob.btnDeleteUpstdsClick(Sender: TObject);
begin
  CallMaintUpstand(jelDelete);
end;

procedure TfrmWTMaintJob.btnDeleteExtrasClick(Sender: TObject);
begin
  CallMaintExtra(jexDelete);
end;

procedure TfrmWTMaintJob.SetJob(const Value: TJob);
begin
  FJob := Value;
end;

procedure TfrmWTMaintJob.edtCustomerPOChange(Sender: TObject);
begin
  Job.CustomerPO := edtCustomerPO.Text;
  CheckOK(self);
end;

procedure TfrmWTMaintJob.ShowDiscount;
var
  rDiscount: real;
begin
// discount shouldn't be worked out on the job calculation
// rather than change everywhere this procedure is called, just exit!!!
  exit;
//  rDiscount := Job.TotalPrice * (Job.DiscountRate/100);
//  edtDiscountValue.text := formatfloat('0.00',rDiscount);
//  Job.DiscountValue := rDiscount;
end;

procedure TfrmWTMaintJob.ShowEvents;
begin
  ClearGrid(sgEvents);  {Clear contents of Line grid}
  BuildEventGrid;
  sgEventsClick(self);
end;

procedure TfrmWTMaintJob.BuildEventGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgEvents, Job.datamodule do
    begin
      for i := 0 to pred(Job.Events.count) do
        begin
        cells[0,i+1] := inttostr(Job.Events[i].EventNumber);
        cells[1,i+1] := paDateStr(Job.Events[i].DateEntered);
        cells[2,i+1] := Job.Events[i].OperatorName;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeEvents.enabled := not (Job.Events.count = 0);
  btnDeleteEvents.enabled := not (Job.Events.count = 0);
end;

procedure TfrmWTMaintJob.sgEventsClick(Sender: TObject);
var
  JEvent: TJEvent;
  inx: integer;
begin
  memEventNotes.Lines.Clear;

  if not Assigned(Job.Events) then Exit;
  if Job.Events.Count = 0 then Exit;

  inx := Job.Events.IndexOf(sgEvents.row);
  JEvent := Job.Events[inx];
  memEventNotes.Text := JEvent.Narrative.DataInfo;
end;

procedure TfrmWTMaintJob.sgEventsDblClick(Sender: TObject);
begin
  btnChangeEventsClick(self);
end;

procedure TfrmWTMaintJob.btnDeleteEventsClick(Sender: TObject);
begin
  CallMaintEvent(jevDelete);
end;

procedure TfrmWTMaintJob.btnChangeEventsClick(Sender: TObject);
begin
  CallMaintEvent(jevChange);
end;

procedure TfrmWTMaintJob.btnAddEventsClick(Sender: TObject);
begin
  CallMaintEvent(jevAdd);
end;

procedure TfrmWTMaintJob.dtpckTemplateChange(Sender: TObject);
begin
  Job.TemplateDate := dtpckTemplate.Date;
end;

procedure TfrmWTMaintJob.dtpckProductionChange(Sender: TObject);
begin
  Job.ProductionDate := dtpckProduction.Date;

end;

procedure TfrmWTMaintJob.dtpckFittingChange(Sender: TObject);
begin
  Job.installDate := dtpckFitting.Date;
end;

procedure TfrmWTMaintJob.edtTemplateExit(Sender: TObject);
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

procedure TfrmWTMaintJob.btntemplateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtTemplate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edttemplate.text;

  edttemplate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTMaintJob.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTMaintJob.BitBtn3Click(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtProduction.text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtProduction.text;

  edtProduction.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintJob.BitBtn4Click(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtFitting.text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtFitting.text;

  edtFitting.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintJob.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTMaintJob.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  if Mode = jView then exit;

  TempWord := MessageDlg('Do you want to save these job details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    btnOKClick(self);
end;

procedure TfrmWTMaintJob.edtInstallPriceExit(Sender: TObject);
begin
  if (Sender as TMemo).text = '' then
    (Sender as TMemo).text := '0.00';
end;

procedure TfrmWTMaintJob.edtCustomerNameChange(Sender: TObject);
begin
  Job.CustomerName := edtCustomerName.text;
  CheckOK(self);
end;

procedure TfrmWTMaintJob.BitBtn1Click(Sender: TObject);
begin
  frmWTLUMatType := TfrmWTLUMatType.create(self);
  try
    frmWTLUMatType.showmodal;
  finally
    frmWTLUMatType.free;
  end;

  Job.DataModule.dtsMaterial.DataSet.close;
  Job.DataModule.dtsMaterial.DataSet.open;
end;

procedure TfrmWTMaintJob.edtDepositPaidChange(Sender: TObject);
begin
  try
    Job.DepositAmount := StrToFloatDef(edtDepositPaid.text, 0, FormatSettings);
  except
    Job.DepositAmount := 0.00;
  end;

end;

procedure TfrmWTMaintJob.spnDepositTermsChange(Sender: TObject);
begin
  Job.DepositTerms := (Sender as TSpinEdit).Value;
end;

procedure TfrmWTMaintJob.btnGlobalEltsClick(Sender: TObject);
var
  icount, inx : integer;
  JElement : TJElement;
  frm: TfrmWTMaintJElementM;
begin
  inx := sgElements.row;
  try
    frm := TfrmWTMaintJElementM.Create(Self);
    try
      inx := Job.Elements.IndexOf(inx);
      JElement := Job.Elements[inx];

      Frm.JElement := JElement;
      Frm.Material := dblkpMaterial.keyvalue;
      Frm.MaterialType := dblkpMaterial.Text;
      Frm.ShowModal;
      if Frm.ModalResult = mrOK then
        begin
          for icount := 0 to pred(Job.Elements.count) do
            begin
              JElement := Job.Elements[icount];
              JElement.Worktop := Job.Elements[inx].worktop;
              JElement.WorktopGroup := Job.Elements[inx].worktopGroup;
              JElement.worktopDesc := Job.Elements[inx].worktopDesc;
              JElement.thickness := Job.Elements[inx].thickness;
              JElement.thicknessDesc := Job.Elements[inx].thicknessDesc;
              JElement.UnitPrice := Job.Elements[inx].UnitPrice;
            end;
          ShowElements;
          ShowDiscount;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    sgElements.row := inx+1;
  end;
end;

procedure TfrmWTMaintJob.CreateSalesOrder;
var
  Key : integer;
  aSOrder : TSOrder;
begin
  dtmdlSalesOrder := TdtmdlSalesOrder.create(application);
  aSOrder := TSOrder.Create(dtmdlSalesOrder);
  Key := 0;
  try
    aSOrder.DataModule.JobNo := Job.dbKey;
    aSOrder.DbKey := key;
    aSOrder.LoadFromJob;
    aSOrder.SaveToDB(true);
  finally
    aSOrder.Free;
    dtmdlSalesOrder.Free;
  end;

end;

procedure TfrmWTMaintJob.sgElementsDblClick(Sender: TObject);
begin
  if not frmWTMain.bEndUser then
    btnChangeEltsClick(self);
end;

procedure TfrmWTMaintJob.sgCutOutsDblClick(Sender: TObject);
begin
  if not frmWTMain.bEndUser then
      btnChangeCutOutsClick(self);
end;

procedure TfrmWTMaintJob.sgEdgesDblClick(Sender: TObject);
begin
  if not frmWTMain.bEndUser then
      btnChangeEdgesClick(self);
end;

procedure TfrmWTMaintJob.sgUpstandsDblClick(Sender: TObject);
begin
  if not frmWTMain.bEndUser then
      btnChangeUpstdsClick(self);
end;

procedure TfrmWTMaintJob.sgExtrasDblClick(Sender: TObject);
begin
    btnChangeExtrasClick(self);
end;

procedure TfrmWTMaintJob.btnAddRemsClick(Sender: TObject);
begin
  CallMaintRemedials(jremAdd);
end;

procedure TfrmWTMaintJob.btnChangeRemsClick(Sender: TObject);
begin
  CallMaintRemedials(jremChange);
end;

procedure TfrmWTMaintJob.btnDeleteRemsClick(Sender: TObject);
begin
  CallMaintRemedials(jremDelete);
end;

procedure TfrmWTMaintJob.BitBtn2Click(Sender: TObject);
begin
  frmWTLUFitters := TfrmWTLUFitters.create(self);
  try
    frmWTLUFitters.showmodal;
  finally
    frmWTLUFitters.free;
  end;

  Job.DataModule.dtsFitter.DataSet.close;
  Job.DataModule.dtsFitter.DataSet.open;

end;

procedure TfrmWTMaintJob.edtInstallNameChange(Sender: TObject);
begin
  Job.InstallContact := edtInstallName.Text;
end;

procedure TfrmWTMaintJob.edtInstallNumberChange(Sender: TObject);
begin
  Job.InstallPhone := edtInstallNumber.Text;
end;

procedure TfrmWTMaintJob.btnDesignerClick(Sender: TObject);
begin
  frmWTLUDesigner := TfrmWTLUDesigner.create(self);
  try
    frmWTLUDesigner.showmodal;
  finally
    frmWTLUDesigner.free;
  end;

  job.DataModule.dtsDesigner.DataSet.close;
  job.DataModule.dtsDesigner.DataSet.open;

end;

procedure TfrmWTMaintJob.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
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
            var Stamp: TDateTime;
            FileAge(strPath + ListItem.Caption, Stamp);
            ListItem.SubItems.Add(DatetimeToStr(Stamp));
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

procedure TfrmWTMaintJob.ShowDocuments;
var
  sPath: string;
begin
  if job.dbKey = 0 then
    begin
      stvDocuments.visible := false;
      slvDocuments.visible := false;
      exit;
    end;

  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + inttostr(Job.dbKey) + '\';

  try
    stvDocuments.root := sPath;
    slvDocuments.root := sPath;
  except
    messagedlg('The document location hasn''t been defined for jobs within Company Preferences. Contact your Firebelly administrator', mtError, [mbAbort], 0);
    stvDocuments.visible := false;
    slvDocuments.visible := false;
  end;

(*  // Assign a Imagelist to the ListView
  lstvwDocuments.Clear;
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
//  lstvwDocuments.ViewStyle := vsIcon;
//  lstvwDocuments.Columns.Add;
//  lstvwDocuments.Columns.Add;
//  ShowListViewDocuments('\\aktivsrv01\company data\jobs\803537', lstvwDocuments, imgDocuments);
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
*)
end;

procedure TfrmWTMaintJob.ShowSalesOrderDocuments;
var
  sPath: string;
begin
  if Job.datamodule.salesorder = 0 then
    begin
      stvDocuments.visible := false;
      slvDocuments.visible := false;
      exit;
    end;

  sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(Job.datamodule.salesorder) + '\';

  try
    stvDocuments.root := sPath;
    slvDocuments.root := sPath;
  except
    messagedlg('The document location hasn''t been defined for Sales Orders within Company Preferences. Contact your Firebelly administrator', mtError, [mbAbort], 0);
    stvDocuments.visible := false;
    slvDocuments.visible := false;
  end;

(*
  // Assign a Imagelist to the ListView
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
//  lstvwDocuments.ViewStyle := vsIcon;
//  lstvwDocuments.Columns.Add;
//  lstvwDocuments.Columns.Add;
//  ShowListViewDocuments('\\aktivsrv01\company data\jobs\803537', lstvwDocuments, imgDocuments);
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
*)
end;

procedure TfrmWTMaintJob.lstvwDocumentsDblClick(Sender: TObject);
(*var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
*)
begin
(*  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + inttostr(Job.dbKey) + '\';
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

*)
end;

procedure TfrmWTMaintJob.btnDateRequiredClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateRequired.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateRequired.text;

  edtDateRequired.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintJob.edtDateRequiredExit(Sender: TObject);
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

procedure TfrmWTMaintJob.mnuOpenDocumentClick(Sender: TObject);
begin
  lstvwDocumentsDblClick(self);
end;

procedure TfrmWTMaintJob.mnuDeleteDocumentClick(Sender: TObject);
(*var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
*)
begin
(*  iRow := lstvwDocuments.ItemIndex;
  if iRow = -1 then exit;
  if messagedlg('Delete the selected document?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ListItem := lstvwDocuments.items[irow];
      sFileName := ListItem.caption;

      lstvwDocuments.Items.Delete(iRow);

      //Delete the actual file only if not Converting or adding as we don't know the directory name
      if (Mode <> jConvert) and (Mode <> jAdd) then
        begin
          sPath :=  dtmdlWorktops.GetCompanyJobDirectory + '\' + inttostr(job.dbkey) + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;
*)
end;

procedure TfrmWTMaintJob.pmnuDocumentsPopup(Sender: TObject);
begin
(*  if Mode = jConvert then
    exit
  else
    begin
      pmnuDelete.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuOpen.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuSelectAll.Enabled := (lstvwDocuments.Items.count > 0);
    end;
*)
end;

procedure TfrmWTMaintJob.FormResize(Sender: TObject);
begin
//  lblNotes.left := memNotes.Left;
  self.memNotes.width := trunc((self.tbDocuments.width/2));
//  self.lstvwDocuments.width := trunc((self.tbDocuments.width/2));
  self.pnlRiskNotes.width := trunc((self.tbInstallation.width/2));
  self.pnlInstall.width := trunc((self.tbInstallation.width/2));
end;

function TfrmWTMaintJob.GetFilesPath: string;
var
  DocDir: string;
begin
  DocDir := dtmdlWorktops.GetCompanyJobDirectory;
  DocDir := IncludeTrailingPathDelimiter(DocDir) + IntToStr(Job.dbKey);

  if stvDocuments.TopItem.Text <> stvDocuments.Selected.Text then
    DocDir := IncludeTrailingPathDelimiter(DocDir) + stvDocuments.Selected.Text;

  Result := DocDir;
end;

procedure TfrmWTMaintJob.btnAttachClick(Sender: TObject);
var
  I: Integer;
  SourceFileName, DestFileName, DocDir: string;
begin
  {Find a document}
  DocDir := GetFilesPath;

  CopyDocuments(DocOpenDialog, DocDir,
    procedure
    begin
      ShowDocuments;
    end);
end;

procedure TfrmWTMaintJob.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  WTMaintEmailFrm := TWTMaintEmailFrm.create(self);
  try
    WTMaintEmailFrm.Supplier := 0;
    WTMaintEmailFrm.SupplierBranch := 0;
    WTMaintEmailFrm.SupplierContact := 0;
    WTMaintEmailFrm.AddressType := 0;
    WTMaintEmailFrm.Customer := Job.customer;
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

procedure TfrmWTMaintJob.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docdir, compdir, docExt: string;
begin
  docDir := dtmdlWorktops.GetCompanyJobDirectory + '\' + inttostr(Job.dbKey);
  compDir := dtmdlWorktops.GetCompanyJobDirectory;

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

procedure TfrmWTMaintJob.btnWordClick(Sender: TObject);
var
  compdir, docdir, jobBagDir, docExt, sPAth: string;
  sFullFile, sFileName: string;
  iLength, ipos, i: integer;
  okToSave, userCancelled, docsaved: boolean;
begin
  compDir := dtmdlWorktops.GetCompanyJobDirectory;
  if stvDocuments.TopItem.Text = stvDocuments.Selected.Text then
    docDir := compDir + '\' + inttostr(Job.dbKey) + '\'
  else
    docDir := compDir + '\' + inttostr(Job.dbKey) + '\' + stvDocuments.Selected.Text +'\';

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
(*        lstvwDocuments.itemindex := -1;
        for i := 0 to pred(lstvwDocuments.Items.count) do
          begin
            if lstvwDocuments.Items[i].caption = sFileName then
              lstvwDocuments.itemindex := i;
          end;
        if lstvwDocuments.itemindex >= 0 then
          lstvwDocumentsDblClick(self);
*)
      end;
    end
    else
    begin
    end;
end;

procedure TfrmWTMaintJob.SetUseMarkup(const Value: bytebool);
begin
  FUseMarkup := Value;
  if FUseMarkup then
    begin
      lblDiscountRate.Caption := 'Markup Rate %';
      lblDiscountValue.caption := 'Markup'
    end
  else
    begin
      lblDiscountRate.Caption := 'Discount Rate %';
      lblDiscountValue.caption := 'Discount'
    end;
end;

procedure TfrmWTMaintJob.sgRemedialsDblClick(Sender: TObject);
begin
  btnChangeRemsClick(self);
end;

procedure TfrmWTMaintJob.edtProjectChange(Sender: TObject);
begin
  Job.ProjectReference := edtProject.Text;
end;

procedure TfrmWTMaintJob.lstvwDocumentsColumnClick(Sender: TObject;
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

procedure TfrmWTMaintJob.lstvwDocumentsCompare(Sender: TObject; Item1,
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

procedure TfrmWTMaintJob.pmnuPasteClick(Sender: TObject);
var
  DocDir: string;
begin
  DocDir := dtmdlWorktops.GetCompanyJobDirectory;
  DocDir := IncludeTrailingPathDelimiter(DocDir) + IntToStr(job.dbkey);

  {Find a document}
  CopyDocumentsFromClipboard(DocDir,
    procedure
    begin
      ShowDocuments;
    end);
end;

procedure TfrmWTMaintJob.pmnuDeleteClick(Sender: TObject);
(*var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
*)
begin
(*  iRow := lstvwDocuments.ItemIndex;
  if iRow = -1 then exit;
  if messagedlg('Delete the selected document?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ListItem := lstvwDocuments.items[irow];
      sFileName := ListItem.caption;

      lstvwDocuments.Items.Delete(iRow);

      //Delete the actual file only if not Converting or adding as we don't know the directory name
      if (Mode <> jAdd) then
        begin
          sPath :=  dtmdlWorktops.GetCompanyJobDirectory + '\' + inttostr(job.dbkey) + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;
*)
end;

procedure TfrmWTMaintJob.pmnuSelectAllClick(Sender: TObject);
(*var
  icount: integer;
*)
begin
(*  with lstvwDocuments do
    begin
      Items.BeginUpdate;
      for icount := 0 to pred(items.count) do
        begin
          items[icount].selected := true ;
        end;
      Items.EndUpdate;
    end;
*)
end;

procedure TfrmWTMaintJob.ProcessDragAndDrop;
var
  Path: string;
  FilesList: TUnicodeStrings;
begin
  Path := GetFilesPath;
  FilesList := DropFileTarget1.Files;
  MyWinControlSetData(FilesList, Path,
    procedure
    begin
      ShowDocuments;
    end);
end;

procedure TfrmWTMaintJob.btnReasonClick(Sender: TObject);
begin
  frmwtLUReason := TfrmwtLUReason.Create(Self);
  try
    frmwtLUReason.ShowModal;

    with Job.DataModule do
      begin
        qryReason.Close;
        qryReason.Open;
      end;
  finally
    frmwtLUReason.Free;
  end;
end;

procedure TfrmWTMaintJob.chkbxDeclinedClick(Sender: TObject);
begin
  dblkpReason.visible := chkbxDeclined.Checked;
  lblReason.visible := chkbxDeclined.Checked;
  btnReason.visible := chkbxDeclined.Checked;
end;

procedure TfrmWTMaintJob.slvDocumentsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Shift = [ssLeft] then
    (Sender as TShellListView).BeginDrag(false, 5);

end;

procedure TfrmWTMaintJob.stvDocumentsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  files: TStringList;
  slv : TShellListView;
  cnt: integer;
  node: TTreeNode;
  sNewFile, sOldFile: string;
  pNewFile, pOldFile: array[0..255] of Char;
begin
  if (slvDocuments.selected = nil) or (X = 0) or (Y = 0) then
    exit;

  if (Source = slvDocuments) and (slvDocuments.ItemIndex > -1) and (Sender = stvDocuments) then
    begin
      try
        node := stvDocuments.GetNodeAt(X, Y);
      except
        exit;
      end;
    end
  else
    exit;

  slv := TShellListView(Source);

  files := TStringList.Create;
  try
    if NOT slv.MultiSelect then
      files.Add(slv.SelectedFolder.PathName)
    else //multiselect
    begin
      for cnt := 0 to -1 + slv.Items.Count do
        begin
      //selected and NOT folder
          if slv.Items[cnt].Selected AND (NOT slv.Folders[cnt].IsFolder) then
            begin
              if pos('.',slv.Folders[cnt].DisplayName) > 0 then
                sNewFile := slv.Folders[cnt].DisplayName
              else
                sNewFile := slv.Folders[cnt].DisplayName + ExtractFileExt(slv.Folders[cnt].PathName);

              if pos(Node.Text,slvDocuments.Root) > 0 then
                sNewFile := slvDocuments.Root + sNewFile
              else
                sNewFile := slvDocuments.Root + Node.Text + '\' + sNewFile;

              sOldFile := slv.Folders[cnt].PathName;

              StrPCopy(pNewFile, sNewFile);
              StrPCopy(pOldFile, sOldFile);
              movefile(pOldFile, pNewfile);
            end;
        end;
    end;
  finally
    files.Free;
  end;

end;

procedure TfrmWTMaintJob.stvDocumentsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TShellListView;
end;

procedure TfrmWTMaintJob.tbDocumentsShow(Sender: TObject);
begin
  if stvDocuments.Visible then
    stvDocuments.SetFocus;
end;

end.
