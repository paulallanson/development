object frmWTLUReps: TfrmWTLUReps
  Left = 271
  Top = 136
  BorderStyle = bsDialog
  Caption = 'Maintain reps'
  ClientHeight = 351
  ClientWidth = 418
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
    Width = 418
    Height = 256
    Align = alClient
    DataSource = srcReps
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
        FieldName = 'Rep_Name'
        Title.Caption = 'Rep Name'
        Width = 231
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end>
  end
  object stsbrdetails: TStatusBar
    Left = 0
    Top = 332
    Width = 418
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
    Top = 256
    Width = 418
    Height = 76
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      418
      76)
    object btnAdd: TBitBtn
      Left = 8
      Top = 43
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 90
      Top = 43
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 172
      Top = 43
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 336
      Top = 43
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
      Left = 8
      Top = 19
      Width = 169
      Height = 17
      Caption = 'Show inactive reps'
      TabOrder = 4
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 254
      Top = 43
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object srcReps: TDataSource
    DataSet = qryReps
    OnDataChange = srcRepsDataChange
    Left = 136
    Top = 120
  end
  object qryReps: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Rep'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39'))'
      'ORDER BY Rep_Name'
      '')
    Left = 72
    Top = 120
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
    Top = 120
  end
end
