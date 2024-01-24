object frmwtLULevelofImportance: TfrmwtLULevelofImportance
  Left = 409
  Top = 158
  BorderStyle = bsDialog
  Caption = 'Level of Importance'
  ClientHeight = 326
  ClientWidth = 424
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
    Width = 424
    Height = 233
    Align = alClient
    DataSource = srcLevelOfImportance
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
        FieldName = 'Importance_Description'
        Title.Caption = 'Importance'
        Width = 256
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 307
    Width = 424
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
    Top = 233
    Width = 424
    Height = 74
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      424
      74)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 89
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 170
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 340
      Top = 41
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
      Left = 8
      Top = 17
      Width = 233
      Height = 17
      Caption = 'Show inactive levels of importance'
      TabOrder = 4
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 254
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object srcLevelOfImportance: TDataSource
    DataSet = qryLevelofImportance
    Left = 168
    Top = 56
  end
  object qryLevelofImportance: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Level_of_Importance'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39'))'
      'ORDER BY Importance_Description'
      '')
    Left = 104
    Top = 56
    ParamData = <
      item
        Name = 'inactive'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 240
    Top = 56
  end
end
