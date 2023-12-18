object PBEnquiryFrm: TPBEnquiryFrm
  Left = 286
  Top = 53
  Caption = 'Enter Enquiry details'
  ClientHeight = 576
  ClientWidth = 813
  Color = clBtnFace
  Constraints.MinHeight = 613
  Constraints.MinWidth = 800
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    813
    576)
  TextHeight = 13
  object Label8: TLabel
    Left = 8
    Top = 138
    Width = 104
    Height = 13
    Caption = 'Enquiry Line Details:'
  end
  object EnquiryLbl: TLabel
    Left = 628
    Top = 360
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'EnquiryLbl'
    Visible = False
  end
  object EnquiryMessageLbl: TLabel
    Left = 2
    Top = 520
    Width = 99
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'EnquiryMessageLbl'
  end
  object EnqLineList: TListBox
    Left = 6
    Top = 136
    Width = 339
    Height = 89
    ItemHeight = 13
    TabOrder = 5
    OnClick = EnqLineListClick
  end
  object LineGrid: TStringGrid
    Left = 416
    Top = 344
    Width = 113
    Height = 65
    TabStop = False
    ColCount = 21
    DefaultRowHeight = 20
    RowCount = 1
    FixedRows = 0
    TabOrder = 6
    Visible = False
    RowHeights = (
      20)
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 557
    Width = 813
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 300
      end>
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 520
    Width = 813
    Height = 37
    Align = alBottom
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      813
      37)
    object OKBitBtn: TBitBtn
      Left = 607
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Save'
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
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
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        03030303030303030303030303030303030303030303FF030303030303030303
        03030303030303040403030303030303030303030303030303F8F8FF03030303
        03030303030303030303040202040303030303030303030303030303F80303F8
        FF030303030303030303030303040202020204030303030303030303030303F8
        03030303F8FF0303030303030303030304020202020202040303030303030303
        0303F8030303030303F8FF030303030303030304020202FA0202020204030303
        0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
        040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
        03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
        FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
        0303030303030303030303FA0202020403030303030303030303030303F8FF03
        03F8FF03030303030303030303030303FA020202040303030303030303030303
        0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
        03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
        030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
        0202040303030303030303030303030303F8FF03F8FF03030303030303030303
        03030303FA0202030303030303030303030303030303F8FFF803030303030303
        030303030303030303FA0303030303030303030303030303030303F803030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 703
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
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
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303F8F80303030303030303030303030303030303FF03030303030303030303
        0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
        03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
        030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
        FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
        030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
        F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
        010101F8030303030303030303F8FF030303030303FFF8030303030303030303
        030101010101F80303030303030303030303F8FF0303030303F8030303030303
        0303030303F901010101F8030303030303030303030303F8FF030303F8030303
        0303030303030303F90101010101F8030303030303030303030303F803030303
        F8FF030303030303030303F9010101F8010101F803030303030303030303F803
        03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
        03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
        03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
        0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
        030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
        03030303030303030303030303030303030303030303030303F8F8F803030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = CancelBitBtnClick
    end
  end
  object pnlLineDetails: TPanel
    Left = 0
    Top = 263
    Width = 813
    Height = 257
    Align = alBottom
    Caption = 'pnlLineDetails'
    ParentBackground = False
    TabOrder = 3
    object EnquiryLinePage: TPageControl
      Tag = 180
      Left = 1
      Top = 1
      Width = 811
      Height = 255
      ActivePage = TabSheet6
      Align = alClient
      TabOrder = 0
      object PartTabSheet: TTabSheet
        Caption = 'Part Details'
        DesignSize = (
          803
          227)
        object Bevel3: TBevel
          Left = 2
          Top = 5
          Width = 694
          Height = 188
          Anchors = [akLeft, akTop, akRight]
          Shape = bsFrame
          ExplicitWidth = 726
        end
        object Label16: TLabel
          Left = 8
          Top = 16
          Width = 25
          Height = 13
          Caption = 'Parts'
        end
        object Label17: TLabel
          Left = 96
          Top = 16
          Width = 44
          Height = 13
          Caption = 'Heading'
        end
        object SameAsLbl: TLabel
          Left = 424
          Top = 40
          Width = 64
          Height = 13
          Caption = 'Same as Part'
          Visible = False
        end
        object PartList: TListBox
          Tag = 100
          Left = 8
          Top = 32
          Width = 81
          Height = 153
          ItemHeight = 13
          TabOrder = 0
          OnClick = PartListClick
          OnDblClick = PartListDblClick
        end
        object HeadEdit: TEdit
          Tag = 101
          Left = 96
          Top = 32
          Width = 297
          Height = 21
          MaxLength = 40
          TabOrder = 1
          OnKeyUp = HeadEditKeyUp
        end
        object PartPageControl: TPageControl
          Left = 96
          Top = 64
          Width = 577
          Height = 121
          ActivePage = InkTabSheet
          TabOrder = 3
          object PaperTabSheet: TTabSheet
            Caption = 'Papers Details'
            object Label19: TLabel
              Left = 268
              Top = 47
              Width = 42
              Height = 13
              Caption = 'Material'
            end
            object Label20: TLabel
              Left = 268
              Top = 6
              Width = 30
              Height = 13
              Caption = 'Brand'
            end
            object Label21: TLabel
              Left = 7
              Top = 48
              Width = 38
              Height = 13
              Caption = 'Weight'
            end
            object Label22: TLabel
              Left = 7
              Top = 5
              Width = 35
              Height = 13
              Caption = 'Colour'
            end
            object ColourComboBox: TComboBox
              Tag = 105
              Left = 8
              Top = 20
              Width = 257
              Height = 21
              Hint = 'Paper_Colour'
              MaxLength = 40
              TabOrder = 0
              OnEnter = ColourComboBoxEnter
              OnExit = ColourComboBoxExit
            end
            object WeightComboBox: TComboBox
              Tag = 104
              Left = 8
              Top = 64
              Width = 257
              Height = 21
              Hint = 'Paper_Weight'
              TabOrder = 1
              OnEnter = ColourComboBoxEnter
              OnExit = ColourComboBoxExit
            end
            object BrandComboBox2: TComboBox
              Tag = 103
              Left = 269
              Top = 20
              Width = 260
              Height = 21
              Hint = 'Paper_Brand'
              TabOrder = 2
              OnEnter = ColourComboBoxEnter
              OnExit = ColourComboBoxExit
            end
            object MaterialComboBox: TComboBox
              Tag = 102
              Left = 269
              Top = 64
              Width = 260
              Height = 21
              Hint = 'Paper_Material'
              TabOrder = 3
              OnEnter = ColourComboBoxEnter
              OnExit = ColourComboBoxExit
            end
            object BitBtn2: TBitBtn
              Left = 536
              Top = 20
              Width = 25
              Height = 25
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              OnClick = BitBtn2Click
            end
          end
          object InkTabSheet: TTabSheet
            Caption = 'Inks Details'
            object Label23: TLabel
              Left = 21
              Top = 16
              Width = 23
              Height = 13
              Caption = 'Face'
            end
            object Label24: TLabel
              Left = 2
              Top = 48
              Width = 39
              Height = 13
              Caption = 'Reverse'
            end
            object PlateChangeLbl: TLabel
              Left = 334
              Top = 72
              Width = 131
              Height = 13
              Alignment = taRightJustify
              Caption = 'Number of Plate Changes'
            end
            object FaceEdit: TEdit
              Tag = 106
              Left = 52
              Top = 8
              Width = 301
              Height = 21
              MaxLength = 40
              TabOrder = 0
              OnKeyUp = HeadEditKeyUp
            end
            object RevEdit: TEdit
              Tag = 107
              Left = 52
              Top = 40
              Width = 301
              Height = 21
              MaxLength = 40
              TabOrder = 1
              OnKeyUp = HeadEditKeyUp
            end
            object PlateChangeSpin: TSpinEdit
              Tag = 108
              Left = 472
              Top = 64
              Width = 41
              Height = 22
              MaxValue = 10
              MinValue = 0
              TabOrder = 2
              Value = 0
              OnChange = PlateChangeSpinChange
            end
          end
          object MarginsTabSheet: TTabSheet
            Caption = 'Margins'
            object Label26: TLabel
              Left = 112
              Top = 8
              Width = 19
              Height = 13
              Caption = 'Left'
            end
            object Label27: TLabel
              Left = 208
              Top = 8
              Width = 28
              Height = 13
              Caption = 'Right'
            end
            object Label28: TLabel
              Left = 16
              Top = 32
              Width = 32
              Height = 13
              Caption = 'Width'
            end
            object Label29: TLabel
              Left = 21
              Top = 64
              Width = 23
              Height = 13
              Caption = 'Type'
            end
            object LWMarginEdit: TEdit
              Tag = 109
              Left = 56
              Top = 24
              Width = 81
              Height = 21
              TabOrder = 0
              OnKeyUp = HeadEditKeyUp
            end
            object LMarginTypeEdit: TEdit
              Tag = 110
              Left = 56
              Top = 56
              Width = 81
              Height = 21
              TabOrder = 1
              OnKeyUp = HeadEditKeyUp
            end
            object RWMarginEdit: TEdit
              Tag = 111
              Left = 160
              Top = 24
              Width = 81
              Height = 21
              TabOrder = 2
              OnKeyUp = HeadEditKeyUp
            end
            object RMarginTypeEdit: TEdit
              Tag = 112
              Left = 160
              Top = 56
              Width = 81
              Height = 21
              TabOrder = 3
              OnKeyUp = HeadEditKeyUp
            end
            object BitBtn1: TBitBtn
              Left = 256
              Top = 24
              Width = 97
              Height = 25
              Caption = 'Set Defaults'
              TabOrder = 4
              OnClick = BitBtn1Click
            end
          end
        end
        object SameAsPartEdit: TEdit
          Tag = 113
          Left = 504
          Top = 32
          Width = 25
          Height = 21
          TabOrder = 2
          Text = '0'
          Visible = False
          OnKeyPress = SameAsPartEditKeyPress
          OnKeyUp = SameAsPartEditKeyUp
        end
        object SameAsPartSpin: TUpDown
          Left = 528
          Top = 32
          Width = 16
          Height = 23
          TabOrder = 4
          Visible = False
          OnClick = SameAsPartSpinClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Additional Notes'
        DesignSize = (
          803
          227)
        object Bevel4: TBevel
          Left = 2
          Top = 5
          Width = 772
          Height = 220
          Anchors = [akLeft, akTop, akRight, akBottom]
          Shape = bsFrame
          ExplicitWidth = 804
        end
        object AddNotesMemo: TMemo
          Left = 9
          Top = 8
          Width = 753
          Height = 211
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = AddNotesMemoChange
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Supplier/Customer Notes'
        object Bevel5: TBevel
          Left = 2
          Top = 5
          Width = 755
          Height = 216
          Shape = bsFrame
        end
        object Label12: TLabel
          Left = 16
          Top = 16
          Width = 92
          Height = 13
          Caption = 'Additional Details'
        end
        object AddDetailsList: TListBox
          Tag = 120
          Left = 16
          Top = 32
          Width = 269
          Height = 145
          ItemHeight = 13
          TabOrder = 0
          OnClick = AddDetailsListClick
          OnDblClick = AddDetailsListDblClick
        end
        object GroupBox2: TGroupBox
          Left = 308
          Top = 16
          Width = 437
          Height = 197
          Caption = 'Notes:'
          ParentBackground = False
          TabOrder = 1
          object AddDetailsMemo: TMemo
            Tag = 121
            Left = 10
            Top = 16
            Width = 415
            Height = 173
            BorderStyle = bsNone
            Color = clBtnFace
            TabOrder = 0
          end
        end
        object AddSupNtsBitBtn: TBitBtn
          Left = 16
          Top = 188
          Width = 75
          Height = 25
          Caption = 'Add'
          TabOrder = 2
          OnClick = AddSupNtsBitBtnClick
        end
        object ChangeSupNtsBitBtn: TBitBtn
          Left = 96
          Top = 188
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 3
          OnClick = ChangeSupNtsBitBtnClick
        end
        object DeleteSupNtsBitBtn: TBitBtn
          Left = 176
          Top = 188
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 4
          OnClick = DeleteSupNtsBitBtnClick
        end
      end
      object CapabilityTabSheet: TTabSheet
        Caption = 'Capabilities'
        DesignSize = (
          803
          227)
        object Bevel6: TBevel
          Left = 2
          Top = 5
          Width = 777
          Height = 219
          Anchors = [akLeft, akTop, akRight, akBottom]
          Shape = bsFrame
          ExplicitWidth = 809
        end
        object Label11: TLabel
          Left = 16
          Top = 16
          Width = 153
          Height = 13
          Caption = 'Capabilities for Product Type: '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object ProductCLbl: TLabel
          Tag = 131
          Left = 184
          Top = 16
          Width = 62
          Height = 13
          Caption = 'ProductCLbl'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object CapabilityScrollBox: TScrollBox
          Tag = 130
          Left = 16
          Top = 32
          Width = 721
          Height = 177
          HorzScrollBar.Visible = False
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Outlook'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object QuestionTabSheet: TTabSheet
        Caption = 'Questions'
        object Bevel8: TBevel
          Left = 2
          Top = 5
          Width = 743
          Height = 212
          Shape = bsFrame
        end
        object Label10: TLabel
          Left = 24
          Top = 8
          Width = 116
          Height = 26
          Caption = 'Questions for Product Type:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object ProductQLbl: TLabel
          Tag = 141
          Left = 184
          Top = 8
          Width = 63
          Height = 13
          Caption = 'ProductQLbl'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object ScrollBox1: TScrollBox
          Tag = 140
          Left = 16
          Top = 24
          Width = 721
          Height = 185
          TabOrder = 0
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Assign Suppliers'
        DesignSize = (
          803
          227)
        object Bevel9: TBevel
          Left = 2
          Top = 5
          Width = 776
          Height = 219
          Anchors = [akLeft, akTop, akRight, akBottom]
          Shape = bsFrame
          ExplicitWidth = 808
        end
        object SupplierGrid: TStringGrid
          Left = 16
          Top = 24
          Width = 663
          Height = 185
          Anchors = [akLeft, akTop, akRight, akBottom]
          ColCount = 3
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          TabOrder = 0
          OnDblClick = SupplierGridDblClick
          OnDrawCell = SupplierGridDrawCell
          ColWidths = (
            204
            182
            165)
        end
        object SuppSelectBtn: TBitBtn
          Left = 690
          Top = 24
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Select'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000000000005F5F
            005F5F005F5F005F5F005F5F005F5F005F5F005F5F005F5F005F5F005F5F005F
            5F003F3FFFFFFFFFFFFF3F3F3F3F9F9F3FDFDF3FDFDF3FDFDF3FDFDF3FDFDF3F
            DFDF3FDFDF3FDFDF3FDFDF3FDFDF3FDFDF3F9F9F000000FFFFFF3F7F7F007F7F
            7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFF
            FF7FFFFF003F3FFFFFFF3F7F7F7FBFBF7FBFBF7FFFFF7FFFFF7FFFFF7FFFFF7F
            FFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF3F7F7FFFFFFF3F7F7F3FBFBF
            3F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFF
            FF7FFFFF7FFFFF0000003F7F7F7F7F7FBFBFBF3F7F7F3F7F7F3F7F7F3F7F7F3F
            7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F3F3F3F7F7F3F7F7F
            7F7F7FFFFFFFBFBFBF7F7F7FBFBFBF7F7F7FBFBFBF7F7F7F7F7F7FBFBFBFBFBF
            BFBFBFBF000000FFFFFF3F7F7F7FFFFF7FFFFF3F7F7F7F7F7FFFFFFF7F7F7FBF
            BFBF7F7F7F7F7F7FBFBFBFBFBFBFBFBFBF7FBFBF000000FFFFFF003F3F7FFFFF
            7FFFFF7FFFFF7FFFFF3F7F7F7F7F7FBFBFBFBFBFBF7F7F7F3F3F3F3F3F3F0000
            00000000FFFFFFFFFFFFFFFFFF003F3F3F7F7F3F7F7F3F7F7F000000FFFFFF00
            0000202020BFBFBF6F6F6F7F7F7F303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F8080806F6F6FBFBFBF5050
            50000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF000000DFDFDFAFAFAFFFFFFF606060200000000000FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFFFFFF9F9F9F8020
            209F003F400000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF9F0000800000800000603F3F9F003F200000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F0000FF00009F00
            00800000200000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF3F00007F0000FFFFFFFFFFFFFFFFFF}
          TabOrder = 1
          OnClick = BitBtn4Click
        end
        object ContactSelBitBtn: TBitBtn
          Left = 690
          Top = 56
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Contact'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
            BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
            BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
            BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
            BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
            EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
            EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
            EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
            EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
          NumGlyphs = 2
          TabOrder = 2
          OnClick = ContactSelBitBtnClick
        end
      end
      object OptionsTabSheet: TTabSheet
        Caption = 'Optional Charge'
        ImageIndex = 6
        object Bevel10: TBevel
          Left = 2
          Top = 5
          Width = 747
          Height = 212
          Shape = bsFrame
        end
        object lblPTOptions: TLabel
          Tag = 131
          Left = 216
          Top = 16
          Width = 62
          Height = 13
          Caption = 'ProductCLbl'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 16
          Top = 16
          Width = 184
          Height = 13
          Caption = 'Optional Charges for Product Type: '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object OptionsScrollBox: TScrollBox
          Tag = 130
          Left = 16
          Top = 32
          Width = 713
          Height = 173
          HorzScrollBar.Visible = False
          TabOrder = 0
        end
      end
      object tbsDocuments: TTabSheet
        Caption = 'Documents'
        ImageIndex = 7
        object pnlDocs: TPanel
          Left = 0
          Top = 0
          Width = 803
          Height = 227
          Align = alClient
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            803
            227)
          object lblDocs: TLabel
            Left = 12
            Top = 8
            Width = 61
            Height = 13
            Caption = 'Documents:'
          end
          object strgrdDocs: TStringGrid
            Left = 12
            Top = 26
            Width = 790
            Height = 155
            Anchors = [akLeft, akTop, akRight]
            ColCount = 2
            DefaultColWidth = 150
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
            TabOrder = 0
            OnDblClick = strgrdDocsDblClick
            ExplicitWidth = 814
          end
          object ocWord: TOleContainer
            Left = 440
            Top = 56
            Width = 145
            Height = 73
            Caption = 'ocWord'
            TabOrder = 8
            Visible = False
            Data = {
              42444F430100000000500000D0CF11E0A1B11AE1000000000000000000000000
              000000003E000300FEFF09000600000000000000000000000100000001000000
              00000000001000000200000001000000FEFFFFFF0000000000000000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF0C000000FEFFFFFF0D00000005000000
              060000000700000008000000090000000A0000000B000000FEFFFFFF1E000000
              FEFFFFFF0F000000100000001100000012000000130000001400000015000000
              FEFFFFFF1700000018000000190000001A0000001B0000001C0000001D000000
              FEFFFFFFFEFFFFFF200000002100000022000000230000002400000025000000
              26000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000016000500FFFFFFFFFFFFFFFF0400000006090200
              00000000C00000000000004600000000000000000000000060F719D0E731DA01
              03000000400200000000000001004F006C006500000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000A000201FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000140000000000000031005400610062006C0065000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000E0002000100000003000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              040000000010000000000000010043006F006D0070004F0062006A0000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              010000006A00000000000000FEFFFFFF02000000FEFFFFFF0400000005000000
              060000000700000008000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0100000200000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000100FEFF030A0000FFFFFFFF0609020000000000
              C000000000000046180000004D6963726F736F667420576F726420446F63756D
              656E74000A0000004D53576F7264446F630010000000576F72642E446F63756D
              656E742E3800F439B27100000000000000000000000000000000000000000000
              000000000000000000000000FFFFFFFF030000000400000001000000FFFFFFFF
              020000000000000047390000E701000002010000010009000003810000000200
              1C00000000001400000026060F001E00FFFFFFFF040014000000576F72640E00
              4D6963726F736F667420576F7264050000000B0200000000050000000C027300
              880D1C000000FB029CFF0000000000009001000000000440001254696D657320
              4E657720526F6D616E001643C8771F43C87720C0CA7700003000040000002D01
              000005000000020101000000050000000902000000020D000000320A00000000
              0100040000000000880D730020632D001C000000FB021000070000000000BC02
              000000000102022253797374656D000000000A0026008A0100000000FFFFFFFF
              9CC712002942C877040000002D01010003000000000000000000000000000000
              00000000000000004E414E4914000F000A00010069000F000300000000000000
              000038000040F1FF020038000C0006004E006F0072006D0061006C0000000200
              00001800434A18005F480104614A18006D480908734809087448090400000000
              00000000000000000000000000003C004140F2FFA1003C000C00160044006500
              6600610075006C00740020005000610072006100670072006100700068002000
              46006F006E00740000000000000000000000000000000000010000000500000C
              00000000FFFFFFFF010000000420FFFF0100182BA30000000000000000000100
              0000000000000000000000000300000098000000003000000000000000800000
              0080000400000104000003000000000400000104000004000000000400000104
              000005000000FF400180010000000000000000009CF282000100000000000000
              0000000000000000000000000210000000000000000100000050000008004000
              00FFFF01000000070055006E006B006E006F0077006E00FFFF01000800000000
              00000000000000FFFF010000000000FFFF00000200FFFF00000000FFFF000002
              00FFFF000000000300000047169001000002020603050405020304877A002000
              0000800800000000000000FF01000000000000540069006D006500730020004E
              0065007700200052006F006D0061006E00000035169001020005050102010706
              020507000000000000001000000000000000000000008000000000530079006D
              0062006F006C000000332690010000020B0604020202020204877A0020000000
              800800000000000000FF0100000000000041007200690061006C000000220004
              003108881800F0D0020000680100000000C0828B46C0828B4600000000020000
              0000000000000000000000010001000000040003100100000000000000000000
              000100010000000100000000000000240300F010000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000A506C007B400B4008181123000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000020000008E02000000000000000000F01000080000
              0000000000000000000000000000000000000000000000000000000000FFFF12
              0000000000000000000000000000000C004400610076006900640020004E0061
              0079006C006F0072000C004400610076006900640020004E00610079006C006F
              0072000000000000000000000000000000000000000000000000000000000000
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
              0000000000000000000000004F0062006A0065006300740050006F006F006C00
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000160001010200000006000000FFFFFFFF00000000
              0000000000000000000000000000000060F719D0E731DA0160F719D0E731DA01
              00000000000000000000000002004F006C006500500072006500730030003000
              3000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000018000201FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              03000000440100000000000057006F007200640044006F00630075006D006500
              6E00740000000000000000000000000000000000000000000000000000000000
              0000000000000000000000001A0002000500000007000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              0E00000000100000000000000500530075006D006D0061007200790049006E00
              66006F0072006D006100740069006F006E000000000000000000000000000000
              00000000000000000000000028000201FFFFFFFF08000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              1600000000100000000000000000000000000000000000000000000000000000
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
              000000000000000000000000ECA5C100372009040000F012BF00000000000010
              0000000000040000010400000E00626A626A5516551600000000000000000000
              000000000000000009041600320C0000377C0000377C00000100000000000000
              000000000000000000000000000000000000000000000000FFFF0F0000000000
              00000000FFFF0F000000000000000000FFFF0F00000000000000000000000000
              000000006C0000000000A800000000000000A8000000A800000000000000A800
              000000000000A800000000000000A800000000000000A8000000140000000000
              000000000000DC00000000000000F600000000000000F600000000000000F600
              000000000000F60000000C000000020100000C000000DC000000000000009B01
              0000B60000001A010000000000001A010000000000001A010000000000001A01
              0000000000001A010000000000001A010000000000001A010000000000001A01
              0000000000001A010000020000001C010000000000001C010000000000001C01
              0000000000001C010000000000001C010000000000001C010000240000005102
              000020020000710400005A000000400100001500000000000000000000000000
              000000000000A8000000000000001A0100000000000000000000000000000000
              0000000000001A010000000000001A010000000000001A010000000000001A01
              00000000000040010000000000001A01000000000000A800000000000000A800
              0000000000001A0100000000000000000000000000001A010000000000005501
              0000160000001A010000000000001A010000000000001A010000000000001A01
              000000000000A8000000000000001A01000000000000A8000000000000001A01
              0000000000001A0100000000000000000000000000001A010000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000001A010000000000001A010000000000001A01
              0000000000001A0100000000000000000000000000001A01000000000000A800
              000000000000A800000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000001A010000000000001A010000000000000E0100000C000000803E
              F372CBCBC401DC0000001A000000F6000000000000001A010000000000001A01
              00000000000000000000000000001A010000000000006B010000300000009B01
              0000000000001A01000000000000CB040000000000001A01000000000000CB04
              0000000000001A010000000000001A01000000000000BC00000012000000CE00
              00000E000000A800000000000000A800000000000000A800000000000000A800
              0000000000000200D90000000D00000000000000000000000000000000000000
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
              0000000000000000000000000004000001040000000000000000000000000000
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
              0000000000000000000000010004000001040000FD0000000000000000000000
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
              0000000000000001000000010004000001040000FD0000000000000000000000
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
              000000000000040400010101300026500900319068011FB0832E20B0C84121B0
              050722B005072390A0052490A00525B0000017B0C50218B0C5020C90C4020000
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
              000000000000000000000000FEFF000005010200000000000000000000000000
              0000000001000000E0859FF2F94F6810AB9108002B27B3D93000000078010000
              110000000100000090000000020000009800000003000000A400000004000000
              B000000005000000C800000006000000D400000007000000E000000008000000
              F4000000090000000C01000012000000180100000A000000340100000C000000
              400100000D0000004C0100000E000000580100000F0000006001000010000000
              68010000130000007001000002000000E40400001E0000000100000000007300
              1E00000001000000000073001E0000000D0000004461766964204E61796C6F72
              00006F001E00000001000000006176691E00000001000000006176691E000000
              0B0000004E6F726D616C2E646F7400721E0000000D0000004461766964204E61
              796C6F7200006F001E00000002000000320076691E000000130000004D696372
              6F736F667420576F726420392E30000040000000000000000000000040000000
              0078926ACBCBC401400000000078926ACBCBC401030000000100000003000000
              0000000003000000000000000300000000000000000000000000000000000000
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
              000000000000000000000000050044006F00630075006D0065006E0074005300
              75006D006D0061007200790049006E0066006F0072006D006100740069006F00
              6E000000000000000000000038000200FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              1F00000000100000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FEFF000005010200000000000000000000000000
              000000000100000002D5CDD59C2E1B10939708002B2CF9AE30000000F4000000
              0C00000001000000680000000F00000070000000050000008800000006000000
              90000000110000009800000017000000A00000000B000000A800000010000000
              B000000013000000B800000016000000C00000000D000000C80000000C000000
              D500000002000000E40400001E0000001000000043656E74726572656564204C
              74642E0003000000010000000300000001000000030000000000000003000000
              A00A09000B000000000000000B000000000000000B000000000000000B000000
              000000001E1000000100000001000000000C100000020000001E000000060000
              005469746C650003000000010000000000000000000000000000000000000000
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
              000000000000000000000000}
          end
          object ocExcel: TOleContainer
            Left = 613
            Top = 57
            Width = 136
            Height = 76
            AllowInPlace = False
            AutoActivate = aaManual
            Caption = 'ocExcel'
            TabOrder = 7
            Visible = False
            Data = {
              42444F430100000000180000D0CF11E0A1B11AE1000000000000000000000000
              000000003E000300FEFF09000600000000000000000000000100000001000000
              00000000001000000200000001000000FEFFFFFF0000000000000000FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF07000000FEFFFFFF0400000005000000
              0600000008000000FEFFFFFF090000000A000000FEFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000016000500FFFFFFFFFFFFFFFF0200000020080200
              00000000C00000000000004600000000000000000000000060F719D0E731DA01
              03000000400D00000000000001004F006C006500000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000A000201FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000001400000000000000010043006F006D0070004F0062006A0000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000120002010100000004000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              01000000660000000000000057006F0072006B0062006F006F006B0000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              030000005506000000000000FEFFFFFF02000000FEFFFFFF0400000005000000
              060000000700000008000000090000000A0000000B0000000C0000000D000000
              0E0000000F000000100000001100000012000000130000001400000015000000
              160000001700000018000000190000001A0000001B0000001C000000FEFFFFFF
              1E0000001F000000200000002100000022000000230000002400000025000000
              260000002700000028000000290000002A0000002B0000002C000000FEFFFFFF
              2E0000002F00000030000000FEFFFFFF320000003300000034000000FEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0100000200000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000100FEFF030A0000FFFFFFFF2008020000000000
              C0000000000000461A0000004D6963726F736F667420457863656C20576F726B
              736865657400060000004269666638000E000000457863656C2E53686565742E
              3800F439B2710000000000000000000000000000000000000000000000000000
              0000000000000000000000000908100000060500AF18CD07C140000006010000
              E1000200B004C10002000000E20000005C0070000C00004461766964204E6179
              6C6F722020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202020202020202020202020202020202020202020202020202020202020
              2020202042000200B004610102000000C00100003D01020001009C0002000E00
              DE0008000C00000003000001190002000000120002000000130002000000AF01
              02000000BC01020000003D00120078002D004C3B7E2738000000000001005802
              4000020000008D00020000002200020000000E0002000100B70102000000DA00
              0200000031001A00C8000000FF7F900100000000000005014100720069006100
              6C0031001A00C8000000FF7F9001000000000000050141007200690061006C00
              31001A00C8000000FF7F9001000000000000050141007200690061006C003100
              1A00C8000000FF7F9001000000000000050141007200690061006C001E041800
              050013000022A322232C2323303B5C2D22A322232C2323301E041D0006001800
              0022A322232C2323303B5B5265645D5C2D22A322232C2323301E041E00070019
              000022A322232C2323302E30303B5C2D22A322232C2323302E30301E04230008
              001E000022A322232C2323302E30303B5B5265645D5C2D22A322232C2323302E
              30301E0435002A003000005F2D22A3222A20232C2323305F2D3B5C2D22A3222A
              20232C2323305F2D3B5F2D22A3222A20222D225F2D3B5F2D405F2D1E042C0029
              002700005F2D2A20232C2323305F2D3B5C2D2A20232C2323305F2D3B5F2D2A20
              222D225F2D3B5F2D405F2D1E043D002C003800005F2D22A3222A20232C232330
              2E30305F2D3B5C2D22A3222A20232C2323302E30305F2D3B5F2D22A3222A2022
              2D223F3F5F2D3B5F2D405F2D1E0434002B002F00005F2D2A20232C2323302E30
              305F2D3B5C2D2A20232C2323302E30305F2D3B5F2D2A20222D223F3F5F2D3B5F
              2D405F2DE000140000000000F5FF200000000000000000000000C020E0001400
              01000000F5FF200000F40000000000000000C020E000140001000000F5FF2000
              00F40000000000000000C020E000140002000000F5FF200000F4000000000000
              0000C020E000140002000000F5FF200000F40000000000000000C020E0001400
              00000000F5FF200000F40000000000000000C020E000140000000000F5FF2000
              00F40000000000000000C020E000140000000000F5FF200000F4000000000000
              0000C020E000140000000000F5FF200000F40000000000000000C020E0001400
              00000000F5FF200000F40000000000000000C020E000140000000000F5FF2000
              00F40000000000000000C020E000140000000000F5FF200000F4000000000000
              0000C020E000140000000000F5FF200000F40000000000000000C020E0001400
              00000000F5FF200000F40000000000000000C020E000140000000000F5FF2000
              00F40000000000000000C020E000140000000000010020000000000000000000
              0000C020E000140001002B00F5FF200000F80000000000000000C020E0001400
              01002900F5FF200000F80000000000000000C020E000140001002C00F5FF2000
              00F80000000000000000C020E000140001002A00F5FF200000F8000000000000
              0000C020E000140001000900F5FF200000F80000000000000000C02093020400
              108003FF93020400118006FF93020400128004FF93020400138007FF93020400
              008000FF93020400148005FF60010200000085000E0062050000000006005368
              656574318C00040001002C00C1010800C101000060690100FC00080000000000
              00000000FF00020008000A0000000908100000061000AF18CD07C14000000601
              00000D00020001000C00020064000F000200010011000200000010000800FCA9
              F1D24D62503F5F00020001002A00020000002B00020000008200020001008000
              08000000000000000000250204000000FF0081000200C1041400000015000000
              830002000000840002000000A10022000000FF00010001000100040000000000
              000000000000E03F000000000000E03F000055000200080000020E0000000000
              000001000000000000003E021200B60600000000400000000000000000000000
              1D000F00030000000000000100000000000000EF0006000000370000000A0000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FFFFFFFF030000000400000001000000FFFFFFFF
              0200000000000000550D000022070000A6030000010009000003D30100000400
              09000000000005000000090200000000050000000102FFFFFF00050000000401
              0D00000005000000020102000000050000000C0245008100030000001E000400
              00002701FFFF030000001E00040000002701FFFF050000000B02000000000300
              00001E00050000000102FFFFFF0005000000090200000000040000002701FFFF
              030000001E0005000000010202004F006C006500500072006500730030003000
              3000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000180002000300000005000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              1D000000E8030000000000000500530075006D006D0061007200790049006E00
              66006F0072006D006100740069006F006E000000000000000000000000000000
              00000000000000000000000028000201FFFFFFFF06000000FFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              2D000000E000000000000000050044006F00630075006D0065006E0074005300
              75006D006D0061007200790049006E0066006F0072006D006100740069006F00
              6E000000000000000000000038000200FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              3100000000010000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000FFFFFF0005000000090200000000070000001604
              4500810000000000040000002701FFFF030000001E00050000000102FFFFFF00
              050000000902000000000700000016044500810000000000040000002701FFFF
              030000001E00050000000102FFFFFF0005000000090200000000070000001604
              4500810001000100040000002701FFFF030000001E00050000000102FFFFFF00
              05000000090200000000070000001604450081000000000007000000FC020000
              C0C0C0000000040000002D010000050000000902C0C0C000050000000102C0C0
              C0000500000004010D0000000500000002010200000008000000FA0200000000
              0000C0C0C000040000002D010100050000001402000000000500000013020000
              800008000000FA0200000000000000000000040000002D010200090000001D06
              2100F0000100800000000000040000002D010100050000001402110000000500
              0000130211008000040000002D010200090000001D062100F000010080001100
              0000040000002D01010005000000140222000000050000001302220080000400
              00002D010200090000001D062100F0000100800022000000040000002D010100
              0500000014023300000005000000130233008000040000002D01020009000000
              1D062100F0000100800033000000040000002D01010005000000140244000000
              05000000130244008000040000002D010200090000001D062100F00001008000
              44000000040000002D0101000500000014020000000005000000130245000000
              040000002D010200090000001D062100F0004500010000000000040000002D01
              01000500000014020000400005000000130245004000040000002D0102000900
              00001D062100F0004500010000004000040000002D0101000500000014020000
              800005000000130245008000040000002D010200090000001D062100F0004500
              01000000800007000000FC020000000000000000040000002D01030004000000
              2701FFFF030000001E00050000000102C0C0C000050000000902C0C0C0000700
              000016044500810001000100040000002701FFFF030000000000000000000000
              0000000000000000000000004E414E4900000000000000000000000000000000
              000000000000000000000000FEFF000005010200000000000000000000000000
              0000000001000000E0859FF2F94F6810AB9108002B27B3D930000000B0000000
              0700000001000000400000000400000048000000080000006000000012000000
              780000000C000000900000000D0000009C00000013000000A800000002000000
              E40400001E0000000D0000004461766964204E61796C6F72000078001E000000
              0D0000004461766964204E61796C6F72000078001E000000100000004D696372
              6F736F667420457863656C004000000080C2BB142ECBC40140000000003E576C
              C1CBC40103000000000000000000000000000000000000000000000000000000
              000000000000000000000000FEFF000005010200000000000000000000000000
              000000000100000002D5CDD59C2E1B10939708002B2CF9AE30000000D0000000
              0900000001000000500000000F0000005800000017000000700000000B000000
              780000001000000080000000130000008800000016000000900000000D000000
              980000000C000000AB00000002000000E40400001E0000001000000043656E74
              726572656564204C74642E0003000000A00A09000B000000000000000B000000
              000000000B000000000000000B000000000000001E1000000100000007000000
              536865657431000C100000020000001E0000000B000000576F726B7368656574
              7300030000000100000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000}
          end
          object btbtnAddDoc: TBitBtn
            Left = 13
            Top = 190
            Width = 70
            Height = 25
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
            TabOrder = 1
            OnClick = btbtnAddDocClick
          end
          object btbtnChangeDoc: TBitBtn
            Left = 90
            Top = 190
            Width = 70
            Height = 25
            Caption = 'Change  '
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
            TabOrder = 2
            OnClick = btbtnChangeDocClick
          end
          object btbtnDeleteDoc: TBitBtn
            Left = 167
            Top = 190
            Width = 70
            Height = 25
            Caption = 'Delete'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
              03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
              33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
              0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
              3333333337FFF7F3333333333000003333333333377777333333}
            NumGlyphs = 2
            TabOrder = 3
            OnClick = btbtnDeleteDocClick
          end
          object btbtnOpen: TBitBtn
            Left = 244
            Top = 190
            Width = 70
            Height = 25
            Caption = 'Open'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555FFFFFFFFFF55555000000000055555577777777775FFFF00B8B8B8B8B0
              0000775F5555555777770B0B8B8B8B8B0FF07F75F555555575F70FB0B8B8B8B8
              B0F07F575FFFFFFFF7F70BFB0000000000F07F557777777777570FBFBF0FFFFF
              FFF07F55557F5FFFFFF70BFBFB0F000000F07F55557F777777570FBFBF0FFFFF
              FFF075F5557F5FFFFFF750FBFB0F000000F0575FFF7F777777575700000FFFFF
              FFF05577777F5FF55FF75555550F00FF00005555557F775577775555550FFFFF
              0F055555557F55557F755555550FFFFF00555555557FFFFF7755555555000000
              0555555555777777755555555555555555555555555555555555}
            NumGlyphs = 2
            TabOrder = 4
            OnClick = btbtnOpenClick
          end
          object btbtnWordDoc: TBitBtn
            Left = 432
            Top = 190
            Width = 153
            Height = 25
            Caption = 'New Word Document'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
              555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
              05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
              FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
              FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
              FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
              05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
              555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
              9055575757575757775505050505055505557575757575557555}
            NumGlyphs = 2
            TabOrder = 5
            OnClick = btbtnWordDocClick
          end
          object btbtnExcelSheet: TBitBtn
            Left = 588
            Top = 190
            Width = 161
            Height = 25
            Caption = 'New Excel Spreadsheet'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
              FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
              C8807FF7777777777FF700000000000000007777777777777777333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            TabOrder = 6
            OnClick = btbtnExcelSheetClick
          end
          object btnEmail: TBitBtn
            Left = 351
            Top = 190
            Width = 75
            Height = 25
            Hint = 'Set appointment'
            Caption = 'Email'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
              000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
              FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
              FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
              9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
              0000777777777777777733333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = btnEmailClick
          end
        end
      end
    end
  end
  object pnlLines: TPanel
    Left = 0
    Top = 170
    Width = 813
    Height = 93
    Align = alClient
    Caption = 'pnlLines'
    ParentBackground = False
    TabOrder = 2
    object Panel1: TPanel
      Left = 718
      Top = 1
      Width = 94
      Height = 91
      Align = alRight
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        94
        91)
      object AddLineBitBtn: TBitBtn
        Left = 11
        Top = 7
        Width = 75
        Height = 25
        Hint = 'Add new enquiry line'
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = AddLineBitBtnClick
      end
      object ChangeLineBitBtn: TBitBtn
        Left = 11
        Top = 39
        Width = 75
        Height = 25
        Hint = 'Change existing enquiry line'
        Anchors = [akTop, akRight]
        Caption = 'Change'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ChangeLineBitBtnClick
      end
      object DeleteLineBitBtn: TBitBtn
        Left = 11
        Top = 71
        Width = 75
        Height = 25
        Hint = 'Delete an enquiry line'
        Anchors = [akTop, akRight]
        Caption = 'Delete'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = DeleteLineBitBtnClick
      end
    end
    object EnquiryLineGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 717
      Height = 91
      Align = alClient
      DefaultColWidth = 40
      DefaultRowHeight = 20
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 1
      OnClick = EnquiryLineGridClick
      OnDblClick = EnquiryLineGridDblClick
      ColWidths = (
        40
        213
        197
        59
        58)
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 813
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      813
      41)
    object Label7: TLabel
      Left = 184
      Top = 15
      Width = 24
      Height = 13
      Caption = 'Date'
    end
    object EnqDateBtn: TSpeedButton
      Left = 300
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
      OnClick = EnqDateBtnClick
    end
    object Label9: TLabel
      Left = 536
      Top = 15
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Office Contact'
      ExplicitLeft = 542
    end
    object Label3: TLabel
      Left = 335
      Top = 15
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date Required'
      ExplicitLeft = 341
    end
    object DateBtn: TSpeedButton
      Left = 500
      Top = 9
      Width = 25
      Height = 25
      Hint = 'Select the date the enquiry is reqiored'
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
      OnClick = DateBtnClick
      ExplicitLeft = 532
    end
    object lblQuoteNo: TLabel
      Left = 9
      Top = 15
      Width = 60
      Height = 13
      Caption = 'Enquiry No.'
    end
    object EnqDateEdit: TEdit
      Left = 214
      Top = 11
      Width = 81
      Height = 21
      TabOrder = 0
      OnExit = EnqDateEditExit
    end
    object OfficeComboBox: TComboBox
      Left = 616
      Top = 11
      Width = 161
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object ReqByDateEdit: TEdit
      Left = 414
      Top = 11
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnExit = ReqByDateEditExit
    end
    object edtEnquiryNo: TEdit
      Left = 72
      Top = 11
      Width = 81
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = '<New Enquiry>'
    end
  end
  object pnlCustomer: TPanel
    Left = 0
    Top = 41
    Width = 813
    Height = 129
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      813
      129)
    object lblCustomerLabel: TLabel
      Left = 106
      Top = 12
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
    object Label2: TLabel
      Left = 106
      Top = 68
      Width = 40
      Height = 13
      Caption = 'Contact'
    end
    object Label4: TLabel
      Left = 536
      Top = 15
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Rep'
      ExplicitLeft = 568
    end
    object Label5: TLabel
      Left = 106
      Top = 40
      Width = 35
      Height = 13
      Caption = 'Branch'
    end
    object Label6: TLabel
      Left = 106
      Top = 100
      Width = 59
      Height = 13
      Caption = 'Description'
    end
    object CustomerEdit: TEdit
      Left = 166
      Top = 8
      Width = 249
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 0
      OnChange = CustomerEditChange
    end
    object CustRepCombo: TComboBox
      Left = 568
      Top = 11
      Width = 177
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = CustRepComboChange
      OnDropDown = CustRepComboDropDown
    end
    object ContactCombo: TComboBox
      Left = 166
      Top = 64
      Width = 249
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnChange = ContactComboChange
      OnDropDown = ContactComboDropDown
    end
    object BranchEdit: TEdit
      Left = 166
      Top = 36
      Width = 249
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 3
      OnChange = BranchEditChange
    end
    object DescriptionEdit: TEdit
      Left = 166
      Top = 96
      Width = 579
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 80
      TabOrder = 4
      OnChange = DescriptionEditChange
    end
    object CustomerSpeedButton: TButton
      Left = 424
      Top = 7
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
      TabOrder = 5
      OnClick = CustomerSpeedButtonClick
    end
    object BranchSpeedButton: TButton
      Left = 424
      Top = 36
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
      TabOrder = 6
      OnClick = BranchSpeedButtonClick
    end
    object ContactSpeedButton: TButton
      Left = 424
      Top = 64
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
      TabOrder = 7
      OnClick = ContactSpeedButtonClick
    end
    object RepSpeedButton: TButton
      Left = 756
      Top = 10
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = RepSpeedButtonClick
    end
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
      TabOrder = 9
      OnClick = rdgTypeClick
    end
  end
  object CapabilitySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select DISTINCT Product_TypeCapability.Capability,'
      #9#9'Product_TypeCapability.Default_for_all,'
      #9#9'Product_TypeCapability.Description,'
      #9#9'Product_TypeCapability.Inactive,'
      #9#9'Product_TypeCapability.Product_Type'
      'FROM Product_TypeCapability '
      #9#9'LEFT JOIN EnquiryLinPrdct_TypCpblty '
      
        #9#9#9'ON (Product_TypeCapability.Capability = EnquiryLinPrdct_TypCp' +
        'blty.Capability) '
      
        #9#9#9#9'AND (Product_TypeCapability.Product_Type = EnquiryLinPrdct_T' +
        'ypCpblty.Product_Type)'
      'where (Product_TypeCapability.Product_Type = :Product) AND'
      
        '(((Product_TypeCapability.inactive = '#39'N'#39') or (Product_TypeCapabi' +
        'lity.inactive IS NULL)) OR'
      
        '(EnquiryLinPrdct_TypCpblty.Enquiry = :Enquiry) AND (EnquiryLinPr' +
        'dct_TypCpblty.Line = :Line))'
      'order by Description')
    Left = 760
    Top = 96
    ParamData = <
      item
        Name = 'Product'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object QuestionSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Product_TypeQuestion'
      'where Product_Type = :Product'
      'order by Sequence_Reference')
    Left = 624
    Top = 184
    ParamData = <
      item
        Name = 'Product'
      end>
  end
  object InsEnqLineQtySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Enquiry_lineQuantity (enquiry,'
      '                                           Line,'
      '                                           Quantity)'
      'values                                (:Enquiry,'
      '                                           :Line,'
      '                                           :Qty)')
    Left = 32
    Top = 200
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Qty'
      end>
  end
  object UpEnqLineCapSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into EnquiryLinPrdct_TypCpblty (enquiry,'
      '                                                      Line,'
      
        '                                                      Product_Ty' +
        'pe,'
      
        '                                                      Capability' +
        ')'
      'values                                           (:enquiry,'
      '                                                      :Line,'
      '                                                      :Product,'
      '                                                      :Cap)')
    Left = 32
    Top = 160
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Product'
      end
      item
        Name = 'Cap'
      end>
  end
  object UpEnqLineQSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Enquiry_Questions (enquiry,'
      '                                         line,'
      '                                         Product_Type,'
      '                                         Question,'
      '                                         Product_Answer)'
      'values                              (:enquiry,'
      '                                         :Line,'
      '                                         :Product,'
      '                                         :Question,'
      '                                         :Answer)')
    Left = 32
    Top = 232
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Product'
      end
      item
        Name = 'Question'
      end
      item
        Name = 'Answer'
      end>
  end
  object UpEnqLineAddSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into EnquiryLineAdditionl_Dtls (enquiry,'
      '                                                   Line,'
      
        '                                                   Additional_De' +
        'tails,'
      '                                                   FAO_flag,'
      '                                                   Details)'
      'values                                        (:enquiry,'
      '                                                   :Line,'
      '                                                   :Code,'
      '                                                   :FAO,'
      '                                                   :Details)')
    Left = 32
    Top = 296
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Code'
      end
      item
        Name = 'FAO'
      end
      item
        Name = 'Details'
      end>
  end
  object UpEnqLinePartSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into EnquiryLinePart_Detail (enquiry,'
      '                                               Line,'
      '                                               Part_No,'
      '                                               Heading,'
      '                                               Same_as_part,'
      '                                               Paper_Brand,'
      '                                               Paper_Material,'
      '                                               Paper_Weight,'
      '                                               Paper_Colour,'
      '                                               Face_inks,'
      '                                               Reverse_inks,'
      '                                               Left_Margin_type,'
      
        '                                               Left_Margin_Width' +
        ','
      
        '                                               Right_Margin_Type' +
        ','
      
        '                                               Right_Margin_Widt' +
        'h,'
      
        '                                               No_of_Plate_chang' +
        'es,'
      '                                               Part_Description)'
      'values                                    (:enquiry,'
      '                                               :line,'
      '                                               :Part,'
      '                                               :Heading,'
      '                                               :Same_as,'
      '                                               :Brand,'
      '                                               :Material,'
      '                                               :Weight,'
      '                                               :Colour,'
      '                                               :Face,'
      '                                               :Reverse,'
      '                                               :L_Type,'
      '                                               :L_Width,'
      '                                               :R_Type,'
      '                                               :R_Width,'
      '                                               :Plates,'
      
        '                                               :Part_Description' +
        ')'
      ' ')
    Left = 128
    Top = 216
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Heading'
        DataType = ftString
      end
      item
        Name = 'Same_as'
      end
      item
        Name = 'Brand'
        DataType = ftString
      end
      item
        Name = 'Material'
        DataType = ftString
      end
      item
        Name = 'Weight'
        DataType = ftString
      end
      item
        Name = 'Colour'
        DataType = ftString
      end
      item
        Name = 'Face'
        DataType = ftString
      end
      item
        Name = 'Reverse'
        DataType = ftString
      end
      item
        Name = 'L_Type'
        DataType = ftString
      end
      item
        Name = 'L_Width'
        DataType = ftString
      end
      item
        Name = 'R_Type'
        DataType = ftString
      end
      item
        Name = 'R_Width'
        DataType = ftString
      end
      item
        Name = 'Plates'
      end
      item
        Name = 'Part_Description'
      end>
  end
  object UpCompanySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Company'
      'set Last_Enquiry_Number = Last_Enquiry_Number + 1')
    Left = 132
    Top = 122
  end
  object GetCompanySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Last_Enquiry_Number'
      'from Company')
    Left = 268
    Top = 186
  end
  object DelEnqSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'delete from enquiry where enquiry = :enquiry;')
    Left = 208
    Top = 160
    ParamData = <
      item
        Name = 'enquiry'
        DataType = ftInteger
      end>
  end
  object AddEnqSupplierSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Supplier_Enquiry (Enquiry,'
      '                                            Line,'
      '                                            Supplier,'
      '                                            Branch_No,'
      '                                            Contact_no,'
      '                                            Printed_Enquiry,'
      '                                            Run_on_Quantity)'
      'values                                 (:Enquiry,'
      '                                            :Line,'
      '                                            :Supplier,'
      '                                            :Branch,'
      '                                            :Contact_no,'
      '                                            '#39'N'#39','
      '                                            :Run_on_Quantity)')
    Left = 132
    Top = 170
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Contact_no'
        DataType = ftInteger
      end
      item
        Name = 'Run_on_Quantity'
      end>
  end
  object DelEnqLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from EnquiryLine where enquiry = :Enquiry')
    Left = 216
    Top = 208
    ParamData = <
      item
        Name = 'Enquiry'
      end>
  end
  object DelEnqLineQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Enquiry_LineQuantity where enquiry = :enquiry')
    Left = 272
    Top = 160
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object DelEnqQStSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from enquiry_Questions where enquiry = :Enquiry')
    Left = 288
    Top = 160
    ParamData = <
      item
        Name = 'Enquiry'
      end>
  end
  object DelEnqLineAddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from EnquiryLineAdditionl_Dtls where enquiry = :enquiry')
    Left = 336
    Top = 160
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object DelEnqPartSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete'
      'from enquiryLinePart_Detail'
      'where enquiry = :enquiry')
    Left = 696
    Top = 272
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object DelEnqCapSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from EnquiryLinPrdct_typCpblty where enquiry = :enquiry')
    Left = 400
    Top = 160
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object DelEnqSuppSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Supplier_Enquiry where enquiry = :enquiry')
    Left = 400
    Top = 208
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object DelEnqSuppQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Supplier_EnquiryQty where enquiry = :enquiry')
    Left = 472
    Top = 160
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object DelEnqSuppAddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Supp_Enq_add_Charge where Enquiry = :Enquiry')
    Left = 528
    Top = 184
    ParamData = <
      item
        Name = 'Enquiry'
      end>
  end
  object GetLastNarrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Narrative) as Last_Code'
      'From Narrative_Line'
      '')
    Left = 48
    Top = 152
  end
  object AddNarrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Narrative_Line'
      
        '(Narrative, Narrative_Line, Narrative_Text, Narrative_Line_Updat' +
        'ed)'
      'Values'
      '(:Narrative, :Narrative_Line, :Narrative_Text, '#39'Y'#39')'
      '')
    Left = 184
    Top = 120
    ParamData = <
      item
        Name = 'Narrative'
      end
      item
        Name = 'Narrative_Line'
      end
      item
        Name = 'Narrative_Text'
        DataType = ftString
      end>
  end
  object AddEnqLineSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into EnquiryLine'
      '    (enquiry,'
      '     line,'
      '     Form_Description,'
      '     No_of_parts,'
      '     NCR_OTC_Mix,'
      '     Depth,'
      '     Depth_Unit,'
      '     Width,'
      '     Width_Unit,'
      '     Artwork_Instructions,'
      '     Forms_per_Box,'
      '     No_of_Plates,'
      '     Product_Type,'
      '     Enquiry_Status,'
      '     Req_Response_Date,'
      '     Printed_Quotation,'
      '     Enq_inactive,'
      '     Enq_inactive_reason,'
      '     Firm_Order,'
      #9#9' Narrative,'
      '     Form_Reference,'
      '     Run_on_Quantity,'
      '     job_type)'
      'values'
      '    (:Enquiry,'
      '     :Line,'
      '     :Desc,'
      '     :Parts,'
      '     :NCR,'
      '     :Depth,'
      '     :D_Unit,'
      '     :Width,'
      '     :W_Unit,'
      '     :Artwork,'
      '     :Forms,'
      '     :Plates,'
      '     :Product,'
      '     :Status,'
      '     :Response,'
      '     '#39'N'#39','
      '     '#39'N'#39','
      '     null,'
      '     :Firm_Order,'
      '     :Narrative,'
      '     :Form_Reference,'
      '     :Run_on_Quantity,'
      '     :job_type)'
      '     '
      ' ')
    Left = 240
    Top = 128
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Desc'
      end
      item
        Name = 'Parts'
      end
      item
        Name = 'NCR'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'D_Unit'
      end
      item
        Name = 'Width'
      end
      item
        Name = 'W_Unit'
      end
      item
        Name = 'Artwork'
      end
      item
        Name = 'Forms'
      end
      item
        Name = 'Plates'
      end
      item
        Name = 'Product'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'Response'
      end
      item
        Name = 'Firm_Order'
      end
      item
        Name = 'Narrative'
      end
      item
        Name = 'Form_Reference'
        DataType = ftInteger
      end
      item
        Name = 'Run_on_Quantity'
      end
      item
        Name = 'job_type'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DelEnqSupplierSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Supplier_Enquiry'
      'where Enquiry = :Enquiry and'
      #9#9#9'Line = :Line and'
      '        Supplier = :Supplier and'
      '        Branch_no = :Branch_no')
    Left = 340
    Top = 154
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object DelAllEnqSuppQtysSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Supplier_EnquiryQty'
      'where '#9'Enquiry = :Enquiry and'
      #9#9#9'Line = :Line and'
      '        Supplier = :Supplier and'
      '        Branch_no = :Branch_no')
    Left = 348
    Top = 178
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object CheckEnqSuppSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Supplier_Enquiry'
      'where Enquiry = :Enquiry and'
      #9#9#9'Line = :Line and'
      '        Supplier = :Supplier and'
      '        Branch_no = :Branch_no')
    Left = 444
    Top = 146
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object CheckEnqSuppQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Supplier_EnquiryQty'
      'where Enquiry = :Enquiry and'
      #9#9#9'Line = :Line and'
      '        Supplier = :Supplier and'
      '        Branch_no = :Branch_no and'
      '        Quantity = :Quantity')
    Left = 460
    Top = 170
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Quantity'
      end>
  end
  object CheckEnqQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Enquiry_LineQuantity'
      'where Enquiry = :Enquiry and'
      #9#9#9'Line = :Line and'
      '        Quantity = :Quantity')
    Left = 512
    Top = 168
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Quantity'
      end>
  end
  object PaperDetailSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from')
    Left = 240
    Top = 356
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    Left = 616
    Top = 128
  end
  object DelEnqOneSuppAddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Supp_enq_Add_Charge'
      'where Enquiry = :Enquiry and'
      'Line = :Line and'
      'Supplier = :Supplier and'
      'Branch_no = :Branch_no')
    Left = 560
    Top = 184
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object UpEnqSupplierSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_Enquiry'
      'set Contact_No = :Contact_no, '
      'Run_on_quantity = :Run_on_Quantity'
      'where '
      'Enquiry = :Enquiry and'
      'Line = :Line and'
      'Supplier = :Supplier and'
      'Branch_no = :Branch')
    Left = 536
    Top = 264
    ParamData = <
      item
        Name = 'Contact_no'
        DataType = ftInteger
      end
      item
        Name = 'Run_on_Quantity'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end>
  end
  object QuestListSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Product_TypeQList'
      'where Product_Type = :Product_Type and '
      'Question = :Question')
    Left = 272
    Top = 304
    ParamData = <
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Question'
      end>
  end
  object OptionsSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * '
      'from Product_TypeOChg'
      'where Product_Type = :Product')
    Left = 624
    Top = 280
    ParamData = <
      item
        Name = 'Product'
      end>
  end
  object UpEnqLineOptSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into EnquiryLineProduct_TypeOChg (enquiry,'
      '                                                      Line,'
      
        '                                                      Product_Ty' +
        'pe,'
      
        '                                                      Optional_C' +
        'harge)'
      'values                                           (:enquiry,'
      '                                                      :Line,'
      '                                                      :Product,'
      
        '                                                      :Optional_' +
        'Charge)')
    Left = 472
    Top = 320
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Product'
      end
      item
        Name = 'Optional_Charge'
      end>
  end
  object DelEnqOptSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from EnquiryLineProduct_TypeOChg where enquiry = :enquiry')
    Left = 472
    Top = 384
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object AddEnqSuppOChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Supp_Enq_Add_charge'
      'values (:Supplier, '
      '            :Branch_no, '
      '            :Enquiry, '
      '            :Line, '
      '            :Additional_Charge, '
      '            :Details, '
      '            0.00, '
      '            0.00,'
      '            '#39'O'#39')  ')
    Left = 380
    Top = 346
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Additional_Charge'
      end
      item
        Name = 'Details'
      end>
  end
  object GetLastAddChgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Max(Additional_Charge) as Last_Charge_Number'
      'from Supp_Enq_Add_charge'
      'where Supplier = :Supplier and'
      'Branch_no = :Branch_No and'
      'Enquiry = :Enquiry and'
      'Line = :Line')
    Left = 68
    Top = 362
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object CheckEnqSuppOChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Supp_Enq_Add_charge'
      'where Supplier = :Supplier and'
      'Branch_no = :Branch_no and'
      'Enquiry = :Enquiry and'
      'Line = :Line and'
      'Details = :Details')
    Left = 140
    Top = 354
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Details'
      end>
  end
  object DelEnqSuppOChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Supp_Enq_Add_charge'
      'where Supplier = :Supplier and'
      'Branch_no = :Branch_no and'
      'Enquiry = :Enquiry and'
      'Line = :Line and'
      'Details = :Details')
    Left = 292
    Top = 410
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Details'
      end>
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 341
    Top = 354
  end
  object qryGetLooseEnqLineQtys: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select quantity from enquiry_linequantity'
      'where enquiry = :enquiry '
      'and line = :line '
      '')
    Left = 404
    Top = 298
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object qryDelEnqLineParts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from enquirylinepart_detail '
      'where enquiry = :enquiry '
      'and line = :line '
      'and part_no > :part_no')
    Left = 700
    Top = 308
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'part_no'
      end>
  end
  object qryGetActiveCustomerContact: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT Customer_Contact.Customer,'
      '        Customer_Contact.Branch_no,'
      '        Customer_Contact.Contact_no'
      'FROM Customer_Contact'
      'WHERE Customer_Contact.Customer = :Customer AND'
      '      Customer_Contact.Branch_no = :Branch_no AND'
      '      Customer_Contact.Contact_no = :Contact_no AND'
      '      ((inactive IS NULL) OR (inactive = '#39'N'#39'))')
    Left = 944
    Top = 600
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object custreps: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT Customer , Branch_no , Reps_Branches.Rep , Rep.Rep , '
      'Name, Is_Main_Rep'
      'FROM Reps_Branches Reps_Branches , Rep Rep'
      'WHERE ( Reps_Branches.Rep = Rep.Rep )'
      '  AND'
      ' ('
      ' ( ( Customer = :custid ) AND'
      '  ( Branch_no = :branchid ) )'
      ' )')
    Left = 652
    Top = 26
    ParamData = <
      item
        Name = 'custid'
        DataType = ftInteger
      end
      item
        Name = 'branchid'
        DataType = ftInteger
      end>
  end
  object QCustomer: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select name '
      'from Customer_branch '
      'where customer = :customer and branch_no = :branch_no')
    Left = 153
    Top = 18
    ParamData = <
      item
        Name = 'customer'
        DataType = ftInteger
      end
      item
        Name = 'branch_no'
        DataType = ftInteger
      end>
  end
  object ContactSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Select Contact_No, Name'
      'From Customer_Contact'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch) and'
      
        '      ((Inactive = '#39'N'#39') or (Inactive is NULL) or (Contact_no = :' +
        'Contact_no))'
      'Order by Customer_Contact.Name'
      '')
    Left = 240
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object AddEnqSuppQtySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Supplier_EnquiryQty (Enquiry,'
      '                                                  Line,'
      '                                                  Quantity,'
      '                                                  Supplier,'
      '                                                  Branch_no,'
      
        '                                                  Response_Quant' +
        'ity,'
      
        '                                                  Price_Selected' +
        ')'
      'values                                       (:enquiry,'
      '                                                  :Line,'
      '                                                  :Qty,'
      '                                                  :Supplier,'
      '                                                  :Branch,'
      '                                                  :Qty,'
      '                                                  '#39'N'#39')')
    Left = 500
    Top = 66
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Qty'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Qty'
      end>
  end
  object CustRepSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Reps_branches.*, Name as Rep_Name'
      'from Reps_branches, Rep'
      'where '
      '('
      '(Customer = :Customer) and '
      '(Branch_No = :Branch)'
      ') AND'
      '(Reps_branches.Rep = Rep.Rep)')
    Left = 424
    Top = 8
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch'
        DataType = ftInteger
      end>
  end
  object OperatorSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from operator')
    Left = 480
    Top = 264
  end
  object AddEnqHeaderSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Enquiry (enquiry,'
      '                       Date_Point, '
      '                       Operator, '
      '                       Cust_Est_Contact, '
      '                       Quote_Required_By,'
      '                       Customer,'
      '                       Branch_No,'
      '                       Description,'
      '                       Rep,'
      '                       Enquiry_Status,'
      '                       Enq_inactive,'
      '                       Office_Contact,'
      '                       Contact_no,'
      '                       Prospect_Quote)'
      'values            (:Enquiry,'
      '                       :Enq_Date,'
      '                       :Operator,'
      '                       :Contact,'
      '                       :Req_Date,'
      '                       :Customer,'
      '                       :Branch_No,'
      '                       :Desc,'
      '                       :Rep,'
      '                       :Status,'
      '                       '#39'N'#39','
      '                       :Office_Contact,'
      '                       :Contact_no,'
      '                       :Prospect_Quote)'
      '                       ')
    Left = 240
    Top = 80
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Enq_Date'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Contact'
      end
      item
        Name = 'Req_Date'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Desc'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Prospect_Quote'
      end>
  end
  object UpEnqLineSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update EnquiryLine'
      'set Form_Description=:Desc,'
      '    No_of_parts=:Parts,'
      '    NCR_OTC_Mix=:NCR,'
      '    Depth=:Depth,'
      '    Depth_Unit=:D_unit,'
      '    Width=:Width,'
      '    Width_Unit=:W_Unit,'
      '    Artwork_Instructions=:Artwork,'
      '    Forms_per_Box=:Forms,'
      '    No_of_Plates=:Plates,'
      '    Product_Type=:Product,'
      '    Enquiry_Status=:Status,'
      '    Req_Response_Date=:Response,'
      '    Firm_Order=:Firm_Order,'
      '    Narrative=:Narrative,'
      '    Form_Reference=:Form_Reference,'
      '    Run_on_Quantity = :Run_on_Quantity,'
      '    job_type = :job_type'
      'where '#9'Enquiry = :Enquiry and'
      '    Line = :Line'
      ' '
      ' ')
    Left = 48
    Top = 192
    ParamData = <
      item
        Name = 'Desc'
      end
      item
        Name = 'Parts'
      end
      item
        Name = 'NCR'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'D_unit'
      end
      item
        Name = 'Width'
      end
      item
        Name = 'W_Unit'
      end
      item
        Name = 'Artwork'
      end
      item
        Name = 'Forms'
      end
      item
        Name = 'Plates'
      end
      item
        Name = 'Product'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'Response'
      end
      item
        Name = 'Firm_Order'
      end
      item
        Name = 'Narrative'
      end
      item
        Name = 'Form_Reference'
        DataType = ftInteger
      end
      item
        Name = 'Run_on_Quantity'
      end
      item
        Name = 'job_type'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object UpEnqHeaderSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Enquiry'
      'set Date_Point=:Enq_Date,'
      '    Operator=:Operator,'
      '    Cust_Est_Contact=:Contact,'
      '    Quote_Required_By=:Req_Date,'
      '    Customer=:Customer,'
      '    Branch_No=:Branch_no,'
      '    Description=:Desc,'
      '    Rep=:Rep,'
      '    Enquiry_Status=:Status,'
      '    Enq_inactive='#39'N'#39','
      #9'  Office_Contact=:Office_Contact,'
      '    Contact_no=:Contact_no,'
      '    Prospect_Quote = :Prospect_Quote'
      'where Enquiry = :Enquiry')
    Left = 56
    Top = 200
    ParamData = <
      item
        Name = 'Enq_Date'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Contact'
      end
      item
        Name = 'Req_Date'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Desc'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Prospect_Quote'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object GetEnqSupplierSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Supplier, Branch_no, Quantity, Enquiry, Line'
      'from Supplier_EnquiryQty'
      'where Enquiry = :Enquiry and'
      #9#9#9'Line = :Line'
      'order by Supplier, Branch_no, Quantity')
    Left = 468
    Top = 98
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object DelEnqSupplierQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Supplier_EnquiryQty'
      'where Enquiry = :Enquiry and'
      #9#9#9'Line = :Line and'
      '        Supplier = :Supplier and'
      '        Branch_no = :Branch_no and'
      '        Quantity = :Quantity')
    Left = 340
    Top = 122
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Quantity'
      end>
  end
  object DelEnqQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Enquiry_LineQuantity'
      'where Enquiry = :Enquiry and'
      #9#9#9'Line = :Line and'
      '        Quantity = :Quantity')
    Left = 460
    Top = 218
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Quantity'
      end>
  end
  object qryProductType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 432
    Top = 112
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 288
    Top = 56
  end
  object oldCapabilitySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * '
      'from Product_TypeCapability'
      'where Product_Type = :Product'
      'order by Description')
    Left = 696
    Top = 96
    ParamData = <
      item
        Name = 'Product'
      end>
  end
end
