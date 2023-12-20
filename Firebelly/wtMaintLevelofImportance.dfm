object frmwtMaintLevelofImportance: TfrmwtMaintLevelofImportance
  Left = 422
  Top = 181
  BorderStyle = bsDialog
  Caption = 'Level of Importance'
  ClientHeight = 166
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    436
    166)
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 16
    Top = 60
    Width = 35
    Height = 13
    Caption = 'Colour'
  end
  object btnOK: TBitBtn
    Left = 141
    Top = 128
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 221
    Top = 128
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 6
  end
  object chkbxInactive: TCheckBox
    Left = 16
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 4
  end
  object edtColor: TEdit
    Left = 94
    Top = 56
    Width = 131
    Height = 21
    MaxLength = 40
    ReadOnly = True
    TabOrder = 1
    Text = 'Sample Text'
  end
  object Button1: TButton
    Left = 240
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Colour'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 327
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Font'
    TabOrder = 3
    OnClick = Button2Click
  end
  object edtImportanceDescription: TEdit
    Left = 94
    Top = 20
    Width = 185
    Height = 21
    TabOrder = 0
    Text = 'edtImportanceDescription'
    OnChange = EnableOK
  end
  object ColorDialog1: TColorDialog
    Left = 48
    Top = 115
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Level_of_Importance'
      'SET'
      '      Importance_Description = :Importance_Description,'
      '      Color = :Color,'
      '      Font_Color = :Font_Color,'
      '      inActive = :inactive'
      'WHERE'
      '  Level_of_Importance = :Level_of_Importance')
    Left = 80
    Top = 40
    ParamData = <
      item
        Name = 'Importance_Description'
      end
      item
        Name = 'Color'
      end
      item
        Name = 'Font_Color'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Level_of_Importance'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Level_of_Importance'
      '('
      '        Importance_Description,'
      '        Color,'
      '        Font_Color,'
      '        inactive'
      ')'
      'Values'
      '('
      '        :Importance_Description,'
      '        :Color,'
      '        :Font_Color,'
      '        :inactive'
      ')'
      ' ')
    Left = 136
    Top = 40
    ParamData = <
      item
        Name = 'Importance_Description'
      end
      item
        Name = 'Color'
      end
      item
        Name = 'Font_Color'
      end
      item
        Name = 'inactive'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(Level_of_Importance) as Level_of_Importance'
      'From Level_of_Importance')
    Left = 200
    Top = 40
  end
end
