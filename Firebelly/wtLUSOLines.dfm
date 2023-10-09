object frmWTLUSOLines: TfrmWTLUSOLines
  Left = 230
  Top = 146
  Caption = 'Convert quote to job - sales order line selection'
  ClientHeight = 258
  ClientWidth = 638
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 570
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 217
    Width = 638
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      638
      41)
    object btnSelect: TButton
      Left = 453
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
      Left = 549
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
    Width = 638
    Height = 176
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
    Left = 0
    Top = 0
    Width = 638
    Height = 41
    Align = alTop
    ParentBackground = False
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
  object qrySOLines: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *,'
      
        '        (Nett_Price - Discount_Value + Markup_Value + Waste_Valu' +
        'e) as Supply_Price'
      'from sales_order_line'
      'where sales_order = :sales_order and'
      'quote <> NULL and Job is NULL'
      'order by sales_order_line_no')
    Left = 288
    Top = 80
    ParamData = <
      item
        Name = 'sales_order'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrySOLinesSales_order_Line_no: TIntegerField
      FieldName = 'Sales_order_Line_no'
      Origin = 'Sales_order_Line_no'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySOLinesSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'Sales_Order'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySOLinesJob: TFloatField
      FieldName = 'Job'
      Origin = 'Job'
    end
    object qrySOLinesUnit_price: TCurrencyField
      FieldName = 'Unit_price'
      Origin = 'Unit_price'
      Required = True
    end
    object qrySOLinesQuantity: TIntegerField
      FieldName = 'Quantity'
      Origin = 'Quantity'
      Required = True
    end
    object qrySOLinesUnit_cost: TCurrencyField
      FieldName = 'Unit_cost'
      Origin = 'Unit_cost'
      Required = True
    end
    object qrySOLinesQuantity_Allocated: TIntegerField
      FieldName = 'Quantity_Allocated'
      Origin = 'Quantity_Allocated'
      Required = True
    end
    object qrySOLinesQuantity_Delivered: TIntegerField
      FieldName = 'Quantity_Delivered'
      Origin = 'Quantity_Delivered'
      Required = True
    end
    object qrySOLinesQuantity_Invoiced: TIntegerField
      FieldName = 'Quantity_Invoiced'
      Origin = 'Quantity_Invoiced'
      Required = True
    end
    object qrySOLinesSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'
      Origin = 'Sell_Unit'
      Required = True
    end
    object qrySOLinesCost_Unit: TIntegerField
      FieldName = 'Cost_Unit'
      Origin = 'Cost_Unit'
      Required = True
    end
    object qrySOLinesNett_Price: TCurrencyField
      FieldName = 'Nett_Price'
      Origin = 'Nett_Price'
    end
    object qrySOLinesDiscount_Value: TCurrencyField
      FieldName = 'Discount_Value'
      Origin = 'Discount_Value'
    end
    object qrySOLinesInstallation_price: TCurrencyField
      FieldName = 'Installation_price'
      Origin = 'Installation_price'
    end
    object qrySOLinesSurvey_price: TCurrencyField
      FieldName = 'Survey_price'
      Origin = 'Survey_price'
    end
    object qrySOLinesDelivery_Price: TCurrencyField
      FieldName = 'Delivery_Price'
      Origin = 'Delivery_Price'
    end
    object qrySOLinesVat: TIntegerField
      FieldName = 'Vat'
      Origin = 'Vat'
    end
    object qrySOLinesDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 255
    end
    object qrySOLinesProduct: TIntegerField
      FieldName = 'Product'
      Origin = 'Product'
    end
    object qrySOLinesQuote: TIntegerField
      FieldName = 'Quote'
      Origin = 'Quote'
    end
    object qrySOLinesMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
      Origin = 'Markup_Value'
    end
    object qrySOLinesWaste_Value: TFloatField
      FieldName = 'Waste_Value'
      Origin = 'Waste_Value'
    end
    object qrySOLinesSSMA_TimeStamp: TBytesField
      AutoGenerateValue = arDefault
      FieldName = 'SSMA_TimeStamp'
      Origin = 'SSMA_TimeStamp'
      ReadOnly = True
      Required = True
      Size = 8
    end
    object qrySOLinesSupply_Price: TFloatField
      FieldName = 'Supply_Price'
      Origin = 'Supply_Price'
      ReadOnly = True
    end
  end
  object dtsSOLines: TDataSource
    DataSet = qrySOLines
    Left = 304
    Top = 64
  end
end
