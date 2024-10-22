object PBMaintSalesInvoicefrm: TPBMaintSalesInvoicefrm
  Left = 70
  Top = 27
  Caption = 'Sales Invoice Details'
  ClientHeight = 563
  ClientWidth = 896
  Color = clBtnFace
  Constraints.MinHeight = 535
  Constraints.MinWidth = 797
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object stbrDetails: TStatusBar
    Left = 0
    Top = 544
    Width = 896
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 896
    Height = 544
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlEndUser: TPanel
      Left = 0
      Top = 36
      Width = 896
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      Visible = False
      DesignSize = (
        896
        31)
      object Label53: TLabel
        Left = 8
        Top = 7
        Width = 46
        Height = 13
        Caption = 'End User'
      end
      object edtEndUser: TEdit
        Left = 96
        Top = 3
        Width = 307
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 0
      end
      object btnEndUser: TBitBtn
        Left = 411
        Top = 1
        Width = 25
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnEndUserClick
      end
    end
    object pnlFooter: TPanel
      Left = 0
      Top = 383
      Width = 896
      Height = 120
      Align = alBottom
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        896
        120)
      object Panel5: TPanel
        Left = 474
        Top = 1
        Width = 421
        Height = 118
        Align = alRight
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          421
          118)
        object Label3: TLabel
          Left = 250
          Top = 11
          Width = 34
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Goods'
          ExplicitLeft = 264
        end
        object Label4: TLabel
          Left = 253
          Top = 38
          Width = 18
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'VAT'
          ExplicitLeft = 267
        end
        object Label5: TLabel
          Left = 250
          Top = 67
          Width = 25
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Total'
          ExplicitLeft = 264
        end
        object memGoods: TMemo
          Left = 304
          Top = 7
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Lines.Strings = (
            '')
          ReadOnly = True
          TabOrder = 0
        end
        object memVAT: TMemo
          Left = 304
          Top = 34
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Lines.Strings = (
            '')
          ReadOnly = True
          TabOrder = 1
        end
        object memTotal: TMemo
          Left = 304
          Top = 63
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Lines.Strings = (
            '')
          ReadOnly = True
          TabOrder = 2
        end
        object pnlPackPrice: TPanel
          Left = 0
          Top = 89
          Width = 421
          Height = 29
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 3
          DesignSize = (
            421
            29)
          object Label51: TLabel
            Left = 108
            Top = 10
            Width = 44
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Quantity'
            ExplicitLeft = 122
          end
          object labUnitSell: TLabel
            Left = 229
            Top = 10
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Anchors = [akRight, akBottom]
            Caption = 'TotalsGoHere'
            ExplicitLeft = 243
          end
          object dblkpPriceUnit: TDBLookupComboBox
            Left = 305
            Top = 6
            Width = 89
            Height = 21
            Anchors = [akRight, akBottom]
            KeyField = 'Price_Unit'
            ListField = 'Description'
            TabOrder = 0
            OnClick = dblkpPriceUnitClick
          end
          object FormRefClrBitBtn: TBitBtn
            Left = 397
            Top = 5
            Width = 23
            Height = 23
            Hint = 'Clear'
            Anchors = [akRight, akBottom]
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
            TabOrder = 1
            OnClick = FormRefClrBitBtnClick
          end
          object memQuantity: TMemo
            Left = 157
            Top = 6
            Width = 66
            Height = 20
            Anchors = [akTop, akRight]
            TabOrder = 2
            OnChange = memQuantityChange
            OnEnter = memQuantityEnter
            OnExit = ValidateQty
            OnKeyPress = memQuantityKeyPress
          end
        end
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 440
        Height = 118
        Align = alLeft
        Caption = 'Panel7'
        ParentBackground = False
        TabOrder = 1
        object sgCharges: TStringGrid
          Left = 1
          Top = 23
          Width = 438
          Height = 94
          Align = alClient
          DefaultColWidth = 40
          DefaultRowHeight = 18
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          PopupMenu = pmnCharges
          TabOrder = 0
          OnDblClick = sgChargesDblClick
          ColWidths = (
            40
            179
            70
            61
            80)
        end
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 438
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          object Label10: TLabel
            Left = 6
            Top = 6
            Width = 81
            Height = 13
            Caption = 'Sundry Charges'
          end
        end
      end
      object chkbxEInvoice: TCheckBox
        Left = 451
        Top = 64
        Width = 129
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Electronic format'
        TabOrder = 2
        OnClick = chkbxEInvoiceClick
      end
      object btnDetails: TBitBtn
        Left = 451
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Details'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          333333333333337FF3333333333333903333333333333377FF33333333333399
          03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
          99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
          99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
          03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
          33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
          33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
          3333777777333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnClick = btnDetailsClick
      end
      object chkbxDelNote: TCheckBox
        Left = 451
        Top = 39
        Width = 142
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Combined Delivery Note'
        TabOrder = 4
        OnClick = chkbxDelNoteClick
      end
    end
    object pnlHeader: TPanel
      Left = 0
      Top = 67
      Width = 896
      Height = 197
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        896
        197)
      object Label6: TLabel
        Left = 484
        Top = 8
        Width = 52
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Invoice To'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 498
      end
      object Label7: TLabel
        Left = 467
        Top = 115
        Width = 73
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Account Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 481
      end
      object Label8: TLabel
        Left = 8
        Top = 8
        Width = 53
        Height = 13
        Caption = 'Customer:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 8
        Top = 118
        Width = 20
        Height = 13
        Caption = 'Rep'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblJobRevenue: TLabel
        Left = 8
        Top = 173
        Width = 81
        Height = 13
        Caption = 'Revenue Centre'
      end
      object imgChkbxChecked: TImage
        Left = 736
        Top = 136
        Width = 20
        Height = 20
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          0000100000000100180000000000000300000000000000000000000000000000
          0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
          D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8
          E9ECD8E9ECD8E9EC99A8ACE2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1
          E2EFF1E2EFF1E2EFF1E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFF000000000000000000000000000000
          FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FF000000000000FFFFFF000000000000000000FFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFF000000FFFFFFFFFFFFFFFFFF000000
          000000000000FFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71646F71646F71646F71646F71646F71646F71
          646F71646F71646F71E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC99A8AC99A8
          AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8ACFFFFFFD8
          E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
          D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
          ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
          E9EC}
        Visible = False
      end
      object imgChkbxUnChecked: TImage
        Left = 768
        Top = 136
        Width = 20
        Height = 20
        Picture.Data = {
          07544269746D617006030000424D060300000000000036000000280000001000
          00000F0000000100180000000000D00200000000000000000000000000000000
          0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
          D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8
          E9ECD8E9ECD8E9EC99A8ACE2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1
          E2EFF1E2EFF1E2EFF1E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71646F71646F71646F71646F71646F71646F71
          646F71646F71646F71E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC99A8AC99A8
          AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8ACFFFFFFD8
          E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
          D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC}
        Visible = False
      end
      object imgChkBxInvoiceAll: TImage
        Left = 800
        Top = 136
        Width = 20
        Height = 20
        Picture.Data = {
          07544269746D617006030000424D060300000000000036000000280000001000
          00000F0000000100180000000000D00200000000000000000000000000000000
          0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
          D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8
          E9ECD8E9ECD8E9EC99A8ACE2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1
          E2EFF1E2EFF1E2EFF1E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
          E9ECD8E9ECD8E9EC99A8AC646F71646F71646F71646F71646F71646F71646F71
          646F71646F71646F71E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC99A8AC99A8
          AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8ACFFFFFFD8
          E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
          D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC}
        Visible = False
      end
      object memInvToCustomer: TMemo
        Left = 561
        Top = 8
        Width = 270
        Height = 100
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 0
      end
      object edtAccountCode: TEdit
        Left = 561
        Top = 111
        Width = 89
        Height = 21
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 1
      end
      object btnInvToCustomer: TBitBtn
        Left = 841
        Top = 8
        Width = 25
        Height = 25
        Hint = 'Select Customer'
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnInvToCustomerClick
      end
      object memCustomer: TMemo
        Left = 96
        Top = 8
        Width = 270
        Height = 100
        ReadOnly = True
        TabOrder = 3
      end
      object btnCustomer: TBitBtn
        Left = 376
        Top = 8
        Width = 25
        Height = 25
        Hint = 'Select Customer'
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnCustomerClick
      end
      object dblkpRep: TDBLookupComboBox
        Left = 96
        Top = 114
        Width = 185
        Height = 21
        KeyField = 'Rep'
        ListField = 'Name'
        ListSource = dmSalesInvoice.dsRep
        TabOrder = 5
        OnClick = dblkpRepClick
      end
      object lblReference: TStaticText
        Left = 673
        Top = 113
        Width = 193
        Height = 16
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = 'lblReference'
        TabOrder = 6
      end
      object dblkpJobRevenue: TDBLookupComboBox
        Left = 96
        Top = 169
        Width = 185
        Height = 21
        KeyField = 'Invoice_Location'
        ListField = 'Invoice_Location_Descr'
        ListSource = dmSalesInvoice.dsJBAll
        TabOrder = 7
        OnClick = dblkpJobRevenueClick
      end
      object chkbxCashSale: TCheckBox
        Left = 561
        Top = 139
        Width = 77
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Cash Sale'
        TabOrder = 8
        OnClick = chkbxCashSaleClick
      end
      object pnlSubReps: TPanel
        Left = 0
        Top = 138
        Width = 329
        Height = 27
        BevelOuter = bvNone
        Caption = 'pnlSubReps'
        ParentBackground = False
        TabOrder = 9
        object Label15: TLabel
          Left = 8
          Top = 8
          Width = 43
          Height = 13
          Caption = 'Sub Rep'
        end
        object dblkpSubRep: TDBLookupComboBox
          Left = 96
          Top = 4
          Width = 185
          Height = 21
          KeyField = 'Rep'
          ListField = 'Name'
          ListSource = dmSalesInvoice.dsRep
          TabOrder = 0
          OnClick = dblkpSubRepClick
        end
        object btnClearClaim: TBitBtn
          Left = 296
          Top = 3
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
          TabOrder = 1
          OnClick = btnClearClaimClick
        end
      end
      object btnReps: TBitBtn
        Left = 296
        Top = 112
        Width = 23
        Height = 23
        Hint = 'Select Customer'
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = btnRepsClick
      end
    end
    object pnlHeaderDesc: TPanel
      Left = 0
      Top = 264
      Width = 896
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        896
        27)
      object Label12: TLabel
        Left = 8
        Top = 5
        Width = 59
        Height = 13
        Caption = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 499
        Top = 5
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Order No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 513
      end
      object edtDesc: TEdit
        Left = 96
        Top = 1
        Width = 347
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = edtDescChange
      end
      object edtCustOrderNo: TEdit
        Left = 561
        Top = 1
        Width = 273
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 1
        OnChange = edtCustOrderNoChange
      end
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 896
      Height = 36
      Align = alTop
      ParentBackground = False
      TabOrder = 4
      DesignSize = (
        896
        36)
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 56
        Height = 13
        Caption = 'Invoice No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 237
        Top = 12
        Width = 64
        Height = 13
        Caption = 'Invoice Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 668
        Top = 12
        Width = 46
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Operator'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblAltInvoiceNumber: TLabel
        Left = 452
        Top = 12
        Width = 102
        Height = 13
        Caption = 'SAP Invoice Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtInvNumber: TEdit
        Left = 96
        Top = 8
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtInvoiceDate: TEdit
        Left = 307
        Top = 8
        Width = 97
        Height = 21
        TabOrder = 1
        OnChange = CheckOK
        OnExit = edtInvoiceDateExit
      end
      object btnInvDate: TBitBtn
        Left = 411
        Top = 6
        Width = 25
        Height = 25
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
        OnClick = btnInvDateClick
      end
      object dblkpOperator: TDBLookupComboBox
        Left = 720
        Top = 8
        Width = 145
        Height = 21
        Anchors = [akTop, akRight]
        KeyField = 'Operator'
        ListField = 'Name'
        ListSource = dmSalesInvoice.dsOperator
        TabOrder = 3
        OnClick = dblkpOperatorClick
      end
      object edtAltInvoiceNumber: TEdit
        Left = 560
        Top = 8
        Width = 97
        Height = 21
        TabOrder = 4
        OnChange = edtAltInvoiceNumberChange
      end
    end
    object sgLines: TStringGrid
      Left = 0
      Top = 291
      Width = 896
      Height = 92
      Align = alClient
      ColCount = 13
      DefaultColWidth = 40
      DefaultRowHeight = 18
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      ParentFont = False
      PopupMenu = pmnLines
      TabOrder = 5
      OnDblClick = sgLinesDblClick
      OnDrawCell = sgLinesDrawCell
      OnTopLeftChanged = sgLinesTopLeftChanged
      ColWidths = (
        40
        89
        166
        68
        73
        71
        82
        85
        100
        92
        88
        96
        98)
    end
    object pnlBottom: TPanel
      Left = 0
      Top = 503
      Width = 896
      Height = 41
      Align = alBottom
      ParentBackground = False
      TabOrder = 7
      DesignSize = (
        896
        41)
      object lblDeleteprompt: TLabel
        Left = 586
        Top = 16
        Width = 100
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Delete this invoice?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 600
      end
      object btnOK: TBitBtn
        Left = 706
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'OK'
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
        TabOrder = 0
        OnClick = btnOKClick
      end
      object BitBtn2: TBitBtn
        Left = 786
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object btnNotes: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Notes'
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
        TabOrder = 2
        OnClick = btnNotesClick
      end
      object btnInternalNotes: TBitBtn
        Left = 93
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Internal'
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
        TabOrder = 3
        OnClick = btnInternalNotesClick
      end
      object pnlCreditReason: TPanel
        Left = 168
        Top = 8
        Width = 394
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        Caption = 'pnlCreditReason'
        ParentBackground = False
        TabOrder = 4
        Visible = False
        DesignSize = (
          394
          25)
        object Label13: TLabel
          Left = 8
          Top = 6
          Width = 72
          Height = 13
          Caption = 'Credit Reason'
        end
        object dblkpCreditReason: TDBLookupComboBox
          Left = 80
          Top = 2
          Width = 274
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          KeyField = 'Credit_Note_Reason'
          ListField = 'Credit_Note_Reason_Descr'
          ListSource = dmSalesInvoice.dtsCreditReason
          TabOrder = 0
          OnClick = dblkpCreditReasonClick
        end
        object BitBtn1: TBitBtn
          Left = 362
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Select Customer'
          Anchors = [akTop, akRight]
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BitBtn1Click
        end
      end
    end
    object btnDelete: TBitBtn
      Left = 24
      Top = 293
      Width = 15
      Height = 15
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
      TabOrder = 6
      TabStop = False
      OnClick = btnDeleteClick
    end
  end
  object pmnLines: TPopupMenu
    OnPopup = pmnLinesPopup
    Left = 480
    Top = 273
    object mnChangeLine: TMenuItem
      Caption = '&Change'
      OnClick = mnChangeLineClick
    end
    object mnDeleteLine: TMenuItem
      Caption = '&Delete'
      OnClick = mnDeleteLineClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnAddfromOrder: TMenuItem
      Caption = 'Add from Production Order'
      Visible = False
    end
    object mnAddfromJobBag: TMenuItem
      Caption = 'Add from same Job Bag'
      OnClick = mnAddfromJobBagClick
    end
    object mnAddfromOtherJobBag: TMenuItem
      Caption = 'Add from another Job Bag'
      OnClick = mnAddfromOtherJobBagClick
    end
    object mnAddfromSalesOrder: TMenuItem
      Caption = 'Add from Sales Order'
      Visible = False
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnNotPrinted: TMenuItem
      Caption = 'Line not printed'
      OnClick = mnNotPrintedClick
    end
  end
  object pmnCharges: TPopupMenu
    OnPopup = pmnChargesPopup
    Left = 329
    Top = 385
    object mnAddChg: TMenuItem
      Caption = '&Add'
      OnClick = mnAddChgClick
    end
    object mnChangeChg: TMenuItem
      Caption = '&Change'
      OnClick = mnChangeChgClick
    end
    object mnDeleteChg: TMenuItem
      Caption = '&Delete'
      OnClick = mnDeleteChgClick
    end
  end
  object pmnDummy: TPopupMenu
    Left = 544
    Top = 273
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 232
    Top = 320
  end
  object IntFlashTimer: TTimer
    Enabled = False
    OnTimer = IntFlashTimerTimer
    Left = 312
    Top = 320
  end
end
