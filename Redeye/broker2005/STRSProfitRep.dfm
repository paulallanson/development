object STRSProfitRepfrm: TSTRSProfitRepfrm
  Left = 293
  Top = 155
  BorderStyle = bsDialog
  Caption = 'Profit Report Selection'
  ClientHeight = 280
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CustBranchLabel: TLabel
    Left = 128
    Top = 32
    Width = 44
    Height = 13
    Caption = 'Customer'
    Visible = False
  end
  object PrintBitBtn: TBitBtn
    Left = 270
    Top = 248
    Width = 75
    Height = 25
    Caption = '&Print'
    TabOrder = 0
    OnClick = PrintBitBtnClick
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
  end
  object PreviewBitBtn: TBitBtn
    Left = 184
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Pre&view'
    TabOrder = 1
    OnClick = PreviewBitBtnClick
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
  end
  object CancelBitBtn: TBitBtn
    Left = 8
    Top = 248
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 2
    Kind = bkCancel
  end
  object CustRadioGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 113
    Height = 65
    ItemIndex = 0
    Items.Strings = (
      'All Customers'
      'One Customer')
    TabOrder = 3
    OnClick = CustRadioGroupClick
  end
  object CustEdit: TEdit
    Left = 128
    Top = 48
    Width = 185
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
  object LUCustButton: TButton
    Left = 320
    Top = 46
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnClick = LUCustButtonClick
  end
  object radgrpRepType: TRadioGroup
    Left = 208
    Top = 80
    Width = 105
    Height = 73
    Caption = 'Sort first by'
    ItemIndex = 0
    Items.Strings = (
      'Customer'
      'Rep')
    TabOrder = 6
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 80
    Width = 177
    Height = 129
    Caption = 'Date Range'
    TabOrder = 7
    object dtpckrFrom: TDateTimePicker
      Left = 24
      Top = 32
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 37418.4592138889
      Time = 37418.4592138889
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtpckrTo: TDateTimePicker
      Left = 24
      Top = 88
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 37418.4595769676
      Time = 37418.4595769676
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
  end
  object chkExCalloffs: TCheckBox
    Left = 8
    Top = 216
    Width = 177
    Height = 17
    Caption = 'Exclude Print Call off orders'
    TabOrder = 8
  end
end
