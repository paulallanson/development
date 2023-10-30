object PBMaintNonConfDocFrm: TPBMaintNonConfDocFrm
  Left = 283
  Top = 53
  Caption = 'Maintain Non Conformance'
  ClientHeight = 682
  ClientWidth = 812
  Color = clBtnFace
  Constraints.MinHeight = 630
  Constraints.MinWidth = 790
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 624
    Width = 812
    Height = 39
    Align = alBottom
    ParentBackground = False
    TabOrder = 5
    ExplicitTop = 615
    ExplicitWidth = 806
    object Panel4: TPanel
      Left = 478
      Top = 1
      Width = 333
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 472
      DesignSize = (
        333
        37)
      object DelLabel: TLabel
        Left = 19
        Top = 10
        Width = 123
        Height = 15
        Anchors = [akRight, akBottom]
        Caption = 'Delete this NCA Note?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnOK: TBitBtn
        Left = 154
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        Enabled = False
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
      object btnCancel: TBitBtn
        Left = 242
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object pnlJobBag: TPanel
    Left = 0
    Top = 97
    Width = 812
    Height = 97
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 806
    DesignSize = (
      812
      97)
    object labJobBagInfo: TLabel
      Left = 9
      Top = 15
      Width = 61
      Height = 13
      Caption = 'Job Bag No.'
    end
    object Label25: TLabel
      Left = 456
      Top = 15
      Width = 51
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Start Date'
      ExplicitLeft = 462
    end
    object Label3: TLabel
      Left = 645
      Top = 15
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date Required'
      ExplicitLeft = 651
    end
    object Label2: TLabel
      Left = 9
      Top = 42
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
    object Label1: TLabel
      Left = 660
      Top = 42
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Rep'
      ExplicitLeft = 666
    end
    object Label5: TLabel
      Left = 598
      Top = 72
      Width = 91
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Manager'
      ExplicitLeft = 604
    end
    object Label4: TLabel
      Left = 9
      Top = 72
      Width = 59
      Height = 13
      Caption = 'Description'
    end
    object edtJobBag: TEdit
      Left = 80
      Top = 11
      Width = 81
      Height = 21
      TabOrder = 0
      OnChange = CheckOK
      OnExit = edtJobBagExit
      OnKeyPress = edtJobBagKeyPress
    end
    object edtStartDate: TEdit
      Left = 512
      Top = 11
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      ExplicitLeft = 506
    end
    object edtDateReq: TEdit
      Left = 727
      Top = 11
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      OnChange = CheckOK
      ExplicitLeft = 721
    end
    object edtCustomer: TEdit
      Left = 80
      Top = 38
      Width = 285
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 3
      ExplicitWidth = 279
    end
    object edtRep: TEdit
      Left = 693
      Top = 38
      Width = 115
      Height = 21
      Anchors = [akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 4
      ExplicitLeft = 687
    end
    object edtAccountManager: TEdit
      Left = 693
      Top = 68
      Width = 115
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 5
      ExplicitLeft = 687
    end
    object edtDescription: TEdit
      Left = 80
      Top = 68
      Width = 441
      Height = 21
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      OnChange = CheckOK
    end
  end
  object pnlNotes: TPanel
    Left = 0
    Top = 266
    Width = 812
    Height = 277
    Align = alClient
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 806
    ExplicitHeight = 268
    object pnlNCADetails: TPanel
      Left = 1
      Top = 1
      Width = 810
      Height = 85
      Align = alTop
      Caption = 'pnlNCADetails'
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 804
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 808
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'Non Conformance Details'
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 802
      end
      object memDetails: TMemo
        Left = 1
        Top = 21
        Width = 808
        Height = 63
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = memDetailsChange
        ExplicitWidth = 802
      end
    end
    object pnlResponse: TPanel
      Left = 1
      Top = 86
      Width = 810
      Height = 20
      Align = alClient
      Caption = 'pnlResponse'
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 804
      ExplicitHeight = 11
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 808
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'Response Details'
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 802
      end
      object memResponse: TMemo
        Left = 1
        Top = 21
        Width = 808
        Height = 11
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
        ExplicitWidth = 802
      end
    end
    object pnlAction: TPanel
      Left = 1
      Top = 106
      Width = 810
      Height = 85
      Align = alBottom
      Caption = 'pnlAction'
      ParentBackground = False
      TabOrder = 2
      ExplicitTop = 97
      ExplicitWidth = 804
      object pnlActionLabel: TPanel
        Left = 1
        Top = 1
        Width = 808
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'Corrective Action'
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 802
      end
      object memAction: TRichEdit
        Left = 1
        Top = 21
        Width = 808
        Height = 63
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitWidth = 802
      end
    end
    object pnlPrevent: TPanel
      Left = 1
      Top = 191
      Width = 810
      Height = 85
      Align = alBottom
      Caption = 'pnlPrevent'
      ParentBackground = False
      TabOrder = 3
      ExplicitTop = 182
      ExplicitWidth = 804
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 808
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'Preventative Action'
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 802
      end
      object memPrevent: TRichEdit
        Left = 1
        Top = 21
        Width = 808
        Height = 63
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitWidth = 802
      end
    end
  end
  object pnlQASignOff: TPanel
    Left = 0
    Top = 543
    Width = 812
    Height = 81
    Align = alBottom
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 534
    ExplicitWidth = 806
    DesignSize = (
      812
      81)
    object Label14: TLabel
      Left = 635
      Top = 40
      Width = 88
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Cost to Company'
      ExplicitLeft = 641
    end
    object Label6: TLabel
      Left = 651
      Top = 8
      Width = 70
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Cost to Client'
      ExplicitLeft = 657
    end
    object Label12: TLabel
      Left = 336
      Top = 10
      Width = 90
      Height = 13
      Caption = 'QA Signed off by:'
    end
    object Label13: TLabel
      Left = 392
      Top = 42
      Width = 30
      Height = 13
      Caption = ' Date:'
    end
    object memTotalCost: TMemo
      Left = 723
      Top = 36
      Width = 72
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnEnter = SaveValue
      OnExit = ValidateMoney3DP
      OnKeyPress = CheckKeyIsFloat
      ExplicitLeft = 717
    end
    object memCosttoClient: TMemo
      Left = 723
      Top = 4
      Width = 73
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnEnter = SaveValue
      OnExit = ValidateMoney3DP
      OnKeyPress = CheckKeyIsFloat
      ExplicitLeft = 717
    end
    object rdgrpJobRePrinted: TRadioGroup
      Left = 8
      Top = 3
      Width = 145
      Height = 73
      Caption = 'Has job been reprinted?'
      Items.Strings = (
        'Yes'
        'No'
        'N/A')
      ParentBackground = False
      TabOrder = 2
    end
    object rdgrpSamples: TRadioGroup
      Left = 168
      Top = 3
      Width = 145
      Height = 73
      Caption = 'Are samples available?'
      Items.Strings = (
        'Yes'
        'No'
        'N/A')
      ParentBackground = False
      TabOrder = 3
    end
    object dblkpQAOperator: TDBLookupComboBox
      Left = 424
      Top = 6
      Width = 113
      Height = 21
      KeyField = 'QA_Operator'
      ListField = 'QA_Operator_Name'
      ListSource = dtsQAOperator
      TabOrder = 4
      OnClick = dblkpQAOperatorClick
    end
    object BitBtn4: TBitBtn
      Left = 542
      Top = 4
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object btnClear: TBitBtn
      Left = 576
      Top = 4
      Width = 27
      Height = 25
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
      OnClick = btnClearClick
    end
    object edtQASignOff: TEdit
      Left = 424
      Top = 38
      Width = 81
      Height = 21
      TabOrder = 7
      OnExit = edtQASignOffExit
    end
    object btnDate: TBitBtn
      Left = 510
      Top = 36
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
      TabOrder = 8
      OnClick = btnDateClick
    end
  end
  object pnlNCAHead: TPanel
    Left = 0
    Top = 194
    Width = 812
    Height = 72
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 806
    DesignSize = (
      812
      72)
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 61
      Height = 13
      Caption = 'Date Raised'
    end
    object Label8: TLabel
      Left = 595
      Top = 16
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Raised by'
      ExplicitLeft = 601
    end
    object Label9: TLabel
      Left = 301
      Top = 48
      Width = 66
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Raising Dept'
      ExplicitLeft = 307
    end
    object Label10: TLabel
      Left = 582
      Top = 48
      Width = 63
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Source Dept'
      ExplicitLeft = 588
    end
    object Label11: TLabel
      Left = 298
      Top = 16
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Reason Type'
      ExplicitLeft = 304
    end
    object Label22: TLabel
      Left = 8
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Category'
    end
    object edtRaisedBy: TEdit
      Left = 650
      Top = 12
      Width = 115
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      ExplicitLeft = 644
    end
    object BitBtn2: TBitBtn
      Left = 777
      Top = 10
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
      TabOrder = 4
      OnClick = BitBtn2Click
      ExplicitLeft = 771
    end
    object dblkpRaisedByDept: TDBLookupComboBox
      Left = 370
      Top = 44
      Width = 153
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Non_Conform_Dept'
      ListField = 'Non_Conform_Dept_Descr'
      ListSource = dtsRaisingDept
      TabOrder = 7
      OnClick = CheckOK
      ExplicitLeft = 364
    end
    object dblkpSourceDept: TDBLookupComboBox
      Left = 651
      Top = 44
      Width = 155
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Non_Conform_Dept'
      ListField = 'Non_Conform_Dept_Descr'
      ListSource = dtsSourceDept
      TabOrder = 9
      OnClick = CheckOK
      ExplicitLeft = 645
    end
    object dblkpNCType: TDBLookupComboBox
      Left = 370
      Top = 12
      Width = 153
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Non_Conform_Type'
      ListField = 'Non_Conform_Type_Descr'
      ListSource = dtsNCType
      TabOrder = 2
      OnClick = CheckOK
      ExplicitLeft = 364
    end
    object BitBtn1: TBitBtn
      Left = 528
      Top = 10
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
      TabOrder = 3
      OnClick = BitBtn1Click
      ExplicitLeft = 522
    end
    object BitBtn3: TBitBtn
      Left = 529
      Top = 42
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
      TabOrder = 8
      OnClick = BitBtn3Click
      ExplicitLeft = 523
    end
    object edtDateRaised: TEdit
      Left = 80
      Top = 12
      Width = 81
      Height = 21
      TabOrder = 10
      OnExit = edtDateRaisedExit
    end
    object btnDateRaised: TBitBtn
      Left = 168
      Top = 10
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
      TabOrder = 1
      OnClick = btnDateRaisedClick
    end
    object dblkpCategory: TDBLookupComboBox
      Left = 80
      Top = 43
      Width = 155
      Height = 21
      KeyField = 'Non_Conform_Category'
      ListField = 'Non_Conform_Category_Descr'
      ListSource = dtsCategory
      TabOrder = 5
      OnClick = CheckOK
    end
    object BitBtn5: TBitBtn
      Left = 239
      Top = 39
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn5Click
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 663
    Width = 812
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
    ExplicitTop = 654
    ExplicitWidth = 806
  end
  object pnlPO: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 97
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 806
    DesignSize = (
      812
      97)
    object Label15: TLabel
      Left = 9
      Top = 15
      Width = 79
      Height = 13
      Caption = 'Purchase Order'
    end
    object Label16: TLabel
      Left = 456
      Top = 15
      Width = 51
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Start Date'
      ExplicitLeft = 462
    end
    object Label17: TLabel
      Left = 645
      Top = 15
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date Required'
      ExplicitLeft = 651
    end
    object Label18: TLabel
      Left = 9
      Top = 42
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
    object Label19: TLabel
      Left = 660
      Top = 42
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Rep'
      ExplicitLeft = 666
    end
    object Label20: TLabel
      Left = 598
      Top = 72
      Width = 91
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Manager'
      ExplicitLeft = 604
    end
    object Label21: TLabel
      Left = 9
      Top = 72
      Width = 59
      Height = 13
      Caption = 'Description'
    end
    object edtPurchaseOrder: TEdit
      Left = 96
      Top = 11
      Width = 81
      Height = 21
      TabOrder = 0
      OnChange = CheckOK
      OnExit = edtPurchaseOrderExit
      OnKeyPress = edtJobBagKeyPress
    end
    object edtPOStartDate: TEdit
      Left = 512
      Top = 11
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      ExplicitLeft = 506
    end
    object edtPODateReq: TEdit
      Left = 727
      Top = 11
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      OnChange = CheckOK
      ExplicitLeft = 721
    end
    object edtPOCustomer: TEdit
      Left = 96
      Top = 38
      Width = 285
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 3
      ExplicitWidth = 279
    end
    object edtPORep: TEdit
      Left = 693
      Top = 38
      Width = 115
      Height = 21
      Anchors = [akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 4
      ExplicitLeft = 687
    end
    object edtPOAccountManager: TEdit
      Left = 693
      Top = 68
      Width = 115
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 5
      ExplicitLeft = 687
    end
    object edtPODescription: TEdit
      Left = 96
      Top = 68
      Width = 441
      Height = 21
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      OnChange = CheckOK
    end
  end
  object qryNCType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Non_Conform_type'
      
        'where ((Inactive = '#39'N'#39') or (Inactive is NULL)) or (Non_Conform_T' +
        'ype = :Non_Conform_Type)'
      'order by Non_Conform_Type_Descr')
    Left = 425
    Top = 17
    ParamData = <
      item
        Name = 'Non_Conform_Type'
      end>
  end
  object qryRaisingDept: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Non_Conform_Dept'
      
        'where ((Inactive = '#39'N'#39') or (Inactive is NULL)) or (Non_Conform_D' +
        'ept = :Non_Conform_Dept)'
      'order by Non_Conform_Dept_Descr')
    Left = 425
    Top = 81
    ParamData = <
      item
        Name = 'Non_Conform_Dept'
      end>
  end
  object qrySourceDept: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Non_Conform_Dept'
      
        'where ((Inactive = '#39'N'#39') or (Inactive is NULL)) or (Non_Conform_D' +
        'ept = :Non_Conform_Dept)'
      'order by Non_Conform_Dept_Descr')
    Left = 424
    Top = 136
    ParamData = <
      item
        Name = 'Non_Conform_Dept'
      end>
  end
  object qryQAOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from QA_Operator'
      
        'where ((Inactive = '#39'N'#39') or (Inactive is NULL)) or (QA_operator =' +
        ' :QA_Operator)'
      'order by QA_Operator_Name')
    Left = 425
    Top = 204
    ParamData = <
      item
        Name = 'QA_Operator'
      end>
  end
  object dtsNCType: TDataSource
    DataSet = qryNCType
    Left = 521
    Top = 17
  end
  object dtsRaisingDept: TDataSource
    DataSet = qryRaisingDept
    Left = 513
    Top = 81
  end
  object dtsSourceDept: TDataSource
    DataSet = qrySourceDept
    Left = 520
    Top = 136
  end
  object dtsQAOperator: TDataSource
    DataSet = qryQAOperator
    Left = 552
    Top = 200
  end
  object qryGetNonConform: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Non_Conform.Job_Bag_Non_Conform,'
      '      Job_Bag_Non_Conform.Date_Point,'
      '      Job_Bag_Non_Conform.Job_Bag,'
      '      Job_Bag_Non_Conform.Operator,'
      '      Operator.Name AS Operator_Name,'
      '      Job_Bag_Non_Conform.Raised_By_Dept,'
      
        '      Raised_By_Dept.Non_Conform_Dept_Descr AS Raised_by_dept_De' +
        'scr,'
      #9'    Job_Bag_Non_Conform.Non_Conform_Category,'
      #9'    (select Non_Conform_Category.Non_Conform_Category_Descr'
      '      from Non_Conform_Category'
      
        '      where Non_Conform_Category.Non_Conform_Category = Job_Bag_' +
        'Non_Conform.Non_Conform_Category) as Non_Conform_Category_Descr,'
      '      Job_Bag_Non_Conform.Non_Conform_Dept,'
      '      Non_Conform_Dept.Non_Conform_Dept_Descr,'
      '      Job_Bag_Non_Conform.Non_Conform_Type,'
      '      Non_Conform_Type.Non_Conform_Type_Descr,'
      '      Job_Bag_Non_Conform.QA_Operator,'
      '      QA_Operator.QA_Operator_Name,'
      '      Job_Bag_Non_Conform.QA_Sign_Off_Date,'
      '      Job_Bag_Non_Conform.Total_Cost,'
      '      Job_Bag_Non_Conform.Total_Cost_to_Client,'
      '      Job_Bag_Non_Conform.Non_Conform_Notes,'
      '      Job_Bag_Non_Conform.Response_Notes_id,'
      '      Job_Bag_Non_Conform.Response_Notes,'
      '      Job_Bag_Non_Conform.Corrective_Notes,'
      '      Job_Bag_Non_Conform.Corrective_Notes_id,'
      '      Job_Bag_Non_Conform.Preventative_Notes_id,'
      '      Job_Bag_Non_Conform.Response_Date,'
      '      Job_Bag_Non_Conform.Corrective_Date,'
      '      Job_Bag_Non_Conform.Preventative_Date,'
      '      Job_Bag_Non_Conform.Job_Reprinted,'
      '      Job_Bag_Non_Conform.Samples_Available,'
      '      Job_Bag.Job_Bag_Descr,'
      '      Job_Bag.Customer,'
      '      Job_Bag.Branch_No,'
      #9'    CASE when Job_Bag.Office_Contact <> 0 then'
      #9#9'    Job_Bag.Date_Start'
      #9'    ELSE'
      #9#9'    (select Purchase_Order.Date_Point'
      #9' '#9'     from Purchase_Order'
      
        '         where Purchase_order.Purchase_Order = Purchase_orderLin' +
        'e.Purchase_Order)'
      '      END as Date_Start,'
      '      Job_Bag.Goods_Required,'
      #9'    CASE when Job_Bag.Customer <> 0 then'
      #9#9'    (select Customer.Name'
      #9' '#9'    from Customer'
      #9'      where Customer.Customer = Job_bag.Customer)'
      #9'    ELSE'
      #9#9'    (select Customer.Name'
      #9' '#9'    from Customer'
      #9'      where Customer.Customer = Purchase_OrderLine.Customer)'
      #9'    END AS Customer_Name,'
      #9'    CASE when Job_Bag.Customer <> 0 then'
      #9#9'    (select Customer_Branch.Account_code'
      #9' '#9'    from Customer_Branch'
      '        where Customer_Branch.Customer = Job_bag.Customer and'
      #9#9#9'    Customer_Branch.Branch_no = Job_bag.Branch_no)'
      #9'    ELSE'
      #9#9'    (select Customer_Branch.Account_code'
      #9' '#9'    from Customer_Branch'
      
        #9'      where Customer_Branch.Customer = Purchase_orderline.Custo' +
        'mer and'
      #9#9#9'    Customer_Branch.Branch_no = Purchase_orderline.Branch_no)'
      #9'    END AS Account_Code,'
      #9'    Job_Bag_Non_Conform.Non_Conform_Status,'
      #9'    Non_Conform_Status.Non_Conform_Status_Descr,'
      #9'    Purchase_OrderLine.Purchase_order,'
      #9'    Purchase_OrderLine.Customers_Desc,'
      #9'    CASE when Job_Bag.Rep <> 0 then'
      #9#9'    (select Rep.Name'
      #9' '#9'    from Rep'
      #9'      where Rep.Rep = Job_bag.Rep)'
      #9'    ELSE'
      #9#9'    (select Rep.Name'
      #9' '#9'    from Rep'
      #9'      where Rep.Rep = Purchase_orderLine.Rep)'
      #9'    END AS Rep_Name,'
      #9'    CASE when Job_Bag.Office_Contact <> 0 then'
      #9#9'    (select operator.Name'
      #9' '#9'    from Operator'
      #9'      where Operator.Operator = Job_bag.Office_Contact)'
      #9'    ELSE'
      #9#9'    (select operator.Name'
      #9' '#9'    from Purchase_Order, Operator'
      
        '        where Purchase_order.Purchase_Order = Purchase_orderLine' +
        '.Purchase_Order and'
      #9#9#9'    Operator.Operator = Purchase_Order.Office_Contact)'
      #9'    END AS Account_Manager,'
      '      Purchase_OrderLine.Goods_Required as PO_Goods_Required'
      'FROM Purchase_OrderLine'
      #9'RIGHT JOIN (QA_Operator'
      #9'RIGHT JOIN (Operator'
      #9'INNER JOIN (Non_Conform_Type'
      #9'INNER JOIN (Non_Conform_Status'
      #9'INNER JOIN (Non_Conform_Dept AS Raised_By_Dept'
      #9'RIGHT JOIN (Job_Bag'
      #9'RIGHT JOIN (Non_Conform_Dept'
      #9'INNER JOIN Job_Bag_Non_Conform'
      
        #9#9'ON Non_Conform_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Non' +
        '_Conform_Dept)'
      #9#9'ON Job_Bag.Job_Bag = Job_Bag_Non_Conform.Job_Bag)'
      
        #9#9'ON Raised_By_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Raise' +
        'd_By_Dept)'
      
        #9#9'ON Non_Conform_Status.Non_Conform_Status = Job_Bag_Non_Conform' +
        '.Non_Conform_Status)'
      
        #9#9'ON Non_Conform_Type.Non_Conform_Type = Job_Bag_Non_Conform.Non' +
        '_Conform_Type)'
      #9#9'ON Operator.Operator = Job_Bag_Non_Conform.Operator)'
      #9#9'ON QA_Operator.QA_Operator = Job_Bag_Non_Conform.QA_Operator)'
      
        #9#9'ON (Purchase_OrderLine.Line = Job_Bag_Non_Conform.Line) AND (P' +
        'urchase_OrderLine.Purchase_Order = Job_Bag_Non_Conform.Purchase_' +
        'Order)'
      'WHERE Job_Bag_Non_Conform = :Job_Bag_Non_Conform')
    Left = 184
    Top = 16
    ParamData = <
      item
        Name = 'Job_Bag_Non_Conform'
      end>
  end
  object qryGetJobBag: TFDQuery
    ConnectionName = 'Pb'
    SQL.Strings = (
      'select  Job_Bag.Job_Bag,'
      '        Job_Bag.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Job_Bag_Descr,'
      '        Date_Start,'
      '        Goods_Required,'
      '        Operator.Name as Account_Manager,'
      '        Rep.Name as Rep_Name'
      'from Job_Bag, Customer, Operator, Rep'
      'where Job_Bag.Job_Bag = :Job_Bag and'
      'Job_Bag.Customer = Customer.Customer and'
      'Job_Bag.Office_Contact = Operator.Operator and'
      'Job_Bag.rep = rep.rep')
    Left = 184
    Top = 80
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetLastNC: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_Non_Conform_Number'
      'From Company'
      'Where Company = 1')
    Left = 128
    Top = 704
  end
  object qryUpdateLastNC: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Non_Conform_Number = :Last_Non_Conform_Number'
      'Where Company = 1')
    Left = 208
    Top = 704
    ParamData = <
      item
        Name = 'Last_Non_Conform_Number'
      end>
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_bag_Non_Conform'
      'set Date_Point = :Date_Point,'
      'Job_Bag = :Job_bag,'
      'Raised_by_Dept = :Raised_by_Dept,'
      'Non_Conform_Dept = :Non_Conform_Dept,'
      'Non_Conform_Type = :Non_Conform_Type,'
      'QA_Operator = :QA_Operator,'
      'QA_Sign_Off_Date = :QA_Sign_Off_Date,'
      'Non_Conform_Notes = :Non_Conform_Notes,'
      'Response_Notes_id = :Response_Notes_id,'
      'Corrective_Notes_id = :Corrective_Notes_id,'
      'Preventative_Notes_id = :Preventative_Notes_Id,'
      'Response_Date = :Response_Date,'
      'Corrective_Date = :Corrective_Date,'
      'Preventative_Date = :Preventative_Date,'
      'Total_Cost = :Total_Cost,'
      'Total_Cost_to_Client = :Total_Cost_to_client,'
      'Non_Conform_Status = :Non_Conform_Status,'
      'Purchase_Order = :Purchase_Order,'
      'Line = :Line,'
      'Job_Reprinted = :Job_Reprinted,'
      'Samples_Available = :Samples_Available,'
      'Non_Conform_Category = :Non_Conform_Category'
      'Where Job_Bag_Non_Conform = :Job_Bag_Non_Conform')
    Left = 296
    Top = 16
    ParamData = <
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Job_bag'
        DataType = ftInteger
      end
      item
        Name = 'Raised_by_Dept'
      end
      item
        Name = 'Non_Conform_Dept'
      end
      item
        Name = 'Non_Conform_Type'
      end
      item
        Name = 'QA_Operator'
        DataType = ftInteger
      end
      item
        Name = 'QA_Sign_Off_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Non_Conform_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Response_Notes_id'
        DataType = ftInteger
      end
      item
        Name = 'Corrective_Notes_id'
        DataType = ftInteger
      end
      item
        Name = 'Preventative_Notes_Id'
        DataType = ftInteger
      end
      item
        Name = 'Response_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Corrective_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Preventative_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Total_Cost'
      end
      item
        Name = 'Total_Cost_to_client'
      end
      item
        Name = 'Non_Conform_Status'
      end
      item
        Name = 'Purchase_Order'
        DataType = ftFloat
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Job_Reprinted'
      end
      item
        Name = 'Samples_Available'
      end
      item
        Name = 'Non_Conform_Category'
        DataType = ftInteger
      end
      item
        Name = 'Job_Bag_Non_Conform'
        DataType = ftInteger
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_Bag_Non_Conform'
      'set inactive = '#39'Y'#39', inactive_date = getdate()'
      'where Job_Bag_Non_Conform = :Job_Bag_Non_Conform')
    Left = 288
    Top = 88
    ParamData = <
      item
        Name = 'Job_Bag_Non_Conform'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Job_bag_Non_Conform'
      '(Job_Bag_Non_Conform,'
      'Date_Point,'
      'Job_Bag,'
      'Operator,'
      'Raised_by_Dept,'
      'Non_Conform_Dept,'
      'Non_Conform_Type,'
      'QA_Operator,'
      'QA_Sign_Off_Date,'
      'Non_Conform_Notes,'
      'Response_Notes_id,'
      'Corrective_Notes_id,'
      'Preventative_notes_id,'
      'Response_Date,'
      'Corrective_Date,'
      'Preventative_Date,'
      'Total_Cost,'
      'Total_Cost_to_Client,'
      'Non_Conform_Status,'
      'Purchase_Order,'
      'Line,'
      'Job_Reprinted,'
      'Samples_Available,'
      'Non_Conform_Category'
      ')'
      'Values'
      '('
      ':Job_Bag_Non_Conform,'
      ':Date_Point,'
      ':Job_Bag,'
      ':Operator,'
      ':Raised_by_Dept,'
      ':Non_Conform_Dept,'
      ':Non_Conform_Type,'
      ':QA_Operator,'
      ':QA_Sign_Off_Date,'
      ':Non_Conform_Notes,'
      ':Response_Notes_id,'
      ':Corrective_Notes_id,'
      ':Preventative_notes_id,'
      ':Response_Date,'
      ':Corrective_Date,'
      ':Preventative_Date,'
      ':Total_Cost,'
      ':Total_Cost_to_Client,'
      ':Non_Conform_Status,'
      ':Purchase_Order,'
      ':Line,'
      ':Job_Reprinted,'
      ':Samples_Available,'
      ':Non_Conform_Category'
      ')')
    Left = 304
    Top = 704
    ParamData = <
      item
        Name = 'Job_Bag_Non_Conform'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Job_Bag'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Raised_by_Dept'
      end
      item
        Name = 'Non_Conform_Dept'
      end
      item
        Name = 'Non_Conform_Type'
      end
      item
        Name = 'QA_Operator'
        DataType = ftInteger
      end
      item
        Name = 'QA_Sign_Off_Date'
      end
      item
        Name = 'Non_Conform_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Response_Notes_id'
        DataType = ftInteger
      end
      item
        Name = 'Corrective_Notes_id'
        DataType = ftInteger
      end
      item
        Name = 'Preventative_notes_id'
        DataType = ftInteger
      end
      item
        Name = 'Response_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Corrective_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Preventative_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Total_Cost'
      end
      item
        Name = 'Total_Cost_to_Client'
      end
      item
        Name = 'Non_Conform_Status'
      end
      item
        Name = 'Purchase_Order'
        DataType = ftFloat
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Job_Reprinted'
      end
      item
        Name = 'Samples_Available'
      end
      item
        Name = 'Non_Conform_Category'
        DataType = ftInteger
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Purchase_orderLine.Purchase_Order,'
      '        Purchase_orderLine.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Purchase_orderLine.Customers_Desc,'
      '        Purchase_Order.Date_Point,'
      '        Purchase_orderLine.Goods_Required,'
      '        Operator.Name as Account_Manager,'
      '        Rep.Name as Rep_Name'
      'from Purchase_OrderLine, Purchase_Order, Customer, Operator, Rep'
      'where Purchase_orderLine.Purchase_Order = :Purchase_Order and'
      
        'Purchase_Orderline.Purchase_order = Purchase_Order.Purchase_Orde' +
        'r and'
      'Purchase_orderLine.Customer = Customer.Customer and'
      'Purchase_order.Office_Contact = Operator.Operator and'
      'Purchase_orderLine.rep = rep.rep')
    Left = 184
    Top = 153
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryCategory: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Non_Conform_Category'
      
        'where ((Inactive = '#39'N'#39') or (Inactive is NULL)) or (Non_Conform_C' +
        'ategory = :Non_Conform_Category)'
      'order by Non_Conform_Category_Descr')
    Left = 184
    Top = 240
    ParamData = <
      item
        Name = 'Non_Conform_Category'
      end>
  end
  object dtsCategory: TDataSource
    DataSet = qryCategory
    Left = 264
    Top = 240
  end
end
