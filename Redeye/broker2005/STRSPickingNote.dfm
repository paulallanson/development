object STRSPickingNoteFrm: TSTRSPickingNoteFrm
  Left = 222
  Top = 126
  Caption = 'Print Picking Notes'
  ClientHeight = 415
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Sales Order'
    end
    object Label4: TLabel
      Left = 8
      Top = 32
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object CustomerLbl: TLabel
      Left = 88
      Top = 32
      Width = 58
      Height = 13
      Caption = 'CustomerLbl'
    end
    object SalesOrderlbl: TLabel
      Left = 88
      Top = 8
      Width = 62
      Height = 13
      Caption = 'SalesOrderlbl'
    end
    object Label6: TLabel
      Left = 368
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Order Date'
    end
    object OrderDatelbl: TLabel
      Left = 456
      Top = 8
      Width = 80
      Height = 13
      Caption = 'DateRequiredLbl'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 364
    Width = 652
    Height = 51
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      652
      51)
    object lblPickingConfirmed: TLabel
      Left = 8
      Top = 12
      Width = 352
      Height = 26
      Caption = 
        'This Picking Note has been confirmed and the details cannot be  ' +
        'changed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object chkbxAutoConfirm: TCheckBox
      Left = 10
      Top = 18
      Width = 319
      Height = 17
      Caption = 'Automatically confirm the picking for this Picking Note'
      TabOrder = 3
    end
    object Previewbitbtn: TBitBtn
      Left = 394
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Pre&view'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 0
      OnClick = PreviewbitbtnClick
    end
    object PrintBitBtn: TBitBtn
      Left = 483
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Print'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = PrintBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 572
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = CancelBitBtnClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 652
    Height = 56
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 4
      Width = 66
      Height = 13
      Caption = 'Picking Notes'
    end
    object Label1: TLabel
      Left = 256
      Top = 25
      Width = 64
      Height = 13
      Caption = 'Delivery Date'
    end
    object btnDate: TSpeedButton
      Left = 415
      Top = 19
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      OnClick = btnDateClick
    end
    object cmbPickingNote: TComboBox
      Left = 8
      Top = 21
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = '<New Picking Note>'
      OnClick = cmbPickingNoteClick
      Items.Strings = (
        '<New Picking Note>')
    end
    object edtPickingDate: TEdit
      Left = 328
      Top = 21
      Width = 81
      Height = 21
      TabOrder = 1
      OnExit = edtPickingDateExit
    end
    object chkbxPrintCopy: TCheckBox
      Left = 480
      Top = 24
      Width = 169
      Height = 17
      Caption = 'Print copy to default printer'
      TabOrder = 2
    end
  end
  object sgDetails: TStringGrid
    Left = 0
    Top = 113
    Width = 652
    Height = 251
    Align = alClient
    ColCount = 6
    DefaultRowHeight = 20
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goThumbTracking]
    TabOrder = 3
    OnDrawCell = sgDetailsDrawCell
    OnKeyPress = sgDetailsKeyPress
    OnSelectCell = sgDetailsSelectCell
    ColWidths = (
      119
      203
      79
      75
      76
      76)
  end
  object qrySOAlloc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Part_Store_Allocation.*,'
      '        Part.Part_Description,'
      '        Store_Stock.Part_Bin,'
      '        Store_Stock.Part_Store_Lot,'
      '        Store_Stock.Part_Store,'
      '        Store_Stock.Invoice_upfront,'
      '        Store_Stock.Stock_Pack_Quantity,'
      '        Store_Stock.Date_Received,'
      '        Store_Stock.Sets_per_pad,'
      '        Store_Stock.Purchase_Order,'
      '        ISNULL((Select sum(Quantity_to_Pick)'
      '         from Sales_Order_Picking'
      
        '         where Sales_Order_Picking.Sales_Order = Part_Store_Allo' +
        'cation.Sales_Order AND'
      
        '               Sales_Order_Picking.Sales_Order_line_no = Part_St' +
        'ore_Allocation.Sales_Order_Line_no AND'
      
        '               Sales_Order_Picking.Part_Bin = Store_Stock.Part_B' +
        'in AND'
      
        '               ((Sales_Order_Picking.Pick_Note_Confirmed is NULL' +
        ') or'
      
        '               (Sales_Order_Picking.Pick_Note_Confirmed = '#39'N'#39')) ' +
        'AND'
      
        '               Sales_Order_Picking.Part_Store_Lot = Store_Stock.' +
        'Part_Store_Lot),0) as Quantity_Used,'
      
        '        (Part_Store_Allocation.Quantity_Allocated - ISNULL((Sele' +
        'ct sum(Quantity_to_Pick)'
      '         from Sales_Order_Picking'
      
        '         where Sales_Order_Picking.Sales_Order = Part_Store_Allo' +
        'cation.Sales_Order AND'
      
        '               Sales_Order_Picking.Sales_Order_line_no = Part_St' +
        'ore_Allocation.Sales_Order_Line_no AND'
      
        '               Sales_Order_Picking.Part_Bin = Store_Stock.Part_B' +
        'in AND'
      
        '               ((Sales_Order_Picking.Pick_Note_Confirmed is NULL' +
        ') or'
      
        '               (Sales_Order_Picking.Pick_Note_Confirmed = '#39'N'#39')) ' +
        'AND'
      
        '               Sales_Order_Picking.Part_Store_Lot = Store_Stock.' +
        'Part_Store_Lot),0)) as Quantity_to_Pick'
      'from Part_Store_Allocation, Part, store_Stock'
      'where'
      '  Sales_order = :sales_Order AND'
      '  Part.Part = Part_Store_Allocation.Part AND'
      '  Store_Stock.Store_Stock = Part_Store_Allocation.Store_Stock'
      'Order by Sales_Order_Line_No')
    Left = 32
    Top = 161
    ParamData = <
      item
        Name = 'sales_Order'
      end>
  end
  object dtsSOAlloc: TDataSource
    DataSet = qrySOAlloc
    Left = 104
    Top = 161
  end
  object qryDelPick: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Sales_order_Picking'
      'where Sales_Order_Picking = :Sales_Order_Picking')
    Left = 192
    Top = 160
    ParamData = <
      item
        Name = 'Sales_Order_Picking'
      end>
  end
  object qryAddPick: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Sales_Order_Picking'
      '(Sales_Order_Picking,'
      'Picking_No,'
      'Sales_Order,'
      'Sales_Order_Line_No,'
      'Quantity_To_Pick,'
      'Picking_List_Ref,'
      'Date_Picked,'
      'Part_Bin,'
      'Part_Store_Lot,'
      'Stock_Pack_Quantity,'
      'Part_Store,'
      'Invoice_upfront,'
      'Part_Store_Allocation,'
      'Pick_Note_Confirmed,'
      'Date_Received,'
      'Sets_Per_Pad,'
      'Purchase_Order)'
      'Values'
      '(:Sales_Order_Picking,'
      ':Picking_No,'
      ':Sales_Order,'
      ':Sales_Order_Line_No,'
      ':Quantity_To_Pick,'
      ':Picking_List_Ref,'
      ':Date_Picked,'
      ':Part_Bin,'
      ':Part_Store_Lot,'
      ':Stock_Pack_Quantity,'
      ':Part_Store,'
      ':Invoice_upfront,'
      ':Part_Store_Allocation,'
      ':Pick_Note_Confirmed,'
      ':Date_Received,'
      ':Sets_Per_Pad,'
      ':Purchase_Order)'
      '')
    Left = 272
    Top = 160
    ParamData = <
      item
        Name = 'Sales_Order_Picking'
      end
      item
        Name = 'Picking_No'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_No'
      end
      item
        Name = 'Quantity_To_Pick'
      end
      item
        Name = 'Picking_List_Ref'
      end
      item
        Name = 'Date_Picked'
      end
      item
        Name = 'Part_Bin'
      end
      item
        Name = 'Part_Store_Lot'
      end
      item
        Name = 'Stock_Pack_Quantity'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Invoice_upfront'
      end
      item
        Name = 'Part_Store_Allocation'
      end
      item
        Name = 'Pick_Note_Confirmed'
        DataType = ftString
      end
      item
        Name = 'Date_Received'
      end
      item
        Name = 'Sets_Per_Pad'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetNext: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Sales_Order_Picking) as Last_Picking'
      'from Sales_Order_Picking')
    Left = 344
    Top = 160
  end
  object qryPickNotes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct Sales_Order_Picking, Picking_List_Ref, Date_Pick' +
        'ed'
      'from Sales_Order_Picking'
      'where Sales_Order = :Sales_Order')
    Left = 424
    Top = 160
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qrySOPicking: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  sales_order_line.Part,'
      
        '        Sales_Order_Picking.Quantity_to_Pick as Quantity_Allocat' +
        'ed,'
      '        Part.Part_Description,'
      '        Sales_Order_Picking.Sales_Order_Picking,'
      '        Sales_Order_Picking.Date_Picked,'
      '        Sales_Order_Picking.Part_Bin,'
      '        Sales_Order_Picking.Sales_Order,'
      '        Sales_Order_Picking.Sales_Order_Line_No,'
      '        Sales_Order_Picking.Part_Store_Lot,'
      '        Sales_Order_Picking.Part_Store,'
      '        Sales_Order_Picking.Invoice_upfront,'
      '        Sales_Order_Picking.Stock_Pack_Quantity,'
      '        Sales_Order_Picking.Quantity_to_Pick as Quantity_Used,'
      
        '        Sales_Order_Picking.Quantity_to_Pick as Quantity_to_Pick' +
        ','
      '        Sales_Order_Picking.Part_Store_Allocation,'
      '        Sales_Order_Picking.Pick_Note_Confirmed,'
      '        Sales_Order_Picking.Date_Received,'
      '        Sales_Order_Picking.Sets_per_pad,'
      '        Sales_Order_Picking.Purchase_Order'
      'from Sales_Order_Picking, Part, Sales_Order_line'
      'where'
      
        '  Sales_Order_Picking.Sales_Order_Picking = :Sales_Order_Picking' +
        ' AND'
      
        '  ((sales_Order_picking.sales_order = sales_order_line.sales_ord' +
        'er) and'
      
        '  (sales_order_picking.sales_order_line_no = sales_order_line.sa' +
        'les_order_line_no)) and'
      '  Part.Part = Sales_Order_line.Part'
      'Order by Sales_Order_Picking.Sales_Order_Line_No')
    Left = 32
    Top = 217
    ParamData = <
      item
        Name = 'Sales_Order_Picking'
      end>
  end
  object qryProdLocation: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Sales_order.Production_Location,'
      '        Production_Location.Receive_Forward_Stock'
      'from  Sales_Order,'
      '      Production_Location'
      'Where Sales_order.Sales_Order = :Sales_Order AND'
      
        '      Sales_Order.Production_Location = Production_Location.Prod' +
        'uction_Location')
    Left = 32
    Top = 273
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
end
