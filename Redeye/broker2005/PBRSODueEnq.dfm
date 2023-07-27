object PBRSODueEnqFrm: TPBRSODueEnqFrm
  Left = 390
  Top = 166
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Overdue Enquiry Print'
  ClientHeight = 228
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object DateLabel: TLabel
    Left = 16
    Top = 156
    Width = 109
    Height = 13
    Caption = 'Include any due before'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DateSpeedButton: TSpeedButton
    Left = 248
    Top = 152
    Width = 25
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
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
    OnClick = DateSpeedButtonClick
  end
  object AllOrOneRadioGroup: TRadioGroup
    Left = 16
    Top = 79
    Width = 105
    Height = 65
    Caption = 'By Supplier'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'All Suppliers'
      'One Supplier')
    ParentFont = False
    TabOrder = 0
    OnClick = AllOrOneRadioGroupClick
  end
  object PrintBitBtn: TBitBtn
    Left = 290
    Top = 184
    Width = 75
    Height = 25
    Caption = '&Print'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 1
    OnClick = PrintBitBtnClick
  end
  object PreviewBitBtn: TBitBtn
    Left = 200
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Pre&view'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 2
    OnClick = PreviewBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 16
    Top = 184
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
  end
  object DateEdit: TEdit
    Left = 144
    Top = 152
    Width = 97
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 4
    OnExit = DateEditExit
    OnKeyUp = DateEditKeyUp
  end
  object SuppGrpBox: TGroupBox
    Left = 128
    Top = 79
    Width = 329
    Height = 65
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 83
      Height = 13
      Caption = 'Supplier / Branch'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SuppLUSpeedButton: TSpeedButton
      Left = 280
      Top = 30
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SuppLUSpeedButtonClick
    end
    object SuppEdit: TEdit
      Left = 8
      Top = 32
      Width = 265
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object EmailBitBtn: TBitBtn
    Left = 381
    Top = 184
    Width = 75
    Height = 25
    Caption = '&Email'
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
    TabOrder = 6
    OnClick = EmailBitBtnClick
  end
  object rgRep: TRadioGroup
    Left = 16
    Top = 10
    Width = 105
    Height = 65
    Caption = 'By Rep'
    ItemIndex = 0
    Items.Strings = (
      'All Reps'
      'One Rep')
    TabOrder = 7
    OnClick = rgRepClick
  end
  object pnlRepSearch: TPanel
    Left = 128
    Top = 16
    Width = 329
    Height = 60
    TabOrder = 8
    Visible = False
    object lblCustBran: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Rep Name'
    end
    object edtRep: TEdit
      Left = 8
      Top = 24
      Width = 265
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnRep: TButton
      Left = 280
      Top = 22
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnRepClick
    end
  end
  object qryRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep'
      'where rep = :Rep')
    Left = 336
    Top = 64
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
end
