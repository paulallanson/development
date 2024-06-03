object PBRSPOrdNFrm: TPBRSPOrdNFrm
  Left = 398
  Top = 120
  BorderIcons = [biSystemMenu]
  Caption = 'Purchase Order Print'
  ClientHeight = 331
  ClientWidth = 472
  Color = clBtnFace
  Constraints.MaxHeight = 510
  Constraints.MaxWidth = 620
  Constraints.MinHeight = 364
  Constraints.MinWidth = 432
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 312
    Width = 472
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 312
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 472
      Height = 81
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      object gbLayouts: TGroupBox
        Left = 1
        Top = 6
        Width = 256
        Height = 67
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 15
          Width = 66
          Height = 13
          Caption = 'Paper Layout'
        end
        object Label4: TLabel
          Left = 8
          Top = 42
          Width = 66
          Height = 13
          Caption = 'Letter Layout'
        end
        object cmbPageLayout: TComboBox
          Left = 88
          Top = 11
          Width = 161
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = cmbPageLayoutChange
        end
        object cmbLetterLayout: TComboBox
          Left = 88
          Top = 38
          Width = 161
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          OnChange = cmbLetterLayoutChange
        end
      end
    end
    object pnlButtons: TPanel
      Left = 0
      Top = 81
      Width = 472
      Height = 96
      Align = alClient
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        472
        96)
      object cbPrintLogo: TCheckBox
        Left = 16
        Top = 10
        Width = 169
        Height = 17
        Caption = 'Print Company Logo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = cbPrintLogoClick
      end
      object SelOneGrpBox: TGroupBox
        Left = 10
        Top = 2
        Width = 209
        Height = 41
        ParentBackground = False
        TabOrder = 1
        object EstNumLabel: TLabel
          Left = 8
          Top = 15
          Width = 65
          Height = 13
          Caption = 'P.O. Number'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object EnquiryMemo: TMemo
          Left = 88
          Top = 10
          Width = 105
          Height = 25
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          WantReturns = False
          WordWrap = False
          OnKeyPress = EnquiryMemoKeyPress
          OnKeyUp = EnquiryMemoKeyUp
        end
      end
      object TypeRadioGroup: TRadioGroup
        Left = 256
        Top = 2
        Width = 203
        Height = 65
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Purchase Order'
          'Acknowledgement')
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = TypeRadioGroupClick
      end
      object chkbxAttachDelNote: TCheckBox
        Left = 10
        Top = 52
        Width = 213
        Height = 17
        Caption = 'Attach Delivery Note to E-Mail'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = chkbxAttachDelNoteClick
      end
      object chkbxAttachLabels: TCheckBox
        Left = 10
        Top = 76
        Width = 213
        Height = 17
        Caption = 'Attach Labels to E-Mail'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = chkbxAttachLabelsClick
      end
    end
    object pnlLabels: TPanel
      Left = 0
      Top = 177
      Width = 472
      Height = 94
      Align = alBottom
      ParentBackground = False
      TabOrder = 2
      object Label12: TLabel
        Left = 192
        Top = 12
        Width = 56
        Height = 13
        Caption = 'Label Logo'
      end
      object grpbxLabels: TGroupBox
        Left = 8
        Top = 4
        Width = 177
        Height = 82
        Caption = 'Label Address'
        ParentBackground = False
        TabOrder = 0
        object chkAddressOnly: TCheckBox
          Left = 8
          Top = 60
          Width = 153
          Height = 17
          Caption = 'Print Address Only'
          TabOrder = 0
        end
        object rdbtnCustAddr: TRadioButton
          Left = 8
          Top = 20
          Width = 153
          Height = 17
          Caption = 'Use Customer Details'
          TabOrder = 1
        end
        object rdbtnDelAddr: TRadioButton
          Left = 8
          Top = 40
          Width = 145
          Height = 17
          Caption = 'Use Delivery Details'
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
      object dblkpLogos: TDBLookupComboBox
        Left = 256
        Top = 8
        Width = 185
        Height = 21
        KeyField = 'ID'
        ListField = 'Logo_Name'
        ListSource = dtsLogos
        TabOrder = 1
      end
      object FormRefClrBitBtn: TBitBtn
        Left = 450
        Top = 6
        Width = 23
        Height = 23
        Hint = 'Clear'
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = FormRefClrBitBtnClick
      end
    end
    object pnlBottom: TPanel
      Left = 0
      Top = 271
      Width = 472
      Height = 41
      Align = alBottom
      ParentBackground = False
      TabOrder = 3
      object CancelBitBtn: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Cancel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = bkCancel
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
      end
      object PreviewBitBtn: TBitBtn
        Left = 196
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Pre&view'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
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
        Left = 287
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Print'
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
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
      object EmailBitBtn: TBitBtn
        Left = 374
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Email'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
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
        TabOrder = 3
        OnClick = EmailBitBtnClick
      end
    end
  end
  object GetPOsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Purchase_OrderLine.Purchase_Order,'
      '                Supplier.Name as Supp_Name,'
      '                Supplier_Branch.Name as Branch_Name,'
      '                Supplier_Branch.Supplier,'
      '                Supplier_Branch.Branch_no,'
      '                Supplier_Branch.Fax_Number,'
      '                Supplier_BranchContacts.Email,'
      '                Supplier_BranchContacts.Salutation,'
      
        '                Supplier_BranchContacts.Fax_Number as Contact_Fa' +
        'x,'
      '                Supplier_BranchContacts.Exportfilter,'
      '                Supplier_BranchContacts.Name as Contact_Name,'
      '                Supplier_BranchContacts.Contact_no,'
      '                Exportfilter.Description as Exportfilter_Descr,'
      '                Purchase_Orderline.Suppliers_desc'
      'FROM (Exportfilter RIGHT JOIN (Supplier'
      '      INNER JOIN (Supplier_Branch'
      '      INNER JOIN Supplier_BranchContacts ON'
      
        '        (Supplier_Branch.Branch_no = Supplier_BranchContacts.Bra' +
        'nch_no) AND'
      
        '        (Supplier_Branch.Supplier = Supplier_BranchContacts.Supp' +
        'lier)) ON'
      '        Supplier.Supplier = Supplier_Branch.Supplier) ON'
      
        '        Exportfilter.Exportfilter = Supplier_BranchContacts.Expo' +
        'rtfilter)'
      '      INNER JOIN (Purchase_Order'
      '      INNER JOIN Purchase_OrderLine ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order) ON'
      
        '        (Supplier_BranchContacts.Contact_no = Purchase_Order.Con' +
        'tact_No) AND'
      
        '        (Supplier_BranchContacts.Branch_no = Purchase_Order.Bran' +
        'ch_No) AND'
      
        '        (Supplier_BranchContacts.Supplier = Purchase_Order.Suppl' +
        'ier)'
      'WHERE'
      '      ((Purchase_Order.Purchase_Order = :Purchase_Order ) or'
      
        '          ((:Purchase_Order = 0) and (Purchase_OrderLine.Purch_O' +
        'rd_Line_Status < 15))) and'
      
        '      ((Purchase_Order.Operator = :Operator ) or (:Operator = 0)' +
        ')'
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
      ' ')
    Left = 144
    Top = 22
    ParamData = <
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
      '    Customer.Name as Cust_Name,'
      '    Customer_Branch.Name as Branch_Name,'
      '    Customer_Branch.Customer,'
      '    Customer_Branch.Branch_no,'
      '    Customer_Branch.Fax_Number,'
      '    Customer_Contact.Email,'
      '    Customer_Contact.Fax_Number as Contact_Fax,'
      '    Customer_Contact.Salutation,'
      '    Customer_Contact.Exportfilter,'
      '    Customer_Contact.Name as Contact_Name,'
      '    Exportfilter.Description as Exportfilter_Descr,'
      '    Customer_Contact.Contact_no,'
      '    Purchase_Orderline.customers_desc'
      'FROM (Exportfilter'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN (Customer_Branch'
      '        INNER JOIN Customer_Contact ON'
      
        '          (Customer_Branch.Branch_no = Customer_Contact.Branch_n' +
        'o) AND'
      
        '          (Customer_Branch.Customer = Customer_Contact.Customer)' +
        ') ON'
      '          Customer.Customer = Customer_Branch.Customer) ON'
      
        '          Exportfilter.Exportfilter = Customer_Contact.Exportfil' +
        'ter)'
      '        INNER JOIN (Purchase_Order'
      '        INNER JOIN Purchase_OrderLine ON'
      
        '          Purchase_Order.Purchase_Order = Purchase_OrderLine.Pur' +
        'chase_Order) ON'
      
        '          (Customer_Contact.Contact_no = Purchase_OrderLine.Cont' +
        'act_no) AND'
      
        '          (Customer_Contact.Branch_no = Purchase_OrderLine.Branc' +
        'h_no) AND'
      
        '          (Customer_Contact.Customer = Purchase_OrderLine.Custom' +
        'er)'
      'WHERE'
      
        '      ((Purchase_Order.Purchase_Order = :Purchase_Order ) or (:P' +
        'urchase_Order = 0)) and'
      
        '      ((Purchase_Order.Operator = :Operator ) or (:Operator = 0)' +
        ')'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 72
    Top = 16
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Operator'
      end>
  end
  object qryGetPODelivs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select delivery_no '
      'from delivery_detail '
      'where purchase_order = :PONum '
      'and Line = :line;')
    Left = 228
    Top = 20
    ParamData = <
      item
        Name = 'PONum'
      end
      item
        Name = 'line'
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Purchase_Order, Office_Contact'
      'FROM Purchase_Order'
      'WHERE Purchase_Order = :Purchase_Order')
    Left = 280
    Top = 16
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryLogos: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Document_Logo'
      'WHERE Document_Type = '#39'L'#39' AND'
      '((inactive = '#39'N'#39') or (inactive is NULL))'
      'ORDER BY Logo_Name')
    Left = 352
    Top = 218
  end
  object dtsLogos: TDataSource
    DataSet = qryLogos
    Left = 408
    Top = 222
  end
end
