object frmpbluCustQuotesJB: TfrmpbluCustQuotesJB
  Left = 57
  Top = 101
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Quotes'
  ClientHeight = 361
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 697
    Height = 301
    Align = alClient
    DataSource = dtmdlQuotes.dtsQuotesJB
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Quote'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Line'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Date'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 313
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status_Description'
        Title.Caption = 'Status'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rep_Name'
        Title.Caption = 'Rep'
        Width = 91
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 301
    Width = 697
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      697
      41)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 96
      Height = 13
      Caption = 'Description Search'
    end
    object Label2: TLabel
      Left = 358
      Top = 16
      Width = 75
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Quote number'
    end
    object btnClose: TButton
      Left = 622
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object edtSearch: TEdit
      Left = 104
      Top = 12
      Width = 180
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object edtNumber: TEdit
      Left = 436
      Top = 12
      Width = 90
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtNumberKeyPress
    end
    object btnSelect: TButton
      Left = 534
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      TabOrder = 3
      OnClick = btnSelectClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 342
    Width = 697
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 325
    OnTimer = tmrSearchTimer
    Left = 368
    Top = 128
  end
end
