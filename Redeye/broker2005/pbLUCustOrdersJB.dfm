object frmpbluCustOrdersJB: TfrmpbluCustOrdersJB
  Left = 57
  Top = 101
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Production Orders'
  ClientHeight = 361
  ClientWidth = 854
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
    Width = 854
    Height = 301
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
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Order_Price'
        Title.Caption = 'Cost Price'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Order_unit'
        Title.Caption = 'Cost Unit'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Selling_Price'
        Title.Caption = 'Sell Price'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Selling_unit'
        Title.Caption = 'Sell Unit'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 52
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
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_Reference'
        Title.Caption = 'Product Code'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Form_Reference_ID'
        Title.Caption = 'Form Reference'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Branch_Name'
        Title.Caption = 'Branch'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status_Text'
        Title.Caption = 'Status'
        Width = 109
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 301
    Width = 854
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 292
    ExplicitWidth = 803
    DesignSize = (
      854
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
      Left = 767
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 2
      OnClick = btnCloseClick
      ExplicitLeft = 716
    end
    object edtSearch: TEdit
      Left = 121
      Top = 10
      Width = 113
      Height = 25
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object edtOrder: TEdit
      Left = 581
      Top = 10
      Width = 90
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtOrderKeyPress
      ExplicitLeft = 536
    end
    object btnSelect: TButton
      Left = 679
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      TabOrder = 3
      OnClick = btnSelectClick
      ExplicitLeft = 628
    end
    object chkbxShowAll: TCheckBox
      Left = 243
      Top = 14
      Width = 198
      Height = 17
      Caption = 'Show all orders not in job bags'
      TabOrder = 4
      OnClick = chkbxShowAllClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 342
    Width = 854
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 333
    ExplicitWidth = 803
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 325
    OnTimer = tmrSearchTimer
    Left = 368
    Top = 128
  end
end
