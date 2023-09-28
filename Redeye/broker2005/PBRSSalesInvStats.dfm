object PBRSSalesInvStatsFrm: TPBRSSalesInvStatsFrm
  Left = 506
  Top = 138
  Caption = 'Sales Invoice Statistical Report'
  ClientHeight = 146
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 20
    Width = 55
    Height = 13
    Caption = 'Start Period'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 87
    Height = 13
    Caption = 'Number of Periods'
  end
  object dblkpPeriod: TDBLookupComboBox
    Left = 112
    Top = 16
    Width = 153
    Height = 21
    KeyField = 'Period'
    ListField = 'Description'
    ListSource = dtsPeriod
    TabOrder = 0
  end
  object rdgrpSortBy: TRadioGroup
    Left = 286
    Top = 10
    Width = 99
    Height = 81
    Caption = 'Sort by'
    ItemIndex = 0
    Items.Strings = (
      'Period'
      'Rep'
      'Customer')
    TabOrder = 1
  end
  object PrintReportBitBtn: TBitBtn
    Left = 310
    Top = 108
    Width = 75
    Height = 25
    Caption = 'Print'
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
    TabOrder = 2
    OnClick = PrintReportBitBtnClick
  end
  object PreviewReportBitBtn: TBitBtn
    Left = 214
    Top = 108
    Width = 75
    Height = 25
    Caption = 'Preview'
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
    TabOrder = 3
    OnClick = PreviewReportBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 16
    Top = 111
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object spnPeriods: TSpinEdit
    Left = 112
    Top = 56
    Width = 65
    Height = 22
    MaxValue = 36
    MinValue = 1
    TabOrder = 5
    Value = 1
  end
  object qryPeriod: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Period'
      'order by period desc')
    Left = 256
    Top = 16
  end
  object dtsPeriod: TDataSource
    DataSet = qryPeriod
    Left = 296
    Top = 16
  end
end
