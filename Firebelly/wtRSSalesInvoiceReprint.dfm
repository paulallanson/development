object frmWTRSSalesInvoiceReprint: TfrmWTRSSalesInvoiceReprint
  Left = 499
  Top = 197
  BorderStyle = bsDialog
  Caption = 'Invoice Re-Print Selection'
  ClientHeight = 212
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  DesignSize = (
    418
    212)
  TextHeight = 17
  object selectionGrp: TGroupBox
    Left = 8
    Top = 8
    Width = 273
    Height = 153
    Caption = 'Invoice Number Selection'
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 80
      Width = 221
      Height = 51
      Caption = 
        'Enter invoice numbers and/or invoice ranges separated by commas.' +
        ' For example, 1234, 1236, 1240-1245'
      WordWrap = True
    end
    object memSelection: TMemo
      Left = 8
      Top = 20
      Width = 257
      Height = 53
      TabOrder = 0
      OnChange = EnablePrint
      OnKeyPress = memSelectionKeyPress
    end
  end
  object btnClose: TBitBtn
    Left = 321
    Top = 175
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Close'
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object SelectLst: TListBox
    Left = 248
    Top = 16
    Width = 25
    Height = 73
    ItemHeight = 17
    Sorted = True
    TabOrder = 2
    Visible = False
  end
  object btnPrint: TBitBtn
    Left = 9
    Top = 175
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnPrintClick
    ExplicitTop = 166
  end
  object btnPreview: TBitBtn
    Left = 97
    Top = 175
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnPreviewClick
    ExplicitTop = 166
  end
  object btnEmail: TBitBtn
    Left = 185
    Top = 175
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Email'
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnEmailClick
    ExplicitTop = 166
  end
  object rdgrpType: TRadioGroup
    Left = 288
    Top = 8
    Width = 113
    Height = 68
    Caption = 'Print Type'
    ItemIndex = 0
    Items.Strings = (
      'Summary'
      'Detailed')
    ParentBackground = False
    TabOrder = 6
  end
  object InvRPrintSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      ' ')
    Left = 24
    Top = 40
  end
  object qryInvPrint: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_invoice.*,'
      '        Customer.Customer_Name,'
      '        Customer.Street,'
      '        Customer.Locale,'
      '        Customer.Town_city,'
      '        Customer.Postcode,'
      '        Customer.County_State,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_Is_Speculative,'
      '        Customer.Account_is_Factored,'
      '        Customer.Use_Virtual_Bank_Details,'
      '        Customer.Separate_Labour_Invoice_Value,'
      '        Customer.Invoice_Label,'
      '        Customer.Supplier_Code,'
      '        (Select Payment_Terms_Description'
      '         from Payment_Terms'
      
        '         where Payment_Terms.Payment_Terms = Sales_invoice.Payme' +
        'nt_Terms) as Payment_Terms_Description'
      'FROM Int_Sel'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_invoice'
      '        ON Customer.Customer = Sales_invoice.Customer)'
      '        ON Int_Sel.Text100 = Sales_invoice.Invoice_no'
      'WHERE'
      '('
      '(Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '(Sales_Invoice.invoice_or_credit is null)'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_sel)'
      'order by'
      '  Sales_Invoice.Invoice_No asc')
    Left = 24
    Top = 110
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryCreditPrint: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_invoice.*,'
      '        Customer.Customer_Name,'
      '        Customer.Street,'
      '        Customer.Locale,'
      '        Customer.Town_city,'
      '        Customer.Postcode,'
      '        Customer.County_State,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_Is_Speculative,'
      '        Customer.Account_is_Factored,'
      '        Customer.Use_Virtual_Bank_Details,'
      '        Customer.Separate_Labour_Invoice_Value,'
      '        Customer.Invoice_Label,'
      '        Customer.Supplier_Code,'
      '        (Select Payment_Terms_Description'
      '         from Payment_Terms'
      
        '         where Payment_Terms.Payment_Terms = Sales_invoice.Payme' +
        'nt_Terms) as Payment_Terms_Description'
      'FROM Int_Sel'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_invoice'
      '        ON Customer.Customer = Sales_invoice.Customer)'
      '        ON Int_Sel.Text100 = Sales_invoice.Invoice_no'
      'WHERE'
      '('
      '(Sales_Invoice.invoice_or_credit = '#39'C'#39')'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_sel)'
      'ORDER BY'
      '  Sales_Invoice.Invoice_No asc')
    Left = 74
    Top = 130
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryGetCustomers: TFDQuery
    ConnectionName = 'wt'
    Left = 172
    Top = 13
  end
  object GetInvCustSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_invoice.Invoice_no,'
      '        Sales_invoice.Customer,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Email_Address as Email,'
      '        Customer.Email_Address as Contact_Email,'
      '        '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'      '#39'PDF'#39' as ExportFilter,'
      '        '#39' '#39' as CC_Email,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_Is_Speculative,'
      '        Sales_invoice.Invoice_Address'
      'FROM Int_Sel'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_invoice'
      '        ON Customer.Customer = Sales_invoice.Customer)'
      '        ON Int_Sel.Text100 = Sales_invoice.Invoice_no'
      'WHERE'
      '  ('
      '  (Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '  (invoice_or_credit is null)'
      '  ) and'
      '  ('
      '  (Sales_invoice.Inactive <> '#39'Y'#39') or'
      '  (Sales_invoice.Inactive is null)'
      '  ) and'
      '  (Int_sel.Int_sel_Code = :Int_Sel)'
      'ORDER BY'
      '  Sales_Invoice.Customer_Name,'
      '  Sales_Invoice.Invoice_no'
      '')
    Left = 257
    Top = 23
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
  end
  object GetCreditCustSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_invoice.Invoice_no,'
      '        Sales_invoice.Customer,'
      '        Sales_invoice.Customer_Name,'
      '        Customer.Email_Address as Email,'
      '        Customer.Email_Address as Contact_Email,'
      '        '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'      '#39'PDF'#39' as ExportFilter,'
      '        '#39' '#39' as CC_Email,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_Is_Speculative,'
      '        Sales_invoice.Invoice_Address'
      'FROM Int_Sel'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_invoice'
      '        ON Customer.Customer = Sales_invoice.Customer)'
      '        ON Int_Sel.Text100 = Sales_invoice.Invoice_no'
      'WHERE'
      '  ('
      '  (Sales_Invoice.invoice_or_credit = '#39'C'#39')'
      '  ) and'
      '  ('
      '  (Sales_invoice.Inactive <> '#39'Y'#39') or'
      '  (Sales_invoice.Inactive is null)'
      '  ) and'
      '  (Int_sel.Int_sel_Code = :Int_Sel)'
      'ORDER BY'
      '  Sales_Invoice.Customer_Name,'
      '  Sales_Invoice.Invoice_no'
      '')
    Left = 347
    Top = 18
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
  end
  object qryInvEmail: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_invoice.*,'
      '        Customer.Customer_Name,'
      '        Customer.Street,'
      '        Customer.Locale,'
      '        Customer.Town_city,'
      '        Customer.Postcode,'
      '        Customer.County_State,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_Is_Speculative,'
      '        Customer.Account_is_Factored,'
      '        Customer.Use_Virtual_Bank_Details,'
      '        Customer.Separate_Labour_Invoice_Value,'
      '        Customer.Invoice_Label,'
      '        Customer.Supplier_Code,'
      '        (Select Payment_Terms_Description'
      '         from Payment_Terms'
      
        '         where Payment_Terms.Payment_Terms = Sales_invoice.Payme' +
        'nt_Terms) as Payment_Terms_Description'
      'FROM Int_Sel'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_invoice'
      '        ON Customer.Customer = Sales_invoice.Customer)'
      '        ON Int_Sel.Text100 = Sales_invoice.Invoice_no'
      'WHERE'
      '('
      '(Sales_Invoice.invoice_or_credit <> '#39'C'#39') or'
      '(Sales_Invoice.invoice_or_credit is null)'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_sel) and'
      '((Sales_Invoice.Customer = :Customer)) and'
      '(Sales_Invoice.invoice_no = :Invoice_no)'
      'ORDER BY'
      '  Sales_Invoice.Invoice_No asc')
    Left = 199
    Top = 103
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        Name = 'Invoice_no'
        ParamType = ptInput
      end>
  end
  object qryCreditEmail: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_invoice.*,'
      '        Customer.Customer_Name,'
      '        Customer.Street,'
      '        Customer.Locale,'
      '        Customer.Town_city,'
      '        Customer.Postcode,'
      '        Customer.County_State,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_Is_Speculative,'
      '        Customer.Account_is_Factored,'
      '        Customer.Use_Virtual_Bank_Details,'
      '        Customer.Separate_Labour_Invoice_Value,'
      '        Customer.Invoice_Label,'
      '        Customer.Supplier_Code,'
      '        (Select Payment_Terms_Description'
      '         from Payment_Terms'
      
        '         where Payment_Terms.Payment_Terms = Sales_invoice.Payme' +
        'nt_Terms) as Payment_Terms_Description'
      'FROM Int_Sel'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_invoice'
      '        ON Customer.Customer = Sales_invoice.Customer)'
      '        ON Int_Sel.Text100 = Sales_invoice.Invoice_no'
      'WHERE'
      '('
      '(Sales_Invoice.invoice_or_credit = '#39'C'#39')'
      ') and'
      '('
      '(Sales_invoice.Inactive <> '#39'Y'#39') or'
      '(Sales_invoice.Inactive is null)'
      ') and'
      '(Int_sel.Int_sel_Code = :Int_sel) and'
      '((Sales_Invoice.Customer = :Customer)) and'
      '(Sales_Invoice.invoice_no = :Invoice_no)'
      'ORDER BY'
      '  Sales_Invoice.Invoice_No asc')
    Left = 319
    Top = 71
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        Name = 'Invoice_no'
        ParamType = ptInput
      end>
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Address'
      'WHERE Address = :Address')
    Left = 276
    Top = 90
    ParamData = <
      item
        Name = 'Address'
      end>
  end
end
