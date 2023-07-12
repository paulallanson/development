unit wtMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ImgList, ComCtrls, ToolWin, IniFiles, StdActns, ActnList,
  ShellAPI, AllCommon, DB, DBTables, Grids, DBGrids, System.Actions,
  System.ImageList;

type
  TfrmWTMain = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;                                         
    btnCustomers: TToolButton;
    btnQuotes: TToolButton;
    btnJobs: TToolButton;
    imgLstHot: TImageList;
    mnMenu: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    Modules1: TMenuItem;
    mnuSettings: TMenuItem;
    Tools1: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    ActionList1: TActionList;
    WindowArrange1: TWindowArrange;
    WindowCascade1: TWindowCascade;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    Arrange1: TMenuItem;
    Cascade1: TMenuItem;
    MinimizeAll1: TMenuItem;
    TileHorizintally1: TMenuItem;
    TileVertically1: TMenuItem;
    Close1: TMenuItem;
    CloseAll1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    actnCloseAll: TAction;
    mnuCompanyPreferences: TMenuItem;
    mnuMaterialTypes: TMenuItem;
    mnuThicknesses: TMenuItem;
    mnuWorktops: TMenuItem;
    mnuEdgedetails: TMenuItem;
    mnuCutOut: TMenuItem;
    mnuOthercharges: TMenuItem;
    mnuCustomers: TMenuItem;
    mnuQuotes: TMenuItem;
    mnuJobs: TMenuItem;
    mnuPriceChanges: TMenuItem;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditDelete1: TEditDelete;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N2: TMenuItem;
    SelectAll1: TMenuItem;
    HelpContents1: THelpContents;
    HelpOnHelp1: THelpOnHelp;
    HelpTopicSearch1: THelpTopicSearch;
    Contents1: TMenuItem;
    HelponHelp2: TMenuItem;
    TopicSearch1: TMenuItem;
    N3: TMenuItem;
    Edgeprofile1: TMenuItem;
    Additionalcharges1: TMenuItem;
    Cutouts1: TMenuItem;
    Features1: TMenuItem;
    About1: TMenuItem;
    N4: TMenuItem;
    mnuCustomertypes: TMenuItem;
    mnuVat: TMenuItem;
    btnPurchasing: TToolButton;
    btnSalesInvoices: TToolButton;
    btnSales: TToolButton;
    N5: TMenuItem;
    mnuCheckPrices: TMenuItem;
    N6: TMenuItem;
    mnuOperators: TMenuItem;
    PriceGroups1: TMenuItem;
    WorktopGroupPrices1: TMenuItem;
    WorktopPrices1: TMenuItem;
    ypes1: TMenuItem;
    mnuFaxManager: TMenuItem;
    N7: TMenuItem;
    mnuClientSettings: TMenuItem;
    btnStock: TToolButton;
    mnuReps: TMenuItem;
    mnuStockSettings: TMenuItem;
    ProductGroups1: TMenuItem;
    Products1: TMenuItem;
    pmnuSInvoicing: TPopupMenu;
    btnSalesInvoicing: TMenuItem;
    btnSalesCredits: TMenuItem;
    mnuSales: TMenuItem;
    mnuSalesInvoices: TMenuItem;
    mnuSalesCredits: TMenuItem;
    mnuDemoActivate: TMenuItem;
    N8: TMenuItem;
    mnuImportExport: TMenuItem;
    mnuFitters: TMenuItem;
    mnuSalesLeadSources: TMenuItem;
    mnuStock: TMenuItem;
    mnuDesigners: TMenuItem;
    N9: TMenuItem;
    Sendto1: TMenuItem;
    Excel1: TMenuItem;
    SwitchUser1: TMenuItem;
    mnuReports: TMenuItem;
    ManagementReports1: TMenuItem;
    mnuTradeDetails: TMenuItem;
    mnuDataSources: TMenuItem;
    mnuContactTypes: TMenuItem;
    mnuProspectActions: TMenuItem;
    mnuMaterialUses: TMenuItem;
    ClientSettings1: TMenuItem;
    N10: TMenuItem;
    OldWorktopPrices1: TMenuItem;
    btnSuppliers: TToolButton;
    mnuSuppliers: TMenuItem;
    mnuPaymentTerms: TMenuItem;
    mnuReasons: TMenuItem;
    mnuSpecialInstructions: TMenuItem;
    btnContracts: TToolButton;
    btnPrices: TToolButton;
    mnuManageLogins: TMenuItem;
    stsbrStatus: TStatusBar;
    mnuContracts: TMenuItem;
    mnuPrices: TMenuItem;
    mnuLicenceActivation: TMenuItem;
    Types2: TMenuItem;
    Brands1: TMenuItem;
    mnuFeatures: TMenuItem;
    ColourGroups2: TMenuItem;
    Finishes1: TMenuItem;
    Textures1: TMenuItem;
    mnuInstallationAreas: TMenuItem;
    mnuDiscounts: TMenuItem;
    mnuPromotions: TMenuItem;
    mnuExpiryDate: TMenuItem;
    mnuLevelofImportance: TMenuItem;
    mnuScheduling: TMenuItem;
    mnuAppointmentType: TMenuItem;
    mnuAppointmentDateType: TMenuItem;
    WebSiteIntegration1: TMenuItem;
    mnuOffers: TMenuItem;
    mnuManageAppointmentLocks: TMenuItem;
    btnTemplating: TToolButton;
    ResetClientSettings1: TMenuItem;
    mnuLastNumbers: TMenuItem;
    mnuScripts: TMenuItem;
    btnFitting: TToolButton;
    N11: TMenuItem;
    mnuRemedialType: TMenuItem;
    mnuRemedialCategory: TMenuItem;
    mnuRemedialSource: TMenuItem;
    N12: TMenuItem;
    mnuRevenueCentres: TMenuItem;
    mnuGeneralPriceChanges: TMenuItem;
    mnuCustomerPriceOptions: TMenuItem;
    mnuProductPriceChanges: TMenuItem;
    N13: TMenuItem;
    mnuAllocateDocumentstoOrders: TMenuItem;
    procedure Brands1Click(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure btnSuppliersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actnCloseAllExecute(Sender: TObject);
    procedure actnCloseAllUpdate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure btnPurchasingClick(Sender: TObject);
    procedure btnQuotesClick(Sender: TObject);
    procedure mnuCompanyPreferencesClick(Sender: TObject);
    procedure mnuMaterialUsesClick(Sender: TObject);
    procedure mnuThicknessesClick(Sender: TObject);
    procedure mnuOtherchargesClick(Sender: TObject);
    procedure Edgeprofile1Click(Sender: TObject);
    procedure Additionalcharges1Click(Sender: TObject);
    procedure Cutouts1Click(Sender: TObject);
    procedure Features1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure mnuCustomertypesClick(Sender: TObject);
    procedure mnuAppointmentTypeClick(Sender: TObject);
    procedure mnuAppointmentDateTypeClick(Sender: TObject);
    procedure mnuLevelofImportanceClick(Sender: TObject);
    procedure mnuVatClick(Sender: TObject);
    procedure mnuReasonsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSalesClick(Sender: TObject);
    procedure btnJobsClick(Sender: TObject);
    procedure mnuScriptsClick(Sender: TObject);
    procedure mnuCheckPricesClick(Sender: TObject);
    procedure mnuOperatorsClick(Sender: TObject);
    procedure WorktopPrices1Click(Sender: TObject);
    procedure OldWorktopPrices1Click(Sender: TObject);
    procedure PriceGroups1Click(Sender: TObject);
    procedure WorktopGroupPrices1Click(Sender: TObject);
    procedure ypes1Click(Sender: TObject);
    procedure mnuFaxManagerClick(Sender: TObject);
    procedure mnuClientSettingsClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure btnFittingClick(Sender: TObject);
    procedure btnTemplatingClick(Sender: TObject);
    procedure mnuRepsClick(Sender: TObject);
    procedure ProductGroups1Click(Sender: TObject);
    procedure Products1Click(Sender: TObject);
    procedure btnSalesInvoicingClick(Sender: TObject);
    procedure btnSalesCreditsClick(Sender: TObject);
    procedure btnPricesClick(Sender: TObject);
    procedure btnContractsClick(Sender: TObject);
    procedure mnuCustomersClick(Sender: TObject);
    procedure mnuSuppliersClick(Sender: TObject);
    procedure mnuQuotesClick(Sender: TObject);
    procedure mnuJobsClick(Sender: TObject);
    procedure mnuSalesClick(Sender: TObject);
    procedure mnuSalesInvoicesClick(Sender: TObject);
    procedure mnuSalesCreditsClick(Sender: TObject);
    procedure mnuPaymentTermsClick(Sender: TObject);
    procedure mnuManageAppointmentLocksClick(Sender: TObject);
    procedure mnuManageLoginsClick(Sender: TObject);
    procedure ResetClientSettings1Click(Sender: TObject);
    procedure mnuFittersClick(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure mnuImportExportClick(Sender: TObject);
    procedure mnuSalesLeadSourcesClick(Sender: TObject);
    procedure mnuOffersClick(Sender: TObject);
    procedure mnuSpecialInstructionsClick(Sender: TObject);
    procedure mnuDesignersClick(Sender: TObject);
    procedure mnuDataSourcesClick(Sender: TObject);
    procedure mnuProspectActionsClick(Sender: TObject);
    procedure mnuContactTypesClick(Sender: TObject);
    procedure SwitchUser1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure ManagementReports1Click(Sender: TObject);
    procedure ClientSettings1Click(Sender: TObject);
    procedure mnuTradeDetailsClick(Sender: TObject);
    procedure mnuContractsClick(Sender: TObject);
    procedure mnuPricesClick(Sender: TObject);
    procedure ExportTableToExcel(tmpForm: TForm);
    procedure ExportToExcel(tmpForm: TForm);
    procedure mnuLicenceActivationClick(Sender: TObject);
    procedure Types2Click(Sender: TObject);
    procedure ColourGroups2Click(Sender: TObject);
    procedure Finishes1Click(Sender: TObject);
    procedure Textures1Click(Sender: TObject);
    procedure mnuInstallationAreasClick(Sender: TObject);
    procedure mnuDiscountsClick(Sender: TObject);
    procedure mnuPromotionsClick(Sender: TObject);
    procedure mnuExpiryDateClick(Sender: TObject);
    procedure mnuLastNumbersClick(Sender: TObject);
    procedure mnuRemedialTypeClick(Sender: TObject);
    procedure mnuRemedialCategoryClick(Sender: TObject);
    procedure mnuRemedialSourceClick(Sender: TObject);
    procedure mnuRevenueCentresClick(Sender: TObject);
    procedure mnuGeneralPriceChangesClick(Sender: TObject);
    procedure mnuCustomerPriceOptionsClick(Sender: TObject);
    procedure mnuProductPriceChangesClick(Sender: TObject);
    procedure mnuAllocateDocumentstoOrdersClick(Sender: TObject);
{$IFDEF DEMO}
    procedure mnuDemoActivateClick(Sender: TObject);
{$ENDIF}
{$IFDEF ENDUSER}
    procedure mnuEndUserActivateClick(Sender: TObject);
    procedure mnuScriptsClick(Sender: TObject);
{$ENDIF}
  private
    FActivated: Boolean;
    FDemoExpired: Boolean;
    FOperator: integer;
    FOperatorEmail: string;
    FOperatorName: string;
    FOperatorRevenueCentre: integer;
    FFaxSystem: string;
    FDataBaseDescr: string;
    FComputerName: string;
    FSWVersion: string;
    FSWSubVersion: string;
    FUserName: string;
    FDBVersion: string;
    ServDir, LocalDir, LocalDrive: string;
    procedure CheckContractQuoting;
    procedure CheckPurchaseOrdering;
    procedure CheckRevenueCentres;
    procedure CheckScheduling;
    procedure GetCompanyDetails;
    procedure GetEmailDetails;
    procedure SetOperator(const Value: integer);
    procedure SetOperatorEmail(const Value: string);
    procedure SetOperatorName(const Value: string);
    procedure SetOperatorRevenueCentre(const Value: integer);
    procedure SetDataBaseDescr(const Value: string);
    procedure SetFaxSystem(const Value: string);
    procedure SetComputerName(const Value: string);
    procedure UpdateDatabase;
    procedure DisableModules;
    procedure DisplayModuleButtons;
    procedure SetSWSubVersion(const Value: string);
    procedure SetSWVersion(const Value: string);
    procedure SetDBVersion(const Value: string);
    procedure SetUserName(const Value: string);
    function RunDBUpdate: boolean;
    procedure PseudoFormActivate;
    procedure LicenceCheck;
{$IFDEF DEMO}
    procedure DemoCheck(TempWarn: ByteBool);
    { Private declarations }
{$ENDIF}
{$IFDEF ENDUSER}
    procedure EndUserCheck(TempWarn: ByteBool);
    { Private declarations }
{$ENDIF}
  public
    bEndUser: boolean;
    WorkStation, MaxUsers: Integer;
    EmailApplication, EmailLocation, EmailAccount: string;
    AppIniFile: Array [0..255] of char;
    procedure ShowHints( Sender: TObject );
    property ComputerName: string read FComputerName write SetComputerName;
    property DataBaseDescr: string read FDataBaseDescr write SetDataBaseDescr;
    property DBVersion: string read FDBVersion write SetDBVersion;
    property FaxSystem: string read FFaxSystem write SetFaxSystem;
    property Operator: integer read FOperator write SetOperator;
    property OperatorEmail: string read FOperatorEmail write SetOperatorEmail;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property OperatorRevenueCentre: integer read FOperatorRevenueCentre write SetOperatorRevenueCentre;
    property SWVersion: string read FSWVersion write SetSWVersion;
    property SWSubVersion: string read FSWSubVersion write SetSWSubVersion;
    property UserName: string read FUserName write SetUserName;
  end;

var
  frmWTMain: TfrmWTMain;

implementation

uses wtDatabase, WTLogin, WTMaintParams, WTLUQuotes,
  wtLUMatType, wtLUThickness, wtLUworktops, wtLUCutOuts,
  wtLUAddChgs, wtLUCustomer, WTAutoPriceChange,
  wtAboutBox, wtLUEdges, wtLUCustType, wtLUVat,
  wtLUPurchases, wtLUSales, wtLUSalesInvoices, wtLUJobs, wtUtilities,
  wtLUOperators, WTUpdateDB, wtDataModule, wtLUWTGroup, WtLUWTGroupPrices,
  wtLUEdgeTypes, wtMaintClient, wtLUStock, wtLUReps, WTLUProductGroups,
  WTLUProducts, wtLUSalesCredits, wtLoginError, wtLicence, wtAccExport1,
  wtLUFitters, wtLUSalesLead, WTLUDesigner, WTSendtoExcel, WTLUEdgeDetails,
  wtLUCutOutDetails, WTLUManageMentRpts, WTMaintTrade, wtLUDataSource,
  WTLUContactType, wtLUProspectAction, wtLUMaterialUse, wtLUWorktopDetails,
  WTLUSupplier, WTLUPaymentTerms, wtLUReason, wtLUSpecialInstruction,
  WTLUContracts, WTLUPrices, WTMaintLogins, wtLUSlabSizes, wtExpiryDate,
  WTLUMaterialType, WTLUColourGroup, WTLUFinish, WTLUTextureGroup,
  wtLUInstallArea, wtLUDiscounts, wtLUPromotions, WTUSSetExpiryDate,
  wtLULevelofImportance, wtLUAppointmentType, wtLUAppointmentDateType,
  wtLUOffer, WTMaintAppointmentLock, wtLUQuoteSQL, WTLUTemplating, WTLUFitting,
  WTMaintLastNumbers, WTRunScripts, wtLURemedialType, wtLURemedialCategory,
  wtLURemedialDept,wtLURevenueCentre, AllImages, wtCustomerPriceChange,
  wtProductPriceChange, WTUSSetDocuments;

{$R *.DFM}

procedure TfrmWTMain.btnCustomersClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUCustomer then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUCustomer := TfrmWTLUCustomer.Create( Application );
    frmWTLUCustomer.WindowState := wsMaximized;
  finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.btnSuppliersClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUSupplier then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUSupplier := TfrmWTLUSupplier.Create( Application );
    frmWTLUSupplier.WindowState := wsMaximized;
  finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.ShowHints( Sender: TObject );
begin
  stsbrStatus.SimpleText := Application.Hint;
end;

procedure TfrmWTMain.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  TempUser                    : array[0..255] of Char;
  TempUserSize                : DWORD;
begin
  LocalDrive := copy(GetWinSysDir,1,2);
	LocalDir := extractfilepath(application.ExeName);

  if pos('Application Data',LocalDir) > 0 then
    StrPCopy(AppIniFile,LocalDir+'myWorktops.ini')
  else
    StrPCopy(AppIniFile,'myWorktops.ini');

{$IFDEF DEMO}
//  dtmdlWorktops.dtbsWorktops.AliasName := 'WorktopDemo';
{$ELSE}
(*  TempUserSize := SizeOf(TempUser);
  GetUserName(Addr(TempUser), TempUserSize);
  stsbrStatus.Panels[0].Text := TempUser;
*)
  ComputerName := GetUserFromWindows;
  stsbrStatus.Panels[0].Text := ComputerName;
{$ENDIF}
  SWVersion := '22.4.';
  SWSubVersion := '23.07.06a';

  IniFile := TIniFile.create(
             ChangeFileExt( Application.ExeName, '.INI' ) );
  with IniFile do
  begin
    Top     := ReadInteger( 'Form', 'Top',    100 );
    Left    := ReadInteger( 'Form', 'Left',   100 );
    if ReadBool( 'Form', 'InitMax', false ) then
    begin
      WindowState := wsMaximized
    end
    else
      WindowState := wsNormal;
  end; //with
  IniFile.free;
  with Application do
  begin
    HintPause := 200;
    OnHint    := ShowHints;
  end; //with
  frmWTMain.windowstate := wsMaximized;
end;

procedure TfrmWTMain.actnCloseAllExecute(Sender: TObject);
var
  i : integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].Close;
end;

procedure TfrmWTMain.actnCloseAllUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := MDIChildCount > 0;
end;

procedure TfrmWTMain.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTMain.btnPurchasingClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUPurchases then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUPurchases := TfrmWTLUPurchases.Create( Application );
    frmWTLUPurchases.WindowState := wsMaximized;
 finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.btnQuotesClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUQuotes then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUQuotes := TfrmWTLUQuotes.Create( Application );
    frmWTLUQuotes.WindowState := wsMaximized;
  finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuCompanyPreferencesClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtMaintParams := TfrmWtMaintParams.create(application);
  try
    frmWtMaintParams.showmodal;
  finally
    frmWtMaintParams.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
  mnuTradeDetails.Visible := dtmdlWorktops.UseTradeDetails;
  mnuScheduling.Visible := dtmdlWorktops.SchedulingSystem <> '';
  btnContracts.Visible := dtmdlWorktops.UseContractQuoting;
  btnPurchasing.Visible := dtmdlWorktops.UsePurchaseOrdering;
end;

procedure TfrmWTMain.mnuOffersClick(Sender: TObject);
begin
  frmWTLUOffer := TfrmWTLUOffer.create(application);
  try
    frmWTLUOffer.showmodal;
  finally
    frmWtLUSpecialInstruction.free;
  end;
end;

procedure TfrmWTMain.mnuSpecialInstructionsClick(Sender: TObject);
begin
  frmWTLUSpecialInstruction := TfrmWtLUSpecialInstruction.create(application);
  try
    frmWtLUSpecialInstruction.bAllow_Upd := true;
    frmWtLUSpecialInstruction.bIs_lookup := false;
    frmWtLUSpecialInstruction.showmodal;
  finally
    frmWtLUSpecialInstruction.free;
  end;
end;

procedure TfrmWTMain.mnuMaterialUsesClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUMaterialUse := TfrmWTLUMaterialUse.Create( Application );
  try
    frmWTLUMaterialUse.showmodal;
  finally
    frmWTLUMaterialUse.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuThicknessesClick(Sender: TObject);
begin
  frmWtLUThickness := TfrmWtLUThickness.create(application);
  try
    frmWtLUthickness.showmodal;
  finally
    frmWtLUThickness.free;
  end;
end;

procedure TfrmWTMain.mnuOtherchargesClick(Sender: TObject);
begin
  frmWtLUAddChgs := TfrmWtLUAddChgs.create(application);
  try
    frmWtLUAddChgs.showmodal;
  finally
    frmWtLUAddChgs.free;
  end;
end;

procedure TfrmWTMain.Edgeprofile1Click(Sender: TObject);
begin
  frmWtLUEdges := TfrmWtLUEdges.create(application);
  try
    frmWtLUEdges.showmodal;
  finally
    frmWtLUEdges.free;
  end;
end;

procedure TfrmWTMain.Additionalcharges1Click(Sender: TObject);
begin
  frmWtLUEdgeDetails := TfrmWtLUEdgeDetails.create(application);
  try
    frmWtLUEdgeDetails.showmodal;
  finally
    frmWtLUEdgeDetails.free;
  end;

end;

procedure TfrmWTMain.Cutouts1Click(Sender: TObject);
begin
  frmWtLUCutOutDetails := TfrmWtLUCutOutDetails.create(application);
  try
    frmWtLUCutOutDetails.showmodal;
  finally
    frmWtLUCutOutDetails.free;
  end;
end;

procedure TfrmWTMain.Features1Click(Sender: TObject);
begin
  frmWtLUCutOuts := TfrmWtLUCutOuts.create(application);
  try
    frmWtLUCutOuts.showmodal;
  finally
    frmWtLUCutOuts.free;
  end;

end;

procedure TfrmWTMain.mnuDiscountsClick(Sender: TObject);
begin
  frmWtLUDiscounts := TfrmWtLUDiscounts.create(application);
  try
    frmWtLUDiscounts.showmodal;
  finally
    frmWtLUDiscounts.free;
  end;
end;

procedure TfrmWTMain.mnuPromotionsClick(Sender: TObject);
begin
  frmWtLUPromotions := TfrmWtLUPromotions.create(application);
  try
    frmWtLUPromotions.showmodal;
  finally
    frmWtLUPromotions.free;
  end;

end;

procedure TfrmWTMain.mnuExpiryDateClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTUSSetExpiryDate := TfrmWTUSSetExpiryDate.Create( Application );
  try
    frmWTUSSetExpiryDate.showmodal;
  finally
    frmWTUSSetExpiryDate.free;
    Screen.Cursor := OldCursor;
  end; // try..finally

end;

procedure TfrmWTMain.mnuAllocateDocumentstoOrdersClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTUSSetDocuments := TfrmWTUSSetDocuments.Create( Application );
  try
    frmWTUSSetDocuments.showmodal;
  finally
    frmWTUSSetDocuments.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuLastNumbersClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtMaintLastNumbers := TfrmWtMaintLastNumbers.create(application);
  try
    frmWtMaintLastNumbers.showmodal;
  finally
    frmWtMaintLastNumbers.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuRemedialTypeClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmwtLURemedialType := TfrmwtLURemedialType.Create( Application );
  try
    frmwtLURemedialType.showmodal;
  finally
    frmwtLURemedialType.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuRemedialCategoryClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmwtLURemedialCategory := TfrmwtLURemedialCategory.Create( Application );
  try
    frmwtLURemedialCategory.showmodal;
  finally
    frmwtLURemedialCategory.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuRevenueCentresClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmwtLURevenueCentre := TfrmwtLURevenueCentre.Create( Application );
  try
    frmwtLURevenueCentre.showmodal;
  finally
    frmwtLURevenueCentre.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuRemedialSourceClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmwtLURemedialDept := TfrmwtLURemedialDept.Create( Application );
  try
    frmwtLURemedialDept.showmodal;
  finally
    frmwtLURemedialDept.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuGeneralPriceChangesClick(Sender: TObject);
begin
  frmWtAutoPriceChange := TfrmWtAutoPriceChange.create(application);
  try
    frmWtAutoPriceChange.showmodal;
  finally
    frmWtAutoPriceChange.free;
  end;

end;

procedure TfrmWTMain.mnuCustomerPriceOptionsClick(Sender: TObject);
begin
  frmWtCustomerPriceChange := TfrmWtCustomerPriceChange.create(application);
  try
    frmWtCustomerPriceChange.showmodal;
  finally
    frmWtCustomerPriceChange.free;
  end;

end;

procedure TfrmWTMain.mnuProductPriceChangesClick(Sender: TObject);
begin
  frmWtProductPriceChange := TfrmWtProductPriceChange.create(application);
  try
    frmWtProductPriceChange.showmodal;
  finally
    frmWtProductPriceChange.free;
  end;
end;

procedure TfrmWTMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  if MessageDlg('Close the Firebelly application ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      for i := pred(MDIChildCount) downto 0 do
        begin
          MDIChildren[i].free;
        end;
      Action := caFree;

      with dtmdlWorktops.qryDeleteWorkStation do
        begin
          Close;
          ParamByName('WorkStation').AsString := IntToStr(WorkStation);
          ExecSQL;
        end;
    end
  else
    Action := caNone;
end;

procedure TfrmWTMain.About1Click(Sender: TObject);
begin
  frmwtAboutBox := TfrmwtAboutBox.create(application);
  try
    frmwtAboutBox.showmodal;
  finally
    frmwtAboutBox.free;
  end;
end;

procedure TfrmWTMain.mnuCustomertypesClick(Sender: TObject);
begin
  frmWtLUCustType := TfrmWtLUCustType.create(application);
  try
    frmWtLUCustType.showmodal;
  finally
    frmWtLUCustType.free;
  end;
end;

procedure TfrmWTMain.mnuAppointmentDateTypeClick(Sender: TObject);
begin
  frmWTLUAppointmentDateType := TfrmWTLUAppointmentDateType.create(application);
  try
    frmWTLUAppointmentDateType.showmodal;
  finally
    frmWTLUAppointmentDateType.free;
  end;
end;

procedure TfrmWTMain.mnuAppointmentTypeClick(Sender: TObject);
begin
  frmWTLUAppointmentType := TfrmWTLUAppointmentType.create(application);
  try
    frmWTLUAppointmentType.showmodal;
  finally
    frmWTLUAppointmentType.free;
  end;
end;

procedure TfrmWTMain.mnuLevelofImportanceClick(Sender: TObject);
begin
  frmWtLULevelofImportance := TfrmWtLULevelofImportance.create(application);
  try
    frmWtLULevelofImportance.showmodal;
  finally
    frmWtLULevelofImportance.free;
  end;
end;

procedure TfrmWTMain.mnuPaymentTermsClick(Sender: TObject);
begin
  frmWTLUPaymentTerms := TfrmWTLUPaymentTerms.create(application);
  try
    frmWTLUPaymentTerms.showmodal;
  finally
    frmWTLUPaymentTerms.free;
  end;
end;

procedure TfrmWTMain.mnuVatClick(Sender: TObject);
begin
  frmWtLUVAT := TfrmWtLUVAT.create(application);
  try
    frmWtLUVAT.showmodal;
  finally
    frmWtLUVAT.free;
  end;
end;

procedure TfrmWTMain.mnuReasonsClick(Sender: TObject);
begin
  frmWtLUReason := TfrmWtLUReason.create(application);
  try
    frmWtLUReason.showmodal;
  finally
    frmWtLUReason.free;
  end;
end;

procedure TfrmWTMain.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TfrmWTMain.SetOperatorRevenueCentre(const Value: integer);
begin
  FOperatorRevenueCentre := Value;
end;

procedure TfrmWTMain.LicenceCheck;
begin
//  exit;
  if trunc(date) > dtmdlWorktops.GetSoftwareCheckSum then
    begin
      MessageDlg('Your licence for Firebelly has expired. ' +
        'Please contact your software supplier on 0844 488 9206', mtError, [mbAbort], 0);
      Application.Terminate;
      Exit;
    end;
end;

procedure TfrmWTMain.FormActivate(Sender: TObject);
var
  LoginFormOK                 : ByteBool;
  UserName                                    : string;
  TempLogin, TempComputer                     : array[0..255] of Char;
  TempLoginSize, TempComputerSize             : DWORD;
begin
  bEndUSer := false;
  MaxUsers := 100;
{$IFDEF FREE}
  MaxUsers := 2 ;
{$ENDIF}
{$IFDEF GMS}
  MaxUsers := 6 ;
{$ENDIF}
{$IFDEF GRANTECH}
  MaxUsers := 6 ;
{$ENDIF}
{$IFDEF MEGAMARBLE}
  MaxUsers := 3 ;
{$ENDIF}
{$IFDEF AKTIV}
  MaxUsers := 4 ;
{$ENDIF}
{$IFDEF BELLAGIO}
  MaxUsers := 22 ;
{$ENDIF}
{$IFDEF ROANN}
  MaxUsers := 20 ;
{$ENDIF}
{$IFDEF RUBY}
  MaxUsers := 1 ;
{$ENDIF}
{$IFDEF ELITE}
  MaxUsers := 6 ;
{$ENDIF}
{$IFDEF ROMANY}
  MaxUsers := 7 ;
{$ENDIF}
{$IFDEF ENDUSER}
  MaxUsers := 10 ;
//  bEndUSer := true;
{$ENDIF}
{$IFDEF BATTAGLIA}
  MaxUsers := 2 ;
{$ENDIF}
  if not FActivated then
    begin
{$IFDEF DEMO}
      mnuDemoActivate.OnClick := mnuDemoActivateClick;
      DataBaseDescr := 'Login To Demo DataBase';
      frmWTMain.Caption := frmWTMain.Caption + ' - Demonstration system';
      DemoCheck(False);
      Operator := 1 {Demo operator};
      OperatorName := 'Demo Operator';
      begin  { needed for ENDIF below }
{$ELSE}
{$IFDEF ENDUSER}
      mnuDemoActivate.OnClick := mnuEndUserActivateClick;
      EndUSerCheck(False);
{$ENDIF}
      frmWTLogin := TfrmWTLogin.Create(Self);
      try
        frmWTLogin.UserEdit.Text := stsbrStatus.Panels[0].Text;
        frmWTLogin.ShowModal;
        LoginFormOK := frmWTLogin.OK;
        if LoginFormOK then
        begin
//          frmWTLogin.UserEdit.Text := stsbrStatus.Panels[0].Text;
          UserName := frmWTLogin.UserEdit.Text;
          Operator := frmWTLogin.Operator;
          OperatorName := frmWTLogin.Operator_name;
          OperatorEmail := frmWTLogin.Operator_Email;
          OperatorRevenueCentre := frmWTLogin.Operator_Revenue_Centre;
//          DataBaseDescr := frmWTLogin.Caption;
          DataBaseDescr := frmWTLogin.cmbAliasList.text;
          FaxSystem := frmWTLogin.sFaxSystem ;

          bEndUSer := frmWTLogin.EndUser;

(*          TempComputerSize := SizeOf(TempComputer);
          GetComputerName(Addr(TempComputer), TempComputerSize);
          ComputerName := TempComputer;
*)
          ComputerName := GetComputerNetName;

(*          if Pos('Live', DataBaseDescr) <> 0 then
            frmWTMain.Caption := frmWTMain.Caption + ' - Live Database'
          else
            frmWTMain.Caption := frmWTMain.Caption + ' - Test Database';
*)
          frmWTMain.WindowState := wsMaximized;
          if RunDBUpdate then
            UpdateDatabase;
        end;
      finally
        if RunDBUpdate then
          UpdateDatabase;
        frmWTLogin.Free;
      end;
      if not LoginFormOK then
        Application.Terminate
      else
        begin
          Factivated := true;
{$ENDIF}

          frmAllImages.LoadReportLogo(Self);

          with dtmdlWorktops.qryDeleteWorkStations do
            begin
              Close;
              ParamByName('WorkStation_Name').AsString := ComputerName;
              ParamByName('Status_Descr').AsString := UserName;
              ExecSQL;
            end;

          {Try to get a valid workstation slot for this workstation};
          WorkStation := 0;
          {Try to find an empty workstation slot};
          with dtmdlWorktops.qryGetWorkStation do
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

          with dtmdlWorktops.qryAddWorkStation do
            begin
            {Vacant slot found, add details for this workstation };
              Close;
              ParamByName('WorkStation').AsString := IntToStr(WorkStation);
              ParamByName('WorkStation_Name').AsString := ComputerName;
              ParamByName('Status_Descr').AsString := UserName;
              ParamByName('Software_Version').AsString := SWVersion + '/' + SWSubVersion;
              ParamByName('Logged_in').Asdatetime := now;
              ExecSQL;
            end;

(*          {Get user and password from login screen}
          TempLoginSize := SizeOf(TempLogin);
          GetUserName(Addr(TempLogin), TempLoginSize);
          stsbrStatus.Panels[0].Text := TempLogin;


          if (Username = 'firebelly') or (Username = 'bsadmin') then
            mnuManageLogins.Visible := true
          else
            begin
              mnuManageLogins.Visible := false;
            end;
*)
          UserName := GetUserFromWindows;
          stsbrStatus.Panels[0].Text := UserName;

          {Check if using Contracts}
          CheckContractQuoting;

          {Check if using Purchase Ordering}
          CheckPurchaseOrdering;

          {Check if using Purchase Ordering}
          CheckRevenueCentres;

          {Check if using Purchase Ordering}
          CheckScheduling;

          GetCompanyDetails;
          GetEmailDetails;
          if bEndUser then
            begin
              LicenceCheck;
              DisableModules ;
            end;

          DisplayModuleButtons;

          if not FDemoExpired then
            btnCustomersClick(self);
        end;
    end;
end;

procedure TfrmWTMain.PseudoFormActivate;
var
  UserName                                    : string;
  LoginFormOK                 : ByteBool;
  TempLogin                   : array[0..255] of Char;
  TempLoginSize               : DWORD;
begin
  MaxUsers := 100;
{$IFDEF FREE}
  MaxUsers := 2 ;
{$ENDIF}
{$IFDEF GMS}
  MaxUsers := 6 ;
{$ENDIF}
{$IFDEF GRANTECH}
  MaxUsers := 6 ;
{$ENDIF}
{$IFDEF MEGAMARBLE}
  MaxUsers := 3 ;
{$ENDIF}
{$IFDEF AKTIV}
  MaxUsers := 4 ;
{$ENDIF}
{$IFDEF BELLAGIO}
  MaxUsers := 22 ;
{$ENDIF}
{$IFDEF ROANN}
  MaxUsers := 20 ;
{$ENDIF}
{$IFDEF RUBY}
  MaxUsers := 1 ;
{$ENDIF}
{$IFDEF ELITE}
  MaxUsers := 6 ;
{$ENDIF}
{$IFDEF ROMANY}
  MaxUsers := 7 ;
{$ENDIF}
{$IFDEF ENDUSER}
  MaxUsers := 10 ;
//  bEndUSer := true;
{$ENDIF}
{$IFDEF BATTAGLIA}
  MaxUsers := 2 ;
{$ENDIF}
{$IFDEF DEMO}
      mnuDemoActivate.OnClick := mnuDemoActivateClick;
      DataBaseDescr := 'Login To Demo DataBase';
      frmWTMain.Caption := frmWTMain.Caption + ' - Demonstration system';
      DemoCheck(False);
      Operator := 1 {Demo operator};
      OperatorName := 'Demo Operator';
      begin  { needed for ENDIF below }
{$ELSE}
{$IFDEF ENDUSER}
      mnuDemoActivate.OnClick := mnuEndUserActivateClick;
      EndUSerCheck(False);
{$ENDIF}
      frmWTLogin := TfrmWTLogin.Create(Self);
      try
        frmWTLogin.UserEdit.Text := stsbrStatus.Panels[0].Text;
        frmWTLogin.ShowModal;
        LoginFormOK := frmWTLogin.OK;
        if LoginFormOK then
        begin
//          frmWTLogin.UserEdit.Text := stsbrStatus.Panels[0].Text;
          UserName := frmWTLogin.UserEdit.Text;
          Operator := frmWTLogin.Operator;
          OperatorName := frmWTLogin.Operator_name;
//          DataBaseDescr := frmWTLogin.Caption;
          DataBaseDescr := frmWTLogin.cmbAliasList.text;
          FaxSystem := frmWTLogin.sFaxSystem ;
          bEndUSer := frmWTLogin.EndUser;

(*          TempComputerSize := SizeOf(TempComputer);
          GetComputerName(Addr(TempComputer), TempComputerSize);
          ComputerName := TempComputer;
*)
          ComputerName := GetUserFromWindows;

(*          if Pos('Live', DataBaseDescr) <> 0 then
            frmWTMain.Caption := frmWTMain.Caption + ' - Live Database'
          else
            frmWTMain.Caption := frmWTMain.Caption + ' - Test Database';
*)
          frmWTMain.WindowState := wsMaximized;

          if RunDBUpdate then
            UpdateDatabase;
        end;
      finally
        if RunDBUpdate then
          UpdateDatabase;
        frmWTLogin.Free;
      end;
      if not LoginFormOK then
        Application.Terminate
      else
        begin
          Factivated := true;
{$ENDIF}

          with dtmdlWorktops.qryDeleteWorkStations do
            begin
              Close;
              ParamByName('WorkStation_Name').AsString := ComputerName;
              ExecSQL;
            end;

          {Try to get a valid workstation slot for this workstation};
          WorkStation := 0;
          {Try to find an empty workstation slot};
          with dtmdlWorktops.qryGetWorkStation do
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

          with dtmdlWorktops.qryAddWorkStation do
            begin
            {Vacant slot found, add details for this workstation };
              Close;
              ParamByName('WorkStation').AsString := IntToStr(WorkStation);
              ParamByName('WorkStation_Name').AsString := ComputerName;
              ParamByName('Status_Descr').AsString := UserName;
              ParamByName('Software_Version').AsString := SWVersion + '/' + SWSubVersion;
              ExecSQL;
            end;

          {Get user and password from login screen}
(*          TempLoginSize := SizeOf(TempLogin);
          GetUserName(Addr(TempLogin), TempLoginSize);
          stsbrStatus.Panels[0].Text := TempLogin;

          if (Username = 'firebelly') or (Username = 'bsadmin') then
            mnuManageLogins.Visible := true
          else
            begin
              mnuManageLogins.Visible := false;
            end;
*)
          UserName := GetUserFromWindows;
          stsbrStatus.Panels[0].Text := UserName;

          GetCompanyDetails;
          GetEmailDetails;
          if bEndUser then
            begin
              LicenceCheck;
              DisableModules ;
            end;

          DisplayModuleButtons;

          if not FDemoExpired then
            btnCustomersClick(self);
        end;
end;

function TfrmWTMain.RunDBUpdate: boolean;
begin
  result := false;
  try
    with dtmdlWorktops.qryCompany do
      begin
        close;
        open;
        first;
        DBVersion := fieldbyname('Database_Version').asstring;
      end;
  except
    DBVersion := '';
  end;

  {If database version different app version then run update}
  if (SWVersion <> DBVersion) then
    Result := true;
end;

procedure TfrmWTMain.DisableModules;
begin
  btnSales.visible := false;
  btnContracts.Visible := false;
//  btnJobs.visible := false;
  btnSuppliers.visible := false;
  btnPurchasing.visible := false;
  btnStock.visible := false;
  btnSalesInvoices.visible := false;
  btnPrices.Visible := false;
  mnuMaterialTypes.Visible := false;
  mnuFeatures.Visible := false;
  mnuDiscounts.Visible := false;
  mnuInstallationAreas.Visible := false;
  mnuPriceChanges.Visible := false;
  mnuthicknesses.Visible := false;
  mnuWorktops.Visible := false;
  mnuEdgeDetails.visible := false;
  mnuCutOut.Visible := false;
  mnuOtherCharges.visible := false;
  mnuCutOut.Visible := false;
  mnuStockSettings.visible := false;
  mnuPriceChanges.visible := false;
  mnuSalesLeadsources.Visible := false;
  mnuReports.visible := false;
  mnuDataSources.Visible := false;
  mnuOperators.Visible := false;
end;

procedure TfrmWTMain.DisplayModuleButtons;
begin
  mnuSales.Visible := btnSales.visible;
  mnuContracts.Visible := btnContracts.visible;
  mnuSuppliers.Visible := btnSuppliers.visible;
  mnuJobs.Visible := btnJobs.visible;
  mnuStock.Visible := btnStock.visible;
  mnuSalesInvoices.Visible := btnSalesInvoices.visible;
  mnuSalesCredits.Visible := btnSalesInvoices.visible;
  mnuPrices.Visible := btnPrices.visible;
  mnuTradeDetails.Visible := dtmdlWorktops.UseTradeDetails;
end;

procedure TfrmWTMain.GetCompanyDetails;
begin
  with dtmdlWorktops.qryCompany do
    begin
      close;
      open;
      frmWTMain.caption := 'Firebelly' + ' - ' + fieldbyname('Company_Name').asstring+ ' - ' + self.DataBaseDescr + ' database';
    end;
end;

procedure TfrmWTMain.GetEmailDetails;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(frmWTMain.AppIniFile);

  with IniFile do
    begin
      EmailApplication := ReadString('Email', 'Application', 'None');
      EmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
//      EmailAccount := ReadString('Email', pchar(dtmdlWorktops.dtbsWorktops.AliasName + ' Email Account'), 'None');
      EmailAccount := ReadString('Email', dtmdlWorktops.dtbsWorktops.AliasName + ' Email Account', 'None');
      Free;
    end;
end;

procedure TfrmWTMain.UpdateDatabase;
var
  dtmdlUpdateDB : TdtmdlUpdateDB;
begin
  dtmdlUpdateDB := TdtmdlUpdateDB.Create(Self);
(*  if Pos('Live', DataBaseDescr) <> 0 then
    dtmdlUpdateDB.isLiveDB := true
  else
    dtmdlUpdateDB.isLiveDB := false;
*)
  dtmdlUpdateDB.DBName := DataBaseDescr;
  try
    dtmdlUpdateDB.UpdateDatabase;
  finally
    dtmdlUpdateDB.Free;
  end;
end;

procedure TfrmWTMain.btnSalesClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUSales then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUSales := TfrmWTLUSales.Create( Application );
    frmWTLUSales.WindowState := wsMaximized;
  finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.btnJobsClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUJobs then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUJobs := TfrmWTLUJobs.Create( Application );
    frmWTLUJobs.WindowState := wsMaximized;
  finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuCheckPricesClick(Sender: TObject);
begin
  frmWtUtilities := TfrmWtUtilities.create(application);
  try
    frmWtUtilities.showmodal;
  finally
    frmWtUtilities.free;
  end;

end;

procedure TfrmWTMain.mnuScriptsClick(Sender: TObject);
begin
  frmWTRunScripts := TfrmWTRunScripts.create(application);
  try
    frmWTRunScripts.showmodal;
  finally
    frmWTRunScripts.free;
  end;
end;

procedure TfrmWTMain.mnuManageAppointmentLocksClick(Sender: TObject);
begin
  frmWTMaintAppointmentLock := TfrmWTMaintAppointmentLock.Create(Self);
  try
    frmWTMaintAppointmentLock.ShowModal;
  finally
    frmWTMaintAppointmentLock.Free;
  end;
end;

procedure TfrmWTMain.mnuManageLoginsClick(Sender: TObject);
begin
  frmWTMaintLogins := TfrmWTMaintLogins.Create(Self);
  try
    frmWTMaintLogins.ShowModal;
  finally
    frmWTMaintLogins.Free;
  end;
end;

procedure TfrmWTMain.ResetClientSettings1Click(Sender: TObject);
var
  IniFile : TIniFile;
  iCount: integer;
begin
  if messagedlg('Reset your Firebelly screen settings?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    IniFile := TIniFile.Create('myWorktops.ini');

    try
      IniFile.EraseSection('FormPositions');
    finally
      IniFile.Free;
    end;

    MessageDlg('Your screen settings have been reset.', mtInformation, [mbOk], 0);
  end;
end;

procedure TfrmWTMain.SetOperatorEmail(const Value: string);
begin
  FOperatorEmail := Value;
end;

procedure TfrmWTMain.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TfrmWTMain.SetDataBaseDescr(const Value: string);
begin
  FDataBaseDescr := Value;
end;

procedure TfrmWTMain.SetFaxSystem(const Value: string);
begin
  FFaxSystem := Value;
end;

procedure TfrmWTMain.SetComputerName(const Value: string);
begin
  FComputerName := Value;
end;

procedure TfrmWTMain.mnuOperatorsClick(Sender: TObject);
begin
{$IFDEF DEMO}
  MessageDlg('This option is not available in the demonstration version',
      mtError, [mbOK], 0);
    Exit;
{$ENDIF}
  frmWtLUOperators := TfrmWtLUOperators.create(application);
  try
    frmWtLUOperators.showmodal;
  finally
    frmWtLUOperators.free;
  end;
end;

procedure TfrmWTMain.SetSWSubVersion(const Value: string);
begin
  FSWSubVersion := Value;
end;

procedure TfrmWTMain.SetSWVersion(const Value: string);
begin
  FSWVersion := Value;
end;

procedure TfrmWTMain.SetDBVersion(const Value: string);
begin
  FDBVersion := Value;
end;

procedure TfrmWTMain.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure TfrmWTMain.WorktopPrices1Click(Sender: TObject);
begin
  frmWtLUWorktopDetails := TfrmWtLUWorktopDetails.create(application);
  try
    frmWtLUWorktopDetails.showmodal;
  finally
    frmWtLUWorktopDetails.free;
  end;
end;

procedure TfrmWTMain.OldWorktopPrices1Click(Sender: TObject);
begin
  frmWtLUWorktops := TfrmWtLUWorktops.create(application);
  try
    frmWtLUWorktops.showmodal;
  finally
    frmWtLUWorktops.free;
  end;
end;

procedure TfrmWTMain.PriceGroups1Click(Sender: TObject);
begin
  frmWtLUWTGroup := TfrmWtLUWTGroup.create(application);
  try
    frmWtLUWTGroup.showmodal;
  finally
    frmWtLUWTGroup.free;
  end;
end;

procedure TfrmWTMain.WorktopGroupPrices1Click(Sender: TObject);
begin
  frmWtLUWTGroupPrices := TfrmWtLUWTGroupPrices.create(application);
  try
    frmWtLUWTGroupPrices.showmodal;
  finally
    frmWtLUWTGroupPrices.free;
  end;
end;

procedure TfrmWTMain.ypes1Click(Sender: TObject);
begin
  frmWTLUEdgeTypes := TfrmWTLUEdgeTypes.create(application);
  try
    frmWTLUEdgeTypes.showmodal;
  finally
    frmWTLUEdgeTypes.free;
  end;
end;

procedure TfrmWTMain.mnuFaxManagerClick(Sender: TObject);
Var
  FiName, DiName: Array [0..255] of char ;
  LocalDir, LocalDrive: String;
Const
  RunTimeDirectory = '\Program Files\QuayStone\myWorktops';
begin
{$IFDEF DEMO}
  MessageDlg('This option is not available in the demonstration version',
      mtError, [mbOK], 0);
    Exit;
{$ENDIF}
	{Setup the directories}

  if (FindWindow('TfrmAllFaxStatus', 'Maintain Faxes') <> 0) then
  begin
    MessageDlg('The Fax Manager is already running', mtError,
      [mbAbort], 0);
    exit;
  end;

  LocalDrive := copy(GetWinSysDir,1,2);
	LocalDir := LocalDrive + RunTimeDirectory;
//	LocalDir := LocalDrive + '\Sources\Worktops7';

//	StrPCopy(FiName, LocalDir + '\allFax.exe') ;
	StrPCopy(FiName, '.\allFax.exe') ;
//	StrPCopy(DiName ,LocalDir) ;
	StrPCopy(DiName ,'.\') ;
//	ShellExecute(0,nil,FiName,'', DiName, sw_Restore) ;
	ShellExecute(0,nil,FiName,'', DiName, sw_Restore) ;
end;

procedure TfrmWTMain.mnuClientSettingsClick(Sender: TObject);
begin
  frmWTMaintClient := TfrmWTMaintClient.Create(Self);
  try
    frmWTMaintClient.ShowModal;
  finally
    frmWTMaintClient.Free;
  end;
end;

procedure TfrmWTMain.btnContractsClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUContracts then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUContracts := TfrmWTLUContracts.Create( Application );
    frmWTLUContracts.WindowState := wsMaximized;
  finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.btnFittingClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUFitting then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUFitting := TfrmWTLUFitting.Create( Application );
    frmWTLUFitting.WindowState := wsMaximized;
  finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.btnTemplatingClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUTemplating then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUTemplating := TfrmWTLUTemplating.Create( Application );
    frmWTLUTemplating.WindowState := wsMaximized;
  finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.btnPricesClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUPrices then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUPrices := TfrmWTLUPrices.Create( Application );
    frmWTLUPrices.WindowState := wsMaximized;
  finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.btnStockClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUStock then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUStock := TfrmWTLUStock.Create( Application );
    frmWTLUStock.WindowState := wsMaximized;
 finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuRepsClick(Sender: TObject);
begin
  frmWtLUReps := TfrmWtLUReps.create(application);
  try
    frmWtLUReps.showmodal;
  finally
    frmWtLUReps.free;
  end;

end;

procedure TfrmWTMain.ProductGroups1Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUProductGroups := TfrmWTLUProductGroups.Create( Application );
  try
    frmWTLUProductGroups.showmodal;
  finally
    frmWTLUProductGroups.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.Products1Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUProducts := TfrmWTLUProducts.Create( Application );
  try
    frmWTLUProducts.showmodal;
  finally
    frmWTLUProducts.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.btnSalesInvoicingClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUSalesInvoices then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUSalesInvoices := TfrmWTLUSalesInvoices.Create( Application );
    frmWTLUSalesInvoices.WindowState := wsMaximized;
 finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.btnSalesCreditsClick(Sender: TObject);
var
  OldCursor : TCursor;
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i] is TfrmWTLUSalesCredits then
    begin
      MDIChildren[i].Show;
      Exit;
    end; // if
  end; // for
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUSalesCredits := TfrmWTLUSalesCredits.Create( Application );
    frmWTLUSalesCredits.WindowState := wsMaximized;
 finally
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuCustomersClick(Sender: TObject);
begin
  btnCustomersClick(self);
end;

procedure TfrmWTMain.mnuSuppliersClick(Sender: TObject);
begin
  btnSuppliersClick(self);
end;

procedure TfrmWTMain.mnuQuotesClick(Sender: TObject);
begin
  btnQuotesClick(self);
end;

procedure TfrmWTMain.mnuJobsClick(Sender: TObject);
begin
  btnJobsClick(self);
end;

procedure TfrmWTMain.mnuSalesClick(Sender: TObject);
begin
  btnSalesClick(self);
end;

procedure TfrmWTMain.mnuSalesInvoicesClick(Sender: TObject);
begin
  btnSalesInvoicingClick(self);
end;

procedure TfrmWTMain.mnuSalesCreditsClick(Sender: TObject);
begin
  mnuSalesCreditsClick(self);
end;

procedure TfrmWTMain.mnuPricesClick(Sender: TObject);
begin
  mnuPricesClick(self);
end;

procedure TfrmWTMain.mnuFittersClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUFitters := TfrmWTLUFitters.Create( Application );
  try
    frmWTLUFitters.showmodal;
  finally
    frmWTLUFitters.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuSalesLeadSourcesClick(Sender: TObject);
begin
  frmWtLUSalesLead := TfrmWtLUSalesLead.create(application);
  try
    frmWtLUSalesLead.showmodal;
  finally
    frmWtLUSalesLead.free;
  end;

end;

procedure TfrmWTMain.mnuDesignersClick(Sender: TObject);
begin
  frmWTLUDesigner := TfrmWTLUDesigner.create(application);
  try
    frmWTLUDesigner.showmodal;
  finally
    frmWTLUDesigner.free;
  end;

end;

procedure TfrmWTMain.mnuContactTypesClick(Sender: TObject);
begin
  frmWTLUContactType := TfrmWTLUContactType.create(application);
  try
    frmWTLUContactType.showmodal;
  finally
    frmWTLUContactType.free;
  end;

end;

procedure TfrmWTMain.mnuDataSourcesClick(Sender: TObject);
begin
  frmWtLUDataSource := TfrmWtLUDataSource.create(application);
  try
    frmWtLUDataSource.showmodal;
  finally
    frmWtLUDataSource.free;
  end;

end;

procedure TfrmWTMain.mnuProspectActionsClick(Sender: TObject);
begin
  frmWtLUProspectAction := TfrmWtLUProspectAction.create(application);
  try
    frmWtLUProspectAction.showmodal;
  finally
    frmWtLUProspectAction.free;
  end;

end;

procedure TfrmWTMain.mnuImportExportClick(Sender: TObject);
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

  frmWTAccExport1 := TfrmWTAccExport1.create(self);
  try
    frmWTAccExport1.showmodal;
  finally
    frmWTAccExport1.free;
  end;
end;

procedure TfrmWTMain.Excel1Click(Sender: TObject);
var
  tmpForm: TForm;
begin
  tmpForm := ActiveMDIChild;
  ExportToExcel(tmpForm);
end;

procedure TfrmWTMain.ExportToExcel(tmpForm: TForm);
var
  icount: integer;
  tmpGrid: TDBGrid;
begin
  for icount := 0 to pred(tmpForm.ComponentCount) do
    begin
      if tmpForm.Components[icount] is TDBGrid then
        begin
          tmpGrid := (tmpForm.Components[icount] as TDBGrid);

          frmWTSendtoExcel := TfrmWTSendtoExcel.create(self);
          try
            frmWTSendtoExcel.ExportDBGrid := tmpGrid;
            frmWTSendtoExcel.ExportFormCaption := tmpForm.caption;
            frmWTSendtoExcel.show;
          finally
            frmWTSendtoExcel.free;
          end;
          exit;
        end;
    end;
end;

procedure TfrmWTMain.mnuLicenceActivationClick(Sender: TObject);
begin
  {$IFDEF ENDUSER}
  exit;
  {$ENDIF}
  frmWTExpiryDate := TfrmWTExpiryDate.create(self);

  try
    frmWTExpiryDate.showmodal;
  finally
    frmWTExpiryDate.free;
  end;
end;

procedure TfrmWTMain.ExportTableToExcel(tmpForm: TForm);
var
  icount: integer;
  tmpGrid: TDBGrid;
begin
  for icount := 0 to pred(tmpForm.ComponentCount) do
    begin
      if tmpForm.Components[icount] is TDBGrid then
        begin
          tmpGrid := (tmpForm.Components[icount] as TDBGrid);

          frmWTSendtoExcel := TfrmWTSendtoExcel.create(self);
          try
            frmWTSendtoExcel.ExportType := 'T';
            frmWTSendtoExcel.ExportDBGrid := tmpGrid;
            frmWTSendtoExcel.ExportFormCaption := tmpForm.caption;
            frmWTSendtoExcel.show;
          finally
            frmWTSendtoExcel.free;
          end;
          exit;
        end;
    end;
end;

procedure TfrmWTMain.SwitchUser1Click(Sender: TObject);
var
  i: integer;
begin
  if MessageDlg('Close the application and switch to a different user?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      for i := pred(MDIChildCount) downto 0 do
        begin
          MDIChildren[i].free;
        end;

      with dtmdlWorktops.qryDeleteWorkStation do
        begin
          Close;
          ParamByName('WorkStation').AsString := IntToStr(WorkStation);
          ExecSQL;
        end;
      dtmdlWorktops.dtbsWorktops.Close;
      PseudoFormActivate;
    end;
end;

procedure TfrmWTMain.mnuContractsClick(Sender: TObject);
begin
  btnContractsClick(self);
end;

procedure TfrmWTMain.ManagementReports1Click(Sender: TObject);
begin
  frmWTLUManagementRpts := TfrmWTLUManagementRpts.create(self);
  try
    frmWTLUManagementRpts.showmodal;
  finally
    frmWTLUManagementRpts.free;
  end;
end;

procedure TfrmWTMain.ClientSettings1Click(Sender: TObject);
begin
  frmWTMaintClient := TfrmWTMaintClient.Create(Self);
  try
    frmWTMaintClient.ShowModal;
  finally
    frmWTMaintClient.Free;
    // Go and get the email details for this user and this database
    GetEmailDetails;
  end;
end;

procedure TfrmWTMain.mnuTradeDetailsClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtMaintTrade := TfrmWtMaintTrade.create(application);
  try
    frmWtMaintTrade.showmodal;
  finally
    frmWtMaintTrade.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.CheckContractQuoting;
begin
  btnContracts.visible := dtmdlWorktops.UseContractQuoting;
end;

procedure TfrmWTMain.CheckPurchaseOrdering;
begin
  btnPurchasing.visible := dtmdlWorktops.UsePurchaseOrdering;
end;

procedure TfrmWTMain.CheckRevenueCentres;
begin
  mnuRevenueCentres.visible := dtmdlWorktops.UseRevenueCentres;
end;

procedure TfrmWTMain.CheckScheduling;
begin
  mnuScheduling.visible := dtmdlWorktops.SchedulingSystem <> '';
end;

procedure TfrmWTMain.Brands1Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUMatType := TfrmWTLUMatType.Create( Application );
  try
    frmWTLUMatType.showmodal;
  finally
    frmWTLUMatType.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.Types2Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUMaterialType := TfrmWTLUMaterialType.Create( Application );
  try
    frmWTLUMaterialType.showmodal;
  finally
    frmWTLUMaterialType.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.ColourGroups2Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUColourGroup := TfrmWTLUColourGroup.Create( Application );
  try
    frmWTLUColourGroup.showmodal;
  finally
    frmWTLUColourGroup.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.Finishes1Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUFinish := TfrmWTLUFinish.Create( Application );
  try
    frmWTLUFinish.showmodal;
  finally
    frmWTLUFinish.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.Textures1Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUTextureGroup := TfrmWTLUTextureGroup.Create( Application );
  try
    frmWTLUTextureGroup.showmodal;
  finally
    frmWTLUTextureGroup.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMain.mnuInstallationAreasClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmwtLUInstallArea := TfrmwtLUInstallArea.Create( Application );
  try
    frmwtLUInstallArea.showmodal;
  finally
    frmwtLUInstallArea.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

{$IFDEF DEMO}

procedure TfrmWTMain.DemoCheck(TempWarn: ByteBool);
var
  aSubKey, aKeyVal, aKeyType  : array[0..255] of Char;
  iKeyVal, iRet               : Longint;
  iKeyType                    : DWORD;
  sKeyVal, sDate              : string;
  icount, iExpires, iComp     : Integer;
  dDate                       : TDateTime;
  sRet                        : string;
begin
  try
    with dtmdlWorktops.qryCompany do
    begin
      Close;
      Open;
      First;
      iComp := FieldByName('Software_CheckSum').AsInteger;
    end;
  except
    frmWTLoginError := TfrmWTLoginError.Create(Self);
    frmWTLoginError.ShowModal;
    frmWTLoginError.Free;
    Application.Terminate;
    Exit;
  end;
  {Perform the database timeout checks on the demo version}
  aSubKey := 'QSDWT';
  iKeyVal := sizeof(aKeyVal);
  {Try to get the date from the rogistry entry}
(*  iRet := RegQueryValue(HKEY_LOCAL_MACHINE, Addr(aSubKey), Addr(aKeyVal),
    iKeyVal);
  {if there is no entry, write one using today's date}
  if ((iRet = 2) and (iComp = 0)) or (TempWarn) then
*)
  sRet :=  GetRegKey('\Software\Quaystone\myWorktops','QSDWT');
  if  ((sRet = '') and (iComp = 0)) or
      (TempWarn) then
  begin
(*    sDate := FloatToStr(Date);
    StrPCopy(aKeyval, sDate);
    iKeyVal := Length(sDate);
    RegSetValue(HKEY_LOCAL_MACHINE, Addr(aSubKey), REG_SZ, Addr(aKeyVal),
      iKeyVal);
    iRet := 0;
*)
    sDate := FloatToStr(Date);
    SetRegKey('\Software\Quaystone\myWorktops','QSDWT',sDate);
    sRet := sDate;
    with dtmdlWorktops.qryUpCompany do
    begin
      Close;
      ParamByName('Software_CheckSum').AsInteger := Trunc(Date);
      ExecSQL;
      iComp := Trunc(Date);
    end;
  end;

  if sRet <> '' then
  begin
    try
      dDate := strtofloat(sRet);
    except
      dDate := 0;
    end;
  end
  else
    dDate := 0;

  iExpires := Trunc(dDate - Date + 91);
  if (iExpires <= 0) or (iExpires > 91) or (dDate <> iComp) then
  begin
    MessageDlg('Firebelly Demonstration Version has expired. ' +
      'Please contact Quaystone Business Solutions on 0844 488 9206', mtError, [mbAbort], 0);
    Toolbar1.Enabled := false;
    Modules1.Enabled := false;
    mnuSettings.Enabled := false;;
    mnuStock.Enabled := false;
    Tools1.Enabled := false;
    FDemoExpired := true;
    Exit;
  end;
  if iExpires < 5 then
  begin
    MessageDlg('Firebelly Demonstration Version will expire in ' +
      IntToStr(iExpires) + ' days. ' +
      'Please contact Quaystone Business Solutions on 0844 488 9206', mtWarning, [mbOK], 0);
    Exit;
  end;
end;

procedure TfrmWTMain.mnuDemoActivateClick(Sender: TObject);
begin
  {Demo version only brings up a Licence Extension Box}
  frmWTLicence := TfrmWTLicence.Create(Self);
  try
    frmWTLicence.ShowModal;
    if frmWTLicence.bOK then
    begin
      DemoCheck(True);
      Toolbar1.Enabled := True;
      Modules1.Enabled := True;
      mnuSettings.Enabled := True;
      mnuStock.Enabled := True;
      Tools1.Enabled := True;
    end;
  finally
    frmWTLicence.Free;
  end;
end;
{$ENDIF}

{$IFDEF ENDUSER}

procedure TfrmWTMain.EndUserCheck(TempWarn: ByteBool);
var
  aSubKey, aKeyVal, aKeyType  : array[0..255] of Char;
  iKeyVal, iRet               : Longint;
  iKeyType                    : DWORD;
  sKeyVal, sDate              : string;
  icount, iExpires, iComp     : Integer;
  dDate                       : TDateTime;
  sRet                        : string;
begin
  exit;
  try
    with dtmdlWorktops.qryCompany do
    begin
      Close;
      Open;
      First;
      iComp := FieldByName('Software_CheckSum').AsInteger;
    end;
  except
    frmWTLoginError := TfrmWTLoginError.Create(Self);
    frmWTLoginError.ShowModal;
    frmWTLoginError.Free;
    Application.Terminate;
    Exit;
  end;
  {Perform the database timeout checks on the demo version}
  aSubKey := 'QSDWT';
  iKeyVal := sizeof(aKeyVal);
  {Try to get the date from the rogistry entry}
(*  iRet := RegQueryValue(HKEY_LOCAL_MACHINE, Addr(aSubKey), Addr(aKeyVal),
    iKeyVal);
  {if there is no entry, write one using today's date}
  if ((iRet = 2) and (iComp = 0)) or (TempWarn) then
*)
  sRet :=  GetRegKey('\Software\Quaystone\myWorktops','QSDWT');
  if  ((sRet = '') and (iComp = 0)) or
      (TempWarn) then
  begin
(*    sDate := FloatToStr(Date);
    StrPCopy(aKeyval, sDate);
    iKeyVal := Length(sDate);
    RegSetValue(HKEY_LOCAL_MACHINE, Addr(aSubKey), REG_SZ, Addr(aKeyVal),
      iKeyVal);
    iRet := 0;
*)
    sDate := FloatToStr(Date);
    SetRegKey('\Software\Quaystone\myWorktops','QSDWT',sDate);
    sRet := sDate;
    with dtmdlWorktops.qryUpCompany do
    begin
      Close;
      ParamByName('Software_CheckSum').AsInteger := Trunc(Date);
      ExecSQL;
      iComp := Trunc(Date);
    end;
  end;

  if sRet <> '' then
  begin
    try
      dDate := strtofloat(sRet);
    except
      dDate := 0;
    end;
  end
  else
    dDate := 0;

  iExpires := Trunc(dDate - Date + 91);
  if (iExpires <= 0) or (iExpires > 91) or (dDate <> iComp) then
  begin
    MessageDlg('Your Firebelly Retail Version has expired. ' +
      'Please contact Quaystone Business Solutions on 0844 488 9206', mtError, [mbAbort], 0);
    Toolbar1.Enabled := false;
    Modules1.Enabled := false;
    mnuSettings.Enabled := false;;
    mnuStock.Enabled := false;
    Tools1.Enabled := false;
    FDemoExpired := true;
    Exit;
  end;
  if iExpires < 5 then
  begin
    MessageDlg('Firebelly Demonstration Version will expire in ' +
      IntToStr(iExpires) + ' days. ' +
      'Please contact Quaystone Business Solutions on 0844 488 9206', mtWarning, [mbOK], 0);
    Exit;
  end;
end;

procedure TfrmWTMain.mnuEndUserActivateClick(Sender: TObject);
begin
  {Demo version only brings up a Licence Extension Box}
  frmWTLicence := TfrmWTLicence.Create(Self);
  try
    frmWTLicence.ShowModal;
    if frmWTLicence.bOK then
    begin
      EndUserCheck(True);
      Toolbar1.Enabled := True;
      Modules1.Enabled := True;
      mnuSettings.Enabled := True;
      mnuStock.Enabled := True;
      Tools1.Enabled := True;
    end;
  finally
    frmWTLicence.Free;
  end;
end;

{$ENDIF}

procedure TfrmWTMain.Help1Click(Sender: TObject);
begin
{$IFDEF DEMO}
  mnuDemoActivate.Visible := true;
  mnuLicenceActivation.Visible := false;
  exit;
{$ENDIF}

{$IFDEF ENDUSER}
  mnuDemoActivate.Visible := false;
  mnuLicenceActivation.Visible := false;
  exit;
{$ENDIF}

  mnuDemoActivate.Visible := false;
end;

end.
