object PBMaintPOrdLineCallOffFrm: TPBMaintPOrdLineCallOffFrm
  Left = 286
  Top = 50
  AutoScroll = False
  Caption = 'Maintain Call Off Orders'
  ClientHeight = 579
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDelete: TLabel
    Left = 160
    Top = 545
    Width = 104
    Height = 15
    Caption = 'Delete this Call Off'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object DetsGrpBox: TGroupBox
    Left = 2
    Top = 215
    Width = 727
    Height = 317
    Caption = 'Delivery to'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label9: TLabel
      Left = 16
      Top = 158
      Width = 46
      Height = 13
      Caption = 'Due Date'
    end
    object Label11: TLabel
      Left = 16
      Top = 191
      Width = 64
      Height = 13
      Caption = 'Delivery Date'
    end
    object AddrTypeRadGrp: TRadioGroup
      ParentBackground = False
      Left = 216
      Top = 13
      Width = 105
      Height = 95
      Caption = 'Address Type'
      Items.Strings = (
        'Ad Hoc'
        'Supplier'
        'Rep'
        'Customer')
      TabOrder = 0
      OnClick = AddrTypeRadGrpClick
    end
    object AddrGrpBox: TGroupBox
      ParentBackground = False
      Left = 336
      Top = 13
      Width = 385
      Height = 208
      Caption = 'Address Details'
      TabOrder = 1
      object AddrTypeLabel: TLabel
        Left = 8
        Top = 20
        Width = 49
        Height = 13
        Caption = 'Addr Type'
      end
      object BranchNameLabel: TLabel
        Left = 8
        Top = 67
        Width = 34
        Height = 13
        Caption = 'Branch'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 91
        Width = 38
        Height = 13
        Caption = 'Address'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 8
        Top = 186
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
      object lblFAO: TLabel
        Left = 8
        Top = 44
        Width = 21
        Height = 13
        Caption = 'FAO'
      end
      object NameEdit: TEdit
        Left = 85
        Top = 16
        Width = 252
        Height = 21
        MaxLength = 40
        ReadOnly = True
        TabOrder = 0
      end
      object BranchNameEdit: TEdit
        Left = 85
        Top = 63
        Width = 252
        Height = 21
        MaxLength = 40
        ReadOnly = True
        TabOrder = 1
      end
      object BuildingEdit: TEdit
        Left = 85
        Top = 87
        Width = 252
        Height = 21
        MaxLength = 40
        ReadOnly = True
        TabOrder = 2
      end
      object StreetEdit: TEdit
        Left = 85
        Top = 111
        Width = 252
        Height = 21
        MaxLength = 40
        ReadOnly = True
        TabOrder = 3
      end
      object LocaleEdit: TEdit
        Left = 85
        Top = 135
        Width = 252
        Height = 21
        MaxLength = 40
        ReadOnly = True
        TabOrder = 4
      end
      object TownEdit: TEdit
        Left = 85
        Top = 158
        Width = 252
        Height = 21
        MaxLength = 40
        ReadOnly = True
        TabOrder = 5
      end
      object PostCodeEdit: TEdit
        Left = 85
        Top = 182
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        ReadOnly = True
        TabOrder = 6
      end
      object btnLUContact: TButton
        Left = 346
        Top = 40
        Width = 23
        Height = 23
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = btnLUContactClick
      end
      object edtFAO: TEdit
        Left = 85
        Top = 40
        Width = 252
        Height = 21
        MaxLength = 40
        TabOrder = 8
      end
      object SearchBtn: TButton
        Left = 346
        Top = 16
        Width = 23
        Height = 23
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = SearchBtnClick
      end
    end
    object QtysGrpBox: TGroupBox
      ParentBackground = False
      Left = 8
      Top = 13
      Width = 193
      Height = 135
      Caption = 'Quantities'
      TabOrder = 2
      object Label13: TLabel
        Left = 8
        Top = 18
        Width = 49
        Height = 13
        Caption = 'To Deliver'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 8
        Top = 50
        Width = 45
        Height = 13
        Caption = 'Delivered'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 8
        Top = 104
        Width = 28
        Height = 13
        Caption = 'No Of'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 8
        Top = 118
        Width = 29
        Height = 13
        Caption = 'Boxes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 80
        Width = 37
        Height = 13
        Caption = 'Box Qty'
      end
      object QtyToDeliverMemo: TMemo
        Left = 88
        Top = 16
        Width = 89
        Height = 25
        Alignment = taRightJustify
        TabOrder = 0
        WantReturns = False
        OnChange = QtyToDeliverMemoChange
        OnEnter = SaveValue
        OnExit = VAlidateQty
        OnKeyUp = QtyToDeliverMemoKeyUp
      end
      object QtyDeliveredMemo: TMemo
        Left = 88
        Top = 46
        Width = 89
        Height = 25
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 1
        WantReturns = False
      end
      object NoOfBoxesMemo: TMemo
        Left = 88
        Top = 103
        Width = 89
        Height = 25
        Alignment = taRightJustify
        TabOrder = 2
        WantReturns = False
      end
      object BoxQtyMemo: TMemo
        Left = 88
        Top = 74
        Width = 89
        Height = 25
        Alignment = taRightJustify
        TabOrder = 3
        WantReturns = False
        OnKeyUp = BoxQtyMemoKeyUp
      end
    end
    object DatePointEdit: TEdit
      Left = 96
      Top = 154
      Width = 105
      Height = 21
      TabOrder = 3
      OnExit = DatePointEditExit
    end
    object DelInstructPanel: TPanel
      ParentBackground = False
      Left = 2
      Top = 224
      Width = 723
      Height = 91
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object Label18: TLabel
        Left = 337
        Top = 2
        Width = 95
        Height = 13
        Caption = 'Delivery Instructions'
      end
      object DelInstructMemo: TMemo
        Left = 451
        Top = 1
        Width = 270
        Height = 53
        TabOrder = 0
      end
      object GroupBox3: TGroupBox
        ParentBackground = False
        Left = 2
        Top = 2
        Width = 329
        Height = 65
        Caption = 'Prices'
        TabOrder = 1
        object Label15: TLabel
          Left = 8
          Top = 46
          Width = 17
          Height = 13
          Caption = 'Sell'
        end
        object Label19: TLabel
          Left = 8
          Top = 22
          Width = 21
          Height = 13
          Caption = 'Cost'
        end
        object Label21: TLabel
          Left = 136
          Top = 46
          Width = 39
          Height = 13
          Caption = 'Sell Unit'
        end
        object Label22: TLabel
          Left = 136
          Top = 22
          Width = 43
          Height = 13
          Caption = 'Cost Unit'
        end
        object SellPriceMemo: TMemo
          Left = 40
          Top = 40
          Width = 81
          Height = 21
          Alignment = taRightJustify
          TabOrder = 2
          WantReturns = False
          OnEnter = SaveValue
          OnExit = VAlidateMoney
          OnKeyPress = CheckKeyIsNumber
        end
        object CostPriceMemo: TMemo
          Left = 40
          Top = 16
          Width = 81
          Height = 21
          Alignment = taRightJustify
          TabOrder = 0
          WantReturns = False
          OnEnter = SaveValue
          OnExit = VAlidateMoney
          OnKeyPress = CheckKeyIsNumber
        end
        object PriceUnitDBcmbo: TDBLookupComboBox
          Left = 192
          Top = 38
          Width = 129
          Height = 21
          KeyField = 'Price_Unit'
          ListField = 'Description'
          ListSource = PBPODM.PriceUnitSRC
          TabOrder = 3
        end
        object CostUnitDBcmbo: TDBLookupComboBox
          Left = 192
          Top = 14
          Width = 129
          Height = 21
          KeyField = 'Price_Unit'
          ListField = 'Description'
          ListSource = PBPODM.PriceUnitSRC
          TabOrder = 1
        end
      end
      object chkbxmake2invoice: TCheckBox
        Left = 10
        Top = 72
        Width = 319
        Height = 17
        Caption = 'Make available to invoice'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = chkbxmake2invoiceClick
      end
    end
    object DeliveryDateEdit: TEdit
      Left = 96
      Top = 186
      Width = 105
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object DeliveryDateBtn: TButton
      Left = 208
      Top = 185
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
      Visible = False
      OnClick = DeliveryDateBtnClick
    end
    object DatePointBtn: TBitBtn
      Left = 208
      Top = 154
      Width = 25
      Height = 25
      TabOrder = 7
      OnClick = DatePointBtnClick
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
    end
  end
  object GroupBox2: TGroupBox
    ParentBackground = False
    Left = 2
    Top = 1
    Width = 727
    Height = 68
    Caption = 'Supplier'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      727
      68)
    object Label1: TLabel
      Left = 33
      Top = 22
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object Label7: TLabel
      Left = 512
      Top = 23
      Width = 52
      Height = 13
      Caption = 'Order Date'
    end
    object Label25: TLabel
      Left = 27
      Top = 42
      Width = 37
      Height = 13
      Caption = 'Contact'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SupplierEdt: TEdit
      Left = 74
      Top = 14
      Width = 271
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object BitBtn3: TBitBtn
      Left = 356
      Top = 12
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
      OnClick = BitBtn3Click
    end
    object OrderDateEdt: TEdit
      Left = 578
      Top = 14
      Width = 111
      Height = 21
      TabOrder = 4
      OnExit = OrderDateEdtExit
    end
    object OrderDateBtn: TBitBtn
      Left = 696
      Top = 12
      Width = 25
      Height = 25
      TabOrder = 5
      OnClick = OrderDateBtnClick
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
    end
    object ContactEdit: TEdit
      Left = 74
      Top = 38
      Width = 209
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 40
      ReadOnly = True
      TabOrder = 2
    end
    object SelContactBtn: TButton
      Left = 291
      Top = 37
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = SelContactBtnClick
    end
  end
  object GroupBox1: TGroupBox
    ParentBackground = False
    Left = 2
    Top = 72
    Width = 727
    Height = 140
    Caption = 'Customer'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label6: TLabel
      Left = 32
      Top = 20
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object Label8: TLabel
      Left = 23
      Top = 45
      Width = 37
      Height = 13
      Caption = 'Contact'
    end
    object Label5: TLabel
      Left = 7
      Top = 93
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label20: TLabel
      Left = 382
      Top = 45
      Width = 43
      Height = 13
      Caption = 'Form Ref'
    end
    object Label3: TLabel
      Left = 372
      Top = 70
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label4: TLabel
      Left = 379
      Top = 20
      Width = 46
      Height = 13
      Caption = 'Order No.'
    end
    object Label23: TLabel
      Left = 374
      Top = 118
      Width = 51
      Height = 13
      Caption = 'Numbering'
    end
    object Label24: TLabel
      Left = 40
      Top = 70
      Width = 20
      Height = 13
      Caption = 'Rep'
    end
    object CustomerEdt: TEdit
      Left = 73
      Top = 12
      Width = 272
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object BitBtn4: TBitBtn
      Left = 347
      Top = 10
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
      OnClick = BitBtn4Click
    end
    object CustDescEdit: TMemo
      Left = 73
      Top = 86
      Width = 277
      Height = 46
      Lines.Strings = (
        '')
      MaxLength = 80
      TabOrder = 2
      WantReturns = False
    end
    object FormRefEdit: TEdit
      Left = 436
      Top = 37
      Width = 221
      Height = 21
      MaxLength = 40
      ReadOnly = True
      TabOrder = 3
    end
    object FormRefButton: TButton
      Left = 664
      Top = 35
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = FormRefButtonClick
    end
    object FormRefClrBitBtn: TBitBtn
      Left = 696
      Top = 35
      Width = 25
      Height = 25
      TabOrder = 5
      OnClick = FormRefClrBitBtnClick
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
    end
    object FormDescEdit: TEdit
      Left = 436
      Top = 62
      Width = 285
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
    object CustRefEdit: TEdit
      Left = 436
      Top = 12
      Width = 160
      Height = 21
      MaxLength = 40
      TabOrder = 7
      OnChange = CustRefEditChange
    end
    object NumberingEdit: TEdit
      Left = 436
      Top = 110
      Width = 285
      Height = 21
      TabOrder = 8
    end
    object CustContactDBCmbo: TDBLookupComboBox
      Left = 73
      Top = 37
      Width = 209
      Height = 21
      KeyField = 'Contact_no'
      ListField = 'Name'
      ListSource = PBPODM.CustContactSRC
      TabOrder = 9
    end
    object RepEdit: TEdit
      Left = 73
      Top = 62
      Width = 209
      Height = 21
      ReadOnly = True
      TabOrder = 10
    end
    object RepLUBtn: TBitBtn
      Left = 291
      Top = 60
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = RepLUBtnClick
    end
  end
  object OKBitBtn: TBitBtn
    Left = 287
    Top = 540
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 3
    OnClick = OKBitBtnClick
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
  end
  object BitBtn7: TBitBtn
    Left = 375
    Top = 540
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
end
