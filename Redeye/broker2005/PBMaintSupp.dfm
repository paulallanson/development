object PBMaintSuppFrm: TPBMaintSuppFrm
  Left = 491
  Top = 23
  Caption = 'Maintain Suppliers'
  ClientHeight = 623
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
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
  object pgcntrlSupplier: TPageControl
    Left = 0
    Top = 0
    Width = 527
    Height = 549
    ActivePage = tbshtDetails
    Align = alClient
    TabOrder = 0
    object tbshtDetails: TTabSheet
      Caption = 'Details'
      object DetsGrpBox: TGroupBox
        Left = 8
        Top = 2
        Width = 489
        Height = 503
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 17
          Width = 33
          Height = 13
          Caption = 'Name'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 16
          Top = 44
          Width = 38
          Height = 13
          Caption = 'Address'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 16
          Top = 141
          Width = 45
          Height = 13
          Caption = 'Postcode'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 16
          Top = 165
          Width = 37
          Height = 13
          Caption = 'Phone'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 16
          Top = 189
          Width = 17
          Height = 13
          Caption = 'Fax'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 212
          Width = 25
          Height = 13
          Caption = 'Email'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 16
          Top = 265
          Width = 68
          Height = 13
          Caption = 'Account Code'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 16
          Top = 239
          Width = 51
          Height = 13
          Caption = 'Discount'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 280
          Top = 239
          Width = 48
          Height = 13
          Caption = 'Intrastat'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label3: TLabel
          Left = 16
          Top = 326
          Width = 41
          Height = 13
          Caption = 'VAT Ref'
        end
        object Label4: TLabel
          Left = 280
          Top = 265
          Width = 42
          Height = 13
          Caption = 'Currency'
          Visible = False
        end
        object Label6: TLabel
          Left = 16
          Top = 356
          Width = 80
          Height = 13
          Caption = 'Def VAT Rate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 16
          Top = 116
          Width = 49
          Height = 13
          Caption = 'Town/City'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 248
          Top = 208
          Width = 38
          Height = 13
          Caption = 'Label18'
        end
        object Label19: TLabel
          Left = 16
          Top = 292
          Width = 33
          Height = 13
          Caption = 'Courier'
        end
        object Label25: TLabel
          Tag = 100
          Left = 15
          Top = 397
          Width = 73
          Height = 13
          Caption = 'Payment Terms'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object TownEdit: TEdit
          Left = 112
          Top = 112
          Width = 350
          Height = 21
          MaxLength = 40
          TabOrder = 4
          Text = 'TownEdit'
          OnKeyUp = BuildingEditKeyUp
        end
        object NameEdit: TEdit
          Left = 112
          Top = 15
          Width = 350
          Height = 21
          MaxLength = 100
          TabOrder = 0
          Text = 'NameEdit'
          OnChange = NameEditChange
          OnExit = NameEditExit
          OnKeyUp = BuildingEditKeyUp
        end
        object ActiveChkBox: TCheckBox
          Left = 16
          Top = 471
          Width = 150
          Height = 17
          Hint = 'Customers Account  Open  ?'
          Caption = 'Supplier is Active'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 23
        end
        object NotesBitBtn: TBitBtn
          Left = 376
          Top = 468
          Width = 75
          Height = 25
          Caption = 'Notes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
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
          TabOrder = 24
          OnClick = NotesBitBtnClick
        end
        object BuildingEdit: TEdit
          Left = 112
          Top = 40
          Width = 350
          Height = 21
          MaxLength = 40
          TabOrder = 1
          Text = 'BuildingEdit'
          OnKeyUp = BuildingEditKeyUp
        end
        object StreetEdit: TEdit
          Left = 112
          Top = 64
          Width = 350
          Height = 21
          MaxLength = 40
          TabOrder = 2
          Text = 'StreetEdit'
          OnKeyUp = BuildingEditKeyUp
        end
        object LocaleEdit: TEdit
          Left = 112
          Top = 88
          Width = 350
          Height = 21
          MaxLength = 40
          TabOrder = 3
          Text = 'LocaleEdit'
          OnKeyUp = BuildingEditKeyUp
        end
        object PhoneEdit: TEdit
          Left = 112
          Top = 160
          Width = 139
          Height = 21
          MaxLength = 20
          TabOrder = 6
          Text = 'PhoneEdit'
          OnKeyUp = BuildingEditKeyUp
        end
        object FaxEdit: TEdit
          Left = 112
          Top = 184
          Width = 139
          Height = 21
          MaxLength = 20
          TabOrder = 7
          Text = 'FaxEdit'
        end
        object EMailEdit: TEdit
          Left = 112
          Top = 208
          Width = 350
          Height = 21
          MaxLength = 40
          TabOrder = 8
          Text = 'EMailEdit'
        end
        object PostCodeEdit: TEdit
          Left = 112
          Top = 136
          Width = 115
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 5
          Text = 'POSTCODEEDIT'
          OnKeyUp = BuildingEditKeyUp
        end
        object AccCodeEdit: TEdit
          Left = 112
          Top = 261
          Width = 115
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 8
          TabOrder = 10
          Text = 'ACCCODEEDIT'
          OnEnter = AccCodeEditEnter
          OnExit = AccCodeEditExit
        end
        object DiscountMemo: TMemo
          Left = 112
          Top = 234
          Width = 115
          Height = 23
          Lines.Strings = (
            'CredLimMemo')
          TabOrder = 9
          WantReturns = False
          OnExit = DiscountMemoExit
        end
        object VATRefEdit: TEdit
          Left = 112
          Top = 320
          Width = 219
          Height = 21
          MaxLength = 20
          TabOrder = 16
          Text = 'VATRefEdit'
        end
        object IntrastatDBLookupComboBox: TDBLookupComboBox
          Left = 360
          Top = 235
          Width = 115
          Height = 21
          KeyField = 'Intrastat_Id'
          ListField = 'Intrastat_Id_Descr'
          TabOrder = 11
          Visible = False
          OnClick = IntrastatDBLookupComboBoxClick
        end
        object CurrencyDBLookupComboBox: TDBLookupComboBox
          Left = 360
          Top = 261
          Width = 113
          Height = 21
          KeyField = 'Currency_Code'
          ListField = 'Currency_Code_Descr'
          TabOrder = 12
          Visible = False
        end
        object DefVATDBLookupComboBox: TDBLookupComboBox
          Left = 112
          Top = 352
          Width = 195
          Height = 21
          KeyField = 'Vat_Code'
          ListField = 'Description'
          TabOrder = 17
          OnClick = DefVATDBLookupComboBoxClick
        end
        object VatMaintBitBtn: TBitBtn
          Left = 316
          Top = 351
          Width = 25
          Height = 23
          Hint = 'Vat Code Maintenance'
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'System'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
          OnClick = VatMaintBitBtnClick
        end
        object dblkpCourier: TDBLookupComboBox
          Left = 112
          Top = 288
          Width = 193
          Height = 21
          KeyField = 'Courier'
          ListField = 'Courier_Name'
          TabOrder = 13
          OnClick = IntrastatDBLookupComboBoxClick
        end
        object btnCourierClear: TBitBtn
          Left = 352
          Top = 287
          Width = 25
          Height = 23
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
          TabOrder = 15
          TabStop = False
          OnClick = btnCourierClearClick
        end
        object VatBitBtn: TBitBtn
          Left = 352
          Top = 351
          Width = 25
          Height = 23
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
          TabOrder = 19
          TabStop = False
          OnClick = VATBitBtnClick
        end
        object btnLUCouriers: TBitBtn
          Left = 316
          Top = 287
          Width = 25
          Height = 23
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'System'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          OnClick = btnLUCouriersClick
        end
        object dblkpPaymentTerms: TDBLookupComboBox
          Tag = 100
          Left = 112
          Top = 393
          Width = 195
          Height = 21
          KeyField = 'Payment_terms'
          ListField = 'Payment_terms_description'
          TabOrder = 20
        end
        object btnTerms: TBitBtn
          Left = 316
          Top = 392
          Width = 25
          Height = 23
          Hint = 'Vat Code Maintenance'
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'System'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 21
          OnClick = btnTermsClick
        end
        object BitBtn2: TBitBtn
          Left = 352
          Top = 392
          Width = 25
          Height = 23
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
          TabOrder = 22
          TabStop = False
          OnClick = BitBtn2Click
        end
      end
    end
    object tbshtProductTypes: TTabSheet
      Caption = 'Product types'
      ImageIndex = 1
    end
    object tbshtDocuments: TTabSheet
      Caption = 'Documents'
      ImageIndex = 4
      object dbgDocuments: TDBGrid
        Left = 0
        Top = 0
        Width = 519
        Height = 460
        Align = alClient
        DataSource = dtmdlCustomers.dtsDocuments
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmnuDocuments
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = mnuDocOpenClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Date_created'
            Title.Caption = 'Date'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Document_Title'
            Title.Caption = 'Name'
            Width = 256
            Visible = True
          end>
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'File Transfer'
      ImageIndex = 2
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 465
        Height = 193
        Caption = 'Connection Details'
        TabOrder = 0
        object Label13: TLabel
          Left = 16
          Top = 36
          Width = 22
          Height = 13
          Caption = 'EAN'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 16
          Top = 68
          Width = 60
          Height = 13
          Caption = 'Our Account'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 16
          Top = 100
          Width = 46
          Height = 13
          Caption = 'Password'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 16
          Top = 164
          Width = 43
          Height = 13
          Caption = 'Site URL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtEan: TEdit
          Left = 96
          Top = 32
          Width = 193
          Height = 21
          MaxLength = 20
          TabOrder = 0
          Text = 'edtEan'
        end
        object edtOurAccount: TEdit
          Left = 96
          Top = 64
          Width = 193
          Height = 21
          MaxLength = 20
          TabOrder = 1
          Text = 'edtOurAccount'
        end
        object edtPassword: TEdit
          Left = 96
          Top = 96
          Width = 193
          Height = 21
          MaxLength = 20
          TabOrder = 2
          Text = 'edtPassword'
        end
        object rdgrpProtocol: TRadioGroup
          Left = 328
          Top = 24
          Width = 121
          Height = 97
          Caption = 'Transfer Protocol'
          ItemIndex = 3
          Items.Strings = (
            'EDI'
            'FTP'
            'HTTPS'
            'None')
          TabOrder = 3
        end
        object edtSiteURL: TEdit
          Left = 96
          Top = 160
          Width = 345
          Height = 21
          MaxLength = 20
          TabOrder = 4
          Text = 'edtSiteURL'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Charges'
      ImageIndex = 3
      object dbgCharges: TDBGrid
        Left = 8
        Top = 16
        Width = 385
        Height = 209
        DataSource = dtmdlSuppliers.dtsCharges
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgChargesDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Details'
            Title.Caption = 'Description'
            Width = 208
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Amount'
            Title.Caption = 'Cost Price'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quotation_Price'
            Title.Caption = 'Sell Price'
            Visible = True
          end>
      end
      object btnAddChg: TBitBtn
        Left = 398
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Add'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnAddChgClick
      end
      object btnDeleteChg: TBitBtn
        Left = 398
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Delete'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnDeleteChgClick
      end
      object btnChangeChg: TBitBtn
        Left = 398
        Top = 52
        Width = 75
        Height = 25
        Caption = 'Change'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        TabOrder = 3
        OnClick = btnChangeChgClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 549
    Width = 527
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object DelLabel: TLabel
      Left = 216
      Top = 20
      Width = 125
      Height = 13
      Caption = 'Delete these details ?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PrintBitBtn: TBitBtn
      Left = 16
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 0
      OnClick = PrintBitBtnClick
    end
    object OKBitBtn: TBitBtn
      Left = 352
      Top = 14
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
        7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
        7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
        7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
        00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
        007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
        00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
        7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
        7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
        7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
        007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
        FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
        7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
        00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 432
      Top = 14
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
        7F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F0000FF7F7F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF007F7F
        007F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F00
        00FF00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        FFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7FFFFFFF7F7F7F7F7F7FFFFF
        FF007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00
        007F7F7F7F007F7F0000FF00007F00007F00007F00007F7F7F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7FFFFF
        FF7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F00
        7F7F0000FF00007F00007F00007F00007F7F7F7F00007F00007F00007F00007F
        00007F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F
        7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF00
        7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00007F
        00007F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F00
        7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        0000FF00007F00007F00007F00007F00007F00007F7F7F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F00
        7F7F007F7F007F7F007F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F00007F00007F00007F00007F00007F7F7F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
        7F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F0000FF00007F00007F00007F00007F00007F7F7F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F7F7F7F00007F00
        007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00
        007F7F7F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F0000FF00007F00007F7F7F7F007F7F007F7F007F7F0000FF00007F00007F
        00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F007F7F007F7F007F7F
        007F7F007F7F0000FF00007F00007F00007F007F7F007F7F007F7F007F7F007F
        7F007F7F7F7F7FFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F7F7F7FFFFFFF00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F0000FF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F00
        7F7F007F7F007F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 2
      OnClick = CancelBitBtnClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 604
    Width = 527
    Height = 19
    Panels = <>
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 352
    Top = 168
  end
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 344
    Top = 176
  end
  object pmnuDocuments: TPopupMenu
    Left = 206
    Top = 150
    object Add1: TMenuItem
      Caption = 'Add'
      OnClick = Add1Click
    end
    object mnuDocChange: TMenuItem
      Caption = 'Change'
      OnClick = mnuDocChangeClick
    end
    object mnuDocDelete: TMenuItem
      Caption = 'Delete'
      OnClick = mnuDocDeleteClick
    end
    object mnuDocOpen: TMenuItem
      Caption = 'Open'
      OnClick = mnuDocOpenClick
    end
    object N1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object Word1: TMenuItem
      Caption = 'Word'
      Visible = False
    end
    object Excel1: TMenuItem
      Caption = 'Excel'
      Visible = False
    end
    object Email1: TMenuItem
      Caption = 'Email'
      Visible = False
    end
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 345
    Top = 238
  end
end
