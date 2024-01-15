object frmWTRSSalesInvoiceReprint: TfrmWTRSSalesInvoiceReprint
  Left = 499
  Top = 197
  BorderStyle = bsDialog
  Caption = 'Invoice Re-Print Selection'
  ClientHeight = 187
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  DesignSize = (
    364
    187)
  TextHeight = 13
  object selectionGrp: TGroupBox
    Left = 8
    Top = 8
    Width = 273
    Height = 137
    Caption = 'Invoice Number Selection'
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 80
      Width = 232
      Height = 39
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
    Left = 273
    Top = 150
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Close'
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnCloseClick
    ExplicitTop = 149
  end
  object SelectLst: TListBox
    Left = 248
    Top = 16
    Width = 25
    Height = 73
    ItemHeight = 13
    Sorted = True
    TabOrder = 2
    Visible = False
  end
  object btnPrint: TBitBtn
    Left = 9
    Top = 150
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnPrintClick
    ExplicitTop = 149
  end
  object btnPreview: TBitBtn
    Left = 97
    Top = 150
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnPreviewClick
    ExplicitTop = 149
  end
  object btnEmail: TBitBtn
    Left = 185
    Top = 150
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Email'
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnEmailClick
    ExplicitTop = 149
  end
  object rdgrpType: TRadioGroup
    Left = 288
    Top = 8
    Width = 81
    Height = 73
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
    Left = 32
    Top = 32
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
      '        Customer.Separate_Labour_Invoice_Value,'
      '        Customer.Invoice_Label,'
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
    Left = 32
    Top = 88
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
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
      '        Customer.Separate_Labour_Invoice_Value,'
      '        Customer.Invoice_Label,'
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
    Left = 72
    Top = 104
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
      end>
  end
  object qryGetCustomers: TFDQuery
    ConnectionName = 'wt'
    Left = 152
    Top = 8
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
    Left = 232
    Top = 8
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
    Left = 232
    Top = 56
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
      '        Customer.Separate_Labour_Invoice_Value,'
      '        Customer.Invoice_Label,'
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
    Left = 304
    Top = 72
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Invoice_no'
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
      '        Customer.Separate_Labour_Invoice_Value,'
      '        Customer.Invoice_Label,'
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
    Left = 336
    Top = 104
    ParamData = <
      item
        Name = 'Int_sel'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Invoice_no'
      end>
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Address'
      'WHERE Address = :Address')
    Left = 240
    Top = 104
    ParamData = <
      item
        Name = 'Address'
      end>
  end
end
