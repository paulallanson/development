object frmWTLUSOLines: TfrmWTLUSOLines
  Left = 230
  Top = 146
  Width = 650
  Height = 296
  Caption = 'Convert quote to job - sales order line selection'
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 570
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 228
    Width = 642
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      642
      41)
    object btnSelect: TButton
      Left = 457
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Select'
      Enabled = False
      TabOrder = 0
      OnClick = btnSelectClick
    end
    object btnCancel: TButton
      Left = 553
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 41
    Width = 642
    Height = 187
    Align = alClient
    DataSource = dtsSOLines
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Quote'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 271
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supply_Price'
        Title.Caption = 'Supply Price'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Survey_price'
        Title.Caption = 'Templating'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Installation_price'
        Title.Caption = 'Installation'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delivery_Price'
        Title.Caption = 'Delivery Price'
        Width = 74
        Visible = True
      end>
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 642
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 55
      Height = 13
      Caption = 'Sales Order'
    end
    object Label2: TLabel
      Left = 184
      Top = 12
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object edtSalesOrder: TEdit
      Left = 72
      Top = 8
      Width = 81
      Height = 21
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtCustomerName: TEdit
      Left = 248
      Top = 8
      Width = 305
      Height = 21
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object qrySOLines: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *,'
      
        '        (Nett_Price - Discount_Value + Markup_Value + Waste_Valu' +
        'e) as Supply_Price'
      'from sales_order_line'
      'where sales_order = :sales_order and'
      'quote <> NULL and Job is NULL'
      'order by sales_order_line_no')
    Left = 256
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
    object qrySOLinesSales_order_Line_no: TIntegerField
      FieldName = 'Sales_order_Line_no'
    end
    object qrySOLinesSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qrySOLinesJob: TFloatField
      FieldName = 'Job'
    end
    object qrySOLinesUnit_price: TFloatField
      FieldName = 'Unit_price'
      DisplayFormat = '0.00'
    end
    object qrySOLinesQuantity: TIntegerField
      FieldName = 'Quantity'
    end
    object qrySOLinesUnit_cost: TFloatField
      FieldName = 'Unit_cost'
      DisplayFormat = '0.00'
    end
    object qrySOLinesQuantity_Allocated: TIntegerField
      FieldName = 'Quantity_Allocated'
    end
    object qrySOLinesQuantity_Delivered: TIntegerField
      FieldName = 'Quantity_Delivered'
    end
    object qrySOLinesQuantity_Invoiced: TIntegerField
      FieldName = 'Quantity_Invoiced'
    end
    object qrySOLinesSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'
    end
    object qrySOLinesCost_Unit: TIntegerField
      FieldName = 'Cost_Unit'
    end
    object qrySOLinesNett_Price: TFloatField
      FieldName = 'Nett_Price'
      DisplayFormat = '0.00'
    end
    object qrySOLinesDiscount_Value: TFloatField
      FieldName = 'Discount_Value'
      DisplayFormat = '0.00'
    end
    object qrySOLinesInstallation_price: TFloatField
      FieldName = 'Installation_price'
      DisplayFormat = '0.00'
    end
    object qrySOLinesSurvey_price: TFloatField
      FieldName = 'Survey_price'
      DisplayFormat = '0.00'
    end
    object qrySOLinesDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
      DisplayFormat = '0.00'
    end
    object qrySOLinesVat: TIntegerField
      FieldName = 'Vat'
    end
    object qrySOLinesDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object qrySOLinesProduct: TIntegerField
      FieldName = 'Product'
    end
    object qrySOLinesQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qrySOLinesMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
    end
    object qrySOLinesWaste_Value: TFloatField
      FieldName = 'Waste_Value'
    end
    object qrySOLinesSupply_Price: TFloatField
      FieldName = 'Supply_Price'
      DisplayFormat = '0.00'
    end
  end
  object dtsSOLines: TDataSource
    DataSet = qrySOLines
    Left = 304
    Top = 64
  end
end
