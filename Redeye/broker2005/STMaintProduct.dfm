object frmSTMaintProduct: TfrmSTMaintProduct
  Left = 402
  Top = 18
  BorderStyle = bsDialog
  Caption = 'Maintain product details'
  ClientHeight = 601
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object pgDetails: TPageControl
    Left = 0
    Top = 0
    Width = 531
    Height = 560
    ActivePage = tsGeneral
    Align = alClient
    TabOrder = 0
    object tsGeneral: TTabSheet
      Caption = 'General'
      object grpbxDetails: TGroupBox
        Left = 0
        Top = 0
        Width = 523
        Height = 532
        Align = alClient
        TabOrder = 0
        DesignSize = (
          523
          532)
        object Label1: TLabel
          Left = 8
          Top = 40
          Width = 27
          Height = 13
          Caption = 'Code'
        end
        object Label2: TLabel
          Left = 8
          Top = 67
          Width = 59
          Height = 13
          Caption = 'Description'
        end
        object Label11: TLabel
          Left = 8
          Top = 17
          Width = 49
          Height = 13
          Caption = 'Customer'
        end
        object Label8: TLabel
          Left = 8
          Top = 120
          Width = 33
          Height = 13
          Caption = 'Group'
        end
        object Label12: TLabel
          Left = 8
          Top = 145
          Width = 100
          Height = 35
          AutoSize = False
          Caption = 'Product Classification'
          WordWrap = True
        end
        object Label5: TLabel
          Left = 8
          Top = 299
          Width = 48
          Height = 13
          Caption = 'VAT Code'
        end
        object Label6: TLabel
          Left = 8
          Top = 326
          Width = 71
          Height = 13
          Caption = 'Cost Price (PK)'
        end
        object Label7: TLabel
          Left = 216
          Top = 319
          Width = 52
          Height = 26
          Caption = 'Cost Pack Qty'
          WordWrap = True
        end
        object Label13: TLabel
          Left = 363
          Top = 353
          Width = 52
          Height = 13
          Caption = 'Markup %'
        end
        object Label9: TLabel
          Left = 216
          Top = 353
          Width = 64
          Height = 13
          Caption = 'Sell Pack Qty'
        end
        object Label4: TLabel
          Left = 8
          Top = 353
          Width = 66
          Height = 13
          Caption = 'Sell Price (PK)'
        end
        object Label3: TLabel
          Left = 8
          Top = 382
          Width = 81
          Height = 13
          Caption = 'Cost Uplift Type'
        end
        object Label14: TLabel
          Left = 365
          Top = 381
          Width = 29
          Height = 13
          Caption = 'Uplift'
        end
        object Label10: TLabel
          Left = 8
          Top = 409
          Width = 83
          Height = 13
          Caption = 'Unit of Measure'
        end
        object LblSlsNomCode: TLabel
          Left = 8
          Top = 467
          Width = 100
          Height = 17
          AutoSize = False
          Caption = 'Sales Nom Code'
          WordWrap = True
        end
        object LblPurchNom: TLabel
          Left = 8
          Top = 496
          Width = 100
          Height = 17
          AutoSize = False
          Caption = 'Purchase Nom Code'
          WordWrap = True
        end
        object Label15: TLabel
          Left = 8
          Top = 437
          Width = 88
          Height = 13
          Caption = 'Invoice Price Unit'
        end
        object Label16: TLabel
          Left = 8
          Top = 243
          Width = 66
          Height = 13
          Caption = 'Product Type'
        end
        object Label17: TLabel
          Left = 8
          Top = 93
          Width = 80
          Height = 13
          Caption = 'Form Reference'
        end
        object lblPrefix: TLabel
          Left = 376
          Top = 40
          Width = 28
          Height = 13
          Caption = 'Prefix'
        end
        object dblkpPartGroup: TDBLookupComboBox
          Left = 112
          Top = 116
          Width = 257
          Height = 21
          KeyField = 'Part_Group'
          ListField = 'Part_Group_Descr'
          ListSource = dtsPartGroup
          TabOrder = 7
        end
        object edtCustomer: TEdit
          Left = 112
          Top = 12
          Width = 257
          Height = 21
          TabStop = False
          Color = clBtnFace
          MaxLength = 30
          ReadOnly = True
          TabOrder = 18
          OnClick = CheckOK
        end
        object edtDescription: TEdit
          Left = 112
          Top = 62
          Width = 337
          Height = 21
          MaxLength = 100
          TabOrder = 3
          OnChange = CheckOK
          OnKeyPress = edtDescriptionKeyPress
        end
        object edtProductCode: TEdit
          Left = 112
          Top = 36
          Width = 257
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 25
          TabOrder = 2
          OnClick = CheckOK
          OnExit = edtProductCodeExit
          OnKeyPress = edtProductCodeKeyPress
        end
        object btnClearPartGroup: TBitBtn
          Left = 408
          Top = 115
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
          TabOrder = 9
          TabStop = False
          OnClick = btnClearPartGroupClick
        end
        object btnPartGroup: TBitBtn
          Left = 376
          Top = 115
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
          TabOrder = 8
          TabStop = False
          OnClick = btnPartGroupClick
        end
        object btnClearCustomer: TBitBtn
          Left = 408
          Top = 12
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
          TabOrder = 1
          OnClick = btnClearCustomerClick
        end
        object btnCustomer: TBitBtn
          Left = 376
          Top = 12
          Width = 25
          Height = 23
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnCustomerClick
        end
        object rdgrpClass: TRadioGroup
          Left = 112
          Top = 138
          Width = 129
          Height = 95
          ItemIndex = 0
          Items.Strings = (
            'Stocked'
            'Non stocked'
            'Service item'
            'Print On Demand')
          ParentBackground = False
          TabOrder = 10
          OnClick = rdgrpClassClick
        end
        object ChkBxNumbered: TCheckBox
          Left = 256
          Top = 168
          Width = 129
          Height = 17
          Caption = 'Numbered'
          TabOrder = 11
        end
        object dblkpVat: TDBLookupComboBox
          Left = 112
          Top = 295
          Width = 161
          Height = 21
          KeyField = 'Vat_Code'
          ListField = 'Description'
          ListSource = dtsVatCode
          TabOrder = 16
          OnClick = CheckOK
        end
        object memPurchPrice: TMemo
          Left = 112
          Top = 322
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '')
          TabOrder = 19
          WantReturns = False
          WordWrap = False
          OnChange = memPurchPriceChange
          OnEnter = SaveMemoField
          OnExit = ValidateMoney
          OnKeyPress = memPurchPriceKeyPress
        end
        object memPurchPackQty: TMemo
          Left = 284
          Top = 322
          Width = 70
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '')
          TabOrder = 20
          WantReturns = False
          WordWrap = False
          OnChange = memPurchPriceChange
          OnEnter = SaveMemoField
          OnExit = ValidateQuantity
          OnKeyPress = memSellPackQtyKeyPress
        end
        object memSellPackQty: TMemo
          Left = 284
          Top = 349
          Width = 70
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '')
          TabOrder = 22
          WantReturns = False
          WordWrap = False
          OnChange = memPurchPriceChange
          OnEnter = SaveMemoField
          OnExit = ValidateQuantity
          OnKeyPress = memSellPackQtyKeyPress
        end
        object memCatMArkup: TMemo
          Left = 416
          Top = 349
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '')
          ReadOnly = True
          TabOrder = 23
          WantReturns = False
          WordWrap = False
          OnEnter = SaveMemoField
          OnExit = ValidateMoney
          OnKeyPress = memPurchPriceKeyPress
        end
        object memCatPrice: TMemo
          Left = 112
          Top = 349
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '')
          TabOrder = 21
          WantReturns = False
          WordWrap = False
          OnChange = memPurchPriceChange
          OnEnter = SaveMemoField
          OnExit = ValidateMoney
          OnKeyPress = memPurchPriceKeyPress
        end
        object dblkpCostUplift: TDBLookupComboBox
          Left = 112
          Top = 378
          Width = 161
          Height = 21
          KeyField = 'Markup_type'
          ListField = 'Markup_Description'
          ListSource = dtsCostUplift
          TabOrder = 24
        end
        object MemCostUplift: TMemo
          Left = 416
          Top = 376
          Width = 65
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '')
          TabOrder = 25
          WantReturns = False
          WordWrap = False
          OnClick = CheckOK
          OnEnter = SaveMemoField
          OnExit = ValidateMoney
          OnKeyPress = memPurchPriceKeyPress
        end
        object btnPriceUnit: TBitBtn
          Left = 256
          Top = 435
          Width = 25
          Height = 23
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'System'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 30
          OnClick = btnPriceUnitClick
        end
        object btnClearPriceUnit: TBitBtn
          Left = 288
          Top = 435
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
          TabOrder = 31
          TabStop = False
          OnClick = btnClearPriceUnitClick
        end
        object dblkpPriceUnit: TDBLookupComboBox
          Left = 112
          Top = 436
          Width = 129
          Height = 21
          KeyField = 'Price_Unit'
          ListField = 'Description'
          ListSource = dtsPriceUnit
          TabOrder = 29
        end
        object chkbxNotinUse: TCheckBox
          Left = 352
          Top = 502
          Width = 153
          Height = 17
          Caption = 'Inactive'
          TabOrder = 37
        end
        object VatMaintBitBtn: TBitBtn
          Left = 280
          Top = 294
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
          TabOrder = 17
          TabStop = False
          OnClick = VatMaintBitBtnClick
        end
        object dblkpUOM: TDBLookupComboBox
          Left = 112
          Top = 405
          Width = 129
          Height = 21
          KeyField = 'Unit_of_Measure'
          ListField = 'UOM_Description'
          ListSource = dtsUOM
          TabOrder = 26
        end
        object btnUOM: TBitBtn
          Left = 256
          Top = 404
          Width = 25
          Height = 23
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'System'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 27
        end
        object btnClearUOM: TBitBtn
          Left = 288
          Top = 404
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
          TabOrder = 28
          TabStop = False
          OnClick = btnClearUOMClick
        end
        object dblkpProductType: TDBLookupComboBox
          Left = 112
          Top = 239
          Width = 161
          Height = 21
          KeyField = 'Product_Type'
          ListField = 'Description'
          ListSource = dtsProductTypes
          TabOrder = 12
          OnClick = dblkpProductTypeClick
        end
        object btnPType: TBitBtn
          Left = 280
          Top = 238
          Width = 25
          Height = 23
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'System'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          OnClick = btnPTypeClick
        end
        object btnClearPType: TBitBtn
          Left = 312
          Top = 238
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
          TabOrder = 14
          TabStop = False
          OnClick = btnClearPTypeClick
        end
        object edtFormReference: TEdit
          Left = 112
          Top = 88
          Width = 257
          Height = 21
          TabStop = False
          Color = clBtnFace
          MaxLength = 30
          ReadOnly = True
          TabOrder = 4
          OnClick = CheckOK
        end
        object btnFormReference: TBitBtn
          Left = 376
          Top = 88
          Width = 25
          Height = 23
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = btnFormReferenceClick
        end
        object btnClearFormRef: TBitBtn
          Left = 408
          Top = 88
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
          TabOrder = 6
          OnClick = btnClearFormRefClick
        end
        object chkbxOrderOnline: TCheckBox
          Left = 352
          Top = 454
          Width = 153
          Height = 17
          Caption = 'Order Online'
          TabOrder = 35
        end
        object edtPurchaseNominal: TMaskEdit
          Left = 112
          Top = 494
          Width = 129
          Height = 21
          CharCase = ecUpperCase
          EditMask = '!90009999/900/000;0;_'
          MaxLength = 16
          TabOrder = 33
          Text = ''
        end
        object edtSalesNominal: TMaskEdit
          Left = 112
          Top = 465
          Width = 129
          Height = 21
          CharCase = ecUpperCase
          EditMask = '!90009999/900/000;0;_'
          MaxLength = 16
          TabOrder = 32
          Text = ''
        end
        object chkbxStockZero: TCheckBox
          Left = 352
          Top = 478
          Width = 153
          Height = 17
          Caption = 'Inactive when balance zero'
          TabOrder = 36
        end
        object pnlFSCClaim: TPanel
          Left = 1
          Top = 263
          Width = 506
          Height = 25
          Anchors = [akLeft, akBottom]
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 15
          object lblFSCClaim: TLabel
            Left = 8
            Top = 6
            Width = 50
            Height = 13
            Caption = 'FSC Claim'
          end
          object lblFSCMix: TLabel
            Left = 280
            Top = 6
            Width = 30
            Height = 13
            Caption = '% Mix'
          end
          object dblkpFSCClaim: TDBLookupComboBox
            Left = 111
            Top = 2
            Width = 161
            Height = 21
            KeyField = 'FSC_Material_Claim'
            ListField = 'Claim_Description'
            ListSource = dtsFSCClaim
            TabOrder = 0
          end
          object spnFSCMix: TSpinEdit
            Left = 313
            Top = 1
            Width = 55
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object btnClearClaim: TBitBtn
            Left = 375
            Top = 1
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
            TabOrder = 2
            OnClick = btnClearClaimClick
          end
        end
        object chkbxHasBOM: TCheckBox
          Left = 256
          Top = 144
          Width = 209
          Height = 17
          Caption = 'Product has Bill of Materials'
          TabOrder = 38
          OnClick = chkbxHasBOMClick
        end
        object chkbxGlobalProduct: TCheckBox
          Left = 352
          Top = 430
          Width = 153
          Height = 17
          Caption = 'Global Product'
          TabOrder = 34
        end
      end
    end
    object tsBOM: TTabSheet
      Caption = 'Bill of Materials'
      ImageIndex = 1
      object pnlComponents: TPanel
        Left = 432
        Top = 0
        Width = 95
        Height = 533
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        object btnAdd: TBitBtn
          Left = 14
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
          TabOrder = 0
          OnClick = btnAddClick
        end
        object btnChange: TBitBtn
          Left = 14
          Top = 52
          Width = 75
          Height = 25
          Caption = 'Change'
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
          TabOrder = 1
          OnClick = btnChangeClick
        end
        object btnDelete: TBitBtn
          Left = 14
          Top = 88
          Width = 75
          Height = 25
          Caption = 'Delete'
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
          OnClick = btnDeleteClick
        end
      end
      object dbgComponents: TDBGrid
        Left = 0
        Top = 0
        Width = 432
        Height = 533
        Align = alClient
        DataSource = dtsGetBOM
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnDblClick = dbgComponentsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Composite_Part'
            Title.Caption = 'Product'
            Width = 203
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantity'
            Width = 78
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 560
    Width = 531
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    object lblDelete: TLabel
      Left = 190
      Top = 16
      Width = 133
      Height = 13
      Caption = 'Delete the above details ?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnImage: TBitBtn
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Image'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnImageClick
    end
    object btnOKSupp: TBitBtn
      Left = 278
      Top = 10
      Width = 81
      Height = 25
      Caption = 'OK+Supp'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      TabStop = False
      OnClick = btnOKSuppClick
    end
    object btnOK: TBitBtn
      Left = 366
      Top = 10
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
      TabOrder = 2
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 446
      Top = 10
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
      TabOrder = 3
    end
  end
  object qryProduct: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part.*,'
      '       (select top 1 form_reference.form_reference'
      '         from form_reference'
      '         where part.part = form_reference.stock_reference'
      '       ) as form_reference,'
      '       (select top 1 form_reference.form_reference_id'
      '         from form_reference'
      '         where part.part = form_reference.stock_reference'
      '       ) as form_reference_id'
      'From Part'
      'Where Part = :Part')
    Left = 432
    Top = 152
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryPartGroup: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Group, Part_Group_Descr_Short, Part_Group_Descr'
      'from'
      'Part_Group'
      'Order by Part_Group_Descr'
      ' ')
    Left = 312
    Top = 144
  end
  object dtsPartGroup: TDataSource
    DataSet = qryPartGroup
    Left = 376
    Top = 104
  end
  object dtsVatCode: TDataSource
    DataSet = qryVatCode
    Left = 312
    Top = 224
  end
  object qryVatCode: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From VAT_Code'
      'Order By VAT_Code'
      ' ')
    Left = 264
    Top = 224
  end
  object qryCostUplift: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Markup_type')
    Left = 496
    Top = 208
  end
  object dtsCostUplift: TDataSource
    DataSet = qryCostUplift
    Left = 496
    Top = 272
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_Unit'
      'order by Description')
    Left = 424
    Top = 288
  end
  object dtsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 488
    Top = 376
  end
  object qryGetCust: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Customer.Name as Cust_Name,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Product_Code_Prefix'
      'From  Customer, Customer_Branch'
      'Where (Customer.Customer = :Customer) and'
      '      (Customer_Branch.Customer = :Customer) and'
      '      (Customer_Branch.Branch_No = :Branch)')
    Left = 416
    Top = 208
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch'
      end>
  end
  object qryDelPart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Part'
      'Where (Part = :Part)'
      '')
    Left = 208
    Top = 80
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryUpPart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part'
      'Set'
      'Part_Description = :Part_Description,'
      'Part_Cost_List = :Part_Cost_List,'
      'Part_Cost_Cat = :Part_Cost_Cat,'
      'Vat_Code = :Vat,'
      'Part_Updated = '#39'Y'#39','
      'Auto_Update =:Auto_Update,'
      'Part_Group = :Part_Group,'
      'Purch_Pack_Quantity = :Purch_Pack_Quantity,'
      'Sell_Pack_Quantity = :Sell_Pack_Quantity,'
      'Part_Purchase_Price = :Part_Purchase_Price,'
      'Part_Mark_Up_Cat = :Part_Mark_Up_Cat,'
      'Part_Mark_Up_List = :Part_Mark_Up_List,'
      'Not_In_Use = :Not_In_Use,'
      'Order_Part_Online = :Order_Part_Online,'
      'Track_Serial_No = :Track_Serial_No,'
      'Customer = :Customer,'
      'Branch_No = :Branch,'
      'Price_Unit = :Price_Unit,'
      'Numbered = :Numbered,'
      'Sales_Nominal = :Sales_Nom,'
      'Purchase_Nominal = :Purch_Nom,'
      'Markup_Type = :Markup_Type,'
      'Markup_Value = :Markup_Val,'
      'Product_Class = :Prod_Class,'
      'Unit_of_Measure = :Unit_of_Measure,'
      'Product_Type = :Product_Type,'
      'Inactive_When_Balance_Zero = :Inactive_When_Balance_Zero,'
      'FSC_Material_Claim = :FSC_Material_Claim,'
      'FSC_Mixed_Percentage = :FSC_Mixed_Percentage,'
      'Part_Has_Children = :Part_Has_Children,'
      'Global_Product = :Global_Product'
      'Where (Part = :Part)'
      ''
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 160
    Top = 64
    ParamData = <
      item
        Name = 'Part_Description'
      end
      item
        Name = 'Part_Cost_List'
      end
      item
        Name = 'Part_Cost_Cat'
      end
      item
        Name = 'Vat'
      end
      item
        Name = 'Auto_Update'
      end
      item
        Name = 'Part_Group'
        DataType = ftString
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Part_Purchase_Price'
      end
      item
        Name = 'Part_Mark_Up_Cat'
      end
      item
        Name = 'Part_Mark_Up_List'
      end
      item
        Name = 'Not_In_Use'
      end
      item
        Name = 'Order_Part_Online'
      end
      item
        Name = 'Track_Serial_No'
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch'
        DataType = ftInteger
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Numbered'
      end
      item
        Name = 'Sales_Nom'
        DataType = ftString
      end
      item
        Name = 'Purch_Nom'
        DataType = ftString
      end
      item
        Name = 'Markup_Type'
        DataType = ftString
      end
      item
        Name = 'Markup_Val'
        DataType = ftFloat
      end
      item
        Name = 'Prod_Class'
        DataType = ftString
      end
      item
        Name = 'Unit_of_Measure'
        DataType = ftInteger
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Inactive_When_Balance_Zero'
      end
      item
        Name = 'FSC_Material_Claim'
        DataType = ftInteger
      end
      item
        Name = 'FSC_Mixed_Percentage'
      end
      item
        Name = 'Part_Has_Children'
      end
      item
        Name = 'Global_Product'
      end
      item
        Name = 'Part'
      end>
  end
  object qryAddPart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Part'
      
        '(Part, Part_Description, Part_Cost_List, Part_Cost_Cat, Vat_Code' +
        ', Part_Updated,'
      
        '       Auto_Update, Part_Group, Purch_Pack_Quantity, Sell_Pack_Q' +
        'uantity,'
      '       Part_Purchase_Price, Part_Mark_Up_List, Part_Mark_Up_Cat,'
      '       Not_In_Use, Track_Serial_No, Last_Store_Lot,'
      
        '       Numbered, Price_Unit, Customer, Branch_No, Sales_Nominal,' +
        ' Purchase_Nominal,'
      
        '       Markup_Type, Markup_Value, Product_Class, Product_Type, U' +
        'nit_of_Measure,'
      
        '       Order_Part_online, Inactive_When_Balance_Zero, Product_id' +
        ', FSC_Material_Claim, FSC_Mixed_Percentage,'
      '       Part_Has_Children, Global_Product)'
      'Values'
      
        '(:Part, :Part_Description, :Part_Cost_List, :Part_Cost_Cat, :Vat' +
        ', '#39'Y'#39','
      
        '       :Auto_Update, :Part_Group, :Purch_Pack_Quantity, :Sell_Pa' +
        'ck_Quantity,'
      
        '       :Part_Purchase_Price, :Part_Mark_Up_List, :Part_Mark_Up_C' +
        'at,'
      '       :Not_In_Use, :Track_Serial_No, '#39'LOT00000'#39','
      
        '       :Numbered, :Price_Unit, :Customer, :Branch, :Sales_Nom, :' +
        'Purch_Nom,'
      
        '       :Markup_Type, :Markup_Val, :Prod_Class, :Product_Type, :U' +
        'nit_of_Measure,'
      
        '       :Order_Part_Online, :Inactive_When_Balance_Zero, :Product' +
        '_ID, :FSC_Material_Claim, :FSC_Mixed_Percentage,'
      '       :Part_Has_Children, :Global_Product)'
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' ')
    Left = 120
    Top = 16
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Description'
      end
      item
        Name = 'Part_Cost_List'
      end
      item
        Name = 'Part_Cost_Cat'
      end
      item
        Name = 'Vat'
      end
      item
        Name = 'Auto_Update'
      end
      item
        Name = 'Part_Group'
        DataType = ftString
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Part_Purchase_Price'
      end
      item
        Name = 'Part_Mark_Up_List'
      end
      item
        Name = 'Part_Mark_Up_Cat'
      end
      item
        Name = 'Not_In_Use'
      end
      item
        Name = 'Track_Serial_No'
      end
      item
        Name = 'Numbered'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Nom'
        DataType = ftString
      end
      item
        Name = 'Purch_Nom'
        DataType = ftString
      end
      item
        Name = 'Markup_Type'
        DataType = ftString
      end
      item
        Name = 'Markup_Val'
        DataType = ftFloat
      end
      item
        Name = 'Prod_Class'
        DataType = ftString
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Unit_of_Measure'
        DataType = ftInteger
      end
      item
        Name = 'Order_Part_Online'
      end
      item
        Name = 'Inactive_When_Balance_Zero'
      end
      item
        Name = 'Product_ID'
      end
      item
        Name = 'FSC_Material_Claim'
        DataType = ftInteger
      end
      item
        Name = 'FSC_Mixed_Percentage'
      end
      item
        Name = 'Part_Has_Children'
      end
      item
        Name = 'Global_Product'
      end>
  end
  object qryCheckProductCode: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part From Part Where Part = :Part'
      ' ')
    Left = 56
    Top = 120
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryAddLevels: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Part_Store_Levels'
      'select top 1 :Part, '
      '          Part_Store_type,'
      '          0,:Stock_Levels,'#39'P'#39',NULL,0'
      'from Part_Store_type')
    Left = 480
    Top = 320
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Stock_Levels'
      end>
  end
  object qryUOM: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Unit_of_Measure'
      'order by UOM_Description')
    Left = 280
    Top = 448
  end
  object dtsUOM: TDataSource
    DataSet = qryUOM
    Left = 360
    Top = 336
  end
  object qryProductTypes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Product_Type'
      'where ((inactive IS NULL) or (inactive <> '#39'Y'#39'))'
      'order by Description')
    Left = 200
    Top = 160
  end
  object dtsProductTypes: TDataSource
    DataSet = qryProductTypes
    Left = 240
    Top = 152
  end
  object qryUpStockRef: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Form_Reference'
      'set Stock_Reference = :Stock_Reference'
      'where Form_Reference = :Form_Reference')
    Left = 360
    Top = 168
    ParamData = <
      item
        Name = 'Stock_Reference'
      end
      item
        Name = 'Form_Reference'
      end>
  end
  object qryUpFormRef: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Form_Reference'
      'set Stock_Reference = '#39#39
      'where Stock_Reference = :Stock_Reference')
    Left = 288
    Top = 168
    ParamData = <
      item
        Name = 'Stock_Reference'
      end>
  end
  object qryDelPartLevels: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Part_Store_Levels'
      'where Part = :Part')
    Left = 448
    Top = 272
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'Order By Claim_Description')
    Left = 472
    Top = 64
  end
  object dtsFSCClaim: TDataSource
    DataSet = qryFSCClaim
    Left = 472
    Top = 112
  end
  object qryGetBOM: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part_Element'
      'where part = :Part')
    Left = 84
    Top = 328
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object dtsGetBOM: TDataSource
    DataSet = qryGetBOM
    Left = 156
    Top = 328
  end
  object qryGetProductType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Nominal, Purchase_Nominal'
      'FROM Product_Type'
      'WHERE Product_Type = :Product_Type')
    Left = 20
    Top = 176
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryDelStoreStockSN: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete'
      'from store_Stock_serial_Item'
      'where '
      '(Select Store_Stock.Store_Stock'
      ' FROM Store_Stock'
      
        ' Where Store_Stock.Part = :Part) = Store_Stock_Serial_Item.store' +
        '_Stock')
    Left = 28
    Top = 440
    ParamData = <
      item
        Name = 'Part'
      end>
  end
end
