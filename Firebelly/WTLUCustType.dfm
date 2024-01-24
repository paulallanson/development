object frmWTLUCustType: TfrmWTLUCustType
  Left = 619
  Top = 96
  BorderStyle = bsDialog
  Caption = 'Customer Types'
  ClientHeight = 327
  ClientWidth = 476
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
    Width = 476
    Height = 241
    Align = alClient
    DataSource = dtsCustTypes
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
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
        FieldName = 'Description'
        Width = 304
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 241
    Width = 476
    Height = 67
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      476
      67)
    object btnAdd: TBitBtn
      Left = 8
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 96
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 184
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 360
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
    end
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 10
      Width = 169
      Height = 17
      Caption = 'Show inactive customer types'
      TabOrder = 4
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 272
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 308
    Width = 476
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object dtsCustTypes: TDataSource
    DataSet = qryCustTypes
    Left = 160
    Top = 72
  end
  object qryCustTypes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Type'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39'))'
      'ORDER BY Description'
      '')
    Left = 88
    Top = 72
    ParamData = <
      item
        Name = 'inactive'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 224
    Top = 72
  end
end
