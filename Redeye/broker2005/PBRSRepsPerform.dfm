object PBRSRepsPerformfrm: TPBRSRepsPerformfrm
  Left = 511
  Top = 219
  BorderStyle = bsDialog
  Caption = 'Reps Performance report'
  ClientHeight = 208
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 100
    Width = 100
    Height = 13
    Caption = 'Select Financial Year'
  end
  object rgRep: TRadioGroup
    Left = 8
    Top = 16
    Width = 121
    Height = 65
    Caption = 'By Rep'
    ItemIndex = 0
    Items.Strings = (
      'All Reps'
      'One Rep')
    TabOrder = 0
    OnClick = rgRepClick
  end
  object pnlRepSearch: TPanel
    Left = 132
    Top = 16
    Width = 257
    Height = 65
    TabOrder = 1
    Visible = False
    object lblCustBran: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Rep Name'
    end
    object edtRep: TEdit
      Left = 8
      Top = 24
      Width = 209
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnRep: TButton
      Left = 224
      Top = 24
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnRepClick
    end
  end
  object dblkpFY: TDBLookupComboBox
    Left = 132
    Top = 96
    Width = 157
    Height = 21
    KeyField = 'Financial_Year'
    ListField = 'Title'
    ListSource = dtsFY
    TabOrder = 2
    OnClick = dblkpFYClick
  end
  object CancelBitBtn: TBitBtn
    Left = 254
    Top = 176
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object PreviewBitBtn: TBitBtn
    Left = 68
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Preview'
    Enabled = False
    TabOrder = 4
    OnClick = PreviewBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
  end
  object PrintBitBtn: TBitBtn
    Left = 161
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Print'
    Enabled = False
    TabOrder = 5
    OnClick = PrintBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object pnlProgress: TPanel
    Left = 0
    Top = 128
    Width = 401
    Height = 41
    BevelOuter = bvNone
    TabOrder = 6
    object Label2: TLabel
      Left = 8
      Top = 2
      Width = 47
      Height = 13
      Caption = 'Progress: '
    end
    object Label3: TLabel
      Left = 80
      Top = 2
      Width = 93
      Height = 13
      Caption = 'Reading invoice file'
    end
    object lblProgress: TLabel
      Left = 265
      Top = 2
      Width = 5
      Height = 13
      Caption = 'x'
      Visible = False
    end
    object lblRecordCount: TLabel
      Left = 315
      Top = 2
      Width = 62
      Height = 13
      Caption = 'records read.'
      Visible = False
    end
    object prgrsbrImport: TProgressBar
      Left = 8
      Top = 16
      Width = 380
      Height = 17
      TabOrder = 0
    end
  end
  object qryFY: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Financial_Year'
      'order by Financial_Year')
    Left = 304
    Top = 72
  end
  object dtsFY: TDataSource
    DataSet = qryFY
    Left = 336
    Top = 72
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Company'
      'where company = 1')
    Left = 16
    Top = 56
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    Left = 80
    Top = 24
  end
  object AddIntSelQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Sel5)'
      'Values'
      '(:Int_Sel_Code, :Sel1, :Sel2, :Sel3, :Sel4, :Sel5)'
      ''
      ''
      ''
      ''
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
      ' ')
    Left = 192
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Sel1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sel2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sel3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sel4'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Sel5'
        ParamType = ptUnknown
      end>
  end
  object qryAddPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Total_Cost'
      'from Purch_Ord_add_charge'
      '  where (Purch_Ord_Add_Charge.Purch_Ord = :Purch_Ord) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 144
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object AddCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Add_Cost'
      'from Purch_Ord_line_add_chg'
      '  where (Purch_Ord_Line_Add_Chg.Purchase_Order = :PurchOrder) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 14
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PurchOrder'
        ParamType = ptUnknown
      end>
  end
  object qryPeriod: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Period'
      'from Period'
      'where :Invoice_Date > Last_Period_End_Date AND'
      ':Invoice_Date <= Period_End_Date')
    Left = 268
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Date'
        ParamType = ptUnknown
      end>
  end
  object SQLUpdIntSel: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Int_Sel'
      'set Sel5= Sel5 + :Sel5,'
      '  Sel4 = Sel4 + :Sel4'
      
        'where (Int_Sel_Code = :Int_Sel_Code) and (Sel1 = :Sel1) and (Sel' +
        '2 = :Sel2) and (Sel3 = :Sel3)'
      ''
      ''
      ''
      ''
      ''
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
      ' '
      ' '
      ''
      ' ')
    Left = 336
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sel5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sel4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sel1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sel2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sel3'
        ParamType = ptUnknown
      end>
  end
  object qryGetFYPeriods: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Period'
      'where Financial_Year = :Financial_Year'
      'order by Period')
    Left = 184
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Financial_Year'
        ParamType = ptUnknown
      end>
  end
  object GetCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Sales_Invoice_Line.Qty_Invoiced, Purchase_OrderLine.Order' +
        '_Price,'
      
        '      Purchase_OrderLine.Quantity, Price_Unit.Price_Unit_Factor ' +
        'as Order_Unit_Factor'
      'FROM Price_Unit'
      '    INNER JOIN (Purchase_OrderLine'
      '    INNER JOIN (Sales_Invoice'
      
        '    INNER JOIN Sales_Invoice_Line ON Sales_Invoice.Sales_Invoice' +
        ' = Sales_Invoice_Line.Sales_Invoice)'
      '      ON (Purchase_OrderLine.Line = Sales_Invoice_Line.Line)'
      
        '      AND (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Lin' +
        'e.Purchase_Order))'
      '      ON (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      'WHERE ((Sales_Invoice.Sales_Invoice = :Invoice_No) and'
      '    (Sales_Invoice_Line.Invoice_Line_No = :Line_No))'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 16
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'invoice_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryCreditLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Price_Unit,'
      '        Price_Unit.Price_Unit_Factor as Invoice_Unit_Factor,'
      '        Sales_Invoice_Line.Cost_Price,'
      '        Sales_Invoice_Line.Purchase_order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_line_no,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_bag_Line,'
      '        Sales_Invoice_Line.Credit_Type'
      'FROM Price_Unit'
      '      INNER JOIN Sales_Invoice_Line ON'
      '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      'WHERE ((Sales_Invoice_Line.Sales_Invoice = :Invoice_No) and'
      '    (Sales_Invoice_Line.Invoice_Line_No = :Line_No))'
      ''
      ' '
      ' ')
    Left = 78
    Top = 78
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetProdCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Order_Price,'
      '        Price_unit_Factor as Order_unit_Factor,'
      '        Quantity'
      'from Purchase_OrderLine, Price_Unit'
      'where Purchase_Order = :Purchase_Order AND'
      'Line = :Line AND'
      '(Purchase_OrderLine.Order_unit = Price_unit.Price_Unit)'
      ' ')
    Left = 227
    Top = 70
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryGetJBCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag_Line_Cost'
      'FROM Job_Bag_Line_Dets'
      'WHERE Job_Bag_Line_Dets.Job_Bag = :Job_Bag and'
      'Job_Bag_Line_Dets.Job_Bag_line = :Job_Bag_Line'
      ' ')
    Left = 228
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_line.Sales_Order,'
      '        Sales_Order_line.Sales_Order_line_no,'
      '        Sales_Order_line.Part_Cost,'
      '        Sales_Order_line.Purch_Pack_Quantity'
      'FROM Sales_Order_line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ')'
      ' '
      ' '
      ' '
      ' ')
    Left = 296
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_line_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  Purch_Ord.Purch_Ord,'
      '  Purch_Ord.Purch_ord_no,'
      '  Purch_ord_Line.Purch_Pack_Quantity,'
      '  Purch_ord_Line.Purchase_Price'
      'from Sales_order_Line, Purch_Ord, Purch_Ord_Line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ') and'
      '(Sales_Order_Line.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_order_line.Sales_order' +
        '_Line_no)'
      ')'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 224
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_line_no'
        ParamType = ptUnknown
      end>
  end
  object qryGetJBCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Purchase_OrderLine.Quantity,'
      '        Price_Unit.Price_Unit_Factor,'
      '        (select Sum(Amount)'
      '         from Purch_ord_line_Add_Chg'
      
        '         where Purch_Ord_Line_Add_Chg.Purchase_order = Sales_Inv' +
        'oice_Line.Purchase_Order and'
      
        '               Purch_Ord_Line_Add_Chg.Line = Sales_Invoice_Line.' +
        'Line) as Extra_Cost'
      'FROM Price_Unit'
      '     RIGHT JOIN (Purchase_OrderLine'
      '     RIGHT JOIN (Job_Bag_Line_Dets'
      '     INNER JOIN Sales_Invoice_Line ON'
      
        '        (Job_Bag_Line_Dets.Job_Bag_Line = Sales_Invoice_Line.Job' +
        '_Bag_Line) AND'
      
        '        (Job_Bag_Line_Dets.Job_Bag = Sales_Invoice_Line.Job_Bag)' +
        ') ON'
      '        (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.P' +
        'urchase_Order)) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit'
      'WHERE ((Sales_Invoice_Line.Sales_Invoice = :Sales_Invoice) and'
      '    (Sales_Invoice_Line.Invoice_Line_No = :Line_No));'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 128
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'Purch_Ord.Purch_Ord, '
      
        'sum((Sales_Invoice_Line.Qty_Invoiced/Purch_ord_Line.Purch_Pack_Q' +
        'uantity)*Purchase_Price) as Total_Cost'
      'from Sales_invoice_line, Sales_order, Purch_Ord, Purch_Ord_Line'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and '
      '(Sales_Invoice_Line.Sales_order = Sales_Order.Sales_order) and'
      '(Sales_Order.Sales_Order = Purch_Ord.Sales_order) and'
      '(Sales_Invoice_Line.Invoice_Line_No = :Line_No)  and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_Invoice_Line.Sales_ord' +
        'er_Line_no)'
      ')'
      'Group By'
      'Purch_Ord.Purch_Ord'
      ' '
      ' '
      ' ')
    Left = 288
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select sum(Part_Cost*((Sales_invoice_line.Qty_Invoiced*1.0000)/(' +
        'Purch_Pack_Quantity*1.0000))) as Total_Cost'
      'from Sales_Order_Line, Sales_invoice_line'
      'where Sales_invoice_line.Sales_Order = :Sales_Order and'
      'Sales_invoice_line.Sales_invoice = :Sales_invoice and'
      '(Sales_Invoice_Line.Invoice_Line_No = :Line_No) and'
      '('
      
        '(Sales_invoice_line.Sales_order = Sales_order_line.sales_order) ' +
        'and'
      
        '(Sales_invoice_line.Sales_order_line_no = Sales_order_line.Sales' +
        '_order_line_no)'
      ')'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 288
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_No'
        ParamType = ptUnknown
      end>
  end
end
