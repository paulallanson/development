object PBEnqSuppRespnsFrm: TPBEnqSuppRespnsFrm
  Left = 312
  Top = 123
  AutoScroll = False
  Caption = 'Supplier Response'
  ClientHeight = 427
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlPriceGrid: TPanel
    ParentBackground = False
    Left = 0
    Top = 274
    Width = 543
    Height = 153
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      543
      153)
    object lblRunOn: TLabel
      Left = 16
      Top = 125
      Width = 46
      Height = 15
      Caption = 'Run-On:'
    end
    object strgrdPrices: TStringGrid
      Left = 72
      Top = 8
      Width = 465
      Height = 97
      Anchors = [akLeft, akTop, akRight]
      ColCount = 2
      DefaultColWidth = 90
      RowCount = 3
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnSelectCell = strgrdPricesSelectCell
      OnSetEditText = strgrdPricesSetEditText
    end
    object edtRunOn: TEdit
      Left = 72
      Top = 121
      Width = 121
      Height = 23
      TabOrder = 1
      Text = 'edtRunOn'
      OnChange = edtRunOnChange
      OnKeyPress = edtRunOnKeyPress
    end
    object cmbbxPriceUnit: TDBLookupComboBox
      Left = 200
      Top = 120
      Width = 145
      Height = 23
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = PBEnqDM.PriceUnitSRC
      TabOrder = 2
      Visible = False
      OnCloseUp = cmbbxPriceUnitCloseUp
    end
    object BitBtn2: TBitBtn
      Left = 463
      Top = 120
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 3
      Kind = bkClose
    end
    object btbtnAddQuantity: TBitBtn
      Left = 40
      Top = 8
      Width = 23
      Height = 25
      Hint = 'Insert a new quantity.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btbtnAddQuantityClick
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
    end
  end
  object pnlTop: TPanel
    ParentBackground = False
    Left = 0
    Top = 41
    Width = 543
    Height = 233
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlHeader: TPanel
      ParentBackground = False
      Left = 0
      Top = 0
      Width = 241
      Height = 233
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object pnlHeaderTop: TPanel
        ParentBackground = False
        Left = 0
        Top = 0
        Width = 241
        Height = 97
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblContact: TLabel
          Left = 16
          Top = 8
          Width = 45
          Height = 15
          Caption = 'Contact:'
        end
        object lblRespDate: TLabel
          Left = 32
          Top = 40
          Width = 29
          Height = 15
          Caption = 'Date:'
        end
        object lblSuppRef: TLabel
          Left = 40
          Top = 66
          Width = 22
          Height = 15
          Caption = 'Ref:'
        end
        object dtpckrRespDate: TDateTimePicker
          Left = 72
          Top = 36
          Width = 153
          Height = 23
          Date = 37497.394036342600000000
          Time = 37497.394036342600000000
          TabOrder = 0
          OnChange = dtpckrRespDateChange
        end
        object edtRef: TEdit
          Left = 72
          Top = 62
          Width = 153
          Height = 23
          TabOrder = 1
          Text = 'edtRef'
          OnChange = edtRefChange
        end
        object cmbbxContact: TDBLookupComboBox
          Left = 72
          Top = 8
          Width = 153
          Height = 23
          KeyField = 'Contact_no'
          ListField = 'Name'
          ListSource = PBEnqDM.dtsrcSuppBrnchConts
          TabOrder = 2
          OnClick = cmbbxContactClick
        end
      end
      object pnlHeaderLeft: TPanel
        ParentBackground = False
        Left = 0
        Top = 97
        Width = 65
        Height = 136
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object lblDelComm2: TLabel
          Left = 6
          Top = 20
          Width = 58
          Height = 15
          Caption = 'Comment:'
        end
        object lblDelComm1: TLabel
          Left = 16
          Top = 4
          Width = 43
          Height = 15
          Caption = 'Delivery'
        end
      end
      object pnlDelComm: TPanel
        ParentBackground = False
        Left = 65
        Top = 97
        Width = 176
        Height = 136
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          176
          136)
        object mmDelComm: TMemo
          Left = 8
          Top = 0
          Width = 153
          Height = 122
          Anchors = [akLeft, akTop, akRight, akBottom]
          Lines.Strings = (
            'mmDelComm')
          TabOrder = 0
          OnChange = mmDelCommChange
        end
      end
    end
    object pnlExChrgs: TPanel
      ParentBackground = False
      Left = 241
      Top = 0
      Width = 302
      Height = 233
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        302
        233)
      object lblExCharges: TLabel
        Left = 16
        Top = 8
        Width = 81
        Height = 15
        Caption = 'Extra Charges:'
      end
      object strgrdExChrgs: TStringGrid
        Left = 16
        Top = 32
        Width = 274
        Height = 160
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 3
        RowCount = 2
        TabOrder = 0
      end
      object pnlExChrgBtns: TPanel
        ParentBackground = False
        Left = 0
        Top = 192
        Width = 302
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          302
          41)
        object Label2: TLabel
          Left = 113
          Top = 12
          Width = 53
          Height = 15
          Anchors = [akRight, akBottom]
          Caption = 'Ex Chrgs:'
        end
        object edtExChrgs: TEdit
          Left = 173
          Top = 8
          Width = 89
          Height = 23
          Anchors = [akRight, akBottom]
          TabOrder = 0
        end
        object btnExCharges: TButton
          Left = 269
          Top = 8
          Width = 25
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnExChargesClick
        end
      end
    end
  end
  object pnlSupplier: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 543
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblSupplierlbl: TLabel
      Left = 8
      Top = 12
      Width = 49
      Height = 15
      Caption = 'Supplier:'
    end
    object cmbbxSupplierList: TComboBox
      Left = 72
      Top = 8
      Width = 393
      Height = 23
      ItemHeight = 15
      TabOrder = 0
      Text = 'cmbbxSupplierList'
      OnChange = cmbbxSupplierListChange
    end
    object btnPrevSupp: TBitBtn
      Left = 478
      Top = 7
      Width = 25
      Height = 25
      TabOrder = 1
      OnClick = btnPrevSuppClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
        3333333333777F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
        3333333777737777F333333099999990333333373F3333373333333309999903
        333333337F33337F33333333099999033333333373F333733333333330999033
        3333333337F337F3333333333099903333333333373F37333333333333090333
        33333333337F7F33333333333309033333333333337373333333333333303333
        333333333337F333333333333330333333333333333733333333}
      NumGlyphs = 2
    end
    object btbtnNextSupp: TBitBtn
      Left = 504
      Top = 7
      Width = 25
      Height = 25
      TabOrder = 2
      OnClick = btbtnNextSuppClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337F33333333333333033333333333333373F333333333333090333
        33333333337F7F33333333333309033333333333337373F33333333330999033
        3333333337F337F33333333330999033333333333733373F3333333309999903
        333333337F33337F33333333099999033333333373333373F333333099999990
        33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333300033333333333337773333333}
      NumGlyphs = 2
    end
  end
end
