object PBPOrdHistFrm: TPBPOrdHistFrm
  Left = 40
  Top = 184
  Caption = 'Order History'
  ClientHeight = 252
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object strgrdOrdHist: TStringGrid
    Left = 0
    Top = 0
    Width = 651
    Height = 233
    Align = alClient
    ColCount = 14
    DefaultRowHeight = 20
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving, goRowSelect]
    TabOrder = 0
    OnDrawCell = strgrdOrdHistDrawCell
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 233
    Width = 651
    Height = 19
    Panels = <>
  end
  object qrySelPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select purchase_orderline.purchase_order ,'
      ' purchase_orderline.line ,'
      ' purchase_orderline.cust_order_no ,'
      ' purchase_orderline.customer ,'
      ' purchase_orderline.branch_no ,'
      ' purchase_orderline.customers_desc ,'
      ' purchase_orderline.Quantity ,'
      ' purchase_orderline.selling_price,'
      ' sell_unit.description as sell_unit,'
      ' purchase_orderline.order_price,'
      ' order_unit.description as order_unit,'
      ' purchase_orderline.original_order ,'
      ' purchase_orderline.Original_Orderline ,'
      ' purchase_orderline.Goods_reqd_by_customer ,'
      ' purchase_order.Date_Point ,'
      ' rep.Name as repName,'
      ' customer.name as CustName,'
      
        ' (purchase_orderline.Goods_reqd_by_customer + purchase_orderline' +
        '.expected_life) as expDate,'
      '  Form_Reference.Form_Reference_id,'
      '  Form_Reference.Form_Reference_Descr'
      'from (((((purchase_orderline'
      '  inner join rep on (purchase_orderline.rep = rep.rep))'
      
        '  inner join price_unit as sell_unit on (purchase_orderline.sell' +
        '_unit = sell_unit.price_unit))'
      
        '  inner join price_unit as order_unit on (purchase_orderline.ord' +
        'er_unit = order_unit.price_unit))'
      
        '  inner join customer on (purchase_orderline.customer = customer' +
        '.customer))'
      
        '  inner join purchase_order on (purchase_orderline.purchase_orde' +
        'r = purchase_order.purchase_order))'
      
        '  left join form_reference on (purchase_orderline.form_reference' +
        ' = form_reference.form_reference)'
      'where purchase_orderline.Purchase_Order = :Purchase_order'
      '  and purchase_orderline.line = :line'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 192
    Top = 160
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'line'
      end>
  end
end
