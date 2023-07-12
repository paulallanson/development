object frmWTLUEdgeTypes: TfrmWTLUEdgeTypes
  Left = 248
  Top = 159
  BorderStyle = bsDialog
  Caption = 'Edge types'
  ClientHeight = 235
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 415
    Height = 160
    Align = alClient
    DataSource = srcEdgeType
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'Edge_Type_Description'
        Title.Caption = 'Edge Type Description'
        Width = 273
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
    Top = 216
    Width = 415
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
    Top = 160
    Width = 415
    Height = 56
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      415
      56)
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 4
      Width = 169
      Height = 17
      Caption = 'Show inactive edge types'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 26
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 88
      Top = 26
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btndelete: TBitBtn
      Left = 168
      Top = 26
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btndeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 331
      Top = 26
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 4
    end
    object btnExcel: TBitBtn
      Left = 250
      Top = 26
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object srcEdgeType: TDataSource
    DataSet = qryEdgeType
    OnDataChange = srcEdgeTypeDataChange
    Left = 152
    Top = 56
  end
  object qryEdgeType: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Edge_Type'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39'))'
      'ORDER BY Edge_Type_Description'
      '')
    Left = 72
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TQuery
    DatabaseName = 'WT'
    Left = 232
    Top = 56
  end
end
