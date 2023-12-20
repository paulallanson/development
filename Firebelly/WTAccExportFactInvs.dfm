object frmWTAccExportFactInvs: TfrmWTAccExportFactInvs
  Left = 143
  Top = 124
  BorderStyle = bsSingle
  Caption = 'Export Factoring Invoices'
  ClientHeight = 205
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 164
    Width = 515
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object btnExport: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Export'
      TabOrder = 0
      OnClick = btnExportClick
    end
    object btnCancel: TButton
      Left = 408
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
    Width = 515
    Height = 119
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object pnlNumberRange: TPanel
      Left = 274
      Top = 0
      Width = 241
      Height = 119
      ParentBackground = False
      TabOrder = 0
      object lblInvNumber: TLabel
        Left = 9
        Top = 6
        Width = 91
        Height = 13
        Caption = 'Invoice Number(s)'
      end
      object Label1: TLabel
        Left = 8
        Top = 68
        Width = 194
        Height = 39
        Caption = 
          'Enter Invoice numbers and/or Invoice ranges separated by commas.' +
          ' For example, 1234, 1236, 1240-1245'
        WordWrap = True
      end
      object edtInvNo: TEdit
        Left = 8
        Top = 26
        Width = 41
        Height = 21
        TabOrder = 0
      end
      object SelectionMemo: TMemo
        Left = 8
        Top = 24
        Width = 209
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
      Left = 274
      Top = 0
      Width = 241
      Height = 119
      ParentBackground = False
      TabOrder = 1
      object btnDateFrom: TSpeedButton
        Left = 200
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
        Left = 200
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
      object lblDateFrom: TLabel
        Left = 9
        Top = 20
        Width = 56
        Height = 13
        Caption = 'Date From:'
      end
      object lblDateTo: TLabel
        Left = 24
        Top = 57
        Width = 42
        Height = 13
        Caption = 'Date To:'
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
        Top = 53
        Width = 98
        Height = 21
        MaxLength = 10
        TabOrder = 1
        OnExit = edtDateToExit
      end
    end
    object pnlInvOrCred: TPanel
      Left = 0
      Top = 0
      Width = 137
      Height = 119
      Align = alLeft
      ParentBackground = False
      TabOrder = 2
      object rdgrpInvOrCred: TRadioGroup
        Left = 8
        Top = 8
        Width = 121
        Height = 97
        Caption = 'Export'
        ItemIndex = 0
        Items.Strings = (
          'Invoices'
          'Credits')
        ParentBackground = False
        TabOrder = 0
        OnClick = rdgrpInvOrCredClick
      end
    end
    object pnleft: TPanel
      Left = 137
      Top = 0
      Width = 137
      Height = 119
      Align = alLeft
      ParentBackground = False
      TabOrder = 3
      object rdgrpExportBy: TRadioGroup
        Left = 8
        Top = 8
        Width = 121
        Height = 97
        Caption = 'Export By'
        ItemIndex = 0
        Items.Strings = (
          'Date Range'
          'Invoice Number')
        ParentBackground = False
        TabOrder = 0
        OnClick = rdgrpExportByClick
      end
    end
  end
  object pnlExpFile: TPanel
    Left = 0
    Top = 119
    Width = 515
    Height = 45
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    object lblExpTo: TLabel
      Left = 72
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Export To:'
    end
    object edtExpFile: TEdit
      Left = 136
      Top = 12
      Width = 257
      Height = 21
      TabOrder = 0
    end
    object btnBrowse: TButton
      Left = 408
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
        'alue'
      'from sales_invoice'
      'where sales_invoice.invoice_date >= :DateFrom '
      'and sales_invoice.invoice_date <= :DateTo'
      'and sales_invoice.Sales_Invoice_Status >= 20'
      
        'and ((sales_invoice.inactive <> '#39'Y'#39') or (sales_invoice.inactive ' +
        'is null))'
      'and sales_invoice.invoice_or_credit = :InvOrCred'
      
        'and ((sales_invoice.factoring_filename = '#39#39') or(sales_invoice.fa' +
        'ctoring_filename is null))'
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
    Left = 40
    Top = 88
    ParamData = <
      item
        Name = 'DateFrom'
      end
      item
        Name = 'DateTo'
      end
      item
        Name = 'InvOrCred'
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
        '_Value'
      'from int_sel inner join sales_invoice on'
      '  (int_sel.text100 = sales_invoice.sales_invoice_no)'
      'where int_sel.int_sel_code = :IntSel'
      'and sales_invoice.invoice_or_credit = :InvOrCred'
      
        'and ((sales_invoice.inactive <> '#39'Y'#39') or (sales_invoice.inactive ' +
        'is null)) '
      
        'and ((sales_invoice.factoring_filename = '#39#39') or(sales_invoice.fa' +
        'ctoring_filename is null)) '
      'order by sales_invoice.sales_invoice_no'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 120
    ParamData = <
      item
        Name = 'IntSel'
      end
      item
        Name = 'InvOrCred'
      end>
  end
  object qrySalesInvs: TFDQuery
    ConnectionName = 'PB'
    Left = 8
    Top = 96
  end
  object OpenDialog1: TOpenDialog
    FileName = 'FactorFile.csv'
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
    Left = 348
    Top = 84
    ParamData = <
      item
        Name = 'From_InvNum'
      end
      item
        Name = 'To_InvNum'
      end>
  end
  object DelWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 408
    Top = 84
    ParamData = <
      item
        Name = 'Int_Sel_Code'
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
    Left = 378
    Top = 84
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
    Left = 318
    Top = 84
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
      end>
  end
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' '
      ' ')
    Left = 288
    Top = 84
  end
  object qryUpdInvs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update sales_invoice'
      'set Factoring_Filename = :Factoring_Filename,'
      ' Factoring_date = :Factoring_date'
      'where sales_invoice.sales_invoice = :sales_invoice')
    Left = 88
    Top = 96
    ParamData = <
      item
        Name = 'Factoring_Filename'
      end
      item
        Name = 'Factoring_date'
      end
      item
        Name = 'sales_invoice'
      end>
  end
end
