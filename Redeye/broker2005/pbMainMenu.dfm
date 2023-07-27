object frmpbMainMenu: TfrmpbMainMenu
  Left = 121
  Top = 85
  Caption = 'Print Management Information System'
  ClientHeight = 721
  ClientWidth = 1482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnMain
  Position = poScreenCenter
  ShowHint = True
  WindowState = wsMaximized
  WindowMenu = Window1
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 1482
    Height = 45
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 41
        Width = 1476
      end>
    ExplicitWidth = 1478
    object ToolBar1: TToolBar
      Left = 11
      Top = 0
      Width = 1467
      Height = 41
      ButtonHeight = 36
      ButtonWidth = 56
      Caption = 'ToolBar1'
      DragMode = dmAutomatic
      Images = imglstMainMenu
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      Wrapable = False
      object btnActivities: TToolButton
        Left = 0
        Top = 0
        Hint = 'Activities'
        Caption = '&Activities'
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnActivitiesClick
      end
      object btnCustomers: TToolButton
        Left = 56
        Top = 0
        Hint = 'Customers'
        Caption = '&Customers'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCustomersClick
      end
      object btnEndUsers: TToolButton
        Left = 112
        Top = 0
        Caption = 'End Users'
        ImageIndex = 15
        OnClick = btnEndUsersClick
      end
      object btnProspects: TToolButton
        Left = 168
        Top = 0
        Hint = 'Prospect details'
        Caption = '&Prospects'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnProspectsClick
      end
      object btnSuppliers: TToolButton
        Left = 224
        Top = 0
        Hint = 'Supplier details'
        Caption = 'Su&ppliers'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSuppliersClick
      end
      object btnContracts: TToolButton
        Left = 280
        Top = 0
        Caption = 'Contracts'
        ImageIndex = 12
        Visible = False
        OnClick = btnContractsClick
      end
      object btnFormReferences: TToolButton
        Left = 336
        Top = 0
        Hint = 'Form References'
        Caption = '&Forms'
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = btnFormReferencesClick
      end
      object btnQuotes: TToolButton
        Left = 392
        Top = 0
        Hint = 'Quotes'
        Caption = '&Quotes'
        ImageIndex = 11
        ParentShowHint = False
        ShowHint = True
        OnClick = btnQuotesClick
      end
      object btnEnquiries: TToolButton
        Left = 448
        Top = 0
        Hint = 'Enquiries'
        Caption = '&Enquiries'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEnquiriesClick
      end
      object btnProduction: TToolButton
        Left = 504
        Top = 0
        Hint = 'Buy Print'
        Caption = '&Buy Print'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        OnClick = btnProductionClick
      end
      object btnJobs: TToolButton
        Left = 560
        Top = 0
        Hint = 'Job Bags'
        Caption = '&Job Bags'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnJobsClick
      end
      object btnWorksOrders: TToolButton
        Left = 616
        Top = 0
        Hint = 'Works Instructions'
        Caption = '&Works'
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnWorksOrdersClick
      end
      object btnNCA: TToolButton
        Left = 672
        Top = 0
        Hint = 'Non Conformance Advice'
        Caption = '&NCA'
        ImageIndex = 13
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnNCAClick
      end
      object btnCallOffs: TToolButton
        Left = 728
        Top = 0
        Hint = 'Stock Call Offs'
        Caption = 'Call &Offs'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnCallOffsClick
      end
      object btnPurchases: TToolButton
        Left = 784
        Top = 0
        Hint = 'Purchase Ordering'
        Caption = 'P&urchase'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnPurchasesClick
      end
      object btnStock: TToolButton
        Left = 840
        Top = 0
        Hint = 'Stock Control'
        Caption = 'S&tock'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnStockClick
      end
      object btnSalesInvoicing: TToolButton
        Left = 896
        Top = 0
        Hint = 'Sales Invoicing'
        Caption = '&Sales'
        DropdownMenu = pmnSalesInvoicing
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
      end
      object btnPurchaseInvoicing: TToolButton
        Left = 952
        Top = 0
        Hint = 'Purchase Invoicing'
        Caption = 'Purch Inv'
        DropdownMenu = pmnPurchaseInvoicing
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object stsbrMainMenu: TStatusBar
    Left = 0
    Top = 702
    Width = 1482
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 100
      end
      item
        Width = 150
      end
      item
        Width = 150
      end>
    ExplicitTop = 701
    ExplicitWidth = 1478
  end
  object mnMain: TMainMenu
    Left = 256
    Top = 128
    object File1: TMenuItem
      Caption = '&File'
      object New1: TMenuItem
        Caption = '&New'
      end
      object Open1: TMenuItem
        Caption = '&Open'
      end
      object Close1: TMenuItem
        Caption = '&Close'
      end
      object Backup1: TMenuItem
        Caption = '&Backup'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Import1: TMenuItem
        Caption = 'Import/Export ...'
        OnClick = Import1Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object miSendTo: TMenuItem
        Caption = '&Send to'
        object miExcel: TMenuItem
          Caption = 'Excel'
          OnClick = miExcelClick
        end
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miSwitchUser: TMenuItem
        Caption = 'Switch &User'
        OnClick = miSwitchUserClick
      end
      object miExit: TMenuItem
        Caption = 'E&xit'
        OnClick = miExitClick
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      GroupIndex = 10
      object Cut1: TMenuItem
        Caption = 'Cu&t'
        ShortCut = 16472
      end
      object Copy1: TMenuItem
        Caption = '&Copy'
        ShortCut = 16451
      end
      object Paste1: TMenuItem
        Caption = '&Paste'
        ShortCut = 16470
      end
    end
    object miModules: TMenuItem
      Caption = '&Modules'
      GroupIndex = 10
      object mnuActivities: TMenuItem
        Caption = '&Activities'
        Hint = 'Activities'
      end
      object mnuCustomers: TMenuItem
        Caption = '&Customers'
        Hint = 'Customers'
        OnClick = btnCustomersClick
      end
      object mnuEndUsers: TMenuItem
        Caption = 'End Users'
        Hint = 'End Users'
        OnClick = btnEndUsersClick
      end
      object mnuProspects: TMenuItem
        Caption = '&Prospects'
        Hint = 'Prospects'
        OnClick = btnProspectsClick
      end
      object mnuSuppliers: TMenuItem
        Caption = '&Suppliers'
        Hint = 'Suppliers'
        OnClick = btnSuppliersClick
      end
      object mnuContracts: TMenuItem
        Caption = 'C&ontracts'
        Hint = 'Contracts'
      end
      object mnuFormReferences: TMenuItem
        Caption = '&Form References'
        Hint = 'Form References'
        OnClick = btnFormReferencesClick
      end
      object mnuQuotes: TMenuItem
        Caption = '&Quotes'
        Hint = 'Quotes'
      end
      object mnuEnquiries: TMenuItem
        Caption = '&Enquiries'
        Hint = 'Enquiries'
        OnClick = mnuEnquiriesClick
      end
      object mnuProduction: TMenuItem
        Caption = '&Buy Print'
        Hint = 'Buy Print'
        OnClick = mnuProductionClick
      end
      object mnuJobs: TMenuItem
        Caption = '&Job Bags'
        Hint = 'Job Bags'
        OnClick = btnJobsClick
      end
      object mnuWorksOrders: TMenuItem
        Caption = '&Works Instructions'
        Hint = 'Works Instructions'
        OnClick = btnWorksOrdersClick
      end
      object mnuNCA: TMenuItem
        Caption = '&Non Conformance'
        Hint = 'Non Conformance'
        OnClick = btnNCAClick
      end
      object mnuCallOffs: TMenuItem
        Caption = 'Stock Call &Offs'
        Hint = 'Stock Call Offs'
        OnClick = btnCallOffsClick
      end
      object mnuPurchases: TMenuItem
        Caption = 'P&urchases'
        Hint = 'Purchases'
        OnClick = btnPurchasesClick
      end
      object mnuStock: TMenuItem
        Caption = '&Stock'
        Hint = 'Stock System'
        OnClick = btnStockClick
      end
      object mnuSalesInvoicing: TMenuItem
        Caption = 'Sales &Invoices'
        Hint = 'Sales Invoicing'
        OnClick = mnuSalesInvoicingClick
      end
      object mnuPurchaseInvoicing: TMenuItem
        Caption = 'Purchase Invoices'
        Hint = 'Purchase Invoicing'
        OnClick = mnuPurchaseInvoicingClick
      end
    end
    object miSettings: TMenuItem
      Caption = '&Settings'
      GroupIndex = 10
      object mnuCompanyPrefs: TMenuItem
        Caption = 'Company Preferences...'
        Hint = 'Company Preferences'
        OnClick = mnuCompanyPrefsClick
      end
      object mnuCompanyBranch: TMenuItem
        Caption = 'Company Delivery Locations ...'
        Hint = 'Company Delivery Locations'
        OnClick = mnuCompanyBranchClick
      end
      object mnuRevenueCentres: TMenuItem
        Caption = 'Revenue Centres ...'
        Hint = 'Revenue Centres'
        OnClick = mnuRevenueCentresClick
      end
      object mnuCategories: TMenuItem
        Caption = 'Categories ...'
        Hint = 'Categories'
        OnClick = mnuCategoriesClick
      end
      object mnuProductTypes: TMenuItem
        Caption = 'Product Types ...'
        Hint = 'Product Types'
        OnClick = mnuProductTypesClick
      end
      object mnuProductTypeUtils: TMenuItem
        Caption = 'Product Type Utilities'
        Hint = 'Product Type Utilities'
        object mnuQuestionCats: TMenuItem
          Caption = 'Questions ...'
          OnClick = mnuQuestionCatsClick
        end
        object mnuQuestions: TMenuItem
          Caption = 'Questions for Categories ...'
          OnClick = mnuQuestionsClick
        end
        object mnuProductTypeCats: TMenuItem
          Caption = 'Product Type Categories ...'
          OnClick = mnuProductTypeCatsClick
        end
        object mnuCapabilities: TMenuItem
          Caption = 'Capabilities ...'
          OnClick = mnuCapabilitiesClick
        end
        object mnuCapabilitiesCats: TMenuItem
          Caption = 'Capabilities for Categories ...'
          OnClick = mnuCapabilitiesCatsClick
        end
      end
      object mnuFSCClaim: TMenuItem
        Caption = 'FSC Material Claims ...'
        Hint = 'FSC Material Claims'
        OnClick = mnuFSCClaimClick
      end
      object mnuReps: TMenuItem
        Caption = 'Reps'
        Hint = 'Rep Maintenance'
        object mnuSalesReps: TMenuItem
          Caption = 'Maintain ...'
          OnClick = mnuSalesRepsClick
        end
        object mnuRepTeams: TMenuItem
          Caption = 'Rep Teams ...'
          OnClick = mnuRepTeamsClick
        end
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuJobTypes: TMenuItem
        Caption = 'Job Types...'
        Hint = 'Job Types'
        OnClick = mnuJobTypesClick
      end
      object mnuPackFormats: TMenuItem
        Caption = 'Pack Formats...'
        Hint = 'Pack Formats'
        OnClick = mnuPackFormatsClick
      end
      object mnuAdhoc: TMenuItem
        Caption = 'Ad-Hoc Addresses...'
        Hint = 'Ad-Hoc Addresses'
        OnClick = mnuAdhocClick
      end
      object mnuSpecialInst: TMenuItem
        Caption = 'Special Instructions...'
        Hint = 'Special Instructions'
        OnClick = mnuSpecialInstClick
      end
      object mnuAddCharges: TMenuItem
        Caption = 'Additional Charges...'
        Hint = 'Additional Charges'
        OnClick = mnuAddChargesClick
      end
      object mnuQuoteReasons: TMenuItem
        Caption = 'Quote Win/Loss Reasons ...'
        Hint = 'Quote Win/Loss Reasons'
        OnClick = mnuQuoteReasonsClick
      end
      object mnuReasons: TMenuItem
        Caption = 'Reason Codes ...'
        Hint = 'Reason Codes'
        OnClick = mnuReasonsClick
      end
      object mnuCouriers: TMenuItem
        Caption = 'Couriers ...'
        Hint = 'Couriers'
        OnClick = mnuCouriersClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuPaymentTerms: TMenuItem
        Caption = 'Payment Terms ...'
        Hint = 'Payment Terms'
        OnClick = mnuPaymentTermsClick
      end
      object mnuPriceUnits: TMenuItem
        Caption = 'Price Units...'
        Hint = 'Price Units'
        OnClick = mnuPriceUnitsClick
      end
      object mnuGeneralCats: TMenuItem
        Caption = 'General Categories...'
        Hint = 'General Categories'
        OnClick = mnuGeneralCatsClick
      end
      object mnuLevelofImportance: TMenuItem
        Caption = 'Level of Importance ...'
        Hint = 'Level of Importance'
        OnClick = mnuLevelOfImportanceClick
      end
      object mnuCountry: TMenuItem
        Caption = 'Countries ...'
        Hint = 'Countries'
        OnClick = mnuCountryClick
      end
      object mnuPaperSizes: TMenuItem
        Caption = 'Paper Sizes...'
        Hint = 'Paper Sizes'
        OnClick = mnuPaperSizesClick
      end
      object mnuPaperDetails: TMenuItem
        Caption = 'Paper Details...'
        Hint = 'Paper Details'
        OnClick = mnuPaperDetailsClick
      end
      object mnuPackageSizes: TMenuItem
        Caption = 'Package Sizes...'
        Hint = 'Package Sizes'
        OnClick = mnuPackageSizesClick
      end
      object mnuArtworkTypes: TMenuItem
        Caption = 'Artwork Types...'
        Hint = 'Artwork Types'
        OnClick = mnuArtworkTypesClick
      end
      object mnuProof: TMenuItem
        Caption = 'Proof Status ...'
        Hint = 'Proof Status'
        OnClick = mnuProofClick
      end
      object mnuVatRates: TMenuItem
        Caption = 'VAT Rates...'
        Hint = 'Vat Rates'
        OnClick = mnuVatRatesClick
      end
      object mnuCreditReasons: TMenuItem
        Caption = 'Credit Note Reasons...'
        Hint = 'Credit Note Reasons'
        OnClick = mnuCreditReasonsClick
      end
      object mnuActivityTypes: TMenuItem
        Caption = 'Activity Types ...'
        Hint = 'Activity Types'
        OnClick = mnuActivityTypesClick
      end
      object mnuNonConformance: TMenuItem
        Caption = 'Non Conformance'
        Hint = 'Non Conformance'
        object mnuNCReasons: TMenuItem
          Caption = 'Error Types'
          OnClick = mnuNCReasonsClick
        end
        object mnuNCCategory: TMenuItem
          Caption = 'Categories'
          OnClick = mnuNCCategoryClick
        end
        object mnuNCDepartments: TMenuItem
          Caption = 'Departments'
          OnClick = mnuNCDepartmentsClick
        end
        object Recipients1: TMenuItem
          Caption = 'Recipients'
          OnClick = Recipients1Click
        end
        object mnuQAOperators: TMenuItem
          Caption = 'Quality Assurance Users ...'
          OnClick = mnuQAOperatorsClick
        end
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuOperators: TMenuItem
        Caption = 'Operators...'
        Hint = 'Operators'
        OnClick = mnuOperatorsClick
      end
      object mnuAccountManagers: TMenuItem
        Caption = 'Account Managers'
        Hint = 'Account Managers'
        object mnuAccManMaintain: TMenuItem
          Caption = 'Maintain ...'
          OnClick = mnuAccManMaintainClick
        end
        object mnuAccountTeams: TMenuItem
          Caption = 'Account  Teams ...'
          OnClick = mnuAccountTeamsClick
        end
      end
      object mnuSystem: TMenuItem
        Caption = 'System'
        Hint = 'System'
        object mnuLastNumbers: TMenuItem
          Caption = 'Last Numbers...'
          OnClick = mnuLastNumbersClick
        end
        object mnuInterfaces: TMenuItem
          Caption = 'Interfaces...'
          OnClick = mnuInterfacesClick
        end
        object mnuAuditTrail: TMenuItem
          Caption = 'Audit Trail...'
          OnClick = mnuAuditTrailClick
        end
        object mnuViewAuditTrail: TMenuItem
          Caption = 'View Audit Trail ...'
          OnClick = mnuViewAuditTrailClick
        end
      end
    end
    object miStock: TMenuItem
      Caption = 'S&tock'
      GroupIndex = 10
      object mnuStockPrefs: TMenuItem
        Caption = 'Preferences ...'
        Hint = 'Stock Preferences'
        OnClick = mnuStockPrefsClick
      end
      object mnuStoreTypes: TMenuItem
        Caption = 'Store types ...'
        Hint = 'Store Types'
        OnClick = mnuStoreTypesClick
      end
      object mnuStores: TMenuItem
        Caption = 'Stores ...'
        Hint = 'Stores'
        OnClick = mnuStoresClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object mnuProductGroups: TMenuItem
        Caption = 'Product groups ...'
        Hint = 'Product Groups'
        OnClick = mnuProductGroupsClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuStocktake: TMenuItem
        Caption = 'Stocktake ...'
        Hint = 'Stocktake'
        OnClick = mnuStocktakeClick
      end
      object mnuUtilities: TMenuItem
        Caption = 'Utilities ...'
        Hint = 'Utilities'
        object StockManagement1: TMenuItem
          Caption = 'Stock Management'
          OnClick = StockManagement1Click
        end
        object ProductManagement1: TMenuItem
          Caption = 'Product Re-allocation'
          OnClick = ProductManagement1Click
        end
        object Barcodes1: TMenuItem
          Caption = 'Barcodes'
          OnClick = Barcodes1Click
        end
      end
    end
    object miManufacturing: TMenuItem
      Caption = '&Production'
      GroupIndex = 10
      object mnuWCOperators: TMenuItem
        Caption = 'Work Centre Operators ...'
        Hint = 'Work Centre Operators'
        OnClick = mnuWCOperatorsClick
      end
      object mnuWorkCentreGroups: TMenuItem
        Caption = 'Work Centre Groups ...'
        Hint = 'Work Centre Groups'
        OnClick = mnuWorkCentreGroupsClick
      end
      object mnuWorkCentres: TMenuItem
        Caption = 'Work Centres ...'
        Hint = 'Work Centres'
        OnClick = mnuWorkCentresClick
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object mnuProcessGroups: TMenuItem
        Caption = 'Departments ...'
        Hint = 'Departments'
        OnClick = mnuProcessGroupsClick
      end
      object mnuProcesses: TMenuItem
        Caption = 'Processes ...'
        Hint = 'Processes'
        OnClick = mnuProcessesClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuProductionLocations: TMenuItem
        Caption = 'Production Locations ...'
        Hint = 'Production Locations'
        OnClick = mnuProductionLocationsClick
      end
      object mnuProductionTypes: TMenuItem
        Caption = 'Production Types ...'
        Hint = 'Production Types'
        OnClick = mnuProductionTypesClick
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object mnuWorksOrderStatus: TMenuItem
        Caption = 'Works Instruction Status ...'
        Hint = 'Works Instruction Status'
        OnClick = mnuWorksOrderStatusClick
      end
    end
    object miTools: TMenuItem
      Caption = '&Tools'
      GroupIndex = 10
      object mnuClient: TMenuItem
        Caption = 'Client Options ...'
        Hint = 'Client Options'
        OnClick = mnuClientClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object mnuEmailManager: TMenuItem
        Caption = 'Email Manager ...'
        Hint = 'Email Manager'
        OnClick = mnuEmailManagerClick
      end
      object mnuPageDesigner: TMenuItem
        Caption = 'Page Designer ...'
        Hint = 'Page Designer'
        OnClick = mnuPageDesignerClick
      end
      object mnuDocumentLogos: TMenuItem
        Caption = 'Document Logos ...'
        Hint = 'Document Logos'
        OnClick = mnuDocumentLogosClick
      end
      object mnuManageLocks: TMenuItem
        Caption = 'Manage Locked Records ...'
        Hint = 'Manage Locked Records'
        OnClick = mnuManageLocksClick
      end
      object mnuManageLogins: TMenuItem
        Caption = 'Manage Current Logins ...'
        Hint = 'Manage Current Logins'
        OnClick = mnuManageLoginsClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object mnuDatabaseTools: TMenuItem
        Caption = 'Database Tools'
        Hint = 'Database Tools'
        object ManageAliases1: TMenuItem
          Caption = 'Manage Aliases ...'
          OnClick = ManageAliases1Click
        end
      end
    end
    object miManagement: TMenuItem
      Caption = '&Management'
      GroupIndex = 10
      object mnuFinancials: TMenuItem
        Caption = 'Create Financial years ...'
        Hint = 'Create Financial Years'
        OnClick = mnuFinancialsClick
      end
      object mnuSetCurrentPeriod: TMenuItem
        Caption = 'Set Current Period ...'
        Hint = 'Set Current Period'
        OnClick = mnuSetCurrentPeriodClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnuPeriodEnd: TMenuItem
        Caption = 'Run Period End ...'
        Hint = 'Run Period End'
        OnClick = mnuPeriodEndClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuDatabaseUp: TMenuItem
        Caption = 'Database &update'
        Hint = 'Database Update'
        Visible = False
      end
    end
    object miReports: TMenuItem
      Caption = '&Reports'
      GroupIndex = 10
      object mnuClientServicesRpts: TMenuItem
        Caption = 'Client Services ...'
        Hint = 'Client Services'
        OnClick = mnuClientServicesRptsClick
      end
      object mnuManagementRpts: TMenuItem
        Caption = 'Management Reports ...'
        Hint = 'Management Reports'
        OnClick = mnuManagementRptsClick
      end
      object mnuProfitReports: TMenuItem
        Caption = 'Profit Reports ...'
        Hint = 'Profit Reports'
        OnClick = mnuProfitReportsClick
      end
      object mnuRepRpts: TMenuItem
        Caption = 'Sales Rep Reports ...'
        Hint = 'Rep Reports'
        OnClick = mnuRepRptsClick
      end
      object mnuProductionRpts: TMenuItem
        Caption = 'Production Reports ...'
        Hint = 'Production Reports'
        OnClick = mnuProductionRptsClick
      end
    end
    object Window1: TMenuItem
      Caption = '&Window'
      GroupIndex = 10
      object ArrangeAll1: TMenuItem
        Action = WindowArrange1
      end
      object Cascade1: TMenuItem
        Action = WindowCascade1
      end
      object MinimizeAll1: TMenuItem
        Action = WindowMinimizeAll1
      end
      object TileHorizontally1: TMenuItem
        Action = WindowTileHorizontal1
      end
      object TileVertically1: TMenuItem
        Action = WindowTileVertical1
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      GroupIndex = 10
      object Contents1: TMenuItem
        Caption = '&Contents'
      end
      object SearchforHelpOn1: TMenuItem
        Caption = '&Search for Help On...'
      end
      object HowtoUseHelp1: TMenuItem
        Caption = '&Purchase Order Authorisation Levels ...'
        OnClick = HowtoUseHelp1Click
      end
      object mnuLicenceActivation: TMenuItem
        Caption = '&Licence Activation'
        OnClick = mnuLicenceActivationClick
      end
      object About1: TMenuItem
        Caption = '&About...'
        OnClick = About1Click
      end
    end
  end
  object imglstMainMenu: TImageList
    Left = 152
    Top = 160
    Bitmap = {
      494C010110001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF007F7F
      7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF0000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF000000000000000000FFFF00000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000FFFF0000000000000000FF00FFFFFF007F7F
      7F000000FF00FFFFFF007F7F7F000000FF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF0000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000FFFF000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF0000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF000000000000FFFFFF00FFFFFF007F7F
      7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF0000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF00000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF00000000
      000000FFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF0000000000000000FF00FFFFFF007F7F
      7F000000FF00FFFFFF007F7F7F000000FF00FFFFFF007F7F7F000000FF00FFFF
      FF007F7F7F000000FF00FFFFFF0000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF0000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF000000000000FFFFFF0000FF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000FFFF000000000000FFFFFF00FFFFFF007F7F
      7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF00000000000000000000000000FFFF0000FFFF
      000000000000FFFF0000BFBFBF0000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF00000000000000000000FFFF00FFFF
      FF0000FFFF00000000000000000000000000000000000000FF00FFFFFF007F7F
      7F000000FF00FFFFFF007F7F7F000000FF00FFFFFF007F7F7F000000FF00FFFF
      FF007F7F7F000000FF00FFFFFF00000000000000000000000000FFFF0000FFFF
      0000FFFF000000000000BFBFBF000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFF
      FF007F7F7F00FFFFFF00FFFFFF00000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F000000FF00FFFFFF007F7F7F000000FF00FFFF
      FF007F7F7F000000FF00FFFFFF00000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      000000000000FFFFFF00000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF00000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      000000000000000000007F7F7F000000000000000000000000007F7F7F000000
      000000000000000000007F7F7F00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000000000007F7F7F0000FFFF007F7F
      7F00000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000000000007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000007F7F7F007F7F7F0000FFFF0000FFFF0000FFFF007F7F7F007F7F
      7F000000000000FFFF0000FFFF0000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000007F7F7F0000FFFF007F7F
      7F00000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF000000000000000000000000007F7F7F00000000000000
      FF00000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000FF00000000000000FF000000FF0000000000FF00000000000000FF00
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF0000FFFF0000FFFF000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000007F7F7F007F7F7F00000000007F7F
      7F000000FF007F7F7F000000FF007F7F7F000000FF007F7F7F007F7F7F00FF00
      00007F7F7F007F7F7F007F7F7F007F7F7F000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000FF0000000000000000000000
      0000FF0000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000BFBFBF00FFFFFF000000
      0000FFFFFF00000000000000000000000000000000007F7F7F0000000000FF00
      0000000000000000000000000000FF000000000000000000FF00000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000000000FF00000000000000000000000000FF00000000000000
      FF00FF0000000000FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00000000007F7F
      7F00FF0000007F7F7F00FF0000007F7F7F007F7F7F007F7F7F000000FF007F7F
      7F007F7F7F00FF0000000000FF007F7F7F000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      000000000000FF0000000000000000000000000000000000000000000000FFFF
      FF007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000000000
      00007F7F7F0000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000007F7F7F007F7F7F00000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF000000FF000000FF000000FF00BFBF
      BF000000000000000000000000000000000000000000FFFFFF007F7F7F007F7F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F00FFFFFF000000000000000000BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000BFBFBF00BFBFBF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BFBFBF0000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000BFBFBF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF007F7F7F000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000BFBFBF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF000000000000000000000000000000000000000000FFFFFF007F7F7F000000
      00007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000000000000000000000000000000000000000000000007F7F7F00FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000BFBFBF000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF0000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000000000000000000000000000000000000000000000007F7F7F00FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000FF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000FF0000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000FF00000000000000000000000000000000000000
      000000000000000000007F7F7F0000FFFF007F7F7F0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000FFFF000000000000FFFF000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000FF000000FF000000
      FF00000000000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000FF000000FF000000
      FF0000000000000000007F7F7F0000FFFF007F7F7F0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF00000080000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00000000FF000000800000008000000080000000800000008000000080000000
      8000000080000000000000FFFF0000FFFF00000000007F7F7F00000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF00000080000000FF0000000000008080000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000FFFF000000
      00007F7F7F007F7F7F0000000000000000000000000000000000000000000080
      8000008080000080800000808000000000000000000000008000000080000000
      00000000FF00BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000080000000000000FFFF00000000007F7F7F0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000008080000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000000000FFFF000000
      00007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00000000000080
      800000FFFF000080800000FFFF00000000000000800000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000800000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000008080000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000FFFF000000
      00007F7F7F007F7F7F00000000000000000000000000000000000000000000FF
      FF000080800000FFFF0000808000000000000000800000000000000000000000
      0000000000000000FF00BFBFBF0000000000BFBFBF0000000000BFBFBF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000000000FFFF000000
      00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000FF
      FF0000FFFF000080800000FFFF00000000000000800000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      000000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000FFFF000000
      00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000FF
      FF0000FFFF0000FFFF00008080000000000000FFFF0000000000000080000000
      800000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000000000000000007F7F7F000000
      0000FFFFFF00000000007F7F7F00000000000000000000000000000080000000
      8000000080000000800000008000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000000000FFFF000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF000000000000FFFF0000000000000080000000
      8000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000007F7F7F0000000000000000000000000000808000008080000080
      8000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000FFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000080000000
      80000000800000000000BFBFBF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000000000FFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000000000000000FF000000
      FF0000008000000080000000800000FFFF0000FFFF0000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F00FFFFFF007F7F7F00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000FFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000080000000
      FF000000FF000000FF0000008000000000000000000000008000000000000000
      8000000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000000000FFFF000000
      00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000080000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000FFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000000000000000000000FF
      FF0000FFFF007F7F7F00000080000000000000000000000080000000FF000000
      FF00000080000000800000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF007F7F7F00000000000000
      80000000800000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000080800000FFFF0000FFFF00000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000008080000000
      00000000000000000000000000007F7F7F000000000000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000FFFF000080800000FFFF000000000000FFFF0000FFFF00000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F800803FFFFFC003F800001F0000C003
      200000040000C003000000000000C003000000000000C003000000000000C003
      000000000000C003000000000000C003000000000000C003000000000000C003
      E00000070000C003F800001F0000C003F800000F0000C003F80180070000C003
      F80380230000C003F80755770000C0038001FC00FC01DDDD0000F0008C01D555
      0000C00004010000000000000401DFFF0000000004018FDF000000008C01D4AF
      00000000FC01000000000000FC01DB770000000004038EB7000000000407D5A3
      80010001040F0000C003000307FFDBFBC003000706039BFDC003001FFF07DFFF
      C003007FFF8F0000C00301FFFFDFFFFFFE7FC00780008007FE1FC00700000003
      FC07C00700000001FC01C00700008010F800C00700000000F800C00700000000
      0000C007000080000000C007000080000001C007000000000032C00780000000
      003EC007C0000000003EC007F0000000003EC007FC00C001001DC007FC01C001
      0023C007FC03C007003FC007FC07E3FFA002F862F0078FC0800080E0C0038000
      800101E080038000600301E080030000700731E180038000780F31C180038000
      0000C181800380000000C30780038A80807FFE1780038A808043CC3780038A80
      C001A87780038000E00140F780038A80E00301E380038FC0CE03C1E3B007FFC0
      9E79C0E3D007FFC03E7CC83FEAAFFFC000000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Left = 328
    Top = 120
    object WindowArrange1: TWindowArrange
      Category = 'Window'
      Caption = '&Arrange'
    end
    object WindowCascade1: TWindowCascade
      Category = 'Window'
      Caption = '&Cascade'
      ImageIndex = 17
    end
    object WindowMinimizeAll1: TWindowMinimizeAll
      Category = 'Window'
      Caption = '&Minimize All'
    end
    object WindowTileHorizontal1: TWindowTileHorizontal
      Category = 'Window'
      Caption = 'Tile &Horizontally'
      ImageIndex = 15
    end
    object WindowTileVertical1: TWindowTileVertical
      Category = 'Window'
      Caption = '&Tile Vertically'
      ImageIndex = 16
    end
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object pmnPurchaseInvoicing: TPopupMenu
    Left = 624
    Top = 96
    object mnuPurchaseInvoice: TMenuItem
      Caption = 'Invoicing'
      OnClick = PurchInvoicing1Click
    end
    object mnuPurchaseCredit: TMenuItem
      Caption = 'Credit Notes'
      OnClick = mnuPurchaseCreditClick
    end
  end
  object tmrCheckActivity: TTimer
    Enabled = False
    Interval = 900000
    OnTimer = tmrCheckActivityTimer
    Left = 752
    Top = 96
  end
  object pmnSalesInvoicing: TPopupMenu
    Left = 496
    Top = 96
    object btnSalesInvoicing1: TMenuItem
      Caption = 'Invoicing'
      OnClick = btnSalesInvoicing1Click
    end
    object btnSalesCredits1: TMenuItem
      Caption = 'Credit Notes'
      OnClick = btnSalesCredits1Click
    end
  end
end
