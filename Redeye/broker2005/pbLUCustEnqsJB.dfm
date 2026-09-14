object frmpbluCustEnqsJB: TfrmpbluCustEnqsJB
  Left = 57
  Top = 101
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Enquiries'
  ClientHeight = 361
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 17
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 743
    Height = 301
    Align = alClient
    DataSource = dtmdlEnqs.dtsEnqsJB
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
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Enquiry'
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
    Width = 743
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 292
    ExplicitWidth = 691
    DesignSize = (
      743
      41)
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 109
      Height = 17
      Caption = 'Description Search'
    end
    object Label2: TLabel
      Left = 374
      Top = 14
      Width = 92
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'Enquiry number'
    end
    object btnClose: TButton
      Left = 656
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 2
      OnClick = btnCloseClick
      ExplicitLeft = 604
    end
    object edtSearch: TEdit
      Left = 126
      Top = 10
      Width = 180
      Height = 25
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object edtNumber: TEdit
      Left = 470
      Top = 10
      Width = 90
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtNumberKeyPress
    end
    object btnSelect: TButton
      Left = 568
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      TabOrder = 3
      OnClick = btnSelectClick
      ExplicitLeft = 516
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 342
    Width = 743
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 333
    ExplicitWidth = 691
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 325
    OnTimer = tmrSearchTimer
    Left = 368
    Top = 128
  end
end
