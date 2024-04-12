object frmWTMaintLogins: TfrmWTMaintLogins
  Left = 364
  Top = 119
  Caption = 'Maintain Currently Logged in Users'
  ClientHeight = 521
  ClientWidth = 689
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
    Top = 461
    Width = 689
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      689
      41)
    object btnDelete: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Delete'
      TabOrder = 0
      OnClick = btnDeleteClick
    end
    object btnRefresh: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Refresh'
      TabOrder = 1
      OnClick = btnRefreshClick
    end
    object btnClose: TButton
      Left = 605
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
    Width = 689
    Height = 461
    Align = alClient
    DataSource = dtsWorkstation
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
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
    Top = 502
    Width = 689
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object qryWorkstation: TFDQuery
    ConnectionName = 'WT'
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT'#9'Workstation.Workstation,'
      #9#9'Workstation.Workstation_Name, '
      #9#9'Workstation.Status_Descr,'
      #9#9'Workstation.Software_Version,'
      #9#9'Workstation.Logged_In,'
      #9#9'Operator.Operator_Name'
      'FROM Workstation, Operator'
      'WHERE'
      #9'Workstation.Status_Descr = Operator.Login_Name'
      'ORDER BY Workstation.Workstation ASC')
    Left = 120
    Top = 88
  end
  object dtsWorkstation: TDataSource
    DataSet = qryWorkstation
    Left = 264
    Top = 88
  end
  object qryDeleteWS: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'DELETE FROM Workstation'
      'WHERE Workstation = :Workstation')
    Left = 408
    Top = 88
    ParamData = <
      item
        Name = 'Workstation'
      end>
  end
end
