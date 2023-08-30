object frmWTLURemedialCategory: TfrmWTLURemedialCategory
  Left = 366
  Top = 133
  BorderStyle = bsDialog
  Caption = 'Maintain Remedial Category'
  ClientHeight = 407
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 700
    Height = 301
    Align = alClient
    DataSource = srcRemedialCategory
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Remedial_Category_Descr'
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
    Top = 388
    Width = 700
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
    Top = 301
    Width = 700
    Height = 87
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      700
      87)
    object Label4: TLabel
      Left = 8
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object btnAdd: TBitBtn
      Left = 256
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 346
      Top = 14
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
      Top = 14
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
      Top = 14
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
      Width = 169
      Height = 17
      Caption = 'Show inactive Remedial Category'
      TabOrder = 5
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 525
      Top = 14
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
      Height = 21
      TabOrder = 0
      OnChange = edtNameChange
    end
  end
  object srcRemedialCategory: TDataSource
    DataSet = qryRemedialCategory
    OnDataChange = srcRemedialCategoryDataChange
    Left = 184
    Top = 120
  end
  object qryRemedialCategory: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Remedial_Category'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39')) AND'
      '  (Remedial_Category.Remedial_Category_Descr LIKE :Description)'
      'ORDER BY Remedial_Category_Descr'
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
    Left = 264
    Top = 120
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
