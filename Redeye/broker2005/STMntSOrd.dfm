object STMntSOrdFrm: TSTMntSOrdFrm
  Left = 208
  Top = 56
  Caption = 'Maintain Sales Orders'
  ClientHeight = 534
  ClientWidth = 794
  Color = clBtnFace
  Constraints.MinHeight = 570
  Constraints.MinWidth = 800
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 61
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      794
      61)
    object Label5: TLabel
      Left = 8
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Order No.'
    end
    object Label8: TLabel
      Left = 356
      Top = 12
      Width = 69
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Required Date'
      ExplicitLeft = 368
    end
    object OrdNoLabel: TLabel
      Left = 80
      Top = 12
      Width = 62
      Height = 13
      Caption = 'order number'
    end
    object Label2: TLabel
      Left = 176
      Top = 12
      Width = 52
      Height = 13
      Caption = 'Order Date'
    end
    object Label18: TLabel
      Left = 8
      Top = 36
      Width = 53
      Height = 13
      Caption = 'Order Type'
    end
    object lblJobBagCaption: TLabel
      Left = 224
      Top = 36
      Width = 42
      Height = 13
      Caption = 'Job Bag:'
      Visible = False
    end
    object lblJobBagNo: TLabel
      Left = 280
      Top = 36
      Width = 60
      Height = 13
      Caption = 'lblJobBagNo'
      Visible = False
    end
    object Label20: TLabel
      Left = 564
      Top = 12
      Width = 41
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Operator'
      ExplicitLeft = 576
    end
    object DateEdit: TEdit
      Left = 240
      Top = 8
      Width = 81
      Height = 21
      MaxLength = 30
      TabOrder = 0
      OnExit = DateEditExit
    end
    object DateBitBtn: TBitBtn
      Left = 328
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
      Left = 436
      Top = 8
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 30
      TabOrder = 2
      OnExit = DtReqEditExit
    end
    object DtReqBitBtn: TBitBtn
      Left = 524
      Top = 6
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
      TabOrder = 3
      OnClick = DtReqBitBtnClick
    end
    object cmbbxOrderType: TComboBox
      Left = 80
      Top = 32
      Width = 137
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      OnChange = cmbbxOrderTypeChange
      Items.Strings = (
        'Sales Order'
        'Job Bag Stock'
        'Web Order'
        'Destroy Notification')
    end
    object OfficeComboBox: TDBLookupComboBox
      Left = 620
      Top = 8
      Width = 153
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Operator'
      ListField = 'Name'
      ListSource = STSalesOrdDM.OperatorSRC
      TabOrder = 4
    end
    object chkbxCashSale: TCheckBox
      Left = 620
      Top = 36
      Width = 121
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Cash Sale'
      TabOrder = 6
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 482
    Width = 794
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      794
      33)
    object lblFAO: TLabel
      Left = 200
      Top = 12
      Width = 21
      Height = 13
      Caption = 'FAO'
    end
    object OKBitBtn: TBitBtn
      Left = 609
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
      Left = 697
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
    object btnDelivery: TBitBtn
      Left = 104
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Delivery'
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
      TabOrder = 3
      OnClick = btnDeliveryClick
    end
    object edtFAO: TEdit
      Left = 232
      Top = 8
      Width = 209
      Height = 21
      TabOrder = 4
      Text = 'edtFAO'
      OnChange = edtFAOChange
    end
  end
  object pnlAddCharges: TPanel
    Left = 0
    Top = 370
    Width = 794
    Height = 112
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      794
      112)
    object Label10: TLabel
      Left = 548
      Top = 20
      Width = 83
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Total Order Value'
      ExplicitLeft = 560
    end
    object Label16: TLabel
      Left = 3
      Top = 3
      Width = 88
      Height = 13
      Caption = 'Additional Charges'
    end
    object memoTotal: TMemo
      Left = 671
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
    object chkbxDoNotInvc: TCheckBox
      Left = 548
      Top = 68
      Width = 97
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Do Not Invoice'
      TabOrder = 2
      OnClick = chkbxDoNotInvcClick
    end
    object chkbxAuthorise: TCheckBox
      Left = 548
      Top = 47
      Width = 121
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Authorise Call Off'
      TabOrder = 3
      Visible = False
    end
    object chkbxInactive: TCheckBox
      Left = 548
      Top = 89
      Width = 225
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Order is inactive and has been cancelled'
      TabOrder = 4
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 61
    Width = 794
    Height = 309
    Align = alClient
    Caption = 'pnlDetails'
    ParentBackground = False
    TabOrder = 1
    object pnlLines: TPanel
      Left = 1
      Top = 145
      Width = 792
      Height = 163
      Align = alClient
      ParentBackground = False
      TabOrder = 0
      object LineDetsStringGrid: TStringGrid
        Left = 1
        Top = 1
        Width = 790
        Height = 161
        Align = alClient
        ColCount = 8
        DefaultRowHeight = 20
        RowCount = 10
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentFont = False
        PopupMenu = pMnuMaint
        TabOrder = 0
        OnDblClick = LineDetsStringGridDblClick
        OnDrawCell = LineDetsStringGridDrawCell
        OnKeyUp = LineDetsStringGridKeyUp
        OnSelectCell = LineDetsStringGridSelectCell
        ColWidths = (
          38
          225
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
      Width = 792
      Height = 144
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        792
        144)
      object Label3: TLabel
        Left = 8
        Top = 10
        Width = 44
        Height = 13
        Caption = 'Customer'
      end
      object Label6: TLabel
        Left = 8
        Top = 38
        Width = 37
        Height = 13
        Caption = 'Contact'
      end
      object Label11: TLabel
        Left = 386
        Top = 37
        Width = 78
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Delivery address'
        ExplicitLeft = 398
      end
      object Label13: TLabel
        Left = 8
        Top = 94
        Width = 41
        Height = 13
        Caption = 'Cust Ref'
      end
      object Label7: TLabel
        Left = 9
        Top = 120
        Width = 20
        Height = 13
        Caption = 'Rep'
      end
      object Label1: TLabel
        Left = 386
        Top = 67
        Width = 74
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Replenish Type'
        ExplicitLeft = 398
      end
      object Label17: TLabel
        Left = 386
        Top = 8
        Width = 45
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Deliver to'
        ExplicitLeft = 398
      end
      object pnlWarehouse: TPanel
        Left = 372
        Top = 88
        Width = 401
        Height = 49
        Anchors = [akTop, akRight]
        ParentBackground = False
        TabOrder = 12
        DesignSize = (
          401
          49)
        object Label14: TLabel
          Left = 14
          Top = 15
          Width = 73
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Replenish From'
        end
        object StoreComboBox: TDBLookupComboBox
          Left = 102
          Top = 11
          Width = 222
          Height = 21
          Anchors = [akTop, akRight]
          KeyField = 'Part_Store'
          ListField = 'Part_Store_Name'
          ListSource = STSalesOrdDM.StoreSRC
          TabOrder = 0
          OnClick = StoreComboBoxClick
        end
      end
      object CustNameEdit: TEdit
        Left = 78
        Top = 6
        Width = 245
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        MaxLength = 30
        TabOrder = 0
        OnChange = CustNameEditChange
        OnExit = CustNameEditExit
      end
      object CustBitBtn: TBitBtn
        Left = 332
        Top = 4
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
        TabOrder = 1
        TabStop = False
        OnClick = CustBitBtnClick
      end
      object ContactEdit: TEdit
        Left = 78
        Top = 34
        Width = 245
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        MaxLength = 40
        ReadOnly = True
        TabOrder = 2
      end
      object SelContactBtn: TButton
        Left = 332
        Top = 32
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
        TabOrder = 3
        OnClick = SelContactBtnClick
      end
      object OrdEdit: TEdit
        Left = 78
        Top = 90
        Width = 215
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        OnChange = OrdEditChange
      end
      object dbLkpCmbRep: TDBLookupComboBox
        Left = 78
        Top = 116
        Width = 215
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        KeyField = 'Rep'
        ListField = 'Name'
        ListSource = STSalesOrdDM.RepSRC
        TabOrder = 6
        OnClick = dbLkpCmbRepClick
      end
      object DeliveryBitBtn: TBitBtn
        Left = 740
        Top = 31
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
        TabOrder = 9
        OnClick = DeliveryBitBtnClick
      end
      object DeliveryEdit: TEdit
        Left = 474
        Top = 33
        Width = 257
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        Color = clBtnFace
        MaxLength = 30
        ReadOnly = True
        TabOrder = 8
        OnChange = CustNameEditChange
      end
      object dblkpReplType: TDBLookupComboBox
        Left = 474
        Top = 63
        Width = 222
        Height = 21
        Anchors = [akTop, akRight]
        KeyField = 'Replenish_Source'
        ListField = 'Replenish_Source_Descr'
        ListSource = STSalesOrdDM.RepSourceSRC
        TabOrder = 10
        OnClick = dblkpReplTypeClick
      end
      object pnlDeliveryType: TPanel
        Left = 474
        Top = 2
        Width = 307
        Height = 25
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 7
        DesignSize = (
          307
          25)
        object RdBtnToCust: TRadioButton
          Left = 0
          Top = 6
          Width = 73
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Customer'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RdBtnToCustClick
        end
        object RDBtnToAdHoc: TRadioButton
          Left = 72
          Top = 5
          Width = 73
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'AdHoc'
          TabOrder = 1
          OnClick = RDBtnToAdHocClick
        end
        object rdbtnToProduction: TRadioButton
          Left = 144
          Top = 5
          Width = 73
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Production'
          TabOrder = 2
          Visible = False
          OnClick = rdbtnToProductionClick
        end
      end
      object pnlSupplier: TPanel
        Left = 380
        Top = 88
        Width = 401
        Height = 57
        Anchors = [akTop, akRight]
        ParentBackground = False
        TabOrder = 11
        object Label4: TLabel
          Left = 14
          Top = 8
          Width = 38
          Height = 13
          Caption = 'Supplier'
        end
        object Label15: TLabel
          Left = 14
          Top = 32
          Width = 49
          Height = 13
          Caption = 'Order type'
        end
        object edtSupplier: TEdit
          Left = 102
          Top = 4
          Width = 249
          Height = 21
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
          Height = 21
          KeyField = 'Supp_Order_type'
          ListField = 'Supp_Order_Desc'
          ListSource = STSalesOrdDM.GetSuppOTypeSRC
          TabOrder = 2
          OnClick = dblkpOrdertypeClick
        end
      end
      object pnlCostCentre: TPanel
        Left = 0
        Top = 59
        Width = 329
        Height = 29
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 4
        Visible = False
        DesignSize = (
          329
          29)
        object Label12: TLabel
          Left = 8
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Cost Centre'
        end
        object edtCostCentre: TEdit
          Left = 78
          Top = 4
          Width = 185
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object btnCostCentre: TBitBtn
          Left = 280
          Top = 2
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
          TabOrder = 1
          OnClick = btnCostCentreClick
        end
      end
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 515
    Width = 794
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 712
    Top = 176
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
    OnPopup = pMnuViewPopup
    Left = 704
    Top = 313
    object SelectBitBtn: TMenuItem
      Caption = '&Select'
      OnClick = SelectBitBtnClick
    end
    object mnuAddItem: TMenuItem
      Caption = '&Add'
      OnClick = LineAddBitBtnClick
    end
    object Change1: TMenuItem
      Caption = '&Change'
      OnClick = SelectBitBtnClick
    end
    object ChangePrices1: TMenuItem
      Caption = 'Change &Prices'
      OnClick = ChangePrices1Click
    end
  end
  object ExtChgMenu: TPopupMenu
    OnPopup = ExtChgMenuPopup
    Left = 256
    Top = 449
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
  object FalshTimerDelNotes: TTimer
    Enabled = False
    OnTimer = FalshTimerDelNotesTimer
    Left = 712
    Top = 104
  end
  object qryVATCode: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Vat_Code')
    Left = 496
    Top = 464
  end
  object dtsVatCode: TDataSource
    DataSet = qryVATCode
    Left = 520
    Top = 432
  end
  object qryGetStockAlloc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select'
      '    Sales_Order_Line.Sales_Order_Line_No,'
      '    Sales_Order_Line.Part,'
      '    Sales_Order_Line.Quantity_Ordered,'
      '    Sales_Order_Line.Quantity_Overs,'
      '    Sales_Order_Line.Quantity_Delivered,'
      '    Sales_Order_Line.Sales_Order,'
      
        '    (Sales_Order_Line.Quantity_Ordered + isnull(Sales_Order_Line' +
        '.Quantity_Overs,0)) as Quantity_Requested,'
      '    Part.Sell_Pack_Quantity,'
      '    Part.Purch_Pack_Quantity,'
      '    Part.Part_Description,'
      '    Sales_Order_Line.Quantity_Allocated as Qty_Alloc,'
      '    (Select Sum(Store_Quantity - Quantity_Allocated)'
      '      from Store_Stock'
      
        '        Left Join Part_Store_Bin on ((Store_Stock.Part_Bin = Par' +
        't_Store_Bin.Part_Bin) and'
      '        (Part_Store_Bin.Part_Store = :Part_Store))'
      '      where (Store_Stock.Part_Store = :Part_Store) and'
      '        (Store_Stock.Part = Sales_Order_Line.Part) and'
      
        '        ((Part_Store_Bin.Bin_Can_Pick = '#39'Y'#39') or (Part_Store_Bin.' +
        'Bin_Can_Pick = Null))) as Qty_Free,'
      '    (Select Sum(Store_Quantity - Quantity_Allocated)'
      '      from Store_Stock'
      
        '        Left Join Part_Store_Bin on ((Store_Stock.Part_Bin = Par' +
        't_Store_Bin.Part_Bin) and'
      '        (Part_Store_Bin.Part_Store = :Part_Store))'
      '      where (Store_Stock.Part_Store = :Part_Store) and'
      '        (Store_Stock.Part = Sales_Order_Line.Part) and'
      '        (Store_Stock.Invoice_upfront = '#39'Y'#39') and'
      
        '        ((Part_Store_Bin.Bin_Can_Pick = '#39'Y'#39') or (Part_Store_Bin.' +
        'Bin_Can_Pick = Null))) as Qty_Paid'
      'From Sales_Order_Line, Part'
      'Where (Sales_Order_Line.Sales_Order = :Sales_Order) and'
      '      (Sales_Order_Line.Part = Part.Part) and'
      '      (Sales_Order_Line.Part Like :Part) and'
      '      ((Part.Product_class = '#39'STK'#39') or'
      '      (Part.Product_class is NULL))'
      'Order by Sales_Order_Line.Sales_Order_Line_no'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 120
    Top = 256
    ParamData = <
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Part'
        DataType = ftString
      end>
  end
end
