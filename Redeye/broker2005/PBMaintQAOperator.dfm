object PBMaintQAOperatorFrm: TPBMaintQAOperatorFrm
  Left = 401
  Top = 180
  BorderStyle = bsDialog
  Caption = 'Maintain Quality Assurance details'
  ClientHeight = 119
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object DelLabel: TLabel
    Left = 30
    Top = 99
    Width = 145
    Height = 15
    Caption = 'Delete the above details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 188
    Top = 94
    Width = 75
    Height = 25
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 270
    Top = 94
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object detsgrpbox: TGroupBox
    Left = 8
    Top = 8
    Width = 337
    Height = 73
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 20
      Width = 29
      Height = 13
      Caption = 'Name'
    end
    object chkbxActive: TCheckBox
      Left = 9
      Top = 48
      Width = 185
      Height = 17
      Caption = 'Operator is active'
      TabOrder = 1
    end
    object btnProcessClear: TBitBtn
      Left = 296
      Top = 110
      Width = 25
      Height = 23
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
      TabOrder = 2
      TabStop = False
    end
    object edtEmployeeName: TEdit
      Left = 56
      Top = 16
      Width = 241
      Height = 21
      TabOrder = 0
      Text = 'edtEmployeeName'
      OnChange = CheckOK
    end
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into QA_Operator'
      '        (QA_Operator,'
      '        QA_Operator_Name)'
      'Select Max(QA_Operator)+1, :GUID From QA_Operator')
    Left = 24
    Top = 8
    ParamData = <
      item
        Name = 'GUID'
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update QA_Operator'
      'Set'
      '        QA_Operator_Name = :QA_Operator_Name,'
      '        Inactive = :inactive'
      'Where'
      '(QA_Operator = :QA_Operator)')
    Left = 152
    Top = 56
    ParamData = <
      item
        Name = 'QA_Operator_Name'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'QA_Operator'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Rep(Rep, Name)'
      'SELECT Max(Rep)+1, :GUID FROM Rep'
      ''
      ''
      ' ')
    Left = 192
    Top = 8
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From QA_Operator'
      'Where'
      '(QA_Operator = :QA_Operator)')
    Left = 304
    Top = 16
    ParamData = <
      item
        Name = 'QA_Operator'
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select QA_Operator'
      'From QA_Operator'
      'Where QA_Operator_Name = :GUID')
    Left = 304
    Top = 64
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
end
