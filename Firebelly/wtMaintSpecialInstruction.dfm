object frmWTMaintSpecialInstruction: TfrmWTMaintSpecialInstruction
  Left = 514
  Top = 116
  BorderStyle = bsDialog
  Caption = 'Maintain Special Instructions'
  ClientHeight = 321
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 240
    Width = 90
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
    TabOrder = 5
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
    TabOrder = 0
    OnChange = DispMemoChange
  end
  object CancelBitBtn: TBitBtn
    Left = 229
    Top = 288
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 4
  end
  object OkBitBtn: TBitBtn
    Left = 149
    Top = 288
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
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
    NumGlyphs = 2
    TabOrder = 2
    OnClick = ClearBitBtnClick
  end
  object edtDescription: TEdit
    Left = 8
    Top = 254
    Width = 297
    Height = 21
    TabOrder = 1
    OnChange = EnableOK
    OnExit = edtDescriptionExit
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'wt'
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
    ConnectionName = 'wt'
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
    ConnectionName = 'wt'
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
  object qryZero: TFDQuery
    ConnectionName = 'wt'
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
  object DelSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Delete From Special_Instruction'
      'Where'
      '(Special_Instruction = :Special_Instruction)')
    Left = 88
    Top = 152
    ParamData = <
      item
        Name = 'Special_Instruction'
        DataType = ftInteger
      end>
  end
end
