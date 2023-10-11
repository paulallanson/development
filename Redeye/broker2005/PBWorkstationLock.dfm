object PBWorkstationLockFrm: TPBWorkstationLockFrm
  Left = 293
  Top = 124
  Caption = 'Maintain Locked Records'
  ClientHeight = 370
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 329
    Width = 860
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      860
      41)
    object btnUnlock: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Unlock'
      TabOrder = 0
      OnClick = btnUnlockClick
    end
    object btnRefresh: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Refresh'
      TabOrder = 1
      OnClick = btnRefreshClick
    end
    object btnClose: TButton
      Left = 772
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 2
      OnClick = btnCloseClick
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 860
    Height = 329
    Align = alClient
    DataSource = dtsWorkstationLock
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Table_Name'
        Title.Caption = 'Module'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Key_Value_1'
        Title.Caption = 'Reference'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Operator_name'
        Title.Caption = 'Operator'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status_Descr'
        Title.Caption = 'Login Name'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Workstation_Name'
        Title.Caption = 'Workstation Name'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Logged_in'
        Title.Caption = 'Logged In'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Software_Version'
        Title.Caption = 'Software Version'
        Width = 124
        Visible = True
      end>
  end
  object qryWorkstationLock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '    Workstation_Lock.*,'
      #9#9'Workstation_Redeye.Workstation_Name,'
      #9#9'Workstation_Redeye.Status_Descr,'
      #9#9'Workstation_Redeye.Logged_in,'
      #9#9'Workstation_Redeye.Software_Version,'
      #9#9'Operator.Name as Operator_Name'
      'FROM Workstation_Lock, Workstation_redeye, Operator'
      'WHERE'
      
        '  Workstation_Lock.Workstation = Workstation_Redeye.Workstation ' +
        'AND'
      '  Workstation_Redeye.Status_Descr = Operator.Login_Name'
      'ORDER BY  Workstation_Lock.Table_Name,'
      '          Workstation_Lock.Key_Value_1')
    Left = 120
    Top = 88
  end
  object dtsWorkstationLock: TDataSource
    DataSet = qryWorkstationLock
    Left = 208
    Top = 88
  end
  object qryDeleteWSL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Workstation_Lock'
      'WHERE Workstation = :Workstation AND'
      '      Lock_No = :Lock_no')
    Left = 352
    Top = 88
    ParamData = <
      item
        Name = 'Workstation'
      end
      item
        Name = 'Lock_no'
      end>
  end
end
