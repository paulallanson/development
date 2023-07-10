object PBMaintLoginsFrm: TPBMaintLoginsFrm
  Left = 364
  Top = 119
  Width = 709
  Height = 561
  Caption = 'Maintain Currently Logged in Users'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 467
    Width = 701
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      701
      41)
    object btnDelete: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Delete'
      TabOrder = 0
      OnClick = btnDeleteClick
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
      Left = 613
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
    Width = 701
    Height = 467
    Align = alClient
    DataSource = dtsWorkstation
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = dbgDetailsTitleClick
    Columns = <
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
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 508
    Width = 701
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object qryWorkstation: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT'#9'Workstation_Redeye.Workstation,'
      #9#9'Workstation_Redeye.Workstation_Name, '
      #9#9'Workstation_Redeye.Status_Descr,'
      #9#9'Workstation_Redeye.Software_Version,'
      #9#9'Workstation_Redeye.Logged_in, '
      #9#9'Operator.Name as Operator_Name '
      'FROM Workstation_redeye, Operator'
      'WHERE'
      #9'Workstation_Redeye.Status_Descr = Operator.Login_Name'
      'ORDER BY Workstation_Redeye.Workstation ASC')
    Left = 120
    Top = 88
  end
  object dtsWorkstation: TDataSource
    DataSet = qryWorkstation
    Left = 264
    Top = 88
  end
  object qryDeleteWS: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'DELETE FROM Workstation_Redeye'
      'WHERE Workstation = :Workstation')
    Left = 408
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Workstation'
        ParamType = ptUnknown
      end>
  end
end
