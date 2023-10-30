object frmWTLUSpecialInstruction: TfrmWTLUSpecialInstruction
  Left = 384
  Top = 151
  BorderStyle = bsDialog
  Caption = 'Special Instructions'
  ClientHeight = 299
  ClientWidth = 701
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
  object DetsDBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 618
    Height = 240
    Align = alClient
    DataSource = DetsSRC
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DetsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Description'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Width = 336
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 240
    Width = 701
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 231
    ExplicitWidth = 695
    DesignSize = (
      701
      40)
    object Label4: TLabel
      Left = 8
      Top = 15
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object btnAdd: TBitBtn
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 338
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 429
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 608
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 5
    end
    object btnExcel: TBitBtn
      Left = 517
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 4
      OnClick = btnExcelClick
    end
    object edtName: TEdit
      Left = 56
      Top = 11
      Width = 177
      Height = 21
      TabOrder = 0
      OnChange = edtNameChange
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 280
    Width = 701
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 271
    ExplicitWidth = 695
  end
  object pnlLookup: TPanel
    Left = 618
    Top = 0
    Width = 83
    Height = 240
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = 612
    ExplicitHeight = 231
    object btnSelect: TBitBtn
      Left = 5
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Select'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnSelectClick
    end
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 144
    Top = 64
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Special_Instruction.Special_Instruction,'
      '            Special_Instruction.Narrative,'
      '            Special_Instruction.Description'
      'FROM Special_Instruction'
      'WHERE'
      '  (Special_Instruction.Description LIKE :Description)'
      'ORDER BY Special_Instruction.Description'
      '')
    Left = 64
    Top = 64
    ParamData = <
      item
        Name = 'Description'
      end>
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 232
    Top = 64
  end
end
