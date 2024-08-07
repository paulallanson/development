object frmWTSendFax: TfrmWTSendFax
  Left = 200
  Top = 108
  Caption = 'Fax Send Form'
  ClientHeight = 272
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 48
    Width = 250
    Height = 25
    Caption = 'Send Fax Form - Never shown'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object WaitForFaxFinishTimer: TTimer
    Enabled = False
    OnTimer = WaitForFaxFinishTimerTimer
    Left = 80
    Top = 16
  end
  object AddFaxSQL: TFDQuery
    ConnectionName = 'faxesSQL'
    SQL.Strings = (
      'Insert Into Faxstat'
      '(CreatedOn, FileName, PhoneNo, Status, NoOfRetries, LastTried,'
      ' UserName, Description)'
      'Values'
      
        '(:CreatedOn, :FileName, :PhoneNo, :Status, :NoOfRetries, :LastTr' +
        'ied,'
      ' :UserName, :Description)')
    Left = 216
    Top = 104
    ParamData = <
      item
        Name = 'CreatedOn'
      end
      item
        Name = 'FileName'
      end
      item
        Name = 'PhoneNo'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'NoOfRetries'
      end
      item
        Name = 'LastTried'
        DataType = ftDateTime
      end
      item
        Name = 'UserName'
      end
      item
        Name = 'Description'
      end>
  end
  object GetOldFaxesQuery: TFDQuery
    ConnectionName = 'faxesSQL'
    SQL.Strings = (
      'Select FileName From FaxStat'
      'Where (CreatedOn < :Date_Before)')
    Left = 56
    Top = 88
    ParamData = <
      item
        Name = 'Date_Before'
      end>
  end
  object DelFaxQuery: TFDQuery
    ConnectionName = 'faxesSQL'
    SQL.Strings = (
      'Delete From Faxstat'
      'Where (FileName = :FileName)')
    Left = 136
    Top = 96
    ParamData = <
      item
        Name = 'FileName'
      end>
  end
  object FaxDatabase: TFDConnection
    ConnectionName = 'faxesSQL'
    Params.Strings = (
      'ConnectionDef=faxes')
    BeforeConnect = FaxDatabaseBeforeConnect
    Left = 176
    Top = 16
  end
  object ApdFaxDriverInterface1: TApdFaxDriverInterface
    FileName = 'C:\DEFAULT.APF'
    OnDocEnd = ApdFaxDriverInterface1DocEnd
    Left = 176
    Top = 168
  end
end
