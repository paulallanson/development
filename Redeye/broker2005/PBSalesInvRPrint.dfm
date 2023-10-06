object PBSalesInvRPrintFrm: TPBSalesInvRPrintFrm
  Left = 687
  Top = 241
  ActiveControl = PrintBtn
  BorderStyle = bsDialog
  Caption = 'Invoice Re-Print Selection'
  ClientHeight = 313
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    484
    313)
  TextHeight = 13
  object selectionGrp: TGroupBox
    Left = 8
    Top = 8
    Width = 457
    Height = 137
    Caption = 'Invoice Number Selection'
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 80
      Width = 265
      Height = 26
      Caption = 
        'Enter invoice numbers and/or invoice ranges separated by commas.' +
        ' For example, 1234, 1236, 1240-1245'
      WordWrap = True
    end
    object SelectionMemo: TMemo
      Left = 8
      Top = 20
      Width = 400
      Height = 53
      TabOrder = 0
      OnChange = SelectionMemoChange
      OnKeyPress = SelectionMemoKeyPress
    end
  end
  object PrintBtn: TBitBtn
    Left = 120
    Top = 256
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
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
    TabOrder = 0
    OnClick = PrintBtnClick
  end
  object PreviewBtn: TBitBtn
    Left = 210
    Top = 256
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
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
    TabOrder = 1
    OnClick = PreviewBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 16
    Top = 256
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 2
  end
  object SelectLst: TListBox
    Left = 336
    Top = 16
    Width = 25
    Height = 113
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
    Visible = False
  end
  object EmailBitBtn: TBitBtn
    Left = 301
    Top = 256
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
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
  object chkbxPrintLogo: TCheckBox
    Left = 16
    Top = 155
    Width = 129
    Height = 17
    Caption = 'Print Company Logo'
    TabOrder = 6
  end
  object chkbxShowZeroValues: TCheckBox
    Left = 16
    Top = 184
    Width = 233
    Height = 17
    Caption = 'Include zero and negative value lines'
    TabOrder = 7
  end
  object chkbxAttachCSVFile: TCheckBox
    Left = 16
    Top = 210
    Width = 233
    Height = 17
    Caption = 'Attach CSV copy to Email'
    TabOrder = 8
  end
  object OleContainer1: TOleContainer
    Left = 337
    Top = 96
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 9
    Visible = False
  end
  object btbtnExcel: TBitBtn
    Left = 387
    Top = 256
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Excel'
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A407070700FF
      FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFFA407070700FF
      FFFFFFFFFFFF07FFFFFF00000000000707070707070707070707A407070700FF
      FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA407000700FF
      FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA400000700FF
      FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFF000000000000
      00000000000000000000A4070707000707070707070700070707A40707070007
      07000700070700070707A4070707000707000000070700070707A40707070007
      07000700070700070707A4A4A4A400A4A4A400A4A4A400A4A4A4}
    TabOrder = 10
    OnClick = BitBtn1Click
  end
  object AddIntSelQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, text100)'
      'Values'
      '(:Int_Sel_Code, :Sel1, 0.0,0.0,0.0,:text100)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 328
    Top = 56
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Sel1'
      end
      item
        Name = 'text100'
      end>
  end
  object AddWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Values'
      '(:Int_Sel_Code, 0.0,0.0,0.0,0.0,:Text100)'
      ''
      ' ')
    Left = 272
    Top = 20
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
      end>
  end
  object DelWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 104
    Top = 52
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' ')
    Left = 184
    Top = 20
  end
  object InvRPrintSQL: TFDQuery
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
      
        '            ON (Customer_Branch.Branch_no = Sales_Invoice.Branch' +
        '_no)'
      
        '            AND (Customer_Branch.Customer = Sales_Invoice.Custom' +
        'er))'
      '            ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice_No'
      'where'
      '('
      '(Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '(invoice_or_credit is null)'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_sel)'
      'order by'
      '  Sales_Invoice.Sales_Invoice_No asc'
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
    Left = 32
    Top = 32
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
      end>
  end
  object GetInvCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  Sales_Invoice.Sales_Invoice_No,'
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
      '  Sales_Invoice.Sales_Invoice_no desc,'
      '  Customer.Name,'
      '  Customer_Branch.Name'
      '')
    Left = 272
    Top = 104
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
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
      '            ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice_No'
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
      '(Sales_Invoice.Sales_invoice_no = :Sales_invoice_no)'
      'order by'
      '  Sales_Invoice.Sales_Invoice_No asc'
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
    Left = 112
    Top = 96
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
        Name = 'Sales_invoice_no'
      end>
  end
  object qryInvPrint: TFDQuery
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
      
        '            ON (Customer_Branch.Branch_no = Sales_Invoice.Branch' +
        '_no)'
      
        '            AND (Customer_Branch.Customer = Sales_Invoice.Custom' +
        'er))'
      '            ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice_No'
      'where'
      '('
      '(Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '(invoice_or_credit is null)'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_sel)'
      'order by'
      '  Sales_Invoice.Sales_Invoice_No asc'
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
    Left = 32
    Top = 88
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
      end>
  end
  object qryCreditPrint: TFDQuery
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
      
        '            ON (Customer_Branch.Branch_no = Sales_Invoice.Branch' +
        '_no)'
      
        '            AND (Customer_Branch.Customer = Sales_Invoice.Custom' +
        'er))'
      '            ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice_No'
      'where'
      '('
      '(Sales_Invoice.Invoice_or_credit = '#39'C'#39') '
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_sel)'
      'order by'
      '  Sales_Invoice.Sales_Invoice_No asc'
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
    Left = 72
    Top = 104
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
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
      '            ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice_No'
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
      '(Sales_Invoice_no = :Sales_Invoice_no)'
      'order by'
      '  Sales_Invoice.Sales_Invoice_No asc'
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
    Left = 144
    Top = 128
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
        Name = 'Sales_Invoice_no'
      end>
  end
  object GetCreditCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  Sales_Invoice.Sales_Invoice_No,'
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
      '(Sales_Invoice.invoice_or_credit = '#39'C'#39')'
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
    Left = 272
    Top = 152
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
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
    Left = 192
    Top = 104
    ParamData = <
      item
        Name = 'Int_Sel'
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
    Top = 200
    ParamData = <
      item
        Name = 'Sales_Invoice_no'
      end
      item
        Name = 'Show_Zero_Values'
      end>
  end
  object InvLineCSVSQL: TFDQuery
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
      '        Sales_Invoice.Cust_Order_No,'
      '        Sales_Invoice.Invoice_Description,'
      '        Sales_Invoice.Reference as Job_Reference,'
      '        Customer_Branch.Account_Code,'
      '        Customer.Name as Customer_Name,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Alt_Purchase_Order,'
      '        Purchase_OrderLine.Order_Price'
      'FROM Purchase_OrderLine'
      '        RIGHT JOIN (Customer'
      '        RIGHT JOIN ((Vat_Code'
      '        INNER JOIN (Price_Unit'
      '        INNER JOIN (Sales_Invoice'
      '        INNER JOIN Sales_Invoice_Line'
      
        '            ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.' +
        'Sales_Invoice)'
      
        '            ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_' +
        'Unit)'
      '            ON Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code)'
      '        LEFT JOIN Customer_Branch'
      
        '            ON (Sales_Invoice.Inv_to_Branch = Customer_Branch.Br' +
        'anch_no) AND (Sales_Invoice.Inv_to_Customer = Customer_Branch.Cu' +
        'stomer))'
      '            ON Customer.Customer = Sales_Invoice.Customer)'
      
        '            ON (Purchase_OrderLine.Line = Sales_Invoice_Line.Lin' +
        'e) AND (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.P' +
        'urchase_Order)'
      'WHERE Sales_Invoice.Sales_Invoice_No = :Sales_Invoice_no AND'
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
    Top = 248
    ParamData = <
      item
        Name = 'Sales_Invoice_no'
      end
      item
        Name = 'Show_Zero_Values'
      end>
  end
  object qryPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_Order.Purchase_Order,'
      '        Purchase_Order.Date_Point,'
      '        Supplier.Name as Supplier_Name'
      'FROM Supplier'
      '        INNER JOIN Purchase_Order'
      '            ON Supplier.Supplier = Purchase_Order.Supplier'
      'WHERE Purchase_Order = :Purchase_Order')
    Left = 16
    Top = 248
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryJBLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag,'
      '        Job_Bag_Line_Dets.Job_Bag_Line,'
      '        Supplier.Name AS Supplier_Name,'
      '        Job_Bag_Line_Dets.price_unit,'
      '        Job_Bag_Line_Dets.Unit_Cost,'
      '        Price_Unit.Description AS Cost_unit_Description,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Product_Type.Description AS Product_Type_Description'
      'FROM Product_Type'
      '        RIGHT JOIN (Price_Unit'
      '        RIGHT JOIN ((Supplier'
      '        INNER JOIN Supplier_Branch'
      '          ON Supplier.Supplier = Supplier_Branch.Supplier)'
      '        INNER JOIN Job_Bag_Line_Dets'
      
        '          ON (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Bran' +
        'ch_No) AND (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplie' +
        'r))'
      
        '          ON Price_Unit.Price_Unit = Job_Bag_Line_Dets.price_uni' +
        't)'
      
        '          ON Product_Type.Product_Type = Job_Bag_Line_Dets.Produ' +
        'ct_Type'
      'WHERE Job_Bag = :Job_Bag AND'
      '      JoB_Bag_Line = :Job_Bag_Line')
    Left = 136
    Top = 248
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Price_Unit.Description AS Cost_Unit_Description,'
      '        Product_Type.Description AS Product_Type_Description'
      'FROM Product_Type'
      '        INNER JOIN (Price_Unit'
      '        INNER JOIN Purchase_OrderLine'
      
        '          ON Price_Unit.Price_Unit = Purchase_OrderLine.Order_Un' +
        'it)'
      
        '          ON Product_Type.Product_Type = Purchase_OrderLine.Prod' +
        'uct_Type'
      'WHERE Purchase_Order = :Purchase_Order AND'
      '      Line = :Line')
    Left = 72
    Top = 248
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object InvCSVSQL: TFDQuery
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
      '        Sales_Invoice.Cust_Order_No,'
      '        Sales_Invoice.Invoice_Description,'
      '        Sales_Invoice.Reference as Job_Reference,'
      '        Customer_Branch.Account_Code,'
      '        Customer.Name as Customer_Name,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Alt_Purchase_Order,'
      '        Purchase_OrderLine.Order_Price'
      'FROM Int_Sel'
      '        INNER JOIN (Vat_Code'
      '        INNER JOIN (Purchase_OrderLine'
      '        RIGHT JOIN (Price_Unit'
      '        INNER JOIN ((Customer'
      '        RIGHT JOIN (Sales_Invoice'
      '        LEFT JOIN Customer_Branch'
      
        '            ON (Sales_Invoice.Inv_to_Customer = Customer_Branch.' +
        'Customer) AND (Sales_Invoice.Inv_to_Branch = Customer_Branch.Bra' +
        'nch_no))'
      '            ON Customer.Customer = Sales_Invoice.Customer)'
      '        INNER JOIN Sales_Invoice_Line'
      
        '            ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.' +
        'Sales_Invoice)'
      
        '            ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_' +
        'Unit)'
      
        '            ON (Purchase_OrderLine.Line = Sales_Invoice_Line.Lin' +
        'e) AND (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.P' +
        'urchase_Order))'
      '            ON Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code)'
      '            ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice_No'
      'WHERE'
      '('
      
        '(Sales_invoice_line.Not_printed <> '#39'Y'#39') or (Sales_invoice_line.N' +
        'ot_printed = null)'
      ')'
      'AND'
      '('
      
        '(Sales_Invoice_line.Goods_Value <> 0) or (:Show_Zero_Values = '#39'Y' +
        #39')'
      ') AND'
      '(Int_sel.Int_sel_Code = :Int_Sel)'
      
        'ORDER BY Sales_Invoice.Sales_Invoice, Sales_Invoice_Line.Invoice' +
        '_line_no'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 408
    Top = 160
    ParamData = <
      item
        Name = 'Show_Zero_Values'
      end
      item
        Name = 'Int_Sel'
      end>
  end
end
