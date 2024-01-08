object PBRSEInvoiceFrm: TPBRSEInvoiceFrm
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Export an Electronic Invoice'
  ClientHeight = 295
  ClientWidth = 856
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
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
    Top = 276
    Width = 856
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 762
    Top = 0
    Width = 94
    Height = 276
    Align = alRight
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      94
      276)
    object btnOK: TBitBtn
      Left = 11
      Top = 195
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Send'
      Default = True
      Enabled = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 11
      Top = 235
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 276
    Align = alClient
    Caption = 'Panel4'
    ParentBackground = False
    TabOrder = 2
    object Panel5: TPanel
      Left = 1
      Top = 115
      Width = 760
      Height = 160
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel3'
      ParentBackground = False
      TabOrder = 0
      object pnlFTP: TPanel
        Left = 0
        Top = 0
        Width = 249
        Height = 160
        Align = alLeft
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 5
          Top = 12
          Width = 65
          Height = 13
          Caption = 'FTP Address:'
        end
        object Label3: TLabel
          Left = 5
          Top = 44
          Width = 54
          Height = 13
          Caption = 'Username:'
        end
        object Label4: TLabel
          Left = 5
          Top = 76
          Width = 52
          Height = 13
          Caption = 'Password:'
        end
        object edtUserName: TEdit
          Left = 73
          Top = 40
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 0
          OnChange = EnableOK
        end
        object edtPassword: TEdit
          Left = 73
          Top = 72
          Width = 121
          Height = 21
          PasswordChar = '*'
          ReadOnly = True
          TabOrder = 1
          OnChange = EnableOK
        end
        object edtFTP: TEdit
          Left = 73
          Top = 8
          Width = 168
          Height = 21
          TabOrder = 2
          OnChange = EnableOK
        end
        object lstbxFiles: TListBox
          Left = 8
          Top = 103
          Width = 121
          Height = 46
          ItemHeight = 13
          TabOrder = 3
          Visible = False
        end
        object lstbxInvoices: TListBox
          Left = 135
          Top = 103
          Width = 103
          Height = 46
          ItemHeight = 13
          TabOrder = 4
          Visible = False
        end
      end
      object lstbxStatus: TListBox
        Left = 249
        Top = 0
        Width = 511
        Height = 160
        Hint = 'Transaction Log'
        Style = lbOwnerDrawFixed
        Align = alClient
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 760
      Height = 114
      Align = alClient
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 59
        Height = 13
        Caption = 'Invoice No:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 264
        Top = 24
        Width = 67
        Height = 13
        Caption = 'Invoice Date:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 24
        Top = 56
        Width = 53
        Height = 13
        Caption = 'Customer:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 24
        Top = 88
        Width = 62
        Height = 13
        Caption = 'Description:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 504
        Top = 24
        Width = 68
        Height = 13
        Caption = 'Goods Value:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 504
        Top = 56
        Width = 53
        Height = 13
        Caption = 'VAT Value:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 504
        Top = 88
        Width = 59
        Height = 13
        Caption = 'Total Value:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtInvoiceNo: TEdit
        Left = 104
        Top = 20
        Width = 97
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object edtInvoiceDate: TEdit
        Left = 352
        Top = 20
        Width = 105
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object edtCustomer: TEdit
        Left = 104
        Top = 52
        Width = 353
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object edtDescription: TEdit
        Left = 104
        Top = 84
        Width = 353
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
      object memTotalValue: TMemo
        Left = 600
        Top = 84
        Width = 95
        Height = 21
        Alignment = taRightJustify
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
        WantReturns = False
        WordWrap = False
      end
      object memVATValue: TMemo
        Left = 600
        Top = 52
        Width = 95
        Height = 21
        Alignment = taRightJustify
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 5
        WantReturns = False
        WordWrap = False
      end
      object memGoodsValue: TMemo
        Left = 600
        Top = 20
        Width = 95
        Height = 21
        Alignment = taRightJustify
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
        WantReturns = False
        WordWrap = False
      end
    end
  end
  object FTP: TIdFTP
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Host = 'webscan'
    ProxySettings.UserName = 'MAILMARKETING\BrokerFTP'
    ProxySettings.Password = 'tr1fl3'
    ProxySettings.Port = 80
    Left = 264
    Top = 184
  end
  object qryCustEInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'Customer,'
      'Transfer_Site_URL,'
      'Connection_Username,'
      'Connection_Password,'
      
        'ISNULL(Electronic_Invoice_File_no,0) as Electronic_Invoice_File_' +
        'No,'
      'Transfer_Protocol_Type'
      'from Customer'
      'where Customer = :Customer')
    Left = 680
    Top = 144
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryUpdSIStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Invoice'
      'Set Sales_Invoice_Status = :Sales_Invoice_Status'
      'Where Sales_Invoice = :Sales_Invoice and'
      'Sales_Invoice_status <= 20')
    Left = 680
    Top = 208
    ParamData = <
      item
        Name = 'Sales_Invoice_Status'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryUpdCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer'
      'Set Electronic_Invoice_File_No = :Electronic_Invoice_File_no'
      'where Customer = :Customer')
    Left = 680
    Top = 272
    ParamData = <
      item
        Name = 'Electronic_Invoice_File_no'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryUpdSInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Invoice'
      'Set Electronic_Invoice_Filename = :Electronic_Invoice_Filename,'
      'Electronic_Invoice_Date = :Electronic_Invoice_Date'
      'Where Sales_Invoice = :Sales_Invoice')
    Left = 584
    Top = 208
    ParamData = <
      item
        Name = 'Electronic_Invoice_Filename'
      end
      item
        Name = 'Electronic_Invoice_Date'
      end
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct'
      'Sales_Invoice.Customer,'
      'Sales_Invoice.Branch_no,'
      'Sales_Invoice.Sales_Invoice,'
      'Customer_Branch.Account_Code,'
      'Customer.Name as Customer_Name,'
      'Rep.Name AS Rep_Name,'
      'Rep.Rep,'
      'Sales_Invoice.Sales_Invoice_No,'
      'Sales_Invoice.Goods_Value,'
      'Sales_Invoice.Sales_Invoice_type,'
      'Sales_Invoice.Vat_Value,'
      
        'Sales_Invoice.Goods_Value+Sales_Invoice.Vat_Value AS Total_Value' +
        ','
      'Sales_Invoice.Invoice_Date,'
      'Sales_Invoice.Invoice_or_Credit,'
      'Sales_Invoice.Paid_Date,'
      'Sales_Invoice.Paid_Amount,'
      'Sales_Invoice.Paid_Status,'
      'Sales_Invoice.Reference,'
      'Sales_Invoice.Invoice_Description,'
      'Sales_Invoice.Payment_Method,'
      'Contact_Name,'
      'Account_Number,'
      'Account_Month,'
      'Account_Year,'
      '(Account_Month + '#39'/'#39' + Account_Year) as Expiry_Date'
      'FROM Sales_Invoice, Customer_Branch, Customer, Rep'
      'WHERE (Sales_Invoice.Sales_invoice = :Sales_Invoice) and'
      '    ((Sales_invoice.Customer = Customer_Branch.Customer) and'
      '    (Sales_invoice.Branch_no = Customer_Branch.Branch_no)) and'
      '    (Customer_Branch.Customer = Customer.Customer) and'
      '    (Sales_invoice.Rep = Rep.Rep)')
    Left = 248
    Top = 72
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
end
