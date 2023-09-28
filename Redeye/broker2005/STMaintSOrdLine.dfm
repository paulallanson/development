object STMaintSOrdLineFrm: TSTMaintSOrdLineFrm
  Left = 356
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Maintain Sales Order Line'
  ClientHeight = 367
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object pnlFunctions: TPanel
    Left = 0
    Top = 316
    Width = 713
    Height = 51
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    TabStop = True
    DesignSize = (
      713
      51)
    object DelLabel: TLabel
      Left = 377
      Top = 28
      Width = 145
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'Delete the above details ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 401
    end
    object OKBtn: TBitBtn
      Left = 537
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 0
      OnClick = OKBtnClick
    end
    object CancelBtn: TBitBtn
      Left = 617
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnlproduct: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 73
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 23
      Width = 68
      Height = 13
      Caption = 'Product Code:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSource: TLabel
      Left = 5
      Top = 48
      Width = 87
      Height = 13
      Caption = 'Replenish Source:'
    end
    object lblReplenishName: TLabel
      Left = 112
      Top = 48
      Width = 85
      Height = 13
      Caption = 'lblReplenishName'
    end
    object PartEdit: TEdit
      Left = 112
      Top = 15
      Width = 201
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = PartEditChange
      OnKeyPress = PartEditKeyPress
    end
    object PartBitBtn: TBitBtn
      Left = 320
      Top = 13
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = PartBitBtnClick
    end
    object DescriptionEdit: TEdit
      Left = 352
      Top = 15
      Width = 361
      Height = 21
      TabStop = False
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object chkbxSample: TCheckBox
      Left = 352
      Top = 48
      Width = 201
      Height = 17
      Caption = 'This item is a sample'
      TabOrder = 3
      OnClick = chkbxSampleClick
    end
  end
  object pnlSales: TPanel
    Left = 202
    Top = 73
    Width = 511
    Height = 243
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    TabStop = True
    object GroupBox2: TGroupBox
      Left = 0
      Top = 4
      Width = 201
      Height = 165
      Caption = 'Costs'
      ParentBackground = False
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 29
        Width = 92
        Height = 13
        Caption = 'Purchase Pack Qty'
      end
      object Label6: TLabel
        Left = 8
        Top = 57
        Width = 72
        Height = 13
        Caption = 'Purchase Price'
      end
      object Label3: TLabel
        Left = 8
        Top = 86
        Width = 53
        Height = 13
        Caption = 'Discount %'
      end
      object Label8: TLabel
        Left = 8
        Top = 114
        Width = 78
        Height = 13
        Caption = 'Discounted Cost'
      end
      object PurchPackMemo: TMemo
        Left = 119
        Top = 21
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WantReturns = False
      end
      object PurchPriceMemo: TMemo
        Left = 119
        Top = 49
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        WantReturns = False
      end
      object PurchDiscMemo: TMemo
        Left = 119
        Top = 78
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        WantReturns = False
      end
      object DiscCostMemo: TMemo
        Left = 119
        Top = 106
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        WantReturns = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 206
      Top = 4
      Width = 299
      Height = 245
      Caption = 'Sales Details'
      ParentBackground = False
      TabOrder = 1
      object Label7: TLabel
        Left = 10
        Top = 26
        Width = 64
        Height = 13
        Caption = 'Sell Pack Qty'
      end
      object Label4: TLabel
        Left = 10
        Top = 54
        Width = 90
        Height = 13
        Caption = 'Sell Price per Pack'
      end
      object Label5: TLabel
        Left = 10
        Top = 80
        Width = 69
        Height = 13
        Caption = 'Discount Type'
      end
      object btnClear: TSpeedButton
        Left = 266
        Top = 75
        Width = 23
        Height = 22
        Hint = 'Clear the discount type details'
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
        OnClick = btnClearClick
      end
      object lblDiscount: TLabel
        Left = 10
        Top = 109
        Width = 53
        Height = 13
        Caption = 'Discount %'
      end
      object PBinLbl: TLabel
        Left = 10
        Top = 135
        Width = 81
        Height = 13
        Caption = 'Discounted Price'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 164
        Width = 82
        Height = 13
        Caption = 'Quantity (Singles)'
      end
      object OrdqtyLbl: TLabel
        Left = 10
        Top = 193
        Width = 78
        Height = 13
        Caption = 'Quantity (Packs)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblOvers: TLabel
        Left = 10
        Top = 220
        Width = 71
        Height = 13
        Caption = 'Overs (Singles)'
        Visible = False
      end
      object PackSizeMemo: TMemo
        Left = 118
        Top = 21
        Width = 75
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        WantReturns = False
        OnChange = PackSizeMemoChange
        OnKeyPress = QtyEditKeyPress
      end
      object SellPriceMemo: TMemo
        Left = 118
        Top = 49
        Width = 75
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        WantReturns = False
      end
      object dbLkpDiscountType: TDBLookupComboBox
        Left = 118
        Top = 76
        Width = 139
        Height = 21
        KeyField = 'Discount_type'
        ListField = 'Description'
        ListSource = STSalesOrdDM.GetDiscTypeSRC
        TabOrder = 2
        OnClick = dbLkpDiscountTypeClick
      end
      object DiscountMemo: TMemo
        Left = 118
        Top = 104
        Width = 75
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        WantReturns = False
        OnChange = DiscountMemoChange
        OnEnter = SaveValue
        OnExit = ValidateMoney
        OnKeyPress = CheckKeyIsNumber
      end
      object DiscPriceMemo: TMemo
        Left = 118
        Top = 130
        Width = 75
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        WantReturns = False
        OnChange = CheckOK
        OnEnter = SaveValue
        OnExit = ValidateMoney
        OnKeyPress = CheckKeyIsNumber
      end
      object QtySinglesMemo: TEdit
        Left = 118
        Top = 160
        Width = 75
        Height = 21
        TabOrder = 5
        OnChange = QtySinglesMemoChange
        OnEnter = QtySinglesMemoEnter
        OnExit = QtySinglesMemoExit
        OnKeyPress = QtyEditKeyPress
      end
      object QtyEdit: TEdit
        Left = 118
        Top = 189
        Width = 75
        Height = 21
        TabOrder = 6
        OnChange = QtyEditChange
        OnEnter = QtyEditEnter
        OnExit = QtyEditExit
        OnKeyPress = QtyEditKeyPress
      end
      object QtyOversMemo: TEdit
        Left = 118
        Top = 216
        Width = 75
        Height = 21
        TabOrder = 7
        Visible = False
        OnChange = QtyOversMemoChange
        OnEnter = QtySinglesMemoEnter
        OnExit = QtySinglesMemoExit
        OnKeyPress = QtyEditKeyPress
      end
    end
    object GroupBox4: TGroupBox
      Left = 0
      Top = 201
      Width = 201
      Height = 50
      Caption = 'All Stock locations'
      ParentBackground = False
      TabOrder = 2
      object Label15: TLabel
        Left = 8
        Top = 24
        Width = 79
        Height = 13
        Caption = 'Total Free Stock'
      end
      object memTotalStock: TMemo
        Left = 118
        Top = 19
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WantReturns = False
      end
    end
  end
  object pnlcosts: TPanel
    Left = 0
    Top = 73
    Width = 202
    Height = 243
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 201
      Height = 247
      Caption = 'Stock Levels'
      ParentBackground = False
      TabOrder = 0
      object Label10: TLabel
        Left = 8
        Top = 26
        Width = 86
        Height = 13
        Caption = 'In this Warehouse'
      end
      object Label11: TLabel
        Left = 8
        Top = 53
        Width = 44
        Height = 13
        Caption = 'Allocated'
      end
      object Label12: TLabel
        Left = 8
        Top = 81
        Width = 52
        Height = 13
        Caption = 'Free Stock'
      end
      object Label13: TLabel
        Left = 8
        Top = 109
        Width = 39
        Height = 13
        Caption = 'Paid For'
      end
      object Label14: TLabel
        Left = 8
        Top = 137
        Width = 34
        Height = 13
        Caption = 'Unpaid'
      end
      object Label16: TLabel
        Left = 8
        Top = 165
        Width = 41
        Height = 13
        Caption = 'Minimum'
      end
      object Label17: TLabel
        Left = 8
        Top = 193
        Width = 44
        Height = 13
        Caption = 'Maximum'
      end
      object Label18: TLabel
        Left = 8
        Top = 221
        Width = 67
        Height = 13
        Caption = 'Reorder Level'
      end
      object meminWhouse: TMemo
        Left = 118
        Top = 21
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WantReturns = False
      end
      object memAllocated: TMemo
        Left = 118
        Top = 48
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        WantReturns = False
      end
      object memFree: TMemo
        Left = 118
        Top = 76
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        WantReturns = False
      end
      object memPaid: TMemo
        Left = 118
        Top = 104
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        WantReturns = False
      end
      object memUnpaid: TMemo
        Left = 118
        Top = 132
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        WantReturns = False
      end
      object memMin: TMemo
        Left = 118
        Top = 160
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        WantReturns = False
      end
      object memMax: TMemo
        Left = 118
        Top = 188
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        WantReturns = False
      end
      object memReorder: TMemo
        Left = 118
        Top = 216
        Width = 75
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        WantReturns = False
      end
    end
  end
end
