object dtmdlStock: TdtmdlStock
  OldCreateOrder = False
  Left = 41
  Top = 68
  Height = 579
  Width = 781
  object qryCustStock: TQuery
    DatabaseName = 'PB'
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
      
        '                             ((POLine.Inactive = '#39'N'#39') or (POLine' +
        '.Inactive is NULL)) and'
      
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
      '       Not_in_Use'
      
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
      '      Part.Not_in_Use'
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
      'ORDER BY Part.Part'
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Not_in_Use'
        ParamType = ptUnknown
      end>
    object qryCustStockPart: TStringField
      FieldName = 'Part'
      FixedChar = True
      Size = 30
    end
    object qryCustStockCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryCustStockdescription: TStringField
      FieldName = 'description'
      FixedChar = True
      Size = 100
    end
    object qryCustStockstore_qty: TIntegerField
      FieldName = 'store_qty'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object qryCustStockqty_alloc: TIntegerField
      FieldName = 'qty_alloc'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object qryCustStockqty_free: TIntegerField
      FieldName = 'qty_free'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object qryCustStockpurch_ord_qty: TIntegerField
      FieldName = 'purch_ord_qty'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object qryCustStockprod_ord_qty: TFloatField
      FieldName = 'prod_ord_qty'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object qryCustStockpaid_for: TIntegerField
      FieldName = 'paid_for'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object qryCustStocknot_paid_for: TIntegerField
      FieldName = 'not_paid_for'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object qryCustStockform_reference_id: TStringField
      FieldName = 'form_reference_id'
      FixedChar = True
      Size = 100
    end
    object qryCustStockform_reference: TIntegerField
      FieldName = 'form_reference'
    end
    object qryCustStockCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 100
    end
    object qryCustStockMinimum_Stock: TIntegerField
      FieldName = 'Minimum_Stock'
    end
    object qryCustStockMaximum_Stock: TIntegerField
      FieldName = 'Maximum_Stock'
    end
    object qryCustStockReorder_Level: TIntegerField
      FieldName = 'Reorder_Level'
    end
    object qryCustStockForward_Qty: TIntegerField
      FieldName = 'Forward_Qty'
    end
    object qryCustStockNot_In_Use: TStringField
      FieldName = 'Not_In_Use'
      Size = 1
    end
    object qryCustStockSO_unallocated: TIntegerField
      FieldName = 'SO_unallocated'
    end
    object qryCustStockFuture_Stock: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Future_Stock'
      OnGetText = qryCustStockFuture_StockGetText
      Calculated = True
    end
    object qryCustStockProduct_Class_Description: TStringField
      FieldName = 'Product_Class_Description'
      Size = 30
    end
    object qryCustStockProduct_Class: TStringField
      FieldName = 'Product_Class'
      Size = 10
    end
  end
  object dtsStock: TDataSource
    DataSet = qryCustStock
    Left = 184
    Top = 16
  end
  object qryPartMvmnts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select   part_movement.Date_received,'
      '         part_store.Part_Store_Name,'
      '         part_movement.Part_Movement_Bin,'
      '         part_movement.Part_Store_Lot,'
      '         part_movement_type.Part_Move_Type_Descr,'
      '         part_movement.Part_Movement_Reference,'
      '         part_movement.Stock_Pack_Quantity,'
      '         part_movement.Store_Quantity,'
      '         part_movement.Store_cost,'
      '         part_movement.Part_Store_Total_Quantity,'
      '         part_movement.Audit_User,'
      '         part_movement.Audit_Workstation'
      'from     part_movement,'
      '         part_movement_type,'
      '         part_store'
      
        'where    ((part_movement.part_movement_type = part_movement_type' +
        '.part_movement_type) and '
      
        '          (part_movement.part_movement_store = part_store.part_s' +
        'tore) and '
      '          (part = :part))'
      'order by date_received desc, Part_Movement desc'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'part'
        ParamType = ptInput
      end>
    object qryPartMvmntsDate_received: TDateTimeField
      FieldName = 'Date_received'
    end
    object qryPartMvmntsPart_Store_Name: TStringField
      FieldName = 'Part_Store_Name'
      FixedChar = True
      Size = 60
    end
    object qryPartMvmntsPart_Movement_Bin: TStringField
      FieldName = 'Part_Movement_Bin'
      FixedChar = True
    end
    object qryPartMvmntsPart_Store_Lot: TStringField
      FieldName = 'Part_Store_Lot'
      FixedChar = True
      Size = 40
    end
    object qryPartMvmntsPart_Move_Type_Descr: TStringField
      FieldName = 'Part_Move_Type_Descr'
      FixedChar = True
      Size = 40
    end
    object qryPartMvmntsPart_Movement_Reference: TStringField
      FieldName = 'Part_Movement_Reference'
      FixedChar = True
      Size = 60
    end
    object qryPartMvmntsStock_Pack_Quantity: TIntegerField
      FieldName = 'Stock_Pack_Quantity'
    end
    object qryPartMvmntsStore_Quantity: TIntegerField
      FieldName = 'Store_Quantity'
      OnGetText = qryPartMvmntsStore_QuantityGetText
    end
    object qryPartMvmntsStore_cost: TCurrencyField
      FieldName = 'Store_cost'
    end
    object qryPartMvmntsPart_Store_Total_Quantity: TFloatField
      FieldName = 'Part_Store_Total_Quantity'
    end
    object qryPartMvmntsAudit_User: TStringField
      FieldName = 'Audit_User'
    end
    object qryPartMvmntsAudit_Workstation: TStringField
      FieldName = 'Audit_Workstation'
      Size = 30
    end
  end
  object dtsrcPartMvmnts: TDataSource
    DataSet = qryPartMvmnts
    Left = 184
    Top = 72
  end
  object qryPartStoreBins: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select    Store_Stock.Part,'
      #9'         Part.Part_Description,'
      '          Part_Store.Part_Store_Name,'
      '          Store_Stock.Store_Stock,'
      '          Store_Stock.Part_Bin,'
      '          Store_Stock.Part_Store_Lot,'
      '          Store_Stock.Store_Stock_Description,'
      #9'         sum(Store_Quantity) as Qty_in_Stock,'
      #9'         sum(Quantity_Allocated) as Qty_Allocated,'
      #9'         sum(Store_Quantity-Quantity_Allocated) as Free_Stock,'
      '         (select sum(purch_ord_line.quantity_ordered)'
      '                    from purch_ord_line'
      
        '                    where purch_ord_line.part = Store_Stock.Part' +
        ') AS Purchase_Order_Qty,'
      ' '#9'        (select sum(Delivery_detail.Qty_to_Deliver)'
      
        #9#9'             from Purchase_Orderline POLine, Delivery_Detail, ' +
        'Form_Reference'
      
        #9#9'             where Form_Reference.Form_Reference_ID = Store_St' +
        'ock.Part and'
      
        '                 POLine.form_reference = Form_reference.form_ref' +
        'erence and'
      #9#9'               POLine.purch_ord_line_Status = 20 and'
      
        '                 ((Delivery_detail.purchase_order = POLine.purch' +
        'ase_order) and'
      #9#9'               (Delivery_detail.Line = POLine.Line)) and'
      #9#9'               (Delivery_detail.delivery_to_Stock = '#39'Y'#39') and'
      
        #9'                (Delivery_Detail.Qty_Delivered = 0)) AS Product' +
        'ion_Order_Qty,'
      '         store_Stock.invoice_upfront,'
      '         store_stock.date_received,'
      '         store_stock.pallet_id,'
      '         store_stock.product_id,'
      '         store_stock.stock_is_overs,'
      '         store_stock.store_cost'
      'from     Part,'
      '         Store_Stock,'
      '         part_Store'
      'where    ((Store_Stock.part = part.part) and'
      '          (Store_Stock.Part_Store = Part_store.Part_Store) and'
      '          (Store_Stock.part = :Part))'
      'group by Store_Stock.part,'
      '         Part.Part_Description,'
      '         Part_Store.Part_Store_Name,'
      '         Store_Stock.Store_Stock,'
      '         Store_Stock.Part_Bin,'
      '         Store_Stock.Part_Store_Lot,'
      '         Store_Stock.Store_Stock_Description,'
      '         store_Stock.invoice_upfront,'
      '         store_stock.date_received,'
      '         store_stock.pallet_id,'
      '         store_stock.product_id,'
      '         store_stock.stock_is_overs,'
      '         store_stock.store_cost'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object dtsrcPartStoreBins: TDataSource
    DataSet = qryPartStoreBins
    Left = 184
    Top = 128
  end
  object qryStoreStockNumberedItems: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select    Store_Stock.Part as Part,'
      #9'         Part.Part_Description as Description,'
      '          Part_Store.Part_Store_Name as Store_Name,'
      '          Store_Stock.Part_Bin as Bin,'
      '          Store_Stock.Part_Store_Lot as Lot,'
      #9'         sum(Store_Quantity) as Qty_in_Stock,'
      #9'         sum(Quantity_Allocated) as Qty_Allocated,'
      #9'         sum(Store_Quantity-Quantity_Allocated) as Free_Stock,'
      '         (select sum(purch_ord_line.quantity_ordered)'
      '                    from purch_ord_line'
      
        '                    where purch_ord_line.part = Store_Stock.part' +
        ') AS Purchase_Order_Qty,'
      '         (select sum(Delivery_detail.Qty_to_Deliver)'
      
        '                  from Purchase_Orderline POLine, Delivery_Detai' +
        'l, Form_Reference'
      
        '                  where Form_Reference.Form_Reference_ID = Store' +
        '_Stock.Part and'
      
        '                             POLine.form_reference = Form_refere' +
        'nce.form_reference and'
      
        #9#9#9'                          POLine.purch_ord_line_Status = 20 a' +
        'nd'
      
        '                             ((Delivery_detail.purchase_order = ' +
        'POLine.purchase_order) and'
      
        #9#9#9'                           (Delivery_detail.Line = POLine.Lin' +
        'e)) and'
      
        '                              (Delivery_detail.delivery_to_Stock' +
        ' = '#39'Y'#39') and'
      
        '                              (Delivery_Detail.Qty_Delivered = 0' +
        '))'
      '                  AS Production_Order_Qty,'
      '         store_Stock.invoice_upfront,'
      '         store_stock_serial_item.serial_item_from,'
      '         store_stock_serial_item.serial_item_to'
      'from     Part,'
      '         Store_Stock,'
      '         part_Store, '
      '         store_stock_serial_item'
      'where    ((Store_Stock.part = part.part) and'
      '          (Store_Stock.Part_Store = Part_store.Part_Store) and '
      
        '          (store_stock.store_stock = store_stock_serial_item.sto' +
        're_stock) and '
      '          (Store_Stock.part = :part) and'
      '          (Part_Store.part_Store_name = :part_Store_name) and'
      '          (Store_Stock.Part_Bin = :Part_Bin) and'
      '          (Store_Stock.part_store_lot = :part_store_lot) and'
      
        '          (store_stock_serial_item.serial_item_from is not null)' +
        ' and'
      '          (store_stock_serial_item.serial_item_from <> '#39#39') and'
      
        '          (store_stock_serial_item.serial_item_to is not null) a' +
        'nd'
      '          (store_stock_serial_item.serial_item_to <> '#39#39')'
      '          )'
      'group by Store_Stock.part,'
      '         Part.Part_Description,'
      '         Part_Store.Part_Store_Name,'
      '         Store_Stock.Part_Bin,'
      '         Store_Stock.Part_Store_Lot,'
      '         store_stock.invoice_upfront,'
      '         store_stock_serial_item.serial_item_from,'
      '         store_stock_serial_item.serial_item_to'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'part'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'part_Store_name'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Part_Bin'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'part_store_lot'
        ParamType = ptInput
      end>
  end
  object dtsrcStoreStockNumberedItems: TDataSource
    DataSet = qryStoreStockNumberedItems
    Left = 184
    Top = 176
  end
  object qryPartSales: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sales_order_line.part,'
      '       part.part_description,'
      '       sales_order.sales_order,'
      '       customer.name as Customer,'
      '       sales_order.date_ordered,'
      '       sales_order_line.quantity_ordered,'
      '       sales_order_line.quantity_delivered,'
      '       sales_order_line.quantity_invoiced,'
      '       sales_order_line.sell_pack_quantity,'
      '       sales_order_line.Part_Sales_Price,'
      '       sales_order_line.Part_Cost,'
      
        '       sales_order_head_status.description as Sales_Order_Status' +
        ','
      '      (select top 1 job_bag_line_dets.job_bag'
      '        from job_bag_line_dets'
      
        '        where sales_order.sales_order = job_bag_line_dets.sales_' +
        'order) as job_bag,'
      '      (select top 1 job_bag_stock_request.job_bag'
      '        from job_bag_stock_request'
      
        '        where sales_order.sales_order = job_bag_stock_request.sa' +
        'les_order) as job_bag_Req'
      'from   sales_order_line,'
      '       part,'
      '       sales_order,'
      '       customer,'
      '       sales_order_head_status'
      'where  ((sales_order_line.part = part.part) and '
      
        '        (sales_order_line.sales_order = sales_order.sales_order)' +
        ' and '
      '        (sales_order.customer = customer.customer) and'
      
        '        (sales_order.sales_order_head_status = sales_order_head_' +
        'status.sales_order_head_status) and'
      '        (sales_order_line.part = :part))'
      'Order by Sales_Order.Date_Ordered desc'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'part'
        ParamType = ptUnknown
      end>
    object qryPartSalespart: TStringField
      FieldName = 'part'
      FixedChar = True
      Size = 30
    end
    object qryPartSalespart_description: TStringField
      FieldName = 'part_description'
      FixedChar = True
      Size = 100
    end
    object qryPartSalessales_order: TIntegerField
      FieldName = 'sales_order'
    end
    object qryPartSalesCustomer: TStringField
      FieldName = 'Customer'
      FixedChar = True
      Size = 80
    end
    object qryPartSalesdate_ordered: TDateTimeField
      FieldName = 'date_ordered'
    end
    object qryPartSalesquantity_ordered: TIntegerField
      FieldName = 'quantity_ordered'
      OnGetText = qryPartSalesquantity_orderedGetText
    end
    object qryPartSalessell_pack_quantity: TIntegerField
      FieldName = 'sell_pack_quantity'
    end
    object qryPartSalesPart_Sales_Price: TCurrencyField
      FieldName = 'Part_Sales_Price'
    end
    object qryPartSalesPart_Cost: TCurrencyField
      FieldName = 'Part_Cost'
    end
    object qryPartSalesSellValue: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SellValue'
      OnGetText = qryPartSalesSellValueGetText
      Calculated = True
    end
    object qryPartSalesCost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cost'
      OnGetText = qryPartSalesCostGetText
      Calculated = True
    end
    object qryPartSalesQuantity: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Quantity'
      OnGetText = qryPartSalesQuantityGetText
      Calculated = True
    end
    object qryPartSalesJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qryPartSalesJob_Bag_Req: TIntegerField
      FieldName = 'Job_Bag_Req'
    end
    object qryPartSalesJob_Bag_No: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Job_Bag_No'
      OnGetText = qryPartSalesJob_Bag_NoGetText
      Calculated = True
    end
    object qryPartSalesSales_Order_Status: TStringField
      FieldName = 'Sales_Order_Status'
      Size = 100
    end
    object qryPartSalesQuantity_Delivered: TIntegerField
      FieldName = 'Quantity_Delivered'
    end
    object qryPartSalesQuantity_Invoiced: TIntegerField
      FieldName = 'Quantity_Invoiced'
    end
  end
  object dtsrcPartSales: TDataSource
    DataSet = qryPartSales
    Left = 184
    Top = 232
  end
  object qryPartProduction: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select purchase_orderline.Form_Reference,'
      '       form_reference.stock_reference as Part,'
      '       part.part_description as Description,'
      '       purchase_order.purchase_order as Purchase_Order,'
      '       Supplier.name as Supplier,'
      '       purchase_order.Date_point as Order_Date,'
      '       purch_ord_line_status.description as Order_Status,'
      '       purchase_orderline.Quantity as Quantity_Ordered,'
      '       (select sum (delivery_detail.qty_delivered)'
      '           from delivery_detail'
      
        '           where (delivery_detail.purchase_order = purchase_orde' +
        'rline.purchase_order) and'
      
        '                 (delivery_detail.line = purchase_orderline.line' +
        ') and'
      
        '                 (Delivery_detail.delivery_to_Stock = '#39'Y'#39')) as D' +
        'elivered_to_Stock,'
      '        (select sum (delivery_detail.qty_delivered)'
      '           from delivery_detail'
      
        '           where (delivery_detail.purchase_order = purchase_orde' +
        'rline.purchase_order) and'
      
        '                 (delivery_detail.line = purchase_orderline.line' +
        ') and'
      
        '                 (Delivery_detail.delivery_to_Stock <> '#39'Y'#39')) as ' +
        'Delivered,'
      
        '        (select sum (delivery_detail.qty_to_deliver - delivery_d' +
        'etail.qty_delivered)'
      '           from delivery_detail'
      
        '           where (delivery_detail.purchase_order = purchase_orde' +
        'rline.purchase_order) and'
      
        '                 (delivery_detail.line = purchase_orderline.line' +
        ')) as Awaiting_Delivery,'
      '       purchase_orderline.Forms_per_Box as Pack_Size,'
      '       purchase_orderline.Selling_Price,'
      '       purchase_orderline.Order_price,'
      '       (select price_unit.price_unit_factor from price_unit'
      
        '                          where (price_unit.price_unit = purchas' +
        'e_orderline.sell_unit)) as sell_unit_factor,'
      '       (select price_unit.price_unit_factor from price_unit'
      
        '                          where (price_unit.price_unit = purchas' +
        'e_orderline.order_unit)) as ord_unit_factor'
      
        'FROM ((((Purchase_OrderLine INNER JOIN Form_Reference ON Purchas' +
        'e_OrderLine.Form_Reference = Form_Reference.Form_Reference)'
      'INNER JOIN Part ON Form_Reference.Stock_Reference = Part.Part)'
      
        'INNER JOIN Purchase_Order ON Purchase_OrderLine.Purchase_Order =' +
        ' Purchase_Order.Purchase_Order) '
      
        'INNER JOIN Supplier ON Purchase_Order.Supplier = Supplier.Suppli' +
        'er)'
      
        'INNER JOIN Purch_Ord_Line_Status ON Purchase_OrderLine.Purch_Ord' +
        '_Line_Status = Purch_Ord_Line_Status.Purch_Ord_Line_Status'
      'where  (form_reference.stock_reference = :Part) and'
      '       (purchase_orderline.Purch_Ord_Line_Status >= 20) and'
      
        '       (Purchase_Orderline.Original_Order <> round(Purchase_Orde' +
        'rline.Purchase_Order,0))'
      '       Order by Purchase_Order.Purchase_Order desc;'
      ' '
      ' ')
    Left = 24
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
    object qryPartProductionForm_Reference: TIntegerField
      FieldName = 'Form_Reference'
    end
    object qryPartProductionPart: TStringField
      FieldName = 'Part'
      FixedChar = True
      Size = 30
    end
    object qryPartProductionDescription: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 100
    end
    object qryPartProductionPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryPartProductionSupplier: TStringField
      FieldName = 'Supplier'
      FixedChar = True
      Size = 80
    end
    object qryPartProductionOrder_Date: TDateTimeField
      FieldName = 'Order_Date'
    end
    object qryPartProductionOrder_Status: TStringField
      FieldName = 'Order_Status'
      FixedChar = True
      Size = 80
    end
    object qryPartProductionQuantity_Ordered: TFloatField
      FieldName = 'Quantity_Ordered'
    end
    object qryPartProductionDelivered_to_Stock: TFloatField
      FieldName = 'Delivered_to_Stock'
    end
    object qryPartProductionDelivered: TFloatField
      FieldName = 'Delivered'
      OnGetText = qryPartMvmntsStore_QuantityGetText
    end
    object qryPartProductionAwaiting_Delivery: TFloatField
      FieldName = 'Awaiting_Delivery'
    end
    object qryPartProductionPack_Size: TStringField
      FieldName = 'Pack_Size'
      FixedChar = True
      Size = 40
    end
    object qryPartProductionSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
    end
    object qryPartProductionOrder_price: TCurrencyField
      FieldName = 'Order_price'
    end
    object qryPartProductionsell_unit_factor: TFloatField
      FieldName = 'sell_unit_factor'
    end
    object qryPartProductionord_unit_factor: TFloatField
      FieldName = 'ord_unit_factor'
    end
    object qryPartProductionQuantity: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Quantity'
      OnGetText = qryPartProductionQuantityGetText
      Calculated = True
    end
    object qryPartProductiontot_sell_price: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'tot_sell_price'
      OnGetText = qryPartProductiontot_sell_priceGetText
      Calculated = True
    end
    object qryPartProductiontot_ord_price: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tot_ord_price'
      OnGetText = qryPartProductiontot_ord_priceGetText
      Calculated = True
    end
  end
  object qryPartPOs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select purch_ord_line.part,'
      '       part.part_description as Description,'
      '       purch_ord.purch_ord as Purchase_Order,'
      '       Supplier.name as Supplier,'
      '       purch_ord.Purch_Ord_Date as Order_Date,'
      '       purch_ord_status.status_descr as Order_Status,'
      '       purch_ord_line.Quantity_Ordered as Quantity_Ordered,'
      '       purch_ord_line.Purch_Pack_Quantity as Pack_Size,'
      '       purch_ord_line.Purchase_price as Cost'
      
        'from   ((((purch_ord_line inner join part on purch_ord_line.part' +
        ' = part.part)'
      
        '       inner join purch_ord on purch_ord_line.purch_ord = purch_' +
        'ord.purch_ord)'
      
        '       inner join Supplier on purch_ord.supplier = supplier.supp' +
        'lier)'
      
        '       inner join purch_ord_status on purch_ord.Purch_Ord_Status' +
        ' = purch_ord_status.purch_ord_status)'
      'where  (purch_ord_line.part = :Part)'
      'Order by purch_ord.Purch_Ord desc'
      ' ')
    Left = 24
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
    object qryPartPOspart: TStringField
      FieldName = 'part'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object qryPartPOsDescription: TStringField
      FieldName = 'Description'
      Visible = False
      FixedChar = True
      Size = 100
    end
    object qryPartPOsPurchaseOrder: TIntegerField
      FieldName = 'Purchase_Order'
    end
    object qryPartPOsSupplier: TStringField
      FieldName = 'Supplier'
      FixedChar = True
      Size = 80
    end
    object qryPartPOsOrderDate: TDateTimeField
      FieldName = 'Order_Date'
    end
    object qryPartPOsOrderStatus: TStringField
      FieldName = 'Order_Status'
      FixedChar = True
      Size = 24
    end
    object qryPartPOsQuantityOrdered: TIntegerField
      FieldName = 'Quantity_Ordered'
      OnGetText = qryPartPOsQuantityOrderedGetText
    end
    object qryPartPOsPackSize: TIntegerField
      FieldName = 'Pack_Size'
    end
    object qryPartPOsCost: TCurrencyField
      FieldName = 'Cost'
    end
  end
  object dtsrcPartProduction: TDataSource
    DataSet = qryPartProduction
    Left = 184
    Top = 296
  end
  object dtsrcPartPOs: TDataSource
    DataSet = qryPartPOs
    Left = 184
    Top = 344
  end
  object qryStckDetsbyFormRef: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select part.Part,'
      '       part.part_description as description,'
      '       form_reference.form_reference_id,'
      '       '#9'  sum(Store_Quantity) as store_qty,'
      #9'         sum(Quantity_Allocated) as qty_alloc,'
      #9'         sum(Store_Quantity-Quantity_Allocated) as qty_free,'
      '          (select sum(purch_ord_line.quantity_ordered)'
      '                    from purch_ord_line'
      
        '                    where purch_ord_line.part = Part_Store_Level' +
        's.part) as purch_ord_qty,'
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
      '                              (stock_reference is not null) and'
      
        '                              (POLine.InActive <> '#39'Y'#39')) as prod_' +
        'ord_qty,'
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
        ' not_paid_for'
      'from (part'
      
        '      left join part_store_levels on (part.part = part_store_lev' +
        'els.part))'
      '      left join store_stock on (part.part = store_stock.part)'
      
        '      left join form_reference on ((Part.Customer = Form_Referen' +
        'ce.Customer) AND (part.part = form_reference.stock_reference))'
      
        'where ((part_store_levels.part is not null) or (store_stock.part' +
        ' is not null))')
    Left = 304
    Top = 16
  end
  object qryPartNumbers: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select    Store_Stock.Part as Part,'
      #9'         Part.Part_Description as Description,'
      '          Part_Store.Part_Store_Name as Store_Name,'
      '          Store_Stock.Part_Bin as Bin,'
      '          Store_Stock.Part_Store_Lot as Lot,'
      '         store_stock_serial_item.serial_item_from,'
      '         store_stock_serial_item.serial_item_to'
      'from     Part,'
      '         Store_Stock,'
      '         part_Store,'
      '         store_stock_serial_item'
      'where    ((Store_Stock.part = part.part) and'
      '          (Store_Stock.Part_Store = Part_store.Part_Store) and'
      
        '          (store_stock.store_stock = store_stock_serial_item.sto' +
        're_stock) and '
      '          (Store_Stock.part = :part) and'
      
        '          (store_stock_serial_item.serial_item_from is not null)' +
        ' and'
      '          (store_stock_serial_item.serial_item_from <> '#39#39') and'
      
        '          (store_stock_serial_item.serial_item_to is not null) a' +
        'nd'
      '          (store_stock_serial_item.serial_item_to <> '#39#39')'
      '          )'
      'order by Part,'
      '         Store_Stock_serial_item.serial_item_from'
      '')
    Left = 304
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'part'
        ParamType = ptUnknown
      end>
  end
  object dtsrcPartNumbers: TDataSource
    DataSet = qryPartNumbers
    Left = 392
    Top = 80
  end
  object qryStock: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select TOP 10000 part.Part,'
      '        Part.Customer,'
      '        (select Customer.Name'
      '         from Customer'
      
        '         where Customer.Customer = Part.Customer) as Customer_Na' +
        'me,'
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
      
        '          (select ISNULL(SUM(Quantity_Ordered-Quantity_Allocated' +
        '),0) '
      '           from sales_order_line, sales_order'
      '           where Sales_Order_line.Part = Part.Part and'
      
        '                 Sales_Order_line.Sales_Order = Sales_Order.Sale' +
        's_Order and'
      '                 Sales_Order.Sales_order_Head_Status < 50 AND'
      
        '                 ((Sales_Order.inactive = '#39'N'#39') OR (Sales_Order.i' +
        'nactive is NULL))) as SO_Unallocated,'
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
      
        '                             ((POLine.Inactive = '#39'N'#39') or (POLine' +
        '.Inactive is NULL)) and'
      
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
      '       Product_Class,'
      
        '       CASE WHEN isnull(Part.Product_Class, '#39'STK'#39') = '#39'STK'#39' THEN ' +
        #39'Stocked'#39
      
        #9#9#9'      WHEN isnull(Part.Product_Class, '#39'STK'#39') = '#39'NSTK'#39' THEN '#39'N' +
        'on Stocked'#39
      
        #9#9#9'      WHEN isnull(Part.Product_Class, '#39'STK'#39') = '#39'SERV'#39' THEN '#39'S' +
        'ervice Item'#39
      
        #9#9#9'      WHEN isnull(Part.Product_Class, '#39'STK'#39') = '#39'POD'#39' THEN '#39'Pr' +
        'int on Demand'#39
      #9'     END AS Product_Class_Description,'
      '       Minimum_Stock,'
      '       Maximum_Stock,'
      '       ISNULL(Reorder_Level,0) as Reorder_Level,'
      '       ISNULL((select sum(SS.Quantity_Allocated)'
      '        from Store_Stock SS, Production_Location'
      
        '        where Production_Location.Receive_Forward_Stock = '#39'Y'#39' an' +
        'd'
      '              SS.Part = Part.Part and'
      
        '              ((Production_Location.Part_Store = SS.Part_Store) ' +
        'and'
      
        '              (Production_Location.Part_Bin = SS.Part_Bin))),0) ' +
        'as Forward_qty'
      
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
      '      Part.Product_Class,'
      '      Minimum_Stock,'
      '      Maximum_Stock,'
      '      Reorder_Level'
      'HAVING ((Part.Customer = :Customer) or (:Customer = 0)) and'
      '      ('
      '      (Part.Part Like :Description) or'
      '      (Part.Part_description Like :Description) or'
      '      ((select top 1 form_reference.form_reference_id'
      '       from form_reference'
      '       where part.part = form_reference.stock_reference'
      '      ) like :Description)'
      '      ) and'
      
        '/*      ((part_store_levels.part is not null) or (store_stock.pa' +
        'rt is not null)) and'
      
        '*/      ((Part.Not_in_use = '#39'N'#39') or (Part.Not_in_use = :Not_in_U' +
        'se))'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Not_in_Use'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'Part'
      FixedChar = True
      Size = 30
    end
    object IntegerField1: TIntegerField
      FieldName = 'Customer'
    end
    object StringField2: TStringField
      FieldName = 'description'
      FixedChar = True
      Size = 100
    end
    object IntegerField2: TIntegerField
      FieldName = 'store_qty'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object IntegerField3: TIntegerField
      FieldName = 'qty_alloc'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object IntegerField4: TIntegerField
      FieldName = 'qty_free'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object IntegerField5: TIntegerField
      FieldName = 'purch_ord_qty'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object FloatField1: TFloatField
      FieldName = 'prod_ord_qty'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object IntegerField6: TIntegerField
      FieldName = 'paid_for'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object IntegerField7: TIntegerField
      FieldName = 'not_paid_for'
      OnGetText = qryCustStockstore_qtyGetText
    end
    object StringField3: TStringField
      FieldName = 'form_reference_id'
      FixedChar = True
      Size = 100
    end
    object IntegerField8: TIntegerField
      FieldName = 'form_reference'
    end
    object qryStockCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 92
    end
    object qryStockNot_in_Use: TStringField
      FieldName = 'Not_in_Use'
      FixedChar = True
      Size = 2
    end
    object qryStockProduct_Class: TStringField
      FieldName = 'Product_Class'
      FixedChar = True
      Size = 10
    end
    object qryStockMinimum_Stock: TIntegerField
      FieldName = 'Minimum_Stock'
    end
    object qryStockMaximum_Stock: TIntegerField
      FieldName = 'Maximum_Stock'
    end
    object qryStockReorder_Level: TIntegerField
      FieldName = 'Reorder_Level'
    end
    object qryStockForward_qty: TIntegerField
      FieldName = 'Forward_qty'
    end
    object qryStockSO_Unallocated: TIntegerField
      FieldName = 'SO_Unallocated'
    end
    object qryStockProduct_Class_Description: TStringField
      FieldName = 'Product_Class_Description'
      Size = 30
    end
  end
  object qryPartDeliveries: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '
      '  Delivery_Detail.Purchase_Order,'
      '  Delivery_Detail.Line,'
      '  Delivery_Detail.Delivery_no,'
      '  Delivery_Detail.Ad_hoc_Address,'
      '  Delivery_Detail.Supplier,'
      '  Delivery_Detail.Branch_no,'
      '  Delivery_Detail.Rep,'
      '  Delivery_Detail.Qty_to_Deliver,'
      '  Delivery_Detail.Qty_Delivered,'
      '  Delivery_Detail.Qty_Invoiced,'
      '  Delivery_Detail.Date_Point,'
      '  Delivery_Detail.Goods_reqd_by_Customer,'
      '  Delivery_Detail.Branch_No0,'
      '  Delivery_Detail.Customer,'
      '  Delivery_Detail.No_Of_Boxes,'
      '  Delivery_Detail.Delivery_Instructions,'
      '  Delivery_Detail.Deliver_via_Company,'
      '  Delivery_Detail.Date_Deliv_Actual,'
      '  Delivery_Detail.Delivery_to_Stock,'
      '  Delivery_Detail.Delivery_note_printed,'
      '  Delivery_Detail.contact_name,'
      '  Purchase_OrderLine.Suppliers_Desc,'
      '  Purchase_OrderLine.Customer AS Order_Customer,'
      '  Purchase_OrderLine.Branch_no AS Customer_Branch,'
      '  Purchase_OrderLine.Forms_Per_Box,'
      '  Purchase_OrderLine.No_of_Sets,'
      '  Purchase_OrderLine.Cust_order_no,'
      '  Purchase_OrderLine.Purch_Ord_Line_Status,'
      '  Purchase_orderLine.Quantity as Orig_Ord_Qty,'
      '  Purchase_Order.Supplier,'
      '  Purchase_Order.Branch_No AS Supplier_Branch,'
      '  Supplier.Name AS Supplier_Name,'
      '  Customer.Name AS Customer_Name,'
      '  Purch_Ord_Line_Status.Description AS Order_Status,'
      '  Purchase_OrderLine.Form_Reference,'
      '  Purchase_OrderLine.Original_Order,'
      '  Purchase_OrderLine.Original_OrderLine,'
      '  Purchase_OrderLine.Number_Instructions,'
      '  Purchase_OrderLine.Order_Price,'
      '  Purchase_OrderLine.Order_Unit,'
      '  Price_Unit.Description as Price_unit_description,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Purchase_orderLine.Invoice_upfront,'
      '  Rep.Name as Rep_Name,'
      '  Operator.Name as Account_Manager,'
      '  Form_Reference.Form_Reference_ID,'
      '  Form_Reference.Stock_Reference'
      'FROM Operator '
      #9'RIGHT JOIN (Customer '
      #9'INNER JOIN (Customer_Branch '
      #9'INNER JOIN (Purch_Ord_Line_Status '
      #9'INNER JOIN (Price_Unit '
      #9'INNER JOIN (Rep '
      #9'INNER JOIN (Form_Reference '
      #9'RIGHT JOIN (Supplier '
      #9'INNER JOIN (Supplier_Branch '
      #9'INNER JOIN (Purchase_Order '
      #9'INNER JOIN (Purchase_OrderLine '
      #9'INNER JOIN Delivery_Detail '
      
        #9#9'ON (Purchase_OrderLine.Line = Delivery_Detail.Line) AND (Purch' +
        'ase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_Order)) '
      
        #9#9'ON Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order) '
      
        #9#9'ON (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND ' +
        '(Supplier_Branch.Supplier = Purchase_Order.Supplier)) '
      #9#9'ON Supplier.Supplier = Supplier_Branch.Supplier) '
      
        #9#9'ON Form_Reference.Form_Reference = Purchase_OrderLine.Form_Ref' +
        'erence) '
      #9#9'ON Rep.Rep = Purchase_OrderLine.Rep) '
      #9#9'ON Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) '
      
        #9#9'ON Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Orde' +
        'rLine.Purch_Ord_Line_Status) '
      
        #9#9'ON (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) ' +
        'AND (Customer_Branch.Customer = Purchase_OrderLine.Customer)) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9#9'ON Operator.Operator = Purchase_Order.Office_Contact'
      'WHERE (Delivery_Detail.Delivery_To_Stock = '#39'Y'#39') AND'
      '      (Delivery_Detail.Date_Deliv_Actual is NULL) AND'
      '      Form_Reference.Stock_Reference = :Stock_Reference'
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 296
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Reference'
        ParamType = ptUnknown
      end>
  end
  object dtsPartDeliveries: TDataSource
    DataSet = qryShowPartDeliveries
    Left = 408
    Top = 296
  end
  object qryShowPartDeliveries: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '
      '  Delivery_Detail.Purchase_Order,'
      '  Delivery_Detail.Line,'
      '  Delivery_Detail.Delivery_no,'
      '  Delivery_Detail.Ad_hoc_Address,'
      '  Delivery_Detail.Supplier,'
      '  Delivery_Detail.Branch_no,'
      '  Delivery_Detail.Rep,'
      '  Delivery_Detail.Qty_to_Deliver,'
      '  Delivery_Detail.Qty_Delivered,'
      '  Delivery_Detail.Qty_Invoiced,'
      '  Delivery_Detail.Date_Point,'
      '  Delivery_Detail.Goods_reqd_by_Customer,'
      '  Delivery_Detail.Branch_No0,'
      '  Delivery_Detail.Customer,'
      '  Delivery_Detail.No_Of_Boxes,'
      '  Delivery_Detail.Delivery_Instructions,'
      '  Delivery_Detail.Deliver_via_Company,'
      '  Delivery_Detail.Date_Deliv_Actual,'
      '  Delivery_Detail.Delivery_to_Stock,'
      '  Delivery_Detail.Delivery_note_printed,'
      '  Delivery_Detail.contact_name,'
      '  Purchase_OrderLine.Suppliers_Desc,'
      '  Purchase_OrderLine.Customer AS Order_Customer,'
      '  Purchase_OrderLine.Branch_no AS Customer_Branch,'
      '  Purchase_OrderLine.Forms_Per_Box,'
      '  Purchase_OrderLine.No_of_Sets,'
      '  Purchase_OrderLine.Cust_order_no,'
      '  Purchase_OrderLine.Purch_Ord_Line_Status,'
      '  Purchase_orderLine.Quantity as Orig_Ord_Qty,'
      '  Purchase_Order.Supplier,'
      '  Purchase_Order.Branch_No AS Supplier_Branch,'
      '  Supplier.Name AS Supplier_Name,'
      '  Customer.Name AS Customer_Name,'
      '  Purch_Ord_Line_Status.Description AS Order_Status,'
      '  Purchase_OrderLine.Form_Reference,'
      '  Purchase_OrderLine.Original_Order,'
      '  Purchase_OrderLine.Original_OrderLine,'
      '  Purchase_OrderLine.Number_Instructions,'
      '  Purchase_OrderLine.Order_Price,'
      '  Purchase_OrderLine.Order_Unit,'
      '  Purchase_OrderLine.Selling_Price,'
      '  Purchase_OrderLine.Sell_Unit,'
      '  Purchase_OrderLine.Product_Type,'
      '  Customer.Vat_Code_Def as Vat_Code,'
      '  Price_Unit.Description as Price_unit_description,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Sell_Unit.Description as Sell_unit_description,'
      '  Sell_Unit.Price_Unit_Factor as Sell_Unit_Factor,'
      '  Purchase_orderLine.Invoice_upfront,'
      '  Rep.Name as Rep_Name,'
      '  Operator.Name as Account_Manager,'
      '  Form_Reference.Form_Reference_ID,'
      '  Form_Reference.Stock_Reference'
      'FROM Operator '
      #9'RIGHT JOIN (Customer '
      #9'INNER JOIN (Customer_Branch '
      #9'INNER JOIN (Purch_Ord_Line_Status '
      #9'INNER JOIN (Price_Unit'
      #9'INNER JOIN (Price_Unit Sell_unit'
      #9'INNER JOIN (Rep'
      #9'INNER JOIN (Form_Reference '
      #9'RIGHT JOIN (Supplier '
      #9'INNER JOIN (Supplier_Branch '
      #9'INNER JOIN (Purchase_Order '
      #9'INNER JOIN (Purchase_OrderLine '
      #9'INNER JOIN Delivery_Detail '
      
        #9#9'ON (Purchase_OrderLine.Line = Delivery_Detail.Line) AND (Purch' +
        'ase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_Order)) '
      
        #9#9'ON Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order) '
      
        #9#9'ON (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND ' +
        '(Supplier_Branch.Supplier = Purchase_Order.Supplier)) '
      #9#9'ON Supplier.Supplier = Supplier_Branch.Supplier) '
      
        #9#9'ON Form_Reference.Form_Reference = Purchase_OrderLine.Form_Ref' +
        'erence) '
      #9#9'ON Rep.Rep = Purchase_OrderLine.Rep)'
      #9#9'ON Sell_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit)'
      #9#9'ON Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      
        #9#9'ON Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Orde' +
        'rLine.Purch_Ord_Line_Status)'
      
        #9#9'ON (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) ' +
        'AND (Customer_Branch.Customer = Purchase_OrderLine.Customer)) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9#9'ON Operator.Operator = Purchase_Order.Office_Contact'
      'WHERE (Delivery_Detail.Delivery_To_Stock = '#39'Y'#39') AND'
      '      (Delivery_Detail.Date_Deliv_Actual is NULL) AND'
      '      Form_Reference.Stock_Reference = :Stock_Reference'
      'ORDER BY Purchase_Orderline.Purchase_Order Desc'
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 296
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Reference'
        ParamType = ptUnknown
      end>
  end
  object qryStockLocations: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Store_Stock.Quantity_Allocated, '
      #9'Store_Stock.Store_Quantity, '
      #9'Store_Stock.Store_Cost, '
      #9'Store_Stock.Date_Received, '
      #9'Store_Stock.Part, '
      #9'Store_Stock.Part_Store_Lot, '
      #9'Store_Stock.Part_Store, '
      #9'Store_Stock.Part_Bin, '
      #9'Store_Stock.Stock_Pack_Quantity, '
      #9'Store_Stock.Store_Stock_Description, '
      #9'Store_Stock.Invoice_Upfront, '
      #9'Store_Stock.Sets_per_pad, '
      #9'Part.Part_Description, '
      #9'Part.Customer, '
      #9'Form_Reference.Form_Reference, '
      #9'Form_Reference.Form_Reference_ID'
      'FROM (Part '
      #9'  INNER JOIN Store_Stock ON Part.Part = Store_Stock.Part)'
      
        '    LEFT JOIN Form_Reference ON Part.Part = Form_Reference.Stock' +
        '_Reference'
      'WHERE'
      '    Part_Store = :Part_Store AND'
      '    Part_Bin Like :Part_Bin + '#39'%'#39
      'ORDER BY Store_Stock.Part_Bin, Store_Stock.Part')
    Left = 24
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end>
  end
  object dtsStockLocations: TDataSource
    DataSet = qryStockLocations
    Left = 176
    Top = 400
  end
  object qryPartStore: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from Part_Store'
      'order by Part_Store_Name')
    Left = 304
    Top = 136
  end
  object dtsPartStore: TDataSource
    DataSet = qryPartStore
    Left = 392
    Top = 136
  end
  object qryMoves: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Part_Movement'
      'where Part = :Part')
    Left = 296
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryShowCustDeliveries: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '
      '  Delivery_Detail.Purchase_Order,'
      '  Delivery_Detail.Line,'
      '  Delivery_Detail.Delivery_no,'
      '  Delivery_Detail.Ad_hoc_Address,'
      '  Delivery_Detail.Supplier,'
      '  Delivery_Detail.Branch_no,'
      '  Delivery_Detail.Rep,'
      '  Delivery_Detail.Qty_to_Deliver,'
      '  Delivery_Detail.Qty_Delivered,'
      '  Delivery_Detail.Qty_Invoiced,'
      '  Delivery_Detail.Date_Point,'
      '  Delivery_Detail.Goods_reqd_by_Customer,'
      '  Delivery_Detail.Branch_No0,'
      '  Delivery_Detail.Customer,'
      '  Delivery_Detail.No_Of_Boxes,'
      '  Delivery_Detail.Delivery_Instructions,'
      '  Delivery_Detail.Deliver_via_Company,'
      '  Delivery_Detail.Date_Deliv_Actual,'
      '  Delivery_Detail.Delivery_to_Stock,'
      '  Delivery_Detail.Delivery_note_printed,'
      '  Delivery_Detail.contact_name,'
      '  Purchase_OrderLine.Suppliers_Desc,'
      '  Purchase_OrderLine.Customer AS Order_Customer,'
      '  Purchase_OrderLine.Branch_no AS Customer_Branch,'
      '  Purchase_OrderLine.Forms_Per_Box,'
      '  Purchase_OrderLine.No_of_Sets,'
      '  Purchase_OrderLine.Cust_order_no,'
      '  Purchase_OrderLine.Purch_Ord_Line_Status,'
      '  Purchase_orderLine.Quantity as Orig_Ord_Qty,'
      '  Purchase_Order.Supplier,'
      '  Purchase_Order.Branch_No AS Supplier_Branch,'
      '  Supplier.Name AS Supplier_Name,'
      '  Customer.Name AS Customer_Name,'
      '  Purch_Ord_Line_Status.Description AS Order_Status,'
      '  Purchase_OrderLine.Form_Reference,'
      '  Purchase_OrderLine.Original_Order,'
      '  Purchase_OrderLine.Original_OrderLine,'
      '  Purchase_OrderLine.Number_Instructions,'
      '  Purchase_OrderLine.Order_Price,'
      '  Purchase_OrderLine.Order_Unit,'
      '  Purchase_OrderLine.Selling_Price,'
      '  Purchase_OrderLine.Sell_Unit,'
      '  Purchase_OrderLine.Product_Type,'
      '  Customer.Vat_Code_Def as Vat_Code,'
      '  Price_Unit.Description as Price_unit_description,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Sell_Unit.Description as Sell_unit_description,'
      '  Sell_Unit.Price_Unit_Factor as Sell_Unit_Factor,'
      '  Purchase_orderLine.Invoice_upfront,'
      '  Rep.Name as Rep_Name,'
      '  Operator.Name as Account_Manager,'
      '  Form_Reference.Form_Reference_ID,'
      '  Form_Reference.Form_Reference_Descr,'
      '  Form_Reference.Stock_Reference'
      'FROM Operator '
      #9'RIGHT JOIN (Customer '
      #9'INNER JOIN (Customer_Branch '
      #9'INNER JOIN (Purch_Ord_Line_Status '
      #9'INNER JOIN (Price_Unit'
      #9'INNER JOIN (Price_Unit Sell_unit'
      #9'INNER JOIN (Rep'
      #9'INNER JOIN (Form_Reference '
      #9'RIGHT JOIN (Supplier '
      #9'INNER JOIN (Supplier_Branch '
      #9'INNER JOIN (Purchase_Order '
      #9'INNER JOIN (Purchase_OrderLine '
      #9'INNER JOIN Delivery_Detail '
      
        #9#9'ON (Purchase_OrderLine.Line = Delivery_Detail.Line) AND (Purch' +
        'ase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_Order)) '
      
        #9#9'ON Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order) '
      
        #9#9'ON (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND ' +
        '(Supplier_Branch.Supplier = Purchase_Order.Supplier)) '
      #9#9'ON Supplier.Supplier = Supplier_Branch.Supplier) '
      
        #9#9'ON Form_Reference.Form_Reference = Purchase_OrderLine.Form_Ref' +
        'erence) '
      #9#9'ON Rep.Rep = Purchase_OrderLine.Rep)'
      #9#9'ON Sell_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit)'
      #9#9'ON Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      
        #9#9'ON Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Orde' +
        'rLine.Purch_Ord_Line_Status)'
      
        #9#9'ON (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) ' +
        'AND (Customer_Branch.Customer = Purchase_OrderLine.Customer)) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9#9'ON Operator.Operator = Purchase_Order.Office_Contact'
      'WHERE (Delivery_Detail.Delivery_To_Stock = '#39'Y'#39') AND'
      '      (Delivery_Detail.Date_Deliv_Actual is NULL) AND'
      '      Purchase_OrderLine.Customer = :Customer and'
      '      ('
      '      (Form_Reference.Stock_Reference like :Description) or'
      '      (Purchase_Orderline.Suppliers_Desc like :Description)'
      '      )'
      'ORDER BY Purchase_Orderline.Purchase_Order Desc'
      ''
      ' '
      ' '
      ' ')
    Left = 296
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object dtsCustDeliveries: TDataSource
    DataSet = qryShowCustDeliveries
    Left = 408
    Top = 408
  end
  object qryCustDeliveries: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '
      '  Delivery_Detail.Purchase_Order,'
      '  Delivery_Detail.Line,'
      '  Delivery_Detail.Delivery_no,'
      '  Delivery_Detail.Ad_hoc_Address,'
      '  Delivery_Detail.Supplier,'
      '  Delivery_Detail.Branch_no,'
      '  Delivery_Detail.Rep,'
      '  Delivery_Detail.Qty_to_Deliver,'
      '  Delivery_Detail.Qty_Delivered,'
      '  Delivery_Detail.Qty_Invoiced,'
      '  Delivery_Detail.Date_Point,'
      '  Delivery_Detail.Goods_reqd_by_Customer,'
      '  Delivery_Detail.Branch_No0,'
      '  Delivery_Detail.Customer,'
      '  Delivery_Detail.No_Of_Boxes,'
      '  Delivery_Detail.Delivery_Instructions,'
      '  Delivery_Detail.Deliver_via_Company,'
      '  Delivery_Detail.Date_Deliv_Actual,'
      '  Delivery_Detail.Delivery_to_Stock,'
      '  Delivery_Detail.Delivery_note_printed,'
      '  Delivery_Detail.contact_name,'
      '  Purchase_OrderLine.Suppliers_Desc,'
      '  Purchase_OrderLine.Customer AS Order_Customer,'
      '  Purchase_OrderLine.Branch_no AS Customer_Branch,'
      '  Purchase_OrderLine.Forms_Per_Box,'
      '  Purchase_OrderLine.No_of_Sets,'
      '  Purchase_OrderLine.Cust_order_no,'
      '  Purchase_OrderLine.Purch_Ord_Line_Status,'
      '  Purchase_orderLine.Quantity as Orig_Ord_Qty,'
      '  Purchase_Order.Supplier,'
      '  Purchase_Order.Branch_No AS Supplier_Branch,'
      '  Supplier.Name AS Supplier_Name,'
      '  Customer.Name AS Customer_Name,'
      '  Purch_Ord_Line_Status.Description AS Order_Status,'
      '  Purchase_OrderLine.Form_Reference,'
      '  Purchase_OrderLine.Original_Order,'
      '  Purchase_OrderLine.Original_OrderLine,'
      '  Purchase_OrderLine.Number_Instructions,'
      '  Purchase_OrderLine.Order_Price,'
      '  Purchase_OrderLine.Order_Unit,'
      '  Purchase_OrderLine.Selling_Price,'
      '  Purchase_OrderLine.Sell_Unit,'
      '  Purchase_OrderLine.Product_Type,'
      '  Customer.Vat_Code_Def as Vat_Code,'
      '  Price_Unit.Description as Price_unit_description,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Sell_Unit.Description as Sell_unit_description,'
      '  Sell_Unit.Price_Unit_Factor as Sell_Unit_Factor,'
      '  Purchase_orderLine.Invoice_upfront,'
      '  Rep.Name as Rep_Name,'
      '  Operator.Name as Account_Manager,'
      '  Form_Reference.Form_Reference_ID,'
      '  Form_Reference.Form_Reference_Descr,'
      '  Form_Reference.Stock_Reference'
      'FROM Operator '
      #9'RIGHT JOIN (Customer '
      #9'INNER JOIN (Customer_Branch '
      #9'INNER JOIN (Purch_Ord_Line_Status '
      #9'INNER JOIN (Price_Unit'
      #9'INNER JOIN (Price_Unit Sell_unit'
      #9'INNER JOIN (Rep'
      #9'INNER JOIN (Form_Reference '
      #9'RIGHT JOIN (Supplier '
      #9'INNER JOIN (Supplier_Branch '
      #9'INNER JOIN (Purchase_Order '
      #9'INNER JOIN (Purchase_OrderLine '
      #9'INNER JOIN Delivery_Detail '
      
        #9#9'ON (Purchase_OrderLine.Line = Delivery_Detail.Line) AND (Purch' +
        'ase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_Order)) '
      
        #9#9'ON Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order) '
      
        #9#9'ON (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) AND ' +
        '(Supplier_Branch.Supplier = Purchase_Order.Supplier)) '
      #9#9'ON Supplier.Supplier = Supplier_Branch.Supplier) '
      
        #9#9'ON Form_Reference.Form_Reference = Purchase_OrderLine.Form_Ref' +
        'erence) '
      #9#9'ON Rep.Rep = Purchase_OrderLine.Rep)'
      #9#9'ON Sell_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit)'
      #9#9'ON Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      
        #9#9'ON Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Orde' +
        'rLine.Purch_Ord_Line_Status)'
      
        #9#9'ON (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) ' +
        'AND (Customer_Branch.Customer = Purchase_OrderLine.Customer)) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9#9'ON Operator.Operator = Purchase_Order.Office_Contact'
      'WHERE (Delivery_Detail.Delivery_To_Stock = '#39'Y'#39') AND'
      '      (Delivery_Detail.Date_Deliv_Actual is NULL) AND'
      '      Purchase_OrderLine.Customer = :Customer'
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 408
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryGetUsedForJob: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 Part_Movement.Part_Movement'
      'from Part_Movement'
      'where Part = :Part and Part_Movement_Type = '#39'J'#39
      'Order By Part_Movement desc')
    Left = 304
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryStockUsage: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'SELECT  Sum(Store_Stock.Quantity_Allocated) AS Quantity_Allocate' +
        'd,'
      '        Sum(Store_Stock.Store_Quantity) as Quantity_in_Stock,'
      '        Store_Stock.Part,'
      '        Store_Stock.Part_Bin,'
      '        Store_Stock.Part_Store,'
      '        Part.Part_Description,'
      '        Part.Customer,'
      '        Customer.Name as Customer_Name,'
      '        (select sum(Sales_Order_Line.Quantity_Allocated)'
      '         from Sales_Order_line, Sales_order, Production_Location'
      '         where Sales_Order_Line.Part = Store_Stock.Part and'
      
        '               Sales_Order_Line.Sales_Order = Sales_Order.Sales_' +
        'Order and'
      
        '               Sales_Order.Production_Location = Production_Loca' +
        'tion.Production_Location and'
      '               Sales_Order.Sales_Order_Head_Status < 120 and'
      
        '               Production_Location.Receive_Forward_Stock = '#39'Y'#39') ' +
        'as Quantity_On_Order'
      'FROM (Part'
      '      INNER JOIN Store_Stock'
      '        ON Part.Part = Store_Stock.Part)'
      '      LEFT JOIN Customer'
      '        ON Part.Customer = Customer.Customer'
      'WHERE'
      '    Part_Store = :Part_Store AND'
      '    Part_Bin = :Part_Bin AND'
      '    Store_Stock.Part Like '#39'%'#39' + :Part + '#39'%'#39' and'
      '    Store_Stock.Quantity_Allocated <> 0'
      'GROUP BY'
      '        Store_Stock.Part,'
      '        Store_Stock.Part_Bin,'
      '        Store_Stock.Part_Store,'
      '        Part.Part_Description,'
      '        Part.Customer,'
      '        Customer.Name'
      'ORDER BY Part_Bin, Store_Stock.Part'
      '')
    Left = 24
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object dtsStockUsage: TDataSource
    DataSet = qryStockUsage
    Left = 176
    Top = 456
  end
  object qryProductionLocation: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Production_location'
      'where receive_forward_stock = '#39'Y'#39
      'Order by Production_Location_Name')
    Left = 296
    Top = 472
  end
  object dtsProductionLocation: TDataSource
    DataSet = qryProductionLocation
    Left = 408
    Top = 472
  end
  object qryGetProductionLocation: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Production_Location'
      'where Production_Location = :Production_Location')
    Left = 536
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Production_Location'
        ParamType = ptUnknown
      end>
  end
  object qryGetStoreStock: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Store_Stock'
      'where Part_Store = :Part_Store and'
      'Part = :Part and '
      'Part_Bin = :Part_Bin and store_quantity > 0'
      'order by Store_Stock')
    Left = 536
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Bin'
        ParamType = ptUnknown
      end>
  end
  object qryGetPartAllocation: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Part_Store_Allocation'
      'where Store_Stock = :Store_Stock')
    Left = 648
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Store_Stock'
        ParamType = ptUnknown
      end>
  end
  object qryGetJobNumber: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select DISTINCT Job_Bag'
      'from Job_Bag_Stock_Request'
      'Where Sales_Order = :Sales_Order')
    Left = 648
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryPallets: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 2000'
      #9'Store_Stock.Store_Stock, '
      #9'Store_Stock.Store_Quantity, '
      #9'Store_Stock.Date_Received, '
      #9'Store_Stock.Part, '
      #9'Store_Stock.Part_Store, '
      #9'Store_Stock.Part_Bin, '
      #9'Store_Stock.Stock_Pack_Quantity, '
      #9'Store_Stock.Store_Stock_Description, '
      #9'Part.Part_Description, '
      #9'Part_Store.Part_Store_Name, '
      #9'Customer.Name,'
      '  Pallet_ID,'
      '  Store_Stock.Product_ID'
      'FROM (Part_Store'
      #9'INNER JOIN (Part '
      #9'INNER JOIN Store_Stock ON Part.Part = Store_Stock.Part) '
      #9#9#9#9'ON Part_Store.Part_Store = Store_Stock.Part_Store) '
      #9'LEFT JOIN Customer ON Part.Customer = Customer.Customer'
      'WHERE (Part.Part Like :Description) or'
      '      (Part.Part_description Like :Description)'
      '')
    Left = 552
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qryDummyPallets: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT TOP 2000'
      #9'Store_Stock.Store_Stock, '
      #9'Store_Stock.Store_Quantity, '
      #9'Store_Stock.Date_Received, '
      #9'Store_Stock.Part, '
      #9'Store_Stock.Part_Store, '
      #9'Store_Stock.Part_Bin, '
      #9'Store_Stock.Stock_Pack_Quantity, '
      #9'Store_Stock.Store_Stock_Description, '
      #9'Part.Part_Description, '
      #9'Part_Store.Part_Store_Name, '
      #9'Customer.Name,'
      '  Pallet_ID,'
      '  Store_Stock.Product_ID'
      'FROM (Part_Store '
      #9'INNER JOIN (Part '
      #9'INNER JOIN Store_Stock ON Part.Part = Store_Stock.Part) '
      #9#9#9#9'ON Part_Store.Part_Store = Store_Stock.Part_Store) '
      #9'LEFT JOIN Customer ON Part.Customer = Customer.Customer'
      'WHERE ((Part.Part Like :Description) or'
      '      (Part.Part_description Like :Description))')
    Left = 640
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object dtsPallets: TDataSource
    DataSet = qryPallets
    Left = 496
    Top = 88
  end
  object qryGetPart: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Part'
      'Where Part = :Part'
      ' ')
    Left = 552
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object qryGetCustName: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Customer.Name as Cust_Name,'
      '       Customer_Branch.Name as Branch_Name'
      'From  Customer, Customer_Branch'
      'Where (Customer.Customer = :Customer) and'
      '      (Customer_Branch.Customer = :Customer) and'
      '      (Customer_Branch.Branch_No = :Branch)')
    Left = 552
    Top = 213
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch'
        ParamType = ptUnknown
      end>
  end
  object qryUpdMulti: TQuery
    DatabaseName = 'PB'
    Left = 640
    Top = 152
  end
  object qryUpdMultiPartInactive: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'UPDATE Part'
      'SET Not_in_Use = :Not_In_Use'
      'WHERE Part.Part = :Part and'
      
        '(SELECT ISNULL(SUM(Store_Quantity),0) FROM Store_Stock WHERE Sto' +
        're_Stock.Part = Part.Part) = 0')
    Left = 648
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Not_In_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
end
