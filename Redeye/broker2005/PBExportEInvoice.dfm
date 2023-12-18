object PBExportEInvoiceFrm: TPBExportEInvoiceFrm
  Left = 192
  Top = 114
  Caption = 'Export Electronic Invoices'
  ClientHeight = 439
  ClientWidth = 854
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 81
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
    object edtCustomer: TEdit
      Left = 72
      Top = 16
      Width = 233
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = 'edtCustomer'
    end
    object btnSelection: TButton
      Left = 320
      Top = 14
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSelectionClick
    end
    object rdgrpFileType: TRadioGroup
      Left = 368
      Top = 8
      Width = 105
      Height = 65
      Caption = 'File Type'
      ItemIndex = 0
      Items.Strings = (
        'New File'
        'Re-Send')
      ParentBackground = False
      TabOrder = 2
      OnClick = rdgrpFileTypeClick
    end
    object GroupBox1: TGroupBox
      Left = 480
      Top = 8
      Width = 377
      Height = 64
      Caption = 'Previous Files '
      ParentBackground = False
      TabOrder = 3
      Visible = False
      object Label5: TLabel
        Left = 9
        Top = 17
        Width = 47
        Height = 13
        Caption = 'Location:'
      end
      object edtExpFile: TEdit
        Left = 8
        Top = 30
        Width = 273
        Height = 21
        TabOrder = 0
      end
      object btnBrowse: TButton
        Left = 294
        Top = 26
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 1
        OnClick = btnBrowseClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 420
    Width = 854
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 760
    Top = 81
    Width = 94
    Height = 339
    Align = alRight
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      94
      339)
    object btnSelect: TBitBtn
      Left = 11
      Top = 27
      Width = 75
      Height = 25
      Hint = 'Select All'
      Anchors = [akTop, akRight]
      Caption = 'Select All'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSelectClick
    end
    object btnOK: TBitBtn
      Left = 11
      Top = 263
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
      TabOrder = 1
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 11
      Top = 303
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 2
    end
    object btnExcel: TBitBtn
      Left = 11
      Top = 72
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Excel'
      Enabled = False
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
      TabOrder = 3
      OnClick = btnExcelClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 81
    Width = 760
    Height = 339
    Align = alClient
    Caption = 'Panel4'
    ParentBackground = False
    TabOrder = 3
    object Panel5: TPanel
      Left = 1
      Top = 178
      Width = 758
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
        BevelOuter = bvNone
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
        Width = 509
        Height = 160
        Hint = 'Transaction Log'
        Style = lbOwnerDrawFixed
        Align = alClient
        TabOrder = 1
      end
    end
    object dbgDetails: TDBGrid
      Left = 1
      Top = 1
      Width = 758
      Height = 177
      Hint = 
        'to select multiple invoices press the CTRL button and click the ' +
        'required invoices'
      Align = alClient
      DataSource = dtsEInvoice
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Sales_Invoice_no'
          Title.Caption = 'Invoice No'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Invoice_Date'
          Title.Caption = 'Date'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Invoice_Description'
          Title.Caption = 'Description'
          Width = 239
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Goods_Value'
          Title.Caption = 'Goods'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Vat_Value'
          Title.Caption = 'VAT'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total_Value'
          Title.Caption = 'Total'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Status_Description'
          Title.Caption = 'Status'
          Width = 195
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Electronic_Invoice_Filename'
          Title.Caption = 'Filename'
          Width = 257
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Electronic_Invoice_Date'
          Title.Caption = 'Date Sent'
          Width = 72
          Visible = True
        end>
    end
  end
  object dtsEInvoice: TDataSource
    DataSet = qrySIHeader
    Left = 680
    Top = 32
  end
  object OpenDialog1: TOpenDialog
    FileName = 'FactorFile.csv'
    Filter = 'CSV Files (*.csv)|*.csv'
    Left = 368
    Top = 128
  end
  object qrySIHeader: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'Sales_Invoice.Sales_Invoice,'
      #9'      Sales_Invoice.Invoice_Date,'
      '        Sales_invoice.Goods_Value,'
      '        Sales_invoice.Vat_Value,'
      #9'      Sales_Invoice.Operator,'
      #9'      Sales_Invoice.Sales_invoice_no,'
      #9'      Sales_Invoice.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Sales_Invoice.Branch_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Sales_Invoice.Sales_invoice_status,'
      '        Sales_Invoice_Status.Description as Status_Description,'
      #9'      Sales_invoice.Currency_Code,'
      
        '        (Sales_invoice.Goods_Value + Sales_invoice.Vat_Value) as' +
        ' Total_Value,'
      '        Sales_invoice.Inv_to_Customer,'
      #9'      InvCust.Name as InvCust_Name,'
      '        Sales_invoice.Inv_to_Branch,'
      '        InvCustB.Name as InvBranch_Name,'
      '        Sales_Invoice.Invoice_or_Credit,'
      #9'      Sales_invoice.Paid_Status,'
      #9'      Sales_invoice.Paid_date,'
      #9'      Sales_invoice.Paid_Amount,'
      #9'      Sales_invoice.Narrative,'
      #9'      Sales_invoice.Sales_invoice_type,'
      '        Sales_Invoice.Inactive,'
      #9'      Sales_invoice.Period_End_run,'
      '        InvCustB.Account_Code,'
      '        Sales_invoice.Reference,'
      '        Sales_invoice.Invoice_Description,'
      '        Sales_invoice.Rep,'
      '        Sales_invoice.Internal_Narrative,'
      '        Sales_invoice.Cash_Sales,'
      '        Sales_invoice.Account_Number,'
      '        Sales_invoice.Account_Month,'
      '        Sales_invoice.Account_Year,'
      '        Sales_invoice.Contact_no,'
      '        Sales_invoice.Contact_Name,'
      '        Sales_Invoice.Invoice_Location,'
      '        Sales_Invoice.Category,'
      '        Sales_Invoice.Credit_Note_Reason,'
      '        Sales_Invoice.Electronic_Invoice,'
      '        Sales_Invoice.Electronic_Invoice_Filename,'
      '        Sales_Invoice.Electronic_Invoice_Date,'
      '        (select Category.description'
      '         from Category'
      
        '         where Category = Sales_Invoice.Category) as Category_De' +
        'scription'
      'from Sales_Invoice,'
      '     Customer,'
      '     Customer InvCust,'
      '     Customer_Branch,'
      '     Customer_Branch InvCustB,'
      '     Sales_Invoice_Status'
      'where'
      '('
      '(Customer.Customer = :Customer)'
      ') AND'
      '('
      '(Sales_invoice.Sales_invoice_status >= :Status_From) and'
      '(Sales_invoice.Sales_invoice_status < :Status_To)'
      ') and'
      '(Sales_Invoice.Electronic_Invoice = '#39'Y'#39') and'
      '('
      
        '((Sales_Invoice.Inactive = '#39'N'#39') or (Sales_Invoice.Inactive is nu' +
        'll ))'
      ') and'
      '(Sales_invoice.Customer = Customer.Customer) and'
      '('
      '(Sales_invoice.Customer = Customer_Branch.Customer) and'
      '(Sales_invoice.Branch_no = Customer_Branch.Branch_no)'
      ') and'
      '(Sales_invoice.Inv_to_Customer = InvCust.Customer) and'
      '('
      '(Sales_invoice.Inv_to_Customer = InvCustB.Customer) and'
      '(Sales_invoice.Inv_to_Branch = InvCustB.Branch_no)'
      ') and'
      
        '(Sales_invoice.Sales_invoice_Status = Sales_invoice_status.Sales' +
        '_invoice_Status)'
      '')
    Left = 488
    Top = 112
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Status_From'
      end
      item
        Name = 'Status_To'
      end>
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
end
