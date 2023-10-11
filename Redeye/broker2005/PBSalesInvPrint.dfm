object PBSalesInvPrintFrm: TPBSalesInvPrintFrm
  Left = 273
  Top = 145
  Caption = 'Print Sales Invoices'
  ClientHeight = 225
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 232
    Top = 106
    Width = 23
    Height = 13
    Caption = 'Date'
    Visible = False
  end
  object SpeedButton1: TSpeedButton
    Left = 344
    Top = 101
    Width = 23
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
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
    ParentFont = False
    Visible = False
    OnClick = SpeedButton1Click
  end
  object InvoiceDateEdit: TEdit
    Left = 264
    Top = 102
    Width = 73
    Height = 21
    TabOrder = 7
    Visible = False
    OnExit = InvoiceDateEditExit
  end
  object PrintBitBtn: TBitBtn
    Left = 123
    Top = 185
    Width = 75
    Height = 25
    Caption = 'Print'
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
    TabOrder = 3
    OnClick = PrintBitBtnClick
  end
  object PreviewBitBtn: TBitBtn
    Left = 204
    Top = 185
    Width = 75
    Height = 25
    Caption = 'Preview'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
      0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
      0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
      5555557FFFFF7755555555500000005555555577777775555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
    TabOrder = 4
    OnClick = PreviewBitBtnClick
  end
  object SelectionGroup: TRadioGroup
    Left = 24
    Top = 16
    Width = 345
    Height = 73
    Caption = 'Invoice Selection'
    ItemIndex = 0
    Items.Strings = (
      'Print selected'
      'Print ALL')
    ParentBackground = False
    TabOrder = 0
  end
  object CloseBitBtn: TBitBtn
    Left = 24
    Top = 185
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 6
  end
  object Updatechk: TCheckBox
    Left = 40
    Top = 104
    Width = 129
    Height = 17
    Caption = 'Update Invoice files'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object EmailBitBtn: TBitBtn
    Left = 286
    Top = 185
    Width = 75
    Height = 25
    Caption = '&Email'
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
    TabOrder = 5
    OnClick = EmailBitBtnClick
  end
  object SelectLst: TListBox
    Left = 337
    Top = 24
    Width = 25
    Height = 113
    ItemHeight = 13
    Sorted = True
    TabOrder = 8
    Visible = False
  end
  object chkbxPrintLogo: TCheckBox
    Left = 40
    Top = 128
    Width = 129
    Height = 17
    Caption = 'Print Company Logo'
    TabOrder = 2
  end
  object chkbxShowZeroValues: TCheckBox
    Left = 40
    Top = 152
    Width = 233
    Height = 17
    Caption = 'Include zero and negative value lines'
    TabOrder = 9
  end
  object qryGetCustomers: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  Customer.Customer,'
      '  Customer_Branch.Branch_no,'
      #9'Customer.Name AS Customer_Name,'
      #9'Customer_Branch.Name AS Branch_Name,'
      #9'(select Customer_Contact.Contact_No'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_To_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Contact_no' +
        ','
      #9'(select Customer_Contact.Name'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Contact_na' +
        'me,'
      #9'(select Customer_Contact.Email'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Email,'
      #9'(select Customer_Contact.ExportFilter'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as ExportFilt' +
        'er,'
      #9'(select ExportFilter.Description'
      #9' from ExportFilter, Customer_Contact'
      #9' where (Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) and'
      
        #9#9'(Customer_Contact.ExportFilter = ExportFilter.ExportFilter)) a' +
        's ExportFilter_Descr'
      'FROM (Customer '
      #9'INNER JOIN ((Int_Sel '
      #9'INNER JOIN Sales_Invoice '
      #9#9'ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice_No) '
      #9'INNER JOIN Customer_Branch '
      
        #9#9'ON (Sales_Invoice.Inv_to_Branch = Customer_Branch.Branch_no) A' +
        'ND (Sales_Invoice.Inv_to_Customer = Customer_Branch.Customer)) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9'INNER JOIN Customer_Branch AS CB '
      
        #9#9'ON (Sales_Invoice.Branch_no = CB.Branch_no) AND (Sales_Invoice' +
        '.Customer = CB.Customer)'
      'WHERE'
      '('
      '(Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '(invoice_or_credit is null)'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_Sel)'
      'ORDER BY'
      '  Customer.Name,'
      '  Customer_Branch.Name'
      '')
    Left = 232
    Top = 16
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
  end
  object GetInvCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  Sales_Invoice.Sales_Invoice,'
      '  Customer.Customer,'
      '  Customer_Branch.Branch_no,'
      #9'Customer.Name AS Customer_Name,'
      #9'Customer_Branch.Name AS Branch_Name,'
      #9'(select Customer_Contact.Contact_No'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_To_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Contact_no' +
        ','
      #9'(select Customer_Contact.Name'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Contact_na' +
        'me,'
      #9'(select Customer_Contact.Email'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Email,'
      #9'(select Customer_Contact.Salutation'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Salutation' +
        ','
      #9'(select Customer_Contact.ExportFilter'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as ExportFilt' +
        'er,'
      #9'(select ExportFilter.Description'
      #9' from ExportFilter, Customer_Contact'
      #9' where (Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) and'
      
        #9#9'(Customer_Contact.ExportFilter = ExportFilter.ExportFilter)) a' +
        's ExportFilter_Descr'
      'FROM (Customer '
      #9'INNER JOIN ((Int_Sel '
      #9'INNER JOIN Sales_Invoice '
      #9#9'ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice) '
      #9'INNER JOIN Customer_Branch '
      
        #9#9'ON (Sales_Invoice.Inv_to_Branch = Customer_Branch.Branch_no) A' +
        'ND (Sales_Invoice.Inv_to_Customer = Customer_Branch.Customer)) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9'INNER JOIN Customer_Branch AS CB '
      
        #9#9'ON (Sales_Invoice.Branch_no = CB.Branch_no) AND (Sales_Invoice' +
        '.Customer = CB.Customer)'
      'WHERE'
      '('
      '(Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '(invoice_or_credit is null)'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_Sel)'
      'ORDER BY'
      '  Sales_Invoice.Sales_Invoice asc,'
      '  Customer.Name,'
      '  Customer_Branch.Name'
      '')
    Left = 280
    Top = 16
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
  end
  object GetCreditCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  Sales_Invoice.Sales_Invoice,'
      '  Customer.Customer,'
      '  Customer_Branch.Branch_no,'
      #9'Customer.Name AS Customer_Name,'
      #9'Customer_Branch.Name AS Branch_Name,'
      #9'(select Customer_Contact.Contact_No'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_To_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Contact_no' +
        ','
      #9'(select Customer_Contact.Name'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Contact_na' +
        'me,'
      #9'(select Customer_Contact.Email'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Email,'
      #9'(select Customer_Contact.Salutation'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as Salutation' +
        ','
      #9'(select Customer_Contact.ExportFilter'
      #9' from Customer_Contact'
      #9' where Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      
        #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) as ExportFilt' +
        'er,'
      #9'(select ExportFilter.Description'
      #9' from ExportFilter, Customer_Contact'
      #9' where (Customer_Contact.Customer = CB.Inv_To_Customer and'
      #9#9'Customer_Contact.Branch_no = CB.Inv_to_Branch and'
      #9#9'Customer_Contact.Contact_no = CB.Inv_to_Contact) and'
      
        #9#9'(Customer_Contact.ExportFilter = ExportFilter.ExportFilter)) a' +
        's ExportFilter_Descr'
      'FROM (Customer '
      #9'INNER JOIN ((Int_Sel '
      #9'INNER JOIN Sales_Invoice '
      #9#9'ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice) '
      #9'INNER JOIN Customer_Branch '
      
        #9#9'ON (Sales_Invoice.Inv_to_Branch = Customer_Branch.Branch_no) A' +
        'ND (Sales_Invoice.Inv_to_Customer = Customer_Branch.Customer)) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9'INNER JOIN Customer_Branch AS CB '
      
        #9#9'ON (Sales_Invoice.Branch_no = CB.Branch_no) AND (Sales_Invoice' +
        '.Customer = CB.Customer)'
      'WHERE'
      '('
      '(Sales_Invoice.invoice_or_credit = '#39'C'#39')'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_Sel)'
      'ORDER BY'
      '  Sales_Invoice.Sales_Invoice asc,'
      '  Customer.Name,'
      '  Customer_Branch.Name'
      '')
    Left = 280
    Top = 64
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
  end
  object InvHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode'
      'from Sales_Invoice,'
      '        Customer,'
      '        Customer_Branch'
      'where'
      '('
      '(Sales_Invoice.Invoice_or_credit = '#39'I'#39') or'
      '(Sales_Invoice.Invoice_or_credit is null)'
      ') and'
      '(Sales_Invoice.Sales_invoice_Status = 10) AND'
      '(Sales_Invoice.Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Branch_no = Customer_Branch.Branch_no) AND'
      '(Sales_Invoice.Customer = Customer_Branch.Customer)'
      ')'
      'order by sales_invoice.sales_invoice')
    Left = 192
    Top = 21
  end
  object CreditHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode'
      'from Sales_Invoice,'
      '        Customer,'
      '        Customer_Branch'
      'where'
      '('
      '(Sales_Invoice.Invoice_or_credit = '#39'C'#39') '
      ') and'
      '(Sales_Invoice.Sales_invoice_Status = 10) AND'
      '(Sales_Invoice.Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Branch_no = Customer_Branch.Branch_no) AND'
      '(Sales_Invoice.Customer = Customer_Branch.Customer)'
      ')'
      'order by sales_invoice.sales_invoice ')
    Left = 128
    Top = 21
  end
  object qryInvEmail: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Name as Branch_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode,'
      '           (SELECT Price_Unit_Factor'
      '            FROM Price_Unit'
      
        '            WHERE Price_Unit.Price_Unit = Sales_invoice.Price_Un' +
        'it) as Price_Unit_Factor,'
      '           (SELECT Description'
      '            FROM Price_Unit'
      
        '            WHERE Price_Unit.Price_Unit = Sales_invoice.Price_Un' +
        'it) as Price_Unit_Description'
      'FROM Int_Sel INNER JOIN (Customer_Branch'
      '            INNER JOIN (Sales_Invoice'
      
        '            INNER JOIN Customer ON Sales_Invoice.Customer = Cust' +
        'omer.Customer)'
      
        '            ON (Customer_Branch.Branch_no = Sales_Invoice.Inv_To' +
        '_Branch)'
      
        '            AND (Customer_Branch.Customer = Sales_Invoice.Inv_To' +
        '_Customer))'
      '            ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice'
      'where'
      '('
      '(Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '(invoice_or_credit is null)'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_sel) and'
      '((Sales_Invoice.Inv_To_Customer = :Inv_To_Customer) and'
      '(Sales_Invoice.Inv_To_Branch = :Inv_To_Branch)) and'
      '(Sales_Invoice.Sales_invoice = :Sales_invoice)'
      'order by'
      '  Sales_Invoice.Sales_Invoice asc'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 152
    Top = 64
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
      end
      item
        Name = 'Inv_To_Customer'
      end
      item
        Name = 'Inv_To_Branch'
      end
      item
        Name = 'Sales_invoice'
      end>
  end
  object qryCreditEmail: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Name as Branch_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode,'
      '           (SELECT Price_Unit_Factor'
      '            FROM Price_Unit'
      
        '            WHERE Price_Unit.Price_Unit = Sales_invoice.Price_Un' +
        'it) as Price_Unit_Factor,'
      '           (SELECT Description'
      '            FROM Price_Unit'
      
        '            WHERE Price_Unit.Price_Unit = Sales_invoice.Price_Un' +
        'it) as Price_Unit_Description'
      'FROM Int_Sel INNER JOIN (Customer_Branch'
      '            INNER JOIN (Sales_Invoice'
      
        '            INNER JOIN Customer ON Sales_Invoice.Customer = Cust' +
        'omer.Customer)'
      
        '            ON (Customer_Branch.Branch_no = Sales_Invoice.Inv_To' +
        '_Branch)'
      
        '            AND (Customer_Branch.Customer = Sales_Invoice.Inv_To' +
        '_Customer))'
      '            ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice'
      'where'
      '('
      '(Sales_Invoice.invoice_or_credit = '#39'C'#39')'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_sel) and'
      '((Sales_Invoice.Inv_To_Customer = :Inv_To_Customer) and'
      '(Sales_Invoice.Inv_To_Branch = :Inv_To_Branch)) and'
      '(Sales_Invoice = :Sales_Invoice)'
      'order by'
      '  Sales_Invoice.Sales_Invoice asc'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 160
    Top = 16
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
      end
      item
        Name = 'Inv_To_Customer'
      end
      item
        Name = 'Inv_To_Branch'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object InvPrintSQL: TFDQuery
    ConnectionName = 'PB'
    Left = 56
    Top = 16
  end
  object qryCheckInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Sales_Invoice_No'
      'FROM Sales_Invoice'
      'WHERE Sales_Invoice = :Sales_Invoice')
    Left = 16
    Top = 32
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object InvLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.*,'
      '        Price_Unit.Price_Unit,'
      '        Price_Unit.Description AS Sales_Unit_Desc,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Vat_Code.VAT_Ref,'
      '        Sales_Invoice.Sales_Invoice_No,'
      '        Sales_Invoice.Invoice_Date,'
      '        Customer_Branch.Account_Code as End_User_Account_Code'
      'FROM Customer_Branch'
      '        RIGHT JOIN (Vat_Code'
      '        INNER JOIN (Price_Unit'
      '        INNER JOIN (Sales_Invoice'
      '        INNER JOIN Sales_Invoice_Line'
      
        '          ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sa' +
        'les_Invoice)'
      
        '          ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Un' +
        'it)'
      '          ON Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code)'
      
        '          ON (Customer_Branch.Branch_no = Sales_Invoice.End_User' +
        '_Branch_No) AND (Customer_Branch.Customer = Sales_Invoice.End_Us' +
        'er_Customer)'
      'WHERE Sales_Invoice.Sales_Invoice_No = :Sales_Invoice_no and'
      '('
      
        '(Sales_invoice_line.Not_printed <> '#39'Y'#39') or (Sales_invoice_line.N' +
        'ot_printed = null)'
      ')'
      'AND'
      '('
      
        '(Sales_Invoice_line.Goods_Value <> 0) or (:Show_Zero_Values = '#39'Y' +
        #39')'
      ')'
      'ORDER BY Invoice_line_no'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 272
    Top = 144
    ParamData = <
      item
        Name = 'Sales_Invoice_no'
      end
      item
        Name = 'Show_Zero_Values'
      end>
  end
end
