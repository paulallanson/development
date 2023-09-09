object STRSUnpaidStockFrm: TSTRSUnpaidStockFrm
  Left = 178
  Top = 122
  Caption = 'Unpaid Stock Report Selection'
  ClientHeight = 267
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object AllOrOneRadioGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 121
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'All Reps'
      'One Rep')
    ParentFont = False
    TabOrder = 0
    OnClick = AllOrOneRadioGroupClick
  end
  object RepGrpBox: TGroupBox
    Left = 136
    Top = 8
    Width = 265
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Selected Rep'
    end
    object RepLUSpeedButton: TSpeedButton
      Left = 232
      Top = 31
      Width = 25
      Height = 25
      Hint = 'Select a specific customer rep'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = RepLUSpeedButtonClick
    end
    object RepEdit: TEdit
      Left = 8
      Top = 32
      Width = 217
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object CustRadioGroup: TRadioGroup
    Left = 8
    Top = 80
    Width = 121
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'All Customers'
      'One Customer')
    ParentFont = False
    TabOrder = 2
    OnClick = CustRadioGroupClick
  end
  object CustGrpBox: TGroupBox
    Left = 137
    Top = 80
    Width = 265
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 89
      Height = 13
      Caption = 'Selected Customer'
    end
    object CustLuSpeedButton: TSpeedButton
      Left = 232
      Top = 31
      Width = 25
      Height = 25
      Hint = 'Select a specific customer rep'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = CustLuSpeedButtonClick
    end
    object CustEdit: TEdit
      Left = 8
      Top = 32
      Width = 217
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object grpbxDateRange: TGroupBox
    Left = 8
    Top = 152
    Width = 394
    Height = 85
    Caption = 'Date Range'
    TabOrder = 4
    object Label1: TLabel
      Left = 12
      Top = 22
      Width = 52
      Height = 13
      Caption = 'Date From:'
    end
    object Label6: TLabel
      Left = 12
      Top = 54
      Width = 42
      Height = 13
      Caption = 'Date To:'
    end
    object edtDateFrom: TEdit
      Left = 80
      Top = 18
      Width = 169
      Height = 21
      MaxLength = 30
      TabOrder = 0
      Text = '01/01/2004'
      OnChange = edtDateFromChange
      OnExit = edtDateFromExit
      OnKeyPress = edtDateFromKeyPress
    end
    object btbtnDateFrom: TBitBtn
      Left = 264
      Top = 17
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = btbtnDateFromClick
    end
    object btbtnDateTo: TBitBtn
      Left = 264
      Top = 49
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = False
      OnClick = btbtnDateToClick
    end
    object edtDateTo: TEdit
      Left = 80
      Top = 50
      Width = 169
      Height = 21
      MaxLength = 30
      TabOrder = 1
      Text = '02/01/2004'
      OnChange = edtDateFromChange
      OnExit = edtDateFromExit
      OnKeyPress = edtDateToKeyPress
    end
  end
  object CloseBitBtn: TBitBtn
    Left = 326
    Top = 244
    Width = 75
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 5
  end
  object PreviewBitBtn: TBitBtn
    Left = 136
    Top = 244
    Width = 75
    Height = 25
    Caption = 'Pre&view'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    TabOrder = 6
    OnClick = PreviewBitBtnClick
  end
  object PrintBitBtn: TBitBtn
    Left = 222
    Top = 244
    Width = 75
    Height = 25
    Caption = '&Print'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    TabOrder = 7
    OnClick = PrintBitBtnClick
  end
end
