object frmWTMaintRemedialDept: TfrmWTMaintRemedialDept
  Left = 580
  Top = 211
  BorderStyle = bsDialog
  Caption = 'Maintain Remedial Source'
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
    Width = 24
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
      'UPDATE Remedial_Dept'
      'SET'
      '  Remedial_Dept_Descr = :Remedial_Dept_Descr,'
      '  inActive = :inactive'
      'WHERE'
      '  Remedial_Dept = :Remedial_Dept')
    Left = 64
    Top = 24
    ParamData = <
      item
        Name = 'Remedial_Dept_Descr'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Remedial_Dept'
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
      'Insert Into Remedial_Dept'
      '('
      '        Remedial_Dept_Descr,'
      '        inactive'
      ')'
      'Values'
      '('
      '        :Remedial_Dept_Descr,'
      '        :inactive'
      ')'
      ' ')
    Left = 144
    Top = 24
    ParamData = <
      item
        Name = 'Remedial_Dept_Descr'
      end
      item
        Name = 'inactive'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(Remedial_Dept) as Remedial_Dept'
      'From Remedial_Dept')
    Left = 208
    Top = 24
  end
end
