object PBRSOSSInvPaymentsFrm: TPBRSOSSInvPaymentsFrm
  Left = 46
  Top = 40
  Caption = 'Sales Invoice Outstanding Payments'
  ClientHeight = 412
  ClientWidth = 698
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 710
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 121
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 72
      Width = 59
      Height = 13
      Caption = 'Sort first by'
    end
    object Label4: TLabel
      Left = 176
      Top = 72
      Width = 62
      Height = 13
      Caption = 'then sort by'
    end
    object rgCustomer: TRadioGroup
      Left = 8
      Top = 5
      Width = 145
      Height = 60
      Caption = 'By Customer'
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer ')
      ParentBackground = False
      TabOrder = 0
      OnClick = rgCustomerClick
    end
    object pnlCustSearch: TPanel
      Left = 160
      Top = 8
      Width = 305
      Height = 57
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object lblCustBran: TLabel
        Left = 8
        Top = 1
        Width = 94
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
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
    end
    object chkbxPaid: TCheckBox
      Left = 480
      Top = 8
      Width = 153
      Height = 17
      Caption = 'Show fully paid invoices'
      TabOrder = 2
      OnClick = chkbxPaidClick
    end
    object grpbxPayments: TGroupBox
      Left = 480
      Top = 32
      Width = 217
      Height = 81
      Caption = 'Payments'
      Enabled = False
      ParentBackground = False
      TabOrder = 3
      object Label1: TLabel
        Left = 12
        Top = 24
        Width = 56
        Height = 13
        Caption = 'Date From:'
      end
      object Label2: TLabel
        Left = 12
        Top = 52
        Width = 42
        Height = 13
        Caption = 'Date To:'
      end
      object DateFromButton: TSpeedButton
        Left = 184
        Top = 14
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
        Left = 184
        Top = 47
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
      object DateFromEdit: TEdit
        Left = 79
        Top = 16
        Width = 98
        Height = 21
        MaxLength = 10
        TabOrder = 0
        OnExit = DateFromEditExit
      end
      object DateToEdit: TEdit
        Left = 79
        Top = 48
        Width = 98
        Height = 21
        MaxLength = 10
        TabOrder = 1
        OnExit = DateToEditExit
      end
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 90
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnChange = cbSort1Change
      Items.Strings = (
        'Customer'
        'Invoice Number'
        'Invoice Date'
        'Sales Order Number')
    end
    object cbSort2: TComboBox
      Left = 176
      Top = 90
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      OnChange = cbSort1Change
      Items.Strings = (
        'Customer'
        'Invoice Number'
        'Invoice Date'
        'Sales Order Number')
    end
    object chkbxAllUnpaid: TCheckBox
      Left = 328
      Top = 92
      Width = 145
      Height = 17
      Caption = 'Show all unpaid invoices'
      TabOrder = 6
      OnClick = chkbxPaidClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 356
    Width = 698
    Height = 37
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 188
      Height = 35
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        188
        35)
      object btnPreview: TBitBtn
        Left = 6
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Preview'
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
        TabOrder = 0
        OnClick = btnPreviewClick
      end
      object btnPrint: TBitBtn
        Left = 94
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Print'
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
        TabOrder = 1
        OnClick = btnPrintClick
      end
    end
    object Panel4: TPanel
      Left = 412
      Top = 1
      Width = 285
      Height = 35
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        285
        35)
      object btnPaid: TBitBtn
        Left = 117
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Paid'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnPaidClick
      end
      object btnClose: TBitBtn
        Left = 205
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Kind = bkClose
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 121
    Width = 698
    Height = 235
    Align = alClient
    DataSource = dtsReport
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sales_invoice_no'
        Title.Caption = 'Invoice No'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Invoice_Date'
        Title.Caption = 'Invoice Date'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Reference'
        Title.Caption = 'Sales Order'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Contact_Name'
        Title.Caption = 'Contact'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Account_Number'
        Title.Caption = 'Account Number'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Expiry_date'
        Title.Caption = 'Expiry Date'
        Width = 76
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Total_Value'
        Title.Caption = 'Total Value'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Paid_Status'
        Title.Caption = 'Paid Status'
        Width = 86
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 393
    Width = 698
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Sales_invoice.Customer,'
      '        Sales_invoice.Branch_no,'
      '        Customer.Name as Customer_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Sales_invoice,'
      '        Sales_invoice_no,'
      '        Invoice_Date,'
      '        Goods_Value,'
      '        Vat_Value,'
      #9'      (Goods_Value + Vat_Value) as Total_Value,'
      '        Paid_Status,'
      '        Paid_Amount,'
      '        Cash_Sales,'
      '        Account_Number,'
      '        Contact_Name,'
      '        Reference,'
      '        Sales_invoice_type,'
      '        Account_Month,'
      '        Account_Year,'
      #9'      (Account_Month + '#39'/'#39' + Account_Year) as Expiry_date,'
      '        Sales_invoice_Status'
      'from Sales_Invoice, Customer_Branch, Customer'
      'where ((Sales_invoice.Customer = Customer_Branch.Customer) and'
      '      (Sales_invoice.Branch_no = Customer_Branch.Branch_no)) and'
      '      (Customer_Branch.Customer = Customer.Customer) and'
      '      (Cash_Sales = '#39'Y'#39') and'
      '      (Paid_Status = '#39#39')'
      ' '
      ' ')
    Left = 592
    Top = 104
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 536
    Top = 104
  end
end
