object frmWTMaintSalesInvoice: TfrmWTMaintSalesInvoice
  Left = 236
  Top = 50
  Caption = 'Sales Invoice Details'
  ClientHeight = 621
  ClientWidth = 915
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 875
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
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 602
    Width = 915
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 561
    Width = 915
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    object btnNotes: TBitBtn
      Left = 8
      Top = 8
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
      TabOrder = 0
      OnClick = btnNotesClick
    end
    object btnInternalNotes: TBitBtn
      Left = 101
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Internal'
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
      TabOrder = 1
      OnClick = btnInternalNotesClick
    end
    object Panel1: TPanel
      Left = 479
      Top = 1
      Width = 435
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        435
        39)
      object lblDeleteprompt: TLabel
        Left = 118
        Top = 12
        Width = 125
        Height = 16
        Anchors = [akRight, akBottom]
        Caption = 'Delete this invoice?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnOK: TBitBtn
        Left = 256
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
        Left = 352
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 36
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      915
      36)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 63
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
      Left = 240
      Top = 12
      Width = 74
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
      Left = 653
      Top = 12
      Width = 83
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Office Contact'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 661
    end
    object edtInvNumber: TEdit
      Left = 96
      Top = 8
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object edtInvoiceDate: TEdit
      Left = 320
      Top = 8
      Width = 97
      Height = 21
      TabOrder = 1
      OnChange = CheckOK
      OnExit = edtInvoiceDateExit
    end
    object btnInvDate: TBitBtn
      Left = 424
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
      Left = 749
      Top = 8
      Width = 145
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Operator'
      ListField = 'Operator_Name'
      ListSource = dtmdlSalesInvoice.dsOperator
      TabOrder = 3
      OnClick = dblkpOperatorClick
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 435
    Width = 915
    Height = 126
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      915
      126)
    object lblDepositLabel: TLabel
      Left = 547
      Top = 70
      Width = 60
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Deposit Paid'
      ExplicitLeft = 555
    end
    object lblPaymentTerms: TLabel
      Left = 8
      Top = 14
      Width = 73
      Height = 13
      Caption = 'Payment Terms'
    end
    object lblTotalPaid: TLabel
      Left = 547
      Top = 99
      Width = 48
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Total Paid'
      ExplicitLeft = 555
    end
    object Panel5: TPanel
      Left = 729
      Top = 1
      Width = 185
      Height = 124
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        185
        124)
      object Label3: TLabel
        Left = 6
        Top = 17
        Width = 31
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Goods'
      end
      object Label4: TLabel
        Left = 6
        Top = 44
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'VAT'
      end
      object Label5: TLabel
        Left = 6
        Top = 73
        Width = 24
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total'
      end
      object Label12: TLabel
        Left = 6
        Top = 99
        Width = 34
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'To Pay'
      end
      object memGoods: TMemo
        Left = 80
        Top = 9
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 0
      end
      object memVAT: TMemo
        Left = 80
        Top = 36
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 1
      end
      object memTotal: TMemo
        Left = 80
        Top = 65
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 2
      end
      object memToPay: TMemo
        Left = 80
        Top = 94
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 3
      end
    end
    object memDeposit: TMemo
      Left = 621
      Top = 65
      Width = 89
      Height = 23
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 1
      OnChange = memDepositChange
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object dblkpPaymentTerms: TDBLookupComboBox
      Left = 88
      Top = 10
      Width = 217
      Height = 21
      KeyField = 'Payment_Terms'
      ListField = 'Payment_Terms_Description'
      ListSource = dtmdlSalesInvoice.dsPaymentTerms
      TabOrder = 2
      OnClick = dblkpPaymentTermsClick
    end
    object btnPaymentTerms: TBitBtn
      Left = 320
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
      TabOrder = 3
      OnClick = btnPaymentTermsClick
    end
    object memTotalPaid: TMemo
      Left = 621
      Top = 94
      Width = 89
      Height = 23
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 4
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 36
    Width = 915
    Height = 221
    Align = alTop
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      915
      221)
    object Label6: TLabel
      Left = 517
      Top = 8
      Width = 66
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Invoice To:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 525
    end
    object Label7: TLabel
      Left = 501
      Top = 115
      Width = 81
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Code'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 509
    end
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 57
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
      Top = 139
      Width = 24
      Height = 13
      Caption = 'Rep'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 192
      Width = 65
      Height = 13
      Caption = 'Description'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object memInvToCustomer: TMemo
      Left = 589
      Top = 8
      Width = 270
      Height = 95
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 0
    end
    object edtAccountCode: TEdit
      Left = 589
      Top = 111
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 1
    end
    object btnInvToCustomer: TBitBtn
      Left = 869
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
      Height = 95
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
      Top = 135
      Width = 201
      Height = 21
      KeyField = 'Rep'
      ListField = 'Rep_Name'
      ListSource = dtmdlSalesInvoice.dsRep
      TabOrder = 5
      OnClick = dblkpRepClick
    end
    object lblReference: TStaticText
      Left = 757
      Top = 113
      Width = 64
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'lblReference'
      TabOrder = 6
    end
    object edtDescription: TEdit
      Left = 96
      Top = 188
      Width = 822
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      OnChange = edtDescriptionChange
    end
    object pnlRevenueCentre: TPanel
      Left = -2
      Top = 160
      Width = 419
      Height = 27
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 8
      DesignSize = (
        419
        27)
      object Label59: TLabel
        Left = 10
        Top = 7
        Width = 78
        Height = 13
        Caption = 'Revenue Centre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 312
        Top = 2
        Width = 23
        Height = 22
        Hint = 'Clear Revenue Centre'
        Anchors = [akLeft, akBottom]
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
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object dblkpRevenueCentre: TDBLookupComboBox
        Left = 98
        Top = 3
        Width = 201
        Height = 21
        KeyField = 'Revenue_Centre'
        ListField = 'Revenue_Centre_Descr'
        TabOrder = 0
        OnClick = dblkpRevenueCentreClick
      end
    end
    object pnlCustomerBranch: TPanel
      Left = 0
      Top = 104
      Width = 449
      Height = 27
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 9
      DesignSize = (
        449
        27)
      object Label13: TLabel
        Left = 8
        Top = 7
        Width = 49
        Height = 13
        Caption = 'Site Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object btnClearCustomerBranch: TSpeedButton
        Left = 408
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Clear Revenue Centre'
        Anchors = [akLeft, akBottom]
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
        ParentShowHint = False
        ShowHint = True
        OnClick = btnClearCustomerBranchClick
      end
      object edtSiteName: TEdit
        Left = 96
        Top = 3
        Width = 270
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnCustomerBranch: TBitBtn
        Left = 376
        Top = 1
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
        TabOrder = 1
        OnClick = btnCustomerBranchClick
      end
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 257
    Width = 915
    Height = 178
    Align = alClient
    Caption = 'Panel6'
    ParentBackground = False
    TabOrder = 5
    object sgLines: TStringGrid
      Left = 1
      Top = 1
      Width = 913
      Height = 176
      Align = alClient
      ColCount = 11
      DefaultColWidth = 40
      DefaultRowHeight = 20
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      PopupMenu = pmnLines
      TabOrder = 0
      OnDblClick = sgLinesDblClick
      OnDrawCell = sgLinesDrawCell
      ColWidths = (
        40
        89
        166
        80
        90
        71
        82
        116
        62
        73
        88)
    end
  end
  object pmnLines: TPopupMenu
    OnPopup = pmnLinesPopup
    Left = 480
    Top = 273
    object Add1: TMenuItem
      Caption = '&Add'
      OnClick = Add1Click
    end
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
      Caption = 'Add from Job Bag'
      OnClick = mnAddfromJobBagClick
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
    Left = 489
    Top = 337
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
