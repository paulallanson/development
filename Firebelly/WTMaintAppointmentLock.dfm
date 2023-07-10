object frmWTMaintAppointmentLock: TfrmWTMaintAppointmentLock
  Left = 293
  Top = 124
  Width = 878
  Height = 417
  Caption = 'Maintain Appointment Locked Records'
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
    Top = 345
    Width = 870
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      870
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
      Left = 782
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
    Width = 870
    Height = 345
    Align = alClient
    DataSource = dtsApptStatus
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Is_Opened'
        Title.Caption = 'Open'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'User'
        Width = 237
        Visible = True
      end>
  end
  object qryApptStatus: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  *'
      'FROM AppointmentStatus')
    Left = 120
    Top = 88
  end
  object dtsApptStatus: TDataSource
    DataSet = qryApptStatus
    Left = 208
    Top = 88
  end
  object qryDeleteApptStatus: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'DELETE FROM AppointmentStatus'
      'WHERE ID = :ID')
    Left = 352
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
