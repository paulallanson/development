object frmWTLUStockSystem: TfrmWTLUStockSystem
  Left = 271
  Top = 136
  BorderStyle = bsDialog
  Caption = 'Stock System'
  ClientHeight = 233
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 389
    Height = 173
    Align = alClient
    DataSource = srcStockSystem
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
        FieldName = 'Stock_System_Description'
        Title.Caption = 'Stock System'
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_System'
        Width = 172
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 173
    Width = 389
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      389
      41)
    object btnAdd: TBitBtn
      Left = 18
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 108
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 199
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 290
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn4Click
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 214
    Width = 389
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object srcStockSystem: TDataSource
    DataSet = qryStockSystem
    OnDataChange = srcStockSystemDataChange
    Left = 152
    Top = 120
  end
  object qryStockSystem: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'SELECT *'
      'FROM Stock_System'
      'ORDER BY Stock_System_Description'
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
