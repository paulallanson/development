object frmWTUtilities: TfrmWTUtilities
  Left = 223
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Database Utilities'
  ClientHeight = 159
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object btnOK: TBitBtn
    Left = 40
    Top = 115
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 115
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
  end
  object rdgUtilities: TRadioGroup
    Left = 8
    Top = 8
    Width = 233
    Height = 97
    Caption = 'Action'
    ItemIndex = 0
    Items.Strings = (
      'Check price record integrity'
      'Check order integrity'
      'Delete historical data'
      'Delete Unattached Contract Quotes')
    ParentBackground = False
    TabOrder = 2
  end
  object qryCheckPrices: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'delete from price_pointer'
      
        'where price_pointer not in (select distinct price_pointer from p' +
        'rices)')
    Left = 200
    Top = 16
  end
  object qryCheckOrder: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'set sales_order_status = 100'
      'WHERE '
      '(Select count(sales_order_line.sales_order) '
      'FROM  sales_order_line, sales_invoice_line'
      'WHERE'
      'sales_order_line.sales_order = sales_order.sales_order and'
      '('
      
        '(sales_order_line.sales_order = sales_invoice_line.sales_order) ' +
        'and'
      
        '(sales_order_line.sales_order_line_no = sales_invoice_line.sales' +
        '_order_line_no)'
      ')) > 0')
    Left = 160
    Top = 16
  end
  object qryCheckOrders: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Order'
      'set sales_order_Status = 100'
      'where (sales_order.sales_order in'
      
        '(select Sales_invoice_line.Sales_Order from sales_invoice_line w' +
        'here Sales_invoice_Line.sales_order = Sales_Order.Sales_order)) ' +
        'and'
      'Sales_Order_Status <= 90')
    Left = 160
    Top = 64
  end
end
