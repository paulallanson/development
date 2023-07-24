object PBRSSalesByPrdCatFrm: TPBRSSalesByPrdCatFrm
  Left = 3
  Top = 40
  Width = 790
  Height = 560
  Caption = 'Sales By Product Category'
  Color = clBtnFace
  Constraints.MinHeight = 560
  Constraints.MinWidth = 790
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDisplay: TPanel
    ParentBackground = False
    Left = 0
    Top = 185
    Width = 782
    Height = 300
    Align = alClient
    TabOrder = 0
    object dbgDetails: TDBGrid
      Left = 1
      Top = 1
      Width = 780
      Height = 298
      Align = alClient
      DataSource = dtsrcSalesByInv
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgDetailsDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'Description'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sales_Invoice_No'
          Title.Caption = 'Inv. No'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Account_Code'
          Title.Caption = 'Acc. Code'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = 'Customer Name'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Goods_Value'
          Title.Caption = 'Value'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Vat_Value'
          Title.Caption = 'VAT'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Goods_Total'
          Title.Caption = 'Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Invoice_Date'
          Title.Caption = 'Inv. Date'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Supplier_Name'
          Title.Caption = 'Supplier'
          Width = 347
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Rep_Name'
          Title.Caption = 'Rep'
          Width = 117
          Visible = True
        end>
    end
    object OleContainer1: TOleContainer
      Left = 416
      Top = 200
      Width = 129
      Height = 89
      Caption = 'OleContainer1'
      Color = clBtnFace
      TabOrder = 1
      Visible = False
    end
  end
  object pnlControls: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 782
    Height = 185
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 145
      Width = 52
      Height = 13
      Caption = 'Sort first by'
    end
    object Label4: TLabel
      Left = 160
      Top = 145
      Width = 55
      Height = 13
      Caption = 'then sort by'
    end
    object DateFromButton: TSpeedButton
      Left = 607
      Top = 29
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
      OnClick = DateFromButtonClick
    end
    object DateToButton: TSpeedButton
      Left = 607
      Top = 88
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
      OnClick = DateToButtonClick
    end
    object Label1: TLabel
      Left = 504
      Top = 15
      Width = 90
      Height = 13
      Caption = 'From Invoice Date:'
    end
    object Label2: TLabel
      Left = 504
      Top = 76
      Width = 80
      Height = 13
      Caption = 'To Invoice Date:'
    end
    object Label5: TLabel
      Left = 328
      Top = 145
      Width = 89
      Height = 13
      Caption = 'Invoices to include'
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 159
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbSortChange
      Items.Strings = (
        'Invoice Number'
        'Customer'
        'Supplier'
        'Rep')
    end
    object cbSort2: TComboBox
      Left = 160
      Top = 159
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbSortChange
      Items.Strings = (
        'Invoice Number'
        'Customer'
        'Supplier'
        'Rep'
        ' ')
    end
    object DateFromEdit: TEdit
      Left = 503
      Top = 31
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 2
      OnExit = DateFromEditExit
    end
    object cbValues: TComboBox
      Left = 328
      Top = 159
      Width = 217
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = cbValuesChange
      Items.Strings = (
        'non zero invoice values only'
        'zero values only'
        'credit values only'
        'All invoices/credits')
    end
    object chkbxPageBreak: TCheckBox
      Left = 648
      Top = 127
      Width = 121
      Height = 17
      Caption = 'Page break by total'
      Enabled = False
      TabOrder = 4
    end
    object DateToEdit: TEdit
      Left = 503
      Top = 89
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 5
      OnExit = DateToEditExit
    end
    object rgPrdCat: TRadioGroup
      ParentBackground = False
      Left = 8
      Top = 8
      Width = 137
      Height = 65
      Caption = ' By Product Category'
      ItemIndex = 0
      Items.Strings = (
        'All Product Categories'
        'One Product Category')
      TabOrder = 6
      OnClick = rgPrdCatClick
    end
    object RepPanel: TPanel
      ParentBackground = False
      Left = 168
      Top = 14
      Width = 321
      Height = 50
      TabOrder = 7
      Visible = False
      object lblPrdCat: TLabel
        Left = 8
        Top = 4
        Width = 82
        Height = 13
        Caption = 'Product Category'
      end
      object edtPrdCat: TEdit
        Left = 8
        Top = 20
        Width = 257
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnRep: TButton
        Left = 272
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
        OnClick = btnRepClick
      end
    end
    object RdGrpRepTyp: TRadioGroup
      ParentBackground = False
      Left = 656
      Top = 8
      Width = 115
      Height = 55
      Caption = 'Report Type'
      ItemIndex = 0
      Items.Strings = (
        'Summary'
        'Detail')
      TabOrder = 8
      OnClick = RdGrpRepTypClick
    end
    object chkbxTotalByProduct: TCheckBox
      Left = 648
      Top = 154
      Width = 129
      Height = 17
      Caption = 'Total by Product Type'
      TabOrder = 9
    end
    object rgCustomer: TRadioGroup
      ParentBackground = False
      Left = 8
      Top = 80
      Width = 137
      Height = 60
      Caption = 'By Customer'
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer ')
      TabOrder = 10
      OnClick = rgCustomerClick
    end
    object pnlCustSearch: TPanel
      ParentBackground = False
      Left = 168
      Top = 83
      Width = 321
      Height = 57
      TabOrder = 11
      Visible = False
      object lblCustBran: TLabel
        Left = 8
        Top = 1
        Width = 89
        Height = 13
        Caption = 'Customer / Branch'
      end
      object edtCustomer: TEdit
        Left = 8
        Top = 17
        Width = 257
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnCustomer: TButton
        Left = 272
        Top = 17
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
      object chkbxBranches: TCheckBox
        Left = 8
        Top = 38
        Width = 193
        Height = 17
        Caption = 'Report on all branches'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
  end
  object pnlPrintControl: TPanel
    ParentBackground = False
    Left = 0
    Top = 485
    Width = 782
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      782
      41)
    object lblRecordCount: TLabel
      Left = 104
      Top = 16
      Width = 3
      Height = 13
    end
    object Label6: TLabel
      Left = 24
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Record Count:'
    end
    object Panel1: TPanel
      ParentBackground = False
      Left = 549
      Top = 1
      Width = 232
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object PreviewReportBitBtn: TBitBtn
        Left = 30
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Preview'
        TabOrder = 0
        OnClick = PreviewReportBitBtnClick
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
      object PrintReportBitBtn: TBitBtn
        Left = 126
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Print'
        TabOrder = 1
        OnClick = PrintReportBitBtnClick
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
    end
    object CancelBitBtn: TBitBtn
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 1
      Kind = bkCancel
    end
    object btbtnExcel: TBitBtn
      Left = 472
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Excel'
      TabOrder = 2
      OnClick = btbtnExcelClick
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
    end
  end
  object pnlExportPrgrss: TPanel
    ParentBackground = False
    Left = 260
    Top = 252
    Width = 289
    Height = 61
    TabOrder = 3
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 53
      Height = 13
      Caption = 'Exporting...'
    end
    object prgbrExport: TProgressBar
      Left = 16
      Top = 32
      Width = 257
      Height = 16
      Step = 1
      TabOrder = 0
    end
  end
  object qrySalesByPrdCat: TQuery
    OnCalcFields = qrySalesByPrdCatCalcFields
    DatabaseName = 'pb'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer,'
      
        '  Sales_Invoice.Inv_to_Branch AS Branch_no, Sales_Invoice.Sales_' +
        'Invoice,'
      
        '  Customer_Branch.Account_Code, Customer.Name, Sales_Invoice.Sal' +
        'es_Invoice_No,'
      '  Sales_Invoice.Goods_Value, Sales_Invoice.Vat_Value,'
      
        '  (Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_T' +
        'otal,'
      '  Sales_Invoice.Invoice_Date, Sales_Invoice.Invoice_or_Credit,'
      '  Sales_Invoice.Rep, Sales_Invoice.Sales_invoice_type,'
      '  Sales_Invoice.Inactive, Sales_Invoice.Reference,'
      '  Sales_Invoice.Invoice_Description, (select Supplier.Name'
      #9'from Purchase_order, Supplier, Supplier_Branch'
      
        #9'where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purcha' +
        'se_Order and'
      #9#9'((Sales_invoice.Sales_invoice_type <> '#39'J'#39') or'
      #9#9'(Sales_invoice.Sales_invoice_type is null)) and'
      #9#9'((Purchase_Order.Supplier = Supplier_Branch.Supplier) and'
      #9#9'(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and'
      
        #9#9'(Supplier_Branch.Supplier = Supplier.Supplier)) AS Supplier_Na' +
        'me,'
      
        '    Rep.Name AS Rep_Name, Product_Type.Description, Rep.Name, sa' +
        'les_invoice_line.Invoice_Line_No'
      'FROM Category inner join '
      'Product_Type on (category.category = product_type.category)'
      'right JOIN (Customer INNER JOIN (((Customer_Branch'
      
        'INNER JOIN Sales_Invoice ON (Customer_Branch.Branch_no = Sales_I' +
        'nvoice.Inv_to_Branch)'
      'AND (Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer))'
      'INNER JOIN Rep ON Sales_Invoice.Rep = Rep.Rep)'
      'right JOIN Sales_Invoice_Line ON'
      
        '    Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoi' +
        'ce) ON'
      '    Customer.Customer = Customer_Branch.Customer) ON'
      '    Product_Type.Product_Type = Sales_Invoice_Line.Product_Type'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Left = 216
    Top = 216
    object qrySalesByPrdCatInvoice_Description: TStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object qrySalesByPrdCatSupplier_Desc: TStringField
      FieldKind = fkCalculated
      FieldName = 'Supplier_Desc'
      OnGetText = qrySalesByPrdCatSupplier_DescGetText
      Size = 30
      Calculated = True
    end
    object qrySalesByPrdCatOrderDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'OrderDesc'
      Size = 12
      Calculated = True
    end
    object qrySalesByPrdCatCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySalesByPrdCatBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qrySalesByPrdCatSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySalesByPrdCatAccount_Code: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qrySalesByPrdCatName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesByPrdCatSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object qrySalesByPrdCatGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
    end
    object qrySalesByPrdCatVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
    end
    object qrySalesByPrdCatGoods_Total: TCurrencyField
      FieldName = 'Goods_Total'
    end
    object qrySalesByPrdCatInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySalesByPrdCatInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qrySalesByPrdCatRep: TIntegerField
      FieldName = 'Rep'
    end
    object qrySalesByPrdCatSales_invoice_type: TStringField
      FieldName = 'Sales_invoice_type'
      FixedChar = True
      Size = 2
    end
    object qrySalesByPrdCatInactive: TStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object qrySalesByPrdCatReference: TStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object qrySalesByPrdCatSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesByPrdCatRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesByPrdCatDescription: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object qrySalesByPrdCatName_1: TStringField
      FieldName = 'Name_1'
      FixedChar = True
      Size = 80
    end
  end
  object dtsrcSalesByInv: TDataSource
    DataSet = qrySalesByPrdCat
    Left = 112
    Top = 200
  end
  object SQLRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Rep, Name'
      'from Rep'
      'where Rep = :Rep'
      ' ')
    Left = 400
    Top = 289
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
end
