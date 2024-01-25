object PBRSSuppContDetFrm: TPBRSSuppContDetFrm
  Left = 49
  Top = 122
  Caption = 'Supplier Contact Details'
  ClientHeight = 493
  ClientWidth = 751
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
  OnShow = FormShow
  TextHeight = 13
  object pnlControls: TPanel
    Left = 0
    Top = 0
    Width = 751
    Height = 81
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      751
      81)
    object Panel2: TPanel
      Left = 9
      Top = 11
      Width = 147
      Height = 58
      ParentBackground = False
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 23
        Height = 14
        Caption = 'Type'
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
    object RadioGroup1: TRadioGroup
      Left = 622
      Top = 7
      Width = 120
      Height = 63
      Anchors = [akTop, akRight]
      Caption = 'Report Type'
      ItemIndex = 0
      Items.Strings = (
        'Summary'
        'Detailed')
      ParentBackground = False
      TabOrder = 1
    end
    object chkbxSuppliers: TCheckBox
      Left = 448
      Top = 16
      Width = 169
      Height = 17
      Caption = 'Include inactive Suppliers'
      TabOrder = 2
      OnClick = cmbbxContStatusChange
    end
    object chkbxContacts: TCheckBox
      Left = 448
      Top = 38
      Width = 169
      Height = 17
      Caption = 'Include inactive Contacts'
      TabOrder = 3
      OnClick = cmbbxContStatusChange
    end
  end
  object pnlPrintControl: TPanel
    Left = 0
    Top = 433
    Width = 751
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      751
      41)
    object Panel1: TPanel
      Left = 448
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
      Left = 7
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
    Width = 751
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
    Top = 81
    Width = 751
    Height = 352
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
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 268
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
        FieldName = 'inactive'
        Title.Caption = 'Inactive'
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
      'SELECT '#9'Supplier_BranchContacts.Name AS Contact_Name,'
      #9'Supplier_BranchContacts.Salutation,'
      #9'Supplier_BranchContacts.Email,'
      #9'Supplier_BranchContacts.Phone AS Contact_Phone,'
      #9'Supplier_BranchContacts.Mobile_No,'
      #9'Supplier_BranchContacts.Fax_Number AS Contact_Fax,'
      #9'Supplier_BranchContacts.Contact_Type,'
      #9'Contact_Type.Description AS Contact_Type_Description,'
      #9'Supplier_Branch.Building_No_name,'
      #9'Supplier_Branch.Street,'
      #9'Supplier_Branch.Locale,'
      #9'Supplier_Branch.Town,'
      #9'Supplier_Branch.Postcode,'
      #9'Supplier_Branch.Phone AS Supplier_Phone,'
      #9'Supplier_Branch.Fax_Number AS Supplier_Fax,'
      #9'Supplier.Name AS Supplier_Name,'
      #9'Supplier_BranchContacts.Supplier,'
      #9'Supplier_BranchContacts.Branch_no,'
      '  Supplier_BranchContacts.inactive,'
      'FROM Contact_Type'
      '  INNER JOIN (Supplier'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN Supplier_BranchContacts'
      
        '    ON (Supplier_Branch.Branch_no = Supplier_BranchContacts.Bran' +
        'ch_no)'
      
        '    AND (Supplier_Branch.Supplier = Supplier_BranchContacts.Supp' +
        'lier))'
      '    ON Supplier.Supplier = Supplier_Branch.Supplier)'
      
        '    ON Contact_Type.Contact_Type = Supplier_BranchContacts.Conta' +
        'ct_Type ')
    Left = 160
    Top = 120
    object qryCurrentContStatusContact_Phone: TStringField
      FieldName = 'Contact_Phone'
      Size = 30
    end
    object qryCurrentContStatusSupplier_Phone: TStringField
      FieldName = 'Supplier_Phone'
      Size = 30
    end
    object qryCurrentContStatusContact_Name: TStringField
      FieldName = 'Contact_Name'
      Size = 50
    end
    object qryCurrentContStatusSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      Size = 50
    end
    object qryCurrentContStatusEmail: TStringField
      FieldName = 'Email'
      Size = 150
    end
    object qryCurrentContStatusContact_Type_Description: TStringField
      FieldName = 'Contact_Type_Description'
      Size = 50
    end
    object qryCurrentContStatusinactive: TStringField
      FieldName = 'inactive'
      Size = 1
    end
    object qryCurrentContStatusPhone: TStringField
      FieldKind = fkCalculated
      FieldName = 'Phone'
      OnGetText = qryCurrentContStatusPhoneGetText
      Size = 50
      Calculated = True
    end
  end
  object dtsrcCurrentContStatus: TDataSource
    DataSet = qryCurrentContStatus
    Left = 272
    Top = 120
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
  object qryExcel: TFDQuery
    ConnectionName = 'pb'
    Left = 648
    Top = 128
  end
  object stdSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT '#9'Supplier_BranchContacts.Name AS Contact_Name,'
      #9'Supplier_BranchContacts.Salutation,'
      #9'Supplier_BranchContacts.Email,'
      #9'Supplier_BranchContacts.Phone AS Contact_Phone,'
      #9'Supplier_BranchContacts.Mobile_No,'
      #9'Supplier_BranchContacts.Fax_Number AS Contact_Fax,'
      #9'Supplier_BranchContacts.Contact_Type,'
      #9'Contact_Type.Description AS Contact_Type_Description,'
      #9'Supplier_Branch.Building_No_name,'
      #9'Supplier_Branch.Street,'
      #9'Supplier_Branch.Locale,'
      #9'Supplier_Branch.Town,'
      #9'Supplier_Branch.Postcode,'
      #9'Supplier_Branch.Phone AS Supplier_Phone,'
      #9'Supplier_Branch.Fax_Number AS Supplier_Fax,'
      #9'Supplier.Name AS Supplier_Name,'
      #9'Supplier_BranchContacts.Supplier,'
      #9'Supplier_BranchContacts.Branch_no,'
      '  Supplier_BranchContacts.inactive'
      'FROM Contact_Type'
      '  INNER JOIN (Supplier'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN Supplier_BranchContacts'
      
        '    ON (Supplier_Branch.Branch_no = Supplier_BranchContacts.Bran' +
        'ch_no)'
      
        '    AND (Supplier_Branch.Supplier = Supplier_BranchContacts.Supp' +
        'lier))'
      '    ON Supplier.Supplier = Supplier_Branch.Supplier)'
      
        '    ON Contact_Type.Contact_Type = Supplier_BranchContacts.Conta' +
        'ct_Type'
      ''
      '')
    Left = 48
    Top = 120
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Financial_Year, Period'
      'from Company'
      'where Company = 1')
    Left = 384
    Top = 120
  end
end
