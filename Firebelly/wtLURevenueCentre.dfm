object frmWTLURevenueCentre: TfrmWTLURevenueCentre
  Left = 366
  Top = 133
  BorderStyle = bsDialog
  Caption = 'Maintain Revenue Centre'
  ClientHeight = 398
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 17
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 724
    Height = 292
    Align = alClient
    DataSource = srcRevenueCentre
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'Revenue_Centre_Descr'
        Title.Caption = 'Description'
        Width = 295
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inactive'
        Visible = False
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 379
    Width = 724
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 370
    ExplicitWidth = 718
  end
  object Panel1: TPanel
    Left = 0
    Top = 292
    Width = 724
    Height = 87
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 283
    ExplicitWidth = 718
    DesignSize = (
      724
      87)
    object Label4: TLabel
      Left = 8
      Top = 20
      Width = 39
      Height = 17
      Caption = 'Search'
    end
    object btnAdd: TBitBtn
      Left = 256
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 346
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 437
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 616
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 4
      OnClick = BitBtn4Click
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 54
      Width = 209
      Height = 17
      Caption = 'Show inactive Revenue Centres'
      TabOrder = 5
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 525
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 6
      OnClick = btnExcelClick
    end
    object edtName: TEdit
      Left = 56
      Top = 16
      Width = 177
      Height = 25
      TabOrder = 0
      OnChange = edtNameChange
    end
  end
  object srcRevenueCentre: TDataSource
    DataSet = qryRevenueCentre
    OnDataChange = srcRevenueCentreDataChange
    Left = 136
    Top = 120
  end
  object qryRevenueCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39')) AND'
      '  (Revenue_Centre.Revenue_Centre_Descr LIKE :Description)'
      'ORDER BY Revenue_Centre_Descr'
      '')
    Left = 72
    Top = 120
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
    Left = 208
    Top = 120
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
