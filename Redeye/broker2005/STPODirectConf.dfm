object STPODirectConfFrm: TSTPODirectConfFrm
  Left = 28
  Top = 50
  Caption = 'Confirm Direct Order Deliveries'
  ClientHeight = 437
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlFunctions: TPanel
    Left = 0
    Top = 396
    Width = 724
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      724
      41)
    object btnOK: TBitBtn
      Left = 544
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
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
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 632
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object BitBtnAdd: TBitBtn
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Add '
      Default = True
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
      TabOrder = 2
      OnClick = BitBtnAddClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 89
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 77
      Height = 13
      Caption = 'Purchase Order:'
    end
    object Label2: TLabel
      Left = 224
      Top = 64
      Width = 47
      Height = 13
      Caption = 'Customer:'
    end
    object Label3: TLabel
      Left = 43
      Top = 40
      Width = 55
      Height = 13
      Caption = 'Order Date:'
    end
    object Label4: TLabel
      Left = 556
      Top = 16
      Width = 72
      Height = 13
      Caption = 'Required Date:'
    end
    object lblCustomer: TLabel
      Left = 296
      Top = 64
      Width = 54
      Height = 13
      Caption = 'lblCustomer'
    end
    object lblPODate: TLabel
      Left = 120
      Top = 40
      Width = 48
      Height = 13
      Caption = 'lblPODate'
    end
    object lblReqDate: TLabel
      Left = 648
      Top = 16
      Width = 53
      Height = 13
      Caption = 'lblReqDate'
    end
    object lblPONumber: TLabel
      Left = 120
      Top = 16
      Width = 62
      Height = 13
      Caption = 'lblPONumber'
    end
    object Label5: TLabel
      Left = 233
      Top = 16
      Width = 41
      Height = 13
      Caption = 'Supplier:'
    end
    object lblSupplier: TLabel
      Left = 296
      Top = 16
      Width = 48
      Height = 13
      Caption = 'lblSupplier'
    end
    object Label6: TLabel
      Left = 37
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Sales Order:'
    end
    object lblSalesOrder: TLabel
      Left = 120
      Top = 64
      Width = 62
      Height = 13
      Caption = 'lblSalesOrder'
    end
  end
  object grdDetails: TStringGrid
    Left = 0
    Top = 89
    Width = 724
    Height = 307
    Align = alClient
    ColCount = 8
    DefaultColWidth = 40
    DefaultRowHeight = 20
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
    TabOrder = 2
    OnDrawCell = grdDetailsDrawCell
    OnKeyPress = CheckKeyIsNumber
    OnSelectCell = grdDetailsSelectCell
    ColWidths = (
      40
      124
      204
      68
      78
      75
      73
      66)
  end
  object qryGetDtls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'Purch_Ord_Line.*, '
      #9'Part.Part_Description,'
      '        Purch_Ord.Sales_order,'
      #9'Sales_Order_Line.Quantity_Invoiced,'
      '                Sales_Order_Line.Sales_Order_Line_No'
      'from Purch_Ord_Line, Part, Purch_Ord, Sales_Order_Line'
      'where Purch_Ord_Line.Purch_Ord = :Purch_Ord and'
      '(Purch_Ord_Line.Part = Part.Part) and'
      '(Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord) and'
      '('
      '(Sales_Order_Line.Sales_Order = Purch_Ord.Sales_Order) and'
      '(Sales_Order_Line.Part = Purch_Ord_Line.Part)'
      ')')
    Left = 424
    Top = 160
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryGetHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purch_Ord.Purch_ord,'
      'Purch_Ord.Purch_Ord_Status,'
      'Purch_Ord.Supplier,'
      'Purch_Ord.Branch_no,'
      'Purch_Ord.Purch_Ord_No,'
      'Purch_Ord.Purch_Ord_Date,'
      'Purch_Ord.Date_Required,'
      'Purch_Ord.Sales_Order,'
      'Sales_Order.Customer,'
      'Supplier.Name as Supplier_Name,'
      'Supplier_Branch.Name as Supp_Branch_Name,'
      'Customer.Name as Customer_Name,'
      'Customer_Branch.Name as Branch_Name'
      
        'from Purch_Ord, Sales_Order, Customer, Customer_Branch, Supplier' +
        ', Supplier_Branch'
      'where Purch_Ord.Purch_Ord = :Purch_Ord and'
      'Purch_Ord.Sales_Order = Sales_Order.Sales_Order and'
      '(Sales_Order.Customer = Customer.Customer) and'
      '('
      '(Sales_Order.Customer = Customer_Branch.Customer) and'
      '(Sales_Order.Branch_no = Customer_Branch.Branch_no)'
      ') and'
      '(Purch_Ord.Supplier = Supplier.Supplier) and'
      '('
      '(Purch_Ord.Supplier = Supplier_Branch.Supplier) and'
      '(Purch_Ord.Branch_no = Supplier_Branch.Branch_no)'
      ')'
      ''
      ' ')
    Left = 504
    Top = 160
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object UpdPOStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord'
      'Set'
      'Purch_Ord_Status = :Purch_Ord_Status'
      'Where (Purch_Ord = :Purch_Ord)'
      ' '
      ' '
      ' ')
    Left = 304
    Top = 124
    ParamData = <
      item
        Name = 'Purch_Ord_Status'
      end
      item
        Name = 'Purch_Ord'
      end>
  end
  object CheckPOStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Purch_Ord.Purch_Ord_Status,'
      '       (Select Count(Purch_Ord_Line_No)'
      '               From Purch_Ord_Line'
      '               Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      
        '                     (Purch_Ord_Line.Fully_Received = '#39'N'#39')) as N' +
        'o_Not_Deliv,'
      '       (Select Count(Purch_Ord_Line_No)'
      '               From Purch_Ord_Line'
      '               Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      
        '                     (Purch_Ord_Line.Fully_Received = '#39'Y'#39')) as N' +
        'o_Deliv,'
      '       (Select Count(Purch_Ord_Line_No)'
      '               From Purch_Ord_Line'
      '               Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      
        '                     (Purch_Ord_Line.Fully_Received = '#39'P'#39')) as N' +
        'o_Part_Deliv,'
      '       (Select sum(Qty_Invoiced)'
      '               From Purch_Ord_Line'
      
        '               Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord)) as' +
        ' Qty_Invoiced,'
      '       (Select sum(Quantity_Received)'
      '               From Purch_Ord_Line'
      
        '               Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord)) as' +
        ' Qty_Received'
      'From Purch_Ord'
      'Where  (Purch_Ord.Purch_Ord = :Purch_Ord)'
      ''
      ''
      '')
    Left = 280
    Top = 204
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord'
      end>
  end
  object UpdPOLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord_Line'
      'Set'
      'Quantity_Received = :Quantity_Received,'
      'Quantity_Sent = :Quantity_Sent,'
      'Date_Deliv_Actual = :Date_Deliv_Actual,'
      'GRN_No = :GRN_No,'
      'Fully_Received = :Fully_Received'
      'Where (Purch_Ord = :Purch_Ord) and'
      '      (Purch_Ord_Line_No = :Purch_Ord_Line_No)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 360
    Top = 196
    ParamData = <
      item
        Name = 'Quantity_Received'
      end
      item
        Name = 'Quantity_Sent'
      end
      item
        Name = 'Date_Deliv_Actual'
      end
      item
        Name = 'GRN_No'
      end
      item
        Name = 'Fully_Received'
      end
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end>
  end
  object qryInsPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Purch_Ord_Line'
      
        '(Purch_Ord, Purch_Ord_Line_No, Quantity_Allocated, Fully_Receive' +
        'd,'
      ' Quantity_Ordered, Part, Quantity_Received,'
      ' Date_Deliv_Expected, Date_Deliv_Actual, Purchase_Price, GRN_No,'
      
        ' Quantity_Sent, Purch_Pack_Quantity, Replacement_For_Line, Disco' +
        'unt, Cost_Price,'
      ' Qty_Invoiced)'
      'Values'
      '(:Purch_Ord, :Purch_Ord_Line_No, :Quantity_Allocated, '#39'Y'#39','
      ' :Quantity_Ordered, :Part, :Quantity_Received,'
      
        ' :Date_Deliv_Expected, :Date_Deliv_Actual, :Purchase_Price, :GRN' +
        '_No,'
      
        ' :Quantity_Sent,:Purch_Pack_Quantity, :Replacement_For_Line, :Di' +
        'scount, :Cost_Price,'
      ' :Qty_Invoiced)'
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
      ' '
      ' ')
    Left = 392
    Top = 256
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Quantity_Ordered'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Quantity_Received'
      end
      item
        Name = 'Date_Deliv_Expected'
        DataType = ftDate
      end
      item
        Name = 'Date_Deliv_Actual'
        DataType = ftDate
      end
      item
        Name = 'Purchase_Price'
      end
      item
        Name = 'GRN_No'
        DataType = ftString
      end
      item
        Name = 'Quantity_Sent'
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Replacement_For_Line'
        DataType = ftInteger
      end
      item
        Name = 'Discount'
      end
      item
        Name = 'Cost_Price'
      end
      item
        Name = 'Qty_Invoiced'
      end>
  end
end
