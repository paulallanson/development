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
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    443
    115)
  PixelsPerInch = 96
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
    TabOrder = 2
    OnClick = btnOKClick
    NumGlyphs = 2
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
    TabOrder = 3
    NumGlyphs = 2
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
  object qryUpdate: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'Remedial_Dept_Descr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Remedial_Dept'
        ParamType = ptUnknown
      end>
  end
  object qryZero: TQuery
    DatabaseName = 'WT'
    Left = 296
    Top = 24
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'Remedial_Dept_Descr'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end>
  end
  object qryGetLast: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select max(Remedial_Dept) as Remedial_Dept'
      'From Remedial_Dept')
    Left = 208
    Top = 24
  end
end
