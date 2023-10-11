object frmPBMaintJobBagRecStock: TfrmPBMaintJobBagRecStock
  Left = 246
  Top = 129
  Caption = 'Reconcile Job Bag Stock'
  ClientHeight = 433
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Job Bag'
    end
    object lblJobBag: TLabel
      Left = 96
      Top = 16
      Width = 46
      Height = 13
      Caption = 'lblJobBag'
    end
    object Label3: TLabel
      Left = 24
      Top = 64
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object lblDescription: TLabel
      Left = 96
      Top = 64
      Width = 63
      Height = 13
      Caption = 'lblDescription'
    end
    object Label6: TLabel
      Left = 24
      Top = 40
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object lblCustomerName: TLabel
      Left = 96
      Top = 40
      Width = 63
      Height = 13
      Caption = 'lblDescription'
    end
  end
  object Panel3: TPanel
    Left = 710
    Top = 89
    Width = 95
    Height = 303
    Align = alRight
    TabOrder = 1
    object btnReconcile: TButton
      Left = 12
      Top = 15
      Width = 75
      Height = 25
      Caption = '&Reconcile'
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 805
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      805
      41)
    object Panel2: TPanel
      Left = 531
      Top = 1
      Width = 273
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
    end
    object btnOK: TBitBtn
      Left = 316
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 404
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object sgLines: TStringGrid
    Left = 0
    Top = 89
    Width = 710
    Height = 303
    Align = alClient
    ColCount = 7
    DefaultColWidth = 40
    DefaultRowHeight = 18
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 3
    OnDrawCell = sgLinesDrawCell
    OnKeyPress = sgLinesKeyPress
    OnKeyUp = sgLinesKeyUp
    OnSelectCell = sgLinesSelectCell
    ColWidths = (
      40
      182
      226
      83
      87
      86
      40)
  end
  object qryJBStock: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Sales_Order_line.Part,'
      '      Part.Part_Description,'
      '      sum(Quantity_Ordered) as Qty_Ordered,'
      '      sum(Quantity_Delivered) as Qty_Despatched,'
      '      isnull((select sum(Quantity) from Job_Bag_Return'
      
        '      where Job_Bag_Return.Part = Sales_order_line.Part),0) as Q' +
        'ty_Overs'
      'from Job_Bag_line_Dets, Sales_order_line, Part'
      'where Job_Bag_line_dets.Job_Bag = :Job_Bag and'
      '('
      
        '(Job_Bag_line_Dets.sales_order = Sales_order_line.sales_order) a' +
        'nd'
      
        '(Job_Bag_line_Dets.sales_order_line_no = Sales_order_line.sales_' +
        'order_line_no)'
      ') and'
      'Sales_order_line.Part = Part.Part'
      'GROUP BY Sales_Order_line.Part,'
      '      Part.Part_Description'
      'ORDER BY Sales_Order_Line.Part')
    Left = 464
    Top = 224
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetJBSalesOrders: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Order_line.Part,'
      '      Sales_Order_line.sales_order,'
      '      Sales_Order_line.sales_order_line_no,'
      '      Quantity_Ordered,'
      '      Quantity_Delivered,'
      '      Job_Bag_line_Dets.Job_Bag'
      'from Job_Bag_line_Dets, Sales_order_line'
      'where Job_Bag_line_dets.Job_Bag = :Job_Bag and'
      'Sales_order_line.Part = :Part and'
      '('
      
        '(Job_Bag_line_Dets.sales_order = Sales_order_line.sales_order) a' +
        'nd'
      
        '(Job_Bag_line_Dets.sales_order_line_no = Sales_order_line.sales_' +
        'order_line_no)'
      ')'
      'ORDER BY Sales_Order_Line.Sales_order')
    Left = 536
    Top = 224
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Part'
      end>
  end
  object qryGetJBReturns: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Job_Bag_Return'
      'where Job_bag = :Job_Bag and'
      'Part = :Part')
    Left = 536
    Top = 288
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Part'
      end>
  end
  object qryUpdSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order_line'
      
        'Set Quantity_Delivered = Quantity_Delivered + :Quantity_Delivere' +
        'd'
      'where sales_order = :sales_order and'
      'sales_order_line_no = :sales_order_line_no')
    Left = 536
    Top = 344
    ParamData = <
      item
        Name = 'Quantity_Delivered'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order_line_no'
      end>
  end
  object qryUpdJBReturn: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_Bag_Return'
      'set Quantity = Quantity - :Quantity'
      'where Job_Bag_Return = :Job_Bag_Return')
    Left = 624
    Top = 224
    ParamData = <
      item
        Name = 'Quantity'
      end
      item
        Name = 'Job_Bag_Return'
      end>
  end
end
