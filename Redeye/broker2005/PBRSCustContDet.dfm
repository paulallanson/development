object PBRSCustContDetFrm: TPBRSCustContDetFrm
  Left = 42
  Top = 88
  Caption = 'Customer Contact Details'
  ClientHeight = 493
  ClientWidth = 976
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object pnlControls: TPanel
    Left = 0
    Top = 0
    Width = 976
    Height = 117
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      976
      117)
    object Label3: TLabel
      Left = 8
      Top = 70
      Width = 57
      Height = 14
      Caption = 'Sort first by'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 156
      Top = 70
      Width = 58
      Height = 14
      Caption = 'then sort by'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 300
      Top = 70
      Width = 58
      Height = 14
      Caption = 'then sort by'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 598
      Top = 88
      Width = 112
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Default Markup % =>'
      ExplicitLeft = 604
    end
    object Label9: TLabel
      Left = 447
      Top = 70
      Width = 86
      Height = 14
      Caption = 'and finally sort by'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object pnlStatusSelect: TPanel
      Left = 2
      Top = 8
      Width = 147
      Height = 57
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 31
        Height = 14
        Caption = 'Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object cmbbxContStatus: TComboBox
        Left = 8
        Top = 24
        Width = 133
        Height = 21
        TabOrder = 0
        Text = 'Show All'
        OnChange = cmbbxContStatusChange
      end
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 84
      Width = 135
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = cbSortChange
      Items.Strings = (
        'Contact Status'
        'Contact Type'
        'Rep'
        'Customer Type')
    end
    object cbSort2: TComboBox
      Left = 156
      Top = 84
      Width = 135
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = cbSortChange
      Items.Strings = (
        'Contact Status'
        'Contact Type'
        'Rep '
        'Customer Type')
    end
    object cbSort3: TComboBox
      Left = 300
      Top = 84
      Width = 135
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnChange = cbSortChange
      Items.Strings = (
        'Contact Status'
        'Contact Type'
        'Rep'
        'Customer Type')
    end
    object Panel2: TPanel
      Left = 149
      Top = 8
      Width = 147
      Height = 57
      ParentBackground = False
      TabOrder = 4
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 63
        Height = 14
        Caption = 'Contact Type'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object TypeComboBox: TComboBox
        Left = 8
        Top = 24
        Width = 133
        Height = 21
        TabOrder = 0
        Text = 'Show All'
        OnChange = cmbbxContStatusChange
      end
    end
    object Panel3: TPanel
      Left = 296
      Top = 8
      Width = 147
      Height = 57
      ParentBackground = False
      TabOrder = 5
      object Label7: TLabel
        Left = 8
        Top = 8
        Width = 19
        Height = 14
        Caption = 'Rep'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RepComboBox: TComboBox
        Left = 8
        Top = 24
        Width = 133
        Height = 21
        TabOrder = 0
        Text = 'Show All'
        OnChange = RepComboBoxChange
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 863
      Top = 12
      Width = 108
      Height = 97
      Anchors = [akTop, akRight]
      Caption = 'Report Type'
      ItemIndex = 0
      Items.Strings = (
        'Summary'
        'Show Rep'
        'Show Address'
        'Rep && Address')
      ParentBackground = False
      TabOrder = 6
      OnClick = RadioGroup1Click
    end
    object spnedtMarkup: TSpinEdit
      Left = 707
      Top = 83
      Width = 41
      Height = 22
      Anchors = [akTop, akRight]
      MaxValue = 500
      MinValue = 0
      TabOrder = 7
      Value = 0
      OnExit = spnedtMarkupExit
    end
    object chkbxCustomers: TCheckBox
      Left = 707
      Top = 16
      Width = 152
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Include inactive Customers'
      TabOrder = 8
      OnClick = cmbbxContStatusChange
    end
    object chkbxContacts: TCheckBox
      Left = 707
      Top = 38
      Width = 144
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Include inactive Contacts'
      TabOrder = 9
      OnClick = cmbbxContStatusChange
    end
    object chkbxShowStatus: TCheckBox
      Left = 707
      Top = 60
      Width = 97
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Show Status'
      TabOrder = 10
    end
    object Panel4: TPanel
      Left = 443
      Top = 8
      Width = 147
      Height = 57
      ParentBackground = False
      TabOrder = 11
      object lblCustomerType: TLabel
        Left = 8
        Top = 8
        Width = 72
        Height = 14
        Caption = 'Customer Type'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object CustTypeComboBox: TComboBox
        Left = 8
        Top = 24
        Width = 133
        Height = 21
        TabOrder = 0
        Text = 'Show All'
        OnChange = RepComboBoxChange
      end
    end
    object cbSort4: TComboBox
      Left = 447
      Top = 84
      Width = 135
      Height = 21
      Style = csDropDownList
      TabOrder = 12
      OnChange = cbSortChange
      Items.Strings = (
        'Contact Status'
        'Contact Type'
        'Rep'
        'Customer Type')
    end
    object Panel5: TPanel
      Left = 590
      Top = 8
      Width = 115
      Height = 57
      ParentBackground = False
      TabOrder = 13
      object Label6: TLabel
        Left = 8
        Top = 8
        Width = 80
        Height = 14
        Caption = 'Customer Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object cmbbxCustStatus: TComboBox
        Left = 8
        Top = 24
        Width = 97
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = 'Show All'
        OnChange = cmbbxCustStatusChange
        Items.Strings = (
          'Show All'
          'Prospect'
          'Lapsed')
      end
    end
  end
  object pnlPrintControl: TPanel
    Left = 0
    Top = 433
    Width = 976
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      976
      41)
    object Panel1: TPanel
      Left = 673
      Top = 1
      Width = 302
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        302
        39)
      object btnPreview: TBitBtn
        Left = 126
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
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
        Left = 214
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
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
      object btnExcel: TBitBtn
        Left = 37
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Excel'
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
        TabOrder = 2
        OnClick = btnExcelClick
      end
    end
    object btnCancel: TBitBtn
      Left = 20
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 474
    Width = 976
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object dbgrdContStatus: TDBGrid
    Left = 0
    Top = 117
    Width = 976
    Height = 316
    Align = alClient
    DataSource = dtsrcCurrentContStatus
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Contact_Name'
        Title.Caption = 'Name'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 268
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Contact_Status_Descr'
        Title.Caption = 'Status'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Phone'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Contact_Level_Description'
        Title.Caption = 'Contact Level'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Contact_Type_Description'
        Title.Caption = 'Contact Type'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Email'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Def_Markup_Perc'
        Title.Caption = 'Markup %'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rep_Name'
        Title.Caption = 'Rep'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Account_Manager_Name'
        Title.Caption = 'Account Manager'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Type_Description'
        Title.Caption = 'Customer Type'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Title.Caption = 'Inactive'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Status_Descr'
        Title.Caption = 'Customer Status'
        Width = 121
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
    TabOrder = 4
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 268
    Top = 252
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 5
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 59
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
  object qryCurrentContStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Contact.Name AS Contact_Name,'
      '        Customer_Contact.Salutation,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone AS Contact_Phone,'
      '        Customer_Contact.Mobile_No,'
      '        Customer_Contact.Fax_Number AS Contact_Fax,'
      '        Customer_Contact.Contact_Type,'
      '        Customer_Contact.Contact_Level,'
      '        Customer_Contact.Contact_Status,'
      '        Contact_Level.Description as Contact_Level_Description,'
      '        Contact_Status.Contact_Status_Descr,'
      '        Contact_Type.Description as Contact_Type_Description,'
      '        Customer_Branch.Building_No_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.Phone AS Customer_Phone,'
      '        Customer_Branch.Fax_Number AS Customer_Fax,'
      '        Customer.Name AS Customer_Name,'
      '        (SELECT top 1 Rep.Name'
      
        '          FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Br' +
        'anches.Rep'
      
        #9'        WHERE (Reps_Branches.Customer = Customer_Branch.Custome' +
        'r AND'
      
        '                Reps_Branches.Branch_no = Customer_Branch.Branch' +
        '_No) AND'
      
        '                ((Reps_Branches.Is_Main_Rep is NULL) or (Reps_Br' +
        'anches.Is_Main_Rep = '#39'Y'#39'))'
      '          ORDER BY Reps_Branches.Is_Main_Rep DESC) as Rep_Name,'
      '        (SELECT top 1 Sub_Rep.Name'
      
        '          FROM Rep as Sub_Rep INNER JOIN Reps_Branches ON Sub_Re' +
        'p.Rep = Reps_Branches.Rep'
      
        #9'        WHERE (Reps_Branches.Customer = Customer_Branch.Custome' +
        'r AND'
      
        '                Reps_Branches.Branch_no = Customer_Branch.Branch' +
        '_No) AND'
      
        '                ((Reps_Branches.Is_Main_Rep is NULL) or (Reps_Br' +
        'anches.Is_Main_Rep = '#39'N'#39'))'
      
        '          ORDER BY Reps_Branches.Is_Main_Rep DESC) as Sub_Rep_Na' +
        'me,'
      '        (SELECT top 1 Operator.Name'
      
        #9'        FROM Operator INNER JOIN Customer_Operator ON Operator.' +
        'Operator = Customer_Operator.Operator'
      
        #9'        WHERE Customer_Operator.Customer = Customer_Branch.Cust' +
        'omer'
      
        '          ORDER BY Customer_Operator.Is_main_Operator DESC) as A' +
        'ccount_Manager_Name,'
      '        Customer_Contact.Customer,'
      '        Customer_Contact.Branch_no,'
      '        Customer_Contact.Def_Markup_Perc,'
      '        Customer_Contact.inactive,'
      #9'(select top 1 Invoice_Date'
      #9' from Sales_Invoice'
      
        #9' where '#9'sales_Invoice.Inv_to_Customer = Customer_Branch.Inv_to_' +
        'Customer and'
      
        #9#9'sales_invoice.inv_to_branch = Customer_branch.inv_to_branch an' +
        'd'
      #9#9'sales_invoice.invoice_or_credit = '#39'I'#39
      #9' order by Invoice_date desc) as Date_Last_Invoiced,'
      #9'(select top 1 Goods_Value'
      #9' from Sales_Invoice'
      
        #9' where '#9'sales_Invoice.Inv_to_Customer = Customer_Branch.Inv_to_' +
        'Customer and'
      
        #9#9'sales_invoice.inv_to_branch = Customer_branch.inv_to_branch an' +
        'd'
      #9#9'sales_invoice.invoice_or_credit = '#39'I'#39
      #9' order by Invoice_date desc) as Last_Invoice_Value,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year1),0) as Customer_Sales_1,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year2),0) as Customer_Sales_2,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year3),0) as Customer_Sales_3,'
      '    Customer.Customer_Status,'
      '    Customer_Status.Customer_Status_Descr'
      'FROM Customer_Status'
      '      RIGHT JOIN ((Customer'
      '      INNER JOIN Customer_Branch'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN (Contact_Type'
      '      INNER JOIN (Contact_Status'
      '      RIGHT JOIN (Contact_Level'
      '      RIGHT JOIN Customer_Contact'
      
        '        ON Contact_Level.Contact_Level = Customer_Contact.Contac' +
        't_Level)'
      
        '        ON Contact_Status.Contact_Status = Customer_Contact.Cont' +
        'act_Status)'
      
        '        ON Contact_Type.Contact_Type = Customer_Contact.Contact_' +
        'Type)'
      
        '        ON (Customer_Branch.Branch_no = Customer_Contact.Branch_' +
        'no) AND (Customer_Branch.Customer = Customer_Contact.Customer))'
      
        '        ON Customer_Status.Customer_Status = Customer.Customer_S' +
        'tatus'
      '')
    Left = 112
    Top = 160
    ParamData = <
      item
        Name = 'Year1'
      end
      item
        Name = 'Year2'
      end
      item
        Name = 'Year3'
      end>
    object qryCurrentContStatusContact_Name: TStringField
      FieldName = 'Contact_Name'
      FixedChar = True
      Size = 80
    end
    object qryCurrentContStatusEmail: TStringField
      FieldName = 'Email'
      FixedChar = True
      Size = 200
    end
    object qryCurrentContStatusContact_Phone: TStringField
      FieldName = 'Contact_Phone'
      FixedChar = True
      Size = 40
    end
    object qryCurrentContStatusMobile_No: TStringField
      FieldName = 'Mobile_No'
      FixedChar = True
      Size = 30
    end
    object qryCurrentContStatusContact_Fax: TStringField
      FieldName = 'Contact_Fax'
      FixedChar = True
      Size = 40
    end
    object qryCurrentContStatusContact_Type: TIntegerField
      FieldName = 'Contact_Type'
    end
    object qryCurrentContStatusContact_Level: TIntegerField
      FieldName = 'Contact_Level'
    end
    object qryCurrentContStatusContact_Status: TIntegerField
      FieldName = 'Contact_Status'
    end
    object qryCurrentContStatusContact_Status_Descr: TStringField
      FieldName = 'Contact_Status_Descr'
      FixedChar = True
      Size = 40
    end
    object qryCurrentContStatusBuilding_No_name: TStringField
      FieldName = 'Building_No_name'
      FixedChar = True
      Size = 80
    end
    object qryCurrentContStatusStreet: TStringField
      FieldName = 'Street'
      FixedChar = True
      Size = 80
    end
    object qryCurrentContStatusLocale: TStringField
      FieldName = 'Locale'
      FixedChar = True
      Size = 80
    end
    object qryCurrentContStatusTown: TStringField
      FieldName = 'Town'
      FixedChar = True
      Size = 80
    end
    object qryCurrentContStatusPostcode: TStringField
      FieldName = 'Postcode'
      FixedChar = True
    end
    object qryCurrentContStatusCustomer_Phone: TStringField
      FieldName = 'Customer_Phone'
      FixedChar = True
      Size = 40
    end
    object qryCurrentContStatusCustomer_Fax: TStringField
      FieldName = 'Customer_Fax'
      FixedChar = True
      Size = 40
    end
    object qryCurrentContStatusCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryCurrentContStatusRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qryCurrentContStatusCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryCurrentContStatusBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryCurrentContStatusDef_Markup_Perc: TFloatField
      FieldName = 'Def_Markup_Perc'
    end
    object qryCurrentContStatusAcc_Active: TStringField
      FieldName = 'inactive'
      FixedChar = True
      Size = 2
    end
    object qryCurrentContStatusPhone: TStringField
      FieldKind = fkCalculated
      FieldName = 'Phone'
      OnGetText = qryCurrentContStatusPhoneGetText
      Size = 30
      Calculated = True
    end
    object qryCurrentContStatusContact_Level_Description: TStringField
      FieldName = 'Contact_Level_Description'
      FixedChar = True
      Size = 100
    end
    object qryCurrentContStatusContact_Type_Description: TStringField
      FieldName = 'Contact_Type_Description'
      FixedChar = True
      Size = 80
    end
    object qryCurrentContStatusSalutation: TStringField
      FieldName = 'Salutation'
      FixedChar = True
      Size = 40
    end
    object qryCurrentContStatusCustomer_Type_Description: TStringField
      FieldName = 'Customer_Type_Description'
    end
    object qryCurrentContStatusAccount_Manager_Name: TStringField
      FieldName = 'Account_Manager_Name'
      Size = 50
    end
    object qryCurrentContStatusCustomer_Status_Descr: TStringField
      FieldName = 'Customer_Status_Descr'
      Size = 30
    end
    object qryCurrentContStatusSub_Rep_Name: TStringField
      FieldName = 'Sub_Rep_Name'
      Size = 50
    end
  end
  object dtsrcCurrentContStatus: TDataSource
    DataSet = qryCurrentContStatus
    Left = 144
    Top = 248
  end
  object qryContStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Contact_Status, Contact_status.Contact_Status_descr'
      'from Contact_status'
      'where Contact_status > 5'
      'order By Contact_Status '
      ' '
      ' '
      ' ')
    Left = 72
    Top = 12
    object qryContStatusContact_Status_descr: TStringField
      FieldName = 'Contact_Status_descr'
      FixedChar = True
      Size = 40
    end
  end
  object QryContType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Contact_Type'
      'order by Description')
    Left = 218
    Top = 12
    object QryContTypeDescription: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
  end
  object QryRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Rep, Name'
      'from Rep'
      'Order by Name')
    Left = 370
    Top = 12
    object QryRepName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
  end
  object qryExcel: TFDQuery
    ConnectionName = 'pb'
    Left = 664
    Top = 200
  end
  object stdSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT '#9'Customer_Contact.Name AS Contact_Name,'
      #9'Customer_Contact.Salutation,'
      #9'Customer_Contact.Email,'
      #9'Customer_Contact.Phone AS Contact_Phone,'
      #9'Customer_Contact.Mobile_No,'
      #9'Customer_Contact.Fax_Number AS Contact_Fax,'
      #9'Customer_Contact.Contact_Type,'
      #9'Customer_Contact.Contact_Level,'
      #9'Customer_Contact.Contact_Status,'
      #9'Contact_Level.Description AS Contact_Level_Description,'
      #9'Contact_Status.Contact_Status_Descr,'
      #9'Contact_Type.Description AS Contact_Type_Description,'
      #9'Customer_Branch.Building_No_name,'
      #9'Customer_Branch.Street,'
      #9'Customer_Branch.Locale,'
      #9'Customer_Branch.Town,'
      #9'Customer_Branch.Postcode,'
      #9'Customer_Branch.Phone AS Customer_Phone,'
      #9'Customer_Branch.Fax_Number AS Customer_Fax,'
      #9'Customer.Name AS Customer_Name,'
      #9'Customer_Contact.Customer,'
      #9'Customer_Contact.Branch_no,'
      #9'Customer_Contact.Def_Markup_perc,'
      '  customer_contact.inactive,'
      '  (SELECT top 1 Rep.Name'
      
        '   FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.' +
        'Rep'
      #9' WHERE (Reps_Branches.Customer = Customer_Branch.Customer AND'
      
        '                Reps_Branches.Branch_no = Customer_Branch.Branch' +
        '_No) AND'
      
        '                ((Reps_Branches.Is_Main_Rep is NULL) or (Reps_Br' +
        'anches.Is_Main_Rep = '#39'Y'#39'))'
      '   ORDER BY Reps_Branches.Is_Main_Rep DESC) as Rep_Name,'
      '  (SELECT top 1 Rep.Name'
      
        '   FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.' +
        'Rep'
      #9' WHERE (Reps_Branches.Customer = Customer_Branch.Customer AND'
      
        '         Reps_Branches.Branch_no = Customer_Branch.Branch_No) AN' +
        'D'
      
        '        ((Reps_Branches.Is_Main_Rep is NULL) or (Reps_Branches.I' +
        's_Main_Rep = '#39'N'#39'))'
      '   ORDER BY Reps_Branches.Is_Main_Rep DESC) as Sub_Rep_Name,'
      '  (SELECT top 1 Operator.Name'
      '      FROM Operator'
      
        '        INNER JOIN Customer_Operator ON Operator.Operator = Cust' +
        'omer_Operator.Operator'
      
        '      WHERE Customer_Operator.Customer = Customer_Branch.Custome' +
        'r'
      
        '      ORDER BY Customer_Operator.Is_main_Operator DESC) as Accou' +
        'nt_Manager_Name,'
      #9'Customer_Type.Description as Customer_Type_Description,'
      #9'(select top 1 Invoice_Date'
      #9' from Sales_Invoice'
      
        #9' where '#9'sales_Invoice.Inv_to_Customer = Customer_Branch.Inv_to_' +
        'Customer and'
      
        #9#9'sales_invoice.inv_to_branch = Customer_branch.inv_to_branch an' +
        'd'
      #9#9'sales_invoice.invoice_or_credit = '#39'I'#39
      #9' order by Invoice_date desc) as Date_Last_Invoiced,'
      #9'(select top 1 Goods_Value'
      #9' from Sales_Invoice'
      
        #9' where '#9'sales_Invoice.Inv_to_Customer = Customer_Branch.Inv_to_' +
        'Customer and'
      
        #9#9'sales_invoice.inv_to_branch = Customer_branch.inv_to_branch an' +
        'd'
      #9#9'sales_invoice.invoice_or_credit = '#39'I'#39
      #9' order by Invoice_date desc) as Last_Invoice_Value,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year1),0) as Customer_Sales_1,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year2),0) as Customer_Sales_2,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year3),0) as Customer_Sales_3,'
      '    Customer.Customer_Status,'
      '    Customer_Status.Customer_Status_Descr'
      'FROM Customer_Status'
      '      INNER JOIN (((Customer_Type'
      '      INNER JOIN Customer'
      '        ON Customer_Type.Customer_Type = Customer.Customer_Type)'
      '      INNER JOIN Customer_Branch'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN (Contact_Type'
      '      INNER JOIN (Contact_Status'
      '      RIGHT JOIN (Contact_Level'
      '      RIGHT JOIN Customer_Contact'
      
        '        ON Contact_Level.Contact_Level = Customer_Contact.Contac' +
        't_Level)'
      
        '        ON Contact_Status.Contact_Status = Customer_Contact.Cont' +
        'act_Status)'
      
        '        ON Contact_Type.Contact_Type = Customer_Contact.Contact_' +
        'Type)'
      
        '        ON (Customer_Branch.Branch_no = Customer_Contact.Branch_' +
        'no) AND (Customer_Branch.Customer = Customer_Contact.Customer))'
      
        '        ON Customer_Status.Customer_Status = Customer.Customer_S' +
        'tatus'
      '')
    Left = 48
    Top = 320
    ParamData = <
      item
        Name = 'Year1'
      end
      item
        Name = 'Year2'
      end
      item
        Name = 'Year3'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Financial_Year, Period'
      'from Company'
      'where Company = 1')
    Left = 368
    Top = 176
  end
  object qryGetFY: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Financial_Year'
      'where Financial_Year = :Financial_Year')
    Left = 368
    Top = 232
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object qryCustType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer_Type, Description'
      'from Customer_Type'
      'Order by Description')
    Left = 522
    Top = 36
    object qryCustTypeDescription: TStringField
      FieldName = 'Description'
    end
  end
  object OldStdSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT '#9'Customer_Contact.Name AS Contact_Name,'
      #9'Customer_Contact.Salutation,'
      #9'Customer_Contact.Email,'
      #9'Customer_Contact.Phone AS Contact_Phone,'
      #9'Customer_Contact.Mobile_No,'
      #9'Customer_Contact.Fax_Number AS Contact_Fax,'
      #9'Customer_Contact.Contact_Type,'
      #9'Customer_Contact.Contact_Level,'
      #9'Customer_Contact.Contact_Status,'
      #9'Contact_Level.Description AS Contact_Level_Description,'
      #9'Contact_Status.Contact_Status_Descr,'
      #9'Contact_Type.Description AS Contact_Type_Description,'
      #9'Customer_Branch.Building_No_name,'
      #9'Customer_Branch.Street,'
      #9'Customer_Branch.Locale,'
      #9'Customer_Branch.Town,'
      #9'Customer_Branch.Postcode,'
      #9'Customer_Branch.Phone AS Customer_Phone,'
      #9'Customer_Branch.Fax_Number AS Customer_Fax,'
      #9'Customer.Name AS Customer_Name,'
      #9'Customer_Contact.Customer,'
      #9'Customer_Contact.Branch_no,'
      #9'Customer_Contact.Def_Markup_perc,'
      '  customer_contact.inactive,'
      #9'(select top 1 Rep.Name'
      #9'from reps_branches, Rep'
      #9'where reps_branches.customer = customer_contact.customer and'
      #9'      reps_branches.branch_no = customer_contact.branch_no and'
      #9'      reps_branches.rep = Rep.rep) as rep_Name,'
      '  (SELECT top 1 Operator.Name'
      '      FROM Operator'
      
        '        INNER JOIN Customer_Operator ON Operator.Operator = Cust' +
        'omer_Operator.Operator'
      
        '      WHERE Customer_Operator.Customer = Customer_Branch.Custome' +
        'r'
      
        '      ORDER BY Customer_Operator.Is_main_Operator DESC) as Accou' +
        'nt_Manager_Name,'
      #9'Customer_Type.Description as Customer_Type_Description,'
      #9'(select top 1 Invoice_Date'
      #9' from Sales_Invoice'
      
        #9' where '#9'sales_Invoice.Inv_to_Customer = Customer_Branch.Inv_to_' +
        'Customer and'
      
        #9#9'sales_invoice.inv_to_branch = Customer_branch.inv_to_branch an' +
        'd'
      #9#9'sales_invoice.invoice_or_credit = '#39'I'#39
      #9' order by Invoice_date desc) as Date_Last_Invoiced,'
      #9'(select top 1 Goods_Value'
      #9' from Sales_Invoice'
      
        #9' where '#9'sales_Invoice.Inv_to_Customer = Customer_Branch.Inv_to_' +
        'Customer and'
      
        #9#9'sales_invoice.inv_to_branch = Customer_branch.inv_to_branch an' +
        'd'
      #9#9'sales_invoice.invoice_or_credit = '#39'I'#39
      #9' order by Invoice_date desc) as Last_Invoice_Value,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year1),0) as Customer_Sales_1,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year2),0) as Customer_Sales_2,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year3),0) as Customer_Sales_3'
      'FROM Customer_Type '
      #9'INNER JOIN ((Customer '
      #9'INNER JOIN Customer_Branch '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9'INNER JOIN (Contact_Type '
      #9'INNER JOIN (Contact_Status '
      #9'RIGHT JOIN (Contact_Level '
      #9'RIGHT JOIN Customer_Contact '
      
        #9#9'ON Contact_Level.Contact_Level = Customer_Contact.Contact_Leve' +
        'l) '
      
        #9#9'ON Contact_Status.Contact_Status = Customer_Contact.Contact_St' +
        'atus) '
      #9#9'ON Contact_Type.Contact_Type = Customer_Contact.Contact_Type) '
      
        #9#9'ON (Customer_Branch.Branch_no = Customer_Contact.Branch_no) AN' +
        'D (Customer_Branch.Customer = Customer_Contact.Customer)) '
      #9#9'ON Customer_Type.Customer_Type = Customer.Customer_Type'
      '')
    Left = 104
    Top = 320
    ParamData = <
      item
        Name = 'Year1'
      end
      item
        Name = 'Year2'
      end
      item
        Name = 'Year3'
      end>
  end
  object oldqryCurrentContStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Contact.Name AS Contact_Name,'
      '        Customer_Contact.Salutation,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone AS Contact_Phone,'
      '        Customer_Contact.Mobile_No,'
      '        Customer_Contact.Fax_Number AS Contact_Fax,'
      '        Customer_Contact.Contact_Type,'
      '        Customer_Contact.Contact_Level,'
      '        Customer_Contact.Contact_Status,'
      '        Contact_Level.Description as Contact_Level_Description,'
      '        Contact_Status.Contact_Status_Descr,'
      '        Contact_Type.Description as Contact_Type_Description,'
      '        Customer_Branch.Building_No_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.Phone AS Customer_Phone,'
      '        Customer_Branch.Fax_Number AS Customer_Fax,'
      '        Customer.Name AS Customer_Name,'
      '        Rep.Name as Rep_Name,'
      '        (SELECT top 1 Operator.Name'
      
        #9'        FROM Operator INNER JOIN Customer_Operator ON Operator.' +
        'Operator = Customer_Operator.Operator'
      
        #9'        WHERE Customer_Operator.Customer = Customer_Branch.Cust' +
        'omer'
      
        '          ORDER BY Customer_Operator.Is_main_Operator DESC) as A' +
        'ccount_Manager_Name,'
      '        Customer_Contact.Customer,'
      '        Customer_Contact.Branch_no,'
      '        Customer_Contact.Def_Markup_Perc,'
      '        Customer_Contact.inactive,'
      #9'(select top 1 Invoice_Date'
      #9' from Sales_Invoice'
      
        #9' where '#9'sales_Invoice.Inv_to_Customer = Customer_Branch.Inv_to_' +
        'Customer and'
      
        #9#9'sales_invoice.inv_to_branch = Customer_branch.inv_to_branch an' +
        'd'
      #9#9'sales_invoice.invoice_or_credit = '#39'I'#39
      #9' order by Invoice_date desc) as Date_Last_Invoiced,'
      #9'(select top 1 Goods_Value'
      #9' from Sales_Invoice'
      
        #9' where '#9'sales_Invoice.Inv_to_Customer = Customer_Branch.Inv_to_' +
        'Customer and'
      
        #9#9'sales_invoice.inv_to_branch = Customer_branch.inv_to_branch an' +
        'd'
      #9#9'sales_invoice.invoice_or_credit = '#39'I'#39
      #9' order by Invoice_date desc) as Last_Invoice_Value,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year1),0) as Customer_Sales_1,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year2),0) as Customer_Sales_2,'
      #9' ISNULL((select sum(Total_Sales_value)'
      #9'  from sales_profit, period'
      #9'  where sales_profit.period = period.period and'
      #9#9'sales_profit.customer = Customer.Customer and'
      #9#9'period.financial_year = :Year3),0) as Customer_Sales_3,'
      '    Customer.Customer_Status,'
      '    Customer_Status.Customer_Status_Descr'
      'FROM Customer_Status'
      '      INNER JOIN ((Rep'
      '      RIGHT JOIN ((Customer'
      '      INNER JOIN Customer_Branch'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      '      LEFT JOIN Reps_Branches'
      
        '        ON (Customer_Branch.Branch_no = Reps_Branches.Branch_no)' +
        ' AND (Customer_Branch.Customer = Reps_Branches.Customer))'
      '        ON Rep.Rep = Reps_Branches.Rep)'
      '      INNER JOIN (Contact_Type'
      '      INNER JOIN (Contact_Status'
      '      RIGHT JOIN (Contact_Level'
      '      RIGHT JOIN Customer_Contact'
      
        '        ON Contact_Level.Contact_Level = Customer_Contact.Contac' +
        't_Level)'
      
        '        ON Contact_Status.Contact_Status = Customer_Contact.Cont' +
        'act_Status)'
      
        '        ON Contact_Type.Contact_Type = Customer_Contact.Contact_' +
        'Type)'
      
        '        ON (Customer_Branch.Branch_no = Customer_Contact.Branch_' +
        'no) AND (Customer_Branch.Customer = Customer_Contact.Customer))'
      
        '        ON Customer_Status.Customer_Status = Customer.Customer_S' +
        'tatus'
      '')
    Left = 232
    Top = 160
    ParamData = <
      item
        Name = 'Year1'
      end
      item
        Name = 'Year2'
      end
      item
        Name = 'Year3'
      end>
    object StringField1: TStringField
      FieldName = 'Contact_Name'
      FixedChar = True
      Size = 80
    end
    object StringField2: TStringField
      FieldName = 'Email'
      FixedChar = True
      Size = 200
    end
    object StringField3: TStringField
      FieldName = 'Contact_Phone'
      FixedChar = True
      Size = 40
    end
    object StringField4: TStringField
      FieldName = 'Mobile_No'
      FixedChar = True
      Size = 30
    end
    object StringField5: TStringField
      FieldName = 'Contact_Fax'
      FixedChar = True
      Size = 40
    end
    object IntegerField1: TIntegerField
      FieldName = 'Contact_Type'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Contact_Level'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Contact_Status'
    end
    object StringField6: TStringField
      FieldName = 'Contact_Status_Descr'
      FixedChar = True
      Size = 40
    end
    object StringField7: TStringField
      FieldName = 'Building_No_name'
      FixedChar = True
      Size = 80
    end
    object StringField8: TStringField
      FieldName = 'Street'
      FixedChar = True
      Size = 80
    end
    object StringField9: TStringField
      FieldName = 'Locale'
      FixedChar = True
      Size = 80
    end
    object StringField10: TStringField
      FieldName = 'Town'
      FixedChar = True
      Size = 80
    end
    object StringField11: TStringField
      FieldName = 'Postcode'
      FixedChar = True
    end
    object StringField12: TStringField
      FieldName = 'Customer_Phone'
      FixedChar = True
      Size = 40
    end
    object StringField13: TStringField
      FieldName = 'Customer_Fax'
      FixedChar = True
      Size = 40
    end
    object StringField14: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object StringField15: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object IntegerField4: TIntegerField
      FieldName = 'Customer'
    end
    object IntegerField5: TIntegerField
      FieldName = 'Branch_no'
    end
    object FloatField1: TFloatField
      FieldName = 'Def_Markup_Perc'
    end
    object StringField16: TStringField
      FieldName = 'inactive'
      FixedChar = True
      Size = 2
    end
    object StringField17: TStringField
      FieldKind = fkCalculated
      FieldName = 'Phone'
      OnGetText = qryCurrentContStatusPhoneGetText
      Size = 30
      Calculated = True
    end
    object StringField18: TStringField
      FieldName = 'Contact_Level_Description'
      FixedChar = True
      Size = 100
    end
    object StringField19: TStringField
      FieldName = 'Contact_Type_Description'
      FixedChar = True
      Size = 80
    end
    object StringField20: TStringField
      FieldName = 'Salutation'
      FixedChar = True
      Size = 40
    end
    object StringField21: TStringField
      FieldName = 'Customer_Type_Description'
    end
    object StringField22: TStringField
      FieldName = 'Account_Manager_Name'
      Size = 50
    end
    object StringField23: TStringField
      FieldName = 'Customer_Status_Descr'
      Size = 30
    end
  end
end
