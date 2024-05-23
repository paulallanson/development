object frmWTLUDataSource: TfrmWTLUDataSource
  Left = 271
  Top = 136
  BorderStyle = bsDialog
  Caption = 'Data Source'
  ClientHeight = 315
  ClientWidth = 375
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
    Width = 375
    Height = 215
    Align = alClient
    DataSource = srcDataSource
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Data_Source_Title'
        Title.Caption = 'Data Source'
        Width = 176
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 296
    Width = 375
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 215
    Width = 375
    Height = 81
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      375
      81)
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 16
      Width = 169
      Height = 17
      Caption = 'Show inactive data sources'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object btnAdd: TBitBtn
      Left = 16
      Top = 48
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 106
      Top = 48
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 197
      Top = 48
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 288
      Top = 48
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 4
      OnClick = BitBtn4Click
    end
  end
  object srcDataSource: TDataSource
    DataSet = qryDataSource
    OnDataChange = srcDataSourceDataChange
    Left = 152
    Top = 120
  end
  object qryDataSource: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Data_Source'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39'))'
      'ORDER BY Data_Source_Title'
      '')
    Left = 72
    Top = 120
    ParamData = <
      item
        Name = 'inactive'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 232
    Top = 120
  end
end
