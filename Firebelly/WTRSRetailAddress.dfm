object frmWTRSRetailAddress: TfrmWTRSRetailAddress
  Left = 236
  Top = 99
  Caption = 'Retail Address List'
  ClientHeight = 493
  ClientWidth = 1022
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object pnlControls: TPanel
    Left = 0
    Top = 0
    Width = 1022
    Height = 65
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object Label7: TLabel
      Left = 264
      Top = 10
      Width = 73
      Height = 13
      Caption = 'Ordered Since'
    end
    object chkbxShowOnlyMailing: TCheckBox
      Left = 15
      Top = 34
      Width = 137
      Height = 17
      Caption = 'Show Only Mailing List'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chkbxShowOnlyMailingClick
    end
    object chkbxShowOnlyOrdered: TCheckBox
      Left = 15
      Top = 8
      Width = 226
      Height = 17
      Caption = 'Show Only Ordered Customers'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = chkbxShowOnlyOrderedClick
    end
    object edtDateFrom: TEdit
      Left = 344
      Top = 8
      Width = 100
      Height = 21
      TabOrder = 2
      OnExit = edtDateFromExit
      OnKeyPress = edtDateFromKeyPress
    end
    object btnDatefrom: TBitBtn
      Left = 456
      Top = 6
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
      TabOrder = 3
      OnClick = btnDatefromClick
    end
    object btnClearDate: TBitBtn
      Left = 493
      Top = 6
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      TabOrder = 4
      OnClick = btnClearDateClick
    end
  end
  object pnlPrintControl: TPanel
    Left = 0
    Top = 433
    Width = 1022
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    object Panel1: TPanel
      Left = 719
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
      object btnCancel: TBitBtn
        Left = 213
        Top = 9
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 0
      end
    end
    object btnExcel: TBitBtn
      Left = 13
      Top = 8
      Width = 75
      Height = 25
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
      TabOrder = 1
      OnClick = btnExcelClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 474
    Width = 1022
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
    Top = 65
    Width = 1022
    Height = 323
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
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Address_Name'
        Title.Caption = 'Customer'
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Street'
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Locale'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Town_City'
        Title.Caption = 'Town'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Postcode'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'County_State'
        Title.Caption = 'County'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telephone_Number'
        Title.Caption = 'Telephone'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Email_address'
        Title.Caption = 'Email'
        Width = 256
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mailing'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Created'
        Title.Caption = 'Date Created'
        Width = 79
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
  object pnlSearch: TPanel
    Left = 0
    Top = 388
    Width = 1022
    Height = 45
    Align = alBottom
    ParentBackground = False
    TabOrder = 6
    DesignSize = (
      1022
      45)
    object Label1: TLabel
      Left = 16
      Top = 18
      Width = 29
      Height = 13
      Caption = 'Name'
    end
    object Label3: TLabel
      Left = 160
      Top = 18
      Width = 30
      Height = 13
      Caption = 'Street'
    end
    object Label5: TLabel
      Left = 312
      Top = 18
      Width = 32
      Height = 13
      Caption = 'Locale'
    end
    object Label6: TLabel
      Left = 448
      Top = 18
      Width = 28
      Height = 13
      Caption = 'Town'
    end
    object Label2: TLabel
      Left = 592
      Top = 18
      Width = 47
      Height = 13
      Caption = 'Postcode'
    end
    object Label4: TLabel
      Left = 760
      Top = 18
      Width = 37
      Height = 13
      Caption = 'County'
    end
    object edtName: TEdit
      Left = 56
      Top = 14
      Width = 85
      Height = 21
      TabOrder = 0
      OnChange = edtNameChange
    end
    object edtStreet: TEdit
      Left = 200
      Top = 14
      Width = 85
      Height = 21
      TabOrder = 1
      OnChange = edtNameChange
    end
    object edtLocale: TEdit
      Left = 360
      Top = 14
      Width = 73
      Height = 21
      TabOrder = 2
      OnChange = edtNameChange
    end
    object edtTown: TEdit
      Left = 488
      Top = 14
      Width = 85
      Height = 21
      TabOrder = 3
      OnChange = edtNameChange
    end
    object btnClear: TBitBtn
      Left = 939
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cl&ear'
      TabOrder = 4
      OnClick = btnClearClick
    end
    object edtPostcode: TEdit
      Left = 648
      Top = 14
      Width = 85
      Height = 21
      TabOrder = 5
      OnChange = edtNameChange
    end
    object edtCounty: TEdit
      Left = 808
      Top = 14
      Width = 85
      Height = 21
      TabOrder = 6
      OnChange = edtNameChange
    end
  end
  object dtsrcCurrentContStatus: TDataSource
    DataSet = qryCurrentContStatus
    Left = 232
    Top = 160
  end
  object stdSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  DISTINCT'
      '        Address.Address_name,'
      '        Address.Street,'
      '        Address.Locale,'
      '        Address.Town_city,'
      '        Address.Postcode,'
      '        Address.County_State,'
      '        Address.Telephone_number,'
      '        Address.Fax_number,'
      '        Address.Web_Address,'
      '        Address.Email_Address,'
      '        Address.Date_Created,'
      '        Address.Mailing'
      'FROM Address'
      'WHERE (Address.PO_Delivery_Address IS NULL) AND'
      '      (Address.Address_Name <> '#39#39')'
      '')
    Left = 352
    Top = 168
  end
  object qryCurrentContStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT'
      '  Customer_Contact.Contact_Name,'
      #9'Customer_Contact.Title,'
      #9'Customer_Contact.Forename,'
      #9'Customer_Contact.Email_address,'
      #9'Customer_Contact.Telephone_number AS Contact_Phone,'
      #9'Customer_Contact.Mobile_Number,'
      #9'Customer_Contact.Fax_Number AS Contact_Fax,'
      #9'Customer_Contact.Contact_Type,'
      #9'Contact_Type.Contact_Type_Description,'
      #9'Customer.Street,'
      #9'Customer.Locale,'
      #9'Customer.Town_City,'
      #9'Customer.Postcode,'
      #9'Customer.County_State,'
      '  Customer.Telephone_number AS Customer_Phone,'
      #9'Customer.Fax_Number AS Customer_Fax,'
      #9'Customer.Customer_Name,'
      #9'Customer_Contact.Customer,'
      '  customer_contact.inactive,'
      #9'Customer.Rep,'
      '  Rep.Rep_Name,'
      #9'Customer_Type.Description as Customer_Type_Description'
      'FROM (Rep'
      '  RIGHT JOIN (Customer_Type'
      '  INNER JOIN Customer'
      '      ON Customer_Type.Customer_Type = Customer.Customer_type)'
      '      ON Rep.Rep = Customer.Rep)'
      '  INNER JOIN (Contact_Type'
      '  RIGHT JOIN Customer_contact'
      
        '      ON Contact_Type.Contact_Type = Customer_contact.Contact_Ty' +
        'pe)'
      '      ON Customer.Customer = Customer_contact.Customer'
      ' ')
    Left = 112
    Top = 160
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrSearchTimer
    Left = 352
    Top = 112
  end
  object qryOrdered: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      '    Address.Address_name,'
      '    Address.Street,'
      '    Address.Locale,'
      '    Address.Town_city,'
      '    Address.Postcode,'
      '    Address.County_State,'
      '    Address.Telephone_number,'
      '    Address.Fax_number,'
      '    Address.Web_Address,'
      '    Address.Email_Address,'
      '    Address.Date_Created,'
      '    Address.Mailing'
      'FROM Address'
      '        INNER JOIN Sales_Order'
      '          ON Address.Address = Sales_Order.Address'
      'WHERE (Address.PO_Delivery_Address IS NULL) AND'
      '      (Address.Address_Name <> '#39#39') AND'
      '      (Sales_Order.Sales_Order_Status > 55)'
      '')
    Left = 432
    Top = 168
  end
end
