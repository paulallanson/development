object frmWTLUProductGroups: TfrmWTLUProductGroups
  Left = 292
  Top = 175
  BorderStyle = bsDialog
  Caption = 'Product Groups'
  ClientHeight = 246
  ClientWidth = 409
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
    Width = 409
    Height = 167
    Align = alClient
    DataSource = srcDetails
    DrawingStyle = gdsGradient
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
        FieldName = 'Product_Group_Description'
        Title.Caption = 'Product Group'
        Width = 272
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
    Top = 227
    Width = 409
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 167
    Width = 409
    Height = 60
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      409
      60)
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 7
      Width = 169
      Height = 17
      Caption = 'Show inactive product groups'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 27
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 88
      Top = 27
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 168
      Top = 27
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object btnExcel: TBitBtn
      Left = 248
      Top = 27
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 4
      OnClick = btnExcelClick
    end
    object BitBtn4: TBitBtn
      Left = 329
      Top = 27
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 5
    end
  end
  object srcDetails: TDataSource
    DataSet = qryProductGroup
    OnDataChange = SetButtons
    Left = 152
    Top = 120
  end
  object qryProductGroup: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Product_Group'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39'))'
      'ORDER BY Product_Group_Description'
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
