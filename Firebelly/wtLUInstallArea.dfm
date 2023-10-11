object frmWTLUInstallArea: TfrmWTLUInstallArea
  Left = 325
  Top = 105
  BorderStyle = bsDialog
  Caption = 'Installation Areas'
  ClientHeight = 327
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 752
    Height = 241
    Align = alClient
    DataSource = dtsInstallationAreas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'Description'
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Templating_Price'
        Title.Caption = 'Template'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fitting_Price'
        Title.Caption = 'Fitting'
        Width = 86
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 241
    Width = 752
    Height = 67
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      752
      67)
    object Label4: TLabel
      Left = 8
      Top = 17
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object btnAdd: TBitBtn
      Left = 288
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 2
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 376
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 3
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 464
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 4
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 640
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 6
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 42
      Width = 169
      Height = 17
      Caption = 'Show inactive areas'
      TabOrder = 1
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 552
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 5
      OnClick = btnExcelClick
    end
    object edtName: TEdit
      Left = 56
      Top = 13
      Width = 177
      Height = 21
      TabOrder = 0
      OnChange = edtNameChange
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 308
    Width = 752
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object dtsInstallationAreas: TDataSource
    DataSet = qryInstallationArea
    Left = 176
    Top = 72
  end
  object qryInstallationArea: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Installation_Area'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39')) AND'
      '  (Installation_Area.Description LIKE :Description)'
      'ORDER BY Description'
      '')
    Left = 88
    Top = 72
    ParamData = <
      item
        Name = 'inactive'
      end
      item
        Name = 'Description'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 256
    Top = 72
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
