object STEDIPOrdFrm: TSTEDIPOrdFrm
  Left = 179
  Top = 123
  Caption = 'EDI Purchase Order Generation'
  ClientHeight = 392
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 129
    Width = 397
    Height = 222
    Align = alClient
    TabOrder = 0
    object strgrdPOsCreated: TStringGrid
      Left = 1
      Top = 1
      Width = 395
      Height = 220
      Align = alClient
      ColCount = 6
      DefaultRowHeight = 20
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 129
    Align = alTop
    TabOrder = 1
    object rdgrpSupplier: TRadioGroup
      Left = 16
      Top = 8
      Width = 361
      Height = 73
      Caption = 'Suppliers capable of EDI Transfers'
      Color = clBtnFace
      ItemIndex = 0
      Items.Strings = (
        'Kingfield')
      ParentColor = False
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 96
      Top = 32
      Width = 233
      Height = 41
      BevelOuter = bvNone
      TabOrder = 3
      object lblKingfieldSupplier: TLabel
        Left = 25
        Top = 14
        Width = 24
        Height = 13
        Caption = '........'
        Color = clBtnFace
        ParentColor = False
      end
    end
    object btnKFSupplierSelect: TButton
      Left = 336
      Top = 40
      Width = 27
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnKFSupplierSelectClick
    end
    object GenerateBtn: TButton
      Left = 16
      Top = 96
      Width = 169
      Height = 25
      Caption = 'Generate Electronic Orders'
      TabOrder = 2
      OnClick = GenerateBtnClick
    end
    object AnalyseBtn: TButton
      Left = 208
      Top = 96
      Width = 169
      Height = 25
      Caption = 'Analyse Response Files'
      TabOrder = 4
      OnClick = AnalyseBtnClick
    end
  end
  object pnlResponseDtls: TPanel
    Left = 0
    Top = 129
    Width = 397
    Height = 0
    Align = alTop
    TabOrder = 2
    object mmResponseDtls: TMemo
      Left = 1
      Top = 1
      Width = 395
      Height = 98
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object pnlClose: TPanel
    Left = 0
    Top = 351
    Width = 397
    Height = 41
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      397
      41)
    object BitBtn1: TBitBtn
      Left = 307
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
    end
    object btbtnPrint: TBitBtn
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Print'
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
      TabOrder = 1
      Visible = False
      OnClick = btbtnPrintClick
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 192
    Top = 369
  end
end
