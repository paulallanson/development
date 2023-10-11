object PBMaintPOrdNonConfDocFrm: TPBMaintPOrdNonConfDocFrm
  Left = 315
  Top = 122
  Caption = 'Maintain Non Conformance'
  ClientHeight = 561
  ClientWidth = 787
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 790
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 499
    Width = 787
    Height = 43
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object Panel4: TPanel
      Left = 295
      Top = 1
      Width = 491
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        491
        41)
      object DelLabel: TLabel
        Left = 33
        Top = 14
        Width = 269
        Height = 15
        Caption = 'Really Delete this Non Conformance document?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnOK: TBitBtn
        Left = 312
        Top = 10
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        Default = True
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
        Left = 400
        Top = 10
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 542
    Width = 787
    Height = 19
    Panels = <>
  end
  object pnlNotes: TPanel
    Left = 0
    Top = 72
    Width = 787
    Height = 346
    Align = alClient
    ParentBackground = False
    TabOrder = 2
    object pnlNCAdetails: TPanel
      Left = 1
      Top = 1
      Width = 785
      Height = 100
      Align = alTop
      Caption = 'pnlNCAdetails'
      ParentBackground = False
      TabOrder = 0
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 783
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'Non Conformance Details'
        ParentBackground = False
        TabOrder = 0
      end
      object memDetails: TMemo
        Left = 1
        Top = 21
        Width = 783
        Height = 78
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = memDetailsChange
      end
    end
    object pnlResponse: TPanel
      Left = 1
      Top = 101
      Width = 785
      Height = 44
      Align = alClient
      Caption = 'pnlResponse'
      ParentBackground = False
      TabOrder = 1
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 783
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'Response Details'
        ParentBackground = False
        TabOrder = 0
      end
      object memResponse: TMemo
        Left = 1
        Top = 21
        Width = 783
        Height = 22
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = memResponseChange
      end
    end
    object pnlAction: TPanel
      Left = 1
      Top = 145
      Width = 785
      Height = 100
      Align = alBottom
      Caption = 'pnlAction'
      ParentBackground = False
      TabOrder = 2
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 783
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'Corrective Action'
        ParentBackground = False
        TabOrder = 0
      end
      object memAction: TMemo
        Left = 1
        Top = 21
        Width = 783
        Height = 78
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = memActionChange
      end
    end
    object pnlPrevent: TPanel
      Left = 1
      Top = 245
      Width = 785
      Height = 100
      Align = alBottom
      Caption = 'pnlPrevent'
      ParentBackground = False
      TabOrder = 3
      object Panel9: TPanel
        Left = 1
        Top = 1
        Width = 783
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'Preventative Action'
        ParentBackground = False
        TabOrder = 0
      end
      object memPrevent: TMemo
        Left = 1
        Top = 21
        Width = 783
        Height = 78
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = memPreventChange
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 418
    Width = 787
    Height = 81
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      787
      81)
    object Label12: TLabel
      Left = 320
      Top = 16
      Width = 83
      Height = 13
      Caption = 'QA Signed off by:'
    end
    object Label13: TLabel
      Left = 408
      Top = 48
      Width = 26
      Height = 13
      Caption = 'Date:'
    end
    object Label14: TLabel
      Left = 625
      Top = 48
      Width = 80
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Cost to Company'
    end
    object Label1: TLabel
      Left = 641
      Top = 16
      Width = 62
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Cost to Client'
    end
    object dblkpQAOperator: TDBLookupComboBox
      Left = 408
      Top = 12
      Width = 113
      Height = 21
      KeyField = 'QA_Operator'
      ListField = 'QA_Operator_Name'
      ListSource = dtsQAOperator
      TabOrder = 0
      OnClick = dblkpQAOperatorClick
    end
    object memTotalCost: TMemo
      Left = 713
      Top = 44
      Width = 73
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      WantReturns = False
      WordWrap = False
      OnEnter = SaveValue
      OnExit = ValidateMoney3DP
      OnKeyPress = CheckKeyIsFloat
    end
    object BitBtn4: TBitBtn
      Left = 526
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
      OnClick = BitBtn1Click
    end
    object edtQASignOff: TEdit
      Left = 440
      Top = 44
      Width = 81
      Height = 21
      TabOrder = 2
      OnExit = edtQASignOffExit
    end
    object btnDate: TBitBtn
      Left = 526
      Top = 42
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
      TabOrder = 3
      OnClick = btnDateClick
    end
    object memCosttoClient: TMemo
      Left = 713
      Top = 12
      Width = 73
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      WantReturns = False
      WordWrap = False
      OnEnter = SaveValue
      OnExit = ValidateMoney3DP
      OnKeyPress = CheckKeyIsFloat
    end
    object btnClear: TBitBtn
      Left = 560
      Top = 10
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
      TabOrder = 7
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
      TabOrder = 8
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 72
    Align = alTop
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      787
      72)
    object Label7: TLabel
      Left = 167
      Top = 16
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object Label8: TLabel
      Left = 593
      Top = 13
      Width = 47
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Raised by'
    end
    object Label9: TLabel
      Left = 331
      Top = 48
      Width = 61
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Raising Dept'
    end
    object Label10: TLabel
      Left = 580
      Top = 48
      Width = 60
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Source Dept'
    end
    object Label11: TLabel
      Left = 328
      Top = 16
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Reason Type'
    end
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      Caption = 'NCA Number:'
    end
    object Label22: TLabel
      Left = 8
      Top = 48
      Width = 42
      Height = 13
      Caption = 'Category'
    end
    object edtRaisedBy: TEdit
      Left = 648
      Top = 9
      Width = 104
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object BitBtn2: TBitBtn
      Left = 759
      Top = 7
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
      TabOrder = 6
      OnClick = BitBtn2Click
    end
    object dblkpRaisedByDept: TDBLookupComboBox
      Left = 401
      Top = 44
      Width = 137
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Non_Conform_Dept'
      ListField = 'Non_Conform_Dept_Descr'
      ListSource = dtsRaisingDept
      TabOrder = 9
      OnClick = CheckOK
    end
    object dblkpSourceDept: TDBLookupComboBox
      Left = 649
      Top = 44
      Width = 137
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Non_Conform_Dept'
      ListField = 'Non_Conform_Dept_Descr'
      ListSource = dtsSourceDept
      TabOrder = 11
      OnClick = CheckOK
    end
    object dblkpNCType: TDBLookupComboBox
      Left = 400
      Top = 12
      Width = 137
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Non_Conform_Type'
      ListField = 'Non_Conform_Type_Descr'
      ListSource = dtsNCType
      TabOrder = 3
      OnClick = CheckOK
    end
    object BitBtn1: TBitBtn
      Left = 542
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
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 543
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
      TabOrder = 10
      OnClick = BitBtn3Click
    end
    object edtDateRaised: TEdit
      Left = 193
      Top = 11
      Width = 81
      Height = 21
      TabOrder = 1
      OnExit = edtDateRaisedExit
    end
    object btnDateRaised: TBitBtn
      Left = 281
      Top = 9
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
      OnClick = btnDateRaisedClick
    end
    object edtNCANumber: TEdit
      Left = 80
      Top = 11
      Width = 73
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnExit = edtDateRaisedExit
    end
    object dblkpCategory: TDBLookupComboBox
      Left = 80
      Top = 44
      Width = 155
      Height = 21
      KeyField = 'Non_Conform_Category'
      ListField = 'Non_Conform_Category_Descr'
      ListSource = dtsCategory
      TabOrder = 7
      OnClick = CheckOK
    end
    object BitBtn5: TBitBtn
      Left = 239
      Top = 42
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
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
    Left = 681
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
    Left = 681
    Top = 89
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
    Left = 680
    Top = 160
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
      
        'where ((Inactive = '#39'N'#39') or (Inactive is NULL)) or (QA_Operator =' +
        ' :QA_Operator)'
      'order by QA_Operator_Name')
    Left = 681
    Top = 236
    ParamData = <
      item
        Name = 'QA_Operator'
      end>
  end
  object dtsNCType: TDataSource
    DataSet = qryNCType
    Left = 809
    Top = 9
  end
  object dtsRaisingDept: TDataSource
    DataSet = qryRaisingDept
    Left = 753
    Top = 97
  end
  object dtsSourceDept: TDataSource
    DataSet = qrySourceDept
    Left = 752
    Top = 168
  end
  object dtsQAOperator: TDataSource
    DataSet = qryQAOperator
    Left = 752
    Top = 240
  end
  object qryCategory: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Non_Conform_Category'
      
        'where ((Inactive = '#39'N'#39') or (Inactive is NULL)) or (Non_Conform_C' +
        'ategory = :Non_Conform_Category)'
      'order by Non_Conform_Category_Descr')
    Left = 681
    Top = 297
    ParamData = <
      item
        Name = 'Non_Conform_Category'
      end>
  end
  object dtsCategory: TDataSource
    DataSet = qryCategory
    Left = 745
    Top = 297
  end
end
