object frmWTLUProspectAction: TfrmWTLUProspectAction
  Left = 271
  Top = 136
  BorderStyle = bsDialog
  Caption = 'Maintain Prospect Actions'
  ClientHeight = 318
  ClientWidth = 423
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
    Width = 423
    Height = 248
    Align = alClient
    DataSource = srcAction
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
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Prospect_Action_Description'
        Title.Caption = 'Action'
        Width = 176
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 299
    Width = 423
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 290
    ExplicitWidth = 417
  end
  object Panel1: TPanel
    Left = 0
    Top = 248
    Width = 423
    Height = 51
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 239
    ExplicitWidth = 417
    DesignSize = (
      423
      51)
    object btnAdd: TBitBtn
      Left = 8
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 90
      Top = 18
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
      Top = 18
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
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object btnExcel: TBitBtn
      Left = 254
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 4
      OnClick = btnExcelClick
    end
  end
  object srcAction: TDataSource
    DataSet = qryAction
    OnDataChange = srcActionDataChange
    Left = 144
    Top = 120
  end
  object qryAction: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Prospect_Action'
      'ORDER BY Prospect_Action_Description'
      '')
    Left = 72
    Top = 120
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 232
    Top = 120
  end
end
