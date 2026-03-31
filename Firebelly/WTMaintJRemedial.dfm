object frmWTMaintJRemedial: TfrmWTMaintJRemedial
  Left = 297
  Top = 42
  Caption = 'Remedial details'
  ClientHeight = 703
  ClientWidth = 899
  Color = clBtnFace
  Constraints.MinHeight = 660
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object StatusBar1: TStatusBar
    Left = 0
    Top = 684
    Width = 899
    Height = 19
    Panels = <>
  end
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 899
    Height = 684
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
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
      Width = 94
      Height = 17
      Caption = 'Tools Required?'
    end
    object pnlbottom: TPanel
      Left = 0
      Top = 627
      Width = 899
      Height = 57
      Align = alBottom
      ParentBackground = False
      TabOrder = 0
      object lblDelete: TLabel
        Left = 245
        Top = 22
        Width = 128
        Height = 17
        Caption = 'Delete these details?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnOK: TBitBtn
        Left = 380
        Top = 17
        Width = 75
        Height = 25
        Caption = 'OK'
        Default = True
        Enabled = False
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnOKClick
      end
      object BitBtn2: TBitBtn
        Left = 468
        Top = 17
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
        Top = 34
        Width = 208
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
        Font.Height = -13
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
    object pnlfooter: TPanel
      Left = 0
      Top = 531
      Width = 899
      Height = 96
      Align = alBottom
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        899
        96)
      object Label3: TLabel
        Left = 653
        Top = 43
        Width = 102
        Height = 17
        Caption = 'Proposed fit date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 590
        Top = 73
        Width = 87
        Height = 17
        Caption = 'Remedial Fitter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 728
        Top = 13
        Width = 27
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Cost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 8
        Top = 14
        Width = 108
        Height = 17
        Caption = 'Original Templater'
      end
      object Label19: TLabel
        Left = 8
        Top = 43
        Width = 79
        Height = 17
        Caption = 'Original Fitter'
      end
      object Label20: TLabel
        Left = 8
        Top = 73
        Width = 87
        Height = 17
        Caption = 'Sub-contractor'
      end
      object SpeedButton6: TSpeedButton
        Left = 336
        Top = 69
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
        Top = 69
        Width = 171
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        KeyField = 'Fitter'
        ListField = 'Fitter_Name'
        ListSource = srcFitter3
        ParentFont = False
        TabOrder = 0
        OnClick = EnableOK
      end
      object edtPrice: TCREditMoney
        Left = 766
        Top = 10
        Width = 89
        Height = 25
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'edtPrice'
        OnChange = EnableOK
      end
      object edtInstallDate: TEdit
        Left = 766
        Top = 39
        Width = 89
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnExit = edtDateRaisedExit
      end
      object btnInstallDate: TBitBtn
        Left = 863
        Top = 39
        Width = 25
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
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
        ParentFont = False
        TabOrder = 3
        OnClick = btnInstallDateClick
      end
      object BitBtn5: TBitBtn
        Left = 863
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
        Left = 122
        Top = 10
        Width = 171
        Height = 25
        KeyField = 'Fitter'
        ListField = 'Fitter_Name'
        ListSource = srcFitter1
        TabOrder = 5
        OnClick = EnableOK
      end
      object dblkpOriginalFitter: TDBLookupComboBox
        Left = 122
        Top = 39
        Width = 171
        Height = 25
        KeyField = 'Fitter'
        ListField = 'Fitter_Name'
        ListSource = srcFitter2
        TabOrder = 6
        OnClick = EnableOK
      end
      object edtCustomer: TEdit
        Left = 122
        Top = 69
        Width = 171
        Height = 25
        ReadOnly = True
        TabOrder = 7
        Text = 'edtCustomer'
      end
      object btnCustomer: TButton
        Left = 305
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
        Left = 305
        Top = 9
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
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 899
      Height = 81
      Align = alTop
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        899
        81)
      object Label6: TLabel
        Left = 8
        Top = 14
        Width = 65
        Height = 17
        Caption = 'Logged by'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 719
        Top = 14
        Width = 27
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Date'
      end
      object Label15: TLabel
        Left = 288
        Top = 50
        Width = 85
        Height = 17
        Caption = 'Remedial Type'
      end
      object Label16: TLabel
        Left = 8
        Top = 50
        Width = 73
        Height = 17
        Caption = 'Reported by'
      end
      object Label17: TLabel
        Left = 623
        Top = 50
        Width = 61
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Caused by'
      end
      object dblkpOperator: TDBLookupComboBox
        Left = 87
        Top = 10
        Width = 129
        Height = 25
        KeyField = 'Operator'
        ListField = 'Operator_Name'
        ListSource = srcOperator
        TabOrder = 0
      end
      object edtDateRaised: TEdit
        Left = 756
        Top = 10
        Width = 89
        Height = 25
        Anchors = [akTop, akRight]
        TabOrder = 1
        OnExit = edtDateRaisedExit
      end
      object btnDateRequired: TBitBtn
        Left = 856
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
      end
      object dblkpRemedialType: TDBLookupComboBox
        Left = 381
        Top = 46
        Width = 200
        Height = 25
        KeyField = 'Remedial_type'
        ListField = 'Remedial_type_descr'
        ListSource = dtsRemedialType
        TabOrder = 3
      end
      object dblkpRemedialCategory: TDBLookupComboBox
        Left = 87
        Top = 46
        Width = 153
        Height = 25
        KeyField = 'Remedial_Category'
        ListField = 'Remedial_Category_Descr'
        ListSource = dtsRemedialCategory
        TabOrder = 4
      end
      object dblkpRemedialDept: TDBLookupComboBox
        Left = 692
        Top = 46
        Width = 153
        Height = 25
        Anchors = [akTop, akRight]
        KeyField = 'Remedial_Dept'
        ListField = 'Remedial_Dept_Descr'
        ListSource = dtsRemedailDept
        TabOrder = 5
      end
      object BitBtn1: TBitBtn
        Left = 584
        Top = 50
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
        Left = 245
        Top = 49
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
        Left = 857
        Top = 47
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
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 81
      Width = 899
      Height = 450
      Align = alClient
      Caption = 'Panel2'
      ParentBackground = False
      TabOrder = 3
      object pcDetails: TPageControl
        Left = 1
        Top = 1
        Width = 897
        Height = 448
        ActivePage = tsDetails
        Align = alClient
        TabOrder = 0
        object tsDetails: TTabSheet
          Caption = 'Details'
          object pnlRight: TPanel
            Left = 448
            Top = 0
            Width = 441
            Height = 416
            Align = alClient
            ParentBackground = False
            TabOrder = 0
            ExplicitHeight = 420
            object Label9: TLabel
              Left = 10
              Top = 107
              Width = 234
              Height = 17
              Caption = 'What items still on site? (255 characters)'
            end
            object Label12: TLabel
              Left = 10
              Top = 212
              Width = 299
              Height = 17
              Caption = 'Site requirements before returning (255 characters)'
            end
            object Label14: TLabel
              Left = 10
              Top = 317
              Width = 210
              Height = 17
              Caption = 'Factory/Manufacturing Notes/Issues'
            end
            object Label1: TLabel
              Left = 11
              Top = 3
              Width = 313
              Height = 17
              Caption = 'Requirements to make good (include dimensions):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
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
          object pnlLeft: TPanel
            Left = 0
            Top = 0
            Width = 448
            Height = 416
            Align = alLeft
            ParentBackground = False
            TabOrder = 1
            ExplicitHeight = 420
            object Label8: TLabel
              Left = 8
              Top = 107
              Width = 304
              Height = 17
              Caption = 'What items needs returning to site? (255 characters)'
            end
            object Label11: TLabel
              Left = 9
              Top = 211
              Width = 225
              Height = 17
              Caption = 'Tools required on site (255 characters)'
            end
            object Label13: TLabel
              Left = 8
              Top = 316
              Width = 333
              Height = 17
              Caption = 'Additional Notes (Additional labour/Silicone colour used)'
            end
            object Label2: TLabel
              Left = 8
              Top = 3
              Width = 96
              Height = 17
              Caption = 'Remedial Issue:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
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
        end
        object tsSlabs: TTabSheet
          Caption = 'Slab Details'
          ImageIndex = 1
          object Panel25: TPanel
            Left = 0
            Top = 388
            Width = 889
            Height = 28
            Align = alBottom
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object lblSlabTotalArea: TLabel
              Left = 288
              Top = 7
              Width = 100
              Height = 17
              Caption = 'Total Sales Value:'
            end
            object lblSlabTotalCost: TLabel
              Left = 8
              Top = 7
              Width = 100
              Height = 17
              Caption = 'Total Cost Value: '
            end
            object lblSlabWasteCost: TLabel
              Left = 617
              Top = 7
              Width = 109
              Height = 17
              Alignment = taRightJustify
              Caption = 'Total Waste Value: '
            end
          end
          object Panel24: TPanel
            Left = 803
            Top = 0
            Width = 86
            Height = 335
            Align = alRight
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            object btnAddSlabs: TBitBtn
              Left = 6
              Top = 9
              Width = 75
              Height = 25
              Caption = '&Add'
              TabOrder = 0
              OnClick = btnAddSlabsClick
            end
            object btnChangeSlabs: TBitBtn
              Left = 8
              Top = 40
              Width = 75
              Height = 25
              Caption = '&Change'
              Enabled = False
              TabOrder = 1
              OnClick = btnChangeSlabsClick
            end
            object btnDeleteSlabs: TBitBtn
              Left = 8
              Top = 72
              Width = 75
              Height = 25
              Caption = '&Delete'
              Enabled = False
              TabOrder = 2
              OnClick = btnDeleteSlabsClick
            end
          end
          object Panel27: TPanel
            Left = 0
            Top = 335
            Width = 889
            Height = 53
            Align = alBottom
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 2
          end
          object sgSlabs: TStringGrid
            Left = 0
            Top = 0
            Width = 803
            Height = 335
            Align = alClient
            ColCount = 11
            DefaultColWidth = 40
            DefaultRowHeight = 18
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
            TabOrder = 3
            OnDblClick = sgSlabsDblClick
            ColWidths = (
              40
              200
              78
              137
              78
              76
              66
              96
              97
              97
              81)
            RowHeights = (
              18
              18
              18
              18
              18)
          end
        end
      end
    end
  end
  object qryFitter1: TFDQuery
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
  object srcFitter1: TDataSource
    DataSet = qryFitter1
    Left = 352
    Top = 224
  end
  object qryOperator: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Operator'
      'order by Operator_Name')
    Left = 528
    Top = 138
  end
  object srcOperator: TDataSource
    DataSet = qryOperator
    Left = 488
    Top = 160
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
    Left = 316
    Top = 177
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
  object srcFitter2: TDataSource
    DataSet = qryFitter2
    Left = 360
    Top = 280
  end
  object qryFitter2: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT * '
      'FROM Fitter'
      'WHERE (inactive = '#39'N'#39') or (Fitter = :Fitter)'
      'ORDER BY Fitter.Fitter_Name')
    Left = 320
    Top = 304
    ParamData = <
      item
        Name = 'Fitter'
      end>
  end
  object qryFitter3: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT * '
      'FROM Fitter'
      'WHERE (inactive = '#39'N'#39') or (Fitter = :Fitter)'
      'ORDER BY Fitter.Fitter_Name')
    Left = 320
    Top = 360
    ParamData = <
      item
        Name = 'Fitter'
      end>
  end
  object srcFitter3: TDataSource
    DataSet = qryFitter3
    Left = 368
    Top = 336
  end
end
