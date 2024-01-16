object PBMaintPOrdFrm: TPBMaintPOrdFrm
  Left = 396
  Top = 64
  Caption = 'Maintain Purchase Orders'
  ClientHeight = 565
  ClientWidth = 978
  Color = clBtnFace
  Constraints.MinHeight = 570
  Constraints.MinWidth = 990
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object Label8: TLabel
    Left = 256
    Top = 115
    Width = 70
    Height = 13
    Caption = 'Extra Charges'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 978
    Height = 65
    Align = alTop
    BevelInner = bvRaised
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 972
    DesignSize = (
      978
      65)
    object Label2: TLabel
      Left = 3
      Top = 12
      Width = 51
      Height = 13
      Caption = 'Order No.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 3
      Top = 38
      Width = 55
      Height = 13
      Caption = 'Date Point'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SelDateBtn: TSpeedButton
      Left = 134
      Top = 34
      Width = 23
      Height = 23
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      OnClick = SelDateBtnClick
    end
    object lblAccountManager: TLabel
      Left = 591
      Top = 14
      Width = 68
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Mgr'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 611
    end
    object Label3: TLabel
      Left = 161
      Top = 12
      Width = 43
      Height = 13
      Caption = 'Supplier'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 163
      Top = 38
      Width = 40
      Height = 13
      Caption = 'Contact'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 388
      Top = 38
      Width = 49
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Currency'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitLeft = 460
    end
    object ReqByDateLUBtn: TSpeedButton
      Left = 872
      Top = 32
      Width = 23
      Height = 23
      Anchors = [akTop, akRight]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      OnClick = ReqByDateLUBtnClick
      ExplicitLeft = 944
    end
    object Label33: TLabel
      Left = 808
      Top = 12
      Width = 90
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Supplier rqd date'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 828
    end
    object lblAccountTeam: TLabel
      Left = 581
      Top = 38
      Width = 73
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Team'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 601
    end
    object POrdNoMemo: TMemo
      Left = 63
      Top = 8
      Width = 69
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 0
    end
    object DateEdit: TEdit
      Left = 63
      Top = 34
      Width = 69
      Height = 21
      TabStop = False
      MaxLength = 10
      TabOrder = 1
      OnExit = DateEditExit
    end
    object SupplierEdit: TEdit
      Left = 214
      Top = 8
      Width = 340
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 40
      ReadOnly = True
      TabOrder = 2
      OnChange = SupplierEditChange
      ExplicitWidth = 334
    end
    object ContactEdit: TEdit
      Left = 214
      Top = 34
      Width = 310
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 40
      ReadOnly = True
      TabOrder = 4
      ExplicitWidth = 304
    end
    object SelContactBtn: TButton
      Left = 532
      Top = 33
      Width = 23
      Height = 23
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = SelContactBtnClick
      ExplicitLeft = 526
    end
    object SelSupBtn: TButton
      Left = 560
      Top = 8
      Width = 23
      Height = 23
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = SelSupBtnClick
      ExplicitLeft = 554
    end
    object CurrDBLUCB: TDBLookupComboBox
      Left = 441
      Top = 38
      Width = 25
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Currency_Code'
      ListField = 'Currency_Code_Descr'
      ListSource = PBPODM.CurrSRC
      TabOrder = 7
      Visible = False
      ExplicitLeft = 435
    end
    object CurrClearBitBtn: TBitBtn
      Left = 471
      Top = 38
      Width = 23
      Height = 23
      Hint = 'Clear'
      Anchors = [akTop, akRight]
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Visible = False
      OnClick = CurrClearBitBtnClick
      ExplicitLeft = 465
    end
    object ReqByDateEdit: TEdit
      Left = 802
      Top = 34
      Width = 69
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 10
      TabOrder = 9
      OnChange = ReqByDateEditChange
      OnExit = ReqByDateEditExit
      ExplicitLeft = 796
    end
    object edtAccountTeam: TEdit
      Left = 667
      Top = 34
      Width = 115
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
      ExplicitLeft = 661
    end
    object edtAccountManager: TEdit
      Left = 667
      Top = 10
      Width = 95
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
      ExplicitLeft = 661
    end
    object btnAccountManager: TButton
      Left = 768
      Top = 8
      Width = 23
      Height = 23
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = btnAccountManagerClick
      ExplicitLeft = 762
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 546
    Width = 978
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 250
      end
      item
        Width = 250
      end>
    ExplicitTop = 537
    ExplicitWidth = 972
  end
  object Panel4: TPanel
    Left = 0
    Top = 65
    Width = 978
    Height = 449
    Align = alClient
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 972
    ExplicitHeight = 440
    object OrderLinePage: TPageControl
      Tag = 180
      Left = 1
      Top = 1
      Width = 976
      Height = 447
      ActivePage = tsGeneral
      Align = alClient
      TabOrder = 0
      OnChange = OrderLinePageChange
      ExplicitWidth = 970
      ExplicitHeight = 438
      object tsGeneral: TTabSheet
        Caption = 'General'
        DesignSize = (
          968
          419)
        object Label32: TLabel
          Left = 391
          Top = 82
          Width = 49
          Height = 13
          Caption = 'Form Ref.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 391
          Top = 134
          Width = 53
          Height = 13
          Caption = 'Form Desc'
        end
        object Label25: TLabel
          Left = 391
          Top = 56
          Width = 51
          Height = 13
          Caption = 'Order No.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 8
          Top = 4
          Width = 50
          Height = 13
          Caption = 'Customer'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 8
          Top = 31
          Width = 40
          Height = 13
          Caption = 'Contact'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 8
          Top = 83
          Width = 20
          Height = 13
          Caption = 'Rep'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 8
          Top = 108
          Width = 59
          Height = 13
          Caption = 'Description'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 8
          Top = 180
          Width = 63
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Product/Cat'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 8
          Top = 230
          Width = 32
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Depth'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 228
          Top = 230
          Width = 32
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Width'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 809
          Top = 31
          Width = 108
          Height = 13
          Caption = 'Expected Life (weeks)'
          Visible = False
        end
        object Label51: TLabel
          Left = 8
          Top = 308
          Width = 58
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Qty per Box'
        end
        object Label53: TLabel
          Left = 8
          Top = 275
          Width = 49
          Height = 26
          Anchors = [akLeft, akBottom]
          Caption = 'Sets per Pad/Book'
          WordWrap = True
          ExplicitTop = 293
        end
        object Label52: TLabel
          Left = 8
          Top = 256
          Width = 58
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Numbering'
        end
        object Label41: TLabel
          Left = 391
          Top = 156
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Artwork'
        end
        object PlateChangeLbl: TLabel
          Left = 238
          Top = 282
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Anchors = [akLeft, akBottom]
          Caption = 'No. of Plates'
        end
        object Label31: TLabel
          Left = 391
          Top = 108
          Width = 51
          Height = 13
          Caption = 'Stock Ref.'
        end
        object Label55: TLabel
          Left = 391
          Top = 28
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Date req'#39'd'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CustReqDateBtn: TSpeedButton
          Left = 540
          Top = 23
          Width = 23
          Height = 23
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
            F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
            F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
            F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
            F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
            F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
            F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
            333337FFFFFFFF77333330000000000333333777777777733333}
          NumGlyphs = 2
          OnClick = CustReqDateBtnClick
        end
        object Label61: TLabel
          Left = 587
          Top = 21
          Width = 77
          Height = 29
          Caption = 'Expected Reorder date'
          WordWrap = True
        end
        object ExpLifeDateBtn: TSpeedButton
          Left = 761
          Top = 23
          Width = 23
          Height = 23
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
            F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
            F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
            F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
            F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
            F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
            F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
            333337FFFFFFFF77333330000000000333333777777777733333}
          NumGlyphs = 2
          OnClick = ExpLifeDateBtnClick
        end
        object Label70: TLabel
          Left = 8
          Top = 156
          Width = 76
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Descriptive Ref'
        end
        object lblAltPurchaseOrder: TLabel
          Left = 583
          Top = 56
          Width = 75
          Height = 13
          Caption = 'SAP Order No.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object FormRefClrBitBtn: TBitBtn
          Left = 760
          Top = 77
          Width = 23
          Height = 23
          Hint = 'Clear'
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 27
          OnClick = FormRefClrBitBtnClick
        end
        object FormRefButton: TButton
          Left = 736
          Top = 77
          Width = 23
          Height = 23
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          OnClick = FormRefButtonClick
        end
        object FormDescEdit: TEdit
          Left = 451
          Top = 130
          Width = 275
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 29
        end
        object FormRefEdit: TEdit
          Left = 451
          Top = 78
          Width = 275
          Height = 21
          TabStop = False
          MaxLength = 40
          ReadOnly = True
          TabOrder = 25
        end
        object CustRefEdit: TEdit
          Left = 451
          Top = 52
          Width = 118
          Height = 21
          MaxLength = 40
          TabOrder = 24
          OnChange = CustRefEditChange
          OnExit = CustRefEditExit
        end
        object CustNameEdit: TEdit
          Left = 87
          Top = 0
          Width = 302
          Height = 21
          TabStop = False
          MaxLength = 40
          ReadOnly = True
          TabOrder = 0
        end
        object CustLUBtn: TButton
          Left = 393
          Top = 0
          Width = 23
          Height = 23
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = CustLUBtnClick
        end
        object ContactCombo: TComboBox
          Left = 87
          Top = 27
          Width = 195
          Height = 21
          Style = csDropDownList
          TabOrder = 2
          OnChange = ContactComboChange
          OnClick = ContactComboClick
          OnDropDown = ContactComboDropDown
        end
        object ContactLUBtn: TButton
          Left = 287
          Top = 26
          Width = 23
          Height = 22
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = ContactLUBtnClick
        end
        object RepLUButton: TButton
          Left = 287
          Top = 78
          Width = 23
          Height = 23
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = RepLUButtonClick
        end
        object RepEdit: TEdit
          Left = 87
          Top = 79
          Width = 195
          Height = 21
          TabStop = False
          MaxLength = 40
          ReadOnly = True
          TabOrder = 5
        end
        object CustDescEdit: TMemo
          Left = 87
          Top = 104
          Width = 298
          Height = 44
          Anchors = [akLeft, akTop, akBottom]
          MaxLength = 80
          TabOrder = 7
          WantReturns = False
          OnChange = CustDescEditChange
          OnEnter = CustDescEditEnter
          OnExit = CustDescEditExit
        end
        object OnHoldChkBox: TCheckBox
          Left = 451
          Top = 3
          Width = 108
          Height = 17
          Caption = 'Order ON HOLD'
          TabOrder = 21
          OnClick = OnHoldChkBoxClick
        end
        object ProdTypeEdit: TEdit
          Left = 87
          Top = 176
          Width = 246
          Height = 21
          TabStop = False
          Anchors = [akLeft, akBottom]
          MaxLength = 40
          ReadOnly = True
          TabOrder = 9
        end
        object ProdTypeBtn: TButton
          Left = 339
          Top = 176
          Width = 23
          Height = 22
          Anchors = [akLeft, akBottom]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = ProdTypeBtnClick
        end
        object DepthEdit: TEdit
          Tag = 3
          Left = 87
          Top = 226
          Width = 60
          Height = 21
          Anchors = [akLeft, akBottom]
          TabOrder = 12
          OnChange = DepthEditChange
          OnExit = DepthEditExit
        end
        object WidthEdit: TEdit
          Tag = 4
          Left = 263
          Top = 226
          Width = 60
          Height = 21
          Anchors = [akLeft, akBottom]
          TabOrder = 14
          OnChange = WidthEditChange
          OnExit = WidthEditExit
        end
        object Unit1: TEdit
          Tag = 5
          Left = 151
          Top = 226
          Width = 38
          Height = 21
          TabStop = False
          Anchors = [akLeft, akBottom]
          ReadOnly = True
          TabOrder = 13
          Text = 'mm'
        end
        object Unit2: TEdit
          Tag = 6
          Left = 327
          Top = 226
          Width = 38
          Height = 21
          TabStop = False
          Anchors = [akLeft, akBottom]
          ReadOnly = True
          TabOrder = 15
          Text = 'mm'
        end
        object UpDown1: TUpDown
          Left = 191
          Top = 225
          Width = 16
          Height = 22
          Anchors = [akLeft, akBottom]
          TabOrder = 33
          TabStop = True
          OnChanging = UpDown1Changing
          OnExit = UpDown1Exit
        end
        object UpDown2: TUpDown
          Left = 367
          Top = 225
          Width = 16
          Height = 22
          Anchors = [akLeft, akBottom]
          TabOrder = 34
          TabStop = True
          OnChanging = UpDown2Changing
          OnExit = UpDown2Exit
        end
        object ExpectedLifeSpinEdit: TSpinEdit
          Left = 926
          Top = 26
          Width = 36
          Height = 22
          MaxValue = 52
          MinValue = 0
          TabOrder = 35
          Value = 1
          Visible = False
          OnExit = ExpectedLifeSpinEditExit
        end
        object defaultSizeBtn: TButton
          Left = 393
          Top = 225
          Width = 23
          Height = 22
          Hint = 'Select default size'
          Anchors = [akLeft, akBottom]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          OnClick = defaultSizeBtnClick
        end
        object FormsPerBoxEdit: TEdit
          Left = 87
          Top = 304
          Width = 275
          Height = 21
          Anchors = [akLeft, akBottom]
          MaxLength = 40
          TabOrder = 20
          OnExit = FormsPerBoxEditExit
        end
        object SetsEdit: TEdit
          Left = 87
          Top = 278
          Width = 121
          Height = 21
          Anchors = [akLeft, akBottom]
          TabOrder = 18
          OnExit = SetsEditExit
        end
        object NumberingEdit: TEdit
          Left = 87
          Top = 252
          Width = 275
          Height = 21
          Anchors = [akLeft, akBottom]
          MaxLength = 80
          TabOrder = 17
          OnExit = NumberingEditExit
        end
        object ArtEdit: TMemo
          Left = 451
          Top = 156
          Width = 275
          Height = 68
          Anchors = [akLeft, akTop, akBottom]
          MaxLength = 80
          ScrollBars = ssVertical
          TabOrder = 30
          OnExit = ArtEditExit
        end
        object PlateChangeSpin: TSpinEdit
          Tag = 108
          Left = 321
          Top = 277
          Width = 41
          Height = 22
          Anchors = [akLeft, akBottom]
          MaxValue = 10
          MinValue = 0
          TabOrder = 19
          Value = 0
          OnExit = PlateChangeSpinExit
        end
        object ArtworkBtn: TButton
          Left = 736
          Top = 155
          Width = 23
          Height = 23
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 31
          OnClick = ArtworkBtnClick
        end
        object Panel5: TPanel
          Left = 0
          Top = 333
          Width = 968
          Height = 86
          Align = alBottom
          ParentBackground = False
          TabOrder = 36
          object Label42: TLabel
            Left = 5
            Top = 9
            Width = 45
            Height = 13
            Caption = 'Quantity'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label43: TLabel
            Left = 5
            Top = 36
            Width = 51
            Height = 13
            Caption = 'Cost Price'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label44: TLabel
            Left = 5
            Top = 63
            Width = 46
            Height = 13
            Caption = 'Sell Price'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label60: TLabel
            Left = 167
            Top = 9
            Width = 55
            Height = 13
            Caption = 'Deliver Qty'
          end
          object Label45: TLabel
            Left = 167
            Top = 36
            Width = 48
            Height = 13
            Caption = 'Cost Unit'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label46: TLabel
            Left = 167
            Top = 63
            Width = 43
            Height = 13
            Caption = 'Sell Unit'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 487
            Top = 36
            Width = 56
            Height = 13
            Caption = 'Total Costs'
          end
          object Label27: TLabel
            Left = 487
            Top = 63
            Width = 54
            Height = 13
            Caption = 'Total Sales'
          end
          object ProfitLabel: TLabel
            Left = 657
            Top = 36
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Profit'
          end
          object ProfPercLabel: TLabel
            Left = 650
            Top = 63
            Width = 40
            Height = 13
            Caption = '% Profit'
          end
          object Label28: TLabel
            Left = 330
            Top = 36
            Width = 52
            Height = 13
            Caption = 'Cost Chgs'
          end
          object Label29: TLabel
            Left = 330
            Top = 63
            Width = 59
            Height = 13
            Caption = 'Sales Chrgs'
          end
          object Label49: TLabel
            Left = 330
            Top = 9
            Width = 63
            Height = 13
            Caption = 'Qty Invoiced'
          end
          object Label62: TLabel
            Left = 488
            Top = 9
            Width = 42
            Height = 13
            Caption = 'Vat Rate'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object OrderQtyMemo: TMemo
            Left = 66
            Top = 5
            Width = 87
            Height = 23
            Alignment = taRightJustify
            TabOrder = 0
            WantReturns = False
            WordWrap = False
            OnChange = OrderQtyMemoChange
            OnEnter = SaveValue
            OnExit = ValidateQty
            OnKeyPress = CheckKeyIsNumber
          end
          object OrdPriceMemo: TMemo
            Left = 66
            Top = 32
            Width = 87
            Height = 23
            Alignment = taRightJustify
            TabOrder = 1
            WantReturns = False
            WordWrap = False
            OnChange = OrdPriceMemoChange
            OnEnter = SaveValue
            OnExit = ValidateMoney
            OnKeyPress = CheckKeyIsNumber
          end
          object SellPriceMemo: TMemo
            Left = 66
            Top = 59
            Width = 87
            Height = 23
            Alignment = taRightJustify
            TabOrder = 2
            WantReturns = False
            WordWrap = False
            OnChange = SellPriceMemoChange
            OnEnter = SaveValue
            OnExit = ValidateMoney
            OnKeyPress = CheckKeyIsNumber
          end
          object DeliverQtyMemo: TMemo
            Left = 236
            Top = 5
            Width = 76
            Height = 23
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
          end
          object OrderUnitDBLCB: TDBLookupComboBox
            Left = 236
            Top = 32
            Width = 85
            Height = 21
            KeyField = 'Price_Unit'
            ListField = 'Description'
            ListSource = PBPODM.PriceUnitSRC
            TabOrder = 4
            OnClick = OrderUnitDBLCBClick
          end
          object SellUnitDBLCB: TDBLookupComboBox
            Left = 236
            Top = 59
            Width = 85
            Height = 21
            KeyField = 'Price_Unit'
            ListField = 'Description'
            ListSource = PBPODM.PriceUnitSRC
            TabOrder = 5
            OnClick = SellUnitDBLCBClick
          end
          object TotOrderMemo: TMemo
            Left = 554
            Top = 32
            Width = 80
            Height = 23
            Alignment = taRightJustify
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 6
            WantReturns = False
            WordWrap = False
          end
          object TotSellMemo: TMemo
            Left = 554
            Top = 59
            Width = 80
            Height = 23
            Alignment = taRightJustify
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 7
            WantReturns = False
            WordWrap = False
          end
          object ProfMemo: TMemo
            Left = 690
            Top = 32
            Width = 80
            Height = 23
            Alignment = taRightJustify
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 8
            WantReturns = False
            WordWrap = False
          end
          object PercProfMemo: TMemo
            Left = 690
            Top = 59
            Width = 80
            Height = 23
            Alignment = taRightJustify
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 9
            WantReturns = False
            WordWrap = False
          end
          object OrdChrgMemo: TMemo
            Left = 403
            Top = 32
            Width = 76
            Height = 23
            Alignment = taRightJustify
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 10
            WantReturns = False
            WordWrap = False
          end
          object SlsChrgMemo: TMemo
            Left = 403
            Top = 59
            Width = 76
            Height = 23
            Alignment = taRightJustify
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 11
            WantReturns = False
            WordWrap = False
          end
          object InvoiceQtyMemo: TMemo
            Left = 403
            Top = 5
            Width = 76
            Height = 23
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 12
            WordWrap = False
          end
          object dblkpVatRate: TDBLookupComboBox
            Left = 554
            Top = 5
            Width = 103
            Height = 21
            KeyField = 'Vat_Code'
            ListField = 'Vat_Rate'
            ListSource = PBPODM.dtsVatCode
            TabOrder = 13
            OnClick = dblkpVatRateClick
          end
          object btnPriceChanges: TButton
            Left = 688
            Top = 4
            Width = 75
            Height = 25
            Hint = 'View Price change history'
            Caption = '&History'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
            OnClick = btnPriceChangesClick
          end
        end
        object StockRefEdit: TEdit
          Left = 451
          Top = 104
          Width = 275
          Height = 21
          TabStop = False
          Color = clBtnFace
          MaxLength = 40
          ReadOnly = True
          TabOrder = 28
        end
        object CustReqDateEdit: TEdit
          Left = 451
          Top = 24
          Width = 86
          Height = 21
          MaxLength = 10
          TabOrder = 22
          OnChange = CustReqDateEditChange
          OnEnter = CustReqDateEditEnter
          OnExit = CustReqDateEditExit
        end
        object GroupBox1: TGroupBox
          Left = 400
          Top = 251
          Width = 377
          Height = 75
          Anchors = [akLeft, akBottom]
          Caption = 'Proofs'
          ParentBackground = False
          TabOrder = 32
          object ProofByLabel: TLabel
            Left = 8
            Top = 22
            Width = 65
            Height = 13
            Caption = 'Required by:'
          end
          object ProofStatLabel: TLabel
            Left = 8
            Top = 53
            Width = 77
            Height = 13
            Caption = 'Current Status:'
          end
          object lblProofStatus: TLabel
            Left = 256
            Top = 53
            Width = 24
            Height = 13
            Caption = 'Date'
            Visible = False
          end
          object ProofsReqChkBox: TCheckBox
            Left = 8
            Top = 0
            Width = 113
            Height = 17
            Caption = 'Proofs Required'
            TabOrder = 0
            OnClick = ProofsReqChkBoxClick
            OnExit = ProofsReqChkBoxExit
          end
          object ProofsDateEdit: TEdit
            Left = 88
            Top = 18
            Width = 97
            Height = 21
            TabStop = False
            Enabled = False
            MaxLength = 10
            ReadOnly = True
            TabOrder = 1
            OnExit = ProofsDateEditExit
          end
          object ProofDateBtn: TBitBtn
            Left = 192
            Top = 16
            Width = 25
            Height = 25
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
              F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
              F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
              F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
              F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
              F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
              F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
              333337FFFFFFFF77333330000000000333333777777777733333}
            NumGlyphs = 2
            TabOrder = 2
            OnClick = ProofDateBtnClick
            OnExit = ProofDateBtnExit
          end
          object ProofsBitBtn: TBitBtn
            Left = 294
            Top = 16
            Width = 75
            Height = 25
            Caption = 'Status'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
              FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
              FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
              FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C880733777777777733700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            TabOrder = 3
            Visible = False
            OnClick = ProofsBitBtnClick
          end
          object ProofStatDBLUCB: TDBLookupComboBox
            Left = 88
            Top = 49
            Width = 161
            Height = 21
            KeyField = 'Proof_Status'
            ListField = 'Description'
            ListSource = PBPODM.ProofStatSRC
            TabOrder = 4
            OnClick = ProofStatDBLUCBClick
            OnExit = ProofStatDBLUCBExit
          end
          object edtProofStatusDate: TEdit
            Left = 288
            Top = 49
            Width = 81
            Height = 21
            TabStop = False
            Enabled = False
            MaxLength = 10
            ReadOnly = True
            TabOrder = 5
            Visible = False
            OnExit = ProofsDateEditExit
          end
        end
        object edtLifeExp: TEdit
          Left = 670
          Top = 24
          Width = 86
          Height = 21
          MaxLength = 10
          TabOrder = 23
          OnExit = edtLifeExpExit
        end
        object edtDescReference: TEdit
          Left = 87
          Top = 152
          Width = 246
          Height = 21
          Anchors = [akLeft, akBottom]
          MaxLength = 40
          TabOrder = 8
          OnExit = edtDescReferenceExit
        end
        object pnlFSCClaim: TPanel
          Left = 0
          Top = 199
          Width = 441
          Height = 25
          Anchors = [akLeft, akBottom]
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 11
          object lblFSCClaim: TLabel
            Left = 8
            Top = 6
            Width = 48
            Height = 13
            Caption = 'FSC/PEFC'
          end
          object lblFSCMix: TLabel
            Left = 288
            Top = 6
            Width = 30
            Height = 13
            Caption = '% Mix'
          end
          object dblkpFSCClaim: TDBLookupComboBox
            Left = 87
            Top = 2
            Width = 161
            Height = 21
            KeyField = 'FSC_Material_Claim'
            ListField = 'Claim_Description'
            ListSource = PBPODM.dtsFSCClaim
            TabOrder = 0
            OnClick = dblkpFSCClaimClick
          end
          object spnFSCMix: TSpinEdit
            Left = 328
            Top = 1
            Width = 55
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
            OnExit = spnFSCMixExit
          end
          object btnClearClaim: TBitBtn
            Left = 393
            Top = 1
            Width = 23
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
        object pnlCostCentre: TPanel
          Left = 0
          Top = 50
          Width = 337
          Height = 27
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 4
          Visible = False
          object lblCostCentre: TLabel
            Left = 8
            Top = 7
            Width = 60
            Height = 13
            Caption = 'Cost Centre'
          end
          object edtCostCentre: TEdit
            Left = 87
            Top = 3
            Width = 195
            Height = 21
            TabStop = False
            MaxLength = 40
            ReadOnly = True
            TabOrder = 0
          end
          object btnCostCentre: TButton
            Left = 287
            Top = 2
            Width = 23
            Height = 23
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btnCostCentreClick
          end
        end
        object chkbxFileCopies: TCheckBox
          Left = 451
          Top = 231
          Width = 326
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = 'File Copies Received'
          TabOrder = 37
          OnClick = chkbxFileCopiesClick
        end
        object edtAltPurchaseOrder: TEdit
          Left = 670
          Top = 52
          Width = 130
          Height = 21
          MaxLength = 40
          TabOrder = 38
          OnExit = edtAltPurchaseOrderExit
        end
      end
      object tsParts: TTabSheet
        Caption = 'Specification'
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 968
          Height = 136
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          object sgPartDetails: TStringGrid
            Left = 1
            Top = 1
            Width = 966
            Height = 134
            Align = alClient
            ColCount = 12
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
            PopupMenu = pumPartDetails
            TabOrder = 0
            OnClick = sgPartDetailsClick
            OnContextPopup = sgPartDetailsContextPopup
            OnDrawCell = sgPartDetailsDrawCell
            OnEnter = sgPartDetailsEnter
            OnExit = sgPartDetailsExit
            ColWidths = (
              64
              102
              93
              85
              102
              95
              129
              131
              100
              99
              93
              102)
          end
          object ColourComboBox: TComboBox
            Tag = 105
            Left = 175
            Top = 21
            Width = 114
            Height = 21
            Hint = 'Paper_Colour'
            MaxLength = 40
            TabOrder = 1
            Visible = False
            OnClick = ColourComboBoxClick
            OnEnter = ColourComboBoxEnter
            OnExit = ColourComboBoxExit
            OnKeyPress = ColourComboBoxKeyPress
          end
          object WeightComboBox: TComboBox
            Tag = 106
            Left = 303
            Top = 23
            Width = 114
            Height = 21
            Hint = 'Paper_Weight'
            MaxLength = 40
            TabOrder = 2
            Visible = False
            OnClick = WeightComboBoxClick
            OnEnter = ColourComboBoxEnter
            OnExit = WeightComboBoxExit
            OnKeyPress = ColourComboBoxKeyPress
          end
          object BrandComboBox: TComboBox
            Tag = 107
            Left = 303
            Top = 49
            Width = 114
            Height = 21
            Hint = 'Paper_Brand'
            MaxLength = 40
            TabOrder = 3
            Visible = False
            OnClick = BrandComboBoxClick
            OnEnter = ColourComboBoxEnter
            OnExit = BrandComboBoxExit
            OnKeyPress = ColourComboBoxKeyPress
          end
          object MaterialComboBox: TComboBox
            Tag = 108
            Left = 303
            Top = 75
            Width = 114
            Height = 21
            Hint = 'Paper_Material'
            MaxLength = 40
            TabOrder = 4
            Visible = False
            OnClick = MaterialComboBoxClick
            OnEnter = ColourComboBoxEnter
            OnExit = MaterialComboBoxExit
            OnKeyPress = MaterialComboBoxKeyPress
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 136
          Width = 968
          Height = 138
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          object SameAsLbl: TLabel
            Left = 286
            Top = 52
            Width = 64
            Height = 13
            Caption = 'Same as Part'
            Visible = False
          end
          object AddNotesMemo: TMemo
            Left = 0
            Top = 16
            Width = 968
            Height = 122
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
            OnChange = AddNotesMemoChange
          end
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 968
            Height = 16
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = 'Notes'
            ParentBackground = False
            TabOrder = 1
          end
        end
        object pnlVersions: TPanel
          Left = 0
          Top = 274
          Width = 968
          Height = 145
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'pnlVersions'
          ParentBackground = False
          TabOrder = 2
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 968
            Height = 14
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = 'Versions'
            ParentBackground = False
            TabOrder = 0
          end
          object Panel14: TPanel
            Left = 877
            Top = 14
            Width = 91
            Height = 131
            Align = alRight
            Alignment = taRightJustify
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            object btnAddStockCode: TBitBtn
              Left = 8
              Top = 8
              Width = 75
              Height = 25
              Hint = 'Add a new Works Instruction to this Job Bag'
              Caption = '&Add'
              TabOrder = 0
              OnClick = btnAddStockCodeClick
            end
            object btnChangeStockCode: TBitBtn
              Left = 8
              Top = 40
              Width = 75
              Height = 25
              Hint = 'Change the selected Works Instruction'
              Caption = '&Change'
              Enabled = False
              TabOrder = 1
              OnClick = btnChangeStockCodeClick
            end
            object btnDeleteStockCode: TBitBtn
              Left = 8
              Top = 72
              Width = 75
              Height = 25
              Hint = 'Delete the selected Works Instruction from this Job Bag'
              Caption = '&Delete'
              Enabled = False
              TabOrder = 2
              OnClick = btnDeleteStockCodeClick
            end
          end
          object sgVersions: TStringGrid
            Left = 0
            Top = 14
            Width = 877
            Height = 131
            Align = alClient
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goRowSelect]
            TabOrder = 2
            OnDblClick = sgVersionsDblClick
            OnDrawCell = sgVersionsDrawCell
            ColWidths = (
              146
              164
              199
              98
              91)
          end
        end
      end
      object tsQuestions: TTabSheet
        Caption = 'Template'
        object Panel10: TPanel
          Left = 0
          Top = 33
          Width = 968
          Height = 386
          Align = alClient
          ParentBackground = False
          TabOrder = 0
          object sbQuestions: TScrollBox
            Tag = 140
            Left = 1
            Top = 1
            Width = 966
            Height = 384
            Align = alClient
            TabOrder = 0
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 968
          Height = 33
          Align = alTop
          ParentBackground = False
          TabOrder = 1
          object ProductQLbl: TLabel
            Left = 16
            Top = 8
            Width = 138
            Height = 13
            Caption = 'Questions for Product type'
          end
        end
      end
      object tsSupplierDetails: TTabSheet
        Caption = 'Supplier Details'
        ImageIndex = 6
        DesignSize = (
          968
          419)
        object Label56: TLabel
          Left = 8
          Top = 24
          Width = 51
          Height = 13
          Caption = 'Supplier'#39's'
        end
        object Label38: TLabel
          Left = 8
          Top = 38
          Width = 59
          Height = 13
          Caption = 'Description'
        end
        object Label39: TLabel
          Left = 8
          Top = 80
          Width = 86
          Height = 13
          Caption = 'Quote Reference'
        end
        object Label40: TLabel
          Left = 8
          Top = 105
          Width = 72
          Height = 13
          Caption = 'Job Reference'
        end
        object Label57: TLabel
          Left = 400
          Top = 8
          Width = 70
          Height = 13
          Caption = 'Extra Charges'
        end
        object Label12: TLabel
          Left = 8
          Top = 184
          Width = 87
          Height = 13
          Caption = 'Additional Notes'
        end
        object SuppDescEdit: TMemo
          Left = 112
          Top = 24
          Width = 269
          Height = 46
          Lines.Strings = (
            '')
          MaxLength = 80
          TabOrder = 0
          WantReturns = False
          OnExit = SuppDescEditExit
        end
        object SuppRefEdit: TEdit
          Left = 112
          Top = 72
          Width = 165
          Height = 21
          MaxLength = 20
          TabOrder = 1
          OnExit = SuppRefEditExit
        end
        object SuppJobRefEdit: TEdit
          Left = 112
          Top = 97
          Width = 165
          Height = 21
          MaxLength = 20
          TabOrder = 2
          OnExit = SuppJobRefEditExit
        end
        object ExtChgDetsStringGrid: TStringGrid
          Left = 400
          Top = 24
          Width = 478
          Height = 89
          Anchors = [akLeft, akTop, akRight]
          ColCount = 3
          DefaultRowHeight = 18
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
          ScrollBars = ssVertical
          TabOrder = 3
          OnDblClick = ExtChgDetsStringGridDblClick
          OnDrawCell = ExtChgDetsStringGridDrawCell
          OnSelectCell = ExtChgDetsStringGridSelectCell
          ColWidths = (
            243
            59
            50)
        end
        object ExtChgFuncGrpBox: TGroupBox
          Left = 400
          Top = 120
          Width = 249
          Height = 49
          Caption = 'Function'
          ParentBackground = False
          TabOrder = 4
          object ExtChgAddBitBtn: TBitBtn
            Left = 40
            Top = 16
            Width = 50
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
            OnClick = ExtChgAddBitBtnClick
          end
          object ExtChgChgBitBtn: TBitBtn
            Left = 100
            Top = 16
            Width = 70
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
            OnClick = ExtChgChgBitBtnClick
          end
          object ExtChgDelBitBtn: TBitBtn
            Left = 176
            Top = 16
            Width = 66
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
            OnClick = ExtChgDelBitBtnClick
          end
          object btnLUAddChrg: TButton
            Left = 8
            Top = 16
            Width = 25
            Height = 25
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = btnLUAddChrgClick
          end
        end
        object ValueMemo: TMemo
          Left = 688
          Top = 135
          Width = 65
          Height = 25
          Alignment = taRightJustify
          Color = clBtnFace
          Enabled = False
          Lines.Strings = (
            'ValueMe'
            'mo')
          ReadOnly = True
          TabOrder = 5
        end
        object AddDetailsMemo: TMemo
          Left = 240
          Top = 200
          Width = 185
          Height = 121
          Color = clBtnFace
          TabOrder = 6
        end
        object AddDetailsList: TListBox
          Tag = 120
          Left = 8
          Top = 200
          Width = 225
          Height = 73
          ItemHeight = 13
          PopupMenu = pumAddNotes
          TabOrder = 7
          OnClick = AddDetailsListClick
          OnContextPopup = AddDetailsListContextPopup
          OnDblClick = AddDetailsListDblClick
        end
        object gbAddDets: TGroupBox
          Left = 9
          Top = 277
          Width = 225
          Height = 44
          Caption = 'Function'
          ParentBackground = False
          TabOrder = 8
          object btnAddSuppCustNotes: TBitBtn
            Left = 4
            Top = 15
            Width = 70
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
            OnClick = btnAddSuppCustNotesClick
          end
          object btnChgSuppCustNotes: TBitBtn
            Left = 76
            Top = 15
            Width = 70
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
            OnClick = btnChgSuppCustNotesClick
          end
          object btnDelSuppCustNotes: TBitBtn
            Left = 148
            Top = 15
            Width = 70
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
            OnClick = btnDelSuppCustNotesClick
          end
        end
        object ExtChgSelectBitBtn: TBitBtn
          Left = 575
          Top = 136
          Width = 66
          Height = 25
          Caption = 'Select'
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
          TabOrder = 9
          OnClick = ExtChgSelectBitBtnClick
        end
      end
      object tsDelivery: TTabSheet
        Caption = 'Delivery'
        ImageIndex = 7
        DesignSize = (
          968
          419)
        object Label58: TLabel
          Left = 4
          Top = 8
          Width = 187
          Height = 13
          Caption = 'Deliveries for the selected Order line'
        end
        object Label6: TLabel
          Left = 256
          Top = 257
          Width = 73
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Total Deliv Qty'
          ExplicitLeft = 276
        end
        object OrdQtyLbl: TLabel
          Left = 257
          Top = 282
          Width = 77
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Order Quantity'
          ExplicitLeft = 277
        end
        object Label69: TLabel
          Left = 129
          Top = 332
          Width = 44
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Job Type'
          ExplicitLeft = 201
        end
        object DelivDetsStringGrid: TStringGrid
          Left = 4
          Top = 24
          Width = 411
          Height = 185
          Anchors = [akLeft, akTop, akRight]
          ColCount = 2
          DefaultRowHeight = 18
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
          ScrollBars = ssVertical
          TabOrder = 0
          OnClick = DelivDetsStringGridClick
          OnDblClick = DelivDetsStringGridDblClick
          OnDrawCell = DelivDetsStringGridDrawCell
          OnSelectCell = DelivDetsStringGridSelectCell
          ColWidths = (
            201
            67)
        end
        object DelivAddBitBtn: TBitBtn
          Left = 4
          Top = 216
          Width = 70
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
          OnClick = DelivAddBitBtnClick
        end
        object DelivChgBitBtn: TBitBtn
          Left = 76
          Top = 216
          Width = 70
          Height = 25
          Caption = 'Change  '
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
          TabOrder = 2
          OnClick = DelivChgBitBtnClick
        end
        object DelivDelBitBtn: TBitBtn
          Left = 150
          Top = 216
          Width = 70
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
          TabOrder = 3
          OnClick = DelivDelBitBtnClick
        end
        object QtyMemo: TMemo
          Left = 343
          Top = 252
          Width = 73
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Color = clBtnFace
          Lines.Strings = (
            'QtyMemo')
          ReadOnly = True
          TabOrder = 4
        end
        object OrdQtyMemo: TMemo
          Left = 343
          Top = 278
          Width = 73
          Height = 23
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 5
          WantReturns = False
        end
        object Panel1: TPanel
          Left = 490
          Top = 0
          Width = 478
          Height = 419
          Align = alRight
          Enabled = False
          ParentBackground = False
          TabOrder = 6
          object Label1: TLabel
            Left = 156
            Top = 293
            Width = 70
            Height = 13
            Caption = 'Cust required'
          end
          object Label11: TLabel
            Left = 323
            Top = 293
            Width = 74
            Height = 13
            Caption = 'Date delivered'
          end
          object Label59: TLabel
            Left = 156
            Top = 261
            Width = 74
            Height = 13
            Caption = 'Supp required'
          end
          object DelInstructPanel: TPanel
            Left = 1
            Top = 344
            Width = 476
            Height = 74
            Align = alBottom
            Enabled = False
            ParentBackground = False
            TabOrder = 0
            object Label24: TLabel
              Left = 9
              Top = 10
              Width = 104
              Height = 13
              Caption = 'Delivery Instructions'
            end
            object DelInstructMemo: TMemo
              Left = 147
              Top = 2
              Width = 302
              Height = 70
              Color = clBtnFace
              TabOrder = 0
            end
          end
          object AddrTypeRadGrp: TRadioGroup
            Left = 7
            Top = 22
            Width = 105
            Height = 105
            Caption = 'Address Type'
            Enabled = False
            Items.Strings = (
              'Ad Hoc'
              'Supplier'
              'Rep'
              'Customer'
              'Company')
            ParentBackground = False
            TabOrder = 1
          end
          object AddrGrpBox: TGroupBox
            Left = 158
            Top = 22
            Width = 315
            Height = 225
            Caption = 'Address Details'
            Enabled = False
            ParentBackground = False
            TabOrder = 2
            object AddrTypeLabel: TLabel
              Left = 8
              Top = 28
              Width = 23
              Height = 13
              Caption = 'Type'
            end
            object BranchNameLabel: TLabel
              Left = 8
              Top = 76
              Width = 35
              Height = 13
              Caption = 'Branch'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 8
              Top = 101
              Width = 41
              Height = 13
              Caption = 'Address'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 8
              Top = 202
              Width = 47
              Height = 13
              Caption = 'Postcode'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object lblFAO: TLabel
              Left = 8
              Top = 52
              Width = 21
              Height = 13
              Caption = 'FAO'
            end
            object Label54: TLabel
              Left = 144
              Top = 202
              Width = 37
              Height = 13
              Caption = 'County'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object NameEdit: TEdit
              Left = 65
              Top = 24
              Width = 240
              Height = 21
              Color = clBtnFace
              MaxLength = 40
              ReadOnly = True
              TabOrder = 0
            end
            object BranchNameEdit: TEdit
              Left = 65
              Top = 72
              Width = 240
              Height = 21
              Color = clBtnFace
              MaxLength = 40
              ReadOnly = True
              TabOrder = 1
            end
            object BuildingEdit: TEdit
              Left = 65
              Top = 97
              Width = 240
              Height = 21
              Color = clBtnFace
              MaxLength = 40
              ReadOnly = True
              TabOrder = 2
            end
            object StreetEdit: TEdit
              Left = 65
              Top = 121
              Width = 240
              Height = 21
              Color = clBtnFace
              MaxLength = 40
              ReadOnly = True
              TabOrder = 3
            end
            object LocaleEdit: TEdit
              Left = 65
              Top = 145
              Width = 240
              Height = 21
              Color = clBtnFace
              MaxLength = 40
              ReadOnly = True
              TabOrder = 4
            end
            object TownEdit: TEdit
              Left = 65
              Top = 170
              Width = 240
              Height = 21
              Color = clBtnFace
              MaxLength = 40
              ReadOnly = True
              TabOrder = 5
            end
            object PostCodeEdit: TEdit
              Left = 65
              Top = 198
              Width = 72
              Height = 21
              CharCase = ecUpperCase
              Color = clBtnFace
              MaxLength = 10
              ReadOnly = True
              TabOrder = 6
            end
            object edtFAO: TEdit
              Left = 65
              Top = 48
              Width = 240
              Height = 21
              Color = clBtnFace
              MaxLength = 40
              ReadOnly = True
              TabOrder = 7
            end
            object CountyEdit: TEdit
              Left = 185
              Top = 196
              Width = 120
              Height = 21
              CharCase = ecUpperCase
              Color = clBtnFace
              MaxLength = 10
              ReadOnly = True
              TabOrder = 8
            end
          end
          object QtysGrpBox: TGroupBox
            Left = 5
            Top = 145
            Width = 145
            Height = 137
            Caption = 'Quantities'
            Enabled = False
            ParentBackground = False
            TabOrder = 3
            object Label19: TLabel
              Left = 8
              Top = 21
              Width = 50
              Height = 13
              Caption = 'To Deliver'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 8
              Top = 51
              Width = 48
              Height = 13
              Caption = 'Delivered'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 8
              Top = 81
              Width = 43
              Height = 13
              Caption = 'Invoiced'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 8
              Top = 104
              Width = 31
              Height = 13
              Caption = 'No Of'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 8
              Top = 118
              Width = 29
              Height = 13
              Caption = 'Boxes'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object QtyToDeliverMemo: TMemo
              Left = 72
              Top = 16
              Width = 65
              Height = 25
              Alignment = taRightJustify
              Color = clBtnFace
              TabOrder = 0
              WantReturns = False
              OnEnter = SaveValue
              OnExit = ValidateQty
            end
            object QtyDeliveredMemo: TMemo
              Left = 72
              Top = 46
              Width = 65
              Height = 25
              Alignment = taRightJustify
              Color = clBtnFace
              Enabled = False
              TabOrder = 1
              WantReturns = False
              OnEnter = SaveValue
              OnExit = ValidateQty
            end
            object QtyInvoicedMemo: TMemo
              Left = 72
              Top = 76
              Width = 65
              Height = 25
              Alignment = taRightJustify
              Color = clBtnFace
              Enabled = False
              TabOrder = 2
              WantReturns = False
              OnEnter = SaveValue
              OnExit = ValidateQty
            end
            object NoOfBoxesMemo: TMemo
              Left = 72
              Top = 106
              Width = 65
              Height = 25
              Alignment = taRightJustify
              Color = clBtnFace
              TabOrder = 3
              WantReturns = False
              OnEnter = SaveValue
              OnExit = ValidateQty
            end
          end
          object DatePointEdit: TEdit
            Left = 236
            Top = 257
            Width = 81
            Height = 21
            Color = clBtnFace
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object DeliveryDateEdit: TEdit
            Left = 402
            Top = 289
            Width = 73
            Height = 21
            Color = clBtnFace
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object DeliverViachk: TCheckBox
            Left = 10
            Top = 4
            Width = 385
            Height = 17
            Caption = 'DeliverViachk'
            Enabled = False
            TabOrder = 6
            Visible = False
          end
          object CustReqDelDateEdit: TEdit
            Left = 236
            Top = 289
            Width = 81
            Height = 21
            Color = clBtnFace
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object DeliveryToStockChk: TCheckBox
            Left = 324
            Top = 257
            Width = 121
            Height = 17
            Caption = 'Delivery in to stock'
            Enabled = False
            TabOrder = 8
          end
        end
        object DelivsSelectBitBtn: TBitBtn
          Left = 150
          Top = 216
          Width = 70
          Height = 25
          Caption = 'Select'
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
          TabOrder = 7
          OnClick = DelivsSelectBitBtnClick
        end
        object chkInvoiceUpfront: TCheckBox
          Left = 8
          Top = 368
          Width = 185
          Height = 17
          Caption = 'Is the stock invoiced upfront?'
          Enabled = False
          TabOrder = 8
          Visible = False
          OnClick = chkInvoiceUpfrontClick
        end
        object dblkpJobType: TDBLookupComboBox
          Left = 193
          Top = 328
          Width = 185
          Height = 21
          Anchors = [akTop, akRight]
          KeyField = 'Job_Type'
          ListField = 'Job_Type_Description'
          ListSource = PBPODM.dtsJobType
          TabOrder = 9
          OnClick = dblkpJobTypeClick
        end
        object btnClearJobType: TBitBtn
          Left = 383
          Top = 328
          Width = 23
          Height = 23
          Hint = 'Clear'
          Anchors = [akTop, akRight]
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          OnClick = btnClearJobTypeClick
        end
      end
      object tsCalloffs: TTabSheet
        Caption = 'Call Offs'
        ImageIndex = 5
        DesignSize = (
          968
          419)
        object TLabel
          Left = 704
          Top = 16
          Width = 77
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'No. of Call offs'
          ExplicitLeft = 724
        end
        object Label4: TLabel
          Left = 704
          Top = 62
          Width = 61
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Stock Order'
          ExplicitLeft = 724
        end
        object Label13: TLabel
          Left = 704
          Top = 91
          Width = 54
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Scheduled'
          ExplicitLeft = 724
        end
        object Label14: TLabel
          Left = 704
          Top = 120
          Width = 48
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Delivered'
          ExplicitLeft = 724
        end
        object Label15: TLabel
          Left = 704
          Top = 152
          Width = 41
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'In Stock'
          ExplicitLeft = 724
        end
        object sgCallOff: TStringGrid
          Left = 8
          Top = 8
          Width = 672
          Height = 333
          Anchors = [akLeft, akTop, akRight, akBottom]
          ColCount = 4
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          PopupMenu = popCallOff
          TabOrder = 0
          OnDblClick = sgCallOffDblClick
          OnDrawCell = sgCallOffDrawCell
          OnSelectCell = sgCallOffSelectCell
          ColWidths = (
            102
            77
            204
            79)
        end
        object CallOffAddBtn: TBitBtn
          Left = 9
          Top = 356
          Width = 70
          Height = 25
          Anchors = [akLeft, akBottom]
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
          OnClick = CallOffAddBtnClick
        end
        object CallOffChgBtn: TBitBtn
          Left = 81
          Top = 356
          Width = 70
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Change  '
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
          TabOrder = 2
          OnClick = CallOffChgBtnClick
        end
        object CallOffDelBtn: TBitBtn
          Left = 153
          Top = 356
          Width = 70
          Height = 25
          Anchors = [akLeft, akBottom]
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
          TabOrder = 3
          OnClick = CallOffDelBtnClick
        end
        object NoCallOffEdit: TEdit
          Left = 813
          Top = 8
          Width = 72
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 4
          OnChange = NoCallOffEditChange
        end
        object StockQtyMemo: TMemo
          Left = 805
          Top = 52
          Width = 80
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 5
        end
        object SchedQtyMemo: TMemo
          Left = 805
          Top = 81
          Width = 80
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 6
        end
        object DelivQtyMemo: TMemo
          Left = 805
          Top = 111
          Width = 80
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 7
        end
        object InStockQtyMemo: TMemo
          Left = 805
          Top = 140
          Width = 80
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Color = clBtnFace
          Enabled = False
          ReadOnly = True
          TabOrder = 8
        end
      end
      object tsStockUsage: TTabSheet
        Caption = 'Stock Usage'
        ImageIndex = 8
        OnResize = tsStockUsageResize
        object pnlStockUsage: TPanel
          Left = 0
          Top = 0
          Width = 968
          Height = 205
          Align = alTop
          Caption = 'pnlStockUsage'
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            968
            205)
          object Label72: TLabel
            Left = 8
            Top = 4
            Width = 32
            Height = 13
            Caption = 'Usage'
          end
          object Label74: TLabel
            Left = 805
            Top = 177
            Width = 60
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Total Usage'
            ExplicitLeft = 797
          end
          object lblTotalUsage: TLabel
            Left = 877
            Top = 177
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Anchors = [akRight, akBottom]
            Caption = 'lblTotalUsage'
            ExplicitLeft = 869
          end
          object Label76: TLabel
            Left = 10
            Top = 177
            Width = 77
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Order Quantity'
          end
          object lblOrdQtyStockUsage: TLabel
            Left = 120
            Top = 176
            Width = 110
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'lblOrdQtyStockUsage'
          end
          object dbgStockUsage: TDBGrid
            Left = 8
            Top = 25
            Width = 965
            Height = 140
            Anchors = [akLeft, akTop, akRight, akBottom]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'Date_Received'
                Title.Caption = 'Date'
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Part_Store_Name'
                Title.Caption = 'Warehouse'
                Width = 111
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Part_Movement_Bin'
                Title.Caption = 'Bin'
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Part_Store_Lot'
                Title.Caption = 'Lot'
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Part_Move_Type_Descr'
                Title.Caption = 'Movement Type'
                Width = 106
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Part_Movement_Reference'
                Title.Caption = 'Reference'
                Width = 160
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Stock_Pack_Quantity'
                Title.Caption = 'Pack Size'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Store_Quantity'
                Title.Caption = 'Quantity'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Audit_User'
                Title.Caption = 'User'
                Width = 142
                Visible = True
              end>
          end
        end
        object pnlStock: TPanel
          Left = 0
          Top = 205
          Width = 968
          Height = 214
          Align = alClient
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            968
            214)
          object Label73: TLabel
            Left = 8
            Top = 4
            Width = 70
            Height = 13
            Caption = 'Current Stock'
          end
          object Label75: TLabel
            Left = 791
            Top = 188
            Width = 77
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Available Stock'
          end
          object lblTotalStock: TLabel
            Left = 863
            Top = 188
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Anchors = [akRight, akBottom]
            Caption = 'lblTotalUsage'
          end
          object dbgStock: TDBGrid
            Left = 9
            Top = 23
            Width = 945
            Height = 156
            Anchors = [akLeft, akTop, akRight, akBottom]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'Part_Store_Name'
                Title.Caption = 'Warehouse'
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Part_Bin'
                Title.Caption = 'Bin'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Part_Store_Lot'
                Title.Caption = 'Lot'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Qty_in_Stock'
                Title.Caption = 'Qty in Stock'
                Width = 81
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Qty_allocated'
                Title.Caption = 'Qty Allocated'
                Width = 84
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Free_Stock'
                Title.Caption = 'Free Stock'
                Width = 87
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Date_Received'
                Title.Caption = 'Date Received'
                Width = 87
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Store_Cost'
                Title.Caption = 'Cost'
                Width = 90
                Visible = True
              end>
          end
        end
      end
      object tsIntNotes: TTabSheet
        Caption = 'Notes / Documents'
        ImageIndex = 6
        object pnlDocs: TPanel
          Left = 0
          Top = 209
          Width = 968
          Height = 210
          Align = alBottom
          ParentBackground = False
          TabOrder = 0
          OnResize = pnlDocsResize
          DesignSize = (
            968
            210)
          object lblDocs: TLabel
            Left = 12
            Top = 8
            Width = 61
            Height = 13
            Caption = 'Documents:'
          end
          object ocWord: TOleContainer
            Left = 440
            Top = 56
            Width = 145
            Height = 73
            Caption = 'ocWord'
            TabOrder = 8
            Data = {
              42444F430100000000500000D0CF11E0A1B11AE1000000000000000000000000
              000000003E000300FEFF09000600000000000000000000000100000001000000
              00000000001000000200000001000000FEFFFFFF0000000000000000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF0C000000FEFFFFFF0D00000005000000
              060000000700000008000000090000000A0000000B000000FEFFFFFF1E000000
              FEFFFFFF0F000000100000001100000012000000130000001400000015000000
              FEFFFFFF1700000018000000190000001A0000001B0000001C0000001D000000
              FEFFFFFFFEFFFFFF200000002100000022000000230000002400000025000000
              26000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000016000500FFFFFFFFFFFFFFFF0400000006090200
              00000000C00000000000004600000000000000000000000030950963EB47DA01
              03000000400200000000000001004F006C006500000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000A000201FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000140000000000000031005400610062006C0065000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000E0002000100000003000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              040000000010000000000000010043006F006D0070004F0062006A0000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              010000006A00000000000000FEFFFFFF02000000FEFFFFFF0400000005000000
              060000000700000008000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0100000200000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000100FEFF030A0000FFFFFFFF0609020000000000
              C000000000000046180000004D6963726F736F667420576F726420446F63756D
              656E74000A0000004D53576F7264446F630010000000576F72642E446F63756D
              656E742E3800F439B27100000000000000000000000000000000000000000000
              000000000000000000000000FFFFFFFF030000000400000001000000FFFFFFFF
              020000000000000047390000E701000002010000010009000003810000000200
              1C00000000001400000026060F001E00FFFFFFFF040014000000576F72640E00
              4D6963726F736F667420576F7264050000000B0200000000050000000C027300
              880D1C000000FB029CFF0000000000009001000000000440001254696D657320
              4E657720526F6D616E001643C8771F43C87720C0CA7700003000040000002D01
              000005000000020101000000050000000902000000020D000000320A00000000
              0100040000000000880D730020632D001C000000FB021000070000000000BC02
              000000000102022253797374656D000000000A0026008A0100000000FFFFFFFF
              9CC712002942C877040000002D01010003000000000000000000000000000000
              00000000000000004E414E4914000F000A00010069000F000300000000000000
              000038000040F1FF020038000C0006004E006F0072006D0061006C0000000200
              00001800434A18005F480104614A18006D480908734809087448090400000000
              00000000000000000000000000003C004140F2FFA1003C000C00160044006500
              6600610075006C00740020005000610072006100670072006100700068002000
              46006F006E00740000000000000000000000000000000000010000000500000C
              00000000FFFFFFFF010000000420FFFF0100182BA30000000000000000000100
              0000000000000000000000000300000098000000003000000000000000800000
              0080000400000104000003000000000400000104000004000000000400000104
              000005000000FF400180010000000000000000009CF282000100000000000000
              0000000000000000000000000210000000000000000100000050000008004000
              00FFFF01000000070055006E006B006E006F0077006E00FFFF01000800000000
              00000000000000FFFF010000000000FFFF00000200FFFF00000000FFFF000002
              00FFFF000000000300000047169001000002020603050405020304877A002000
              0000800800000000000000FF01000000000000540069006D006500730020004E
              0065007700200052006F006D0061006E00000035169001020005050102010706
              020507000000000000001000000000000000000000008000000000530079006D
              0062006F006C000000332690010000020B0604020202020204877A0020000000
              800800000000000000FF0100000000000041007200690061006C000000220004
              003108881800F0D0020000680100000000C0828B46C0828B4600000000020000
              0000000000000000000000010001000000040003100100000000000000000000
              000100010000000100000000000000240300F010000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000A506C007B400B4008181123000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000020000008E02000000000000000000F01000080000
              0000000000000000000000000000000000000000000000000000000000FFFF12
              0000000000000000000000000000000C004400610076006900640020004E0061
              0079006C006F0072000C004400610076006900640020004E00610079006C006F
              0072000000000000000000000000000000000000000000000000000000000000
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
              0000000000000000000000004F0062006A0065006300740050006F006F006C00
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000160001010200000006000000FFFFFFFF00000000
              0000000000000000000000000000000030950963EB47DA0130950963EB47DA01
              00000000000000000000000002004F006C006500500072006500730030003000
              3000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000018000201FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              03000000440100000000000057006F007200640044006F00630075006D006500
              6E00740000000000000000000000000000000000000000000000000000000000
              0000000000000000000000001A0002000500000007000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              0E00000000100000000000000500530075006D006D0061007200790049006E00
              66006F0072006D006100740069006F006E000000000000000000000000000000
              00000000000000000000000028000201FFFFFFFF08000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              1600000000100000000000000000000000000000000000000000000000000000
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
              000000000000000000000000ECA5C100372009040000F012BF00000000000010
              0000000000040000010400000E00626A626A5516551600000000000000000000
              000000000000000009041600320C0000377C0000377C00000100000000000000
              000000000000000000000000000000000000000000000000FFFF0F0000000000
              00000000FFFF0F000000000000000000FFFF0F00000000000000000000000000
              000000006C0000000000A800000000000000A8000000A800000000000000A800
              000000000000A800000000000000A800000000000000A8000000140000000000
              000000000000DC00000000000000F600000000000000F600000000000000F600
              000000000000F60000000C000000020100000C000000DC000000000000009B01
              0000B60000001A010000000000001A010000000000001A010000000000001A01
              0000000000001A010000000000001A010000000000001A010000000000001A01
              0000000000001A010000020000001C010000000000001C010000000000001C01
              0000000000001C010000000000001C010000000000001C010000240000005102
              000020020000710400005A000000400100001500000000000000000000000000
              000000000000A8000000000000001A0100000000000000000000000000000000
              0000000000001A010000000000001A010000000000001A010000000000001A01
              00000000000040010000000000001A01000000000000A800000000000000A800
              0000000000001A0100000000000000000000000000001A010000000000005501
              0000160000001A010000000000001A010000000000001A010000000000001A01
              000000000000A8000000000000001A01000000000000A8000000000000001A01
              0000000000001A0100000000000000000000000000001A010000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000001A010000000000001A010000000000001A01
              0000000000001A0100000000000000000000000000001A01000000000000A800
              000000000000A800000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000001A010000000000001A010000000000000E0100000C000000803E
              F372CBCBC401DC0000001A000000F6000000000000001A010000000000001A01
              00000000000000000000000000001A010000000000006B010000300000009B01
              0000000000001A01000000000000CB040000000000001A01000000000000CB04
              0000000000001A010000000000001A01000000000000BC00000012000000CE00
              00000E000000A800000000000000A800000000000000A800000000000000A800
              0000000000000200D90000000D00000000000000000000000000000000000000
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
              0000000000000000000000000004000001040000000000000000000000000000
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
              0000000000000000000000010004000001040000FD0000000000000000000000
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
              0000000000000001000000010004000001040000FD0000000000000000000000
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
              000000000000040400010101300026500900319068011FB0832E20B0C84121B0
              050722B005072390A0052490A00525B0000017B0C50218B0C5020C90C4020000
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
              000000000000000000000000FEFF000005010200000000000000000000000000
              0000000001000000E0859FF2F94F6810AB9108002B27B3D93000000078010000
              110000000100000090000000020000009800000003000000A400000004000000
              B000000005000000C800000006000000D400000007000000E000000008000000
              F4000000090000000C01000012000000180100000A000000340100000C000000
              400100000D0000004C0100000E000000580100000F0000006001000010000000
              68010000130000007001000002000000E40400001E0000000100000000007300
              1E00000001000000000073001E0000000D0000004461766964204E61796C6F72
              00006F001E00000001000000006176691E00000001000000006176691E000000
              0B0000004E6F726D616C2E646F7400721E0000000D0000004461766964204E61
              796C6F7200006F001E00000002000000320076691E000000130000004D696372
              6F736F667420576F726420392E30000040000000000000000000000040000000
              0078926ACBCBC401400000000078926ACBCBC401030000000100000003000000
              0000000003000000000000000300000000000000000000000000000000000000
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
              000000000000000000000000050044006F00630075006D0065006E0074005300
              75006D006D0061007200790049006E0066006F0072006D006100740069006F00
              6E000000000000000000000038000200FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              1F00000000100000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FEFF000005010200000000000000000000000000
              000000000100000002D5CDD59C2E1B10939708002B2CF9AE30000000F4000000
              0C00000001000000680000000F00000070000000050000008800000006000000
              90000000110000009800000017000000A00000000B000000A800000010000000
              B000000013000000B800000016000000C00000000D000000C80000000C000000
              D500000002000000E40400001E0000001000000043656E74726572656564204C
              74642E0003000000010000000300000001000000030000000000000003000000
              A00A09000B000000000000000B000000000000000B000000000000000B000000
              000000001E1000000100000001000000000C100000020000001E000000060000
              005469746C650003000000010000000000000000000000000000000000000000
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
              000000000000000000000000}
          end
          object ocExcel: TOleContainer
            Left = 613
            Top = 57
            Width = 136
            Height = 76
            AllowInPlace = False
            AutoActivate = aaManual
            Caption = 'ocExcel'
            TabOrder = 7
            Data = {
              42444F430100000000180000D0CF11E0A1B11AE1000000000000000000000000
              000000003E000300FEFF09000600000000000000000000000100000001000000
              00000000001000000200000001000000FEFFFFFF0000000000000000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF07000000FEFFFFFF0400000005000000
              0600000008000000FEFFFFFF090000000A000000FEFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000016000500FFFFFFFFFFFFFFFF0200000020080200
              00000000C00000000000004600000000000000000000000030950963EB47DA01
              03000000400D00000000000001004F006C006500000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000A000201FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000001400000000000000010043006F006D0070004F0062006A0000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000120002010100000004000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              01000000660000000000000057006F0072006B0062006F006F006B0000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              030000005506000000000000FEFFFFFF02000000FEFFFFFF0400000005000000
              060000000700000008000000090000000A0000000B0000000C0000000D000000
              0E0000000F000000100000001100000012000000130000001400000015000000
              160000001700000018000000190000001A0000001B0000001C000000FEFFFFFF
              1E0000001F000000200000002100000022000000230000002400000025000000
              260000002700000028000000290000002A0000002B0000002C000000FEFFFFFF
              2E0000002F00000030000000FEFFFFFF320000003300000034000000FEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0100000200000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000100FEFF030A0000FFFFFFFF2008020000000000
              C0000000000000461A0000004D6963726F736F667420457863656C20576F726B
              736865657400060000004269666638000E000000457863656C2E53686565742E
              3800F439B2710000000000000000000000000000000000000000000000000000
              0000000000000000000000000908100000060500AF18CD07C140000006010000
              E1000200B004C10002000000E20000005C0070000C00004461766964204E6179
              6C6F722020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202042000200B004610102000000C00100003D01020001009C0002000E00
              DE0008000C00000003000001190002000000120002000000130002000000AF01
              02000000BC01020000003D00120078002D004C3B7E2738000000000001005802
              4000020000008D00020000002200020000000E0002000100B70102000000DA00
              0200000031001A00C8000000FF7F900100000000000005014100720069006100
              6C0031001A00C8000000FF7F9001000000000000050141007200690061006C00
              31001A00C8000000FF7F9001000000000000050141007200690061006C003100
              1A00C8000000FF7F9001000000000000050141007200690061006C001E041800
              050013000022A322232C2323303B5C2D22A322232C2323301E041D0006001800
              0022A322232C2323303B5B5265645D5C2D22A322232C2323301E041E00070019
              000022A322232C2323302E30303B5C2D22A322232C2323302E30301E04230008
              001E000022A322232C2323302E30303B5B5265645D5C2D22A322232C2323302E
              30301E0435002A003000005F2D22A3222A20232C2323305F2D3B5C2D22A3222A
              20232C2323305F2D3B5F2D22A3222A20222D225F2D3B5F2D405F2D1E042C0029
              002700005F2D2A20232C2323305F2D3B5C2D2A20232C2323305F2D3B5F2D2A20
              222D225F2D3B5F2D405F2D1E043D002C003800005F2D22A3222A20232C232330
              2E30305F2D3B5C2D22A3222A20232C2323302E30305F2D3B5F2D22A3222A2022
              2D223F3F5F2D3B5F2D405F2D1E0434002B002F00005F2D2A20232C2323302E30
              305F2D3B5C2D2A20232C2323302E30305F2D3B5F2D2A20222D223F3F5F2D3B5F
              2D405F2DE000140000000000F5FF200000000000000000000000C020E0001400
              01000000F5FF200000F40000000000000000C020E000140001000000F5FF2000
              00F40000000000000000C020E000140002000000F5FF200000F4000000000000
              0000C020E000140002000000F5FF200000F40000000000000000C020E0001400
              00000000F5FF200000F40000000000000000C020E000140000000000F5FF2000
              00F40000000000000000C020E000140000000000F5FF200000F4000000000000
              0000C020E000140000000000F5FF200000F40000000000000000C020E0001400
              00000000F5FF200000F40000000000000000C020E000140000000000F5FF2000
              00F40000000000000000C020E000140000000000F5FF200000F4000000000000
              0000C020E000140000000000F5FF200000F40000000000000000C020E0001400
              00000000F5FF200000F40000000000000000C020E000140000000000F5FF2000
              00F40000000000000000C020E000140000000000010020000000000000000000
              0000C020E000140001002B00F5FF200000F80000000000000000C020E0001400
              01002900F5FF200000F80000000000000000C020E000140001002C00F5FF2000
              00F80000000000000000C020E000140001002A00F5FF200000F8000000000000
              0000C020E000140001000900F5FF200000F80000000000000000C02093020400
              108003FF93020400118006FF93020400128004FF93020400138007FF93020400
              008000FF93020400148005FF60010200000085000E0062050000000006005368
              656574318C00040001002C00C1010800C101000060690100FC00080000000000
              00000000FF00020008000A0000000908100000061000AF18CD07C14000000601
              00000D00020001000C00020064000F000200010011000200000010000800FCA9
              F1D24D62503F5F00020001002A00020000002B00020000008200020001008000
              08000000000000000000250204000000FF0081000200C1041400000015000000
              830002000000840002000000A10022000000FF00010001000100040000000000
              000000000000E03F000000000000E03F000055000200080000020E0000000000
              000001000000000000003E021200B60600000000400000000000000000000000
              1D000F00030000000000000100000000000000EF0006000000370000000A0000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FFFFFFFF030000000400000001000000FFFFFFFF
              0200000000000000550D000022070000A6030000010009000003D30100000400
              09000000000005000000090200000000050000000102FFFFFF00050000000401
              0D00000005000000020102000000050000000C0245008100030000001E000400
              00002701FFFF030000001E00040000002701FFFF050000000B02000000000300
              00001E00050000000102FFFFFF0005000000090200000000040000002701FFFF
              030000001E0005000000010202004F006C006500500072006500730030003000
              3000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000180002000300000005000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              1D000000E8030000000000000500530075006D006D0061007200790049006E00
              66006F0072006D006100740069006F006E000000000000000000000000000000
              00000000000000000000000028000201FFFFFFFF06000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              2D000000E000000000000000050044006F00630075006D0065006E0074005300
              75006D006D0061007200790049006E0066006F0072006D006100740069006F00
              6E000000000000000000000038000200FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              3100000000010000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FFFFFF0005000000090200000000070000001604
              4500810000000000040000002701FFFF030000001E00050000000102FFFFFF00
              050000000902000000000700000016044500810000000000040000002701FFFF
              030000001E00050000000102FFFFFF0005000000090200000000070000001604
              4500810001000100040000002701FFFF030000001E00050000000102FFFFFF00
              05000000090200000000070000001604450081000000000007000000FC020000
              C0C0C0000000040000002D010000050000000902C0C0C000050000000102C0C0
              C0000500000004010D0000000500000002010200000008000000FA0200000000
              0000C0C0C000040000002D010100050000001402000000000500000013020000
              800008000000FA0200000000000000000000040000002D010200090000001D06
              2100F0000100800000000000040000002D010100050000001402110000000500
              0000130211008000040000002D010200090000001D062100F000010080001100
              0000040000002D01010005000000140222000000050000001302220080000400
              00002D010200090000001D062100F0000100800022000000040000002D010100
              0500000014023300000005000000130233008000040000002D01020009000000
              1D062100F0000100800033000000040000002D01010005000000140244000000
              05000000130244008000040000002D010200090000001D062100F00001008000
              44000000040000002D0101000500000014020000000005000000130245000000
              040000002D010200090000001D062100F0004500010000000000040000002D01
              01000500000014020000400005000000130245004000040000002D0102000900
              00001D062100F0004500010000004000040000002D0101000500000014020000
              800005000000130245008000040000002D010200090000001D062100F0004500
              01000000800007000000FC020000000000000000040000002D01030004000000
              2701FFFF030000001E00050000000102C0C0C000050000000902C0C0C0000700
              000016044500810001000100040000002701FFFF030000000000000000000000
              0000000000000000000000004E414E4900000000000000000000000000000000
              000000000000000000000000FEFF000005010200000000000000000000000000
              0000000001000000E0859FF2F94F6810AB9108002B27B3D930000000B0000000
              0700000001000000400000000400000048000000080000006000000012000000
              780000000C000000900000000D0000009C00000013000000A800000002000000
              E40400001E0000000D0000004461766964204E61796C6F72000078001E000000
              0D0000004461766964204E61796C6F72000078001E000000100000004D696372
              6F736F667420457863656C004000000080C2BB142ECBC40140000000003E576C
              C1CBC40103000000000000000000000000000000000000000000000000000000
              000000000000000000000000FEFF000005010200000000000000000000000000
              000000000100000002D5CDD59C2E1B10939708002B2CF9AE30000000D0000000
              0900000001000000500000000F0000005800000017000000700000000B000000
              780000001000000080000000130000008800000016000000900000000D000000
              980000000C000000AB00000002000000E40400001E0000001000000043656E74
              726572656564204C74642E0003000000A00A09000B000000000000000B000000
              000000000B000000000000000B000000000000001E1000000100000007000000
              536865657431000C100000020000001E0000000B000000576F726B7368656574
              7300030000000100000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000}
          end
          object btbtnAddDoc: TBitBtn
            Left = 13
            Top = 182
            Width = 70
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
            OnClick = btbtnAddDocClick
          end
          object btbtnChangeDoc: TBitBtn
            Left = 90
            Top = 182
            Width = 70
            Height = 25
            Caption = 'Change  '
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
            TabOrder = 2
            OnClick = btbtnChangeDocClick
          end
          object btbtnDeleteDoc: TBitBtn
            Left = 167
            Top = 182
            Width = 70
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
            TabOrder = 3
            OnClick = btbtnDeleteDocClick
          end
          object btbtnOpen: TBitBtn
            Left = 244
            Top = 182
            Width = 70
            Height = 25
            Caption = 'Open'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555FFFFFFFFFF55555000000000055555577777777775FFFF00B8B8B8B8B0
              0000775F5555555777770B0B8B8B8B8B0FF07F75F555555575F70FB0B8B8B8B8
              B0F07F575FFFFFFFF7F70BFB0000000000F07F557777777777570FBFBF0FFFFF
              FFF07F55557F5FFFFFF70BFBFB0F000000F07F55557F777777570FBFBF0FFFFF
              FFF075F5557F5FFFFFF750FBFB0F000000F0575FFF7F777777575700000FFFFF
              FFF05577777F5FF55FF75555550F00FF00005555557F775577775555550FFFFF
              0F055555557F55557F755555550FFFFF00555555557FFFFF7755555555000000
              0555555555777777755555555555555555555555555555555555}
            NumGlyphs = 2
            TabOrder = 4
            OnClick = btbtnOpenClick
          end
          object btbtnWordDoc: TBitBtn
            Left = 432
            Top = 182
            Width = 163
            Height = 25
            Caption = 'New Word Document'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
              555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
              05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
              FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
              FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
              FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
              05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
              555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
              9055575757575757775505050505055505557575757575557555}
            NumGlyphs = 2
            TabOrder = 5
            OnClick = NewOfficeDoc
          end
          object btbtnExcelSheet: TBitBtn
            Left = 600
            Top = 182
            Width = 163
            Height = 25
            Caption = 'New Excel Spreadsheet'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C8807FF7777777777FF700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            TabOrder = 6
            OnClick = NewOfficeDoc
          end
          object strgrdDocs: TStringGrid
            Left = 12
            Top = 26
            Width = 955
            Height = 151
            Anchors = [akLeft, akTop, akRight]
            ColCount = 2
            DefaultColWidth = 150
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
            TabOrder = 0
            OnDblClick = btbtnOpenClick
          end
          object btnEmail: TBitBtn
            Left = 351
            Top = 182
            Width = 75
            Height = 25
            Hint = 'Set appointment'
            Caption = 'Email'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
              000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
              FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
              FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
              9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
              0000777777777777777733333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = btnEmailClick
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 968
          Height = 209
          Align = alClient
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            968
            209)
          object Label63: TLabel
            Left = 16
            Top = 6
            Width = 33
            Height = 13
            Caption = 'Notes:'
          end
          object lblNote: TLabel
            Left = 404
            Top = 6
            Width = 28
            Height = 13
            Caption = 'Note:'
          end
          object sgIntNotes: TStringGrid
            Left = 16
            Top = 24
            Width = 369
            Height = 150
            Anchors = [akLeft, akTop, akBottom]
            ColCount = 2
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
            TabOrder = 0
            OnClick = sgIntNotesClick
            ColWidths = (
              146
              136)
          end
          object btbtnAddIntNote: TBitBtn
            Left = 16
            Top = 179
            Width = 75
            Height = 25
            Hint = 'Adds the text to the right as a new note.'
            Anchors = [akLeft, akBottom]
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
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btbtnAddIntNoteClick
          end
          object btbtnChangeIntNote: TBitBtn
            Left = 96
            Top = 179
            Width = 75
            Height = 25
            Hint = 'Updates the selected note with the text to the right.'
            Anchors = [akLeft, akBottom]
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
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btbtnChangeIntNoteClick
          end
          object btbtnDeleteIntNote: TBitBtn
            Left = 176
            Top = 179
            Width = 75
            Height = 25
            Hint = 'Deletes the selected note.'
            Anchors = [akLeft, akBottom]
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
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = btbtnDeleteIntNoteClick
          end
          object btbtnAppntmnt: TBitBtn
            Left = 311
            Top = 179
            Width = 75
            Height = 25
            Hint = 'Set appointment'
            Anchors = [akLeft, akBottom]
            Caption = 'App'#39'ts'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
              7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
              777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
              79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
              7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
              777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
              79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
              CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = btbtnAppntmntClick
          end
          object mmIntNote: TMemo
            Left = 404
            Top = 24
            Width = 550
            Height = 180
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 5
          end
        end
      end
      object tsNCA: TTabSheet
        Caption = 'NCA'
        ImageIndex = 9
        object pnlFunctions: TPanel
          Left = 883
          Top = 0
          Width = 85
          Height = 419
          Align = alRight
          ParentBackground = False
          TabOrder = 0
          ExplicitLeft = 877
          ExplicitHeight = 410
          object btnAddNCA: TBitBtn
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Add a new Works Instruction to this Job Bag'
            Caption = '&Add'
            TabOrder = 0
            OnClick = btnAddNCAClick
          end
          object btnChangeNCA: TBitBtn
            Left = 8
            Top = 40
            Width = 75
            Height = 25
            Hint = 'Change the selected Works Instruction'
            Caption = '&Change'
            Enabled = False
            TabOrder = 1
            OnClick = btnChangeNCAClick
          end
          object btnDeleteNCA: TBitBtn
            Left = 8
            Top = 72
            Width = 75
            Height = 25
            Hint = 'Delete the selected Works Instruction from this Job Bag'
            Caption = '&Delete'
            Enabled = False
            TabOrder = 2
            OnClick = btnDeleteNCAClick
          end
          object btnPrintNCA: TBitBtn
            Left = 8
            Top = 104
            Width = 75
            Height = 25
            Hint = 'Delete the selected Works Instruction from this Job Bag'
            Caption = '&Print'
            Enabled = False
            TabOrder = 3
            OnClick = btnPrintNCAClick
          end
        end
        object Panel25: TPanel
          Left = 0
          Top = 0
          Width = 883
          Height = 419
          Align = alClient
          Caption = 'Panel25'
          ParentBackground = False
          TabOrder = 1
          ExplicitWidth = 877
          ExplicitHeight = 410
          object sgNCADetails: TStringGrid
            Left = 1
            Top = 1
            Width = 881
            Height = 112
            Align = alTop
            ColCount = 10
            DefaultColWidth = 40
            DefaultRowHeight = 18
            RowCount = 3
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 0
            OnClick = sgNCADetailsClick
            OnDblClick = sgNCADetailsDblClick
            OnDrawCell = sgNCADetailsDrawCell
            ExplicitWidth = 875
            ColWidths = (
              40
              87
              88
              142
              119
              136
              136
              116
              99
              86)
          end
          object Panel26: TPanel
            Left = 1
            Top = 113
            Width = 881
            Height = 24
            Align = alTop
            ParentBackground = False
            TabOrder = 1
            ExplicitWidth = 875
            object Label10: TLabel
              Left = 9
              Top = 6
              Width = 135
              Height = 13
              Caption = 'Non Conformance Details:'
            end
          end
          object memNCADetails: TMemo
            Left = 1
            Top = 137
            Width = 881
            Height = 281
            Align = alClient
            Color = clBtnFace
            Lines.Strings = (
              '')
            ReadOnly = True
            TabOrder = 2
            ExplicitWidth = 875
            ExplicitHeight = 272
          end
        end
      end
      object tbInvoicing: TTabSheet
        Caption = 'Invoicing'
        ImageIndex = 7
        OnResize = tbInvoicingResize
        object pnlSalesInvs: TPanel
          Left = 0
          Top = 0
          Width = 968
          Height = 217
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            968
            217)
          object Label64: TLabel
            Left = 8
            Top = 4
            Width = 70
            Height = 13
            Caption = 'Sales Invoices'
          end
          object Label66: TLabel
            Left = 204
            Top = 164
            Width = 30
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Totals'
          end
          object strgrdSalesInvs: TStringGrid
            Left = 8
            Top = 24
            Width = 964
            Height = 129
            Anchors = [akLeft, akTop, akRight, akBottom]
            ColCount = 10
            DefaultRowHeight = 18
            DefaultDrawing = False
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
            TabOrder = 0
            OnDblClick = strgrdSalesInvsDblClick
            OnDrawCell = InvsGridsDrawCell
          end
          object mmSInvQtyTot: TMemo
            Left = 240
            Top = 160
            Width = 64
            Height = 22
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Color = clMenu
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object mmSInvGoodsTot: TMemo
            Left = 360
            Top = 160
            Width = 90
            Height = 22
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Color = clMenu
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object mmSInvVatTot: TMemo
            Left = 538
            Top = 160
            Width = 90
            Height = 22
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Color = clMenu
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object mmSInvGrandTot: TMemo
            Left = 628
            Top = 160
            Width = 90
            Height = 22
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Color = clMenu
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object chkbxInvoiceBeforeDelivery: TCheckBox
            Left = 8
            Top = 164
            Width = 185
            Height = 17
            Anchors = [akLeft, akBottom]
            Caption = 'Invoice before delivery of goods'
            TabOrder = 5
            OnClick = chkbxInvoiceBeforeDeliveryClick
          end
          object chkbxClearedFunds: TCheckBox
            Left = 8
            Top = 188
            Width = 289
            Height = 17
            Anchors = [akLeft, akBottom]
            Caption = 'Cash Sale/Cleared funds required before delivery of job'
            TabOrder = 6
            OnClick = chkbxInvoiceBeforeDeliveryClick
          end
          object chkbxMake2Invoice: TCheckBox
            Left = 632
            Top = 193
            Width = 113
            Height = 17
            Caption = 'available to invoice'
            TabOrder = 7
            Visible = False
            OnClick = chkbxMake2InvoiceClick
          end
        end
        object pnlPurchInvs: TPanel
          Left = 0
          Top = 217
          Width = 968
          Height = 202
          Align = alClient
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            968
            202)
          object Label65: TLabel
            Left = 8
            Top = 4
            Width = 90
            Height = 13
            Caption = 'Purchase Invoices'
          end
          object Label67: TLabel
            Left = 204
            Top = 173
            Width = 30
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Totals'
          end
          object Label68: TLabel
            Left = 8
            Top = 173
            Width = 44
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Quantity'
          end
          object strgrdPurchInvs: TStringGrid
            Left = 8
            Top = 24
            Width = 952
            Height = 138
            Anchors = [akLeft, akTop, akRight, akBottom]
            ColCount = 10
            DefaultRowHeight = 18
            DefaultDrawing = False
            RowCount = 2
            TabOrder = 0
            OnDblClick = strgrdPurchInvsDblClick
            OnDrawCell = InvsGridsDrawCell
          end
          object mmPInvQtyTot: TMemo
            Left = 240
            Top = 169
            Width = 64
            Height = 22
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Color = clMenu
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object mmPInvGoodsTot: TMemo
            Left = 360
            Top = 169
            Width = 90
            Height = 22
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Color = clMenu
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object mmPInvVatTot: TMemo
            Left = 538
            Top = 169
            Width = 90
            Height = 22
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Color = clMenu
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object mmPInvGrandTot: TMemo
            Left = 628
            Top = 169
            Width = 90
            Height = 22
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Color = clMenu
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object mmOrdQtyInvTab: TMemo
            Left = 62
            Top = 169
            Width = 76
            Height = 23
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
            Color = clMenu
            TabOrder = 5
            WantReturns = False
            WordWrap = False
            OnChange = OrderQtyMemoChange
            OnEnter = SaveValue
            OnExit = ValidateQty
            OnKeyPress = CheckKeyIsNumber
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 514
    Width = 978
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 505
    ExplicitWidth = 972
    DesignSize = (
      978
      32)
    object lblAuthorisedBy: TLabel
      Left = 316
      Top = 10
      Width = 81
      Height = 13
      Caption = 'lblAuthorisedBy'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object ViewBitBtn: TBitBtn
      Left = 432
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Lines'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      TabOrder = 0
      Visible = False
      OnClick = ViewBitBtnClick
    end
    object LineDelBitBtn: TBitBtn
      Left = 512
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akLeft, akTop, akBottom]
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
      TabOrder = 1
      Visible = False
      OnClick = LineDelBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 822
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Cancel = True
      Caption = '&Cancel'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = CancelBitBtnClick
      ExplicitLeft = 816
    end
    object OKBitBtn: TBitBtn
      Left = 740
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'S&ave'
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
      TabOrder = 3
      OnClick = OKBitBtnClick
      ExplicitLeft = 734
    end
    object OleContainer1: TOleContainer
      Left = 592
      Top = 7
      Width = 17
      Height = 26
      Caption = 'OleContainer1'
      TabOrder = 4
      Visible = False
    end
    object btnJobBag: TBitBtn
      Left = 8
      Top = 4
      Width = 121
      Height = 25
      Caption = 'Job Bag'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      TabOrder = 5
      Visible = False
      OnClick = btnJobBagClick
    end
    object chkbxAuthorised: TCheckBox
      Left = 144
      Top = 8
      Width = 161
      Height = 17
      Caption = 'Authorised'
      TabOrder = 6
      OnClick = chkbxAuthorisedClick
    end
    object btnAuthNotes: TBitBtn
      Left = 352
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Reason'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F3308800000007
        703337F37777777FF7F33080000000007033373777777777F73F087000222000
        77037F3777333777FF7F08000222220007037F777F3333777F7F0F0002222200
        07037F777F3333777F7F0F000822220008037F777FF33377737F0F7000882000
        780373F777FFF777F373308000000000803337F77777777737F330F800000008
        8033373F777777733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 7
      OnClick = btnAuthNotesClick
    end
  end
  object pumPartDetails: TPopupMenu
    Left = 117
    Top = 107
    object Add1: TMenuItem
      Caption = 'Add'
      OnClick = Add1Click
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = btnDeletePartClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MarginDefaults1: TMenuItem
      Caption = 'Set Margin Defaults'
      OnClick = MarginDefaults1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MaintainPapers1: TMenuItem
      Caption = 'Maintain Papers'
      OnClick = MaintainPapers1Click
    end
  end
  object pumAddNotes: TPopupMenu
    Left = 245
    Top = 124
    object Add2: TMenuItem
      Caption = '&Add'
      OnClick = btnAddSuppCustNotesClick
    end
    object Change2: TMenuItem
      Caption = '&Change'
      OnClick = btnChgSuppCustNotesClick
    end
    object Delete2: TMenuItem
      Caption = '&Delete'
      OnClick = btnDelSuppCustNotesClick
    end
  end
  object popCallOff: TPopupMenu
    OnPopup = popCallOffPopup
    Left = 173
    Top = 116
    object Add3: TMenuItem
      Caption = '&Add'
      OnClick = CallOffAddBtnClick
    end
    object Change1: TMenuItem
      Caption = '&Change'
      OnClick = CallOffChgBtnClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object popCallOffDelbtn: TMenuItem
      Caption = '&Delete'
      OnClick = CallOffDelBtnClick
    end
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 385
    Top = 390
  end
  object FlashTimer: TTimer
    OnTimer = FlashTimerTimer
    Left = 173
    Top = 434
  end
  object DocOpenDialog: TOpenDialog
    Left = 288
    Top = 8
  end
end
