object PBMaintCompanyFrm: TPBMaintCompanyFrm
  Left = 307
  Top = 7
  Caption = 'Company Details'
  ClientHeight = 596
  ClientWidth = 626
  Color = clBtnFace
  Constraints.MinHeight = 626
  Constraints.MinWidth = 642
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object tbSettings: TPageControl
    Left = 0
    Top = 39
    Width = 626
    Height = 497
    ActivePage = tbsProduction
    Align = alClient
    TabOrder = 0
    object tbsAddress: TTabSheet
      Caption = 'Address'
      object Label5: TLabel
        Left = 8
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Street'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 140
        Width = 45
        Height = 13
        Caption = 'Postcode'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 198
        Width = 31
        Height = 13
        Caption = 'Phone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 228
        Width = 17
        Height = 13
        Caption = 'Fax'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 266
        Width = 25
        Height = 13
        Caption = 'Email'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 8
        Top = 358
        Width = 64
        Height = 13
        Caption = 'VAT Reg No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label38: TLabel
        Left = 8
        Top = 332
        Width = 87
        Height = 13
        Caption = 'Company Reg No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label39: TLabel
        Left = 8
        Top = 291
        Width = 23
        Height = 13
        Caption = 'Web'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label69: TLabel
        Left = 8
        Top = 388
        Width = 85
        Height = 13
        Caption = 'Registered Office.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object BuildingEdit: TEdit
        Left = 102
        Top = 16
        Width = 251
        Height = 21
        MaxLength = 40
        TabOrder = 0
        Text = 'BuildingEdit'
      end
      object StreetEdit: TEdit
        Left = 102
        Top = 46
        Width = 251
        Height = 21
        MaxLength = 40
        TabOrder = 1
        Text = 'StreetEdit'
      end
      object LocaleEdit: TEdit
        Left = 102
        Top = 76
        Width = 251
        Height = 21
        MaxLength = 40
        TabOrder = 2
        Text = 'LocaleEdit'
      end
      object TownEdit: TEdit
        Left = 102
        Top = 106
        Width = 251
        Height = 21
        MaxLength = 40
        TabOrder = 3
        Text = 'TownEdit'
      end
      object PostCodeEdit: TEdit
        Left = 102
        Top = 136
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 4
        Text = 'POSTCODEEDIT'
      end
      object PhoneEdit: TEdit
        Left = 102
        Top = 190
        Width = 139
        Height = 21
        MaxLength = 20
        TabOrder = 5
        Text = 'PhoneEdit'
      end
      object FaxEdit: TEdit
        Left = 102
        Top = 220
        Width = 139
        Height = 21
        MaxLength = 20
        TabOrder = 6
        Text = 'FaxEdit'
      end
      object EMailEdit: TEdit
        Left = 102
        Top = 262
        Width = 252
        Height = 21
        MaxLength = 40
        TabOrder = 7
        Text = 'EMailEdit'
      end
      object GroupBox2: TGroupBox
        Left = 248
        Top = 168
        Width = 185
        Height = 81
        Caption = 'Supplier'
        ParentBackground = False
        TabOrder = 11
        object Label13: TLabel
          Left = 13
          Top = 26
          Width = 31
          Height = 13
          Caption = 'Phone'
          WordWrap = True
        end
        object Label14: TLabel
          Left = 14
          Top = 58
          Width = 17
          Height = 13
          Caption = 'Fax'
          WordWrap = True
        end
        object SuppFaxEdit: TEdit
          Left = 56
          Top = 54
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'SuppFaxEdit'
        end
        object SuppPhoneEdit: TEdit
          Left = 56
          Top = 22
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'SuppPhoneEdit'
        end
      end
      object DelivNotesBitBtn: TBitBtn
        Left = 264
        Top = 136
        Width = 89
        Height = 25
        Caption = 'Deliv Narr'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 12
        OnClick = DelivNotesBitBtnClick
      end
      object VATRegEdit: TEdit
        Left = 102
        Top = 354
        Width = 252
        Height = 21
        MaxLength = 40
        TabOrder = 10
        Text = 'VATRegEdit'
      end
      object edtCompanyRegNo: TEdit
        Left = 102
        Top = 328
        Width = 252
        Height = 21
        MaxLength = 40
        TabOrder = 9
        Text = 'edtCompanyRegNo'
      end
      object edtWebAddress: TEdit
        Left = 102
        Top = 287
        Width = 252
        Height = 21
        MaxLength = 40
        TabOrder = 8
        Text = 'edtWebAddress'
      end
      object edtRegOfficeAddress: TEdit
        Left = 102
        Top = 384
        Width = 515
        Height = 21
        TabOrder = 13
        Text = 'edtRegOfficeAddress'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Accounts'
      ImageIndex = 1
      object Label2: TLabel
        Left = 8
        Top = 12
        Width = 79
        Height = 13
        Caption = 'Default Currency'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 42
        Width = 112
        Height = 13
        Caption = 'Nominal Accounting by:'
      end
      object Label3: TLabel
        Left = 8
        Top = 67
        Width = 123
        Height = 13
        Caption = 'Purchase Nominal Default'
      end
      object Label4: TLabel
        Left = 8
        Top = 94
        Width = 104
        Height = 13
        Caption = 'Sales Nominal Default'
      end
      object Label15: TLabel
        Left = 8
        Top = 146
        Width = 82
        Height = 13
        Caption = 'Commission Type'
      end
      object Label16: TLabel
        Left = 8
        Top = 200
        Width = 81
        Height = 13
        Caption = 'Default Vat Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 8
        Top = 171
        Width = 57
        Height = 13
        Caption = 'Budget type'
      end
      object lblCashSaleAccount: TLabel
        Left = 8
        Top = 120
        Width = 124
        Height = 13
        Caption = 'Cash Sales Account Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label48: TLabel
        Left = 248
        Top = 325
        Width = 113
        Height = 13
        Caption = 'Default Payment Terms:'
      end
      object Label67: TLabel
        Left = 368
        Top = 12
        Width = 113
        Height = 13
        Caption = 'Direct Debit Account ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label70: TLabel
        Left = 8
        Top = 444
        Width = 137
        Height = 13
        Caption = 'Global Invoice Email Address'
      end
      object DefCurrDBLookupComboBox: TDBLookupComboBox
        Left = 138
        Top = 8
        Width = 203
        Height = 21
        KeyField = 'Currency_Code'
        ListField = 'Currency_Code_Descr'
        ListSource = GetCurrSRC
        TabOrder = 0
      end
      object AccCustCheckBox: TCheckBox
        Left = 3
        Top = 282
        Width = 193
        Height = 17
        Caption = 'Customer Account Codes Unique'
        TabOrder = 10
      end
      object AccSuppCheckBox: TCheckBox
        Left = 247
        Top = 282
        Width = 181
        Height = 17
        Caption = 'Supplier Account Codes Unique'
        TabOrder = 13
      end
      object NominalDBLookupComboBox: TDBLookupComboBox
        Left = 138
        Top = 38
        Width = 201
        Height = 21
        KeyField = 'Nominal_level'
        ListField = 'Nominal_Level_Description'
        ListFieldIndex = 1
        ListSource = GetNominalSRC
        TabOrder = 1
      end
      object dblucmbbxCommission: TDBLookupComboBox
        Left = 138
        Top = 142
        Width = 201
        Height = 21
        KeyField = 'Commission_type'
        ListField = 'Commission_Description'
        ListFieldIndex = 1
        ListSource = dtdrcCommission
        TabOrder = 2
      end
      object chkbxAssignPIN: TCheckBox
        Left = 3
        Top = 240
        Width = 232
        Height = 17
        Caption = 'Assign PIN Reference to Purchase Invoices'
        TabOrder = 7
      end
      object DBLuCmbBxDefVat: TDBLookupComboBox
        Left = 138
        Top = 195
        Width = 201
        Height = 21
        KeyField = 'Vat_Code'
        ListField = 'Description'
        ListSource = DsVat
        TabOrder = 3
      end
      object cmbBudgetType: TComboBox
        Left = 138
        Top = 166
        Width = 201
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        Items.Strings = (
          'Rep'
          'Rep & Category')
      end
      object chkbxOnstop: TCheckBox
        Left = 3
        Top = 220
        Width = 246
        Height = 17
        Caption = 'Don'#39't raise sales orders if customer ON STOP'
        TabOrder = 5
      end
      object edtCashSalesAcc: TEdit
        Left = 138
        Top = 115
        Width = 121
        Height = 21
        MaxLength = 8
        TabOrder = 6
      end
      object grpbxAuthorisePO: TGroupBox
        Left = 3
        Top = 354
        Width = 265
        Height = 47
        Caption = 'grpbxAuthorisePO'
        ParentBackground = False
        TabOrder = 15
        object Label20: TLabel
          Left = 8
          Top = 24
          Width = 140
          Height = 13
          Caption = 'Maximum Unauthorised Value'
        end
        object chkbxAuthorisePO: TCheckBox
          Left = 8
          Top = -3
          Width = 147
          Height = 17
          Caption = 'Authorise Purchase Orders'
          TabOrder = 0
          OnClick = chkbxAuthorisePOClick
        end
        object memCreditLimit: TMemo
          Left = 159
          Top = 19
          Width = 90
          Height = 23
          Alignment = taRightJustify
          TabOrder = 1
          WantReturns = False
          WordWrap = False
          OnExit = memCreditLimitExit
        end
      end
      object chkbxCustMandatory: TCheckBox
        Left = 3
        Top = 261
        Width = 193
        Height = 17
        Caption = 'Customer Account Codes Mandatory'
        TabOrder = 9
      end
      object chkbxSuppMandatory: TCheckBox
        Left = 247
        Top = 261
        Width = 193
        Height = 17
        Caption = 'Supplier Account Codes Mandatory'
        TabOrder = 11
      end
      object PNDefEdit: TMaskEdit
        Left = 138
        Top = 65
        Width = 135
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!90009999/900/000;0;_'
        MaxLength = 16
        TabOrder = 12
        Text = ''
      end
      object SNDefEdit: TMaskEdit
        Left = 138
        Top = 89
        Width = 135
        Height = 21
        CharCase = ecUpperCase
        EditMask = '!90009999/900/000;0;_'
        MaxLength = 16
        TabOrder = 14
        Text = ''
      end
      object chkbxCanChangeInvoice: TCheckBox
        Left = 247
        Top = 220
        Width = 230
        Height = 17
        Caption = 'Can Change Sales Invoice after printing'
        TabOrder = 8
      end
      object btnPaymentNotes: TBitBtn
        Left = 275
        Top = 360
        Width = 97
        Height = 25
        Caption = 'Payment'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 16
        OnClick = btnPaymentNotesClick
      end
      object chkbxUseConInvoicing: TCheckBox
        Left = 247
        Top = 240
        Width = 230
        Height = 17
        Caption = 'Consolidated Invoicing'
        TabOrder = 17
      end
      object chkbxPaymentTerms: TCheckBox
        Left = 274
        Top = 387
        Width = 181
        Height = 17
        Caption = 'Use Invoice Notes for Terms'
        TabOrder = 18
      end
      object chkbxDefaultCustomerAccCode: TCheckBox
        Left = 3
        Top = 303
        Width = 193
        Height = 17
        Caption = 'Default Customer Account Code'
        TabOrder = 19
      end
      object chkbxDefaultSupplierAccCode: TCheckBox
        Left = 247
        Top = 303
        Width = 181
        Height = 17
        Caption = 'Default Supplier Account Codes'
        TabOrder = 20
      end
      object chkbxUseCreditCheck: TCheckBox
        Left = 3
        Top = 323
        Width = 193
        Height = 17
        Caption = 'Use Credit Checking'
        TabOrder = 21
      end
      object btnSupplierTerms: TBitBtn
        Left = 379
        Top = 360
        Width = 97
        Height = 25
        Caption = 'Supplier Terms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 22
        OnClick = btnSupplierTermsClick
      end
      object PayTermsDBLookupComboBox: TDBLookupComboBox
        Left = 378
        Top = 321
        Width = 167
        Height = 21
        KeyField = 'Payment_Terms'
        ListField = 'Payment_Terms_Description'
        ListFieldIndex = 1
        ListSource = dtsPayTerms
        TabOrder = 23
      end
      object BitBtn5: TBitBtn
        Left = 551
        Top = 320
        Width = 25
        Height = 23
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
        TabOrder = 24
        OnClick = BitBtn5Click
      end
      object btnCreditTermsNotes: TBitBtn
        Left = 483
        Top = 360
        Width = 97
        Height = 25
        Caption = 'Credit Terms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 25
        OnClick = btnCreditTermsNotesClick
      end
      object edtDirectDebitID: TEdit
        Left = 498
        Top = 8
        Width = 121
        Height = 21
        MaxLength = 8
        TabOrder = 26
      end
      object edtGlobalInvoiceEmail: TEdit
        Left = 160
        Top = 440
        Width = 345
        Height = 21
        TabOrder = 27
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'System'
      ImageIndex = 3
      object Label17: TLabel
        Left = 12
        Top = 20
        Width = 113
        Height = 33
        AutoSize = False
        Caption = 'Default Job Bag Sundry Product Type'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label47: TLabel
        Left = 276
        Top = 401
        Width = 69
        Height = 32
        AutoSize = False
        Caption = 'Replicate to database:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object chkbxFormRefReq: TCheckBox
        Left = 14
        Top = 181
        Width = 251
        Height = 17
        Caption = 'Form Reference Mandatory for Purchase Orders'
        TabOrder = 0
      end
      object DBLuCmbBxDefPrdTyp: TDBLookupComboBox
        Left = 134
        Top = 24
        Width = 195
        Height = 21
        KeyField = 'product_type'
        ListField = 'description'
        ListSource = DSPrdTyp
        TabOrder = 1
      end
      object btbtnClearProdType: TBitBtn
        Left = 344
        Top = 23
        Width = 25
        Height = 25
        Hint = 'Clear Supplier details'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btbtnClearProdTypeClick
      end
      object rdgrpJobBag: TRadioGroup
        Left = 16
        Top = 80
        Width = 201
        Height = 89
        Caption = 'When Buying Print'
        Items.Strings = (
          'Never create a Job Bag'
          'Prompt to create a Job Bag'
          'Always create a Job Bag')
        ParentBackground = False
        TabOrder = 3
      end
      object JobBagsCheckBox: TCheckBox
        Left = 14
        Top = 53
        Width = 89
        Height = 17
        Caption = 'Use Job Bags'
        TabOrder = 4
        OnClick = JobBagsCheckBoxClick
      end
      object chkbxMatchPOs: TCheckBox
        Left = 14
        Top = 203
        Width = 219
        Height = 17
        Caption = 'Match Purchase Orders to Invoices'
        TabOrder = 5
        OnClick = JobBagsCheckBoxClick
      end
      object chkbxUseRevenueCentres: TCheckBox
        Left = 14
        Top = 226
        Width = 219
        Height = 17
        Caption = 'Use Revenue Centres'
        TabOrder = 6
        OnClick = JobBagsCheckBoxClick
      end
      object chkbxUseAccManagers: TCheckBox
        Left = 14
        Top = 249
        Width = 249
        Height = 17
        Caption = 'Use Account Managers'
        TabOrder = 7
      end
      object chkbxUseProduction: TCheckBox
        Left = 278
        Top = 181
        Width = 155
        Height = 17
        Caption = 'Use Production Module'
        TabOrder = 8
      end
      object chkbxDontDefaultDelivery: TCheckBox
        Left = 14
        Top = 296
        Width = 227
        Height = 17
        Caption = 'Don'#39't default Purchase Order Deliveries'
        TabOrder = 9
      end
      object chkbxUseJBCosts: TCheckBox
        Left = 14
        Top = 272
        Width = 211
        Height = 17
        Caption = 'Include Costs in Job Bag Charges'
        TabOrder = 10
      end
      object chkbxUseFSC: TCheckBox
        Left = 14
        Top = 320
        Width = 227
        Height = 17
        Caption = 'Use FCS Material Claim'
        TabOrder = 11
      end
      object chkbxUseNCA: TCheckBox
        Left = 14
        Top = 344
        Width = 235
        Height = 17
        Caption = 'Use Non Conformance Advice'
        TabOrder = 12
      end
      object chkbxDefSODeliveries: TCheckBox
        Left = 278
        Top = 226
        Width = 163
        Height = 17
        Caption = 'Default Sales Order Deliveries'
        TabOrder = 15
      end
      object chkbxConfirmProduction: TCheckBox
        Left = 278
        Top = 203
        Width = 155
        Height = 17
        Caption = 'Confirm Production'
        TabOrder = 16
      end
      object cmbAliasList: TComboBox
        Left = 352
        Top = 405
        Width = 161
        Height = 21
        Style = csDropDownList
        TabOrder = 17
      end
      object BitBtn4: TBitBtn
        Left = 520
        Top = 403
        Width = 25
        Height = 26
        Hint = 'Clear Supplier details'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        OnClick = BitBtn4Click
      end
      object chkbxDefaultVat: TCheckBox
        Left = 278
        Top = 249
        Width = 163
        Height = 17
        Caption = 'Default Buy Print Vat Rate'
        TabOrder = 19
      end
      object chkbxUsePackPricing: TCheckBox
        Left = 278
        Top = 296
        Width = 163
        Height = 17
        Caption = 'Use Pack Pricing'
        TabOrder = 20
      end
      object chkbxUseProspects: TCheckBox
        Left = 278
        Top = 320
        Width = 163
        Height = 17
        Caption = 'Use Prospect System'
        TabOrder = 21
      end
      object grpbxReorderReminder: TGroupBox
        Left = 272
        Top = 80
        Width = 281
        Height = 73
        ParentBackground = False
        TabOrder = 22
        object Label49: TLabel
          Left = 198
          Top = 23
          Width = 35
          Height = 13
          Caption = 'Months'
        end
        object Label50: TLabel
          Left = 30
          Top = 23
          Width = 47
          Height = 13
          Caption = 'Remind in'
        end
        object Label51: TLabel
          Left = 30
          Top = 47
          Width = 100
          Height = 13
          Caption = 'Minimum Sales Value'
        end
        object spnReorderReminderInterval: TSpinEdit
          Left = 136
          Top = 18
          Width = 49
          Height = 22
          MaxValue = 120
          MinValue = 1
          TabOrder = 0
          Value = 1
        end
        object memReOrderValue: TMemo
          Left = 135
          Top = 43
          Width = 90
          Height = 23
          Alignment = taRightJustify
          TabOrder = 1
          WantReturns = False
          WordWrap = False
          OnExit = memReOrderValueExit
        end
      end
      object chkbxUseReorderReminder: TCheckBox
        Left = 280
        Top = 77
        Width = 147
        Height = 17
        Caption = 'Set PO Reorder Reminder '
        TabOrder = 23
        OnClick = chkbxUseReorderReminderClick
      end
      object chkbxDefaultDeliveryViaCompany: TCheckBox
        Left = 278
        Top = 272
        Width = 163
        Height = 17
        Caption = 'Default Delivery Via Company'
        TabOrder = 24
      end
      object chkbxUseCRM: TCheckBox
        Left = 278
        Top = 344
        Width = 163
        Height = 17
        Caption = 'Use CRM System'
        TabOrder = 25
      end
      object chkbxUseSubReps: TCheckBox
        Left = 14
        Top = 368
        Width = 235
        Height = 17
        Caption = 'Use Sub Reps'
        TabOrder = 13
      end
      object chkbxUseGDPR: TCheckBox
        Left = 494
        Top = 181
        Width = 83
        Height = 17
        Caption = 'Use GDPR'
        TabOrder = 26
      end
      object chkbxUseContracts: TCheckBox
        Left = 14
        Top = 392
        Width = 235
        Height = 17
        Caption = 'Use Contracts'
        TabOrder = 14
      end
      object chkbxUseAcquiredCustomers: TCheckBox
        Left = 14
        Top = 416
        Width = 235
        Height = 17
        Caption = 'Use Reseller Customers'
        TabOrder = 27
      end
      object chkbxUseCTRLPOrdering: TCheckBox
        Left = 14
        Top = 440
        Width = 235
        Height = 17
        Caption = 'Use CTRL-P Ordering'
        TabOrder = 28
      end
      object chkbxUseSAPIntegration: TCheckBox
        Left = 278
        Top = 368
        Width = 163
        Height = 17
        Caption = 'Use SAP Integration'
        TabOrder = 29
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Folders'
      ImageIndex = 4
      object Label18: TLabel
        Left = 12
        Top = 107
        Width = 79
        Height = 13
        Caption = 'Purchase Orders'
      end
      object Label21: TLabel
        Left = 12
        Top = 18
        Width = 43
        Height = 13
        Caption = 'Enquiries'
      end
      object Label22: TLabel
        Left = 12
        Top = 152
        Width = 44
        Height = 13
        Caption = 'Job Bags'
      end
      object Label23: TLabel
        Left = 12
        Top = 62
        Width = 34
        Height = 13
        Caption = 'Quotes'
      end
      object Label27: TLabel
        Left = 12
        Top = 195
        Width = 49
        Height = 13
        Caption = 'Customers'
      end
      object Label28: TLabel
        Left = 12
        Top = 239
        Width = 43
        Height = 13
        Caption = 'Suppliers'
      end
      object Label60: TLabel
        Left = 12
        Top = 281
        Width = 42
        Height = 13
        Caption = 'Activities'
      end
      object Label61: TLabel
        Left = 12
        Top = 368
        Width = 65
        Height = 13
        Caption = 'Email Storage'
      end
      object Label68: TLabel
        Left = 12
        Top = 323
        Width = 45
        Height = 13
        Caption = 'Contracts'
      end
      object edtPOLocation: TEdit
        Left = 12
        Top = 123
        Width = 317
        Height = 21
        TabOrder = 6
      end
      object btnBrowse: TButton
        Left = 342
        Top = 121
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 7
        OnClick = btnBrowseClick
      end
      object edtEnquiryLocation: TEdit
        Left = 12
        Top = 34
        Width = 317
        Height = 21
        TabOrder = 0
      end
      object Button1: TButton
        Left = 342
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 1
        OnClick = Button1Click
      end
      object edtJobBagLocation: TEdit
        Left = 12
        Top = 166
        Width = 317
        Height = 21
        TabOrder = 9
      end
      object Button2: TButton
        Left = 342
        Top = 164
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 10
        OnClick = Button2Click
      end
      object edtQuoteLocation: TEdit
        Left = 12
        Top = 78
        Width = 317
        Height = 21
        TabOrder = 3
      end
      object Button3: TButton
        Left = 342
        Top = 76
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 4
        OnClick = Button3Click
      end
      object edtCustLocation: TEdit
        Left = 12
        Top = 209
        Width = 317
        Height = 21
        TabOrder = 12
      end
      object Button4: TButton
        Left = 342
        Top = 207
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 13
        OnClick = Button4Click
      end
      object edtSuppLocation: TEdit
        Left = 12
        Top = 253
        Width = 317
        Height = 21
        TabOrder = 15
      end
      object Button5: TButton
        Left = 342
        Top = 251
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 16
        OnClick = Button5Click
      end
      object edtActivityLocation: TEdit
        Left = 12
        Top = 295
        Width = 317
        Height = 21
        TabOrder = 18
      end
      object Button8: TButton
        Left = 342
        Top = 293
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 19
        OnClick = Button8Click
      end
      object btnEnquiryStructure: TButton
        Tag = 20
        Left = 462
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 2
        OnClick = btnEnquiryStructureClick
      end
      object Button9: TButton
        Tag = 25
        Left = 462
        Top = 76
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 5
        OnClick = btnEnquiryStructureClick
      end
      object Button10: TButton
        Tag = 30
        Left = 462
        Top = 121
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 8
        OnClick = btnEnquiryStructureClick
      end
      object Button11: TButton
        Tag = 40
        Left = 462
        Top = 164
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 11
        OnClick = btnEnquiryStructureClick
      end
      object Button12: TButton
        Tag = 10
        Left = 462
        Top = 207
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 14
        OnClick = btnEnquiryStructureClick
      end
      object Button13: TButton
        Tag = 15
        Left = 462
        Top = 251
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 17
        OnClick = btnEnquiryStructureClick
      end
      object Button14: TButton
        Tag = 60
        Left = 462
        Top = 293
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 20
        OnClick = btnEnquiryStructureClick
      end
      object edtEmailStorage: TEdit
        Left = 12
        Top = 382
        Width = 317
        Height = 21
        TabOrder = 24
      end
      object Button15: TButton
        Left = 342
        Top = 380
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 25
        OnClick = Button15Click
      end
      object edtContractLocation: TEdit
        Left = 12
        Top = 337
        Width = 317
        Height = 21
        TabOrder = 21
      end
      object Button18: TButton
        Left = 342
        Top = 335
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 22
        OnClick = Button18Click
      end
      object Button19: TButton
        Tag = 60
        Left = 462
        Top = 335
        Width = 75
        Height = 25
        Caption = 'Structure'
        TabOrder = 23
        OnClick = btnEnquiryStructureClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Stock'
      ImageIndex = 2
      object GroupBox1: TGroupBox
        Left = 8
        Top = 16
        Width = 369
        Height = 89
        Caption = 'Default Call Off Supplier'
        ParentBackground = False
        TabOrder = 0
        object Label11: TLabel
          Left = 16
          Top = 32
          Width = 28
          Height = 13
          Caption = 'Name'
        end
        object Label12: TLabel
          Left = 16
          Top = 59
          Width = 34
          Height = 13
          Caption = 'Branch'
        end
        object SupplierEdit: TEdit
          Left = 64
          Top = 24
          Width = 233
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object BranchEdit: TEdit
          Left = 64
          Top = 51
          Width = 233
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object SelSuppBtn: TBitBtn
          Left = 304
          Top = 24
          Width = 25
          Height = 25
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = SelSuppBtnClick
        end
        object ClearBitBtn: TBitBtn
          Left = 336
          Top = 24
          Width = 25
          Height = 25
          Hint = 'Clear Supplier details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = ClearBitBtnClick
        end
      end
      object chkbxStockVersions: TCheckBox
        Left = 8
        Top = 120
        Width = 193
        Height = 17
        Caption = 'Allow entry of Stock Versions'
        TabOrder = 1
      end
      object chkbxProductPrefix: TCheckBox
        Left = 8
        Top = 141
        Width = 193
        Height = 17
        Caption = 'Product Prefix not Required'
        TabOrder = 2
      end
      object chkbxStockCodeMandatory: TCheckBox
        Left = 8
        Top = 162
        Width = 217
        Height = 17
        Caption = 'Stock Code Mandatory for Stock Orders'
        TabOrder = 3
      end
      object chkbxAllowDeliveryImbal: TCheckBox
        Left = 8
        Top = 184
        Width = 297
        Height = 17
        Caption = 'Allow Delivery Imbalance on Buy print Orders'
        TabOrder = 4
      end
    end
    object tbsProduction: TTabSheet
      Caption = 'Production'
      ImageIndex = 5
      object Label24: TLabel
        Left = 12
        Top = 242
        Width = 192
        Height = 13
        Caption = 'Default Works Instruction Email Address:'
      end
      object Label25: TLabel
        Left = 12
        Top = 284
        Width = 99
        Height = 13
        Caption = 'Corresponding Name'
      end
      object edtWIEmailAddress: TEdit
        Left = 12
        Top = 258
        Width = 437
        Height = 21
        TabOrder = 0
      end
      object edtWIEmailName: TEdit
        Left = 12
        Top = 300
        Width = 197
        Height = 21
        TabOrder = 1
      end
      object chkbxShowWIPurchaseOrders: TCheckBox
        Left = 12
        Top = 336
        Width = 249
        Height = 17
        Caption = 'Show Purchase Orders on Works Instruction'
        TabOrder = 2
      end
      object GroupBox5: TGroupBox
        Left = 12
        Top = 16
        Width = 597
        Height = 201
        Caption = 'Quoting - Default Cost Charge'
        ParentBackground = False
        TabOrder = 3
        object Label62: TLabel
          Left = 25
          Top = 30
          Width = 55
          Height = 13
          Caption = 'Department'
        end
        object Label63: TLabel
          Left = 24
          Top = 60
          Width = 38
          Height = 13
          Caption = 'Process'
        end
        object Label64: TLabel
          Left = 24
          Top = 88
          Width = 53
          Height = 13
          Caption = 'Description'
        end
        object Label65: TLabel
          Left = 24
          Top = 176
          Width = 47
          Height = 13
          Caption = 'Markup %'
        end
        object edtQuoteDescription: TMemo
          Left = 112
          Top = 88
          Width = 457
          Height = 73
          Lines.Strings = (
            'edtDescription')
          TabOrder = 0
        end
        object memQuoteCostMarkup: TMemo
          Left = 111
          Top = 171
          Width = 90
          Height = 23
          Alignment = taRightJustify
          TabOrder = 1
          WantReturns = False
          WordWrap = False
          OnExit = memQuoteCostMarkupExit
        end
        object dblkpProcessGroup: TDBLookupComboBox
          Left = 112
          Top = 26
          Width = 185
          Height = 21
          KeyField = 'Process_Group'
          ListField = 'Process_Group_Description'
          ListSource = dtsProcessGroup
          TabOrder = 2
        end
        object dblkpProcess: TDBLookupComboBox
          Left = 112
          Top = 56
          Width = 185
          Height = 21
          KeyField = 'Process'
          ListField = 'Process_Description'
          ListSource = dtsProcess
          TabOrder = 3
        end
        object BitBtn6: TBitBtn
          Left = 343
          Top = 25
          Width = 25
          Height = 23
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
          TabOrder = 4
          OnClick = BitBtn6Click
        end
        object btnProdType: TButton
          Left = 308
          Top = 54
          Width = 25
          Height = 25
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = btnProdTypeClick
        end
        object Button16: TButton
          Left = 308
          Top = 24
          Width = 25
          Height = 25
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = Button16Click
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Email Settings'
      ImageIndex = 6
      object btnEmailHelp: TSpeedButton
        Left = 416
        Top = 24
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
      object SpeedButton1: TSpeedButton
        Left = 416
        Top = 104
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
      object SpeedButton2: TSpeedButton
        Left = 416
        Top = 184
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
      object SpeedButton3: TSpeedButton
        Left = 416
        Top = 256
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
      object SpeedButton4: TSpeedButton
        Left = 416
        Top = 328
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
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 618
        Height = 469
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Enquiries'
          object Label29: TLabel
            Left = 16
            Top = 16
            Width = 82
            Height = 13
            Caption = 'Enquiry Preamble'
          end
          object Label32: TLabel
            Left = 16
            Top = 152
            Width = 76
            Height = 13
            Caption = 'Quote Preamble'
          end
          object memEmailEnquiry: TMemo
            Left = 16
            Top = 32
            Width = 585
            Height = 100
            Lines.Strings = (
              'Memo2')
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object memEmailQuote: TMemo
            Left = 16
            Top = 168
            Width = 585
            Height = 100
            Lines.Strings = (
              'Memo2')
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Buy Print'
          ImageIndex = 1
          object Label30: TLabel
            Left = 16
            Top = 16
            Width = 121
            Height = 13
            Caption = 'Purchase Order Preamble'
          end
          object Label31: TLabel
            Left = 16
            Top = 152
            Width = 135
            Height = 13
            Caption = 'Acknowledgement Preamble'
          end
          object Label71: TLabel
            Left = 16
            Top = 288
            Width = 49
            Height = 13
            Caption = 'Order Due'
          end
          object memEmailPO: TMemo
            Left = 16
            Top = 32
            Width = 585
            Height = 100
            Lines.Strings = (
              'Memo2')
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object memEmailAck: TMemo
            Left = 16
            Top = 168
            Width = 585
            Height = 100
            Lines.Strings = (
              'Memo2')
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object memEmailOrdersDue: TMemo
            Left = 16
            Top = 304
            Width = 585
            Height = 100
            Lines.Strings = (
              'Memo2')
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Job Bags'
          ImageIndex = 2
          object Label72: TLabel
            Left = 16
            Top = 16
            Width = 80
            Height = 13
            Caption = 'Proforma Invoice'
          end
          object memEmailProformaInvoice: TMemo
            Left = 16
            Top = 32
            Width = 585
            Height = 100
            Lines.Strings = (
              'Memo2')
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'Invoicing'
          ImageIndex = 3
          object Label33: TLabel
            Left = 16
            Top = 16
            Width = 90
            Height = 13
            Caption = 'Invoicing Preamble'
          end
          object memEmailInvoice: TMemo
            Left = 16
            Top = 32
            Width = 585
            Height = 125
            Lines.Strings = (
              'Memo2')
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Web Ordering'
      ImageIndex = 7
      object GroupBox3: TGroupBox
        Left = 8
        Top = 8
        Width = 369
        Height = 161
        Caption = 'Delivery Charge'
        ParentBackground = False
        TabOrder = 0
        object Label34: TLabel
          Left = 16
          Top = 32
          Width = 53
          Height = 13
          Caption = 'Description'
        end
        object Label35: TLabel
          Left = 16
          Top = 112
          Width = 21
          Height = 13
          Caption = 'Cost'
        end
        object Label36: TLabel
          Left = 16
          Top = 88
          Width = 34
          Height = 13
          Caption = 'Charge'
        end
        object Label37: TLabel
          Left = 16
          Top = 136
          Width = 21
          Height = 13
          Caption = 'VAT'
        end
        object Label40: TLabel
          Left = 16
          Top = 64
          Width = 84
          Height = 13
          Caption = 'Charge Threshold'
        end
        object edtDeliveryDescription: TEdit
          Left = 108
          Top = 28
          Width = 213
          Height = 21
          TabOrder = 0
        end
        object memDeliveryCharge: TMemo
          Left = 108
          Top = 84
          Width = 75
          Height = 21
          Alignment = taRightJustify
          TabOrder = 1
          WantReturns = False
          WordWrap = False
          OnEnter = SaveValue
          OnExit = ValidateMoney
        end
        object memDeliveryCost: TMemo
          Left = 108
          Top = 108
          Width = 75
          Height = 21
          Alignment = taRightJustify
          TabOrder = 2
          WantReturns = False
          WordWrap = False
          OnEnter = SaveValue
          OnExit = ValidateMoney
        end
        object dblkpDeliveryVat: TDBLookupComboBox
          Left = 108
          Top = 132
          Width = 141
          Height = 21
          KeyField = 'Vat_Code'
          ListField = 'Description'
          ListSource = dtsOnlineVAT
          TabOrder = 3
        end
        object memDeliveryThreshold: TMemo
          Left = 108
          Top = 60
          Width = 75
          Height = 21
          Alignment = taRightJustify
          TabOrder = 4
          WantReturns = False
          WordWrap = False
          OnEnter = SaveValue
          OnExit = ValidateMoney
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 184
        Width = 369
        Height = 89
        Caption = 'Web2Print Ordering'
        ParentBackground = False
        TabOrder = 1
        object Label45: TLabel
          Left = 16
          Top = 28
          Width = 101
          Height = 13
          Caption = 'Unpaid Product Type'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 16
          Top = 60
          Width = 88
          Height = 13
          Caption = 'Paid Product Type'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dblkpWebProductType: TDBLookupComboBox
          Left = 126
          Top = 24
          Width = 187
          Height = 21
          KeyField = 'product_type'
          ListField = 'description'
          ListSource = DSPrdTyp
          TabOrder = 0
        end
        object BitBtn2: TBitBtn
          Left = 328
          Top = 22
          Width = 25
          Height = 25
          Hint = 'Clear Supplier details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object dblkpWebPaidProductType: TDBLookupComboBox
          Left = 126
          Top = 56
          Width = 187
          Height = 21
          KeyField = 'product_type'
          ListField = 'description'
          ListSource = DSPrdTyp
          TabOrder = 2
        end
        object BitBtn3: TBitBtn
          Left = 328
          Top = 54
          Width = 25
          Height = 25
          Hint = 'Clear Supplier details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = BitBtn3Click
        end
      end
    end
    object tbsAnalysis: TTabSheet
      Caption = 'Analysis'
      ImageIndex = 9
      object Label43: TLabel
        Left = 8
        Top = 16
        Width = 114
        Height = 13
        Caption = 'Analysis Code 1 Caption'
      end
      object Label44: TLabel
        Left = 8
        Top = 48
        Width = 114
        Height = 13
        Caption = 'Analysis Code 2 Caption'
      end
      object Label53: TLabel
        Left = 8
        Top = 80
        Width = 114
        Height = 13
        Caption = 'Analysis Code 3 Caption'
      end
      object Label54: TLabel
        Left = 8
        Top = 112
        Width = 114
        Height = 13
        Caption = 'Analysis Code 4 Caption'
      end
      object edtAnalysis1Caption: TEdit
        Left = 128
        Top = 12
        Width = 361
        Height = 21
        TabOrder = 0
        Text = 'edtAnalysis1Caption'
      end
      object edtAnalysis2Caption: TEdit
        Left = 128
        Top = 44
        Width = 361
        Height = 21
        TabOrder = 1
        Text = 'edtAnalysis2Caption'
      end
      object edtAnalysis3Caption: TEdit
        Left = 128
        Top = 76
        Width = 361
        Height = 21
        TabOrder = 2
        Text = 'edtAnalysis1Caption'
      end
      object edtAnalysis4Caption: TEdit
        Left = 128
        Top = 108
        Width = 361
        Height = 21
        TabOrder = 3
        Text = 'edtAnalysis2Caption'
      end
    end
    object tbsTerms: TTabSheet
      Caption = 'Documents'
      ImageIndex = 8
      object Label41: TLabel
        Left = 8
        Top = 16
        Width = 76
        Height = 13
        Caption = 'Sales document'
      end
      object Label42: TLabel
        Left = 8
        Top = 48
        Width = 95
        Height = 13
        Caption = 'Purchase document'
      end
      object Label66: TLabel
        Left = 8
        Top = 80
        Width = 76
        Height = 13
        Caption = 'Studio Price List'
      end
      object edtSalesTermsDoc: TEdit
        Left = 112
        Top = 12
        Width = 361
        Height = 21
        TabOrder = 0
        Text = 'edtSalesTermsDoc'
      end
      object edtPurchaseTermsDoc: TEdit
        Left = 112
        Top = 44
        Width = 361
        Height = 21
        TabOrder = 1
        Text = 'edtPurchaseTermsDoc'
      end
      object Button6: TButton
        Left = 486
        Top = 12
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 2
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 486
        Top = 44
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 3
        OnClick = Button7Click
      end
      object edtStudioPriceListDoc: TEdit
        Left = 112
        Top = 76
        Width = 361
        Height = 21
        TabOrder = 4
        Text = 'edtStudioPriceListDoc'
      end
      object Button17: TButton
        Left = 486
        Top = 76
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 5
        OnClick = Button17Click
      end
    end
    object tbsCRM: TTabSheet
      Caption = 'CRM'
      ImageIndex = 10
      DesignSize = (
        618
        469)
      object Label52: TLabel
        Left = 16
        Top = 56
        Width = 168
        Height = 13
        Caption = 'Quotation Reminder Default Activity'
      end
      object Label55: TLabel
        Left = 16
        Top = 24
        Width = 157
        Height = 13
        Caption = 'Enquiry Reminder Default Activity'
      end
      object Label56: TLabel
        Left = 16
        Top = 96
        Width = 95
        Height = 13
        Caption = 'Proof Status Activity'
      end
      object Label57: TLabel
        Left = 16
        Top = 128
        Width = 75
        Height = 13
        Caption = 'Reorder Activity'
      end
      object Label58: TLabel
        Left = 16
        Top = 160
        Width = 154
        Height = 13
        Caption = 'Order Acknowlegdement Activity'
      end
      object Label59: TLabel
        Left = 16
        Top = 192
        Width = 104
        Height = 13
        Caption = 'Order Delivery Activity'
      end
      object dblkpQActivityType: TDBLookupComboBox
        Left = 210
        Top = 52
        Width = 201
        Height = 21
        KeyField = 'Activity_Type'
        ListField = 'Activity_Type_Description'
        ListFieldIndex = 1
        ListSource = dtsActivityType
        TabOrder = 0
      end
      object btnActivityType: TButton
        Left = 405
        Top = 19
        Width = 22
        Height = 22
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnActivityTypeClick
        ExplicitLeft = 421
      end
      object dblkpEActivityType: TDBLookupComboBox
        Left = 210
        Top = 20
        Width = 201
        Height = 21
        KeyField = 'Activity_Type'
        ListField = 'Activity_Type_Description'
        ListFieldIndex = 1
        ListSource = dtsActivityType
        TabOrder = 2
      end
      object dblkpProofActivity: TDBLookupComboBox
        Left = 210
        Top = 92
        Width = 201
        Height = 21
        KeyField = 'Activity_Type'
        ListField = 'Activity_Type_Description'
        ListFieldIndex = 1
        ListSource = dtsActivityType
        TabOrder = 3
      end
      object dblkpReorderActivity: TDBLookupComboBox
        Left = 210
        Top = 124
        Width = 201
        Height = 21
        KeyField = 'Activity_Type'
        ListField = 'Activity_Type_Description'
        ListFieldIndex = 1
        ListSource = dtsActivityType
        TabOrder = 4
      end
      object dblkpOrderAckActivity: TDBLookupComboBox
        Left = 210
        Top = 156
        Width = 201
        Height = 21
        KeyField = 'Activity_Type'
        ListField = 'Activity_Type_Description'
        ListFieldIndex = 1
        ListSource = dtsActivityType
        TabOrder = 5
      end
      object dblkpOrderDelActivity: TDBLookupComboBox
        Left = 210
        Top = 188
        Width = 201
        Height = 21
        KeyField = 'Activity_Type'
        ListField = 'Activity_Type_Description'
        ListFieldIndex = 1
        ListSource = dtsActivityType
        TabOrder = 6
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 536
    Width = 626
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      626
      41)
    object BitBtn1: TBitBtn
      Left = 231
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object CancelBitBtn: TBitBtn
      Left = 329
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Cancel'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      626
      39)
    object Label1: TLabel
      Left = 11
      Top = 12
      Width = 102
      Height = 14
      Caption = 'Company Name         '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object NameEdit: TEdit
      Left = 121
      Top = 8
      Width = 392
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 0
      Text = 'NameEdit'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 577
    Width = 626
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object GetCompanySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from company')
    Left = 440
    Top = 452
  end
  object UpCompanySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Company'
      'set Name = :Name,'
      '      Building_no_Name = :Building_no_Name,'
      '      Street = :Street,'
      '      Locale = :Locale,'
      '      Town = :Town,'
      '      PostCode = :Postcode,'
      '      Phone = :Phone,'
      '      Fax_Number = :Fax_Number,'
      '      EMail = :EMail,'
      '      Web_Address = :Web_Address,'
      '      Company_Reg_No = :Company_Reg_No,'
      '      VAT_Registration_No = :VAT_Registration_No,'
      '      Purch_Nom_Def=:Purch_Nom_Def,'
      '      Sales_Nom_Def=:Sales_Nom_Def,'
      '      Job_Bag_In_Use = :Job_Bag_In_Use,'
      '      Currency_Code_Def = :Currency_Code_Def,'
      '      Acc_Code_Cust_Unique = :Acc_Code_Cust_Unique,'
      '      Acc_Code_Supp_Unique = :Acc_Code_Supp_Unique,'
      '      Nominal_Level = :Nominal_Level,'
      '      Supplier = :Supplier,'
      '      Branch_no = :Branch_no ,'
      '      Supplier_Phone = :Supplier_Phone,'
      '      Supplier_Fax = :Supplier_Fax,'
      '      commission_type = :commission_type,'
      '      Delivery_Narrative = :Delivery_Narrative,'
      '      Use_PIN_Reference = :Use_PIN_Reference,'
      '      Vat_Code = :Vat_Code,'
      '      Product_Type = :Product_Type,'
      '      Document_Directory = :Document_Directory,'
      
        '      Activity_Document_Directory = :Activity_Document_Directory' +
        ','
      
        '      Customer_Document_Directory = :Customer_Document_Directory' +
        ','
      
        '      Supplier_Document_Directory = :Supplier_Document_Directory' +
        ','
      '      Quote_Document_Directory = :Quote_Document_Directory,'
      '      Job_Bag_Document_Directory = :Job_Bag_Document_Directory,'
      '      Enquiry_Document_Directory = :Enquiry_Document_Directory,'
      
        '      Contract_Document_Directory = :Contract_Document_Directory' +
        ','
      '      Form_Reference_Mandatory = :Form_Reference_Mandatory,'
      '      Performance_target_type = :Performance_target_type,'
      '      onstop = :onstop,'
      '      Cash_Sales_Account_Code = :Cash_Sales_Account_Code,'
      '      Job_Bag_is_Mandatory = :Job_Bag_is_mandatory,'
      '      Authorise_POrders = :Authorise_POrders,'
      '      Default_PO_Limit = :Default_PO_Limit,'
      '      Cust_acc_code_mandatory = :Cust_acc_code_mandatory,'
      '      Supp_acc_code_mandatory = :Supp_acc_code_mandatory,'
      '      Match_Purchase_Orders = :Match_Purchase_Orders,'
      '      Use_Account_Managers = :Use_Account_Managers,'
      '      Use_Production = :Use_Production,'
      '      Dont_Default_PO_Deliveries = :Dont_Default_PO_Deliveries,'
      '      Use_Revenue_Centres = :Use_Revenue_Centres,'
      '      Change_Invoice_After_Print = :Change_Invoice_After_Print,'
      '      Include_Job_Bag_Costs = :Include_Job_Bag_Costs,'
      '      Default_WI_Email_Address = :Default_WI_Email_Address,'
      '      Default_WI_Email_Name = :Default_WI_Email_Name,'
      '      Use_FSC_Claim = :Use_FSC_Claim,'
      '      Use_Non_Conformance = :Use_Non_Conformance,'
      '      Default_SO_Last_Delivery = :Default_SO_Last_Delivery,'
      '      Invoice_Payment_Notes = :Invoice_Payment_Notes,'
      '      Use_Consolidated_Invoicing = :Use_Consolidated_Invoicing,'
      
        '      Use_Invoice_Notes_For_Terms = :Use_Invoice_Notes_For_Terms' +
        ','
      '      Confirm_Production = :Confirm_Production,'
      '      Email_Enquiry_Notes = :Email_Enquiry_Notes,'
      '      Email_Purchase_Order_Notes = :Email_Purchase_Order_Notes,'
      
        '      Email_Acknowledgement_Notes = :Email_Acknowledgement_Notes' +
        ','
      '      Email_Quotation_Notes = :Email_Quotation_Notes,'
      '      Email_Invoice_Notes = :Email_Invoice_Notes,'
      
        '      Online_Delivery_Description = :Online_Delivery_Description' +
        ','
      '      Online_Delivery_Charge = :Online_Delivery_Charge,'
      '      Online_Delivery_Cost = :Online_Delivery_Cost,'
      '      Online_Delivery_Vat_Code = :Online_Delivery_Vat_Code,'
      '      Online_Delivery_Threshold = :Online_Delivery_Threshold,'
      '      Sales_Order_Terms_File = :Sales_order_Terms_File,'
      '      Purchase_Order_Terms_File = :Purchase_order_Terms_File,'
      '      Studio_Price_Guide_File = :Studio_Price_Guide_File,'
      '      Allow_Stock_Versions = :Allow_Stock_Versions,'
      '      Analysis_Code_1_Caption = :Analysis_Code_1_Caption,'
      '      Analysis_Code_2_Caption = :Analysis_Code_2_Caption,'
      '      Analysis_Code_3_Caption = :Analysis_Code_3_Caption,'
      '      Analysis_Code_4_Caption = :Analysis_Code_4_Caption,'
      
        '      Default_Web2Print_Product_Type = :Default_Web2Print_Produc' +
        't_Type,'
      
        '      Default_Web_Paid_Product_Type = :Default_Web_Paid_Product_' +
        'Type,'
      '      Replicate_DBAlias = :Replicate_DBAlias,'
      '      Default_Buy_Print_Vat_Code = :Default_Buy_Print_Vat_Code,'
      
        '      Default_Customer_Account_Code = :Default_Customer_Account_' +
        'Code,'
      
        '      Default_Supplier_Account_Code = :Default_Supplier_Account_' +
        'Code,'
      
        '      Product_Prefix_not_Required = :Product_Prefix_not_Required' +
        ','
      '      Use_Pack_Pricing = :Use_Pack_Pricing,'
      '      Show_WI_Purchase_Orders = :Show_WI_Purchase_Orders,'
      '      Use_Prospect_System = :Use_Prospect_System,'
      '      Use_CRM_System = :Use_CRM_System,'
      '      Use_Credit_Checking = :Use_Credit_Checking,'
      '      Supplier_Payment_Terms = :Supplier_Payment_Terms,'
      '      Allow_Delivery_Imbalance = :Allow_Delivery_Imbalance,'
      '      Stock_Ref_Mandatory = :Stock_Ref_Mandatory,'
      '      Default_Payment_Terms = :Default_Payment_Terms,'
      '      Credit_Terms_Notes = :Credit_Terms_Notes,'
      '      Use_Reorder_Reminder = :Use_Reorder_Reminder,'
      '      Reorder_Reminder_Interval = :Reorder_Reminder_Interval,'
      '      Reorder_Reminder_Min_Value = :Reorder_Reminder_Min_Value,'
      
        '      Default_Delivery_Via_Company = :Default_Delivery_Via_Compa' +
        'ny,'
      
        '      Enquiry_Reminder_Activity_Type = :Enquiry_Reminder_Activit' +
        'y_Type,'
      
        '      Quote_Reminder_Activity_Type = :Quote_Reminder_Activity_Ty' +
        'pe,'
      '      Proof_Status_Activity_Type = :Proof_Status_Activity_Type,'
      '      Reorder_Activity_Type = :Reorder_Activity_Type,'
      '      Order_Ack_Activity_Type = :Order_Ack_Activity_Type,'
      
        '      Order_Delivery_Activity_Type = :Order_Delivery_Activity_Ty' +
        'pe,'
      '      Use_Sub_Reps = :Use_Sub_Reps,'
      '      Email_Storage_Directory = :Email_Storage_Directory,'
      '      Use_GDPR = :Use_GDPR,'
      '      Use_Contract_Module = :Use_Contract_Module,'
      
        '      Default_Quote_Cost_Process_Grp = :Default_Quote_Cost_Proce' +
        'ss_Grp,'
      '      Default_Quote_Cost_Process = :Default_Quote_Cost_Process,'
      
        '      Default_Quote_Cost_Description = :Default_Quote_Cost_Descr' +
        'iption,'
      
        '      Default_Quote_Cost_markup_perc = :Default_Quote_Cost_marku' +
        'p_perc,'
      '      Direct_Debit_Account_ID = :Direct_Debit_Account_ID,'
      '      Registered_Office_Address = :Registered_Office_Address,'
      '      Use_Acquired_Customers = :Use_Acquired_Customers,'
      '      Use_CTRLP_Ordering = :Use_CTRLP_Ordering,'
      '      Use_SAP_Integration = :Use_SAP_Integration,'
      '      Global_Invoice_Email = :Global_Invoice_Email,'
      '      Email_Proforma_Notes = :Email_Proforma_Notes,'
      '      Email_Orders_Due_Notes = :Email_Orders_Due_Notes'
      'where company = 1'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 440
    Top = 404
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Building_no_Name'
      end
      item
        Name = 'Street'
      end
      item
        Name = 'Locale'
      end
      item
        Name = 'Town'
      end
      item
        Name = 'Postcode'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Fax_Number'
      end
      item
        Name = 'EMail'
      end
      item
        Name = 'Web_Address'
      end
      item
        Name = 'Company_Reg_No'
      end
      item
        Name = 'VAT_Registration_No'
      end
      item
        Name = 'Purch_Nom_Def'
      end
      item
        Name = 'Sales_Nom_Def'
      end
      item
        Name = 'Job_Bag_In_Use'
      end
      item
        Name = 'Currency_Code_Def'
        DataType = ftInteger
      end
      item
        Name = 'Acc_Code_Cust_Unique'
      end
      item
        Name = 'Acc_Code_Supp_Unique'
      end
      item
        Name = 'Nominal_Level'
        DataType = ftString
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Supplier_Phone'
        DataType = ftString
      end
      item
        Name = 'Supplier_Fax'
      end
      item
        Name = 'commission_type'
      end
      item
        Name = 'Delivery_Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Use_PIN_Reference'
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Document_Directory'
      end
      item
        Name = 'Activity_Document_Directory'
      end
      item
        Name = 'Customer_Document_Directory'
      end
      item
        Name = 'Supplier_Document_Directory'
      end
      item
        Name = 'Quote_Document_Directory'
      end
      item
        Name = 'Job_Bag_Document_Directory'
      end
      item
        Name = 'Enquiry_Document_Directory'
      end
      item
        Name = 'Contract_Document_Directory'
      end
      item
        Name = 'Form_Reference_Mandatory'
      end
      item
        Name = 'Performance_target_type'
      end
      item
        Name = 'onstop'
      end
      item
        Name = 'Cash_Sales_Account_Code'
      end
      item
        Name = 'Job_Bag_is_mandatory'
      end
      item
        Name = 'Authorise_POrders'
      end
      item
        Name = 'Default_PO_Limit'
      end
      item
        Name = 'Cust_acc_code_mandatory'
      end
      item
        Name = 'Supp_acc_code_mandatory'
      end
      item
        Name = 'Match_Purchase_Orders'
      end
      item
        Name = 'Use_Account_Managers'
      end
      item
        Name = 'Use_Production'
      end
      item
        Name = 'Dont_Default_PO_Deliveries'
      end
      item
        Name = 'Use_Revenue_Centres'
      end
      item
        Name = 'Change_Invoice_After_Print'
      end
      item
        Name = 'Include_Job_Bag_Costs'
      end
      item
        Name = 'Default_WI_Email_Address'
      end
      item
        Name = 'Default_WI_Email_Name'
      end
      item
        Name = 'Use_FSC_Claim'
      end
      item
        Name = 'Use_Non_Conformance'
      end
      item
        Name = 'Default_SO_Last_Delivery'
      end
      item
        Name = 'Invoice_Payment_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Use_Consolidated_Invoicing'
      end
      item
        Name = 'Use_Invoice_Notes_For_Terms'
      end
      item
        Name = 'Confirm_Production'
      end
      item
        Name = 'Email_Enquiry_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Email_Purchase_Order_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Email_Acknowledgement_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Email_Quotation_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Email_Invoice_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Online_Delivery_Description'
      end
      item
        Name = 'Online_Delivery_Charge'
        DataType = ftFloat
      end
      item
        Name = 'Online_Delivery_Cost'
        DataType = ftFloat
      end
      item
        Name = 'Online_Delivery_Vat_Code'
        DataType = ftInteger
      end
      item
        Name = 'Online_Delivery_Threshold'
        DataType = ftFloat
      end
      item
        Name = 'Sales_order_Terms_File'
      end
      item
        Name = 'Purchase_order_Terms_File'
      end
      item
        Name = 'Studio_Price_Guide_File'
      end
      item
        Name = 'Allow_Stock_Versions'
      end
      item
        Name = 'Analysis_Code_1_Caption'
      end
      item
        Name = 'Analysis_Code_2_Caption'
      end
      item
        Name = 'Analysis_Code_3_Caption'
      end
      item
        Name = 'Analysis_Code_4_Caption'
      end
      item
        Name = 'Default_Web2Print_Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Default_Web_Paid_Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Replicate_DBAlias'
      end
      item
        Name = 'Default_Buy_Print_Vat_Code'
      end
      item
        Name = 'Default_Customer_Account_Code'
      end
      item
        Name = 'Default_Supplier_Account_Code'
      end
      item
        Name = 'Product_Prefix_not_Required'
      end
      item
        Name = 'Use_Pack_Pricing'
      end
      item
        Name = 'Show_WI_Purchase_Orders'
      end
      item
        Name = 'Use_Prospect_System'
      end
      item
        Name = 'Use_CRM_System'
      end
      item
        Name = 'Use_Credit_Checking'
      end
      item
        Name = 'Supplier_Payment_Terms'
        DataType = ftInteger
      end
      item
        Name = 'Allow_Delivery_Imbalance'
      end
      item
        Name = 'Stock_Ref_Mandatory'
      end
      item
        Name = 'Default_Payment_Terms'
        DataType = ftInteger
      end
      item
        Name = 'Credit_Terms_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Use_Reorder_Reminder'
      end
      item
        Name = 'Reorder_Reminder_Interval'
      end
      item
        Name = 'Reorder_Reminder_Min_Value'
      end
      item
        Name = 'Default_Delivery_Via_Company'
      end
      item
        Name = 'Enquiry_Reminder_Activity_Type'
        DataType = ftInteger
      end
      item
        Name = 'Quote_Reminder_Activity_Type'
        DataType = ftInteger
      end
      item
        Name = 'Proof_Status_Activity_Type'
        DataType = ftInteger
      end
      item
        Name = 'Reorder_Activity_Type'
        DataType = ftInteger
      end
      item
        Name = 'Order_Ack_Activity_Type'
        DataType = ftInteger
      end
      item
        Name = 'Order_Delivery_Activity_Type'
        DataType = ftInteger
      end
      item
        Name = 'Use_Sub_Reps'
      end
      item
        Name = 'Email_Storage_Directory'
      end
      item
        Name = 'Use_GDPR'
      end
      item
        Name = 'Use_Contract_Module'
      end
      item
        Name = 'Default_Quote_Cost_Process_Grp'
        DataType = ftInteger
      end
      item
        Name = 'Default_Quote_Cost_Process'
        DataType = ftInteger
      end
      item
        Name = 'Default_Quote_Cost_Description'
        DataType = ftString
      end
      item
        Name = 'Default_Quote_Cost_markup_perc'
        DataType = ftFloat
      end
      item
        Name = 'Direct_Debit_Account_ID'
      end
      item
        Name = 'Registered_Office_Address'
      end
      item
        Name = 'Use_Acquired_Customers'
      end
      item
        Name = 'Use_CTRLP_Ordering'
      end
      item
        Name = 'Use_SAP_Integration'
      end
      item
        Name = 'Global_Invoice_Email'
      end
      item
        Name = 'Email_Proforma_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Email_Orders_Due_Notes'
        DataType = ftInteger
      end>
  end
  object GetCurrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Currency_Code, Currency_Code_Descr'
      'From Currency_Code'
      'Order By Currency_Code_Descr')
    Left = 616
    Top = 344
  end
  object GetCurrSRC: TDataSource
    DataSet = GetCurrSQL
    Left = 592
    Top = 216
  end
  object GetNominalSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Nominal_Level')
    Left = 356
    Top = 386
  end
  object GetNominalSRC: TDataSource
    DataSet = GetNominalSQL
    Left = 444
    Top = 338
  end
  object GetSupplierSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Supplier_Branch.Name as Branch_Name,'
      '          Supplier.Name as Supplier_Name'
      'from Supplier_Branch, Supplier'
      'where Supplier_Branch.Supplier = :Supplier and'
      '           Supplier_Branch.Branch_no = :Branch_no and'
      '           Supplier.Supplier = Supplier_Branch.Supplier'
      '          ')
    Left = 380
    Top = 274
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object dtdrcCommission: TDataSource
    DataSet = qryCommission
    Left = 252
    Top = 274
  end
  object qryCommission: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from commission_type;')
    Left = 548
    Top = 250
  end
  object FlashDelivTimer: TTimer
    Enabled = False
    OnTimer = FlashDelivTimerTimer
    Left = 576
    Top = 440
  end
  object UpdDelivNotesOnlySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Company'
      'set Delivery_Narrative = :Delivery_Narrative'
      'where company = 1'
      ' '
      ' '
      ' '
      ' ')
    Left = 568
    Top = 324
    ParamData = <
      item
        Name = 'Delivery_Narrative'
      end>
  end
  object QryVat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from vat_code'
      'Order By Description')
    Left = 480
    Top = 248
  end
  object DsVat: TDataSource
    DataSet = QryVat
    Left = 232
    Top = 432
  end
  object QryPrdTyp: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select product_type,'
      'description'
      'From Product_Type'
      'Order By Description')
    Left = 444
    Top = 276
  end
  object DSPrdTyp: TDataSource
    DataSet = QryPrdTyp
    Left = 380
    Top = 332
  end
  object FlashPayTimer: TTimer
    Enabled = False
    OnTimer = FlashPayTimerTimer
    Left = 200
    Top = 376
  end
  object qryOnlineVAT: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from vat_code'
      'Order By Description')
    Left = 504
    Top = 304
  end
  object dtsOnlineVAT: TDataSource
    DataSet = qryOnlineVAT
    Left = 244
    Top = 352
  end
  object opndlgTerms: TOpenDialog
    Left = 244
    Top = 184
  end
  object FlashTermsTimer: TTimer
    Enabled = False
    OnTimer = FlashTermsTimerTimer
    Left = 472
    Top = 80
  end
  object qryPayTerms: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Payment_Terms'
      'ORDER BY Payment_Terms_Description')
    Left = 544
    Top = 392
  end
  object dtsPayTerms: TDataSource
    DataSet = qryPayTerms
    Left = 172
    Top = 464
  end
  object FlashCreditTimer: TTimer
    Enabled = False
    OnTimer = FlashCreditTimerTimer
    Left = 416
    Top = 376
  end
  object qryActivityType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Activity_Type'
      'Order By Activity_Type_Description')
    Left = 480
    Top = 216
  end
  object dtsActivityType: TDataSource
    DataSet = qryActivityType
    Left = 532
    Top = 216
  end
  object qryProcessGroup: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Process_Group'
      'order by Process_Group_Description')
    Left = 344
    Top = 65528
  end
  object dtsProcessGroup: TDataSource
    DataSet = qryProcessGroup
    Left = 432
    Top = 65528
  end
  object qryProcess: TFDQuery
    MasterSource = dtsProcessGroup
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Process'
      'where process_group = :process_group AND (inactive = '#39'N'#39')'
      'order by Process_Description')
    Left = 400
    Top = 80
    ParamData = <
      item
        Name = 'process_group'
      end>
  end
  object dtsProcess: TDataSource
    DataSet = qryProcess
    Left = 440
    Top = 80
  end
end
