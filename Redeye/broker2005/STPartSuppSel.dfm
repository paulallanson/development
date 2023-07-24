object STPartSuppSelFrm: TSTPartSuppSelFrm
  Left = 172
  Top = 192
  BorderStyle = bsDialog
  Caption = 'Products Suppliers Report'
  ClientHeight = 181
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PreviewBitBTn: TBitBtn
    Left = 265
    Top = 136
    Width = 80
    Height = 27
    Caption = 'Pre&view'
    TabOrder = 3
    OnClick = PreviewBitBTnClick
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
  object SelectionType: TRadioGroup
    ParentBackground = False
    Left = 280
    Top = 16
    Width = 161
    Height = 105
    Caption = 'Report Selection'
    ItemIndex = 0
    Items.Strings = (
      'No Suppliers allocated'
      'Preferred Suppliers'
      'Alternative Suppliers'
      'All Possible Suppliers')
    TabOrder = 1
  end
  object PrintBitBtn: TBitBtn
    Left = 353
    Top = 136
    Width = 80
    Height = 27
    Caption = '&Print'
    TabOrder = 4
    OnClick = PrintBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 9
    Top = 136
    Width = 80
    Height = 27
    Caption = '&Cancel'
    TabOrder = 2
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    ParentBackground = False
    Left = 8
    Top = 16
    Width = 265
    Height = 105
    Caption = 'Product Selection'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 40
      Width = 23
      Height = 13
      Caption = 'From'
    end
    object Label2: TLabel
      Left = 33
      Top = 72
      Width = 13
      Height = 13
      Caption = 'To'
    end
    object edtPartFrom: TEdit
      Left = 56
      Top = 32
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtPartFromChange
    end
    object edtPartTo: TEdit
      Left = 56
      Top = 64
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object btbtnPartFrom: TBitBtn
      Left = 232
      Top = 30
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
      OnClick = btbtnPartFromClick
    end
    object btbtnPartTo: TBitBtn
      Left = 232
      Top = 62
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
      OnClick = btbtnPartToClick
    end
  end
end
