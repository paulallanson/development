object PBMaintEnquiryFrm: TPBMaintEnquiryFrm
  Left = 216
  Top = 119
  Caption = 'Maintain Enquiry'
  ClientHeight = 544
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlEnqHeader: TPanel
    Left = 0
    Top = 0
    Width = 745
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 753
    DesignSize = (
      745
      41)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 63
      Height = 15
      Caption = 'Enquiry No.'
    end
    object Label2: TLabel
      Left = 160
      Top = 12
      Width = 26
      Height = 15
      Caption = 'Date'
    end
    object lblEnqNo: TLabel
      Left = 72
      Top = 12
      Width = 74
      Height = 15
      Caption = '<Enquiry No>'
    end
    object spdbtnDatePoint: TSpeedButton
      Left = 288
      Top = 8
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = spdbtnDatePointClick
    end
    object Label4: TLabel
      Left = 320
      Top = 12
      Width = 80
      Height = 15
      Caption = 'Date Required'
    end
    object spdbtnDateReq: TSpeedButton
      Left = 504
      Top = 8
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = spdbtnDateReqClick
    end
    object Label5: TLabel
      Left = 544
      Top = 12
      Width = 76
      Height = 15
      Caption = 'Office Contact'
    end
    object edtdatePoint: TEdit
      Left = 192
      Top = 8
      Width = 89
      Height = 23
      TabOrder = 0
      Text = 'edtdatePoint'
    end
    object edtDateRequired: TEdit
      Left = 408
      Top = 8
      Width = 89
      Height = 23
      TabOrder = 1
      Text = 'edtDateRequired'
      OnChange = edtDateRequiredChange
    end
    object cmbbxOperators: TComboBox
      Left = 632
      Top = 8
      Width = 114
      Height = 23
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnChange = cmbbxOperatorsChange
    end
  end
  object pnlCustDetails: TPanel
    Left = 0
    Top = 41
    Width = 745
    Height = 64
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 753
    object Label6: TLabel
      Left = 8
      Top = 12
      Width = 55
      Height = 15
      Caption = 'Customer'
    end
    object Label7: TLabel
      Left = 8
      Top = 36
      Width = 42
      Height = 15
      Caption = 'Contact'
    end
    object spdbtnLUCust: TSpeedButton
      Left = 296
      Top = 8
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = spdbtnLUCustClick
    end
    object spdbtnLUCustContact: TSpeedButton
      Left = 296
      Top = 32
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = spdbtnLUCustContactClick
    end
    object Label8: TLabel
      Left = 344
      Top = 12
      Width = 23
      Height = 15
      Caption = 'Rep'
    end
    object spdbtnLURep: TSpeedButton
      Left = 600
      Top = 8
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = spdbtnLURepClick
    end
    object edtCustomer: TEdit
      Left = 72
      Top = 8
      Width = 217
      Height = 23
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Text = 'edtCustomer'
    end
    object cmbbxContactList: TComboBox
      Left = 72
      Top = 32
      Width = 217
      Height = 23
      Style = csDropDownList
      TabOrder = 1
      OnChange = cmbbxContactListChange
    end
    object cmbbxRepList: TComboBox
      Left = 376
      Top = 8
      Width = 217
      Height = 23
      Style = csDropDownList
      TabOrder = 2
      OnChange = cmbbxRepListChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 524
    Width = 745
    Height = 20
    Panels = <>
    ExplicitTop = 536
    ExplicitWidth = 753
  end
  object pnlOkCancelBtns: TPanel
    Left = 0
    Top = 483
    Width = 745
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 495
    ExplicitWidth = 753
    DesignSize = (
      745
      41)
    object btbtnOK: TBitBtn
      Left = 567
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
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
      OnClick = btbtnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 663
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 105
    Width = 745
    Height = 378
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 4
    ExplicitWidth = 753
    ExplicitHeight = 390
    object TabSheet1: TTabSheet
      Caption = 'General'
      object Label9: TLabel
        Left = 8
        Top = 12
        Width = 63
        Height = 15
        Caption = 'Description'
      end
      object Label10: TLabel
        Left = 8
        Top = 44
        Width = 70
        Height = 15
        Caption = 'Product Type'
      end
      object spdbtnLUProdType: TSpeedButton
        Left = 296
        Top = 40
        Width = 23
        Height = 22
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = spdbtnLUProdTypeClick
      end
      object Label12: TLabel
        Left = 8
        Top = 72
        Width = 70
        Height = 15
        Caption = 'Specification'
      end
      object edtDescription: TEdit
        Left = 86
        Top = 8
        Width = 523
        Height = 23
        TabOrder = 0
        Text = 'edtDescription'
        OnChange = edtDescriptionChange
      end
      object edtProdType: TEdit
        Left = 86
        Top = 40
        Width = 203
        Height = 23
        ReadOnly = True
        TabOrder = 1
        Text = 'edtProdType'
      end
      object mmLineNarrative: TMemo
        Left = 86
        Top = 72
        Width = 521
        Height = 201
        Lines.Strings = (
          'Memo1')
        TabOrder = 2
        OnExit = mmLineNarrativeExit
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Specification'
      ImageIndex = 1
      object pnlPartsGrid: TPanel
        Left = 0
        Top = 185
        Width = 745
        Height = 175
        Align = alClient
        Caption = 'pnlPartsGrid'
        TabOrder = 1
        object strgrdParts: TStringGrid
          Left = 1
          Top = 1
          Width = 743
          Height = 173
          Align = alClient
          ColCount = 12
          DefaultRowHeight = 22
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          PopupMenu = pumPartDetails
          TabOrder = 0
          OnClick = strgrdPartsClick
          OnDrawCell = strgrdPartsDrawCell
          OnExit = strgrdPartsExit
          OnKeyDown = strgrdPartsKeyDown
          OnKeyPress = strgrdPartsKeyPress
          ColWidths = (
            64
            107
            86
            64
            64
            64
            64
            64
            64
            64
            64
            64)
        end
        object ColourComboBox: TComboBox
          Tag = 105
          Left = 127
          Top = 37
          Width = 138
          Height = 23
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
          Left = 207
          Top = 61
          Width = 122
          Height = 23
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
          Left = 271
          Top = 85
          Width = 122
          Height = 23
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
          Left = 335
          Top = 109
          Width = 122
          Height = 23
          Hint = 'Paper_Material'
          MaxLength = 40
          TabOrder = 4
          Visible = False
          OnClick = MaterialComboBoxClick
          OnEnter = ColourComboBoxEnter
          OnExit = MaterialComboBoxExit
          OnKeyPress = ColourComboBoxKeyPress
        end
      end
      object pnlSpecTop: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 185
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 745
        DesignSize = (
          737
          185)
        object Label48: TLabel
          Left = 8
          Top = 15
          Width = 33
          Height = 15
          Caption = 'Depth'
        end
        object Label50: TLabel
          Left = 8
          Top = 43
          Width = 31
          Height = 15
          Caption = 'Width'
        end
        object Label11: TLabel
          Left = 8
          Top = 73
          Width = 40
          Height = 15
          Caption = 'Artwork'
        end
        object Label16: TLabel
          Left = 0
          Top = 168
          Width = 62
          Height = 15
          Caption = 'Part details'
        end
        object Label32: TLabel
          Left = 392
          Top = 15
          Width = 54
          Height = 15
          Caption = 'Form Ref.'
        end
        object PlateChangeLbl: TLabel
          Left = 376
          Top = 73
          Width = 70
          Height = 15
          Alignment = taRightJustify
          Caption = 'No. of Plates'
        end
        object edtDepth: TEdit
          Tag = 3
          Left = 62
          Top = 11
          Width = 65
          Height = 23
          TabOrder = 0
          OnChange = edtDepthChange
          OnKeyPress = edtDepthKeyPress
        end
        object edtDepthUnit: TEdit
          Tag = 5
          Left = 142
          Top = 11
          Width = 49
          Height = 23
          TabStop = False
          ReadOnly = True
          TabOrder = 1
          Text = 'mm'
        end
        object UpDown1: TUpDown
          Left = 174
          Top = 11
          Width = 16
          Height = 23
          TabOrder = 2
          TabStop = True
          OnChanging = UpDown1Changing
        end
        object defaultSizeBtn: TButton
          Left = 198
          Top = 11
          Width = 23
          Height = 23
          Hint = 'Select default size'
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = defaultSizeBtnClick
        end
        object UpDown2: TUpDown
          Left = 174
          Top = 39
          Width = 16
          Height = 23
          TabOrder = 4
          TabStop = True
          OnChanging = UpDown2Changing
        end
        object edtWidthUnit: TEdit
          Tag = 6
          Left = 142
          Top = 39
          Width = 49
          Height = 23
          TabStop = False
          ReadOnly = True
          TabOrder = 5
          Text = 'mm'
        end
        object edtWidth: TEdit
          Tag = 4
          Left = 62
          Top = 39
          Width = 65
          Height = 23
          TabOrder = 6
          OnChange = edtWidthChange
          OnKeyPress = edtWidthKeyPress
        end
        object edtArt: TMemo
          Left = 62
          Top = 69
          Width = 259
          Height = 89
          MaxLength = 80
          TabOrder = 7
        end
        object ArtworkBtn: TButton
          Left = 331
          Top = 69
          Width = 23
          Height = 23
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnClick = ArtworkBtnClick
        end
        object edtFormRef: TEdit
          Left = 451
          Top = 11
          Width = 216
          Height = 23
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          ReadOnly = True
          TabOrder = 9
          ExplicitWidth = 224
        end
        object FormRefButton: TButton
          Left = 674
          Top = 11
          Width = 24
          Height = 23
          Anchors = [akTop, akRight]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = FormRefButtonClick
          ExplicitLeft = 682
        end
        object FormRefClrBitBtn: TBitBtn
          Left = 705
          Top = 11
          Width = 24
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
          TabOrder = 11
          OnClick = FormRefClrBitBtnClick
          ExplicitLeft = 713
        end
        object edtFormDesc: TEdit
          Left = 451
          Top = 39
          Width = 278
          Height = 23
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 12
          ExplicitWidth = 286
        end
        object PlateChangeSpin: TSpinEdit
          Tag = 108
          Left = 451
          Top = 68
          Width = 41
          Height = 24
          MaxValue = 10
          MinValue = 0
          TabOrder = 13
          Value = 0
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Template'
      ImageIndex = 2
      object pnlQuestions1: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 360
        Align = alClient
        TabOrder = 0
        object pnlQuestionsHeader: TPanel
          Left = 1
          Top = 1
          Width = 743
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lblQuestions: TLabel
            Left = 8
            Top = 4
            Width = 57
            Height = 15
            Caption = 'Questions'
          end
        end
        object sbQuestions: TScrollBox
          Left = 1
          Top = 25
          Width = 743
          Height = 334
          Align = alClient
          TabOrder = 1
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Prices'
      ImageIndex = 3
      object pnlPricesLower: TPanel
        Left = 0
        Top = 190
        Width = 737
        Height = 158
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = 202
        ExplicitWidth = 745
        object pnlPriceOptions: TPanel
          Left = 583
          Top = 0
          Width = 154
          Height = 158
          Align = alRight
          TabOrder = 0
          ExplicitLeft = 591
          object btnSelBestPrices: TButton
            Left = 8
            Top = 8
            Width = 137
            Height = 25
            Caption = 'Select Best Prices'
            TabOrder = 0
          end
          object chkbxMarkUpAll: TCheckBox
            Left = 8
            Top = 48
            Width = 137
            Height = 17
            Caption = 'Apply Mark-Up to All'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object pnlPricesGrid: TPanel
          Left = 0
          Top = 0
          Width = 583
          Height = 158
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitWidth = 591
          object pnlSelectedPrices: TPanel
            Left = 0
            Top = 0
            Width = 464
            Height = 158
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 472
            object pnlSelectedPricesTitle: TPanel
              Left = 1
              Top = 1
              Width = 462
              Height = 24
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = '   Selected Prices'
              TabOrder = 0
              ExplicitWidth = 470
            end
            object strgrdQuotePrices: TStringGrid
              Left = 1
              Top = 25
              Width = 462
              Height = 132
              Align = alClient
              DefaultColWidth = 150
              DefaultRowHeight = 22
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor]
              TabOrder = 1
              OnExit = strgrdQuotePricesExit
              OnKeyPress = strgrdQuotePricesKeyPress
              OnKeyUp = strgrdQuotePricesKeyUp
              OnSelectCell = strgrdQuotePricesSelectCell
              OnTopLeftChanged = strgrdQuotePricesTopLeftChanged
              ExplicitWidth = 470
              ColWidths = (
                150
                57
                52
                50
                57)
              RowHeights = (
                22
                22
                22
                22
                22)
            end
            object cmbbxPriceUnit: TDBLookupComboBox
              Left = 376
              Top = 120
              Width = 97
              Height = 23
              KeyField = 'Price_Unit'
              ListField = 'Description'
              ListSource = PBEnqDM.PriceUnitSRC
              TabOrder = 2
              Visible = False
              OnCloseUp = cmbbxPriceUnitCloseUp
            end
          end
          object pnlSelectedRunon: TPanel
            Left = 464
            Top = 0
            Width = 119
            Height = 158
            Align = alRight
            TabOrder = 1
            ExplicitLeft = 472
            object pnlSelectedRunonTitle: TPanel
              Left = 1
              Top = 1
              Width = 117
              Height = 24
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = '   Run-On'
              TabOrder = 0
            end
            object strgrdQuoteRunOn: TStringGrid
              Left = 1
              Top = 25
              Width = 117
              Height = 132
              Align = alClient
              ColCount = 1
              DefaultColWidth = 74
              DefaultRowHeight = 22
              FixedCols = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor]
              ScrollBars = ssVertical
              TabOrder = 1
              OnExit = strgrdQuoteRunOnExit
              OnKeyPress = strgrdQuoteRunOnKeyPress
              OnKeyUp = strgrdQuoteRunOnKeyUp
              OnSelectCell = strgrdQuoteRunOnSelectCell
            end
          end
        end
      end
      object pnlPricesUpper: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 190
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlPricesUpper'
        TabOrder = 1
        ExplicitWidth = 745
        ExplicitHeight = 202
        object pnlSupplierPricesGrid: TPanel
          Left = 0
          Top = 0
          Width = 591
          Height = 202
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pnlRunOn: TPanel
            Left = 472
            Top = 0
            Width = 119
            Height = 202
            Align = alRight
            TabOrder = 0
            object pnlRunOnTitle: TPanel
              Left = 1
              Top = 1
              Width = 117
              Height = 24
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = '   Run-On'
              TabOrder = 0
            end
            object strgrdRunOns: TStringGrid
              Left = 1
              Top = 25
              Width = 117
              Height = 176
              Align = alClient
              ColCount = 1
              DefaultColWidth = 74
              DefaultRowHeight = 22
              FixedCols = 0
              RowCount = 6
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              PopupMenu = pumRunOn
              ScrollBars = ssVertical
              TabOrder = 1
              OnKeyPress = strgrdRunOnsKeyPress
              OnKeyUp = strgrdRunOnsKeyUp
              ColWidths = (
                75)
            end
          end
          object pnlSupplierPrices: TPanel
            Left = 0
            Top = 0
            Width = 472
            Height = 202
            Align = alClient
            TabOrder = 1
            object pnlCostTitle: TPanel
              Left = 1
              Top = 1
              Width = 470
              Height = 24
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = '   Supplier'#39's Prices'
              TabOrder = 0
              object btbtnAddQuantity: TBitBtn
                Left = 448
                Top = -1
                Width = 23
                Height = 25
                Hint = 'Insert a new quantity.'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333333FF33333333FF333993333333300033377F3333333777333993333333
                  300033F77FFF3333377739999993333333333777777F3333333F399999933333
                  33003777777333333377333993333333330033377F3333333377333993333333
                  3333333773333333333F333333333333330033333333F33333773333333C3333
                  330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
                  993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
                  333333333337733333FF3333333C333330003333333733333777333333333333
                  3000333333333333377733333333333333333333333333333333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = btbtnAddQuantityClick
              end
            end
            object strgrdSupplierPrices: TStringGrid
              Left = 1
              Top = 25
              Width = 470
              Height = 176
              Align = alClient
              DefaultColWidth = 150
              DefaultRowHeight = 22
              RowCount = 6
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              PopupMenu = pumSuppCostGrid
              TabOrder = 1
              OnDblClick = strgrdSupplierPricesDblClick
              OnDrawCell = strgrdSupplierPricesDrawCell
              OnKeyPress = strgrdSupplierPricesKeyPress
              OnSetEditText = strgrdSupplierPricesSetEditText
              OnTopLeftChanged = strgrdSupplierPricesTopLeftChanged
              ColWidths = (
                150
                57
                52
                50
                57)
              RowHeights = (
                22
                22
                22
                22
                22
                22)
            end
          end
        end
        object pnlCapabilities: TPanel
          Left = 591
          Top = 0
          Width = 154
          Height = 202
          Align = alRight
          TabOrder = 1
          DesignSize = (
            154
            190)
          object pnlCapabilityTitle: TPanel
            Left = 1
            Top = 1
            Width = 152
            Height = 24
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = '   Capabilities'
            TabOrder = 0
          end
          object pnlCapabilitiesFooter: TPanel
            Left = 1
            Top = 148
            Width = 152
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitTop = 160
            object btbtnSelectSuppliers: TBitBtn
              Left = 22
              Top = 8
              Width = 113
              Height = 25
              Caption = 'Select Suppliers'
              TabOrder = 0
              OnClick = AddSupplier1Click
            end
          end
          object chklstbxCapabilities: TCheckListBox
            Left = 8
            Top = 24
            Width = 137
            Height = 125
            Anchors = [akLeft, akTop, akRight, akBottom]
            ItemHeight = 15
            TabOrder = 2
            OnClickCheck = chklstbxCapabilitiesClickCheck
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Notes'
      ImageIndex = 4
      object pnlAddDtlsMain: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 319
        Align = alClient
        TabOrder = 0
        object pnlAddDtlsCustomer: TPanel
          Left = 1
          Top = 1
          Width = 255
          Height = 317
          Align = alLeft
          TabOrder = 0
          object pnlCustNoteHeader: TPanel
            Left = 1
            Top = 1
            Width = 253
            Height = 32
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label3: TLabel
              Left = 8
              Top = 8
              Width = 100
              Height = 15
              Caption = 'Customer'#39's Notes'
            end
          end
          object sbCustNotes: TScrollBox
            Left = 1
            Top = 33
            Width = 253
            Height = 283
            Align = alClient
            TabOrder = 1
          end
        end
        object pnlAddDtlsSupp: TPanel
          Left = 489
          Top = 1
          Width = 255
          Height = 317
          Align = alRight
          TabOrder = 1
          object pnlSuppNotesHeader: TPanel
            Left = 1
            Top = 1
            Width = 253
            Height = 32
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label18: TLabel
              Left = 8
              Top = 8
              Width = 91
              Height = 15
              Caption = 'Suppliers'#39' Notes'
            end
          end
          object sbSuppNotes: TScrollBox
            Left = 1
            Top = 33
            Width = 253
            Height = 283
            Align = alClient
            TabOrder = 1
          end
        end
        object pnlAddDtlsBoth: TPanel
          Left = 256
          Top = 1
          Width = 233
          Height = 317
          Align = alClient
          TabOrder = 2
          object pnlBothNotesHeader: TPanel
            Left = 1
            Top = 1
            Width = 231
            Height = 32
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label17: TLabel
              Left = 5
              Top = 8
              Width = 188
              Height = 15
              Caption = 'Notes for Customer and Suppliers'
            end
          end
          object sbBothNotes: TScrollBox
            Left = 1
            Top = 33
            Width = 231
            Height = 283
            Align = alClient
            TabOrder = 1
          end
        end
      end
      object pnlAddDtlsFooter: TPanel
        Left = 0
        Top = 319
        Width = 745
        Height = 41
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          737
          41)
        object btnAddSuppCustNotes: TBitBtn
          Left = 654
          Top = 7
          Width = 70
          Height = 25
          Anchors = [akTop, akRight]
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
          ExplicitLeft = 662
        end
      end
    end
  end
  object pumPartDetails: TPopupMenu
    Left = 88
    Top = 431
    object Add1: TMenuItem
      Caption = 'Add'
      OnClick = Add1Click
    end
    object Copy1: TMenuItem
      Caption = 'Copy'
      OnClick = Copy1Click
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MarginDefaults1: TMenuItem
      Caption = 'Set Margin Defaults'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MaintainPapers1: TMenuItem
      Caption = 'Maintain Papers'
    end
  end
  object pumSuppCostGrid: TPopupMenu
    Left = 52
    Top = 431
    object AddQuantity1: TMenuItem
      Caption = 'Set Quantities'
      OnClick = AddQuantity1Click
    end
    object DeleteQuantity1: TMenuItem
      Caption = 'Delete Quantity'
      OnClick = DeleteQuantity1Click
    end
    object AddSupplier1: TMenuItem
      Caption = 'Select Suppliers'
      OnClick = AddSupplier1Click
    end
    object EnterSupplierPrices1: TMenuItem
      Caption = 'Enter Supplier Prices'
      OnClick = EnterSupplierPrices1Click
    end
  end
  object pumRunOn: TPopupMenu
    Left = 12
    Top = 431
    object SetRunOnQuantity1: TMenuItem
      Caption = 'Set Run-On Quantity'
      OnClick = SetRunOnQuantity1Click
    end
  end
end
