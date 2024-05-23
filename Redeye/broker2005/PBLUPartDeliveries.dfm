object PBLUPartDeliveriesFrm: TPBLUPartDeliveriesFrm
  Left = 227
  Top = 138
  Caption = 'Product Deliveries due'
  ClientHeight = 442
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 858
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 70
      Height = 13
      Caption = 'Product Code'
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 59
      Height = 13
      Caption = 'Description'
    end
    object edtPart: TEdit
      Left = 104
      Top = 8
      Width = 217
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtPartDescription: TEdit
      Left = 104
      Top = 36
      Width = 361
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 369
    Width = 858
    Height = 54
    Align = alBottom
    TabOrder = 1
    object btnClose: TButton
      Left = 768
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Clos&e'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnNone: TButton
      Left = 672
      Top = 16
      Width = 75
      Height = 25
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
      Caption = '&Select'
      Enabled = False
      TabOrder = 2
      OnClick = btnSelectClick
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 65
    Width = 858
    Height = 304
    Align = alClient
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
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
    Top = 423
    Width = 858
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
end
