object PBAuditControlFrm: TPBAuditControlFrm
  Left = 147
  Top = 135
  Caption = 'Audit Control'
  ClientHeight = 131
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
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
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 192
    Top = 96
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
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
        Name = 'Audit_Log_Prog'
      end
      item
        Name = 'Audit_Log_Upd'
      end
      item
        Name = 'Audit_Log_Fields'
      end
      item
        Name = 'Audit_Log_Errors'
      end>
  end
end
