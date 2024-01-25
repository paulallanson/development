object frmpbluOrderdeliv: TfrmpbluOrderdeliv
  Left = 46
  Top = 114
  Caption = 'Delivery details for order'
  ClientHeight = 244
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 203
    Width = 682
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      682
      41)
    object btnDeliveryNotes: TButton
      Left = 346
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Notes'
      TabOrder = 1
      OnClick = btnDeliveryNotesClick
    end
    object btnLabels: TButton
      Left = 426
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Prod Labels'
      TabOrder = 2
      OnClick = btnLabelsClick
    end
    object btnChange: TButton
      Left = 266
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'C&onfirm'
      TabOrder = 0
      OnClick = btnChangeClick
    end
    object btnClose: TButton
      Left = 594
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 4
      OnClick = btnCloseClick
    end
    object btnBoxLabels: TButton
      Left = 506
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Box Labels'
      TabOrder = 3
      OnClick = btnBoxLabelsClick
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 273
    Height = 201
    DataSource = dtmdlDeliveries.dtsDetails
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Date'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qty_to_Deliver'
        Title.Caption = 'Quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DeliveryName'
        Title.Caption = 'Deliver to'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Deliv_Actual'
        Title.Caption = 'Date Delivered'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qty_Delivered'
        Title.Caption = 'Delivered Qty'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cust_order_no'
        Title.Caption = 'Customer Order number'
        Width = 206
        Visible = True
      end>
  end
  object dbgSODetails: TDBGrid
    Left = 288
    Top = 0
    Width = 320
    Height = 201
    DataSource = dtmdlDeliveries.dtsSODetails
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgSODetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Delivery_Date'
        Title.Caption = 'Date'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Replenish_Source_Descr'
        Title.Caption = 'Replenish Source'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DeliveryName'
        Title.Caption = 'Deliver to'
        Width = 224
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delivery_Date'
        Title.Caption = 'Date Delivered'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cust_Order_No'
        Title.Caption = 'Customer Order number'
        Width = 180
        Visible = True
      end>
  end
end
