object frmWTLUFitters: TfrmWTLUFitters
  Left = 271
  Top = 136
  BorderStyle = bsDialog
  Caption = 'Maintain Fitters'
  ClientHeight = 355
  ClientWidth = 468
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
    Width = 468
    Height = 258
    Align = alClient
    DataSource = srcFitters
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
        FieldName = 'Fitter_Name'
        Title.Caption = 'Fitter'
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 336
    Width = 468
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 290
    ExplicitWidth = 445
  end
  object Panel1: TPanel
    Left = 0
    Top = 258
    Width = 468
    Height = 78
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 252
    DesignSize = (
      468
      78)
    object Label4: TLabel
      Left = 8
      Top = 10
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 306
      Top = 8
      Width = 129
      Height = 17
      Caption = 'Show inactive fitters'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object btnAdd: TBitBtn
      Left = 8
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = btnAddClick
      ExplicitTop = 36
    end
    object btnEdit: TBitBtn
      Left = 96
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
      ExplicitTop = 36
    end
    object btnDelete: TBitBtn
      Left = 184
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
      ExplicitTop = 36
    end
    object btnExcel: TBitBtn
      Left = 272
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 4
      OnClick = btnExcelClick
      ExplicitTop = 36
    end
    object BitBtn4: TBitBtn
      Left = 384
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 5
      OnClick = BitBtn4Click
    end
    object edtName: TEdit
      Left = 56
      Top = 6
      Width = 177
      Height = 21
      TabOrder = 6
      OnChange = edtNameChange
    end
  end
  object srcFitters: TDataSource
    DataSet = qryFitters
    OnDataChange = srcFittersDataChange
    Left = 136
    Top = 120
  end
  object qryFitters: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Fitter'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39')) AND'
      #9#9'(Fitter_Name LIKE :Description)'
      'ORDER BY Fitter_Name'
      '')
    Left = 72
    Top = 120
    ParamData = <
      item
        Name = 'inactive'
        ParamType = ptInput
      end
      item
        Name = 'DESCRIPTION'
        ParamType = ptInput
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 232
    Top = 120
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 232
    Top = 24
  end
end
