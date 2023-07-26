object PBAuditControlFrm: TPBAuditControlFrm
  Left = 147
  Top = 135
  Width = 292
  Height = 170
  Caption = 'Audit Control'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object ProgMoveCheckBox: TCheckBox
    Left = 8
    Top = 16
    Width = 113
    Height = 17
    Caption = 'Program Movement'
    TabOrder = 0
  end
  object FieldChangeCheckBox: TCheckBox
    Left = 8
    Top = 64
    Width = 113
    Height = 17
    Caption = 'Field Changes'
    TabOrder = 1
  end
  object UpdatesCheckBox: TCheckBox
    Left = 8
    Top = 32
    Width = 97
    Height = 17
    Caption = 'Updates'
    TabOrder = 2
  end
  object ErrorsCheckBox: TCheckBox
    Left = 8
    Top = 48
    Width = 113
    Height = 17
    Caption = 'Errors'
    TabOrder = 3
  end
  object OKBitBtn: TBitBtn
    Left = 104
    Top = 96
    Width = 75
    Height = 25
    TabOrder = 4
    OnClick = OKBitBtnClick
    Kind = bkOK
  end
  object CancelBitBtn: TBitBtn
    Left = 192
    Top = 96
    Width = 75
    Height = 25
    TabOrder = 5
    Kind = bkCancel
  end
  object GetAuditFlagsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Audit_Log_Prog, Audit_Log_Upd, Audit_Log_Fields, Audit_Lo' +
        'g_Errors'
      'From Company'
      'Where Company = 1 ')
    Left = 120
    Top = 24
  end
  object UpdAuditFlagsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set'
      'Audit_Log_Prog = :Audit_Log_Prog,'
      'Audit_Log_Upd = :Audit_Log_Upd,'
      'Audit_Log_Fields = :Audit_Log_Fields,'
      'Audit_Log_Errors = :Audit_Log_Errors'
      'Where Company = 1 ')
    Left = 88
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Audit_Log_Prog'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Log_Upd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Log_Fields'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_Log_Errors'
        ParamType = ptUnknown
      end>
  end
end
