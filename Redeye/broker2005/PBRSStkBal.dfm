object PBRSStkBalFrm: TPBRSStkBalFrm
  Left = 173
  Top = 160
  BorderStyle = bsDialog
  Caption = 'Stock Report'
  ClientHeight = 227
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object IncRadioGroup: TRadioGroup
    Left = 8
    Top = 64
    Width = 225
    Height = 105
    Caption = 'Include'
    ItemIndex = 0
    Items.Strings = (
      'All Items'
      'Zero stock balance items'
      'Non Zero stock balance items'
      'Stock balance <= Re-Order Level')
    TabOrder = 0
    OnClick = IncRadioGroupClick
  end
  object rgCustomer: TRadioGroup
    Left = 8
    Top = 0
    Width = 145
    Height = 57
    Caption = 'By Customers'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'All Customers'
      'One Customer')
    ParentFont = False
    TabOrder = 1
    OnClick = rgCustomerClick
  end
  object CustomerPanel: TPanel
    Left = 163
    Top = 8
    Width = 281
    Height = 49
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object lblCustomer: TLabel
      Left = 8
      Top = 4
      Width = 83
      Height = 13
      Caption = 'Customer/Branch'
    end
    object edtCustomer: TEdit
      Left = 8
      Top = 20
      Width = 233
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object btnCustomer: TButton
      Left = 248
      Top = 19
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCustomerClick
    end
  end
  object CancelBitBtn: TBitBtn
    Left = 8
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 3
    Kind = bkCancel
  end
  object PreviewBitBtn: TBitBtn
    Left = 96
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Pre&view'
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
    Left = 184
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Print'
    TabOrder = 5
    OnClick = PrintBitBtnClick
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
  end
  object chkIncludeNonStock: TCheckBox
    Left = 243
    Top = 152
    Width = 172
    Height = 17
    Caption = 'include non stocked items'
    TabOrder = 6
  end
  object FaxBitBtn: TBitBtn
    Left = 269
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Fax'
    TabOrder = 7
    OnClick = FaxBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object EmailBitBtn: TBitBtn
    Left = 359
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Email'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = EmailBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
      000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
      FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
      FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
      9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
      0000777777777777777733333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object qryReport: TQuery
    DatabaseName = 'PB'
    Left = 256
    Top = 72
  end
  object dsReport: TDataSource
    AutoEdit = False
    DataSet = qryReport
    Left = 208
    Top = 72
  end
  object CustomerSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer')
    Left = 334
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object GetPartsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT distinct(Customer.Name) as Cust_Name,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Customer_Branch.Fax_Number,'
      '       Customer_Contact.Email,'
      '       Customer_Contact.Salutation,'
      '       Customer_Contact.Fax_Number as Contact_Fax,'
      '       Customer_Contact.Exportfilter,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Exportfilter.Description as Exportfilter_Descr,'
      
        '       Form_Reference.Reorder_Level, Form_Reference.Form_Referen' +
        'ce,'
      '       Form_Reference.Stocked_Item,'
      '       Form_reference.Stock_reference,'
      '       (select sum(Delivery_detail.Qty_to_Deliver)'
      #9#9'  from Purchase_Orderline POLine, Delivery_Detail'
      
        #9#9'  where POLine.form_reference = Form_reference.form_reference ' +
        'and'
      #9#9#9'POLine.purch_ord_line_Status = 20 and'
      #9#9#9'('
      #9#9#9'(Delivery_detail.purchase_order = POLine.purchase_order) and'
      #9#9#9'(Delivery_detail.Line = POLine.Line)'
      #9#9#9') and'
      #9#9#9'(Delivery_detail.delivery_to_Stock = '#39'Y'#39') and'
      
        #9#9#9'(Delivery_Detail.Qty_Delivered = 0)) AS Quantity_on_order, (s' +
        'elect sum(POLine.Qty_in_Stock)'
      #9#9'  from Purchase_orderline POLine'
      
        #9#9'  where POLine.form_reference = Form_reference.form_reference)' +
        ' AS Quantity_in_stock'
      'FROM Exportfilter RIGHT JOIN ((Purchase_Order'
      '  RIGHT JOIN (Customer INNER JOIN ((Customer_Branch'
      
        '  INNER JOIN Form_Reference ON (Customer_Branch.Branch_no = Form' +
        '_Reference.Branch_No)'
      '  AND (Customer_Branch.Customer = Form_Reference.Customer))'
      
        '  LEFT JOIN Purchase_OrderLine ON Form_Reference.Form_Reference ' +
        '= Purchase_OrderLine.Form_Reference)'
      '  ON Customer.Customer = Customer_Branch.Customer)'
      
        '  ON Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order)'
      '  LEFT JOIN Customer_Contact'
      '  ON (Customer_Branch.Branch_no = Customer_Contact.Branch_no)'
      '  AND (Customer_Branch.Customer = Customer_Contact.Customer))'
      '  ON Exportfilter.Exportfilter = Customer_Contact.Exportfilter'
      'where'
      '  Purchase_order.contact_no = Branch_Contact.contact_no'
      'Group By'
      '        Customer.Name,'
      '       Customer_Branch.Name,'
      '       Customer_Branch.Fax_Number,'
      '       Customer_Contact.Email,'
      '       Customer_Contact.Salutation,'
      '       Customer_Contact.Fax_Number,'
      '       Customer_Contact.Exportfilter,'
      '       Customer_Contact.Name,'
      '       Exportfilter.Description,'
      
        '       Form_Reference.Reorder_Level, Form_Reference.Form_Referen' +
        'ce,'
      '       Form_Reference.Stocked_Item ,'
      '       Form_Reference.Stock_reference'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 296
    Top = 104
  end
  object Dummy2SQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT (Customer.Name) AS Cust_Name,'
      '  Customer_Branch.Name AS Branch_Name,'
      '  Customer_Branch.Email,'
      '  Customer_Branch.Fax_Number,'
      '  Customer_Branch.Customer,'
      '  Customer_Branch.Branch_no'
      'FROM Customer INNER JOIN ((Customer_Branch'
      
        '  INNER JOIN Form_Reference ON (Customer_Branch.Branch_no = Form' +
        '_Reference.Branch_No)'
      '  AND (Customer_Branch.Customer = Form_Reference.Customer))'
      
        '  LEFT JOIN Purchase_OrderLine ON Form_Reference.Form_Reference ' +
        '= Purchase_OrderLine.Form_Reference) ON'
      '  Customer.Customer = Customer_Branch.Customer'
      
        'GROUP BY Customer.Name, Customer_Branch.Name, Customer_Branch.Em' +
        'ail, Customer_Branch.Fax_Number, Customer_Branch.Customer,'
      '  Customer_Branch.Branch_no'
      ' ')
    Left = 408
    Top = 120
  end
  object DummySQL: TQuery
    SQL.Strings = (
      'SELECT Form_Reference.Form_Reference_ID,'
      '       Form_Reference.Form_Reference_Descr,'
      '       Form_Reference.Stock_Reference,'
      '       Form_Reference.Reorder_Level,'
      #9'Form_Reference.Form_Reference,'
      #9'Customer.Name AS Customer_Name,'
      #9'Customer_Branch.Customer,'
      #9'Customer_Branch.Branch_no,'
      #9'Form_Reference.Stocked_Item,'
      ' '#9'(select sum(Delivery_detail.Qty_to_Deliver)'
      #9#9'from Purchase_Orderline POLine, Delivery_Detail'
      
        #9#9'where POLine.form_reference = Form_reference.form_reference an' +
        'd'
      #9#9#9'POLine.purch_ord_line_Status >= 20 and'
      #9#9#9'POLine.purch_ord_line_Status <= 22 and'
      #9#9#9'('
      #9#9#9'(Delivery_detail.purchase_order = POLine.purchase_order) and'
      #9#9#9'(Delivery_detail.Line = POLine.Line)'
      #9#9#9') and'
      #9#9#9'(Delivery_detail.delivery_to_Stock = '#39'Y'#39') and'
      #9#9#9'(Delivery_Detail.Qty_Delivered = 0)'
      
        '                        and (POLine.inactive <> '#39'Y'#39')) AS Quantit' +
        'y_on_order,'
      ' '#9'(select sum(Delivery_detail.Qty_to_Deliver)'
      #9#9'from Purchase_Orderline POLine, Delivery_Detail'
      
        #9#9'where POLine.form_reference = Form_reference.form_reference an' +
        'd'
      #9#9#9'POLine.purch_ord_line_Status >= 20 and'
      #9#9#9'POLine.purch_ord_line_Status <= 22 and'
      '                        (POLine.inactive <> '#39'Y'#39') and'
      #9#9#9'(round(POLine.Purchase_Order,0) <> POLine.Original_Order) and'
      #9#9#9'('
      #9#9#9'(Delivery_detail.purchase_order = POLine.purchase_order) and'
      #9#9#9'(Delivery_detail.Line = POLine.Line)'
      #9#9#9')) AS Total_on_order,'
      ' '#9'(select sum(POLine.Qty_in_Stock)'
      #9#9'from Purchase_orderline POLine'
      
        #9#9'where POLine.form_reference = Form_reference.form_reference an' +
        'd '
      
        '                        (POLine.inactive <> '#39'Y'#39')) as Quantity_in' +
        '_stock,'
      ' '#9'(select sum(POLine.Qty_in_Stock)'
      #9#9'from Purchase_orderline POLine'
      
        #9#9'where POLine.form_reference = Form_reference.form_reference an' +
        'd'
      
        '                        (POLine.inactive <> '#39'Y'#39') and (POLine.inv' +
        'oice_upfront = '#39'Y'#39')) as Paid_Stock'
      'FROM Customer'
      '      INNER JOIN ((Customer_Branch'
      '      INNER JOIN Form_Reference ON'
      
        '        (Customer_Branch.Branch_no = Form_Reference.Branch_No) A' +
        'ND'
      '        (Customer_Branch.Customer = Form_Reference.Customer))'
      '      LEFT JOIN Purchase_OrderLine ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference) ON'
      '        Customer.Customer = Customer_Branch.Customer'
      'WHERE Purchase_OrderLine.inactive <> '#39'Y'#39
      'GROUP BY Form_Reference.Form_Reference_ID,'
      '                   Form_Reference.Form_Reference_Descr,'
      '                   Form_Reference.Stock_Reference,'
      '                   Form_Reference.Reorder_Level,'
      '                   Form_Reference.Form_Reference,'
      '                   Customer.Name,'
      '                   Customer_Branch.Customer,'
      '                   Customer_Branch.Branch_no,'
      '                   Form_Reference.Stocked_Item'
      ' '
      ' '
      ' '
      ' ')
    Left = 400
    Top = 72
  end
end
