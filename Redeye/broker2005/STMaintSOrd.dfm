object STMaintSOrdFrm: TSTMaintSOrdFrm
  Left = -2
  Top = 4
  Caption = 'Maintain Sales Orders'
  ClientHeight = 541
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 808
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 53
      Height = 15
      Caption = 'Order No.'
    end
    object Label8: TLabel
      Left = 360
      Top = 16
      Width = 80
      Height = 15
      Caption = 'Required Date'
    end
    object Label9: TLabel
      Left = 576
      Top = 16
      Width = 48
      Height = 15
      Caption = 'Operator'
    end
    object OrdNoLabel: TLabel
      Left = 64
      Top = 16
      Width = 75
      Height = 15
      Caption = 'order number'
    end
    object Label2: TLabel
      Left = 152
      Top = 16
      Width = 60
      Height = 15
      Caption = 'Order Date'
    end
    object DateEdit: TEdit
      Left = 224
      Top = 8
      Width = 81
      Height = 23
      MaxLength = 30
      TabOrder = 0
      OnExit = DateEditExit
    end
    object DateBitBtn: TBitBtn
      Left = 312
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
      TabOrder = 1
      OnClick = DateBitBtnClick
    end
    object DtReqEdit: TEdit
      Left = 448
      Top = 8
      Width = 81
      Height = 23
      MaxLength = 30
      TabOrder = 2
      OnExit = DtReqEditExit
    end
    object DtReqBitBtn: TBitBtn
      Left = 536
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
      TabOrder = 3
      OnClick = DtReqBitBtnClick
    end
    object OfficeComboBox: TDBLookupComboBox
      Left = 632
      Top = 8
      Width = 145
      Height = 23
      KeyField = 'Operator'
      ListField = 'Name'
      ListSource = STSalesOrdDM.OperatorSRC
      TabOrder = 4
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 508
    Width = 792
    Height = 33
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      792
      33)
    object OKBitBtn: TBitBtn
      Left = 1293
      Top = 5
      Width = 76
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Save'
      Default = True
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
        7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
        7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
        7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
        00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
        007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
        00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
        7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
        7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
        7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
        007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
        FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
        7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
        00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 1381
      Top = 5
      Width = 76
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
        7F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F0000FF7F7F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF007F7F
        007F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F00
        00FF00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        FFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7FFFFFFF7F7F7F7F7F7FFFFF
        FF007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00
        007F7F7F7F007F7F0000FF00007F00007F00007F00007F7F7F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7FFFFF
        FF7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F00
        7F7F0000FF00007F00007F00007F00007F7F7F7F00007F00007F00007F00007F
        00007F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F
        7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF00
        7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00007F
        00007F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F00
        7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        0000FF00007F00007F00007F00007F00007F00007F7F7F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F00
        7F7F007F7F007F7F007F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F00007F00007F00007F00007F00007F7F7F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
        7F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F0000FF00007F00007F00007F00007F00007F7F7F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F7F7F7F00007F00
        007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00
        007F7F7F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F0000FF00007F00007F7F7F7F007F7F007F7F007F7F0000FF00007F00007F
        00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F007F7F007F7F007F7F
        007F7F007F7F0000FF00007F00007F00007F007F7F007F7F007F7F007F7F007F
        7F007F7F7F7F7FFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F7F7F7FFFFFFF00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F0000FF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F00
        7F7F007F7F007F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = CancelBitBtnClick
    end
    object NotesBitBtn: TBitBtn
      Left = 8
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Notes'
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
      TabOrder = 2
      OnClick = NotesBitBtnClick
    end
  end
  object pnlAddCharges: TPanel
    Left = 0
    Top = 396
    Width = 792
    Height = 112
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      792
      112)
    object Label10: TLabel
      Left = 1256
      Top = 24
      Width = 93
      Height = 15
      Anchors = [akTop, akRight]
      Caption = 'Total Order Value'
      ExplicitLeft = 584
    end
    object Label16: TLabel
      Left = 3
      Top = 3
      Width = 105
      Height = 15
      Caption = 'Additional Charges'
    end
    object memoTotal: TMemo
      Left = 1360
      Top = 16
      Width = 97
      Height = 23
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Color = clBtnFace
      Lines.Strings = (
        'memoTotal')
      ReadOnly = True
      TabOrder = 0
      WantReturns = False
      WordWrap = False
    end
    object ExtChgDetsStringGrid: TStringGrid
      Left = 8
      Top = 23
      Width = 509
      Height = 82
      ColCount = 4
      DefaultRowHeight = 18
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      PopupMenu = ExtChgMenu
      TabOrder = 1
      OnDblClick = ExtChgDetsStringGridDblClick
      OnDrawCell = ExtChgDetsStringGridDrawCell
      OnSelectCell = ExtChgDetsStringGridSelectCell
      ColWidths = (
        202
        96
        91
        96)
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 355
    Align = alClient
    Caption = 'pnlDetails'
    TabOrder = 3
    object pnlLines: TPanel
      Left = 1
      Top = 145
      Width = 790
      Height = 209
      Align = alClient
      TabOrder = 0
      object LineDetsStringGrid: TStringGrid
        Left = 1
        Top = 1
        Width = 788
        Height = 207
        Align = alClient
        ColCount = 8
        DefaultRowHeight = 20
        RowCount = 10
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = pMnuMaint
        TabOrder = 0
        OnDblClick = LineDetsStringGridDblClick
        OnDrawCell = LineDetsStringGridDrawCell
        OnKeyUp = LineDetsStringGridKeyUp
        OnSelectCell = LineDetsStringGridSelectCell
        ColWidths = (
          38
          159
          266
          70
          74
          66
          73
          74)
      end
    end
    object pnlHead: TPanel
      Left = 1
      Top = 1
      Width = 790
      Height = 144
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        790
        144)
      object Label3: TLabel
        Left = 8
        Top = 14
        Width = 55
        Height = 15
        Caption = 'Customer'
      end
      object Label6: TLabel
        Left = 8
        Top = 42
        Width = 42
        Height = 15
        Caption = 'Contact'
      end
      object Label11: TLabel
        Left = 420
        Top = 38
        Width = 56
        Height = 15
        Caption = 'Delivery to'
      end
      object Label12: TLabel
        Left = 8
        Top = 71
        Width = 66
        Height = 15
        Caption = 'Cost Centre'
      end
      object Label13: TLabel
        Left = 8
        Top = 98
        Width = 48
        Height = 15
        Caption = 'Cust Ref'
      end
      object Label7: TLabel
        Left = 9
        Top = 124
        Width = 23
        Height = 15
        Caption = 'Rep'
      end
      object Label1: TLabel
        Left = 390
        Top = 71
        Width = 85
        Height = 15
        Caption = 'Replenish Type'
      end
      object Label17: TLabel
        Left = 400
        Top = 8
        Width = 74
        Height = 15
        Caption = 'Address Type'
      end
      object CustNameEdit: TEdit
        Left = 78
        Top = 6
        Width = 257
        Height = 23
        TabStop = False
        Color = clBtnFace
        MaxLength = 30
        ReadOnly = True
        TabOrder = 6
        OnChange = CustNameEditChange
      end
      object CustBitBtn: TBitBtn
        Left = 344
        Top = 4
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = CustBitBtnClick
      end
      object ContactEdit: TEdit
        Left = 78
        Top = 34
        Width = 257
        Height = 23
        TabStop = False
        Color = clBtnFace
        MaxLength = 40
        ReadOnly = True
        TabOrder = 7
      end
      object SelContactBtn: TButton
        Left = 344
        Top = 32
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = SelContactBtnClick
      end
      object CstCntrEdit: TEdit
        Left = 78
        Top = 63
        Width = 185
        Height = 23
        TabOrder = 2
      end
      object CstCntrBitBtn: TBitBtn
        Left = 280
        Top = 61
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = CstCntrBitBtnClick
      end
      object OrdEdit: TEdit
        Left = 78
        Top = 90
        Width = 227
        Height = 23
        TabOrder = 4
        OnChange = OrdEditChange
      end
      object dbLkpCmbRep: TDBLookupComboBox
        Left = 78
        Top = 116
        Width = 227
        Height = 23
        KeyField = 'Rep'
        ListField = 'Name'
        ListSource = STSalesOrdDM.RepSRC
        TabOrder = 5
        OnClick = dbLkpCmbRepClick
      end
      object DeliveryBitBtn: TBitBtn
        Left = 1424
        Top = 28
        Width = 25
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = DeliveryBitBtnClick
      end
      object DeliveryEdit: TEdit
        Left = 486
        Top = 30
        Width = 257
        Height = 23
        TabStop = False
        Color = clBtnFace
        MaxLength = 30
        ReadOnly = True
        TabOrder = 9
        OnChange = CustNameEditChange
      end
      object dblkpReplType: TDBLookupComboBox
        Left = 486
        Top = 63
        Width = 222
        Height = 23
        KeyField = 'Replenish_Source'
        ListField = 'Replenish_Source_Descr'
        ListSource = STSalesOrdDM.RepSourceSRC
        TabOrder = 10
        OnClick = dblkpReplTypeClick
      end
      object pnlWarehouse: TPanel
        Left = 384
        Top = 88
        Width = 401
        Height = 49
        TabOrder = 11
        DesignSize = (
          401
          49)
        object Label14: TLabel
          Left = 2
          Top = 15
          Width = 89
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Replenish From'
        end
        object StoreComboBox: TDBLookupComboBox
          Left = 102
          Top = 7
          Width = 222
          Height = 23
          Anchors = [akTop, akRight]
          KeyField = 'Part_Store'
          ListField = 'Part_Store_Name'
          ListSource = STSalesOrdDM.StoreSRC
          TabOrder = 0
          OnClick = StoreComboBoxClick
        end
      end
      object pnlSupplier: TPanel
        Left = 104
        Top = 56
        Width = 401
        Height = 57
        TabOrder = 12
        object Label4: TLabel
          Left = 8
          Top = 12
          Width = 46
          Height = 15
          Caption = 'Supplier'
        end
        object Label15: TLabel
          Left = 8
          Top = 36
          Width = 56
          Height = 15
          Caption = 'Order type'
        end
        object edtSupplier: TEdit
          Left = 102
          Top = 4
          Width = 249
          Height = 23
          ReadOnly = True
          TabOrder = 0
        end
        object btnSupplierLU: TBitBtn
          Left = 360
          Top = 4
          Width = 25
          Height = 25
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnSupplierLUClick
        end
        object dblkpOrdertype: TDBLookupComboBox
          Left = 102
          Top = 28
          Width = 195
          Height = 23
          KeyField = 'Supp_Order_type'
          ListField = 'Supp_Order_Desc'
          ListSource = STSalesOrdDM.GetSuppOTypeSRC
          TabOrder = 2
          OnClick = dblkpOrdertypeClick
        end
      end
      object Panel1: TPanel
        Left = 486
        Top = 2
        Width = 257
        Height = 25
        BevelOuter = bvNone
        TabOrder = 13
        object RdBtnToCust: TRadioButton
          Left = 0
          Top = 6
          Width = 100
          Height = 15
          Caption = 'Customer'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RdBtnToCustClick
        end
        object RDBtnToAdHoc: TRadioButton
          Left = 112
          Top = 6
          Width = 100
          Height = 17
          Caption = 'AdHoc'
          TabOrder = 1
          OnClick = RDBtnToAdHocClick
        end
      end
    end
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 712
    Top = 104
  end
  object pMnuMaint: TPopupMenu
    OnPopup = pMnuMaintPopup
    Left = 304
    Top = 257
    object LineAddBitBtn: TMenuItem
      Caption = '&Add'
      ShortCut = 16449
      OnClick = LineAddBitBtnClick
    end
    object LineChgBitBtn: TMenuItem
      Caption = '&Change'
      ShortCut = 16451
      OnClick = LineChgBitBtnClick
    end
    object LineDelBitBtn: TMenuItem
      Caption = '&Delete'
      ShortCut = 16452
      OnClick = LineDelBitBtnClick
    end
    object btnAddService: TMenuItem
      Caption = 'Add Service item'
      ShortCut = 16457
      OnClick = btnAddServiceClick
    end
    object N1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object LineSerialNos: TMenuItem
      Caption = 'Serial numbers'
      ShortCut = 16467
      Visible = False
      OnClick = LineSerialNosClick
    end
  end
  object pMnuView: TPopupMenu
    Left = 704
    Top = 313
    object SelectBitBtn: TMenuItem
      Caption = 'Select'
      OnClick = SelectBitBtnClick
    end
  end
  object ExtChgMenu: TPopupMenu
    OnPopup = ExtChgMenuPopup
    Left = 256
    Top = 473
    object ChrgAddBitBtn: TMenuItem
      Caption = '&Add'
      ShortCut = 16449
      OnClick = ChrgAddBitBtnClick
    end
    object ChrgChgBitBtn: TMenuItem
      Caption = '&Change'
      ShortCut = 16451
      OnClick = ChrgChgBitBtnClick
    end
    object ChrgDelBitBtn: TMenuItem
      Caption = '&Delete'
      ShortCut = 16452
      OnClick = ChrgDelBitBtnClick
    end
  end
end
