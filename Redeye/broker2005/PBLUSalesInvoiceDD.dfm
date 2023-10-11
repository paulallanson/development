object PBLUSalesInvoiceDDFrm: TPBLUSalesInvoiceDDFrm
  Left = 192
  Top = 107
  Caption = 'Direct Debit Export'
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object stbrDetails: TStatusBar
    Left = 0
    Top = 422
    Width = 912
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 250
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 113
    Align = alTop
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 16
      Top = 8
      Width = 233
      Height = 89
      Caption = 'Date Selection '
      TabOrder = 0
      object lblDateFrom: TLabel
        Left = 9
        Top = 28
        Width = 52
        Height = 13
        Caption = 'Date From:'
      end
      object lblDateTo: TLabel
        Left = 9
        Top = 57
        Width = 42
        Height = 13
        Caption = 'Date To:'
      end
      object btnDateFrom: TSpeedButton
        Left = 192
        Top = 23
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
        OnClick = btnDateFromClick
      end
      object btnDateTo: TSpeedButton
        Left = 192
        Top = 52
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
        OnClick = btnDateToClick
      end
      object edtDateFrom: TEdit
        Left = 79
        Top = 24
        Width = 98
        Height = 21
        MaxLength = 10
        TabOrder = 0
        OnChange = EnableExport
        OnExit = edtDateFromExit
      end
      object edtDateTo: TEdit
        Left = 79
        Top = 53
        Width = 98
        Height = 21
        MaxLength = 10
        TabOrder = 1
        OnChange = EnableExport
        OnExit = edtDateToExit
      end
    end
    object chkbxShowExported: TCheckBox
      Left = 264
      Top = 16
      Width = 233
      Height = 17
      Caption = 'Show Exported Invoices'
      TabOrder = 1
      OnClick = chkbxShowExportedClick
    end
    object OleContainer1: TOleContainer
      Left = 496
      Top = 8
      Width = 129
      Height = 89
      Caption = 'OleContainer1'
      Color = clBtnFace
      TabOrder = 2
      Visible = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 113
    Width = 912
    Height = 268
    Align = alClient
    DataSource = dtsSalesInv
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Sales_invoice_No'
        Title.Caption = 'Invoice No.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Invoice_Date'
        Title.Caption = 'Date'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 239
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Direct_Debit_Code'
        Title.Caption = 'Direct Debit Code'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_Value'
        Title.Caption = 'Goods'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vat_Value'
        Title.Caption = 'Vat'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_Value'
        Title.Caption = 'Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'direct_debit_filename'
        Title.Caption = 'Filename'
        Width = 216
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 381
    Width = 912
    Height = 41
    Align = alBottom
    TabOrder = 3
    object lblExpTo: TLabel
      Left = 8
      Top = 16
      Width = 49
      Height = 13
      Caption = 'Export To:'
    end
    object btnExport: TButton
      Left = 728
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Export'
      Enabled = False
      TabOrder = 0
      OnClick = btnExportClick
    end
    object btnCancel: TButton
      Left = 824
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object edtExpFile: TEdit
      Left = 64
      Top = 12
      Width = 377
      Height = 21
      TabOrder = 2
      OnChange = EnableExport
    end
    object btnBrowse: TButton
      Left = 448
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Browse'
      TabOrder = 3
      OnClick = btnBrowseClick
    end
  end
  object qrySalesInvs: TFDQuery
    ConnectionName = 'PB'
    Left = 672
    Top = 16
  end
  object qrySalesInvByDate: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sales_invoice.sales_invoice,'
      'sales_invoice.Sales_Invoice_No,'
      'sales_invoice.Invoice_Date,'
      'sales_invoice.Goods_Value,'
      'sales_invoice.Vat_Value,'
      
        '(sales_invoice.Goods_Value + sales_invoice.Vat_Value) as Total_V' +
        'alue,'
      'Payment_Terms.Payment_Terms,'
      'Payment_Terms.Payment_Type,'
      'Payment_Terms.Number_of_Days,'
      'Customer.Name as Customer_Name,'
      'Customer_Branch.Account_Code,'
      'Customer.Direct_Debit_Code,'
      'sales_invoice.direct_debit_filename'
      'FROM Payment_Terms'
      '    RIGHT JOIN (Customer'
      '    INNER JOIN (Sales_Invoice'
      '    INNER JOIN Customer_Branch'
      
        '      ON (Sales_Invoice.Inv_to_Customer = Customer_Branch.Custom' +
        'er) AND (Sales_Invoice.Inv_to_Branch = Customer_Branch.Branch_no' +
        '))'
      '      ON Customer.Customer = Customer_Branch.Customer)'
      '      ON Payment_Terms.Payment_Terms = Customer.Payment_Terms'
      'where sales_invoice.invoice_date >= :DateFrom'
      'and sales_invoice.invoice_date <= :DateTo'
      'and sales_invoice.Sales_Invoice_Status >= 20'
      
        'and ((sales_invoice.inactive <> '#39'Y'#39') or (sales_invoice.inactive ' +
        'is null))'
      'and sales_invoice.invoice_or_credit = '#39'I'#39
      
        'and ((sales_invoice.direct_debit_filename = '#39#39') or(sales_invoice' +
        '.direct_debit_filename is null) or (:Show_All = '#39'Y'#39'))'
      'and (Payment_Terms.Payment_Type = '#39'DD'#39')'
      'order by sales_invoice.sales_invoice_no desc'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 744
    Top = 16
    ParamData = <
      item
        Name = 'DateFrom'
      end
      item
        Name = 'DateTo'
      end
      item
        Name = 'Show_All'
      end>
  end
  object qrySalesInvByNumber: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sales_invoice.sales_invoice,'
      '  sales_invoice.Sales_Invoice_No,'
      '  sales_invoice.Invoice_Date,'
      '  sales_invoice.Goods_Value,'
      '  sales_invoice.Vat_Value,'
      
        '  (sales_invoice.Goods_Value + sales_invoice.Vat_Value) as Total' +
        '_Value,'
      '  Payment_Terms.Payment_Terms,'
      '  Payment_Terms.Payment_Type,'
      '  Payment_Terms.Number_of_Days,'
      '  Customer.Name as Customer_Name,'
      '  Customer_Branch.Account_Code,'
      '  Customer.Direct_Debit_Code'
      'FROM Payment_Terms'
      '    RIGHT JOIN (Customer'
      '    INNER JOIN ((Int_Sel'
      '    INNER JOIN Sales_Invoice'
      '      ON Int_Sel.Text100 = Sales_Invoice.Sales_Invoice_No)'
      '    INNER JOIN Customer_Branch'
      
        '      ON (Sales_Invoice.Inv_to_Customer = Customer_Branch.Custom' +
        'er) AND (Sales_Invoice.Inv_to_Branch = Customer_Branch.Branch_no' +
        '))'
      '      ON Customer.Customer = Customer_Branch.Customer)'
      '      ON Payment_Terms.Payment_Terms = Customer.Payment_Terms'
      'where int_sel.int_sel_code = :IntSel'
      'and sales_invoice.invoice_or_credit = '#39'I'#39
      
        'and ((sales_invoice.inactive <> '#39'Y'#39') or (sales_invoice.inactive ' +
        'is null)) '
      
        'and ((sales_invoice.direct_debit_filename = '#39#39') or(sales_invoice' +
        '.direct_debit_filename is null)) '
      'and (Payment_Terms.Payment_Type = '#39'DD'#39')'
      'order by sales_invoice.sales_invoice_no'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 808
    Top = 16
    ParamData = <
      item
        Name = 'IntSel'
      end>
  end
  object qryUpdInvs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update sales_invoice'
      'set direct_debit_Filename = :direct_debit_Filename,'
      
        ' direct_debit_date = :direct_debit_date, direct_debit_pending = ' +
        #39'Y'#39
      'where sales_invoice.sales_invoice = :sales_invoice')
    Left = 864
    Top = 16
    ParamData = <
      item
        Name = 'direct_debit_Filename'
      end
      item
        Name = 'direct_debit_date'
      end
      item
        Name = 'sales_invoice'
      end>
  end
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' '
      ' ')
    Left = 328
    Top = 76
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
    Left = 358
    Top = 76
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
      end>
  end
  object GetInvRngSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct Sales_Invoice.sales_invoice_no'
      'FROM Sales_invoice'
      'WHERE'
      '  (Sales_invoice.Sales_invoice_no >= :From_InvNum)'
      'and (Sales_invoice.Sales_invoice_no <= :To_InvNum)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 388
    Top = 76
    ParamData = <
      item
        Name = 'From_InvNum'
      end
      item
        Name = 'To_InvNum'
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
    Left = 418
    Top = 76
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
  object DelWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 448
    Top = 76
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object OpenDialog1: TOpenDialog
    FileName = 'DirectDebit.csv'
    Filter = 'CSV Files (*.csv)|*.csv'
    Left = 552
    Top = 400
  end
  object dtsSalesInv: TDataSource
    DataSet = qrySalesInvs
    Left = 672
    Top = 64
  end
end
