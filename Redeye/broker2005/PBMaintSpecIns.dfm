object PBMaintSpecInsFrm: TPBMaintSpecInsFrm
  Left = 253
  Top = 128
  BorderStyle = bsDialog
  Caption = 'Maintain Special Instructions'
  ClientHeight = 327
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 240
    Width = 81
    Height = 13
    Caption = 'Short Description'
  end
  object DataMemo: TMemo
    Left = 16
    Top = 8
    Width = 289
    Height = 225
    Lines.Strings = (
      'DataMemo')
    ScrollBars = ssVertical
    TabOrder = 0
    Visible = False
  end
  object DispMemo: TMemo
    Left = 8
    Top = 8
    Width = 297
    Height = 225
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object CancelBitBtn: TBitBtn
    Left = 229
    Top = 288
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object OkBitBtn: TBitBtn
    Left = 149
    Top = 288
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
    OnClick = OkBitBtnClick
  end
  object ClearBitBtn: TBitBtn
    Left = 8
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Clear'
    Default = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
    TabOrder = 4
    OnClick = ClearBitBtnClick
  end
  object NarrativeEdit: TEdit
    Left = 8
    Top = 254
    Width = 297
    Height = 21
    MaxLength = 50
    TabOrder = 5
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Special_instruction'
      'From Special_instruction'
      'Where Description = :GUID')
    Left = 40
    Top = 88
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Special_Instruction'
      '  (Special_Instruction,'
      '   Narrative,'
      '   Description)'
      'Select Max(Special_Instruction)+1, :Narrative, :GUID'
      'From Special_Instruction'
      ''
      ''
      ' ')
    Left = 24
    Top = 32
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Special_Instruction'
      'Set'
      '        Narrative = :Narrative,'
      '        Description =:Description'
      'Where'
      '(Special_Instruction = :Special_Instruction)')
    Left = 88
    Top = 32
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Description'
        DataType = ftString
      end
      item
        Name = 'Special_Instruction'
        DataType = ftInteger
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Special_Instruction'
      'Where'
      '(Special_Instruction = :Special_Instruction)')
    Left = 160
    Top = 32
    ParamData = <
      item
        Name = 'Special_Instruction'
        DataType = ftInteger
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Special_instruction'
      'From Special_instruction'
      'Where Description = :GUID')
    Left = 224
    Top = 32
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
end
