object frmWTLUFitters: TfrmWTLUFitters
  Left = 271
  Top = 136
  BorderStyle = bsDialog
  Caption = 'Maintain Fitters'
  ClientHeight = 318
  ClientWidth = 451
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
    Width = 451
    Height = 232
    Align = alClient
    DataSource = srcFitters
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
    Top = 299
    Width = 451
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
    Top = 232
    Width = 451
    Height = 67
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      451
      67)
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 10
      Width = 169
      Height = 17
      Caption = 'Show inactive fitters'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object btnAdd: TBitBtn
      Left = 16
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 104
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 192
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object btnExcel: TBitBtn
      Left = 280
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 4
      OnClick = btnExcelClick
    end
    object BitBtn4: TBitBtn
      Left = 368
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 5
      OnClick = BitBtn4Click
      NumGlyphs = 2
    end
  end
  object srcFitters: TDataSource
    DataSet = qryFitters
    OnDataChange = srcFittersDataChange
    Left = 136
    Top = 120
  end
  object qryFitters: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Fitter'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39'))'
      'ORDER BY Fitter_Name'
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
