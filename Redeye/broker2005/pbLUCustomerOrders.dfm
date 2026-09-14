object PBLUCustomerOrdersFrm: TPBLUCustomerOrdersFrm
  Left = 57
  Top = 101
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Buy Print Orders'
  ClientHeight = 386
  ClientWidth = 858
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
    Width = 858
    Height = 326
    Align = alClient
    DataSource = dtmdlOrders.dtsOrders
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
        FieldName = 'Sales_order'
        Title.Caption = 'Order'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Order_date'
        Title.Caption = 'Order Date'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Order_Price'
        Title.Caption = 'Cost Price'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Order_unit'
        Title.Caption = 'Cost Unit'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Selling_Price'
        Title.Caption = 'Sell Price'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Selling_unit'
        Title.Caption = 'Sell Unit'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 73
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
        FieldName = 'Goods_Required'
        Title.Caption = 'Date Required'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_Reference'
        Title.Caption = 'Product Code'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Form_Reference_ID'
        Title.Caption = 'Form Reference'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Branch_Name'
        Title.Caption = 'Branch'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status_Text'
        Title.Caption = 'Status'
        Width = 123
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 326
    Width = 858
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 313
    ExplicitWidth = 817
    DesignSize = (
      858
      41)
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 109
      Height = 17
      Caption = 'Description Search'
    end
    object Label2: TLabel
      Left = 493
      Top = 14
      Width = 84
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'Order number'
    end
    object btnClose: TButton
      Left = 769
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 2
      OnClick = btnCloseClick
      ExplicitLeft = 728
    end
    object edtSearch: TEdit
      Left = 119
      Top = 10
      Width = 113
      Height = 25
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object edtOrder: TEdit
      Left = 583
      Top = 10
      Width = 90
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtOrderKeyPress
      ExplicitLeft = 542
    end
    object btnSelect: TButton
      Left = 681
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      TabOrder = 3
      OnClick = btnSelectClick
      ExplicitLeft = 640
    end
    object chkbxShowAll: TCheckBox
      Left = 237
      Top = 14
      Width = 204
      Height = 17
      Caption = 'Show all orders not in job bags'
      TabOrder = 4
      Visible = False
      OnClick = chkbxShowAllClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 367
    Width = 858
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 354
    ExplicitWidth = 817
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 325
    OnTimer = tmrSearchTimer
    Left = 368
    Top = 128
  end
end
