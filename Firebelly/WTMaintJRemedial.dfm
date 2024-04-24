object frmWTMaintJRemedial: TfrmWTMaintJRemedial
  Left = 297
  Top = 42
  Caption = 'Remedial details'
  ClientHeight = 681
  ClientWidth = 907
  Color = clBtnFace
  Constraints.MinHeight = 660
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 482
    Top = 280
    Width = 23
    Height = 22
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Label10: TLabel
    Left = 8
    Top = 384
    Width = 82
    Height = 13
    Caption = 'Tools Required?'
  end
  object pnlbottom: TPanel
    Left = 0
    Top = 605
    Width = 907
    Height = 57
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 591
    ExplicitWidth = 892
    object lblDelete: TLabel
      Left = 245
      Top = 22
      Width = 106
      Height = 13
      Caption = 'Delete these details?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 373
      Top = 16
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Enabled = False
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 461
      Top = 16
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
    object chkbxProduction: TCheckBox
      Left = 8
      Top = 7
      Width = 161
      Height = 17
      Caption = 'Production Required'
      TabOrder = 2
    end
    object chkbxCompleted: TCheckBox
      Left = 8
      Top = 32
      Width = 97
      Height = 17
      Caption = 'Work Completed'
      TabOrder = 3
    end
    object btnInternalNotes: TBitBtn
      Left = 813
      Top = 16
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
      TabOrder = 4
      OnClick = btnInternalNotesClick
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 907
    Height = 81
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 892
    DesignSize = (
      907
      81)
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Logged by'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 737
      Top = 16
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date'
      ExplicitLeft = 734
    end
    object Label15: TLabel
      Left = 288
      Top = 48
      Width = 73
      Height = 13
      Caption = 'Remedial Type'
    end
    object Label16: TLabel
      Left = 8
      Top = 48
      Width = 63
      Height = 13
      Caption = 'Reported by'
    end
    object Label17: TLabel
      Left = 652
      Top = 48
      Width = 53
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Caused by'
      ExplicitLeft = 649
    end
    object dblkpOperator: TDBLookupComboBox
      Left = 77
      Top = 12
      Width = 129
      Height = 21
      KeyField = 'Operator'
      ListField = 'Operator_Name'
      ListSource = srcOperator
      TabOrder = 0
    end
    object edtDateRaised: TEdit
      Left = 774
      Top = 12
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnExit = edtDateRaisedExit
      ExplicitLeft = 759
    end
    object btnDateRequired: TBitBtn
      Left = 874
      Top = 10
      Width = 25
      Height = 25
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
      TabOrder = 2
      OnClick = btnDateRequiredClick
      ExplicitLeft = 859
    end
    object dblkpRemedialType: TDBLookupComboBox
      Left = 368
      Top = 44
      Width = 209
      Height = 21
      KeyField = 'Remedial_type'
      ListField = 'Remedial_type_descr'
      ListSource = dtsRemedialType
      TabOrder = 3
    end
    object dblkpRemedialCategory: TDBLookupComboBox
      Left = 77
      Top = 44
      Width = 153
      Height = 21
      KeyField = 'Remedial_Category'
      ListField = 'Remedial_Category_Descr'
      ListSource = dtsRemedialCategory
      TabOrder = 4
    end
    object dblkpRemedialDept: TDBLookupComboBox
      Left = 710
      Top = 44
      Width = 153
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Remedial_Dept'
      ListField = 'Remedial_Dept_Descr'
      ListSource = dtsRemedailDept
      TabOrder = 5
      ExplicitLeft = 695
    end
    object BitBtn1: TBitBtn
      Left = 584
      Top = 43
      Width = 22
      Height = 22
      Hint = 'Search for Customer'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 240
      Top = 43
      Width = 22
      Height = 22
      Hint = 'Search for Customer'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 875
      Top = 43
      Width = 22
      Height = 22
      Hint = 'Search for Customer'
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 8
      OnClick = BitBtn4Click
      ExplicitLeft = 860
    end
  end
  object pnlfooter: TPanel
    Left = 0
    Top = 509
    Width = 907
    Height = 96
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 504
    ExplicitWidth = 898
    DesignSize = (
      907
      96)
    object Label3: TLabel
      Left = 672
      Top = 46
      Width = 89
      Height = 13
      Caption = 'Proposed fit date'
    end
    object Label4: TLabel
      Left = 607
      Top = 75
      Width = 77
      Height = 13
      Caption = 'Remedial Fitter'
    end
    object Label5: TLabel
      Left = 731
      Top = 13
      Width = 23
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Cost'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 8
      Top = 15
      Width = 95
      Height = 15
      Caption = 'Original Templater'
    end
    object Label19: TLabel
      Left = 8
      Top = 46
      Width = 72
      Height = 13
      Caption = 'Original Fitter'
    end
    object Label20: TLabel
      Left = 8
      Top = 75
      Width = 77
      Height = 13
      Caption = 'Sub-contractor'
    end
    object SpeedButton6: TSpeedButton
      Left = 324
      Top = 68
      Width = 25
      Height = 25
      Hint = 'Clear Default Upstand Size'
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
      OnClick = SpeedButton6Click
    end
    object dblkpFitters: TDBLookupComboBox
      Left = 685
      Top = 71
      Width = 171
      Height = 21
      KeyField = 'Fitter'
      ListField = 'Fitter_Name'
      ListSource = srcFitter
      TabOrder = 0
      OnClick = EnableOK
    end
    object edtPrice: TCREditMoney
      Left = 766
      Top = 9
      Width = 89
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = 'edtPrice'
      OnChange = EnableOK
    end
    object edtInstallDate: TEdit
      Left = 766
      Top = 42
      Width = 89
      Height = 21
      TabOrder = 2
      OnExit = edtDateRaisedExit
    end
    object btnInstallDate: TBitBtn
      Left = 869
      Top = 40
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
      OnClick = btnInstallDateClick
    end
    object BitBtn5: TBitBtn
      Left = 869
      Top = 69
      Width = 25
      Height = 25
      Hint = 'Search for Customer'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn5Click
    end
    object dblkpOriginalTemplater: TDBLookupComboBox
      Left = 110
      Top = 10
      Width = 171
      Height = 21
      KeyField = 'Fitter'
      ListField = 'Fitter_Name'
      ListSource = srcFitter
      TabOrder = 5
      OnClick = EnableOK
    end
    object dblkpOriginalFitter: TDBLookupComboBox
      Left = 110
      Top = 42
      Width = 171
      Height = 21
      KeyField = 'Fitter'
      ListField = 'Fitter_Name'
      ListSource = srcFitter
      TabOrder = 6
      OnClick = EnableOK
    end
    object edtCustomer: TEdit
      Left = 110
      Top = 71
      Width = 171
      Height = 21
      ReadOnly = True
      TabOrder = 7
      Text = 'edtCustomer'
    end
    object btnCustomer: TButton
      Left = 293
      Top = 69
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = btnCustomerClick
    end
    object BitBtn6: TBitBtn
      Left = 293
      Top = 7
      Width = 25
      Height = 27
      Hint = 'Search for Customer'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 9
      OnClick = BitBtn5Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 907
    Height = 428
    Align = alClient
    Caption = 'Panel2'
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 898
    ExplicitHeight = 414
    object pnlLeft: TPanel
      Left = 1
      Top = 1
      Width = 448
      Height = 426
      Align = alLeft
      ParentBackground = False
      TabOrder = 0
      ExplicitHeight = 403
      object Label8: TLabel
        Left = 8
        Top = 112
        Width = 184
        Height = 13
        Caption = 'What items needs returning to site?'
      end
      object Label11: TLabel
        Left = 8
        Top = 216
        Width = 112
        Height = 13
        Caption = 'Tools required on site'
      end
      object Label13: TLabel
        Left = 8
        Top = 320
        Width = 298
        Height = 13
        Caption = 'Additional Notes (Additional labour/Silicone colour used))'
      end
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 80
        Height = 13
        Caption = 'Remedial Issue:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object memItemsToReturnToSite: TMemo
        Left = 7
        Top = 128
        Width = 430
        Height = 80
        MaxLength = 255
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = EnableOK
      end
      object memToolsRequired: TMemo
        Left = 9
        Top = 232
        Width = 430
        Height = 80
        MaxLength = 255
        ScrollBars = ssVertical
        TabOrder = 2
        OnChange = EnableOK
      end
      object memAdditionalNotes: TMemo
        Left = 9
        Top = 336
        Width = 430
        Height = 80
        ScrollBars = ssVertical
        TabOrder = 3
        OnChange = EnableOK
      end
      object memRemedials: TMemo
        Left = 8
        Top = 23
        Width = 430
        Height = 80
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = EnableOK
      end
    end
    object pnlRight: TPanel
      Left = 449
      Top = 1
      Width = 457
      Height = 426
      Align = alClient
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 442
      ExplicitHeight = 403
      object Label9: TLabel
        Left = 10
        Top = 112
        Width = 122
        Height = 13
        Caption = 'What items still on site?'
      end
      object Label12: TLabel
        Left = 10
        Top = 216
        Width = 179
        Height = 13
        Caption = 'Site requirements before returning'
      end
      object Label14: TLabel
        Left = 10
        Top = 320
        Width = 186
        Height = 13
        Caption = 'Factory/Manufacturing Notes/Issues'
      end
      object Label1: TLabel
        Left = 11
        Top = 8
        Width = 263
        Height = 13
        Caption = 'Requirements to make good (include dimensions):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object memItemsStillOnSite: TMemo
        Left = 10
        Top = 128
        Width = 430
        Height = 80
        MaxLength = 255
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = EnableOK
      end
      object memSiteRequirements: TMemo
        Left = 10
        Top = 232
        Width = 430
        Height = 80
        MaxLength = 255
        ScrollBars = ssVertical
        TabOrder = 2
        OnChange = EnableOK
      end
      object memManufacturingNotes: TMemo
        Left = 10
        Top = 336
        Width = 430
        Height = 80
        ScrollBars = ssVertical
        TabOrder = 3
        OnChange = EnableOK
      end
      object memMaterials: TMemo
        Left = 11
        Top = 24
        Width = 430
        Height = 80
        MaxLength = 255
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = EnableOK
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 662
    Width = 907
    Height = 19
    Panels = <>
    ExplicitTop = 648
    ExplicitWidth = 892
  end
  object qryFitter: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT * '
      'FROM Fitter'
      'WHERE (inactive = '#39'N'#39') or (Fitter = :Fitter)'
      'ORDER BY Fitter.Fitter_Name')
    Left = 312
    Top = 248
    ParamData = <
      item
        Name = 'Fitter'
      end>
  end
  object srcFitter: TDataSource
    DataSet = qryFitter
    Left = 352
    Top = 224
  end
  object qryOperator: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Operator'
      'order by Operator_Name')
    Left = 288
    Top = 8
  end
  object srcOperator: TDataSource
    DataSet = qryOperator
    Left = 320
  end
  object qryRemedialType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Remedial_Type'
      'ORDER BY Remedial_Type_Descr')
    Left = 240
    Top = 81
  end
  object qryRemedialCategory: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Remedial_Category'
      'ORDER BY Remedial_Category_Descr')
    Left = 240
    Top = 129
  end
  object qryRemedialDept: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Remedial_Dept'
      'ORDER BY Remedial_Dept_Descr')
    Left = 240
    Top = 185
  end
  object dtsRemedialType: TDataSource
    DataSet = qryRemedialType
    Left = 328
    Top = 81
  end
  object dtsRemedialCategory: TDataSource
    DataSet = qryRemedialCategory
    Left = 328
    Top = 129
  end
  object dtsRemedailDept: TDataSource
    DataSet = qryRemedialDept
    Left = 328
    Top = 185
  end
  object IntFlashTimer: TTimer
    Enabled = False
    OnTimer = IntFlashTimerTimer
    Left = 760
    Top = 632
  end
end
