object PBAccExportDirectDebitFrm: TPBAccExportDirectDebitFrm
  Left = 366
  Top = 131
  BorderStyle = bsSingle
  Caption = 'Export Invoice Direct Debit details'
  ClientHeight = 404
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 363
    Width = 533
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnExport: TButton
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Export'
      TabOrder = 0
      OnClick = btnExportClick
    end
    object btnCancel: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object pnlRight: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 319
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlNumberRange: TPanel
      Left = 153
      Top = 0
      Width = 380
      Height = 319
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lblInvNumber: TLabel
        Left = 24
        Top = 6
        Width = 86
        Height = 13
        Caption = 'Invoice Number(s)'
      end
      object Label1: TLabel
        Left = 24
        Top = 68
        Width = 267
        Height = 26
        Caption = 
          'Enter Invoice numbers and/or Invoice ranges separated by commas.' +
          ' For example, 1234, 1236, 1240-1245'
        WordWrap = True
      end
      object edtInvNo: TEdit
        Left = 64
        Top = 26
        Width = 41
        Height = 21
        TabOrder = 0
      end
      object SelectionMemo: TMemo
        Left = 24
        Top = 24
        Width = 265
        Height = 41
        TabOrder = 1
      end
      object SelectLst: TListBox
        Left = 200
        Top = 8
        Width = 25
        Height = 33
        ItemHeight = 13
        Sorted = True
        TabOrder = 2
        Visible = False
      end
    end
    object pnlDateRange: TPanel
      Left = 409
      Top = -8
      Width = 380
      Height = 319
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 152
        Top = 8
        Width = 217
        Height = 76
        Caption = 'Selection '
        TabOrder = 0
        object lblDateFrom: TLabel
          Left = 9
          Top = 20
          Width = 52
          Height = 13
          Caption = 'Date From:'
        end
        object lblDateTo: TLabel
          Left = 9
          Top = 49
          Width = 42
          Height = 13
          Caption = 'Date To:'
        end
        object btnDateFrom: TSpeedButton
          Left = 184
          Top = 15
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
          Left = 184
          Top = 44
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
          Top = 16
          Width = 98
          Height = 21
          MaxLength = 10
          TabOrder = 0
          OnExit = edtDateFromExit
        end
        object edtDateTo: TEdit
          Left = 79
          Top = 45
          Width = 98
          Height = 21
          MaxLength = 10
          TabOrder = 1
          OnExit = edtDateToExit
        end
      end
    end
    object pnleft: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 319
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object rdgrpExportBy: TRadioGroup
        Left = 8
        Top = 8
        Width = 137
        Height = 76
        Caption = 'Export By'
        ItemIndex = 0
        Items.Strings = (
          'Date Range'
          'Invoice Number')
        TabOrder = 0
        OnClick = rdgrpExportByClick
      end
    end
  end
  object pnlExpFile: TPanel
    Left = 0
    Top = 319
    Width = 533
    Height = 44
    Align = alBottom
    TabOrder = 2
    object lblExpTo: TLabel
      Left = 8
      Top = 16
      Width = 49
      Height = 13
      Caption = 'Export To:'
    end
    object edtExpFile: TEdit
      Left = 64
      Top = 12
      Width = 377
      Height = 21
      TabOrder = 0
    end
    object btnBrowse: TButton
      Left = 448
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Browse'
      TabOrder = 1
      OnClick = btnBrowseClick
    end
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
      'Customer.Direct_Debit_Code'
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
        '.direct_debit_filename is null))'
      'and (Payment_Terms.Payment_Type = '#39'DD'#39')'
      'order by sales_invoice.sales_invoice_no'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 88
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DateTo'
        ParamType = ptUnknown
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
    Left = 152
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IntSel'
        ParamType = ptUnknown
      end>
  end
  object qrySalesInvs: TFDQuery
    ConnectionName = 'PB'
    Left = 16
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    FileName = 'DirectDebit.csv'
    Filter = 'CSV Files (*.csv)|*.csv'
    Left = 368
    Top = 128
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
    Left = 84
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'From_InvNum'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'To_InvNum'
        ParamType = ptUnknown
      end>
  end
  object DelWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 144
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
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
    Left = 114
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Sel1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'text100'
        ParamType = ptUnknown
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
    Left = 54
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Text100'
        ParamType = ptUnknown
      end>
  end
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' '
      ' ')
    Left = 24
    Top = 124
  end
  object qryUpdInvs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update sales_invoice'
      'set direct_debit_Filename = :direct_debit_Filename,'
      
        ' direct_debit_date = :direct_debit_date, direct_debit_pending = ' +
        #39'Y'#39
      'where sales_invoice.sales_invoice = :sales_invoice')
    Left = 208
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'direct_debit_Filename'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'direct_debit_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sales_invoice'
        ParamType = ptUnknown
      end>
  end
end
