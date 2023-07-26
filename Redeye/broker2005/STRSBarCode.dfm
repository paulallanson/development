object STRSBarCodeFrm: TSTRSBarCodeFrm
  Left = 271
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Print Barcode Labels'
  ClientHeight = 191
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 16
    Top = 16
    Width = 58
    Height = 13
    Caption = 'Warehouse:'
  end
  object rdgrpLabelType: TRadioGroup
    Left = 16
    Top = 48
    Width = 169
    Height = 85
    Caption = 'Label Type'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'New Pallet labels'
      'Reprint Pallet labels'
      'Bin Location labels')
    ParentFont = False
    TabOrder = 2
    OnClick = rdgrpLabelTypeClick
  end
  object dblkpWarehouse: TDBLookupComboBox
    Left = 88
    Top = 12
    Width = 161
    Height = 21
    KeyField = 'Part_Store'
    ListField = 'Part_Store_Name'
    ListSource = dtsWH
    TabOrder = 6
  end
  object CloseBitBtn: TBitBtn
    Left = 16
    Top = 156
    Width = 75
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Kind = bkCancel
  end
  object PreviewBitBtn: TBitBtn
    Left = 256
    Top = 156
    Width = 75
    Height = 25
    Caption = 'Pre&view'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
  object PrintBitBtn: TBitBtn
    Left = 350
    Top = 156
    Width = 75
    Height = 25
    Caption = '&Print'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
  object grpbxReprint: TGroupBox
    Left = 200
    Top = 48
    Width = 217
    Height = 85
    Caption = 'Pallet Range'
    TabOrder = 3
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 23
      Height = 13
      Caption = 'From'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 13
      Height = 13
      Caption = 'To'
    end
    object edtPalletFrom: TEdit
      Left = 72
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = EnablePrint
      OnKeyPress = edtPalletFromKeyPress
    end
    object edtPalletTo: TEdit
      Left = 72
      Top = 52
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = EnablePrint
      OnKeyPress = edtPalletToKeyPress
    end
  end
  object grpbxBinRange: TGroupBox
    Left = 216
    Top = 48
    Width = 217
    Height = 85
    Caption = 'Bin Range'
    TabOrder = 4
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 23
      Height = 13
      Caption = 'From'
    end
    object Label4: TLabel
      Left = 24
      Top = 56
      Width = 13
      Height = 13
      Caption = 'To'
    end
    object btnBinFrom: TSpeedButton
      Left = 184
      Top = 18
      Width = 25
      Height = 25
      Hint = 'Select a specific bin'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBinFromClick
    end
    object btnBinTo: TSpeedButton
      Left = 184
      Top = 50
      Width = 25
      Height = 25
      Hint = 'Select a specific bin'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBinToClick
    end
    object edtBinFrom: TEdit
      Left = 72
      Top = 20
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EnablePrint
    end
    object edtBinTo: TEdit
      Left = 72
      Top = 52
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = EnablePrint
    end
  end
  object grpbxNewPallets: TGroupBox
    Left = 198
    Top = 88
    Width = 217
    Height = 85
    Caption = 'New Pallets labels'
    TabOrder = 5
    object Label5: TLabel
      Left = 24
      Top = 24
      Width = 71
      Height = 13
      Caption = 'Next Pallet No.'
    end
    object Label6: TLabel
      Left = 24
      Top = 53
      Width = 79
      Height = 13
      Caption = 'Number of labels'
    end
    object edtPalletID: TEdit
      Left = 112
      Top = 20
      Width = 89
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      OnChange = EnablePrint
    end
    object spnNoLabels: TSpinEdit
      Left = 112
      Top = 48
      Width = 60
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 1
    end
  end
  object qryWarehouse: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Part_Store'
      'order by Part_Store_Name')
    Left = 352
    Top = 8
  end
  object dtsWH: TDataSource
    DataSet = qryWarehouse
    Left = 280
    Top = 8
  end
  object qryBins: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Part_Store_bin'
      'where Part_Store = :Part_Store and'
      'Part_bin >= :Bin_From and Part_bin <= :Bin_To'
      'Order By Part_Bin')
    Left = 136
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Bin_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Bin_To'
        ParamType = ptUnknown
      end>
  end
end
