object PBMaintQuoteFrm: TPBMaintQuoteFrm
  Left = 186
  Top = 18
  Caption = 'Maintain Quotes'
  ClientHeight = 680
  ClientWidth = 1115
  Color = clBtnFace
  Constraints.MinHeight = 618
  Constraints.MinWidth = 1070
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 661
    Width = 1115
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
  end
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 1115
    Height = 661
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pgDetails: TPageControl
      Left = 0
      Top = 233
      Width = 1115
      Height = 244
      ActivePage = tsCharges
      Align = alClient
      TabOrder = 0
      object tsCharges: TTabSheet
        Caption = 'Charges'
        object pnlActions: TPanel
          Left = 1022
          Top = 0
          Width = 85
          Height = 180
          Align = alRight
          ParentBackground = False
          TabOrder = 0
          object btnAddCharge: TBitBtn
            Left = 4
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Add a new Works Instruction to this Job Bag'
            Caption = '&Add'
            TabOrder = 0
            OnClick = btnAddChargeClick
          end
          object btnChgCharge: TBitBtn
            Left = 4
            Top = 40
            Width = 75
            Height = 25
            Hint = 'Change the selected Works Instruction'
            Caption = '&Change'
            Enabled = False
            TabOrder = 1
            OnClick = btnChgChargeClick
          end
          object btnDelCharge: TBitBtn
            Left = 4
            Top = 72
            Width = 75
            Height = 25
            Hint = 'Delete the selected Works Instruction from this Job Bag'
            Caption = '&Delete'
            Enabled = False
            TabOrder = 2
            OnClick = btnDelChargeClick
          end
          object btnExcelCharge: TBitBtn
            Left = 4
            Top = 104
            Width = 75
            Height = 25
            Hint = 'Delete the selected Works Instruction from this Job Bag'
            Caption = '&Excel'
            Enabled = False
            TabOrder = 3
            OnClick = btnExcelChargeClick
          end
        end
        object pnlChargesControls: TPanel
          Left = 0
          Top = 180
          Width = 1107
          Height = 36
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            1107
            36)
          object Label12: TLabel
            Left = 8
            Top = 13
            Width = 62
            Height = 13
            Caption = 'Estimate file'
          end
          object edtEstimateFile: TEdit
            Left = 80
            Top = 9
            Width = 729
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clBtnFace
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnChange = edtEstimateFileChange
          end
          object btnOpen: TButton
            Left = 896
            Top = 7
            Width = 75
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Estimate'
            TabOrder = 1
            OnClick = btnOpenClick
          end
          object btnImport: TButton
            Left = 977
            Top = 7
            Width = 75
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Calculate'
            TabOrder = 2
            OnClick = btnImportClick
          end
          object btnBrowse: TButton
            Left = 817
            Top = 7
            Width = 75
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Browse'
            TabOrder = 3
            OnClick = btnBrowseClick
          end
        end
        object sgLines: TStringGrid
          Left = 0
          Top = 0
          Width = 1022
          Height = 180
          Align = alClient
          ColCount = 9
          DefaultColWidth = 40
          DefaultRowHeight = 18
          DrawingStyle = gdsGradient
          RowCount = 4
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowMoving, goRowSelect]
          TabOrder = 2
          OnDblClick = sgLinesDblClick
          OnDrawCell = sgLinesDrawCell
          OnMouseDown = sgLinesMouseDown
          OnMouseUp = sgLinesMouseUp
          OnRowMoved = sgLinesRowMoved
          ColWidths = (
            40
            137
            267
            62
            78
            78
            83
            75
            84)
        end
      end
      object tsSupply: TTabSheet
        Caption = 'Supply'
        ImageIndex = 6
        object sgSupply: TStringGrid
          Left = 0
          Top = 0
          Width = 1022
          Height = 216
          Align = alClient
          ColCount = 7
          DefaultColWidth = 40
          DefaultRowHeight = 18
          DrawingStyle = gdsGradient
          RowCount = 4
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          TabOrder = 0
          OnDblClick = sgSupplyDblClick
          OnDrawCell = sgSupplyDrawCell
          ColWidths = (
            40
            239
            75
            76
            75
            73
            70)
        end
        object Panel18: TPanel
          Left = 1022
          Top = 0
          Width = 85
          Height = 216
          Align = alRight
          ParentBackground = False
          TabOrder = 1
          object btnDeleteSupply: TBitBtn
            Left = 8
            Top = 104
            Width = 75
            Height = 25
            Hint = 'Delete the selected Works Instruction from this Job Bag'
            Caption = '&Delete'
            Enabled = False
            TabOrder = 0
            OnClick = btnDeleteSupplyClick
          end
          object btnInsertSupply: TBitBtn
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            Caption = '&Insert'
            TabOrder = 1
            OnClick = btnInsertSupplyClick
          end
          object btnAddSupply: TBitBtn
            Left = 8
            Top = 40
            Width = 75
            Height = 25
            Hint = 'Add a new Works Instruction to this Job Bag'
            Caption = '&Add'
            TabOrder = 2
            OnClick = btnAddSupplyClick
          end
          object btnChangeSupply: TBitBtn
            Left = 8
            Top = 72
            Width = 75
            Height = 25
            Hint = 'Change the selected Works Instruction'
            Caption = '&Change'
            Enabled = False
            TabOrder = 3
            OnClick = btnChangeSupplyClick
          end
        end
      end
      object tsIntNotes: TTabSheet
        Caption = 'Documents'
        ImageIndex = 2
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 1107
          Height = 216
          Align = alClient
          Caption = 'Panel6'
          ParentBackground = False
          TabOrder = 0
          object Panel7: TPanel
            Left = 1
            Top = 191
            Width = 1105
            Height = 24
            Align = alBottom
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object lblDocumentDir: TLabel
              Left = 8
              Top = 6
              Width = 150
              Height = 13
              Caption = 'Primary Document Directory:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object lstvwDocuments: TListView
            Left = 1
            Top = 1
            Width = 1069
            Height = 190
            Align = alClient
            Columns = <
              item
                Caption = 'Name'
                Width = 200
              end
              item
                Caption = 'Type'
                Width = 200
              end
              item
                Caption = 'Date modified'
                Width = 200
              end>
            LargeImages = imgDocuments
            MultiSelect = True
            RowSelect = True
            PopupMenu = pmnuDocuments
            SmallImages = imgDocuments
            TabOrder = 1
            OnColumnClick = lstvwDocumentsColumnClick
            OnCompare = lstvwDocumentsCompare
            OnDblClick = lstvwDocumentsDblClick
          end
          object ToolBar1: TToolBar
            Left = 1070
            Top = 1
            Width = 36
            Height = 190
            Align = alRight
            ButtonHeight = 30
            ButtonWidth = 30
            Caption = 'ToolBar1'
            EdgeBorders = [ebLeft, ebTop, ebRight]
            HotImages = imgIcons
            Images = imgIcons
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            object btnExcel: TToolButton
              Left = 0
              Top = 0
              Hint = 'Excel'
              Caption = 'btnExcel'
              ImageIndex = 0
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = btnExcelClick
            end
            object btnWord: TToolButton
              Left = 0
              Top = 30
              Hint = 'Word'
              Caption = 'btnWord'
              ImageIndex = 1
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = btnExcelClick
            end
            object btnEmail: TToolButton
              Left = 0
              Top = 60
              Hint = 'Email'
              Caption = 'btnEmail'
              ImageIndex = 2
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = btnEmailClick
            end
            object btnAttach: TToolButton
              Left = 0
              Top = 90
              Hint = 'Attach Documents'
              Caption = 'btnAttach'
              ImageIndex = 3
              ParentShowHint = False
              ShowHint = True
              OnClick = btnAttachClick
            end
          end
        end
      end
      object tsGeneralSpec: TTabSheet
        Caption = 'Specification'
        ImageIndex = 3
        object Panel8: TPanel
          Left = 1022
          Top = 0
          Width = 85
          Height = 216
          Align = alRight
          ParentBackground = False
          TabOrder = 0
          object btnPrintSpec: TBitBtn
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Add a new Works Instruction to this Job Bag'
            Caption = '&Print'
            TabOrder = 0
            Visible = False
          end
        end
        object memSpec: TMemo
          Left = 0
          Top = 0
          Width = 1022
          Height = 216
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 1
          OnChange = memSpecChange
        end
      end
      object tsSpecification: TTabSheet
        Caption = 'Specification'
        ImageIndex = 4
        object Panel15: TPanel
          Left = 1022
          Top = 0
          Width = 85
          Height = 216
          Align = alRight
          ParentBackground = False
          TabOrder = 0
          object BitBtn3: TBitBtn
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Add a new Works Instruction to this Job Bag'
            Caption = '&Print'
            TabOrder = 0
            Visible = False
          end
        end
        object pnlSpecs: TPanel
          Left = 0
          Top = 0
          Width = 1022
          Height = 216
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
        end
      end
    end
    object pnlFooter: TPanel
      Left = 0
      Top = 477
      Width = 1115
      Height = 145
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object Label10: TLabel
        Left = 112
        Top = 18
        Width = 96
        Height = 13
        Caption = 'Conversion Rate %'
      end
      object spnConversionRate: TSpinEdit
        Left = 208
        Top = 13
        Width = 57
        Height = 22
        MaxValue = 100
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnChange = spnConversionRateChange
      end
      object btnNotes: TBitBtn
        Left = 11
        Top = 13
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
        OnClick = btnNotesClick
      end
      object pnlOurTotals: TPanel
        Left = 876
        Top = 0
        Width = 239
        Height = 145
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          239
          145)
        object labCosts: TLabel
          Left = 66
          Top = 36
          Width = 56
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Total Costs'
        end
        object labSales: TLabel
          Left = 66
          Top = 54
          Width = 54
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Total Sales'
        end
        object labMargin: TLabel
          Left = 57
          Top = 72
          Width = 68
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Margin Value'
        end
        object LabMarginPerc: TLabel
          Left = 76
          Top = 88
          Width = 49
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Margin %'
        end
        object labTotalCost: TLabel
          Left = 154
          Top = 36
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object labTotalSell: TLabel
          Left = 154
          Top = 54
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object LabTotalMargin: TLabel
          Left = 154
          Top = 72
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object labTotalMarginPerc: TLabel
          Left = 154
          Top = 88
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object lblCompany: TLabel
          Left = 73
          Top = 8
          Width = 126
          Height = 17
          Alignment = taCenter
          Anchors = [akTop, akRight]
          Caption = 'Our Company Totals'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnlPackPrice: TPanel
          Left = 0
          Top = 115
          Width = 239
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            239
            30)
          object Label7: TLabel
            Left = 1
            Top = 6
            Width = 27
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Price:'
          end
          object labUnitSell: TLabel
            Left = 34
            Top = 6
            Width = 69
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'TotalsGoHere'
          end
          object dblkpPriceUnit: TDBLookupComboBox
            Left = 107
            Top = 2
            Width = 90
            Height = 21
            Anchors = [akRight, akBottom]
            KeyField = 'Price_Unit'
            ListField = 'Description'
            TabOrder = 0
            OnClick = dblkpPriceUnitClick
          end
          object bitbtnPriceUnitClear: TBitBtn
            Left = 202
            Top = 1
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
            OnClick = bitbtnPriceUnitClearClick
          end
        end
      end
      object Panel5: TPanel
        Left = 855
        Top = 0
        Width = 21
        Height = 145
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
      end
      object pnlReseller: TPanel
        Left = 647
        Top = 0
        Width = 208
        Height = 145
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 3
        DesignSize = (
          208
          145)
        object Label15: TLabel
          Left = 21
          Top = 37
          Width = 56
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Total Costs'
        end
        object Label16: TLabel
          Left = 21
          Top = 55
          Width = 54
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Total Sales'
        end
        object Label17: TLabel
          Left = 12
          Top = 73
          Width = 68
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Margin Value'
        end
        object Label18: TLabel
          Left = 31
          Top = 89
          Width = 49
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Margin %'
        end
        object reselTotalCost: TLabel
          Left = 125
          Top = 37
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object reselTotalSell: TLabel
          Left = 125
          Top = 55
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object reselTotalMargin: TLabel
          Left = 125
          Top = 73
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object reselTotalMarginPerc: TLabel
          Left = 125
          Top = 89
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object Label23: TLabel
          Left = 46
          Top = 8
          Width = 89
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Reseller Totals'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlRep: TPanel
        Left = 418
        Top = 0
        Width = 229
        Height = 145
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 5
        Visible = False
        DesignSize = (
          229
          145)
        object Label60: TLabel
          Left = 2
          Top = 37
          Width = 100
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Total Costs (Incl Int)'
        end
        object Label61: TLabel
          Left = 42
          Top = 55
          Width = 54
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Total Sales'
        end
        object Label62: TLabel
          Left = 33
          Top = 73
          Width = 68
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Margin Value'
        end
        object Label63: TLabel
          Left = 52
          Top = 89
          Width = 49
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Margin %'
        end
        object repTotalCost: TLabel
          Left = 146
          Top = 37
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object RepTotalSell: TLabel
          Left = 146
          Top = 55
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object RepTotalMargin: TLabel
          Left = 146
          Top = 73
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object repTotalMarginPerc: TLabel
          Left = 146
          Top = 89
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object Label68: TLabel
          Left = 83
          Top = 8
          Width = 64
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Rep Totals'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlPackFormat: TPanel
        Left = 0
        Top = -2
        Width = 377
        Height = 109
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 6
        object Label59: TLabel
          Left = 16
          Top = 8
          Width = 62
          Height = 13
          Caption = 'Pack Format'
        end
        object dblkpPackFormat: TDBLookupComboBox
          Left = 16
          Top = 25
          Width = 170
          Height = 21
          KeyField = 'ID'
          ListField = 'Pack_Format_Description'
          TabOrder = 0
          OnClick = dblkpPackFormatClick
        end
        object btnPackFormat: TBitBtn
          Left = 192
          Top = 23
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
          OnClick = btnPackFormatClick
        end
        object rdgrpEnclosingType: TRadioGroup
          Left = 232
          Top = 8
          Width = 129
          Height = 97
          Caption = ' Enclosing '
          ItemIndex = 0
          Items.Strings = (
            'None'
            'Hand'
            'Machine'
            'Poly')
          ParentBackground = False
          TabOrder = 2
          OnClick = rdgrpEnclosingTypeClick
        end
      end
    end
    object pnlHeader: TPanel
      Left = 0
      Top = 41
      Width = 1115
      Height = 192
      Align = alTop
      ParentBackground = False
      TabOrder = 2
      object Panel9: TPanel
        Left = 898
        Top = 1
        Width = 216
        Height = 190
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          216
          190)
        object Label8: TLabel
          Left = 41
          Top = 88
          Width = 44
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Quantity'
        end
        object Label25: TLabel
          Left = -4
          Top = 18
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Production Start'
        end
        object Label3: TLabel
          Left = 31
          Top = 52
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Mail Date'
        end
        object memQuantity: TMemo
          Left = 89
          Top = 84
          Width = 81
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 0
          OnChange = memQuantityChange
          OnEnter = memQuantityEnter
          OnExit = ValidateQty
          OnKeyPress = memQuantityKeyPress
        end
        object BitBtn6: TBitBtn
          Left = 183
          Top = 12
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
          TabOrder = 1
          OnClick = BitBtn6Click
        end
        object edtStartDate: TEdit
          Left = 89
          Top = 14
          Width = 81
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 2
          OnExit = edtStartDateExit
        end
        object edtDateReq: TEdit
          Left = 89
          Top = 48
          Width = 81
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 3
          OnExit = edtDateReqExit
        end
        object BitBtn2: TBitBtn
          Left = 183
          Top = 46
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
          TabOrder = 4
          OnClick = BitBtn2Click
        end
      end
      object Panel10: TPanel
        Left = 1
        Top = 1
        Width = 96
        Height = 190
        Align = alLeft
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object rdgType: TRadioGroup
          Left = 9
          Top = 2
          Width = 78
          Height = 64
          Caption = 'Type'
          ItemIndex = 0
          Items.Strings = (
            'Customer'
            'Prospect')
          ParentBackground = False
          TabOrder = 0
          OnClick = rdgTypeClick
        end
      end
      object Panel11: TPanel
        Left = 97
        Top = 1
        Width = 801
        Height = 190
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 801
          Height = 78
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            801
            78)
          object lblCustomer: TLabel
            Left = 8
            Top = 8
            Width = 49
            Height = 13
            Caption = 'Customer'
          end
          object Label6: TLabel
            Left = 8
            Top = 34
            Width = 40
            Height = 13
            Caption = 'Contact'
          end
          object Label11: TLabel
            Left = 8
            Top = 58
            Width = 27
            Height = 13
            Caption = 'Email'
          end
          object Label13: TLabel
            Left = 555
            Top = 34
            Width = 33
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Phone'
            ExplicitLeft = 575
          end
          object edtContactName: TEdit
            Left = 69
            Top = 30
            Width = 473
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            Visible = False
          end
          object edtCustomer: TEdit
            Left = 69
            Top = 4
            Width = 548
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ReadOnly = True
            TabOrder = 0
          end
          object BitBtn1: TBitBtn
            Left = 624
            Top = 2
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
            OnClick = BitBtn1Click
          end
          object btnContact: TBitBtn
            Left = 517
            Top = 28
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
            TabOrder = 2
            OnClick = btnContactClick
          end
          object dblkpCustomerContact: TDBLookupComboBox
            Left = 69
            Top = 30
            Width = 439
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            KeyField = 'Contact_no'
            ListField = 'Name'
            TabOrder = 3
            OnClick = dblkpCustomerContactClick
          end
          object edtEmail: TEdit
            Left = 69
            Top = 54
            Width = 692
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            OnChange = CheckOK
          end
          object edtPhone: TEdit
            Left = 595
            Top = 30
            Width = 165
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 5
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 78
          Width = 801
          Height = 84
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            801
            84)
          object Label1: TLabel
            Left = 8
            Top = 66
            Width = 59
            Height = 13
            Caption = 'Description'
          end
          object Label9: TLabel
            Left = 8
            Top = 8
            Width = 20
            Height = 13
            Caption = 'Rep'
          end
          object edtDescription: TEdit
            Left = 69
            Top = 62
            Width = 693
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = CheckOK
          end
          object btnReps: TBitBtn
            Left = 517
            Top = 2
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
            OnClick = btnRepsClick
          end
          object edtRep: TEdit
            Left = 69
            Top = 4
            Width = 439
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ReadOnly = True
            TabOrder = 2
          end
          object pnlSubReps: TPanel
            Left = 0
            Top = 29
            Width = 550
            Height = 30
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 3
            DesignSize = (
              550
              30)
            object Label2: TLabel
              Left = 8
              Top = 8
              Width = 43
              Height = 13
              Caption = 'Sub Rep'
            end
            object edtSubRep: TEdit
              Left = 69
              Top = 4
              Width = 439
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              ReadOnly = True
              TabOrder = 0
            end
            object btnSubReps: TBitBtn
              Left = 517
              Top = 2
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
              OnClick = btnSubRepsClick
            end
          end
        end
        object pnlEndUSer: TPanel
          Left = 0
          Top = 162
          Width = 801
          Height = 28
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'pnlEndUSer'
          ParentBackground = False
          TabOrder = 2
          Visible = False
          DesignSize = (
            801
            28)
          object Label14: TLabel
            Left = 8
            Top = 9
            Width = 46
            Height = 13
            Caption = 'End User'
          end
          object edtEndUser: TEdit
            Left = 69
            Top = 5
            Width = 548
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ReadOnly = True
            TabOrder = 0
          end
          object btnEndUser: TBitBtn
            Left = 624
            Top = 4
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
      end
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 1115
      Height = 41
      Align = alTop
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        1115
        41)
      object lblQuoteNo: TLabel
        Left = 9
        Top = 15
        Width = 53
        Height = 13
        Caption = 'Quote No.'
      end
      object Label4: TLabel
        Left = 184
        Top = 15
        Width = 24
        Height = 13
        Caption = 'Date'
      end
      object lblAccountManager: TLabel
        Left = 853
        Top = 15
        Width = 74
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Office Contact'
        ExplicitLeft = 873
      end
      object Label5: TLabel
        Left = 605
        Top = 15
        Width = 97
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Quote Required by'
        ExplicitLeft = 625
      end
      object edtQuote: TEdit
        Left = 80
        Top = 11
        Width = 81
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtDate: TEdit
        Left = 216
        Top = 11
        Width = 81
        Height = 21
        TabOrder = 1
        OnExit = edtDateExit
      end
      object btnDate: TBitBtn
        Left = 304
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
        OnClick = btnDateClick
      end
      object edtOfficeContact: TEdit
        Left = 934
        Top = 11
        Width = 95
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object btnAccountManager: TButton
        Left = 1041
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
        TabOrder = 4
        OnClick = btnAccountManagerClick
      end
      object edtQuoteReqDate: TEdit
        Left = 709
        Top = 11
        Width = 81
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 5
        OnExit = edtQuoteReqDateExit
      end
      object BitBtn9: TBitBtn
        Left = 800
        Top = 9
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
        TabOrder = 6
        OnClick = BitBtn9Click
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 622
      Width = 1115
      Height = 39
      Align = alBottom
      ParentBackground = False
      TabOrder = 4
      object lblGDPRSignedStatement: TLabel
        Left = 491
        Top = 13
        Width = 213
        Height = 17
        Caption = 'GDPR Policy has not been signed!!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblReason: TLabel
        Left = 128
        Top = 17
        Width = 38
        Height = 13
        Caption = 'Reason'
        Visible = False
      end
      object pnlBottom: TPanel
        Left = 738
        Top = 1
        Width = 376
        Height = 37
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          376
          37)
        object lblDeletePrompt: TLabel
          Left = 95
          Top = 13
          Width = 95
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'Delete this Quote?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btnOK: TBitBtn
          Left = 202
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Save'
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
          Left = 290
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Kind = bkCancel
          NumGlyphs = 2
          TabOrder = 1
          OnClick = btnCancelClick
        end
        object btnOKEstimate: TBitBtn
          Left = 115
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Estimate'
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
          TabOrder = 2
          OnClick = btnOKEstimateClick
        end
      end
      object chkbxDeclined: TCheckBox
        Left = 8
        Top = 15
        Width = 114
        Height = 16
        Caption = 'Quote Declined'
        TabOrder = 1
        OnClick = chkbxDeclinedClick
      end
      object dblkpReason: TDBLookupComboBox
        Left = 176
        Top = 13
        Width = 201
        Height = 21
        KeyField = 'Quote_Reason'
        ListField = 'Quote_Reason_Description'
        TabOrder = 2
        Visible = False
      end
      object btnReason: TButton
        Left = 389
        Top = 12
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
        Visible = False
        OnClick = btnReasonClick
      end
    end
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 232
    Top = 320
  end
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 592
    Top = 248
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 401
    Top = 230
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 672
    Top = 393
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from [Estimate$]')
    Left = 744
    Top = 393
  end
  object imgDocuments: TImageList
    Left = 336
    Top = 228
  end
  object imgIcons: TImageList
    Left = 696
    Top = 124
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00F5F5F500F2F2
      F200EEEEEE00EEEEEE00E7E7E700E7E7E700E7E7E700E8E8E800EEEEEE00EEEE
      EE00F5F5F500F9F9F900FDFDFD000000000000000000FDFDFD001C1C1C000312
      0700031206000311060003110500041104000410030004100200040F0200050F
      01000308010090909000000000000000000000000000FDFDFD001C1C1C00120E
      0000110D0100110D0100110D0100110D0200110C0200110C0200110C0300110B
      0300090602009090900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECECEC00DBDBDB00D1D1D100C9CB
      CE00B8B3A800BCBCBD00BEBEC000BDBDBD00BDBDBD00BDBDBD00BDBDBD00C7C7
      C700CBCBCB00D4D4D400E3E3E300FCFCFC0000000000031E0F001DD0630020CC
      5A0023C8510025C3480028BE3F002BBB36002DB72D0030B3240033AF1B0035AA
      130038A70B0037990200A7A7A70000000000000000001D170200C59E0100C39B
      0400C2980800C0950C00BF921000BD8E1300BC8B1700BB881C00B9852000B881
      2400B77E2800AA742900A7A7A700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1ECE0009E79
      2400E2D7BD00AA8B4200B2945000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000014AF5E001BD36A00FAFC
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0086CB6E0038A70B001E1E1E000000000000000000A5891800C8A20F00FDFB
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D3B17D00B77E28001E1E1E00000000000C0C0C000071B6000077BF000077
      BF000077BF000077BF000077BF000077BF000077BF000077BF000077BF000077
      BF000077BF000077BF0000355500D4D4D40000000000FEFDFC00AF904B000000
      00000000000000000000B5995900BCA369000000000000000000000000000000
      0000000000000000000000000000000000000000000012B567001BD36A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8FCF300E8FCF300FAFE
      FC00E3F4E10035AA13001C1C1C000000000000000000AA8F2600C9A41F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F5EEE100B88124001C1C1C000000000000659A0000A7FF0000A7FF0000A7
      FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7
      FF0000A7FF0000A7FF0000A7FF002323230000000000A5803000000000000000
      0000000000000000000000000000B2924C00CBB5850000000000000000000000
      000000000000000000000000000000000000000000000FB96E0018D77400FFFF
      FF004EE8A50025E3910038E59A00FFFFFF0041E69E0013E1870025E39100FFFF
      FF00E2F6E40033AF1B001C1C1C000000000000000000AD933400CCA92C00FFFF
      FF00FFFFFF00DCC46500E7D89800F4EDD100DCC46500FEFEFD00FFFFFF00FFFF
      FF00F6EFDF00B98520001C1C1C0000000000006A9F0000ACFB0000AFFF0000AF
      FF0000AFFF0000AFFF0000AFFF000077CE000096EA0000AFFF0000AFFF0000AF
      FF0000AFFF0000AFFF0000A6FA002020200000000000B28D3E00000000000000
      000000000000C7AE7900AC863500D0BA8C00B18E4200D8C7A100000000000000
      000000000000000000000000000000000000000000000EBC760015DC7E00FFFF
      FF00FFFFFF0018E18A0013DF850042E4990015DD800014DF8400FEFFFE00FFFF
      FF00E1F7E70030B324001C1C1C000000000000000000AF974200CFAE3A00FFFF
      FF00FFFFFF00D9BF5F00D9BF5F00F3EBCF00D9BF5F00E0CA7C00FFFFFF00FFFF
      FF00F6F0DE00BB881C001C1C1C0000000000006E9F0000B0FF0000B4F90000B8
      FF0000B8FF0000B8FF00009BCD0000EBFF0000EDFD00008FE00000B8FF0000B8
      FF0000B8FF0000A6F40000B0FF002020200000000000F2EAD900AF8737000000
      0000F5EFE300DECFAE0000000000B8944A00D8C49D00B28B3C00E4D7BB000000
      000000000000000000000000000000000000000000000CBF7D0013E18900FFFF
      FF00FFFFFF00FEFEFE0016DC7D0017D9770018D87400E5FBF000FFFFFF00FFFF
      FF00E1F8E9002DB72D001C1C1C000000000000000000B29B5000D2B44700FFFF
      FF00FFFFFF00D3B45700D3B45700D3B45800D3B45700D3B45700FEFEFD00FFFF
      FF00F7F1DD00BC8B17001C1C1C000000000000729F0000B7FF0000B7FF0000BC
      F80000C0FF00008CC40000E2FF0000E2FF0000E2FF0000E3FE0000ACF20000C0
      FF0000A5EA0000B7FF0000B7FF00202020000000000000000000E8D9B800B893
      4700F9F6F000B58E3E000000000000000000B8924400E3D5B700B68F3E00EDE4
      D10000000000000000000000000000000000000000000AC2840010E69300FFFF
      FF00FFFFFF00FFFFFF0021CA55001CD267001FCE5E00E7F9EC00FFFFFF00FFFF
      FF00E0F9EC002BBB36001C1C1C000000000000000000B49F5E00D6B95800FFFF
      FF00FFFFFF00CBA34B00E0C99600CBA34B00CBA34B00D4B36C00D4B36C00FFFF
      FF00F7F3DF00BD8E13001C1C1C000000000000779F0000BEFF0000BEFF0000BE
      FE000086BE0000D9FF0000D9FF0000D9FF0000D9FF0000D9FF0000D8FC00009A
      DA0000BEFF0000BEFF0000BEFF0020202000000000000000000000000000E4D1
      A700C19E5700EBDDBD00BD984C000000000000000000BB944300EDE2CE00BB94
      4300F5EFE2000000000000000000000000000000000007C68C000CEA9E00FFFF
      FF00FFFFFF0051C4540028BE3D0035C9590025C2470029BC3A00FDFEFD00FFFF
      FF00DFFAEF0028BE3F001C1C1C000000000000000000B7A46B00D9BF6B00FFFF
      FF00E7D4B700BE8C3C00F2E7D800BE8C3C00BE8C3C00EBDCC400BE8C3C00E4D0
      AF00F8F4E400BF9210001C1C1C0000000000007E9F0000CAFF0000CAFF000091
      CA0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000CC
      FA0000CAFE0000CAFF0000CAFF00202020000000000000000000000000000000
      0000E2CC9C00CBAB6A00E8D6AF00C5A25C000000000000000000C0984800F4EE
      E100C09848000000000000000000000000000000000005C993000AEFA800FFFF
      FF00BCE0AA003EAF1F003AB52D00FFFFFF008FD88F003BB3280041AC1A00FFFF
      FF00DEFCF10025C348001C1C1C000000000000000000B9A97900DDC67E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9F6E900C0950C001C1C1C000000000000849F0000D4FF0000ADDD0000C6
      FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6
      FF0000C0F80000D4FF0000D4FF00202020000000000000000000000000000000
      000000000000E3CA9400D6B87F00E7D3A500D0AE6D000000000000000000C69D
      4D00F8F3EA000000000000000000000000000000000003CC9A0006F4B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDFDF40023C851001C1C1C000000000000000000BCAD8700E0CC9200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FAF7EE00C29808001C1C1C0000000000008B9F0000CAEE0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BD
      FF0000BDFF0000BAF80000DFFF00202020000000000000000000000000000000
      00000000000000000000E2C68900DFC69600E7D09B00D8B87D00000000000000
      0000CCA15100FCF9F40000000000000000000000000002CE9E0004F8BC00C0FD
      ED00D3FDF200D4FCF100D4FCEF00D4FBEE00D4FBED00D5FAEC00D5FAEB00D5F9
      EA0048DE8C0020CC5A001C1C1C000000000000000000BDAE9000E4D1A400F7F3
      E600F9F6EC00F9F5EA00F9F4E800F8F4E600F8F3E400F7F3E200F7F2E000F7F1
      DE00D4B74600C39B04001C1C1C0000000000008C9A0000B7FF0000B7FF0000B7
      FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7
      FF0000B7FF0000B7FF0000BFFA00202020000000000000000000000000000000
      0000000000000000000000000000E3C38200E8D3AC00FCF8ED00000000000000
      000000000000D1A656000000000000000000000000001E6E160001FCC50004F8
      BC0006F4B30009F0AA000CECA1000EE8980011E48F0013E0860015DC7D0018D8
      74001BD46C001AD56F0044444400000000000000000076572D00E7D6B500E4D1
      A400E1CC9300DEC78300DAC17200D7BC6100D4B75100D1B24000CEAD2F00CBA8
      1F00C8A30F00C8A2230044444400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000202020000000000000000000000000000000
      000000000000000000000000000000000000E1BF7900EFDEC100000000000000
      000000000000EDD7B000FDFAF50000000000000000005C5C5C00278012002CB1
      2F0025B844001EBF590018C66E0012CD830014CA79001BC2640022BC4F0028B5
      3A002FAC2300091E0300FEFEFE0000000000000000005C5C5C0090693500C396
      5400CA9F6100CFA96E00D4B37B00D9BD8800D7B98200D1AE7400CBA36500C498
      5700BD8B470022180A00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4BE7500F5E9D4000000
      000000000000DAAD5C0000000000000000000000000000000000FDFDFD00D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700E0E0E0000000000000000000000000000000000000000000FDFDFD00D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700E0E0E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4BF7800DBAD
      5F00E4BD7400000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF800180038003FFFF0000
      80018001FFFFC1FF8001800100009CFF800180010000BE7F800180010000B83F
      800180010000921F800180010000C30F800180010000E187800180010000F0C7
      800180010000F867800180010000FC33800180010000FE3B800180010000FF39
      80018001FFFFFF9BC007C007FFFFFFC700000000000000000000000000000000
      000000000000}
  end
  object pmnuDocuments: TPopupMenu
    Left = 374
    Top = 334
    object CreateExcelDocument1: TMenuItem
      Caption = 'Create Excel Document'
      OnClick = btnExcelClick
    end
    object CreateWordDocument1: TMenuItem
      Caption = 'Create Word Document'
      OnClick = btnExcelClick
    end
    object Email1: TMenuItem
      Caption = 'Create Email'
      OnClick = btnEmailClick
    end
    object Adddocument1: TMenuItem
      Caption = 'Attach Document'
      OnClick = btnAttachClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmnuOpen: TMenuItem
      Caption = 'Open'
      OnClick = lstvwDocumentsDblClick
    end
    object pmnuPaste: TMenuItem
      Caption = 'Paste'
      OnClick = pmnuPasteClick
    end
    object pmnuDelete: TMenuItem
      Caption = 'Delete'
      OnClick = pmnuDeleteClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pmnuSelectAll: TMenuItem
      Caption = 'Select All'
      OnClick = pmnuSelectAllClick
    end
  end
  object DropComboTarget1: TDropComboTarget
    DragTypes = [dtCopy, dtLink]
    OnDrop = DropComboTarget1Drop
    Target = pgDetails
    Left = 833
    Top = 128
  end
end
