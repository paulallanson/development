object frmpbluCustWorksJB: TfrmpbluCustWorksJB
  Left = 152
  Top = 143
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Works Instructions'
  ClientHeight = 361
  ClientWidth = 697
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
    Width = 697
    Height = 301
    Align = alClient
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
        FieldName = 'Works_order_Number'
        Title.Caption = 'WI Number'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Order Date'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Actual_Quantity'
        Title.Caption = 'Quantity'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cust_Order_No'
        Title.Caption = 'Customer Order No.'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Required'
        Title.Caption = 'Date Required'
        Width = 88
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
    ExplicitTop = 292
    ExplicitWidth = 691
    DesignSize = (
      697
      41)
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 66
      Height = 17
      Caption = 'Description'
    end
    object Label2: TLabel
      Left = 350
      Top = 14
      Width = 67
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'WI Number'
    end
    object btnClose: TButton
      Left = 610
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
      Left = 80
      Top = 10
      Width = 180
      Height = 25
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object edtOrder: TEdit
      Left = 424
      Top = 10
      Width = 90
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtOrderKeyPress
    end
    object btnSelect: TButton
      Left = 522
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
    Width = 697
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
  object Query1: TFDQuery
    Left = 448
    Top = 88
  end
end
