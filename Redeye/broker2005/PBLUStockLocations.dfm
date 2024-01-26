object frmPBLUStockLocations: TfrmPBLUStockLocations
  Left = 185
  Top = 109
  Caption = 'Stock Location Enquiry'
  ClientHeight = 403
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 730
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 59
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
    Top = 343
    Width = 730
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 15
      Width = 63
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
    Top = 384
    Width = 730
    Height = 19
    Panels = <>
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 49
    Width = 730
    Height = 294
    Align = alClient
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
  end
end
