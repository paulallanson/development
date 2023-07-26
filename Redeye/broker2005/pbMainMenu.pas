unit pbMainMenu;

interface                                           

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ToolWin, ComCtrls, Menus, StdActns, ActnList, Grids,
  DBGrids, ExtCtrls, ImgList, ShellAPI, CCSCommon, DB, DBTables, OleCtnrs,
  IniFiles, PBActivityDM, System.Actions, System.ImageList;

type
  TfrmpbMainMenu = class(TForm)                                                                                
    CoolBar1: TCoolBar;
    File1: TMenuItem;
    miExit: TMenuItem;
    N2: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    Edit1: TMenuItem;
    Paste1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    HowtoUseHelp1: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    Contents1: TMenuItem;
    miModules: TMenuItem;
    stsbrMainMenu: TStatusBar;
    imglstMainMenu: TImageList;
    ActionList1: TActionList;
    WindowArrange1: TWindowArrange;
    WindowCascade1: TWindowCascade;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    Action1: TAction;
    Window1: TMenuItem;
    ArrangeAll1: TMenuItem;
    Cascade1: TMenuItem;
    MinimizeAll1: TMenuItem;
    TileHorizontally1: TMenuItem;
    TileVertically1: TMenuItem;
    mnuCustomers: TMenuItem;
    mnuSuppliers: TMenuItem;
    miSettings: TMenuItem;
    mnuCompanyPrefs: TMenuItem;
    mnuProductTypes: TMenuItem;
    mnuReps: TMenuItem;
    N6: TMenuItem;
    mnuAdhoc: TMenuItem;
    mnuSpecialInst: TMenuItem;
    mnuAddCharges: TMenuItem;
    N7: TMenuItem;
    mnuPriceUnits: TMenuItem;
    mnuGeneralCats: TMenuItem;
    mnuPaperSizes: TMenuItem;
    mnuPaperDetails: TMenuItem;
    mnuVatRates: TMenuItem;
    mnuArtworkTypes: TMenuItem;
    N8: TMenuItem;
    mnuOperators: TMenuItem;
    mnuSystem: TMenuItem;
    mnuLastNumbers: TMenuItem;
    mnuInterfaces: TMenuItem;
    mnuAuditTrail: TMenuItem;
    mnuEnquiries: TMenuItem;
    mnuJobs: TMenuItem;
    mnuStock: TMenuItem;
    mnuSalesInvoicing: TMenuItem;
    mnuProduction: TMenuItem;
    mnuCallOffs: TMenuItem;
    mnuPurchaseInvoicing: TMenuItem;
    miStock: TMenuItem;
    mnuStoreTypes: TMenuItem;
    mnuStores: TMenuItem;
    N9: TMenuItem;
    mnuProductGroups: TMenuItem;
    miTools: TMenuItem;
    mnuDatabaseUp: TMenuItem;
    mnuPurchases: TMenuItem;
    mnuEmailManager: TMenuItem;
    mnuStockPrefs: TMenuItem;
    N10: TMenuItem;
    mnuPageDesigner: TMenuItem;
    pmnPurchaseInvoicing: TPopupMenu;
    mnuPurchaseCredit: TMenuItem;
    Close1: TMenuItem;
    Backup1: TMenuItem;
    N1: TMenuItem;
    Import1: TMenuItem;
    N11: TMenuItem;
    miSendTo: TMenuItem;
    mnMain: TMainMenu;
    mnuReasons: TMenuItem;
    mnuProof: TMenuItem;
    mnuPeriodEnd: TMenuItem;
    mnuProfitReports: TMenuItem;
    mnuClient: TMenuItem;
    mnuViewAuditTrail: TMenuItem;
    N3: TMenuItem;
    mnuStocktake: TMenuItem;
    mnuSetCurrentPeriod: TMenuItem;
    mnuFinancials: TMenuItem;
    mnuJobTypes: TMenuItem;
    mnuFormReferences: TMenuItem;
    miManufacturing: TMenuItem;
    mnuProductionLocations: TMenuItem;
    mnuWorksOrders: TMenuItem;
    mnuProductionTypes: TMenuItem;
    N4: TMenuItem;
    mnuProcesses: TMenuItem;
    mnuAccountManagers: TMenuItem;
    mnuAccountTeams: TMenuItem;
    mnuAccManMaintain: TMenuItem;
    mnuSalesReps: TMenuItem;
    mnuRepTeams: TMenuItem;
    miManagement: TMenuItem;
    N5: TMenuItem;
    N12: TMenuItem;
    mnuManagementRpts: TMenuItem;
    mnuPackageSizes: TMenuItem;
    mnuUtilities: TMenuItem;
    StockManagement1: TMenuItem;
    miReports: TMenuItem;
    mnuClientServicesRpts: TMenuItem;
    mnuRepRpts: TMenuItem;
    mnuRevenueCentres: TMenuItem;
    miExcel: TMenuItem;
    mnuPurchaseInvoice: TMenuItem;
    N13: TMenuItem;
    mnuWorkCentreGroups: TMenuItem;
    mnuWorkCentres: TMenuItem;
    mnuCreditReasons: TMenuItem;
    mnuCompanyBranch: TMenuItem;
    mnuQuotes: TMenuItem;
    mnuQuoteReasons: TMenuItem;
    mnuProcessGroups: TMenuItem;
    Barcodes1: TMenuItem;
    miSwitchUser: TMenuItem;
    ProductManagement1: TMenuItem;
    N14: TMenuItem;
    mnuDatabaseTools: TMenuItem;
    ManageAliases1: TMenuItem;
    mnuFSCClaim: TMenuItem;
    mnuWCOperators: TMenuItem;
    mnuProductionRpts: TMenuItem;
    mnuNonConformance: TMenuItem;
    mnuQAOperators: TMenuItem;
    mnuNCReasons: TMenuItem;
    mnuNCDepartments: TMenuItem;
    mnuNCA: TMenuItem;
    Recipients1: TMenuItem;
    mnuPaymentTerms: TMenuItem;
    mnuNCCategory: TMenuItem;
    mnuCouriers: TMenuItem;
    mnuProspects: TMenuItem;
    mnuManageLocks: TMenuItem;
    mnuManageLogins: TMenuItem;
    mnuCategories: TMenuItem;
    mnuLevelofImportance: TMenuItem;
    mnuCountry: TMenuItem;
    mnuActivityTypes: TMenuItem;
    mnuProductTypeUtils: TMenuItem;
    mnuQuestions: TMenuItem;
    mnuQuestionCats: TMenuItem;
    mnuProductTypeCats: TMenuItem;
    mnuCapabilities: TMenuItem;
    mnuCapabilitiesCats: TMenuItem;
    tmrCheckActivity: TTimer;
    mnuActivities: TMenuItem;
    pmnSalesInvoicing: TPopupMenu;
    btnSalesInvoicing1: TMenuItem;
    btnSalesCredits1: TMenuItem;
    ToolBar1: TToolBar;
    btnActivities: TToolButton;
    btnCustomers: TToolButton;
    btnProspects: TToolButton;
    btnSuppliers: TToolButton;
    btnFormReferences: TToolButton;
    btnQuotes: TToolButton;
    btnEnquiries: TToolButton;
    btnProduction: TToolButton;
    btnJobs: TToolButton;
    btnWorksOrders: TToolButton;
    btnNCA: TToolButton;
    btnCallOffs: TToolButton;
    btnPurchases: TToolButton;
    btnStock: TToolButton;
    btnSalesInvoicing: TToolButton;
    btnPurchaseInvoicing: TToolButton;
    mnuLicenceActivation: TMenuItem;
    N15: TMenuItem;
    mnuWorksOrderStatus: TMenuItem;
    btnContracts: TToolButton;
    mnuContracts: TMenuItem;
    btnEndUsers: TToolButton;
    mnuEndUsers: TMenuItem;
    mnuDocumentLogos: TMenuItem;
    mnuPackFormats: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure btnEndUsersClick(Sender: TObject);
    procedure btnSuppliersClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure mnuCompanyPrefsClick(Sender: TObject);
    procedure mnuAdhocClick(Sender: TObject);
    procedure mnuSpecialInstClick(Sender: TObject);
    procedure mnuAddChargesClick(Sender: TObject);
    procedure mnuPriceUnitsClick(Sender: TObject);
    procedure mnuGeneralCatsClick(Sender: TObject);
    procedure mnuPaperSizesClick(Sender: TObject);
    procedure mnuPaperDetailsClick(Sender: TObject);
    procedure mnuArtworkTypesClick(Sender: TObject);
    procedure mnuVatRatesClick(Sender: TObject);
    procedure mnuOperatorsClick(Sender: TObject);
    procedure mnuLastNumbersClick(Sender: TObject);
    procedure mnuInterfacesClick(Sender: TObject);
    procedure mnuAuditTrailClick(Sender: TObject);
    procedure btnProductionClick(Sender: TObject);
    procedure btnEnquiriesClick(Sender: TObject);
    procedure mnuEnquiriesClick(Sender: TObject);
    procedure mnuProductionClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure btnCallOffsClick(Sender: TObject);
    procedure btnJobsClick(Sender: TObject);
    procedure mnuStoreTypesClick(Sender: TObject);
    procedure mnuStoresClick(Sender: TObject);
    procedure mnuProductGroupsClick(Sender: TObject);
    procedure btnPurchasesClick(Sender: TObject);
    procedure mnuEmailManagerClick(Sender: TObject);
    procedure mnuStockPrefsClick(Sender: TObject);
    procedure mnuPageDesignerClick(Sender: TObject);
    procedure btnSalesInvoicing1Click(Sender: TObject);
    procedure btnSalesCredits1Click(Sender: TObject);
    procedure PurchInvoicing1Click(Sender: TObject);
    procedure mnuPurchaseCreditClick(Sender: TObject);
    procedure Import1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure mnuReasonsClick(Sender: TObject);
    procedure mnuProofClick(Sender: TObject);
    procedure mnuPeriodEndClick(Sender: TObject);
    procedure mnuProfitReportsClick(Sender: TObject);
    procedure mnuClientClick(Sender: TObject);
    procedure mnuViewAuditTrailClick(Sender: TObject);
    procedure PrintWorksheet1Click(Sender: TObject);
    procedure FreezeStockCount1Click(Sender: TObject);
    procedure UpdateStockCount1Click(Sender: TObject);
    procedure mnuSetCurrentPeriodClick(Sender: TObject);
    procedure mnuFinancialsClick(Sender: TObject);
    procedure mnuJobTypesClick(Sender: TObject);
    procedure mnuSalesInvoicingClick(Sender: TObject);
    procedure mnuPurchaseInvoicingClick(Sender: TObject);
    procedure btnFormReferencesClick(Sender: TObject);
    procedure mnuProductionLocationsClick(Sender: TObject);
    procedure btnWorksOrdersClick(Sender: TObject);
    procedure mnuProductionTypesClick(Sender: TObject);
    procedure mnuProcessesClick(Sender: TObject);
    procedure mnuAccountTeamsClick(Sender: TObject);
    procedure RepTeams1Click(Sender: TObject);
    procedure mnuAccManMaintainClick(Sender: TObject);
    procedure mnuSalesRepsClick(Sender: TObject);
    procedure mnuRepTeamsClick(Sender: TObject);
    procedure mnuManagementRptsClick(Sender: TObject);
    procedure mnuPackageSizesClick(Sender: TObject);
    procedure StockManagement1Click(Sender: TObject);
    procedure mnuSalesbyInvoiceNumberClick(Sender: TObject);
    procedure mnuRepRptsClick(Sender: TObject);
    procedure MenuItemClick(Sender: TObject);
    procedure mnuStocktakeClick(Sender: TObject);
    procedure mnuRevenueCentresClick(Sender: TObject);
    procedure mnuCategoriesClick(Sender: TObject);
    procedure miExcelClick(Sender: TObject);
    procedure mnuWorkCentreGroupsClick(Sender: TObject);
    procedure mnuWorkCentresClick(Sender: TObject);
    procedure mnuCreditReasonsClick(Sender: TObject);
    procedure mnuCompanyBranchClick(Sender: TObject);
    procedure HowtoUseHelp1Click(Sender: TObject);
    procedure btnQuotesClick(Sender: TObject);
    procedure mnuQuoteReasonsClick(Sender: TObject);
    procedure mnuClientServicesRptsClick(Sender: TObject);
    procedure mnuProcessGroupsClick(Sender: TObject);
    procedure Barcodes1Click(Sender: TObject);
    procedure miSwitchUserClick(Sender: TObject);
    procedure ProductManagement1Click(Sender: TObject);
    procedure ManageAliases1Click(Sender: TObject);
    procedure mnuFSCClaimClick(Sender: TObject);
    procedure mnuWCOperatorsClick(Sender: TObject);
    procedure mnuProductionRptsClick(Sender: TObject);
    procedure mnuQAOperatorsClick(Sender: TObject);
    procedure mnuNCReasonsClick(Sender: TObject);
    procedure mnuNCDepartmentsClick(Sender: TObject);
    procedure btnNCAClick(Sender: TObject);
    procedure Recipients1Click(Sender: TObject);
    procedure mnuPaymentTermsClick(Sender: TObject);
    procedure mnuNCCategoryClick(Sender: TObject);
    procedure mnuCouriersClick(Sender: TObject);
    procedure btnProspectsClick(Sender: TObject);
    procedure mnuManageLocksClick(Sender: TObject);
    procedure mnuManageLoginsClick(Sender: TObject);
    procedure mnuLevelOfImportanceClick(Sender: TObject);
    procedure mnuCountryClick(Sender: TObject);
    procedure mnuActivityTypesClick(Sender: TObject);
    procedure mnuProductTypesClick(Sender: TObject);
    procedure mnuQuestionsClick(Sender: TObject);
    procedure mnuQuestionCatsClick(Sender: TObject);
    procedure mnuProductTypeCatsClick(Sender: TObject);
    procedure mnuCapabilitiesClick(Sender: TObject);
    procedure mnuCapabilitiesCatsClick(Sender: TObject);
    procedure tmrCheckActivityTimer(Sender: TObject);
    procedure btnActivitiesClick(Sender: TObject);
    procedure mnuLicenceActivationClick(Sender: TObject);
    procedure mnuWorksOrderStatusClick(Sender: TObject);
    procedure btnContractsClick(Sender: TObject);
    procedure mnuDocumentLogosClick(Sender: TObject);
    procedure mnuPackFormatsClick(Sender: TObject);
  private
    dtmdlCustActivity: TdtmdlActivity;
    MaxUsers: Integer;
    ShowCustomers: boolean;
    ServDir, LocalDir, LocalDrive: string;
    OnClicks:   Array[0..400] of TNotifyEvent ;
    OnClicksName: Array[0..400] of String;
    OnClicksCount: Integer;
    FUseStockSystem: boolean;
    FUseJobBags: boolean;
    FJobBagsMandatory: boolean;
    FActivated: Boolean;
    FUserName: string;
    FUseCRMSystem: boolean;
    FEnquiryReminder: boolean;
    FProofReminder: boolean;
    FReorderReminder: boolean;
    FQuoteReminder: boolean;
    FOrderAckReminder: boolean;
    FDeliveryReminder: boolean;
    procedure SetOperator(iTempOp: Integer);
    procedure GetCompanyDetails;
    procedure GetEmailDetails;
    procedure CopyIfNewer(FName, FDesc: String);
    procedure CheckDBVersion;
    procedure CheckContracts;
    procedure CheckNonConformance;
    procedure CheckJBinUse;
    procedure CheckStockinUse;
    procedure CheckAccountManagers;
    procedure CheckProduction;
    procedure CheckProspects;
    procedure CheckEndUsers;
    procedure CheckCRM;
    procedure filecopy(const sourcefilename, targetfilename: string);
    procedure GetCurrencyFormat;
    procedure SetUseStockSystem(const Value: boolean);
    procedure SetUseJobBags(const Value: boolean);
    procedure BitBtnClick(Sender: TObject);
    procedure SetJobBagsMandatory(const Value: boolean);
    procedure SetUserName(const Value: string);
    procedure PseudoFormActivate;
    procedure LicenceCheck;
    procedure SetUseCRMSystem(const Value: boolean);
    procedure CheckActivityReminder;
    procedure SetEnquiryReminder(const Value: boolean);
    procedure SetDeliveryReminder(const Value: boolean);
    procedure SetOrderAckReminder(const Value: boolean);
    procedure SetProofReminder(const Value: boolean);
    procedure SetQuoteReminder(const Value: boolean);
    procedure SetReorderReminder(const Value: boolean);
  public
    iOperator: Integer;
    iRep: Integer;
    sOperator_Name, sOperator_Email, sSoft_Version, sSoft_subVersion, sSoft_Demo, sDataBaseDescr,
                    sFaxSystem, sDB_Version: string;
    sPrintCurrencyMask, sCurrencyMask, sZeroCurrencyMask: String;
    bDemo: ByteBool;
    WorkStation: Integer;
    sCompName: string;
    EmailApplication, EmailLocation, EmailAccount, InvoiceEmailAccount: string;
    AppIniFile: Array [0..255] of char;
    property EnquiryReminder: boolean read FEnquiryReminder write SetEnquiryReminder;
    property QuoteReminder: boolean read FQuoteReminder write SetQuoteReminder;
    property ProofReminder: boolean read FProofReminder write SetProofReminder;
    property OrderAckReminder: boolean read FOrderAckReminder write SetOrderAckReminder;
    property ReorderReminder: boolean read FReorderReminder write SetReorderReminder;
    property DeliveryReminder: boolean read FDeliveryReminder write SetDeliveryReminder;
    property JobBagsMandatory: boolean read FJobBagsMandatory write SetJobBagsMandatory;
    property UseCRMSystem: boolean read FUseCRMSystem write SetUseCRMSystem;
    property UseJobBags: boolean read FUseJobBags write SetUseJobBags;
    property UseStockSystem: boolean read FUseStockSystem write SetUseStockSystem;
    property UserName: string read FUserName write SetUserName;
    procedure CheckRevenueCentres;
    procedure ExportToExcel(tmpForm: TForm);
    procedure ExportGridToExcel(tmpForm: TForm);
  end;

var
  frmpbMainMenu: TfrmpbMainMenu;

implementation

uses pbluCustomers, pbluSuppliers, pbLogin, PBMaintCompany, PBLUPrdTyp,
  PBLURep, PBLUAdHoc, PBMaintGroups, PBLUSpecIns, PBLUAddCharges,
  PBLUPriceUnit, PBLUStandSize, PBMaintPaper, PBLUArtwrkTyp, PBLUOps,
  PBMaintLastNos, PBMaintInterf, PBAuditControl, pbDatabase, pbLUVatCode,
  pbluOrders, pbLUEnquiries, pbLuStock, pbLuSalesOrders, pbLuJobs,
  pbLUSalesInvoices, pbLUPurchaseInvoices, STLUPrtGrp, STLUStorTyp,
  STLUPrtStor, PBImages, PBAuditDM, pbLUPurchaseOrders,
  STMaintParam, pbLUSalesCredits, pbLUPurchaseCredits, PBAccExport1,
  PBAbout, PBLUReasCode, PBLUProofStatus, PBRSSalesProfit, PBPeriodEnd,
  PBMaintClient, PBAuditView, STStkTkSl, StStkTkSel, STLUCourier,
  PBMaintCompanyFY, PBLUJobType, PBLUFinanceYear, pbluFormReferences,
  PBLUProductionLoc, pbLUWorksOrders, PBLUProductionType,
  PBLUPreProduction, PBLUProcess, PBLUAccountTeam, PBLURepTeam,
  PBLUAccountManager, pbLUManagementRpts, PBLUPackageSize, STMaintStock,
  PBRSSalesByInv, PBRSJobBagExtrasWIP, PBRSWorkIP, PBLURepRpts, PBLUStockTake,
  PBLURevenueLoc, PBLUCategory, PBSendtoExcel, PBLUWorkCentreGroup,
  PBLUWorkCentre, PBLUCreditReason, pbLUCompBranch, PBAboutOps, pbLUQuotes,
  PBLUQuoteReason, pbLUAccMgrRpts, PBLUProcessGroup,
  STRSBarCode, STMaintCustStock, PBLUDBAlias, PBLUFSCClaim, PBLUWCOperator,
  PBLUProductionRpts, PBLUQAOperator, PBLUNonConformType,
  PBLUNonConformDept, pbLuNCA, PBMaintNonConformOps, PBLUPaymentTerms,
  PBLUNonConformCat, pbluProspects, PBWorkstationLock, PBMaintLogins,
  PBLULevelOfImportance, PBLUCountry, PBLUActivityType,
  PBMaintActivityReminder, PBQuestnCats, PBLUQuestn, PBMaintProdCats,
  PBLUCap, PBCapCats, PBLUActivities, PBExpiryDate, PBLUWorksOrderStatus,
  PBLUContracts, pbluEndUsers, PBLUDocumentLogos, PBLUPackFormat;

{$R *.DFM}

procedure TfrmpbMainMenu.BitBtnClick(Sender: TObject);
var
  iCount: Integer;
  sTempProgDescr: String ;
begin
  {Determine the state of what's been clicked} ;
  {iAccCtrl: 1=Full, 2=Notes, 3=Enquiry, 4=Rep, 5=Operator} ;
  {Set the Access Control flag for the MENU} ;
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,stringreplace((Sender as TToolButton).Name,'btn','mnu',[rfReplaceAll, rfIgnoreCase])) ;
  {Write the audit trail details} ;
  sTempProgDescr := (Sender as TToolButton).Caption ;
  if (Sender as TToolButton).Parent <> Nil then
    begin
    if (Sender as TToolButton).Parent is TTabSheet then
      begin
        if Copy(((Sender as TToolButton).Parent as TTabSheet).Caption,1,4) <>'Page' then
          begin
            sTempProgDescr := ((Sender as TToolButton).Parent as TTabSheet).Caption + ' - ' + sTempProgDescr;
          end
        else
          begin
            sTempProgDescr := 'Database Maintenance - ' + sTempProgDescr ;
          end;
      end;
    end;
  {Write an ENTER PROGRAM record to the audit trail} ;
  try
//    PBAuditDataMod.WriteAudit(3, 0, 0, 0, 0, sTempProgDescr) ;
  except
  end;
  {Now find and run the original ONCLICK event} ;
  For iCount := 0 to OnClicksCount -1 do
    If OnClicksName[iCount] = (Sender as TToolButton).Name then
      begin
        OnClicks[iCount](Sender) ;
        Break ;
      end;
  {Write an EXIT PROGRAM record to the audit trail} ;
  try
//    PBAuditDataMod.WriteAudit(4, 0, 0, 0, 0, sTempProgDescr) ;
  except
  end;
end;

procedure TfrmpbMainMenu.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: integer;
begin
  if MessageDlg('Close the application?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      for i := 0 to pred(MDIChildCount) do
        begin
          MDIChildren[i].free;
        end;
      Action := caFree;

      with dmBroker.qryDeleteWorkStationLock do
        begin
          Close;
          ParamByName('WorkStation').AsString := IntToStr(WorkStation);
          ExecSQL;
        end;

      with dmBroker.qryDeleteWorkStation do
        begin
          Close;
          ParamByName('WorkStation').AsString := IntToStr(WorkStation);
          ExecSQL;
        end;
    end
  else
    Action := caNone;
end;

procedure TfrmpbMainMenu.FormCreate(Sender: TObject);
var
  TempUser                    : array[0..255] of Char;
  TempUserSize                : DWORD;
  iCount: Integer;
  TempArray: array[0..255] of Char;
  iActivityInterval: integer;
begin
  LocalDrive := copy(GetWinSysDir,1,2);
	LocalDir := extractfilepath(application.ExeName);

  if pos('Application Data',LocalDir) > 0 then
    StrPCopy(AppIniFile,LocalDir+'Redeye.ini')
  else
    StrPCopy(AppIniFile,'Redeye.ini');

{$IFDEF FORMPRO} {Setup the directories}
	ServDir := '\\FPSERVER1\MIS\Centrereed\Broker' ;
  CopyifNewer('BrokerLoad05.exe', 'Broker Load Program');
{$ENDIF}
{$IFDEF LATCHAM} {Setup the directories}
	ServDir := '\\FPSERVER1\MIS\Centrereed\Broker' ;
  CopyifNewer('BrokerLoad05.exe', 'Broker Load Program');
{$ENDIF}
{$IFDEF NEXUS} {Setup the directories}
	ServDir := '\\NEXUS-UK\Redeye' ;
  CopyifNewer('RedeyeLoad.exe', 'Redeye Load Program');
{$ENDIF}

  {Go through all the TBitBtns on the form and if there's am ONCLICK event, switch it} ;
  {to BitBtnClick. Note that this routine then jumps to the original event} ;
  OnClicksCount := 0 ;
  for iCount := 0 to ComponentCount-1 do
    begin
      if Components[icount] is TToolButton then
        begin
          if Addr((Components[icount] as TToolButton).OnClick) <> nil   then
            begin
              OnClicksName[OnClicksCount] := (Components[icount] as TToolButton).Name  ;
              OnClicks[OnClicksCount] := (Components[icount] as TToolButton).OnClick  ;
              (Components[icount] as TToolButton).OnClick := BitBtnClick ;
              OnClicksCount := OnClicksCount + 1 ;
            end;
        end;
      if Components[icount] is TMenuItem then
        begin
          if copy((Components[icount] as TMenuItem).name,1,3) <> 'mnu' then
            continue;
          if Addr((Components[icount] as TMenuItem).OnClick) <> nil   then
            begin
              OnClicksName[OnClicksCount] := (Components[icount] as TMenuItem).Name  ;
              OnClicks[OnClicksCount] := (Components[icount] as TMenuItem).OnClick  ;
              (Components[icount] as TMenuItem).OnClick := MenuItemClick ;
              OnClicksCount := OnClicksCount + 1 ;
            end;
        end;
    end;

  TempUserSize := SizeOf(TempUser);
  GetUserName(Addr(TempUser), TempUserSize);
  stsbrMainMenu.Panels[0].Text := TempUser;

  sSoft_Version := '2023';
  sSoft_subVersion := '/July07a';

  {Search the INI file for Activity Interval}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Activity', 'Reminder Interval', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  try
    iActivityInterval := strtoint(TempArray);
  except
    iActivityInterval := 0;
  end;

  if iActivityInterval = 0 then
    tmrCheckActivity.Interval := 900000
  else
    tmrCheckActivity.Interval := 60000*iActivityInterval;
end;

procedure TfrmpbMainMenu.CopyIfNewer(FName, FDesc: String);
begin
  {Check if server version of file is older or same. If it is don't copy it} ;
  if FileAge(ServDir + '\' + FName) <= FileAge(LocalDir + FName) then exit ;
  FileCopy(ServDir + '\' + FName, LocalDir + FName) ;
end;

procedure TfrmpbMainMenu.filecopy(const sourcefilename,targetfilename :string);
var
  s,t:tfilestream;
  BytesToCopy: Integer ;
begin
  if fileexists(targetfilename) = true then
    if deletefile(targetfilename) = false then
      messagedlg('Problem Deleting Local Copy',mterror,[mbok],0) ;

  s:=tfilestream.create(sourcefilename,fmOpenread);

  try
    t:=tfilestream.create(targetfilename,fmcreate);
      try
        while s.position < s.size do
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

procedure TfrmpbMainMenu.btnCustomersClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUCustomers then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUCustomers := TfrmpbLUCustomers.create(Application);
    frmpbLUCustomers.WindowState := wsMaximized;
    frmpbLUCustomers.Caption := btnCustomers.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.btnSuppliersClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUSuppliers then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUSuppliers := TfrmpbLUSuppliers.create(Application);
    frmpbLUSuppliers.WindowState := wsMaximized;
    frmpbLUSuppliers.Caption := btnSuppliers.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.LicenceCheck;
var
  iCheckSum: integer;
begin
  iCheckSum := dmBroker.getCheckSum;

  if iCheckSum = 0 then exit;
  
  if trunc(date) > iCheckSum then
    begin
      MessageDlg('Your licence for Redeye has expired. ' +
        'Please contact your software supplier on 0844 488 9206', mtError, [mbAbort], 0);
      Application.Terminate;
      Exit;
    end;
end;

procedure TfrmpbMainMenu.FormActivate(Sender: TObject);
var
  LoginFormOK                 : ByteBool;
  TempLogin, TempComputer                     : array[0..255] of Char;
  TempLoginSize, TempComputerSize             : DWORD;
begin
  MaxUsers := 100;
{$IFDEF NEXUS}
  MaxUsers := 1 ;
{$ENDIF}

{$IFDEF AVANTI}
  MaxUsers := 2 ;
{$ENDIF}

{$IFDEF NINE8NINE}
  MaxUsers := 2 ;
{$ENDIF}

{$IFDEF LATCHAM}
  MaxUsers := 3 ;
{$ENDIF}

{$IFDEF BROADSWORD}
  MaxUsers := 5 ;
{$ENDIF}

{$IFDEF SOLUTIONS23}
  MaxUsers := 3 ;
{$ENDIF}

{$IFDEF M&M}
  MaxUsers := 2 ;
{$ENDIF}

{$IFDEF PREMIER}
  MaxUsers := 2 ;
{$ENDIF}

{$IFDEF PRINTGUY}
  MaxUsers := 4 ;
{$ENDIF}

{$IFDEF MAILADOC}
  MaxUsers := 9 ;
{$ENDIF}

{$IFDEF SOUTHERN MAIL}
  MaxUsers := 7 ;
{$ENDIF}

{$IFDEF BESLEYCOPP}
  MaxUsers := 8 ;
{$ENDIF}

{$IFDEF PMS}
  MaxUsers := 3 ;
{$ENDIF}

  if not FActivated then
    begin
      ShowCustomers := true;
      frmPBLogin := TfrmPBLogin.Create(Self);
      try
        frmPBLogin.UserEdit.Text := stsbrMainMenu.Panels[0].Text;
        frmPBLogin.ShowModal;
        LoginFormOK := frmPBLogin.OK;
        if LoginFormOK then
        begin
//          frmPBLogin.UserEdit.Text := stsbrMainMenu.Panels[0].Text;
          iRep := frmPBLogin.Rep;
          UserName := frmPBLogin.UserEdit.Text;
          stsbrMainMenu.Panels[0].Text := UserName;
          ioperator := frmPBLogin.Operator;
          dmBroker.iOperator := frmPBLogin.Operator;
          sOperator_name := frmPBLogin.Operator_name;
          SOperator_Email := frmPBLogin.Operator_Email;
//          sDataBaseDescr := frmPBLogin.Caption;
          sDataBaseDescr := frmPBLogin.cmbAliasList.text;
          sFaxSystem := frmPBLogin.sFaxSystem ;

          TempComputerSize := SizeOf(TempComputer);
          GetComputerName(Addr(TempComputer), TempComputerSize);
          sCompName := TempComputer;

(*          if Pos('Live', sDataBaseDescr) <> 0 then
            frmpbMainMenu.Caption := frmpbMainMenu.Caption + ' - Live Database'
          else
            frmpbMainMenu.Caption := frmpbMainMenu.Caption + ' - Test Database';
*)          frmpbMainMenu.WindowState := wsMaximized;

        end;
      finally
        frmPBLogin.Free;
      end;

      if not LoginFormOK then
        Application.Terminate
      else
        begin
          if (Username = 'sa') or (Username = 'paulal') then
            mnuLicenceActivation.Visible := true
          else
            begin
              mnuLicenceActivation.Visible := false;
              LicenceCheck;
            end;

          SetOperator(iOperator);
          PBImagesFrm.LoadReportLogo(Self);

          with dmBroker.qryDeleteWorkStationsLocks do
            begin
              Close;
              ParamByName('WorkStation_Name').AsString := sCompName;
              ExecSQL;
            end;

          with dmBroker.qryDeleteWorkStations do
            begin
              Close;
              ParamByName('WorkStation_Name').AsString := sCompName;
              ParamByName('Status_Descr').AsString := UserName;
              ExecSQL;
            end;

          {Try to get a valid workstation slot for this workstation};
          WorkStation := 0;
          {Try to find an empty workstation slot};
          with dmBroker.qryGetWorkStation do
            begin
              repeat
                begin
                  WorkStation := WorkStation + 1;
                  if WorkStation > MaxUsers then
                    begin
                      { No empty slots};
                      MessageDlg('User limit exceeded', mtError, [mbAbort], 0);
                      WorkStation := 0;
                      Application.Terminate;
                      Exit;
                    end;
                  Close;
                  ParamByName('WorkStation').AsString := IntToStr(WorkStation);
                  Open;
                  First;
                end;
              until EOF = True;
            end;

          with dmBroker.qryAddWorkStation do
            begin
            {Vacant slot found, add details for this workstation };
              Close;
              ParamByName('WorkStation').AsString := IntToStr(WorkStation);
              ParamByName('WorkStation_Name').AsString := sCompName;
              ParamByName('Status_Descr').AsString := UserName;
              ParamByName('Software_Version').AsString := sSoft_Version + sSoft_subVersion;
              ParamByName('Logged_in').Asdatetime := now;
              ExecSQL;
            end;

          {Get user and password from login screen}
          TempLoginSize := SizeOf(TempLogin);
          GetUserName(Addr(TempLogin), TempLoginSize);
          stsbrMainMenu.Panels[0].Text := TempLogin;
          {Check Database Version}
          CheckDBVersion;
          CheckJBinUse;
          CheckStockInUse;
          CheckRevenueCentres;
          CheckAccountManagers;
          CheckProduction;
          CheckNonConformance;
          CheckContracts;
          CheckProspects;
          CheckEndUsers;
          CheckCRM;

          GetCurrencyFormat;
          GetCompanyDetails;
          GetEmailDetails;
          if UseCRMSystem then
            btnActivitiesClick(self)
          else
          if ShowCustomers then
            btnCustomersClick(self);

          {Write a LOGIN record to the audit trail} ;
          try
            if not dmBroker.IsSQL then
              begin
                PBAuditDataMod.Add1stAuditSQL.SQL.text :=
                    PBAuditDataMod.Access_Add1stAuditSQL.SQL.text;
                PBAuditDataMod.AddAuditSQL.SQL.text :=
                    PBAuditDataMod.Access_AddAuditSQL.SQL.text;
              end;
            PBAuditDataMod.WriteAudit(1, 0, 0, 0, 0, '') ;
          except
          end;
          Factivated := true;
        end;
    end;

  mnuEnquiries.Visible := btnEnquiries.Visible;
  mnuProduction.Visible := btnProduction.Visible;
  mnuJobs.Visible := btnJobs.Visible;
  mnuStock.Visible := btnStock.Visible;

  mnuFormReferences.Visible := btnFormReferences.Visible;
  mnuSalesInvoicing.Visible := btnSalesInvoicing.Visible;
  mnuCallOffs.Visible := btnCallOffs.Visible;
  mnuPurchaseInvoicing.Visible := btnPurchaseInvoicing.Visible;
  mnuPurchases.Visible := btnPurchases.Visible;
  mnuFSCClaim.Visible := dmBroker.UseFSCClaim;

  if frmPBMainMenu.UseCRMSystem then
    CheckActivityReminder;
//    tmrCheckActivity.Enabled := true;
end;

procedure TfrmpbMainMenu.miExitClick(Sender: TObject);
begin
  frmpbMainMenu.Close;
end;

procedure TfrmpbMainMenu.GetCompanyDetails;
begin
  with dmBroker.qryCompany do
    begin
      close;
      open;
      frmpbMainMenu.caption := 'Redeye Management Information System' + ' - ' + fieldbyname('Name').asstring+ ' - ' + self.sDataBaseDescr + ' database';
    end;
end;

procedure TfrmpbMainMenu.GetEmailDetails;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      EmailApplication := ReadString('Email', 'Application', 'None');
      EmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
      EmailAccount := ReadString('Email', pchar(dmBroker.PBLDatabase.AliasName + ' Email Account'), '');
      InvoiceEmailAccount := ReadString('Email', pchar(dmBroker.PBLDatabase.AliasName + ' Invoice Email Account'), '');
      if trim(InvoiceEmailAccount) = '' then
        InvoiceEmailAccount := EmailAccount;
      Free;
    end;
end;

procedure TfrmpbMainMenu.GetCurrencyFormat;
begin
  {Work out currency format for screen fields};
  sCurrencyMask := '###########';
  if FormatSettings.CurrencyDecimals > 0 then
    sCurrencymask := Copy('###########', 1, 9 - FormatSettings.CurrencyDecimals) +
      '0.' + Copy('00000000', 1, FormatSettings.CurrencyDecimals);
  {Work out currency format for Print fields};
  sPrintCurrencyMask := '##,###,###,###';
  if FormatSettings.CurrencyDecimals > 0 then
    sPrintCurrencymask := Copy('##,###,###,###', 1, 11 - FormatSettings.CurrencyDecimals) +
      '0.' + Copy('00000000', 1, FormatSettings.CurrencyDecimals);
  {Work out currency format for zeroised fields};
  sZeroCurrencyMask := '00000000000';
  if FormatSettings.CurrencyDecimals > 0 then
    sZeroCurrencymask := Copy('00000000000', 1, 9 - FormatSettings.CurrencyDecimals) +
      '0.' + Copy('00000000', 1, FormatSettings.CurrencyDecimals);
end;

procedure TfrmpbMainMenu.mnuCompanyPrefsClick(Sender: TObject);
begin
  PBMaintCompanyFrm := TPBMaintCompanyFrm.Create(Self);
  try
    PBMaintCompanyFrm.ShowModal;
  finally
    PBMaintCompanyFrm.Free;
  end;
  CheckRevenueCentres;
  CheckJBinUse;
  CheckAccountManagers;
  CheckProduction;
  CheckNonConformance;
  CheckContracts;
  CheckProspects;
  CheckCRM;
  mnuFSCClaim.Visible := dmBroker.UseFSCClaim;
end;

procedure TfrmpbMainMenu.mnuAdhocClick(Sender: TObject);
begin
  PBLUAdHocFrm := TPBLUAdHocFrm.Create(Self);
  try
    PBLUAdHocFrm.bIs_Lookup := False;
    PBLUAdHocFrm.bAllow_Upd := True;
    PBLUAdHocFrm.ShowModal;
  finally
    PBLUAdHocFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuSpecialInstClick(Sender: TObject);
begin
  PBLUSpecInsFrm := TPBLUSpecInsFrm.Create(Self);
  try
    PBLUSpecInsFrm.bIs_Lookup := False;
    PBLUSpecInsFrm.bAllow_Upd := True;
    PBLUSpecInsFrm.ShowModal;
  finally
    PBLUSpecInsFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuAddChargesClick(Sender: TObject);
begin
  PBLUAddChrgFrm := TPBLUAddChrgFrm.Create(Self);
  try
    PBLUAddChrgFrm.bIs_Lookup := False;
    PBLUAddChrgFrm.bAllow_Upd := True;
    PBLUAddChrgFrm.ShowModal;
  finally
    PBLUAddChrgFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuPriceUnitsClick(Sender: TObject);
begin
  PBLUPriceUnitFrm := TPBLUPriceUnitFrm.Create(Self);
  try
    PBLUPriceUnitFrm.bIs_Lookup := False;
    PBLUPriceUnitFrm.bAllow_Upd := True;
    PBLUPriceUnitFrm.ShowModal;
  finally
    PBLUPriceUnitFrm.Free;
  end
end;

procedure TfrmpbMainMenu.mnuGeneralCatsClick(Sender: TObject);
begin
  PBMaintGroupsFrm := TPBMaintGroupsFrm.Create(Self);
  try
    PBMaintGroupsFrm.bIs_Lookup := False;
    PBMaintGroupsFrm.ShowModal;
  finally
    PBMaintGroupsFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuPaperSizesClick(Sender: TObject);
begin
  PBLUStandSizeFrm := TPBLUStandSizeFrm.Create(Self);
  try
    PBLUStandSizeFrm.bIs_Lookup := False;
    PBLUStandSizeFrm.bAllow_Upd := True;
    PBLUStandSizeFrm.ShowModal;
  finally
    PBLUStandSizeFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuPaperDetailsClick(Sender: TObject);
begin
  {Start up the groupings program}
  PBMaintpaperFrm := TPBMaintpaperFrm.Create(Self);
  try
    PBMaintPaperFrm.ShowModal;
  finally
    PBMaintPaperFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuArtworkTypesClick(Sender: TObject);
begin
  PBLUArtwrkTypFrm := TPBLUArtwrkTypFrm.Create(Self);
  try
    PBLUArtwrkTypFrm.bIs_Lookup := False;
    PBLUArtwrkTypFrm.bAllow_Upd := True;
    PBLUArtwrkTypFrm.ShowModal;
  finally
    PBLUArtwrkTypFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuVatRatesClick(Sender: TObject);
begin
  PBLUVATCodeFrm := TPBLUVATCodeFrm.Create(Self);
  try
    PBLUVATCodeFrm.bIs_Lookup := False;
    PBLUVATCodeFrm.bAllow_Upd := True;
    PBLUVATCodeFrm.ShowModal;
  finally
    PBLUVATCodeFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuOperatorsClick(Sender: TObject);
begin
  if bDemo then
  begin
    MessageDlg('This option is not available in the demonstration version',
      mtError,
      [mbOK], 0);
    Exit;
  end;
  PBLUOpsFrm := TPBLUOpsFrm.Create(Self);
  try
    PBLUOpsFrm.bIs_Lookup := False;
    PBLUOpsFrm.bAllow_Upd := True;
    PBLUOpsFrm.ShowModal;
  finally
    PBLUOpsFrm.Free;
  end;
  SetOperator(iOperator);
end;

procedure TfrmpbMainMenu.mnuLastNumbersClick(Sender: TObject);
begin
  PBMaintLastNosFrm := TPBMaintLastNosFrm.Create(Self);
  try
    PBMaintLastNosFrm.ShowModal;
  finally
    PBMaintLastNosFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuInterfacesClick(Sender: TObject);
begin
  PBMaintInterfFrm := TPBMaintInterfFrm.Create(Self);
  try
    PBMaintInterfFrm.ShowModal;
  finally
    PBMaintInterfFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuAuditTrailClick(Sender: TObject);
begin
  PBAuditControlFrm := TPBAuditControlFrm.Create(Self);
  try
    PBAuditControlFrm.ShowModal;
  finally
    PBAuditControlFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.SetOperator(iTempOp: Integer);
var
  icount                      : Integer;
  cTempComp                   : TComponent;
begin
  {Disable all selection buttons}
  for icount := 0 to ComponentCount - 1 do
  begin
    if Components[icount] is TToolButton then
      begin
        TToolButton(Components[icount]).Enabled := False;
      end
    else
    if Components[icount] is TMenuItem then
      begin
        TMenuItem(Components[icount]).Enabled := TMenuItem(Components[icount]).hint = '';
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
          frmPBMainMenu.FindComponent(stringreplace((FieldByName('Button_Name').AsString),'mnu','btn',[rfReplaceAll,rfIgnoreCase]));
        if Assigned(cTempComp) then
          if cTempComp is TToolButton then
            try
            (cTempComp as TToolButton).enabled := (FieldByName('Button_Status').AsString <> 'B');
            if ((cTempComp as TToolButton).Name = 'btnCustomers') and (FieldByName('Button_Status').AsString = 'B') then
              ShowCustomers := false;

            Case Pos(FieldByName('Button_Status').AsString, 'FBNEROAS')  of
                0,1: (cTempComp as TToolButton).hint := (cTempComp as TToolButton).caption;
                3:   (cTempComp as TToolButton).hint := (cTempComp as TToolButton).caption + ' (Notes Only Access)';
                4:   (cTempComp as TToolButton).hint := (cTempComp as TToolButton).caption + ' (Read Only Access)';
                5:   (cTempComp as TToolButton).hint := (cTempComp as TToolButton).caption + ' (Rep Access)';
                6:   (cTempComp as TToolButton).hint := (cTempComp as TToolButton).caption + ' (Operator Access)';
                7:   (cTempComp as TToolButton).hint := (cTempComp as TToolButton).caption + ' (Sub-Rep Access)';
                8:   (cTempComp as TToolButton).hint := (cTempComp as TToolButton).caption + ' (Account Manager Access)';
                end;
            (cTempComp as TToolButton).hint := stringreplace((cTempComp as TToolButton).hint,'&','',[rfReplaceAll,rfIgnoreCase]);
            except
            end;

// Now do the MainMenu items
        cTempComp :=
          frmPBMainMenu.FindComponent((FieldByName('Button_Name').AsString));
        if Assigned(cTempComp) then
          if cTempComp is TMenuItem then
            try
              (cTempComp as TMenuItem).Enabled := (FieldByName('Button_Status').AsString <> 'B');
              Case Pos(FieldByName('Button_Status').AsString, 'FBNERO')  of
                0,1,2: (cTempComp as TMenuItem).caption := (cTempComp as TMenuItem).hint;
                3:   (cTempComp as TMenuItem).caption := (cTempComp as TMenuItem).hint + ' (Notes Only Access)';
                4:   (cTempComp as TMenuItem).caption := (cTempComp as TMenuItem).hint + ' (Read Only Access)';
                5:   (cTempComp as TMenuItem).caption := (cTempComp as TMenuItem).hint + ' (Rep Access)';
                6:   (cTempComp as TMenuItem).caption := (cTempComp as TMenuItem).hint + ' (Operator Access)';
                7:   (cTempComp as TMenuItem).caption := (cTempComp as TMenuItem).hint +  ' (Sub-Rep Access)';
                8:   (cTempComp as TMenuItem).caption := (cTempComp as TMenuItem).hint +  ' (Account Manager Access)';
              end;
              (cTempComp as TMenuItem).caption := (cTempComp as TMenuItem).caption + ' ...';
            except
            end;
        Next;
      end;
    end;
  except
  end;
end;

procedure TfrmpbMainMenu.btnProductionClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUOrders then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUOrders := TfrmpbLUOrders.create(Application);
    frmpbLUOrders.WindowState := wsMaximized;
    frmpbLUOrders.Caption := btnProduction.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.btnEnquiriesClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUEnquiries then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUEnquiries := TfrmpbLUEnquiries.create(Application);
    frmpbLUEnquiries.WindowState := wsMaximized;
    frmpbLUEnquiries.Caption := btnEnquiries.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.mnuEnquiriesClick(Sender: TObject);
begin
  btnEnquiriesClick(self);
end;

procedure TfrmpbMainMenu.mnuProductionClick(Sender: TObject);
begin
  btnProductionClick(self);
end;

procedure TfrmpbMainMenu.btnStockClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUStock then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUStock := TfrmpbLUStock.create(Application);
    frmpbLUStock.WindowState := wsMaximized;
    frmpbLUStock.Caption := btnStock.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.btnCallOffsClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUSalesOrders then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUSalesOrders := TfrmpbLUSalesOrders.create(Application);
    frmpbLUSalesOrders.WindowState := wsMaximized;
    frmpbLUSalesOrders.Caption := btnCallOffs.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.btnJobsClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUJobs then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUJobs := TfrmpbLUJobs.create(Application);
    frmpbLUJobs.WindowState := wsMaximized;
    frmpbLUJobs.Caption := btnJobs.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.mnuStoreTypesClick(Sender: TObject);
begin
  STLUStorTypFrm := TSTLUStorTypFrm.Create(Self);
  try
    STLUStorTypFrm.bIs_LookUp := False ;
    STLUStorTypFrm.bAllow_Upd := True ;
    STLUStorTypFrm.ShowModal;
  finally
    STLUStorTypFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuStoresClick(Sender: TObject);
begin
 STLUPrtStorFrm := TSTLUPrtStorFrm.Create(Self);
  try
    STLUPrtStorFrm.bIs_LookUp := False ;
    STLUPrtStorFrm.bAllow_Upd := True ;
    STLUPrtStorFrm.ShowModal;
  finally
    STLUPrtStorFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuProductGroupsClick(Sender: TObject);
begin
  STLUPrtGrpFrm := TSTLUPrtGrpFrm.Create(Self);
  try
    STLUPrtGrpFrm.bIs_LookUp := False ;
    STLUPrtGrpFrm.bAllow_Upd := True ;
    STLUPrtGrpFrm.ShowModal;
  finally
    STLUPrtGrpFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.CheckDBVersion;
begin
  try
    with dmBroker.qryCompany do
      begin
        close;
        open;
        first;
        sDb_Version := fieldbyname('Database_Version').asstring;
        if fieldByname('Use_PIN_Reference').asString = 'Y' then
          dmBroker.UseSuppInvPIN := true
        else
          dmBroker.UseSuppInvPIN := false;
      end;
  except
    sDb_Version := '';
  end;

  {If database version different to Broker version then display the Database Update btn}
  if (sSoft_Version <> sDb_Version) then
    mnuDatabaseUp.visible := true
  else
    mnuDatabaseUp.visible := false;
end;

procedure TfrmPBMainMenu.CheckJBinUse;
begin
  try
    with dmBroker.qryCompany do
      begin
        close;
        open;
        first;
        UseJobBags := (fieldbyname('Job_bag_in_use').asstring = 'Y');
        JobBagsMandatory := (fieldbyname('Job_bag_is_mandatory').asstring = 'Y')
      end;
  except
    UseJobBags := false;
    JobBagsMandatory := false;
  end;

  btnJobs.visible := UseJobBags; {sorry for the name of the button only found out
                                  after job bags had been used extensively and would
                                  have caused agro if changed}
end;

procedure TfrmPBMainMenu.CheckNonConformance;
begin
  btnNCA.visible := dmBroker.UseNonConformance;
  mnuNonConformance.Visible := btnNCA.Visible;
  mnuNCA.Visible := btnNCA.Visible;
end;

procedure TfrmPBMainMenu.CheckContracts;
begin
  btnContracts.visible := dmBroker.UseContracts;
  mnuContracts.Visible := btnContracts.Visible;
  mnuContracts.Visible := btnContracts.Visible;
end;

procedure TfrmPBMainMenu.CheckProspects;
begin
  btnProspects.visible := dmBroker.UseProspects;
  mnuProspects.Visible := btnProspects.Visible;
end;

procedure TfrmPBMainMenu.CheckEndUsers;
begin
  btnEndUsers.visible := dmBroker.UseAcquiredCustomers;
  mnuEndUsers.Visible := btnEndUsers.Visible;
end;

procedure TfrmPBMainMenu.CheckActivityReminder;
begin
  dtmdlCustActivity := TdtmdlActivity.create(self);

  try
    dtmdlCustActivity.Customer := 0;
    dtmdlCustActivity.AssignedTo := self.iOperator;
    if dtmdlCustActivity.RefreshReminders > 0 then
      begin
        PBMaintActivityReminderFrm := TPBMaintActivityReminderFrm.create(self);
        try
          PBMaintActivityReminderFrm.customer := dtmdlCustActivity.Customer;
          PBMaintActivityReminderFrm.Operator := dtmdlCustActivity.AssignedTo;
          PBMaintActivityReminderFrm.showmodal;
        finally
          PBMaintActivityReminderFrm.free
        end;
      end;
  finally
    dtmdlCustActivity.free;
  end;
end;

procedure TfrmPBMainMenu.CheckCRM;
var
  result: boolean;
  bEnquiryReminder, bQuoteReminder, bReorderReminder, bProofReminder, bOrderAckReminder, bDeliveryReminder: boolean;
begin
  UseCRMSystem := dmBroker.UseCRM;
  mnuActivityTypes.Visible := UseCRMSystem;
  btnActivities.visible := UseCRMSystem;
  mnuActivities.Visible := btnActivities.visible;

  self.EnquiryReminder := false;
  self.QuoteReminder := false;
  self.ProofReminder := false;
  self.ReorderReminder := false;
  self.OrderAckReminder := false;
  self.DeliveryReminder := false;

  if UseCRMSystem then
    begin
      result := dmBroker.GetOperatorReminders(frmPBMainMenu.iOperator, bEnquiryReminder, bQuoteReminder, bReorderReminder, bProofReminder, bOrderAckReminder, bDeliveryReminder);

      if result then
        begin
          self.EnquiryReminder := bEnquiryReminder;
          self.QuoteReminder := bQuoteReminder;
          self.ProofReminder := bProofReminder;
          self.ReorderReminder := bReorderReminder;
          self.OrderAckReminder := bOrderAckReminder;
          self.DeliveryReminder := bDeliveryReminder;
        end;
    end;
end;

procedure TfrmPBMainMenu.CheckRevenueCentres;
begin
  mnuRevenueCentres.visible := dmBroker.UseRevenueCentres;
end;

procedure TfrmPBMainMenu.CheckProduction;
begin
  btnWorksOrders.visible := dmBroker.UseProduction;
  btnQuotes.visible := dmBroker.UseProduction;
  miManufacturing.visible := btnWorksOrders.visible;
end;

procedure TfrmPBMainMenu.CheckAccountManagers;
begin
  mnuAccountManagers.visible := dmBroker.UseAccountManagers;
end;

procedure TfrmPBMainMenu.CheckStockinUse;
begin
  try
    with dmBroker.qryCompany do
      begin
        close;
        open;
        first;
        UseStockSystem := (fieldbyname('Use_Stock_system').asstring = 'Y');
      end;
  except
    UseStockSystem := false;
  end;
  btnStock.visible := UseStockSystem;
  btnCallOffs.visible := UseStockSystem;
  btnPurchases.visible := UseStockSystem;

  miStock.Visible := UseStockSystem;

  if not UseStockSystem then
    btnFormReferences.caption := 'Products';
end;

procedure TfrmpbMainMenu.SetUseStockSystem(const Value: boolean);
begin
  FUseStockSystem := Value;
end;

procedure TfrmpbMainMenu.SetUseJobBags(const Value: boolean);
begin
  FUseJobBags := Value;
end;

procedure TfrmpbMainMenu.btnPurchasesClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUPurchaseOrders then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUPurchaseOrders := TfrmpbLUPurchaseOrders.create(Application);
    frmpbLUPurchaseOrders.WindowState := wsMaximized;
    frmpbLUPurchaseOrders.Caption := btnPurchases.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.mnuEmailManagerClick(Sender: TObject);
Var
  FiName, DiName: Array [0..255] of char ;
begin

  if (FindWindow('TfrmPBEmailStatus', 'Maintain Emails') <> 0) then
  begin
    MessageDlg('The Email Manager is already running', mtError,
      [mbAbort], 0);
    exit;
  end;

	StrPCopy(FiName, LocalDir + 'emailmanager.exe') ;
	StrPCopy(DiName ,LocalDir) ;
	ShellExecute(0,nil,FiName,'', DiName, sw_Restore) ;

end;

procedure TfrmpbMainMenu.mnuStockPrefsClick(Sender: TObject);
begin
  StMaintParamFrm := TStMaintParamFrm.Create(Self);
  try
    StMaintParamFrm.ShowModal;
  finally
    StMaintParamFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuPageDesignerClick(Sender: TObject);
Var
  FiName, DiName: Array [0..255] of char ;
begin

  if (FindWindow('TPDMainMenuFrm', 'Broker Page and Letter Layout Designer') <> 0) then
  begin
    MessageDlg('Page Designer is already running', mtError,
      [mbAbort], 0);
    exit;
  end;

	StrPCopy(FiName, LocalDir + 'pagedesigner.exe') ;
	StrPCopy(DiName ,LocalDir) ;
	ShellExecute(0,nil,FiName,'', DiName, sw_Restore) ;
end;

procedure TfrmpbMainMenu.btnSalesInvoicing1Click(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUSalesInvoices then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUSalesInvoices := TfrmpbLUSalesInvoices.create(Application);
    frmpbLUSalesInvoices.WindowState := wsMaximized;
//    frmpbLUSalesInvoices.Caption := Invoicing1.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.btnSalesCredits1Click(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUSalesCredits then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUSalesCredits := TfrmpbLUSalesCredits.create(Application);
    frmpbLUSalesCredits.WindowState := wsMaximized;
//    frmpbLUSalesCredits.Caption := btnSalesCredits.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.PurchInvoicing1Click(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUPurchaseInvoices then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUPurchaseInvoices := TfrmpbLUPurchaseInvoices.create(Application);
    frmpbLUPurchaseInvoices.WindowState := wsMaximized;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.mnuPurchaseCreditClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUPurchaseCredits then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUPurchaseCredits := TfrmpbLUPurchaseCredits.create(Application);
    frmpbLUPurchaseCredits.WindowState := wsMaximized;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.Import1Click(Sender: TObject);
var
  i: integer;
begin
  if MDIChildCount > 0 then
    begin
    if MessageDlg('This option cannot be run with any other windows open, Do you wish to close all other windows?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
      begin
        for i := pred(MDIChildCount) downto 0 do
          begin
            MDIChildren[i].free;
          end;
      end
    else
      exit;
    end;

  PBAccExport1frm := TPBAccExport1frm.create(self);
  try
    PBAccExport1frm.showmodal;
  finally
    PBAccExport1frm.free;
  end;

end;

procedure TfrmpbMainMenu.About1Click(Sender: TObject);
begin
  {Show ABOUT screen}
  PBAboutFrm := TPBAboutFrm.Create(Self);
  try
    PBAboutFrm.DataBaseLabel.Caption := 'Logged into ' + sDataBaseDescr + ' database!';
    PBAboutFrm.ShowModal;
  finally
    PBAboutFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuReasonsClick(Sender: TObject);
begin
  PBLUReasCodeFrm := TPBLUReasCodeFrm.Create(Self);
  try
    PBLUReasCodeFrm.bIs_Lookup := False;
    PBLUReasCodeFrm.bAllow_Upd := True;
    PBLUReasCodeFrm.ShowModal;
  finally
    PBLUReasCodeFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuProofClick(Sender: TObject);
begin
  PBLUProofStatusFrm := TPBLUProofStatusFrm.Create(Self);
  try
    PBLUProofStatusFrm.bIs_Lookup := False;
    PBLUProofStatusFrm.bAllow_Upd := True;
    PBLUProofStatusFrm.ShowModal;
  finally
    PBLUProofStatusFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuPeriodEndClick(Sender: TObject);
begin
  PBPeriodEndFrm := TPBPeriodEndFrm.Create(Self);
  try
    PBPeriodEndFrm.ShowModal;
  finally
    PBPeriodEndFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuProfitReportsClick(Sender: TObject);
begin
  PBRSSalesProfitFrm := TPBRSSalesProfitFrm.Create(Self);
  try
    PBRSSalesProfitFrm.ShowModal;
  finally
    PBRSSalesProfitFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuClientClick(Sender: TObject);
begin
  PBMaintClientFrm := TPBMaintClientFrm.Create(Self);
  try
    PBMaintClientFrm.ShowModal;
  finally
    PBMaintClientFrm.Free;
    // Go and get the email details for this user and this database
    GetEmailDetails;
  end;
end;

procedure TfrmpbMainMenu.mnuManageLocksClick(Sender: TObject);
begin
  PBWorkstationLockFrm := TPBWorkstationLockFrm.Create(Self);
  try
    PBWorkstationLockFrm.ShowModal;
  finally
    PBWorkstationLockFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuManageLoginsClick(Sender: TObject);
begin
  PBMaintLoginsFrm := TPBMaintLoginsFrm.Create(Self);
  try
    PBMaintLoginsFrm.ShowModal;
  finally
    PBMaintLoginsFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuViewAuditTrailClick(Sender: TObject);
begin
  PBAuditViewFrm := TPBAuditViewFrm.Create(Self);
  try
    PBAuditViewFrm.ShowModal;
  finally
    PBAuditViewFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.PrintWorksheet1Click(Sender: TObject);
begin
  STStkTkSlFrm := TSTStkTkSlFrm.Create(Self);
  try
    STStkTkSlFrm.ShowModal;
  finally
    STStkTkSlFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.FreezeStockCount1Click(Sender: TObject);
begin
  STStkTkSelFrm := TSTStkTkSelFrm.Create(Self);
  try
    STStkTkSelFrm.fMaintmode := 'F';
    STStkTkSelFrm.ShowModal;
  finally
    STStkTkSelFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.UpdateStockCount1Click(Sender: TObject);
begin
  STStkTkSelFrm := TSTStkTkSelFrm.Create(Self);
  try
    STStkTkSelFrm.fMaintmode := 'U';
    STStkTkSelFrm.ShowModal;
  finally
    STStkTkSelFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuSetCurrentPeriodClick(Sender: TObject);
begin
  PBMaintCompanyFYFrm := TPBMaintCompanyFYFrm.Create(Self);
  try
    PBMaintCompanyFYFrm.ShowModal;
  finally
    PBMaintCompanyFYFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuFinancialsClick(Sender: TObject);
begin
  PBLUFinanceYearFrm := TPBLUFinanceYearFrm.Create(Self);
  try
    PBLUFinanceYearFrm.bIs_Lookup := False;
    PBLUFinanceYearFrm.bAllow_Upd := True;
    PBLUFinanceYearFrm.ShowModal;
  finally
    PBLUFinanceYearFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuJobTypesClick(Sender: TObject);
begin
  PBLUJobTypeFrm := TPBLUJobTypeFrm.Create(Self);
  try
    PBLUJobTypeFrm.bIs_Lookup := False;
    PBLUJobTypeFrm.bAllow_Upd := True;
    PBLUJobTypeFrm.ShowModal;
  finally
    PBLUJobTypeFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuSalesInvoicingClick(Sender: TObject);
begin
  btnSalesInvoicing1Click(Self);
end;

procedure TfrmpbMainMenu.mnuPurchaseInvoicingClick(Sender: TObject);
begin
  PurchInvoicing1Click(Self);
end;

procedure TfrmpbMainMenu.btnFormReferencesClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUFormReferences then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUFormReferences := TfrmpbLUFormReferences.create(Application);
    frmpbLUFormReferences.WindowState := wsMaximized;
    frmpbLUFormReferences.Caption := btnFormReferences.Hint;
  finally
    screen.cursor := oldcursor;
  end;

end;

procedure TfrmpbMainMenu.mnuProductionLocationsClick(Sender: TObject);
begin
  PBLUProductionLocFrm := TPBLUProductionLocFrm.Create(Self);
  try
    PBLUProductionLocFrm.bIs_Lookup := False;
    PBLUProductionLocFrm.bAllow_Upd := True;
    PBLUProductionLocFrm.ShowModal;
  finally
    PBLUProductionLocFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.btnWorksOrdersClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUWorksOrders then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUWorksOrders := TfrmpbLUWorksOrders.create(Application);
    frmpbLUWorksOrders.WindowState := wsMaximized;
    frmpbLUWorksOrders.Caption := btnWorksOrders.Hint;
  finally
    screen.cursor := oldcursor;
  end;

end;

procedure TfrmpbMainMenu.mnuProductionTypesClick(Sender: TObject);
begin
  PBLUProductionTypeFrm := TPBLUProductionTypeFrm.Create(Self);
  try
    PBLUProductionTypeFrm.bIs_Lookup := False;
    PBLUProductionTypeFrm.bAllow_Upd := True;
    PBLUProductionTypeFrm.ShowModal;
  finally
    PBLUProductionTypeFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuProcessesClick(Sender: TObject);
begin
  PBLUProcessFrm := TPBLUProcessFrm.Create(Self);
  try
    PBLUProcessFrm.bIs_Lookup := False;
    PBLUProcessFrm.bAllow_Upd := True;
    PBLUProcessFrm.ShowModal;
  finally
    PBLUProcessFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuAccountTeamsClick(Sender: TObject);
begin
  PBLUAccountTeamFrm := TPBLUAccountTeamFrm.create(self);
  try
    PBLUAccountTeamFrm.bIs_Lookup := False;
    PBLUAccountTeamFrm.bAllow_Upd := True;
    PBLUAccountTeamFrm.showmodal;
  finally
    PBLUAccountTeamFrm.free;
  end;
end;

procedure TfrmpbMainMenu.RepTeams1Click(Sender: TObject);
begin
  PBLURepTeamFrm := TPBLURepTeamFrm.create(self);
  try
    PBLURepTeamFrm.bIs_Lookup := False;
    PBLURepTeamFrm.bAllow_Upd := True;
    PBLURepTeamFrm.showmodal;
  finally
    PBLURepTeamFrm.free;
  end;

end;

procedure TfrmpbMainMenu.mnuAccManMaintainClick(Sender: TObject);
begin
  PBLUAccountManagerFrm := TPBLUAccountManagerFrm.create(self);
  try
    PBLUAccountManagerFrm.bIs_Lookup := False;
    PBLUAccountManagerFrm.bAllow_Upd := True;
    PBLUAccountManagerFrm.showmodal;
  finally
    PBLUAccountManagerFrm.free;
  end;
end;

procedure TfrmpbMainMenu.mnuSalesRepsClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := False;
    PBLURepFrm.bAllow_Upd := True;
    PBLURepFrm.ShowModal;
  finally
    PBLURepFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuRepTeamsClick(Sender: TObject);
begin
  PBLURepTeamFrm := TPBLURepTeamFrm.Create(Self);
  try
    PBLURepTeamFrm.bIs_Lookup := False;
    PBLURepTeamFrm.bAllow_Upd := True;
    PBLURepTeamFrm.ShowModal;
  finally
    PBLURepTeamFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.SetJobBagsMandatory(const Value: boolean);
begin
  FJobBagsMandatory := Value;
end;

procedure TfrmpbMainMenu.mnuManagementRptsClick(Sender: TObject);
begin
  frmPBLUManagementRpts := TfrmPBLUManagementRpts.create(self);
  try
    frmPBLUManagementRpts.showmodal;
  finally
    frmPBLUManagementRpts.free;
  end;
end;

procedure TfrmpbMainMenu.mnuPackageSizesClick(Sender: TObject);
begin
  PBLUPackageSizeFrm := TPBLUPackageSizeFrm.Create(Self);
  try
    PBLUPackageSizeFrm.bIs_Lookup := False;
    PBLUPackageSizeFrm.bAllow_Upd := True;
    PBLUPackageSizeFrm.ShowModal;
  finally
    PBLUPackageSizeFrm.Free;
  end
end;

procedure TfrmpbMainMenu.StockManagement1Click(Sender: TObject);
begin
  STMaintStockFrm := TSTMaintStockFrm.create(self);
  try
    STMaintStockFrm.showmodal;
  finally
    STMaintStockFrm.free;
  end;
end;

procedure TfrmpbMainMenu.mnuSalesbyInvoiceNumberClick(Sender: TObject);
begin
  PBRSSalesbyInvFRM := TPBRSSalesbyInvFRM.Create(self);
  try
    PBRSSalesbyInvFRM.showmodal;
  finally
    PBRSSalesbyInvFRM.free;
  end;
end;

procedure TfrmpbMainMenu.mnuRepRptsClick(Sender: TObject);
begin
  frmPBLURepRpts := TfrmPBLURepRpts.create(self);
  try
    frmPBLURepRpts.showmodal;
  finally
    frmPBLURepRpts.free;
  end;
end;

procedure TfrmpbMainMenu.MenuItemClick(Sender: TObject);
var
  iCount: Integer;
  sTempProgDescr: String ;
begin
  {Determine the state of what's been clicked} ;
  {iAccCtrl: 1=Full, 2=Notes, 3=Enquiry, 4=Rep, 5=Operator} ;
  {Set the Access Control flag for the MENU} ;
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator,(Sender as TMenuItem).Name) ;
  {Write the audit trail details} ;
  sTempProgDescr := (Sender as TMenuItem).Caption ;
  {Write an ENTER PROGRAM record to the audit trail} ;
  try
    PBAuditDataMod.WriteAudit(3, 0, 0, 0, 0, sTempProgDescr) ;
  except
  end;
  {Now find and run the original ONCLICK event} ;
  For iCount := 0 to OnClicksCount -1 do
    If OnClicksName[iCount] = (Sender as TMenuItem).Name then
      begin
        OnClicks[iCount](Sender) ;
        Break ;
      end;
  {Write an EXIT PROGRAM record to the audit trail} ;
  try
    PBAuditDataMod.WriteAudit(4, 0, 0, 0, 0, sTempProgDescr) ;
  except
  end;
end;

procedure TfrmpbMainMenu.mnuStocktakeClick(Sender: TObject);
begin
  frmPBLUStockTake := TfrmPBLUStockTake.create(self);
  try
    frmPBLUStockTake.showmodal;
  finally
    frmPBLUStockTake.free;
  end;
end;

procedure TfrmpbMainMenu.mnuRevenueCentresClick(Sender: TObject);
begin
  PBLURevenueLocfrm := TPBLURevenueLocfrm.create(self);
  try
    PBLURevenueLocfrm.bIs_LookUp := False ;
    PBLURevenueLocfrm.bAllow_Upd := True ;
    PBLURevenueLocfrm.showmodal;
  finally
    PBLURevenueLocfrm.free;
  end;
end;

procedure TfrmpbMainMenu.mnuCategoriesClick(Sender: TObject);
begin
  PBLUCategoryFrm := TPBLUCategoryFrm.Create(Self);
  try
    PBLUCategoryFrm.bIs_Lookup := False;
    PBLUCategoryFrm.bAllow_Upd := True;
    PBLUCategoryFrm.ShowModal;
  finally
    PBLUCategoryFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure TfrmpbMainMenu.miExcelClick(Sender: TObject);
var
  icount: integer;
  tmpForm: TForm;
  tmpQuery: TQuery;
  tmpGrid: TDBGrid;
begin
  tmpForm := ActiveMDIChild;
  ExportToExcel(tmpForm);
end;

procedure TfrmpbMainMenu.ExportToExcel(tmpForm: TForm);
var
  icount: integer;
  tmpQuery: TQuery;
  tmpGrid: TDBGrid;
begin
  for icount := 0 to pred(tmpForm.ComponentCount) do
    begin
      if tmpForm.Components[icount] is TDBGrid then
        begin
          tmpGrid := (tmpForm.Components[icount] as TDBGrid);

          frmPBSendtoExcel := TfrmPBSendtoExcel.create(self);
          try
            frmPBSendtoExcel.ExportDBGrid := tmpGrid;
            frmPBSendtoExcel.ExportFormCaption := stringreplace(tmpForm.caption,'/','',[rfReplaceAll]);
            frmPBSendtoExcel.show;
          finally
            frmPBSendtoExcel.free;
          end;
          exit;
        end;
    end;
end;

procedure TfrmpbMainMenu.ExportGridToExcel(tmpForm: TForm);
var
  icount: integer;
  tmpGrid: TStringGrid;
begin
  for icount := 0 to pred(tmpForm.ComponentCount) do
    begin
      if tmpForm.Components[icount] is TStringGrid then
        begin
          tmpGrid := (tmpForm.Components[icount] as TSTringGrid);

          frmPBSendtoExcel := TfrmPBSendtoExcel.create(self);
          try
            frmPBSendtoExcel.ExportType := 'S';
            frmPBSendtoExcel.ExportStrGrid := tmpGrid;
            frmPBSendtoExcel.ExportFormCaption := tmpForm.caption;
            frmPBSendtoExcel.show;
          finally
            frmPBSendtoExcel.free;
          end;
          exit;
        end;
    end;
end;

procedure TfrmpbMainMenu.mnuWorkCentreGroupsClick(Sender: TObject);
begin
  PBLUWorkCentreGroupFrm := TPBLUWorkCentreGroupFrm.Create(Self);
  try
    PBLUWorkCentreGroupFrm.bIs_Lookup := False;
    PBLUWorkCentreGroupFrm.bAllow_Upd := True;
    PBLUWorkCentreGroupFrm.ShowModal;
  finally
    PBLUWorkCentreGroupFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuWorkCentresClick(Sender: TObject);
begin
  PBLUWorkCentreFrm := TPBLUWorkCentreFrm.Create(Self);
  try
    PBLUWorkCentreFrm.bIs_Lookup := False;
    PBLUWorkCentreFrm.bAllow_Upd := True;
    PBLUWorkCentreFrm.ShowModal;
  finally
    PBLUWorkCentreFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuCreditReasonsClick(Sender: TObject);
begin
  PBLUCreditReasonFrm := TPBLUCreditReasonFrm.Create(Self);
  try
    PBLUCreditReasonFrm.bIs_Lookup := False;
    PBLUCreditReasonFrm.bAllow_Upd := True;
    PBLUCreditReasonFrm.ShowModal;
  finally
    PBLUCreditReasonFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuCompanyBranchClick(Sender: TObject);
begin
  PBLUCompBranchfrm := TPBLUCompBranchfrm.create(self);
  try
    PBLUCompBranchfrm.bIs_LookUp := False ;
    PBLUCompBranchfrm.bAllow_Upd := True ;
    PBLUCompBranchfrm.showmodal;
  finally
    PBLUCompBranchfrm.free;
  end;
end;

procedure TfrmpbMainMenu.HowtoUseHelp1Click(Sender: TObject);
begin
  {Show PO ABOUT screen}
  PBAboutOpsFrm := TPBAboutOpsFrm.Create(Self);
  try
    PBAboutOpsFrm.ShowModal;
  finally
    PBAboutOpsFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.btnQuotesClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUQuotes then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUQuotes := TfrmpbLUQuotes.create(Application);
    frmpbLUQuotes.WindowState := wsMaximized;
    frmpbLUQuotes.Caption := btnQuotes.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.mnuQuoteReasonsClick(Sender: TObject);
begin
  PBLUQuoteReasonFrm := TPBLUQuoteReasonFrm.Create(Self);
  try
    PBLUQuoteReasonFrm.bIs_Lookup := False;
    PBLUQuoteReasonFrm.bAllow_Upd := True;
    PBLUQuoteReasonFrm.ShowModal;
  finally
    PBLUQuoteReasonFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuClientServicesRptsClick(Sender: TObject);
begin
  frmPBLUAccMgrRpts := TfrmPBLUAccMgrRpts.create(self);
  try
    frmPBLUAccMgrRpts.showmodal;
  finally
    frmPBLUAccMgrRpts.free;
  end;
end;

procedure TfrmpbMainMenu.mnuProcessGroupsClick(Sender: TObject);
begin
  PBLUProcessGroupFrm := TPBLUProcessGroupFrm.Create(Self);
  try
    PBLUProcessGroupFrm.bIs_Lookup := False;
    PBLUProcessGroupFrm.bAllow_Upd := True;
    PBLUProcessGroupFrm.ShowModal;
  finally
    PBLUProcessGroupFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.Barcodes1Click(Sender: TObject);
begin
  STRSBarCodeFrm := TSTRSBarCodeFrm.create(self);
  try
    STRSBarCodeFrm.showmodal;
  finally
    STRSBarCodeFrm.free;
  end;
end;

procedure TfrmpbMainMenu.miSwitchUserClick(Sender: TObject);
var
  i: integer;
begin
  if MessageDlg('Close the application and switch to a different user?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
(*      for i := 0 to pred(MDIChildCount) do
        begin
          MDIChildren[i].free;
        end;
*)
      for i := pred(MDIChildCount) downto 0 do
        begin
          MDIChildren[i].free;
        end;

      with dmBroker.qryDeleteWorkStationLock do
        begin
          Close;
          ParamByName('WorkStation').AsString := IntToStr(WorkStation);
          ExecSQL;
        end;

      with dmBroker.qryDeleteWorkStation do
        begin
          Close;
          ParamByName('WorkStation').AsString := IntToStr(WorkStation);
          ExecSQL;
        end;
      dmBroker.PBLDatabase.Close;
      PseudoFormActivate;
    end;
end;

procedure TfrmpbMainMenu.PseudoFormActivate;
var
  LoginFormOK                 : ByteBool;
  TempLogin, TempComputer                     : array[0..255] of Char;
  TempLoginSize, TempComputerSize             : DWORD;
begin
  MaxUsers := 100;

{$IFDEF NEXUS}
  MaxUsers := 1 ;
{$ENDIF}

{$IFDEF AVANTI}
  MaxUsers := 2 ;
{$ENDIF}

{$IFDEF NINE8NINE}
  MaxUsers := 2 ;
{$ENDIF}

{$IFDEF LATCHAM}
  MaxUsers := 3 ;
{$ENDIF}

{$IFDEF BROADSWORD}
  MaxUsers := 5 ;
{$ENDIF}

{$IFDEF SOLUTIONS23}
  MaxUsers := 3 ;
{$ENDIF}

{$IFDEF PREMIER}
  MaxUsers := 2 ;
{$ENDIF}

{$IFDEF PRINTGUY}
  MaxUsers := 4 ;
{$ENDIF}

{$IFDEF MAILADOC}
  MaxUsers := 9 ;
{$ENDIF}

{$IFDEF SOUTHERN MAIL}
  MaxUsers := 7 ;
{$ENDIF}

{$IFDEF BESLEYCOPP}
  MaxUsers := 8 ;
{$ENDIF}

{$IFDEF PMS}
  MaxUsers := 3 ;
{$ENDIF}

  ShowCustomers := true;
  frmPBLogin := TfrmPBLogin.Create(Self);

  try
    frmPBLogin.UserEdit.Text := stsbrMainMenu.Panels[0].Text;
    frmPBLogin.ShowModal;
    LoginFormOK := frmPBLogin.OK;
    if LoginFormOK then
      begin
        iRep := frmPBLogin.Rep;
        UserName := frmPBLogin.UserEdit.Text;
        stsbrMainMenu.Panels[0].Text := UserName;
        ioperator := frmPBLogin.Operator;
        sOperator_name := frmPBLogin.Operator_name;
        sDataBaseDescr := frmPBLogin.cmbAliasList.text;
        sFaxSystem := frmPBLogin.sFaxSystem ;

        TempComputerSize := SizeOf(TempComputer);
        GetComputerName(Addr(TempComputer), TempComputerSize);
        sCompName := TempComputer;

        frmpbMainMenu.WindowState := wsMaximized;

      end;
  finally
    frmPBLogin.Free;
  end;

  if not LoginFormOK then
    Application.Terminate
  else
    begin
      SetOperator(iOperator);
      PBImagesFrm.LoadReportLogo(Self);

      with dmBroker.qryDeleteWorkStationsLocks do
        begin
          Close;
          ParamByName('WorkStation_Name').AsString := sCompName;
          ExecSQL;
        end;

      with dmBroker.qryDeleteWorkStations do
        begin
          Close;
          ParamByName('WorkStation_Name').AsString := sCompName;
          ParamByName('Status_Descr').AsString := UserName;
          ExecSQL;
        end;

      {Try to get a valid workstation slot for this workstation};
      WorkStation := 0;
      {Try to find an empty workstation slot};
      with dmBroker.qryGetWorkStation do
        begin
          repeat
            begin
              WorkStation := WorkStation + 1;
              if WorkStation > MaxUsers then
                begin
                  { No empty slots};
                  MessageDlg('User limit exceeded', mtError, [mbAbort], 0);
                  WorkStation := 0;
                  Application.Terminate;
                  Exit;
                end;
              Close;
              ParamByName('WorkStation').AsString := IntToStr(WorkStation);
              Open;
              First;
            end;
          until EOF = True;
        end;

      with dmBroker.qryAddWorkStation do
        begin
          {Vacant slot found, add details for this workstation };
          Close;
          ParamByName('WorkStation').AsString := IntToStr(WorkStation);
          ParamByName('WorkStation_Name').AsString := sCompName;
          ParamByName('Status_Descr').AsString := UserName;
          ParamByName('Software_Version').AsString := sSoft_Version + sSoft_subVersion;
          ParamByName('Logged_in').Asdatetime := now;
          ExecSQL;
        end;

      {Get user and password from login screen}
      TempLoginSize := SizeOf(TempLogin);
      GetUserName(Addr(TempLogin), TempLoginSize);
      stsbrMainMenu.Panels[0].Text := TempLogin;
      {Check Database Version}
      CheckDBVersion;
      CheckJBinUse;
      CheckStockInUse;
      CheckRevenueCentres;
      CheckAccountManagers;
      CheckProduction;
      CheckNonConformance;
      CheckContracts;
      CheckProspects;
      CheckEndUsers;
      CheckCRM;
      
      GetCurrencyFormat;
      GetCompanyDetails;
      if UseCRMSystem then
        btnActivitiesClick(self)
      else
      if ShowCustomers then
        btnCustomersClick(self);

      {Write a LOGIN record to the audit trail} ;
      try
        if not dmBroker.IsSQL then
          begin
            PBAuditDataMod.Add1stAuditSQL.SQL.text :=
                    PBAuditDataMod.Access_Add1stAuditSQL.SQL.text;
            PBAuditDataMod.AddAuditSQL.SQL.text :=
                    PBAuditDataMod.Access_AddAuditSQL.SQL.text;
          end;
        PBAuditDataMod.WriteAudit(1, 0, 0, 0, 0, '') ;
      except
      end;
      Factivated := true;
    end;

  mnuEnquiries.Visible := btnEnquiries.Visible;
  mnuProduction.Visible := btnProduction.Visible;
  mnuJobs.Visible := btnJobs.Visible;
  mnuStock.Visible := btnStock.Visible;

  mnuFormReferences.Visible := btnFormReferences.Visible;
  mnuSalesInvoicing.Visible := btnSalesInvoicing.Visible;
  mnuCallOffs.Visible := btnCallOffs.Visible;
  mnuPurchaseInvoicing.Visible := btnPurchaseInvoicing.Visible;
  mnuPurchases.Visible := btnPurchases.Visible;
  mnuFSCClaim.Visible := dmBroker.UseFSCClaim;

  if frmPBMainMenu.UseCRMSystem then
    CheckActivityReminder;
//    tmrCheckActivity.Enabled := true;
end;

procedure TfrmpbMainMenu.ProductManagement1Click(Sender: TObject);
begin
  STMaintCustStockFrm := TSTMaintCustStockFrm.create(self);
  try
    STMaintCustStockFrm.showmodal;
  finally
    STMaintCustStockFrm.free;
  end;
end;

procedure TfrmpbMainMenu.ManageAliases1Click(Sender: TObject);
begin
  PBLUDBAliasFrm := TPBLUDBAliasFrm.create(self);
  try
    PBLUDBAliasFrm.showmodal;
  finally
    PBLUDBAliasFrm.free;
  end;

end;

procedure TfrmpbMainMenu.mnuFSCClaimClick(Sender: TObject);
begin
  PBLUFSCClaimfrm := TPBLUFSCClaimfrm.create(self);
  try
    PBLUFSCClaimfrm.bIs_LookUp := False ;
    PBLUFSCClaimfrm.bAllow_Upd := True ;
    PBLUFSCClaimfrm.showmodal;
  finally
    PBLUFSCClaimfrm.free;
  end;
end;

procedure TfrmpbMainMenu.mnuWCOperatorsClick(Sender: TObject);
begin
  PBLUWCOperatorFrm := TPBLUWCOperatorFrm.Create(Self);
  try
    PBLUWCOperatorFrm.bIs_Lookup := False;
    PBLUWCOperatorFrm.bAllow_Upd := True;
    PBLUWCOperatorFrm.ShowModal;
  finally
    PBLUWCOperatorFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuProductionRptsClick(Sender: TObject);
begin
  frmPBLUProductionRpts := TfrmPBLUProductionRpts.create(self);
  try
    frmPBLUProductionRpts.showmodal;
  finally
    frmPBLUProductionRpts.free;
  end;
end;

procedure TfrmpbMainMenu.mnuQAOperatorsClick(Sender: TObject);
begin
  PBLUQAOperatorFrm := TPBLUQAOperatorFrm.Create(Self);
  try
    PBLUQAOperatorFrm.bIs_Lookup := False;
    PBLUQAOperatorFrm.bAllow_Upd := True;
    PBLUQAOperatorFrm.ShowModal;
  finally
    PBLUQAOperatorFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuNCReasonsClick(Sender: TObject);
begin
  PBLUNonConformTypeFrm := TPBLUNonConformTypeFrm.Create(Self);
  try
    PBLUNonConformTypeFrm.bIs_Lookup := False;
    PBLUNonConformTypeFrm.bAllow_Upd := True;
    PBLUNonConformTypeFrm.ShowModal;
  finally
    PBLUNonConformTypeFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuNCDepartmentsClick(Sender: TObject);
begin
  PBLUNonConformDeptFrm := TPBLUNonConformDeptFrm.Create(Self);
  try
    PBLUNonConformDeptFrm.bIs_Lookup := False;
    PBLUNonConformDeptFrm.bAllow_Upd := True;
    PBLUNonConformDeptFrm.ShowModal;
  finally
    PBLUNonConformDeptFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.btnNCAClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUNCA then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUNCA := TfrmpbLUNCA.create(Application);
    frmpbLUNCA.WindowState := wsMaximized;
    frmpbLUNCA.Caption := btnNCA.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.Recipients1Click(Sender: TObject);
begin
  PBMaintNonConformOpsFrm := TPBMaintNonConformOpsFrm.Create(Self);
  try
    PBMaintNonConformOpsFrm.ShowModal;
  finally
    PBMaintNonConformOpsFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuPaymentTermsClick(Sender: TObject);
begin
  PBLUPaymentTermsFrm := TPBLUPaymentTermsFrm.Create(Self);
  try
    PBLUPaymentTermsFrm.bIs_Lookup := False;
    PBLUPaymentTermsFrm.bAllow_Upd := True;
    PBLUPaymentTermsFrm.ShowModal;
  finally
    PBLUPaymentTermsFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuNCCategoryClick(Sender: TObject);
begin
  PBLUNonConformCatFrm := TPBLUNonConformCatFrm.Create(Self);
  try
    PBLUNonConformCatFrm.bIs_Lookup := False;
    PBLUNonConformCatFrm.bAllow_Upd := True;
    PBLUNonConformCatFrm.ShowModal;
  finally
    PBLUNonConformCatFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuCouriersClick(Sender: TObject);
begin
  STLUCourierFrm := TSTLUCourierFrm.Create(Self);
  try
    STLUCourierFrm.bIs_LookUp := False ;
    STLUCourierFrm.bAllow_Upd := True ;
    STLUCourierFrm.ShowModal;
  finally
    STLUCourierFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.btnProspectsClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUProspects then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUProspects := TfrmpbLUProspects.create(Application);
    frmpbLUProspects.WindowState := wsMaximized;
    frmpbLUProspects.Caption := btnProspects.Hint;
  finally
    screen.cursor := oldcursor;
  end;

end;

procedure TfrmpbMainMenu.btnEndUsersClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUEndUsers then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUEndUsers := TfrmpbLUEndUsers.create(Application);
    frmpbLUEndUsers.WindowState := wsMaximized;
    frmpbLUEndUsers.Caption := btnEndUsers.Hint;
  finally
    screen.cursor := oldcursor;
  end;

end;

procedure TfrmpbMainMenu.mnuLevelOfImportanceClick(Sender: TObject);
begin
  PBLULevelOfImportanceFrm := TPBLULevelOfImportanceFrm.Create(self) ;
  try
    PBLULevelOfImportanceFrm.bIs_Lookup := False ;
    PBLULevelOfImportanceFrm.bAllow_Upd := True ;
    PBLULevelOfImportanceFrm.ShowModal ;
  Finally;
    PBLULevelOfImportanceFrm.Free ;
  end;
end;

procedure TfrmpbMainMenu.mnuCountryClick(Sender: TObject);
begin
  PBLUCountryFrm := TPBLUCountryFrm.Create(self) ;
  try
    PBLUCountryFrm.bIs_Lookup := False ;
    PBLUCountryFrm.bAllow_Upd := True ;
    PBLUCountryFrm.ShowModal ;
  Finally;
    PBLUCountryFrm.Free ;
  end;
end;

procedure TfrmpbMainMenu.mnuActivityTypesClick(Sender: TObject);
begin
  PBLUActivityTypeFrm := TPBLUActivityTypeFrm.Create(Self);
  try
    PBLUActivityTypeFrm.bIs_Lookup := False;
    PBLUActivityTypeFrm.bAllow_Upd := True;
    PBLUActivityTypeFrm.ShowModal;
  finally
    PBLUActivityTypeFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.SetUseCRMSystem(const Value: boolean);
begin
  FUseCRMSystem := Value;
end;

procedure TfrmpbMainMenu.mnuProductTypesClick(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := False;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.ShowModal;
  finally
    PBLUPrdTypFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuWorksOrderStatusClick(Sender: TObject);
begin
  PBLUWorksOrderStatusFrm := TPBLUWorksOrderStatusFrm.Create(Self);
  try
    PBLUWorksOrderStatusFrm.bIs_Lookup := False;
    PBLUWorksOrderStatusFrm.bAllow_Upd := True;
    PBLUWorksOrderStatusFrm.ShowModal;
  finally
    PBLUWorksOrderStatusFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuQuestionsClick(Sender: TObject);
begin
  PBQuestnCatsFrm := TPBQuestnCatsFrm.Create(Self);
  try
    PBQuestnCatsFrm.ShowModal;
  finally
    PBQuestnCatsFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuQuestionCatsClick(Sender: TObject);
begin
  PBLUQuestnFrm := TPBLUQuestnFrm.Create(Self);
  try
    PBLUQuestnFrm.bIs_Lookup := False;
    PBLUQuestnFrm.bAllow_Upd := True;
    PBLUQuestnFrm.ShowModal;
  finally
    PBLUQuestnFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuProductTypeCatsClick(Sender: TObject);
begin
  PBMaintProdCatsFrm := TPBMaintProdCatsFrm.Create(Self);
  try
    PBMaintProdCatsFrm.ShowModal;
  finally
    PBMaintProdCatsFrm.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuCapabilitiesClick(Sender: TObject);
begin
  PBLUCapFrm := TPBLUCapFrm.Create(Self);
  try
    PBLUCapFrm.bIs_Lookup := False;
    PBLUCapFrm.bAllow_Upd := True;
    PBLUCapFrm.ShowModal;
  finally
    PBLUCapFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuCapabilitiesCatsClick(Sender: TObject);
begin
  PBCapCatsFrm := TPBCapCatsFrm.Create(Self);
  try
    PBCapCatsFrm.ShowModal;
  finally
    PBCapCatsFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.mnuDocumentLogosClick(Sender: TObject);
begin
  frmPBLUDocumentLogos := TfrmPBLUDocumentLogos.Create(Self);
  try
    frmPBLUDocumentLogos.ShowModal;
  finally
    frmPBLUDocumentLogos.Free;
  end;

end;

procedure TfrmpbMainMenu.mnuPackFormatsClick(Sender: TObject);
begin
  PBLUPackFormatFrm := TPBLUPackFormatFrm.Create(Self);
  try
    PBLUPackFormatFrm.bIs_Lookup := False;
    PBLUPackFormatFrm.bAllow_Upd := True;
    PBLUPackFormatFrm.ShowModal;
  finally
    PBLUPackFormatFrm.Free;
  end;
end;

procedure TfrmpbMainMenu.tmrCheckActivityTimer(Sender: TObject);
begin
  CheckActivityReminder;
end;

procedure TfrmpbMainMenu.btnActivitiesClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUActivities then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUActivities := TfrmpbLUActivities.create(Application);
    frmpbLUActivities.WindowState := wsMaximized;
    frmpbLUActivities.Caption := btnActivities.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.btnContractsClick(Sender: TObject);
var
  oldCursor: TCursor;
  i: integer;
begin
  for i := 0 to pred(MDIChildCount) do
    begin
      if MDIChildren[i] is TfrmpbLUContracts then
        begin
          MDIChildren[i].show;
          exit;
        end;
    end;
  OldCursor := screen.cursor;
  screen.cursor := crHourGlass;

  try
    frmpbLUContracts := TfrmpbLUContracts.create(Application);
    frmpbLUContracts.WindowState := wsMaximized;
    frmpbLUContracts.Caption := btnActivities.Hint;
  finally
    screen.cursor := oldcursor;
  end;
end;

procedure TfrmpbMainMenu.mnuLicenceActivationClick(Sender: TObject);
begin
  frmPBExpiryDate := TfrmPBExpiryDate.create(self);

  try
    frmPBExpiryDate.showmodal;
  finally
    frmPBExpiryDate.free;
  end;

end;

procedure TfrmpbMainMenu.SetEnquiryReminder(const Value: boolean);
begin
  FEnquiryReminder := Value;
end;

procedure TfrmpbMainMenu.SetDeliveryReminder(const Value: boolean);
begin
  FDeliveryReminder := Value;
end;

procedure TfrmpbMainMenu.SetOrderAckReminder(const Value: boolean);
begin
  FOrderAckReminder := Value;
end;

procedure TfrmpbMainMenu.SetProofReminder(const Value: boolean);
begin
  FProofReminder := Value;
end;

procedure TfrmpbMainMenu.SetQuoteReminder(const Value: boolean);
begin
  FQuoteReminder := Value;
end;

procedure TfrmpbMainMenu.SetReorderReminder(const Value: boolean);
begin
  FReorderReminder := Value;
end;

end.
