object frmpbluCustOrdersJB: TfrmpbluCustOrdersJB
  Left = 57
  Top = 101
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Production Orders'
  ClientHeight = 361
  ClientWidth = 809
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
    Width = 809
    Height = 301
    Align = alClient
    DataSource = dtmdlOrders.dtsOrders
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
    Width = 809
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      809
      41)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 90
      Height = 13
      Caption = 'Description Search'
    end
    object Label2: TLabel
      Left = 478
      Top = 16
      Width = 64
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Order number'
    end
    object btnClose: TButton
      Left = 734
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
      Width = 113
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object edtOrder: TEdit
      Left = 548
      Top = 12
      Width = 90
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtOrderKeyPress
    end
    object btnSelect: TButton
      Left = 646
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      TabOrder = 3
      OnClick = btnSelectClick
    end
    object chkbxShowAll: TCheckBox
      Left = 232
      Top = 14
      Width = 169
      Height = 17
      Caption = 'Show all orders not in job bags'
      TabOrder = 4
      OnClick = chkbxShowAllClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 342
    Width = 809
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
