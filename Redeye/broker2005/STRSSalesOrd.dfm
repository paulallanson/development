object STRSSalesOrdfrm: TSTRSSalesOrdfrm
  Left = 230
  Top = 117
  BorderStyle = bsDialog
  Caption = 'Sales Order Print'
  ClientHeight = 162
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object OrderGroupBox: TGroupBox
    Left = 7
    Top = 16
    Width = 346
    Height = 73
    Caption = 'Details for Order: '
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 47
      Height = 13
      Caption = 'Customer:'
    end
    object Label2: TLabel
      Left = 19
      Top = 48
      Width = 55
      Height = 13
      Caption = 'Order Date:'
    end
    object OrderDatelbl: TLabel
      Left = 88
      Top = 48
      Width = 59
      Height = 13
      Caption = 'OrderDatelbl'
    end
    object CustomerLbl: TLabel
      Left = 88
      Top = 24
      Width = 58
      Height = 13
      Caption = 'CustomerLbl'
    end
  end
  object CancelBitBtn: TBitBtn
    Left = 6
    Top = 127
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Kind = bkCancel
  end
  object Previewbitbtn: TBitBtn
    Left = 94
    Top = 127
    Width = 75
    Height = 25
    Caption = 'Pre&view'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = PreviewbitbtnClick
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
    Left = 183
    Top = 127
    Width = 75
    Height = 25
    Caption = '&Print'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
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
  object ChkBxLogo: TCheckBox
    Left = 8
    Top = 96
    Width = 153
    Height = 17
    Caption = 'Print Company Logo'
    TabOrder = 4
  end
  object EmailBitBtn: TBitBtn
    Left = 273
    Top = 127
    Width = 75
    Height = 25
    Caption = '&Email'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
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
  object qryGetSOs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  Sel1,'
      '        text100,'
      '        Sales_Order.Sales_Order,'
      '        Sales_Order.Customer,'
      '        Sales_Order.Branch_no,'
      '        Sales_Order.Contact_no,'
      '        Customer.Name as Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Customer_Branch.Fax_number,'
      '        Customer_Contact.Email,'
      #9'      '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'      '#39'PDF'#39' as ExportFilter,'
      '        '#39' '#39' as CC_Email'
      'from'
      
        '  Int_Sel, Sales_Order, Customer, Customer_Branch, Customer_Cont' +
        'act'
      'where'
      '  (Int_Sel_Code = :Int_Sel_Code) and'
      '  (Sel1 <> 0) and'
      '  (Sel1 = Sales_order.Sales_Order) and'
      '  ('
      '  (Sales_Order.Customer = Customer_Branch.Customer) and'
      '  (Sales_Order.Branch_no = Customer_Branch.Branch_no)'
      '  ) and'
      '  ('
      '  (Sales_Order.Customer = Customer_Contact.Customer) and'
      '  (Sales_Order.Branch_no = Customer_Contact.Branch_no) and'
      '  (Sales_Order.Contact_no = Customer_Contact.Contact_no)'
      '  ) and'
      '  (Customer_Branch.Customer = Customer.Customer)'
      'order by'
      '  Sel1'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 174
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
end
