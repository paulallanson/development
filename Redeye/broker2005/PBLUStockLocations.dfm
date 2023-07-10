object frmPBLUStockLocations: TfrmPBLUStockLocations
  Left = 185
  Top = 109
  Width = 742
  Height = 441
  Caption = 'Stock Location Enquiry'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 55
      Height = 13
      Caption = 'Warehouse'
    end
    object dblkpWarehouse: TDBLookupComboBox
      Left = 88
      Top = 16
      Width = 153
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 347
    Width = 734
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 15
      Width = 59
      Height = 13
      Caption = 'Bin Location'
    end
    object edtBin: TEdit
      Left = 96
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 388
    Width = 734
    Height = 19
    Panels = <>
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 49
    Width = 734
    Height = 298
    Align = alClient
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
end
