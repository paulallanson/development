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
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 745
    Height = 337
    Align = alClient
    DataSource = srcEdges
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
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
  end
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 337
    Width = 745
    Height = 91
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      745
      91)
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object btnAdd: TBitBtn
      Left = 296
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 384
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 472
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 648
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 3
      OnClick = BitBtn4Click
      NumGlyphs = 2
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
      Top = 10
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
      Height = 21
      TabOrder = 7
      OnChange = edtNameChange
    end
  end
  object srcEdges: TDataSource
    DataSet = qryEdgeProfile
    Left = 136
    Top = 120
  end
  object qryEdgeProfile: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TQuery
    DatabaseName = 'WT'
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
