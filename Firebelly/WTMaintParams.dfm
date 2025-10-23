object frmWTMaintParams: TfrmWTMaintParams
  Left = 395
  Top = 47
  BorderStyle = bsDialog
  Caption = 'Company preferences'
  ClientHeight = 704
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Label8: TLabel
    Left = 16
    Top = 12
    Width = 80
    Height = 13
    Caption = 'Company Name'
  end
  object pcDetails: TPageControl
    Left = 16
    Top = 40
    Width = 705
    Height = 622
    ActivePage = tsGeneral
    TabOrder = 0
    object tsGeneral: TTabSheet
      Caption = 'General'
      object Label11: TLabel
        Left = 16
        Top = 20
        Width = 41
        Height = 13
        Caption = 'Address'
      end
      object Label13: TLabel
        Left = 16
        Top = 81
        Width = 27
        Height = 13
        Caption = 'Town'
      end
      object Label14: TLabel
        Left = 16
        Top = 112
        Width = 47
        Height = 13
        Caption = 'Postcode'
      end
      object Label15: TLabel
        Left = 16
        Top = 143
        Width = 37
        Height = 13
        Caption = 'County'
      end
      object Label16: TLabel
        Left = 16
        Top = 174
        Width = 53
        Height = 13
        Caption = 'Telephone'
      end
      object Label12: TLabel
        Left = 16
        Top = 204
        Width = 60
        Height = 13
        Caption = 'Fax number'
      end
      object Label17: TLabel
        Left = 16
        Top = 235
        Width = 68
        Height = 13
        Caption = 'Web Address'
      end
      object Label18: TLabel
        Left = 16
        Top = 264
        Width = 71
        Height = 13
        Caption = 'Email Address'
      end
      object Label28: TLabel
        Left = 16
        Top = 341
        Width = 84
        Height = 13
        Caption = 'VAT Reg Number'
      end
      object Label70: TLabel
        Left = 16
        Top = 368
        Width = 76
        Height = 13
        Caption = 'Unique Tax Ref'
      end
      object Label81: TLabel
        Left = 16
        Top = 314
        Width = 92
        Height = 13
        Caption = 'Company Reg No.'
      end
      object chkbxTradeDetails: TCheckBox
        Left = 16
        Top = 408
        Width = 233
        Height = 17
        Caption = 'Use separate details for trade customers'
        TabOrder = 12
      end
      object edtStreet: TEdit
        Left = 112
        Top = 16
        Width = 249
        Height = 21
        TabOrder = 0
        Text = 'edtStreet'
      end
      object edtLocale: TEdit
        Left = 112
        Top = 48
        Width = 249
        Height = 21
        TabOrder = 1
        Text = 'edtLocale'
      end
      object edtTownCity: TEdit
        Left = 112
        Top = 77
        Width = 169
        Height = 21
        TabOrder = 2
        Text = 'edtTownCity'
      end
      object edtPostcode: TEdit
        Left = 112
        Top = 108
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'edtPostcode'
      end
      object edtCountyState: TEdit
        Left = 112
        Top = 139
        Width = 169
        Height = 21
        TabOrder = 4
        Text = 'edtCountyState'
      end
      object edtTelephoneNumber: TEdit
        Left = 112
        Top = 170
        Width = 241
        Height = 21
        TabOrder = 5
        Text = 'edtTelephoneNumber'
      end
      object edtFaxNumber: TEdit
        Left = 112
        Top = 200
        Width = 241
        Height = 21
        TabOrder = 6
        Text = 'edtFaxNumber'
      end
      object edtWebAddress: TEdit
        Left = 112
        Top = 231
        Width = 297
        Height = 21
        TabOrder = 7
        Text = 'edtWebAddress'
      end
      object edtEmailAddress: TEdit
        Left = 112
        Top = 260
        Width = 297
        Height = 21
        TabOrder = 8
        Text = 'edtEmailAddress'
      end
      object edtVatNumber: TEdit
        Left = 112
        Top = 337
        Width = 169
        Height = 21
        TabOrder = 10
        Text = 'edtVatNumber'
      end
      object edtUniqueTaxReference: TEdit
        Left = 112
        Top = 364
        Width = 169
        Height = 21
        TabOrder = 11
        Text = 'edtUniqueTaxReference'
      end
      object edtCompanyNumber: TEdit
        Left = 112
        Top = 310
        Width = 169
        Height = 21
        TabOrder = 9
        Text = 'edtCompanyNumber'
      end
    end
    object tsCharges: TTabSheet
      Caption = 'Charges'
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 131
        Height = 13
        Caption = 'Daily Installation Charges'
      end
      object Label2: TLabel
        Left = 8
        Top = 52
        Width = 127
        Height = 13
        Caption = 'Survey/Template Charges'
      end
      object Label7: TLabel
        Left = 8
        Top = 148
        Width = 135
        Height = 13
        Caption = 'Customer Deposit Terms %'
      end
      object Label29: TLabel
        Left = 8
        Top = 228
        Width = 118
        Height = 13
        Caption = 'Upstand Polish Price/m'
      end
      object Label33: TLabel
        Left = 8
        Top = 116
        Width = 129
        Height = 13
        Caption = 'Default Trade Discount %'
      end
      object Label9: TLabel
        Left = 8
        Top = 197
        Width = 96
        Height = 13
        Caption = 'Upstand Thickness'
      end
      object Label3: TLabel
        Left = 11
        Top = 398
        Width = 63
        Height = 13
        Caption = 'Quote Prefix'
        Visible = False
      end
      object Label6: TLabel
        Left = 11
        Top = 428
        Width = 49
        Height = 13
        Caption = 'Job Prefix'
        Visible = False
      end
      object Label43: TLabel
        Left = 345
        Top = 228
        Width = 117
        Height = 13
        Caption = 'Upstand Polish Cost/m'
      end
      object SpeedButton4: TSpeedButton
        Left = 250
        Top = 192
        Width = 23
        Height = 22
        Hint = 'Clear Default Upstand Size'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
          305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
          005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
          B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
          B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
          B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
          B0557777FF577777F7F500000E055550805577777F7555575755500000555555
          05555777775555557F5555000555555505555577755555557555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = SpeedButton4Click
      end
      object Label62: TLabel
        Left = 11
        Top = 288
        Width = 81
        Height = 13
        Caption = 'Quote Valid for:'
      end
      object Label63: TLabel
        Left = 243
        Top = 287
        Width = 23
        Height = 13
        Caption = 'days'
      end
      object Label71: TLabel
        Left = 8
        Top = 84
        Width = 85
        Height = 13
        Caption = 'Delivery Charges'
      end
      object Label74: TLabel
        Left = 11
        Top = 320
        Width = 114
        Height = 13
        Caption = 'Quote follow up days:'
      end
      object Label75: TLabel
        Left = 243
        Top = 319
        Width = 23
        Height = 13
        Caption = 'days'
      end
      object Label76: TLabel
        Left = 11
        Top = 352
        Width = 105
        Height = 13
        Caption = 'Customer Sales Lead'
      end
      object SpeedButton2: TSpeedButton
        Left = 362
        Top = 347
        Width = 23
        Height = 22
        Hint = 'Clear Default Upstand Size'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
          305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
          005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
          B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
          B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
          B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
          B0557777FF577777F7F500000E055550805577777F7555575755500000555555
          05555777775555557F5555000555555505555577755555557555}
        NumGlyphs = 2
        ParentFont = False
        OnClick = SpeedButton2Click
      end
      object dblkpUpstand: TDBLookupComboBox
        Left = 152
        Top = 193
        Width = 81
        Height = 21
        KeyField = 'Thickness'
        ListField = 'Thickness_mm'
        ListSource = srclkpThickness
        TabOrder = 0
      end
      object spnQuoteValidDays: TSpinEdit
        Left = 152
        Top = 282
        Width = 78
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object spnQuoteFollowUpDays: TSpinEdit
        Left = 152
        Top = 314
        Width = 78
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
      object edtInstallRate: TCREditMoney
        Left = 152
        Top = 16
        Width = 80
        Height = 21
        TabOrder = 3
        Text = 'edtInstallRate'
      end
      object edtSurveyRate: TCREditMoney
        Left = 152
        Top = 48
        Width = 80
        Height = 21
        TabOrder = 4
        Text = 'edtSurveyRate'
      end
      object edtDeliveryRate: TCREditMoney
        Left = 152
        Top = 80
        Width = 80
        Height = 21
        TabOrder = 5
        Text = 'edtDeliveryRate'
      end
      object edtDiscountRate: TCREditFloat
        Left = 152
        Top = 112
        Width = 80
        Height = 21
        TabOrder = 6
        Text = 'edtDiscountRate'
      end
      object edtUpstandPolishPrice: TCREditMoney
        Left = 151
        Top = 224
        Width = 80
        Height = 21
        TabOrder = 7
        Text = 'edtUpstandPolishPrice'
      end
      object edtDepositTerms: TCREditFloat
        Left = 152
        Top = 144
        Width = 80
        Height = 21
        TabOrder = 8
        Text = 'edtDepositTerms'
      end
      object edtUpstandPolishCost: TCREditMoney
        Left = 471
        Top = 224
        Width = 80
        Height = 21
        TabOrder = 9
        Text = 'edtUpstandPolishCost'
      end
      object edtQuotePrefix: TEdit
        Left = 152
        Top = 392
        Width = 50
        Height = 21
        TabOrder = 10
        Text = 'edtQuotePrefix'
        Visible = False
      end
      object edtJobPrefix: TEdit
        Left = 152
        Top = 424
        Width = 50
        Height = 21
        TabOrder = 11
        Text = 'edtJobPrefi'
        Visible = False
      end
      object dblkpCustSalesLeadSource: TDBLookupComboBox
        Left = 152
        Top = 348
        Width = 201
        Height = 21
        KeyField = 'Sales_Lead_Source'
        ListField = 'Sales_Lead_Source_Descr'
        ListSource = dtsSalesSource
        TabOrder = 12
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'General Terms'
      ImageIndex = 4
      object Label23: TLabel
        Left = 16
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Availability'
      end
      object Label24: TLabel
        Left = 16
        Top = 100
        Width = 74
        Height = 13
        Caption = 'Payment Terms'
      end
      object Label35: TLabel
        Left = 16
        Top = 291
        Width = 120
        Height = 13
        Caption = 'Invoice Payment Details'
      end
      object Label42: TLabel
        Left = 16
        Top = 387
        Width = 152
        Height = 13
        Caption = 'Retail Invoice Payment Details'
      end
      object Label52: TLabel
        Left = 16
        Top = 196
        Width = 106
        Height = 13
        Caption = 'Retail Payment Terms'
      end
      object Label64: TLabel
        Left = 16
        Top = 483
        Width = 173
        Height = 13
        Caption = 'Factored Invoices Payment Details'
      end
      object memAvail: TMemo
        Left = 16
        Top = 20
        Width = 569
        Height = 75
        Lines.Strings = (
          'Memo2')
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object memTerms: TMemo
        Left = 16
        Top = 116
        Width = 569
        Height = 75
        Lines.Strings = (
          'Memo3')
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object memPayment: TMemo
        Left = 16
        Top = 305
        Width = 569
        Height = 75
        Lines.Strings = (
          'Memo3')
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object memRetailPayment: TMemo
        Left = 16
        Top = 401
        Width = 569
        Height = 75
        Lines.Strings = (
          'Memo3')
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object memRetailTerms: TMemo
        Left = 16
        Top = 212
        Width = 569
        Height = 75
        Lines.Strings = (
          'Memo3')
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object memFactoredPayment: TMemo
        Left = 16
        Top = 497
        Width = 569
        Height = 75
        Lines.Strings = (
          'Memo3')
        ScrollBars = ssVertical
        TabOrder = 5
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Settings'
      ImageIndex = 5
      object Label10: TLabel
        Left = 16
        Top = 190
        Width = 72
        Height = 13
        Caption = 'Sales Nominal'
      end
      object Label22: TLabel
        Left = 16
        Top = 220
        Width = 92
        Height = 13
        Caption = 'Purchase Nominal'
      end
      object Label25: TLabel
        Left = 16
        Top = 260
        Width = 92
        Height = 13
        Caption = 'Accounts Package'
      end
      object Label26: TLabel
        Left = 16
        Top = 288
        Width = 81
        Height = 13
        Caption = 'Export directory'
      end
      object Label27: TLabel
        Left = 16
        Top = 316
        Width = 76
        Height = 13
        Caption = 'Last export no.'
      end
      object Label36: TLabel
        Left = 16
        Top = 158
        Width = 71
        Height = 13
        Caption = 'Nominal Level'
      end
      object Label40: TLabel
        Left = 16
        Top = 120
        Width = 84
        Height = 13
        Caption = 'Default VAT Rate'
      end
      object Label67: TLabel
        Left = 16
        Top = 436
        Width = 78
        Height = 13
        Caption = 'Delivery Details'
      end
      object dblkpAccountsPackage: TDBLookupComboBox
        Left = 112
        Top = 256
        Width = 185
        Height = 21
        KeyField = 'Accounts_Package'
        ListField = 'Accounts_Package_Description'
        ListSource = dtsAccounts
        TabOrder = 0
      end
      object dblkpDefaultVat: TDBLookupComboBox
        Left = 112
        Top = 116
        Width = 90
        Height = 21
        KeyField = 'Vat'
        ListField = 'Vat_Rate'
        ListSource = dtsVat
        TabOrder = 1
      end
      object chkbxPricesAreTrade: TCheckBox
        Left = 16
        Top = 8
        Width = 225
        Height = 17
        Caption = 'Supply Prices are Trade prices'
        TabOrder = 2
      end
      object chkbxBalanceRequired: TCheckBox
        Left = 16
        Top = 32
        Width = 225
        Height = 17
        Caption = 'Balance Required Prior To Fitting'
        TabOrder = 3
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 456
        Width = 561
        Height = 89
        DataField = 'Delivery_Narrative'
        DataSource = srcParams
        TabOrder = 4
      end
      object chkbxMandatoryDates: TCheckBox
        Left = 16
        Top = 56
        Width = 225
        Height = 17
        Caption = 'Mandatory Templating/Fitting Dates'
        TabOrder = 5
      end
      object chkbxUseOnstop: TCheckBox
        Left = 16
        Top = 80
        Width = 225
        Height = 17
        Caption = 'Do not process orders if customer Onstop'
        TabOrder = 6
      end
      object GroupBox1: TGroupBox
        Left = 408
        Top = 8
        Width = 273
        Height = 129
        ParentBackground = False
        TabOrder = 7
        object Label77: TLabel
          Left = 24
          Top = 96
          Width = 112
          Height = 13
          Caption = 'Drawing Folder Name'
        end
        object Label4: TLabel
          Left = 24
          Top = 64
          Width = 80
          Height = 13
          Caption = 'Inactive Reason'
        end
        object chkbxUseContractQuoting: TCheckBox
          Left = 10
          Top = 0
          Width = 127
          Height = 17
          Caption = 'Use Contract Quoting'
          TabOrder = 0
          OnClick = chkbxUseContractQuotingClick
        end
        object chkbxContractQuoteBySlab: TCheckBox
          Left = 26
          Top = 32
          Width = 143
          Height = 17
          Caption = 'Quote by Slab Details'
          TabOrder = 1
        end
        object edtDrawingFolderName: TEdit
          Left = 160
          Top = 92
          Width = 97
          Height = 21
          TabOrder = 2
          Text = 'edtDrawingFolderName'
        end
        object dblkpInactiveContract: TDBLookupComboBox
          Left = 112
          Top = 60
          Width = 145
          Height = 21
          KeyField = 'Inactive_Reason'
          ListField = 'Inactive_Reason_Descr'
          ListSource = dtsInactiveReason
          TabOrder = 3
        end
      end
      object chkbxUsePurchaseOrdering: TCheckBox
        Left = 410
        Top = 152
        Width = 143
        Height = 17
        Caption = 'Use Purchase Ordering'
        TabOrder = 8
      end
      object edtDefaultSalesNominal: TEdit
        Left = 112
        Top = 184
        Width = 80
        Height = 21
        TabOrder = 9
        Text = 'edtDefaultSalesNominal'
      end
      object edtDefaultPurchaseNominal: TEdit
        Left = 112
        Top = 216
        Width = 80
        Height = 21
        TabOrder = 10
        Text = 'edtDefaultPurchaseNominal'
      end
      object edtDataExportDirectory: TEdit
        Left = 112
        Top = 284
        Width = 275
        Height = 21
        TabOrder = 11
        Text = 'edtDataExportDirectory'
      end
      object edtLastFileNoInv: TCREditInt
        Left = 112
        Top = 312
        Width = 100
        Height = 21
        TabOrder = 12
        Text = 'edtLastFileNoInv'
      end
      object dblkpNominalLevel: TComboBox
        Left = 112
        Top = 152
        Width = 145
        Height = 21
        TabOrder = 13
        Text = 'dblkpNominalLevel'
        Items.Strings = (
          'COMPANY'
          'CUST TYPE'
          'MAT TYPE'
          'MATERIAL')
      end
      object chkbxUseRevenueCentres: TCheckBox
        Left = 410
        Top = 176
        Width = 143
        Height = 17
        Caption = 'Use Revenue Centres'
        TabOrder = 14
      end
      object grpbxRemedials: TGroupBox
        Left = 16
        Top = 352
        Width = 393
        Height = 65
        Enabled = False
        ParentBackground = False
        TabOrder = 15
        object Label5: TLabel
          Left = 24
          Top = 30
          Width = 90
          Height = 13
          Caption = 'Remedial Product'
        end
        object btnClearProduct: TSpeedButton
          Left = 346
          Top = 24
          Width = 25
          Height = 25
          Hint = 'Clear Default Upstand Size'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
          ParentFont = False
          OnClick = btnClearProductClick
        end
        object edtRemedialProduct: TEdit
          Left = 120
          Top = 26
          Width = 185
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object btnLUProducts: TButton
          Left = 312
          Top = 24
          Width = 25
          Height = 25
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnLUProductsClick
        end
      end
      object chkbxUseRemedialsAsOrders: TCheckBox
        Left = 26
        Top = 349
        Width = 143
        Height = 17
        Caption = 'Use Remedial As Orders'
        TabOrder = 16
        OnClick = chkbxUseRemedialsAsOrdersClick
      end
      object grpbxStockSystem: TGroupBox
        Left = 408
        Top = 216
        Width = 273
        Height = 57
        ParentBackground = False
        TabOrder = 17
        object Label80: TLabel
          Left = 24
          Top = 27
          Width = 66
          Height = 13
          Caption = 'Stock System'
        end
        object dblkpStockSystem: TDBLookupComboBox
          Left = 112
          Top = 23
          Width = 145
          Height = 21
          KeyField = 'Stock_System'
          ListField = 'Stock_System_Description'
          ListSource = dtsStockSystem
          TabOrder = 0
        end
      end
      object chkbxUseStockSystem: TCheckBox
        Left = 418
        Top = 213
        Width = 111
        Height = 17
        Caption = 'Use Stock System'
        TabOrder = 18
        OnClick = chkbxUseStockSystemClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Production'
      ImageIndex = 5
      object Label30: TLabel
        Left = 8
        Top = 48
        Width = 87
        Height = 13
        Caption = 'Production Email'
      end
      object Label31: TLabel
        Left = 8
        Top = 208
        Width = 79
        Height = 13
        Caption = 'Job Documents'
      end
      object Label32: TLabel
        Left = 8
        Top = 177
        Width = 87
        Height = 13
        Caption = 'Sales Documents'
      end
      object Label34: TLabel
        Left = 8
        Top = 85
        Width = 110
        Height = 13
        Caption = 'Customer Documents'
      end
      object Label41: TLabel
        Left = 8
        Top = 147
        Width = 93
        Height = 13
        Caption = 'Quote Documents'
      end
      object Label54: TLabel
        Left = 8
        Top = 240
        Width = 105
        Height = 13
        Caption = 'Contract Documents'
      end
      object Label56: TLabel
        Left = 8
        Top = 16
        Width = 56
        Height = 13
        Caption = 'Sales Email'
      end
      object Label68: TLabel
        Left = 8
        Top = 115
        Width = 104
        Height = 13
        Caption = 'Supplier Documents'
      end
      object Button2: TButton
        Left = 430
        Top = 202
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 4
        OnClick = Button2Click
      end
      object Button1: TButton
        Left = 430
        Top = 171
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 3
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 430
        Top = 79
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 0
        OnClick = Button3Click
      end
      object grpbxCosting: TGroupBox
        Left = 8
        Top = 280
        Width = 481
        Height = 153
        ParentBackground = False
        TabOrder = 6
        object Label37: TLabel
          Left = 24
          Top = 32
          Width = 149
          Height = 13
          Caption = 'Default Mileage Rate (p/mile)'
        end
        object Label38: TLabel
          Left = 24
          Top = 64
          Width = 141
          Height = 13
          Caption = 'Default Labour Rate (/hour)'
        end
        object Label39: TLabel
          Left = 24
          Top = 96
          Width = 172
          Height = 13
          Caption = 'Default Handling Rate (/sq metre)'
        end
        object Label20: TLabel
          Left = 24
          Top = 128
          Width = 111
          Height = 13
          Caption = 'Waste Cost Multiplier'
        end
        object chkbxUseCosting: TCheckBox
          Left = 10
          Top = -3
          Width = 127
          Height = 17
          Caption = 'Use Costing System'
          TabOrder = 0
          OnClick = chkbxUseCostingClick
        end
        object edtDefaultMileageRate: TCREditMoney
          Left = 200
          Top = 28
          Width = 81
          Height = 21
          TabOrder = 1
          Text = 'edtDefaultMileageRate'
        end
        object edtDefaultLabourRate: TCREditMoney
          Left = 200
          Top = 60
          Width = 81
          Height = 21
          TabOrder = 2
          Text = 'edtDefaultLabourRate'
        end
        object edtDefaultHandlingRate: TCREditMoney
          Left = 200
          Top = 92
          Width = 81
          Height = 21
          TabOrder = 3
          Text = 'edtDefaultHandlingRate'
        end
        object edtWasteCostMultiplier: TCREditInt
          Left = 200
          Top = 124
          Width = 50
          Height = 21
          TabOrder = 4
          Text = 'edtWasteCostMultiplier'
        end
      end
      object Button4: TButton
        Left = 430
        Top = 141
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 2
        OnClick = Button4Click
      end
      object Button8: TButton
        Left = 430
        Top = 234
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 5
        OnClick = Button8Click
      end
      object Button10: TButton
        Left = 430
        Top = 109
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 1
        OnClick = Button10Click
      end
      object edtSalesEmail: TEdit
        Left = 120
        Top = 12
        Width = 385
        Height = 21
        TabOrder = 7
        Text = 'edtSalesEmail'
      end
      object edtProductionEmail: TEdit
        Left = 120
        Top = 44
        Width = 385
        Height = 21
        TabOrder = 8
        Text = 'edtProductionEmail'
      end
      object edtCustomerDocumentDirectory: TEdit
        Left = 120
        Top = 81
        Width = 290
        Height = 21
        TabOrder = 9
        Text = 'edtCustomerDocumentDirectory'
      end
      object edtSupplierDocumentDirectory: TEdit
        Left = 120
        Top = 111
        Width = 290
        Height = 21
        TabOrder = 10
        Text = 'edtSupplierDocumentDirectory'
      end
      object edtQuoteDocumentDirectory: TEdit
        Left = 120
        Top = 143
        Width = 290
        Height = 21
        TabOrder = 11
        Text = 'edtQuoteDocumentDirectory'
      end
      object edtSalesDocumentDirectory: TEdit
        Left = 120
        Top = 173
        Width = 290
        Height = 21
        TabOrder = 12
        Text = 'edtSalesDocumentDirectory'
      end
      object edtJobDocumentDirectory: TEdit
        Left = 120
        Top = 204
        Width = 290
        Height = 21
        TabOrder = 13
        Text = 'edtJobDocumentDirectory'
      end
      object edtContractDocumentDirectory: TEdit
        Left = 120
        Top = 236
        Width = 290
        Height = 21
        TabOrder = 14
        Text = 'edtContractDocumentDirectory'
      end
      object Button11: TButton
        Tag = 10
        Left = 542
        Top = 79
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 15
        OnClick = Button11Click
      end
      object Button12: TButton
        Tag = 20
        Left = 542
        Top = 109
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 16
        OnClick = Button11Click
      end
      object Button13: TButton
        Tag = 30
        Left = 542
        Top = 141
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 17
        OnClick = Button11Click
      end
      object Button14: TButton
        Tag = 40
        Left = 542
        Top = 171
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 18
        OnClick = Button11Click
      end
      object Button15: TButton
        Tag = 50
        Left = 542
        Top = 202
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 19
        OnClick = Button11Click
      end
      object Button16: TButton
        Tag = 60
        Left = 542
        Top = 234
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 20
        OnClick = Button11Click
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 440
        Width = 681
        Height = 151
        Caption = 'Scheduling'
        ParentBackground = False
        TabOrder = 21
        object Label53: TLabel
          Left = 16
          Top = 28
          Width = 96
          Height = 13
          Caption = 'Scheduling System'
        end
        object Label73: TLabel
          Left = 16
          Top = 60
          Width = 72
          Height = 13
          Caption = 'Shared Folder'
        end
        object grpbxDocumentTransfer: TGroupBox
          Left = 373
          Top = 23
          Width = 305
          Height = 125
          ParentBackground = False
          TabOrder = 5
          object Label65: TLabel
            Left = 16
            Top = 19
            Width = 53
            Height = 13
            Caption = 'Quotation'
          end
          object Label78: TLabel
            Left = 16
            Top = 47
            Width = 80
            Height = 13
            Caption = 'Health && Safety'
          end
          object Label79: TLabel
            Left = 16
            Top = 75
            Width = 52
            Height = 13
            Caption = 'Remedials'
          end
          object Label82: TLabel
            Left = 16
            Top = 104
            Width = 27
            Height = 13
            Caption = 'Plans'
          end
          object edtQuotationDocumentFolder: TEdit
            Left = 104
            Top = 15
            Width = 193
            Height = 21
            TabOrder = 0
            Text = 'edtQuotationDocumentFolder'
          end
          object edtSafetyDocumentFolder: TEdit
            Left = 104
            Top = 43
            Width = 193
            Height = 21
            TabOrder = 1
            Text = 'edtSharedFolder'
          end
          object edtRemedialDocumentFolder: TEdit
            Left = 104
            Top = 73
            Width = 193
            Height = 21
            TabOrder = 2
            Text = 'edtRemedialDocumentFolder'
          end
          object edtPlanDocumentFolder: TEdit
            Left = 104
            Top = 100
            Width = 193
            Height = 21
            TabOrder = 3
            Text = 'edtPlanDocumentFolder'
          end
        end
        object dblkpSchedulePackage: TDBLookupComboBox
          Left = 120
          Top = 24
          Width = 193
          Height = 21
          KeyField = 'Schedule_Package'
          ListField = 'Schedule_Package_Name'
          ListSource = dtsScheduling
          TabOrder = 0
        end
        object DirectClrBitBtn: TBitBtn
          Left = 318
          Top = 22
          Width = 25
          Height = 25
          Hint = 'Clear Default Attachment Storage Directory'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 1
          OnClick = DirectClrBitBtnClick
        end
        object BitBtn1: TBitBtn
          Left = 318
          Top = 54
          Width = 25
          Height = 25
          Hint = 'Clear Default Attachment Storage Directory'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
          OnClick = BitBtn1Click
        end
        object edtSharedFolder: TEdit
          Left = 120
          Top = 56
          Width = 193
          Height = 21
          TabOrder = 3
          Text = 'edtSharedFolder'
        end
        object chkbxUseDocumentTransfer: TCheckBox
          Left = 378
          Top = 13
          Width = 143
          Height = 17
          Caption = 'Use Document Transfer'
          TabOrder = 4
          OnClick = chkbxUseDocumentTransferClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Documents'
      ImageIndex = 6
      object Label44: TLabel
        Left = 8
        Top = 16
        Width = 105
        Height = 13
        Caption = 'Template Conditions'
      end
      object Label45: TLabel
        Left = 8
        Top = 56
        Width = 61
        Height = 13
        Caption = 'Sales T && Cs'
      end
      object Label46: TLabel
        Left = 8
        Top = 96
        Width = 55
        Height = 13
        Caption = 'Availability'
      end
      object Label55: TLabel
        Left = 8
        Top = 156
        Width = 101
        Height = 13
        Caption = 'Order Confirmation'
      end
      object Button5: TButton
        Left = 430
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 0
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 430
        Top = 50
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 1
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 430
        Top = 90
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 2
        OnClick = Button7Click
      end
      object memConfirm: TMemo
        Left = 8
        Top = 172
        Width = 457
        Height = 75
        Lines.Strings = (
          'Memo2')
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object edtTemplateConditionsFile: TEdit
        Left = 112
        Top = 12
        Width = 313
        Height = 21
        TabOrder = 4
        Text = 'edtTemplateConditionsFile'
      end
      object edtSalesOrderTermsFile: TEdit
        Left = 112
        Top = 52
        Width = 313
        Height = 21
        TabOrder = 5
        Text = 'edtSalesOrderTermsFile'
      end
      object edtSalesAvailabilityFile: TEdit
        Left = 112
        Top = 92
        Width = 313
        Height = 21
        TabOrder = 6
        Text = 'edtSalesAvailabilityFile'
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Emails'
      ImageIndex = 7
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 697
        Height = 594
        ActivePage = TabSheet8
        Align = alClient
        TabOrder = 0
        object TabSheet8: TTabSheet
          Caption = 'Quotes'
          object Label47: TLabel
            Left = 15
            Top = 13
            Width = 103
            Height = 13
            Caption = 'Quotation Preamble'
          end
          object Label60: TLabel
            Left = 15
            Top = 191
            Width = 177
            Height = 13
            Caption = 'Retail Specific Quotation Preamble'
          end
          object btnEmailHelp: TSpeedButton
            Left = 650
            Top = 29
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
              33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
              FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
              FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
              FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
              FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
              FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
              3333333773FFFF77333333333FBFBF3333333333377777333333}
            NumGlyphs = 2
            OnClick = btnEmailHelpClick
          end
          object memEmailQuote: TMemo
            Left = 15
            Top = 29
            Width = 600
            Height = 150
            Lines.Strings = (
              'Memo2')
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object memEmailRetailQuote: TMemo
            Left = 15
            Top = 209
            Width = 600
            Height = 150
            Lines.Strings = (
              'Memo2')
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Sales Orders'
          ImageIndex = 1
          object Label48: TLabel
            Left = 15
            Top = 14
            Width = 147
            Height = 13
            Caption = 'Sales Confirmation Preamble'
          end
          object Label69: TLabel
            Left = 15
            Top = 190
            Width = 272
            Height = 13
            Caption = 'Retail/Proforma Specific Sales Confirmation Preamble'
          end
          object SpeedButton1: TSpeedButton
            Left = 650
            Top = 30
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
              33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
              FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
              FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
              FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
              FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
              FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
              3333333773FFFF77333333333FBFBF3333333333377777333333}
            NumGlyphs = 2
            OnClick = btnEmailHelpClick
          end
          object Label72: TLabel
            Left = 15
            Top = 366
            Width = 155
            Height = 13
            Caption = 'Fitting Confirmation Preamble'
          end
          object memEmailSalesConfirm: TMemo
            Left = 15
            Top = 30
            Width = 600
            Height = 150
            Lines.Strings = (
              'Memo3')
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object memEmailRetailSalesConfirm: TMemo
            Left = 15
            Top = 206
            Width = 600
            Height = 150
            Lines.Strings = (
              'Memo3')
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object memEmailSalesFittingConfirm: TMemo
            Left = 15
            Top = 382
            Width = 600
            Height = 150
            Lines.Strings = (
              'Memo3')
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'Purchase Orders'
          ImageIndex = 2
          object Label66: TLabel
            Left = 15
            Top = 15
            Width = 129
            Height = 13
            Caption = 'Purchase Order Preamble'
          end
          object SpeedButton5: TSpeedButton
            Left = 650
            Top = 30
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
              33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
              FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
              FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
              FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
              FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
              FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
              3333333773FFFF77333333333FBFBF3333333333377777333333}
            NumGlyphs = 2
            OnClick = btnEmailHelpClick
          end
          object memEmailPurchaseOrder: TMemo
            Left = 15
            Top = 34
            Width = 600
            Height = 150
            Lines.Strings = (
              'Memo3')
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Invoices'
          ImageIndex = 3
          object Label49: TLabel
            Left = 15
            Top = 16
            Width = 86
            Height = 13
            Caption = 'Invoice Preamble'
          end
          object SpeedButton3: TSpeedButton
            Left = 650
            Top = 30
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
              33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
              FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
              FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
              FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
              FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
              FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
              3333333773FFFF77333333333FBFBF3333333333377777333333}
            NumGlyphs = 2
            OnClick = btnEmailHelpClick
          end
          object memEmailInvoice: TMemo
            Left = 15
            Top = 30
            Width = 600
            Height = 150
            Lines.Strings = (
              'Memo3')
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Website Integration'
      ImageIndex = 8
      DesignSize = (
        697
        594)
      object Label57: TLabel
        Left = 16
        Top = 28
        Width = 115
        Height = 13
        Caption = 'Default Web Operator'
      end
      object Label58: TLabel
        Left = 16
        Top = 68
        Width = 132
        Height = 13
        Caption = 'Default Account Manager'
      end
      object Label59: TLabel
        Left = 16
        Top = 108
        Width = 91
        Height = 13
        Caption = 'Sales Lead Source'
      end
      object Label61: TLabel
        Left = 16
        Top = 148
        Width = 116
        Height = 13
        Caption = 'Image Parent Directory'
      end
      object Label19: TLabel
        Left = 16
        Top = 260
        Width = 132
        Height = 13
        Caption = 'Template Documents  Out'
      end
      object Label21: TLabel
        Left = 16
        Top = 292
        Width = 122
        Height = 13
        Caption = 'Template Documents  In'
      end
      object Label50: TLabel
        Left = 16
        Top = 324
        Width = 118
        Height = 13
        Caption = 'Fitting Documents Out'
      end
      object Label51: TLabel
        Left = 16
        Top = 356
        Width = 108
        Height = 13
        Caption = 'Fitting Documents In'
      end
      object dblkpOperator: TDBLookupComboBox
        Left = 151
        Top = 24
        Width = 146
        Height = 21
        Anchors = [akTop, akRight]
        KeyField = 'Operator'
        ListField = 'Operator_Name'
        ListSource = dtsOperator
        TabOrder = 0
      end
      object dblkpAccountManager: TDBLookupComboBox
        Left = 151
        Top = 64
        Width = 146
        Height = 21
        Anchors = [akTop, akRight]
        KeyField = 'Operator'
        ListField = 'Operator_Name'
        ListSource = dtsAccountManager
        TabOrder = 1
      end
      object dblkpSalesLeadSource: TDBLookupComboBox
        Left = 152
        Top = 102
        Width = 201
        Height = 21
        KeyField = 'Sales_Lead_Source'
        ListField = 'Sales_Lead_Source_Descr'
        ListSource = dtsSalesSource
        TabOrder = 2
      end
      object btnSalesLead: TBitBtn
        Left = 363
        Top = 101
        Width = 22
        Height = 22
        Hint = 'Search for Customer'
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 3
        OnClick = btnSalesLeadClick
      end
      object Button9: TButton
        Left = 502
        Top = 143
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 4
        OnClick = Button9Click
      end
      object edtWebsiteImageDirectory: TEdit
        Left = 152
        Top = 144
        Width = 337
        Height = 21
        TabOrder = 5
        Text = 'edtWebsiteImageDirectory'
      end
      object edtTemplateDocsOut: TEdit
        Left = 152
        Top = 256
        Width = 226
        Height = 21
        TabOrder = 6
        Text = 'edtTemplateDocsOut'
      end
      object edtTemplateDocsIn: TEdit
        Left = 152
        Top = 288
        Width = 226
        Height = 21
        TabOrder = 7
        Text = 'edtTemplateDocsIn'
      end
      object edtFittingDocsOut: TEdit
        Left = 152
        Top = 320
        Width = 226
        Height = 21
        TabOrder = 8
        Text = 'edtFittingDocsOut'
      end
      object edtFittingDocsIn: TEdit
        Left = 152
        Top = 352
        Width = 226
        Height = 21
        TabOrder = 9
        Text = 'edtFittingDocsIn'
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 668
    Width = 748
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 659
    ExplicitWidth = 742
    object btnOK: TBitBtn
      Left = 283
      Top = 4
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 371
      Top = 4
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object edtCompanyName: TEdit
    Left = 104
    Top = 8
    Width = 289
    Height = 21
    TabOrder = 2
    Text = 'edtCompanyName'
  end
  object srcParams: TDataSource
    DataSet = qryCompany
    Left = 568
    Top = 296
  end
  object qryUpParams: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update company'
      'set Payment_Terms = :Terms,'
      '    Retail_Payment_Terms = :Retail_Payment_Terms,'
      '    Availability = :Availability,'
      '    Invoice_Payment_Notes = :Invoice_Payment_Notes,'
      '    Retail_Payment_Notes = :Retail_Payment_Notes,'
      '    Factored_Payment_Notes = :Factored_Payment_Notes,'
      '    Email_Retail_Quote_Notes = :Email_Retail_Quote_Notes,'
      '    Email_Quotation_Notes = :Email_Quotation_Notes,'
      '    Email_Invoice_Notes = :Email_Invoice_Notes,'
      '    Email_Sales_Confirm_Notes = :Email_Sales_Confirm_Notes,'
      '    Email_Fitting_Confirm_Notes = :Email_Fitting_Confirm_Notes,'
      
        '    Email_Retail_SO_Confirm_Notes = :Email_Retail_SO_Confirm_Not' +
        'es,'
      '    Email_Purchase_Order_Notes = :Email_Purchase_Order_Notes,'
      '    Order_Confirmation_Notes = :Order_Confirmation_Notes'
      'where company = 1')
    Left = 680
    Top = 328
    ParamData = <
      item
        Name = 'Terms'
      end
      item
        Name = 'Retail_Payment_Terms'
      end
      item
        Name = 'Availability'
      end
      item
        Name = 'Invoice_Payment_Notes'
      end
      item
        Name = 'Retail_Payment_Notes'
      end
      item
        Name = 'Factored_Payment_Notes'
      end
      item
        Name = 'Email_Retail_Quote_Notes'
      end
      item
        Name = 'Email_Quotation_Notes'
      end
      item
        Name = 'Email_Invoice_Notes'
      end
      item
        Name = 'Email_Sales_Confirm_Notes'
      end
      item
        Name = 'Email_Fitting_Confirm_Notes'
      end
      item
        Name = 'Email_Retail_SO_Confirm_Notes'
      end
      item
        Name = 'Email_Purchase_Order_Notes'
      end
      item
        Name = 'Order_Confirmation_Notes'
      end>
  end
  object lkpThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Thickness'
      'order by thickness_mm')
    Left = 432
    Top = 280
  end
  object srclkpThickness: TDataSource
    DataSet = lkpThickness
    Left = 496
    Top = 280
  end
  object qryAccounts: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * '
      'from Accounts_Package'
      'order by Accounts_Package_description')
    Left = 468
    Top = 384
  end
  object dtsAccounts: TDataSource
    DataSet = qryAccounts
    Left = 532
    Top = 320
  end
  object qryVat: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from VAT'
      'order by Vat_Rate')
    Left = 452
    Top = 448
    object qryVatVat: TIntegerField
      FieldName = 'Vat'
      Origin = 'Vat'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVatVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
      Origin = 'Vat_Rate'
      Required = True
    end
  end
  object dtsVat: TDataSource
    DataSet = qryVat
    Left = 580
    Top = 408
  end
  object opndlgTerms: TOpenDialog
    Left = 652
    Top = 400
  end
  object qryScheduling: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * '
      'from Schedule_Package'
      'order by Schedule_Package_Name')
    Left = 420
    Top = 296
  end
  object dtsScheduling: TDataSource
    DataSet = qryScheduling
    Left = 472
    Top = 296
  end
  object qryOperator: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Operator,'
      '        Operator_Name'
      'FROM Operator'
      'WHERE (Operator_Can_Login = '#39'Y'#39') OR (Operator = :Operator)'
      'ORDER BY Operator_Name')
    Left = 524
    Top = 344
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object dtsOperator: TDataSource
    DataSet = qryOperator
    Left = 556
    Top = 336
  end
  object qryAccountManager: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Operator,'
      '        Operator_Name'
      'FROM Operator'
      'WHERE (Operator_Can_Login = '#39'Y'#39') OR (Operator = :Operator)'
      'ORDER BY Operator_Name')
    Left = 348
    Top = 448
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object dtsAccountManager: TDataSource
    DataSet = qryAccountManager
    Left = 636
    Top = 424
  end
  object qrySalesSource: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Lead_Source,'
      '        Sales_Lead_Source_Descr'
      'FROM Sales_Lead_Source'
      
        'WHERE (Inactive = '#39'N'#39') OR (Sales_Lead_Source = :Sales_Lead_Sourc' +
        'e)'
      'ORDER BY Sales_Lead_Source_Descr')
    Left = 524
    Top = 400
    ParamData = <
      item
        Name = 'Sales_Lead_Source'
      end>
  end
  object dtsSalesSource: TDataSource
    DataSet = qrySalesSource
    Left = 588
    Top = 400
  end
  object qryCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT * '
      'FROM Company'
      'WHERE Company = 1')
    Left = 612
    Top = 280
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Company'
      'SET'
      '  Company_Name = :Company_Name,'
      '  Street = :Street,'
      '  Locale = :Locale,'
      '  Town_City = :Town_City,'
      '  Postcode = :Postcode,'
      '  County_State = :County_State,'
      '  Telephone_Number = :Telephone_Number,'
      '  Fax_Number = :Fax_Number,'
      '  Web_Address = :Web_Address,'
      '  Email_Address = :Email_Address,'
      '  Company_Reg_Number = :Company_Reg_Number,'
      '  Vat_Number = :Vat_Number,'
      '  Unique_Tax_Reference = :Unique_Tax_Reference,'
      '  Install_Rate = :Install_Rate,'
      '  Survey_Rate = :Survey_Rate,'
      '  Delivery_Rate = :Delivery_Rate,'
      '  Discount_Rate = :Discount_Rate,'
      '  Deposit_Terms = :Deposit_Terms,'
      '  Underslip_Thickness = :Underslip_Thickness,'
      '  Upstand_Polish_Price = :Upstand_Polish_Price,'
      '  Upstand_Polish_Cost = :Upstand_Polish_Cost,'
      '  Quote_Prefix = :Quote_Prefix,'
      '  Job_Prefix = :Job_Prefix,'
      '  Default_Vat = :Default_Vat,'
      '  Nominal_Level = :Nominal_Level,'
      '  Default_Sales_Nominal = :Default_Sales_Nominal,'
      '  Default_Purchase_Nominal = :Default_Purchase_Nominal,'
      '  Accounts_Package = :Accounts_Package,'
      '  Data_Export_Directory = :Data_Export_Directory,'
      '  Last_File_No_Inv = :Last_File_No_Inv,'
      '  Sales_Email = :Sales_Email,'
      '  Production_Email = :Production_Email,'
      '  Customer_Document_Directory = :Customer_Document_Directory,'
      '  Supplier_Document_Directory = :Supplier_Document_Directory,'
      '  Quote_Document_Directory = :Quote_Document_Directory,'
      '  Sales_Document_Directory = :Sales_Document_Directory,'
      '  Job_Document_Directory = :Job_Document_Directory,'
      '  Contract_Document_Directory = :Contract_Document_Directory,'
      '  Default_Mileage_Rate = :Default_Mileage_Rate,'
      '  Default_Labour_Rate = :Default_Labour_Rate,'
      '  Default_Handling_Rate = :Default_Handling_Rate,'
      '  Waste_Cost_Multiplier = :Waste_Cost_Multiplier,'
      '  Schedule_Package = :Schedule_Package,'
      '  Shared_Folder = :Shared_Folder,'
      '  Template_Conditions_File = :Template_Conditions_File,'
      '  Sales_Order_Terms_File = :Sales_Order_Terms_File,'
      '  Sales_Availability_File = :Sales_Availability_File,'
      '  Operator = :Operator,'
      '  Account_Manager = :Account_Manager,'
      '  Sales_Lead_Source = :Sales_Lead_Source,'
      '  Customer_Sales_Lead_Source = :Customer_Sales_Lead_Source,'
      '  Website_Image_Directory = :Website_Image_Directory,'
      '  Payment_Terms = :Terms,'
      '  Retail_Payment_Terms = :Retail_Payment_Terms,'
      '  Availability = :Availability,'
      '  Invoice_Payment_Notes = :Invoice_Payment_Notes,'
      '  Retail_Payment_Notes = :Retail_Payment_Notes,'
      '  Factored_Payment_Notes = :Factored_Payment_Notes,'
      '  Email_Retail_Quote_Notes = :Email_Retail_Quote_Notes,'
      '  Email_Quotation_Notes = :Email_Quotation_Notes,'
      '  Email_Invoice_Notes = :Email_Invoice_Notes,'
      '  Email_Sales_Confirm_Notes = :Email_Sales_Confirm_Notes,'
      '  Email_Fitting_Confirm_Notes = :Email_Fitting_Confirm_Notes,'
      
        '  Email_Retail_SO_Confirm_Notes = :Email_Retail_SO_Confirm_Notes' +
        ','
      '  Email_Purchase_Order_Notes = :Email_Purchase_Order_Notes,'
      '  Order_Confirmation_Notes = :Order_Confirmation_Notes,'
      '  Use_Purchase_Ordering = :Use_Purchase_Ordering,'
      '  Use_Contract_Quoting = :Use_Contract_Quoting,'
      '  Contract_Quote_By_Slab = :Contract_Quote_By_Slab,'
      '  Prices_Are_Trade = :Prices_Are_Trade,'
      '  Balance_Required_Before_Fit = :Balance_Required_Before_Fit,'
      '  Use_Onstop = :Use_Onstop,'
      '  Mandatory_Temp_Fit_Dates = :Mandatory_Temp_Fit_Dates,'
      '  Use_Trade_Layout = :Use_Trade_Layout,'
      '  Use_Costing_System = :Use_Costing_System,'
      '  Use_Revenue_Centres = :Use_Revenue_Centres,'
      '  Default_Quote_Valid_days = :Default_Quote_Valid_days,'
      '  Default_Quote_Follow_Up_days = :Default_Quote_Follow_Up_days,'
      '  Contract_Drawing_Folder_Name = :Contract_Drawing_Folder_Name,'
      '  Contract_Inactive_Reason = :Contract_Inactive_Reason,'
      '  Def_Remedial_Product_Code = :Def_Remedial_Product_Code,'
      '  Template_Docs_Out = :Template_Docs_Out,'
      '  Template_Docs_In = :Template_Docs_In,'
      '  Fitting_Docs_Out = :Fitting_Docs_Out,'
      '  Fitting_Docs_In = :Fitting_Docs_In,'
      '  Use_Document_Transfer = :Use_Document_Transfer,'
      '  Quotation_Document_Folder = :Quotation_Document_Folder,'
      '  Safety_Document_Folder = :Safety_Document_Folder,'
      '  Remedial_Document_Folder = :Remedial_Document_Folder,'
      '  Plan_Document_Folder = :Plan_Document_Folder,'
      '  Use_Remedials_As_Orders = :Use_Remedials_As_Orders,'
      '  Stock_System = :Stock_System'
      'WHERE Company = 1')
    Left = 676
    Top = 280
    ParamData = <
      item
        Name = 'Company_Name'
        ParamType = ptInput
      end
      item
        Name = 'Street'
        ParamType = ptInput
      end
      item
        Name = 'Locale'
        ParamType = ptInput
      end
      item
        Name = 'Town_City'
        ParamType = ptInput
      end
      item
        Name = 'Postcode'
        ParamType = ptInput
      end
      item
        Name = 'County_State'
        ParamType = ptInput
      end
      item
        Name = 'Telephone_Number'
        ParamType = ptInput
      end
      item
        Name = 'Fax_Number'
        ParamType = ptInput
      end
      item
        Name = 'Web_Address'
        ParamType = ptInput
      end
      item
        Name = 'Email_Address'
        ParamType = ptInput
      end
      item
        Name = 'COMPANY_REG_NUMBER'
        ParamType = ptInput
      end
      item
        Name = 'Vat_Number'
        ParamType = ptInput
      end
      item
        Name = 'Unique_Tax_Reference'
        ParamType = ptInput
      end
      item
        Name = 'Install_Rate'
        ParamType = ptInput
      end
      item
        Name = 'Survey_Rate'
        ParamType = ptInput
      end
      item
        Name = 'Delivery_Rate'
        ParamType = ptInput
      end
      item
        Name = 'Discount_Rate'
        ParamType = ptInput
      end
      item
        Name = 'Deposit_Terms'
        ParamType = ptInput
      end
      item
        Name = 'Underslip_Thickness'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Upstand_Polish_Price'
        ParamType = ptInput
      end
      item
        Name = 'Upstand_Polish_Cost'
        ParamType = ptInput
      end
      item
        Name = 'Quote_Prefix'
        ParamType = ptInput
      end
      item
        Name = 'Job_Prefix'
        ParamType = ptInput
      end
      item
        Name = 'Default_Vat'
        ParamType = ptInput
      end
      item
        Name = 'Nominal_Level'
        ParamType = ptInput
      end
      item
        Name = 'Default_Sales_Nominal'
        ParamType = ptInput
      end
      item
        Name = 'Default_Purchase_Nominal'
        ParamType = ptInput
      end
      item
        Name = 'Accounts_Package'
        ParamType = ptInput
      end
      item
        Name = 'Data_Export_Directory'
        ParamType = ptInput
      end
      item
        Name = 'Last_File_No_Inv'
        ParamType = ptInput
      end
      item
        Name = 'Sales_Email'
        ParamType = ptInput
      end
      item
        Name = 'Production_Email'
        ParamType = ptInput
      end
      item
        Name = 'Customer_Document_Directory'
        ParamType = ptInput
      end
      item
        Name = 'Supplier_Document_Directory'
        ParamType = ptInput
      end
      item
        Name = 'Quote_Document_Directory'
        ParamType = ptInput
      end
      item
        Name = 'Sales_Document_Directory'
        ParamType = ptInput
      end
      item
        Name = 'Job_Document_Directory'
        ParamType = ptInput
      end
      item
        Name = 'Contract_Document_Directory'
        ParamType = ptInput
      end
      item
        Name = 'Default_Mileage_Rate'
        ParamType = ptInput
      end
      item
        Name = 'Default_Labour_Rate'
        ParamType = ptInput
      end
      item
        Name = 'Default_Handling_Rate'
        ParamType = ptInput
      end
      item
        Name = 'Waste_Cost_Multiplier'
        ParamType = ptInput
      end
      item
        Name = 'Schedule_Package'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Shared_Folder'
        ParamType = ptInput
      end
      item
        Name = 'Template_Conditions_File'
        ParamType = ptInput
      end
      item
        Name = 'Sales_Order_Terms_File'
        ParamType = ptInput
      end
      item
        Name = 'Sales_Availability_File'
        ParamType = ptInput
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Account_Manager'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sales_Lead_Source'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer_Sales_Lead_Source'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Website_Image_Directory'
        ParamType = ptInput
      end
      item
        Name = 'Terms'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Retail_Payment_Terms'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Availability'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Invoice_Payment_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Retail_Payment_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Factored_Payment_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Email_Retail_Quote_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Email_Quotation_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Email_Invoice_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Email_Sales_Confirm_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Email_Fitting_Confirm_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Email_Retail_SO_Confirm_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Email_Purchase_Order_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Order_Confirmation_Notes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Use_Purchase_Ordering'
        ParamType = ptInput
      end
      item
        Name = 'Use_Contract_Quoting'
        ParamType = ptInput
      end
      item
        Name = 'Contract_Quote_By_Slab'
        ParamType = ptInput
      end
      item
        Name = 'Prices_Are_Trade'
        ParamType = ptInput
      end
      item
        Name = 'Balance_Required_Before_Fit'
        ParamType = ptInput
      end
      item
        Name = 'Use_Onstop'
        ParamType = ptInput
      end
      item
        Name = 'Mandatory_Temp_Fit_Dates'
        ParamType = ptInput
      end
      item
        Name = 'Use_Trade_Layout'
        ParamType = ptInput
      end
      item
        Name = 'Use_Costing_System'
        ParamType = ptInput
      end
      item
        Name = 'Use_Revenue_Centres'
        ParamType = ptInput
      end
      item
        Name = 'Default_Quote_Valid_days'
        ParamType = ptInput
      end
      item
        Name = 'Default_Quote_Follow_Up_days'
        ParamType = ptInput
      end
      item
        Name = 'Contract_Drawing_Folder_Name'
        ParamType = ptInput
      end
      item
        Name = 'Contract_Inactive_Reason'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Def_Remedial_Product_Code'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Template_Docs_Out'
        ParamType = ptInput
      end
      item
        Name = 'Template_Docs_In'
        ParamType = ptInput
      end
      item
        Name = 'Fitting_Docs_Out'
        ParamType = ptInput
      end
      item
        Name = 'Fitting_Docs_In'
        ParamType = ptInput
      end
      item
        Name = 'Use_Document_Transfer'
        ParamType = ptInput
      end
      item
        Name = 'Quotation_Document_Folder'
        ParamType = ptInput
      end
      item
        Name = 'Safety_Document_Folder'
        ParamType = ptInput
      end
      item
        Name = 'Remedial_Document_Folder'
        ParamType = ptInput
      end
      item
        Name = 'PLAN_DOCUMENT_FOLDER'
        ParamType = ptInput
      end
      item
        Name = 'Use_Remedials_As_Orders'
        ParamType = ptInput
      end
      item
        Name = 'Stock_System'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryCustSalesSource: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Lead_Source,'
      '        Sales_Lead_Source_Descr'
      'FROM Sales_Lead_Source'
      
        'WHERE (Inactive = '#39'N'#39') OR (Sales_Lead_Source = :Sales_Lead_Sourc' +
        'e)'
      'ORDER BY Sales_Lead_Source_Descr')
    Left = 468
    Top = 400
    ParamData = <
      item
        Name = 'Sales_Lead_Source'
      end>
  end
  object dtsCustSalesSource: TDataSource
    DataSet = qryCustSalesSource
    Left = 588
    Top = 448
  end
  object qryInactiveReason: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT * '
      'FROM Inactive_Reason'
      'ORDER BY Inactive_Reason_Descr')
    Left = 612
    Top = 216
  end
  object dtsInactiveReason: TDataSource
    DataSet = qryInactiveReason
    Left = 660
    Top = 216
  end
  object qryGetProduct: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Product'
      'WHERE Product = :Product')
    Left = 568
    Top = 24
    ParamData = <
      item
        Name = 'Product'
      end>
  end
  object qryStockSystem: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Stock_System'
      'ORDER BY Stock_System_Description')
    Left = 428
    Top = 344
  end
  object dtsStockSystem: TDataSource
    DataSet = qryStockSystem
    Left = 508
    Top = 344
  end
end
