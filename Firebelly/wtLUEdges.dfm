object frmwtLUEdges: TfrmwtLUEdges
  Left = 177
  Top = 117
  BorderStyle = bsDialog
  Caption = 'Maintain edge profile descriptions'
  ClientHeight = 447
  ClientWidth = 745
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
    Width = 745
    Height = 337
    Align = alClient
    DataSource = srcEdges
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
        FieldName = 'Description'
        Width = 304
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 428
    Width = 745
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 419
    ExplicitWidth = 739
  end
  object Panel1: TPanel
    Left = 0
    Top = 337
    Width = 745
    Height = 91
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 328
    ExplicitWidth = 739
    DesignSize = (
      745
      91)
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 39
      Height = 17
      Caption = 'Search'
    end
    object btnAdd: TBitBtn
      Left = 296
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 384
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 472
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 648
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 66
      Width = 169
      Height = 17
      Caption = 'Show inactive edge profiles'
      TabOrder = 4
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 560
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 5
      OnClick = btnExcelClick
    end
    object chkbxShowOnline: TCheckBox
      Left = 16
      Top = 41
      Width = 169
      Height = 17
      Caption = 'Show only online edge profiles'
      TabOrder = 6
      OnClick = chkbxShowInactiveClick
    end
    object edtName: TEdit
      Left = 64
      Top = 12
      Width = 177
      Height = 25
      TabOrder = 7
      OnChange = edtNameChange
    end
  end
  object srcEdges: TDataSource
    DataSet = qryEdgeProfile
    Left = 136
    Top = 120
  end
  object qryEdgeProfile: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Edge_Profile'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39')) AND'
      '  (Edge_Profile.Description LIKE :Description)'
      'ORDER BY Description'
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
    Left = 232
    Top = 120
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
