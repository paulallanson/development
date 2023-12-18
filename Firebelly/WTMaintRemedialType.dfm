object frmWTMaintRemedialType: TfrmWTMaintRemedialType
  Left = 580
  Top = 211
  BorderStyle = bsDialog
  Caption = 'Maintain Remedial Type'
  ClientHeight = 115
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    443
    115)
  TextHeight = 13
  object label1: TLabel
    Left = 8
    Top = 20
    Width = 23
    Height = 13
    Caption = 'Type'
  end
  object btnOK: TBitBtn
    Left = 136
    Top = 78
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 78
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 3
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 58
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 1
  end
  object edtDescription: TEdit
    Left = 88
    Top = 16
    Width = 345
    Height = 21
    TabOrder = 0
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Remedial_Type'
      'SET'
      '  Remedial_Type_Descr = :Remedial_Type_Descr,'
      '  inActive = :inactive'
      'WHERE'
      '  Remedial_Type = :Remedial_Type')
    Left = 64
    Top = 24
    ParamData = <
      item
        Name = 'Remedial_Type_Descr'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Remedial_Type'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    Left = 296
    Top = 24
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Remedial_Type'
      '('
      '        Remedial_Type_Descr,'
      '        inactive'
      ')'
      'Values'
      '('
      '        :Remedial_Type_Descr,'
      '        :inactive'
      ')'
      ' ')
    Left = 144
    Top = 24
    ParamData = <
      item
        Name = 'Remedial_Type_Descr'
      end
      item
        Name = 'inactive'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(Remedial_Type) as Remedial_Type'
      'From Remedial_Type')
    Left = 208
    Top = 24
  end
end
