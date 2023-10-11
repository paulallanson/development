object PBLUCustDeliveriesFrm: TPBLUCustDeliveriesFrm
  Left = 227
  Top = 138
  Width = 870
  Height = 480
  Caption = 'Customer Deliveries Due'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object edtCustomerName: TEdit
      Left = 88
      Top = 12
      Width = 361
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 373
    Width = 862
    Height = 54
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      862
      54)
    object Label2: TLabel
      Left = 8
      Top = 22
      Width = 74
      Height = 13
      Caption = 'Product Search'
    end
    object btnClose: TButton
      Left = 768
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Clos&e'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnNone: TButton
      Left = 672
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&None'
      ModalResult = 1
      TabOrder = 1
      OnClick = btnNoneClick
    end
    object btnSelect: TButton
      Left = 576
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      Enabled = False
      TabOrder = 2
      OnClick = btnSelectClick
    end
    object edtSearch: TEdit
      Left = 96
      Top = 18
      Width = 145
      Height = 21
      TabOrder = 3
      OnChange = edtSearchChange
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 49
    Width = 862
    Height = 324
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Purchase_order'
        Title.Caption = 'PO Number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_Reference'
        Title.Caption = 'Product Code'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Suppliers_Desc'
        Title.Caption = 'Description'
        Width = 241
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Qty_To_Deliver'
        Title.Caption = 'Quantity Due'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Due Date'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 205
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 256
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_deliv_Actual'
        Title.Caption = 'Date Delivered'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_order_no'
        Title.Caption = 'Customer Reference'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rep_Name'
        Title.Caption = 'Rep'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Account_Manager'
        Title.Caption = 'Account Manager'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Form_Reference_ID'
        Title.Caption = 'Form Reference'
        Width = 88
        Visible = True
      end>
  end
  object stsBrDetails: TStatusBar
    Left = 0
    Top = 427
    Width = 862
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object tmrSearch: TTimer
    Interval = 500
    OnTimer = tmrSearchTimer
    Left = 368
    Top = 136
  end
end
