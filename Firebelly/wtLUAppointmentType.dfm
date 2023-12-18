object frmwtLUAppointmentType: TfrmwtLUAppointmentType
  Left = 409
  Top = 158
  BorderStyle = bsDialog
  Caption = 'Appointment Types'
  ClientHeight = 326
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 424
    Height = 263
    Align = alClient
    DataSource = srcAppointmentType
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Type'
        Width = 230
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 307
    Width = 424
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 298
    ExplicitWidth = 418
  end
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 263
    Width = 424
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 254
    ExplicitWidth = 418
    DesignSize = (
      424
      44)
    object btnEdit: TBitBtn
      Left = 9
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 0
      Visible = False
      OnClick = btnEditClick
    end
    object BitBtn4: TBitBtn
      Left = 340
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtn4Click
    end
    object btnExcel: TBitBtn
      Left = 254
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 2
      OnClick = btnExcelClick
    end
    object BitBtn1: TBitBtn
      Left = 169
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Defaults'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  object srcAppointmentType: TDataSource
    DataSet = qryAppointmentType
    Left = 216
    Top = 64
  end
  object qryDelete: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from Level_of_Importance'
      'where Level_of_Importance = :Level_of_Importance')
    Left = 344
    Top = 64
    ParamData = <
      item
        Name = 'Level_of_Importance'
      end>
  end
  object qryDefaults: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE AppointmentType'
      'Set AppointmentColour = 23'
      'WHERE id = 2')
    Left = 96
    Top = 152
  end
  object qryAppointmentType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM AppointmentType'
      'ORDER BY Name'
      '')
    Left = 104
    Top = 64
  end
end
