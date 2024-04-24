unit pbluCustomers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, ImgList, ExtCtrls, StdCtrls, Buttons,
  pbluCustOrders, pbluCustStock, pbluCustEnquiries, pbluCustJobs, pbluCustEvents,
  pbluCustSalesInvoices, pbluCustQuotes, Db, Menus, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Inifiles, System.ImageList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmpbluCustomers = class(TForm)
    stsbrDetails: TStatusBar;
    CoolBar1: TCoolBar;
    dbgDetails: TDBGrid;
    imglstMaint: TImageList;
    Panel1: TPanel;
    lblSearch: TLabel;
    edtSearch: TEdit;
    tmrSearch: TTimer;
    pmnFunctions: TPopupMenu;
    mnuAdd: TMenuItem;
    mnuChange: TMenuItem;
    mnuDelete: TMenuItem;
    N1: TMenuItem;
    mnuBranches: TMenuItem;
    mnuContacts: TMenuItem;
    N2: TMenuItem;
    mnuEnquiries: TMenuItem;
    mnuProduction: TMenuItem;
    mnuJobs: TMenuItem;
    mnuStock: TMenuItem;
    mnuSalesInvoicing: TMenuItem;
    N3: TMenuItem;
    mnuReset: TMenuItem;
    Panel2: TPanel;
    btnClose: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    lblTitle: TLabel;
    mnuLabels: TMenuItem;
    mnuCustReps: TMenuItem;
    mnuCostCentres: TMenuItem;
    mnuDiscounts: TMenuItem;
    mnuCalls: TMenuItem;
    btnSearch: TBitBtn;
    mnuAccMgrs: TMenuItem;
    IdHTTP1: TIdHTTP;
    Button1: TButton;
    btnSweep: TBitBtn;
    mnuCreditTerms: TMenuItem;
    N4: TMenuItem;
    Panel5: TPanel;
    PageScroller2: TPageScroller;
    clbrDashboard: TCoolBar;
    ToolBar2: TToolBar;
    btnCustomers: TToolButton;
    btnQuotes: TToolButton;
    btnEnquiries: TToolButton;
    btnProduction: TToolButton;
    btnJobs: TToolButton;
    btnStock: TToolButton;
    btnSalesInvoicing: TToolButton;
    cmbColourCoding: TComboBox;
    Label4: TLabel;
    Toolbar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    btnLabels: TToolButton;
    btnCreditTerms: TToolButton;
    ToolButton4: TToolButton;
    btnBranches: TToolButton;
    btnContacts: TToolButton;
    btnAccMgrs: TToolButton;
    btnCustReps: TToolButton;
    btnCostCentres: TToolButton;
    btnDiscounts: TToolButton;
    btnTemplates: TToolButton;
    btnCategories: TToolButton;
    ToolButton2: TToolButton;
    btnReports: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnProductionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure btnBranchesClick(Sender: TObject);
    procedure btnEnquiriesClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnContactsClick(Sender: TObject);
    procedure btnJobsClick(Sender: TObject);
    procedure mnuResetClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure btnCustRepsClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnSalesInvoicingClick(Sender: TObject);
    procedure btnCostCentresClick(Sender: TObject);
    procedure btnDiscountsClick(Sender: TObject);
    procedure btnLabelsClick(Sender: TObject);
    procedure pmnFunctionsPopup(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnTemplatesClick(Sender: TObject);
    procedure btnCategoriesClick(Sender: TObject);
    procedure btnAccMgrsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnQuotesClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
    procedure btnCreditTermsClick(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure cmbColourCodingChange(Sender: TObject);
  protected
    procedure LUCustomersChildClosed(var Message: TMessage); message luCustomers_ChildClosed;
    procedure LUCustomersStockClosed(var Message: TMessage); message luCustomers_StockClosed;
    procedure LUCustomersEnqsClosed(var Message: TMessage); message luCustomers_EnqsClosed;
    procedure LUCustomersJobsClosed(var Message: TMessage); message luCustomers_JobsClosed;
    procedure LUCustomersEventsClosed(var Message: TMessage); message luCustomers_EventsClosed;
    procedure LUCustomersSInvoicesClosed(var Message: TMessage); message luCustomers_InvoicesClosed;
    procedure LUCustomersQuotesClosed(var Message: TMessage); message luCustomers_QuotesClosed;
  private
    FDisableNameChangeEvent: boolean;
    frmpbluCustOrders: TfrmpbLuCustOrders;
    frmpbluCustStock: TfrmpbluCustStock;
    frmpbluCustEnquiries: TfrmpbluCustEnquiries;
    frmpbluCustJobs: TfrmpbluCustJobs;
    frmpbluCustEvents: TfrmpbluCustEvents;
    frmpbluCustSalesInvoices: TfrmpbluCustSalesInvoices;
    frmpbluCustQuotes: TfrmpbluCustQuotes;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(Mode: string);
    procedure SetOperator(iTempOp: Integer);
    procedure CreateCustomerTechXMLData(tmpCode: integer);
    procedure PostTechXMLtoSchedule(filename: string);
    procedure MultiSQLAdd(sTempStr: String; tmpQuery: TFDQuery; bBranch: boolean);
    procedure ShowColumns;
    function CustomerOrdersExist: boolean;
    procedure SetCustomerInactive;
  private
    ActiveCode: integer;
    bSQLAdd, bSQLAddBranch: boolean;
    FActivated: Boolean;
    DontSaveLayout: boolean;
    iOperatorRep: integer;
    FChildLeft, FChildTop, FStockLeft, FStockTop, FEnqsLeft, FEnqsTop, FJobsLeft, FJobsTop: integer;
    FEventsLeft, FEventsTop, FInvoicesLeft, FInvoicesTop, FQuotesLeft, FQuotesTop: integer;
    sAnalysis1, sAnalysis2, sAnalysis3, sAnalysis4: string;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmpbluCustomers: TfrmpbluCustomers;

implementation

uses
  System.UITypes,
  pbCustomerdm, PBMaintCust, pbLuBranches, pbluContacts, ccsCommon,
  PBMaintCConta, PBMaintCRep, pbMainMenu, PBLUReps, pbLUCustomerRpts,
  pbDatabase, PBLUCustCstCntr, PBLUCustDisc, PBRSCusSupLabs,
  pbluCustomerSearch, PBLUCustProductTemp, PBLUCustomerCats,
  PBMaintCustAccMgr, pbEventsDM, PBMaintCustMulti, PBRSCustCreditTerms;

{$R *.DFM}

procedure TfrmpbluCustomers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if MessageDlg('Do you want to close all the customer details ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      if assigned(frmpbLuCustOrders) then
        PostMessage(frmpbLUCustOrders.Handle, luCustomers_ParentClosed, 0, 0);
      if assigned(frmpbLuCustStock) then
        PostMessage(frmpbLuCustStock.Handle, luCustomers_ParentClosed, 0, 0);
      if assigned(frmpbLuCustEnquiries) then
        PostMessage(frmpbLuCustEnquiries.Handle, luCustomers_ParentClosed, 0, 0);
      if assigned(frmpbLuCustJobs) then
        PostMessage(frmpbLuCustJobs.Handle, luCustomers_ParentClosed, 0, 0);
      if assigned(frmpbLuCustEvents) then
        PostMessage(frmpbLuCustEvents.Handle, luCustomers_ParentClosed, 0, 0);
      if assigned(frmpbLuCustSalesInvoices) then
        PostMessage(frmpbLuCustSalesInvoices.Handle, luCustomers_ParentClosed, 0, 0);

      if Self.dontSaveLayout then
      begin
      //dont do anything
      end
      else
      begin
        CCSCommon.SaveDBGridCols('', 'CustomerLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
        CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
      end;
      Action := caFree
    end
  else
    Action := caNone;
end;

procedure TfrmpbluCustomers.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Customer', 'Colour Coding', inttostr(cmbColourCoding.itemindex));
  finally
    IniFile.Free;
  end;

  dtmdlCustomers.free;
end;

procedure TfrmpbluCustomers.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluCustomers.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlCustomers.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustomers.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlCustomers.refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmpbluCustomers.chkbxShowInactiveClick(Sender: TObject);
begin
(*  if DisableNameChangeEvent then Exit;
  dtmdlCustomers.ShowInactive := chkbxShowInactive.checked;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
*)
end;

procedure TfrmpbluCustomers.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmpbluCustomers.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluCustomers.btnProductionClick(Sender: TObject);
var
  oldCursor: TCursor;
begin
  OldCursor := screen.cursor;
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,'mnuProduction') ;
  if Assigned(frmpbLUCustOrders) then
    begin
      if frmpbLUCustOrders.Customer <> dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger then
        begin
          frmpbLUCustOrders.ClearSearchCriteria;
          frmpbLUCustOrders.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
          frmpbLUCustOrders.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbLUCustOrders.Caption := 'Customer Orders - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbLUCustOrders.lblTitle.caption := 'Customer Orders - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        end;
      frmpbLUCustOrders.BringToFront
    end
  else
    begin
      try
        screen.cursor := crHourGlass;

        frmpbLUCustOrders := TfrmpbLUCustOrders.create(self);
        frmpbLUCustOrders.ParentForm := Self;
        frmpbLUCustOrders.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
        frmpbLUCustOrders.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbLUCustOrders.Caption := 'Customer Orders - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbLUCustOrders.lblTitle.caption := 'Customer Orders - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        if FChildLeft >=0 then
          begin
            frmpbLUCustOrders.position := poDesigned;
            frmpbLUCustOrders.windowstate := frmpbluCustomers.windowstate;
            frmpbLUCustOrders.left := FChildleft;
            frmpbLUCustOrders.top := FChildTop;
          end;
        frmpbLUCustOrders.show;
      finally
        screen.cursor := oldcursor;
      end;
    end;
end;

procedure TfrmpbluCustomers.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      if (ReadString('Customer', 'Colour Coding', '0') = '0') then
        cmbColourCoding.itemindex := 0
      else
      if (ReadString('Customer', 'Colour Coding', '1') = '1') then
        cmbColourCoding.itemindex := 1
      else
      if (ReadString('Customer', 'Colour Coding', '2') = '2') then
        cmbColourCoding.itemindex := 2
      else
      if (ReadString('Customer', 'Colour Coding', '3') = '3') then
        cmbColourCoding.itemindex := 3;
    end;
  finally
    IniFile.Free;
  end;

  dtmdlCustomers := TdtmdlCustomers.create(self);
  dtmdlCustomers.dtsCustomers.OnDataChange := SetButtons;
  FChildLeft := -1;
  FChildTop := -1;
  FEnqsLeft := -1;
  FEnqsTop := -1;
  FStockLeft := -1;
  FStockTop := -1;
  FJobsLeft := -1;
  FJobsTop := -1;
  FEventsLeft := -1;
  FEventsTop := -1;
  FInvoicesLeft := -1;
  FInvoicesTop := -1;

  btnCategories.visible := false;

  CCSCommon.SetDBGridCols('', 'CustomerLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);

  {Decide which columns to show}
  ShowColumns;

  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmPBMainMenu.iOperator,0,0) ;
  SetOperator(frmPBMainMenu.iOperator);
end;

procedure TfrmpbluCustomers.LUCustomersChildClosed(var Message: TMessage);
begin
  FChildLeft := message.WParam;
  FChildTop := message.LParam;
  frmpbLUCustOrders := nil;
  message.result := 1;
end;

procedure TfrmpbluCustomers.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustomers do
  begin
    btnAdd.Enabled := true;
    btnChange.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnBranches.Enabled := HeaderCount > 0;
    btnContacts.Enabled := HeaderCount > 0;
    btnCustReps.Enabled := HeaderCount > 0;
    btnAccMgrs.Enabled := HeaderCount > 0;
    btnCostCentres.Enabled := HeaderCount > 0;
    btnDiscounts.Enabled := HeaderCount > 0;
    btnTemplates.Enabled := HeaderCount > 0;
    btnCategories.Enabled := HeaderCount > 0;
    btnLabels.Enabled := HeaderCount > 0;
    btnCreditTerms.Enabled := HeaderCount > 0;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmpbluCustomers.btnChangeClick(Sender: TObject);
var
  bTempAskDets, bSQLAdd: boolean;
  bChangeRep, bChangeSecondaryRep, bChangeAccManager: boolean;
  iTempCount, iTempCode, iFirstCode: Integer;
  iNewRep, iNewSecondaryRep, iNewAccManager: integer;
begin
  if (dbgDetails.SelectedRows.Count = 1) or (pos('View',btnChange.Caption) > 0) then
    CallMaintScreen('C')
  else
    begin
      bChangeRep := false;
      bChangeSecondaryRep := false;
      bChangeAccManager := false;
      bTempAskDets := False ;
      for iTempCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
        begin
          dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iTempCount])) ;
          iTempCode := dbgDetails.datasource.DataSet.fieldbyname('Customer').asinteger;
          if iTempCount = 0 then
            iFirstCode := iTempCode;
          if bTempAskDets = False then
            begin
              PBMaintCustMultiFrm := TPBMaintCustMultiFrm.Create(Self);
              try
                with dtmdlCustomers.qryGetOneCustomer do
                  begin
                    Close ;
                    ParamByName('Customer').Asinteger := iTempCode;
                    Open ;
                    First ;

                    PBMaintCustMultiFrm.CustomerCount := dbgDetails.SelectedRows.Count;
                    PBMaintCustMultiFrm.edtTown.text := fieldbyname('Town').asstring;
                    PBMaintCustMultiFrm.edtCounty.text := fieldbyname('County').asstring;
                    PBMaintCustMultiFrm.edtVatRate.text := fieldbyname('Vat_Description').asstring;
                    PBMaintCustMultiFrm.edtType.text := fieldbyname('Customer_Type_Description').asstring;
                    PBMaintCustMultiFrm.edtAccManager.text := fieldbyname('Account_Manager_Name').asstring;
                    PBMaintCustMultiFrm.edtRep.text := fieldbyname('Rep_Name').asstring;
                    PBMaintCustMultiFrm.edtSecondaryRep.text := fieldbyname('Sub_Rep_Name').asstring;
                    PBMaintCustMultiFrm.edtImportance.text := fieldbyname('Importance_Description').asstring;
                    PBMaintCustMultiFrm.edtAnalysis1.text := fieldbyname('Analysis_Code_1').asstring;
                    PBMaintCustMultiFrm.edtAnalysis2.text := fieldbyname('Analysis_Code_2').asstring;
                    PBMaintCustMultiFrm.edtAnalysis3.text := fieldbyname('Analysis_Code_3').asstring;
                    PBMaintCustMultiFrm.edtAnalysis4.text := fieldbyname('Analysis_Code_4').asstring;
                    PBMaintCustMultiFrm.edtRevenueCentre.text := fieldbyname('Invoice_Location_Descr').asstring;
                    PBMaintCustMultiFrm.edtStatus.text := fieldbyname('Customer_Status_Descr').asstring;
                    PBMaintCustMultiFrm.edtPaymentTerms.text := fieldbyname('Payment_Terms_Description').asstring;

                    PBMaintCustMultiFrm.chkbxActive.Checked := (fieldbyname('Acc_Active').asstring = 'Y');
                    PBMaintCustMultiFrm.chkbxInvUpfront.checked := (fieldbyname('Invoice_Upfront').asstring = 'Y');
                  end;

                PBMaintCustMultiFrm.showmodal;

                if PBMaintCustMultiFrm.OK = false then
                  exit;

                with dtmdlCustomers.qryUpdMulti do
                  begin
                    bSQLAdd := True ;

                    SQL.Clear;
                    SQL.Add('Update Customer') ;
                    SQL.Add('Set Date_Created = Date_Created ') ;
                  end;

                with dtmdlCustomers.qryUpdMultiBranch do
                  begin
                    bSQLAddBranch := True ;

                    SQL.Clear;
                    SQL.Add('Update Customer_Branch') ;
                    SQL.Add('Set Account_Code_on_Ledger = Account_Code_on_Ledger ') ;
                  end;

                {Change of Town}
                if (PBMaintCustMultiFrm.edtTownTo.Text <> '') then
                  begin
                    MultiSQLAdd('Town = ''' + PBMaintCustMultiFrm.edtTownTo.text + '''', dtmdlCustomers.qryUpdMultiBranch, true);
                  end;

                {Change of County}
                if (PBMaintCustMultiFrm.edtCountyTo.Text <> '') then
                  begin
                    MultiSQLAdd('County = ''' + PBMaintCustMultiFrm.edtCountyTo.text + '''', dtmdlCustomers.qryUpdMultiBranch, true);
                  end;

                {Change of Vat Rate}
                if (PBMaintCustMultiFrm.dblkpVatRate.Text <> '') then
                  begin
                    MultiSQLAdd('Vat_Code_Def = ''' + inttostr(PBMaintCustMultiFrm.dblkpVatRate.keyvalue) + '''', dtmdlCustomers.qryUpdMulti, true);
                  end;

                {Change of Customer Type}
                if (PBMaintCustMultiFrm.dblkpType.Text <> '') then
                  begin
                    MultiSQLAdd('Customer_Type = ''' + inttostr(PBMaintCustMultiFrm.dblkpType.keyvalue) + '''', dtmdlCustomers.qryUpdMulti, true);
                  end;

                {Change of Level of Importance}
                if (PBMaintCustMultiFrm.dblkpImportance.Text <> '') then
                  begin
                    MultiSQLAdd('Level_of_Importance = ''' + inttostr(PBMaintCustMultiFrm.dblkpImportance.keyvalue) + '''', dtmdlCustomers.qryUpdMulti, true);
                  end;

                {Change of Revenue Centre}
                if (PBMaintCustMultiFrm.dblkpRevenueCentre.Text <> '') then
                  begin
                    MultiSQLAdd('Invoice_Location = ''' + inttostr(PBMaintCustMultiFrm.dblkpRevenueCentre.keyvalue) + '''', dtmdlCustomers.qryUpdMulti, true);
                  end;

                {Change of Analysis Code 1}
                if (PBMaintCustMultiFrm.edtAnalysisTo1.Text <> '') then
                  begin
                    MultiSQLAdd('Analysis_Code_1 = ''' + PBMaintCustMultiFrm.edtAnalysisTo1.text + '''', dtmdlCustomers.qryUpdMulti, true);
                  end;

                {Change of Analysis Code 2}
                if (PBMaintCustMultiFrm.edtAnalysisTo2.Text <> '') then
                  begin
                    MultiSQLAdd('Analysis_Code_2 = ''' + PBMaintCustMultiFrm.edtAnalysisTo2.text + '''', dtmdlCustomers.qryUpdMulti, true);
                  end;

                {Change of Analysis Code 3}
                if (PBMaintCustMultiFrm.edtAnalysisTo3.Text <> '') then
                  begin
                    MultiSQLAdd('Analysis_Code_3 = ''' + PBMaintCustMultiFrm.edtAnalysisTo3.text + '''', dtmdlCustomers.qryUpdMulti, true);
                  end;

                {Change of Analysis Code 4}
                if (PBMaintCustMultiFrm.edtAnalysisTo4.Text <> '') then
                  begin
                    MultiSQLAdd('Analysis_Code_4 = ''' + PBMaintCustMultiFrm.edtAnalysisTo4.text + '''', dtmdlCustomers.qryUpdMulti, true);
                  end;

                {Change of Customer Status}
                if (PBMaintCustMultiFrm.dblkpStatus.Text <> '') then
                  begin
                    MultiSQLAdd('Customer_Status = ''' + inttostr(PBMaintCustMultiFrm.dblkpStatus.keyvalue) + '''', dtmdlCustomers.qryUpdMulti, true);
                  end;

                {Change of Payment Terms}
                if (PBMaintCustMultiFrm.dblkpPaymentTerms.Text <> '') then
                  begin
                    MultiSQLAdd('Payment_Terms = ''' + inttostr(PBMaintCustMultiFrm.dblkpPaymentTerms.keyvalue) + '''', dtmdlCustomers.qryUpdMulti, true);
                  end;

                {Change of Invoice Upfront}
                if (PBMaintCustMultiFrm.chkbxInvUpFrontTo.state <> cbGrayed) then
                  begin
                    if PBMaintCustMultiFrm.chkbxInvUpFrontTo.checked then
                      MultiSQLAdd('Invoice_Upfront = ''' + 'Y' + '''', dtmdlCustomers.qryUpdMulti, true)
                    else
                      MultiSQLAdd('Invoice_Upfront = ''' + 'N' + '''', dtmdlCustomers.qryUpdMulti, true)
                  end;

                {Change of Active}
                if (PBMaintCustMultiFrm.chkbxActiveTo.state <> cbGrayed) then
                  begin
                    if PBMaintCustMultiFrm.chkbxActiveTo.checked then
                      MultiSQLAdd('Acc_Active = ''' + 'Y' + '''', dtmdlCustomers.qryUpdMulti, true)
                    else
                      MultiSQLAdd('Acc_Active = ''' + 'N' + '''', dtmdlCustomers.qryUpdMulti, true)
                  end;

                {Change of Rep}
                if (PBMaintCustMultiFrm.dblkpRep.Text <> '') then
                  begin
                    bChangeRep := true;
                    iNewRep := PBMaintCustMultiFrm.dblkpRep.keyvalue;
                  end;

                {Change of Secondary Rep}
                if (PBMaintCustMultiFrm.dblkpSecondaryRep.Text <> '') then
                  begin
                    bChangeSecondaryRep := true;
                    iNewSecondaryRep := PBMaintCustMultiFrm.dblkpSecondaryRep.keyvalue;
                  end;

                {Change of Account Manager/Operator}
                if (PBMaintCustMultiFrm.dblkpAccManager.Text <> '') then
                  begin
                    bChangeAccManager := true;
                    iNewAccManager := PBMaintCustMultiFrm.dblkpAccManager.keyvalue;
                  end;

                dtmdlCustomers.qryUpdMulti.SQL.Add(' Where Customer = :Customer') ;
                dtmdlCustomers.qryUpdMultiBranch.SQL.Add(' Where Customer = :Customer and Branch_no = :Branch_no') ;
                bTempAskDets := True ;
              finally
                PBMaintCustMultiFrm.free;
              end;

            end;
          {Run the update for each Customer selected}
          with dtmdlCustomers.qryUpdMulti do
            begin
              close ;
              ParamByName('Customer').Asinteger := iTempCode ;
              execSQL ;
            end;

          {Run the update of Branch}
          with dtmdlCustomers.qryUpdMultiBranch do
            begin
              close ;
              ParamByName('Customer').Asinteger := iTempCode ;
              ParamByName('Branch_no').Asinteger := 0 ;
              execSQL ;
            end;

          {Has the Rep been changed}
          if bChangeRep then
            begin
              with dtmdlCustomers.qryDelRepBranch do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  ParamByName('Branch_no').Asinteger := 0 ;
                  execsql;
                end;

              with dtmdlCustomers.qryAddRepBranch do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  ParamByName('Branch_no').Asinteger := 0 ;
                  ParamByName('Rep').Asinteger := iNewRep;
                  ParamByName('Is_Main_Rep').Asstring := 'Y';
                  execsql;
                end;
            end;

          {Has the Secondary Rep been changed}
          if bChangeSecondaryRep then
            begin
              with dtmdlCustomers.qryDelSecondRep do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  ParamByName('Branch_no').Asinteger := 0 ;
                  execsql;
                end;

              with dtmdlCustomers.qryAddRepBranch do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  ParamByName('Branch_no').Asinteger := 0 ;
                  ParamByName('Rep').Asinteger := iNewSecondaryRep;
                  ParamByName('Is_Main_Rep').clear;
                  execsql;
                end;
            end;

          {Has the Acc Manager been changed}
          if bChangeAccManager then
            begin
              with dtmdlCustomers.qryDelAccManager do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  execsql;
                end;

              with dtmdlCustomers.qryAddAccManager do
                begin
                  close;
                  ParamByName('Customer').Asinteger := iTempCode ;
                  ParamByName('Operator').Asinteger := iNewAccManager;
                  execsql;
                end;
            end;
        end;
        {Refresh the data and find the first product}
        dtmdlCustomers.Refreshdata;
        dbgDetails.datasource.DataSet.locate('Customer', Variant(iFirstCode),[lopartialKey]) ;

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
    end;
end;

procedure TfrmpbluCustomers.MultiSQLAdd(sTempStr: String; tmpQuery: TFDQuery; bBranch: boolean);
begin
  if bBranch then
    begin
      if bSQLAddBranch = False then
        begin
          tmpQuery.SQL.Add(sTempStr) ;
          bSQLAddBranch := True ;
        end
      else
        tmpQuery.SQL.Add(', ' + sTempStr)
    end
  else
    begin
      if bSQLAdd = False then
        begin
          tmpQuery.SQL.Add(sTempStr) ;
          bSQLAdd := True ;
        end
      else
        tmpQuery.SQL.Add(', ' + sTempStr)
    end;
end;

procedure TfrmpbluCustomers.CallMaintScreen(Mode: string);
var
  bTempOK: ByteBool;
  iTemp: integer;
begin
  if Mode = 'D' then
    begin
      if CustomerOrdersExist then
        begin
          if MessageDlg('Cannot delete this customer, contacts, orders, jobs, enquiries or activities may exist in the system. ' +
                    'Do you want to make this customer inactive?', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
          begin
            SetCustomerInactive;
            dtmdlCustomers.refreshdata;
          end;
          exit;
        end;
    end;

  PBMaintCustFrm := TPBMaintCustFrm.Create(self);
  try
    PBMaintCustFrm.dtmdlOneCustomer := dtmdlCustomers;
    if Mode = 'A' then
      PBMaintCustFrm.iCustomer := 0
    else
      PBMaintCustFrm.iCustomer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;

    PBMaintCustFrm.sFuncMode := Mode;

    PBMaintCustFrm.Prospect := false;
    PBMaintCustFrm.ShowModal;
    bTempOK := (PBMaintCustFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := PBMaintCustFrm.iCode;
        if Mode = 'A' then
          edtSearch.text := PBMaintCustFrm.NameEdit.text
        else
          begin
            dtmdlCustomers.refreshdata;
            dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTemp)),[lopartialKey]) ;

            with dbgDetails do
            begin
              try
                if datasource.dataset.recordcount > 0 then
                  SelectedRows.CurrentRowSelected := true ;
              except
              end;
            end;

          end;

      end;
  finally
    PBMaintCustFrm.Free;
  end;
end;

function TfrmpbluCustomers.CustomerOrdersExist: boolean;
begin
  with dtmdlCustomers.qryGetCustomerOrders do
    begin
      close;
      parambyname('Customer').asinteger := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
      open;

      result := (recordcount > 0);
    end;
end;

procedure TfrmpbluCustomers.SetCustomerInactive;
begin
  with dtmdlCustomers.qrySetCustomerInactive do
    begin
      close;
      parambyname('Customer').asinteger := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
      execsql;
    end;
end;

procedure TfrmpbluCustomers.btnAddClick(Sender: TObject);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  {Add a new customer}
  PBMaintCustFrm := TPBMaintCustFrm.Create(Self);
  try
    PBMaintCustFrm.sFuncMode := 'A';
    PBMaintCustFrm.Prospect := false;
    PBMaintCustFrm.ShowModal;
    bTempOK := (PBMaintCustFrm.ModalResult = mrOK);
    iTempSel := PBMaintCustFrm.iCode;

    if bTempOK then
    begin
      PBMaintCContaFrm := TPBMaintCContaFrm.Create(Self);
      try
        PBMaintCContaFrm.sFuncMode := 'A';
        PBMaintCContaFrm.iCust := iTempSel;
        PBMaintCContaFrm.iBranch := 0;

        PBMaintCContaFrm.iCode := 0;
        PBMaintCContaFrm.sCustName := PBMaintCustFrm.NameEdit.Text;
        PBMaintCContaFrm.sBranchName := 'Head Office';
        PBMaintCContaFrm.PhoneEdit.text := PBMaintCustFrm.PhoneEdit.Text;
        PBMaintCContaFrm.FaxEdit.text := PBMaintCustFrm.FaxEdit.Text;

        PBMaintCContaFrm.ShowModal;
      finally
        PBMaintCContaFrm.Free;
      end;

      PBMaintCRepFrm := TPBMaintCRepFrm.Create(Self);
      try
        PBMaintCRepFrm.sFuncMode := 'A';
        PBMaintCRepFrm.iCust := iTempSel;
        PBMaintCRepFrm.iBranch := 0;

        PBMaintCRepFrm.iCode := 0;
        PBMaintCRepFrm.OperatorRep := iOperatorRep;
        PBMaintCRepFrm.sCustName := PBMaintCustFrm.NameEdit.Text;
        PBMaintCRepFrm.sBranchName := 'Head Office';
        PBMaintCRepFrm.ShowModal;
      finally
        PBMaintCRepFrm.Free;
      end;

//Create the record in the Technique system
      if dmBroker.GetSchedulePackage = 'TECHNIQUE' then
        CreateCustomerTechXMLData(iTempSel);

    end;
  finally
    PBMaintCustFrm.Free;
  end;

  if bTempOK then
  begin
    edtSearch.text := PBMaintCustFrm.NameEdit.text;
    dtmdlCustomers.refreshdata;
    dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTempSel)),[lopartialKey]) ;

    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
  end;

end;

procedure TfrmpbluCustomers.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmpbluCustomers.btnStockClick(Sender: TObject);
var
  oldCursor: TCursor;
begin
  OldCursor := screen.cursor;
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,'mnuStock') ;
  if Assigned(frmpbLUCustStock) then
    begin
      if frmpbLUCustStock.Customer <> dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger then
        begin
          frmpbLUCustStock.ClearSearchCriteria;
          frmpbLUCustStock.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
          frmpbLUCustStock.Caption := 'Customer stock - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbLUCustStock.lblTitle.Caption := 'Customer stock - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        end;
      frmpbLUCustStock.BringToFront
    end
  else
    begin
      try
        screen.cursor := crHourGlass;

        frmpbLUCustStock := TfrmpbLUCustStock.create(self);
        frmpbLUCustStock.ParentForm := Self;
        frmpbLUCustStock.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
        frmpbLUCustStock.Caption := 'Customer stock - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbLUCustStock.lblTitle.Caption := 'Customer stock - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        if FStockLeft >=0 then
          begin
            frmpbLUCustStock.position := poDesigned;
            frmpbluCustStock.windowstate := frmpbluCustomers.windowstate;
            frmpbLUCustStock.left := FStockleft;
            frmpbLUCustStock.top := FStockTop;
          end;
        frmpbLUCustStock.show;
      finally
        screen.cursor := oldcursor;
      end;
    end;
end;

procedure TfrmpbluCustomers.LUCustomersStockClosed(var Message: TMessage);
begin
  FStockLeft := message.WParam;
  FStockTop := message.LParam;
  frmpbLUCustStock := nil;
  message.result := 1;
end;

procedure TfrmpbluCustomers.btnBranchesClick(Sender: TObject);
begin
  frmpbluBranches := TfrmpbluBranches.create(self);
  try
    frmpbluBranches.Code := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    frmpbluBranches.CodeType := 'C';
    frmpbluBranches.CostCentreLevel := dbgDetails.datasource.dataset.fieldbyname('Cost_Centre_Level').asstring;
    frmpbluBranches.Caption := 'Customer '+ frmpbluBranches.Caption + ' - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluBranches.MainName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;

    frmpbluBranches.showmodal;
  finally
    frmpbluBranches.free;
  end;
end;

procedure TfrmpbluCustomers.btnEnquiriesClick(Sender: TObject);
var
  oldCursor: TCursor;
begin
  OldCursor := screen.cursor;
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,'mnuEnquiries') ;
  if Assigned(frmpbluCustEnquiries) then
    begin
      if frmpbluCustEnquiries.Customer <> dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger then
        begin
          frmpbluCustEnquiries.ClearSearchCriteria;
          frmpbluCustEnquiries.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
          frmpbluCustEnquiries.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbluCustEnquiries.Caption := 'Customer enquiries - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbluCustEnquiries.lblTitle.Caption := 'Customer enquiries - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        end;
      frmpbluCustEnquiries.BringToFront
    end
  else
    begin
      try
        screen.cursor := crHourGlass;

        frmpbluCustEnquiries := TfrmpbluCustEnquiries.create(self);
        frmpbluCustEnquiries.ParentForm := Self;
        frmpbluCustEnquiries.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
        frmpbluCustEnquiries.Caption := 'Customer enquiries - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbluCustEnquiries.lblTitle.Caption := 'Customer enquiries - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        if FEnqsLeft >=0 then
          begin
            frmpbluCustEnquiries.position := poDesigned;
            frmpbluCustEnquiries.windowstate := frmpbluCustomers.windowstate;
            frmpbluCustEnquiries.left := FEnqsleft;
            frmpbluCustEnquiries.top := FEnqsTop;
          end;
        frmpbluCustEnquiries.show;
      finally
        screen.cursor := oldcursor;
      end;
    end;
end;

procedure TfrmpbluCustomers.LUCustomersEnqsClosed(var Message: TMessage);
begin
  FEnqsLeft := message.WParam;
  FEnqsTop := message.LParam;
  frmpbLUCustEnquiries := nil;
  message.result := 1;
end;

procedure TfrmpbluCustomers.btnDeleteClick(Sender: TObject);
begin
  if dbgDetails.datasource.dataset.fieldbyname('Rep_Name').asstring <> '' then
    begin
      MessageDlg('Customer cannot be deleted, a Rep is associated with this customer', mtInformation,
        [mbOk], 0);
      exit;
    end;
  CallMaintScreen('D');
end;

procedure TfrmpbluCustomers.btnContactsClick(Sender: TObject);
var
  iTemp: integer;
begin
  frmpbluContacts := TfrmpbluContacts.create(self);
  try
    iTemp := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    frmpbluContacts.Code := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    frmpbluContacts.CodeType := 'C';
    frmpbluContacts.Caption := 'Customer '+ frmpbluContacts.Caption + ' - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluContacts.MainName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluContacts.showmodal;
    if frmpbluContacts.somethingChanged then
      begin
        dtmdlCustomers.refreshdata;
        dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTemp)),[lopartialKey]) ;

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    frmpbluContacts.free;
  end;
end;

procedure TfrmpbluCustomers.btnJobsClick(Sender: TObject);
var
  oldCursor: TCursor;
begin
  OldCursor := screen.cursor;
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,'mnuJobs') ;
  if Assigned(frmpbLUCustJobs) then
    begin
      if frmpbLUCustJobs.Customer <> dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger then
        begin
          frmpbLUCustJobs.ClearSearchCriteria;
          frmpbLUCustJobs.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
          frmpbLUCustJobs.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbLUCustJobs.Caption := 'Customer jobs - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbLUCustJobs.lblTitle.Caption := 'Customer jobs - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        end;
      frmpbLUCustJobs.BringToFront
    end
  else
    begin
      try
        screen.cursor := crHourGlass;

        frmpbLUCustJobs := TfrmpbLUCustJobs.create(self);
        frmpbLUCustJobs.ParentForm := Self;
        frmpbLUCustJobs.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
        frmpbLUCustJobs.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbLUCustJobs.Caption := 'Customer jobs - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbLUCustJobs.lblTitle.Caption := 'Customer jobs - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        if FJobsLeft >=0 then
          begin
            frmpbLUCustJobs.position := poDesigned;
            frmpbLUCustJobs.windowstate := frmpbluCustomers.windowstate;
            frmpbLUCustJobs.left := FJobsleft;
            frmpbLUCustJobs.top := FJobsTop;
          end;
        frmpbLUCustJobs.show;
      finally
        screen.cursor := oldcursor;
      end;
    end;
end;

procedure TfrmpbluCustomers.LUCustomersJobsClosed(var Message: TMessage);
begin
  FJobsLeft := message.WParam;
  FJobsTop := message.LParam;
  frmpbLUCustJobs := nil;
  message.result := 1;
end;

procedure TfrmpbluCustomers.mnuResetClick(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('CustomerLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmpbluCustomers.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuCustomers') ;
  if not FActivated then
  begin
    dbgDetails.DataSource := dtmdlCustomers.dtsCustomers;

    btnStock.visible := frmPBMainMenu.btnStock.visible;
    btnJobs.visible := frmPBMainMenu.btnJobs.visible;
    {Check if the operator REP is needed} ;
    If dmBroker.iAccCtrlMenu = 4 then
      iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
    else
      iOperatorRep := 0 ;
    dtmdlCustomers.Rep := iOperatorRep;
    dtmdlCustomers.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

    FActivated := True;
  end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlCustomers.RefreshData;
  dbgDetails.datasource.DataSet.locate('Customer', Variant(floattostr(ActiveCode)),[lopartialKey]) ;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmpbluCustomers.btnCustomersClick(Sender: TObject);
var
  oldCursor: TCursor;
begin
  OldCursor := screen.cursor;
  if Assigned(frmpbluCustEvents) then
    begin
      if frmpbluCustEvents.Customer <> dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger then
        begin
          frmpbluCustEvents.ClearSearchCriteria;
          frmpbluCustEvents.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
          frmpbluCustEvents.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbluCustEvents.Caption := 'Customer call details - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbluCustEvents.lblTitle.Caption := 'Customer call details - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        end;
      frmpbluCustEvents.BringToFront
    end
  else
    begin
      try
        screen.cursor := crHourGlass;

        frmpbluCustEvents := TfrmpbluCustEvents.create(self);
        frmPBLUCustEvents.dtmdlCustomerEvents := TdtmdlEvents.create(self);
        frmPBLUCustEvents.dbgDetails.DataSource := frmPBLUCustEvents.dtmdlCustomerEvents.dtsEvents;
        frmPBLUCustEvents.dtmdlCustomerEvents.dtsEvents.OnDataChange := frmPBLUCustEvents.SetButtons;
        frmPBLUCustEvents.Prospects := false;
        frmpbluCustEvents.ParentForm := Self;
        frmpbluCustEvents.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
        frmpbluCustEvents.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbluCustEvents.Caption := 'Customer call details - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbluCustEvents.lblTitle.Caption := 'Customer call details - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        if FEventsLeft >=0 then
          begin
            frmpbluCustEvents.position := poDesigned;
            frmpbluCustEvents.windowstate := frmpbluCustomers.windowstate;
            frmpbluCustEvents.left := FEventsleft;
            frmpbluCustEvents.top := FEventsTop;
          end;
        frmpbluCustEvents.show;
      finally
        screen.cursor := oldcursor;
      end;
    end;
end;

procedure TfrmpbluCustomers.LUCustomersEventsClosed(var Message: TMessage);
begin
  FEventsLeft := message.WParam;
  FEventsTop := message.LParam;
  frmpbLUCustEvents := nil;
  message.result := 1;
end;

procedure TfrmpbluCustomers.btnCustRepsClick(Sender: TObject);
var
  iTemp: integer;
begin
  frmpbluReps := TfrmpbluReps.create(self);
  try
    iTemp := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    frmpbluReps.OperatorRep := self.iOperatorRep;
    frmpbluReps.Code := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    frmpbluReps.Caption := 'Customer '+ frmpbluReps.Caption + ' - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluReps.MainName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluReps.bViewMode := dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator);
    frmpbluReps.showmodal;
    if frmpbluReps.somethingChanged then
      begin
        dtmdlCustomers.refreshdata;
        dbgDetails.DataSource.DataSet.Locate('Customer', Variant(inttostr(iTemp)),[lopartialKey]) ;

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    frmpbluReps.free;
  end;
end;

procedure TfrmpbluCustomers.btnReportsClick(Sender: TObject);
begin
  frmPBLUCustomerRpts := TfrmPBLUCustomerRpts.create(self);
  try
    frmPBLUCustomerRpts.showmodal;
  finally
    frmPBLUCustomerRpts.free;
  end;

end;

procedure TfrmpbluCustomers.LUCustomersSInvoicesClosed(
  var Message: TMessage);
begin
  FInvoicesLeft := message.WParam;
  FInvoicesTop := message.LParam;
  frmpbLUCustSalesInvoices := nil;
  message.result := 1;
end;

procedure TfrmpbluCustomers.btnSalesInvoicingClick(Sender: TObject);
var
  oldCursor: TCursor;
begin
  OldCursor := screen.cursor;
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,'mnuSalesInvoicing') ;
  if Assigned(frmpbluCustSalesInvoices) then
    begin
      if frmpbluCustSalesInvoices.Customer <> dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger then
        begin
          frmpbluCustSalesInvoices.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbluCustSalesInvoices.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
          frmpbluCustSalesInvoices.Caption := 'Customer invoices - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbluCustSalesInvoices.lblTitle.Caption := 'Customer invoices - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        end;
      frmpbluCustSalesInvoices.BringToFront
    end
  else
    begin
      try
        screen.cursor := crHourGlass;

        frmpbluCustSalesInvoices := TfrmpbluCustSalesInvoices.create(self);
        frmpbluCustSalesInvoices.ParentForm := Self;
        frmpbluCustSalesInvoices.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbluCustSalesInvoices.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
        frmpbluCustSalesInvoices.Caption := 'Customer invoices - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbluCustSalesInvoices.lblTitle.Caption := 'Customer invoices - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        if FEventsLeft >=0 then
          begin
            frmpbluCustSalesInvoices.position := poDesigned;
            frmpbluCustSalesInvoices.windowstate := frmpbluCustomers.windowstate;
            frmpbluCustSalesInvoices.left := FEventsleft;
            frmpbluCustSalesInvoices.top := FEventsTop;
          end;
        frmpbluCustSalesInvoices.show;
      finally
        screen.cursor := oldcursor;
      end;
    end;
end;

procedure TfrmpbluCustomers.SetOperator(iTempOp: Integer);
var
  icount                      : Integer;
  cTempComp                   : TComponent;
begin
  {Disable all selection buttons}
  for icount := 0 to ComponentCount - 1 do
  begin
    if Components[icount] is TToolButton then
    begin
      if TToolButton(Components[icount]).Parent.Name = 'ToolBar2' then
        TToolButton(Components[icount]).Enabled := False;
    end;
  end;
  {Set buttons according to file}
  try
    with dmBroker.qryGetButtons do
    begin
      Close;
      ParamByName('Operator').AsInteger := iTempOp;
      Open;
      First;
      while not EOF do
      begin
        cTempComp :=
          self.FindComponent(stringreplace((FieldByName('Button_Name').AsString),'mnu','btn',[rfReplaceAll,rfIgnoreCase]));
        if Assigned(cTempComp) then
          if cTempComp is TToolButton then
            try
            (cTempComp as TToolButton).Enabled := (FieldByName('Button_Status').AsString <> 'B');
            except
            end;
        Next;
      end;
    end;
  except
  end;
end;

procedure TfrmpbluCustomers.btnCostCentresClick(Sender: TObject);
begin
  PBLUCustCstCntrFrm := TPBLUCustCstCntrFrm.Create(Self);
  try
    PBLUCustCstCntrFrm.bIs_Lookup := False;
    PBLUCustCstCntrFrm.bAllow_Upd := True;
    PBLUCustCstCntrFrm.iCust := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
    PBLUCustCstCntrFrm.sCustName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBLUCustCstCntrFrm.ShowModal;
  finally
    PBLUCustCstCntrFrm.Free;
  end;

end;

procedure TfrmpbluCustomers.btnDiscountsClick(Sender: TObject);
begin
  PBLUCustDiscFrm := TPBLUCustDiscFrm.Create(Self);
  try
    PBLUCustDiscFrm.bIs_Lookup := False;
    PBLUCustDiscFrm.bAllow_Upd := True;
    PBLUCustDiscFrm.iCust := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
    PBLUCustDiscFrm.sCustName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBLUCustDiscFrm.ShowModal;
  finally
    PBLUCustDiscFrm.Free;
  end;

end;

procedure TfrmpbluCustomers.btnLabelsClick(Sender: TObject);
begin
  PBRSCusSupLabsFrm := TPBRSCusSupLabsFrm.Create(Self);
  try
    {Select mode as customer/supplier} ;
    PBRSCusSupLabsFrm.bCustomer := True;
    {Feed in the supplier code} ;
    PBRSCusSupLabsFrm.iCode := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
    PBRSCusSupLabsFrm.sName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBRSCusSupLabsFrm.ShowModal;
  finally
    PBRSCusSupLabsFrm.Free;
  end;
end;

procedure TfrmpbluCustomers.pmnFunctionsPopup(Sender: TObject);
begin
  mnuCalls.enabled := btnCustomers.enabled;
  mnuAdd.enabled := btnAdd.enabled;
  mnuChange.enabled := btnChange.enabled;
  mnuDelete.enabled := btnDelete.enabled;
  mnuLabels.enabled := btnLabels.enabled;
  mnuCreditTerms.enabled := btnCreditTerms.enabled;
  mnuBranches.enabled := btnBranches.enabled;
  mnuContacts.enabled := btnContacts.enabled;
  mnuCustReps.enabled := btnCustReps.enabled;
  mnuAccMgrs.enabled := btnAccMgrs.enabled;
  mnuCostCentres.enabled := btnCostCentres.enabled;
  mnuDiscounts.enabled := btnDiscounts.enabled;
  mnuEnquiries.enabled := btnDiscounts.enabled;
  mnuProduction.enabled := btnProduction.enabled;
  mnuStock.enabled := btnStock.enabled;
  mnuJobs.enabled := btnJobs.enabled;
  mnuSalesInvoicing.enabled := btnSalesInvoicing.enabled;
end;

procedure TfrmpbluCustomers.btnSearchClick(Sender: TObject);
begin
  frmpbluCustomerSearch := TfrmpbluCustomerSearch.create(self);
  try
    if sAnalysis1 <> '' then
      frmpbluCustomerSearch.lblAnalysis1.caption := sAnalysis1;
    if sAnalysis2 <> '' then
      frmpbluCustomerSearch.lblAnalysis2.caption := sAnalysis2;
    if sAnalysis3 <> '' then
      frmpbluCustomerSearch.lblAnalysis3.caption := sAnalysis3;
    if sAnalysis4 <> '' then
      frmpbluCustomerSearch.lblAnalysis4.caption := sAnalysis4;

    frmpbluCustomerSearch.dtmdlSearchCustomers := dtmdlCustomers;
    frmpbluCustomerSearch.edtTown.text := dtmdlCustomers.Town;
    frmpbluCustomerSearch.edtPostcode.Text := dtmdlCustomers.Postcode;
    frmpbluCustomerSearch.edtCounty.Text := dtmdlCustomers.County;
    frmpbluCustomerSearch.edtTelephone.Text := dtmdlCustomers.Telephone;
    frmpbluCustomerSearch.edtFax.Text := dtmdlCustomers.Fax;
    frmpbluCustomerSearch.edtRep.Text := dtmdlCustomers.RepName;
    frmpbluCustomerSearch.edtSubRep.Text := dtmdlCustomers.SubRepName;
    frmpbluCustomerSearch.edtCustomerStatus.Text := dtmdlCustomers.CustomerStatus;
    frmpbluCustomerSearch.edtCustomerType.Text := dtmdlCustomers.CustomerType;
    frmpbluCustomerSearch.edtAccountManager.Text := dtmdlCustomers.AccountManager;
    frmpbluCustomerSearch.edtTerms.Text := dtmdlCustomers.Terms;
    frmpbluCustomerSearch.edtRevenueCentre.Text := dtmdlCustomers.RevenueCentre;
    frmpbluCustomerSearch.edtImportance.Text := dtmdlCustomers.Importance;
    frmpbluCustomerSearch.edtAnalysis1.Text := dtmdlCustomers.Analysis1;
    frmpbluCustomerSearch.edtAnalysis2.Text := dtmdlCustomers.Analysis2;
    frmpbluCustomerSearch.edtAnalysis3.Text := dtmdlCustomers.Analysis3;
    frmpbluCustomerSearch.edtAnalysis4.Text := dtmdlCustomers.Analysis4;

    frmpbluCustomerSearch.edtDate.Text := pbDateStr(dtmdlCustomers.DateCreated);

    frmpbluCustomerSearch.chkbxShowInactive.checked := dtmdlCustomers.ShowInactive;
    frmpbluCustomerSearch.showModal;
  finally
    frmpbluCustomerSearch.free;
  end;

end;

procedure TfrmpbluCustomers.btnTemplatesClick(Sender: TObject);
begin
  PBLUCustProductTempFrm := TPBLUCustProductTempFrm.Create(Self);
  try
    PBLUCustProductTempFrm.bIs_Lookup := False;
    PBLUCustProductTempFrm.bAllow_Upd := True;
    PBLUCustProductTempFrm.iCust := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
    PBLUCustProductTempFrm.sPrefix := dbgDetails.datasource.DataSet.FieldByName('Product_Code_Prefix').AsString;
    PBLUCustProductTempFrm.sCustName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBLUCustProductTempFrm.ShowModal;
  finally
    PBLUCustProductTempFrm.Free;
  end;

end;

procedure TfrmpbluCustomers.btnCategoriesClick(Sender: TObject);
begin
  PBLUCustomerCatsFrm := TPBLUCustomerCatsFrm.Create(Self);
  try
    PBLUCustomerCatsFrm.bIs_Lookup := False;
    PBLUCustomerCatsFrm.bAllow_Upd := True;
    PBLUCustomerCatsFrm.iCust := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
    PBLUCustomerCatsFrm.sCustName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBLUCustomerCatsFrm.ShowModal;
  finally
    PBLUCustomerCatsFrm.Free;
  end;
end;

procedure TfrmpbluCustomers.btnAccMgrsClick(Sender: TObject);
var
  iTemp: integer;
begin
  PBMaintCustAccMgrFrm := TPBMaintCustAccMgrFrm.create(self);
  try
    iTemp := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    PBMaintCustAccMgrFrm.CustomerCode := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
    PBMaintCustAccMgrFrm.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    PBMaintCustAccMgrFrm.showmodal;
    if PBMaintCustAccMgrFrm.bOK and PBMaintCustAccMgrFrm.bRefresh then
      begin
        dtmdlCustomers.refreshdata;

        dbgDetails.datasource.DataSet.locate('Customer', Variant(iTemp),[lopartialKey]) ;

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    PBMaintCustAccMgrFrm.free;
  end;

end;

procedure TfrmpbluCustomers.CreateCustomerTechXMLData(tmpCode: integer);
var
  i: integer;
  tmpDir, filename: string;
begin
  tmpDir := getWinTempDir;
  filename := tmpDir+inttostr(tmpCode)+'.xml';

  with dtmdlCustomers.qryGetTechCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tmpCode;
      open;

      if recordcount > 0 then
        CreateTechCustXMLFile(filename)
      else
        exit;

  // write away the customer code and name details
      for i := 0 to 1 do
        begin
          WriteTechCustXMLHead(filename, Fields[i]);
        end;
  // write away the customer type
      WriteTechCustTypeXMLHead(filename);

  // write away the address details
      for i := 2 to pred(Fieldcount) do
        begin
          WriteTechAddrXMLHead(filename, Fields[i]);
        end;
    end;

  with dtmdlCustomers.qryGetTechContact do
    begin
      close;
      parambyname('Customer').asinteger := tmpCode;
      open;

      if recordcount > 0 then
        begin
          for i := 0 to pred(Fieldcount) do
            WriteTechContactXMLHead(filename, Fields[i]);
        end;
    end;

  WriteTechContactXMLFoot(filename);
  WriteTechAddrXMLFoot(filename);

  CloseTechCustXMLFile(filename);

//Now post the XML file to the Technique system
  PostTechXMLtoSchedule(filename);
//  DeleteFile(filename);
end;

procedure TfrmpbluCustomers.PostTechXMLtoSchedule(filename: string);
 var fileSource, Source: TMemoryStream;
     ts, Response: TStringStream;
     s, strJDFURL : string;
begin
  IdHTTP1.Request.ContentType := 'application/vnd.cip4-jmf+xml';    // important!
//  IdHTTP1.Intercept := SSL;             // port 443 is automatically used
//  IdHTTP1.InterceptEnabled := true;

  // prepare post
  Response := TStringStream.Create('');
  Source := TMemoryStream.Create();
  fileSource := TMemoryStream.Create();

  strJDFURL := 'http://FPSERVER1/jdfconsumer/jmflistener.aspx';
  try
    // concatenate string 's' and stream 'fileSource' to create data to be posted
    s := '';
    Source.Write(s[1], Length(s));

    fileSource.LoadFromFile(filename);
    Source.Copyfrom(fileSource, fileSource.Size);

    // show posted data in the memo
    ts := TStringStream.Create('');
    Source.Position := 0;
    ts.CopyFrom(Source, Source.Size);
    ts.Free;
    // post data
    IdHTTP1.Post(strJDFURL, Source, Response);
  finally
    fileSource.Free;
    Source.Free;
  end;
  Response.Free;
end;

procedure TfrmpbluCustomers.Button1Click(Sender: TObject);
begin
  CreateCustomerTechXMLData(dbgDetails.DataSource.DataSet.fieldbyname('Customer').asinteger);
end;

procedure TfrmpbluCustomers.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('Acc_Active').AsString = 'N') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if cmbColourCoding.itemindex = 0 then
    begin
      if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 10) then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := clGreen;
          (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end
      else
      if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 20) then
        begin
          (Sender as TDBGrid).Canvas.font.color := clblue;
          (Sender as TDBGrid).Canvas.Brush.color := clyellow;
          (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end
      else
      if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 30) then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := $000080FF;
          (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end
      else
      if (dbgDetails.datasource.dataset.fieldByName('Credit_Rating').AsInteger = 40) then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := clRed;
          (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end;
    end
  else
  if cmbColourCoding.itemindex = 1 then
    begin
      if dbgDetails.datasource.dataset.fieldByName('Customer_Type_Color').asinteger <> 0 then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('Customer_Type_Color').asinteger;
          (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Customer_Type_Font_Color').asinteger;
          (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end
    end
  else
  if cmbColourCoding.itemindex = 2 then
    begin
      if dbgDetails.datasource.dataset.fieldByName('Importance_Color').asinteger <> 0 then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('Importance_Color').asinteger;
          (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Importance_Font_Color').asinteger;
          (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end;
    end
  else
  if cmbColourCoding.itemindex = 3 then
    begin
      if dbgDetails.datasource.dataset.fieldByName('Invoice_location_Color').asinteger <> 0 then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('Invoice_location_Color').asinteger;
          (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Invoice_location_Font_Color').asinteger;
          (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end;
    end;

  
end;

procedure TfrmpbluCustomers.LUCustomersQuotesClosed(var Message: TMessage);
begin
  FQuotesLeft := message.WParam;
  FQuotesTop := message.LParam;
  frmpbLUCustQuotes := nil;
  message.result := 1;
end;

procedure TfrmpbluCustomers.btnQuotesClick(Sender: TObject);
var
  oldCursor: TCursor;
begin
  OldCursor := screen.cursor;
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,'mnuQuotes') ;
  if Assigned(frmpbluCustQuotes) then
    begin
      if frmpbluCustQuotes.Customer <> dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger then
        begin
          frmpbluCustQuotes.ClearSearchCriteria;
          frmpbluCustQuotes.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
          frmpbluCustQuotes.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbluCustQuotes.Caption := 'Customer quotations - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
          frmpbluCustQuotes.lblTitle.Caption := 'Customer quotations - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        end;
      frmpbluCustQuotes.BringToFront
    end
  else
    begin
      try
        screen.cursor := crHourGlass;

        frmpbluCustQuotes := TfrmpbluCustQuotes.create(self);
        frmpbluCustQuotes.ParentForm := Self;
        frmpbluCustQuotes.Customer := dbgDetails.datasource.dataset.fieldbyname('Customer').asinteger;
        frmpbluCustQuotes.Caption := 'Customer quotations - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        frmpbluCustQuotes.lblTitle.Caption := 'Customer quotations - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
        if FEnqsLeft >=0 then
          begin
            frmpbluCustQuotes.position := poDesigned;
            frmpbluCustQuotes.windowstate := frmpbluCustomers.windowstate;
            frmpbluCustQuotes.left := FEnqsleft;
            frmpbluCustQuotes.top := FEnqsTop;
          end;
        frmpbluCustQuotes.show;
      finally
        screen.cursor := oldcursor;
      end;
    end;
end;

procedure TfrmpbluCustomers.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Customer').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmpbluCustomers.btnSweepClick(Sender: TObject);
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

procedure TfrmpbluCustomers.ShowColumns;
var
  icount: integer;
  bUseCreditChecking: boolean;
begin
  {Get Analysis Codes}
  sAnalysis1 := dmBroker.GetAnalysisCode1;
  sAnalysis2 := dmBroker.GetAnalysisCode2;
  sAnalysis3 := dmBroker.GetAnalysisCode3;
  sAnalysis4 := dmBroker.GetAnalysisCode4;

  bUseCreditChecking := dmBroker.UseCreditChecking;

  for icount := 0 to pred(dbgDetails.columns.count) do
    begin
      if (dbgDetails.columns[icount].Title.Caption = 'Credit Score') or
         (dbgDetails.columns[icount].Title.Caption = 'Credit Limit') or
         (dbgDetails.columns[icount].Title.Caption = 'SIC Code') or
         (dbgDetails.columns[icount].Title.Caption = 'Credit Rating') then
            dbgDetails.Columns[icount].Visible := bUseCreditChecking
      else
        dbgDetails.Columns[icount].Visible := true;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 1') and (sAnalysis1 <> '') then
        dbgDetails.columns[icount].Title.Caption := sAnalysis1;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 2') and (sAnalysis2 <> '') then
        dbgDetails.columns[icount].Title.Caption := sAnalysis2;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 3') and (sAnalysis3 <> '') then
        dbgDetails.columns[icount].Title.Caption := sAnalysis3;

      if (dbgDetails.columns[icount].Title.Caption = 'Analysis 4') and (sAnalysis4 <> '') then
        dbgDetails.columns[icount].Title.Caption := sAnalysis4;
    end;
end;

procedure TfrmpbluCustomers.btnCreditTermsClick(Sender: TObject);
begin
  PBRSCustCreditTermsFrm := TPBRSCustCreditTermsFrm.Create(Self);
  try
    {Feed in the customer code} ;
    PBRSCustCreditTermsFrm.iCode := dbgDetails.datasource.DataSet.FieldByName('Customer').AsInteger;
    PBRSCustCreditTermsFrm.sName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBRSCustCreditTermsFrm.sAccountCode := dbgDetails.datasource.DataSet.FieldByName('Account_Code').AsString;
    PBRSCustCreditTermsFrm.ShowModal;
  finally
    PBRSCustCreditTermsFrm.Free;
  end;
end;

procedure TfrmpbluCustomers.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlCustomers.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlCustomers.SortOrder := SortField + SortType;
  dtmdlCustomers.SortType := SortType;

  dtmdlCustomers.refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmpbluCustomers.cmbColourCodingChange(Sender: TObject);
begin
  dtmdlCustomers.refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

end.
