object PBRSPOrdFrm: TPBRSPOrdFrm
  Left = 210
  Top = 138
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Purchase Order Print'
  ClientHeight = 345
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  TextHeight = 13
  object MyOrAllRadioGroup: TRadioGroup
    Left = 232
    Top = 8
    Width = 185
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Print My Purchase Orders'
      'Print All Purchase Orders')
    ParentFont = False
    TabOrder = 0
  end
  object AllOrOneRadioGroup: TRadioGroup
    Left = 3
    Top = 8
    Width = 222
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      'All Unprinted'
      'One Purchase Order')
    ParentFont = False
    TabOrder = 1
    OnClick = AllOrOneRadioGroupClick
  end
  object gbLayouts: TGroupBox
    Left = 2
    Top = 73
    Width = 223
    Height = 67
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 15
      Width = 63
      Height = 13
      Caption = 'Paper Layout'
    end
    object Label4: TLabel
      Left = 8
      Top = 42
      Width = 62
      Height = 13
      Caption = 'Letter Layout'
    end
    object cmbPageLayout: TComboBox
      Left = 88
      Top = 11
      Width = 129
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object cmbLetterLayout: TComboBox
      Left = 88
      Top = 38
      Width = 129
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 144
    Width = 420
    Height = 201
    Align = alBottom
    TabOrder = 3
    object CancelBitBtn: TBitBtn
      Left = 8
      Top = 164
      Width = 75
      Height = 25
      Caption = '&Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
    object PreviewBitBtn: TBitBtn
      Left = 92
      Top = 164
      Width = 75
      Height = 25
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
      TabOrder = 1
      OnClick = PreviewBitBtnClick
    end
    object PrintBitBtn: TBitBtn
      Left = 175
      Top = 164
      Width = 75
      Height = 25
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
      TabOrder = 2
      OnClick = PrintBitBtnClick
    end
    object FaxBitBtn: TBitBtn
      Left = 259
      Top = 164
      Width = 75
      Height = 25
      Caption = '&Fax'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 3
      OnClick = FaxBitBtnClick
    end
    object EmailBitBtn: TBitBtn
      Left = 342
      Top = 164
      Width = 75
      Height = 25
      Caption = '&Email'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 4
      OnClick = EmailBitBtnClick
    end
    object cbPrintLogo: TCheckBox
      Left = 16
      Top = 10
      Width = 169
      Height = 17
      Caption = 'Print Company Logo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnClick = cbPrintLogoClick
    end
    object SelectionGroup: TGroupBox
      Left = 8
      Top = 32
      Width = 393
      Height = 121
      Caption = 'Purchase Order Number Selection'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object Label1: TLabel
        Left = 8
        Top = 71
        Width = 232
        Height = 39
        Caption = 
          'Enter Order numbers and/or Order ranges separated by commas. For' +
          ' example, 1234, 1236, 1240-1245'
        WordWrap = True
      end
      object EnqLUSpeedButton: TSpeedButton
        Left = 312
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
        Visible = False
        OnClick = EnqLUSpeedButtonClick
      end
      object SelectionMemo: TMemo
        Left = 8
        Top = 19
        Width = 273
        Height = 53
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = CanPrint
      end
      object SelectLst: TListBox
        Left = 272
        Top = 8
        Width = 25
        Height = 105
        ItemHeight = 13
        Sorted = True
        TabOrder = 1
        Visible = False
      end
    end
  end
  object TypeRadioGroup: TRadioGroup
    Left = 232
    Top = 74
    Width = 185
    Height = 66
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Purchase Order'
      'Acknowledgement')
    ParentFont = False
    TabOrder = 4
    OnClick = TypeRadioGroupClick
  end
  object GetPOsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Purchase_OrderLine.Purchase_Order,'
      '  Supplier.Name AS Supp_Name,'
      '  Supplier_Branch.Name AS Branch_Name,'
      '  Supplier_Branch.Supplier,'
      '  Supplier_Branch.Branch_no,'
      '  Supplier_Branch.Fax_Number,'
      '  Supplier_BranchContacts.Email,'
      '  Supplier_BranchContacts.Salutation,'
      '  Supplier_BranchContacts.Fax_Number AS Contact_Fax,'
      '  Supplier_BranchContacts.ExportFilter,'
      '  Supplier_BranchContacts.Name AS Contact_Name,'
      '  Supplier_BranchContacts.Contact_no,'
      '  Exportfilter.Description AS Exportfilter_Descr'
      
        'FROM (Supplier INNER JOIN Supplier_Branch ON Supplier.Supplier =' +
        ' Supplier_Branch.Supplier)'
      '   INNER JOIN ((Exportfilter'
      '   RIGHT JOIN(Int_Sel INNER JOIN (Supplier_BranchContacts'
      
        '   INNER JOIN Purchase_Order ON (Supplier_BranchContacts.Supplie' +
        'r = Purchase_Order.Supplier)'
      
        '    AND (Supplier_BranchContacts.Branch_no = Purchase_Order.Bran' +
        'ch_No) AND'
      
        '    (Supplier_BranchContacts.Contact_no = Purchase_Order.Contact' +
        '_No)) ON'
      '    Int_Sel.Sel1 = Purchase_Order.Purchase_Order) ON'
      
        '    Exportfilter.ExportFilter = Supplier_BranchContacts.ExportFi' +
        'lter)'
      '    INNER JOIN Purchase_OrderLine ON'
      
        '    Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_' +
        'Order) ON'
      
        '    (Supplier_Branch.Branch_no = Supplier_BranchContacts.Branch_' +
        'no) AND'
      
        '    (Supplier_Branch.Supplier = Supplier_BranchContacts.Supplier' +
        ')'
      'WHERE ((Int_Sel.Int_Sel_Code) = :iintselcode) OR'
      '    (((Purchase_Order.Operator) = :Operator) AND'
      
        '    ((:Purchase_Order)= 0) AND ((Purchase_OrderLine.Purch_Ord_Li' +
        'ne_Status)< 15)) OR'
      '    (((:Purchase_Order)= 0) AND'
      
        '    ((Purchase_OrderLine.Purch_Ord_Line_Status)<15) AND ((:Opera' +
        'tor)= 0))'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 256
    Top = 10
    ParamData = <
      item
        Name = 'iintselcode'
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end>
  end
  object GetAcksSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Purchase_OrderLine.Purchase_Order,'
      '  Customer.Name AS Cust_Name,'
      '  Customer_Branch.Name AS Branch_Name,'
      '  Customer_Branch.Customer,'
      '  Customer_Branch.Branch_no,'
      '  Customer_Branch.Fax_Number,'
      '  Customer_Contact.Email,'
      '  Customer_Contact.Fax_Number AS Contact_Fax,'
      '  Customer_Contact.Salutation,'
      '  Customer_Contact.ExportFilter,'
      '  Customer_Contact.Name AS Contact_Name,'
      '  Exportfilter.Description AS Exportfilter_Descr,'
      '  Customer_Contact.Contact_no'
      'FROM Int_Sel INNER JOIN ((Customer INNER JOIN Customer_Branch ON'
      '  Customer.Customer = Customer_Branch.Customer) INNER JOIN'
      '  (Purchase_Order INNER JOIN (Exportfilter RIGHT JOIN'
      '  (Customer_Contact INNER JOIN Purchase_OrderLine ON'
      '  (Customer_Contact.Customer = Purchase_OrderLine.Customer) AND'
      
        '  (Customer_Contact.Branch_no = Purchase_OrderLine.Branch_no) AN' +
        'D'
      
        '  (Customer_Contact.Contact_no = Purchase_OrderLine.Contact_no))' +
        ' ON'
      '  Exportfilter.ExportFilter = Customer_Contact.ExportFilter) ON'
      
        '   Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_O' +
        'rder) ON'
      '   (Customer_Branch.Branch_no = Customer_Contact.Branch_no) AND'
      '   (Customer_Branch.Customer = Customer_Contact.Customer)) ON'
      '   Int_Sel.Sel1 = Purchase_Order.Purchase_Order'
      'WHERE (((Int_Sel.Int_Sel_Code)=:iintselcode)) OR'
      
        '(((Purchase_Order.Operator)=:Operator) AND ((:Purchase_Order)= 0' +
        ')) OR'
      
        '(((:Operator)=0)) OR (((:Purchase_Order)=0) AND ((:Operator) = 0' +
        '))'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 168
    Top = 8
    ParamData = <
      item
        Name = 'iintselcode'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Operator'
      end>
  end
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' '
      ' ')
    Left = 152
    Top = 76
  end
  object DelWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 160
    Top = 132
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object AddWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Values'
      '(:Int_Sel_Code, 0.00, 0.00, 0.00, 0.00,:Text100)'
      ''
      ' '
      ' ')
    Left = 240
    Top = 76
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
      end>
  end
  object AddIntSelQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, text100)'
      'Values'
      '(:Int_Sel_Code, :Sel1, 0.00, 0.00, 0.00,:text100)'
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
      ' ')
    Left = 296
    Top = 112
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Sel1'
        DataType = ftFloat
      end
      item
        Name = 'text100'
        DataType = ftString
      end>
  end
  object GetPORngSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct Purchase_Order.Purchase_Order'
      'FROM Purchase_order, Purchase_Orderline'
      'WHERE'
      '  (Purchase_Order.Purchase_Order >= :From_PONum) and'
      '  (Purchase_Order.Purchase_Order <= :To_PONum) and'
      
        '  (Purchase_Order.Purchase_order = Purchase_OrderLine.Purchase_o' +
        'rder) and'
      '  ((Purchase_Order.Operator = :Operator ) or (:Operator = 0))'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 376
    Top = 40
    ParamData = <
      item
        Name = 'From_PONum'
      end
      item
        Name = 'To_PONum'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Operator'
      end>
  end
end
