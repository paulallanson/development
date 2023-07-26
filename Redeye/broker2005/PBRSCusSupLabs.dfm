object PBRSCusSupLabsfrm: TPBRSCusSupLabsfrm
  Left = 290
  Top = 130
  BorderStyle = bsDialog
  Caption = 'Print Cust/Supp Labels'
  ClientHeight = 187
  ClientWidth = 411
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 17
    Top = 116
    Width = 66
    Height = 13
    Caption = 'No. Of Copies'
  end
  object SuppCustNameLabel: TLabel
    Left = 17
    Top = 12
    Width = 51
    Height = 13
    Caption = 'Supp/Cust'
  end
  object BranchLabel: TLabel
    Left = 17
    Top = 44
    Width = 34
    Height = 13
    Caption = 'Branch'
  end
  object ContactLabel: TLabel
    Left = 17
    Top = 76
    Width = 37
    Height = 13
    Caption = 'Contact'
  end
  object CancelBitBtn: TBitBtn
    Left = 80
    Top = 149
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Kind = bkCancel
  end
  object PreviewBitBtn: TBitBtn
    Left = 168
    Top = 149
    Width = 75
    Height = 25
    Caption = 'Pre&view'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
    Left = 256
    Top = 149
    Width = 75
    Height = 25
    Caption = '&Print'
    Default = True
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
  object NoofBoxesSpinEdit: TSpinEdit
    Left = 99
    Top = 111
    Width = 49
    Height = 22
    MaxValue = 999
    MinValue = 1
    TabOrder = 3
    Value = 1
  end
  object SuppCustNameEdit: TEdit
    Left = 96
    Top = 8
    Width = 273
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Text = 'SuppCustNameEdit'
  end
  object BranchDBLookupComboBox: TDBLookupComboBox
    Left = 96
    Top = 40
    Width = 273
    Height = 21
    KeyField = 'Branch_No'
    ListField = 'Name'
    ListSource = BranchesDS
    TabOrder = 5
    OnClick = BranchDBLookupComboBoxClick
  end
  object ContactDBLookupComboBox: TDBLookupComboBox
    Left = 96
    Top = 72
    Width = 273
    Height = 21
    KeyField = 'Contact_No'
    ListField = 'Name'
    ListSource = ContactsDS
    TabOrder = 6
  end
  object ContactBitBtn: TBitBtn
    Left = 376
    Top = 70
    Width = 25
    Height = 25
    Hint = 'Clear contact details'
    TabOrder = 7
    OnClick = ContactBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
  end
  object CountSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Int_Sel.*,'
      'Delivery_Detail.*,'
      'Purchase_OrderLine.Cust_Order_no,'
      'Purchase_OrderLine.Customers_Desc,'
      'Purchase_OrderLine.Quantity,'
      'Purchase_OrderLine.Form_Reference,'
      'Form_Reference.Form_Reference_id'
      'FROM Int_Sel INNER JOIN'
      '((Purchase_OrderLine LEFT JOIN Form_Reference '
      
        'ON Purchase_OrderLine.Form_Reference = Form_Reference.Form_Refer' +
        'ence)'
      'INNER JOIN Delivery_Detail'
      'ON (Purchase_OrderLine.Line = Delivery_Detail.Line) '
      
        'AND (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchas' +
        'e_Order))'
      'ON (Int_Sel.Sel4 = Delivery_Detail.Delivery_no)'
      'AND (Int_Sel.Sel3 = Delivery_Detail.Line)'
      'AND (Int_Sel.Sel2 = Delivery_Detail.Purchase_Order)'
      'WHERE'#9'Int_Sel.Int_Sel_Code = :Int_sel_code'
      'ORDER BY Int_Sel.sel1 ASC')
    Left = 304
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_sel_code'
        ParamType = ptInput
      end>
  end
  object GetSuppBranchesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Branch_No, Name'
      'From Supplier_Branch'
      'Where (Supplier = :SelCode)'
      'Order By Name')
    Left = 184
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SelCode'
        ParamType = ptUnknown
      end>
  end
  object GetCustBranchesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Branch_No, Name'
      'From Customer_Branch'
      'Where (Customer = :SelCode)'
      'Order By Name')
    Left = 256
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SelCode'
        ParamType = ptUnknown
      end>
  end
  object BranchesDS: TDataSource
    Left = 256
    Top = 40
  end
  object GetSuppContactsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Branch_No, Contact_no, Name'
      'From Supplier_BranchContacts'
      'Where (Supplier = :SelCode) and'
      '      (Branch_No = :Branch)'
      'Order By Name'
      ' ')
    Left = 176
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SelCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch'
        ParamType = ptUnknown
      end>
  end
  object GetCustContactsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Branch_No, Contact_No, Name'
      'From Customer_Contact'
      'Where (Customer = :SelCode) and'
      '      (Branch_No = :Branch)'
      'Order By Name'
      '')
    Left = 224
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SelCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch'
        ParamType = ptUnknown
      end>
  end
  object ContactsDS: TDataSource
    Left = 288
    Top = 40
  end
end
