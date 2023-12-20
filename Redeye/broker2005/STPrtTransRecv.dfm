object STPrtTransRecvFrm: TSTPrtTransRecvFrm
  Left = 259
  Top = 197
  BorderStyle = bsDialog
  Caption = 'Received Stock Details'
  ClientHeight = 183
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object BinLabel: TLabel
    Left = 8
    Top = 108
    Width = 16
    Height = 13
    Caption = 'Bin'
  end
  object QtyLabel: TLabel
    Left = 8
    Top = 12
    Width = 60
    Height = 13
    Caption = 'No of Packs'
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 49
    Height = 13
    Caption = 'Pack Cost'
  end
  object Label1: TLabel
    Left = 176
    Top = 12
    Width = 20
    Height = 13
    Caption = 'Size'
  end
  object BinEdit: TEdit
    Left = 64
    Top = 104
    Width = 129
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object OKBitBtn: TBitBtn
    Left = 72
    Top = 160
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 160
    Top = 160
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object FRCheckBox: TCheckBox
    Left = 8
    Top = 80
    Width = 225
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Line is now fully received'
    TabOrder = 3
  end
  object BinBitBtn: TBitBtn
    Left = 208
    Top = 104
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BinBitBtnClick
  end
  object QtyMemo: TMemo
    Left = 80
    Top = 8
    Width = 89
    Height = 21
    Alignment = taRightJustify
    TabOrder = 5
    WantReturns = False
    OnChange = QtyMemoChange
    OnEnter = ValueMemoEnter
    OnExit = QtyMemoExit
  end
  object PackSizeMemo: TMemo
    Left = 208
    Top = 8
    Width = 73
    Height = 21
    Alignment = taRightJustify
    TabOrder = 6
    WantReturns = False
    OnChange = QtyMemoChange
    OnEnter = ValueMemoEnter
    OnExit = PackSizeMemoExit
  end
  object CostMemo: TMemo
    Left = 80
    Top = 40
    Width = 89
    Height = 21
    Alignment = taRightJustify
    TabOrder = 7
    WantReturns = False
    OnChange = QtyMemoChange
    OnEnter = ValueMemoEnter
    OnExit = CostMemoExit
  end
  object CheckBinSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Bin'
      'From Part_Store_Bin'
      'Where (Part_Store = :Part_Store) and'
      '      (Part_Bin = :Part_Bin)')
    Left = 256
    Top = 136
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Bin'
      end>
  end
end
