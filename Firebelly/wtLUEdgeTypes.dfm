object frmWTLUEdgeTypes: TfrmWTLUEdgeTypes
  Left = 248
  Top = 159
  BorderStyle = bsDialog
  Caption = 'Edge types'
  ClientHeight = 256
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 17
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 409
    Height = 168
    Align = alClient
    DataSource = srcEdgeType
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
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
    Top = 237
    Width = 409
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 198
    ExplicitWidth = 403
  end
  object Panel1: TPanel
    Left = 0
    Top = 168
    Width = 409
    Height = 69
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      409
      69)
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 8
      Width = 169
      Height = 17
      Caption = 'Show inactive edge types'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = BitBtn1Click
      ExplicitTop = 26
    end
    object btnEdit: TBitBtn
      Left = 88
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
      ExplicitTop = 26
    end
    object btndelete: TBitBtn
      Left = 168
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btndeleteClick
      ExplicitTop = 26
    end
    object BitBtn4: TBitBtn
      Left = 331
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 4
      ExplicitTop = 26
    end
    object btnExcel: TBitBtn
      Left = 250
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 5
      OnClick = btnExcelClick
      ExplicitTop = 26
    end
  end
  object srcEdgeType: TDataSource
    DataSet = qryEdgeType
    OnDataChange = srcEdgeTypeDataChange
    Left = 152
    Top = 56
  end
  object qryEdgeType: TFDQuery
    ConnectionName = 'WT'
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
        Name = 'inactive'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 232
    Top = 56
  end
end
