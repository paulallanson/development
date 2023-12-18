object STLUPartStockFrm: TSTLUPartStockFrm
  Left = 132
  Top = 55
  Caption = 'Lookup Product Stock Levels'
  ClientHeight = 492
  ClientWidth = 1150
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1150
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 62
      Height = 13
      Caption = 'Warehouse:'
    end
    object lblWarehouse: TLabel
      Left = 88
      Top = 16
      Width = 72
      Height = 13
      Caption = 'lblWarehouse'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 427
    Width = 1150
    Height = 46
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      1150
      46)
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 70
      Height = 13
      Caption = 'Product Code'
    end
    object edtSearch: TEdit
      Left = 88
      Top = 14
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object btbtnClose: TBitBtn
      Left = 1060
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btbtnCloseClick
    end
    object btnSelect: TBitBtn
      Left = 970
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Select '
      Default = True
      Enabled = False
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        03030303030303030303030303030303030303030303FF030303030303030303
        03030303030303040403030303030303030303030303030303F8F8FF03030303
        03030303030303030303040202040303030303030303030303030303F80303F8
        FF030303030303030303030303040202020204030303030303030303030303F8
        03030303F8FF0303030303030303030304020202020202040303030303030303
        0303F8030303030303F8FF030303030303030304020202FA0202020204030303
        0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
        040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
        03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
        FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
        0303030303030303030303FA0202020403030303030303030303030303F8FF03
        03F8FF03030303030303030303030303FA020202040303030303030303030303
        0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
        03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
        030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
        0202040303030303030303030303030303F8FF03F8FF03030303030303030303
        03030303FA0202030303030303030303030303030303F8FFF803030303030303
        030303030303030303FA0303030303030303030303030303030303F803030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnSelectClick
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 41
    Width = 1150
    Height = 386
    Align = alClient
    DataSource = dtsStock
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Part'
        Title.Caption = 'Product'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description'
        Title.Caption = 'Description'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'store_qty'
        Title.Caption = 'In Stock'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_alloc'
        Title.Caption = 'Allocated'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_free'
        Title.Caption = 'Free Stock'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'paid_for'
        Title.Caption = 'Paid'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'not_paid_for'
        Title.Caption = 'Unpaid'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prod_ord_qty'
        Title.Caption = 'On Buy Print'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Product_Class_Description'
        Title.Caption = 'Product Class'
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 473
    Width = 1150
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object dtsStock: TDataSource
    DataSet = qryStock
    Left = 560
    Top = 128
  end
  object qryStock: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'select part.Part,'
      '        Part.Customer,'
      '       part.part_description as description,'
      '       (select top 1 form_reference.form_reference_id'
      '         from form_reference'
      '         where part.part = form_reference.stock_reference'
      '       ) as form_reference_id,'
      '       (select top 1 form_reference.form_reference'
      '         from form_reference'
      '         where part.part = form_reference.stock_reference'
      '       ) as form_reference,'
      '       '#9'  sum(Store_Quantity) as store_qty,'
      #9'         sum(Quantity_Allocated) as qty_alloc,'
      #9'         sum(Store_Quantity-Quantity_Allocated) as qty_free,'
      '          (select sum(purch_ord_line.quantity_ordered)'
      '                    from purch_ord_line'
      
        '                    where purch_ord_line.part = Part_Store_Level' +
        's.part and'
      
        '                        Purch_ord_line.Fully_received <> '#39'Y'#39' ) a' +
        's purch_ord_qty,'
      '          (select sum(Delivery_detail.Qty_to_Deliver)'
      
        '                  from Purchase_Orderline POLine, Delivery_Detai' +
        'l, Form_Reference'
      
        '                  where Form_Reference.Stock_Reference = Part_St' +
        'ore_Levels.Part and'
      
        '                             POLine.form_reference = Form_refere' +
        'nce.form_reference and'
      
        #9#9#9'                          POLine.purch_ord_line_Status >= 20 ' +
        ' and'
      
        '                             POLine.purch_ord_line_Status < 22 a' +
        'nd'
      
        '                             ((Delivery_detail.purchase_order = ' +
        'POLine.purchase_order) and'
      
        #9#9#9'                           (Delivery_detail.Line = POLine.Lin' +
        'e)) and'
      
        '                              (Delivery_detail.delivery_to_Stock' +
        ' = '#39'Y'#39') and'
      
        '                              (Delivery_Detail.Qty_Delivered = 0' +
        ') and'
      
        '                              (stock_reference is not null)) as ' +
        'prod_ord_qty,'
      '          (select sum(store_stock.store_quantity)'
      '                from store_stock'
      '                where store_stock.part = part.part and'
      
        '                      store_stock.invoice_upfront = '#39'Y'#39') as paid' +
        '_for,'
      '          (select sum(store_stock.store_quantity)'
      '                from store_stock'
      '                where store_stock.part = part.part and'
      '                      ((store_stock.invoice_upfront <> '#39'Y'#39') or'
      
        '                      (store_stock.invoice_upfront is null))) as' +
        ' not_paid_for,'
      '       Not_in_Use,'
      '       Product_Class'
      
        'from (part left join part_store_levels on (part.part = part_stor' +
        'e_levels.part)) left join'
      '     store_stock on (part.part = store_stock.part)'
      'GROUP BY'
      '      Part.Part,'
      '      part.customer,'
      '      part.Part_Description,'
      '      part_store_levels.part,'
      '      Part.Sell_Pack_Quantity,'
      '      store_stock.part,'
      '      Part.Not_in_Use,'
      '      Part.Product_Class'
      'HAVING ((Part.Customer = :Customer) or (:Customer = 0)) and'
      '      ('
      '      (Part.Part Like :Description) or'
      '      (Part.Part_description Like :Description) or'
      '      ((select top 1 form_reference.form_reference_id'
      '       from form_reference'
      '       where part.part = form_reference.stock_reference'
      '      ) like :Description)'
      '      ) and'
      
        '      ((part_store_levels.part is not null) or (store_stock.part' +
        ' is not null)) and'
      
        '      ((Part.Not_in_use = '#39'N'#39') or (Part.Not_in_use = :Not_in_Use' +
        '))'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 488
    Top = 128
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Not_in_Use'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryStockPart: TWideStringField
      FieldName = 'Part'
      Origin = 'Part'
      Required = True
      Size = 25
    end
    object qryStockCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
    end
    object qryStockdescription: TWideStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 150
    end
    object qryStockform_reference_id: TWideStringField
      FieldName = 'form_reference_id'
      Origin = 'form_reference_id'
      ReadOnly = True
      Size = 50
    end
    object qryStockform_reference: TIntegerField
      FieldName = 'form_reference'
      Origin = 'form_reference'
      ReadOnly = True
    end
    object qryStockstore_qty: TIntegerField
      FieldName = 'store_qty'
      Origin = 'store_qty'
      ReadOnly = True
    end
    object qryStockqty_alloc: TIntegerField
      FieldName = 'qty_alloc'
      Origin = 'qty_alloc'
      ReadOnly = True
    end
    object qryStockqty_free: TIntegerField
      FieldName = 'qty_free'
      Origin = 'qty_free'
      ReadOnly = True
    end
    object qryStockpurch_ord_qty: TIntegerField
      FieldName = 'purch_ord_qty'
      Origin = 'purch_ord_qty'
      ReadOnly = True
    end
    object qryStockprod_ord_qty: TFloatField
      FieldName = 'prod_ord_qty'
      Origin = 'prod_ord_qty'
      ReadOnly = True
    end
    object qryStockpaid_for: TIntegerField
      FieldName = 'paid_for'
      Origin = 'paid_for'
      ReadOnly = True
    end
    object qryStocknot_paid_for: TIntegerField
      FieldName = 'not_paid_for'
      Origin = 'not_paid_for'
      ReadOnly = True
    end
    object qryStockNot_in_Use: TWideStringField
      FieldName = 'Not_in_Use'
      Origin = 'Not_in_Use'
      Required = True
      Size = 1
    end
    object qryStockProduct_Class: TWideStringField
      FieldName = 'Product_Class'
      Origin = 'Product_Class'
      Size = 5
    end
  end
  object tmrSearch: TTimer
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 400
    Top = 136
  end
  object qryDummy: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'select part.Part,'
      '        Part.Customer,'
      '       part.part_description as description,'
      '       (select top 1 form_reference.form_reference_id'
      '         from form_reference'
      '         where part.part = form_reference.stock_reference'
      '       ) as form_reference_id,'
      '       (select top 1 form_reference.form_reference'
      '         from form_reference'
      '         where part.part = form_reference.stock_reference'
      '       ) as form_reference,'
      '       '#9'  sum(Store_Quantity) as store_qty,'
      #9'         sum(Quantity_Allocated) as qty_alloc,'
      #9'         sum(Store_Quantity-Quantity_Allocated) as qty_free,'
      '          (select sum(purch_ord_line.quantity_ordered)'
      '                    from purch_ord_line'
      
        '                    where purch_ord_line.part = Part_Store_Level' +
        's.part and'
      
        '                        Purch_ord_line.Fully_received <> '#39'Y'#39' ) a' +
        's purch_ord_qty,'
      '          (select sum(Delivery_detail.Qty_to_Deliver)'
      
        '                  from Purchase_Orderline POLine, Delivery_Detai' +
        'l, Form_Reference'
      
        '                  where Form_Reference.Stock_Reference = Part_St' +
        'ore_Levels.Part and'
      
        '                             POLine.form_reference = Form_refere' +
        'nce.form_reference and'
      
        #9#9#9'                          POLine.purch_ord_line_Status >= 20 ' +
        ' and'
      
        '                             POLine.purch_ord_line_Status < 22 a' +
        'nd'
      
        '                             ((Delivery_detail.purchase_order = ' +
        'POLine.purchase_order) and'
      
        #9#9#9'                           (Delivery_detail.Line = POLine.Lin' +
        'e)) and'
      
        '                              (Delivery_detail.delivery_to_Stock' +
        ' = '#39'Y'#39') and'
      
        '                              (Delivery_Detail.Qty_Delivered = 0' +
        ') and'
      '                              (POLine.inactive <> '#39'Y'#39') and'
      
        '                              (stock_reference is not null)) as ' +
        'prod_ord_qty,'
      '          (select sum(store_stock.store_quantity)'
      '                from store_stock'
      '                where store_stock.part = part.part and'
      
        '                      store_stock.invoice_upfront = '#39'Y'#39') as paid' +
        '_for,'
      '          (select sum(store_stock.store_quantity)'
      '                from store_stock'
      '                where store_stock.part = part.part and'
      '                      ((store_stock.invoice_upfront <> '#39'Y'#39') or'
      
        '                      (store_stock.invoice_upfront is null))) as' +
        ' not_paid_for,'
      '       Not_in_Use,'
      '       Product_Class,'
      
        '       CASE WHEN isnull(Part.Product_Class, '#39'STK'#39') = '#39'STK'#39' THEN ' +
        #39'Stocked'#39
      
        #9#9#9'      WHEN isnull(Part.Product_Class, '#39'STK'#39') = '#39'NSTK'#39' THEN '#39'N' +
        'on Stocked'#39
      
        #9#9#9'      WHEN isnull(Part.Product_Class, '#39'STK'#39') = '#39'SERV'#39' THEN '#39'S' +
        'ervice Item'#39
      
        #9#9#9'      WHEN isnull(Part.Product_Class, '#39'STK'#39') = '#39'POD'#39' THEN '#39'Pr' +
        'int on Demand'#39
      #9'     END AS Product_Class_Description'
      
        'from (part left join part_store_levels on (part.part = part_stor' +
        'e_levels.part)) left join'
      '     store_stock on (part.part = store_stock.part)'
      'GROUP BY'
      '      Part.Part,'
      '      part.customer,'
      '      part.Part_Description,'
      '      part_store_levels.part,'
      '      Part.Sell_Pack_Quantity,'
      '      store_stock.part,'
      '      Part.Not_in_Use,'
      '      Part.Product_Class'
      'HAVING ((Part.Customer = :Customer) or (:Customer = 0)) and'
      '      ('
      '      (Part.Part Like :Description) or'
      '      (Part.Part_description Like :Description) or'
      '      ((select top 1 form_reference.form_reference_id'
      '       from form_reference'
      '       where part.part = form_reference.stock_reference'
      '      ) like :Description)'
      '      ) and'
      
        '      ((part_store_levels.part is not null) or (store_stock.part' +
        ' is not null)) and'
      
        '      ((Part.Not_in_use = '#39'N'#39') or (Part.Not_in_use = :Not_in_Use' +
        '))'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 640
    Top = 128
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Not_in_Use'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryDummyPart: TWideStringField
      FieldName = 'Part'
      Origin = 'Part'
      Required = True
      Size = 25
    end
    object qryDummyCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
    end
    object qryDummydescription: TWideStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 150
    end
    object qryDummyform_reference_id: TWideStringField
      FieldName = 'form_reference_id'
      Origin = 'form_reference_id'
      ReadOnly = True
      Size = 50
    end
    object qryDummyform_reference: TIntegerField
      FieldName = 'form_reference'
      Origin = 'form_reference'
      ReadOnly = True
    end
    object qryDummystore_qty: TIntegerField
      FieldName = 'store_qty'
      Origin = 'store_qty'
      ReadOnly = True
    end
    object qryDummyqty_alloc: TIntegerField
      FieldName = 'qty_alloc'
      Origin = 'qty_alloc'
      ReadOnly = True
    end
    object qryDummyqty_free: TIntegerField
      FieldName = 'qty_free'
      Origin = 'qty_free'
      ReadOnly = True
    end
    object qryDummypurch_ord_qty: TIntegerField
      FieldName = 'purch_ord_qty'
      Origin = 'purch_ord_qty'
      ReadOnly = True
    end
    object qryDummyprod_ord_qty: TFloatField
      FieldName = 'prod_ord_qty'
      Origin = 'prod_ord_qty'
      ReadOnly = True
    end
    object qryDummypaid_for: TIntegerField
      FieldName = 'paid_for'
      Origin = 'paid_for'
      ReadOnly = True
    end
    object qryDummynot_paid_for: TIntegerField
      FieldName = 'not_paid_for'
      Origin = 'not_paid_for'
      ReadOnly = True
    end
    object qryDummyNot_in_Use: TWideStringField
      FieldName = 'Not_in_Use'
      Origin = 'Not_in_Use'
      Required = True
      Size = 1
    end
    object qryDummyProduct_Class: TWideStringField
      FieldName = 'Product_Class'
      Origin = 'Product_Class'
      Size = 5
    end
    object qryDummyProduct_Class_Description: TStringField
      FieldName = 'Product_Class_Description'
      Origin = 'Product_Class_Description'
      ReadOnly = True
      Size = 15
    end
  end
  object qryStore: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from part_store'
      'where part_store = :Part_Store')
    Left = 400
    Top = 200
    ParamData = <
      item
        Name = 'Part_Store'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
