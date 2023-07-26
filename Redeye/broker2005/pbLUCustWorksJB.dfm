object frmpbluCustWorksJB: TfrmpbluCustWorksJB
  Left = 152
  Top = 143
  Width = 713
  Height = 400
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Works Instructions'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 705
    Height = 306
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Works_order_Number'
        Title.Caption = 'WI Number'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Order Date'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 204
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
    Top = 306
    Width = 705
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      705
      41)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 90
      Height = 13
      Caption = 'Description Search'
    end
    object Label2: TLabel
      Left = 366
      Top = 16
      Width = 54
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'WI Number'
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
    object edtOrder: TEdit
      Left = 436
      Top = 12
      Width = 90
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtOrderKeyPress
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
    Top = 347
    Width = 705
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
  object Query1: TFDQuery
    Left = 448
    Top = 88
  end
end
