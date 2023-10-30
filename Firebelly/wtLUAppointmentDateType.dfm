object frmwtLUAppointmentDateType: TfrmwtLUAppointmentDateType
  Left = 409
  Top = 158
  BorderStyle = bsDialog
  Caption = 'Appointment Date Types'
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
    DataSource = srcAppointmentDateType
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
  end
  object srcAppointmentDateType: TDataSource
    DataSet = qryAppointmentDateType
    Left = 216
    Top = 64
  end
  object qryAppointmentDateType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM AppointmentDateType'
      'ORDER BY Name'
      '')
    Left = 96
    Top = 64
  end
end
